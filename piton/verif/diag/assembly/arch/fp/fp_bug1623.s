// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_bug1623.s
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
/*
 *  Description:
 *   Test fsr flags following fadd with exact denorm result
 *
 */

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

main:
Test_fdiv:
!!-------------	
!! fadd
!!-------------

	wr      %g0, 0x4, %fprs         ! make sure fpu is enabled
	setx    fsr_tem_dis, %l0, %l4   ! fsr tem disable value
	setx    ddata0, %l0, %l6        ! Double precision data
	ld      [%l4+0x0], %fsr         ! Read fsr from memory - traps disabled

	ldd     [%l6+%g0], %f2          ! double precision
        add     %g0, 0x8, %g4
        ldd     [%l6+%g4], %f6          ! double precision
        add     %g4, 0x8, %g4
	ldd     [%l6+%g4], %f10         ! double precision
        add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f12         ! double precision	

	fdivs   %f2, %f6, %f14
	fdivd   %f10, %f12, %f16
	setx    scratch, %l0, %l5       ! scratch
	stx     %fsr, [%l5+0x0]         ! Test out fsr
        
diag_pass:
	set     0xc001dea1, %l3
	ta T_GOOD_TRAP
	nop
	nop

diag_fail:
        set     0xdeadcafe, %l0
        ta T_BAD_TRAP
        nop
        nop

/*******************************************************
 * Data section
 *******************************************************/

.data
	
.align 256

ddata0:
        .xword          0xc14beb5800000000      ! zero      
        .xword          0x8196166300000000      ! neg denorm      
        .xword          0x52d067424a5711bc      ! neg zero      
        .xword          0x12db91adccf0d295      ! denorm       

.align 128

fsr_tem_en:
        .word           0x0f800000      ! TEM - all enabled

fsr_tem_dis:
        .word           0x00000000      ! TEM - all disabled
        .word           0x00000000

.align 128

scratch:
        .word           0x00000000
        .word           0x00000000
        .word           0x00000000
        .word           0x00000000
        .word           0x00000000
        .word           0x00000000
        .word           0x00000000
        .word           0x00000000





