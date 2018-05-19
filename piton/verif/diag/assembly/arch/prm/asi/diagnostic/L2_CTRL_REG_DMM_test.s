// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: L2_CTRL_REG_DMM_test.s
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
#define  THREAD_COUNT 1
#include "boot.s"

#define	 L2_CTRL_REGS_BASE_VA_HI	0xa9
#define     L2_VA_HI_SAMT		32
#define		DBGEN_BIT_MASK			0x00100000
#define		ERRORSTEER_BIT_MASK		0x000f8000
#define		SCRUBINTERVAL_BIT_MASK		0x7ff8
#define		SCRUBENABLE_BIT_MASK		0x0004
#define		DMMMODE_BIT_MASK		0x0002
#define		DIS_BIT_MASK			0x0001

	
#define	 L2_CTRL_REGS_VA_INCR		64


!		3MB cache @ 12W SA ==>  3MB/12 = 1/4MB per set or 256KB	::  bit 18 set 	 
#define	 L2_STEP_SIZE			0x00040000

	
#define	 L2_DIAG_VA_HI_SAMT			32
	
#define	 L2_DIAG_DATA_ARRAY_BASE_VA_HI		0xA0

#define	 L2_DIAG_TAG_ARRAY_BASE_VA_HI		0xA4
	
#define	 L2_DIAG_VUAD_ARRAY_BASE_VA_HI		0xA6


	
		

.text
.global main

main:                   !  test enters here from boot in user mode
        setx active_thread, %l1, %o5   
        jmpl    %o5, %o7
        nop

!
!       Note that to simplify ASI cache accesses this segment should be mapped VA==PA==RA
!
SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040008000
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        VA= 0x0000000040008000,
        PA= ra2pa(0x0000000040008000,0),
        RA= 0x0000000040008000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        hypervisor
        }
!
!
!			
 
.text
.global active_thread
!
!	We enter with L2 up and in LRU mode, Priv. state is user (none)
!
!	
active_thread:	
        ta      T_CHANGE_HPRIV          ! enter Hyper mode
	ba	SWITCH_TO_DM_MODE
	nop

	.align	1024
!
!   Switch to DM mode
SWITCH_TO_DM_MODE:	
	or	%g0,L2_CTRL_REGS_BASE_VA_HI,%g1
	sllx	%g1,L2_VA_HI_SAMT,%g1		! build address of first L2 Control Reg

	ldx	[%g1+0],%l0			! get Bank 0 control reg
	or	%l0,DMMMODE_BIT_MASK,%l0	! enable DM mode
	stx	%l0,[%g1+0]

	add	%g1,L2_CTRL_REGS_VA_INCR,%g1	! point to next bank control reg
	ldx	[%g1+0],%l0			! get Bank 1 control reg
	or	%l0,DMMMODE_BIT_MASK,%l0	! enable DM mode
	stx	%l0,[%g1+0]
	
	add	%g1,L2_CTRL_REGS_VA_INCR,%g1	! point to next bank control reg
	ldx	[%g1+0],%l0			! get Bank 2 control reg
	or	%l0,DMMMODE_BIT_MASK,%l0	! enable DM mode
	stx	%l0,[%g1+0]
	
	add	%g1,L2_CTRL_REGS_VA_INCR,%g1	! point to next bank control reg
	ldx	[%g1+0],%l0			! get Bank 2 control reg
	or	%l0,DMMMODE_BIT_MASK,%l0	! enable DM mode
	stx	%l0,[%g1+0]	
		
