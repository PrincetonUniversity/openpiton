// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ReadOutBuffer.h
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
// Description:  The outstanding read return buffer for SJM.
//
//------------------------------------------------------------------------------

#include "globals.h"
#include "JBus.h"
#include "Cache.h"
#include "RegisterFile.h"

#ifndef READOUTBUFFER_H
#define READOUTBUFFER_H

class ReadBuffEntry {
public:
  // Set if this entry is valid.
  short valid;
  // Expect a RDERR packet?
  byte expect_rderr;
  // If expect_rderr, which error code? READERR_TIMEOUT, READERR_BUSERR, READERR_UNMAPPED
  byte expected_rderr_type;
  // Type of the read.
  int type;
  // Address of the read.
  ull addr;
  // Byte mask, if any.
  short mask;
  // Data size.
  short dsize;
  // The incoming data.
  ByteString *indata;
  // The optional expected data.
  ByteString *expdata;
  // Set if expdata is valid.
  char dvalid;
  // Set if indata and expdata need to be compared.
  char compare;
  // Set if indata should be modified with expdata.
  char modify;
  // If this is set, the read is on the bus.
  short onbus;
  // Set if data has been returned from the bus.
  short dataret;
  // State with which it should be put into the cache.
  char cstate;
  // Set to the register in the register file the data needs to be copied to.
  int reg;
  // Set if this entry needs to set the ccr register.
  byte setcc;
  // Set if this entry is blocking snoops.
  byte blocking;
  // ECC bits.
  byte ecc[4];
  // Timeout counter.
  int timeoutcnt;

  ReadBuffEntry() {
    valid = 0;
    type = -1;
    expect_rderr = 0;
    expected_rderr_type = 0;
    addr = 0;
    mask = 0;
    dsize = 0;
    indata = new ByteString(64);
    expdata = new ByteString(64);
    dvalid = 0;
    compare = 0;
    modify = 0;
    onbus = 0;
    dataret = 0;
    cstate = -1;
    reg = -1;
    setcc = 0;
    blocking = 0;
    timeoutcnt = -1;
    for (int i = 0; i < 4; i++) {
      ecc[i] = 0;
    }
  }
  ReadBuffEntry(int t, ull a, int size, char st, int r, byte cc) {
    valid = 0;
    type = t;
    expect_rderr = 0;
    expected_rderr_type = 0;
    addr = a;
    mask = 0;
    dsize = size;
    cstate = st;
    dvalid = 0;
    compare = 0;
    modify = 0;
    onbus = 0;
    dataret = 0;
    reg = r;
    setcc = cc;
    blocking = 0;
    timeoutcnt = -1;
    for (int i = 0; i < 4; i++) {
      ecc[i] = 0;
    }
  }
  ~ReadBuffEntry() { delete indata; delete expdata; }
  void Clear() {
    valid = 0;
    type = -1;
    expect_rderr = 0;
    expected_rderr_type = 0;
    addr = 0;
    mask = 0;
    dsize = 0;
    indata->Clear();
    expdata->Clear();
    dvalid = 0;
    compare = 0;
    modify = 0;
    onbus = 0;
    dataret = 0;
    cstate = -1;
    reg = -1;
    setcc = 0;
    blocking = 0;
    timeoutcnt = -1;
    for (int i = 0; i < 4; i++) {
      ecc[i] = 0;
    }
  }

  int MatchAddress(ull ad) {
    if (valid && ((addr >> 6) == (ad >> 6))) {
      return 1;
    }
    return 0;
  }
  // Get a string representing a READERR packet type.
  static char *GetREADERRType(int rt) {
    switch (rt) {
    case READERR_TIMEOUT :
      return "a timeout";
    case READERR_BUSERR :
      return "a bus";
    case READERR_UNMAPPED :
      return "an unmapped";
    }
    // Niagara: Allowing invalid Read Data Error Types to enable
    // error testing.  A data parity error could cause a valid error
    // type to become invalid.  The jbi_checker will ensure that
    // the error types driven by the JBI are valid.
    // return NULL;
    return "an invalid";
  }
};


class ReadOutBuffer {
private:
  char *modname;
  //size of read bufer
  int readbuffersize;
  ReadBuffEntry *entries[G_READBUFFER_SIZE_MAX];
  // Pointers to other parts.
  Cache *cache;
  RegisterFile *regfile;
  int numvalid;

  // The timeout limit.
  int ORB_timeout;

public:
  void *snpctrl;

  ReadOutBuffer(char *, Cache *, RegisterFile *, int);
  ~ReadOutBuffer();

  static int CompareData(int);
  static int ModifyData(int);

  void Reset();
  int Add(ReadBuffEntry *);
  int Add(int, ull, int, char, int, byte);
  int AddData(int, ByteString*);
  void Remove(int);
  ReadBuffEntry *Get(int);
  int SetCompare(int);
  int SetModify(int);
  int UnsetModify(int);
  int SetOnBus(int);
  ull GetAddress(int);
  int Contains(ull);
  int BlockOn(ull);
  int OnBus(int);
  int OnBus(ull);
  int SetBlocking(void *);
  int IsBlocking(ull);
  void ReportError(int, byte);
  int Empty();
  int Full();
  void Cycle();
  void SetTimeout(int t) { ORB_timeout = t; }
  void ScaleTimeout(int t) { ORB_timeout *= t; }
  int ExpectErrorPkt(int indx, int rderr_type);
};

#endif // READOUTBUFFER_H
