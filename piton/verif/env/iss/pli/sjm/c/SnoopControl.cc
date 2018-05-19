// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: SnoopControl.cc
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
//------------------------------------------------------------------------------
//
// Description:  Snoop controller for SJM.
//
//------------------------------------------------------------------------------

#include "SnoopControl.h"

// Initialize static variables.
unsigned int SnoopControl::snp_max_delay = 100;

//------------------------------------------------------------------------------
// Constructor, with required parameters.
SnoopControl::SnoopControl(char *name, Queue<Transaction> *oq, Queue<Transaction> *wq, Cache *c, ReadOutBuffer *b, byte *live, LinkedList<PlusArg> *arglist)
{
//   initialize(name, q, c, b, live);
  modname = new char[strlen(name)+1];
  strcpy(modname, name);
  liveports = live;

  outq = oq;
  wrbq = wq;
  cache = c;
  orb = b;

  orb->snpctrl = this;

  snp_delay = 0;
  snp_random = 0;

  // Read the plusargs.
  int snpq_size = G_SNOOPQ_DEPTH;
  int inpackq_size = G_PACKQ_DEPTH;
  arglist->GoToHead();
  for (PlusArg *arg = arglist->CurrentNode(); arg || arglist->HasMoreNodes(); arg = arglist->NextNode()) {
    if (!strcmp(arg->name, "snp_delay")) {
      if ((arg->owner >= 0) || ((arg->owner < 0) && !snp_delay)) {      
	snp_delay = arg->value;
	dprintf(name, 0, 0, "Setting the snoop delay to %d", snp_delay);
      }
    } else if (!strcmp(arg->name, "snp_delay_rand")) {
      if (snp_delay) {
	dprintf(modname, 48, 4, "Cannot use sjm_snoop_delay_random with any other memory delay settings.");
//      throw BadSnpCtrlPlusArg();
      } else {
	if (arg->value == 0) {
	  dprintf(modname, 48, 4, "Maximum random delay must be greater than zero.");
	} else if (arg->value > 0) {
	  snp_max_delay = arg->value;
	}
	snp_delay = (((float) rand()) / RAND_MAX) * snp_max_delay;
	snp_random = 1;
	dprintf(name, 0, 0, "Randomizing the snoop delay. Initial delay is %d.", snp_delay);
      }
    } else if (!strcmp(arg->name, "snoopq_size")) {
      if (arg->value > G_SNOOPQ_DEPTH) {
	dprintf(modname, 49, 4, "Requested snoop queue size is greater than the maximum size of %d.", G_SNOOPQ_DEPTH);
	throw BadSnpCtrlPlusArg();
      }
      snpq_size = arg->value;
    } else if (!strcmp(arg->name, "in_jpackq_size")) {
      if (arg->value > G_PACKQ_DEPTH) {
	dprintf(modname, 49, 4, "Requested incoming jpack queue size is greater than the maximum size of %d.", G_PACKQ_DEPTH);
	throw BadSnpCtrlPlusArg();
      }
      inpackq_size = arg->value;
    }
  }

  snoopq = new Queue<Snoop>(snpq_size + G_ADDR_OVERFLOW_LIMIT, Q_FIFO);
  resultsq = new Queue<PackResult>(inpackq_size + G_ADDR_OVERFLOW_LIMIT, Q_FIFO);
  for (int i = 0; i < G_MAXPORTS; i++) {
    in_packq[i] = new Queue<int>(inpackq_size + G_ADDR_OVERFLOW_LIMIT, Q_FIFO);
  }
  out_packq = new Queue<int>(G_PACKOUTQ_DEPTH, Q_FIFO);

  snp_trans = NULL;

  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < G_MAXPORTS; i++) {
      rtl_curr_packs_in[i] = -1;
    }
    rtl_curr_snoop = NULL;
    rtl_curr_presult = NULL;
    rtl_curr_pack_out = -1;
  }

  Reset();
}


//------------------------------------------------------------------------------
// Destructor.
SnoopControl::~SnoopControl()
{
  delete resultsq;
  for (int i = 0; i < G_MAXPORTS; i++) {
    delete in_packq[i];
  }
  delete out_packq;
}


