// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dmmu_dexcp.s
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
!!			test all the MMU traps
!!
!!-------------------------------------------------------------------------------
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Reserved_0x3f	real_txlate_miss_handler

#include "boot.s"

.text
.global main

#define FLUSH_FIXED	0	/* RTL will not support the FLUSH exceptions */
#define NFO_FIXED	1	
#define SFSR 		1
#define LOAD_ON		1 	/* need to turn it on for final version */
#define STORE_ON	1	/* need to turn it on for final version */
#define SAS_FIXED 	1	/* need to turn it on for final version */

main:


#if FLUSH_FIXED
/*
 *******************************************
 *      Flush  PRIV=0
 *******************************************
 */
        /* E=0 P=0 */
        /* this is like a nop */
        set     0x0,    %l0
        setx    dexec_pg33_text, %l0, %l1

        flush   %l1
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=0 P=1 */
        set     0x0,    %l0
        setx    dexec_pg34_text, %l0, %l1

        flush   %l1
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=0 */
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1

        flush   %l1
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=1 */
        set     0x0,    %l0
        setx    dexec_pg13_data, %l0, %l1

        flush   %l1
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

/*
 *******************************************
 *      Flush  PRIV=1
 *******************************************
 */
	ta	T_CHANGE_PRIV
	nop


        /* E=0 P=0 */
        /* this is like a nop */
        set     0x0,    %l0
        setx    dexec_pg29_data, %l0, %l1

        flush   %l1
        nop

        /* E=0 P=1 */
        set     0x0,    %l0
        setx    dexec_pg30_data, %l0, %l1

        flush   %l1
        nop

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=0 */
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1

        flush   %l1
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=1 */
        set     0x0,    %l0
        setx    dexec_pg13_data, %l0, %l1

        flush   %l1
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

	ta	T_CHANGE_NONPRIV
	nop
#endif

#if LOAD_ON
/*
 *************************************************
 *  Data access exception trap
 *      load: PRIV=0
 *************************************************
 */
!!--------------------------------------------------------------------
!!	P=0 E=0 ASI=PRIM, SEC, PRIM_NF, SEC_NF, should not cause trap
!!--------------------------------------------------------------------
test_case1:
	/* ASI = PRIM */
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        lduwa   [%l1] 0x80,      %l2		/* PRIM TLB DMISS */ 
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

test_case2:
	/* ASI = SEC */
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2		/* SEC TLB DMISS */
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

test_case3:
	/* ASI = PRIM_NF */
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2		/* PRIM_NF TLB DMISS */
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

test_case4:
	/* ASI = SEC_NF */
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2		/* SEC_NF TLB DMISS */
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

!!-------------------------------
!!	P=1 E=0 ASI=PRIM  
!!-------------------------------
	ta	T_CHANGE_HPRIV
	nop

	/* set 0 to DMMU SFSR */
	set	0x18,	%l0
	stxa	%g0,	[%l0] 0x58

	ta	T_CHANGE_NONHPRIV
	nop

test_case5:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
    
        set     0x0,    %l0
        setx    dexec_pg5_data, %l0, %l1
        lduwa   [%l1] 0x80,  %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
	call chk_sfsr
	nop
#endif

test_case7:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
    
        set     0x0,    %l0
        setx    dexec_pg7_data, %l0, %l1
	/* 
	 * use ASI other than NF ASI to access a page with NF=1 
	 */
        lduwa   [%l1] 0x80,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR 
	ta	T_CHANGE_HPRIV
	nop

#define	DMMU_SFSR_VALUE2	0x800803
#define	DMMU_SFAR_VALUE2	0x280000

	/* read the DMMU SFSR */
	set	0x0,	%l0
	set	0x18,	%l1
	ldxa	[%l1] 0x58,	%l2	
	nop

	/* read the DMMU SFAR address */
	set	0x0,	%l0
	set	0x20,	%l1
	ldxa	[%l1] 0x58,	%l2	
	nop

	/* clear the DMMU SFSR reg */
	/* set 0 to DMMU SFSR */
	set	0x18,	%l0
	stxa	%g0,	[%l0] 0x58

	ta	T_CHANGE_NONHPRIV
	nop

	nop;nop;nop;nop;nop;
#endif

	/* 
	 ************************************************
	 * VA out of range FAULT :
	 *	
	 *	Based on Ultra-SPARC-II spec : 
	 *		( user manual : pg 238 )
	 *
	 ************************************************
	 */
#define	VA_OUTOF_RANGE1	0x80000000000
#define	VA_OUTOF_RANGE2	0x81000000000
#define	VA_OUTOF_RANGE3	0xfffff7ffffffffff
#define	VA_OUTOF_RANGE4	0xffff07ffffffffff

!!-------------------------------
!!	P=1 E=0 ASI=SEC
!!-------------------------------
test_case8:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
     
        set     0x0,    %l0
        setx    dexec_pg6_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
	call chk_sfsr
	nop
#endif

!!-------------------------------
!!	P=1 E=0 ASI=PRIM_NF
!!-------------------------------
test_case9:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
      
        set     0x0,    %l0
        setx    dexec_pg7_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
	call chk_sfsr
	nop
#endif

!!-------------------------------
!!	P=1 E=0 ASI=SEC_NF
!!-------------------------------
test_case10:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg8_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
	call chk_sfsr
	nop
