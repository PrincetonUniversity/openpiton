// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Queue.h
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
// Program File: @(#)Queue.h
// Version Date: 11/17/99
//
// Date:         05/18/99
// Description:  Generic queue that can be made FIFO or LIFO. The default
//               style is FIFO.
//
//------------------------------------------------------------------------------

#include "LinkedList.h"

#ifndef QUEUE_H
#define QUEUE_H

#define Q_FIFO 'f'
#define Q_LIFO 'l'

template<class T>
class QueueEnum : private Enumeration<T> {
private:
  LinkedListEnum<T> *en;
  int size;
  int count;

public:
  QueueEnum(LinkedList<T> *list, int s) { en = (LinkedListEnum<T> *) list->Elements(); size = s; count = 0; }
  ~QueueEnum() { delete en; }
  int HasMoreElements();
  void *NextElement();
};


template<class T>
class Queue {
private:
  char style;
  int size;
  LinkedList<T> *list;

public:
  Queue(int sz, char st) { style = st; size = sz; list = new LinkedList<T>(); }
  ~Queue() { delete list; }
  int Push(T *);
  int PriorityPush(T *);
  T *Pop();
  T *Next();
  QueueEnum<T> *Elements();
  int SpaceLeft() { return size - list->Size(); }
  int Empty() { return list->Empty(); }
  int Full() { if (size == list->Size()) return 1; return 0; }
  int Size() { return size; }
};
#include "Queue.cc"
#endif // QUEUE_H
