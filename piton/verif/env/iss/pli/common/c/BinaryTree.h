// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: BinaryTree.h
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
//------------------------------------------------------------------------------
//
// Description:  A balanced, binary tree that stores arbitrary objects. Defined
//               as an abstract class; subclasses must define Compare() method.
//
//------------------------------------------------------------------------------

#include "Enumeration.h"

#ifndef BINARYTREE_H
#define BINARYTREE_H

#define LESS -1
#define EQUAL 0
#define GREATER 1

// Class for describing a node in the tree.
template<class T>
class BTNode {
public:
  T *data;
  BTNode *up;
  BTNode *left;
  BTNode *right;

  BTNode() {
    data = NULL;
    up = NULL;
    left = NULL;
    right = NULL;
  }
  BTNode(T *n) {
    data = n;
    up = NULL;
    left = NULL;
    right = NULL;
  }
  BTNode(T *n, BTNode *u) {
    data = n;
    up = u;
    left = NULL;
    right = NULL;
  }
};



// An enumeration class for the binary tree.
template<class T>
class BinaryTreeEnum : private Enumeration<T> {
private:
  BTNode<T> *ptr;

public:
  BinaryTreeEnum(BTNode<T> *t);
  int HasMoreElements();
  void *NextElement();
};



// The binary tree class.
template<class T>
class BinaryTree {
private:
  BTNode<T> *top;
  int leftcount;
  int rightcount;
  BTNode<T> *leftmost;
  BTNode<T> *rightmost;
  BTNode<T> *loc;
  int hops;

public:
  BinaryTree();
  ~BinaryTree();
  int Insert(T *);
  T *Remove(T *);
  T *Find(T *);
  T *CurrentNode();
  T *LeftNode();
  T *RightNode();
  T *UpNode();
  int Empty();
  BinaryTreeEnum<T> *Elements();

  // Go to the top of the tree.
  void GoToTop() { loc = top; }
  // Get the size of the tree.
  int Size() { return leftcount + rightcount; }

  // Returns 0 if the elements are equal, -1 if the first is less than the
  // second, 1 if the first is greater than the second.
  virtual int Compare(T *, T *) = 0;

private:
  void doDelete(BTNode<T> *);
  int doInsertion(T*, BTNode<T> *);
  T *doRemoval(T *, BTNode<T> *);
  T *doFind(T *, BTNode<T> *);
  void promoteLeft();
  void promoteRight();
  void resetLeftCount(BTNode<T> *);
  void resetRightCount(BTNode<T> *);
};
#include "BinaryTree.cc"
#endif // BINARYTREE_H
