// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: list.h
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

#ifndef _LIST_H_
#define _LIST_H_
#include "global.h"
typedef struct _ll_node {
  void *data;
  _ll_node *next;
  _ll_node *prev;
} ll_node;

template<class T> class List{
private:
  ll_node *head, *tail;
  ll_node *next_ptr, *current_ptr, *prev_ptr;
  int size;
public:
  List();//constrcutor
  T* shift();//pop element
  T* search();
  T* front();
  T* next();//return next item;
  int nextQ();

  T* current();
  T* back();
  void remove();
  void append(T* item);//push element
  int  empty(){return head ? 0 : 1;}//if empty, return 1;
  void set_next();
  void destroy();
};
#include "list.cc"
#endif
