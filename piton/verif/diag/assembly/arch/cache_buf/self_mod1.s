// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: self_mod1.s
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
/*
  	   * Random diag for testing LSU 
	   *
	   * Time	: 2003_08_21 18:22
*/
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_TEXT_DATA_ALSO
#define MAIN_PAGE_HV_ALSO
#include "enable_traps.h"
#include "boot.s"
.text
.global main
main:


	 wr %g0, 137, %asi

	 ta T_CHANGE_PRIV 
	 nop 
	 mov 0, %i0
	 mov 0, %i1
	 mov 0, %i2
	 mov 0, %i3
	 mov 0, %i4
	 mov 0, %i5
	 mov 0, %i6
	 mov 0, %i7
	 mov 0, %o0
	 mov 0, %o1
	 mov 0, %o2
	 mov 0, %o3
	 mov 0, %o4
	 mov 0, %o5
	 mov 0, %o6
	 mov 0, %o7
	 mov 0, %l0
	 mov 0, %l1
	 mov 0, %l2
	 mov 0, %l3
	 mov 0, %l4
	 mov 0, %l5
	 mov 0, %l6
	 mov 0, %l7
	 mov 0, %g0
	 mov 0, %g1
	 mov 0, %g2
	 mov 0, %g3
	 mov 0, %g4
	 mov 0, %g5
	 mov 0, %g6
	 mov 0, %g7
setx data2, %l0, %l3
setx self_modcode, %l0, %l1

.global invldic_0
 invldic_0:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_0_lp, %l0, %o0
.align 0x10
.global invldic_0_lp
invldic_0_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_0_lp; add %l7, 1, %l7
	 .word 0xf5e4c211
	 .word 0xececc210
	 .word 0xea74c010
	 .word 0xf0f4e000
	 .word 0x8143e02e

.global invldic_1
 invldic_1:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_1_lp, %l0, %o0
.align 0x10
.global invldic_1_lp
invldic_1_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_1_lp; add %l7, 1, %l7

.global invldic_2
 invldic_2:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_2_lp, %l0, %o0
.align 0x10
.global invldic_2_lp
invldic_2_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_2_lp; add %l7, 1, %l7

.global invldic_3
 invldic_3:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_3_lp, %l0, %o0
.align 0x10
.global invldic_3_lp
invldic_3_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_3_lp; add %l7, 1, %l7

.global invldic_4
 invldic_4:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_4_lp, %l0, %o0
.align 0x10
.global invldic_4_lp
invldic_4_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_4_lp; add %l7, 1, %l7

.global invldic_5
 invldic_5:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_5_lp, %l0, %o0
.align 0x10
.global invldic_5_lp
invldic_5_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_5_lp; add %l7, 1, %l7

.global invldic_6
 invldic_6:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_6_lp, %l0, %o0
.align 0x10
.global invldic_6_lp
invldic_6_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_6_lp; add %l7, 1, %l7

.global invldic_7
 invldic_7:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_7_lp, %l0, %o0
.align 0x10
.global invldic_7_lp
invldic_7_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_7_lp; add %l7, 1, %l7
	 .word 0xf47ce000
	 .word 0xea6cc010

.global invldic_8
 invldic_8:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_8_lp, %l0, %o0
.align 0x10
.global invldic_8_lp
invldic_8_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_8_lp; add %l7, 1, %l7

.global invldic_9
 invldic_9:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_9_lp, %l0, %o0
.align 0x10
.global invldic_9_lp
invldic_9_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_9_lp; add %l7, 1, %l7
	 .word 0xfa7ce000
	 .word 0xede4e011
	 .word 0xebf4e011

.global invldic_10
 invldic_10:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_10_lp, %l0, %o0
.align 0x10
.global invldic_10_lp
invldic_10_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_10_lp; add %l7, 1, %l7
	 .word 0xf3f4e011
	 .word 0xf26ce025
	 .word 0xeeece025

.global invldic_11
 invldic_11:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_11_lp, %l0, %o0
.align 0x10
.global invldic_11_lp
invldic_11_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_11_lp; add %l7, 1, %l7
	 .word 0xead4e002

.global invldic_12
 invldic_12:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_12_lp, %l0, %o0
.align 0x10
.global invldic_12_lp
invldic_12_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_12_lp; add %l7, 1, %l7
	 .word 0xeaece003
	 .word 0xec6ce033
	 .word 0xebf4e011
	 .word 0xec3cc010

.global invldic_13
 invldic_13:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_13_lp, %l0, %o0
.align 0x10
.global invldic_13_lp
invldic_13_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_13_lp; add %l7, 1, %l7
	 .word 0xfa7cc010
	 .word 0xf9f4d131
	 .word 0xf204e004
	 .word 0xf2ece03a

.global invldic_14
 invldic_14:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_14_lp, %l0, %o0
.align 0x10
.global invldic_14_lp
invldic_14_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_14_lp; add %l7, 1, %l7

.global invldic_15
 invldic_15:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_15_lp, %l0, %o0
.align 0x10
.global invldic_15_lp
invldic_15_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_15_lp; add %l7, 1, %l7

.global invldic_16
 invldic_16:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_16_lp, %l0, %o0
.align 0x10
.global invldic_16_lp
invldic_16_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_16_lp; add %l7, 1, %l7
	 .word 0xf1f4e011

.global invldic_17
 invldic_17:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_17_lp, %l0, %o0
.align 0x10
.global invldic_17_lp
invldic_17_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_17_lp; add %l7, 1, %l7

.global invldic_18
 invldic_18:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_18_lp, %l0, %o0
.align 0x10
.global invldic_18_lp
invldic_18_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_18_lp; add %l7, 1, %l7

.global invldic_19
 invldic_19:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_19_lp, %l0, %o0
.align 0x10
.global invldic_19_lp
invldic_19_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_19_lp; add %l7, 1, %l7

.global invldic_20
 invldic_20:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_20_lp, %l0, %o0
.align 0x10
.global invldic_20_lp
invldic_20_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_20_lp; add %l7, 1, %l7
	 .word 0xf1f4e011
	 .word 0xf4f4e008
	 .word 0x8143e069

.global invldic_21
 invldic_21:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_21_lp, %l0, %o0
.align 0x10
.global invldic_21_lp
invldic_21_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_21_lp; add %l7, 1, %l7
	 .word 0xea6cc010
	 .word 0xecbcc470

.global invldic_22
 invldic_22:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_22_lp, %l0, %o0
.align 0x10
.global invldic_22_lp
invldic_22_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_22_lp; add %l7, 1, %l7

.global invldic_23
 invldic_23:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_23_lp, %l0, %o0
.align 0x10
.global invldic_23_lp
invldic_23_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_23_lp; add %l7, 1, %l7

.global invldic_24
 invldic_24:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_24_lp, %l0, %o0
.align 0x10
.global invldic_24_lp
invldic_24_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_24_lp; add %l7, 1, %l7
	 .word 0xec9ce000

.global invldic_25
 invldic_25:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_25_lp, %l0, %o0
.align 0x10
.global invldic_25_lp
invldic_25_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_25_lp; add %l7, 1, %l7

.global invldic_26
 invldic_26:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_26_lp, %l0, %o0
.align 0x10
.global invldic_26_lp
invldic_26_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_26_lp; add %l7, 1, %l7

.global invldic_27
 invldic_27:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_27_lp, %l0, %o0
.align 0x10
.global invldic_27_lp
invldic_27_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_27_lp; add %l7, 1, %l7

.global invldic_28
 invldic_28:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_28_lp, %l0, %o0
.align 0x10
.global invldic_28_lp
invldic_28_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_28_lp; add %l7, 1, %l7
	 .word 0x8143c000
	 .word 0xf6fcc290

.global invldic_29
 invldic_29:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_29_lp, %l0, %o0
.align 0x10
.global invldic_29_lp
invldic_29_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_29_lp; add %l7, 1, %l7

.global invldic_30
 invldic_30:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_30_lp, %l0, %o0
.align 0x10
.global invldic_30_lp
invldic_30_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_30_lp; add %l7, 1, %l7

.global invldic_31
 invldic_31:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_31_lp, %l0, %o0
.align 0x10
.global invldic_31_lp
invldic_31_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_31_lp; add %l7, 1, %l7
	 .word 0xfaace01d

.global invldic_32
 invldic_32:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_32_lp, %l0, %o0
.align 0x10
.global invldic_32_lp
invldic_32_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_32_lp; add %l7, 1, %l7
	 .word 0xf7f4e011

.global invldic_33
 invldic_33:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_33_lp, %l0, %o0
.align 0x10
.global invldic_33_lp
invldic_33_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_33_lp; add %l7, 1, %l7

.global invldic_34
 invldic_34:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_34_lp, %l0, %o0
.align 0x10
.global invldic_34_lp
invldic_34_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_34_lp; add %l7, 1, %l7
	 .word 0xf27cc010
	 .word 0xf8ece031
	 .word 0xf3e4c191

.global invldic_35
 invldic_35:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_35_lp, %l0, %o0
.align 0x10
.global invldic_35_lp
invldic_35_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_35_lp; add %l7, 1, %l7

.global invldic_36
 invldic_36:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_36_lp, %l0, %o0
.align 0x10
.global invldic_36_lp
invldic_36_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_36_lp; add %l7, 1, %l7

.global invldic_37
 invldic_37:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_37_lp, %l0, %o0
.align 0x10
.global invldic_37_lp
invldic_37_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_37_lp; add %l7, 1, %l7

.global invldic_38
 invldic_38:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_38_lp, %l0, %o0
.align 0x10
.global invldic_38_lp
invldic_38_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_38_lp; add %l7, 1, %l7

.global invldic_39
 invldic_39:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_39_lp, %l0, %o0
.align 0x10
.global invldic_39_lp
invldic_39_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_39_lp; add %l7, 1, %l7
	 .word 0xf3e4c091
	 .word 0xf05cc010

.global invldic_40
 invldic_40:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_40_lp, %l0, %o0
.align 0x10
.global invldic_40_lp
invldic_40_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_40_lp; add %l7, 1, %l7

.global invldic_41
 invldic_41:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_41_lp, %l0, %o0
.align 0x10
.global invldic_41_lp
invldic_41_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_41_lp; add %l7, 1, %l7

.global invldic_42
 invldic_42:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_42_lp, %l0, %o0
.align 0x10
.global invldic_42_lp
invldic_42_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_42_lp; add %l7, 1, %l7

.global invldic_43
 invldic_43:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_43_lp, %l0, %o0
.align 0x10
.global invldic_43_lp
invldic_43_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_43_lp; add %l7, 1, %l7

.global invldic_44
 invldic_44:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_44_lp, %l0, %o0
.align 0x10
.global invldic_44_lp
invldic_44_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_44_lp; add %l7, 1, %l7

.global invldic_45
 invldic_45:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_45_lp, %l0, %o0
.align 0x10
.global invldic_45_lp
invldic_45_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_45_lp; add %l7, 1, %l7

.global invldic_46
 invldic_46:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_46_lp, %l0, %o0
.align 0x10
.global invldic_46_lp
invldic_46_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_46_lp; add %l7, 1, %l7

.global invldic_47
 invldic_47:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_47_lp, %l0, %o0
.align 0x10
.global invldic_47_lp
invldic_47_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_47_lp; add %l7, 1, %l7
	 .word 0xf1e4c311
	 .word 0x8143e067
	 .word 0xf4fce000
	 .word 0xec1cc010

.global invldic_48
 invldic_48:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_48_lp, %l0, %o0
.align 0x10
.global invldic_48_lp
invldic_48_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_48_lp; add %l7, 1, %l7

.global invldic_49
 invldic_49:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_49_lp, %l0, %o0
