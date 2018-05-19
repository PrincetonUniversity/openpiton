// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_pstate_fpdis.s
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
 * Name:   fp_pstate_fpdis.s
 *
 *  Description:
 *  	Run all fp instructions with pstate.pef set to 0 
 *
 **********************************************************************/

#define H_T0_Fp_disabled_0x20 T0_Fp_disabled
#define H_HT0_Illegal_instruction_0x10 T0_Illegal_instruction

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

/*
 **********************************************************
 *
 *  This diag tests all fp instructions with pstate.pef=0
 *
 **********************************************************
*/

/*
 * Need to be priv mode
 *
*/

	ta	T_CHANGE_PRIV

/*
 * Set pstate.pef = 0
 *
*/
	wr	%g0, 0x7, %fprs		/* make sure fef is 1 */
	rdpr	%pstate, %l0
	mov	0xfef, %l1		/* set pstate.pef[4] to 0 */
	and	%l0, %l1, %l0
	wrpr	%g0, %l0, %pstate

/*
 ********************************
 *      All FP instructions
 ********************************
*/

/* Expect every fp instruction to be faulted 
   First read PC into %l5
   Set a count in %l7, this is incremented in the trap handler.
   Read PC at the end into %l6
   %l4 is for incrementing illegal instruction trap count
   %l3 is for incrementing illegal instruction expected trap count
*/

	wr	%g0, 0x0, %asi		! Set it to 0 - this should be irrelevant

	set	0x0, %l3
	set	0x0, %l4
	set	0x0, %l7
	rd	%pc, %l5

/* fbfcc */

	fba	test_fail
	fbn	test_fail		! This is not causing trap (??)
	fbu	test_fail
	fbg	test_fail
	fbug	test_fail
	fbl	test_fail
	fbul	test_fail
	fblg	test_fail
	fbne	test_fail
	fbe	test_fail
	fbue	test_fail
	fbge	test_fail
	fbuge	test_fail
	fble	test_fail
	fbule	test_fail
	fbo	test_fail

/* fbpfcc */

	fba,pt		%fcc0, test_fail
	fbn,pt		%fcc0, test_fail	! This is not cauing trap (??)
	fbu,pt		%fcc0, test_fail
	fbg,pt		%fcc0, test_fail
	fbug,pt		%fcc0, test_fail
	fbl,pt		%fcc0, test_fail
	fbul,pt		%fcc0, test_fail
	fblg,pt		%fcc0, test_fail
	fbne,pt		%fcc0, test_fail
	fbe,pt		%fcc0, test_fail
	fbue,pt		%fcc0, test_fail
	fbge,pt		%fcc0, test_fail
	fbuge,pt	%fcc0, test_fail
	fble,pt		%fcc0, test_fail
	fbule,pt	%fcc0, test_fail
	fbo,pt		%fcc0, test_fail

/* floating point add and subtract */

	fadds	%f0, %f1, %f2
	faddd	%f0, %f2, %f4
	faddq	%f0, %f4, %f8
	fsubs	%f0, %f1, %f2
	fsubd	%f0, %f2, %f4
	fsubq	%f0, %f4, %f8

/* floating point add and subtract */

	fcmps	%fcc0,%f1, %f2
	fcmpd	%fcc1,%f2, %f4
	fcmpq	%fcc2,%f4, %f8
	fcmpes	%fcc3,%f1, %f2
	fcmped	%fcc0,%f2, %f4
	fcmpeq	%fcc1,%f4, %f8

/* Convert fp to int */

	fstox	%f0, %f0
	fdtox	%f0, %f0
	fqtox	%f0, %f0
	fstoi	%f0, %f0
	fdtoi	%f0, %f0
	fqtoi	%f0, %f0

/* Convert fp to fp */

	fstod	%f0, %f0
	fstoq	%f0, %f0
	fdtos	%f0, %f0
	fdtoq	%f0, %f0
	fqtos	%f0, %f0
	fqtod	%f0, %f0

/* Convert int to fp */

	fxtos	%f0, %f0
	fxtod	%f0, %f0
	fxtoq	%f0, %f0
	fitos	%f0, %f0
	fitod	%f0, %f0
	fitoq	%f0, %f0

/* Floating point mov */

	fmovs	%f0, %f0
	fmovd	%f0, %f0
	fmovq	%f0, %f0
	fnegs	%f0, %f0
	fnegd	%f0, %f0
	fnegq	%f0, %f0
	fabss	%f0, %f0
	fabsd	%f0, %f0
	fabsq	%f0, %f0

