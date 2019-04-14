// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: b_ary.c
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
#include <stdlib.h>
#include "b_ary.h"
/*--------------------------------------------
create b-tree
---------------------------------------------*/
b_tree_node_ptr b_create()
{
  int i;
  b_tree_node_ptr head;

  head  = (b_tree_node_ptr)malloc(sizeof(struct b_tree_node));
  for(i = 0; i < B_TREE_MAX+1; i++)head->child[i] = 0;
  head->size = 0;
  return head;
}
/*--------------------------------------------
copy data
---------------------------------------------*/
void b_copy(b_tree_node_ptr p, int pLo, int pHi,
	    b_tree_node_ptr q, int qLo, int qHi)
{
  int i;
  if(((pHi - pLo) == (qHi-qLo)) && (qLo <= qHi)){
    if(qLo < pLo){
      for(i = qLo; i <= qHi; i++){
	q->data[i]  = p->data [i-qLo+pLo];
	q->child[i] = p->child[i-qLo+pLo];
      }
    }
    else{
      for(i = qHi; i >= qLo; i--){
	q->data[i]  = p->data[ i-qHi+pHi];
	q->child[i] = p->child[i-qHi+pHi];
      }
    }
  }
}
/*--------------------------------------------
search for key k in node at node array
---------------------------------------------*/
int b_scanNode(b_tree_node_ptr node, KeyType key, int* low)
{
  int high, middle;

  *low = 0;
  high = node->size;
  while(*low < high){
    middle = (*low + high + 1) / 2;
    if(key < node->data[middle]->key)high = middle - 1;
    else *low = middle;
  }
  return (*low) && (node->data[*low]->key == key);
}
/*--------------------------------------------
insert atom a and pointer rp into data 
and child arrays of node at node.
---------------------------------------------*/
void b_addData(b_tree_atom_ptr  atom,
	       int              index,
	       b_tree_node_ptr* node,
	       b_tree_node_ptr* rp,
	       b_tree_atom_ptr* promoted)
{
  b_tree_node_ptr temp_ptr;
 
  if((*node)->size < B_TREE_MAX){//node is not yet full, just insert
    if(index < (*node)->size)b_copy(*node, index+1, (*node)->size, *node, index+2, (*node)->size+1);
    (*node)->size++;
    (*node)->data[index+1]  = atom;
    (*node)->child[index+1] = *rp;
    (*rp)                   = 0;
  }
  else{//no room for atom, must split node at node
    temp_ptr      = *rp;
    *rp           = (b_tree_node_ptr)malloc(sizeof(struct b_tree_node));
    (*rp)->size   = B_TREE_ORDER;
    (*node)->size = B_TREE_ORDER;
    (*rp)->parent = (*node)->parent;
    if(index <= B_TREE_ORDER){
      b_copy(*node, B_TREE_ORDER+1, B_TREE_MAX, *rp, 1, B_TREE_ORDER);
      if(index ==  B_TREE_ORDER){
	*promoted       = atom;
	(*rp)->child[0] = temp_ptr;
      }
      else {//put half at arrays in the right side.
	*promoted       = (*node)->data[B_TREE_ORDER];
	(*rp)->child[0] = (*node)->child[B_TREE_ORDER];
	b_copy(*node, index+1, B_TREE_ORDER-1, *node, index+2, B_TREE_ORDER);
	(*node)->data[index+1]  = atom;
	(*node)->child[index+1] = temp_ptr;
      }
    }
    else{
      (*rp)->child[0] = (*node)->child[B_TREE_ORDER+1];
      *promoted       = (*node)->data[B_TREE_ORDER+1];
      b_copy(*node, B_TREE_ORDER+2, index, *rp, 1, index-B_TREE_ORDER-1);
      (*rp)->data[index-B_TREE_ORDER]  = atom;
      (*rp)->child[index-B_TREE_ORDER] = temp_ptr;
      b_copy(*node, index+1, B_TREE_MAX, *rp, index-B_TREE_ORDER+1, B_TREE_ORDER);
    }
  }
}
/*--------------------------------------------
recursive insert
---------------------------------------------*/
void b_recursiveInsert(b_tree_node_ptr* node,
		       b_tree_atom_ptr* promoted,
		       b_tree_node_ptr* rp,
		       b_tree_atom_ptr* atom)
{
  int index;
  if(!b_scanNode(*node, (*atom)->key, &index)){
    if((*node)->child[index] == 0){//we're at a leaf.
      b_addData(*atom, index, node, rp, promoted);
    }
    else{
      b_recursiveInsert(&((*node)->child[index]), promoted, rp, atom);
      if(*rp){//update the parent node info.
	for(index = 0; index <= B_TREE_ORDER;index++){
	  if((*node)->child[index])(*node)->child[index]->parent = *node;
	  if((*rp)->child[index])(*rp)->child[index]->parent = *rp;
	}
	b_scanNode(*node, (*promoted)->key, &index);
	b_addData(*promoted, index, node, rp, promoted);
	if(*rp){//update the parent node info.
	  for(index = 0; index <= B_TREE_ORDER;index++){
	    if((*node)->child[index])(*node)->child[index]->parent = *node;
	    if((*rp)->child[index])(*rp)->child[index]->parent = *rp;
	  }
	}
      }
    }
  }
}
/*--------------------------------------------
insert B-tree

---------------------------------------------*/
void b_insert(b_tree_node_ptr* root, 
	      b_tree_atom_ptr* atom)
{
  b_tree_node_ptr rp, temp;
  b_tree_atom_ptr promoted;  
  rp = 0;
  b_recursiveInsert(root, &promoted, &rp, atom);
  if(rp){//Root was split, build new root
    temp              = *root;
    *root             = b_create();
    (*root)->size     = 1;
    (*root)->child[0] = temp;
    (*root)->data[1]  = promoted;
    (*root)->child[1] = rp;
  }
}
/*--------------------------------------------
search for key and return the pointer of data.
---------------------------------------------*/
b_tree_atom_ptr b_Find(b_tree_node_ptr* p,
		       KeyType* key)
{
  int index;

  while(!b_scanNode(*p, *key, &index)){
    if((*p)->child[index] == 0)return 0;
    else p = &((*p)->child[index]);
  }
  return (*p)->data[index];
}
