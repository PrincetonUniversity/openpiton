// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_fccfbr0.s
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
 * Name:   fp_fccfbr0.s
 *
 *  Description:
 *  	floating point branches based on fcc field in fsr.
 *
 **********************************************************************/

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_dmmu_miss
.text
.global main  

main:

        wr      	%g0, 0x4, %fprs         /* make sure fef is 1 */

	setx		scratch, %l0, %l1

/*******************************************************
 * Simple conversion
 *******************************************************/


	set		0x4, %g1		! Max loop count
	set		0x0, %g2		! inner loop iterator	

	fcmpbr_loop0:

	! Take %g2 and write to all fccn

	sllx		%g2, 10, %g3		! this sets fcc0
	sllx		%g2, 32, %g4
	or		%g3, %g4, %g3		! this sets fcc1
	sllx		%g2, 34, %g4
	or		%g3, %g4, %g3		! this sets fcc2
	sllx		%g2, 36, %g4
	or		%g3, %g4, %g3		! this sets fcc3

	stx		%g3, [%l1]
	ldx		[%l1], %fsr

	! Fbfcc

	fba,a		tgt00
	nop
tgt00:	fbn,a		tgt01
	nop
tgt01:	fbu,a		tgt02
	nop
tgt02:	fbg,a		tgt03
	nop
tgt03:	fbug,a		tgt04
	nop
tgt04:	fbl,a		tgt05
	nop
tgt05:	fbul,a		tgt06
	nop
tgt06:	fblg,a		tgt07
	nop
tgt07:	fbne,a		tgt08
	nop
tgt08:	fbe,a		tgt09
	nop
tgt09:	fbue,a		tgt0a
	nop
tgt0a:	fbge,a		tgt0b
	nop
tgt0b:	fbuge,a		tgt0c
	nop
tgt0c:	fble,a		tgt0d
	nop
tgt0d:	fbule,a		tgt0e
	nop
tgt0e:	fbo,a		tgt0f
	nop
tgt0f:

	! Fbpfcc - fcc0

	fba,a,pn	%fcc0, tgt10
	nop
tgt10:	fbn,a,pn	%fcc0, tgt11
	nop
tgt11:	fbu,a,pn	%fcc0, tgt12
	nop
tgt12:	fbg,a,pn	%fcc0, tgt13
	nop
tgt13:	fbug,a,pn	%fcc0, tgt14
	nop
tgt14:	fbl,a,pn	%fcc0, tgt15
	nop
tgt15:	fbul,a,pn	%fcc0, tgt16
	nop
tgt16:	fblg,a,pn	%fcc0, tgt17
	nop
tgt17:	fbne,a,pn	%fcc0, tgt18
	nop
tgt18:	fbe,a,pn	%fcc0, tgt19
	nop
tgt19:	fbue,a,pn	%fcc0, tgt1a
	nop
tgt1a:	fbge,a,pn	%fcc0, tgt1b
	nop
tgt1b:	fbuge,a,pn	%fcc0, tgt1c
	nop
tgt1c:	fble,a,pn	%fcc0, tgt1d
	nop
tgt1d:	fbule,a,pn	%fcc0, tgt1e
	nop
tgt1e:	fbo,a,pn	%fcc0, tgt1f
	nop
tgt1f:

	! Fbpfcc - fcc1

	fba,a,pn	%fcc1, tgt20
	nop
tgt20:	fbn,a,pn	%fcc1, tgt21
	nop
tgt21:	fbu,a,pn	%fcc1, tgt22
	nop
tgt22:	fbg,a,pn	%fcc1, tgt23
	nop
tgt23:	fbug,a,pn	%fcc1, tgt24
	nop
tgt24:	fbl,a,pn	%fcc1, tgt25
	nop
tgt25:	fbul,a,pn	%fcc1, tgt26
	nop
tgt26:	fblg,a,pn	%fcc1, tgt27
	nop
tgt27:	fbne,a,pn	%fcc1, tgt28
	nop
tgt28:	fbe,a,pn	%fcc1, tgt29
	nop
tgt29:	fbue,a,pn	%fcc1, tgt2a
	nop
tgt2a:	fbge,a,pn	%fcc1, tgt2b
	nop
tgt2b:	fbuge,a,pn	%fcc1, tgt2c
	nop
tgt2c:	fble,a,pn	%fcc1, tgt2d
	nop
tgt2d:	fbule,a,pn	%fcc1, tgt2e
	nop
tgt2e:	fbo,a,pn	%fcc1, tgt2f
	nop
tgt2f:

	! Fbpfcc - fcc2

	fba,a,pn	%fcc2, tgt30
	nop
tgt30:	fbn,a,pn	%fcc2, tgt31
	nop
tgt31:	fbu,a,pn	%fcc2, tgt32
	nop
tgt32:	fbg,a,pn	%fcc2, tgt33
	nop
tgt33:	fbug,a,pn	%fcc2, tgt34
	nop
tgt34:	fbl,a,pn	%fcc2, tgt35
	nop
tgt35:	fbul,a,pn	%fcc2, tgt36
	nop
tgt36:	fblg,a,pn	%fcc2, tgt37
	nop
tgt37:	fbne,a,pn	%fcc2, tgt38
	nop
tgt38:	fbe,a,pn	%fcc2, tgt39
	nop
tgt39:	fbue,a,pn	%fcc2, tgt3a
	nop
tgt3a:	fbge,a,pn	%fcc2, tgt3b
	nop
tgt3b:	fbuge,a,pn	%fcc2, tgt3c
	nop
tgt3c:	fble,a,pn	%fcc2, tgt3d
	nop
tgt3d:	fbule,a,pn	%fcc2, tgt3e
	nop
tgt3e:	fbo,a,pn	%fcc2, tgt3f
	nop
tgt3f:

	! Fbpfcc - fcc3

	fba,a,pn	%fcc3, tgt40
	nop
tgt40:	fbn,a,pn	%fcc3, tgt41
	nop
tgt41:	fbu,a,pn	%fcc3, tgt42
	nop
tgt42:	fbg,a,pn	%fcc3, tgt43
	nop
tgt43:	fbug,a,pn	%fcc3, tgt44
	nop
tgt44:	fbl,a,pn	%fcc3, tgt45
	nop
tgt45:	fbul,a,pn	%fcc3, tgt46
	nop
tgt46:	fblg,a,pn	%fcc3, tgt47
	nop
tgt47:	fbne,a,pn	%fcc3, tgt48
	nop
tgt48:	fbe,a,pn	%fcc3, tgt49
	nop
tgt49:	fbue,a,pn	%fcc3, tgt4a
	nop
tgt4a:	fbge,a,pn	%fcc3, tgt4b
	nop
tgt4b:	fbuge,a,pn	%fcc3, tgt4c
	nop
tgt4c:	fble,a,pn	%fcc3, tgt4d
	nop
tgt4d:	fbule,a,pn	%fcc3, tgt4e
	nop
tgt4e:	fbo,a,pn	%fcc3, tgt4f
	nop
tgt4f:

	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		fcmpbr_loop0		! If not 0, go to test more
        nop

	
/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * Data section 
 *******************************************************/
	
.data

scratch:
	.word           0x00000000
	.word           0x00000000
	.word           0x00000000
	.word           0x00000000
	
