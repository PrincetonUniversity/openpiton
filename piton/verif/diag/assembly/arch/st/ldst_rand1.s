// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ldst_rand1.s
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
/*
 * Use our own MMU miss handler
 */
!#define H_T0_fast_instr_access_MMU_miss         sam_fast_immu_miss
!#define H_T0_fast_data_access_MMU_miss          sam_fast_dmmu_miss
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

#define RDM_8KB_PG_BASE_DATA_ADDR_0     0x40018000
#define RDM_8KB_PG_BASE_DATA_ADDR_RA_0  0x40018000
#define RDM_8KB_PG_BASE_DATA_ADDR_1     0x4001a000
#define RDM_8KB_PG_BASE_DATA_ADDR_RA_1  0x4001a000

!!-------------------------------------------------------------------------------
!!
!!      This file has the micro-code to test out the MMU registers
!!
!!-------------------------------------------------------------------------------
.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

main:

	/* 
	 *********************************************
	 * consecutive random loads within one page
	 *********************************************
	 */
 cst_ld1page_0:
	set	0x0,	%l0
	setx	dtte_8kb_data_0, %l0, %l7
	ldx	[%l7+216], 	%o3 
	/* 
	 *********************************************
	 * consecutive random stores to one page
	 *********************************************
	 */
 cst_st1page_0:
	set	0x0,	%l0
	setx	dtte_8kb_data_0, %l0, %l7
	set	0x9e513309,	%l0	
	stx	%l0,	[%l7+728]
	/* 
	 *********************************************
	 * interleaved ld/sts from/to the same page
	 *********************************************
	 */
 cst_ldst1page_0:
	set	0x0,	%l0
	setx	dtte_8kb_data_0, %l0, %l7
	set	0xa75571e9,	%l0	
	stx	%l0,	[%l7+744]
	ldx	[%l7+704],	%o0
	/* 
	 *********************************************
	 * interleaved ld/sts from/to the same page
	 *********************************************
	 */
 itlvd_ldst1page_0:
	set	0x0,	%l0
	setx	dtte_8kb_data_1, %l0, %l7
	set	0x95a3b0a8,	%l0	
	stx	%l0,	[%l7+168]
	ldx	[%l7+192],	%o1
	/* 
	 *********************************************
	 * consecutive LDs from different pages
	 *********************************************
	 */
 cst_ldmulpage_0:
	set	0x0,	%l0
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x328, %l0, %i0		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x0C8, %l0, %i1		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x3F8, %l0, %i2		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x188, %l0, %i3		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x350, %l0, %i4		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x240, %l0, %i5		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x0A0, %l0, %i6		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x1F0, %l0, %l7		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x1C8, %l0, %o0		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x280, %l0, %o1		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x138, %l0, %o2		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x390, %l0, %o3		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x298, %l0, %o4		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x3C8, %l0, %o5		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x368, %l0, %l6		
	ldx	[%i0],	%l0
	ldx	[%i1],	%l0
	ldx	[%i2],	%l2
	ldx	[%i3],	%l2
	ldx	[%i4],	%l4
	ldx	[%i5],	%l4
	ldx	[%l6],	%l0
	ldx	[%l7],	%l0

	ldx	[%o0],	%l2
	ldx	[%o1],	%l2
	ldx	[%o2],	%l4
	ldx	[%o3],	%l4
	ldx	[%o4],	%l0
	ldx	[%o5],	%l4
	ldx	[%l6],	%l4
	ldx	[%l7],	%l6

	/* 
	 *********************************************
	 * consecutive STs to different pages
	 *********************************************
	 */
 cst_st2mulpage_0:
	set	0x0,	%l0
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x1E0, %l0, %i0		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x3D8, %l0, %i1		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x3E8, %l0, %i2		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x320, %l0, %i3		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x070, %l0, %i4		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x170, %l0, %i5		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x190, %l0, %i6		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x140, %l0, %l7		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x178, %l0, %o0		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x368, %l0, %o1		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x190, %l0, %o2		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x350, %l0, %o3		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x258, %l0, %o4		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x278, %l0, %o5		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x2B0, %l0, %l6		
	stx	%l0,	[%i0]
	stx	%l0,	[%i1]
	stx	%l0,	[%i2]
	stx	%l0,	[%i3]
	stx	%l0,	[%i4]
	stx	%l0,	[%i5]
	stx	%l0,	[%l6]
	stx	%l0,	[%l7]

	stx	%l0,	[%o0]
	stx	%l0,	[%o1]
	stx	%l0,	[%o2]
	stx	%l0,	[%o3]
	stx	%l0,	[%o4]
	stx	%l0,	[%o5]
	stx	%l0,	[%l6]
	stx	%l0,	[%l7]
	/* 
	 ***************************************************
	 * interleaved LDs , STs from/to different pages
	 ***************************************************
	 */
 cst_ldstmulpage_0:
	set	0x0,	%l0
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x1C0, %l0, %i0		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x010, %l0, %i1		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x188, %l0, %i2		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x030, %l0, %i3		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x238, %l0, %i4		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x160, %l0, %i5		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x300, %l0, %i6		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x030, %l0, %l7		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x358, %l0, %o0		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x3C0, %l0, %o1		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x268, %l0, %o2		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x1E8, %l0, %o3		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_1 + 0x370, %l0, %o4		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x240, %l0, %o5		
	setx	RDM_8KB_PG_BASE_DATA_ADDR_0 + 0x198, %l0, %l6		
	ldx	[%i0],	%l0
	ldx	[%i1],	%l0
	ldx	[%i2],	%l2
	ldx	[%i3],	%l2
	stx	%l0,	[%i0]
	stx	%l0,	[%i1]
	stx	%l0,	[%i2]
	stx	%l0,	[%i3]
	ldx	[%i4],	%l4
	ldx	[%i5],	%l4
	ldx	[%l6],	%l0
	ldx	[%l7],	%l0
	stx	%l0,	[%i4]
	stx	%l0,	[%i5]
	stx	%l0,	[%l6]
	stx	%l0,	[%l7]

	stx	%l0,	[%o0]
	stx	%l0,	[%o1]
	stx	%l0,	[%o2]
	stx	%l0,	[%o3]
	ldx	[%o0],	%l4
	ldx	[%o1],	%l0
	ldx	[%o2],	%l4
	ldx	[%o3],	%l4
	stx	%l0,	[%o4]
	stx	%l0,	[%o5]
	stx	%l0,	[%l6]
	stx	%l0,	[%l7]
	ldx	[%o4],	%l4
	ldx	[%o5],	%l0
	ldx	[%l7],	%l4
	ldx	[%l6],	%l4


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

