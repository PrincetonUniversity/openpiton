// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Memory.h
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
// Description:  Memory model.
// Rewritten as template so that it can store either 32-bit or 64-bit words.
//
//------------------------------------------------------------------------------

#include <ctype.h>
#include "ListTree.h"
#include "Range.h"

#ifndef MEMORY_H
#define MEMORY_H

typedef unsigned long long ull;

template<class T>
class Memory {
private:
  ListTree *mem_storage;
  Range **mem_range;
  int mem_num;

  void translateAddr(ull, unsigned short *);

public:
  Memory();
  Memory(int);
  Memory(ull, ull);
  Memory(Range *);
  ~Memory();
//   int SetRange(ull, ull);
//   int SetRange(Range *);
  int Write(ull, T);
  T Read(ull);
  int NewRange(ull, ull);
  int NewRange(Range *);
  int InRange(ull);
  int InRange(int, ull);
  Range *GetRange(int);
};
#include "Memory.cc"
#endif // MEMORY_H
