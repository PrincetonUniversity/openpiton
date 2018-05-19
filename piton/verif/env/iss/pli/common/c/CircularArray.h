// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: CircularArray.h
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
// Description:  A circular array class.
//
//------------------------------------------------------------------------------

#include "CircularDoubleLinkedList.h"

#ifndef CIRCULAR_ARRAY_H
#define CIRCULAR_ARRAY_H

// Defines an index in the array.
template<class T>
class CircularArrayNode
{
public:
  int index;
  T data;

  CircularArrayNode<T>(int i, T d) { index = i; data = d; }
};


// The circular array class.
template<class T>
class CircularArray
{
private:
  CircularDoubleLinkedList< CircularArrayNode<T> > *list;
  int size;

  void checkIndex(int);
  CircularArrayNode<T> *find(int);

public:
  CircularArray(int);
  ~CircularArray();
  void Put(int, T);
  void Put(T);
  T Get(int);
  T Get();
  int GetIndex();
  void Clear(int);
  T Next();
  T Previous();
  int GetSize() { return size; }
};
#include "CircularArray.cc"
#endif // CIRCULAR_ARRAY_H