#endif

!!-------------------------------
!!	P=0 E=1 ASI=PRIM  
!!-------------------------------
test_case11:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduwa   [%l1] 0x80,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if 0
	call chk_sfsr
	nop
#endif

!!-------------------------------
!!	P=0 E=1 ASI=SEC
!!-------------------------------
test_case12:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if 0
        call chk_sfsr
        nop
#endif

#if NFO_FIXED
!!-------------------------------
!!	P=0 E=1 ASI=PRIM_NF
!!-------------------------------
test_case13:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg11_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

!!-------------------------------
!!	P=0 E=1 ASI=SEC_NF
!!-------------------------------
test_case14:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg12_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

#endif

!!-------------------------------
!!	P=1 E=1 ASI=PRIM  
!!-------------------------------
test_case15:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg13_data, %l0, %l1
        lduwa   [%l1] 0x80,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

!!-------------------------------
!!	P=1 E=1 ASI=SEC
!!-------------------------------
test_case16:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg14_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

#if NFO_FIXED	/* MMU : NFO error when write TTE */
!!-------------------------------
!!	P=1 E=1 ASI=PRIM_NF
!!-------------------------------
test_case17:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg15_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

!!-------------------------------
!!	P=1 E=1 ASI=SEC_NF
!!-------------------------------
test_case18:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg16_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

#endif
/*
 *************************************************
 *  Data access exception trap
 *      load: PRIV=1
 *************************************************
 */
        ta      T_CHANGE_PRIV
        nop

!!--------------------------------------------------------------------
!!	P=0 E=0 ASI=PRIM, SEC, PRIM_NF, SEC_NF, should not cause trap
!!--------------------------------------------------------------------
tc_18:
	/* ASI = PRIM */
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        lduwa   [%l1] 0x80,      %l2		
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

	/* ASI = SEC */
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2		
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

	/* ASI = PRIM_NF */
        set     0x0,    %l0
        setx    dexec_pg3_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2		
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

	/* ASI = SEC_NF */
        set     0x0,    %l0
        setx    dexec_pg4_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2		
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

test_asif_uprim:
	/* ASI = ASIF_USER_PRIM */
        set     0x0,    %l0
        setx    dexec_pg1_data, %l0, %l1
        lduwa   [%l1] 0x10,      %l2		
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

	/* ASI = ASIF_USER_SEC */
        set     0x0,    %l0
        setx    dexec_pg2_data, %l0, %l1
        lduwa   [%l1] 0x11,      %l2		
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

!!-------------------------------
!!	P=1 E=0 ASI=PRIM  
!!-------------------------------
tc_19:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
    
        mov     0x0,    %l0
	mov	0x0,	%l2
        setx    dexec_pg5_data, %l0, %l1
        lduwa   [%l1] 0x80,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

!!-------------------------------
!!	P=1 E=0 ASI=SEC
!!-------------------------------
tc_20:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
     
        mov     0x0,    %l0
        mov     0x0,    %l2
        setx    dexec_pg6_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2
        nop
        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

!!-------------------------------
!!	P=1 E=0 ASI=PRIM_NF
!!-------------------------------
tc_21:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
      
        set     0x0,    %l0
        setx    dexec_pg7_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

!!-------------------------------
!!	P=1 E=0 ASI=SEC_NF
!!-------------------------------
tc_22:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        mov     0x0,    %l0
	mov	0x0,	%l2
        setx    dexec_pg8_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

!!-------------------------------
!!	P=1 E=0 ASI=ASIF_U_PRIM
!!-------------------------------
tc_23:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg5_data, %l0, %l1
        lduwa   [%l1] 0x10,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop

	ta	T_CHANGE_PRIV
	nop
#endif

!!-----------------------------------
!!	P=1 E=0 ASI=ASIF_U_SECOND
!!-----------------------------------
tc_24:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg6_data, %l0, %l1
        lduwa   [%l1] 0x11,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-----------------------------------
!!	P=0 E=1 ASI=ASIF_U_PRIM
!!-----------------------------------
tc_25:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduwa   [%l1] 0x10,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-----------------------------------
!!	P=0 E=1 ASI=ASIF_U_SECOND
!!-----------------------------------
tc_26:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        lduwa   [%l1] 0x11,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-------------------------------
!!	P=0 E=1 ASI=PRIM  
!!-------------------------------
tc_27:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg9_data, %l0, %l1
        lduwa   [%l1] 0x80,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-------------------------------
!!	P=0 E=1 ASI=SEC
!!-------------------------------
tc_28:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg10_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

#if NFO_FIXED 
!!-------------------------------
!!	P=0 E=1 ASI=PRIM_NF
!!-------------------------------
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg11_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-------------------------------
!!	P=0 E=1 ASI=SEC_NF
!!-------------------------------
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg12_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

#endif

!!-------------------------------
!!	P=1 E=1 ASI=PRIM  
!!-------------------------------
tc_29:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg13_data, %l0, %l1
        lduwa   [%l1] 0x80,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-------------------------------
!!	P=1 E=1 ASI=SEC
!!-------------------------------
tc_30:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg14_data, %l0, %l1
        lduwa   [%l1] 0x81,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

#if NFO_FIXED
!!-------------------------------
!!	P=1 E=1 ASI=PRIM_NF
!!-------------------------------
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg15_data, %l0, %l1
        lduwa   [%l1] 0x82,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-------------------------------
