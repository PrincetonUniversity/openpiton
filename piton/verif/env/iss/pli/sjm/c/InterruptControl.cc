// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: InterruptControl.cc
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

#include "InterruptControl.h"

// Intialize static variables.
unsigned int InterruptControl::int_max_delay = 100;

//------------------------------------------------------------------------------
// Constructor.
InterruptControl::InterruptControl(char *name, Queue<Transaction> *q, LinkedList<PlusArg> *arglist)
{
  modname = new char[strlen(name)+1];
  strcpy(modname, name);
  INT_timeout = J_INTERRUPT_TIMEOUT;
  outq = q;

  ack_percentage = 0.5;
  ack_interval = 0;
  ack_count = 0;
  ack_mode = 1;

  int_data_reg = new ByteString(64);
  int_data_valid = 0;

  for (int i = 0; i < G_MAX_INT_TARGETS; i++) {
    int_outgoing[i] = NULL;
  }
  int_num_outgoing = 0;
  int_pending = NULL;

  // Read the plusargs.
  int_ack_delay = 0;
  int_retry_delay = 0;
  int_random = 0;
  arglist->GoToHead();
  for (PlusArg *arg = arglist->CurrentNode(); arg || arglist->HasMoreNodes(); arg = arglist->NextNode()) {
    if (!strcmp(arg->name, "int_ack_delay")) {
      if ((arg->owner >= 0) || ((arg->owner < 0) && !int_ack_delay)) {
	int_ack_delay = arg->value;
	dprintf(modname, 0, 0, "Setting interrupt acknowledge delay to %d", int_ack_delay);
      }
    } else if (!strcmp(arg->name, "int_retry_delay")) {
      if ((arg->owner >= 0) || ((arg->owner < 0) && !int_retry_delay)) {
	int_retry_delay = arg->value;
	dprintf(modname, 0, 0, "Setting interrupt retry delay to %d", int_retry_delay);
      }      
    } else if (!strcmp(arg->name, "int_delay_rand")) {
      if (int_ack_delay || int_retry_delay) {
	dprintf(modname, 48, 4, "Cannot use sjm_int_delay_random with any other interrupt delay settings.");
	throw BadIntCtrlPlusArg();
      }
      if (arg->value == 0) {
	dprintf(modname, 48, 4, "Maximum random delay must be greater than zero.");
      } else if (arg->value > 0) {
	int_max_delay = arg->value;
      }
      int_random = 1;
    }
  }

  int_outgoing_trans = NULL;
}


//------------------------------------------------------------------------------
// Destructor.
InterruptControl::~InterruptControl()
{
  delete modname;

  for (int i = 0; i < G_MAX_INT_TARGETS; i++) {
    if (int_outgoing[i]) {
      delete int_outgoing[i];
    }
  }
  if (int_pending) {
    delete int_pending;
  }

  delete int_data_reg;
  if (int_outgoing_trans) {
    delete int_outgoing_trans;
  }
}


//------------------------------------------------------------------------------
// Set the accept percentage.
void InterruptControl::SetAckPercentage(int ack)
{
  ack_percentage = (float) ack / 100;
  dprintf(modname, 21, 0, "New accept percentage is %f", ack_percentage);
}


//------------------------------------------------------------------------------
// Set the accept interval.
void InterruptControl::SetAckInterval(int ack)
{
  ack_interval = ack;
  dprintf(modname, 21, 0, "Setting accept interval to %d.", ack_interval);
}


//------------------------------------------------------------------------------
// Set the accept mode.
void InterruptControl::SetAckMode(int ack)
{
  ack_mode = ack;
  dprintf(modname, 21, 0, "Setting accept mode to %d", ack_mode);
}


//------------------------------------------------------------------------------
// Reset. Clear all outgoing and pending interrupts. Clear all delays.
void InterruptControl::Reset()
{
  for (int i = 0; i < G_MAX_INT_TARGETS; i++) {
    if (int_outgoing[i]) {
      delete int_outgoing[i];
      int_outgoing[i] = NULL;
    }
  }
  if (int_pending) {
    delete int_pending;
    int_pending = NULL;
  }
//   int_ack_delay = 0;
//   int_retry_delay = 0;
  // Clear the interrupt data register.
  int_data_valid = 0;
}


//------------------------------------------------------------------------------
// This SJM is sending out a new interrupt.
int InterruptControl::NewOutgoing(ull addr, ByteString *data, int rep)
{
  int aid, pid;
  // Get the port id of the target.
  if(0){ //Niagara Support
     aid = find_agent_id(addr);
     pid = find_port_id(aid);
  }
  else{ //Niagara Support
    //target of interrupt can be any one of 32 cpus
    //Note: address is still used to determine the recipient of an INT
    if (find_range(addr) == ADDR_CONF) {
      aid = (addr >> 23) & 0x1f;
    } else {
      aid = (addr >> 36) & 0x1f;
    }
    pid = aid;
  }

  if (int_outgoing[pid]) {
    if (!int_outgoing[pid]->done) {
      dprintf(modname, 0, 0, "Attempted interrupt to port %d, for which there is all ready an outstanding interrupt. Interupt not issued.", pid);
      return 0;
    }
  }

  if (int_outgoing[pid]) {
    delete int_outgoing[pid];
  }
  int_outgoing[pid] = new Interrupt(aid, data, rep);

  return 1;
}


