// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_dma_basic_fake_dma1.s
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
***  Test Description : trying producer consumer with interrupts. (initial)
***                     On top adding PIO access just one access
***                     Added read and write to address space corresponding to 
***                     fake dma . Add more interaction between memory and Fake dma writes
***                     PIO comparing on memory st and vice-versa
***
**********************************************************************/
#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

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

th_fork(th_main, %l0)

th_main_0:
	ta	0x30


	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
loop0:	
	ldub	[%l1 + 0x7f], %l3
        deccc   %l2
	bnz	loop0
	nop
!	prefetch [%l1 + 0x3f], #n_writes
	

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
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:


/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================





! add the PIO loads and stores here.
        setx    0x0000008010000000,     %l0,    %l3
        setx    0x4e09fe58a8f34e29,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the Memory loads and stores here.
        setx    0x0000000010000000,     %l0,    %l3
        setx    0x3333333333333333,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the Memory loads and stores here.
        setx    0x0000000020000000,     %l0,    %l3
        setx    0x4444444444444444,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the PIO loads here. ( same index as above )
        setx    0x0000008020000000,     %l0,    %l3
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the PIO loads and stores here. ( same index as above )
        setx    0x0000008020000000,     %l0,    %l3
        setx    0x1111111222222222,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the Memory loads here.
        setx    0x0000000020000000,     %l0,    %l3
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


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


