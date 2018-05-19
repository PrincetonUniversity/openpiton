// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ffu_faligndata.s
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

!	 @(#)faligndata.s	1.3 6/14/93
/*-------------------------------------------------------------------------
*
* Test Name:		 faligndata
* Objective:		 To verify the operation of faligndata with all 
*			 combination of align_offset of GSR.
*
*
* Test Description: 
* 		 A test to verify faligndata with all combination of align_offset
* 		 field of GSR. 
* 		 	-write to gsr followed by faligndata.
* 		 	-alignaddr followed by faligndata. Least significant 
* 		 	 3 bits of the result are stored in align_offset field
* 		 	 of GSR register.
* 		 	-alignaddr followed by floating point load followed by
*			 faligndata.
* 		 	-alignaddrl followed by faligndata. Twos complement of
* 		 	 least significant 3 bits of the result are stored in 
* 		 	 align_offset field of GSR register.
* 		 	-graphics compare followed by write to gsr followed by
* 		 	 faligndata.
*			-graphics compare followed partial (8,16,32) store with
*			 mask register dependent on rd of graphics compare, followed
*			 8/16-bit short load followed by dependent faligndata.
*
*			-graphics compare followed by alignaddr[l] (for VA) => GxE
*			-graphics compare followed by alignaddr[l] (for VA) => GxC
*
*		This diag is self checking.
*
*
*
*
*
--------------------------------------------------------------------------*/

/**************************************************************************
* CONSTANTS, MACROS, TRAP TABLE
***************************************************************************/

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"


#define	check_result(label) \
	ldx	[%l2+%i2], %i1; \
	cmp	%i0, %i1; \
	be      label; \
	add	%i2, 0x8, %i2; \
	ta	BAD_TRAP

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss


/****************START OF TEST*********************************************/


.text
.global main
ALIGN_PAGE_8K

user_text_start:

main:
	
	        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

		set	data, %g1
		set 	store_result, %l1
		set 	exp_result_start, %l2

		mov	0x0, %l3
		mov	0x0, %i2

		ldd	[%g1], %f0
		ldd	[%g1+8], %f2
		ldd	[%g1+16], %f4
		ldd	[%g1+24], %f6


!write to gsr followed by faligndata
tst_0:
		wr	%l3, %g0, %asr19	!align_offset=0
		faligndata	%f0, %f2, %f32	!since align_offset=0, so, %f32=%f0
		fcmpd	%fcc3, %f0, %f32	
		fbe	%fcc3, tst_1
		add	%l3, 0x1, %l3	!increment l3
		ta	BAD_TRAP


!align offset = 1
tst_1:
		wr	%l3, %g0, %asr19	!align_offset =1
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]	!store freg (dw) into store_result
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l3
		check_result(tst_2)

!align offset = 2
tst_2:
		wr	%l3, %g0, %asr19	!align_offset =2
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_3)

!align offset = 3
tst_3:
		wr	%l3, %g0, %asr19	!align_offset =3
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_4)

!align offset = 4
tst_4:
		wr	%l3, %g0, %asr19	!align_offset =4
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_5)

!align offset = 5
tst_5:
		wr	%l3, %g0, %asr19	!align_offset =5
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_6)

!align offset = 6
tst_6:
		wr	%l3, %g0, %asr19	!align_offset =6
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_7)

!align offset = 7
tst_7:
		wr	%l3, %g0, %asr19	!align_offset =7
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_8)

!align offset = 0
tst_8:
		wr	%l3, %g0, %asr19	!align_offset =0
		faligndata	%f2, %f0, %f32
		fcmpd	%fcc2, %f2, %f32	
		fbe	%fcc2, end_of_test
		nop	
		ta	BAD_TRAP





end_of_test:	ta	GOOD_TRAP
bad:		ta	BAD_TRAP
user_text_end:


.seg "data"


ALIGN_PAGE_8K

user_data_start:
.align 8
data:
	.word 0x01234567, 0x89abcdef
	.word 0xfedcba98, 0x76543210
	.word 0x11223344, 0x66778899
	.word 0xeeccbbaa, 0x00dd55ff

.align 8
store_result:
		.skip 512

.align 8
short_load: 
		.byte 0x56, 0x0, 0x0,0x0
		.byte 0x0,0x0, 0x0, 0x0
		.byte 0xa9, 0x0, 0x0, 0x0
		.byte 0x0,0x0, 0x0, 0x0
		.half 0xfecd,0x0
		.half 0x0,0x0
		.half 0x5678,0x0
		.half 0x0,0x0

.align 8
exp_result_start:
		.word 0x23456789, 0xabcdeffe
		.word 0x456789ab, 0xcdeffedc
		.word 0x6789abcd, 0xeffedcba
		.word 0x89abcdef, 0xfedcba98
		.word 0xabcdeffe, 0xdcba9876
		.word 0xcdeffedc, 0xba987654
		.word 0xeffedcba, 0x98765432
		.word 0x66778899, 0xeeccbbaa
		.word 0x99eeccbb, 0xaa00dd55
		.word 0x01112233, 0x44667788
		.word 0x76543210, 0x11223344
		.word 0x00dd55ff, 0xfedcba98
		.word 0xaa00dd55, 0xfffedcba
		.word 0x98765432, 0x10eeccbb
		.word 0xfedcba98, 0x76543210
		.word 0x56000000, 0x0
		.word 0x56780000, 0x0
		.word 0xeda8eda8, 0x00007731
		.word 0x33884499, 0x0
		.word 0x44993388, 0x44993388
		.word 0x0, 0x00440000


user_data_end:
