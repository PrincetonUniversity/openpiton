// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_irf_global.s
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
 * Name:    exu_irf_global.s
 * Date:    June 24, 2003
 *
 *  Description: Data integrity check all globals. Also check traversing
 *	    from every global level to every global level.    
 *
 *  This test depends on SAS.
 *
 **********************************************************************/

#define NUM_PATTERNS	35
#define	NUM_GLOBAL_LVLS  4
#define NUM_GLOBAL_TRANS 9
    
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

	! the code has already been through the boot code, so we know the registers 
	! are not too badly broken

	!**********************************************************
	! Trap level 0, all global levels, data integrity
	!**********************************************************
	add	%g0,NUM_GLOBAL_LVLS,%l5
	sub	%g0,1,%l3		! negative one for xor mask
	setx	lz,%l0,%l4
globals_tl0_loop:     
	! for %gl=0 to 3, check %g0 thru %g7
	setx	pattern_start,%l0,%l1
	add	%g0,NUM_PATTERNS,%l2

    	! just for completeness...
	ldx	[%l1],%g0
	brnz	%g0,bad_end
	xor	%l3,%g0,%g0	
	brnz	%g0,bad_end
	nop
        
loop_gltl0: 
	ldx	[%l1],%g1
	xor	%g0,0x1fff,%g1	    ! ^data
	stx	%g1,[%l4+0x0]	    ! store 1s complement for each reg g1-g7
    
	mova	%icc,%g1,%g2
	stx	%g2,[%l4+0x8]
	xor	%g2,0x1fff,%g2	    ! data
    
	mova	%icc,%g2,%g3
	xor	%g3,0x1fff,%g3	    ! ^data
	stx	%g3,[%l4+0x10]
    
	mova	%icc,%g3,%g4
	stx	%g4,[%l4+0x18]
	xor	%g4,0x1fff,%g4	    ! data
    
	mova	%icc,%g4,%g5
	xor	%g5,0x1fff,%g5	    ! ^data 
	stx	%g1,[%l4+0x20]
    
	mova	%icc,%g5,%g6
	stx	%g6,[%l4+0x28]
	xor	%g6,0x1fff,%g6	    ! data
    
	mova	%icc,%g6,%g7
	xor	%g7,0x1fff,%g7	    ! ^data
	stx	%g7,[%l4+0x30]

	sub	%l2,1,%l2
	brgz	%l2,loop_gltl0	    ! next data pattern
	add	%l1,8,%l1

	sub	%l5,1,%l5
	brz	%l5,done_gltl0
	nop
	ta	T_CHANGE_HPRIV
	rdpr	%gl,%l0
	add	%l0,1,%l0
        wrpr	%l0,0,%gl	    ! %gl++
	subcc	%l0,3,%g0
	tneg	T_CHANGE_PRIV       ! stay in hpriv if %gl=3, else goto priv mode
	brgz	%l5,globals_tl0_loop
	nop

done_gltl0: 
	!   ta	T_CHANGE_HPRIV was already done last time through inner loop
	wrpr	%g0,0,%gl	    ! go back to GL=0
	ta	T_CHANGE_NONPRIV

	!**********************************************************
	! Trap level 0, check remaining global state transistions
	!**********************************************************
	setx	next_global,%l0,%l1
	add	%g0,NUM_GLOBAL_TRANS,%l2
	setx	unique_values,%l0,%l4
	ta	T_CHANGE_HPRIV
loop_transitions:
	ldub	[%l1],%l3
	wrpr	%l3,0,%gl
	add	%g1,%g2,%g3	    ! use the globals at this level
	add	%g4,%g5,%g6
	add	%g0,%g7,%g1
	ldx	[%l4+0x00],%g1	    ! load unique values to each global level
	ldx	[%l4+0x08],%g2
	ldx	[%l4+0x10],%g3
	ldx	[%l4+0x18],%g4
	ldx	[%l4+0x20],%g5
	ldx	[%l4+0x28],%g6
	ldx	[%l4+0x30],%g7
	add	%l4,0x38,%l4
	sub	%l2,1,%l2
	brgz	%l2,loop_transitions
	add	%l1,1,%l1

	!**********************************************************
	! All globals have unique values left by last test, one more
	! time just to read them and make sure they are still good.
	!**********************************************************
	add	%g0,NUM_GLOBAL_LVLS,%l5
	add	%g0,0,%l3
	setx	lz,%l0,%l4	
	ta	T_CHANGE_HPRIV
loop_use_globals: 
	wrpr	%l3,0,%gl
	stx	%g1,[%l4+0x00]	    ! someday we could make this self-checking
	stx	%g2,[%l4+0x08]	    ! but for now, just force SAS to look at regs
	stx	%g3,[%l4+0x10]	
	stx	%g4,[%l4+0x18]	
	stx	%g5,[%l4+0x20]	
	stx	%g6,[%l4+0x28]	
	stx	%g7,[%l4+0x30]	
	add	%l4,0x38,%l4
    
	sub	%l5,1,%l5
	brgz	%l5,loop_use_globals
	add	%l3,1,%l3

	wrpr	%g0,0,%gl	    ! go back to GL=0
	ta	T_CHANGE_NONPRIV
    
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

