// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_noncache.s
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
 *  Description: lsu_noncache.s
        This diag tests memory accesses for L1-noncachable cases.  These are:
                1) Pages with the CV or CP bits turned off
                2) Streaming loads (don't allocate in L1)
                3) ASI physical (0x14, 0x15)
                4) I/D cache turned off
        Cases 1 and 4 are valid for both I and D while 2 and 3 are only applicable
        for the D cache.
        Loading from noncacheable memory is tested by putting a known value into memory,
        forcing a different value into the cache through the diagnostic access registers and
        then loading from that memory address.
        Stores should keep the L1 coherent with the L2 even if it is a noncacheable store.  So the
        diag will just check that the L1 stays coherent.
 */
#define MY_DATA_ADDR	0x200000
#define PAGE_SIZE 0x2000        
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_TEXT_ADDR_PA   0x100150000

//dcache diag access way bits: 12-11
//set bits: 10-4
#define DWAY_OFFSET 0x800
#define IWAY_OFFSET 0x10000
#define ASI_DCACHE_DATA 0x46
#define ASI_ICACHE_INST 0x66
        
!! Use special miss handlers to guarantee location in TLB        
#define H_T0_fast_instr_access_MMU_miss ifetch_immu_miss
#define H_T0_fast_data_access_MMU_miss ifetch_dmmu_miss 

#include "spu_diag.h"
#include "boot.s"

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_VA,
        RA=MAIN_BASE_TEXT_RA,
        tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_VA,
        RA=MAIN_BASE_TEXT_RA,
        tsbonly,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global main
.global ifetch_immu_miss
.global ifetch_dmmu_miss                

#define TARGET_ADDR 0 
#define CACHE_DATA 8
#define MEM_DATA 16
#define TAG_DATA 32 
#define SET_OFFSET 0x400 
        
#define ASI_LSU_CTL_REG 0x45                                             


/*************************************
        Data storage
        ============
        %g1 = data virtual address
        %g2 = data physical address
        %g6 = data expected from cache
        %g7 = data expected from memory
**************************************/                
main:
        ta T_CHANGE_PRIV

        setx data_addr, %g2, %g1
        ldx [%g1+CACHE_DATA], %g6
        ldx [%g1+MEM_DATA], %g7

        ldx [%g1], %l0


/*****************************************
        Test physical ASIs (0x14 and 0x15)
        Need PA for data (in %g2)
******************************************/
        setx ra2pa(MY_DATA_ADDR,0), %l7, %g2
        call corrupt_dcache !! put wrong data in cache
        nop

        setx MY_DATA_ADDR, %l7, %g2
        ldxa [%g2] 0x14, %l0
        cmp %l0, %g7
        bne diag_fail
        nop                
                
        ldxa [%g2] 0x15, %l0
        cmp %l0, %g7
        bne diag_fail
        nop                
                
        stxa %g7, [%g2] 0x14
        ldx [%g1], %l0
        cmp %l0, %g7
        bne diag_fail
        nop                
        
        stxa %g7, [%g2] 0x15
        ldx [%g1], %l0
        cmp %l0, %g7
        bne diag_fail
        nop                
        
        stx %g7, [%g1] !! make sure everything is coherent
	call disable_dcache
	nop
        
        call corrupt_dcache !! put wrong data in Dcache
        nop
        
        !! load and check that bad cache data isn't used
        ldx [%g1], %l0
        cmp %l0, %g7
        bne diag_fail
        nop

        !! store with cache off and let it clear store buffer        
        stx %g7, [%g1]
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop

        !! turn cache back on to check that store changed cache
	call enable_dcache
	nop

        ldx [%g1], %l0
        cmp %l0, %g7
        bne diag_fail
        nop
        
