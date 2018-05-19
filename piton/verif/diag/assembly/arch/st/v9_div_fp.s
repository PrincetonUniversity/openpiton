// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_div_fp.s
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
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Fp_exception_other_0x22
	
#include "boot.s"

.text
.global main
.global sum3

main:
	wr %g0, 4, %fprs
/*
 *****************************************************
 *
 *  This diag will test all the V.9 SPARC instructions
 *
 *****************************************************
 */

/*
 **************************************
 *	Divide ( 64-bit / 32 bit ) 
 **************************************
 */
	call	test_div
	nop

!!--------------------------------
!!	UDIV
!!--------------------------------
test_div:
	set	0x4,	%l0
	set	0x2,	%l1

	udiv	%l0,	%l1,	%l2
	sub	%l2,	0x2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0001,	%l1	

	udiv	%l0,	0x2,	%l3
	sub	%l3,	0x2,	%l4
	brnz	%l4,	diag_fail
	set	0xffff0001,	%l1	

!!--------------------------------
!!	UDIVcc
!!--------------------------------
	set	0x0,	%l0	
	setx	0x0000000800000000, %l0, %l1
	set	0x2,	%l2
	
	udivcc	%l1,	%l2,	%l3
					/* zero bit is set for x_icc */

	bne,a	%icc,	diag_fail
	set	0xffff0000,	%l1

!!--------------------------------
!!	SDIV
!!--------------------------------
	set	0x4,	%l0
	sub	%l0,	0x6,	%l1	

	sdiv	%l0,	%l1,	%l2
	add	%l2,	0x2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0001,	%l1	

	sdiv	%l0,	-2,	%l3
	add	%l3,	0x2,	%l4
	brnz	%l4,	diag_fail
	set	0xffff0001,	%l1	

!!--------------------------------
!!	SDIVcc
!!--------------------------------
	set	0x4,	%l0
	sub	%l0,	0x6,	%l1	

	sdivcc	%l0,	%l1,	%l2
					/* neg bit is set for x_icc */
	bneg	%icc,	next_sdivcc0
	nop

	ba	diag_fail
	set	0xffff0002,	%l1

next_sdivcc0:
	bpos,a	%xcc,	diag_fail
	set	0xffff1112,	%l1

/*
 *****************************************
 *  convert floating point add/subtract
 *****************************************
 */
!!-------------------
!!	fstox
!!-------------------
	set	0x0,	%l0
	setx	fps_cvt_nmd1, 	%l0,	%l1
	
	ld	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f2	/* f2 = 4 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f4	/* f4 = 8 * (1+1/8) */
	add	%l0,	0x4,	%l0

	fstox	%f0,	%f8
	nop

	fstox	%f2,	%f12
	nop

	fstox	%f4,	%f16
	nop

	faddd	%f12,	%f8,	%f20

	fcmpd	%fcc0,	%f20,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------
!!	fdtox
!!-------------------
Test_FDTOX:
	set	0x0,	%l0
	setx	fpd_cvt_nmd1, 	%l0,	%l1
	
	ldd	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f2	/* f2 = 4 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f4	/* f4 = 8 * (1+1/8) */
	add	%l0,	0x8,	%l0

	fdtox	%f0,	%f8
	nop

	fdtox	%f2,	%f12
	nop

	fdtox	%f4,	%f16
	nop

	faddd	%f8,	%f12,	%f20

	fcmpd	%fcc0,	%f20,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0002,	%l1

!!-------------------
!!	fstoi
!!-------------------
	set	0x0,	%l0
	setx	fps_cvt_nmd1, 	%l0,	%l1
	
	ld	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f1	/* f1 = 4 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f2	/* f2 = 8 * (1+1/8) */
	add	%l0,	0x4,	%l0

	fstoi	%f0,	%f4
	nop

	fstoi	%f1,	%f8
	nop

	fstoi	%f2,	%f12
	nop

	fadds	%f4,	%f8,	%f16

	fcmps	%fcc0,	%f12,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0003,	%l1
	
!!-------------------
!!	fdtoi
!!-------------------
Test_FDTOI:
	set	0x0,	%l0
	setx	fpd_cvt_nmd1, 	%l0,	%l1
	
	ldd	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f2	/* f2 = 4 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f4	/* f4 = 8 * (1+1/8) */
	add	%l0,	0x8,	%l0

	fdtoi	%f0,	%f8
	nop

	fdtoi	%f2,	%f12
	nop

	fdtoi	%f4,	%f16
	nop

	fadds	%f8,	%f12,	%f20

	fcmps	%fcc0,	%f20,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0004,	%l1

/*
 *************************************************
 *	Convert between Floating-Point formats
 *************************************************
 */
