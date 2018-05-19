// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlb.h
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
  I/D TLB data in/data access address register

+------.-----------+-----+
|  --  | TLB Entry |  0  |
+------.-----------+-----+
63    9 8         3 2    0

*/

#define ITLB_DATA_ACCESS_REG_TLB_ENTRY_MASK     0x00000000000001F8
#define IMUDATAACCESS_TLBENTRY_MASK	        ITLB_DATA_ACCESS_REG_TLB_ENTRY_MASK

#define	ITLB_DATA_ACCESS_REG_TLB_ENTRY_SHIFT    3
#define	IMUDATAACCESS_TLBENTRY_SHIFT	        ITLB_DATA_ACCESS_REG_TLB_ENTRY_SHIFT

#define DTLB_DATA_ACCESS_REG_TLB_ENTRY_MASK	0x00000000000001F8
#define DMUDATAACCESS_TLBENTRY_MASK	        DTLB_DATA_ACCESS_REG_TLB_ENTRY_MASK

#define	DTLB_DATA_ACCESS_REG_TLB_ENTRY_SHIFT    3
#define	DMUDATAACCESS_TLBENTRY_SHIFT	        DTLB_DATA_ACCESS_REG_TLB_ENTRY_SHIFT

/*
   I/D TLB Data In/Data Access register

   +----------------.----+-------+------+-----------.------.---+----+----.---+---+---+---+
   | V | size | NFO | IE | soft2 | diag | PA[40:13] | soft | L | CP | CV | E | P | W | G |
   +----------------.----+-------+------+-----------.------.---+----+----.---+---+---+---+
     63 62  61  60    59  58   50 49  41 40       13 12   7  6   5    4    3   2   1   0

*/

#define	ITLB_DATA_IN_REG_V_MASK			     0x8000000000000000

#define ITLB_DATA_IN_REG_SIZE_MASK                   0x6000000000000000
! setting size to 8K, 64K, 512K, and 4M respectively
#define ITLB_DATA_IN_REG_SIZE_8K_MASK                0x0000000000000000
#define ITLB_DATA_IN_REG_SIZE_64K_MASK               0x2000000000000000
#define ITLB_DATA_IN_REG_SIZE_512K_MASK              0x4000000000000000
#define ITLB_DATA_IN_REG_SIZE_4M_MASK                0x6000000000000000

#define ITLB_DATA_IN_REG_NFO_MASK                    0x1000000000000000
#define ITLB_DATA_IN_REG_IE_MASK                     0x0800000000000000
#define ITLB_DATA_IN_REG_SOFT2_MASK                  0x07FC000000000000
#define ITLB_DATA_IN_REG_DIAG_MASK                   0x0003fe0000000000
#define ITLB_DATA_IN_REG_PA_MASK                     0x000001ffffffe000
#define ITLB_DATA_IN_REG_SOFT_MASK                   0x0000000000001F80
#define ITLB_DATA_IN_REG_L_MASK                      0x0000000000000040
#define ITLB_DATA_IN_REG_CP_MASK                     0x0000000000000020
#define ITLB_DATA_IN_REG_CV_MASK                     0x0000000000000010
#define ITLB_DATA_IN_REG_E_MASK                      0x0000000000000008
#define ITLB_DATA_IN_REG_P_MASK                      0x0000000000000004
#define ITLB_DATA_IN_REG_W_MASK                      0x0000000000000002
#define ITLB_DATA_IN_REG_DATA_G_MASK                 0x0000000000000001

#define	ITLB_DATA_IN_REG_V_SHIFT		     63
#define ITLB_DATA_IN_REG_SIZE_SHIFT                  61
#define ITLB_DATA_IN_REG_NFO_SHIFT                   60
#define ITLB_DATA_IN_REG_IE_SHIFT                    59
#define ITLB_DATA_IN_REG_SOFT2_SHIFT                 50
#define ITLB_DATA_IN_REG_DIAG_SHIFT                  41
#define ITLB_DATA_IN_REG_PA_SHIFT                    13
#define ITLB_DATA_IN_REG_SOFT_SHIFT                   7
#define ITLB_DATA_IN_REG_L_SHIFT                      6
#define ITLB_DATA_IN_REG_CP_SHIFT                     5
#define ITLB_DATA_IN_REG_CV_SHIFT                     4
#define ITLB_DATA_IN_REG_E_SHIFT                      3
#define ITLB_DATA_IN_REG_P_SHIFT                      2
#define ITLB_DATA_IN_REG_W_SHIFT                      1
#define ITLB_DATA_IN_REG_DATA_G_SHIFT                 0


