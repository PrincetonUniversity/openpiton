// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ASI_INST_MASK_REG-test_0.s
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
#define  THREAD_COUNT 4

#define INST_MASK_REG_ASI	0x42
#define INST_MASK_REG_VA	0x08
!		
!	Field		Bit		Description
!	-----		-----		-----------------------------
!	RSVD0		63:39		Reserved 
#define IMR_ENB31_30	38		! Enable matching on INST 31:30 
#define IMR_ENB29_25	37		! Enable matching on INST 29:25 
#define IMR_ENB24_19	36		! Enable matching on INST 24:19 
#define IMR_ENB18_14	35		! Enable matching on INST 18:14 
#define IMR_ENB13	34		! Enable matching on INST 13 
#define IMR_ENB12_5	33		! Enable matching on INST 12:5 
#define IMR_ENB4_0	32		! Enable matching on INST 4:0 
#define IMR_INST	31:0		! Instruction pattern to be trapped

	
#define IMR_ENB31_30_mask	0x40
#define IMR_ENB29_25_mask	0x20	
#define IMR_ENB24_19_mask	0x10
#define IMR_ENB18_14_mask	0x08
#define IMR_ENB13_mask		0x04
#define IMR_ENB12_5_mask	0x02
#define IMR_ENB4_0_mask		0x01

#define IMR_ENB31_19_masks	0x70


#define  LSU_CONTROL_REG_ASI  0x45
#define         LSU_CONTROL_REG_DIMMU_MASK    0x0c
#define         LSU_CONTROL_REG_DMMU_MASK     0x08
#define         LSU_CONTROL_REG_IMMU_MASK     0x04
#define         LSU_CONTROL_REG_DCIC_MASK     0x03
#define         LSU_CONTROL_REG_DC_MASK       0x02
#define         LSU_CONTROL_REG_IC_MASK       0x01


	
!!!!!--------------
#define H_HT0_Reserved_0x76 trap_0x76_handler 
!!!!!--------------

#include "boot.s"

!
!       Test the INST_MASK_REG and associated trap
!



!
!	Activation of this function requires HPSTATE.IBE=1 
!
!	A "HIT" causes an INSTRUCTION_BREAKPOINT trap 0x76 to be taken
!
!
!
!
!-------------------------------------------------------------------------------------
!
!	IMR_ENB31_30 Cases
!		00	bpn	00 a 0000 {00100p, 00110p} disp 19
!		01	call	01 30b disp
!		10	add	10 rd 000000 rs1 1 simm13
!		11	load	11 rd op3 rs1 i bit {rs2, simm13}
!
!	IMR_ENB29_25	cases  RD field
!		add	10 rd 000000 rs1 1 simm13  vary RD from 8 to 31
!
!
!	IMR_ENB24_19 Cases	Op3 field 
!		add	10 rd 000000 rs1 1 simm13
!		and	10 rd 000001 rs1 1 simm13
!		or	10 rd 000010 rs1 1 simm13
!		xor	10 rd 000011 rs1 1 simm13
!		sub	10 rd 000100 rs1 1 simm13
!		andn	10 rd 000101 rs1 1 simm13
!		orn	10 rd 000110 rs1 1 simm13
!		xnor	10 rd 000111 rs1 1 simm13
!
!		subc	10 rd 001100 rs1 1 simm13
!
!		addcc	10 rd 010000 rs1 1 simm13
!		andcc	10 rd 010001 rs1 1 simm13
!		orcc	10 rd 010010 rs1 1 simm13
!		xorcc	10 rd 010011 rs1 1 simm13
!		subcc	10 rd 010100 rs1 1 simm13
!
!		andncc	10 rd 010101 rs1 1 simm13
!		orncc	10 rd 010110 rs1 1 simm13
!		xnorcc	10 rd 010111 rs1 1 simm13
!		addccc	10 rd 011000 rs1 1 simm13
!		subccc	10 rd 011100 rs1 1 simm13
!
!		sll	10 rd 100101 rs1 1 samt
!		srl	10 rd 100110 rs1 1 samt
!		sra	10 rd 100111 rs1 1 samt
!
!		stbar	10 -- 101000 ------------
!
!		movn	10 rd 101100 1 0000 000 rs2  (icc)
!	
!		movrz	10 rd 101111 rs1 0 rs2
!
!		jmpl	10 rd 111000 rs1 1 simm13
!
!
!	IMR_ENB18_14	Cases	rs 1 field
!		add	10 rd 000000 rs1 1 simm13  vary Rs from 0 to 31
!
!
!	IMR_ENB13 cases
!
!		addcc	10 rd 010000 rs1 0 rs2
!		addcc	10 rd 010000 rs1 1 simm13
!		addccc	10 rd 011000 rs1 0 rs2
!		addccc	10 rd 011000 rs1 1 simm13
!
!
!	IMR_ENB12_5 cases
!		bpn,a	00 1 0000 001 00 0, 19 bit immed  one hot through 12:5
!
!	IMR_ENB4_0 cases
!		bpn,a	00 1 0000 001 00 0, 19 bit immed  one hot through 4:1
!
!	Combo cases TBD, about a dozen
!
!-------------------------------------------------------------------------------------
!
!	Table driven test, 2 xwords per entry (16 bytes)
!	.xword	INST_MASK_REG value
!	.xword	instr not trapped, instr to check
!
!	If MSW of INST_MASK_REG is 0 then done
!
!	Use %g regs for test, normal dest for test instr is %g0
!
!	Test_loop_start:
!		get next INST_MASK_REG value
!		if MSW of INST_MASK_REG value is 0 then done
!		get next instr to check pkg
!		stx instr to check, nop to TEST_Label
!		jmpl to TEST_flow_start 
!
!
!
!
!
!
!		.align 32
!	TEST_flow_start:	
!		nop
!		nop
!	TEST_Label:	
!		nop	! this instruction should not trap
!		nop	! store instruction to trap on here
!		nop	! nop required here in case we use a BN or call instr
!	        ta      T_BAD_TRAP
!		nop
!
!
!
!
!
!
!-------------------------------------------------------------------------------------
!
!	

