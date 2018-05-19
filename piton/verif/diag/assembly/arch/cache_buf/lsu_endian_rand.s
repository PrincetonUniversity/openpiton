// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_endian_rand.s
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

#define H_HT0_fast_data_access_MMU_miss  T0_fast_dmmu_miss

#include "boot.s"

!!-------------------------------------------------------------------------------
!!
!!      This file has the micro-code to test out the endianess of
!!	 load/store access to memory.
!!
!!		Test cases :
!!
!!		  ASI = BigEndian, LittleEndian	
!!
!!			5.) PSTATE.TLE = 0 ,  PSTATE.CLE = 0	TTE.IE = 1
!!			6.) PSTATE.TLE = 0 ,  PSTATE.CLE = 1	TTE.IE = 1
!!			7.) PSTATE.TLE = 1 ,  PSTATE.CLE = 0	TTE.IE = 1
!!			8.) PSTATE.TLE = 1 ,  PSTATE.CLE = 1	TTE.IE = 1
!!
!!-------------------------------------------------------------------------------
.global endian_testTLE_CLE
.global main
main:

	/*
	 *****************************************	 
	 * Initialize all the registers
	 ***************************************** 
	 */
	set     0x4ef59d54,     %l0
	set     0x6ec4899,     %l1
	set     0x1ed67b4d,     %l2
	set     0x3c7605fa,     %l3
	set     0x5afa9399,     %l4
	set     0xd89c127d,     %l5
	set     0x6532c98b,     %l6
	set     0x807443b5,     %l7
	set     0x8fe23eed,     %i0
	set     0xb6f9cd80,     %i1
	set     0x451feac8,     %i2
	set     0x645c284f,     %i3
	set     0xd36d190f,     %i4
	set     0xe7761250,     %i5
	set     0xf278b58c,     %i6
	set     0x4e24b424,     %i7
	set     0xbcf2017f,     %o0
	set     0x8b51061a,     %o1
	set     0x32b972c9,     %o2
	set     0xf2fa6102,     %o3
	set     0x6d2fcc9c,     %o4
	set     0x8d03e0b,     %o5
	set     0xc90a550b,     %o6
	set     0xbabc9b53,     %o7

	/*
	 ****************************************	
	 * 	page IE = 0
	 ****************************************	
	 */
	mov	0x0,	%l0
	setx	dtte_8kb_data_end,	%l0,	%l7
	setx	dtte_64kb_data_0,	%l0,	%l6
	setx	dtte_64kb_data_end,	%l0,	%l5
	setx	dtte_512kb_data_0,	%l0,	%l4
	setx	dtte_512kb_data_end,	%l0,	%l3
	setx	dtte_4mb_data_0,	%l0,	%l2
	setx	dtte_4mb_data_end,	%l0,	%l1
	setx	dtte_8kb1_data_0,	%l0,	%g1
	setx	dtte_8kb1_data_end,	%l0,	%g2
       setx    dtte_8kb2_data_0,       %l0,    %g3
	mov	0x1,	%o0
	ldub     [%l7+3],  %i3
	mov	0x2,	%o0
	ldsb     [%l6+2],  %o0
	ldub     [%l5+6],  %i6
	mov	0x3,	%o0
	ldsb     [%l4+6],  %i7
	ldsb     [%l3+3],  %o2
	mov	0x4,	%o0
	ldub     [%l2+6],  %o3
	ldub     [%l1+3],  %i2
	mov	0x5,	%o0
	ldub     [%g1+2],  %o5
	ldub     [%g2+6],  %o5
       mov     0x6,    %o0
       ldsb     [%g3+6],  %i2

	/* stores */
	stb	%o4,	[%l7]
	stw	%o6,	[%l6]
	stw	%i0,	[%l5]
	st	%o0,	[%l4]
	stb	%i4,	[%l3]
	stb	%i6,	[%l2]
	st	%i2,	[%l1]
	st	%o6,	[%g1]

	/* load mixed with store */
	ldub     [%l7+4],  %o2
	stw	%o2,	[%l7]
	ldub     [%l6+5],  %i7
       stx      %o7,        [%l5]
       ldsb     [%l4+4],  %i4
       stx      %i7,        [%l3]
       ldsb     [%l2+4],  %i0
       stx      %i4,        [%l1]
       ldsb     [%g1+6],  %o7

	/*
	 **********************************************
	 *	TLE = 0 ; CLE = 0; Page IE = 1;
	 **********************************************
	 */
test_4:
	ta	T_CHANGE_PRIV	
	nop

	mov	0x7,	%o0
	call	endian_testTLE_CLE
	nop

	/*
	 **********************************************
	 *	TLE = 0 ; CLE = 1; Page IE = 1;
	 **********************************************
	 */
test_5:
	ta	T_CHANGE_PRIV	
	nop

	rdpr	%pstate, 	%l0
	mov	(1<<9),	%l1
	or	%l1,	%l0,	%l0
	wrpr	%l0,	%pstate
	rdpr	%pstate, 	%l1

	ta	T_CHANGE_NONPRIV	
	nop

	mov	0x8,	%o0
	call	endian_testTLE_CLE
	nop

	/*
	 **********************************************
	 *	TLE = 1 ; CLE = 0; Page IE = 1;
	 **********************************************
	 */
test_6:
	ta	T_CHANGE_PRIV	
	nop

	rdpr	%pstate, 	%l0
	set	0xfdff,	%l1
	and	%l1,	%l0,	%l0
	mov	(1<<8),	%l1	
	or	%l1,	%l0,	%l0
	wrpr	%l0,	%pstate
	rdpr	%pstate, 	%l1

	ta	T_CHANGE_NONPRIV	
	nop

	mov	0x9,	%o0
	call	endian_testTLE_CLE
	nop

	/*
	 **********************************************
	 *	TLE = 1 ; CLE = 1; Page IE = 1;
	 **********************************************
	 */
test_7:
	ta	T_CHANGE_PRIV	
	nop

	rdpr	%pstate, 	%l0
	mov	(3<<8),	%l1	
	or	%l1,	%l0,	%l0
	wrpr	%l0,	%pstate
	rdpr	%pstate, 	%l1

	ta	T_CHANGE_NONPRIV	
	nop

	mov	0xa,	%o0
	call	endian_testTLE_CLE
	nop

/*
 ********************************
 *      Diag PASSED !           *
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


endian_testTLE_CLE:
	add	%o7,	0x0,	%l7	/* save the return address */
	/*
	 ****************************************	
	 * ASI be, priv = 0
	 ****************************************	
	 */
endiantest_0:
       setx    dtte_4mb_data_5,    %l0,    %l1          
       ldsha	[%l1] 0x80, %i0
	stxa 	%l6, [%l1] 0x80
       lduh        [%l1],  %i2
	stxa 	%l4, [%l1] 0x80
       ldsw        [%l1],  %i6
       ldx        [%l1],  %i2
       lduwa	[%l1] 0x80, %i5
	stwa 	%o2, [%l1] 0x80
       ldxa	[%l1] 0x80, %i2
	stwa 	%o0, [%l1] 0x80

	/*
	 ****************************************	
	 * ASI le, priv = 0
	 ****************************************	
	 */
endiantest_1:
       setx    dtte_512kb_data_3,    %l0,    %l1          
       lduha	[%l1] 0x88, %i7
	stxa 	%o1, [%l1] 0x88
       ldswa	[%l1] 0x88, %i6
	stha 	%o4, [%l1] 0x88
       ldsw        [%l1],  %i1
       lduh        [%l1],  %i2
       setx    dtte_64kb_data_3,    %l0,    %l1          
       lduwa	[%l1] 0x88, %i5
	stwa 	%o2, [%l1] 0x88
       ldxa	[%l1] 0x88, %i2
	stwa 	%o0, [%l1] 0x88
	stxa 	%o2, [%l1] 0x88
       lduw        [%l1],  %i5
	ta	T_CHANGE_PRIV
	nop	

	/*
	 ****************************************	
	 * ASI be, priv = 1
	 ****************************************	
	 */
endiantest_2:
       setx    dtte_64kb_data_1,    %l0,    %l1          
       ldxa 	[%l1] 0x10, %i4
	stxa 	%o0, [%l1] 0x10
       ldx        [%l1],  %i5
	stwa 	%o3, [%l1] 0x10
	stwa 	%o4, [%l1] 0x10
       lduha 	[%l1] 0x10, %i7

       setx    dtte_4mb_data_5,    %l0,    %l1          
       ldxa 	[%l1] 0x80, %i3
	stha 	%o3, [%l1] 0x80
       ldsw        [%l1],  %i6
	stha 	%o3, [%l1] 0x80
       lduh        [%l1],  %i7
       lduwa 	[%l1] 0x80, %i0
       setx    dtte_64kb_data_0,    %l0,    %l1          
       ldswa 	[%l1] 0x80, %i0
	stba 	%o1, [%l1] 0x80
       lduw        [%l1],  %i6
	stxa 	%o4, [%l1] 0x80
       lduha 	[%l1] 0x80, %i2
	stxa 	%o3, [%l1] 0x80

	/*
	 ****************************************	
	 * ASI le, priv = 1
	 ****************************************	
	 */