!!	P=1 E=1 ASI=SEC_NF
!!-------------------------------
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        
        set     0x0,    %l0
        setx    dexec_pg16_data, %l0, %l1
        lduwa   [%l1] 0x83,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

#endif

!!-----------------------------------
!!	P=1 E=1 ASI=ASIF_U_PRIM
!!-----------------------------------
tc_31:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg13_data, %l0, %l1
        lduwa   [%l1] 0x10,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!-----------------------------------
!!	P=1 E=1 ASI=ASIF_U_SECOND
!!-----------------------------------
tc_32:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
       
        set     0x0,    %l0
        setx    dexec_pg14_data, %l0, %l1
        lduwa   [%l1] 0x11,      %l2
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

!!----------------------------------------
!!	PRIV=1 load ASI=NUCLEUS 
!!----------------------------------------
tc_33:
	/* E=0 P=0 CTX=NUCLEUS */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
        setx    dexec_pg25_data, %l0, %l1
        lduwa   [%l1] 0x4,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

	/* E=0 P=1 CTX=NUCLEUS */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
        setx    dexec_pg26_data, %l0, %l1
        lduwa   [%l1] 0x4,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

	/* E=1 P=0 CTX=NUCLEUS */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
        setx    dexec_pg27_data, %l0, %l1
        lduwa   [%l1] 0x4,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

	/* E=1 P=1 CTX=NUCLEUS */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
        setx    dexec_pg28_data, %l0, %l1
        lduwa   [%l1] 0x4,      %l2
        nop

        set     0x11223344,     %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffff1100,     %l1

#if SFSR
        call chk_sfsr
        nop
	ta	T_CHANGE_PRIV
	nop
#endif

        ta      T_CHANGE_NONPRIV
        nop

#endif 		/* end of testing load */

#if STORE_ON
/*
 ********************************************
 *	Store 	PRIV=0
 ********************************************
 */
	nop
tc_34:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* ATOMIC ASI=PRIM, P=0 E=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        casa   	[%l1] 0x80,	%l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* E=0 P=0 ASI = SEC W=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg2_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* ATOMIC ASI=SEC, P=0 E=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg2_data, %l0, %l1
        casa   	[%l1] 0x81,	%l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* E=0 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_35:
	/* ATOMIC , E=0 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        casa    [%l1] 0x80,     %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* E=0 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg6_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* ATOMIC, E=0 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg6_data, %l0, %l1
        casa    [%l1] 0x81,     %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg9_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_36:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC , E=1 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg9_data, %l0, %l1
        casa    [%l1] 0x80,     %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* E=1 P=0 ASI = SEC W=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg10_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* ATOMIC, E=1 P=0 ASI = SEC W=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg10_data, %l0, %l1
        casa    [%l1] 0x81,     %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_38:
	/* E=1 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg13_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_39:
	/* ATOMIC, E=1 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg13_data, %l0, %l1
        casa    [%l1] 0x80,     %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_40:
	/* E=1 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg14_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_41:
	/* ATOMIC, E=1 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg14_data, %l0, %l1
        casa    [%l1] 0x81,     %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_42:
	/* E=0 P=0 W=1 ASI=PRIM */
        /* do a store to the page */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg23_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

	/* ATOMIC E=0 P=0 W=1 ASI=PRIM */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg23_data, %l0, %l1
        casa    [%l1] 0x80,     %l2, %l0

	/* E=0 P=0 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg24_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81
	nop

	/* ATOMIC, E=0 P=0 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg24_data, %l0, %l1
        casa    [%l1] 0x81,     %l2, %l0

tc_43:
	/* E=0 P=1 W=1 ASI=PRIM */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg21_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_44:
	/* ATOMIC, E=0 P=1 W=1 ASI=PRIM */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg21_data, %l0, %l1
        casa    [%l1] 0x80,     %l2, %l0
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_45:
	/* E=0 P=1 W=1 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg22_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_46:
	/* ATOMIC, E=0 P=1 W=1 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg22_data, %l0, %l1
        swapa    [%l1] 0x81,     %l2

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

	/* E=1 P=0 W=1 ASI=PRIM */
        /* do a store to the page */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg19_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

	/* ATOMIC E=1 P=0 W=1 ASI=PRIM */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg19_data, %l0, %l1
        swapa 	[%l1] 0x80, %l2
	nop

	/* E=1 P=0 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg20_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81
	nop

	/* ATOMIC, E=1 P=0 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg20_data, %l0, %l1
        swapa   [%l1] 0x81, 	%l2
	nop

tc_47:
	/* E=1 P=1 W=1 ASI=PRIM */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg17_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_48:
	/* ATOMIC , E=1 P=1 W=1 ASI=PRIM */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg17_data, %l0, %l1
        casa   	[%l1] 0x80,  %l2, %l0
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_49:
	/* E=1 P=1 W=1 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg18_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_50:
	/* ATOMIC, E=1 P=1 W=1 ASI=SEC */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg18_data, %l0, %l1
	casa    [%l1] 0x81,  %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1


#if SFSR
        call chk_sfsr
        nop
#endif

/*
 ************************************************
 *	Store	PRIV=1
 ************************************************
 */
