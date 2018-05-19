// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ListTree.cc
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
// ListTree.cc
//
//
// DESCRIPTION: 
//
//------------------------------------------------------------------------------

#include "ListTree.h"

//------------------------------------------------------------------------------
// Constructor. Caller must give an exact depth, which is decremented by 1
// because indexing starts at 0.
ListTree::ListTree(int d)
{
  top = new DoubleLinkedList();
  depth = d - 1;
}


//------------------------------------------------------------------------------
// Destructor.
ListTree::~ListTree()
{

}


//------------------------------------------------------------------------------
// Insert data into the tree.
int ListTree::Insert(unsigned short *indexes, void *data)
{
  return doInsertion(top, indexes, data, 0);
}


//------------------------------------------------------------------------------/
// Remove an entry from the tree.
int ListTree::Remove(unsigned short *indexes)
{
  if (Empty()) {
    return 0;
  }
  return doRemoval(top, indexes, 0);
}


//------------------------------------------------------------------------------
// Find data in the tree.
void *ListTree::Find(unsigned short *indexes)
// void *ListTree::Find(int *indexes)
{
  DoubleLinkedList *list = top;
  void *ptr;

  for (int i = 0; i < depth; i++) {
    ptr = list->FindPtr(indexes[i]);
    if (!ptr) {
      return NULL;
    }
    list = (DoubleLinkedList *) ptr;
  }
  ptr = list->FindPtr(indexes[depth]);
  if (!ptr) {
    return NULL;
  }
  return ptr;
}


//------------------------------------------------------------------------------
// Checks if the tree is empty.
int ListTree::Empty()
{
  return top->Empty();
}


//------------------------------------------------------------------------------
// Print the contents of the tree.
char *ListTree::Print()
{
  if (Empty()) {
    return NULL;
  }
  return doPrint(top, 0);
}

//------------------------------------------------------------------------------
// Recursively insert into the tree. If a set of indexes all ready exists in the
// tree, the data is overwritten.
// int ListTree::doInsertion(DoubleLinkedList *list, void *data, int count)
int ListTree::doInsertion(DoubleLinkedList *list, unsigned short *keys, void *data, int count)
{
  // Check first if we've reached the bottom of the tree.
  if (count == depth) {
    list->Insert(keys[count], data);
    return 1;
  }

  DoubleLinkedList *sublist = (DoubleLinkedList *) list->FindPtr(keys[count]);
  void *ptr;
  if (!sublist) {
    // This index has not yet been inserted.
    sublist = new DoubleLinkedList();
    list->Insert(keys[count], (void *) sublist);
  }
  return doInsertion(sublist, keys, data, count + 1);
}


//------------------------------------------------------------------------------
// Recursively remove the list nodes that comprise an entry in the tree.
// int ListTree::doRemoval(DoubleLinkedList *list, int count)
int ListTree::doRemoval(DoubleLinkedList *list, unsigned short *keys, int count)
{
  if (count == depth) {
    return list->Remove(keys[count]);
  }

  DoubleLinkedList *sublist = (DoubleLinkedList *) list->FindPtr(keys[count]);
  if (!sublist) {
    return 0;
  }
  if (doRemoval(sublist, keys, count + 1)) {
    list->Remove(keys[count]);
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Recursively travel the whole tree and print the sublists.
char *ListTree::doPrint(DoubleLinkedList *list, int count)
{
  DoubleLinkedList *sublist;
  unsigned short *indexes;
  int size;
  int len = 0;
  int maxlen = 2048;
  char *outstr, *retstr, *padding;

  padding = new char[count];
//   for (int i = 0; i < count; i++) {
//     padding[i] = ' ';
//   }
  memset((void *) padding, ' ', count);
  padding[count] = NULL;
  outstr = new char[maxlen];
  sprintf(outstr, "%s%s\n", padding, list->Print());

  if (count == depth) {
    return outstr;
  }
  
  len += strlen(outstr);
  indexes = list->Walk();
  size = list->NumNodes();
  if (size == 0) {
    return NULL;
  }
  for (int j = 0; j < size; j++) {
    sublist = (DoubleLinkedList *) list->FindPtr(indexes[j]);
    retstr = doPrint(sublist, count + 1);
    if ((len + strlen(retstr)) > maxlen) {
      maxlen += 2048;
      outstr = (char *) realloc (outstr, maxlen);
    }
    sprintf(&outstr[len], "%s", retstr);
    len += strlen(retstr);
  }
  return outstr;
}
