// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: MemoryControl.cc
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
// Description:  Memory controller for SJM.
// - All constructors assume that the address is properly aligned.
//
//------------------------------------------------------------------------------

#include "MemoryControl.h"

// Initialize static variables.
unsigned int MemoryControl::mctl_max_delay = 100;

//------------------------------------------------------------------------------
// Constructor.
MemoryControl::MemoryControl(char *name, int id, ull iosync, Queue<Transaction> *q, SnoopControl *sc, LinkedList<PlusArg> *arglist) {
  modname = new char[strlen(name)+1];
  strcpy(modname, name);

  outq = q;
  snpctrl = sc;

  mem = new Memory<int>(3);
  // Cacheable space.
  //mem->NewRange((ull) 0 | ((ull) id << 36), 
  //		((ull) 0 | (((ull) id + 1) << 36)) -1);
  // Noncacheable space.
  //mem->NewRange(((ull) ADDR_NONC << 40) | ((ull) id << 36),
  //		(((ull) ADDR_NONC << 40) | (((ull) id + 1) << 36)) - 1);
  // Configuration space.
  //mem->NewRange(((ull) ADDR_CONF << 40) | (id << 23),
  //		(((ull) ADDR_CONF << 40) | ((id + 1) << 23)) - 1);

  //Niagara support: Expand memory range to cover for 
  //alternative agent ids. For our case, I/O bridge 0 needs
  //to handle requests to agent ids 12/13. While I/O bridge 1
  //needs to handle requests to agent ids 14/15
  //SJMs are used as I/O bridge substitutes only

  // Cacheable space.
  mem->NewRange((ull) 0 | ((ull) id << 36), 
		((ull) 0 | ((((ull) id + 2) << 36) - 1)));
  // Noncacheable space.
  mem->NewRange(((ull) ADDR_NONC << 41) | ((ull) id << 36),
		(((ull) ADDR_NONC << 41) | ((((ull) id + 2) << 36) - 1)));
  // Configuration space.
  mem->NewRange(((ull) ADDR_CONF << 41) | (id << 23),
		(((ull) ADDR_CONF << 41) | (((id + 2) << 23) - 1)));

  // Set the iosync address.
  if (!InRange(iosync)) {
    mctl_iosync_addr = -1;
    dprintf(modname, 48, 4, "IOSYNC address 0x%llx is out of range.", iosync);
//     dprintf(modname, 49, 4, "IOSYNC address is out of range.");
//     throw AddressOutOfRange();
  } else {
    mctl_iosync_addr = iosync;
  }
  mctl_iosync_state = MEM_IOSYNC_NONE;

  rd_delay = 0;
  wr_delay = 0;
  io_rd_delay = 0;
  io_wr_delay = 0;
  random = 0;

  // Read the plusargs.
  int memq_size = G_MEMQ_DEPTH;
  int iomemq_size = G_MEMQ_DEPTH;
  dataq_size = G_DATAQ_DEPTH;
  arglist->GoToHead();
  for (PlusArg *arg = arglist->CurrentNode(); arg || arglist->HasMoreNodes(); arg = arglist->NextNode()) {
    if (!strcmp(arg->name, "rd_delay")) {
      if ((arg->owner >= 0) || ((arg->owner < 0) && !rd_delay)) {
	rd_delay = arg->value;
	io_rd_delay = arg->value;
	dprintf(name, 0, 0, "Setting read delay to %d.", rd_delay);
      }
    } else if (!strcmp(arg->name, "wr_delay")) {
      if ((arg->owner >= 0) || ((arg->owner < 0) && !wr_delay)) {
	wr_delay = arg->value;
	io_wr_delay = arg->value;
	dprintf(name, 0, 0, "Setting write delay to %d.", wr_delay);
      }
    } else if (!strcmp(arg->name, "mem_delay_rand")) {
      if (rd_delay || wr_delay) {
	dprintf(modname, 48, 4, "Cannot use sjm_memory_delay_random with any other memory delay settings.");
//      throw BadMemCtrlPlusArg();
      } else {
	if (arg->value == 0) {
	  dprintf(modname, 48, 4, "Maximum random delay must be greater than zero.");
	} else if (arg->value >= 0) {
	  mctl_max_delay = arg->value;
	}
	rd_delay = (((float) rand()) / RAND_MAX) * mctl_max_delay;
	wr_delay = (((float) rand()) / RAND_MAX) * mctl_max_delay;
	io_rd_delay = (((float) rand()) / RAND_MAX) * mctl_max_delay;
	io_wr_delay = (((float) rand()) / RAND_MAX) * mctl_max_delay;
	random = 1;
	dprintf(name, 0, 0, "Randomizing the read and write delays. Initial read delay is %d, initial write delay is %d.", rd_delay, wr_delay);
      }
    } else if (!strcmp(arg->name, "memq_size")) {
      if (arg->value > G_MEMQ_DEPTH) {
	dprintf(name, 49, 4, "Requested memory queue size is greater than the maximum value of %d.", G_MEMQ_DEPTH);
	throw BadMemCtrlPlusArg();
      }
      memq_size = arg->value + G_ADDR_OVERFLOW_LIMIT;
    } else if (!strcmp(arg->name, "iomemq_size")) {
      if (arg->value > G_MEMQ_DEPTH) {
	dprintf(name, 49, 4, "Requested I/O memory queue size is greater than the maximum value of %d.", G_MEMQ_DEPTH);
	throw BadMemCtrlPlusArg();
      }
      iomemq_size = arg->value + G_ADDR_OVERFLOW_LIMIT;
    } else if (!strcmp(arg->name, "dataq_size")) {
      if (arg->value > G_MEMQ_DEPTH) {
	dprintf(name, 49, 4, "Requested memory data queue size is greater than the maximum value of %d.", G_MEMQ_DEPTH);
	throw BadMemCtrlPlusArg();
      }
      dataq_size = arg->value + G_DATA_OVERFLOW_LIMIT;
    }
  }

  memq = new Queue<MemoryRequest>(memq_size, Q_FIFO);
  iomemq = new Queue<MemoryRequest>(iomemq_size, Q_FIFO);
  dataq = new LinkedList<ByteString>();

  mctl_read_error_list = new BinaryKeyValueTree<ull>();
  mctl_cache_state_list = new BinaryKeyValueTree<ull>();

  lasttrans = NULL;
  mctl_compress = 0;

  Reset();
}