.text
.global main

main:                   !  test enters here from boot in user mode

th_fork(th_main)
th_main_0:
	or	%g0,0,%g7
        setx	active_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop

th_main_1:
	or	%g0,1,%g7
        setx	watcher_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop
	
th_main_2:
	or	%g0,2,%g7
        setx	watcher_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop
	
th_main_3:
	or	%g0,3,%g7
        setx	watcher_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop


!
!       Note that this 8KB segment should be mapped VA==PA==RA
!
SECTION .FIRST_THREAD_SEC TEXT_VA=0x0000000040008000
   attr_text {
        Name = .FIRST_THREAD_SEC,
        VA= 0x0000000040008000,
        PA= ra2pa(0x0000000040008000,0),
        RA= 0x0000000040008000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1,  TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .FIRST_THREAD_SEC,
        hypervisor
        }

.global active_thread
.global watcher_thread
!
!
watcher_thread:	
	ta      T_CHANGE_HPRIV			! enter Hyper mode
        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l2       ! D$ + I$ enable bits
	add	%g0,LSU_CONTROL_REG_DIMMU_MASK,%l3	! I & D MMU enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1				! insure I$ & D$ are enabled
        or      %l3,%l1,%l1				
	xor     %l3,%l1,%l1				! insure IMMU & DMMU are disabled	 
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI
        ta      T_CHANGE_NONHPRIV			! exit Hyper mode
!
	setx	Test_sync_word,%i1,%i0
	or	%g0,0x0ff,%l0
!
	or	%l1,60,%l1
!	
watcher_wait_loop:					! give T0 time to setup the call
	ldub	[0+%i0],%l3
	cmp	%l3,%l0
	be	watcher_start
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	subcc	%l1,1,%l1
	bnz	watcher_wait_loop
	nop
	nop
        ta      T_BAD_TRAP	
	nop

	
watcher_start:	
        ta      T_CHANGE_HPRIV			! enter Hyper mode
	rdhpr	%hpstate,%l0
	setx	0x00000400,%l1,%l2		! bit 10 is the IBE bit
	or	%l0,%l2,%l0			! set the IBE bit in HPSTATE
	wrhpr	%l0,0,%hpstate
	ta	T_CHANGE_NONHPRIV		! back to user mode
	nop
	nop
	nop
	nop
	nop
	add	%g0,0,%g0
	call	wlbl1				! this instruction should be intercepted