tc_51:
        ta      T_CHANGE_PRIV
        nop
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_52:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=0 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        casa    [%l1] 0x80,  %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_53:
	/* E=0 P=0 ASI = SEC W=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg2_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_54:
	/* ATOMIC, E=0 P=0 ASI = SEC W=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg2_data, %l0, %l1
        swapa   [%l1] 0x81,  %l2

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

#if SAS_BUG_FIXED
tc_55:
        /* E=0 P=0 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop     

        /* do a store to the page */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg25_data, %l0, %l1
        stwa    %l2,    [%l1] 0x04

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif
#endif

tc_56:
        /* ATOMIC, E=0 P=0 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop     

        /* do a store to the page */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg25_data, %l0, %l1
        swapa   [%l1] 0x04,	%l2

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_57:
	/* E=0 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_58:
	/* ATOMIC, E=0 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        casa	[%l1] 0x80, %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_59:
	/* E=0 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg6_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_60:
	/* ATOMIC, E=0 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg6_data, %l0, %l1
        swapa 	[%l1] 0x81, 	%l2

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_61:
        /* E=0 P=1 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop     

        /* do a store to the page */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg26_data, %l0, %l1
        stwa    %l2,    [%l1] 0x04

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_62:
        /* ATOMIC, E=0 P=1 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop     

        /* do a store to the page */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg26_data, %l0, %l1
        swapa   [%l1] 0x04, %l2 

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_63:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg9_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_64:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=1 P=0 ASI = PRIM W=0 */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg9_data, %l0, %l1
        casa   	[%l1] 0x80, %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_65:
	/* E=1 P=0 ASI = SEC W=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg10_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_66:
	/* ATOMIC, E=1 P=0 ASI = SEC W=0 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg10_data, %l0, %l1
        swapa	[%l1] 0x81, %l2

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_67:
        /* E=1 P=0 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop     

        /* do a store to the page */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg27_data, %l0, %l1
        stwa    %l2,    [%l1] 0x04

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_68:
        /* ATOMIC, E=1 P=0 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop     

        /* do a store to the page */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg27_data, %l0, %l1
        casa    [%l1] 0x04, %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_69:
	/* E=1 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg13_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_70:
	/* ATOMIC, E=1 P=1 W=0 ASI=PRIV */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg13_data, %l0, %l1
        swapa  	[%l1] 0x80, %l2

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_71:
	/* E=1 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg14_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_72:
	/* ATOMIC, E=1 P=1 W=0 ASI=SEC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg14_data, %l0, %l1
        casa   	[%l1] 0x81, %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_73:
	/* E=1 P=1 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg28_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x04

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_74:
	/* ATOMIC, E=1 P=1 W=0 ASI=NUC */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

        /* do a store to the page */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg28_data, %l0, %l1
        swapa 	[%l1] 0x04, %l2

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_75:
	/* E=0 P=0 W=1 ASI=PRIM */
        /* do a store to the page */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg23_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

	/* ATOMIC, E=0 P=0 W=1 ASI=PRIM */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg23_data, %l0, %l1
        swapa 	[%l1] 0x80, %l2
	nop

	/* E=0 P=0 W=1 ASI=SEC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg24_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81
	nop

	/* ATOMIC, E=0 P=0 W=1 ASI=SEC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg24_data, %l0, %l1
        casa   	[%l1] 0x81, %l2, %l0
	nop

	/* E=0 P=0 W=1 ASI=NUC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg29_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x04
	nop

	/* ATOMIC, E=0 P=0 W=1 ASI=NUC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg29_data, %l0, %l1
        casa   	[%l1] 0x04, %l2, %l0
	nop

	/* E=0 P=1 W=1 ASI=PRIM */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg21_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

	/* ATOMIC, E=0 P=1 W=1 ASI=PRIM */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg21_data, %l0, %l1
        swapa	[%l1] 0x80, %l2
	nop

	/* E=0 P=1 W=1 ASI=SEC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg22_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

	/* ATOMIC, E=0 P=1 W=1 ASI=SEC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg22_data, %l0, %l1
        casa   	[%l1] 0x81, %l2, %l0

	/* E=0 P=1 W=1 ASI=NUC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg30_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x04

	/* ATOMIC, E=0 P=1 W=1 ASI=NUC */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg30_data, %l0, %l1
        casa   	[%l1] 0x04, %l2, %l0

	/* E=1 P=0 W=1 ASI=PRIM */
        /* do a store to the page */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg19_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

	/* ATOMIC,  E=1 P=0 W=1 ASI=PRIM */
	/* no trap */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg19_data, %l0, %l1
        swapa 	[%l1] 0x80, %l2
	nop

	/* E=1 P=0 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg20_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81
	nop

	/* ATOMIC, E=1 P=0 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg20_data, %l0, %l1
        casa   	[%l1] 0x81, %l2, %l0
	nop

	/* E=1 P=0 W=1 ASI=NUC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg31_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x04
	nop

	/* ATOMIC, E=1 P=0 W=1 ASI=NUC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg31_data, %l0, %l1
        casa   	[%l1] 0x04, %l2, %l0
	nop

	/* E=1 P=1 W=1 ASI=PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg17_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x80
	nop

	/* ATOMIC, E=1 P=1 W=1 ASI=PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg17_data, %l0, %l1
        swapa 	[%l1] 0x80, %l2
	nop

	/* E=1 P=1 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg18_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x81

	/* ATOMIC, E=1 P=1 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg18_data, %l0, %l1
        casa   	[%l1] 0x81, %l2, %l0

	/* ATOMIC, E=1 P=1 W=1 ASI=SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg18_data, %l0, %l1
        swapa 	[%l1] 0x81, %l2 

	/* E=1 P=1 W=1 ASI=NUC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg32_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x04

	/* ATOMIC, E=1 P=1 W=1 ASI=NUC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg32_data, %l0, %l1
        casa   	[%l1] 0x04, %l2, %l0

	/* E=1 P=1 W=1 ASI=NUC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg32_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x04

	/* ATOMIC, E=1 P=1 W=1 ASI=NUC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg32_data, %l0, %l1
        swapa   [%l1] 0x04, %l2

/*
 *   	get back to user mode 	
 */
        ta      T_CHANGE_NONPRIV
        nop