!	
!   Now write a set of 13 DWs in way order (0 to B, then C) into bank 0, set 1
!
DM_STX_START:	
	setx	DATA_dw00,%l0,%l3		! make addressable
	setx	DATA_WORK_SEC_dw0,%l0,%l1	! make addressable
	setx	L2_STEP_SIZE,%l0,%l5		! incr for next way (bit 18)
	
	ldx	[%l3+0x00],%l2			! get data
	stx	%l2,[%l1+256]			! put into L2

	add	%l1,%l5,%l1
	ldx	[%l3+0x08],%l2			! get data
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1
	ldx	[%l3+0x10],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1
	ldx	[%l3+0x18],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1	
	ldx	[%l3+0x20],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1	
	ldx	[%l3+0x28],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1	
	ldx	[%l3+0x30],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1	
	ldx	[%l3+0x38],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
		
	add	%l1,%l5,%l1	
	ldx	[%l3+0x40],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1	
	ldx	[%l3+0x48],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2

	add	%l1,%l5,%l1
	ldx	[%l3+0x50],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1
	ldx	[%l3+0x58],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
	
	add	%l1,%l5,%l1			! should replace 8
	ldx	[%l3+0x60],%l2			! get data	
	stx	%l2,[%l1+256]			! put into L2
!
!  Check results of the loads
!
	membar	#Sync				! insure results are in L2
!
RESULTS_CHECK_START:	
	or	%g0,L2_DIAG_DATA_ARRAY_BASE_VA_HI,%l4
	sllx	%l4,L2_DIAG_VA_HI_SAMT,%l4	! Diag data access address for L2 

	setx	L2_STEP_SIZE,%l0,%l5		! incr for next way (bit 18)
	
	setx	DATA_dw00,%l0,%l3		! make addressable
	
	
chk_way_00:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 0
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x00],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_01:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 1
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x08],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_02:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 2
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x10],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_03:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 3
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x18],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_04:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 4  (replaced)
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x60],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_05:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 5
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x28],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_06:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 6
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x30],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_07:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 7
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x38],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_08:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 8
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x40],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_09:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 9
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x48],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_10:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 10
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x50],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	
chk_way_11:	
	ldx	[%l4+0x100],%i1			! get bank 0 set 1 word 0 way 11
	srlx	%i1,7,%i1			! strip off ECC	
	add	%l4,%l5,%l4			! next way
	lduw	[%l3+0x58],%l0			! get expected DM value	
	cmp	%l0,%i1
	bne	test_fail
	nop
	
	

	


!	
test_pass:
        ta      T_GOOD_TRAP
        nop
!
!
test_fail:
        ta      T_BAD_TRAP
        nop
!



SECTION .DATA_AREA DATA_VA=0x0000000040010000
   attr_data {
        Name = .DATA_AREA,
        hypervisor
        }

.global	DATA_dw00
.global	DATA_dw01
.global	DATA_dw02
.global	DATA_dw03
.global	DATA_dw04
.global	DATA_dw05
.global	DATA_dw06
.global	DATA_dw07
.global	DATA_dw08
.global	DATA_dw09
.global	DATA_dw0a
.global	DATA_dw0b
.global	DATA_dw0c
.global	DATA_dw0d
.global	DATA_dw0e
.global	DATA_dw0f
	
.data
DATA_dw00:	.xword	0x0101010102020202
DATA_dw01:	.xword	0x1111111112121212
DATA_dw02:	.xword	0x2121212122222222
DATA_dw03:	.xword	0x3131313132323232
DATA_dw04:	.xword	0x4141414142424242
DATA_dw05:	.xword	0x5151515152525252
DATA_dw06:	.xword	0x6161616162626262
DATA_dw07:	.xword	0x7171717172727272
DATA_dw08:	.xword	0x8181818182828282
DATA_dw09:	.xword	0x9191919192929292
DATA_dw0a:	.xword	0xa1a1a1a1a2a2a2a2
DATA_dw0b:	.xword	0xb1b1b1b1b2b2b2b2
DATA_dw0c:	.xword	0xc1c1c1c1c2c2c2c2
DATA_dw0d:	.xword	0xd1d1d1d1d2d2d2d2
DATA_dw0e:	.xword	0xe1e1e1e1e2e2e2e2
DATA_dw0f:	.xword	0xf1f1f1f1f2f2f2f2

	
!
!		Start data at 256MB 
!
SECTION .DATA_WORK_SEC DATA_VA=0x0000001000000000 
   attr_data {
        Name = .DATA_WORK_SEC,
        hypervisor
	}

.global	DATA_WORK_SEC_dw0
.data

DATA_WORK_SEC_dw0:	.xword	0
	

	
	
	

	



	
