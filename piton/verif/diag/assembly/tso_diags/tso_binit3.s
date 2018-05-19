// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_binit3.s
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
/***************************************************************************
***  Program File: tso_binit3.s
**********************************************************************/

#define		srcaddr		%i0
#define		dstaddr		%i1
#define		count		%i2

#include "boot.s"

.global main

.text
main:
	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	ta      T_CHANGE_PRIV

th_fork(th_main,%l0)

th_main_0:

	setx in_stream, %g2, srcaddr
	setx out_stream, %g2, dstaddr
	setx 0x100, %g2, count

timing_loop0:
	ldda    [srcaddr] 0x22,  %l0
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l2
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l4
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l6
	add	srcaddr, 0x10, srcaddr
	stxa    %l0,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l1,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l2,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l3,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l4,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l5,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l6,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l7,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr

        deccc           count
        bg,pt %xcc,timing_loop0
	nop

	ta GOOD_TRAP

th_main_1:
        setx in_stream1, %g2, srcaddr
        setx out_stream1, %g2, dstaddr
        alignaddr       srcaddr, %g0, srcaddr

        ! COUNT bytes to copy
        set 128, count
        mulx count, 8*8, count


        prefetch        [srcaddr + 0*64], 1
        prefetch        [srcaddr + 1*64], 1
        prefetch        [srcaddr + 2*64], 1
        prefetch        [srcaddr + 3*64], 1
        ldd             [srcaddr + 0*8], %f0
        prefetch        [srcaddr + 4*64], 1
        ldd             [srcaddr + 1*8], %f2
        ldd             [srcaddr + 2*8], %f4
        faligndata      %f0, %f2, %f32
        ldd             [srcaddr + 3*8], %f6
        faligndata      %f2, %f4, %f34
        ldd             [srcaddr + 4*8], %f8
        faligndata      %f4, %f6, %f36
        ldd             [srcaddr + 5*8], %f10
        faligndata      %f6, %f8, %f38
        ldd             [srcaddr + 6*8], %f12
        faligndata      %f8, %f10, %f40
        ldd             [srcaddr + 7*8], %f14
        faligndata      %f10, %f12, %f42
        ldd             [srcaddr + 8*8], %f16
        subcc           count, 64, count
        add            srcaddr, 64, srcaddr

timing_loop1:
        fmovd           %f16, %f0
        ldd             [srcaddr + 1*8], %f2
        faligndata      %f12, %f14, %f44
        ldd             [srcaddr + 2*8], %f4
        faligndata      %f14, %f0, %f46
        stda            %f32, [dstaddr]ASI_BLK_P
        ldd             [srcaddr + 3*8], %f6
        faligndata      %f0, %f2, %f32
        ldd             [srcaddr + 4*8], %f8
        faligndata      %f2, %f4, %f34
        ldd             [srcaddr + 5*8], %f10
        faligndata      %f4, %f6, %f36
        ldd             [srcaddr + 6*8], %f12
        faligndata      %f6, %f8, %f38
        ldd             [srcaddr + 7*8], %f14
        faligndata      %f8, %f10, %f40
        ldd             [srcaddr + 8*8], %f16
        prefetch        [srcaddr + 64], 1
        faligndata      %f10, %f12, %f42
        subcc           count, 64, count
        add             dstaddr, 64, dstaddr
        bg,pt %xcc,timing_loop1
         add            srcaddr, 64, srcaddr
tidy_up:        ! should handle the remaining partial block here
        fmovd           %f16, %f0
        faligndata      %f12, %f14, %f44
        faligndata      %f14, %f0, %f46
        stda            %f32, [dstaddr]ASI_BLK_P
        membar #Sync

	ta	GOOD_TRAP

th_main_2:

        setx in_stream2, %g2, srcaddr
        setx out_stream2, %g2, dstaddr
        setx 0x100, %g2, count

timing_loop2:
        ldda    [srcaddr] 0x22,  %l0
        add     srcaddr, 0x10, srcaddr
        ldda    [srcaddr] 0x22,  %l2
        add     srcaddr, 0x10, srcaddr
        ldda    [srcaddr] 0x22,  %l4
        add     srcaddr, 0x10, srcaddr
        ldda    [srcaddr] 0x22,  %l6
        add     srcaddr, 0x10, srcaddr
        stx    %l0,    [dstaddr] 
        stx    %l1,    [dstaddr + 0x8] 
        stx    %l4,    [dstaddr + 0x10]
        stx    %l3,    [dstaddr + 0x18] 
        stx    %l4,    [dstaddr + 0x20] 
        stx    %l5,    [dstaddr + 0x28] 
        stx    %l6,    [dstaddr + 0x30] 
        stx    %l7,    [dstaddr + 0x38] 

        deccc           count
        bg,pt %xcc,timing_loop2
	add dstaddr, 0x40, dstaddr

        ta GOOD_TRAP


th_main_3:

        setx in_stream3, %g2, srcaddr
        setx out_stream3, %g2, dstaddr
        setx 0x100, %g2, count

timing_loop3:
	ldda    [srcaddr] 0x22,  %l0
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l2
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l4
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l6
	add	srcaddr, 0x10, srcaddr
	stxa    %l0,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l1,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l2,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l3,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l4,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l5,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l6,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l7,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr

        deccc           count
        bg,pt %xcc,timing_loop3
	nop

        ta GOOD_TRAP

th_main_4:

        setx in_stream4, %g2, srcaddr
        setx out_stream4, %g2, dstaddr
        setx 0x100, %g2, count


