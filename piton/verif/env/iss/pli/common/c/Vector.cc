// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Vector.cc
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
// Description:  A vector class. A vector is an array that grows in size.
//
//------------------------------------------------------------------------------

#include "Vector.h"


//------------------------------------------------------------------------------
// Constructor. Specifies the initial size.
template<class T> Vector<T>::Vector(int init_size)
{
  _vector_initialize(init_size, -1);
}


//------------------------------------------------------------------------------
// Constructor. Specifies the initial size and the resize value.
template<class T> Vector<T>::Vector(int init_size, int increment)
{
  _vector_initialize(init_size, increment);
}


//------------------------------------------------------------------------------
// Destructor.
template<class T> Vector<T>::~Vector()
{
  delete data;
}


//------------------------------------------------------------------------------
// Add an element, which goes into the first empty slot.
template<class T> void Vector<T>::Add(T *d)
{
  if (last_index == capacity) {
    if (resize_val > 0) {
      // User preset the resize value.
      SetSize(capacity + resize_val);
    } else {
      // Default is to double the size.
      SetSize(capacity * 2);
    }
  }
  data[last_index++] = d;
}


//------------------------------------------------------------------------------
// Add an element at a particular index. Can only set an index that has
// previously been set.
template<class T> void Vector<T>::Add(int i, T *d)
{
  if ((i < 0) || (i > last_index)) {
    return;
  }
  data[i] = d;
}


//------------------------------------------------------------------------------
// Get the data at a particular index. Returns the data or NULL if the index is
// not valid.
template<class T> T *Vector<T>::Get(int i)
{
  if ((i < 0) || (i >= capacity)) {
    return NULL;
  }
  return data[i];
}


//------------------------------------------------------------------------------
// Get the index given the data. Returns the index or -1 if the data is not
// found.
template<class T> int Vector<T>::GetIndex(T *d)
{
  for (int i = 0; i < last_index; i++) {
    if (data[i] == d) {
      return i;
    }
  }
  return NULL;
}

//------------------------------------------------------------------------------
// Reset the capacity. If the new size is less than the current size, the
// vector is truncated.
template<class T> void Vector<T>::SetSize(int s)
{
  if (s == capacity) {
    return;
  }

  capacity = s;
  if (last_index > capacity) {
    last_index = capacity;
  }
  T** newdata = new T*[capacity];
  for (int i = 0; i < last_index; i++) {
    newdata[i] = data[i];
  }
  for (int j = last_index; j < capacity; j++) {
    newdata[j] = NULL;
  }
  delete data;
  data = newdata;
}


//------------------------------------------------------------------------------
// Trim the vector to its minimum size.
template<class T> void Vector<T>::Trim()
{
  SetSize(last_index);
}


//------------------------------------------------------------------------------
// Called by the constructors.
template<class T> void Vector<T>::_vector_initialize(int size, int incr)
{
  data = new T *[size];
  capacity = size;
  resize_val = incr;
  last_index = 0;

  for (int i = 0; i < capacity; i++) {
    data[i] = NULL;
  }
}
