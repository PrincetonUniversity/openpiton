// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Dmiss_specload.s
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
  File:		mt_Dmiss_specload.s

  Description:
  -----------
  This diag makes one thread issue speculative instructions
  (each following a load) that must be killed because the loads
  miss. One thread always misses on instructions, while another
  issues load misses and speculative instructions.

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
		set		data_segment,	%i0
		set		0x10,			%l0
load_miss:		
		ld		[%i0],			%i1  ! load miss
		add		%i0,	0x20,	%i0  ! speculative instruction
		subcc	%l0,	1,		%l0
		bne		load_miss
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
		.word	0x00000000
		.word	0x00001111
		.word	0x00002222
		.word	0x00003333
		.word	0x00004444
		.word	0x00005555
		.word	0x00006666
		.word	0x00007777
		.word	0x11110000
		.word	0x11111111
		.word	0x11112222
		.word	0x11113333
		.word	0x11114444
		.word	0x11115555
		.word	0x11116666
		.word	0x11117777
		.word	0x22220000
		.word	0x22221111
		.word	0x22222222
		.word	0x22223333
		.word	0x22224444
		.word	0x22225555
		.word	0x22226666
		.word	0x22227777
		.word	0x33330000
		.word	0x33331111
		.word	0x33332222
		.word	0x33333333
		.word	0x33334444
		.word	0x33335555
		.word	0x33336666
		.word	0x33337777

! additional data added by srokit. diag looks bogus without it
                .word   0x44440000
                .word   0x44441111
                .word   0x44442222
                .word   0x44443333
                .word   0x44444444
                .word   0x44445555
                .word   0x44446666
                .word   0x44447777

                .word   0x55550000
                .word   0x55551111
                .word   0x55552222
                .word   0x55553333
                .word   0x55554444
                .word   0x55555555
                .word   0x55556666
                .word   0x55557777

                .word   0x66660000
                .word   0x66661111
                .word   0x66662222
                .word   0x66663333
                .word   0x66664444
                .word   0x66665555
                .word   0x66666666
                .word   0x66667777

                .word   0x77770000
                .word   0x77771111
                .word   0x77772222
                .word   0x77773333
                .word   0x77774444
                .word   0x77775555
                .word   0x77776666
                .word   0x77777777

                .word   0x88880000
                .word   0x88881111
                .word   0x88882222
                .word   0x88883333
                .word   0x88884444
                .word   0x88885555
                .word   0x88886666
                .word   0x88887777

                .word   0x99990000
                .word   0x99991111
                .word   0x99992222
                .word   0x99993333
                .word   0x99994444
                .word   0x99995555
                .word   0x99996666
                .word   0x99997777

                .word   0xaaaa0000
                .word   0xaaaa1111
                .word   0xaaaa2222
                .word   0xaaaa3333
                .word   0xaaaa4444
                .word   0xaaaa5555
                .word   0xaaaa6666
                .word   0xaaaa7777

                .word   0xbbbb0000
                .word   0xbbbb1111
                .word   0xbbbb2222
                .word   0xbbbb3333
                .word   0xbbbb4444
                .word   0xbbbb5555
                .word   0xbbbb6666
                .word   0xbbbb7777

                .word   0xcccc0000
                .word   0xcccc1111
                .word   0xcccc2222
                .word   0xcccc3333
                .word   0xcccc4444
                .word   0xcccc5555
                .word   0xcccc6666
                .word   0xcccc7777

                .word   0xdddd0000
                .word   0xdddd1111
                .word   0xdddd2222
                .word   0xdddd3333
                .word   0xdddd4444
                .word   0xdddd5555
                .word   0xdddd6666
                .word   0xdddd7777

                .word   0xeeee0000
                .word   0xeeee1111
                .word   0xeeee2222
                .word   0xeeee3333
                .word   0xeeee4444
                .word   0xeeee5555
                .word   0xeeee6666
                .word   0xeeee7777

                .word   0xffff0000
                .word   0xffff1111
                .word   0xffff2222
                .word   0xffff3333
                .word   0xffff4444
                .word   0xffff5555
                .word   0xffff6666
                .word   0xffff7777

.end

