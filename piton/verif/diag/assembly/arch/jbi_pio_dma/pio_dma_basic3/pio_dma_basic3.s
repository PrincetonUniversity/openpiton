// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_dma_basic3.s
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
***                     On top adding PIO access 
***	  		1/2/4/8 byte PIO st/ld,  with combinations
***                     of byte writes and word loads, word writes and x-word loads,etc.
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
! SECTION 1
! 8 byte writes and x-word read
        add   %g0, 0x8, %l5           ! loop count 8, 8*1B = 8B 


        setx    0x000000800e001100,     %l0,    %l3
        setx    0x4e09fe58a8f34e29,     %l0,    %l4

loop_b0 :
        stb     %l4,    [%l3]
        srlx    %l4,8,%l4
        add     %l3,1,%l3
        deccc   %l5
        bne     loop_b0
        nop

        setx    0x000000800e001100,     %l0,    %l3
        setx    0x294ef3a858fe094e,     %l0,    %l4
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! 4 byte writes and word read
        setx    0x00000000ffffffff,     %l0,    %l6
        add   %g0, 0x4, %l5           ! loop count 4, 4*1B = 4B 
        setx    0x000000f000001100,     %l0,    %l3
        setx    0x1122334455667788,     %l0,    %l4
loop_b1 :
        stb     %l4,    [%l3]
        srlx    %l4,8,%l4
        add     %l3,1,%l3
        deccc   %l5
        bne     loop_b1
        nop

        setx    0x000000f000001100,     %l0,    %l3
        setx    0x0000000088776655,     %l0,    %l4
        and     %l4, %l6, %l4
        lduw    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! 2 byte writes and word read
        setx    0x000000000000ffff,     %l0,    %l6
        add   %g0, 0x2, %l5           ! loop count 2, 2*1B = 2B 
        setx    0x000000e000001100,     %l0,    %l3
        setx    0x1122334455661122,     %l0,    %l4
loop_b2 :
        stb     %l4,    [%l3]
        srlx    %l4,8,%l4
        add     %l3,1,%l3
        deccc   %l5
        bne     loop_b2
        nop

        setx    0x000000e000001100,     %l0,    %l3
        setx    0x1122334455662211,     %l0,    %l4
        and     %l4, %l6, %l4
        lduh    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! SECTION 2
! 4 h-word writes and x-word read
        setx    0x00000000ffffffff,     %l0,    %l6
        add   %g0, 0x4, %l5           ! loop count 4, 4*2B = 8B 
        setx    0x000000d000001100,     %l0,    %l3
        setx    0x1122334455667788,     %l0,    %l4
loop_h0 :
        sth     %l4,    [%l3]
        srlx    %l4,16,%l4
        add     %l3,2,%l3
        deccc   %l5
        bne     loop_h0
        nop

        setx    0x000000d000001100,     %l0,    %l3
        setx    0x7788556633441122,     %l0,    %l4
        !and     %l4, %l6, %l4
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop



! 2 h-word writes and word read
        setx    0x00000000ffffffff,     %l0,    %l6
        add   %g0, 0x2, %l5           ! loop count 2, 2*2B = 4B 
        setx    0x000000c000001100,     %l0,    %l3
        setx    0x1122334455667788,     %l0,    %l4
loop_h1 :
        sth     %l4,    [%l3]
        srlx    %l4,16,%l4
        add     %l3,2,%l3
        deccc   %l5
        bne     loop_h1
        nop

        setx    0x000000d000001100,     %l0,    %l3
        setx    0x1122334477885566,     %l0,    %l4
        and     %l4, %l6, %l4
        lduw    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! 1 h-word writes and byte read
        setx    0x00000000000000ff,     %l0,    %l6

        setx    0x000000c000002102,     %l0,    %l3
        setx    0x1122334455667788,     %l0,    %l4
        sth     %l4,    [%l3]

        setx    0x000000c000002103,     %l0,    %l3
        setx    0x0000000000000088,     %l0,    %l4
        ldub    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! SECTION 3
! 2 word writes and x-word read
        setx    0x00000000ffffffff,     %l0,    %l6
        add   %g0, 0x2, %l5           ! loop count 2, 2*4B = 8B 
        setx    0x00000080f0001100,     %l0,    %l3
        setx    0x1122334455667788,     %l0,    %l4
loop_w0 :
        stw     %l4,    [%l3]
        srlx    %l4,32,%l4
        add     %l3,4,%l3
        deccc   %l5
        bne     loop_w0
        nop

        setx    0x00000080f0001100,     %l0,    %l3
        setx    0x4455667711223344,     %l0,    %l4
        !and     %l4, %l6, %l4
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! 1 word writes and byte read
        setx    0x00000000000000ff,     %l0,    %l6

        setx    0x000000c000003104,     %l0,    %l3
        setx    0x1122334455667788,     %l0,    %l4
        stw     %l4,    [%l3]

        setx    0x000000c000003106,     %l0,    %l3
        setx    0x0000000000000077,     %l0,    %l4
        ldub    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

        ! 1 word writes and h-word read
        setx    0x000000c000003106,     %l0,    %l3
        setx    0x0000000000007788,     %l0,    %l4
        lduh    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! SECTION 4
! x-word writes and 1/2/4 byte reads
        setx    0x000000f0f0001100,     %l0,    %l3
        setx    0x1122334455667788,     %l0,    %l4
        stx     %l4,    [%l3]

        setx    0x000000f0f0001104,     %l0,    %l3
        setx    0x0000000055667788,     %l0,    %l4
        lduw    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

        setx    0x000000f0f0001106,     %l0,    %l3
        setx    0x0000000000007788,     %l0,    %l4
        lduh    [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

        setx    0x000000f0f0001103,     %l0,    %l3
        setx    0x0000000000000044,     %l0,    %l4
        ldub    [%l3],    %l5
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


