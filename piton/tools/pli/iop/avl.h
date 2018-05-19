// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: avl.h
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

#ifndef _AVL_H_
#define _AVL_H_
#include "global.h"
typedef struct _avl_node {
  void *data;
  KeyType key;
  _avl_node *leftPtr;
  _avl_node *rightPtr;
  int  balance;
} avl_node, *avl_node_ptr;

template<class T> class avl{
private:
  avl_node *root;
  KeyType  minkey;
  int size, found;

  int difference(avl_node_ptr t_ptr);
  void rotate_right(avl_node_ptr* pivot_ptr);
  void rotate_left(avl_node_ptr* pivot_ptr);
  void balance_right(avl_node_ptr* t_ptr);
  void balance_left(avl_node_ptr* t_ptr);
  void fixFB(avl_node_ptr t_ptr);
  int  insert_avl_node(avl_node_ptr *t_ptr, T* item, KeyType key);
  T*   search_node(avl_node_ptr* t_ptr, KeyType *key);
  //delete function here
  void remove_node(avl_node_ptr* t_ptr, KeyType *key);
  T*   remove_min(avl_node_ptr* t_ptr);
public:
  avl();//constrcutor
  int insert(T* item, KeyType key);
  T* search(KeyType key);
  int remove(KeyType key);
};
#include "avl.cc"
#endif