/* Floating point multiply and divide */

	fmuls	%f0, %f0, %f0
	fmuld	%f0, %f0, %f0
	fmulq	%f0, %f0, %f0
	fsmuld	%f0, %f0, %f0
	fdmulq	%f0, %f0, %f0
	fdivs	%f0, %f0, %f0
	fdivd	%f0, %f0, %f0
	fdivq	%f0, %f0, %f0

/* Floating point square root */

!	fsqrts	%f0, %f0
!	fsqrtd	%f0, %f0
!	fsqrtq	%f0, %f0

/* Load Floating point */

	ld	[%g0], %f0
	ldd	[%g0], %f0
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	ldq	[%g0], %f0		! This is causing 0x10 (??)
	ld	[%g0], %fsr
	ldx	[%g0], %fsr
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	.word	0xc5080000		! %fsr p. 174 - (op3=0x21, rd = 2..31) - rd = 0x2
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	.word	0xff080000		! %fsr p. 174 - (op3=0x21, rd = 2..31) - rd = 0x31

/* Load Floating point asi */

	lda	[%g0] 0x0, %f0
	lda	[%g0+0x0] %asi, %f0
	ldda	[%g0] 0x0, %f0
	ldda	[%g0+0x0] %asi, %f0
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	ldqa	[%g0] 0x0, %f0
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	ldqa	[%g0+0x0] %asi, %f0

