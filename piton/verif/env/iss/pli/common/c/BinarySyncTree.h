// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: BinarySyncTree.h
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
// Description:  Binary tree for the SynchronizedObject class. Used when the
//               synchronization key is numerical (int, float, char, etc).
//
//------------------------------------------------------------------------------

#include "BinaryTree.h"
#include "SynchronizedObject.h"

#ifndef BINARYSYNCTREE_H
#define BINARYSYNCTREE_H

template<class T>
class BinarySyncTree : public BinaryTree<T> {
public:
  T *Find(int id) {
    T *tmp = new T(id);
    return BinaryTree<T>::Find(tmp);
  }
  
  int Compare(T *d1, T *d2) {
    if (*d1->GetID() < *d2->GetID()) {
      return LESS;
    }
    if (*d1->GetID() > *d2->GetID()) {
      return GREATER;
    }
    return EQUAL;
  }
};

#endif // BINARYSYNCTREE_H