pattern_start:
	.word	0xaaaaaaaa, 0xaaaaaaaa
	.word	0x00000000, 0x00000000
	.word	0xffffffff, 0x00000001
	.word	0x7fffffff, 0x00000002
	.word	0xfffffffe, 0x00000004
	.word	0xbfffffff, 0x00000008
	.word	0xfffffffd, 0x00000010
	.word	0xdfffffff, 0x00000020
	.word	0xfffffffb, 0x00000040
	.word	0xefffffff, 0x00000080
	.word	0xfffffff7, 0x00000100
	.word	0xf7ffffff, 0x00000200
	.word	0xffffffef, 0x00000400
	.word	0xfbffffff, 0x00000800
	.word	0xffffffdf, 0x00001000
	.word	0xfdffffff, 0x00002000
	.word	0xffffffbf, 0x00004000
	.word	0xfeffffff, 0x00008000
	.word	0xffffff7f, 0x00010000
	.word	0xff7fffff, 0x00020000
	.word	0xfffffeff, 0x00040000
	.word	0xffbfffff, 0x00080000
	.word	0xfffffdff, 0x00100000
	.word	0xffdfffff, 0x00200000
	.word	0xfffffbff, 0x00400000
	.word	0xffefffff, 0x00800000
	.word	0xfffff7ff, 0x01000000
	.word	0xfff7ffff, 0x02000000
	.word	0xffffefff, 0x04000000
	.word	0xfffbffff, 0x08000000
	.word	0xffffdfff, 0x10000000
	.word	0xfffdffff, 0x20000000
	.word	0xffffbfff, 0x40000000
	.word	0xfffeffff, 0x80000000
    	.word	0xffff7fff, 0x00000000

next_global:	
	.byte	0x00, 0x02, 0x01, 0x03
	.byte	0x02, 0x00, 0x03, 0x01
	.byte	0x00
    
.align 8
unique_values:	
	.word	0x01010101, 0x01010101
	.word	0x02020202, 0x02020202
	.word	0x03030303, 0x03030303
	.word	0x04040404, 0x04040404
	.word	0x05050505, 0x05050505
	.word	0x06060606, 0x06060606
	.word	0x07070707, 0x07070707
	.word	0x11111111, 0x11111111
	.word	0x12121212, 0x12121212
	.word	0x13131313, 0x13131313
	.word	0x14141414, 0x14141414
	.word	0x15151515, 0x15151515
	.word	0x16161616, 0x16161616
	.word	0x17171717, 0x17171717
	.word	0x21212121, 0x21212121
	.word	0x22222222, 0x22222222
	.word	0x23232323, 0x23232323
	.word	0x24242424, 0x24242424
	.word	0x25252525, 0x25252525
	.word	0x26262626, 0x26262626
	.word	0x27272727, 0x27272727  
	.word	0x31313131, 0x31313131
	.word	0x32323232, 0x32323232
	.word	0x33333333, 0x33333333
	.word	0x34343434, 0x34343434
	.word	0x35353535, 0x35353535
	.word	0x36363636, 0x36363636
	.word	0x37373737, 0x37373737      
	.word	0x41414141, 0x41414141
	.word	0x42424242, 0x42424242
	.word	0x43434343, 0x43434343
	.word	0x44444444, 0x44444444
	.word	0x45454545, 0x45454545
	.word	0x46464646, 0x46464646
	.word	0x47474747, 0x47474747
	.word	0x51515151, 0x51515151
	.word	0x52525252, 0x52525252
	.word	0x53535353, 0x53535353
	.word	0x54545454, 0x54545454
	.word	0x55555555, 0x55555555
	.word	0x56565656, 0x56565656
	.word	0x57575757, 0x57575757    
	.word	0x61616161, 0x61616161
	.word	0x62626262, 0x62626262
	.word	0x63636363, 0x63636363
	.word	0x64646464, 0x64646464
	.word	0x65656565, 0x65656565
	.word	0x66666666, 0x66666666
	.word	0x67676767, 0x67676767
	.word	0x71717171, 0x71717171
	.word	0x72727272, 0x72727272
	.word	0x73737373, 0x73737373
	.word	0x74747474, 0x74747474
	.word	0x75757575, 0x75757575
	.word	0x76767676, 0x76767676
	.word	0x77777777, 0x77777777
	.word	0x81818181, 0x81818181
	.word	0x82828282, 0x82828282
	.word	0x83838383, 0x83838383
	.word	0x84848484, 0x84848484
	.word	0x85858585, 0x85858585
	.word	0x86868686, 0x86868686
	.word	0x87878787, 0x87878787
	.word	0x91919191, 0x91919191
	.word	0x92929292, 0x92929292
	.word	0x93939393, 0x93939393
	.word	0x94949494, 0x94949494
	.word	0x95959595, 0x95959595
	.word	0x96969696, 0x96969696
	.word	0x97979797, 0x97979797    
            	
lz:	.space 256,0		! storage area




/***********************************************************************/   

SECTION .CUST_TRAPS         TEXT_VA=0x40000000, DATA_VA=0x41000000

attr_text {
	Name = .CUST_TRAPS,
	RA = 0x40000000,
	PA = ra2pa(0x40000000,0),
	part_0_i_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}
attr_data {
	Name = .CUST_TRAPS,	
	RA = 0x4100000,
	PA = ra2pa(0x41000000,0),
	part_0_d_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}

.text
    
.global trap_spill
trap_spill:
    
.end        
