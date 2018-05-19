// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_64kpg_mtest.s
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
!!      This file has the micro-code to test out 64kpg ptr
!!
!!-------------------------------------------------------------------------------
.global T0_fast_dmmu_miss
.global main

main:
	mov	0x0,	%l0
	setx	dtte_64kb_data_0,	%l0,	%l1
	mov	0x2,	%o0
	ld	[%l1],	%l2	
	nop

	mov	0x0,	%l0
	setx	dtte_64kb_data_1,	%l0,	%l1
	ld	[%l1],	%l2	
	nop

	mov	0x0,	%l0
	setx	dtte_64kb_data_2,	%l0,	%l1
	ld	[%l1],	%l2	
	nop

	mov	0x0,	%l0
	setx	dtte_64kb_data_3,	%l0,	%l1
	ld	[%l1],	%l2	
	nop

	mov	0x0,	%l0
	setx	dtte_64kb_data_4,	%l0,	%l1
	ld	[%l1],	%l2	
	nop

	mov	0x0,	%l0
	setx	dtte_64kb_data_5,	%l0,	%l1
	ld	[%l1],	%l2	
	nop

	mov	0x0,	%l0
	setx	dtte_64kb_data_6,	%l0,	%l1
	ld	[%l1],	%l2	
	nop

	mov	0x0,	%l0
	setx	dtte_64kb_data_end,	%l0,	%l1
	ld	[%l1],	%l2	
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
#define DMMU_MISS_TRAPPG_VA     0x1600000

SECTION .DMMU_MISS_TRAPPG       TEXT_VA = DMMU_MISS_TRAPPG_VA
attr_text {
        Name = .DMMU_MISS_TRAPPG,
        hypervisor
        }

.text
.global T0_fast_dmmu_miss

T0_fast_dmmu_miss:
        brnz     %o0,    custom_trap
        nop

#include "dmmu_miss_handler.s"
#include "dmmu_miss_handler_ext.s"

custom_trap:
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
wrtte1:	
#define TAG_ACCESS1	0x000000000036e044
#define DATA_IN1	0x800000010036e003
	 setx	TAG_ACCESS1,  %l0, %g4
	 setx	DATA_IN1, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte2:	
#define TAG_ACCESS2	0x0000000000370044
#define DATA_IN2	0xa000000100370003
	 setx	TAG_ACCESS2,  %l0, %g4
	 setx	DATA_IN2, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte3:	
#define TAG_ACCESS3	0x0000000000380044
#define DATA_IN3	0xc000000100380003
	 setx	TAG_ACCESS3,  %l0, %g4
	 setx	DATA_IN3, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte4:	
#define TAG_ACCESS4	0x0000000000400044
#define DATA_IN4	0xe000000100400003
	 setx	TAG_ACCESS4,  %l0, %g4
	 setx	DATA_IN4, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte5:	
#define TAG_ACCESS5	0x0000000000800044
#define DATA_IN5	0x8000000100800003
	 setx	TAG_ACCESS5,  %l0, %g4
	 setx	DATA_IN5, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte6:	
#define TAG_ACCESS6	0x0000000000802044
#define DATA_IN6	0x8000000100802003
	 setx	TAG_ACCESS6,  %l0, %g4
	 setx	DATA_IN6, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

dmiss_rtn:
	retry
	nop 	

!!-----------------------------------------------------
!!      64kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_64KB_PG_BASE_DATA_ADDR     0x370000
#define ITTE_64KB_PG_BASE_DATA_ADDR_PA  0x100370000

SECTION .ITTE_64KB_PAGE DATA_VA=ITTE_64KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_DATA_ADDR, PA=ITTE_64KB_PG_BASE_DATA_ADDR_PA,
        RA=ITTE_64KB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dtte_64kb_data_0
dtte_64kb_data_0: 
                .word 0xf19c2770
                .word 0xa37bd4d6
                .word 0x9830b8ea
                .word 0x9d855e40
                .word 0xe19cfe6d
                .word 0xb1e1b5bc
                .word 0xa859231c
                .word 0x6c8bc48
                .word 0xe874365e
                .word 0xf9e6d5c2
                .word 0x4614f305
                .word 0xa91a6840
                .word 0x9cef2476
                .word 0xa0d25465
                .word 0x9cef2476
                .word 0xa0d25465
                .word 0x1b9990eb
                .word 0x290cc2c4
.align 8192
.global  dtte_64kb_data_1
dtte_64kb_data_1:
                .word 0xa38dc847
                .word 0xee4b55a0
                .word 0xfd24090e
                .word 0x5bf8d37b
                .word 0x9d322987
                .word 0xe3f2065c
                .word 0xa210290d
                .word 0xab6da4ae
                .word 0x4e414e16
                .word 0xc71ff426
                .word 0xc798f87
                .word 0x8c01441a
                .word 0x97cf0c3f
                .word 0x6629ac22
                .word 0x1beb9205
                .word 0xa0f07d06