//------------------------------------------------------------------------------
// Reset. Empty the queues. Reset the AOK and DOK states. Zero the latency
// counters. Throw out any outstanding transactions.
void MemoryControl::Reset()
{
  MemoryRequest *mreq;
  while(!memq->Empty()) {
    mreq = memq->Pop();
    delete mreq;
  }
  while (!iomemq->Empty()) {
    mreq = iomemq->Pop();
    delete mreq;
  }
  if (!dataq->Empty()) {
    delete dataq;
    dataq = new LinkedList<ByteString>();
  }
  if (lasttrans) {
    delete lasttrans;
  }
  lasttrans = NULL;
  waitingat = 0;
  lastwrite = NULL;
  rd_cnt = 0;
  wr_cnt = 0;
  io_rd_cnt = 0;
  io_wr_cnt = 0;
  aok_on = 1;
  dok_on = 1;

  delete mctl_read_error_list;
  mctl_read_error_list = new BinaryKeyValueTree<ull>();
  delete mctl_cache_state_list;
  mctl_cache_state_list = new BinaryKeyValueTree<ull>();

  // Set any configuration addresses to their default value.
  Range *rge = mem->GetRange(2);
  ull addr = rge->GetLo() | CONF_TOM_CSR;

  //!!!
  ull data = 0x000007f000000000;
  mem->Write(addr, (data >> 32) & 0xffffffff);
  mem->Write(addr + 0x4, data & 0xffffffff);
}


//------------------------------------------------------------------------------
// Put data read from a memdat file into memory.
void MemoryControl::SetMemdat(ull addr, LinkedList<int> *datalist)
{
  int data;
  Enumeration<int> *en = (Enumeration<int> *) datalist->Elements();
  while (en->HasMoreElements()) {
    data = *((int *) en->NextElement());
    mem->Write(addr, data);
    addr += 4;
  }
  delete en;
}