#define	DTLB_DATA_IN_REG_V_MASK			     0x8000000000000000

#define DTLB_DATA_IN_REG_SIZE_MASK                   0x6000000000000000
! setting size to 8K, 64K, 512K, and 4M respectively
#define DTLB_DATA_IN_REG_SIZE_8K_MASK                0x0000000000000000
#define DTLB_DATA_IN_REG_SIZE_64K_MASK               0x2000000000000000
#define DTLB_DATA_IN_REG_SIZE_512K_MASK              0x4000000000000000
#define DTLB_DATA_IN_REG_SIZE_4M_MASK                0x6000000000000000

#define DTLB_DATA_IN_REG_NFO_MASK                    0x1000000000000000
#define DTLB_DATA_IN_REG_IE_MASK                     0x0800000000000000
#define DTLB_DATA_IN_REG_SOFT2_MASK                  0x07FC000000000000
#define DTLB_DATA_IN_REG_DIAG_MASK                   0x0003fe0000000000
#define DTLB_DATA_IN_REG_PA_MASK                     0x000001ffffffe000
#define DTLB_DATA_IN_REG_SOFT_MASK                   0x0000000000001F80
#define DTLB_DATA_IN_REG_L_MASK                      0x0000000000000040
#define DTLB_DATA_IN_REG_CP_MASK                     0x0000000000000020
#define DTLB_DATA_IN_REG_CV_MASK                     0x0000000000000010
#define DTLB_DATA_IN_REG_E_MASK                      0x0000000000000008
#define DTLB_DATA_IN_REG_P_MASK                      0x0000000000000004
#define DTLB_DATA_IN_REG_W_MASK                      0x0000000000000002
#define DTLB_DATA_IN_REG_DATA_G_MASK                 0x0000000000000001

#define	DTLB_DATA_IN_REG_V_SHIFT		     63
#define DTLB_DATA_IN_REG_SIZE_SHIFT                  61
#define DTLB_DATA_IN_REG_NFO_SHIFT                   60
#define DTLB_DATA_IN_REG_IE_SHIFT                    59
#define DTLB_DATA_IN_REG_SOFT2_SHIFT                 50
#define DTLB_DATA_IN_REG_DIAG_SHIFT                  41
#define DTLB_DATA_IN_REG_PA_SHIFT                    13
#define DTLB_DATA_IN_REG_SOFT_SHIFT                   7
#define DTLB_DATA_IN_REG_L_SHIFT                      6
#define DTLB_DATA_IN_REG_CP_SHIFT                     5
#define DTLB_DATA_IN_REG_CV_SHIFT                     4
#define DTLB_DATA_IN_REG_E_SHIFT                      3
#define DTLB_DATA_IN_REG_P_SHIFT                      2
#define DTLB_DATA_IN_REG_W_SHIFT                      1
#define DTLB_DATA_IN_REG_DATA_G_SHIFT                 0


#define	ITLB_DATA_ACCESS_REG_V_MASK		     0x8000000000000000

#define ITLB_DATA_ACCESS_REG_SIZE_MASK               0x6000000000000000
! setting size to 8K, 64K, 512K, and 4M respectively 
#define ITLB_DATA_ACCESS_REG_SIZE_8K_MASK            0x0000000000000000
#define ITLB_DATA_ACCESS_REG_SIZE_64K_MASK           0x2000000000000000
#define ITLB_DATA_ACCESS_REG_SIZE_512K_MASK          0x4000000000000000
#define ITLB_DATA_ACCESS_REG_SIZE_4M_MASK            0x6000000000000000
                                                     
#define ITLB_DATA_ACCESS_REG_NFO_MASK                0x1000000000000000
#define ITLB_DATA_ACCESS_REG_IE_MASK                 0x0800000000000000
#define ITLB_DATA_ACCESS_REG_SOFT2_MASK              0x07FC000000000000
#define ITLB_DATA_ACCESS_REG_DIAG_MASK               0x0003fe0000000000
#define ITLB_DATA_ACCESS_REG_PA_MASK                 0x000001ffffffe000
#define ITLB_DATA_ACCESS_REG_SOFT_MASK               0x0000000000001F80
#define ITLB_DATA_ACCESS_REG_L_MASK                  0x0000000000000040
#define ITLB_DATA_ACCESS_REG_CP_MASK                 0x0000000000000020
#define ITLB_DATA_ACCESS_REG_CV_MASK                 0x0000000000000010
#define ITLB_DATA_ACCESS_REG_E_MASK                  0x0000000000000008
#define ITLB_DATA_ACCESS_REG_P_MASK                  0x0000000000000004
#define ITLB_DATA_ACCESS_REG_W_MASK                  0x0000000000000002
#define ITLB_DATA_ACCESS_REG_DATA_G_MASK             0x0000000000000001