//------------------------------------------------------------------------------
// Reset. Empty the queues. Reset the AOK and DOK states.
void SnoopControl::Reset()
{
  Snoop *snp;
  while (!snoopq->Empty()) {
    snp = snoopq->Pop();
    delete snp;
  }
  PackResult *pres;
  while (!resultsq->Empty()) {
    pres = resultsq->Pop();
    delete pres;
  }
  int *pack;
  while (!out_packq->Empty()) {
    pack = out_packq->Pop();
    delete pack;
  }
  for (int i = 0; i < G_MAXPORTS; i++) {
    while (!in_packq[i]->Empty()) {
      pack = in_packq[i]->Pop();
      delete pack;
    }      
    aok_halt[i] = 0;
    dok_prev[i] = 1;
    dok_next[i] = 1;
  }
  aok_prev = 1;
  aok_next = 1;

  memq_aok_off = 0;
  snpq_aok_off = 0;
  resq_aok_off = 0;
  snp_packs_in = 0;
  snp_delaycnt = 0;
  if (snp_trans) {
    delete snp_trans;
  }
  snp_trans = NULL;
}


//------------------------------------------------------------------------------
// Update the jpack input queues. This method must be called on every cycle.
void SnoopControl::UpdatePacks(int *packs)
{
//   int space_left = -1;
  snp_packs_in = 1;
  int i;
  for (i = 0; i < G_MAXPORTS; i++) {
    // Flow control.
    dok_prev[i] = dok_next[i];

    if (liveports[i]) {
      if (packs[i] == P_AOK_ON) {
	aok_halt[i] = 0;
      } else if (packs[i] == P_AOK_OFF) {
	aok_halt[i] = 1;
      } else if (packs[i] == P_DOK_ON) {
	dok_next[i] = 1;
      } else if (packs[i] == P_DOK_OFF) {
	dok_next[i] = 0;
      } else if (packs[i] > 0) {
	int *p = new int;
	*p = packs[i];
	if (!in_packq[i]->Push(p)) {
	  dprintf(modname, 49, 0, "CODE ERROR: j_pack queue overflow, index %d", i);
	}
      }
      if (in_packq[i]->Empty()) {
	snp_packs_in = 0;
//       } else if (space_left < 0) {
//      space_left = in_packq[i]->SpaceLeft();
//       } else if (snp_packs_in) {
//      if (space_left != in_packq[i]->SpaceLeft()) {
//        snp_packs_in = 0;
//      }
      }
    }
  }

  // Flow control. Take a consensus to see if anyone said aok_off.
  aok_prev = aok_next;
  aok_next = 1;
  for (i = 0; i < G_MAXPORTS; i++) {
    if (aok_halt[i]) {
      aok_next = 0;
      break;
    }
  }
}


//------------------------------------------------------------------------------
// Returns the next jpack, if any.
int SnoopControl::GetNextPack()
{
  int *pack = out_packq->Pop();
  if (!pack) {
    return P_IDLE;
  }
  rtl_curr_pack_out = *pack;
  return *pack;
}


//------------------------------------------------------------------------------
// Queue a new snoop.
void SnoopControl::NewSnoop(ull addr, int source, int orbi, int type, int own, int hold, int snoopable)
{
  PackResult *presult = NULL;

  dprintf(modname, 0, 0, "Queueing snoop to address 0x%llx.", addr);
  if (snoopable) {
    Snoop *snp = new Snoop(addr, source, orbi, type, own);
    if (!snoopq->Push(snp)) {
      //??? flow control?
      dprintf(modname, 49, 0, "CODE ERROR: snoop queue overflow.");
    }

    if ((snoopq->SpaceLeft()+1) < G_ADDR_OVERFLOW_LIMIT && !resq_aok_off && !snpq_aok_off){
       dprintf(modname, 49, 0, "snoop is full, %d spaces left but AOK not off", snoopq->SpaceLeft());
    }
    // Flow control.
    if (snoopq->SpaceLeft() <= G_ADDR_OVERFLOW_LIMIT && !resq_aok_off && !memq_aok_off) {
      int *p = new int;
      *p = P_AOK_OFF;
      dprintf(modname, 0, 0, "snoop q full. AOK off");
      if (!out_packq->Push(p)) {
	dprintf(modname, 49, 0, "CODE ERROR: j_pack outq overflow.");
      }
      snpq_aok_off = 1;
    }

    // Also queue the address for the incoming jpacks.
    //CHANGED by DW 100200 - mark WRBCs with a cancel bit
    if (type == T_WRBC){
      dprintf(modname, 0, 0, "Marking WRBC case for future cancellation");
      presult = new PackResult(addr, 1, 1);
    }else
      presult = new PackResult(addr);
  } else {
    // Don't expect jpacks to be returned, but have to tell the memory
    // controller.
    //CHANGED by DW 100200 - mark WRBCs with a cancel bit
    if (type == T_WRBC){
      dprintf(modname, 0, 0, "Marking WRBC case for future cancellation");
      presult = new PackResult(addr, 0, 1);
    }else
      presult = new PackResult(addr, 0);
  }
  presult->hold = hold;
  if (!resultsq->Push(presult)) {
    dprintf(modname, 49, 0, "CODE ERROR: j_pack address queue overflow");
  }

  // Flow control.
  if (resultsq->SpaceLeft() == G_ADDR_OVERFLOW_LIMIT && !snpq_aok_off && !memq_aok_off) {
    int *p = new int;
    *p = P_AOK_OFF;
    dprintf(modname, 21, 0, "SnoopControl->NewSnoop: Asserting AOK OFF");
    if (!out_packq->Push(p)) {
      dprintf(modname, 49, 0, "CODE ERROR: j_pack outq overflow.");
    }
    resq_aok_off = 1;
  }
}