//------------------------------------------------------------------------------
// Check if an address is in range.
int MemoryControl::InRange(ull addr)
{
  if ((addr >> 41) && (mem->InRange(1, addr) || mem->InRange(2, addr))) {
    return 1;
  }
  return mem->InRange(0, addr);
}


//------------------------------------------------------------------------------
// Get the synchronization status.
int MemoryControl::GetSyncState()
{
  int ret = MEM_IOSYNC_UKNOWN;
  ull addrbase = mctl_iosync_addr & 0xfffffffffffffffc;

  // Someone wrote to the iosync address, so the sync is done.
  if (mctl_iosync_state == MEM_IOSYNC_DONE) {
    mem->Write(addrbase, 0);
    mctl_iosync_state = MEM_IOSYNC_NONE;
    ret = MEM_IOSYNC_DONE;
  } else {
    // Get the data at the sync address. Access must be word aligned. Grab just
    // the byte specified by the iosync address.
    int data = (mem->Read(addrbase) >> (8 * (3 - (mctl_iosync_addr & 0x3)))) & 0xff;

    if (!data) {
      if (mctl_iosync_state == MEM_IOSYNC_NONE) {
	// Start a sync.
	data = 0 | (1 << (8 * (3 - (mctl_iosync_addr & 0x3))));
	mem->Write(addrbase, data);
	mctl_iosync_state = MEM_IOSYNC_WAIT;
	ret = mctl_iosync_state;
      } else {
	dprintf(modname, 49, 0, "Illegal state for iosync, %d", mctl_iosync_state);
      }
    } else {
      if (mctl_iosync_state == MEM_IOSYNC_NONE) {
	// Sync is done. Clear the data.
	mem->Write(addrbase, 0);
	ret = MEM_IOSYNC_DONE;
      } else if (mctl_iosync_state != MEM_IOSYNC_WAIT) {
	dprintf(modname, 49, 0, "Illegal state for iosync, %d", mctl_iosync_state);
      } else {
	ret = MEM_IOSYNC_WAIT;
      }
    }
  }
  return ret;
}


//------------------------------------------------------------------------------
// Read an address in configuration space. Returns 64 bits.
ull MemoryControl::ReadConfigAddress(int offset, int size)
{
  // Make the address to read from.
  Range *rge = mem->GetRange(2);
  ull addr = (rge->GetLo() | offset) & 0xfffffffffffffffc;

  // Get the data at that address.
  ull data;
  if (size <= 4) {
    data = mem->Read(addr);
  } else {
    data = (mem->Read(addr) << 32) | (mem->Read(addr + 4));
  }
  return data;
}


//------------------------------------------------------------------------------
// Add an address that generates read errors.
void MemoryControl::AddReadErrorAddress(ull addr, int which)
{
  // See if the address has all ready been saved.
  ull ad = addr & AD_MASK6;
  int *n = (int *) mctl_read_error_list->KVFind(ad);
  if (n) {
    // Overwrite the previous setting.
    *n = which;
  } else {
    // Add a new address.
    n = new int(which);
    if (!mctl_read_error_list->KVInsert(ad, (void *) n)) {
      delete n;
    }
  }
}


//------------------------------------------------------------------------------
// Remove an address that generates read errors. Ignores errors from the
// binary tree.
void MemoryControl::RemoveReadErrorAddress(ull addr, int which)
{
  // Find the address.
  ull ad = addr & AD_MASK6;
  int *n = (int *) mctl_read_error_list->KVFind(ad);
  if (n) {
    // Only remove if it matches.
    if (*n == which) {
      n = (int *) mctl_read_error_list->KVRemove(ad);
      delete n;
    }
    // Do nothing otherwise.
  }
}


//------------------------------------------------------------------------------
// Add an address that drives an alternate cache state.
void MemoryControl::AddCacheStateAddress(ull addr, byte state)
{
  // Find the address.
  ull ad = addr & AD_MASK6;
  byte *c = (byte *) mctl_cache_state_list->KVFind(ad);
  if (c) {
    // Overwrite pervious setting.
    *c = state;
  } else {
    // Add a new address.
    c = new byte(state);
    if (!mctl_cache_state_list->KVInsert(ad, (void *) c)) {
      delete c;
    }
  }
}