endiantest_3:
       setx    dtte_512kb_data_0,    %l0,    %l1          
       ldswa 	[%l1] 0x18, %i7
	stxa 	%l0, [%l1] 0x18
       lduw        [%l1],  %i2
	stha 	%l4, [%l1] 0x18
       ldsha 	[%l1] 0x18, %i2

       setx    dtte_64kb_data_4,    %l0,    %l1          
       lduha 	[%l1] 0x88, %i3
	stba 	%l0, [%l1] 0x88
       ldx        [%l1],  %i2
       ldsh        [%l1],  %i6
	stwa 	%l2, [%l1] 0x88
       lduha 	[%l1] 0x88, %i6
       setx    dtte_8kb_data_2,    %l0,    %l1          
       ldxa 	[%l1] 0x88, %i6
	stxa 	%l3, [%l1] 0x88
       ldsw        [%l1],  %i7
	stha 	%l0, [%l1] 0x88
       ldsha 	[%l1] 0x88, %i7
	stxa 	%l5, [%l1] 0x88
       ldsha 	[%l1] 0x88, %i1
	stwa 	%l1, [%l1] 0x88

	ta	T_CHANGE_NONPRIV
	nop	

	set	0x888f0000,	%l1	/* an arbitrary address */
	ld	[%l1],	%l2		/* generate the DMISS trap */
	nop
	
	add	%l7,	0x0,	%o7	/* restore the return address */
	retl
	nop

/*
 **********************************************
 * Customized fast DMMU page fault handler
 *
 * Input :

        %o0 : if 0, use standard way to
                handle the DMMU miss;

        Otherwise, use propritary trap handler
 **********************************************
 */
!!-----------------------------------------------------
!!      8kb page size for custom trap handler
!!-----------------------------------------------------
#define DMMU_MISS_TRAPPG_VA     0x1600000

SECTION .DMMU_MISS_TRAPPG	TEXT_VA = DMMU_MISS_TRAPPG_VA
attr_text {
        Name = .DMMU_MISS_TRAPPG,
	hypervisor
        }

.text
.global T0_fast_dmmu_miss

T0_fast_dmmu_miss:
        brnz     %o0,    custom_dmmu_trap
        nop

#include "dmmu_miss_handler.s"
#include "dmmu_miss_handler_ext.s"

custom_dmmu_trap:
	 sub	%o0,	0x1,	%o1
	 brz	%o1,	wrtte1
	 nop

	 sub	%o0,	0x2,	%o1
	 brz	%o1,	wrtte2
	 nop

	 sub	%o0,	0x3,	%o1
	 brz	%o1,	wrtte3
	 nop

	 sub	%o0,	0x4,	%o1
	 brz	%o1,	wrtte4
	 nop

	 sub	%o0,	0x5,	%o1
	 brz	%o1,	wrtte5
	 nop

	 sub	%o0,	0x6,	%o1
	 brz	%o1,	wrtte6
	 nop

	 sub	%o0,	0x7,	%o1
	 brz	%o1,	asi_test0	/* TLE = 0 CLE = 0 */
	 nop

	 sub	%o0,	0x8,	%o1
	 brz	%o1,	asi_test1	/* TLE = 0 CLE = 1 */
	 nop

	 sub	%o0,	0x9,	%o1
	 brz	%o1,	asi_test2	/* TLE = 1 CLE = 0 */
	 nop

	 sub	%o0,	0xa,	%o1
	 brz	%o1,	asi_test3	/* TLE = 1 CLE = 1 */
	 nop

	 ta	T_BAD_TRAP
	 nop

asi_test0:
asi_test1:
asi_test2:
asi_test3:
       !!setx    dtte_8kb_data_2,    %l0,    %l1
       setx    	0x36eb00,    %l0,    %l1
       ldx        [%l1],  %i3
       stxa         %o7, [%l1] 0x10
       lduwa        [%l1] 0x10, %i2
       ldsh        [%l1],  %i5
       stba         %o0, [%l1] 0x10
       lduwa        [%l1] 0x10, %i2
       ldsw        [%l1],  %i4
       stwa         %o5, [%l1] 0x10
       lduha        [%l1] 0x10, %i4
       ldx        [%l1],  %i7

       !! setx    dtte_64kb_data_0,    %l0,    %l1
       setx    	0x370000,    %l0,    %l1
       stba         %o4, [%l1] 0x10
       stha         %o0, [%l1] 0x10
       stwa         %o1, [%l1] 0x10
       stxa         %o3, [%l1] 0x10
       stwa         %o0, [%l1] 0x10
       stxa         %o4, [%l1] 0x10
       stha         %o6, [%l1] 0x10
       stba         %o2, [%l1] 0x10
       lduw        [%l1],  %i6
       lduha        [%l1] 0x10, %i2
       ldx        [%l1],  %i5
       lduha        [%l1] 0x10, %i3

       !!setx    dtte_8kb1_data_end,    %l0,    %l1
       setx    	0x801ff8,    %l0,    %l1
       ldsw        [%l1],  %i7
       stxa         %o0, [%l1] 0x80
       ldxa        [%l1] 0x80, %i5
       ldsw        [%l1],  %i4
       stha         %o5, [%l1] 0x80
       ldxa        [%l1] 0x80, %i5
       lduw        [%l1],  %i7
       ldsw        [%l1],  %i7
       stxa         %o2, [%l1] 0x80
       ldsha        [%l1] 0x80, %i3

       !!setx    dtte_8kb_data_1,    %l0,    %l1
       setx    0x36e600,    %l0,    %l1
       lduw        [%l1],  %i3
       stba         %o6, [%l1] 0x80
       lduwa        [%l1] 0x80, %i3
       ldsw        [%l1],  %i6
       stha         %o5, [%l1] 0x80
       ldxa        [%l1] 0x80, %i3
       ldswa        [%l1] 0x80, %i3
       ldsw        [%l1],  %i1
       stxa         %o6, [%l1] 0x80
       lduha        [%l1] 0x80, %i2
 
	mov	0x0,	%l0
	wr	%l0,	0x80,	%asi
       !!setx    dtte_512kb_data_2,    %l0,    %l1
       setx    0x3a0000,    %l0,    %l1
       stba         %o3, [%l1] %asi
       stxa         %o3, [%l1] %asi
       stha         %o5, [%l1+0x0] %asi
       stha         %o3, [%l1+0x2] %asi
       stwa         %o3, [%l1] %asi
       stwa         %o2, [%l1] %asi
       stha         %o4, [%l1+0x2] %asi
       ldsw        [%l1],  %i6
       stha         %o2, [%l1+0x2] %asi
       ldsh        [%l1],  %i4
       stwa         %o3, [%l1] %asi
       stha         %o6, [%l1+0x0] %asi
       lduw        [%l1],  %i7
       lduha        [%l1] %asi, %i4

	mov	0x0,	%l0
	wr	%l0,	0x80,	%asi
       !!setx    dtte_512kb_data_4,    %l0,    %l1
       setx    0x3c0000,    %l0,    %l1
       stba         %o7, [%l1] %asi
       stxa         %o1, [%l1] %asi
       stha         %o5, [%l1+0x0] %asi
       stha         %o5, [%l1+0x2] %asi
       stwa         %o7, [%l1] %asi
       stwa         %o7, [%l1] %asi
       stha         %o6, [%l1+0x0] %asi
       ldsw        [%l1],  %i7
       lduw        [%l1],  %i2
       lduwa        [%l1] %asi, %i7

       !!setx    dtte_512kb_data_0,    %l0,    %l1
       setx    0x380000,    %l0,    %l1
       ldsw        [%l1],  %i4
       stha         %o4, [%l1] 0x18
       ldxa        [%l1] 0x18, %i3
       ldsw        [%l1],  %i5
       stxa         %o6, [%l1] 0x18
       ldxa        [%l1] 0x18, %i7
       lduha        [%l1] 0x18, %i1
       ldsw        [%l1],  %i5
       stba         %o3, [%l1] 0x18
       lduha        [%l1] 0x18, %i7

       !!setx    dtte_8kb1_data_2,    %l0,    %l1
       setx    0x800b00,    %l0,    %l1
       ldsh        [%l1],  %i4
       stba         %o1, [%l1] 0x88
       lduwa        [%l1] 0x88, %i3
       lduh        [%l1],  %i4
       stba         %o5, [%l1] 0x88
       lduha        [%l1] 0x88, %i3
       ldxa        [%l1] 0x88, %i5
       lduw        [%l1],  %i3
       stxa         %o2, [%l1] 0x88
       lduha        [%l1] 0x88, %i1
       !!setx    dtte_64kb_data_1,    %l0,    %l1
       setx    0x372000,    %l0,    %l1
       ldx        [%l1],  %i1
       stxa         %o0, [%l1] 0x88
       ldxa        [%l1] 0x88, %i7
       ldsw        [%l1],  %i6
       stwa         %o7, [%l1] 0x88
       ldsha        [%l1] 0x88, %i3
       ldsh        [%l1],  %i5
       ldsh        [%l1],  %i7
       stha         %o7, [%l1] 0x88
       lduwa        [%l1] 0x88, %i1
	done
	nop
 
wrtte1:	
#define TAG_ACCESS1	0x000000000036e044
#define DATA_IN1	0x880000000036e003
	 setx	TAG_ACCESS1,  %l0, %g4
	 setx	DATA_IN1, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte2:	
#define TAG_ACCESS2	0x0000000000370044
#define DATA_IN2	0xa800000000370003
	 setx	TAG_ACCESS2,  %l0, %g4
	 setx	DATA_IN2, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte3:	
#define TAG_ACCESS3	0x0000000000380044
#define DATA_IN3	0xa800000000380003	
	setx	TAG_ACCESS3,  %l0, %g4
	setx	DATA_IN3, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	mov	0x7,	%i1
	mov	0x0,	%i2	
add_pg64k_loop:
	set	0x10000,	%l0
	add	%l0,	%g4,	%g4		
	add	%l0,	%g5,	%g5		
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

	add	%i2,	0x1,	%i2
	sub	%i2,	%i1,	%i7
	brlz	%i7,	add_pg64k_loop
	nop

	ba	dmiss_rtn
	nop