//------------------------------------------------------------------------------
// Receiving an interrupt packet.
// Niagara: SJM should never receive Interrupt, only INTACK or INTNACK
void InterruptControl::NewIncoming(int type, int src_id)
{
  int NiagaraIntMode = 1;

  if (type == T_INT) {
    //Niagara support: accept no interrupts;
    if(!NiagaraIntMode){
      dprintf(modname, 0, 0, "Receiving %s from port %d.", get_trans_string(type), src_id);
      if (int_pending) {
	if (int_pending->portID == src_id) {
	  // The same port sent an interrupt while we were all ready servicing an
	  // interrupt from that port.
	  dprintf(modname, 49, 0, "Port %d sent an interrupt and I haven't finished servicing and interrupt from the same port.", src_id);
	}
	// Send a NACK right away.
	dprintf(modname, 0, 0, "All ready servicing interrupt from port %d, sending NACK.", src_id);
	int_outgoing_trans = new Transaction(T_INTNACK, 0, src_id, 0, -1, 0);
	int_outgoing_trans->multi = 1;
      } else {
	int_pending = new Interrupt(src_id, 0);
	int_pending_data_in = 0;
      }
    } //if(!NiagaraIntMode)
  } else { 
  
    dprintf(modname, 0, 0, "Receiving %s from port %d.", get_trans_string(type), src_id);
    //Interrupt reponse
    int id ;
    if(!NiagaraIntMode){ //Niagara support
      id = find_port_id(src_id);
    }else{
      id = src_id; //Cpu id of the source, from Target Cpuid of INT transaction
    }
    if (!int_outgoing[id]) {
      dprintf(modname, 49, 0, "Received %s while no interrupt was issued to port %d.", get_trans_string(type), src_id);
    } else if (int_outgoing[id]->done) {
      dprintf(modname, 49, 0, "Received %s while no interrupt was issued to port %d.", get_trans_string(type), src_id);
    } else {
      int_outgoing[id]->response = type;
    }
  }
}


//------------------------------------------------------------------------------
// Add data to the pending interrupt.
void InterruptControl::NewData(ByteString *data)
{
  int NiagaraIntMode = 1;
  //Niagara Support: just drop this data
  if(NiagaraIntMode)
    return;

  if (!int_pending) {
    dprintf(modname, 49, 0, "CODE ERROR: Attempting to add interrupt data without having an interrupt pending.");
    return;
  }
  
  int_pending->data->Copy(int_pending_data_in * 16, 0, 16, data);
  int_pending_data_in++;
}


//------------------------------------------------------------------------------
// Check that the interrupt data matches.
ByteString *InterruptControl::CheckData()
{
  if (!int_data_valid) {
    return NULL;
  }

  int_data_valid = 0;
  return int_data_reg;
}


//------------------------------------------------------------------------------
// Check if any outstanding interrupt has been ACKed. Clears all interrupts that
// are done.
int InterruptControl::CheckForACK()
{
  int ret = 0;
  for (int i = 0; i < G_MAX_INT_TARGETS; i++) {
    if (int_outgoing[i]) {
      if (int_outgoing[i]->response == T_INTACK) {
	ret = 1;
	if (int_outgoing[i]->done) {
	  delete int_outgoing[i];
	  int_outgoing[i] = NULL;
	}
      }
    }
  }
  return ret;
}


