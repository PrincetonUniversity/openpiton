// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: CircularDoubleLinkedList.h
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
// Description:  A circular doubly-linked list.
//
//------------------------------------------------------------------------------

#include <string.h>
#include "Enumeration.h"

#ifndef CIRCULAR_DOUBLE_LINKED_LIST_H
#define CIRCULAR_DOUBLE_LINKED_LIST_H
#ifdef __ICARUS__
#define null NULL
#endif

typedef struct _cdll_node {
  void *data;
  _cdll_node *prev;
  _cdll_node *next;
} cdll_node;


// An enumeration class for the list.
template<class T>
class CircularDoubleLinkedListEnum : private Enumeration<T> {
private:
  cdll_node *start;
  cdll_node *ptr;
  int first;

public:
  CircularDoubleLinkedListEnum(cdll_node *h) { start = h; ptr = start; first = 1; }
  int HasMoreElements();
  void *NextElement();
};


// The circular linked list class.
template<class T>
class CircularDoubleLinkedList {
private:
  cdll_node *head;
  cdll_node *tail;
  cdll_node *loc;
  int size;

public:
  CircularDoubleLinkedList();
  ~CircularDoubleLinkedList();
  void Append(T *);
  void Prepend(T *);
  void Insert(T *);
  int Modify(T *);
  T *Remove();
  void GoToHead() { loc = head; }
  T *CurrentNode();
  T *NextNode();
  T *PreviousNode();
  int IsAtHead();
  int Find(T *);
  CircularDoubleLinkedListEnum<T> *Elements();
  int Empty();
  int Size() { return size; }
};
#include "CircularDoubleLinkedList.cc"
#endif // CIRCULAR_DOUBLE_LINKED_LIST_H
