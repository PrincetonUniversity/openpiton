// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: BinaryTree.cc
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
// Description:  A balanced, binary tree that stores arbitrary objects. Defined
//               as an abstract class; sublcasses must define Compare() method.
//
//------------------------------------------------------------------------------

#include "BinaryTree.h"

#ifdef DEBUG
#include <stdio.h>
#endif // DEBUG

// BinaryTreeEnum --------------------------------------------------------------

//------------------------------------------------------------------------------
// Constructor. Walks to the leftmost node.
template<class T> BinaryTreeEnum<T>::BinaryTreeEnum(BTNode<T> *t)
{
  ptr = t;
  while (ptr->left) {
    t = ptr->left;
    ptr = t;
  }
}


//------------------------------------------------------------------------------
// Returns 1 if there are still elements in the tree, 0 otherwise.
template<class T> int BinaryTreeEnum<T>::HasMoreElements()
{
  if (ptr) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Returns the current node and then advances the pointer to the next node.
template<class T> void *BinaryTreeEnum<T>::NextElement()
{
  BTNode<T> *p = ptr, *ret = ptr, *parent = NULL;

  if (!ptr) {
    return NULL;
  }

  parent = ptr->up;

  if (ptr->right) {
    // Must descend to the leftmost node of the right side.
    ptr = p->right;
    while (ptr->left) {
      p = ptr->left;
      ptr = p;
    }
  } else {
    // Walk back up the tree.
    while (parent) {
      if (ptr == parent->right) {
	ptr = parent;
	parent = ptr->up;
      } else {
	break;
      }
    }
    ptr = parent;
  }
  return (void *) ret->data;
}



// BinaryTree ------------------------------------------------------------------

//------------------------------------------------------------------------------
// Constructor.
template<class T> BinaryTree<T>::BinaryTree()
{
  top = NULL;
  rightcount = 0;
  leftcount = 0;
  leftmost = top;
  rightmost = top;
  loc = top;
}


//------------------------------------------------------------------------------
// Destructor.
template<class T> BinaryTree<T>::~BinaryTree()
{
  if (!Empty()) {
    doDelete(top);
  }
}


//------------------------------------------------------------------------------
// Insert a new node into the tree. Returns 0 if a node with that value all
// ready exists. Returns 1 otherwise.
template<class T> int BinaryTree<T>::Insert(T *d)
{
  if (Empty()) {
    top = new BTNode<T>(d);
    leftmost = top;
    rightmost = top;
    leftcount++;
  } else {
    if (!doInsertion(d, top)) {
      return 0;
    }
    if (Compare(d, top->data) == GREATER) {
      rightcount++;
    } else {
      leftcount++;
    }
  }
  if ((leftcount - rightcount) > 2) {
    promoteLeft();
  } else if ((rightcount - leftcount) >= 0) {
    promoteRight();
  }
#ifdef DEBUG
  printf("left: %d, right: %d\n", leftcount, rightcount);
#endif // DEBUG
  return 1;
}


//------------------------------------------------------------------------------
// Remove a node in the tree. If the node does not exist, returns NULL; returns
// the node otherwise.
template<class T> T *BinaryTree<T>::Remove(T *d)
{
  if (Empty()) {
    return NULL;
  }
  int pos = Compare(d, top->data);
  T *ret =  doRemoval(d, top);
  if (ret) {
    if (pos == LESS) {
      leftcount--;
    } else if (pos == GREATER) {
      rightcount--;
    } else {
      leftcount = 0;
      rightcount = 0;
      if (top) {
	leftcount++;
	resetLeftCount(top->left);
	resetRightCount(top->right);
      }
    }
    if (leftcount || rightcount) {
      while ((leftcount - rightcount) > 2) {
	promoteLeft();
      }
      while ((rightcount - leftcount) >= 0) {
	promoteRight();
      }
    }
  }
#ifdef DEBUG
  printf("left: %d, right: %d\n", leftcount, rightcount);
#endif // DEBUG
  return ret;
}


//------------------------------------------------------------------------------
// Remove a node from the tree, given it's key. Returns the data part of the
// node.
template<class T> T *BinaryTree<T>::Find(T *n)
{
  if (Empty()) {
    return NULL;
  }
  hops = -1;
  return doFind(n, top);
}


//------------------------------------------------------------------------------
// Return the data at the current node.
template<class T> T *BinaryTree<T>::CurrentNode()
{
  if (loc) {
    return loc->data;
  }
  return NULL;
}


//------------------------------------------------------------------------------
// Move the location pointer to the left node and return the data there. Returns
// NULL if there is no left node.
template<class T> T *BinaryTree<T>::LeftNode()
{
  BTNode<T> *p = loc;

  if (p) {
    if (p->left) {
      loc = p->left;
      return loc->data;
    }
  }
  return NULL;
}


//------------------------------------------------------------------------------
// Move the location pointer to the right node and return the data there.
// Returns NULL if there is no right node.
template<class T> T *BinaryTree<T>::RightNode()
{
  BTNode<T> *p = loc;

  if (p) {
    if (p->right) {
      loc = p->right;
      return loc->data;
    }
  }
  return NULL;
}


//------------------------------------------------------------------------------
// Move the location pointer to the parent node and return the data there.
// Returns NULL if there is not parent node.
template<class T> T *BinaryTree<T>::UpNode()
{
  BTNode<T> *p = loc;

  if (p) {
    if (p->up) {
      loc = p->up;
      return loc->data;
    }
  }
  return NULL;
}


//------------------------------------------------------------------------------
// Checks if the tree is empty.
template<class T> int BinaryTree<T>::Empty()
{
  if (top) {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Enumeration for the tree.
template<class T> BinaryTreeEnum<T> *BinaryTree<T>::Elements()
{
  BinaryTreeEnum<T> *en = new BinaryTreeEnum<T>(top);
  return en;
}


//------------------------------------------------------------------------------
// Recursive function to delete the tree.
template<class T> void BinaryTree<T>::doDelete(BTNode<T> *node)
{
  if (node->left) {
    doDelete(node->left);
  }
  if (node->right) {
    doDelete(node->right);
  }
  // Disconnect the nodes from above.
  if (node->up) {
    if (node == node->up->left) {
      node->up->left = NULL;
    } else {
      node->up->right = NULL;
    }
  }
  delete node;
}


//------------------------------------------------------------------------------
// Recursive function for inserting new node.
template<class T> int BinaryTree<T>::doInsertion(T *d, BTNode<T> *parent)
{
  BTNode<T> *node;
  if ((Compare(d, parent->data) == LESS) && !parent->left) {
    node = new BTNode<T>(d, parent);
    parent->left = node;
    if (parent->left == leftmost) {
      leftmost = node;
    }
  } else if ((Compare(d, parent->data) == GREATER) && !parent->right) {
    node = new BTNode<T>(d, parent);
    parent->right = node;
    if (parent->right == rightmost) {
      rightmost = node;
    }
  } else {
    if (Compare(d, parent->data) == LESS) {
      return doInsertion(d, parent->left);
    }
    if (Compare(d, parent->data) == GREATER) {
      return doInsertion(d, parent->right);
    }
    if (Compare(d, parent->data) == EQUAL) {
//       if (replace) {
//      node = new BTNode<T>(d);
//      if (parent->left) {
//        node->left = parent->left;
//        parent->left->up = node;
//      }
//      if (parent->right) {
//        node->right = parent->right;
//        parent->right->up = node;
//      }
//      if (parent->up) {
//        node->up = parent->up;
//        if (parent->up->left == parent) {
//          parent->up->left = node;
//        } else {
//          parent->up->right = node;
//        }
//      }
//      delete parent;
//       } else {
	return 0;
//       }
    }
  }
  return 1;
}


//------------------------------------------------------------------------------
// Recursive function for removing a node in the tree.
//!!!need to update leftmost and rightmost
template<class T> T* BinaryTree<T>::doRemoval(T *d, BTNode<T> *node)
{
  if ((Compare(d, node->data) == LESS) && node->left) {
    return doRemoval(d, node->left);
  }
  if ((Compare(d, node->data) == GREATER) && node->right) {
    return doRemoval(d, node->right);
  }
  if (Compare(d, node->data) == EQUAL) {
    BTNode<T> *parent = node->up;
    int isleft = 0;

    // Check if the node is left of another node.
    if (parent) {
      if (node == parent->left){
	isleft = 1;
      }
    }

    if (node->right) {
      // Always try and promote the right.
      if (node->left) {
	// Must find the leftmost node of right side of the removed node,
	// because that's where the left side of node will be attached.
	BTNode<T> *n,*p = node->right;
	while(p->left) {
	  n = p->left;
	  p = n;
	}
	p->left = node->left;
	node->left->up = p;
      }
      if (parent) {
	if (isleft) {
	  parent->left = node->right;
	} else {
	  parent->right = node->right;
	}
	node->right->up = parent;
      } else {
	node->right->up = NULL;
	top = node->right;
      }

    } else if (node->left) {
      // Removed node has left but no right, so promote the left.
      if (parent) {
	if (isleft) {
	  parent->left = node->left;
	} else {
	  parent->right = node->left;
	}
	node->left->up = parent;
      } else {
	node->left->up = NULL;
	top = node->left;
      }
    } else {
      // Node has neither left nor right.
      if (parent) {
	if (isleft) {
	  parent->left = NULL;
	} else {
	  parent->right = NULL;
	}
      } else {
	// Must be the top of the tree.
	top = NULL;
      }
    }
    if (loc == node) {
      if (node->up) {
	loc = node->up;
      }
    }
    return node->data;
  }
  return NULL;
}


//------------------------------------------------------------------------------
// Recursive function for finding a node in the tree.
template<class T> T *BinaryTree<T>::doFind(T *d, BTNode<T> *parent)
{
  hops++;
  if (Compare(d, parent->data) == EQUAL) {
#ifdef DEBUG
    printf("hops: %d\n", hops);
#endif // DEBUG
    loc = parent;
    return parent->data;
  }
  if ((Compare(d, parent->data) == LESS) && parent->left) {
    return doFind(d, parent->left);
  }
  if ((Compare(d, parent->data) == GREATER) && parent->right) {
    return doFind(d, parent->right);
  }
  return NULL;
}


//------------------------------------------------------------------------------
// The tree is unbalanced to the left, promote a node on the left side.
template<class T> void BinaryTree<T>::promoteLeft()
{
  BTNode<T> *p, *n, *newtop = top->left;

  // Find the rightmost node of the left node of the top.
  while (newtop->right) {
    p = newtop->right;
    newtop = p;
  }
  if (newtop != top->left) {
    newtop->up->right = NULL;
    // Find the leftmost node newtop.
    for (n = newtop; n->left;) {
      p = n->left;
      n = p;
    }
    n->left = top->left;
    top->left->up = n;
  }
  newtop->up = NULL;
  top->left = NULL;
  newtop->right = top;
  top->up = newtop;
  top = newtop;

  leftcount--;
  rightcount++;
}


//------------------------------------------------------------------------------
// The tree is unbalanced to the right, promote a node on the right side.
template<class T> void BinaryTree<T>::promoteRight()
{
  BTNode<T> *p, *n, *newtop = top->right;

  // Find the leftmost node of the right node of the top.
  while (newtop->left) {
    p = newtop->left;
    newtop = p;
  }
  if (newtop != top->right) {
    newtop->up->left = NULL;
    // Find the rightmost node of newtop.
    for (n = newtop; n->right;) {
      p = n->right;
      n = p;
    }
    n->right = top->right;
    top->right->up = n;
  }
  newtop->up = NULL;
  top->right = NULL;
  newtop->left = top;
  top->up = newtop;
  top = newtop;

  leftcount++;
  rightcount--;
}


//------------------------------------------------------------------------------
// Reset the left counter.
template<class T> void BinaryTree<T>::resetLeftCount(BTNode<T> *node)
{
  BTNode<T> *p;

  while(node) {
    leftcount++;
    if (node->right) {
      resetLeftCount(node->right);
    }
    p = node->left;
    node = p;
  }
}


//------------------------------------------------------------------------------
// Reset the right counter.
template<class T> void BinaryTree<T>::resetRightCount(BTNode<T> *node)
{
  BTNode<T> *p;

  while(node) {
    rightcount++;
    if (node->left) {
      resetRightCount(node->left);
    }
    p = node->right;
    node = p;
  }
}