/*
 * my handler for the fast_instr_mmu_miss
 */
sam_fast_immu_miss:
        ldxa [%g0] 0x51, %g1    ! read the 8k TSB ptr
        ldda [%g1] 0x24, %g4
        nop

        /* check the valid bit */
        srlx    %g5,    0x3f,   %l0
        brz     %l0,    immu_return     /* invalid entry */

        /* check the NFO bit, if set, ignore this call */
        srlx    %g5,    60,     %l0
        and     %l0,    0x1,    %l1
        brnz    %l1,    immu_return

        /* check the global bit */
        set     0x1,    %l0
        and     %l0,    %g5,    %l1
        brnz,a  %l1,    write_itte

chk_icontext:
        /*
         * For immu MISS, should be either
         * primary context or nucleus context
         */
        set     0x1fff, %l0
        and     %l0,    %g4,    %l1
        brz     %l1,    write_itte
        nop

        set     PCONTEXT,       %l2
        sub     %l2,    %l1,    %l3
        brz     %l3,    write_itte
        nop

immu_return:
        /*
         * reset the tl
         */
        retl    /*
                 * This context is not valid
                 * So, we need go back to the next instruction after
                 * the call, not the targeted instr_addr.
                 * Thats why i dont use done.
                 *
                 * Otherwise, pc = call_target_instr + 4 , which
                 * is invalid.
                 */
        nop

write_itte:
        mov  0x30, %l0
        stxa  %g4, [ %l0 ] 0x50 /* write to Tag access reg */
        stxa  %g5, [ %g0 ] 0x54 /* write to Data-in Reg */
        retry
        nop

/*
 * my handler for the fast_data_mmu_miss
 */
sam_fast_dmmu_miss:
        ldxa [%g0] 0x59, %g1    ! 8k ptr
        ldxa [%g0] 0x5b, %g4  /* D-TSB Direct Poiner Registers */
        ldda [%g1] 0x24, %g4
        /* check the valid bit */
        srlx    %g5,    0x3f,   %l0
        brz     %l0,    dmmu_return     /* invalid entry */
        /* check the global bit */
        set     0x1,    %l0
        and     %g5,    %l0,    %l1
        brnz,a  %l1,    write_dtte

chk_dcontext:
        /*
         * For immu MISS, should be either
         * primary context or nucleus context
         */
        set     0x1fff, %l0
        and     %l0,    %g4,    %l1
        brz     %l1,    write_dtte
        set     PCONTEXT,       %l2
        sub     %l2,    %l1,    %l3
        brz     %l3,    write_dtte
        set     SCONTEXT,       %l2
        sub     %l2,    %l1,    %l3
        brz     %l3,    write_dtte
        nop

dmmu_return:
        done    /* this context is not valid */
        nop

write_dtte:
        mov  0x30, %l0
        stxa  %g4, [ %l0 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
        retry
        nop

!!-----------------------------------------------------
!!      8kb page_0 size for I/D TTE
!!-----------------------------------------------------
SECTION .RDM_8KB_PAGE_0 DATA_VA=RDM_8KB_PG_BASE_DATA_ADDR_0
attr_data {
        Name = .RDM_8KB_PAGE_0,
        VA=RDM_8KB_PG_BASE_DATA_ADDR_0, PA=ra2pa(RDM_8KB_PG_BASE_DATA_ADDR_RA_0,0),
        RA=RDM_8KB_PG_BASE_DATA_ADDR_RA_0,
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dtte_8kb_data_0

dtte_8kb_data_0:
		.word 0x29eeca41
		.word 0x430e3679
		.word 0x14b28339
		.word 0xe31234c5
		.word 0xe7e00d1f
		.word 0x9c7a2f9a
		.word 0xd8b95739
		.word 0xb77962d6
		.word 0xf3a6b6b5
		.word 0x9cedbb50
		.word 0x99f8d92c
		.word 0x9900f436
		.word 0x736a5674
		.word 0x2c2f4fe8
		.word 0x7d2c4ae
		.word 0xeeedf919
		.word 0x2d9e6fb3
		.word 0x73401a3a
		.word 0xe3aedd4b
		.word 0x2133bc7e
		.word 0x709729d4
		.word 0xa61b54f9
		.word 0x29589542
		.word 0xa0d7dda4
		.word 0xa2f65ea4
		.word 0x7943414c
		.word 0x43c9dc8b
		.word 0xe7fa0cbc
		.word 0x4870ab07
		.word 0xc5cc949d
		.word 0x42255c1b
		.word 0x744e5edf
		.word 0x8c4065d4
		.word 0x18526fb0
		.word 0x402a166
		.word 0xa8546d42
		.word 0x8796a0fd
		.word 0x7b4a32f6
		.word 0x4552fe25
		.word 0xbd84b3a7
		.word 0xccb898f3
		.word 0x8ccfc422
		.word 0xe94e2059
		.word 0xd750e216
		.word 0x317a3648
		.word 0x807818fc
		.word 0xbd41a68f
		.word 0x1b6b15cc
		.word 0x3bac8595
		.word 0xc8411b76
		.word 0x880f3464
		.word 0xf2932d74
		.word 0xea21499d
		.word 0xd1933afc
		.word 0xbdd8cb4b
		.word 0x2d68ac94
		.word 0x3b530bb2
		.word 0x2dba3f10
		.word 0xc1136b8d
		.word 0x5db2e249
		.word 0xc9d34e57
		.word 0x15802f15
		.word 0xa7344191
		.word 0xdd784737
		.word 0x496c626
		.word 0x6ee636a
		.word 0xeface35d
		.word 0x855946ba
		.word 0xf851bcf4
		.word 0x1fe613ba
		.word 0x342f625c
		.word 0x3a31e760
		.word 0xbd950332
		.word 0x4182f691
		.word 0x497b3561
		.word 0x3249069b
		.word 0x7f7e1396
		.word 0x3c4fc633
		.word 0x8c803eeb
		.word 0x38b1bb2
		.word 0xa6d34cf9
		.word 0x9d7dbea9
		.word 0xb0b573aa
		.word 0x51b9b5f9
		.word 0x1f8f6682
		.word 0xdecd691b
		.word 0x9654e542
		.word 0xdc582a41
		.word 0x696d8204
		.word 0xf6e84865
		.word 0xc207354e
		.word 0xfbb12391
		.word 0x513980a4
		.word 0xabd03ae3
		.word 0x8fa4b4a7
		.word 0x89d80b15
		.word 0xd6be7dbf
		.word 0xbe02a58f
		.word 0x3752b2e5
		.word 0x2b447b56
		.word 0xc67940a
		.word 0x863abc4e
		.word 0xba7c225
		.word 0xc9d532ab
		.word 0x384550fa
		.word 0x29f7b86
		.word 0xd0e9f30c
		.word 0x6feb38ef
		.word 0x5c6c7a65
		.word 0x77df26f3
		.word 0xcd264d0c
		.word 0xf252c73
		.word 0xa4c90a68
		.word 0xb08361bb
		.word 0xd71106e5
		.word 0xda4dea36
		.word 0x44ca858b
		.word 0xd5e633bf
		.word 0x9a92436f
		.word 0xe3910553
		.word 0xadfd0f23
		.word 0xbbe19033
		.word 0xeddb5695
		.word 0x8a3ac1ba
		.word 0xfbf4dff7
		.word 0xf7d83170
		.word 0x151cd6a4
		.word 0xc5708622
		.word 0x20280326
		.word 0x64fde08
		.word 0x65b5fdc5
		.word 0x8ea9f93e
		.word 0xbac7d47
		.word 0x35426b1b
		.word 0xd03a1fc8
		.word 0x16823e2e
		.word 0x7b8f41d2
		.word 0xb5cc0fe8
		.word 0x6b313822
		.word 0x3bfc0438
		.word 0x78da9abd
		.word 0xa332dea6
		.word 0x6344d438
		.word 0x18ca5db7
		.word 0x45a8e66a
		.word 0x90ac7694
		.word 0x78daddde
		.word 0xb7db9253
		.word 0xaf0acfbf
		.word 0x3804434e
		.word 0xf3340a19
		.word 0x5826071
		.word 0x4e566496
		.word 0xb295dd62
		.word 0x363bf02c
		.word 0x3d6d61ed
		.word 0x8de6ae58
		.word 0x91346023
		.word 0xbe950cd2
		.word 0x1638806
		.word 0x8ba9b0e4
		.word 0x97d0c8bc
		.word 0x7f4b35c7
		.word 0x87b7e299
		.word 0xa154f3b4
		.word 0x943eb287
		.word 0x8a3b418d
		.word 0x10d62692
		.word 0x3cf6f942
		.word 0xd98049f
		.word 0xa7e6e76c
		.word 0xe36ca79f
		.word 0x3f1e48a8
		.word 0x88b564b3
		.word 0x69581bb9
		.word 0x35cfb925
		.word 0x9c34ed86
		.word 0xf3a831d
		.word 0x2f276c5b
		.word 0xa47daa77
		.word 0xff399227
		.word 0x17129432
		.word 0x3fed218a
		.word 0x9069d245
		.word 0x82ed97e6
		.word 0xf92a8adb
		.word 0xfe9d26da
		.word 0x1f285d52
		.word 0xc621d1ce
		.word 0xccfbe864
		.word 0x8aca0078
		.word 0xb27bd469
		.word 0xe41c580
		.word 0xc4543594
		.word 0x1cb50b2
		.word 0xcf608d91
		.word 0x62d79659
		.word 0x64f278fd
		.word 0x6c88b1bc
		.word 0x55c17c7f
		.word 0x7bc0fed3
		.word 0x2d553e94
		.word 0x5a71e7b0
		.word 0xcc5164b
		.word 0x946ffc2b
		.word 0x14a90483
		.word 0xbb39aed6
		.word 0x4b583c66
		.word 0x2f181044
		.word 0xc470213d
		.word 0xb678aa25
		.word 0x848862cc
		.word 0x25533dcb
		.word 0x927a76d3
		.word 0xceb2360a
		.word 0xca9d6575
		.word 0xed8229b
		.word 0xe4548786
		.word 0x548d2367
		.word 0xb5f6c110
		.word 0xac8cd461
		.word 0x57babf9c
		.word 0x1bae9edd
		.word 0x3cb722f3
		.word 0x2cd86383
		.word 0x77170876
		.word 0x14c5c84e
		.word 0xd984844c
		.word 0x6fcf283d
		.word 0xe2dbf8e2
		.word 0x3c3abe9d
		.word 0x4152449c
		.word 0xfcf43e0d
		.word 0x41f236ae
		.word 0x8adc23b7
		.word 0xed8df766
		.word 0xd30cd151
		.word 0x61a1dd7d
		.word 0xe2125cd7
		.word 0xf05ed923
		.word 0x3328232d
		.word 0x29aafedd
		.word 0x67d01305
		.word 0x1f331f78
		.word 0xbcc967b2
		.word 0x38dd8f97
		.word 0x53ebb7df
		.word 0x4bd598aa
		.word 0xc04ee23c
		.word 0x82b25649
		.word 0xb906129b
		.word 0x68f94e51
		.word 0x5883e41b
		.word 0x546baf32
		.word 0x82de194b
		.word 0x6bd01f4b
.align 8192
.end

!!-----------------------------------------------------
!!      8kb page_1 size for I/D TTE
!!-----------------------------------------------------
SECTION .RDM_8KB_PAGE_1 DATA_VA=RDM_8KB_PG_BASE_DATA_ADDR_1
attr_data {
        Name = .RDM_8KB_PAGE_1,
        VA=RDM_8KB_PG_BASE_DATA_ADDR_1, PA=ra2pa(RDM_8KB_PG_BASE_DATA_ADDR_RA_1,0),
        RA=RDM_8KB_PG_BASE_DATA_ADDR_RA_1,
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dtte_8kb_data_1

dtte_8kb_data_1:
		.word 0x4b019174
		.word 0x95e394d
		.word 0x6b329a63
		.word 0xc1c84f3
		.word 0xaadc9069
		.word 0x76ec0a0
		.word 0x79567a78
		.word 0x2e7df793
		.word 0xf05c0677
		.word 0x8fd3f9d5
		.word 0x37a48a4a
		.word 0x7cbaa616
		.word 0x7d588820
		.word 0x89ffe309
		.word 0xe14c3904
		.word 0x1cc07501
		.word 0xea7dec9
		.word 0xc87ddde3
		.word 0xa2c0a6c1
		.word 0x744278a4
		.word 0x41e4c8e4
		.word 0xcecfd6e8
		.word 0xa3a7db52
		.word 0xc3775e8c
		.word 0x5a301851
		.word 0xd5260e0e
		.word 0xfac0253e
		.word 0x20d07a3b
		.word 0xb07ad301
		.word 0x8072548e
		.word 0x2f0de509
		.word 0xf8c8691a
		.word 0x82bf39dc
		.word 0x6c10d3fe
		.word 0x560448b9
		.word 0xd36381ae
		.word 0xb88d9e5
		.word 0x734db29e
		.word 0xc87fbb95
		.word 0x63eb820a
		.word 0x3e8a0b9a
		.word 0x75b028f1
		.word 0x68910e2f
		.word 0x22133184
		.word 0x29ff84a0
		.word 0xbe68dc8f
		.word 0x64849aa5
		.word 0x2545e9ab
		.word 0xa588df9f
		.word 0xfeca9439
		.word 0xa880e923
		.word 0x2eb23a78
		.word 0xa0273e6b
		.word 0xfa91992e
		.word 0xebcc98ab
		.word 0xabde1dc2
		.word 0x66816a63
		.word 0x3c2f59bc
		.word 0xa1839018
		.word 0xa5866df7
		.word 0xa29f171e
		.word 0xdc952119
		.word 0x7a7fbb5f
		.word 0x9c729408
		.word 0x85432b43
		.word 0x2651f873
		.word 0x87b9d918
		.word 0x1300a0a5
		.word 0x892733b7
		.word 0x7c850544
		.word 0x1dab1c3c
		.word 0x2dbd44aa
		.word 0xffd864fe
		.word 0xe466f8eb
		.word 0x1280a630
		.word 0x629e5cd8
		.word 0x2918ceda
		.word 0x21426578
		.word 0xce7e1d02
		.word 0x84ae04c8
		.word 0xeeada638
		.word 0xd7dc0bc7
		.word 0x67fce1f1
		.word 0xb45f651b
		.word 0x99adc94c
		.word 0x54c976cf
		.word 0xef49ac32
		.word 0x6aa5b0f6
		.word 0x71f1e1fa
		.word 0x9a45783b
		.word 0x6a7a8bf1
		.word 0x397906ad
		.word 0x5679ca77
		.word 0x5af75a3a
		.word 0x5a739995
		.word 0x2efc27bd
		.word 0x4b11830
		.word 0xa91ada93
		.word 0x8f0d548
		.word 0x74313c00
		.word 0x1eb6f0ea
		.word 0xe1c442fb
		.word 0x27cffab6
		.word 0xa45b141b
		.word 0x9c6b8e2a
		.word 0xcbdd32aa
		.word 0x4c3d4d14
		.word 0xa0b9f3a
		.word 0x624812d6
		.word 0xe72bed2b
		.word 0xa9129f63
		.word 0xf1b787ff
		.word 0x522b971b
		.word 0x7a804273
		.word 0xbae81cf5
		.word 0x52b22cb7
		.word 0x87928e91
		.word 0x5e3e6435
		.word 0xc24a9630
		.word 0x5df466ce
		.word 0x305bec9d
		.word 0xab313c74
		.word 0x55835591
		.word 0xf143d584
		.word 0xd791ab17
		.word 0x12131959
		.word 0xaf99c0f3
		.word 0x54779fe1
		.word 0x26e0972c
		.word 0x77d4c246
		.word 0xddf74b11
		.word 0x10f2e1e6
		.word 0x67c58884
		.word 0xa2984a2a
		.word 0x7d9a7949
		.word 0xa03c3904
		.word 0x153466a6
		.word 0xfcd63317
		.word 0x544e01a2
		.word 0x511d23d2
		.word 0xebdfa09b
		.word 0x3c78b711
		.word 0xf6254510
		.word 0x422b28f9
		.word 0x508cfad1
		.word 0xac224a27
		.word 0x93cfa9f6
		.word 0x847f972
		.word 0xf34ed742
		.word 0xda91a9c7
		.word 0x87689aeb
		.word 0x56c501f3
		.word 0xa475bd5
		.word 0x10670d4e
		.word 0xc3822dc0
		.word 0x48aa1fa6
		.word 0xb90d1b04
		.word 0x74b34bdf
		.word 0xb784b6c2
		.word 0x36666c1c
		.word 0x811f22be
		.word 0xa5f30b75
		.word 0xdd5dcc3c
		.word 0xfc2d5480
		.word 0x5650958e
		.word 0x7ca54d3a
		.word 0xb1d7e3f
		.word 0x5ab1700f
		.word 0xf5f231fb
		.word 0xffcdeb18
		.word 0xe7c8c6a4
		.word 0x8111c9c7
		.word 0xdb026c32
		.word 0x6fa9da90
		.word 0xe1947551
		.word 0x9ae5915e
		.word 0xf312fde2
		.word 0xe8e448cb
		.word 0x9d2c1cbc
		.word 0x6b9d6775
		.word 0x891d1067
		.word 0xff8e3ee
		.word 0xaddcc2ad
		.word 0x30b90d
		.word 0x936b652a
		.word 0x9260e5b2
		.word 0x25b35947
		.word 0x7480de39
		.word 0x32542046
		.word 0xeedb332
		.word 0x1f1b4448
		.word 0xca42f015
		.word 0x1cf2196f
		.word 0x298d2607
		.word 0x37896e8f
		.word 0x26dc89f6
		.word 0x81a7d70f
		.word 0x8de0d291
		.word 0x4084b3de
		.word 0x3baee9e2
		.word 0x703497b1
		.word 0x60d2df97
		.word 0x6a24a2e1
		.word 0x940f2442
		.word 0xccc60da2
		.word 0xe0e84312
		.word 0x542bdb6f
		.word 0x6ce15ed6
		.word 0x84f7b0d5
		.word 0x90b97845
		.word 0xc9738d0e
		.word 0x2eb846e8
		.word 0xe35acb07
		.word 0x6bf80311
		.word 0x30b1d9bc
		.word 0xb3b936c4
		.word 0x6a30a223
		.word 0x16f85486
		.word 0xbdfd20ec
		.word 0xf198be66
		.word 0x34b264e6
		.word 0x481ce4bd
		.word 0x360a76ce
		.word 0x250a8375
		.word 0x5d8bdc6
		.word 0x82f895e4
		.word 0x2f45cbd3
		.word 0x223aac70
		.word 0x8e4f300f
		.word 0x9bcbb499
		.word 0x81c68870
		.word 0x54964b26
		.word 0x1f5da34f
		.word 0xf060297c
		.word 0x5e0ba121
		.word 0x528b7a6b
		.word 0xa854c0f4
		.word 0x367eafff
		.word 0xe79666b0
		.word 0xbf412308
		.word 0x15b00833
		.word 0xa980267f
		.word 0x542b96b6
		.word 0xbfd19bf3
		.word 0xaeeabc2a
		.word 0xd1b4b98
		.word 0x56f67062
		.word 0x3a9299bf
		.word 0x331048
		.word 0xccc07cb4
		.word 0xf041d179
		.word 0xd0a82155
		.word 0xf9f936ec
		.word 0xa9da49e5
		.word 0xc3379f9d
		.word 0x5bc771e4
.align 8192
.end

!!-----------------------------------------------------
!!      8kb page_2 size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG_BASE_DATA_ADDR_2     0x2001c000
#define RDM_8KB_PG_BASE_DATA_ADDR_RA_2  0x2001c000
SECTION .RDM_8KB_PAGE_2 DATA_VA=RDM_8KB_PG_BASE_DATA_ADDR_2
attr_data {
        Name = .RDM_8KB_PAGE_2,
        VA=RDM_8KB_PG_BASE_DATA_ADDR_2, PA=ra2pa(RDM_8KB_PG_BASE_DATA_ADDR_RA_2,0),
        RA=RDM_8KB_PG_BASE_DATA_ADDR_RA_2,
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data

.global  dtte_8kb_data_2

dtte_8kb_data_2:
		.word 0xe00e364c
		.word 0x3962f2f4
		.word 0x835701d1
		.word 0x3eea1a15
		.word 0x2ee0a798
		.word 0x7fac21ba
		.word 0x57562e3b
		.word 0x800ac83
		.word 0xf5a3c45e
		.word 0x793775ad
		.word 0xaf2cd02c
		.word 0x6db7c76a
		.word 0x1a0f662f
		.word 0x5653b4bd
		.word 0xbb504a5d
		.word 0x4659639e
		.word 0x442ddc83
		.word 0xb61bb560
		.word 0xb3fb597b
		.word 0x86ff9ebd
		.word 0xa896bcd9
		.word 0xb1b155eb
		.word 0x74eedae6
		.word 0xfbed74a7
		.word 0xcbc41122
		.word 0xb601524
		.word 0xa4b1bbb4
		.word 0x3f351c2e
		.word 0x8c21885f
		.word 0x2bf82014
		.word 0xfa3253fb
		.word 0x711afb0a
		.word 0x84b8d88
		.word 0xac6be920
		.word 0x90bb24f
		.word 0x891f650f
		.word 0x3dee68b0
		.word 0x37c79c5a
		.word 0xdfd59b89
		.word 0x5e889aa1
		.word 0xd213ce65
		.word 0x6b3b0514
		.word 0x4d0e42ca
		.word 0x16e9ba67
		.word 0x47af815c
		.word 0xa463b8b6
		.word 0xaa98fdbf
		.word 0xc7ba9a3e
		.word 0xd321ea4e
		.word 0x228e9ad1
		.word 0xfdbd7925
		.word 0x40dfbb70
		.word 0xf371ca1c
		.word 0x8b850e73
		.word 0x2e47318f
		.word 0x1840ce25
		.word 0x626c6a39
		.word 0x68eb68bc
		.word 0x3b1d3467
		.word 0xcd7f7819
		.word 0xc5edef48
		.word 0x57b78b1
		.word 0x11a66d32
		.word 0xcfc7528e
		.word 0xbc89b203
		.word 0xbabf3850
		.word 0xf7cf0317
		.word 0x21cb5384
		.word 0x70e4c25f
		.word 0x1d9cfae3
		.word 0x2c78aa1
		.word 0x88941627
		.word 0x3f92f8ed
		.word 0xfb47ac99
		.word 0x96df0fc3
		.word 0x9405b689
		.word 0x3d693a83
		.word 0x63af751
		.word 0x63653c1c
		.word 0x4b3b3491
		.word 0x863dd21b
		.word 0xc51460b9
		.word 0x38921d7d
		.word 0xf6409232
		.word 0x483a04fa
		.word 0x7897b597
		.word 0xb94550a7
		.word 0xf19420df
		.word 0xfc6e4514
		.word 0x843e5666
		.word 0x8f469458
		.word 0xf16ab23d
		.word 0x4c8ca5ae
		.word 0x82963924
		.word 0xface0888
		.word 0xd239a01a
		.word 0xcdc37645
		.word 0xbdaeb46a
		.word 0x65ba9def
		.word 0x74c4df9d
		.word 0x23ec27ae
		.word 0xc11e67bc
		.word 0xe44179cb
		.word 0xd1e93bf
		.word 0xdce0df7e
		.word 0x380ed522
		.word 0x184951df
		.word 0x50e8d2f9
		.word 0x940d5dab
		.word 0x2b6f7ff7
		.word 0xde5104be
		.word 0x9901943e
		.word 0xc8761873
		.word 0xf43ba500
		.word 0x22f0f249
		.word 0x10cbf72c
		.word 0x7dbab27c
		.word 0x20dadfc0
		.word 0xa2fad875
		.word 0xa0c95b7d
		.word 0xe1472f3c
		.word 0x4565109
		.word 0x8e343851
		.word 0x4667fbc3
		.word 0x239899a
		.word 0x5fa11ad6
		.word 0xb9e38747
		.word 0xd713ff54
		.word 0x5ab790d5
		.word 0x59cc4558
		.word 0x7528b0a1
		.word 0xcbf33782
		.word 0xbecb2fa5
		.word 0xe8eb614e
		.word 0x199dab4f
		.word 0x2582fc0f
		.word 0xed99819f
		.word 0x93f07b99
		.word 0x174427e6
		.word 0xedd2dadf
		.word 0xd02b5add
		.word 0x9b1b360f
		.word 0xb7919aec
		.word 0x848e0eef
		.word 0x9b4425dd
		.word 0xb200198f
		.word 0xe8bb2752
		.word 0xcb0f285
		.word 0xea2e3ba9
		.word 0x78ea7554
		.word 0x94772d41
		.word 0xd7e6e0a9
		.word 0x3d321a38
		.word 0x4cac5f8e
		.word 0xdc828119
		.word 0xa6039d3
		.word 0x71e01d14
		.word 0x2915ab2e
		.word 0xdf938eb6
		.word 0x62b77fe5
		.word 0x13aa9c3c
		.word 0xa483e701
		.word 0xb345ecf4
		.word 0xbf77bd5b
		.word 0x32c8954b
		.word 0x378aba00
		.word 0x1f2d2575
		.word 0xc645abc0
		.word 0x943742d8
		.word 0x63d530e5
		.word 0x72e5b4a1
		.word 0xcad04d63
		.word 0xfa334620
		.word 0x655d101
		.word 0xe8e785ed
		.word 0x84c4ee4b
		.word 0x4ee846e2
		.word 0x6be4844c
		.word 0x4a4d7060
		.word 0x474dc067
		.word 0x1da02d8a
		.word 0x29c6b2bd
		.word 0x98f97753
		.word 0xb1618709
		.word 0xdfa95b91
		.word 0x668f1cdc
		.word 0xdb5d378
		.word 0x579e0595
		.word 0xb3bd8623
		.word 0x20884b95
		.word 0xa36f081c
		.word 0xcdce2575
		.word 0x87291701
		.word 0x1eb5a94e
		.word 0x27a388b0
		.word 0x2d8074f
		.word 0x118d37a8
		.word 0xf5a4983a
		.word 0x8ee9b285
		.word 0xd4de737a
		.word 0x3514eab3
		.word 0xd30819ef
		.word 0x53351ed6
		.word 0x90245dad
		.word 0xef97d77d
		.word 0x5faedc36
		.word 0x6490910b
		.word 0x18f86ff9
		.word 0x83abac0a
		.word 0xd00cbf21
		.word 0xb492053c
		.word 0x6ad9d0f8
		.word 0x754f3926
		.word 0x5d8e2863
		.word 0x6522a2f3
		.word 0xec669946
		.word 0x62e8acce
		.word 0x9f7cb7db
		.word 0xec8c9835
		.word 0x9bb7ac30
		.word 0x4b028ecf
		.word 0x26a23171
		.word 0x1f5d20c3
		.word 0xd4e7ab
		.word 0xf7c963ad
		.word 0x44fb025
		.word 0x94c93d9d
		.word 0xf27df88
		.word 0xbd0619c6
		.word 0x813c7665
		.word 0x9827e0c7
		.word 0xa8297e4
		.word 0x826fa4b5
		.word 0xcc10ef9e
		.word 0x29fc914e
		.word 0x33b2f2e4
		.word 0xecf06afb
		.word 0x37a7b714
		.word 0x1139cb8d
		.word 0x7af2c5a2
		.word 0xf42269dc
		.word 0x3757b7f6
		.word 0xca12a1ac
		.word 0xf70fc862
		.word 0x80f3386
		.word 0x7137baac
		.word 0x1f276069
		.word 0x1625d608
		.word 0x3c6f2b78
		.word 0x5c7cf374
		.word 0x54513c1a
		.word 0xcb792ece
		.word 0x7c75a521
		.word 0x2a1b662c
		.word 0x2c0d49f2
		.word 0xbca5b231
.align 8192
.end