wrtte4:	
#define TAG_ACCESS4	0x0000000000400044
#define DATA_IN4	0xe800000000400003
	 setx	TAG_ACCESS4,  %l0, %g4
	 setx	DATA_IN4, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte5:	
#define TAG_ACCESS5	0x0000000000800044
#define DATA_IN5	0x8800000000800003
	 setx	TAG_ACCESS5,  %l0, %g4
	 setx	DATA_IN5, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte6:	
#define TAG_ACCESS6	0x0000000000802044
#define DATA_IN6	0x8800000000802003
	 setx	TAG_ACCESS6,  %l0, %g4
	 setx	DATA_IN6, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

dmiss_rtn:
	mov	0x0,	%o0
	retry
	nop 	

!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG_BASE_DATA_ADDR     0x36e000
#define RDM_8KB_PG_BASE_DATA_ADDR_PA  0x36e000
SECTION .RDM_8KB_PAGE	DATA_VA=RDM_8KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE
        VA=RDM_8KB_PG_BASE_DATA_ADDR, 
	RA=RDM_8KB_PG_BASE_DATA_ADDR_PA,
	PA=RDM_8KB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dtte_8kb_data_0
dtte_8kb_data_0:
		.word 0xb8e8338b
		.word 0x5998eb7f
		.word 0xd2ba8556
		.word 0x7517f13b
		.word 0xe8c1e84
		.word 0x6caac3ed
		.word 0x3ba569a
		.word 0xc1e71b35
		.word 0x67a1e02d
		.word 0xfc547d02
		.word 0xa2520ca4
		.word 0x3dc8996b
		.word 0x79c4ed9e
		.word 0x2dfb7730
		.word 0xef1f2452
		.word 0xed86cf8f
.align 1024
	.word 0x6dc19c66
	.word 0xf614fc51
	.word 0xef87bf16
	.word 0x8291936
.align 512
.global  dtte_8kb_data_1
dtte_8kb_data_1:
		.word 0xad5ac9b
		.word 0x211f0230
		.word 0x88180d30
		.word 0x1e14ba03
		.word 0x90a6e031
		.word 0x704114d
		.word 0x540fa71f
		.word 0xed8a2c04
		.word 0xc13b338f
		.word 0x4d1053e1
		.word 0xb5e68a54
		.word 0xf43e705b
		.word 0x2ce38b5f
		.word 0x287a111f
		.word 0x64d8ad29
		.word 0x17a64620
.align 1024
	.word 0xbfc2eba5
	.word 0x3ae018bc
	.word 0x79025e10
	.word 0x26836b86
.align 512
	.word 0x18a98c13
	.word 0xf744e2b1
	.word 0x4986e20f
	.word 0xcca24d3c
.align 256
.global  dtte_8kb_data_2
dtte_8kb_data_2:
		.word 0x249c5d9a
		.word 0x1835673f
		.word 0xa9de066b
		.word 0xc7b8c815
		.word 0x7ed6d544
		.word 0xf536f333
		.word 0x7bfc99a3
		.word 0x983ce0ea
		.word 0xe39e1040
		.word 0xa9877c6b
		.word 0x9fd6ff9f
		.word 0x851496be
		.word 0xaa19a53e
		.word 0x9cf03a98
		.word 0xf4fc5529
		.word 0xf36e3324
.align 1024
	.word 0x57d7b6fd
	.word 0x6f228844
	.word 0xbfbd69c
	.word 0xcf22bcdd
.align 512
	.word 0x6ce71c21
	.word 0xef135016
	.word 0xe22d7dda
	.word 0xf1fa70c4
.align 256
	.word 0xacbb049
	.word 0xc8498a55
	.word 0x5e920b83
	.word 0x2b4564ee
.align 128
.global  dtte_8kb_data_3
dtte_8kb_data_3:
		.word 0xf03e2261
		.word 0x14588eaa
		.word 0x800def63
		.word 0x2bb8ba0d
		.word 0xe0e9d434
		.word 0x92073e29
		.word 0x4185c42b
		.word 0x3da2ff14
		.word 0x38709f44
		.word 0xec314992
		.word 0xe19a5263
		.word 0x4d90ab20
		.word 0x742592dd
		.word 0xb78017d3
		.word 0xd2d4e9f
		.word 0x75a3d196
.align 1024
	.word 0x9c6cff67
	.word 0xe3ed10d1
	.word 0x22b746f0
	.word 0x7c707488
.align 512
	.word 0xe6c162fc
	.word 0x95d75067
	.word 0xa00a739d
	.word 0xa961195c
.align 256
.global  dtte_8kb_data_4
dtte_8kb_data_4:
		.word 0xc1420b3a
		.word 0x3e9305ae
		.word 0x31a55f13
		.word 0xfabd83af
		.word 0xe1a98059
		.word 0x6df9027e
		.word 0xad739919
		.word 0x56a7ba76
		.word 0x68d70d7f
		.word 0x9e13f35
		.word 0x3509e947
		.word 0x4f01bb66
		.word 0xc2f7fa52
		.word 0x35db56b6
		.word 0x6a4eb4b8
		.word 0xb2708095
.align 1024
	.word 0x881249cf
	.word 0x59243eb4
	.word 0x93568afe
	.word 0x80d73c61
.align 512
.global  dtte_8kb_data_5
dtte_8kb_data_5:
		.word 0x3a7c1259
		.word 0xfb08c030
		.word 0x7a480e56
		.word 0x29efef90
		.word 0xa5e7c315
		.word 0x2d8743f
		.word 0xf399ab1c
		.word 0xdf54bdb9
		.word 0xb35eea74
		.word 0xb0854911
		.word 0x232ed280
		.word 0x7a9fa3e1
		.word 0x7a0a5210
		.word 0xa47d32e
		.word 0xaf01ac7a
		.word 0x2a7c7568
.align 1024
	.word 0xf33f83bc
	.word 0xb260ef01
	.word 0x176174fb
	.word 0x10e34326
.align 512
	.word 0x1f390bd6
	.word 0x1295769a
	.word 0xe89cf864
	.word 0xe76f90d0
.align 256
.global  dtte_8kb_data_6
dtte_8kb_data_6:
		.word 0x48600cde
		.word 0x80890faf
		.word 0x9b73e33b
		.word 0xef2afca0
		.word 0xf262f84c
		.word 0xb4e955e3
		.word 0xe820d91b
		.word 0x1d683d35
		.word 0x79be809d
		.word 0x3aaae54a
		.word 0x667986ec
		.word 0xf9b599b7
		.word 0x651b18ae
		.word 0x57ae092c
		.word 0x63c12454
		.word 0xb7bc403e
.align 1024
	.word 0x6d32944e
	.word 0x13391309
	.word 0x5f9d186d
	.word 0x25541e74
.align 512
	.word 0x9f16be0d
	.word 0x31129ddd
	.word 0x1c62b5b8
	.word 0x4f6a2078
.align 256
	.word 0x20eaf65a
	.word 0xb7e641a5
	.word 0x46f04150
	.word 0xb1d0fa05
.align 128
	.word 0xc7b02fcc
	.word 0x73427b21
	.word 0x8eb2b962
	.word 0x2cf2ddd3
.align 64
	.word 0x26e3dcbf
	.word 0xc026cbda
	.word 0x6a9d0edc
	.word 0x4adcc73c
.align 32
	.word 0x35a7a223
	.word 0x3d055666
.align 16
	.word 0x82ecc664
	.word 0xe9823a23
.global  dtte_8kb_data_end
dtte_8kb_data_end:
		.word 0x4a30e390
		.word 0x8a8b7aea
.end


!!-----------------------------------------------------
!!      64kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_64KB_PG_BASE_DATA_ADDR     0x370000
#define ITTE_64KB_PG_BASE_DATA_ADDR_PA  0x370000

SECTION .ITTE_64KB_PAGE	DATA_VA=ITTE_64KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_DATA_ADDR, 
	RA=ITTE_64KB_PG_BASE_DATA_ADDR_PA,
	PA=ITTE_64KB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }



.data

.global  dtte_64kb_data_0
dtte_64kb_data_0: 
		.word 0xc4e3348b
		.word 0xa4a29d11
		.word 0x909c7c9c
		.word 0xcdb937df
		.word 0xf459c942
		.word 0x34a791a0
		.word 0x67343b71
		.word 0xbe075319
		.word 0x428b1e8c
		.word 0xeb65ef1c
		.word 0x24f8f099
		.word 0xa7d88f05
		.word 0x20d1be75
		.word 0xea214366
		.word 0xc91d281b
		.word 0x5c727032
.align 8192
.global  dtte_64kb_data_1
dtte_64kb_data_1: 
		.word 0x7cb8d442
		.word 0x27cbfe1b
		.word 0x4849dfcc
		.word 0xc17e5712
		.word 0x8fca3ce9
		.word 0xd17ca9f6
		.word 0x9047cede
		.word 0xcadbf200
		.word 0xe448aac3
		.word 0x8bb2d872
		.word 0xb13d12bc
		.word 0x9e9a4b84
		.word 0x87bbd07f
		.word 0x178ca3b3
		.word 0xbe58551a
		.word 0x747cf8d6
.align 8192
.global  dtte_64kb_data_2
dtte_64kb_data_2: 
		.word 0x381fc759
		.word 0x75b7eaa6
		.word 0x13bfbf47
		.word 0x34c72ca0
		.word 0xb7e8248c
		.word 0xcff8ab66
		.word 0x862b4ec5
		.word 0xb55eb208
		.word 0x231a7205
		.word 0xdbd01fe1
		.word 0x26f75f1a
		.word 0xc4f513ed
		.word 0xd3cafe58
		.word 0x936680bb
		.word 0x66f57ce8
		.word 0x8a05746f
