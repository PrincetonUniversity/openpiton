// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_intexc1.s
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
 * Name:   tr_intexc1.s
 * Date:   03/6/02
 *
 *
 *  Description:
 *  	
 *      Jmpl/return to mem address not aligned and VA OOR traps;
 *	Also, sequential execution from 0x00007ffffffffff8 to
 *	0x0000800000000000.
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Division_By_Zero
#define	H_T0_Tag_Overflow
#define	H_HT0_Mem_Address_Not_Aligned_0x34	my_mem_address_not_aligned
#define	H_HT0_Instruction_access_exception_0x08	my_iacc_exc
#define	H_T0_Window_Spill_7_Normal_Trap
#define	H_T0_Window_Spill_0_Normal_Trap
#define	H_T0_Window_Fill_7_Normal_Trap
#define	H_HT0_Illegal_instruction_0x10		my_illegal_exc

#define My_T0_Division_By_Zero  done;
#define My_T0_Tag_Overflow done;
#define	My_T0_Window_Spill_7_Normal_Trap done;
#define	My_T0_Window_Spill_0_Normal_Trap \
subcc	%l6, 0x1, %l6; \
brz,a  %l6, goto_retry; \
saved; \
goto_retry: retry;
#define	My_T0_Window_Fill_7_Normal_Trap done;

/*******************************************************/

#include "boot.s"

#define	ASI_NUCLEUS_QUAD_LDD	0x24

#define	ASI_IMMU		0x50
#define	ASI_ITLB_DATA_IN	0x54
#define	ASI_ITLB_DATA_ACCESS	0x55
#define	ASI_DMMU		0x58
#define	ASI_DTLB_DATA_IN	0x5C
#define	ASI_DTLB_DATA_ACCESS	0x5D

#define	VA_ASI_ITLB_TAG_ACCESS	0x30
#define	VA_ASI_DTLB_TAG_ACCESS	0x30

#define	ITLB_WRITE_ENTRY	4
#define	DTLB_WRITE_ENTRY	4

#define	ITLB_ENTRY_VA	0x00007fffffffe000
#define	DTLB_ENTRY_VA	0x00007fffffffe000

.text
.global main  

attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_VA,
        RA=MAIN_BASE_DATA_RA,
        tsbonly,
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

main:
	ta	T_CHANGE_PRIV

!!------------------------ jmpl/return - mem-address not aligned

	setx	jmpl_tgt0, %l0, %l1	

	or	%l1, 0x2, %l1
	jmpl	%l1+%g0, %o2
	save

	ba,a	br_tgt0
	nop

jmpl_tgt0:

	add	%i2, 11, %l1
	return	%l1
	nop

br_tgt0:


	mov	0x0, %l7			! fail flag

!!------------------------ VA Out of Range: jmpl/return

	setx	0x0001000000000000, %l0, %l1	! [48] should cause trap
	setx	next0, %l0, %l2			! This where to come back from trap
	setx	jmpl0, %l0, %l3			! For comparing tpc, tnpc

jmpl0:
 	jmpl	%l1+%g0, %o2			! This fails now. Simics bug
	nop

next0:
	setx	0x0001000000000000, %l0, %l1	! [48] should cause trap
	setx	next1, %l0, %l2			! This where to come back from trap
	setx	ret0+0x10, %l0, %l3		! For comparing tpc, tnpc

ret0:
 	return	%l1+%g0				! First it will casue fill trap then oor
	mov	%l1, %o1
	save
	mov	%i1, %l1			! Make copy into next window
 	return	%l1+%g0				! First it will casue fill trap then oor
	nop

next1:

!!-------- Sequential execution from 0x00007ffffffffff8 to 0x0000_8000_0000_0000

       /*==0x00007ffffffffff8, addr to copy 'nop; save' to and jmpl to*/
	setx		DTLB_ENTRY_VA+0x1ff8, %l0, %l4	!src of nop/save
	setx		test_seq_inst0, %l0, %g1	!tgt of nop/save
	ldx		[%g1], %g2		!get nop/save
	stx		%g2, [%l4]		!copy nop/save
	flush		%l4+%g0			! Flush that line

	add		%l4, 0x8, %l3		! Trap PC should point to last inst. before va hole
	setx		next2, %l0, %l2		! This where to come back from trap

	wrpr		%g0, 0x0, %wstate	! We want spill trap
	wrpr		%g0, 0x0, %cansave
	wrpr		%g0, 0x2, %cleanwin
	wrpr		%g0, 0x2, %cwp		! Save got Window_Spill_0_Normal_Trap
	mov		0x4, %l6		! 4 times; We want npc with oor bit to go around
	wrpr		%g0, 0x0, %cwp		! 

	jmpl		%l4+%g0, %g0		!goto nop;save; where save takes
	nop					! traps and then falls thru to
						! 0x0000800000000000

next2:

fail_check:
	brnz	%l7, test_fail
	nop


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
test_seq_inst0:
	.word	0x01000000	! ==nop
	.word	0x81e00000	! ==save; cause Window_Spill_0_Normal_Trap

scratch:


SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x13002000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }

.global	my_mem_address_not_aligned
.global	my_iacc_exc
.global	my_illegal_exc
my_mem_address_not_aligned:
	mov	0x3, %l2
	andn	%l1, %l2, %l1
	retry	

my_iacc_exc:
	rdpr	%cwp, %g3
	brz	%g3, tpc_check
	nop
	wrpr	%g0, 0x1, %canrestore
	restore	
tpc_check:
	rdpr	%tpc, %g1
	rdpr	%tnpc, %g2
	subcc	%g1, %l3, %g0
	add	%l7, 0x1, %g3
	movne	%icc, %g3, %l7
	wrpr	%g0, 0x16, %pstate
	wrpr	%g0, 0x0, %tl
	wrpr	%g0, 0x0, %gl
	jmpl	%l2+%g0, %g0
	wrhpr   0x800, %hpstate

my_illegal_exc:
	setx	0x01000000, %l0, %g2			! Change inst. to nop
	wrpr	%g0, 0x16, %pstate
	rdpr	%tpc, %g1
	stx	%g2, [%g1]
	flush	%g1					! Invalidate i-cache
	retry


SECTION .TEST_AREA TEXT_VA=ITLB_ENTRY_VA
attr_text {
        Name = .TEST_AREA
        VA=ITLB_ENTRY_VA
        RA=0x0070000000
        PA=ra2pa(0x0070000000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.text 
nop
.align 4096
nop
.align 2048
nop
.align 1024
nop
.align  512
nop
.align  256
nop
.align  128
nop
.align   64
nop
.align   32
nop
.align   16
nop
.align    8
nop
.align    4
nop

