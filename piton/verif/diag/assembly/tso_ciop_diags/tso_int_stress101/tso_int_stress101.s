// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_int_stress101.s
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
***  Test Description : interrupts
***
**********************************************************************/
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define JBI_CONFIG

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60 intr0x60_custom_trap

#define MAIN_TEXT_DATA_ALSO

#include "boot.s"

.text
.global main

main:

setx	0x10, %o0, %l7
th_fork(th_main, %l0)

! thread 0 is passive in this diag
!--------------------------------------
th_main_0:
	add	%g0, 0x0, %i0

	ba	normal_end
	nop

! thread 1 receives SSI interrupts
!--------------------------------------
th_main_1:
	add	%g0, 0x1, %i0

loop1:
	brnz %l7, loop1		! check for end
	nop

	ba	normal_end
	nop

!--------------------------------------
! thread 2 receives JBI interrupts
!--------------------------------------
th_main_2:
	add	%g0, 0x2, %i0

	add	%g0, 0x56, %o0	! initialize JBI, wake up SJM-s
	ta	0x30	

loop2:				! loop forever - JBI int will stop it
	brnz	%l7, loop2
	nop

        add     %g0, 0x100, %o0         ! 0x100 requests a store.
        add     %g0, 0x1, %o2		! finish the simulation flag

        setx    0xcf00bee100, %l1, %o1
        ta      0x30
	
        setx    0xef00bee100, %l1, %o1
        ta      0x30

	ba	normal_end
	nop
	

! thread 3 is not active in this diag
!--------------------------------------
th_main_3:

	add	%g0, 0x3, %i0
	ba normal_end
	nop

th_main_4:
!--------------------------------------
	add	%g0, 0x4, %i0
	setx	loop2, %o0, %o1

loop4:
	ld	[%o1], %o2	! cross-mod code forever
	st	%o2, [%o1]	! IOB int will stop it.
	ba	loop4
	flush %o1


! thread 5 - some JBI stores and loads
!-------------------------------------
th_main_5:
	add	%g0, 0x5, %i0

	setx	0xcf00bee500, %l1, %o1

loop5:
	add	%g0, 0x100, %o0		! 0x100 requests a store.
	add	%g0, 0x5, %o2
	ta	0x30	
	
	add	%o1, 0x20, %o1
	add	%g0, 0x50, %o2
	ta	0x30	

	add	%g0, 0x101, %o0		! 0x101 requests a load
	ta	0x30	
	mov	%o0, %l1

	sub	%o1, 0x20, %o1
	add	%g0, 0x101, %o0		! 0x101 requests a load
	ta	0x30	
	mov	%o0, %l0

	subcc	%l1, 0x50, %g0
	bnz	bad_end
	nop
	subcc	%l0, 0x5, %g0
	bnz	bad_end
	nop
	ba	loop5			! IOB int will stop it.
	nop

!-------------------------------
! some more JBI stores and loads
!-------------------------------

th_main_6:
	add	%g0, 0x6, %i0

	setx	0xcf00bee600, %l1, %o1

loop6:
	add	%g0, 0x100, %o0		! 0x100 requests a store.
	add	%g0, 0x6, %o2
	ta	0x30	
	
	add	%o1, 0x20, %o1
	add	%g0, 0x60, %o2
	ta	0x30	

	add	%g0, 0x101, %o0		! 0x101 requests a load
	ta	0x30	
	mov	%o0, %l1

	sub	%o1, 0x20, %o1
	add	%g0, 0x101, %o0		! 0x101 requests a load
	ta	0x30	
	mov	%o0, %l0

	subcc	%l1, 0x60, %g0
	bnz	bad_end
	nop
	subcc	%l0, 0x6, %g0
	bnz	bad_end
	nop
	ba	loop6
	nop


!-------------------------------------
! some  SSI stores, loads and Ifetches
!-------------------------------------
th_main_7:
	add	%g0, 0x7, %i0

	setx	ssi_data, %l0, %o0
	setx 	ssi_text, %l0, %l1

loop7:
	mov	0x77, %o1
	mov	0x77, %o2
	jmpl    %l1,%o7
        nop

	subcc	%o1, %o2, %g0
	bnz	bad_end
	nop

	mov	0x77, %o1
	mov	0x77, %o2
	jmpl    %l1,%o7
        nop

	subcc	%o1, %o2, %g0
	bnz	bad_end
	nop

	ba	normal_end
	nop

	