/*************************************************
        Manipulate CP and CV bits in D-TSB
        =================================
        This is done by putting the TSB entry
        into a known location (16) for the data
        page so that it can be manipulated as
        desired.  Goes through all 3 noncachable combinations
**************************************************/
/*      set tte_entry, %i0
        mov 0x80, %o1
        mov 0x8, %i1
        setx ra2pa(MY_DATA_ADDR,0), %i2, %i3  !! address for page
dtsb_cachable:  
        stx %g7, [%g1] !! make everything coherent
        
        !! Set TSB entry
        ldx [%i0+%i1], %i2
        or %i2, %i3, %i2
	call set_tsb_entry
	nop

        call corrupt_dcache !! put wrong data in Dcache

        !! load and check that bad cache data isn't used
        ldx [%g1], %l0
        cmp %l0, %g7
        bne diag_fail
        nop

        !! store with cache off and let it clear store buffer        
        stx %g7, [%g1]
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop

        !! Make cacheable again to check effect        
        ldx [%i0], %i2
        or %i2, %i3, %i2
	call set_tsb_entry
	nop

        ldx [%g1], %l0
        cmp %l0, %g7
        bne diag_fail
        nop

        cmp %i1, 24
        bl dtsb_cachable
        add %i1, 0x8, %i1
*/
/***************************************************************************
        Test I_Cache
        ============
        Done by switching it off or by 
        setting the TTE bits in I-TSB.
        Methodology:    
        1) execute an instruction to bring into cache
        2) make instruction uncacheable
        3) change instruction with store to that address
        4) execute instruction again and check that new version
                was executed
        5) make instruction cacheable again
        6) execute instruction and verify that old instruction is still
                in cache
        7) store original instruction to reset everything
****************************************************************************/                
        set test_target, %l2
          
        call test_target
        nop
        !! Turn off i-cache
	call disable_icache
	nop

        call corrupt_icache !! change instruction
        nop
        
        call test_target
        nop

        cmp %i7, 0
        bne diag_fail
        nop

        ld [%l2+16], %l1
        st %l1, [%l2+8] !! put nop back into instruction path
        flush
        
        !! Turn on i-cache
	call enable_icache
	nop

        call test_target
        nop
        
        cmp %i7, 0
        bne diag_fail
        nop

/*********************************
        CV and CP in ITSB tests
**********************************/                
/*        set tte_entry, %i0
        mov 0x88, %o1
        mov 16, %i1 !! skip CP version
        set 0x202000, %i3
        set test_target, %l2
itsb_cachable:  
        ld [%l2+16], %l1
        st %l1, [%l2+8] !! put nop back into instruction path
        flush
                           
        !! Set TSB entry
        ldx [%i0+%i1], %i2
        or %i2, %i3, %i2
        stxa %i2, [%o1] 0x5d !! write to entry 17

        call corrupt_icache !! put bad instruction in path
        nop
        
        call test_target
        nop

        cmp %i7, 0 !! make sure bad instruction wasn't executed
        bne diag_fail
        nop

        cmp %i1, 24
        bl itsb_cachable
        add %i1, 0x8, %i1

*/
/***********************************************************************************
        Test of streaming loads/stores
        and their effect on cache (none)
        --------------------------------
        Put values into MAMEM and then put
        a different value into the cache.
        Move data from MAMEM to normal memory (streaming store) and
        back again (streaming load) and check that cache contents haven't changed.
************************************************************************************/        
test_streaming_noncache:        
               
        !call test_stream  !no spu
        nop
 
        ba diag_pass
        nop
  
        
/*
   ********************************
   *      Diag PASSED !           *
   ********************************
   */
  diag_pass:
          ta      T_GOOD_TRAP
          nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        ta T_BAD_TRAP
        nop
        nop


/*************************************
        Trap Handlers
**************************************/
ifetch_immu_miss:       
        ldxa [%g0] 0x51, %g1	! 8k ptr
  
        sllx %g1, 48, %g4 !! get rid of address for ptr
        srlx %g4, 39, %g4 !! get miss address
        set tte_entry, %g2
        ldx [%g2], %g5  !! get tte entry
        or    %g5, %g4, %g5
        set MAIN_BASE_TEXT_ADDR, %g3
        set PAGE_SIZE, %g2
        add %g3, %g2, %g3 !! 2nd text page
        cmp %g4, %g3
        be special_immu_miss
        mov 0x88, %g6

normal_immu_miss:       
        ldda [%g1] 0x24, %g4
        mov  0x30, %o2
        stxa  %g4, [ %o2 ] 0x50
        stxa  %g5, [ %g0 ] 0x54
        retry 
        nop
