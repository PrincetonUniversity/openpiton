// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ncrdwr1a.s
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
***  Test Description : NC reads and writes. these ones are from user mode.
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
        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

	ta	0x30

	setx	user_data_start, %l0, %l1	! user data start
	setx	ncdata_base, %l0, %g3		! nc data base
	setx	0x1000, %l0, %l3		! nc datawork area
	add	%g3, %l3, %g3

!=====================
! Now some NC writes and reads
!=====================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop1:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop1
nop

mov 0x78, %g4
set 0x10, %g2
set 0x10, %g5

ldloop1:
ldx [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	bad_end
nop
dec %g2
sub %g4, 0x8, %g4
deccc %g5
bne ldloop1
nop

!========================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop2:
st %g2, [%g3 + %g4]
inc %g2
add 0x4, %g4, %g4
deccc %g5
bne stloop2
nop

mov 0x3c, %g4
set 0x10, %g2
set 0x10, %g5

ldloop2:
ld [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	bad_end
nop
dec %g2
sub %g4, 0x4, %g4
deccc %g5
bne ldloop2
nop

!=============================

mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop3:
sth %g2, [%g3 + %g4]
inc %g2
add 0x2, %g4, %g4
deccc %g5
bne stloop3
nop

mov 0x1e, %g4
set 0x10, %g2
set 0x10, %g5

ldloop3:
lduh [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	bad_end
nop
dec %g2
sub %g4, 0x2, %g4
deccc %g5
bne ldloop3
nop

!=============================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop4:
stb %g2, [%g3 + %g4]
inc %g2
add 0x1, %g4, %g4
deccc %g5
bne stloop4
nop

mov 0xf, %g4
set 0x10, %g2
set 0x10, %g5

ldloop4:
ldub [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	bad_end
nop
dec %g2
sub %g4, 0x1, %g4
deccc %g5
bne ldloop4
nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
.align 0x40
user_data_start:
	.skip 1000
user_data_end:


SECTION .NCDATA  DATA_VA=0xd01ee000 

attr_data {
        Name = .NCDATA,
        VA=0xd01ee000,
        RA=0xcf00bee000,
        PA=0xcf00bee000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base
ncdata_base:
	.skip 1000


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

done;

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end

