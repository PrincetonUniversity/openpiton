// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: LinkedList.h
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
// LinkedList.h
//
//
// DESCRIPTION: A linked list that stores two pointers, and address to a key and
// an address to a data object.
//
//------------------------------------------------------------------------------

// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
#include "Enumeration.h"

#ifndef LINKEDLIST_H
#define LINKEDLIST_H

typedef struct _ll_node {
  void *data;
  _ll_node *next;
} ll_node;



// An enumeration class for the linked list.
template<class T>
class LinkedListEnum : private Enumeration<T> {
private:
  ll_node *ptr;

public:
  LinkedListEnum(ll_node *h) { ptr = h; }
  int HasMoreElements();
  void *NextElement();
};



// The linked list class.
template<class T>
class LinkedList {
private:
  ll_node *head;
  ll_node *tail;
  ll_node *pre;
  ll_node *loc;
  int size;

public:
  LinkedList();
  ~LinkedList();
  void Append(T *);
  void Prepend(T *);
  void Insert(T *);
  T *Remove();
  void Clear();
  void GoToHead() { loc = head; pre = NULL; }
  T *CurrentNode();
  T *NextNode();
  int HasMoreNodes();
  int Find(T *);
  LinkedListEnum<T> *Elements();
  int Empty();
  int Size() { return size; }
//   char *Print();
};
#include "LinkedList.cc"
#endif // LINKEDLIST_H
