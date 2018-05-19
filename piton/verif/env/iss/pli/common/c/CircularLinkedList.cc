// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: CircularLinkedList.cc
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
// Description:  A circular linked list.
//
//------------------------------------------------------------------------------

#include "CircularLinkedList.h"

// CircularLinkedListEnum ------------------------------------------------------

//------------------------------------------------------------------------------
// Returns 1 if this enumeration hasn't reached the head of the list again.
template<class T> int CircularLinkedListEnum<T>::HasMoreElements()
{
  if (!start || ((ptr == start) && !first)) {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Returns a pointer to the current node and advances the pointer to the next
// node.
template<class T> void *CircularLinkedListEnum<T>::NextElement()
{
  if (ptr) {
    if ((ptr == start) && first) {
      first = 0;
    }
    cll_node *p = ptr;
    ptr = p->next;
    return (void *) p->data;
  }
  return NULL;
}


// CircularLinkedList ----------------------------------------------------------

//------------------------------------------------------------------------------
// Constructor. Creates and empty list.
template<class T> CircularLinkedList<T>::CircularLinkedList()
{
  head = NULL;
  tail = head;
  loc = head;
  size = 0;
}


//------------------------------------------------------------------------------
// Destructor.
template<class T> CircularLinkedList<T>::~CircularLinkedList()
{
  if (!Empty()) {
    cll_node *p = head;
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
template<class T> void CircularLinkedList<T>::Append(T *data)
{
  if (Empty()) {
    head = new cll_node;
    head->data = (void *) data;
    tail = head;
    tail->next = head;
    loc = head;
  } else {
    cll_node *p = new cll_node;
    p->data = (void *) data;
    p->next = head;
    tail->next = p;
    tail = p;
  }
  size++;
}


//------------------------------------------------------------------------------
// Add a node to the beginning of the list.
template<class T> void CircularLinkedList<T>::Prepend(T *data)
{
  if (Empty()) {
    Append(data);
  } else {
    cll_node *p = new cll_node;
    p->data = (void *) data;
    p->next = head;
    tail->next = p;
    head = p;
  }
  size++;
}


//------------------------------------------------------------------------------
// Insert a node after the location pointer, and moves the location pointer to
// the new node.
template<class T> void CircularLinkedList<T>::Insert(T *data)
{
  if (Empty()) {
    Append(data);
  } else {
    cll_node *p = new cll_node;
    p->data = (void *) data;
    p->next = loc->next;
    loc->next = p;
    if (loc == tail) {
      tail = p;
    }
    loc = p;
  }
  size++;
}


//------------------------------------------------------------------------------
// Modify the node currently pointed at by the location pointer. Returns 1 if
// successful, 0 otherwise.
template<class T> int CircularLinkedList<T>::Modify(T *data)
{
  if (!loc) {
    return 0;
  }
  loc->data = (void *) data;
  return 1;
}


//------------------------------------------------------------------------------
// Remove the node at the location pointer. Returns the data part of the node.
template<class T> T *CircularLinkedList<T>::Remove()
{
  if (Empty()) {
    return NULL;
  }

  cll_node *p = loc;
  if (loc == head) {
    if (!loc->next) {
      // Removing the last element.
      head = NULL;
      tail = head;
      loc = head;
    } else {
      // Removing the head.
      head = loc->next;
      loc = head;
      tail->next = head;
    }
  } else if (loc == tail) {
    //!!!
  } else {
    loc = p->next;
    loc = p;
  }
  T *data = (T *) p->data;
  delete p;
  size--;
  return data;
}


//------------------------------------------------------------------------------
// Return the data part of the node currently pointed at by the location
// pointer.
template<class T> T *CircularLinkedList<T>::CurrentNode()
{
  if (Empty()) {
    return NULL;
  }
  return (T *) loc->data;
}


//------------------------------------------------------------------------------
// Moves the location pointer to the next node and returns the data part of
// that node.
template<class T> T *CircularLinkedList<T>::NextNode()
{
  if (Empty()) {
    return NULL;
  }
  cll_node *n = loc;
  loc = n->next;
  return (T *) loc->data;
}


//------------------------------------------------------------------------------
// Returns 1 if the location pointer is pointing at the head of the list.
template<class T> int CircularLinkedList<T>::IsAtHead()
{
  if (loc == head) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Finds a node. Sets the location pointer to that node.
template<class T> int CircularLinkedList<T>::Find(T *data)
{
  //!!!
  return 0;
}


//------------------------------------------------------------------------------
// Returns an enumartion for this list.
template<class T> CircularLinkedListEnum<T> *CircularLinkedList<T>::Elements()
{
  CircularLinkedListEnum<T> *e = new CircularLinkedListEnum<T>(head);
  return e;
}


//------------------------------------------------------------------------------
// Checks if the list is empty.
template<class T> int CircularLinkedList<T>::Empty()
{
  if (head == NULL) {
    return 1;
  }
  return 0;
}