/*
 ******************************************************
 * 	User Prim | User Sec  PRIV=1
 ******************************************************
 */
        ta      T_CHANGE_PRIV
        nop

tc_76:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_77:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=0 P=0 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        swapa  	[%l1] 0x10, %l2 
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_78:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg2_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_79:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=0 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg2_data, %l0, %l1
        casa   	[%l1] 0x11, %l2, %l0
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_80:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_81:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=0 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        casa   	[%l1] 0x10, %l2, %l0
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_82:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg6_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_83:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=0 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg6_data, %l0, %l1
        swapa  	[%l1] 0x11, %l2
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_84:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=0 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg9_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_85:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=1 P=0 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg9_data, %l0, %l1
        casa   	[%l1] 0x10, %l2, %l0
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_86:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg10_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_87:
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=1 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg10_data, %l0, %l1
        swapa 	[%l1] 0x11, %l2
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_88:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg13_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_89:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg13_data, %l0, %l1
        casa   	[%l1] 0x10, %l2, %l0
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_90:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg14_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_90_1:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=1 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg14_data, %l0, %l1
        swapa	[%l1] 0x11, %l2
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

/*
 ************************************************
 *	User_PRIM | User_SEC 	Store	W=1
 ************************************************
 */

tc_91:
	/* E=0 P=0 W=0 ASI=U_PRIM */
	/* no trap should happen */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg23_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

	/* ATOMIC, E=0 P=0 W=0 ASI=U_PRIM */
	/* no trap should happen */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg23_data, %l0, %l1
        casa   	[%l1] 0x10, %l2, %l0
	nop

	/* E=0 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg24_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

	/* ATOMIC, E=0 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg24_data, %l0, %l1
        swapa  	[%l1] 0x11, %l2
	nop

tc_92:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg21_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_93:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=0 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg21_data, %l0, %l1
        swapa  	[%l1] 0x10, %l2
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_94:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg22_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_95:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg22_data, %l0, %l1
        casa   	[%l1] 0x11, %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

	/* E=1 P=0 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg19_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

	/* ATOMIC, E=1 P=0 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg19_data, %l0, %l1
        swapa 	[%l1] 0x10, %l2
	nop

	/* E=1 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg20_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

	/* E=1 P=0 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg20_data, %l0, %l1
        casa   	[%l1] 0x11, %l2, %l0 
	nop

tc_96:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg17_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x10
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_97:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=1 P=1 W=0 ASI=U_PRIM */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg17_data, %l0, %l1
        casa   	[%l1] 0x10, %l2, %l0

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_98:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* E=1 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg18_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x11
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

tc_99:
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

	/* ATOMIC, E=1 P=1 W=0 ASI=U_SEC */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg18_data, %l0, %l1
        casa   	[%l1] 0x11, %l2, %l0
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
        ta      T_CHANGE_PRIV
        nop
#endif

/*
 *   	get back to user mode 	
 */
#endif	/* end of TEST stores */
        ta      T_CHANGE_NONPRIV
        nop

/* 
 *************************************************
 *	Bypass priv=0 privileged_action trap
 *************************************************
 */
tc_100:
        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x15
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
        call chk_sfsr
        nop

        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        lduwa   [%l1] 0x15,	%l3
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
        call chk_sfsr
        nop


tc_101:
        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x1d
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        call chk_sfsr
        nop

        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        lduwa  	[%l1] 0x1d,	%l6
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        call chk_sfsr
        nop

tc_102:
        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x15
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#if SFSR
        call chk_sfsr
        nop
#endif

        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        lduba  	[%l1] 0x15,	%l6
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#if SFSR
        call chk_sfsr
        nop
#endif

tc_103:
        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

	/* E=0 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x1d
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

        /* E=0 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg5_data, %l0, %l1
        lduha   [%l1] 0x1d,	%l6
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_104:
        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg9_data, %l0, %l1
        stwa    %l2,    [%l1] 0x15
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#if SFSR
        call chk_sfsr
        nop
#endif

        /* enable the trap */
        set     0x37,   %o0     /* privileged action trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg9_data, %l0, %l1
        ldxa    [%l1] 0x15,	%l6
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#if SFSR
        call chk_sfsr
        nop
#endif

tc_105:
        /* enable the trap */
        set     0x37,   %o0     /* privileged_action */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg9_data, %l0, %l1
        stwa    %l2,    [%l1] 0x1d
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

        /* enable the trap */
        set     0x37,   %o0     /* privileged_action */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg9_data, %l0, %l1
        lduha   [%l1] 0x1d,	%l6
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_106:
        /* enable the trap */
        set     0x37,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg13_data, %l0, %l1
        stwa    %l2,    [%l1] 0x15
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

        /* enable the trap */
        set     0x37,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg13_data, %l0, %l1
        ldxa    [%l1] 0x15,	%l6
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

