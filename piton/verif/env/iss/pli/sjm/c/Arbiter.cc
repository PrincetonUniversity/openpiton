// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Arbiter.cc
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
// Description:  Internal arbiter for SJM.
//
//------------------------------------------------------------------------------

#include "Arbiter.h"


//------------------------------------------------------------------------------
// Constructor.
Arbiter::Arbiter(char *name, int id)
{
  modname = new char[strlen(name)+1];
  strcpy(modname, name);
  arb_portID = id;

  arb_reqs_in_curr = new CircularArray<byte>(G_MAXPORTS);
  for (int i = 0; i < G_MAXPORTS; i++) {
    arb_reqs_in_next[i] = -1;
    arb_reqs_in_curr->Put(i, -1);
  }
  arb_grnt_next = 0;
  if (arb_portID != 0) {
    arb_grnt_next = G_MAXPORTS - arb_portID;
  }
  arb_grnt_curr = -1;
  arb_req_out = -1;

  arb_multiple = 0;
  arb_deadcycle = 1;
  arb_reset = 0;
}


//------------------------------------------------------------------------------
// Reset. Zero the request registers. Reset the grant to port 0.
void Arbiter::Reset()
{
  arb_req_out = 0;

  for (int i = 0; i < G_MAXPORTS; i++) {
    arb_reqs_in_next[i] = 0;
//     arb_reqs_in_curr->Put(i, 0);
  }
   // Set the initial grant state.
   if (arb_portID == 0) {
     arb_grnt_next = 0;
     arb_grnt_curr = 0;
   } else {
     arb_grnt_next = G_MAXPORTS - arb_portID;
   }
  arb_reset++;
}


//------------------------------------------------------------------------------
// Initiate arbitration. Must be called every cycle.
void Arbiter::Arbitrate(byte *newreqs)
{
  // Register the incoming requests. 0 is ours. Register the next grant signals.
  arb_reqs_in_curr->Put(0, arb_reqs_in_next[0]);
//     arb_reqs_in_next[0] = arb_req_out;
  arb_grnt_curr = arb_grnt_next;
  for (int i = 1; i < G_MAXPORTS; i++) {
    arb_reqs_in_curr->Put(i, arb_reqs_in_next[i]);
//       arb_reqs_in_next[i] = newreqs[i - 1];
  }
  if (arb_reset) {
    if (arb_reset == 3) {
      // Bypass the signals from the bus, for two cycles. Make it look like port 0
      // raised its request.
      if (arb_portID == 0) {
	arb_reqs_in_next[0] = 1;
      } else {
	arb_reqs_in_next[G_MAXPORTS - arb_portID] = 1;
      }
    }

    if (++arb_reset > 4) {
      arb_reset = 0;
    }
  } else {
    // Use the signals from the bus.
    arb_reqs_in_next[0] = arb_req_out;
    for (int i = 1; i < G_MAXPORTS; i++) {
      arb_reqs_in_next[i] = newreqs[i - 1];
    }
  }

  // Check if we need to hold the grant. If there is a request, and the
  // requestor is not the person who currently has the grant, then don't hold
  // the grant.
  int hold_grant = 1;
  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < G_MAXPORTS; i++) {
      if (arb_reqs_in_curr->Get(i) && (i != arb_grnt_curr)) {
	hold_grant = 0;
	break;
      }
    }
  }

  if (!hold_grant) {
    // Whoever has the grant now has the lowest priority. Begin checking at that
    // port.
    arb_reqs_in_curr->Get(arb_grnt_curr);
    // Figure out who is asking for the bus. No higher priority requests can be
    // active.
    do {
      if (arb_reqs_in_curr->Get()) {
	break;
      }
      arb_reqs_in_curr->Previous();
    } while (arb_reqs_in_curr->GetIndex() != arb_grnt_curr);
    arb_grnt_next = arb_reqs_in_curr->GetIndex();
  }
  dprintf(modname, 30, 0, "Index of next grant is %d", arb_grnt_next);

  // Reset the outgoing request. It's held for only one cycle, unless the port
  // is driving a multi-cycle transaction.
//   if ((arb_req_out == 1) && ((arb_deadcycle && (arb_grnt_next == 0)) ||
//                           (!arb_deadcycle && (arb_grnt_curr == 0)))) {
//     arb_req_out = 0;
//   }
}


//------------------------------------------------------------------------------
// Check if we have the grant. Grant is not given in the dead cycle.
int Arbiter::HasGrant()
{
  if ((arb_deadcycle && (arb_grnt_next == arb_grnt_curr) && (arb_grnt_curr == 0)) ||
      (!arb_deadcycle && (arb_grnt_next == 0))) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Check if we need to drive an idle packet.
int Arbiter::DriveIdle()
{
  if ((arb_deadcycle && (arb_grnt_curr == 0) && (arb_grnt_next == 0)) ||
      (!arb_deadcycle && (arb_grnt_next == 0))) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Request the bus.
int Arbiter::RequestBus(int multiple)
{
  arb_req_out = 1;
  arb_multiple = 0;
  if (multiple) {
    arb_multiple = multiple;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Request to hold the bus for back-to-back transactions.
int Arbiter::RequestToHoldBus()
{
  if (!HasGrant()) {
    return 0;
  }
  // Check if anyone else has asserted a request.
  for (int i = 1; i < G_MAXPORTS; i++) {
    if (arb_reqs_in_curr->Get(i)) {
      arb_req_out = 0;
      arb_multiple = 0;
      return 0;
    }
  }
  return 1;
}


//------------------------------------------------------------------------------
// Hold the bus, regardless of other requests. Only works if you all ready have
// the bus.
int Arbiter::HoldBus()
{
  if (!HasGrant()) {
    return 0;
  }
  arb_req_out = 1;
  return 1;
}


//------------------------------------------------------------------------------
// Release the request line.
int Arbiter::ReleaseBus()
{
  arb_req_out = 0;
  arb_multiple = 0;
  return 1;
}


//------------------------------------------------------------------------------
// Get the value of a particular incoming request.
byte Arbiter::GetReqIn(int i)
{
  if (i < arb_portID) {
    return arb_reqs_in_next[G_MAXPORTS - (arb_portID - i)];
  }
  return arb_reqs_in_next[i - arb_portID];
}


//------------------------------------------------------------------------------
// Check if any request is active.
int Arbiter::ReqActive()
{
  for (int i = 0; i < G_MAXPORTS; i++) {
    if (arb_reqs_in_next[i]) {
      return 1;
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Get the value of the grant, for the rtl interface.
char *Arbiter::RTLData()
{
  char *out = new char[(G_MAXPORTS * 2) + 10];

  int i = 0;
  for (int j = G_MAXPORTS - 1; j >= 0; i++, j--) {
    out[i] = '0';
    if (arb_grnt_curr == j) {
      out[i] = '1';
    }
  }
  out[i++] = ':';
  if (1) { // <--------------------------------------------------- compiler hack
    for (int j = G_MAXPORTS - 1; j >= 0; i++, j--) {
      out[i] = '0';
      if (arb_grnt_next == j) {
	out[i] = '1';
      }
    }
  }
  out[i++] = ':';
  if (HasGrant()) {
    out[i++] = '1';
  } else {
    out[i++] = '0';
  }
  out[i++] = ':';
  if (arb_deadcycle) {
    out[i++] = '1';
  } else {
    out[i++] = '0';
  }
  out[i++] = ':';
  if (arb_req_out) {
    out[i++] = '1';
  } else {
    out[i++] = '0';
  }
  out[i] = NULL;
  return out;
}
