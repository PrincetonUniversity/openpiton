// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: BinaryNumTree.h
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
// Description:  Binary tree for numerical types.
//
//------------------------------------------------------------------------------

#include "BinaryTree.h"

#ifndef BINARYNUMTREE_H
#define BINARYNUMTREE_H

template<class T>
class BinaryNumTree : public BinaryTree<T> {
public:
  int Compare(T *i1, T *i2) {
    if (*i1 < *i2) {
      return LESS;
    }
    if (*i1 > *i2) {
      return GREATER;
    }
    return EQUAL;
  }
};

#endif // BINARYNUMTREE_H
