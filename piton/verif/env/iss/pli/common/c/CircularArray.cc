// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: CircularArray.cc
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
// Description:  A circular array class.
//
//------------------------------------------------------------------------------

#include "CircularArray.h"

//------------------------------------------------------------------------------
// Constructor. Must specify a size for the array. Creates an array with
// invalid entries.
template<class T> CircularArray<T>::CircularArray(int s)
{
  size = s;
  list = new CircularDoubleLinkedList< CircularArrayNode<T> >();
  CircularArrayNode<T> *node;
  for (int i = 0; i < size; i++){
    node = new CircularArrayNode<T>(i, NULL);
    list->Append(node);
  }
}


//------------------------------------------------------------------------------
// Destructor.
template<class T> CircularArray<T>::~CircularArray()
{
  delete list;
}


//------------------------------------------------------------------------------
// Put data into the array. Returns 1 if successful. Returns 0 if the requested
// index is out of range. Returns the a pointer to the old data.
template<class T> void CircularArray<T>::Put(int i, T d)
{
  checkIndex(i);
  CircularArrayNode<T> *node = find(i);
  node->data = d;
}


//------------------------------------------------------------------------------
// Put data into the array in the node currently pointed at by the list's
// location pointer. Returns a pointer to the old data.
template<class T> void CircularArray<T>::Put(T d)
{
  CircularArrayNode<T> *node = list->CurrentNode();
  T old = node->data;
  node->data = d;
}


//------------------------------------------------------------------------------
// Get data stored at the node indexed by i.
template<class T> T CircularArray<T>::Get(int i)
{
  checkIndex(i);
  CircularArrayNode<T> *node = find(i);
  return node->data;
}


//------------------------------------------------------------------------------
// Get the data at the node currently pointed at by the list's location
// pointer.
template<class T> T CircularArray<T>::Get()
{
  CircularArrayNode<T> *node = list->CurrentNode();
  return node->data;
}


//------------------------------------------------------------------------------
// Get the index of the node currently pointed at by the list's location
// pointer.
template<class T> int CircularArray<T>::GetIndex()
{
  CircularArrayNode<T> *node = list->CurrentNode();
  return node->index;
}


//------------------------------------------------------------------------------
// Clear an index in the array.
template<class T> void CircularArray<T>::Clear(int i)
{
  checkIndex(i);
  CircularArrayNode<T> *node = find(i);
  node->data = NULL;
}


//------------------------------------------------------------------------------
// Get the value of the current node and advance to the next node.
template<class T> T CircularArray<T>::Next()
{
  CircularArrayNode<T> *node = list->NextNode();
  return node->data;
}


//------------------------------------------------------------------------------
// Get the value of the current node and advance to the previous node.
template<class T> T CircularArray<T>::Previous()
{
  CircularArrayNode<T> *node = list->PreviousNode();
  return node->data;
}


//------------------------------------------------------------------------------
// Check if an index is valid.
template<class T> void CircularArray<T>::checkIndex(int i)
{
  if ((i < 0) || (i >= size)) {
    printf("index is out of range in CircularArray");
    exit(1);
  }
}


//------------------------------------------------------------------------------
// Find a node, given its index.
template<class T> CircularArrayNode<T> *CircularArray<T>::find(int i)
{
  CircularArrayNode<T> *node = list->CurrentNode();
  while (node->index != i) {
    node = list->NextNode();
  }
  return node;
}
