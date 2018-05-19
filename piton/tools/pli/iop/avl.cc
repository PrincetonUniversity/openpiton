// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: avl.cc
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
#include "avl.h"
/*-------------------------------------------------------------------------------
   constructor
--------------------------------------------------------------------------------*/
template<class T>avl<T>::avl()
{
  root = 0;
}
/*-------------------------------------------------------------------------------
   check difference.
--------------------------------------------------------------------------------*/
template<class T> int  avl<T>::difference(avl_node_ptr t_ptr){
  int left, right;
  left  = -1;right = -1;

  if(t_ptr == 0)return 0;
  if(t_ptr->leftPtr  != 0)left  = t_ptr->leftPtr->balance;
  if(t_ptr->rightPtr != 0)right = t_ptr->rightPtr->balance;
  return (left - right);
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
template<class T> void  avl<T>::rotate_right(avl_node_ptr* pivot_ptr){
  avl_node_ptr t_ptr;
  
  if((*pivot_ptr) != 0){
    if((*pivot_ptr)->leftPtr != 0){
      t_ptr                 = (*pivot_ptr)->leftPtr;
      (*pivot_ptr)->leftPtr = t_ptr->rightPtr;
      t_ptr->rightPtr       = *pivot_ptr;
      *pivot_ptr            = t_ptr; // t_ptr becomes new root of this whole subtree.
    }
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
template<class T> void  avl<T>::rotate_left(avl_node_ptr* pivot_ptr){
  avl_node_ptr t_ptr;
  
  if((*pivot_ptr) != 0){
    if((*pivot_ptr)->rightPtr != 0){
      t_ptr                  = (*pivot_ptr)->rightPtr;
      (*pivot_ptr)->rightPtr = t_ptr->leftPtr;
      t_ptr->leftPtr         = *pivot_ptr;
      *pivot_ptr             = t_ptr; // t_ptr becomes new root of this whole subtree.
    }
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
template<class T> void  avl<T>::balance_right(avl_node_ptr* t_ptr){

  if(difference((*t_ptr)->rightPtr) == 0){
    rotate_left(&(*t_ptr));
    (*t_ptr)->balance--;
    (*t_ptr)->leftPtr->balance++;

  }
  else if(difference((*t_ptr)->rightPtr) < 0){
    rotate_left(&(*t_ptr));
    (*t_ptr)->leftPtr->balance -= 2;
  }
  else{
    rotate_right(&(*t_ptr)->rightPtr);
    rotate_left(&(*t_ptr));
    (*t_ptr)->balance++;
    (*t_ptr)->leftPtr->balance -= 2;
    (*t_ptr)->rightPtr->balance--;
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: rightPtr.
--------------------------------------------------------------------------------*/
template<class T> void  avl<T>::balance_left(avl_node_ptr* t_ptr){

  if(difference((*t_ptr)->leftPtr) == 0){
    rotate_right(&(*t_ptr));
    (*t_ptr)->balance--;
    (*t_ptr)->rightPtr->balance++;

  }
  else if(difference((*t_ptr)->leftPtr) < 0){
    rotate_right(&(*t_ptr));
    (*t_ptr)->rightPtr->balance -= 2;
  }
  else{
    rotate_left(&(*t_ptr)->leftPtr);
    rotate_right(&(*t_ptr));
    (*t_ptr)->balance++;
    (*t_ptr)->rightPtr->balance -= 2;
    (*t_ptr)->leftPtr->balance--;
  }
}
/*-------------------------------------------------------------------------------
   update balance.
--------------------------------------------------------------------------------*/
template<class T> void  avl<T>::fixFB(avl_node_ptr t_ptr){
  int left, right;

  left  = -1;
  right = -1;
  if(t_ptr->leftPtr  != 0)left  = t_ptr->leftPtr->balance;
  if(t_ptr->rightPtr != 0)right = t_ptr->rightPtr->balance;
  if(left > right)t_ptr->balance   = left + 1;
  else            t_ptr->balance   = right + 1;
}
/*-------------------------------------------------------------------------------
   write data into memory.
--------------------------------------------------------------------------------*/
template<class T> int  avl<T>::insert_avl_node(avl_node_ptr *t_ptr, 
					       T* item, 
					       KeyType key)
{
  if(*t_ptr == 0){//empty
    (*t_ptr)              = new avl_node;
    (*t_ptr)->data        = (void*) item;
    (*t_ptr)->leftPtr     = 0;
    (*t_ptr)->rightPtr    = 0;
    (*t_ptr)->balance     = 0;
    (*t_ptr)->key         = key;
    return (*t_ptr) ? 1 : 0;
  }
  else if(key == (*t_ptr)->key){//update
    (*t_ptr)->data  = (void*) item;
    return 1;
  }
  else{
    if(key < (*t_ptr)->key)insert_avl_node(&(*t_ptr)->leftPtr, item, key);
    else insert_avl_node(&(*t_ptr)->rightPtr,  item, key);
    fixFB(*t_ptr);
    if(difference(*t_ptr) > 1)       balance_left (&(*t_ptr));
    else if(difference(*t_ptr) < -1) balance_right(&(*t_ptr));
  }
}
/*-------------------------------------------------------------------------------
   write data into memory.
--------------------------------------------------------------------------------*/
template<class T> int  avl<T>::insert(T* item, KeyType key)
{
  return insert_avl_node(&root, item, key);
}
/*-------------------------------------------------------------------------------
search key recusively.
--------------------------------------------------------------------------------*/
template<class T> T* avl<T>:: search_node(avl_node_ptr* t_ptr, KeyType *key){

  if((*t_ptr)->key == *key){
    T *data  = (T *) (*t_ptr)->data;
    return data;
  }
  if((*t_ptr)->key > *key){
    if((*t_ptr)->leftPtr == 0)return 0;
    return search_node(&(*t_ptr)->leftPtr, key);
  }
  else{
    if((*t_ptr)->rightPtr == 0)return 0;
    return search_node(&(*t_ptr)->rightPtr, key);
  }
}
/*-------------------------------------------------------------------------------
search the node with key.
--------------------------------------------------------------------------------*/
template<class T> T* avl<T>:: search(KeyType key)
{
  if(root == 0)return 0;
  return search_node(&root, &key);
}
/*-------------------------------------------------------------------------------
search the node with key.
--------------------------------------------------------------------------------*/
template<class T> T* avl<T>:: remove_min(avl_node_ptr* t_ptr)
{
  if((*t_ptr)->leftPtr != 0)remove_min(&(*t_ptr)->leftPtr);
  else{
    avl_node_ptr  t_tmp = *t_ptr;
    T *data = (T*) (*t_ptr)->data;
    minkey  = (*t_ptr)->key;
    *t_ptr  = (*t_ptr)->rightPtr;
    delete t_tmp;
    return data;
  }
}
/*-------------------------------------------------------------------------------
search the node with key.
--------------------------------------------------------------------------------*/
template<class T> void avl<T>:: remove_node(avl_node_ptr* t_ptr, KeyType *key)
{
  if(*t_ptr !=0){
    if(*key < (*t_ptr)->key)remove_node(&(*t_ptr)->leftPtr, key);
    else if(*key > (*t_ptr)->key)remove_node(&(*t_ptr)->rightPtr, key);
    else if((*t_ptr)->leftPtr && (*t_ptr)->rightPtr){
      (*t_ptr)->data = remove_min(&(*t_ptr)->rightPtr);
      (*t_ptr)->key  = minkey;
      found          = 1;
    }
    else{
      avl_node_ptr t_tmp = *t_ptr;
      if(!(*t_ptr)->leftPtr && !(*t_ptr)->rightPtr)*t_ptr = 0;
      else if(!(*t_ptr)->leftPtr)*t_ptr = (*t_ptr)->rightPtr;
      else if(!(*t_ptr)->rightPtr)*t_ptr = (*t_ptr)->leftPtr;
      delete t_tmp;
      found = 1;
    }
    if(*t_ptr){
      fixFB(*t_ptr);
      if(difference(*t_ptr) > 1)balance_left(&(*t_ptr));
      else if(difference(*t_ptr) < -1)balance_right(&(*t_ptr));
    }
  }
}
/*-------------------------------------------------------------------------------
search the node with key.
--------------------------------------------------------------------------------*/
template<class T> int avl<T>:: remove(KeyType key)
{
  found = 0;
  remove_node(&root, &key);
  return found;
}