//------------------------------------------------------------------------------
// Allows the snoop controller to keep track of the AOK_OFF state of the
// memory controller.  In this way the snoop controller will not issue an
// AOK_ON while the memory controller still requires an AOK_OFF.
void SnoopControl::UpdateMemqAokOffState(int value)
{
  memq_aok_off = value;
}


//------------------------------------------------------------------------------
// Allows the memory controller to inject aok and dok packets. Note that only
// aok and dok packets are allowed. Priority order is AOK_OFF, DOK_OFF, AOK_ON,
// DOK_ON. It is assumed that we won't get two AOK or two DOK packets in the
// same cycle.
void SnoopControl::AddPack(int pack)
{
  if ((pack != P_AOK_ON) && (pack != P_AOK_OFF) && (pack != P_DOK_ON) && (pack != P_DOK_OFF)) {
    dprintf(modname, 49, 0, "CODE ERROR: tried to add an invalid pack. Only AOK and DOK is allowed.");
  }
  if (!out_packq->SpaceLeft()) {
    dprintf(modname, 49, 0, "CODE ERROR: j_pack outq overflow.");
  }
  int *t = NULL;
  int *n = out_packq->Next();
  int *p = new int(pack);
  if (n) {
    if ((pack == P_DOK_OFF) && (*n == P_AOK_OFF)) {
      t = out_packq->Pop();
    } else if ((pack == P_AOK_ON) && ((*n == P_AOK_OFF) || (*n == P_DOK_OFF))) {
      t = out_packq->Pop();
    } else if ((pack == P_DOK_ON) &&
	       ((*n == P_AOK_OFF) || (*n == P_DOK_OFF) || (*n == P_AOK_ON))) {
      t = out_packq->Pop();
    }
  }
  out_packq->PriorityPush(p);
  if (t) {
    out_packq->PriorityPush(t);
  }
}


//------------------------------------------------------------------------------
// Get the result of the j_packs. If anyone returned COHACKD of COHACKS, the
// caller must be informed. Dequeue the packs, because we don't need them
// anymore.
PackResult* SnoopControl::GetPackResults()
{
  PackResult *presult = resultsq->Next();
  if (!presult) {
    return NULL;
  }
  return presult;
}


//------------------------------------------------------------------------------
// Clean up the pack results queue.
void SnoopControl::ClearPackResults()
{
  PackResult *presult = resultsq->Pop();
  if (presult) {
    delete presult;
  }
  // Should this consider memq_aok_off?
  if (resq_aok_off && (resultsq->SpaceLeft() > (G_ADDR_OVERFLOW_LIMIT + 1))) {
    int *p = new int;
    *p = P_AOK_ON;
    if (memq_aok_off) {
      dprintf(modname, 0, 0, "SnoopControl->ClearPackResults: asserting AOK ON after memq/iomemq requested AOK OFF.");
    }
    if (!out_packq->Push(p)) {
      dprintf(modname, 49, 0, "CODE ERROR: j_pack outq overflow.");
    }
    resq_aok_off = 0;
  }
}


