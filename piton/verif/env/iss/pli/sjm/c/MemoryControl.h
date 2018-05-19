// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: MemoryControl.h
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
// Description:  Memory controller for SJM.
//
//------------------------------------------------------------------------------

#include <stdlib.h>
#include "globals.h"
#include "JBus.h"
#include "Memory.h"

#include "SnoopControl.h"

#ifndef MEMORYCONTROL_H
#define MEMORYCONTROL_H

#define MEM_READ 'r'
#define MEM_WRITE 'w'

#define MEM_IOSYNC_UKNOWN 0x0
#define MEM_IOSYNC_DONE   0x1
#define MEM_IOSYNC_WAIT   0x2
#define MEM_IOSYNC_NONE   0x3

class MemoryRequest {
public:
  char type;
  ull addr;
  int size;
  int srcID;
  int orb_indx;
  char cstate;
  short mask;
  byte compress;
  byte datain;
  ByteString *data;

  MemoryRequest() {
    type = -1;
    addr = 0;
    size = 0;
    srcID = -1;
    orb_indx = -1;
    cstate = -1;
    mask = 0;
    compress = 0;
    datain = 0;
  }
  MemoryRequest(char t, ull a, int s, int r, int indx, char st, short m) {
    type = t;
    addr = a;
    size = s;
    srcID = r;
    orb_indx = indx;
    cstate = st;
    mask = m;
    compress = 0;
    datain = 0;
    data = NULL;
  }
};



class MemoryControl {
private:
  static unsigned int mctl_max_delay;

  char *modname;
  Memory<int> *mem;
  Queue<MemoryRequest> *memq;
  Queue<MemoryRequest> *iomemq;
  LinkedList<ByteString> *dataq;
  int dataq_size;

  // IOSYNC address.
  ull mctl_iosync_addr;
  byte mctl_iosync_state;

  // Pointers to other queues.
  Queue<Transaction> *outq;
  SnoopControl *snpctrl;

  // Last transaction being issued by this controller.
  Transaction *lasttrans;
  // Set to which request queue we're waiting at.
  byte waitingat;
  // Set when the first compressible write comes in.
  byte mctl_compress;
  // Pointer to the last write transaction.
  MemoryRequest *lastwrite;

  // Delays.
  int rd_delay;
  int wr_delay;
  int rd_cnt;
  int wr_cnt;
  int io_rd_cnt;
  int io_wr_cnt;
  int io_rd_delay;
  int io_wr_delay;
  byte random;

  byte aok_on;
  byte dok_on;

  // Stores addresses that return read error packets.
  BinaryKeyValueTree<ull> *mctl_read_error_list;
  // Stores addresses that return alternate cache states.
  BinaryKeyValueTree<ull> *mctl_cache_state_list;

  void initialize(char *, int, Queue<Transaction> *outq, SnoopControl *);
  int addRequest(char, ull, int, int, int, char, short, int);
  int processRequest(MemoryRequest *, int *, int *, int *, int *, int);
  void processRead(MemoryRequest *);
  void processWrite(MemoryRequest *);

public:
  // Thrown if a bad plusarg was found.
  class BadMemCtrlPlusArg { };
  // Thrown if the iosync address is invalid.
  class AddressOutOFRange { };

  MemoryControl(char *, int, ull, Queue<Transaction> *, SnoopControl *, LinkedList<PlusArg> *);
  ~MemoryControl() { delete modname; delete mem; delete memq; delete iomemq; delete dataq; }
  void Reset();
  void SetMemdat(ull, LinkedList<int> *);
  int InRange(ull);
  int GetSyncState();
  ull ReadConfigAddress(int, int);
  void AddReadErrorAddress(ull, int);
  void RemoveReadErrorAddress(ull, int);
  void AddCacheStateAddress(ull, byte);
  void RemoveCacheStateAddress(ull, byte);
  int AddRequest(ull, int, int, int, char, short);
  int AddRequest(ull, int, int, short, int);
  int AddData(ByteString *);
  int Cycle();
  int Busy() { return lastwrite ? 1 : 0; }
  int Done() { return (memq->Empty() && iomemq->Empty()); }
  Enumeration<MemoryRequest> *MemoryQueue() { return (Enumeration<MemoryRequest> *) memq->Elements(); }
  Enumeration<MemoryRequest> *IOMemoryQueue() { return (Enumeration<MemoryRequest> *) iomemq->Elements(); }
  Enumeration<ByteString> *DataQueue() { return (Enumeration<ByteString> *) dataq->Elements(); }
  int DataQueueSize() { return dataq_size; }
};

#endif // MEMORYCONTROL_H
