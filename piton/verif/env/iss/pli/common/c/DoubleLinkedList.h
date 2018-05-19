// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: DoubleLinkedList.h
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
// DoubleLinkedList.h
//
//
// DESCRIPTION: Describes a doubly-linked list that stores two values, an
// unsigned short int and a void * pointer.
//
//------------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef DOUBLELINKEDLIST_H
#define DOUBLELINKEDLIST_H

typedef struct _dll_node {
  unsigned short data;
  void *ptr;
  _dll_node *prev;
  _dll_node *next;
} dll_node;


class DoubleLinkedList {
private:
  dll_node *head;
  dll_node *tail;
  dll_node *loc;
  int size;

  void removeNode();

public:
  DoubleLinkedList();
  ~DoubleLinkedList();
  int Insert(unsigned short, void *);
  int Remove(unsigned short);
  int Remove(void *);
  void *FindPtr(unsigned short);
  unsigned short FindData(void *);
  unsigned short *Walk();
  int Empty();
  int NumNodes();
  char *Print();
};

#endif // DOUBLELINKEDLIST_H