special_immu_miss:
        mov  0x30, %o2
        stxa  %g4, [ %o2 ] 0x50
        stxa  %g5, [ %g6 ] 0x55 !! write to a specific entry
        retry
        nop
                        
ifetch_dmmu_miss:
        ldxa [%g0] 0x59, %g1	! 8k ptr
        sllx %g1, 48, %g4 !! get rid of address for ptr
        srlx %g4, 39, %g4 !! get miss address
        set tte_entry, %g2
        ldx [%g2], %g5 !! get nonprivileged tte entry
        or    %g5, %g4, %g5
        !! check to see if this is the 2nd page of MAIN_TEXT
        set MAIN_BASE_TEXT_ADDR, %g3
        set PAGE_SIZE, %g2
        add %g3, %g2, %g3 !! 2nd text page
        cmp %g4, %g3
        be standard_dmmu_miss
        set MY_DATA_ADDR, %g3
        cmp %g4, %g3
        bne,a standard_dmmu_miss
        ldda [%g1] 0x24, %g4

set_my_data_page:       
        mov  0x30, %o2
        mov  0x80, %o1
        stxa  %g4, [ %o2 ] 0x58
        !!stxa  %g5, [ %g0 ] 0x5c
        stxa  %g5, [ %o1 ] 0x5d !! write to a specific entry
        retry 
        nop 
        
