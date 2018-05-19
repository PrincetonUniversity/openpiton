// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: list.cc
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
/*******************************************************************************
    list.c
*********************************************************************************/
#include "list.h"
/*--------------------------------------------
  constructor
---------------------------------------------*/
template<class T> List<T>::List()
{
  head = 0;
  tail = 0;
  size = 0;
}
/*--------------------------------------------
  shift an element on the top list.
---------------------------------------------*/
template<class T> T* List<T>::shift()
{
  if(head == 0)return 0;
  ll_node *p;
  
  p          = head;
  head       = p->next;
  T *data    = (T *) p->data;
  delete p;
  size--;
  return data;
}
/*--------------------------------------------
destroy the list.
---------------------------------------------*/
template<class T> void List<T>::destroy()
{
  ll_node *p;

  while(head){
    p        = head;
    head     = p->next;
    delete p;
    size--;
  }
}
/*--------------------------------------------
  shift an element on the top list.
---------------------------------------------*/
template<class T> T* List<T>::search()
{
  if(head == 0)return 0;
  ll_node *p;
  
  p          = head;
  head       = p->next;
  T *data  = (T *) p->data;
  delete p;
  size--;
  return data;
}
/*--------------------------------------------
  return the first item
---------------------------------------------*/
template<class T> T* List<T>::front()
{
  if(head == 0)return 0;
  ll_node *p;
  
  p        = head;
  T *data  = (T *) p->data;
  return data;
}
/*--------------------------------------------
  return the next item.
---------------------------------------------*/
template<class T> T* List<T>::next()
{
  if(next_ptr == 0)return 0;
  ll_node *p;
  p        = next_ptr;
  T *data  = (T *) p->data;
  next_ptr = next_ptr->next;
  return data;
}
/*--------------------------------------------
  return the next item.
---------------------------------------------*/
template<class T>void List<T>::set_next()
{
  current_ptr = head;
}
/*--------------------------------------------
  return the item which is pointer by current_ptr.
---------------------------------------------*/
template<class T> T* List<T>::current()
{
  if(current_ptr == 0)return 0;
  if(current_ptr->data){
    T *data  = (T *) current_ptr->data;
    return data;
  }
  return 0;
}
/*--------------------------------------------
  return the item which is pointer by current_ptr.
---------------------------------------------*/
template<class T> int List<T>::nextQ()
{
  if(current_ptr == 0)return 0;
  current_ptr = current_ptr->next;
  return 1;
}
/*--------------------------------------------
  remove item which is selected by current_ptr.
---------------------------------------------*/
template<class T> void List<T>::remove()
{
  ll_node *p;
  if(head == current_ptr)head = current_ptr->next;
  if(tail == current_ptr)tail = current_ptr->prev;
  p           = current_ptr;
  current_ptr = current_ptr->next;
  if(current_ptr)current_ptr->prev = p->prev;
  size--;
  delete p;
}
/*--------------------------------------------
  return the last item
---------------------------------------------*/
template<class T> T* List<T>::back()
{
  if(head == 0)return 0;
  ll_node *p;
  
  p        = tail;
  T *data  = (T *) p->data;
  return data;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
template<class T> void List<T>::append(T* item)
{

  if(head == 0){
    head       = new ll_node;
    head->data = (void*) item;
    head->next = 0;
    head->prev = 0;
    tail       = head;
   }
  else{ 
    ll_node *p = new ll_node;
    p->data    = (void *)item;
    p->next    = 0;
    p->prev    = tail;
    tail->next = p;
    tail       = p;
  }
  size++;
}
