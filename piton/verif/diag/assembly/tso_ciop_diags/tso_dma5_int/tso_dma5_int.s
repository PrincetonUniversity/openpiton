// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_dma5_int.s
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
/***************************************************************************
*** 
***  Test Description : trying DMA  with interrupts
***
**********************************************************************/
#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define  tmp0 %l0
#define  tmp1 %l1
#define  tmp2 %l2
#define  tmp3 %l3

#define  flagr %l5

#define  addr0 %o0

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#include "boot.s"

.text
.global main

main:

th_fork(th_main, tmp0)

th_main_0:
	clr 	flagr
	setx	user_data_start, tmp0, addr0
	set	0x55, tmp3

loop00:	
	sub	flagr, 2,  tmp0
	brnz	tmp0, loop00
	nop

	ba	normal_end

th_main_1:
	clr 	flagr
	setx	user_data_start, tmp0, addr0
	add	addr0, 0x40, addr0
	set	0x455, tmp3
	ta	0x30

loop10:	
	sub	flagr, 2,  tmp0
	brnz	tmp0, loop10
	nop

	ba	normal_end

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:

        ldxa    [addr0]ASI_AS_IF_USER_PRIMARY, tmp0
        sub     tmp0, tmp3, tmp0
        brnz    tmp0, h_bad_end
        nop

        stxa    %g0, [addr0]ASI_AS_IF_USER_PRIMARY

! Check the correct bit is set in the ASI interrupt registers.
        ldxa    [%g0] ASI_SWVR_INTR_RECEIVE,     tmp0
        set    	0x10, tmp1
        cmp     tmp0, tmp1
        bne     h_bad_end        
        nop
        
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] ASI_SWVR_UDB_INTR_R,     tmp0
        set     0x4,  tmp1
        cmp     tmp0, tmp1
        bne     h_bad_end        
        nop

       ! Read data J_INT_ADATA0
        setx    0x0000009f00000600,     tmp0,    tmp1
        ldx     [tmp1], tmp2

       ! Read data J_INT_ADATA1
        setx    0x0000009f00000700,     tmp0,    tmp1
        ldx     [tmp1], tmp2

       ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     tmp0,    tmp1
        ldx     [tmp1], tmp2
        stx     %g0,    [tmp1]

	inc	flagr
	retry;

!---------------------------------------------------------------------------

.global intr0x190_custom_trap
intr0x190_custom_trap:

! Initialize jbi interrupt vector.        
        setx    0x0000009800000a00,     tmp0,    tmp1     
        set     0x4,        tmp2
        stx     tmp2,    [tmp1]

/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/
	setx 0xdeadbeefdeadbeef, tmp0, tmp1
	setx 0xcf00beef00, tmp0, tmp2
	stx tmp1, [tmp2]
	setx 0xef00beef00, tmp0, tmp2
	stx tmp1, [tmp2]

	done;

h_bad_end:
	ta T_BAD_TRAP

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end
