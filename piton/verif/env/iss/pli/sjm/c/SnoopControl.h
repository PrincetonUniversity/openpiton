// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: SnoopControl.h
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
// Description:  Snoop controller for SJM.
//
//------------------------------------------------------------------------------


#include "globals.h"
#include "JBus.h"
#include "Cache.h"

#ifndef SNOOPCONTROL_H
#define SNOOPCONTROL_H

class Snoop {
public:
  ull addr;
  int srcID;
  int orb_indx;
  int type;
  int own;

  Snoop() {
    addr = 0;
    srcID = -1;
    orb_indx = -1;
    own = 0;
  }
  Snoop(ull a, int id, int indx, int t, int o) {
    addr = a;
    srcID = id;
    orb_indx = indx;
    type = t;
    own = o;
  }
  Snoop(ull a, int id, int indx, int t) { 
    addr = a;
    srcID = id;
    orb_indx = indx;
    type = t;
  }
};

//CHANGED by DW 100200 - mark WRBCs with a cancel bit
class PackResult {
public:
  ull addr;
  byte must_snoop;
  int result;
  byte done;
  byte hold;
  byte cancel;

  PackResult() {
    addr = 0;
    must_snoop = 1;
    result = -1;
    done = 0;
    hold = 0;
    cancel = 0;
  }
  PackResult(ull a) {
    addr = a;
    must_snoop = 1;
    result = -1;
    done = 0;
    hold = 0;
    cancel = 0;
  }
  PackResult(ull a, byte s) {
    addr = a;
    must_snoop = s;
    result = -1;
    done = 0;
    hold = 0;
    cancel = 0;
  }
  PackResult(ull a, byte s, byte can) {
    addr = a;
    must_snoop = s;
    result = -1;
    done = 0;
    hold = 0;
    cancel = can;
  }
};


class SnoopControl{
private:
  static unsigned int snp_max_delay;

  char *modname;
  byte *liveports;
  Queue<Snoop> *snoopq;
  Queue<PackResult> *resultsq;
  Queue<int> *in_packq[G_MAXPORTS];
  Queue<int> *out_packq;
  // Pointers to other parts.
  Queue<Transaction> *outq;
  Queue<Transaction> *wrbq;
  Cache *cache;
  ReadOutBuffer *orb;

  // Delay information.
  int snp_delay;
  int snp_delaycnt;
  byte snp_random;

  // For the RTL display.
  int rtl_curr_packs_in[G_MAXPORTS];
  Snoop *rtl_curr_snoop;
  PackResult *rtl_curr_presult;
  int rtl_curr_pack_out;

  // Outgoing transaction.
  Transaction *snp_trans;

  // AOK information.
  byte memq_aok_off;
  byte snpq_aok_off;
  byte resq_aok_off;
  int snp_packs_in;
  // The AOK state of each port. If any one port has AOK off, all new
  // transactions are stopped.
  byte aok_halt[G_MAXPORTS];
  // Previos state of the consensus AOK.
  byte aok_prev;
  // Next state of the consensus AOK.
  byte aok_next;
  // The previos DOK state of each port. If a port has DOK off, all new
  // transactions to that port are stopped.
  byte dok_prev[G_MAXPORTS];
  // The next DOK stat of each port.
  byte dok_next[G_MAXPORTS];


  void initialize(char *, Queue<Transaction> *, Cache *, ReadOutBuffer *, byte *);

public:
  // Thrown if a bad plusarg was found.
  class BadSnpCtrlPlusArg { };

  SnoopControl(char *, Queue<Transaction> *, Queue<Transaction> *, Cache *, ReadOutBuffer *, byte *, LinkedList<PlusArg> *);
  ~SnoopControl();
  void Reset();
  void UpdatePacks(int *);
  int GetNextPack();
  void NewSnoop(ull, int, int, int, int, int, int);
  void AddPack(int);
  void UpdateMemqAokOffState(int);
  PackResult *GetPackResults();
  void ClearPackResults();
  int SnoopPending(ull, int);
  int SnoopPending(ull);
  int SnoopPending(int);
  int Cycle();
  Enumeration<Snoop> *SnoopQueue() { return (Enumeration<Snoop> *) snoopq->Elements(); }
  Enumeration<PackResult> *ResultsQueue() { return (Enumeration<PackResult> *) resultsq->Elements(); }
  Enumeration<int> *PackOutQueue() { return (Enumeration<int> *) out_packq->Elements(); }
  Enumeration<int> *PackQueue(int i) { return (Enumeration<int> *) in_packq[i]->Elements(); }
  int AOK();
  int DOK(int);
  int Done();
  char *RTLData();
};

#endif SNOOPCONTROL_H