//------------------------------------------------------------------------------
// Check if there's a snoop pending for a particular address.
int SnoopControl::SnoopPending(ull addr)
{
  int ret = 0;
  Enumeration<Snoop> *en = SnoopQueue();
  for (Snoop *snp = (Snoop *) en->NextElement(); snp && en->HasMoreElements(); snp = (Snoop *) en->NextElement()) {
    if ((snp->addr & AD_MASK6) == (addr & AD_MASK6)) {
      ret = 1;
      break;
    }
  }
  delete en;
  return ret;
}

//------------------------------------------------------------------------------
// Check if there's a snoop pending for a particular address and transaction type
int SnoopControl::SnoopPending(ull addr, int inv)
{
  int ret = 0;
  Enumeration<Snoop> *en = SnoopQueue();
  for (Snoop *snp = (Snoop *) en->NextElement(); snp && en->HasMoreElements(); snp = (Snoop *) en->NextElement()) {
    if ((snp->addr & AD_MASK6) == (addr & AD_MASK6) && inv) {
      switch (snp->type){
	case T_RDO:
	case T_OWN:
	case T_WRI:
	case T_WRIS:
	case T_INV:
	  ret = 1;
	  break;
	default:
	  if (!inv){
	    ret = 1;
	  }
	  break;
      }
    }
  }
  delete en;
  return ret;
}


//------------------------------------------------------------------------------
// Check if there's a snoop pending for an entry in the read buffer.
int SnoopControl::SnoopPending(int indx)
{
  int ret = 0;
  Enumeration<Snoop> *en = SnoopQueue();
  for (Snoop *snp = (Snoop *) en->NextElement(); snp && en->HasMoreElements(); snp = (Snoop *) en->NextElement()) {
    if ((snp->orb_indx == indx) && snp->own) {
      ret = 1;
      break;
    }
  }
  delete en;
  return ret;
}


