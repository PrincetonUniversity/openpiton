// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ldst_quad2.s
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
!!
/*

        
        This diag tests out quad loads and stores
        All quads accesses are done with ldda or stda to
        the following ASIs:
                22 ASI_AS_IF_USER_PRIMARY_QUAD_LDD
                23 ASI_AS_IF_USER_SECONDARY_QUAD_LDD
                24 ASI_NUCLEUS_QUAD_LDD
                2A ASI_ASI_IF_USER_PRIMARY_QUAD_LDD_LITTLE
                2B ASI_AS_IF_USER_SECONDARY_QUAD_LDD_LITTLE
                2C ASI_NUCLEUS_QUAD_LDD_LITTLE
                E2 ASI_PRIMARY_QUAD_LDD
                E3 ASI_SECONDARY_QUAD_LDD
                EA ASI_PRIMARY_QUAD_LDD_LITTLE
                EB ASI_SECONDARY_QUAD_LDD_LITTLE

        The diag needs to test the following functionality:
        1) Simple loads and stores (whether it works at all) to all quad ASIs
        2) Simple quad RAW (stq followed by ldq)
        3) Alignment.  All accesses must be 128 bit aligned
        4) Only LDDA/STDA can access above ASIs
        5) Interaction with other size ld/st
                - stx to upper or lower half of quad followed by ldq                            
                - stq followed by ldx from upper or lower half
                - similar tests for other sizes
        6) Interaction with L1.  Quads do not allocate in the L1 but will load
                from it.  Because the D$ lines are 16B there are no partial hits for
                quads.
                - stq to an address that is in the cache and then ldx from it.
                  this will check that the cached data was invalidated
*/        
#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x100160000
#define MAIN_BASE_TEXT_ADDR_RA   0x100150000

        
#define ENABLE_HT0_Mem_Address_Not_Aligned_0x34        
#define ENABLE_HT0_Data_Access_Exception_0x30

#define USER_PAGE_CUSTOM_MAP
#include "boot.s"

