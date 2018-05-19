// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ffu_fplogic.s
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

! 	@(#)fplogic.s	1.4 04/21/94 

/***********************************************************************
* Name of Test: 	fplogic.s
*
*Description of Test:   Graphics logical instructions are implemented in
*			both the FGM and the FGA. There are certain rules
*			that are used for these instruction. This diag
*			verfies that these instructions follow these rules.
*			Test cases considered are:
*			-two flog instructions in the same group are
*			 dispatched to both fga and fgm.
*			-flog (fgm) -> flog(fga, fgm) => 3-cycle latency
*			-flog (fga) -> flog(fga, fgm) => 1-cycle latency
*			-fpack -> flog(fga, fgm) => 3-cycle latency
*			-similar precision bypassing
*			-cross precision bypassing
*
*		
************************************************************************/



#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss


/****************START OF TEST*********************************************/


.text
.global main
ALIGN_PAGE_8K

user_text_start:

main:
	
         wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

	 set	 sp_data_start, %g1
	 set	 dp_data_start, %g2
	 ldd	 [%g1 + 0x0], %f0
	 ldd	 [%g1 + 0x8], %f2
	 ldd	 [%g2 + 0x0], %f4
	 ldd	 [%g2 + 0x8], %f6
	 ldd	 [%g2 + 0x10], %f8
	 ldd	 [%g2 + 0x18], %f10
	 wr	 %g0, 0x0, %asr19	!WRASR to GSR
	 mov	 %g0, %o3
	 ba	 tst_plogic_1
	 nop

.align 32
tst_plogic_1:
!	 fzero	 %d32
!	 fone	 %d34
	 fone	 %d34
	 fzero	 %d32
	 fnor	 %f0,  %f2,  %f36
	 for	 %f0,  %f2,  %f38
	 for	 %f2,  %f0,  %f38
	 fnor	 %f2,  %f0,  %f36

tst_plogic_2:
	 fandnot1	 %f6,  %f8,  %f40
	 fandnot2	 %f10,  %f8,  %f42
	 fandnot2	 %f8,  %f8,  %f42
	 fandnot1	 %f4,  %f8,  %f40
	 fnot2	 %f6,  %f44
	 fnot1	 %f4,  %f46
	 fnot1	 %f8,  %f46
	 fnot2	 %f6,  %f44

tst_plogic_3:
	 fand	 %f2,  %f0,  %f48
	 fnand	 %f0,  %f2,  %f50
	 fnand	 %f8,  %f6,  %f50
	 fand	 %f6,  %f8,  %f48
	 fxnor	 %f2,  %f6,  %f52
	 fxor	 %f6,  %f2,  %f54
	 fxor	 %f4,  %f6,  %f54
	 fxnor	 %f6,  %f4,  %f52

tst_plogic_4:
	 fornot2	 %f4,  %f8,  %f56
	 fornot1	 %f4,  %f8,  %f54
	 fornot1	 %f8,  %f4,  %f54
	 fornot2	 %f8,  %f4,  %f56
	 fsrc1	 %f2,  %f58
	 fsrc2	 %f6,  %f60
	 fsrc2	 %f6,  %f60
	 fsrc1	 %f2,  %f58

tst_plogics_1:
	 fzeros	 %f12
	 fones	 %f13
!	 fones	 %f13
!	 fzeros	 %f12
	 fones	 %f12
	 fzeros	 %f13
	 fnors	 %f5,  %f6,  %f14
	 fors	 %f7,  %f8,  %f15
	 fors	 %f8,  %f7,  %f15
	 fnors	 %f6,  %f5,  %f14
	


tst_plogics_2:
	 fandnot1s	 %f8,  %f9,  %f16
	 fandnot2s	 %f9,  %f8,  %f17
	 fandnot2s	 %f10,  %f11,  %f17
	 fandnot1s	 %f11,  %f10,  %f16
	 fnot2s	 %f4,  %f18
	 fnot1s	 %f4,  %f19
	 fnot1s	 %f6,  %f19
	 fnot2s	 %f6,  %f18

tst_plogics_3:
	 fands	 %f2,  %f0,  %f22
	 fnands	 %f0,  %f2,  %f23
	 fnands	 %f8,  %f6,  %f23
	 fands	 %f6,  %f8,  %f22
	 fxnors	 %f2,  %f6,  %f24
	 fxors	 %f6,  %f2,  %f25
	 fxors	 %f4,  %f6,  %f25
	 fxnors	 %f6,  %f4,  %f24

tst_plogics_4:
	 fornot2s	 %f4,  %f9,  %f28
	 fornot1s	 %f4,  %f9,  %f29
	 fornot1s	 %f9,  %f4,  %f29
	 fornot2s	 %f9,  %f4,  %f28
	 fsrc1s	 %f2,  %f26
	 fsrc2s	 %f5,  %f27
	 fsrc2s	 %f5,  %f27
	 fsrc1s	 %f2,  %f26



	ta	GOOD_TRAP

user_text_end:

.seg "data"
ALIGN_PAGE_8K

user_data_start:




sp_data_start:
	 .word 0x3f840041
	 .word 0x40284144
	 .word 0xf67890ab
	 .word 0x264fd879

sp_data_end:

dp_data_start:
.align 8
	 .word 0x56565656
	 .word 0x78787878
	 .word 0x4b4b4b4b
	 .word 0xc3c3c3c3
	 .word 0xdeadbeef
	 .word 0xdeadbeef
	 .word 0x21524110
	 .word 0x21345879

dp_data_end:


fsr_data_start:
.align 8

	 .word 0x0
	 .word 0x80000000


user_result_start:

user_data_end:
