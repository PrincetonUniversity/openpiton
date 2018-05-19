// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: real_non_real_pgs_2t.s
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
!!-------------------------------------------------------------------------------
!!
!!	Test MT thread accessing DMMU/IMMU
!!
!!	The diag tries to do the following
!!
!!      have an entry in TLB that would translate address to PA1 != VA with R=0
!!         have an entry in TLB that would translate address to PA2 != PA1|VA with R=1
!!         use above pair of TLB entries to catch bypass/translate problems
!!           where access bypasses TLB (either due to ASI, or TLB being disabled via
!!           LSU_CONTROL_REG or RED_mode, or in hyperpriv), the attributes depend on
!!           table 13-6 in section 13.4 or the ASI (usually the difference is in the
!!           CP or E bits). Use diagnostic cache read to I/D cache after the access
!!           to check that CP was really correct.  E is much trickier to check,
!!           for NoFault ASIs you get different traps, but for other ASIs you need
!!           to generate a trap that sets SFSR and then look at SFSR.E.
!!
!!	Thr0: Regular page VA -> PA1
!!		1. Set LSU_CTL_REG for bypass and use RA1 (bypass uses RA)
!!	Thr1: Real page VA -> PA2 (!= VA|PA1)
!!		1. Use ASI_REAL_MEM for access
!!		2. Set LSU_CTL_REG for bypass and use RA2 direct
!!	Thr2: HYPervisor
!!		1. Use VA as the phy addr directly
!!
!!	All these should not collide unless there's Xlation / other MMU problems
!!
!! 	Perform diagnostic reads on all threads to check attr's
!!
!!-------------------------------------------------------------------------------

#define THREAD_COUNT 	2
#define PRT_ID 5 

#define USER_TEXT_MT_MAP
#define USER_DATA_MT_MAP

#define THR0_BASE_TEXT_ADDR 0x152000000
#define THR0_BASE_TEXT_ADDR_PA 0x1b48030000
#define THR0_BASE_DATA_ADDR 0x125000000
#define THR0_BASE_DATA_ADDR_PA 0x1b58030000

#define THR_INCREMENT	0x150000

#define THR_0_PARTID PRT_ID
#define THR_1_PARTID PRT_ID
#define THR_2_PARTID PRT_ID

#define ASI_REAL_MEM 0x14

#include "boot.s"

SECTION  .MAIN0
.text
.global main0
main0:
	setx thr_0_start, %l0, %l1
	jmpl %l1, %l2
	nop


