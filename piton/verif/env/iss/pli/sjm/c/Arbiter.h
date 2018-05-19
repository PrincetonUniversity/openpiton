// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Arbiter.h
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
// Description:  Internal arbiter for SJM.
// Rewritten for new arbitration protocol. Requests are now active low.
//
//------------------------------------------------------------------------------

#include "globals.h"
#include "JBus.h"
#include "CircularArray.h"

#ifndef ARBITER_H
#define ARBITER_H

class Arbiter
{
private:
  char *modname;
  int arb_portID;
  // Incoming requests, including our own.
  byte arb_reqs_in_next[G_MAXPORTS];
  // Registered incoming requests, which are actually used.
  CircularArray<byte> *arb_reqs_in_curr;
  // The current request of this port.
  byte arb_req_out;
  // Who gets the grant next. Represents which index out of the incoming
  // requests.
  int arb_grnt_next;
  // Who has the grant now. Represents which index out of the incoming requests.
  int arb_grnt_curr;
  // Set if the req needs to be held for more than one cycle.
  byte arb_multiple;
  // Set if deadcycle mode is on.
  int arb_deadcycle;
  // Set if reset was just activated.
  byte arb_reset;

public:
  Arbiter(char *, int);
  ~Arbiter() { delete modname; }
  void Reset();
  void SetDeadcycleMode(int which) { arb_deadcycle = which; }
  void Arbitrate(byte *);
  int HasGrant();
  int DriveIdle();
  int RequestBus(int);
  int RequestToHoldBus();
  int HoldBus();
  int ReleaseBus();
  byte GetReqIn(int);
  int ReqActive();
  char *RTLData();
  byte GetReqOut() { return arb_req_out; }
};

#endif // ARBITER_H