/* Floating point move on %icc or %xcc */

	fmovsa		%xcc, %f4, %f0
	fmovsn		%xcc, %f4, %f0
	fmovsne		%xcc, %f4, %f0
	fmovse		%xcc, %f4, %f0
	fmovsg		%xcc, %f4, %f0
	fmovsle		%xcc, %f4, %f0
	fmovsge		%xcc, %f4, %f0
	fmovsl		%xcc, %f4, %f0
	fmovsgu		%xcc, %f4, %f0
	fmovsleu	%xcc, %f4, %f0
	fmovscc		%xcc, %f4, %f0
	fmovscs		%xcc, %f4, %f0
	fmovspos	%xcc, %f4, %f0
	fmovsneg	%xcc, %f4, %f0
	fmovsvc		%xcc, %f4, %f0
	fmovsvs		%xcc, %f4, %f0

	fmovda		%xcc, %f4, %f0
	fmovdn		%xcc, %f4, %f0
	fmovdne		%xcc, %f4, %f0
	fmovde		%xcc, %f4, %f0
	fmovdg		%xcc, %f4, %f0
	fmovdle		%xcc, %f4, %f0
	fmovdge		%xcc, %f4, %f0
	fmovdl		%xcc, %f4, %f0
	fmovdgu		%xcc, %f4, %f0
	fmovdleu	%xcc, %f4, %f0
	fmovdcc		%xcc, %f4, %f0
	fmovdcs		%xcc, %f4, %f0
	fmovdpos	%xcc, %f4, %f0
	fmovdneg	%xcc, %f4, %f0
	fmovdvc		%xcc, %f4, %f0
	fmovdvs		%xcc, %f4, %f0

	fmovqa		%xcc, %f4, %f0
	fmovqn		%xcc, %f4, %f0
	fmovqne		%xcc, %f4, %f0
	fmovqe		%xcc, %f4, %f0
	fmovqg		%xcc, %f4, %f0
	fmovqle		%xcc, %f4, %f0
	fmovqge		%xcc, %f4, %f0
	fmovql		%xcc, %f4, %f0
	fmovqgu		%xcc, %f4, %f0
	fmovqleu	%xcc, %f4, %f0
	fmovqcc		%xcc, %f4, %f0
	fmovqcs		%xcc, %f4, %f0
	fmovqpos	%xcc, %f4, %f0
	fmovqneg	%xcc, %f4, %f0
	fmovqvc		%xcc, %f4, %f0
	fmovqvs		%xcc, %f4, %f0

	fmovsa		%icc, %f4, %f0
	fmovsn		%icc, %f4, %f0
	fmovsne		%icc, %f4, %f0
	fmovse		%icc, %f4, %f0
	fmovsg		%icc, %f4, %f0
	fmovsle		%icc, %f4, %f0
	fmovsge		%icc, %f4, %f0
	fmovsl		%icc, %f4, %f0
	fmovsgu		%icc, %f4, %f0
	fmovsleu	%icc, %f4, %f0
	fmovscc		%icc, %f4, %f0
	fmovscs		%icc, %f4, %f0
	fmovspos	%icc, %f4, %f0
	fmovsneg	%icc, %f4, %f0
	fmovsvc		%icc, %f4, %f0
	fmovsvs		%icc, %f4, %f0

	fmovda		%icc, %f4, %f0
	fmovdn		%icc, %f4, %f0
	fmovdne		%icc, %f4, %f0
	fmovde		%icc, %f4, %f0
	fmovdg		%icc, %f4, %f0
	fmovdle		%icc, %f4, %f0
	fmovdge		%icc, %f4, %f0
	fmovdl		%icc, %f4, %f0
	fmovdgu		%icc, %f4, %f0
	fmovdleu	%icc, %f4, %f0
	fmovdcc		%icc, %f4, %f0
	fmovdcs		%icc, %f4, %f0
	fmovdpos	%icc, %f4, %f0
	fmovdneg	%icc, %f4, %f0
	fmovdvc		%icc, %f4, %f0
	fmovdvs		%icc, %f4, %f0

	fmovqa		%icc, %f4, %f0
	fmovqn		%icc, %f4, %f0
	fmovqne		%icc, %f4, %f0
	fmovqe		%icc, %f4, %f0
	fmovqg		%icc, %f4, %f0
	fmovqle		%icc, %f4, %f0
	fmovqge		%icc, %f4, %f0
	fmovql		%icc, %f4, %f0
	fmovqgu		%icc, %f4, %f0
	fmovqleu	%icc, %f4, %f0
	fmovqcc		%icc, %f4, %f0
	fmovqcs		%icc, %f4, %f0
	fmovqpos	%icc, %f4, %f0
	fmovqneg	%icc, %f4, %f0
	fmovqvc		%icc, %f4, %f0
	fmovqvs		%icc, %f4, %f0

	fmovsa		%fcc0, %f4, %f0
	fmovsn		%fcc1, %f4, %f0
	fmovsu		%fcc2, %f4, %f0
	fmovsg		%fcc3, %f4, %f0
	fmovsug		%fcc0, %f4, %f0
	fmovsl		%fcc1, %f4, %f0
	fmovsul		%fcc2, %f4, %f0
	fmovslg		%fcc3, %f4, %f0
	fmovsne		%fcc0, %f4, %f0
	fmovse		%fcc1, %f4, %f0
	fmovsue		%fcc2, %f4, %f0
	fmovsge		%fcc3, %f4, %f0
	fmovsuge	%fcc0, %f4, %f0
	fmovsle		%fcc1, %f4, %f0
	fmovsule	%fcc2, %f4, %f0
	fmovso		%fcc3, %f4, %f0

	fmovda		%fcc0, %f4, %f0
	fmovdn		%fcc1, %f4, %f0
	fmovdu		%fcc2, %f4, %f0
	fmovdg		%fcc3, %f4, %f0
	fmovdug		%fcc0, %f4, %f0
	fmovdl		%fcc1, %f4, %f0
	fmovdul		%fcc2, %f4, %f0
	fmovdlg		%fcc3, %f4, %f0
	fmovdne		%fcc0, %f4, %f0
	fmovde		%fcc1, %f4, %f0
	fmovdue		%fcc2, %f4, %f0
	fmovdge		%fcc3, %f4, %f0
	fmovduge	%fcc0, %f4, %f0
	fmovdle		%fcc1, %f4, %f0
	fmovdule	%fcc2, %f4, %f0
	fmovdo		%fcc3, %f4, %f0

	fmovqa		%fcc0, %f4, %f0
	fmovqn		%fcc1, %f4, %f0
	fmovqu		%fcc2, %f4, %f0
	fmovqg		%fcc3, %f4, %f0
	fmovqug		%fcc0, %f4, %f0
	fmovql		%fcc1, %f4, %f0
	fmovqul		%fcc2, %f4, %f0
	fmovqlg		%fcc3, %f4, %f0
	fmovqne		%fcc0, %f4, %f0
	fmovqe		%fcc1, %f4, %f0
	fmovque		%fcc2, %f4, %f0
	fmovqge		%fcc3, %f4, %f0
	fmovquge	%fcc0, %f4, %f0
	fmovqle		%fcc1, %f4, %f0
	fmovqule	%fcc2, %f4, %f0
	fmovqo		%fcc3, %f4, %f0