SECTION .THR0     TEXT_VA=THR0_BASE_TEXT_ADDR, DATA_VA=THR0_BASE_DATA_ADDR
attr_text {
        Name = .THR0,
        VA=THR0_BASE_TEXT_ADDR,
        RA=pa2ra(THR0_BASE_TEXT_ADDR_PA, THR_0_PARTID),
        PA=THR0_BASE_TEXT_ADDR_PA,
        part_5_i_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_data {
        Name = .THR0,
        VA=THR0_BASE_DATA_ADDR,
        RA=pa2ra(THR0_BASE_DATA_ADDR_PA, THR_0_PARTID),
        PA=THR0_BASE_DATA_ADDR_PA,
        part_5_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_text {
        Name=.THR0,
        hypervisor
}
attr_data {
        Name=.THR0,
        hypervisor
}

.global thr_0_start
thr_0_start:

/* 
!!	try to access in regular user mode using the above Xlation 
*/

thr0_ldx_loop:
	setx data_thr0, %l1, %l2
	mov 0xf, %i2
	mov 0x0, %i1 !! counter

thr0_load:
	
	ldx	[%l2],		%g4
	stx	%g4, 		[%l2]

	add	%l2,	0x8,	%l2
	add	%i1,	0x1, 	%i1
	sub	%i1,	%i2,	%i3
	brnz	%i3,	thr0_load
	nop

thr0_hyp:
/*
 * Go into HYP mode. Turn off TLB Xlation and get out to user mode
*/

        ta      T_CHANGE_HPRIV
        nop

	ldxa    [%g0] 0x45, %l4 		!! LSU CTL REG
	and	%l4, 0xfffffffffffffff7, %l4	!!  Set .DM off
	stxa	%l4, [%g0] 0x45			!!  Write to LSU CTL REG

	ta	T_CHANGE_NONHPRIV

phy_acc:
	setx	pa2ra(THR0_BASE_DATA_ADDR_PA, THR_0_PARTID), %l5,%l6

	ldx	[%l6],		%i7
	stx	%i7,		[%l6]

	ba	diag_pass
	nop

diag_pass:
        ta      T_GOOD_TRAP
        nop

.data

.global data_thr0

data_thr0:

        .xword  0x23198b1c408914a3
        .xword  0x682b631e0447e828
        .xword  0x14a257b9797917f4
        .xword  0x07626c570bf8c04a
        .xword  0xe6e9bdb9f049888c
        .xword  0x78a5932382dd8f06
        .xword  0xfcbe5a73828b3af6
        .xword  0x802e360a349f6d9e
        .xword  0x8be836681615995e
        .xword  0xe6a663d1ac33f88d
        .xword  0x1aa10c73ffb6e49a
        .xword  0x34d4f0295a7c361b
        .xword  0x07ffdf0cd63685b7
        .xword  0x5456f410ca6f858c
        .xword  0x613e1d361991b4c7
        .xword  0x8b54962956e5372e
        .xword  0x3819c9ce4b704809
        .xword  0x0269c8176a7c2168
        .xword  0x3639afedf3e81ea7
        .xword  0x16081b6e41ec9f36
        .xword  0x4644fb8680a82594
        .xword  0x8f7c7b87a2f49da3
        .xword  0x8cf5e8dc0d7cf4c7
        .xword  0x6a058e9814dadd7d
        .xword  0x06aeda0d434f3b66
        .xword  0xdf6cd23fc558c395
        .xword  0x308013db15760f71
        .xword  0xcb222b7db0d18bf7
        .xword  0x25b233de98a95c9e
        .xword  0x6ada167ae3d0e614
        .xword  0xd0d076d156983bd9
        .xword  0x3fcd304231e89067
        .xword  0x50bbca840385e67a
        .xword  0x7a9184a84ae1df6b
        .xword  0x1f9b3191c4ed2d51
        .xword  0x9836cef8b86a47ca
        .xword  0x5e185e36007a37c4
        .xword  0x70349698ed573b63
        .xword  0x6353443175f75f78
        .xword  0x9bda0cf467d4a43c
        .xword  0x5be9c0534f2a4b1b
        .xword  0xcd0cf3378075d129
        .xword  0x3094e2c8bbe712a4
        .xword  0x072a3daaa281d635
        .xword  0x223efa0f6924a0bd
        .xword  0xc346459601b07cc8
        .xword  0xb548b652d92ee0b7
        .xword  0x362b37ef4c7f87cf
        .xword  0xb833bd345f56e505
        .xword  0x824705ba1fcfcf8c
        .xword  0xc932b4b562fd1ba5
        .xword  0x3daa5462e7391b04
        .xword  0x2f7c38d0bb0037a8

/*
 * Get into PRIV mode and use ASI_REAL_MEM with VA as the RA
*/


SECTION  .MAIN1
attr_text {
        Name=.MAIN1,
        hypervisor
}

.text
.global main1
main1:

	setx thr1_data, %l0, %l2
	ldx [%l2], %l3

!	Change to PRIV mode

	ta T_CHANGE_PRIV

!	Use REAL_MEM

	setx THR0_BASE_DATA_ADDR, %i0, %i1
	setx 0xabababa, %i2, %i3
	stxa %i3, [%i1] ASI_REAL_MEM  
	ldxa [%i1] ASI_REAL_MEM , %i4

	sub %i4, %i3, %i5
	brnz %i5, diag_fail
	nop

! set LSU_CTL_REG.DM = 0

        ta      T_CHANGE_HPRIV
        nop

	ldxa    [%g0] 0x45, %l4 		!! LSU CTL REG
	and	%l4, 0xfffffffffffffff7, %l4	!!  Set .DM off
	stxa	%l4, [%g0] 0x45			!!  Write to LSU CTL REG

	ta	T_CHANGE_NONHPRIV

! Use direct access instead of ASI_REAL_MEM

	ldx [%i1], %l1
	sub %l1, %i3, %l7

	brnz  %l7, diag_fail
	nop

diag_pass:
        ta      T_GOOD_TRAP
        nop

diag_fail:
	ta      T_BAD_TRAP
	nop

.data

thr1_data:
        .xword  0x2f7c38d0bb0037a8
	.xword	0xabababababababab