tc_107:
        /* enable the trap */
        set     0x37,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg13_data, %l0, %l1
        stwa    %l2,    [%l1] 0x1d
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

        /* enable the trap */
        set     0x37,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop

        /* E=1 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg13_data, %l0, %l1
        lduba   [%l1] 0x1d,	%l6
        nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if SFSR
        call chk_sfsr
        nop
#endif

/* 
 *************************************************
 *	Bypass priv=1 OK
 *************************************************
 */
        ta      T_CHANGE_PRIV
        nop
tc_108:
	/* E=0 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
	set	0x55aa,	%l2
	mov	0x1,	%o0
        setx    dexec_pg1_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x15
	nop
        /* E=0 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg1_data, %l0, %l1
        lduha   [%l1] 0x15,	%l6
        nop

tc_109:
	/* E=0 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg1_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x1d
	nop
        /* E=0 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg1_data, %l0, %l1
        lduwa   [%l1] 0x1d,	%l6
        nop

tc_110:
	/* E=0 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
	set	0x55aa,	%l2
	mov	0x2,	%o0
        setx    dexec_pg5_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x15
	nop
        /* E=0 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg5_data, %l0, %l1
        lduba	[%l1] 0x15,	%l2
        nop

tc_111:
	/* E=0 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
	set	0x55aa,	%l2
        setx    dexec_pg5_data, %l0, %l1
        stwa   	%l2,	[%l1] 0x1d
	nop
        /* E=0 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg5_data, %l0, %l1
        lduwa   [%l1] 0x1d,	%l6
        nop

tc_112:
        /* E=1 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
	mov	0x3,	%o0
        setx    dexec_pg9_data, %l0, %l1
        stwa    %l2,    [%l1] 0x15
        nop
        /* E=1 P=0 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg9_data, %l0, %l1
        lduha	[%l1] 0x15,	%l6
        nop

tc_113:
        /* E=1 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg9_data, %l0, %l1
        stwa    %l2,    [%l1] 0x1d
        nop
        /* E=1 P=0 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg9_data, %l0, %l1
        lduwa	[%l1] 0x1d,	%l6
        nop

tc_114:
        /* E=1 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
	mov	0x4,	%o0
        setx    dexec_pg13_data, %l0, %l1
        stwa    %l2,    [%l1] 0x15
        nop
        /* E=1 P=1 ASI=ASI_PHYS_BYPASS */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg13_data, %l0, %l1
        ldswa	[%l1] 0x15,	%l6	
        nop

tc_115:
        /* E=1 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg13_data, %l0, %l1
        stxa    %l2,    [%l1] 0x1d
        nop
        /* E=1 P=1 ASI=ASI_PHYS_BYPASS_ECWT_LIT */
        set     0x0,    %l0
        set     0x55aa, %l2
        setx    dexec_pg13_data, %l0, %l1
        ldxa	[%l1] 0x1d,	%l6
        nop

/*
 * change back to USER mode 
 */
        ta      T_CHANGE_NONPRIV
        nop

/*
 ********************************
 *      Diag PASSED		*
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
bad_trap:
        ta T_BAD_TRAP
        nop
        nop

chk_sfsr:
        ta      T_CHANGE_HPRIV
        nop     

        /* read the DMMU SFSR */
        set     0x0,    %l0
        set     0x18,   %l1
        ldxa    [%l1] 0x58,     %l2     
        mov     0x20,   %l1
        ldxa    [%l1] 0x58,     %l2

	mov	0x18,	%l1
	stxa	%g0,	[%l1] 0x58

        ta      T_CHANGE_NONHPRIV
        nop

	retl
	nop

/*
 *********************************************************
 * real IMMU miss handler
 *********************************************************
 */
#define PG_REAL_MISS_HANDLER	0x240000

SECTION .HTRAPS	

.global real_txlate_miss_handler

real_txlate_miss_handler:
	mov	0x1,	%o1
	sub	%o1,	%o0,	%o2
	brz,a	%o2,	wrtte1
	nop

	mov	0x2,	%o1
	sub	%o1,	%o0,	%o2
	brz,a	%o2,	wrtte2
	nop

	mov	0x3,	%o1
	sub	%o1,	%o0,	%o2
	brz,a	%o2,	wrtte3
	nop

	mov	0x4,	%o1
	sub	%o1,	%o0,	%o2
	brz,a	%o2,	wrtte4
	nop

	ba	T_BAD_TRAP
	nop

wrtte1:
#define TAG_ACCESS1     0x0000000000250044
#define DATA_IN1        0x8000001100250000 	/* p=0, e=0 */
        setx   TAG_ACCESS1,  %l0, %g4	
        setx   DATA_IN1, %l0, %g5
        ba     rmiss_rtn
        nop

wrtte2:
#define TAG_ACCESS2     0x0000000000270044
#define DATA_IN2        0x8000001100270004	/* p=1, e=0 */
        setx   TAG_ACCESS2,  %l0, %g4
        setx   DATA_IN2, %l0, %g5
        ba     rmiss_rtn
        nop

