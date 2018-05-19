// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_ffu_blkst_stall.s
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
 * Name:    dram_ffu_blkst_stall.s (ported from ffu_blkst_stall.s)
 * Date:    Aug 28, 2003
 *
 *  Description: Test the block stores with conflicts from other threads.
 *
 *  This test depends on SAS for result checking.    
 *  Used in dram testing to generate dummy reads for blk init instructions
 *
 **********************************************************************/

#define STORE_LOOP  20
    
#include "asi_s.h"     
#include "boot.s"
   

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads run the same code with different data.
th_main_0:   
    	wr      %g0,0x4,%fprs

	setx	float_data,%l0,%g1
	ldd	[%g1],%f0
	ldd	[%g1],%f2
	ldd	[%g1],%f4
	ldd	[%g1],%f6
	ldd	[%g1],%f8
	ldd	[%g1],%f10
	ldd	[%g1],%f12
	ldd	[%g1],%f14
	ldd	[%g1],%f16
	ldd	[%g1],%f18
	ldd	[%g1],%f20
	ldd	[%g1],%f22
	ldd	[%g1],%f24
	ldd	[%g1],%f26
	ldd	[%g1],%f28
	ldd	[%g1],%f30
    
	rd	%asi,%g1	    ! current value of asi reg

    	ta	T_CHANGE_PRIV

	! these reads are just for debugging information
	add	ASI_PRIMARY_CONTEXT_REG_VAL,%g0,%i0
	ldxa    [%i0]ASI_PRIMARY_CONTEXT_REG,%i1    ! value of primary context
    
	add	ASI_SECONDARY_CONTEXT_REG_VAL,%g0,%i2
	ldxa    [%i2]ASI_SECONDARY_CONTEXT_REG,%i3    ! secondary context

	rd	%asi,%g2

	! and now back to our regularly scheduled testing
	add	%g0,STORE_LOOP,%g3
	setx	target0_primary,%l0,%g2
    	add	%g2,0x000,%l1
	add	%g2,0x040,%l2
	add	%g2,0x080,%l3
	add	%g2,0x0c0,%l4
	add	%g2,0x100,%l5
	add	%g2,0x140,%l6
	add	%g2,0x180,%l7
	add	%g2,0x1c0,%i0
	add	%g2,0x200,%i1
	add	%g2,0x240,%i2
	add	%g2,0x280,%i3
	add	%g2,0x2c0,%i4
    
primary_loop:
	stda	%f0, [%l1]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%l3]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%l5]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%l6]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%l7]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%i0]ASI_BLOCK_AS_IF_USER_PRIMARY
    	stda	%f0, [%i1]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%i2]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%i3]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%i4]ASI_BLOCK_AS_IF_USER_PRIMARY

	sub	%g3,1,%g3
	brgz	%g3,primary_loop
	nop

	! do it again with secondary space. FFU does not care, but what the heck...
	add	%g0,STORE_LOOP,%g3
	setx	target0_secondary,%l0,%g2
        add	%g2,0x000,%l1
	add	%g2,0x040,%l2
	add	%g2,0x080,%l3
	add	%g2,0x0c0,%l4
	add	%g2,0x100,%l5
	add	%g2,0x140,%l6
	add	%g2,0x180,%l7
	add	%g2,0x1c0,%i0
	add	%g2,0x200,%i1
	add	%g2,0x240,%i2
	add	%g2,0x280,%i3
	add	%g2,0x2c0,%i4
    
secondary_loop:
	stda	%f0, [%l1]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%l2]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%l3]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%l4]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%l5]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%l6]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%l7]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%i0]ASI_BLOCK_AS_IF_USER_SECONDARY
    	stda	%f0, [%i1]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%i2]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%i3]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%i4]ASI_BLOCK_AS_IF_USER_SECONDARY

	sub	%g3,1,%g3
	brgz	%g3,secondary_loop
	nop

	! let the other threads finish gracefully
	setx	stop_flag,%l0,%g1
	stx	%g0,[%g1]
	ba	good_end
	nop
    
     
th_main_1: 
    	wr      %g0,0x4,%fprs
	setx	stop_flag,%l0,%g1
	setx    target1,%l0,%g2
	ba	background_noise
	nop
        
th_main_2: 
        wr      %g0,0x4,%fprs 
	setx	stop_flag,%l0,%g1
	setx    target1,%l0,%g2
	ba	background_noise
	nop
    
th_main_3:
        wr      %g0,0x4,%fprs 
	setx	stop_flag,%l0,%g1
	setx    target1,%l0,%g2

background_noise:   
	! create a large load of integer stores using three threads
	add	%g2,0,%l1
	add	%g2,8,%l2
	add	%g2,0x10,%l3
	add	%g2,0x18,%l4
	add	%g2,0x20,%l5
	add	%g2,0x28,%l6
    	add	%g2,0x30,%l7
	add	%g2,0x38,%i0
	add	%g2,0x40,%i1
	add	%g2,0x48,%i2
	add	%g2,0x50,%i3
	add	%g2,0x58,%i4
	add	%g2,0x60,%i5
	add	%g2,0x68,%i6
    	add	%g2,0x70,%i7
	add	%g2,0x78,%o0
	add	%g2,0x80,%o1
	add	%g2,0x88,%o2
	add	%g2,0x90,%o3
	add	%g2,0x98,%o4
	add	%g2,0xa0,%o5
	add	%g2,0xa8,%o6
    	add	%g2,0xb0,%o7    

noise_loop: 
	stx	%l1,[%l1]	    ! 1
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	stx	%l1,[%l1]	    ! 2 
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop
    

	stx	%l1,[%l1]	    ! 3    
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	stx	%l1,[%l1]	    ! 4 
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	stx	%l1,[%l1]	    ! 5   
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop
    
	stx	%l1,[%l1]	    ! 6  
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop    
	
	ldx	[%g1],%l0	    ! thread 0 writes to this addr to end test
	brnz	%l0,noise_loop
	nop
    
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    

!==========================    
.data
.align 0x1fff+1

target1:
	.word	0,0,0,0
.align 1024
target2:    
	.word	0,0,0,0
.align 1024
target3:    
	.word	0,0,0,0
.align 1024


stop_flag:  .word 0xffffffff, 0xffffffff 
float_data: .word 0x3fe80000, 0x12345678   	  	

!*************************************************
#define TARGET_VA_P 0x27100000
SECTION .USER_PRIMARY        DATA_VA=TARGET_VA_P

attr_data {
	Name = .USER_PRIMARY,	
	RA = TARGET_VA_P,
	PA = ra2pa(TARGET_VA_P,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0,  TTE_Context=PCONTEXT, TTE_V=1,  TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,       TTE_P=0,       TTE_W=1
	}

.data
.align 1024
.global target0_primary
target0_primary:  
	.word	0,0,0,0
.align 1024        


!*************************************************    
#define TARGET_VA_S 0x29200000
SECTION .USER_SECONDARY         DATA_VA=TARGET_VA_S

attr_data {
	Name = .USER_SECONDARY,	
	RA = TARGET_VA_S,
	PA = ra2pa(TARGET_VA_S,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0,  TTE_Context=SCONTEXT, TTE_V=1,  TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,        TTE_P=0,      TTE_W=1
	}

.data
.align 1024
.global target0_secondary
target0_secondary:  
	.word	0,0,0,0
.align 1024  
    
          
.end            
