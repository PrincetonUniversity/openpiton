// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: DoubleLinkedList.cc
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
// DoubleLinkedList.cc
//
//
// DESCRIPTION: Describes a doubly-linked, ordered list that stores two values,
// an unsigned short int and an address, stored as a void *.
//
//------------------------------------------------------------------------------

#include "DoubleLinkedList.h"

//------------------------------------------------------------------------------
// Constructor. Initializes the list as empty.
DoubleLinkedList::DoubleLinkedList()
{
  head = NULL;
  tail = head;
  loc = head;
  size = 0;
}


//------------------------------------------------------------------------------
// Destructor.
DoubleLinkedList::~DoubleLinkedList()
{
  dll_node *p;

  if (!Empty()) {
    while(tail != head) {
      p = tail->prev;
      p->next = NULL;
      delete tail;
      tail = p;
    }
    delete head;
  }
}


//------------------------------------------------------------------------------
// Insert a node into the list. FindPtr is called to put the loc pointer at or
// near the node to be inserted; the function must then determine if the new
// node must go before or after loc. If the data has all ready been stored into
// the list, the ptr field is overwritten. Returns 1 if successful, 0 otherwise.
int DoubleLinkedList::Insert(unsigned short din, void *pin)
{
  // Inserting into an empty list.
  if (head == NULL) {
    head = new dll_node;
    head->data = din;
    head->ptr = pin;
    head->prev = NULL;
    head->next = NULL;
    tail = head;
    loc = head;
    size++;
  } else {
    dll_node *p;
    // Find the right location.
    void *pfound = FindPtr(din);
    if (!pfound) {
      // Insert after loc.
      p = new dll_node;
      p->data = din;
      p->ptr = pin;
      if (loc->data > din) {
	// Insert before loc.
	p->next = loc;
	// Inserting at the head.
	if (loc == head) {
	  p->prev = NULL;
	  loc->prev = p;
	  loc = p;
	  head = p;
	} else {
	  p->prev = loc->prev;
	  loc->prev->next = p;
	  loc->prev = p;
	  loc = p;
	}
      } else {
	// Inserting after loc.
	p->prev = loc;
	// Inserting at the tail.
	if (loc == tail) {
	  p->next = NULL;
	  loc->next = p;
	  loc = p;
	  tail = p;
	} else {
	  p->next = loc->next;
	  loc->next->prev = p;
	  loc->next = p;
	  loc = p;
	}
      }
      size++;
    } else {
      loc->ptr = pin;
    }
  }
  return 1;
}


//------------------------------------------------------------------------------
// Remove a node from the list. The node is indexed by it's data field. Returns
// 1 if successful, 0 if the node cannot be found and not removed. The loc
// pointer is moved the the node preceding the one being removed.
int DoubleLinkedList::Remove(unsigned short dout)
{
  if (!(FindPtr(dout))) {
    return 0;
  }
  removeNode();
  return 1;
}


//------------------------------------------------------------------------------
// Remove a node from the list. The node is indexed by it's pointer field.
// Returns 1 if successful, 0 if the node cannot be found and not removed.
int DoubleLinkedList::Remove(void *pout)
{
  unsigned int dfound = FindData(pout);

  // Must check that the node really wasn't found.
  if (loc->ptr != pout) {
    return 0;
  }
  removeNode();
  return 1;
}


//------------------------------------------------------------------------------
// Find a node in the list, given the data field. Returns the pointer field if
// found, NULL otherwise.
void *DoubleLinkedList::FindPtr(unsigned short dfind)
{
  dll_node *p;

  if (Empty()) {
    return NULL;
  }
  while (1) {
    if (loc->data == dfind) {
      return loc->ptr;
    }
    if (((loc->data > dfind) && (!loc->prev)) ||
	((loc->data < dfind) && (!loc->next))) {
      return NULL;
    }
    if (((loc->data < dfind) && (loc->next->data > dfind)) ||
	((loc->data > dfind) && (loc->prev->data < dfind))) {
      return NULL;
    }
    if (loc->data > dfind) {
      p = loc->prev;
      loc = p;
    } else if (loc->data < dfind) {
      p = loc->next;
      loc = p;
    }
  }
}


//------------------------------------------------------------------------------
// Find a node in the list, given the pointer field. Returns the data field if
// found, 0 otherwise. For this a linear search must be performed.
unsigned short DoubleLinkedList::FindData(void *pfind)
{
  dll_node *p = head;
  dll_node *n;

  if (Empty()) {
    return 0;
  }
  while (p->next) {
    if (p->ptr == pfind) {
      loc = p;
      return p->data;
    }
    n = p->next;
    p = n;
  }
  if (p->ptr == pfind) {
    return p->data;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Walk the list and return an array of its contents.
unsigned short *DoubleLinkedList::Walk()
{
  if (Empty()) {
    return NULL;
  }

  dll_node *p = head;
  dll_node *n;

  unsigned short *nodes =  new unsigned short[size];
  int i;
  for (i = 0; p != tail; p = n) {
    nodes[i++] = p->data;
    n = p->next;
  }
  nodes[i] = p->data;
  return nodes;
}

//------------------------------------------------------------------------------
// Returns 1 if the list is empty, 0 otherwise.
int DoubleLinkedList::Empty()
{
  if (head == NULL) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Returns the number of nodes in the list.
int DoubleLinkedList::NumNodes()
{
  return size;
}

//------------------------------------------------------------------------------
// Return the contents of the list as a string. Returns NULL if the list is
// empty.
char *DoubleLinkedList::Print()
{
  if (Empty()) {
    return NULL;
  }

  int outsize = 1024;
  char *output = new char[outsize];
  char buf[32];
  int len = 0;
  dll_node *p = head;
  dll_node *n;
  while (p->next) {
    sprintf(buf, "(%d, 0x%x) ", p->data, p->ptr);
    sprintf(&output[len], "%s", buf);
    len += strlen(buf);
    // Make sure we're not going to exceed the size of the string.
    if (len >= outsize) {
      outsize += 1024;
      output = (char *) realloc(output, outsize);
    }
    n = p->next;
    p = n;
  }
  sprintf(buf, "(%d, 0x%x)", p->data, p->ptr);
  sprintf(&output[len], "%s", buf);
  len += strlen(buf);
  output[len] = NULL;
  return output;
}


//------------------------------------------------------------------------------
// Removes a node from the list. Removes the node pointed at by loc.
void DoubleLinkedList::removeNode()
{
  if ((loc == head) && (loc == tail)) {
    // Removing last node.
    delete loc;
    head = NULL;
    tail = head;
    loc = head;
  } else if (loc == head) {
    // Removing the head.
    loc = head->next;
    loc->prev = NULL;
    delete head;
    head = loc;
  } else if (loc == tail) {
    // Removing the tail.
    loc = tail->prev;
    loc->next = NULL;
    delete tail;
    tail = loc;
  } else {
    dll_node *p = loc->prev;
    p->next = loc->next;
    loc->next->prev = p;
    free(loc);
    loc = p;
  }
  size--;
}