wlbl1:	nop

extra_wait:	
!
	or	%l1,2,%l1			! let treads 1-3 all get past the call
!
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	subcc	%l1,1,%l1
	bnz	extra_wait
	nop
!	
        ta      T_BAD_TRAP	
	nop

	

active_thread:
	or	%g0,INST_MASK_REG_VA,%g3

Turn_IDMMU_off:
        ta      T_CHANGE_HPRIV			! enter Hyper mode
        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l2       ! D$ + I$ enable bits
	add	%g0,LSU_CONTROL_REG_DIMMU_MASK,%l3	! I & D MMU enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1				! insure I$ & D$ are enabled
        or      %l3,%l1,%l1				
	xor     %l3,%l1,%l1				! insure IMMU & DMMU are disabled	 
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI
        ta      T_CHANGE_NONHPRIV			! exit Hyper mode
	
	
!!! check for IBP with IBE off
Chk_IBP_no_IBE:	
	ldx	[%g0+0],%l5
        ta      T_CHANGE_HPRIV			! enter Hyper mode
	stxa	%l5,[%g3]INST_MASK_REG_ASI	! setup intercept reg
	ta	T_CHANGE_NONHPRIV		! back to user mode	
	nop
	bn	lbl0				! should not trap
	nop
lbl0:	nop
	ta      T_CHANGE_HPRIV			! enter Hyper mode
	stxa	%g0,[%g3]INST_MASK_REG_ASI	! clear intercept register
	ta	T_CHANGE_NONHPRIV		! back to user mode	
	nop

!
!  No problem with IBP with IBE off, so continue
!
Set_IBE_bit:	
        ta      T_CHANGE_HPRIV			! enter Hyper mode
	rdhpr	%hpstate,%l0
	setx	0x00000400,%l1,%l2		! bit 10 is the IBE bit
	or	%l0,%l2,%l0			! set the IBE bit in HPSTATE
	wrhpr	%l0,0,%hpstate
	ta	T_CHANGE_NONHPRIV		! back to user mode

!
!
!  enable trapping of call instruction
Enable_call_trap:	
	setx	call_trap_setup,%i1,%i0
	ldx	[%i0],%l5
        ta      T_CHANGE_HPRIV			! enter Hyper mode
	stxa	%l5,[%g3]INST_MASK_REG_ASI	! setup intercept reg
	ta	T_CHANGE_NONHPRIV		! back to user mode

	setx	Test_sync_word,%i1,%i0
	or	%g0,0x0ff,%l0
	stb	%l0,[0+%i0]			! tell other threads to start
!
	or	%l1,128,%l1			! max wait count
!
!
T0_wait_loop:	
	lduw	[0+%i0],%l0
	addcc	%l0,1,%l0
	bz	exit_wait_loop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	subcc	%l1,1,%l1
	bnz	T0_wait_loop
	nop
	nop
        ta      T_BAD_TRAP	
	nop
	
	.align 32
	
exit_wait_loop:
	setx	active_thread_cont,%l0,%o5
        jmpl    %o5, %o7
        nop

call_trap_setup:	
	.word	0+IMR_ENB31_30_mask			
	.word	0x40000000				! match on bits 31:30 = 01	
	
!
!
!----------------------------------------------------------------------------------
!
!
	
!       Note that this 6KB segment should be mapped VA==PA==RA
!
SECTION .DATA_REMAP_SEC DATA_VA=0x0000000040010000
   attr_data {
        Name = .DATA_REMAP_SEC,
        VA= 0x0000000040010000,
        PA= ra2pa(0x0000000040010000,0),
        RA= 0x0000000040010000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
	uninitialized,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size_Ptr=0, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_data {
        Name = .DATA_REMAP_SEC,
        hypervisor
        }

	
!
!       Note that this 6KB segment should be mapped VA==PA==RA
!
SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040010000
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        VA= 0x0000000040010000,
        PA= ra2pa(0x0000000040010000,0),
        RA= 0x0000000040010000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size_Ptr=0, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        hypervisor
        }