//------------------------------------------------------------------------------
// Cycle this controller.
int SnoopControl::Cycle()
{
  // Reset the rtl display variables.
//   for (int i = 0; i < G_MAXPORTS; i++) {
//     rtl_curr_packs_in[i] = -1;
//   }
//   rtl_curr_snoop = NULL;
//   rtl_curr_presult = NULL;
//   rtl_curr_pack_out = -1;

  // Check the incoming jpacks.
  PackResult *presult = resultsq->Next();
  if (presult) {
    if (!presult->done) {
      if (presult->must_snoop) {
	if (snp_packs_in) {
	  dprintf(modname, 0, 0, "jpacks are in for address 0x%llx", presult->addr);

	  int *pack;
	  presult->result = P_COHACK;
	  for (int i = 0; i < G_MAXPORTS; i++) {
	    if (liveports[i]) {
	      pack = in_packq[i]->Pop();
	      if (*pack == P_COHACKD) {
		presult->result = *pack;
	      } else if ((*pack == P_COHACKS) && (presult->result != P_COHACKD)) {
		presult->result = *pack;
	      }
	      delete pack;
	    }
	  }
	  snp_packs_in = 0;
	  presult->done = 1;
	}
      } else {
	presult->done = 1;
      }
    }
    if (presult->done && !presult->hold) {
      ClearPackResults();
    }
  }

  Snoop *snp = snoopq->Next();
  if (!snp) {
    return 1;
  }

  int *pack;
  if (snp_delaycnt < snp_delay) {
    snp_delaycnt++;
  } else {
    if (snp_random) {
      snp_delay = ((float) rand() / RAND_MAX) * snp_max_delay;
      dprintf(modname, 25, 0, "snoop delay is %d", snp_delay);
    }
    snp_delaycnt = 0;
    if (snp->type == T_WRI)
      snp_delaycnt = 0;
    if (!orb->IsBlocking(snp->addr)) {
      // Can't process this snoop if there's an outstanding read to it's address.
      // Data must be returned first, because it could change the cache state.
//     if (!(orb->Contains(snp->addr) && orb->OnBus(snp->addr) && !snp->own)) {

      if ((get_trans_type(snp->type) == TYPE_READ) && snp->own) {
	// Set the blocking condition.
	orb->SetBlocking(snp);
      }

      pack = new int;
      *pack = P_COHACK;
      byte nstate = -1;
      byte cstate = cache->GetState(snp->addr);
      ByteString *bstr = cache->ReadLine(snp->addr);

      // Since the cache only looks at the line number and not the tag, make sure
      // the cache really contains this address.
      if (!cache->Contains(snp->addr)) {
	cstate = CSTATE_I;
      }

      if ((snp->type == T_RD) && (cstate != CSTATE_I)) {
	dprintf(modname, 49, 0, "Invalid cache state %c for %s.", Cache::GetStateString(cstate), get_trans_string(snp->type));
      } else if (snp->type == T_RDS) {
	if (snp->own && (cstate != CSTATE_I)) {
	  dprintf(modname, 49, 0, "Invalid cache state %c for %s.", Cache::GetStateString(cstate), get_trans_string(snp->type));
	} else if (!snp->own && ((cstate == CSTATE_S) || (cstate == CSTATE_E))) {
	  *pack = P_COHACKS;
	  nstate = CSTATE_S;
	} else if (!snp->own && (cstate != CSTATE_I)) {
	  *pack = P_COHACKD;
	  nstate = CSTATE_O;
	  snp_trans = new Transaction(J_DATARET64, snp->addr, snp->srcID, snp->orb_indx, CSTATE_S, 0);
	  snp_trans->data->Copy(bstr);
	}
      } else if (snp->type == T_RDSA) {
	if (snp->own && (cstate != CSTATE_I)) {
	  dprintf(modname, 49, 0, "Invalid cache state %c for %s.", Cache::GetStateString(cstate), get_trans_string(snp->type));
	} else if (!snp->own && (cstate == CSTATE_E)) {
	  nstate = CSTATE_S;
	} else if (!snp->own && ((cstate == CSTATE_O) || (cstate == CSTATE_M))) {
	  *pack = P_COHACKD;
	  nstate = CSTATE_O;
	  snp_trans = new Transaction(J_DATARET64, snp->addr, snp->srcID, snp->orb_indx, CSTATE_S, 0);
	  snp_trans->data->Copy(bstr);
	}
      } else if (snp->type == T_RDO) {
	if (snp->own && (cstate != CSTATE_I) && (cstate != CSTATE_S)) {
	  dprintf(modname, 49, 0, "Invalid cache state %c for %s.", Cache::GetStateString(cstate), get_trans_string(snp->type));
	} else if (!snp->own && ((cstate == CSTATE_S) || (cstate == CSTATE_E))) {
	  nstate = CSTATE_I;
	} else if (!snp->own && (cstate != CSTATE_I)) {
	  *pack = P_COHACKD;
	  nstate = CSTATE_I;
	  snp_trans = new Transaction(J_DATARET64, snp->addr, snp->srcID, snp->orb_indx, CSTATE_M, 0);
	  snp_trans->data->Copy(bstr);
	}
      } else if (snp->type == T_OWN) {
	if (snp->own && ((cstate == CSTATE_S) || (cstate == CSTATE_E) || (cstate == CSTATE_M))) {
	  dprintf(modname, 49, 0, "Invalid cache state %c for %s.", Cache::GetStateString(cstate), get_trans_string(snp->type));
	} else if (snp->own && (cstate == CSTATE_O)) {
	  *pack = P_COHACKD;
	  nstate = CSTATE_M;
	  // Local hit, don't need to wait for data to be returned.
//        orb->Remove(snp->orb_indx);
	  ReadBuffEntry *orbe = orb->Get(snp->orb_indx);
	  orbe->cstate = CSTATE_M;
	  orbe->indata->Copy(bstr);
	  orbe->dataret = 1;
	} else if (!snp->own && ((cstate == CSTATE_O) || (cstate == CSTATE_M))) {
	  *pack = P_COHACKD;
	  nstate = CSTATE_I;
	  snp_trans = new Transaction (J_DATARET64, snp->addr, snp->srcID, snp->orb_indx, CSTATE_M, 0);
	  snp_trans->data->Copy(bstr);
	} else if (!snp->own) {
	  nstate = CSTATE_I;
	}
      } else if (snp->type == T_RDD) {
	if (snp->own && (cstate != CSTATE_I)) {
	  dprintf(modname, 49, 0, "Invalid cache state %c for %s.", Cache::GetStateString(cstate), get_trans_string(snp->type));
	} else if (!snp->own && ((cstate == CSTATE_O) || (cstate == CSTATE_M))) {
	  *pack = P_COHACKD;
	  snp_trans = new Transaction(J_DATARET64, snp->addr, snp->srcID, snp->orb_indx, CSTATE_I, 0);
	  snp_trans->data->Copy(bstr);
	}
      } else if (snp->type == T_WRI) {
	if (snp->own && (cstate != CSTATE_I)) {
	  dprintf(modname, 49, 0, "Invalid cache state %c for %s.", Cache::GetStateString(cstate), get_trans_string(snp->type));
	} else if (!snp->own) {
	  nstate = CSTATE_I;
	}
      } else if (snp->type == T_WRIS) {
	nstate = CSTATE_I;
      } else if (snp->type == T_INV) {
	nstate = CSTATE_I;
      }

      // Transition the line, if necessary.
      if ((nstate != 0xff) && (nstate != cstate)) {
	dprintf(modname, 0, 0, "Address 0x%llx transitioning %c->%c.", snp->addr, Cache::GetStateString(cstate), Cache::GetStateString(nstate));
	if (!cache->ChangeState(snp->addr, nstate)) {
	  dprintf(modname, 49, 0, "Bad cache state transition %c->%c.", Cache::GetStateString(cstate), Cache::GetStateString(nstate));
	}

	if (((cstate == CSTATE_M) || (cstate == CSTATE_O)) && (nstate == CSTATE_I)) {
	  // Must cancel any pending writebacks to this address.
	  Enumeration<Transaction> *en = (Enumeration<Transaction> *) wrbq->Elements();
	  for (Transaction *t = (Transaction *) en->NextElement(); t && en->HasMoreElements(); t = (Transaction *) en->NextElement()) {
	    if ((t->type == T_WRB) && ((t->addr & AD_MASK6) == (snp->addr & AD_MASK6))) {
	      t->type = T_WRBC;
	    }
	  }
	  delete en;
	}
      }

      if (!out_packq->Push(pack)) {
	dprintf(modname, 49, 0, "CODE ERROR: j_pack outq overflow.");
      }
      dprintf(modname, 0, 0, "Snoop of address 0x%llx is done.", snp->addr);
      snp = snoopq->Pop();
      delete snp;

      if (snpq_aok_off && (snoopq->SpaceLeft() > (G_ADDR_OVERFLOW_LIMIT + 1)) && !memq_aok_off) {
	int *p = new int;
	*p = P_AOK_ON;
	dprintf(modname, 21, 0, "SnoopControl->Cycle: Asserting AOK ON");
	if (!out_packq->Push(p)) {
	  dprintf(modname, 49, 0, "CODE ERROR: j_pack outq overflow.");
	}
	snpq_aok_off = 0;
      }
    }else
      dprintf(modname, 25, 0, "snoop to address %011llx is blocked by outstanding read", snp->addr);

  }
  if (snp_trans) {
    snp_trans->multi = 1;
    snp_trans->size = 64;

    if (outq->Full()) {
      dprintf(modname, 0, 0, "Output queue is full.");
      return 0;
    } else {
      outq->Push(snp_trans);
      snp_trans = NULL;
    }
  }

  return 1;
}