#define	ITLB_DATA_ACCESS_REG_V_SHIFT		     63
#define ITLB_DATA_ACCESS_REG_SIZE_SHIFT              61
#define ITLB_DATA_ACCESS_REG_NFO_SHIFT               60
#define ITLB_DATA_ACCESS_REG_IE_SHIFT                59
#define ITLB_DATA_ACCESS_REG_SOFT2_SHIFT             50
#define ITLB_DATA_ACCESS_REG_DIAG_SHIFT              41
#define ITLB_DATA_ACCESS_REG_PA_SHIFT                13
#define ITLB_DATA_ACCESS_REG_SOFT_SHIFT               7
#define ITLB_DATA_ACCESS_REG_L_SHIFT                  6
#define ITLB_DATA_ACCESS_REG_CP_SHIFT                 5
#define ITLB_DATA_ACCESS_REG_CV_SHIFT                 4
#define ITLB_DATA_ACCESS_REG_E_SHIFT                  3
#define ITLB_DATA_ACCESS_REG_P_SHIFT                  2
#define ITLB_DATA_ACCESS_REG_W_SHIFT                  1
#define ITLB_DATA_ACCESS_REG_DATA_G_SHIFT             0


#define	DTLB_DATA_ACCESS_REG_V_MASK		     0x8000000000000000

#define DTLB_DATA_ACCESS_REG_SIZE_MASK               0x6000000000000000
! setting size to 8K, 64K, 512K, and 4M respectively 
#define DTLB_DATA_ACCESS_REG_SIZE_8K_MASK            0x0000000000000000
#define DTLB_DATA_ACCESS_REG_SIZE_64K_MASK           0x2000000000000000
#define DTLB_DATA_ACCESS_REG_SIZE_512K_MASK          0x4000000000000000
#define DTLB_DATA_ACCESS_REG_SIZE_4M_MASK            0x6000000000000000
                                                     
#define DTLB_DATA_ACCESS_REG_NFO_MASK                0x1000000000000000
#define DTLB_DATA_ACCESS_REG_IE_MASK                 0x0800000000000000
#define DTLB_DATA_ACCESS_REG_SOFT2_MASK              0x07FC000000000000
#define DTLB_DATA_ACCESS_REG_DIAG_MASK               0x0003fe0000000000
#define DTLB_DATA_ACCESS_REG_PA_MASK                 0x000001ffffffe000
#define DTLB_DATA_ACCESS_REG_SOFT_MASK               0x0000000000001F80
#define DTLB_DATA_ACCESS_REG_L_MASK                  0x0000000000000040
#define DTLB_DATA_ACCESS_REG_CP_MASK                 0x0000000000000020
#define DTLB_DATA_ACCESS_REG_CV_MASK                 0x0000000000000010
#define DTLB_DATA_ACCESS_REG_E_MASK                  0x0000000000000008
#define DTLB_DATA_ACCESS_REG_P_MASK                  0x0000000000000004
#define DTLB_DATA_ACCESS_REG_W_MASK                  0x0000000000000002
#define DTLB_DATA_ACCESS_REG_DATA_G_MASK             0x0000000000000001

#define	DTLB_DATA_ACCESS_REG_V_SHIFT		     63
#define DTLB_DATA_ACCESS_REG_SIZE_SHIFT              61
#define DTLB_DATA_ACCESS_REG_NFO_SHIFT               60
#define DTLB_DATA_ACCESS_REG_IE_SHIFT                59
#define DTLB_DATA_ACCESS_REG_SOFT2_SHIFT             50
#define DTLB_DATA_ACCESS_REG_DIAG_SHIFT              41
#define DTLB_DATA_ACCESS_REG_PA_SHIFT                13
#define DTLB_DATA_ACCESS_REG_SOFT_SHIFT               7
#define DTLB_DATA_ACCESS_REG_L_SHIFT                  6
#define DTLB_DATA_ACCESS_REG_CP_SHIFT                 5
#define DTLB_DATA_ACCESS_REG_CV_SHIFT                 4
#define DTLB_DATA_ACCESS_REG_E_SHIFT                  3
#define DTLB_DATA_ACCESS_REG_P_SHIFT                  2
#define DTLB_DATA_ACCESS_REG_W_SHIFT                  1
#define DTLB_DATA_ACCESS_REG_DATA_G_SHIFT             0