wrtte3:
#define TAG_ACCESS3     0x0000000000290044
#define DATA_IN3        0x8000001100290008	/* e=1 , p=0 */
        setx   TAG_ACCESS3,  %l0, %g4
        setx   DATA_IN3, %l0, %g5
        ba     rmiss_rtn
        nop

wrtte4:
#define TAG_ACCESS4     0x00000000002b0044
#define DATA_IN4        0x80000011002b000c	/* e=1 , p=1 */
        setx   TAG_ACCESS4,  %l0, %g4
        setx   DATA_IN4, %l0, %g5

rmiss_rtn:
        mov  	0x30, %g3
	mov	0x200,	%g2

        setx    partition_base_list, %l1, %l2   ! for partition base
        mov     0x80, %l3               ! offset (VA) for patrition id
        ldxa    [%l3] 0x58, %l4         ! partition id
        sllx    %l4, 3, %l4             ! offset - partition list
        ldx     [%l2 + %l4], %l1
        or      %g5, %l1, %g5

        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g2 ] 0x5c	/* write the real address */
	retry
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

SECTION .DEXEC_PG1	DATA_VA=DEXEC_PG1_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG1,
        VA=DEXEC_PG1_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG1_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG1_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg1_data

dexec_pg1_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=0 ASI=SEC
!!-------------------------------
#define DEXEC_PG2_BASE_DATA_ADDR        0x258000
#define DEXEC_PG2_BASE_DATA_ADDR_PA     0x100258000

SECTION .DEXEC_PG2	DATA_VA=DEXEC_PG2_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG2,
        VA=DEXEC_PG2_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG2_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG2_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg2_data

dexec_pg2_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=0 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG3_BASE_DATA_ADDR        0x260000
#define DEXEC_PG3_BASE_DATA_ADDR_PA     0x100260000

SECTION .DEXEC_PG3	DATA_VA=DEXEC_PG3_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG3,
        VA=DEXEC_PG3_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG3_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG3_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg3_data

dexec_pg3_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=0 ASI=SEC_NF
!!-------------------------------
#define DEXEC_PG4_BASE_DATA_ADDR        0x268000
#define DEXEC_PG4_BASE_DATA_ADDR_PA     0x100268000

SECTION .DEXEC_PG4	DATA_VA=DEXEC_PG4_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG4,
        VA=DEXEC_PG4_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG4_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG4_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg4_data

dexec_pg4_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=1 E=0 ASI=PRIM  
!!-------------------------------
#define DEXEC_PG5_BASE_DATA_ADDR        0x270000
#define DEXEC_PG5_BASE_DATA_ADDR_PA     0x100270000

SECTION .DEXEC_PG5	DATA_VA=DEXEC_PG5_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG5,
        VA=DEXEC_PG5_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG5_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG5_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG6	DATA_VA=DEXEC_PG6_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG6,
        VA=DEXEC_PG6_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG6_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG6_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG7	DATA_VA=DEXEC_PG7_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG7,
        VA=DEXEC_PG7_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG7_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG7_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG8	DATA_VA=DEXEC_PG8_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG8,
        VA=DEXEC_PG8_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG8_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG8_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG9	DATA_VA=DEXEC_PG9_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG9,
        VA=DEXEC_PG9_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG9_BASE_DATA_ADDR_PA,0),
	RA=DEXEC_PG9_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg9_data

dexec_pg9_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=1 ASI=SEC
!!-------------------------------
#define DEXEC_PG10_BASE_DATA_ADDR        0x298000
#define DEXEC_PG10_BASE_DATA_ADDR_PA     0x100298000

SECTION .DEXEC_PG10	DATA_VA=DEXEC_PG10_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG10,
        VA=DEXEC_PG10_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG10_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG10_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg10_data

dexec_pg10_data: 
		.word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	P=0 E=1 ASI=PRIM_NF
!!-------------------------------
#define DEXEC_PG11_BASE_DATA_ADDR        0x2a0000
#define DEXEC_PG11_BASE_DATA_ADDR_PA     0x1002a0000

SECTION .DEXEC_PG11	DATA_VA=DEXEC_PG11_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG11,
        VA=DEXEC_PG11_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG11_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG11_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
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

SECTION .DEXEC_PG12	DATA_VA=DEXEC_PG12_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG12,
        VA=DEXEC_PG12_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG12_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG12_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
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

SECTION .DEXEC_PG13	DATA_VA=DEXEC_PG13_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG13,
        VA=DEXEC_PG13_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG13_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG13_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG14	DATA_VA=DEXEC_PG14_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG14,
        VA=DEXEC_PG14_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG14_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG14_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG15	DATA_VA=DEXEC_PG15_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG15,
        VA=DEXEC_PG15_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG15_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG15_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG16	DATA_VA=DEXEC_PG16_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG16,
        VA=DEXEC_PG16_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG16_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG16_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=1,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
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

SECTION .DEXEC_PG17	DATA_VA=DEXEC_PG17_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG17,
        VA=DEXEC_PG17_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG17_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG17_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=1
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

SECTION .DEXEC_PG18	DATA_VA=DEXEC_PG18_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG18,
        VA=DEXEC_PG18_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG18_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG18_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=1
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

SECTION .DEXEC_PG19	DATA_VA=DEXEC_PG19_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG19,
        VA=DEXEC_PG19_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG19_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG19_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
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

