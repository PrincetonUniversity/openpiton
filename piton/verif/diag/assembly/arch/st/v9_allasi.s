// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_allasi.s
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
!!	test all the V9 ASIs LD/STs, including some of the traps 
!!
!!	add testing of pages with IE=1 , tested with ASI_PRIM(_LE)
!!	ASI_SECN(_LE), ASI_NUCLEUS(_LE) 
!!-------------------------------------------------------------------------------


#include "boot.s"

.text
.global main

#define FIXED 	1
#define ASI_NUCLEUS		0x4
#define ASI_NUCLEUS_LE		0xc
#define	ASI_ASIF_UPRIM		0x10
#define	ASI_ASIF_USECN		0x11
#define	ASI_ASIF_UPRIM_LE	0x18
#define	ASI_ASIF_USECN_LE	0x19
#define	ASI_PRIM		0x80
#define	ASI_SECN		0x81
#define	ASI_PRIM_NFLT		0x82
#define	ASI_SECN_NFLT		0x83
#define	ASI_PRIM_LE		0x88
#define	ASI_SECN_LE		0x89
#define	ASI_PRIM_NFLT_LE	0x8A
#define	ASI_SECN_NFLT_LE	0x8B

main:
	/*
 	 *************************************************
 	 *  Privileged Action trap when PRIV=0 , access
	 *  the NUCLEUS page with ASI = 0x4
 	 *************************************************
 	 */
	mov	0x0,	%l7

chk_l7:
	brz,a	%l7,	first_check
	nop

	mov	0x2,	%l2
	sub	%l2,	%l7,	%l2
	brz,a	%l2,	diag_pass
	nop

first_check:
#if FIXED
        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
        ldsba   [%l1] ASI_NUCLEUS,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop
        nop

        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
	set	0x0,	%l2
        setx    dexec_pg25_data, %l0, %l1
        stba    %l2,	[%l1] ASI_NUCLEUS
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop
        nop

        ta      T_CHANGE_PRIV
        nop
tc_0:
	/*
	 ****************************
 	 *  ASI_NUCLEUS (ASI_N)
	 ****************************
	 */
	set	0x1,	%o0	/* restore NUCLEUS only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=1 load ASI=NUCLEUS 
!!----------------------------------------
tc_1:
	/* E=0 P=0 CTX=NUCLEUS  big endian */
