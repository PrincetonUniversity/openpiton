// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_diagasi.s
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
 *  Description: lsu_diagasi.s
        This is a self checking, rtl-only diag.
        This diag tests diagnostic accesses to the D-cache and I-cache.
        The tests will be:
        1) set tag and data for all 4 ways of a single index through
                diagnostic store
        2) load the data that has been put into the cache
        3) turn off the valid bits 1 by 1 for each way in the index and
                then do a load that will set the valid bit and bring in new data (same
                address and the entry that was invalidated)
        4) diagnostic load to all 4 ways to read out the data that was brought in by
                the previous loads.
        Do a similar test for the I-cache where the instructions are executed instead of loaded.

    Modification: 
        * Since the D-Cache replacement algorithm is no longer simple rotation.
          Number 3 above no longer gurantees that the new data will be brought back to the same way.
          Set D-Cache to directly-mapped mode.
 */
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 add %l7,1,%l7;done;nop;nop;nop;nop;nop;nop;
        
#define SET_OFFSET 0x800
#define ASI_DCACHE_DATA 0x46
#define ASI_DCACHE_TAG 0x47
#define ASI_ICACHE_INST 0x66
#define ASI_ICACHE_TAG 0x67                                
#define PA_MASK 0xffffff7fffffffff
#define VLD_RST 0xfffffffffffffffe

#define MAIN_PAGE_HV_ALSO
#include "boot.s"        

.global main
        
main:
/*************************************
        Check that these registers
        trap on non-privileged access
        Count them in %l7
**************************************/
        mov %g0, %l7
        ldxa [%g0] ASI_DCACHE_DATA, %l0
        ldxa [%g0] ASI_DCACHE_TAG, %l0
        ldxa [%g0] ASI_ICACHE_INST, %l0
        ldxa [%g0] ASI_ICACHE_TAG, %l0
        stxa %l0, [%g0] ASI_DCACHE_DATA
        stxa %l0,  [%g0] ASI_DCACHE_TAG
        stxa %l0,  [%g0] ASI_ICACHE_INST
        stxa %l0,  [%g0] ASI_ICACHE_TAG

        ! should have 8 traps
        cmp %l7, 8
        bne diag_fail
        nop
        
                        
/**********************************************************
        %g1 = data
        %g2 = data cache address
        %g3 = tag
        %g4 = tag address
        %g5 = data VA
        %g6 = data PA
***********************************************************/  
        ta T_CHANGE_HPRIV
        nop
          
set_DCache_Direct_Map_mode:
  mov   0x10, %l1         ! VA for ASI 0x42
  ldxa  [%l1] 0x42, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%l1] 0x42

/******************************************
        Test diagnostic stores
*******************************************/                           
        !! put all eight data into the dcache data array (2 in each way)
        wr %g0, ASI_DCACHE_DATA, %asi
        set 0x1, %g1
        set 0x0, %g2
set_data:           
        stxa %g1, [%g2] %asi
        add %g1, 0x1, %g1
        stxa %g1, [%g2+8] %asi !! second word in cache line
        add %g1, 0x1, %g1
        add %g2, SET_OFFSET, %g2 !! switch way of cache
        cmp %g1, 0x9
        bl %xcc, set_data
        nop
        
        wr %g0, ASI_DCACHE_TAG, %asi
        !! setx MAIN_BASE_DATA_ADDR_VA, %l0, %g6
        setx ra2pa(MAIN_BASE_DATA_RA,0), %l0, %g6

        srlx %g6, 10, %g3         !! tag is shifted by 10 bits
        or %g3, 1, %g3          !! set valid bit
        set 0x0, %g4
        set 0x0, %l0
set_tags:       
        stxa %g3, [%g4] %asi 
        add %g4, SET_OFFSET, %g4 !! switch way of cache
        add %g3, 2, %g3         !! increment tag to next address
        add %l0, 1, %l0
        cmp %l0, 4
        bl %xcc, set_tags
        nop

	ta 	T_CHANGE_NONHPRIV
	nop

        mov 0x1, %l1
        set SET_OFFSET, %l2
        setx my_data, %l0, %g5
check_diag_store:               
        ldx [%g5], %l0
        cmp %l1, %l0
        bne diag_fail
        
        add %l1, 1, %l1
        ldx [%g5+8], %l0
        cmp %l1, %l0
        bne diag_fail

        add %g5, %l2, %g5
        add %l1, 1, %l1

        cmp %l1, 0x9
        bl %xcc, check_diag_store
        nop

        
