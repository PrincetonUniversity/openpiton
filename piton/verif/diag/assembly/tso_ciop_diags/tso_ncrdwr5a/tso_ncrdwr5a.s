// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ncrdwr5a.s
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
*** Test Description : cas ldstub, swap prefetch to NC space
*** prefetch is a nop. The others trap.
***
**********************************************************************/
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#define H_HT0_Data_Access_Exception_0x30 data_access_exception_custom_trap

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
! Now some forbidden NC operations
!=====================
	mov %g0, %l4
	set 0x1, %g2

	cas 	 [%g3], %g0, %g2

	ldstub 	 [%g3], %g2

	swap 	 [%g3], %g2

	prefetch [%g3], #n_writes

	sub	%l4, 3, %l4
	brnz	%l4, bad_end
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

! programming the JBI - not quite rrugho
!=====================
!setx 0x0000000006040012, %g1, %g2
!setx 0x8503000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000100, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000000, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000400, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000108, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000101, %g1, %g2
!setx 0x9800000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000408, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000110, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000202, %g1, %g2
!setx 0x9800000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000410, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000118, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000303, %g1, %g2
!setx 0x9800000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000418, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000120, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000404, %g1, %g2
!setx 0x9800000020, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000420, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000128, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000505, %g1, %g2
!setx 0x9800000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000428, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000130, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000606, %g1, %g2
!setx 0x9800000030, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000430, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000138, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000707, %g1, %g2
!setx 0x9800000038, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000438, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000140, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000808, %g1, %g2
!setx 0x9800000040, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000440, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000148, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000909, %g1, %g2
!setx 0x9800000048, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000448, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000150, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000a0a, %g1, %g2
!setx 0x9800000050, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000450, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000158, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000b0b, %g1, %g2
!setx 0x9800000058, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000458, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000160, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000c0c, %g1, %g2
!setx 0x9800000060, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000460, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000168, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000d0d, %g1, %g2
!setx 0x9800000068, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000468, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000170, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000e0e, %g1, %g2
!setx 0x9800000070, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000470, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000178, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000f0f, %g1, %g2
!setx 0x9800000078, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000478, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x000000000000007f, %g1, %g2
!setx 0x8503000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001010, %g1, %g2
!setx 0x9800000080, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000480, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001111, %g1, %g2
!setx 0x9800000088, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000488, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000c00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e20, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e28, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e38, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000008, %g1, %g2
!setx 0x8503000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000828, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x8503000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000001, %g1, %g2
!setx 0x8503000020, %g1, %g3
!stx %g2, [%g3]
!!=====================

/***********************************************************************
  Disable L2 Cache Visibility Port
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001800, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001820, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001828, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001830, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001838, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001840, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
  Disable IOBridge Visibility Ports
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002100, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002140, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002160, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002180, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002148, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002168, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002188, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a8, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002150, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002170, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002190, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021b0, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 Configure jbi controller
 ***********************************************************************/

setx 0x03fb303e00000001, %g1, %g2
setx 0x8000000000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x000000007033fe0f, %g1, %g2
setx 0x8000000008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000003fc0000000, %g1, %g2
setx 0x80000100a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x00000000fe0003ff, %g1, %g2
setx 0x8000004100, %g1, %g3
stx %g2, [%g3]
!=====================

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

.global data_access_exception_custom_trap
data_access_exception_custom_trap:
	inc	%l4
	done

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


