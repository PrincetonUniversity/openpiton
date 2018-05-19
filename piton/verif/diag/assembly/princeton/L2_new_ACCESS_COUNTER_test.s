// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: L2_ACCESS_COUNTER_DMM_test.s
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

#define	 L2_ACCESS_COUNTER_BASE_VA_HI	0xaa
#define     L2_VA_HI_SAMT		32
#define		DBGEN_BIT_MASK			0x00100000
#define		ERRORSTEER_BIT_MASK		0x000f8000
#define		SCRUBINTERVAL_BIT_MASK		0x7ff8
#define		SCRUBENABLE_BIT_MASK		0x0004
#define		DMMMODE_BIT_MASK		0x0002
#define		DIS_BIT_MASK			0x0001

	
#define	 L2_ACCESS_COUNTER_VA_INCR		64


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
	ba	TEST_L2_ACCESS_COUNTER
	nop

	.align	1024
!
TEST_L2_ACCESS_COUNTER:	
	or	%g0,L2_ACCESS_COUNTER_BASE_VA_HI,%g1
	sllx	%g1,L2_VA_HI_SAMT,%g1		! build address of the L2 Control Reg

    mov 0xff,  %l0
	stx	%l0,[%g1+0]
	ldx	[%g1+0],%l1		
	cmp	%l0,%l1
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
	

	
	
	

	



	
