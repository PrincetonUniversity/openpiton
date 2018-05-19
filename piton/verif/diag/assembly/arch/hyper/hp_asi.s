// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_asi.s
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
/***********************************************************************
 * Name:   hp_asi.s
 *
 * Description:
 *	Self-checking diag to test ASI privilege
 *	ASI value	Privilege
 *	-------------------------
 *      0x0  - 0x2f	supervisor
 *	0x30 - 0x7f	hypervisor
 *	0x80 - 0xff	user
 *
 *	This diag does not exhaustively test all ASI's.
 *	It only exercises ASI_NUCLEUS, ASI_AS_IF_USER_PRIMARY
 *      and ASI_DMMU
 *
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global	main

#define ASI_AS_IF_USER_PRIMARY		0x10
#define ASI_DMMU			0x58


/***********************************************************************/
main:
	!***********************************************************
	! Test 0x0 - 0x2f ASI 
	!***********************************************************
	! enable priviledged action trap
	set		0x37, %o0
	ta		T_HTRAP_EN
	nop
  
	! accessing ASI_NUCLEUS should cause
	! priviledged action trap
        setx		nucleus_data, %l0, %l1
        ldsba		[%l1] ASI_NUCLEUS, %l2
        nop

        cmp		%o0, 0
        bne		diag_fail
        nop

        mov		0x1, %o0
	! accessing ASI_AS_IF_USER_PRIMARY should cause
	! priviledged action trap
!	setx		asifuserpri_data, %l0,  %l1
	setx		0x250000, %l0,  %l1
        ldsba		[%l1] ASI_AS_IF_USER_PRIMARY, %l2
        nop

        cmp		%o0, 0
        bne		diag_fail
        nop

	ta		T_CHANGE_PRIV

        mov		0x1, %o0
	! accessing ASI_NUCLEUS should NOT cause
	! priviledged action trap
        setx		nucleus_data, %l0, %l1
        ldsba		[%l1] ASI_NUCLEUS, %l2
        nop

        cmp		%o0, 0
        be		diag_fail
        nop

        mov		0x1, %o0
	! accessing ASI_AS_IF_USER_PRIMARY should NOT cause
	! priviledged action trap
!	setx		asifuserpri_data, %l0,  %l1
	setx		0x250000, %l0,  %l1
        ldsba		[%l1] ASI_AS_IF_USER_PRIMARY, %l2
        nop

        cmp		%o0, 0
        be		diag_fail
        nop


	!***********************************************************
	! Test 0x30 - 0x7f ASI 
	!***********************************************************
	ta		T_CHANGE_NONPRIV

	! enable priviledged action trap
	set		0x37, %o0
	ta		T_HTRAP_EN
	nop
  
	! accessing ASI_IMMU_DEMAP should cause
        ! priviledged action trap
        ldxa		[%g0] ASI_DMMU, %l2

        cmp		%o0, 0
        bne		diag_fail
        nop

	ta		T_CHANGE_PRIV

	! enable data access exception trap
	set		0x30, %o0
	ta		T_HTRAP_EN
	nop
 
	! accessing ASI_IMMU_DEMAP should cause
        ! data access exception trap
        ldxa		[%g0] ASI_DMMU, %l2

        cmp		%o0, 0
        bne		diag_fail
        nop

	ta		T_CHANGE_HPRIV

        mov		0x1, %o0
	! accessing ASI_IMMU_DEMAP should NOT cause
        ! data access exception trap
        ldxa		[%g0] ASI_DMMU, %l2

        cmp		%o0, 0
        be		diag_fail
        nop


/*******************************************************
 * Exit code
 *******************************************************/
diag_pass:
PASS:						/*jump here if PASS*/
	ta	T_GOOD_TRAP

diag_fail:
FAIL:						/*jump here if FAIL*/
	ta	T_BAD_TRAP
	

/*******************************************************
 * Data section
 *******************************************************/
.data
.global mydata
mydata:
	! put your data here
	.word	0xdeadbeef
.end

!!-------------------------------
!!      CONTEXT=NUC P=0 E=0 
!!-------------------------------
#define NUCLEUS_BASE_DATA_ADDR        0x310000
#define NUCLEUS_BASE_DATA_ADDR_RA     0x310000

SECTION .NUCLEUS DATA_VA=NUCLEUS_BASE_DATA_ADDR
attr_data {
        Name = .NUCLEUS,
        VA=NUCLEUS_BASE_DATA_ADDR,
	RA=NUCLEUS_BASE_DATA_ADDR_RA,
	PA=ra2pa(NUCLEUS_BASE_DATA_ADDR_RA,0),
	part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.data

.global  nucleus_data

nucleus_data:   .word   0x0ace0ace
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x0000dead
.end


!!-------------------------------
!!      P=0 E=0 ASI=PRIM  
!!-------------------------------
#define PRIMARY_BASE_DATA_ADDR        0x250000
#define PRIMARY_BASE_DATA_ADDR_RA     0x250000

SECTION .PRIMARY DATA_VA=PRIMARY_BASE_DATA_ADDR
attr_data {
        Name = .PRIMARY,
        VA=PRIMARY_BASE_DATA_ADDR,
	RA=PRIMARY_BASE_DATA_ADDR_RA,
	PA=ra2pa(PRIMARY_BASE_DATA_ADDR_RA,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  asifuserpri_data

asifuserpri_data: .word   0x10000000
                  .word   0x00000000
                  .word   0x00000000
                  .word   0x00000000
.end