/**********************************************
        Check that the valid bit can be turned
        off correctly through diagnostic store
***********************************************/

        ta T_CHANGE_HPRIV
        nop

        !! invalidate first entry
        srlx %g6, 10, %g3	!! this should be srlx instead of srl to get the correct VA-124010000
				!! instead this generates VA-24010000, and later ldx
				!! misses not 'cos of tag invalid but tag data miscompare
				!! this does not matter since g6 and g5 are the same 'cos of tlb bypass

        !! xor %g3, 1, %g3         !! turn off valid bit - this sets valid bit

        setx VLD_RST, %o0, %o6
	and %g3, %o6, %g3

        set 0, %g4
        stxa %g3, [%g4] %asi

	ta 	T_CHANGE_NONHPRIV
	nop
        
        setx 0x1111111111111111, %i1, %i0
        set 0x3, %i2
        set 0x5, %i4
        set 0x7, %i6
        !! check that only first entry has changed
        setx my_data, %l0, %g5
        ldx [%g5], %l0
        cmp %l0, %i0
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i2
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i4
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i6
        bne diag_fail
        nop

	ta 	T_CHANGE_HPRIV
	nop

        
        !! invalidate second entry
        add %g4, SET_OFFSET, %g4
        add %g3, 2, %g3
        stxa %g3, [%g4] %asi

	ta 	T_CHANGE_NONHPRIV
	nop

        !! check that only second entry has changed
        setx 0x3333333333333333, %i7, %i2
        setx my_data, %l0, %g5
        ldx [%g5], %l0
        cmp %l0, %i0
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i2
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i4
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i6
        bne diag_fail
        nop

	ta 	T_CHANGE_HPRIV
	nop

        !! invalidate third way        
        add %g4, SET_OFFSET, %g4
        add %g3, 2, %g3
        stxa %g3, [%g4] %asi

	ta 	T_CHANGE_NONHPRIV
	nop
        
        !! check that only third entry has changed
        setx 0x5555555555555555, %i7, %i4
        setx my_data, %l0, %g5
        ldx [%g5], %l0
        cmp %l0, %i0
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i2
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i4
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i6
        bne diag_fail
        nop
        
	ta 	T_CHANGE_HPRIV
	nop

        !! invalidate fourth way        
        add %g4, SET_OFFSET, %g4
        add %g3, 2, %g3
        stxa %g3, [%g4] %asi

	ta 	T_CHANGE_NONHPRIV
	nop
        
        !! check that only fourth entry has changed
        setx 0x7777777777777777, %i7, %i6
        setx my_data, %l0, %g5
        ldx [%g5], %l0
        cmp %l0, %i0
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i2
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i4
        bne diag_fail
        nop
        
        add %g5, %l2, %g5
        ldx [%g5], %l0
        cmp %l0, %i6
        bne diag_fail
        nop

	ta 	T_CHANGE_HPRIV
	nop

/************************************************
        Test diagnostic loads (DCACHE)
 ************************************************/ 
        
        !! check tags
        set 0, %g4
        srlx %g6, 10, %g3
        or %g3, 1, %g3
        mov 1, %o0
        sllx %o0, 30, %o0        ! Parity bit position
        wr %g0, ASI_DCACHE_TAG, %asi

        xor %g3, %o0, %g3
check_dtag0:            
        ldxa [%g4] %asi, %l0
        cmp %l0, %g3
        bne diag_fail
        nop
        
        add %g3, 2, %g3
        add %g4, SET_OFFSET, %g4
        xor %g3, %o0, %g3
check_dtag1:            
        ldxa [%g4] %asi, %l0
        cmp %l0, %g3
        bne diag_fail
        nop
        
        add %g3, 2, %g3
        add %g4, SET_OFFSET, %g4
check_dtag2:            
        ldxa [%g4] %asi, %l0
        cmp %l0, %g3
        bne diag_fail
        nop
        
        add %g3, 2, %g3
        add %g4, SET_OFFSET, %g4
        xor %g3, %o0, %g3
check_dtag3:            
        ldxa [%g4] %asi, %l0
        cmp %l0, %g3
        bne diag_fail
        nop
        
        !! check data array
        setx 0x2222222222222222, %o0, %i1
        setx 0x4444444444444444, %o0, %i3
        setx 0x6666666666666666, %o0, %i5
        setx 0x8888888888888888, %o0, %i7
        mov %g6, %l0
        wr %g0, ASI_DCACHE_DATA, %asi
