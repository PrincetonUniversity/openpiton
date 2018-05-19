// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_trap_illegal.s
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

!!-------------------------------------------------------------------------------
!!
!!	This file has the micro-code to test out all the traps specified
!!	in the SPARC-V9 trap table. 
!!
!!-------------------------------------------------------------------------------
	
#include "boot.s"

.text
.global main
.global misalign_sum3

main:
/*
 ****************************************
 *    Illegal Instruction  
 *****************************************
 */
	set	0x5555,	%l0

!!------------------------------------------
!!	BPr illegal instruction trap
!!------------------------------------------
	/* BPr ill_inst when rcond=000 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop

	.word	0x00cc0008	/* rcond = 000 */
	nop

	/* check  %o0 should = 0x0 */
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0001,	%l1

	/* BPr ill_inst when rcond=100 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop

	.word	0x08cc0008

	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0001,	%l1

!!------------------------------------------
!!	BPcc illegal instruction trap
!!------------------------------------------
	/* cond=4'b1001 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x12580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1001 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x12780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0001 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x02580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0001 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x02780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1010 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x14580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1010 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x14780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0010 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x04580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0010 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x04780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1011 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x16580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1011 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x16780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0011 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x06580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0011 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x06780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1100 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x18580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1100 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x18780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0100 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x08580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0100 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x08780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1101 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x1a580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1101 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x1a780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0101 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x0a580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0101 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x0a780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1110 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x1c580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1110 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x1c780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0110 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x0c580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0110 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x0c780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1111 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x1e580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b1111 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x1e780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0111 cc1,cc0 = 2'b01 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x0e580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4'b0111 cc1,cc0 = 2'b11 */		
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x0e780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

!!----------------------------------
!!  Done & Retry illegal inst trap
!!----------------------------------
	/* this is to avoid the privilege_opcode trap */
	ta	T_CHANGE_PRIV
	nop

	/* DONE , when TL = 0 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	done
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!-------------------------------------
!!	Retry illegal inst trap
!!-------------------------------------
	/* Retry , when TL = 0 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	retry
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0004,	%l1

	ta 	T_CHANGE_NONPRIV
	nop

!!-------------------------------------
!! 	illegal inst trap
!!-------------------------------------
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	illtrap	0xabcd
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!-------------------------------------
!! 	implementation dependent
!!-------------------------------------
#if SAM_IMPL_DEP
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xb1b00000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1
#endif

!!---------------------------------------------
!!  Load integer : illegal inst trap
!!---------------------------------------------
	/* rd = 1 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 3 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 5 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xca180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 7 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xce180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 9 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 11 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 13 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xda180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 15 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xde180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 17 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 19 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 21 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xea180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 23 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xee180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 25 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 27 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 29 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfa180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 31 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfe180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!---------------------------------------------
!!  Load integer from ASI : illegal inst trap 
!!	ldda, odd rd
!!---------------------------------------------
	/* rd = 1 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 3 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 5 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xca980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 7 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xce980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 9 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 11 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 13 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xda980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 15 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xde980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 17 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 19 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 21 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xea980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 23 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xee980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 25 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 27 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 29 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfa980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 31 , odd rd */ 
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfe980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!----------------------------------
!!  population count
!!----------------------------------
	/* bits[18:14] != 0 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x81704000	/* bit 14 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x81708000	/* bit 15 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x81710000	/* bit 16 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x81720000	/* bit 17 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x81740000	/* bit 18 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!----------------------------------
!!  Read Privileged Reg : ill_inst
!!----------------------------------
	! rdpr  %priv_16, %g0 is now the %gl register
	! this will cause a priviledge opcode trap 0x11
	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81540000	/* rs1 = 16 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81544000	/* rs1 = 17 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81548000	/* rs1 = 18 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x8154c000	/* rs1 = 19 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81550000	/* rs1 = 20 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81554000	/* rs1 = 21 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81558000	/* rs1 = 22 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x8155c000	/* rs1 = 23 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81560000	/* rs1 = 24 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81564000	/* rs1 = 25 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81568000	/* rs1 = 26 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x8156c000	/* rs1 = 27 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81570000	/* rs1 = 28 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81574000	/* rs1 = 29 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x11,	%o0
	set	0x1,	%o1
	ta	T_TRAP_EN_N_TIMES
	nop
	.word	0x81578000	/* rs1 = 30 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* this is to avoid the privilege_opcode trap */
	ta	T_CHANGE_PRIV
	nop

	/* tl = 0, rs1 = 0 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	rdpr	%tpc,	%l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* tl = 0, rs1 = 1 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	rdpr	%tnpc,	%l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* tl = 0, rs1 = 2 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	rdpr	%tstate, %l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* tl = 0, rs1 = 3 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	rdpr	%tt, %l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	ta	T_CHANGE_NONPRIV
	nop

!!----------------------------------
!!  Read State reg : rdasr
!!	rd != 0 , rs = 15 
!!----------------------------------
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x9143c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xa143c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xb143c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x8343c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xbf43c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

!!----------------------------------
!!  Store integer: std with odd rd
!!----------------------------------
	/* std rd = 1 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 3 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 5 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xca380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 7 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xce380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 9 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 11 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 13 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xda380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 15 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xde380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 17 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 19 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 21 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xea380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 23 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xee380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 25 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 27 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 29 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfa380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 31 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfe380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

!!-------------------------------------------------
!!  Store Int to ASI space : 
!!	stda with odd rd ( ill_inst trap )
!!-------------------------------------------------
	/* std rd = 1 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 3 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xc6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 5 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xcab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 7 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xceb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 9 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 11 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xd6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 13 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xdab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 15 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xdeb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 17 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 19 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xe6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 21 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xeab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 23 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xeeb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 25 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 27 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xf6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 29 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 31 */
	set	0x10,	%o0
	set	0x1,	%o1
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xfeb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