//------------------------------------------------------------------------------
// Get the status of AOK. Returns 1 if AOK is on, 0 if AOK is off.
int SnoopControl::AOK()
{
  return aok_prev;
}


//------------------------------------------------------------------------------
// Get the status of DOK for a specific port. Returns 1 if DOK is on, 0
// if DOK is off.
int SnoopControl::DOK(int port)
{
  if ((port < 0) || (port >= G_MAXPORTS)) {
    dprintf(modname, 49, 0, "Port %d is out of range for DOK check.", port);
    return -1;
  }
  return dok_prev[port];
}


//------------------------------------------------------------------------------
// Returns 1 if the queues are empty, 0 otherwise.
int SnoopControl::Done()
{
  if (snoopq->Empty()) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Signals for outputing by the rtl interface.
char *SnoopControl::RTLData()
{
  char *out = new char[64];

  int i = 0;
  sprintf(out, "%d:%d:%d:%d:%d:", snpq_aok_off, resq_aok_off, snp_packs_in, snp_delay, snp_delaycnt);
  i = strlen(out);
  for (int j = 0; j < G_MAXPORTS; j++, i++) {
    sprintf(&out[i], "%d", aok_halt[j]);
  }
  i += sprintf(&out[i], ":%d:%d:", aok_prev, aok_next);
  for (int k = 0; k < G_MAXPORTS; k++, i++) {
    sprintf(&out[i], "%d", dok_prev[k]);
  }
  out[i++] = ':';
  for (int l = 0; l < G_MAXPORTS; l++, i++) {
    sprintf(&out[i], "%d", dok_next[l]);
  }
  return out;
}
