// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: BinaryStringTree.h
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
// Description:  Binary tree for character strings.
//
//------------------------------------------------------------------------------

#include "string.h"
#include "BinaryTree.h"

#ifndef BINARYSTRINGTREE_H
#define BINARYSTRINGTREE_H

class BinaryStringTree : public BinaryTree<char> {
public:
  int Compare(char *s1, char *s2) {
    int val = strcmp(s1, s2);
    if (val < 0) {
      return LESS;
    }
    if (val > 0) {
      return GREATER;
    }
    return EQUAL;
  }
};

#endif // BINARYSTRINGTREE_H