check_ddata:    
        ldxa [%l0] %asi, %l7
        cmp %i0, %l7
        bne %xcc, diag_fail
        nop
        
        ldxa [%l0+8] %asi, %l7
        cmp %i1, %l7
        bne %xcc, diag_fail
        nop
        
        add %l0, SET_OFFSET, %l0                        
        ldxa [%l0] %asi, %l7
        cmp %i2, %l7
        bne %xcc, diag_fail
        nop
        
        ldxa [%l0+8] %asi, %l7
        cmp %i3, %l7
        bne %xcc, diag_fail
        nop
        
        add %l0, SET_OFFSET, %l0                        
        ldxa [%l0] %asi, %l7
        cmp %i4, %l7
        bne %xcc, diag_fail
        nop
        
        ldxa [%l0+8] %asi, %l7
        cmp %i5, %l7
        bne %xcc, diag_fail
        add %l0, SET_OFFSET, %l0                        
        ldxa [%l0] %asi, %l7
        cmp %i6, %l7
        bne %xcc, diag_fail
        nop
        
        ldxa [%l0+8] %asi, %l7
        cmp %i7, %l7
        bne %xcc, diag_fail
        nop

        ba diag_pass
        nop

/***********************************************
        ICACHE Diagnostic ASI access
        ============================
        %g1 = address of test instructions in data
        %g2 = icache_instr address
        %g3 = icache tag
        %g7 = counters
       
 ***********************************************/
        !! fill the icache with adds through diag stores
        setx add_inst, %g2, %g1
        setx target_1, %g3, %g2
        call fill_icache_diag
        nop
        setx target_2, %g3, %g2
        call fill_icache_diag
        nop
        setx target_3, %g3, %g2
        call fill_icache_diag
        nop
        setx target_4, %g3, %g2
        call fill_icache_diag
        nop
        set 28, %i0
        set 28, %i1
        set 28, %i2
        set 28, %i3
        call check_icache
        nop

        !! gradually invalidate all the forced entries in the icache
        wr %g0, ASI_ICACHE_TAG, %asi
        setx target_1, %g3, %g2
        sll %g2, 1, %g2
        and %g2, 0xFF8, %g2 !! mask off unwanted tag info
        ldxa [%g2] %asi, %o0
        sllx %o0, 32, %o0
        srlx %o0, 32, %o0 !! clear valid bits
        stxa %o0, [%g2] %asi
        set 0, %i0
        set 28, %i1
        set 28, %i2
        set 28, %i3
        call check_icache
        nop
                
        setx target_2, %g3, %g2
        sll %g2, 1, %g2
        and %g2, 0xFF8, %g2 !! mask off unwanted tag info
        ldxa [%g2] %asi, %o0
        sllx %o0, 31, %o0
        srlx %o0, 31, %o0 !! clear 1 valid bit
        stxa %o0, [%g2] %asi
        set 0, %i0
        set 22, %i1
        set 28, %i2
        set 28, %i3
        call check_icache
        nop
        sllx %o0, 32, %o0
        srlx %o0, 32, %o0 !! clear both valid bits
        stxa %o0, [%g2] %asi
        set 0, %i0
        set 0, %i1
        set 28, %i2
        set 28, %i3
        call check_icache
        nop
                
        setx target_3, %g3, %g2
        sll %g2, 1, %g2
        and %g2, 0xFF8, %g2 !! mask off unwanted tag info
        ldxa [%g2] %asi, %o0
        sllx %o0, 32, %o0
        srlx %o0, 32, %o0 !! clear valid bits
        stxa %o0, [%g2] %asi
        set 0, %i0
        set 0, %i1
        set 0, %i2
        set 28, %i3
        call check_icache
        nop
         
        setx target_4, %g3, %g2
        sll %g2, 1, %g2
        and %g2, 0xFF8, %g2 !! mask off unwanted tag info
        ldxa [%g2] %asi, %o0
        sllx %o0, 32, %o0
        srlx %o0, 32, %o0 !! clear valid bits
        stxa %o0, [%g2] %asi
        set 0, %i0
        set 0, %i1
        set 0, %i2
        set 0, %i3
        call check_icache
        nop


        !! Do diagnostic loads of icache instr
        wr %g0, ASI_ICACHE_INST, %asi
        setx target_1, %g3, %g2
        add %g1, 32, %g4
        set 0, %g5
        call check_diag_icache_load
        nop
        setx target_2, %g3, %g2
        add %g4, 32, %g4
        set 1, %g5
        call check_diag_icache_load
        nop
        setx target_3, %g3, %g2
        add %g4, 32, %g4
        set 2, %g5
        call check_diag_icache_load
        nop
        setx target_4, %g3, %g2
        add %g4, 32, %g4
        set 3, %g5
        call check_diag_icache_load
        nop
        
        ba diag_pass
        nop