.align 8192
.global  dtte_64kb_data_3
dtte_64kb_data_3: 
		.word 0x98237f7
		.word 0xb7939272
		.word 0x780ed63b
		.word 0x6b59d8b5
		.word 0x7cc007a0
		.word 0x9d0060c2
		.word 0x6b2cdc22
		.word 0x18b2ecea
		.word 0x6135de17
		.word 0x10ecc4a
		.word 0x1211e980
		.word 0x2598487
		.word 0x1da76915
		.word 0xa059ce6e
		.word 0x9d150323
		.word 0x91115ad7
.align 8192
.global  dtte_64kb_data_4
dtte_64kb_data_4: 
		.word 0x6aed2380
		.word 0xbfab977f
		.word 0x10510515
		.word 0x1858d7b8
		.word 0x4b9334db
		.word 0xeef4eb19
		.word 0x6408d132
		.word 0xeb59dc9e
		.word 0xc64253ff
		.word 0xb9435ecc
		.word 0xa60752fa
		.word 0x2cabdddd
		.word 0xd5c7a10b
		.word 0x6aea5efe
		.word 0x6db6ca8
		.word 0x3847cc26
.align 8192
.global  dtte_64kb_data_5
dtte_64kb_data_5: 
		.word 0x256baa98
		.word 0x552d1e0f
		.word 0x33d2183
		.word 0x129252
		.word 0xee981231
		.word 0x3275d1be
		.word 0xea9173
		.word 0xa56b2b5e
		.word 0x58ce8401
		.word 0x56f8e2cb
		.word 0xc42099d6
		.word 0xf97594b6
		.word 0xbdeaf5ce
		.word 0xe668f2dc
		.word 0x30bc2f94
		.word 0x10ac20b6
.align 8192
.global  dtte_64kb_data_6
dtte_64kb_data_6: 
		.word 0x5d66126
		.word 0x324adca4
		.word 0x454ec670
		.word 0x9dd4ed6d
		.word 0x3d6e6cd7
		.word 0xebc71241
		.word 0x284159a1
		.word 0x3a1183a3
		.word 0x9fb9b9a3
		.word 0xd9c7fde5
		.word 0x4cc6e9a1
		.word 0xde9ae21d
		.word 0x75c7c634
		.word 0xf0b48b8
		.word 0x10188344
		.word 0x9f1c791e
.align 8192
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
.align 4096
	.word 0xa4169e4d
	.word 0x15c62bfd
	.word 0xf482240b
	.word 0xb9c4da31
.align 2048
	.word 0x1347c942
	.word 0x7ddb3073
	.word 0xa0690fb9
	.word 0x1a4b2026
.align 1024
	.word 0xb0912baa
	.word 0xa1a1fffd
	.word 0xa8e96b27
	.word 0xcb945359
.align 512
	.word 0xcfedd052
	.word 0x22282d84
	.word 0xab323054
	.word 0xbb944e39
.align 256
	.word 0xc1ddcc73
	.word 0x88dc171c
	.word 0x5aa3cfc0
	.word 0xd4b9e608
.align 128
	.word 0x5fc3b327
	.word 0x8014665
	.word 0x952712f9
	.word 0xeeee5bdf
.align 64
	.word 0xcfe14c19
	.word 0x7f5ff333
	.word 0xb8771475
	.word 0xe42c59f5
.align 32
	.word 0x63dc817c
	.word 0x9d978c71
.align 16
	.word 0xe37260a2
	.word 0x1a330120
.align 8
.global  dtte_64kb_data_end
dtte_64kb_data_end:
		.word 0x5d0b93e
		.word 0x3a966b42
.end

!!-----------------------------------------------------
!!      512kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_512KB_PG_BASE_DATA_ADDR    0x380000
#define ITTE_512KB_PG_BASE_DATA_ADDR_PA 0x380000

SECTION .ITTE_512KB_PAGE	DATA_VA=ITTE_512KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_512KB_PAGE,
        VA=ITTE_512KB_PG_BASE_DATA_ADDR, 
	PA=ITTE_512KB_PG_BASE_DATA_ADDR_PA,
	RA=ITTE_512KB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_512kb_data_0
dtte_512kb_data_0: 
		.word 0x6334943b
		.word 0xc81dca9a
		.word 0x67800d7c
		.word 0x4b371468
		.word 0xb5fb0bdd
		.word 0xdbf24208
		.word 0x87b1838
		.word 0x2325abe9
		.word 0x92ec78da
		.word 0xa5c0dbb8
		.word 0x124d4648
		.word 0x17367eef
		.word 0x9f046f4b
		.word 0xd4066b2a
		.word 0x1826e591
		.word 0x1080c7ef
		.word 0x91e1416b
.align 8192
		.word 0x1bcffdd1
.align 8192
		.word 0x885d6275
.align 8192
		.word 0xc81f110e
.align 8192
		.word 0xca43bc23
.align 8192
		.word 0x66fb1e1a
.align 8192
		.word 0x5ead6889
.align 8192
		.word 0x29a8d8bf
.align 8192
.global  dtte_512kb_data_1
dtte_512kb_data_1: 
		.word 0xc6f598e0
		.word 0x2008c2ad
		.word 0x70b1da8b
		.word 0x3d8f5cb0
		.word 0xcec4b8ac
		.word 0x3d996df2
		.word 0x65bdd592
		.word 0x54c1aee6
		.word 0xc68e7c7c
		.word 0xdc0d41d6
		.word 0x1d773387
		.word 0x869a7926
		.word 0xd837cec6
		.word 0x5a2b0bce
		.word 0x847240d3
		.word 0x495c1297
		.word 0x623b257
.align 8192
		.word 0x2a5d8d1b
.align 8192
		.word 0x50e69959
.align 8192
		.word 0x92a5cba4
.align 8192
		.word 0xd836a62
.align 8192
		.word 0x7d468350
.align 8192
		.word 0xea060a7
.align 8192
		.word 0x8d979427
.align 8192
.global  dtte_512kb_data_2
dtte_512kb_data_2: 
		.word 0x5bf88fdb
		.word 0xf85b3511
		.word 0x42d04967
		.word 0x38075fc3
		.word 0x3bb2a805
		.word 0x3c36871c
		.word 0x3390201b
		.word 0x607dec91
		.word 0x69b7104a
		.word 0xbe88dd8d
		.word 0xda18cd09
		.word 0xb1e6cffe
		.word 0xd59b534a
		.word 0x9b4e4d5d
		.word 0xc5020173
		.word 0x239edf2
		.word 0x6de73b35
.align 8192
		.word 0x7477e22b
.align 8192
		.word 0xb0b3040b
.align 8192
		.word 0xa522be35
.align 8192
		.word 0x49d5355d
.align 8192
		.word 0x36bcfc3f
.align 8192
		.word 0x92af50a5
.align 8192
		.word 0x650c040e
.align 8192
.global  dtte_512kb_data_3
dtte_512kb_data_3: 
		.word 0xbd7cdb06
		.word 0xe2160aca
		.word 0xe7e0ff2e
		.word 0x323cdc2c
		.word 0x88dcb380
		.word 0x4b22672
		.word 0xa1ae25dc
		.word 0xeb1e44ca
		.word 0x53f58377
		.word 0xf44d500e
		.word 0xe0c5aaa6
		.word 0x988e840d
		.word 0x5e7abd89
		.word 0x83e557ae
		.word 0x4a6337f6
		.word 0x779a10b0
		.word 0x7dc0e819
.align 8192
		.word 0xc727afdd
.align 8192
		.word 0xa491489d
.align 8192
		.word 0x7547e0e2
.align 8192
		.word 0xcecc0c62
.align 8192
		.word 0xb9d2b129
.align 8192
		.word 0x32eb7f07
.align 8192
		.word 0xc3a1436e
.align 8192
.global  dtte_512kb_data_4
dtte_512kb_data_4: 
		.word 0x9ded82cf
		.word 0x6be911e3
		.word 0x26d2bbaf
		.word 0xb6fba71c
		.word 0x7081b088
		.word 0xbc3e9622
		.word 0x2f27a6d4
		.word 0x9a0cf457
		.word 0x75538a50
		.word 0xdd13c0e
		.word 0x93b7a16c
		.word 0xf4b95d0f
		.word 0xf134f08d
		.word 0xa1d2685a
		.word 0x4ad35159
		.word 0x5713c6e0
		.word 0x1eb838a8
.align 8192
		.word 0xfc77d712
.align 8192
		.word 0x8b453cda
.align 8192
		.word 0xf5f83373
.align 8192
		.word 0x88e87797
.align 8192
		.word 0x9de45496
.align 8192
		.word 0xa5522944
.align 8192
		.word 0xcb39cb24
.align 8192
.global  dtte_512kb_data_5
dtte_512kb_data_5: 
		.word 0x28a361b7
		.word 0x4ef482e5
		.word 0x80d430f0
		.word 0xded46de5
		.word 0x5710d3de
		.word 0xbbbc2f1e
		.word 0x521cc477
		.word 0x6b2bee61
		.word 0xd2e159b0
		.word 0x4744fb44
		.word 0x7d590b1c
		.word 0xa2615b64
		.word 0xc0be4531
		.word 0x25e76041
		.word 0x23f75689
		.word 0x8868fb79
		.word 0x7aeb2b9c
.align 8192
		.word 0x59a34c2d
.align 8192
		.word 0xe439dbe
.align 8192
		.word 0x1311ded4
.align 8192
		.word 0x37c1db72
.align 8192
		.word 0x266de0cf
.align 8192
		.word 0x245c3346
.align 8192
		.word 0x28da2b72
.align 8192
.global  dtte_512kb_data_6
dtte_512kb_data_6: 
		.word 0xafaf1fd5
		.word 0xbfbe1663
		.word 0xb1ff2aab
		.word 0x2779877e
		.word 0x8de7e516
		.word 0x14fa469d
		.word 0x7bc4212b
		.word 0xf5bd45f6
		.word 0x3a73928b
		.word 0xcc04e3ee
		.word 0xc45d5dab
		.word 0xcfe8398e
		.word 0x18a1ada6
		.word 0x3846e105
		.word 0xbab67beb
		.word 0xa48251d4
		.word 0xa7ce1a42
.align 8192
		.word 0xc57a8c98
.align 8192
		.word 0xc47616fa
.align 8192
		.word 0x7a26694
.align 8192
		.word 0x9eb88c40
.align 8192
		.word 0x3861e563
.align 8192
		.word 0xc6cb26ec
.align 8192
		.word 0x2e7ed57d
.align 8192
.global  dtte_512kb_data_7
dtte_512kb_data_7: 
		.word 0x80e8fe52
		.word 0xf0bfaa70
		.word 0xf8c605cb
		.word 0xa2b7d604
		.word 0xcae44216
		.word 0x1f9aab99
		.word 0x2a084fcb
		.word 0x2698a787
		.word 0x7290fd66
		.word 0x8f471e4b
		.word 0x6d9612c0
		.word 0xb7bafdb6
		.word 0x7e5ea8ee
		.word 0x1029fa8c
		.word 0x264600d4
		.word 0x7e4a4f2e
	.word 0x14c563fe
.align 8192
	.word 0x9e6a43e
.align 8192
	.word 0xdff59a74
.align 8192
	.word 0x6adaea66
.align 8192
	.word 0xe7ceb1a0
.align 8192
	.word 0xc4e764a4
.align 8192
	.word 0xb981838a
.align 8192
	.word 0x15a2f4ce
.align 4096
	.word 0xe2c472ed
	.word 0x30357825
.align 2048
	.word 0x66d177f1
	.word 0x4e21b835
.align 1024
	.word 0xb424b29c
	.word 0xab9db450
.align 512
	.word 0xb34a9325
	.word 0x8423e26a
.align 256
	.word 0x38ce15db
	.word 0x726b0a20
.align 128
	.word 0x92f1df3a
	.word 0x80d99b26
.align 64
	.word 0x8420661
	.word 0xe7d06880
.align 32
	.word 0x16b45f0f
	.word 0xa29d9428
.align 16
	.word 0xda16e9c3
	.word 0x3fafc310
.align 8
.global  dtte_512kb_data_end
dtte_512kb_data_end:
		.word 0x4de907c3
		.word 0x365a77a2
.end

!!-----------------------------------------------------
!!      4MB page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_4MB_PG_BASE_DATA_ADDR      0x400000
#define ITTE_4MB_PG_BASE_DATA_ADDR_PA   0x400000

SECTION .ITTE_4MB_PAGE	DATA_VA=ITTE_4MB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_4MB_PAGE,
        VA=ITTE_4MB_PG_BASE_DATA_ADDR, 
	PA=ITTE_4MB_PG_BASE_DATA_ADDR_PA,
	RA=ITTE_4MB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x3, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }



.data
.global  dtte_4mb_data_0
dtte_4mb_data_0: 
		.word 0x3385fa07
		.word 0xd5044129
		.word 0x47745d66
		.word 0x806e58d3
		.word 0x96a59376
		.word 0x3f11d91f
		.word 0xf73ca6f3
		.word 0x52c20af4
		.word 0x349a0bb6
		.word 0xafdcdbc5
		.word 0xec18ed7e
		.word 0x98c48258
		.word 0x26146617
		.word 0xed903435
		.word 0x1e543aa9
		.word 0x5a58a3ce
		.word 0x3b17792c
.align 8192
		.word 0xe5a15fd0
.align 8192
		.word 0x281ca5c
.align 8192
		.word 0x4ec62649
.align 8192
		.word 0x3171599e
.align 8192
		.word 0x47ed6283
.align 8192
		.word 0xbef623b4
.align 8192
		.word 0x6a46ac3
.align 8192
		.word 0x49e01e3c
.align 8192
		.word 0x29fa3b4c
.align 8192
		.word 0x5f044d3b
.align 8192
		.word 0xf1c06e5d
.align 8192
		.word 0xd3b65155
.align 8192
		.word 0x8b3c9cfc
.align 8192
		.word 0x155d905a
.align 8192
		.word 0x726d3aca
.align 8192
		.word 0xff44a349
.align 8192
		.word 0xdaf9ef3e
.align 8192
		.word 0xb1e5800b
.align 8192
		.word 0xccc078ee
.align 8192
		.word 0x8d93b25d
.align 8192
		.word 0xc35adbd7
.align 8192
		.word 0xf63336d2
.align 8192
		.word 0xf43309c1
.align 8192
		.word 0x5151fbcf
.align 8192
		.word 0x6bc2ec2e
.align 8192
		.word 0x3a13ffed
.align 8192
		.word 0xf37c979
.align 8192
		.word 0xc6874a2a
.align 8192
		.word 0xd2c5fb0f
.align 8192
		.word 0x15f2dfca
.align 8192
		.word 0x6cd8e0e8
.align 8192
		.word 0xbde034db
.align 8192
		.word 0x865c7eab
.align 8192
		.word 0x7f4bafb8
.align 8192
		.word 0xae8e4922
.align 8192
		.word 0x7a798503
.align 8192
		.word 0xdb83eee3
.align 8192
		.word 0xd287c0e1
.align 8192
		.word 0x6866562
.align 8192
		.word 0x73c938e
.align 8192
		.word 0x5588cbc5
.align 8192
		.word 0xc90d3a78
.align 8192
		.word 0xbac3d72d
.align 8192
		.word 0xa05af483
.align 8192
		.word 0x750c0856
.align 8192
		.word 0xe129a72e
.align 8192
		.word 0x1e01f0b8
.align 8192
		.word 0x1789039d
.align 8192
		.word 0xefaddd91
.align 8192
		.word 0x8b1365e9
.align 8192
		.word 0x2836986
.align 8192
		.word 0x2b7c261b
.align 8192
		.word 0xe76449b0
.align 8192
		.word 0xb9c4f1b7
.align 8192
		.word 0x57053955
.align 8192
		.word 0xe2ad5d4
.align 8192
		.word 0x2c23bfa9
.align 8192
		.word 0xab303500
.align 8192
		.word 0x4d49bd3a
.align 8192
		.word 0x4699c98d
.align 8192
		.word 0xb7e4cafb
.align 8192
		.word 0xb8775bfb
.align 8192
		.word 0xaa4e8b0a
.align 8192
.global  dtte_4mb_data_1
dtte_4mb_data_1: 
		.word 0xcbe2ce8e
		.word 0x4479aba9
		.word 0x57bbda63
		.word 0xe48196fc
		.word 0x8cd72772
		.word 0x30532e86
		.word 0xb4eb9869
		.word 0x92708f8c
		.word 0x8b68843f
		.word 0x838445b3
		.word 0x20ff7aec
		.word 0x9eb793a1
		.word 0x9220e7b6
		.word 0x2d482566
		.word 0x3e9dbae6
		.word 0x5aa2a6f1
		.word 0x35a30deb
.align 8192
		.word 0xec46e8ec
.align 8192
		.word 0x2b45c029
.align 8192
		.word 0x224788a4
.align 8192
		.word 0x1b22817
.align 8192
		.word 0x6d1103f0
.align 8192
		.word 0xc452734c
.align 8192
		.word 0xf913d037
.align 8192
		.word 0x29d901ac
.align 8192
		.word 0x330a03fd
.align 8192
		.word 0x9a7b3adf
.align 8192
		.word 0x9f2574a3
.align 8192
		.word 0xf6b5e2a9
.align 8192
		.word 0xcc7f6641
.align 8192
		.word 0xac4b17e5
.align 8192
		.word 0xcc8221bd
.align 8192
		.word 0x2371c32f
.align 8192
		.word 0x9b308593
.align 8192
		.word 0xcb889583
.align 8192
		.word 0xd1a3ffe0
.align 8192
		.word 0xf83ea454
.align 8192
		.word 0x5b58e4b6
.align 8192
		.word 0xca007ff4
.align 8192
		.word 0xb18d1c8
.align 8192
		.word 0xc0222237
.align 8192
		.word 0x4c9e58df
.align 8192
		.word 0x8ad096bf
.align 8192
		.word 0xba5a8cc0
.align 8192
		.word 0x2f0e9354
.align 8192
		.word 0xf658d874
.align 8192
		.word 0xad6eae2c
.align 8192
		.word 0xaed6cf00
.align 8192
		.word 0xea9e4919
.align 8192
		.word 0x7bc1f216
.align 8192
		.word 0x3a7bf3f3
.align 8192
		.word 0x188cd84f
.align 8192
		.word 0xe9c5b9
.align 8192
		.word 0x20f62fe1
.align 8192
		.word 0xff3b4b37
.align 8192
		.word 0x31ffe8f0
.align 8192
		.word 0x172afb3f
.align 8192
		.word 0x4f92eaf2
.align 8192
		.word 0xc67cf3b2
.align 8192
		.word 0x66b62abb
.align 8192
		.word 0x3a6ce7e5
.align 8192
		.word 0x2d5f5329
.align 8192
		.word 0x7c40f030
.align 8192
		.word 0x7c5a8889
.align 8192
		.word 0xd0a823a6
.align 8192
		.word 0xc917af2f
.align 8192
		.word 0x5774e041
.align 8192
		.word 0xaf1a17d5
.align 8192
		.word 0x55a23311
.align 8192
		.word 0x5d5e18ba
.align 8192
		.word 0x2a494129
.align 8192
		.word 0xf83bf89f
.align 8192
		.word 0x8deeb35f