SECTION .DEXEC_PG20	DATA_VA=DEXEC_PG20_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG20,
        VA=DEXEC_PG20_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG20_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG20_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
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

SECTION .DEXEC_PG21	DATA_VA=DEXEC_PG21_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG21,
        VA=DEXEC_PG21_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG21_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG21_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
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

SECTION .DEXEC_PG22	DATA_VA=DEXEC_PG22_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG22,
        VA=DEXEC_PG22_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG22_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG22_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
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

SECTION .DEXEC_PG23	DATA_VA=DEXEC_PG23_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG23,
        VA=DEXEC_PG23_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG23_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG23_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
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

SECTION .DEXEC_PG24	DATA_VA=DEXEC_PG24_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG24,
        VA=DEXEC_PG24_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG24_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG24_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
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

SECTION .DEXEC_PG25	DATA_VA=DEXEC_PG25_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG25,
        VA=DEXEC_PG25_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG25_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG25_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg25_data

dexec_pg25_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=1 E=0 
!!-------------------------------
#define DEXEC_PG26_BASE_DATA_ADDR        0x318000
#define DEXEC_PG26_BASE_DATA_ADDR_PA     0x100318000

SECTION .DEXEC_PG26	DATA_VA=DEXEC_PG26_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG26,
        VA=DEXEC_PG26_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG26_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG26_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }


.data

.global  dexec_pg26_data

dexec_pg26_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=0 E=1 
!!-------------------------------
#define DEXEC_PG27_BASE_DATA_ADDR        0x320000
#define DEXEC_PG27_BASE_DATA_ADDR_PA     0x100320000

SECTION .DEXEC_PG27	DATA_VA=DEXEC_PG27_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG27,
        VA=DEXEC_PG27_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG27_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG27_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=0
        }


.data

.global  dexec_pg27_data

dexec_pg27_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=1 E=1 
!!-------------------------------
#define DEXEC_PG28_BASE_DATA_ADDR        0x328000
#define DEXEC_PG28_BASE_DATA_ADDR_PA     0x100328000

SECTION .DEXEC_PG28	DATA_VA=DEXEC_PG28_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG28,
        VA=DEXEC_PG28_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG28_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG28_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=0
        }


.data

.global  dexec_pg28_data

dexec_pg28_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=NUC P=0 E=0 W=1 
!!-------------------------------
#define DEXEC_PG29_BASE_DATA_ADDR        0x330000
#define DEXEC_PG29_BASE_DATA_ADDR_PA     0x100330000

SECTION .DEXEC_PG29	DATA_VA=DEXEC_PG29_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG29,
        VA=DEXEC_PG29_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG29_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG29_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
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

SECTION .DEXEC_PG30	DATA_VA=DEXEC_PG30_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG30,
        VA=DEXEC_PG30_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG30_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG30_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
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

SECTION .DEXEC_PG31	DATA_VA=DEXEC_PG31_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG31,
        VA=DEXEC_PG31_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG31_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG31_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
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

SECTION .DEXEC_PG32	DATA_VA=DEXEC_PG32_BASE_DATA_ADDR
attr_data {
        Name = .DEXEC_PG32,
        VA=DEXEC_PG32_BASE_DATA_ADDR, 
	PA=ra2pa(DEXEC_PG32_BASE_DATA_ADDR_PA, 0),
	RA=DEXEC_PG32_BASE_DATA_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=1, TTE_W=1
        }


.data

.global  dexec_pg32_data

dexec_pg32_data: .word   0x11223344
                .word   0x11223355
                .word   0x11223366
                .word   0x11223377
.end

!!-------------------------------
!!	CONTEXT=PCTX P=0 E=0 
!!-------------------------------
#define DEXEC_PG33_BASE_TEXT_ADDR        0x350000
#define DEXEC_PG33_BASE_TEXT_ADDR_PA     0x100350000

SECTION .DEXEC_PG33	TEXT_VA=DEXEC_PG33_BASE_TEXT_ADDR
attr_text {
        Name = .DEXEC_PG33,
        VA=DEXEC_PG33_BASE_TEXT_ADDR, 
	PA=ra2pa(DEXEC_PG33_BASE_TEXT_ADDR_PA, 0),
	RA=DEXEC_PG33_BASE_TEXT_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }


.text

.global  dexec_pg33_text

dexec_pg33_text: 
	and 	%l2,	%l0,	%l2
	add	%l2,	%l3,	%l3
.end

!!-------------------------------
!!	CONTEXT=PCTX P=1 E=0 
!!-------------------------------
#define DEXEC_PG34_BASE_TEXT_ADDR        0x358000
#define DEXEC_PG34_BASE_TEXT_ADDR_PA     0x100358000

SECTION .DEXEC_PG34	TEXT_VA=DEXEC_PG34_BASE_TEXT_ADDR
attr_text {
        Name = .DEXEC_PG34,
        VA=DEXEC_PG34_BASE_TEXT_ADDR, 
	PA=ra2pa(DEXEC_PG34_BASE_TEXT_ADDR_PA, 0),
	RA=DEXEC_PG34_BASE_TEXT_ADDR_PA,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }


.text

.global  dexec_pg34_text

dexec_pg34_text: 
	and 	%l2,	%l0,	%l2
	add	%l2,	%l3,	%l3
.end