/* Floating point move on integer register */

	fmovrse		%g1, %f0, %f4
	fmovrslez	%g1, %f0, %f4
	fmovrslz	%g1, %f0, %f4
	fmovrsne	%g1, %f0, %f4
	fmovrsgz	%g1, %f0, %f4
	fmovrsgez	%g1, %f0, %f4

	fmovrde		%g0, %f0, %f4
	fmovrdlez	%g0, %f0, %f4
	fmovrdlz	%g0, %f0, %f4
	fmovrdne	%g0, %f0, %f4
	fmovrdgz	%g0, %f0, %f4
	fmovrdgez	%g0, %f0, %f4

	fmovrqe		%g1, %f0, %f4
	fmovrqlez	%g1, %f0, %f4
	fmovrqlz	%g1, %f0, %f4
	fmovrqne	%g1, %f0, %f4
	fmovrqgz	%g1, %f0, %f4
	fmovrqgez	%g1, %f0, %f4

	.word		0x8da85ce0		! Should cause fp exception other for quads but fp disabled is higher prio
	.word		0x89a840e0		! Should cause fp exception other (rcond=000) but fp disabled is higher pri (??)
	.word		0x89a850e0		! Should cause fp exception other (rcond=100) but fp disabled is higher pri (??)

/* Integer move on floating point CC */

	mova		%fcc0, %g0, %g1
	movn		%fcc1, %g0, %g1
	movu		%fcc2, %g0, %g1
	movg		%fcc3, %g0, %g1
	movug		%fcc0, %g0, %g1
	movl		%fcc1, %g0, %g1
	movul		%fcc2, %g0, %g1
	movlg		%fcc3, %g0, %g1
	movne		%fcc0, %g0, %g1
	move		%fcc1, %g0, %g1
	movue		%fcc2, %g0, %g1
	movge		%fcc3, %g0, %g1
	movuge		%fcc0, %g0, %g1
	movle		%fcc1, %g0, %g1
	movule		%fcc2, %g0, %g1
	movo		%fcc3, %g0, %g1

/* rdpr and rd */

	add		%l3, 0x1, %l3		! Expect illegal inst. trap
	rdpr		%fq, %g0		! illegal instruction (??)
	rd		%fprs, %g0		! This shouldnt cause a trap
	add		%l7, 0x2, %l7

/* Floating point store */

	st		%f0, [%g0]
	std		%f0, [%g0]
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	stq		%f0, [%g0]
	st		%fsr, [%g0]
	stx		%fsr, [%g0]

	add		%l3, 0x1, %l3		! Expect illegal inst. trap
	.word		0xc5280000		! %fsr p. 226 - (op3=0x25, rd = 2..31) - rd = 0x2
	add		%l3, 0x1, %l3		! Expect illegal inst. trap
	.word		0xfd280000		! %fsr p. 226 - (op3=0x25, rd = 2..31) - rd = 0x31

/* Floating point store asi */

	sta		%f0, [%g0] 0x0
	sta		%f0, [%g0+0x0] %asi
	stda		%f0, [%g0] 0x0
	stda		%f0, [%g0+0x0] %asi
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	stqa		%f0, [%g0] 0x0
	add	%l3, 0x1, %l3		! Expect illegal inst. trap
	stqa		%f0, [%g0+0x0] %asi

/* wr */

	wr		%g0, 0x0, %fprs		! This shouldnt cause a trap
	add		%l7, 0x2, %l7

/* Branch to test done - self checking - Cant trust SIMICS entirely */

	rd	%pc, %l6		! read pc and save it

	subcc	%l3, %l4, %l2		! Check illegal inst. trap count
	bne	test_fail		! if illegal inst. trap count doesnt match, test failed
	nop

	sub	%l6, %l5, %l5		! Subtract both PCs
	srl	%l5, 0x2, %l5		! Get the count
	sub	%l5, %l3, %l5		! Account for add instructions
	sub	%l5, 0x1, %l5		! Account for rd pc operations
	subcc	%l5, %l7, %l5
	
	bne	test_fail		! if the total trap count doesnt match, test failed
	nop

	ba	test_pass
	nop

test_fail:
	ta	T_BAD_TRAP

	
test_pass:
	ta	T_GOOD_TRAP

/* Own trap handler */
SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x13002000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }

.global T0_Illegal_instruction
T0_Illegal_instruction:	
	rdpr	%tpc, %i0
	rdpr	%tnpc, %i1
	rdpr	%tstate, %i1
	rdpr	%tt, %i1
	add	%l7, 0x1, %l7		! Increment number of fp traps
	add	%l4, 0x1, %l4
	done
	nop


SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x20008000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x20008000,
        PA=ra2pa(0x20008000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.global T0_Fp_disabled
T0_Fp_disabled:	
	rdpr	%tpc, %i0
	rdpr	%tnpc, %i1
	rdpr	%tstate, %i1
	rdpr	%tt, %i1
	add	%l7, 0x1, %l7		! Increment number of fp traps
	done
	nop
	nop
