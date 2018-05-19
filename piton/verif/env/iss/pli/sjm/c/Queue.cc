// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Queue.cc
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
// Description:  Generic queue that can be made FIFO or LIFO
//
//------------------------------------------------------------------------------

#include "Queue.h"

// QueueEnum -------------------------------------------------------------------

//------------------------------------------------------------------------------
// Returns 1 if there are more elements in the enumeration, 0 otherwise.
template <class T> int QueueEnum<T>::HasMoreElements()
{
  if (count <= size) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Returns the next element in the enumration.
template <class T> void *QueueEnum<T>::NextElement()
{
  count++;
  return (void *) en->NextElement();
}


// Queue -----------------------------------------------------------------------

//------------------------------------------------------------------------------
// Put data into the queue. Returns 1 if data added successfully, 0 if the queue
// is full.
template<class T> int Queue<T>::Push(T *data)
{
  if (Full()) {
    return 0;
  }

  if (style == Q_LIFO) {
    list->Prepend(data);
  } else {
    list->Append(data);
  }
  return 1;
}


//------------------------------------------------------------------------------
// Puts data at the front of the queue so that it will be the next entry to be
// popped. Returns 1 if successful, 0 if the queue is full.
template<class T> int Queue<T>::PriorityPush(T *data)
{
  if (Full()) {
    return 0;
  }

  // LIFO and FIFO treat this the same.
  list->Prepend(data);
  return 1;
}


//------------------------------------------------------------------------------
// Pop data out of the queue. Returns the data popped, NULl if the queue is
// empty.
template<class T> T *Queue<T>::Pop()
{
  if (Empty()) {
    return NULL;
  }

  // LIFO and FIFO treat this the same.
  list->GoToHead();
  return list->Remove();
}


//------------------------------------------------------------------------------
// Get the data at the head of the queue, without actually removing it. Returns
// NULL if the queue is empty.
template<class T> T *Queue<T>::Next()
{
  if (Empty()) {
    return NULL;
  }

  // LIFO and FIFO treat this the same.
  list->GoToHead();
  return list->CurrentNode();
}


//------------------------------------------------------------------------------
// Return an enumeration.
template<class T> QueueEnum<T> *Queue<T>::Elements()
{
  QueueEnum<T> *e = new QueueEnum<T>(list, size);
  return e;
}
