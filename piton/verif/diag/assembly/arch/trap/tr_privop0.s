// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_privop0.s
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
 * Name:   tr_privop0.s
 * Date:   02/5/02
 *
 *
 *  Description:
 *  	Generate privop traps with different types of instructions.
 *      This is really tests the completeness of the decode block.
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Privileged_opcode_0x11

#define My_T0_Privileged_opcode_0x11 \
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

main:

	! ta		T_CHANGE_PRIV		! set priv bit

	set		0x0, %l3		! To count number of traps.
	set		0x0, %l4		! To keep track of inst. that dont cause traps
	rd		%pc, %l5

	! done/retry with priv
	! tl is already 0 - priv op has higher priority

	done
	retry


	! rdpr tpc, tnpc, tstate and tt at tl=0

	rdpr		%tpc, %g0
	rdpr		%tnpc, %g0
	rdpr		%tstate, %g0
	rdpr		%tt, %g0
	rdpr		%tick, %g0
	rdpr		%tba, %g0
	rdpr		%pstate, %g0
	rdpr		%tl, %g0
	rdpr		%pil, %g0
	rdpr		%cwp, %g0
	rdpr		%cansave, %g0
	rdpr		%canrestore, %g0
	rdpr		%cleanwin, %g0
	rdpr		%otherwin, %g0
	rdpr		%wstate, %g0
!	rdpr		%fq, %g0		! Bug #473 (takes illegal inst trap)


	! rdpr 16-31
	! It is important to cover them all

!	.word		0x81540000		! 16 #473
!	.word		0x81544000		! 17 #473
!	.word		0x81548000		! 18 #473
!	.word		0x8154c000		! 19 #473
!	.word		0x81550000		! 20 #473
!	.word		0x81554000		! 21 #473
!	.word		0x81558000		! 22 #473
!	.word		0x8155c000		! 23 #473
!	.word		0x81560000		! 24 #473
!	.word		0x81564000		! 25 #473
!	.word		0x81568000		! 26 #473
!	.word		0x8156c000		! 27 #473
!	.word		0x81570000		! 28 #473
!	.word		0x81574000		! 29 #473
!	.word		0x81578000		! 30 #473
	.word		0x8157c000		! 31 - this seems like the version register (??)


	! read state
	! It is important to cover them all

!	.word		0x81400000		! asr = 0	! Y
!	.word		0x81404000		! asr = 1	! 
!	.word		0x81408000		! asr = 2	! CCR
!	.word		0x8140c000		! asr = 3	! ASI
!	.word		0x81410000		! asr = 4	! Tick
!	.word		0x81414000		! asr = 5	! PC
!	.word		0x81418000		! asr = 6	! FPRS
!	.word		0x8141c000		! asr = 7
!	.word		0x81420000		! asr = 8
!	.word		0x81424000		! asr = 9
!	.word		0x81428000		! asr = 10
!	.word		0x8142c000		! asr = 11
!	.word		0x81430000		! asr = 12
!	.word		0x81434000		! asr = 13
!	.word		0x81438000		! asr = 14
!	.word		0x8143c000		! asr = 15	! STBAR

!	.word		0x81440000		! asr = 16 - perf. counter control reg
!	.word		0x81444000		! asr = 17 - perf counters
!  	.word		0x81448000		! asr = 18 - dispatch control - not implemented (??) bug #472
!  	.word		0x8144c000		! asr = 19 - %gsr - not implemented (??) bug #472
! 	.word		0x81450000		! asr = 20 - set softint
! 	.word		0x81454000		! asr = 21 - clear softint
 	.word		0x81458000		! asr = 22 - softint
 	.word		0x8145c000		! asr = 23 - tick_cmpr
! 	.word		0x81460000		! asr = 24 - sys_tick - not implemented
! 	.word		0x81464000		! asr = 25 - sys_tick_cmpr - not implemented
 	.word		0x81468000		! asr = 26 - thread status - Bug #474 (??)
