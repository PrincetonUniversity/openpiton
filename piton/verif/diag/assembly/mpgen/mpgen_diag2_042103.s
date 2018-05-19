// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mpgen_diag2_042103.s
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
!	Niagara MP Random Test
!	Seed = 11
!	CIAM can be on
!	4 Processors, 1000 lines each
!	mpgen   created on Oct 14, 2002 (10:12:19)
!	diag.s created on Mar 24, 2003 (09:34:27)
!	RC file : diag.rc

#include "custom_page1.h"

	.global	main

	.seg	"text"
	ALIGN_PAGE_8K
user_text_start:
main:

!	Check for processor ID

set     0x22,   %o0
ta	T_TRAP_EN
	th_fork(processor,%l0)

!	Random code for Processor 0

processor_0:
	ta	T_CHANGE_PRIV
	set	done_flags,%g1
	mov	1,%g2
	st	%g2,[%g1+0x00]		! Set the start flag
	wrpr	%g0,7,%cleanwin
	call	p0_init_memory_pointers
	wr	%g0,0x80,%asi

!	Initialize the floating point registers for processor 0

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p0_init_freg,%g1
	ldd	[%g1+0x00],%f0		! %f0  = 87d95717, %f1  = 9ca2b74a
	ldd	[%g1+0x08],%f2		! %f2  = 86f8a115, %f3  = 91f4af38
	ldd	[%g1+0x10],%f4		! %f4  = 272de770, %f5  = d665656b
	ldd	[%g1+0x18],%f6		! %f6  = 99815ad7, %f7  = 003e8115
	ldd	[%g1+0x20],%f8		! %f8  = e1d1f125, %f9  = a55863a6
	ldd	[%g1+0x28],%f10		! %f10 = 4f96dd50, %f11 = aa6385ad
	ldd	[%g1+0x30],%f12		! %f12 = 5a758dc3, %f13 = a7914059
	ldd	[%g1+0x38],%f14		! %f14 = 7986e64a, %f15 = d566d89b
	ldd	[%g1+0x40],%f16		! %f16 = b50fc891, %f17 = c0be7043
	ldd	[%g1+0x48],%f18		! %f18 = c9a434bd, %f19 = b81c9f02
	ldd	[%g1+0x50],%f20		! %f20 = 4beabdc9, %f21 = 2bbc20d1
	ldd	[%g1+0x58],%f22		! %f22 = f72db874, %f23 = c2e19a26
	ldd	[%g1+0x60],%f24		! %f24 = 10ba90ee, %f25 = 2c8258cd
	ldd	[%g1+0x68],%f26		! %f26 = 57f3c69e, %f27 = cecc15df
	ldd	[%g1+0x70],%f28		! %f28 = aed337e9, %f29 = 4e66907b
	ldd	[%g1+0x78],%f30		! %f30 = bf05028e, %f31 = 7ad68ff4
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%f0  = 87d95717 9ca2b74a, %f14 = 7986e64a d566d89b
	fmovd	%f0 ,%f14		! %f14 = 87d95717 9ca2b74a
!	%f0  = 87d95717, %f20 = 4beabdc9
	fnegs	%f0 ,%f20		! %f20 = 07d95717
!	%l6 = e71c18ffa6745895, immed = fffff0f0, %y  = 00000000
	sdiv	%l6,-0xf10,%l6		! %l6 = fffffffffff4f2f7
!	%l1 = e473c3ff9eacc79c, %l7 = 6e39e9002c791c14, %l0 = ad14d6006e235506
	orcc	%l1,%l7,%l0		! %l0 = ee7bebffbefddf9c, %ccr = 88
!	Mem[0000000012800000] = 824f1131c46b9f58, %l1 = e473c3ff9eacc79c
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = 824f1131c46b9f58

p0_label_2:
!	%l2 = aca8da5a, %l3 = ca61f1bc, Mem[0000000010000048] = 53052166 0a979c1e
	std	%l2,[%i0+0x048]	! Mem[0000000010000048] = aca8da5a ca61f1bc
!	%l4 = a8aeb4003ba4cb2e, Mem[0000000031000000] = 6b9e9dd0
	stwa	%l4,[%o2+0x000]%asi	! Mem[0000000031000000] = 3ba4cb2e
	set	p0_b1,%o7
	fble,a,pn %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 0
!	%l3 = 6cf1d2ffca61f1bc, Mem[0000000013000008] = df344b96bc37b240
	stxa	%l3,[%i6+%o6]0x80	! Mem[0000000013000008] = 6cf1d2ffca61f1bc
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x001,%g2
p0_b1:
!	Registers modified during the branch to p0_near_0
!	%l0  = 9b4811fc6062dca0
!	%l7  = 02c83bffe618eda8
	membar	#Sync			! Added by membar checker (1)
!	%l6 = fffffffffff4f2f7, %l3 = 6cf1d2ffca61f1bc, %y  = 9b4811fc
	udivcc	%l6,%l3,%l6		! %l6 = 00000000c46b9f58, %ccr = 08

p0_label_3:
!	Mem[00000000118000a0] = 00000000 ca61f1bc, %l3 = 6cf1d2ffca61f1bc, %l4 = a8aeb4003ba4cb2e
	add	%i3,0xa0,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 12d0e7fdc6f34d3d
!	%l6 = 00000000c46b9f58, %l1 = 824f1131c46b9f58, %l2 = 180b37ffaca8da5a
	and	%l6,%l1,%l2		! %l2 = 00000000c46b9f58
!	Mem[000000001080000d] = f8f7658c, %l5 = 526105004a2dd02f
	ldstuba	[%i1+0x00d]%asi,%l5	! %l5 = 00000000000000f7
!	%f10 = 4f96dd50 aa6385ad, %f28 = aed337e9 4e66907b
	fabsd	%f10,%f28		! %f28 = 4f96dd50 aa6385ad
!	Mem[000000003100000c] = 341521f7, %l6 = 00000000c46b9f58
	lduwa	[%o2+0x00c]%asi,%l6	! %l6 = 00000000341521f7

p0_label_4:
!	%l2 = 00000000c46b9f58, Mem[0000000010000000] = 325010a5
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010000000] = 585010a5
!	%l7 = 02c83bffe618eda8, Mem[000000003200003e] = 7aa19270
	stha	%l7,[%o4+0x03e]%asi	! Mem[000000003200003c] = eda89270
!	%f22 = f72db874, %f19 = b81c9f02
	fabss	%f22,%f19		! %f19 = 772db874
!	Mem[0000000012800000] = 824f1131, %l4 = 12d0e7fdc6f34d3d
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000082
!	Mem[0000000011000020] = 9913992b 91ee9f27 a142f1f6 29eea795
	prefetch [%i2+0x020],16

p0_label_5:
!	%f6  = 99815ad7 003e8115, %f30 = bf05028e 7ad68ff4
	fmovd	%f6 ,%f30		! %f30 = 99815ad7 003e8115
!	Mem[0000000032000040] = 9270504b, %l5 = 00000000000000f7
	ldswa	[%o4+0x040]%asi,%g2	! %g2 = 00000000000000f7
!	%l4 = 0000000000000082, %l0 = 9b4811fc6062dca0, %l7 = 02c83bffe618eda8
	orncc	%l4,%l0,%l7		! %l7 = 64b7ee039f9d23df, %ccr = 08
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetcha [%o4+0x020]%asi,20
!	Mem[0000000011000008] = e0c4fbeb, %l5 = 00000000000000f7
	lduba	[%i2+%o6]0x80,%l5	! %l5 = 00000000000000e0

p0_label_6:
!	%l1 = 824f1131c46b9f58, Mem[00000000108000d8] = 53cee547
	stha	%l1,[%i1+0x0d8]%asi	! Mem[00000000108000d8] = 9f58e547
!	%f27 = cecc15df, %f2  = 86f8a115 91f4af38
	fstox	%f27,%f2 		! %f2  = ffffffff 99f51080
!	%l3 = 6cf1d2ffca61f1bc, Mem[0000000010800008] = b18b5de6
	stba	%l3,[%i1+%o6]0x80	! Mem[0000000010800008] = bc8b5de6
!	Mem[0000000011800020] = 4145e0b1 e3f639de b5e948da ea6fc8d9
	prefetcha [%i3+0x020]%asi,3
!	%l0 = 9b4811fc6062dca0, Mem[0000000010000024] = e50f0f34
	stwa	%l0,[%i0+0x024]%asi	! Mem[0000000010000024] = 6062dca0

p0_label_7:
!	Mem[0000000011800008] = 522b2e82, %l1 = 824f1131c46b9f58
	lduha	[%i3+%o6]0x80,%l1	! %l1 = 000000000000522b
	set	p0_b2,%o7
	fbule,pn %fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000013000008] = 6cf1d2ff, %l1 = 000000000000522b
	ldswa	[%i6+%o6]0x80,%l1	! %l1 = 000000006cf1d2ff
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x002,%g2
p0_b2:
!	Registers modified during the branch to p0_near_2
!	%l0  = 9f9d1bd759350501
!	%l2  = 0000000027a075d6
!	%l3  = fffffffffffffde1
!	%l6  = 0000000000000c18
!	%l7  = 0000000068d20b5d
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 0000000000000c18, %l2 = 0000000027a075d6, %l6 = 0000000000000c18
	xorcc	%l6,%l2,%l6		! %l6 = 0000000027a079ce, %ccr = 00
	fbl,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0

p0_label_8:
!	%l7 = 0000000068d20b5d, Mem[000000003200003a] = 7d05feab
	sth	%l7,[%o4+0x03a]		! Annulled
p0_b3:
	membar	#Sync			! Added by membar checker (3)
!	%l5 = 00000000000000e0, %l5 = 00000000000000e0, %y  = 9f9d1bd7
	smul	%l5,%l5,%l6		! %l6 = 000000000000c400
!	%l6 = 000000000000c400, immed = fffff5cc, %y  = 00000000
	umulcc	%l6,-0xa34,%l5		! %l5 = 0000c3fff8303000, %ccr = 08
!	Mem[0000000010800000] = ceb8d694 296d9635 bc8b5de6 f8ff658c
	prefetcha [%i1+0x000]%asi,4
!	%f14 = 87d95717, %f18 = c9a434bd
	fcmpes	%fcc2,%f14,%f18		! %fcc2 = 2

p0_label_9:
!	Mem[00000000110000c0] = 360e1f54 da2f2ca1 318b00bd 02e681a9
	prefetcha [%i2+0x0c0]%asi,22
!	Mem[0000000010800088] = 32eb1351, %l6 = 000000000000c400
	lduba	[%i1+0x089]%asi,%l6	! %l6 = 00000000000000eb
!	%l1 = 000000006cf1d2ff, Mem[000000003100004c] = b0e68ca7
	stb	%l1,[%o2+0x04c]		! Mem[000000003100004c] = ffe68ca7
!	Mem[00000000110000a0] = 6307e9be 64a79ecf fa15ce90 80a896cc
	prefetcha [%i2+0x0a0]%asi,22
!	Mem[00000000118000a0] = 12d0e7fd c6f34d3d 33e94237 7e66b217
	prefetch [%i3+0x0a0],22

p0_label_10:
!	%l7 = 0000000068d20b5d, %l2 = 0000000027a075d6, %y  = 0000c3ff
	smulcc	%l7,%l2,%l5		! %l5 = 1039b341e3e700be, %ccr = 08
!	Mem[000000001180002c] = ea6fc8d9, %l5 = 1039b341e3e700be
	ldub	[%i3+0x02e],%l5		! %l5 = 00000000000000c8
!	%l6 = 00000000000000eb, %l1 = 000000006cf1d2ff, %l0 = 9f9d1bd759350501
	sra	%l6,%l1,%l0		! %l0 = 0000000000000000
!	%f22 = f72db874 c2e19a26, %f22 = f72db874 c2e19a26
	fcmped	%fcc3,%f22,%f22		! %fcc3 = 0
!	Mem[00000000118000c0] = a194fd2e d844d2d6 869c6e8f d5429d30
	prefetcha [%i3+0x0c0]%asi,1

p0_label_11:
!	%l2 = 0000000027a075d6, immed = fffffbb2, %l1 = 000000006cf1d2ff
	andcc	%l2,-0x44e,%l1		! %l1 = 0000000027a07192, %ccr = 00
!	Mem[0000000031800008] = 8ced8103a6c88bdf, %l1 = 0000000027a07192
	ldxa	[%o3+0x008]%asi,%l1	! %l1 = 8ced8103a6c88bdf
!	Mem[0000000031000048] = 8331949b, %l3 = fffffffffffffde1
	ldsb	[%o2+0x04b],%l3		! %l3 = ffffffffffffff9b
!	%l1 = 8ced8103a6c88bdf, Mem[0000000011800000] = db10ecd7
	stha	%l1,[%i3+%g0]0x80	! Mem[0000000011800000] = 8bdfecd7
!	%l3 = ffffffffffffff9b, %l0 = 0000000000000000, %l3 = ffffffffffffff9b
	xnor	%l3,%l0,%l3		! %l3 = 0000000000000064

p0_label_12:
	set	p0_b4,%o7
	fble,pn	%fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000011800008] = 522b2e82, %l1 = 8ced8103a6c88bdf
	ldstuba	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000052
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x004,%g2
p0_b4:
!	Registers modified during the branch to p0_near_1
!	%l0  = 00000063ffff3fd0
!	%l2  = fffffffffff72595
!	%l4  = fffffffffffffff7
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000031000008] = 8a20b52b341521f7, %l6 = 00000000000000eb
	ldxa	[%o2+0x008]%asi,%l6	! %l6 = 8a20b52b341521f7
	bgu	p0_b5			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001180003c] = de4f2cb8, %l5 = 00000000000000c8
	ldsh	[%i3+0x03c],%l5		! %l5 = ffffffffffffde4f
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x005,%g2
p0_b5:

p0_label_13:
	membar	#Sync			! Added by membar checker (5)
!	%l2 = fffffffffff72595, immed = fffffdfa, %y  = 00000063
	sdiv	%l2,-0x206,%l1		! %l1 = ffffffffce944797
!	Mem[0000000011000020] = 9913992b 91ee9f27 a142f1f6 29eea795
	prefetch [%i2+0x020],23
!	Branch On Register, %l3 = 0000000000000064
	brnz,pn	%l3,p0_b6		! Branch Taken
!	Mem[0000000010800020] = 9e0d45b2 e0cf9813 757dccc4 e939d543
	prefetch [%i1+0x020],22
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x006,%g2
p0_b6:
	membar	#Sync			! Added by membar checker (6)
!	%l1 = ffffffffce944797, Mem[0000000031000004] = a84017d6
	stwa	%l1,[%o2+0x004]%asi	! Mem[0000000031000004] = ce944797

p0_label_14:
!	%f3  = 99f51080, %f2  = ffffffff 99f51080
	fstod	%f3 ,%f2 		! %f2  = bb3ea210 00000000
!	%l7 = 0000000000000000, immed = fffffaf9, %y  = 00000063
	mulx	%l7,-0x507,%l3		! %l3 = 0000000000000000
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l1 = ffffffffce944797, Mem[0000000011800000] = 8bdfecd7
	stwa	%l1,[%i3+%g0]0x80	! Annulled
p0_b7:
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000031000044] = 612c337b, %l0 = 00000063ffff3fd0
	lduh	[%o2+0x046],%l0		! %l0 = 000000000000337b

p0_label_15:
!	%l0 = 0000337b, %l1 = ce944797, Mem[00000000110000d0] = 776d1678 b6f92cd0
	stda	%l0,[%i2+0x0d0]%asi	! Mem[00000000110000d0] = 0000337b ce944797
!	%l6 = 8a20b52b341521f7, %l6 = 8a20b52b341521f7, %l2 = fffffffffff72595
	andn	%l6,%l6,%l2		! %l2 = 0000000000000000
!	Mem[0000000030000008] = 0bd1d2e9, %l3 = 0000000000000000
	ldub	[%o0+0x00a],%l3		! %l3 = 00000000000000d2
	set	p0_b8,%o7
	fbuge,pt %fcc1,p0_near_1_he	! Branch Taken, %fcc1 = 0
!	%l2 = 00000000, %l3 = 000000d2, Mem[0000000010000000] = 585010a5 c15a8924
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010000000] = 00000000 000000d2
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x008,%g2
p0_b8:
!	Registers modified during the branch to p0_near_1
!	%l0  = 000000d1fffe6c68
!	%l2  = 0000000000000000
!	%l4  = fffffffffffff3d7
!	%l7  = ffffffffff9d288f

p0_label_16:
	membar	#Sync			! Added by membar checker (8)
!	%l0 = 000000d1fffe6c68, %l1 = ffffffffce944797, %l0 = 000000d1fffe6c68
	andcc	%l0,%l1,%l0		! %l0 = 000000d1ce944400, %ccr = 08
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003180004c] = 201f68b5, %l0 = 000000d1ce944400
	swap	[%o3+0x04c],%l0		! Annulled
p0_b9:
	membar	#Sync			! Added by membar checker (9)
!	%l1 = ffffffffce944797, immed = 00000011, %l6 = 8a20b52b341521f7
	sll	%l1,0x011,%l6		! %l6 = ffff9d288f2e0000
!	%l5 = ffffffffffffde4f, %l1 = ffffffffce944797, %l3 = 00000000000000d2
	orncc	%l5,%l1,%l3		! %l3 = fffffffffffffe6f, %ccr = 88

p0_label_17:
!	Mem[0000000011000008] = e0c4fbeb, %l3 = fffffffffffffe6f
	ldsha	[%i2+%o6]0x80,%l3	! %l3 = ffffffffffffe0c4
!	%l7 = ffffffffff9d288f, Mem[0000000030000049] = 2cbb3ec7
	stba	%l7,[%o0+0x049]%asi	! Mem[0000000030000048] = 2c8f3ec7
!	%l3 = ffffffffffffe0c4, Mem[000000003200005c] = a73b551a
	stha	%l3,[%o4+0x05c]%asi	! Mem[000000003200005c] = e0c4551a
!	%l5 = ffffffffffffde4f, Mem[0000000011800008] = ff2b2e824115d48f
	stxa	%l5,[%i3+%o6]0x80	! Mem[0000000011800008] = ffffffffffffde4f
!	Branch On Register, %l7 = ffffffffff9d288f
	brlez,a,pt %l7,p0_b10		! Branch Taken

p0_label_18:
!	Mem[0000000032000028] = 8d04cd02e27389fa, %l2 = 0000000000000000
	ldx	[%o4+0x028],%g2		! %g2 = 8d04cd02e27389fa
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x00a,%g2
p0_b10:
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000031000040] = 7f576c5f, %l3 = ffffe0c4, %l7 = ff9d288f
	add	%o2,0x40,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 000000007f576c5f
!	Branch On Register, %l6 = ffff9d288f2e0000
	brgz,a,pt %l6,p0_not_taken_0	! Branch Not Taken
!	%l7 = 000000007f576c5f, Mem[0000000011800000] = 8bdfecd73077a555
	stxa	%l7,[%i3+%g0]0x80	! Annulled
p0_b11:
	membar	#Sync			! Added by membar checker (11)
!	%f18 = c9a434bd 772db874, %f6  = 99815ad7 003e8115
	fabsd	%f18,%f6 		! %f6  = 49a434bd 772db874

p0_label_19:
!	%l6 = ffff9d288f2e0000, immed = fffff2ba, %y  = 000000d1
	umul	%l6,-0xd46,%l1		! %l1 = 8f2df893836c0000
!	%l1 = 8f2df893836c0000, Mem[0000000010800008] = bc8b5de6f8ff658c
	stxa	%l1,[%i1+%o6]0x80	! Mem[0000000010800008] = 8f2df893836c0000
!	%l0 = 000000d1ce944400, %l6 = ffff9d288f2e0000, %l7 = 000000007f576c5f
	xnorcc	%l0,%l6,%l7		! %l7 = 00006206be45bbff, %ccr = 08
	fbne	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800000] = 0b23aed7 19d8e6f6, %l4 = fffff3d7, %l5 = ffffde4f
	ldd	[%o1+0x000],%l4		! %l4 = 000000000b23aed7 0000000019d8e6f6
p0_b12:

p0_label_20:
	membar	#Sync			! Added by membar checker (12)
!	%l4 = 0b23aed7, %l5 = 19d8e6f6, Mem[0000000010000068] = a0525ab8 a47fcfe6
	stda	%l4,[%i0+0x068]%asi	! Mem[0000000010000068] = 0b23aed7 19d8e6f6
!	Branch On Register, %l3 = ffffffffffffe0c4
	brgz,pn	%l3,p0_not_taken_0	! Branch Not Taken
!	%l6 = ffff9d288f2e0000, Mem[0000000011000008] = e0c4fbeb
	stha	%l6,[%i2+%o6]0x80	! Mem[0000000011000008] = 0000fbeb
p0_b13:
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000110000a0] = 6307e9be 64a79ecf fa15ce90 80a896cc
	prefetch [%i2+0x0a0],22
!	%l6 = 8f2e0000, %l7 = be45bbff, Mem[0000000032000010] = 0384c640 925b55a5
	std	%l6,[%o4+0x010]	! Mem[0000000032000010] = 8f2e0000 be45bbff

p0_label_21:
!	%l7 = 00006206be45bbff, Mem[0000000011000000] = e58e45ee
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000011000000] = ff8e45ee
!	Mem[000000003180004c] = 201f68b5, %l3 = ffffffffffffe0c4
	ldsb	[%o3+0x04c],%l3		! %l3 = 0000000000000020
!	%l3 = 0000000000000020, %l4 = 000000000b23aed7, %l6 = ffff9d288f2e0000
	sllx	%l3,%l4,%l6		! %l6 = 0000000010000000
!	%l4 = 000000000b23aed7, %l1 = 8f2df893836c0000, %y  = 8f2df893
	sdivx	%l4,%l1,%l3		! %l3 = 0000000000000000
!	%l0 = 000000d1ce944400, immed = fffff5ba, %l1 = 8f2df893836c0000
	xnor	%l0,-0xa46,%l1		! %l1 = 000000d1ce944e45

p0_label_22:
!	%l6 = 0000000010000000, Mem[000000003180000c] = a6c88bdf
	stwa	%l6,[%o3+0x00c]%asi	! Mem[000000003180000c] = 10000000
!	%l6 = 0000000010000000
	sethi	%hi(0xdb32c400),%l6	! %l6 = 00000000db32c400
	bgu	p0_b14			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000011000000] = ff8e45ee 8e70eb48, %l6 = db32c400, %l7 = be45bbff
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff8e45ee 000000008e70eb48
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x00e,%g2
p0_b14:
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010800020] = 9e0d45b2 e0cf9813 757dccc4 e939d543
	prefetch [%i1+0x020],23

p0_label_23:
!	%l5 = 0000000019d8e6f6, Mem[0000000032000008] = b745e7a8
	stw	%l5,[%o4+0x008]		! Mem[0000000032000008] = 19d8e6f6
!	%l2 = 0000000000000000, %l0 = 000000d1ce944400, %y  = 8f2df893
	sdivx	%l2,%l0,%l4		! %l4 = 0000000000000000
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000008] = 610506ea, %l1 = 000000d1ce944e45
	swapa	[%i0+%o6]0x80,%l1	! Annulled
p0_b15:
	membar	#Sync			! Added by membar checker (15)
!	%l2 = 0000000000000000, Mem[0000000031800049] = 7518d47c
	stb	%l2,[%o3+0x049]		! Mem[0000000031800048] = 7500d47c

p0_label_24:
!	Mem[0000000010000060] = e6566435 1f7986d2 0b23aed7 19d8e6f6
	prefetcha [%i0+0x060]%asi,3
!	%l3 = 0000000000000000, immed = fffff48f, %y  = 8f2df893
	umulcc	%l3,-0xb71,%l0		! %l0 = 0000000000000000, %ccr = 44
	set	p0_b16,%o7
	fbge	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800008] = 8f2df893, %l4 = 0000000000000000
	lduwa	[%i1+%o6]0x80,%l4	! %l4 = 000000008f2df893
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x010,%g2
p0_b16:
!	Registers modified during the branch to p0_far_1
!	%l0  = 0000000019d8e70f
!	%l1  = 000000000ce944e4
!	%l4  = 0000000000000019
!	%l6  = ffffffffffffeb2a
	membar	#Sync			! Added by membar checker (16)
!	%f29 = aa6385ad, %f21 = 2bbc20d1
	fnegs	%f29,%f21		! %f21 = 2a6385ad

p0_label_25:
	bcc,a	p0_b17			! Branch Taken, %ccr = 44, CWP = 0
!	%l2 = 0000000000000000, Mem[0000000011000060] = ed0fdf7c95a02b71
	stx	%l2,[%i2+0x060]		! Mem[0000000011000060] = 0000000000000000
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x011,%g2
p0_b17:
	membar	#Sync			! Added by membar checker (17)
	set	p0_b18,%o7
	fble,pt	%fcc0,p0_near_1_le	! Branch Taken, %fcc0 = 0
!	%l2 = 0000000000000000, Mem[0000000011800008] = ffffffff
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = 0000ffff
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x012,%g2
p0_b18:
!	Registers modified during the branch to p0_near_1
!	%l0  = 0000000000000000
!	%l3  = ffffffffe6271ed7
!	%l4  = fffffffffffff23d
	membar	#Sync			! Added by membar checker (18)
!	%l6 = ffffffffffffeb2a, immed = 0000001d, %l7 = 000000008e70eb48
	srax	%l6,0x01d,%l7		! %l7 = ffffffffffffffff

p0_label_26:
!	%l7 = ffffffffffffffff, immed = fffffa23, %l4 = fffffffffffff23d
	xnorcc	%l7,-0x5dd,%l4		! %l4 = fffffffffffffa23, %ccr = 88
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = fffffa23, %l5 = 19d8e6f6, Mem[0000000011800038] = 2a7b9431 de4f2cb8
	std	%l4,[%i3+0x038]	! Annulled
p0_b19:
	membar	#Sync			! Added by membar checker (19)
!	%l4 = fffffffffffffa23, immed = fffff428, %l2 = 0000000000000000
	and	%l4,-0xbd8,%l2		! %l2 = fffffffffffff020
	set	p0_b20,%o7
	fbue	p0_far_2_he	! Branch Taken, %fcc0 = 0

p0_label_27:
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],2
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x014,%g2
p0_b20:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000003415
!	%l4  = 00000000c75676db
!	%l5  = 0000000019d8e128
	membar	#Sync			! Added by membar checker (20)
!	%f12 = 5a758dc3 a7914059, %f10 = 4f96dd50 aa6385ad
	fabsd	%f12,%f10		! %f10 = 5a758dc3 a7914059
!	%f7  = 772db874, %f22 = f72db874, %f10 = 5a758dc3
	fdivs	%f7 ,%f22,%f10		! %f10 = bf800000
!	Mem[0000000030800008] = 4c93e0778fabb5a3, %l3 = ffffffffe6271ed7
	ldx	[%o1+0x008],%l3		! %l3 = 4c93e0778fabb5a3
!	%l6 = ffffeb2a, %l7 = ffffffff, Mem[00000000110000c8] = 318b00bd 02e681a9
	stda	%l6,[%i2+0x0c8]%asi	! Mem[00000000110000c8] = ffffeb2a ffffffff

p0_label_28:
!	%l7 = ffffffffffffffff, %l5 = 0000000019d8e128, %l4 = 00000000c75676db
	tsubcc	%l7,%l5,%l4		! %l4 = ffffffffe6271ed7, %ccr = 8a
!	%l6 = ffffffffffffeb2a, %l3 = 4c93e0778fabb5a3, %y  = 00000000
	mulx	%l6,%l3,%l6		! %l6 = 6ed904d47c456dbe
!	%l0 = 0000000000003415, Mem[0000000031800048] = 7500d47c201f68b5
	stxa	%l0,[%o3+0x048]%asi	! Mem[0000000031800048] = 0000000000003415
	bvs	p0_b21			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000010800014] = e27c8139, %l6 = 6ed904d47c456dbe
	lduw	[%i1+0x014],%l6		! %l6 = 00000000e27c8139
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x015,%g2
p0_b21:

p0_label_29:
	membar	#Sync			! Added by membar checker (21)
!	%l5 = 0000000019d8e128, immed = 000004c4, %y  = 00000000
	udivx	%l5,0x4c4,%l7		! %l7 = 0000000000056c75
!	Mem[0000000011000000] = ff8e45ee, %l2 = fffffffffffff020
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Branch On Register, %l4 = ffffffffe6271ed7
	brgez,pt %l4,p0_not_taken_0	! Branch Not Taken
!	%l2 = ffffffff, %l3 = 8fabb5a3, Mem[0000000011800000] = 8bdfecd7 3077a555
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000011800000] = ffffffff 8fabb5a3
p0_b22:
	membar	#Sync			! Added by membar checker (22)
!	%l6 = 00000000e27c8139, Mem[0000000030000044] = 95466618
	stwa	%l6,[%o0+0x044]%asi	! Mem[0000000030000044] = e27c8139

p0_label_30:
	ba,a	p0_b23			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[00000000130000a0] = c54a7617 5fc8ecb3 4ffc9e45 a6d51bc0
	prefetch [%i6+0x0a0],21	! Annulled
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x017,%g2
p0_b23:
	membar	#Sync			! Added by membar checker (23)
	fbue,a,pt %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000011000000] = ff8e45ee, %l4 = ffffffffe6271ed7
	lduha	[%i2+%g0]0x80,%l4	! Annulled
p0_b24:
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000011800008] = 0000ffff, %l4 = ffffffffe6271ed7
	lduha	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000

p0_label_31:
	fbl,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003100000c] = 341521f7, %l5 = 0000000019d8e128
	lduh	[%o2+0x00c],%l5		! %l5 = 0000000000003415
p0_b25:
	membar	#Sync			! Added by membar checker (25)
!	%f7  = 772db874, %f14 = 87d95717
	fcmps	%fcc3,%f7 ,%f14		! %fcc3 = 2
!	%f8  = e1d1f125, %f6  = 49a434bd 772db874
	fitod	%f8 ,%f6 		! %f6  = c1be2e0e db000000
	set	p0_b26,%o7
	fbg,pn	%fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 2

p0_label_32:
!	%l1 = 000000000ce944e4, Mem[0000000010000008] = 610506ea
	stha	%l1,[%i0+%o6]0x80	! Mem[0000000010000008] = 44e406ea
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x01a,%g2
p0_b26:
!	Registers modified during the branch to p0_near_1
!	%l0  = 8fabb48ee1feeabc
!	%l2  = ffffffffffffff8b
!	%l4  = fffffffffffffbd7
!	%l7  = 000000000019d289
	membar	#Sync			! Added by membar checker (26)
!	%l0 = 8fabb48ee1feeabc, %l3 = 4c93e0778fabb5a3, %y  = 8fabb48e
	umulcc	%l0,%l3,%l4		! %l4 = 7ed4fabef0da61b4, %ccr = 08
!	%l4 = f0da61b4, %l5 = 00003415, Mem[0000000011000058] = 2b80e5b8 1bad5e38
	std	%l4,[%i2+0x058]	! Mem[0000000011000058] = f0da61b4 00003415
!	Mem[0000000010800080] = 9b354066 93df3494 32eb1351 0089f099
	prefetcha [%i1+0x080]%asi,20
!	%l0 = 8fabb48ee1feeabc, immed = 00000fa6, %l1 = 000000000ce944e4
	orncc	%l0,0xfa6,%l1		! %l1 = fffffffffffffafd, %ccr = 88

p0_label_33:
!	%l3 = 4c93e0778fabb5a3, Mem[0000000030800002] = 0b23aed7
	stha	%l3,[%o1+0x002]%asi	! Mem[0000000030800000] = 0b23b5a3
	set	p0_b27,%o7
	fbuge,a,pn %fcc0,p0_near_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800008] = 0000ffff, %l2 = ffffffffffffff8b
	swapa	[%i3+%o6]0x80,%l2	! %l2 = 000000000000ffff
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x01b,%g2
p0_b27:
!	Registers modified during the branch to p0_near_2
!	%l2  = fffffffffffefafe
!	%l6  = 1aed703e667eddd0
	set	p0_b28,%o7
	fbue	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	%l4 = 7ed4fabef0da61b4, Mem[0000000010000098] = d0267e98a9c1a7f9
	stx	%l4,[%i0+0x098]		! Mem[0000000010000098] = 7ed4fabef0da61b4
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x01c,%g2
p0_b28:
!	Registers modified during the branch to p0_far_3
!	%l0  = 00000000ffffffff
!	%l1  = 00000000d53dc716
!	%l4  = 0000000000003405
!	%l6  = ffffffff8fabb5a3

p0_label_34:
	membar	#Sync			! Added by membar checker (27)
!	%l4 = 0000000000003405
	setx	0x63097aa263097aa2,%g7,%l4 ! %l4 = 63097aa263097aa2
!	%f27 = cecc15df, %f8  = e1d1f125 a55863a6
	fstox	%f27,%f8 		! %f8  = ffffffff 99f51080
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000000] = ff8e45ee, %l1 = 00000000d53dc716
	ldsha	[%i2+%g0]0x80,%l1	! Annulled
p0_b29:
	membar	#Sync			! Added by membar checker (28)
!	Mem[000000003200001c] = f4eda5a4, %l7 = 000000000019d289
	lduw	[%o4+0x01c],%g2		! %g2 = 000000000019d289

p0_label_35:
!	%l1 = 00000000d53dc716, %l3 = 4c93e0778fabb5a3, %l5 = 0000000000003415
	add	%l1,%l3,%l5		! %l5 = 4c93e07864e97cb9
!	Mem[0000000030000008] = 63097aa2 6158c44f, %l1 = 00000000d53dc716, %l0 = 00000000ffffffff
	add	%o0,0x08,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 0bd1d2e9608a0090
!	%l5 = 4c93e07864e97cb9
	setx	0xf0b4aceaf0b4acea,%g7,%l5 ! %l5 = f0b4aceaf0b4acea
!	Mem[0000000030000008] = 0bd1d2e9, %l4 = 63097aa263097aa2
	ldsh	[%o0+0x00a],%l4		! %l4 = ffffffffffffd2e9
!	Branch On Register, %l2 = fffffffffffefafe
	brgz,a,pt %l2,p0_not_taken_0	! Branch Not Taken

p0_label_36:
!	Mem[0000000011000008] = 0000fbeb, %l3 = 4c93e0778fabb5a3
	ldsha	[%i2+%o6]0x80,%l3	! Annulled
p0_b30:
	membar	#Sync			! Added by membar checker (29)
!	%l0 = 0bd1d2e9608a0090, Mem[000000001000002e] = 85714817
	stha	%l0,[%i0+0x02e]%asi	! Mem[000000001000002c] = 85710090
!	%f2  = bb3ea210 00000000, %f28 = 4f96dd50
	fdtos	%f2 ,%f28		! %f28 = 99f51080
!	Mem[0000000030000048] = 2c8f3ec76dd915c6, %l0 = 0bd1d2e9608a0090
	ldx	[%o0+0x048],%l0		! %l0 = 2c8f3ec76dd915c6
!	%l5 = f0b4aceaf0b4acea, Mem[0000000010800070] = b338c56f
	stha	%l5,[%i1+0x070]%asi	! Mem[0000000010800070] = aceac56f

p0_label_37:
	fblg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000000] = 00000000 000000d2, %l2 = fffefafe, %l3 = 8fabb5a3
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000000000d2
p0_b31:
	set	p0_b32,%o7
	fble,a	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	%l2 = 00000000, %l3 = 000000d2, Mem[0000000010800090] = 09eb885a cea14175
	std	%l2,[%i1+0x090]	! Mem[0000000010800090] = 00000000 000000d2
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x020,%g2
p0_b32:
!	Registers modified during the branch to p0_far_0
!	%l7  = 0000000000000000
	ba,a	p0_b33			! Branch Taken, %ccr = 44, CWP = 0

p0_label_38:
!	Mem[0000000011000008] = 0000fbeb, %l3 = 00000000000000d2
	lduwa	[%i2+%o6]0x80,%l3	! Annulled
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x021,%g2
p0_b33:
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000013000030] = 4121f5b3, %l5 = f0b4aceaf0b4acea
	ldsb	[%i6+0x032],%l5		! Annulled
p0_b34:
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l4 = ffffffffffffd2e9, Mem[00000000110000ac] = 80a896cc
	sth	%l4,[%i2+0x0ac]		! Mem[00000000110000ac] = d2e996cc
p0_b35:

p0_label_39:
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000011800008] = ffffff8bffffde4f, %l6 = ffffffff8fabb5a3
	ldx	[%i3+0x008],%l6		! %l6 = ffffff8bffffde4f
!	%f22 = f72db874, %f11 = a7914059
	fnegs	%f22,%f11		! %f11 = 772db874
!	%l3 = 00000000000000d2, immed = fffffae4, %y  = 7ed4fabe
	sdiv	%l3,-0x51c,%l4		! %l4 = ffffffff80000000
!	Mem[0000000010000084] = 27a075d6, %l3 = 00000000000000d2
	ldsba	[%i0+0x084]%asi,%l3	! %l3 = 0000000000000027
!	Mem[0000000032000064] = 73787542, %l7 = 0000000000000000
	ldub	[%o4+0x064],%g2		! %g2 = 0000000000000073

p0_label_40:
	fblg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 0000000000000000, Mem[0000000031800004] = 41808382
	stw	%l2,[%o3+0x004]		! Annulled
p0_b36:
	membar	#Sync			! Added by membar checker (31)
!	%f14 = 87d95717 9ca2b74a, %f0  = 87d95717 9ca2b74a
	fcmpd	%fcc0,%f14,%f0 		! %fcc0 = 0
!	Mem[0000000010800000] = ceb8d694, %l4 = ffffffff80000000
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 000000000000ceb8
!	Mem[0000000030800008] = 4c93e077, %l3 = 0000000000000027
	lduha	[%o1+0x008]%asi,%l3	! %l3 = 0000000000004c93

p0_label_41:
!	%f8  = ffffffff, %f12 = 5a758dc3, %f25 = 2c8258cd
	fmuls	%f8 ,%f12,%f25		! %f25 = ffffffff
!	%f8  = ffffffff, %f26 = 57f3c69e, %f24 = 10ba90ee ffffffff
	fsmuld	%f8 ,%f26,%f24		! %f24 = ffffffff e0000000
	fbg,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000000] = 00000000, %l1 = 00000000d53dc716
	ldstuba	[%i0+%g0]0x80,%l1	! Annulled
p0_b37:
	membar	#Sync			! Added by membar checker (32)
!	%l6 = ffffff8bffffde4f, %l5 = f0b4aceaf0b4acea, %l5 = f0b4aceaf0b4acea
	xorcc	%l6,%l5,%l5		! %l5 = 0f4b53610f4b72a5, %ccr = 00

p0_label_42:
!	%f7  = db000000, %f0  = 87d95717 9ca2b74a
	fstod	%f7 ,%f0 		! %f0  = c3600000 00000000
!	Mem[0000000040000010] = 1f3b1701, %l4 = 0000ceb8, %l3 = 00004c93
	add	%o5,0x10,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 000000001f3b1701
!	%f15 = 9ca2b74a, %f16 = b50fc891 c0be7043
	fstod	%f15,%f16		! %f16 = bb9456e9 40000000
!	%l0 = 2c8f3ec76dd915c6, Mem[0000000011800008] = ffffff8b
	stwa	%l0,[%i3+%o6]0x80	! Mem[0000000011800008] = 6dd915c6
!	%f0  = c3600000, %f10 = bf800000
	fstoi	%f0 ,%f10		! %f10 = ffffff20

p0_label_43:
	set	p0_b38,%o7
	fba,pt	%fcc1,p0_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000010000080] = f504f1e0, %l5 = 0f4b53610f4b72a5
	ldub	[%i0+0x083],%l5		! %l5 = 00000000000000e0
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x026,%g2
p0_b38:
!	Registers modified during the branch to p0_near_0
!	%l0  = 1a03b381ee32c116
!	%l7  = 000000001f3b1701
	bcc,a	p0_b39			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000010000008] = 44e406ea, %l1 = 00000000d53dc716
	ldstuba	[%i0+%o6]0x80,%l1	! %l1 = 0000000000000044
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x027,%g2
p0_b39:
	membar	#Sync			! Added by membar checker (33)
!	%f10 = ffffff20 772db874, %f2  = bb3ea210 00000000
	fabsd	%f10,%f2 		! %f2  = 7fffff20 772db874

p0_label_44:
!	%l7 = 000000001f3b1701, %l0 = 1a03b381ee32c116, %y  = 1a03b381
	sdivcc	%l7,%l0,%l7		! %l7 = ffffffff80000000, %ccr = 8a
	bvc,a	p0_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000011000008] = 0000fbeb, %l6 = ffffff8bffffde4f
	ldsha	[%i2+%o6]0x80,%l6	! Annulled
p0_b40:
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000011800008] = 6dd915c6, %l4 = 000000000000ceb8
	lduba	[%i3+%o6]0x80,%l4	! %l4 = 000000000000006d
!	%l5 = 00000000000000e0, %l5 = 00000000000000e0, %y  = 1a03b381
	udivx	%l5,%l5,%l3		! %l3 = 0000000000000001

p0_label_45:
!	%l4 = 000000000000006d, immed = 000009af, %l7 = ffffffff80000000
	andcc	%l4,0x9af,%l7		! %l7 = 000000000000002d, %ccr = 00
!	%f17 = 40000000, %f17 = 40000000, %f14 = 87d95717
	fdivs	%f17,%f17,%f14		! %f14 = 3f800000
!	%l4 = 000000000000006d, immed = ffffff4c, %l7 = 000000000000002d
	andcc	%l4,-0x0b4,%l7		! %l7 = 000000000000004c, %ccr = 00
	bgu	p0_b41			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000118000a0] = 12d0e7fd c6f34d3d 33e94237 7e66b217
	prefetch [%i3+0x0a0],20
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x029,%g2
p0_b41:

p0_label_46:
	membar	#Sync			! Added by membar checker (35)
!	%l6 = ffffff8bffffde4f, immed = 00000799, %l2 = 0000000000000000
	or	%l6,0x799,%l2		! %l2 = ffffff8bffffdfdf
!	%l7 = 000000000000004c, immed = fffff1a5, %l3 = 0000000000000001
	taddcc	%l7,-0xe5b,%l3		! %l3 = fffffffffffff1f1, %ccr = 8a
!	Mem[0000000013000008] = 6cf1d2ff, %l7 = 000000000000004c
	lduba	[%i6+%o6]0x80,%l7	! %l7 = 000000000000006c
!	Denormal Floating Point Operation Nullified
	nop
!	%l2 = ffffdfdf, %l3 = fffff1f1, Mem[0000000011800008] = 6dd915c6 ffffde4f
	stda	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = ffffdfdf fffff1f1

p0_label_47:
	set	p0_b42,%o7
	fbge,pt	%fcc3,p0_near_2_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000010800000] = ceb8d694 296d9635 8f2df893 836c0000
	prefetch [%i1+0x000],4
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x02a,%g2
p0_b42:
!	Registers modified during the branch to p0_near_2
!	%l0  = 0000006bfffa9114
!	%l2  = 0000000027a075d6
!	%l3  = fffffffffffffde1
!	%l6  = 0000000000000ced
!	%l7  = 000000009f9d23df
	membar	#Sync			! Added by membar checker (36)
!	Branch On Register, %l1 = 0000000000000044
	brgz,pt	%l1,p0_b43		! Branch Taken
!	Mem[00000000100000e0] = 2297b268 ac1b9de6 3dfe54ef 1fcb562d
	prefetch [%i0+0x0e0],4
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x02b,%g2
p0_b43:
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000031000004] = ce944797, %l4 = 000000000000006d
	ldsha	[%o2+0x004]%asi,%l4	! %l4 = ffffffffffffce94

p0_label_48:
!	%l3 = fffffffffffffde1, immed = fffffe51, %y  = 0000006b
	udivcc	%l3,-0x1af,%l5		! %l5 = 000000000000006c, %ccr = 00
!	Branch On Register, %l1 = 0000000000000044
	brlez,a,pn %l1,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000011000008] = 0000fbeb, %l7 = 000000009f9d23df
	ldstuba	[%i2+%o6]0x80,%l7	! Annulled
p0_b44:
	membar	#Sync			! Added by membar checker (38)
!	%l4 = ffffffffffffce94, immed = 00000662, %y  = 0000006b
	sdivcc	%l4,0x662,%l6		! %l6 = 0000000010eba1f7, %ccr = 00
!	%l7 = 000000009f9d23df, immed = fffff34c, %y  = 0000006b
	udiv	%l7,-0xcb4,%l3		! %l3 = 000000000000006b

p0_label_49:
	set	p0_b45,%o7
	fbule,a,pn %fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 0
!	%l3 = 000000000000006b, Mem[0000000010800000] = ceb8d694
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010800000] = 6bb8d694
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x02d,%g2
p0_b45:
!	Registers modified during the branch to p0_near_3
!	%l3  = ffffffffffffffff
!	%l6  = ffffffffffffffff
!	%l7  = 00000000000bfe48
	membar	#Sync			! Added by membar checker (39)
!	%l3 = ffffffffffffffff, %l2 = 0000000027a075d6, %l1 = 0000000000000044
	taddcc	%l3,%l2,%l1		! %l1 = 0000000027a075d5, %ccr = 13
!	%l4 = ffffce94, %l5 = 0000006c, Mem[0000000032000058] = d1b4bc7c e0c4551a
	stda	%l4,[%o4+0x058]%asi	! Mem[0000000032000058] = ffffce94 0000006c
!	%l3 = ffffffffffffffff, %l5 = 000000000000006c, %l6 = ffffffffffffffff
	sub	%l3,%l5,%l6		! %l6 = ffffffffffffff93

p0_label_50:
!	Mem[00000000100000fc] = dde8d225, %l6 = ffffffffffffff93
	lduha	[%i0+0x0fc]%asi,%l6	! %l6 = 000000000000dde8
!	Mem[00000000110000e0] = a72511d3 3f05fdd2 1aed703e 667eddd0
	prefetcha [%i2+0x0e0]%asi,16
!	%l7 = 00000000000bfe48, Mem[000000001000008c] = 1674bc9f
	stwa	%l7,[%i0+0x08c]%asi	! Mem[000000001000008c] = 000bfe48
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000011000000] = ff8e45ee 8e70eb48, %l0 = fffa9114, %l1 = 27a075d5
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff8e45ee 000000008e70eb48
!	Registers modified during the branch to p0_jmpl_2
!	%l2  = 0000000000d67bb4
!	%l5  = 0000000000000000
!	%l6  = 0000000000000000

p0_label_51:
!	Branch On Register, %l7 = 00000000000bfe48
	brlez,a,pt %l7,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010800081] = 9b354066, %l3 = ffffffffffffffff
	ldstub	[%i1+0x081],%l3		! Annulled
p0_b46:
	membar	#Sync			! Added by membar checker (40)
!	%l1 = 000000008e70eb48, immed = 0000050c, %l4 = ffffffffffffce94
	xnor	%l1,0x50c,%l4		! %l4 = ffffffff718f11bb
!	Mem[0000000030000048] = 2c8f3ec7, %l3 = ffffffffffffffff
	ldub	[%o0+0x048],%l3		! %l3 = 000000000000002c
!	%l2 = 0000000000d67bb4, %l5 = 0000000000000000, %l2 = 0000000000d67bb4
	addc	%l2,%l5,%l2		! %l2 = 0000000000d67bb4

p0_label_52:
	fbul,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000010000020] = 00000000 000bfe48 0a870df1 85710090
	prefetch [%i0+0x020],22	! Annulled
p0_b47:
	membar	#Sync			! Added by membar checker (41)
!	%f1  = 00000000, %f11 = 772db874, %f19 = 772db874
	fadds	%f1 ,%f11,%f19		! %f19 = 772db874
!	Mem[0000000011800014] = 05f39874, %l3 = 000000000000002c
	ldsha	[%i3+0x014]%asi,%l3	! %l3 = 00000000000005f3
!	%f4  = 272de770, %f6  = c1be2e0e
	fmovs	%f4 ,%f6 		! %f6  = 272de770

p0_label_53:
!	Mem[00000000100000fd] = dde8d225, %l0 = 00000000ff8e45ee
	ldstuba	[%i0+0x0fd]%asi,%l0	! %l0 = 00000000000000e8
!	%l6 = 0000000000000000, immed = 00000c2c, %l0 = 00000000000000e8
	taddcc	%l6,0xc2c,%l0		! %l0 = 0000000000000c2c, %ccr = 00
!	%l2 = 0000000000d67bb4, Mem[0000000010800019] = 80ebe16d
	stb	%l2,[%i1+0x019]		! Mem[0000000010800018] = 80b4e16d
!	Mem[00000000128000ec] = c65f9f13, %l6 = 0000000000000000
	lduba	[%i5+0x0ed]%asi,%l6	! %l6 = 000000000000005f
!	Mem[0000000032000018] = 2d315b59, %l0 = 0000000000000c2c
	ldsb	[%o4+0x018],%g2		! %g2 = 000000000000002d

p0_label_54:
!	%f18 = c9a434bd 772db874, %f6  = 272de770 db000000
	fabsd	%f18,%f6 		! %f6  = 49a434bd 772db874
!	Mem[0000000031800048] = 00000000, %l5 = 0000000000000000
	ldsb	[%o3+0x048],%l5		! %l5 = 0000000000000000
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800040] = 56e0aaac c446715f 1ee24d64 69b79a56
	prefetch [%i1+0x040],16	! Annulled
p0_b48:
	membar	#Sync			! Added by membar checker (42)
!	Mem[000000003200000c] = 3a148f2e, %l1 = 000000008e70eb48
	lduha	[%o4+0x00e]%asi,%g2	! %g2 = 0000000000003a14

p0_label_55:
	set	p0_b49,%o7
	fbuge,a	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010000000] = 00000000, %l6 = 000000000000005f
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x031,%g2
p0_b49:
	ba	p0_b50			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000040000013] = 1f3b1701, %l3 = 00000000000005f3
	ldstub	[%o5+0x013],%l3		! %l3 = 0000000000000001
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x032,%g2
p0_b50:
	membar	#Sync			! Added by membar checker (43)
	set	p0_b51,%o7
	fbne,a,pt %fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 2

p0_label_56:
!	%l3 = 0000000000000001, Mem[0000000011000008] = 0000fbeb
	stha	%l3,[%i2+%o6]0x80	! Mem[0000000011000008] = 0001fbeb
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x033,%g2
p0_b51:
!	Registers modified during the branch to p0_near_1
!	%l0  = 00000000fffffe14
!	%l2  = fffffffffffffefd
!	%l4  = fffffffffffff3f7
!	%l7  = ffffffffff1ce1d6
	membar	#Sync			! Added by membar checker (44)
!	Mem[000000003180000c] = 10000000, %l6 = 0000000000000000
	ldswa	[%o3+0x00c]%asi,%l6	! %l6 = 0000000010000000
!	%l0 = fffffe14, %l1 = 8e70eb48, Mem[0000000011800008] = ffffdfdf fffff1f1
	stda	%l0,[%i3+%o6]0x80	! Mem[0000000011800008] = fffffe14 8e70eb48
!	%l7 = ffffffffff1ce1d6, Mem[0000000031000040] = 7f576c5f
	sth	%l7,[%o2+0x040]		! Mem[0000000031000040] = e1d66c5f
!	Mem[0000000032000000] = 237580e8 c2bb115b 19d8e6f6 7b393a14
	prefetcha [%o4+0x000]%asi,3

p0_label_57:
!	Mem[0000000011000000] = ff8e45ee, %l6 = 0000000010000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = ffffffffff8e45ee
!	%f18 = c9a434bd 772db874, %f6  = 49a434bd 772db874, %f24 = ffffffff e0000000
	fsubd	%f18,%f6 ,%f24		! %f24 = c9b434bd 772db874
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011000008] = 0001fbeb8fdf76dd, %l6 = ffffffffff8e45ee
	ldxa	[%i2+%o6]0x80,%l6	! %l6 = 0001fbeb8fdf76dd
p0_b52:
	membar	#Sync			! Added by membar checker (45)
!	%l4 = fffffffffffff3f7, immed = fffff2c3, %l7 = ffffffffff1ce1d6
	xnor	%l4,-0xd3d,%l7		! %l7 = fffffffffffffecb

p0_label_58:
!	Mem[00000000110000f8] = 160a93c3 656d5720, %l6 = 8fdf76dd, %l7 = fffffecb
	ldda	[%i2+0x0f8]%asi,%l6	! %l6 = 00000000160a93c3 00000000656d5720
!	Mem[0000000011000000] = ff8e45ee, %l4 = fffffffffffff3f7
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffffff
	fbu,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l2 = fffffffffffffefd, Mem[0000000011800008] = fffffe14
	stwa	%l2,[%i3+%o6]0x80	! Annulled
p0_b53:
	membar	#Sync			! Added by membar checker (46)
!	%l1 = 000000008e70eb48, immed = 00000641, %l4 = ffffffffffffffff
	orn	%l1,0x641,%l4		! %l4 = fffffffffffffbfe

p0_label_59:
!	%f26 = 57f3c69e, %f1  = 00000000
	fabss	%f26,%f1 		! %f1  = 57f3c69e
	bleu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011800000] = ffffffff, %l1 = 000000008e70eb48
	lduwa	[%i3+%g0]0x80,%l1	! Annulled
p0_b54:
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000031800043] = 4de95d29, %l7 = 00000000656d5720
	ldstuba	[%o3+0x043]%asi,%l7	! %l7 = 0000000000000029
!	Mem[0000000010000000] = 00000000, %l1 = 000000008e70eb48
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_60:
!	Mem[0000000011800008] = fffffe14, %l0 = 00000000fffffe14
	lduwa	[%i3+%o6]0x80,%l0	! %l0 = 00000000fffffe14
!	Mem[0000000010800000] = 6bb8d694296d9635, %l2 = fffffffffffffefd
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 6bb8d694296d9635
!	%l2 = 6bb8d694296d9635, Mem[000000001080007c] = a4481346
	stba	%l2,[%i1+0x07c]%asi	! Mem[000000001080007c] = 35481346
	set	p0_b55,%o7
	fba,a	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000108000ac] = 0ef219e0, %l6 = 00000000160a93c3
	ldsb	[%i1+0x0ad],%l6		! Annulled
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x037,%g2
p0_b55:
!	Registers modified during the branch to p0_far_1
!	%l0  = 00000000000000ff
!	%l1  = 0000000000000000
!	%l4  = 6bb8d694296d96ca
!	%l6  = ffffffffffffeb2a

p0_label_61:
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000030800048] = 00000c2c, %l5 = 0000000000000000
	ldsb	[%o1+0x04a],%l5		! %l5 = 000000000000000c
!	%l1 = 0000000000000000, immed = fffffe99, %l4 = 6bb8d694296d96ca
	or	%l1,-0x167,%l4		! %l4 = fffffffffffffe99
!	%l2 = 6bb8d694296d9635, Mem[0000000030800008] = 4c93e0778fabb5a3
	stxa	%l2,[%o1+0x008]%asi	! Mem[0000000030800008] = 6bb8d694296d9635
!	%f26 = 57f3c69e cecc15df, %f2  = 7fffff20 772db874, %f18 = c9a434bd 772db874
	fdivd	%f26,%f2 ,%f18		! %f18 = 7fffff20 772db874
!	%l3 = 0000000000000001, immed = 000009ae, %l2 = 6bb8d694296d9635
	andncc	%l3,0x9ae,%l2		! %l2 = 0000000000000001, %ccr = 00

p0_label_62:
!	%l2 = 0000000000000001, %l3 = 0000000000000001, %y  = 00000000
	smul	%l2,%l3,%l4		! %l4 = 0000000000000001
!	%l2 = 0000000000000001, immed = 000000ba, %l0 = 00000000000000ff
	tsubcc	%l2,0x0ba,%l0		! %l0 = ffffffffffffff47, %ccr = 9b
!	Mem[0000000011000054] = 3c282219, %l1 = 0000000000000000
	ldsh	[%i2+0x056],%l1		! %l1 = 0000000000002219
!	%f8  = ffffffff 99f51080, %f28 = 99f51080 aa6385ad, %f16 = bb9456e9 40000000
	fmuld	%f8 ,%f28,%f16		! %f16 = ffffffff 99f51080
	fblg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_63:
!	Mem[0000000031000008] = 8a20b52b, %l0 = ffffffffffffff47
	swap	[%o2+0x008],%l0		! %l0 = 000000008a20b52b
p0_b56:
	membar	#Sync			! Added by membar checker (49)
!	%l3 = 0000000000000001, %l6 = ffffffffffffeb2a, %l2 = 0000000000000001
	addcc	%l3,%l6,%l2		! %l2 = ffffffffffffeb2b, %ccr = 88
	bvc,a	p0_b57			! Branch Taken, %ccr = 88, CWP = 0
!	%l1 = 0000000000002219, Mem[0000000031000004] = ce944797
	stw	%l1,[%o2+0x004]		! Mem[0000000031000004] = 00002219
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x039,%g2
p0_b57:
	set	p0_b58,%o7
	fbge,a	p0_far_3_le	! Branch Taken, %fcc0 = 0

p0_label_64:
!	Mem[0000000011000008] = 0001fbeb, %l6 = ffffffffffffeb2a
	lduba	[%i2+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x03a,%g2
p0_b58:
!	Registers modified during the branch to p0_far_3
!	%l0  = 000000000011e7ee
!	%l1  = 00000000d53dc716
!	%l4  = 0000000000000004
!	%l6  = 00000000296d9635
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000030800000] = 0b23b5a3, %l6 = 00000000296d9635
	ldswa	[%o1+0x000]%asi,%l6	! %l6 = 000000000b23b5a3
	fbl,pn	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l7 = 0000000000000029, Mem[000000003200004e] = 83dccd7b
	sth	%l7,[%o4+0x04e]		! Mem[000000003200004c] = 0029cd7b
p0_b59:
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000011800000] = ffffffff, %l7 = 0000000000000029
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff

p0_label_65:
!	%f18 = 7fffff20 772db874, %f8  = ffffffff 99f51080
	fcmped	%fcc2,%f18,%f8 		! %fcc2 = 3
!	Mem[0000000011000040] = 95cf4ce4 ac36718b
	flush	%i2+0x040
!	%l4 = 0000000000000004, Mem[0000000032000040] = 9270504b0b09b218
	stx	%l4,[%o4+0x040]		! Mem[0000000032000040] = 0000000000000004
!	Branch On Register, %l6 = 000000000b23b5a3
	brgez,a,pn %l6,p0_b60		! Branch Taken
!	%l3 = 0000000000000001, Mem[000000003000000c] = 608a0090
	stb	%l3,[%o0+0x00c]		! Mem[000000003000000c] = 018a0090
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x03c,%g2
p0_b60:

p0_label_66:
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010800000] = 6bb8d694, %l2 = ffffffffffffeb2b
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000006bb8
!	%l0 = 000000000011e7ee, %l1 = 00000000d53dc716, %l2 = 0000000000006bb8
	taddcc	%l0,%l1,%l2		! %l2 = 00000000d54faf04, %ccr = 0a
!	%l4 = 0000000000000004, Mem[000000003080000c] = 296d9635
	stwa	%l4,[%o1+0x00c]%asi	! Mem[000000003080000c] = 00000004
!	%f8  = ffffffff 99f51080, %f24 = c9b434bd 772db874, %f14 = 3f800000 9ca2b74a
	fdivd	%f8 ,%f24,%f14		! %f14 = ffffffff 99f51080
!	%l7 = 00000000000000ff, %l0 = 000000000011e7ee, %l0 = 000000000011e7ee
	addc	%l7,%l0,%l0		! %l0 = 000000000011e8ed

p0_label_67:
!	%l1 = 00000000d53dc716, immed = fffff69c, %l1 = 00000000d53dc716
	subc	%l1,-0x964,%l1		! %l1 = 00000000d53dd07a
	set	p0_b61,%o7
	fbo,a,pt %fcc1,p0_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[000000001180001a] = a8d25428, %l1 = 00000000d53dd07a
	ldstub	[%i3+0x01a],%l1		! %l1 = 0000000000000054
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x03d,%g2
p0_b61:
!	Registers modified during the branch to p0_near_0
!	%l0  = 0000000000000054
!	%l7  = 00000000000000fe
	membar	#Sync			! Added by membar checker (53)
!	Branch On Register, %l5 = 000000000000000c
	brlez,pn %l5,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010800030] = fb363a37, %l7 = 00000000000000fe
	ldub	[%i1+0x031],%l7		! %l7 = 0000000000000036
p0_b62:

p0_label_68:
	bpos,a	p0_b63			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000108000bc] = 4de3143c, %l4 = 0000000000000004
	lduh	[%i1+0x0be],%l4		! %l4 = 000000000000143c
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x03f,%g2
p0_b63:
	membar	#Sync			! Added by membar checker (54)
!	%f16 = ffffffff, %f27 = cecc15df
	fnegs	%f16,%f27		! %f27 = 7fffffff
!	Mem[0000000011800060] = e880fedf f4279a06 719224de ec0035f6
	prefetcha [%i3+0x060]%asi,2
	set	p0_b64,%o7
	fbuge,pt %fcc3,p0_near_1_le	! Branch Taken, %fcc3 = 2

p0_label_69:
!	%l3 = 0000000000000001, Mem[00000000100000a0] = 96760b09ae4d8673
	stx	%l3,[%i0+0x0a0]		! Mem[00000000100000a0] = 0000000000000001
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x040,%g2
p0_b64:
!	Registers modified during the branch to p0_near_1
!	%l0  = 0000000000000000
!	%l3  = fffffffffffffc7f
!	%l4  = fffffffffffff63d
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = 0000000000000036, Mem[0000000010000070] = 63f36b9a69cbb7b6
	stx	%l7,[%i0+0x070]		! Annulled
p0_b65:
	membar	#Sync			! Added by membar checker (55)
!	%l1 = 0000000000000054, immed = 00000d3f, %l1 = 0000000000000054
	subccc	%l1,0xd3f,%l1		! %l1 = fffffffffffff315, %ccr = 99
!	%l3 = fffffffffffffc7f, immed = fffff1cd, %l2 = 00000000d54faf04
	subccc	%l3,-0xe33,%l2		! %l2 = 0000000000000ab1, %ccr = 00

p0_label_70:
!	Branch On Register, %l4 = fffffffffffff63d
	brnz,pt	%l4,p0_b66		! Branch Taken
!	Mem[0000000011000080] = 684ddc51 b6365dbc 86a70789 e8bc3fbf
	prefetch [%i2+0x080],2
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x042,%g2
p0_b66:
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000010800000] = 6bb8d694 296d9635 8f2df893 836c0000
	prefetcha [%i1+0x000]%asi,4
!	Branch On Register, %l7 = 0000000000000036
	brnz,a,pt %l7,p0_b67		! Branch Taken
!	Mem[00000000108000d8] = 9f58e547, %l1 = fffffffffffff315
	ldub	[%i1+0x0db],%l1		! %l1 = 0000000000000047
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x043,%g2
p0_b67:

p0_label_71:
	membar	#Sync			! Added by membar checker (57)
!	%l0 = 0000000000000000, immed = fffffb19, %l1 = 0000000000000047
	andn	%l0,-0x4e7,%l1		! %l1 = 0000000000000000
	set	p0_b68,%o7
	fbue,pt	%fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 0
!	%l7 = 0000000000000036, Mem[0000000010000008] = ffe406ea
	stwa	%l7,[%i0+%o6]0x80	! Mem[0000000010000008] = 00000036
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x044,%g2
p0_b68:
!	Registers modified during the branch to p0_near_3
!	%l3  = fffffffffffffc73
!	%l6  = ffffffffffffffff
!	%l7  = 0000000000000000
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011800000] = ffffffff8fabb5a3, %l0 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l0	! Annulled
p0_b69:

p0_label_72:
	membar	#Sync			! Added by membar checker (58)
!	%l6 = ffffffffffffffff, Mem[00000000110000ac] = d2e996cc
	stha	%l6,[%i2+0x0ac]%asi	! Mem[00000000110000ac] = ffff96cc
!	Mem[00000000130000e0] = 8c0d1d6c 61c46938 5b8e0ebb 5f761ef5
	prefetch [%i6+0x0e0],3
!	Mem[0000000010000060] = e6566435 1f7986d2 0b23aed7 19d8e6f6
	prefetcha [%i0+0x060]%asi,22
!	%l4 = fffffffffffff63d, immed = fffff577, %y  = 00000000
	umulcc	%l4,-0xa89,%l0		! %l0 = ffffebb40066d75b, %ccr = 80
!	%f11 = 772db874, %f8  = ffffffff 99f51080
	fitod	%f11,%f8 		! %f8  = 41ddcb6e 1d000000

p0_label_73:
!	%f17 = 99f51080, %f4  = 272de770
	fabss	%f17,%f4 		! %f4  = 19f51080
!	Mem[0000000013000040] = 51c0707c f9f47f2d 610e7729 9a1a3dbf
	prefetcha [%i6+0x040]%asi,1
!	%l6 = ffffffffffffffff
	sethi	%hi(0xab5d9000),%l6	! %l6 = 00000000ab5d9000
!	Mem[0000000011800000] = ffffffff, %l3 = fffffffffffffc73
	lduha	[%i3+%g0]0x80,%l3	! %l3 = 000000000000ffff
	bpos	p0_b70			! Branch Taken, %ccr = 80, CWP = 0

p0_label_74:
!	Mem[0000000010000008] = 00000036, %l2 = 0000000000000ab1
	lduwa	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000036
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x046,%g2
p0_b70:
	membar	#Sync			! Added by membar checker (59)
!	%l4 = fffffffffffff63d, %l0 = ffffebb40066d75b, %l6 = 00000000ab5d9000
	srax	%l4,%l0,%l6		! %l6 = ffffffffffffffff
!	%l6 = ffffffffffffffff, immed = fffffc9d, %l6 = ffffffffffffffff
	andcc	%l6,-0x363,%l6		! %l6 = fffffffffffffc9d, %ccr = 88
!	%f2  = 7fffff20 772db874, %f30 = 99815ad7 003e8115
	fcmped	%fcc1,%f2 ,%f30		! %fcc1 = 3
	nop				! Delay added due to fcmp
	fbn,pn	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 3

p0_label_75:
!	Mem[0000000011000020] = 9913992b 91ee9f27 a142f1f6 29eea795
	prefetch [%i2+0x020],22
p0_b71:
	membar	#Sync			! Added by membar checker (60)
!	%f20 = 07d95717, %f1  = 57f3c69e
	fnegs	%f20,%f1 		! %f1  = 87d95717
!	%l1 = 0000000000000000, immed = fffff5ca, %l2 = 0000000000000036
	or	%l1,-0xa36,%l2		! %l2 = fffffffffffff5ca
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800008] = 8f2df893, %l3 = 000000000000ffff
	lduba	[%i1+%o6]0x80,%l3	! %l3 = 000000000000008f
p0_b72:

p0_label_76:
	membar	#Sync			! Added by membar checker (61)
!	%f30 = 99815ad7, %f2  = 7fffff20 772db874
	fstod	%f30,%f2 		! %f2  = bb302b5a e0000000
	fbl,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000010800060] = 85f0c657 5b381f7f 43c8c412 92647f50
	prefetch [%i1+0x060],23	! Annulled
p0_b73:
	membar	#Sync			! Added by membar checker (62)
	set	p0_b74,%o7
	fbug,pt	%fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 3
!	Mem[00000000110000b8] = 04b38dc6, %l5 = 000000000000000c
	ldub	[%i2+0x0ba],%l5		! %l5 = 000000000000008d
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x04a,%g2
p0_b74:
!	Registers modified during the branch to p0_near_2
!	%l0  = 0000000000000000
!	%l2  = 0000000027a075d6
!	%l3  = fffffffffffffd8e
!	%l6  = fffffffffffffadd
!	%l7  = 000000000000006c

p0_label_77:
	membar	#Sync			! Added by membar checker (63)
!	%f1  = 87d95717, %f20 = 07d95717, %f4  = 19f51080
	fadds	%f1 ,%f20,%f4 		! %f4  = 00000000
!	%f14 = ffffffff, %f6  = 49a434bd
	fitos	%f14,%f6 		! %f6  = bf800000
!	%l4 = fffff63d, %l5 = 0000008d, Mem[0000000031000048] = 8331949b ffe68ca7
	stda	%l4,[%o2+0x048]%asi	! Mem[0000000031000048] = fffff63d 0000008d
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001100003c] = c895be88, %l1 = 0000000000000000
	ldub	[%i2+0x03f],%l1		! Annulled
p0_b75:

p0_label_78:
	membar	#Sync			! Added by membar checker (64)
	set	p0_b76,%o7
	fbe,a,pt %fcc0,p0_near_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800060] = e880fedf f4279a06 719224de ec0035f6
	prefetch [%i3+0x060],3
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x04c,%g2
p0_b76:
!	Registers modified during the branch to p0_near_2
!	%l0  = 0000006bfffa9114
!	%l2  = 0000000027a075d6
!	%l3  = fffffffffffffd8e
!	%l6  = fffffffffffffadd
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (65)
!	Branch On Register, %l0 = 0000006bfffa9114
	brz,pn	%l0,p0_not_taken_0	! Branch Not Taken
!	Mem[00000000110000c0] = 360e1f54 da2f2ca1 ffffeb2a ffffffff
	prefetch [%i2+0x0c0],23
p0_b77:
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88

p0_label_79:
!	Mem[0000000010000000] = 00000000, %l3 = fffffffffffffd8e
	lduba	[%i0+%g0]0x80,%l3	! Annulled
p0_b78:
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000030000008] = 0bd1d2e9, %l6 = fffffadd, %l5 = 0000008d
	add	%o0,0x08,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 000000000bd1d2e9
!	%l5 = 000000000bd1d2e9, %l7 = 0000000000000000, %l0 = 0000006bfffa9114
	sub	%l5,%l7,%l0		! %l0 = 000000000bd1d2e9
	set	p0_b79,%o7
	fbge,pt	%fcc0,p0_near_0_he	! Branch Taken, %fcc0 = 0
!	%l2 = 27a075d6, %l3 = fffffd8e, Mem[00000000108000b8] = ed2607d3 4de3143c
	std	%l2,[%i1+0x0b8]	! Mem[00000000108000b8] = 27a075d6 fffffd8e
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x04f,%g2
p0_b79:
!	Registers modified during the branch to p0_near_0
!	%l0  = fffffffffffffa00

p0_label_80:
	membar	#Sync			! Added by membar checker (67)
!	%l5 = 000000000bd1d2e9, Mem[0000000010800008] = 8f2df893836c0000
	stxa	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = 000000000bd1d2e9
!	%l3 = fffffffffffffd8e, %l6 = fffffffffffffadd, %y  = 0000006b
	udivcc	%l3,%l6,%l2		! %l2 = 000000000000006c, %ccr = 00
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001000009e] = f0da61b4, %l6 = fffffffffffffadd
	ldstub	[%i0+0x09e],%l6		! Annulled
p0_b80:
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_81:
!	Mem[0000000013000060] = 286b7298 a4fac6ef b3a5ae9b 7d1f04d5
	prefetch [%i6+0x060],21	! Annulled
p0_b81:
	membar	#Sync			! Added by membar checker (68)
!	%l6 = fffffffffffffadd, Mem[0000000030000045] = e27c8139
	stba	%l6,[%o0+0x045]%asi	! Mem[0000000030000044] = e2dd8139
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 000000000000006c, Mem[0000000031000003] = 00000001
	stb	%l2,[%o2+0x003]		! Annulled
p0_b82:
	membar	#Sync			! Added by membar checker (69)
!	%l3 = fffffffffffffd8e, Mem[0000000011800037] = e863a946
	stb	%l3,[%i3+0x037]		! Mem[0000000011800034] = e863a98e

p0_label_82:
	fbul,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011800000] = ffffffff, %l3 = fffffffffffffd8e
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ffffffff
p0_b83:
	membar	#Sync			! Added by membar checker (70)
!	%l4 = fffffffffffff63d, %l5 = 000000000bd1d2e9, %l5 = 000000000bd1d2e9
	addcc	%l4,%l5,%l5		! %l5 = 000000000bd1c926, %ccr = 11
!	%l1 = 0000000000000000, Mem[0000000031800042] = 4de95dff
	stb	%l1,[%o3+0x042]		! Mem[0000000031800040] = 4de900ff
!	%l4 = fffffffffffff63d, Mem[0000000011800000] = fffffd8e
	stha	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = f63dfd8e

p0_label_83:
!	Mem[000000003000000c] = 018a0090, %l1 = 0000000000000000
	lduh	[%o0+0x00e],%l1		! %l1 = 0000000000000090
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000010000008] = 00000036, %l1 = 0000000000000090
	swapa	[%i0+%o6]0x80,%l1	! %l1 = 0000000000000036
p0_b84:
	set	p0_b85,%o7
	fbo,a	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011000000] = ff8e45ee 8e70eb48 0001fbeb 8fdf76dd
	prefetch [%i2+0x000],4
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x055,%g2
p0_b85:
!	Registers modified during the branch to p0_far_1
!	%l0  = 000000000bd1ca26
!	%l1  = 0000000000000003
!	%l4  = 0000000000000093
!	%l6  = ffffffffffffeb2a

p0_label_84:
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000040] = 95cf4ce4 ac36718b b1f71998 5a20c246
	prefetch [%i2+0x040],21	! Annulled
p0_b86:
	membar	#Sync			! Added by membar checker (71)
!	Mem[0000000010800018] = 80b4e16d, %l1 = 00000003, %l4 = 00000093
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000080b4e16d
!	%f14 = ffffffff, %f15 = 99f51080
	fabss	%f14,%f15		! %f15 = 7fffffff
	bvc	p0_b87			! Branch Taken, %ccr = 11, CWP = 0

p0_label_85:
!	Mem[0000000011000008] = 0001fbeb, %l1 = 0000000000000003
	ldsba	[%i2+%o6]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x057,%g2
p0_b87:
	membar	#Sync			! Added by membar checker (72)
!	%l1 = 0000000000000000, immed = 0000051f, %l3 = 00000000ffffffff
	addccc	%l1,0x51f,%l3		! %l3 = 0000000000000520, %ccr = 00
!	Mem[0000000030800048] = 00000c2c, %l1 = 0000000000000000
	swap	[%o1+0x048],%l1		! %l1 = 0000000000000c2c
!	%l7 = 0000000000000000, %l6 = ffffffffffffeb2a, %l1 = 0000000000000c2c
	andncc	%l7,%l6,%l1		! %l1 = 0000000000000000, %ccr = 44
	fbul,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_86:
!	Mem[0000000031800004] = 41808382, %l1 = 0000000000000000
	swap	[%o3+0x004],%l1		! Annulled
p0_b88:
	membar	#Sync			! Added by membar checker (73)
!	%l7 = 0000000000000000, %l2 = 000000000000006c, %l1 = 0000000000000000
	subccc	%l7,%l2,%l1		! %l1 = ffffffffffffff94, %ccr = 99
!	Mem[0000000012000000] = 80e13caf, %l0 = 000000000bd1ca26
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 0000000080e13caf
!	%f0  = c3600000, %f6  = bf800000 772db874
	fstox	%f0 ,%f6 		! %f6  = ffffffff ffffff20
!	%l1 = ffffffffffffff94, immed = fffffdd8, %y  = 0000006b
	udivcc	%l1,-0x228,%l4		! %l4 = 000000000000006c, %ccr = 00

p0_label_87:
!	call to call_3, CWP = 0
	call	p0_call_3_le
!	Mem[0000000010800008] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%o6]0x80,%l7	! %l7 = 0000000000000000
!	Registers modified during the branch to p0_call_3
!	%l6  = 0000000000000000
!	%l3 = 0000000000000520, Mem[000000001000004c] = ca61f1bc
	sth	%l3,[%i0+0x04c]		! Mem[000000001000004c] = 0520f1bc
!	%l2 = 000000000000006c, Mem[0000000010000008] = 00000090
	stwa	%l2,[%i0+%o6]0x80	! Mem[0000000010000008] = 0000006c
!	%l5 = 000000000bd1c926, %l3 = 0000000000000520, %y  = 0000006b
	mulx	%l5,%l3,%l0		! %l0 = 0000003c9326e2c0

p0_label_88:
!	%l4 = 000000000000006c, %l0 = 0000003c9326e2c0, %l4 = 000000000000006c
	orn	%l4,%l0,%l4		! %l4 = ffffffc36cd91d7f
!	Mem[0000000010000000] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000520, %l3 = 0000000000000520, %y  = 0000006b
	udivcc	%l3,%l3,%l4		! %l4 = 0000000014e0c7cf, %ccr = 00
!	Mem[0000000010800000] = 6bb8d694, %l5 = 000000000bd1c926
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 000000000000006b
	set	p0_b89,%o7
	fbe,a,pn %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 0

p0_label_89:
!	Mem[0000000011000008] = 0001fbeb, %l5 = 000000000000006b
	ldsha	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000001
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x059,%g2
p0_b89:
!	Registers modified during the branch to p0_near_0
!	%l0  = 0000051ffffdd680
!	%l7  = 0000000000000520
	membar	#Sync			! Added by membar checker (74)
!	Mem[0000000010800054] = d53dc716, %l1 = ffffffffffffff94
	ldsba	[%i1+0x054]%asi,%l1	! %l1 = ffffffffffffffd5
!	%f13 = a7914059, %f19 = 772db874
	fnegs	%f13,%f19		! %f19 = 27914059
!	Mem[0000000010000040] = 75c7047b e9b25eaa aca8da5a 0520f1bc
	prefetcha [%i0+0x040]%asi,3
!	%l4 = 0000000014e0c7cf, %l3 = 0000000000000520, %y  = 0000051f
	udiv	%l4,%l3,%l1		! %l1 = 00000000ffd21f5f

p0_label_90:
!	Mem[0000000010000008] = 0000006c, %l1 = 00000000ffd21f5f
	lduha	[%i0+%o6]0x80,%l1	! %l1 = 0000000000000000
	fbul,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 0000000014e0c7cf, Mem[0000000011000008] = 0001fbeb
	stwa	%l4,[%i2+%o6]0x80	! Annulled
p0_b90:
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010000040] = 75c7047b e9b25eaa aca8da5a 0520f1bc
	prefetcha [%i0+0x040]%asi,16
!	%l7 = 0000000000000520, %l0 = 0000051ffffdd680, %y  = 0000051f
	udivcc	%l7,%l0,%l3		! %l3 = 000000000000051f, %ccr = 00

p0_label_91:
	set	p0_b91,%o7
	fbug,pn	%fcc1,p0_near_1_he	! Branch Taken, %fcc1 = 3
!	Mem[0000000031800008] = 0000006c, %l0 = 0000051ffffdd680
	ldsb	[%o3+0x00b],%l0		! %l0 = 000000000000006c
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x05b,%g2
p0_b91:
!	Registers modified during the branch to p0_near_1
!	%l0  = 0000051efff6286c
!	%l2  = 0000000000000000
!	%l4  = fffffffffffffbd7
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (76)
!	%l6 = 0000000000000000
	sethi	%hi(0x03e48400),%l6	! %l6 = 0000000003e48400
!	%l5 = 0000000000000001, %l4 = fffffffffffffbd7, %y  = 0000051e
	sdivx	%l5,%l4,%l5		! %l5 = 0000000000000000
!	%l6 = 0000000003e48400, %l7 = 0000000000000000, %l4 = fffffffffffffbd7
	taddcc	%l6,%l7,%l4		! %l4 = 0000000003e48400, %ccr = 00

p0_label_92:
	set	p0_b92,%o7
	fbug,pt	%fcc2,p0_near_3_le	! Branch Taken, %fcc2 = 3
!	Mem[000000003180000c] = 0bd1c926, %l5 = 0000000000000000
	lduh	[%o3+0x00c],%l5		! %l5 = 0000000000000bd1
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x05c,%g2
p0_b92:
!	Registers modified during the branch to p0_near_3
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (77)
!	%f8  = 41ddcb6e 1d000000, %f2  = bb302b5a e0000000
	fdtox	%f8 ,%f2 		! %f2  = 00000000 772db874
!	Branch On Register, %l3 = 000000000000051f
	brgz,a,pn %l3,p0_b93		! Branch Taken
!	Mem[0000000030800000] = 0b23b5a3ffd8e6f6, %l3 = 000000000000051f
	ldx	[%o1+0x000],%l3		! %l3 = 0b23b5a3ffd8e6f6
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x05d,%g2
p0_b93:

p0_label_93:
	membar	#Sync			! Added by membar checker (78)
!	Branch On Register, %l2 = 0000000000000000
	brgz,a,pt %l2,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010000008] = 0000006c509695ef, %l3 = 0b23b5a3ffd8e6f6
	ldxa	[%i0+%o6]0x80,%l3	! Annulled
p0_b94:
!	call to call_1, CWP = 0
	call	p0_call_1_le
!	Mem[0000000010000091] = c49cc3ac, %l4 = 0000000000000000
	ldstub	[%i0+0x091],%l4		! %l4 = 000000000000009c
!	Registers modified during the branch to p0_call_1
!	%l1  = 0001fbeb8fdf76dd
!	%l2  = 0001fbeb8fdf77fd
!	%l5  = 0000000000000190
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (79)
!	Branch On Register, %l6 = 0000000003e48400
	brz,pt	%l6,p0_not_taken_0	! Branch Not Taken

p0_label_94:
!	%l4 = 000000000000009c, Mem[0000000011000008] = 0001fbeb
	stwa	%l4,[%i2+%o6]0x80	! Mem[0000000011000008] = 0000009c
p0_b95:
	membar	#Sync			! Added by membar checker (80)
!	%f0  = c3600000, %f2  = 00000000
	fstoi	%f0 ,%f2 		! %f2  = ffffff20
!	%l5 = 0000000000000190, Mem[0000000030000008] = 0bd1d2e9
	stw	%l5,[%o0+0x008]		! Mem[0000000030000008] = 00000190
!	%l7 = 0000000000000000, %l1 = 0001fbeb8fdf76dd, %l3 = 0b23b5a3ffd8e6f6
	xorcc	%l7,%l1,%l3		! %l3 = 0001fbeb8fdf76dd, %ccr = 08
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 08

p0_label_95:
!	Mem[000000001080008c] = 0089f099, %l1 = 0001fbeb8fdf76dd
	ldsh	[%i1+0x08c],%l1		! %l1 = 0000000000000089
p0_b96:
	membar	#Sync			! Added by membar checker (81)
!	Mem[0000000011800020] = 4145e0b1 e3f639de b5e948da ea6fc8d9
	prefetcha [%i3+0x020]%asi,23
	fbg,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 3
!	%l2 = 0001fbeb8fdf77fd, Mem[0000000010000048] = aca8da5a
	sth	%l2,[%i0+0x048]		! Annulled
p0_b97:
	membar	#Sync			! Added by membar checker (82)
!	%f26 = 57f3c69e, %f14 = ffffffff 7fffffff
	fstox	%f26,%f14		! %f14 = 0001e78d 3c000000

p0_label_96:
	set	p0_b98,%o7
	fble	p0_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[000000003000000c] = 018a0090, %l5 = 0000000000000190
	ldsw	[%o0+0x00c],%l5		! %l5 = 00000000018a0090
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x062,%g2
p0_b98:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000003415
!	%l4  = 00000000c75676db
!	%l5  = fffe041470208923
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000012800000] = 824f1131, %l5 = fffe041470208923
	ldsb	[%i5+0x003],%l5		! Annulled
p0_b99:
	membar	#Sync			! Added by membar checker (83)
	set	p0_b100,%o7
	fbug,a,pn %fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 2

p0_label_97:
!	%l7 = 0000000000000000, Mem[0000000010000098] = 7ed4fabe
	sth	%l7,[%i0+0x098]		! Mem[0000000010000098] = 0000fabe
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x064,%g2
p0_b100:
!	Registers modified during the branch to p0_near_1
!	%l0  = 8fdf75c87e878f44
!	%l2  = 0000000000000000
!	%l4  = fffffffffffff3d7
!	%l7  = 0000000000000001
	membar	#Sync			! Added by membar checker (84)
!	%l6 = 0000000003e48400, %l7 = 0000000000000001, %l3 = 0001fbeb8fdf76dd
	andcc	%l6,%l7,%l3		! %l3 = 0000000000000000, %ccr = 44
!	%l5 = fffe041470208923, immed = fffff4af, %y  = 8fdf75c8
	udivx	%l5,-0xb51,%l4		! %l4 = 0000000000000000
!	Branch On Register, %l2 = 0000000000000000
	brnz,a,pn %l2,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010800010] = 47b767cb, %l0 = 8fdf75c87e878f44
	lduh	[%i1+0x012],%l0		! Annulled
p0_b101:

p0_label_98:
	bleu,a	p0_b102			! Branch Taken, %ccr = 44, CWP = 0
!	%l5 = fffe041470208923, Mem[0000000010800008] = 00000000
	stha	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = 89230000
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x066,%g2
p0_b102:
	membar	#Sync			! Added by membar checker (85)
!	Mem[00000000100000c0] = 4898aacc f03f3ee1 0dd1b965 bbcb821f
	prefetch [%i0+0x0c0],21
	fbl	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003080000c] = 00000004, %l4 = 0000000000000000
	ldub	[%o1+0x00d],%l4		! %l4 = 0000000000000000
p0_b103:

p0_label_99:
	membar	#Sync			! Added by membar checker (86)
!	%l1 = 0000000000000089, Mem[0000000010000000] = 00000000
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = 00000089
!	Mem[0000000010000078] = 4898aacc 00000000, %l7 = 0000000000000001, %l1 = 0000000000000089
	add	%i0,0x78,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = dd1bea3612c9f19d
!	%l1 = dd1bea3612c9f19d, immed = 0000000e, %l7 = 0000000000000001
	srl	%l1,0x00e,%l7		! %l7 = 0000000000004b27
	fbn,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 8fdf75c87e878f44, Mem[0000000032000029] = 04cd02e2
	stb	%l0,[%o4+0x029]		! Mem[0000000032000028] = 44cd02e2
p0_b104:

p0_label_100:
	membar	#Sync			! Added by membar checker (87)
!	%l7 = 0000000000004b27, %l7 = 0000000000004b27, %l1 = dd1bea3612c9f19d
	srax	%l7,%l7,%l1		! %l1 = 0000000000000000
!	Mem[0000000031800008] = 0000006c, %l7 = 0000000000004b27
	swap	[%o3+0x008],%l7		! %l7 = 000000000000006c
!	Mem[0000000011000008] = 0000009c 8fdf76dd, %l6 = 03e48400, %l7 = 0000006c
	ldda	[%i2+0x008]%asi,%l6	! %l6 = 000000000000009c 000000008fdf76dd
!	%l4 = 0000000000000000, immed = 00000519, %y  = 8fdf75c8
	sdivx	%l4,0x519,%l5		! %l5 = 0000000000000000
	bleu	p0_b105			! Branch Taken, %ccr = 44, CWP = 0

p0_label_101:
!	%l7 = 000000008fdf76dd, Mem[0000000012800010] = 56f03d1e
	stb	%l7,[%i5+0x010]		! Mem[0000000012800010] = ddf03d1e
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x069,%g2
p0_b105:
	bpos	p0_b106			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000032000040] = 00000000 00000004 061a0e3b 04890029
	prefetch [%o4+0x040],21
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x06a,%g2
p0_b106:
	membar	#Sync			! Added by membar checker (88)
!	Mem[0000000031800041] = 4de900ff, %l6 = 000000000000009c
	ldstuba	[%o3+0x041]%asi,%l6	! %l6 = 00000000000000e9

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba,a	p0_branch_failed
p0_not_taken_0_end:

!	Mem[0000000010000000] = 00000089, %l0 = 8fdf75c87e878f44
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_102:
!	Mem[00000000110000c0] = 360e1f54 da2f2ca1 ffffeb2a ffffffff
	prefetcha [%i2+0x0c0]%asi,23
!	Denormal Floating Point Operation Nullified
	nop
!	%l1 = 0000000000000000, Mem[0000000032000064] = 73787542
	sth	%l1,[%o4+0x064]		! Mem[0000000032000064] = 00007542
!	Mem[0000000011000050] = 3f269cc2, %l4 = 0000000000000000
	ldsh	[%i2+0x050],%l4		! %l4 = 0000000000003f26
	set	p0_b107,%o7
	fbge,pn	%fcc3,p0_near_0_le	! Branch Taken, %fcc3 = 2

p0_label_103:
!	%l6 = 00000000000000e9, Mem[0000000010800014] = e27c8139
	stw	%l6,[%i1+0x014]		! Mem[0000000010800014] = 000000e9
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x06b,%g2
p0_b107:
!	Registers modified during the branch to p0_near_0
!	%l0  = 0000000000000000
!	%l7  = 000000008fdf76dd
	membar	#Sync			! Added by membar checker (89)
	nop
	bvc,a	p0_b108			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000032000000] = 237580e8 c2bb115b 19d8e6f6 7b393a14
	prefetch [%o4+0x000],23
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x06c,%g2
p0_b108:
	membar	#Sync			! Added by membar checker (90)
	set	p0_b109,%o7
	fba,pn	%fcc0,p0_near_2_le	! Branch Taken, %fcc0 = 0

p0_label_104:
!	%l2 = 0000000000000000, Mem[0000000011800008] = fffffe14
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = 0000fe14
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x06d,%g2
p0_b109:
!	Registers modified during the branch to p0_near_2
!	%l2  = 0000000000000000
!	%l6  = 1aed703e667eddd0
	bpos,a	p0_b110			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[00000000108000cc] = cb82057f, %l0 = 0000000000000000
	ldsb	[%i1+0x0cc],%l0		! %l0 = ffffffffffffffcb
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x06e,%g2
p0_b110:
	membar	#Sync			! Added by membar checker (91)
!	Mem[0000000011800000] = f63dfd8e, %l4 = 0000000000003f26
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000f6
!	%l4 = 00000000000000f6, Mem[0000000031000008] = ffffff47
	stb	%l4,[%o2+0x008]		! Mem[0000000031000008] = f6ffff47

p0_label_105:
!	%f10 = ffffff20, %f16 = ffffffff
	fmovs	%f10,%f16		! %f16 = ffffff20
!	Branch On Register, %l6 = 1aed703e667eddd0
	brlez,a,pn %l6,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000011000008] = 0000009c, %l7 = 000000008fdf76dd
	ldswa	[%i2+%o6]0x80,%l7	! Annulled
p0_b111:
	membar	#Sync			! Added by membar checker (92)
!	%f12 = 5a758dc3, %f17 = 99f51080
	fcmps	%fcc1,%f12,%f17		! %fcc1 = 2
!	%f10 = ffffff20 772db874, %f12 = 5a758dc3 a7914059
	fabsd	%f10,%f12		! %f12 = 7fffff20 772db874

p0_label_106:
!	Mem[0000000010800008] = 89230000, %l6 = 1aed703e667eddd0
	swapa	[%i1+%o6]0x80,%l6	! %l6 = 0000000089230000
!	%l4 = 00000000000000f6, immed = fffff0cf, %l4 = 00000000000000f6
	andn	%l4,-0xf31,%l4		! %l4 = 0000000000000030
!	Mem[0000000011800008] = 0000fe14 8e70eb48, %l6 = 89230000, %l7 = 8fdf76dd
	ldda	[%i3+%o6]0x80,%l6	! %l6 = 000000000000fe14 000000008e70eb48
!	%l0 = ffffffffffffffcb, %l0 = ffffffffffffffcb, %l0 = ffffffffffffffcb
	addc	%l0,%l0,%l0		! %l0 = ffffffffffffff96
!	Mem[0000000030000008] = 00000190018a0090, %l1 = 0000000000000000
	ldxa	[%o0+0x008]%asi,%l1	! %l1 = 00000190018a0090

p0_label_107:
!	%l2 = 0000000000000000, Mem[000000001080001c] = 57d7472d
	stba	%l2,[%i1+0x01c]%asi	! Mem[000000001080001c] = 00d7472d
!	%f8  = 41ddcb6e 1d000000, %f16 = ffffff20
	fdtoi	%f8 ,%f16		! %f16 = 772db874
	bvc,a	p0_b112			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[00000000110000a0] = 6307e9be 64a79ecf fa15ce90 ffff96cc
	prefetch [%i2+0x0a0],4
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x070,%g2
p0_b112:
	membar	#Sync			! Added by membar checker (93)
!	%l0 = ffffffffffffff96, Mem[0000000011800008] = 0000fe14
	stha	%l0,[%i3+%o6]0x80	! Mem[0000000011800008] = ff96fe14

p0_label_108:
	bpos	p0_b113			! Branch Taken, %ccr = 44, CWP = 0
!	%l7 = 000000008e70eb48, Mem[0000000032000040] = 0000000000000004
	stx	%l7,[%o4+0x040]		! Mem[0000000032000040] = 000000008e70eb48
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x071,%g2
p0_b113:
	membar	#Sync			! Added by membar checker (94)
!	%l1 = 00000190018a0090, immed = ffffff6a, %l2 = 0000000000000000
	andn	%l1,-0x096,%l2		! %l2 = 0000000000000090
	set	p0_b114,%o7
	fble,a	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800000] = ffb8d694 296d9635 667eddd0 0bd1d2e9
	prefetch [%i1+0x000],4
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x072,%g2
p0_b114:

p0_label_109:
	membar	#Sync			! Added by membar checker (95)
!	Mem[0000000011800040] = ab4829c8 293c45be 7c99292c c06347c6
	prefetcha [%i3+0x040]%asi,0
!	Mem[0000000010800000] = ffb8d694 296d9635, %l6 = 0000fe14, %l7 = 8e70eb48
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffb8d694 00000000296d9635
!	%l7 = 00000000296d9635, Mem[00000000108000f8] = 52d1b1b32caa734c
	stxa	%l7,[%i1+0x0f8]%asi	! Mem[00000000108000f8] = 00000000296d9635
!	Mem[0000000011800060] = e880fedf, %l4 = 0000000000000030
	ldsh	[%i3+0x060],%l4		! %l4 = ffffffffffffe880
!	%l7 = 00000000296d9635, %l3 = 0000000000000000, %l3 = 0000000000000000
	srax	%l7,%l3,%l3		! %l3 = 00000000296d9635

p0_label_110:
!	Mem[0000000011800000] = f63dfd8e, %l4 = ffffffffffffe880
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000f6
!	%f22 = f72db874, %f19 = 27914059
	fcmps	%fcc2,%f22,%f19		! %fcc2 = 1
!	%f28 = 99f51080 aa6385ad, %f28 = 99f51080 aa6385ad, %f20 = 07d95717 2a6385ad
	faddd	%f28,%f28,%f20		! %f20 = 9a051080 aa6385ad
	ba,a	p0_b115			! Branch Taken, %ccr = 44, CWP = 0
!	%l5 = 0000000000000000, Mem[0000000010800008] = 667eddd0
	stwa	%l5,[%i1+%o6]0x80	! Annulled
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x073,%g2
p0_b115:

p0_label_111:
	membar	#Sync			! Added by membar checker (96)
!	%f2  = ffffff20 772db874, %f14 = 0001e78d 3c000000
	fxtod	%f2 ,%f14		! %f14 = c26bf11a 48f18000
!	%l2 = 0000000000000090, Mem[00000000110000e8] = 1aed703e
	stwa	%l2,[%i2+0x0e8]%asi	! Mem[00000000110000e8] = 00000090
!	%l7 = 00000000296d9635, immed = fffff1b9, %l7 = 00000000296d9635
	and	%l7,-0xe47,%l7		! %l7 = 00000000296d9031
!	Mem[00000000108000c0] = 3f474d42 279a4243 cbf8fd3a cb82057f
	prefetch [%i1+0x0c0],23
!	%l0 = ffffffffffffff96, Mem[0000000031000008] = f6ffff47341521f7
	stxa	%l0,[%o2+0x008]%asi	! Mem[0000000031000008] = ffffffffffffff96

p0_label_112:
!	%l7 = 00000000296d9031, immed = 0000003e, %l2 = 0000000000000090
	srax	%l7,0x03e,%l2		! %l2 = 0000000000000000
!	%l6 = 00000000ffb8d694, immed = 000008a5, %l4 = 00000000000000f6
	or	%l6,0x8a5,%l4		! %l4 = 00000000ffb8deb5
!	Mem[0000000011800000] = f63dfd8e, %l7 = 00000000296d9031
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000f63d
!	Mem[0000000011800000] = f63dfd8e 8fabb5a3 ff96fe14 8e70eb48
	prefetch [%i3+0x000],22
	fbule,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2

p0_label_113:
!	Mem[0000000010800060] = 85f0c657, %l2 = 0000000000000000
	lduw	[%i1+0x060],%l2		! Annulled
p0_b116:
	bcc	p0_b117			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000013000008] = 6cf1d2ff ca61f1bc, %l6 = ffb8d694, %l7 = 0000f63d
	ldd	[%i6+0x008],%l6		! %l6 = 000000006cf1d2ff 00000000ca61f1bc
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x075,%g2
p0_b117:
	membar	#Sync			! Added by membar checker (97)
!	%l6 = 000000006cf1d2ff, %l1 = 00000190018a0090, %y  = 00000000
	sdivx	%l6,%l1,%l6		! %l6 = 0000000000000000
!	Mem[0000000010800008] = 667eddd0, %l2 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l2	! %l2 = 00000000667eddd0

p0_label_114:
!	%l6 = 0000000000000000, immed = 00000164, %l0 = ffffffffffffff96
	subc	%l6,0x164,%l0		! %l0 = fffffffffffffe9c
!	%l6 = 0000000000000000, %l3 = 00000000296d9635, %l2 = 00000000667eddd0
	xorcc	%l6,%l3,%l2		! %l2 = 00000000296d9635, %ccr = 00
	set	p0_b118,%o7
	fbo,pt	%fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 2
!	%l6 = 0000000000000000, Mem[0000000011800008] = ff96fe14
	stha	%l6,[%i3+%o6]0x80	! Mem[0000000011800008] = 0000fe14
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x076,%g2
p0_b118:
!	Registers modified during the branch to p0_near_2
!	%l0  = ca61e78d8895b9c4
!	%l2  = 0000000027a075d6
!	%l3  = fffffffffffffd01
!	%l6  = 00000000ffb8e225
!	%l7  = 000000000000006c
	membar	#Sync			! Added by membar checker (98)
!	%f30 = 99815ad7 003e8115, %f2  = ffffff20 772db874, %f20 = 9a051080 aa6385ad
	fdivd	%f30,%f2 ,%f20		! %f20 = ffffff20 772db874

p0_label_115:
!	%l5 = 0000000000000000, Mem[0000000030800040] = 51ac99f9
	sth	%l5,[%o1+0x040]		! Mem[0000000030800040] = 000099f9
!	%l7 = 000000000000006c, Mem[0000000032000016] = bbff2d31
	stha	%l7,[%o4+0x016]%asi	! Mem[0000000032000014] = 006c2d31
!	%l2 = 0000000027a075d6, %l7 = 000000000000006c, %y  = ca61e78d
	sdivcc	%l2,%l7,%l7		! %l7 = ffffffff80000000, %ccr = 8a
!	%l7 = ffffffff80000000, Mem[0000000011000008] = 0000009c
	stwa	%l7,[%i2+%o6]0x80	! Mem[0000000011000008] = 80000000
	set	p0_b119,%o7
	fbo	p0_far_0_he	! Branch Taken, %fcc0 = 0

p0_label_116:
!	Mem[0000000011000038] = 76d68fd5c895be88, %l0 = ca61e78d8895b9c4
	ldx	[%i2+0x038],%l0		! %l0 = 76d68fd5c895be88
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x077,%g2
p0_b119:
!	Registers modified during the branch to p0_far_0
!	%l3  = fffffffffffffac4
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (99)
!	%l5 = 0000000000000000, %l7 = ffffffff80000000, %l0 = 76d68fd5c895be88
	orcc	%l5,%l7,%l0		! %l0 = ffffffff80000000, %ccr = 88
!	Mem[0000000031000008] = ffffffff, %l5 = 0000000000000000
	ldswa	[%o2+0x008]%asi,%l5	! %l5 = ffffffffffffffff
!	%l5 = ffffffffffffffff, %l3 = fffffffffffffac4, %l7 = ffffffff80000000
	addccc	%l5,%l3,%l7		! %l7 = fffffffffffffac3, %ccr = 99
!	%l5 = ffffffffffffffff, Mem[0000000011000000] = ff8e45ee8e70eb48
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000011000000] = ffffffffffffffff

p0_label_117:
!	%f20 = ffffff20 772db874, %f2  = ffffff20 772db874
	fabsd	%f20,%f2 		! %f2  = 7fffff20 772db874
!	%l5 = ffffffffffffffff, %l2 = 0000000027a075d6, %y  = ca61e78d
	smulcc	%l5,%l2,%l5		! %l5 = ffffffffd85f8a2a, %ccr = 88
!	%l2 = 0000000027a075d6, %l1 = 00000190018a0090, %y  = ffffffff
	mulx	%l2,%l1,%l3		! %l3 = eaf51b6ba59e4860
!	%l6 = 0000000000000000, immed = fffffdb8, %l4 = 00000000ffb8deb5
	subc	%l6,-0x248,%l4		! %l4 = 0000000000000248
!	%l0 = ffffffff80000000, immed = 00000006, %l6 = 0000000000000000
	srlx	%l0,0x006,%l6		! %l6 = 03fffffffe000000

p0_label_118:
!	%f16 = 772db874 99f51080, %f16 = 772db874 99f51080, %f30 = 99815ad7 003e8115
	faddd	%f16,%f16,%f30		! %f30 = 773db874 99f51080
	bcc	p0_b120			! Branch Taken, %ccr = 88, CWP = 0
!	%l3 = eaf51b6ba59e4860, Mem[000000003100004c] = 0000008d
	stb	%l3,[%o2+0x04c]		! Mem[000000003100004c] = 6000008d
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x078,%g2
p0_b120:
	membar	#Sync			! Added by membar checker (100)
!	%f27 = 7fffffff, %f12 = 7fffff20
	fabss	%f27,%f12		! %f12 = 7fffffff
!	%f14 = c26bf11a 48f18000, %f8  = 41ddcb6e 1d000000, %f18 = 7fffff20 27914059
	fsubd	%f14,%f8 ,%f18		! %f18 = c26c0000 00000000

p0_label_119:
!	%f8  = 41ddcb6e 1d000000, %f2  = 7fffff20
	fdtoi	%f8 ,%f2 		! %f2  = 772db874
!	%l4 = 0000000000000248, %l5 = ffffffffd85f8a2a, %l3 = eaf51b6ba59e4860
	taddcc	%l4,%l5,%l3		! %l3 = ffffffffd85f8c72, %ccr = 8a
!	Mem[0000000010800000] = ffb8d694, %l6 = 03fffffffe000000
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffb8d694
!	%l4 = 0000000000000248, %l1 = 00000190018a0090, %y  = ffffffff
	udivcc	%l4,%l1,%l7		! %l7 = 00000000ffffffff, %ccr = 0a
!	%l7 = 00000000ffffffff, immed = 000006d7, %y  = ffffffff
	udivcc	%l7,0x6d7,%l5		! %l5 = 00000000ffffffff, %ccr = 0a

p0_label_120:
!	Mem[0000000010800000] = ffb8d694, %l4 = 0000000000000248
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffb8d694
!	Mem[0000000011000040] = 95cf4ce4 ac36718b, %l4 = ffb8d694, %l5 = ffffffff
	ldd	[%i2+0x040],%l4		! %l4 = 0000000095cf4ce4 00000000ac36718b
!	%l0 = ffffffff80000000, immed = 00000e93, %l5 = 00000000ac36718b
	taddcc	%l0,0xe93,%l5		! %l5 = ffffffff80000e93, %ccr = 8a
!	%l7 = 00000000ffffffff, Mem[0000000030800008] = 6bb8d69400000004
	stxa	%l7,[%o1+0x008]%asi	! Mem[0000000030800008] = 00000000ffffffff
!	%f6  = ffffffff ffffff20, %f28 = 99f51080
	fxtos	%f6 ,%f28		! %f28 = c3600000

p0_label_121:
!	%f18 = c26c0000 00000000, %f16 = 772db874 99f51080
	fmovd	%f18,%f16		! %f16 = c26c0000 00000000
!	Mem[00000000100000c0] = 4898aacc f03f3ee1, %l6 = ffb8d694, %l7 = ffffffff
	ldda	[%i0+0x0c0]%asi,%l6	! %l6 = 000000004898aacc 00000000f03f3ee1
!	%f22 = f72db874 c2e19a26, %f18 = c26c0000 00000000
	fmovd	%f22,%f18		! %f18 = f72db874 c2e19a26
!	Mem[000000003080004c] = 00000000, %l5 = ffffffff80000e93
	ldsh	[%o1+0x04c],%l5		! %l5 = 0000000000000000
!	%l5 = 0000000000000000, immed = 00000013, %l7 = 00000000f03f3ee1
	sll	%l5,0x013,%l7		! %l7 = 0000000000000000

p0_label_122:
!	%f6  = ffffffff ffffff20, %f4  = 00000000
	fxtos	%f6 ,%f4 		! %f4  = c3600000
!	%l1 = 00000190018a0090, immed = fffff292, %y  = ffffffff
	udiv	%l1,-0xd6e,%l6		! %l6 = 00000000ffffffff
!	Mem[00000000110000d0] = 0000337b, %l0 = ffffffff80000000
	ldsh	[%i2+0x0d2],%l0		! %l0 = 000000000000337b
	fbule,a,pn %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000003100000c] = ffffff96, %l6 = 00000000ffffffff
	swap	[%o2+0x00c],%l6		! Annulled
p0_b121:

p0_label_123:
	membar	#Sync			! Added by membar checker (101)
!	Mem[0000000011000004] = ffffffff, %l2 = 0000000027a075d6
	ldstuba	[%i2+0x004]%asi,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff
	sethi	%hi(0x8235ac00),%l2	! %l2 = 000000008235ac00
!	%l5 = 0000000000000000, immed = 00000151, %l6 = 00000000ffffffff
	subc	%l5,0x151,%l6		! %l6 = fffffffffffffeaf
!	Branch On Register, %l3 = ffffffffd85f8c72
	brgz,pn	%l3,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000011800000] = f63dfd8e8fabb5a3, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = f63dfd8e8fabb5a3
p0_b122:

p0_label_124:
	membar	#Sync			! Added by membar checker (102)
!	Mem[0000000012000000] = 80e13caf, %l1 = 00000190018a0090
	ldswa	[%i4+%g0]0x80,%l1	! %l1 = ffffffff80e13caf
!	%f0  = c3600000, %f25 = 772db874
	fstoi	%f0 ,%f25		! %f25 = ffffff20
!	%l2 = 000000008235ac00, immed = 00000cfc, %l4 = 0000000095cf4ce4
	tsubcc	%l2,0xcfc,%l4		! %l4 = 0000000082359f04, %ccr = 08
	bg	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[00000000118000c0] = a194fd2e d844d2d6 869c6e8f d5429d30
	prefetch [%i3+0x0c0],4
p0_b123:

p0_label_125:
!	call to call_2, CWP = 0
	call	p0_call_2_he
!	Mem[0000000010800008] = 667eddd0, %l4 = 0000000082359f04
	lduwa	[%i1+%o6]0x80,%l4	! %l4 = 00000000667eddd0
!	Registers modified during the branch to p0_call_2
!	%l3  = 00000000a9d61f8e
	membar	#Sync			! Added by membar checker (103)
!	Mem[00000000108000b0] = 5e4e1005a07b3116, %l7 = 0000000000000000
	ldx	[%i1+0x0b0],%l7		! %l7 = 5e4e1005a07b3116
!	Mem[0000000011000008] = 80000000, %l3 = 00000000a9d61f8e
	ldstuba	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000080
	ble	p0_b124			! Branch Taken, %ccr = 08, CWP = 0

p0_label_126:
!	Mem[0000000010000008] = 0000006c, %l5 = f63dfd8e8fabb5a3
	swapa	[%i0+%o6]0x80,%l5	! %l5 = 000000000000006c
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x07c,%g2
p0_b124:
	membar	#Sync			! Added by membar checker (104)
!	%l5 = 000000000000006c, immed = 0000001f, %l3 = 0000000000000080
	srl	%l5,0x01f,%l3		! %l3 = 0000000000000000
!	%l6 = fffffffffffffeaf, %l7 = 5e4e1005a07b3116, %l1 = ffffffff80e13caf
	orncc	%l6,%l7,%l1		! %l1 = fffffffffffffeef, %ccr = 88
	bleu	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000010000008] = 8fabb5a3 509695ef, %l6 = fffffeaf, %l7 = a07b3116
	ldda	[%i0+%o6]0x80,%l6	! %l6 = 000000008fabb5a3 00000000509695ef
p0_b125:

p0_label_127:
	membar	#Sync			! Added by membar checker (105)
!	%l4 = 00000000667eddd0, %l3 = 0000000000000000, %l1 = fffffffffffffeef
	addcc	%l4,%l3,%l1		! %l1 = 00000000667eddd0, %ccr = 00
!	Mem[0000000031800040] = 4dff00ff, %l0 = 000000000000337b
	lduh	[%o3+0x042],%l0		! %l0 = 00000000000000ff
	fbg,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000030000048] = 2c8f3ec7, %l0 = 00000000000000ff
	ldsw	[%o0+0x048],%l0		! Annulled
p0_b126:
	membar	#Sync			! Added by membar checker (106)
!	Mem[0000000010000080] = f504f1e0 27a075d6
	flush	%i0+0x080

p0_label_128:
!	%l1 = 00000000667eddd0, immed = 00000315, %l1 = 00000000667eddd0
	subc	%l1,0x315,%l1		! %l1 = 00000000667edabb
	set	p0_b127,%o7
	fbne,pt	%fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000032000060] = fc000075, %l6 = 000000008fabb5a3
	ldub	[%o4+0x063],%g2		! %g2 = 00000000000000fc
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x07f,%g2
p0_b127:
!	Registers modified during the branch to p0_near_1
!	%l0  = 0000000000000000
!	%l2  = fffffffffff93188
!	%l4  = fffffffffffff7df
!	%l7  = 0000000000ccfdb5
	membar	#Sync			! Added by membar checker (107)
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d44cd02 e27389fa
	prefetch [%o4+0x020],4
!	%l3 = 0000000000000000, immed = 0000002c, %l3 = 0000000000000000
	srlx	%l3,0x02c,%l3		! %l3 = 0000000000000000

p0_label_129:
	set	p0_b128,%o7
	fbule,a	p0_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000108000c0] = 3f474d42 279a4243 cbf8fd3a cb82057f
	prefetch [%i1+0x0c0],22
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x080,%g2
p0_b128:
!	Registers modified during the branch to p0_far_0
!	%l3  = fffffffffffffaa8
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (108)
!	%f30 = 773db874, %f9  = 1d000000, %f10 = ffffff20
	fmuls	%f30,%f9 ,%f10		! %f10 = 54bdb874
!	Mem[0000000030000000] = 8c54adf0476ff8d3, %l6 = 0000000000000000
	ldxa	[%o0+0x000]%asi,%l6	! %l6 = 8c54adf0476ff8d3
	bpos	p0_b129			! Branch Taken, %ccr = 44, CWP = 0

p0_label_130:
!	Mem[0000000011800000] = f63dfd8e, %l0 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000f6
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x081,%g2
p0_b129:
	membar	#Sync			! Added by membar checker (109)
!	%f4  = c3600000 d665656b, %f2  = 772db874 772db874
	fabsd	%f4 ,%f2 		! %f2  = 43600000 d665656b
!	%f6  = ffffffff ffffff20, %f20 = ffffff20 772db874
	fxtod	%f6 ,%f20		! %f20 = c06c0000 00000000
!	%l4 = fffff7df, %l5 = 0000006c, Mem[00000000108000a0] = abf5ea84 cb15b845
	std	%l4,[%i1+0x0a0]	! Mem[00000000108000a0] = fffff7df 0000006c
	fbug,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_131:
!	Mem[0000000011800054] = 2b895b39, %l4 = fffffffffffff7df
	ldub	[%i3+0x054],%l4		! Annulled
p0_b130:
	membar	#Sync			! Added by membar checker (110)
!	Mem[0000000030800048] = 00000000, %l1 = 667edabb, %l3 = fffffaa8
	add	%o1,0x48,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000000000000
!	Mem[0000000031800000] = 365ddc8541808382, %l1 = 00000000667edabb
	ldx	[%o3+0x000],%l1		! %l1 = 365ddc8541808382
!	%l7 = 0000000000ccfdb5, %l4 = fffffffffffff7df, %l4 = fffffffffffff7df
	sll	%l7,%l4,%l4		! %l4 = 00667eda80000000
!	%l0 = 00000000000000f6, immed = 00000c09, %l4 = 00667eda80000000
	xnorcc	%l0,0xc09,%l4		! %l4 = fffffffffffff300, %ccr = 88

p0_label_132:
	set	p0_b131,%o7
	fbne,a,pn %fcc1,p0_near_2_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000032000060] = 2432adfc, %l1 = 365ddc8541808382
	ldsh	[%o4+0x060],%g2		! %g2 = 0000000000002432
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x083,%g2
p0_b131:
!	Registers modified during the branch to p0_near_2
!	%l2  = 365ddc85418751fa
!	%l6  = 00000090667eddd0
	membar	#Sync			! Added by membar checker (111)
!	%f2  = 43600000, %f4  = c3600000 d665656b
	fstox	%f2 ,%f4 		! %f4  = 00000000 000000e0
	set	p0_b132,%o7
	fbo,pn	%fcc1,p0_near_2_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000030800000] = 0b23b5a3 ffd8e6f6, %l0 = 000000f6, %l1 = 41808382
	ldd	[%o1+0x000],%l0		! %l0 = 000000000b23b5a3 00000000ffd8e6f6
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x084,%g2
p0_b132:
!	Registers modified during the branch to p0_near_2
!	%l2  = c9a2237bbe5194fb
!	%l6  = 00000090667eddd0

p0_label_133:
	membar	#Sync			! Added by membar checker (112)
!	Mem[000000003100004c] = 6000008d, %l1 = 00000000ffd8e6f6
	lduba	[%o2+0x04c]%asi,%l1	! %l1 = 0000000000000060
	set	p0_b133,%o7
	fbue,a,pt %fcc0,p0_near_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000000] = 237580e8 c2bb115b 19d8e6f6 7b393a14
	prefetch [%o4+0x000],3
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x085,%g2
p0_b133:
!	Registers modified during the branch to p0_near_2
!	%l0  = 00ccfdaaaff087eb
!	%l2  = 0000000027a075d6
!	%l3  = fffffffffffffd6d
!	%l6  = fffffffffffff99a
!	%l7  = 00000000ca61f1bc
	membar	#Sync			! Added by membar checker (113)
!	%l7 = 00000000ca61f1bc, Mem[00000000100000d4] = b100f364
	stwa	%l7,[%i0+0x0d4]%asi	! Mem[00000000100000d4] = ca61f1bc
	set	p0_b134,%o7
	fba	p0_far_1_he	! Branch Taken, %fcc0 = 0

p0_label_134:
!	Mem[0000000011800008] = 0000fe14, %l0 = 00ccfdaaaff087eb
	swapa	[%i3+%o6]0x80,%l0	! %l0 = 000000000000fe14
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x086,%g2
p0_b134:
	membar	#Sync			! Added by membar checker (114)
!	%l5 = 000000000000006c, Mem[0000000011800044] = 293c45be
	stba	%l5,[%i3+0x044]%asi	! Mem[0000000011800044] = 6c3c45be
	bpos,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000032000060] = 2432adfc 00007542 036269f7 f75fc675
	prefetch [%o4+0x060],1	! Annulled
p0_b135:
	membar	#Sync			! Added by membar checker (115)
!	Mem[0000000031000004] = 00002219, %l2 = 27a075d6, %l0 = 0000fe14
	add	%o2,0x04,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 0000000000002219

p0_label_135:
	bpos	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011800000] = f63dfd8e, %l1 = 0000000000000060
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000f6
p0_b136:
	bneg	p0_b137			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000011000000] = ffffffff, %l7 = 00000000ca61f1bc
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x089,%g2
p0_b137:
	membar	#Sync			! Added by membar checker (116)
!	Mem[00000000118000e0] = 48b63aec 7006db94 fb797efd 75341c90
	prefetcha [%i3+0x0e0]%asi,0

p0_label_136:
!	%f3  = d665656b, %f27 = 7fffffff, %f11 = 772db874
	fdivs	%f3 ,%f27,%f11		! %f11 = 7fffffff
!	%l3 = fffffffffffffd6d, %l7 = ffffffffffffffff, %l3 = fffffffffffffd6d
	addcc	%l3,%l7,%l3		! %l3 = fffffffffffffd6c, %ccr = 99
!	Mem[0000000031800048] = 00000000, %l4 = fffffffffffff300
	ldsha	[%o3+0x048]%asi,%l4	! %l4 = 0000000000000000
	bcc	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	%l7 = ffffffffffffffff, Mem[0000000032000010] = 8f2e0000be45006c
	stx	%l7,[%o4+0x010]		! Mem[0000000032000010] = ffffffffffffffff
p0_b138:

p0_label_137:
	membar	#Sync			! Added by membar checker (117)
	fble,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000031000008] = ffffffff, %l2 = 0000000027a075d6
	ldub	[%o2+0x00b],%l2		! %l2 = 00000000000000ff
p0_b139:
	membar	#Sync			! Added by membar checker (118)
!	%l7 = ffffffffffffffff, immed = fffff84e, %y  = 00ccfdaa
	umulcc	%l7,-0x7b2,%l2		! %l2 = fffff84d000007b2, %ccr = 80
!	Mem[0000000010000080] = f504f1e0 27a075d6 77fdf5a0 000bfe48
	prefetch [%i0+0x080],4
!	Mem[000000003000000c] = 018a0090, %l5 = 000000000000006c
	ldsw	[%o0+0x00c],%l5		! %l5 = 00000000018a0090

p0_label_138:
!	%l0 = 0000000000002219, immed = 00000b7c, %y  = fffff84d
	udiv	%l0,0xb7c,%l1		! %l1 = 00000000ffffffff
	fbe,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000011000000] = ffffffff, %l2 = fffff84d000007b2
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000ff
p0_b140:
	membar	#Sync			! Added by membar checker (119)
!	Mem[0000000031800000] = 365ddc85, %l4 = 0000000000000000
	swapa	[%o3+0x000]%asi,%l4	! %l4 = 00000000365ddc85
	set	p0_b141,%o7
	fbo,a	p0_far_3_le	! Branch Taken, %fcc0 = 0

p0_label_139:
!	Mem[0000000030000004] = 476ff8d3, %l3 = fffffffffffffd6c
	ldsw	[%o0+0x004],%l3		! %l3 = 00000000476ff8d3
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x08d,%g2
p0_b141:
!	Registers modified during the branch to p0_far_3
!	%l0  = 00000000ffffffff
!	%l1  = 00000000d53dc716
!	%l4  = 00000000018a0080
!	%l6  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (120)
!	%f14 = c26bf11a 48f18000, %f18 = f72db874 c2e19a26
	fcmpd	%fcc2,%f14,%f18		! %fcc2 = 2
!	%f8  = 41ddcb6e, %f19 = c2e19a26
	fabss	%f8 ,%f19		! %f19 = 41ddcb6e
!	Mem[0000000011000000] = ffffffffffffffff, %l4 = 00000000018a0080
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	%l0 = 00000000ffffffff, %l2 = 00000000000000ff, %l2 = 00000000000000ff
	subccc	%l0,%l2,%l2		! %l2 = 00000000ffffff00, %ccr = 08

p0_label_140:
!	%l4 = ffffffffffffffff, %l0 = 00000000ffffffff, %l2 = 00000000ffffff00
	orn	%l4,%l0,%l2		! %l2 = ffffffffffffffff
	ble,a	p0_b142			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000031800040] = 4dff00ff, %l5 = 00000000018a0090
	ldub	[%o3+0x040],%l5		! %l5 = 000000000000004d
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x08e,%g2
p0_b142:
	membar	#Sync			! Added by membar checker (121)
!	Mem[0000000010800084] = 93df3494, %l2 = ffffffffffffffff
	lduba	[%i1+0x087]%asi,%l2	! %l2 = 0000000000000094
!	Jump to jmpl_3, CWP = 0
	set	p0_jmpl_3_le,%g1
	jmpl	%g1,%g6

p0_label_141:
!	%l0 = ffffffff, %l1 = d53dc716, Mem[0000000010800008] = 667eddd0 0bd1d2e9
	stda	%l0,[%i1+%o6]0x80	! Mem[0000000010800008] = ffffffff d53dc716
!	Registers modified during the branch to p0_jmpl_3
!	%l1  = fffffffffffff4d5
!	%l2  = 00000000000008ed
!	%l3 = 00000000476ff8d3, %l7 = ffffffffffffffff, %l4 = ffffffffffffffff
	xor	%l3,%l7,%l4		! %l4 = ffffffffb890072c
!	%l4 = ffffffffb890072c, %l5 = 000000000000004d, %y  = fffff84d
	smul	%l4,%l5,%l6		! %l6 = ffffffea8352283c
	fbe,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000011000000] = ffffffff, %l3 = 00000000476ff8d3
	lduba	[%i2+%g0]0x80,%l3	! Annulled
p0_b143:

p0_label_142:
	membar	#Sync			! Added by membar checker (122)
!	Mem[0000000032000034] = 361df69e, %l2 = 00000000000008ed
	lduba	[%o4+0x036]%asi,%g2	! %g2 = 0000000000000036
!	%f28 = c3600000 aa6385ad, %f6  = ffffffff ffffff20, %f26 = 57f3c69e 7fffffff
	fdivd	%f28,%f6 ,%f26		! %f26 = ffffffff ffffff20
	bge	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000010000000] = 00000089 000000d2 8fabb5a3 509695ef
	prefetch [%i0+0x000],2
p0_b144:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_143:
!	Mem[0000000010800008] = ffffffff d53dc716, %l2 = 000008ed, %l3 = 476ff8d3
	ldda	[%i1+%o6]0x80,%l2	! %l2 = 00000000ffffffff 00000000d53dc716
p0_b145:
	membar	#Sync			! Added by membar checker (123)
!	%l7 = ffffffffffffffff, %l4 = ffffffffb890072c, %y  = ffffffea
	smul	%l7,%l4,%l3		! %l3 = 00000000476ff8d4
	set	p0_b146,%o7
	fble	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	%l3 = 00000000476ff8d4, Mem[0000000030000048] = 2c8f3ec76dd915c6
	stx	%l3,[%o0+0x048]		! Mem[0000000030000048] = 00000000476ff8d4
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x092,%g2
p0_b146:
	membar	#Sync			! Added by membar checker (124)
!	Mem[0000000010800028] = 757dccc4, %l5 = 000000000000004d
	ldswa	[%i1+0x028]%asi,%l5	! %l5 = 00000000757dccc4

p0_label_144:
!	%l2 = 00000000ffffffff, Mem[0000000031000048] = fffff63d
	stha	%l2,[%o2+0x048]%asi	! Mem[0000000031000048] = fffff63d
	fbl,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000031800000] = 00000000, %l2 = 00000000ffffffff
	ldsw	[%o3+0x000],%l2		! %l2 = 0000000000000000
p0_b147:
	set	p0_b148,%o7
	fbule	p0_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800008] = 00004b27, %l4 = ffffffffb890072c
	swap	[%o3+0x008],%l4		! %l4 = 0000000000004b27
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x094,%g2
p0_b148:
!	Registers modified during the branch to p0_far_0
!	%l3  = ffffffff8a823600
!	%l6  = 0000000000000000

p0_label_145:
	membar	#Sync			! Added by membar checker (125)
!	Mem[0000000010000048] = aca8da5a0520f1bc, %l5 = 00000000757dccc4
	ldx	[%i0+0x048],%l5		! %l5 = aca8da5a0520f1bc
!	%l1 = fffffffffffff4d5, %l3 = ffffffff8a823600, %l1 = fffffffffffff4d5
	andncc	%l1,%l3,%l1		! %l1 = 00000000757dc0d5, %ccr = 00
!	%f24 = c9b434bd, %f4  = 00000000, %f13 = 772db874
	fadds	%f24,%f4 ,%f13		! %f13 = c9b434bd
	set	p0_b149,%o7
	fbo,pn	%fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 2
!	Mem[0000000010000094] = 34a993b7, %l3 = ffffffff8a823600
	ldub	[%i0+0x095],%l3		! %l3 = 00000000000000a9
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x095,%g2
p0_b149:
!	Registers modified during the branch to p0_near_1
!	%l0  = 000000a8fffebb34
!	%l2  = 0000000000000000
!	%l4  = fffffffffffffbdf
!	%l7  = 0000000000eafb81

p0_label_146:
	membar	#Sync			! Added by membar checker (126)
!	%f21 = 00000000, %f21 = 00000000, %f27 = ffffff20
	fsubs	%f21,%f21,%f27		! %f27 = 00000000
	fbe,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l5 = aca8da5a0520f1bc, Mem[0000000032000014] = ffffffff
	stw	%l5,[%o4+0x014]		! Mem[0000000032000014] = 0520f1bc
p0_b150:
	membar	#Sync			! Added by membar checker (127)
!	%l2 = 0000000000000000, immed = 00000e0f, %l7 = 0000000000eafb81
	andcc	%l2,0xe0f,%l7		! %l7 = 0000000000000000, %ccr = 44
!	%l2 = 0000000000000000, immed = 00000e07, %l5 = aca8da5a0520f1bc
	xnor	%l2,0xe07,%l5		! %l5 = fffffffffffff1f8

p0_label_147:
!	%f1  = 87d95717, %f27 = 00000000, %f20 = c06c0000
	fadds	%f1 ,%f27,%f20		! %f20 = 87d95717
	fblg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000008] = ff000000, %l6 = 0000000000000000
	swapa	[%i2+%o6]0x80,%l6	! %l6 = 00000000ff000000
p0_b151:
	membar	#Sync			! Added by membar checker (128)
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000010800000] = ffb8d694 296d9635
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010800000] = ff000000 00000000
!	%f0  = c3600000 87d95717, %f0  = c3600000 87d95717, %f2  = 43600000 d665656b
	faddd	%f0 ,%f0 ,%f2 		! %f2  = c3700000 87d95717

p0_label_148:
!	%f26 = ffffffff 00000000, %f6  = ffffffff ffffff20
	fxtod	%f26,%f6 		! %f6  = c1f00000 00000000
!	%l3 = 00000000000000a9, %l6 = 00000000ff000000, %l3 = 00000000000000a9
	or	%l3,%l6,%l3		! %l3 = 00000000ff0000a9
!	Mem[0000000011800080] = 440c8f81 157101d6 599ae65a 38247509
	prefetcha [%i3+0x080]%asi,3
	bneg	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000011800008] = aff087eb, %l6 = 00000000ff000000
	ldstuba	[%i3+%o6]0x80,%l6	! %l6 = 00000000000000af
p0_b152:

p0_label_149:
	membar	#Sync			! Added by membar checker (129)
!	Mem[0000000010000000] = 00000089 000000d2 8fabb5a3 509695ef
	prefetcha [%i0+0x000]%asi,16
!	%f27 = 00000000, %f6  = c1f00000
	fmovs	%f27,%f6 		! %f6  = 00000000
!	%l1 = 00000000757dc0d5, immed = fffffcdd, %l1 = 00000000757dc0d5
	tsubcc	%l1,-0x323,%l1		! %l1 = 00000000757dc3f8, %ccr = 13
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 13
!	Mem[00000000128000c0] = 67d22639 849a7f78 e8ca9eff 09e951e6
	prefetch [%i5+0x0c0],21	! Annulled
p0_b153:

p0_label_150:
	membar	#Sync			! Added by membar checker (130)
!	Mem[0000000011800000] = f63dfd8e, %l2 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l2	! %l2 = fffffffff63dfd8e
!	Branch On Register, %l5 = fffffffffffff1f8
	brlez,a,pn %l5,p0_b154		! Branch Taken
!	%l5 = fffffffffffff1f8, Mem[00000000100000f6] = b2f382ea
	stb	%l5,[%i0+0x0f6]		! Mem[00000000100000f4] = b2f3f8ea
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x09a,%g2
p0_b154:
	membar	#Sync			! Added by membar checker (131)
	set	p0_b155,%o7
	fbuge,pt %fcc0,p0_near_2_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000110000c0] = 360e1f54 da2f2ca1 ffffeb2a ffffffff
	prefetch [%i2+0x0c0],0
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x09b,%g2
p0_b155:
!	Registers modified during the branch to p0_near_2
!	%l2  = 000000007f3fc669
!	%l6  = 00000090667eddd0

p0_label_151:
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	%l4 = fffffbdf, %l5 = fffff1f8, Mem[0000000030800040] = 000099f9 5a3722fa
	std	%l4,[%o1+0x040]	! Mem[0000000030800040] = fffffbdf fffff1f8
p0_b156:
	membar	#Sync			! Added by membar checker (132)
!	Mem[00000000118000a0] = 12d0e7fd c6f34d3d 33e94237 7e66b217
	prefetcha [%i3+0x0a0]%asi,1
	fbl	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800008] = ffffffff, %l1 = 00000000757dc3f8
	lduha	[%i1+%o6]0x80,%l1	! %l1 = 000000000000ffff
p0_b157:

p0_label_152:
	bg,a	p0_b158			! Branch Taken, %ccr = 11, CWP = 0
!	Mem[0000000032000038] = f69e7d05feabeda8, %l0 = 000000a8fffebb34
	ldx	[%o4+0x038],%g2		! %g2 = f69e7d05feabeda8
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x09e,%g2
p0_b158:
	membar	#Sync			! Added by membar checker (133)
!	Mem[0000000010000020] = 00000000 000bfe48 0a870df1 85710090
	prefetch [%i0+0x020],4
	fbul,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	%l1 = 000000000000ffff, Mem[0000000010800008] = ffffffffd53dc716
	stxa	%l1,[%i1+%o6]0x80	! Annulled
p0_b159:

p0_label_153:
	membar	#Sync			! Added by membar checker (134)
!	%l0 = 000000a8fffebb34, immed = fffff807, %l7 = 0000000000000000
	subc	%l0,-0x7f9,%l7		! %l7 = 000000a8fffec32c
!	%l0 = 000000a8fffebb34, immed = fffffae4, %y  = 000000a8
	smulcc	%l0,-0x51c,%l4		! %l4 = 00000000067b8250, %ccr = 00
!	%l3 = 00000000ff0000a9, %l7 = 000000a8fffec32c, %l2 = 000000007f3fc669
	andncc	%l3,%l7,%l2		! %l2 = 0000000000000081, %ccr = 00
	bne,a	p0_b160			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000010800000] = ff000000, %l5 = fffffffffffff1f8
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0a0,%g2
p0_b160:

p0_label_154:
	membar	#Sync			! Added by membar checker (135)
!	%l0 = 000000a8fffebb34, %l6 = 00000090667eddd0, %l3 = 00000000ff0000a9
	add	%l0,%l6,%l3		! %l3 = 00000139667d9904
!	Mem[000000003100000c] = ffffff96, %l5 = ffffffffffffffff
	ldsw	[%o2+0x00c],%l5		! %l5 = ffffffffffffff96
	set	p0_b161,%o7
	fble,pt	%fcc0,p0_near_1_le	! Branch Taken, %fcc0 = 0
!	%l0 = fffebb34, %l1 = 0000ffff, Mem[0000000030800048] = 00000000 476ff8d4
	std	%l0,[%o1+0x048]	! Mem[0000000030800048] = fffebb34 0000ffff
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0a1,%g2
p0_b161:
!	Registers modified during the branch to p0_near_1
!	%l0  = ffffffffffffffff
!	%l3  = 00000000000007f7
!	%l4  = fffffffffffff275
	membar	#Sync			! Added by membar checker (136)
!	Mem[0000000011800000] = f63dfd8e 8fabb5a3 fff087eb 8e70eb48
	prefetch [%i3+0x000],4

p0_label_155:
!	%l0 = ffffffffffffffff, %l2 = 0000000000000081, %l3 = 00000000000007f7
	sll	%l0,%l2,%l3		! %l3 = fffffffffffffffe
	fbn,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800040] = 56e0aaac c446715f 1ee24d64 69b79a56
	prefetch [%i1+0x040],1	! Annulled
p0_b162:
	ble,a	p0_b163			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010000008] = 8fabb5a3, %l4 = fffffffffffff275
	swapa	[%i0+%o6]0x80,%l4	! %l4 = 000000008fabb5a3
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x0a3,%g2
p0_b163:

p0_label_156:
	membar	#Sync			! Added by membar checker (137)
!	Mem[00000000108000e0] = a9ffc704 c78dbc23 37c675e2 183fe540
	prefetch [%i1+0x0e0],23
!	%f16 = c26c0000 00000000, %f6  = 00000000 00000000, %f10 = 54bdb874 7fffffff
	faddd	%f16,%f6 ,%f10		! %f10 = c26c0000 00000000
	bpos	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000010000008] = fffff275, %l4 = 000000008fabb5a3
	ldswa	[%i0+%o6]0x80,%l4	! %l4 = fffffffffffff275
p0_b164:
	membar	#Sync			! Added by membar checker (138)
!	Branch On Register, %l6 = 00000090667eddd0
	brlz,a,pt %l6,p0_not_taken_0	! Branch Not Taken

p0_label_157:
!	Mem[0000000010800008] = ffffffff, %l0 = ffffffffffffffff
	ldsba	[%i1+%o6]0x80,%l0	! Annulled
p0_b165:
	membar	#Sync			! Added by membar checker (139)
	fbl,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000038] = 7d05feab, %l4 = fffffffffffff275
	ldub	[%o4+0x03a],%g2		! %g2 = 000000000000007d
p0_b166:
	membar	#Sync			! Added by membar checker (140)
!	%f9  = 1d000000, %f7  = 00000000
	fabss	%f9 ,%f7 		! %f7  = 1d000000
!	%l2 = 0000000000000081, %l4 = fffffffffffff275, %y  = 00000000
	mulx	%l2,%l4,%l4		! %l4 = fffffffffff92cf5

p0_label_158:
!	%l0 = ffffffffffffffff, Mem[0000000030800044] = fffff1f8
	stb	%l0,[%o1+0x044]		! Mem[0000000030800044] = fffff1f8
!	%l5 = ffffffffffffff96, Mem[000000003180000f] = 0bd1c926
	stba	%l5,[%o3+0x00f]%asi	! Mem[000000003180000c] = 0bd1c996
!	%l4 = fff92cf5, %l5 = ffffff96, Mem[0000000010000008] = fffff275 509695ef
	stda	%l4,[%i0+%o6]0x80	! Mem[0000000010000008] = fff92cf5 ffffff96
!	%l0 = ffffffff, %l1 = 0000ffff, Mem[0000000031000008] = ffffffff ffffff96
	stda	%l0,[%o2+0x008]%asi	! Mem[0000000031000008] = ffffffff 0000ffff
!	Mem[00000000108000e0] = a9ffc704 c78dbc23 37c675e2 183fe540
	prefetcha [%i1+0x0e0]%asi,20

p0_label_159:
!	%l7 = 000000a8fffec32c, Mem[0000000010800008] = ffffffff
	stha	%l7,[%i1+%o6]0x80	! Mem[0000000010800008] = c32cffff
!	%f26 = ffffffff 00000000, %f14 = c26bf11a 48f18000
	fxtod	%f26,%f14		! %f14 = c1f00000 00000000
!	Mem[0000000010000000] = 00000089000000d2, %l3 = fffffffffffffffe
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 00000089000000d2
	bgu	p0_b167			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010800041] = 56e0aaac, %l3 = 00000089000000d2
	ldstub	[%i1+0x041],%l3		! %l3 = 00000000000000e0
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0a7,%g2
p0_b167:

p0_label_160:
	membar	#Sync			! Added by membar checker (141)
!	%l3 = 00000000000000e0, Mem[00000000100000e8] = 3dfe54ef
	stw	%l3,[%i0+0x0e8]		! Mem[00000000100000e8] = 000000e0
	set	p0_b168,%o7
	fbge	p0_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800000] = ff000000, %l2 = 0000000000000081
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x0a8,%g2
p0_b168:
!	Registers modified during the branch to p0_far_0
!	%l3  = 0000000000000552
!	%l6  = 0000000000000000
	set	p0_b169,%o7
	fbuge	p0_far_3_he	! Branch Taken, %fcc0 = 0
!	%l4 = fffffffffff92cf5, Mem[0000000010000000] = 00000089000000d2
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010000000] = fffffffffff92cf5
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x0a9,%g2
p0_b169:
!	Registers modified during the branch to p0_far_3
!	%l4  = ffffffffffffffff

p0_label_161:
	membar	#Sync			! Added by membar checker (142)
!	%f22 = f72db874, %f9  = 1d000000
	fabss	%f22,%f9 		! %f9  = 772db874
!	%l3 = 0000000000000552, %l5 = ffffffffffffff96, %l7 = 000000a8fffec32c
	addcc	%l3,%l5,%l7		! %l7 = 00000000000004e8, %ccr = 11
!	%l7 = 00000000000004e8, %l1 = 000000000000ffff, %l7 = 00000000000004e8
	taddcc	%l7,%l1,%l7		! %l7 = 00000000000104e7, %ccr = 02
!	Mem[0000000010800008] = c32cffff, %l5 = ffffffffffffff96
	lduwa	[%i1+%o6]0x80,%l5	! %l5 = 00000000c32cffff
!	Branch On Register, %l7 = 00000000000104e7
	brz,a,pt %l7,p0_not_taken_0	! Branch Not Taken

p0_label_162:
!	Mem[0000000011800008] = fff087eb8e70eb48, %l1 = 000000000000ffff
	ldxa	[%i3+%o6]0x80,%l1	! Annulled
p0_b170:
	membar	#Sync			! Added by membar checker (143)
!	%l4 = ffffffffffffffff, %l1 = 000000000000ffff, %y  = 00000000
	sdivcc	%l4,%l1,%l4		! %l4 = 0000000000010001, %ccr = 00
	bcc,a	p0_b171			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000108000c8] = cbf8fd3a, %l6 = 0000000000000000
	ldub	[%i1+0x0c8],%l6		! %l6 = 00000000000000cb
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0ab,%g2
p0_b171:
	membar	#Sync			! Added by membar checker (144)
!	Mem[00000000118000a0] = 12d0e7fd, %l6 = 00000000000000cb
	lduwa	[%i3+0x0a0]%asi,%l6	! %l6 = 0000000012d0e7fd

p0_label_163:
!	%l6 = 0000000012d0e7fd, immed = 0000001f, %l6 = 0000000012d0e7fd
	srax	%l6,0x01f,%l6		! %l6 = 0000000000000000
	set	p0_b172,%o7
	fbo,a	p0_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000008] = ffffffff, %l6 = 0000000000000000
	ldsw	[%o2+0x008],%l6		! %l6 = ffffffffffffffff
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0ac,%g2
p0_b172:
!	Registers modified during the branch to p0_far_0
!	%l3  = ffffffff3cd3053b
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (145)
!	Mem[00000000100000c0] = 4898aacc f03f3ee1 0dd1b965 bbcb821f
	prefetcha [%i0+0x0c0]%asi,16
!	Branch On Register, %l7 = 00000000000104e7
	brgez,pn %l7,p0_b173		! Branch Taken

p0_label_164:
!	%l6 = 0000000000000000, Mem[0000000011800000] = f63dfd8e
	stwa	%l6,[%i3+%g0]0x80	! Mem[0000000011800000] = 00000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0ad,%g2
p0_b173:
	membar	#Sync			! Added by membar checker (146)
!	Mem[0000000010000008] = fff92cf5, %l1 = 000000000000ffff
	ldstuba	[%i0+%o6]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000001180008c] = 38247509, %l3 = ffffffff3cd3053b
	ldsba	[%i3+0x08f]%asi,%l3	! %l3 = 0000000000000009
!	Mem[000000001180003c] = de4f2cb8, %l1 = 00000000000000ff
	lduha	[%i3+0x03e]%asi,%l1	! %l1 = 0000000000002cb8
!	%f29 = aa6385ad, %f15 = 00000000
	fmovs	%f29,%f15		! %f15 = aa6385ad

p0_label_165:
	bge,a	p0_b174			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000010000008] = fff92cf5, %l7 = 00000000000104e7
	lduha	[%i0+%o6]0x80,%l7	! %l7 = 000000000000fff9
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x0ae,%g2
p0_b174:
	membar	#Sync			! Added by membar checker (147)
	set	p0_b175,%o7
	fbuge,a,pn %fcc3,p0_near_0_he	! Branch Taken, %fcc3 = 2
!	%l2 = 00000000000000ff, Mem[0000000011800008] = fff087eb
	stba	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = fff087eb
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x0af,%g2
p0_b175:
!	Registers modified during the branch to p0_near_0
!	%l0  = 00000000000000dd
	membar	#Sync			! Added by membar checker (148)
!	Mem[0000000010800000] = ff000000, %l5 = 00000000c32cffff
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffff00

p0_label_166:
!	%l5 = ffffffffffffff00, %l0 = 00000000000000dd, %l6 = 0000000000000000
	tsubcc	%l5,%l0,%l6		! %l6 = fffffffffffffe23, %ccr = 8a
!	%l4 = 0000000000010001, %l0 = 00000000000000dd, %y  = 00000000
	udivcc	%l4,%l0,%l4		! %l4 = 0000000000000128, %ccr = 00
!	%l5 = ffffffffffffff00, %l4 = 0000000000000128, %l5 = ffffffffffffff00
	sllx	%l5,%l4,%l5		! %l5 = ffff000000000000
	bpos	p0_b176			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000040000010] = 1f3b17ff2732300a, %l2 = 00000000000000ff
	ldx	[%o5+0x010],%l2		! %l2 = 1f3b17ff2732300a
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x0b0,%g2
p0_b176:

p0_label_167:
	membar	#Sync			! Added by membar checker (149)
!	Mem[0000000031000000] = 365ddc85, %l6 = fffffffffffffe23
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000365d
	set	p0_b177,%o7
	fbule,a	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	%l0 = 00000000000000dd, Mem[0000000010000028] = 0a870df1
	stw	%l0,[%i0+0x028]		! Mem[0000000010000028] = 000000dd
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x0b1,%g2
p0_b177:
!	Registers modified during the branch to p0_far_0
!	%l7  = 0000000000000000
	set	p0_b178,%o7
	fbue	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000011000040] = 95cf4ce4 ac36718b b1f71998 5a20c246
	prefetch [%i2+0x040],0
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0b2,%g2
p0_b178:

p0_label_168:
	bpos	p0_b179			! Branch Taken, %ccr = 44, CWP = 0
!	%l5 = ffff000000000000, Mem[0000000031800008] = b890072c0bd1c996
	stx	%l5,[%o3+0x008]		! Mem[0000000031800008] = ffff000000000000
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x0b3,%g2
p0_b179:
	membar	#Sync			! Added by membar checker (150)
!	%f8  = 41ddcb6e, %f11 = 00000000, %f16 = c26c0000
	fsubs	%f8 ,%f11,%f16		! %f16 = 41ddcb6e
!	%l4 = 0000000000000128, Mem[0000000011000050] = 3f269cc23c282219
	stxa	%l4,[%i2+0x050]%asi	! Mem[0000000011000050] = 0000000000000128
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44

p0_label_169:
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d44cd02 e27389fa
	prefetch [%o4+0x020],1	! Annulled
p0_b180:
	membar	#Sync			! Added by membar checker (151)
	set	p0_b181,%o7
	fbg,a,pn %fcc3,p0_near_0_le	! Branch Taken, %fcc3 = 2
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d44cd02 e27389fa
	prefetch [%o4+0x020],3
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0b5,%g2
p0_b181:
!	Registers modified during the branch to p0_near_0
!	%l0  = 0000000000019278
!	%l7  = 0000000000000009
	membar	#Sync			! Added by membar checker (152)
!	%f19 = 41ddcb6e, %f21 = 00000000
	fabss	%f19,%f21		! %f21 = 41ddcb6e
!	%l4 = 0000000000000128, Mem[0000000011800008] = fff087eb
	stwa	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = 00000128

p0_label_170:
!	%l7 = 0000000000000009, %l5 = ffff000000000000, %l3 = 0000000000000009
	orncc	%l7,%l5,%l3		! %l3 = 0000ffffffffffff, %ccr = 08
	set	p0_b182,%o7
	fbne,a,pt %fcc3,p0_near_3_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000030000048] = 00000000476ff8d4, %l1 = 0000000000002cb8
	ldx	[%o0+0x048],%l1		! %l1 = 00000000476ff8d4
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x0b6,%g2
p0_b182:
!	Registers modified during the branch to p0_near_3
!	%l3  = 0001ffffffffffff
!	%l6  = 0000000000000128
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (153)
!	Mem[00000000110000e0] = a72511d3 3f05fdd2 00000090 667eddd0
	prefetcha [%i2+0x0e0]%asi,1
!	%l2 = 1f3b17ff2732300a, %l0 = 0000000000019278, %l5 = ffff000000000000
	xorcc	%l2,%l0,%l5		! %l5 = 1f3b17ff2733a272, %ccr = 00

p0_label_171:
!	Mem[00000000108000cc] = cb82057f, %l0 = 0000000000019278
	swap	[%i1+0x0cc],%l0		! %l0 = 00000000cb82057f
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[00000000118000e4] = 7006db94, %l5 = 1f3b17ff2733a272
	lduw	[%i3+0x0e4],%l5		! Annulled
p0_b183:
	membar	#Sync			! Added by membar checker (154)
	set	p0_b184,%o7
	fblg,pn	%fcc1,p0_near_3_le	! Branch Taken, %fcc1 = 2
!	%l5 = 1f3b17ff2733a272, Mem[0000000010000088] = 77fdf5a0
	stw	%l5,[%i0+0x088]		! Mem[0000000010000088] = 2733a272
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x0b8,%g2
p0_b184:
!	Registers modified during the branch to p0_near_3
!	%l4  = 0000000000000000

p0_label_172:
	membar	#Sync			! Added by membar checker (155)
!	%l3 = 0001ffffffffffff, Mem[0000000010800098] = c0b01873abaa1764
	stx	%l3,[%i1+0x098]		! Mem[0000000010800098] = 0001ffffffffffff
!	Mem[0000000010000008] = fff92cf5, %l4 = 0000000000000000
	lduha	[%i0+%o6]0x80,%l4	! %l4 = 000000000000fff9
!	Mem[0000000031800040] = 00000000 0000fff9, %l2 = 1f3b17ff2732300a, %l3 = 0001ffffffffffff
	add	%o3,0x40,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 4dff00ffc31d8551
!	%f10 = c26c0000 00000000, %f9  = 772db874
	fdtos	%f10,%f9 		! %f9  = d3600000
!	%f12 = 7fffffff c9b434bd, %f10 = c26c0000 00000000, %f24 = c9b434bd ffffff20
	fmuld	%f12,%f10,%f24		! %f24 = 7fffffff c9b434bd

p0_label_173:
!	%l2 = 1f3b17ff2732300a, %l1 = 00000000476ff8d4, %y  = 00000000
	sdivx	%l2,%l1,%l7		! %l7 = 000000006feae0e4
!	Mem[0000000011800008] = 00000128, %l1 = 00000000476ff8d4
	ldstuba	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000011800008] = ff000128, %l7 = 000000006feae0e4
	ldsha	[%i3+%o6]0x80,%l7	! %l7 = ffffffffffffff00
!	%f2  = c3700000 87d95717, %f12 = 7fffffff c9b434bd, %f16 = 41ddcb6e 00000000
	fmuld	%f2 ,%f12,%f16		! %f16 = 7fffffff c9b434bd
!	Mem[0000000011000020] = 9913992b 91ee9f27 a142f1f6 29eea795
	prefetch [%i2+0x020],4

p0_label_174:
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldda	[%i2+%o6]0x80,%l6
p0_b185:
	membar	#Sync			! Added by membar checker (156)
!	%f10 = c26c0000 00000000, %f14 = c1f00000 aa6385ad
	fabsd	%f10,%f14		! %f14 = 426c0000 00000000
!	%l1 = 0000000000000000, %l7 = ffffffffffffff00, %y  = 00000000
	umul	%l1,%l7,%l7		! %l7 = 0000000000000000
!	%l5 = 1f3b17ff2733a272, %l2 = 1f3b17ff2732300a, %y  = 00000000
	smulcc	%l5,%l2,%l6		! %l6 = 06008d304ebdb874, %ccr = 00

p0_label_175:
!	%l1 = 0000000000000000, immed = 0000002c, %l5 = 1f3b17ff2733a272
	srax	%l1,0x02c,%l5		! %l5 = 0000000000000000
!	%f14 = 426c0000 00000000, %f14 = 426c0000 00000000, %f24 = 7fffffff c9b434bd
	faddd	%f14,%f14,%f24		! %f24 = 427c0000 00000000
	fbl,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l3 = 4dff00ffc31d8551, Mem[0000000011000000] = ffffffff
	stwa	%l3,[%i2+%g0]0x80	! Annulled
p0_b186:
	membar	#Sync			! Added by membar checker (157)
!	Mem[0000000032000000] = 237580e8 c2bb115b 19d8e6f6 7b393a14
	prefetcha [%o4+0x000]%asi,20

p0_label_176:
!	%l6 = 06008d304ebdb874
	setx	0xc9d89fb1c9d89fb1,%g7,%l6 ! %l6 = c9d89fb1c9d89fb1
	bl,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011800008] = ff000128, %l5 = 0000000000000000
	lduwa	[%i3+%o6]0x80,%l5	! Annulled
p0_b187:
	membar	#Sync			! Added by membar checker (158)
!	Branch On Register, %l4 = 000000000000fff9
	brlez,pn %l4,p0_not_taken_0	! Branch Not Taken
!	%l5 = 0000000000000000, Mem[0000000011000000] = ffffffff
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000011000000] = 00ffffff
p0_b188:

p0_label_177:
	membar	#Sync			! Added by membar checker (159)
!	%l0 = 00000000cb82057f, immed = 00000464, %y  = 06008d30
	sdivx	%l0,0x464,%l5		! %l5 = 00000000002e59bd
!	Mem[0000000010000008] = fff92cf5, %l0 = 00000000cb82057f
	lduba	[%i0+%o6]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000011000000] = 00ffffff, %l0 = 00000000000000ff
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = c9d89fb1c9d89fb1, Mem[000000001080008a] = 32eb1351
	sth	%l6,[%i1+0x08a]		! Mem[0000000010800088] = 32eb9fb1
!	%l3 = 4dff00ffc31d8551, immed = fffffa4e, %l6 = c9d89fb1c9d89fb1
	andn	%l3,-0x5b2,%l6		! %l6 = 0000000000000511

p0_label_178:
!	Mem[0000000011800040] = ab4829c8 6c3c45be 7c99292c c06347c6
	prefetcha [%i3+0x040]%asi,2
	set	p0_b189,%o7
	fbe	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010000060] = e6566435 1f7986d2 0b23aed7 19d8e6f6
	prefetch [%i0+0x060],4
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p0_branch_failed
	mov	0x0bd,%g2
p0_b189:
	membar	#Sync			! Added by membar checker (160)
!	Mem[00000000100000b8] = 00000000 1f7986d2, %l1 = 0000000000000000, %l3 = 4dff00ffc31d8551
	add	%i0,0xb8,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = aaf3a69ac98fb3ba
!	%f18 = f72db874 41ddcb6e, %f28 = c3600000 aa6385ad
	fcmpd	%fcc3,%f18,%f28		! %fcc3 = 1

p0_label_179:
	nop				! Delay added due to fcmp
	set	p0_b190,%o7
	fba,pt	%fcc0,p0_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000118000f0] = ffca493edd75f5df, %l6 = 0000000000000511
	ldx	[%i3+0x0f0],%l6		! %l6 = ffca493edd75f5df
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x0be,%g2
p0_b190:
!	Registers modified during the branch to p0_near_3
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (161)
!	%l4 = 0000000000000000, immed = fffff9bd, %l2 = 1f3b17ff2732300a
	tsubcc	%l4,-0x643,%l2		! %l2 = 0000000000000643, %ccr = 13
!	Mem[0000000010000000] = ffffffff, %l3 = aaf3a69ac98fb3ba
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffff
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_180:
!	Mem[0000000030000004] = 476ff8d3, %l2 = 0000000000000643
	ldsb	[%o0+0x006],%l2		! Annulled
p0_b191:
	membar	#Sync			! Added by membar checker (162)
!	%l7 = 0000000000000000, immed = 00000456, %l2 = 0000000000000643
	sub	%l7,0x456,%l2		! %l2 = fffffffffffffbaa
!	%l2 = fffffffffffffbaa, Mem[0000000030800000] = 0b23b5a3ffd8e6f6
	stxa	%l2,[%o1+0x000]%asi	! Mem[0000000030800000] = fffffffffffffbaa
!	%l6 = ffca493edd75f5df, immed = fffffc60, %l0 = 0000000000000000
	orn	%l6,-0x3a0,%l0		! %l0 = ffca493edd75f7df
!	Mem[0000000011000008] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o6]0x80,%l1	! %l1 = 0000000000000000

p0_label_181:
	set	p0_b192,%o7
	fbne,pn	%fcc3,p0_near_2_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000011000024] = 91ee9f27, %l6 = ffca493edd75f5df
	ldub	[%i2+0x026],%l6		! %l6 = 000000000000009f
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0c0,%g2
p0_b192:
!	Registers modified during the branch to p0_near_2
!	%l2  = 0000000000000455
!	%l6  = 00000090667eddd0
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[000000003180000c] = 00000000, %l1 = 0000000000000000
	lduh	[%o3+0x00e],%l1		! Annulled
p0_b193:
	set	p0_b194,%o7
	fbuge	p0_far_0_he	! Branch Taken, %fcc0 = 0

p0_label_182:
!	Mem[00000000108000e0] = a9ffc704 c78dbc23 37c675e2 183fe540
	prefetch [%i1+0x0e0],1
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0c2,%g2
p0_b194:
!	Registers modified during the branch to p0_far_0
!	%l3  = ffffffffffd1a379
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (163)
!	%l6 = 0000000000000000, Mem[0000000011000000] = 00ffffff
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000011000000] = 00000000
!	%l5 = 00000000002e59bd, %l4 = 0000000000000000, %l2 = 0000000000000455
	andn	%l5,%l4,%l2		! %l2 = 00000000002e59bd
!	%f2  = c3700000, %f28 = c3600000 aa6385ad
	fstox	%f2 ,%f28		! %f28 = ffffffff ffffff10
	set	p0_b195,%o7
	fbge,a	p0_far_2_he	! Branch Taken, %fcc0 = 0

p0_label_183:
!	Mem[0000000010800008] = c32cffff, %l4 = 0000000000000000
	lduba	[%i1+%o6]0x80,%l4	! %l4 = 00000000000000c3
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x0c3,%g2
p0_b195:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l4  = 00000000c75676db
!	%l5  = 00000000002e5c87
	membar	#Sync			! Added by membar checker (164)
!	Mem[0000000011800008] = ff000128, %l0 = 0000000000000000
	swapa	[%i3+%o6]0x80,%l0	! %l0 = 00000000ff000128
!	%l3 = ffffffffffd1a379, immed = ffffff50, %y  = 06008d30
	umul	%l3,-0x0b0,%l3		! %l3 = ffd1a2c91fdf9cd0
!	%f10 = c26c0000 00000000, %f11 = 00000000
	fdtos	%f10,%f11		! %f11 = d3600000
!	%l4 = 00000000c75676db, immed = 0000088b, %l4 = 00000000c75676db
	orncc	%l4,0x88b,%l4		! %l4 = fffffffffffff7ff, %ccr = 88

p0_label_184:
!	Mem[000000003180004c] = 00003415, %l5 = 00000000002e5c87
	lduha	[%o3+0x04c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010000000] = ffffffff fff92cf5 fff92cf5 ffffff96
	prefetch [%i0+0x000],16
!	%l0 = 00000000ff000128, immed = fffff662, %l1 = 0000000000000000
	and	%l0,-0x99e,%l1		! %l1 = 00000000ff000020
!	%l4 = fffffffffffff7ff, immed = fffff5ed, %l0 = 00000000ff000128
	tsubcc	%l4,-0xa13,%l0		! %l0 = 0000000000000212, %ccr = 02
!	Mem[00000000108000c0] = 3f474d42 279a4243 cbf8fd3a 00019278
	prefetch [%i1+0x0c0],0

p0_label_185:
	set	p0_b196,%o7
	fbo,pt	%fcc0,p0_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d44cd02 e27389fa
	prefetch [%o4+0x020],22
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x0c4,%g2
p0_b196:
!	Registers modified during the branch to p0_near_3
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (165)
!	Mem[0000000032000000] = 237580e8 c2bb115b 19d8e6f6 7b393a14
	prefetcha [%o4+0x000]%asi,0
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = ffd1a2c91fdf9cd0, Mem[0000000031000004] = 00002219
	sth	%l3,[%o2+0x004]		! Mem[0000000031000004] = 9cd02219
p0_b197:

p0_label_186:
	membar	#Sync			! Added by membar checker (166)
!	%l3 = ffd1a2c91fdf9cd0, Mem[0000000031000000] = 365ddc859cd02219
	stx	%l3,[%o2+0x000]		! Mem[0000000031000000] = ffd1a2c91fdf9cd0
!	%l1 = 00000000ff000020, Mem[0000000010000000] = fffffffffff92cf5
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = 00000000ff000020
!	Mem[00000000110000a0] = 6307e9be 64a79ecf fa15ce90 ffff96cc
	prefetcha [%i2+0x0a0]%asi,4
!	Mem[000000003000000f] = 018a0090, %l6 = 0000000000000000
	ldstuba	[%o0+0x00f]%asi,%l6	! %l6 = 0000000000000090
!	%l4 = 0000000000000000, Mem[0000000031000000] = ffd1a2c9
	stwa	%l4,[%o2+0x000]%asi	! Mem[0000000031000000] = 00000000

p0_label_187:
	set	p0_b198,%o7
	fblg,pt	%fcc1,p0_near_0_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000031000008] = ffffffff 0000ffff, %l2 = 002e59bd, %l3 = 1fdf9cd0
	ldd	[%o2+0x008],%l2		! %l2 = 00000000ffffffff 000000000000ffff
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x0c6,%g2
p0_b198:
!	Registers modified during the branch to p0_near_0
!	%l0  = 0000feff011fffe0
!	%l7  = 000000000000ffff
	membar	#Sync			! Added by membar checker (167)
!	%l1 = 00000000ff000020
	setx	0x27e45d9627e45d96,%g7,%l1 ! %l1 = 27e45d9627e45d96
	ba	p0_b199			! Branch Taken, %ccr = 00, CWP = 0
!	%l6 = 0000000000000090, Mem[0000000010800058] = 5861910c0a1a6a3e
	stx	%l6,[%i1+0x058]		! Mem[0000000010800058] = 0000000000000090
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0c7,%g2
p0_b199:

p0_label_188:
	bpos	p0_b200			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000118000a0] = 12d0e7fd c6f34d3d 33e94237 7e66b217
	prefetch [%i3+0x0a0],0
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p0_branch_failed
	mov	0x0c8,%g2
p0_b200:
	membar	#Sync			! Added by membar checker (168)
!	%f22 = f72db874, %f24 = 427c0000
	fcmps	%fcc3,%f22,%f24		! %fcc3 = 1
!	%l3 = 000000000000ffff, Mem[0000000011000008] = ff000000
	stha	%l3,[%i2+%o6]0x80	! Mem[0000000011000008] = ffff0000
!	Mem[0000000011000000] = 00000000, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_189:
!	Mem[0000000010800028] = 757dccc4, %l6 = 0000000000000090
	ldsw	[%i1+0x028],%l6		! %l6 = 00000000757dccc4
!	%l7 = 000000000000ffff, %l7 = 000000000000ffff, %l0 = 0000feff011fffe0
	orncc	%l7,%l7,%l0		! %l0 = ffffffffffffffff, %ccr = 88
!	Mem[0000000010800060] = 85f0c657 5b381f7f 43c8c412 92647f50
	prefetch [%i1+0x060],2
!	%l2 = 00000000ffffffff, %l7 = 000000000000ffff, %l5 = 0000000000000000
	and	%l2,%l7,%l5		! %l5 = 000000000000ffff
!	%l5 = 000000000000ffff, Mem[0000000031000008] = ffffffff0000ffff
	stx	%l5,[%o2+0x008]		! Mem[0000000031000008] = 000000000000ffff

p0_label_190:
	fbu,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000030800048] = 00000000, %l6 = 00000000757dccc4
	ldsb	[%o1+0x049],%l6		! %l6 = 0000000000000000
p0_b201:
	membar	#Sync			! Added by membar checker (169)
!	Mem[0000000010000008] = fff92cf5, %l7 = 000000000000ffff
	ldsha	[%i0+0x008]%asi,%l7	! %l7 = fffffffffffffff9
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000000] = 00000000ffffffff, %l3 = 000000000000ffff
	ldxa	[%i2+%g0]0x80,%l3	! Annulled
p0_b202:

p0_label_191:
	membar	#Sync			! Added by membar checker (170)
!	%l4 = 00000000, %l5 = 0000ffff, Mem[0000000030000000] = 8c54adf0 476ff8d3
	stda	%l4,[%o0+0x000]%asi	! Mem[0000000030000000] = 00000000 0000ffff
	bne	p0_b203			! Branch Taken, %ccr = 88, CWP = 0
!	%l2 = ffffffff, %l3 = 0000ffff, Mem[0000000011800000] = 00000000 8fabb5a3
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000011800000] = ffffffff 0000ffff
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0cb,%g2
p0_b203:
	membar	#Sync			! Added by membar checker (171)
!	%f27 = 00000000, %f21 = 41ddcb6e
	fcmps	%fcc2,%f27,%f21		! %fcc2 = 1
!	Mem[00000000118000a0] = 12d0e7fd, %l7 = fffffffffffffff9
	ldsba	[%i3+0x0a1]%asi,%l7	! %l7 = ffffffffffffffd0

p0_label_192:
!	Mem[0000000031800008] = ffff0000, %l6 = 0000000000000000
	ldsha	[%o3+0x008]%asi,%l6	! %l6 = ffffffffffffffff
!	%l6 = ffffffffffffffff, immed = fffffcc4, %l3 = 000000000000ffff
	subc	%l6,-0x33c,%l3		! %l3 = 000000000000033b
!	%f26 = ffffffff, %f18 = f72db874
	fcmps	%fcc0,%f26,%f18		! %fcc0 = 3
!	Mem[0000000011800000] = ffffffff, %l2 = 00000000ffffffff
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 000000000000ffff
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88

p0_label_193:
!	%l0 = ffffffffffffffff, Mem[0000000010800000] = ff00000000000000
	stxa	%l0,[%i1+%g0]0x80	! Annulled
p0_b204:
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3
!	%l3 = 000000000000033b, Mem[0000000010000008] = fff92cf5ffffff96
	stxa	%l3,[%i0+%o6]0x80	! Annulled
p0_b205:
	membar	#Sync			! Added by membar checker (172)
!	Mem[0000000012000084] = afcbf3d7, %l3 = 000000000000033b
	ldswa	[%i4+0x084]%asi,%l3	! %l3 = ffffffffafcbf3d7
!	%l7 = ffffffffffffffd0, immed = 0000001b, %l4 = 0000000000000000
	sll	%l7,0x01b,%l4		! %l4 = fffffffe80000000

p0_label_194:
!	%f4  = 00000000 000000e0, %f18 = f72db874
	fxtos	%f4 ,%f18		! %f18 = 43600000
!	Mem[0000000011800000] = ffffffff, %l3 = ffffffffafcbf3d7
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
	fble,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000010000008] = fff92cf5, %l0 = ffffffffffffffff
	ldstuba	[%i0+%o6]0x80,%l0	! Annulled
p0_b206:
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88

p0_label_195:
!	Mem[0000000030800009] = 00000000, %l7 = ffffffffffffffd0
	ldstub	[%o1+0x009],%l7		! Annulled
p0_b207:
	membar	#Sync			! Added by membar checker (173)
	set	p0_b208,%o7
	fba,pt	%fcc2,p0_near_0_he	! Branch Taken, %fcc2 = 1
!	%l1 = 27e45d9627e45d96, Mem[0000000011800000] = ffffffff
	stwa	%l1,[%i3+%g0]0x80	! Mem[0000000011800000] = 27e45d96
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x0d0,%g2
p0_b208:
!	Registers modified during the branch to p0_near_0
!	%l0  = ffffffffffffff22
	set	p0_b209,%o7
	fbug	p0_far_1_he	! Branch Taken, %fcc0 = 3
!	Mem[0000000032000060] = 2432adfc 00007542 036269f7 f75fc675
	prefetch [%o4+0x060],21
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0d1,%g2
p0_b209:

p0_label_196:
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l4 = fffffffe80000000, Mem[0000000011800000] = 27e45d96
	stwa	%l4,[%i3+%g0]0x80	! Annulled
p0_b210:
	membar	#Sync			! Added by membar checker (174)
!	Mem[000000001180007c] = bccbbd6f, %l7 = ffffffffffffffd0
	ldsh	[%i3+0x07c],%l7		! %l7 = ffffffffffffbccb
!	%l0 = ffffffffffffff22, immed = 00000b3f, %l7 = ffffffffffffbccb
	and	%l0,0xb3f,%l7		! %l7 = 0000000000000b22
!	Mem[000000003080000c] = ffffffff, %l4 = fffffffe80000000
	ldstub	[%o1+0x00c],%l4		! %l4 = 00000000000000ff

p0_label_197:
!	%f26 = ffffffff 00000000, %f18 = 43600000 41ddcb6e, %f0  = c3600000 87d95717
	fmuld	%f26,%f18,%f0 		! %f0  = ffffffff 00000000
!	%l6 = ffffffffffffffff, Mem[000000003180000d] = 00000000
	stb	%l6,[%o3+0x00d]		! Mem[000000003180000c] = 00ff0000
!	%l0 = ffffffffffffff22, immed = fffff8b6, %l3 = 00000000000000ff
	taddcc	%l0,-0x74a,%l3		! %l3 = fffffffffffff7d8, %ccr = 9b
!	%f30 = 773db874 99f51080, %f28 = ffffffff ffffff10
	fmovd	%f30,%f28		! %f28 = 773db874 99f51080
!	Mem[0000000010800020] = 9e0d45b2 e0cf9813 757dccc4 e939d543
	prefetch [%i1+0x020],4

p0_label_198:
!	Branch On Register, %l6 = ffffffffffffffff
	brlez,pn %l6,p0_b211		! Branch Taken
!	Mem[0000000011000000] = 00000000 ffffffff, %l0 = ffffff22, %l1 = 27e45d96
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0d3,%g2
p0_b211:
	membar	#Sync			! Added by membar checker (175)
!	Mem[00000000110000b0] = 782b192b, %l3 = fffffffffffff7d8
	ldsha	[%i2+0x0b0]%asi,%l3	! %l3 = 000000000000782b
!	Branch On Register, %l3 = 000000000000782b
	brgez,a,pt %l3,p0_b212		! Branch Taken
!	Mem[0000000030000040] = c9ad9853 e2dd8139, %l4 = 000000ff, %l5 = 0000ffff
	ldd	[%o0+0x040],%l4		! %l4 = 00000000c9ad9853 00000000e2dd8139
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p0_branch_failed
	mov	0x0d4,%g2
p0_b212:

p0_label_199:
	membar	#Sync			! Added by membar checker (176)
!	%l1 = 00000000ffffffff, %l0 = 0000000000000000, %l6 = ffffffffffffffff
	sllx	%l1,%l0,%l6		! %l6 = 00000000ffffffff
!	Mem[0000000010000044] = e9b25eaa, %l5 = 00000000e2dd8139
	ldsh	[%i0+0x046],%l5		! %l5 = 0000000000005eaa
!	%l0 = 0000000000000000, immed = fffff10d, %y  = 0000feff
	mulx	%l0,-0xef3,%l5		! %l5 = 0000000000000000
!	%l0 = 0000000000000000, immed = 00000c94, %l2 = 000000000000ffff
	sub	%l0,0xc94,%l2		! %l2 = fffffffffffff36c
!	%l2 = fffff36c, %l3 = 0000782b, Mem[0000000011800008] = 00000000 8e70eb48
	stda	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = fffff36c 0000782b

p0_label_200:
!	%l1 = 00000000ffffffff, immed = 000003be, %l5 = 0000000000000000
	orncc	%l1,0x3be,%l5		! %l5 = ffffffffffffffff, %ccr = 88
	set	p0_b213,%o7
	fbul,a	p0_far_0_he	! Branch Taken, %fcc0 = 3
!	%l0 = 0000000000000000, Mem[000000003180000c] = 00ff0000
	stw	%l0,[%o3+0x00c]		! Mem[000000003180000c] = 00000000
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p0_branch_failed
	mov	0x0d5,%g2
p0_b213:
!	Registers modified during the branch to p0_far_0
!	%l3  = 000000000000053b
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (177)
!	%l5 = ffffffffffffffff, immed = fffff61f, %l0 = 0000000000000000
	taddcc	%l5,-0x9e1,%l0		! %l0 = fffffffffffff61e, %ccr = 9b
!	%l3 = 000000000000053b, immed = fffff97d, %l6 = 0000000000000000
	xnorcc	%l3,-0x683,%l6		! %l6 = 00000000000003b9, %ccr = 00

!	End of Random Code for Processor 0

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x000]		! Set processor 0 done flag

!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be fffffffffffff61e
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000ffffffff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be fffffffffffff36c
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000000053b
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000c9ad9853
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000003b9
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000b22
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x0000feff,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p0_failed
	mov	0x111,%g1

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_temp,%g1
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be ffffffff 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be c3700000 87d95717
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 000000e0
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 1d000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 41ddcb6e d3600000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be c26c0000 d3600000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 7fffffff c9b434bd
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 426c0000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 7fffffff c9b434bd
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 43600000 41ddcb6e
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 87d95717 41ddcb6e
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf20,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 427c0000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffffffff 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 773db874 99f51080
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 773db874 99f51080
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p0_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000ff000020
	ldx	[%i0+0x000],%g3		! Observed data at 0000000010000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fff92cf5ffffff96
	ldx	[%i0+0x008],%g3		! Observed data at 0000000010000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 00000000000bfe48
	ldx	[%i0+0x020],%g3		! Observed data at 0000000010000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 000000dd85710090
	ldx	[%i0+0x028],%g3		! Observed data at 0000000010000028
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x048],%g2		! Expect data = aca8da5a0520f1bc
	ldx	[%i0+0x048],%g3		! Observed data at 0000000010000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 0b23aed719d8e6f6
	ldx	[%i0+0x068],%g3		! Observed data at 0000000010000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 2733a272000bfe48
	ldx	[%i0+0x088],%g3		! Observed data at 0000000010000088
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x090],%g2		! Expect data = c4ffc3ac34a993b7
	ldx	[%i0+0x090],%g3		! Observed data at 0000000010000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 0000fabef0da61b4
	ldx	[%i0+0x098],%g3		! Observed data at 0000000010000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 0000000000000001
	ldx	[%i0+0x0a0],%g3		! Observed data at 00000000100000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 9300d99dca61f1bc
	ldx	[%i0+0x0d0],%g3		! Observed data at 00000000100000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 000000e01fcb562d
	ldx	[%i0+0x0e8],%g3		! Observed data at 00000000100000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = 016c1391b2f3f8ea
	ldx	[%i0+0x0f0],%g3		! Observed data at 00000000100000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 9fe1f71bddffd225
	ldx	[%i0+0x0f8],%g3		! Observed data at 00000000100000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff00000000000000
	ldx	[%i1+0x000],%g3		! Observed data at 0000000010800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = c32cffffd53dc716
	ldx	[%i1+0x008],%g3		! Observed data at 0000000010800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 47b767cb000000e9
	ldx	[%i1+0x010],%g3		! Observed data at 0000000010800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 80b4e16d00d7472d
	ldx	[%i1+0x018],%g3		! Observed data at 0000000010800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 56ffaaacc446715f
	ldx	[%i1+0x040],%g3		! Observed data at 0000000010800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 0000000000000090
	ldx	[%i1+0x058],%g3		! Observed data at 0000000010800058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x070],%g2		! Expect data = aceac56f8d7aa51c
	ldx	[%i1+0x070],%g3		! Observed data at 0000000010800070
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x078],%g2		! Expect data = eb2afd7535481346
	ldx	[%i1+0x078],%g3		! Observed data at 0000000010800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 32eb9fb10089f099
	ldx	[%i1+0x088],%g3		! Observed data at 0000000010800088
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 00000000000000d2
	ldx	[%i1+0x090],%g3		! Observed data at 0000000010800090
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 0001ffffffffffff
	ldx	[%i1+0x098],%g3		! Observed data at 0000000010800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = fffff7df0000006c
	ldx	[%i1+0x0a0],%g3		! Observed data at 00000000108000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 27a075d6fffffd8e
	ldx	[%i1+0x0b8],%g3		! Observed data at 00000000108000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = cbf8fd3a00019278
	ldx	[%i1+0x0c8],%g3		! Observed data at 00000000108000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 9f58e54773947408
	ldx	[%i1+0x0d8],%g3		! Observed data at 00000000108000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 00000000296d9635
	ldx	[%i1+0x0f8],%g3		! Observed data at 00000000108000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000ffffffff
	ldx	[%i2+0x000],%g3		! Observed data at 0000000011000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffff00008fdf76dd
	ldx	[%i2+0x008],%g3		! Observed data at 0000000011000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 0000000000000128
	ldx	[%i2+0x050],%g3		! Observed data at 0000000011000050
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x058],%g2		! Expect data = f0da61b400003415
	ldx	[%i2+0x058],%g3		! Observed data at 0000000011000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 0000000000000000
	ldx	[%i2+0x060],%g3		! Observed data at 0000000011000060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = fa15ce90ffff96cc
	ldx	[%i2+0x0a8],%g3		! Observed data at 00000000110000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = ffffeb2affffffff
	ldx	[%i2+0x0c8],%g3		! Observed data at 00000000110000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 0000337bce944797
	ldx	[%i2+0x0d0],%g3		! Observed data at 00000000110000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 00000090667eddd0
	ldx	[%i2+0x0e8],%g3		! Observed data at 00000000110000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 27e45d960000ffff
	ldx	[%i3+0x000],%g3		! Observed data at 0000000011800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fffff36c0000782b
	ldx	[%i3+0x008],%g3		! Observed data at 0000000011800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = a8d2ff287206cc2a
	ldx	[%i3+0x018],%g3		! Observed data at 0000000011800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 00ccfdb5e863a98e
	ldx	[%i3+0x030],%g3		! Observed data at 0000000011800030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x040],%g2		! Expect data = ab4829c86c3c45be
	ldx	[%i3+0x040],%g3		! Observed data at 0000000011800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x040,%g4

	set	p0_local4_expect,%g1

!	Processor 0, local 4 is clean


	set	p0_local5_expect,%g1
	ldx	[%g1+0x010],%g2		! Expect data = ddf03d1e20c94c14
	ldx	[%i5+0x010],%g3		! Observed data at 0000000012800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4

	set	p0_local6_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 6cf1d2ffca61f1bc
	ldx	[%i6+0x008],%g3		! Observed data at 0000000013000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p0_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p0_memcheck_share0:
	ldx	[%g4+0x00],%g2	! Expected value = 000000000000ffff
	ldx	[%o0+0x00],%g3	! Read value at Mem[0000000030000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 00000190018a00ff
	ldx	[%o0+0x08],%g3	! Read value at Mem[0000000030000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = c9ad9853e2dd8139
	ldx	[%o0+0x40],%g3	! Read value at Mem[0000000030000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 00000000476ff8d4
	ldx	[%o0+0x48],%g3	! Read value at Mem[0000000030000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p0_memcheck_share1:
	ldx	[%g4+0x00],%g2	! Expected value = fffffffffffffbaa
	ldx	[%o1+0x00],%g3	! Read value at Mem[0000000030800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 00000000ffffffff
	ldx	[%o1+0x08],%g3	! Read value at Mem[0000000030800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = fffffbdffffff1f8
	ldx	[%o1+0x40],%g3	! Read value at Mem[0000000030800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 00000000000000ff
	ldx	[%o1+0x48],%g3	! Read value at Mem[0000000030800048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p0_memcheck_share2:
	ldx	[%g4+0x00],%g2	! Expected value = 000000001fdf9cd0
	ldx	[%o2+0x00],%g3	! Read value at Mem[0000000031000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 000000000000ffff
	ldx	[%o2+0x08],%g3	! Read value at Mem[0000000031000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = e1d66c5f612c337b
	ldx	[%o2+0x40],%g3	! Read value at Mem[0000000031000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = fffff63d6000008d
	ldx	[%o2+0x48],%g3	! Read value at Mem[0000000031000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p0_memcheck_share3:
	ldx	[%g4+0x00],%g2	! Expected value = 0000000041808382
	ldx	[%o3+0x00],%g3	! Read value at Mem[0000000031800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = ffff000000000000
	ldx	[%o3+0x08],%g3	! Read value at Mem[0000000031800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 4dff00ffc31d8551
	ldx	[%o3+0x40],%g3	! Read value at Mem[0000000031800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 0000000000003415
	ldx	[%o3+0x48],%g3	! Read value at Mem[0000000031800048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

!	The test for processor 0 has passed

p0_passed:
	ta	GOOD_TRAP
	nop

p0_reg_l0_fail:
	or	%g0,0xbd0,%g1
	ba,a	p0_failed
p0_reg_l1_fail:
	or	%g0,0xbd1,%g1
	ba,a	p0_failed
p0_reg_l2_fail:
	or	%g0,0xbd2,%g1
	ba,a	p0_failed
p0_reg_l3_fail:
	or	%g0,0xbd3,%g1
	ba,a	p0_failed
p0_reg_l4_fail:
	or	%g0,0xbd4,%g1
	ba,a	p0_failed
p0_reg_l5_fail:
	or	%g0,0xbd5,%g1
	ba,a	p0_failed
p0_reg_l6_fail:
	or	%g0,0xbd6,%g1
	ba,a	p0_failed
p0_reg_l7_fail:
	or	%g0,0xbd7,%g1
	ba,a	p0_failed
p0_freg_fail:
	mov	%l0,%g3
	ba	p0_failed
	mov	%l1,%g2


!	The test for processor 0 failed

p0_failed:
	set	done_flags,%g1
	mov	3,%g5
	st	%g5,[%g1+0x000]		! Set processor 0 done flag

	set	p0_temp,%g6
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop


!	The local area data for processor 0 failed

p0_local_failed:
	set	done_flags,%g5
	mov	3,%g6
	st	%g5,[%g5+0x000]		! Set processor 0 done flag

	set	p0_temp,%g6
	add	%g1,%g4,%g1
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop

p0_dfill_failed:
	ba	p0_failed
	mov	0xddd,%g1

p0_selfmod_failed:
	ba	p0_failed
	mov	0xabc,%g1


p0_common_timeout:
p0_common_error:
	or	%g0,0xee0,%g1
	ba	p0_failed
	mov	%o5,%g3

common_failed:
	ba	p0_failed
	nop
p0_branch_failed:
	mov	0xbbb,%g1
	rd	%ccr,%g2
	ba	p0_failed
	mov	0x0,%g3

p0_trap1e:
	xorcc	%l7,%l3,%l7
	addccc	%l2,-0x133,%l0
	umulcc	%l1,%l3,%l0
	done

p0_trap1o:
	xorcc	%l7,%l3,%l7
	addccc	%l2,-0x133,%l0
	umulcc	%l1,%l3,%l0
	done


p0_trap2e:
	xnor	%l6,-0x0de,%l0
	done

p0_trap2o:
	xnor	%l6,-0x0de,%l0
	done


p0_dispatch_failed:
	set	p0_temp,%g7
	set	0xbad0ccdd,%g1
	st	%g1,[%g7]
	ta	BAD_TRAP
	nop

p0_xintr_cnt_failed:
	set	p0_temp,%g7
	set	0xbad0ccee,%g1
	st	%g1,[%g7]
	st	%g2,[%g7+4]		! Expected count
	st	%g3,[%g7+8]		! Observed count
	ta	BAD_TRAP
	nop

xintr_failed:
	set	p0_temp,%g7
	set	0xbad0cccc,%g1
	st	%g1,[%g7]
	ta	BAD_TRAP
	nop

p0_init_memory_pointers:
	set	p0_init_registers,%g1
	mov	%g0,%g4
	mov	%g0,%g5
	mov	%g0,%g6
	mov	%g0,%g7

!	Initialize memory pointers for window 0
	set	p0_local0_start,%i0
	set	p0_local1_start,%i1
	set	p0_local2_start,%i2
	set	p0_local3_start,%i3
	set	p0_local4_start,%i4
	set	p0_local5_start,%i5
	set	p0_local6_start,%i6
	mov	%g0,%i7
!	Init Local Registers in Window 0
	ldx	[%g1+0x000],%l0	! %l0 = ad14d6006e235506
	ldx	[%g1+0x008],%l1	! %l1 = e473c3ff9eacc79c
	ldx	[%g1+0x010],%l2	! %l2 = 180b37ffaca8da5a
	ldx	[%g1+0x018],%l3	! %l3 = 6cf1d2ffca61f1bc
	ldx	[%g1+0x020],%l4	! %l4 = a8aeb4003ba4cb2e
	ldx	[%g1+0x028],%l5	! %l5 = 526105004a2dd02f
	ldx	[%g1+0x030],%l6	! %l6 = e71c18ffa6745895
	ldx	[%g1+0x038],%l7	! %l7 = 6e39e9002c791c14

!	Initialize the output register of window 0
	set	share0_start,%o0
	set	share1_start,%o1
	set	share2_start,%o2
	set	share3_start,%o3
	set	unres0_start,%o4
	set	common_start,%o5
	mov	0x08,%o6

	retl
	nop

!	Random code for Processor 1

processor_2:
	ta	T_CHANGE_PRIV
	set	done_flags,%g1
	mov	1,%g2
	st	%g2,[%g1+0x04]		! Set the start flag
	wrpr	%g0,7,%cleanwin
	call	p1_init_memory_pointers
	wr	%g0,0x80,%asi

!	Initialize the floating point registers for processor 1

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p1_init_freg,%g1
	ldd	[%g1+0x00],%f0		! %f0  = 636659fc, %f1  = b58187b0
	ldd	[%g1+0x08],%f2		! %f2  = 89458c1c, %f3  = 513f0955
	ldd	[%g1+0x10],%f4		! %f4  = 913e0d8c, %f5  = bf92d587
	ldd	[%g1+0x18],%f6		! %f6  = 804bc7da, %f7  = 3f0022f5
	ldd	[%g1+0x20],%f8		! %f8  = f08588b8, %f9  = 06fc7711
	ldd	[%g1+0x28],%f10		! %f10 = 3fb329b1, %f11 = f0c2b031
	ldd	[%g1+0x30],%f12		! %f12 = 7beee063, %f13 = 0c87130b
	ldd	[%g1+0x38],%f14		! %f14 = 3308c626, %f15 = f886a687
	ldd	[%g1+0x40],%f16		! %f16 = d8450d72, %f17 = 8ad82340
	ldd	[%g1+0x48],%f18		! %f18 = e5f57be7, %f19 = b59d1d20
	ldd	[%g1+0x50],%f20		! %f20 = ad253f6b, %f21 = b8222ade
	ldd	[%g1+0x58],%f22		! %f22 = bd436030, %f23 = 2bfdc876
	ldd	[%g1+0x60],%f24		! %f24 = 70d2fb20, %f25 = 715fd7dc
	ldd	[%g1+0x68],%f26		! %f26 = 0ad60ccd, %f27 = 389de570
	ldd	[%g1+0x70],%f28		! %f28 = f05d1dd0, %f29 = 38590ced
	ldd	[%g1+0x78],%f30		! %f30 = 614fb3ef, %f31 = f2d45158
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 1

p1_label_1:
!	Branch On Register, %l2 = 226432006bf77361
	brgz,a,pt %l2,p1_b1		! Branch Taken
!	Mem[0000000015800060] = 0aebb449 b5df4596 49e6748c 7c2ffeb7
	prefetch [%i3+0x060],20
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x001,%g2
p1_b1:
	membar	#Sync			! Added by membar checker (178)
!	Mem[0000000015800008] = a54c33925bef0d6a, %l5 = 6b6629ffe163fe99
	ldxa	[%i3+%o6]0x80,%l5	! %l5 = a54c33925bef0d6a
!	%l5 = a54c33925bef0d6a, immed = fffff6e3, %l0 = 700967ffbceea408
	sub	%l5,-0x91d,%l0		! %l0 = a54c33925bef1687
!	%l0 = a54c33925bef1687, immed = fffffc7e, %l3 = aab9cbff95771b63
	orncc	%l0,-0x382,%l3		! %l3 = a54c33925bef1787, %ccr = 80

p1_label_2:
!	%l0 = a54c33925bef1687, Mem[0000000015000148] = b4e8fe62
	stwa	%l0,[%i2+0x148]%asi	! Mem[0000000015000148] = 5bef1687
!	Mem[000000003100005c] = aded68e8, %l4 = 6837bb005f7119ee
	lduh	[%o2+0x05c],%l4		! %l4 = 000000000000aded
!	%l1 = 120cc0ffdd7f86ed, immed = 00000830, %l4 = 000000000000aded
	xorcc	%l1,0x830,%l4		! %l4 = 120cc0ffdd7f8edd, %ccr = 08
	bvs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000015000000] = 8267d434, %l4 = 120cc0ffdd7f8edd
	lduba	[%i2+%g0]0x80,%l4	! Annulled
p1_b2:

p1_label_3:
	membar	#Sync			! Added by membar checker (179)
!	Branch On Register, %l4 = 120cc0ffdd7f8edd
	brnz,pn	%l4,p1_b3		! Branch Taken
!	%l0 = a54c33925bef1687, Mem[00000000150000e6] = 267606b5
	stb	%l0,[%i2+0x0e6]		! Mem[00000000150000e4] = 267687b5
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x003,%g2
p1_b3:
	membar	#Sync			! Added by membar checker (180)
!	%l4 = dd7f8edd, %l5 = 5bef0d6a, Mem[0000000014000008] = 8f99b7bb bd6e380a
	stda	%l4,[%i0+%o6]0x80	! Mem[0000000014000008] = dd7f8edd 5bef0d6a
!	%l7 = e7fbb4ffddfc4d72, Mem[0000000015800008] = a54c33925bef0d6a
	stxa	%l7,[%i3+%o6]0x80	! Mem[0000000015800008] = e7fbb4ffddfc4d72
!	Mem[0000000031800054] = eb33041d, %l0 = a54c33925bef1687
	ldub	[%o3+0x055],%l0		! %l0 = 0000000000000033

p1_label_4:
!	Mem[00000000140001a0] = 24e08187 62d41315 4f11f481 09bfceb5
	prefetch [%i0+0x1a0],23
!	%f0  = 636659fc b58187b0, %f20 = ad253f6b b8222ade
	fnegd	%f0 ,%f20		! %f20 = e36659fc b58187b0
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 00000033, %l1 = dd7f86ed, Mem[0000000015000000] = 8267d434 02b4b682
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000015000000] = 00000033 dd7f86ed
p1_b4:
	membar	#Sync			! Added by membar checker (181)
!	Mem[0000000030800014] = ff4efb6c, %l2 = 226432006bf77361
	ldsha	[%o1+0x016]%asi,%l2	! %l2 = fffffffffffffb6c

p1_label_5:
!	Branch On Register, %l0 = 0000000000000033
	brgz,pt	%l0,p1_b5		! Branch Taken
!	Mem[00000000150001c0] = b73ed785, %l3 = a54c33925bef1787
	lduh	[%i2+0x1c0],%l3		! %l3 = 000000000000b73e
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x005,%g2
p1_b5:
	membar	#Sync			! Added by membar checker (182)
!	%l7 = e7fbb4ffddfc4d72, %l6 = dac2bfffa04120d1, %l6 = dac2bfffa04120d1
	xnorcc	%l7,%l6,%l6		! %l6 = c2c6f4ff8242925c, %ccr = 88
!	%f14 = 3308c626 f886a687, %f14 = 3308c626 f886a687, %f14 = 3308c626 f886a687
	fdivd	%f14,%f14,%f14		! %f14 = 3ff00000 00000000
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_6:
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],1	! Annulled
p1_b6:
	set	p1_b7,%o7
	fbge,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000030000018] = 779164c2, %l3 = 000000000000b73e
	lduh	[%o0+0x018],%l3		! %l3 = 0000000000007791
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x007,%g2
p1_b7:
!	Registers modified during the branch to p1_far_3
!	%l7  = ffffffffffffffbe
	ble	p1_b8			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000015800000] = a21e0ecb92532f36, %l5 = a54c33925bef0d6a
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = a21e0ecb92532f36
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x008,%g2
p1_b8:

p1_label_7:
	membar	#Sync			! Added by membar checker (183)
!	%l4 = 120cc0ffdd7f8edd, immed = fffff2e3, %y  = 00000000
	umulcc	%l4,-0xd1d,%l6		! %l6 = dd7f83846e4b97f7, %ccr = 80
!	Mem[0000000014800088] = f28e37bc 018a66a2, %l2 = fffffb6c, %l3 = 00007791
	ldda	[%i1+0x088]%asi,%l2	! %l2 = 00000000f28e37bc 00000000018a66a2
	set	p1_b9,%o7
	fbule,a,pt %fcc0,p1_near_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000118] = ff8366e0, %l0 = 0000000000000033
	ldstub	[%i2+0x118],%l0		! %l0 = 00000000000000ff
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x009,%g2
p1_b9:
!	Registers modified during the branch to p1_near_0
!	%l0  = ffffffffffffffdf
!	%l2  = 0000000000000001
	membar	#Sync			! Added by membar checker (184)
!	%f14 = 3ff00000 00000000, %f0  = 636659fc
	fdtoi	%f14,%f0 		! %f0  = 00000001

p1_label_8:
!	%f5  = bf92d587, %f3  = 513f0955
	fabss	%f5 ,%f3 		! %f3  = 3f92d587
!	%l7 = ffffffffffffffbe, immed = 0000001a, %l6 = dd7f83846e4b97f7
	sll	%l7,0x01a,%l6		! %l6 = fffffffef8000000
!	%f14 = 3ff00000 00000000, %f9  = 06fc7711
	fdtoi	%f14,%f9 		! %f9  = 00000001
	set	p1_b10,%o7
	fbuge	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000180] = 4185e0da 2942eaa1 d69ee909 1714070a
	prefetch [%i0+0x180],3
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x00a,%g2
p1_b10:
!	Registers modified during the branch to p1_far_1
!	%l1  = 000000000000011f

p1_label_9:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = ffffffffffffffbe, Mem[0000000015000000] = 00000033
	stha	%l7,[%i2+%g0]0x80	! Annulled
p1_b11:
	membar	#Sync			! Added by membar checker (185)
!	%l0 = ffffffffffffffdf, %l5 = a21e0ecb92532f36, %l5 = a21e0ecb92532f36
	srlx	%l0,%l5,%l5		! %l5 = 00000000000003ff
!	%l4 = 120cc0ffdd7f8edd, immed = fffff5cb, %y  = dd7f8384
	sdiv	%l4,-0xa35,%l0		! %l0 = 000000007fffffff
!	%l5 = 00000000000003ff, %l3 = 00000000018a66a2, %l3 = 00000000018a66a2
	tsubcc	%l5,%l3,%l3		! %l3 = fffffffffe759d5d, %ccr = 9b

p1_label_10:
	bl	p1_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000014800000] = e54c96b1, %l7 = ffffffffffffffbe
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000e54c96b1
p1_b12:
	membar	#Sync			! Added by membar checker (186)
!	%l0 = 000000007fffffff, %l5 = 00000000000003ff, %l1 = 000000000000011f
	srl	%l0,%l5,%l1		! %l1 = 0000000000000000
!	Mem[0000000031000014] = bb891c5c, %l3 = fffffffffe759d5d
	ldswa	[%o2+0x014]%asi,%l3	! %l3 = ffffffffbb891c5c
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_11:
!	Mem[0000000014800088] = f28e37bc, %l2 = 0000000000000001
	ldsb	[%i1+0x08b],%l2		! Annulled
p1_b13:
	membar	#Sync			! Added by membar checker (187)
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[00000000150000c0] = 8ea0e9f3, %l3 = ffffffffbb891c5c
	ldub	[%i2+0x0c1],%l3		! %l3 = 00000000000000a0
!	%l0 = 000000007fffffff, %l0 = 000000007fffffff, %y  = dd7f8384
	udivcc	%l0,%l0,%l6		! %l6 = 00000000ffffffff, %ccr = 0a
!	%l2 = 0000000000000001, %l4 = 120cc0ffdd7f8edd, %l6 = 00000000ffffffff
	srax	%l2,%l4,%l6		! %l6 = 0000000000000000

p1_label_12:
!	%l1 = 0000000000000000, Mem[0000000015800116] = 6790fd28
	stba	%l1,[%i3+0x116]%asi	! Mem[0000000015800114] = 67900028
!	%f10 = 3fb329b1 f0c2b031, %f22 = bd436030 2bfdc876
	fnegd	%f10,%f22		! %f22 = bfb329b1 f0c2b031
	bge	p1_b14			! Branch Taken, %ccr = 0a, CWP = 0
!	%l5 = 00000000000003ff, Mem[0000000014000008] = dd7f8edd5bef0d6a
	stxa	%l5,[%i0+%o6]0x80	! Mem[0000000014000008] = 00000000000003ff
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x00e,%g2
p1_b14:
	membar	#Sync			! Added by membar checker (188)
!	%f24 = 70d2fb20, %f2  = 89458c1c
	fabss	%f24,%f2 		! %f2  = 70d2fb20

p1_label_13:
!	%l1 = 0000000000000000, immed = fffffe47, %l7 = 00000000e54c96b1
	xor	%l1,-0x1b9,%l7		! %l7 = fffffffffffffe47
	set	p1_b15,%o7
	fbo	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	%l0 = 000000007fffffff, Mem[0000000014000114] = dcf4f6e0
	sth	%l0,[%i0+0x114]		! Mem[0000000014000114] = fffff6e0
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x00f,%g2
p1_b15:
!	Registers modified during the branch to p1_far_0
!	%l6  = 0000000000000efb
	membar	#Sync			! Added by membar checker (189)
!	%l0 = 000000007fffffff, immed = 000006e3, %l2 = 0000000000000001
	orncc	%l0,0x6e3,%l2		! %l2 = ffffffffffffffff, %ccr = 88
!	Mem[00000000148001e0] = 8d614984, %l6 = 0000000000000efb
	ldswa	[%i1+0x1e0]%asi,%l6	! %l6 = ffffffff8d614984

p1_label_14:
!	Jump to jmpl_2, CWP = 0
	set	p1_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000030800010] = f3b9d630 ff4efb6c, %l4 = dd7f8edd, %l5 = 000003ff
	ldd	[%o1+0x010],%l4		! %l4 = 00000000f3b9d630 00000000ff4efb6c
!	Registers modified during the branch to p1_jmpl_2
!	%l1  = ffffffff80000000
!	%l2  = 0000000001e773ac
!	%l5  = fff0000000000000
!	%l6  = 00000000ffffffff
!	%l7 = fffffffffffffe47, %l5 = fff0000000000000, %l5 = fff0000000000000
	sll	%l7,%l5,%l5		! %l5 = fffffffffffffe47
!	Mem[0000000015000000] = 00000033dd7f86ed, %l3 = 00000000000000a0
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = 00000033dd7f86ed
!	Mem[0000000014800080] = 3d92a06f, %l2 = 0000000001e773ac
	ldsw	[%i1+0x080],%l2		! %l2 = 000000003d92a06f

p1_label_15:
!	%l3 = 00000033dd7f86ed, Mem[0000000032000064] = 73787542
	stw	%l3,[%o4+0x064]		! Mem[0000000032000064] = dd7f86ed
!	%l4 = 00000000f3b9d630, Mem[000000001580003e] = 5ab38d71
	stha	%l4,[%i3+0x03e]%asi	! Mem[000000001580003c] = 5ab3d630
!	Mem[0000000030000058] = 0980455f, %l2 = 3d92a06f, %l7 = fffffe47
	add	%o0,0x58,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 000000000980455f
!	%l6 = 00000000ffffffff, immed = 000009fb, %l1 = ffffffff80000000
	andncc	%l6,0x9fb,%l1		! %l1 = 00000000fffff604, %ccr = 08
!	Mem[000000001400016c] = 16da8c37, %l6 = ffffffff, %l1 = fffff604
	add	%i0,0x16c,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000016da8c37

p1_label_16:
!	%l6 = 00000000ffffffff, Mem[0000000032000029] = 04cd02e2
	stb	%l6,[%o4+0x029]		! Mem[0000000032000028] = ffcd02e2
!	%l1 = 0000000016da8c37, %l7 = 000000000980455f, %l5 = fffffffffffffe47
	addcc	%l1,%l7,%l5		! %l5 = 00000000205ad196, %ccr = 00
!	%l0 = 000000007fffffff, Mem[00000000158000cc] = 2f60a0f7
	sth	%l0,[%i3+0x0cc]		! Mem[00000000158000cc] = ffffa0f7
!	%l2 = 000000003d92a06f, immed = fffffaa0, %y  = dd7f8384
	udiv	%l2,-0x560,%l7		! %l7 = 00000000dd7f882a
!	%l2 = 000000003d92a06f, Mem[0000000015000008] = eeb05a3a51eff06f
	stxa	%l2,[%i2+%o6]0x80	! Mem[0000000015000008] = 000000003d92a06f

p1_label_17:
!	%l7 = 00000000dd7f882a, %l2 = 000000003d92a06f, %l4 = 00000000f3b9d630
	addccc	%l7,%l2,%l4		! %l4 = 000000011b122899, %ccr = 01
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 01
!	Mem[00000000148000a0] = 7e62ef6f fbcf9e54 d8928a28 7a2b4964
	prefetch [%i1+0x0a0],16	! Annulled
p1_b16:
	membar	#Sync			! Added by membar checker (190)
	set	p1_b17,%o7
	fba,pt	%fcc3,p1_near_0_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000014800170] = 55834052 fa8e2c45, %l2 = 3d92a06f, %l3 = dd7f86ed
	ldd	[%i1+0x170],%l2		! %l2 = 0000000055834052 00000000fa8e2c45
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x011,%g2
p1_b17:
!	Registers modified during the branch to p1_near_0
!	%l2  = 0000000109002088
!	%l7  = ffffffff96da8c37

p1_label_18:
	membar	#Sync			! Added by membar checker (191)
!	Mem[0000000014000000] = aa27318d, %l1 = 0000000016da8c37
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000aa
!	%l6 = 00000000ffffffff, Mem[0000000030000016] = 6514392e
	stha	%l6,[%o0+0x016]%asi	! Mem[0000000030000014] = 6514ffff
!	Mem[0000000014000000] = ff27318d, %l2 = 0000000109002088
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%f24 = 70d2fb20 715fd7dc, %f6  = 804bc7da 3f0022f5
	fcmped	%fcc1,%f24,%f6 		! %fcc1 = 2
!	Branch On Register, %l3 = 00000000fa8e2c45
	brgez,a,pt %l3,p1_b18		! Branch Taken

p1_label_19:
!	Mem[0000000014000140] = 108fa323 6aebf835 aead08ee 0fdb898f
	prefetch [%i0+0x140],23
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x012,%g2
p1_b18:
	membar	#Sync			! Added by membar checker (192)
!	Mem[0000000015800008] = e7fbb4ff, %l5 = 00000000205ad196
	ldswa	[%i3+%o6]0x80,%l5	! %l5 = ffffffffe7fbb4ff
!	%f30 = 614fb3ef f2d45158, %f30 = 614fb3ef f2d45158, %f8  = f08588b8 00000001
	faddd	%f30,%f30,%f8 		! %f8  = 615fb3ef f2d45158
!	Mem[0000000031000014] = bb891c5c, %l7 = ffffffff96da8c37
	ldsh	[%o2+0x016],%l7		! %l7 = 0000000000001c5c
	set	p1_b19,%o7
	fblg,pt	%fcc1,p1_near_2_le	! Branch Taken, %fcc1 = 2

p1_label_20:
!	%l0 = 7fffffff, %l1 = 000000aa, Mem[0000000032000008] = b745e7a8 7b393a14
	std	%l0,[%o4+0x008]	! Mem[0000000032000008] = 7fffffff 000000aa
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x013,%g2
p1_b19:
!	Registers modified during the branch to p1_near_2
!	%l0  = 000000007fffff55
!	%l3  = 0000000018044f65
!	%l4  = 0000000000000045
!	%l7  = ffffffff80000c60
	membar	#Sync			! Added by membar checker (193)
!	Mem[0000000015800008] = e7fbb4ff, %l3 = 0000000018044f65
	ldsha	[%i3+%o6]0x80,%l3	! %l3 = ffffffffffffe7fb
!	%l6 = ffffffff, %l7 = 80000c60, Mem[00000000158000f8] = a6fdf637 39730eca
	stda	%l6,[%i3+0x0f8]%asi	! Mem[00000000158000f8] = ffffffff 80000c60
!	%l6 = 00000000ffffffff, %l0 = 000000007fffff55, %l4 = 0000000000000045
	and	%l6,%l0,%l4		! %l4 = 000000007fffff55
!	%l7 = ffffffff80000c60, %l5 = ffffffffe7fbb4ff, %l3 = ffffffffffffe7fb
	srax	%l7,%l5,%l3		! %l3 = ffffffffffffffff

p1_label_21:
!	Mem[0000000015000000] = 00000033, %l2 = 00000000000000ff
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f25 = 715fd7dc, %f18 = e5f57be7
	fmovs	%f25,%f18		! %f18 = 715fd7dc
!	Mem[00000000140001a0] = 24e08187 62d41315 4f11f481 09bfceb5
	prefetch [%i0+0x1a0],4
!	%f8  = 615fb3ef f2d45158, %f8  = 615fb3ef f2d45158, %f26 = 0ad60ccd 389de570
	fsubd	%f8 ,%f8 ,%f26		! %f26 = 00000000 00000000
!	%l2 = 0000000000000000, immed = fffff5f0, %l4 = 000000007fffff55
	andncc	%l2,-0xa10,%l4		! %l4 = 0000000000000000, %ccr = 44

p1_label_22:
!	%f14 = 3ff00000 00000000, %f16 = d8450d72
	fdtoi	%f14,%f16		! %f16 = 00000001
!	Mem[00000000140000a0] = 9f718abc 261028af 129afdd7 9fc788d6
	prefetcha [%i0+0x0a0]%asi,23
!	Mem[0000000015000000] = 00000033, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000033
!	%l4 = 0000000000000000, %l3 = ffffffffffffffff, %l4 = 0000000000000000
	xnor	%l4,%l3,%l4		! %l4 = 0000000000000000
	bge	p1_b20			! Branch Taken, %ccr = 44, CWP = 0

p1_label_23:
!	Mem[0000000015800008] = e7fbb4ff, %l5 = ffffffffe7fbb4ff
	ldstuba	[%i3+%o6]0x80,%l5	! %l5 = 00000000000000e7
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x014,%g2
p1_b20:
	bcc,a	p1_b21			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000014000008] = 00000000, %l7 = ffffffff80000c60
	lduha	[%i0+%o6]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x015,%g2
p1_b21:
	membar	#Sync			! Added by membar checker (194)
!	%l6 = 00000000ffffffff, %l4 = 0000000000000000, %l0 = 000000007fffff55
	orcc	%l6,%l4,%l0		! %l0 = 00000000ffffffff, %ccr = 08
!	%f30 = 614fb3ef, %f23 = f0c2b031
	fmovs	%f30,%f23		! %f23 = 614fb3ef

p1_label_24:
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000015000080] = b4c4a7e7 3c9c6dc0 82e40c38 aaf67f52
	prefetch [%i2+0x080],23	! Annulled
p1_b22:
	membar	#Sync			! Added by membar checker (195)
!	%l2 = 0000000000000033, %l4 = 0000000000000000, %l4 = 0000000000000000
	addcc	%l2,%l4,%l4		! %l4 = 0000000000000033, %ccr = 00
!	%f6  = 804bc7da, %f21 = b58187b0
	fnegs	%f6 ,%f21		! %f21 = 004bc7da
!	%l5 = 00000000000000e7, %l6 = 00000000ffffffff, %y  = dd7f8384
	mulx	%l5,%l6,%l4		! %l4 = 000000e6ffffff19

p1_label_25:
!	%f28 = f05d1dd0 38590ced, %f28 = f05d1dd0 38590ced
	fmovd	%f28,%f28		! %f28 = f05d1dd0 38590ced
	fblg,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000008] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o6]0x80,%l7	! Annulled
p1_b23:
	membar	#Sync			! Added by membar checker (196)
!	Mem[0000000015800000] = a21e0ecb, %l5 = 00000000000000e7
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 000000000000a21e
!	Mem[0000000015000000] = 00000033, %l0 = 00000000ffffffff
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000033

p1_label_26:
	set	p1_b24,%o7
	fbge,a	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000040000018] = 13342835, %l0 = 0000000000000033
	ldsh	[%o5+0x018],%l0		! %l0 = 0000000000001334
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x018,%g2
p1_b24:
!	Registers modified during the branch to p1_far_3
!	%l0  = 00000000000000bb
!	%l3  = 000000000000c0bb
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000000] = 00000033dd7f86ed, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l7	! Annulled
p1_b25:
	membar	#Sync			! Added by membar checker (197)
	set	p1_b26,%o7
	fbg,pt	%fcc1,p1_near_0_le	! Branch Taken, %fcc1 = 2

p1_label_27:
!	%l2 = 0000000000000033, Mem[0000000015000000] = 00000033
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000015000000] = 00330033
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x01a,%g2
p1_b26:
!	Registers modified during the branch to p1_near_0
!	%l0  = ffffffffffffff5d
!	%l2  = 0000000000000001
	membar	#Sync			! Added by membar checker (198)
!	%l6 = 00000000ffffffff, %l2 = 0000000000000001, %l7 = 0000000000000000
	orn	%l6,%l2,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000014800008] = 1a14b46a, %l5 = 000000000000a21e
	lduha	[%i1+%o6]0x80,%l5	! %l5 = 0000000000001a14
!	%l1 = 00000000000000aa, immed = 000007b8, %l6 = 00000000ffffffff
	andcc	%l1,0x7b8,%l6		! %l6 = 00000000000000a8, %ccr = 00
!	%l5 = 0000000000001a14, immed = 0000068b, %y  = dd7f8384
	sdivx	%l5,0x68b,%l6		! %l6 = 0000000000000003

p1_label_28:
!	%l6 = 0000000000000003, %l5 = 0000000000001a14, %y  = dd7f8384
	udiv	%l6,%l5,%l3		! %l3 = 00000000ffffffff
!	Mem[00000000140000f0] = 9aa1fef2, %l7 = ffffffffffffffff
	lduh	[%i0+0x0f0],%l7		! %l7 = 0000000000009aa1
!	Mem[0000000014000198] = d4a01323, %l4 = ffffff19, %l6 = 00000003
	add	%i0,0x198,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 00000000d4a01323
	bge	p1_b27			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000014800000] = ffffffbe, %l4 = 000000e6ffffff19
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x01b,%g2
p1_b27:

p1_label_29:
	membar	#Sync			! Added by membar checker (199)
!	%l2 = 0000000000000001, %l5 = 0000000000001a14, %l4 = ffffffffffffffff
	sllx	%l2,%l5,%l4		! %l4 = 0000000000100000
!	Branch On Register, %l3 = 00000000ffffffff
	brz,a,pn %l3,p1_not_taken_0	! Branch Not Taken
!	%l6 = 00000000d4a01323, Mem[0000000015800000] = a21e0ecb
	stba	%l6,[%i3+%g0]0x80	! Annulled
p1_b28:
	membar	#Sync			! Added by membar checker (200)
!	Mem[0000000014800000] = ffffffbe, %l5 = 0000000000001a14
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ffffffbe
!	Mem[0000000014000008] = 00000000, %l3 = 00000000ffffffff
	lduha	[%i0+%o6]0x80,%l3	! %l3 = 0000000000000000

p1_label_30:
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000015800000] = a21e0ecb, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000a21e0ecb
!	Registers modified during the branch to p1_jmpl_0
!	%l5  = 00000000000000e1
!	%l6  = ffffffffffffffff
!	Mem[00000000148001e0] = 8d614984 9b6fa145 4ff65d73 c151a9c7
	prefetcha [%i1+0x1e0]%asi,1
!	Mem[00000000140001a4] = 62d41315, %l6 = ffffffffffffffff
	lduwa	[%i0+0x1a4]%asi,%l6	! %l6 = 0000000062d41315
!	%f30 = 614fb3ef f2d45158, %f8  = 615fb3ef f2d45158, %f2  = 70d2fb20 3f92d587
	fsubd	%f30,%f8 ,%f2 		! %f2  = e14fb3ef f2d45158

p1_label_31:
	bvs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031000010] = 47327b64, %l7 = 0000000000009aa1
	ldsb	[%o2+0x012],%l7		! Annulled
p1_b29:
	membar	#Sync			! Added by membar checker (201)
!	%l1 = 00000000000000aa, immed = fffff49d, %l2 = 0000000000000001
	or	%l1,-0xb63,%l2		! %l2 = fffffffffffff4bf
!	%l4 = 0000000000100000, %l7 = 0000000000009aa1, %l0 = ffffffffffffff5d
	sll	%l4,%l7,%l0		! %l0 = 0000000000200000
!	%f22 = bfb329b1, %f27 = 00000000, %f2  = e14fb3ef
	fsubs	%f22,%f27,%f2 		! %f2  = bfb329b1

p1_label_32:
!	%f10 = 3fb329b1 f0c2b031, %f26 = 00000000 00000000, %f8  = 615fb3ef f2d45158
	fmuld	%f10,%f26,%f8 		! %f8  = 00000000 00000000
!	%l3 = 00000000a21e0ecb, immed = 000003e1, %y  = dd7f8384
	mulx	%l3,0x3e1,%l2		! %l2 = 00000274d697616b
!	Mem[0000000030800050] = d85daa51b1d316fb, %l5 = 00000000000000e1
	ldxa	[%o1+0x050]%asi,%l5	! %l5 = d85daa51b1d316fb
	fbul,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000150000c0] = 8ea0e9f3, %l4 = 0000000000100000
	ldsw	[%i2+0x0c0],%l4		! %l4 = ffffffff8ea0e9f3
p1_b30:

p1_label_33:
	membar	#Sync			! Added by membar checker (202)
!	%f3  = f2d45158, %f4  = 913e0d8c bf92d587
	fstod	%f3 ,%f4 		! %f4  = c65a8a2b 00000000
	fbl,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000030800014] = ff4efb6c, %l0 = 0000000000200000
	ldsw	[%o1+0x014],%l0		! %l0 = ffffffffff4efb6c
p1_b31:
	membar	#Sync			! Added by membar checker (203)
	set	p1_b32,%o7
	fble,a,pn %fcc2,p1_near_0_le	! Branch Taken, %fcc2 = 0
!	%l1 = 00000000000000aa, Mem[0000000015800008] = fffbb4ff
	stha	%l1,[%i3+%o6]0x80	! Mem[0000000015800008] = 00aab4ff
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x020,%g2
p1_b32:
!	Registers modified during the branch to p1_near_0
!	%l0  = fffffffffffffff7
!	%l2  = 0000000000000001

p1_label_34:
!	call to call_3, CWP = 0
	call	p1_call_3_he
!	Mem[0000000015000130] = 59be6cf4, %l5 = d85daa51b1d316fb
	swap	[%i2+0x130],%l5		! %l5 = 0000000059be6cf4
!	Registers modified during the branch to p1_call_3
!	%l4  = 0000000000000000
!	%l7  = 000000000008564c
	membar	#Sync			! Added by membar checker (204)
!	%l3 = 00000000a21e0ecb, immed = 000004e8, %l7 = 000000000008564c
	andncc	%l3,0x4e8,%l7		! %l7 = 00000000a21e0a03, %ccr = 08
!	%f2  = bfb329b1 f2d45158, %f14 = 3ff00000 00000000
	fcmped	%fcc2,%f2 ,%f14		! %fcc2 = 1
!	%l3 = 00000000a21e0ecb, Mem[0000000014800008] = 1a14b46a
	stha	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = 0ecbb46a

p1_label_35:
!	Mem[00000000150000ac] = 195524c4, %l5 = 0000000059be6cf4
	ldub	[%i2+0x0ac],%l5		! %l5 = 0000000000000019
	bneg	p1_b33			! Branch Taken, %ccr = 08, CWP = 0
!	%l1 = 00000000000000aa, Mem[000000001480009a] = 4977ce5f
	sth	%l1,[%i1+0x09a]		! Mem[0000000014800098] = 497700aa
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x021,%g2
p1_b33:
	membar	#Sync			! Added by membar checker (205)
!	Mem[0000000014000000] = ff27318d, %l7 = 00000000a21e0a03
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = ffffffffff27318d
!	%l4 = 0000000000000000, %l0 = fffffffffffffff7, %l0 = fffffffffffffff7
	andn	%l4,%l0,%l0		! %l0 = 0000000000000000

p1_label_36:
!	%l7 = ffffffffff27318d
	setx	0xb5b19d32b5b19d32,%g7,%l7 ! %l7 = b5b19d32b5b19d32
	set	p1_b34,%o7
	fbug,a,pn %fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000015800008] = 00aab4ff, %l1 = 00000000000000aa
	ldsha	[%i3+%o6]0x80,%l1	! %l1 = 00000000000000aa
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x022,%g2
p1_b34:
!	Registers modified during the branch to p1_near_2
!	%l1  = 000000005ae967ad
!	%l3  = 0000000000000001
!	%l4  = b5b19d32b5b19d31
!	%l5  = 00000000d85daa51
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (206)
!	%l4 = b5b19d32b5b19d31
	sethi	%hi(0x64967800),%l4	! %l4 = 0000000064967800
!	%l3 = 0000000000000001, immed = 000007e5, %l7 = 0000000000000000
	or	%l3,0x7e5,%l7		! %l7 = 00000000000007e5

p1_label_37:
!	%l2 = 0000000000000001, %l6 = 0000000062d41315, %l1 = 000000005ae967ad
	andncc	%l2,%l6,%l1		! %l1 = 0000000000000000, %ccr = 44
!	%f14 = 3ff00000 00000000, %f18 = 715fd7dc b59d1d20
	fdtox	%f14,%f18		! %f18 = 00000000 00000001
!	Mem[0000000014000000] = ff27318d, %l4 = 0000000064967800
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	%l1 = 0000000000000000, %l3 = 0000000000000001, %y  = 00000000
	sdiv	%l1,%l3,%l7		! %l7 = 0000000000000000
!	%l5 = 00000000d85daa51, Mem[0000000032000056] = 66d0d1b4
	stha	%l5,[%o4+0x056]%asi	! Mem[0000000032000054] = aa51d1b4

p1_label_38:
	set	p1_b35,%o7
	fbge,a	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800000] = 0000000092532f36, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = 0000000092532f36
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x023,%g2
p1_b35:
!	Registers modified during the branch to p1_far_0
!	%l6  = ffffffff6dacdf8a
	membar	#Sync			! Added by membar checker (207)
	fbue,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[00000000170001a4] = ed779dee, %l0 = 0000000000000000
	ldsw	[%i6+0x1a4],%l0		! %l0 = ffffffffed779dee
p1_b36:
	membar	#Sync			! Added by membar checker (208)
!	Branch On Register, %l5 = 00000000d85daa51
	brgez,pt %l5,p1_b37		! Branch Taken

p1_label_39:
!	Mem[000000003080001e] = 26c09511, %l0 = ffffffffed779dee
	ldstub	[%o1+0x01e],%l0		! %l0 = 0000000000000095
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x025,%g2
p1_b37:
	membar	#Sync			! Added by membar checker (209)
!	Branch On Register, %l0 = 0000000000000095
	brz,pt	%l0,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000160] = 6c913a15 943a1ec9 cf77bb2f 16da8c37
	prefetch [%i0+0x160],4
p1_b38:
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800008] = 00aab4ff, %l3 = 0000000000000001
	ldsha	[%i3+%o6]0x80,%l3	! %l3 = 00000000000000aa
p1_b39:

p1_label_40:
	membar	#Sync			! Added by membar checker (210)
!	%l4 = ffffffffffffffff, immed = 00000b26, %l6 = ffffffff6dacdf8a
	subccc	%l4,0xb26,%l6		! %l6 = fffffffffffff4d9, %ccr = 88
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = 00000000000000aa, Mem[000000003180001c] = f0ff7a17
	stw	%l3,[%o3+0x01c]		! Annulled
p1_b40:
	set	p1_b41,%o7
	fbue	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	%l7 = 0000000092532f36, Mem[000000001500011d] = d09ce9af
	stb	%l7,[%i2+0x11d]		! Mem[000000001500011c] = d036e9af
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x029,%g2
p1_b41:
!	Registers modified during the branch to p1_far_3
!	%l7  = ffffffffffffffbe

p1_label_41:
	membar	#Sync			! Added by membar checker (211)
!	Mem[0000000015000008] = 000000003d92a06f, %l7 = ffffffffffffffbe
	ldxa	[%i2+%o6]0x80,%l7	! %l7 = 000000003d92a06f
	bpos,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000030800050] = d85daa51b1d316fb, %l0 = 0000000000000095
	ldx	[%o1+0x050],%l0		! Annulled
p1_b42:
	membar	#Sync			! Added by membar checker (212)
!	Mem[0000000031000050] = 156bce66, %l7 = 000000003d92a06f
	swap	[%o2+0x050],%l7		! %l7 = 00000000156bce66
!	%l6 = fffffffffffff4d9, %l7 = 00000000156bce66, %y  = 00000000
	sdivcc	%l6,%l7,%l6		! %l6 = 000000000000000b, %ccr = 00

p1_label_42:
	set	p1_b43,%o7
	fba,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000100] = 4c18e2e9 dbfa6374 7b64018c 5e4bff44
	prefetch [%i2+0x100],23	! Annulled
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x02b,%g2
p1_b43:
!	Registers modified during the branch to p1_far_3
!	%l7  = ffffffffffffffbe
	membar	#Sync			! Added by membar checker (213)
!	%l4 = ffffffffffffffff, %l2 = 0000000000000001, %y  = 00000000
	smul	%l4,%l2,%l5		! %l5 = ffffffffffffffff
	set	p1_b44,%o7
	fbo	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800020] = 3974d721, %l3 = 00000000000000aa
	swap	[%i1+0x020],%l3		! %l3 = 000000003974d721
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x02c,%g2
p1_b44:
!	Registers modified during the branch to p1_far_0
!	%l2  = 0000000000000051
!	%l3  = 0000000000000000
!	%l4  = fffffffffffffbc2
!	%l5  = 0000000000000000
!	%l6  = 0000000000000000
!	%l7  = 0000000000006790

p1_label_43:
	membar	#Sync			! Added by membar checker (214)
!	%l6 = 0000000000000000, %l0 = 0000000000000095, %l0 = 0000000000000095
	addc	%l6,%l0,%l0		! %l0 = 0000000000000095
!	Mem[00000000158001c0] = ac75ea17 6b786156 4d3196ee e9e760c2
	prefetch [%i3+0x1c0],23
!	Mem[0000000031000014] = bb891c5c, %l5 = 0000000000000000
	lduba	[%o2+0x017]%asi,%l5	! %l5 = 000000000000005c
!	Mem[0000000030000014] = 6514ffff, %l4 = fffffffffffffbc2
	lduha	[%o0+0x016]%asi,%l4	! %l4 = 000000000000ffff
!	%l0 = 0000000000000095, Mem[0000000015800000] = 00000000
	stha	%l0,[%i3+%g0]0x80	! Mem[0000000015800000] = 00950000

p1_label_44:
	fbul,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l0 = 0000000000000095, Mem[0000000014800044] = a2499c4d
	sth	%l0,[%i1+0x044]		! Annulled
p1_b45:
	membar	#Sync			! Added by membar checker (215)
!	Mem[00000000140001b0] = b1522255, %l1 = 0000000000000000
	lduba	[%i0+0x1b0]%asi,%l1	! %l1 = 00000000000000b1
!	%l3 = 0000000000000000
	setx	0xa5618b39a5618b39,%g7,%l3 ! %l3 = a5618b39a5618b39
!	%f30 = 614fb3ef, %f8  = 00000000 00000000
	fitod	%f30,%f8 		! %f8  = 41d853ec fbc00000

p1_label_45:
	bgu,a	p1_b46			! Branch Taken, %ccr = 00, CWP = 0
!	%l7 = 0000000000006790, Mem[000000003180005a] = ea2939fb
	stb	%l7,[%o3+0x05a]		! Mem[0000000031800058] = ea2990fb
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x02e,%g2
p1_b46:
	membar	#Sync			! Added by membar checker (216)
!	Mem[0000000014800160] = a04014c0 f1127407 76693b2c e3a8904e
	prefetcha [%i1+0x160]%asi,2
!	Branch On Register, %l7 = 0000000000006790
	brlez,pn %l7,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000008] = 00000000, %l2 = 0000000000000051
	ldstuba	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000
p1_b47:

p1_label_46:
	fbne	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800000] = ffffffbe, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffbe
p1_b48:
	membar	#Sync			! Added by membar checker (217)
	fbul,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000160] = b6ffec99dffe02a2, %l7 = 0000000000006790
	ldx	[%i2+0x160],%l7		! Annulled
p1_b49:
	membar	#Sync			! Added by membar checker (218)
!	Branch On Register, %l4 = 000000000000ffff
	brgz,pt	%l4,p1_b50		! Branch Taken

p1_label_47:
!	Mem[000000001480008c] = 018a66a2, %l2 = ffffffffffffffbe
	ldsb	[%i1+0x08e],%l2		! %l2 = 0000000000000066
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x032,%g2
p1_b50:
	membar	#Sync			! Added by membar checker (219)
!	%l2 = 0000000000000066, %l1 = 00000000000000b1, %l6 = 0000000000000000
	orncc	%l2,%l1,%l6		! %l6 = ffffffffffffff6e, %ccr = 88
!	%l2 = 0000000000000066, %l5 = 000000000000005c, %l0 = 0000000000000095
	srlx	%l2,%l5,%l0		! %l0 = 0000000000000000
!	Mem[000000003100005c] = aded68e8, %l3 = a5618b39a5618b39
	lduwa	[%o2+0x05c]%asi,%l3	! %l3 = 00000000aded68e8
!	%f8  = 41d853ec fbc00000, %f6  = 804bc7da 3f0022f5
	fdtox	%f8 ,%f6 		! %f6  = 00000000 614fb3ef

p1_label_48:
!	Mem[000000003200003c] = feab7aa1, %l3 = 00000000aded68e8
	lduw	[%o4+0x03c],%g2		! %g2 = 00000000aded68e8
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000158000f8] = ffffffff, %l6 = ffffffffffffff6e
	lduw	[%i3+0x0f8],%l6		! Annulled
p1_b51:
	membar	#Sync			! Added by membar checker (220)
!	Mem[0000000014000128] = 00000001 00000001, %l3 = 00000000aded68e8, %l3 = 00000000aded68e8
	add	%i0,0x128,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = db6a74e843e9a396
!	%f22 = bfb329b1 614fb3ef, %f8  = 41d853ec fbc00000
	fabsd	%f22,%f8 		! %f8  = 3fb329b1 614fb3ef

p1_label_49:
!	%f28 = f05d1dd0 38590ced, %f2  = bfb329b1 f2d45158
	fcmped	%fcc1,%f28,%f2 		! %fcc1 = 1
!	Mem[0000000015000060] = 95b9d266 72e0af27 c60a8978 bf52541a
	prefetch [%i2+0x060],1
	set	p1_b52,%o7
	fbe,a,pt %fcc0,p1_near_0_he	! Branch Taken, %fcc0 = 0
!	%l5 = 000000000000005c, Mem[0000000030000052] = 11e7bee9
	stb	%l5,[%o0+0x052]		! Mem[0000000030000050] = 11e75ce9
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x034,%g2
p1_b52:
!	Registers modified during the branch to p1_near_0
!	%l3  = 0000000000000000
!	%l7  = ffffffffffffff4e
	membar	#Sync			! Added by membar checker (221)
!	%l3 = 0000000000000000, immed = fffff4b3, %y  = 00000000
	udiv	%l3,-0xb4d,%l5		! %l5 = 0000000000000000

p1_label_50:
!	%l1 = 00000000000000b1, %l2 = 0000000000000066, %l4 = 000000000000ffff
	srl	%l1,%l2,%l4		! %l4 = 0000000000000002
!	%f28 = f05d1dd0 38590ced, %f28 = f05d1dd0 38590ced, %f26 = 00000000 00000000
	fsubd	%f28,%f28,%f26		! %f26 = 00000000 00000000
	fbul,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000031800050] = e7bd1326, %l6 = ffffffffffffff6e
	ldub	[%o3+0x051],%l6		! Annulled
p1_b53:
	membar	#Sync			! Added by membar checker (222)
	set	p1_b54,%o7
	fbul,pt	%fcc1,p1_near_0_he	! Branch Taken, %fcc1 = 1

p1_label_51:
!	%l4 = 0000000000000002, Mem[0000000015800008] = 00aab4ff
	stwa	%l4,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000002
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x036,%g2
p1_b54:
!	Registers modified during the branch to p1_near_0
!	%l2  = 0000000000000002
!	%l7  = ffffffffffffff4e
	set	p1_b55,%o7
	fbge	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l4 = 00000002, %l5 = 00000000, Mem[0000000014000178] = 9deec4df 30a8513a
	std	%l4,[%i0+0x178]	! Mem[0000000014000178] = 00000002 00000000
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x037,%g2
p1_b55:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0000000000000000
!	%l2  = 0000000000000000
!	%l4  = ffffffffffffff6e
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (223)
!	%l0 = 0000000000000000, %l5 = 0000000000000000, %l0 = 0000000000000000
	sra	%l0,%l5,%l0		! %l0 = 0000000000000000
!	%l4 = ffffffffffffff6e, immed = fffff8ec, %y  = 00000000
	smulcc	%l4,-0x714,%l2		! %l2 = 0000000000040968, %ccr = 00

p1_label_52:
!	Mem[00000000158000c0] = 3213872b 668d10fb 5b831d41 ffffa0f7
	prefetcha [%i3+0x0c0]%asi,4
!	%l6 = ffffffffffffff6e, Mem[0000000015800008] = 00000002
	stba	%l6,[%i3+%o6]0x80	! Mem[0000000015800008] = 6e000002
!	%f5  = 00000000, %f8  = 3fb329b1
	fcmpes	%fcc3,%f5 ,%f8 		! %fcc3 = 1
!	%l3 = 0000000000000000, Mem[0000000032000030] = 6c86dce1
	stwa	%l3,[%o4+0x030]%asi	! Mem[0000000032000030] = 00000000
!	%l4 = ffffffffffffff6e, Mem[0000000015800000] = 00950000
	stwa	%l4,[%i3+%g0]0x80	! Mem[0000000015800000] = ffffff6e

p1_label_53:
	set	p1_b56,%o7
	fbue	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800000] = ffffffbe, %l6 = ffffffffffffff6e
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x038,%g2
p1_b56:
!	Registers modified during the branch to p1_far_2
!	%l2  = ffffffffffffffff
!	%l3  = 0000000000000002
!	%l6  = 0000000000000891
	membar	#Sync			! Added by membar checker (224)
!	%l0 = 0000000000000000, %l3 = 0000000000000002, %l1 = 00000000000000b1
	subccc	%l0,%l3,%l1		! %l1 = fffffffffffffffe, %ccr = 99
	ble	p1_b57			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000014000008] = ff000000, %l1 = fffffffffffffffe
	lduha	[%i0+%o6]0x80,%l1	! %l1 = 000000000000ff00
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x039,%g2
p1_b57:

p1_label_54:
	membar	#Sync			! Added by membar checker (225)
	set	p1_b58,%o7
	fbo,a,pt %fcc2,p1_near_3_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000016800000] = 2a687710, %l0 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = 000000000000002a
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x03a,%g2
p1_b58:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000000
!	%l7  = 0000000000000028
	membar	#Sync			! Added by membar checker (226)
!	%f22 = bfb329b1 614fb3ef, %f22 = bfb329b1 614fb3ef, %f2  = bfb329b1 f2d45158
	fsubd	%f22,%f22,%f2 		! %f2  = 00000000 00000000
!	Mem[0000000030800050] = d85daa51b1d316fb, %l5 = 0000000000000000
	ldx	[%o1+0x050],%l5		! %l5 = d85daa51b1d316fb
!	%l6 = 0000000000000891, %l0 = 000000000000002a, %l0 = 000000000000002a
	and	%l6,%l0,%l0		! %l0 = 0000000000000000

p1_label_55:
	bvc	p1_b59			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000040000018] = 13342835, %l2 = 0000000000000000
	ldub	[%o5+0x01a],%l2		! %l2 = 0000000000000028
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x03b,%g2
p1_b59:
	set	p1_b60,%o7
	fble	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800058] = ea2990fb, %l5 = d85daa51b1d316fb
	lduw	[%o3+0x058],%l5		! %l5 = 00000000ea2990fb
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x03c,%g2
p1_b60:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0000000000000000
!	%l2  = 0000000000000000
!	%l4  = 0000000000000891
!	%l5  = 0000013835bb3b7c
!	%l7  = fffffffffffffa4a
	membar	#Sync			! Added by membar checker (227)
!	Mem[0000000031800018] = 00000000 00000028, %l5 = 0000013835bb3b7c, %l4 = 0000000000000891
	add	%o3,0x18,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = d3c304bbf0ff7a17

p1_label_56:
!	%l0 = 0000000000000000, immed = 0000002c, %l3 = 0000000000000002
	srax	%l0,0x02c,%l3		! %l3 = 0000000000000000
!	Mem[00000000140001bc] = 886a4b97, %l4 = d3c304bbf0ff7a17
	ldswa	[%i0+0x1bc]%asi,%l4	! %l4 = ffffffff886a4b97
!	%f2  = 00000000 00000000, %f20 = e36659fc 004bc7da
	fmovd	%f2 ,%f20		! %f20 = 00000000 00000000
!	%l5 = 0000013835bb3b7c, immed = 00000138, %l1 = 000000000000ff00
	subccc	%l5,0x138,%l1		! %l1 = 0000013835bb3a44, %ccr = 00
!	%l2 = 0000000000000000, Mem[000000003180005a] = ea2990fb
	stb	%l2,[%o3+0x05a]		! Mem[0000000031800058] = ea2900fb

p1_label_57:
!	Mem[00000000148000e0] = 3fd9e459 c69f54f5 e21d28dc a3466d33
	prefetcha [%i1+0x0e0]%asi,22
	set	p1_b61,%o7
	fbe,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	%l2 = 0000000000000000, Mem[0000000015000008] = 00000000
	stwa	%l2,[%i2+%o6]0x80	! Mem[0000000015000008] = 00000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x03d,%g2
p1_b61:
	membar	#Sync			! Added by membar checker (228)
!	Mem[0000000015000000] = 00330033, %l6 = 0000000000000891
	ldsba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
	set	p1_b62,%o7
	fbule,pn %fcc3,p1_near_2_he	! Branch Taken, %fcc3 = 1

p1_label_58:
!	Mem[00000000140001a8] = 4f11f48109bfceb5, %l0 = 0000000000000000
	ldx	[%i0+0x1a8],%l0		! %l0 = 4f11f48109bfceb5
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x03e,%g2
p1_b62:
!	Registers modified during the branch to p1_near_2
!	%l1  = 000000005ae967ad
!	%l3  = 0000000000000000
!	%l4  = fffffffffffffa4a
!	%l5  = 0000000035bb3b7c
!	%l7  = 000000002404d07e
	membar	#Sync			! Added by membar checker (229)
!	Branch On Register, %l7 = 000000002404d07e
	brz,pn	%l7,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000000] = ff27318d, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
p1_b63:
	membar	#Sync			! Added by membar checker (230)
	fbuge,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l7 = 000000002404d07e, Mem[0000000014000000] = ff27318d
	stba	%l7,[%i0+%g0]0x80	! Annulled
p1_b64:

p1_label_59:
	membar	#Sync			! Added by membar checker (231)
!	%f7  = 614fb3ef, %f20 = 00000000, %f14 = 3ff00000
	fmuls	%f7 ,%f20,%f14		! %f14 = 00000000
!	Mem[0000000015000000] = 00330033 dd7f86ed, %l4 = fffffa4a, %l5 = 35bb3b7c
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000330033 00000000dd7f86ed
!	%l1 = 000000005ae967ad, Mem[0000000015000008] = 00000000
	stba	%l1,[%i2+%o6]0x80	! Mem[0000000015000008] = ad000000
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = 0ecbb46a, %l1 = 000000005ae967ad
	ldsba	[%i1+%o6]0x80,%l1	! %l1 = 000000000000000e
p1_b65:

p1_label_60:
	bvc	p1_b66			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000015000000] = 00330033, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x042,%g2
p1_b66:
	membar	#Sync			! Added by membar checker (232)
!	Denormal Floating Point Operation Nullified
	nop
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000014800000] = ffffffbe, %l1 = 000000000000000e
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 00000000ffffffbe
p1_b67:

p1_label_61:
	membar	#Sync			! Added by membar checker (233)
!	%l6 = 00000000000000ff, %l4 = 0000000000330033, %y  = 00000000
	sdivcc	%l6,%l4,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%l7 = 000000002404d07e, immed = 00000012, %l0 = 0000000000000000
	sra	%l7,0x012,%l0		! %l0 = 0000000000000901
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = 0ecbb46a26523483, %l3 = 0000000000000000
	ldxa	[%i1+%o6]0x80,%l3	! Annulled
p1_b68:
	membar	#Sync			! Added by membar checker (234)
!	Mem[0000000040000018] = 13342835, %l4 = 0000000000330033
	ldswa	[%o5+0x018]%asi,%l4	! %l4 = 0000000013342835

p1_label_62:
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 000000ff, %l7 = 2404d07e, Mem[0000000031800058] = ea2900fb 9b1d60b0
	std	%l6,[%o3+0x058]	! Annulled
p1_b69:
	membar	#Sync			! Added by membar checker (235)
	fbe,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000014800000] = 0000000e a8b5f8c5 0ecbb46a 26523483
	prefetch [%i1+0x000],2
p1_b70:
	bcs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44

p1_label_63:
!	Mem[0000000014000008] = ff000000, %l7 = 000000002404d07e
	ldsha	[%i0+%o6]0x80,%l7	! Annulled
p1_b71:
	membar	#Sync			! Added by membar checker (236)
!	%f10 = 3fb329b1 f0c2b031, %f14 = 00000000 00000000, %f24 = 70d2fb20 715fd7dc
	fmuld	%f10,%f14,%f24		! %f24 = 00000000 00000000
!	Branch On Register, %l4 = 0000000013342835
	brz,a,pt %l4,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014800080] = 3d92a06f fbb89f56 f28e37bc 018a66a2
	prefetch [%i1+0x080],2	! Annulled
p1_b72:
	membar	#Sync			! Added by membar checker (237)
	set	p1_b73,%o7
	fbe,pn	%fcc0,p1_near_1_le	! Branch Taken, %fcc0 = 0

p1_label_64:
!	Mem[0000000014000114] = fffff6e0, %l5 = 00000000dd7f86ed
	ldsh	[%i0+0x114],%l5		! %l5 = ffffffffffffffff
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x049,%g2
p1_b73:
	membar	#Sync			! Added by membar checker (238)
!	Mem[00000000150001a8] = 7e7f507a, %l4 = 0000000013342835
	swapa	[%i2+0x1a8]%asi,%l4	! %l4 = 000000007e7f507a
!	%l7 = 000000002404d07e, Mem[000000003080001c] = 26c0ff11
	stw	%l7,[%o1+0x01c]		! Mem[000000003080001c] = 2404d07e
!	%l6 = 000000ff, %l7 = 2404d07e, Mem[00000000148000b8] = 75a11059 67f764b7
	std	%l6,[%i1+0x0b8]	! Mem[00000000148000b8] = 000000ff 2404d07e
!	%l4 = 000000007e7f507a, immed = fffffbe3, %l5 = ffffffffffffffff
	andn	%l4,-0x41d,%l5		! %l5 = 0000000000000018

p1_label_65:
!	Mem[000000003100001c] = 4023c9f1, %l2 = 0000000000000000
	ldstub	[%o2+0x01c],%l2		! %l2 = 0000000000000040
	set	p1_b74,%o7
	fble	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800175] = 58a13dc7, %l4 = 000000007e7f507a
	ldstub	[%i3+0x175],%l4		! %l4 = 00000000000000a1
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x04a,%g2
p1_b74:
	membar	#Sync			! Added by membar checker (239)
!	%l5 = 0000000000000018, Mem[00000000140001f8] = a6d27423dbf8b71f
	stxa	%l5,[%i0+0x1f8]%asi	! Mem[00000000140001f8] = 0000000000000018
	be	p1_b75			! Branch Taken, %ccr = 44, CWP = 0

p1_label_66:
!	%l7 = 000000002404d07e, Mem[0000000032000000] = 237580e8c2bb115b
	stx	%l7,[%o4+0x000]		! Mem[0000000032000000] = 000000002404d07e
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x04b,%g2
p1_b75:
	membar	#Sync			! Added by membar checker (240)
!	Mem[0000000014800000] = 0000000e a8b5f8c5 0ecbb46a 26523483
	prefetch [%i1+0x000],2
!	%l4 = 000000a1, %l5 = 00000018, Mem[0000000015000120] = c7531779 6b4ad992
	std	%l4,[%i2+0x120]	! Mem[0000000015000120] = 000000a1 00000018
!	%l1 = 00000000ffffffbe, %l4 = 00000000000000a1, %l5 = 0000000000000018
	orn	%l1,%l4,%l5		! %l5 = fffffffffffffffe
!	%f27 = 00000000, %f31 = f2d45158, %f24 = 00000000
	fmuls	%f27,%f31,%f24		! %f24 = 80000000

p1_label_67:
	be,a	p1_b76			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000014800008] = 0ecbb46a, %l5 = fffffffffffffffe
	swapa	[%i1+%o6]0x80,%l5	! %l5 = 000000000ecbb46a
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x04c,%g2
p1_b76:
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000148001e0] = 8d614984 9b6fa145 4ff65d73 c151a9c7
	prefetch [%i1+0x1e0],0	! Annulled
p1_b77:
	membar	#Sync			! Added by membar checker (241)
	nop

p1_label_68:
!	%l3 = 0000000000000000, Mem[0000000015000000] = ff330033
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000015000000] = 00330033
!	Mem[0000000030800050] = 8d614984 9b6fa145, %l3 = 0000000000000000, %l1 = 00000000ffffffbe
	add	%o1,0x50,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 00000018b1d316fb
!	Branch On Register, %l5 = 000000000ecbb46a
	brlz,pn	%l5,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000031000018] = bb0bb140ff23c9f1, %l6 = 00000000000000ff
	ldx	[%o2+0x018],%l6		! %l6 = bb0bb140ff23c9f1
p1_b78:
	membar	#Sync			! Added by membar checker (242)
!	Branch On Register, %l3 = 0000000000000000
	brgez,a,pt %l3,p1_b79		! Branch Taken

p1_label_69:
!	%l7 = 000000002404d07e, Mem[0000000014800008] = fffffffe26523483
	stxa	%l7,[%i1+%o6]0x80	! Mem[0000000014800008] = 000000002404d07e
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x04f,%g2
p1_b79:
	set	p1_b80,%o7
	fbe	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800008] = 00000000, %l1 = 00000018b1d316fb
	lduwa	[%i1+%o6]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x050,%g2
p1_b80:
	membar	#Sync			! Added by membar checker (243)
!	%l5 = 000000000ecbb46a, immed = fffffacd, %l4 = 00000000000000a1
	andncc	%l5,-0x533,%l4		! %l4 = 0000000000000422, %ccr = 00
	bg	p1_b81			! Branch Taken, %ccr = 00, CWP = 0

p1_label_70:
!	Mem[0000000015800180] = bf9c1c88 2c35a91a 42420ecb b5616af6
	prefetch [%i3+0x180],3
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x051,%g2
p1_b81:
	membar	#Sync			! Added by membar checker (244)
!	Mem[00000000158001a4] = 744309b9, %l6 = bb0bb140ff23c9f1
	lduba	[%i3+0x1a7]%asi,%l6	! %l6 = 00000000000000b9
	bpos,a	p1_b82			! Branch Taken, %ccr = 00, CWP = 0
!	%l6 = 00000000000000b9, Mem[0000000015000168] = 62390e3b6ed7cec1
	stx	%l6,[%i2+0x168]		! Mem[0000000015000168] = 00000000000000b9
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x052,%g2
p1_b82:
	membar	#Sync			! Added by membar checker (245)
!	%f20 = 00000000, %f3  = 00000000
	fcmps	%fcc1,%f20,%f3 		! %fcc1 = 0

p1_label_71:
	nop				! Delay added due to fcmp
	fbe,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l2 = 0000000000000040, Mem[0000000016800000] = 2a687710
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000016800000] = 00407710
p1_b83:
	membar	#Sync			! Added by membar checker (246)
!	%f22 = bfb329b1 614fb3ef, %f28 = f05d1dd0 38590ced
	fnegd	%f22,%f28		! %f28 = 3fb329b1 614fb3ef
!	Mem[000000003080001c] = 2404d07e, %l3 = 0000000000000000
	lduha	[%o1+0x01c]%asi,%l3	! %l3 = 0000000000002404
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_72:
!	Mem[00000000158001bc] = 5ae967ad, %l4 = 0000000000000422
	ldsh	[%i3+0x1be],%l4		! %l4 = 00000000000067ad
p1_b84:
	membar	#Sync			! Added by membar checker (247)
	set	p1_b85,%o7
	fbge,a,pn %fcc1,p1_near_3_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000014000008] = ff000000 000003ff, %l0 = 00000901, %l1 = 00000000
	ldda	[%i0+%o6]0x80,%l0	! %l0 = 00000000ff000000 00000000000003ff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x055,%g2
p1_b85:
!	Registers modified during the branch to p1_near_3
!	%l1  = 000000002404d07e
!	%l3  = ffffffffece20b76
!	%l5  = 00000000000000b9
	membar	#Sync			! Added by membar checker (248)
!	%f2  = 00000000 00000000, %f14 = 00000000 00000000
	fxtod	%f2 ,%f14		! %f14 = 00000000 00000000
!	Mem[00000000148000e0] = 3fd9e459 c69f54f5 e21d28dc a3466d33
	prefetch [%i1+0x0e0],3

p1_label_73:
!	Branch On Register, %l3 = ffffffffece20b76
	brnz,pt	%l3,p1_b86		! Branch Taken
!	%l6 = 00000000000000b9, Mem[00000000140000b8] = c313a2a4c6bb4e05
	stx	%l6,[%i0+0x0b8]		! Mem[00000000140000b8] = 00000000000000b9
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x056,%g2
p1_b86:
	set	p1_b87,%o7
	fbule	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000120] = 4160dd73 c00a91e9 db6a74e8 43e9a396
	prefetch [%i0+0x120],2
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x057,%g2
p1_b87:
	membar	#Sync			! Added by membar checker (249)
!	Mem[000000001580015d] = 73de3112, %l0 = 00000000ff000000
	ldstub	[%i3+0x15d],%l0		! %l0 = 00000000000000de

p1_label_74:
!	Mem[0000000030800058] = 5d2fceb2, %l5 = 00000000000000b9
	lduba	[%o1+0x05a]%asi,%l5	! %l5 = 00000000000000ce
!	%l7 = 000000002404d07e, immed = 0000038e, %y  = 00000000
	mulx	%l7,0x38e,%l6		! %l6 = 00000080091d1fe4
!	%l2 = 0000000000000040, immed = 00000721, %l4 = 00000000000067ad
	add	%l2,0x721,%l4		! %l4 = 0000000000000761
!	%l3 = ffffffffece20b76, immed = fffff0f9, %l6 = 00000080091d1fe4
	subccc	%l3,-0xf07,%l6		! %l6 = ffffffffece21a7d, %ccr = 99
!	%l3 = ffffffffece20b76, immed = fffff664, %l7 = 000000002404d07e
	orncc	%l3,-0x99c,%l7		! %l7 = ffffffffece20bff, %ccr = 88

p1_label_75:
!	Mem[0000000015000000] = 00330033, %l7 = ffffffffece20bff
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	 Annulled
	ldd	[%o3+0x018],%l0
p1_b88:
	membar	#Sync			! Added by membar checker (250)
!	%l1 = 000000002404d07e, immed = fffff737, %l3 = ffffffffece20b76
	andn	%l1,-0x8c9,%l3		! %l3 = 0000000000000048
!	Mem[0000000031800058] = ea2900fb 9b1d60b0, %l4 = 00000761, %l5 = 000000ce
	ldda	[%o3+0x058]%asi,%l4	! %l4 = 00000000ea2900fb 000000009b1d60b0

p1_label_76:
	nop
!	%f21 = 00000000, %f27 = 00000000
	fitos	%f21,%f27		! %f27 = 00000000
	nop
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800000] = ffffff6e, %l6 = ffffffffece21a7d
	ldstuba	[%i3+%g0]0x80,%l6	! Annulled
p1_b89:

p1_label_77:
	membar	#Sync			! Added by membar checker (251)
!	%l2 = 0000000000000040, %l2 = 0000000000000040, %l5 = 000000009b1d60b0
	or	%l2,%l2,%l5		! %l5 = 0000000000000040
!	%l0 = 00000000000000de, %l6 = ffffffffece21a7d, %y  = 00000000
	udivcc	%l0,%l6,%l6		! %l6 = 0000000000000000, %ccr = 44
!	%f2  = 00000000, %f17 = 8ad82340, %f1  = b58187b0
	fadds	%f2 ,%f17,%f1 		! %f1  = 8ad82340
!	Mem[0000000014800008] = 00000000, %l4 = 00000000ea2900fb
	lduba	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
!	%f20 = 00000000, %f10 = 3fb329b1 f0c2b031
	fstox	%f20,%f10		! %f10 = 00000000 00000000

p1_label_78:
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],0
!	%f4  = c65a8a2b 00000000, %f24 = 80000000 00000000
	fcmpd	%fcc2,%f4 ,%f24		! %fcc2 = 1
!	Mem[0000000014000000] = ff27318d, %l0 = 00000000000000de
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff27318d
!	%f6  = 00000000 614fb3ef, %f16 = 00000001 8ad82340
	fmovd	%f6 ,%f16		! %f16 = 00000000 614fb3ef
!	%l3 = 0000000000000048, immed = 00000f6e, %l3 = 0000000000000048
	orn	%l3,0xf6e,%l3		! %l3 = fffffffffffff0d9

p1_label_79:
!	%f24 = 80000000 00000000, %f20 = 00000000
	fdtoi	%f24,%f20		! %f20 = 00000000
!	%l6 = 0000000000000000, %l1 = 000000002404d07e, %l2 = 0000000000000040
	orncc	%l6,%l1,%l2		! %l2 = ffffffffdbfb2f81, %ccr = 88
!	call to call_2, CWP = 0
	call	p1_call_2_le
!	Mem[0000000014800000] = 0000000e a8b5f8c5 00000000 2404d07e
	prefetch [%i1+0x000],20
!	Registers modified during the branch to p1_call_2
!	%l0  = 00000000ff27380f
!	%l2  = ffffffffffffffff
!	%l3  = 0000000000000ef0
!	%l4  = 0000000000000000
!	%l6  = 0000000000000ef0
!	%l7  = ffffffff80000000
	set	p1_b90,%o7
	fbo,pt	%fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 1

p1_label_80:
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],21
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x05a,%g2
p1_b90:
!	Registers modified during the branch to p1_near_0
!	%l0  = ffffffffdbfb2f81
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (252)
!	%l7 = ffffffff80000000
	sethi	%hi(0xb3e03000),%l7	! %l7 = 00000000b3e03000
!	%l0 = ffffffffdbfb2f81, Mem[0000000030000058] = 0980455ffcb43a29
	stx	%l0,[%o0+0x058]		! Mem[0000000030000058] = ffffffffdbfb2f81
	set	p1_b91,%o7
	fble,pt	%fcc2,p1_near_2_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000030800058] = 5d2fceb2, %l2 = 0000000000000000
	lduw	[%o1+0x058],%l2		! %l2 = 000000005d2fceb2
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x05b,%g2
p1_b91:
!	Registers modified during the branch to p1_near_2
!	%l0  = ffffffffb7f65f03
!	%l3  = fffffffffffffbda
!	%l4  = 0000000000000eb0
!	%l7  = 000000004809ac36

p1_label_81:
	bpos,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l7 = 000000004809ac36, Mem[0000000032000066] = 86ed0362
	sth	%l7,[%o4+0x066]		! Annulled
p1_b92:
	membar	#Sync			! Added by membar checker (253)
!	%l2 = 000000005d2fceb2, immed = 00000ccf, %y  = 00000451
	udivcc	%l2,0xccf,%l4		! %l4 = 00000000564c7298, %ccr = 00
!	Mem[0000000015000180] = ecc1faaf bb4c7b29 1e46eaac 4ac64607
	prefetch [%i2+0x180],22
!	%f24 = 80000000 00000000, %f9  = 614fb3ef
	fdtos	%f24,%f9 		! %f9  = 80000000

p1_label_82:
	bgu	p1_b93			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000014000000] = ff27318d, %l0 = ffffffffb7f65f03
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 000000000000ff27
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x05d,%g2
p1_b93:
	membar	#Sync			! Added by membar checker (254)
!	%l2 = 000000005d2fceb2, Mem[000000004000001c] = 31000214
	sth	%l2,[%o5+0x01c]		! Mem[000000004000001c] = ceb20214
	set	p1_b94,%o7
	fbuge	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000048] = 1a0e3b04, %l3 = fffffffffffffbda
	ldub	[%o4+0x049],%g2		! %g2 = 000000000000001a
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x05e,%g2
p1_b94:
!	Registers modified during the branch to p1_far_3
!	%l7  = 000000000000005c

p1_label_83:
	membar	#Sync			! Added by membar checker (255)
	fbu,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000015000008] = ad000000, %l5 = 0000000000000040
	ldswa	[%i2+%o6]0x80,%l5	! Annulled
p1_b95:
	membar	#Sync			! Added by membar checker (256)
!	Mem[0000000031800058] = ea2900fb9b1d60b0, %l7 = 000000000000005c
	ldx	[%o3+0x058],%l7		! %l7 = ea2900fb9b1d60b0
!	%l6 = 0000000000000ef0, immed = fffffd3d, %y  = 00000451
	sdiv	%l6,-0x2c3,%l2		! %l2 = ffffffff80000000
!	Mem[00000000140000d4] = 7e78c214, %l0 = 000000000000ff27
	swapa	[%i0+0x0d4]%asi,%l0	! %l0 = 000000007e78c214

p1_label_84:
	set	p1_b96,%o7
	fbge,pt	%fcc1,p1_near_3_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000015800000] = ffffff6e, %l2 = ffffffff80000000
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x060,%g2
p1_b96:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000001000
!	%l7  = ffffffff818739ce
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031800058] = ea2900fb9b1d60b0, %l6 = 0000000000000ef0
	ldx	[%o3+0x058],%l6		! %l6 = ea2900fb9b1d60b0
p1_b97:
	membar	#Sync			! Added by membar checker (257)
!	%l2 = 0000000000001000, immed = 00000172, %l1 = 000000002404d07e
	addcc	%l2,0x172,%l1		! %l1 = 0000000000001172, %ccr = 00

p1_label_85:
!	%l1 = 0000000000001172, immed = 00000730, %l5 = 0000000000000040
	tsubcc	%l1,0x730,%l5		! %l5 = 0000000000000a42, %ccr = 02
	bl	p1_b98			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[00000000140000cf] = a3cf9282, %l0 = 000000007e78c214
	ldstub	[%i0+0x0cf],%l0		! %l0 = 0000000000000082
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x062,%g2
p1_b98:
	membar	#Sync			! Added by membar checker (258)
	fbug,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[00000000158001f8] = df69fe87, %l6 = ea2900fb9b1d60b0
	ldsb	[%i3+0x1fb],%l6		! %l6 = ffffffffffffff87
p1_b99:

p1_label_86:
	membar	#Sync			! Added by membar checker (259)
!	Mem[0000000015000008] = ad000000, %l5 = 0000000000000a42
	lduha	[%i2+%o6]0x80,%l5	! %l5 = 000000000000ad00
!	%l4 = 00000000564c7298
	setx	0x5169192151691921,%g7,%l4 ! %l4 = 5169192151691921
!	%l1 = 0000000000001172, immed = 00000415, %l4 = 5169192151691921
	xorcc	%l1,0x415,%l4		! %l4 = 0000000000001567, %ccr = 00
!	%f14 = 00000000, %f11 = 00000000, %f5  = 00000000
	fsubs	%f14,%f11,%f5 		! %f5  = 00000000
!	%l4 = 0000000000001567, %l5 = 000000000000ad00, %l6 = ffffffffffffff87
	sra	%l4,%l5,%l6		! %l6 = 0000000000001567

p1_label_87:
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000008] = ad000000, %l6 = 0000000000001567
	ldstuba	[%i2+%o6]0x80,%l6	! Annulled
p1_b100:
	membar	#Sync			! Added by membar checker (260)
!	Mem[00000000150001e0] = 58800cfc, %l0 = 0000000000000082
	lduw	[%i2+0x1e0],%l0		! %l0 = 0000000058800cfc
!	%l6 = 0000000000001567, Mem[000000003000005c] = dbfb2f81
	stba	%l6,[%o0+0x05c]%asi	! Mem[000000003000005c] = 67fb2f81
!	%l5 = 000000000000ad00, immed = ffffff39, %l5 = 000000000000ad00
	orn	%l5,-0x0c7,%l5		! %l5 = 000000000000adc6

p1_label_88:
!	%l5 = 000000000000adc6, Mem[0000000032000058] = d1b4bc7ca73b551a
	stx	%l5,[%o4+0x058]		! Mem[0000000032000058] = 000000000000adc6
!	%l7 = ffffffff818739ce, immed = 00000a36, %l3 = fffffffffffffbda
	orn	%l7,0xa36,%l3		! %l3 = fffffffffffffdcf
!	%l1 = 0000000000001172, immed = fffff416, %y  = 00000000
	mulx	%l1,-0xbea,%l2		! %l2 = ffffffffff3027cc
!	Jump to jmpl_1, CWP = 0
	set	p1_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000015000000] = 00330033, %l0 = 0000000058800cfc
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000033
!	Registers modified during the branch to p1_jmpl_1
!	%l0  = 000000003d92a06f
!	%l1  = 0000000029fae095
!	%l3  = 0000000014ae73a2

p1_label_89:
!	Mem[0000000030000058] = ffffffff, %l5 = 000000000000adc6
	ldstub	[%o0+0x058],%l5		! %l5 = 00000000000000ff
!	%l3 = 0000000014ae73a2, immed = 00000d9e, %l1 = 0000000029fae095
	or	%l3,0xd9e,%l1		! %l1 = 0000000014ae7fbe
	set	p1_b101,%o7
	fbue,a,pt %fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000015000140] = d170355f a49d159a 5bef1687 0fee60ca
	prefetch [%i2+0x140],16
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x065,%g2
p1_b101:
!	Registers modified during the branch to p1_near_2
!	%l1  = 000000005ae967ad
!	%l3  = ffffffffeb100040
!	%l4  = ffffffff82571202
!	%l5  = 00000000000000b9
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (261)
!	%l4 = ffffffff82571202, %l6 = 0000000000001567, %l5 = 00000000000000b9
	orcc	%l4,%l6,%l5		! %l5 = ffffffff82571767, %ccr = 88

p1_label_90:
!	Mem[0000000015800020] = 0871ae5e, %l3 = ffffffffeb100040
	ldsh	[%i3+0x020],%l3		! %l3 = 0000000000000871
!	Mem[0000000015800008] = 6e000002, %l5 = ffffffff82571767
	ldsha	[%i3+%o6]0x80,%l5	! %l5 = 0000000000006e00
!	%l5 = 0000000000006e00, Mem[000000003080005c] = 38015d69
	stw	%l5,[%o1+0x05c]		! Mem[000000003080005c] = 00006e00
!	%f22 = bfb329b1, %f4  = c65a8a2b 00000000
	fstod	%f22,%f4 		! %f4  = bff66536 20000000
!	Mem[0000000014000008] = ff000000, %l2 = ffffffffff3027cc
	ldswa	[%i0+%o6]0x80,%l2	! %l2 = ffffffffff000000

p1_label_91:
!	%l5 = 0000000000006e00, immed = 0000001c, %l3 = 0000000000000871
	sra	%l5,0x01c,%l3		! %l3 = 0000000000000000
!	%f24 = 80000000, %f12 = 7beee063 0c87130b
	fstox	%f24,%f12		! %f12 = 00000000 00000000
!	Mem[0000000031000057] = 29fae095, %l7 = 0000000000000000
	ldstuba	[%o2+0x057]%asi,%l7	! %l7 = 0000000000000095
	fblg,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 3d92a06f, %l1 = 5ae967ad, Mem[0000000014800008] = 00000000 2404d07e
	stda	%l0,[%i1+%o6]0x80	! Mem[0000000014800008] = 3d92a06f 5ae967ad
p1_b102:

p1_label_92:
	membar	#Sync			! Added by membar checker (262)
!	%l2 = ffffffffff000000, %l6 = 0000000000001567, %y  = 00000000
	sdivcc	%l2,%l6,%l2		! %l2 = 00000000000bea22, %ccr = 00
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l1 = 000000005ae967ad, Mem[0000000014800000] = 0000000e
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000014800000] = 5ae967ad
p1_b103:
	membar	#Sync			! Added by membar checker (263)
!	Mem[00000000158000f8] = ffffffff, %l4 = ffffffff82571202
	ldub	[%i3+0x0fb],%l4		! %l4 = 00000000000000ff
!	Branch On Register, %l5 = 0000000000006e00
	brgez,pn %l5,p1_b104		! Branch Taken

p1_label_93:
!	Mem[00000000148000e0] = 3fd9e459 c69f54f5 e21d28dc a3466d33
	prefetch [%i1+0x0e0],21
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x068,%g2
p1_b104:
	membar	#Sync			! Added by membar checker (264)
!	%l3 = 0000000000000000, %l0 = 000000003d92a06f, %l4 = 00000000000000ff
	taddcc	%l3,%l0,%l4		! %l4 = 000000003d92a06f, %ccr = 02
!	Mem[0000000014800010] = 624b6e2f, %l5 = 0000000000006e00
	ldsw	[%i1+0x010],%l5		! %l5 = 00000000624b6e2f
!	Mem[0000000014800000] = 5ae967ad, %l2 = 00000000000bea22
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = 000000005ae967ad
!	Mem[0000000032000010] = 0384c640 925b55a5, %l2 = 5ae967ad, %l3 = 00000000
	ldd	[%o4+0x010],%g2		! %l2 = 000000005ae967ad 0000000000000000

p1_label_94:
!	Mem[0000000030800010] = f3b9d630 ff4efb6c, %l0 = 3d92a06f, %l1 = 5ae967ad
	ldd	[%o1+0x010],%l0		! %l0 = 00000000f3b9d630 00000000ff4efb6c
!	call to call_2, CWP = 0
	call	p1_call_2_he
!	Mem[0000000014000008] = ff000000, %l2 = 000000005ae967ad
	ldstuba	[%i0+%o6]0x80,%l2	! %l2 = 00000000000000ff
!	Registers modified during the branch to p1_call_2
!	%l1  = 00000000ff4efb64
!	%l4  = 0000000000000000
!	%l5  = 00000000bb0bb140
!	%l7  = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000014800008] = 3d92a06f
	stha	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = 0000a06f
!	Mem[0000000014800008] = 0000a06f5ae967ad, %l4 = 0000000000000000
	ldxa	[%i1+%o6]0x80,%l4	! %l4 = 0000a06f5ae967ad

p1_label_95:
!	Mem[0000000031800018] = ff000000 000000ff, %l0 = 00000000f3b9d630, %l5 = 00000000bb0bb140
	add	%o3,0x18,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = d3c304bbf0ff7a17
!	%f12 = 00000000, %f9  = 80000000
	fitos	%f12,%f9 		! %f9  = 00000000
!	%l1 = 00000000ff4efb64, Mem[0000000015800008] = 6e000002
	stba	%l1,[%i3+%o6]0x80	! Mem[0000000015800008] = 64000002
!	%f4  = bff66536 20000000, %f28 = 3fb329b1 614fb3ef
	fcmped	%fcc3,%f4 ,%f28		! %fcc3 = 1
!	Mem[0000000032000070] = 776735ebcf9aa2f9, %l3 = 0000000000000000
	ldx	[%o4+0x070],%g2		! %g2 = 776735ebcf9aa2f9

p1_label_96:
	ba,a	p1_b105			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000032000040] = 9270504b0b09b218, %l1 = 00000000ff4efb64
	ldx	[%o4+0x040],%g2		! Annulled
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x069,%g2
p1_b105:
	membar	#Sync			! Added by membar checker (265)
	nop
!	Branch On Register, %l2 = 00000000000000ff
	brgez,pn %l2,p1_b106		! Branch Taken
!	Mem[0000000015000000] = 00330033, %l4 = 0000a06f5ae967ad
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000033
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x06a,%g2
p1_b106:

p1_label_97:
	membar	#Sync			! Added by membar checker (266)
!	Mem[0000000030800058] = 5d2fceb2 00006e00, %l6 = 00001567, %l7 = 00000000
	ldd	[%o1+0x058],%l6		! %l6 = 000000005d2fceb2 0000000000006e00
!	%l3 = 0000000000000000, immed = 000001a3, %y  = 00000000
	sdivcc	%l3,0x1a3,%l2		! %l2 = 0000000000000000, %ccr = 44
!	Jump to jmpl_1, CWP = 0
	set	p1_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	%l6 = 000000005d2fceb2, Mem[0000000015000008] = ad000000
	stha	%l6,[%i2+%o6]0x80	! Mem[0000000015000008] = ceb20000
!	Registers modified during the branch to p1_jmpl_1
!	%l0  = 000000003d92a06f
!	%l1  = 0000000029fae0ff
!	%l3  = 00000000fffffdcf
	set	p1_b107,%o7
	fbe,a,pt %fcc0,p1_near_3_le	! Branch Taken, %fcc0 = 0

p1_label_98:
!	%l7 = 0000000000006e00, Mem[0000000015800058] = 43c8c6b4
	stw	%l7,[%i3+0x058]		! Mem[0000000015800058] = 00006e00
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x06b,%g2
p1_b107:
!	Registers modified during the branch to p1_near_3
!	%l2  = 00e10fb1940bee11
!	%l7  = 00000000c26d5da0
!	call to call_2, CWP = 0
	call	p1_call_2_he
!	%l0 = 3d92a06f, %l1 = 29fae0ff, Mem[0000000032000060] = 2432adfc dd7f86ed
	std	%l0,[%o4+0x060]	! Mem[0000000032000060] = 3d92a06f 29fae0ff
!	Registers modified during the branch to p1_call_2
!	%l1  = 0000000029fae074
!	%l4  = 000000000000ba5f
!	%l5  = 00000000bb0bb140
!	%l7  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (267)
!	Mem[0000000015000180] = ecc1faaf bb4c7b29 1e46eaac 4ac64607
	prefetcha [%i2+0x180]%asi,1
!	Mem[00000000140000e8] = 50978f60 01644970, %l4 = 0000ba5f, %l5 = bb0bb140
	ldda	[%i0+0x0e8]%asi,%l4	! %l4 = 0000000050978f60 0000000001644970

p1_label_99:
!	Mem[0000000016000178] = ec7bb45d 00e63136, %l0 = 3d92a06f, %l1 = 29fae074
	ldd	[%i4+0x178],%l0		! %l0 = 00000000ec7bb45d 0000000000e63136
	fbu,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 00000000ec7bb45d, Mem[00000000158001ff] = f82d6482
	stb	%l0,[%i3+0x1ff]		! Mem[00000000158001fc] = f82d645d
p1_b108:
	bleu,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000015800120] = dfa4ac1f, %l4 = 0000000050978f60
	ldub	[%i3+0x121],%l4		! Annulled
p1_b109:

p1_label_100:
	membar	#Sync			! Added by membar checker (268)
!	%l3 = 00000000fffffdcf, immed = 0000041c, %y  = 00e10fb1
	smulcc	%l3,0x41c,%l4		! %l4 = fffffffffff6fea4, %ccr = 88
!	Mem[00000000140001dc] = 7eddf6f5, %l4 = fffffffffff6fea4
	ldswa	[%i0+0x1dc]%asi,%l4	! %l4 = 000000007eddf6f5
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000014000000] = ff27318d64fd9b9d, %l2 = 00e10fb1940bee11
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = ff27318d64fd9b9d
p1_b110:
	membar	#Sync			! Added by membar checker (269)
!	%l6 = 000000005d2fceb2, Mem[0000000031800010] = 8443bc6c7a514d2f
	stx	%l6,[%o3+0x010]		! Mem[0000000031800010] = 000000005d2fceb2

p1_label_101:
	set	p1_b111,%o7
	fba,pt	%fcc0,p1_near_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800050] = 1231093f39f296f9, %l3 = 00000000fffffdcf
	ldx	[%i1+0x050],%l3		! %l3 = 1231093f39f296f9
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x06f,%g2
p1_b111:
!	Registers modified during the branch to p1_near_2
!	%l0  = 00000000eb958327
!	%l3  = fffffffffe9bb2ea
!	%l4  = 1221010d20f09299
!	%l7  = ffffffff146a7012
	membar	#Sync			! Added by membar checker (270)
!	Mem[0000000031800054] = eb33041d, %l2 = ff27318d64fd9b9d
	ldswa	[%o3+0x054]%asi,%l2	! %l2 = ffffffffeb33041d

	ba,a	p1_not_taken_0_end
p1_not_taken_0:
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba,a	p1_branch_failed
p1_not_taken_0_end:

	nop
!	Mem[0000000015000000] = 00330033, %l2 = ffffffffeb33041d
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000033

p1_label_102:
!	%l2 = 0000000000000033, %l4 = 1221010d20f09299, %l1 = 0000000000e63136
	xnor	%l2,%l4,%l1		! %l1 = eddefef2df0f6d55
!	Mem[00000000150000a8] = a7684b98, %l6 = 000000005d2fceb2
	swapa	[%i2+0x0a8]%asi,%l6	! %l6 = 00000000a7684b98
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000028] = 8dffcd02, %l1 = eddefef2df0f6d55
	lduw	[%o4+0x028],%g2		! Annulled
p1_b112:
	bleu,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88

p1_label_103:
!	Mem[0000000015800000] = ffffff6e, %l5 = 0000000001644970
	lduwa	[%i3+%g0]0x80,%l5	! Annulled
p1_b113:
	membar	#Sync			! Added by membar checker (271)
!	Mem[0000000015000180] = ecc1faaf, %l6 = 00000000a7684b98
	swap	[%i2+0x180],%l6		! %l6 = 00000000ecc1faaf
	fbg,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[00000000150001c0] = b73ed785 f346aa0b da2e844a 4bb7b2a6
	prefetch [%i2+0x1c0],16	! Annulled
p1_b114:
	membar	#Sync			! Added by membar checker (272)
!	%l6 = 00000000ecc1faaf, %l4 = 1221010d20f09299, %l5 = 0000000001644970
	andcc	%l6,%l4,%l5		! %l5 = 0000000020c09289, %ccr = 00

p1_label_104:
!	%l3 = fffffffffe9bb2ea, %l5 = 0000000020c09289, %l5 = 0000000020c09289
	or	%l3,%l5,%l5		! %l5 = fffffffffedbb2eb
!	Mem[0000000015000100] = 4c18e2e9 dbfa6374 7b64018c 5e4bff44
	prefetcha [%i2+0x100]%asi,16
!	Branch On Register, %l5 = fffffffffedbb2eb
	brlez,pt %l5,p1_b115		! Branch Taken
!	%l7 = ffffffff146a7012, Mem[0000000031000018] = bb0bb140
	stw	%l7,[%o2+0x018]		! Mem[0000000031000018] = 146a7012
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x073,%g2
p1_b115:
	set	p1_b116,%o7
	fbue,a	p1_far_1_le	! Branch Taken, %fcc0 = 0

p1_label_105:
!	Mem[000000001680018c] = 8b09deff, %l3 = fffffffffe9bb2ea
	ldub	[%i5+0x18e],%l3		! %l3 = 00000000000000de
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x074,%g2
p1_b116:
	bgu,a	p1_b117			! Branch Taken, %ccr = 00, CWP = 0
!	%l6 = 00000000ecc1faaf, Mem[0000000031800010] = 00000000
	stw	%l6,[%o3+0x010]		! Mem[0000000031800010] = ecc1faaf
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x075,%g2
p1_b117:
	membar	#Sync			! Added by membar checker (273)
!	%l6 = 00000000ecc1faaf, immed = 0000048b, %l3 = 00000000000000de
	andn	%l6,0x48b,%l3		! %l3 = 00000000ecc1fa24
!	%l4 = 1221010d20f09299, Mem[0000000032000058] = 000000000000adc6
	stx	%l4,[%o4+0x058]		! Mem[0000000032000058] = 1221010d20f09299

p1_label_106:
!	Mem[0000000015800008] = 64000002, %l5 = fffffffffedbb2eb
	ldsba	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000064
!	%l7 = ffffffff146a7012, %l1 = eddefef2df0f6d55, %l1 = eddefef2df0f6d55
	or	%l7,%l1,%l1		! %l1 = ffffffffdf6f7d57
!	%f8  = 3fb329b1 00000000, %f28 = 3fb329b1 614fb3ef
	fcmpd	%fcc3,%f8 ,%f28		! %fcc3 = 1
!	%l4 = 1221010d20f09299, %l0 = 00000000eb958327, %l0 = 00000000eb958327
	addc	%l4,%l0,%l0		! %l0 = 1221010e0c8615c0
!	%l1 = ffffffffdf6f7d57, Mem[0000000031000058] = fd9430c8aded68e8
	stxa	%l1,[%o2+0x058]%asi	! Mem[0000000031000058] = ffffffffdf6f7d57

p1_label_107:
!	Mem[0000000015800008] = 64000002, %l5 = 0000000000000064
	ldstuba	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000064
	bcs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000014800080] = 3d92a06f fbb89f56 f28e37bc 018a66a2
	prefetch [%i1+0x080],2	! Annulled
p1_b118:
	membar	#Sync			! Added by membar checker (274)
!	%f30 = 614fb3ef f2d45158, %f14 = 00000000 00000000, %f28 = 3fb329b1 614fb3ef
	fmuld	%f30,%f14,%f28		! %f28 = 00000000 00000000
	fbn,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1

p1_label_108:
!	Mem[0000000030000058] = ffffffff67fb2f81, %l3 = 00000000ecc1fa24
	ldx	[%o0+0x058],%l3		! Annulled
p1_b119:
	membar	#Sync			! Added by membar checker (275)
!	%l6 = 00000000ecc1faaf, %l0 = 1221010e0c8615c0, %y  = ffffffff
	smul	%l6,%l0,%l5		! %l5 = ff0f03a6e6a65e40
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800000] = ffffff6e, %l3 = 00000000ecc1fa24
	lduha	[%i3+%g0]0x80,%l3	! Annulled
p1_b120:
	membar	#Sync			! Added by membar checker (276)
!	Mem[0000000015800028] = 18a880ed, %l2 = 0000000000000033
	ldsb	[%i3+0x028],%l2		! %l2 = 0000000000000018

p1_label_109:
!	%f12 = 00000000, %f20 = 00000000 00000000
	fitod	%f12,%f20		! %f20 = 00000000 00000000
!	%f24 = 80000000 00000000, %f14 = 00000000 00000000
	fnegd	%f24,%f14		! %f14 = 00000000 00000000
	fbe,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l0 = 1221010e0c8615c0, Mem[0000000031000050] = 3d92a06f
	sth	%l0,[%o2+0x050]		! Mem[0000000031000050] = 15c0a06f
p1_b121:
	membar	#Sync			! Added by membar checker (277)
!	%f4  = bff66536 20000000, %f30 = 614fb3ef f2d45158
	fcmpd	%fcc1,%f4 ,%f30		! %fcc1 = 1

p1_label_110:
!	Mem[0000000030000058] = ffffffff, %l2 = 0000000000000018
	ldsha	[%o0+0x05a]%asi,%l2	! %l2 = ffffffffffffffff
!	%f10 = 00000000, %f13 = 00000000
	fstoi	%f10,%f13		! %f13 = 00000000
!	Mem[0000000031800014] = 5d2fceb2, %l3 = 00000000ecc1fa24
	lduw	[%o3+0x014],%l3		! %l3 = 000000005d2fceb2
	set	p1_b122,%o7
	fbge,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000000] = ff27318d, %l5 = ff0f03a6e6a65e40
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 000000000000ff27
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x07a,%g2
p1_b122:
!	Registers modified during the branch to p1_far_3
!	%l7  = 000000000000005c

p1_label_111:
	membar	#Sync			! Added by membar checker (278)
!	%l0 = 0c8615c0, %l1 = df6f7d57, Mem[0000000032000028] = 8dffcd02 e27389fa
	stda	%l0,[%o4+0x028]%asi	! Mem[0000000032000028] = 0c8615c0 df6f7d57
!	%l4 = 1221010d20f09299, %l5 = 000000000000ff27, %l3 = 000000005d2fceb2
	andn	%l4,%l5,%l3		! %l3 = 1221010d20f00098
!	%f26 = 00000000 00000000, %f18 = 00000000 00000001
	fdtox	%f26,%f18		! %f18 = 00000000 00000000
!	%l2 = ffffffffffffffff, %l1 = ffffffffdf6f7d57, %y  = ff0f03a6
	sdiv	%l2,%l1,%l4		! %l4 = 0000000007667777
!	%f7  = 614fb3ef, %f16 = 00000000, %f4  = bff66536
	fadds	%f7 ,%f16,%f4 		! %f4  = 614fb3ef

p1_label_112:
!	%l5 = 000000000000ff27
	sethi	%hi(0x966c2400),%l5	! %l5 = 00000000966c2400
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000030800014] = ff4efb6c, %l1 = ffffffffdf6f7d57
	ldsw	[%o1+0x014],%l1		! %l1 = ffffffffff4efb6c
!	Registers modified during the branch to p1_jmpl_0
!	%l5  = 00000000000000ff
!	%l6  = ffffffffffffffff
!	%l5 = 00000000000000ff, %l4 = 0000000007667777, %y  = ff0f03a6
	sdiv	%l5,%l4,%l5		! %l5 = ffffffffdf6f7d35
!	%l0 = 0c8615c0, %l1 = ff4efb6c, Mem[0000000031800010] = ecc1faaf 5d2fceb2
	stda	%l0,[%o3+0x010]%asi	! Mem[0000000031800010] = 0c8615c0 ff4efb6c

p1_label_113:
!	%l4 = 0000000007667777, Mem[000000001580014e] = 4340096c
	sth	%l4,[%i3+0x14e]		! Mem[000000001580014c] = 43407777
	fbu,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800000] = 5ae967ad, %l0 = 1221010e0c8615c0
	ldsha	[%i1+%g0]0x80,%l0	! Annulled
p1_b123:
	membar	#Sync			! Added by membar checker (279)
!	%l7 = 000000000000005c, immed = 00000b7d, %l2 = ffffffffffffffff
	taddcc	%l7,0xb7d,%l2		! %l2 = 0000000000000bd9, %ccr = 02
	fbn,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_114:
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 0c8615c0 df6f7d57
	prefetch [%o4+0x020],3
p1_b124:
	membar	#Sync			! Added by membar checker (280)
!	Mem[0000000015000008] = ceb20000, %l3 = 1221010d20f00098
	ldstuba	[%i2+%o6]0x80,%l3	! %l3 = 00000000000000ce
!	%l4 = 0000000007667777, immed = 00000027, %l2 = 0000000000000bd9
	srax	%l4,0x027,%l2		! %l2 = 0000000000000000
!	%l0 = 1221010e0c8615c0, %l3 = 00000000000000ce, %y  = ff0f03a6
	umul	%l0,%l3,%l7		! %l7 = 0000000a13e58080
!	%f26 = 00000000 00000000, %f12 = 00000000 00000000, %f28 = 00000000 00000000
	faddd	%f26,%f12,%f28		! %f28 = 00000000 00000000

p1_label_115:
!	%l1 = ffffffffff4efb6c, Mem[0000000014000008] = ff000000
	stwa	%l1,[%i0+%o6]0x80	! Mem[0000000014000008] = ff4efb6c
!	%f26 = 00000000, %f22 = bfb329b1
	fcmps	%fcc0,%f26,%f22		! %fcc0 = 2
!	Mem[0000000015800008] = ff000002 ddfc4d72, %l4 = 07667777, %l5 = df6f7d35
	ldda	[%i3+%o6]0x80,%l4	! %l4 = 00000000ff000002 00000000ddfc4d72
!	Mem[0000000015800020] = 0871ae5e 7234bddb 18a880ed 25ae2739
	prefetcha [%i3+0x020]%asi,1
!	Mem[0000000030800018] = 5c233fae, %l7 = 0000000a13e58080
	ldub	[%o1+0x019],%l7		! %l7 = 0000000000000023

p1_label_116:
!	%l2 = 00000000, %l3 = 000000ce, Mem[0000000031800018] = d3c304bb f0ff7a17
	std	%l2,[%o3+0x018]	! Mem[0000000031800018] = 00000000 000000ce
!	%l5 = 00000000ddfc4d72, %l6 = ffffffffffffffff, %l7 = 0000000000000023
	and	%l5,%l6,%l7		! %l7 = 00000000ddfc4d72
!	%l3 = 00000000000000ce, %l2 = 0000000000000000, %l0 = 1221010e0c8615c0
	tsubcc	%l3,%l2,%l0		! %l0 = 00000000000000ce, %ccr = 02
	set	p1_b125,%o7
	fbge,a,pn %fcc0,p1_near_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000014800100] = 1cc09d1be1a5ec75, %l3 = 00000000000000ce
	ldx	[%i1+0x100],%l3		! %l3 = 1cc09d1be1a5ec75
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x07d,%g2
p1_b125:

p1_label_117:
	membar	#Sync			! Added by membar checker (281)
!	Mem[0000000031800054] = eb33041d, %l0 = 00000000000000ce
	ldsba	[%o3+0x057]%asi,%l0	! %l0 = 000000000000001d
!	%f10 = 00000000 00000000, %f22 = bfb329b1 614fb3ef, %f18 = 00000000 00000000
	fdivd	%f10,%f22,%f18		! %f18 = 80000000 00000000
!	%f26 = 00000000 00000000, %f15 = 00000000
	fdtoi	%f26,%f15		! %f15 = 00000000
!	%l7 = 00000000ddfc4d72, Mem[000000004000001f] = ceb20214
	stb	%l7,[%o5+0x01f]		! Mem[000000004000001c] = ceb20272
!	%l7 = 00000000ddfc4d72, %l5 = 00000000ddfc4d72, %l6 = ffffffffffffffff
	subc	%l7,%l5,%l6		! %l6 = 0000000000000000

p1_label_118:
!	%l2 = 0000000000000000, Mem[0000000014000008] = ff4efb6c000003ff
	stxa	%l2,[%i0+%o6]0x80	! Mem[0000000014000008] = 0000000000000000
!	%l4 = 00000000ff000002, immed = fffffa03, %y  = 0000000a
	udivcc	%l4,-0x5fd,%l5		! %l5 = 000000000000000a, %ccr = 00
!	%l4 = 00000000ff000002, immed = 00000730, %y  = 0000000a
	smulcc	%l4,0x730,%l7		! %l7 = fffffff8d0000e60, %ccr = 88
!	%f2  = 00000000, %f26 = 00000000 00000000
	fstod	%f2 ,%f26		! %f26 = 00000000 00000000
!	%l2 = 0000000000000000, %l5 = 000000000000000a, %y  = fffffff8
	sdivcc	%l2,%l5,%l7		! %l7 = ffffffff80000000, %ccr = 8a

p1_label_119:
!	%f20 = 00000000, %f22 = bfb329b1 614fb3ef
	fstod	%f20,%f22		! %f22 = 00000000 00000000
!	Mem[000000001580015c] = 73ff3112, %l7 = ffffffff80000000
	lduha	[%i3+0x15e]%asi,%l7	! %l7 = 0000000000003112
!	Mem[0000000014000050] = 564160e2, %l5 = 0000000a, %l5 = 0000000a
	add	%i0,0x50,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 00000000564160e2
!	%l1 = ffffffffff4efb6c, Mem[000000004000001f] = ceb20272
	stb	%l1,[%o5+0x01f]		! Mem[000000004000001c] = ceb2026c
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 8a

p1_label_120:
!	Mem[0000000015800008] = ff000002, %l5 = 00000000564160e2
	ldstuba	[%i3+%o6]0x80,%l5	! %l5 = 00000000000000ff
p1_b126:
	bvc	p1_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000015000000] = 00330033 dd7f86ed, %l6 = 00000000, %l7 = 00003112
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 0000000000330033 00000000dd7f86ed
p1_b127:
	set	p1_b128,%o7
	fbne,a	p1_far_3_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000014800008] = 0000a06f, %l1 = ffffffffff4efb6c
	lduwa	[%i1+%o6]0x80,%l1	! %l1 = 000000000000a06f
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x080,%g2
p1_b128:
!	Registers modified during the branch to p1_far_3
!	%l0  = 00000000000000bb
!	%l3  = 000000000000c0bb

p1_label_121:
	membar	#Sync			! Added by membar checker (282)
	fbue,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000015800148] = 7f3e51ae, %l0 = 00000000000000bb
	ldsw	[%i3+0x148],%l0		! Annulled
p1_b129:
	membar	#Sync			! Added by membar checker (283)
!	%f10 = 00000000 00000000, %f26 = 00000000 00000000
	fxtod	%f10,%f26		! %f26 = 00000000 00000000
!	%l6 = 0000000000330033, %l1 = 000000000000a06f, %l2 = 0000000000000000
	srax	%l6,%l1,%l2		! %l2 = 0000000000000000
!	Mem[0000000030800010] = 00000001 00000001, %l3 = 000000000000c0bb, %l4 = 00000000ff000002
	add	%o1,0x10,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = f3b9d630ff4efb6c

p1_label_122:
!	%f29 = 00000000, %f15 = 00000000
	fcmpes	%fcc0,%f29,%f15		! %fcc0 = 0
!	%l1 = 000000000000a06f, %l7 = 00000000dd7f86ed, %l0 = 00000000000000bb
	orn	%l1,%l7,%l0		! %l0 = ffffffff2280f97f
!	Mem[0000000014800000] = 5ae967ad, %l6 = 0000000000330033
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 000000005ae967ad
	set	p1_b130,%o7
	fbge	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000008] = 00000000, %l0 = ffffffff2280f97f
	lduba	[%i0+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x082,%g2
p1_b130:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0000000000000000
!	%l2  = 0000000000000000
!	%l4  = 000000005ae967ad
!	%l5  = fffffffffff1c24c
!	%l7  = fffffffffdd9aa07

p1_label_123:
	membar	#Sync			! Added by membar checker (284)
!	Mem[00000000150001e8] = ccf599e4 e056a087, %l6 = 5ae967ad, %l7 = fdd9aa07
	ldd	[%i2+0x1e8],%l6		! %l6 = 00000000ccf599e4 00000000e056a087
!	Mem[0000000032000040] = 9270504b, %l3 = 000000000000c0bb
	lduw	[%o4+0x040],%g2		! %g2 = 000000000000c0bb
	fbge,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l5 = fffffffffff1c24c, Mem[0000000014800008] = 0000a06f
	stha	%l5,[%i1+%o6]0x80	! Annulled
p1_b131:
	membar	#Sync			! Added by membar checker (285)
!	Mem[0000000030800050] = fedbb2eb, %l3 = 000000000000c0bb
	ldsba	[%o1+0x050]%asi,%l3	! %l3 = fffffffffffffffe

p1_label_124:
!	%l5 = fffffffffff1c24c, %l6 = 00000000ccf599e4, %l3 = fffffffffffffffe
	sra	%l5,%l6,%l3		! %l3 = ffffffffffff1c24
!	Mem[0000000014800180] = 2fb4ca62 64461602 b1514031 a6f4c59b
	prefetch [%i1+0x180],2
	bge	p1_b132			! Branch Taken, %ccr = 00, CWP = 0
!	%l7 = 00000000e056a087, Mem[0000000014800008] = 0000a06f
	stwa	%l7,[%i1+%o6]0x80	! Mem[0000000014800008] = e056a087
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x084,%g2
p1_b132:
	membar	#Sync			! Added by membar checker (286)
!	Denormal Floating Point Operation Nullified
	nop

p1_label_125:
!	Mem[0000000015000108] = 7b64018c5e4bff44, %l2 = 0000000000000000
	ldxa	[%i2+0x108]%asi,%l2	! %l2 = 7b64018c5e4bff44
!	Mem[00000000150001dc] = 0670d9bc, %l5 = fffffffffff1c24c
	lduba	[%i2+0x1df]%asi,%l5	! %l5 = 00000000000000bc
!	Mem[00000000158001a0] = e522f398 744309b9 6cd45cb3 f8557afa
	prefetcha [%i3+0x1a0]%asi,4
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = e056a087, %l7 = 00000000e056a087
	lduba	[%i1+%o6]0x80,%l7	! %l7 = 00000000000000e0
p1_b133:

p1_label_126:
	set	p1_b134,%o7
	fbge,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000148000c0] = 70d3f5c6 aded0b2a 0488282e c32c0c9f
	prefetch [%i1+0x0c0],20
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x086,%g2
p1_b134:
	membar	#Sync			! Added by membar checker (287)
!	%f12 = 00000000, %f25 = 00000000
	fitos	%f12,%f25		! %f25 = 00000000
!	%f24 = 80000000 00000000, %f24 = 80000000 00000000
	fcmpd	%fcc1,%f24,%f24		! %fcc1 = 0
!	%l2 = 7b64018c5e4bff44, %l3 = ffffffffffff1c24, %y  = 00000000
	udivx	%l2,%l3,%l4		! %l4 = 0000000000000000

p1_label_127:
	fbn,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l4 = 0000000000000000, Mem[00000000150001e5] = d669d8ec
	stb	%l4,[%i2+0x1e5]		! Annulled
p1_b135:
	bge	p1_b136			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000158001e0] = 1d379097 a69a4c2f, %l6 = ccf599e4, %l7 = 000000e0
	ldd	[%i3+0x1e0],%l6		! %l6 = 000000001d379097 00000000a69a4c2f
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x088,%g2
p1_b136:
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_128:
!	Mem[0000000015000000] = 00330033, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l0	! Annulled
p1_b137:
	bvc	p1_b138			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000150000c0] = 8ea0e9f3 4fef675b 0129574d cd7b9729
	prefetch [%i2+0x0c0],2
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x08a,%g2
p1_b138:
	membar	#Sync			! Added by membar checker (288)
!	%l2 = 7b64018c5e4bff44, %l7 = 00000000a69a4c2f, %y  = 00000000
	smul	%l2,%l7,%l0		! %l0 = df121e0986a40d7c
	set	p1_b139,%o7
	fbo,a,pn %fcc1,p1_near_0_he	! Branch Taken, %fcc1 = 0

p1_label_129:
!	Mem[0000000014000008] = 00000000, %l5 = 00000000000000bc
	lduha	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x08b,%g2
p1_b139:
!	Registers modified during the branch to p1_near_0
!	%l2  = 0000000000000000
!	%l7  = 20ede1f6795b52ec
	bvc,a	p1_b140			! Branch Taken, %ccr = 44, CWP = 0
!	%l5 = 0000000000000000, Mem[0000000015800000] = ffffff6e
	stha	%l5,[%i3+%g0]0x80	! Mem[0000000015800000] = 0000ff6e
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x08c,%g2
p1_b140:
	membar	#Sync			! Added by membar checker (289)
!	Mem[0000000030800058] = 5d2fceb2, %l2 = 0000000000000000
	lduh	[%o1+0x05a],%l2		! %l2 = 000000000000ceb2
!	%l0 = df121e0986a40d7c, Mem[0000000016800008] = 66a79730
	stwa	%l0,[%i5+%o6]0x80	! Mem[0000000016800008] = 86a40d7c

p1_label_130:
!	%l0 = df121e0986a40d7c, %l5 = 0000000000000000, %l6 = 000000001d379097
	xorcc	%l0,%l5,%l6		! %l6 = df121e0986a40d7c, %ccr = 88
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l5 = 0000000000000000, Mem[0000000014800008] = e056a087
	stha	%l5,[%i1+%o6]0x80	! Mem[0000000014800008] = 0000a087
p1_b141:
	membar	#Sync			! Added by membar checker (290)
!	%f8  = 3fb329b1 00000000, %f18 = 80000000 00000000
	fcmpd	%fcc1,%f8 ,%f18		! %fcc1 = 2
!	%l2 = 000000000000ceb2, Mem[000000003200004b] = 3b048983
	stb	%l2,[%o4+0x04b]		! Mem[0000000032000048] = b2048983

p1_label_131:
	set	p1_b142,%o7
	fbge,pn	%fcc1,p1_near_3_he	! Branch Taken, %fcc1 = 2
!	%l6 = df121e0986a40d7c, Mem[0000000014800008] = 0000a087
	stha	%l6,[%i1+%o6]0x80	! Mem[0000000014800008] = 0d7ca087
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x08e,%g2
p1_b142:
!	Registers modified during the branch to p1_near_3
!	%l1  = 20ede1f6795bdefe
!	%l3  = ffffffffece20b76
!	%l5  = df121e0986a4097c
	membar	#Sync			! Added by membar checker (291)
!	%f31 = f2d45158, %f4  = 614fb3ef, %f22 = 00000000 00000000
	fsmuld	%f31,%f4 ,%f22		! %f22 = ca958860 280f2500
!	%f15 = 00000000, %f6  = 00000000, %f17 = 614fb3ef
	fmuls	%f15,%f6 ,%f17		! %f17 = 00000000
!	Mem[0000000015000080] = b4c4a7e7 3c9c6dc0 82e40c38 aaf67f52
	prefetch [%i2+0x080],1

p1_label_132:
!	%l7 = 20ede1f6795b52ec, %l3 = ffffffffece20b76, %l5 = df121e0986a4097c
	orncc	%l7,%l3,%l5		! %l5 = 20ede1f67b5ff6ed, %ccr = 00
!	Mem[0000000015800008] = ff000002, %l6 = df121e0986a40d7c
	ldstuba	[%i3+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030800018] = 5c233fae, %l6 = 00000000000000ff
	ldsw	[%o1+0x018],%l6		! %l6 = 000000005c233fae
!	%l7 = 20ede1f6795b52ec, immed = 00000162, %l3 = ffffffffece20b76
	subc	%l7,0x162,%l3		! %l3 = 20ede1f6795b518a
!	%f19 = 00000000, %f6  = 00000000
	fcmps	%fcc0,%f19,%f6 		! %fcc0 = 0

p1_label_133:
!	%l1 = 20ede1f6795bdefe, Mem[0000000014000090] = 8feead7097dc819d
	stx	%l1,[%i0+0x090]		! Mem[0000000014000090] = 20ede1f6795bdefe
	set	p1_b143,%o7
	fbul,a,pn %fcc3,p1_near_3_he	! Branch Taken, %fcc3 = 1
!	Mem[0000000030000018] = 779164c2, %l2 = 000000000000ceb2
	ldsb	[%o0+0x019],%l2		! %l2 = ffffffffffffff91
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x08f,%g2
p1_b143:
!	Registers modified during the branch to p1_near_3
!	%l1  = fffffffffffffffd
!	%l3  = ffffffffece20b76
!	%l5  = 000000005c2339ac
	bge,a	p1_b144			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000014800030] = 80ac3361, %l4 = 0000000000000000
	lduh	[%i1+0x032],%l4		! %l4 = 0000000000003361
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x090,%g2
p1_b144:

p1_label_134:
	membar	#Sync			! Added by membar checker (292)
!	Mem[0000000015000000] = 00330033, %l5 = 000000005c2339ac
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
	bcc,a	p1_b145			! Branch Taken, %ccr = 00, CWP = 0
!	%l3 = ffffffffece20b76, Mem[00000000148001d0] = 46e25f98
	stw	%l3,[%i1+0x1d0]		! Mem[00000000148001d0] = ece20b76
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x091,%g2
p1_b145:
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	%l4 = 0000000000003361, Mem[0000000014000008] = 00000000
	stwa	%l4,[%i0+%o6]0x80	! Mem[0000000014000008] = 00003361
!	Registers modified during the branch to p1_jmpl_0
!	%l1  = fffffffff9100000
!	%l5  = 00000000e522f398

p1_label_135:
	membar	#Sync			! Added by membar checker (293)
!	%f0  = 00000001 8ad82340, %f12 = 00000000 00000000
	fabsd	%f0 ,%f12		! %f12 = 00000001 8ad82340
!	%l1 = fffffffff9100000, immed = 00000000, %l3 = ffffffffece20b76
	srl	%l1,0x000,%l3		! %l3 = 00000000f9100000
	bvc,a	p1_b146			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000150000f8] = f9cf6d55b13dea24, %l0 = df121e0986a40d7c
	ldx	[%i2+0x0f8],%l0		! %l0 = f9cf6d55b13dea24
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x092,%g2
p1_b146:
	membar	#Sync			! Added by membar checker (294)
!	Mem[00000000150001a0] = 00000000 00000001, %l1 = fffffffff9100000, %l4 = 0000000000003361
	add	%i2,0x1a0,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = acb8955c2a4f02b3

p1_label_136:
!	%l4 = acb8955c2a4f02b3, immed = fffff013, %y  = df121e09
	sdiv	%l4,-0xfed,%l4		! %l4 = 000000007fffffff
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 0c8615c0 df6f7d57
	prefetch [%o4+0x020],0
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l1 = fffffffff9100000, Mem[0000000014000008] = 00003361
	stha	%l1,[%i0+%o6]0x80	! Annulled
p1_b147:
	bl	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_137:
!	Mem[0000000014800120] = cf7789ef b24e8472 876827b8 0c9aa63a
	prefetch [%i1+0x120],22
p1_b148:
	membar	#Sync			! Added by membar checker (295)
!	%f10 = 00000000, %f0  = 00000001 8ad82340
	fstox	%f10,%f0 		! %f0  = 00000000 00000000
!	%f14 = 00000000 00000000, %f14 = 00000000
	fdtos	%f14,%f14		! %f14 = 00000000
!	%f16 = 00000000 00000000, %f14 = 00000000 00000000
	fmovd	%f16,%f14		! %f14 = 00000000 00000000
!	Branch On Register, %l7 = 20ede1f6795b52ec
	brnz,pt	%l7,p1_b149		! Branch Taken

p1_label_138:
!	Mem[0000000014000000] = ff27318d, %l2 = ffffffffffffff91
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = ffffffffff27318d
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x095,%g2
p1_b149:
	membar	#Sync			! Added by membar checker (296)
!	Mem[00000000158000d8] = c0b27d23 3f0e628e, %l6 = 5c233fae, %l7 = 795b52ec
	ldd	[%i3+0x0d8],%l6		! %l6 = 00000000c0b27d23 000000003f0e628e
!	%l1 = fffffffff9100000, %l7 = 000000003f0e628e, %l3 = 00000000f9100000
	orn	%l1,%l7,%l3		! %l3 = fffffffff9f19d71
!	%f18 = 80000000 00000000, %f30 = 614fb3ef f2d45158
	fcmpd	%fcc1,%f18,%f30		! %fcc1 = 1
!	Mem[0000000014000184] = 2942eaa1, %l0 = f9cf6d55b13dea24
	ldsb	[%i0+0x185],%l0		! %l0 = 0000000000000042

p1_label_139:
	bleu	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l4 = 7fffffff, %l5 = e522f398, Mem[0000000031800018] = 00000000 000000ce
	std	%l4,[%o3+0x018]	! Mem[0000000031800018] = 7fffffff e522f398
p1_b150:
	membar	#Sync			! Added by membar checker (297)
!	%f24 = 80000000 00000000, %f4  = 614fb3ef 20000000, %f18 = 80000000 00000000
	fdivd	%f24,%f4 ,%f18		! %f18 = 80000000 00000000
!	Mem[0000000014800000] = 5ae967ad a8b5f8c5, %l4 = 7fffffff, %l5 = e522f398
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 000000005ae967ad 00000000a8b5f8c5
!	%f2  = 00000000 00000000, %f26 = 00000000 00000000
	fmovd	%f2 ,%f26		! %f26 = 00000000 00000000

p1_label_140:
	bcs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000014800008] = 0d7ca087, %l7 = 000000003f0e628e
	lduba	[%i1+%o6]0x80,%l7	! Annulled
p1_b151:
	ble	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l2 = ffffffffff27318d, Mem[000000003000005c] = 67fb2f81
	stw	%l2,[%o0+0x05c]		! Mem[000000003000005c] = ff27318d
p1_b152:
	membar	#Sync			! Added by membar checker (298)
!	%l2 = ffffffffff27318d, %l4 = 000000005ae967ad, %y  = df121e09
	umul	%l2,%l4,%l3		! %l3 = 5a9c696cddc13749

p1_label_141:
	fbue,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l5 = 00000000a8b5f8c5, Mem[0000000031000011] = 47327b64
	stb	%l5,[%o2+0x011]		! Annulled
p1_b153:
	membar	#Sync			! Added by membar checker (299)
	fbge,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000031000054] = 29fae0ff, %l3 = 5a9c696cddc13749
	ldsb	[%o2+0x056],%l3		! %l3 = ffffffffffffffe0
p1_b154:
	membar	#Sync			! Added by membar checker (300)
!	Branch On Register, %l6 = 00000000c0b27d23
	brgz,a,pn %l6,p1_b155		! Branch Taken

p1_label_142:
!	Mem[0000000030800050] = 000000bcb1d316fb, %l4 = 000000005ae967ad
	ldx	[%o1+0x050],%l4		! %l4 = 000000bcb1d316fb
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x09b,%g2
p1_b155:
	bvc,a	p1_b156			! Branch Taken, %ccr = 00, CWP = 0
!	%l4 = 000000bcb1d316fb, Mem[0000000014800000] = 5ae967ad
	stha	%l4,[%i1+%g0]0x80	! Mem[0000000014800000] = 16fb67ad
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x09c,%g2
p1_b156:
!	call to call_3, CWP = 0
	call	p1_call_3_le
!	Mem[00000000158000e0] = e9b88803 b3f20ffd 2f6e74fa 029380b0
	prefetch [%i3+0x0e0],22
!	Registers modified during the branch to p1_call_3
!	%l2  = fffffecb1f893c6c

p1_label_143:
	set	p1_b157,%o7
	fbe,a	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[000000003200002c] = 7d570000, %l1 = fffffffff9100000
	ldsb	[%o4+0x02e],%g2		! %g2 = 000000000000007d
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x09d,%g2
p1_b157:
!	Registers modified during the branch to p1_far_2
!	%l2  = 000000002ee178cc
!	%l3  = ffffffffa7e20cad
!	%l6  = 000000003f0e6a1f
	membar	#Sync			! Added by membar checker (301)
	set	p1_b158,%o7
	fble,pn	%fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000030800018] = 5c233fae, %l6 = 000000003f0e6a1f
	lduw	[%o1+0x018],%l6		! %l6 = 000000005c233fae
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x09e,%g2
p1_b158:
!	Registers modified during the branch to p1_near_2
!	%l1  = 000000005ae967ad
!	%l3  = 0000000006e178cc
!	%l4  = 00000000102ce9c2
!	%l5  = 00000000000000bc
!	%l7  = 00000000001376b5
	membar	#Sync			! Added by membar checker (302)
!	%f26 = 00000000 00000000, %f18 = 80000000 00000000
	fabsd	%f26,%f18		! %f18 = 00000000 00000000

p1_label_144:
!	Mem[0000000014800110] = 033580df, %l5 = 00000000000000bc
	lduwa	[%i1+0x110]%asi,%l5	! %l5 = 00000000033580df
!	Mem[0000000017000100] = fd2f1387 3dcf74ea 5fedf4d5 19699e76
	prefetcha [%i6+0x100]%asi,20
	set	p1_b159,%o7
	fbo,a	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000008] = ffb20000 3d92a06f, %l0 = 00000042, %l1 = 5ae967ad
	ldda	[%i2+%o6]0x80,%l0	! %l0 = 00000000ffb20000 000000003d92a06f
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x09f,%g2
p1_b159:
!	Registers modified during the branch to p1_far_0
!	%l6  = ffffffffffec8609
	membar	#Sync			! Added by membar checker (303)
!	Mem[0000000014800000] = 16fb67ad, %l0 = 00000000ffb20000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000016

p1_label_145:
!	%l6 = ffec8609, %l7 = 001376b5, Mem[0000000015800180] = bf9c1c88 2c35a91a
	stda	%l6,[%i3+0x180]%asi	! Mem[0000000015800180] = ffec8609 001376b5
	set	p1_b160,%o7
	fbge,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800000] = fffb67ad, %l4 = 00000000102ce9c2
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000fffb67ad
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x0a0,%g2
p1_b160:
!	Registers modified during the branch to p1_far_3
!	%l7  = 000000000000005c
	membar	#Sync			! Added by membar checker (304)
!	Mem[0000000015800160] = 4fe15bb1 b01b1884 f65b00e6 ba7a7777
	prefetcha [%i3+0x160]%asi,20
	set	p1_b161,%o7
	fbge,a	p1_far_3_le	! Branch Taken, %fcc0 = 0

p1_label_146:
!	%l4 = 00000000fffb67ad, Mem[0000000015800008] = ff000002ddfc4d72
	stxa	%l4,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000000fffb67ad
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0a1,%g2
p1_b161:
!	Registers modified during the branch to p1_far_3
!	%l7  = 000000000000005c
	membar	#Sync			! Added by membar checker (305)
	set	p1_b162,%o7
	fble,a,pn %fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 1
!	%l4 = 00000000fffb67ad, Mem[0000000032000038] = f69e7d05
	stw	%l4,[%o4+0x038]		! Mem[0000000032000038] = fffb67ad
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x0a2,%g2
p1_b162:
!	Registers modified during the branch to p1_near_2
!	%l1  = 000000005ae967ad
!	%l3  = 0000000002615880
!	%l4  = ffffffffd11e8790
!	%l5  = 00000000000000bc
!	%l7  = 0000000000005ec6
	membar	#Sync			! Added by membar checker (306)
!	%f15 = 00000000, %f26 = 00000000 00000000
	fstox	%f15,%f26		! %f26 = 00000000 00000000
!	%l4 = ffffffffd11e8790, %l4 = ffffffffd11e8790, %l0 = 0000000000000016
	srlx	%l4,%l4,%l0		! %l0 = 0000ffffffffd11e

p1_label_147:
	set	p1_b163,%o7
	fbul,pn	%fcc3,p1_near_1_he	! Branch Taken, %fcc3 = 1
!	Mem[0000000014800008] = 0d7ca087 5ae967ad, %l0 = ffffd11e, %l1 = 5ae967ad
	ldda	[%i1+%o6]0x80,%l0	! %l0 = 000000000d7ca087 000000005ae967ad
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x0a3,%g2
p1_b163:
!	Registers modified during the branch to p1_near_1
!	%l0  = 00000000ffffffff
!	%l3  = 000000000261593c
	membar	#Sync			! Added by membar checker (307)
!	Mem[0000000014800000] = 102ce9c2a8b5f8c5, %l3 = 000000000261593c
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 102ce9c2a8b5f8c5
	bg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l5 = 00000000000000bc, Mem[0000000014000000] = ff27318d
	stha	%l5,[%i0+%g0]0x80	! Annulled
p1_b164:

p1_label_148:
	membar	#Sync			! Added by membar checker (308)
	fblg,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000055] = 9dfc18f1, %l5 = 00000000000000bc
	ldstub	[%o0+0x055],%l5		! %l5 = 00000000000000fc
p1_b165:
	membar	#Sync			! Added by membar checker (309)
!	Mem[00000000150000b0] = 9e9365b8, %l1 = 000000005ae967ad
	lduw	[%i2+0x0b0],%l1		! %l1 = 000000009e9365b8
!	%f31 = f2d45158, %f24 = 80000000 00000000
	fstod	%f31,%f24		! %f24 = c65a8a2b 00000000
!	%f0  = 00000000 00000000, %f16 = 00000000
	fdtos	%f0 ,%f16		! %f16 = 00000000

p1_label_149:
!	Mem[00000000140000c0] = 202eb445 1e39f6e7 3df44cd4 a3cf92ff
	prefetcha [%i0+0x0c0]%asi,23
	bneg	p1_b166			! Branch Taken, %ccr = 88, CWP = 0
!	%l3 = 102ce9c2a8b5f8c5, Mem[000000001480007a] = 05728b73
	stb	%l3,[%i1+0x07a]		! Mem[0000000014800078] = 0572c573
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x0a6,%g2
p1_b166:
	membar	#Sync			! Added by membar checker (310)
!	%l4 = ffffffffd11e8790, immed = 0000096c, %y  = fffffecb
	umul	%l4,0x96c,%l4		! %l4 = 000007b24ba540c0
!	%l0 = 00000000ffffffff, Mem[00000000140001f8] = 0000000000000018
	stx	%l0,[%i0+0x1f8]		! Mem[00000000140001f8] = 00000000ffffffff

p1_label_150:
!	%l1 = 000000009e9365b8, immed = fffff0cb, %l7 = 0000000000005ec6
	addccc	%l1,-0xf35,%l7		! %l7 = 000000009e935683, %ccr = 19
!	Mem[000000001400009c] = 16b93207, %l7 = 000000009e935683
	ldsha	[%i0+0x09c]%asi,%l7	! %l7 = 00000000000016b9
!	Mem[0000000014000120] = 4160dd73 c00a91e9, %l0 = ffffffff, %l1 = 9e9365b8
	ldda	[%i0+0x120]%asi,%l0	! %l0 = 000000004160dd73 00000000c00a91e9
!	Mem[0000000014000128] = db6a74e8, %l3 = 102ce9c2a8b5f8c5
	ldswa	[%i0+0x128]%asi,%l3	! %l3 = ffffffffdb6a74e8
!	%l6 = ffffffffffec8609, Mem[0000000031800010] = 0c8615c0
	stw	%l6,[%o3+0x010]		! Mem[0000000031800010] = ffec8609

p1_label_151:
!	Mem[0000000014800000] = 102ce9c2, %l3 = ffffffffdb6a74e8
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 000000000000102c
!	%l3 = 000000000000102c, immed = fffff2d6, %y  = 000007b2
	udivx	%l3,-0xd2a,%l6		! %l6 = 0000000000000000
!	%l2 = 000000002ee178cc, %l6 = 0000000000000000, %l2 = 000000002ee178cc
	orncc	%l2,%l6,%l2		! %l2 = ffffffffffffffff, %ccr = 88
!	%l1 = 00000000c00a91e9, immed = 00000cd4, %l5 = 00000000000000fc
	andncc	%l1,0xcd4,%l5		! %l5 = 00000000c00a9129, %ccr = 08
	bg	p1_not_taken_0		! Branch Not Taken, %ccr = 08

p1_label_152:
!	Mem[0000000014000000] = ff27318d, %l7 = 00000000000016b9
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ff27318d
p1_b167:
	membar	#Sync			! Added by membar checker (311)
!	Mem[0000000015000000] = 00330033dd7f86ed, %l4 = 000007b24ba540c0
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = 00330033dd7f86ed
	bneg	p1_b168			! Branch Taken, %ccr = 08, CWP = 0
!	%l4 = 00330033dd7f86ed, Mem[0000000015000008] = ffb200003d92a06f
	stxa	%l4,[%i2+%o6]0x80	! Mem[0000000015000008] = 00330033dd7f86ed
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x0a8,%g2
p1_b168:
	membar	#Sync			! Added by membar checker (312)
!	%f0  = 00000000 00000000, %f2  = 00000000 00000000
	fabsd	%f0 ,%f2 		! %f2  = 00000000 00000000

p1_label_153:
!	%l0 = 000000004160dd73, Mem[0000000014000000] = 000016b964fd9b9d
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000014000000] = 000000004160dd73
	set	p1_b169,%o7
	fble	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001480016c] = e3a8904e, %l6 = 0000000000000000
	lduw	[%i1+0x16c],%l6		! %l6 = 00000000e3a8904e
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0a9,%g2
p1_b169:
!	Registers modified during the branch to p1_far_0
!	%l2  = 000000000000004e
!	%l3  = 000000000000059a
!	%l4  = 0000059a4ef1bffa
!	%l5  = 00000000000d0d04
!	%l6  = 0000059a4ef1c438
!	%l7  = 0000000000006790
	membar	#Sync			! Added by membar checker (313)
!	%l5 = 00000000000d0d04, immed = fffffd0a, %l4 = 0000059a4ef1bffa
	xnor	%l5,-0x2f6,%l4		! %l4 = 00000000000d0ff1
!	%l7 = 0000000000006790, Mem[000000001400010e] = 12d60d65
	sth	%l7,[%i0+0x10e]		! Mem[000000001400010c] = 12d66790

p1_label_154:
!	%l5 = 00000000000d0d04, Mem[000000001500005d] = 702be71c
	stba	%l5,[%i2+0x05d]%asi	! Mem[000000001500005c] = 7004e71c
	set	p1_b170,%o7
	fbule,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	%l5 = 00000000000d0d04, Mem[000000004000001c] = ceb2026c
	stb	%l5,[%o5+0x01c]		! Mem[000000004000001c] = 04b2026c
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0aa,%g2
p1_b170:
!	Registers modified during the branch to p1_far_3
!	%l7  = 000000000000005c
	membar	#Sync			! Added by membar checker (314)
!	%l5 = 00000000000d0d04, %l4 = 00000000000d0ff1, %l7 = 000000000000005c
	srlx	%l5,%l4,%l7		! %l7 = 0000000000000000
!	%l6 = 0000059a4ef1c438, immed = 00000b8a, %l0 = 000000004160dd73
	orncc	%l6,0xb8a,%l0		! %l0 = fffffffffffff47d, %ccr = 88

p1_label_155:
!	Mem[0000000014800180] = 2fb4ca62 64461602 b1514031 a6f4c59b
	prefetcha [%i1+0x180]%asi,16
!	%f26 = 00000000, %f26 = 00000000
	fitos	%f26,%f26		! %f26 = 00000000
!	%l6 = 0000059a4ef1c438, immed = ffffffd3, %y  = 0000059a
	udiv	%l6,-0x02d,%l0		! %l0 = 000000000000059a
!	Mem[0000000030000053] = 11e75ce9, %l5 = 00000000000d0d04
	ldstub	[%o0+0x053],%l5		! %l5 = 00000000000000e9
!	Mem[000000003000001a] = 779164c2, %l3 = 000000000000059a
	ldstuba	[%o0+0x01a]%asi,%l3	! %l3 = 0000000000000064

p1_label_156:
!	%l5 = 00000000000000e9, Mem[0000000031000050] = 15c0a06f
	stw	%l5,[%o2+0x050]		! Mem[0000000031000050] = 000000e9
!	%l4 = 00000000000d0ff1, immed = 00000c6c, %y  = 0000059a
	sdivx	%l4,0xc6c,%l3		! %l3 = 000000000000010d
!	Mem[0000000014800176] = fa8e2c45, %l2 = 000000000000004e
	ldstub	[%i1+0x176],%l2		! %l2 = 000000000000002c
	fbg,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[00000000158001b0] = 924a325a602ea134, %l5 = 00000000000000e9
	ldx	[%i3+0x1b0],%l5		! %l5 = 924a325a602ea134
p1_b171:

p1_label_157:
	membar	#Sync			! Added by membar checker (315)
!	Mem[0000000015000134] = 99e043dc, %l6 = 0000059a4ef1c438
	ldsha	[%i2+0x134]%asi,%l6	! %l6 = ffffffffffff99e0
!	%l5 = 924a325a602ea134, immed = fffff889, %l3 = 000000000000010d
	orncc	%l5,-0x777,%l3		! %l3 = 924a325a602ea776, %ccr = 80
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000000] = 00330033, %l4 = 00000000000d0ff1
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000330033
p1_b172:
	bvc	p1_b173			! Branch Taken, %ccr = 80, CWP = 0

p1_label_158:
!	%l0 = 0000059a, %l1 = c00a91e9, Mem[0000000015800060] = 0aebb449 b5df4596
	std	%l0,[%i3+0x060]	! Mem[0000000015800060] = 0000059a c00a91e9
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0ad,%g2
p1_b173:
	membar	#Sync			! Added by membar checker (316)
!	Mem[0000000014800160] = a04014c0 f1127407 76693b2c e3a8904e
	prefetcha [%i1+0x160]%asi,22
!	Mem[0000000014000008] = 00003361, %l4 = 0000000000330033
	lduwa	[%i0+%o6]0x80,%l4	! %l4 = 0000000000003361
!	Mem[000000003100005c] = df6f7d57, %l2 = 000000000000002c
	swap	[%o2+0x05c],%l2		! %l2 = 00000000df6f7d57
!	%l4 = 0000000000003361, %l0 = 000000000000059a, %l0 = 000000000000059a
	sub	%l4,%l0,%l0		! %l0 = 0000000000002dc7

p1_label_159:
!	%l5 = 924a325a602ea134, %l4 = 0000000000003361, %l2 = 00000000df6f7d57
	sub	%l5,%l4,%l2		! %l2 = 924a325a602e6dd3
!	%l4 = 0000000000003361, immed = 00000915, %y  = 0000059a
	umul	%l4,0x915,%l6		! %l6 = 0000000001d29ff5
	bg	p1_b174			! Branch Taken, %ccr = 80, CWP = 0
!	%l2 = 924a325a602e6dd3, Mem[0000000014800000] = 102ce9c2a8b5f8c5
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000014800000] = 924a325a602e6dd3
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0ae,%g2
p1_b174:
	membar	#Sync			! Added by membar checker (317)
!	%f18 = 00000000, %f19 = 00000000
	fcmpes	%fcc2,%f18,%f19		! %fcc2 = 0

p1_label_160:
!	%l7 = 0000000000000000, immed = fffff097, %l1 = 00000000c00a91e9
	xor	%l7,-0xf69,%l1		! %l1 = fffffffffffff097
!	%l0 = 00002dc7, %l1 = fffff097, Mem[0000000030000018] = 7791ffc2 6443c228
	std	%l0,[%o0+0x018]	! Mem[0000000030000018] = 00002dc7 fffff097
!	Mem[00000000158001c0] = ac75ea17 6b786156 4d3196ee e9e760c2
	prefetch [%i3+0x1c0],22
	fbu,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l1 = fffffffffffff097, Mem[0000000014000000] = 000000004160dd73
	stxa	%l1,[%i0+%g0]0x80	! Annulled
p1_b175:

p1_label_161:
	set	p1_b176,%o7
	fbe,a	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000008] = 00330033, %l0 = 0000000000002dc7
	swapa	[%i2+%o6]0x80,%l0	! %l0 = 0000000000330033
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x0b0,%g2
p1_b176:
!	Registers modified during the branch to p1_far_2
!	%l2  = ffffffffffffffff
!	%l3  = 0000000000000002
!	%l6  = 0000000000000891
	membar	#Sync			! Added by membar checker (318)
!	Branch On Register, %l4 = 0000000000003361
	brz,a,pt %l4,p1_not_taken_0	! Branch Not Taken
!	 Annulled
	ldd	[%i1+0x130],%l0
p1_b177:
	bg,a	p1_b178			! Branch Taken, %ccr = 00, CWP = 0

p1_label_162:
!	%l1 = fffffffffffff097, Mem[0000000015000008] = 00002dc7
	stwa	%l1,[%i2+%o6]0x80	! Mem[0000000015000008] = fffff097
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x0b2,%g2
p1_b178:
	membar	#Sync			! Added by membar checker (319)
!	Mem[0000000015800148] = 7f3e51ae 43407777, %l2 = ffffffff, %l3 = 00000002
	ldd	[%i3+0x148],%l2		! %l2 = 000000007f3e51ae 0000000043407777
!	Mem[000000001400004b] = 649d06ad, %l4 = 0000000000003361
	ldstuba	[%i0+0x04b]%asi,%l4	! %l4 = 00000000000000ad
	bpos,a	p1_b179			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000015000000] = 00330033, %l3 = 0000000043407777
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = 0000000000330033
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x0b3,%g2
p1_b179:

p1_label_163:
	bleu	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000014800140] = 57b5e4f4 378c4de2 d9b2c51d 3574f507
	prefetch [%i1+0x140],0
p1_b180:
	membar	#Sync			! Added by membar checker (320)
!	%l5 = 924a325a602ea134, %l2 = 000000007f3e51ae, %l5 = 924a325a602ea134
	subccc	%l5,%l2,%l5		! %l5 = 924a3259e0f04f86, %ccr = 89
!	%l2 = 000000007f3e51ae, %l3 = 0000000000330033, %y  = 00000000
	umul	%l2,%l3,%l6		! %l6 = 001959839f1445aa
!	Branch On Register, %l4 = 00000000000000ad
	brnz,a,pn %l4,p1_b181		! Branch Taken

p1_label_164:
!	Mem[0000000015800000] = 0000ff6e, %l1 = fffffffffffff097
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0b5,%g2
p1_b181:
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 89
!	Mem[00000000158000e0] = e9b88803 b3f20ffd 2f6e74fa 029380b0
	prefetch [%i3+0x0e0],4	! Annulled
p1_b182:
	membar	#Sync			! Added by membar checker (321)
!	Mem[0000000014000100] = 9ebfc8ac 6ee933d1 5dc2177b 12d66790
	prefetch [%i0+0x100],0
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_165:
!	Mem[0000000040000018] = 13342835, %l2 = 000000007f3e51ae
	ldub	[%o5+0x019],%l2		! Annulled
p1_b183:
	membar	#Sync			! Added by membar checker (322)
!	Mem[0000000030800018] = 5c233fae, %l4 = 00000000000000ad
	lduha	[%o1+0x018]%asi,%l4	! %l4 = 0000000000005c23
!	%l3 = 0000000000330033, %l7 = 0000000000000000, %l7 = 0000000000000000
	srlx	%l3,%l7,%l7		! %l7 = 0000000000330033
!	%l0 = 0000000000330033, %l2 = 000000007f3e51ae, %l7 = 0000000000330033
	sra	%l0,%l2,%l7		! %l7 = 00000000000000cc
!	Mem[0000000015000000] = 00330033, %l3 = 0000000000330033
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000

p1_label_166:
!	Mem[00000000140000c0] = 202eb445 1e39f6e7 3df44cd4 a3cf92ff
	prefetcha [%i0+0x0c0]%asi,20
!	Mem[0000000031000058] = ffffffff, %l0 = 0000000000330033
	ldsb	[%o2+0x05a],%l0		! %l0 = ffffffffffffffff
	fbu,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000008] = 00003361, %l5 = 924a3259e0f04f86
	ldub	[%i0+0x00b],%l5		! Annulled
p1_b184:
	membar	#Sync			! Added by membar checker (323)
!	%l5 = 924a3259e0f04f86, Mem[0000000014000098] = e164d3dc16b93207
	stxa	%l5,[%i0+0x098]%asi	! Mem[0000000014000098] = 924a3259e0f04f86

p1_label_167:
!	Branch On Register, %l3 = 0000000000000000
	brgez,pt %l3,p1_b185		! Branch Taken
!	Mem[0000000014000020] = 87f95f57 25b179d8 a2fd7ee8 ab78177b
	prefetch [%i0+0x020],21
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0b9,%g2
p1_b185:
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000148001c8] = c1eefa025a5e08d1, %l2 = 000000007f3e51ae
	ldx	[%i1+0x1c8],%l2		! %l2 = c1eefa025a5e08d1
p1_b186:
	membar	#Sync			! Added by membar checker (324)
!	%l5 = 924a3259e0f04f86, %l3 = 0000000000000000, %l3 = 0000000000000000
	subccc	%l5,%l3,%l3		! %l3 = 924a3259e0f04f85, %ccr = 88

p1_label_168:
!	%f15 = 00000000, %f14 = 00000000 00000000
	fstod	%f15,%f14		! %f14 = 00000000 00000000
	fbu,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000014000128] = db6a74e8, %l5 = 924a3259e0f04f86
	ldsb	[%i0+0x12a],%l5		! Annulled
p1_b187:
	membar	#Sync			! Added by membar checker (325)
!	%f12 = 00000001 8ad82340, %f20 = 00000000 00000000
	fnegd	%f12,%f20		! %f20 = 80000001 8ad82340
!	%l7 = 00000000000000cc, %l1 = 0000000000000000, %l3 = 924a3259e0f04f85
	sll	%l7,%l1,%l3		! %l3 = 00000000000000cc

p1_label_169:
!	%l2 = c1eefa025a5e08d1, %l3 = 00000000000000cc, %y  = 00195983
	umulcc	%l2,%l3,%l7		! %l7 = 0000004802ef068c, %ccr = 00
	set	p1_b188,%o7
	fblg,pt	%fcc1,p1_near_3_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000016000000] = b475a907c9c21c01, %l7 = 0000004802ef068c
	ldxa	[%i4+%g0]0x80,%l7	! %l7 = b475a907c9c21c01
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0bc,%g2
p1_b188:
!	Registers modified during the branch to p1_near_3
!	%l2  = 03c4cdb3b3f3fa24
!	%l7  = ffffffffffffff33
	membar	#Sync			! Added by membar checker (326)
!	Mem[0000000014800014] = dc0b5cc0, %l6 = 001959839f1445aa
	ldub	[%i1+0x014],%l6		! %l6 = 00000000000000dc
!	Mem[0000000015000000] = 00330033, %l6 = 00000000000000dc
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000

p1_label_170:
	set	p1_b189,%o7
	fbe,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800008] = 0d7ca087, %l2 = 03c4cdb3b3f3fa24
	swapa	[%i1+%o6]0x80,%l2	! %l2 = 000000000d7ca087
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0bd,%g2
p1_b189:
	membar	#Sync			! Added by membar checker (327)
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000014800060] = 31f2b1f4 a985929a
	stda	%l0,[%i1+0x060]%asi	! Mem[0000000014800060] = ffffffff 00000000
!	Mem[000000001580009c] = 6aea1ed9, %l5 = e0f04f86, %l1 = 00000000
	add	%i3,0x9c,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 000000006aea1ed9
	fbne,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_171:
!	Mem[0000000015000000] = ff330033, %l0 = ffffffffffffffff
	ldswa	[%i2+%g0]0x80,%l0	! Annulled
p1_b190:
	membar	#Sync			! Added by membar checker (328)
!	Mem[0000000031000059] = ffffffff, %l1 = 000000006aea1ed9
	ldstuba	[%o2+0x059]%asi,%l1	! %l1 = 00000000000000ff
	set	p1_b191,%o7
	fbge,a	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	%l3 = 00000000000000cc, Mem[000000003100005c] = 0000002c
	sth	%l3,[%o2+0x05c]		! Mem[000000003100005c] = 00cc002c
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x0bf,%g2
p1_b191:
!	Registers modified during the branch to p1_far_2
!	%l2  = ffffffff80000000
!	%l3  = 000000007fffffff
!	%l6  = fffffffffffff7a2
	membar	#Sync			! Added by membar checker (329)
!	%f20 = 80000001 8ad82340, %f4  = 614fb3ef 20000000
	fnegd	%f20,%f4 		! %f4  = 00000001 8ad82340

p1_label_172:
	fbne,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	 Annulled
	ldda	[%i3+%g0]0x80,%l2
p1_b192:
	membar	#Sync			! Added by membar checker (330)
!	%l5 = 924a3259e0f04f86, Mem[0000000016800000] = 00407710
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000016800000] = 86407710
!	Mem[00000000150000e0] = 9108acac, %l3 = 000000007fffffff
	lduh	[%i2+0x0e0],%l3		! %l3 = 0000000000009108
!	%l5 = 924a3259e0f04f86, immed = fffff491, %l3 = 0000000000009108
	sub	%l5,-0xb6f,%l3		! %l3 = 924a3259e0f05af5

p1_label_173:
!	%l2 = ffffffff80000000, Mem[000000001480004a] = d7d1d832
	sth	%l2,[%i1+0x04a]		! Mem[0000000014800048] = d7d10000
!	%f2  = 00000000, %f10 = 00000000
	fitos	%f2 ,%f10		! %f10 = 00000000
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l5 = 924a3259e0f04f86, Mem[0000000015000000] = ff330033dd7f86ed
	stxa	%l5,[%i2+%g0]0x80	! Annulled
p1_b193:
	membar	#Sync			! Added by membar checker (331)
!	Mem[0000000015000160] = b6ffec99 dffe02a2 00000000 000000b9
	prefetcha [%i2+0x160]%asi,23

p1_label_174:
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000015800008] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000
p1_b194:
	membar	#Sync			! Added by membar checker (332)
!	Mem[00000000158000c8] = 5b831d41, %l2 = ffffffff80000000
	ldub	[%i3+0x0c9],%l2		! %l2 = 0000000000000083
!	Branch On Register, %l1 = 00000000000000ff
	brlez,pn %l1,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014800000] = 924a325a, %l2 = 0000000000000083
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000092
p1_b195:

p1_label_175:
	set	p1_b196,%o7
	fbge,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800008] = ff000000, %l2 = 0000000000000092
	ldsha	[%i3+%o6]0x80,%l2	! %l2 = ffffffffffffff00
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x0c4,%g2
p1_b196:
!	Registers modified during the branch to p1_far_0
!	%l2  = 000000000000004e
!	%l3  = 0000000000000000
!	%l4  = 0000000000076c4a
!	%l5  = fff88b5416b09ec6
!	%l6  = 0000000000077088
!	%l7  = 0000000000006790
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 0000000000076c4a, Mem[0000000015800080] = 183c843ff2858178
	stx	%l4,[%i3+0x080]		! Annulled
p1_b197:
	membar	#Sync			! Added by membar checker (333)
!	Mem[0000000031000016] = bb891c5c, %l3 = 0000000000000000
	ldstuba	[%o2+0x016]%asi,%l3	! %l3 = 000000000000001c

p1_label_176:
!	%l4 = 0000000000076c4a, Mem[0000000014800000] = 924a325a
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000014800000] = 4a4a325a
	set	p1_b198,%o7
	fbo,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000032000048] = 061a0eb2 048983dc
	std	%l0,[%o4+0x048]	! Mem[0000000032000048] = 00000000 000000ff
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p1_branch_failed
	mov	0x0c6,%g2
p1_b198:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0000000000000000
!	%l2  = 0000000000000000
!	%l4  = 0000000000077088
!	%l5  = fffffebb9ae20938
!	%l7  = ffffffffffffb00c
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800000] = 4a4a325a, %l0 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l0	! Annulled
p1_b199:

p1_label_177:
	membar	#Sync			! Added by membar checker (334)
!	%l5 = fffffebb9ae20938, Mem[000000003180001d] = e522f398
	stb	%l5,[%o3+0x01d]		! Mem[000000003180001c] = e538f398
!	%l2 = 0000000000000000, Mem[00000000150001f0] = a171b6d2
	sth	%l2,[%i2+0x1f0]		! Mem[00000000150001f0] = 0000b6d2
!	%l4 = 0000000000077088, Mem[000000001500015e] = bc8961f6
	stha	%l4,[%i2+0x15e]%asi	! Mem[000000001500015c] = bc897088
!	%f8  = 3fb329b1, %f22 = ca958860
	fmovs	%f8 ,%f22		! %f22 = 3fb329b1
!	%f24 = c65a8a2b 00000000, %f16 = 00000000 00000000
	fcmped	%fcc3,%f24,%f16		! %fcc3 = 1

p1_label_178:
!	Mem[0000000014000120] = 4160dd73 c00a91e9 db6a74e8 43e9a396
	prefetcha [%i0+0x120]%asi,23
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000014800000] = 4a4a325a 602e6dd3
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000014800000] = 00000000 000000ff
	nop
!	%l1 = 00000000000000ff, %l7 = ffffffffffffb00c, %l4 = 0000000000077088
	andn	%l1,%l7,%l4		! %l4 = 00000000000000f3
	fbne	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_179:
!	%l5 = fffffebb9ae20938, Mem[0000000015000008] = fffff097
	stha	%l5,[%i2+%o6]0x80	! Mem[0000000015000008] = 0938f097
p1_b200:
	membar	#Sync			! Added by membar checker (335)
!	Mem[0000000014000014] = 2b2adf43, %l6 = 0000000000077088
	lduwa	[%i0+0x014]%asi,%l6	! %l6 = 000000002b2adf43
	set	p1_b201,%o7
	fba,a,pn %fcc2,p1_near_1_he	! Branch Taken, %fcc2 = 0
!	%l4 = 000000f3, %l5 = 9ae20938, Mem[00000000140001a8] = 4f11f481 09bfceb5
	std	%l4,[%i0+0x1a8]	! Annulled
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x0c9,%g2
p1_b201:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000000
!	%l3  = fffffebb9ae20954
	membar	#Sync			! Added by membar checker (336)
!	%l1 = 00000000000000ff, Mem[0000000015800090] = 10ee1f923080b9bf
	stx	%l1,[%i3+0x090]		! Mem[0000000015800090] = 00000000000000ff

p1_label_180:
!	%f8  = 3fb329b1 00000000, %f22 = 3fb329b1 280f2500
	fcmped	%fcc1,%f8 ,%f22		! %fcc1 = 1
!	Mem[0000000014000000] = 00000000, %l5 = fffffebb9ae20938
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l3 = fffffebb9ae20954, immed = fffffa94, %y  = 00000000
	umulcc	%l3,-0x56c,%l1		! %l1 = 9ae2060c3e756c90, %ccr = 80
!	%f23 = 280f2500, %f24 = c65a8a2b
	fcmps	%fcc2,%f23,%f24		! %fcc2 = 2
!	%l1 = 9ae2060c3e756c90, immed = 0000000f, %l4 = 00000000000000f3
	sra	%l1,0x00f,%l4		! %l4 = 0000000000007cea

p1_label_181:
!	Mem[0000000031000050] = 000000e9, %l1 = 9ae2060c3e756c90
	ldsba	[%o2+0x051]%asi,%l1	! %l1 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000031800050] = e7bd1326 eb33041d
	stda	%l0,[%o3+0x050]%asi	! Mem[0000000031800050] = 00000000 00000000
!	%l4 = 0000000000007cea, immed = 00000018, %l5 = 0000000000000000
	sra	%l4,0x018,%l5		! %l5 = 0000000000000000
!	%l7 = ffffffffffffb00c, Mem[0000000031800050] = 00000000
	sth	%l7,[%o3+0x050]		! Mem[0000000031800050] = b00c0000
!	%l0 = 0000000000000000, immed = fffffd6b, %l7 = ffffffffffffb00c
	xor	%l0,-0x295,%l7		! %l7 = fffffffffffffd6b

p1_label_182:
!	%l2 = 0000000000000000, Mem[0000000030000050] = 11e75cff
	sth	%l2,[%o0+0x050]		! Mem[0000000030000050] = 00005cff
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800058] = 5d2fceb200006e00, %l7 = fffffffffffffd6b
	ldx	[%o1+0x058],%l7		! %l7 = 5d2fceb200006e00
p1_b202:
	ba,a	p1_b203			! Branch Taken, %ccr = 80, CWP = 0
!	%l2 = 0000000000000000, Mem[0000000014800008] = b3f3fa24
	stha	%l2,[%i1+%o6]0x80	! Annulled
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p1_branch_failed
	mov	0x0cb,%g2
p1_b203:

p1_label_183:
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800000] = 00000000, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
p1_b204:
	membar	#Sync			! Added by membar checker (337)
!	%f8  = 3fb329b1, %f27 = 00000000, %f16 = 00000000
	fmuls	%f8 ,%f27,%f16		! %f16 = 00000000
!	Mem[0000000015800020] = 0871ae5e, %l2 = 0000000000000000
	ldswa	[%i3+0x020]%asi,%l2	! %l2 = 000000000871ae5e
!	%l6 = 2b2adf43, %l7 = 00006e00, Mem[00000000170000f8] = f19fbfe9 9c55aeaf
	stda	%l6,[%i6+0x0f8]%asi	! Mem[00000000170000f8] = 2b2adf43 00006e00

p1_label_184:
!	%l3 = fffffebb9ae20954
	sethi	%hi(0x7b03f400),%l3	! %l3 = 000000007b03f400
!	%f28 = 00000000 00000000, %f10 = 00000000 00000000
	fabsd	%f28,%f10		! %f10 = 00000000 00000000
!	Mem[0000000015800000] = 0000ff6e, %l2 = 000000000871ae5e
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l3 = 000000007b03f400, Mem[0000000015800008] = ff000000
	stha	%l3,[%i3+%o6]0x80	! Mem[0000000015800008] = f4000000
	bleu,a	p1_not_taken_0		! Branch Not Taken, %ccr = 80

p1_label_185:
!	Mem[0000000014800020] = 000000aa aef68019 f0a9c4ed 337cde86
	prefetch [%i1+0x020],3	! Annulled
p1_b205:
	membar	#Sync			! Added by membar checker (338)
!	%f26 = 00000000, %f11 = 00000000
	fstoi	%f26,%f11		! %f11 = 00000000
!	%f2  = 00000000 00000000, %f16 = 00000000
	fxtos	%f2 ,%f16		! %f16 = 00000000
	set	p1_b206,%o7
	fbule,a	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001500016c] = 000000b9, %l1 = 0000000000000000
	lduh	[%i2+0x16c],%l1		! %l1 = 0000000000000000
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x0ce,%g2
p1_b206:
!	Registers modified during the branch to p1_far_1
!	%l1  = 0000000000007fff

p1_label_186:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 000000002b2adf43, Mem[000000001500017c] = 2560b4d4
	stw	%l6,[%i2+0x17c]		! Annulled
p1_b207:
	membar	#Sync			! Added by membar checker (339)
!	Branch On Register, %l5 = 0000000000000000
	brnz,a,pt %l5,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000015800060] = 0000059a c00a91e9 49e6748c 7c2ffeb7
	prefetch [%i3+0x060],1	! Annulled
p1_b208:
	membar	#Sync			! Added by membar checker (340)
!	Mem[0000000015800108] = abf24d0c, %l5 = 0000000000000000
	ldsha	[%i3+0x108]%asi,%l5	! %l5 = ffffffffffffabf2

p1_label_187:
	bleu	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[00000000158001e0] = 1d379097a69a4c2f, %l4 = 0000000000007cea
	ldx	[%i3+0x1e0],%l4		! %l4 = 1d379097a69a4c2f
p1_b209:
	membar	#Sync			! Added by membar checker (341)
	fbuge,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000015800000] = 0000ff6e 92532f36 f4000000 fffb67ad
	prefetch [%i3+0x000],1	! Annulled
p1_b210:
	membar	#Sync			! Added by membar checker (342)
!	Mem[0000000014000008] = 0000336100000000, %l4 = 1d379097a69a4c2f
	ldxa	[%i0+%o6]0x80,%l4	! %l4 = 0000336100000000

p1_label_188:
	set	p1_b211,%o7
	fble	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	%l6 = 000000002b2adf43, Mem[0000000014800046] = a2499c4d
	stb	%l6,[%i1+0x046]		! Mem[0000000014800044] = a249434d
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x0d3,%g2
p1_b211:
!	Registers modified during the branch to p1_far_3
!	%l0  = 00000000000000bb
!	%l3  = 000000000000c0bb
	membar	#Sync			! Added by membar checker (343)
!	Mem[00000000148001fc] = 501f794e, %l0 = 00000000000000bb
	lduha	[%i1+0x1fc]%asi,%l0	! %l0 = 000000000000501f
	nop
	bneg	p1_not_taken_0		! Branch Not Taken, %ccr = 80

p1_label_189:
!	Mem[00000000150001a0] = acb8955c2a4f02b3, %l3 = 000000000000c0bb
	ldx	[%i2+0x1a0],%l3		! %l3 = acb8955c2a4f02b3
p1_b212:
	membar	#Sync			! Added by membar checker (344)
!	%l1 = 0000000000007fff, %l1 = 0000000000007fff, %l7 = 5d2fceb200006e00
	orcc	%l1,%l1,%l7		! %l7 = 0000000000007fff, %ccr = 00
	set	p1_b213,%o7
	fbge,pt	%fcc0,p1_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000000] = ff330033, %l0 = 000000000000501f
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff330033
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x0d5,%g2
p1_b213:
!	Registers modified during the branch to p1_near_3
!	%l2  = 000000001b9930c4
!	%l7  = acb8955cd57c0280
	set	p1_b214,%o7
	fbge,a	p1_far_0_le	! Branch Taken, %fcc0 = 0

p1_label_190:
!	Mem[0000000015000000] = ff330033, %l0 = 00000000ff330033
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000ff33
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x0d6,%g2
p1_b214:
!	Registers modified during the branch to p1_far_0
!	%l6  = 53476aa32a83f23c
	membar	#Sync			! Added by membar checker (345)
!	Mem[0000000014000000] = 00000000, %l7 = acb8955cd57c0280
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
	set	p1_b215,%o7
	fble,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000148000a0] = 7e62ef6f fbcf9e54 d8928a28 7a2b4964
	prefetch [%i1+0x0a0],1
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x0d7,%g2
p1_b215:
!	Registers modified during the branch to p1_far_2
!	%l0  = 000000007f9880cd
!	%l2  = 0000000000000000
!	%l4  = 53476aa32a84f16f
!	%l5  = 0000000004b1b828
!	%l7  = ffffff8730634adf
	membar	#Sync			! Added by membar checker (346)
	set	p1_b216,%o7
	fbne,a,pt %fcc1,p1_near_1_he	! Branch Taken, %fcc1 = 1

p1_label_191:
!	Mem[0000000014000008] = 00003361, %l0 = 000000007f9880cd
	lduwa	[%i0+%o6]0x80,%l0	! %l0 = 0000000000003361
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0d8,%g2
p1_b216:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000000
!	%l3  = acb8955c2f00badb
	membar	#Sync			! Added by membar checker (347)
!	Mem[0000000014800181] = 2fb4ca62, %l4 = 53476aa32a84f16f
	ldstuba	[%i1+0x181]%asi,%l4	! %l4 = 00000000000000b4
!	Branch On Register, %l3 = acb8955c2f00badb
	brnz,a,pn %l3,p1_b217		! Branch Taken
!	Mem[00000000150001e0] = 58800cfc d669d8ec ccf599e4 e056a087
	prefetch [%i2+0x1e0],3
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0d9,%g2
p1_b217:
	membar	#Sync			! Added by membar checker (348)
	set	p1_b218,%o7
	fbule,a,pt %fcc0,p1_near_1_he	! Branch Taken, %fcc0 = 0

p1_label_192:
!	Mem[00000000150001a0] = acb8955c 2a4f02b3 13342835 46789407
	prefetch [%i2+0x1a0],16
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x0da,%g2
p1_b218:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000000
!	%l3  = acb8955c33b27303
	membar	#Sync			! Added by membar checker (349)
	set	p1_b219,%o7
	fbl,a,pn %fcc1,p1_near_2_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000015000008] = 0938f097 dd7f86ed, %l6 = 2a83f23c, %l7 = 30634adf
	ldda	[%i2+%o6]0x80,%l6	! %l6 = 000000000938f097 00000000dd7f86ed
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p1_branch_failed
	mov	0x0db,%g2
p1_b219:
!	Registers modified during the branch to p1_near_2
!	%l0  = ffffffffffff8001
!	%l3  = fffffffffb4e43b2
!	%l4  = 0000000000000000
!	%l7  = 0000000000007334
	membar	#Sync			! Added by membar checker (350)
!	%f28 = 00000000 00000000, %f30 = 614fb3ef f2d45158
	fnegd	%f28,%f30		! %f30 = 80000000 00000000
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_193:
!	%l5 = 0000000004b1b828, Mem[00000000168000fc] = af285161
	stb	%l5,[%i5+0x0fc]		! Annulled
p1_b220:
	bpos,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l0 = ffffffffffff8001, Mem[0000000031800018] = 7fffffff
	stw	%l0,[%o3+0x018]		! Annulled
p1_b221:
	membar	#Sync			! Added by membar checker (351)
!	%f12 = 00000001 8ad82340, %f10 = 00000000 00000000
	fnegd	%f12,%f10		! %f10 = 80000001 8ad82340
!	%l0 = ffffffffffff8001, %l1 = 0000000000007fff, %l5 = 0000000004b1b828
	subccc	%l0,%l1,%l5		! %l5 = ffffffffffff0002, %ccr = 88

p1_label_194:
	ble	p1_b222			! Branch Taken, %ccr = 88, CWP = 0
!	%l7 = 0000000000007334, Mem[0000000014800000] = 00000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000014800000] = 34000000
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0de,%g2
p1_b222:
	membar	#Sync			! Added by membar checker (352)
!	%l0 = ffffffffffff8001, Mem[0000000015800000] = 0000ff6e
	stha	%l0,[%i3+%g0]0x80	! Mem[0000000015800000] = 8001ff6e
!	Mem[00000000150000a4] = f6276fe6, %l2 = 0000000000000000
	ldsba	[%i2+0x0a5]%asi,%l2	! %l2 = 0000000000000027
!	Mem[00000000158000b3] = 0c173944, %l2 = 0000000000000027
	ldstuba	[%i3+0x0b3]%asi,%l2	! %l2 = 0000000000000044

p1_label_195:
	set	p1_b223,%o7
	fba,a,pt %fcc3,p1_near_1_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000032000040] = 9270504b 0b09b218 00000000 000000ff
	prefetch [%o4+0x040],1	! Annulled
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p1_branch_failed
	mov	0x0df,%g2
p1_b223:
	membar	#Sync			! Added by membar checker (353)
!	%l1 = 0000000000007fff, Mem[0000000032000002] = 00002404
	stba	%l1,[%o4+0x002]%asi	! Mem[0000000032000000] = ff002404
!	Mem[0000000015000020] = 5a2331dd 778657da 343cfcfb c769c0bb
	prefetch [%i2+0x020],16
!	%l6 = 000000000938f097, immed = 00000e5a, %l0 = ffffffffffff8001
	orn	%l6,0xe5a,%l0		! %l0 = fffffffffffff1b7

p1_label_196:
!	Mem[0000000014000000] = 00000000, %l7 = 0000000000007334
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 0000000000000044, Mem[00000000158000c4] = 668d10fb
	stw	%l2,[%i3+0x0c4]		! Annulled
p1_b224:
	membar	#Sync			! Added by membar checker (354)
!	Mem[00000000158001a0] = 00000000 744309b9
	flush	%i3+0x1a0
!	%l6 = 000000000938f097, immed = 00000526, %l3 = fffffffffb4e43b2
	addccc	%l6,0x526,%l3		! %l3 = 000000000938f5bd, %ccr = 00

p1_label_197:
!	%l7 = 0000000000000000, Mem[0000000014800000] = 34000000
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000014800000] = 00000000
	fbg,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l5 = ffffffffffff0002, Mem[0000000032000070] = 776735ebcf9aa2f9
	stx	%l5,[%o4+0x070]		! Mem[0000000032000070] = ffffffffffff0002
p1_b225:
	membar	#Sync			! Added by membar checker (355)
!	%l3 = 000000000938f5bd, immed = fffffe24, %l1 = 0000000000007fff
	andn	%l3,-0x1dc,%l1		! %l1 = 0000000000000199
!	%f27 = 00000000, %f31 = 00000000, %f30 = 80000000
	fadds	%f27,%f31,%f30		! %f30 = 00000000

p1_label_198:
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800000] = 00000000 000000ff b3f3fa24 5ae967ad
	prefetch [%i1+0x000],16	! Annulled
p1_b226:
	membar	#Sync			! Added by membar checker (356)
	fbul,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[00000000158000a0] = 15510c76 b7e607da ee99945f fa2fefbc
	prefetch [%i3+0x0a0],2	! Annulled
p1_b227:
	membar	#Sync			! Added by membar checker (357)
!	%f8  = 3fb329b1 00000000, %f8  = 3fb329b1 00000000, %f22 = 3fb329b1 280f2500
	fdivd	%f8 ,%f8 ,%f22		! %f22 = 3ff00000 00000000

p1_label_199:
!	%f26 = 00000000, %f7  = 614fb3ef, %f6  = 00000000
	fdivs	%f26,%f7 ,%f6 		! %f6  = 00000000
!	%l5 = ffffffffffff0002, immed = 00000d66, %l5 = ffffffffffff0002
	andn	%l5,0xd66,%l5		! %l5 = ffffffffffff0000
!	%f30 = 00000000 00000000, %f9  = 00000000
	fdtoi	%f30,%f9 		! %f9  = 00000000
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l6 = 0938f097, %l7 = 00000000, Mem[0000000015000008] = 0938f097 dd7f86ed
	stda	%l6,[%i2+%o6]0x80	! Annulled
p1_b228:

p1_label_200:
	membar	#Sync			! Added by membar checker (358)
!	%l2 = 0000000000000044, %l1 = 0000000000000199, %l7 = 0000000000000000
	add	%l2,%l1,%l7		! %l7 = 00000000000001dd
!	%l1 = 0000000000000199, Mem[0000000015000008] = 0938f097
	stha	%l1,[%i2+%o6]0x80	! Mem[0000000015000008] = 0199f097
!	%l4 = 0000000000000000, %l7 = 00000000000001dd, %l7 = 00000000000001dd
	subccc	%l4,%l7,%l7		! %l7 = fffffffffffffe23, %ccr = 99
!	%l2 = 0000000000000044, immed = 0000060b, %l1 = 0000000000000199
	tsubcc	%l2,0x60b,%l1		! %l1 = fffffffffffffa39, %ccr = 9b
!	%l3 = 000000000938f5bd, %l0 = fffffffffffff1b7, %l0 = fffffffffffff1b7
	addc	%l3,%l0,%l0		! %l0 = 000000000938e775

	membar	#Sync			! Force all stores to complete

!	End of Random Code for Processor 1

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x004]		! Set processor 1 done flag

!	Check Registers

p1_check_registers:
	set	p1_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000000938e775
	bne,a,pn %xcc,p1_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be fffffffffffffa39
	bne,a,pn %xcc,p1_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000044
	bne,a,pn %xcc,p1_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000938f5bd
	bne,a,pn %xcc,p1_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffffff0000
	bne,a,pn %xcc,p1_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000938f097
	bne,a,pn %xcc,p1_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be fffffffffffffe23
	bne,a,pn %xcc,p1_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p1_check_fp_registers:
	set	p1_temp,%g1
	set	p1_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000001 8ad82340
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 614fb3ef
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 3fb329b1 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 80000001 8ad82340
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000001 8ad82340
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 80000001 8ad82340
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 3ff00000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be c65a8a2b 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p1_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 000000004160dd73
	ldx	[%i0+0x000],%g3		! Observed data at 0000000014000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000336100000000
	ldx	[%i0+0x008],%g3		! Observed data at 0000000014000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 649d06ff8296f318
	ldx	[%i0+0x048],%g3		! Observed data at 0000000014000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 000000000000005c
	ldx	[%i0+0x088],%g3		! Observed data at 0000000014000088
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 20ede1f6795bdefe
	ldx	[%i0+0x090],%g3		! Observed data at 0000000014000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 924a3259e0f04f86
	ldx	[%i0+0x098],%g3		! Observed data at 0000000014000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 00000000000000b9
	ldx	[%i0+0x0b8],%g3		! Observed data at 00000000140000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 3df44cd4a3cf92ff
	ldx	[%i0+0x0c8],%g3		! Observed data at 00000000140000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = bc3b3ab40000ff27
	ldx	[%i0+0x0d0],%g3		! Observed data at 00000000140000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 5dc2177b12d66790
	ldx	[%i0+0x108],%g3		! Observed data at 0000000014000108
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x110],%g2		! Expect data = bca1fc53fffff6e0
	ldx	[%i0+0x110],%g3		! Observed data at 0000000014000110
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x150],%g2		! Expect data = 7fffffffc27f77d5
	ldx	[%i0+0x150],%g3		! Observed data at 0000000014000150
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x178],%g2		! Expect data = 0000000200000000
	ldx	[%i0+0x178],%g3		! Observed data at 0000000014000178
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x178,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 00000000ffffffff
	ldx	[%i0+0x1f8],%g3		! Observed data at 00000000140001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000000000ff
	ldx	[%i1+0x000],%g3		! Observed data at 0000000014800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = b3f3fa245ae967ad
	ldx	[%i1+0x008],%g3		! Observed data at 0000000014800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 000000aaaef68019
	ldx	[%i1+0x020],%g3		! Observed data at 0000000014800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 70ad481ca249434d
	ldx	[%i1+0x040],%g3		! Observed data at 0000000014800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x048],%g2		! Expect data = d7d10000ebe2162a
	ldx	[%i1+0x048],%g3		! Observed data at 0000000014800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x060],%g2		! Expect data = ffffffff00000000
	ldx	[%i1+0x060],%g3		! Observed data at 0000000014800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 0572c573f04f05be
	ldx	[%i1+0x078],%g3		! Observed data at 0000000014800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 497700aa7b46244d
	ldx	[%i1+0x098],%g3		! Observed data at 0000000014800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 000000ff2404d07e
	ldx	[%i1+0x0b8],%g3		! Observed data at 00000000148000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x170],%g2		! Expect data = 55834052fa8eff45
	ldx	[%i1+0x170],%g3		! Observed data at 0000000014800170
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x180],%g2		! Expect data = 2fffca6264461602
	ldx	[%i1+0x180],%g3		! Observed data at 0000000014800180
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = 1fb7ff5a46be122f
	ldx	[%i1+0x1a0],%g3		! Observed data at 00000000148001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 6d27a5573d92a06f
	ldx	[%i1+0x1b0],%g3		! Observed data at 00000000148001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = ece20b765fdc9add
	ldx	[%i1+0x1d0],%g3		! Observed data at 00000000148001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d0,%g4

	set	p1_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff330033dd7f86ed
	ldx	[%i2+0x000],%g3		! Observed data at 0000000015000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0199f097dd7f86ed
	ldx	[%i2+0x008],%g3		! Observed data at 0000000015000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 00000000000000ff
	ldx	[%i2+0x040],%g3		! Observed data at 0000000015000040
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x058],%g2		! Expect data = a9a71a197004e71c
	ldx	[%i2+0x058],%g3		! Observed data at 0000000015000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 5d2fceb2195524c4
	ldx	[%i2+0x0a8],%g3		! Observed data at 00000000150000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 9108acac267687b5
	ldx	[%i2+0x0e0],%g3		! Observed data at 00000000150000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x118],%g2		! Expect data = ff8366e0d036e9af
	ldx	[%i2+0x118],%g3		! Observed data at 0000000015000118
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 000000a100000018
	ldx	[%i2+0x120],%g3		! Observed data at 0000000015000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x130],%g2		! Expect data = b1d316fb99e043dc
	ldx	[%i2+0x130],%g3		! Observed data at 0000000015000130
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x148],%g2		! Expect data = 5bef16870fee60ca
	ldx	[%i2+0x148],%g3		! Observed data at 0000000015000148
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x158],%g2		! Expect data = c5a07497bc897088
	ldx	[%i2+0x158],%g3		! Observed data at 0000000015000158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x168],%g2		! Expect data = 00000000000000b9
	ldx	[%i2+0x168],%g3		! Observed data at 0000000015000168
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x180],%g2		! Expect data = a7684b98bb4c7b29
	ldx	[%i2+0x180],%g3		! Observed data at 0000000015000180
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 1334283546789407
	ldx	[%i2+0x1a8],%g3		! Observed data at 00000000150001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = ecb7b83200000000
	ldx	[%i2+0x1b0],%g3		! Observed data at 00000000150001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 0000b6d2f6261946
	ldx	[%i2+0x1f0],%g3		! Observed data at 00000000150001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f0,%g4

	set	p1_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 8001ff6e92532f36
	ldx	[%i3+0x000],%g3		! Observed data at 0000000015800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = f4000000fffb67ad
	ldx	[%i3+0x008],%g3		! Observed data at 0000000015800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x038],%g2		! Expect data = 7ae668345ab3d630
	ldx	[%i3+0x038],%g3		! Observed data at 0000000015800038
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 00006e0055deb7ae
	ldx	[%i3+0x058],%g3		! Observed data at 0000000015800058
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 0000059ac00a91e9
	ldx	[%i3+0x060],%g3		! Observed data at 0000000015800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 00000000000000ff
	ldx	[%i3+0x090],%g3		! Observed data at 0000000015800090
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = 0c1739ff12bf65b2
	ldx	[%i3+0x0b0],%g3		! Observed data at 00000000158000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 5b831d41ffffa0f7
	ldx	[%i3+0x0c8],%g3		! Observed data at 00000000158000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = ffffffff80000c60
	ldx	[%i3+0x0f8],%g3		! Observed data at 00000000158000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0f8,%g4
	ldx	[%g1+0x110],%g2		! Expect data = 7516303267900028
	ldx	[%i3+0x110],%g3		! Observed data at 0000000015800110
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x148],%g2		! Expect data = 7f3e51ae43407777
	ldx	[%i3+0x148],%g3		! Observed data at 0000000015800148
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x158],%g2		! Expect data = 43a46f4b73ff3112
	ldx	[%i3+0x158],%g3		! Observed data at 0000000015800158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x170],%g2		! Expect data = 2103ea1e58ff3dc7
	ldx	[%i3+0x170],%g3		! Observed data at 0000000015800170
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x180],%g2		! Expect data = ffec8609001376b5
	ldx	[%i3+0x180],%g3		! Observed data at 0000000015800180
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = 00000000744309b9
	ldx	[%i3+0x1a0],%g3		! Observed data at 00000000158001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = df69fe87f82d645d
	ldx	[%i3+0x1f8],%g3		! Observed data at 00000000158001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local4_expect,%g1

!	Processor 1, local 4 is clean


	set	p1_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 86407710ea00e6dc
	ldx	[%i5+0x000],%g3		! Observed data at 0000000016800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 86a40d7cead15a22
	ldx	[%i5+0x008],%g3		! Observed data at 0000000016800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4

	set	p1_local6_expect,%g1
	ldx	[%g1+0x0f8],%g2		! Expect data = 2b2adf4300006e00
	ldx	[%i6+0x0f8],%g3		! Observed data at 00000000170000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0f8,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p1_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p1_memcheck_share0:
	ldx	[%g4+0x10],%g2	! Expected value = dc7c94dd6514ffff
	ldx	[%o0+0x10],%g3	! Read value at Mem[0000000030000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 00002dc7fffff097
	ldx	[%o0+0x18],%g3	! Read value at Mem[0000000030000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 00005cff9dff18f1
	ldx	[%o0+0x50],%g3	! Read value at Mem[0000000030000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = ffffffffff27318d
	ldx	[%o0+0x58],%g3	! Read value at Mem[0000000030000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p1_memcheck_share1:
	ldx	[%g4+0x10],%g2	! Expected value = f3b9d630ff4efb6c
	ldx	[%o1+0x10],%g3	! Read value at Mem[0000000030800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 5c233fae2404d07e
	ldx	[%o1+0x18],%g3	! Read value at Mem[0000000030800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = e0f04f86b1d316fb
	ldx	[%o1+0x50],%g3	! Read value at Mem[0000000030800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 5d2fceb200006e00
	ldx	[%o1+0x58],%g3	! Read value at Mem[0000000030800058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p1_memcheck_share2:
	ldx	[%g4+0x10],%g2	! Expected value = 47327b64bb89ff5c
	ldx	[%o2+0x10],%g3	! Read value at Mem[0000000031000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 146a7012ff23c9f1
	ldx	[%o2+0x18],%g3	! Read value at Mem[0000000031000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 000000e929fae0ff
	ldx	[%o2+0x50],%g3	! Read value at Mem[0000000031000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = ffffffff00cc002c
	ldx	[%o2+0x58],%g3	! Read value at Mem[0000000031000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p1_memcheck_share3:
	ldx	[%g4+0x10],%g2	! Expected value = ffec8609ff4efb6c
	ldx	[%o3+0x10],%g3	! Read value at Mem[0000000031800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 7fffffffe538f398
	ldx	[%o3+0x18],%g3	! Read value at Mem[0000000031800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = b00c000000000000
	ldx	[%o3+0x50],%g3	! Read value at Mem[0000000031800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = ea2900fb9b1d60b0
	ldx	[%o3+0x58],%g3	! Read value at Mem[0000000031800058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

!	The test for processor 1 has passed

p1_passed:
	ta	GOOD_TRAP
	nop

p1_reg_l0_fail:
	or	%g0,0xbd0,%g1
	ba,a	p1_failed
p1_reg_l1_fail:
	or	%g0,0xbd1,%g1
	ba,a	p1_failed
p1_reg_l2_fail:
	or	%g0,0xbd2,%g1
	ba,a	p1_failed
p1_reg_l3_fail:
	or	%g0,0xbd3,%g1
	ba,a	p1_failed
p1_reg_l4_fail:
	or	%g0,0xbd4,%g1
	ba,a	p1_failed
p1_reg_l5_fail:
	or	%g0,0xbd5,%g1
	ba,a	p1_failed
p1_reg_l6_fail:
	or	%g0,0xbd6,%g1
	ba,a	p1_failed
p1_reg_l7_fail:
	or	%g0,0xbd7,%g1
	ba,a	p1_failed
p1_freg_fail:
	mov	%l0,%g3
	ba	p1_failed
	mov	%l1,%g2


!	The test for processor 1 failed

p1_failed:
	set	done_flags,%g1
	mov	3,%g5
	st	%g5,[%g1+0x004]		! Set processor 1 done flag

	set	p1_temp,%g6
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop


!	The local area data for processor 1 failed

p1_local_failed:
	set	done_flags,%g5
	mov	3,%g6
	st	%g5,[%g5+0x004]		! Set processor 1 done flag

	set	p1_temp,%g6
	add	%g1,%g4,%g1
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop

p1_dfill_failed:
	ba	p1_failed
	mov	0xddd,%g1

p1_selfmod_failed:
	ba	p1_failed
	mov	0xabc,%g1


p1_common_error:
	or	%g0,0xee1,%g1
	ba	p1_failed
	mov	%o5,%g3
p1_branch_failed:
	mov	0xbbb,%g1
	rd	%ccr,%g2
	ba	p1_failed
	mov	0x0,%g3

p1_trap1e:
	andn	%l5,-0x9f8,%l4
	mulx	%l0,-0x455,%l7
	done

p1_trap1o:
	andn	%l5,-0x9f8,%l4
	mulx	%l0,-0x455,%l7
	done


p1_trap2e:
	prefetch [%i0+0x0e0],2
	stw	%l1,[%o2+0x050]		! Mem[0000000031000050]
	ldsb	[%o3+0x055],%l1		! Mem[0000000031800055]
	done

p1_trap2o:
	prefetch [%o0+0x0e0],2
	stw	%l1,[%i2+0x050]		! Mem[0000000031000050]
	ldsb	[%i3+0x055],%l1		! Mem[0000000031800055]
	done


p1_dispatch_failed:
	set	p1_temp,%g7
	set	0xbad1ccdd,%g1
	st	%g1,[%g7]
	ta	BAD_TRAP
	nop

p1_xintr_cnt_failed:
	set	p1_temp,%g7
	set	0xbad1ccee,%g1
	st	%g1,[%g7]
	st	%g2,[%g7+4]		! Expected count
	st	%g3,[%g7+8]		! Observed count
	ta	BAD_TRAP
	nop

p1_init_memory_pointers:
	set	p1_init_registers,%g1
	mov	%g0,%g4
	mov	%g0,%g5
	mov	%g0,%g6
	mov	%g0,%g7

!	Initialize memory pointers for window 0
	set	p1_local0_start,%i0
	set	p1_local1_start,%i1
	set	p1_local2_start,%i2
	set	p1_local3_start,%i3
	set	p1_local4_start,%i4
	set	p1_local5_start,%i5
	set	p1_local6_start,%i6
	mov	%g0,%i7
!	Init Local Registers in Window 0
	ldx	[%g1+0x000],%l0	! %l0 = 700967ffbceea408
	ldx	[%g1+0x008],%l1	! %l1 = 120cc0ffdd7f86ed
	ldx	[%g1+0x010],%l2	! %l2 = 226432006bf77361
	ldx	[%g1+0x018],%l3	! %l3 = aab9cbff95771b63
	ldx	[%g1+0x020],%l4	! %l4 = 6837bb005f7119ee
	ldx	[%g1+0x028],%l5	! %l5 = 6b6629ffe163fe99
	ldx	[%g1+0x030],%l6	! %l6 = dac2bfffa04120d1
	ldx	[%g1+0x038],%l7	! %l7 = e7fbb4ffddfc4d72

!	Initialize the output register of window 0
	set	share0_start,%o0
	set	share1_start,%o1
	set	share2_start,%o2
	set	share3_start,%o3
	set	unres0_start,%o4
	set	common_start,%o5
	mov	0x08,%o6

	retl
	nop

!	Random code for Processor 2

processor_4:
	ta	T_CHANGE_PRIV
	set	done_flags,%g1
	mov	1,%g2
	st	%g2,[%g1+0x08]		! Set the start flag
	wrpr	%g0,7,%cleanwin
	call	p2_init_memory_pointers
	wr	%g0,0x80,%asi

!	Initialize the floating point registers for processor 2

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p2_init_freg,%g1
	ldd	[%g1+0x00],%f0		! %f0  = 83b56f93, %f1  = c0243964
	ldd	[%g1+0x08],%f2		! %f2  = 4b22c039, %f3  = 34578d12
	ldd	[%g1+0x10],%f4		! %f4  = 763bb636, %f5  = 3cbae3fb
	ldd	[%g1+0x18],%f6		! %f6  = f0b4a323, %f7  = 336dde11
	ldd	[%g1+0x20],%f8		! %f8  = 5f3006f0, %f9  = 9e4a8b94
	ldd	[%g1+0x28],%f10		! %f10 = e5305f99, %f11 = 581e1d7d
	ldd	[%g1+0x30],%f12		! %f12 = 5e0fd52f, %f13 = 0933a86b
	ldd	[%g1+0x38],%f14		! %f14 = 59fbc7b1, %f15 = 326244c9
	ldd	[%g1+0x40],%f16		! %f16 = c3d21aa2, %f17 = 81845fdc
	ldd	[%g1+0x48],%f18		! %f18 = a33c916a, %f19 = 12937dd9
	ldd	[%g1+0x50],%f20		! %f20 = b5db0121, %f21 = 5986cba5
	ldd	[%g1+0x58],%f22		! %f22 = 223b7684, %f23 = 0c9d7f84
	ldd	[%g1+0x60],%f24		! %f24 = fc356cdd, %f25 = 57b578c0
	ldd	[%g1+0x68],%f26		! %f26 = 2a75764b, %f27 = aefb398b
	ldd	[%g1+0x70],%f28		! %f28 = ccde23b1, %f29 = d9a2741e
	ldd	[%g1+0x78],%f30		! %f30 = 42fd801f, %f31 = de8f4267
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 2

p2_label_1:
!	Mem[00000000190000a0] = 01000004 006ddb58, %l6 = 881c45ffc725d5ca, %l6 = 881c45ffc725d5ca
	add	%i2,0xa0,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 277c78203a8cc996
!	Mem[0000000030000060] = a9fd881c6d2df8a4, %l7 = 510419005792e512
	ldxa	[%o0+0x060]%asi,%l7	! %l7 = a9fd881c6d2df8a4
	fbl,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031000060] = ebe40fd3, %l4 = c86050ff8df029da
	lduh	[%o2+0x062],%l4		! Annulled
p2_b1:
	membar	#Sync			! Added by membar checker (359)
!	%f16 = c3d21aa2 81845fdc, %f16 = c3d21aa2 81845fdc, %f8  = 5f3006f0 9e4a8b94
	faddd	%f16,%f16,%f8 		! %f8  = c3e21aa2 81845fdc

p2_label_2:
	set	p2_b2,%o7
	fbge,pt	%fcc0,p2_near_0_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001b000000] = e4bba227, %l6 = 277c78203a8cc996
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 00000000e4bba227
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p2_branch_failed
	mov	0x002,%g2
p2_b2:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000001
!	%l4  = 9ac250ff8097c29c
!	%l5  = 2c0ff90063dec6bf
!	%l6  = 8a378c5a795ad0c7
	membar	#Sync			! Added by membar checker (360)
!	%l4 = 9ac250ff8097c29c, %l5 = 2c0ff90063dec6bf, %l4 = 9ac250ff8097c29c
	xorcc	%l4,%l5,%l4		! %l4 = b6cda9ffe3490423, %ccr = 88
!	Mem[0000000031800060] = fdb9139a, %l4 = b6cda9ffe3490423
	lduha	[%o3+0x060]%asi,%l4	! %l4 = 000000000000fdb9
	bneg	p2_b3			! Branch Taken, %ccr = 88, CWP = 0

p2_label_3:
!	%l5 = 2c0ff90063dec6bf, Mem[0000000019800000] = 2f9584e3
	stba	%l5,[%i3+%g0]0x80	! Mem[0000000019800000] = bf9584e3
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x003,%g2
p2_b3:
	membar	#Sync			! Added by membar checker (361)
	fbne,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000019000000] = e3b1fa77, %l5 = 2c0ff90063dec6bf
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000e3
p2_b4:
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l4 = 000000000000fdb9, Mem[0000000019000000] = ffb1fa7729844c3c
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = 000000000000fdb9
p2_b5:

p2_label_4:
	membar	#Sync			! Added by membar checker (362)
!	%l4 = 000000000000fdb9, %l1 = 2c0ff90063dec6af, %y  = 00000000
	udivx	%l4,%l1,%l4		! %l4 = 0000000000000000
!	Branch On Register, %l4 = 0000000000000000
	brlz,a,pn %l4,p2_not_taken_0	! Branch Not Taken
!	Mem[000000001a800008] = 6334ba0b, %l3 = 8be919ffab2a5609
	lduha	[%i5+%o6]0x80,%l3	! Annulled
p2_b6:
	membar	#Sync			! Added by membar checker (363)
!	Mem[0000000031000028] = ace8b31179987366, %l0 = 0000000000000001
	ldxa	[%o2+0x028]%asi,%l0	! %l0 = ace8b31179987366
	fbg,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0

p2_label_5:
!	%l4 = 0000000000000000, Mem[0000000019000000] = 00000000
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = 00000000
p2_b7:
	membar	#Sync			! Added by membar checker (364)
!	Mem[0000000030000020] = 7c6be6c3b92f4589, %l6 = 8a378c5a795ad0c7
	ldxa	[%o0+0x020]%asi,%l6	! %l6 = 7c6be6c3b92f4589
!	%l1 = 2c0ff90063dec6af, immed = 000000c0, %l3 = 8be919ffab2a5609
	subccc	%l1,0x0c0,%l3		! %l3 = 2c0ff90063dec5ef, %ccr = 00
	set	p2_b8,%o7
	fba	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000188001e0] = e955dd99 dc6e2a65 33f53a01 706921fe
	prefetch [%i1+0x1e0],0
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x008,%g2
p2_b8:
!	Registers modified during the branch to p2_far_0
!	%l0  = d35221f19ff5b193
!	%l3  = 0000000000000068

p2_label_6:
	membar	#Sync			! Added by membar checker (365)
!	%l5 = 00000000000000e3, immed = 00000aa0, %l6 = 7c6be6c3b92f4589
	andcc	%l5,0xaa0,%l6		! %l6 = 00000000000000a0, %ccr = 00
!	Mem[0000000030000060] = a9fd881c 6d2df8a4, %l2 = 1c007e2e, %l3 = 00000068
	ldd	[%o0+0x060],%l2		! %l2 = 00000000a9fd881c 000000006d2df8a4
!	%f18 = a33c916a 12937dd9, %f18 = a33c916a 12937dd9, %f26 = 2a75764b aefb398b
	fdivd	%f18,%f18,%f26		! %f26 = 3ff00000 00000000
!	%l5 = 00000000000000e3, %l2 = 00000000a9fd881c, %l2 = 00000000a9fd881c
	and	%l5,%l2,%l2		! %l2 = 0000000000000000
!	Mem[0000000018800060] = cf699416 ccbc823a b81d29cb 2495dbce
	prefetch [%i1+0x060],3

p2_label_7:
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l2 = 00000000, %l3 = 6d2df8a4, Mem[0000000018800008] = 894c4ae1 4d2a20d7
	stda	%l2,[%i1+%o6]0x80	! Mem[0000000018800008] = 00000000 6d2df8a4
p2_b9:
	membar	#Sync			! Added by membar checker (366)
!	%f25 = 57b578c0, %f26 = 3ff00000 00000000
	fstox	%f25,%f26		! %f26 = 00016af1 80000000
!	Mem[0000000031000027] = 847012dc, %l0 = d35221f19ff5b193
	ldstuba	[%o2+0x027]%asi,%l0	! %l0 = 00000000000000dc
!	Mem[0000000018800000] = a0d651d2, %l0 = 00000000000000dc
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000a0d651d2

p2_label_8:
!	%l2 = 0000000000000000
	sethi	%hi(0xd5e94800),%l2	! %l2 = 00000000d5e94800
	fbug,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000003180002c] = ee4808c6, %l0 = 00000000a0d651d2
	lduh	[%o3+0x02e],%l0		! %l0 = 00000000000008c6
p2_b10:
	membar	#Sync			! Added by membar checker (367)
!	%f2  = 4b22c039, %f2  = 4b22c039
	fabss	%f2 ,%f2 		! %f2  = 4b22c039
!	Jump to jmpl_0, CWP = 0
	set	p2_jmpl_0_le,%g1
	jmpl	%g1,%g6

p2_label_9:
!	Mem[00000000188000c0] = 9d6dee46 e9e5b8bc 53d8d354 8c3b91af
	prefetch [%i1+0x0c0],21
!	Registers modified during the branch to p2_jmpl_0
!	%l3  = 0000000000000000
!	%l5  = a9fd881c6d2df8a4
!	%l6 = 00000000000000a0, immed = 0000078d, %l1 = 2c0ff90063dec6af
	and	%l6,0x78d,%l1		! %l1 = 0000000000000080
!	Mem[0000000031800068] = 2eb38d7e0dc6c195, %l7 = a9fd881c6d2df8a4
	ldxa	[%o3+0x068]%asi,%l7	! %l7 = 2eb38d7e0dc6c195
!	%l6 = 00000000000000a0, immed = 0000002e, %l5 = a9fd881c6d2df8a4
	sllx	%l6,0x02e,%l5		! %l5 = 0028000000000000
!	%l7 = 2eb38d7e0dc6c195
	setx	0xdfd09a3edfd09a3e,%g7,%l7 ! %l7 = dfd09a3edfd09a3e

p2_label_10:
!	Mem[0000000019800080] = 03151baa c34d54be 78f4c309 cd73b4ea
	prefetch [%i3+0x080],16
!	%l7 = dfd09a3edfd09a3e, %l6 = 00000000000000a0, %l6 = 00000000000000a0
	subccc	%l7,%l6,%l6		! %l6 = dfd09a3edfd0999e, %ccr = 88
	set	p2_b11,%o7
	fbe,pt	%fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 0
!	%l6 = dfd09a3edfd0999e, Mem[000000003180006b] = 2eb38d7e
	stb	%l6,[%o3+0x06b]		! Mem[0000000031800068] = 2eb38d9e
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x00b,%g2
p2_b11:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000000
!	%l3  = 0000000000000000
!	%l4  = 0000000000000000
	bvc,a	p2_b12			! Branch Taken, %ccr = 44, CWP = 0

p2_label_11:
!	Mem[0000000018000144] = c80ac9e5, %l1 = 0000000000000080
	ldub	[%i0+0x147],%l1		! %l1 = 00000000000000e5
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x00c,%g2
p2_b12:
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000031800024] = 34e54332, %l5 = 0028000000000000
	ldsb	[%o3+0x024],%l5		! %l5 = 0000000000000034
p2_b13:
	bneg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l7 = dfd09a3edfd09a3e, Mem[0000000019800000] = bf9584e37efad3d9
	stxa	%l7,[%i3+%g0]0x80	! Annulled
p2_b14:

p2_label_12:
	membar	#Sync			! Added by membar checker (368)
	fbn,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l6 = dfd0999e, %l7 = dfd09a3e, Mem[0000000018800008] = 00000000 6d2df8a4
	stda	%l6,[%i1+%o6]0x80	! Mem[0000000018800008] = dfd0999e dfd09a3e
p2_b15:
	membar	#Sync			! Added by membar checker (369)
!	%f16 = c3d21aa2 81845fdc, %f16 = c3d21aa2 81845fdc, %f28 = ccde23b1 d9a2741e
	fsubd	%f16,%f16,%f28		! %f28 = 00000000 00000000
!	%f28 = 00000000, %f23 = 0c9d7f84, %f7  = 336dde11
	fdivs	%f28,%f23,%f7 		! %f7  = 00000000
!	Mem[0000000018800008] = dfd0999e, %l0 = 0000000000000000
	ldsba	[%i1+%o6]0x80,%l0	! %l0 = ffffffffffffffdf

p2_label_13:
!	call to call_0, CWP = 0
	call	p2_call_0_he
!	Mem[0000000030000020] = 7c6be6c3, %l2 = 00000000d5e94800
	ldsb	[%o0+0x020],%l2		! %l2 = 000000000000007c
!	Registers modified during the branch to p2_call_0
!	%l0  = 00000000000000c4
!	%l1  = 0000000000000090
!	%l2  = 00000000dfd09a3e
!	%l3  = 00000000dfd0999e
!	%l6  = ffffffffffffff3f
	fblg,a,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],2	! Annulled
p2_b16:
	membar	#Sync			! Added by membar checker (370)
!	%f12 = 5e0fd52f 0933a86b, %f28 = 00000000 00000000, %f14 = 59fbc7b1 326244c9
	fmuld	%f12,%f28,%f14		! %f14 = 00000000 00000000

p2_label_14:
!	%f4  = 763bb636 3cbae3fb, %f24 = fc356cdd 57b578c0
	fcmpd	%fcc2,%f4 ,%f24		! %fcc2 = 2
!	%f26 = 00016af1 80000000, %f26 = 00016af1 80000000
	fxtod	%f26,%f26		! %f26 = 42f6af18 00000000
!	%l5 = 0000000000000034, Mem[00000000190001bc] = f0ca7bd5
	stb	%l5,[%i2+0x1bc]		! Mem[00000000190001bc] = 34ca7bd5
!	%l7 = dfd09a3edfd09a3e, Mem[0000000030000022] = 7c6be6c3
	stb	%l7,[%o0+0x022]		! Mem[0000000030000020] = 7c6b3ec3
	fbug,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_15:
!	%l1 = 0000000000000090, Mem[0000000031800068] = 2eb38d9e
	stb	%l1,[%o3+0x068]		! Annulled
p2_b17:
	membar	#Sync			! Added by membar checker (371)
	set	p2_b18,%o7
	fbo,pn	%fcc1,p2_near_2_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000031000020] = 000000c4, %l2 = 00000000dfd09a3e
	lduh	[%o2+0x022],%l2		! %l2 = 00000000000000c4
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x012,%g2
p2_b18:
!	Registers modified during the branch to p2_near_2
!	%l3  = 00000000008dc7fc
!	%l4  = 0000000000000090
!	%l5  = 0000000000000000
!	%l7  = 00004e85e7d1c010
	membar	#Sync			! Added by membar checker (372)
!	%l5 = 0000000000000000, immed = 00000bfd, %l1 = 0000000000000090
	xor	%l5,0xbfd,%l1		! %l1 = 0000000000000bfd
!	Mem[0000000031800068] = 00000000 000000c4, %l0 = 00000000000000c4, %l2 = 00000000000000c4
	add	%o3,0x68,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = 2eb38d9e0dc6c195

p2_label_16:
!	Mem[000000001b0000c0] = 88c0a657 b52e20ac 0622615f 6199502e
	prefetch [%i6+0x0c0],21
!	%f20 = b5db0121 5986cba5, %f10 = e5305f99 581e1d7d
	fcmped	%fcc0,%f20,%f10		! %fcc0 = 2
	nop				! Delay added due to fcmp
	set	p2_b19,%o7
	fbne,pt	%fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 2
!	Mem[00000000180000ac] = 14be5e29, %l4 = 0000000000000090
	ldsb	[%i0+0x0ae],%l4		! %l4 = 000000000000005e
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x013,%g2
p2_b19:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000000
!	%l3  = 00000000000002ac
!	%l4  = 0000006080000000
	membar	#Sync			! Added by membar checker (373)
	set	p2_b20,%o7
	fbge,a,pn %fcc3,p2_near_1_he	! Branch Taken, %fcc3 = 0

p2_label_17:
!	Mem[0000000019000008] = 675d6110, %l3 = 00000000000002ac
	ldstuba	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000067
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x014,%g2
p2_b20:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000000
!	%l3  = 0000000000000026
!	%l4  = 00000030a1428b0c
	membar	#Sync			! Added by membar checker (374)
!	%l4 = 00000030a1428b0c, %l7 = 00004e85e7d1c010, %l0 = 0000000000000000
	orcc	%l4,%l7,%l0		! %l0 = 00004eb5e7d3cb1c, %ccr = 08
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],22
!	Mem[0000000019000000] = 00000000, %l7 = 00004e85e7d1c010
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
	fbul	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_18:
!	%l4 = 00000030a1428b0c, Mem[0000000030800028] = 3b9508b7
	stw	%l4,[%o1+0x028]		! Mem[0000000030800028] = a1428b0c
p2_b21:
	membar	#Sync			! Added by membar checker (375)
!	Branch On Register, %l4 = 00000030a1428b0c
	brlez,pt %l4,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000030000024] = b92f4589, %l5 = 0000000000000000
	ldsb	[%o0+0x027],%l5		! %l5 = ffffffffffffff89
p2_b22:
	membar	#Sync			! Added by membar checker (376)
!	Mem[000000001980005c] = 890e9d38, %l1 = 0000000000000bfd
	ldsw	[%i3+0x05c],%l1		! %l1 = ffffffff890e9d38
!	Mem[0000000018000157] = 578c8ba3, %l0 = 00004eb5e7d3cb1c
	ldstuba	[%i0+0x157]%asi,%l0	! %l0 = 00000000000000a3

p2_label_19:
	bvc	p2_b23			! Branch Taken, %ccr = 08, CWP = 0
!	%l0 = 00000000000000a3, Mem[0000000030000024] = b92f4589
	stw	%l0,[%o0+0x024]		! Mem[0000000030000024] = 000000a3
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x017,%g2
p2_b23:
	bg	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000018000188] = 82484995, %l3 = 0000000000000026
	lduh	[%i0+0x18a],%l3		! %l3 = 0000000000004995
p2_b24:
	membar	#Sync			! Added by membar checker (377)
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],21

p2_label_20:
!	%l2 = 2eb38d9e0dc6c195, %l3 = 0000000000004995, %l1 = ffffffff890e9d38
	sra	%l2,%l3,%l1		! %l1 = 000000000000006e
	nop
	fbg,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000019000000] = 00000000, %l3 = 0000000000004995
	lduba	[%i2+%g0]0x80,%l3	! Annulled
p2_b25:
	bl,a	p2_b26			! Branch Taken, %ccr = 08, CWP = 0

p2_label_21:
!	%l6 = ffffffffffffff3f, Mem[0000000019000008] = ff5d6110
	stwa	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = ffffff3f
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x01a,%g2
p2_b26:
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l7 = 0000000000000000, Mem[000000001800008e] = 7d7e7057
	stb	%l7,[%i0+0x08e]		! Mem[000000001800008c] = 7d7e0057
p2_b27:
	membar	#Sync			! Added by membar checker (378)
!	%l6 = ffffff3f, %l7 = 00000000, Mem[0000000032000068] = 036269f7 f75fc675
	std	%l6,[%o4+0x068]	! Mem[0000000032000068] = ffffff3f 00000000
	ba	p2_b28			! Branch Taken, %ccr = 08, CWP = 0

p2_label_22:
!	%l6 = ffffffffffffff3f, Mem[0000000019800000] = bf9584e3
	stwa	%l6,[%i3+%g0]0x80	! Mem[0000000019800000] = ffffff3f
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x01c,%g2
p2_b28:
	membar	#Sync			! Added by membar checker (379)
!	%f18 = a33c916a, %f27 = 00000000, %f18 = a33c916a
	fsubs	%f18,%f27,%f18		! %f18 = a33c916a
	set	p2_b29,%o7
	fba	p2_far_2_le	! Branch Taken, %fcc0 = 2
!	%l6 = ffffffffffffff3f, Mem[0000000019800008] = 3e05b4cf
	stba	%l6,[%i3+%o6]0x80	! Mem[0000000019800008] = 3f05b4cf
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x01d,%g2
p2_b29:
!	Registers modified during the branch to p2_far_2
!	%l2  = 0c00000000000000
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_23:
!	 Annulled
	ldd	[%o0+0x028],%l2
p2_b30:
	membar	#Sync			! Added by membar checker (380)
!	%f24 = fc356cdd 57b578c0, %f30 = 42fd801f de8f4267
	fcmpd	%fcc1,%f24,%f30		! %fcc1 = 1
!	Jump to jmpl_1, CWP = 0
	set	p2_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000019800008] = 3f05b4cf 5e58f339, %l0 = 000000a3, %l1 = 0000006e
	ldda	[%i3+%o6]0x80,%l0	! %l0 = 000000003f05b4cf 000000005e58f339
!	Registers modified during the branch to p2_jmpl_1
!	%l6  = 000030a1428b0c00
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08

p2_label_24:
!	Mem[0000000030000020] = 7c6b3ec3, %l2 = 0c00000000000000
	lduh	[%o0+0x022],%l2		! Annulled
p2_b31:
	membar	#Sync			! Added by membar checker (381)
	set	p2_b32,%o7
	fbge,a,pt %fcc0,p2_near_1_he	! Branch Taken, %fcc0 = 2
!	Mem[00000000188000c0] = 9d6dee46 e9e5b8bc 53d8d354 8c3b91af
	prefetch [%i1+0x0c0],23
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p2_branch_failed
	mov	0x020,%g2
p2_b32:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000880
!	%l3  = 0000000000000884
!	%l4  = f78d5fcbfa59dc00
	membar	#Sync			! Added by membar checker (382)
!	Mem[00000000190001b4] = a2045baa, %l5 = ffffffffffffff89
	swap	[%i2+0x1b4],%l5		! %l5 = 00000000a2045baa
!	%f16 = c3d21aa2 81845fdc, %f26 = 42f6af18 00000000
	fabsd	%f16,%f26		! %f26 = 43d21aa2 81845fdc

p2_label_25:
!	%f18 = a33c916a, %f14 = 00000000 00000000
	fstod	%f18,%f14		! %f14 = bc67922d 40000000
!	%l5 = 00000000a2045baa, immed = 00000022, %l2 = 0c00000000000000
	sllx	%l5,0x022,%l2		! %l2 = 88116ea800000000
!	%l6 = 428b0c00, %l7 = 00000000, Mem[0000000019800000] = ffffff3f 7efad3d9
	stda	%l6,[%i3+%g0]0x80	! Mem[0000000019800000] = 428b0c00 00000000
!	Mem[000000001a800040] = 0b5343d3 60416758 97427314 dca8e01b
	prefetcha [%i5+0x040]%asi,20
	set	p2_b33,%o7
	fbge	p2_far_3_he	! Branch Taken, %fcc0 = 2

p2_label_26:
!	Mem[0000000018800000] = 000000dc, %l1 = 000000005e58f339
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x021,%g2
p2_b33:
!	Registers modified during the branch to p2_far_3
!	%l2  = 0000000026a0b445
!	%l3  = 0000000000000042
!	%l5  = 88116ea800000065
!	%l7  = 77ee9157fffffeef
	membar	#Sync			! Added by membar checker (383)
!	%l6 = 000030a1428b0c00, %l6 = 000030a1428b0c00, %l5 = 88116ea800000065
	subccc	%l6,%l6,%l5		! %l5 = ffffffffffffffff, %ccr = 99
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l1 = 0000000000000000, Mem[000000001a000008] = 4e80a591cce53d70
	stxa	%l1,[%i4+%o6]0x80	! Mem[000000001a000008] = 0000000000000000
p2_b34:
	membar	#Sync			! Added by membar checker (384)
!	Mem[0000000031800020] = e38e96fc, %l0 = 0000000000000880
	lduw	[%o3+0x020],%l0		! %l0 = 00000000e38e96fc

p2_label_27:
!	%f28 = 00000000 00000000, %f12 = 5e0fd52f 0933a86b, %f26 = 43d21aa2 81845fdc
	fdivd	%f28,%f12,%f26		! %f26 = 00000000 00000000
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000040000038] = 3a133220, %l7 = 77ee9157fffffeef
	swap	[%o5+0x038],%l7		! Annulled
p2_b35:
	membar	#Sync			! Added by membar checker (385)
!	Branch On Register, %l5 = ffffffffffffffff
	brgez,a,pt %l5,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000060] = 50dcd281 672a632f eb63ab30 3ac3960f
	prefetch [%i2+0x060],20	! Annulled
p2_b36:

p2_label_28:
	membar	#Sync			! Added by membar checker (386)
!	%l4 = f78d5fcbfa59dc00, Mem[000000001880014e] = 5118ae91
	stb	%l4,[%i1+0x14e]		! Mem[000000001880014c] = 51180091
!	%l4 = f78d5fcbfa59dc00, %l1 = 0000000000000000, %l5 = ffffffffffffffff
	orcc	%l4,%l1,%l5		! %l5 = f78d5fcbfa59dc00, %ccr = 88
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800008] = dfd0999e, %l2 = 0000000026a0b445
	ldsha	[%i1+%o6]0x80,%l2	! %l2 = ffffffffffffdfd0
p2_b37:
	set	p2_b38,%o7
	fbuge,a	p2_far_1_le	! Branch Taken, %fcc0 = 2

p2_label_29:
!	%l2 = ffffdfd0, %l3 = 00000042, Mem[0000000019000000] = 00000000 0000fdb9
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000019000000] = ffffdfd0 00000042
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x026,%g2
p2_b38:
!	Registers modified during the branch to p2_far_1
!	%l1  = 000030a1428b0c00
!	%l2  = 000000000010a2c3
!	%l3  = 0000000000000740
	membar	#Sync			! Added by membar checker (387)
!	%f1  = c0243964, %f2  = 4b22c039 34578d12
	fitod	%f1 ,%f2 		! %f2  = c1cfede3 4e000000
!	Mem[000000003080006c] = 4f1721ad, %l7 = 77ee9157fffffeef
	ldsh	[%o1+0x06e],%l7		! %l7 = 00000000000021ad
	bcc	p2_b39			! Branch Taken, %ccr = 00, CWP = 0
!	%l5 = f78d5fcbfa59dc00, Mem[0000000018800008] = dfd0999e
	stba	%l5,[%i1+%o6]0x80	! Mem[0000000018800008] = 00d0999e
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x027,%g2
p2_b39:

p2_label_30:
	membar	#Sync			! Added by membar checker (388)
!	%l4 = f78d5fcbfa59dc00
	sethi	%hi(0xfbbe7000),%l4	! %l4 = 00000000fbbe7000
!	Mem[0000000018800138] = 68fb2b6c, %l7 = 00000000000021ad
	ldsh	[%i1+0x138],%l7		! %l7 = 00000000000068fb
!	Mem[00000000188001a0] = ab0143d2 08d1de42 88b4e3ee 45149ef6
	prefetcha [%i1+0x1a0]%asi,23
!	%f8  = c3e21aa2 81845fdc, %f16 = c3d21aa2 81845fdc
	fnegd	%f8 ,%f16		! %f16 = 43e21aa2 81845fdc
!	%f14 = bc67922d 40000000, %f0  = 83b56f93 c0243964
	fabsd	%f14,%f0 		! %f0  = 3c67922d 40000000

p2_label_31:
	fbn,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetch [%o4+0x000],3	! Annulled
p2_b40:
	membar	#Sync			! Added by membar checker (389)
!	Mem[0000000030000020] = 7c6b3ec3, %l1 = 000030a1428b0c00
	ldswa	[%o0+0x020]%asi,%l1	! %l1 = 000000007c6b3ec3
	fbule,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000003180006c] = 0dc6c195, %l5 = f78d5fcbfa59dc00
	ldsw	[%o3+0x06c],%l5		! Annulled
p2_b41:

p2_label_32:
	set	p2_b42,%o7
	fbge,a	p2_far_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000018000160] = 39625387 e1efbfdd, %l2 = 0010a2c3, %l3 = 00000740
	ldd	[%i0+0x160],%l2		! %l2 = 0000000039625387 00000000e1efbfdd
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x02a,%g2
p2_b42:
!	Registers modified during the branch to p2_far_1
!	%l1  = 000030a1bef64ac3
!	%l2  = 000000000010a2c3
!	%l3  = 0000000000000303
	fbe,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l5 = f78d5fcbfa59dc00, Mem[0000000018800159] = 97a8ad0e
	stb	%l5,[%i1+0x159]		! Annulled
p2_b43:
	membar	#Sync			! Added by membar checker (390)
!	Mem[0000000031800020] = e38e96fc, %l0 = 00000000e38e96fc
	ldsba	[%o3+0x022]%asi,%l0	! %l0 = ffffffffffffff96

p2_label_33:
!	Branch On Register, %l1 = 000030a1bef64ac3
	brgez,a,pn %l1,p2_b44		! Branch Taken
!	%l7 = 00000000000068fb, Mem[0000000019000008] = ffffff3f
	stba	%l7,[%i2+%o6]0x80	! Mem[0000000019000008] = fbffff3f
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x02c,%g2
p2_b44:
	membar	#Sync			! Added by membar checker (391)
!	Mem[000000003180002c] = ee4808c6, %l1 = 000030a1bef64ac3
	lduba	[%o3+0x02e]%asi,%l1	! %l1 = 0000000000000008
!	%l0 = ffffffffffffff96, immed = fffffb0e, %l5 = f78d5fcbfa59dc00
	xnor	%l0,-0x4f2,%l5		! %l5 = fffffffffffffb67
!	%l0 = ffffff96, %l1 = 00000008, Mem[0000000018800008] = 00d0999e dfd09a3e
	stda	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = ffffff96 00000008

p2_label_34:
!	%l4 = 00000000fbbe7000, %l1 = 0000000000000008, %l1 = 0000000000000008
	subc	%l4,%l1,%l1		! %l1 = 00000000fbbe6ff8
!	%l4 = 00000000fbbe7000, %l2 = 000000000010a2c3, %l6 = 000030a1428b0c00
	addccc	%l4,%l2,%l6		! %l6 = 00000000fbcf12c3, %ccr = 08
!	%l6 = 00000000fbcf12c3, immed = 00000007, %l3 = 0000000000000303
	sllx	%l6,0x007,%l3		! %l3 = 0000007de7896180
	set	p2_b45,%o7
	fba,pn	%fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000019000000] = ffffdfd0, %l4 = 00000000fbbe7000
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ffffdfd0
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x02d,%g2
p2_b45:
!	Registers modified during the branch to p2_near_0
!	%l0  = ffffffff80000000
!	%l1  = 00000000a3c0648f
!	%l3  = 00000000f78d6c27

p2_label_35:
	membar	#Sync			! Added by membar checker (392)
!	Mem[0000000018800060] = cf699416 ccbc823a b81d29cb 2495dbce
	prefetch [%i1+0x060],22
	set	p2_b46,%o7
	fbug	p2_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001b000188] = 0e4d46a5, %l5 = fffffffffffffb67
	ldsb	[%i6+0x18b],%l5		! %l5 = ffffffffffffffa5
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x02e,%g2
p2_b46:
!	Registers modified during the branch to p2_far_2
!	%l2  = d000000000000000
	membar	#Sync			! Added by membar checker (393)
!	%f12 = 5e0fd52f, %f3  = 4e000000, %f31 = de8f4267
	fdivs	%f12,%f3 ,%f31		! %f31 = 4f8fd52f
!	%f26 = 00000000, %f13 = 0933a86b
	fstoi	%f26,%f13		! %f13 = 00000000

p2_label_36:
!	%l0 = ffffffff80000000, %l5 = ffffffffffffffa5, %l0 = ffffffff80000000
	addcc	%l0,%l5,%l0		! %l0 = ffffffff7fffffa5, %ccr = 93
!	%l0 = ffffffff7fffffa5, immed = 00000e2b, %l5 = ffffffffffffffa5
	taddcc	%l0,0xe2b,%l5		! %l5 = ffffffff80000dd0, %ccr = 8a
!	%f6  = f0b4a323, %f29 = 00000000, %f16 = 43e21aa2
	fadds	%f6 ,%f29,%f16		! %f16 = f0b4a323
!	Mem[00000000180000c0] = 4e7e6f9e f17536c9 73a0252d 83cee25a
	prefetch [%i0+0x0c0],22
!	%l6 = 00000000fbcf12c3, immed = 0000023b, %y  = f78d5fcb
	sdivcc	%l6,0x23b,%l6		! %l6 = ffffffff80000000, %ccr = 8a

p2_label_37:
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l1 = 00000000a3c0648f, Mem[0000000032000068] = ffffff3f00000000
	stx	%l1,[%o4+0x068]		! Mem[0000000032000068] = 00000000a3c0648f
p2_b47:
	membar	#Sync			! Added by membar checker (394)
	fbug,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[00000000198000a0] = cd567c1a 726fe9e9 25169d26 3c0af506
	prefetch [%i3+0x0a0],20
p2_b48:
	membar	#Sync			! Added by membar checker (395)
	fble,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_38:
!	%l5 = ffffffff80000dd0, Mem[0000000019800008] = 3f05b4cf
	stha	%l5,[%i3+%o6]0x80	! Annulled
p2_b49:
	membar	#Sync			! Added by membar checker (396)
!	%l2 = d000000000000000, %l4 = 00000000ffffdfd0, %l3 = 00000000f78d6c27
	andn	%l2,%l4,%l3		! %l3 = d000000000000000
	bge,a	p2_b50			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000019000080] = e4f3f6b5 3209b148 55b5e00c 97257c19
	prefetch [%i2+0x080],22
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x032,%g2
p2_b50:
	membar	#Sync			! Added by membar checker (397)
!	%l1 = 00000000a3c0648f, immed = fffff6f0, %l3 = d000000000000000
	add	%l1,-0x910,%l3		! %l3 = 00000000a3c05b7f

p2_label_39:
	fbule,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800084] = 99733245, %l7 = 00000000000068fb
	lduw	[%i1+0x084],%l7		! Annulled
p2_b51:
	bvc	p2_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000018000120] = 0e78b06b 4165f7a2 d4d02baa 9a93a21c
	prefetch [%i0+0x120],16
p2_b52:
	membar	#Sync			! Added by membar checker (398)
	fbn,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1

p2_label_40:
!	Mem[0000000019000000] = fbbe7000, %l5 = ffffffff80000dd0
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = fffffffffffffbbe
p2_b53:
	membar	#Sync			! Added by membar checker (399)
!	%l0 = ffffffff7fffffa5, immed = 00000007, %l5 = fffffffffffffbbe
	srl	%l0,0x007,%l5		! %l5 = 0000000000ffffff
!	%l6 = ffffffff80000000, %l0 = ffffffff7fffffa5, %l0 = ffffffff7fffffa5
	addc	%l6,%l0,%l0		! %l0 = fffffffeffffffa5
!	Mem[0000000018800008] = ffffff96, %l6 = ffffffff80000000
	ldstuba	[%i1+%o6]0x80,%l6	! %l6 = 00000000000000ff
	set	p2_b54,%o7
	fbuge	p2_far_2_he	! Branch Taken, %fcc0 = 2

p2_label_41:
!	Mem[0000000031800024] = 34e54332, %l5 = 0000000000ffffff
	swap	[%o3+0x024],%l5		! %l5 = 0000000034e54332
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x036,%g2
p2_b54:
!	Registers modified during the branch to p2_far_2
!	%l3  = ffffffffffffffff
!	%l5  = ffffffffffffa9fd
!	%l7  = ffffffffffffffff
	bvs	p2_b55			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000031000028] = ace8b31179987366, %l5 = ffffffffffffa9fd
	ldx	[%o2+0x028],%l5		! %l5 = ace8b31179987366
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x037,%g2
p2_b55:
	bl	p2_not_taken_0		! Branch Not Taken, %ccr = 8a
!	%l6 = 00000000000000ff, Mem[0000000030000066] = 6d2df8a4
	stb	%l6,[%o0+0x066]		! Mem[0000000030000064] = 6d2dffa4
p2_b56:

p2_label_42:
	fbl,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800008] = ffffff96, %l5 = ace8b31179987366
	ldstuba	[%i1+%o6]0x80,%l5	! Annulled
p2_b57:
	membar	#Sync			! Added by membar checker (400)
!	Mem[00000000198000f0] = aa581ea9, %l0 = fffffffeffffffa5
	lduha	[%i3+0x0f0]%asi,%l0	! %l0 = 000000000000aa58
!	%l7 = ffffffffffffffff, Mem[0000000018800000] = ff0000dc
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000018800000] = ffff00dc
!	%l5 = ace8b31179987366, %l0 = 000000000000aa58, %l0 = 000000000000aa58
	xor	%l5,%l0,%l0		! %l0 = ace8b3117998d93e

p2_label_43:
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l7 = ffffffffffffffff, Mem[000000003080002c] = 4e8a4289
	stw	%l7,[%o1+0x02c]		! Mem[000000003080002c] = ffffffff
p2_b58:
	membar	#Sync			! Added by membar checker (401)
!	%l7 = ffffffffffffffff, %l4 = 00000000ffffdfd0, %l3 = ffffffffffffffff
	andn	%l7,%l4,%l3		! %l3 = ffffffff0000202f
!	%l4 = 00000000ffffdfd0, %l3 = ffffffff0000202f, %l3 = ffffffff0000202f
	subc	%l4,%l3,%l3		! %l3 = 00000001ffffbfa1
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_44:
!	%l3 = 00000001ffffbfa1, Mem[0000000031000020] = 000000c4000000e5
	stx	%l3,[%o2+0x020]		! Mem[0000000031000020] = 00000001ffffbfa1
p2_b59:
	membar	#Sync			! Added by membar checker (402)
!	%l6 = 00000000000000ff, immed = fffff75f, %l5 = ace8b31179987366
	xnorcc	%l6,-0x8a1,%l5		! %l5 = 000000000000085f, %ccr = 00
	fbule,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019800100] = f9762733 0e3f4249 49dd810b af544afb
	prefetch [%i3+0x100],3	! Annulled
p2_b60:
	membar	#Sync			! Added by membar checker (403)
!	%l6 = 00000000000000ff, %l6 = 00000000000000ff, %y  = f78d5fcb
	smulcc	%l6,%l6,%l5		! %l5 = 000000000000fe01, %ccr = 00

p2_label_45:
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l2 = d000000000000000, Mem[000000001a000000] = ab898e2466a62399
	stxa	%l2,[%i4+%g0]0x80	! Mem[000000001a000000] = d000000000000000
p2_b61:
	membar	#Sync			! Added by membar checker (404)
!	%l6 = 00000000000000ff, %l4 = 00000000ffffdfd0, %l1 = 00000000a3c0648f
	addccc	%l6,%l4,%l1		! %l1 = 00000000ffffe0cf, %ccr = 08
!	%f15 = 40000000, %f4  = 763bb636
	fstoi	%f15,%f4 		! %f4  = 00000002
	set	p2_b62,%o7
	fba	p2_far_1_he	! Branch Taken, %fcc0 = 2

p2_label_46:
!	Mem[0000000018800008] = ffffff96, %l4 = 00000000ffffdfd0
	ldstuba	[%i1+%o6]0x80,%l4	! %l4 = 00000000000000ff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x03e,%g2
p2_b62:
!	Registers modified during the branch to p2_far_1
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (405)
!	Mem[0000000019000000] = fbbe7000 00000042, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000fbbe7000 0000000000000042
!	Mem[00000000190000c8] = 67a17f52, %l0 = ace8b3117998d93e
	ldstub	[%i2+0x0c8],%l0		! %l0 = 0000000000000067
!	%f24 = fc356cdd, %f8  = c3e21aa2, %f26 = 00000000 00000000
	fsmuld	%f24,%f8 ,%f26		! %f26 = 4814079f 5eeabb40
!	Mem[0000000031000065] = 428b0c00, %l3 = 00000001ffffbfa1
	ldstub	[%o2+0x065],%l3		! %l3 = 000000000000008b

p2_label_47:
!	Mem[0000000031000028] = ace8b311 79987366, %l0 = 00000067, %l1 = ffffe0cf
	ldda	[%o2+0x028]%asi,%l0	! %l0 = 00000000ace8b311 0000000079987366
!	Mem[0000000018000140] = 254708b6, %l3 = 000000000000008b
	lduw	[%i0+0x140],%l3		! %l3 = 00000000254708b6
!	%f15 = 40000000, %f8  = c3e21aa2
	fstoi	%f15,%f8 		! %f8  = 00000002
	nop
	set	p2_b63,%o7
	fbuge	p2_far_1_le	! Branch Taken, %fcc0 = 2

p2_label_48:
!	%l5 = 000000000000fe01, Mem[0000000030000028] = 40acb485
	sth	%l5,[%o0+0x028]		! Mem[0000000030000028] = fe01b485
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x03f,%g2
p2_b63:
!	Registers modified during the branch to p2_far_1
!	%l1  = 000000017556e366
!	%l2  = fffffffffffeef9c
!	%l3  = 0000000000000000
	membar	#Sync			! Added by membar checker (406)
!	%l6 = 00000000fbbe7000, %l4 = 00000000000000ff, %l7 = 0000000000000042
	andncc	%l6,%l4,%l7		! %l7 = 00000000fbbe7000, %ccr = 08
!	Mem[00000000180001a0] = d98faf3b c1fe705c cb3679ff 179f9a16
	prefetch [%i0+0x1a0],20
!	%l4 = 000000ff, %l5 = 0000fe01, Mem[0000000018000000] = 73a4618c 3b5dbb76
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000018000000] = 000000ff 0000fe01
!	%l2 = fffffffffffeef9c, immed = 00000036, %l3 = 0000000000000000
	srax	%l2,0x036,%l3		! %l3 = ffffffffffffffff

p2_label_49:
	bl	p2_b64			! Branch Taken, %ccr = 08, CWP = 0
!	%l6 = fbbe7000, %l7 = fbbe7000, Mem[0000000030000060] = a9fd881c 6d2dffa4
	std	%l6,[%o0+0x060]	! Mem[0000000030000060] = fbbe7000 fbbe7000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x040,%g2
p2_b64:
	membar	#Sync			! Added by membar checker (407)
!	Mem[0000000019000020] = e4c7f8a4 33680c30 79ab63f0 ef17015f
	prefetch [%i2+0x020],23
!	Mem[00000000198000e0] = 39107a55, %l1 = 000000017556e366
	ldswa	[%i3+0x0e0]%asi,%l1	! %l1 = 0000000039107a55
	fbule,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 2

p2_label_50:
!	Mem[0000000018800040] = 93110a5a 095038e9 8bc8c754 9859bebd
	prefetch [%i1+0x040],3
p2_b65:
	membar	#Sync			! Added by membar checker (408)
	set	p2_b66,%o7
	fbo,a,pt %fcc0,p2_near_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000019000008] = fbffff3f f7b801dd, %l4 = 000000ff, %l5 = 0000fe01
	ldda	[%i2+%o6]0x80,%l4	! %l4 = 00000000fbffff3f 00000000f7b801dd
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x042,%g2
p2_b66:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000000000000
!	%l4  = 0000000039107a55
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (409)
	fbuge,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000031000024] = ffffbfa1, %l6 = 00000000fbbe7000
	swap	[%o2+0x024],%l6		! Annulled
p2_b67:

p2_label_51:
	membar	#Sync			! Added by membar checker (410)
!	Mem[0000000019000008] = fbffff3f f7b801dd, %l4 = 39107a55, %l5 = 00000000
	ldda	[%i2+%o6]0x80,%l4	! %l4 = 00000000fbffff3f 00000000f7b801dd
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000030000066] = fbbe7000, %l7 = 0000000000000000
	ldstub	[%o0+0x066],%l7		! Annulled
p2_b68:
	set	p2_b69,%o7
	fbo,a	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	%l6 = 00000000fbbe7000, Mem[0000000019800000] = 428b0c0000000000
	stxa	%l6,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000000fbbe7000
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x045,%g2
p2_b69:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000001a8a72311
!	%l3  = 0000000000000068

p2_label_52:
	membar	#Sync			! Added by membar checker (411)
	fble,a,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000019000008] = fbffff3f, %l3 = 0000000000000068
	ldsha	[%i2+%o6]0x80,%l3	! Annulled
p2_b70:
	membar	#Sync			! Added by membar checker (412)
!	Mem[0000000018800050] = 00000000 00000070, %l6 = 00000000fbbe7000, %l6 = 00000000fbbe7000
	add	%i1,0x50,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = e604ee26ce72a260
!	%f14 = bc67922d 40000000, %f10 = e5305f99 581e1d7d
	fnegd	%f14,%f10		! %f10 = 3c67922d 40000000
!	Mem[0000000032000048] = 061a0e3b048983dc, %l1 = 0000000039107a55
	ldx	[%o4+0x048],%g2		! %g2 = 061a0e3b048983dc

p2_label_53:
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],2
	set	p2_b71,%o7
	fblg	p2_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000019800040] = 558b48fa 259cb3f5 b1572808 890bb9e9
	prefetch [%i3+0x040],3
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x047,%g2
p2_b71:
!	Registers modified during the branch to p2_far_0
!	%l1  = ffffffff5358dc2e
!	%l5  = fffffffffffff0ea
!	%l6  = 00000000000000b5
	fbe,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l0 = a8a72311, %l1 = 5358dc2e, Mem[0000000019800000] = 00000000 fbbe7000
	stda	%l0,[%i3+%g0]0x80	! Annulled
p2_b72:

p2_label_54:
	bl,a	p2_b73			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[0000000018000000] = 000000ff, %l2 = fffffffffffeef9c
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x049,%g2
p2_b73:
	membar	#Sync			! Added by membar checker (413)
!	%l7 = 0000000000000000, %l3 = 0000000000000068, %y  = 00000000
	mulx	%l7,%l3,%l3		! %l3 = 0000000000000000
	bne,a	p2_b74			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[0000000018000038] = 78087e2f d715534b, %l4 = fbffff3f, %l5 = fffff0ea
	ldd	[%i0+0x038],%l4		! %l4 = 0000000078087e2f 00000000d715534b
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x04a,%g2
p2_b74:

p2_label_55:
	membar	#Sync			! Added by membar checker (414)
!	Mem[0000000019800130] = 14608fb5, %l3 = 0000000000000000
	swapa	[%i3+0x130]%asi,%l3	! %l3 = 0000000014608fb5
	fbug,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000019800060] = 39be61a7 ada4953a b8cf0ac7 6ddfae43
	prefetch [%i3+0x060],2
p2_b75:
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],2
p2_b76:

p2_label_56:
	membar	#Sync			! Added by membar checker (415)
!	%l6 = 00000000000000b5, Mem[0000000018800000] = ffff00dc
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000018800000] = 00b500dc
!	Mem[00000000188001e0] = e955dd99, %l0 = 00000001a8a72311
	ldsh	[%i1+0x1e2],%l0		! %l0 = ffffffffffffdd99
!	%f19 = 12937dd9, %f1  = 40000000
	fabss	%f19,%f1 		! %f1  = 12937dd9
!	%l1 = ffffffff5358dc2e, %l6 = 00000000000000b5, %l6 = 00000000000000b5
	andn	%l1,%l6,%l6		! %l6 = ffffffff5358dc0a
!	%f11 = 40000000, %f16 = f0b4a323 81845fdc
	fstod	%f11,%f16		! %f16 = 40000000 00000000

p2_label_57:
!	Mem[0000000018000060] = 5db98e85 1f81dd76 9fec669a 9d4f8b6c
	prefetcha [%i0+0x060]%asi,0
	set	p2_b77,%o7
	fbe,pt	%fcc3,p2_near_0_he	! Branch Taken, %fcc3 = 0
!	%l6 = 5358dc0a, %l7 = 00000000, Mem[0000000031000028] = ace8b311 79987366
	std	%l6,[%o2+0x028]	! Mem[0000000031000028] = 5358dc0a 00000000
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x04d,%g2
p2_b77:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000000
!	%l4  = 00000000d7155a92
!	%l5  = ffffffff5358dc3e
!	%l6  = 8a378c5a795ad0c7
	membar	#Sync			! Added by membar checker (416)
!	Mem[000000003080002c] = ffffffff, %l5 = ffffffff5358dc3e
	swapa	[%o1+0x02c]%asi,%l5	! %l5 = 00000000ffffffff
!	Branch On Register, %l3 = 0000000014608fb5
	brgez,a,pn %l3,p2_b78		! Branch Taken

p2_label_58:
!	Mem[00000000188000a0] = 2f39939d 99b5b6d3 88995e77 0c27285c
	prefetch [%i1+0x0a0],4
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x04e,%g2
p2_b78:
	membar	#Sync			! Added by membar checker (417)
!	%f28 = 00000000, %f29 = 00000000
	fmovs	%f28,%f29		! %f29 = 00000000
!	%l2 = 00000000000000ff, immed = 000000e5, %l4 = 00000000d7155a92
	addcc	%l2,0x0e5,%l4		! %l4 = 00000000000001e4, %ccr = 00
	set	p2_b79,%o7
	fbue,pn	%fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000019800000] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p2_branch_failed
	mov	0x04f,%g2
p2_b79:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000000000000
!	%l4  = ffffffff5358dc2e
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000

p2_label_59:
	membar	#Sync			! Added by membar checker (418)
!	%l3 = 0000000000000000, immed = ffffffdc, %l7 = 0000000000000000
	addcc	%l3,-0x024,%l7		! %l7 = ffffffffffffffdc, %ccr = 88
!	%l5 = 0000000000000000, %l0 = 0000000000000000, %l0 = 0000000000000000
	subc	%l5,%l0,%l0		! %l0 = 0000000000000000
!	%l6 = 795ad0c7, %l7 = ffffffdc, Mem[0000000032000060] = 2432adfc 73787542
	stda	%l6,[%o4+0x060]%asi	! Mem[0000000032000060] = 795ad0c7 ffffffdc
!	Mem[0000000019000000] = fbbe7000, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000fbbe7000
!	%l4 = ffffffff5358dc2e, Mem[000000001980019a] = 42c388b5
	sth	%l4,[%i3+0x19a]		! Mem[0000000019800198] = 42c3dc2e

p2_label_60:
	fbule,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000019800008] = 3f05b4cf, %l7 = ffffffffffffffdc
	lduwa	[%i3+%o6]0x80,%l7	! %l7 = 000000003f05b4cf
p2_b80:
	membar	#Sync			! Added by membar checker (419)
!	%l7 = 000000003f05b4cf, immed = 0000074c, %l1 = ffffffff5358dc2e
	and	%l7,0x74c,%l1		! %l1 = 000000000000044c
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],20
!	Branch On Register, %l2 = 00000000000000ff
	brlez,pn %l2,p2_not_taken_0	! Branch Not Taken

p2_label_61:
!	Mem[0000000030800068] = 5651c192, %l2 = 00000000000000ff
	ldub	[%o1+0x06a],%l2		! %l2 = 00000000000000c1
p2_b81:
	membar	#Sync			! Added by membar checker (420)
!	%f9  = 81845fdc, %f22 = 223b7684 0c9d7f84
	fstod	%f9 ,%f22		! %f22 = b8308bfb 80000000
	set	p2_b82,%o7
	fbe,a,pn %fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000018800120] = b06735c0 d379ed0d c18c4142 3e0aca32
	prefetch [%i1+0x120],21
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x052,%g2
p2_b82:
!	Registers modified during the branch to p2_near_3
!	%l1  = 000000007e1855f7
!	%l3  = 8a378c5afbfef0c7
!	%l6  = 1bc62d3cad686380
	membar	#Sync			! Added by membar checker (421)
	set	p2_b83,%o7
	fbne,a,pt %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 1

p2_label_62:
!	%l0 = 0000000000000000, Mem[0000000030800066] = b378f57b
	stb	%l0,[%o1+0x066]		! Mem[0000000030800064] = b378007b
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x053,%g2
p2_b83:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000000
!	%l1  = 00000000a3c0648f
!	%l3  = 0000000000000000
	membar	#Sync			! Added by membar checker (422)
!	Mem[00000000188001e0] = e955dd99 dc6e2a65 33f53a01 706921fe
	prefetcha [%i1+0x1e0]%asi,2
	fbn,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l4 = 5358dc2e, %l5 = 00000000, Mem[0000000019000008] = fbffff3f f7b801dd
	stda	%l4,[%i2+%o6]0x80	! Annulled
p2_b84:
	ba	p2_b85			! Branch Taken, %ccr = 44, CWP = 0

p2_label_63:
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetch [%o4+0x000],1
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x055,%g2
p2_b85:
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019800008] = 3f05b4cf5e58f339, %l7 = 000000003f05b4cf
	ldxa	[%i3+%o6]0x80,%l7	! %l7 = 3f05b4cf5e58f339
p2_b86:
	membar	#Sync			! Added by membar checker (423)
!	Denormal Floating Point Operation Nullified
	nop
	fbuge,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1

p2_label_64:
!	Mem[0000000019000058] = 4ae69885071560b1, %l0 = 0000000000000000
	ldx	[%i2+0x058],%l0		! %l0 = 4ae69885071560b1
p2_b87:
	membar	#Sync			! Added by membar checker (424)
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetcha [%o4+0x040]%asi,20
!	%l6 = 1bc62d3cad686380, immed = 0000000d, %l0 = 4ae69885071560b1
	srax	%l6,0x00d,%l0		! %l0 = 0000de3169e56b43
!	%l0 = 0000de3169e56b43, immed = fffff0a1, %y  = 00000000
	smul	%l0,-0xf5f,%l1		! %l1 = fffff9a442944523
!	%l1 = fffff9a442944523, immed = 00000243, %l7 = 3f05b4cf5e58f339
	and	%l1,0x243,%l7		! %l7 = 0000000000000003

p2_label_65:
!	%f11 = 40000000, %f11 = 40000000, %f0  = 3c67922d
	fdivs	%f11,%f11,%f0 		! %f0  = 3f800000
	bl	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000019000165] = 6bae77fb, %l0 = 0000de3169e56b43
	ldstub	[%i2+0x165],%l0		! %l0 = 00000000000000ae
p2_b88:
	membar	#Sync			! Added by membar checker (425)
	set	p2_b89,%o7
	fbe,a,pn %fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000018000000] = 000000ff0000fe01, %l4 = ffffffff5358dc2e
	ldxa	[%i0+%g0]0x80,%l4	! %l4 = 000000ff0000fe01
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x059,%g2
p2_b89:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000000000000
!	%l4  = fffff9a442944523
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000

p2_label_66:
	membar	#Sync			! Added by membar checker (426)
!	Mem[0000000031000020] = 00000001 ffffbfa1, %l6 = ad686380, %l7 = 00000000
	ldd	[%o2+0x020],%l6		! %l6 = 0000000000000001 00000000ffffbfa1
!	%l7 = 00000000ffffbfa1, immed = 00000273, %l5 = 0000000000000000
	xnor	%l7,0x273,%l5		! %l5 = ffffffff0000422d
	bvs,a	p2_b90			! Branch Taken, %ccr = 82, CWP = 0
!	Mem[0000000030000068] = 97c50b39, %l6 = 0000000000000001
	ldsw	[%o0+0x068],%l6		! %l6 = ffffffff97c50b39
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x05a,%g2
p2_b90:
!	Jump to jmpl_1, CWP = 0
	set	p2_jmpl_1_le,%g1
	jmpl	%g1,%g6

p2_label_67:
!	Mem[0000000032000068] = 00000000, %l2 = 00000000000000c1
	ldub	[%o4+0x068],%g2		! %g2 = 0000000000000000
!	Registers modified during the branch to p2_jmpl_1
!	%l6  = fff9a44294452300
	membar	#Sync			! Added by membar checker (427)
!	Mem[0000000019800008] = 3f05b4cf, %l5 = ffffffff0000422d
	ldswa	[%i3+%o6]0x80,%l5	! %l5 = 000000003f05b4cf
	ba	p2_b91			! Branch Taken, %ccr = 82, CWP = 0
!	Mem[0000000018800100] = ceea8015 54a6dd8d e9b85fca f5825aa5
	prefetch [%i1+0x100],0
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x05b,%g2
p2_b91:
	membar	#Sync			! Added by membar checker (428)
!	%f19 = 12937dd9, %f28 = 00000000, %f19 = 12937dd9
	fadds	%f19,%f28,%f19		! %f19 = 12937dd9

p2_label_68:
!	Mem[0000000030800020] = c347c088, %l7 = 00000000ffffbfa1
	ldub	[%o1+0x021],%l7		! %l7 = 0000000000000047
!	%l5 = 000000003f05b4cf, Mem[0000000031800022] = e38e96fc
	stba	%l5,[%o3+0x022]%asi	! Mem[0000000031800020] = e38ecffc
!	%l6 = 94452300, %l7 = 00000047, Mem[0000000019800008] = 3f05b4cf 5e58f339
	stda	%l6,[%i3+%o6]0x80	! Mem[0000000019800008] = 94452300 00000047
!	Mem[00000000198001e0] = 768d57a6 07892e46 47b70a26 d257988a
	prefetch [%i3+0x1e0],16
!	%l7 = 0000000000000047, immed = fffffcb2, %l4 = fffff9a442944523
	taddcc	%l7,-0x34e,%l4		! %l4 = fffffffffffffcf9, %ccr = 8a

p2_label_69:
	set	p2_b92,%o7
	fbul,pt	%fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 1
!	%l2 = 00000000000000c1, Mem[0000000031800028] = 8177725bee4808c6
	stx	%l2,[%o3+0x028]		! Mem[0000000031800028] = 00000000000000c1
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x05c,%g2
p2_b92:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000000
!	%l4  = 000000003f05bc16
!	%l5  = fffff9a442944533
!	%l6  = 8a378c5a795ad0c7
	membar	#Sync			! Added by membar checker (429)
!	Mem[000000001800014c] = 3191f607, %l6 = 8a378c5a795ad0c7
	lduw	[%i0+0x14c],%l6		! %l6 = 000000003191f607
!	%l5 = fffff9a442944533, immed = 00000fb2, %l6 = 000000003191f607
	xnor	%l5,0xfb2,%l6		! %l6 = 0000065bbd6bb57e
!	%l7 = 0000000000000047, immed = fffff9fd, %y  = 00000000
	mulx	%l7,-0x603,%l2		! %l2 = fffffffffffe552b

p2_label_70:
!	Mem[0000000030000020] = 7c6b3ec3 000000a3, %l6 = bd6bb57e, %l7 = 00000047
	ldda	[%o0+0x020]%asi,%l6	! %l6 = 000000007c6b3ec3 00000000000000a3
!	%l2 = fffffffffffe552b, immed = fffff2cd, %l2 = fffffffffffe552b
	add	%l2,-0xd33,%l2		! %l2 = fffffffffffe47f8
!	%f16 = 40000000 00000000, %f7  = 00000000
	fdtoi	%f16,%f7 		! %f7  = 00000002
!	Mem[0000000019800000] = 00000000, %l2 = fffffffffffe47f8
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l1 = fffff9a442944523, immed = 00000c26, %l3 = 0000000000000000
	orn	%l1,0xc26,%l3		! %l3 = fffffffffffff7fb

p2_label_71:
	fbue,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[00000000180000e0] = 7765fd20 fa5ef2ff f49bf546 3f3b81cc
	prefetch [%i0+0x0e0],23	! Annulled
p2_b93:
	membar	#Sync			! Added by membar checker (430)
!	Mem[0000000019800000] = ff000000fbbe7000, %l0 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = ff000000fbbe7000
	fbge,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000018800100] = ceea8015 54a6dd8d e9b85fca f5825aa5
	prefetch [%i1+0x100],4
p2_b94:

p2_label_72:
	membar	#Sync			! Added by membar checker (431)
!	%l3 = fffffffffffff7fb, %l4 = 000000003f05bc16, %l7 = 00000000000000a3
	subccc	%l3,%l4,%l7		! %l7 = ffffffffc0fa3be5, %ccr = 88
	bn,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	 Annulled
	ldda	[%i5+%g0]0x80,%l2
p2_b95:
	membar	#Sync			! Added by membar checker (432)
!	%l2 = 0000000000000000, immed = 000007c3, %y  = 00000000
	umul	%l2,0x7c3,%l5		! %l5 = 0000000000000000
!	%l7 = ffffffffc0fa3be5, immed = fffff20d, %l4 = 000000003f05bc16
	subccc	%l7,-0xdf3,%l4		! %l4 = ffffffffc0fa49d8, %ccr = 99

p2_label_73:
!	Branch On Register, %l0 = ff000000fbbe7000
	brnz,pn	%l0,p2_b96		! Branch Taken
!	Mem[0000000018000140] = 254708b6 c80ac9e5 0fa2d067 3191f607
	prefetch [%i0+0x140],0
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x060,%g2
p2_b96:
	membar	#Sync			! Added by membar checker (433)
!	Mem[0000000019800158] = 9c1c092b e63d61d9, %l4 = c0fa49d8, %l5 = 00000000
	ldda	[%i3+0x158]%asi,%l4	! %l4 = 000000009c1c092b 00000000e63d61d9
!	%l6 = 000000007c6b3ec3, %l0 = ff000000fbbe7000, %y  = 00000000
	umulcc	%l6,%l0,%l0		! %l0 = 7a59b490b12f5000, %ccr = 08
	bl,a	p2_b97			! Branch Taken, %ccr = 08, CWP = 0

p2_label_74:
!	%l0 = 7a59b490b12f5000, Mem[00000000180001f0] = 225b7cd0
	stw	%l0,[%i0+0x1f0]		! Mem[00000000180001f0] = b12f5000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x061,%g2
p2_b97:
	membar	#Sync			! Added by membar checker (434)
!	%l2 = 0000000000000000, %l6 = 000000007c6b3ec3, %y  = 7a59b490
	mulx	%l2,%l6,%l2		! %l2 = 0000000000000000
!	%l5 = 00000000e63d61d9, %l7 = ffffffffc0fa3be5, %l1 = fffff9a442944523
	tsubcc	%l5,%l7,%l1		! %l1 = 00000001254325f4, %ccr = 12
	set	p2_b98,%o7
	fbge	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],20
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x062,%g2
p2_b98:
!	Registers modified during the branch to p2_far_0
!	%l0  = 7a59b490ee94caa8
!	%l3  = 0000000000000068

p2_label_75:
	membar	#Sync			! Added by membar checker (435)
	set	p2_b99,%o7
	fble,a,pn %fcc3,p2_near_0_he	! Branch Taken, %fcc3 = 0
!	%l2 = 0000000000000000, Mem[000000003080006c] = 4f1721ad
	stw	%l2,[%o1+0x06c]		! Mem[000000003080006c] = 00000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x063,%g2
p2_b99:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000000
!	%l4  = 00000000e63d6920
!	%l5  = 00000001254325f4
!	%l6  = 8a378c5a795ad0c7
	membar	#Sync			! Added by membar checker (436)
!	Mem[0000000019800140] = 51f78fc1 3976302a 3dbee7d8 c8e690f2
	prefetcha [%i3+0x140]%asi,21
!	%f18 = a33c916a 12937dd9, %f26 = 4814079f 5eeabb40
	fcmped	%fcc2,%f18,%f26		! %fcc2 = 1
!	%l6 = 8a378c5a795ad0c7, %l0 = 0000000000000000, %l1 = 00000001254325f4
	tsubcc	%l6,%l0,%l1		! %l1 = 8a378c5a795ad0c7, %ccr = 82

p2_label_76:
!	Mem[000000001a800000] = 3006223f2fc68d7b, %l6 = 8a378c5a795ad0c7
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = 3006223f2fc68d7b
!	Mem[0000000018000160] = 39625387 e1efbfdd 23d0b050 9bc60690
	prefetcha [%i0+0x160]%asi,3
!	%l4 = 00000000e63d6920, Mem[0000000018800000] = 00b500dc
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000018800000] = e63d6920
	bne	p2_b100			! Branch Taken, %ccr = 82, CWP = 0
!	Mem[0000000031800020] = e38ecffc00ffffff, %l2 = 0000000000000000
	ldx	[%o3+0x020],%l2		! %l2 = e38ecffc00ffffff
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x064,%g2
p2_b100:

p2_label_77:
	membar	#Sync			! Added by membar checker (437)
!	%f10 = 3c67922d 40000000, %f20 = b5db0121 5986cba5
	fcmped	%fcc3,%f10,%f20		! %fcc3 = 2
!	Mem[0000000031800028] = 00000000000000c1, %l1 = 8a378c5a795ad0c7
	ldxa	[%o3+0x028]%asi,%l1	! %l1 = 00000000000000c1
	set	p2_b101,%o7
	fba,a,pt %fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000018800008] = ffffff96, %l1 = 00000000000000c1
	lduwa	[%i1+%o6]0x80,%l1	! Annulled
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x065,%g2
p2_b101:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000000
!	%l4  = 0000000125432d3b
!	%l5  = 00000000000000f1
!	%l6  = 8a378c5a795ad0c7
	membar	#Sync			! Added by membar checker (438)
!	%f6  = f0b4a323, %f13 = 00000000, %f28 = 00000000
	fmuls	%f6 ,%f13,%f28		! %f28 = 80000000

p2_label_78:
	bl,a	p2_b102			! Branch Taken, %ccr = 82, CWP = 0
!	Mem[000000001980014c] = c8e690f2, %l0 = 0000000000000000
	ldsh	[%i3+0x14e],%l0		! %l0 = ffffffffffff90f2
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p2_branch_failed
	mov	0x066,%g2
p2_b102:
	membar	#Sync			! Added by membar checker (439)
!	%f31 = 4f8fd52f, %f17 = 00000000, %f3  = 4e000000
	fsubs	%f31,%f17,%f3 		! %f3  = 4f8fd52f
!	%l5 = 00000000000000f1, immed = 00000de7, %l1 = 00000000000000c1
	and	%l5,0xde7,%l1		! %l1 = 00000000000000e1
	set	p2_b103,%o7
	fbne,a	p2_far_0_he	! Branch Taken, %fcc0 = 2

p2_label_79:
!	Mem[0000000019800008] = 94452300 00000047, %l0 = ffff90f2, %l1 = 000000e1
	ldda	[%i3+%o6]0x80,%l0	! %l0 = 0000000094452300 0000000000000047
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x067,%g2
p2_b103:
!	Registers modified during the branch to p2_far_0
!	%l1  = 0000000090fe0a3b
!	%l5  = fffffffffffff0ea
!	%l6  = 00000000000000b5
	membar	#Sync			! Added by membar checker (440)
!	Mem[0000000031800020] = e38ecffc00ffffff, %l6 = 00000000000000b5
	ldxa	[%o3+0x020]%asi,%l6	! %l6 = e38ecffc00ffffff
!	%f2  = c1cfede3 4f8fd52f, %f28 = 80000000 00000000, %f20 = b5db0121 5986cba5
	faddd	%f2 ,%f28,%f20		! %f20 = c1cfede3 4f8fd52f
!	Mem[0000000019800008] = 94452300, %l4 = 0000000125432d3b
	lduha	[%i3+%o6]0x80,%l4	! %l4 = 0000000000009445
!	%l1 = 0000000090fe0a3b, immed = fffff5a6, %l0 = 0000000094452300
	subc	%l1,-0xa5a,%l0		! %l0 = 0000000090fe1495

p2_label_80:
!	Mem[0000000031000024] = ffffbfa1, %l4 = 0000000000009445
	lduh	[%o2+0x024],%l4		! %l4 = 000000000000ffff
!	%l5 = fffffffffffff0ea, immed = fffff6b3, %l6 = e38ecffc00ffffff
	xor	%l5,-0x94d,%l6		! %l6 = 0000000000000659
	fbu,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l6 = 0000000000000659, Mem[0000000031800060] = fdb9139a
	stw	%l6,[%o3+0x060]		! Mem[0000000031800060] = 00000659
p2_b104:
	set	p2_b105,%o7
	fblg	p2_far_2_le	! Branch Taken, %fcc0 = 2

p2_label_81:
!	Mem[0000000019800008] = 94452300, %l0 = 0000000090fe1495
	lduwa	[%i3+%o6]0x80,%l0	! %l0 = 0000000094452300
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x069,%g2
p2_b105:
!	Registers modified during the branch to p2_far_2
!	%l2  = ff00000000000000
	membar	#Sync			! Added by membar checker (441)
!	%l7 = ffffffffc0fa3be5, %l2 = ff00000000000000, %l1 = 0000000090fe0a3b
	orn	%l7,%l2,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000019800160] = bfeb90f2 c3ab8282 829e4330 bc144834
	prefetch [%i3+0x160],20
!	%l7 = ffffffffc0fa3be5, %l1 = ffffffffffffffff, %l2 = ff00000000000000
	addcc	%l7,%l1,%l2		! %l2 = ffffffffc0fa3be4, %ccr = 99
!	Mem[000000001a800008] = 6334ba0b, %l2 = ffffffffc0fa3be4
	lduha	[%i5+%o6]0x80,%l2	! %l2 = 0000000000006334

p2_label_82:
!	Mem[0000000032000028] = 8d04cd02 e27389fa, %l6 = 00000659, %l7 = c0fa3be5
	ldda	[%o4+0x028]%asi,%g2	! %l6 = 0000000000000659 ffffffffc0fa3be5
!	Mem[0000000018000020] = e961d5fa 594e4aa4 9ad79b74 1c38bef7
	prefetcha [%i0+0x020]%asi,21
!	%l2 = 0000000000006334, immed = 00000122, %l6 = 0000000000000659
	subc	%l2,0x122,%l6		! %l6 = 0000000000006211
!	%l3 = 0000000000000068, %l0 = 0000000094452300, %l2 = 0000000000006334
	orncc	%l3,%l0,%l2		! %l2 = ffffffff6bbadcff, %ccr = 80
	fbu,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1

p2_label_83:
!	%l6 = 0000000000006211, Mem[0000000018000008] = 69203ef6
	stba	%l6,[%i0+%o6]0x80	! Mem[0000000018000008] = 11203ef6
p2_b106:
	membar	#Sync			! Added by membar checker (442)
!	%f10 = 3c67922d 40000000, %f22 = b8308bfb 80000000
	fcmpd	%fcc0,%f10,%f22		! %fcc0 = 2
!	%l4 = 000000000000ffff, immed = fffffbd2, %l4 = 000000000000ffff
	sub	%l4,-0x42e,%l4		! %l4 = 000000000001042d
!	Mem[0000000018800000] = e63d6920, %l4 = 000000000001042d
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000e6
	set	p2_b107,%o7
	fbg	p2_far_0_le	! Branch Taken, %fcc0 = 2

p2_label_84:
!	%l1 = ffffffffffffffff, Mem[0000000018800000] = ff3d6920
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000018800000] = ffff6920
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x06b,%g2
p2_b107:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000553fc0f6
!	%l3  = 0000000000000068
	membar	#Sync			! Added by membar checker (443)
!	%f10 = 3c67922d 40000000, %f1  = 12937dd9
	fdtos	%f10,%f1 		! %f1  = 233c916a
!	Mem[00000000198000f0] = aa581ea9 5e22fd1a, %l2 = 6bbadcff, %l3 = 00000068
	ldda	[%i3+0x0f0]%asi,%l2	! %l2 = 00000000aa581ea9 000000005e22fd1a
!	Mem[000000003000006b] = 97c50b39, %l4 = 00000000000000e6
	ldstub	[%o0+0x06b],%l4		! %l4 = 0000000000000039
!	Mem[0000000019800000] = ff000000, %l4 = 0000000000000039
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff000000

p2_label_85:
!	%l0 = 00000000553fc0f6, immed = fffff01d, %y  = 7a59b490
	sdiv	%l0,-0xfe3,%l7		! %l7 = ffffffff80000000
!	Mem[0000000018000008] = 11203ef6, %l6 = 0000000000006211
	lduwa	[%i0+%o6]0x80,%l6	! %l6 = 0000000011203ef6
!	%f22 = b8308bfb 80000000, %f16 = 40000000 00000000
	fcmpd	%fcc0,%f22,%f16		! %fcc0 = 1
	nop				! Delay added due to fcmp
	fbu,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000004000003b] = 3a133220, %l4 = 00000000ff000000
	ldstub	[%o5+0x03b],%l4		! %l4 = 0000000000000020
p2_b108:

p2_label_86:
	membar	#Sync			! Added by membar checker (444)
!	%l0 = 553fc0f6, %l1 = ffffffff, Mem[00000000180000d8] = 3f673912 f9c185e2
	stda	%l0,[%i0+0x0d8]%asi	! Mem[00000000180000d8] = 553fc0f6 ffffffff
!	Mem[0000000018800198] = b37cb3d8d196a4a1, %l6 = 0000000011203ef6
	ldxa	[%i1+0x198]%asi,%l6	! %l6 = b37cb3d8d196a4a1
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800008] = ffffff9600000008, %l5 = fffffffffffff0ea
	ldxa	[%i1+%o6]0x80,%l5	! Annulled
p2_b109:
	bpos	p2_b110			! Branch Taken, %ccr = 80, CWP = 0

p2_label_87:
!	Mem[00000000188001c0] = 79fcfc01 59954d24 563c8fd0 a7ad2239
	prefetch [%i1+0x1c0],23
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x06e,%g2
p2_b110:
	membar	#Sync			! Added by membar checker (445)
!	%l5 = fffffffffffff0ea, Mem[0000000032000010] = 0384c640
	sth	%l5,[%o4+0x010]		! Mem[0000000032000010] = f0eac640
!	Mem[0000000018000008] = 11203ef6, %l7 = ffffffff80000000
	ldswa	[%i0+%o6]0x80,%l7	! %l7 = 0000000011203ef6
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 00000000aa581ea9, Mem[0000000019000008] = fbffff3ff7b801dd
	stxa	%l2,[%i2+%o6]0x80	! Mem[0000000019000008] = 00000000aa581ea9
p2_b111:

p2_label_88:
	membar	#Sync			! Added by membar checker (446)
!	Mem[0000000019000008] = 00000000 aa581ea9, %l0 = 553fc0f6, %l1 = ffffffff
	ldda	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000 00000000aa581ea9
!	%l2 = 00000000aa581ea9, %l5 = fffffffffffff0ea, %l1 = 00000000aa581ea9
	addcc	%l2,%l5,%l1		! %l1 = 00000000aa580f93, %ccr = 19
	nop
	fbge,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000003180006a] = 2eb38d9e, %l7 = 0000000011203ef6
	ldstub	[%o3+0x06a],%l7		! %l7 = 000000000000008d
p2_b112:

p2_label_89:
	membar	#Sync			! Added by membar checker (447)
!	%l3 = 000000005e22fd1a, %l7 = 000000000000008d, %y  = 7a59b490
	umulcc	%l3,%l7,%l2		! %l2 = 00000033d9456752, %ccr = 08
	bn,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l1 = 00000000aa580f93, Mem[0000000019800000] = ff000000
	stba	%l1,[%i3+%g0]0x80	! Annulled
p2_b113:
	membar	#Sync			! Added by membar checker (448)
!	Mem[0000000019000000] = fbbe7000, %l4 = 0000000000000020
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000fbbe
!	Mem[0000000032000010] = f0eac640925b55a5, %l4 = 000000000000fbbe
	ldx	[%o4+0x010],%g2		! %g2 = f0eac640925b55a5

p2_label_90:
!	%f16 = 40000000 00000000, %f10 = 3c67922d
	fdtoi	%f16,%f10		! %f10 = 00000002
!	%f1  = 233c916a, %f15 = 40000000
	fcmpes	%fcc2,%f1 ,%f15		! %fcc2 = 1
	nop				! Delay added due to fcmp
	set	p2_b114,%o7
	fbne,pt	%fcc1,p2_near_2_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],0
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x072,%g2
p2_b114:
!	Registers modified during the branch to p2_near_2
!	%l4  = 0000000000548301
!	%l5  = 000000005358dc3e
	membar	#Sync			! Added by membar checker (449)
!	Mem[0000000019800000] = ff000000fbbe7000, %l7 = 000000000000008d
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = ff000000fbbe7000

p2_label_91:
!	%f31 = 4f8fd52f, %f15 = 40000000, %f10 = 00000002 40000000
	nop
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000030800062] = e958f4e2, %l6 = b37cb3d8d196a4a1
	ldstub	[%o1+0x062],%l6		! Annulled
p2_b115:
	membar	#Sync			! Added by membar checker (450)
!	%f0  = 3f800000, %f18 = a33c916a
	fstoi	%f0 ,%f18		! %f18 = 00000001
!	Mem[0000000019800040] = 558b48fa 259cb3f5, %l4 = 00548301, %l5 = 5358dc3e
	ldd	[%i3+0x040],%l4		! %l4 = 00000000558b48fa 00000000259cb3f5

p2_label_92:
!	Branch On Register, %l4 = 00000000558b48fa
	brlez,a,pt %l4,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000030000060] = fbbe7000, %l2 = 00000033d9456752
	ldsb	[%o0+0x062],%l2		! Annulled
p2_b116:
	membar	#Sync			! Added by membar checker (451)
!	Mem[0000000019000008] = 00000000, %l2 = 00000033d9456752
	ldstuba	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000000
	bge,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[00000000188000a0] = 2f39939d 99b5b6d3 88995e77 0c27285c
	prefetch [%i1+0x0a0],16	! Annulled
p2_b117:

p2_label_93:
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800008] = ffffff96, %l6 = b37cb3d8d196a4a1
	ldsha	[%i1+%o6]0x80,%l6	! Annulled
p2_b118:
	membar	#Sync			! Added by membar checker (452)
!	%l7 = ff000000fbbe7000, %l2 = 0000000000000000, %l3 = 000000005e22fd1a
	orncc	%l7,%l2,%l3		! %l3 = ffffffffffffffff, %ccr = 88
	set	p2_b119,%o7
	fbl,a	p2_far_3_he	! Branch Taken, %fcc0 = 1
!	%l0 = 0000000000000000, Mem[0000000018800008] = ffffff96
	stha	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = 0000ff96
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x077,%g2
p2_b119:
!	Registers modified during the branch to p2_far_3
!	%l2  = 0000000026a0b445
!	%l3  = 00000000000000ff
!	%l5  = 0000000000000065
!	%l7  = ffffffffffffffac

p2_label_94:
	membar	#Sync			! Added by membar checker (453)
!	%l2 = 0000000026a0b445, %l4 = 00000000558b48fa, %l6 = b37cb3d8d196a4a1
	sub	%l2,%l4,%l6		! %l6 = ffffffffd1156b4b
!	%l5 = 0000000000000065, %l6 = ffffffffd1156b4b, %l1 = 00000000aa580f93
	srl	%l5,%l6,%l1		! %l1 = 0000000000000000
!	%l5 = 0000000000000065, %l6 = ffffffffd1156b4b, %y  = 00000033
	sdivcc	%l5,%l6,%l7		! %l7 = fffffffffffffeea, %ccr = 88
	ba,a	p2_b120			! Branch Taken, %ccr = 88, CWP = 0
!	%l7 = fffffffffffffeea, Mem[0000000018800008] = 0000ff96
	stha	%l7,[%i1+%o6]0x80	! Annulled
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x078,%g2
p2_b120:

p2_label_95:
	bgu,a	p2_b121			! Branch Taken, %ccr = 88, CWP = 0
!	%l2 = 0000000026a0b445, Mem[0000000018000010] = 359d3beea66b0f16
	stx	%l2,[%i0+0x010]		! Mem[0000000018000010] = 0000000026a0b445
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x079,%g2
p2_b121:
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800000] = ffff6920, %l0 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
p2_b122:
	membar	#Sync			! Added by membar checker (454)
!	Branch On Register, %l4 = 00000000558b48fa
	brlz,pt	%l4,p2_not_taken_0	! Branch Not Taken

p2_label_96:
!	Mem[0000000019000000] = fbbe7000 00000042 ff000000 aa581ea9
	prefetch [%i2+0x000],0
p2_b123:
	membar	#Sync			! Added by membar checker (455)
!	%l2 = 0000000026a0b445, Mem[0000000030800024] = 54dae16b
	stwa	%l2,[%o1+0x024]%asi	! Mem[0000000030800024] = 26a0b445
!	%l1 = 0000000000000000, immed = 0000016c, %l3 = 00000000000000ff
	and	%l1,0x16c,%l3		! %l3 = 0000000000000000
!	Mem[000000003180006d] = 0dc6c195, %l6 = ffffffffd1156b4b
	ldstuba	[%o3+0x06d]%asi,%l6	! %l6 = 00000000000000c6
	set	p2_b124,%o7
	fbule,pn %fcc0,p2_near_2_he	! Branch Taken, %fcc0 = 1

p2_label_97:
!	Mem[000000001980010c] = af544afb, %l0 = 00000000000000ff
	lduw	[%i3+0x10c],%l0		! %l0 = 00000000af544afb
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x07c,%g2
p2_b124:
!	Registers modified during the branch to p2_near_2
!	%l4  = 0000000000000000
!	%l5  = 000000005358dc3e
	membar	#Sync			! Added by membar checker (456)
	set	p2_b125,%o7
	fbule,a,pn %fcc0,p2_near_0_le	! Branch Taken, %fcc0 = 1
!	%l5 = 000000005358dc3e, Mem[0000000030000068] = 97c50bff4245a233
	stx	%l5,[%o0+0x068]		! Mem[0000000030000068] = 000000005358dc3e
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x07d,%g2
p2_b125:
!	Registers modified during the branch to p2_near_0
!	%l0  = 00000000154e7605
!	%l1  = 00000000a3c0648f
!	%l3  = 0000000000000033
	ble,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	 Annulled
	ldda	[%i1+%g0]0x80,%l6
p2_b126:

p2_label_98:
	membar	#Sync			! Added by membar checker (457)
!	%l2 = 0000000026a0b445
	sethi	%hi(0x561fdc00),%l2	! %l2 = 00000000561fdc00
!	%l3 = 0000000000000033, %l7 = fffffffffffffeea, %l7 = fffffffffffffeea
	addccc	%l3,%l7,%l7		! %l7 = ffffffffffffff1d, %ccr = 88
!	Mem[00000000190000c0] = a7d518d1 2baf7696 ffa17f52 4d1317a1
	prefetch [%i2+0x0c0],3
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[000000001880009c] = 54177d21, %l1 = 00000000a3c0648f
	ldsh	[%i1+0x09e],%l1		! %l1 = 0000000000007d21

p2_label_99:
!	%l5 = 000000005358dc3e, %l6 = 00000000000000c6, %y  = 00000033
	udivx	%l5,%l6,%l1		! %l1 = 00000000006bc30d
!	%l1 = 00000000006bc30d, Mem[0000000018800008] = 0000ff96
	stha	%l1,[%i1+%o6]0x80	! Mem[0000000018800008] = c30dff96
!	%f28 = 80000000 00000000, %f28 = 80000000 00000000, %f28 = 80000000 00000000
	fsubd	%f28,%f28,%f28		! %f28 = 00000000 00000000
!	Branch On Register, %l1 = 00000000006bc30d
	brlez,a,pn %l1,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018800160] = 2ed86464 36897b4d 770988f9 6f4c5beb
	prefetch [%i1+0x160],23	! Annulled
p2_b127:

p2_label_100:
	membar	#Sync			! Added by membar checker (458)
!	Mem[000000003080002c] = 5358dc3e, %l1 = 00000000006bc30d
	ldsba	[%o1+0x02d]%asi,%l1	! %l1 = 0000000000000058
!	Mem[0000000018000180] = 93ad4148 9a473503 82484995 17a420fb
	prefetcha [%i0+0x180]%asi,23
!	%l4 = 0000000000000000, immed = 00000774, %l2 = 00000000561fdc00
	taddcc	%l4,0x774,%l2		! %l2 = 0000000000000774, %ccr = 00
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800120] = b06735c0 d379ed0d c18c4142 3e0aca32
	prefetch [%i1+0x120],0
p2_b128:

p2_label_101:
	membar	#Sync			! Added by membar checker (459)
!	Mem[000000003200007c] = 33bb7e00, %l4 = 0000000000000000
	lduba	[%o4+0x07d]%asi,%g2	! %g2 = 0000000000000033

	ba,a	p2_not_taken_0_end
p2_not_taken_0:
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba,a	p2_branch_failed
p2_not_taken_0_end:

!	%l2 = 0000000000000774, Mem[0000000032000000] = 237580e8c2bb115b
	stx	%l2,[%o4+0x000]		! Mem[0000000032000000] = 0000000000000774
!	%l2 = 0000000000000774, %l2 = 0000000000000774, %l6 = 00000000000000c6
	andn	%l2,%l2,%l6		! %l6 = 0000000000000000
	set	p2_b129,%o7
	fbule	p2_far_0_le	! Branch Taken, %fcc0 = 1
!	%l0 = 00000000154e7605, Mem[0000000019800182] = bd1c2d30
	sth	%l0,[%i3+0x182]		! Mem[0000000019800180] = bd1c7605
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x081,%g2
p2_b129:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000154e7522
!	%l3  = 0000000000000068

p2_label_102:
	membar	#Sync			! Added by membar checker (460)
!	Mem[00000000180001e0] = 7aa2309d c4a23f42 74631738 d5004b5f
	prefetcha [%i0+0x1e0]%asi,16
	be,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000003100006c] = e6b4db69, %l6 = 0000000000000000
	lduw	[%o2+0x06c],%l6		! Annulled
p2_b130:
	membar	#Sync			! Added by membar checker (461)
!	%l6 = 0000000000000000, %l5 = 000000005358dc3e, %l0 = 00000000154e7522
	srax	%l6,%l5,%l0		! %l0 = 0000000000000000
!	%l3 = 0000000000000068, immed = fffff31d, %l4 = 0000000000000000
	tsubcc	%l3,-0xce3,%l4		! %l4 = 0000000000000d4b, %ccr = 13

p2_label_103:
!	Mem[000000001880005c] = 13feb5fd, %l3 = 0000000000000068
	lduh	[%i1+0x05e],%l3		! %l3 = 000000000000b5fd
!	%f28 = 00000000 00000000, %f26 = 4814079f
	fxtos	%f28,%f26		! %f26 = 00000000
!	%l0 = 0000000000000000, Mem[000000001b000008] = b50bf2e5
	stba	%l0,[%i6+%o6]0x80	! Mem[000000001b000008] = 000bf2e5
	nop
!	Mem[00000000180001c0] = 65d07cde a7f45a27
	flush	%i0+0x1c0

p2_label_104:
!	%l2 = 0000000000000774, %l1 = 0000000000000058, %y  = 00000033
	sdivcc	%l2,%l1,%l4		! %l4 = 000000007fffffff, %ccr = 02
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[000000003000002c] = fa610bde, %l5 = 000000005358dc3e
	lduw	[%o0+0x02c],%l5		! Annulled
p2_b131:
	membar	#Sync			! Added by membar checker (462)
!	Branch On Register, %l1 = 0000000000000058
	brlz,a,pt %l1,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000014] = 876d6e01, %l6 = 0000000000000000
	ldub	[%i2+0x017],%l6		! Annulled
p2_b132:

p2_label_105:
	membar	#Sync			! Added by membar checker (463)
!	%l2 = 0000000000000774, %l4 = 000000007fffffff, %y  = 00000033
	udivcc	%l2,%l4,%l3		! %l3 = 0000000000000066, %ccr = 00
	be,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000019800058] = df3d9956, %l0 = 0000000000000000
	ldstub	[%i3+0x058],%l0		! Annulled
p2_b133:
	membar	#Sync			! Added by membar checker (464)
!	Mem[0000000018000000] = 000000ff, %l3 = 0000000000000066
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000018000008] = 11203ef6 730185da, %l4 = 7fffffff, %l5 = 5358dc3e
	ldda	[%i0+%o6]0x80,%l4	! %l4 = 0000000011203ef6 00000000730185da

p2_label_106:
!	%l7 = ffffffffffffff1d, %l5 = 00000000730185da, %y  = 00000033
	sdiv	%l7,%l5,%l2		! %l2 = 0000000000000073
!	Branch On Register, %l6 = 0000000000000000
	brnz,pt	%l6,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000032000048] = 0e3b0489, %l2 = 0000000000000073
	ldsb	[%o4+0x04a],%g2		! %g2 = 000000000000000e
p2_b134:
	membar	#Sync			! Added by membar checker (465)
!	%l5 = 00000000730185da, immed = 00000b37, %l0 = 0000000000000000
	andncc	%l5,0xb37,%l0		! %l0 = 00000000730184c8, %ccr = 00
!	%l0 = 00000000730184c8, immed = fffff3d1, %l7 = ffffffffffffff1d
	xnorcc	%l0,-0xc2f,%l7		! %l7 = 00000000730188e6, %ccr = 00

p2_label_107:
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000180001c7] = a7f45a27, %l7 = 00000000730188e6
	ldstub	[%i0+0x1c7],%l7		! %l7 = 0000000000000027
p2_b135:
	membar	#Sync			! Added by membar checker (466)
	set	p2_b136,%o7
	fbne,pn	%fcc2,p2_near_3_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000018800000] = ffff6920, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x088,%g2
p2_b136:
!	Registers modified during the branch to p2_near_3
!	%l3  = ffffffff9e1eba2e
!	%l5  = 0016a13cd14acb8e
!	%l7  = 000004bd2d2663da
	membar	#Sync			! Added by membar checker (467)
!	%l6 = ffffffffffffffff, immed = 00000796, %y  = 000004bd
	mulx	%l6,0x796,%l7		! %l7 = fffffffffffff86a

p2_label_108:
!	Branch On Register, %l4 = 0000000011203ef6
	brz,pt	%l4,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000008] = ff000000, %l5 = 0016a13cd14acb8e
	lduha	[%i2+%o6]0x80,%l5	! %l5 = 000000000000ff00
p2_b137:
	membar	#Sync			! Added by membar checker (468)
!	%l6 = ffffffffffffffff, immed = 00000016, %l3 = ffffffff9e1eba2e
	sll	%l6,0x016,%l3		! %l3 = ffffffffffc00000
!	%l7 = fffffffffffff86a, %l1 = 0000000000000058, %l1 = 0000000000000058
	andncc	%l7,%l1,%l1		! %l1 = fffffffffffff822, %ccr = 88
!	%l7 = fffffffffffff86a, immed = fffffda0, %y  = 000004bd
	smulcc	%l7,-0x260,%l3		! %l3 = 0000000000120440, %ccr = 00

p2_label_109:
!	Mem[0000000030800020] = c347c088 26a0b445, %l2 = 00000073, %l3 = 00120440
	ldd	[%o1+0x020],%l2		! %l2 = 00000000c347c088 0000000026a0b445
	bne	p2_b138			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000030800028] = a1ff8b0c 5358dc3e, %l4 = 11203ef6, %l5 = 0000ff00
	ldd	[%o1+0x028],%l4		! %l4 = 00000000a1ff8b0c 000000005358dc3e
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p2_branch_failed
	mov	0x08a,%g2
p2_b138:
	membar	#Sync			! Added by membar checker (469)
	set	p2_b139,%o7
	fbuge,a,pt %fcc3,p2_near_2_he	! Branch Taken, %fcc3 = 2
!	%l2 = c347c088, %l3 = 26a0b445, Mem[0000000018000008] = 11203ef6 730185da
	std	%l2,[%i0+0x008]	! Mem[0000000018000008] = c347c088 26a0b445
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x08b,%g2
p2_b139:
!	Registers modified during the branch to p2_near_2
!	%l4  = fffffffffffffffd
!	%l5  = 000000005358dc3e

p2_label_110:
	bneg	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000018000058] = 50d3538d, %l4 = fffffffffffffffd
	ldsw	[%i0+0x058],%l4		! %l4 = 0000000050d3538d
p2_b140:
	membar	#Sync			! Added by membar checker (470)
!	%f28 = 00000000 00000000, %f16 = 40000000 00000000, %f20 = c1cfede3 4f8fd52f
	fdivd	%f28,%f16,%f20		! %f20 = 00000000 00000000
!	%f24 = fc356cdd, %f21 = 00000000, %f12 = 5e0fd52f
	fsubs	%f24,%f21,%f12		! %f12 = fc356cdd
!	Mem[000000001b000010] = b91993fe, %l2 = 00000000c347c088
	ldsw	[%i6+0x010],%l2		! %l2 = ffffffffb91993fe

p2_label_111:
!	Mem[0000000032000000] = 00000000 00000774 b745e7a8 7b393a14
	prefetcha [%o4+0x000]%asi,0
!	%f28 = 00000000 00000000, %f9  = 81845fdc
	fdtoi	%f28,%f9 		! %f9  = 00000000
!	%f30 = 42fd801f 4f8fd52f, %f16 = 40000000 00000000, %f24 = fc356cdd 57b578c0
	fdivd	%f30,%f16,%f24		! %f24 = 42ed801f 4f8fd52f
!	Mem[0000000030000060] = fc356cdd 57b578c0, %l4 = 0000000050d3538d, %l6 = ffffffffffffffff
	add	%o0,0x60,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = fbbe7000fbbe7000
	bgu,a	p2_b141			! Branch Taken, %ccr = 00, CWP = 0

p2_label_112:
!	%l2 = b91993fe, %l3 = 26a0b445, Mem[0000000019800000] = ff000000 fbbe7000
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000019800000] = b91993fe 26a0b445
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x08d,%g2
p2_b141:
	membar	#Sync			! Added by membar checker (471)
	fbn,pn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = fffffffffffff86a, Mem[0000000019800000] = b91993fe26a0b445
	stxa	%l7,[%i3+%g0]0x80	! Mem[0000000019800000] = fffffffffffff86a
p2_b142:
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000019800040] = 558b48fa 259cb3f5, %l4 = 50d3538d, %l5 = 5358dc3e
	ldd	[%i3+0x040],%l4		! %l4 = 00000000558b48fa 00000000259cb3f5
p2_b143:

p2_label_113:
	membar	#Sync			! Added by membar checker (472)
!	Denormal Floating Point Operation Nullified
	nop
	fbule,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000018000008] = c347c088, %l2 = ffffffffb91993fe
	ldsba	[%i0+%o6]0x80,%l2	! %l2 = ffffffffffffffc3
p2_b144:
	membar	#Sync			! Added by membar checker (473)
!	%l7 = fffffffffffff86a, immed = fffff6ea, %y  = 00000000
	sdivx	%l7,-0x916,%l3		! %l3 = 0000000000000000
	set	p2_b145,%o7
	fba,a,pn %fcc2,p2_near_0_he	! Branch Taken, %fcc2 = 1

p2_label_114:
!	Mem[0000000032000060] = 795ad0c7 ffffffdc 00000000 a3c0648f
	prefetch [%o4+0x060],20	! Annulled
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x091,%g2
p2_b145:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000000
!	%l4  = 00000000259cbb3c
!	%l5  = fffffffffffff832
!	%l6  = 8a378c5a795ad0c7
	membar	#Sync			! Added by membar checker (474)
!	Mem[0000000031800068] = 00000000 00ffffdc, %l5 = fffffffffffff832, %l2 = ffffffffffffffc3
	add	%o3,0x68,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 2eb3ff9e0dffc195
!	%l5 = fffffffffffff832, %l7 = fffffffffffff86a, %l4 = 00000000259cbb3c
	sub	%l5,%l7,%l4		! %l4 = ffffffffffffffc8
	bpos	p2_b146			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000030000060] = fbbe7000 fbbe7000, %l6 = 795ad0c7, %l7 = fffff86a
	ldd	[%o0+0x060],%l6		! %l6 = 00000000fbbe7000 00000000fbbe7000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x092,%g2
p2_b146:

p2_label_115:
	membar	#Sync			! Added by membar checker (475)
!	Mem[0000000031800028] = 00000000 000000c1, %l0 = 00000000, %l1 = fffff822
	ldda	[%o3+0x028]%asi,%l0	! %l0 = 0000000000000000 00000000000000c1
	bvc	p2_b147			! Branch Taken, %ccr = 00, CWP = 0
!	%l4 = ffffffffffffffc8, Mem[0000000018000000] = ff0000ff
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000018000000] = ffffffc8
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x093,%g2
p2_b147:
!	Jump to jmpl_2, CWP = 0
	set	p2_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[00000000190001e0] = 497fca81, %l7 = 00000000fbbe7000
	lduh	[%i2+0x1e0],%l7		! %l7 = 000000000000497f
!	Registers modified during the branch to p2_jmpl_2
!	%l3  = 00000000fbbe7c7a
!	%l5  = 20c8f3252af1cf1f
!	%l6  = 20c8f3252af1cfde
!	%l7  = 000000005358dc0a

p2_label_116:
	ble,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000018000154] = 578c8bff, %l3 = 00000000fbbe7c7a
	ldub	[%i0+0x156],%l3		! Annulled
p2_b148:
	membar	#Sync			! Added by membar checker (476)
!	%f28 = 00000000, %f25 = 4f8fd52f, %f9  = 00000000
	fdivs	%f28,%f25,%f9 		! %f9  = 00000000
	bne	p2_b149			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000019000008] = ff000000, %l4 = ffffffffffffffc8
	lduha	[%i2+%o6]0x80,%l4	! %l4 = 000000000000ff00
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x095,%g2
p2_b149:

p2_label_117:
	membar	#Sync			! Added by membar checker (477)
!	Mem[0000000018800000] = ffff6920, %l6 = 20c8f3252af1cfde
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffff6920
!	%f28 = 00000000 00000000, %f2  = c1cfede3 4f8fd52f
	fxtod	%f28,%f2 		! %f2  = 00000000 00000000
!	Mem[0000000030800020] = c347c088, %l1 = 00000000000000c1
	lduwa	[%o1+0x020]%asi,%l1	! %l1 = 00000000c347c088
!	Mem[0000000019000008] = ff000000, %l2 = 2eb3ff9e0dffc195
	lduba	[%i2+%o6]0x80,%l2	! %l2 = 00000000000000ff
!	Denormal Floating Point Operation Nullified
	nop

p2_label_118:
!	Mem[0000000031800028] = 00000000, %l7 = 000000005358dc0a
	lduwa	[%o3+0x028]%asi,%l7	! %l7 = 0000000000000000
!	%f9  = 00000000, %f22 = b8308bfb
	fitos	%f9 ,%f22		! %f22 = 00000000
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[000000001a000008] = 00000000 00000000, %l4 = 0000ff00, %l5 = 2af1cf1f
	ldda	[%i4+%o6]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Branch On Register, %l1 = 00000000c347c088
	brz,pn	%l1,p2_not_taken_0	! Branch Not Taken

p2_label_119:
!	%l7 = 0000000000000000, Mem[0000000019000000] = fbbe7000
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000019000000] = 00be7000
p2_b150:
	membar	#Sync			! Added by membar checker (478)
!	%l0 = 0000000000000000, immed = 0000008c, %l1 = 00000000c347c088
	orcc	%l0,0x08c,%l1		! %l1 = 000000000000008c, %ccr = 00
	fbuge,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018000000] = ffffffc8 0000fe01 c347c088 26a0b445
	prefetch [%i0+0x000],1
p2_b151:
	membar	#Sync			! Added by membar checker (479)
!	Mem[0000000031000068] = a3c0648f, %l4 = 0000000000000000
	ldswa	[%o2+0x068]%asi,%l4	! %l4 = ffffffffa3c0648f

p2_label_120:
!	%l4 = ffffffffa3c0648f, Mem[0000000019800000] = fffffffffffff86a
	stxa	%l4,[%i3+%g0]0x80	! Mem[0000000019800000] = ffffffffa3c0648f
!	%l0 = 0000000000000000, immed = fffff239, %y  = 00000000
	udivx	%l0,-0xdc7,%l4		! %l4 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000018800000] = ffff6920
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000018800000] = 00ff6920
!	Mem[0000000019800008] = 94452300, %l6 = 00000000ffff6920
	ldswa	[%i3+%o6]0x80,%l6	! %l6 = ffffffff94452300
	bne,a	p2_b152			! Branch Taken, %ccr = 00, CWP = 0

p2_label_121:
!	Mem[0000000019800060] = 39be61a7 ada4953a b8cf0ac7 6ddfae43
	prefetch [%i3+0x060],3
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x098,%g2
p2_b152:
	membar	#Sync			! Added by membar checker (480)
!	%f6  = f0b4a323, %f21 = 00000000, %f21 = 00000000
	fmuls	%f6 ,%f21,%f21		! %f21 = 80000000
!	call to call_2, CWP = 0
	call	p2_call_2_he
!	Mem[0000000031800020] = e38ecffc, %l1 = 000000000000008c
	lduw	[%o3+0x020],%l1		! %l1 = 00000000e38ecffc
!	Registers modified during the branch to p2_call_2
!	%l4  = 000000000000006e
!	Mem[0000000018800008] = c30dff96, %l0 = 0000000000000000
	lduwa	[%i1+%o6]0x80,%l0	! %l0 = 00000000c30dff96

p2_label_122:
!	%l1 = 00000000e38ecffc, immed = fffff74c, %l4 = 000000000000006e
	sub	%l1,-0x8b4,%l4		! %l4 = 00000000e38ed8b0
	fbuge,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800008] = c30dff96, %l4 = 00000000e38ed8b0
	ldsba	[%i1+%o6]0x80,%l4	! Annulled
p2_b153:
	membar	#Sync			! Added by membar checker (481)
!	%f2  = 00000000, %f12 = fc356cdd
	fcmpes	%fcc1,%f2 ,%f12		! %fcc1 = 2
!	%l1 = 00000000e38ecffc, %l7 = 0000000000000000, %l1 = 00000000e38ecffc
	sll	%l1,%l7,%l1		! %l1 = 00000000e38ecffc

p2_label_123:
!	Mem[0000000019000040] = f17dd476 89828c75 247b45bb 52865e32
	prefetcha [%i2+0x040]%asi,0
!	Mem[0000000019000000] = 00be7000, %l0 = 00000000c30dff96
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f2  = 00000000 00000000, %f17 = 00000000
	fxtos	%f2 ,%f17		! %f17 = 00000000
!	Mem[0000000030000028] = fe01b485 fa610bde, %l6 = 94452300, %l7 = 00000000
	ldd	[%o0+0x028],%l6		! %l6 = 00000000fe01b485 00000000fa610bde
!	%l1 = 00000000e38ecffc, immed = 00000def, %y  = 00000000
	udiv	%l1,0xdef,%l3		! %l3 = 00000000001054e3

p2_label_124:
!	%l3 = 00000000001054e3, %l7 = 00000000fa610bde, %y  = 00000000
	sdiv	%l3,%l7,%l3		! %l3 = 0000000000000000
!	Mem[0000000018800100] = ceea8015 54a6dd8d e9b85fca f5825aa5
	prefetcha [%i1+0x100]%asi,20
!	%l1 = 00000000e38ecffc, Mem[0000000018800068] = b81d29cb
	stwa	%l1,[%i1+0x068]%asi	! Mem[0000000018800068] = e38ecffc
	set	p2_b154,%o7
	fbule,a	p2_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000019000020] = e4c7f8a4 33680c30 79ab63f0 ef17015f
	prefetch [%i2+0x020],20
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x09a,%g2
p2_b154:
!	Registers modified during the branch to p2_far_2
!	%l3  = ffffffffffffffff
!	%l5  = fffffffffffffbbe
!	%l7  = ffffffffffffffff

p2_label_125:
	membar	#Sync			! Added by membar checker (482)
!	%l4 = e38ed8b0, %l5 = fffffbbe, Mem[0000000032000008] = b745e7a8 7b393a14
	std	%l4,[%o4+0x008]	! Mem[0000000032000008] = e38ed8b0 fffffbbe
	fbge,pn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019800000] = ffffffff a3c0648f, %l6 = fe01b485, %l7 = ffffffff
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000ffffffff 00000000a3c0648f
p2_b155:
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000180000c0] = 4e7e6f9e f17536c9 73a0252d 83cee25a
	prefetch [%i0+0x0c0],20
p2_b156:

p2_label_126:
	membar	#Sync			! Added by membar checker (483)
!	Mem[0000000031000028] = 5358dc0a, %l2 = 00000000000000ff
	ldsh	[%o2+0x028],%l2		! %l2 = 0000000000005358
	be,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[00000000180001ac] = 179f9a16, %l7 = 00000000a3c0648f
	lduw	[%i0+0x1ac],%l7		! Annulled
p2_b157:
	fbge	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 0000000000005358, Mem[0000000018800008] = c30dff96
	stha	%l2,[%i1+%o6]0x80	! Mem[0000000018800008] = 5358ff96
p2_b158:

p2_label_127:
	membar	#Sync			! Added by membar checker (484)
!	Mem[00000000198001e0] = 768d57a6 07892e46 47b70a26 d257988a
	prefetcha [%i3+0x1e0]%asi,1
!	Mem[0000000030800068] = 5651c192, %l2 = 0000000000005358
	lduh	[%o1+0x06a],%l2		! %l2 = 000000000000c192
!	%f14 = bc67922d 40000000, %f24 = 42ed801f 4f8fd52f
	fcmpd	%fcc1,%f14,%f24		! %fcc1 = 1
!	Mem[0000000018800008] = 5358ff96, %l5 = fffffffffffffbbe
	ldsha	[%i1+%o6]0x80,%l5	! %l5 = 0000000000005358
!	%l6 = ffffffff, %l7 = a3c0648f, Mem[0000000031800020] = e38ecffc 00ffffff
	stda	%l6,[%o3+0x020]%asi	! Mem[0000000031800020] = ffffffff a3c0648f

p2_label_128:
!	%l1 = 00000000e38ecffc, %l5 = 0000000000005358, %l4 = 00000000e38ed8b0
	xor	%l1,%l5,%l4		! %l4 = 00000000e38e9ca4
!	Mem[0000000031800068] = 2eb3ff9e, %l6 = 00000000ffffffff
	swap	[%o3+0x068],%l6		! %l6 = 000000002eb3ff9e
	bne	p2_b159			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],1
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x09f,%g2
p2_b159:
	membar	#Sync			! Added by membar checker (485)
	nop

p2_label_129:
!	Mem[0000000040000038] = 3a1332ff, %l4 = 00000000e38e9ca4
	lduha	[%o5+0x038]%asi,%l4	! %l4 = 0000000000003a13
!	%l3 = ffffffffffffffff, immed = 0000000b, %l2 = 000000000000c192
	sra	%l3,0x00b,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000019000008] = ff000000, %l1 = 00000000e38ecffc
	ldstuba	[%i2+%o6]0x80,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000005358, immed = fffffb32, %y  = 00000000
	udiv	%l5,-0x4ce,%l6		! %l6 = 0000000000000000
	set	p2_b160,%o7
	fblg	p2_far_3_le	! Branch Taken, %fcc0 = 1

p2_label_130:
!	Mem[00000000190001a0] = ab4632e8 ceed2160 67caae89 98338ee7
	prefetch [%i2+0x1a0],23
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x0a0,%g2
p2_b160:
!	Registers modified during the branch to p2_far_3
!	%l0  = 0000000000000c98
!	%l1  = fffffffffffff3e7
!	%l5  = 000000005651c192
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (486)
	fbug,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000019800008] = 94452300, %l4 = 0000000000003a13
	ldsha	[%i3+%o6]0x80,%l4	! %l4 = ffffffffffff9445
p2_b161:
	bl,a	p2_b162			! Branch Taken, %ccr = 88, CWP = 0
!	%l3 = ffffffffffffffff, Mem[0000000019800000] = ffffffff
	stba	%l3,[%i3+%g0]0x80	! Mem[0000000019800000] = ffffffff
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0a2,%g2
p2_b162:

p2_label_131:
	membar	#Sync			! Added by membar checker (487)
!	%l6 = 0000000000000000, Mem[0000000030800063] = e958f4e2
	stb	%l6,[%o1+0x063]		! Mem[0000000030800060] = e958f400
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000031800027] = a3c0648f, %l1 = fffffffffffff3e7
	ldstub	[%o3+0x027],%l1		! Annulled
p2_b163:
	set	p2_b164,%o7
	fbul	p2_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[00000000188001a0] = ab0143d2 08d1de42 88b4e3ee 45149ef6
	prefetch [%i1+0x1a0],23
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x0a4,%g2
p2_b164:
!	Registers modified during the branch to p2_far_2
!	%l3  = ffffffffffffffff
!	%l5  = fffffffffffffbbe
!	%l7  = ffffffffffffffff

p2_label_132:
	membar	#Sync			! Added by membar checker (488)
!	%l4 = ffffffffffff9445, Mem[0000000032000012] = c640925b
	stha	%l4,[%o4+0x012]%asi	! Mem[0000000032000010] = 9445925b
!	Mem[0000000030000060] = fbbe7000, %l4 = ffffffffffff9445
	lduw	[%o0+0x060],%l4		! %l4 = 00000000fbbe7000
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000019800038] = 16017fa4 4ba2576b
	std	%l2,[%i3+0x038]	! Mem[0000000019800038] = ffffffff ffffffff
!	%l5 = fffffffffffffbbe, %l4 = 00000000fbbe7000, %l5 = fffffffffffffbbe
	xorcc	%l5,%l4,%l5		! %l5 = ffffffff04418bbe, %ccr = 80
	set	p2_b165,%o7
	fbul,a	p2_far_2_le	! Branch Taken, %fcc0 = 1

p2_label_133:
!	Mem[0000000018000008] = c347c088, %l1 = fffffffffffff3e7
	ldsha	[%i0+%o6]0x80,%l1	! %l1 = ffffffffffffc347
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x0a5,%g2
p2_b165:
!	Registers modified during the branch to p2_far_2
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (489)
!	Mem[0000000018800098] = 74f81b93, %l7 = ffffffffffffffff
	ldswa	[%i1+0x098]%asi,%l7	! %l7 = 0000000074f81b93
!	Mem[0000000018800080] = fc8a9c28 99733245, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i1+0x080]%asi,%l2	! %l2 = 00000000fc8a9c28 0000000099733245
!	%l4 = fbbe7000, %l5 = 04418bbe, Mem[0000000019000058] = 4ae69885 071560b1
	stda	%l4,[%i2+0x058]%asi	! Mem[0000000019000058] = fbbe7000 04418bbe
!	%l3 = 0000000099733245, immed = fffff2fb, %l7 = 0000000074f81b93
	taddcc	%l3,-0xd05,%l7		! %l7 = 0000000099732540, %ccr = 1b

p2_label_134:
!	%l1 = ffffffffffffc347
	sethi	%hi(0xa8ec5400),%l1	! %l1 = 00000000a8ec5400
!	%l1 = 00000000a8ec5400, %l5 = ffffffff04418bbe, %l5 = ffffffff04418bbe
	addc	%l1,%l5,%l5		! %l5 = ffffffffad2ddfbf
!	%l6 = 0000000000000000, %l6 = 0000000000000000, %l7 = 0000000099732540
	srlx	%l6,%l6,%l7		! %l7 = 0000000000000000
	bneg,a	p2_b166			! Branch Taken, %ccr = 1b, CWP = 0
!	Mem[0000000019800008] = 94452300, %l7 = 0000000000000000
	lduha	[%i3+%o6]0x80,%l7	! %l7 = 0000000000009445
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0a6,%g2
p2_b166:

p2_label_135:
	membar	#Sync			! Added by membar checker (490)
	fbge,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800000] = 00ff6920, %l4 = 00000000fbbe7000
	ldsba	[%i1+%g0]0x80,%l4	! Annulled
p2_b167:
	membar	#Sync			! Added by membar checker (491)
!	Mem[00000000188001f8] = 00000000 00000000, %l4 = 00000000fbbe7000, %l6 = 0000000000000000
	add	%i1,0x1f8,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 5c9e7f48dab65722
	bgu	p2_not_taken_0		! Branch Not Taken, %ccr = 1b
!	Mem[000000001880007c] = f8eff857, %l2 = 00000000fc8a9c28
	ldsh	[%i1+0x07c],%l2		! %l2 = fffffffffffff8ef
p2_b168:

p2_label_136:
	membar	#Sync			! Added by membar checker (492)
!	%l5 = ffffffffad2ddfbf, %l4 = 00000000fbbe7000, %l7 = 0000000000009445
	orncc	%l5,%l4,%l7		! %l7 = ffffffffad6ddfff, %ccr = 88
!	%l7 = ffffffffad6ddfff, Mem[0000000018800008] = 5358ff96
	stwa	%l7,[%i1+%o6]0x80	! Mem[0000000018800008] = ad6ddfff
!	call to call_1, CWP = 0
	call	p2_call_1_he
!	Mem[0000000018000064] = 1f81dd76, %l6 = 5c9e7f48dab65722
	ldsb	[%i0+0x066],%l6		! %l6 = ffffffffffffffdd
!	Registers modified during the branch to p2_call_1
!	%l0  = ffffffff5a9bbfbe
!	%l1  = 0000000000000059
!	%l5  = 0000001e134a9000
	fbug,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_137:
!	%l6 = ffffffffffffffdd, Mem[00000000190001cc] = 0fa7754a
	stb	%l6,[%i2+0x1cc]		! Annulled
p2_b169:
	membar	#Sync			! Added by membar checker (493)
!	%f13 = 00000000, %f15 = 40000000
	fcmpes	%fcc1,%f13,%f15		! %fcc1 = 1
!	%l7 = ffffffffad6ddfff, %l0 = ffffffff5a9bbfbe, %y  = 0000001e
	mulx	%l7,%l0,%l2		! %l2 = 3558846ef7108042
	set	p2_b170,%o7
	fbne	p2_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000018000008] = c347c088, %l6 = ffffffffffffffdd
	ldstuba	[%i0+%o6]0x80,%l6	! %l6 = 00000000000000c3
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p2_branch_failed
	mov	0x0aa,%g2
p2_b170:
!	Registers modified during the branch to p2_far_1
!	%l1  = 000000000000011c
!	%l2  = 0000000000000000
!	%l3  = 0000000000000042

p2_label_138:
	membar	#Sync			! Added by membar checker (494)
!	%l1 = 000000000000011c, immed = 00000e9d, %l6 = 00000000000000c3
	xor	%l1,0xe9d,%l6		! %l6 = 0000000000000f81
!	Mem[000000001880013c] = 2da4ff15, %l2 = 0000000000000000
	swapa	[%i1+0x13c]%asi,%l2	! %l2 = 000000002da4ff15
!	%l6 = 0000000000000f81, immed = 0000096f, %y  = 0000001e
	umulcc	%l6,0x96f,%l4		! %l4 = 00000000009241ef, %ccr = 00
!	%l1 = 000000000000011c, %l0 = ffffffff5a9bbfbe, %l0 = ffffffff5a9bbfbe
	xor	%l1,%l0,%l0		! %l0 = ffffffff5a9bbea2
!	Mem[000000001980002c] = e2f7a7bb, %l7 = ffffffffad6ddfff
	lduh	[%i3+0x02c],%l7		! %l7 = 000000000000e2f7

p2_label_139:
!	Branch On Register, %l7 = 000000000000e2f7
	brgez,pt %l7,p2_b171		! Branch Taken
!	Mem[0000000018800008] = ad6ddfff, %l2 = 000000002da4ff15
	ldsha	[%i1+%o6]0x80,%l2	! %l2 = ffffffffffffad6d
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0ab,%g2
p2_b171:
	membar	#Sync			! Added by membar checker (495)
!	%l1 = 000000000000011c, %l5 = 0000001e134a9000, %l0 = ffffffff5a9bbea2
	srax	%l1,%l5,%l0		! %l0 = 000000000000011c
!	Mem[0000000019000000] = ffbe7000, %l2 = ffffffffffffad6d
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffbe7000
!	Branch On Register, %l5 = 0000001e134a9000
	brz,a,pn %l5,p2_not_taken_0	! Branch Not Taken

p2_label_140:
!	Mem[0000000018800140] = 7a855bee d6f6d96b 921aae7e 51180091
	prefetch [%i1+0x140],23	! Annulled
p2_b172:
	membar	#Sync			! Added by membar checker (496)
!	%l1 = 000000000000011c, Mem[000000001a800008] = 6334ba0b
	stba	%l1,[%i5+%o6]0x80	! Mem[000000001a800008] = 1c34ba0b
!	%l4 = 00000000009241ef, Mem[0000000019800008] = 9445230000000047
	stxa	%l4,[%i3+%o6]0x80	! Mem[0000000019800008] = 00000000009241ef
!	Mem[000000003080006c] = 00000000, %l7 = 000000000000e2f7
	ldsw	[%o1+0x06c],%l7		! %l7 = 0000000000000000
!	%f24 = 42ed801f 4f8fd52f, %f16 = 40000000 00000000
	fnegd	%f24,%f16		! %f16 = c2ed801f 4f8fd52f

p2_label_141:
!	%l5 = 0000001e134a9000, %l2 = ffffffffffbe7000, %l4 = 00000000009241ef
	orncc	%l5,%l2,%l4		! %l4 = 0000001e134b9fff, %ccr = 00
!	%l1 = 000000000000011c, immed = 000008f1, %y  = 00000000
	udivcc	%l1,0x8f1,%l7		! %l7 = 0000000000000000, %ccr = 44
!	Mem[0000000019000000] = ffbe7000 00000042 ff000000 aa581ea9
	prefetch [%i2+0x000],0
!	%l0 = 000000000000011c, immed = 0000002b, %l2 = ffffffffffbe7000
	srlx	%l0,0x02b,%l2		! %l2 = 0000000000000000
!	Mem[0000000018000008] = ff47c088, %l2 = 0000000000000000
	lduba	[%i0+%o6]0x80,%l2	! %l2 = 00000000000000ff

p2_label_142:
!	%l4 = 0000001e134b9fff, immed = fffff050, %l5 = 0000001e134a9000
	orncc	%l4,-0xfb0,%l5		! %l5 = 0000001e134b9fff, %ccr = 00
!	%f24 = 42ed801f 4f8fd52f, %f2  = 00000000 00000000, %f28 = 00000000 00000000
	faddd	%f24,%f2 ,%f28		! %f28 = 42ed801f 4f8fd52f
!	%f11 = 40000000, %f14 = bc67922d
	fstoi	%f11,%f14		! %f14 = 00000002
!	%l4 = 0000001e134b9fff, immed = fffffdb7, %l6 = 0000000000000f81
	subccc	%l4,-0x249,%l6		! %l6 = 0000001e134ba248, %ccr = 11
	set	p2_b173,%o7
	fblg,pt	%fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 2

p2_label_143:
!	Mem[00000000180001ec] = d5004b5f, %l6 = 0000001e134ba248
	ldsb	[%i0+0x1ec],%l6		! %l6 = ffffffffffffffd5
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0ad,%g2
p2_b173:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000000000000
!	%l4  = 000000000000011c
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (497)
!	Mem[00000000188001cc] = a7ad2239, %l1 = 000000000000011c
	ldstuba	[%i1+0x1cc]%asi,%l1	! %l1 = 00000000000000a7
!	%l0 = 000000000000011c, immed = 00000033, %l6 = ffffffffffffffd5
	srax	%l0,0x033,%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, immed = 00000cb4, %y  = 00000000
	mulx	%l6,0xcb4,%l0		! %l0 = 0000000000000000
!	Mem[0000000018000130] = 80848bbaf891a031, %l7 = 0000000000000000
	ldxa	[%i0+0x130]%asi,%l7	! %l7 = 80848bbaf891a031

p2_label_144:
!	%f2  = 00000000 00000000, %f29 = 4f8fd52f
	fdtos	%f2 ,%f29		! %f29 = 00000000
!	%l3 = 0000000000000000, %l0 = 0000000000000000, %l0 = 0000000000000000
	addc	%l3,%l0,%l0		! %l0 = 0000000000000000
!	Mem[0000000019000000] = ffbe7000, %l2 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 000000000000ffbe
!	%l0 = 00000000, %l1 = 000000a7, Mem[0000000031800068] = ffffffff 0dffc195
	stda	%l0,[%o3+0x068]%asi	! Mem[0000000031800068] = 00000000 000000a7
!	Branch On Register, %l5 = 0000000000000000
	brz,a,pn %l5,p2_b174		! Branch Taken

p2_label_145:
!	Mem[0000000018800180] = b004f452 e159f929 24161392 777c2a05
	prefetch [%i1+0x180],20
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0ae,%g2
p2_b174:
	membar	#Sync			! Added by membar checker (498)
!	%f2  = 00000000 00000000, %f30 = 42fd801f 4f8fd52f
	fxtod	%f2 ,%f30		! %f30 = 00000000 00000000
	fbue,a,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000018800028] = 47105954, %l1 = 00000000000000a7
	ldsh	[%i1+0x02a],%l1		! Annulled
p2_b175:
	membar	#Sync			! Added by membar checker (499)
!	%l6 = 0000000000000000, immed = 00000798, %y  = 00000000
	sdivx	%l6,0x798,%l4		! %l4 = 0000000000000000

p2_label_146:
	set	p2_b176,%o7
	fblg,pt	%fcc2,p2_near_2_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000018000058] = 50d3538d76a5ab30, %l3 = 0000000000000000
	ldx	[%i0+0x058],%l3		! %l3 = 50d3538d76a5ab30
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0b0,%g2
p2_b176:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000000000000
!	%l4  = 00000000000000a7
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000
	bvs	p2_b177			! Branch Taken, %ccr = 02, CWP = 0
!	%l5 = 0000000000000000, Mem[0000000030000065] = fbbe7000
	stb	%l5,[%o0+0x065]		! Mem[0000000030000064] = fb007000
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0b1,%g2
p2_b177:
	set	p2_b178,%o7
	fblg	p2_far_2_le	! Branch Taken, %fcc0 = 1

p2_label_147:
!	Mem[0000000018000000] = ffffffc8, %l6 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0b2,%g2
p2_b178:
!	Registers modified during the branch to p2_far_2
!	%l2  = a700000000000000
	membar	#Sync			! Added by membar checker (500)
!	%f24 = 42ed801f 4f8fd52f, %f2  = 00000000 00000000, %f6  = f0b4a323 00000002
	faddd	%f24,%f2 ,%f6 		! %f6  = 42ed801f 4f8fd52f
!	Mem[0000000018000008] = ff47c088, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	%f23 = 80000000, %f18 = 00000001 12937dd9
	fstox	%f23,%f18		! %f18 = 00000000 00000000
!	Mem[0000000019800008] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000

p2_label_148:
	fbe,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000032000074] = cf9aa2f9, %l0 = 0000000000000000
	lduw	[%o4+0x074],%g2		! Annulled
p2_b179:
	membar	#Sync			! Added by membar checker (501)
	set	p2_b180,%o7
	fbo,a,pn %fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000019800120] = 51d5b2ea 0bd8dafd d7c5e32c 5176dc8e
	prefetch [%i3+0x120],1
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0b4,%g2
p2_b180:
!	Registers modified during the branch to p2_near_3
!	%l1  = 000000000000044c
!	%l3  = 0000000000000000
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (502)
!	%l0 = 0000000000000000, Mem[0000000030800020] = c347c088
	sth	%l0,[%o1+0x020]		! Mem[0000000030800020] = 0000c088

p2_label_149:
	fbn,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = a700000000000000, Mem[0000000019000008] = ff000000aa581ea9
	stxa	%l2,[%i2+%o6]0x80	! Annulled
p2_b181:
	membar	#Sync			! Added by membar checker (503)
	set	p2_b182,%o7
	fbug,a,pn %fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 2
!	Mem[0000000019800160] = bfeb90f2 c3ab8282 829e4330 bc144834
	prefetch [%i3+0x160],20
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0b6,%g2
p2_b182:
!	Registers modified during the branch to p2_near_3
!	%l1  = 00000000000000a7
!	%l3  = 0000000000000000
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (504)
!	%f28 = 42ed801f 00000000, %f26 = 00000000 5eeabb40
	fdtox	%f28,%f26		! %f26 = 0000ec00 f8000000

p2_label_150:
!	%l3 = 0000000000000000, %l4 = 00000000000000a7, %y  = 00000000
	udivx	%l3,%l4,%l2		! %l2 = 0000000000000000
!	%f30 = 00000000 00000000, %f24 = 42ed801f
	fdtoi	%f30,%f24		! %f24 = 00000000
!	%l1 = 00000000000000a7, immed = ffffff86, %l0 = 0000000000000000
	xor	%l1,-0x07a,%l0		! %l0 = ffffffffffffff21
	fble,a,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000030000064] = fb007000, %l2 = 0000000000000000
	swap	[%o0+0x064],%l2		! Annulled
p2_b183:

p2_label_151:
	membar	#Sync			! Added by membar checker (505)
!	Mem[0000000018000020] = e961d5fa 594e4aa4 9ad79b74 1c38bef7
	prefetch [%i0+0x020],3
	fbuge,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l5 = 0000000000000000, Mem[0000000019000000] = ffbe700000000042
	stxa	%l5,[%i2+%g0]0x80	! Annulled
p2_b184:
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000018800000] = 00ff6920, %l1 = 00000000000000a7
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
p2_b185:

p2_label_152:
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001a800000] = 3006223f, %l5 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000030
!	Registers modified during the branch to p2_jmpl_3
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (506)
!	Mem[0000000018000000] = ffffffc8, %l0 = ffffffffffffff21
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ffffffc8
!	%l2 = 0000000000000000, immed = fffff4bd, %l6 = 0000000000000000
	andcc	%l2,-0xb43,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Denormal Floating Point Operation Nullified
	nop

p2_label_153:
	ba	p2_b186			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000030000024] = 000000a3, %l3 = 0000000000000000
	ldstub	[%o0+0x024],%l3		! %l3 = 0000000000000000
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x0ba,%g2
p2_b186:
	membar	#Sync			! Added by membar checker (507)
!	%l3 = 0000000000000000, Mem[0000000018800008] = ad6ddfff
	stha	%l3,[%i1+%o6]0x80	! Mem[0000000018800008] = 0000dfff
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019000008] = ff000000, %l7 = 0000000000000000
	swapa	[%i2+%o6]0x80,%l7	! %l7 = 00000000ff000000
p2_b187:

p2_label_154:
	membar	#Sync			! Added by membar checker (508)
!	%l6 = 0000000000000000, immed = 00000011, %l5 = 0000000000000030
	sllx	%l6,0x011,%l5		! %l5 = 0000000000000000
!	Mem[00000000198001a0] = e8c22972 12389866 e7a0bfe5 59f2eb27
	prefetch [%i3+0x1a0],3
!	%l4 = 00000000000000a7, Mem[0000000018000000] = ffffffc8
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000018000000] = 000000a7
!	%l1 = 0000000000000000, %l2 = 0000000000000000, %l6 = 0000000000000000
	sllx	%l1,%l2,%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, %l7 = 00000000ff000000, %l4 = 00000000000000a7
	orcc	%l6,%l7,%l4		! %l4 = 00000000ff000000, %ccr = 08

p2_label_155:
!	Mem[0000000032000000] = 00000000 00000774 e38ed8b0 fffffbbe
	prefetcha [%o4+0x000]%asi,22
!	%l5 = 0000000000000000, Mem[0000000031800062] = 000006ff
	stb	%l5,[%o3+0x062]		! Mem[0000000031800060] = 000000ff
!	%l1 = 0000000000000000, Mem[000000003080006d] = 00000000
	stba	%l1,[%o1+0x06d]%asi	! Mem[000000003080006c] = 00000000
!	%l5 = 0000000000000000, immed = fffffcdd, %y  = 00000000
	umulcc	%l5,-0x323,%l3		! %l3 = 0000000000000000, %ccr = 44
	fbe	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_156:
!	Mem[0000000018800140] = 7a855bee d6f6d96b 921aae7e 51180091
	prefetch [%i1+0x140],21
p2_b188:
	membar	#Sync			! Added by membar checker (509)
	fbl,pt	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000018800000] = 00ff6920, %l5 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
p2_b189:
	membar	#Sync			! Added by membar checker (510)
!	Mem[00000000180000e0] = 7765fd20 fa5ef2ff f49bf546 3f3b81cc
	prefetcha [%i0+0x0e0]%asi,1
!	%l5 = 0000000000000000, immed = 00000b3f, %y  = 00000000
	udivcc	%l5,0xb3f,%l4		! %l4 = 0000000000000000, %ccr = 44

p2_label_157:
!	%f0  = 3f800000, %f27 = f8000000, %f24 = 00000000
	fdivs	%f0 ,%f27,%f24		! %f24 = 87000000
!	Mem[0000000030000060] = fbbe7000, %l6 = 0000000000000000
	swapa	[%o0+0x060]%asi,%l6	! %l6 = 00000000fbbe7000
!	Mem[0000000030800028] = a1ff8b0c, %l3 = 0000000000000000
	lduh	[%o1+0x02a],%l3		! %l3 = 0000000000008b0c
!	%f24 = 87000000 4f8fd52f, %f20 = 00000000 80000000
	fnegd	%f24,%f20		! %f20 = 07000000 4f8fd52f
!	Branch On Register, %l2 = 0000000000000000
	brlz,pn	%l2,p2_not_taken_0	! Branch Not Taken

p2_label_158:
!	Mem[0000000019800000] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffff
p2_b190:
	membar	#Sync			! Added by membar checker (511)
	fbu,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018000100] = 26a0b445 9e39ca9c 39e37347 eab03088
	prefetch [%i0+0x100],4	! Annulled
p2_b191:
	membar	#Sync			! Added by membar checker (512)
!	%l4 = ffffffffffffffff, Mem[0000000018800000] = 00ff6920
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000018800000] = ffffffff
	bpos,a	p2_b192			! Branch Taken, %ccr = 44, CWP = 0

p2_label_159:
!	Mem[000000003000006c] = 5358dc3e, %l5 = 0000000000000000
	lduh	[%o0+0x06c],%l5		! %l5 = 0000000000005358
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0c0,%g2
p2_b192:
	membar	#Sync			! Added by membar checker (513)
!	%l1 = 0000000000000000, immed = 0000018e, %y  = 00000000
	umul	%l1,0x18e,%l0		! %l0 = 0000000000000000
	set	p2_b193,%o7
	fbo	p2_far_0_le	! Branch Taken, %fcc0 = 1
!	%l2 = 00000000, %l3 = 00008b0c, Mem[0000000019000008] = 00000000 aa581ea9
	stda	%l2,[%i2+%o6]0x80	! Mem[0000000019000008] = 00000000 00008b0c
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0c1,%g2
p2_b193:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000001fabe7000
!	%l3  = 0000000000000068
	membar	#Sync			! Added by membar checker (514)
!	%l5 = 0000000000005358, Mem[0000000019000058] = fbbe7000
	stha	%l5,[%i2+0x058]%asi	! Mem[0000000019000058] = 53587000

p2_label_160:
	set	p2_b194,%o7
	fba,a,pn %fcc3,p2_near_1_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000018000000] = 000000a7, %l5 = 0000000000005358
	ldswa	[%i0+%g0]0x80,%l5	! Annulled
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0c2,%g2
p2_b194:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000008
!	%l3  = 0000000000000028
!	%l4  = 0000000000000000
	set	p2_b195,%o7
	fbule,a	p2_far_0_he	! Branch Taken, %fcc0 = 1
!	%l4 = 0000000000000000, Mem[0000000019000000] = ffbe7000
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = 00000000
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0c3,%g2
p2_b195:
!	Registers modified during the branch to p2_far_0
!	%l1  = fffffffffffffff8
!	%l5  = fffffffffffff0aa
!	%l6  = 00000000000000b5
	membar	#Sync			! Added by membar checker (515)
	fbn,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1

p2_label_161:
!	Mem[0000000018800008] = 0000dfff, %l7 = 00000000ff000000
	lduba	[%i1+%o6]0x80,%l7	! Annulled
p2_b196:
	membar	#Sync			! Added by membar checker (516)
!	Mem[0000000018000000] = 000000a70000fe01, %l1 = fffffffffffffff8
	ldxa	[%i0+%g0]0x80,%l1	! %l1 = 000000a70000fe01
!	Branch On Register, %l5 = fffffffffffff0aa
	brlez,a,pn %l5,p2_b197		! Branch Taken
!	Mem[00000000188001c0] = 79fcfc01 59954d24 563c8fd0 ffad2239
	prefetch [%i1+0x1c0],2
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0c5,%g2
p2_b197:
	membar	#Sync			! Added by membar checker (517)
	set	p2_b198,%o7
	fbul,a,pt %fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 1

p2_label_162:
!	Mem[0000000018000044] = b8c9935a, %l5 = fffffffffffff0aa
	ldub	[%i0+0x045],%l5		! %l5 = 00000000000000c9
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0c6,%g2
p2_b198:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000000
!	%l3  = ffffffffffd63fff
!	%l4  = 000000a70000fe01
!	%l5  = 000000000029c000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (518)
!	%l6 = 00000000000000b5, immed = 000006ff, %l7 = 0000000000000000
	orncc	%l6,0x6ff,%l7		! %l7 = fffffffffffff9b5, %ccr = 88
!	Mem[0000000030800068] = 5651c19200000000, %l6 = 00000000000000b5
	ldxa	[%o1+0x068]%asi,%l6	! %l6 = 5651c19200000000
!	Mem[000000001b0001d4] = 27290499, %l1 = 000000a70000fe01
	lduba	[%i6+0x1d4]%asi,%l1	! %l1 = 0000000000000027
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_163:
!	Mem[00000000198000c0] = 98ff2ca0 4ae5bd21 517e0d73 2837258f
	prefetch [%i3+0x0c0],20
p2_b199:
	membar	#Sync			! Added by membar checker (519)
!	Mem[0000000019800008] = 00000000009241ef, %l3 = ffffffffffd63fff
	ldxa	[%i3+%o6]0x80,%l3	! %l3 = 00000000009241ef
!	Mem[0000000018800000] = ffffffff, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000018000064] = 1f81dd76, %l3 = 00000000009241ef
	swap	[%i0+0x064],%l3		! %l3 = 000000001f81dd76
!	Mem[0000000032000030] = 6c86dce1 b508361d, %l0 = 00000000, %l1 = 00000027
	ldd	[%o4+0x030],%g2		! %l0 = 0000000000000000 0000000000000027

p2_label_164:
!	Mem[0000000018800000] = ffffffff, %l3 = 000000001f81dd76
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l4 = 000000a70000fe01, immed = 0000095e, %y  = 00000000
	smul	%l4,0x95e,%l7		! %l7 = 00000000094b4d5e
!	Mem[0000000018000174] = 001e7202, %l5 = 000000000029c000
	ldswa	[%i0+0x174]%asi,%l5	! %l5 = 00000000001e7202
!	%l1 = 0000000000000027, Mem[0000000030800060] = e958f400
	stha	%l1,[%o1+0x060]%asi	! Mem[0000000030800060] = 0027f400
!	%l7 = 00000000094b4d5e, immed = 0000000e, %l1 = 0000000000000027
	srlx	%l7,0x00e,%l1		! %l1 = 000000000000252d

p2_label_165:
	set	p2_b200,%o7
	fba,a,pt %fcc2,p2_near_2_le	! Branch Taken, %fcc2 = 1
!	%l5 = 00000000001e7202, Mem[0000000019800000] = ffffffff
	stba	%l5,[%i3+%g0]0x80	! Annulled
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0c8,%g2
p2_b200:
!	Registers modified during the branch to p2_near_2
!	%l3  = 00000000feff0100
!	%l4  = 000000000000252d
!	%l5  = 0000000000000000
!	%l7  = fdff03fefe010000
	membar	#Sync			! Added by membar checker (520)
!	Mem[00000000190001a0] = ab4632e8, %l3 = 00000000feff0100
	ldswa	[%i2+0x1a0]%asi,%l3	! %l3 = ffffffffab4632e8
!	Mem[0000000032000020] = b2c3eb7d, %l3 = ffffffffab4632e8
	ldub	[%o4+0x023],%g2		! %g2 = 00000000000000b2
	fbule,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 2

p2_label_166:
!	%l3 = ffffffffab4632e8, Mem[0000000032000041] = 70504b0b
	stb	%l3,[%o4+0x041]		! Annulled
p2_b201:
	bg	p2_not_taken_0		! Branch Not Taken, %ccr = 02
!	%l1 = 000000000000252d, Mem[00000000198001f4] = c08e89a7
	stw	%l1,[%i3+0x1f4]		! Mem[00000000198001f4] = 0000252d
p2_b202:
	membar	#Sync			! Added by membar checker (521)
!	Mem[0000000018000100] = 26a0b445 9e39ca9c 39e37347 eab03088
	prefetcha [%i0+0x100]%asi,21
	set	p2_b203,%o7
	fbl,pn	%fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 1

p2_label_167:
!	Mem[0000000019800078] = 76f37dfa, %l7 = fdff03fefe010000
	ldub	[%i3+0x078],%l7		! %l7 = 0000000000000076
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0cb,%g2
p2_b203:
!	Registers modified during the branch to p2_near_3
!	%l1  = 000000000000044c
!	%l3  = ffffffffab4632e8
!	%l6  = 5651c19200000000
	membar	#Sync			! Added by membar checker (522)
!	%l2 = 000000000000ffff, immed = fffffe87, %l3 = ffffffffab4632e8
	addccc	%l2,-0x179,%l3		! %l3 = 000000000000fe86, %ccr = 11
!	%l6 = 00000000, %l7 = 00000076, Mem[0000000030800060] = 0027f400 b378007b
	std	%l6,[%o1+0x060]	! Mem[0000000030800060] = 00000000 00000076
!	%l5 = 0000000000000000, immed = 00000ee1, %l2 = 000000000000ffff
	tsubcc	%l5,0xee1,%l2		! %l2 = fffffffffffff11f, %ccr = 9b
!	%l7 = 0000000000000076, immed = fffff68a, %l4 = 000000000000252d
	xnorcc	%l7,-0x976,%l4		! %l4 = 0000000000000903, %ccr = 00

p2_label_168:
!	%l7 = 0000000000000076, Mem[0000000019800000] = ffffffff
	stwa	%l7,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000076
	bl	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],4
p2_b204:
	membar	#Sync			! Added by membar checker (523)
!	Branch On Register, %l6 = 5651c19200000000
	brz,pn	%l6,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018000008] = ff47c088 26a0b445, %l6 = 00000000, %l7 = 00000076
	ldda	[%i0+%o6]0x80,%l6	! %l6 = 00000000ff47c088 0000000026a0b445
p2_b205:

p2_label_169:
	set	p2_b206,%o7
	fbl,a	p2_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000003180006c] = 000000a7, %l5 = 0000000000000000
	ldsw	[%o3+0x06c],%l5		! %l5 = 00000000000000a7
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0ce,%g2
p2_b206:
!	Registers modified during the branch to p2_far_1
!	%l1  = 00000000ff47c4d4
!	%l2  = ffffffffffffd1f0
!	%l3  = 0000000000000103
	membar	#Sync			! Added by membar checker (524)
!	%l2 = ffffffffffffd1f0, Mem[0000000019000000] = 00000000
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000019000000] = d1f00000
!	Mem[0000000032000004] = 00000774, %l1 = 00000000ff47c4d4
	ldsw	[%o4+0x004],%g2		! %g2 = 00000000ff47c4d4
!	Branch On Register, %l1 = 00000000ff47c4d4
	brlez,pn %l1,p2_not_taken_0	! Branch Not Taken

p2_label_170:
!	Mem[000000003000002c] = fa610bde, %l4 = 0000000000000903
	ldsb	[%o0+0x02e],%l4		! %l4 = 000000000000000b
p2_b207:
	membar	#Sync			! Added by membar checker (525)
!	%l3 = 0000000000000103, immed = fffffaf6, %l0 = 0000000000000000
	andcc	%l3,-0x50a,%l0		! %l0 = 0000000000000002, %ccr = 00
!	%l7 = 0000000026a0b445, immed = 00000e01, %l0 = 0000000000000002
	orcc	%l7,0xe01,%l0		! %l0 = 0000000026a0be45, %ccr = 00
!	%l0 = 0000000026a0be45, immed = 00000002, %l6 = 00000000ff47c088
	sllx	%l0,0x002,%l6		! %l6 = 000000009a82f914
!	%l1 = 00000000ff47c4d4, immed = fffff03e, %l7 = 0000000026a0b445
	xnorcc	%l1,-0xfc2,%l7		! %l7 = 00000000ff47cb15, %ccr = 08

p2_label_171:
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000018800008] = 0000dfff, %l3 = 0000000000000103
	lduwa	[%i1+%o6]0x80,%l3	! %l3 = 000000000000dfff
p2_b208:
	membar	#Sync			! Added by membar checker (526)
!	%l4 = 000000000000000b, Mem[00000000198000c8] = 517e0d732837258f
	stxa	%l4,[%i3+0x0c8]%asi	! Mem[00000000198000c8] = 000000000000000b
!	%l2 = ffffffffffffd1f0, immed = 00000c09, %l7 = 00000000ff47cb15
	xnorcc	%l2,0xc09,%l7		! %l7 = 0000000000002206, %ccr = 00
!	Mem[0000000032000004] = 00000774, %l1 = 00000000ff47c4d4
	ldsw	[%o4+0x004],%g2		! %g2 = 00000000ff47c4d4

p2_label_172:
!	%l7 = 0000000000002206, %l4 = 000000000000000b, %y  = fdff03fe
	sdivx	%l7,%l4,%l5		! %l5 = 0000000000000317
!	%l3 = 000000000000dfff, Mem[0000000032000062] = d0c7ffff
	stha	%l3,[%o4+0x062]%asi	! Mem[0000000032000060] = dfffffff
!	%l1 = 00000000ff47c4d4, immed = fffffcc6, %y  = fdff03fe
	sdivcc	%l1,-0x33a,%l3		! %l3 = 000000007fffffff, %ccr = 02
	set	p2_b209,%o7
	fba	p2_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000018000008] = ff47c088 26a0b445, %l6 = 9a82f914, %l7 = 00002206
	ldda	[%i0+%o6]0x80,%l6	! %l6 = 00000000ff47c088 0000000026a0b445
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0d1,%g2
p2_b209:
!	Registers modified during the branch to p2_far_1
!	%l1  = 00000001fe8f855c
!	%l2  = ffffffffffffd1f0
!	%l3  = 0000000000000140

p2_label_173:
	membar	#Sync			! Added by membar checker (527)
!	Mem[0000000019800060] = 39be61a7 ada4953a b8cf0ac7 6ddfae43
	prefetch [%i3+0x060],23
!	%f13 = 00000000, %f2  = 00000000
	fabss	%f13,%f2 		! %f2  = 00000000
!	Branch On Register, %l5 = 0000000000000317
	brlez,a,pt %l5,p2_not_taken_0	! Branch Not Taken
!	%l3 = 0000000000000140, Mem[0000000018800008] = 0000dfff00000008
	stxa	%l3,[%i1+%o6]0x80	! Annulled
p2_b210:
	bgu,a	p2_b211			! Branch Taken, %ccr = 00, CWP = 0

p2_label_174:
!	Mem[0000000018000000] = 000000a7, %l1 = 00000001fe8f855c
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0d3,%g2
p2_b211:
	membar	#Sync			! Added by membar checker (528)
!	Mem[000000003100006c] = e6b4db69, %l3 = 0000000000000140
	lduh	[%o2+0x06e],%l3		! %l3 = 000000000000db69
!	%l4 = 000000000000000b, %l1 = 0000000000000000, %l1 = 0000000000000000
	andn	%l4,%l1,%l1		! %l1 = 000000000000000b
!	%f18 = 00000000 00000000, %f29 = 00000000
	fxtos	%f18,%f29		! %f29 = 00000000
!	%f21 = 4f8fd52f, %f0  = 3f800000, %f18 = 00000000 00000000
	fsmuld	%f21,%f0 ,%f18		! %f18 = 41f1faa5 e0000000

p2_label_175:
!	%f9  = 00000000, %f25 = 4f8fd52f, %f5  = 3cbae3fb
	fmuls	%f9 ,%f25,%f5 		! %f5  = 00000000
	ba	p2_b212			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001a000000] = d0000000, %l7 = 0000000026a0b445
	ldsha	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffd000
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0d4,%g2
p2_b212:
	membar	#Sync			! Added by membar checker (529)
!	%l6 = 00000000ff47c088, %l7 = ffffffffffffd000, %l3 = 000000000000db69
	sub	%l6,%l7,%l3		! %l3 = 00000000ff47f088
!	Mem[0000000032000000] = 00000000 00000774 e38ed8b0 fffffbbe
	prefetch [%o4+0x000],3

p2_label_176:
	fbug,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000019800008] = 00000000009241ef, %l4 = 000000000000000b
	ldxa	[%i3+%o6]0x80,%l4	! %l4 = 00000000009241ef
p2_b213:
	membar	#Sync			! Added by membar checker (530)
!	Mem[00000000180000c0] = 4e7e6f9e, %l1 = 000000000000000b
	ldsha	[%i0+0x0c0]%asi,%l1	! %l1 = 0000000000004e7e
!	Mem[000000003000002c] = fa610bde, %l2 = ffffffffffffd1f0
	lduw	[%o0+0x02c],%l2		! %l2 = 00000000fa610bde
	set	p2_b214,%o7
	fble,pn	%fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 1

p2_label_177:
!	Mem[00000000190001a0] = ab4632e8 ceed2160 67caae89 98338ee7
	prefetch [%i2+0x1a0],0
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p2_branch_failed
	mov	0x0d6,%g2
p2_b214:
!	Registers modified during the branch to p2_near_3
!	%l1  = 000000000000252d
!	%l3  = 00000000ff47f088
!	%l6  = 000000ff47c08800
	membar	#Sync			! Added by membar checker (531)
!	%l2 = fa610bde, %l3 = ff47f088, Mem[0000000019800008] = 00000000 009241ef
	stda	%l2,[%i3+%o6]0x80	! Mem[0000000019800008] = fa610bde ff47f088
!	Mem[0000000019800120] = 51d5b2ea 0bd8dafd d7c5e32c 5176dc8e
	prefetcha [%i3+0x120]%asi,2
!	%l0 = 0000000026a0be45, %l7 = ffffffffffffd000, %l7 = ffffffffffffd000
	sub	%l0,%l7,%l7		! %l7 = 0000000026a0ee45
	set	p2_b215,%o7
	fbul,pt	%fcc2,p2_near_2_le	! Branch Taken, %fcc2 = 1

p2_label_178:
!	Mem[0000000018800008] = 0000dfff, %l2 = 00000000fa610bde
	swapa	[%i1+%o6]0x80,%l2	! %l2 = 000000000000dfff
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0d7,%g2
p2_b215:
!	Registers modified during the branch to p2_near_2
!	%l3  = 00000000df1f0100
!	%l4  = 000000000000252d
!	%l5  = 0000000000000000
!	%l7  = c277077f3e010000
	membar	#Sync			! Added by membar checker (532)
!	%f13 = 00000000, %f6  = 42ed801f, %f23 = 80000000
	fdivs	%f13,%f6 ,%f23		! %f23 = 00000000
	bge,a	p2_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],20	! Annulled
p2_b216:
	bl,a	p2_b217			! Branch Taken, %ccr = 02, CWP = 0

p2_label_179:
!	%l6 = 000000ff47c08800, Mem[0000000019000008] = 00000000
	stba	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = 00000000
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0d9,%g2
p2_b217:
	bvc,a	p2_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000032000060] = 795adfff ffffffdc 00000000 a3c0648f
	prefetch [%o4+0x060],16	! Annulled
p2_b218:
	membar	#Sync			! Added by membar checker (533)
!	%l0 = 0000000026a0be45, Mem[0000000030000068] = 00000000
	stw	%l0,[%o0+0x068]		! Mem[0000000030000068] = 26a0be45
	set	p2_b219,%o7
	fbul,a,pt %fcc1,p2_near_1_le	! Branch Taken, %fcc1 = 1

p2_label_180:
!	Mem[0000000030800068] = 5651c192, %l7 = c277077f3e010000
	lduh	[%o1+0x068],%l7		! %l7 = 0000000000005651
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p2_branch_failed
	mov	0x0db,%g2
p2_b219:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000002
!	%l3  = ffffffffffffffff
!	%l4  = 0000000000000000
!	%l5  = 0000000000000000
!	%l7  = ffffffff80000000
	membar	#Sync			! Added by membar checker (534)
	fbue,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000018000008] = ff47c088, %l3 = ffffffffffffffff
	lduha	[%i0+%o6]0x80,%l3	! %l3 = 000000000000ff47
p2_b220:
	membar	#Sync			! Added by membar checker (535)
!	Mem[0000000030800064] = 00000076, %l3 = 000000000000ff47
	swapa	[%o1+0x064]%asi,%l3	! %l3 = 0000000000000076
	bne,a	p2_b221			! Branch Taken, %ccr = 8a, CWP = 0

p2_label_181:
!	Mem[000000001b000008] = 000bf2e5, %l0 = 0000000000000002
	ldswa	[%i6+%o6]0x80,%l0	! %l0 = 00000000000bf2e5
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0dd,%g2
p2_b221:
	membar	#Sync			! Added by membar checker (536)
!	%f2  = 00000000 00000000, %f5  = 00000000
	fdtos	%f2 ,%f5 		! %f5  = 00000000
	fbe,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	 Annulled
	ldd	[%o3+0x068],%l2
p2_b222:
	membar	#Sync			! Added by membar checker (537)
	fbu,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 2

p2_label_182:
!	Mem[0000000032000000] = 00000000 00000774 e38ed8b0 fffffbbe
	prefetch [%o4+0x000],1
p2_b223:
	membar	#Sync			! Added by membar checker (538)
!	Mem[0000000019800000] = 00000076, %l6 = 000000ff47c08800
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, immed = fffff1d9, %l7 = ffffffff80000000
	tsubcc	%l5,-0xe27,%l7		! %l7 = 0000000000000e27, %ccr = 13
!	%l7 = 0000000000000e27, immed = 0000002e, %l5 = 0000000000000000
	srlx	%l7,0x02e,%l5		! %l5 = 0000000000000000
!	Branch On Register, %l3 = 0000000000000076
	brgz,pt	%l3,p2_b224		! Branch Taken

p2_label_183:
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000019800000] = 00000076 a3c0648f
	stda	%l4,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000000 00000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0e0,%g2
p2_b224:
	membar	#Sync			! Added by membar checker (539)
!	%l3 = 0000000000000076, %l3 = 0000000000000076, %l5 = 0000000000000000
	and	%l3,%l3,%l5		! %l5 = 0000000000000076
	fbge,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[00000000190001e0] = 497fca81 fb7c38fe 0e116db1 79930c5d
	prefetch [%i2+0x1e0],22	! Annulled
p2_b225:
	membar	#Sync			! Added by membar checker (540)
!	%l6 = 0000000000000000, %l0 = 00000000000bf2e5, %l2 = 000000000000dfff
	addc	%l6,%l0,%l2		! %l2 = 00000000000bf2e6

p2_label_184:
!	Mem[00000000188001b4] = 5c1cbf2a, %l7 = 0000000000000e27
	ldsha	[%i1+0x1b6]%asi,%l7	! %l7 = ffffffffffffbf2a
	set	p2_b226,%o7
	fbg,a,pn %fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 2
!	%l2 = 00000000000bf2e6, Mem[0000000030800021] = 0000c088
	stb	%l2,[%o1+0x021]		! Mem[0000000030800020] = 00e6c088
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0e2,%g2
p2_b226:
!	Registers modified during the branch to p2_near_0
!	%l0  = ffffffff80000000
!	%l1  = 00000000a3c0648f
!	%l3  = 00000000000040f6
!	%l4  = 0000000000000074
!	%l6  = 00000000000bb210
	membar	#Sync			! Added by membar checker (541)
!	Mem[0000000032000060] = 795adfff ffffffdc 00000000 a3c0648f
	prefetch [%o4+0x060],1
!	Mem[000000003200003c] = 7aa19270, %l3 = 00000000000040f6
	ldsba	[%o4+0x03e]%asi,%g2	! %g2 = 000000000000007a

p2_label_185:
!	Mem[0000000018800014] = 6c760347, %l3 = 00000000000040f6
	ldsba	[%i1+0x015]%asi,%l3	! %l3 = 0000000000000076
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000019000008] = 00000000, %l7 = ffffffffffffbf2a
	ldstuba	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000000
!	Registers modified during the branch to p2_jmpl_3
!	%l1  = 0000000000000000
!	%l2  = 00000000000000ec
!	%l7  = ffffffff5c3f9bfc
!	Branch On Register, %l7 = ffffffff5c3f9bfc
	brnz,a,pn %l7,p2_b227		! Branch Taken
!	%l0 = 80000000, %l1 = 00000000, Mem[0000000018800000] = ffffffff 43049d9a
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000018800000] = 80000000 00000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0e3,%g2
p2_b227:

p2_label_186:
	membar	#Sync			! Added by membar checker (542)
!	Mem[00000000188001e0] = e955dd99 dc6e2a65 33f53a01 706921fe
	prefetch [%i1+0x1e0],2
	be,a	p2_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000019800000] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l1	! Annulled
p2_b228:
	membar	#Sync			! Added by membar checker (543)
!	Mem[0000000019000008] = ff000000, %l2 = 00000000000000ec
	ldsha	[%i2+%o6]0x80,%l2	! %l2 = ffffffffffffff00
!	%l6 = 00000000000bb210, Mem[0000000018000148] = 0fa2d0673191f607
	stxa	%l6,[%i0+0x148]%asi	! Mem[0000000018000148] = 00000000000bb210

p2_label_187:
!	%l5 = 0000000000000076, Mem[0000000030800028] = a1ff8b0c
	stb	%l5,[%o1+0x028]		! Mem[0000000030800028] = 76ff8b0c
!	%l7 = ffffffff5c3f9bfc, immed = 00000a4c, %l0 = ffffffff80000000
	addcc	%l7,0xa4c,%l0		! %l0 = ffffffff5c3fa648, %ccr = 80
	set	p2_b229,%o7
	fbge,a,pt %fcc3,p2_near_2_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000019800008] = fa610bde ff47f088, %l4 = 00000074, %l5 = 00000076
	ldda	[%i3+%o6]0x80,%l4	! %l4 = 00000000fa610bde 00000000ff47f088
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0e5,%g2
p2_b229:
!	Registers modified during the branch to p2_near_2
!	%l4  = 0000000000000000
!	%l5  = 000000005358dc3e
	membar	#Sync			! Added by membar checker (544)
!	Mem[0000000018800180] = b004f452 e159f929 24161392 777c2a05
	prefetch [%i1+0x180],23

p2_label_188:
	set	p2_b230,%o7
	fbule,pn %fcc2,p2_near_3_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000018800000] = 80000000, %l4 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000080
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0e6,%g2
p2_b230:
!	Registers modified during the branch to p2_near_3
!	%l3  = 00000000a3c05a38
!	%l5  = 00000000000e79aa
!	%l7  = 0000047760e1c7e8
	membar	#Sync			! Added by membar checker (545)
!	%l0 = ffffffff5c3fa648, Mem[0000000019800166] = c3ab8282
	stha	%l0,[%i3+0x166]%asi	! Mem[0000000019800164] = c3aba648
!	%f18 = 41f1faa5 e0000000, %f22 = 00000000 00000000
	fdtox	%f18,%f22		! %f22 = 00000001 1faa5e00
	fbe,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1

p2_label_189:
!	Mem[00000000188001bc] = 65978eec, %l3 = 00000000a3c05a38
	ldsh	[%i1+0x1bc],%l3		! Annulled
p2_b231:
	membar	#Sync			! Added by membar checker (546)
!	Mem[00000000188000a0] = 2f39939d 99b5b6d3 88995e77 0c27285c
	prefetch [%i1+0x0a0],3
	bvc,a	p2_b232			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000018000000] = 000000a7, %l0 = ffffffff5c3fa648
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0e8,%g2
p2_b232:
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 00

p2_label_190:
!	%l2 = ffffffffffffff00, Mem[000000003000002e] = fa610bde
	sth	%l2,[%o0+0x02e]		! Mem[000000003000002c] = fa61ff00
p2_b233:
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018000000] = 000000a7, %l1 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000a7
p2_b234:
	membar	#Sync			! Added by membar checker (547)
!	Branch On Register, %l4 = 0000000000000080
	brlez,a,pt %l4,p2_not_taken_0	! Branch Not Taken
!	Mem[00000000198001b4] = ae2cf0a7, %l1 = 00000000000000a7
	ldsb	[%i3+0x1b6],%l1		! Annulled
p2_b235:

p2_label_191:
	membar	#Sync			! Added by membar checker (548)
!	Branch On Register, %l6 = 00000000000bb210
	brz,pt	%l6,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000030800068] = 5651c19200000000, %l5 = 00000000000e79aa
	ldx	[%o1+0x068],%l5		! %l5 = 5651c19200000000
p2_b236:
	bcc,a	p2_b237			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000018000000] = 000000a7 0000fe01 ff47c088 26a0b445
	prefetch [%i0+0x000],4
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p2_branch_failed
	mov	0x0ed,%g2
p2_b237:
	membar	#Sync			! Added by membar checker (549)
!	%l5 = 5651c19200000000, %l7 = 0000047760e1c7e8, %y  = 00000477
	sdivcc	%l5,%l7,%l7		! %l7 = 0000000000000bcc, %ccr = 00

p2_label_192:
!	Denormal Floating Point Operation Nullified
	nop
!	%f0  = 3f800000 233c916a, %f6  = 42ed801f 4f8fd52f
	fcmped	%fcc3,%f0 ,%f6 		! %fcc3 = 1
!	Mem[000000003200007c] = eb33bb7e, %l0 = 0000000000000000
	lduw	[%o4+0x07c],%g2		! %g2 = 0000000000000000
!	%l2 = ffffffffffffff00, immed = 000002e1, %y  = 00000477
	sdivx	%l2,0x2e1,%l1		! %l1 = 0000000000000000
!	Mem[0000000030800068] = 5651c192, %l0 = 0000000000000000
	lduha	[%o1+0x06a]%asi,%l0	! %l0 = 000000000000c192

p2_label_193:
!	%l5 = 5651c19200000000, %l7 = 0000000000000bcc, %y  = 00000477
	smulcc	%l5,%l7,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Mem[00000000180001a4] = c1fe705c, %l3 = a3c05a38, %l2 = ffffff00
	add	%i0,0x1a4,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 00000000c1fe705c
!	Mem[0000000019000000] = d1f00000, %l4 = 0000000000000080
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000d1f00000
	bneg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000188001a0] = ab0143d2 08d1de42 88b4e3ee 45149ef6
	prefetch [%i1+0x1a0],21	! Annulled
p2_b238:

p2_label_194:
	membar	#Sync			! Added by membar checker (550)
!	%f28 = 42ed801f, %f20 = 07000000 4f8fd52f
	fstod	%f28,%f20		! %f20 = 405db003 e0000000
!	%f15 = 40000000, %f0  = 3f800000
	fstoi	%f15,%f0 		! %f0  = 00000002
!	%l3 = 00000000a3c05a38, Mem[0000000031000060] = 00000000
	stw	%l3,[%o2+0x060]		! Mem[0000000031000060] = a3c05a38
!	%l4 = d1f00000, %l5 = 00000000, Mem[0000000019000000] = d1f00000 00000042
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = d1f00000 00000000
!	%l3 = 00000000a3c05a38, immed = fffff800, %l0 = 000000000000c192
	andn	%l3,-0x800,%l0		! %l0 = 0000000000000238

p2_label_195:
!	%f8  = 00000002 00000000, %f12 = fc356cdd 00000000
	fmovd	%f8 ,%f12		! %f12 = 00000002 00000000
!	%l7 = 0000000000000bcc, %l0 = 0000000000000238, %y  = 00000000
	udiv	%l7,%l0,%l6		! %l6 = 0000000000000005
!	%f15 = 40000000, %f15 = 40000000
	fstoi	%f15,%f15		! %f15 = 00000002
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l1 = 0000000000000000, Mem[0000000018800000] = ff00000000000000
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000018800000] = 0000000000000000
p2_b239:

p2_label_196:
	membar	#Sync			! Added by membar checker (551)
	fbg,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[00000000190000dc] = 71078a2e, %l4 = 00000000d1f00000
	ldub	[%i2+0x0de],%l4		! Annulled
p2_b240:
	membar	#Sync			! Added by membar checker (552)
!	Mem[0000000019000008] = ff000000, %l3 = 00000000a3c05a38
	swapa	[%i2+%o6]0x80,%l3	! %l3 = 00000000ff000000
!	%f18 = 41f1faa5 e0000000, %f6  = 42ed801f 4f8fd52f
	fcmpd	%fcc2,%f18,%f6 		! %fcc2 = 1
!	Mem[000000003100006c] = e6b4db69, %l0 = 0000000000000238
	ldsb	[%o2+0x06d],%l0		! %l0 = ffffffffffffffb4

p2_label_197:
!	Mem[0000000018000000] = 000000a70000fe01, %l5 = 5651c19200000000
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 000000a70000fe01
!	%l3 = 00000000ff000000, %l2 = 00000000c1fe705c, %l2 = 00000000c1fe705c
	srl	%l3,%l2,%l2		! %l2 = 000000000000000f
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000030000028] = fe01b485, %l4 = 00000000d1f00000
	ldstub	[%o0+0x028],%l4		! %l4 = 00000000000000fe
p2_b241:
	membar	#Sync			! Added by membar checker (553)
!	Mem[0000000019000008] = a3c05a38, %l5 = 000000a70000fe01
	ldsba	[%i2+%o6]0x80,%l5	! %l5 = ffffffffffffffa3

p2_label_198:
!	%l2 = 000000000000000f, Mem[0000000030800028] = 76ff8b0c
	stw	%l2,[%o1+0x028]		! Mem[0000000030800028] = 0000000f
!	%l7 = 0000000000000bcc, Mem[0000000019800000] = 00000000
	stwa	%l7,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000bcc
	set	p2_b242,%o7
	fble	p2_far_2_le	! Branch Taken, %fcc0 = 1
!	%l7 = 0000000000000bcc, Mem[0000000019800000] = 00000bcc
	stwa	%l7,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000bcc
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p2_branch_failed
	mov	0x0f2,%g2
p2_b242:
!	Registers modified during the branch to p2_far_2
!	%l2  = fe00000000000000
	membar	#Sync			! Added by membar checker (554)
!	%l0 = ffffffffffffffb4, immed = 00000571, %l3 = 00000000ff000000
	addcc	%l0,0x571,%l3		! %l3 = 0000000000000525, %ccr = 11

p2_label_199:
!	%l1 = 0000000000000000, Mem[00000000180001b2] = 2a1d9d4e
	sth	%l1,[%i0+0x1b2]		! Mem[00000000180001b0] = 2a1d0000
!	Mem[0000000030000020] = 7c6b3ec3ff0000a3, %l1 = 0000000000000000
	ldx	[%o0+0x020],%l1		! %l1 = 7c6b3ec3ff0000a3
!	%f31 = 00000000, %f5  = 00000000, %f19 = e0000000
	fadds	%f31,%f5 ,%f19		! %f19 = 00000000
!	Branch On Register, %l5 = ffffffffffffffa3
	brgz,pt	%l5,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018000020] = e961d5fa 594e4aa4, %l2 = 00000000, %l3 = 00000525
	ldd	[%i0+0x020],%l2		! %l2 = 00000000e961d5fa 00000000594e4aa4
p2_b243:

p2_label_200:
!	call to call_1, CWP = 0
	call	p2_call_1_he
!	Mem[0000000018000080] = da80d370 849a2c27 533e58c1 7d7e0057
	prefetch [%i0+0x080],4
!	Registers modified during the branch to p2_call_1
!	%l0  = 0000000000000b6f
!	%l1  = 00000000000000ff
!	%l5  = ffffffe98f124e0c
	membar	#Sync			! Added by membar checker (555)
!	Mem[0000000031000068] = a3c0648f, %l7 = 0000000000000bcc
	ldsw	[%o2+0x068],%l7		! %l7 = ffffffffa3c0648f
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[00000000180000e0] = 7765fd20 fa5ef2ff f49bf546 3f3b81cc
	prefetcha [%i0+0x0e0]%asi,23

	membar	#Sync			! Force all stores to complete

!	End of Random Code for Processor 2

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x008]		! Set processor 2 done flag

!	Check Registers

p2_check_registers:
	set	p2_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000b6f
	bne,a,pn %xcc,p2_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne,a,pn %xcc,p2_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000e961d5fa
	bne,a,pn %xcc,p2_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000594e4aa4
	bne,a,pn %xcc,p2_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000fe
	bne,a,pn %xcc,p2_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffe98f124e0c
	bne,a,pn %xcc,p2_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000005
	bne,a,pn %xcc,p2_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffa3c0648f
	bne,a,pn %xcc,p2_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xffffffe9,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p2_failed
	mov	0x111,%g1

!	Check Floating Point Registers

p2_check_fp_registers:
	set	p2_temp,%g1
	set	p2_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 00000002 233c916a
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000002 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 42ed801f 4f8fd52f
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000002 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000002 40000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000002 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000002 00000002
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be c2ed801f 4f8fd52f
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 41f1faa5 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 405db003 e0000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000001 1faa5e00
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 87000000 4f8fd52f
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 0000ec00 f8000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 42ed801f 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p2_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 000000a70000fe01
	ldx	[%i0+0x000],%g3		! Observed data at 0000000018000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff47c08826a0b445
	ldx	[%i0+0x008],%g3		! Observed data at 0000000018000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 0000000026a0b445
	ldx	[%i0+0x010],%g3		! Observed data at 0000000018000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 5db98e85009241ef
	ldx	[%i0+0x060],%g3		! Observed data at 0000000018000060
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 533e58c17d7e0057
	ldx	[%i0+0x088],%g3		! Observed data at 0000000018000088
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 553fc0f6ffffffff
	ldx	[%i0+0x0d8],%g3		! Observed data at 00000000180000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x148],%g2		! Expect data = 00000000000bb210
	ldx	[%i0+0x148],%g3		! Observed data at 0000000018000148
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x150],%g2		! Expect data = 56384721578c8bff
	ldx	[%i0+0x150],%g3		! Observed data at 0000000018000150
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 2a1d0000e2349632
	ldx	[%i0+0x1b0],%g3		! Observed data at 00000000180001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1c0],%g2		! Expect data = 65d07cdea7f45aff
	ldx	[%i0+0x1c0],%g3		! Observed data at 00000000180001c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1c0,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = b12f5000a84c2225
	ldx	[%i0+0x1f0],%g3		! Observed data at 00000000180001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f0,%g4

	set	p2_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000000000000
	ldx	[%i1+0x000],%g3		! Observed data at 0000000018800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fa610bde00000008
	ldx	[%i1+0x008],%g3		! Observed data at 0000000018800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x068],%g2		! Expect data = e38ecffc2495dbce
	ldx	[%i1+0x068],%g3		! Observed data at 0000000018800068
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x138],%g2		! Expect data = 68fb2b6c00000000
	ldx	[%i1+0x138],%g3		! Observed data at 0000000018800138
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x148],%g2		! Expect data = 921aae7e51180091
	ldx	[%i1+0x148],%g3		! Observed data at 0000000018800148
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x1c8],%g2		! Expect data = 563c8fd0ffad2239
	ldx	[%i1+0x1c8],%g3		! Observed data at 00000000188001c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1c8,%g4

	set	p2_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = d1f0000000000000
	ldx	[%i2+0x000],%g3		! Observed data at 0000000019000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = a3c05a3800008b0c
	ldx	[%i2+0x008],%g3		! Observed data at 0000000019000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 5358700004418bbe
	ldx	[%i2+0x058],%g3		! Observed data at 0000000019000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 55b5e00c00000000
	ldx	[%i2+0x088],%g3		! Observed data at 0000000019000088
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = ffa17f524d1317a1
	ldx	[%i2+0x0c8],%g3		! Observed data at 00000000190000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x160],%g2		! Expect data = 4833913c6bff77fb
	ldx	[%i2+0x160],%g3		! Observed data at 0000000019000160
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 36d936cfffffff89
	ldx	[%i2+0x1b0],%g3		! Observed data at 00000000190001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = ebccf97734ca7bd5
	ldx	[%i2+0x1b8],%g3		! Observed data at 00000000190001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b8,%g4

	set	p2_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000bcc00000000
	ldx	[%i3+0x000],%g3		! Observed data at 0000000019800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fa610bdeff47f088
	ldx	[%i3+0x008],%g3		! Observed data at 0000000019800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x038],%g2		! Expect data = ffffffffffffffff
	ldx	[%i3+0x038],%g3		! Observed data at 0000000019800038
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 000000000000000b
	ldx	[%i3+0x0c8],%g3		! Observed data at 00000000198000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x110],%g2		! Expect data = 00004e7e6816d206
	ldx	[%i3+0x110],%g3		! Observed data at 0000000019800110
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x130],%g2		! Expect data = 000000008fcb6d84
	ldx	[%i3+0x130],%g3		! Observed data at 0000000019800130
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x160],%g2		! Expect data = bfeb90f2c3aba648
	ldx	[%i3+0x160],%g3		! Observed data at 0000000019800160
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x180],%g2		! Expect data = bd1c7605e1e9ba28
	ldx	[%i3+0x180],%g3		! Observed data at 0000000019800180
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 42c3dc2ed0b608f3
	ldx	[%i3+0x198],%g3		! Observed data at 0000000019800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 12b7bfaf0000252d
	ldx	[%i3+0x1f0],%g3		! Observed data at 00000000198001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f0,%g4

	set	p2_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = d000000000000000
	ldx	[%i4+0x000],%g3		! Observed data at 000000001a000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000000000
	ldx	[%i4+0x008],%g3		! Observed data at 000000001a000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4

	set	p2_local5_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 1c34ba0b52f3f179
	ldx	[%i5+0x008],%g3		! Observed data at 000000001a800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4

	set	p2_local6_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 000bf2e5d3d49a12
	ldx	[%i6+0x008],%g3		! Observed data at 000000001b000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p2_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p2_memcheck_share0:
	ldx	[%g4+0x20],%g2	! Expected value = 7c6b3ec3ff0000a3
	ldx	[%o0+0x20],%g3	! Read value at Mem[0000000030000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = ff01b485fa61ff00
	ldx	[%o0+0x28],%g3	! Read value at Mem[0000000030000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 00000000fb007000
	ldx	[%o0+0x60],%g3	! Read value at Mem[0000000030000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 26a0be455358dc3e
	ldx	[%o0+0x68],%g3	! Read value at Mem[0000000030000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p2_memcheck_share1:
	ldx	[%g4+0x20],%g2	! Expected value = 00e6c08826a0b445
	ldx	[%o1+0x20],%g3	! Read value at Mem[0000000030800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 0000000f5358dc3e
	ldx	[%o1+0x28],%g3	! Read value at Mem[0000000030800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 000000000000ff47
	ldx	[%o1+0x60],%g3	! Read value at Mem[0000000030800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 5651c19200000000
	ldx	[%o1+0x68],%g3	! Read value at Mem[0000000030800068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p2_memcheck_share2:
	ldx	[%g4+0x20],%g2	! Expected value = 00000001ffffbfa1
	ldx	[%o2+0x20],%g3	! Read value at Mem[0000000031000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 5358dc0a00000000
	ldx	[%o2+0x28],%g3	! Read value at Mem[0000000031000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = a3c05a38fbbe7000
	ldx	[%o2+0x60],%g3	! Read value at Mem[0000000031000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = a3c0648fe6b4db69
	ldx	[%o2+0x68],%g3	! Read value at Mem[0000000031000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p2_memcheck_share3:
	ldx	[%g4+0x20],%g2	! Expected value = ffffffffa3c0648f
	ldx	[%o3+0x20],%g3	! Read value at Mem[0000000031800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 00000000000000c1
	ldx	[%o3+0x28],%g3	! Read value at Mem[0000000031800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 000000ff108c7023
	ldx	[%o3+0x60],%g3	! Read value at Mem[0000000031800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 00760000000000a7
	ldx	[%o3+0x68],%g3	! Read value at Mem[0000000031800068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

!	The test for processor 2 has passed

p2_passed:
	ta	GOOD_TRAP
	nop

p2_reg_l0_fail:
	or	%g0,0xbd0,%g1
	ba,a	p2_failed
p2_reg_l1_fail:
	or	%g0,0xbd1,%g1
	ba,a	p2_failed
p2_reg_l2_fail:
	or	%g0,0xbd2,%g1
	ba,a	p2_failed
p2_reg_l3_fail:
	or	%g0,0xbd3,%g1
	ba,a	p2_failed
p2_reg_l4_fail:
	or	%g0,0xbd4,%g1
	ba,a	p2_failed
p2_reg_l5_fail:
	or	%g0,0xbd5,%g1
	ba,a	p2_failed
p2_reg_l6_fail:
	or	%g0,0xbd6,%g1
	ba,a	p2_failed
p2_reg_l7_fail:
	or	%g0,0xbd7,%g1
	ba,a	p2_failed
p2_freg_fail:
	mov	%l0,%g3
	ba	p2_failed
	mov	%l1,%g2


!	The test for processor 2 failed

p2_failed:
	set	done_flags,%g1
	mov	3,%g5
	st	%g5,[%g1+0x008]		! Set processor 2 done flag

	set	p2_temp,%g6
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop


!	The local area data for processor 2 failed

p2_local_failed:
	set	done_flags,%g5
	mov	3,%g6
	st	%g5,[%g5+0x008]		! Set processor 2 done flag

	set	p2_temp,%g6
	add	%g1,%g4,%g1
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop

p2_dfill_failed:
	ba	p2_failed
	mov	0xddd,%g1

p2_selfmod_failed:
	ba	p2_failed
	mov	0xabc,%g1


p2_common_error:
	or	%g0,0xee2,%g1
	ba	p2_failed
	mov	%o5,%g3
p2_branch_failed:
	mov	0xbbb,%g1
	rd	%ccr,%g2
	ba	p2_failed
	mov	0x0,%g3

p2_trap1e:
	prefetch [%i3+0x060],4
	stb	%l2,[%i1+0x190]		! Mem[0000000018800190]
	andncc	%l0,%l7,%l1
	done

p2_trap1o:
	prefetch [%o3+0x060],4
	stb	%l2,[%o1+0x190]		! Mem[0000000018800190]
	andncc	%l0,%l7,%l1
	done


p2_trap2e:
	sdiv	%l5,-0x8aa,%l3
	udiv	%l4,0x5e3,%l3
	ldx	[%i2+0x0b0],%l5		! Mem[00000000190000b0]
	andcc	%l1,-0x9d0,%l4
	done

p2_trap2o:
	sdiv	%l5,-0x8aa,%l3
	udiv	%l4,0x5e3,%l3
	ldx	[%o2+0x0b0],%l5		! Mem[00000000190000b0]
	andcc	%l1,-0x9d0,%l4
	done


p2_dispatch_failed:
	set	p2_temp,%g7
	set	0xbad2ccdd,%g1
	st	%g1,[%g7]
	ta	BAD_TRAP
	nop

p2_xintr_cnt_failed:
	set	p2_temp,%g7
	set	0xbad2ccee,%g1
	st	%g1,[%g7]
	st	%g2,[%g7+4]		! Expected count
	st	%g3,[%g7+8]		! Observed count
	ta	BAD_TRAP
	nop

p2_init_memory_pointers:
	set	p2_init_registers,%g1
	mov	%g0,%g4
	mov	%g0,%g5
	mov	%g0,%g6
	mov	%g0,%g7

!	Initialize memory pointers for window 0
	set	p2_local0_start,%i0
	set	p2_local1_start,%i1
	set	p2_local2_start,%i2
	set	p2_local3_start,%i3
	set	p2_local4_start,%i4
	set	p2_local5_start,%i5
	set	p2_local6_start,%i6
	mov	%g0,%i7
!	Init Local Registers in Window 0
	ldx	[%g1+0x000],%l0	! %l0 = 27c34aff8da59d73
	ldx	[%g1+0x008],%l1	! %l1 = 2c0ff90063dec6af
	ldx	[%g1+0x010],%l2	! %l2 = 5278c4001c007e2e
	ldx	[%g1+0x018],%l3	! %l3 = 8be919ffab2a5609
	ldx	[%g1+0x020],%l4	! %l4 = c86050ff8df029da
	ldx	[%g1+0x028],%l5	! %l5 = 9ac250ff8097bb55
	ldx	[%g1+0x030],%l6	! %l6 = 881c45ffc725d5ca
	ldx	[%g1+0x038],%l7	! %l7 = 510419005792e512

!	Initialize the output register of window 0
	set	share0_start,%o0
	set	share1_start,%o1
	set	share2_start,%o2
	set	share3_start,%o3
	set	unres0_start,%o4
	set	common_start,%o5
	mov	0x08,%o6

	retl
	nop

!	Random code for Processor 3

processor_6:
	ta	T_CHANGE_PRIV
	set	done_flags,%g1
	mov	1,%g2
	st	%g2,[%g1+0x0c]		! Set the start flag
	wrpr	%g0,7,%cleanwin
	call	p3_init_memory_pointers
	wr	%g0,0x80,%asi

!	Initialize the floating point registers for processor 3

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p3_init_freg,%g1
	ldd	[%g1+0x00],%f0		! %f0  = 16ae9d05, %f1  = b6711ef8
	ldd	[%g1+0x08],%f2		! %f2  = 9462d5ee, %f3  = 0636ead3
	ldd	[%g1+0x10],%f4		! %f4  = 58581058, %f5  = 6f0c8b6f
	ldd	[%g1+0x18],%f6		! %f6  = c56df209, %f7  = 2bf6f9b9
	ldd	[%g1+0x20],%f8		! %f8  = 6711fa86, %f9  = 0aaad28a
	ldd	[%g1+0x28],%f10		! %f10 = 82f786c3, %f11 = e377b60c
	ldd	[%g1+0x30],%f12		! %f12 = 0a2a4ae6, %f13 = 06d5c9b4
	ldd	[%g1+0x38],%f14		! %f14 = d41eff0e, %f15 = b11fedf3
	ldd	[%g1+0x40],%f16		! %f16 = 6ff6b4fd, %f17 = 7fedf85b
	ldd	[%g1+0x48],%f18		! %f18 = 3701a948, %f19 = 2415470d
	ldd	[%g1+0x50],%f20		! %f20 = 2152303b, %f21 = ca2ba770
	ldd	[%g1+0x58],%f22		! %f22 = 83a0e4d0, %f23 = 821b518d
	ldd	[%g1+0x60],%f24		! %f24 = 35a7b26a, %f25 = 3edd5aa9
	ldd	[%g1+0x68],%f26		! %f26 = abdce394, %f27 = f3857129
	ldd	[%g1+0x70],%f28		! %f28 = 5b8db54b, %f29 = 60a837c7
	ldd	[%g1+0x78],%f30		! %f30 = 1e65dadd, %f31 = a37e864d
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 3

p3_label_1:
!	%f9  = 0aaad28a, %f12 = 0a2a4ae6 06d5c9b4
	fitod	%f9 ,%f12		! %f12 = 41a555a5 14000000
	bneg,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetch [%o4+0x000],21	! Annulled
p3_b1:
	membar	#Sync			! Added by membar checker (556)
!	%l7 = e668f1ffc8617870, immed = 00000054, %l2 = 8709b8ffc8954bbf
	orncc	%l7,0x054,%l2		! %l2 = fffffffffffffffb, %ccr = 88
	fbug	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_2:
!	Mem[000000001c800008] = 7a0d96126eee22b9, %l7 = e668f1ffc8617870
	ldxa	[%i1+%o6]0x80,%l7	! %l7 = 7a0d96126eee22b9
p3_b2:
	membar	#Sync			! Added by membar checker (557)
!	%l5 = 08730d001bdcbf30, %l6 = b8dd29001599b1c1, %l1 = 6c13680047951c44
	or	%l5,%l6,%l1		! %l1 = b8ff2d001fddbff1
!	%l1 = b8ff2d001fddbff1, %l3 = b2160cffc7a116d2, %l2 = fffffffffffffffb
	orcc	%l1,%l3,%l2		! %l2 = baff2dffdffdbff3, %ccr = 88
!	%l0 = 1c6e58005a6dce29, %l7 = 7a0d96126eee22b9, %y  = 00000000
	udivx	%l0,%l7,%l0		! %l0 = 0000000000000000
!	Mem[000000003200007c] = 33bb7e00, %l6 = b8dd29001599b1c1
	ldsba	[%o4+0x07d]%asi,%g2	! %g2 = 0000000000000033

p3_label_3:
!	Mem[000000001d0001e8] = d544d655 5d3579fd, %l0 = 00000000, %l1 = 1fddbff1
	ldda	[%i2+0x1e8]%asi,%l0	! %l0 = 00000000d544d655 000000005d3579fd
!	Mem[000000001c000180] = 1f8bdf46 cdf61318 4ec67f43 fc312090
	prefetch [%i0+0x180],20
!	Branch On Register, %l1 = 000000005d3579fd
	brnz,pt	%l1,p3_b3		! Branch Taken
!	%l4 = 9ac8ce0021ca2f2f, Mem[000000001d000034] = 97732f20
	sth	%l4,[%i2+0x034]		! Mem[000000001d000034] = 2f2f2f20
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x003,%g2
p3_b3:
	membar	#Sync			! Added by membar checker (558)
!	Mem[000000001f000110] = 575a29b8f0db4292, %l5 = 08730d001bdcbf30
	ldx	[%i6+0x110],%l5		! %l5 = 575a29b8f0db4292

p3_label_4:
!	%l5 = 575a29b8f0db4292, Mem[0000000032000030] = 6c86dce1b508361d
	stxa	%l5,[%o4+0x030]%asi	! Mem[0000000032000030] = 575a29b8f0db4292
!	%f28 = 5b8db54b 60a837c7, %f28 = 5b8db54b 60a837c7, %f6  = c56df209 2bf6f9b9
	faddd	%f28,%f28,%f6 		! %f6  = 5b9db54b 60a837c7
!	%l1 = 000000005d3579fd, %l3 = b2160cffc7a116d2, %l0 = 00000000d544d655
	xor	%l1,%l3,%l0		! %l0 = b2160cff9a946f2f
!	%l5 = 575a29b8f0db4292, %l4 = 9ac8ce0021ca2f2f, %l4 = 9ac8ce0021ca2f2f
	srl	%l5,%l4,%l4		! %l4 = 000000000001e1b6
!	%f7  = 60a837c7, %f14 = d41eff0e, %f14 = d41eff0e b11fedf3
	fsmuld	%f7 ,%f14,%f14		! %f14 = c6aa1e81 65117880

p3_label_5:
!	%f26 = abdce394 f3857129, %f26 = abdce394 f3857129, %f16 = 6ff6b4fd 7fedf85b
	faddd	%f26,%f26,%f16		! %f16 = abece394 f3857129
	fbg,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000001d800008] = cd01c419, %l5 = 575a29b8f0db4292
	ldsha	[%i3+%o6]0x80,%l5	! Annulled
p3_b4:
	membar	#Sync			! Added by membar checker (559)
!	%f14 = c6aa1e81 65117880, %f14 = c6aa1e81 65117880, %f22 = 83a0e4d0 821b518d
	faddd	%f14,%f14,%f22		! %f22 = c6ba1e81 65117880
!	%f12 = 41a555a5 14000000, %f12 = 41a555a5
	fdtoi	%f12,%f12		! %f12 = 0aaad28a

p3_label_6:
!	Mem[0000000030000030] = 9b58bb0f, %l5 = 575a29b8f0db4292
	ldswa	[%o0+0x030]%asi,%l5	! %l5 = ffffffff9b58bb0f
	fbne	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c8000e4] = e957c8d5, %l5 = ffffffff9b58bb0f
	ldstub	[%i1+0x0e4],%l5		! %l5 = 00000000000000e9
p3_b5:
	membar	#Sync			! Added by membar checker (560)
!	%f12 = 0aaad28a, %f9  = 0aaad28a, %f30 = 1e65dadd a37e864d
	fsmuld	%f12,%f9 ,%f30		! %f30 = 32bc7f13 1bac9900
!	%l5 = 00000000000000e9, immed = 00000e0b, %l4 = 000000000001e1b6
	sub	%l5,0xe0b,%l4		! %l4 = fffffffffffff2de

p3_label_7:
!	%f0  = 16ae9d05, %f8  = 6711fa86, %f20 = 2152303b ca2ba770
	fsmuld	%f0 ,%f8 ,%f20		! %f20 = 3fc8e474 2484a780
!	%l4 = fffffffffffff2de, Mem[000000001c000000] = ddc3033f
	stha	%l4,[%i0+%g0]0x80	! Mem[000000001c000000] = f2de033f
!	%f28 = 5b8db54b 60a837c7, %f28 = 5b8db54b 60a837c7, %f30 = 32bc7f13 1bac9900
	faddd	%f28,%f28,%f30		! %f30 = 5b9db54b 60a837c7
	fbu,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l3 = b2160cffc7a116d2, Mem[000000001d800008] = cd01c419
	stha	%l3,[%i3+%o6]0x80	! Annulled
p3_b6:

p3_label_8:
	membar	#Sync			! Added by membar checker (561)
!	%l6 = 1599b1c1, %l7 = 6eee22b9, Mem[000000001c000120] = 418b115c 62faa0cf
	std	%l6,[%i0+0x120]	! Mem[000000001c000120] = 1599b1c1 6eee22b9
!	Mem[000000001c0000c0] = 2ec3a7f2 81c15f71 f6955c3d 38373846
	prefetch [%i0+0x0c0],2
!	Branch On Register, %l3 = b2160cffc7a116d2
	brnz,a,pt %l3,p3_b7		! Branch Taken
!	Mem[000000001d800000] = cf70e2e0, %l1 = 000000005d3579fd
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffcf70
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x007,%g2
p3_b7:
	membar	#Sync			! Added by membar checker (562)
!	Branch On Register, %l0 = b2160cff9a946f2f
	brgz,pn	%l0,p3_not_taken_0	! Branch Not Taken

p3_label_9:
!	Mem[000000001d000188] = 09afc4c9 a5801c27, %l0 = 9a946f2f, %l1 = ffffcf70
	ldd	[%i2+0x188],%l0		! %l0 = 0000000009afc4c9 00000000a5801c27
p3_b8:
	membar	#Sync			! Added by membar checker (563)
	fblg,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000030800034] = 6009fb74, %l3 = b2160cffc7a116d2
	ldsb	[%o1+0x035],%l3		! Annulled
p3_b9:
	set	p3_b10,%o7
	fbuge	p3_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d000140] = 24eb407f ef102693 08e6d053 37a68128
	prefetch [%i2+0x140],2
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x00a,%g2
p3_b10:
!	Registers modified during the branch to p3_far_1
!	%l2  = 000000000000001e
!	%l3  = ba52002b33638200
!	%l6  = ffffffffffffffb9

p3_label_10:
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d000168] = 1a2a0960, %l3 = ba52002b33638200
	ldsw	[%i2+0x168],%l3		! Annulled
p3_b11:
	membar	#Sync			! Added by membar checker (564)
!	%f14 = c6aa1e81 65117880, %f26 = abdce394 f3857129
	fabsd	%f14,%f26		! %f26 = 46aa1e81 65117880
!	%f17 = f3857129, %f0  = 16ae9d05 b6711ef8
	fstod	%f17,%f0 		! %f0  = c670ae25 20000000
!	%l6 = ffffffffffffffb9, immed = fffffff5, %l3 = ba52002b33638200
	xorcc	%l6,-0x00b,%l3		! %l3 = 000000000000004c, %ccr = 00

p3_label_11:
!	%f20 = 3fc8e474, %f13 = 14000000, %f28 = 5b8db54b
	fmuls	%f20,%f13,%f28		! %f28 = 1448e474
!	%f19 = 2415470d, %f10 = 82f786c3 e377b60c
	fitod	%f19,%f10		! %f10 = 41c20aa3 86800000
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c800008] = 7a0d9612, %l4 = fffffffffffff2de
	ldsba	[%i1+%o6]0x80,%l4	! %l4 = 000000000000007a
p3_b12:
	membar	#Sync			! Added by membar checker (565)
!	%l2 = 000000000000001e, %l6 = ffffffffffffffb9, %l0 = 0000000009afc4c9
	subccc	%l2,%l6,%l0		! %l0 = 0000000000000065, %ccr = 11

p3_label_12:
	nop
	set	p3_b13,%o7
	fbue,a	p3_far_0_he	! Branch Taken, %fcc0 = 0
!	%l5 = 00000000000000e9, Mem[0000000031000030] = 524224ec
	stw	%l5,[%o2+0x030]		! Mem[0000000031000030] = 000000e9
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x00d,%g2
p3_b13:
!	Registers modified during the branch to p3_far_0
!	%l4  = 0000000000000000
!	%l6  = c7a116d2dd2781ee
!	%l7  = 00000000000ca000
	membar	#Sync			! Added by membar checker (566)
!	Mem[000000001c800008] = 7a0d9612, %l1 = 00000000a5801c27
	ldsha	[%i1+%o6]0x80,%l1	! %l1 = 0000000000007a0d
	set	p3_b14,%o7
	fbo,a,pt %fcc1,p3_near_1_le	! Branch Taken, %fcc1 = 0

p3_label_13:
!	Mem[000000001f000008] = d8dc1294, %l7 = 00000000000ca000
	lduba	[%i6+%o6]0x80,%l7	! %l7 = 00000000000000d8
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x00e,%g2
p3_b14:
!	Registers modified during the branch to p3_near_1
!	%l1  = 1300000000000000
!	%l2  = 000000000000008d
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (567)
!	%l3 = 000000000000004c, Mem[000000001c00002c] = 363fe799
	stwa	%l3,[%i0+0x02c]%asi	! Mem[000000001c00002c] = 0000004c
	set	p3_b15,%o7
	fbe,pn	%fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 0
!	%l6 = dd2781ee, %l7 = 000000d8, Mem[000000001c000000] = f2de033f 5cd669c3
	stda	%l6,[%i0+%g0]0x80	! Mem[000000001c000000] = dd2781ee 000000d8
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x00f,%g2
p3_b15:
!	Registers modified during the branch to p3_near_1
!	%l1  = 00000000000000df
!	%l6  = c7a116d2dd27816e
	bneg,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00

p3_label_14:
!	%l4 = 00000000, %l5 = 00000000, Mem[000000001d000090] = 5f10630e 51cfd1b2
	std	%l4,[%i2+0x090]	! Annulled
p3_b16:
	membar	#Sync			! Added by membar checker (568)
!	%f6  = 5b9db54b, %f19 = 2415470d
	fmovs	%f6 ,%f19		! %f19 = 5b9db54b
!	%l5 = 0000000000000000, Mem[000000001c8000bc] = 7b6d889e
	stw	%l5,[%i1+0x0bc]		! Mem[000000001c8000bc] = 00000000
!	%f28 = 1448e474, %f18 = 3701a948
	fabss	%f28,%f18		! %f18 = 1448e474
	set	p3_b17,%o7
	fbule,pt %fcc1,p3_near_1_le	! Branch Taken, %fcc1 = 0

p3_label_15:
!	%l4 = 0000000000000000, Mem[000000001d80019d] = c0df53e0
	stb	%l4,[%i3+0x19d]		! Mem[000000001d80019c] = c00053e0
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x011,%g2
p3_b17:
!	Registers modified during the branch to p3_near_1
!	%l1  = 1300000000000000
!	%l2  = 000000000000008d
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (569)
!	Mem[0000000032000058] = d1b4bc7c a73b551a, %l0 = 00000065, %l1 = 00000000
	ldd	[%o4+0x058],%g2		! %l0 = 0000000000000065 1300000000000000
!	%l6 = dd27816e, %l7 = 000000d8, Mem[000000001c000008] = 2269c6d1 0ae65114
	stda	%l6,[%i0+%o6]0x80	! Mem[000000001c000008] = dd27816e 000000d8
!	Mem[000000001c000040] = d8dcda3c 7938b35a 6d941e4c 464a6c14
	prefetch [%i0+0x040],3
!	%f14 = c6aa1e81, %f9  = 0aaad28a
	fabss	%f14,%f9 		! %f9  = 46aa1e81

p3_label_16:
!	%l7 = 00000000000000d8, immed = fffff589, %y  = 00000000
	smulcc	%l7,-0xa77,%l6		! %l6 = fffffffffff72b98, %ccr = 88
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d000000] = c10d92b5 a07c3a5c 9692dee0 fc3a1ac1
	prefetch [%i2+0x000],1	! Annulled
p3_b18:
	membar	#Sync			! Added by membar checker (570)
!	%l4 = 0000000000000000, immed = 00000cc9, %y  = ffffffff
	umulcc	%l4,0xcc9,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Branch On Register, %l5 = 0000000000000000
	brnz,pn	%l5,p3_not_taken_0	! Branch Not Taken

p3_label_17:
!	%l4 = 0000000000000000, Mem[0000000032000038] = f69e7d05feab7aa1
	stx	%l4,[%o4+0x038]		! Mem[0000000032000038] = 0000000000000000
p3_b19:
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 0000000000000065, Mem[000000003000007c] = 4687b476
	stb	%l0,[%o0+0x07c]		! Mem[000000003000007c] = 6587b476
p3_b20:
	membar	#Sync			! Added by membar checker (571)
!	%l0 = 0000000000000065, %l2 = 000000000000008d, %l2 = 000000000000008d
	add	%l0,%l2,%l2		! %l2 = 00000000000000f2
	bge,a	p3_b21			! Branch Taken, %ccr = 44, CWP = 0

p3_label_18:
!	Mem[000000001c800100] = 28a760c8 8ac950eb e5c53169 31eef08f
	prefetch [%i1+0x100],21
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x015,%g2
p3_b21:
	membar	#Sync			! Added by membar checker (572)
!	Mem[000000001d000180] = c9988dde 179aab2a
	flush	%i2+0x180
!	%l6 = 00000000, %l7 = 000000d8, Mem[000000001c800000] = b8318437 f7a6adb4
	stda	%l6,[%i1+%g0]0x80	! Mem[000000001c800000] = 00000000 000000d8
!	Mem[000000001c800008] = 7a0d9612, %l4 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l4	! %l4 = 000000007a0d9612
	bcc,a	p3_b22			! Branch Taken, %ccr = 44, CWP = 0

p3_label_19:
!	Mem[0000000030800074] = 20f64728, %l0 = 0000000000000065
	ldub	[%o1+0x075],%l0		! %l0 = 00000000000000f6
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x016,%g2
p3_b22:
	set	p3_b23,%o7
	fbe	p3_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003180007b] = 048ca6f3, %l4 = 000000007a0d9612
	ldstub	[%o3+0x07b],%l4		! %l4 = 00000000000000f3
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x017,%g2
p3_b23:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000000
	bpos,a	p3_b24			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[000000001d800008] = cd01c419, %l3 = 000000000000004c
	ldsha	[%i3+%o6]0x80,%l3	! %l3 = ffffffffffffcd01
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x018,%g2
p3_b24:

p3_label_20:
	membar	#Sync			! Added by membar checker (573)
!	%l6 = 0000000000000000, immed = fffff43e, %l0 = 00000000000000f6
	andncc	%l6,-0xbc2,%l0		! %l0 = 0000000000000000, %ccr = 44
	fbn,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldd	[%o4+0x068],%g2
p3_b25:
	membar	#Sync			! Added by membar checker (574)
!	Mem[000000001c0001f8] = ccbfb6f1 de1d30e6, %l4 = 000000f3, %l5 = 00000000
	ldd	[%i0+0x1f8],%l4		! %l4 = 00000000ccbfb6f1 00000000de1d30e6
!	%l3 = ffffffffffffcd01, %l7 = 00000000000000d8, %l4 = 00000000ccbfb6f1
	srl	%l3,%l7,%l4		! %l4 = 00000000000000ff

p3_label_21:
!	%l2 = 000000f2, %l3 = ffffcd01, Mem[000000001c800140] = dd7cfe0e 55d08d19
	stda	%l2,[%i1+0x140]%asi	! Mem[000000001c800140] = 000000f2 ffffcd01
!	Mem[0000000030800038] = 34b39964, %l5 = 00000000de1d30e6
	ldsw	[%o1+0x038],%l5		! %l5 = 0000000034b39964
!	%l4 = 00000000000000ff, immed = fffff591, %l1 = 0000000000000000
	orcc	%l4,-0xa6f,%l1		! %l1 = fffffffffffff5ff, %ccr = 88
	fbn,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],4	! Annulled
p3_b26:

p3_label_22:
	membar	#Sync			! Added by membar checker (575)
!	Mem[000000001d8001c0] = bdc893867a06f357, %l5 = 0000000034b39964
	ldxa	[%i3+0x1c0]%asi,%l5	! %l5 = bdc893867a06f357
!	Mem[000000001c8000cc] = a11ff9f0, %l4 = 00000000000000ff
	lduw	[%i1+0x0cc],%l4		! %l4 = 00000000a11ff9f0
!	Mem[000000001c000120] = 1599b1c1 6eee22b9 3c7ca37c 135743a3
	prefetcha [%i0+0x120]%asi,3
!	%l7 = 00000000000000d8, immed = 00000a89, %l0 = 0000000000000000
	xorcc	%l7,0xa89,%l0		! %l0 = 0000000000000a51, %ccr = 00
!	%f30 = 5b9db54b, %f8  = 6711fa86 46aa1e81
	fstod	%f30,%f8 		! %f8  = 4373b6a9 60000000

p3_label_23:
!	%l5 = bdc893867a06f357, immed = fffff265, %l7 = 00000000000000d8
	addccc	%l5,-0xd9b,%l7		! %l7 = bdc893867a06e5bc, %ccr = 91
	fbul	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c000000] = dd2781ee, %l5 = bdc893867a06f357
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000dd
p3_b27:
	membar	#Sync			! Added by membar checker (576)
!	%f25 = 3edd5aa9, %f11 = 86800000, %f19 = 5b9db54b
	fmuls	%f25,%f11,%f19		! %f19 = 85dd5aa9
!	%f14 = c6aa1e81 65117880, %f14 = c6aa1e81 65117880, %f30 = 5b9db54b 60a837c7
	fsubd	%f14,%f14,%f30		! %f30 = 00000000 00000000

p3_label_24:
	bcc,a	p3_not_taken_0		! Branch Not Taken, %ccr = 91
!	Mem[000000001c000118] = 2cec1d6f, %l1 = fffffffffffff5ff
	lduw	[%i0+0x118],%l1		! Annulled
p3_b28:
	membar	#Sync			! Added by membar checker (577)
!	Mem[000000001d800020] = 5e70ebdb fb9a0204 65cdf645 9538379b
	prefetcha [%i3+0x020]%asi,2
	set	p3_b29,%o7
	fbule,a,pt %fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001f000008] = d8dc1294, %l1 = fffffffffffff5ff
	lduba	[%i6+%o6]0x80,%l1	! %l1 = 00000000000000d8
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x01d,%g2
p3_b29:
!	Registers modified during the branch to p3_near_1
!	%l1  = 4040000000000000
!	%l2  = 000000000000008d
!	%l5  = ffffffffffeddf00

p3_label_25:
	membar	#Sync			! Added by membar checker (578)
	fbne,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d8000b4] = 1acad985, %l2 = 000000000000008d
	lduh	[%i3+0x0b6],%l2		! Annulled
p3_b30:
	membar	#Sync			! Added by membar checker (579)
!	%f2  = 9462d5ee, %f13 = 14000000, %f9  = 60000000
	fdivs	%f2 ,%f13,%f9 		! %f9  = bfe2d5ee
!	Mem[0000000031800038] = 61a7cfcb 83724f11, %l2 = 0000008d, %l3 = ffffcd01
	ldda	[%o3+0x038]%asi,%l2	! %l2 = 0000000061a7cfcb 0000000083724f11
	set	p3_b31,%o7
	fbue	p3_far_3_le	! Branch Taken, %fcc0 = 0

p3_label_26:
!	Mem[000000001c800008] = 7a0d9612, %l0 = 0000000000000a51
	ldstuba	[%i1+%o6]0x80,%l0	! %l0 = 000000000000007a
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x01f,%g2
p3_b31:
!	Registers modified during the branch to p3_far_3
!	%l1  = 403fffff7c8db0ee
	membar	#Sync			! Added by membar checker (580)
!	Mem[0000000030800034] = 6009fb74, %l6 = 0000000000000000
	lduw	[%o1+0x034],%l6		! %l6 = 000000006009fb74
!	%l1 = 403fffff7c8db0ee, %l0 = 000000000000007a, %l6 = 000000006009fb74
	xnor	%l1,%l0,%l6		! %l6 = bfc0000083724f6b
!	%l7 = bdc893867a06e5bc, %l0 = 000000000000007a, %l0 = 000000000000007a
	addc	%l7,%l0,%l0		! %l0 = bdc893867a06e637
!	%f10 = 41c20aa3 86800000, %f5  = 6f0c8b6f
	fdtoi	%f10,%f5 		! %f5  = 2415470d

p3_label_27:
!	Mem[0000000030800038] = 34b39964 aa9a9c28, %l6 = 83724f6b, %l7 = 7a06e5bc
	ldda	[%o1+0x038]%asi,%l6	! %l6 = 0000000034b39964 00000000aa9a9c28
!	%l5 = ffffffffffeddf00, %l7 = 00000000aa9a9c28, %l2 = 0000000061a7cfcb
	srl	%l5,%l7,%l2		! %l2 = 0000000000ffeddf
!	%l3 = 0000000083724f11, %l6 = 0000000034b39964, %l2 = 0000000000ffeddf
	subccc	%l3,%l6,%l2		! %l2 = 000000004ebeb5ac, %ccr = 02
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],4
	fbn,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_28:
!	Mem[000000001c000008] = dd27816e000000d8, %l4 = 00000000a11ff9f0
	ldxa	[%i0+%o6]0x80,%l4	! Annulled
p3_b32:
	membar	#Sync			! Added by membar checker (581)
!	Mem[0000000030000074] = 219b27a6, %l1 = 403fffff7c8db0ee
	ldstuba	[%o0+0x074]%asi,%l1	! %l1 = 0000000000000021
!	Mem[0000000030000070] = 173ac55cff9b27a6, %l4 = 00000000a11ff9f0
	ldx	[%o0+0x070],%l4		! %l4 = 173ac55cff9b27a6
!	%l3 = 0000000083724f11, immed = fffff53c, %y  = ffffffff
	udivx	%l3,-0xac4,%l4		! %l4 = 0000000000000000
!	%f2  = 9462d5ee 0636ead3, %f18 = 1448e474 85dd5aa9
	fcmpd	%fcc0,%f2 ,%f18		! %fcc0 = 1

p3_label_29:
!	%l7 = 00000000aa9a9c28, immed = 00000b2b, %l5 = ffffffffffeddf00
	xnor	%l7,0xb2b,%l5		! %l5 = ffffffff556568fc
!	%f5  = 2415470d, %f16 = abece394
	fcmpes	%fcc3,%f5 ,%f16		! %fcc3 = 2
!	Mem[000000001d000140] = 24eb407f ef102693 08e6d053 37a68128
	prefetch [%i2+0x140],20
!	Mem[000000001c000000] = ff2781ee, %l1 = 0000000000000021
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000031800070] = d3c12984366c7d5a, %l1 = 00000000000000ff
	ldx	[%o3+0x070],%l1		! %l1 = d3c12984366c7d5a

p3_label_30:
!	%f30 = 00000000 00000000, %f30 = 00000000 00000000
	fxtod	%f30,%f30		! %f30 = 00000000 00000000
!	Mem[000000001d000129] = 61eec016, %l0 = bdc893867a06e637
	ldstuba	[%i2+0x129]%asi,%l0	! %l0 = 00000000000000ee
!	Branch On Register, %l5 = ffffffff556568fc
	brlez,a,pn %l5,p3_b33		! Branch Taken
!	Mem[000000001c000000] = ff2781ee 000000d8 dd27816e 000000d8
	prefetch [%i0+0x000],3
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x021,%g2
p3_b33:
	membar	#Sync			! Added by membar checker (582)
!	%l6 = 0000000034b39964, immed = 000001ec, %l3 = 0000000083724f11
	andcc	%l6,0x1ec,%l3		! %l3 = 0000000000000164, %ccr = 00

p3_label_31:
	set	p3_b34,%o7
	fbg,a,pt %fcc3,p3_near_1_le	! Branch Taken, %fcc3 = 2
!	%l7 = 00000000aa9a9c28, Mem[0000000032000079] = c507f3eb
	stb	%l7,[%o4+0x079]		! Mem[0000000032000078] = 2807f3eb
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x022,%g2
p3_b34:
!	Registers modified during the branch to p3_near_1
!	%l1  = 5900000000000000
!	%l2  = 000000000000008d
!	%l5  = 0000000007b80d07
	membar	#Sync			! Added by membar checker (583)
!	%f20 = 3fc8e474, %f28 = 1448e474
	fabss	%f20,%f28		! %f28 = 3fc8e474
!	%l2 = 000000000000008d, immed = fffff9ef, %l4 = 0000000000000000
	taddcc	%l2,-0x611,%l4		! %l4 = fffffffffffffa7c, %ccr = 8a
!	%f22 = c6ba1e81, %f14 = c6aa1e81
	fcmps	%fcc1,%f22,%f14		! %fcc1 = 1

p3_label_32:
!	Mem[000000001c800180] = 5635e7d3 420a54e4 d509d497 b77c557e
	prefetch [%i1+0x180],1
!	%f28 = 3fc8e474 60a837c7, %f22 = c6ba1e81 65117880
	fcmpd	%fcc2,%f28,%f22		! %fcc2 = 2
!	%l5 = 0000000007b80d07, immed = 00000952, %y  = 0000006d
	sdiv	%l5,0x952,%l4		! %l4 = 000000000bb2b81e
	bl	p3_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[000000001c800170] = 350e8699, %l4 = 000000000bb2b81e
	lduh	[%i1+0x170],%l4		! %l4 = 000000000000350e
p3_b35:

p3_label_33:
	membar	#Sync			! Added by membar checker (584)
!	%l0 = 00000000000000ee, immed = fffff3d9, %y  = 0000006d
	umulcc	%l0,-0xc27,%l4		! %l4 = 000000edfff4b3be, %ccr = 08
	fbg,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000032000030] = 29b8f0db, %l0 = 00000000000000ee
	ldsh	[%o4+0x032],%g2		! Annulled
p3_b36:
	membar	#Sync			! Added by membar checker (585)
!	Mem[000000001d800000] = cf70e2e0, %l6 = 0000000034b39964
	ldsba	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffffcf
!	%f30 = 00000000 00000000, %f4  = 58581058 2415470d, %f2  = 9462d5ee 0636ead3
	fmuld	%f30,%f4 ,%f2 		! %f2  = 00000000 00000000

p3_label_34:
	set	p3_b37,%o7
	fbo,a	p3_far_2_he	! Branch Taken, %fcc0 = 1
!	%l4 = fff4b3be, %l5 = 07b80d07, Mem[000000001c000008] = dd27816e 000000d8
	stda	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = fff4b3be 07b80d07
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x025,%g2
p3_b37:
!	Registers modified during the branch to p3_far_2
!	%l1  = fffffffffffff0fd
!	%l3  = ffffff12000b4caf
!	%l5  = 5900000007b80d07
!	%l6  = 00000000aa9a9723
	membar	#Sync			! Added by membar checker (586)
!	%l5 = 5900000007b80d07, Mem[0000000030800070] = 70ff925420f64728
	stx	%l5,[%o1+0x070]		! Mem[0000000030800070] = 5900000007b80d07
	set	p3_b38,%o7
	fbne,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001f000188] = d29c1f63 20f24905, %l0 = 000000ee, %l1 = fffff0fd
	ldd	[%i6+0x188],%l0		! %l0 = 00000000d29c1f63 0000000020f24905
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p3_branch_failed
	mov	0x026,%g2
p3_b38:
!	Registers modified during the branch to p3_far_1
!	%l0  = 59000000da542c6a

p3_label_35:
	membar	#Sync			! Added by membar checker (587)
	fbg,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[000000003100007c] = 8edf81d4, %l6 = 00000000aa9a9723
	ldsh	[%o2+0x07e],%l6		! %l6 = ffffffffffff81d4
p3_b39:
	membar	#Sync			! Added by membar checker (588)
!	Branch On Register, %l1 = 0000000020f24905
	brgez,pt %l1,p3_b40		! Branch Taken
!	%l7 = 00000000aa9a9c28, Mem[000000001c800008] = ff0d9612
	stha	%l7,[%i1+%o6]0x80	! Mem[000000001c800008] = 9c289612
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x028,%g2
p3_b40:
	membar	#Sync			! Added by membar checker (589)
!	Mem[000000001c800008] = 9c289612 6eee22b9, %l4 = fff4b3be, %l5 = 07b80d07
	ldda	[%i1+%o6]0x80,%l4	! %l4 = 000000009c289612 000000006eee22b9

p3_label_36:
!	Mem[000000001d0000b0] = 2cbc7056, %l4 = 000000009c289612
	lduwa	[%i2+0x0b0]%asi,%l4	! %l4 = 000000002cbc7056
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetcha [%o4+0x000]%asi,16
!	Mem[0000000031800030] = e06db4e2 00f2ce64, %l2 = 0000008d, %l3 = 000b4caf
	ldda	[%o3+0x030]%asi,%l2	! %l2 = 00000000e06db4e2 0000000000f2ce64
!	%l3 = 0000000000f2ce64, Mem[000000001d8001a0] = 680fe805c3bd7982
	stx	%l3,[%i3+0x1a0]		! Mem[000000001d8001a0] = 0000000000f2ce64
	fbuge,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_37:
!	%l1 = 0000000020f24905, Mem[000000001c000000] = ff2781ee
	stha	%l1,[%i0+%g0]0x80	! Mem[000000001c000000] = 490581ee
p3_b41:
	membar	#Sync			! Added by membar checker (590)
	fbule,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l5 = 000000006eee22b9, Mem[000000001f000110] = 575a29b8f0db4292
	stx	%l5,[%i6+0x110]		! Mem[000000001f000110] = 000000006eee22b9
p3_b42:
	membar	#Sync			! Added by membar checker (591)
!	%l2 = 00000000e06db4e2, immed = fffffa4e, %l4 = 000000002cbc7056
	sub	%l2,-0x5b2,%l4		! %l4 = 00000000e06dba94
!	%l4 = 00000000e06dba94, %l4 = 00000000e06dba94, %y  = 000000ed
	udivx	%l4,%l4,%l7		! %l7 = 0000000000000001

p3_label_38:
!	Mem[000000001d000000] = c10d92b5, %l4 = 00000000e06dba94
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000c10d92b5
!	%l1 = 0000000020f24905, %l0 = 59000000da542c6a, %l5 = 000000006eee22b9
	taddcc	%l1,%l0,%l5		! %l5 = 59000000fb46756f, %ccr = 0a
!	Mem[0000000030800034] = 6009fb74, %l6 = ffffffffffff81d4
	lduba	[%o1+0x036]%asi,%l6	! %l6 = 00000000000000fb
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetcha [%o4+0x000]%asi,1
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 0a

p3_label_39:
!	Mem[000000001c0001c0] = 42fd8b8f 02e9656d 290ea7c4 014c0bdf
	prefetch [%i0+0x1c0],3	! Annulled
p3_b43:
	membar	#Sync			! Added by membar checker (592)
	nop
	set	p3_b44,%o7
	fba,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000031800074] = 366c7d5a, %l6 = 00000000000000fb
	ldstub	[%o3+0x074],%l6		! Annulled
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x02c,%g2
p3_b44:
!	Registers modified during the branch to p3_far_0
!	%l4  = 00000000000000ed
!	%l6  = c7a116d2dd2781ee
!	%l7  = 001b4a858d400000
	membar	#Sync			! Added by membar checker (593)
!	%f15 = 65117880, %f30 = 00000000, %f18 = 1448e474
	fmuls	%f15,%f30,%f18		! %f18 = 00000000

p3_label_40:
	set	p3_b45,%o7
	fble,a	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001c0000f4] = e549d551, %l1 = 0000000020f24905
	ldsw	[%i0+0x0f4],%l1		! %l1 = ffffffffe549d551
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x02d,%g2
p3_b45:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000023
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],20
p3_b46:
	membar	#Sync			! Added by membar checker (594)
!	%l1 = 0000000000000023, Mem[000000001f000000] = 98301f0f
	stha	%l1,[%i6+%g0]0x80	! Mem[000000001f000000] = 00231f0f

p3_label_41:
!	%l3 = 0000000000f2ce64, immed = 0000080f, %l1 = 0000000000000023
	subccc	%l3,0x80f,%l1		! %l1 = 0000000000f2c655, %ccr = 00
!	%f2  = 00000000 00000000, %f24 = 35a7b26a 3edd5aa9, %f14 = c6aa1e81 65117880
	fmuld	%f2 ,%f24,%f14		! %f14 = 00000000 00000000
!	%l1 = 0000000000f2c655
	sethi	%hi(0xb8147c00),%l1	! %l1 = 00000000b8147c00
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800100] = d4552007 720e9d93 30e0adeb 48bf7eb7
	prefetch [%i3+0x100],0
p3_b47:

p3_label_42:
	membar	#Sync			! Added by membar checker (595)
!	Mem[000000003080003f] = aa9a9c28, %l2 = 00000000e06db4e2
	ldstuba	[%o1+0x03f]%asi,%l2	! %l2 = 0000000000000028
!	%f18 = 00000000 85dd5aa9, %f28 = 3fc8e474 60a837c7
	fmovd	%f18,%f28		! %f28 = 00000000 85dd5aa9
!	%f8  = 4373b6a9 bfe2d5ee, %f14 = 00000000 00000000, %f4  = 58581058 2415470d
	fsubd	%f8 ,%f14,%f4 		! %f4  = 4373b6a9 bfe2d5ee
!	Mem[000000001c000000] = 490581ee, %l0 = 59000000da542c6a
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000004905
!	Mem[000000001c000000] = 490581ee, %l0 = 0000000000004905
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000490581ee

p3_label_43:
!	Mem[000000001d800008] = cd01c419, %l6 = c7a116d2dd2781ee
	ldsba	[%i3+%o6]0x80,%l6	! %l6 = ffffffffffffffcd
	set	p3_b48,%o7
	fbule,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001d800008] = cd01c419, %l6 = ffffffffffffffcd
	ldsba	[%i3+%o6]0x80,%l6	! %l6 = ffffffffffffffcd
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x030,%g2
p3_b48:
!	Registers modified during the branch to p3_far_1
!	%l0  = 59000001444bf75d
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 01
!	Mem[000000001d000100] = 8f2ca876 ddbc5085 ef966a70 0c05d348
	prefetch [%i2+0x100],22
p3_b49:

p3_label_44:
	membar	#Sync			! Added by membar checker (596)
!	%l7 = 001b4a858d400000, immed = 00000016, %l4 = 00000000000000ed
	sll	%l7,0x016,%l4		! %l4 = a163500000000000
	fbug,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800000] = 00000000, %l4 = a163500000000000
	lduha	[%i1+%g0]0x80,%l4	! Annulled
p3_b50:
	membar	#Sync			! Added by membar checker (597)
!	Mem[000000001c000000] = 490581ee 000000d8
	flush	%i0+0x000
!	%l2 = 0000000000000028, immed = fffff8e9, %y  = 000000ed
	sdivx	%l2,-0x717,%l2		! %l2 = 0000000000000000

p3_label_45:
	fbu,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[000000001d000140] = 24eb407f ef102693 08e6d053 37a68128
	prefetch [%i2+0x140],4	! Annulled
p3_b51:
	membar	#Sync			! Added by membar checker (598)
!	%l1 = 00000000b8147c00, %l7 = 001b4a858d400000, %y  = 000000ed
	umulcc	%l1,%l7,%l4		! %l4 = 65914d6b00000000, %ccr = 04
!	Mem[000000001d0001a0] = 1a4ba3be cfd6e259 80f61965 3f5bce35
	prefetcha [%i2+0x1a0]%asi,3
!	%l3 = 0000000000f2ce64, Mem[000000001c800008] = 9c289612
	stwa	%l3,[%i1+%o6]0x80	! Mem[000000001c800008] = 00f2ce64

p3_label_46:
!	Branch On Register, %l0 = 59000001444bf75d
	brnz,pn	%l0,p3_b52		! Branch Taken
!	Mem[0000000031800030] = e06db4e2, %l4 = 65914d6b00000000
	lduw	[%o3+0x030],%l4		! %l4 = 00000000e06db4e2
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x034,%g2
p3_b52:
	membar	#Sync			! Added by membar checker (599)
!	Mem[000000001c000008] = fff4b3be, %l3 = 0000000000f2ce64
	ldsba	[%i0+%o6]0x80,%l3	! %l3 = ffffffffffffffff
!	%f10 = 41c20aa3 86800000, %f8  = 4373b6a9 bfe2d5ee
	fdtox	%f10,%f8 		! %f8  = 00000000 2415470d
!	Mem[000000001c8001d4] = 97deb430, %l4 = 00000000e06db4e2
	ldsw	[%i1+0x1d4],%l4		! %l4 = ffffffff97deb430

p3_label_47:
	set	p3_b53,%o7
	fbne,a,pt %fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 1
!	Mem[000000001d800120] = 51ee2ce9, %l5 = 59000000fb46756f
	lduw	[%i3+0x120],%l5		! %l5 = 0000000051ee2ce9
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x035,%g2
p3_b53:
!	Registers modified during the branch to p3_near_1
!	%l1  = 001b4a858d400007
!	%l6  = fffffffffffff14c
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001c000000] = 490581ee, %l6 = fffffffffffff14c
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 0000000000004905
p3_b54:
	membar	#Sync			! Added by membar checker (600)
!	%l6 = 0000000000004905, %l5 = 0000000051ee2ce9, %l7 = 001b4a858d400000
	tsubcc	%l6,%l5,%l7		! %l7 = ffffffffae121c1c, %ccr = 9b

p3_label_48:
!	%f12 = 0aaad28a 14000000, %f24 = 35a7b26a 3edd5aa9
	fnegd	%f12,%f24		! %f24 = 8aaad28a 14000000
	bvc,a	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000030800038] = 34b39964aa9a9cff, %l3 = ffffffffffffffff
	ldx	[%o1+0x038],%l3		! Annulled
p3_b55:
	membar	#Sync			! Added by membar checker (601)
!	%l3 = ffffffffffffffff, immed = 00000c4b, %l3 = ffffffffffffffff
	orn	%l3,0xc4b,%l3		! %l3 = ffffffffffffffff
	bne	p3_b56			! Branch Taken, %ccr = 9b, CWP = 0

p3_label_49:
!	Mem[000000001e800160] = 4ee56964 9eab7615 c2abf181 68c3e5dc
	prefetch [%i5+0x160],20
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x038,%g2
p3_b56:
	membar	#Sync			! Added by membar checker (602)
!	Mem[000000003000007c] = 6587b476, %l7 = ffffffffae121c1c
	lduwa	[%o0+0x07c]%asi,%l7	! %l7 = 000000006587b476
	bvc	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[000000001d800000] = cf70e2e0, %l0 = 59000001444bf75d
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000cf
p3_b57:
	membar	#Sync			! Added by membar checker (603)
!	Mem[000000001c800000] = 00000000 000000d8 00f2ce64 6eee22b9
	prefetch [%i1+0x000],2

p3_label_50:
	bcs,a	p3_b58			! Branch Taken, %ccr = 9b, CWP = 0
!	Mem[000000001c000100] = b0eda041, %l4 = ffffffff97deb430
	ldsw	[%i0+0x100],%l4		! %l4 = ffffffffb0eda041
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x03a,%g2
p3_b58:
	membar	#Sync			! Added by membar checker (604)
!	Mem[0000000031800030] = e06db4e2, %l2 = 0000000000000000
	ldsh	[%o3+0x032],%l2		! %l2 = ffffffffffffb4e2
!	%l0 = 000000cf, %l1 = 8d400007, Mem[0000000030000078] = a850fae7 6587b476
	stda	%l0,[%o0+0x078]%asi	! Mem[0000000030000078] = 000000cf 8d400007
	set	p3_b59,%o7
	fblg,pt	%fcc2,p3_near_0_le	! Branch Taken, %fcc2 = 2

p3_label_51:
!	%l4 = ffffffffb0eda041, Mem[000000001d000008] = 9692dee0
	stwa	%l4,[%i2+%o6]0x80	! Mem[000000001d000008] = b0eda041
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x03b,%g2
p3_b59:
!	Registers modified during the branch to p3_near_0
!	%l0  = 00000000ffffffff
!	%l5  = ffffffffffff96ed
	membar	#Sync			! Added by membar checker (605)
!	%f30 = 00000000, %f13 = 14000000, %f20 = 3fc8e474
	fdivs	%f30,%f13,%f20		! %f20 = 00000000
!	%l5 = ffffffffffff96ed, Mem[000000001c800000] = 00000000
	stwa	%l5,[%i1+%g0]0x80	! Mem[000000001c800000] = ffff96ed
!	Mem[0000000032000014] = 55a52d31, %l6 = 0000000000004905
	ldsba	[%o4+0x016]%asi,%g2	! %g2 = 0000000000000055
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 0a

p3_label_52:
!	Mem[000000001d000188] = 09afc4c9, %l5 = ffffffffffff96ed
	lduw	[%i2+0x188],%l5		! Annulled
p3_b60:
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000060] = 2432adfc 73787542 036269f7 f75fc675
	prefetch [%o4+0x060],0
p3_b61:
	membar	#Sync			! Added by membar checker (606)
!	Mem[000000001d8001e0] = 31623672 255dc7e1 6fb2b6f8 865c981c
	prefetcha [%i3+0x1e0]%asi,3
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 0a

p3_label_53:
!	Mem[0000000030800034] = 6009fb74, %l5 = ffffffffffff96ed
	ldsh	[%o1+0x034],%l5		! %l5 = 0000000000006009
p3_b62:
	ba,a	p3_b63			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[000000001d000000] = c10d92b5, %l5 = 0000000000006009
	ldsha	[%i2+%g0]0x80,%l5	! Annulled
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x03f,%g2
p3_b63:
	membar	#Sync			! Added by membar checker (607)
!	%l0 = 00000000ffffffff, immed = 000008e6, %l1 = 001b4a858d400007
	xnorcc	%l0,0x8e6,%l1		! %l1 = ffffffff000008e6, %ccr = 80
	fbug,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1

p3_label_54:
!	Mem[000000001d800008] = cd01c41912c08ba0, %l5 = 0000000000006009
	ldxa	[%i3+%o6]0x80,%l5	! %l5 = cd01c41912c08ba0
p3_b64:
	membar	#Sync			! Added by membar checker (608)
	fbule,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l2 = ffffffffffffb4e2, Mem[0000000031000078] = 815aa4f88edf81d4
	stx	%l2,[%o2+0x078]		! Annulled
p3_b65:
	membar	#Sync			! Added by membar checker (609)
!	Mem[000000001c800160] = 2329d093 e3247012 b2a4bfd5 44279113
	prefetcha [%i1+0x160]%asi,0
!	%f10 = 41c20aa3 86800000, %f2  = 00000000
	fdtoi	%f10,%f2 		! %f2  = 2415470d

p3_label_55:
!	%l4 = b0eda041, %l5 = 12c08ba0, Mem[000000001c800000] = ffff96ed 000000d8
	stda	%l4,[%i1+%g0]0x80	! Mem[000000001c800000] = b0eda041 12c08ba0
!	%l7 = 000000006587b476, immed = fffff715, %l0 = 00000000ffffffff
	andn	%l7,-0x8eb,%l0		! %l0 = 0000000000000062
!	%f31 = 00000000, %f20 = 00000000
	fcmps	%fcc3,%f31,%f20		! %fcc3 = 0
!	Mem[000000001c000098] = 56e71f72 55fe4267, %l6 = 00004905, %l7 = 6587b476
	ldd	[%i0+0x098],%l6		! %l6 = 0000000056e71f72 0000000055fe4267
!	%l5 = cd01c41912c08ba0, immed = 00000a9b, %l1 = ffffffff000008e6
	and	%l5,0xa9b,%l1		! %l1 = 0000000000000a80

p3_label_56:
!	%l5 = cd01c41912c08ba0, %l1 = 0000000000000a80, %l4 = ffffffffb0eda041
	xorcc	%l5,%l1,%l4		! %l4 = cd01c41912c08120, %ccr = 80
!	%l2 = ffffffffffffb4e2, %l7 = 0000000055fe4267, %l1 = 0000000000000a80
	subc	%l2,%l7,%l1		! %l1 = ffffffffaa01727b
!	%l0 = 0000000000000062, %l5 = cd01c41912c08ba0, %l7 = 0000000055fe4267
	srl	%l0,%l5,%l7		! %l7 = 0000000000000062
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[000000001d000008] = b0eda041, %l2 = ffffffffffffb4e2
	lduba	[%i2+%o6]0x80,%l2	! Annulled
p3_b66:

p3_label_57:
	membar	#Sync			! Added by membar checker (610)
!	%l7 = 0000000000000062, immed = fffff65c, %y  = 65914d6b
	umulcc	%l7,-0x9a4,%l2		! %l2 = 00000061fffc4f38, %ccr = 08
	fbge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800000] = ff70e2e02f4d94c4, %l3 = ffffffffffffffff
	ldxa	[%i3+%g0]0x80,%l3	! Annulled
p3_b67:
	membar	#Sync			! Added by membar checker (611)
!	Mem[000000001c80016c] = 44279113, %l2 = 00000061fffc4f38
	lduha	[%i1+0x16e]%asi,%l2	! %l2 = 0000000000009113
	ba,a	p3_b68			! Branch Taken, %ccr = 08, CWP = 0

p3_label_58:
!	 Annulled
	ldda	[%i2+%o6]0x80,%l0
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x044,%g2
p3_b68:
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000030000074] = ff9b27a6, %l7 = 0000000000000062
	ldsb	[%o0+0x075],%l7		! %l7 = ffffffffffffff9b
p3_b69:
	membar	#Sync			! Added by membar checker (612)
	fbu,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001f000140] = 24b3856c 5d8e259d 623ecfa1 d36eebf8
	prefetch [%i6+0x140],1	! Annulled
p3_b70:

p3_label_59:
	membar	#Sync			! Added by membar checker (613)
!	%f25 = 14000000, %f8  = 00000000 2415470d
	fstod	%f25,%f8 		! %f8  = 3a800000 00000000
!	%l5 = cd01c41912c08ba0, immed = 00000430, %y  = 00000061
	smulcc	%l5,0x430,%l5		! %l5 = 0000004e8648ae00, %ccr = 08
!	Mem[0000000030000074] = ff9b27a6, %l0 = 0000000000000062
	lduba	[%o0+0x077]%asi,%l0	! %l0 = 00000000000000a6
	set	p3_b71,%o7
	fbne,a	p3_far_3_le	! Branch Taken, %fcc0 = 1
!	%l1 = ffffffffaa01727b, Mem[000000001c000000] = 490581ee000000d8
	stxa	%l1,[%i0+%g0]0x80	! Mem[000000001c000000] = ffffffffaa01727b
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x047,%g2
p3_b71:
!	Registers modified during the branch to p3_far_3
!	%l1  = ffffffffaa01727c

p3_label_60:
	membar	#Sync			! Added by membar checker (614)
!	%l2 = 0000000000009113, immed = fffffa54, %l6 = 0000000056e71f72
	andncc	%l2,-0x5ac,%l6		! %l6 = 0000000000000103, %ccr = 00
!	%f23 = 65117880, %f4  = 4373b6a9 bfe2d5ee
	fitod	%f23,%f4 		! %f4  = 41d9445e 20000000
	set	p3_b72,%o7
	fbl,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	%l0 = 00000000000000a6, Mem[000000001d000000] = c10d92b5
	stwa	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = 000000a6
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x048,%g2
p3_b72:
!	Registers modified during the branch to p3_far_0
!	%l4  = 000000000000004f
!	%l6  = c7a116d2dd2781ee
!	%l7  = 0053000000000000
	membar	#Sync			! Added by membar checker (615)
	fbue,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1

p3_label_61:
!	Mem[000000001d800008] = cd01c419, %l6 = c7a116d2dd2781ee
	lduwa	[%i3+%o6]0x80,%l6	! %l6 = 00000000cd01c419
p3_b73:
	membar	#Sync			! Added by membar checker (616)
!	%l2 = 0000000000009113, %l0 = 00000000000000a6, %l6 = 00000000cd01c419
	orncc	%l2,%l0,%l6		! %l6 = ffffffffffffff5b, %ccr = 88
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetcha [%o4+0x040]%asi,23
!	%l0 = 00000000000000a6, %l1 = ffffffffaa01727c, %y  = 0000004e
	sdiv	%l0,%l1,%l2		! %l2 = ffffffffffffff18
!	%l0 = 00000000000000a6, immed = fffffae5, %l3 = ffffffffffffffff
	xorcc	%l0,-0x51b,%l3		! %l3 = fffffffffffffa43, %ccr = 88

p3_label_62:
!	%l0 = 00000000000000a6, Mem[000000001c800008] = 00f2ce64
	stba	%l0,[%i1+%o6]0x80	! Mem[000000001c800008] = a6f2ce64
!	Mem[000000001d000008] = b0eda041, %l7 = 0053000000000000
	ldswa	[%i2+%o6]0x80,%l7	! %l7 = ffffffffb0eda041
!	Mem[000000001c000008] = fff4b3be, %l1 = ffffffffaa01727c
	ldsba	[%i0+%o6]0x80,%l1	! %l1 = ffffffffffffffff
	fbn,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001d800008] = cd01c419, %l1 = ffffffffffffffff
	swapa	[%i3+%o6]0x80,%l1	! %l1 = 00000000cd01c419
p3_b74:

p3_label_63:
	membar	#Sync			! Added by membar checker (617)
!	%f0  = c670ae25 20000000, %f14 = 00000000 00000000, %f4  = 41d9445e 20000000
	faddd	%f0 ,%f14,%f4 		! %f4  = c670ae25 20000000
!	Branch On Register, %l6 = ffffffffffffff5b
	brz,pn	%l6,p3_not_taken_0	! Branch Not Taken
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetch [%o4+0x000],3
p3_b75:
	bpos	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c000000] = ffffffff, %l6 = ffffffffffffff5b
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
p3_b76:

p3_label_64:
	membar	#Sync			! Added by membar checker (618)
	fbu,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001e000008] = 75541267, %l7 = ffffffffb0eda041
	lduwa	[%i4+%o6]0x80,%l7	! %l7 = 0000000075541267
p3_b77:
	membar	#Sync			! Added by membar checker (619)
!	%l6 = 00000000000000ff, Mem[0000000030000070] = 173ac55cff9b27a6
	stxa	%l6,[%o0+0x070]%asi	! Mem[0000000030000070] = 00000000000000ff
	set	p3_b78,%o7
	fbl	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000030000070] = 00000000, %l1 = 00000000cd01c419
	lduw	[%o0+0x070],%l1		! %l1 = 0000000000000000
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x04e,%g2
p3_b78:
!	Registers modified during the branch to p3_far_3
!	%l3  = 8648aafd70f18a00
!	%l7  = 8648aaaeeaa8dc00

p3_label_65:
	membar	#Sync			! Added by membar checker (620)
!	%f17 = f3857129, %f3  = 00000000
	fnegs	%f17,%f3 		! %f3  = 73857129
	bleu,a	p3_b79			! Branch Taken, %ccr = 8b, CWP = 0
!	Mem[000000001c000130] = a65e6b0b, %l7 = 8648aaaeeaa8dc00
	ldsh	[%i0+0x130],%l7		! %l7 = ffffffffffffa65e
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x04f,%g2
p3_b79:
	set	p3_b80,%o7
	fba	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001d8000e0] = cb8d9ba1 6898ae3a 7995d049 55eb36ca
	prefetch [%i3+0x0e0],23
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x050,%g2
p3_b80:
!	Registers modified during the branch to p3_far_2
!	%l1  = 000000000000003f

p3_label_66:
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 8b
!	%l7 = ffffffffffffa65e, Mem[000000001c000000] = ffffffff
	stwa	%l7,[%i0+%g0]0x80	! Annulled
p3_b81:
	membar	#Sync			! Added by membar checker (621)
!	%l6 = 00000000000000ff, immed = 00000016, %l6 = 00000000000000ff
	subccc	%l6,0x016,%l6		! %l6 = 00000000000000e8, %ccr = 00
!	Branch On Register, %l4 = 000000000000004f
	brgez,a,pt %l4,p3_b82		! Branch Taken
!	Mem[000000001d800060] = b1296e70 f0e2ff44 7276960a a0de31da
	prefetch [%i3+0x060],1
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x052,%g2
p3_b82:

p3_label_67:
	membar	#Sync			! Added by membar checker (622)
!	%l5 = 0000004e8648ae00, %l5 = 0000004e8648ae00, %l7 = ffffffffffffa65e
	and	%l5,%l5,%l7		! %l7 = 0000004e8648ae00
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000031800070] = d3c12984 366c7d5a, %l4 = 0000004f, %l5 = 8648ae00
	ldd	[%o3+0x070],%l4		! %l4 = 00000000d3c12984 00000000366c7d5a
p3_b83:
	membar	#Sync			! Added by membar checker (623)
	fbug,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003100007c] = 8edf81d4, %l5 = 00000000366c7d5a
	ldub	[%o2+0x07f],%l5		! Annulled
p3_b84:

p3_label_68:
	membar	#Sync			! Added by membar checker (624)
!	%f6  = 5b9db54b, %f5  = 20000000
	fnegs	%f6 ,%f5 		! %f5  = db9db54b
!	Mem[000000001c000000] = ffffffff aa01727b fff4b3be 07b80d07
	prefetcha [%i0+0x000]%asi,23
!	%l6 = 00000000000000e8, Mem[000000001d000000] = 000000a6
	stba	%l6,[%i2+%g0]0x80	! Mem[000000001d000000] = e80000a6
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l5 = 00000000366c7d5a, Mem[000000001d800000] = ff70e2e02f4d94c4
	stxa	%l5,[%i3+%g0]0x80	! Mem[000000001d800000] = 00000000366c7d5a
p3_b85:

p3_label_69:
	membar	#Sync			! Added by membar checker (625)
!	%f28 = 00000000, %f6  = 5b9db54b, %f10 = 41c20aa3
	fdivs	%f28,%f6 ,%f10		! %f10 = 00000000
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],0
!	%f10 = 00000000, %f13 = 14000000
	fitos	%f10,%f13		! %f13 = 00000000
!	Mem[000000001d800028] = 65cdf645, %l5 = 00000000366c7d5a
	ldsh	[%i3+0x02a],%l5		! %l5 = fffffffffffff645
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00

p3_label_70:
!	Mem[000000001d000014] = 464bff9e, %l7 = 0000004e8648ae00
	lduh	[%i2+0x014],%l7		! Annulled
p3_b86:
	membar	#Sync			! Added by membar checker (626)
!	%f30 = 00000000 00000000, %f30 = 00000000
	fxtos	%f30,%f30		! %f30 = 00000000
!	Mem[000000001d000008] = b0eda041, %l2 = ffffffffffffff18
	swapa	[%i2+%o6]0x80,%l2	! %l2 = 00000000b0eda041
!	Mem[0000000032000060] = 2432adfc 73787542 036269f7 f75fc675
	prefetch [%o4+0x060],2
!	%l3 = 8648aafd70f18a00, %l5 = fffffffffffff645, %l6 = 00000000000000e8
	xnorcc	%l3,%l5,%l6		! %l6 = 8648aafd70f183ba, %ccr = 80

p3_label_71:
!	%l4 = 00000000d3c12984, Mem[000000001d800000] = 00000000
	stwa	%l4,[%i3+%g0]0x80	! Mem[000000001d800000] = d3c12984
	set	p3_b87,%o7
	fble,pt	%fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 1
!	Mem[000000001d000000] = e80000a6, %l4 = 00000000d3c12984
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000e8
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x057,%g2
p3_b87:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l5  = 00000000ffffffff
!	%l7  = 8648aafd70f1895d
	bvs,a	p3_b88			! Branch Taken, %ccr = 82, CWP = 0
!	%l2 = b0eda041, %l3 = 70f18a00, Mem[0000000031800070] = d3c12984 366c7d5a
	std	%l2,[%o3+0x070]	! Mem[0000000031800070] = b0eda041 70f18a00
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x058,%g2
p3_b88:

p3_label_72:
	membar	#Sync			! Added by membar checker (627)
!	%f9  = 00000000, %f9  = 00000000
	fmovs	%f9 ,%f9 		! %f9  = 00000000
!	%l3 = 8648aafd70f18a00, %l3 = 8648aafd70f18a00, %l2 = 00000000b0eda041
	srlx	%l3,%l3,%l2		! %l2 = 8648aafd70f18a00
!	%l6 = 8648aafd70f183ba, Mem[000000001d0001a8] = 80f619653f5bce35
	stxa	%l6,[%i2+0x1a8]%asi	! Mem[000000001d0001a8] = 8648aafd70f183ba
!	%f26 = 46aa1e81, %f26 = 46aa1e81 65117880
	fitod	%f26,%f26		! %f26 = 41d1aa87 a0400000
!	Mem[000000001c8000a0] = 6710ea33 025cfcb6 e4afc1c1 bbcdaf29
	prefetch [%i1+0x0a0],2

p3_label_73:
!	Branch On Register, %l7 = 8648aafd70f1895d
	brgz,pt	%l7,p3_not_taken_0	! Branch Not Taken
!	Mem[000000003180003c] = 70f1895d, %l1 = 000000000000003f
	swap	[%o3+0x03c],%l1		! %l1 = 0000000070f1895d
p3_b89:
	membar	#Sync			! Added by membar checker (628)
!	Mem[0000000032000068] = 036269f7, %l6 = 8648aafd70f183ba
	lduwa	[%o4+0x068]%asi,%g2	! %g2 = 8648aafd70f183ba
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetcha [%o4+0x000]%asi,2
!	%f14 = 00000000 00000000, %f10 = 00000000 86800000
	fxtod	%f14,%f10		! %f10 = 00000000 00000000

p3_label_74:
	set	p3_b90,%o7
	fbl	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001d800008] = ffffffff 12c08ba0, %l4 = 000000e8, %l5 = ffffffff
	ldda	[%i3+%o6]0x80,%l4	! %l4 = 00000000ffffffff 0000000012c08ba0
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x05a,%g2
p3_b90:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000012c08ba0
	membar	#Sync			! Added by membar checker (629)
!	%f15 = 00000000, %f16 = abece394, %f28 = 00000000 85dd5aa9
	nop
!	Mem[000000001d000100] = 8f2ca876ddbc5085, %l7 = 8648aafd70f1895d
	ldxa	[%i2+0x100]%asi,%l7	! %l7 = 8f2ca876ddbc5085
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],23

p3_label_75:
!	Branch On Register, %l5 = 0000000012c08ba0
	brgez,a,pt %l5,p3_b91		! Branch Taken
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],23
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x05b,%g2
p3_b91:
	membar	#Sync			! Added by membar checker (630)
!	%f19 = 85dd5aa9, %f7  = 60a837c7
	fnegs	%f19,%f7 		! %f7  = 05dd5aa9
	set	p3_b92,%o7
	fbo,pn	%fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 1
!	Mem[000000001d8001c0] = bdc89386 7a06f357 58531db4 e0a52279
	prefetch [%i3+0x1c0],4
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x05c,%g2
p3_b92:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l5  = 00000000ffffffff
!	%l7  = 8648aafd70f1895d

p3_label_76:
	bgu,a	p3_b93			! Branch Taken, %ccr = 82, CWP = 0
!	Mem[000000001d000000] = ff0000a6, %l6 = 8648aafd70f183ba
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x05d,%g2
p3_b93:
	membar	#Sync			! Added by membar checker (631)
!	%l6 = 0000ff00, %l7 = 70f1895d, Mem[000000001d800098] = b9f54222 4e7344b6
	std	%l6,[%i3+0x098]	! Mem[000000001d800098] = 0000ff00 70f1895d
!	Mem[000000001c800008] = a6f2ce64, %l0 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l0	! %l0 = ffffffffa6f2ce64
	bne	p3_b94			! Branch Taken, %ccr = 82, CWP = 0

p3_label_77:
!	%l2 = 8648aafd70f18a00, Mem[000000001c800194] = d3aeeb6e
	sth	%l2,[%i1+0x194]		! Mem[000000001c800194] = 8a00eb6e
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x05e,%g2
p3_b94:
	set	p3_b95,%o7
	fbul,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	%l4 = 00000000ffffffff, Mem[000000001d000008] = ffffff18fc3a1ac1
	stxa	%l4,[%i2+%o6]0x80	! Mem[000000001d000008] = 00000000ffffffff
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x05f,%g2
p3_b95:
!	Registers modified during the branch to p3_far_1
!	%l0  = 00000000a6f2ce63
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d8000c0] = e7db1f3d 51986add f1816623 450f1a2b
	prefetch [%i3+0x0c0],1
p3_b96:

p3_label_78:
	membar	#Sync			! Added by membar checker (632)
!	Mem[000000001d800160] = c67a8c8a 4db9d1e2 96f84e3d 747ceafd
	prefetch [%i3+0x160],0
!	%l1 = 0000000070f1895d, %l0 = 00000000a6f2ce63, %l7 = 8648aafd70f1895d
	xnor	%l1,%l0,%l7		! %l7 = ffffffff29fcb8c1
!	%f10 = 00000000 00000000, %f20 = 00000000 2484a780
	fabsd	%f10,%f20		! %f20 = 00000000 00000000
!	%l7 = ffffffff29fcb8c1, immed = 00000b12, %y  = 8648aafd
	sdiv	%l7,0xb12,%l4		! %l4 = ffffffff80000000
!	%l6 = 000000000000ff00, immed = fffffad6, %l7 = ffffffff29fcb8c1
	subc	%l6,-0x52a,%l7		! %l7 = 0000000000010429

p3_label_79:
	bvc,a	p3_b97			! Branch Taken, %ccr = 19, CWP = 0
!	Mem[000000001d800008] = ffffffff12c08ba0, %l6 = 000000000000ff00
	ldxa	[%i3+%o6]0x80,%l6	! %l6 = ffffffff12c08ba0
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x061,%g2
p3_b97:
	membar	#Sync			! Added by membar checker (633)
!	%l2 = 8648aafd70f18a00, immed = fffff413, %y  = 8648aafd
	smul	%l2,-0xbed,%l0		! %l0 = fffffabd0f753e00
!	%l6 = ffffffff12c08ba0, %l6 = ffffffff12c08ba0, %l6 = ffffffff12c08ba0
	sra	%l6,%l6,%l6		! %l6 = 0000000012c08ba0
!	%l7 = 0000000000010429, immed = 00000ac0, %l0 = fffffabd0f753e00
	addcc	%l7,0xac0,%l0		! %l0 = 0000000000010ee9, %ccr = 00

p3_label_80:
!	Mem[0000000031000070] = df5b52a4, %l6 = 0000000012c08ba0
	ldsb	[%o2+0x073],%l6		! %l6 = ffffffffffffffa4
!	Branch On Register, %l5 = 00000000ffffffff
	brgz,pt	%l5,p3_b98		! Branch Taken
!	Mem[0000000030800070] = 59000000, %l0 = 0000000000010ee9
	lduh	[%o1+0x072],%l0		! %l0 = 0000000000000000
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x062,%g2
p3_b98:
	membar	#Sync			! Added by membar checker (634)
	fble,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001c800008] = a6f2ce64, %l3 = 8648aafd70f18a00
	lduba	[%i1+%o6]0x80,%l3	! %l3 = 00000000000000a6
p3_b99:

p3_label_81:
	bleu	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l7 = 0000000000010429, Mem[000000001d800108] = 30e0adeb48bf7eb7
	stx	%l7,[%i3+0x108]		! Mem[000000001d800108] = 0000000000010429
p3_b100:
	membar	#Sync			! Added by membar checker (635)
!	%l1 = 0000000070f1895d, Mem[000000001e000098] = c9a5037c8e8728aa
	stx	%l1,[%i4+0x098]		! Mem[000000001e000098] = 0000000070f1895d
	set	p3_b101,%o7
	fbule,a,pt %fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[000000001d8001a0] = 00000000 00f2ce64 dc671e4e 5d192f65
	prefetch [%i3+0x1a0],4
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x065,%g2
p3_b101:
!	Registers modified during the branch to p3_near_2
!	%l7  = fffffffffffffb71

p3_label_82:
	bcc,a	p3_b102			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d000000] = ff0000a6, %l1 = 0000000070f1895d
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ff0000a6
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x066,%g2
p3_b102:
	membar	#Sync			! Added by membar checker (636)
	set	p3_b103,%o7
	fble,a,pn %fcc0,p3_near_3_he	! Branch Taken, %fcc0 = 1
!	%l3 = 00000000000000a6, Mem[0000000031000078] = 815aa4f88edf81d4
	stx	%l3,[%o2+0x078]		! Mem[0000000031000078] = 00000000000000a6
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x067,%g2
p3_b103:
!	Registers modified during the branch to p3_near_3
!	%l0  = 8000000000000000
!	%l3  = 8648aafd70f17c0d
!	%l4  = 0000024780000000
!	%l5  = 79b755028f0e7386
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 00

p3_label_83:
!	Mem[000000001d800000] = d3c12984, %l1 = 00000000ff0000a6
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = ffffffffd3c12984
p3_b104:
	membar	#Sync			! Added by membar checker (637)
!	%l2 = 8648aafd70f18a00, immed = 000004af, %l3 = 8648aafd70f17c0d
	xorcc	%l2,0x4af,%l3		! %l3 = 8648aafd70f18eaf, %ccr = 80
!	Mem[000000001c000008] = fff4b3be, %l6 = ffffffffffffffa4
	ldswa	[%i0+%o6]0x80,%l6	! %l6 = fffffffffff4b3be
!	Jump to jmpl_0, CWP = 0
	set	p3_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	Mem[000000001c000180] = 1f8bdf46, %l0 = 8000000000000000
	ldsw	[%i0+0x180],%l0		! %l0 = 000000001f8bdf46
!	Registers modified during the branch to p3_jmpl_0
!	%l0  = 79b755028f0539be
!	%l2  = fffffffffffffbbc

p3_label_84:
!	%f10 = 00000000, %f0  = c670ae25
	fstoi	%f10,%f0 		! %f0  = 00000000
!	%l1 = ffffffffd3c12984, Mem[0000000031000030] = 000000e9
	stwa	%l1,[%o2+0x030]%asi	! Mem[0000000031000030] = d3c12984
!	%l2 = fffffffffffffbbc, immed = 0000061d, %y  = fffffabd
	umul	%l2,0x61d,%l5		! %l5 = 0000061cffe5ec4c
!	Mem[0000000030000030] = 9b58bb0fcd491776, %l6 = fffffffffff4b3be
	ldxa	[%o0+0x030]%asi,%l6	! %l6 = 9b58bb0fcd491776
!	%l2 = fffffffffffffbbc, immed = fffffeb0, %y  = 0000061c
	udivcc	%l2,-0x150,%l7		! %l7 = 000000000000061d, %ccr = 00

p3_label_85:
	set	p3_b105,%o7
	fbule,a	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	%l7 = 000000000000061d, Mem[000000001e0000ca] = be79c79b
	sth	%l7,[%i4+0x0ca]		! Mem[000000001e0000c8] = be79061d
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x069,%g2
p3_b105:
!	Registers modified during the branch to p3_far_3
!	%l3  = 70e60d752acaaff4
!	%l7  = 70e607582ae4c3a8
	membar	#Sync			! Added by membar checker (638)
!	%f14 = 00000000 00000000, %f4  = c670ae25 db9db54b
	fdtox	%f14,%f4 		! %f4  = 00000000 00000000
!	%l4 = 0000024780000000, %l6 = 9b58bb0fcd491776, %l0 = 79b755028f0539be
	subc	%l4,%l6,%l0		! %l0 = 64a74737b2b6e889
!	%l5 = 0000061cffe5ec4c, %l7 = 70e607582ae4c3a8, %y  = 70e60d75
	smul	%l5,%l7,%l4		! %l4 = fffba176fd90f5e0

p3_label_86:
!	%f12 = 0aaad28a 00000000, %f16 = abece394 f3857129
	fcmpd	%fcc0,%f12,%f16		! %fcc0 = 2
!	%f5  = 00000000, %f8  = 3a800000
	fabss	%f5 ,%f8 		! %f8  = 00000000
	set	p3_b106,%o7
	fblg,a,pn %fcc0,p3_near_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001d800008] = ffffffff, %l1 = ffffffffd3c12984
	ldswa	[%i3+%o6]0x80,%l1	! %l1 = ffffffffffffffff
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x06a,%g2
p3_b106:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000061cfff7fffe
!	%l1  = 0000000000000000
!	%l2  = 000000004772f3fa
	bcc	p3_b107			! Branch Taken, %ccr = 08, CWP = 0

p3_label_87:
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetch [%o4+0x040],1
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x06b,%g2
p3_b107:
	membar	#Sync			! Added by membar checker (639)
!	%l0 = 0000061cfff7fffe, %l7 = 70e607582ae4c3a8, %l0 = 0000061cfff7fffe
	taddcc	%l0,%l7,%l0		! %l0 = 70e60d752adcc3a6, %ccr = 03
!	%f8  = 00000000, %f30 = 00000000 00000000
	fstox	%f8 ,%f30		! %f30 = 00000000 00000000
!	Mem[000000001c000000] = ffffffff, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffff
	bcs	p3_b108			! Branch Taken, %ccr = 03, CWP = 0

p3_label_88:
!	%l3 = 70e60d752acaaff4, Mem[000000001c800000] = b0eda04112c08ba0
	stxa	%l3,[%i1+%g0]0x80	! Mem[000000001c800000] = 70e60d752acaaff4
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x06c,%g2
p3_b108:
	membar	#Sync			! Added by membar checker (640)
!	%f26 = 41d1aa87 a0400000, %f4  = 00000000 00000000
	fdtox	%f26,%f4 		! %f4  = 00000000 46aa1e81
!	%l1 = ffffffffffffffff
	sethi	%hi(0x10be0c00),%l1	! %l1 = 0000000010be0c00
!	Mem[000000001c000100] = b0eda041, %l2 = 000000004772f3fa
	swap	[%i0+0x100],%l2		! %l2 = 00000000b0eda041
!	%l3 = 70e60d752acaaff4, immed = 000003a2, %l6 = 9b58bb0fcd491776
	sub	%l3,0x3a2,%l6		! %l6 = 70e60d752acaac52

p3_label_89:
!	%f2  = 2415470d 73857129, %f20 = 00000000 00000000, %f2  = 2415470d 73857129
	fsubd	%f2 ,%f20,%f2 		! %f2  = 2415470d 73857129
!	%f8  = 00000000 00000000, %f30 = 00000000 00000000
	fxtod	%f8 ,%f30		! %f30 = 00000000 00000000
	fbn,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001d800000] = d3c12984, %l6 = 70e60d752acaac52
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000d3c1
p3_b109:
	membar	#Sync			! Added by membar checker (641)
!	%l4 = fffba176fd90f5e0, immed = 00000008, %l2 = 00000000b0eda041
	srax	%l4,0x008,%l2		! %l2 = fffffba176fd90f5

p3_label_90:
!	%l7 = 70e607582ae4c3a8, %l3 = 70e60d752acaaff4, %l7 = 70e607582ae4c3a8
	xnor	%l7,%l3,%l7		! %l7 = fffff5d2ffd193a3
	fbn,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l7 = fffff5d2ffd193a3, Mem[000000001c0000d3] = 5ce7f491
	stb	%l7,[%i0+0x0d3]		! Mem[000000001c0000d0] = 5ce7f4a3
p3_b110:
	membar	#Sync			! Added by membar checker (642)
!	%l4 = fffba176fd90f5e0, immed = 00000be6, %l0 = 70e60d752adcc3a6
	xor	%l4,0xbe6,%l0		! %l0 = fffba176fd90fe06
	set	p3_b111,%o7
	fblg,a	p3_far_1_le	! Branch Taken, %fcc0 = 2

p3_label_91:
!	%l6 = 000000000000d3c1, Mem[000000001d000008] = 00000000ffffffff
	stxa	%l6,[%i2+%o6]0x80	! Mem[000000001d000008] = 000000000000d3c1
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x06f,%g2
p3_b111:
!	Registers modified during the branch to p3_far_1
!	%l0  = fffba793fd76ea52
	membar	#Sync			! Added by membar checker (643)
!	Mem[000000001d000000] = 70f1895d, %l6 = 000000000000d3c1
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000070
!	%l2 = fffffba176fd90f5, %l1 = 0000000010be0c00, %y  = 000002a4
	smulcc	%l2,%l1,%l7		! %l7 = 07c82ed4c8a17c00, %ccr = 08
!	Mem[0000000032000040] = 9270504b 0b09b218 061a0e3b 048983dc
	prefetcha [%o4+0x040]%asi,0
!	Mem[000000003180007c] = 2e6b4860, %l0 = fffba793fd76ea52
	ldsh	[%o3+0x07e],%l0		! %l0 = 0000000000004860

p3_label_92:
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001c8001a0] = 6fa51e4b 8b02f293 a6f4998a 5b1e9ccd
	prefetch [%i1+0x1a0],3
p3_b112:
	membar	#Sync			! Added by membar checker (644)
!	%l1 = 0000000010be0c00, Mem[000000001d000196] = 7ea21272
	stha	%l1,[%i2+0x196]%asi	! Mem[000000001d000194] = 7ea20c00
!	%f31 = 00000000, %f6  = 5b9db54b, %f31 = 00000000
	fsubs	%f31,%f6 ,%f31		! %f31 = db9db54b
!	%f0  = 00000000 20000000, %f4  = 00000000 46aa1e81
	fmovd	%f0 ,%f4 		! %f4  = 00000000 20000000

p3_label_93:
!	%l1 = 0000000010be0c00, immed = fffff5be, %y  = 07c82ed4
	sdivx	%l1,-0xa42,%l3		! %l3 = fffffffffffe5e2b
!	%l6 = 0000000000000070
	setx	0xcc36858acc36858a,%g7,%l6 ! %l6 = cc36858acc36858a
!	Mem[0000000032000060] = 2432adfc 73787542 036269f7 f75fc675
	prefetcha [%o4+0x060]%asi,2
!	%l1 = 0000000010be0c00, immed = 0000000f, %l5 = 0000061cffe5ec4c
	sra	%l1,0x00f,%l5		! %l5 = 000000000000217c
	fbu,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2

p3_label_94:
!	%l7 = 07c82ed4c8a17c00, Mem[000000001d800000] = d3c12984
	stba	%l7,[%i3+%g0]0x80	! Annulled
p3_b113:
	membar	#Sync			! Added by membar checker (645)
	set	p3_b114,%o7
	fba,pt	%fcc2,p3_near_3_he	! Branch Taken, %fcc2 = 2
!	Mem[000000001d000040] = ba50aa15 b0d035f7 b1c5fc57 2b2ba4a9
	prefetch [%i2+0x040],4
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x072,%g2
p3_b114:
!	Registers modified during the branch to p3_near_3
!	%l0  = 0000000000000000
!	%l3  = fffffba176fd8302
!	%l4  = a35e3893d8f88000
!	%l5  = 0000045e89026973
	membar	#Sync			! Added by membar checker (646)
!	%l2 = fffffba176fd90f5, immed = 00000007, %l1 = 0000000010be0c00
	sll	%l2,0x007,%l1		! %l1 = fffdd0bb7ec87a80
!	%f8  = 00000000 00000000, %f14 = 00000000
	fxtos	%f8 ,%f14		! %f14 = 00000000

p3_label_95:
!	Mem[000000001d000100] = 8f2ca876 ddbc5085 ef966a70 0c05d348
	prefetcha [%i2+0x100]%asi,21
	nop
!	Mem[000000001d000008] = 00000000, %l5 = 0000045e89026973
	lduba	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000000
	bne	p3_b115			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[000000001d8001bc] = 5c8f0329, %l3 = fffffba176fd8302
	ldstub	[%i3+0x1bc],%l3		! %l3 = 000000000000005c
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x073,%g2
p3_b115:

p3_label_96:
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001e800180] = 2ebfd4eb 5027316e 9165ddbe 41b9c204
	prefetch [%i5+0x180],23
p3_b116:
	membar	#Sync			! Added by membar checker (647)
!	%l7 = 07c82ed4c8a17c00, %l0 = 0000000000000000, %l7 = 07c82ed4c8a17c00
	add	%l7,%l0,%l7		! %l7 = 07c82ed4c8a17c00
!	%f31 = db9db54b, %f4  = 00000000 20000000
	fstod	%f31,%f4 		! %f4  = c373b6a9 60000000
!	%f11 = 00000000, %f14 = 00000000
	fabss	%f11,%f14		! %f14 = 00000000

p3_label_97:
!	Mem[000000003000007c] = 8d400007, %l1 = fffdd0bb7ec87a80
	ldub	[%o0+0x07e],%l1		! %l1 = 0000000000000000
!	Mem[0000000030800078] = da8b8a2c, %l1 = 0000000000000000
	ldsba	[%o1+0x07b]%asi,%l1	! %l1 = 000000000000002c
!	%f8  = 00000000, %f4  = c373b6a9 60000000
	fstox	%f8 ,%f4 		! %f4  = 00000000 00000000
!	%l0 = 0000000000000000, immed = 00000900, %y  = 07c82ed4
	umul	%l0,0x900,%l7		! %l7 = 0000000000000000
!	Mem[000000001d000104] = ddbc5085, %l5 = 0000000000000000
	ldsh	[%i2+0x104],%l5		! %l5 = ffffffffffffddbc

p3_label_98:
!	%f7  = 05dd5aa9, %f24 = 8aaad28a 14000000
	fitod	%f7 ,%f24		! %f24 = 4197756a a4000000
!	%f8  = 00000000, %f22 = c6ba1e81 65117880
	fstod	%f8 ,%f22		! %f22 = 00000000 00000000
!	%l3 = 000000000000005c, %l5 = ffffffffffffddbc, %l3 = 000000000000005c
	orncc	%l3,%l5,%l3		! %l3 = 000000000000225f, %ccr = 00
!	%f26 = 41d1aa87 a0400000, %f20 = 00000000
	fdtoi	%f26,%f20		! %f20 = 46aa1e81
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetcha [%o4+0x000]%asi,4

p3_label_99:
!	Mem[0000000030000070] = 00000000, %l5 = ffffffffffffddbc
	lduwa	[%o0+0x070]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001d800008] = ffffffff, %l5 = 0000000000000000
	swapa	[%i3+%o6]0x80,%l5	! %l5 = 00000000ffffffff
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetch [%o4+0x020],1
p3_b117:
	membar	#Sync			! Added by membar checker (648)
	fbu,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_100:
!	Mem[000000001c000000] = ffffffff, %l5 = 00000000ffffffff
	lduwa	[%i0+%g0]0x80,%l5	! Annulled
p3_b118:
	membar	#Sync			! Added by membar checker (649)
!	%f10 = 00000000, %f17 = f3857129
	fmovs	%f10,%f17		! %f17 = 00000000
!	Jump to jmpl_2, CWP = 0
	set	p3_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[000000001c000008] = fff4b3be, %l4 = a35e3893d8f88000
	lduwa	[%i0+%o6]0x80,%l4	! %l4 = 00000000fff4b3be
!	Mem[000000001c800120] = 8d2cdb59 81fa271c 16f69414 3d80a886
	prefetcha [%i1+0x120]%asi,1

p3_label_101:
!	%l7 = 0000000000000000, %l5 = 00000000ffffffff, %l4 = 00000000fff4b3be
	addc	%l7,%l5,%l4		! %l4 = 00000000ffffffff

	ba,a	p3_not_taken_0_end
p3_not_taken_0:
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba,a	p3_branch_failed
p3_not_taken_0_end:

!	Mem[0000000032000020] = 7db3e0b2 c3eb7d51 8d04cd02 e27389fa
	prefetcha [%o4+0x020]%asi,20
!	Mem[000000001e800000] = cd9f325c 50020baa, %l4 = ffffffff, %l5 = ffffffff
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000cd9f325c 0000000050020baa
!	Mem[000000001d8001c0] = bdc89386 7a06f357 58531db4 e0a52279
	prefetch [%i3+0x1c0],20
!	%l5 = 0000000050020baa, immed = ffffff1e, %l4 = 00000000cd9f325c
	andncc	%l5,-0x0e2,%l4		! %l4 = 00000000000000a0, %ccr = 00

p3_label_102:
!	%l1 = 000000000000002c, %l3 = 000000000000225f, %l7 = 0000000000000000
	taddcc	%l1,%l3,%l7		! %l7 = 000000000000228b, %ccr = 02
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[000000001d8000a0] = 68013e6f fa0c51e8 2ed61bd9 ab4ef710
	prefetch [%i3+0x0a0],1
p3_b119:
	membar	#Sync			! Added by membar checker (650)
!	%f10 = 00000000, %f14 = 00000000, %f19 = 85dd5aa9
	fsubs	%f10,%f14,%f19		! %f19 = 00000000
	set	p3_b120,%o7
	fbuge,a	p3_far_3_le	! Branch Taken, %fcc0 = 2

p3_label_103:
!	Mem[000000001d00006c] = 88e91804, %l2 = fffffba176fd90f5
	ldsh	[%i2+0x06e],%l2		! %l2 = 0000000000001804
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x078,%g2
p3_b120:
!	Registers modified during the branch to p3_far_3
!	%l1  = ffffffffffffddcd
	membar	#Sync			! Added by membar checker (651)
!	%f8  = 00000000, %f28 = 00000000
	fitos	%f8 ,%f28		! %f28 = 00000000
	nop
!	%l3 = 000000000000225f, %l2 = 0000000000001804, %l4 = 00000000000000a0
	addc	%l3,%l2,%l4		! %l4 = 0000000000003a63
!	%l7 = 000000000000228b, immed = 00000017, %l6 = cc36858acc36858a
	sll	%l7,0x017,%l6		! %l6 = 0000001145800000

p3_label_104:
!	%l4 = 0000000000003a63, %l6 = 0000001145800000, %l2 = 0000000000001804
	subc	%l4,%l6,%l2		! %l2 = ffffffeeba803a63
!	%f22 = 00000000 00000000, %f12 = 0aaad28a 00000000, %f22 = 00000000 00000000
	fdivd	%f22,%f12,%f22		! %f22 = 00000000 00000000
!	Mem[000000001c8001c0] = c2f489ba 5625e69a 34865722 076fe620
	prefetcha [%i1+0x1c0]%asi,20
!	Mem[0000000030800038] = 34b39964, %l4 = 0000000000003a63
	ldsba	[%o1+0x03a]%asi,%l4	! %l4 = ffffffffffffff99
	nop

p3_label_105:
!	%l1 = ffffffffffffddcd, immed = fffffe72, %l3 = 000000000000225f
	andcc	%l1,-0x18e,%l3		! %l3 = ffffffffffffdc40, %ccr = 88
!	%l0 = 0000000000000000, immed = 0000023b, %y  = 00000000
	smulcc	%l0,0x23b,%l4		! %l4 = 0000000000000000, %ccr = 44
	set	p3_b121,%o7
	fbg	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	%l4 = 0000000000000000, Mem[000000001c000008] = fff4b3be07b80d07
	stxa	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = 0000000000000000
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x079,%g2
p3_b121:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (652)
!	%l7 = 000000000000228b, Mem[000000001c800000] = 70e60d75
	stba	%l7,[%i1+%g0]0x80	! Mem[000000001c800000] = 8be60d75

p3_label_106:
!	%l1 = 0000000000000000, %l7 = 000000000000228b, %l3 = ffffffffffffdc40
	sll	%l1,%l7,%l3		! %l3 = 0000000000000000
!	%l2 = ffffffeeba803a63, %l2 = ffffffeeba803a63, %l5 = 0000000050020baa
	subccc	%l2,%l2,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l0 = 0000000000000000, immed = fffff778, %l3 = 0000000000000000
	orcc	%l0,-0x888,%l3		! %l3 = fffffffffffff778, %ccr = 88
!	%l0 = 0000000000000000, immed = fffff5bb, %l2 = ffffffeeba803a63
	andcc	%l0,-0xa45,%l2		! %l2 = 0000000000000000, %ccr = 44
!	%f29 = 85dd5aa9, %f20 = 46aa1e81, %f12 = 0aaad28a 00000000
	fsmuld	%f29,%f20,%f12		! %f12 = b9a26312 8c8fa520

p3_label_107:
	set	p3_b122,%o7
	fbuge	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031000078] = 00000000, %l4 = 0000000000000000
	ldsw	[%o2+0x078],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x07a,%g2
p3_b122:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000000
	bge,a	p3_b123			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[000000001c000038] = 4c5265dd a204aad0, %l6 = 45800000, %l7 = 0000228b
	ldd	[%i0+0x038],%l6		! %l6 = 000000004c5265dd 00000000a204aad0
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x07b,%g2
p3_b123:
	membar	#Sync			! Added by membar checker (653)
!	%l5 = 0000000000000000, Mem[000000001d00018e] = a5801c27
	stb	%l5,[%i2+0x18e]		! Mem[000000001d00018c] = a5800027

p3_label_108:
!	%l2 = 0000000000000000, %l0 = 0000000000000000, %l1 = 0000000000000000
	subc	%l2,%l0,%l1		! %l1 = 0000000000000000
!	Mem[0000000030000078] = 000000cf, %l4 = 0000000000000000
	ldsw	[%o0+0x078],%l4		! %l4 = 00000000000000cf
!	Mem[0000000030800034] = 6009fb74, %l4 = 00000000000000cf
	lduwa	[%o1+0x034]%asi,%l4	! %l4 = 000000006009fb74
!	Mem[000000003000007c] = 8d400007, %l3 = fffffffffffff778
	lduba	[%o0+0x07c]%asi,%l3	! %l3 = 000000000000008d
!	%l7 = 00000000a204aad0, immed = 000003e5, %l7 = 00000000a204aad0
	andn	%l7,0x3e5,%l7		! %l7 = 00000000a204a810

p3_label_109:
	fbl,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001d000078] = 926b1b11, %l6 = 000000004c5265dd
	ldstub	[%i2+0x078],%l6		! %l6 = 0000000000000092
p3_b124:
	membar	#Sync			! Added by membar checker (654)
!	Mem[000000001c000160] = 13da0a12 12cd748e e19c5abe 87dde19b
	prefetcha [%i0+0x160]%asi,3
	set	p3_b125,%o7
	fbo,pn	%fcc3,p3_near_1_le	! Branch Taken, %fcc3 = 0
!	Mem[000000001d000000] = 70f1895d, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 0000000070f1895d
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x07d,%g2
p3_b125:
!	Registers modified during the branch to p3_near_1
!	%l1  = 2340000000000000
!	%l2  = 000000000000008d
!	%l5  = 0000000000000000

p3_label_110:
	membar	#Sync			! Added by membar checker (655)
	set	p3_b126,%o7
	fbo,pn	%fcc1,p3_near_2_he	! Branch Taken, %fcc1 = 1
!	Mem[000000003180007c] = 2e6b4860, %l4 = 000000006009fb74
	swap	[%o3+0x07c],%l4		! %l4 = 000000002e6b4860
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x07e,%g2
p3_b126:
!	Registers modified during the branch to p3_near_2
!	%l7  = fffffffffffff9fd
	membar	#Sync			! Added by membar checker (656)
!	Branch On Register, %l1 = 2340000000000000
	brnz,a,pt %l1,p3_b127		! Branch Taken
!	Mem[000000001d800008] = 0000000012c08ba0, %l2 = 000000000000008d
	ldxa	[%i3+%o6]0x80,%l2	! %l2 = 0000000012c08ba0
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x07f,%g2
p3_b127:
	membar	#Sync			! Added by membar checker (657)
!	Mem[000000003100007c] = 000000a6, %l4 = 000000002e6b4860
	swapa	[%o2+0x07c]%asi,%l4	! %l4 = 00000000000000a6

p3_label_111:
!	%f1  = 20000000, %f22 = 00000000, %f30 = 00000000 db9db54b
	nop
!	%f26 = 41d1aa87, %f22 = 00000000
	fabss	%f26,%f22		! %f22 = 41d1aa87
!	%l2 = 0000000012c08ba0
	setx	0x37c8948537c89485,%g7,%l2 ! %l2 = 37c8948537c89485
!	%l4 = 00000000000000a6
	sethi	%hi(0x62c76c00),%l4	! %l4 = 0000000062c76c00
	fbul,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_112:
!	%l2 = 37c89485, %l3 = 0000008d, Mem[000000001e800108] = 4799a06b d27793cd
	std	%l2,[%i5+0x108]	! Mem[000000001e800108] = 37c89485 0000008d
p3_b128:
	membar	#Sync			! Added by membar checker (658)
!	%f30 = 00000000, %f0  = 00000000, %f4  = 00000000 00000000
	fsmuld	%f30,%f0 ,%f4 		! %f4  = 00000000 00000000
!	%l0 = 0000000000000000, Mem[000000001c800024] = 939b5e64
	stwa	%l0,[%i1+0x024]%asi	! Mem[000000001c800024] = 00000000
!	%l3 = 000000000000008d, immed = 00000777, %l1 = 2340000000000000
	add	%l3,0x777,%l1		! %l1 = 0000000000000804
!	%l2 = 37c8948537c89485, %l2 = 37c8948537c89485, %y  = 00000000
	udivcc	%l2,%l2,%l1		! %l1 = 0000000000000001, %ccr = 00

p3_label_113:
!	%f25 = a4000000, %f12 = b9a26312 8c8fa520
	fitod	%f25,%f12		! %f12 = c1d70000 00000000
!	%l0 = 0000000000000000, Mem[0000000031800074] = 70f18a00
	stb	%l0,[%o3+0x074]		! Mem[0000000031800074] = 00f18a00
!	%l3 = 000000000000008d, %l5 = 0000000000000000, %l3 = 000000000000008d
	orncc	%l3,%l5,%l3		! %l3 = ffffffffffffffff, %ccr = 88
!	Mem[000000001c000178] = a5853e73, %l4 = 62c76c00, %l1 = 00000001
	add	%i0,0x178,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 00000000a5853e73
	fbe,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2

p3_label_114:
!	%l6 = 00000092, %l7 = fffff9fd, Mem[000000001d800008] = 00000000 12c08ba0
	stda	%l6,[%i3+%o6]0x80	! Mem[000000001d800008] = 00000092 fffff9fd
p3_b129:
	membar	#Sync			! Added by membar checker (659)
!	%l5 = 0000000000000000, Mem[000000001d800058] = e0840db85de75625
	stxa	%l5,[%i3+0x058]%asi	! Mem[000000001d800058] = 0000000000000000
!	%l7 = fffffffffffff9fd, %l6 = 0000000000000092, %l3 = ffffffffffffffff
	addcc	%l7,%l6,%l3		! %l3 = fffffffffffffa8f, %ccr = 88
!	%l7 = fffffffffffff9fd, immed = 000002c4, %l6 = 0000000000000092
	xorcc	%l7,0x2c4,%l6		! %l6 = fffffffffffffb39, %ccr = 88
!	Mem[000000001d000008] = 00000000, %l4 = 0000000062c76c00
	lduwa	[%i2+%o6]0x80,%l4	! %l4 = 0000000000000000

p3_label_115:
!	Mem[000000001c000008] = 00000000, %l5 = 0000000000000000
	lduha	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000
	fbu,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001e0000c4] = a77e0f87, %l2 = 37c8948537c89485
	ldsb	[%i4+0x0c4],%l2		! %l2 = ffffffffffffffa7
p3_b130:
	membar	#Sync			! Added by membar checker (660)
!	Mem[0000000032000020] = 7db3e0b2, %l1 = 00000000a5853e73
	lduw	[%o4+0x020],%g2		! %g2 = 00000000a5853e73
!	Branch On Register, %l3 = fffffffffffffa8f
	brnz,pt	%l3,p3_b131		! Branch Taken

p3_label_116:
!	%l6 = fffffffffffffb39, Mem[000000001d800000] = d3c12984
	stwa	%l6,[%i3+%g0]0x80	! Mem[000000001d800000] = fffffb39
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x083,%g2
p3_b131:
	membar	#Sync			! Added by membar checker (661)
!	Mem[000000001c000000] = ffffffff, %l2 = ffffffffffffffa7
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%f26 = 41d1aa87 a0400000, %f24 = 4197756a a4000000
	fcmped	%fcc1,%f26,%f24		! %fcc1 = 2
!	Mem[0000000030000078] = 000000cf8d400007, %l1 = 00000000a5853e73
	ldx	[%o0+0x078],%l1		! %l1 = 000000cf8d400007
!	%l5 = 0000000000000000, Mem[000000001c800050] = 80a90e6b8078ed80
	stx	%l5,[%i1+0x050]		! Mem[000000001c800050] = 0000000000000000

p3_label_117:
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l6 = fffffffffffffb39, Mem[000000001c800008] = a6f2ce64
	stha	%l6,[%i1+%o6]0x80	! Annulled
p3_b132:
	ble,a	p3_b133			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d000008] = 000000000000d3c1, %l1 = 000000cf8d400007
	ldxa	[%i2+%o6]0x80,%l1	! %l1 = 000000000000d3c1
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p3_branch_failed
	mov	0x085,%g2
p3_b133:
	membar	#Sync			! Added by membar checker (662)
!	%f8  = 00000000, %f8  = 00000000 00000000
	fstox	%f8 ,%f8 		! %f8  = 00000000 00000000

p3_label_118:
	set	p3_b134,%o7
	fba,a	p3_far_2_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000030000070] = 00000000, %l6 = fffffffffffffb39
	ldsw	[%o0+0x070],%l6		! Annulled
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x086,%g2
p3_b134:
!	Registers modified during the branch to p3_far_2
!	%l1  = fffffffffffff3fd
!	%l3  = ffffffffffffffff
!	%l5  = 000000000000d3c1
!	%l6  = fffffffffffff4f8
	membar	#Sync			! Added by membar checker (663)
!	Mem[0000000031800030] = e06db4e200f2ce64, %l1 = fffffffffffff3fd
	ldxa	[%o3+0x030]%asi,%l1	! %l1 = e06db4e200f2ce64
	set	p3_b135,%o7
	fba,a,pn %fcc2,p3_near_0_le	! Branch Taken, %fcc2 = 2
!	Mem[000000001d800000] = fffffb39, %l2 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l2	! Annulled
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x087,%g2
p3_b135:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l5  = ffffffffffff96ed

p3_label_119:
	membar	#Sync			! Added by membar checker (664)
!	%l2 = 00000000000000ff, immed = fffffe7b, %y  = 00000000
	sdivx	%l2,-0x185,%l7		! %l7 = 0000000000000000
!	%l6 = fffffffffffff4f8, immed = 00000ecf, %y  = 00000000
	udivcc	%l6,0xecf,%l7		! %l7 = 0000000000114989, %ccr = 00
	fbl,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d8000a0] = 68013e6f fa0c51e8 2ed61bd9 ab4ef710
	prefetch [%i3+0x0a0],16	! Annulled
p3_b136:
	membar	#Sync			! Added by membar checker (665)
!	%l0 = 0000000000000000, immed = fffff9e8, %y  = 00000000
	sdivx	%l0,-0x618,%l1		! %l1 = 0000000000000000

p3_label_120:
	bvc	p3_b137			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d00014c] = 37a68128, %l6 = fffffffffffff4f8
	lduw	[%i2+0x14c],%l6		! %l6 = 0000000037a68128
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x089,%g2
p3_b137:
	membar	#Sync			! Added by membar checker (666)
!	%l5 = ffffffffffff96ed, %l6 = 0000000037a68128, %l6 = 0000000037a68128
	subccc	%l5,%l6,%l6		! %l6 = ffffffffc85915c5, %ccr = 88
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l6 = c85915c5, %l7 = 00114989, Mem[000000001c000000] = ffffffff aa01727b
	stda	%l6,[%i0+%g0]0x80	! Annulled
p3_b138:

p3_label_121:
	membar	#Sync			! Added by membar checker (667)
!	%l1 = 0000000000000000, %l4 = 0000000000000000, %l2 = 00000000000000ff
	or	%l1,%l4,%l2		! %l2 = 0000000000000000
	set	p3_b139,%o7
	fba,pt	%fcc1,p3_near_3_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001d000000] = 00000000, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x08b,%g2
p3_b139:
!	Registers modified during the branch to p3_near_3
!	%l0  = 2931200000000000
!	%l3  = fffffffffffff20d
!	%l4  = 0000000000000000
!	%l5  = fffffffffffff986
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c0000e4] = 18b98ca5, %l6 = ffffffffc85915c5
	lduw	[%i0+0x0e4],%l6		! Annulled
p3_b140:

p3_label_122:
	membar	#Sync			! Added by membar checker (668)
!	Mem[000000001d0000a0] = c1df32fc, %l4 = 0000000000000000
	ldub	[%i2+0x0a1],%l4		! %l4 = 00000000000000df
!	Mem[000000003080003c] = aa9a9cff, %l0 = 2931200000000000
	lduwa	[%o1+0x03c]%asi,%l0	! %l0 = 00000000aa9a9cff
!	Mem[000000001d0001ec] = 5d3579fd, %l2 = 0000000000000000
	ldsba	[%i2+0x1ee]%asi,%l2	! %l2 = 0000000000000079
	fbn,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l4 = 00000000000000df, Mem[000000003180003d] = 70f1895d
	stb	%l4,[%o3+0x03d]		! Annulled
p3_b141:

p3_label_123:
	membar	#Sync			! Added by membar checker (669)
!	%f8  = 00000000 00000000, %f2  = 2415470d
	fxtos	%f8 ,%f2 		! %f2  = 00000000
!	%l1 = 0000000000000000, immed = 00000bd0, %l4 = 00000000000000df
	xor	%l1,0xbd0,%l4		! %l4 = 0000000000000bd0
!	%l6 = ffffffffc85915c5, %l1 = 0000000000000000, %l5 = fffffffffffff986
	xnorcc	%l6,%l1,%l5		! %l5 = 0000000037a6ea3a, %ccr = 00
!	%l2 = 0000000000000079, %l6 = ffffffffc85915c5, %y  = 00000000
	smul	%l2,%l6,%l7		! %l7 = ffffffe5b21b4a1d
	set	p3_b142,%o7
	fblg,a,pn %fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 2

p3_label_124:
!	Mem[000000001c8000d0] = 8d3581c3 c0ab4f61, %l4 = 00000bd0, %l5 = 37a6ea3a
	ldd	[%i1+0x0d0],%l4		! %l4 = 000000008d3581c3 00000000c0ab4f61
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x08e,%g2
p3_b142:
!	Registers modified during the branch to p3_near_1
!	%l1  = 8340000000000000
!	%l2  = 000000000000008d
!	%l5  = ffffffffffeddf00
	membar	#Sync			! Added by membar checker (670)
!	%l5 = ffffffffffeddf00, immed = fffffbba, %y  = ffffffff
	smulcc	%l5,-0x446,%l1		! %l1 = 000000004d790600, %ccr = 00
!	%l4 = 8d3581c3, %l5 = ffeddf00, Mem[000000001d800008] = 00000092 fffff9fd
	stda	%l4,[%i3+%o6]0x80	! Mem[000000001d800008] = 8d3581c3 ffeddf00
!	%l2 = 000000000000008d, %l0 = 00000000aa9a9cff, %l4 = 000000008d3581c3
	subc	%l2,%l0,%l4		! %l4 = ffffffff5565638e
	bpos	p3_b143			! Branch Taken, %ccr = 00, CWP = 0

p3_label_125:
!	Mem[000000001d000000] = 00000000, %l7 = ffffffe5b21b4a1d
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x08f,%g2
p3_b143:
	membar	#Sync			! Added by membar checker (671)
!	%f3  = 73857129, %f24 = 4197756a, %f30 = 00000000 db9db54b
	nop
	set	p3_b144,%o7
	fbo,pt	%fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001d000008] = 00000000, %l0 = 00000000aa9a9cff
	ldstuba	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x090,%g2
p3_b144:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l5  = 0000000000000000
!	%l7  = ffffffffc8591b68
	fbul	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_126:
!	%l1 = 000000004d790600, Mem[0000000030000074] = 000000ff
	sth	%l1,[%o0+0x074]		! Mem[0000000030000074] = 060000ff
p3_b145:
	membar	#Sync			! Added by membar checker (672)
!	Mem[000000001d800040] = 257a0bbe, %l2 = 000000000000008d
	lduwa	[%i3+0x040]%asi,%l2	! %l2 = 00000000257a0bbe
!	Branch On Register, %l0 = 0000000000000000
	brnz,a,pt %l0,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c800008] = a6f2ce64, %l6 = ffffffffc85915c5
	lduba	[%i1+%o6]0x80,%l6	! Annulled
p3_b146:
	membar	#Sync			! Added by membar checker (673)
!	%l7 = ffffffffc8591b68, %l2 = 00000000257a0bbe, %l4 = ffffffff5565638e
	taddcc	%l7,%l2,%l4		! %l4 = ffffffffedd32726, %ccr = 8a

p3_label_127:
!	%l2 = 00000000257a0bbe, %l0 = 0000000000000000, %y  = 00000000
	smul	%l2,%l0,%l4		! %l4 = 0000000000000000
!	Mem[000000001c800060] = cfba3c86 da77e73e 2bfbb310 e3d9d490
	prefetcha [%i1+0x060]%asi,3
!	Mem[000000001c000140] = c6314632 5d0a2eb8 eaa40ba8 55469705
	prefetcha [%i0+0x140]%asi,1
!	%l5 = 0000000000000000, immed = fffff1d1, %l6 = ffffffffc85915c5
	orncc	%l5,-0xe2f,%l6		! %l6 = 0000000000000e2e, %ccr = 00
!	Mem[000000001d800034] = 9b031171, %l0 = 0000000000000000
	ldsha	[%i3+0x034]%asi,%l0	! %l0 = ffffffffffff9b03

p3_label_128:
	bne	p3_b147			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d800000] = fffffb39, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x093,%g2
p3_b147:
	membar	#Sync			! Added by membar checker (674)
!	%l3 = fffffffffffff20d, immed = 00000aec, %l0 = ffffffffffff9b03
	sub	%l3,0xaec,%l0		! %l0 = ffffffffffffe721
!	Mem[000000001c800152] = d6a63b58, %l3 = fffffffffffff20d
	ldstuba	[%i1+0x152]%asi,%l3	! %l3 = 000000000000003b
	bcc,a	p3_b148			! Branch Taken, %ccr = 00, CWP = 0

p3_label_129:
!	Mem[000000001c800000] = 8be60d75, %l2 = 00000000257a0bbe
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 000000008be60d75
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p3_branch_failed
	mov	0x094,%g2
p3_b148:
	membar	#Sync			! Added by membar checker (675)
!	%l0 = ffffffffffffe721, Mem[000000001c800000] = 8be60d752acaaff4
	stxa	%l0,[%i1+%g0]0x80	! Mem[000000001c800000] = ffffffffffffe721
!	Mem[0000000030800078] = da8b8a2c, %l3 = 000000000000003b
	lduwa	[%o1+0x078]%asi,%l3	! %l3 = 00000000da8b8a2c
!	Mem[000000001d800000] = fffffb39, %l6 = 0000000000000e2e
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	%f10 = 00000000 00000000, %f26 = 41d1aa87 a0400000
	fmovd	%f10,%f26		! %f26 = 00000000 00000000

p3_label_130:
!	Mem[000000001c8000a4] = 025cfcb6, %l6 = ffffffffffffffff
	ldstuba	[%i1+0x0a4]%asi,%l6	! %l6 = 0000000000000002
!	Mem[000000001d800160] = c67a8c8a 4db9d1e2 96f84e3d 747ceafd
	prefetch [%i3+0x160],22
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	 Annulled
	ldd	[%o3+0x038],%l0
p3_b149:
	membar	#Sync			! Added by membar checker (676)
!	%f10 = 00000000, %f20 = 46aa1e81, %f23 = 00000000
	fsubs	%f10,%f20,%f23		! %f23 = c6aa1e81

p3_label_131:
!	%l6 = 0000000000000002, Mem[0000000032000040] = 9270504b0b09b218
	stx	%l6,[%o4+0x040]		! Mem[0000000032000040] = 0000000000000002
!	Mem[000000001c000008] = 00000000, %l2 = 000000008be60d75
	lduha	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c800000] = ffffffff ffffe721, %l0 = ffffe721, %l1 = 4d790600
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000ffffffff 00000000ffffe721
p3_b150:
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00

p3_label_132:
!	Mem[000000001c000130] = a65e6b0b, %l5 = 0000000000000000
	ldsh	[%i0+0x132],%l5		! Annulled
p3_b151:
	membar	#Sync			! Added by membar checker (677)
!	Branch On Register, %l2 = 0000000000000000
	brgz,pn	%l2,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d000080] = 037f0aeb 7d8fe67d e15ee5bd 0cbd55c5
	prefetch [%i2+0x080],1
p3_b152:
	ble	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d800000] = fffffb39 366c7d5a, %l4 = 0000ffff, %l5 = 00000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000fffffb39 00000000366c7d5a
p3_b153:

p3_label_133:
	membar	#Sync			! Added by membar checker (678)
!	Branch On Register, %l4 = 00000000fffffb39
	brz,a,pn %l4,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d800000] = fffffb39366c7d5a, %l4 = 00000000fffffb39
	ldxa	[%i3+%g0]0x80,%l4	! Annulled
p3_b154:
	set	p3_b155,%o7
	fblg,a	p3_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001d000170] = 27d98319, %l3 = 00000000da8b8a2c
	lduh	[%i2+0x170],%l3		! %l3 = 00000000000027d9
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x09b,%g2
p3_b155:
!	Registers modified during the branch to p3_far_0
!	%l4  = 0000000000000000
!	%l6  = c7a116d2dd2781ee
!	%l7  = f000000000000000
	set	p3_b156,%o7
	fblg	p3_far_2_le	! Branch Taken, %fcc0 = 2

p3_label_134:
!	Mem[000000001d000141] = 24eb407f, %l5 = 00000000366c7d5a
	ldstub	[%i2+0x141],%l5		! %l5 = 00000000000000eb
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x09c,%g2
p3_b156:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (679)
!	%f14 = 00000000 00000000, %f6  = 5b9db54b 05dd5aa9
	fabsd	%f14,%f6 		! %f6  = 00000000 00000000
!	%f30 = 00000000, %f22 = 41d1aa87
	fabss	%f30,%f22		! %f22 = 00000000
!	Mem[000000001d800008] = 8d3581c3 ffeddf00, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i3+%o6]0x80,%l0	! %l0 = 000000008d3581c3 00000000ffeddf00
!	%f2  = 00000000 73857129, %f20 = 46aa1e81 00000000
	fnegd	%f2 ,%f20		! %f20 = 80000000 73857129

p3_label_135:
	bge	p3_b157			! Branch Taken, %ccr = 00, CWP = 0
!	%l3 = 00000000000027d9, Mem[000000001c000000] = ffffffff
	stha	%l3,[%i0+%g0]0x80	! Mem[000000001c000000] = 27d9ffff
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x09d,%g2
p3_b157:
	ba,a	p3_b158			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000030800078] = da8b8a2c, %l0 = 000000008d3581c3
	swap	[%o1+0x078],%l0		! Annulled
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x09e,%g2
p3_b158:
	membar	#Sync			! Added by membar checker (680)
!	%f7  = 00000000, %f10 = 00000000 00000000
	fstox	%f7 ,%f10		! %f10 = 00000000 00000000

p3_label_136:
	fbul,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i3+%g0]0x80,%l2
p3_b159:
	membar	#Sync			! Added by membar checker (681)
	set	p3_b160,%o7
	fbug,pt	%fcc1,p3_near_3_le	! Branch Taken, %fcc1 = 2
!	Mem[000000001d80008c] = a07cd32c, %l5 = 00000000000000eb
	ldub	[%i3+0x08c],%l5		! %l5 = 00000000000000a0
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0a0,%g2
p3_b160:
!	Registers modified during the branch to p3_near_3
!	%l1  = 0000000000000002
!	%l2  = 000000008d358163
!	%l6  = ffffffffffffff5f
	membar	#Sync			! Added by membar checker (682)
!	%l1 = 0000000000000002
	sethi	%hi(0x365de000),%l1	! %l1 = 00000000365de000

p3_label_137:
!	Mem[000000001c800140] = 000000f2 ffffcd01 d922273d fef5e183
	prefetch [%i1+0x140],3
!	%l3 = 00000000000027d9, Mem[000000001d8001a8] = dc671e4e
	sth	%l3,[%i3+0x1a8]		! Mem[000000001d8001a8] = 27d91e4e
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l7 = f000000000000000, Mem[000000001d800008] = 8d3581c3
	stwa	%l7,[%i3+%o6]0x80	! Mem[000000001d800008] = 00000000
p3_b161:
	fbu,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_138:
!	%l0 = 8d3581c3, %l1 = 365de000, Mem[000000001d800000] = fffffb39 366c7d5a
	stda	%l0,[%i3+%g0]0x80	! Annulled
p3_b162:
	membar	#Sync			! Added by membar checker (683)
!	%l6 = ffffffffffffff5f, %l6 = ffffffffffffff5f, %y  = 00000000
	sdivcc	%l6,%l6,%l5		! %l5 = fffffffffe68f1b2, %ccr = 88
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c800008] = a6f2ce64, %l7 = f000000000000000
	lduba	[%i1+%o6]0x80,%l7	! Annulled
p3_b163:
	set	p3_b164,%o7
	fbuge,a	p3_far_0_le	! Branch Taken, %fcc0 = 2

p3_label_139:
!	Mem[000000001e800008] = 5a1df783, %l1 = 00000000365de000
	lduha	[%i5+%o6]0x80,%l1	! %l1 = 0000000000005a1d
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0a4,%g2
p3_b164:
!	Registers modified during the branch to p3_far_0
!	%l4  = fe68e8f4fb3ac7da
	membar	#Sync			! Added by membar checker (684)
!	%l1 = 0000000000005a1d, %l5 = fffffffffe68f1b2, %l5 = fffffffffe68f1b2
	sub	%l1,%l5,%l5		! %l5 = 000000000197686b
!	%l3 = 00000000000027d9, immed = 00000c9b, %l5 = 000000000197686b
	add	%l3,0xc9b,%l5		! %l5 = 0000000000003474
!	Mem[0000000032000060] = 2432adfc 73787542 036269f7 f75fc675
	prefetcha [%o4+0x060]%asi,1
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_140:
!	Mem[000000001c000000] = 27d9ffff aa01727b 00000000 00000000
	prefetch [%i0+0x000],22
p3_b165:
	membar	#Sync			! Added by membar checker (685)
!	%l6 = ffffffffffffff5f, %l2 = 000000008d358163, %l7 = f000000000000000
	orncc	%l6,%l2,%l7		! %l7 = ffffffffffffffdf, %ccr = 88
!	%l5 = 0000000000003474, %l4 = fe68e8f4fb3ac7da, %l4 = fe68e8f4fb3ac7da
	xnorcc	%l5,%l4,%l4		! %l4 = 0197170b04c50c51, %ccr = 00
!	Mem[000000001c80019c] = 7d5c2f1f, %l1 = 0000000000005a1d
	ldsh	[%i1+0x19c],%l1		! %l1 = 0000000000007d5c
!	%f8  = 00000000 00000000, %f16 = abece394 00000000, %f12 = c1d70000 00000000
	fdivd	%f8 ,%f16,%f12		! %f12 = 80000000 00000000

p3_label_141:
!	Mem[000000001c8001e0] = e57aea21 2d90b078 19346410 82322faf
	prefetch [%i1+0x1e0],1
	bg,a	p3_b166			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d000008] = ff000000 0000d3c1, %l2 = 8d358163, %l3 = 000027d9
	ldda	[%i2+%o6]0x80,%l2	! %l2 = 00000000ff000000 000000000000d3c1
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0a6,%g2
p3_b166:
	membar	#Sync			! Added by membar checker (686)
!	%l2 = 00000000ff000000, immed = 0000003a, %l7 = ffffffffffffffdf
	srax	%l2,0x03a,%l7		! %l7 = 0000000000000000
!	%f8  = 00000000 00000000, %f16 = abece394 00000000, %f24 = 4197756a a4000000
	faddd	%f8 ,%f16,%f24		! %f24 = abece394 00000000

p3_label_142:
!	Mem[000000001c800000] = ffffffff, %l5 = 0000000000003474
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffffff
	ba,a	p3_b167			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000030000034] = cd491776, %l7 = 0000000000000000
	lduh	[%o0+0x034],%l7		! Annulled
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0a7,%g2
p3_b167:
	membar	#Sync			! Added by membar checker (687)
!	%l1 = 0000000000007d5c, Mem[0000000030800078] = da8b8a2c5c60cdd4
	stx	%l1,[%o1+0x078]		! Mem[0000000030800078] = 0000000000007d5c
	bvc,a	p3_b168			! Branch Taken, %ccr = 00, CWP = 0

p3_label_143:
!	Mem[000000001c000170] = c663c165 97d9c76e, %l6 = ffffff5f, %l7 = 00000000
	ldd	[%i0+0x170],%l6		! %l6 = 00000000c663c165 0000000097d9c76e
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x0a8,%g2
p3_b168:
	membar	#Sync			! Added by membar checker (688)
!	%l1 = 0000000000007d5c, %l6 = 00000000c663c165, %l7 = 0000000097d9c76e
	add	%l1,%l6,%l7		! %l7 = 00000000c6643ec1
	set	p3_b169,%o7
	fbo,a	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	%l5 = ffffffffffffffff, Mem[000000001d800166] = 4db9d1e2
	sth	%l5,[%i3+0x166]		! Mem[000000001d800164] = 4db9ffff
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0a9,%g2
p3_b169:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000031
	membar	#Sync			! Added by membar checker (689)
!	%l2 = 00000000ff000000, %l7 = 00000000c6643ec1, %l6 = 00000000c663c165
	xnorcc	%l2,%l7,%l6		! %l6 = ffffffffc69bc13e, %ccr = 88

p3_label_144:
	set	p3_b170,%o7
	fbuge,pt %fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[000000001c800000] = ffffffff, %l2 = 00000000ff000000
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x0aa,%g2
p3_b170:
!	Registers modified during the branch to p3_near_2
!	%l7  = fffffffffffff9ff
	membar	#Sync			! Added by membar checker (690)
	set	p3_b171,%o7
	fblg,a,pn %fcc2,p3_near_0_he	! Branch Taken, %fcc2 = 2
!	Mem[0000000030000070] = 00000000060000ff, %l2 = 00000000000000ff
	ldx	[%o0+0x070],%l2		! %l2 = 00000000060000ff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x0ab,%g2
p3_b171:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l5  = 00000000ffffffff
!	%l7  = ffffffffc69bc6e1
!	call to call_2, CWP = 0
	call	p3_call_2_he

p3_label_145:
!	%l5 = 00000000ffffffff, Mem[000000001c000000] = 27d9ffff
	stwa	%l5,[%i0+%g0]0x80	! Mem[000000001c000000] = ffffffff
!	Registers modified during the branch to p3_call_2
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (691)
!	%l1 = 0000000000000031, %l4 = 0197170b04c50c51, %l0 = 0000000000000000
	tsubcc	%l1,%l4,%l0		! %l0 = fe68e8f4fb3af3e0, %ccr = 9b
!	%l4 = 0197170b04c50c51
	sethi	%hi(0xca2cb800),%l4	! %l4 = 00000000ca2cb800
!	Mem[000000001c0001e8] = 1196adc7 6856d863, %l6 = c69bc13e, %l7 = c69bc6e1
	ldd	[%i0+0x1e8],%l6		! %l6 = 000000001196adc7 000000006856d863
!	%f12 = 80000000 00000000, %f26 = 00000000
	fdtoi	%f12,%f26		! %f26 = 00000000

p3_label_146:
	fbl,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000030800070] = 59000000, %l7 = 000000006856d863
	ldsh	[%o1+0x070],%l7		! Annulled
p3_b172:
	membar	#Sync			! Added by membar checker (692)
!	Mem[000000001e800060] = 7143c996 805e7287 7045b8c9 4589e00f
	prefetch [%i5+0x060],4
!	%f12 = 80000000 00000000, %f10 = 00000000 00000000
	fnegd	%f12,%f10		! %f10 = 00000000 00000000
!	Mem[000000001d000000] = 00000000 a07c3a5c ff000000 0000d3c1
	prefetch [%i2+0x000],3

p3_label_147:
	fbl	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001f000020] = d6c3a7f1 c0228d18 5e52d7f3 08cb8e18
	prefetch [%i6+0x020],0
p3_b173:
	membar	#Sync			! Added by membar checker (693)
!	Mem[000000001d800080] = cc3554bf addb4289 fbfe936c a07cd32c
	prefetch [%i3+0x080],23
	set	p3_b174,%o7
	fbug,a	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	%l4 = 00000000ca2cb800, Mem[0000000032000056] = 66d0d1b4
	sth	%l4,[%o4+0x056]		! Mem[0000000032000054] = b800d1b4
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0ae,%g2
p3_b174:
!	Registers modified during the branch to p3_far_1
!	%l0  = fe68e8f4fb3af3e0

p3_label_148:
	membar	#Sync			! Added by membar checker (694)
!	%l7 = 000000006856d863, immed = 000004a6, %y  = fe68e8f4
	udivcc	%l7,0x4a6,%l6		! %l6 = 00000000ffffffff, %ccr = 0a
	fbue,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001d8001a0] = 00000000 00f2ce64 27d91e4e 5d192f65
	prefetch [%i3+0x1a0],3	! Annulled
p3_b175:
	membar	#Sync			! Added by membar checker (695)
!	%f9  = 00000000, %f17 = 00000000
	fcmpes	%fcc1,%f9 ,%f17		! %fcc1 = 0
!	%f26 = 00000000 00000000, %f24 = abece394 00000000, %f24 = abece394 00000000
	faddd	%f26,%f24,%f24		! %f24 = abece394 00000000

p3_label_149:
!	%l6 = 00000000ffffffff, Mem[000000003180007c] = 6009fb74
	stwa	%l6,[%o3+0x07c]%asi	! Mem[000000003180007c] = ffffffff
	set	p3_b176,%o7
	fba,a	p3_far_3_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001d000008] = ff000000, %l6 = 00000000ffffffff
	lduha	[%i2+%o6]0x80,%l6	! Annulled
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x0b0,%g2
p3_b176:
!	Registers modified during the branch to p3_far_3
!	%l3  = 0000000000000000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (696)
	set	p3_b177,%o7
	fbule,a,pn %fcc3,p3_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[000000001d000000] = 00000000a07c3a5c, %l1 = 0000000000000031
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = 00000000a07c3a5c
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0b1,%g2
p3_b177:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000009dba
!	%l5  = ffffffffffff96ed

p3_label_150:
	membar	#Sync			! Added by membar checker (697)
!	Mem[000000001c800100] = 28a760c8 8ac950eb e5c53169 31eef08f
	prefetch [%i1+0x100],20
!	%f20 = 80000000, %f14 = 00000000
	fabss	%f20,%f14		! %f14 = 00000000
	set	p3_b178,%o7
	fblg,a	p3_far_0_le	! Branch Taken, %fcc0 = 2
!	%l3 = 0000000000000000, Mem[0000000030000031] = 9b58bb0f
	stb	%l3,[%o0+0x031]		! Mem[0000000030000030] = 9b00bb0f
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0b2,%g2
p3_b178:
!	Registers modified during the branch to p3_far_0
!	%l4  = ffff8e22039bea11
	membar	#Sync			! Added by membar checker (698)
!	Mem[000000001d000000] = 00000000, %l5 = ffffffffffff96ed
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000

p3_label_151:
!	%l2 = 00000000060000ff, immed = 00000db7, %l2 = 00000000060000ff
	or	%l2,0xdb7,%l2		! %l2 = 0000000006000dff
!	%l7 = 0000000000000000
	setx	0xa0343142a0343142,%g7,%l7 ! %l7 = a0343142a0343142
!	%l1 = 00000000a07c3a5c, %l2 = 0000000006000dff, %y  = ffff8e22
	mulx	%l1,%l2,%l3		! %l3 = 03c2f22452b4cda4
	fbul	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c000110] = 871eb19961dcbd56, %l3 = 03c2f22452b4cda4
	ldx	[%i0+0x110],%l3		! %l3 = 871eb19961dcbd56
p3_b179:

p3_label_152:
	set	p3_b180,%o7
	fbug	p3_far_1_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001c800198] = dce10db87d5c2f1f, %l0 = 0000000000009dba
	ldx	[%i1+0x198],%l0		! %l0 = dce10db87d5c2f1f
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0b4,%g2
p3_b180:
!	Registers modified during the branch to p3_far_1
!	%l2  = 000000000000001e
!	%l3  = 7fffffff80000000
!	%l6  = ffffffffffffffb9
	membar	#Sync			! Added by membar checker (699)
!	%l2 = 000000000000001e, Mem[0000000032000050] = cd7b550b
	stw	%l2,[%o4+0x050]		! Mem[0000000032000050] = 0000001e
!	%l7 = a0343142a0343142, Mem[000000001d0001a4] = cfd6e259
	stba	%l7,[%i2+0x1a4]%asi	! Mem[000000001d0001a4] = 42d6e259
!	Mem[000000001d8000b0] = 9ea73f4d, %l3 = 7fffffff80000000
	ldub	[%i3+0x0b2],%l3		! %l3 = 000000000000003f

p3_label_153:
	set	p3_b181,%o7
	fbne,a	p3_far_2_he	! Branch Taken, %fcc0 = 2
!	%l3 = 000000000000003f, Mem[000000001d000120] = 290dc69c24a49fde
	stx	%l3,[%i2+0x120]		! Mem[000000001d000120] = 000000000000003f
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x0b5,%g2
p3_b181:
!	Registers modified during the branch to p3_far_2
!	%l1  = fffffffffffffafd
!	%l3  = dce17c6581383af1
!	%l5  = 00000000a07c3a5c
!	%l6  = a0343142a0342c3d
	membar	#Sync			! Added by membar checker (700)
!	Mem[000000001c00007c] = c5dc0bb4, %l1 = fffffffffffffafd
	swap	[%i0+0x07c],%l1		! %l1 = 00000000c5dc0bb4
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l1 = 00000000c5dc0bb4, Mem[0000000030800030] = 7d9cca876009fb74
	stx	%l1,[%o1+0x030]		! Annulled
p3_b182:

p3_label_154:
	ble	p3_b183			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001c0000a8] = 8f03185d, %l3 = dce17c6581383af1
	ldsh	[%i0+0x0aa],%l3		! %l3 = 000000000000185d
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x0b7,%g2
p3_b183:
	membar	#Sync			! Added by membar checker (701)
!	Mem[000000001c00014c] = 55469705, %l1 = 00000000c5dc0bb4
	ldstuba	[%i0+0x14c]%asi,%l1	! %l1 = 0000000000000055
!	Mem[000000001c0000d8] = 103fc6f006f185f9, %l0 = dce10db87d5c2f1f
	ldx	[%i0+0x0d8],%l0		! %l0 = 103fc6f006f185f9
	set	p3_b184,%o7
	fbge,a,pn %fcc3,p3_near_3_le	! Branch Taken, %fcc3 = 0

p3_label_155:
!	Mem[000000001d000180] = c9988dde 179aab2a 09afc4c9 a5800027
	prefetch [%i2+0x180],3
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p3_branch_failed
	mov	0x0b8,%g2
p3_b184:
!	Registers modified during the branch to p3_near_3
!	%l0  = 00000000ffff9222
!	%l1  = ffffffff80000000
!	%l6  = 0000000000000528
	membar	#Sync			! Added by membar checker (702)
!	%f25 = 00000000, %f16 = abece394, %f31 = db9db54b
	fadds	%f25,%f16,%f31		! %f31 = abece394
	bvc	p3_b185			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[000000001c000000] = ffffffff, %l0 = 00000000ffff9222
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ffffffff
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x0b9,%g2
p3_b185:
	membar	#Sync			! Added by membar checker (703)
!	%l6 = 0000000000000528, immed = 000006fa, %y  = ffff8e22
	smul	%l6,0x6fa,%l6		! %l6 = 000000000023f910

p3_label_156:
!	%l4 = ffff8e22039bea11, immed = fffff2b4, %l1 = ffffffff80000000
	tsubcc	%l4,-0xd4c,%l1		! %l1 = ffff8e22039bf75d, %ccr = 93
!	%f26 = 00000000 00000000, %f16 = abece394 00000000
	fnegd	%f26,%f16		! %f16 = 80000000 00000000
	ba,a	p3_b186			! Branch Taken, %ccr = 93, CWP = 0
!	Mem[0000000032000044] = 0002061a, %l2 = 000000000000001e
	lduh	[%o4+0x046],%g2		! Annulled
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0ba,%g2
p3_b186:
	membar	#Sync			! Added by membar checker (704)
!	Mem[0000000031000030] = d3c12984, %l5 = 00000000a07c3a5c
	ldsb	[%o2+0x032],%l5		! %l5 = 0000000000000029

p3_label_157:
!	%l0 = 00000000ffffffff, Mem[0000000031800032] = e06db4e2
	sth	%l0,[%o3+0x032]		! Mem[0000000031800030] = e06dffff
!	Mem[0000000031800030] = e06dffff, %l0 = 00000000ffffffff
	lduha	[%o3+0x032]%asi,%l0	! %l0 = 000000000000ffff
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d800008] = 00000000 ffeddf00, %l6 = 0023f910, %l7 = a0343142
	ldda	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000 00000000ffeddf00
p3_b187:
	bpos,a	p3_b188			! Branch Taken, %ccr = 93, CWP = 0

p3_label_158:
!	Mem[000000001f0000c0] = e6399f0a 66d7a83c 949b280c c86b258f
	prefetch [%i6+0x0c0],22
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x0bc,%g2
p3_b188:
	membar	#Sync			! Added by membar checker (705)
!	%l4 = ffff8e22039bea11, immed = fffff7ed, %l1 = ffff8e22039bf75d
	sub	%l4,-0x813,%l1		! %l1 = ffff8e22039bf224
!	Mem[0000000031000073] = df5b52a4, %l2 = 000000000000001e
	ldstub	[%o2+0x073],%l2		! %l2 = 00000000000000a4
	set	p3_b189,%o7
	fbuge	p3_far_2_he	! Branch Taken, %fcc0 = 2
!	%l0 = 0000ffff, %l1 = 039bf224, Mem[0000000030000078] = 000000cf 8d400007
	std	%l0,[%o0+0x078]	! Mem[0000000030000078] = 0000ffff 039bf224
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0bd,%g2
p3_b189:
!	Registers modified during the branch to p3_far_2
!	%l1  = fffffffffffff2fd
!	%l3  = 000071ddfc64ea11
!	%l5  = ffff8e22039bf24d
!	%l6  = 00000000ffedd9fa

p3_label_159:
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d8001e0] = 31623672 255dc7e1 6fb2b6f8 865c981c
	prefetch [%i3+0x1e0],1	! Annulled
p3_b190:
	membar	#Sync			! Added by membar checker (706)
!	%f18 = 00000000 00000000, %f22 = 00000000 c6aa1e81
	fnegd	%f18,%f22		! %f22 = 80000000 00000000
!	Mem[0000000030800078] = 0000000000007d5c, %l3 = 000071ddfc64ea11
	ldx	[%o1+0x078],%l3		! %l3 = 0000000000007d5c
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_160:
!	%l0 = 000000000000ffff, Mem[000000001c800094] = 585a8325
	stw	%l0,[%i1+0x094]		! Annulled
p3_b191:
	membar	#Sync			! Added by membar checker (707)
	set	p3_b192,%o7
	fbo,pt	%fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 0
!	Mem[000000001e800060] = 7143c996 805e7287 7045b8c9 4589e00f
	prefetch [%i5+0x060],1
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0c0,%g2
p3_b192:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l5  = 0000000000000000
!	%l7  = 00000000ffeddf9d
	bneg	p3_b193			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[000000001d800008] = 00000000, %l4 = ffff8e22039bea11
	swapa	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x0c1,%g2
p3_b193:

p3_label_161:
	membar	#Sync			! Added by membar checker (708)
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l2 = 00000000000000a4
	srlx	%l4,%l4,%l2		! %l2 = 0000000000000000
!	%f18 = 00000000, %f8  = 00000000 00000000
	fstox	%f18,%f8 		! %f8  = 00000000 00000000
	bg,a	p3_b194			! Branch Taken, %ccr = 0a, CWP = 0
!	%l3 = 0000000000007d5c, Mem[000000001d000000] = 00000000a07c3a5c
	stxa	%l3,[%i2+%g0]0x80	! Mem[000000001d000000] = 0000000000007d5c
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0c2,%g2
p3_b194:
	membar	#Sync			! Added by membar checker (709)
!	%l3 = 0000000000007d5c, %l1 = fffffffffffff2fd, %l7 = 00000000ffeddf9d
	orcc	%l3,%l1,%l7		! %l7 = fffffffffffffffd, %ccr = 88

p3_label_162:
!	%f26 = 00000000 00000000, %f24 = abece394 00000000, %f10 = 00000000 00000000
	fdivd	%f26,%f24,%f10		! %f10 = 80000000 00000000
!	Mem[000000001e000000] = ef48a3f7 4c779b77, %l2 = 00000000, %l3 = 00007d5c
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 00000000ef48a3f7 000000004c779b77
!	%l4 = 0000000000000000, Mem[0000000032000078] = 312807f3
	stba	%l4,[%o4+0x078]%asi	! Mem[0000000032000078] = 002807f3
	ble	p3_b195			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001c000008] = 00000000 00000000, %l2 = ef48a3f7, %l3 = 4c779b77
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x0c3,%g2
p3_b195:

p3_label_163:
	membar	#Sync			! Added by membar checker (710)
!	Denormal Floating Point Operation Nullified
	nop
!	%l0 = 0000000000000000, Mem[0000000030000070] = 00000000060000ff
	stx	%l0,[%o0+0x070]		! Mem[0000000030000070] = 0000000000000000
!	Mem[000000001d0001c0] = 6aa039f4 34edf5dd e831c0aa 13d0b898
	prefetch [%i2+0x1c0],22
!	%l5 = 0000000000000000, immed = 00000002, %l1 = fffffffffffff2fd
	srl	%l5,0x002,%l1		! %l1 = 0000000000000000
	fbe,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_164:
!	Mem[000000001c800008] = a6f2ce64, %l1 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l1	! %l1 = ffffffffa6f2ce64
p3_b196:
	membar	#Sync			! Added by membar checker (711)
!	%l2 = 0000000000000000, %l7 = fffffffffffffffd, %l0 = 0000000000000000
	xorcc	%l2,%l7,%l0		! %l0 = fffffffffffffffd, %ccr = 88
!	%f26 = 00000000 00000000, %f17 = 00000000
	fxtos	%f26,%f17		! %f17 = 00000000
!	Denormal Floating Point Operation Nullified
	nop
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_165:
!	%l5 = 0000000000000000, Mem[000000001d800000] = fffffb39
	stwa	%l5,[%i3+%g0]0x80	! Annulled
p3_b197:
	membar	#Sync			! Added by membar checker (712)
!	%l3 = 0000000000000000, %l5 = 0000000000000000, %y  = 00000000
	smulcc	%l3,%l5,%l1		! %l1 = 0000000000000000, %ccr = 44
!	Mem[000000003100007c] = 2e6b4860, %l5 = 0000000000000000
	lduwa	[%o2+0x07c]%asi,%l5	! %l5 = 000000002e6b4860
!	%l0 = fffffffffffffffd, %l2 = 0000000000000000, %l5 = 000000002e6b4860
	addcc	%l0,%l2,%l5		! %l5 = fffffffffffffffd, %ccr = 88
!	Mem[0000000030800038] = 34b39964, %l4 = 0000000000000000
	swapa	[%o1+0x038]%asi,%l4	! %l4 = 0000000034b39964

p3_label_166:
	fbule	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c0000ec] = 08df9586, %l5 = fffffffffffffffd
	ldub	[%i0+0x0ee],%l5		! %l5 = 0000000000000095
p3_b198:
	set	p3_b199,%o7
	fblg,a	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001c800000] = ffffffff, %l6 = 00000000ffedd9fa
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0c7,%g2
p3_b199:
!	Registers modified during the branch to p3_far_2
!	%l1  = 000000000000003f
	membar	#Sync			! Added by membar checker (713)
!	%f16 = 80000000, %f22 = 80000000 00000000
	fstod	%f16,%f22		! %f22 = 80000000 00000000

p3_label_167:
!	Branch On Register, %l6 = 00000000000000ff
	brgz,pn	%l6,p3_b200		! Branch Taken
!	Mem[000000001d8001e0] = 31623672 255dc7e1 6fb2b6f8 865c981c
	prefetch [%i3+0x1e0],4
!	The following code should not be executed
	fsubd	%f12,%f14,%f16
	stha	%l2,[%i2+0x0ae]%asi
	ldda	[%i6+0x098]%asi,%l0
	ba	p3_branch_failed
	mov	0x0c8,%g2
p3_b200:
	membar	#Sync			! Added by membar checker (714)
!	%f30 = 00000000, %f1  = 20000000, %f31 = abece394
	fsubs	%f30,%f1 ,%f31		! %f31 = a0000000
!	%f29 = 85dd5aa9, %f26 = 00000000
	fcmps	%fcc2,%f29,%f26		! %fcc2 = 1
!	Mem[000000001d000008] = ff0000000000d3c1, %l7 = fffffffffffffffd
	ldxa	[%i2+%o6]0x80,%l7	! %l7 = ff0000000000d3c1

p3_label_168:
	set	p3_b201,%o7
	fble,a,pt %fcc2,p3_near_1_le	! Branch Taken, %fcc2 = 1
!	Mem[000000001d000008] = ff000000, %l2 = 0000000000000000
	lduba	[%i2+%o6]0x80,%l2	! %l2 = 00000000000000ff
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0c9,%g2
p3_b201:
!	Registers modified during the branch to p3_near_1
!	%l1  = 0000000000000000
!	%l2  = 000000000000008d
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (715)
!	%l0 = fffffffffffffffd, immed = fffff129, %l5 = 0000000000000000
	taddcc	%l0,-0xed7,%l5		! %l5 = fffffffffffff126, %ccr = 9b
!	%l2 = 000000000000008d, %l4 = 0000000034b39964, %l7 = ff0000000000d3c1
	srlx	%l2,%l4,%l7		! %l7 = 0000000000000000
	set	p3_b202,%o7
	fbug,a	p3_far_0_he	! Branch Taken, %fcc0 = 2

p3_label_169:
!	Mem[0000000030800074] = 07b80d07, %l0 = fffffffffffffffd
	ldsw	[%o1+0x074],%l0		! %l0 = 0000000007b80d07
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0ca,%g2
p3_b202:
!	Registers modified during the branch to p3_far_0
!	%l4  = 0000000000000000
!	%l6  = 61dcbd56dd2781ee
!	%l7  = 00007b80d0700000
	membar	#Sync			! Added by membar checker (716)
	fblg,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l0 = 07b80d07, %l1 = 00000000, Mem[000000001d800008] = 039bea11 ffeddf00
	stda	%l0,[%i3+%o6]0x80	! Annulled
p3_b203:
	membar	#Sync			! Added by membar checker (717)
!	Mem[000000001c0000e0] = 1d642bf1 18b98ca5 1f0b5dca 08df9586
	prefetch [%i0+0x0e0],4
	fbule,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_170:
!	Mem[0000000030000030] = 9b00bb0f, %l5 = fffffffffffff126
	ldub	[%o0+0x033],%l5		! Annulled
p3_b204:
	membar	#Sync			! Added by membar checker (718)
!	Mem[000000001f000008] = d8dc1294, %l0 = 0000000007b80d07
	ldswa	[%i6+%o6]0x80,%l0	! %l0 = ffffffffd8dc1294
	fbl,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000031000038] = be2dbd60, %l5 = fffffffffffff126
	lduh	[%o2+0x038],%l5		! %l5 = 000000000000be2d
p3_b205:
	membar	#Sync			! Added by membar checker (719)
!	Branch On Register, %l7 = 00007b80d0700000
	brz,a,pn %l7,p3_not_taken_0	! Branch Not Taken

p3_label_171:
!	%l1 = 0000000000000000, Mem[0000000032000018] = 2d315b59f4eda5a4
	stx	%l1,[%o4+0x018]		! Annulled
p3_b206:
	membar	#Sync			! Added by membar checker (720)
!	%l2 = 000000000000008d, Mem[000000001d800000] = fffffb39366c7d5a
	stxa	%l2,[%i3+%g0]0x80	! Mem[000000001d800000] = 000000000000008d
!	Mem[000000001d0001a0] = 1a4ba3be 42d6e259 8648aafd 70f183ba
	prefetch [%i2+0x1a0],16
!	%f10 = 80000000 00000000, %f16 = 80000000 00000000
	fabsd	%f10,%f16		! %f16 = 00000000 00000000
!	%l0 = d8dc1294, %l1 = 00000000, Mem[0000000031000070] = df5b52ff 943f1913
	std	%l0,[%o2+0x070]	! Mem[0000000031000070] = d8dc1294 00000000

p3_label_172:
!	Mem[000000001d0000a0] = c1df32fc, %l3 = 0000000000000000
	lduh	[%i2+0x0a2],%l3		! %l3 = 00000000000032fc
!	%l7 = 00007b80d0700000, Mem[000000001d8000c0] = e7db1f3d
	stw	%l7,[%i3+0x0c0]		! Mem[000000001d8000c0] = d0700000
!	Mem[0000000031800030] = e06dffff, %l7 = 00007b80d0700000
	ldswa	[%o3+0x030]%asi,%l7	! %l7 = ffffffffe06dffff
!	Branch On Register, %l1 = 0000000000000000
	brlez,pt %l1,p3_b207		! Branch Taken
!	%l0 = ffffffffd8dc1294, Mem[000000001c800000] = ffffffff
	stha	%l0,[%i1+%g0]0x80	! Mem[000000001c800000] = 1294ffff
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x0cf,%g2
p3_b207:

p3_label_173:
	membar	#Sync			! Added by membar checker (721)
!	Mem[000000001c000008] = 00000000 00000000, %l6 = dd2781ee, %l7 = e06dffff
	ldda	[%i0+%o6]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	%l3 = 00000000000032fc, %l0 = ffffffffd8dc1294, %l4 = 0000000000000000
	or	%l3,%l0,%l4		! %l4 = ffffffffd8dc32fc
!	%l3 = 00000000000032fc, %l6 = 0000000000000000, %l6 = 0000000000000000
	tsubcc	%l3,%l6,%l6		! %l6 = 00000000000032fc, %ccr = 00
!	Mem[000000001d800158] = a3e05966, %l2 = 000000000000008d
	ldub	[%i3+0x15b],%l2		! %l2 = 0000000000000066
	set	p3_b208,%o7
	fbg,a	p3_far_2_le	! Branch Taken, %fcc0 = 2

p3_label_174:
!	Mem[0000000030000078] = 0000ffff, %l6 = 00000000000032fc
	swap	[%o0+0x078],%l6		! %l6 = 000000000000ffff
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0d0,%g2
p3_b208:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (722)
!	%l2 = 0000000000000066, immed = 00000dfe, %l0 = ffffffffd8dc1294
	subccc	%l2,0xdfe,%l0		! %l0 = fffffffffffff268, %ccr = 99
!	%l7 = 0000000000000000, Mem[000000001c00012a] = 3c7ca37c
	stha	%l7,[%i0+0x12a]%asi	! Mem[000000001c000128] = 3c7c0000
!	%l0 = fffffffffffff268, %l3 = 00000000000032fc, %y  = 00000000
	udiv	%l0,%l3,%l1		! %l1 = 0000000000050569
!	%l1 = 0000000000050569, immed = 0000001a, %l2 = 0000000000000066
	srlx	%l1,0x01a,%l2		! %l2 = 0000000000000000

p3_label_175:
!	Mem[000000001d800008] = 039bea11, %l2 = 0000000000000000
	ldstuba	[%i3+%o6]0x80,%l2	! %l2 = 0000000000000003
!	%l0 = fffffffffffff268, Mem[000000003000003c] = dd2781ee
	stw	%l0,[%o0+0x03c]		! Mem[000000003000003c] = fffff268
!	%f26 = 00000000, %f6  = 00000000
	fstoi	%f26,%f6 		! %f6  = 00000000
!	%l6 = 000000000000ffff, immed = fffffbca, %l5 = 000000000000be2d
	addcc	%l6,-0x436,%l5		! %l5 = 000000000000fbc9, %ccr = 11
!	%l4 = d8dc32fc, %l5 = 0000fbc9, Mem[000000001f000090] = 6c8df346 544cfe46
	stda	%l4,[%i6+0x090]%asi	! Mem[000000001f000090] = d8dc32fc 0000fbc9

p3_label_176:
!	%l6 = 000000000000ffff, Mem[0000000032000050] = 0000001eb1afb800
	stx	%l6,[%o4+0x050]		! Mem[0000000032000050] = 000000000000ffff
!	%f15 = 00000000, %f6  = 00000000, %f4  = 00000000 00000000
	fsmuld	%f15,%f6 ,%f4 		! %f4  = 00000000 00000000
!	%l0 = fffffffffffff268, Mem[000000001c800008] = a6f2ce646eee22b9
	stxa	%l0,[%i1+%o6]0x80	! Mem[000000001c800008] = fffffffffffff268
!	%l2 = 0000000000000003, immed = 00000c53, %y  = 00000000
	sdivx	%l2,0xc53,%l1		! %l1 = 0000000000000000
!	Mem[0000000031800075] = 00f18a00, %l2 = 0000000000000003
	ldstuba	[%o3+0x075]%asi,%l2	! %l2 = 00000000000000f1

p3_label_177:
	set	p3_b209,%o7
	fba,a	p3_far_2_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001d0000a0] = c1df32fc 5d12ff2e 944aa089 efb7ecd3
	prefetch [%i2+0x0a0],23	! Annulled
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0d1,%g2
p3_b209:
!	Registers modified during the branch to p3_far_2
!	%l1  = fffffffffffff0fd
!	%l3  = ffffffffd8dc3f6b
!	%l5  = 000000000000fbc9
!	%l6  = fffffffffffffafa
	membar	#Sync			! Added by membar checker (723)
	fbe,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001e000008] = 75541267, %l6 = fffffffffffffafa
	lduwa	[%i4+%o6]0x80,%l6	! Annulled
p3_b210:
	fbul	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_178:
!	Mem[0000000030800074] = 07b80d07, %l2 = 00000000000000f1
	lduw	[%o1+0x074],%l2		! %l2 = 0000000007b80d07
p3_b211:
	membar	#Sync			! Added by membar checker (724)
!	%f4  = 00000000 00000000, %f26 = 00000000
	fxtos	%f4 ,%f26		! %f26 = 00000000
!	%l2 = 0000000007b80d07, %l3 = ffffffffd8dc3f6b, %l5 = 000000000000fbc9
	taddcc	%l2,%l3,%l5		! %l5 = ffffffffe0944c72, %ccr = 8a
	bge,a	p3_b212			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[000000001d000100] = 8f2ca876 ddbc5085 ef966a70 0c05d348
	prefetch [%i2+0x100],21
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x0d4,%g2
p3_b212:

p3_label_179:
	set	p3_b213,%o7
	fblg	p3_far_0_he	! Branch Taken, %fcc0 = 2
!	%l6 = fffffffffffffafa, Mem[000000001d800008] = ff9bea11
	stwa	%l6,[%i3+%o6]0x80	! Mem[000000001d800008] = fffffafa
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0d5,%g2
p3_b213:
!	Registers modified during the branch to p3_far_0
!	%l4  = 0000000000000000
!	%l6  = 61dcbd56fffff268
!	%l7  = ffffffff26800000
	membar	#Sync			! Added by membar checker (725)
!	%l4 = 0000000000000000, %l1 = fffffffffffff0fd, %l7 = ffffffff26800000
	sllx	%l4,%l1,%l7		! %l7 = 0000000000000000
!	%f15 = 00000000, %f8  = 00000000
	fcmps	%fcc1,%f15,%f8 		! %fcc1 = 0
!	Mem[0000000031800030] = e06dffff, %l7 = 0000000000000000
	lduh	[%o3+0x030],%l7		! %l7 = 000000000000e06d

p3_label_180:
!	%l6 = 61dcbd56fffff268, %l3 = ffffffffd8dc3f6b, %y  = 00000000
	sdivcc	%l6,%l3,%l4		! %l4 = fffffffffffffffa, %ccr = 88
!	%l0 = fffffffffffff268
	setx	0x4cd2c46e4cd2c46e,%g7,%l0 ! %l0 = 4cd2c46e4cd2c46e
	ble,a	p3_b214			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d000020] = 4318ba3f a8ce74ce d18d7270 e6f4dc8a
	prefetch [%i2+0x020],4
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x0d6,%g2
p3_b214:
	membar	#Sync			! Added by membar checker (726)
	fble,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_181:
!	Mem[000000001d000038] = 6554a76a, %l5 = ffffffffe0944c72
	lduh	[%i2+0x038],%l5		! Annulled
p3_b215:
	bge,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d000180] = c9988dde 179aab2a 09afc4c9 a5800027
	prefetch [%i2+0x180],22	! Annulled
p3_b216:
	membar	#Sync			! Added by membar checker (727)
!	%f30 = 00000000, %f13 = 00000000
	fnegs	%f30,%f13		! %f13 = 80000000
	set	p3_b217,%o7
	fbo	p3_far_3_le	! Branch Taken, %fcc0 = 2

p3_label_182:
!	Mem[000000001d800000] = 00000000, %l0 = 4cd2c46e4cd2c46e
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0d9,%g2
p3_b217:
!	Registers modified during the branch to p3_far_3
!	%l1  = 000000002723b192
	ble	p3_b218			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000003000007c] = 039bf224, %l1 = 000000002723b192
	ldsw	[%o0+0x07c],%l1		! %l1 = 00000000039bf224
!	The following code should not be executed
	bl	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0da,%g2
p3_b218:
	membar	#Sync			! Added by membar checker (728)
!	Mem[000000001d000150] = 0aba2b70, %l2 = 0000000007b80d07
	lduh	[%i2+0x152],%l2		! %l2 = 0000000000002b70
	set	p3_b219,%o7
	fbge,pn	%fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 0

p3_label_183:
!	Mem[000000001c800000] = 1294ffff, %l2 = 0000000000002b70
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000012
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x0db,%g2
p3_b219:
!	Registers modified during the branch to p3_near_1
!	%l1  = 000000000000e06f
!	%l6  = 61dcbd56fffff068
	membar	#Sync			! Added by membar checker (729)
!	Branch On Register, %l4 = fffffffffffffffa
	brgez,pt %l4,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d800000] = 00000000, %l5 = ffffffffe0944c72
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
p3_b220:
	membar	#Sync			! Added by membar checker (730)
!	%f22 = 80000000 00000000, %f16 = 00000000 00000000
	fabsd	%f22,%f16		! %f16 = 00000000 00000000
!	%l4 = fffffffffffffffa, %l6 = 61dcbd56fffff068, %l4 = fffffffffffffffa
	subccc	%l4,%l6,%l4		! %l4 = 9e2342a900000f92, %ccr = 80

p3_label_184:
!	%l4 = 9e2342a900000f92, Mem[000000001c000085] = 5b2310cb
	stb	%l4,[%i0+0x085]		! Mem[000000001c000084] = 5b9210cb
	fbue,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l6 = 61dcbd56fffff068, Mem[000000001e8000c0] = 2b9d266938ebab60
	stx	%l6,[%i5+0x0c0]		! Annulled
p3_b221:
	membar	#Sync			! Added by membar checker (731)
!	%l2 = 0000000000000012, immed = 000009cc, %l4 = 9e2342a900000f92
	add	%l2,0x9cc,%l4		! %l4 = 00000000000009de
!	%l0 = 00000000, %l1 = 0000e06f, Mem[000000001d000008] = ff000000 0000d3c1
	stda	%l0,[%i2+%o6]0x80	! Mem[000000001d000008] = 00000000 0000e06f

p3_label_185:
!	%l4 = 00000000000009de, %l2 = 0000000000000012, %y  = 00000000
	smulcc	%l4,%l2,%l7		! %l7 = 000000000000b19c, %ccr = 00
!	Mem[000000001c800026] = 00000000, %l4 = 00000000000009de
	ldstub	[%i1+0x026],%l4		! %l4 = 0000000000000000
!	Mem[0000000032000040] = 00000000 00000002 061a0e3b 048983dc
	prefetch [%o4+0x040],1
!	%f22 = 80000000 00000000, %f18 = 00000000 00000000
	fnegd	%f22,%f18		! %f18 = 00000000 00000000
!	Mem[000000001d000008] = 000000000000e06f, %l1 = 000000000000e06f
	ldxa	[%i2+%o6]0x80,%l1	! %l1 = 000000000000e06f

p3_label_186:
!	%l4 = 0000000000000000, %l6 = 61dcbd56fffff068, %l3 = ffffffffd8dc3f6b
	subc	%l4,%l6,%l3		! %l3 = 9e2342a900000f98
	fbule,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000030000071] = 00000000, %l6 = 61dcbd56fffff068
	ldstub	[%o0+0x071],%l6		! Annulled
p3_b222:
	membar	#Sync			! Added by membar checker (732)
	fbule,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l6 = fffff068, %l7 = 0000b19c, Mem[000000001c800000] = 1294ffff ffffe721
	stda	%l6,[%i1+%g0]0x80	! Annulled
p3_b223:

p3_label_187:
	bcc,a	p3_b224			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c800050] = 00000000, %l4 = 0000000000000000
	lduh	[%i1+0x052],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p3_branch_failed
	mov	0x0e0,%g2
p3_b224:
	membar	#Sync			! Added by membar checker (733)
!	Mem[000000001d000000] = 00000000, %l7 = 000000000000b19c
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
	fbn,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000001d800100] = d4552007 720e9d93 00000000 00010429
	prefetch [%i3+0x100],3
p3_b225:

p3_label_188:
	membar	#Sync			! Added by membar checker (734)
	fbul,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000032000000] = 237580e8 c2bb115b b745e7a8 7b393a14
	prefetch [%o4+0x000],3
p3_b226:
	membar	#Sync			! Added by membar checker (735)
!	%l6 = 61dcbd56fffff068, %l1 = 000000000000e06f, %l4 = 0000000000000000
	addc	%l6,%l1,%l4		! %l4 = 61dcbd570000d0d7
!	Mem[000000001f0001a0] = 718885eb c3f0eafb 8b404f4f 6db5b228
	prefetch [%i6+0x1a0],22
!	%l7 = 0000000000000000, immed = 00000ec0, %l4 = 61dcbd570000d0d7
	add	%l7,0xec0,%l4		! %l4 = 0000000000000ec0

p3_label_189:
!	Mem[000000001d800000] = 00000000, %l6 = 61dcbd56fffff068
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l1 = 000000000000e06f, Mem[000000001d800148] = 3c7bbded
	sth	%l1,[%i3+0x148]		! Mem[000000001d800148] = e06fbded
p3_b227:
	membar	#Sync			! Added by membar checker (736)
!	%l5 = 0000000000000000, immed = 000000ed, %l1 = 000000000000e06f
	tsubcc	%l5,0x0ed,%l1		! %l1 = ffffffffffffff13, %ccr = 9b
!	%l2 = 0000000000000012, %l6 = 0000000000000000, %y  = 00000000
	umul	%l2,%l6,%l7		! %l7 = 0000000000000000

p3_label_190:
!	Denormal Floating Point Operation Nullified
	nop
!	%l7 = 0000000000000000, immed = 00000006, %l4 = 0000000000000ec0
	srax	%l7,0x006,%l4		! %l4 = 0000000000000000
!	%f19 = 00000000, %f8  = 00000000, %f2  = 00000000 73857129
	nop
!	Mem[000000001c8001a0] = 6fa51e4b 8b02f293 a6f4998a 5b1e9ccd
	prefetch [%i1+0x1a0],4
!	Mem[000000001d000020] = 4318ba3f a8ce74ce d18d7270 e6f4dc8a
	prefetch [%i2+0x020],20

p3_label_191:
	fbue,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l4 = 0000000000000000, Mem[000000001c80016c] = 44279113
	stw	%l4,[%i1+0x16c]		! Annulled
p3_b228:
	membar	#Sync			! Added by membar checker (737)
!	Branch On Register, %l7 = 0000000000000000
	brz,a,pn %l7,p3_b229		! Branch Taken
!	Mem[000000001c8000a4] = ff5cfcb6, %l2 = 0000000000000012
	ldsh	[%i1+0x0a6],%l2		! %l2 = fffffffffffffcb6
!	The following code should not be executed
	bgu,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x0e5,%g2
p3_b229:
	membar	#Sync			! Added by membar checker (738)
	nop

p3_label_192:
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[000000001d800080] = cc3554bf addb4289 fbfe936c a07cd32c
	prefetch [%i3+0x080],0	! Annulled
p3_b230:
	bgu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000030000074] = 00000000, %l7 = 0000000000000000
	swap	[%o0+0x074],%l7		! Annulled
p3_b231:
	membar	#Sync			! Added by membar checker (739)
!	%l4 = 0000000000000000, %l0 = 0000000000000000, %y  = 00000000
	smul	%l4,%l0,%l2		! %l2 = 0000000000000000

p3_label_193:
!	Mem[000000003100007c] = 2e6b4860, %l0 = 0000000000000000
	ldsba	[%o2+0x07d]%asi,%l0	! %l0 = 000000000000006b
	set	p3_b232,%o7
	fbo	p3_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001d800008] = fffffafa, %l0 = 000000000000006b
	lduha	[%i3+%o6]0x80,%l0	! %l0 = 000000000000ffff
!	The following code should not be executed
	nop
	fadds	%f1,%f16,%f31
	ba	p3_branch_failed
	mov	0x0e8,%g2
p3_b232:
!	Registers modified during the branch to p3_far_3
!	%l1  = 61dcbd56ffffef7a
	bcc	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000030000078] = 000032fc, %l7 = 0000000000000000
	swap	[%o0+0x078],%l7		! %l7 = 00000000000032fc
p3_b233:

p3_label_194:
	membar	#Sync			! Added by membar checker (740)
!	Mem[0000000031800030] = e06dffff, %l5 = 0000000000000000
	lduba	[%o3+0x031]%asi,%l5	! %l5 = 000000000000006d
!	Mem[000000003100007c] = 2e6b4860, %l7 = 00000000000032fc
	ldswa	[%o2+0x07c]%asi,%l7	! %l7 = 000000002e6b4860
	bneg,a	p3_b234			! Branch Taken, %ccr = 9b, CWP = 0
!	Mem[000000001d000164] = cab808bf, %l5 = 000000000000006d
	ldsh	[%i2+0x166],%l5		! %l5 = 00000000000008bf
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p3_branch_failed
	mov	0x0ea,%g2
p3_b234:
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_195:
!	Mem[000000003000003c] = fffff268, %l6 = 0000000000000000
	swap	[%o0+0x03c],%l6		! Annulled
p3_b235:
	membar	#Sync			! Added by membar checker (741)
!	%l7 = 000000002e6b4860, %l5 = 00000000000008bf, %l2 = 0000000000000000
	sra	%l7,%l5,%l2		! %l2 = 0000000000000000
!	Mem[0000000030800030] = 7d9cca876009fb74, %l5 = 00000000000008bf
	ldxa	[%o1+0x030]%asi,%l5	! %l5 = 7d9cca876009fb74
	set	p3_b236,%o7
	fble,a,pt %fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 0
!	Mem[000000001d80015c] = 499079db, %l4 = 0000000000000000
	ldub	[%i3+0x15c],%l4		! %l4 = 0000000000000049
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0ec,%g2
p3_b236:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l5  = 0000000000000000
!	%l7  = 00000000000005a3

p3_label_196:
	set	p3_b237,%o7
	fba	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	%l3 = 9e2342a900000f98, Mem[0000000031800078] = 048ca6ffffffffff
	stx	%l3,[%o3+0x078]		! Mem[0000000031800078] = 9e2342a900000f98
!	The following code should not be executed
	nop
	fbge	p0_not_taken_0
	fdtox	%f28,%f10
	fdtoi	%f24,%f1
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x0ed,%g2
p3_b237:
!	Registers modified during the branch to p3_far_2
!	%l1  = 0000000000000000
	fbue,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d800008] = fffffafa, %l0 = 0000000000000000
	ldswa	[%i3+%o6]0x80,%l0	! Annulled
p3_b238:
	membar	#Sync			! Added by membar checker (742)
	fbn,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0

p3_label_197:
!	Mem[000000001d000000] = 0000b19c, %l2 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l2	! Annulled
p3_b239:
	membar	#Sync			! Added by membar checker (743)
!	%f31 = a0000000, %f22 = 80000000
	fabss	%f31,%f22		! %f22 = 20000000
!	Mem[000000001e000008] = 75541267 9bc64c4a, %l4 = 00000049, %l5 = 00000000
	ldda	[%i4+%o6]0x80,%l4	! %l4 = 0000000075541267 000000009bc64c4a
	bne,a	p3_b240			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[0000000031800034] = 00f2ce64, %l7 = 00000000000005a3
	ldsb	[%o3+0x035],%l7		! %l7 = fffffffffffffff2
!	The following code should not be executed
	fqtos	%f4,%f9
	stwa	%l4,[%i0+0x080]%asi
	bvs,a	p0_not_taken_0
	fabss	%f2,%f7
	call	p0_not_taken_0
	umul	%l0,%l0,%l0
	ldsba	[%o2+0x008]%asi,%l7
	ldswa	[%i3+0x0b8]%asi,%l4
	ba	p3_branch_failed
	mov	0x0f0,%g2
p3_b240:

p3_label_198:
	set	p3_b241,%o7
	fba	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001d000000] = 0000b19c, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 000000000000b19c
!	The following code should not be executed
	nop
	nop
	nop
	nop
	nop
	nop
	fabsd	%f18,%f4
	ba	p3_branch_failed
	mov	0x0f1,%g2
p3_b241:
!	Registers modified during the branch to p3_far_2
!	%l1  = 000000000000003f
	membar	#Sync			! Added by membar checker (744)
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %l3 = 9e2342a900000f98
	srax	%l0,%l0,%l3		! %l3 = 0000000000000000
!	%l3 = 0000000000000000, %l0 = 0000000000000000, %l1 = 000000000000003f
	xorcc	%l3,%l0,%l1		! %l1 = 0000000000000000, %ccr = 44
!	%l3 = 0000000000000000, Mem[0000000030800070] = 5900000007b80d07
	stx	%l3,[%o1+0x070]		! Mem[0000000030800070] = 0000000000000000

p3_label_199:
!	%f29 = 85dd5aa9, %f18 = 00000000, %f21 = 73857129
	fadds	%f29,%f18,%f21		! %f21 = 85dd5aa9
!	%f30 = 00000000 a0000000, %f10 = 80000000 00000000
	fmovd	%f30,%f10		! %f10 = 00000000 a0000000
!	%l5 = 000000009bc64c4a, Mem[000000001d000000] = 00000000
	stha	%l5,[%i2+%g0]0x80	! Mem[000000001d000000] = 4c4a0000
!	%f16 = 00000000 00000000, %f4  = 00000000 00000000, %f26 = 00000000 00000000
	faddd	%f16,%f4 ,%f26		! %f26 = 00000000 00000000
!	%l5 = 000000009bc64c4a, immed = 00000e5d, %y  = 00000000
	smul	%l5,0xe5d,%l4		! %l4 = fffffa606f35c2e2

p3_label_200:
!	%f16 = 00000000, %f20 = 80000000, %f3  = 73857129
	fmuls	%f16,%f20,%f3 		! %f3  = 80000000
!	%f18 = 00000000, %f30 = 00000000
	fnegs	%f18,%f30		! %f30 = 80000000
	bge,a	p3_b242			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[000000001d800060] = b1296e70 f0e2ff44 7276960a a0de31da
	prefetch [%i3+0x060],3
!	The following code should not be executed
	nop
	nop
	srl	%l0,0x00d,%l0
	sra	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0f2,%g2
p3_b242:
	membar	#Sync			! Added by membar checker (745)
!	Mem[000000001c000020] = b9505e3c 0dd2731c 4a0a5799 0000004c
	prefetch [%i0+0x020],2

!	End of Random Code for Processor 3

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x00c]		! Set processor 3 done flag

!	Check Registers

p3_check_registers:
	set	p3_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be fffffa606f35c2e2
	bne,a,pn %xcc,p3_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000009bc64c4a
	bne,a,pn %xcc,p3_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be fffffffffffffff2
	bne,a,pn %xcc,p3_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xfffffa60,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p3_failed
	mov	0x111,%g1

!	Check Floating Point Registers

p3_check_fp_registers:
	set	p3_temp,%g1
	set	p3_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 00000000 20000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 80000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 a0000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 80000000 80000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 80000000 85dd5aa9
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 20000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be abece394 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 85dd5aa9
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 80000000 a0000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p3_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ffffffffaa01727b
	ldx	[%i0+0x000],%g3		! Observed data at 000000001c000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000000000
	ldx	[%i0+0x008],%g3		! Observed data at 000000001c000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 4a0a57990000004c
	ldx	[%i0+0x028],%g3		! Observed data at 000000001c000028
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 0000000000000031
	ldx	[%i0+0x070],%g3		! Observed data at 000000001c000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 6b1cfe82fffffafd
	ldx	[%i0+0x078],%g3		! Observed data at 000000001c000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x080],%g2		! Expect data = 86ea224f5b9210cb
	ldx	[%i0+0x080],%g3		! Observed data at 000000001c000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 5ce7f4a3b127a715
	ldx	[%i0+0x0d0],%g3		! Observed data at 000000001c0000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x100],%g2		! Expect data = 4772f3fa1e6225b9
	ldx	[%i0+0x100],%g3		! Observed data at 000000001c000100
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 1599b1c16eee22b9
	ldx	[%i0+0x120],%g3		! Observed data at 000000001c000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 3c7c0000135743a3
	ldx	[%i0+0x128],%g3		! Observed data at 000000001c000128
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x148],%g2		! Expect data = eaa40ba8ff469705
	ldx	[%i0+0x148],%g3		! Observed data at 000000001c000148
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x148,%g4

	set	p3_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 1294ffffffffe721
	ldx	[%i1+0x000],%g3		! Observed data at 000000001c800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fffffffffffff268
	ldx	[%i1+0x008],%g3		! Observed data at 000000001c800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 525dca4b0000ff00
	ldx	[%i1+0x020],%g3		! Observed data at 000000001c800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 0000000000000000
	ldx	[%i1+0x050],%g3		! Observed data at 000000001c800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 6710ea33ff5cfcb6
	ldx	[%i1+0x0a0],%g3		! Observed data at 000000001c8000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = bf861c0f00000000
	ldx	[%i1+0x0b8],%g3		! Observed data at 000000001c8000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 54a0f20aff57c8d5
	ldx	[%i1+0x0e0],%g3		! Observed data at 000000001c8000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x140],%g2		! Expect data = 000000f2ffffcd01
	ldx	[%i1+0x140],%g3		! Observed data at 000000001c800140
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x150],%g2		! Expect data = d6a6ff58b546509c
	ldx	[%i1+0x150],%g3		! Observed data at 000000001c800150
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x190],%g2		! Expect data = f43d6e878a00eb6e
	ldx	[%i1+0x190],%g3		! Observed data at 000000001c800190
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x198],%g2		! Expect data = dce10db87d5c2f1f
	ldx	[%i1+0x198],%g3		! Observed data at 000000001c800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x198,%g4

	set	p3_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 4c4a000000007d5c
	ldx	[%i2+0x000],%g3		! Observed data at 000000001d000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 000000000000e06f
	ldx	[%i2+0x008],%g3		! Observed data at 000000001d000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 98cc47a32f2f2f20
	ldx	[%i2+0x030],%g3		! Observed data at 000000001d000030
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x078],%g2		! Expect data = ff6b1b114cf5918e
	ldx	[%i2+0x078],%g3		! Observed data at 000000001d000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 000000000000003f
	ldx	[%i2+0x120],%g3		! Observed data at 000000001d000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 61ffc0162f1cb10f
	ldx	[%i2+0x128],%g3		! Observed data at 000000001d000128
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x140],%g2		! Expect data = 24ff407fef102693
	ldx	[%i2+0x140],%g3		! Observed data at 000000001d000140
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x188],%g2		! Expect data = 09afc4c9a5800027
	ldx	[%i2+0x188],%g3		! Observed data at 000000001d000188
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x188,%g4
	ldx	[%g1+0x190],%g2		! Expect data = 0711b46b7ea20c00
	ldx	[%i2+0x190],%g3		! Observed data at 000000001d000190
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = 1a4ba3be42d6e259
	ldx	[%i2+0x1a0],%g3		! Observed data at 000000001d0001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 8648aafd70f183ba
	ldx	[%i2+0x1a8],%g3		! Observed data at 000000001d0001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1e0],%g2		! Expect data = 0000000000000000
	ldx	[%i2+0x1e0],%g3		! Observed data at 000000001d0001e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e0,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 76fd90f50000225f
	ldx	[%i2+0x1f8],%g3		! Observed data at 000000001d0001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f8,%g4

	set	p3_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 000000000000008d
	ldx	[%i3+0x000],%g3		! Observed data at 000000001d800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fffffafaffeddf00
	ldx	[%i3+0x008],%g3		! Observed data at 000000001d800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x058],%g3		! Observed data at 000000001d800058
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 0000ff0070f1895d
	ldx	[%i3+0x098],%g3		! Observed data at 000000001d800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = d070000051986add
	ldx	[%i3+0x0c0],%g3		! Observed data at 000000001d8000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 0000000000010429
	ldx	[%i3+0x108],%g3		! Observed data at 000000001d800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x148],%g2		! Expect data = e06fbdedae80f4e1
	ldx	[%i3+0x148],%g3		! Observed data at 000000001d800148
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x160],%g2		! Expect data = c67a8c8a4db9ffff
	ldx	[%i3+0x160],%g3		! Observed data at 000000001d800160
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x198],%g2		! Expect data = b2ca5bebc00053e0
	ldx	[%i3+0x198],%g3		! Observed data at 000000001d800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = 0000000000f2ce64
	ldx	[%i3+0x1a0],%g3		! Observed data at 000000001d8001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 27d91e4e5d192f65
	ldx	[%i3+0x1a8],%g3		! Observed data at 000000001d8001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = 956c5caaff8f0329
	ldx	[%i3+0x1b8],%g3		! Observed data at 000000001d8001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b8,%g4

	set	p3_local4_expect,%g1
	ldx	[%g1+0x098],%g2		! Expect data = 0000000070f1895d
	ldx	[%i4+0x098],%g3		! Observed data at 000000001e000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = be79061dc6fbe145
	ldx	[%i4+0x0c8],%g3		! Observed data at 000000001e0000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c8,%g4

	set	p3_local5_expect,%g1
	ldx	[%g1+0x108],%g2		! Expect data = 37c894850000008d
	ldx	[%i5+0x108],%g3		! Observed data at 000000001e800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x108,%g4

	set	p3_local6_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00231f0fc3e57800
	ldx	[%i6+0x000],%g3		! Observed data at 000000001f000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x090],%g2		! Expect data = d8dc32fc0000fbc9
	ldx	[%i6+0x090],%g3		! Observed data at 000000001f000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x110],%g2		! Expect data = 000000006eee22b9
	ldx	[%i6+0x110],%g3		! Observed data at 000000001f000110
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x110,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p3_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p3_memcheck_share0:
	ldx	[%g4+0x30],%g2	! Expected value = 9b00bb0fcd491776
	ldx	[%o0+0x30],%g3	! Read value at Mem[0000000030000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 61dcbd56fffff268
	ldx	[%o0+0x38],%g3	! Read value at Mem[0000000030000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 0000000000000000
	ldx	[%o0+0x70],%g3	! Read value at Mem[0000000030000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 00000000039bf224
	ldx	[%o0+0x78],%g3	! Read value at Mem[0000000030000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p3_memcheck_share1:
	ldx	[%g4+0x30],%g2	! Expected value = 7d9cca876009fb74
	ldx	[%o1+0x30],%g3	! Read value at Mem[0000000030800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 00000000aa9a9cff
	ldx	[%o1+0x38],%g3	! Read value at Mem[0000000030800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 0000000000000000
	ldx	[%o1+0x70],%g3	! Read value at Mem[0000000030800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 0000000000007d5c
	ldx	[%o1+0x78],%g3	! Read value at Mem[0000000030800078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p3_memcheck_share2:
	ldx	[%g4+0x30],%g2	! Expected value = d3c129845c2604bd
	ldx	[%o2+0x30],%g3	! Read value at Mem[0000000031000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = be2dbd603cdf831e
	ldx	[%o2+0x38],%g3	! Read value at Mem[0000000031000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = d8dc129400000000
	ldx	[%o2+0x70],%g3	! Read value at Mem[0000000031000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 000000002e6b4860
	ldx	[%o2+0x78],%g3	! Read value at Mem[0000000031000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p3_memcheck_share3:
	ldx	[%g4+0x30],%g2	! Expected value = e06dffff00f2ce64
	ldx	[%o3+0x30],%g3	! Read value at Mem[0000000031800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 00000000000005a3
	ldx	[%o3+0x38],%g3	! Read value at Mem[0000000031800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = b0eda04100ff8a00
	ldx	[%o3+0x70],%g3	! Read value at Mem[0000000031800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 9e2342a900000f98
	ldx	[%o3+0x78],%g3	! Read value at Mem[0000000031800078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

!	The test for processor 3 has passed

p3_passed:
	ta	GOOD_TRAP
	nop

p3_reg_l0_fail:
	or	%g0,0xbd0,%g1
	ba,a	p3_failed
p3_reg_l1_fail:
	or	%g0,0xbd1,%g1
	ba,a	p3_failed
p3_reg_l2_fail:
	or	%g0,0xbd2,%g1
	ba,a	p3_failed
p3_reg_l3_fail:
	or	%g0,0xbd3,%g1
	ba,a	p3_failed
p3_reg_l4_fail:
	or	%g0,0xbd4,%g1
	ba,a	p3_failed
p3_reg_l5_fail:
	or	%g0,0xbd5,%g1
	ba,a	p3_failed
p3_reg_l6_fail:
	or	%g0,0xbd6,%g1
	ba,a	p3_failed
p3_reg_l7_fail:
	or	%g0,0xbd7,%g1
	ba,a	p3_failed
p3_freg_fail:
	mov	%l0,%g3
	ba	p3_failed
	mov	%l1,%g2


!	The test for processor 3 failed

p3_failed:
	set	done_flags,%g1
	mov	3,%g5
	st	%g5,[%g1+0x00c]		! Set processor 3 done flag

	set	p3_temp,%g6
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop


!	The local area data for processor 3 failed

p3_local_failed:
	set	done_flags,%g5
	mov	3,%g6
	st	%g5,[%g5+0x00c]		! Set processor 3 done flag

	set	p3_temp,%g6
	add	%g1,%g4,%g1
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	ta	BAD_TRAP
	nop

p3_dfill_failed:
	ba	p3_failed
	mov	0xddd,%g1

p3_selfmod_failed:
	ba	p3_failed
	mov	0xabc,%g1


p3_common_error:
	or	%g0,0xee3,%g1
	ba	p3_failed
	mov	%o5,%g3
p3_branch_failed:
	mov	0xbbb,%g1
	rd	%ccr,%g2
	ba	p3_failed
	mov	0x0,%g3

p3_trap1e:
	smulcc	%l7,0xb83,%l4
	prefetch [%i3+0x1e0],21
	done

p3_trap1o:
	smulcc	%l7,0xb83,%l4
	prefetch [%o3+0x1e0],21
	done


p3_trap2e:
	prefetch [%i0+0x1c0],20
	addc	%l1,%l0,%l0
	done

p3_trap2o:
	prefetch [%o0+0x1c0],20
	addc	%l1,%l0,%l0
	done


p3_dispatch_failed:
	set	p3_temp,%g7
	set	0xbad3ccdd,%g1
	st	%g1,[%g7]
	ta	BAD_TRAP
	nop

p3_xintr_cnt_failed:
	set	p3_temp,%g7
	set	0xbad3ccee,%g1
	st	%g1,[%g7]
	st	%g2,[%g7+4]		! Expected count
	st	%g3,[%g7+8]		! Observed count
	ta	BAD_TRAP
	nop

!	Cross Processor Interrupt Handler

cross_intr_handler:
	membar	#Sync
!	Re-enable interrupts and return
9:	stxa	%g0,[%g0]ASI_INTR_RECEIVE
	membar	#Sync
	retry


p3_init_memory_pointers:
	set	p3_init_registers,%g1
	mov	%g0,%g4
	mov	%g0,%g5
	mov	%g0,%g6
	mov	%g0,%g7

!	Initialize memory pointers for window 0
	set	p3_local0_start,%i0
	set	p3_local1_start,%i1
	set	p3_local2_start,%i2
	set	p3_local3_start,%i3
	set	p3_local4_start,%i4
	set	p3_local5_start,%i5
	set	p3_local6_start,%i6
	mov	%g0,%i7
!	Init Local Registers in Window 0
	ldx	[%g1+0x000],%l0	! %l0 = 1c6e58005a6dce29
	ldx	[%g1+0x008],%l1	! %l1 = 6c13680047951c44
	ldx	[%g1+0x010],%l2	! %l2 = 8709b8ffc8954bbf
	ldx	[%g1+0x018],%l3	! %l3 = b2160cffc7a116d2
	ldx	[%g1+0x020],%l4	! %l4 = 9ac8ce0021ca2f2f
	ldx	[%g1+0x028],%l5	! %l5 = 08730d001bdcbf30
	ldx	[%g1+0x030],%l6	! %l6 = b8dd29001599b1c1
	ldx	[%g1+0x038],%l7	! %l7 = e668f1ffc8617870

!	Initialize the output register of window 0
	set	share0_start,%o0
	set	share1_start,%o1
	set	share2_start,%o2
	set	share3_start,%o3
	set	unres0_start,%o4
	set	common_start,%o5
	mov	0x08,%o6

	retl
	nop

user_text_end:
	.seg	"text"
	.align	0x2000
user_near0_start:
p0_near_0_le:
	xorcc	%l7,%l3,%l7
	addccc	%l2,-0x133,%l0
	jmpl	%o7,%g0
	umulcc	%l1,%l3,%l0
p0_near_0_lo:
	xorcc	%l7,%l3,%l7
	addccc	%l2,-0x133,%l0
	jmpl	%o7,%g0
	umulcc	%l1,%l3,%l0
p0_near_0_he:
	jmpl	%o7,%g0
	xnor	%l6,-0x0de,%l0
p0_near_0_ho:
	jmpl	%o7,%g0
	xnor	%l6,-0x0de,%l0
p1_near_0_le:
	orn	%l4,%l1,%l0
	prefetch [%i3+0x180],20
	prefetch [%i3+0x180],2
	jmpl	%o7,%g0
	udivx	%l0,-0xfa3,%l2
p1_near_0_lo:
	orn	%l4,%l1,%l0
	prefetch [%o3+0x180],20
	prefetch [%o3+0x180],2
	jmpl	%o7,%g0
	udivx	%l0,-0xfa3,%l2
p1_near_0_he:
	prefetch [%i1+0x140],2
	bge	near1_b2b_h
	xnorcc	%l0,%l1,%l7
	jmpl	%o7,%g0
	sdivcc	%l2,0x2a8,%l3
p1_near_0_ho:
	prefetch [%o1+0x140],2
	bge	near1_b2b_h
	xnorcc	%l0,%l1,%l7
	jmpl	%o7,%g0
	sdivcc	%l2,0x2a8,%l3
p2_near_0_le:
	lduw	[%o2+0x068],%l1		! Mem[0000000031000068]
	prefetch [%i0+0x020],23
	bvs	far1_b2b_l
	sdiv	%l0,0x26d,%l0
	jmpl	%o7,%g0
	udivcc	%l2,-0xcc8,%l3
p2_near_0_lo:
	lduw	[%i2+0x068],%l1		! Mem[0000000031000068]
	prefetch [%o0+0x020],23
	bvs	far1_b2b_l
	sdiv	%l0,0x26d,%l0
	jmpl	%o7,%g0
	udivcc	%l2,-0xcc8,%l3
p2_near_0_he:
	ldx	[%i2+0x178],%l6		! Mem[0000000019000178]
	srlx	%l3,0x03f,%l0
	prefetch [%i0+0x060],23
	add	%l5,0x747,%l4
	jmpl	%o7,%g0
	orn	%l1,-0x031,%l5
p2_near_0_ho:
	ldx	[%o2+0x178],%l6		! Mem[0000000019000178]
	srlx	%l3,0x03f,%l0
	prefetch [%o0+0x060],23
	add	%l5,0x747,%l4
	jmpl	%o7,%g0
	orn	%l1,-0x031,%l5
p3_near_0_le:
	taddcc	%l4,%l4,%l5
	prefetch [%i3+0x120],2
	ldsh	[%i3+0x050],%l5		! Mem[000000001d800050]
	jmpl	%o7,%g0
	udivcc	%l2,0x9bd,%l0
p3_near_0_lo:
	taddcc	%l4,%l4,%l5
	prefetch [%o3+0x120],2
	ldsh	[%o3+0x050],%l5		! Mem[000000001d800050]
	jmpl	%o7,%g0
	udivcc	%l2,0x9bd,%l0
p3_near_0_he:
	ldx	[%o1+0x078],%l0		! Mem[0000000030800078]
	prefetch [%i1+0x080],23
	udivcc	%l2,0x682,%l5
	stb	%l0,[%o2+0x034]		! Mem[0000000031000034]
	taddcc	%l6,0x5a3,%l7
	ldsh	[%o0+0x070],%l0		! Mem[0000000030000070]
	jmpl	%o7,%g0
	std	%l6,[%o3+0x038]		! Mem[0000000031800038]
p3_near_0_ho:
	ldx	[%i1+0x078],%l0		! Mem[0000000030800078]
	prefetch [%o1+0x080],23
	udivcc	%l2,0x682,%l5
	stb	%l0,[%i2+0x034]		! Mem[0000000031000034]
	taddcc	%l6,0x5a3,%l7
	ldsh	[%i0+0x070],%l0		! Mem[0000000030000070]
	jmpl	%o7,%g0
	std	%l6,[%i3+0x038]		! Mem[0000000031800038]
near0_b2b_h:
	andcc	%l0,%l5,%l2
	subc	%l4,-0x56e,%l7
	udivx	%l2,-0xdb0,%l4
	jmpl	%o7,%g0
	addcc	%l7,%l3,%l5
near0_b2b_l:
	srl	%l6,%l3,%l0
	sub	%l1,%l4,%l6
	sllx	%l0,0x01c,%l1
	jmpl	%o7,%g0
	add	%l1,0x95f,%l1
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	orncc	%l5,-0x51b,%l0
	xnorcc	%l5,0x38c,%l3
	orn	%l3,-0x454,%l3
	bcs	far2_b2b_l
	orcc	%l4,-0xdcb,%l4
	jmpl	%o7,%g0
	srax	%l5,0x03d,%l0
p0_near_1_lo:
	orncc	%l5,-0x51b,%l0
	xnorcc	%l5,0x38c,%l3
	orn	%l3,-0x454,%l3
	bcs	far2_b2b_l
	orcc	%l4,-0xdcb,%l4
	jmpl	%o7,%g0
	srax	%l5,0x03d,%l0
p0_near_1_he:
	smulcc	%l7,-0xa4c,%l2
	prefetch [%i3+0x0a0],1
	or	%l2,-0xc29,%l4
	sdivx	%l7,-0xbd7,%l2
	umul	%l3,-0x1ec,%l0
	jmpl	%o7,%g0
	sra	%l1,0x007,%l7
p0_near_1_ho:
	smulcc	%l7,-0xa4c,%l2
	prefetch [%o3+0x0a0],1
	or	%l2,-0xc29,%l4
	sdivx	%l7,-0xbd7,%l2
	umul	%l3,-0x1ec,%l0
	jmpl	%o7,%g0
	sra	%l1,0x007,%l7
p1_near_1_le:
	prefetch [%i3+0x040],0
	jmpl	%o7,%g0
	prefetch [%i1+0x0c0],23
p1_near_1_lo:
	prefetch [%o3+0x040],0
	jmpl	%o7,%g0
	prefetch [%o1+0x0c0],23
p1_near_1_he:
	andn	%l3,-0x3c1,%l0
	addc	%l3,%l5,%l3
	jmpl	%o7,%g0
	udiv	%l2,-0x651,%l0
p1_near_1_ho:
	andn	%l3,-0x3c1,%l0
	addc	%l3,%l5,%l3
	jmpl	%o7,%g0
	udiv	%l2,-0x651,%l0
p2_near_1_le:
	udivx	%l4,0xc86,%l0
	prefetch [%i4+0x180],2
	srlx	%l1,0x012,%l5
	orncc	%l3,%l5,%l3
	sdivcc	%l4,0xa34,%l7
	jmpl	%o7,%g0
	srlx	%l1,%l2,%l4
p2_near_1_lo:
	udivx	%l4,0xc86,%l0
	prefetch [%o4+0x180],2
	srlx	%l1,0x012,%l5
	orncc	%l3,%l5,%l3
	sdivcc	%l4,0xa34,%l7
	jmpl	%o7,%g0
	srlx	%l1,%l2,%l4
p2_near_1_he:
	sdiv	%l1,-0x17d,%l4
	stx	%l6,[%o2+0x060]		! Mem[0000000031000060]
	and	%l3,0xaae,%l3
	and	%l5,%l3,%l0
	jmpl	%o7,%g0
	smulcc	%l6,%l4,%l4
p2_near_1_ho:
	sdiv	%l1,-0x17d,%l4
	stx	%l6,[%i2+0x060]		! Mem[0000000031000060]
	and	%l3,0xaae,%l3
	and	%l5,%l3,%l0
	jmpl	%o7,%g0
	smulcc	%l6,%l4,%l4
p3_near_1_le:
	sub	%l7,%l2,%l5
	prefetch [%i3+0x180],23
	smul	%l3,%l2,%l2
	sllx	%l3,0x036,%l1
	sdiv	%l1,0xe1f,%l5
	prefetch [%i2+0x160],4
	jmpl	%o7,%g0
	ldub	[%i1+0x0d0],%l2		! Mem[000000001c8000d0]
p3_near_1_lo:
	sub	%l7,%l2,%l5
	prefetch [%o3+0x180],23
	smul	%l3,%l2,%l2
	sllx	%l3,0x036,%l1
	sdiv	%l1,0xe1f,%l5
	prefetch [%o2+0x160],4
	jmpl	%o7,%g0
	ldub	[%o1+0x0d0],%l2		! Mem[000000001c8000d0]
p3_near_1_he:
	andcc	%l6,-0xe82,%l6
	orcc	%l7,0x007,%l1
	prefetch [%i3+0x1a0],2
	jmpl	%o7,%g0
	prefetch [%i1+0x060],20
p3_near_1_ho:
	andcc	%l6,-0xe82,%l6
	orcc	%l7,0x007,%l1
	prefetch [%o3+0x1a0],2
	jmpl	%o7,%g0
	prefetch [%o1+0x060],20
near1_b2b_h:
	andcc	%l4,%l2,%l2
	jmpl	%o7,%g0
	andncc	%l4,%l1,%l2
near1_b2b_l:
	andcc	%l0,0x528,%l6
	jmpl	%o7,%g0
	udivcc	%l2,-0x401,%l0
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	subccc	%l1,%l2,%l2
	jmpl	%o7,%g0
	ldx	[%i2+0x0e8],%l6		! Mem[00000000110000e8]
p0_near_2_lo:
	subccc	%l1,%l2,%l2
	jmpl	%o7,%g0
	ldx	[%o2+0x0e8],%l6		! Mem[00000000110000e8]
p0_near_2_he:
	xnor	%l7,0x3c5,%l0
	addcc	%l4,0x905,%l3
	lduw	[%i0+0x084],%l2		! Mem[0000000010000084]
	umul	%l7,-0xce1,%l0
	xorcc	%l3,0x59f,%l6
	sub	%l5,0x2ff,%l3
	jmpl	%o7,%g0
	swap	[%i3+0x030],%l7		! Mem[0000000011800030]
p0_near_2_ho:
	xnor	%l7,0x3c5,%l0
	addcc	%l4,0x905,%l3
	lduw	[%o0+0x084],%l2		! Mem[0000000010000084]
	umul	%l7,-0xce1,%l0
	xorcc	%l3,0x59f,%l6
	sub	%l5,0x2ff,%l3
	jmpl	%o7,%g0
	swap	[%o3+0x030],%l7		! Mem[0000000011800030]
p1_near_2_le:
	subc	%l0,%l1,%l0
	xorcc	%l0,-0xccb,%l7
	prefetch [%i2+0x1c0],22
	and	%l3,%l2,%l4
	jmpl	%o7,%g0
	xorcc	%l5,-0x466,%l3
p1_near_2_lo:
	subc	%l0,%l1,%l0
	xorcc	%l0,-0xccb,%l7
	prefetch [%o2+0x1c0],22
	and	%l3,%l2,%l4
	jmpl	%o7,%g0
	xorcc	%l5,-0x466,%l3
p1_near_2_he:
	sub	%l7,%l2,%l4
	andn	%l2,%l1,%l3
	ldsw	[%i3+0x1bc],%l1		! Mem[00000000158001bc]
	xorcc	%l2,-0xaca,%l7
	udivx	%l5,0x8ab,%l7
	jmpl	%o7,%g0
	lduw	[%o1+0x050],%l5		! Mem[0000000030800050]
p1_near_2_ho:
	sub	%l7,%l2,%l4
	andn	%l2,%l1,%l3
	ldsw	[%o3+0x1bc],%l1		! Mem[00000000158001bc]
	xorcc	%l2,-0xaca,%l7
	udivx	%l5,0x8ab,%l7
	jmpl	%o7,%g0
	lduw	[%i1+0x050],%l5		! Mem[0000000030800050]
p2_near_2_le:
	lduh	[%o0+0x024],%l5		! Mem[0000000030000024]
	mulx	%l5,%l2,%l3
	udivcc	%l5,-0x544,%l4
	srax	%l4,0x02b,%l5
	taddcc	%l1,%l5,%l4
	sra	%l2,%l5,%l7
	jmpl	%o7,%g0
	umul	%l3,%l3,%l7
p2_near_2_lo:
	lduh	[%i0+0x024],%l5		! Mem[0000000030000024]
	mulx	%l5,%l2,%l3
	udivcc	%l5,-0x544,%l4
	srax	%l4,0x02b,%l5
	taddcc	%l1,%l5,%l4
	sra	%l2,%l5,%l7
	jmpl	%o7,%g0
	umul	%l3,%l3,%l7
p2_near_2_he:
	prefetch [%i3+0x020],23
	ldd	[%o1+0x028],%l4		! Mem[0000000030800028]
	jmpl	%o7,%g0
	sdivx	%l1,0x204,%l4
p2_near_2_ho:
	prefetch [%o3+0x020],23
	ldd	[%i1+0x028],%l4		! Mem[0000000030800028]
	jmpl	%o7,%g0
	sdivx	%l1,0x204,%l4
p3_near_2_le:
	prefetch [%i2+0x0a0],3
	umulcc	%l7,0xfc5,%l0
	udivx	%l4,-0x09a,%l1
	ldsw	[%i3+0x1d8],%l2		! Mem[000000001d8001d8]
	xorcc	%l4,0xb10,%l0
	jmpl	%o7,%g0
	orcc	%l2,%l5,%l0
p3_near_2_lo:
	prefetch [%o2+0x0a0],3
	umulcc	%l7,0xfc5,%l0
	udivx	%l4,-0x09a,%l1
	ldsw	[%o3+0x1d8],%l2		! Mem[000000001d8001d8]
	xorcc	%l4,0xb10,%l0
	jmpl	%o7,%g0
	orcc	%l2,%l5,%l0
p3_near_2_he:
	orn	%l4,-0x7ed,%l7
	jmpl	%o7,%g0
	or	%l2,-0x68f,%l7
p3_near_2_ho:
	orn	%l4,-0x7ed,%l7
	jmpl	%o7,%g0
	or	%l2,-0x68f,%l7
near2_b2b_h:
	orn	%l5,%l0,%l1
	orncc	%l7,%l4,%l6
	orcc	%l4,0xfe4,%l4
	jmpl	%o7,%g0
	and	%l1,%l2,%l3
near2_b2b_l:
	xor	%l4,0x3e7,%l0
	smul	%l5,-0xac1,%l5
	andn	%l3,-0xad1,%l6
	jmpl	%o7,%g0
	udiv	%l0,0x3e4,%l7
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	sllx	%l7,%l3,%l4
p0_near_3_lo:
	jmpl	%o7,%g0
	sllx	%l7,%l3,%l4
p0_near_3_he:
	sdivx	%l7,0xd4f,%l7
	srax	%l4,%l5,%l6
	prefetch [%i0+0x0c0],21
	jmpl	%o7,%g0
	sub	%l3,%l5,%l3
p0_near_3_ho:
	sdivx	%l7,0xd4f,%l7
	srax	%l4,%l5,%l6
	prefetch [%o0+0x0c0],21
	jmpl	%o7,%g0
	sub	%l3,%l5,%l3
p1_near_3_le:
	xorcc	%l3,%l0,%l7
	orcc	%l1,%l5,%l2
	smul	%l5,%l5,%l2
	prefetch [%i2+0x0a0],23
	prefetch [%i3+0x000],22
	prefetch [%i0+0x100],23
	jmpl	%o7,%g0
	prefetch [%i1+0x060],0
p1_near_3_lo:
	xorcc	%l3,%l0,%l7
	orcc	%l1,%l5,%l2
	smul	%l5,%l5,%l2
	prefetch [%o2+0x0a0],23
	prefetch [%o3+0x000],22
	prefetch [%o0+0x100],23
	jmpl	%o7,%g0
	prefetch [%o1+0x060],0
p1_near_3_he:
	orcc	%l2,%l7,%l1
	prefetch [%i3+0x080],22
	andcc	%l6,-0x603,%l5
	jmpl	%o7,%g0
	ldsw	[%i1+0x0f4],%l3		! Mem[00000000148000f4]
p1_near_3_ho:
	orcc	%l2,%l7,%l1
	prefetch [%o3+0x080],22
	andcc	%l6,-0x603,%l5
	jmpl	%o7,%g0
	ldsw	[%o1+0x0f4],%l3		! Mem[00000000148000f4]
p2_near_3_le:
	or	%l3,%l6,%l3
	swap	[%i3+0x110],%l1		! Mem[0000000019800110]
	prefetch [%i1+0x1a0],23
	jmpl	%o7,%g0
	sll	%l6,%l6,%l6
p2_near_3_lo:
	or	%l3,%l6,%l3
	swap	[%o3+0x110],%l1		! Mem[0000000019800110]
	prefetch [%o1+0x1a0],23
	jmpl	%o7,%g0
	sll	%l6,%l6,%l6
p2_near_3_he:
	subccc	%l4,%l0,%l3
	sll	%l4,%l0,%l7
	smulcc	%l3,-0xc65,%l7
	jmpl	%o7,%g0
	udivx	%l3,0xb50,%l5
p2_near_3_ho:
	subccc	%l4,%l0,%l3
	sll	%l4,%l0,%l7
	smulcc	%l3,-0xc65,%l7
	jmpl	%o7,%g0
	udivx	%l3,0xb50,%l5
p3_near_3_le:
	lduw	[%i4+0x008],%l6		! Mem[000000001e000008]
	orncc	%l2,%l5,%l6
	bg	near1_b2b_l
	sdivcc	%l3,0xf8c,%l1
	jmpl	%o7,%g0
	xor	%l0,%l5,%l2
p3_near_3_lo:
	lduw	[%o4+0x008],%l6		! Mem[000000001e000008]
	orncc	%l2,%l5,%l6
	bg	near1_b2b_l
	sdivcc	%l3,0xf8c,%l1
	jmpl	%o7,%g0
	xor	%l0,%l5,%l2
p3_near_3_he:
	sub	%l2,0xdf3,%l3
	sllx	%l7,%l5,%l0
	stb	%l3,[%i1+0x19a]		! Mem[000000001c80019a]
	mulx	%l7,%l4,%l4
	prefetch [%i3+0x1c0],3
	jmpl	%o7,%g0
	xnor	%l2,0x679,%l5
p3_near_3_ho:
	sub	%l2,0xdf3,%l3
	sllx	%l7,%l5,%l0
	stb	%l3,[%o1+0x19a]		! Mem[000000001c80019a]
	mulx	%l7,%l4,%l4
	prefetch [%o3+0x1c0],3
	jmpl	%o7,%g0
	xnor	%l2,0x679,%l5
near3_b2b_h:
	sll	%l3,%l2,%l4
	subccc	%l5,0x6f0,%l0
	taddcc	%l0,-0xcc0,%l3
	sdiv	%l1,0x346,%l0
	sllx	%l5,%l6,%l5
	tsubcc	%l7,%l1,%l1
	jmpl	%o7,%g0
	udivcc	%l4,0x75a,%l0
near3_b2b_l:
	add	%l2,%l3,%l4
	udivcc	%l6,0x2e7,%l2
	andncc	%l5,%l0,%l0
	sdiv	%l5,0xe04,%l1
	sdiv	%l7,-0x466,%l6
	tsubcc	%l1,-0xc68,%l6
	jmpl	%o7,%g0
	smulcc	%l7,0x78a,%l4
user_near3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far0_start:
p0_far_0_le:
	andncc	%l1,%l1,%l7
	jmpl	%o7,%g0
	prefetch [%i0+0x0c0],16
p0_far_0_lo:
	andncc	%l1,%l1,%l7
	jmpl	%o7,%g0
	prefetch [%o0+0x0c0],16
p0_far_0_he:
	xnorcc	%l5,0x53b,%l3
	jmpl	%o7,%g0
	andncc	%l0,%l0,%l6
p0_far_0_ho:
	xnorcc	%l5,0x53b,%l3
	jmpl	%o7,%g0
	andncc	%l0,%l0,%l6
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p1_far_0_le:
	jmpl	%o7,%g0
	xnorcc	%l7,0xf43,%l6
p1_far_0_lo:
	jmpl	%o7,%g0
	xnorcc	%l7,0xf43,%l6
p1_far_0_he:
	ldsh	[%i3+0x114],%l7		! Mem[0000000015800114]
	sdivx	%l5,0xeb7,%l5
	umul	%l1,0x778,%l6
	udiv	%l7,-0x98c,%l3
	add	%l6,-0x43e,%l4
	prefetch [%i5+0x100],20
	jmpl	%o7,%g0
	ldub	[%o3+0x015],%l2		! Mem[0000000031800015]
p1_far_0_ho:
	ldsh	[%o3+0x114],%l7		! Mem[0000000015800114]
	sdivx	%l5,0xeb7,%l5
	umul	%l1,0x778,%l6
	udiv	%l7,-0x98c,%l3
	add	%l6,-0x43e,%l4
	prefetch [%o5+0x100],20
	jmpl	%o7,%g0
	ldub	[%i3+0x015],%l2		! Mem[0000000031800015]
p1_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p2_far_0_le:
	prefetch [%i2+0x020],16
	addc	%l7,%l0,%l0
	prefetch [%i0+0x0a0],16
	prefetch [%i0+0x1e0],16
	ldub	[%i2+0x07a],%l3		! Mem[000000001900007a]
	jmpl	%o7,%g0
	addc	%l6,%l0,%l0
p2_far_0_lo:
	prefetch [%o2+0x020],16
	addc	%l7,%l0,%l0
	prefetch [%o0+0x0a0],16
	prefetch [%o0+0x1e0],16
	ldub	[%o2+0x07a],%l3		! Mem[000000001900007a]
	jmpl	%o7,%g0
	addc	%l6,%l0,%l0
p2_far_0_he:
	orn	%l1,%l1,%l1
	ldub	[%i5+0x0d5],%l6		! Mem[000000001a8000d5]
	or	%l3,-0xf5e,%l5
	jmpl	%o7,%g0
	subc	%l4,%l0,%l1
p2_far_0_ho:
	orn	%l1,%l1,%l1
	ldub	[%o5+0x0d5],%l6		! Mem[000000001a8000d5]
	or	%l3,-0xf5e,%l5
	jmpl	%o7,%g0
	subc	%l4,%l0,%l1
p2_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p3_far_0_le:
	umulcc	%l1,%l7,%l4
	jmpl	%o7,%g0
	umul	%l5,-0x8cb,%l4
p3_far_0_lo:
	umulcc	%l1,%l7,%l4
	jmpl	%o7,%g0
	umul	%l5,-0x8cb,%l4
p3_far_0_he:
	add	%l7,-0x5ac,%l7
	prefetch [%i3+0x0c0],2
	ldx	[%o0+0x038],%l6		! Mem[0000000030000038]
	sllx	%l0,%l7,%l7
	udiv	%l3,-0x75b,%l4
	prefetch [%i0+0x120],0
	jmpl	%o7,%g0
	prefetch [%i0+0x160],1
p3_far_0_ho:
	add	%l7,-0x5ac,%l7
	prefetch [%o3+0x0c0],2
	ldx	[%i0+0x038],%l6		! Mem[0000000030000038]
	sllx	%l0,%l7,%l7
	udiv	%l3,-0x75b,%l4
	prefetch [%o0+0x120],0
	jmpl	%o7,%g0
	prefetch [%o0+0x160],1
p3_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	sub	%l7,-0x7b4,%l1
	srl	%l2,0x00f,%l7
	umulcc	%l3,0x4fb,%l4
	addcc	%l2,-0x988,%l6
	umulcc	%l7,%l5,%l2
	jmpl	%o7,%g0
	umul	%l1,%l5,%l7
far0_b2b_l:
	srl	%l0,0x01c,%l3
	andcc	%l4,%l1,%l3
	subccc	%l6,%l6,%l1
	orcc	%l6,0x560,%l6
	mulx	%l4,0x6f5,%l6
	jmpl	%o7,%g0
	and	%l5,0x7d3,%l2
user_far0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far1_start:
p0_far_1_le:
	prefetch [%i3+0x0a0],22
	ldstub	[%o1+0x004],%l0		! Mem[0000000030800004]
	xor	%l0,%l2,%l4
	ldsh	[%i1+0x078],%l6		! Mem[0000000010800078]
	addc	%l5,%l0,%l0
	prefetch [%i1+0x020],22
	jmpl	%o7,%g0
	srl	%l1,0x004,%l1
p0_far_1_lo:
	prefetch [%o3+0x0a0],22
	ldstub	[%i1+0x004],%l0		! Mem[0000000030800004]
	xor	%l0,%l2,%l4
	ldsh	[%o1+0x078],%l6		! Mem[0000000010800078]
	addc	%l5,%l0,%l0
	prefetch [%o1+0x020],22
	jmpl	%o7,%g0
	srl	%l1,0x004,%l1
p0_far_1_he:
	jmpl	%o7,%g0
	stx	%l3,[%o1+0x048]		! Mem[0000000030800048]
p0_far_1_ho:
	jmpl	%o7,%g0
	stx	%l3,[%i1+0x048]		! Mem[0000000030800048]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p1_far_1_le:
	jmpl	%o7,%g0
	stw	%l5,[%o1+0x050]		! Mem[0000000030800050]
p1_far_1_lo:
	jmpl	%o7,%g0
	stw	%l5,[%i1+0x050]		! Mem[0000000030800050]
p1_far_1_he:
	prefetch [%i2+0x040],22
	jmpl	%o7,%g0
	lduh	[%i0+0x150],%l1		! Mem[0000000014000150]
p1_far_1_ho:
	prefetch [%o2+0x040],22
	jmpl	%o7,%g0
	lduh	[%o0+0x150],%l1		! Mem[0000000014000150]
p1_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p2_far_1_le:
	andcc	%l2,0x743,%l3
	prefetch [%i3+0x0a0],4
	sra	%l6,0x00a,%l2
	addc	%l6,%l1,%l1
	jmpl	%o7,%g0
	prefetch [%i1+0x180],22
p2_far_1_lo:
	andcc	%l2,0x743,%l3
	prefetch [%o3+0x0a0],4
	sra	%l6,0x00a,%l2
	addc	%l6,%l1,%l1
	jmpl	%o7,%g0
	prefetch [%o1+0x180],22
p2_far_1_he:
	jmpl	%o7,%g0
	sdivcc	%l2,0xdfa,%l2
p2_far_1_ho:
	jmpl	%o7,%g0
	sdivcc	%l2,0xdfa,%l2
p2_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p3_far_1_le:
	addcc	%l5,%l0,%l0
	jmpl	%o7,%g0
	prefetch [%i5+0x040],3
p3_far_1_lo:
	addcc	%l5,%l0,%l0
	jmpl	%o7,%g0
	prefetch [%o5+0x040],3
p3_far_1_he:
	nop
	stw	%l3,[%o0+0x038]		! Mem[0000000030000038]
	sll	%l5,%l4,%l2
	sll	%l6,%l0,%l3
	ldsb	[%i0+0x0e5],%l6		! Mem[000000001c0000e5]
	jmpl	%o7,%g0
	ldub	[%o2+0x03f],%l2		! Mem[000000003100003f]
p3_far_1_ho:
	nop
	stw	%l3,[%i0+0x038]		! Mem[0000000030000038]
	sll	%l5,%l4,%l2
	sll	%l6,%l0,%l3
	ldsb	[%o0+0x0e5],%l6		! Mem[000000001c0000e5]
	jmpl	%o7,%g0
	ldub	[%i2+0x03f],%l2		! Mem[000000003100003f]
p3_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	srl	%l7,%l5,%l6
	tsubcc	%l7,0x2d6,%l3
	jmpl	%o7,%g0
	xorcc	%l5,-0x675,%l4
far1_b2b_l:
	addcc	%l2,%l7,%l6
	xorcc	%l2,%l6,%l3
	jmpl	%o7,%g0
	sdivx	%l3,0x08f,%l4
user_far1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far2_start:
p0_far_2_le:
	jmpl	%o7,%g0
	std	%l0,[%o1+0x048]		! Mem[0000000030800048]
p0_far_2_lo:
	jmpl	%o7,%g0
	std	%l0,[%i1+0x048]		! Mem[0000000030800048]
p0_far_2_he:
	xor	%l4,%l6,%l0
	lduw	[%i3+0x0d8],%l4		! Mem[00000000118000d8]
	xor	%l7,%l3,%l0
	prefetch [%i0+0x0c0],4
	ldsh	[%o2+0x00c],%l0		! Mem[000000003100000c]
	jmpl	%o7,%g0
	tsubcc	%l7,%l3,%l5
p0_far_2_ho:
	xor	%l4,%l6,%l0
	lduw	[%o3+0x0d8],%l4		! Mem[00000000118000d8]
	xor	%l7,%l3,%l0
	prefetch [%o0+0x0c0],4
	ldsh	[%i2+0x00c],%l0		! Mem[000000003100000c]
	jmpl	%o7,%g0
	tsubcc	%l7,%l3,%l5
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p1_far_2_le:
	smulcc	%l3,-0x2db,%l7
	addccc	%l0,%l6,%l4
	smul	%l5,-0xe4c,%l5
	srax	%l2,0x02b,%l2
	jmpl	%o7,%g0
	umul	%l0,%l1,%l0
p1_far_2_lo:
	smulcc	%l3,-0x2db,%l7
	addccc	%l0,%l6,%l4
	smul	%l5,-0xe4c,%l5
	srax	%l2,0x02b,%l2
	jmpl	%o7,%g0
	umul	%l0,%l1,%l0
p1_far_2_he:
	andn	%l2,%l4,%l2
	xorcc	%l7,0x891,%l6
	stx	%l1,[%i2+0x040]		! Mem[0000000015000040]
	prefetch [%i1+0x180],0
	sdivcc	%l6,0x381,%l3
	jmpl	%o7,%g0
	sdiv	%l6,-0x696,%l2
p1_far_2_ho:
	andn	%l2,%l4,%l2
	xorcc	%l7,0x891,%l6
	stx	%l1,[%o2+0x040]		! Mem[0000000015000040]
	prefetch [%o1+0x180],0
	sdivcc	%l6,0x381,%l3
	jmpl	%o7,%g0
	sdiv	%l6,-0x696,%l2
p1_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p2_far_2_le:
	jmpl	%o7,%g0
	sllx	%l4,0x038,%l2
p2_far_2_lo:
	jmpl	%o7,%g0
	sllx	%l4,0x038,%l2
p2_far_2_he:
	andn	%l7,0xaf4,%l3
	ldsh	[%o0+0x060],%l5		! Mem[0000000030000060]
	orn	%l1,%l1,%l7
	jmpl	%o7,%g0
	srax	%l7,0x01c,%l3
p2_far_2_ho:
	andn	%l7,0xaf4,%l3
	ldsh	[%i0+0x060],%l5		! Mem[0000000030000060]
	orn	%l1,%l1,%l7
	jmpl	%o7,%g0
	srax	%l7,0x01c,%l3
p2_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p3_far_2_le:
	sub	%l5,0x25c,%l1
	srl	%l7,0x01a,%l1
	jmpl	%o7,%g0
	stx	%l0,[%i2+0x1e0]		! Mem[000000001d0001e0]
p3_far_2_lo:
	sub	%l5,0x25c,%l1
	srl	%l7,0x01a,%l1
	jmpl	%o7,%g0
	stx	%l0,[%o2+0x1e0]		! Mem[000000001d0001e0]
p3_far_2_he:
	subc	%l7,0x505,%l6
	xnorcc	%l4,%l0,%l3
	addcc	%l5,%l1,%l5
	jmpl	%o7,%g0
	orcc	%l1,-0xf03,%l1
p3_far_2_ho:
	subc	%l7,0x505,%l6
	xnorcc	%l4,%l0,%l3
	addcc	%l5,%l1,%l5
	jmpl	%o7,%g0
	orcc	%l1,-0xf03,%l1
p3_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	sdivcc	%l5,-0x64f,%l0
	udivx	%l3,-0xf25,%l2
	mulx	%l2,%l5,%l3
	sdivcc	%l7,0xf5a,%l6
	andcc	%l0,%l2,%l7
	jmpl	%o7,%g0
	sdiv	%l7,-0x8ca,%l4
far2_b2b_l:
	andcc	%l7,0xd77,%l5
	subccc	%l0,0x2b2,%l2
	andncc	%l5,%l7,%l2
	xnorcc	%l5,0x715,%l1
	sdiv	%l1,-0x2ae,%l2
	jmpl	%o7,%g0
	orncc	%l4,0x27c,%l4
user_far2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far3_start:
p0_far_3_le:
	swap	[%o2+0x000],%l4		! Mem[0000000031000000]
	ldd	[%i1+0x050],%l0		! Mem[0000000010800050]
	udiv	%l2,0xe4c,%l0
	prefetch [%i4+0x0c0],16
	ldsw	[%o1+0x00c],%l6		! Mem[000000003080000c]
	andcc	%l5,-0xb7b,%l4
	jmpl	%o7,%g0
	prefetch [%i1+0x060],0
p0_far_3_lo:
	swap	[%i2+0x000],%l4		! Mem[0000000031000000]
	ldd	[%o1+0x050],%l0		! Mem[0000000010800050]
	udiv	%l2,0xe4c,%l0
	prefetch [%o4+0x0c0],16
	ldsw	[%i1+0x00c],%l6		! Mem[000000003080000c]
	andcc	%l5,-0xb7b,%l4
	jmpl	%o7,%g0
	prefetch [%o1+0x060],0
p0_far_3_he:
	jmpl	%o7,%g0
	orn	%l0,%l2,%l4
p0_far_3_ho:
	jmpl	%o7,%g0
	orn	%l0,%l2,%l4
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p1_far_3_le:
	ldsb	[%o0+0x052],%l7		! Mem[0000000030000052]
	jmpl	%o7,%g0
	prefetch [%i0+0x1e0],0
p1_far_3_lo:
	ldsb	[%i0+0x052],%l7		! Mem[0000000030000052]
	jmpl	%o7,%g0
	prefetch [%o0+0x1e0],0
p1_far_3_he:
	prefetch [%i5+0x1e0],23
	lduh	[%i2+0x02e],%l3		! Mem[000000001500002e]
	prefetch [%i3+0x100],20
	jmpl	%o7,%g0
	ldub	[%o2+0x014],%l0		! Mem[0000000031000014]
p1_far_3_ho:
	prefetch [%o5+0x1e0],23
	lduh	[%o2+0x02e],%l3		! Mem[000000001500002e]
	prefetch [%o3+0x100],20
	jmpl	%o7,%g0
	ldub	[%i2+0x014],%l0		! Mem[0000000031000014]
p1_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p2_far_3_le:
	sra	%l5,0x00f,%l1
	lduw	[%o1+0x068],%l5		! Mem[0000000030800068]
	xor	%l1,0xc98,%l0
	subccc	%l1,%l1,%l7
	smulcc	%l2,0xc19,%l1
	jmpl	%o7,%g0
	prefetch [%i0+0x040],20
p2_far_3_lo:
	sra	%l5,0x00f,%l1
	lduw	[%i1+0x068],%l5		! Mem[0000000030800068]
	xor	%l1,0xc98,%l0
	subccc	%l1,%l1,%l7
	smulcc	%l2,0xc19,%l1
	jmpl	%o7,%g0
	prefetch [%o0+0x040],20
p2_far_3_he:
	ldx	[%o2+0x060],%l3		! Mem[0000000031000060]
	xorcc	%l2,0x153,%l5
	tsubcc	%l7,%l1,%l3
	ldstub	[%o1+0x029],%l3		! Mem[0000000030800029]
	subccc	%l3,%l5,%l7
	add	%l5,-0x0ee,%l5
	jmpl	%o7,%g0
	ldsw	[%i0+0x100],%l2		! Mem[0000000018000100]
p2_far_3_ho:
	ldx	[%i2+0x060],%l3		! Mem[0000000031000060]
	xorcc	%l2,0x153,%l5
	tsubcc	%l7,%l1,%l3
	ldstub	[%i1+0x029],%l3		! Mem[0000000030800029]
	subccc	%l3,%l5,%l7
	add	%l5,-0x0ee,%l5
	jmpl	%o7,%g0
	ldsw	[%o0+0x100],%l2		! Mem[0000000018000100]
p2_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p3_far_3_le:
	jmpl	%o7,%g0
	subc	%l1,%l3,%l1
p3_far_3_lo:
	jmpl	%o7,%g0
	subc	%l1,%l3,%l1
p3_far_3_he:
	prefetch [%i0+0x0a0],22
	stx	%l1,[%i0+0x070]		! Mem[000000001c000070]
	umulcc	%l3,%l5,%l3
	jmpl	%o7,%g0
	tsubcc	%l3,%l5,%l7
p3_far_3_ho:
	prefetch [%o0+0x0a0],22
	stx	%l1,[%o0+0x070]		! Mem[000000001c000070]
	umulcc	%l3,%l5,%l3
	jmpl	%o7,%g0
	tsubcc	%l3,%l5,%l7
p3_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	srax	%l5,%l5,%l3
	xorcc	%l7,0x97a,%l2
	nop
	jmpl	%o7,%g0
	srl	%l2,%l6,%l5
far3_b2b_l:
	udivx	%l7,-0x968,%l7
	or	%l4,%l5,%l4
	tsubcc	%l2,-0xa91,%l6
	jmpl	%o7,%g0
	tsubcc	%l4,0x6b4,%l6
user_far3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	xor	%l0,0x38f,%l5
	jmpl	%g6+8,%g0
	prefetch [%i1+0x0c0],4
p0_call_0_le:
	stx	%l4,[%o3+0x048]		! Mem[0000000031800048]
	retl
	ldstub	[%i1+0x00e],%l7		! Mem[000000001080000e]
p0_jmpl_0_lo:
	xor	%l0,0x38f,%l5
	jmpl	%g6+8,%g0
	prefetch [%o1+0x0c0],4
p0_call_0_lo:
	stx	%l4,[%i3+0x048]		! Mem[0000000031800048]
	retl
	ldstub	[%o1+0x00e],%l7		! Mem[000000001080000e]
p0_jmpl_0_he:
	srl	%l1,0x01d,%l5
	or	%l3,%l2,%l7
	sll	%l0,0x004,%l5
	jmpl	%g6+8,%g0
	addccc	%l6,%l6,%l2
p0_call_0_he:
	sdivx	%l1,-0x89d,%l1
	retl
	addcc	%l3,%l0,%l7
p0_jmpl_0_ho:
	srl	%l1,0x01d,%l5
	or	%l3,%l2,%l7
	sll	%l0,0x004,%l5
	jmpl	%g6+8,%g0
	addccc	%l6,%l6,%l2
p0_call_0_ho:
	sdivx	%l1,-0x89d,%l1
	retl
	addcc	%l3,%l0,%l7
p1_jmpl_0_le:
	ldstub	[%i1+0x1a2],%l5		! Mem[00000000148001a2]
	xnor	%l6,%l6,%l6
	jmpl	%g6+8,%g0
	stx	%l7,[%i0+0x088]		! Mem[0000000014000088]
p1_call_0_le:
	ldsh	[%o0+0x050],%l2		! Mem[0000000030000050]
	srl	%l5,0x00f,%l4
	umulcc	%l4,0xd66,%l3
	smul	%l0,0xf50,%l6
	srax	%l6,%l7,%l6
	retl
	xnorcc	%l3,%l2,%l2
p1_jmpl_0_lo:
	ldstub	[%o1+0x1a2],%l5		! Mem[00000000148001a2]
	xnor	%l6,%l6,%l6
	jmpl	%g6+8,%g0
	stx	%l7,[%o0+0x088]		! Mem[0000000014000088]
p1_call_0_lo:
	ldsh	[%i0+0x050],%l2		! Mem[0000000030000050]
	srl	%l5,0x00f,%l4
	umulcc	%l4,0xd66,%l3
	smul	%l0,0xf50,%l6
	srax	%l6,%l7,%l6
	retl
	xnorcc	%l3,%l2,%l2
p1_jmpl_0_he:
	swap	[%i3+0x1a0],%l5		! Mem[00000000158001a0]
	jmpl	%g6+8,%g0
	sllx	%l2,0x014,%l1
p1_call_0_he:
	addcc	%l6,%l3,%l3
	taddcc	%l0,%l5,%l4
	ldsb	[%i1+0x10f],%l4		! Mem[000000001480010f]
	smul	%l0,%l2,%l1
	srl	%l1,0x009,%l6
	retl
	ldsh	[%o0+0x052],%l3		! Mem[0000000030000052]
p1_jmpl_0_ho:
	swap	[%o3+0x1a0],%l5		! Mem[00000000158001a0]
	jmpl	%g6+8,%g0
	sllx	%l2,0x014,%l1
p1_call_0_ho:
	addcc	%l6,%l3,%l3
	taddcc	%l0,%l5,%l4
	ldsb	[%o1+0x10f],%l4		! Mem[000000001480010f]
	smul	%l0,%l2,%l1
	srl	%l1,0x009,%l6
	retl
	ldsh	[%i0+0x052],%l3		! Mem[0000000030000052]
p2_jmpl_0_le:
	subc	%l6,0x9fc,%l3
	subccc	%l4,%l4,%l3
	sdivx	%l4,0x70c,%l3
	prefetch [%i2+0x120],22
	jmpl	%g6+8,%g0
	taddcc	%l7,%l4,%l5
p2_call_0_le:
	or	%l1,-0xdf9,%l7
	retl
	xnorcc	%l6,0xbae,%l5
p2_jmpl_0_lo:
	subc	%l6,0x9fc,%l3
	subccc	%l4,%l4,%l3
	sdivx	%l4,0x70c,%l3
	prefetch [%o2+0x120],22
	jmpl	%g6+8,%g0
	taddcc	%l7,%l4,%l5
p2_call_0_lo:
	or	%l1,-0xdf9,%l7
	retl
	xnorcc	%l6,0xbae,%l5
p2_jmpl_0_he:
	subccc	%l6,-0x3e3,%l1
	sth	%l4,[%i2+0x1ba]		! Mem[00000000190001ba]
	stw	%l2,[%i2+0x018]		! Mem[0000000019000018]
	jmpl	%g6+8,%g0
	smul	%l1,%l5,%l6
p2_call_0_he:
	ldsb	[%o0+0x063],%l2		! Mem[0000000030000063]
	addc	%l1,%l0,%l0
	orn	%l7,%l0,%l6
	std	%l0,[%o2+0x020]		! Mem[0000000031000020]
	sub	%l0,%l5,%l1
	retl
	ldd	[%o2+0x060],%l2		! Mem[0000000031000060]
p2_jmpl_0_ho:
	subccc	%l6,-0x3e3,%l1
	sth	%l4,[%o2+0x1ba]		! Mem[00000000190001ba]
	stw	%l2,[%o2+0x018]		! Mem[0000000019000018]
	jmpl	%g6+8,%g0
	smul	%l1,%l5,%l6
p2_call_0_ho:
	ldsb	[%i0+0x063],%l2		! Mem[0000000030000063]
	addc	%l1,%l0,%l0
	orn	%l7,%l0,%l6
	std	%l0,[%i2+0x020]		! Mem[0000000031000020]
	sub	%l0,%l5,%l1
	retl
	ldd	[%i2+0x060],%l2		! Mem[0000000031000060]
p3_jmpl_0_le:
	nop
	udivx	%l4,-0x8c6,%l1
	xorcc	%l7,0xbf0,%l0
	jmpl	%g6+8,%g0
	smul	%l5,%l2,%l6
p3_call_0_le:
	taddcc	%l2,0xda0,%l6
	udiv	%l5,-0x716,%l4
	and	%l6,0xbdf,%l7
	stw	%l1,[%o2+0x038]		! Mem[0000000031000038]
	addc	%l0,%l7,%l4
	xnor	%l6,%l1,%l1
	retl
	addccc	%l3,%l1,%l3
p3_jmpl_0_lo:
	nop
	udivx	%l4,-0x8c6,%l1
	xorcc	%l7,0xbf0,%l0
	jmpl	%g6+8,%g0
	smul	%l5,%l2,%l6
p3_call_0_lo:
	taddcc	%l2,0xda0,%l6
	udiv	%l5,-0x716,%l4
	and	%l6,0xbdf,%l7
	stw	%l1,[%i2+0x038]		! Mem[0000000031000038]
	addc	%l0,%l7,%l4
	xnor	%l6,%l1,%l1
	retl
	addccc	%l3,%l1,%l3
p3_jmpl_0_he:
	xor	%l6,%l2,%l0
	jmpl	%g6+8,%g0
	orcc	%l2,-0xe44,%l2
p3_call_0_he:
	stb	%l6,[%i3+0x0c3]		! Mem[000000001d8000c3]
	prefetch [%i2+0x1c0],16
	subc	%l3,0xf63,%l6
	stb	%l1,[%o2+0x070]		! Mem[0000000031000070]
	orn	%l6,0xc0d,%l1
	retl
	orn	%l5,0x7a4,%l5
p3_jmpl_0_ho:
	xor	%l6,%l2,%l0
	jmpl	%g6+8,%g0
	orcc	%l2,-0xe44,%l2
p3_call_0_ho:
	stb	%l6,[%o3+0x0c3]		! Mem[000000001d8000c3]
	prefetch [%o2+0x1c0],16
	subc	%l3,0xf63,%l6
	stb	%l1,[%i2+0x070]		! Mem[0000000031000070]
	orn	%l6,0xc0d,%l1
	retl
	orn	%l5,0x7a4,%l5
user_jump0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	or	%l5,0xa58,%l0
	sra	%l7,0x017,%l2
	nop
	lduw	[%o3+0x044],%l0		! Mem[0000000031800044]
	stb	%l3,[%i0+0x0b5]		! Mem[00000000100000b5]
	ldsb	[%o1+0x000],%l5		! Mem[0000000030800000]
	jmpl	%g6+8,%g0
	stx	%l5,[%i0+0x0f8]		! Mem[00000000100000f8]
p0_call_1_le:
	ldx	[%i2+0x008],%l1		! Mem[0000000011000008]
	sra	%l1,0x019,%l2
	orn	%l1,-0x7fe,%l2
	lduw	[%o0+0x048],%l7		! Mem[0000000030000048]
	srl	%l4,0x00e,%l7
	retl
	addcc	%l5,-0xa41,%l5
p0_jmpl_1_lo:
	or	%l5,0xa58,%l0
	sra	%l7,0x017,%l2
	nop
	lduw	[%i3+0x044],%l0		! Mem[0000000031800044]
	stb	%l3,[%o0+0x0b5]		! Mem[00000000100000b5]
	ldsb	[%i1+0x000],%l5		! Mem[0000000030800000]
	jmpl	%g6+8,%g0
	stx	%l5,[%o0+0x0f8]		! Mem[00000000100000f8]
p0_call_1_lo:
	ldx	[%o2+0x008],%l1		! Mem[0000000011000008]
	sra	%l1,0x019,%l2
	orn	%l1,-0x7fe,%l2
	lduw	[%i0+0x048],%l7		! Mem[0000000030000048]
	srl	%l4,0x00e,%l7
	retl
	addcc	%l5,-0xa41,%l5
p0_jmpl_1_he:
	xnorcc	%l2,%l2,%l7
	prefetch [%i2+0x020],4
	jmpl	%g6+8,%g0
	sra	%l5,%l5,%l4
p0_call_1_he:
	addc	%l1,%l4,%l4
	addccc	%l5,-0x78b,%l7
	udiv	%l3,0x7e8,%l5
	lduw	[%i1+0x094],%l4		! Mem[0000000010800094]
	sub	%l1,%l6,%l4
	ldsh	[%i3+0x0be],%l4		! Mem[00000000118000be]
	retl
	ldub	[%i0+0x0b1],%l1		! Mem[00000000100000b1]
p0_jmpl_1_ho:
	xnorcc	%l2,%l2,%l7
	prefetch [%o2+0x020],4
	jmpl	%g6+8,%g0
	sra	%l5,%l5,%l4
p0_call_1_ho:
	addc	%l1,%l4,%l4
	addccc	%l5,-0x78b,%l7
	udiv	%l3,0x7e8,%l5
	lduw	[%o1+0x094],%l4		! Mem[0000000010800094]
	sub	%l1,%l6,%l4
	ldsh	[%o3+0x0be],%l4		! Mem[00000000118000be]
	retl
	ldub	[%o0+0x0b1],%l1		! Mem[00000000100000b1]
p1_jmpl_1_le:
	prefetch [%i1+0x1c0],23
	swap	[%i2+0x1b4],%l3		! Mem[00000000150001b4]
	prefetch [%i4+0x0e0],22
	subc	%l7,%l4,%l0
	ldd	[%o2+0x050],%l0		! Mem[0000000031000050]
	jmpl	%g6+8,%g0
	stw	%l0,[%i1+0x1b4]		! Mem[00000000148001b4]
p1_call_1_le:
	ldsh	[%i1+0x092],%l5		! Mem[0000000014800092]
	prefetch [%i1+0x000],23
	retl
	prefetch [%i0+0x020],1
p1_jmpl_1_lo:
	prefetch [%o1+0x1c0],23
	swap	[%o2+0x1b4],%l3		! Mem[00000000150001b4]
	prefetch [%o4+0x0e0],22
	subc	%l7,%l4,%l0
	ldd	[%i2+0x050],%l0		! Mem[0000000031000050]
	jmpl	%g6+8,%g0
	stw	%l0,[%o1+0x1b4]		! Mem[00000000148001b4]
p1_call_1_lo:
	ldsh	[%o1+0x092],%l5		! Mem[0000000014800092]
	prefetch [%o1+0x000],23
	retl
	prefetch [%o0+0x020],1
p1_jmpl_1_he:
	tsubcc	%l0,-0x88a,%l1
	orn	%l4,-0xe89,%l7
	prefetch [%i2+0x100],4
	xnor	%l3,0x156,%l7
	ldsw	[%i1+0x198],%l4		! Mem[0000000014800198]
	jmpl	%g6+8,%g0
	prefetch [%i6+0x120],4
p1_call_1_he:
	retl
	prefetch [%i2+0x060],2
p1_jmpl_1_ho:
	tsubcc	%l0,-0x88a,%l1
	orn	%l4,-0xe89,%l7
	prefetch [%o2+0x100],4
	xnor	%l3,0x156,%l7
	ldsw	[%o1+0x198],%l4		! Mem[0000000014800198]
	jmpl	%g6+8,%g0
	prefetch [%o6+0x120],4
p1_call_1_ho:
	retl
	prefetch [%o2+0x060],2
p2_jmpl_1_le:
	xnor	%l4,%l1,%l6
	jmpl	%g6+8,%g0
	sll	%l4,0x008,%l6
p2_call_1_le:
	retl
	std	%l0,[%o1+0x028]		! Mem[0000000030800028]
p2_jmpl_1_lo:
	xnor	%l4,%l1,%l6
	jmpl	%g6+8,%g0
	sll	%l4,0x008,%l6
p2_call_1_lo:
	retl
	std	%l0,[%i1+0x028]		! Mem[0000000030800028]
p2_jmpl_1_he:
	stw	%l6,[%o3+0x06c]		! Mem[000000003180006c]
	udiv	%l2,0xaec,%l2
	ldsw	[%o1+0x068],%l4		! Mem[0000000030800068]
	tsubcc	%l6,%l5,%l4
	jmpl	%g6+8,%g0
	prefetch [%i2+0x120],16
p2_call_1_he:
	ldstub	[%o3+0x063],%l1		! Mem[0000000031800063]
	udivcc	%l0,-0xc2c,%l0
	addc	%l5,%l7,%l0
	retl
	smulcc	%l4,%l2,%l5
p2_jmpl_1_ho:
	stw	%l6,[%i3+0x06c]		! Mem[000000003180006c]
	udiv	%l2,0xaec,%l2
	ldsw	[%i1+0x068],%l4		! Mem[0000000030800068]
	tsubcc	%l6,%l5,%l4
	jmpl	%g6+8,%g0
	prefetch [%o2+0x120],16
p2_call_1_ho:
	ldstub	[%i3+0x063],%l1		! Mem[0000000031800063]
	udivcc	%l0,-0xc2c,%l0
	addc	%l5,%l7,%l0
	retl
	smulcc	%l4,%l2,%l5
p3_jmpl_1_le:
	addcc	%l6,%l6,%l2
	jmpl	%g6+8,%g0
	sll	%l4,0x011,%l3
p3_call_1_le:
	prefetch [%i2+0x0e0],0
	retl
	lduw	[%i1+0x0d0],%l3		! Mem[000000001c8000d0]
p3_jmpl_1_lo:
	addcc	%l6,%l6,%l2
	jmpl	%g6+8,%g0
	sll	%l4,0x011,%l3
p3_call_1_lo:
	prefetch [%o2+0x0e0],0
	retl
	lduw	[%o1+0x0d0],%l3		! Mem[000000001c8000d0]
p3_jmpl_1_he:
	srlx	%l6,0x031,%l4
	sdiv	%l5,-0x073,%l0
	ldsh	[%i1+0x01c],%l7		! Mem[000000001c80001c]
	prefetch [%i1+0x000],2
	andcc	%l1,%l4,%l6
	prefetch [%i3+0x140],0
	jmpl	%g6+8,%g0
	std	%l2,[%o2+0x078]		! Mem[0000000031000078]
p3_call_1_he:
	sdivx	%l2,0xd20,%l7
	udivcc	%l5,0xc1c,%l6
	retl
	lduh	[%i2+0x112],%l6		! Mem[000000001d000112]
p3_jmpl_1_ho:
	srlx	%l6,0x031,%l4
	sdiv	%l5,-0x073,%l0
	ldsh	[%o1+0x01c],%l7		! Mem[000000001c80001c]
	prefetch [%o1+0x000],2
	andcc	%l1,%l4,%l6
	prefetch [%o3+0x140],0
	jmpl	%g6+8,%g0
	std	%l2,[%i2+0x078]		! Mem[0000000031000078]
p3_call_1_ho:
	sdivx	%l2,0xd20,%l7
	udivcc	%l5,0xc1c,%l6
	retl
	lduh	[%o2+0x112],%l6		! Mem[000000001d000112]
user_jump1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	orncc	%l0,%l5,%l2
	andn	%l1,-0x0e8,%l6
	mulx	%l4,-0x457,%l2
	andcc	%l6,%l4,%l5
	mulx	%l5,%l2,%l6
	jmpl	%g6+8,%g0
	std	%l6,[%i0+0x020]		! Mem[0000000010000020]
p0_call_2_le:
	retl
	addccc	%l2,%l3,%l2
p0_jmpl_2_lo:
	orncc	%l0,%l5,%l2
	andn	%l1,-0x0e8,%l6
	mulx	%l4,-0x457,%l2
	andcc	%l6,%l4,%l5
	mulx	%l5,%l2,%l6
	jmpl	%g6+8,%g0
	std	%l6,[%o0+0x020]		! Mem[0000000010000020]
p0_call_2_lo:
	retl
	addccc	%l2,%l3,%l2
p0_jmpl_2_he:
	ldsh	[%o2+0x042],%l6		! Mem[0000000031000042]
	addc	%l3,%l0,%l0
	sdivcc	%l7,-0xda4,%l2
	sdivcc	%l4,-0xee5,%l6
	sll	%l7,%l2,%l7
	addc	%l0,%l5,%l1
	jmpl	%g6+8,%g0
	sdivx	%l7,-0xa4c,%l0
p0_call_2_he:
	retl
	subc	%l2,%l3,%l3
p0_jmpl_2_ho:
	ldsh	[%i2+0x042],%l6		! Mem[0000000031000042]
	addc	%l3,%l0,%l0
	sdivcc	%l7,-0xda4,%l2
	sdivcc	%l4,-0xee5,%l6
	sll	%l7,%l2,%l7
	addc	%l0,%l5,%l1
	jmpl	%g6+8,%g0
	sdivx	%l7,-0xa4c,%l0
p0_call_2_ho:
	retl
	subc	%l2,%l3,%l3
p1_jmpl_2_le:
	udiv	%l4,0xe2d,%l6
	sdivcc	%l6,0xf35,%l1
	sll	%l1,0x015,%l5
	srax	%l3,0x018,%l2
	stw	%l0,[%i0+0x150]		! Mem[0000000014000150]
	jmpl	%g6+8,%g0
	srax	%l4,%l7,%l2
p1_call_2_le:
	orn	%l5,-0xef1,%l6
	umulcc	%l0,0x455,%l3
	taddcc	%l6,%l7,%l3
	subc	%l0,-0x682,%l0
	xnorcc	%l7,%l7,%l2
	sllx	%l4,%l4,%l4
	retl
	sdivcc	%l3,-0x49b,%l7
p1_jmpl_2_lo:
	udiv	%l4,0xe2d,%l6
	sdivcc	%l6,0xf35,%l1
	sll	%l1,0x015,%l5
	srax	%l3,0x018,%l2
	stw	%l0,[%o0+0x150]		! Mem[0000000014000150]
	jmpl	%g6+8,%g0
	srax	%l4,%l7,%l2
p1_call_2_lo:
	orn	%l5,-0xef1,%l6
	umulcc	%l0,0x455,%l3
	taddcc	%l6,%l7,%l3
	subc	%l0,-0x682,%l0
	xnorcc	%l7,%l7,%l2
	sllx	%l4,%l4,%l4
	retl
	sdivcc	%l3,-0x49b,%l7
p1_jmpl_2_he:
	or	%l7,%l2,%l2
	jmpl	%g6+8,%g0
	and	%l4,%l4,%l0
p1_call_2_he:
	udiv	%l7,-0x9bf,%l5
	sra	%l6,%l0,%l4
	udivcc	%l3,0xa84,%l7
	prefetch [%i0+0x0e0],22
	lduw	[%o2+0x018],%l5		! Mem[0000000031000018]
	retl
	andncc	%l1,0x48b,%l1
p1_jmpl_2_ho:
	or	%l7,%l2,%l2
	jmpl	%g6+8,%g0
	and	%l4,%l4,%l0
p1_call_2_ho:
	udiv	%l7,-0x9bf,%l5
	sra	%l6,%l0,%l4
	udivcc	%l3,0xa84,%l7
	prefetch [%o0+0x0e0],22
	lduw	[%i2+0x018],%l5		! Mem[0000000031000018]
	retl
	andncc	%l1,0x48b,%l1
p2_jmpl_2_le:
	prefetch [%i2+0x080],0
	jmpl	%g6+8,%g0
	andn	%l0,-0xbfd,%l3
p2_call_2_le:
	prefetch [%i3+0x180],0
	retl
	addccc	%l3,0x5c7,%l0
p2_jmpl_2_lo:
	prefetch [%o2+0x080],0
	jmpl	%g6+8,%g0
	andn	%l0,-0xbfd,%l3
p2_call_2_lo:
	prefetch [%o3+0x180],0
	retl
	addccc	%l3,0x5c7,%l0
p2_jmpl_2_he:
	ldx	[%i2+0x188],%l5		! Mem[0000000019000188]
	subc	%l6,-0xc7a,%l3
	stw	%l0,[%i2+0x08c]		! Mem[000000001900008c]
	prefetch [%i3+0x120],0
	mulx	%l2,-0xbbb,%l7
	xorcc	%l5,%l1,%l6
	jmpl	%g6+8,%g0
	ldsw	[%o2+0x028],%l7		! Mem[0000000031000028]
p2_call_2_he:
	prefetch [%i3+0x020],20
	andn	%l2,-0x26f,%l4
	retl
	prefetch [%i1+0x100],22
p2_jmpl_2_ho:
	ldx	[%o2+0x188],%l5		! Mem[0000000019000188]
	subc	%l6,-0xc7a,%l3
	stw	%l0,[%o2+0x08c]		! Mem[000000001900008c]
	prefetch [%o3+0x120],0
	mulx	%l2,-0xbbb,%l7
	xorcc	%l5,%l1,%l6
	jmpl	%g6+8,%g0
	ldsw	[%i2+0x028],%l7		! Mem[0000000031000028]
p2_call_2_ho:
	prefetch [%o3+0x020],20
	andn	%l2,-0x26f,%l4
	retl
	prefetch [%o1+0x100],22
p3_jmpl_2_le:
	jmpl	%g6+8,%g0
	mulx	%l7,%l3,%l6
p3_call_2_le:
	prefetch [%i3+0x1c0],4
	prefetch [%i2+0x160],20
	sdiv	%l6,0xa8f,%l6
	umul	%l4,%l4,%l1
	retl
	addc	%l2,%l0,%l0
p3_jmpl_2_lo:
	jmpl	%g6+8,%g0
	mulx	%l7,%l3,%l6
p3_call_2_lo:
	prefetch [%o3+0x1c0],4
	prefetch [%o2+0x160],20
	sdiv	%l6,0xa8f,%l6
	umul	%l4,%l4,%l1
	retl
	addc	%l2,%l0,%l0
p3_jmpl_2_he:
	std	%l2,[%i2+0x1f8]		! Mem[000000001d0001f8]
	jmpl	%g6+8,%g0
	prefetch [%i0+0x160],20
p3_call_2_he:
	prefetch [%i5+0x140],23
	retl
	sdivx	%l1,0xce2,%l5
p3_jmpl_2_ho:
	std	%l2,[%o2+0x1f8]		! Mem[000000001d0001f8]
	jmpl	%g6+8,%g0
	prefetch [%o0+0x160],20
p3_call_2_ho:
	prefetch [%o5+0x140],23
	retl
	sdivx	%l1,0xce2,%l5
user_jump2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	subccc	%l4,0xb2a,%l1
	jmpl	%g6+8,%g0
	sra	%l3,%l3,%l2
p0_call_3_le:
	std	%l4,[%o3+0x008]		! Mem[0000000031800008]
	retl
	andncc	%l5,%l5,%l6
p0_jmpl_3_lo:
	subccc	%l4,0xb2a,%l1
	jmpl	%g6+8,%g0
	sra	%l3,%l3,%l2
p0_call_3_lo:
	std	%l4,[%i3+0x008]		! Mem[0000000031800008]
	retl
	andncc	%l5,%l5,%l6
p0_jmpl_3_he:
	taddcc	%l0,%l3,%l7
	prefetch [%i2+0x080],23
	subc	%l4,%l7,%l7
	nop
	jmpl	%g6+8,%g0
	ldsh	[%o5+0x012],%l3		! Mem[0000000040000012]
p0_call_3_he:
	prefetch [%i3+0x080],0
	ldub	[%o0+0x043],%l1		! Mem[0000000030000043]
	srax	%l0,%l0,%l4
	sdivx	%l6,0x379,%l4
	retl
	udivcc	%l3,-0xbb6,%l2
p0_jmpl_3_ho:
	taddcc	%l0,%l3,%l7
	prefetch [%o2+0x080],23
	subc	%l4,%l7,%l7
	nop
	jmpl	%g6+8,%g0
	ldsh	[%i5+0x012],%l3		! Mem[0000000040000012]
p0_call_3_ho:
	prefetch [%o3+0x080],0
	ldub	[%i0+0x043],%l1		! Mem[0000000030000043]
	srax	%l0,%l0,%l4
	sdivx	%l6,0x379,%l4
	retl
	udivcc	%l3,-0xbb6,%l2
p1_jmpl_3_le:
	ldx	[%o0+0x058],%l5		! Mem[0000000030000058]
	nop
	jmpl	%g6+8,%g0
	ldsb	[%i0+0x09e],%l5		! Mem[000000001400009e]
p1_call_3_le:
	retl
	smulcc	%l7,-0x4e6,%l2
p1_jmpl_3_lo:
	ldx	[%i0+0x058],%l5		! Mem[0000000030000058]
	nop
	jmpl	%g6+8,%g0
	ldsb	[%o0+0x09e],%l5		! Mem[000000001400009e]
p1_call_3_lo:
	retl
	smulcc	%l7,-0x4e6,%l2
p1_jmpl_3_he:
	ldsw	[%i0+0x0ac],%l7		! Mem[00000000140000ac]
	andncc	%l4,%l3,%l5
	sub	%l5,%l6,%l6
	jmpl	%g6+8,%g0
	or	%l3,%l3,%l3
p1_call_3_he:
	subccc	%l0,-0xc97,%l7
	srax	%l5,0x039,%l4
	retl
	smul	%l7,%l1,%l7
p1_jmpl_3_ho:
	ldsw	[%o0+0x0ac],%l7		! Mem[00000000140000ac]
	andncc	%l4,%l3,%l5
	sub	%l5,%l6,%l6
	jmpl	%g6+8,%g0
	or	%l3,%l3,%l3
p1_call_3_ho:
	subccc	%l0,-0xc97,%l7
	srax	%l5,0x039,%l4
	retl
	smul	%l7,%l1,%l7
p2_jmpl_3_le:
	smul	%l0,%l3,%l1
	jmpl	%g6+8,%g0
	nop
p2_call_3_le:
	ldstub	[%o3+0x061],%l6		! Mem[0000000031800061]
	retl
	udiv	%l4,-0x53a,%l7
p2_jmpl_3_lo:
	smul	%l0,%l3,%l1
	jmpl	%g6+8,%g0
	nop
p2_call_3_lo:
	ldstub	[%i3+0x061],%l6		! Mem[0000000031800061]
	retl
	udiv	%l4,-0x53a,%l7
p2_jmpl_3_he:
	ldx	[%i3+0x1d0],%l7		! Mem[00000000198001d0]
	taddcc	%l3,%l5,%l2
	orncc	%l2,%l1,%l7
	tsubcc	%l5,0x574,%l1
	sth	%l3,[%o3+0x068]		! Mem[0000000031800068]
	prefetch [%i2+0x040],23
	jmpl	%g6+8,%g0
	sdivx	%l5,-0x8cd,%l1
p2_call_3_he:
	sdivx	%l2,-0x55b,%l2
	retl
	sdivx	%l2,-0x30e,%l1
p2_jmpl_3_ho:
	ldx	[%o3+0x1d0],%l7		! Mem[00000000198001d0]
	taddcc	%l3,%l5,%l2
	orncc	%l2,%l1,%l7
	tsubcc	%l5,0x574,%l1
	sth	%l3,[%i3+0x068]		! Mem[0000000031800068]
	prefetch [%o2+0x040],23
	jmpl	%g6+8,%g0
	sdivx	%l5,-0x8cd,%l1
p2_call_3_ho:
	sdivx	%l2,-0x55b,%l2
	retl
	sdivx	%l2,-0x30e,%l1
p3_jmpl_3_le:
	jmpl	%g6+8,%g0
	stx	%l2,[%i1+0x0d0]		! Mem[000000001c8000d0]
p3_call_3_le:
	ldub	[%i3+0x189],%l4		! Mem[000000001d800189]
	xnor	%l6,-0xa1b,%l5
	subc	%l4,-0xcbd,%l6
	or	%l6,%l6,%l2
	retl
	prefetch [%i3+0x100],22
p3_jmpl_3_lo:
	jmpl	%g6+8,%g0
	stx	%l2,[%o1+0x0d0]		! Mem[000000001c8000d0]
p3_call_3_lo:
	ldub	[%o3+0x189],%l4		! Mem[000000001d800189]
	xnor	%l6,-0xa1b,%l5
	subc	%l4,-0xcbd,%l6
	or	%l6,%l6,%l2
	retl
	prefetch [%o3+0x100],22
p3_jmpl_3_he:
	smulcc	%l7,%l7,%l7
	jmpl	%g6+8,%g0
	andn	%l2,%l1,%l2
p3_call_3_he:
	std	%l0,[%o2+0x038]		! Mem[0000000031000038]
	retl
	orcc	%l2,0x074,%l2
p3_jmpl_3_ho:
	smulcc	%l7,%l7,%l7
	jmpl	%g6+8,%g0
	andn	%l2,%l1,%l2
p3_call_3_ho:
	std	%l0,[%i2+0x038]		! Mem[0000000031000038]
	retl
	orcc	%l2,0x074,%l2
user_jump3_end:

	.seg	"data"
	ALIGN_PAGE_8K
user_data_start:
done_flags:
	.word	0
	.word	0
	.word	0
	.word	0
Start_Flags:
	.word	0,0
	.align	8
num_processors:
	.word	4
num_agents:
	.word	0
max_freg:
	.word	32,0
	.align	64
p0_temp:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p1_temp:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p2_temp:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p3_temp:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_debug:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_fsr:
	.word	0x00000000
p0_loop_cnt:
	.word	0x00000001
p1_debug:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p1_fsr:
	.word	0x00000000
p1_loop_cnt:
	.word	0x00000001
p2_debug:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p2_fsr:
	.word	0x00000000
p2_loop_cnt:
	.word	0x00000001
p3_debug:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p3_fsr:
	.word	0x00000000
p3_loop_cnt:
	.word	0x00000001
max_windows:
	.word	1,1,1,1,0,0,0,0
	.word	0,0,0,0,0,0,0,0

	.align	8
p0_init_registers:
	.word	0xad14d600,0x6e235506		! Init value for %l0
	.word	0xe473c3ff,0x9eacc79c		! Init value for %l1
	.word	0x180b37ff,0xaca8da5a		! Init value for %l2
	.word	0x6cf1d2ff,0xca61f1bc		! Init value for %l3
	.word	0xa8aeb400,0x3ba4cb2e		! Init value for %l4
	.word	0x52610500,0x4a2dd02f		! Init value for %l5
	.word	0xe71c18ff,0xa6745895		! Init value for %l6
	.word	0x6e39e900,0x2c791c14		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x87d95717,0x9ca2b74a		! Init value for %f0 
	.word	0x86f8a115,0x91f4af38		! Init value for %f2 
	.word	0x272de770,0xd665656b		! Init value for %f4 
	.word	0x99815ad7,0x003e8115		! Init value for %f6 
	.word	0xe1d1f125,0xa55863a6		! Init value for %f8 
	.word	0x4f96dd50,0xaa6385ad		! Init value for %f10
	.word	0x5a758dc3,0xa7914059		! Init value for %f12
	.word	0x7986e64a,0xd566d89b		! Init value for %f14
	.word	0xb50fc891,0xc0be7043		! Init value for %f16
	.word	0xc9a434bd,0xb81c9f02		! Init value for %f18
	.word	0x4beabdc9,0x2bbc20d1		! Init value for %f20
	.word	0xf72db874,0xc2e19a26		! Init value for %f22
	.word	0x10ba90ee,0x2c8258cd		! Init value for %f24
	.word	0x57f3c69e,0xcecc15df		! Init value for %f26
	.word	0xaed337e9,0x4e66907b		! Init value for %f28
	.word	0xbf05028e,0x7ad68ff4		! Init value for %f30
	.word	0x7fc9485c,0xc2e67146		! Init value for %f32
	.word	0xef6c9c52,0xdb8c1067		! Init value for %f34
	.word	0xcf6a3a55,0x85ef7d9b		! Init value for %f36
	.word	0xf3a2b37f,0xf1262823		! Init value for %f38
	.word	0x2810c2ae,0xa8e7eb8c		! Init value for %f40
	.word	0x824af7ab,0x151752ad		! Init value for %f42
	.word	0x3ece4204,0xb73b6fc7		! Init value for %f44
	.word	0x2aac775f,0xe5451472		! Init value for %f46
	.word	0xe58cbe52,0x97791176
	.word	0xdf95d661,0xd0933bc0
	.word	0x30dd1076,0x812d0e21
	.word	0x151f0add,0x81036262
	.word	0x4c9f1b95,0x0ab1ddf7
	.word	0x1b844cfa,0xfae46b95
	.word	0x8ecc30ed,0xe20ac171
	.word	0x658a5038,0xa3bdf5a8
p0_share_mask:
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_registers:
	.word	0xffffffff,0xfffff61e
	.word	0x00000000,0xffffffff
	.word	0xffffffff,0xfffff36c
	.word	0x00000000,0x0000053b
	.word	0x00000000,0xc9ad9853
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000003b9
	.word	0x00000000,0x00000b22
p0_expected_fp_regs:
	.word	0xffffffff,0x00000000
	.word	0xc3700000,0x87d95717
	.word	0x00000000,0x000000e0
	.word	0x00000000,0x1d000000
	.word	0x41ddcb6e,0xd3600000
	.word	0xc26c0000,0xd3600000
	.word	0x7fffffff,0xc9b434bd
	.word	0x426c0000,0x00000000
	.word	0x7fffffff,0xc9b434bd
	.word	0x43600000,0x41ddcb6e
	.word	0x87d95717,0x41ddcb6e
	.word	0xf72db874,0xc2e19a26
	.word	0x427c0000,0x00000000
	.word	0xffffffff,0x00000000
	.word	0x773db874,0x99f51080
	.word	0x773db874,0x99f51080
	.word	0x7fc9485c,0xc2e67146
	.word	0xef6c9c52,0xdb8c1067
	.word	0xcf6a3a55,0x85ef7d9b
	.word	0xf3a2b37f,0xf1262823
	.word	0x2810c2ae,0xa8e7eb8c
	.word	0x824af7ab,0x151752ad
	.word	0x3ece4204,0xb73b6fc7
	.word	0x2aac775f,0xe5451472
p0_local0_expect:
	.word	0x00000000,0xff000020
	.word	0xfff92cf5,0xffffff96
	.word	0x3b6d71d2,0xfa640d39
	.word	0x879233d2,0x29e5705c
	.word	0x00000000,0x000bfe48
	.word	0x000000dd,0x85710090
	.word	0xda9759b1,0xd21da992
	.word	0xa1c44d5f,0x8af82783
	.word	0x75c7047b,0xe9b25eaa
	.word	0xaca8da5a,0x0520f1bc
	.word	0x30650ed2,0x6429d89e
	.word	0x9d1a9985,0x40e3d24f
	.word	0xe6566435,0x1f7986d2
	.word	0x0b23aed7,0x19d8e6f6
	.word	0x63f36b9a,0x69cbb7b6
	.word	0xdd1bea36,0x12c9f19d
	.word	0xf504f1e0,0x27a075d6
	.word	0x2733a272,0x000bfe48
	.word	0xc4ffc3ac,0x34a993b7
	.word	0x0000fabe,0xf0da61b4
	.word	0x00000000,0x00000001
	.word	0x6363e375,0x058a1eca
	.word	0x500fc212,0x82bf09c8
	.word	0xaaf3a69a,0xc98fb3ba
	.word	0x4898aacc,0xf03f3ee1
	.word	0x0dd1b965,0xbbcb821f
	.word	0x9300d99d,0xca61f1bc
	.word	0x536b29fc,0x351225c2
	.word	0x2297b268,0xac1b9de6
	.word	0x000000e0,0x1fcb562d
	.word	0x016c1391,0xb2f3f8ea
	.word	0x9fe1f71b,0xddffd225
p0_local1_expect:
	.word	0xff000000,0x00000000
	.word	0xc32cffff,0xd53dc716
	.word	0x47b767cb,0x000000e9
	.word	0x80b4e16d,0x00d7472d
	.word	0x9e0d45b2,0xe0cf9813
	.word	0x757dccc4,0xe939d543
	.word	0xfb363a37,0xa590ca40
	.word	0x54047e91,0xb58377ba
	.word	0x56ffaaac,0xc446715f
	.word	0x1ee24d64,0x69b79a56
	.word	0x6d10b99b,0xd53dc716
	.word	0x00000000,0x00000090
	.word	0x85f0c657,0x5b381f7f
	.word	0x43c8c412,0x92647f50
	.word	0xaceac56f,0x8d7aa51c
	.word	0xeb2afd75,0x35481346
	.word	0x9b354066,0x93df3494
	.word	0x32eb9fb1,0x0089f099
	.word	0x00000000,0x000000d2
	.word	0x0001ffff,0xffffffff
	.word	0xfffff7df,0x0000006c
	.word	0xfef233c6,0x0ef219e0
	.word	0x5e4e1005,0xa07b3116
	.word	0x27a075d6,0xfffffd8e
	.word	0x3f474d42,0x279a4243
	.word	0xcbf8fd3a,0x00019278
	.word	0x5ba6a7ab,0xd1ae859b
	.word	0x9f58e547,0x73947408
	.word	0xa9ffc704,0xc78dbc23
	.word	0x37c675e2,0x183fe540
	.word	0x47d50bc0,0xed95a142
	.word	0x00000000,0x296d9635
p0_local2_expect:
	.word	0x00000000,0xffffffff
	.word	0xffff0000,0x8fdf76dd
	.word	0xe67763fc,0xf51a0a95
	.word	0x96c80399,0x63db51b0
	.word	0x9913992b,0x91ee9f27
	.word	0xa142f1f6,0x29eea795
	.word	0x83d18cdf,0xcf0a25c9
	.word	0x76d68fd5,0xc895be88
	.word	0x95cf4ce4,0xac36718b
	.word	0xb1f71998,0x5a20c246
	.word	0x00000000,0x00000128
	.word	0xf0da61b4,0x00003415
	.word	0x00000000,0x00000000
	.word	0xd6106887,0x2a42e629
	.word	0xd78bd19d,0xa2275099
	.word	0xf1d03f88,0x43a0d3f5
	.word	0x684ddc51,0xb6365dbc
	.word	0x86a70789,0xe8bc3fbf
	.word	0x6b1a435d,0x9f2631a6
	.word	0x468327a1,0xc50911b9
	.word	0x6307e9be,0x64a79ecf
	.word	0xfa15ce90,0xffff96cc
	.word	0x782b192b,0x9dd08adf
	.word	0x04b38dc6,0xa4b8361f
	.word	0x360e1f54,0xda2f2ca1
	.word	0xffffeb2a,0xffffffff
	.word	0x0000337b,0xce944797
	.word	0x1f07212e,0x57c6b776
	.word	0xa72511d3,0x3f05fdd2
	.word	0x00000090,0x667eddd0
	.word	0x74529aa3,0xda17c2dc
	.word	0x160a93c3,0x656d5720
p0_local3_expect:
	.word	0x27e45d96,0x0000ffff
	.word	0xfffff36c,0x0000782b
	.word	0xa70f906f,0x05f39874
	.word	0xa8d2ff28,0x7206cc2a
	.word	0x4145e0b1,0xe3f639de
	.word	0xb5e948da,0xea6fc8d9
	.word	0x00ccfdb5,0xe863a98e
	.word	0x2a7b9431,0xde4f2cb8
	.word	0xab4829c8,0x6c3c45be
	.word	0x7c99292c,0xc06347c6
	.word	0xe1164aad,0x2b895b39
	.word	0x1b49b945,0x10e09d51
	.word	0xe880fedf,0xf4279a06
	.word	0x719224de,0xec0035f6
	.word	0x667fd634,0xf004ff5c
	.word	0x5eda2e42,0xbccbbd6f
	.word	0x440c8f81,0x157101d6
	.word	0x599ae65a,0x38247509
	.word	0x98066036,0xb0e85efd
	.word	0x497fff45,0x40d0edb2
	.word	0x12d0e7fd,0xc6f34d3d
	.word	0x33e94237,0x7e66b217
	.word	0x7f776bcf,0x71798252
	.word	0xac63ece7,0x61fee41d
	.word	0xa194fd2e,0xd844d2d6
	.word	0x869c6e8f,0xd5429d30
	.word	0x86868ae2,0x2d53b881
	.word	0xc75676db,0x24dc6d6c
	.word	0x48b63aec,0x7006db94
	.word	0xfb797efd,0x75341c90
	.word	0xffca493e,0xdd75f5df
	.word	0x1fa8b6e3,0x903c9b4d
p0_local4_expect:
	.word	0x80e13caf,0xf41bcab9
	.word	0x39939b04,0x240f83a3
	.word	0xff104396,0x35bcbaae
	.word	0x5aadef19,0x0e0471ea
	.word	0xb96e3085,0x2d56f1a9
	.word	0x1c3390e9,0x2496344f
	.word	0x2c3d469b,0x4fe6fd4c
	.word	0x7206152a,0x40ffdc0f
	.word	0x53f04dfd,0xaab3d2b7
	.word	0x6a1b14f2,0x0cb359c8
	.word	0x1a0824e0,0x3302299a
	.word	0x08ae4991,0x59a3ba9e
	.word	0xf109a182,0xd4804479
	.word	0x62304d81,0x2c71c832
	.word	0xce58ee57,0x71e1dbdb
	.word	0xb502b338,0x3aa2173b
	.word	0xe1d26a14,0xafcbf3d7
	.word	0x3f5a5ccd,0xfe39be4f
	.word	0x8acde955,0x0b579986
	.word	0x1219f20e,0xa7900edd
	.word	0x4218594d,0x58c93cdc
	.word	0xbf06b51f,0x2d95864b
	.word	0x484513cd,0xdd893357
	.word	0x8688bbb2,0x8ceac85b
	.word	0x170f30c5,0xe33e3f0c
	.word	0xdd7c3db1,0xb39f9e60
	.word	0x885f60c6,0xf2f12c4d
	.word	0x08d3670b,0xcd65e445
	.word	0x0bd16c01,0x1e33c107
	.word	0x994ea291,0xb10decf6
	.word	0xe4450779,0xf35e5204
	.word	0xb4e471e0,0x1da4fc71
p0_local5_expect:
	.word	0x824f1131,0xc46b9f58
	.word	0x8208239a,0x5bbe1d68
	.word	0xddf03d1e,0x20c94c14
	.word	0x05c4c341,0x7c32ace2
	.word	0xc6c7ff7c,0xc8a2a5c3
	.word	0x6a09ac7c,0x059f964b
	.word	0x8cec38a7,0x21191b81
	.word	0x51effe0e,0x51ee7d4d
	.word	0x8d840530,0xd48e8681
	.word	0x3884db5d,0x88472bca
	.word	0xf6db6800,0xdc31e206
	.word	0x8798d579,0x0f379f83
	.word	0x3eec88d2,0x80396ea2
	.word	0x8b5b9ac0,0xd27ec343
	.word	0x089b4c1d,0xb3b5470f
	.word	0xf354fe57,0xa24b1f0b
	.word	0x91f3baa2,0xa66c1932
	.word	0x35700f56,0xeee9301c
	.word	0x3a29125b,0xc6058817
	.word	0x0e42818a,0x6da629e9
	.word	0x388c61c1,0x3c0314aa
	.word	0x0ffcf499,0xf4f74b89
	.word	0x32c28b32,0xb3a5dec1
	.word	0x35242555,0x2dea9eb1
	.word	0x67d22639,0x849a7f78
	.word	0xe8ca9eff,0x09e951e6
	.word	0xfbb60b56,0x9060f20f
	.word	0x0b6ece98,0x5270939d
	.word	0x687cf664,0xf17606fb
	.word	0x04b5d895,0xc65f9f13
	.word	0x16d4273d,0x0ff4f4f1
	.word	0x7c5f7d81,0xf41e4d2a
p0_local6_expect:
	.word	0x54a2da25,0xfdcb01ca
	.word	0x6cf1d2ff,0xca61f1bc
	.word	0x508a352d,0x66662f4d
	.word	0x499242e8,0xc85f9960
	.word	0xfdbe2c51,0x972a264a
	.word	0x0753da40,0x587cdd8f
	.word	0x4121f5b3,0x2cef978f
	.word	0x49a5e0a3,0x230da98f
	.word	0x51c0707c,0xf9f47f2d
	.word	0x610e7729,0x9a1a3dbf
	.word	0xe0faecfd,0xdad9e0bc
	.word	0x05a26296,0x29de3832
	.word	0x286b7298,0xa4fac6ef
	.word	0xb3a5ae9b,0x7d1f04d5
	.word	0xd1ce25fe,0xb0212502
	.word	0xa05c37be,0xf326c3ca
	.word	0x543b53ca,0x7668e72e
	.word	0x83496025,0xa190364a
	.word	0xa43dc4fa,0x3b140827
	.word	0x18d72c83,0x387c6458
	.word	0xc54a7617,0x5fc8ecb3
	.word	0x4ffc9e45,0xa6d51bc0
	.word	0x131d5a8c,0xde32fee5
	.word	0xefa325f4,0x06d35b26
	.word	0x63c4d947,0xa7aec1b2
	.word	0x2ca3ab01,0x87f26ece
	.word	0x60ce4322,0x186a8c8c
	.word	0x9aaca26f,0x9923a860
	.word	0x8c0d1d6c,0x61c46938
	.word	0x5b8e0ebb,0x5f761ef5
	.word	0x3187fb5b,0xd8f5cb33
	.word	0x670548ca,0x6174a30d
share0_expect:
	.word	0x00000000,0x0000ffff
	.word	0x00000190,0x018a00ff
	.word	0xdc7c94dd,0x6514ffff
	.word	0x00002dc7,0xfffff097
	.word	0x7c6b3ec3,0xff0000a3
	.word	0xff01b485,0xfa61ff00
	.word	0x9b00bb0f,0xcd491776
	.word	0x61dcbd56,0xfffff268
	.word	0xc9ad9853,0xe2dd8139
	.word	0x00000000,0x476ff8d4
	.word	0x00005cff,0x9dff18f1
	.word	0xffffffff,0xff27318d
	.word	0x00000000,0xfb007000
	.word	0x26a0be45,0x5358dc3e
	.word	0x00000000,0x00000000
	.word	0x00000000,0x039bf224
share1_expect:
	.word	0xffffffff,0xfffffbaa
	.word	0x00000000,0xffffffff
	.word	0xf3b9d630,0xff4efb6c
	.word	0x5c233fae,0x2404d07e
	.word	0x00e6c088,0x26a0b445
	.word	0x0000000f,0x5358dc3e
	.word	0x7d9cca87,0x6009fb74
	.word	0x00000000,0xaa9a9cff
	.word	0xfffffbdf,0xfffff1f8
	.word	0x00000000,0x000000ff
	.word	0xe0f04f86,0xb1d316fb
	.word	0x5d2fceb2,0x00006e00
	.word	0x00000000,0x0000ff47
	.word	0x5651c192,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00007d5c
share2_expect:
	.word	0x00000000,0x1fdf9cd0
	.word	0x00000000,0x0000ffff
	.word	0x47327b64,0xbb89ff5c
	.word	0x146a7012,0xff23c9f1
	.word	0x00000001,0xffffbfa1
	.word	0x5358dc0a,0x00000000
	.word	0xd3c12984,0x5c2604bd
	.word	0xbe2dbd60,0x3cdf831e
	.word	0xe1d66c5f,0x612c337b
	.word	0xfffff63d,0x6000008d
	.word	0x000000e9,0x29fae0ff
	.word	0xffffffff,0x00cc002c
	.word	0xa3c05a38,0xfbbe7000
	.word	0xa3c0648f,0xe6b4db69
	.word	0xd8dc1294,0x00000000
	.word	0x00000000,0x2e6b4860
share3_expect:
	.word	0x00000000,0x41808382
	.word	0xffff0000,0x00000000
	.word	0xffec8609,0xff4efb6c
	.word	0x7fffffff,0xe538f398
	.word	0xffffffff,0xa3c0648f
	.word	0x00000000,0x000000c1
	.word	0xe06dffff,0x00f2ce64
	.word	0x00000000,0x000005a3
	.word	0x4dff00ff,0xc31d8551
	.word	0x00000000,0x00003415
	.word	0xb00c0000,0x00000000
	.word	0xea2900fb,0x9b1d60b0
	.word	0x000000ff,0x108c7023
	.word	0x00760000,0x000000a7
	.word	0xb0eda041,0x00ff8a00
	.word	0x9e2342a9,0x00000f98
share4_expect:
p1_init_registers:
	.word	0x700967ff,0xbceea408		! Init value for %l0
	.word	0x120cc0ff,0xdd7f86ed		! Init value for %l1
	.word	0x22643200,0x6bf77361		! Init value for %l2
	.word	0xaab9cbff,0x95771b63		! Init value for %l3
	.word	0x6837bb00,0x5f7119ee		! Init value for %l4
	.word	0x6b6629ff,0xe163fe99		! Init value for %l5
	.word	0xdac2bfff,0xa04120d1		! Init value for %l6
	.word	0xe7fbb4ff,0xddfc4d72		! Init value for %l7
	.align	64
p1_init_freg:
	.word	0x636659fc,0xb58187b0		! Init value for %f0 
	.word	0x89458c1c,0x513f0955		! Init value for %f2 
	.word	0x913e0d8c,0xbf92d587		! Init value for %f4 
	.word	0x804bc7da,0x3f0022f5		! Init value for %f6 
	.word	0xf08588b8,0x06fc7711		! Init value for %f8 
	.word	0x3fb329b1,0xf0c2b031		! Init value for %f10
	.word	0x7beee063,0x0c87130b		! Init value for %f12
	.word	0x3308c626,0xf886a687		! Init value for %f14
	.word	0xd8450d72,0x8ad82340		! Init value for %f16
	.word	0xe5f57be7,0xb59d1d20		! Init value for %f18
	.word	0xad253f6b,0xb8222ade		! Init value for %f20
	.word	0xbd436030,0x2bfdc876		! Init value for %f22
	.word	0x70d2fb20,0x715fd7dc		! Init value for %f24
	.word	0x0ad60ccd,0x389de570		! Init value for %f26
	.word	0xf05d1dd0,0x38590ced		! Init value for %f28
	.word	0x614fb3ef,0xf2d45158		! Init value for %f30
	.word	0xfcccd1eb,0xf87cdc4f		! Init value for %f32
	.word	0x4a30f82e,0x8c644806		! Init value for %f34
	.word	0xa64c4ef6,0x7c8d5c60		! Init value for %f36
	.word	0xbaa036f8,0x33febc8f		! Init value for %f38
	.word	0x5bad70bd,0xdcbb6b6a		! Init value for %f40
	.word	0x2201c0f9,0xe10d7f1b		! Init value for %f42
	.word	0x73ee33d6,0x70b12e3f		! Init value for %f44
	.word	0xeb0a4cdc,0xb8f6ac66		! Init value for %f46
	.word	0x0ff2b070,0x749c609a
	.word	0xf3066704,0x72cf8359
	.word	0x469aaf05,0x2a51b261
	.word	0x144b8c8f,0x78983cb5
	.word	0xaae7949c,0xf6977136
	.word	0xfa76393b,0xa2fd0e3e
	.word	0x1fea139a,0xfd4b0517
	.word	0x7653b034,0xc679d7de
p1_share_mask:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p1_expected_registers:
	.word	0x00000000,0x0938e775
	.word	0xffffffff,0xfffffa39
	.word	0x00000000,0x00000044
	.word	0x00000000,0x0938f5bd
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffff0000
	.word	0x00000000,0x0938f097
	.word	0xffffffff,0xfffffe23
p1_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000001,0x8ad82340
	.word	0x00000000,0x614fb3ef
	.word	0x3fb329b1,0x00000000
	.word	0x80000001,0x8ad82340
	.word	0x00000001,0x8ad82340
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x80000001,0x8ad82340
	.word	0x3ff00000,0x00000000
	.word	0xc65a8a2b,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xfcccd1eb,0xf87cdc4f
	.word	0x4a30f82e,0x8c644806
	.word	0xa64c4ef6,0x7c8d5c60
	.word	0xbaa036f8,0x33febc8f
	.word	0x5bad70bd,0xdcbb6b6a
	.word	0x2201c0f9,0xe10d7f1b
	.word	0x73ee33d6,0x70b12e3f
	.word	0xeb0a4cdc,0xb8f6ac66
p1_local0_expect:
	.word	0x00000000,0x4160dd73
	.word	0x00003361,0x00000000
	.word	0x3d4d6fc1,0x2b2adf43
	.word	0x24d7d6da,0x8c262f97
	.word	0x87f95f57,0x25b179d8
	.word	0xa2fd7ee8,0xab78177b
	.word	0x34503aa8,0xdeb90012
	.word	0x342b3027,0xf20bb044
	.word	0x83fa87df,0x8ff71462
	.word	0x649d06ff,0x8296f318
	.word	0x564160e2,0x3de86b3f
	.word	0x5f5aa120,0x876f7643
	.word	0x3273bca5,0xa385e12a
	.word	0x144d8b49,0xfb3f3910
	.word	0xb3d6c273,0x66cfc5e4
	.word	0x15a7fac2,0xf0f771ae
	.word	0x7361994b,0xa1ea189b
	.word	0x00000000,0x0000005c
	.word	0x20ede1f6,0x795bdefe
	.word	0x924a3259,0xe0f04f86
	.word	0x9f718abc,0x261028af
	.word	0x129afdd7,0x9fc788d6
	.word	0x2ea17d42,0x8b351f05
	.word	0x00000000,0x000000b9
	.word	0x202eb445,0x1e39f6e7
	.word	0x3df44cd4,0xa3cf92ff
	.word	0xbc3b3ab4,0x0000ff27
	.word	0x92112480,0x0761abb2
	.word	0xf3c447ce,0x64417281
	.word	0x50978f60,0x01644970
	.word	0x9aa1fef2,0x02ad1746
	.word	0x78e34e2a,0x8f2f3505
	.word	0x9ebfc8ac,0x6ee933d1
	.word	0x5dc2177b,0x12d66790
	.word	0xbca1fc53,0xfffff6e0
	.word	0xb11e77b5,0xe0759baf
	.word	0x4160dd73,0xc00a91e9
	.word	0xdb6a74e8,0x43e9a396
	.word	0x45cecc2f,0x898d4e51
	.word	0x8a477b68,0xb2389428
	.word	0x108fa323,0x6aebf835
	.word	0xaead08ee,0x0fdb898f
	.word	0x7fffffff,0xc27f77d5
	.word	0xfe7e33a2,0x516559ac
	.word	0x6c913a15,0x943a1ec9
	.word	0xcf77bb2f,0x16da8c37
	.word	0xb2d0409d,0x5e95c958
	.word	0x00000002,0x00000000
	.word	0x4185e0da,0x2942eaa1
	.word	0xd69ee909,0x1714070a
	.word	0xc66ab520,0x43bca3a5
	.word	0xd4a01323,0x90c2fef7
	.word	0x24e08187,0x62d41315
	.word	0x4f11f481,0x09bfceb5
	.word	0xb1522255,0x6e39e8e3
	.word	0xa2bad82d,0x886a4b97
	.word	0x9974a22c,0xf7f8e1f0
	.word	0xc0820329,0xbd98df32
	.word	0x093d7a19,0x3175cbab
	.word	0x157dd589,0x7eddf6f5
	.word	0x6e5c2d03,0xf340dea7
	.word	0x5dd561d8,0x1a2bfc82
	.word	0x3662ebe9,0xba7e29c2
	.word	0x00000000,0xffffffff
p1_local1_expect:
	.word	0x00000000,0x000000ff
	.word	0xb3f3fa24,0x5ae967ad
	.word	0x624b6e2f,0xdc0b5cc0
	.word	0xfc4a1eb1,0x3c4047e9
	.word	0x000000aa,0xaef68019
	.word	0xf0a9c4ed,0x337cde86
	.word	0x80ac3361,0xa92cfe0e
	.word	0x63c2c881,0xbeecfb95
	.word	0x70ad481c,0xa249434d
	.word	0xd7d10000,0xebe2162a
	.word	0x1231093f,0x39f296f9
	.word	0x519a1ac0,0x40e123c5
	.word	0xffffffff,0x00000000
	.word	0x3cac9739,0x06858398
	.word	0x95902d49,0x66f52820
	.word	0x0572c573,0xf04f05be
	.word	0x3d92a06f,0xfbb89f56
	.word	0xf28e37bc,0x018a66a2
	.word	0xe78264cb,0xdf12640c
	.word	0x497700aa,0x7b46244d
	.word	0x7e62ef6f,0xfbcf9e54
	.word	0xd8928a28,0x7a2b4964
	.word	0x002fc773,0x5235fffd
	.word	0x000000ff,0x2404d07e
	.word	0x70d3f5c6,0xaded0b2a
	.word	0x0488282e,0xc32c0c9f
	.word	0xb74caca8,0x8f2edec4
	.word	0x4af91f3d,0x7055b9fa
	.word	0x3fd9e459,0xc69f54f5
	.word	0xe21d28dc,0xa3466d33
	.word	0x44cb3a9d,0xece20b76
	.word	0x717252eb,0xb68b0aff
	.word	0x1cc09d1b,0xe1a5ec75
	.word	0xad3f1235,0xcc7271c2
	.word	0x033580df,0xcdd8a9a5
	.word	0x2e27c778,0x7a5c07e9
	.word	0xcf7789ef,0xb24e8472
	.word	0x876827b8,0x0c9aa63a
	.word	0xc765d9f6,0x1369b8ac
	.word	0x666eb9fe,0x54587114
	.word	0x57b5e4f4,0x378c4de2
	.word	0xd9b2c51d,0x3574f507
	.word	0x48dd556b,0x1533dbf9
	.word	0x9230204d,0xe1e222f4
	.word	0xa04014c0,0xf1127407
	.word	0x76693b2c,0xe3a8904e
	.word	0x55834052,0xfa8eff45
	.word	0x0a83c6c5,0x3635282a
	.word	0x2fffca62,0x64461602
	.word	0xb1514031,0xa6f4c59b
	.word	0x4f758797,0xbfe9e01f
	.word	0xfef215f6,0x3505f620
	.word	0x1fb7ff5a,0x46be122f
	.word	0x0d781008,0x01c29cc9
	.word	0x6d27a557,0x3d92a06f
	.word	0x05074e67,0x5951cd15
	.word	0x73a37ce3,0xb06e6fa8
	.word	0xc1eefa02,0x5a5e08d1
	.word	0xece20b76,0x5fdc9add
	.word	0x0c6df5a4,0xac824946
	.word	0x8d614984,0x9b6fa145
	.word	0x4ff65d73,0xc151a9c7
	.word	0x09b364fd,0x54dd7427
	.word	0x18ba406a,0x501f794e
p1_local2_expect:
	.word	0xff330033,0xdd7f86ed
	.word	0x0199f097,0xdd7f86ed
	.word	0x25f1f9e5,0xff47b662
	.word	0xd82fb009,0xd891fec8
	.word	0x5a2331dd,0x778657da
	.word	0x343cfcfb,0xc769c0bb
	.word	0xa36f2e75,0x865b581d
	.word	0xa082931e,0x6f10d86c
	.word	0x00000000,0x000000ff
	.word	0x31f3d663,0x7d9a0a6f
	.word	0xf3fc82a5,0xc305d311
	.word	0xa9a71a19,0x7004e71c
	.word	0x95b9d266,0x72e0af27
	.word	0xc60a8978,0xbf52541a
	.word	0xdaa010c4,0x085bb3ec
	.word	0x26740ba2,0x96ff3bf5
	.word	0xb4c4a7e7,0x3c9c6dc0
	.word	0x82e40c38,0xaaf67f52
	.word	0x38138300,0x8e5cb16c
	.word	0xccc9b7fd,0x850ec02f
	.word	0x9dbed05f,0xf6276fe6
	.word	0x5d2fceb2,0x195524c4
	.word	0x9e9365b8,0x5527573f
	.word	0xf3f0d8a9,0xe56d0e1e
	.word	0x8ea0e9f3,0x4fef675b
	.word	0x0129574d,0xcd7b9729
	.word	0xceb21291,0x88af31c6
	.word	0x237b137e,0xd899ff53
	.word	0x9108acac,0x267687b5
	.word	0x10dc4499,0x3c785081
	.word	0xfb26ee0a,0xf8a23c8c
	.word	0xf9cf6d55,0xb13dea24
	.word	0x4c18e2e9,0xdbfa6374
	.word	0x7b64018c,0x5e4bff44
	.word	0x50582852,0x6e1877cd
	.word	0xff8366e0,0xd036e9af
	.word	0x000000a1,0x00000018
	.word	0x1a1647de,0xe62f9be4
	.word	0xb1d316fb,0x99e043dc
	.word	0xead6a21a,0xcd711031
	.word	0xd170355f,0xa49d159a
	.word	0x5bef1687,0x0fee60ca
	.word	0x2a9568c8,0xb3076346
	.word	0xc5a07497,0xbc897088
	.word	0xb6ffec99,0xdffe02a2
	.word	0x00000000,0x000000b9
	.word	0x6c334ed6,0xcdc95fb8
	.word	0xfa98733e,0x2560b4d4
	.word	0xa7684b98,0xbb4c7b29
	.word	0x1e46eaac,0x4ac64607
	.word	0x00900d2a,0x49e763de
	.word	0x7cb7a142,0xc60da751
	.word	0xacb8955c,0x2a4f02b3
	.word	0x13342835,0x46789407
	.word	0xecb7b832,0x00000000
	.word	0x2d1a34e9,0x2b7c774d
	.word	0xb73ed785,0xf346aa0b
	.word	0xda2e844a,0x4bb7b2a6
	.word	0xb0ca59ff,0xaef7fbb6
	.word	0x58a0f118,0x0670d9bc
	.word	0x58800cfc,0xd669d8ec
	.word	0xccf599e4,0xe056a087
	.word	0x0000b6d2,0xf6261946
	.word	0xa98e5280,0x8808d875
p1_local3_expect:
	.word	0x8001ff6e,0x92532f36
	.word	0xf4000000,0xfffb67ad
	.word	0x30bab5a1,0x310a4172
	.word	0xaae9cc49,0x0dd1a5ee
	.word	0x0871ae5e,0x7234bddb
	.word	0x18a880ed,0x25ae2739
	.word	0xe76708ac,0xb08fcf9c
	.word	0x7ae66834,0x5ab3d630
	.word	0xd3b92991,0x0b1459f4
	.word	0x19036ac5,0xafea93d4
	.word	0xe20f7900,0xf735e620
	.word	0x00006e00,0x55deb7ae
	.word	0x0000059a,0xc00a91e9
	.word	0x49e6748c,0x7c2ffeb7
	.word	0x5202e0ef,0xcc66b6a5
	.word	0xdae365e4,0x465d7b42
	.word	0x183c843f,0xf2858178
	.word	0x067832d6,0xd698a6ea
	.word	0x00000000,0x000000ff
	.word	0xd0606d9a,0x6aea1ed9
	.word	0x15510c76,0xb7e607da
	.word	0xee99945f,0xfa2fefbc
	.word	0x0c1739ff,0x12bf65b2
	.word	0xe9d0cf78,0xb1936b7d
	.word	0x3213872b,0x668d10fb
	.word	0x5b831d41,0xffffa0f7
	.word	0x2bb1ee71,0x6980115a
	.word	0xc0b27d23,0x3f0e628e
	.word	0xe9b88803,0xb3f20ffd
	.word	0x2f6e74fa,0x029380b0
	.word	0xf215293a,0xb3b56f07
	.word	0xffffffff,0x80000c60
	.word	0x82567e9a,0x0457da84
	.word	0xabf24d0c,0xa04ac58f
	.word	0x75163032,0x67900028
	.word	0x98f0973d,0xf9f49eef
	.word	0xdfa4ac1f,0xdc0e59e2
	.word	0x13a328c5,0x60dd0c59
	.word	0x29d84d15,0x13ec73b3
	.word	0x52aa3b25,0x52ef9c2e
	.word	0x2e577ee3,0x6d4d1ffc
	.word	0x7f3e51ae,0x43407777
	.word	0xbf569335,0xbf289135
	.word	0x43a46f4b,0x73ff3112
	.word	0x4fe15bb1,0xb01b1884
	.word	0xf65b00e6,0xba7a7777
	.word	0x2103ea1e,0x58ff3dc7
	.word	0x3b07dec7,0x8882f363
	.word	0xffec8609,0x001376b5
	.word	0x42420ecb,0xb5616af6
	.word	0x4d0c4f1b,0xcdbaad92
	.word	0x063d3571,0x75f979d1
	.word	0x00000000,0x744309b9
	.word	0x6cd45cb3,0xf8557afa
	.word	0x924a325a,0x602ea134
	.word	0x6b06d9d7,0x5ae967ad
	.word	0xac75ea17,0x6b786156
	.word	0x4d3196ee,0xe9e760c2
	.word	0x9e8384d9,0x8486bb70
	.word	0x7e9ee678,0xe02af7cc
	.word	0x1d379097,0xa69a4c2f
	.word	0x31af9bb6,0x04af77db
	.word	0x92840d4a,0x3c7a8f73
	.word	0xdf69fe87,0xf82d645d
p1_local4_expect:
	.word	0xb475a907,0xc9c21c01
	.word	0x5231f0c5,0xfeae73e0
	.word	0xa8475218,0x4d2bc4e8
	.word	0xeada4eb2,0x3aa27281
	.word	0x46f1f4fb,0x58689b33
	.word	0x305a1cd9,0xff177182
	.word	0x73c02cbd,0x6ff7d1c6
	.word	0x1934a2b5,0x0e434ae4
	.word	0x7e9c2580,0x27942633
	.word	0x5bdc8389,0xa81ec5a4
	.word	0x1edeab03,0x62ea0f93
	.word	0x979b8322,0xe5ad907e
	.word	0xbad9bcc5,0x5c1f7e0e
	.word	0xf000539f,0x275146e2
	.word	0x8631fce6,0x663eb2a2
	.word	0x8b404790,0xe42dd699
	.word	0x25aac44b,0xf8b93fd7
	.word	0xb58f2c7f,0xae2f71b7
	.word	0x5ccfcc88,0xcc3004b8
	.word	0xe79f461e,0xf4fe9367
	.word	0x24e34d48,0x0df8ffe2
	.word	0x38d7c2a7,0x3c259aa4
	.word	0x4f3553ad,0xcd682a29
	.word	0xfa178eec,0xb63fdc0e
	.word	0x6393ad2e,0x986f8dcd
	.word	0xe31b9561,0xce6397b0
	.word	0x0a39a86e,0xbd179ad4
	.word	0x52f6539e,0x3c5ca010
	.word	0xabf13b91,0xd4349a8e
	.word	0x573ad176,0xca7bf966
	.word	0xfe221cd9,0x49ecd341
	.word	0x7c8e33f2,0x9955f45d
	.word	0x7f232d95,0xaf2827ce
	.word	0x9d16c5ae,0x25b3b81f
	.word	0xdd3b3166,0xa92e2709
	.word	0x98c13daf,0x5ea8536b
	.word	0xe7f4256b,0x73b99539
	.word	0x0f667c2b,0x47b3fb85
	.word	0x39320fce,0xefea060a
	.word	0xe8a921f5,0x23bac8c1
	.word	0x41ade2f2,0x6771b000
	.word	0xdbaf186d,0x913873dd
	.word	0xd9f52f13,0x7b88b897
	.word	0x2cf72a5f,0x23afc763
	.word	0x90d7d8fb,0x87536ceb
	.word	0xdeaf5e9b,0x6cf1cc8b
	.word	0xc6912ff6,0x4c04a2ca
	.word	0xec7bb45d,0x00e63136
	.word	0x1068cada,0xda85224f
	.word	0x37318f17,0x53800b7a
	.word	0x03136092,0xc10bce2d
	.word	0xb8d9fdd4,0x74a2997b
	.word	0x51e9b58c,0x44610b96
	.word	0x5e15ae57,0x1ce5a4f0
	.word	0x959b9a97,0x5bd2b51a
	.word	0xb0206b25,0x6cb84cc3
	.word	0xc9cf2707,0xc5072ee6
	.word	0x41d6343f,0xb75d0a49
	.word	0x999fbc92,0x56608303
	.word	0xb739cd46,0x278b9f95
	.word	0x0c0c2a66,0xa18b0159
	.word	0x1888464e,0xf66c214b
	.word	0xfb53e604,0x9cbcfada
	.word	0xccdbd456,0x14d5c289
p1_local5_expect:
	.word	0x86407710,0xea00e6dc
	.word	0x86a40d7c,0xead15a22
	.word	0x14deeb9b,0x56cc1a68
	.word	0x2acbd1a4,0xcc3470f3
	.word	0x7eba6e69,0x6cf01d08
	.word	0x12d85755,0x9bc15c3d
	.word	0xe5f94499,0x0c74fa43
	.word	0xbaa687f4,0x6d707e0c
	.word	0xf04e33db,0xd9199275
	.word	0x588a7d2d,0x699f4a4d
	.word	0x1a756f3c,0x0f70bb29
	.word	0xfb8d2a93,0xd94be2eb
	.word	0x5d403a88,0xc9691894
	.word	0x3dd56d27,0xc5221137
	.word	0x277a9a28,0x3934c08f
	.word	0xb91c6606,0x7c42a461
	.word	0x68743a64,0x59fb776d
	.word	0xb5fb9e4d,0x6c489dfa
	.word	0x2761e090,0x2df2260b
	.word	0x1e7a0960,0x9e21cca0
	.word	0xd2146cca,0x8d863a46
	.word	0x1c505085,0xcbc90891
	.word	0x8cf6fe38,0x888d6109
	.word	0x92d1899b,0xce759741
	.word	0x4815fd61,0xaa923ed1
	.word	0xcd9ea3c9,0x19274cf9
	.word	0x8070b68e,0x7e4b3cfd
	.word	0x2346ee1a,0x283c2777
	.word	0x31d5e4b1,0x89d57df5
	.word	0xd04e03bb,0xc2679f63
	.word	0xbc154e46,0x41fe1f93
	.word	0x68efecf8,0xaf285161
	.word	0x0cf01702,0xf437ec68
	.word	0xea2c891d,0xbc5d5a66
	.word	0xf4840a45,0x3d32355a
	.word	0x9923a5a1,0x570ca764
	.word	0x78b84def,0xaa6a4be9
	.word	0xaf51d000,0xe4661bbe
	.word	0xaecfd419,0x5aacf769
	.word	0x621a8ae5,0x2a61a9ab
	.word	0xae16651d,0x4d97f954
	.word	0x09207d95,0x8a2aec66
	.word	0x133f4f7d,0xdaeabe1a
	.word	0x3c7e21b2,0x5399e051
	.word	0xe0e70f39,0x1b60680c
	.word	0xe6bb2786,0x70641320
	.word	0xbe1ea5fc,0x7dc42e71
	.word	0x6fec28f4,0x2ad57c29
	.word	0x9ecc3970,0x13cdfa0b
	.word	0xad7290f7,0x8b09deff
	.word	0xb95d8793,0x7cb18133
	.word	0xa5c57ad9,0x095a8547
	.word	0x535a843e,0xc373bb8b
	.word	0xd0d8fe3d,0x52dc2d45
	.word	0xfffe44d5,0x31bb799b
	.word	0xc32c7173,0xef05513a
	.word	0x819d7982,0x07254d08
	.word	0x5bcb7f18,0xf83b822e
	.word	0xe8cff0e1,0x84d7d550
	.word	0xaefc6026,0xf79b1f6c
	.word	0x8be35f4a,0xee0c560a
	.word	0x386a4ac4,0xd56212c1
	.word	0x86f82ac5,0x2667f303
	.word	0x6a21da81,0xf12f927b
p1_local6_expect:
	.word	0x522cadc3,0x327df9fc
	.word	0xba6ae54b,0x9a87ca26
	.word	0xbdd6642d,0xf97bad47
	.word	0xaba1214e,0xaf88a098
	.word	0x55bf2f8b,0x060765e1
	.word	0x517d1031,0x9aa8c469
	.word	0x894141df,0x20d1546f
	.word	0xba679ee9,0x3d1ff943
	.word	0x87af1ece,0x5e267588
	.word	0xb397dd0a,0xb7891ca6
	.word	0x22aeb4e6,0x68c7ad4b
	.word	0x353118a0,0x191fc42d
	.word	0x10ee2e66,0x163bcefb
	.word	0x26631851,0x3ceffdee
	.word	0x06fdd610,0x730d5170
	.word	0x42513469,0xca326de7
	.word	0xb52b1a72,0x4f61d5d1
	.word	0xb306543e,0xef781874
	.word	0xfb8856e4,0x02c6cd39
	.word	0x0cde8fe3,0xfba7cf90
	.word	0xcf291035,0xa17a7c80
	.word	0x8e1c9530,0x02ea4056
	.word	0xe8c2d1ed,0x06a1483b
	.word	0x34269df9,0x150867cd
	.word	0xb0630f11,0xf057f548
	.word	0xafc2b335,0xe9ebe814
	.word	0xad6453bc,0xfce025be
	.word	0x05fdb654,0xf4013a88
	.word	0xd837e4da,0xc8c363af
	.word	0xca893fd8,0xb57d094c
	.word	0xcf1cd00b,0xbe518d9b
	.word	0x2b2adf43,0x00006e00
	.word	0xfd2f1387,0x3dcf74ea
	.word	0x5fedf4d5,0x19699e76
	.word	0xf2ed900c,0x0df99d71
	.word	0x0ff9fd22,0x86a11d89
	.word	0xfa22e422,0xbcea4c08
	.word	0x735f9a3d,0xf418003f
	.word	0x5480f6db,0x8a82654c
	.word	0xdebed1c3,0xa0c3069e
	.word	0x3fedc2b4,0x4202dd26
	.word	0xc0cd8d88,0xc83008ba
	.word	0x909311d0,0xe0cc6fd5
	.word	0x6be2e405,0xda37a050
	.word	0x4d495677,0xf3df6f22
	.word	0x919fe10c,0x7b203a1d
	.word	0x2ec4a7fc,0x0dec078b
	.word	0xe3d031e5,0xcce91f49
	.word	0xc1eb1bf2,0xa45ec0a2
	.word	0x5b83634c,0x375f53ef
	.word	0x0fb04428,0x206f034f
	.word	0xb8bbadc2,0x45d36015
	.word	0x9fe23ad7,0xed779dee
	.word	0xf7ae9298,0x60f9498a
	.word	0x57cc0f14,0x789980d3
	.word	0x1991dc1f,0x1f3fde13
	.word	0xb64a3d6c,0xdd34876c
	.word	0x2787f053,0x0dc9a1d4
	.word	0x76857f9f,0xb407b589
	.word	0x1becddc3,0x533b7b9b
	.word	0xb31c4275,0x3df64c7e
	.word	0x8b758914,0x9e0c0302
	.word	0x6a0438de,0x1cb5cf42
	.word	0xb54032d2,0x83c99baf
p2_init_registers:
	.word	0x27c34aff,0x8da59d73		! Init value for %l0
	.word	0x2c0ff900,0x63dec6af		! Init value for %l1
	.word	0x5278c400,0x1c007e2e		! Init value for %l2
	.word	0x8be919ff,0xab2a5609		! Init value for %l3
	.word	0xc86050ff,0x8df029da		! Init value for %l4
	.word	0x9ac250ff,0x8097bb55		! Init value for %l5
	.word	0x881c45ff,0xc725d5ca		! Init value for %l6
	.word	0x51041900,0x5792e512		! Init value for %l7
	.align	64
p2_init_freg:
	.word	0x83b56f93,0xc0243964		! Init value for %f0 
	.word	0x4b22c039,0x34578d12		! Init value for %f2 
	.word	0x763bb636,0x3cbae3fb		! Init value for %f4 
	.word	0xf0b4a323,0x336dde11		! Init value for %f6 
	.word	0x5f3006f0,0x9e4a8b94		! Init value for %f8 
	.word	0xe5305f99,0x581e1d7d		! Init value for %f10
	.word	0x5e0fd52f,0x0933a86b		! Init value for %f12
	.word	0x59fbc7b1,0x326244c9		! Init value for %f14
	.word	0xc3d21aa2,0x81845fdc		! Init value for %f16
	.word	0xa33c916a,0x12937dd9		! Init value for %f18
	.word	0xb5db0121,0x5986cba5		! Init value for %f20
	.word	0x223b7684,0x0c9d7f84		! Init value for %f22
	.word	0xfc356cdd,0x57b578c0		! Init value for %f24
	.word	0x2a75764b,0xaefb398b		! Init value for %f26
	.word	0xccde23b1,0xd9a2741e		! Init value for %f28
	.word	0x42fd801f,0xde8f4267		! Init value for %f30
	.word	0xdb3a4d34,0x172b53fc		! Init value for %f32
	.word	0x1143a1f1,0x38f5fdbe		! Init value for %f34
	.word	0x74bf2b29,0x0b6cc397		! Init value for %f36
	.word	0x85b9b4b9,0x81f2bde3		! Init value for %f38
	.word	0xe7d55f13,0xbf25090e		! Init value for %f40
	.word	0x9e0e0e81,0xfc8065d9		! Init value for %f42
	.word	0x4060e2ef,0x5f24fcb5		! Init value for %f44
	.word	0xeda7cb5f,0x85489870		! Init value for %f46
	.word	0x22bfa780,0x8ffa4352
	.word	0xec0a4162,0x0fb26964
	.word	0x7fa6d354,0xfde5cc99
	.word	0x823b3d36,0x8b85cc24
	.word	0x3d559d80,0xefe14768
	.word	0xc5322c8b,0x4f56b413
	.word	0xd3c2c2b9,0x0563eba9
	.word	0x2e700466,0x32002b6b
p2_share_mask:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p2_expected_registers:
	.word	0x00000000,0x00000b6f
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xe961d5fa
	.word	0x00000000,0x594e4aa4
	.word	0x00000000,0x000000fe
	.word	0xffffffe9,0x8f124e0c
	.word	0x00000000,0x00000005
	.word	0xffffffff,0xa3c0648f
p2_expected_fp_regs:
	.word	0x00000002,0x233c916a
	.word	0x00000000,0x00000000
	.word	0x00000002,0x00000000
	.word	0x42ed801f,0x4f8fd52f
	.word	0x00000002,0x00000000
	.word	0x00000002,0x40000000
	.word	0x00000002,0x00000000
	.word	0x00000002,0x00000002
	.word	0xc2ed801f,0x4f8fd52f
	.word	0x41f1faa5,0x00000000
	.word	0x405db003,0xe0000000
	.word	0x00000001,0x1faa5e00
	.word	0x87000000,0x4f8fd52f
	.word	0x0000ec00,0xf8000000
	.word	0x42ed801f,0x00000000
	.word	0x00000000,0x00000000
	.word	0xdb3a4d34,0x172b53fc
	.word	0x1143a1f1,0x38f5fdbe
	.word	0x74bf2b29,0x0b6cc397
	.word	0x85b9b4b9,0x81f2bde3
	.word	0xe7d55f13,0xbf25090e
	.word	0x9e0e0e81,0xfc8065d9
	.word	0x4060e2ef,0x5f24fcb5
	.word	0xeda7cb5f,0x85489870
p2_local0_expect:
	.word	0x000000a7,0x0000fe01
	.word	0xff47c088,0x26a0b445
	.word	0x00000000,0x26a0b445
	.word	0x03c0d4e1,0x11cf392d
	.word	0xe961d5fa,0x594e4aa4
	.word	0x9ad79b74,0x1c38bef7
	.word	0xd454dc1b,0xe8ddfaf0
	.word	0x78087e2f,0xd715534b
	.word	0x6133f93a,0xb8c9935a
	.word	0xcc3eed8c,0xc2b1ff25
	.word	0x6d3132f8,0x7fe1778c
	.word	0x50d3538d,0x76a5ab30
	.word	0x5db98e85,0x009241ef
	.word	0x9fec669a,0x9d4f8b6c
	.word	0x70098c87,0x488f4783
	.word	0x38bd0d1c,0xf18f1e52
	.word	0xda80d370,0x849a2c27
	.word	0x533e58c1,0x7d7e0057
	.word	0xac111f69,0x99074134
	.word	0x8f4b37dd,0xa31af87e
	.word	0xadebcd79,0x8850b07b
	.word	0xd001f942,0x14be5e29
	.word	0x3d60eb65,0x49f656e0
	.word	0x50f88c3c,0x19442618
	.word	0x4e7e6f9e,0xf17536c9
	.word	0x73a0252d,0x83cee25a
	.word	0xe3702003,0x38b1178c
	.word	0x553fc0f6,0xffffffff
	.word	0x7765fd20,0xfa5ef2ff
	.word	0xf49bf546,0x3f3b81cc
	.word	0x1e4c2ad5,0x3a835cec
	.word	0x24fde8de,0xa17f51de
	.word	0x26a0b445,0x9e39ca9c
	.word	0x39e37347,0xeab03088
	.word	0x9a83c1c4,0x6cb8392b
	.word	0xb727f13f,0x6d1f9e42
	.word	0x0e78b06b,0x4165f7a2
	.word	0xd4d02baa,0x9a93a21c
	.word	0x80848bba,0xf891a031
	.word	0x6ca5b40e,0x35447d94
	.word	0x254708b6,0xc80ac9e5
	.word	0x00000000,0x000bb210
	.word	0x56384721,0x578c8bff
	.word	0x71662ba0,0xaf443200
	.word	0x39625387,0xe1efbfdd
	.word	0x23d0b050,0x9bc60690
	.word	0xc903e982,0x001e7202
	.word	0x38681f50,0x9cea5443
	.word	0x93ad4148,0x9a473503
	.word	0x82484995,0x17a420fb
	.word	0xaaa7f01d,0x4b2eae58
	.word	0xc5a1fae4,0x937b3a89
	.word	0xd98faf3b,0xc1fe705c
	.word	0xcb3679ff,0x179f9a16
	.word	0x2a1d0000,0xe2349632
	.word	0x8fb01f8f,0xc7e9b445
	.word	0x65d07cde,0xa7f45aff
	.word	0x5d6420b3,0xb3f8cd8b
	.word	0x6ce03e61,0xb93b7bce
	.word	0x7839533b,0x63c39350
	.word	0x7aa2309d,0xc4a23f42
	.word	0x74631738,0xd5004b5f
	.word	0xb12f5000,0xa84c2225
	.word	0xfc6c4567,0x28dfe777
p2_local1_expect:
	.word	0x00000000,0x00000000
	.word	0xfa610bde,0x00000008
	.word	0xeef9efc8,0x6c760347
	.word	0x3ea1753d,0x71c4a7fa
	.word	0x26deb0a3,0x2b157537
	.word	0x47105954,0x64fb68e2
	.word	0x7322f828,0x7a6efe44
	.word	0xed98b951,0x75ba1235
	.word	0x93110a5a,0x095038e9
	.word	0x8bc8c754,0x9859bebd
	.word	0xe604ee26,0xce72a260
	.word	0xb75b345b,0x13feb5fd
	.word	0xcf699416,0xccbc823a
	.word	0xe38ecffc,0x2495dbce
	.word	0xbc07f683,0xbe1bcd23
	.word	0x185b854f,0xf8eff857
	.word	0xfc8a9c28,0x99733245
	.word	0xeafd5a61,0x2222bcb9
	.word	0x4cce1327,0x184db9aa
	.word	0x74f81b93,0x54177d21
	.word	0x2f39939d,0x99b5b6d3
	.word	0x88995e77,0x0c27285c
	.word	0x4af87fb4,0xf22d260e
	.word	0xc73880d7,0xb966be6d
	.word	0x9d6dee46,0xe9e5b8bc
	.word	0x53d8d354,0x8c3b91af
	.word	0xa2f504ae,0xb99c0d5e
	.word	0xd719cac2,0x924c50aa
	.word	0x442b211a,0x85216b47
	.word	0xc40528de,0x28ce7eab
	.word	0x1b042742,0xa9669f96
	.word	0x2498e6be,0x251297f9
	.word	0xceea8015,0x54a6dd8d
	.word	0xe9b85fca,0xf5825aa5
	.word	0x1cfde4d6,0x4ace0199
	.word	0xd0853a82,0x5c68bc37
	.word	0xb06735c0,0xd379ed0d
	.word	0xc18c4142,0x3e0aca32
	.word	0x30013ad1,0x1b448c9f
	.word	0x68fb2b6c,0x00000000
	.word	0x7a855bee,0xd6f6d96b
	.word	0x921aae7e,0x51180091
	.word	0x581d0334,0x3bb8514d
	.word	0x97a8ad0e,0x1b621b33
	.word	0x2ed86464,0x36897b4d
	.word	0x770988f9,0x6f4c5beb
	.word	0x6e227be8,0x3d93d65b
	.word	0xfd496c63,0x04838815
	.word	0xb004f452,0xe159f929
	.word	0x24161392,0x777c2a05
	.word	0x9e60a0a5,0x858b045d
	.word	0xb37cb3d8,0xd196a4a1
	.word	0xab0143d2,0x08d1de42
	.word	0x88b4e3ee,0x45149ef6
	.word	0x699b8798,0x5c1cbf2a
	.word	0x46b48ee1,0x65978eec
	.word	0x79fcfc01,0x59954d24
	.word	0x563c8fd0,0xffad2239
	.word	0xb0c630dc,0x7c96e088
	.word	0x3993fda8,0x6ebb9ad0
	.word	0xe955dd99,0xdc6e2a65
	.word	0x33f53a01,0x706921fe
	.word	0x284382ad,0x5c848575
	.word	0x5c9e7f48,0xdab65722
p2_local2_expect:
	.word	0xd1f00000,0x00000000
	.word	0xa3c05a38,0x00008b0c
	.word	0xde409ced,0x876d6e01
	.word	0xcc40a4d0,0x56a1262f
	.word	0xe4c7f8a4,0x33680c30
	.word	0x79ab63f0,0xef17015f
	.word	0x4dfa8b77,0x75e1216d
	.word	0x03849395,0x5d3b0d89
	.word	0xf17dd476,0x89828c75
	.word	0x247b45bb,0x52865e32
	.word	0x454c2c78,0xc884e91d
	.word	0x53587000,0x04418bbe
	.word	0x50dcd281,0x672a632f
	.word	0xeb63ab30,0x3ac3960f
	.word	0xb64865c2,0x72ecc2a7
	.word	0x4a56684c,0xd9d11b64
	.word	0xe4f3f6b5,0x3209b148
	.word	0x55b5e00c,0x00000000
	.word	0xfcb1e28e,0x860b5d6d
	.word	0xc444c003,0xbb8aa55c
	.word	0x277c7820,0x3a8cc996
	.word	0xdb4f2039,0x0950abd8
	.word	0x3360dbe2,0x5d50db33
	.word	0x81a20bef,0x910e5950
	.word	0xa7d518d1,0x2baf7696
	.word	0xffa17f52,0x4d1317a1
	.word	0x47b073c6,0x5a588753
	.word	0x36056fcd,0x71078a2e
	.word	0xd45ba69b,0xb371b45e
	.word	0xd7caff4a,0x5b6d4670
	.word	0x73826176,0x2ace85fa
	.word	0xfe30635b,0xee1dd90b
	.word	0x4225dee2,0xb7a8d289
	.word	0x4fc98850,0x7990d215
	.word	0xfbc9d859,0x83e261c1
	.word	0xfea857d8,0x45360593
	.word	0x4275f494,0xa48c31e9
	.word	0x2d2b9269,0x591d214a
	.word	0x6a112e7d,0xdf413545
	.word	0x03a83e4e,0x812c8b44
	.word	0x513dddf1,0x203178a4
	.word	0x63806897,0x01006e79
	.word	0x6ff69042,0xa5353396
	.word	0x3cc06049,0x10e68aee
	.word	0x4833913c,0x6bff77fb
	.word	0x7c8baf31,0xe38eca44
	.word	0x83b2b649,0x85e9bf26
	.word	0x8a378c5a,0x795ad0c7
	.word	0x88b8fe17,0x495ae0ee
	.word	0x20c8f325,0x2af1cf1f
	.word	0x4bc57c01,0x7f975822
	.word	0x2cb16f5f,0x1e736b08
	.word	0xab4632e8,0xceed2160
	.word	0x67caae89,0x98338ee7
	.word	0x36d936cf,0xffffff89
	.word	0xebccf977,0x34ca7bd5
	.word	0xd16fe3dd,0xa13c743c
	.word	0x816df24a,0x0fa7754a
	.word	0x898bd851,0x9a655b76
	.word	0xdb9cccdd,0x0964efcc
	.word	0x497fca81,0xfb7c38fe
	.word	0x0e116db1,0x79930c5d
	.word	0x37ff9872,0x2e5f2c2a
	.word	0x1cc1afb8,0x9e052357
p2_local3_expect:
	.word	0x00000bcc,0x00000000
	.word	0xfa610bde,0xff47f088
	.word	0x9f1a6490,0x72e00810
	.word	0xa985b7ed,0x2d849c52
	.word	0xd0d34ac9,0xb6995e39
	.word	0x7d8f3655,0xe2f7a7bb
	.word	0x40459cdd,0x85db62f0
	.word	0xffffffff,0xffffffff
	.word	0x558b48fa,0x259cb3f5
	.word	0xb1572808,0x890bb9e9
	.word	0x13b83e1d,0xda6d6265
	.word	0xdf3d9956,0x890e9d38
	.word	0x39be61a7,0xada4953a
	.word	0xb8cf0ac7,0x6ddfae43
	.word	0x3446565a,0x4488963a
	.word	0x76f37dfa,0x81e5bfa6
	.word	0x03151baa,0xc34d54be
	.word	0x78f4c309,0xcd73b4ea
	.word	0x63d252e1,0xa0405030
	.word	0xf5ff5d26,0x13547857
	.word	0xcd567c1a,0x726fe9e9
	.word	0x25169d26,0x3c0af506
	.word	0x2853f7df,0x6ca3f3bf
	.word	0x3afabbe5,0xc2e71ccd
	.word	0x98ff2ca0,0x4ae5bd21
	.word	0x00000000,0x0000000b
	.word	0xaaa473fa,0x441bdb4c
	.word	0xa35ce867,0x5c45348d
	.word	0x39107a55,0xc6d31be3
	.word	0xb4756f02,0x110baa7c
	.word	0xaa581ea9,0x5e22fd1a
	.word	0x66b9a820,0x0852883e
	.word	0xf9762733,0x0e3f4249
	.word	0x49dd810b,0xaf544afb
	.word	0x00004e7e,0x6816d206
	.word	0x4d6ab74b,0x8160b980
	.word	0x51d5b2ea,0x0bd8dafd
	.word	0xd7c5e32c,0x5176dc8e
	.word	0x00000000,0x8fcb6d84
	.word	0xdd103bb0,0xeb850656
	.word	0x51f78fc1,0x3976302a
	.word	0x3dbee7d8,0xc8e690f2
	.word	0xc6517d8d,0x85c6ba6e
	.word	0x9c1c092b,0xe63d61d9
	.word	0xbfeb90f2,0xc3aba648
	.word	0x829e4330,0xbc144834
	.word	0x526202b8,0xf657a7da
	.word	0x0fdc395a,0x531c156d
	.word	0xbd1c7605,0xe1e9ba28
	.word	0x46a355fd,0x386107f7
	.word	0x396c9912,0x979b4242
	.word	0x42c3dc2e,0xd0b608f3
	.word	0xe8c22972,0x12389866
	.word	0xe7a0bfe5,0x59f2eb27
	.word	0x07863473,0xae2cf0a7
	.word	0x52b611d2,0xc2b7496a
	.word	0xc5faebcb,0x6638998a
	.word	0xcfe0b4cd,0x01e1b5b2
	.word	0xe4887548,0xbb0cb63d
	.word	0xd79d3891,0x5e1c51c4
	.word	0x768d57a6,0x07892e46
	.word	0x47b70a26,0xd257988a
	.word	0x12b7bfaf,0x0000252d
	.word	0xe919fe25,0x466eb944
p2_local4_expect:
	.word	0xd0000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x32ce53c0,0xc955c5b6
	.word	0x54f9829f,0x97062b95
	.word	0x20cff7a5,0x5bb16c91
	.word	0xc085de08,0x5a259965
	.word	0x082cac2c,0xeb0b791a
	.word	0xf6d026de,0x7fdba442
	.word	0x96afa36d,0x9fc5a473
	.word	0xd0b155a6,0x0a571157
	.word	0x81b8db31,0x06b88ef8
	.word	0xd7c9f808,0x349480b6
	.word	0x3c2cd988,0xaab9bf59
	.word	0xb3bdd003,0xf3d2d449
	.word	0xcb4576aa,0xf9e4b681
	.word	0x08ee4521,0xb1a4f50a
	.word	0x5666d9be,0xebf2798d
	.word	0xbe86c721,0x65c78aab
	.word	0xed64df52,0x5b60a483
	.word	0xa40e9ed1,0x3312cf08
	.word	0x844a1160,0x1cc6856b
	.word	0xb6046dff,0xfbbca713
	.word	0x773f15d7,0xe652b7b2
	.word	0x77eb5dd7,0xf78e7be7
	.word	0x43fd21ba,0xfb93bf59
	.word	0xf21c5e9a,0xe74dba8d
	.word	0xecb114e9,0x36951027
	.word	0xa6711009,0xf3612154
	.word	0x0b306370,0x96aa024d
	.word	0x2a454733,0x426a10b8
	.word	0x6bbd12f4,0x483521a3
	.word	0xd7e975e7,0x8b2e3080
	.word	0x4b6117ff,0xdef6251c
	.word	0xfe4fe09f,0x83cdb9c6
	.word	0xe973ebba,0x8362a582
	.word	0xb869813c,0x99e8898d
	.word	0xc169ff56,0xa05f603b
	.word	0x80b9791b,0x08b19714
	.word	0x4bcbeffe,0x8358e87b
	.word	0x9c5e2702,0x9fca75a6
	.word	0xa8a73436,0xad0fd91b
	.word	0xb21127ab,0x208938dd
	.word	0x1c0e09ee,0x3f036a29
	.word	0xba7d34b6,0x6f2564f6
	.word	0x4af837f1,0x939e0c57
	.word	0x65719404,0xdd87cfdd
	.word	0xd82bf203,0xe1766927
	.word	0x262e2d14,0x2e0b50c6
	.word	0xe255298f,0x37882dbf
	.word	0x94c6ae62,0xb9a3ca20
	.word	0xd4b851bc,0x859055da
	.word	0xd03876e0,0x2118087f
	.word	0xb582dee1,0xa581775e
	.word	0x8fd34c22,0x92eaf968
	.word	0x72de1514,0x3965030a
	.word	0x4030997d,0x50a59733
	.word	0xf1f0a892,0x569b2968
	.word	0xb5ec73ef,0x26d00585
	.word	0x21fcd552,0xb391e13d
	.word	0xf5fecaf0,0x1a6b3463
	.word	0x8922c473,0xd464bf97
	.word	0x2b99431d,0x0dec4e5a
	.word	0x88a7d430,0x6f4d765a
	.word	0x72628475,0xf6c8327a
p2_local5_expect:
	.word	0x3006223f,0x2fc68d7b
	.word	0x1c34ba0b,0x52f3f179
	.word	0x2775a0e0,0x53125e2f
	.word	0xba452bb4,0xd20c1321
	.word	0x2fb77d14,0x502f0c1d
	.word	0xd5636d59,0xa10509c3
	.word	0xc361b1dc,0x83883c16
	.word	0xb511102a,0xbd3f33f8
	.word	0x0b5343d3,0x60416758
	.word	0x97427314,0xdca8e01b
	.word	0xb0966589,0x5cadad44
	.word	0x4ce7e81d,0x2726d064
	.word	0x5f48e8be,0x0696a143
	.word	0xb8f77379,0xdae15e00
	.word	0x5b7fe024,0xac1f9786
	.word	0xe8391bc8,0x774aeeb9
	.word	0x7df6a131,0x78b62d3a
	.word	0x99c839c3,0x60382999
	.word	0x5dd33120,0x96286689
	.word	0xdd4d9303,0x37a387ce
	.word	0x7c11cdcf,0x62b49eb9
	.word	0x96c746f9,0x98cd3d3d
	.word	0xb4b55dd0,0x17be976c
	.word	0x24f381c1,0xaf1615f4
	.word	0x23915d57,0x7367b5f8
	.word	0x58f2a2a3,0xdd9e4f47
	.word	0xd43d5ecf,0x67b56ce0
	.word	0x07884a5e,0xc9408374
	.word	0xce7581a1,0x0312c036
	.word	0xc1d9c426,0xb9c89457
	.word	0x66a2b9d7,0x70e442ef
	.word	0x15428549,0x842a276c
	.word	0x00f2b031,0x3555febb
	.word	0x45511416,0x3b054cd8
	.word	0x41d775b2,0xbe0ae398
	.word	0xeb4d0648,0xa931561f
	.word	0x1655a3f9,0x4268cb83
	.word	0xc9d420e9,0x3e391357
	.word	0xc75e1dfe,0xa07fd2da
	.word	0x1a69674a,0x86b0a928
	.word	0x0960b70a,0xbf6cacf0
	.word	0xdc5dbf45,0x288691a7
	.word	0x3e1607a2,0x29508989
	.word	0xfc4b4dcc,0x0a3f84d3
	.word	0xb4c0b39d,0xd998ef65
	.word	0xcc1f8610,0xb80e03c8
	.word	0xdd4d91a3,0x57fb3d57
	.word	0x6bc3c628,0x7954b6e8
	.word	0xfcefdd63,0x6550ec33
	.word	0x43108fc2,0x0310c020
	.word	0xcc4b385a,0x30aef54e
	.word	0xdce06311,0xe13020eb
	.word	0x2e1ba4d7,0x1cb53916
	.word	0xfe39bccd,0x307b8b36
	.word	0xc79c6fe0,0xe34a775d
	.word	0x7e08780d,0x3509899a
	.word	0x1eb0b79f,0x118afb78
	.word	0x33307028,0xe3ba48e5
	.word	0xa19c17a2,0xc0779428
	.word	0xdfdd9cf4,0x3c946843
	.word	0xba95e0e5,0xc869c8f2
	.word	0xbc6c1b37,0xd8641703
	.word	0x0b145836,0x70f32cbf
	.word	0x469c9946,0x4f30c333
p2_local6_expect:
	.word	0xe4bba227,0xad95fea6
	.word	0x000bf2e5,0xd3d49a12
	.word	0xb91993fe,0x20b2bf1b
	.word	0x76e0e68f,0x56aa42fd
	.word	0x7d4b5fb7,0xfbfc9a06
	.word	0xd292ac19,0x986d1725
	.word	0x459a9eaa,0x2a96ec13
	.word	0x875462de,0x562113f6
	.word	0xce1647d2,0x792a1675
	.word	0x99356ba8,0xb8ce541f
	.word	0x2dec73e3,0xb54bd2b9
	.word	0x4e936a99,0xde1e5886
	.word	0x27436646,0xeba4253f
	.word	0x71bf7f96,0xc6c6124f
	.word	0x3ffae189,0x7618d470
	.word	0x63cf78e8,0xa5e7810c
	.word	0xe66a82a3,0x9fa35392
	.word	0x3e0b104a,0x9b93a551
	.word	0x0ca7af2c,0xd006e97f
	.word	0x77704801,0xcb71b5d5
	.word	0x2cc8e431,0xc5c42187
	.word	0x340b3819,0x4c2c47c7
	.word	0xf14ae178,0x7b2a97e9
	.word	0xe5acdc9e,0xaa7a121b
	.word	0x88c0a657,0xb52e20ac
	.word	0x0622615f,0x6199502e
	.word	0xbbcd0b28,0x45a772d0
	.word	0xeaebcf92,0x42656b11
	.word	0x3ee55f9a,0x9c951bcb
	.word	0x062592ce,0x4406d0f5
	.word	0x0622cfcb,0x404fc8e6
	.word	0x34e6cf14,0x55e0364b
	.word	0x699ec910,0x14e86ead
	.word	0x216ad5b5,0xe01faa9b
	.word	0xa37b8fa9,0xa2158ce7
	.word	0x4f5ee131,0x55b0d19f
	.word	0x603b55b0,0xa49f9c1f
	.word	0xc73ae2fe,0x2a93c864
	.word	0xf0fa7eb3,0xa32c6e92
	.word	0x5dfd652d,0x57cae9d3
	.word	0x95ea5ed5,0x8083f42c
	.word	0xb87c1bbb,0xfeea3088
	.word	0x84051313,0xc4175080
	.word	0x999293c8,0x685810b0
	.word	0x06e84baa,0x57efaa57
	.word	0x1f0b39e5,0x6f40e991
	.word	0x41d76207,0x07c96ac0
	.word	0xb9b82681,0x1f499371
	.word	0xac7ef9b3,0x57d6b0e1
	.word	0x0e4d46a5,0x78fb0cf3
	.word	0x0145fe99,0x70d606bc
	.word	0x02104d32,0x7c6f7dfb
	.word	0x86b0db5d,0xad7a8585
	.word	0x604a9f8e,0xb924e4ba
	.word	0x7a92e17b,0xa74348e9
	.word	0x56a8f2cd,0x5b5d1a13
	.word	0xc45289f8,0xbe4e49af
	.word	0x2c301b9d,0x7c770815
	.word	0xc53f87b5,0x27290499
	.word	0x75f92dbe,0xdbf46644
	.word	0x87d288a6,0xb63d517d
	.word	0x055944c1,0x008dab6a
	.word	0x7cb9e0b2,0xbef3a898
	.word	0xdbbaa4ce,0x1caefc20
p3_init_registers:
	.word	0x1c6e5800,0x5a6dce29		! Init value for %l0
	.word	0x6c136800,0x47951c44		! Init value for %l1
	.word	0x8709b8ff,0xc8954bbf		! Init value for %l2
	.word	0xb2160cff,0xc7a116d2		! Init value for %l3
	.word	0x9ac8ce00,0x21ca2f2f		! Init value for %l4
	.word	0x08730d00,0x1bdcbf30		! Init value for %l5
	.word	0xb8dd2900,0x1599b1c1		! Init value for %l6
	.word	0xe668f1ff,0xc8617870		! Init value for %l7
	.align	64
p3_init_freg:
	.word	0x16ae9d05,0xb6711ef8		! Init value for %f0 
	.word	0x9462d5ee,0x0636ead3		! Init value for %f2 
	.word	0x58581058,0x6f0c8b6f		! Init value for %f4 
	.word	0xc56df209,0x2bf6f9b9		! Init value for %f6 
	.word	0x6711fa86,0x0aaad28a		! Init value for %f8 
	.word	0x82f786c3,0xe377b60c		! Init value for %f10
	.word	0x0a2a4ae6,0x06d5c9b4		! Init value for %f12
	.word	0xd41eff0e,0xb11fedf3		! Init value for %f14
	.word	0x6ff6b4fd,0x7fedf85b		! Init value for %f16
	.word	0x3701a948,0x2415470d		! Init value for %f18
	.word	0x2152303b,0xca2ba770		! Init value for %f20
	.word	0x83a0e4d0,0x821b518d		! Init value for %f22
	.word	0x35a7b26a,0x3edd5aa9		! Init value for %f24
	.word	0xabdce394,0xf3857129		! Init value for %f26
	.word	0x5b8db54b,0x60a837c7		! Init value for %f28
	.word	0x1e65dadd,0xa37e864d		! Init value for %f30
	.word	0xc8e162a6,0x05e35d25		! Init value for %f32
	.word	0xeb93b137,0xf219cc0f		! Init value for %f34
	.word	0x674bc2ce,0x56752ef6		! Init value for %f36
	.word	0x3cb17888,0x3703a0b6		! Init value for %f38
	.word	0x5461af7a,0xe938aae0		! Init value for %f40
	.word	0x0d5e8ef4,0xcf134baa		! Init value for %f42
	.word	0x741a50c7,0x185333d9		! Init value for %f44
	.word	0x7ed28d4c,0xad81b15e		! Init value for %f46
	.word	0xdd88f70f,0xc711e9a0
	.word	0xabd04495,0xc3e79959
	.word	0xed19bbcf,0x2f3c3fe3
	.word	0x14f65533,0xba5cf98b
	.word	0xdfd67a18,0x41bf13fd
	.word	0xa980cdb5,0x5c6318cc
	.word	0x46166b78,0x518f8821
	.word	0x978df1ab,0x3f580656
p3_share_mask:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffffff
p3_expected_registers:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xfffffa60,0x6f35c2e2
	.word	0x00000000,0x9bc64c4a
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xfffffff2
p3_expected_fp_regs:
	.word	0x00000000,0x20000000
	.word	0x00000000,0x80000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0xa0000000
	.word	0x80000000,0x80000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x80000000,0x85dd5aa9
	.word	0x20000000,0x00000000
	.word	0xabece394,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x85dd5aa9
	.word	0x80000000,0xa0000000
	.word	0xc8e162a6,0x05e35d25
	.word	0xeb93b137,0xf219cc0f
	.word	0x674bc2ce,0x56752ef6
	.word	0x3cb17888,0x3703a0b6
	.word	0x5461af7a,0xe938aae0
	.word	0x0d5e8ef4,0xcf134baa
	.word	0x741a50c7,0x185333d9
	.word	0x7ed28d4c,0xad81b15e
p3_local0_expect:
	.word	0xffffffff,0xaa01727b
	.word	0x00000000,0x00000000
	.word	0xae9d996a,0x2a0e142e
	.word	0x1fd87ae1,0x3b20db24
	.word	0xb9505e3c,0x0dd2731c
	.word	0x4a0a5799,0x0000004c
	.word	0x32857e3b,0xdbcc75ac
	.word	0x4c5265dd,0xa204aad0
	.word	0xd8dcda3c,0x7938b35a
	.word	0x6d941e4c,0x464a6c14
	.word	0x0aae0edb,0x85d014de
	.word	0xc42ada34,0x3a5c77e3
	.word	0x69dfc984,0x76a2edce
	.word	0x23454527,0xc3caca49
	.word	0x00000000,0x00000031
	.word	0x6b1cfe82,0xfffffafd
	.word	0x86ea224f,0x5b9210cb
	.word	0x3cad4e3c,0xb56584f1
	.word	0x25fc44a1,0xc8c30093
	.word	0x56e71f72,0x55fe4267
	.word	0xed2b0137,0x357b4393
	.word	0x8f03185d,0x85f13360
	.word	0x3192d952,0xea1c232f
	.word	0xe69f0327,0x65870272
	.word	0x2ec3a7f2,0x81c15f71
	.word	0xf6955c3d,0x38373846
	.word	0x5ce7f4a3,0xb127a715
	.word	0x103fc6f0,0x06f185f9
	.word	0x1d642bf1,0x18b98ca5
	.word	0x1f0b5dca,0x08df9586
	.word	0xe0ff76d1,0xe549d551
	.word	0xf941c599,0xa02cee4e
	.word	0x4772f3fa,0x1e6225b9
	.word	0x34fb6541,0xd15f14be
	.word	0x871eb199,0x61dcbd56
	.word	0x2cec1d6f,0x12c55111
	.word	0x1599b1c1,0x6eee22b9
	.word	0x3c7c0000,0x135743a3
	.word	0xa65e6b0b,0x0fdd9a85
	.word	0x4043abd7,0xe271076f
	.word	0xc6314632,0x5d0a2eb8
	.word	0xeaa40ba8,0xff469705
	.word	0xdc7ebea9,0xfcb4576b
	.word	0x0654a1ab,0xdaa1b9b8
	.word	0x13da0a12,0x12cd748e
	.word	0xe19c5abe,0x87dde19b
	.word	0xc663c165,0x97d9c76e
	.word	0xa5853e73,0xe9bd6bb5
	.word	0x1f8bdf46,0xcdf61318
	.word	0x4ec67f43,0xfc312090
	.word	0x44d26cf9,0x70e75b64
	.word	0xd297a0d7,0xf991fb8c
	.word	0x0786f3c5,0x08e27ab8
	.word	0x37401ccb,0x1c2d32ac
	.word	0x93766374,0x62cd1bcc
	.word	0x6866a918,0x8c19762d
	.word	0x42fd8b8f,0x02e9656d
	.word	0x290ea7c4,0x014c0bdf
	.word	0xce3d8bf9,0xf79383c2
	.word	0xb6080c41,0x5be1563b
	.word	0x1c31e1e8,0x2fbe6089
	.word	0x1196adc7,0x6856d863
	.word	0x8fbe0530,0x2d1c0964
	.word	0xccbfb6f1,0xde1d30e6
p3_local1_expect:
	.word	0x1294ffff,0xffffe721
	.word	0xffffffff,0xfffff268
	.word	0x5b1f4217,0xe522151c
	.word	0x1db8a889,0x51fe845e
	.word	0x525dca4b,0x0000ff00
	.word	0x892e8efd,0x407121ce
	.word	0x4bdf2536,0xddd42875
	.word	0xe2403da4,0xf15c83a9
	.word	0xade32a0f,0x2aad41d7
	.word	0x4c7bab70,0x77e482ad
	.word	0x00000000,0x00000000
	.word	0x2f408f21,0xede89045
	.word	0xcfba3c86,0xda77e73e
	.word	0x2bfbb310,0xe3d9d490
	.word	0xe464143f,0xfd7b602e
	.word	0x176c5c01,0xa87cd0bf
	.word	0xe8fe5354,0x6fed1e72
	.word	0xcba45486,0xabc7f88d
	.word	0x9a081ea8,0x585a8325
	.word	0xeadaea4c,0xef39a975
	.word	0x6710ea33,0xff5cfcb6
	.word	0xe4afc1c1,0xbbcdaf29
	.word	0x9c761acc,0x412c9b44
	.word	0xbf861c0f,0x00000000
	.word	0xe95923f9,0xc5fb75a9
	.word	0x13b53cef,0xa11ff9f0
	.word	0x8d3581c3,0xc0ab4f61
	.word	0xeca649df,0x0531f1c3
	.word	0x54a0f20a,0xff57c8d5
	.word	0xe7e1c5c0,0x92758b4c
	.word	0x8b27e9b6,0xa969e49a
	.word	0x8864afb3,0x053093ca
	.word	0x28a760c8,0x8ac950eb
	.word	0xe5c53169,0x31eef08f
	.word	0x1d8cc2f0,0x957fe73c
	.word	0x83ac4e46,0x8fd6b461
	.word	0x8d2cdb59,0x81fa271c
	.word	0x16f69414,0x3d80a886
	.word	0x24b7ba58,0x8ec8dd31
	.word	0xd74b6ad9,0x019f7ef7
	.word	0x000000f2,0xffffcd01
	.word	0xd922273d,0xfef5e183
	.word	0xd6a6ff58,0xb546509c
	.word	0xd62bea1f,0x00c65530
	.word	0x2329d093,0xe3247012
	.word	0xb2a4bfd5,0x44279113
	.word	0x350e8699,0x2c624039
	.word	0xde805a9f,0xd3efc9f5
	.word	0x5635e7d3,0x420a54e4
	.word	0xd509d497,0xb77c557e
	.word	0xf43d6e87,0x8a00eb6e
	.word	0xdce10db8,0x7d5c2f1f
	.word	0x6fa51e4b,0x8b02f293
	.word	0xa6f4998a,0x5b1e9ccd
	.word	0x901c618a,0xc4b2bf76
	.word	0x81960e37,0x02599756
	.word	0xc2f489ba,0x5625e69a
	.word	0x34865722,0x076fe620
	.word	0xd1fdb493,0x97deb430
	.word	0x2533396d,0xcff693f6
	.word	0xe57aea21,0x2d90b078
	.word	0x19346410,0x82322faf
	.word	0xe407f96c,0x80ffcee4
	.word	0x7bb47eb1,0x5d9e49cd
p3_local2_expect:
	.word	0x4c4a0000,0x00007d5c
	.word	0x00000000,0x0000e06f
	.word	0x64addfab,0x464bff9e
	.word	0x4edd72e1,0x5fee0bb1
	.word	0x4318ba3f,0xa8ce74ce
	.word	0xd18d7270,0xe6f4dc8a
	.word	0x98cc47a3,0x2f2f2f20
	.word	0x6554a76a,0x88534f1f
	.word	0xba50aa15,0xb0d035f7
	.word	0xb1c5fc57,0x2b2ba4a9
	.word	0x15b6b289,0x984a633c
	.word	0xeb8b747d,0x1d6e362e
	.word	0x4bf34217,0x31447ccb
	.word	0x5e05c6fa,0x88e91804
	.word	0xcc004845,0x5dc095b1
	.word	0xff6b1b11,0x4cf5918e
	.word	0x037f0aeb,0x7d8fe67d
	.word	0xe15ee5bd,0x0cbd55c5
	.word	0x5f10630e,0x51cfd1b2
	.word	0x2fc73fef,0xb50e8c87
	.word	0xc1df32fc,0x5d12ff2e
	.word	0x944aa089,0xefb7ecd3
	.word	0x2cbc7056,0xd97e3b7d
	.word	0xfbc50b54,0x273de80e
	.word	0xc77f2e51,0x70e18302
	.word	0xef2dcb12,0xb4f9d075
	.word	0xcf123aa9,0x90eadb2c
	.word	0x9e0b2847,0x3baec73e
	.word	0x9d1fe0a6,0xdca1085a
	.word	0xe556635e,0x1e8cb95d
	.word	0x81836ab2,0x3b06af9c
	.word	0x541c50c6,0xb909e4e6
	.word	0x8f2ca876,0xddbc5085
	.word	0xef966a70,0x0c05d348
	.word	0x3524c762,0xbf56d5d1
	.word	0x2e5b8908,0x3be14cee
	.word	0x00000000,0x0000003f
	.word	0x61ffc016,0x2f1cb10f
	.word	0xc6d48136,0xbe5c3610
	.word	0xf8d2f615,0xf649c0d3
	.word	0x24ff407f,0xef102693
	.word	0x08e6d053,0x37a68128
	.word	0x0aba2b70,0x337966a0
	.word	0x78b9e5a8,0x2c2b87a7
	.word	0xd449a9f6,0xcab808bf
	.word	0x1a2a0960,0xb20f8196
	.word	0x27d98319,0xa07965d2
	.word	0xc063511c,0xc58f6b3a
	.word	0xc9988dde,0x179aab2a
	.word	0x09afc4c9,0xa5800027
	.word	0x0711b46b,0x7ea20c00
	.word	0xc131fcf5,0x2d2bb8f8
	.word	0x1a4ba3be,0x42d6e259
	.word	0x8648aafd,0x70f183ba
	.word	0xeb921715,0x1751f6cd
	.word	0xa5c33a2d,0xc181374d
	.word	0x6aa039f4,0x34edf5dd
	.word	0xe831c0aa,0x13d0b898
	.word	0x540d532c,0xdab70d29
	.word	0x3f32bf84,0x75687fad
	.word	0x00000000,0x00000000
	.word	0xd544d655,0x5d3579fd
	.word	0x1c4a58df,0x7a18257c
	.word	0x76fd90f5,0x0000225f
p3_local3_expect:
	.word	0x00000000,0x0000008d
	.word	0xfffffafa,0xffeddf00
	.word	0x60f93586,0x1c6eafc7
	.word	0x80d4058b,0x58db1c2d
	.word	0x5e70ebdb,0xfb9a0204
	.word	0x65cdf645,0x9538379b
	.word	0xcefd814c,0x9b031171
	.word	0xc8bb3440,0xaaefca23
	.word	0x257a0bbe,0x7f4f4f6b
	.word	0x46073903,0xb481c29d
	.word	0x96ed6574,0x37147154
	.word	0x00000000,0x00000000
	.word	0xb1296e70,0xf0e2ff44
	.word	0x7276960a,0xa0de31da
	.word	0x104958d6,0x25e357f4
	.word	0xccd01b14,0x99bcf116
	.word	0xcc3554bf,0xaddb4289
	.word	0xfbfe936c,0xa07cd32c
	.word	0xd7650daa,0xd4edcc41
	.word	0x0000ff00,0x70f1895d
	.word	0x68013e6f,0xfa0c51e8
	.word	0x2ed61bd9,0xab4ef710
	.word	0x9ea73f4d,0x1acad985
	.word	0x0bf7035b,0x5388e993
	.word	0xd0700000,0x51986add
	.word	0xf1816623,0x450f1a2b
	.word	0x4275a6aa,0x244d69b0
	.word	0x194cc872,0x654b437f
	.word	0xcb8d9ba1,0x6898ae3a
	.word	0x7995d049,0x55eb36ca
	.word	0x871096ce,0xcb18d057
	.word	0xcde6f0cc,0x3f96b744
	.word	0xd4552007,0x720e9d93
	.word	0x00000000,0x00010429
	.word	0xec1dba8a,0x53d4e802
	.word	0x4a9745cf,0x297517bd
	.word	0x51ee2ce9,0x9b48e94b
	.word	0x8c507f62,0xb1e38929
	.word	0x19e75c46,0x161a60bb
	.word	0x6d4350eb,0x0d8c821b
	.word	0x81346041,0xbf2671bc
	.word	0xe06fbded,0xae80f4e1
	.word	0x9639c87c,0xf7cd0e14
	.word	0xa3e05966,0x499079db
	.word	0xc67a8c8a,0x4db9ffff
	.word	0x96f84e3d,0x747ceafd
	.word	0xa5f4d34d,0xaacb8115
	.word	0xd35cb9b8,0xeec7d7ab
	.word	0xacda009f,0x46d63385
	.word	0x83c5427b,0xc0478c05
	.word	0xf62507ca,0x51e41202
	.word	0xb2ca5beb,0xc00053e0
	.word	0x00000000,0x00f2ce64
	.word	0x27d91e4e,0x5d192f65
	.word	0x21dcd238,0x60ccfc54
	.word	0x956c5caa,0xff8f0329
	.word	0xbdc89386,0x7a06f357
	.word	0x58531db4,0xe0a52279
	.word	0x45d92155,0xb4dde7cf
	.word	0x4772f3fa,0x9d350216
	.word	0x31623672,0x255dc7e1
	.word	0x6fb2b6f8,0x865c981c
	.word	0xabe00e00,0x2f5fce60
	.word	0xaf003def,0x0f8ffc34
p3_local4_expect:
	.word	0xef48a3f7,0x4c779b77
	.word	0x75541267,0x9bc64c4a
	.word	0x2ff24c8d,0x2140291e
	.word	0x83347bc9,0x40900706
	.word	0x28bf6b6d,0xe5f92cbc
	.word	0x5e01d76d,0x2b05d055
	.word	0x4b148088,0x8cd368d7
	.word	0xd622563e,0x2a7dd8cc
	.word	0x0af90197,0xdb443d00
	.word	0xbd980895,0x61d8029c
	.word	0x1b07a6e5,0x6848e6e9
	.word	0xfbccb56e,0xd681c76a
	.word	0x45da2ef6,0x40949b00
	.word	0x8b6e347e,0x10f94f90
	.word	0xf1c54e0a,0xf23d07fd
	.word	0x806f3633,0xa44700fd
	.word	0xc5a87ead,0x7ee3276a
	.word	0x62831709,0xe9c65924
	.word	0xb69576c0,0x50a60e1c
	.word	0x00000000,0x70f1895d
	.word	0x4a13af6c,0x1c59a4f5
	.word	0xed93ce00,0x17c01230
	.word	0x13685bcd,0x3c299413
	.word	0xccee6617,0xba2f9a2b
	.word	0xf123b26e,0xa77e0f87
	.word	0xbe79061d,0xc6fbe145
	.word	0xec36d1f9,0xada4586a
	.word	0x53638888,0x319a1728
	.word	0x163fc61e,0xcc506f3f
	.word	0xa9c00983,0x44bd0409
	.word	0xfc7e8edd,0x988a9910
	.word	0xe3a16dcc,0x99eb5359
	.word	0xd710ccf1,0xa0669072
	.word	0x7ec3dcab,0xca39ca88
	.word	0xcdb524fa,0xe9ae86ba
	.word	0xfc60d606,0xaf60edb7
	.word	0x78273d5f,0xd4d691e3
	.word	0x9a839987,0xf91dc492
	.word	0x98e57c48,0x3ad26df9
	.word	0x7e5228ff,0xcbc25010
	.word	0xa1b50672,0xebdf1abd
	.word	0xc1f210fa,0x332b81e2
	.word	0xb877e0b8,0xa5f2c1f7
	.word	0xd667775e,0x190dc644
	.word	0x7941aca5,0xebbcfbe0
	.word	0x6d05aa14,0x89d83131
	.word	0x84316835,0xbc6f1931
	.word	0xac6a29fc,0x052c1c25
	.word	0x30dbb844,0xba85392b
	.word	0xaeb0b848,0xbe9ac513
	.word	0x2f209489,0xa0983f00
	.word	0xd3767f78,0x98c744a5
	.word	0x2959678b,0xa8b63fca
	.word	0xfa9b4cd7,0x2fab1f5c
	.word	0xd2ac0645,0xe348bca1
	.word	0x8a213f4f,0x4b574b8f
	.word	0x55d46a69,0xfcc68ab1
	.word	0xeabc5d68,0xff8b85d2
	.word	0xa4bcb7ee,0x2207f319
	.word	0x575e7db6,0x93174425
	.word	0xf57610e3,0x95bb9861
	.word	0xf803ad4b,0xc287c168
	.word	0xc1f9f06b,0x73c08052
	.word	0x05063790,0x450f86ed
p3_local5_expect:
	.word	0xcd9f325c,0x50020baa
	.word	0x5a1df783,0x408e0317
	.word	0x36ab076f,0xe21f9418
	.word	0x2455e74f,0x5a6043e8
	.word	0xa4d50f0d,0x3dbc0d2d
	.word	0xdd61cc87,0x835a4b28
	.word	0xeb9174df,0x3f52048c
	.word	0x179a025c,0xc8cf0b68
	.word	0x0d649037,0xb663e7bd
	.word	0x165d952f,0xf48989ac
	.word	0x4d182b25,0x2a59c6e5
	.word	0x27dafdc2,0xe9c8bd26
	.word	0x7143c996,0x805e7287
	.word	0x7045b8c9,0x4589e00f
	.word	0x7f2d3d8a,0x82ed5e17
	.word	0x9eec2094,0x0328b29e
	.word	0x2c84c3f2,0xd096ea66
	.word	0xe3b20210,0x1a92aee0
	.word	0x0b9344f7,0xacd5ebe9
	.word	0x93275692,0xf9726828
	.word	0xb18fd544,0xbfb97fc6
	.word	0x644c1a1e,0x5aa8eb16
	.word	0xe57630d1,0x09aca52e
	.word	0xef27d1cd,0xc00f0012
	.word	0x2b9d2669,0x38ebab60
	.word	0xccee5b8b,0xd191c28f
	.word	0x4f960046,0x81fe679b
	.word	0x3160d6e8,0xd500db82
	.word	0x56a79972,0xa1a488fa
	.word	0x903bdc1e,0x5f415af9
	.word	0xbe8f791d,0xabc456f6
	.word	0x5ff6bad4,0x48519aa9
	.word	0xacfd4cc0,0x5bc77197
	.word	0x37c89485,0x0000008d
	.word	0x24e6635e,0x44aa33ca
	.word	0x7495ce8b,0xd96640f3
	.word	0xf06fe315,0x54e7a9ae
	.word	0xfd85495d,0x354df623
	.word	0x578219ee,0x6f8f2da5
	.word	0x662820c1,0x6392dea0
	.word	0xf14c5679,0xfad472ed
	.word	0xd9ae371d,0x06a39b35
	.word	0x63e1ad43,0x0dc22063
	.word	0xebf4ac2c,0xb8a9824c
	.word	0x4ee56964,0x9eab7615
	.word	0xc2abf181,0x68c3e5dc
	.word	0x5847fef2,0xb829ea13
	.word	0xb2f085f1,0xb8be83f5
	.word	0x2ebfd4eb,0x5027316e
	.word	0x9165ddbe,0x41b9c204
	.word	0x61c44ca3,0x765f6050
	.word	0xe279c69e,0xe7b9ff71
	.word	0x33e25197,0x9fd956a3
	.word	0x9f7b151f,0x2dae2ba9
	.word	0x09ce7082,0xa5596f44
	.word	0x3a3eedef,0xc58d10bd
	.word	0xba8884bd,0xf108c7e3
	.word	0xe42e490e,0xe33080dc
	.word	0x2e44d9ef,0x812d7ce2
	.word	0x3f2dcf8a,0xa347984f
	.word	0xff0af81a,0x659a113a
	.word	0x6ebc2af2,0x193301ca
	.word	0xbdac5f9f,0xbddb0767
	.word	0x0b18ad28,0x68f44169
p3_local6_expect:
	.word	0x00231f0f,0xc3e57800
	.word	0xd8dc1294,0xa2e8b6b0
	.word	0xbad346ca,0xbf2ca710
	.word	0x495786e5,0x77790f35
	.word	0xd6c3a7f1,0xc0228d18
	.word	0x5e52d7f3,0x08cb8e18
	.word	0x2931b151,0x9f3c9942
	.word	0xe0347884,0xe879dddf
	.word	0x6c372118,0x14c6b292
	.word	0x3fb3a27c,0x80e125af
	.word	0x78948c14,0x692c349a
	.word	0xde9c0d9e,0x835783d9
	.word	0xea504140,0xdda56693
	.word	0x06e07fd4,0xcde2a126
	.word	0x29756cac,0xbcdb41de
	.word	0xb06bbf14,0x71adb4a4
	.word	0x3d0d765d,0x873c3f58
	.word	0xeec809d8,0x729c3a60
	.word	0xd8dc32fc,0x0000fbc9
	.word	0xec6de2ca,0xd5c24fb3
	.word	0xbe420690,0x8d55ce1e
	.word	0x8f5b2c93,0x5a328ee9
	.word	0xa4da2a6d,0xdf6ceacf
	.word	0xaa7ef8c5,0x3abc5dcd
	.word	0xe6399f0a,0x66d7a83c
	.word	0x949b280c,0xc86b258f
	.word	0xe8dffb56,0x99e0c216
	.word	0x7089bdd4,0xda627b6b
	.word	0x43487ab0,0x98ed2e69
	.word	0x56db3c8e,0x5e1f5c22
	.word	0x0063379b,0x3fb0575c
	.word	0x29cac4e6,0x181b3b83
	.word	0x4d8b534e,0xe6dc9d93
	.word	0xf4445d1b,0xaa70b08c
	.word	0x00000000,0x6eee22b9
	.word	0x12d0c70b,0x4df8e492
	.word	0x30e68de7,0x822645bf
	.word	0xbf103aee,0xcb9f1190
	.word	0x42c94614,0x8e08b2aa
	.word	0x6f0a6415,0xf8ec51ea
	.word	0x24b3856c,0x5d8e259d
	.word	0x623ecfa1,0xd36eebf8
	.word	0x080e8fcb,0xa414b106
	.word	0x08613829,0x76e0f353
	.word	0x8ca9bc54,0x26bf1ec6
	.word	0x3c754814,0x5d64f92c
	.word	0x91290843,0x61231162
	.word	0x2981dbe3,0x24b9e09c
	.word	0x6890034b,0xcb592676
	.word	0xd29c1f63,0x20f24905
	.word	0xf5aba819,0xbfa1e6e5
	.word	0xbc9088a4,0xad7f76d3
	.word	0x718885eb,0xc3f0eafb
	.word	0x8b404f4f,0x6db5b228
	.word	0x8e47c69d,0xf617cfcb
	.word	0xdfcee257,0xe870634f
	.word	0xcf4c8f20,0xc1a0da4e
	.word	0x8cdb8153,0x239b3c92
	.word	0x1e2e7940,0x4e95194f
	.word	0x30326db0,0x632f5cbd
	.word	0x86d730bb,0x06e86c5a
	.word	0xfa2375ff,0x0d1fba3d
	.word	0xa914ef0d,0xe8debe3c
	.word	0x04a9fc4f,0xdf6f6e87

expected_common:
	.word	0x1e18143f,0x1e1c3028,0x1b391503,0x1d1b2624
	.word	0x1f3b17ff,0x2732300a,0x13342835,0x04b2026c
	.word	0x2521141d,0x1d373c24,0x18302922,0x2b270e1b
	.word	0x000c2634,0x180f2f35,0x3a1332ff,0x04263523
unres0_expected:
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
	.word	0x00000000,0x00000000,0x00000000,0x00000000
invalidate_semaphore:
	.word	0
invalidate_count:
	.word	0
invalidate_codes:
	.skip	0
p0_reset_cnt:
	.word	0
	.align	8
p0_ec_timing_ctrl:
	.word	0,0
p0_ec_control:
	.word	0,0
p0_mcu_shadow:
	.skip	80
p1_reset_cnt:
	.word	0
	.align	8
p1_ec_timing_ctrl:
	.word	0,0
p1_ec_control:
	.word	0,0
p1_mcu_shadow:
	.skip	80
p2_reset_cnt:
	.word	0
	.align	8
p2_ec_timing_ctrl:
	.word	0,0
p2_ec_control:
	.word	0,0
p2_mcu_shadow:
	.skip	80
p3_reset_cnt:
	.word	0
	.align	8
p3_ec_timing_ctrl:
	.word	0,0
p3_ec_control:
	.word	0,0
p3_mcu_shadow:
	.skip	80
user_data_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local0_begin:
p0_local0_start:
	.word	0x325010a5,0xc15a8924,0x610506ea,0x509695ef
	.word	0x3b6d71d2,0xfa640d39,0x879233d2,0x29e5705c
	.word	0x9fa25601,0xe50f0f34,0x0a870df1,0x85714817
	.word	0xda9759b1,0xd21da992,0xa1c44d5f,0x8af82783
	.word	0x75c7047b,0xe9b25eaa,0x53052166,0x0a979c1e
	.word	0x30650ed2,0x6429d89e,0x9d1a9985,0x40e3d24f
	.word	0xe6566435,0x1f7986d2,0xa0525ab8,0xa47fcfe6
	.word	0x63f36b9a,0x69cbb7b6,0xdd1bea36,0x12c9f19d
	.word	0xf504f1e0,0x27a075d6,0x77fdf5a0,0x1674bc9f
	.word	0xc49cc3ac,0x34a993b7,0xd0267e98,0xa9c1a7f9
	.word	0x96760b09,0xae4d8673,0x6363e375,0x058a1eca
	.word	0x500fc212,0x82bf09c8,0xaaf3a69a,0xc98fb3ba
	.word	0x4898aacc,0xf03f3ee1,0x0dd1b965,0xbbcb821f
	.word	0x9300d99d,0xb100f364,0x536b29fc,0x351225c2
	.word	0x2297b268,0xac1b9de6,0x3dfe54ef,0x1fcb562d
	.word	0x016c1391,0xb2f382ea,0x9fe1f71b,0xdde8d225
	.word	0x1e972297,0x811308e6,0x368887c2,0x73c55675
	.word	0xcd7f9e5d,0xa2bd3e7c,0x4ba5f12a,0x4e455647
	.word	0xba0de3ed,0x4b2d84f2,0xd4bf506d,0xdf821118
	.word	0x86751285,0xc5468e5c,0xa4d4e40b,0xbcef1d6f
p0_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local1_begin:
p0_local1_start:
	.word	0xceb8d694,0x296d9635,0xb18b5de6,0xf8f7658c
	.word	0x47b767cb,0xe27c8139,0x80ebe16d,0x57d7472d
	.word	0x9e0d45b2,0xe0cf9813,0x757dccc4,0xe939d543
	.word	0xfb363a37,0xa590ca40,0x54047e91,0xb58377ba
	.word	0x56e0aaac,0xc446715f,0x1ee24d64,0x69b79a56
	.word	0x6d10b99b,0xd53dc716,0x5861910c,0x0a1a6a3e
	.word	0x85f0c657,0x5b381f7f,0x43c8c412,0x92647f50
	.word	0xb338c56f,0x8d7aa51c,0xeb2afd75,0xa4481346
	.word	0x9b354066,0x93df3494,0x32eb1351,0x0089f099
	.word	0x09eb885a,0xcea14175,0xc0b01873,0xabaa1764
	.word	0xabf5ea84,0xcb15b845,0xfef233c6,0x0ef219e0
	.word	0x5e4e1005,0xa07b3116,0xed2607d3,0x4de3143c
	.word	0x3f474d42,0x279a4243,0xcbf8fd3a,0xcb82057f
	.word	0x5ba6a7ab,0xd1ae859b,0x53cee547,0x73947408
	.word	0xa9ffc704,0xc78dbc23,0x37c675e2,0x183fe540
	.word	0x47d50bc0,0xed95a142,0x52d1b1b3,0x2caa734c
	.word	0x1a5024c8,0xd18dcb2a,0x7bc19bec,0x0782838f
	.word	0xa812a04f,0x41069c79,0xc53c6b70,0x4aaa1f7a
	.word	0xee56a74c,0x8eb172d8,0xa8db9cde,0x13f89f78
	.word	0xae7691e9,0xe20385d4,0xfe0b740d,0x3d5d2696
p0_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local2_begin:
p0_local2_start:
	.word	0xe58e45ee,0x8e70eb48,0xe0c4fbeb,0x8fdf76dd
	.word	0xe67763fc,0xf51a0a95,0x96c80399,0x63db51b0
	.word	0x9913992b,0x91ee9f27,0xa142f1f6,0x29eea795
	.word	0x83d18cdf,0xcf0a25c9,0x76d68fd5,0xc895be88
	.word	0x95cf4ce4,0xac36718b,0xb1f71998,0x5a20c246
	.word	0x3f269cc2,0x3c282219,0x2b80e5b8,0x1bad5e38
	.word	0xed0fdf7c,0x95a02b71,0xd6106887,0x2a42e629
	.word	0xd78bd19d,0xa2275099,0xf1d03f88,0x43a0d3f5
	.word	0x684ddc51,0xb6365dbc,0x86a70789,0xe8bc3fbf
	.word	0x6b1a435d,0x9f2631a6,0x468327a1,0xc50911b9
	.word	0x6307e9be,0x64a79ecf,0xfa15ce90,0x80a896cc
	.word	0x782b192b,0x9dd08adf,0x04b38dc6,0xa4b8361f
	.word	0x360e1f54,0xda2f2ca1,0x318b00bd,0x02e681a9
	.word	0x776d1678,0xb6f92cd0,0x1f07212e,0x57c6b776
	.word	0xa72511d3,0x3f05fdd2,0x1aed703e,0x667eddd0
	.word	0x74529aa3,0xda17c2dc,0x160a93c3,0x656d5720
	.word	0xd5a9a798,0xf1de1a5f,0xd453e61f,0x53bc3c6e
	.word	0x7cc7de5b,0x26ae4ea9,0x0fb45527,0xac18bc69
	.word	0x886150af,0x6db644cc,0x2834a3d2,0xcf0d08b2
	.word	0x43cafbb9,0xb9cdbe2f,0x99b11d89,0x687da2db
p0_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local3_begin:
p0_local3_start:
	.word	0xdb10ecd7,0x3077a555,0x522b2e82,0x4115d48f
	.word	0xa70f906f,0x05f39874,0xa8d25428,0x7206cc2a
	.word	0x4145e0b1,0xe3f639de,0xb5e948da,0xea6fc8d9
	.word	0x68d20b5d,0xe863a946,0x2a7b9431,0xde4f2cb8
	.word	0xab4829c8,0x293c45be,0x7c99292c,0xc06347c6
	.word	0xe1164aad,0x2b895b39,0x1b49b945,0x10e09d51
	.word	0xe880fedf,0xf4279a06,0x719224de,0xec0035f6
	.word	0x667fd634,0xf004ff5c,0x5eda2e42,0xbccbbd6f
	.word	0x440c8f81,0x157101d6,0x599ae65a,0x38247509
	.word	0x98066036,0xb0e85efd,0x497fff45,0x40d0edb2
	.word	0x12d0e7fd,0xc6f34d3d,0x33e94237,0x7e66b217
	.word	0x7f776bcf,0x71798252,0xac63ece7,0x61fee41d
	.word	0xa194fd2e,0xd844d2d6,0x869c6e8f,0xd5429d30
	.word	0x86868ae2,0x2d53b881,0xc75676db,0x24dc6d6c
	.word	0x48b63aec,0x7006db94,0xfb797efd,0x75341c90
	.word	0xffca493e,0xdd75f5df,0x1fa8b6e3,0x903c9b4d
	.word	0xd712e245,0xb9c57525,0x370cd309,0xf5cf0374
	.word	0xbbd557fa,0x3f91b4f0,0x50c17960,0x92ff5bb5
	.word	0xaf71c75b,0x38e4a6fd,0x184fd2e6,0xbd4b31a9
	.word	0xeb160d95,0x3ebc6845,0x76955ede,0x5dc9a63f
p0_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local4_begin:
p0_local4_start:
	.word	0x80e13caf,0xf41bcab9,0x39939b04,0x240f83a3
	.word	0xff104396,0x35bcbaae,0x5aadef19,0x0e0471ea
	.word	0xb96e3085,0x2d56f1a9,0x1c3390e9,0x2496344f
	.word	0x2c3d469b,0x4fe6fd4c,0x7206152a,0x40ffdc0f
	.word	0x53f04dfd,0xaab3d2b7,0x6a1b14f2,0x0cb359c8
	.word	0x1a0824e0,0x3302299a,0x08ae4991,0x59a3ba9e
	.word	0xf109a182,0xd4804479,0x62304d81,0x2c71c832
	.word	0xce58ee57,0x71e1dbdb,0xb502b338,0x3aa2173b
	.word	0xe1d26a14,0xafcbf3d7,0x3f5a5ccd,0xfe39be4f
	.word	0x8acde955,0x0b579986,0x1219f20e,0xa7900edd
	.word	0x4218594d,0x58c93cdc,0xbf06b51f,0x2d95864b
	.word	0x484513cd,0xdd893357,0x8688bbb2,0x8ceac85b
	.word	0x170f30c5,0xe33e3f0c,0xdd7c3db1,0xb39f9e60
	.word	0x885f60c6,0xf2f12c4d,0x08d3670b,0xcd65e445
	.word	0x0bd16c01,0x1e33c107,0x994ea291,0xb10decf6
	.word	0xe4450779,0xf35e5204,0xb4e471e0,0x1da4fc71
	.word	0x6ddaa63b,0x0477bc29,0xbddb1018,0xd87a2e69
	.word	0xc467629a,0x955a58f5,0x2f802332,0x2582a349
	.word	0x0d6a604c,0x1e96571c,0xbf436dd6,0x1b103812
	.word	0x1fe3b2fe,0x79d252ea,0xb459fe58,0x48197961
p0_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local5_begin:
p0_local5_start:
	.word	0x824f1131,0xc46b9f58,0x8208239a,0x5bbe1d68
	.word	0x56f03d1e,0x20c94c14,0x05c4c341,0x7c32ace2
	.word	0xc6c7ff7c,0xc8a2a5c3,0x6a09ac7c,0x059f964b
	.word	0x8cec38a7,0x21191b81,0x51effe0e,0x51ee7d4d
	.word	0x8d840530,0xd48e8681,0x3884db5d,0x88472bca
	.word	0xf6db6800,0xdc31e206,0x8798d579,0x0f379f83
	.word	0x3eec88d2,0x80396ea2,0x8b5b9ac0,0xd27ec343
	.word	0x089b4c1d,0xb3b5470f,0xf354fe57,0xa24b1f0b
	.word	0x91f3baa2,0xa66c1932,0x35700f56,0xeee9301c
	.word	0x3a29125b,0xc6058817,0x0e42818a,0x6da629e9
	.word	0x388c61c1,0x3c0314aa,0x0ffcf499,0xf4f74b89
	.word	0x32c28b32,0xb3a5dec1,0x35242555,0x2dea9eb1
	.word	0x67d22639,0x849a7f78,0xe8ca9eff,0x09e951e6
	.word	0xfbb60b56,0x9060f20f,0x0b6ece98,0x5270939d
	.word	0x687cf664,0xf17606fb,0x04b5d895,0xc65f9f13
	.word	0x16d4273d,0x0ff4f4f1,0x7c5f7d81,0xf41e4d2a
	.word	0x780a62af,0x0ac39a58,0x36bde6a7,0x2723755a
	.word	0xabce41da,0x769124bb,0x2f575c3a,0xfbfbc91a
	.word	0xcc9984eb,0x6fffd539,0x7e634d9c,0x706f438e
	.word	0x877ef384,0x313136f7,0xc635c3a2,0x01d14870
p0_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local6_begin:
p0_local6_start:
	.word	0x54a2da25,0xfdcb01ca,0xdf344b96,0xbc37b240
	.word	0x508a352d,0x66662f4d,0x499242e8,0xc85f9960
	.word	0xfdbe2c51,0x972a264a,0x0753da40,0x587cdd8f
	.word	0x4121f5b3,0x2cef978f,0x49a5e0a3,0x230da98f
	.word	0x51c0707c,0xf9f47f2d,0x610e7729,0x9a1a3dbf
	.word	0xe0faecfd,0xdad9e0bc,0x05a26296,0x29de3832
	.word	0x286b7298,0xa4fac6ef,0xb3a5ae9b,0x7d1f04d5
	.word	0xd1ce25fe,0xb0212502,0xa05c37be,0xf326c3ca
	.word	0x543b53ca,0x7668e72e,0x83496025,0xa190364a
	.word	0xa43dc4fa,0x3b140827,0x18d72c83,0x387c6458
	.word	0xc54a7617,0x5fc8ecb3,0x4ffc9e45,0xa6d51bc0
	.word	0x131d5a8c,0xde32fee5,0xefa325f4,0x06d35b26
	.word	0x63c4d947,0xa7aec1b2,0x2ca3ab01,0x87f26ece
	.word	0x60ce4322,0x186a8c8c,0x9aaca26f,0x9923a860
	.word	0x8c0d1d6c,0x61c46938,0x5b8e0ebb,0x5f761ef5
	.word	0x3187fb5b,0xd8f5cb33,0x670548ca,0x6174a30d
	.word	0x9d7774e2,0xda360b59,0xb430e649,0x5c721a2a
	.word	0xf5670543,0x6ec54f6f,0xbd5bf2aa,0x70ea7f63
	.word	0x485031a0,0x934bbeb7,0xe021c949,0x754a1697
	.word	0x4e4a8abe,0x4e49f789,0xa6a0ea47,0xbe12af12
p0_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local0_begin:
p1_local0_start:
	.word	0xaa27318d,0x64fd9b9d,0x8f99b7bb,0xbd6e380a
	.word	0x3d4d6fc1,0x2b2adf43,0x24d7d6da,0x8c262f97
	.word	0x87f95f57,0x25b179d8,0xa2fd7ee8,0xab78177b
	.word	0x34503aa8,0xdeb90012,0x342b3027,0xf20bb044
	.word	0x83fa87df,0x8ff71462,0x649d06ad,0x8296f318
	.word	0x564160e2,0x3de86b3f,0x5f5aa120,0x876f7643
	.word	0x3273bca5,0xa385e12a,0x144d8b49,0xfb3f3910
	.word	0xb3d6c273,0x66cfc5e4,0x15a7fac2,0xf0f771ae
	.word	0x7361994b,0xa1ea189b,0x1f57113d,0x4df453c7
	.word	0x8feead70,0x97dc819d,0xe164d3dc,0x16b93207
	.word	0x9f718abc,0x261028af,0x129afdd7,0x9fc788d6
	.word	0x2ea17d42,0x8b351f05,0xc313a2a4,0xc6bb4e05
	.word	0x202eb445,0x1e39f6e7,0x3df44cd4,0xa3cf9282
	.word	0xbc3b3ab4,0x7e78c214,0x92112480,0x0761abb2
	.word	0xf3c447ce,0x64417281,0x50978f60,0x01644970
	.word	0x9aa1fef2,0x02ad1746,0x78e34e2a,0x8f2f3505
	.word	0x9ebfc8ac,0x6ee933d1,0x5dc2177b,0x12d60d65
	.word	0xbca1fc53,0xdcf4f6e0,0xb11e77b5,0xe0759baf
	.word	0x4160dd73,0xc00a91e9,0xdb6a74e8,0x43e9a396
	.word	0x45cecc2f,0x898d4e51,0x8a477b68,0xb2389428
	.word	0x108fa323,0x6aebf835,0xaead08ee,0x0fdb898f
	.word	0x011fb113,0xc27f77d5,0xfe7e33a2,0x516559ac
	.word	0x6c913a15,0x943a1ec9,0xcf77bb2f,0x16da8c37
	.word	0xb2d0409d,0x5e95c958,0x9deec4df,0x30a8513a
	.word	0x4185e0da,0x2942eaa1,0xd69ee909,0x1714070a
	.word	0xc66ab520,0x43bca3a5,0xd4a01323,0x90c2fef7
	.word	0x24e08187,0x62d41315,0x4f11f481,0x09bfceb5
	.word	0xb1522255,0x6e39e8e3,0xa2bad82d,0x886a4b97
	.word	0x9974a22c,0xf7f8e1f0,0xc0820329,0xbd98df32
	.word	0x093d7a19,0x3175cbab,0x157dd589,0x7eddf6f5
	.word	0x6e5c2d03,0xf340dea7,0x5dd561d8,0x1a2bfc82
	.word	0x3662ebe9,0xba7e29c2,0xa6d27423,0xdbf8b71f
	.word	0x5fb53961,0x8a4bf373,0xbb15431e,0x83901aad
	.word	0x05fc0023,0x662e81fe,0x95fdcfe7,0x45513e02
	.word	0x9a158e7f,0xec26a564,0xa97dd37f,0xf33aaf95
	.word	0x3be54f29,0xf1b2ef1e,0x5636cef8,0xcc96c9da
p1_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local1_begin:
p1_local1_start:
	.word	0xe54c96b1,0xa8b5f8c5,0x1a14b46a,0x26523483
	.word	0x624b6e2f,0xdc0b5cc0,0xfc4a1eb1,0x3c4047e9
	.word	0x3974d721,0xaef68019,0xf0a9c4ed,0x337cde86
	.word	0x80ac3361,0xa92cfe0e,0x63c2c881,0xbeecfb95
	.word	0x70ad481c,0xa2499c4d,0xd7d1d832,0xebe2162a
	.word	0x1231093f,0x39f296f9,0x519a1ac0,0x40e123c5
	.word	0x31f2b1f4,0xa985929a,0x3cac9739,0x06858398
	.word	0x95902d49,0x66f52820,0x05728b73,0xf04f05be
	.word	0x3d92a06f,0xfbb89f56,0xf28e37bc,0x018a66a2
	.word	0xe78264cb,0xdf12640c,0x4977ce5f,0x7b46244d
	.word	0x7e62ef6f,0xfbcf9e54,0xd8928a28,0x7a2b4964
	.word	0x002fc773,0x5235fffd,0x75a11059,0x67f764b7
	.word	0x70d3f5c6,0xaded0b2a,0x0488282e,0xc32c0c9f
	.word	0xb74caca8,0x8f2edec4,0x4af91f3d,0x7055b9fa
	.word	0x3fd9e459,0xc69f54f5,0xe21d28dc,0xa3466d33
	.word	0x44cb3a9d,0xece20b76,0x717252eb,0xb68b0aff
	.word	0x1cc09d1b,0xe1a5ec75,0xad3f1235,0xcc7271c2
	.word	0x033580df,0xcdd8a9a5,0x2e27c778,0x7a5c07e9
	.word	0xcf7789ef,0xb24e8472,0x876827b8,0x0c9aa63a
	.word	0xc765d9f6,0x1369b8ac,0x666eb9fe,0x54587114
	.word	0x57b5e4f4,0x378c4de2,0xd9b2c51d,0x3574f507
	.word	0x48dd556b,0x1533dbf9,0x9230204d,0xe1e222f4
	.word	0xa04014c0,0xf1127407,0x76693b2c,0xe3a8904e
	.word	0x55834052,0xfa8e2c45,0x0a83c6c5,0x3635282a
	.word	0x2fb4ca62,0x64461602,0xb1514031,0xa6f4c59b
	.word	0x4f758797,0xbfe9e01f,0xfef215f6,0x3505f620
	.word	0x1fb7e15a,0x46be122f,0x0d781008,0x01c29cc9
	.word	0x6d27a557,0x14c15b2c,0x05074e67,0x5951cd15
	.word	0x73a37ce3,0xb06e6fa8,0xc1eefa02,0x5a5e08d1
	.word	0x46e25f98,0x5fdc9add,0x0c6df5a4,0xac824946
	.word	0x8d614984,0x9b6fa145,0x4ff65d73,0xc151a9c7
	.word	0x09b364fd,0x54dd7427,0x18ba406a,0x501f794e
	.word	0x53ba34bb,0x0d113144,0x74f1af6a,0x9a6d975b
	.word	0xb74a236e,0x81ad627a,0xf3c192fb,0x69b26dfd
	.word	0xa641adb7,0x8a584042,0xfbdc821c,0x8a2fc1f4
	.word	0x622ca036,0xd8a6d676,0xef7aa4c2,0x58e6ccc7
p1_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local2_begin:
p1_local2_start:
	.word	0x8267d434,0x02b4b682,0xeeb05a3a,0x51eff06f
	.word	0x25f1f9e5,0xff47b662,0xd82fb009,0xd891fec8
	.word	0x5a2331dd,0x778657da,0x343cfcfb,0xc769c0bb
	.word	0xa36f2e75,0x865b581d,0xa082931e,0x6f10d86c
	.word	0x926c28c1,0x27f98d29,0x31f3d663,0x7d9a0a6f
	.word	0xf3fc82a5,0xc305d311,0xa9a71a19,0x702be71c
	.word	0x95b9d266,0x72e0af27,0xc60a8978,0xbf52541a
	.word	0xdaa010c4,0x085bb3ec,0x26740ba2,0x96ff3bf5
	.word	0xb4c4a7e7,0x3c9c6dc0,0x82e40c38,0xaaf67f52
	.word	0x38138300,0x8e5cb16c,0xccc9b7fd,0x850ec02f
	.word	0x9dbed05f,0xf6276fe6,0xa7684b98,0x195524c4
	.word	0x9e9365b8,0x5527573f,0xf3f0d8a9,0xe56d0e1e
	.word	0x8ea0e9f3,0x4fef675b,0x0129574d,0xcd7b9729
	.word	0xceb21291,0x88af31c6,0x237b137e,0xd899ff53
	.word	0x9108acac,0x267606b5,0x10dc4499,0x3c785081
	.word	0xfb26ee0a,0xf8a23c8c,0xf9cf6d55,0xb13dea24
	.word	0x4c18e2e9,0xdbfa6374,0x7b64018c,0x5e4bff44
	.word	0x50582852,0x6e1877cd,0xff8366e0,0xd09ce9af
	.word	0xc7531779,0x6b4ad992,0x1a1647de,0xe62f9be4
	.word	0x59be6cf4,0x99e043dc,0xead6a21a,0xcd711031
	.word	0xd170355f,0xa49d159a,0xb4e8fe62,0x0fee60ca
	.word	0x2a9568c8,0xb3076346,0xc5a07497,0xbc8961f6
	.word	0xb6ffec99,0xdffe02a2,0x62390e3b,0x6ed7cec1
	.word	0x6c334ed6,0xcdc95fb8,0xfa98733e,0x2560b4d4
	.word	0xecc1faaf,0xbb4c7b29,0x1e46eaac,0x4ac64607
	.word	0x00900d2a,0x49e763de,0x7cb7a142,0xc60da751
	.word	0xacb8955c,0x2a4f02b3,0x7e7f507a,0x46789407
	.word	0xecb7b832,0x14ae73a2,0x2d1a34e9,0x2b7c774d
	.word	0xb73ed785,0xf346aa0b,0xda2e844a,0x4bb7b2a6
	.word	0xb0ca59ff,0xaef7fbb6,0x58a0f118,0x0670d9bc
	.word	0x58800cfc,0xd669d8ec,0xccf599e4,0xe056a087
	.word	0xa171b6d2,0xf6261946,0xa98e5280,0x8808d875
	.word	0x2b31325d,0x638707f6,0xc2b3f17d,0x703eb0b5
	.word	0xcef3528b,0x3d018061,0x36261b4c,0xc2891c81
	.word	0xa482d83f,0x5cab039a,0x994e0b9b,0x00bdbf60
	.word	0xe2c7e520,0x991401df,0x6c7b9aa6,0x0148a85f
p1_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local3_begin:
p1_local3_start:
	.word	0xa21e0ecb,0x92532f36,0xa54c3392,0x5bef0d6a
	.word	0x30bab5a1,0x310a4172,0xaae9cc49,0x0dd1a5ee
	.word	0x0871ae5e,0x7234bddb,0x18a880ed,0x25ae2739
	.word	0xe76708ac,0xb08fcf9c,0x7ae66834,0x5ab38d71
	.word	0xd3b92991,0x0b1459f4,0x19036ac5,0xafea93d4
	.word	0xe20f7900,0xf735e620,0x43c8c6b4,0x55deb7ae
	.word	0x0aebb449,0xb5df4596,0x49e6748c,0x7c2ffeb7
	.word	0x5202e0ef,0xcc66b6a5,0xdae365e4,0x465d7b42
	.word	0x183c843f,0xf2858178,0x067832d6,0xd698a6ea
	.word	0x10ee1f92,0x3080b9bf,0xd0606d9a,0x6aea1ed9
	.word	0x15510c76,0xb7e607da,0xee99945f,0xfa2fefbc
	.word	0x0c173944,0x12bf65b2,0xe9d0cf78,0xb1936b7d
	.word	0x3213872b,0x668d10fb,0x5b831d41,0x2f60a0f7
	.word	0x2bb1ee71,0x6980115a,0xc0b27d23,0x3f0e628e
	.word	0xe9b88803,0xb3f20ffd,0x2f6e74fa,0x029380b0
	.word	0xf215293a,0xb3b56f07,0xa6fdf637,0x39730eca
	.word	0x82567e9a,0x0457da84,0xabf24d0c,0xa04ac58f
	.word	0x75163032,0x6790fd28,0x98f0973d,0xf9f49eef
	.word	0xdfa4ac1f,0xdc0e59e2,0x13a328c5,0x60dd0c59
	.word	0x29d84d15,0x13ec73b3,0x52aa3b25,0x52ef9c2e
	.word	0x2e577ee3,0x6d4d1ffc,0x7f3e51ae,0x4340096c
	.word	0xbf569335,0xbf289135,0x43a46f4b,0x73de3112
	.word	0x4fe15bb1,0xb01b1884,0xf65b00e6,0xba7a7777
	.word	0x2103ea1e,0x58a13dc7,0x3b07dec7,0x8882f363
	.word	0xbf9c1c88,0x2c35a91a,0x42420ecb,0xb5616af6
	.word	0x4d0c4f1b,0xcdbaad92,0x063d3571,0x75f979d1
	.word	0xe522f398,0x744309b9,0x6cd45cb3,0xf8557afa
	.word	0x924a325a,0x602ea134,0x6b06d9d7,0x5ae967ad
	.word	0xac75ea17,0x6b786156,0x4d3196ee,0xe9e760c2
	.word	0x9e8384d9,0x8486bb70,0x7e9ee678,0xe02af7cc
	.word	0x1d379097,0xa69a4c2f,0x31af9bb6,0x04af77db
	.word	0x92840d4a,0x3c7a8f73,0xdf69fe87,0xf82d6482
	.word	0xfa2999f2,0x23f6098b,0x576b46a7,0x9d979b9a
	.word	0x80060bef,0xf98b3018,0xc8601b79,0x3e15509f
	.word	0x69e1195d,0x5cd90db3,0xadfc89c7,0x03ffbe69
	.word	0xe65458ea,0x88c924c9,0x3c2dc3ce,0x5bd4fad4
p1_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local4_begin:
p1_local4_start:
	.word	0xb475a907,0xc9c21c01,0x5231f0c5,0xfeae73e0
	.word	0xa8475218,0x4d2bc4e8,0xeada4eb2,0x3aa27281
	.word	0x46f1f4fb,0x58689b33,0x305a1cd9,0xff177182
	.word	0x73c02cbd,0x6ff7d1c6,0x1934a2b5,0x0e434ae4
	.word	0x7e9c2580,0x27942633,0x5bdc8389,0xa81ec5a4
	.word	0x1edeab03,0x62ea0f93,0x979b8322,0xe5ad907e
	.word	0xbad9bcc5,0x5c1f7e0e,0xf000539f,0x275146e2
	.word	0x8631fce6,0x663eb2a2,0x8b404790,0xe42dd699
	.word	0x25aac44b,0xf8b93fd7,0xb58f2c7f,0xae2f71b7
	.word	0x5ccfcc88,0xcc3004b8,0xe79f461e,0xf4fe9367
	.word	0x24e34d48,0x0df8ffe2,0x38d7c2a7,0x3c259aa4
	.word	0x4f3553ad,0xcd682a29,0xfa178eec,0xb63fdc0e
	.word	0x6393ad2e,0x986f8dcd,0xe31b9561,0xce6397b0
	.word	0x0a39a86e,0xbd179ad4,0x52f6539e,0x3c5ca010
	.word	0xabf13b91,0xd4349a8e,0x573ad176,0xca7bf966
	.word	0xfe221cd9,0x49ecd341,0x7c8e33f2,0x9955f45d
	.word	0x7f232d95,0xaf2827ce,0x9d16c5ae,0x25b3b81f
	.word	0xdd3b3166,0xa92e2709,0x98c13daf,0x5ea8536b
	.word	0xe7f4256b,0x73b99539,0x0f667c2b,0x47b3fb85
	.word	0x39320fce,0xefea060a,0xe8a921f5,0x23bac8c1
	.word	0x41ade2f2,0x6771b000,0xdbaf186d,0x913873dd
	.word	0xd9f52f13,0x7b88b897,0x2cf72a5f,0x23afc763
	.word	0x90d7d8fb,0x87536ceb,0xdeaf5e9b,0x6cf1cc8b
	.word	0xc6912ff6,0x4c04a2ca,0xec7bb45d,0x00e63136
	.word	0x1068cada,0xda85224f,0x37318f17,0x53800b7a
	.word	0x03136092,0xc10bce2d,0xb8d9fdd4,0x74a2997b
	.word	0x51e9b58c,0x44610b96,0x5e15ae57,0x1ce5a4f0
	.word	0x959b9a97,0x5bd2b51a,0xb0206b25,0x6cb84cc3
	.word	0xc9cf2707,0xc5072ee6,0x41d6343f,0xb75d0a49
	.word	0x999fbc92,0x56608303,0xb739cd46,0x278b9f95
	.word	0x0c0c2a66,0xa18b0159,0x1888464e,0xf66c214b
	.word	0xfb53e604,0x9cbcfada,0xccdbd456,0x14d5c289
	.word	0xbdcb319e,0xfa50bd4f,0x2632541f,0x3c28a157
	.word	0xf8d26a85,0x2400c64b,0xc8fc7da9,0x3d70c4f7
	.word	0x1744abe4,0x2c498e9e,0x08c2c01f,0xae354753
	.word	0x3ad0a5cf,0xb303f7fa,0xa5886045,0xb9fc5fbe
p1_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local5_begin:
p1_local5_start:
	.word	0x2a687710,0xea00e6dc,0x66a79730,0xead15a22
	.word	0x14deeb9b,0x56cc1a68,0x2acbd1a4,0xcc3470f3
	.word	0x7eba6e69,0x6cf01d08,0x12d85755,0x9bc15c3d
	.word	0xe5f94499,0x0c74fa43,0xbaa687f4,0x6d707e0c
	.word	0xf04e33db,0xd9199275,0x588a7d2d,0x699f4a4d
	.word	0x1a756f3c,0x0f70bb29,0xfb8d2a93,0xd94be2eb
	.word	0x5d403a88,0xc9691894,0x3dd56d27,0xc5221137
	.word	0x277a9a28,0x3934c08f,0xb91c6606,0x7c42a461
	.word	0x68743a64,0x59fb776d,0xb5fb9e4d,0x6c489dfa
	.word	0x2761e090,0x2df2260b,0x1e7a0960,0x9e21cca0
	.word	0xd2146cca,0x8d863a46,0x1c505085,0xcbc90891
	.word	0x8cf6fe38,0x888d6109,0x92d1899b,0xce759741
	.word	0x4815fd61,0xaa923ed1,0xcd9ea3c9,0x19274cf9
	.word	0x8070b68e,0x7e4b3cfd,0x2346ee1a,0x283c2777
	.word	0x31d5e4b1,0x89d57df5,0xd04e03bb,0xc2679f63
	.word	0xbc154e46,0x41fe1f93,0x68efecf8,0xaf285161
	.word	0x0cf01702,0xf437ec68,0xea2c891d,0xbc5d5a66
	.word	0xf4840a45,0x3d32355a,0x9923a5a1,0x570ca764
	.word	0x78b84def,0xaa6a4be9,0xaf51d000,0xe4661bbe
	.word	0xaecfd419,0x5aacf769,0x621a8ae5,0x2a61a9ab
	.word	0xae16651d,0x4d97f954,0x09207d95,0x8a2aec66
	.word	0x133f4f7d,0xdaeabe1a,0x3c7e21b2,0x5399e051
	.word	0xe0e70f39,0x1b60680c,0xe6bb2786,0x70641320
	.word	0xbe1ea5fc,0x7dc42e71,0x6fec28f4,0x2ad57c29
	.word	0x9ecc3970,0x13cdfa0b,0xad7290f7,0x8b09deff
	.word	0xb95d8793,0x7cb18133,0xa5c57ad9,0x095a8547
	.word	0x535a843e,0xc373bb8b,0xd0d8fe3d,0x52dc2d45
	.word	0xfffe44d5,0x31bb799b,0xc32c7173,0xef05513a
	.word	0x819d7982,0x07254d08,0x5bcb7f18,0xf83b822e
	.word	0xe8cff0e1,0x84d7d550,0xaefc6026,0xf79b1f6c
	.word	0x8be35f4a,0xee0c560a,0x386a4ac4,0xd56212c1
	.word	0x86f82ac5,0x2667f303,0x6a21da81,0xf12f927b
	.word	0x406d872e,0x214e43c8,0xa00abe97,0x73cf799d
	.word	0x806591ae,0x48f98e1c,0xce482772,0x989a7e9d
	.word	0x40d40fde,0x4cd711c2,0xa5e15e42,0xb767be87
	.word	0x9b00b1f1,0x11f5c18f,0x35b2aa30,0x2c652499
p1_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local6_begin:
p1_local6_start:
	.word	0x522cadc3,0x327df9fc,0xba6ae54b,0x9a87ca26
	.word	0xbdd6642d,0xf97bad47,0xaba1214e,0xaf88a098
	.word	0x55bf2f8b,0x060765e1,0x517d1031,0x9aa8c469
	.word	0x894141df,0x20d1546f,0xba679ee9,0x3d1ff943
	.word	0x87af1ece,0x5e267588,0xb397dd0a,0xb7891ca6
	.word	0x22aeb4e6,0x68c7ad4b,0x353118a0,0x191fc42d
	.word	0x10ee2e66,0x163bcefb,0x26631851,0x3ceffdee
	.word	0x06fdd610,0x730d5170,0x42513469,0xca326de7
	.word	0xb52b1a72,0x4f61d5d1,0xb306543e,0xef781874
	.word	0xfb8856e4,0x02c6cd39,0x0cde8fe3,0xfba7cf90
	.word	0xcf291035,0xa17a7c80,0x8e1c9530,0x02ea4056
	.word	0xe8c2d1ed,0x06a1483b,0x34269df9,0x150867cd
	.word	0xb0630f11,0xf057f548,0xafc2b335,0xe9ebe814
	.word	0xad6453bc,0xfce025be,0x05fdb654,0xf4013a88
	.word	0xd837e4da,0xc8c363af,0xca893fd8,0xb57d094c
	.word	0xcf1cd00b,0xbe518d9b,0xf19fbfe9,0x9c55aeaf
	.word	0xfd2f1387,0x3dcf74ea,0x5fedf4d5,0x19699e76
	.word	0xf2ed900c,0x0df99d71,0x0ff9fd22,0x86a11d89
	.word	0xfa22e422,0xbcea4c08,0x735f9a3d,0xf418003f
	.word	0x5480f6db,0x8a82654c,0xdebed1c3,0xa0c3069e
	.word	0x3fedc2b4,0x4202dd26,0xc0cd8d88,0xc83008ba
	.word	0x909311d0,0xe0cc6fd5,0x6be2e405,0xda37a050
	.word	0x4d495677,0xf3df6f22,0x919fe10c,0x7b203a1d
	.word	0x2ec4a7fc,0x0dec078b,0xe3d031e5,0xcce91f49
	.word	0xc1eb1bf2,0xa45ec0a2,0x5b83634c,0x375f53ef
	.word	0x0fb04428,0x206f034f,0xb8bbadc2,0x45d36015
	.word	0x9fe23ad7,0xed779dee,0xf7ae9298,0x60f9498a
	.word	0x57cc0f14,0x789980d3,0x1991dc1f,0x1f3fde13
	.word	0xb64a3d6c,0xdd34876c,0x2787f053,0x0dc9a1d4
	.word	0x76857f9f,0xb407b589,0x1becddc3,0x533b7b9b
	.word	0xb31c4275,0x3df64c7e,0x8b758914,0x9e0c0302
	.word	0x6a0438de,0x1cb5cf42,0xb54032d2,0x83c99baf
	.word	0x585fe2fa,0x91e9606d,0xbf8f5c60,0xc7eed26f
	.word	0xdf26bd12,0x38859de6,0x664b9b9e,0xa731e3bb
	.word	0x556aa1df,0xe4ed417a,0x1ebbc072,0x6175b713
	.word	0xdf5c3bc3,0x1be0c3fa,0x6c6c4a8f,0x124ab2b2
p1_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local0_begin:
p2_local0_start:
	.word	0x73a4618c,0x3b5dbb76,0x69203ef6,0x730185da
	.word	0x359d3bee,0xa66b0f16,0x03c0d4e1,0x11cf392d
	.word	0xe961d5fa,0x594e4aa4,0x9ad79b74,0x1c38bef7
	.word	0xd454dc1b,0xe8ddfaf0,0x78087e2f,0xd715534b
	.word	0x6133f93a,0xb8c9935a,0xcc3eed8c,0xc2b1ff25
	.word	0x6d3132f8,0x7fe1778c,0x50d3538d,0x76a5ab30
	.word	0x5db98e85,0x1f81dd76,0x9fec669a,0x9d4f8b6c
	.word	0x70098c87,0x488f4783,0x38bd0d1c,0xf18f1e52
	.word	0xda80d370,0x849a2c27,0x533e58c1,0x7d7e7057
	.word	0xac111f69,0x99074134,0x8f4b37dd,0xa31af87e
	.word	0xadebcd79,0x8850b07b,0xd001f942,0x14be5e29
	.word	0x3d60eb65,0x49f656e0,0x50f88c3c,0x19442618
	.word	0x4e7e6f9e,0xf17536c9,0x73a0252d,0x83cee25a
	.word	0xe3702003,0x38b1178c,0x3f673912,0xf9c185e2
	.word	0x7765fd20,0xfa5ef2ff,0xf49bf546,0x3f3b81cc
	.word	0x1e4c2ad5,0x3a835cec,0x24fde8de,0xa17f51de
	.word	0x26a0b445,0x9e39ca9c,0x39e37347,0xeab03088
	.word	0x9a83c1c4,0x6cb8392b,0xb727f13f,0x6d1f9e42
	.word	0x0e78b06b,0x4165f7a2,0xd4d02baa,0x9a93a21c
	.word	0x80848bba,0xf891a031,0x6ca5b40e,0x35447d94
	.word	0x254708b6,0xc80ac9e5,0x0fa2d067,0x3191f607
	.word	0x56384721,0x578c8ba3,0x71662ba0,0xaf443200
	.word	0x39625387,0xe1efbfdd,0x23d0b050,0x9bc60690
	.word	0xc903e982,0x001e7202,0x38681f50,0x9cea5443
	.word	0x93ad4148,0x9a473503,0x82484995,0x17a420fb
	.word	0xaaa7f01d,0x4b2eae58,0xc5a1fae4,0x937b3a89
	.word	0xd98faf3b,0xc1fe705c,0xcb3679ff,0x179f9a16
	.word	0x2a1d9d4e,0xe2349632,0x8fb01f8f,0xc7e9b445
	.word	0x65d07cde,0xa7f45a27,0x5d6420b3,0xb3f8cd8b
	.word	0x6ce03e61,0xb93b7bce,0x7839533b,0x63c39350
	.word	0x7aa2309d,0xc4a23f42,0x74631738,0xd5004b5f
	.word	0x225b7cd0,0xa84c2225,0xfc6c4567,0x28dfe777
	.word	0x8d67cdd5,0xed5cc19c,0x1ca85d49,0xca1d4384
	.word	0x2cb0d896,0x13e7c600,0x9075666f,0x22cfa031
	.word	0x0d138db8,0x88599a50,0xdb7bc86d,0x8fa0842d
	.word	0xdbb279e6,0x5573bd84,0x3246539b,0xda26bc20
p2_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local1_begin:
p2_local1_start:
	.word	0xa0d651d2,0x43049d9a,0x894c4ae1,0x4d2a20d7
	.word	0xeef9efc8,0x6c760347,0x3ea1753d,0x71c4a7fa
	.word	0x26deb0a3,0x2b157537,0x47105954,0x64fb68e2
	.word	0x7322f828,0x7a6efe44,0xed98b951,0x75ba1235
	.word	0x93110a5a,0x095038e9,0x8bc8c754,0x9859bebd
	.word	0xe604ee26,0xce72a260,0xb75b345b,0x13feb5fd
	.word	0xcf699416,0xccbc823a,0xb81d29cb,0x2495dbce
	.word	0xbc07f683,0xbe1bcd23,0x185b854f,0xf8eff857
	.word	0xfc8a9c28,0x99733245,0xeafd5a61,0x2222bcb9
	.word	0x4cce1327,0x184db9aa,0x74f81b93,0x54177d21
	.word	0x2f39939d,0x99b5b6d3,0x88995e77,0x0c27285c
	.word	0x4af87fb4,0xf22d260e,0xc73880d7,0xb966be6d
	.word	0x9d6dee46,0xe9e5b8bc,0x53d8d354,0x8c3b91af
	.word	0xa2f504ae,0xb99c0d5e,0xd719cac2,0x924c50aa
	.word	0x442b211a,0x85216b47,0xc40528de,0x28ce7eab
	.word	0x1b042742,0xa9669f96,0x2498e6be,0x251297f9
	.word	0xceea8015,0x54a6dd8d,0xe9b85fca,0xf5825aa5
	.word	0x1cfde4d6,0x4ace0199,0xd0853a82,0x5c68bc37
	.word	0xb06735c0,0xd379ed0d,0xc18c4142,0x3e0aca32
	.word	0x30013ad1,0x1b448c9f,0x68fb2b6c,0x2da4ff15
	.word	0x7a855bee,0xd6f6d96b,0x921aae7e,0x5118ae91
	.word	0x581d0334,0x3bb8514d,0x97a8ad0e,0x1b621b33
	.word	0x2ed86464,0x36897b4d,0x770988f9,0x6f4c5beb
	.word	0x6e227be8,0x3d93d65b,0xfd496c63,0x04838815
	.word	0xb004f452,0xe159f929,0x24161392,0x777c2a05
	.word	0x9e60a0a5,0x858b045d,0xb37cb3d8,0xd196a4a1
	.word	0xab0143d2,0x08d1de42,0x88b4e3ee,0x45149ef6
	.word	0x699b8798,0x5c1cbf2a,0x46b48ee1,0x65978eec
	.word	0x79fcfc01,0x59954d24,0x563c8fd0,0xa7ad2239
	.word	0xb0c630dc,0x7c96e088,0x3993fda8,0x6ebb9ad0
	.word	0xe955dd99,0xdc6e2a65,0x33f53a01,0x706921fe
	.word	0x284382ad,0x5c848575,0x5c9e7f48,0xdab65722
	.word	0xedf3a156,0x06f61f25,0x417bace7,0x8320815b
	.word	0x2f3f2955,0xeb95f171,0xc4e56696,0x84bc0b32
	.word	0x0e97ae4f,0xd8f5c358,0xecf4a9a7,0xb0d1892d
	.word	0xdc9311ed,0x2a0580c3,0xe962b027,0x5fc1d7f8
p2_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local2_begin:
p2_local2_start:
	.word	0xe3b1fa77,0x29844c3c,0x675d6110,0xf7b801dd
	.word	0xde409ced,0x876d6e01,0xcc40a4d0,0x56a1262f
	.word	0xe4c7f8a4,0x33680c30,0x79ab63f0,0xef17015f
	.word	0x4dfa8b77,0x75e1216d,0x03849395,0x5d3b0d89
	.word	0xf17dd476,0x89828c75,0x247b45bb,0x52865e32
	.word	0x454c2c78,0xc884e91d,0x4ae69885,0x071560b1
	.word	0x50dcd281,0x672a632f,0xeb63ab30,0x3ac3960f
	.word	0xb64865c2,0x72ecc2a7,0x4a56684c,0xd9d11b64
	.word	0xe4f3f6b5,0x3209b148,0x55b5e00c,0x97257c19
	.word	0xfcb1e28e,0x860b5d6d,0xc444c003,0xbb8aa55c
	.word	0x277c7820,0x3a8cc996,0xdb4f2039,0x0950abd8
	.word	0x3360dbe2,0x5d50db33,0x81a20bef,0x910e5950
	.word	0xa7d518d1,0x2baf7696,0x67a17f52,0x4d1317a1
	.word	0x47b073c6,0x5a588753,0x36056fcd,0x71078a2e
	.word	0xd45ba69b,0xb371b45e,0xd7caff4a,0x5b6d4670
	.word	0x73826176,0x2ace85fa,0xfe30635b,0xee1dd90b
	.word	0x4225dee2,0xb7a8d289,0x4fc98850,0x7990d215
	.word	0xfbc9d859,0x83e261c1,0xfea857d8,0x45360593
	.word	0x4275f494,0xa48c31e9,0x2d2b9269,0x591d214a
	.word	0x6a112e7d,0xdf413545,0x03a83e4e,0x812c8b44
	.word	0x513dddf1,0x203178a4,0x63806897,0x01006e79
	.word	0x6ff69042,0xa5353396,0x3cc06049,0x10e68aee
	.word	0x4833913c,0x6bae77fb,0x7c8baf31,0xe38eca44
	.word	0x83b2b649,0x85e9bf26,0x8a378c5a,0x795ad0c7
	.word	0x88b8fe17,0x495ae0ee,0x20c8f325,0x2af1cf1f
	.word	0x4bc57c01,0x7f975822,0x2cb16f5f,0x1e736b08
	.word	0xab4632e8,0xceed2160,0x67caae89,0x98338ee7
	.word	0x36d936cf,0xa2045baa,0xebccf977,0xf0ca7bd5
	.word	0xd16fe3dd,0xa13c743c,0x816df24a,0x0fa7754a
	.word	0x898bd851,0x9a655b76,0xdb9cccdd,0x0964efcc
	.word	0x497fca81,0xfb7c38fe,0x0e116db1,0x79930c5d
	.word	0x37ff9872,0x2e5f2c2a,0x1cc1afb8,0x9e052357
	.word	0x7a95b8bf,0xaab3c81d,0xbb270b07,0xfa90ea23
	.word	0x89490cd3,0x0bdc2400,0x6cda6db8,0x9421d197
	.word	0x0c3275f6,0x88f7f903,0xc76844b4,0xb0881f4a
	.word	0x6c9c5541,0x48c808c9,0x49ad58d1,0xe151f726
p2_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local3_begin:
p2_local3_start:
	.word	0x2f9584e3,0x7efad3d9,0x3e05b4cf,0x5e58f339
	.word	0x9f1a6490,0x72e00810,0xa985b7ed,0x2d849c52
	.word	0xd0d34ac9,0xb6995e39,0x7d8f3655,0xe2f7a7bb
	.word	0x40459cdd,0x85db62f0,0x16017fa4,0x4ba2576b
	.word	0x558b48fa,0x259cb3f5,0xb1572808,0x890bb9e9
	.word	0x13b83e1d,0xda6d6265,0xdf3d9956,0x890e9d38
	.word	0x39be61a7,0xada4953a,0xb8cf0ac7,0x6ddfae43
	.word	0x3446565a,0x4488963a,0x76f37dfa,0x81e5bfa6
	.word	0x03151baa,0xc34d54be,0x78f4c309,0xcd73b4ea
	.word	0x63d252e1,0xa0405030,0xf5ff5d26,0x13547857
	.word	0xcd567c1a,0x726fe9e9,0x25169d26,0x3c0af506
	.word	0x2853f7df,0x6ca3f3bf,0x3afabbe5,0xc2e71ccd
	.word	0x98ff2ca0,0x4ae5bd21,0x517e0d73,0x2837258f
	.word	0xaaa473fa,0x441bdb4c,0xa35ce867,0x5c45348d
	.word	0x39107a55,0xc6d31be3,0xb4756f02,0x110baa7c
	.word	0xaa581ea9,0x5e22fd1a,0x66b9a820,0x0852883e
	.word	0xf9762733,0x0e3f4249,0x49dd810b,0xaf544afb
	.word	0x7e1855f7,0x6816d206,0x4d6ab74b,0x8160b980
	.word	0x51d5b2ea,0x0bd8dafd,0xd7c5e32c,0x5176dc8e
	.word	0x14608fb5,0x8fcb6d84,0xdd103bb0,0xeb850656
	.word	0x51f78fc1,0x3976302a,0x3dbee7d8,0xc8e690f2
	.word	0xc6517d8d,0x85c6ba6e,0x9c1c092b,0xe63d61d9
	.word	0xbfeb90f2,0xc3ab8282,0x829e4330,0xbc144834
	.word	0x526202b8,0xf657a7da,0x0fdc395a,0x531c156d
	.word	0xbd1c2d30,0xe1e9ba28,0x46a355fd,0x386107f7
	.word	0x396c9912,0x979b4242,0x42c388b5,0xd0b608f3
	.word	0xe8c22972,0x12389866,0xe7a0bfe5,0x59f2eb27
	.word	0x07863473,0xae2cf0a7,0x52b611d2,0xc2b7496a
	.word	0xc5faebcb,0x6638998a,0xcfe0b4cd,0x01e1b5b2
	.word	0xe4887548,0xbb0cb63d,0xd79d3891,0x5e1c51c4
	.word	0x768d57a6,0x07892e46,0x47b70a26,0xd257988a
	.word	0x12b7bfaf,0xc08e89a7,0xe919fe25,0x466eb944
	.word	0xadc982ff,0x12fd9b57,0x338ce65b,0xc885bc03
	.word	0x77593e50,0xed3f8337,0x56b866f6,0x7a256d8f
	.word	0x6d156bfd,0xc0412209,0x193381e3,0x3a28d273
	.word	0x0956a542,0xa4e9942d,0xebe89cfe,0xba808244
p2_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local4_begin:
p2_local4_start:
	.word	0xab898e24,0x66a62399,0x4e80a591,0xcce53d70
	.word	0x32ce53c0,0xc955c5b6,0x54f9829f,0x97062b95
	.word	0x20cff7a5,0x5bb16c91,0xc085de08,0x5a259965
	.word	0x082cac2c,0xeb0b791a,0xf6d026de,0x7fdba442
	.word	0x96afa36d,0x9fc5a473,0xd0b155a6,0x0a571157
	.word	0x81b8db31,0x06b88ef8,0xd7c9f808,0x349480b6
	.word	0x3c2cd988,0xaab9bf59,0xb3bdd003,0xf3d2d449
	.word	0xcb4576aa,0xf9e4b681,0x08ee4521,0xb1a4f50a
	.word	0x5666d9be,0xebf2798d,0xbe86c721,0x65c78aab
	.word	0xed64df52,0x5b60a483,0xa40e9ed1,0x3312cf08
	.word	0x844a1160,0x1cc6856b,0xb6046dff,0xfbbca713
	.word	0x773f15d7,0xe652b7b2,0x77eb5dd7,0xf78e7be7
	.word	0x43fd21ba,0xfb93bf59,0xf21c5e9a,0xe74dba8d
	.word	0xecb114e9,0x36951027,0xa6711009,0xf3612154
	.word	0x0b306370,0x96aa024d,0x2a454733,0x426a10b8
	.word	0x6bbd12f4,0x483521a3,0xd7e975e7,0x8b2e3080
	.word	0x4b6117ff,0xdef6251c,0xfe4fe09f,0x83cdb9c6
	.word	0xe973ebba,0x8362a582,0xb869813c,0x99e8898d
	.word	0xc169ff56,0xa05f603b,0x80b9791b,0x08b19714
	.word	0x4bcbeffe,0x8358e87b,0x9c5e2702,0x9fca75a6
	.word	0xa8a73436,0xad0fd91b,0xb21127ab,0x208938dd
	.word	0x1c0e09ee,0x3f036a29,0xba7d34b6,0x6f2564f6
	.word	0x4af837f1,0x939e0c57,0x65719404,0xdd87cfdd
	.word	0xd82bf203,0xe1766927,0x262e2d14,0x2e0b50c6
	.word	0xe255298f,0x37882dbf,0x94c6ae62,0xb9a3ca20
	.word	0xd4b851bc,0x859055da,0xd03876e0,0x2118087f
	.word	0xb582dee1,0xa581775e,0x8fd34c22,0x92eaf968
	.word	0x72de1514,0x3965030a,0x4030997d,0x50a59733
	.word	0xf1f0a892,0x569b2968,0xb5ec73ef,0x26d00585
	.word	0x21fcd552,0xb391e13d,0xf5fecaf0,0x1a6b3463
	.word	0x8922c473,0xd464bf97,0x2b99431d,0x0dec4e5a
	.word	0x88a7d430,0x6f4d765a,0x72628475,0xf6c8327a
	.word	0xba492ef7,0x144183a4,0x69f99637,0x6db67101
	.word	0xba01516a,0x09dd172f,0x094c48a7,0xd8aeed4d
	.word	0x1668b530,0xa5e6ea77,0x876de60b,0xb11d4778
	.word	0xff76ba27,0xc5696d40,0x280b7499,0x41262103
p2_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local5_begin:
p2_local5_start:
	.word	0x3006223f,0x2fc68d7b,0x6334ba0b,0x52f3f179
	.word	0x2775a0e0,0x53125e2f,0xba452bb4,0xd20c1321
	.word	0x2fb77d14,0x502f0c1d,0xd5636d59,0xa10509c3
	.word	0xc361b1dc,0x83883c16,0xb511102a,0xbd3f33f8
	.word	0x0b5343d3,0x60416758,0x97427314,0xdca8e01b
	.word	0xb0966589,0x5cadad44,0x4ce7e81d,0x2726d064
	.word	0x5f48e8be,0x0696a143,0xb8f77379,0xdae15e00
	.word	0x5b7fe024,0xac1f9786,0xe8391bc8,0x774aeeb9
	.word	0x7df6a131,0x78b62d3a,0x99c839c3,0x60382999
	.word	0x5dd33120,0x96286689,0xdd4d9303,0x37a387ce
	.word	0x7c11cdcf,0x62b49eb9,0x96c746f9,0x98cd3d3d
	.word	0xb4b55dd0,0x17be976c,0x24f381c1,0xaf1615f4
	.word	0x23915d57,0x7367b5f8,0x58f2a2a3,0xdd9e4f47
	.word	0xd43d5ecf,0x67b56ce0,0x07884a5e,0xc9408374
	.word	0xce7581a1,0x0312c036,0xc1d9c426,0xb9c89457
	.word	0x66a2b9d7,0x70e442ef,0x15428549,0x842a276c
	.word	0x00f2b031,0x3555febb,0x45511416,0x3b054cd8
	.word	0x41d775b2,0xbe0ae398,0xeb4d0648,0xa931561f
	.word	0x1655a3f9,0x4268cb83,0xc9d420e9,0x3e391357
	.word	0xc75e1dfe,0xa07fd2da,0x1a69674a,0x86b0a928
	.word	0x0960b70a,0xbf6cacf0,0xdc5dbf45,0x288691a7
	.word	0x3e1607a2,0x29508989,0xfc4b4dcc,0x0a3f84d3
	.word	0xb4c0b39d,0xd998ef65,0xcc1f8610,0xb80e03c8
	.word	0xdd4d91a3,0x57fb3d57,0x6bc3c628,0x7954b6e8
	.word	0xfcefdd63,0x6550ec33,0x43108fc2,0x0310c020
	.word	0xcc4b385a,0x30aef54e,0xdce06311,0xe13020eb
	.word	0x2e1ba4d7,0x1cb53916,0xfe39bccd,0x307b8b36
	.word	0xc79c6fe0,0xe34a775d,0x7e08780d,0x3509899a
	.word	0x1eb0b79f,0x118afb78,0x33307028,0xe3ba48e5
	.word	0xa19c17a2,0xc0779428,0xdfdd9cf4,0x3c946843
	.word	0xba95e0e5,0xc869c8f2,0xbc6c1b37,0xd8641703
	.word	0x0b145836,0x70f32cbf,0x469c9946,0x4f30c333
	.word	0x20c58c81,0xe9079d44,0x50ee7a4e,0x2338fe7f
	.word	0x5750379e,0xb1f4b99a,0xba36db8c,0xb88e74ab
	.word	0xa5102e3e,0x2d514e50,0xb8ee2f4c,0xe7d4b556
	.word	0x2040548d,0x2da512fa,0x258af43c,0x378b3bb8
p2_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local6_begin:
p2_local6_start:
	.word	0xe4bba227,0xad95fea6,0xb50bf2e5,0xd3d49a12
	.word	0xb91993fe,0x20b2bf1b,0x76e0e68f,0x56aa42fd
	.word	0x7d4b5fb7,0xfbfc9a06,0xd292ac19,0x986d1725
	.word	0x459a9eaa,0x2a96ec13,0x875462de,0x562113f6
	.word	0xce1647d2,0x792a1675,0x99356ba8,0xb8ce541f
	.word	0x2dec73e3,0xb54bd2b9,0x4e936a99,0xde1e5886
	.word	0x27436646,0xeba4253f,0x71bf7f96,0xc6c6124f
	.word	0x3ffae189,0x7618d470,0x63cf78e8,0xa5e7810c
	.word	0xe66a82a3,0x9fa35392,0x3e0b104a,0x9b93a551
	.word	0x0ca7af2c,0xd006e97f,0x77704801,0xcb71b5d5
	.word	0x2cc8e431,0xc5c42187,0x340b3819,0x4c2c47c7
	.word	0xf14ae178,0x7b2a97e9,0xe5acdc9e,0xaa7a121b
	.word	0x88c0a657,0xb52e20ac,0x0622615f,0x6199502e
	.word	0xbbcd0b28,0x45a772d0,0xeaebcf92,0x42656b11
	.word	0x3ee55f9a,0x9c951bcb,0x062592ce,0x4406d0f5
	.word	0x0622cfcb,0x404fc8e6,0x34e6cf14,0x55e0364b
	.word	0x699ec910,0x14e86ead,0x216ad5b5,0xe01faa9b
	.word	0xa37b8fa9,0xa2158ce7,0x4f5ee131,0x55b0d19f
	.word	0x603b55b0,0xa49f9c1f,0xc73ae2fe,0x2a93c864
	.word	0xf0fa7eb3,0xa32c6e92,0x5dfd652d,0x57cae9d3
	.word	0x95ea5ed5,0x8083f42c,0xb87c1bbb,0xfeea3088
	.word	0x84051313,0xc4175080,0x999293c8,0x685810b0
	.word	0x06e84baa,0x57efaa57,0x1f0b39e5,0x6f40e991
	.word	0x41d76207,0x07c96ac0,0xb9b82681,0x1f499371
	.word	0xac7ef9b3,0x57d6b0e1,0x0e4d46a5,0x78fb0cf3
	.word	0x0145fe99,0x70d606bc,0x02104d32,0x7c6f7dfb
	.word	0x86b0db5d,0xad7a8585,0x604a9f8e,0xb924e4ba
	.word	0x7a92e17b,0xa74348e9,0x56a8f2cd,0x5b5d1a13
	.word	0xc45289f8,0xbe4e49af,0x2c301b9d,0x7c770815
	.word	0xc53f87b5,0x27290499,0x75f92dbe,0xdbf46644
	.word	0x87d288a6,0xb63d517d,0x055944c1,0x008dab6a
	.word	0x7cb9e0b2,0xbef3a898,0xdbbaa4ce,0x1caefc20
	.word	0xfe3f5425,0x85c721f5,0xdb294321,0xc875192c
	.word	0x41762442,0x42cbab86,0xdc3a132e,0x077ed24a
	.word	0xebe1b9f3,0x154e4196,0x190a6122,0xe16a6553
	.word	0x334c4763,0x40832297,0x5506594b,0xcff1605c
p2_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local0_begin:
p3_local0_start:
	.word	0xddc3033f,0x5cd669c3,0x2269c6d1,0x0ae65114
	.word	0xae9d996a,0x2a0e142e,0x1fd87ae1,0x3b20db24
	.word	0xb9505e3c,0x0dd2731c,0x4a0a5799,0x363fe799
	.word	0x32857e3b,0xdbcc75ac,0x4c5265dd,0xa204aad0
	.word	0xd8dcda3c,0x7938b35a,0x6d941e4c,0x464a6c14
	.word	0x0aae0edb,0x85d014de,0xc42ada34,0x3a5c77e3
	.word	0x69dfc984,0x76a2edce,0x23454527,0xc3caca49
	.word	0x30bcca9a,0x85ad7c6b,0x6b1cfe82,0xc5dc0bb4
	.word	0x86ea224f,0x5b2310cb,0x3cad4e3c,0xb56584f1
	.word	0x25fc44a1,0xc8c30093,0x56e71f72,0x55fe4267
	.word	0xed2b0137,0x357b4393,0x8f03185d,0x85f13360
	.word	0x3192d952,0xea1c232f,0xe69f0327,0x65870272
	.word	0x2ec3a7f2,0x81c15f71,0xf6955c3d,0x38373846
	.word	0x5ce7f491,0xb127a715,0x103fc6f0,0x06f185f9
	.word	0x1d642bf1,0x18b98ca5,0x1f0b5dca,0x08df9586
	.word	0xe0ff76d1,0xe549d551,0xf941c599,0xa02cee4e
	.word	0xb0eda041,0x1e6225b9,0x34fb6541,0xd15f14be
	.word	0x871eb199,0x61dcbd56,0x2cec1d6f,0x12c55111
	.word	0x418b115c,0x62faa0cf,0x3c7ca37c,0x135743a3
	.word	0xa65e6b0b,0x0fdd9a85,0x4043abd7,0xe271076f
	.word	0xc6314632,0x5d0a2eb8,0xeaa40ba8,0x55469705
	.word	0xdc7ebea9,0xfcb4576b,0x0654a1ab,0xdaa1b9b8
	.word	0x13da0a12,0x12cd748e,0xe19c5abe,0x87dde19b
	.word	0xc663c165,0x97d9c76e,0xa5853e73,0xe9bd6bb5
	.word	0x1f8bdf46,0xcdf61318,0x4ec67f43,0xfc312090
	.word	0x44d26cf9,0x70e75b64,0xd297a0d7,0xf991fb8c
	.word	0x0786f3c5,0x08e27ab8,0x37401ccb,0x1c2d32ac
	.word	0x93766374,0x62cd1bcc,0x6866a918,0x8c19762d
	.word	0x42fd8b8f,0x02e9656d,0x290ea7c4,0x014c0bdf
	.word	0xce3d8bf9,0xf79383c2,0xb6080c41,0x5be1563b
	.word	0x1c31e1e8,0x2fbe6089,0x1196adc7,0x6856d863
	.word	0x8fbe0530,0x2d1c0964,0xccbfb6f1,0xde1d30e6
	.word	0x559c3b0b,0xaf353d23,0xcc6c8c05,0xf5114a4c
	.word	0xc3dd3e56,0x34967315,0x93082fa3,0xfe773a51
	.word	0x96aae6fa,0x5bc97a96,0xb37903f3,0xa53b1aed
	.word	0x6f2f82d7,0xfc7a2f76,0xbeec2213,0x35d81b72
p3_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local1_begin:
p3_local1_start:
	.word	0xb8318437,0xf7a6adb4,0x7a0d9612,0x6eee22b9
	.word	0x5b1f4217,0xe522151c,0x1db8a889,0x51fe845e
	.word	0x525dca4b,0x939b5e64,0x892e8efd,0x407121ce
	.word	0x4bdf2536,0xddd42875,0xe2403da4,0xf15c83a9
	.word	0xade32a0f,0x2aad41d7,0x4c7bab70,0x77e482ad
	.word	0x80a90e6b,0x8078ed80,0x2f408f21,0xede89045
	.word	0xcfba3c86,0xda77e73e,0x2bfbb310,0xe3d9d490
	.word	0xe464143f,0xfd7b602e,0x176c5c01,0xa87cd0bf
	.word	0xe8fe5354,0x6fed1e72,0xcba45486,0xabc7f88d
	.word	0x9a081ea8,0x585a8325,0xeadaea4c,0xef39a975
	.word	0x6710ea33,0x025cfcb6,0xe4afc1c1,0xbbcdaf29
	.word	0x9c761acc,0x412c9b44,0xbf861c0f,0x7b6d889e
	.word	0xe95923f9,0xc5fb75a9,0x13b53cef,0xa11ff9f0
	.word	0x8d3581c3,0xc0ab4f61,0xeca649df,0x0531f1c3
	.word	0x54a0f20a,0xe957c8d5,0xe7e1c5c0,0x92758b4c
	.word	0x8b27e9b6,0xa969e49a,0x8864afb3,0x053093ca
	.word	0x28a760c8,0x8ac950eb,0xe5c53169,0x31eef08f
	.word	0x1d8cc2f0,0x957fe73c,0x83ac4e46,0x8fd6b461
	.word	0x8d2cdb59,0x81fa271c,0x16f69414,0x3d80a886
	.word	0x24b7ba58,0x8ec8dd31,0xd74b6ad9,0x019f7ef7
	.word	0xdd7cfe0e,0x55d08d19,0xd922273d,0xfef5e183
	.word	0xd6a63b58,0xb546509c,0xd62bea1f,0x00c65530
	.word	0x2329d093,0xe3247012,0xb2a4bfd5,0x44279113
	.word	0x350e8699,0x2c624039,0xde805a9f,0xd3efc9f5
	.word	0x5635e7d3,0x420a54e4,0xd509d497,0xb77c557e
	.word	0xf43d6e87,0xd3aeeb6e,0xdce14ab8,0x7d5c2f1f
	.word	0x6fa51e4b,0x8b02f293,0xa6f4998a,0x5b1e9ccd
	.word	0x901c618a,0xc4b2bf76,0x81960e37,0x02599756
	.word	0xc2f489ba,0x5625e69a,0x34865722,0x076fe620
	.word	0xd1fdb493,0x97deb430,0x2533396d,0xcff693f6
	.word	0xe57aea21,0x2d90b078,0x19346410,0x82322faf
	.word	0xe407f96c,0x80ffcee4,0x7bb47eb1,0x5d9e49cd
	.word	0xf3521224,0x6f57d30a,0x6f30bb85,0x998557d1
	.word	0x91371a09,0xf1a517c0,0x505099e7,0x0ec0b663
	.word	0xa26a4ab8,0xbc19b85e,0x10358b83,0x4ec499c3
	.word	0x9db2510f,0xb3f14e3c,0x799b0e0c,0x7a76d5c0
p3_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local2_begin:
p3_local2_start:
	.word	0xc10d92b5,0xa07c3a5c,0x9692dee0,0xfc3a1ac1
	.word	0x64addfab,0x464bff9e,0x4edd72e1,0x5fee0bb1
	.word	0x4318ba3f,0xa8ce74ce,0xd18d7270,0xe6f4dc8a
	.word	0x98cc47a3,0x97732f20,0x6554a76a,0x88534f1f
	.word	0xba50aa15,0xb0d035f7,0xb1c5fc57,0x2b2ba4a9
	.word	0x15b6b289,0x984a633c,0xeb8b747d,0x1d6e362e
	.word	0x4bf34217,0x31447ccb,0x5e05c6fa,0x88e91804
	.word	0xcc004845,0x5dc095b1,0x926b1b11,0x4cf5918e
	.word	0x037f0aeb,0x7d8fe67d,0xe15ee5bd,0x0cbd55c5
	.word	0x5f10630e,0x51cfd1b2,0x2fc73fef,0xb50e8c87
	.word	0xc1df32fc,0x5d12ff2e,0x944aa089,0xefb7ecd3
	.word	0x2cbc7056,0xd97e3b7d,0xfbc50b54,0x273de80e
	.word	0xc77f2e51,0x70e18302,0xef2dcb12,0xb4f9d075
	.word	0xcf123aa9,0x90eadb2c,0x9e0b2847,0x3baec73e
	.word	0x9d1fe0a6,0xdca1085a,0xe556635e,0x1e8cb95d
	.word	0x81836ab2,0x3b06af9c,0x541c50c6,0xb909e4e6
	.word	0x8f2ca876,0xddbc5085,0xef966a70,0x0c05d348
	.word	0x3524c762,0xbf56d5d1,0x2e5b8908,0x3be14cee
	.word	0x290dc69c,0x24a49fde,0x61eec016,0x2f1cb10f
	.word	0xc6d48136,0xbe5c3610,0xf8d2f615,0xf649c0d3
	.word	0x24eb407f,0xef102693,0x08e6d053,0x37a68128
	.word	0x0aba2b70,0x337966a0,0x78b9e5a8,0x2c2b87a7
	.word	0xd449a9f6,0xcab808bf,0x1a2a0960,0xb20f8196
	.word	0x27d98319,0xa07965d2,0xc063511c,0xc58f6b3a
	.word	0xc9988dde,0x179aab2a,0x09afc4c9,0xa5801c27
	.word	0x0711b46b,0x7ea21272,0xc131fcf5,0x2d2bb8f8
	.word	0x1a4ba3be,0xcfd6e259,0x80f61965,0x3f5bce35
	.word	0xeb921715,0x1751f6cd,0xa5c33a2d,0xc181374d
	.word	0x6aa039f4,0x34edf5dd,0xe831c0aa,0x13d0b898
	.word	0x540d532c,0xdab70d29,0x3f32bf84,0x75687fad
	.word	0x42da7479,0x9fa29821,0xd544d655,0x5d3579fd
	.word	0x1c4a58df,0x7a18257c,0xcb5ee3d1,0x1a282958
	.word	0x8ef27463,0x4e36e6fb,0xebe0ee82,0x0a603f05
	.word	0xcb5b8233,0x3b45e178,0x180d4457,0x9c8f979c
	.word	0xbc84d135,0xbbe0bbdb,0x99f57de6,0xf94162d2
	.word	0x57315f78,0x25aa9418,0x436ea8dc,0xff1b9355
p3_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local3_begin:
p3_local3_start:
	.word	0xcf70e2e0,0x2f4d94c4,0xcd01c419,0x12c08ba0
	.word	0x60f93586,0x1c6eafc7,0x80d4058b,0x58db1c2d
	.word	0x5e70ebdb,0xfb9a0204,0x65cdf645,0x9538379b
	.word	0xcefd814c,0x9b031171,0xc8bb3440,0xaaefca23
	.word	0x257a0bbe,0x7f4f4f6b,0x46073903,0xb481c29d
	.word	0x96ed6574,0x37147154,0xe0840db8,0x5de75625
	.word	0xb1296e70,0xf0e2ff44,0x7276960a,0xa0de31da
	.word	0x104958d6,0x25e357f4,0xccd01b14,0x99bcf116
	.word	0xcc3554bf,0xaddb4289,0xfbfe936c,0xa07cd32c
	.word	0xd7650daa,0xd4edcc41,0xb9f54222,0x4e7344b6
	.word	0x68013e6f,0xfa0c51e8,0x2ed61bd9,0xab4ef710
	.word	0x9ea73f4d,0x1acad985,0x0bf7035b,0x5388e993
	.word	0xe7db1f3d,0x51986add,0xf1816623,0x450f1a2b
	.word	0x4275a6aa,0x244d69b0,0x194cc872,0x654b437f
	.word	0xcb8d9ba1,0x6898ae3a,0x7995d049,0x55eb36ca
	.word	0x871096ce,0xcb18d057,0xcde6f0cc,0x3f96b744
	.word	0xd4552007,0x720e9d93,0x30e0adeb,0x48bf7eb7
	.word	0xec1dba8a,0x53d4e802,0x4a9745cf,0x297517bd
	.word	0x51ee2ce9,0x9b48e94b,0x8c507f62,0xb1e38929
	.word	0x19e75c46,0x161a60bb,0x6d4350eb,0x0d8c821b
	.word	0x81346041,0xbf2671bc,0x3c7bbded,0xae80f4e1
	.word	0x9639c87c,0xf7cd0e14,0xa3e05966,0x499079db
	.word	0xc67a8c8a,0x4db9d1e2,0x96f84e3d,0x747ceafd
	.word	0xa5f4d34d,0xaacb8115,0xd35cb9b8,0xeec7d7ab
	.word	0xacda009f,0x46d63385,0x83c5427b,0xc0478c05
	.word	0xf62507ca,0x51e41202,0xb2ca5beb,0xc0df53e0
	.word	0x680fe805,0xc3bd7982,0xdc671e4e,0x5d192f65
	.word	0x21dcd238,0x60ccfc54,0x956c5caa,0x5c8f0329
	.word	0xbdc89386,0x7a06f357,0x58531db4,0xe0a52279
	.word	0x45d92155,0xb4dde7cf,0x4772f3fa,0x9d350216
	.word	0x31623672,0x255dc7e1,0x6fb2b6f8,0x865c981c
	.word	0xabe00e00,0x2f5fce60,0xaf003def,0x0f8ffc34
	.word	0x91ab1783,0xbcaa19a9,0x3c645c1d,0xb718dd91
	.word	0xd070f9d3,0x799ad68b,0xccd50105,0x26fd3c7a
	.word	0x7eeb0801,0x0e45dd53,0x4de60e94,0x1062afbd
	.word	0x7f326ab4,0xc60ffed0,0xb30e310d,0xe90c36f1
p3_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local4_begin:
p3_local4_start:
	.word	0xef48a3f7,0x4c779b77,0x75541267,0x9bc64c4a
	.word	0x2ff24c8d,0x2140291e,0x83347bc9,0x40900706
	.word	0x28bf6b6d,0xe5f92cbc,0x5e01d76d,0x2b05d055
	.word	0x4b148088,0x8cd368d7,0xd622563e,0x2a7dd8cc
	.word	0x0af90197,0xdb443d00,0xbd980895,0x61d8029c
	.word	0x1b07a6e5,0x6848e6e9,0xfbccb56e,0xd681c76a
	.word	0x45da2ef6,0x40949b00,0x8b6e347e,0x10f94f90
	.word	0xf1c54e0a,0xf23d07fd,0x806f3633,0xa44700fd
	.word	0xc5a87ead,0x7ee3276a,0x62831709,0xe9c65924
	.word	0xb69576c0,0x50a60e1c,0xc9a5037c,0x8e8728aa
	.word	0x4a13af6c,0x1c59a4f5,0xed93ce00,0x17c01230
	.word	0x13685bcd,0x3c299413,0xccee6617,0xba2f9a2b
	.word	0xf123b26e,0xa77e0f87,0xbe79c79b,0xc6fbe145
	.word	0xec36d1f9,0xada4586a,0x53638888,0x319a1728
	.word	0x163fc61e,0xcc506f3f,0xa9c00983,0x44bd0409
	.word	0xfc7e8edd,0x988a9910,0xe3a16dcc,0x99eb5359
	.word	0xd710ccf1,0xa0669072,0x7ec3dcab,0xca39ca88
	.word	0xcdb524fa,0xe9ae86ba,0xfc60d606,0xaf60edb7
	.word	0x78273d5f,0xd4d691e3,0x9a839987,0xf91dc492
	.word	0x98e57c48,0x3ad26df9,0x7e5228ff,0xcbc25010
	.word	0xa1b50672,0xebdf1abd,0xc1f210fa,0x332b81e2
	.word	0xb877e0b8,0xa5f2c1f7,0xd667775e,0x190dc644
	.word	0x7941aca5,0xebbcfbe0,0x6d05aa14,0x89d83131
	.word	0x84316835,0xbc6f1931,0xac6a29fc,0x052c1c25
	.word	0x30dbb844,0xba85392b,0xaeb0b848,0xbe9ac513
	.word	0x2f209489,0xa0983f00,0xd3767f78,0x98c744a5
	.word	0x2959678b,0xa8b63fca,0xfa9b4cd7,0x2fab1f5c
	.word	0xd2ac0645,0xe348bca1,0x8a213f4f,0x4b574b8f
	.word	0x55d46a69,0xfcc68ab1,0xeabc5d68,0xff8b85d2
	.word	0xa4bcb7ee,0x2207f319,0x575e7db6,0x93174425
	.word	0xf57610e3,0x95bb9861,0xf803ad4b,0xc287c168
	.word	0xc1f9f06b,0x73c08052,0x05063790,0x450f86ed
	.word	0x265d2e96,0x83f9a296,0xeac00a68,0x61c3d564
	.word	0x19665b31,0x0e2ff726,0x88799e36,0xe9c1d1b1
	.word	0x6710ae75,0x75a9be3f,0x8c7f1b8b,0xf34468d5
	.word	0xf1a9c091,0xbf6c95b0,0xc0c1af4c,0xdf19b16f
p3_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local5_begin:
p3_local5_start:
	.word	0xcd9f325c,0x50020baa,0x5a1df783,0x408e0317
	.word	0x36ab076f,0xe21f9418,0x2455e74f,0x5a6043e8
	.word	0xa4d50f0d,0x3dbc0d2d,0xdd61cc87,0x835a4b28
	.word	0xeb9174df,0x3f52048c,0x179a025c,0xc8cf0b68
	.word	0x0d649037,0xb663e7bd,0x165d952f,0xf48989ac
	.word	0x4d182b25,0x2a59c6e5,0x27dafdc2,0xe9c8bd26
	.word	0x7143c996,0x805e7287,0x7045b8c9,0x4589e00f
	.word	0x7f2d3d8a,0x82ed5e17,0x9eec2094,0x0328b29e
	.word	0x2c84c3f2,0xd096ea66,0xe3b20210,0x1a92aee0
	.word	0x0b9344f7,0xacd5ebe9,0x93275692,0xf9726828
	.word	0xb18fd544,0xbfb97fc6,0x644c1a1e,0x5aa8eb16
	.word	0xe57630d1,0x09aca52e,0xef27d1cd,0xc00f0012
	.word	0x2b9d2669,0x38ebab60,0xccee5b8b,0xd191c28f
	.word	0x4f960046,0x81fe679b,0x3160d6e8,0xd500db82
	.word	0x56a79972,0xa1a488fa,0x903bdc1e,0x5f415af9
	.word	0xbe8f791d,0xabc456f6,0x5ff6bad4,0x48519aa9
	.word	0xacfd4cc0,0x5bc77197,0x4799a06b,0xd27793cd
	.word	0x24e6635e,0x44aa33ca,0x7495ce8b,0xd96640f3
	.word	0xf06fe315,0x54e7a9ae,0xfd85495d,0x354df623
	.word	0x578219ee,0x6f8f2da5,0x662820c1,0x6392dea0
	.word	0xf14c5679,0xfad472ed,0xd9ae371d,0x06a39b35
	.word	0x63e1ad43,0x0dc22063,0xebf4ac2c,0xb8a9824c
	.word	0x4ee56964,0x9eab7615,0xc2abf181,0x68c3e5dc
	.word	0x5847fef2,0xb829ea13,0xb2f085f1,0xb8be83f5
	.word	0x2ebfd4eb,0x5027316e,0x9165ddbe,0x41b9c204
	.word	0x61c44ca3,0x765f6050,0xe279c69e,0xe7b9ff71
	.word	0x33e25197,0x9fd956a3,0x9f7b151f,0x2dae2ba9
	.word	0x09ce7082,0xa5596f44,0x3a3eedef,0xc58d10bd
	.word	0xba8884bd,0xf108c7e3,0xe42e490e,0xe33080dc
	.word	0x2e44d9ef,0x812d7ce2,0x3f2dcf8a,0xa347984f
	.word	0xff0af81a,0x659a113a,0x6ebc2af2,0x193301ca
	.word	0xbdac5f9f,0xbddb0767,0x0b18ad28,0x68f44169
	.word	0xcb6e993b,0x01e34276,0xc8a0a12d,0xdd0e721f
	.word	0x346ceea9,0x06d1aa95,0xfe0c9465,0x85775e76
	.word	0xeb1326cb,0x5cd8c584,0xccc5c1b1,0x3b11b136
	.word	0x2137c67f,0x508bf141,0x588f5e48,0x8032560e
p3_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local6_begin:
p3_local6_start:
	.word	0x98301f0f,0xc3e57800,0xd8dc1294,0xa2e8b6b0
	.word	0xbad346ca,0xbf2ca710,0x495786e5,0x77790f35
	.word	0xd6c3a7f1,0xc0228d18,0x5e52d7f3,0x08cb8e18
	.word	0x2931b151,0x9f3c9942,0xe0347884,0xe879dddf
	.word	0x6c372118,0x14c6b292,0x3fb3a27c,0x80e125af
	.word	0x78948c14,0x692c349a,0xde9c0d9e,0x835783d9
	.word	0xea504140,0xdda56693,0x06e07fd4,0xcde2a126
	.word	0x29756cac,0xbcdb41de,0xb06bbf14,0x71adb4a4
	.word	0x3d0d765d,0x873c3f58,0xeec809d8,0x729c3a60
	.word	0x6c8df346,0x544cfe46,0xec6de2ca,0xd5c24fb3
	.word	0xbe420690,0x8d55ce1e,0x8f5b2c93,0x5a328ee9
	.word	0xa4da2a6d,0xdf6ceacf,0xaa7ef8c5,0x3abc5dcd
	.word	0xe6399f0a,0x66d7a83c,0x949b280c,0xc86b258f
	.word	0xe8dffb56,0x99e0c216,0x7089bdd4,0xda627b6b
	.word	0x43487ab0,0x98ed2e69,0x56db3c8e,0x5e1f5c22
	.word	0x0063379b,0x3fb0575c,0x29cac4e6,0x181b3b83
	.word	0x4d8b534e,0xe6dc9d93,0xf4445d1b,0xaa70b08c
	.word	0x575a29b8,0xf0db4292,0x12d0c70b,0x4df8e492
	.word	0x30e68de7,0x822645bf,0xbf103aee,0xcb9f1190
	.word	0x42c94614,0x8e08b2aa,0x6f0a6415,0xf8ec51ea
	.word	0x24b3856c,0x5d8e259d,0x623ecfa1,0xd36eebf8
	.word	0x080e8fcb,0xa414b106,0x08613829,0x76e0f353
	.word	0x8ca9bc54,0x26bf1ec6,0x3c754814,0x5d64f92c
	.word	0x91290843,0x61231162,0x2981dbe3,0x24b9e09c
	.word	0x6890034b,0xcb592676,0xd29c1f63,0x20f24905
	.word	0xf5aba819,0xbfa1e6e5,0xbc9088a4,0xad7f76d3
	.word	0x718885eb,0xc3f0eafb,0x8b404f4f,0x6db5b228
	.word	0x8e47c69d,0xf617cfcb,0xdfcee257,0xe870634f
	.word	0xcf4c8f20,0xc1a0da4e,0x8cdb8153,0x239b3c92
	.word	0x1e2e7940,0x4e95194f,0x30326db0,0x632f5cbd
	.word	0x86d730bb,0x06e86c5a,0xfa2375ff,0x0d1fba3d
	.word	0xa914ef0d,0xe8debe3c,0x04a9fc4f,0xdf6f6e87
	.word	0x28a03196,0x203256a7,0x6237827e,0xf1409822
	.word	0x482b474b,0x3f9fd026,0x2160e4fe,0x691700ca
	.word	0x150513f2,0x614c8500,0xc7c6f088,0xc81ed7e6
	.word	0x1682d6bc,0xc594bd13,0x2e1ae5f7,0xb01d3208
p3_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
share0_begin:
share0_start:
	.word	0x8c54adf0,0x476ff8d3,0x0bd1d2e9,0x608a0090
	.word	0xdc7c94dd,0x6514392e,0x779164c2,0x6443c228
	.word	0x7c6be6c3,0xb92f4589,0x40acb485,0xfa610bde
	.word	0x9b58bb0f,0xcd491776,0x20359e85,0xdd2781ee
	.word	0xc9ad9853,0x95466618,0x2cbb3ec7,0x6dd915c6
	.word	0x11e7bee9,0x9dfc18f1,0x0980455f,0xfcb43a29
	.word	0xa9fd881c,0x6d2df8a4,0x97c50b39,0x4245a233
	.word	0x173ac55c,0x219b27a6,0xa850fae7,0x4687b476
	.word	0xbf0c4505,0x78763b52,0x6bc7fbb5,0x73b3aeaa
	.word	0xe55942ac,0x876a24b0,0x3073d12c,0x18ba6173
	.word	0xb0d82fa9,0xc723efe2,0xf5e0c7e9,0xf3940178
	.word	0x88ddc98f,0x09a814ca,0xd6ad6cac,0x7cc5e474
share0_end:
	.seg	"data"
	ALIGN_PAGE_8K
share1_begin:
share1_start:
	.word	0x0b23aed7,0x19d8e6f6,0x4c93e077,0x8fabb5a3
	.word	0xf3b9d630,0xff4efb6c,0x5c233fae,0x26c09511
	.word	0xc347c088,0x54dae16b,0x3b9508b7,0x4e8a4289
	.word	0x7d9cca87,0x6009fb74,0x34b39964,0xaa9a9c28
	.word	0x51ac99f9,0x5a3722fa,0x8bbcb6bb,0x5acc4bd1
	.word	0xd85daa51,0xb1d316fb,0x5d2fceb2,0x38015d69
	.word	0xe958f4e2,0xb378f57b,0x5651c192,0x4f1721ad
	.word	0x70ff9254,0x20f64728,0xda8b8a2c,0x5c60cdd4
	.word	0xb9206a01,0x65caec34,0x84b012bb,0x1cc0bcb6
	.word	0x3d8c38ee,0x67639011,0x40e6cb41,0x3a6cc739
	.word	0xdf7f48b8,0x67032abb,0x3f57efc3,0xb2252d87
	.word	0xc6b986ff,0x8c48b5b9,0x4f97a804,0xf04e77fd
share1_end:
	.seg	"data"
	ALIGN_PAGE_8K
share2_begin:
share2_start:
	.word	0x6b9e9dd0,0xa84017d6,0x8a20b52b,0x341521f7
	.word	0x47327b64,0xbb891c5c,0xbb0bb140,0x4023c9f1
	.word	0x27411bda,0x847012dc,0xace8b311,0x79987366
	.word	0x524224ec,0xd02604bd,0xbe2dbd60,0x3cdf831e
	.word	0x7f576c5f,0x612c337b,0x8331949b,0xb0e68ca7
	.word	0x156bce66,0x29fae095,0xfd9430c8,0xaded68e8
	.word	0xebe40fd3,0xd46726af,0xa3c0648f,0xe6b4db69
	.word	0xdf5b52a4,0x943f1913,0x815aa4f8,0x8edf81d4
	.word	0xf754c7d4,0xb67e435c,0x27610190,0x1b4d9cd6
	.word	0xf401ecd9,0xec787c19,0xaed16dcb,0x451c25a4
	.word	0xaa139d8e,0xe79c1fa5,0x7a9a19b3,0x14558e84
	.word	0x077e43fe,0x25f0467d,0xa118dd4b,0x51f53be9
share2_end:
	.seg	"data"
	ALIGN_PAGE_8K
share3_begin:
share3_start:
	.word	0x365ddc85,0x41808382,0x8ced8103,0xa6c88bdf
	.word	0x8443bc6c,0x7a514d2f,0xd3c304bb,0xf0ff7a17
	.word	0xe38e96fc,0x34e54332,0x8177725b,0xee4808c6
	.word	0xe06db4e2,0x00f2ce64,0x61a7cfcb,0x83724f11
	.word	0x4de95d29,0xc31d8551,0x7518d47c,0x201f68b5
	.word	0xe7bd1326,0xeb33041d,0xea2939fb,0x9b1d60b0
	.word	0xfdb9139a,0x108c7023,0x2eb38d7e,0x0dc6c195
	.word	0xd3c12984,0x366c7d5a,0x048ca6f3,0x2e6b4860
	.word	0x6efe686c,0xd042576e,0x67c1d098,0x7061fcfa
	.word	0x6cfa284b,0x03ae97ec,0x21adfce7,0x0aaffb3a
	.word	0xbff8ac70,0x0cd10a07,0xe7be45eb,0xdacc0af5
	.word	0x1070d6a9,0x2418fc0d,0xe6775f0d,0xf93a4b93
share3_end:
	.seg	"data"
	ALIGN_PAGE_8K
common_begin:
common_start:
	.word	0x1e18143f,0x1e1c3028,0x1b391503,0x1d1b2624
	.word	0x1f3b1701,0x2732300a,0x13342835,0x31000214
	.word	0x2521141d,0x1d373c24,0x18302922,0x2b270e1b
	.word	0x000c2634,0x180f2f35,0x3a133220,0x04263523
	.word	0xa34fda1b,0x43916935,0x433cd925,0xecd00886
	.word	0x4a578504,0xdd2e4407,0x5c894443,0xdcb67160
	.word	0xe2a8de40,0xdd5d87b7,0x496c2574,0xdd377435
	.word	0xa44ad420,0xc86f2552,0x9597bab8,0x4170da87
common_end:
	.seg	"data"
	ALIGN_PAGE_8K
unres0_begin:
unres0_start:
	.word	0x237580e8,0xc2bb115b,0xb745e7a8,0x7b393a14
	.word	0x0384c640,0x925b55a5,0x2d315b59,0xf4eda5a4
	.word	0x7db3e0b2,0xc3eb7d51,0x8d04cd02,0xe27389fa
	.word	0x6c86dce1,0xb508361d,0xf69e7d05,0xfeab7aa1
	.word	0x9270504b,0x0b09b218,0x061a0e3b,0x048983dc
	.word	0xcd7b550b,0xb1af66d0,0xd1b4bc7c,0xa73b551a
	.word	0x2432adfc,0x73787542,0x036269f7,0xf75fc675
	.word	0x776735eb,0xcf9aa2f9,0x31c507f3,0xeb33bb7e
	.word	0xdd1f8107,0x474ddb28,0xee92394c,0xcba7c51d
	.word	0x70981120,0x21b7547b,0x18d27a05,0x6d321bb8
	.word	0xf4c7e5c4,0xe9758c70,0x60c5161c,0x367c41b5
	.word	0x7e8d18a8,0xc60b5d4a,0x201450cd,0xc74d40b5
unres0_end:

