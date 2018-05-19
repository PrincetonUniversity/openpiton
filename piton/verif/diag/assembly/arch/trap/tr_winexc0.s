// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_winexc0.s
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
 * Name:   tr_winexc0.s
 * Date:   02/5/02
 *
 *
 *  Description:
 *  	Generate window related traps
 *		- spill
 *		- fill
 *		- clean win
 *
 **********************************************************************/

/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Window_Fill_0_Normal_Trap
#define	H_T0_Window_Fill_7_Normal_Trap

#define	H_T0_Window_Fill_0_Other_Trap
#define	H_T0_Window_Fill_7_Other_Trap

#define	H_T0_Window_Spill_0_Normal_Trap
#define	H_T0_Window_Spill_7_Normal_Trap

#define	H_T0_Window_Spill_0_Other_Trap
#define	H_T0_Window_Spill_7_Other_Trap

#define H_T0_Clean_Window

#define	H_HT0_Mem_Address_Not_Aligned_0x34

#define My_T0_Window_Spill_0_Normal_Trap saved; retry;
#define My_T0_Window_Spill_7_Normal_Trap saved; retry;

#define My_T0_Window_Spill_0_Other_Trap saved; retry;
#define My_T0_Window_Spill_7_Other_Trap saved; retry;

#define My_T0_Window_Fill_0_Normal_Trap restored; retry;
#define My_T0_Window_Fill_7_Normal_Trap restored; retry;

#define My_T0_Window_Fill_0_Other_Trap restored; retry;
#define My_T0_Window_Fill_7_Other_Trap restored; retry;

#define My_T0_Clean_Window saved; retry;

#define	My_HT0_Mem_Address_Not_Aligned_0x34 done;

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

	ta		T_CHANGE_PRIV

  ! Initialize %i0 for different CWP

	wrpr		%g0, 0x0, %cwp
	set		0xaa, %i0
	wrpr		%g0, 0x1, %cwp
	set		0xab, %i0
	wrpr		%g0, 0x2, %cwp
	set		0xac, %i0
	wrpr		%g0, 0x3, %cwp
	set		0xad, %i0
	wrpr		%g0, 0x4, %cwp
	set		0xae, %i0
	wrpr		%g0, 0x5, %cwp
	set		0xaf, %i0
	wrpr		%g0, 0x6, %cwp
	set		0xba, %i0
	wrpr		%g0, 0x7, %cwp
	set		0xbb, %i0

  ! Cause different window traps - using save and restore

	wrpr		%g0, 0x0, %cwp
	wrpr		%g0, 0x0, %cansave
	save		%g0, 0x8, %i0			! causes spill trap normal first, then cleanwin

	wrpr		%g0, 0x1, %cwp
	wrpr		%g0, 0x0, %canrestore
	restore		%g0, 0x8, %i0			! fill trap

	wrpr		%g0, 0x1, %otherwin

	wrpr		%g0, 0x2, %cwp
	wrpr		%g0, 0x0, %cansave
	save		%g0, 0x8, %i0			! spill trap - other - wstate = 0
	
	wrpr		%g0, 0x3, %cwp
	wrpr		%g0, 0x0, %canrestore
	restore		%g0, 0x8, %i0			! fill trap other

	wrpr		%g0, 0x38, %wstate		! wstate.other = 7

	wrpr		%g0, 0x4, %cwp
	wrpr		%g0, 0x0, %cansave
	save		%g0, 0x8, %i0
	
	wrpr		%g0, 0x6, %cwp
	wrpr		%g0, 0x0, %canrestore
	restore		%g0, 0x8, %i0

	wrpr		%g0, 0x0, %otherwin

	wrpr		%g0, 0x7, %cwp
	wrpr		%g0, 0x0, %cansave
	save		%g0, 0x8, %i0
	
	wrpr		%g0, 0x8, %cwp			! Lets see what this does.
	wrpr		%g0, 0x0, %canrestore
	restore		%g0, 0x8, %i0

	! return

	wrpr		%g0, 0x0, %canrestore
	rd		%pc, %i0
	return		%i0+0xc
	nop

	! Check priority against mem addr not aligned

	wrpr		%g0, 0x0, %canrestore
	rd		%pc, %i0
	return		%i0+0xb
	nop

	! Check whether updating cansave/canrestore happens quick enough

	wrpr		%g0, 0x7, %canrestore

	restore		%g0, 0x0, %i0
	restore		%g0, 0x1, %i0
	restore		%g0, 0x2, %i0
	restore		%g0, 0x3, %i0
	restore		%g0, 0x4, %i0
	restore		%g0, 0x5, %i0
	restore		%g0, 0x6, %i0
	restore		%g0, 0x7, %i0	! This should cause trap

	save		%g0, 0x0, %i0
	save		%g0, 0x1, %i0
	save		%g0, 0x2, %i0
	save		%g0, 0x3, %i0
	save		%g0, 0x4, %i0
	save		%g0, 0x5, %i0
	save		%g0, 0x6, %i0
	save		%g0, 0x7, %i0

	! Check how updates to the window registers is reflected in trap type

	wrpr		%g0, 0x0, %otherwin
	save		%g0, 0x7, %i0
	wrpr		%g0, 0x7, %otherwin
	save		%g0, 0x7, %i0
	wrpr		%g0, 0x3f, %wstate
	save		%g0, 0x7, %i0
	wrpr		%g0, 0x0, %wstate
	save		%g0, 0x7, %i0

	! more emphasis on cleanwin trap

	set		0x0, %g1
	set		0x1, %g2

	wrpr		%g1, %g2, %cansave
	wrpr		%g0, 0x4, %cleanwin
	wrpr		%g0, 0x4, %canrestore
	save		%g1, %g2, %g3			! This should cause cleanwin trap

	! Try setting 8 into canrestore - shouldnt happen

	wrpr		%g0, 0x8, %cleanwin
	wrpr		%g0, 0x8, %canrestore
	restore		%g1, %g2, %g3			

	wrpr		%g0, 0x7, %canrestore
	wrpr		%g0, 0x8, %cleanwin
	save		%g1, %g2, %g3			! This should go thru

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