!	.word		0x8146c000		! asr = 27
!	.word		0x81470000		! asr = 28
!	.word		0x81474000		! asr = 29
!	.word		0x81478000		! asr = 30
!	.word		0x8147c000		! asr = 31

!	.word		0x8343c000		! asr = 15, rd ~= 0 - 1
!	.word		0xbf43c000		! asr = 15, rd ~= 0 - 31	

	! saved/restored

	saved
	restored

	! wrpr tpc, tnpc, tstate, tt at tl = 0;

	wrpr		%g0, 0x0, %tpc
	wrpr		%g0, 0x0, %tnpc
	wrpr		%g0, 0x0, %tstate
	wrpr		%g0, 0x0, %tt
	wrpr		%g0, 0x0, %tick
	wrpr		%g0, 0x0, %tba
	wrpr		%g0, 0x0, %pstate
	wrpr		%g0, 0x0, %tl
	wrpr		%g0, 0x0, %pil
	wrpr		%g0, 0x0, %cwp
	wrpr		%g0, 0x0, %cansave
	wrpr		%g0, 0x0, %canrestore
	wrpr		%g0, 0x0, %cleanwin
	wrpr		%g0, 0x0, %otherwin
	wrpr		%g0, 0x0, %wstate
!	wrpr		%g0, 0x0, %fq		! Bug #473 (takes illegal inst trap)
!	wrpr		%g0, 0x0, %ver		! ??

	! wrpr 15-31
	! It is important to cover them all

!	.word		0x9f900000		! Bug #473
!	.word		0xa1900000		! Bug #473
!	.word		0xa3900000		! Bug #473
!	.word		0xa5900000		! Bug #473
!	.word		0xa7900000		! Bug #473
!	.word		0xa9900000		! Bug #473
!	.word		0xab900000		! Bug #473
!	.word		0xad900000		! Bug #473
!	.word		0xaf900000		! Bug #473
!	.word		0xb1900000		! Bug #473
!	.word		0xb3900000		! Bug #473
!	.word		0xb5900000		! Bug #473
!	.word		0xb7900000		! Bug #473
!	.word		0xb9900000		! Bug #473
!	.word		0xbb900000		! Bug #473
!	.word		0xbd900000		! Bug #473
!	.word		0xbf900000		! 31 version register (??)


	! wr state
	! It is important to cover them all

!	.word		0x81800000		! 0	wr %y
!	.word		0x83800000		! 1
!	.word		0x85800000		! 2	wr %ccr
!	.word		0x87800000		! 3	wr %asi
!	.word		0x89800000		! 4	
!	.word		0x8b800000		! 5
!	.word		0x8d800000		! 6	wr %fprs
!	.word		0x8f800000		! 7
!	.word		0x91800000		! 8
!	.word		0x93800000		! 9
!	.word		0x95800000		! 10
!	.word		0x97800000		! 11
!	.word		0x99800000		! 12
!	.word		0x9b800000		! 13
!	.word		0x9d800000		! 14
!	.word		0x9f800000		! 15

!	.word		0x9f802000		! 15 - sir - shouldnt cause exception - NOP

!	.word		0xa1800000		! 16
!	.word		0xa3800000		! 17
!	.word		0xa5800000		! 18
!	.word		0xa7800000		! 19
 	.word		0xa9800000		! 20
	.word		0xab800000		! 21
	.word		0xad800000		! 22
	.word		0xaf800000		! 23
!	.word		0xb1800000		! 24
!	.word		0xb3800000		! 25
	.word		0xb5800000		! 26 - Bug #474 (??)
!	.word		0xb7800000		! 27
!	.word		0xb9800000		! 28
!	.word		0xbb800000		! 29
!	.word		0xbd800000		! 30
!	.word		0xbf800000		! 31

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


/*******************************************************
 * Data section 
 *******************************************************/
.data