.align 0x10
.global invldic_49_lp
invldic_49_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_49_lp; add %l7, 1, %l7

.global invldic_50
 invldic_50:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_50_lp, %l0, %o0
.align 0x10
.global invldic_50_lp
invldic_50_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_50_lp; add %l7, 1, %l7
	 .word 0xec1cc010
	 .word 0xf2ccd030
	 .word 0xf4ecd010

.global invldic_51
 invldic_51:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_51_lp, %l0, %o0
.align 0x10
.global invldic_51_lp
invldic_51_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_51_lp; add %l7, 1, %l7
	 .word 0xf274c010

.global invldic_52
 invldic_52:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_52_lp, %l0, %o0
.align 0x10
.global invldic_52_lp
invldic_52_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_52_lp; add %l7, 1, %l7

.global invldic_53
 invldic_53:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_53_lp, %l0, %o0
.align 0x10
.global invldic_53_lp
invldic_53_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_53_lp; add %l7, 1, %l7
	 .word 0xf204c010
	 .word 0xf884e000

.global invldic_54
 invldic_54:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_54_lp, %l0, %o0
.align 0x10
.global invldic_54_lp
invldic_54_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_54_lp; add %l7, 1, %l7

.global invldic_55
 invldic_55:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_55_lp, %l0, %o0
.align 0x10
.global invldic_55_lp
invldic_55_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_55_lp; add %l7, 1, %l7

.global invldic_56
 invldic_56:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_56_lp, %l0, %o0
.align 0x10
.global invldic_56_lp
invldic_56_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_56_lp; add %l7, 1, %l7
	 .word 0xf86cc010
	 .word 0xf6fcc090
	 .word 0xf6b4d010

.global invldic_57
 invldic_57:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_57_lp, %l0, %o0
.align 0x10
.global invldic_57_lp
invldic_57_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_57_lp; add %l7, 1, %l7
	 .word 0xeafcd030
	 .word 0xf66cc010
	 .word 0x8143e04e
	 .word 0xf0c4d110
	 .word 0xf0a4e004
	 .word 0xefe4c331

.global invldic_58
 invldic_58:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_58_lp, %l0, %o0
.align 0x10
.global invldic_58_lp
invldic_58_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_58_lp; add %l7, 1, %l7
	 .word 0xecbcc450

.global invldic_59
 invldic_59:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_59_lp, %l0, %o0
.align 0x10
.global invldic_59_lp
invldic_59_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_59_lp; add %l7, 1, %l7

.global invldic_60
 invldic_60:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_60_lp, %l0, %o0
.align 0x10
.global invldic_60_lp
invldic_60_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_60_lp; add %l7, 1, %l7
	 .word 0xf9e4c391
	 .word 0xf06cc010
	 .word 0xefe4c211
	 .word 0xf9e4c091
	 .word 0xf8ecc390

.global invldic_61
 invldic_61:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_61_lp, %l0, %o0
.align 0x10
.global invldic_61_lp
invldic_61_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_61_lp; add %l7, 1, %l7

.global invldic_62
 invldic_62:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_62_lp, %l0, %o0
.align 0x10
.global invldic_62_lp
invldic_62_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_62_lp; add %l7, 1, %l7
	 .word 0xf85ce008

.global invldic_63
 invldic_63:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_63_lp, %l0, %o0
.align 0x10
.global invldic_63_lp
invldic_63_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_63_lp; add %l7, 1, %l7

.global invldic_64
 invldic_64:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_64_lp, %l0, %o0
	setx self_modcode, %l0, %l1
.align 0x10
.global invldic_64_lp
invldic_64_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_64_lp; add %l7, 1, %l7

.global invldic_65
 invldic_65:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_65_lp, %l0, %o0
.align 0x10
.global invldic_65_lp
invldic_65_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_65_lp; add %l7, 1, %l7

.global invldic_66
 invldic_66:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_66_lp, %l0, %o0
.align 0x10
.global invldic_66_lp
invldic_66_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_66_lp; add %l7, 1, %l7

.global invldic_67
 invldic_67:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_67_lp, %l0, %o0
.align 0x10
.global invldic_67_lp
invldic_67_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_67_lp; add %l7, 1, %l7
	 .word 0xee7cc010
	 .word 0x8143e036

.global invldic_68
 invldic_68:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_68_lp, %l0, %o0
.align 0x10
.global invldic_68_lp
invldic_68_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_68_lp; add %l7, 1, %l7
	 .word 0xf8fcc230

.global invldic_69
 invldic_69:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_69_lp, %l0, %o0
.align 0x10
.global invldic_69_lp
invldic_69_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_69_lp; add %l7, 1, %l7
	 .word 0xf674c010
	 .word 0xf9f4e011

.global invldic_70
 invldic_70:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_70_lp, %l0, %o0
.align 0x10
.global invldic_70_lp
invldic_70_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_70_lp; add %l7, 1, %l7
	 .word 0xecfce000
	 .word 0xececc330
	 .word 0xedf4c311

.global invldic_71
 invldic_71:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_71_lp, %l0, %o0
.align 0x10
.global invldic_71_lp
invldic_71_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_71_lp; add %l7, 1, %l7

.global invldic_72
 invldic_72:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_72_lp, %l0, %o0
.align 0x10
.global invldic_72_lp
invldic_72_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_72_lp; add %l7, 1, %l7
	 .word 0x8143c000

.global invldic_73
 invldic_73:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_73_lp, %l0, %o0
.align 0x10
.global invldic_73_lp
invldic_73_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_73_lp; add %l7, 1, %l7
	 .word 0xf67cc010

.global invldic_74
 invldic_74:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_74_lp, %l0, %o0
.align 0x10
.global invldic_74_lp
invldic_74_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_74_lp; add %l7, 1, %l7
	 .word 0xea6cc010

.global invldic_75
 invldic_75:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_75_lp, %l0, %o0
.align 0x10
.global invldic_75_lp
invldic_75_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_75_lp; add %l7, 1, %l7
	 .word 0xfa7ce004
	 .word 0xeeb4d110
	 .word 0xf7f4e011

.global invldic_76
 invldic_76:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_76_lp, %l0, %o0
.align 0x10
.global invldic_76_lp
invldic_76_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_76_lp; add %l7, 1, %l7
	 .word 0xf9e4e011

.global invldic_77
 invldic_77:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_77_lp, %l0, %o0
.align 0x10
.global invldic_77_lp
invldic_77_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_77_lp; add %l7, 1, %l7

.global invldic_78
 invldic_78:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_78_lp, %l0, %o0
.align 0x10
.global invldic_78_lp
invldic_78_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_78_lp; add %l7, 1, %l7

.global invldic_79
 invldic_79:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_79_lp, %l0, %o0
.align 0x10
.global invldic_79_lp
invldic_79_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_79_lp; add %l7, 1, %l7
	 .word 0xfa74c010
	 .word 0xf62ce00b

.global invldic_80
 invldic_80:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_80_lp, %l0, %o0
.align 0x10
.global invldic_80_lp
invldic_80_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_80_lp; add %l7, 1, %l7
	 .word 0xf224c010
	 .word 0xf9f4d131
	 .word 0xec7ce000
	 .word 0xec1ce010

.global invldic_81
 invldic_81:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_81_lp, %l0, %o0
.align 0x10
.global invldic_81_lp
invldic_81_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_81_lp; add %l7, 1, %l7
	 .word 0xfafcc330
	 .word 0xeaece00e

.global invldic_82
 invldic_82:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_82_lp, %l0, %o0
.align 0x10
.global invldic_82_lp
invldic_82_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_82_lp; add %l7, 1, %l7

.global invldic_83
 invldic_83:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_83_lp, %l0, %o0
.align 0x10
.global invldic_83_lp
invldic_83_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_83_lp; add %l7, 1, %l7
	 .word 0xeeecc310
	 .word 0xf294e002

.global invldic_84
 invldic_84:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_84_lp, %l0, %o0
.align 0x10
.global invldic_84_lp
invldic_84_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_84_lp; add %l7, 1, %l7

.global invldic_85
 invldic_85:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_85_lp, %l0, %o0
.align 0x10
.global invldic_85_lp
invldic_85_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_85_lp; add %l7, 1, %l7
	 .word 0xee44e004

.global invldic_86
 invldic_86:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_86_lp, %l0, %o0
.align 0x10
.global invldic_86_lp
invldic_86_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_86_lp; add %l7, 1, %l7

.global invldic_87
 invldic_87:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_87_lp, %l0, %o0
.align 0x10
.global invldic_87_lp
invldic_87_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_87_lp; add %l7, 1, %l7

.global invldic_88
 invldic_88:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_88_lp, %l0, %o0
.align 0x10
.global invldic_88_lp
invldic_88_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_88_lp; add %l7, 1, %l7

.global invldic_89
 invldic_89:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_89_lp, %l0, %o0
.align 0x10
.global invldic_89_lp
invldic_89_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_89_lp; add %l7, 1, %l7
	 .word 0xea24c010
	 .word 0xecbcc570

.global invldic_90
 invldic_90:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_90_lp, %l0, %o0
.align 0x10
.global invldic_90_lp
invldic_90_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_90_lp; add %l7, 1, %l7

.global invldic_91
 invldic_91:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_91_lp, %l0, %o0
.align 0x10
.global invldic_91_lp
invldic_91_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_91_lp; add %l7, 1, %l7

.global invldic_92
 invldic_92:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_92_lp, %l0, %o0
.align 0x10
.global invldic_92_lp
invldic_92_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_92_lp; add %l7, 1, %l7

.global invldic_93
 invldic_93:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_93_lp, %l0, %o0
.align 0x10
.global invldic_93_lp
invldic_93_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_93_lp; add %l7, 1, %l7
	 .word 0xf814c010

.global invldic_94
 invldic_94:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_94_lp, %l0, %o0
.align 0x10
.global invldic_94_lp
invldic_94_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_94_lp; add %l7, 1, %l7

.global invldic_95
 invldic_95:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_95_lp, %l0, %o0
.align 0x10
.global invldic_95_lp
invldic_95_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_95_lp; add %l7, 1, %l7

.global invldic_96
 invldic_96:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_96_lp, %l0, %o0
.align 0x10
.global invldic_96_lp
invldic_96_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_96_lp; add %l7, 1, %l7
	 .word 0xec3cc010

.global invldic_97
 invldic_97:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_97_lp, %l0, %o0
.align 0x10
.global invldic_97_lp
invldic_97_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_97_lp; add %l7, 1, %l7

.global invldic_98
 invldic_98:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_98_lp, %l0, %o0
.align 0x10
.global invldic_98_lp
invldic_98_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_98_lp; add %l7, 1, %l7

.global invldic_99
 invldic_99:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_99_lp, %l0, %o0
.align 0x10
.global invldic_99_lp
invldic_99_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_99_lp; add %l7, 1, %l7
	 .word 0xecfce000
	 .word 0xf0fcc290

.global invldic_100
 invldic_100:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_100_lp, %l0, %o0
.align 0x10
.global invldic_100_lp
invldic_100_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_100_lp; add %l7, 1, %l7

.global invldic_101
 invldic_101:
	 mov 16, %l6; mov 0, %l7 
	setx invldic_101_lp, %l0, %o0
.align 0x10
.global invldic_101_lp
invldic_101_lp:
	 nop
	 ld [%l1], %o2; st %o2, [%o0]
	 add %l1, 4, %l1
	 sub %l7, %l6, %o3; brlz %o3, invldic_101_lp; add %l7, 1, %l7
	 .word 0xf87ce000
	 .word 0xf0ece03e
diag_pass:
	 ta 0x0
	 nop

diag_fail:
	 ta 0x1 
	 nop