#define	NUCLEUS_SB1_GOLDEN	0xffffffffffffff81 

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
        ldsba   [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        nop
tc_2:
	/*
	 * Load signed half word
	 */
#define	NUCLEUS_SB2_GOLDEN	0x77aa
        set     0x0,    %l0
        setx    dexec_pg26_data, %l0, %l1
        ldsha   [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_SB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        nop
tc_3:
	/*
	 * Load signed  word
	 */
#define	NUCLEUS_SB3_GOLDEN	0xffffffffaa223344
        set     0x0,    %l0
        setx    dexec_pg28_data, %l0, %l1
        ldswa   [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_SB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        nop

tc_4:
	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
#define	NUCLEUS_USB1_GOLDEN	0x81 
        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
        lduba   [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        nop

tc_5:
	/*
	 * Load unsigned half word
	 */
#define	NUCLEUS_USB2_GOLDEN	0x77aa
        set     0x0,    %l0
        setx    dexec_pg26_data, %l0, %l1
        lduha   [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_USB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        nop

tc_6:
	/*
	 * Load unsigned  word
	 */
#define	NUCLEUS_USB3_GOLDEN	0xaa223344
        set     0x0,    %l0
        setx    dexec_pg28_data, %l0, %l1
        lduwa   [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_USB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        nop

tc_7:
	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	NUCLEUS_XA_GOLDEN	0xaa22334455aaff11
        set     0x0,    %l0
        setx    dexec_pg27_data, %l0, %l1
        ldxa    [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_XA_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        nop

tc_8:
	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
#define	NUCLEUS_DDA_GOLDEN1	0xaa223344
#define	NUCLEUS_DDA_GOLDEN2	0x55aaff11
        set     0x0,    %l0
        setx    dexec_pg28_data, %l0, %l1
        ldda    [%l1] ASI_NUCLEUS,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUS_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	NUCLEUS_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

tc_9:
	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */

	/*
	 * Store a byte 
	 */
#define	STB_GOLDEN1	0xaa
#define	STB_GOLDEN2	0x55
#define	STB_GOLDEN3	0xff
#define	STB_GOLDEN4	0x00

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1		
	set	STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduba	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduba	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

tc_10:
	set	STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduba	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduba	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

tc_11:
	/*
	 * Store a half word 
	 */
#define	STHW_GOLDEN1	0xaa55
#define	STHW_GOLDEN2	0x55aa
#define	STHW_GOLDEN3	0xffaa
#define	STHW_GOLDEN4	0xeeff

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduha	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduha	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

tc_12:
	set	STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduha	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduha	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

tc_13:
	/*
	 * Store a word 
	 */
#define	STW_GOLDEN1	0xaa55ffee
#define	STW_GOLDEN2	0x55aaeeff
#define	STW_GOLDEN3	0xffffffff
#define	STW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	nop

	lduwa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduwa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

tc_14:
	set	STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduwa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	nop
	lduwa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

tc_15:
	/*
	 * Store an extended word 
	 */
#define	STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	STEXW_GOLDEN3	0xffffffff55555555
#define	STEXW_GOLDEN4	0x11115555aaaaffff

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	setx	STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS
	nop
	ldxa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS
	nop
	ldxa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS
	nop
	ldxa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS
	nop
	ldxa	[%l1] ASI_NUCLEUS, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

tc_16:
	/*
	 * Store an double word 
	 */
#define	STDW_GOLDEN1	0xaa55ffee
#define	STDW_GOLDEN2	0x55aaeeff
#define	STDW_GOLDEN3	0xffffffff
#define	STDW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	STDW_GOLDEN1,	 %l2
	set	STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_NUCLEUS
	nop

	ldda	[%l1] ASI_NUCLEUS, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	STDW_GOLDEN3,	 %l2
	set	STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_NUCLEUS
	nop

	ldda	[%l1] ASI_NUCLEUS, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

tc_17:
	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
	set	0x1,	%o0	/* restore NUCLEUS only */
	call	store_golden2pgs
	nop

/*
 ********************************
 * change back to USER mode 
 ********************************
 */
        ta      T_CHANGE_NONPRIV
        nop

	/*
 	 *************************************************
 	 *  Privileged Action trap when PRIV=0 , access
	 *  the NUCLEUS page with ASI = 0x5	
 	 *************************************************
 	 */
tc_18:
        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
        ldsba   [%l1] ASI_NUCLEUS_LE,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop
	nop

        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
	set	0x0,	%l2
        setx    dexec_pg25_data, %l0, %l1
        stba    %l2,	[%l1] ASI_NUCLEUS_LE
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop
	nop
#endif

        ta      T_CHANGE_PRIV
        nop

#if 0
        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
	set	0x11223344,	%l2
	stuwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop

	lduwa	[%l1]	ASI_NUCLEUS,	%l3
	nop

	nop;nop;nop;nop;nop;

	lduwa	[%l1]	ASI_NUCLEUS_LE,	%l4
	nop

	nop;nop;nop;nop;nop;

	lduha	[%l1]	ASI_NUCLEUS_LE,	%l5
	nop

	nop;nop;nop;nop;nop;

	lduba	[%l1]	ASI_NUCLEUS_LE,	%l6
	nop

	nop;nop;nop;nop;nop;

	ba	diag_pass
	nop
#endif

#if FIXED
	/*
	 ****************************
 	 *  ASI_NUCLEUS_LE(ASI_NL)
	 ****************************
	 */
tc_19:
	set	0x2,	%o0	/* set NUCLEUS_LE MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=1 load ASI=NUCLEUS_LE
!!----------------------------------------

	/* E=0 P=0 CTX=NUCLEUS  big endian */
#define	NUCLEUSLE_SB1_GOLDEN	0xffffffffffffff84

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
        ldsba   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

tc_20:
	/*
	 * Load signed half word
	 */
#define	NUCLEUSLE_SB2_GOLDEN	0x3344
        set     0x0,    %l0
        setx    dexec_pg26_data, %l0, %l1
        ldsha   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_SB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_21:
#define	NUCLEUSLE_SB3_GOLDEN	0xffffffffaa223344
        set     0x0,    %l0
        setx    dexec_pg28_data, %l0, %l1
        ldswa   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_SB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail


	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_22:
#define	NUCLEUSLE_USB1_GOLDEN	0x84
        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
        lduba   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
tc_23:
#define	NUCLEUSLE_USB2_GOLDEN	0x3344
        set     0x0,    %l0
        setx    dexec_pg26_data, %l0, %l1
        lduha   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_USB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_24:
#define	NUCLEUSLE_USB3_GOLDEN	0xaa223344
        set     0x0,    %l0
        setx    dexec_pg28_data, %l0, %l1
        lduwa   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_USB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
tc_25:
#define	NUCLEUSLE_XA_GOLDEN	0x55aaff11aa223344
        set     0x0,    %l0
        setx    dexec_pg27_data, %l0, %l1
        ldxa    [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_XA_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_26:
#define	NUCLEUSLE_DDA_GOLDEN1	0xaa223344
#define	NUCLEUSLE_DDA_GOLDEN2	0x55aaff11
        set     0x0,    %l0
        setx    dexec_pg28_data, %l0, %l1
        ldda    [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	NUCLEUSLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	NUCLEUSLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */
tc_27:
	/*
	 * Store a byte 
	 */
#define	NLE_STB_GOLDEN1	0xaa
#define	NLE_STB_GOLDEN2	0x55
#define	NLE_STB_GOLDEN3	0xff
#define	NLE_STB_GOLDEN4	0x00

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1		
	set	NLE_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	NLE_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	NLE_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	NLE_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	/*
	 * Store a half word 
	 */
tc_28:
#define	NLE_STHW_GOLDEN1	0xaa55
#define	NLE_STHW_GOLDEN2	0x55aa
#define	NLE_STHW_GOLDEN3	0xffaa
#define	NLE_STHW_GOLDEN4	0xeeff

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	NLE_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	NLE_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	NLE_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	NLE_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_29:
#define	NLE_STW_GOLDEN1	0xaa55ffee
#define	NLE_STW_GOLDEN2	0x55aaeeff
#define	NLE_STW_GOLDEN3	0xffffffff
#define	NLE_STW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	NLE_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	NLE_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	NLE_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	NLE_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

tc_30:
	/*
	 * Store an extended word 
	 */
#define	NLE_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	NLE_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	NLE_STEXW_GOLDEN3	0xffffffff55555555
#define	NLE_STEXW_GOLDEN4	0x11115555aaaaffff

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	setx	NLE_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	NLE_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	NLE_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	NLE_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_31:
#define	NLE_STDW_GOLDEN1	0xaa55ffee
#define	NLE_STDW_GOLDEN2	0x55aaeeff
#define	NLE_STDW_GOLDEN3	0xffffffff
#define	NLE_STDW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	NLE_STDW_GOLDEN1,	 %l2
	set	NLE_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_NUCLEUS_LE
	nop

	ldda	[%l1] ASI_NUCLEUS_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	NLE_STDW_GOLDEN3,	 %l2
	set	NLE_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_NUCLEUS_LE
	nop

	ldda	[%l1] ASI_NUCLEUS_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
tc_32:
	set	0x2,	%o0	/* restore NUCLEUS_LE only */
	call	store_golden2pgs
	nop
#endif

	/*
	 * changed back to USER privilege 
	 */
        ta      T_CHANGE_NONPRIV
        nop

#if FIXED
	/*
	 ****************************
 	 *  ASI_ASIF_USER_PRIM
	 *	as if user privilege
	 ****************************
	 */

	/* 
	 *********************************
	 * test the privileged trap 
	 *********************************
	 */
tc_33:
        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop

        set     0x0,    %l0
        setx    dexec_pg1_data, %l0,  %l1
        ldsba   [%l1] ASI_ASIF_UPRIM, %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        ta      T_CHANGE_PRIV
        nop

	set	0x3,	%o0	/* set ASIF_USR_PRIM MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_ASIF_UPRIM
!!----------------------------------------

	/* E=0 P=0 CTX=PRIM  big endian */
#define	AIUP_SB1_GOLDEN	0xfffffffffffffff5

	/*
	 * Load signed byte 
	 */
tc_34:
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_35:
#define	AIUP_SH1_GOLDEN	0xffffffffffffaaff
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_36:
#define	AIUP_SH2_GOLDEN	0xfffffffffffff522
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_37:
#define	AIUP_SW1_GOLDEN	0xfffffffff5223384
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldswa   [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_38:
#define	AIUP_USB1_GOLDEN	0xaa
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduba   [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
tc_39:
#define	AIUP_UH1_GOLDEN	0xaaff
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduha   [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_40:
#define	AIUP_UW1_GOLDEN	0xaaffff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduwa   [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
tc_41:
#define	AIUP_XA1_GOLDEN	0xaaffff5555ffaaff
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	AIUP_XA2_GOLDEN	0xf5223384ff0011ff
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_42:
#define	AIUP_DDA_GOLDEN1	0xaaffff55
#define	AIUP_DDA_GOLDEN2	0x55ffaaff
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldda    [%l1] ASI_ASIF_UPRIM,      %l2
        nop

        set	0x0,	%l0
	setx	AIUP_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	AIUP_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */
tc_43:
	/*
	 * Store a byte 
	 */
#define	AIUP_STB_GOLDEN1	0xaa
#define	AIUP_STB_GOLDEN2	0x55
#define	AIUP_STB_GOLDEN3	0xff
#define	AIUP_STB_GOLDEN4	0x77

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1		
	set	AIUP_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduba	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUP_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduba	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUP_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduba	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUP_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduba	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_44:
#define	AIUP_STHW_GOLDEN1	0xaa55
#define	AIUP_STHW_GOLDEN2	0x55aa
#define	AIUP_STHW_GOLDEN3	0xffaa
#define	AIUP_STHW_GOLDEN4	0x33ff

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	AIUP_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduha	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUP_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduha	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUP_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduha	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	AIUP_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduha	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_45:
#define	AIUP_STW_GOLDEN1	0xaa55ffee
#define	AIUP_STW_GOLDEN2	0x55aaeeff
#define	AIUP_STW_GOLDEN3	0xffffffff
#define	AIUP_STW_GOLDEN4	0x33335555

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUP_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUP_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUP_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUP_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_46:
#define	AIUP_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	AIUP_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	AIUP_STEXW_GOLDEN3	0xffffffff55555555
#define	AIUP_STEXW_GOLDEN4	0x33335555aaaaffff

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	setx	AIUP_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUP_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUP_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUP_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_47:
#define	AIUP_STDW_GOLDEN1	0xaa55ffee
#define	AIUP_STDW_GOLDEN2	0x55aaeeff
#define	AIUP_STDW_GOLDEN3	0xffffffff
#define	AIUP_STDW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUP_STDW_GOLDEN1,	 %l2
	set	AIUP_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_UPRIM
	nop

	ldda	[%l1] ASI_ASIF_UPRIM, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUP_STDW_GOLDEN3,	 %l2
	set	AIUP_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_UPRIM
	nop

	ldda	[%l1] ASI_ASIF_UPRIM, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
	set	0x3,	%o0	/* restore ASI_ASIF_UPRIM only */
	call	store_golden2pgs
	nop

/*
 ********************************
 * change back to USER mode 
 ********************************
 */
        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ****************************
 	 *  ASI_ASIF_USECN
	 *	asif user privilege
	 ****************************
	 */

	/* 
	 *********************************
	 * test the privileged trap 
	 *********************************
	 */
tc_48:
        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop

        set     0x0,    %l0
        setx    dexec_pg2_data, %l0,  %l1
        ldsba   [%l1] ASI_ASIF_USECN, %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        ta      T_CHANGE_PRIV
        nop

	set	0x4,	%o0	/* set ASIF_USR_SECN MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_ASIF_USECN
!!----------------------------------------
tc_49:
	/* E=0 P=0 CTX=SECN  big endian */
#define	AIUS_SB1_GOLDEN	0xffffffffffffffaa

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_50:
#define	AIUS_SH1_GOLDEN	0x75aa
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_51:
#define	AIUS_SH2_GOLDEN	0xffffffffffffaabb
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_52:
#define	AIUS_SW1_GOLDEN	0xffffffffaabbccdd
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldswa   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	AIUS_SW2_GOLDEN	0x75aa55ff
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldswa   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_SW2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_53:
#define	AIUS_USB1_GOLDEN	0xaa
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduba   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	AIUS_UH1_GOLDEN	0xaabb
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduha   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_54:
#define	AIUS_UW1_GOLDEN	0x75aa55ff
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        lduwa   [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
tc_55:
#define	AIUS_XA1_GOLDEN	0xaabbccdd99887766
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	AIUS_XA2_GOLDEN	0x75aa55ff55ffaaff

        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_56:
#define	AIUS_DDA_GOLDEN1	0xaabbccdd
#define	AIUS_DDA_GOLDEN2	0x99887766
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldda    [%l1] ASI_ASIF_USECN,      %l2
        nop

        set	0x0,	%l0
	setx	AIUS_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	AIUS_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */

	/*
	 * Store a byte 
	 */
tc_57:
#define	AIUS_STB_GOLDEN1	0xff
#define	AIUS_STB_GOLDEN2	0xaa
#define	AIUS_STB_GOLDEN3	0x55
#define	AIUS_STB_GOLDEN4	0x77

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1		
	set	AIUS_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduba	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUS_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduba	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUS_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduba	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUS_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduba	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_58:
#define	AIUS_STHW_GOLDEN1	0xaa55
#define	AIUS_STHW_GOLDEN2	0x55aa
#define	AIUS_STHW_GOLDEN3	0xffaa
#define	AIUS_STHW_GOLDEN4	0x77ee

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	AIUS_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduha	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUS_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduha	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUS_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduha	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	AIUS_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduha	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_59:
#define	AIUS_STW_GOLDEN1	0xaa55ffee
#define	AIUS_STW_GOLDEN2	0x00000000
#define	AIUS_STW_GOLDEN3	0xffffffff
#define	AIUS_STW_GOLDEN4	0x33335555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	AIUS_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduwa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUS_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduwa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUS_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduwa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUS_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	lduwa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_60:
#define	AIUS_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	AIUS_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	AIUS_STEXW_GOLDEN3	0xffffff00ff555555
#define	AIUS_STEXW_GOLDEN4	0x33335555aaaaffff

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	setx	AIUS_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	ldxa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUS_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	ldxa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUS_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	ldxa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUS_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN
	nop
	ldxa	[%l1] ASI_ASIF_USECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_61:
#define	AIUS_STDW_GOLDEN1	0xaa55ffee
#define	AIUS_STDW_GOLDEN2	0x55aaeeff
#define	AIUS_STDW_GOLDEN3	0xfff0ffff
#define	AIUS_STDW_GOLDEN4	0x111f5555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	AIUS_STDW_GOLDEN1,	 %l2
	set	AIUS_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_USECN
	nop

	ldda	[%l1] ASI_ASIF_USECN, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	AIUS_STDW_GOLDEN3,	 %l2
	set	AIUS_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_USECN
	nop

	ldda	[%l1] ASI_ASIF_USECN, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
	set	0x4,	%o0	/* restore ASI_ASIF_USECN only */
	call	store_golden2pgs
	nop
#endif

	/*
	 ****************************
 	 *  ASI_ASIF_USER_PRIM_LE
	 *	as if user privilege
	 ****************************
	 */
        ta      T_CHANGE_NONPRIV
        nop

#if FIXED
	/* 
	 *********************************
	 * test the privileged trap 
	 *********************************
	 */

        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop

        set     0x0,    %l0
        setx    dexec_pg1_data, %l0,  %l1
        ldsba   [%l1] ASI_ASIF_UPRIM_LE, %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        ta      T_CHANGE_PRIV
        nop

	set	0x5,	%o0	/* set ASIF_USR_PRIM_LE MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_ASIF_UPRIM_LE
!!----------------------------------------

	/* E=0 P=0 CTX=PRIM  little endian */
#define	AIUPL_SB1_GOLDEN	0xffffffffffffff84

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	AIUPL_SH1_GOLDEN	0xffffffffffffff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	AIUPL_SH2_GOLDEN	0x3384
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
#define	AIUPL_SW1_GOLDEN	0xfffffffff5223384
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldswa   [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
#define	AIUPL_USB1_GOLDEN	0x55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduba   [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	AIUPL_UH1_GOLDEN	0xff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduha   [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
#define	AIUPL_UW1_GOLDEN	0xaaffff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduwa   [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	AIUPL_XA1_GOLDEN	0x55ffaaffaaffff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	AIUPL_XA2_GOLDEN	0xff0011fff5223384
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
#define	AIUPL_DDA_GOLDEN1	0xaaffff55
#define	AIUPL_DDA_GOLDEN2	0x55ffaaff
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldda    [%l1] ASI_ASIF_UPRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUPL_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	AIUPL_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */

	/*
	 * Store a byte 
	 */
tc_62:
#define	AIUPL_STB_GOLDEN1	0xaf
#define	AIUPL_STB_GOLDEN2	0xf5
#define	AIUPL_STB_GOLDEN3	0x7f
#define	AIUPL_STB_GOLDEN4	0xeb

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1		
	set	AIUPL_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduba	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUPL_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduba	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUPL_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduba	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUPL_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduba	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_63:
#define	AIUPL_STHW_GOLDEN1	0xaa55
#define	AIUPL_STHW_GOLDEN2	0x55ff
#define	AIUPL_STHW_GOLDEN3	0xffaa
#define	AIUPL_STHW_GOLDEN4	0x3377

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	AIUPL_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduha	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUPL_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduha	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUPL_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduha	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	AIUPL_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduha	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_64:
#define	AIUPL_STW_GOLDEN1	0xaa55ffee
#define	AIUPL_STW_GOLDEN2	0x55aaeeff
#define	AIUPL_STW_GOLDEN3	0xfdfccfff
#define	AIUPL_STW_GOLDEN4	0x33335555

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUPL_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUPL_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUPL_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUPL_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	lduwa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_65:
#define	AIUPL_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	AIUPL_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	AIUPL_STEXW_GOLDEN3	0xffffffff55555555
#define	AIUPL_STEXW_GOLDEN4	0x33335555aaaaffff

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	setx	AIUPL_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUPL_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUPL_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUPL_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop
	ldxa	[%l1] ASI_ASIF_UPRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_66:
#define	AIUPL_STDW_GOLDEN1	0xaa55ffee
#define	AIUPL_STDW_GOLDEN2	0x55aaeeff
#define	AIUPL_STDW_GOLDEN3	0xffffffff
#define	AIUPL_STDW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUPL_STDW_GOLDEN1,	 %l2
	set	AIUPL_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop

	ldda	[%l1] ASI_ASIF_UPRIM_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUPL_STDW_GOLDEN3,	 %l2
	set	AIUPL_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	nop

	ldda	[%l1] ASI_ASIF_UPRIM_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
	set	0x5,	%o0	/* restore ASI_ASIF_UPRIM_LE only */
	call	store_golden2pgs
	nop

/*
 ********************************
 * change back to USER mode 
 ********************************
 */
        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ****************************
 	 *  ASI_ASIF_USECN_LE
	 *	asif user privilege
	 ****************************
	 */

	/* 
	 *********************************
	 * test the privileged trap 
	 *********************************
	 */
tc_67:
        /* enable the trap */
        set     0x37,   %o0     /* Privileged Action trap */
        set     0x1,    %o1     /* 1-time */
        ta      T_HTRAP_EN_N_TIMES
        nop

        set     0x0,    %l0
        setx    dexec_pg2_data, %l0,  %l1
        ldsba   [%l1] ASI_ASIF_USECN_LE, %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        ta      T_CHANGE_PRIV
        nop

	set	0x6,	%o0	/* set ASIF_USR_SECN MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_ASIF_USECN_LE
!!----------------------------------------

	/* E=0 P=0 CTX=SECN  little endian */
#define	AIUSL_SB1_GOLDEN	0xffffffffffffffdd

	/*
	 * Load signed byte 
	 */
tc_68:
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_69:
#define	AIUSL_SH1_GOLDEN	0x55ff
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_70:
#define	AIUSL_SH2_GOLDEN	0xffffffffffffccdd
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsha   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_71:
#define	AIUSL_SW1_GOLDEN	0xffffffffaabbccdd
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldswa   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	AIUSL_SW2_GOLDEN	0x75aa55ff
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldswa   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_SW2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_72:
#define	AIUSL_USB1_GOLDEN	0xdd
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduba   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
tc_73:
#define	AIUSL_UH1_GOLDEN	0xccdd
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduha   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_74:
#define	AIUSL_UW1_GOLDEN	0x75aa55ff
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        lduwa   [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	AIUSL_XA1_GOLDEN	0x99887766aabbccdd
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	AIUSL_XA2_GOLDEN	0x55ffaaff75aa55ff

        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldxa    [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_75:
#define	AIUSL_DDA_GOLDEN1	0xaabbccdd
#define	AIUSL_DDA_GOLDEN2	0x99887766
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldda    [%l1] ASI_ASIF_USECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	AIUSL_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	AIUSL_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */
tc_76:
	/*
	 * Store a byte 
	 */
#define	AIUSL_STB_GOLDEN1	0xff
#define	AIUSL_STB_GOLDEN2	0xaa
#define	AIUSL_STB_GOLDEN3	0x55
#define	AIUSL_STB_GOLDEN4	0x77

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1		
	set	AIUSL_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduba	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUSL_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduba	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUSL_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduba	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	AIUSL_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduba	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_77:
#define	AIUSL_STHW_GOLDEN1	0xaa55
#define	AIUSL_STHW_GOLDEN2	0x55aa
#define	AIUSL_STHW_GOLDEN3	0xffaa
#define	AIUSL_STHW_GOLDEN4	0x77ee

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	AIUSL_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduha	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUSL_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduha	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUSL_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduha	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	AIUSL_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduha	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_78:
#define	AIUSL_STW_GOLDEN1	0xaa55ffee
#define	AIUSL_STW_GOLDEN2	0x00ff789a
#define	AIUSL_STW_GOLDEN3	0xffffffff
#define	AIUSL_STW_GOLDEN4	0x33335555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	AIUSL_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduwa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUSL_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduwa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUSL_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduwa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	AIUSL_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	lduwa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_79:
#define	AIUSL_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	AIUSL_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	AIUSL_STEXW_GOLDEN3	0xffffff00ff555555
#define	AIUSL_STEXW_GOLDEN4	0x33335555aaaaffff

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	setx	AIUSL_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	ldxa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUSL_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	ldxa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUSL_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	ldxa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	AIUSL_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop
	ldxa	[%l1] ASI_ASIF_USECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_80:
#define	AIUSL_STDW_GOLDEN1	0xaa55ffee
#define	AIUSL_STDW_GOLDEN2	0x55aaeeff
#define	AIUSL_STDW_GOLDEN3	0xf5f0ffff
#define	AIUSL_STDW_GOLDEN4	0x111f5555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	AIUSL_STDW_GOLDEN1,	 %l2
	set	AIUSL_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop

	ldda	[%l1] ASI_ASIF_USECN_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	AIUSL_STDW_GOLDEN3,	 %l2
	set	AIUSL_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_ASIF_USECN_LE
	nop

	ldda	[%l1] ASI_ASIF_USECN_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
tc_81:
	set	0x6,	%o0	/* restore ASI_ASIF_USECN_LE only */
	call	store_golden2pgs
	nop

        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ***********************************
 	 *  ASI_PRIM
	 *	test Privilege mode first
	 ***********************************
	 */
	set	0x0,	%o3
chk_asiprim:
	brnz,a	%o3,	asiprim_usrmode
	nop

asiprim_privmode:
        ta      T_CHANGE_PRIV
        nop

asiprim_usrmode:
	set	0x7,	%o0	/* set ASI_PRIM MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_PRIM
!!----------------------------------------

	/* E=0 P=0 CTX=PRIM  big endian */
#define	ASIPRIM_SB1_GOLDEN	0xffffffffffffffff

	/*
	 * Load signed byte 
	 */
tc_82:
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsba   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_83:
#define	ASIPRIM_SH1_GOLDEN	0xffffffffffffffaa
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_84:
#define	ASIPRIM_SH2_GOLDEN	0xffffffffffffaaff
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_85:
#define	ASIPRIM_SW1_GOLDEN	0xffffffffffaa5577
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldswa   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_86:
#define	ASIPRIM_USB1_GOLDEN	0xaa
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduba   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
tc_87:
#define	ASIPRIM_UH1_GOLDEN	0xaaff
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduha   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
tc_88:
#define	ASIPRIM_UH2_GOLDEN	0xffaa
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        lduha   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_UH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_89:
#define	ASIPRIM_UW1_GOLDEN	0xaaffff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduwa   [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
tc_90:
#define	ASIPRIM_XA1_GOLDEN	0xaaffff5555764399
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	ASIPRIM_XA2_GOLDEN	0xffaa55770000ffff
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_91:
#define	ASIPRIM_DDA_GOLDEN1	0xaaffff55
#define	ASIPRIM_DDA_GOLDEN2	0x55764399
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldda    [%l1] ASI_PRIM,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIM_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	ASIPRIM_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */
tc_92:
	/*
	 * Store a byte 
	 */
#define	ASIPRIM_STB_GOLDEN1	0x77
#define	ASIPRIM_STB_GOLDEN2	0xbb
#define	ASIPRIM_STB_GOLDEN3	0xff
#define	ASIPRIM_STB_GOLDEN4	0xa5

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1		
	set	ASIPRIM_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_PRIM
	nop

	lduba	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASIPRIM_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_PRIM
	nop
	lduba	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASIPRIM_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_PRIM
	nop
	lduba	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASIPRIM_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_PRIM
	nop
	lduba	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_93:
#define	ASIPRIM_STHW_GOLDEN1	0xaa55
#define	ASIPRIM_STHW_GOLDEN2	0x55aa
#define	ASIPRIM_STHW_GOLDEN3	0xffaa
#define	ASIPRIM_STHW_GOLDEN4	0x33ff

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	ASIPRIM_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_PRIM
	nop
	lduha	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIM_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_PRIM
	nop
	lduha	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIM_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_PRIM
	nop
	lduha	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	ASIPRIM_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_PRIM
	nop
	lduha	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_94:
#define	ASIPRIM_STW_GOLDEN1	0xaa55ffee
#define	ASIPRIM_STW_GOLDEN2	0x55aaeeff
#define	ASIPRIM_STW_GOLDEN3	0xffffffff
#define	ASIPRIM_STW_GOLDEN4	0x33005555

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	ASIPRIM_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
	nop
	lduwa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIM_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
	nop
	lduwa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIM_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
	nop
	lduwa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIM_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
	nop
	lduwa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_95:
#define	ASIPRIM_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	ASIPRIM_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	ASIPRIM_STEXW_GOLDEN3	0xffff0fff55555555
#define	ASIPRIM_STEXW_GOLDEN4	0x33335505aaaaffff

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	setx	ASIPRIM_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM
	nop
	ldxa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASIPRIM_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM
	nop
	ldxa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASIPRIM_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM
	nop
	ldxa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASIPRIM_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM
	nop
	ldxa	[%l1] ASI_PRIM, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_96:
#define	ASIPRIM_STDW_GOLDEN1	0xaa55ffee
#define	ASIPRIM_STDW_GOLDEN2	0x55aaeeff
#define	ASIPRIM_STDW_GOLDEN3	0xfff00fff
#define	ASIPRIM_STDW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	ASIPRIM_STDW_GOLDEN1,	 %l2
	set	ASIPRIM_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_PRIM
	nop

	ldda	[%l1] ASI_PRIM, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	ASIPRIM_STDW_GOLDEN3,	 %l2
	set	ASIPRIM_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_PRIM
	nop

	ldda	[%l1] ASI_PRIM, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
	set	0x7,	%o0	/* restore ASI_PRIM mem only */
	call	store_golden2pgs
	nop

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asiprim
	nop

        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ***********************************
 	 *  ASI_SECN
	 *	test Privilege mode first
	 ***********************************
	 */
	set	0x0,	%o3
chk_asisecn:
	brnz,a	%o3,	asisecn_usrmode
	nop

asisecn_privmode:
        ta      T_CHANGE_PRIV
        nop

asisecn_usrmode:
	set	0x8,	%o0	/* set ASI_SECN MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_SECN
!!----------------------------------------

	/* E=0 P=0 CTX=SECN  big endian */
#define	ASISECN_SB1_GOLDEN	0xffffffffffffffaa

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsba   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	ASISECN_SH1_GOLDEN	0xffffffffffffffee
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldsha   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	ASISECN_SH2_GOLDEN	0xffffffffffffaabb
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsha   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
#define	ASISECN_SW1_GOLDEN	0xffffffffaabbccdd
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldswa   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	ASISECN_SW2_GOLDEN	0xffffffffffeeddcc
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldswa   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_SW2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
#define	ASISECN_USB1_GOLDEN	0xaa
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduba   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	ASISECN_UH1_GOLDEN	0xaabb
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduha   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
#define	ASISECN_UW1_GOLDEN	0xffeeddcc
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        lduwa   [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	ASISECN_XA1_GOLDEN	0xaabbccdd99ffffaa
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldxa    [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	ASISECN_XA2_GOLDEN	0xffeeddcc55aabb99

        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldxa    [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
#define	ASISECN_DDA_GOLDEN1	0xaabbccdd
#define	ASISECN_DDA_GOLDEN2	0x99ffffaa
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldda    [%l1] ASI_SECN,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECN_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	ASISECN_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */

	/*
	 * Store a byte 
	 */
tc_97:
#define	ASISECN_STB_GOLDEN1	0xff
#define	ASISECN_STB_GOLDEN2	0xaa
#define	ASISECN_STB_GOLDEN3	0x55
#define	ASISECN_STB_GOLDEN4	0x00

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1		
	set	ASISECN_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_SECN
	nop
	lduba	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASISECN_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_SECN
	nop
	lduba	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASISECN_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_SECN
	nop
	lduba	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASISECN_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_SECN
	nop
	lduba	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_98:
#define	ASISECN_STHW_GOLDEN1	0xaa55
#define	ASISECN_STHW_GOLDEN2	0x55aa
#define	ASISECN_STHW_GOLDEN3	0xffaa
#define	ASISECN_STHW_GOLDEN4	0x77ee

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	ASISECN_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_SECN
	nop
	lduha	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECN_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_SECN
	nop
	lduha	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECN_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_SECN
	nop
	lduha	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	ASISECN_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_SECN
	nop
	lduha	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_99:
#define	ASISECN_STW_GOLDEN1	0xaa55ffee
#define	ASISECN_STW_GOLDEN2	0x00055000
#define	ASISECN_STW_GOLDEN3	0xffffffff
#define	ASISECN_STW_GOLDEN4	0x33335555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	ASISECN_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_SECN
	nop
	lduwa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECN_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_SECN
	nop
	lduwa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECN_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_SECN
	nop
	lduwa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECN_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_SECN
	nop
	lduwa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_100:
#define	ASISECN_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	ASISECN_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	ASISECN_STEXW_GOLDEN3	0xffffff00ff550055
#define	ASISECN_STEXW_GOLDEN4	0x33335555aa0affff

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	setx	ASISECN_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN
	nop
	ldxa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASISECN_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN
	nop
	ldxa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASISECN_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN
	nop
	ldxa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASISECN_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN
	nop
	ldxa	[%l1] ASI_SECN, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_101:
#define	ASISECN_STDW_GOLDEN1	0xaa55ffee
#define	ASISECN_STDW_GOLDEN2	0x55aaeeff
#define	ASISECN_STDW_GOLDEN3	0xfff0ffff
#define	ASISECN_STDW_GOLDEN4	0x111f5555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	ASISECN_STDW_GOLDEN1,	 %l2
	set	ASISECN_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_SECN
	nop

	ldda	[%l1] ASI_SECN, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	ASISECN_STDW_GOLDEN3,	 %l2
	set	ASISECN_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_SECN
	nop

	ldda	[%l1] ASI_SECN, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
tc_102:
	set	0x8,	%o0	/* restore ASI_SECN only */
	call	store_golden2pgs
	nop

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asisecn
	nop

        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ***********************************
 	 *  ASI_PRIM_LE
	 *	test Privilege mode first
	 ***********************************
	 */
	set	0x0,	%o3
chk_asiprimle:
	brnz,a	%o3,	asiprimle_usrmode
	nop

asiprimle_privmode:
        ta      T_CHANGE_PRIV
        nop

asiprimle_usrmode:
	set	0x9,	%o0	/* set ASI_PRIM_LE MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_PRIM_LE
!!----------------------------------------

tc_103:
	/* E=0 P=0 CTX=PRIM  little endian */
#define	ASIPRIMLE_SB1_GOLDEN	0x77

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsba   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	ASIPRIMLE_SH1_GOLDEN	0x5577
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_104:
#define	ASIPRIMLE_SH2_GOLDEN	0xffffffffffffff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
#define	ASIPRIMLE_SW1_GOLDEN	0xffffffffffaa5577
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldswa   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_105:
#define	ASIPRIMLE_USB1_GOLDEN	0x55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduba   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	ASIPRIMLE_UH1_GOLDEN	0xff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduha   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	ASIPRIMLE_UH2_GOLDEN	0x5577
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        lduha   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_UH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_106:
#define	ASIPRIMLE_UW1_GOLDEN	0xaaf0ff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduwa   [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
tc_107:
#define	ASIPRIMLE_XA1_GOLDEN	0x55764399aaf0ff55
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	ASIPRIMLE_XA2_GOLDEN	0x7700ffffffaa5577
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_108:
#define	ASIPRIMLE_DDA_GOLDEN1	0xaaf0ff55
#define	ASIPRIMLE_DDA_GOLDEN2	0x55764399
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        ldda    [%l1] ASI_PRIM_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASIPRIMLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	ASIPRIMLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */

	/*
	 * Store a byte 
	 */
tc_109:
#define	ASIPRIMLE_STB_GOLDEN1	0x77
#define	ASIPRIMLE_STB_GOLDEN2	0xbb
#define	ASIPRIMLE_STB_GOLDEN3	0xff
#define	ASIPRIMLE_STB_GOLDEN4	0xa5

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1		
	set	ASIPRIMLE_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduba	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASIPRIMLE_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduba	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASIPRIMLE_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduba	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASIPRIMLE_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduba	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_110:
#define	ASIPRIMLE_STHW_GOLDEN1	0xaa55
#define	ASIPRIMLE_STHW_GOLDEN2	0x55aa
#define	ASIPRIMLE_STHW_GOLDEN3	0xffaa
#define	ASIPRIMLE_STHW_GOLDEN4	0x33ff

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	ASIPRIMLE_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduha	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIMLE_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduha	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIMLE_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduha	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	ASIPRIMLE_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduha	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_111:
#define	ASIPRIMLE_STW_GOLDEN1	0xaa55ffee
#define	ASIPRIMLE_STW_GOLDEN2	0x55aaeeff
#define	ASIPRIMLE_STW_GOLDEN3	0xffffffff
#define	ASIPRIMLE_STW_GOLDEN4	0x33005555

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	ASIPRIMLE_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduwa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIMLE_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduwa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIMLE_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduwa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASIPRIMLE_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
	nop
	lduwa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_112:
#define	ASIPRIMLE_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	ASIPRIMLE_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	ASIPRIMLE_STEXW_GOLDEN3	0xffff0fff55555555
#define	ASIPRIMLE_STEXW_GOLDEN4	0x33335505aaaaffff

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	setx	ASIPRIMLE_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM_LE
	nop
	ldxa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASIPRIMLE_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM_LE
	nop
	ldxa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASIPRIMLE_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM_LE
	nop
	ldxa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASIPRIMLE_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_PRIM_LE
	nop
	ldxa	[%l1] ASI_PRIM_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_113:
#define	ASIPRIMLE_STDW_GOLDEN1	0xaa55ffee
#define	ASIPRIMLE_STDW_GOLDEN2	0x55aaeeff
#define	ASIPRIMLE_STDW_GOLDEN3	0xfff00fff
#define	ASIPRIMLE_STDW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	ASIPRIMLE_STDW_GOLDEN1,	 %l2
	set	ASIPRIMLE_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_PRIM_LE
	nop

	ldda	[%l1] ASI_PRIM_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	ASIPRIMLE_STDW_GOLDEN3,	 %l2
	set	ASIPRIMLE_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_PRIM_LE
	nop

	ldda	[%l1] ASI_PRIM_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
	set	0x9,	%o0	/* restore ASI_PRIM_LE mem only */
	call	store_golden2pgs
	nop

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asiprimle
	nop

        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ***********************************
 	 *  ASI_SECN_LE
	 *	test Privilege mode first
	 ***********************************
	 */
tc_114:
	set	0x0,	%o3
chk_asisecnle:
	brnz,a	%o3,	asisecnle_usrmode
	nop

asisecnle_privmode:
        ta      T_CHANGE_PRIV
        nop

asisecnle_usrmode:
	set	0xa,	%o0	/* set ASI_SECN_LE MEM only */
	call	store_golden2pgs
	nop

!!----------------------------------------
!!	PRIV=0 load ASI=ASI_SECN_LE
!!----------------------------------------

	/* E=0 P=0 CTX=SECN  little endian */
#define	ASISECNLE_SB1_GOLDEN	0xffffffffffffffdf

	/*
	 * Load signed byte 
	 */
tc_115:
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsba   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	ASISECNLE_SH1_GOLDEN	0xffffffffffffadcc
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldsha   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_116:
#define	ASISECNLE_SH2_GOLDEN	0xffffffffffffcedf
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldsha   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_SH2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
#define	ASISECNLE_SW1_GOLDEN	0xffffffffbaffcedf
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldswa   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	ASISECNLE_SW2_GOLDEN	0x5feeadcc
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldswa   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_SW2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_117:
#define	ASISECNLE_USB1_GOLDEN	0xdf
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduba   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	ASISECNLE_UH1_GOLDEN	0xcedf
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduha   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_118:
#define	ASISECNLE_UW1_GOLDEN	0x5feeadcc
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        lduwa   [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	ASISECNLE_XA1_GOLDEN	0x99f7ffaabaffcedf
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldxa    [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

#define	ASISECNLE_XA2_GOLDEN	0x55aabb995feeadcc

        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        ldxa    [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_XA2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_119:
#define	ASISECNLE_DDA_GOLDEN1	0xbaffcedf
#define	ASISECNLE_DDA_GOLDEN2	0x99f7ffaa
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        ldda    [%l1] ASI_SECN_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASISECNLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	ASISECNLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */

	/*
	 * Store a byte 
	 */
tc_120:
#define	ASISECNLE_STB_GOLDEN1	0xff
#define	ASISECNLE_STB_GOLDEN2	0xaa
#define	ASISECNLE_STB_GOLDEN3	0x55
#define	ASISECNLE_STB_GOLDEN4	0x00

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1		
	set	ASISECNLE_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_SECN_LE
	nop
	lduba	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASISECNLE_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_SECN_LE
	nop
	lduba	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASISECNLE_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_SECN_LE
	nop
	lduba	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	ASISECNLE_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_SECN_LE
	nop
	lduba	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
tc_121:
#define	ASISECNLE_STHW_GOLDEN1	0xaa55
#define	ASISECNLE_STHW_GOLDEN2	0x55aa
#define	ASISECNLE_STHW_GOLDEN3	0xffaa
#define	ASISECNLE_STHW_GOLDEN4	0x77ee

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	ASISECNLE_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_SECN_LE
	nop
	lduha	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECNLE_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_SECN_LE
	nop
	lduha	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECNLE_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_SECN_LE
	nop
	lduha	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	ASISECNLE_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_SECN_LE
	nop
	lduha	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_122:
#define	ASISECNLE_STW_GOLDEN1	0xaa55ffee
#define	ASISECNLE_STW_GOLDEN2	0x00055000
#define	ASISECNLE_STW_GOLDEN3	0xffffffff
#define	ASISECNLE_STW_GOLDEN4	0x33335555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	ASISECNLE_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_SECN_LE
	nop
	lduwa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECNLE_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_SECN_LE
	nop
	lduwa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECNLE_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_SECN_LE
	nop
	lduwa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	ASISECNLE_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_SECN_LE
	nop
	lduwa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_123:
#define	ASISECNLE_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	ASISECNLE_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	ASISECNLE_STEXW_GOLDEN3	0xffffff00ff550055
#define	ASISECNLE_STEXW_GOLDEN4	0x33335555aa0affff

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	setx	ASISECNLE_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN_LE
	nop
	ldxa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASISECNLE_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN_LE
	nop
	ldxa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASISECNLE_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN_LE
	nop
	ldxa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	ASISECNLE_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_SECN_LE
	nop
	ldxa	[%l1] ASI_SECN_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_124:
#define	ASISECNLE_STDW_GOLDEN1	0xaa55ffee
#define	ASISECNLE_STDW_GOLDEN2	0x55aaeeff
#define	ASISECNLE_STDW_GOLDEN3	0xfff0ffff
#define	ASISECNLE_STDW_GOLDEN4	0x111f5555

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	ASISECNLE_STDW_GOLDEN1,	 %l2
	set	ASISECNLE_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_SECN_LE
	nop

	ldda	[%l1] ASI_SECN_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	ASISECNLE_STDW_GOLDEN3,	 %l2
	set	ASISECNLE_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_SECN_LE
	nop

	ldda	[%l1] ASI_SECN_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/* 
	 ****************************
	 * restore the value in MEM
	 ****************************
 	 */
	set	0xa,	%o0	/* restore ASI_SECN_LE only */
	call	store_golden2pgs
	nop

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asisecnle
	nop

        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ***********************************
 	 *  ASI_PRIM_NFLT 
	 *	test Privilege mode first
	 ***********************************
	 */
	set	0x0,	%o3
chk_asiprimnf:
	brnz,a	%o3,	asiprimnf_usrmode
	nop

asiprimnf_privmode:
        ta      T_CHANGE_PRIV
        nop

asiprimnf_usrmode:
!!----------------------------------------
!!	PRIV=0 load ASI=ASI_PRIM_NFLT
!!----------------------------------------

	/* E=0 P=0 CTX=PRIM  big endian */
#define	APRIMNF_SB1_GOLDEN	0xffffffffffffffff

	/*
	 * Load signed byte 
	 */
tc_125:
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldsba   [%l1] ASI_PRIM_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	APRIMNF_SH1_GOLDEN	0xffffffffffffffaa
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_126:
#define	APRIMNF_SW1_GOLDEN	0xffffffffffaa5577
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldswa   [%l1] ASI_PRIM_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
#define	APRIMNF_USB1_GOLDEN	0xff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        lduba   [%l1] ASI_PRIM_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	APRIMNF_UH1_GOLDEN	0xffaa
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        lduha   [%l1] ASI_PRIM_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_127:
#define	APRIMNF_UW1_GOLDEN	0x789affff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        set     0x4,    %l0
        lduwa   [%l1+%l0] ASI_PRIM_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	APRIMNF_XA1_GOLDEN	0xffaa5577789affff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM_NFLT, %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_128:
#define	APRIMNF_DDA_GOLDEN1	0xffaa5577
#define	APRIMNF_DDA_GOLDEN2	0x789affff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldda    [%l1] ASI_PRIM_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNF_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	APRIMNF_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asiprimnf
	nop

	/*
	 ***********************************
 	 *  ASI_SECN_NFLT 
	 *	test Privilege mode first
	 ***********************************
	 */
        ta      T_CHANGE_NONPRIV
        nop

	set	0x0,	%o3
chk_asisecnnf:
	brnz,a	%o3,	asisecnnf_usrmode
	nop

asisecnnf_privmode:
        ta      T_CHANGE_PRIV
        nop

asisecnnf_usrmode:
!!----------------------------------------
!!	PRIV=0 load ASI=ASI_SECN_NFLT
!!----------------------------------------

	/* E=0 P=0 CTX=PRIM  big endian */
#define	ASECNNF_SB1_GOLDEN	0xffffffffffffffbb

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldsba   [%l1] ASI_SECN_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_129:
#define	ASECNNF_SH1_GOLDEN	0xffffffffffffbbcc
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldsha   [%l1] ASI_SECN_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
#define	ASECNNF_SW1_GOLDEN	0xffffffffbbcceeff
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldswa   [%l1] ASI_SECN_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
#define	ASECNNF_USB1_GOLDEN	0xbb
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduba   [%l1] ASI_SECN_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
tc_130:
#define	ASECNNF_UH1_GOLDEN	0xbbcc
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduha   [%l1] ASI_SECN_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
#define	ASECNNF_UW1_GOLDEN	0xbbcceeff
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduwa   [%l1] ASI_SECN_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
tc_131:
#define	ASECNNF_XA1_GOLDEN	0xbbcceeff778899aa
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldxa    [%l1] ASI_SECN_NFLT, %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
#define	ASECNNF_DDA_GOLDEN1	0xbbcceeff
#define	ASECNNF_DDA_GOLDEN2	0x778899aa
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldda    [%l1] ASI_SECN_NFLT,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNF_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	ASECNNF_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asisecnnf
	nop

	/*
	 ***********************************
 	 *  ASI_PRIM_NFLT_LE 
	 *	test Privilege mode first
	 ***********************************
	 */
tc_132:
	set	0x0,	%o3
chk_asiprimnfle:
	brnz,a	%o3,	asiprimnfle_usrmode
	nop

asiprimnfle_privmode:
        ta      T_CHANGE_PRIV
        nop

asiprimnfle_usrmode:
!!----------------------------------------
!!	PRIV=0 load ASI=ASI_PRIM_NFLT_LE
!!----------------------------------------

	/* E=0 P=0 CTX=PRIM  little endian */
#define	APRIMNFLE_SB1_GOLDEN	0xffffffffffffffff

	/*
	 * Load signed byte 
	 */
tc_133:
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldsba   [%l1] ASI_PRIM_NFLT_LE,      %l2
        nop

        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldsba   [%l1] ASI_PRIM_NFLT,      %l3
        nop

	nop;nop;nop;nop;nop;
	nop;nop;nop;nop;nop;

        set	0x0,	%l0
	setx	APRIMNFLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	APRIMNFLE_SH1_GOLDEN	0xffffffffffffaaff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM_NFLT_LE,      %l2
        nop

	nop;nop;nop;nop;nop;
	nop;nop;nop;nop;nop;

        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM_NFLT,      %l3
        nop

	nop;nop;nop;nop;nop;
	nop;nop;nop;nop;nop;

        set	0x0,	%l0
	setx	APRIMNFLE_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_134:
#define	APRIMNFLE_SW1_GOLDEN	0x7755aaff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldswa   [%l1] ASI_PRIM_NFLT_LE,      %l2
        nop

	nop;nop;nop;nop;nop;

        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldswa   [%l1] ASI_PRIM_NFLT,      %l3
        nop

	nop;nop;nop;nop;nop;

        set	0x0,	%l0
	setx	APRIMNFLE_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_135:
#define	APRIMNFLE_USB1_GOLDEN	0xff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        lduba   [%l1] ASI_PRIM_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNFLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	APRIMNFLE_UH1_GOLDEN	0xaaff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        lduha   [%l1] ASI_PRIM_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNFLE_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_136:
#define	APRIMNFLE_UW1_GOLDEN	0xffff9a78
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        set     0x4,    %l0
        lduwa   [%l1+%l0] ASI_PRIM_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNFLE_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	APRIMNFLE_XA1_GOLDEN	0xffff9a787755aaff
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM_NFLT_LE, %l2
        nop

        set	0x0,	%l0
	setx	APRIMNFLE_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_137:
#define	APRIMNFLE_DDA_GOLDEN1	0x7755aaff
#define	APRIMNFLE_DDA_GOLDEN2	0xffff9a78
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        ldda    [%l1] ASI_PRIM_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	APRIMNFLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	APRIMNFLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asiprimnfle
	nop

	/*
	 ***********************************
 	 *  ASI_SECN_NFLT_LE 
	 *	test Privilege mode first
	 ***********************************
	 */
        ta      T_CHANGE_NONPRIV
        nop

	set	0x0,	%o3
chk_asisecnnfle:
	brnz,a	%o3,	asisecnnfle_usrmode
	nop

asisecnnfle_privmode:
        ta      T_CHANGE_PRIV
        nop

asisecnnfle_usrmode:
!!----------------------------------------
!!	PRIV=0 load ASI=ASI_SECN_NFLT_LE
!!----------------------------------------

	/* E=0 P=0 CTX=PRIM  little endian */
#define	ASECNNFLE_SB1_GOLDEN	0xffffffffffffffbb

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldsba   [%l1] ASI_SECN_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
#define	ASECNNFLE_SH1_GOLDEN	0xffffffffffffccbb
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldsha   [%l1] ASI_SECN_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
tc_138:
#define	ASECNNFLE_SW1_GOLDEN	0xffffffffffeeccbb
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldswa   [%l1] ASI_SECN_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_139:
#define	ASECNNFLE_USB1_GOLDEN	0xbb
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduba   [%l1] ASI_SECN_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	ASECNNFLE_UH1_GOLDEN	0xccbb
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduha   [%l1] ASI_SECN_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
tc_140:
#define	ASECNNFLE_UW1_GOLDEN	0xffeeccbb
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduwa   [%l1] ASI_SECN_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
#define	ASECNNFLE_XA1_GOLDEN	0xaa998877ffeeccbb
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldxa    [%l1] ASI_SECN_NFLT_LE, %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
tc_141:
#define	ASECNNFLE_DDA_GOLDEN1	0xffeeccbb
#define	ASECNNFLE_DDA_GOLDEN2	0xaa998877
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        ldda    [%l1] ASI_SECN_NFLT_LE,      %l2
        nop

        set	0x0,	%l0
	setx	ASECNNFLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	ASECNNFLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        ta      T_CHANGE_NONPRIV
        nop

	add	%o3,	0x1,	%o3
	sub	%o3,	0x2,	%o4
	brnz,a	%o4,	chk_asisecnnfle
	nop

/*
 **********************************************
 *	check the AS_IF_USER_PRIVILEGE PRIME 
 *	
 * 	Under PRIV mode, if use AIUP to access
 *	the privileged page, should cause
 *		DEXEC trap.	
 **********************************************
 */

tc_142:
	/* changed to PRIV mode */ 
        ta      T_CHANGE_PRIV
        nop

        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV PRIM */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg5_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_UPRIM,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV PRIM */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg5_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_UPRIM_LE,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV PRIM */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg13_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_UPRIM,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV PRIM */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg13_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_UPRIM_LE,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

tc_143:
        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV SECN */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg6_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_USECN,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV SECN */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg6_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_USECN_LE, %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

tc_144:
        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV SECN */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg14_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_USECN,	%l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

        /* enable the trap */
        set     0x30,   %o0     /* DEXEC trap : ASIF_USER_PRIV SECN */
        set     0x1,    %o1     /* Enable one time */ 
        ta      T_HTRAP_EN_N_TIMES
        nop
   
        set     0x0,    %l0
        setx    dexec_pg14_data, %l0, %l1
        ldsba   [%l1] ASI_ASIF_USECN_LE, %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
	nop

	/* changed to PRIV mode */ 
        ta      T_CHANGE_NONPRIV
        nop

/*
 *********************************************
 *	
 *  Check the ld/st consistency for 
 *
 *	Same VA, but different PA
 *		primary vs. secondary	
 *
 *	Write to the same VA, using different
 *	ASIs, should write to different PA.
 *********************************************
 */
#define	CRX_CHECKING_D1	0xcafecafe
#define	CRX_CHECKING_D2	0xbeefbeef

tc_145:
	set	0x0,	%l0
	set	0x0,	%l1
	set	0x0,	%l2
	set	0x0,	%l3
	set	0x0,	%l4
	set	0x0,	%l5
	set	0x0,	%l6

	/* add cross checking 1 */
	setx	dexec_pg1_data, %l0, %l1
	set	CRX_CHECKING_D1, %l2
	sta	%l2,	[%l1] ASI_PRIM
	nop

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l3
	lda	[%l3] ASI_SECN, %l5
	sub	%l5,	%l2,	%l4
	brz,a	%l4,	diag_fail
	nop

	/* add cross checking 2 */
	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1		
	set	CRX_CHECKING_D2, %l2
	sta	%l2,	[%l1] ASI_SECN
	nop

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l3
	lda	[%l3] ASI_PRIM, %l5
	sub	%l5,	%l2,	%l4
	brz,a	%l4,	diag_fail
	nop

	/* restore the values in MEM */
	set	0x7,	%o0
	call	store_golden2pgs
	nop
	
	set	0x8,	%o0
	call	store_golden2pgs
	nop
#endif

/*
 **********************************************
 *
 *	Test ASI access DMMU to the pages 
 *	with IE (invert endianess bit) set
 *
 *	ASI_PRIM will become ASI_PRIM_le	
 *	ASI_PRIM_LE will become ASI_PRIM
 *	  and so on.
 *
 **********************************************
 */

	/* 
	 * 	Test NUCLEUS pages with IE=1
	 */

#define LEPAGE_EN	0 

	/*	
	 *	ASI = ASI_NUCLEUS 
	 */
	/* changed to PRIV mode */ 
        ta      T_CHANGE_PRIV
        nop

!!----------------------------------------
!!      PRIV=1 load ASI=NUCLEUS
!!----------------------------------------

        /* E=0 P=0 CTX=NUCLEUS  */
#define LEPNUCLEUS_SB1_GOLDEN      0x11

tc_146:
        /*
         * Load signed byte
         */
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldsba   [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed half word
         */
#define LEPNUCLEUS_SB2_GOLDEN      0x2211
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldsha   [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_SB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed  word
         */
#define LEPNUCLEUS_SB3_GOLDEN      0xffffffffbbcc2211
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldswa   [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_SB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail


        /*
         ****************************
         * Load unsigned byte
         ****************************
         */
tc_147:
#define LEPNUCLEUS_USB1_GOLDEN     0x11
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        lduba   [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned half word
         */
#define LEPNUCLEUS_USB2_GOLDEN     0x2211
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        lduha   [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_USB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned  word
         */
#define LEPNUCLEUS_USB3_GOLDEN     0xbbcc2211
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        lduwa   [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_USB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Extended word
         *****************************
         */
#define LEPNUCLEUS_XA_GOLDEN       0x55332211bbcc2211
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldxa    [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_XA_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Double Word
         *****************************
         */
tc_148:
#define LEPNUCLEUS_DDA_GOLDEN1     0xbbcc2211
#define LEPNUCLEUS_DDA_GOLDEN2     0x55332211
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldda    [%l1] ASI_NUCLEUS,      %l2
        nop

        set     0x0,    %l0
        setx    LEPNUCLEUS_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set     0x0,    %l0
        setx    LEPNUCLEUS_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        /*
         *****************************************
         *      Testing more stores
         *****************************************
         */

        /*
         * Store a byte
         */
tc_149:
#define LEPSTB_GOLDEN1     0xaa
#define LEPSTB_GOLDEN2     0x55
#define LEPSTB_GOLDEN3     0xff
#define LEPSTB_GOLDEN4     0x00

        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        set     LEPSTB_GOLDEN1,    %l2
        stba    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduba   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     LEPSTB_GOLDEN2,    %l2
        stba    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduba   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     LEPSTB_GOLDEN3,    %l2
        stba    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduba   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     LEPSTB_GOLDEN4,    %l2
        stba    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduba   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        /*
         * Store a half word
         */
tc_150:
#define LEPSTHW_GOLDEN1    0xaa55
#define LEPSTHW_GOLDEN2    0x55aa
#define LEPSTHW_GOLDEN3    0xffaa
#define LEPSTHW_GOLDEN4    0xeeff

        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        set     LEPSTHW_GOLDEN1,   %l2
        stha    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduha   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     LEPSTHW_GOLDEN2,   %l2
        stha    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduha   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     LEPSTHW_GOLDEN3,   %l2
        stha    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduha   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop
        set     LEPSTHW_GOLDEN4,   %l2
        stha    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduha   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store a word
         */
tc_151:
#define LEPSTW_GOLDEN1     0xaa55ffee
#define LEPSTW_GOLDEN2     0x55aaeeff
#define LEPSTW_GOLDEN3     0xffffffff
#define LEPSTW_GOLDEN4     0x11115555

        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        set     LEPSTW_GOLDEN1,    %l2
        stwa    %l2,    [%l1] ASI_NUCLEUS
        nop

        lduwa   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     LEPSTW_GOLDEN2,    %l2
        stwa    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduwa   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     LEPSTW_GOLDEN3,    %l2
        stwa    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduwa   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     LEPSTW_GOLDEN4,    %l2
        stwa    %l2,    [%l1] ASI_NUCLEUS
        nop
        lduwa   [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an extended word
         */
tc_152:
#define LEPSTEXW_GOLDEN1   0xaa55ffee55aaeeff
#define LEPSTEXW_GOLDEN2   0x55aaeeffaaff55ee
#define LEPSTEXW_GOLDEN3   0xffffffff55555555
#define LEPSTEXW_GOLDEN4   0x11115555aaaaffff

        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        setx    LEPSTEXW_GOLDEN1,   %l0, %l2
        stxa    %l2,    [%l1] ASI_NUCLEUS
        nop
        ldxa    [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    LEPSTEXW_GOLDEN2,   %l0, %l2
        stxa    %l2,    [%l1] ASI_NUCLEUS
        nop
        ldxa    [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    LEPSTEXW_GOLDEN3,   %l0, %l2
        stxa    %l2,    [%l1] ASI_NUCLEUS
        nop
        ldxa    [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    LEPSTEXW_GOLDEN4,   %l0, %l2
        stxa    %l2,    [%l1] ASI_NUCLEUS
        nop
        ldxa    [%l1] ASI_NUCLEUS,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an double word
         */
tc_153:
#define LEPSTDW_GOLDEN1    0xaa55ffee
#define LEPSTDW_GOLDEN2    0x55aaeeff
#define LEPSTDW_GOLDEN3    0xbbcc2211
#define LEPSTDW_GOLDEN4    0x55332211

        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        set     LEPSTDW_GOLDEN1,    %l2
        set     LEPSTDW_GOLDEN2,    %l3
        stda    %l2,    [%l1] ASI_NUCLEUS
        nop

        ldda    [%l1] ASI_NUCLEUS,      %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        set     LEPSTDW_GOLDEN3,    %l2
        set     LEPSTDW_GOLDEN4,    %l3
        stda    %l2,    [%l1] ASI_NUCLEUS
        nop

        ldda    [%l1] ASI_NUCLEUS,      %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

/*
 ********************************
 * change back to USER mode
 ********************************
 */
        ta      T_CHANGE_NONPRIV
        nop

	/*
	 ****************************
 	 *  ASI_NUCLEUS_LE(ASI_NL)
	 ****************************
	 */
        ta      T_CHANGE_PRIV
        nop

!!----------------------------------------
!!	PRIV=1 load ASI=NUCLEUS_LE
!!----------------------------------------

tc_154:
	/* E=0 P=0 CTX=NUCLEUS  */
#define	IESET_NCLE_SB1_GOLDEN	0x11

	/*
	 * Load signed byte 
	 */
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldsba   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed half word
	 */
tc_155:
#define	IESET_NCLE_SB2_GOLDEN	0x1122
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldsha   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_SB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load signed  word
	 */
#define	IESET_NCLE_SB3_GOLDEN	0x1122ccbb
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldswa   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_SB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail


	/*
	 ****************************
	 * Load unsigned byte 
	 ****************************
	 */
tc_156:
#define	IESET_NCLE_USB1_GOLDEN	0x11
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        lduba   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned half word
	 */
#define	IESET_NCLE_USB2_GOLDEN	0x1122
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        lduha   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_USB2_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 * Load unsigned  word
	 */
#define	IESET_NCLE_USB3_GOLDEN	0x1122ccbb
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        lduwa   [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_USB3_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Extended word
	 *****************************
 	 */
tc_157:
#define	IESET_NCLE_XA_GOLDEN	0x1122ccbb11223355
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldxa    [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_XA_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

	/*
	 *****************************
	 *	Load Double Word
	 *****************************
 	 */
#define	IESET_NCLE_DDA_GOLDEN1	0x1122ccbb
#define	IESET_NCLE_DDA_GOLDEN2	0x11223355
        set     0x0,    %l0
        setx    dexec_pg35_data, %l0, %l1
        ldda    [%l1] ASI_NUCLEUS_LE,      %l2
        nop

        set	0x0,	%l0
	setx	IESET_NCLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set	0x0,	%l0
	setx	IESET_NCLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

	/*
	 *****************************************
	 *	Testing more stores
	 *****************************************
	 */
tc_158:

	/*
	 * Store a byte 
	 */
#define	IES_NLE_STB_GOLDEN1	0xaa
#define	IES_NLE_STB_GOLDEN2	0x55
#define	IES_NLE_STB_GOLDEN3	0xff
#define	IES_NLE_STB_GOLDEN4	0x00

	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1		
	set	IES_NLE_STB_GOLDEN1,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	IES_NLE_STB_GOLDEN2,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	IES_NLE_STB_GOLDEN3,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail

	set	IES_NLE_STB_GOLDEN4,	%l2
	stba	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduba	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	/*
	 * Store a half word 
	 */
#define	IES_NLE_STHW_GOLDEN1	0xaa55
#define	IES_NLE_STHW_GOLDEN2	0x55aa
#define	IES_NLE_STHW_GOLDEN3	0xffaa
#define	IES_NLE_STHW_GOLDEN4	0xeeff

tc_159:
	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1
	set	IES_NLE_STHW_GOLDEN1,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	IES_NLE_STHW_GOLDEN2,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	IES_NLE_STHW_GOLDEN3,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop
	set	IES_NLE_STHW_GOLDEN4,	%l2
	stha	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduha	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store a word 
	 */
tc_160:
#define	IES_NLE_STW_GOLDEN1	0xaa55ffee
#define	IES_NLE_STW_GOLDEN2	0x55aaeeff
#define	IES_NLE_STW_GOLDEN3	0xffffffff
#define	IES_NLE_STW_GOLDEN4	0x11115555

	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1
	set	IES_NLE_STW_GOLDEN1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	IES_NLE_STW_GOLDEN2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	IES_NLE_STW_GOLDEN3,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	set	IES_NLE_STW_GOLDEN4,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	lduwa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an extended word 
	 */
tc_161:
#define	IES_NLE_STEXW_GOLDEN1	0xaa55ffee55aaeeff
#define	IES_NLE_STEXW_GOLDEN2	0x55aaeeffaaff55ee
#define	IES_NLE_STEXW_GOLDEN3	0xffffffff55555555
#define	IES_NLE_STEXW_GOLDEN4	0x11115555aaaaffff

	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1
	setx	IES_NLE_STEXW_GOLDEN1,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	IES_NLE_STEXW_GOLDEN2,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	IES_NLE_STEXW_GOLDEN3,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	setx	IES_NLE_STEXW_GOLDEN4,	 %l0, %l2
	stxa	%l2,	[%l1] ASI_NUCLEUS_LE
	nop
	ldxa	[%l1] ASI_NUCLEUS_LE, 	%l3
	sub	%l2,	%l3,	%l4
	brnz,a	%l4,	diag_fail
	nop

	/*
	 * Store an double word 
	 */
tc_162:
#define	IES_NLE_STDW_GOLDEN1	0xaa55ffee
#define	IES_NLE_STDW_GOLDEN2	0x55aaeeff
#define	IES_NLE_STDW_GOLDEN3	0x1122ccbb
#define	IES_NLE_STDW_GOLDEN4	0x11223355

	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1
	set	IES_NLE_STDW_GOLDEN1,	 %l2
	set	IES_NLE_STDW_GOLDEN2,	 %l3
	stda	%l2,	[%l1] ASI_NUCLEUS_LE
	nop

	ldda	[%l1] ASI_NUCLEUS_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1
	set	IES_NLE_STDW_GOLDEN3,	 %l2
	set	IES_NLE_STDW_GOLDEN4,	 %l3
	stda	%l2,	[%l1] ASI_NUCLEUS_LE
	nop

	ldda	[%l1] ASI_NUCLEUS_LE, 	%l4
	sub	%l4,	%l2,	%l6
	brnz,a	%l6,	diag_fail
	nop
	sub	%l5,	%l3,	%l6
	brnz,a	%l6,	diag_fail
	nop

	/*
	 * changed back to USER privilege 
	 */
        ta      T_CHANGE_NONPRIV
        nop

!!----------------------------------------
!!      PRIV=0 load ASI=ASI_PRIM  IE=1 
!!		endianess reverted
!!----------------------------------------

        /* E=0 P=0 CTX=PRIM */
#define IES_APRIM_SB1_GOLDEN      0x11

        /*
         * Load signed byte
         */
tc_163:
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldsba   [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed half word
         */
#define IES_APRIM_SH1_GOLDEN      0xffffffffffffaa11
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed  word
         */
tc_164:
#define IES_APRIM_SW1_GOLDEN      0xffffffffeeddaa11
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldswa   [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         ****************************
         * Load unsigned byte
         ****************************
         */
tc_165:
#define IES_APRIM_USB1_GOLDEN     0x11
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        lduba   [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned half word
         */
#define IES_APRIM_UH1_GOLDEN      0xaa11
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        lduha   [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned  word
         */
#define IES_APRIM_UW1_GOLDEN      0xeeddaa11
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        lduwa   [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Extended word
         *****************************
         */
tc_166:
#define IES_APRIM_XA1_GOLDEN      0x65332211eeddaa11
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Double Word
         *****************************
         */
#define IES_APRIM_DDA_GOLDEN1     0xeeddaa11
#define IES_APRIM_DDA_GOLDEN2     0x65332211
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldda    [%l1] ASI_PRIM,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIM_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set     0x0,    %l0
        setx    IES_APRIM_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        /*
         *****************************************
         *      Testing more stores
         *****************************************
         */

tc_167:
        /*
         * Store a byte
         */
#define IES_APRIM_STB_GOLDEN1     0x77
#define IES_APRIM_STB_GOLDEN2     0xbb
#define IES_APRIM_STB_GOLDEN3     0xff
#define IES_APRIM_STB_GOLDEN4     0xa5

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIM_STB_GOLDEN1,    %l2
        stba    %l2,    [%l1] ASI_PRIM
        nop

        lduba   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_APRIM_STB_GOLDEN2,    %l2
        stba    %l2,    [%l1] ASI_PRIM
        nop
        lduba   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_APRIM_STB_GOLDEN3,    %l2
        stba    %l2,    [%l1] ASI_PRIM
        nop
        lduba   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_APRIM_STB_GOLDEN4,    %l2
        stba    %l2,    [%l1] ASI_PRIM
        nop
        lduba   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        /*
         * Store a half word
         */
tc_168:
#define IES_APRIM_STHW_GOLDEN1    0xaa55
#define IES_APRIM_STHW_GOLDEN2    0x55aa
#define IES_APRIM_STHW_GOLDEN3    0xffaa
#define IES_APRIM_STHW_GOLDEN4    0x33ff

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIM_STHW_GOLDEN1,   %l2
        stha    %l2,    [%l1] ASI_PRIM
        nop
        lduha   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIM_STHW_GOLDEN2,   %l2
        stha    %l2,    [%l1] ASI_PRIM
        nop
        lduha   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIM_STHW_GOLDEN3,   %l2
        stha    %l2,    [%l1] ASI_PRIM
        nop
        lduha   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop
        set     IES_APRIM_STHW_GOLDEN4,   %l2
        stha    %l2,    [%l1] ASI_PRIM
        nop
        lduha   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store a word
         */
tc_169:
#define IES_APRIM_STW_GOLDEN1     0xaa55ffee
#define IES_APRIM_STW_GOLDEN2     0x55aaeeff
#define IES_APRIM_STW_GOLDEN3     0xffffffff
#define IES_APRIM_STW_GOLDEN4     0x33005555

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIM_STW_GOLDEN1,    %l2
        stwa    %l2,    [%l1] ASI_PRIM
        nop
        lduwa   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIM_STW_GOLDEN2,    %l2
        stwa    %l2,    [%l1] ASI_PRIM
        nop
        lduwa   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIM_STW_GOLDEN3,    %l2
        stwa    %l2,    [%l1] ASI_PRIM
        nop
        lduwa   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIM_STW_GOLDEN4,    %l2
        stwa    %l2,    [%l1] ASI_PRIM
        nop
        lduwa   [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an extended word
         */
tc_170:
#define IES_APRIM_STEXW_GOLDEN1   0xaa55ffee55aaeeff
#define IES_APRIM_STEXW_GOLDEN2   0x55aaeeffaaff55ee
#define IES_APRIM_STEXW_GOLDEN3   0xffff0fff55555555
#define IES_APRIM_STEXW_GOLDEN4   0x33335505aaaaffff

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        setx    IES_APRIM_STEXW_GOLDEN1,   %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM
        nop
        ldxa    [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_APRIM_STEXW_GOLDEN2,   %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM
        nop
        ldxa    [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_APRIM_STEXW_GOLDEN3,   %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM
        nop
        ldxa    [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_APRIM_STEXW_GOLDEN4,   %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM
        nop
        ldxa    [%l1] ASI_PRIM,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an double word
         */
tc_171:
#define IES_APRIM_STDW_GOLDEN1    0xaa55ffee
#define IES_APRIM_STDW_GOLDEN2    0x55aaeeff
#define IES_APRIM_STDW_GOLDEN3    0xeeddaa11
#define IES_APRIM_STDW_GOLDEN4    0x65332211

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIM_STDW_GOLDEN1,    %l2
        set     IES_APRIM_STDW_GOLDEN2,    %l3
        stda    %l2,    [%l1] ASI_PRIM
        nop

        ldda    [%l1] ASI_PRIM,         %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIM_STDW_GOLDEN3,    %l2
        set     IES_APRIM_STDW_GOLDEN4,    %l3
        stda    %l2,    [%l1] ASI_PRIM
        nop

        ldda    [%l1] ASI_PRIM,         %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

!!----------------------------------------
!!      PRIV=0 load ASI=ASI_PRIM_LE
!!	IE=1, endianess reverted.
!!	   so, should be big endian
!!----------------------------------------

        /* E=0 P=0 CTX=PRIM  */
#define IES_APRIMLE_SB1_GOLDEN    0x11

        /*
         * Load signed byte
         */
tc_172:
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldsba   [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed half word
         */
#define IES_APRIMLE_SH1_GOLDEN    0x11aa
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldsha   [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed  word
         */
tc_173:
#define IES_APRIMLE_SW1_GOLDEN    0x11aaddee
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldswa   [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         ****************************
         * Load unsigned byte
         ****************************
         */
#define IES_APRIMLE_USB1_GOLDEN   0x11
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        lduba   [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned half word
         */
tc_174:
#define IES_APRIMLE_UH1_GOLDEN    0x11aa
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        lduha   [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned  word
         */
#define IES_APRIMLE_UW1_GOLDEN    0x11aaddee
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        lduwa   [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Extended word
         *****************************
         */
tc_175:
#define IES_APRIMLE_XA1_GOLDEN    0x11aaddee11223365
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldxa    [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Double Word
         *****************************
         */
#define IES_APRIMLE_DDA_GOLDEN1   0x11aaddee
#define IES_APRIMLE_DDA_GOLDEN2   0x11223365
        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        ldda    [%l1] ASI_PRIM_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_APRIMLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set     0x0,    %l0
        setx    IES_APRIMLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        /*
         *****************************************
         *      Testing more stores
         *****************************************
         */

        /*
         * Store a byte
         */
tc_176:
#define IES_APRIMLE_STB_GOLDEN1   0x77
#define IES_APRIMLE_STB_GOLDEN2   0xbb
#define IES_APRIMLE_STB_GOLDEN3   0xff
#define IES_APRIMLE_STB_GOLDEN4   0xa5

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIMLE_STB_GOLDEN1,  %l2
        stba    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduba   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        set     IES_APRIMLE_STB_GOLDEN2,  %l2
        stba    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduba   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_APRIMLE_STB_GOLDEN3,  %l2
        stba    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduba   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_APRIMLE_STB_GOLDEN4,  %l2
        stba    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduba   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        /*
         * Store a half word
         */
tc_177:
#define IES_APRIMLE_STHW_GOLDEN1  0xaa55
#define IES_APRIMLE_STHW_GOLDEN2  0x55aa
#define IES_APRIMLE_STHW_GOLDEN3  0xffaa
#define IES_APRIMLE_STHW_GOLDEN4  0x33ff

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIMLE_STHW_GOLDEN1, %l2
        stha    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduha   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIMLE_STHW_GOLDEN2, %l2
        stha    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduha   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIMLE_STHW_GOLDEN3, %l2
        stha    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduha   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop
        set     IES_APRIMLE_STHW_GOLDEN4, %l2
        stha    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduha   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store a word
         */
tc_178:
#define IES_APRIMLE_STW_GOLDEN1   0xaa55ffee
#define IES_APRIMLE_STW_GOLDEN2   0x55aaeeff
#define IES_APRIMLE_STW_GOLDEN3   0xffffffff
#define IES_APRIMLE_STW_GOLDEN4   0x33005555

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIMLE_STW_GOLDEN1,  %l2
        stwa    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduwa   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIMLE_STW_GOLDEN2,  %l2
        stwa    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduwa   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIMLE_STW_GOLDEN3,  %l2
        stwa    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduwa   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_APRIMLE_STW_GOLDEN4,  %l2
        stwa    %l2,    [%l1] ASI_PRIM_LE
        nop
        lduwa   [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an extended word
         */
tc_179:
#define IES_APRIMLE_STEXW_GOLDEN1 0xaa55ffee55aaeeff
#define IES_APRIMLE_STEXW_GOLDEN2 0x55aaeeffaaff55ee
#define IES_APRIMLE_STEXW_GOLDEN3 0xffff0fff55555555
#define IES_APRIMLE_STEXW_GOLDEN4 0x33335505aaaaffff

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        setx    IES_APRIMLE_STEXW_GOLDEN1,         %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM_LE
        nop
        ldxa    [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_APRIMLE_STEXW_GOLDEN2,         %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM_LE
        nop
        ldxa    [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_APRIMLE_STEXW_GOLDEN3,         %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM_LE
        nop
        ldxa    [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_APRIMLE_STEXW_GOLDEN4,         %l0, %l2
        stxa    %l2,    [%l1] ASI_PRIM_LE
        nop
        ldxa    [%l1] ASI_PRIM_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an double word
         */
tc_180:
#define IES_APRIMLE_STDW_GOLDEN1  0xaa55ffee
#define IES_APRIMLE_STDW_GOLDEN2  0x55aaeeff
#define IES_APRIMLE_STDW_GOLDEN3  0x11aaddee
#define IES_APRIMLE_STDW_GOLDEN4  0x11223365

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIMLE_STDW_GOLDEN1,  %l2
        set     IES_APRIMLE_STDW_GOLDEN2,  %l3
        stda    %l2,    [%l1] ASI_PRIM_LE
        nop

        ldda    [%l1] ASI_PRIM_LE,      %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

        set     0x0,    %l0
        setx    dexec_pg36_data, %l0, %l1
        set     IES_APRIMLE_STDW_GOLDEN3,  %l2
        set     IES_APRIMLE_STDW_GOLDEN4,  %l3
        stda    %l2,    [%l1] ASI_PRIM_LE
        nop

        ldda    [%l1] ASI_PRIM_LE,      %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

!!----------------------------------------
!!      PRIV=0 load ASI=ASI_SECN
!!	 IE = 1, endianess reverted
!!	 should be little endian
!!----------------------------------------

        /* E=0 P=0 CTX=SECN  */
#define IES_ASECN_SB1_GOLDEN      0xfffffffffffffffe

        /*
         * Load signed byte
         */
tc_181:
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldsba   [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed half word
         */
#define IES_ASECN_SH1_GOLDEN      0x22fe
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldsha   [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed  word
         */
tc_182:
#define IES_ASECN_SW1_GOLDEN      0xffffffffeeff22fe
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldswa   [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         ****************************
         * Load unsigned byte
         ****************************
         */
tc_183:
#define IES_ASECN_USB1_GOLDEN     0xfe
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        lduba   [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned half word
         */
#define IES_ASECN_UH1_GOLDEN      0x22fe
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        lduha   [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned  word
         */
tc_184:
#define IES_ASECN_UW1_GOLDEN      0xeeff22fe
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        lduwa   [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Extended word
         *****************************
         */
#define IES_ASECN_XA1_GOLDEN      0x75332211eeff22fe
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldxa    [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Double Word
         *****************************
         */
tc_185:
#define IES_ASECN_DDA_GOLDEN1     0xeeff22fe
#define IES_ASECN_DDA_GOLDEN2     0x75332211
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldda    [%l1] ASI_SECN,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECN_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set     0x0,    %l0
        setx    IES_ASECN_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        /*
         *****************************************
         *      Testing more stores
         *****************************************
         */

        /*
         * Store a byte
         */
tc_186:
#define IES_ASECN_STB_GOLDEN1     0xff
#define IES_ASECN_STB_GOLDEN2     0xaa
#define IES_ASECN_STB_GOLDEN3     0x55
#define IES_ASECN_STB_GOLDEN4     0x00

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECN_STB_GOLDEN1,    %l2
        stba    %l2,    [%l1] ASI_SECN
        nop
        lduba   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_ASECN_STB_GOLDEN2,    %l2
        stba    %l2,    [%l1] ASI_SECN
        nop
        lduba   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_ASECN_STB_GOLDEN3,    %l2
        stba    %l2,    [%l1] ASI_SECN
        nop
        lduba   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_ASECN_STB_GOLDEN4,    %l2
        stba    %l2,    [%l1] ASI_SECN
        nop
        lduba   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        /*
         * Store a half word
         */
tc_187:
#define IES_ASECN_STHW_GOLDEN1    0xaa55
#define IES_ASECN_STHW_GOLDEN2    0x55aa
#define IES_ASECN_STHW_GOLDEN3    0xffaa
#define IES_ASECN_STHW_GOLDEN4    0x77ee

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECN_STHW_GOLDEN1,   %l2
        stha    %l2,    [%l1] ASI_SECN
        nop
        lduha   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECN_STHW_GOLDEN2,   %l2
        stha    %l2,    [%l1] ASI_SECN
        nop
        lduha   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECN_STHW_GOLDEN3,   %l2
        stha    %l2,    [%l1] ASI_SECN
        nop
        lduha   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop
        set     IES_ASECN_STHW_GOLDEN4,   %l2
        stha    %l2,    [%l1] ASI_SECN
        nop
        lduha   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store a word
         */
tc_188:
#define IES_ASECN_STW_GOLDEN1     0xaa55ffee
#define IES_ASECN_STW_GOLDEN2     0x00055000
#define IES_ASECN_STW_GOLDEN3     0xffffffff
#define IES_ASECN_STW_GOLDEN4     0x33335555

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECN_STW_GOLDEN1,    %l2
        stwa    %l2,    [%l1] ASI_SECN
        nop
        lduwa   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECN_STW_GOLDEN2,    %l2
        stwa    %l2,    [%l1] ASI_SECN
        nop
        lduwa   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECN_STW_GOLDEN3,    %l2
        stwa    %l2,    [%l1] ASI_SECN
        nop
        lduwa   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECN_STW_GOLDEN4,    %l2
        stwa    %l2,    [%l1] ASI_SECN
        nop
        lduwa   [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an extended word
         */
tc_189:
#define IES_ASECN_STEXW_GOLDEN1   0xaa55ffee55aaeeff
#define IES_ASECN_STEXW_GOLDEN2   0x55aaeeffaaff55ee
#define IES_ASECN_STEXW_GOLDEN3   0xffffff00ff550055
#define IES_ASECN_STEXW_GOLDEN4   0x33335555aa0affff

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        setx    IES_ASECN_STEXW_GOLDEN1,   %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN
        nop
        ldxa    [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_ASECN_STEXW_GOLDEN2,   %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN
        nop
        ldxa    [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_ASECN_STEXW_GOLDEN3,   %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN
        nop
        ldxa    [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_ASECN_STEXW_GOLDEN4,   %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN
        nop
        ldxa    [%l1] ASI_SECN,         %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an double word
         */
tc_190:
#define IES_ASECN_STDW_GOLDEN1    0xaa55ffee
#define IES_ASECN_STDW_GOLDEN2    0x55aaeeff
#define IES_ASECN_STDW_GOLDEN3    0xeeff22fe
#define IES_ASECN_STDW_GOLDEN4    0x75332211

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECN_STDW_GOLDEN1,    %l2
        set     IES_ASECN_STDW_GOLDEN2,    %l3
        stda    %l2,    [%l1] ASI_SECN
        nop

        ldda    [%l1] ASI_SECN,         %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECN_STDW_GOLDEN3,    %l2
        set     IES_ASECN_STDW_GOLDEN4,    %l3
        stda    %l2,    [%l1] ASI_SECN
        nop

        ldda    [%l1] ASI_SECN,         %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

!!----------------------------------------
!!      PRIV=0 load ASI=ASI_SECN_LE
!!	IE = 1, endianess reverted
!!	  so, should be big endian
!!----------------------------------------

tc_191:
        /* E=0 P=0 CTX=SECN  */
#define IES_ASECNLE_SB1_GOLDEN    0xfffffffffffffffe

        /*
         * Load signed byte
         */
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldsba   [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_SB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed half word
         */
#define IES_ASECNLE_SH1_GOLDEN    0xfffffffffffffe22
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldsha   [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_SH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load signed  word
         */
tc_192:
#define IES_ASECNLE_SW1_GOLDEN    0xfffffffffe22ffee
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldswa   [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_SW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         ****************************
         * Load unsigned byte
         ****************************
         */
#define IES_ASECNLE_USB1_GOLDEN   0xfe
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        lduba   [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_USB1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned half word
         */
tc_193:
#define IES_ASECNLE_UH1_GOLDEN    0xfe22
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        lduha   [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_UH1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         * Load unsigned  word
         */
#define IES_ASECNLE_UW1_GOLDEN    0xfe22ffee
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        lduwa   [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_UW1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Extended word
         *****************************
         */
#define IES_ASECNLE_XA1_GOLDEN    0xfe22ffee11223375
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldxa    [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_XA1_GOLDEN, %l1, %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        /*
         *****************************
         *      Load Double Word
         *****************************
         */
tc_194:
#define IES_ASECNLE_DDA_GOLDEN1   0xfe22ffee
#define IES_ASECNLE_DDA_GOLDEN2   0x11223375
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        ldda    [%l1] ASI_SECN_LE,      %l2
        nop

        set     0x0,    %l0
        setx    IES_ASECNLE_DDA_GOLDEN1, %l1, %l5
        sub     %l2,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        set     0x0,    %l0
        setx    IES_ASECNLE_DDA_GOLDEN2, %l1, %l5
        sub     %l3,    %l5,    %l6
        brnz,a  %l6,    diag_fail

        /*
         *****************************************
         *      Testing more stores
         *****************************************
         */

        /*
         * Store a byte
         */
tc_195:
#define IES_ASECNLE_STB_GOLDEN1   0xff
#define IES_ASECNLE_STB_GOLDEN2   0xaa
#define IES_ASECNLE_STB_GOLDEN3   0x55
#define IES_ASECNLE_STB_GOLDEN4   0x00

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECNLE_STB_GOLDEN1,  %l2
        stba    %l2,    [%l1] ASI_SECN_LE
        nop
        lduba   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_ASECNLE_STB_GOLDEN2,  %l2
        stba    %l2,    [%l1] ASI_SECN_LE
        nop
        lduba   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_ASECNLE_STB_GOLDEN3,  %l2
        stba    %l2,    [%l1] ASI_SECN_LE
        nop
        lduba   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail

        set     IES_ASECNLE_STB_GOLDEN4,  %l2
        stba    %l2,    [%l1] ASI_SECN_LE
        nop
        lduba   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        /*
         * Store a half word
         */
tc_196:
#define IES_ASECNLE_STHW_GOLDEN1  0xaa55
#define IES_ASECNLE_STHW_GOLDEN2  0x55aa
#define IES_ASECNLE_STHW_GOLDEN3  0xffaa
#define IES_ASECNLE_STHW_GOLDEN4  0x77ee

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECNLE_STHW_GOLDEN1, %l2
        stha    %l2,    [%l1] ASI_SECN_LE
        nop
        lduha   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECNLE_STHW_GOLDEN2, %l2
        stha    %l2,    [%l1] ASI_SECN_LE
        nop
        lduha   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECNLE_STHW_GOLDEN3, %l2
        stha    %l2,    [%l1] ASI_SECN_LE
        nop
        lduha   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop
        set     IES_ASECNLE_STHW_GOLDEN4, %l2
        stha    %l2,    [%l1] ASI_SECN_LE
        nop
        lduha   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store a word
         */
tc_197:
#define IES_ASECNLE_STW_GOLDEN1   0xaa55ffee
#define IES_ASECNLE_STW_GOLDEN2   0x00055000
#define IES_ASECNLE_STW_GOLDEN3   0xffffffff
#define IES_ASECNLE_STW_GOLDEN4   0x33335555

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECNLE_STW_GOLDEN1,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
        nop
        lduwa   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECNLE_STW_GOLDEN2,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
        nop
        lduwa   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECNLE_STW_GOLDEN3,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
        nop
        lduwa   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        set     IES_ASECNLE_STW_GOLDEN4,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
        nop
        lduwa   [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an extended word
         */
tc_198:
#define IES_ASECNLE_STEXW_GOLDEN1 0xaa55ffee55aaeeff
#define IES_ASECNLE_STEXW_GOLDEN2 0x55aaeeffaaff55ee
#define IES_ASECNLE_STEXW_GOLDEN3 0xffffff00ff550055
#define IES_ASECNLE_STEXW_GOLDEN4 0x33335555aa0affff

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        setx    IES_ASECNLE_STEXW_GOLDEN1,         %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN_LE
        nop
        ldxa    [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_ASECNLE_STEXW_GOLDEN2,         %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN_LE
        nop
        ldxa    [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_ASECNLE_STEXW_GOLDEN3,         %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN_LE
        nop
        ldxa    [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        setx    IES_ASECNLE_STEXW_GOLDEN4,         %l0, %l2
        stxa    %l2,    [%l1] ASI_SECN_LE
        nop
        ldxa    [%l1] ASI_SECN_LE,      %l3
        sub     %l2,    %l3,    %l4
        brnz,a  %l4,    diag_fail
        nop

        /*
         * Store an double word
         */
tc_199:
#define IES_ASECNLE_STDW_GOLDEN1  0xaa55ffee
#define IES_ASECNLE_STDW_GOLDEN2  0x55aaeeff
#define IES_ASECNLE_STDW_GOLDEN3  0xfe22ffee
#define IES_ASECNLE_STDW_GOLDEN4  0x11223375

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECNLE_STDW_GOLDEN1,  %l2
        set     IES_ASECNLE_STDW_GOLDEN2,  %l3
        stda    %l2,    [%l1] ASI_SECN_LE
        nop

        ldda    [%l1] ASI_SECN_LE,      %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     IES_ASECNLE_STDW_GOLDEN3,  %l2
        set     IES_ASECNLE_STDW_GOLDEN4,  %l3
        stda    %l2,    [%l1] ASI_SECN_LE
        nop

        ldda    [%l1] ASI_SECN_LE,      %l4
        sub     %l4,    %l2,    %l6
        brnz,a  %l6,    diag_fail
        nop
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        nop

	add	%l7,	0x1,	%l7
	
	ba	chk_l7
	nop

/*
 ********************************
 *      Diag PASSED		*
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

/*
 *******************************************
 *	routine to restore the golden 
 *	values in the Memory 	
 *******************************************
 */
store_golden2pgs:
	save

	sub	%i0,	0x1,	%l0
	brz,a	%l0,	st_goldenNCLU
	nop

	sub	%i0,	0x2,	%l0
	brz,a	%l0,	st_goldenNCLU_LE
	nop

	sub	%i0,	0x3,	%l0
	brz,a	%l0,	st_goldenASIF_UPRIM
	nop

	sub	%i0,	0x4,	%l0
	brz,a	%l0,	st_goldenASIF_USECN
	nop

	sub	%i0,	0x5,	%l0
	brz,a	%l0,	st_goldenAIUPL
	nop

	sub	%i0,	0x6,	%l0
	brz,a	%l0,	st_goldenAIUSL
	nop

	sub	%i0,	0x7,	%l0
	brz,a	%l0,	st_goldenASI_PRIM
	nop

	sub	%i0,	0x8,	%l0
	brz,a	%l0,	st_goldenASI_SECN
	nop

	sub	%i0,	0x9,	%l0
	brz,a	%l0,	st_goldenASI_PRIM_LE
	nop

	sub	%i0,	0xa,	%l0
	brz,a	%l0,	st_goldenASI_SECN_LE
	nop

	ba	stgolden_rtn
	nop

st_goldenAIUSL:
	/*
	 ***************************************
	 * store the golden values for AIUS
	 ***************************************
 	 */
#define	AIUSL_PG2_GD1	0xaabbccdd
#define	AIUSL_PG2_GD2	0x99887766
#define	AIUSL_PG10_GD1	0x75aa55ff
#define	AIUSL_PG10_GD2	0x55ffaaff

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	AIUSL_PG2_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE
	add	%l1,	0x4,	%l1
	set	AIUSL_PG2_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	AIUSL_PG10_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE
	add	%l1,	0x4,	%l1
	set	AIUSL_PG10_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN_LE

	ba	stgolden_rtn
	nop

st_goldenASI_SECN:
        /*
         ***************************************
         * store the golden values for AIUS
         ***************************************
         */
#define ASISECN_PG2_GD1    0xaabbccdd
#define ASISECN_PG2_GD2    0x99ffffaa
#define ASISECN_PG10_GD1   0xffeeddcc
#define ASISECN_PG10_GD2   0x55aabb99
#define ASISECN_PG37_GD1   0xccddeeff
#define ASISECN_PG37_GD2   0x99bbaa55

        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        set     ASISECN_PG2_GD1,   %l2
        stwa    %l2,    [%l1] ASI_SECN
        add     %l1,    0x4,    %l1
        set     ASISECN_PG2_GD2,   %l2
        stwa    %l2,    [%l1] ASI_SECN

        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        set     ASISECN_PG10_GD1,  %l2
        stwa    %l2,    [%l1] ASI_SECN
        add     %l1,    0x4,    %l1
        set     ASISECN_PG10_GD2,  %l2
        stwa    %l2,    [%l1] ASI_SECN

#if LEPAGE_EN
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     ASISECN_PG37_GD1,  %l2
        stwa    %l2,    [%l1] ASI_SECN
        add     %l1,    0x4,    %l1
        set     ASISECN_PG37_GD2,  %l2
        stwa    %l2,    [%l1] ASI_SECN
#endif

        ba      stgolden_rtn
        nop

st_goldenASI_SECN_LE:
        /*
         ***************************************
         * store the golden values for AIUS
         ***************************************
         */
#define ASISECNLE_PG2_GD1    0xbaffcedf
#define ASISECNLE_PG2_GD2    0x99f7ffaa
#define ASISECNLE_PG10_GD1   0x5feeadcc
#define ASISECNLE_PG10_GD2   0x55aabb99
#define ASISECNLE_PG37_GD1   0xccddeeff
#define ASISECNLE_PG37_GD2   0x99bbaa55

        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        set     ASISECNLE_PG2_GD1,   %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
        add     %l1,    0x4,    %l1
        set     ASISECNLE_PG2_GD2,   %l2
        stwa    %l2,    [%l1] ASI_SECN_LE

        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        set     ASISECNLE_PG10_GD1,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
        add     %l1,    0x4,    %l1
        set     ASISECNLE_PG10_GD2,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE

#if LEPAGE_EN 
        set     0x0,    %l0
        setx    dexec_pg37_data, %l0, %l1
        set     ASISECNLE_PG37_GD1,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
        add     %l1,    0x4,    %l1
        set     ASISECNLE_PG37_GD2,  %l2
        stwa    %l2,    [%l1] ASI_SECN_LE
#endif

        ba      stgolden_rtn
        nop

st_goldenASIF_USECN:
	/*
	 ***************************************
	 * store the golden values for AIUS
	 ***************************************
 	 */
#define	AIUS_PG2_GD1	0xaabbccdd
#define	AIUS_PG2_GD2	0x99887766
#define	AIUS_PG10_GD1	0x75aa55ff
#define	AIUS_PG10_GD2	0x55ffaaff

	set	0x0,	%l0
	setx	dexec_pg2_data, %l0, %l1
	set	AIUS_PG2_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN
	add	%l1,	0x4,	%l1
	set	AIUS_PG2_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN

	set	0x0,	%l0
	setx	dexec_pg10_data, %l0, %l1
	set	AIUS_PG10_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN
	add	%l1,	0x4,	%l1
	set	AIUS_PG10_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_USECN

	ba	stgolden_rtn
	nop

st_goldenASIF_UPRIM:
	/*
	 ***************************************
	 * store the golden values for AIUP
	 ***************************************
 	 */
#define	AIUP_PG1_GD1	0xf5223384
#define	AIUP_PG1_GD2	0xff0011ff
#define	AIUP_PG9_GD1	0xaaffff55
#define	AIUP_PG9_GD2	0x55ffaaff

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUP_PG1_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM
	add	%l1,	0x4,	%l1
	set	AIUP_PG1_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	AIUP_PG9_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM
	add	%l1,	0x4,	%l1
	set	AIUP_PG9_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM

	ba	stgolden_rtn
	nop

st_goldenASI_PRIM:
	/*
	 ***************************************
	 * store the golden values for AIUP
	 ***************************************
 	 */
#define	APRIM_PG1_GD1	0xffaa5577
#define	APRIM_PG1_GD2	0x0000ffff
#define	APRIM_PG9_GD1	0xaaffff55
#define	APRIM_PG9_GD2	0x55764399
#define	APRIM_PG36_GD1	0x55ffffaa
#define	APRIM_PG36_GD2	0x99437655

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	APRIM_PG1_GD1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
	add	%l1,	0x4,	%l1
	set	APRIM_PG1_GD2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	APRIM_PG9_GD1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
	add	%l1,	0x4,	%l1
	set	APRIM_PG9_GD2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
#if LEPAGE_EN
	set	0x0,	%l0
	setx	dexec_pg36_data, %l0, %l1
	set	APRIM_PG36_GD1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
	add	%l1,	0x4,	%l1
	set	APRIM_PG36_GD2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM
#endif

	ba	stgolden_rtn
	nop

st_goldenASI_PRIM_LE:
	/*
	 ***************************************
	 * store the golden values for AIUP
	 ***************************************
 	 */
#define	APRIMLE_PG1_GD1	0xffaa5577
#define	APRIMLE_PG1_GD2	0x7700ffff
#define	APRIMLE_PG9_GD1	0xaaf0ff55
#define	APRIMLE_PG9_GD2	0x55764399
#define	APRIMLE_PG36_GD1  0x55ffffaa
#define	APRIMLE_PG36_GD2  0x99437655

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	APRIMLE_PG1_GD1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
	add	%l1,	0x4,	%l1
	set	APRIMLE_PG1_GD2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	APRIMLE_PG9_GD1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
	add	%l1,	0x4,	%l1
	set	APRIMLE_PG9_GD2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE

#if LEPAGE_EN
	set	0x0,	%l0
	setx	dexec_pg36_data, %l0, %l1
	set	APRIMLE_PG36_GD1,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
	add	%l1,	0x4,	%l1
	set	APRIMLE_PG36_GD2,	%l2
	stwa	%l2,	[%l1] ASI_PRIM_LE
#endif

	ba	stgolden_rtn
	nop

st_goldenAIUPL:
	/*
	 ***************************************
	 * store the golden values for AIUP
	 ***************************************
 	 */
#define	AIUPL_PG1_GD1	0xf5223384
#define	AIUPL_PG1_GD2	0xff0011ff
#define	AIUPL_PG9_GD1	0xaaffff55
#define	AIUPL_PG9_GD2	0x55ffaaff

	set	0x0,	%l0
	setx	dexec_pg1_data, %l0, %l1
	set	AIUPL_PG1_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	add	%l1,	0x4,	%l1
	set	AIUPL_PG1_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE

	set	0x0,	%l0
	setx	dexec_pg9_data, %l0, %l1
	set	AIUPL_PG9_GD1,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE
	add	%l1,	0x4,	%l1
	set	AIUPL_PG9_GD2,	%l2
	stwa	%l2,	[%l1] ASI_ASIF_UPRIM_LE

	ba	stgolden_rtn
	nop

st_goldenNCLU:
	/*
	 ***************************************
	 * store the golden values for NUCLEUS 
	 ***************************************
 	 */
#define	N_DMMU_PG25_GD1	0x81223384
#define	N_DMMU_PG25_GD2	0x11223355
#define	N_DMMU_PG26_GD1	0x77aa3344
#define	N_DMMU_PG26_GD2	0x11223355
#define	N_DMMU_PG27_GD1	0xaa223344
#define	N_DMMU_PG27_GD2	0x55aaff11
#define	N_DMMU_PG28_GD1	0xaa223344
#define	N_DMMU_PG28_GD2	0x55aaff11
#define	N_DMMU_PG35_GD1	0x443322aa
#define	N_DMMU_PG35_GD2	0x11ffaa55

	set	0x0,	%l0
	setx	dexec_pg25_data, %l0, %l1
	set	N_DMMU_PG25_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	add	%l1,	0x4,	%l1
	set	N_DMMU_PG25_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS

	set	0x0,	%l0
	setx	dexec_pg26_data, %l0, %l1
	set	N_DMMU_PG26_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	add	%l1,	0x4,	%l1
	set	N_DMMU_PG26_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS

	set	0x0,	%l0
	setx	dexec_pg27_data, %l0, %l1
	set	N_DMMU_PG27_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	add	%l1,	0x4,	%l1
	set	N_DMMU_PG27_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	N_DMMU_PG28_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	add	%l1,	0x4,	%l1
	set	N_DMMU_PG28_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS

#if LEPAGE_EN
	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1
	set	N_DMMU_PG35_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
	add	%l1,	0x4,	%l1
	set	N_DMMU_PG35_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS
#endif

	ba	stgolden_rtn
	nop

st_goldenNCLU_LE:
	/*
	 ***************************************
	 * store the golden values for NUCLEUS 
	 ***************************************
 	 */
#define	NLE_DMMU_PG25_GD1	0x81223384
#define	NLE_DMMU_PG25_GD2	0x11223355
#define	NLE_DMMU_PG26_GD1	0x77aa3344
#define	NLE_DMMU_PG26_GD2	0x11223355
#define	NLE_DMMU_PG27_GD1	0xaa223344
#define	NLE_DMMU_PG27_GD2	0x55aaff11
#define	NLE_DMMU_PG28_GD1	0xaa223344
#define	NLE_DMMU_PG28_GD2	0x55aaff11
#define	NLE_DMMU_PG35_GD1	0x443322aa
#define	NLE_DMMU_PG35_GD2	0x11ffaa55

	set	0x0,	%l0
	setx	dexec_pg25_data, %l0, %l1
	set	NLE_DMMU_PG25_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	add	%l1,	0x4,	%l1
	set	NLE_DMMU_PG25_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE

	set	0x0,	%l0
	setx	dexec_pg26_data, %l0, %l1
	set	NLE_DMMU_PG26_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	add	%l1,	0x4,	%l1
	set	NLE_DMMU_PG26_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE

	set	0x0,	%l0
	setx	dexec_pg27_data, %l0, %l1
	set	NLE_DMMU_PG27_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	add	%l1,	0x4,	%l1
	set	NLE_DMMU_PG27_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE

	set	0x0,	%l0
	setx	dexec_pg28_data, %l0, %l1
	set	NLE_DMMU_PG28_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	add	%l1,	0x4,	%l1
	set	NLE_DMMU_PG28_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE

#if LEPAGE_EN
	set	0x0,	%l0
	setx	dexec_pg35_data, %l0, %l1
	set	NLE_DMMU_PG35_GD1,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
	add	%l1,	0x4,	%l1
	set	NLE_DMMU_PG35_GD2,	%l2
	stwa	%l2,	[%l1] ASI_NUCLEUS_LE
#endif

stgolden_rtn:
	restore
	retl
	nop

/*
 ***************************************************
 * Pages defined to test out the MMU access traps
 ***************************************************
 */

!!-------------------------------
!!	P=0 E=0 ASI=PRIM  
!!-------------------------------
#define DEXEC_PG1_BASE_DATA_ADDR        0x250000
#define DEXEC_PG1_BASE_DATA_ADDR_PA     0x100250000

SECTION .DEXEC_PG1 DATA_VA=DEXEC_PG1_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG1,
        VA=DEXEC_PG1_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG1_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG1_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg1_data

dexec_pg1_data: .word   0x10000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	P=0 E=0 ASI=SEC
!!-------------------------------
#define DEXEC_PG2_BASE_DATA_ADDR        0x258000
#define DEXEC_PG2_BASE_DATA_ADDR_PA     0x100258000

SECTION .DEXEC_PG2 DATA_VA=DEXEC_PG2_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG2,
        VA=DEXEC_PG2_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG2_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG2_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg2_data

dexec_pg2_data: .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	P=0 E=0 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG3_BASE_DATA_ADDR        0x260000
#define DEXEC_PG3_BASE_DATA_ADDR_PA     0x100260000

SECTION .DEXEC_PG3 DATA_VA=DEXEC_PG3_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG3,
        VA=DEXEC_PG3_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG3_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG3_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.data

.global  dexec_pg3_data

dexec_pg3_data: .word   0xffaa5577
                .word   0x789affff
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=0 ASI=SEC_NF
!!-------------------------------
#define DEXEC_PG4_BASE_DATA_ADDR        0x268000
#define DEXEC_PG4_BASE_DATA_ADDR_PA     0x100268000

SECTION .DEXEC_PG4 DATA_VA=DEXEC_PG4_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG4,
        VA=DEXEC_PG4_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG4_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG4_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.data

.global  dexec_pg4_data

dexec_pg4_data: .word   0xbbcceeff
                .word   0x778899aa
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=0 ASI=PRIM  
!!-------------------------------
#define DEXEC_PG5_BASE_DATA_ADDR        0x270000
#define DEXEC_PG5_BASE_DATA_ADDR_PA     0x100270000

SECTION .DEXEC_PG5 DATA_VA=DEXEC_PG5_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG5,
        VA=DEXEC_PG5_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG5_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG5_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg5_data

dexec_pg5_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=0 ASI=SEC
!!-------------------------------
#define DEXEC_PG6_BASE_DATA_ADDR        0x278000
#define DEXEC_PG6_BASE_DATA_ADDR_PA     0x100278000

SECTION .DEXEC_PG6 DATA_VA=DEXEC_PG6_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG6,
        VA=DEXEC_PG6_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG6_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG6_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg6_data

dexec_pg6_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=0 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG7_BASE_DATA_ADDR        0x280000
#define DEXEC_PG7_BASE_DATA_ADDR_PA     0x100280000

SECTION .DEXEC_PG7 DATA_VA=DEXEC_PG7_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG7,
        VA=DEXEC_PG7_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG7_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG7_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg7_data

dexec_pg7_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=0 ASI=SEC_NF
!!-------------------------------
#define DEXEC_PG8_BASE_DATA_ADDR        0x288000
#define DEXEC_PG8_BASE_DATA_ADDR_PA     0x100288000

SECTION .DEXEC_PG8 DATA_VA=DEXEC_PG8_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG8,
        VA=DEXEC_PG8_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG8_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG8_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg8_data

dexec_pg8_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=1 ASI=PRIM  
!!-------------------------------
#define DEXEC_PG9_BASE_DATA_ADDR        0x290000
#define DEXEC_PG9_BASE_DATA_ADDR_PA     0x100290000

SECTION .DEXEC_PG9 DATA_VA=DEXEC_PG9_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG9,
        VA=DEXEC_PG9_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG9_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG9_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg9_data

dexec_pg9_data: .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	P=0 E=1 ASI=SEC
!!-------------------------------
#define DEXEC_PG10_BASE_DATA_ADDR        0x298000
#define DEXEC_PG10_BASE_DATA_ADDR_PA     0x100298000

SECTION .DEXEC_PG10 DATA_VA=DEXEC_PG10_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG10,
        VA=DEXEC_PG10_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG10_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG10_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg10_data

dexec_pg10_data: 
		.word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	P=0 E=1 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG11_BASE_DATA_ADDR        0x2a0000
#define DEXEC_PG11_BASE_DATA_ADDR_PA     0x1002a0000

SECTION .DEXEC_PG11 DATA_VA=DEXEC_PG11_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG11,
        VA=DEXEC_PG11_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG11_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG11_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
        }

.data

.global  dexec_pg11_data

dexec_pg11_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=1 ASI=SEC_NF
!!-------------------------------
#define DEXEC_PG12_BASE_DATA_ADDR        0x2a8000
#define DEXEC_PG12_BASE_DATA_ADDR_PA     0x1002a8000

SECTION .DEXEC_PG12 DATA_VA=DEXEC_PG12_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG12,
        VA=DEXEC_PG12_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG12_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG12_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
        }

.data

.global  dexec_pg12_data

dexec_pg12_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=1 ASI=PRIM  
!!-------------------------------
#define DEXEC_PG13_BASE_DATA_ADDR        0x2b0000
#define DEXEC_PG13_BASE_DATA_ADDR_PA     0x1002b0000

SECTION .DEXEC_PG13 DATA_VA=DEXEC_PG13_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG13,
        VA=DEXEC_PG13_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG13_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG13_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg13_data

dexec_pg13_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=1 ASI=SEC
!!-------------------------------
#define DEXEC_PG14_BASE_DATA_ADDR        0x2b8000
#define DEXEC_PG14_BASE_DATA_ADDR_PA     0x1002b8000

SECTION .DEXEC_PG14 DATA_VA=DEXEC_PG14_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG14,
        VA=DEXEC_PG14_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG14_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG14_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg14_data

dexec_pg14_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=1 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG15_BASE_DATA_ADDR        0x2c0000
#define DEXEC_PG15_BASE_DATA_ADDR_PA     0x1002c0000

SECTION .DEXEC_PG15 DATA_VA=DEXEC_PG15_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG15,
        VA=DEXEC_PG15_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG15_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG15_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg15_data

dexec_pg15_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=1 ASI=SEC_NF
!!-------------------------------
#define DEXEC_PG16_BASE_DATA_ADDR        0x2c8000
#define DEXEC_PG16_BASE_DATA_ADDR_PA     0x1002c8000

SECTION .DEXEC_PG16 DATA_VA=DEXEC_PG16_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG16,
        VA=DEXEC_PG16_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG16_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG16_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
        }

.data

.global  dexec_pg16_data

dexec_pg16_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=1 E=1 ASI=PRIM  
!!-------------------------------
#define DEXEC_PG17_BASE_DATA_ADDR        0x2d0000
#define DEXEC_PG17_BASE_DATA_ADDR_PA     0x1002d0000

SECTION .DEXEC_PG17 DATA_VA=DEXEC_PG17_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG17,
        VA=DEXEC_PG17_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG17_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG17_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg17_data

dexec_pg17_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=1 E=1 ASI=SEC
!!-------------------------------
#define DEXEC_PG18_BASE_DATA_ADDR        0x2d8000
#define DEXEC_PG18_BASE_DATA_ADDR_PA     0x1002d8000

SECTION .DEXEC_PG18 DATA_VA=DEXEC_PG18_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG18,
        VA=DEXEC_PG18_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG18_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG18_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg18_data

dexec_pg18_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=0 E=1 
!!-------------------------------
#define DEXEC_PG19_BASE_DATA_ADDR        0x2e0000
#define DEXEC_PG19_BASE_DATA_ADDR_PA     0x1002e0000

SECTION .DEXEC_PG19 DATA_VA=DEXEC_PG19_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG19,
        VA=DEXEC_PG19_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG19_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG19_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg19_data

dexec_pg19_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=0 E=1 
!!-------------------------------
#define DEXEC_PG20_BASE_DATA_ADDR        0x2e8000
#define DEXEC_PG20_BASE_DATA_ADDR_PA     0x1002e8000

SECTION .DEXEC_PG20 DATA_VA=DEXEC_PG20_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG20,
        VA=DEXEC_PG20_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG20_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG20_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg20_data

dexec_pg20_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=1 E=0 
!!-------------------------------
#define DEXEC_PG21_BASE_DATA_ADDR        0x2f0000
#define DEXEC_PG21_BASE_DATA_ADDR_PA     0x1002f0000

SECTION .DEXEC_PG21 DATA_VA=DEXEC_PG21_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG21,
        VA=DEXEC_PG21_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG21_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG21_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg21_data

dexec_pg21_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=1 E=0 
!!-------------------------------
#define DEXEC_PG22_BASE_DATA_ADDR        0x2f8000
#define DEXEC_PG22_BASE_DATA_ADDR_PA     0x1002f8000

SECTION .DEXEC_PG22 DATA_VA=DEXEC_PG22_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG22,
        VA=DEXEC_PG22_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG22_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG22_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg22_data

dexec_pg22_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=0 E=0 
!!-------------------------------
#define DEXEC_PG23_BASE_DATA_ADDR        0x300000
#define DEXEC_PG23_BASE_DATA_ADDR_PA     0x100300000

SECTION .DEXEC_PG23 DATA_VA=DEXEC_PG23_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG23,
        VA=DEXEC_PG23_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG23_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG23_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg23_data

dexec_pg23_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=0 E=0 
!!-------------------------------
#define DEXEC_PG24_BASE_DATA_ADDR        0x308000
#define DEXEC_PG24_BASE_DATA_ADDR_PA     0x100308000

SECTION .DEXEC_PG24 DATA_VA=DEXEC_PG24_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG24,
        VA=DEXEC_PG24_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG24_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG24_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg24_data

dexec_pg24_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=0 E=0 
!!-------------------------------
#define DEXEC_PG25_BASE_DATA_ADDR        0x310000
#define DEXEC_PG25_BASE_DATA_ADDR_PA     0x100310000

SECTION .DEXEC_PG25 DATA_VA=DEXEC_PG25_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG25,
        VA=DEXEC_PG25_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG25_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG25_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg25_data

dexec_pg25_data: .word  0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	CONTEXT=NUC P=1 E=0 
!!-------------------------------
#define DEXEC_PG26_BASE_DATA_ADDR        0x318000
#define DEXEC_PG26_BASE_DATA_ADDR_PA     0x100318000

SECTION .DEXEC_PG26 DATA_VA=DEXEC_PG26_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG26,
        VA=DEXEC_PG26_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG26_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG26_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg26_data

dexec_pg26_data: .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	CONTEXT=NUC P=0 E=1 
!!-------------------------------
#define DEXEC_PG27_BASE_DATA_ADDR        0x320000
#define DEXEC_PG27_BASE_DATA_ADDR_PA     0x100320000

SECTION .DEXEC_PG27 DATA_VA=DEXEC_PG27_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG27,
        VA=DEXEC_PG27_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG27_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG27_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg27_data

dexec_pg27_data: .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	CONTEXT=NUC P=1 E=1 
!!-------------------------------
#define DEXEC_PG28_BASE_DATA_ADDR        0x328000
#define DEXEC_PG28_BASE_DATA_ADDR_PA     0x100328000

SECTION .DEXEC_PG28 DATA_VA=DEXEC_PG28_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG28,
        VA=DEXEC_PG28_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG28_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG28_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg28_data

dexec_pg28_data: .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000
.end

!!-------------------------------
!!	CONTEXT=NUC P=0 E=0 W=1 
!!-------------------------------
#define DEXEC_PG29_BASE_DATA_ADDR        0x330000
#define DEXEC_PG29_BASE_DATA_ADDR_PA     0x100330000

SECTION .DEXEC_PG29 DATA_VA=DEXEC_PG29_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG29,
        VA=DEXEC_PG29_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG29_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG29_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg29_data

dexec_pg29_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=1 E=0 W=1 
!!-------------------------------
#define DEXEC_PG30_BASE_DATA_ADDR        0x338000
#define DEXEC_PG30_BASE_DATA_ADDR_PA     0x100338000

SECTION .DEXEC_PG30 DATA_VA=DEXEC_PG30_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG30,
        VA=DEXEC_PG30_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG30_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG30_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg30_data

dexec_pg30_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=0 E=1 W=1 
!!-------------------------------
#define DEXEC_PG31_BASE_DATA_ADDR        0x340000
#define DEXEC_PG31_BASE_DATA_ADDR_PA     0x100340000

SECTION .DEXEC_PG31 DATA_VA=DEXEC_PG31_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG31,
        VA=DEXEC_PG31_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG31_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG31_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg31_data

dexec_pg31_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=1 E=1 W=1 
!!-------------------------------
#define DEXEC_PG32_BASE_DATA_ADDR        0x348000
#define DEXEC_PG32_BASE_DATA_ADDR_PA     0x100348000

SECTION .DEXEC_PG32 DATA_VA=DEXEC_PG32_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG32,
        VA=DEXEC_PG32_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG32_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG32_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=1
        }

.data

.global  dexec_pg32_data

dexec_pg32_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=0 E=0 
!!-------------------------------
#define DEXEC_PG33_BASE_DATA_ADDR        0x350000
#define DEXEC_PG33_BASE_DATA_ADDR_PA     0x100350000

SECTION .DEXEC_PG33 DATA_VA=DEXEC_PG33_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG33,
        VA=DEXEC_PG33_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG33_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG33_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg33_data

dexec_pg33_data: .word  0xaaeeff55
                .word   0x56789abc
                .word   0xef012345
                .word   0x6789abcd
.end

!!-------------------------------
!!	W=1 P=0 E=0 
!!-------------------------------
#define DEXEC_PG34_BASE_DATA_ADDR        0x358000
#define DEXEC_PG34_BASE_DATA_ADDR_PA     0x100358000

SECTION .DEXEC_PG34 DATA_VA=DEXEC_PG34_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG34,
        VA=DEXEC_PG34_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG34_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG34_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg34_data

dexec_pg34_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	W=1 P=0 E=0 
!!-------------------------------
#define DEXEC_PG35_BASE_DATA_ADDR        0x360000
#define DEXEC_PG35_BASE_DATA_ADDR_PA     0x100360000

SECTION .DEXEC_PG35 DATA_VA=DEXEC_PG35_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG35,
        VA=DEXEC_PG35_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG35_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG35_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=1, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg35_data

dexec_pg35_data: .byte  0x11
		 .byte	0x22
		 .byte	0xcc
		 .byte	0xbb
		 .byte	0x11
		 .byte	0x22
		 .byte	0x33
		 .byte	0x55
                 .word  0x11223366
                 .word  0x11223377
.end

!!-------------------------------
!!	W=1 P=0 E=0 
!!-------------------------------
#define DEXEC_PG36_BASE_DATA_ADDR        0x368000
#define DEXEC_PG36_BASE_DATA_ADDR_PA     0x100368000

SECTION .DEXEC_PG36 DATA_VA=DEXEC_PG36_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG36,
        VA=DEXEC_PG36_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG36_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG36_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=1, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg36_data

dexec_pg36_data: .byte  0x11
		 .byte	0xaa
		 .byte	0xdd
		 .byte	0xee
		 .byte	0x11
		 .byte	0x22
		 .byte	0x33
		 .byte	0x65
                 .word   0x11223366
                 .word   0x11223377
.end


!!-------------------------------
!!	W=1 P=0 E=0 
!!-------------------------------
#define DEXEC_PG37_BASE_DATA_ADDR        0x370000
#define DEXEC_PG37_BASE_DATA_ADDR_PA     0x100370000

SECTION .DEXEC_PG37 DATA_VA=DEXEC_PG37_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG37,
        VA=DEXEC_PG37_BASE_DATA_ADDR, PA=ra2pa(DEXEC_PG37_BASE_DATA_ADDR_PA,0),
        RA=DEXEC_PG37_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=1, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dexec_pg37_data

dexec_pg37_data: .byte  0xfe
		 .byte	0x22
		 .byte	0xff
		 .byte	0xee
		 .byte	0x11
		 .byte	0x22
		 .byte	0x33
		 .byte	0x75
                 .word   0x11223376
                 .word   0x11223377
.end

