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
/*--------------------------------------------
updated data at the target key.
---------------------------------------------*/
int b_update(b_tree_atom_ptr* atom,
	     b_tree_node_ptr* p)
{
  b_tree_atom_ptr t_ptr;
  if(t_ptr = (b_tree_atom_ptr)b_Find(p, &(*atom)->key)){
    //t_ptr->data = (*atom)->data;
    return 1;
  }
  return 0;
}
/*--------------------------------------------
recursive search for the target key
---------------------------------------------*/
int b_rmFind(b_tree_node_ptr* p,
	     b_tree_node_ptr* parent,
	     b_tree_atom_ptr* atom)
{
  int index;

  if(!b_scanNode(*p, (*atom)->key, &index)){
    if((*p)->child[index] == 0)return 0;
    else{
      parent = p;
      b_rmFind(&((*p)->child[index]), parent,  atom);
    }
  }
  else{
    return index + 1;
  }
}
/*--------------------------------------------
delete an element.
---------------------------------------------*/
int b_delete(b_tree_node_ptr* root,
	     KeyType key)
{
  b_tree_node_ptr *parent, *q, *p, temp_ptr;
  int index, pidx, i, j;

  p = root;
  //find the elment with key to be deleted.
  while(!b_scanNode(*p, key, &index)){
    if((*p)->child[index]== 0)return 0;
    p    = &((*p)->child[index]);
    pidx = index;
  }
  free((*p)->data[index]);//free the target node.
  if((*p)->child[0]){
    parent = p;
    p      = &((*p)->child[index]);//right subtree
    pidx   =  index;
    while((*p)->child[0]){
      p    = &((*p)->child[index]);
      pidx = 0;
    }
    //replace the deleted node with the leftmost element
    (*parent)->data[index] = (*p)->data[1];
    index = 1;
  }
  //get parent node
  while(1){
    if((*p)->size > B_TREE_ORDER || *parent == 0){
      if(*parent == 0 && (*parent)->size == 1){//b-tree is empty.
	free(*root);
	*root = b_create();
	return 1;
      }
      b_copy(*p, index+1, (*p)->size, *p, index, (*p)->size-1);
      (*p)->size--;
      if((*p)->size == 0)free(*p);//node is empty
      return 1;
    }
    else if(pidx && ((*parent)->child[pidx-1]->size > B_TREE_ORDER ||
		     (*parent)->size > pidx  && 
	             (*parent)->child[pidx+1]->size > B_TREE_ORDER) ||
	   !pidx && ((*parent)->child[pidx+1]->size > B_TREE_ORDER)){

      if(pidx && ((*parent)->child[pidx-1]->size > B_TREE_ORDER)){
	//removew an element from the left sibling.
	q = &((*parent)->child[pidx-1]);
	b_copy(*p, 1, index-1, *p, 2, index);
	(*p)->child[1] = (*p)->child[0];
	(*p)->data[1]  = (*parent)->data[pidx];
	(*p)->child[0] = (*q)->child[(*q)->size];
	if((*p)->child[0])(*p)->child[0]->parent = *p;
	//replace the parent element with element borrowed from the rhn.
	(*parent)->data[pidx] = (*q)->data[(*q)->size];
	(*q)->size--;
      }
      else {
	//remove an element from the right sibling.
	pidx++;
	q    = &((*parent)->child[pidx]);
	b_copy(*p, index+1, (*p)->size, *p, index, (*p)->size -1);
	(*p)->data[(*p)->size]  = (*parent)->data[pidx];
	(*p)->child[(*p)->size] = (*q)->child[0];
	if((*p)->child[(*p)->size])(*p)->child[(*p)->size]->parent = *p;
	(*parent)->data[pidx] = (*q)->data[1];
	(*q)->child[0]        = (*q)->child[1];
	//shift one to left.
	b_copy(*q, 2, (*q)->size, *q, 1, (*q)->size-1);
	(*parent)->size--;
      }
      return 1;
    }
    else{//merge the right and left node.
      if(pidx == 0 || (*parent)->size > pidx){//merge the right sibling
	pidx++;
	q = &((*parent)->child[pidx]);
	//shift the deleted node to right.
	b_copy(*p, index+1, (*p)->size, *p, index, (*p)->size-1);
	(*p)->data[(*p)->size] = (*parent)->data[pidx];
	//copy the right node to the left node.
	(*p)->child[(*p)->size] = (*parent)->child[0];
	if((*p)->child[(*p)->size])(*p)->child[(*p)->size]->parent = *p;
	j = 1;
	for(i = (*p)->size+1; i <= (*p)->size+(*q)->size;i++){
	  (*p)->data[i]  = (*q)->data[j];
	  (*p)->child[i] = (*q)->child[j++];
	  if((*p)->child[i])(*p)->child[i]->parent = *p;
	}
	(*p)->size += (*q)->size;
	free(*q);
      }
      else{//merged the left sibling
	q = &((*parent)->child[pidx-1]);//get the left sibling
	//shift the deleted node to right
	b_copy(*p, index+1, (*p)->size, *p, (*q)->size+index+1, (*p)->size+(*q)->size);
	b_copy(*p, 1, index-1, *p, (*q)->size+2, (*q)->size+index);
	(*p)->child[(*q)->size+1] = (*p)->child[0];
	(*p)->data[(*q)->size+1]  = (*parent)->data[pidx];
	//copy the right node to the left node.
	b_copy(*q, 1, (*q)->size, *p, 1, (*q)->size);
	(*p)->child[0] = (*q)->child[0];
	for(i = 0; i <= (*q)->size;i++)if((*p)->child[0])(*p)->child[0]->parent = *p;
	(*p)->size += (*q)->size;	
	free(*q);
	(*parent)->child[pidx-1] = *p;	
      }
    }
    if((*parent)->size > B_TREE_ORDER){
      //shift one node to left.
      b_copy(*parent, pidx+1, (*parent)->size, *parent, pidx, (*parent)->size-1);
      (*parent)->size--;
      return 1;
    }
    //immediate parent less than order.
    temp_ptr = *p;
    index    = pidx;
    p        = &((*p)->parent);
    parent   = &((*p)->parent);
    if((*parent == 0) && ((*p)->size == 1)){
      free(*root);
      temp_ptr->parent = 0;
      *root            = temp_ptr;
      return 1;
    }
    //find the next parent index
    if(*parent){
      for(pidx = 0; pidx < (*parent)->size;pidx++)
	if((*parent)->data[pidx+1]->key > (*p)->data[index]->key)break;
    }
  }
}