!
!-------------------------------------------------------------------------------------
!
!	%g1	address of current Test_driver_table entry
!	%g2	Address of "Test_label"
!	%g3	INST_MASK_REG_VA for ASI store
!	%g4	
!	%g5	Address of "Test_label"+4
!	%g6
!	%g7
!
!
!
!
!
!
!-------------------------------------------------------------------------------------
!

.text
.global trap_0x76_handler
.global active_thread_cont
.global Trap_returns_here
.global Test_sync_word
!
!
active_thread_cont:
	setx	Test_driver_table,%l0,%g1	! establish addressability
	or	%g1,%g0,%i7			! debug
	setx	Test_Label,%l0,%g2
	add	%g2,4,%g4			! address we should trap on

	setx	nop_instr,%i1,%i0
	setx	Trap_returns_here,%i1,%i2
	lduw	[%i0],%l0
	stw	%l0,[%i2]			! convert the BR into a nop


			
Test_loop_start:
	lduw	[%g1+0],%l4			! get control word
	ldx	[%g1+0],%l5			! get new ASI data
	ldx	[%g1+8],%l6			! get instrns.
	brz	%l4,Test_passed
	
	stx	%l6,[%g2+0]			! setup instr(s) to test
	nop
	nop					! 6 cycles for the store to propagate
	nop
	nop
	nop
	nop
	
	ba	Test_flow_start			! do the test
	nop

	
		
Test_passed:	
	ta      T_GOOD_TRAP	
	nop

Test_fail:	
        ta      T_BAD_TRAP	
	nop


	
	.align 64		! on L2 cache bdry	
Trap_returns_here:		! with a RETRY

	ba	pass0
	sub	%g1,%i7,%g0			! debug
!
! %l1 has the trapped instruction address	
	cmp	%l1,%g4
	bne	Test_fail
nop_instr:	
	nop
	ba	Test_loop_start
	add	%g1,16,%g1

pass0:
	setx	Test_sync_word,%i1,%i0
	add	%g7,%i0,%i0
	or	%g0,0x0ff,%l0
	stb	%l0,[%i0]			! indicate thread intercepted	
	ta      T_GOOD_TRAP	
	nop
	
!
!
trap_0x76_handler:		   
	or	%g0,INST_MASK_REG_VA,%l2  
	stxa	%g0,[%l2]INST_MASK_REG_ASI
	rdpr	%tpc,%l1
	setx	Trap_returns_here,%o0,%l4 
	wrpr	%l4,0,%tpc
	add	%l4,4,%l4
	wrpr	%l4,0,%tnpc		 
	retry
!
!
!		
	.align 32
Test_flow_start:
	ldx	[%g2+0],%l0			! debug, see real instr.	140
	
        ta      T_CHANGE_HPRIV			! enter Hyper mode		144
	stxa	%l5,[%g3]INST_MASK_REG_ASI	! setup intercept reg		148
	ta	T_CHANGE_NONHPRIV		! back to user mode		14c
	nop					!				150
	nop					!				154
	nop					!				158
	nop					!				15c
Test_Label:	
	nop	! this instruction should not trap
	nop	! store instruction to trap on here
	nop	! nop required here in case we use a BN or call instr
	nop
	or	%g0,%g1,%g1			! debug
	or	%g0,%l5,%l5			! debug
	or	%g0,%l6,%l6  			! debug
        ta      T_BAD_TRAP	
	nop
!
!
!
	.align 32
Test_sync_word:	.xword	0
	
	
	.align 4096		!  easy bdry for counting cycles
Test_driver_table:
!
! 0x000
	.word	0+IMR_ENB31_30_mask+IMR_ENB24_19_mask	
	.word	0x00800000				! match on bits 31:30 = 00 && 24:19 = 0 1000 0
	nop						! should not trap
	bn	lbl1					! should trap
lbl1:	
!
! 0x010
	.word	0+IMR_ENB31_30_mask			
	.word	0x40000000				! match on bits 31:30 = 01
	nop						! should not trap
	call	lbl2					! should trap
lbl2:	
!
! 0x020
	.word	0+IMR_ENB31_30_mask+IMR_ENB24_19_mask	
	.word	0x80000000				! match on bits 31:30 = 10 && 24:19 = 0 0000 0
	ldx	[%g1+0],%o0				! should not trap
	add	%g0,%g0,%g0				! should trap
