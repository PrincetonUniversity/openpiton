// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Vector.h
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
// Description:  A vector class. A vector is an array that grows in size.
//
//------------------------------------------------------------------------------

#include <stdlib.h>

#ifndef VECTOR_H
#define VECTOR_H


template<class T>
class Vector
{
private:
  T **data;
  int capacity;
  int last_index;
  int resize_val;

  void _vector_initialize(int, int);

public:
  Vector(int);
  Vector(int, int);
  ~Vector();
  void Add(T *);
  void Add(int, T *);
  T *Get(int);
  int GetIndex(T *);
  void SetSize(int);
  void Trim();

  // Checks if an index is valid.
  int Valid(int i) { return ((i < 0) || (i >= capacity)) ? 0 : 1; }
  // Returns the capacity.
  int Capacity() { return capacity; }
  // Returns the current size;
  int Size() { return last_index; }
};
#include "Vector.cc"
#endif // VECTOR_H