!-------------------------------------------
! some  more SSI stores, loads and Ifetches
!-------------------------------------------
th_main_8:
	add	%g0, 0x8, %i0
	setx	ssi_data, %l0, %o0
	add	%o0, 0x10, %o0

	setx 	ssi_text, %l0, %l1

loop8:
	mov	0x88, %o1
	mov	0x88, %o2
	jmpl    %l1,%o7
        nop

	subcc	%o1, %o2, %g0
	bnz	bad_end
	nop

	mov	0x88, %o1
	mov	0x88, %o2
	jmpl    %l1,%o7
        nop

	subcc	%o1, %o2, %g0
	bnz	bad_end
	nop

	ba	normal_end
	nop


!-------------------------------------------
! JBI ASI config reads and writes
!-------------------------------------------
th_main_9:
	add	%g0, 0x9, %i0
inf_loop9:
	add	%g0, 0x102, %o0
	ba	inf_loop9
	ta	0x30

!-------------------------------------------
! JBI ASI config reads and writes
!-------------------------------------------

th_main_10:
	add	%g0, 0xa, %i0
inf_loop10:
	add	%g0, 0x103, %o0
	ba	inf_loop10
	ta	0x30

!-------------------------------------------
! IOB config space accesses
!-------------------------------------------
th_main_11:
	add	%g0, 0xb, %i0
inf_loop11:
	add	%g0, 0x104, %o0
	ba	inf_loop11
	ta	0x30

!-------------------------------------------
! clock unit config space accesses
!-------------------------------------------

th_main_12:
	add	%g0, 0xc, %i0
inf_loop12:
	add	%g0, 0x105, %o0
	ba	inf_loop12
	ta	0x30

!-------------------------------------------
! reset unit config space accesses
!-------------------------------------------
th_main_13:
	add	%g0, 0xd, %i0
inf_loop13:
	add	%g0, 0x106, %o0
	ba	inf_loop13
	ta	0x30

!----------------------------
! thread 14 go to thread 11
!----------------------------
th_main_14:
	add	%g0, 0xe, %i0
	ba	inf_loop11
	nop

!----------------------------
! thread 15 go to thread 11
!----------------------------
th_main_15:
	add	%g0, 0xf, %i0
	ba	inf_loop11
	nop

!================================================

	
th_main_16:
	add	%g0, 0x10, %i0

	add	%g0, 0x55, %o0	! initialize SSI
	ta	0x30	

	setx gen_ssi_int, %o0, %o1

loop16:
	mov  %l7, %l6
	jmpl %o1, %o7		! cause an interrupt
	nop

	ba loop16		! do not wait for this 
	nop			! thread to end

!--------------------------------------------
th_main_17:
th_main_18:

	ba	normal_end
	nop

th_main_19:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20404, %o6, %o2	! sleep to thread 4
	setx	0x30404, %o6, %o3	! wake  to thread 4
	setx	0x00404, %o6, %o4	! int   to thread 4
	ba	iob_int_loop
	nop

th_main_20:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20505, %o6, %o2	! sleep to thread 5
	setx	0x30505, %o6, %o3	! wake  to thread 5
	setx	0x00505, %o6, %o4	! int   to thread 5
	ba	iob_int_loop
	nop

th_main_21:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20606, %o6, %o2	! sleep to thread 6
	setx	0x30606, %o6, %o3	! wake  to thread 6
	setx	0x00606, %o6, %o4	! int   to thread 6
	ba	iob_int_loop
	nop

th_main_22:
th_main_23:
	ba	normal_end
	nop

th_main_24:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20909, %o6, %o2	! sleep to thread 9
	setx	0x30909, %o6, %o3	! wake  to thread 9
	setx	0x00909, %o6, %o4	! int   to thread 9
	ba	iob_int_loop
	nop

th_main_25:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20a0a, %o6, %o2	! sleep to thread a
	setx	0x30a0a, %o6, %o3	! wake  to thread a
	setx	0x00a0a, %o6, %o4	! int   to thread a
	ba	iob_int_loop
	nop

