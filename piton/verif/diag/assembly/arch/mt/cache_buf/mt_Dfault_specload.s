// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Dfault_specload.s
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
/*************************************************************
  File:		mt_Dfault_specload.s

  Description:
  -----------
  Test speculative load handling. Load hits but instruction

  $Change: 17073 $
 *************************************************************/

#define THREAD_COUNT    2
#include "boot.s"

.text
.global main
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3

main:

thread_jump:
	th_fork(run_th)

        ba diag_fail
	nop

run_th_0:
		setx		page1,	%i1, %i0
		setx		0x10000,%i1, %i2
		set		0x10,			%l0
page_fault:		
		ld		[%i0],			%i1  ! page fault
		add		%i0,   %i2,	%i0
		subcc	%l0,	1,		%l0
		bne		page_fault
		nop
		ba		diag_pass
		nop

.align 32

run_th_1:
		ba,a	imiss1
.align 32

imiss1:	
		ba,a	imiss2
.align 32

imiss2:	
		ba,a	imiss3
.align 32

imiss3:	
		ba,a	imiss4
.align 32

imiss4:	
		ba,a	imiss5
.align 32

imiss5:	
		ba,a	imiss6
.align 32

imiss6:	
		ba,a	imiss7
.align 32

imiss7:	
		ba,a	imiss8
.align 32

imiss8:	
		ba,a	imiss9
.align 32

imiss9:	
		ba,a	imiss10
.align 32

imiss10:	
		ba,a	imiss11
.align 32

imiss11:	
		ba,a	imiss12
.align 32

imiss12:	
		ba,a	imiss13
.align 32

imiss13:	
		ba,a	imiss14
.align 32

imiss14:	
		ba,a	imiss15
.align 32

imiss15:	
		ba,a	imiss16
.align 32

imiss16:	
		ba		diag_pass
		nop

		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!! Diag PASSED
		
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

!! Diag FAILED

diag_fail:		
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

.data
data_segment:
		.word	0x11110000
		.word	0x11111111
		.word	0x11112222
		.word	0x11113333
		.word	0x11114444
		.word	0x11115555
		.word	0x11116666
		.word	0x11117777

.end


SECTION .PAGE1 DATA_VA=0x170000
attr_data {
        Name = .PAGE1,
        VA=0x170000, PA=0x1100170000, RA=0x100170000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page1

page1:	
		.word 0x00000000
.end

SECTION .PAGE2 DATA_VA=0x180000
attr_data {
        Name = .PAGE2,
        VA=0x180000, PA=0x1100180000, RA=0x100180000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page2

page2:	
		.word 0x11111111
.end

SECTION .PAGE3 DATA_VA=0x190000
attr_data {
        Name = .PAGE3,
        VA=0x190000, PA=0x1100190000, RA=0x100190000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page3

page3:	
		.word 0x22222222
.end

SECTION .PAGE4 DATA_VA=0x1a0000
attr_data {
        Name = .PAGE4,
        VA=0x1a0000, PA=0x11001a0000,  RA=0x1001a0000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page4

page4:	
		.word 0x33333333
.end

SECTION .PAGE5 DATA_VA=0x1b0000
attr_data {
        Name = .PAGE5,
        VA=0x1b0000, PA=0x11001b0000, RA=0x1001b0000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page5

page5:	
		.word 0x44444444
.end

SECTION .PAGE6 DATA_VA=0x1c0000
attr_data {
        Name = .PAGE6,
        VA=0x1c0000, PA=0x11001c0000, RA=0x1001c0000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page6

page6:	
		.word 0x55555555
.end

SECTION .PAGE7 DATA_VA=0x1d0000
attr_data {
        Name = .PAGE7,
        VA=0x1d0000, PA=0x11001d0000, RA=0x1001d0000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page7

page7:	
		.word 0x66666666
.end

SECTION .PAGE8 DATA_VA=0x1e0000
attr_data {
        Name = .PAGE8,
        VA=0x1e0000, PA=0x11001e0000, RA=0x1001e0000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page8

page8:	
		.word 0x77777777
.end

SECTION .PAGE9 DATA_VA=0x1f0000
attr_data {
        Name = .PAGE9,
        VA=0x1f0000, PA=0x11001f0000, RA=0x1001f0000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page9

page9:	
		.word 0x88888888
.end

SECTION .PAGE10 DATA_VA=0x200000
attr_data {
        Name = .PAGE10,
        VA=0x200000, PA=0x1100200000, RA=0x100200000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page10

page10:	
		.word 0x99999999
.end

SECTION .PAGE11 DATA_VA=0x210000
attr_data {
        Name = .PAGE11,
        VA=0x210000, PA=0x1100210000, RA=0x100210000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page11

page11:	
		.word 0xaaaaaaaa
.end

SECTION .PAGE12 DATA_VA=0x220000
attr_data {
        Name = .PAGE12,
        VA=0x220000, PA=0x1100220000, RA=0x100220000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page12

page12:	
		.word 0xbbbbbbbb
.end

SECTION .PAGE13 DATA_VA=0x230000
attr_data {
        Name = .PAGE13,
        VA=0x230000, PA=0x1100230000, RA=0x100230000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page13

page13:	
		.word 0xcccccccc
.end

SECTION .PAGE14 DATA_VA=0x240000
attr_data {
        Name = .PAGE14,
        VA=0x240000, PA=0x1100240000, RA=0x100240000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page14

page14:	
		.word 0xdddddddd
.end

SECTION .PAGE15 DATA_VA=0x250000
attr_data {
        Name = .PAGE15,
        VA=0x250000, PA=0x1100250000, RA=0x100250000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page15

page15:	
		.word 0xeeeeeeee
.end

SECTION .PAGE16 DATA_VA=0x260000
attr_data {
        Name = .PAGE16,
        VA=0x260000, PA=0x1100260000, RA=0x100260000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page16

page16:	
		.word 0xffffffff

SECTION .PAGE17 DATA_VA=0x270000
attr_data {
        Name = .PAGE17,
        VA=0x270000, PA=0x1100270000, RA=0x100270000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page17

page17:	
		.word 0x00000000
.end