!!----------------- 
!!	fstod 
!!----------------- 
	/*
	 * load single value first 
	 */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1

        ld      [%l1+%l0],      %f0     /* f0 = 2 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* f2 = 4 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* f4 = 8 * (1+1/8) */
        add     %l0,    0x4,    %l0

	/* 
	 * load golden conversion data 
	 */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1

        ldd     [%l1+%l0],      %f6     /* f6 = 2 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f8     /* f8 = 4 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f10     /* f10 = 8 * (1+1/8) */
        add     %l0,    0x8,    %l0

	/* do the conversion */  
	fstod	%f0,	%f12
	fcmpd	%fcc0,	%f12,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff0005,	%l1

!!---------------------------
!!	fdtos
!!---------------------------
	/* convert double to single */
	fdtos	%f6,	%f14

	fcmps	%fcc0,	%f14,	%f0

	fbne	%fcc0,	diag_fail
	set	0xffff0006,	%l1

!!---------------------------------
!! fqtod, fqtos, fstoq, fdtoq 
!! 	are not supported.
!!---------------------------------

/*
 *************************************
 *	convert integer to floating
 *	point.
 *************************************
 */
!!------------------
!!  fxtos	
!!------------------
	/* load integer value into fp reg */ 
	set	0x0,	%l0
	setx	int2fpd_nmd1, 	%l0,	%l1
	set	0x0,	%l0

	ldd	[%l1+%l0],	%f0	/* 1st 64-bit integer */
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f2	/* 2nd 64-bit integer 
	add	%l0,	0x8,	%l0

	/* load gd fp value into fp reg */ 
	set	0x0,	%l0
	setx	fps_cvt_nmd1, 	%l0,	%l1
	set	0x0,	%l0

	ld	[%l1+%l0],	%f4	/* 1st golden fp value */
	add	%l0,	0x4,	%l0
	
	ld	[%l1+%l0],	%f6	/* 2nd golden fp value */

	fxtos	%f0,	%f8
	fcmps	%fcc0,	%f8,	%f4
	fbne	%fcc0,	diag_fail
	set	0xffff0007,	%l1
	
	fxtos	%f2,	%f10
	fcmps	%fcc0,	%f10,	%f6
	fbne	%fcc0,	diag_fail
	set	0xffff0007,	%l1

!!-------------------
!!  fxtod	
!!-------------------
	/* load the golden 64 fp values */ 
	set	0x0,	%l0
	setx	fpd_cvt_nmd1, 	%l0,	%l1
	set	0x0,	%l0

	ldd	[%l1+%l0],	%f12	/* 1st 64-bit golden fp */
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f14	/* 2nd 64-bit golden fp */
	add	%l0,	0x8,	%l0

	fxtod	%f0,	%f16

	fcmpd	%fcc0,	%f16,	%f12

	fbne	%fcc0,	diag_fail
	set	0xffff0008,	%l1

!!------------------------------
!!	fitos
!!------------------------------
        /* load integer value into fp reg */
        set     0x0,    %l0
        setx    int2fps_nmd1,    %l0,    %l1
        set     0x0,    %l0

        ld     	[%l1+%l0],      %f0     /* 1st 32-bit integer */
        add     %l0,    0x4,    %l0

        ld     	[%l1+%l0],      %f2     /* 2nd 32-bit integer
        add     %l0,    0x4,    %l0

        /* load gd fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ld     	[%l1+%l0],      %f4     /* 1st 32-bit golden fp value */
        add     %l0,    0x4,    %l0

        ld     	[%l1+%l0],      %f6     /* 2nd golden fp value */

	/* convert 32bit int to 32 fp */
	fitos	%f0,	%f16
	fcmps	%fcc0,	%f16,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0009,	%l1
	
!!------------------------------
!!	fitod
!!------------------------------
	/* load the 64bit golden values */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1

        ldd     [%l1+%l0],      %f18     /* f18 = 2 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f20     /* f20 = 4 * (1+1/2) */
        add     %l0,    0x8,    %l0

	/* convert 32bit int to 64 bit fp value */
	fitod	%f0,	%f22
	fitod	%f2,	%f24

	fcmpd	%fcc0,	%f22,	%f18
	fbne	%fcc0,	diag_fail
	set	0xffff000a,	%l1

	fcmpd	%fcc0,	%f24,	%f20
	fbne	%fcc0,	diag_fail
	set	0xffff000a,	%l1

!!----------------------------------------------
!!	fitoq, fxtoq not supported 
!!----------------------------------------------

/*
 *****************************************
 *	Floating point move inst
 *****************************************
 */