misalign_sum3:
        save    %sp,    -96,    %sp
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_TRAP_EN
        nop
	return	%i7+1	/* misaligned addr return */
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	return 	%i7+8	/* good return */ 
	nop

.data

fpdt_data:
	.xword	0xffff0000eeee1111
	.xword	0xffff0000eeee2222
	.xword	0xffff0000eeee3333
	.xword	0xffff0000eeee4444
.end

/*
 ***************************************************
 * Pages defined to test out the MMU access traps 
 ***************************************************
 */
 
#define	IDAEXECPG_BASE_TEXT_ADDR	0x250000		
#define	IDAEXECPG_BASE_TEXT_ADDR_PA	0x100250000
#define	IDAEXECPG_BASE_DATA_ADDR	0x260000
#define	IDAEXECPG_BASE_DATA_ADDR_PA	0x100260000			

SECTION .IDAEXEC_PAGE TEXT_VA=IDAEXECPG_BASE_TEXT_ADDR, DATA_VA=IDAEXECPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_TEXT_ADDR, PA=IDAEXECPG_BASE_TEXT_ADDR_PA,
        RA=IDAEXECPG_BASE_TEXT_ADDR_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_DATA_ADDR, PA=IDAEXECPG_BASE_DATA_ADDR_PA,
        RA=IDAEXECPG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.text

.global  idaexec_start 
.global  idaexec_d1	

idaexec_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaexec_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

/*
 ************************************************************
 *	Section defined to test the Data Protection trap
 ************************************************************
 */
#define	IDAPROTPG_BASE_TEXT_ADDR	0x350000		
#define	IDAPROTPG_BASE_TEXT_ADDR_PA	0x100350000
#define	IDAPROTPG_BASE_DATA_ADDR	0x360000
#define	IDAPROTPG_BASE_DATA_ADDR_PA	0x100360000			

SECTION .IDAPROT_PAGE TEXT_VA=IDAPROTPG_BASE_TEXT_ADDR, DATA_VA=IDAPROTPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_TEXT_ADDR, PA=IDAPROTPG_BASE_TEXT_ADDR_PA,
        RA=IDAPROTPG_BASE_TEXT_ADDR_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_DATA_ADDR, PA=IDAPROTPG_BASE_DATA_ADDR_PA,
        RA=IDAPROTPG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.text

.global  idaprot_start 
.global  idaprot_d1	

idaprot_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaprot_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end