timing_loop4:
	ldda    [srcaddr] 0x22,  %l0
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l2
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l4
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l6
	add	srcaddr, 0x10, srcaddr
	stxa    %l0,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l1,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l2,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l3,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l4,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l5,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l6,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l7,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr

        deccc           count
        bg,pt %xcc,timing_loop4
	nop

        ta GOOD_TRAP

th_main_5:

        setx out_stream, %g2, srcaddr
	setx	0xff * 0x40, %g2, %g3
	add	srcaddr, %g3, srcaddr
        setx 0x100, %g2, count

timing_loop5:
        ldda    [srcaddr] 0x2a,  %l0
        sub     srcaddr, 0x10, srcaddr
        ldda    [srcaddr] 0x2a,  %l2
        sub     srcaddr, 0x10, srcaddr
        ldda    [srcaddr] 0x2a,  %l4
        sub     srcaddr, 0x10, srcaddr
        ldda    [srcaddr] 0x2a,  %l6
        sub     srcaddr, 0x10, srcaddr

        deccc           count
        bg,pt %xcc,timing_loop5
        nop

        ta GOOD_TRAP

th_main_6:

        setx out_stream, %g2, srcaddr
	setx	0xff * 0x40, %g2, %g3
	add	srcaddr, %g3, srcaddr
        setx 0x100, %g2, count

timing_loop6:
        ldx    [srcaddr],  %l0
        sub     srcaddr, 0x10, srcaddr
        ldx    [srcaddr],  %l2
        sub     srcaddr, 0x10, srcaddr
        ldx    [srcaddr],  %l4
        sub     srcaddr, 0x10, srcaddr
        ldx    [srcaddr],  %l6
        sub     srcaddr, 0x10, srcaddr

        deccc           count
        bg,pt %xcc,timing_loop6
        nop

th_main_7:

        setx out_stream2, %g2, srcaddr
	setx	0xff * 0x40, %g2, %g3
	add	srcaddr, %g3, srcaddr
        setx 0x100, %g2, count

timing_loop7:
        ldx    [srcaddr],  %l0
        sub     srcaddr, 0x10, srcaddr
        ldx    [srcaddr],  %l2
        sub     srcaddr, 0x10, srcaddr
        ldx    [srcaddr],  %l4
        sub     srcaddr, 0x10, srcaddr
        ldx    [srcaddr],  %l6
        sub     srcaddr, 0x10, srcaddr

        deccc           count
        bg,pt %xcc,timing_loop7
        nop
        ta GOOD_TRAP

user_text_end:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.global in_stream
.global out_stream
.global in_stream1
.global out_stream1
.global in_stream2
.global out_stream2
.global in_stream3
.global out_stream3
.global in_stream4
.global out_stream4
.data
.align 0x1000
user_data_start:
in_stream:
	.word 0xb1bababa
	.word 0xb2bababa
	.word 0xb3bababa
	.word 0xb4bababa
	.word 0xb5bababa
	.word 0xb6bababa
	.word 0xb7bababa
	.word 0xb8bababa
	.word 0xb9bababa
	.word 0xbabababa
	.word 0xbbbababa
	.word 0xbcbababa
	.word 0xbdbababa
	.word 0xbebababa
	.word 0xbfbababa
	.skip 16000	

! offset the out_stream block
.align 0x1000
out_stream:
	.skip 16000	

.align 0x1000
in_stream1:
	.word 0xb1bababa
	.word 0xb2bababa
	.word 0xb3bababa
	.word 0xb4bababa
	.word 0xb5bababa
	.word 0xb6bababa
	.word 0xb7bababa
	.word 0xb8bababa
	.word 0xb9bababa
	.word 0xbabababa
	.word 0xbbbababa
	.word 0xbcbababa
	.word 0xbdbababa
	.word 0xbebababa
	.word 0xbfbababa
	.skip 16000	

! offset the out_stream block
.align 0x1000
out_stream1:
	.skip 16000
.align 0x1000
in_stream2:
	.word 0xb1bababa
	.word 0xb2bababa
	.word 0xb3bababa
	.word 0xb4bababa
	.word 0xb5bababa
	.word 0xb6bababa
	.word 0xb7bababa
	.word 0xb8bababa
	.word 0xb9bababa
	.word 0xbabababa
	.word 0xbbbababa
	.word 0xbcbababa
	.word 0xbdbababa
	.word 0xbebababa
	.word 0xbfbababa
	.skip 16000

! offset the out_stream block
.align 0x1000
out_stream2:
	.skip 16000	

.align 0x1000
in_stream3:
	.word 0xb1bababa
	.word 0xb2bababa
	.word 0xb3bababa
	.word 0xb4bababa
	.word 0xb5bababa
	.word 0xb6bababa
	.word 0xb7bababa
	.word 0xb8bababa
	.word 0xb9bababa
	.word 0xbabababa
	.word 0xbbbababa
	.word 0xbcbababa
	.word 0xbdbababa
	.word 0xbebababa
	.word 0xbfbababa
	.skip 16000	

! offset the out_stream block
.align 0x1000
out_stream3:
	.skip 16000

.align 0x1000
in_stream4:
	.word 0xb1bababa
	.word 0xb2bababa
	.word 0xb3bababa
	.word 0xb4bababa
	.word 0xb5bababa
	.word 0xb6bababa
	.word 0xb7bababa
	.word 0xb8bababa
	.word 0xb9bababa
	.word 0xbabababa
	.word 0xbbbababa
	.word 0xbcbababa
	.word 0xbdbababa
	.word 0xbebababa
	.word 0xbfbababa
	.skip 16000

! offset the out_stream block
.align 0x1000
out_stream4:
	.skip 16000

user_data_end:
