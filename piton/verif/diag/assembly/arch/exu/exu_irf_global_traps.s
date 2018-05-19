// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_irf_global_traps.s
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
 * Name:    exu_irf_global_traps.s
 * Date:    June 24, 2003
 *
 *  Description: Check traversing from every global level to every 
 *    global level while trap level is non-zero.
 *
 *  This test depends on SAS.
 *
 **********************************************************************/

#define NUM_GLOBAL_HVTRANS_1 8
#define NUM_GLOBAL_HVTRANS_2 8
#define NUM_GLOBAL_PTRANS 7

#define  H_T0_Privileged_opcode_0x11	    privop_trap
#define	 H_HT0_Mem_Address_Not_Aligned_0x34   my_memaddr_not_aligned_trap  
        
#define  MAIN_PAGE_HV_ALSO     
#include "boot.s"

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! No need to run more than one core.
	! All threads do the same thing, except for this one bit of setup... 
th_main_0:
th_main_1:
th_main_2:
th_main_3:

	!*************************************
	! Test global regs in PRIV mode (gl<3)
	!*************************************
	setx	unique_values,%l0,%l4
	ldx	[%l4+0x00],%i1	    ! load unique values to in regs
	ldx	[%l4+0x08],%i2
	ldx	[%l4+0x10],%i3
	ldx	[%l4+0x28],%i4
	ldx	[%l4+0x30],%i5
	ldx	[%l4+0x38],%i6
	ldx	[%l4+0x40],%i7

	setx	next_globalP,%l0,%l1
	add	%g0,NUM_GLOBAL_PTRANS,%l2
	ldx	[%l1],%l4	    ! get the transitions list
	rdpr	%gl,%g0		    ! priviledge operation trap expected

	!*************************************
	! Test global regs in HPRIV mode (gl<4)
	!*************************************
	setx	unique_values1,%l0,%l4
	ldx	[%l4+0x00],%i1	    ! load unique values to in regs
	ldx	[%l4+0x08],%i2
	ldx	[%l4+0x10],%i3
	ldx	[%l4+0x28],%i4
	ldx	[%l4+0x30],%i5
	ldx	[%l4+0x38],%i6
	ldx	[%l4+0x40],%i7

	setx	next_globalHV,%l0,%l1
	add	%g0,NUM_GLOBAL_HVTRANS_2,%l2
	ldx	[%l1+8],%l4	    ! get the transitions list, working backwards
	setx	doubleword,%l0,%l7
	add	%l7,1,%l7	    ! bad alignment
	ldx	[%l7],%l6	    ! mem_addr_not_aligned trap expected

	add	%g0,NUM_GLOBAL_HVTRANS_1,%l2
	ldx	[%l1],%l4	    ! second part of transitions list
	ldx	[%l7],%l6	    ! mem_addr_not_aligned trap expected
	
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop

bad_end:
	ta	T_BAD_TRAP
	nop
	nop
    
!==========================    
.data
.align 0x1fff+1
.data
next_globalP:	
	.byte	0x00, 0x01, 0x00, 0x02
	.byte	0x01, 0x02, 0x00, 0x01
   
next_globalHV:	    
	.byte	0x00, 0x01, 0x03, 0x01	    ! second batch
	.byte	0x00, 0x02, 0x03, 0x00
	.byte	0x01, 0x03, 0x02, 0x01	    ! first batch
	.byte	0x02, 0x00, 0x03, 0x01
    
.align 8
unique_values:	
	.word	0x01010101, 0x01010101
	.word	0x02020202, 0x02020202
	.word	0x03030303, 0x03030303
	.word	0x04040404, 0x04040404
	.word	0x05050505, 0x05050505
	.word	0x06060606, 0x06060606
	.word	0x07070707, 0x07070707
unique_values1:	
	.word	0x91919191, 0x91919191
	.word	0x92929292, 0x92929292
	.word	0x93939393, 0x93939393
	.word	0x94949494, 0x94949494
	.word	0x95959595, 0x95959595
	.word	0x96969696, 0x96969696
	.word	0x97979797, 0x97979797  
doubleword:
	.word	0,0

    
/***********************************************************************/  

SECTION .CUST_HV_TRAPS	    TEXT_VA=0x13002000
attr_text {
        Name = .CUST_HV_TRAPS,
        hypervisor
        }
.text

.global my_memaddr_not_aligned_trap    
my_memaddr_not_aligned_trap:
	nop
loop_hv:        
	and	%l4,0x0ff,%l3	    ! pick off lowest byte
	wrpr	%l3,0,%gl
	mova	%icc,%i1,%g1	    ! load unique values to each global level
	mova	%icc,%i2,%g2
	mova	%icc,%i3,%g3
	mova	%icc,%i4,%g4
	mova	%icc,%i5,%g5
	mova	%icc,%i6,%g6
	mova	%icc,%i7,%g7

    	add	%g1,%g2,%g3	    ! use the globals at this gl level
	add	%g4,%g5,%g6
	add	%g0,%g7,%g1

	srlx	%i1,4,%i1	    ! new unique values
	srlx	%i2,4,%i2
	srlx	%i3,4,%i3
	srlx	%i4,4,%i4
	srlx	%i5,4,%i5
	srlx	%i6,4,%i6
	srlx	%i7,4,%i7

	sub	%l2,1,%l2
	brgz	%l2,loop_hv
    	srlx	%l4,8,%l4	    ! new gl value

    	done        
  


  

/***********************************************************************/   

SECTION .CUST_TRAPS         TEXT_VA=0x40000000

attr_text {
	Name = .CUST_TRAPS,
	RA = 0x40000000,
	PA = ra2pa(0x40000000,0),
	part_0_i_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}

.text
    
.global privop_trap
privop_trap:
    	!**********************************
	! Check  global state transistions
	!**********************************
	nop
loop_transitions:
	and	%l4,0x0ff,%l3	    ! pick off lowest byte
	wrpr	%l3,0,%gl
	mova	%icc,%i1,%g1	    ! load unique values to each global level
	mova	%icc,%i2,%g2
	mova	%icc,%i3,%g3
	mova	%icc,%i4,%g4
	mova	%icc,%i5,%g5
	mova	%icc,%i6,%g6
	mova	%icc,%i7,%g7

    	add	%g1,%g2,%g3	    ! use the globals at this gl level
	add	%g4,%g5,%g6
	add	%g0,%g7,%g1

	sllx	%i1,4,%i1	    ! new unique values
	sllx	%i2,4,%i2
	sllx	%i3,4,%i3
	sllx	%i4,4,%i4
	sllx	%i5,4,%i5
	sllx	%i6,4,%i6
	sllx	%i7,4,%i7

	sub	%l2,1,%l2
	brgz	%l2,loop_transitions
    	srlx	%l4,8,%l4	    ! new gl value

    	done

            	        
.end        
