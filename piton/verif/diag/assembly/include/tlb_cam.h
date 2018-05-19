// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlb_cam.h
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
  I/D TLB CAM diagnostic register address format

+--------------+---+------.--------.-----------+-----+
|     -----    | 1 | TLB# |   --   | TLB_Entry |  0  |
+--------------+---+------.--------.-----------+-----+
63           19 18  17  16 15    12 11        3 2    0

*/

#define ITLB_DIAGNOSTIC_REG_TLB_4M_512K_MASK     0x0000000000040000
#define ITLB_DIAGNOSTIC_REG_TLB_ENTRY_MASK       0x0000000000040FF8

#define ITLB_DIAGNOSTIC_REG_TLB_SHIFT            16
#define ITLB_DIAGNOSTIC_REG_TLB_ENTRY_SHIFT       3


#define DTLB_DIAGNOSTIC_REG_TLB_4M_512K_MASK     0x0000000000040000
#define DTLB_DIAGNOSTIC_REG_TLB_ENTRY_MASK       0x0000000000040FF8

#define DTLB_DIAGNOSTIC_REG_TLB_SHIFT            16
#define DTLB_DIAGNOSTIC_REG_TLB_ENTRY_SHIFT       3

/*
  I/D TLB CAM diagnostic register data format

+----------------+-----+----------+----------+
|                | LRU | RAM SIZE | CAM SIZE |
+----------------+-----+----------+----------+
63             13   6   5        3 2         0

RAM SIZE and CAM SIZE are read only
*/

#define ITLB_DIAGNOSTIC_REG_LRU_MASK          0x0000000000000040

#define ITLB_DIAGNOSTIC_REG_LRU_SHIFT         6


#define DTLB_DIAGNOSTIC_REG_LRU_MASK          0x0000000000000040

#define DTLB_DIAGNOSTIC_REG_LRU_SHIFT         6