th_main_26:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20b0b, %o6, %o2	! sleep to thread b
	setx	0x30b0b, %o6, %o3	! wake  to thread b
	setx	0x00b0b, %o6, %o4	! int   to thread b
	ba	iob_int_loop
	nop

th_main_27:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20b0b, %o6, %o2	! sleep to thread b
	setx	0x30b0b, %o6, %o3	! wake  to thread b
	setx	0x00b0b, %o6, %o4	! int   to thread b
	ba	iob_int_loop
	nop

th_main_28:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20c0c, %o6, %o2	! sleep to thread c
	setx	0x30c0c, %o6, %o3	! wake  to thread c
	setx	0x00c0c, %o6, %o4	! int   to thread c
	ba	iob_int_loop
	nop

th_main_29:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20d0d, %o6, %o2	! sleep to thread d
	setx	0x30d0d, %o6, %o3	! wake  to thread d
	setx	0x00d0d, %o6, %o4	! int   to thread d
	ba	iob_int_loop
	nop

th_main_30:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20e0e, %o6, %o2	! sleep to thread e
	setx	0x30e0e, %o6, %o3	! wake  to thread e
	setx	0x00e0e, %o6, %o4	! int   to thread e
	ba	iob_int_loop
	nop

th_main_31:
	add	%g0, 0x107, %o0		! iob interrupt requests
	setx	0x20f0f, %o6, %o2	! sleep to thread f
	setx	0x30f0f, %o6, %o3	! wake  to thread f
	setx	0x00f0f, %o6, %o4	! int   to thread f
	ba	iob_int_loop
	nop


normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

gen_ssi_int:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int)) -> extint(100)
	retl
	nop
!-----------------------------


iob_int_loop:
	
	mov	%o2, %o1
	ta	0x30			! issue a service request

	mov	%o3, %o1
	ta	0x30			! issue a service request

	mov	%o4, %o1		! interrupt
	ta	0x30			! issue a service request

	ba	iob_int_loop
	nop


user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.skip 1000
user_data_end:


SECTION .SSI_SEG TEXT_VA=0xfff0002000
attr_text {
        Name = .SSI_SEG,
        VA=0xfff0002000,
        RA=0xfff0002000,
        PA=0xfff0002000,
        part_0_d_ctx_nonzero_ps0_tsb, part_0_i_ctx_nonzero_ps0_tsb
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global ssi_text
ssi_text:
	st	%o1, [%o0]

	retl
	ld	[%o0], %o2

.global ssi_data
ssi_data:
.xword 0xbeefbeefbeefbeef 
.skip 0x40
/***********************************************************************/

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.text

! this is the interrupt trap. Both producer and consumer get it.
! consumer checks data and tells the producer to proceed.
! producer proceeds when it got this trap.
.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g2;

	sub	%g2, 0x1, %g3
	brz	%g3, check_ssi
	nop

	sub	%g2, 0x2, %g3
	brz	%g3, check_jbi
	nop

	sub	%g2, 0x1f, %g3
	brz	%g3, hw_int
	nop

	sub	%g2, 0x1e, %g3
	brz	%g3, hw_int
	nop

	ba	decrement
	nop

check_ssi:
        setx    0x9800000410, %g1, %g2	! Set interrupt management reg address.
        ldx     [%g2], %g3
	and	%g3, 0x4, %g3
	brz	%g3, h_bad_end
	nop
        stx     %g0, [%g2] 
        ldx     [%g2], %g3
	ba	h_normal_end
	nop

check_jbi:
        setx    0x9f00000000, %g1, %g3
        ldx     [%g3 + 0x600], %g4
        ldx     [%g3 + 0x700], %g5
        setx    0x9f00000b00, %g1, %g3
        ldx     [%g3], %g1              ! Read interrupt busy bit.
	and	%g1, 0x20, %g1
	brz	%g1, h_bad_end
	nop
        stx     %g0, [%g3]              ! Clear interrupt busy bit.
        ldx     [%g3], %g1              ! Read interrupt busy bit.
	dec %l7
	retry

hw_int:
	retry

decrement:
	dec %l7
	brz	%l7,	endit
	nop
	retry

endit:
	ta	T_GOOD_TRAP

!-----------------------------------------------------------------------

! this is the user defined producer trap.
.global intr0x190_custom_trap
intr0x190_custom_trap:

	sub %o0, 0x55, %g1
	brz	%g1, init_ssi
	nop

	sub %o0, 0x56, %g1
	brz	%g1, init_jbi
	nop

	sub %o0, 0x100, %g1
        brz     %g1, store_service
	nop

	sub %o0, 0x101, %g1
        brz     %g1, load_service
	nop

	sub %o0, 0x102, %g1
        brz     %g1, jbi1_service
	nop

	sub %o0, 0x103, %g1
        brz     %g1, jbi2_service
	nop

	sub %o0, 0x104, %g1
        brz     %g1, iob_service
	nop

	sub %o0, 0x105, %g1
        brz     %g1, clk_service
	nop

	sub %o0, 0x106, %g1
        brz     %g1, rst_service
	nop

	sub %o0, 0x107, %g1
        brz     %g1, iob_int_service
	nop

	sub %o0, 0x108, %g1
        brz     %g1, hw_int_service
	nop

	ba	h_bad_end
	nop

init_jbi:

! Clear interrupt busy bit.
!---------------------------------
	setx 0x9f00000b00,  %g1, %g3	!clear J_INT_ABUSY
	stx  %g0, [%g3]

	setx 0x9800000a00, %g1, %g3	!initialize J_INT_VEC reg
	set  0x2, %g2			!int vector = 0x2
	stx  %g2, [%g3]	

! IOSYNC cycles to start the sjm-s
!---------------------------------
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xcf00beef00, %g1, %g3
	stx %g2, [%g3]
	setx 0xef00beef00, %g1, %g3
	stx %g2, [%g3]

	done;

init_ssi:

	setx    0x9800000010, %g1, %g2	!Set interrupt management reg. address.
        set     0x101, %g1     		!Write to interrupt management reg.
        stx     %g1, [%g2]		!thread 1 will take int vector 1
       
        setx    0x9800000410, %g1, %g2	!clear the pending bit of INT_CTL reg.
        stx     %g0,    [%g2]		!for SSI interrupt
                
        setx    0xff00010088, %g1, %g2	!Set ssi timeout register address.
        setx    0x1800000, %g1, %g3     !Write to ssi timeout register.
        stx     %g3,    [%g2]

	done

hw_int_service:
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	inc 	%o1
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	inc 	%o1
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	inc 	%o1
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	inc 	%o1
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	inc 	%o1
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	inc 	%o1
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	inc 	%o1
	stxa	%o1, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt

	done

store_service:
	stx	%o2, [%o1]
	done

load_service:
	ldx	[%o1], %o0
	done;

jbi1_service:
	setx	0x8000000000, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end

	ldx	[%g1 + 0x8 ], %g2
	stx	%g2, [%g1 + 0x8]
	ldx	[%g1 + 0x8 ], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end
	nop
	done

jbi2_service:
	setx	0x8000010000, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end

	ldx	[%g1 + 0x20 ], %g2
	brnz	%g2, h_bad_end
	nop

	ldx	[%g1 + 0x28 ], %g2
	brnz	%g2, h_bad_end
	nop

	ldx	[%g1 + 0x30 ], %g2
	stx	%g2, [%g1 + 0x30]
	ldx	[%g1 + 0x30 ], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end
	nop

	ldx	[%g1 + 0x38 ], %g2
	stx	%g2, [%g1 + 0x38]
	ldx	[%g1 + 0x38 ], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end
	nop

	ldx	[%g1 + 0x40 ], %g2

	done

iob_service:
	setx	0xff00010088, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end

	done

clk_service:
	setx	0x9600000000, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end

	setx	0x9600000008, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end
	nop

	setx	0x9600000038, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end
	nop

	setx	0x9600000040, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end
	nop

	done

rst_service:
	setx	0x9800000810, %g2, %g1
	ldx	[%g1], %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	subcc	%g2, %g3, %g0
	bnz	h_bad_end

	done

iob_int_service:
	setx	0x9800000800, %g2, %g1
	stx	%o1, [%g1]
	done
	
h_bad_end:
        ta      T_BAD_TRAP
h_normal_end:
        ta      T_GOOD_TRAP

!-----------------------------------------------------------------------

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.data

.global my_hyp_data
.align 0x40
my_hyp_data:
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80
	.word 0x80

.end
