// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_dma_basic2_1.s
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
***	  		1/2/4/8 byte PIO st/ld, SJM5 disabled
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
        setx    0x000000800e000000,     %l0,    %l3
        setx    0x4e09fe58a8f34e29,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the PIO loads and stores here.
        setx    0x000000800e800000,     %l0,    %l3
        setx    0x4e09f32737f34e29,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f000000,     %l0,    %l3
        setx    0x4e09fe58a8348949,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f800000,     %l0,    %l3
        setx    0x4352634254234e29,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000c000000000,     %l0,    %l3
        setx    0x35757e58a8f34e29,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000d000000000,     %l0,    %l3
        setx    0x4e09357578f34e29,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000e000000000,     %l0,    %l3
        setx    0x4e09fe5357574e29,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop



! add the PIO loads and stores here.
        setx    0x000000f000000000,     %l0,    %l3
        setx    0x4e09fe58a8357579,     %l0,    %l4
        stx     %l4,    [%l3]
        ldx     [%l3],    %l5
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! doing byte access


! add the PIO loads and stores here.
        setx    0x00000000000000ff,     %l0,    %l6

        setx    0x000000800e000100,     %l0,    %l3
        setx    0x4e09fe58a8f34e29,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the PIO loads and stores here.
        setx    0x000000800e800100,     %l0,    %l3
        setx    0x4e09f32737f34e29,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f000100,     %l0,    %l3
        setx    0x4e09fe58a8348949,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f800100,     %l0,    %l3
        setx    0x4352634254234e29,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000c000000100,     %l0,    %l3
        setx    0x35757e58a8f34e29,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000d000000100,     %l0,    %l3
        setx    0x4e09357578f34e29,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000e000000100,     %l0,    %l3
        setx    0x4e09fe5357574e29,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop



! add the PIO loads and stores here.
        setx    0x000000f000000100,     %l0,    %l3
        setx    0x4e09fe58a8357579,     %l0,    %l4
        stb     %l4,    [%l3]
        ldub    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop




! doing halfword access

! add the PIO loads and stores here.
        setx    0x000000000000ffff,     %l0,    %l6
        setx    0x000000800e000200,     %l0,    %l3
        setx    0x4e09fe58a8f34e29,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the PIO loads and stores here.
        setx    0x000000800e800200,     %l0,    %l3
        setx    0x4e09f32737f34e29,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f000200,     %l0,    %l3
        setx    0x4e09fe58a8348949,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f800200,     %l0,    %l3
        setx    0x4352634254234e29,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000c000000200,     %l0,    %l3
        setx    0x35757e58a8f34e29,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000d000000200,     %l0,    %l3
        setx    0x4e09357578f34e29,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000e000000200,     %l0,    %l3
        setx    0x4e09fe5357574e29,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop



! add the PIO loads and stores here.
        setx    0x000000f000000200,     %l0,    %l3
        setx    0x4e09fe58a8357579,     %l0,    %l4
        sth     %l4,    [%l3]
        lduh    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! doing word access

! add the PIO loads and stores here.
        setx    0x00000000ffffffff,     %l0,    %l6

        setx    0x000000800e000300,     %l0,    %l3
        setx    0x4e09fe58a8f34e29,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop

! add the PIO loads and stores here.
        setx    0x000000800e800300,     %l0,    %l3
        setx    0x4e09f32737f34e29,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f000300,     %l0,    %l3
        setx    0x4e09fe58a8348949,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000800f800300,     %l0,    %l3
        setx    0x4352634254234e29,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000c000000300,     %l0,    %l3
        setx    0x35757e58a8f34e29,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000d000000300,     %l0,    %l3
        setx    0x4e09357578f34e29,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop


! add the PIO loads and stores here.
        setx    0x000000e000000300,     %l0,    %l3
        setx    0x4e09fe5357574e29,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
        cmp     %l5, %l4
        bne     h_bad_end
        nop



! add the PIO loads and stores here.
        setx    0x000000f000000300,     %l0,    %l3
        setx    0x4e09fe58a8357579,     %l0,    %l4
        stw     %l4,    [%l3]
        lduw    [%l3],    %l5
        and     %l4, %l6, %l4
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


