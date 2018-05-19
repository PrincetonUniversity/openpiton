// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: CircularLinkedList.h
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
// Description:  A circular linked list.
//
//------------------------------------------------------------------------------

#include <string.h>
#include "Enumeration.h"

#ifndef CIRCULAR_LINKED_LIST_H
#define CIRCULAR_LINKED_LIST_H

typedef struct _cll_node {
  void *data;
  _cll_node *next;
} cll_node;


// An enumeration class for the list.
template<class T>
class CircularLinkedListEnum : private Enumeration<T> {
private:
  cll_node *start;
  cll_node *ptr;
  int first;

public:
  CircularLinkedListEnum(cll_node *h) { start = h; ptr = start; first = 1; }
  int HasMoreElements();
  void *NextElement();
};


// The circular linked list class.
template<class T>
class CircularLinkedList {
private:
  cll_node *head;
  cll_node *tail;
  cll_node *loc;
  int size;

public:
  CircularLinkedList();
  ~CircularLinkedList();
  void Append(T *);
  void Prepend(T *);
  void Insert(T *);
  int Modify(T *);
  T *Remove();
  void GoToHead() { loc = head; }
  T *CurrentNode();
  T *NextNode();
  int IsAtHead();
  int Find(T *);
  CircularLinkedListEnum<T> *Elements();
  int Empty();
  int Size() { return size; }
};

#endif // CIRCULAR_LINKED_LIST_H