! 0x030
	.word	0+IMR_ENB31_30_mask+IMR_ENB24_19_mask		
	.word	0xc0000000				! match on bits 31:30 = 11 && 24:19 = 0 0000 0
	add	%g0,%g0,%g0				! should not trap
	lduw	[%g1+0],%o0				! should trap
!
!
! 0x040
	.word	0+IMR_ENB31_19_masks		
	.word	0x80000000				! match on bits 29:25 = 00 000
	add	%g1,%g0,%g1				! should not trap
	add	%g0,%g0,%g0				! should trap
! 0x050
	.word	0+IMR_ENB31_19_masks		
	.word	0x82000000				! match on bits 29:25 = 00 001
	add	%g0,0,%g0				! should not trap
	add	%g1,0,%g1				! should trap
! 0x060
	.word	0+IMR_ENB31_19_masks		
	.word	0x84000000				! match on bits 29:25 = 00 010
	add	%g1,%g0,%g1				! should not trap
	add	%g2,%g0,%g2				! should trap
! 0x070
	.word	0+IMR_ENB31_19_masks		
	.word	0x88000000				! match on bits 29:25 = 00 100
	add	%g0,0,%g0				! should not trap
	add	%g4,0,%g4				! should trap
! 0x080
	.word	0+IMR_ENB31_19_masks		
	.word	0x90000000				! match on bits 29:25 = 01 000
	add	%g1,%g0,%g1				! should not trap
	add	%8,%g0,%8				! should trap
! 0x090
	.word	0+IMR_ENB31_19_masks		
	.word	0xa0000000				! match on bits 29:25 = 10 000
	add	%g0,%g0,%g0				! should not trap
	add	%16,%g0,%16				! should trap
!
!
! 0x0a0	
	.word	0+IMR_ENB31_19_masks			
	.word	0x80000000				! match on bits 24:19 = 0 0000 0
	or	%g1,%g0,%g1				! should not trap
	add	%g0,%g0,%g0				! should trap
! 0x0b0
	.word	0+IMR_ENB31_19_masks		
	.word	0x80080000				! match on bits 24:19 = 0 0000 1
	or	%g1,%g0,%g1				! should not trap
	and	%g0,%g0,%g0				! should trap
! 0x0c0
	.word	0+IMR_ENB31_19_masks		
	.word	0x80100000				! match on bits 24:19 = 0 0001 0
	and	%g0,%g0,%g0				! should not trap
	or	%g1,%g0,%g0				! should trap
! 0x0d0
	.word	0+IMR_ENB31_19_masks		
	.word	0x80180000				! match on bits 24:19 = 0 0001 1
	and	%g0,%g0,%g0				! should not trap
	xor	%g1,%g0,%g0				! should trap
! 0x0e0
	.word	0+IMR_ENB31_19_masks		
	.word	0x80200000				! match on bits 24:19 = 0 0010 0
	or	%g1,%g0,%g1				! should not trap
	sub	%g0,%g0,%g0				! should trap
! 0x0f0
	.word	0+IMR_ENB31_19_masks		
	.word	0x80280000				! match on bits 24:19 = 0 0010 1
	or	%g1,%g0,%g1				! should not trap
	andn	%g0,%g0,%g0				! should trap
! 0x100
	.word	0+IMR_ENB31_19_masks		
	.word	0x80300000				! match on bits 24:19 = 0 0011 0
	and	%g0,%g0,%g0				! should not trap
	orn	%g1,%g0,%g0				! should trap
! 0x110
	.word	0+IMR_ENB31_19_masks		
	.word	0x80380000				! match on bits 24:19 = 0 0011 1
	and	%g0,%g0,%g0				! should not trap
	xnor	%g1,%g0,%g0				! should trap
! 0x120
	.word	0+IMR_ENB31_19_masks		
	.word	0x80400000				! match on bits 24:19 = 0 0100 0
	subc	%g2,%g0,%g0				! should not trap
	addc	%g2,%g0,%g0				! should trap
! 0x130
	.word	0+IMR_ENB31_19_masks		
	.word	0x80600000				! match on bits 24:19 = 0 0110 0
	addc	%g2,%g0,%g0				! should not trap
	subc	%g2,%g0,%g0				! should trap