//------------------------------------------------------------------------------
// Remove an address that drives an alternate cache state.
void MemoryControl::RemoveCacheStateAddress(ull addr, byte state)
{
  // Find the address.
  ull ad = addr & AD_MASK6;
  byte *c = (byte *) mctl_cache_state_list->KVFind(ad);
  if (c) {
    // Only remove if it matches.
    if (*c == state) {
      c = (byte *) mctl_cache_state_list->KVRemove(ad);
      delete c;
    }
  }
}


//------------------------------------------------------------------------------
// Add a new read request to the input queue.
int MemoryControl::AddRequest(ull addr, int size, int id, int indx, char state, short mask)
{
  dprintf(modname, 0, 0, "Queuing read to address 0x%llx, outstanding read buffer index %d", addr, indx);
  return addRequest(MEM_READ, addr, size, id, indx, state, mask, 0);
}


//------------------------------------------------------------------------------
// Add a new write request to the input queue.
int MemoryControl::AddRequest(ull addr, int size, int id, short mask, int comp)
{
  dprintf(modname, 0, 0, "Queuing write to address 0x%llx", addr);
  return addRequest(MEM_WRITE, addr, size, id, -1, -1, mask, comp);
}


//------------------------------------------------------------------------------
// Add data to the data queue. Whoever calls this method is responsible for
// instantiating a 16-byte, valid ByteString.
int MemoryControl::AddData(ByteString *data)
{
  dataq->Append(data);
  if (dataq->Size() > dataq_size) {
    dprintf(modname, 49, 0, "CODE ERROR: dataq overflow.");
    return 0;
  }

  if (!lastwrite->data) {
    lastwrite->data = data;
  }

  // The request has to keep track of when all the data has been added.
  lastwrite->datain++;
  // Unset, we're done with this write.
  if (lastwrite->datain == (lastwrite->size / 16)) {
    lastwrite = NULL;
  }

  // Flow control.
  if ((dataq_size - dataq->Size()) == G_DATA_OVERFLOW_LIMIT) {
    dprintf(modname, 21, 0, "Asserting DOK_OFF");
    snpctrl->AddPack(P_DOK_OFF);
    dok_on = 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Process incoming requests.
int MemoryControl::Cycle()
{
  int memq_ret = 1, iomemq_ret = 1, loop = 1;
  MemoryRequest *mrq;

  if (!waitingat || (waitingat == 1)) {
    // Process the memory request queue first.
    mrq = memq->Next();
    if (mrq) {
      memq_ret = processRequest(mrq, &rd_cnt, &wr_cnt, &rd_delay, &wr_delay, 1);
      if (memq_ret > 0) {
	snpctrl->ClearPackResults();
	mrq = memq->Pop();
	delete mrq;
      }
    }
  }

  if (!waitingat || (waitingat == 2)) {
    // Process the noncacheable request queue second.

    // Compression only happens with noncacheable requests.
    mrq = iomemq->Next();
    if (mrq){
      //Need to stop compressing if a non compressible access happens to be sitting in the queue
      if (!mrq->compress)
	mctl_compress = 0;
    }
    if (!mctl_compress) {
      while (loop) {
	mrq = iomemq->Next();
	if (mrq) {
	  if (mrq->compress) {
	    // Delay is cleared for compression.
	    io_wr_cnt = io_wr_delay;
	    loop = 2;
	  } else if (loop == 2) {
	    // First request that's not compressible shouldn't be processed.
	    break;
	  } else {
	    loop = 0;
	  }
	  iomemq_ret = processRequest(mrq, &io_rd_cnt, &io_wr_cnt, &io_rd_delay, &io_wr_delay, 0);
	  if (iomemq_ret > 0) {
	    dprintf(modname, 21, 0, "iomemq (pre-Pop):  SpaceLeft = %d", iomemq->SpaceLeft());
	    mrq = iomemq->Pop();
	    dprintf(modname, 21, 0, "iomemq->Pop: type=%d, addr=0x%llx, size=%d", mrq->type, mrq->addr, mrq->size);
	    delete mrq;
	    dprintf(modname, 21, 0, "iomemq (post-Pop): SpaceLeft = %d", iomemq->SpaceLeft());
	  } else if (mrq->compress) {
	    dprintf(modname, 49, 0, "CODE ERROR: Request has compression bit set but returned with status %d.", iomemq_ret);
	    break;
	  }
	} else {
	  loop = 0;
	}
      }
    }
  }

  // Flow control.
  if (!aok_on && (memq->SpaceLeft() > (G_ADDR_OVERFLOW_LIMIT + 1)) && (iomemq->SpaceLeft() > (G_ADDR_OVERFLOW_LIMIT + 1))) {
    dprintf(modname, 21, 0, "Asserting AOK_ON.");
    snpctrl->AddPack(P_AOK_ON);
    snpctrl->UpdateMemqAokOffState(0);
    aok_on = 1;
  }

  return (memq_ret & iomemq_ret);
}


//------------------------------------------------------------------------------
// Add a memory request.
int MemoryControl::addRequest(char type, ull addr, int size, int id, int indx, char state, short mask, int comp)
{
  MemoryRequest *mrq = new MemoryRequest(type, addr, size, id, indx, state, mask);
  if (comp) {
    mrq->compress = 1;
    mctl_compress = 1;
  } else if (mctl_compress) {
    mctl_compress = 0;
  }
  int range = find_range(addr);
  if ((range == ADDR_NONC) || (range == ADDR_CONF)) {
    dprintf(modname, 21, 0, "iomemq (pre-Push):  SpaceLeft = %d", iomemq->SpaceLeft());
    dprintf(modname, 21, 0, "iomemq->Push: type=%d, addr=0x%llx, size=%d", mrq->type, mrq->addr, mrq->size);
    if (!iomemq->Push(mrq)) {
      dprintf(modname, 49, 0, "CODE ERROR: iomemq overflow on read.");
      delete mrq;
      return 0;
    }
    dprintf(modname, 21, 0, "iomemq (post-Push): SpaceLeft = %d", iomemq->SpaceLeft());
  } else {
    if (!memq->Push(mrq)) {
      dprintf(modname, 49, 0, "CODE ERROR: memq overflow on read.");
      delete mrq;
      return 0;
    }
  }

  if (type == MEM_WRITE) {
    lastwrite = mrq;
  }

  // Flow control.
  if (aok_on) {
    if ((memq->SpaceLeft() == G_ADDR_OVERFLOW_LIMIT) || (iomemq->SpaceLeft() == G_ADDR_OVERFLOW_LIMIT)) {
      dprintf(modname, 21, 0, "Asserting AOK_OFF.");
      snpctrl->AddPack(P_AOK_OFF);
      snpctrl->UpdateMemqAokOffState(1);
      aok_on = 0;
    }
  }
  return 1;
}


//------------------------------------------------------------------------------
// Process a request. Returns 1 if the request was sucessfully and completely
// processed; returns 0 if the request was processed, but the transaction could
// not be added to the output queue; returns -1 if the request was not
// processed because of a blocking condition.
int MemoryControl::processRequest(MemoryRequest *mrq, int *rd, int *wr, int *rd_d, int *wr_d, int coherent)
{
  PackResult *presult;

  if (coherent) {
    presult = snpctrl->GetPackResults();
    if (!presult) {
      dprintf(modname, 49, 0, "CODE ERROR: No snoop queued for memory request to address 0x%llx.", mrq->addr);
      return 0;
    }

    // Memory request address must match pack address, and packs must be in.
    if ((presult->must_snoop && ((presult->result < 0) || (presult->addr != mrq->addr))) ||
	(!presult->must_snoop && (presult->addr != mrq->addr))) {
      return -1;
    }
    //CHANGED by DW 100200 - mark WRBCs with a cancel bit
    if    (presult->cancel){
      dprintf(modname, 0, 0, "matched WRBC to read and would have hung, but caught WRBC case");
      return -1;
    }
  }
  if (mrq->type == MEM_READ) {
    if (!lasttrans) {
      if (*rd < *rd_d) {
	(*rd)++;
	return -1;
      }
      if (random) {
	*rd_d = ((float) rand() / RAND_MAX) * mctl_max_delay;
	dprintf(modname, 25, 0, "read delay is %d", *rd_d);
      }
      *rd = 0;

      if (coherent) {
	// Determine how to install the line at the recipient.
	if (mrq->cstate < 0) {
	  mrq->cstate = CSTATE_E;
	  if (presult->result == P_COHACKS) {
	    mrq->cstate = CSTATE_S;
	  }
	}
	if (presult->result == P_COHACKD) {
	  return 1;
	}
      }
      processRead(mrq);
    }
    if (outq->Full()) {
      waitingat = 1;
      if (!coherent) {
	waitingat = 2;
      }
      return 0;
    }
    outq->Push(lasttrans);
    if (coherent) {
      presult->hold = 0;
    }
    lasttrans = NULL;
    waitingat = 0;
  } else if (mrq->type == MEM_WRITE) {
    if (!lasttrans) {
      if (*wr < *wr_d) {
	(*wr)++;
	return -1;
      }
      if (random) {
	*wr_d = ((float) rand() / RAND_MAX) * mctl_max_delay;
	dprintf(modname, 25, 0, "write delay is %d", *wr_d);
      }
      *wr = 0;
      // Check that all the data is in.
      if (mrq->datain < (mrq->size / 16)) {
	return -1;
      }
      processWrite(mrq);
    }
    if (lasttrans) {
      if (outq->Full()) {
	waitingat = 1;
	if (!coherent) {
	  waitingat = 2;
	}
	return 0;
      }
      outq->Push(lasttrans);
      lasttrans = NULL;
      waitingat = 0;
    }
  } else {
    dprintf(modname, 49, 0, "CODE ERROR: Illegal memory request type %d.", mrq->type);
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Process a read request. Initializes lasttrans, so this should only be
// executed once per request.
void MemoryControl::processRead(MemoryRequest *mrq)
{
  dprintf(modname, 11, 0, "Processing incoming read to address 0x%llx.", mrq->addr);

  // Check if this address requires a read error.
  int *which = (int *) mctl_read_error_list->KVFind(mrq->addr & AD_MASK6);
  if (which) {
    lasttrans = new Transaction(J_READERR, 0, mrq->srcID, mrq->orb_indx, *which, 0);
  } else {
    // Go ahead and generate read return data.
    int limit = 0;
    int start = 0;
    int type = -1;
    if (mrq->size == 16) {
      limit = 16;
      start = ((mrq->addr & 0x30) >> 4) * 16;
      type = J_DATARET16;
    } else if (mrq->size == 64) {
      limit = 64;
      type = J_DATARET64;
    } else {
      // No other sizes are allowed.
      dprintf(modname, 49, 0, "CODE ERROR: invalid size %d specified for incoming transaction.", mrq->size);
      return;
    }

    // See if we need to drive an alternate cache state.
    byte cstate = mrq->cstate;
    byte *c = (byte *) mctl_cache_state_list->KVFind(mrq->addr & AD_MASK6);
    if (c) {
      cstate = *c;
    }

    lasttrans = new Transaction(type, mrq->addr, mrq->srcID, mrq->orb_indx, cstate, 0);
    // Address must be 64B aligned.
    ull addrbase = mrq->addr & AD_MASK6;
    for (int i = start; i < (start + limit); i += 4) {
      lasttrans->data->Set(i, mem->Read(addrbase | i));
    }

    lasttrans->size = mrq->size;
    lasttrans->multi = 1;
    // For 16B transactions, mask out the desired bytes.
    if (mrq->size == 16) {
      //     for (int i = 15, j = start; i >= 0; i--, j++) {
      //       if (!(mrq->mask & 0x1)) {
      //        lasttrans->data->AddByte(j, 0);
      //       }
      //       mrq->mask >>= 1;
      //     }
      lasttrans->multi = 0;
    }

    // Set the ecc bits.
//     int which = snpctrl->FindECCAddress(mrq->addr);
//     int w;
//     if (which) {
//       int bad = ((int) ((((float) rand() / RAND_MAX) * 100) / 6.25)) & 0xf;
//       if (!bad) {
//      bad = 0xf;
//       }
//       for (int i = 0; i < 4; i++, bad >>= 1) {
//      if (bad & 0x1) {
//        w = which;
//        if (which == (ECC_CORRECT | ECC_UNCORRECT)) {
//          w = ((float) rand() / RAND_MAX) < 0.5 ? ECC_CORRECT : ECC_UNCORRECT;
//        }
//        lasttrans->ecc[i] = w;
//      }
//       }
//     }
  }
}


//------------------------------------------------------------------------------
// Process a write request. Cacheable writes and noncacheable block writes are
// always 64-byte aligned. Noncacheable writes are 16-byte aligned.
void MemoryControl::processWrite(MemoryRequest *mrq)
{
  dprintf(modname, 11, 0, "Processing incoming write to address 0x%llx.", mrq->addr);

  int limit = 0;
  ull addrbase = 0;
  if (mrq->size == 16) {
    // Number of quadwords to write.
    limit = 1;
    // Must start with a 16 byte aligned address.
    addrbase = mrq->addr & AD_MASK4;
  } else if (mrq->size == 64) {
    // Number of quadwords to write.
    limit = 4;
    // Must start with a 64 byte aligned address.
    addrbase = mrq->addr & AD_MASK6;
  } else {
    // No other sizes are allowed.
    dprintf(modname, 49, 0, "CODE ERROR: invalid size %d specified for incoming transaction.", mrq->size);
    return;
  }

  dataq->Find(mrq->data);
  ByteString *bstr;
  for (int i = 0; i < limit; i++) {
    bstr = dataq->Remove();

    // Flow control.
    if (!dok_on && ((dataq_size - dataq->Size()) > G_DATA_OVERFLOW_LIMIT)) {
      dprintf(modname, 21, 0, "Asserting DOK_ON.");
      snpctrl->AddPack(P_DOK_ON);
      dok_on = 1;
    }

    // For 16B transactions, mask out the desired bytes.
    if ((mrq->size == 16) && ((mrq->mask & 0xffff) > -1)) {
      ByteString *in_bstr = bstr;
      bstr = new ByteString(16);
      // Get the data from memory.
      for (int j = 0; j < 16; j += 4) {
	bstr->Set(j, mem->Read(addrbase | j));
      }
      // Overwrite bytes masked in.
      if (1) { // <----------------------------------------------- compiler hack
	for (int j = 0; j < 16; j++) {
	  if (mrq->mask & 0x1) {
	    bstr->AddByte(j, *in_bstr->GetByte(j));
	  }
	  mrq->mask >>= 1;
	}
      }
      delete in_bstr;
    }

    // Write one quadword.
    for (int j = 0; j < 16; j += 4) {
      mem->Write(addrbase | j, bstr->GetInt(j));
    }
    // Start at the next quadword next time;
    addrbase += 16;

    delete bstr;
  }

  // Check if this was a write to the iosync address.
  if ((mrq->addr == mctl_iosync_addr) && (mctl_iosync_state == MEM_IOSYNC_WAIT)) {
    mctl_iosync_state = MEM_IOSYNC_DONE;
  }

  // Check if this was a write to the change init register.
  int aid = find_agent_id(mrq->addr);
  int pid = find_port_id(aid);
  int r = find_range(mrq->addr);
  if ((pid == BUS_MASTER) &&
      (r == ADDR_CONF) &&
      ((mrq->addr & 0x7fffff) == CONF_CHANGE_INIT)) {
    // Read what was written.
    int data = mem->Read(mrq->addr | 0x4);
    if (((data & 0x18) >> 3) == 0x2) {
      // Write back an acknowledge.
      data |= (0x3 << 3);
      mem->Write(mrq->addr | 0x4, data);
      // Queue a CHANGE transaction.
      lasttrans = new Transaction(T_CHANGE, 0, aid, 0, -1, 0);
    }
  }
}
