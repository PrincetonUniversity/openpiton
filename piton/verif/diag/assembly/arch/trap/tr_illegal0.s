// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_illegal0.s
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
 * Name:   tr_illegal0.s
 * Date:   02/1/02
 *
 *
 *  Description:
 *  	Generate illegal traps with different types of instructions.
 *      This is really tests the completeness of the decode block.
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_HT0_Illegal_instruction_0x10
#define	H_HT1_Illegal_instruction_0x10
#define H_T0_Fp_exception_other_0x22        

#define My_HT0_Illegal_instruction_0x10 \
rdpr	%tstate, %i1; \
rdpr	%tt, %i1; \
rdpr	%tpc, %i0; \
rdpr	%tnpc, %i1; \
add	%l3, 0x1, %l3; \
done; \
nop;

#define My_HT1_Illegal_instruction_0x10 \
rdpr	%tstate, %i1; \
rdpr	%tt, %i1; \
rdpr	%tpc, %i0; \
rdpr	%tnpc, %i1; \
add	%l3, 0x1, %l3; \
done; \
nop;

#define My_T0_Fp_exception_other_0x22 \
rdpr	%tstate, %i1; \
rdpr	%tt, %i1; \
rdpr	%tpc, %i0; \
rdpr	%tnpc, %i1; \
add	%l3, 0x1, %l3; \
done; \
nop;

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