!!      %g2 = VA for inst        
!!      %g4 = expected instruction address
!!      %g5 = constant added to expected instruction                
check_diag_icache_load:         
        sll %g2, 1, %g2
        and %g2, 0xFF8, %g2 !! mask off unwanted tag info
        set 0, %o7
check_icache_load_loop:         
        ldxa [%g2] %asi, %o0 !! get instruction out of cache 
        sllx %o0, 32, %o0
        srlx %o0, 32, %o0   !! get rid of parity and switch info
        lduw [%g4+%o7], %o1         !! get expected instruction
        add %o1, %g5, %o1 
        cmp %o0, %o1
        bne diag_fail
        nop
        add %o7, 4, %o7
        add %g2, 8, %g2
        cmp %o7, 32
        bl check_icache_load_loop
        nop
        retl
        nop
               
                       
         
        
!! Takes in an address in %g2 and stores 8 words 
!! to it in the cache through diagnostic access                
fill_icache_diag:                       
        wr %g0, ASI_ICACHE_TAG, %asi
        set 3, %i0
        sll %i0, 30, %i0 !! set up valid bits
        setx 0x100000000, %l1, %l0
        add %g2, %l0, %g3 !! convert to PA
        srl %g3, 10, %g3 !! shift to get just the tag
        or %i0, %g3, %g3 !! add valid  bits to the tag
        sll %g2, 1, %g2
        and %g2, 0xFF8, %g2 !! mask off unwanted tag info
        stxa %g3, [%g2] %asi !! store tag
        
        set 0, %g7
        wr %g0, ASI_ICACHE_INST, %asi
icache_set_loop:        
        lduw [%g1+%g7], %i0
        stxa %i0, [%g2] %asi
        add %g7, 4, %g7
        cmp %g7, 32
        bl icache_set_loop
        nop
        retl
        nop
 
!! Adds up the contents of the local registers
!! and compares them to the value in i0-3
check_icache:   
        save                              
        call target_1
        nop
        call check_icache_result
        nop
        cmp %i7, %i0
        bne diag_fail
        nop
        call target_2
        nop
        call check_icache_result
        nop
        cmp %i7, %i1
        bne diag_fail
        nop
        call target_3
        nop
        call check_icache_result
        nop
        cmp %i7, %i2
        bne diag_fail
        nop
        call target_4
        nop
        call check_icache_result
        nop
        cmp %i7, %i3
        bne diag_fail
        nop
        restore
        retl
        nop

check_icache_result:    
        add %l0, %l1, %i7
        add %i7, %l2, %i7       
        add %i7, %l3, %i7       
        add %i7, %l4, %i7       
        add %i7, %l5, %i7       
        add %i7, %l6, %i7       
        add %i7, %l7, %i7       
        retl
        nop     
        
        
                       
        
                



!! target addresses for icache accesses        
.align 2048
target_1:               
        set 0, %l0
        set 0, %l1
        set 0, %l2
        set 0, %l3
        set 0, %l4
        set 0, %l5
        set 0, %l6
        set 0, %l7
        retl
        nop
.align 2048
target_2:               
        set 1, %l0
        set 1, %l1
        set 1, %l2
        set 1, %l3
        set 1, %l4
        set 1, %l5
        set 1, %l6
        set 1, %l7
        retl
        nop
.align 2048
target_3:               
        set 2, %l0
        set 2, %l1
        set 2, %l2
        set 2, %l3
        set 2, %l4
        set 2, %l5
        set 2, %l6
        set 2, %l7
        retl
        nop
.align 2048
target_4:               
        set 3, %l0
        set 3, %l1
        set 3, %l2
        set 3, %l3
        set 3, %l4
        set 3, %l5
        set 3, %l6
        set 3, %l7
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
.align 1024       
my_data:        
        .xword 0x1111111111111111, 0x2222222222222222
add_inst:       
        add %g0, 0, %l0
        add %g0, 1, %l1
        add %g0, 2, %l2
        add %g0, 3, %l3
        add %g0, 4, %l4
        add %g0, 5, %l5
        add %g0, 6, %l6
        add %g0, 7, %l7

        set 0, %l0
        set 0, %l1
        set 0, %l2
        set 0, %l3
        set 0, %l4
        set 0, %l5
        set 0, %l6
        set 0, %l7
        
        
.align 2048        
        .xword 0x3333333333333333, 0x4444444444444444
.align 2048
        .xword 0x5555555555555555, 0x6666666666666666
.align 2048
        .xword 0x7777777777777777, 0x8888888888888888
        
.end                                      
        
