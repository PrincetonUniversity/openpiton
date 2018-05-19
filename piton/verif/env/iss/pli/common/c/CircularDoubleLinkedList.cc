// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: CircularDoubleLinkedList.cc
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
//------------------------------------------------------------------------------
//
// Description:  A circular doubly-linked list.
//
//------------------------------------------------------------------------------

#include "CircularDoubleLinkedList.h"

// CircularDoubleLinkedListEnum ------------------------------------------------------

//------------------------------------------------------------------------------
// Returns 1 if this enumeration hasn't reached the head of the list again.
template<class T> int CircularDoubleLinkedListEnum<T>::HasMoreElements()
{
  if (!start || ((ptr == start) && !first)) {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Returns a pointer to the current node and advances the pointer to the next
// node.
template<class T> void *CircularDoubleLinkedListEnum<T>::NextElement()
{
  if (ptr) {
    if ((ptr == start) && first) {
      first = 0;
    }
    cdll_node *p = ptr;
    ptr = p->next;
    return (void *) p->data;
  }
  return NULL;
}


// CircularDoubleLinkedList ----------------------------------------------------

//------------------------------------------------------------------------------
// Constructor. Creates and empty list.
template<class T> CircularDoubleLinkedList<T>::CircularDoubleLinkedList()
{
  head = NULL;
  tail = head;
  loc = head;
  size = 0;
}


//------------------------------------------------------------------------------
// Destructor.
template<class T> CircularDoubleLinkedList<T>::~CircularDoubleLinkedList()
{
  if (!Empty()) {
    cdll_node *p = head;
    while (p != tail) {
      loc = p->next;
      delete p;
      p = loc;
    }
    delete tail;
  }
}


//------------------------------------------------------------------------------
// Add a node to the end of the list.
template<class T> void CircularDoubleLinkedList<T>::Append(T *data)
{
  if (Empty()) {
    head = new cdll_node;
    head->data = (void *) data;
    head->prev = head;
    head->next = head;
    tail = head;
    loc = head;
  } else {
    cdll_node *p = new cdll_node;
    p->data = (void *) data;
    p->next = head;
    head->prev = p;
    p->prev = tail;
    tail->next = p;
    tail = p;
  }
  size++;
}


//------------------------------------------------------------------------------
// Add a node to the beginning of the list.
template<class T> void CircularDoubleLinkedList<T>::Prepend(T *data)
{
  if (Empty()) {
    Append(data);
  } else {
    cdll_node *p = new cdll_node;
    p->data = (void *) data;
    p->next = head;
    tail->next = p;
    head = p;
  }
  size++;
}


//------------------------------------------------------------------------------
// Insert a node after the location pointer.
template<class T> void CircularDoubleLinkedList<T>::Insert(T *data)
{
  //!!!
}


//------------------------------------------------------------------------------
// Modify the node currently pointed at by the location pointer. Returns 1 if
// successful, 0 otherwise.
template<class T> int CircularDoubleLinkedList<T>::Modify(T *data)
{
  if (!loc) {
    return 0;
  }
  loc->data = (void *) data;
  return 1;
}


//------------------------------------------------------------------------------
// Remove the node at the location pointer. Returns the data part of the node.
template<class T> T *CircularDoubleLinkedList<T>::Remove()
{
  if (Empty()) {
    return NULL;
  }

  cdll_node *p = loc;
  if (loc == head) {
    if (!loc->next) {
      // Removing the last element.
      head = null;
      tail = head;
      loc = head;
    } else {
      // Removing the head.
      head = loc->next;
      head->prev = tail;
      tail->next = head;
      loc = head;
    }
  } else if (loc == tail) {
    tail = loc->prev;
    tail->next = head;
    head->prev = tail;
    loc = tail;
  } else {
    loc = p->next;
    loc->prev = p->prev;
    p->prev->next = loc;
  }
  T *data = (T *) p->data;
  delete p;
  size--;
  return data;
}


//------------------------------------------------------------------------------
// Return the data part of the node currently pointed at by the location
// pointer.
template<class T> T *CircularDoubleLinkedList<T>::CurrentNode()
{
  if (Empty()) {
    return NULL;
  }
  return (T *) loc->data;
}


//------------------------------------------------------------------------------
// Moves the location pointer to the next node and returns the data part of
// that node.
template<class T> T *CircularDoubleLinkedList<T>::NextNode()
{
  if (Empty()) {
    return NULL;
  }
  cdll_node *n = loc;
  loc = n->next;
  return (T *) loc->data;
}


//------------------------------------------------------------------------------
// Moves the location pointer to the previous node and returns the data part of
// that node.
template<class T> T *CircularDoubleLinkedList<T>::PreviousNode()
{
  if (Empty()) {
    return NULL;
  }
  cdll_node *n = loc;
  loc = n->prev;
  return (T *) loc->data;
}


//------------------------------------------------------------------------------
// Returns 1 if the location pointer is pointing at the head of the list.
template<class T> int CircularDoubleLinkedList<T>::IsAtHead()
{
  if (loc == head) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Finds a node. Sets the location pointer to that node.
template<class T> int CircularDoubleLinkedList<T>::Find(T *data)
{
  //!!!
  return 0;
}


//------------------------------------------------------------------------------
// Returns an enumartion for this list.
template<class T> CircularDoubleLinkedListEnum<T> *CircularDoubleLinkedList<T>::Elements()
{
  CircularDoubleLinkedListEnum<T> *e = new CircularDoubleLinkedListEnum<T>(head);
  return e;
}


//------------------------------------------------------------------------------
// Checks if the list is empty.
template<class T> int CircularDoubleLinkedList<T>::Empty()
{
  if (head == NULL) {
    return 1;
  }
  return 0;
}