! 0x140
	.word	0+IMR_ENB31_19_masks		
	.word	0x80800000				! match on bits 24:19 = 0 1000 0
	addc	%g2,%g0,%g0
	addcc	%g2,%g0,%g0
! 0x150
	.word	0+IMR_ENB31_19_masks		
	.word	0x80880000				! match on bits 24:19 = 0 1000 1
	nop
	andcc	%g2,%g0,%g0
! 0x160
	.word	0+IMR_ENB31_19_masks		
	.word	0x80a00000				! match on bits 24:19 = 0 1010 0
	nop
	subcc	%g2,%g0,%g0
! 0x170
	.word	0+IMR_ENB31_19_masks		
	.word	0x80a80000				! match on bits 24:19 = 0 1010 1
	nop
	andncc	%g2,%g0,%g0
! 0x180
	.word	0+IMR_ENB31_19_masks		
	.word	0x80c00000				! match on bits 24:19 = 0 1100 0
	nop
	addccc	%g2,%g0,%g0
! 0x190
	.word	0+IMR_ENB31_19_masks		
	.word	0x80e00000				! match on bits 24:19 = 0 1110 0
	nop
	subccc	%g2,%g0,%g0
! 0x1a0
	.word	0+IMR_ENB31_19_masks		
	.word	0x81280000				! match on bits 24:19 = 1 0010 1
	nop
	sll	%g2,%g0,%g0
! 0x1b0
	.word	0+IMR_ENB31_19_masks		
	.word	0x81380000				! match on bits 24:19 = 1 0011 1
	nop
	sra	%g2,%g0,%g0
! 0x1c0
	.word	0+IMR_ENB31_19_masks		
	.word	0x81600000				! match on bits 24:19 = 1 0110 0
	nop
	movn	%xcc,%g2,%g0	
! 0x1d0
	.word	0+IMR_ENB31_19_masks		
	.word	0x81780000				! match on bits 24:19 = 1 0111 1
	nop
	movrz	%g2,0,%g0
!
!
! 0x1e0	
	.word	0+IMR_ENB31_19_masks+IMR_ENB13_mask		
	.word	0x80002000				! match on bits 29:25 = 10 000 & bit 13 = 1
	add	%g0,%g0,%g0				! should not trap
	add	%g0,0,%g0				! should trap
		
! 0x1f0	
	.word	0+IMR_ENB31_19_masks+IMR_ENB13_mask		
	.word	0x80000000				! match on bits 29:25 = 10 000 & bit 13 = 0
	add	%g0,0,%g0				! should not trap
	add	%g0,%g0,%g0				! should trap
	
!
!	
! 0x200	
	.word	0+IMR_ENB31_19_masks+IMR_ENB18_14_mask
	.word	0x80000000				! match on bits src1 = 000 00
	add	%g1,%g0,%g0				! should not trap
	add	%g0,%g0,%g0				! should trap	
! 0x210	
	.word	0+IMR_ENB31_19_masks+IMR_ENB18_14_mask
	.word	0x80004000				! match on bits src1 = 000 01
	add	%g0,%g0,%g0				! should not trap
	add	%1,%g0,%g0				! should trap		
! 0x220	
	.word	0+IMR_ENB31_19_masks+IMR_ENB18_14_mask
	.word	0x80008000				! match on bits src1 = 000 10
	add	%g0,%g0,%g0				! should not trap
	add	%g2,%g0,%g0				! should trap		
! 0x230	
	.word	0+IMR_ENB31_19_masks+IMR_ENB18_14_mask
	.word	0x8000c000				! match on bits src1 = 000 11
	add	%g0,%g0,%g0				! should not trap
	add	%g3,%g0,%g0				! should trap		
! 0x240	
	.word	0+IMR_ENB31_19_masks+IMR_ENB18_14_mask
	.word	0x80010000				! match on bits src1 = 001 00
	add	%g0,%g0,%g0				! should not trap
	add	%g4,%g0,%g0				! should trap	
! 0x250	
	.word	0+IMR_ENB31_19_masks+IMR_ENB18_14_mask
	.word	0x80020000				! match on bits src1 = 010 00
	add	%g0,%g0,%g0				! should not trap
	add	%8,%g0,%g0				! should trap		