.align 8192
.global  dtte_64kb_data_2
dtte_64kb_data_2:
                .word 0x63e3d3d
                .word 0xc9a6d53f
                .word 0x108f1d16
                .word 0xa7379f96
                .word 0xc7531401
                .word 0x68e539ab
                .word 0x8993f2bb
                .word 0x929fe961
                .word 0xd54d9c32
                .word 0xe1fe7389
                .word 0xad84eb05
                .word 0xad84eb05
                .word 0x3ae26342
                .word 0x597ea575
                .word 0x994f30e1
                .word 0x740d1afc
                .word 0x77ba486b
.align 8192
.global  dtte_64kb_data_3
dtte_64kb_data_3: 
                .word 0x87299eee
                .word 0xac8a42d8
                .word 0x60ae05c3
                .word 0xd5ce4abf
                .word 0xbaa2705
                .word 0xf290ec20
                .word 0xb3453bf9
                .word 0xf4f9485f
                .word 0x42fc536c
                .word 0xa5dd22b1
                .word 0x18420d61
                .word 0xc7f04685
                .word 0x8432f561
                .word 0x1ae1b8b8
                .word 0xd5230c4
                .word 0xeccc591
.align 8192
.global  dtte_64kb_data_4
dtte_64kb_data_4: 
                .word 0x70575e30
                .word 0x18fa0d0
                .word 0x7a568615
                .word 0x8edfc261
                .word 0x5be267fc
                .word 0x186ec16f
                .word 0xc7df56d6
                .word 0x5ba2f8e5
                .word 0xd7b6c6bd
                .word 0x8bac0ba2
                .word 0x681b8ba
                .word 0x73e33bf1
                .word 0x7680e58c
                .word 0x1265c8fc
                .word 0x6b4df68c
                .word 0x8c97f654
.align 8192
.global  dtte_64kb_data_5
dtte_64kb_data_5:
                .word 0x1ee0d41e
                .word 0x39a54cb
                .word 0x87c9234f
                .word 0xfd89292a
                .word 0x3e07088d
                .word 0x51acb48d
                .word 0xa54a3ba5
                .word 0xd4267b6e
                .word 0xb9b4f95e
                .word 0x92b5c3a2
                .word 0x9ebd7974
                .word 0x5c072ed3
                .word 0x901ed3bf
                .word 0xdc0fe642
                .word 0x6ed6bdc6
                .word 0x4bb40dd3
.align 8192
.global  dtte_64kb_data_6
dtte_64kb_data_6:
                .word 0x283bd210
                .word 0x5bf677b0
                .word 0x85e634f0
                .word 0xe4d9a707
                .word 0xb1e6f6a4
                .word 0xb1e6f6a4
                .word 0xd3f167af
                .word 0x581098f6
                .word 0xfa1269b9
                .word 0xe30a2ec8
                .word 0xa558bb35
                .word 0x94deb62d
                .word 0x75d77b7
                .word 0x6a2a2203
                .word 0x3dc2e45e
                .word 0x222e1622
                .word 0x8650406a
.align 8192
        .word   0xaabbccdd
        .word   0xaabbccdd
        .word   0xaabbccdd
        .word   0xaabbccdd
.align 4096
        .word 0xa749319f
        .word 0xc6ec25a3
        .word 0x70c6f4ba
        .word 0xe15e3926
.align 2048
        .word 0x767c6c68
        .word 0xebd4744b
        .word 0x9e79e39a
        .word 0xf37346c2
.align 1024
        .word 0xebf57ab3
        .word 0xdeb48e21
        .word 0x4ae9bfc8
        .word 0xbfd2ac6b
.align 512
        .word 0xebf0c6a1
        .word 0x18423666
        .word 0x1f4cdd92
        .word 0xfaf593b5
.align 256
        .word 0x2a2764a4
        .word 0x43c6ce09
        .word 0x8ba8eae
        .word 0x654181f2
.align 128
        .word 0xb8588042
        .word 0xa40abb15
        .word 0xa64866a2
        .word 0xbd204ec7
.align 64
        .word 0x4a765119
        .word 0xd64b536a
        .word 0xb28ce166
        .word 0xe4886ffb
.align 32
        .word 0x653edc22
        .word 0x9983eaf
.align 16
        .word 0x61535047
        .word 0x879dae92
.align 8
.global  dtte_64kb_data_end
dtte_64kb_data_end:
                .word 0xf9c90539
                .word 0x95508386
.end