.data
.align 0x2000
.global user_data_start
user_data_start:

.align 0x800
data0:
	 .word 0x0 
	 .word 0x0 
	.word	0xcfe9ee18
	.word	0x7d74d83d
	.word	0x94a60132
	.word	0x579d8bb6
	.word	0x904fde70
	.word	0x97b9f493
	.word	0x64aef84a
	.word	0x80ef3983
	.word	0x3ae806a8
	.word	0x95b76a63
	.word	0xa63b4824
	.word	0xd799b20d
	.word	0x8405a75f
	.word	0x6ea48308

.align 0x800
data1:
	 .word 0x0 
	 .word 0x0 
	.word	0xa4fa3ee7
	.word	0x1a51b1f
	.word	0x110ccd97
	.word	0x16cc1fec
	.word	0xd132b64b
	.word	0x406b86d8
	.word	0xec757162
	.word	0x18668528
	.word	0x87bdb36c
	.word	0xf15778f9
	.word	0x55554bdf
	.word	0x9c72aa70
	.word	0x5f6aafe0
	.word	0x51aefc61

.align 0x800
data2:
	 .word 0x0 
	 .word 0x0 
	.word	0xdfdc985f
	.word	0x89593630
	.word	0x5f36e00b
	.word	0xeabc0ccf
	.word	0x4a4134ec
	.word	0xed2186f2
	.word	0x3d820ab1
	.word	0x96b58f3
	.word	0x6156d5ec
	.word	0xd2a36f03
	.word	0x800c5cc
	.word	0xce86a0a0
	.word	0x38ca411f
	.word	0x5aa68657

.align 0x800
data3:
	 .word 0x0 
	 .word 0x0 
	.word	0x2fd52c9f
	.word	0xbb403360
	.word	0x6fe0c3d2
	.word	0x158a36a9
	.word	0x1a34630b
	.word	0xe519532d
	.word	0x4bfc584d
	.word	0x261fe5e4
	.word	0xc5907a20
	.word	0xfc857f7d
	.word	0xe1382e8f
	.word	0x4d12e2c8
	.word	0x62a389f6
	.word	0x1748ec80

.align 0x800
data4:
	 .word 0x0 
	 .word 0x0 
	.word	0x6788c3f
	.word	0x23cff7c8
	.word	0x993214bd
	.word	0x4ab0aaa5
	.word	0x588437da
	.word	0x3098c831
	.word	0x8f280713
	.word	0xe6a74261
	.word	0x766ce330
	.word	0x298d5b91
	.word	0x3f14e995
	.word	0xe990c832
	.word	0xfbef4914
	.word	0x64387b56

.align 0x800
data5:
	 .word 0x0 
	 .word 0x0 
	.word	0x9e4117b8
	.word	0xaa05ace1
	.word	0x93caf252
	.word	0xa8d1c6b4
	.word	0xfbdf0fd8
	.word	0xd733ce08
	.word	0x79cd5dd
	.word	0x2632a0cc
	.word	0xaf793091
	.word	0xb7218ad3
	.word	0x23c74849
	.word	0x33a95d0a
	.word	0xfded774d
	.word	0xdb86e10a

.align 0x800
data6:
	 .word 0x0 
	 .word 0x0 
	.word	0xffa4ee7e
	.word	0xaaa84dcd
	.word	0x474e141f
	.word	0x8eacd64e
	.word	0x13eba7ae
	.word	0x9204994d
	.word	0x5e16e6ce
	.word	0xaa03b1a2
	.word	0xdffa27f
	.word	0x6152f8b9
	.word	0xf6953933
	.word	0xd424c92d
	.word	0x7e46118d
	.word	0x7b2ec5a0

.align 0x800
data7:
	 .word 0x0 
	 .word 0x0 
	.word	0x9d604ac7
	.word	0xc3fce83d
	.word	0xc8a3314
	.word	0x7319f991
	.word	0x9a968177
	.word	0xd728918f
	.word	0x6f7e9fe7
	.word	0xfd6b0404
	.word	0xae7c53ba
	.word	0x4a5ba1cd
	.word	0xd69015a6
	.word	0xdfa79a7a
	.word	0x18573fe5
	.word	0xb8421657