! 0x260	
	.word	0+IMR_ENB31_19_masks+IMR_ENB18_14_mask
	.word	0x80040000				! match on bits src1 = 100 00
	add	%g0,%g0,%g0				! should not trap
	add	%16,%g0,%g0				! should trap	
!
!
! 0x270
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000000				! match on bits 12:5 = 0 0000 000
	add	%g0,0x0080,%g0				! should not trap
	add	%g0,0x0000,%g0				! should trap	
! 0x280
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000020				! match on bits 12:5 = 0 0000 001
	add	%g0,0x0000,%g0				! should not trap
	add	%g0,0x0020,%g0				! should trap	
! 0x290
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000040				! match on bits 12:5 = 0 0000 010
	add	%g0,0x0000,%g0				! should not trap
	add	%g0,0x0040,%g0				! should trap	

! 0x2a0
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000080				! match on bits 12:5 = 0 0000 100
	add	%g0,0x0000,%g0				! should not trap
	add	%g0,0x0080,%g0				! should trap	
	
! 0x2b0
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000100				! match on bits 12:5 = 0 0001 000
	add	%g0,0x0000,%g0				! should not trap
	add	%g0,0x0100,%g0				! should trap	

! 0x2c0
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000200				! match on bits 12:5 = 0 0010 000
	add	%g0,0x0100,%g0				! should not trap
	add	%g0,0x0200,%g0				! should trap	
	
! 0x2d0
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000400				! match on bits 12:5 = 0 0100 000
	add	%g0,0x0b00,%g0				! should not trap
	add	%g0,0x0400,%g0				! should trap	

! 0x2e0
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80000800				! match on bits 12:5 = 0 1000 000
	add	%g0,0x0700,%g0				! should not trap
	add	%g0,0x0800,%g0				! should trap	
	
! 0x2f0
	.word	0+IMR_ENB31_19_masks+IMR_ENB12_5_mask
	.word	0x80001000				! match on bits 12:5 = 1 0000 000
	add	%g0,0x1080,%g0				! should not trap
	add	%g0,0x1000,%g0				! should trap	
!
!
! 0x300
	.word	0+IMR_ENB31_19_masks+IMR_ENB4_0_mask
	.word	0x80000000				! match on bits 4:0 =  0 0000
	add	%g0,%g1,%g0				! should not trap
	add	%g0,%g0,%g0				! should trap
! 0x310
	.word	0+IMR_ENB31_19_masks+IMR_ENB4_0_mask
	.word	0x80000001				! match on bits 4:0 =  0 0001
	add	%g0,%g0,%g0				! should not trap
	add	%g0,%g1,%g0				! should trap
! 0x320
	.word	0+IMR_ENB31_19_masks+IMR_ENB4_0_mask
	.word	0x80000002				! match on bits 4:0 =  0 0010
	add	%g0,%g1,%g0				! should not trap
	add	%g0,%g2,%g0				! should trap
! 0x330
	.word	0+IMR_ENB31_19_masks+IMR_ENB4_0_mask
	.word	0x80000004				! match on bits 4:0 =  0 0100
	add	%g0,%g5,%g0				! should not trap
	add	%g0,%g4,%g0				! should trap

! 0x340
	.word	0+IMR_ENB31_19_masks+IMR_ENB4_0_mask
	.word	0x80000008				! match on bits 4:0 =  0 1000
	add	%g0,%12,%g0				! should not trap
	add	%g0,%8,%g0				! should trap
! 0x350
	.word	0+IMR_ENB31_19_masks+IMR_ENB4_0_mask
	.word	0x80000010				! match on bits 4:0 =  1 0000
	add	%g0,%31,%g0				! should not trap
	add	%g0,%16,%g0				! should trap
!
!
!   $$$  end of table
	.word	0					! end of table
	.word	0
	ta      T_BAD_TRAP
	nop


SECTION .ADDR_0x0SEC DATA_VA=0x0
   attr_data {
        Name = .ADDR_0x0SEC
        VA= 0x0
        PA= ra2pa(0x0,0),
        RA= 0x0,
        part_0_d_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size_Ptr=0, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
.data
.xword 0x0

