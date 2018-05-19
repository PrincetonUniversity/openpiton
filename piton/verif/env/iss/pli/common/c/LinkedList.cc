// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: LinkedList.cc
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
//
// DESCRIPTION: A linked list that stores two pointers, a data object and an
// address.
//
//------------------------------------------------------------------------------

#include "LinkedList.h"

// LinkedListEnum --------------------------------------------------------------

//------------------------------------------------------------------------------
// Returns 1 if this enumeration has any nodes left.
template<class T> int LinkedListEnum<T>::HasMoreElements()
{
  if (ptr) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Returns a pointer to the current node and advanced the pointer to the next
// node. If there is no next node, the pointer is left pointing at NULL,
// signifying that there aren't any more elements.
template<class T> void *LinkedListEnum<T>::NextElement()
{
  if (ptr) {
    ll_node *p = ptr;
    ptr = p->next;
    return (void *) p->data;
  }
  return NULL;
}



// LinkedList ------------------------------------------------------------------

//------------------------------------------------------------------------------
// Constructor. Creates an empty list.
template<class T> LinkedList<T>::LinkedList()
{
  head = NULL;
  tail = head;
  loc = head;
  pre = NULL;
  size = 0;
}


//------------------------------------------------------------------------------
// Destructor.
template<class T> LinkedList<T>::~LinkedList()
{
  if (!Empty()) {
    ll_node *p = head;
    while (p != tail) {
      loc = p->next;
      delete p;
      p = loc;
    }
    delete tail;
  }
}


//------------------------------------------------------------------------------
// Add a node to the end of the list. The location and predecessor pointers are
// not changed.
template<class T> void LinkedList<T>::Append(T *data)
{
  if (Empty()) {
    head = new ll_node;
    head->data = (void *) data;
    head->next = NULL;
    tail = head;
    loc = head;
  } else {
    ll_node *p = new ll_node;
    p->data = (void *) data;
    p->next = NULL;
    tail->next = p;
    tail = p;
  }
  size++;
}


//------------------------------------------------------------------------------
// Add a node to the beginning of the list. Does an append if the list is
// empty. If the location pointer is at the head it stays put, but the
// predecessor pointer moves to the head.
template<class T> void LinkedList<T>::Prepend(T *data)
{
  if (Empty()) {
    Append(data);
  } else {
    ll_node *p = new ll_node;
    p->data = (void *) data;
    p->next = head;
    if (loc == head) {
      pre = head;
    }
    head = p;
    size++;
  }
}


//------------------------------------------------------------------------------
// Insert a node after the location pointer. Does an append if the list is
// empty. Moves the location pointer to the new node when finished.
template<class T> void LinkedList<T>::Insert(T *data)
{
  if (Empty() || loc == tail) {
    Append(data);
  } else {
    ll_node *p = new ll_node;
    p->data = (void *) data;
    p->next = loc->next;
    loc->next = p;
    pre = loc;
    loc = p;
    size++;
  }
}


//------------------------------------------------------------------------------
// Remove the node at the location pointer. Returns the data part of the node
// removed, NULL otherwise. If the tail is removed, the location pointer is
// moved back to the head.
template<class T> T *LinkedList<T>::Remove()
{
  if (Empty()) {
    return NULL;
  }
  
  ll_node *p = loc;
  if (loc == head) {
    // Removing the head.
    if (!loc->next) {
      // Removing the last element.
      head = NULL;
      tail = head;
      loc = head;
      pre = NULL;
    } else {
      loc = p->next;
      head = loc;
    }
  } else if (loc == tail) {
    // Removing the tail.
    tail = pre;
    tail->next = NULL;
    pre = NULL;
    loc = head;
  } else {
    loc = p->next;
    pre->next = loc;
  }
  T *data = (T *) p->data;
  delete p;
  size--;
  return data;
}


//------------------------------------------------------------------------------
// Clear all contets of this list.
template<class T> void LinkedList<T>::Clear()
{
  loc = head;
  while (!Empty()) {
    Remove();
  }
}


//------------------------------------------------------------------------------
// Returns the data of the node currently pointed at by the location pointer.
// Returns NULL if the list is empty.
template<class T> T *LinkedList<T>::CurrentNode()
{
  if (Empty()) {
    return NULL;
  }
  return (T *) loc->data;
}


//------------------------------------------------------------------------------
// Moves the location pointer to the next node and returns the data part of it.
// Returns NULL if the list is empty, or if the pointer can't be advanced.
template<class T> T *LinkedList<T>::NextNode()
{
  if (Empty() || (loc == tail)) {
    return NULL;
  }
  
  ll_node *n = loc;
  pre = loc;
  loc = n->next;
  return (T *) loc->data;
}


//------------------------------------------------------------------------------
// Returns 0 if the location pointer is at the end of the list, 0 otherwise.
template<class T> int LinkedList<T>::HasMoreNodes()
{
  if (Empty() || (loc == tail)) {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Finds a node. Sets the location pointer to that node and returns 1 if it is
// found. Returns 0 otherwise. The location pointer is left at the end of the
// list.
template<class T> int LinkedList<T>::Find(T *data)
{
  if (Empty()) {
    return 0;
  }

  loc = head;
  while (loc != tail) {
    if ((T *) loc->data == data ) {
      return 1;
    }
    pre = loc;
    loc = pre->next;
  }
  // If there's only one element, or we're at the tail.
  if ((T *) loc->data == data) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Return an enumeration.
template<class T> LinkedListEnum<T> *LinkedList<T>::Elements()
{
  LinkedListEnum<T> *e = new LinkedListEnum<T>(head);
  return e;
}


//------------------------------------------------------------------------------
// Checks if the list is empty.
template<class T> int LinkedList<T>::Empty()
{
  if (head == NULL) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Returns a string containing the elements of the list.
// template<class T> char *LinkedList<T>::Print()
// {
//   if (Empty()) {
//     return NULL;
//   }

//   int outsize = 1024;
//   char *output = new char[outsize];
//   char buf[32];
//   int len = 0;
//   ll_node *n, *p = head;
//   while (p != tail) {
//     sprintf(buf, "0x%x ", p->data);
//     sprintf(&output[len], "%s", buf);
//     len += strlen(buf);
//     // Make sure we're not going to exceed the size of the string.
//     if (len >= outsize) {
//       outsize += 1024;
//       output = (char *) realloc(output, outsize);
//     }
//     n = p->next;
//     p = n;
//   }
//   sprintf(buf, "0x%x", p->data);
//   sprintf(&output[len], "%s", buf);
//   len += strlen(buf);
//   output[len] = NULL;
//   return output;
// }