!!-------------------------
!!	fmovs
!!-------------------------
        /* load gd fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ld      [%l1+%l0],      %f0     /* 1st s fp value */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* 2nd s fp value */
        add     %l0,    0x4,    %l0
	
        ld      [%l1+%l0],      %f4     /* 3rd s fp value */
        add     %l0,    0x4,    %l0
	
	fmovs	%f0,	%f1
	fmovs	%f2,	%f3	
	fmovs	%f4,	%f5	

	fadds	%f1,	%f3,	%f7

	fcmps	%fcc0,	%f7,	%f5

	fbne	%fcc0,	diag_fail
	set	0xffff000b,	%l1

!!-------------------------
!!	fmovd
!!-------------------------
        /* load double fp value from MEM to fp reg */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ldd     [%l1+%l0],      %f6     /* 1st d fp value */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f8     /* 2nd d fp value */
        add     %l0,    0x8,    %l0
	
        ldd     [%l1+%l0],      %f10     /* 3rd d fp value */
        add     %l0,    0x8,    %l0
	
	fmovd	%f6,	%f12
	fmovd	%f8,	%f14	
	fmovd	%f10,	%f16	

	faddd	%f12,	%f14,	%f18

	fcmpd	%fcc0,	%f16,	%f18

	fbne	%fcc0,	diag_fail
	set	0xffff000c,	%l1

!!----------------------------
!!  fmovq not supported
!!----------------------------
!!-----------------------
!!	fnegs
!!-----------------------
	fnegs	%f0,	%f12
	fnegs	%f12,	%f14

	fcmps	%fcc0,	%f0,	%f14

	fbne	%fcc0,	diag_fail
	set	0xffff000d,	%l1

!!-----------------------
!!	fnegd
!!-----------------------
	fnegd	%f6,	%f12
	fnegd	%f12,	%f14

	fcmpd	%fcc0,	%f14,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff000e,	%l1

!!-----------------------
!!	fabss
!!-----------------------
	fnegs	%f0,	%f12
	fabss	%f12,	%f14

	fcmps	%fcc0,	%f0,	%f14

	fbne	%fcc0,	diag_fail
	set	0xffff000f,	%l1

!!-----------------------
!!	fabsd
!!-----------------------
	fnegd	%f6,	%f12
	fabsd	%f12,	%f14

	fcmpd	%fcc0,	%f14,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff0010,	%l1

/*
 *************************************************
 *	Floating point multiply and divide  
 *************************************************
 */
!!----------------------------
!!	fmuls	
!!----------------------------
        /* load gd fp value into fp reg */
        set     0x0,    %l0
        setx    fps_muldv_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ld      [%l1+%l0],      %f0     /* 1st s fp value */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* 2nd s fp value */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* 3rd s fp value */
        add     %l0,    0x4,    %l0

	fmuls	%f0,	%f2,	%f6

	fcmps	%fcc0,	%f6,	%f4
	
	fbne	%fcc0,	diag_fail
	set	0xffff0011,	%l1	

!!----------------------------
!!	fdivs	
!!----------------------------
	fdivs	%f4,	%f2,	%f6
	fcmps	%fcc0,	%f0,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff0012,	%l1	

!!----------------------------
!!	fmuld	
!!----------------------------
	set	0x0,	%l0
	setx	fpd_muldv_nmd1,	%l0,	%l1
	set	0x0,	%l0

	ldd	[%l1+%l0],	%f6
	add	%l0,	0x8,	%l0	

	ldd	[%l1+%l0],	%f8
	add	%l0,	0x8,	%l0	

	ldd	[%l1+%l0],	%f10
	add	%l0,	0x8,	%l0	

	fmuld	%f6,	%f8,	%f12

	fcmpd	%fcc0,	%f10,	%f12
	
	fbne	%fcc0,	diag_fail
	set	0xffff0013,	%l1	

!!----------------------------
!!	fdivd	
!!----------------------------
	fdivd	%f10,	%f8,	%f14
	fcmpd	%fcc0,	%f6,	%f14

	fbne	%fcc0,	diag_fail
	set	0xffff0014,	%l1	

!!----------------------------
!!	fsmuld	
!!----------------------------
	fsmuld	%f0,	%f2,	%f16

	fcmpd	%fcc0,	%f16,	%f10	

	fbne	%fcc0,	diag_fail
        set     0xffff0015,     %l1
!!--------------------------------------------
!!  fmulq, fdmulq, fdivq not supported !	
!!--------------------------------------------

/*
 **********************************************
 *	Floating point square root
 **********************************************
 */