.align 8192
		.word 0x1044390f
.align 8192
		.word 0xf0e54a1b
.align 8192
		.word 0x807ccf93
.align 8192
		.word 0x38ceb3c7
.align 8192
		.word 0x8b15c9c8
.align 8192
		.word 0xeffd7a6
.align 8192
		.word 0xe4a53e6b
.align 8192
.global  dtte_4mb_data_2
dtte_4mb_data_2: 
		.word 0x289bd011
		.word 0x7243ddd7
		.word 0x8a571a6f
		.word 0xc764fe90
		.word 0xfe31e069
		.word 0x14cd36ca
		.word 0x967fd20
		.word 0x9ff28207
		.word 0x97a35275
		.word 0xd802a4f
		.word 0xbe6175a0
		.word 0x52893e8b
		.word 0xf2b17fa9
		.word 0x3b36dbfb
		.word 0x6d5f3584
		.word 0xd4df06f5
		.word 0xc14394d9
.align 8192
		.word 0x9ff6cf46
.align 8192
		.word 0xddba6dc4
.align 8192
		.word 0x7f4b16e4
.align 8192
		.word 0xfeabdf0f
.align 8192
		.word 0xdde915da
.align 8192
		.word 0xa7f699b1
.align 8192
		.word 0x29dfb499
.align 8192
		.word 0x5134919e
.align 8192
		.word 0x2cb09e0c
.align 8192
		.word 0xfbb8526
.align 8192
		.word 0x6d618d22
.align 8192
		.word 0x186a5977
.align 8192
		.word 0x85f865aa
.align 8192
		.word 0x82ad01fe
.align 8192
		.word 0x51162eba
.align 8192
		.word 0x802c51ba
.align 8192
		.word 0x356b94f7
.align 8192
		.word 0x2d0400c5
.align 8192
		.word 0xfa15456f
.align 8192
		.word 0x3cee2d90
.align 8192
		.word 0xfae5c5f3
.align 8192
		.word 0x92d400b1
.align 8192
		.word 0x1d5e7e05
.align 8192
		.word 0xab12ab37
.align 8192
		.word 0x15c9fbde
.align 8192
		.word 0x2c230ad2
.align 8192
		.word 0xadb0331a
.align 8192
		.word 0x8d11a45e
.align 8192
		.word 0x32530eff
.align 8192
		.word 0x1a9ac88
.align 8192
		.word 0x8f39488a
.align 8192
		.word 0x4d7e4fb2
.align 8192
		.word 0xa59890a1
.align 8192
		.word 0x4b73a536
.align 8192
		.word 0xb802d914
.align 8192
		.word 0xa3787b8
.align 8192
		.word 0x472f6b5d
.align 8192
		.word 0x20f13b34
.align 8192
		.word 0xa2949a3d
.align 8192
		.word 0xe4552add
.align 8192
		.word 0xa7fdc39f
.align 8192
		.word 0x9e946c09
.align 8192
		.word 0x13211a74
.align 8192
		.word 0x3502e8ca
.align 8192
		.word 0x494ddc62
.align 8192
		.word 0x2f146bda
.align 8192
		.word 0x4b53d76
.align 8192
		.word 0x98aa10fd
.align 8192
		.word 0xb5a4043d
.align 8192
		.word 0x4925281c
.align 8192
		.word 0xe5b89af3
.align 8192
		.word 0x7dd13695
.align 8192
		.word 0x2297cea3
.align 8192
		.word 0x4517c190
.align 8192
		.word 0xbfc2a371
.align 8192
		.word 0x5431bd6c
.align 8192
		.word 0x40311d66
.align 8192
		.word 0x7bb43171
.align 8192
		.word 0x48a2af71
.align 8192
		.word 0x37f0a46a
.align 8192
		.word 0x834dbe7d
.align 8192
		.word 0xa7eb8de6
.align 8192
		.word 0x57b75ccf
.align 8192
.global  dtte_4mb_data_3
dtte_4mb_data_3: 
		.word 0x35e92118
		.word 0x59ca206
		.word 0x3b05a1bd
		.word 0xa593de6e
		.word 0xdcce073
		.word 0xc307ec8d
		.word 0x9de3cb5a
		.word 0xcab82214
		.word 0xbec70102
		.word 0xca37698e
		.word 0x151e56ed
		.word 0xff0af091
		.word 0xa08c1a2a
		.word 0xe8692238
		.word 0x7860c7e2
		.word 0x65136c27
		.word 0x4e92e4c1
.align 8192
		.word 0x78761c73
.align 8192
		.word 0x2abcc59d
.align 8192
		.word 0x93e19125
.align 8192
		.word 0x12d658e0
.align 8192
		.word 0x95b58624
.align 8192
		.word 0xb8f29f67
.align 8192
		.word 0x5f6b9cd4
.align 8192
		.word 0xb23b54fc
.align 8192
		.word 0xd5d0d0af
.align 8192
		.word 0x5f299ba2
.align 8192
		.word 0x7b207e97
.align 8192
		.word 0xbbc12237
.align 8192
		.word 0x6cbf80bd
.align 8192
		.word 0x18818644
.align 8192
		.word 0xcbcdb74d
.align 8192
		.word 0x964569f4
.align 8192
		.word 0xd449b63f
.align 8192
		.word 0x138a3282
.align 8192
		.word 0x6f94af9
.align 8192
		.word 0x241970a8
.align 8192
		.word 0x98dcb0b1
.align 8192
		.word 0xbe44e3cb
.align 8192
		.word 0x6cb6a8a5
.align 8192
		.word 0xa92fa9f7
.align 8192
		.word 0x286cd3a3
.align 8192
		.word 0x8e1ed1f7
.align 8192
		.word 0xf807ac82
.align 8192
		.word 0xbd85f9ff
.align 8192
		.word 0x91d4ef74
.align 8192
		.word 0x23933cc0
.align 8192
		.word 0xaf492054
.align 8192
		.word 0x1ae237ee
.align 8192
		.word 0x33dad261
.align 8192
		.word 0x1016c270
.align 8192
		.word 0xcc3c5e0c
.align 8192
		.word 0x783bc5da
.align 8192
		.word 0xd6fd65bd
.align 8192
		.word 0xf8d4eddc
.align 8192
		.word 0x2835f8b6
.align 8192
		.word 0xef8651d0
.align 8192
		.word 0x84b0db81
.align 8192
		.word 0xafe42f90
.align 8192
		.word 0xbf138f95
.align 8192
		.word 0x793f142d
.align 8192
		.word 0x55f1b007
.align 8192
		.word 0xdf23b64b
.align 8192
		.word 0xa1192f8b
.align 8192
		.word 0x4d5f1f2c
.align 8192
		.word 0x225f8412
.align 8192
		.word 0x2539daad
.align 8192
		.word 0x62f8e6be
.align 8192
		.word 0xb86a93c0
.align 8192
		.word 0x6c9d1311
.align 8192
		.word 0xf161122e
.align 8192
		.word 0xfa4d6e79
.align 8192
		.word 0x867dcfa4
.align 8192
		.word 0xa0c2c9a4
.align 8192
		.word 0x471c9d52
.align 8192
		.word 0x15fb0f4f
.align 8192
		.word 0x3ab6e8af
.align 8192
		.word 0xfa85c05f
.align 8192
		.word 0xe6cd651a
.align 8192
		.word 0xe3782385
.align 8192
.global  dtte_4mb_data_4
dtte_4mb_data_4: 
		.word 0x206b096c
		.word 0x7a8d1ecd
		.word 0x39b2bbbd
		.word 0xf630dbb1
		.word 0xf27c82ea
		.word 0xc18c2ab6
		.word 0x1069f498
		.word 0xb350299e
		.word 0x851fa7cf
		.word 0x845787a5
		.word 0x2cbb0762
		.word 0x6471f572
		.word 0xca9c4b3
		.word 0x6a906aa4
		.word 0x91afb2a3
		.word 0x75610112
		.word 0x59e6c9aa
.align 8192
		.word 0x61e8c649
.align 8192
		.word 0x42d5d166
.align 8192
		.word 0x96451dc5
.align 8192
		.word 0x97277922
.align 8192
		.word 0xdeafb2f6
.align 8192
		.word 0xfc64d82d
.align 8192
		.word 0x9acc9817
.align 8192
		.word 0xb2032fef
.align 8192
		.word 0xc785975b
.align 8192
		.word 0x3d09ad24
.align 8192
		.word 0x3225fdff
.align 8192
		.word 0xf9e59aa4
.align 8192
		.word 0x4a0bd53f
.align 8192
		.word 0xe69b4f9a
.align 8192
		.word 0x994da344
.align 8192
		.word 0x7431ec24
.align 8192
		.word 0xf95bfe80
.align 8192
		.word 0xa82e02ac
.align 8192
		.word 0x7384881b
.align 8192
		.word 0xb14a6978
.align 8192
		.word 0x94ed658
.align 8192
		.word 0x2921ef42
.align 8192
		.word 0x29fc8615
.align 8192
		.word 0x53645ee2
.align 8192
		.word 0x6b5ba2e1
.align 8192
		.word 0x9525713f
.align 8192
		.word 0xde1fe737
.align 8192
		.word 0x15fdd231
.align 8192
		.word 0xf75c92da
.align 8192
		.word 0x33f283f4
.align 8192
		.word 0xc798cb6a
.align 8192
		.word 0xac4b8656
.align 8192
		.word 0x9c0d3bab
.align 8192
		.word 0x581201d5
.align 8192
		.word 0x1a9f0015
.align 8192
		.word 0xc34b2437
.align 8192
		.word 0xce473a6
.align 8192
		.word 0x4d66ab6e
.align 8192
		.word 0x82592e08
.align 8192
		.word 0x728e9cc2
.align 8192
		.word 0x453b0c8f
.align 8192
		.word 0x65ed2997
.align 8192
		.word 0x3088819b
.align 8192
		.word 0x5a931845
.align 8192
		.word 0x7c5325e
.align 8192
		.word 0xa03d7ee6
.align 8192
		.word 0x3d843116
.align 8192
		.word 0x18c706fd
.align 8192
		.word 0xc57c7242
.align 8192
		.word 0x2b2d9c64
.align 8192
		.word 0xf3fc8553
.align 8192
		.word 0xf78826ec
.align 8192
		.word 0xdc74ade9
.align 8192
		.word 0xb3bc0d84
.align 8192
		.word 0xf15348a2
.align 8192
		.word 0xf9b92ef
.align 8192
		.word 0x35f67efe
.align 8192
		.word 0xa164ef50
.align 8192
		.word 0x27d1bfec
.align 8192
		.word 0xa62f2f0f
.align 8192
		.word 0x7ddcef3
.align 8192
		.word 0x4872a6e5
.align 8192
		.word 0x99e2921a
.align 8192
.global  dtte_4mb_data_5
dtte_4mb_data_5: 
		.word 0xed950617
		.word 0xf7e3a6ff
		.word 0x7cff0b21
		.word 0x86f841b7
		.word 0x90de6c65
		.word 0x74667c6a
		.word 0x9b70f59a
		.word 0x122f1cd3
		.word 0x285fc05
		.word 0xa5b47d08
		.word 0x78d6ed1
		.word 0xa243c72b
		.word 0x69b4bdfb
		.word 0x880fa002
		.word 0xc0f2e9a7
		.word 0x3865c286
		.word 0x34a014df
.align 8192
		.word 0x3bdb7edb
.align 8192
		.word 0x1e48420f
.align 8192
		.word 0x41ff9961
.align 8192
		.word 0xc8433caf
.align 8192
		.word 0x25e13ab2
.align 8192
		.word 0x1ed07304
.align 8192
		.word 0x5f048fce
.align 8192
		.word 0x869073e0
.align 8192
		.word 0xfd95f1c4
.align 8192
		.word 0x57af37bd
.align 8192
		.word 0xc4edfe98
.align 8192
		.word 0xd16321b6
.align 8192
		.word 0xc5148935
.align 8192
		.word 0xe3a0c1f
.align 8192
		.word 0x3c90bcab
.align 8192
		.word 0xbb3d8dd5
.align 8192
		.word 0x1243cf0f
.align 8192
		.word 0x6744073
.align 8192
		.word 0xc8953ab2
.align 8192
		.word 0x8471fd16
.align 8192
		.word 0xb4ae388a
.align 8192
		.word 0x538c1458
.align 8192
		.word 0x41e33501
.align 8192
		.word 0xad00479e
.align 8192
		.word 0x1820c08d
.align 8192
		.word 0xab1a0cfb
.align 8192
		.word 0x40fc1fb6
.align 8192
		.word 0x766e3c2d
.align 8192
		.word 0x607aaa75
.align 8192
		.word 0x6a42fa84
.align 8192
		.word 0x7d4db11a
.align 8192
		.word 0xee7264b3
.align 8192
		.word 0xf1702d14
.align 8192
		.word 0x68f060d3
.align 8192
		.word 0x8382e4c
.align 8192
		.word 0x98ae0028
.align 8192
		.word 0xf09e49fb
.align 8192
		.word 0x9a5a376b
.align 8192
		.word 0xf71a5e20
.align 8192
		.word 0x342c459c
.align 8192
		.word 0xe16e54fc
.align 8192
		.word 0x3e5834ae
.align 8192
		.word 0xd86f4644
.align 8192
		.word 0xe62a448d
.align 8192
		.word 0x152befea
.align 8192
		.word 0x6ba0184a
.align 8192
		.word 0xc22816a4
.align 8192
		.word 0xd80bf678
.align 8192
		.word 0xa6987ea2
.align 8192
		.word 0x1379a8f3
.align 8192
		.word 0x952ee70f
.align 8192
		.word 0x779855b2
.align 8192
		.word 0xb373574f
.align 8192
		.word 0x52c85952
.align 8192
		.word 0xd1a52b1a
.align 8192
		.word 0x7fdf8d77
.align 8192
		.word 0xa01e32e8
.align 8192
		.word 0x2dd5c83c
.align 8192
		.word 0xc33b0044
.align 8192
		.word 0x8bcb9743
.align 8192
		.word 0x4df9a1fd
.align 8192
		.word 0x63479027
.align 8192
		.word 0x32aba5a
.align 8192
.global  dtte_4mb_data_6
dtte_4mb_data_6: 
		.word 0x928cd960
		.word 0x348d89b3
		.word 0x3a5e19d9
		.word 0x1036521d
		.word 0x87199ac0
		.word 0x6c4ded0d
		.word 0x68416661
		.word 0xb2ba9a21
		.word 0xb010600c
		.word 0xa00c866c
		.word 0xeafc044b
		.word 0xd5c65df7
		.word 0xc9ba85fc
		.word 0xfc2bf558
		.word 0x613a40e
		.word 0x9c61cf8e
		.word 0xd1edace9
.align 8192
		.word 0x8b18480
.align 8192
		.word 0x17b1ffc9
.align 8192
		.word 0x9614e6d6
.align 8192
		.word 0x825fc99f
.align 8192
		.word 0xa19ecbff
.align 8192
		.word 0x6d480a2e
.align 8192
		.word 0xc58197a5
.align 8192
		.word 0x12eaef78
.align 8192
		.word 0x37ccb3e0
.align 8192
		.word 0x6ec098be
.align 8192
		.word 0x88d101de
.align 8192
		.word 0x4f7b27a5
.align 8192
		.word 0x30159ae4
.align 8192
		.word 0xb6f6fd36
.align 8192
		.word 0xa600ffcf
.align 8192
		.word 0x5e31e9ce
.align 8192
		.word 0x9f34a582
.align 8192
		.word 0x2794249
.align 8192
		.word 0x7a11b6db
.align 8192
		.word 0x96f009de
.align 8192
		.word 0x129c792e
.align 8192
		.word 0x39e4ff8e
.align 8192
		.word 0xcfe90e58
.align 8192
		.word 0x6f302f17
.align 8192
		.word 0x61e7e7de
.align 8192
		.word 0x6ea8f8bb
.align 8192
		.word 0x4abc30ba
.align 8192
		.word 0xf929286c
.align 8192
		.word 0x3dab4fc9
.align 8192
		.word 0x6e4fc13
.align 8192
		.word 0xe22d7af0
.align 8192
		.word 0x9cd0b20f
.align 8192
		.word 0xef95b371
.align 8192
		.word 0xe2c4b41d
.align 8192
		.word 0xcc4f7e0e
.align 8192
		.word 0x29cc8047
.align 8192
		.word 0x613ccde3
.align 8192
		.word 0x42496096
.align 8192
		.word 0xa9a3f72b
.align 8192
		.word 0xe3e8a387
.align 8192
		.word 0x62dfa73d
.align 8192
		.word 0x1841aaa7
.align 8192
		.word 0xa637e18c
.align 8192
		.word 0xc58799bc
.align 8192
		.word 0x761f6d71
.align 8192
		.word 0x3f6e085a
.align 8192
		.word 0xf16c0701
.align 8192
		.word 0x85f1a0e6
.align 8192
		.word 0x3a669547
.align 8192
		.word 0x27c3634a
.align 8192
		.word 0x6d0bb28f
.align 8192
		.word 0x71ae1eea
.align 8192
		.word 0x6db287a8
.align 8192
		.word 0x1aa4f69a
.align 8192
		.word 0xaa49694e
.align 8192
		.word 0x5a6b32a5
.align 8192
		.word 0x34f45f18
.align 8192
		.word 0x1f099827
.align 8192
		.word 0x4253cd94
.align 8192
		.word 0xafa4c244
.align 8192
		.word 0xbf817984
.align 8192
		.word 0xd0fe101
.align 8192
		.word 0xbeb31053
.align 8192
.global  dtte_4mb_data_7
dtte_4mb_data_7: 
		.word 0xa27d9ad2
		.word 0x1054e23d
		.word 0xa4c7e916
		.word 0xadc194bf
		.word 0x53527512
		.word 0xcc6ed844
		.word 0xdd308a30
		.word 0x1f98aa33
		.word 0xc7b7f38e
		.word 0xb2aff4c7
		.word 0xcd15e20
		.word 0xb9f48055
		.word 0x7911edef
		.word 0x9361b5eb
		.word 0x9e39ec3b
		.word 0x5420b977
		.word 0xf0039d8f
.align 8192
		.word 0xb27671cc
.align 8192
		.word 0xfa41ba05
.align 8192
		.word 0xc1313f40
.align 8192
		.word 0x2cdd7f4c
.align 8192
		.word 0xffa6f5c1
.align 8192
		.word 0x676c332c
.align 8192
		.word 0x1ce13d8b
.align 8192
		.word 0xba26fe9f
.align 8192
		.word 0xb93455e4
.align 8192
		.word 0x3c8e9cb7
.align 8192
		.word 0xc0ac678e
.align 8192
		.word 0xb1af3dec
.align 8192
		.word 0x2d78b0d1
.align 8192
		.word 0xcc05877f
.align 8192
		.word 0x8854eb3f
.align 8192
		.word 0xc771901a
.align 8192
		.word 0xfd9ebac
.align 8192
		.word 0x6faa75dd
.align 8192
		.word 0x7b4ab6f2
.align 8192
		.word 0x7d4f7766
.align 8192
		.word 0x5d5daa69
.align 8192
		.word 0xa391a8a4