standard_dmmu_miss:     	
       	mov  0x30, %o2
        stxa  %g4, [ %o2 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
        retry 
        nop 
        

/**********************************
        Second page of main text
        Used for test code
***********************************/
.align 8192
test_target:    
        mov %g0, %i7
        nop
        nop !! instruction that will get modified
        retl
        nop 
        add %g0, 1, %i7                      
              
        
  
.data
tte_entry:      
.align 128
        .xword 0x8000000100000033 ! CP CV W V G plus offset for phys address                
        .xword 0x8000000100000023 ! CP    W V G plus offset for phys address                
        .xword 0x8000000100000013 !    CV W V G plus offset for phys address                
        .xword 0x8000000100000003 ! W V G plus offset for phys address                
self_modify_tte:
	.xword 0x0000000002002000, 0x8000000102002003  ! entry 1, 0x1
.end                        
        
SECTION .MY_DATA DATA_VA=MY_DATA_ADDR
attr_data {
	Name = .MY_DATA,
	VA=MY_DATA_ADDR, PA=ra2pa(MY_DATA_ADDR,0),
	RA=MY_DATA_ADDR,
	part_0_d_ctx_zero_ps0_tsb,
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
	}

.global data_addr        
        
.data
data_addr: 
        .word 0x11223344, 0x55667788
        .word 0xAABBCCDD, 0xdeadbeef
        .word 0x11223344, 0x55667788
        !! DCACHE data VA for load
        .word 0x00000001, 0x00200000
        !! DCACHE tag
        .word 0x00000000, 0x00801001
        
        
.align 1024
        .word 0x11223344, 0x55667788
.align 1024
        .word 0x11223344, 0x55667788
.align 1024
        .word 0x11223344, 0x55667788
.end  

changequote([, ])dnl
define([HYP_SEC_BASE_TEXT_VA], [0x]mpeval(MAIN_BASE_TEXT_VA+0x8000, 16))dnl
changequote(`,')dnl

SECTION .USER_TRAP_FOR_HYP TEXT_VA=HYP_SEC_BASE_TEXT_VA
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }

attr_text {
        Name = .USER_TRAP_FOR_HYP,
        VA=HYP_SEC_BASE_TEXT_VA,
        RA=HYP_SEC_BASE_TEXT_VA,
	PA=ra2pa(HYP_SEC_BASE_TEXT_VA,0),
        part_0_i_ctx_zero_ps0_tsb,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.text
.global corrupt_dcache
.global corrupt_icache
.global disable_dcache
.global disable_icache
.global enable_dcache
.global enable_icache
.global set_tsb_entry
.global test_stream

/********************************************************
        Put bad data into the dcache line for our 
        data.  Need to put it in all 4 ways 
        because we don't know which way was selected
        by the lsu.
 ********************************************************/      
corrupt_dcache:
	ta T_CHANGE_HPRIV
        set 0x0, %g3 !! data maps to first entry in cache
        wr %g0, ASI_DCACHE_DATA, %asi     
        stxa %g6, [%g3] %asi !! put in first way of cache
        add %g3, DWAY_OFFSET, %g3  
        stxa %g6, [%g3] %asi !! put in 2nd way of cache
        add %g3, DWAY_OFFSET, %g3  
        stxa %g6, [%g3] %asi !! put in 3rd way of cache
        add %g3, DWAY_OFFSET, %g3  
        stxa %g6, [%g3] %asi !! put in 4th way of cache
	ta T_CHANGE_NONHPRIV
        retl
        nop

/*********************************************************
        Put a bad instruction into the icache.
        In this case, the instruction is in %l2+20
        and the target address is in %l2+8.
**********************************************************/
corrupt_icache:
	ta T_CHANGE_HPRIV
        wr %g0, 0x10, %asi
        lda [%l2+20] %asi, %l1 !! get bad instruction (add)
        wr %g0, ASI_ICACHE_INST, %asi

        set 0x1FF8, %g3  !! mask for diagnostic address
        add %l2, 8, %l7
        and %l7, %g3, %g3 !! mask off address for diag access
        stxa %l1, [%g3] %asi  !! store to 1st way
        add %g3, DWAY_OFFSET, %g3  
        stxa %l1, [%g3] %asi  !! store to 2nd way
        add %g3, DWAY_OFFSET, %g3  
        stxa %l1, [%g3] %asi  !! store to 3rd way
        add %g3, DWAY_OFFSET, %g3  
        stxa %l1, [%g3] %asi  !! store to 4th way
	ta T_CHANGE_NONHPRIV
        retl
        nop                        


/************************************************
        Turn off D-Cache
*************************************************/
disable_dcache:
	ta T_CHANGE_HPRIV
        set 0xD, %l0 !! DC off, IC, MMUs on
        stxa %l0, [%g0] ASI_LSU_CTL_REG
	ta T_CHANGE_NONHPRIV
	retl
	nop

disable_icache:
	ta T_CHANGE_HPRIV
        set 0xE, %l0 !! IC off, DC, MMUs on
        stxa %l0, [%g0] ASI_LSU_CTL_REG
	ta T_CHANGE_NONHPRIV
	retl
	nop

        !! turn cache back on to check that store changed cache
enable_dcache:
enable_icache:
	ta T_CHANGE_HPRIV
        set 0xF, %l0
        stxa %l0, [%g0] ASI_LSU_CTL_REG
	ta T_CHANGE_NONHPRIV
	retl
	nop

set_tsb_entry:
	ta T_CHANGE_HPRIV
        stxa %i2, [%o1] 0x5d !! write to entry 16
	ta T_CHANGE_NONHPRIV
	retl
	nop

test_stream:
        ta T_CHANGE_HPRIV
        stx %g7, [%g1]  !! put one set of data into memory
        
        wr	%g0, SPU_ASI, %asi  ! set up the asi register to contain SPU asi
        setx ra2pa(MY_DATA_ADDR,0), %l1, %l0
        stxa %l0, [%g0+REG_MPA_ADDR] %asi !! set test data PA
        stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set MAMEM offset (0x0)
        add	%g0, 2, %i0		! #of xwords to load to MAMEM
        sub	%i0, 1,  %i0		! minus 1
        stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load 2 words to MAMEM
        ldxa    [%g0+MASync_ADDR] %asi, %l7

        stx %g6, [%g1] !! change data in memory/cache after reading into SPU memory

        !! streaming store
        set 0x40, %i0
        add %i0, 1, %i0
        stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load 2 words from MAMEM
        ldxa    [%g0+MASync_ADDR] %asi, %l7

        ldx [%g1], %l0
        
        !! streaming load
        add	%g0, 2, %i0		! #of xwords to load to MAMEM
        sub	%i0, 1,  %i0		! minus 1
        stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load 2 words to MAMEM
        ldxa    [%g0+MASync_ADDR] %asi, %l7

        ldx [%g1], %l0
        ta T_CHANGE_NONHPRIV
        retl
        nop