.align 0x2000
.global self_modcode 
self_modcode:
	 .word 0xea5ce008
	 .word 0xf624c010
	 .word 0xee2cc010
	 .word 0xf2fce004
	 .word 0xf07ce000
	 .word 0xecf4c310
	 .word 0x8143e058
	 .word 0xf4fce004
	 .word 0xfa7cc010
	 .word 0xeaecc190
	 .word 0xf9e4d131
	 .word 0xede4c231
	 .word 0xf8ece014
	 .word 0xeaa4e004
	 .word 0xf1f4e011
	 .word 0xea7cc010
	 .word 0xf4dce000
	 .word 0xf67ce000
	 .word 0xf884c310
	 .word 0xedf4c211
	 .word 0xeff4d011
	 .word 0xee2cc010
	 .word 0xeeace029
	 .word 0xea24e004
	 .word 0xf5e4e011
	 .word 0xf06ce00f
	 .word 0xec3ce010
	 .word 0xea6ce00a
	 .word 0xf67ce004
	 .word 0xedf4c391
	 .word 0x8143c000
	 .word 0xf86cc010
	 .word 0xee34e000
	 .word 0xefe4e011
	 .word 0xec24c010
	 .word 0xf2cce018
	 .word 0xf66cc010
	 .word 0xf8ece014
	 .word 0xececc330
	 .word 0xfaf4d010
	 .word 0xec3ce010
	 .word 0xebf4d031
	 .word 0x8143e05e
	 .word 0xea2cc010
	 .word 0xf1e4c331
	 .word 0xecbce000
	 .word 0xefe4d011
	 .word 0xf9f4c311
	 .word 0x8143e01e
	 .word 0xf034c010
	 .word 0xf1f4c311
	 .word 0xec1ce010
	 .word 0xf87cc010
	 .word 0xf2fce000
	 .word 0xea6ce033
	 .word 0x8143c000
	 .word 0xf294c290
	 .word 0xf1e4c311
	 .word 0xf6fce000
	 .word 0xecfce000
	 .word 0xebf4e011
	 .word 0xf1e4c391
	 .word 0xec5cc010
	 .word 0xf434c010
	 .word 0xf87ce004
	 .word 0xec1cc010
	 .word 0xecbce000
	 .word 0xeefcc210
	 .word 0xf6ecc190
	 .word 0x8143e010
	 .word 0xefe4c211
	 .word 0xee14e000
	 .word 0xf6fcc190
	 .word 0xf6fcd110
	 .word 0xf8ece016
	 .word 0xf7f4d031
	 .word 0xf3f4e011
	 .word 0xf614c010
	 .word 0xeafce000
	 .word 0xefe4c391
	 .word 0xf47ce004
	 .word 0xfa7cc010
	 .word 0x8143e000
	 .word 0xea7cc010
	 .word 0xec3cc010
	 .word 0x8143c000
	 .word 0xf4fcc390
	 .word 0xf0ccc190
	 .word 0x8143e04d
	 .word 0xea8ce03e
	 .word 0x8143e04e
	 .word 0xee6ce03f
	 .word 0x8143e046
	 .word 0xecece013
	 .word 0xf00ce019
	 .word 0xf9f4e011
	 .word 0xf02ce01e
	 .word 0xf46ce006
	 .word 0xede4e011
	 .word 0xec3cc010
	 .word 0xf6ecd010
	 .word 0xee44c010
	 .word 0x8143e011
	 .word 0xee6ce024
	 .word 0xf234e002
	 .word 0xf88cc330
	 .word 0xf46cc010
	 .word 0xfafce000
	 .word 0xf7f4c091
	 .word 0xf6fce000
	 .word 0x8143e059
	 .word 0xf6ece02f
	 .word 0xf07cc010
	 .word 0xf7e4c211
	 .word 0xf284c210
	 .word 0xeea4c230
	 .word 0xf9f4c391
	 .word 0xf2fce004
	 .word 0xf47ce000
	 .word 0xf3f4e011
	 .word 0xea6cc010
	 .word 0xf25ce008
	 .word 0xf7f4c191
	 .word 0xebf4e011
	 .word 0xf834c010
	 .word 0xebe4d011
	 .word 0xf06cc010
	 .word 0xf27ce000
	 .word 0xf4fce000
	 .word 0xf8c4c210
	 .word 0xf07cc010
	 .word 0xf2f4c210
	 .word 0xf7f4c091
	 .word 0xf0b4e002
	 .word 0xf1f4e011
	 .word 0xf2fcd030
	 .word 0xfac4e004
	 .word 0xeaecd130
	 .word 0xede4e011
	 .word 0xfacce03a
	 .word 0xf044e000
	 .word 0xf1e4e011
	 .word 0x8143e06e
	 .word 0xf4fce000
	 .word 0xf8ecc390
	 .word 0xf244e000
	 .word 0xec3cc010
	 .word 0xec3cc010
	 .word 0xefe4d111
	 .word 0xeadcc210
	 .word 0xf06ce012
	 .word 0xf8b4c210
	 .word 0xec2cc010
	 .word 0xec5cc010
	 .word 0xf2fcc310
	 .word 0xec1cc010
	 .word 0xf4b4d110
	 .word 0x8143c000
	 .word 0xf604c010
	 .word 0xf3e4d031
	 .word 0xeeece02c
	 .word 0xf6ece036
	 .word 0xf67cc010
	 .word 0xeaecc090
	 .word 0x8143c000
	 .word 0xf7e4c311
	 .word 0xea7cc010
	 .word 0xee2cc010
	 .word 0xeefce004
	 .word 0xf5e4e011
	 .word 0xf86ce021
	 .word 0xecece00a
	 .word 0xecb4e002
	 .word 0xebf4e011
	 .word 0x8143c000
	 .word 0xececc190
	 .word 0xf4a4c290
	 .word 0xf024e000
	 .word 0xf06ce001
	 .word 0xf874e008
	 .word 0xf2d4c230
	 .word 0xf0fcc230
	 .word 0xf86cc010
	 .word 0x8143e069
	 .word 0xf87cc010
	 .word 0xf2d4e002
	 .word 0xf224e004
	 .word 0xf6b4e002
	 .word 0xecace007
	 .word 0xf2fce004
	 .word 0xf8ccc230
	 .word 0x8143e03c
	 .word 0xf3e4e011
	 .word 0xedf4c231
	 .word 0xee44e000
	 .word 0xec1cc010
	 .word 0xec7ce004
	 .word 0xf3e4e011
	 .word 0xedf4c331
	 .word 0xf7e4e011
	 .word 0xf054c010
	 .word 0xeef4e000
	 .word 0xf7f4e011
	 .word 0xf014e000
	 .word 0xecfcd110
	 .word 0xf46ce003
	 .word 0xf46ce01a
	 .word 0xefe4c291
	 .word 0xf6fce004
	 .word 0xebf4e011
	 .word 0x8143e063
	 .word 0x8143e04e
	 .word 0xf66ce037
	 .word 0xf4ece02c
	 .word 0xeeecd110
	 .word 0xea0cc010
	 .word 0xf214e002
	 .word 0xeec4e004
	 .word 0x8143c000
	 .word 0xee6cc010
	 .word 0xf604e000
	 .word 0x8143e017
	 .word 0xebe4c211
	 .word 0xecccc210
	 .word 0xebf4c211
	 .word 0xee74c010
	 .word 0xf854c010
	 .word 0xedf4e011
	 .word 0x8143e027
	 .word 0xf7f4c391
	 .word 0xf86cc010
	 .word 0xf6acc210
	 .word 0xf3f4d131
	 .word 0xf3e4e011
	 .word 0xf1e4e011
	 .word 0xec6ce011
	 .word 0xf06ce019
	 .word 0xee7cc010
	 .word 0x8143c000
	 .word 0xf68cc390
	 .word 0xf28ce000
	 .word 0xee6cc010
	 .word 0xecfce004
	 .word 0x8143c000
	 .word 0xeeecc290
	 .word 0xede4c291
	 .word 0xf46cc010
	 .word 0x8143e03a
	 .word 0xf6fce004
	 .word 0xebf4e011
	 .word 0xf874e008
	 .word 0xea0ce009
	 .word 0xf884e000
	 .word 0xf0f4e008
	 .word 0xf7f4c391
	 .word 0xf9e4e011
	 .word 0x8143c000
	 .word 0x8143e06b
	 .word 0xf0ece00b
	 .word 0xeed4c090
	 .word 0xec1ce000
	 .word 0xf9f4c291
	 .word 0xf27cc010
	 .word 0xf4ccc310
	 .word 0xeaecd130
	 .word 0x8143c000
	 .word 0xfa74c010
	 .word 0xeea4e004
	 .word 0xf6ecc230
	 .word 0xeff4c331
	 .word 0xfaf4d130
	 .word 0xf0a4e004
	 .word 0xfa5ce000
	 .word 0xf4ecc390
	 .word 0xf4fce000
	 .word 0xf2ecc290
	 .word 0xecbce010
	 .word 0xf3f4e011
	 .word 0xf07cc010
	 .word 0xf62cc010
	 .word 0xf604e000
	 .word 0xf454e002
	 .word 0xea0ce021
	 .word 0xf47ce004
	 .word 0xf02cc010
	 .word 0xf4cce02e
	 .word 0xec54e002
	 .word 0xf3f4e011
	 .word 0xf7e4e011
	 .word 0xf7f4e011
	 .word 0xf9f4e011
	 .word 0xf0c4e004
	 .word 0xf634c010
	 .word 0xfa4cc010
	 .word 0xf8a4c390
	 .word 0xec1cc010
	 .word 0x8143c000
	 .word 0xefe4d111
	 .word 0xea84d010
	 .word 0xf834e002
	 .word 0xf7f4c311
	 .word 0xf214e002
	 .word 0xec3ce010
	 .word 0xfa34c010
	 .word 0xedf4e011
	 .word 0xeaace00d
	 .word 0xf7f4e011
	 .word 0xf87cc010
	 .word 0xf1e4c231
	 .word 0xf27cc010
	 .word 0xf06ce03a
	 .word 0xf4a4e004
	 .word 0xf004e004
	 .word 0xea74c010
	 .word 0xf284d110
	 .word 0x8143c000
	 .word 0xf1e4e011
	 .word 0xeea4e000
	 .word 0xea7ce000
	 .word 0xee0cc010
	 .word 0xede4d031
	 .word 0xea34c010
	 .word 0xf2ece015
	 .word 0xebf4e011
	 .word 0xf834c010
	 .word 0xf62ce039
	 .word 0xf3e4c231
	 .word 0xf044e004
	 .word 0xf27ce000
	 .word 0xf674e000
	 .word 0xf8dcc090
	 .word 0xf87ce000
	 .word 0xede4d131
	 .word 0xebe4e011
	 .word 0xec7ce004
	 .word 0xec7ce004
	 .word 0xee6ce00b
	 .word 0xee7ce000
	 .word 0x8143e045
	 .word 0xeeb4d110
	 .word 0xf424c010
	 .word 0xf27cc010
	 .word 0xea54e002
	 .word 0xf26cc010
	 .word 0xec6cc010
	 .word 0xf06cc010
	 .word 0xf42ce001
	 .word 0xecbcc570
	 .word 0x8143c000
	 .word 0xf2ece020
	 .word 0xf07ce000
	 .word 0xeff4e011
	 .word 0xfafcd010
	 .word 0xedf4c211
	 .word 0x8143e02b
	 .word 0x8143e009
	 .word 0xfa7ce000
	 .word 0xf674e000
	 .word 0xeeccd010
	 .word 0xeefcc090
	 .word 0xecdcc330
	 .word 0xec44c010
	 .word 0xeaece016
	 .word 0xf3f4e011
	 .word 0xf7f4e011
	 .word 0x8143e06e
	 .word 0xedf4c391
	 .word 0xf6b4c230
	 .word 0xec3ce000
	 .word 0xecfce000
	 .word 0xf074c010
	 .word 0xeef4e008
	 .word 0xf434e000
	 .word 0xf274c010
	 .word 0xecdcd130
	 .word 0xf0ecc310
	 .word 0xf9f4e011
	 .word 0xf8b4c290
	 .word 0xf9f4c291
	 .word 0xf47ce000
	 .word 0xf0ece029
	 .word 0xec9cc550
	 .word 0xf4ecc310
	 .word 0xf7f4e011
	 .word 0xeecce014
	 .word 0xee7cc010
	 .word 0xeefce000
	 .word 0xf46cc010
	 .word 0xecfcd010
	 .word 0xf4ece006
	 .word 0xf07ce000
	 .word 0xea7ce000
	 .word 0xeefcd030
	 .word 0xeff4c211
	 .word 0xf6fcc210
	 .word 0xfadce008
	 .word 0xec1ce000
	 .word 0xf0fcc330
	 .word 0xf6acc210
	 .word 0xedf4e011
	 .word 0xf624c010
	 .word 0xec24c010
	 .word 0xeca4e000
	 .word 0xec6ce02d
	 .word 0xf8ece02f
	 .word 0xf8ece034
	 .word 0xf5f4e011
	 .word 0xf47cc010
	 .word 0xec14e000
	 .word 0xf06ce00f
	 .word 0xfa14e000
	 .word 0xf5e4e011
	 .word 0xf9f4e011
	 .word 0xec14e000
	 .word 0xf2ecd010
	 .word 0x8143e010
	 .word 0xf7f4c191
	 .word 0xf9e4c231
	 .word 0xec74e000
	 .word 0xf3e4c391
	 .word 0xf5e4d031
	 .word 0xf214c010
	 .word 0xf1f4c231
	 .word 0xf8fcc210
	 .word 0xf3f4e011
	 .word 0xf8fcc310
	 .word 0xf274c010
	 .word 0xf6ece01f
	 .word 0xf2a4e004
	 .word 0xec6ce00b
	 .word 0xf6ece000
	 .word 0xec3cc010
	 .word 0xfa7ce000
	 .word 0xf5e4c091
	 .word 0xee04e000
	 .word 0xec6cc010
	 .word 0xee14e000
	 .word 0xfafce004
	 .word 0x8143c000
	 .word 0xf27ce000
	 .word 0xec3ce010
	 .word 0xf8fce004
	 .word 0xebe4e011
	 .word 0x8143c000
	 .word 0xede4d031
	 .word 0xf834c010
	 .word 0xf8ace01f
	 .word 0xfafcd130
	 .word 0xf08cd010
	 .word 0xedf4c311
	 .word 0xec6ce033
	 .word 0xeca4e004
	 .word 0xeeace036
	 .word 0xea7cc010
	 .word 0xeeece003
	 .word 0xfa8ce017
	 .word 0xea6cc010
	 .word 0xede4e011
	 .word 0xedf4c311
	 .word 0x8143e010
	 .word 0xf234c010
	 .word 0xf274e008
	 .word 0xec7ce004
	 .word 0xf274c010
	 .word 0xf26ce014
	 .word 0xf7f4e011
	 .word 0xede4e011
	 .word 0xede4c331
	 .word 0xf06ce000
	 .word 0xebe4e011
	 .word 0xf024c010
	 .word 0xecbcc550
	 .word 0xf6ecc330
	 .word 0xf2b4e002
	 .word 0xf47cc010
	 .word 0xee0cc010
	 .word 0xf6ece01f
	 .word 0xeea4e004
	 .word 0xf7e4e011
	 .word 0xf67cc010
	 .word 0xf2fce000
	 .word 0xec6cc010
	 .word 0xecbcc550
	 .word 0xf824e000
	 .word 0xee7ce000
	 .word 0xf4ece017
	 .word 0xec34e002
	 .word 0xea4cc010
	 .word 0xf6d4e002
	 .word 0xf26cc010
	 .word 0xf4ecc210
	 .word 0xea4ce011
	 .word 0xea6ce015
	 .word 0xf1f4e011
	 .word 0xede4d131
	 .word 0xf67ce004
	 .word 0xf07ce000
	 .word 0xfa74c010
	 .word 0xf884c210
	 .word 0xeccce01f
	 .word 0x8143c000
	 .word 0xec9cc450
	 .word 0xeeecc330
	 .word 0xf07cc010
	 .word 0xea74c010
	 .word 0xec3cc010
	 .word 0xf9f4c331
	 .word 0xec84e004
	 .word 0xf224c010
	 .word 0x8143c000
	 .word 0x8143c000
	 .word 0xedf4d031
	 .word 0xec9ce000
	 .word 0x8143e01e
	 .word 0xf2ecd110
	 .word 0xebf4e011
	 .word 0xf284d130
	 .word 0xebf4d111
	 .word 0xede4c291
	 .word 0x8143c000
	 .word 0x8143c000
	 .word 0x8143c000
	 .word 0xeff4e011
	 .word 0xeaf4e000
	 .word 0x8143e061
	 .word 0xee6ce01a
	 .word 0xec74e000
	 .word 0xf5e4c231
	 .word 0xf0ecc330
	 .word 0xfa74c010
	 .word 0xf44cc010
	 .word 0x8143e064
	 .word 0xf6dce008
	 .word 0xf3e4e011
	 .word 0xec04e004
	 .word 0xeeccc190
	 .word 0xecbce000
	 .word 0xec1ce010
	 .word 0xf42ce022
	 .word 0xf8fcc210
	 .word 0xf8a4e004
	 .word 0xf66ce002
	 .word 0xede4e011
	 .word 0xfa74e008
	 .word 0xf27cc010
	 .word 0xecbce000
	 .word 0xf0d4e000
	 .word 0xf414c010
	 .word 0xf82cc010
	 .word 0xf00ce01b
	 .word 0xf814e002
	 .word 0xee6cc010
	 .word 0xfa44e004
	 .word 0xf7f4e011
	 .word 0xea7cc010
	 .word 0xecbce000
	 .word 0xecbcc550
	 .word 0xecfcc290
	 .word 0xea7ce004
	 .word 0xee2cc010
	 .word 0xea54e000
	 .word 0xee54e000
	 .word 0xecfce000
	 .word 0xf86cc010
	 .word 0xf9e4e011
	 .word 0xf2b4d130
	 .word 0xf7e4d011
	 .word 0xf1e4e011
	 .word 0xf25ce000
	 .word 0x8143c000
	 .word 0xf844e004
	 .word 0xecbce000
	 .word 0xf2ecd110
	 .word 0xecfcc210
	 .word 0xec84e004
	 .word 0xececd130
	 .word 0xebe4c391
	 .word 0xf26cc010
	 .word 0xeafcd110
	 .word 0x8143e048
	 .word 0xf6c4c330
	 .word 0xeaa4c310
	 .word 0xee7ce000
	 .word 0xf6ecd030
	 .word 0xeea4d110
	 .word 0xf8dcc090
	 .word 0x8143e06d
	 .word 0xf22ce026
	 .word 0xfadce008
	 .word 0xea7cc010
	 .word 0xf884c230
	 .word 0xeeace027
	 .word 0xf0a4c190
	 .word 0xf5f4e011
	 .word 0xf2acc290
	 .word 0xf1e4c331
	 .word 0x8143e022
	 .word 0xeaece039
	 .word 0xefe4d131
	 .word 0xfad4e002
	 .word 0xf67cc010
	 .word 0xeeecc330
	 .word 0x8143e052
	 .word 0xeeecc290
	 .word 0x8143e062
	 .word 0xf08ce002
	 .word 0xeeb4e002
	 .word 0xeab4e002
	 .word 0xfa24c010
	 .word 0xfa2ce024
	 .word 0xf6fce000
	 .word 0x8143c000
	 .word 0xf0fce000
	 .word 0xea44c010
	 .word 0xf5e4c391
	 .word 0xeefcd130
	 .word 0xf1e4e011
	 .word 0xf06cc010
	 .word 0xea6cc010
	 .word 0xee6ce00d
	 .word 0xec3ce010
	 .word 0xec84c230
	 .word 0xf7f4e011
	 .word 0xec3cc010
	 .word 0x8143e065
	 .word 0xeeecc210
	 .word 0xf86cc010
	 .word 0x8143e013
	 .word 0xf2fcc090
	 .word 0xf434c010
	 .word 0xfa7ce000
	 .word 0xf5f4c231
	 .word 0x8143e061
	 .word 0xfa7ce004
	 .word 0xf6fcc310
	 .word 0xf27ce004
	 .word 0xf0ecc230
	 .word 0xf42cc010
	 .word 0x8143e01b
	 .word 0xf67ce000
	 .word 0xf4b4c310
	 .word 0xeac4d110
	 .word 0xf454c010
	 .word 0xede4c211
	 .word 0xfa7ce000
	 .word 0xf80ce002
	 .word 0x8143e01c
	 .word 0xfab4e002
	 .word 0x8143e043
	 .word 0xecbcc450
	 .word 0xec7ce004
	 .word 0xee7cc010
	 .word 0xf8ecc290
	 .word 0xf0fce000
	 .word 0xf1e4e011
	 .word 0xf1f4c291
	 .word 0xf86cc010
	 .word 0xedf4c231
	 .word 0xee44e000
	 .word 0xeca4e004
	 .word 0xf00cc010
	 .word 0xee24e004
	 .word 0xf2c4d010
	 .word 0xf444c010
	 .word 0xf1f4c311
	 .word 0xfafcd130
	 .word 0xeaece015
	 .word 0xf3e4c391
	 .word 0xea94c090
	 .word 0xf6ece025
	 .word 0xeca4e000
	 .word 0xfa44e000
	 .word 0xf5e4c091
	 .word 0xede4c091
	 .word 0xecbce000
	 .word 0xec9cc550
	 .word 0xf074c010
	 .word 0x8143c000
	 .word 0xeab4e002
	 .word 0xecbce010
	 .word 0xede4e011
	 .word 0xeeecd010
	 .word 0xf1f4e011
	 .word 0xeac4e000
	 .word 0xeadce008
	 .word 0xfa24c010
	 .word 0xf66cc010
	 .word 0xefe4c331
	 .word 0x8143c000
	 .word 0xec74c010
	 .word 0xecc4e000
	 .word 0xf5e4e011
	 .word 0xeac4c230
	 .word 0xec6cc010
	 .word 0xf07ce004
	 .word 0xf5f4c191
	 .word 0xecf4c310
	 .word 0xf6fcc190
	 .word 0xf08ce009
	 .word 0xf0fce000
	 .word 0xf3f4d111
	 .word 0xf9f4c331
	 .word 0xf27cc010
	 .word 0xf9f4c291
	 .word 0xf0ece00a
	 .word 0xf9e4e011
	 .word 0xf2ece02f
	 .word 0xee7ce004
	 .word 0xf5f4c231
	 .word 0xf67cc010
	 .word 0xf87ce004
	 .word 0xecdcd030
	 .word 0xec3cc010
	 .word 0xf26ce002
	 .word 0x8143e02d
	 .word 0xf804c010
	 .word 0xeccce03a
	 .word 0xefe4e011
	 .word 0xf4fcc210
	 .word 0xf4fce004
	 .word 0x8143c000
	 .word 0xeea4e000
	 .word 0x8143e048
	 .word 0x8143c000
	 .word 0xecc4c210
	 .word 0xf2fcc330
	 .word 0xf40ce011
	 .word 0x8143e003
	 .word 0xec9ce000
	 .word 0xec1cc010
	 .word 0xf4ecd010
	 .word 0xecece027
	 .word 0xee4cc010
	 .word 0xecbce000
	 .word 0xf224c010
	 .word 0xec14c010
	 .word 0xf26cc010
	 .word 0xea7ce004
	 .word 0xf6ecd110
	 .word 0xea7ce004
	 .word 0xf9f4c311
	 .word 0xf87cc010
	 .word 0xf204e004
	 .word 0xeaece019
	 .word 0xecbce000
	 .word 0xf4ecc390
	 .word 0xf6ace003
	 .word 0xf3f4c191
	 .word 0xf4fcd130
	 .word 0xea6ce016
	 .word 0xfad4c330
	 .word 0xecfcc390
	 .word 0xf8fce000
	 .word 0x8143c000
	 .word 0xf8c4d110
	 .word 0xf6ece03e
	 .word 0x8143e069
	 .word 0x8143c000
	 .word 0xf014c010
	 .word 0xf27cc010
	 .word 0xf02ce006
	 .word 0xf044c010
	 .word 0x8143c000
	 .word 0xf454c010
	 .word 0x8143c000
	 .word 0xf27cc010
	 .word 0xf1e4e011
	 .word 0xf5f4c211
	 .word 0xf9e4e011
	 .word 0xec7cc010
	 .word 0x8143e012
	 .word 0xf3f4e011
	 .word 0xec2ce025
	 .word 0xec3ce000
	 .word 0xec54c010
	 .word 0xf624c010
	 .word 0xf3f4c331
	 .word 0xecbce000
	 .word 0xf2ece002
	 .word 0xf8fcc190
	 .word 0x8143e051
	 .word 0xede4d011
	 .word 0xec3cc010
	 .word 0xf47cc010
	 .word 0xede4c231
	 .word 0xf284e004
	 .word 0xede4d031
	 .word 0xf07cc010
	 .word 0x8143c000
	 .word 0xf86ce000
	 .word 0x8143c000
	 .word 0xebf4e011
	 .word 0xf88ce01f
	 .word 0xec24c010
	 .word 0xec1ce010
	 .word 0xec3ce000
	 .word 0xfa34c010
	 .word 0xf2b4e002
	 .word 0xeefcc190
	 .word 0xfa54e002
	 .word 0xf1e4e011
	 .word 0xf484c330
	 .word 0xecccd130
	 .word 0xf0ece016
	 .word 0xf65cc010
	 .word 0xeeace035
	 .word 0xecbcc450
	 .word 0xede4c231
	 .word 0xf814c010
	 .word 0x8143e047
	 .word 0xec7ce000
	 .word 0xf86cc010
	 .word 0xf2b4e000
	 .word 0xebe4e011
	 .word 0x8143c000
	 .word 0xf004c010
	 .word 0xee34c010
	 .word 0xf2fcc190
	 .word 0xf3e4e011
	 .word 0xf2fcd110
	 .word 0xecfce000
	 .word 0xecfce000
	 .word 0xecfce000
	 .word 0xee6cc010
	 .word 0xf6d4d110
	 .word 0xea7ce000
	 .word 0xeefcd010
	 .word 0xee04e000
	 .word 0x8143c000
	 .word 0xee7cc010
	 .word 0xeab4e000
	 .word 0xea04c010
	 .word 0xec7ce000
	 .word 0xede4e011
	 .word 0xf88ce036
	 .word 0xf8ace02d
	 .word 0xeff4c331
	 .word 0xf1f4e011
	 .word 0xec7ce000
	 .word 0xf014c010
	 .word 0xeaece034
	 .word 0xebf4c291
	 .word 0xececc230
	 .word 0xf1f4e011
	 .word 0xf434e002
	 .word 0xf5e4e011
	 .word 0xea6cc010
	 .word 0xf8fcc330
	 .word 0xf7f4e011
	 .word 0xf014c010
	 .word 0xf9f4c311
	 .word 0xf0ece000
	 .word 0xf07ce004
	 .word 0x8143c000
	 .word 0xeadce008
	 .word 0xebf4e011
	 .word 0xf024c010
	 .word 0xf27ce004
	 .word 0xf5e4c331
	 .word 0xf47cc010
	 .word 0xeaece03b
	 .word 0xf0ece024
	 .word 0xfa8cc290
	 .word 0xee7ce004
	 .word 0xf26ce015
	 .word 0xedf4c291
	 .word 0x8143e057
	 .word 0xfa2ce027
	 .word 0x8143e011
	 .word 0xec9cc450
	 .word 0xea7cc010
	 .word 0xecacc210
	 .word 0xf6acd110
	 .word 0xeff4e011
	 .word 0xfa7cc010
	 .word 0xf6b4e002
	 .word 0xebf4e011
	 .word 0x8143c000
	 .word 0xeafcc230
	 .word 0xf654c010
	 .word 0xfaf4d110
	 .word 0xf1f4e011
	 .word 0xec9ce000
	 .word 0xf1e4d011
	 .word 0xedf4e011
	 .word 0xfafce000
	 .word 0xea7ce000
	 .word 0xecf4e008
	 .word 0xf4fcc290
	 .word 0xf45ce000
	 .word 0xf86cc010
	 .word 0xeab4e002
	 .word 0xf5e4c311
	 .word 0xedf4e011
	 .word 0xecbce000
	 .word 0xf2d4e000
	 .word 0x8143c000
	 .word 0xf4fce004
	 .word 0xf654c010
	 .word 0x8143c000
	 .word 0xeafce004
	 .word 0xf5f4e011
	 .word 0xec14c010
	 .word 0xec6ce03b
	 .word 0xec1ce000
	 .word 0xfa74e000
	 .word 0x8143c000
	 .word 0xf7e4d011
	 .word 0xf7f4e011
	 .word 0xead4d110
	 .word 0xee84e000
	 .word 0xf66cc010
	 .word 0xf27ce004
	 .word 0x8143e005
	 .word 0xede4e011
	 .word 0xf1e4c231
	 .word 0xeeecc390
	 .word 0xec6cc010
	 .word 0xf28ce02b
	 .word 0xedf4e011
	 .word 0xea6cc010
	 .word 0xf814e000
	 .word 0xea04e004
	 .word 0x8143c000
	 .word 0xf80ce001
	 .word 0xf074c010
	 .word 0xfa7ce004
	 .word 0xec24c010
	 .word 0xec1cc010
	 .word 0x8143e059
	 .word 0xf5f4e011
	 .word 0xf3f4e011
	 .word 0xfa04c010
	 .word 0xedf4c231
	 .word 0x8143e03d
	 .word 0xf094e002
	 .word 0xeab4c390
	 .word 0xf034c010
	 .word 0xf07ce004
	 .word 0xf66cc010
	 .word 0xee34e002
	 .word 0xf0ecd110
	 .word 0xf46cc010
	 .word 0xecfcc310
	 .word 0xea4cc010
	 .word 0xec3ce010
	 .word 0xf07ce004
	 .word 0xfafcc330
	 .word 0xec3cc010
	 .word 0xf804e000
	 .word 0xede4c311
	 .word 0xf66cc010
	 .word 0xf48cc330
	 .word 0xf7f4c311
	 .word 0xf034c010
	 .word 0xf06ce021
	 .word 0xf67ce004
	 .word 0xf8f4e008
	 .word 0xebf4c391
	 .word 0xf874c010
	 .word 0xec6ce032
	 .word 0xf054c010
	 .word 0x8143e050
	 .word 0xecacc190
	 .word 0xf454e002
	 .word 0xebe4d111
	 .word 0xf87ce000
	 .word 0xfa84e000
	 .word 0xf5f4e011
	 .word 0xeca4e000
	 .word 0xf0fce004
	 .word 0xf0f4e000
	 .word 0xf4ece026
	 .word 0xefe4c291
	 .word 0x8143e060
	 .word 0xf1e4c231
	 .word 0xf4ccd030
	 .word 0xf004e000
	 .word 0xf8fcc090
	 .word 0xf5e4e011
	 .word 0xf0ece030
	 .word 0xf2f4c290
	 .word 0xf2ace03a
	 .word 0xf7e4e011
	 .word 0xea2ce012
	 .word 0xee84e004
	 .word 0xec5cc010
	 .word 0xeafcc390
	 .word 0xea24e000
	 .word 0xebe4e011
	 .word 0xec4cc010
	 .word 0xefe4e011
	 .word 0xf1e4c331
	 .word 0xf6ecd110
	 .word 0xedf4e011
	 .word 0xf67cc010
	 .word 0xf024e004
	 .word 0xf3e4c391
	 .word 0xf40cc010
	 .word 0xf1e4e011
	 .word 0xf044c010
	 .word 0xf86cc010
	 .word 0xf6ece01d
	 .word 0xf4fcc190
	 .word 0xecfcd110
	 .word 0xf4ece026
	 .word 0xf67ce004
	 .word 0xecfce004
	 .word 0xf2fce000
	 .word 0xf07ce004
	 .word 0xf8fce004
	 .word 0xececc330
	 .word 0xefe4c231
	 .word 0xf8c4c330
	 .word 0xead4c090
	 .word 0xebe4e011
	 .word 0xf4dcc210
	 .word 0xf1e4c291
	 .word 0xf004c010
	 .word 0xf224c010
	 .word 0xec1cc010
	 .word 0x8143e01a
	 .word 0xec24c010
	 .word 0xecace017
	 .word 0xf694e002
	 .word 0xeec4d010
	 .word 0xfa2ce033
	 .word 0xf86cc010
	 .word 0xeeece004
	 .word 0xf5f4e011
	 .word 0xf604e000
	 .word 0xec1cc010
	 .word 0xf4dcc230
	 .word 0xee6ce00b
	 .word 0x8143e02d
	 .word 0xfa7ce000
	 .word 0xf044e004
	 .word 0xeeece024
	 .word 0xf0acc210
	 .word 0xf06cc010
	 .word 0xf1e4e011
	 .word 0xeadcd030
	 .word 0xee7cc010
	 .word 0x8143e00e
	 .word 0xecfce000
	 .word 0xf47cc010
	 .word 0xf7f4c191
	 .word 0xeaccd110
	 .word 0xf614e002
	 .word 0xf67ce000
	 .word 0xf47cc010
	 .word 0xf0dcd010
	 .word 0xf1f4e011
	 .word 0x8143c000
	 .word 0xf4ace00c
	 .word 0x8143c000
	 .word 0xfab4c230
	 .word 0xf5f4e011
	 .word 0xea24c010
	 .word 0x8143e01e
	 .word 0xf6c4c290
	 .word 0xea7ce004
	 .word 0xeafce004
	 .word 0xeafce000
	 .word 0xec9cc470
	 .word 0xea6ce020
	 .word 0xf06cc010
	 .word 0x8143c000
	 .word 0xeafcc090
	 .word 0xf9e4c211
	 .word 0xeefcd130
	 .word 0xf68cc330
	 .word 0xea2ce031
	 .word 0x8143c000
	 .word 0xf4b4e002
	 .word 0xf6dce008
	 .word 0xf87cc010
	 .word 0xf5e4e011
	 .word 0xf084e004
	 .word 0xf87cc010
	 .word 0xfa5ce008
	 .word 0xf46ce021
	 .word 0xf6fce000
	 .word 0xea24c010
	 .word 0x8143c000
	 .word 0xf654c010
	 .word 0xf2fcc230
	 .word 0xebf4c331
	 .word 0xf8ecc310
	 .word 0xf844c010
	 .word 0xec3cc010
	 .word 0xf2fcc330
	 .word 0xf4fce004
	 .word 0xee6ce002
	 .word 0xec7cc010
	 .word 0xfa0ce023
	 .word 0xf26cc010
	 .word 0xf0fcd130
	 .word 0xeafcc330
	 .word 0xf8ece025
	 .word 0xf4dce008
	 .word 0xf4fcc330
	 .word 0xee7ce000
	 .word 0xececc330
	 .word 0xf4f4e008
	 .word 0xec8ce025
	 .word 0xf27cc010
	 .word 0xf2fcc230
	 .word 0xec5cc010
	 .word 0xf634c010
	 .word 0xf4ece014
	 .word 0xec9ce010
	 .word 0xec5cc010
	 .word 0xf7f4d031
	 .word 0x8143e065
	 .word 0xf06cc010
	 .word 0xf87cc010
	 .word 0x8143c000
	 .word 0xee44c010
	 .word 0x8143c000
	 .word 0xf07cc010
	 .word 0xf87cc010
	 .word 0xea6ce039
	 .word 0x8143c000
	 .word 0xeafcd130
	 .word 0xfa7ce000
	 .word 0xea6cc010
	 .word 0xec1cc010
	 .word 0xebe4e011
	 .word 0xf86cc010
	 .word 0xf27cc010
	 .word 0xf3e4c291
	 .word 0xf7e4c311
	 .word 0xf2fcd010
	 .word 0xf2ecd010
	 .word 0xf46ce033
	 .word 0xefe4c211
	 .word 0xee34c010
	 .word 0xf07cc010
	 .word 0xec3ce000
	 .word 0xea4ce02f
	 .word 0xf2a4e000
	 .word 0xf5f4e011
	 .word 0xee6cc010
	 .word 0xf87ce004
	 .word 0xecbcc550
	 .word 0x8143c000
	 .word 0xf234e000
	 .word 0xec9ce010
	 .word 0xf5f4e011
	 .word 0xecbcc570
	 .word 0xea34e002
	 .word 0xeafcd110
	 .word 0x8143e027
	 .word 0xec6ce005
	 .word 0xf254e000
	 .word 0xec3ce010
	 .word 0xec7cc010
	 .word 0xee7ce000
	 .word 0xeaecd130
	 .word 0xf4ece034
	 .word 0xf9e4d111
	 .word 0xec9ce010
	 .word 0xf074e008
	 .word 0xf4ecc230
	 .word 0xf48cc390
	 .word 0x8143e05a
	 .word 0xea0cc010
	 .word 0xfa8ce019
	 .word 0xf7e4c191
	 .word 0xee24e000
	 .word 0xefe4c331
	 .word 0xfaf4c230
	 .word 0xec1ce000
	 .word 0xf4d4c090
	 .word 0xf6acc090
	 .word 0xefe4c391
	 .word 0x8143c000
	 .word 0xee7ce004
	 .word 0xfa0ce004
	 .word 0xead4c390
	 .word 0xec7ce000
	 .word 0xf5e4c391
	 .word 0xeca4e000
	 .word 0xf47ce004
	 .word 0xf86ce03b
	 .word 0xf2ecc390
	 .word 0x8143c000
	 .word 0xf67ce004
	 .word 0xf5f4e011
	 .word 0xee6ce03a
	 .word 0xf1e4e011
	 .word 0xf7f4e011
	 .word 0xf68cc310
	 .word 0xf6ecc230
	 .word 0xede4d031
	 .word 0xf26cc010
	 .word 0xecf4c330
	 .word 0x8143e050
	 .word 0xf2fce004
	 .word 0xecbce000
	 .word 0xec1cc010
	 .word 0xee04c010
	 .word 0xf7f4e011
	 .word 0xebe4c391
	 .word 0xf4ecc090
	 .word 0xecfce004
	 .word 0xecfce004
	 .word 0xf47ce000
	 .word 0xf404c010
	 .word 0xf86cc010
	 .word 0x8143e057
	 .word 0xf87cc010
	 .word 0xf6fcd010
	 .word 0xec1ce010
	 .word 0xea6ce024
	 .word 0xf9e4c231
	 .word 0xf46ce02a
	 .word 0xecc4c090
	 .word 0xedf4e011
	 .word 0xf27ce000
	 .word 0xf5f4c231
	 .word 0xf254e000
	 .word 0xecbce000
	 .word 0xee7ce000
	 .word 0xecbcc550
	 .word 0xf024e004
	 .word 0xedf4d031
	 .word 0xfafcc310
	 .word 0xf6ecd110
	 .word 0x8143e06c
	 .word 0xf8ace034
	 .word 0xfa8cc390
	 .word 0xf4ecc210
	 .word 0x8143c000
	 .word 0xf8ece030
	 .word 0xf9e4c331
	 .word 0xf42ce016
	 .word 0xeafce000
	 .word 0x8143c000
	 .word 0xf67cc010
	 .word 0xfa24c010
	 .word 0xfab4c390
	 .word 0xf8ace009
	 .word 0xec6cc010
	 .word 0xf454c010
	 .word 0xf9e4c311
	 .word 0xf3e4c291
	 .word 0xec3ce010
	 .word 0xf46cc010
	 .word 0xfafce004
	 .word 0x8143c000
	 .word 0xee8cc290
	 .word 0xec54c010
	 .word 0xec6cc010
	 .word 0xf1f4e011
	 .word 0xec24e004
	 .word 0xf6a4c210
	 .word 0xf26cc010
	 .word 0xf7e4d111
	 .word 0xf1e4d011
	 .word 0xeaacc310
	 .word 0xeefcc190
	 .word 0xeab4e000
	 .word 0xf07ce004
	 .word 0xf28ce03f
	 .word 0xec1ce010
	 .word 0x8143e002
	 .word 0xf1e4c231
	 .word 0xec74c010
	 .word 0xf8ece023
	 .word 0xf24cc010
	 .word 0xf4ace03a
	 .word 0xf47cc010
	 .word 0xf2ece021
	 .word 0xecbce000
	 .word 0xf4fcc330
	 .word 0xf8ece03b
	 .word 0xf684e000
	 .word 0xf0b4c230
	 .word 0xea7cc010
	 .word 0xfa7cc010
	 .word 0xf614e002
	 .word 0xfa0cc010
	 .word 0xf5f4e011
	 .word 0xf0fcc190
	 .word 0xf034c010
	 .word 0xf224e000
	 .word 0xf014e000
	 .word 0xf4acc330
	 .word 0xec6ce022
	 .word 0xf4ecc090
	 .word 0xf0ecc290
	 .word 0xfa7ce004
	 .word 0x8143e01d
	 .word 0xf87cc010
	 .word 0xebe4e011
	 .word 0xf0ccc230
	 .word 0xf454c010
	 .word 0xec1cc010
	 .word 0xf47ce000
	 .word 0xf66ce010
	 .word 0xecb4c210
	 .word 0xea84e004
	 .word 0xf3e4c231
	 .word 0xee6cc010
	 .word 0xfadcc090
	 .word 0x8143c000
	 .word 0xf66cc010
	 .word 0xf5e4d131
	 .word 0xf06cc010
	 .word 0xec1cc010
	 .word 0x8143c000
	 .word 0xf62ce019
	 .word 0xeff4c391
	 .word 0xf2c4d030
	 .word 0xf1f4d131
	 .word 0xedf4d011
	 .word 0xebf4c091
	 .word 0xf8fcc390
	 .word 0xf86ce035
	 .word 0xf3e4e011
	 .word 0xfa04e000
	 .word 0x8143c000
	 .word 0xf434c010
	 .word 0xf2fcd110
	 .word 0x8143c000
	 .word 0xf2ece00d
	 .word 0xeef4e000
	 .word 0xf034c010
	 .word 0xeefcc290
	 .word 0xeef4c310
	 .word 0xec3cc010
	 .word 0x8143c000
	 .word 0xf254c010
	 .word 0xf87ce000
	 .word 0xf9e4d111
	 .word 0xfa34e002
	 .word 0xf4cce00c
	 .word 0xee7ce000
	 .word 0xecbce010
	 .word 0xf1f4d131
	 .word 0xeea4e000
	 .word 0xf5e4e011
	 .word 0xfa7cc010
	 .word 0xec1ce000
	 .word 0xf45cc010
	 .word 0xf9e4d011
	 .word 0xf86ce03d
	 .word 0xf444c010
	 .word 0xeff4c191
	 .word 0xf26cc010
	 .word 0xf0a4c190
	 .word 0xf694e000
	 .word 0xf06ce013
	 .word 0xf07cc010
	 .word 0xf274c010
	 .word 0xf6b4e002
	 .word 0xebe4e011
	 .word 0xeadcc210
	 .word 0xfa2ce012
	 .word 0x8143e03e
	 .word 0xea6cc010
	 .word 0x8143c000
	 .word 0xecbcc570
	 .word 0xf3e4c391
	 .word 0xea7cc010
	 .word 0xf3f4e011
	 .word 0xf46cc010
	 .word 0xefe4e011
	 .word 0xf4fcd110
	 .word 0xecfcc230
	 .word 0xec9cc450
	 .word 0xee24c010
	 .word 0xecf4e000
	 .word 0xfa44e000
	 .word 0xfa7cc010
	 .word 0xf07cc010
	 .word 0x8143c000
	 .word 0xf674e000
	 .word 0xecbcc550
	 .word 0xf884c230
	 .word 0xf3f4c311
	 .word 0xf844c010
	 .word 0xf6fce000
	 .word 0xead4c090
	 .word 0xebf4e011
	 .word 0xecbce010
	 .word 0x8143e024
	 .word 0xf86ce002
	 .word 0xf5e4e011
	 .word 0xf0ecc210
	 .word 0xeefcc330
	 .word 0xf0ece020
	 .word 0xf034c010
	 .word 0xec34c010
	 .word 0xec6ce00e
	 .word 0xeafce004
	 .word 0x8143e03d
	 .word 0xf6cce01d
	 .word 0xedf4e011
	 .word 0xf3f4e011
	 .word 0xeafcc390
	 .word 0xeab4c310
	 .word 0xeff4e011
	 .word 0xfa7cc010
	 .word 0xec3ce010
	 .word 0xf27ce000
	 .word 0xeeece003
	 .word 0xf68cc210
	 .word 0xf66cc010
	 .word 0xecdce008
	 .word 0xf8ecd130
	 .word 0xf26cc010
	 .word 0xeecce028
	 .word 0xf824e004
	 .word 0xeeece019
	 .word 0xf654c010
	 .word 0xec7ce004
	 .word 0xf42ce02c
	 .word 0xea0ce008
	 .word 0xf3f4c191
	 .word 0xeaecc090
	 .word 0xee54e002
	 .word 0xeefcc190
	 .word 0xecd4e000
	 .word 0xeff4c191
	 .word 0xf5f4c291
	 .word 0xeef4e000
	 .word 0xf7f4d031
	 .word 0x8143e02c
	 .word 0xf0a4e004
	 .word 0xebe4d131
	 .word 0xf7f4e011
	 .word 0xea54e000
	 .word 0xf7e4e011
	 .word 0xec9cc470
	 .word 0xeefce000
	 .word 0xeca4c390
	 .word 0xec4cc010
	 .word 0x8143c000
	 .word 0xefe4d131
	 .word 0xf0ece018
	 .word 0xedf4e011
	 .word 0xeefce004
	 .word 0xee24e004
	 .word 0xf3f4e011
	 .word 0xf80ce035
	 .word 0xec1cc010
	 .word 0xeefcd130
	 .word 0x8143c000
	 .word 0xf5f4e011
	 .word 0xecbce000
	 .word 0xf024e000
	 .word 0xf6fce004
	 .word 0xf634e002
	 .word 0xf4ece00a
	 .word 0xec54c010
	 .word 0xf6ace037
	 .word 0xec6cc010
	 .word 0xec94e002
	 .word 0xfa14c010
	 .word 0xececc210
	 .word 0xea94c210
	 .word 0xefe4d111
	 .word 0xeafce004
	 .word 0xec1cc010
	 .word 0xeefcd110
	 .word 0x8143c000
	 .word 0xf67ce000
	 .word 0x8143c000
	 .word 0xec7ce000
	 .word 0xeeb4d110
	 .word 0xf7f4c191
	 .word 0xf434c010
	 .word 0x8143e055
	 .word 0xee6cc010
	 .word 0x8143e01b
	 .word 0xf26cc010
	 .word 0xf47cc010
	 .word 0xf5e4c331
	 .word 0xea6cc010
	 .word 0xfa84c310
	 .word 0x8143c000
	 .word 0xf5e4e011
	 .word 0xfadcc330
	 .word 0xeafcc390
	 .word 0xf26cc010
	 .word 0xf824e000
	 .word 0xf66ce03d
	 .word 0xf8fce004
	 .word 0xf4ece01f
	 .word 0xf9f4c291
	 .word 0xf6fce000
	 .word 0xebf4c191
	 .word 0x8143e024
	 .word 0x8143c000
	 .word 0xee24c010
	 .word 0x8143c000
	 .word 0xf4fcc210
	 .word 0xf88ce016
	 .word 0xee74c010
	 .word 0xeff4e011
	 .word 0xf474e008
	 .word 0xf8c4e000
	 .word 0xfa14c010
	 .word 0xf6c4c390
	 .word 0xeaa4c290
	 .word 0xf1f4d111
	 .word 0xf8f4c230
	 .word 0xf47ce000
	 .word 0x8143c000
	 .word 0xf64ce037
	 .word 0xf65ce000
	 .word 0xf8ccc190
	 .word 0xea5cc010
	 .word 0x8143c000
	 .word 0xececd130
	 .word 0x8143c000
	 .word 0xf86ce011
	 .word 0xf0b4c230
	 .word 0xeaece033
	 .word 0x8143e03c
	 .word 0xf8fce000
	 .word 0xf0ece012
	 .word 0xf4f4d010
	 .word 0xf06cc010
	 .word 0xf8fce000
	 .word 0xf9f4d131
	 .word 0xeafce000
	 .word 0x8143c000
	 .word 0xf3e4c231
	 .word 0xeedcc210
	 .word 0xf26ce008
	 .word 0xeff4e011
	 .word 0xf07ce004
	 .word 0xf8ece022
	 .word 0xfaf4e008
	 .word 0x8143c000
	 .word 0xf224e000
	 .word 0xec1cc010
	 .word 0xf86ce032
	 .word 0xf00cc010
	 .word 0xf624e004
	 .word 0xeefcd030
	 .word 0xec9ce010
	 .word 0xf7e4c211
	 .word 0xee24c010
	 .word 0xf5e4e011
	 .word 0xfa74c010
	 .word 0xf8ecd010
	 .word 0xf26ce017
	 .word 0x8143c000
	 .word 0xfa74e008
	 .word 0xeff4e011
	 .word 0xeacce01c
	 .word 0xf694e000
	 .word 0xf26ce03f
	 .word 0xf26ce036
	 .word 0xfafcd010
	 .word 0xfa5cc010
	 .word 0xf1f4c331
	 .word 0xf0fcc190
	 .word 0xf8fce004
	 .word 0xf084e000
	 .word 0xf48ce016
	 .word 0x8143c000
	 .word 0xf67ce004
	 .word 0xec3ce000
	 .word 0xebe4e011
	 .word 0xf8f4e008
	 .word 0xebf4e011
	 .word 0xf4fcc290
	 .word 0xf1e4c331
	 .word 0xf0cce030
	 .word 0x8143e005
	 .word 0xecbcc450
	 .word 0xecdce008
	 .word 0xf2ece002
	 .word 0xea6cc010
	 .word 0x8143c000
	 .word 0x8143c000
	 .word 0xf3f4c091
	 .word 0xf67cc010
	 .word 0xea74e008
	 .word 0xf26cc010
	 .word 0xec7cc010
	 .word 0xf0ecd010
	 .word 0xf4fcc310
	 .word 0xee7ce000
	 .word 0xecbce000
	 .word 0x8143c000
	 .word 0x8143e025
	 .word 0xf07cc010
	 .word 0xf2fcd110
	 .word 0xf0c4c090
	 .word 0x8143e018
	 .word 0xfa44c010
	 .word 0xee2ce029
	 .word 0xf474c010
	 .word 0xfa4cc010
	 .word 0xea94d030
	 .word 0xf444e000
	 .word 0xfa4cc010
	 .word 0x8143e00e
	 .word 0xedf4e011
	 .word 0xf47cc010
	 .word 0xf034e002
	 .word 0xeff4c311
	 .word 0x8143c000
	 .word 0xee24e004
	 .word 0xf6ece01f
	 .word 0x8143c000
	 .word 0xee44e000
	 .word 0xfafce004
	 .word 0xea84d010
	 .word 0xf47ce004
	 .word 0xeff4e011
	 .word 0xf4ace027
	 .word 0xf86ce006
	 .word 0xf86cc010
	 .word 0xf07ce004
	 .word 0xf8ecc390
	 .word 0xf65ce000
	 .word 0xec9ce000
	 .word 0xf3e4e011
	 .word 0xf4fcc230
	 .word 0xeab4c310
	 .word 0xf8fce000
	 .word 0xefe4c211
	 .word 0xeff4c331
	 .word 0xecb4c310
	 .word 0xf2ece00d
	 .word 0xf274e008
	 .word 0xf06ce01c
	 .word 0xf244e000
	 .word 0xf8a4e000
	 .word 0xec3cc010
	 .word 0xf8ece00e
	 .word 0xf0ecd030
	 .word 0xeaa4d010
	 .word 0xeeb4e000
	 .word 0xec9ce000
	 .word 0xeefce004
	 .word 0xf5e4e011
	 .word 0xec6cc010
	 .word 0xec14e000
	 .word 0xf8dcd030
	 .word 0xf1f4e011
	 .word 0xeaece03b
	 .word 0xec7ce000
	 .word 0xee6ce004
	 .word 0xf86ce016
	 .word 0xf26ce039
	 .word 0xf8c4e004
	 .word 0x8143e043
	 .word 0xf8ecc390
	 .word 0xf85ce000
	 .word 0xf5f4c331
	 .word 0xec84c210
	 .word 0x8143c000
	 .word 0xeff4d031
	 .word 0xec3cc010
	 .word 0xf87cc010
	 .word 0xf8b4c290
	 .word 0xec1cc010
	 .word 0xec7ce000
	 .word 0xf44ce021
	 .word 0xf3e4c391
	 .word 0xefe4e011
	 .word 0xecece014
	 .word 0x8143e000
	 .word 0xf1f4c311
	 .word 0xf814e002
	 .word 0xfafce000
	 .word 0xeeecc230
	 .word 0xf66cc010
	 .word 0xee6ce002
	 .word 0xec3ce000
	 .word 0xec9ce000
	 .word 0xeecce035
	 .word 0xf274e000
	 .word 0xf27cc010
	 .word 0xececd030
	 .word 0xf47ce000
	 .word 0xfa04c010
	 .word 0xf0acc090
	 .word 0xf47cc010
	 .word 0xebf4e011
	 .word 0xecbcc470
	 .word 0xebf4d131
	 .word 0xfa34c010
	 .word 0xecd4e002
	 .word 0xedf4c291
	 .word 0xf7e4c231
	 .word 0xf04cc010
	 .word 0xec1cc010
	 .word 0xfa94d010
	 .word 0xee6ce02e
	 .word 0xf0acc230
	 .word 0xea94e000
	 .word 0x8143c000
	 .word 0xeeacc330
	 .word 0xee6cc010
	 .word 0xfa8ce003
	 .word 0xf1f4d031
	 .word 0xf9e4e011
	 .word 0xf2a4d110
	 .word 0xf604e000
	 .word 0xf66ce015
	 .word 0xf7e4c231
	 .word 0xec9ce000
	 .word 0xfafcc330
	 .word 0xeeecd030
	 .word 0x8143c000
	 .word 0xf4fce004
	 .word 0xf824c010
	 .word 0xf0d4d030
	 .word 0xede4e011
	 .word 0xfa4cc010
	 .word 0xfa8cd130
	 .word 0xf07cc010
	 .word 0xee6ce00e
	 .word 0xf3e4c331
	 .word 0xf2b4e002
	 .word 0xf3e4c211
	 .word 0xf4ecd010
	 .word 0x8143e018
	 .word 0xf7e4c291
	 .word 0xee7ce004
	 .word 0xea14c010
	 .word 0xf034e002
	 .word 0x8143e03c
	 .word 0xf7e4e011
	 .word 0xf3f4d031
	 .word 0xeff4e011
	 .word 0xf3e4e011
	 .word 0xec9cc450
	 .word 0xfa7ce000
	 .word 0xf0dcc190
	 .word 0xeeecc090
	 .word 0xee7ce000
	 .word 0xfa14e000
	 .word 0xf4ecc230
	 .word 0x8143e00a
	 .word 0xf444e000
	 .word 0xf0fcd110
	 .word 0xec3ce010
	 .word 0xf6dcc310
	 .word 0xf4ece02e
	 .word 0xf274c010
	 .word 0xf87cc010
	 .word 0xf84ce01b
	 .word 0x8143e004
	 .word 0x8143e01a
	 .word 0xeaece03c
	 .word 0xeafce004
	 .word 0x8143e04e
	 .word 0xf9e4e011
	 .word 0xf87cc010
	 .word 0xf3f4d011
	 .word 0xf0b4e000
	 .word 0xf1f4c391
	 .word 0xf68ce03c
	 .word 0x8143e063
	 .word 0xebf4e011
	 .word 0xf9f4c211
	 .word 0x8143c000
	 .word 0xf624e000
	 .word 0x8143c000
	 .word 0xf6ece017
	 .word 0xecbcc450
	 .word 0xf7e4c191
	 .word 0xeaf4c230
	 .word 0xeafce000
	 .word 0xea7ce004
	 .word 0xf4fcd110
	 .word 0xf444e000
	 .word 0xecbcc570
	 .word 0x8143c000
	 .word 0xecece026
	 .word 0xf4f4e000
	 .word 0x8143e026
	 .word 0xf67cc010
	 .word 0xebf4c211
	 .word 0x8143c000
	 .word 0x8143c000
	 .word 0xf27cc010
	 .word 0x8143e058
	 .word 0xea0ce00a
	 .word 0xfa5ce008
	 .word 0xf9f4d011
	 .word 0xf6fce000
	 .word 0xf3e4c091
	 .word 0xf6fcd010
	 .word 0xf8a4e004
	 .word 0xf86ce007
	 .word 0xf4ece00f
	 .word 0xf1e4e011
	 .word 0xea44c010
	 .word 0xec3ce010
	 .word 0xf4ecc310
	 .word 0xee84e000
	 .word 0xedf4c231
	 .word 0xeff4e011
	 .word 0xf0ece01f
	 .word 0xf2ecd130
	 .word 0xf06ce030
	 .word 0xeafcc390
	 .word 0xf9e4e011
	 .word 0xee6cc010
	 .word 0xf84cc010
	 .word 0xecbcc450
	 .word 0xf66cc010
	 .word 0x8143e005
	 .word 0x8143c000
	 .word 0xfaacc090
	 .word 0xec1cc010
	 .word 0x8143e011
	 .word 0x8143e003
	 .word 0xeaacc390
	 .word 0xec3ce000
	 .word 0xee6ce009
	 .word 0xf3f4e011
	 .word 0x8143c000
	 .word 0xfafcd010
	 .word 0x8143e029
	 .word 0xefe4e011
	 .word 0xf6ece012
	 .word 0xeed4e002
	 .word 0xee6cc010
	 .word 0xf87ce004
	 .word 0xf4fcd130
	 .word 0xf87ce000
	 .word 0xf874e008
	 .word 0xf68ce03d
	 .word 0xf66ce020
	 .word 0xeeecc230
	 .word 0xf67ce000
	 .word 0xecbce000
	 .word 0xec9cc470
	 .word 0xea6cc010
	 .word 0xeaf4c230
	 .word 0xfafce000
	 .word 0xebf4c211
	 .word 0xf8ece014
	 .word 0xee84e004
	 .word 0xf86cc010
	 .word 0xf474c010
	 .word 0xf26ce01c
	 .word 0xebe4e011
	 .word 0xfa94c390
	 .word 0xf26cc010
	 .word 0xeaecd110
	 .word 0xeeb4e000
	 .word 0xf6b4e002
	 .word 0xea7ce004
	 .word 0xea7cc010
	 .word 0xeff4e011
	 .word 0xf82ce012
	 .word 0xea34e000
	 .word 0xf02cc010
	 .word 0xf6fcc390
	 .word 0xecfcc310
	 .word 0xede4c331
	 .word 0xee74e008
	 .word 0xec9ce010
	 .word 0xf1f4c391
	 .word 0xfafcc210
	 .word 0xf7e4c231
	 .word 0xee54c010
	 .word 0xee7cc010
	 .word 0xeec4c310
	 .word 0xeafcc330
	 .word 0xf0fcc290
	 .word 0xf66ce008
	 .word 0xf66cc010
	 .word 0xf9f4e011
	 .word 0xeedce008
	 .word 0xf894c190
	 .word 0x8143e037
	 .word 0xf28ce009
	 .word 0xecfcd010
	 .word 0xf27cc010
	 .word 0x8143e067
	 .word 0xf06cc010
	 .word 0xeafcd110
	 .word 0xedf4c291
	 .word 0x8143c000
	 .word 0xf9f4e011
	 .word 0xf48ce036
	 .word 0xf6ecd110
	 .word 0xf9e4c291
	 .word 0x8143c000
	 .word 0xede4e011
	 .word 0xececd130
	 .word 0xee04e000
	 .word 0xea34c010
	 .word 0xfafce000
	 .word 0xf654c010
	 .word 0xee4cc010
	 .word 0xf4fcd010
	 .word 0xf2fce000
	 .word 0xea7cc010
	 .word 0x8143c000
	 .word 0xf86cc010
	 .word 0xeefcc390
	 .word 0xebf4e011
	 .word 0xea6cc010
	 .word 0xede4e011
	 .word 0xede4e011
	 .word 0xf024e004
	 .word 0xec3cc010
	 .word 0xf034c010
	 .word 0xf2ece006
	 .word 0xf3e4c231
	 .word 0xf0fcd030
	 .word 0xf67cc010
	 .word 0xecfcc310
	 .word 0xeafcc210
	 .word 0xf4a4e004
	 .word 0x8143c000
	 .word 0xeafce004
	 .word 0x8143c000
	 .word 0xf9f4e011
	 .word 0xf66ce035
	 .word 0xf624e004
	 .word 0xefe4e011
	 .word 0xf2ecd010
	 .word 0xebe4e011
	 .word 0xefe4d031
	 .word 0xf9e4d111
	 .word 0xf3f4d011
	 .word 0xf4ecd030
	 .word 0xf4cce010
	 .word 0xec5cc010
	 .word 0xec94c290
	 .word 0xf42cc010
	 .word 0xf1e4e011
	 .word 0x8143e026
	 .word 0xecdcc190
	 .word 0xecfcc210
	 .word 0x8143c000
	 .word 0xf6a4d130
	 .word 0xefe4e011
	 .word 0xebf4c291
	 .word 0xf244e004
	 .word 0xec3ce010
	 .word 0xec84e000
	 .word 0xf2ece001
	 .word 0xeefcd030
	 .word 0xf604e004
	 .word 0xefe4e011
	 .word 0xf07ce004
	 .word 0xec6ce033
	 .word 0xf2fcd110
	 .word 0xf66ce026
	 .word 0xeafcc330
	 .word 0xf27cc010
	 .word 0x8143e050
	 .word 0xf46ce008
	 .word 0xf64cc010
	 .word 0x8143e035
	 .word 0xeeece017
	 .word 0xebf4e011
	 .word 0xea0cc010
	 .word 0xead4e002
	 .word 0xf8ecc330
	 .word 0xec3cc010
	 .word 0x8143c000
	 .word 0xf0dcd030
	 .word 0xea0ce02f
	 .word 0xf684d010
	 .word 0xf3f4c231
	 .word 0x8143e033
	 .word 0xf4f4e000
	 .word 0xf46ce011
	 .word 0xee54c010
	 .word 0xec7cc010
	 .word 0xf66cc010
	 .word 0xede4c311
	 .word 0xee7cc010
	 .word 0xf44cc010
	 .word 0xf034c010
	 .word 0xea24c010
	 .word 0xee6ce035
	 .word 0xf67cc010
	 .word 0xee54e002
	 .word 0xec6cc010
	 .word 0xf2fcc290
	 .word 0xf7f4e011
	 .word 0xf9e4c091
	 .word 0xefe4e011
	 .word 0xee74e000
	 .word 0xf26cc010
	 .word 0x8143e01e
	 .word 0xecbcc570
	 .word 0xee6cc010
	 .word 0xec7ce004
	 .word 0xf3e4e011
	 .word 0xf3f4c391
	 .word 0xf0fcd030
	 .word 0xececc090
	 .word 0xec1cc010
	 .word 0x8143c000
	 .word 0x8143c000
	 .word 0xf66cc010
	 .word 0xf26ce021
	 .word 0xf2a4e004
	 .word 0xf0fce000
	 .word 0xf47ce000
	 .word 0xec6cc010
	 .word 0xf2fcc190
	 .word 0xf484e004
	 .word 0xf06cc010
	 .word 0xf4d4c390
	 .word 0xf9e4c211
	 .word 0xecbce010
	 .word 0xf6fcc390
	 .word 0xec8ce025
	 .word 0xf5f4c191
	 .word 0xeafce000
	 .word 0xec54c010
	 .word 0xf2ecc330
	 .word 0xee04c010
	 .word 0xeff4e011
	 .word 0xefe4c231
	 .word 0xf5f4c331
	 .word 0xeedcd130
	 .word 0xec9ce000
	 .word 0xf484e004
	 .word 0xee94e002
	 .word 0xf8b4e002
	 .word 0xf5e4e011
	 .word 0xea6ce039
	 .word 0xf45ce008
	 .word 0xf46cc010
	 .word 0x8143c000
	 .word 0xf234e000
	 .word 0xf5f4c191
	 .word 0xf7f4e011
	 .word 0x8143c000
	 .word 0xfafce004
	 .word 0xf28cc210
	 .word 0xf5f4c091
	 .word 0x8143c000
	 .word 0xee6cc010
	 .word 0xf2dcc230

attr_data {
        Name = .MAIN,
        VA= 0x60000000,
        RA= 0x170000000,
        PA= ra2pa(0x170000000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x55, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, tsbonly
        }

attr_data {
        Name = .MAIN,
        VA= 0x60000000,
        RA= 0x60000000,
        PA= ra2pa(0x60000000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
