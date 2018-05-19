// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ifetch_traps.s
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
!!	This file tests out the handling of ifetch traps
!!
!!	Date	: Dec. 18, 2001
!!  Description:        This diag exercises the following traps:              
!!      instruction-access-exception
!!      fast-instruction-access-mmu-miss
!!      mem_address_not_aligned
!!      illegal_instruction
!!      privileged-action
!!      privileged-opcode
!!              The diag is centered on the execution of 3 instructions.
!!              The first is a branch located at the end of a page. 
!!              The second is a branch at the beginning of the next page.
!!              The third is in the delay slot of the second instruction.
!!              All three are designed to cause multiple traps.  The branches
!!              always branch to instructions that arent in the tlb.  If they are
!!              a branch-on-reg they have an illegal rcond field (illegal instruction).
!!              JMPL will have an unaligned target address.  Also, the pages all have P=1
!!              causing instruction access exceptions for every new page.
!!              
!!              The diag uses self modifying code to continuously change the three instructions
!!              at fixed addresses rather being a long diag.  The TLB misses are created
!!              by invalidating those entries in the TLB after each iteration.
!!              
!!              The trap handler for each trap will only fix the specific problem and then                
!!              retry.  For example privileged opcodes are changed to NOPs.
!!                                              
!!	
!!-------------------------------------------------------------------------------
#define MAIN_BASE_DATA_ADDR	 0x160000
#define MAIN_BASE_TEXT_ADDR 	 0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x160000
#define MAIN_BASE_TEXT_ADDR_RA   0x150000

#define H_HT0_HTrap_Instruction_0
#define My_HT0_HTrap_Instruction_0 mov 0x1, %g1; \
                                  sllx %g1, 63, %g1; \
                                  wrpr %g1, %g0, %tick; \
                                  done;

#define H_HT0_HTrap_Instruction_1
#define My_HT0_HTrap_Instruction_1 setx return_addr, %g3, %g1; \
                                   setx inv_tlb, %g3, %g2; \
                                   jmp %g2; \
                                   nop; \
                               return_addr: \
                                   done;
                                       


#define H_HT0_Mem_Address_Not_Aligned_0x34 fix_jmpl_address 
#define H_T0_Privileged_opcode_0x11 fix_priv_op 
#define H_T0_Privileged_Action_0x37 fix_priv_op 
#define H_HT0_Illegal_instruction_0x10 fix_br

#define H_T0_fast_instr_access_MMU_miss ifetch_immu_miss
#define H_T0_fast_data_access_MMU_miss ifetch_dmmu_miss 
#define H_T0_Instruction_access_exception_0x08 change_page_priv                                                    
#define USER_PAGE_CUSTOM_MAP
#define MAIN_PAGE_HV_ALSO
#include "boot.s"
        
#define NUM_BR1 4
#define NUM_BR2 4
#define NUM_DLY 3

#define PAGE_SIZE 0x2000        