.align 8192
		.word 0x348ef546
.align 8192
		.word 0xf06b3d74
.align 8192
		.word 0xbb4e0847
.align 8192
		.word 0xe1a34751
.align 8192
		.word 0x2ef8e342
.align 8192
		.word 0x8a0b78a7
.align 8192
		.word 0xf352d49c
.align 8192
		.word 0x21a25781
.align 8192
		.word 0x3c6f64ba
.align 8192
		.word 0x23a112b1
.align 8192
		.word 0x1c5b57d8
.align 8192
		.word 0x636737a3
.align 8192
		.word 0x21fcfaf7
.align 8192
		.word 0x950ea46d
.align 8192
		.word 0xcaf0e4c3
.align 8192
		.word 0x533a90ed
.align 8192
		.word 0xecda0196
.align 8192
		.word 0xf6e93aeb
.align 8192
		.word 0x7e4aba09
.align 8192
		.word 0xf598f493
.align 8192
		.word 0xd7e355b0
.align 8192
		.word 0x3d57d9cc
.align 8192
		.word 0x5dfff7f8
.align 8192
		.word 0xd7769836
.align 8192
		.word 0x6b1cb3b
.align 8192
		.word 0xe4b84ed0
.align 8192
		.word 0x36bcae87
.align 8192
		.word 0xb59de59a
.align 8192
		.word 0x4fe914af
.align 8192
		.word 0xbc852aad
.align 8192
		.word 0xb72b4799
.align 8192
		.word 0x103ad19c
.align 8192
		.word 0x9b00ec
.align 8192
		.word 0x861f322
.align 8192
		.word 0xf993d183
.align 8192
		.word 0xa502e62
.align 8192
		.word 0x4906335a
.align 8192
		.word 0x1fefe24a
.align 8192
		.word 0xeec6edcb
.align 8192
		.word 0x16f36cd3
.align 8192
	.word 0x9dc5ba51
.align 4096
	.word 0xed5ec735
	.word 0xcc026832
.align 2048
	.word 0xd2fe814a
	.word 0x29f927bb
.align 1024
	.word 0x7dd2dbb4
	.word 0xfbd9b9f5
.align 512
	.word 0x78aedf85
	.word 0xbd430ff8
.align 256
	.word 0xaef1a374
	.word 0x920cfd4e
.align 128
	.word 0x46a3c1e3
	.word 0xd5f61301
.align 64
	.word 0x9f75284d
	.word 0xf7dd1540
.align 32
	.word 0x1c1d2fce
	.word 0x52a6d3cf
.align 16
	.word 0x36c627dc
	.word 0x8a140d94
.align 8
.global  dtte_4mb_data_end
dtte_4mb_data_end:
		.word 0x44807775
		.word 0x68db81fd
.end


!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG1_BASE_DATA_ADDR     0x800000
#define RDM_8KB_PG1_BASE_DATA_ADDR_PA  0x800000
SECTION .RDM_8KB_PAGE1	DATA_VA=RDM_8KB_PG1_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE1
        VA=RDM_8KB_PG1_BASE_DATA_ADDR, 
	PA=RDM_8KB_PG1_BASE_DATA_ADDR_PA,
	RA=RDM_8KB_PG1_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }



.data
.global  dtte_8kb1_data_0
dtte_8kb1_data_0:
		.word 0xfe93064e
		.word 0x8fe4f71e
		.word 0xbb3e0ebe
		.word 0xef7d9ac
		.word 0xe2629a7e
		.word 0x2a36c444
		.word 0x12800f7b
		.word 0x900ebda6
		.word 0xc17f2742
		.word 0x4221e9c0
		.word 0x9c7c2db
		.word 0x5f30cfc5
		.word 0x38871602
		.word 0xbba0c7a4
		.word 0xe913f022
		.word 0xf761ab95
.align 1024
	.word 0x96b64689
	.word 0x32ef1e9e
.align 512
.global  dtte_8kb1_data_1
dtte_8kb1_data_1:
		.word 0xf890e29c
		.word 0xbd3a738
		.word 0xa0d4081f
		.word 0xc015157d
		.word 0x376e5acf
		.word 0xba43e8a
		.word 0xeddf0fd7
		.word 0xd8de92f4
		.word 0x8586deef
		.word 0xf3518c84
		.word 0x41520024
		.word 0xa647ef9c
		.word 0x3e471e96
		.word 0x26c376e5
		.word 0x107055b2
		.word 0x7b75443f
.align 1024
	.word 0x2efb5db4
	.word 0xf49700e
.align 512
	.word 0x3eb4cd73
	.word 0x91d9d853
.align 256
.global  dtte_8kb1_data_2
dtte_8kb1_data_2:
		.word 0x7a941ac3
		.word 0x1397f32d
		.word 0x107797f7
		.word 0x848974c3
		.word 0x7052643f
		.word 0x32df1e9e
		.word 0x9d73ee00
		.word 0x4059ef5
		.word 0x5cdf9155
		.word 0xb9c6108d
		.word 0x4539da55
		.word 0xf0750008
		.word 0xa55b51da
		.word 0xb6ace9df
		.word 0xeb124cd6
		.word 0x2537c5d
.align 1024
	.word 0xf526497e
	.word 0xac519b52
.align 512
	.word 0x66a8cad0
	.word 0xbd8dbf59
.align 256
	.word 0x50deaa40
	.word 0x9511e0e2
.align 128
.global  dtte_8kb1_data_3
dtte_8kb1_data_3:
		.word 0xa82f5092
		.word 0xf0e33f68
		.word 0x8e678224
		.word 0x47c70f6e
		.word 0xefe63840
		.word 0x1795fe44
		.word 0xa2ab024
		.word 0x4fde989b
		.word 0x253b39e6
		.word 0xb61f8976
		.word 0xb050b463
		.word 0x71c68f8
		.word 0x704fd8cf
		.word 0x2016ff1c
		.word 0x44a8cfa8
		.word 0x56a28463
.align 1024
	.word 0x24e8d217
	.word 0xe5ec1aed
.align 512
	.word 0xa0af2609
	.word 0xb8ab84aa
.align 256
.global  dtte_8kb1_data_4
dtte_8kb1_data_4:
		.word 0x3cd607f
		.word 0xa0d78f7a
		.word 0xbbc5d8e6
		.word 0x8b1bde74
		.word 0x20b66980
		.word 0xa2a12fb6
		.word 0x49914c19
		.word 0x46e81062
		.word 0xf45ae7a2
		.word 0xa9e0acb8
		.word 0x8cb70a6b
		.word 0xef8c2070
		.word 0x7d28260d
		.word 0x9a65ebbe
		.word 0x5c41fd49
		.word 0xdab30ba1
.align 1024
	.word 0xd309a160
	.word 0x18c23875
.align 512
.global  dtte_8kb1_data_5
dtte_8kb1_data_5:
		.word 0xeee5ebb7
		.word 0x80f30bdb
		.word 0x548da1c1
		.word 0x7bbd776
		.word 0xa4877483
		.word 0x376dd80f
		.word 0x2f0e234
		.word 0x4b09bd14
		.word 0xb0cf7be
		.word 0xbd72429c
		.word 0xc06cd930
		.word 0xe44d6c54
		.word 0xc2d02368
		.word 0x532ed9f5
		.word 0xc5c9766f
		.word 0xca1d423c
.align 1024
	.word 0xa84f176a
	.word 0x5d5b6f80
.align 512
	.word 0xb2ec6a05
	.word 0x8d51b150
.align 256
.global  dtte_8kb1_data_6
dtte_8kb1_data_6:
		.word 0xef3754c8
		.word 0x57b9a8c1
		.word 0x572d48b4
		.word 0x92ec3159
		.word 0x45d3ec16
		.word 0x53aafeb7
		.word 0x82d7217e
		.word 0xf116e768
		.word 0xfa8b9f2b
		.word 0x6b1ccf86
		.word 0x88b5587a
		.word 0xb8284a1a
		.word 0xbeb2ea14
		.word 0x40f16655
		.word 0x4612daeb
		.word 0xfd86461c
.align 1024
	.word 0x7dc1274b
	.word 0xd9171d79
.align 512
	.word 0x9e70008e
	.word 0x80f8a6f1
.align 256
	.word 0xc5374329
	.word 0x21ecfed2
.align 128
	.word 0xf7a4ae32
	.word 0x6fb2c7f2
.align 64
	.word 0xb79b298
	.word 0x78a68675
.align 32
	.word 0xe0698d8e
	.word 0xda58d196
.align 16
	.word 0x59c6a10c
	.word 0x29566b8b
.align 8
.global  dtte_8kb1_data_end
dtte_8kb1_data_end:
		.word 0x2f9c6e4e
		.word 0x54c506f3

!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG2_BASE_DATA_ADDR     0x802000
#define RDM_8KB_PG2_BASE_DATA_ADDR_PA  0x802000
SECTION .RDM_8KB_PAGE2	DATA_VA=RDM_8KB_PG2_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE2
        VA=RDM_8KB_PG2_BASE_DATA_ADDR, 
	PA=RDM_8KB_PG2_BASE_DATA_ADDR_PA,
	RA=RDM_8KB_PG2_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_8kb2_data_0
dtte_8kb2_data_0:
               .word 0x428c89b3
               .word 0x73629378
               .word 0x7341246e
               .word 0xc995e784
               .word 0xe0f4afea
               .word 0x62a1933f
               .word 0xe48177cb
               .word 0x84d6292c
               .word 0xd3b82af3
               .word 0xe6846324
               .word 0x8f03f8f7
               .word 0x29bce7b
               .word 0xa38d78e5
               .word 0xf1b52892
               .word 0x471acf4c
               .word 0x208bdd2f
.align 8192
.end

