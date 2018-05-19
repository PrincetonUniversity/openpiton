// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlb_tag.h
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

!! WARNING:
!! For bit set/reset masks, use "X * 2**Y" instead of "X * 2^Y".
!! "^" means "exponentiation" under SunOS:/bin/m4, but
!!     means "bitwise xor" under Solaris:/usr/ccs/bin/m4.
!! "**" is acceptable notation for exponentiation with either.

/*
  IMMU/DMMU TLB Tag Access/Read register

+------------+---------------+
|  VA[63:13] | Context[12:0] |
+------------+---------------+
63         13 12             0

*/

#define IMMU_TAG_ACCESS_VA_MASK                           0xFFFFFFFFFFFFE000
#define IMMU_TAG_ACCESS_CONTEXT_MASK                      0x0000000000001FFF

#define IMMU_TAG_ACCESS_VA_SHIFT                          13
#define IMMU_TAG_ACCESS_CONTEXT_SHIFT                      0


#define DMMU_TAG_ACCESS_VA_MASK                           0xFFFFFFFFFFFFE000
#define DMMU_TAG_ACCESS_CONTEXT_MASK                      0x0000000000001FFF

#define DMMU_TAG_ACCESS_VA_SHIFT                          13
#define DMMU_TAG_ACCESS_CONTEXT_SHIFT                      0


#define ITLB_TAG_READ_VA_MASK                           0xFFFFFFFFFFFFE000
#define ITLB_TAG_READ_CONTEXT_MASK                      0x0000000000001FFF

#define ITLB_TAG_READ_VA_SHIFT                          13
#define ITLB_TAG_READ_CONTEXT_SHIFT                      0


#define DTLB_TAG_READ_VA_MASK                           0xFFFFFFFFFFFFE000
#define DTLB_TAG_READ_CONTEXT_MASK                      0x0000000000001FFF

#define DTLB_TAG_READ_VA_SHIFT                          13
#define DTLB_TAG_READ_CONTEXT_SHIFT                      0