SECTION .MAIN  TEXT_VA=0x150000, DATA_VA=0x160000

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_ADDR,
        RA=MAIN_BASE_TEXT_ADDR_RA,
        PA=ra2pa(MAIN_BASE_TEXT_ADDR_RA,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
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

.text
.global main
main:
	
	ta  T_HTRAP_INST0

        set PAGE_SIZE, %i5
        set target0,%g4
        set target1, %g5
        set br1, %g6
        set data_seg, %g7
        mov 0x0, %g1 !! BR1 index
        mov 0x0, %g2 !! BR2 index
        mov 0x0, %g3 !! DLY index

ifetch_loop:    
        !! get first branch instruction and set it in memory
        sll %g1, 2, %l1
        
        ld [%g7+%l1], %l2
        st %l2, [%g6]
        flush %g6

        !! get 2nd branch instruction and set it in memory
        add %g2, NUM_BR1, %l1
        sll %l1, 2, %l1
        ld [%g7+%l1], %l2
        st %l2, [%g6+4]
        flush %g6+4

        !! get delay instruction and set it in memory
        add %g3, NUM_BR2, %l1
        add %l1, NUM_BR1, %l1
        sll %l1, 2, %l1
        ld [%g7+%l1], %l2
        st %l2, [%g6+8]
        flush %g6+8  

        call br1
        nop

	ta  T_HTRAP_INST1
        
        add %g3, 0x1, %g3
        cmp %g3, NUM_DLY
        bne ifetch_loop
        nop

        mov 0, %g3
        add %g2, 1, %g2
        cmp %g2, NUM_BR2
        bne ifetch_loop
        nop

        mov 0, %g2
        add %g1, 1, %g1
        cmp %g1, NUM_BR1
        bne ifetch_loop
        nop
        
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
 ********************************
 *      Test instructions       *
 ********************************
 */
.align 4096 !! set up so this the last instruction on the page
        nop
.align 2048
        nop
.align 1024
        nop
.align 512
        nop
.align 256
        nop
.align 128
        nop
.align 64
        nop
.align 32
        nop
.align 16
        nop
.align 8
        nop
.align 4                                                                                              
br1:
        nop
br2:
        nop
dly_inst:       
        nop 
        nop
        retl
        nop

!! New page for target 0
.align 8192
target0:  
        nop              
        ba dly_inst
        nop
!! New page for target 1
.align 8192
target1: 
        nop       
        ba dly_inst
        nop                        

       
SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x13002000, DATA_VA=0x13004000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }
attr_data {
        Name = .USER_TRAP_FOR_HYP
        RA=0x13004000,
        PA=ra2pa(0x13004000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0x44, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global ifetch_immu_miss
.global ifetch_dmmu_miss
ifetch_immu_miss:       
        ldxa [%g0] 0x51, %g1	! 8k ptr
  
        sllx %g1, 48, %g4 !! get rid of address for ptr
        srlx %g4, 39, %g4 !! get miss address
        set data_seg, %g2
        ldx [%g2+136], %g5  !! get privileged tte entry
        or    %g5, %g4, %g5
        set MAIN_BASE_TEXT_ADDR, %g3
        set PAGE_SIZE, %g2
        add %g3, %g2, %g3 !! 2nd text page
        cmp %g4, %g3
        be special_immu_miss
        mov 0x88, %g6
        add %g3, %g2, %g3 !! 3rd text page
        cmp %g4, %g3
        be special_immu_miss
        add %g6, 0x8, %g6
        add %g3, %g2, %g3 !! 4th text page
        cmp %g4, %g3
        be special_immu_miss
        add %g6, 0x8, %g6

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
        set data_seg, %g2
        ldx [%g2+128], %g5 !! get nonprivileged tte entry
        or    %g5, %g4, %g5
        set MAIN_BASE_TEXT_ADDR, %g3
        cmp %g4, %g3
        be standard_dmmu_miss
        set PAGE_SIZE, %g2
        add %g3, %g2, %g3 !! second page of main text
        cmp %g4, %g3
        be standard_dmmu_miss
        set MAIN_BASE_DATA_ADDR, %g3
        add %g3, %g2, %g3 !! second page of main data
        cmp %g4, %g3
        bne,a standard_dmmu_miss
        ldda [%g1] 0x24, %g4

set_data_page_2:
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

!! Branch reg has invalid condition.  Need to add one bit to make it valid.        
.global fix_br
fix_br:                 
        rdpr %tpc, %g1
        lduwa [%g1] 0x14, %g2
        set 0x02000000, %g3
        or %g2, %g3, %g2
        stwa %g2, [%g1] 0x14
        flush %g1
        retry
        nop

.data
.global data_seg
data_seg:
        !! br1 instrs
        .word 0x00c80801     !! brz  %g0, 154000 <target0>
        .word 0x08c80801     !! brnz  %g0, 154000 <target0>
        .word 0x28c80801     !! brnz,a  %g0, 154000 <target0>
        jmpl %g4+3, %g0
        !! br2 instrs
        .word 0x00c81000     !! brz  %g0, 156000 <target1>
        .word 0x08c81000     !! brnz  %g0, 156000 <target1>
        .word 0x28c81000     !! brnz,a  %g0, 156000 <target1>
        jmpl %g5+3, %g0
        !! delay instrs
        wrpr %g0, 0x7, %cleanwin
        rdpr %cwp, %l5
        ldx [%g7+%i5], %l0

.align 128
        .xword 0x8000000100000003 ! W V G plus offset for phys address                
        .xword 0x8000000100000007 ! P W V G plus offset for phys address                
        
.align 8192
        .word 0xdeadbeef, 0xeaeafeed        
         
       
.end         


SECTION .USER_INV_TLB TEXT_VA=0x13006000
attr_text {
        Name = .USER_INV_TLB,
        hypervisor
        }

.text
.global inv_tlb
inv_tlb:
    set PAGE_SIZE, %o3; !! invalidate i-tlb entries 
    set MAIN_BASE_TEXT_ADDR, %o2 
    add %o2, %o3, %o2       
    stxa %g0, [%o2] 0x57 !! demap to i-tlb 
    add %o2, %o3, %o2        
    stxa %g0, [%o2] 0x57 !! demap to i-tlb
    add %o2, %o3, %o2        
    stxa %g0, [%o2] 0x57 !! demap to i-tlb

    !! invalidate d-tlb entry
    set MAIN_BASE_DATA_ADDR, %o2
    add %o2, %o3, %o2
    stxa %g0, [%o2] 0x5F !! demap to d-tlb
    
    jmp %g1
    nop

.global fix_jmpl_address 
.global fix_priv_op
.global change_page_priv                                               

/**********************************
        Trap Handlers
 **********************************/
!! mask off lower to bits to make jmpl aligned        
fix_jmpl_address:       
        rdpr %tpc, %g1
        lduwa [%g1]0x14, %g2
        andn %g2, 0x3, %g2
        stwa %g2, [%g1]0x14
        retry
        nop

!! changed privileged opcode to nop                
fix_priv_op:                    
        rdpr %tpc, %g1
        set 0x01000000, %g2
        stw %g2, [%g1]
        flush %g1
        retry
        nop


change_page_priv:       
        rdpr %tpc, %g1
        srlx %g1, 13, %g1
        and %g1, 0x3, %g2 !! mask off to get individual page #
        sllx %g2, 3, %g6
        add %g6, 0x80, %g6 !! index into tsb
        sllx %g1, 13, %g4 !! page entry
        set data_seg, %g7
        ldx [%g7+128], %g5 !! get nonprivileged tte entry
        or    %g5, %g4, %g5
        mov  0x30, %o2
        stxa  %g4, [ %o2 ] 0x50
        stxa  %g5, [ %g6 ] 0x55 !! write to a specific entry
        retry
        nop
                        