!!----------------------------
!!	fsqrts
!!----------------------------
	set	0x0,	%l0
	setx	fps_sqr_nmd1, 	%l0,	%l1

	ld	[%l1+%l0],	%f0	/* f0 = 3 */
	add	%l0,	0x4,	%l0

	ld	[%l1+%l0],	%f1	/* f1 = 6 */
	add	%l0,	0x4,	%l0

	ld	[%l1+%l0],	%f2	/* f2 = 9 */
	add	%l0,	0x4,	%l0
	
	ld	[%l1+%l0],	%f3	/* f3 = 36 */
	add	%l0,	0x4,	%l0

	fsqrts	%f2,	%f4
	!fcmps	%fcc0,	%f4,	%f0

	!fbne	%fcc0,	diag_fail
	!set	0xffff0016,	%l1

	fsqrts	%f3,	%f4
	!fcmps	%fcc0,	%f4,	%f1

	!fbne	%fcc0,	diag_fail
	!set	0xffff0016,	%l1

!!----------------------------
!!	fsqrtd
!!----------------------------
	set	0x0,	%l0
	setx	fpd_sqr_nmd1, 	%l0,	%l1

	ldd	[%l1+%l0],	%f4	/* f4 = 3 */
	add	%l0,	0x8,	%l0

	ldd	[%l1+%l0],	%f6	/* f6 = 6 */
	add	%l0,	0x8,	%l0

	ldd	[%l1+%l0],	%f8	/* f8 = 9 */
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f10	/* f10 = 36 */
	add	%l0,	0x8,	%l0

	fsqrtd	%f8,	%f12
	!fcmpd	%fcc0,	%f4,	%f12

	!fbne	%fcc0,	diag_fail
	!set	0xffff0017,	%l1

	fsqrtd	%f10,	%f14
	!fcmpd	%fcc0,	%f14,	%f6

	!fbne	%fcc0,	diag_fail
	!set	0xffff0017,	%l1

!!----------------------------
!!	fsqrtq not supported 
!!----------------------------

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

sum3:
        save    %sp,    -96,    %sp
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7
        ret     /* this is equal to : jmpl [%i7 + 8], %g0 */
        restore %l7,    0,      %o0     /* move result to the out reg */

.data	

ldint_1:	.word	0x55aa11bb
		.word	0xaa5577ff
		.word	0x77aa55bb
		.word	0xaa55ff44

fst_data:       .xword  0x700f000000000000
                .xword  0x700f000000000000
                .xword  0x700ff00000000000
                .xword  0x700ff00000000000

stfsr_sdata:    .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfsr_ddata:    .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stfps_nmdata:   .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfpd_nmdata:   .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stint_1:        .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi1:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi2:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000


ldfsr_sdata:    .word   0x00000800
                .word   0x00000400
                .word   0x00000000
                .word   0x00000c00

ldfsr_ddata:    .xword  0x0000000000000800
                .xword  0x0000000000000400
                .xword  0x0000000000000000
                .xword  0x0000000000000c00

fps_data:       .word   0x00200000
                .word   0x00400000
                .word   0x00600000
                .word   0x00a00000

fps_nmdata:     .word   0x70200000
                .word   0x70400000
                .word   0x70b00000
                .word   0x70b00000

fpd_data:       .xword  0x0002000000000000
                .xword  0x0004000000000000
                .xword  0x0006000000000000
                .xword  0x0008000000000000

fpd_nmdata:     .xword  0x7002000000000000
                .xword  0x7004000000000000
                .xword  0x700b000000000000
                .xword  0x700b000000000000

fpquad_data:    .xword  0x0000200000000000
                .xword  0x0000000000000000
                .xword  0x0000400000000000
                .xword  0x0000000000000000
                .xword  0x0000600000000000
                .xword  0x0000000000000000
                .xword  0x0000800000000000
                .xword  0x0000000000000000

fpquad_nmdata:  .xword  0x7000200000000000
                .xword  0x0000000000000000
                .xword  0x7000400000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000

fps_cvt_data1:	.word	0x00200000
		.word	0x00400000
		.word	0x00600000
		.word	0x00a00000

fps_cvt_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 */
		.word	0x42100000	/* 36 */ 

fpd_cvt_data1:	.xword 	0x0002000000000000
		.xword 	0x0004000000000000
		.xword 	0x0006000000000000
		.xword 	0x0008000000000000

fpd_cvt_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */

int2fps_nmd1: 	.word	0x00000003
		.word	0x00000006
		.word	0x00000009
		.word	0x00000000

int2fpd_nmd1: 	.xword	0x0000000000000003
		.xword	0x0000000000000006
		.xword	0x0000000000000009
		.xword	0x0000000000000000

fps_muldv_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41900000	/* 18 = 16*(1+1/8) */
		.word	0x42100000	/* 36 */

fpd_muldv_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4032000000000000	/* 18 */
		.xword 	0x4042000000000000	/* 36 */	 

fps_sqr_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 = 8*(1+1/8) */
		.word	0x42100000	/* 36 = 32*(1+1/8) */

fpd_sqr_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */	 

.end
