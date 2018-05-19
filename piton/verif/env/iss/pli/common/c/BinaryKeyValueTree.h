// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: BinaryKeyValueTree.h
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
// Description:  A binary tree that stores a key-value pair. The key is assumed
//               to be numerical (int, float, char, etc.).
//
//------------------------------------------------------------------------------

#include "BinaryTree.h"


#ifndef BINARYKEYVALUETREE_H
#define BINARYKEYVALUETREE_H

template<class T>
class KeyValueNode {
private:
  T key;
  void *value;

public:
  KeyValueNode(T k, void *v) {
    key = k;
    value = v;
  }
  T GetKey() { return key; }
  void *GetValue() { return value; }
};


template<class T>
class BinaryKeyValueTree : private BinaryTree< KeyValueNode<T> > {
public:
  typedef KeyValueNode<T> KVNode;

  int KVInsert(T k, void *v) {
    KVNode *n = new KVNode(k, v);
    int r = BinaryTree<KVNode>::Insert(n);
    if (!r) {
      delete n;
    }
    return r;
  }

  void *KVRemove(T k) {
    KVNode *n = new KVNode(k, NULL);
    KVNode *p = BinaryTree<KVNode>::Remove(n);
    delete n;
    return p->GetValue();
  }

  void *KVFind(T k) {
    KVNode *n = new KVNode(k, NULL);
    KVNode *p = BinaryTree<KVNode>::Find(n);
    delete n;
    if (p) {
      return p->GetValue();
    }
    return NULL;
  }

  int Compare(KVNode *d1, KVNode *d2) {
    if (d1->GetKey() < d2->GetKey()) {
      return LESS;
    }
    if (d1->GetKey() > d2->GetKey()) {
      return GREATER;
    }
    return EQUAL;
  }
};

#endif // BINARYKEYVALUETREE_H
