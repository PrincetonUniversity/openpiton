// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Cache.h
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
// Description:  Direct-mapped, configurable cache.
//
//------------------------------------------------------------------------------

#include <math.h>
#include "JBus.h"

#ifndef CACHE_H
#define CACHE_H

#define CSTATE_M 0x7
#define CSTATE_O 0x5
#define CSTATE_E 0x3
#define CSTATE_S 0x1
#define CSTATE_I 0x0


class CacheLine {
private:
  int width;

public:
  ull tag;
  ByteString *data;
  char state;

  CacheLine(int);
  ~CacheLine();
  int ChangeState(char);
  void PrintStateChange(int, char);
};



class Cache {
private:
  // The number of words in a line.
  int linewidth;
  // The number of lines (blocks) in the cache.
  int numlines;
  // Mask to get the offset bits.
  ull offsetmask;
  // Mask to get the index bits.
  ull indexmask;
  // Mask to get the tag bits.
  ull tagmask;
  // Number of bits to shift the index to make it a number.
  int indexshift;
  // Number of bits to shift the tag to make it a number.
  int tagshift;
  // The number of sets.
  int numsets;
  CacheLine **table;

  void initCache();

public:
  Cache();
  Cache(int);
  Cache(int, int);
  ~Cache();

  static char GetStateString(char);

  void Clear();
  int WriteLine(ull, ByteString *, char);
  int Write(ull, ByteString *, char);
  ByteString *ReadLine(ull);
  ByteString *Read(ull);
  ull GetAddress(ull);
  ull GetTag(ull);
  char GetState(ull);
  int ChangeState(ull, char);
  int Contains(ull);
  ull GetOffsetBits(ull ad) { return (ad & offsetmask); }
  ull GetIndexBits(ull ad) { return ((ad & indexmask) >> indexshift); }
  ull GetTagBits(ull ad) { return ((ad & tagmask) >> tagshift); }
};

#endif // CACHE_H