SECTION .MAIN  TEXT_VA=0x150000, DATA_VA=0x160000

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_ADDR,
        RA=MAIN_BASE_TEXT_ADDR_RA,
        PA=ra2pa(MAIN_BASE_TEXT_ADDR_RA,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_ADDR,
        RA=MAIN_BASE_DATA_ADDR_RA,
        PA=ra2pa(MAIN_BASE_DATA_ADDR_RA,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.global main

#define NUM_ASI 10        
#define PRIMARY_BASE_DATA_ADDR	0x170000
#define PRIMARY_BASE_DATA_ADDR_RA	0x100170000        
#define SECONDARY_BASE_DATA_ADDR	0x180000        
#define SECONDARY_BASE_DATA_ADDR_RA	0x100180000        
#define NUCLEUS_BASE_DATA_ADDR	0x190000        
#define NUCLEUS_BASE_DATA_ADDR_RA	0x100190000 
        
.text

main:
/******************************************
 *      Register Usage
 *========================================
 *      %g1 quad_asi address
 *      %g2 data address
 *      %g3 counter
 *      %g4 PRIMARY_BASE_DATA_ADDR
 *      %g5 SECONDARY_BASE_DATA_ADDR
 *      %g6 tid 
 *      %i0-%i1 test store data
 *      %i2-%i3 all zeroes 
 *      %i4-%i5 load target                             
 ******************************************/
                                                 
        setx quad_asi, %g2, %g1
        set PRIMARY_BASE_DATA_ADDR, %g4
        set SECONDARY_BASE_DATA_ADDR, %g5
        setx 0xbefd3462acfe9732, %i1, %i0
        setx 0xacdb9245beda1234, %i2, %i1
        mov %g0, %i2
        mov %g0, %i3

   !! Normal memory accesses
        set 0, %g3
normal_asi_loop:        
        ldub [%g1+%g3], %g7
        wr %g0, %g7, %asi
        andcc %g7, 1, %g0
        movnz %xcc, %g5, %g2 !! ODD ASIs are to secondary, even are to primary
        movz %xcc, %g4, %g2
        call basic_test_quads
        nop
        
        add %g3, 1, %g3
        cmp %g3, 4
        bl normal_asi_loop
        nop

!! Do more extensive tests on Primary space
!!=========================================
        mov %g4, %g2
        wr %g0, 0xE2, %asi
        call long_quad_test
        nop

!! privleged ASIs
!!===============
        set 4, %g3
        ta T_CHANGE_PRIV

priv_asi_loop:        
        ldub [%g1+%g3], %g7
        wr %g0, %g7, %asi
        andcc %g7, 1, %g0
        movnz %xcc, %g5, %g2 !! ODD ASIs are to secondary, even are to primary
        movz %xcc, %g4, %g2
        call basic_test_quads
        nop

        add %g3, 1, %g3
        cmp %g3, 8
        bl priv_asi_loop
        nop

   !! nucleus ASIs
        wrpr %g0, 1, %tl
        set NUCLEUS_BASE_DATA_ADDR, %g2

        wr %g0, 0x24, %asi !! NUCLEUS_QUAD
        call basic_test_quads
        nop

        wr %g0, 0x2C, %asi !! NUCLEUS_QUAD_LITTLE
        call basic_test_quads
        nop

        ba diag_pass
        nop


        
/**********************************************************
        Basic_test_quads
        Tests load and store of quads as well as alignment
        and illegal accesses to quad ASIs.
************************************************************/                
        
basic_test_quads:
        !! make sure that load target is clear
        mov %g0, %i4
        mov %g0, %i5
        
        !! Test basic load and store functionality
        ldda [%g2] %asi, %i4 
        stda %i0, [%g2+16] %asi
        ldda [%g2+16] %asi, %i4 !! test that store went through
        stda %i2, [%g2+16] %asi !! clear store target



        !! Test alignment
        set 1, %l0
alignment_loop:         
        add %g2, %l0, %l1
        ldda [%l1] %asi, %i4 !! should trap
        stda %i0, [%l1+16] %asi !! should trap
        ldda [%g2+16] %asi, %i4 !! verify that store failed to go through
        add %l0, 1, %l0
        cmp %l0, 16
        bl alignment_loop
        nop
        
        !! 3) Only LDDA/STDA can access quad ASIs
        ldxa [%g2] %asi, %i4
        stxa %i0, [%g2+16] %asi
        ldda [%g2+16] %asi, %i4 !! verify that store failed to go through
        lduwa [%g2] %asi, %i4
        stuwa %i0, [%g2+16] %asi
        ldda [%g2+16] %asi, %i4 !! verify that store failed to go through
        !! halfword
        lduha [%g2] %asi, %i4
        stuha %i0, [%g2+16] %asi
        ldda [%g2+16] %asi, %i4 !! verify that store failed to go through
        !! byte
        lduba [%g2] %asi, %i4
        stuba %i0, [%g2+16] %asi
        ldda [%g2+16] %asi, %i4 !! verify that store failed to go through

        retl
        nop

        
/**********************************************************
        long_quad_test
        Tests the interaction of quads with other loads and
        stores of various sizes.  Also checks that the
        D$ works correctly with quads.
************************************************************/                
long_quad_test:
        !! test stx to either half of quad followed by quad load
        stx %i0, [%g2+16]
        ldda [%g2+16] %asi, %i4 
        stx %i0, [%g2+24]                
        ldda [%g2+16] %asi, %i4
        stda %i2, [%g2+16] %asi !! clear store target
        
        !! test std to any position of quad followed by quad load
        std %i0, [%g2+16]
        ldda [%g2+16] %asi, %i4 
        std %i0, [%g2+24]                
        ldda [%g2+16] %asi, %i4
        stda %i2, [%g2+16] %asi !! clear store target

        !! test stw to any position of quad followed by quad load
        stw %i0, [%g2+16]
        ldda [%g2+16] %asi, %i4 
        stw %i0, [%g2+20]                
        ldda [%g2+16] %asi, %i4
        stw %i0, [%g2+24]                
        ldda [%g2+16] %asi, %i4
        stw %i0, [%g2+28]                
        ldda [%g2+16] %asi, %i4
        stda %i2, [%g2+16] %asi !! clear store target

        !! test sth to any position of quad followed by quad load
        sth %i0, [%g2+16]
        ldda [%g2+16] %asi, %i4 
        sth %i0, [%g2+18]
        ldda [%g2+16] %asi, %i4 
        sth %i0, [%g2+20]                
        ldda [%g2+16] %asi, %i4
        sth %i0, [%g2+22]                
        ldda [%g2+16] %asi, %i4
        sth %i0, [%g2+24]                
        ldda [%g2+16] %asi, %i4
        sth %i0, [%g2+26]                
        ldda [%g2+16] %asi, %i4
        sth %i0, [%g2+28]                
        ldda [%g2+16] %asi, %i4
        sth %i0, [%g2+30]                
        ldda [%g2+16] %asi, %i4
        stda %i2, [%g2+16] %asi !! clear store target

        !! test stb to any position of quad followed by quad load
        stb %i0, [%g2+16]
        ldda [%g2+16] %asi, %i4 
        stb %i0, [%g2+17]
        ldda [%g2+16] %asi, %i4 
        stb %i0, [%g2+18]
        ldda [%g2+16] %asi, %i4 
        stb %i0, [%g2+19]
        ldda [%g2+16] %asi, %i4 
        stb %i0, [%g2+20]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+21]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+22]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+23]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+24]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+25]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+26]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+27]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+28]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+29]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+30]                
        ldda [%g2+16] %asi, %i4
        stb %i0, [%g2+31]                
        ldda [%g2+16] %asi, %i4
        stda %i2, [%g2+16] %asi !! clear store target

        !! Test stq followed by a smaller load from the same data
        stda %i0, [%g2+16] %asi
        ldx [%g2+16], %i4
        ldx [%g2+24], %i4
        stda %i2, [%g2+16] %asi !! clear store target

        stda %i0, [%g2+16] %asi
        lduw [%g2+16], %i4
        lduw [%g2+20], %i4
        lduw [%g2+24], %i4
        lduw [%g2+28], %i4
        stda %i2, [%g2+16] %asi !! clear store target

        stda %i0, [%g2+16] %asi
        lduh [%g2+16], %i4
        lduh [%g2+18], %i4
        lduh [%g2+20], %i4
        lduh [%g2+22], %i4
        lduh [%g2+24], %i4
        lduh [%g2+26], %i4
        lduh [%g2+28], %i4
        lduh [%g2+30], %i4
        stda %i2, [%g2+16] %asi !! clear store target
        
        stda %i0, [%g2+16] %asi
        ldub [%g2+16], %i4
        ldub [%g2+17], %i4
        ldub [%g2+18], %i4
        ldub [%g2+19], %i4
        ldub [%g2+20], %i4
        ldub [%g2+21], %i4
        ldub [%g2+22], %i4
        ldub [%g2+23], %i4
        ldub [%g2+24], %i4
        ldub [%g2+25], %i4
        ldub [%g2+26], %i4
        ldub [%g2+27], %i4
        ldub [%g2+28], %i4
        ldub [%g2+29], %i4
        ldub [%g2+30], %i4
        ldub [%g2+31], %i4
        stda %i2, [%g2+16] %asi !! clear store target

        !! Test interaction with L1 to make sure that a stq invalidates a cache line
        set 0xdeadbeef, %l0
        stx %l0, [%g2+16]
        stda %i0, [%g2+16] %asi
        ldx [%g2+16], %l1
        
        retl
        nop

