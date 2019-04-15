// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: b_ary.h
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
#ifndef _B_ARY_H_
#define _B_ARY_H_
#define B_TREE_ORDER    2
#define B_TREE_MAX      2*B_TREE_ORDER
#define KeyType unsigned long long
#define ATOM_DATA_SIZE  64 //hold 64 bytes
#include <stdio.h>
#ifndef PITON_DPI
#include "veriuser.h"
#include "acc_user.h"
#endif // ifndef PITON_DPI
//declare B-tree atom
typedef struct b_tree_atom{
  unsigned long long key;
  int     size;
  //data type
  char    data[ATOM_DATA_SIZE+1];
}*b_tree_atom_ptr;

//delare B-tree node
typedef struct b_tree_node{
  int size;
  struct b_tree_atom* data [B_TREE_MAX+1];
  struct b_tree_node* child[B_TREE_MAX+2];
  struct b_tree_node* parent;
} *b_tree_node_ptr;

//define protype of b-tree.
#ifdef  __cplusplus
extern "C" {
#endif
  b_tree_node_ptr b_create();
  void b_copy(b_tree_node_ptr p, int pLo, int pHi,
	      b_tree_node_ptr q, int qLo, int qHi);
  int  b_scanNode(b_tree_node_ptr node, 
		  KeyType key, 
		  int* low);

  // used in recursive insert
  void b_addData(b_tree_atom_ptr atom,
		 int index,
		 b_tree_node_ptr* node,
		 b_tree_node_ptr* rp,
		 b_tree_atom_ptr* promoted);
  // used in insert
  void b_recursiveInsert(b_tree_node_ptr* node,
			 b_tree_atom_ptr* promoted,
			 b_tree_node_ptr* rp,
			 b_tree_atom_ptr* atom);
  void b_insert(b_tree_node_ptr* root, 
		b_tree_atom_ptr* atom);

  // used in update and from user
  b_tree_atom_ptr b_Find(b_tree_node_ptr* p,
			 KeyType* key);
#ifdef __cplusplus
}
#endif
#endif