attr_text {
        Name = .MAIN,
	VA=MAIN_BASE_TEXT_VA,
	RA=MAIN_BASE_TEXT_RA,
	tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
main:

	ta		T_CHANGE_PRIV		! set priv bit

	rdpr		%pstate, %l0
	or		%l0, 0x10, %l0
	wrpr		%l0, 0, %pstate		!enable pef

	wr		%g0, 0x4, %fprs

	set		0x0, %l3		! To count number of illegal traps.
	set		0x0, %l4		! To keep track of inst. that dont cause illegal traps
	rd		%pc, %l5

	! bpr - rcond = 000, 100 - test decode

	.word		0x00f00000		! rcond = 000 - illegal
	.word		0x08f00000		! rcond = 100 - illegal

	! done/retry at tl = 0

	add		%l4, 0x2, %l4		! Ignore this and the next inst.
	wrpr		%g0, 0x0, %tl		! Just making sure.

	done
	retry

	! done/retry fcn = 2..31 - test decode

	add		%l4, 0x3, %l4		! Ignore this and the next inst.
	wrpr		%g0, 0x1, %tl		! Just making sure.

	.word		0x87f00000
	.word		0xbff00000

	wrpr		%g0, 0x0, %tl		! Just making sure.

#if !defined(SKIP_FOR_NOW)
	! fsqrt

	fsqrts		%f0, %f0		! FP not implemented
#endif

	! The real illegal trap

	illtrap

	! Any imp-dep instructions.
	! Dont know any right now. Expect illegal

	.word		0x81b00000		! Impdep1 - bug (#459) (??) - fixed
	.word		0x81b80000		! Impdep2


	! LDFSR rd 2-31

	.word		0xc5080000
	.word		0xff080000

	! ldd to odd rd

	ldd		[%g0], %g1
	ldda		[%g0] %asi, %g1

	! movcc with cc2,1,0 = 101, 111
	
	.word		0x81640800
	.word		0x81641800

	! movr rcond = 000, 100

	.word		0x81780000
	.word		0x81781000

	! POP count - <18:14> ~= 0

	popc		0x45, %g0		! POPC is not implemented. (??)

	.word		0x81704000

	! prefetch, prefetcha

	.word		0xcb680000		! fcn = 5 - is not treated as illegal (??) - bug #460
	.word		0xcbe80000		! fcn = 5 - is not treated as illegal (??)

	! rdpr tpc, tnpc, tstate and tt at tl=0

	rdpr		%tpc, %g0
	rdpr		%tnpc, %g0
	rdpr		%tstate, %g0
	rdpr		%tt, %g0

	! rdpr 16-31
	! It is important to cover them all

	rdpr		%fq, %g0		! fq - 15

!	.word		0x81540000		! 16 rdpr %gl
	.word		0x81544000		! 17
	.word		0x81548000		! 18
	.word		0x8154c000		! 19
	.word		0x81550000		! 20
	.word		0x81554000		! 21
	.word		0x81558000		! 22
	.word		0x8155c000		! 23
	.word		0x81560000		! 24
	.word		0x81564000		! 25
	.word		0x81568000		! 26
	.word		0x8156c000		! 27
	.word		0x81570000		! 28
	.word		0x81574000		! 29
	.word		0x81578000		! 30
!	.word		0x8157c000		! 31 - this seems like the version register (??)


/* In privileged mode */

	! read state (rd %asr#)
	! It is important to cover them all

	.word		0x81404000		! asr = 1
	.word		0x8141c000		! asr = 7
	.word		0x81420000		! asr = 8
	.word		0x81424000		! asr = 9
	.word		0x81428000		! asr = 10
	.word		0x8142c000		! asr = 11
	.word		0x81430000		! asr = 12
	.word		0x81434000		! asr = 13
	.word		0x81438000		! asr = 14

!	.word		0x81440000		! asr = 16 - perf. counter control reg
!	.word		0x81444000		! asr = 17 - perf counters
  	.word		0x81448000		! asr = 18 - dispatch control - not implemented (??) bug #472
!	.word		0x8144c000		! asr = 19 - %gsr - not implemented (??) bug #472
	.word		0x81450000		! asr = 20 - set softint
	.word		0x81454000		! asr = 21 - clear softint
!	.word		0x81458000		! asr = 22 - softint
!	.word		0x8145c000		! asr = 23 - tick_cmpr
!	.word		0x81460000		! asr = 24 - sys_tick 
!	.word		0x81464000		! asr = 25 - sys_tick_cmpr
!	.word		0x81468000		! asr = 26 - thread status
	.word		0x8146c000		! asr = 27
	.word		0x81470000		! asr = 28
	.word		0x81474000		! asr = 29
	.word		0x81478000		! asr = 30
	.word		0x8147c000		! asr = 31

	.word		0x8343c000		! asr = 15, rd != 0 --> 1
	.word		0xbf43c000		! asr = 15, rd != 0 --> 31	

	! saved/restored - fcn - 2-31

	.word		0x85880000		! fcn = 2
	.word		0xbf880000		! fcn = 31

	! stfsr - rd 2-31

	.word		0xc5280000
	.word		0xfd280000

	! std with odd rd

	std		%g1, [%g0]
	std		%i1, [%g0]
	stda		%g1, [%g0] %asi
	stda		%i1, [%g0] %asi

	! Tcc with invalid cc1, cc0

	.word		0x91d00800
	.word		0x91d01800

	! wrpr tpc, tnpc, tstate, tt at tl = 0;

	wrpr		%g0, 0x0, %tpc
	wrpr		%g0, 0x0, %tnpc
	wrpr		%g0, 0x0, %tstate
	wrpr		%g0, 0x0, %tt

	! wrpr 15-31
	! It is important to cover them all

	.word		0x9f900000
!	.word		0xa1900000		! wrpr %gl reg
	.word		0xa3900000
	.word		0xa5900000
	.word		0xa7900000
	.word		0xa9900000
	.word		0xab900000
	.word		0xad900000
	.word		0xaf900000
	.word		0xb1900000
!	.word		0xb3900000		! stick_cmpr
	.word		0xb5900000
	.word		0xb7900000
	.word		0xb9900000
	.word		0xbb900000
	.word		0xbd900000
!	.word		0xbf900000		! 31 version register (??)


	! wr state (wr %asr#)
	! It is important to cover them all

	.word		0x83800000		! 1
#if !defined(SKIP_FOR_NOW)
	.word		0x89800000		! 4	rtl doesnt trap
#endif
	.word		0x8b800000		! 5
	.word		0x8f800000		! 7
	.word		0x91800000		! 8
	.word		0x93800000		! 9
	.word		0x95800000		! 10
	.word		0x97800000		! 11
	.word		0x99800000		! 12
	.word		0x9b800000		! 13
	.word		0x9d800000		! 14

!	.word		0xa1800000		! 16
!	.word		0xa3800000		! 17
	.word		0xa5800000		! 18
!	.word		0xa7800000		! 19 wr  %g0, %g0, %gsr
!	.word		0xa9800000		! 20
!	.word		0xab800000		! 21
!	.word		0xad800000		! 22
!	.word		0xaf800000		! 23
	.word		0xb1800000		! 24
!	.word		0xb3800000		! 25 wr  %g0, %g0, %sys_tick_cmpr
!	.word		0xb5800000		! 26
	.word		0xb7800000		! 27
	.word		0xb9800000		! 28
	.word		0xbb800000		! 29
	.word		0xbd800000		! 30
	.word		0xbf800000		! 31 

	! asr 15 - non sir

	.word		0x9f800000		! 15 - i = 0
	.word		0x9f806000		! 15 - i = 1, rs1 = 1

	! Self checking code

	rd		%pc, %l7
	sub		%l7, %l5, %l7
	srl		%l7, 0x2, %l7
	sub		%l7, 0x1, %l7
	add		%l3, %l4, %l6
	subcc		%l7, %l6, %g0
	bne		test_fail
	nop
	

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * My handler externsions
 *******************************************************/