/*
   ********************************
   *      Diag PASSED !           *
   ********************************
   */
  diag_pass:
          set     0xc001dea1,     %l0
          ta      T_GOOD_TRAP
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
.data
        .align 128
quad_asi: 
        !! Normal accesses      
        .byte 0xE2 !! ASI_PRIMARY_QUAD_LDD
        .byte 0xE3 !! ASI_SECONDARY_QUAD_LDD
        .byte 0xEA !! ASI_PRIMARY_QUAD_LDD_LITTLE
        .byte 0xEB !! ASI_SECONDARY_QUAD_LDD_LITTLE

        !! Privileged accesses
        .byte 0x22 !! ASI_AS_IF_USER_PRIMARY_QUAD_LDD
        .byte 0x23 !! ASI_AS_IF_USER_SECONDARY_QUAD_LDD
        .byte 0x2A !! ASI_ASI_IF_USER_PRIMARY_QUAD_LDD_LITTLE     
        .byte 0x2B !! ASI_AS_IF_USER_SECONDARY_QUAD_LDD_LITTLE

        !! Nucleus accesses
        .byte 0x24 !! ASI_NUCLEUS_QUAD_LDD
        .byte 0x2C !! ASI_NUCLEUS_QUAD_LDD_LITTLE

barrier:        
        .byte 0x00
        .byte 0x00        
.end
    

!! Data for different contexts        
                    
SECTION .PRIMARY DATA_VA=PRIMARY_BASE_DATA_ADDR
attr_data {
	Name = .PRIMARY,
	VA=PRIMARY_BASE_DATA_ADDR,	PA=ra2pa(PRIMARY_BASE_DATA_ADDR_RA,0),
	RA=PRIMARY_BASE_DATA_ADDR_RA,
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
	}
.data
        .align 128
        .word 0x00112233, 0x44556677
        .word 0x8899AABB, 0xCCDDEEFF
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
.end        
                        
SECTION .SECONDARY DATA_VA=SECONDARY_BASE_DATA_ADDR
attr_data {
	Name = .SECONDARY,
	VA=SECONDARY_BASE_DATA_ADDR,	PA=ra2pa(SECONDARY_BASE_DATA_ADDR_RA,0),
	RA=SECONDARY_BASE_DATA_ADDR_RA,
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0, TTE_Context=SCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
	}
.data
        .align 128
        .word 0x11223344, 0x55667788
        .word 0x99AABBCC, 0xDDEEFF00
        .word 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000
.end        
                        
SECTION .NUCLEUS DATA_VA=NUCLEUS_BASE_DATA_ADDR
attr_data {
	Name = .NUCLEUS,
	VA=NUCLEUS_BASE_DATA_ADDR,	PA=ra2pa(NUCLEUS_BASE_DATA_ADDR_RA,0),
	RA=NUCLEUS_BASE_DATA_ADDR_RA,
	part_0_d_ctx_zero_ps0_tsb,
	TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
	}
.data
        .align 128
        .word 0x22334455, 0x66778899
        .word 0xAABBCCDD, 0xEEFF0011
        .word 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000
.end        
