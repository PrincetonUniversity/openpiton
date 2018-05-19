// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: InterruptControl.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//------------------------------------------------------------------------------
//
// Description:  Interrupt controller for SJM.
//
//------------------------------------------------------------------------------

#include <stdlib.h>
#include <string.h>
#include "globals.h"
#include "JBus.h"

#ifndef INTTERTUPTCONTROL_H
#define INTTERTUPTCONTROL_H

#define G_MAX_INT_TARGETS 32  /*for Niagara support*/

class Interrupt {
public:
  // Sender if it's incoming, recipient if it's outgoing.
  int portID;
  // Mondo vector data.
  ByteString *data;
  // Number of cycles to wait to repeat.
  int repeat;
  // Set when the interrupt is on the bus.
  byte issued;
  // ACK or NACK.
  int response;
  // Counter for the repeat or retry cycles.
  int delaycnt;
  // Set once an ACK or NACK has been received.
  int done;
  // Timeout counter.
  int timeoutcnt;

  Interrupt(int id, ByteString *d, int r) {
    portID = id;
    data = new ByteString(*d);
    repeat = r;
    issued = 0;
    response = 0;
    delaycnt = 0;
    done = 0;
    timeoutcnt = 0;
  }
  Interrupt(int id, int r) {
    portID = id;
    data = new ByteString(64);
    repeat = r;
    issued = 0;
    response = 0;
    delaycnt = 0;
    done = 0;
    timeoutcnt = 0;
  }
  ~Interrupt() { delete data; }
};


class InterruptControl {
private:
  static unsigned int int_max_delay;

  char *modname;
  // Accept percentage.
  float ack_percentage;
  // Accept interval.
  int ack_interval;
  // Counter for the interval.
  int ack_count;
  // Accept mode.
  int ack_mode;

  // Interrupt data holding register.
  ByteString *int_data_reg;
  // Set if the holding register is valid.
  byte int_data_valid;
  // List of sent interrupts.
  Interrupt *int_outgoing[G_MAX_INT_TARGETS]; //Niagara support
  // The number of sent interrupts that haven't been responded to.
  int int_num_outgoing;
  // Received interrupt.
  Interrupt *int_pending;
  // Set if all the incoming interrupt data has been received.
  int int_pending_data_in;

  // Delay limits and counters.
  int int_ack_delay;
  int int_retry_delay;
  int int_random;

  // Pointer to the output queue.
  Queue<Transaction> *outq;

  // Outgoing transaction.
  Transaction *int_outgoing_trans;

  // Timeout limit.
  int INT_timeout;

  int pushOutgoingTrans();

public:
  // Thrown if a bad plusarg was found.
  class BadIntCtrlPlusArg { };

  InterruptControl(char *, Queue<Transaction> *, LinkedList<PlusArg> *);
  ~InterruptControl();
  void Reset();
  void SetAckPercentage(int);
  void SetAckInterval(int);
  void SetAckMode(int);
  int NewOutgoing(ull, ByteString *, int);
  void NewIncoming(int, int);
  void NewData(ByteString *);
  ByteString *CheckData();
  int CheckForACK();
  int CheckForNACK();
  int Cycle();
  int Done();
  int NumOutgoing() { return int_num_outgoing; }
  int CheckDataValid() { return int_data_valid; }
  void SetTimeout(int t) { INT_timeout = t; }
  void ScaleTimeout(int t) { INT_timeout *= t; }
};

#endif // INTTERTUPTCONTROL_H