//------------------------------------------------------------------------------
// Check if any outstanding interrupt has been NACKed.
int InterruptControl::CheckForNACK()
{
  for (int i = 0; i < G_MAX_INT_TARGETS; i++) {
    if (int_outgoing[i]) {
      if (int_outgoing[i]->response == T_INTNACK) {
	return 1;
      }
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Clock this controller. Returns a transaction if it is ready to issue one.
int InterruptControl::Cycle()
{
  float ack;

  if (!int_outgoing_trans) {
    for (int i = 0; i < G_MAX_INT_TARGETS; i++) {
      if (int_outgoing[i]) {
	if (!int_outgoing[i]->done) {
	  if (!int_outgoing[i]->issued) {
	    if (int_outgoing[i]->response == T_INTACK) {
	      // Repeating.
	      if (int_outgoing[i]->delaycnt < int_outgoing[i]->repeat) {
		int_outgoing[i]->delaycnt++;
		continue;
	      }
	      // Clear the repeat so it isn't repeated again.
	      int_outgoing[i]->repeat = 0;

	    } else if (int_outgoing[i]->response == T_INTNACK) {
	      // Retrying.
	      if (int_outgoing[i]->delaycnt < int_retry_delay) {
		int_outgoing[i]->delaycnt++;
		continue;
	      }
	      // Reset the delay.
	      if (int_random) {
		int_retry_delay = ((float) rand() / RAND_MAX) * int_max_delay;
		dprintf(modname, 25, 0, "int retry delay is %d", int_retry_delay);
	      }
	    }
	    int_outgoing[i]->issued = 1;
	    int_outgoing[i]->response = 0;
	    int_outgoing[i]->delaycnt = 0;
	    int_outgoing_trans = new Transaction(T_INT, 0, int_outgoing[i]->portID, 0, -1, 0);
	    int_outgoing_trans->data->Copy(int_outgoing[i]->data);
	    int_outgoing_trans->multi = 1;
	    int_num_outgoing++;
	    if (!pushOutgoingTrans()) {
	      return 0;
	    }

	  } else if (int_outgoing[i]->response == T_INTACK) {
	    if (!int_outgoing[i]->repeat) {
	      // We're done with this interrupt.
	      int_outgoing[i]->done = 1;
	    } else {
	      int_outgoing[i]->issued = 0;
	      int_outgoing[i]->response = 0;
	      int_outgoing[i]->delaycnt = 0;
	    }
	    int_num_outgoing--;
	  } else if (int_outgoing[i]->response == T_INTNACK) {
	    // Reissue this interrupt.
	    int_outgoing[i]->issued = 0;
	    int_outgoing[i]->delaycnt = 0;
	    int_num_outgoing--;
	  } else {
	    if (++int_outgoing[i]->timeoutcnt >= INT_timeout) {
	      dprintf("sjm_interrupt_timeout", 49, 0, "Timeout exceeded for entry %d, target port %d.", i, int_outgoing[i]->portID);
	      dprintf(modname, 0, 0, "Timeout exceeded interrupt to port %d.", int_outgoing[i]->portID);
	      delete int_outgoing[i];
	      int_outgoing[i] = NULL;
	    } 
	  }
	}
      }
    }

    // Process any incoming incoming interrupts.
    if (!int_outgoing_trans) {
      if (int_pending && (int_pending_data_in == 4)) {
	if (!int_pending->response) {
	  // Decide what to respond with.
	  int_pending->response = T_INTNACK;
	  if ((ack_mode == 2) && int_data_valid) {

	  } else {
	    if (ack_interval > 0) {
	      if (ack_count == 0) {
		int_pending->response = T_INTACK;
	      }
	      ack_count++;
	      if (ack_count >= ack_interval) {
		ack_count = 0;
	      }
	    } else {
	      ack = ((float) rand() / RAND_MAX);
	      if (ack <= ack_percentage) {
		int_pending->response = T_INTACK;
	      }
	    }
	  }
	  if (int_pending->response == T_INTACK) {
	    // Load the interrupt data register.
	    int_data_reg->Copy(int_pending->data);
	    int_data_valid = 1;
	  }
	  dprintf(modname, 21, 0, "Issued %s after %d cycles.", get_trans_string(int_pending->response), int_ack_delay);
	}
	// Check the delay.
	if (int_pending->delaycnt < int_ack_delay) {
	  int_pending->delaycnt++;
	} else {
	  // Reset the delay.
	  if (int_random) {
	    int_ack_delay = ((float) rand() / RAND_MAX) * int_max_delay;
	    dprintf(modname, 25, 0, "int ack delay is %d", int_ack_delay);
	  }

	  // Generate a transaction.
	  int_outgoing_trans = new Transaction(int_pending->response, 0, int_pending->portID, 0, -1, 0);
	  int_outgoing_trans->multi = 1;
	  if (pushOutgoingTrans()) {
	    delete int_pending;
	    int_pending = NULL;
	  } else {
	    return 0;
	  }
	}
      }
    }
  } else {
    return pushOutgoingTrans();
  }
  return 1;
}


//------------------------------------------------------------------------------
// Used by callers to see if this controller is done. It is done if it doesn't
// have any outgoing or incoming interrupts pending.
int InterruptControl::Done()
{
  if (!int_pending) {
    for (int i = 0; i < G_MAX_INT_TARGETS; i++) {
      if (int_outgoing[i]) {
	if (!int_outgoing[i]->done) {
	  return 0;
	}
      }
    }
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Add the outgoing transaction to the output queue, if possible.
int InterruptControl::pushOutgoingTrans()
{
  if (outq->Push(int_outgoing_trans)) {
    int_outgoing_trans = NULL;
  } else {
    dprintf(modname, 0, 0, "Outgoing queue is full.");
    return 0;
  }
  return 1;
}
