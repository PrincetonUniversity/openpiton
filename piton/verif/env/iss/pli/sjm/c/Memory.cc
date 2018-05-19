// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Memory.cc
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
// Description:  Memory model.
//
//------------------------------------------------------------------------------

#include "Memory.h"


//------------------------------------------------------------------------------
// Default constructor. Assumes one address range.
template<class T> Memory<T>::Memory()
{
  mem_storage = new ListTree(16);
  mem_num = 1;
  mem_range = new Range*;
  mem_range[0] = NULL;
}


//------------------------------------------------------------------------------
// Constructor. Argument specifies number of address ranges.
template<class T> Memory<T>::Memory(int num)
{
  mem_storage = new ListTree(16);
  mem_num = num;
  mem_range = new Range*[mem_num];
  for (int i = 0; i < mem_num; i++) {
    mem_range[i] = NULL;
  }
}


//------------------------------------------------------------------------------
// Constructor, with a defined address range. Assumes one address range.
template<class T> Memory<T>::Memory(ull lo, ull hi)
{
  mem_storage = new ListTree(16);
  mem_num = 1;
  mem_range = new Range*;
  mem_range[0] = new Range(lo, hi);
}


//------------------------------------------------------------------------------
// Constructor, with a defined range. Assumes one address range.
template<class T> Memory<T>::Memory(Range *range)
{
  mem_storage = new ListTree(16);
  mem_num = 1;
  mem_range = new Range*;
  mem_range[0] = new Range(range->GetLo(), range->GetHi());
}


//------------------------------------------------------------------------------
// Destructor.
template<class T> Memory<T>::~Memory()
{
  delete mem_storage;
  for (int i = 0; i < mem_num; i++) {
    delete mem_range[i];
  }
  delete mem_range;
}


// //------------------------------------------------------------------------------
// // Set the address range. Returns 1 if the range is valid, 0 otherwise.i
// template<class T> int Memory<T>::SetRange(ull start, ull end)
// {
//   if (end < start) {
//     return 0;
//   }
//   delete mem_range;
//   mem_range = new Range(start, end);
//   return 1;
// }


// //------------------------------------------------------------------------------
// // Set the address range.
// template<class T> int Memory<T>::SetRange(Range *range)
// {
//   if (!range) {
//     return 0;
//   }
//   delete mem_range;
//   mem_range = range;
//   return 1;
// }


//------------------------------------------------------------------------------
// Write data into memory. Returns 1 if successful, 0 otherwise.
template<class T> int Memory<T>::Write(ull addr, T data)
{
//   if (!mem_range->InRange(addr)) {
//     return 0;
//   }
  if (!InRange(addr)) {
    return 0;
  }
  unsigned short indexes[16];
  translateAddr(addr, indexes);
  T *ptr = new T();
  *ptr = data;
  return mem_storage->Insert(indexes, (void *) ptr);
}


//------------------------------------------------------------------------------
// Read data from memory. Returns 0 if the data is not found.
template<class T> T Memory<T>::Read(ull addr)
{
//   if (!mem_range->InRange(addr)) {
//     return 0;
//   }
  if (!InRange(addr)) {
    return 0;
  }
  unsigned short indexes[16];
  translateAddr(addr, indexes);
  T *retdata = (T *) mem_storage->Find(indexes);
  if (!retdata) {
    return 0;
  }
  return *retdata;
}


//------------------------------------------------------------------------------
// Add an address range. Returns 0 if the maximum number of ranges has been
// exceeded, 1 otherwise.
template<class T> int Memory<T>::NewRange(ull lo, ull hi)
{
  for (int i = 0; i < mem_num; i++) {
    if (!mem_range[i]) {
      mem_range[i] = new Range(lo, hi);
      return 1;
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Add an address range. Returns 0 if the maximum number of ranges has been
// exceeded, 1 otherwise.
template<class T> int Memory<T>::NewRange(Range *rge)
{
  return NewRange(rge->GetLo(), rge->GetHi());
}


//------------------------------------------------------------------------------
// Checks if the given address is within any of the address ranges. Returns 1 if
// so, 0 otherwise.
template<class T> int Memory<T>::InRange(ull addr)
{
  for (int i = 0; i < mem_num; i++) {
    if (mem_range[i]) {
      if (mem_range[i]->InRange(addr)) {
	return 1;
      }
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Checks if the given address is within a specific address range. Returns 1 if
// so, 0 otherwise.
template<class T> int Memory<T>::InRange(int indx, ull addr)
{
  if (mem_range[indx]) {
    return mem_range[indx]->InRange(addr);
  }
  return 0;
}


//------------------------------------------------------------------------------
// Get a range.
template<class T> Range *Memory<T>::GetRange(int indx)
{
  if ((indx < 0) || (indx >= mem_num)) {
    return NULL;
  }
  if (!mem_range[indx]) {
    return NULL;
  }

  return mem_range[indx];
}


//------------------------------------------------------------------------------
// Translates an address to an array of ints.
template<class T> void Memory<T>::translateAddr(ull addr, unsigned short *indexes)
{
  for (int i = 15; i >= 0; i--) {
    indexes[i] = addr & 0xf;
    addr >>= 4;
  }
}
