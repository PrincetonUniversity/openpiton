// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mpgen_diag6_042103.s
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
!	Seed = 33
!	CIAM can be on
!	4 Processors, 1000 lines each
!	mpgen   created on Oct 14, 2002 (10:12:19)
!	diag.s created on Apr 10, 2003 (19:29:13)
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
	ldd	[%g1+0x00],%f0		! %f0  = f651b70b, %f1  = a76d0a3e
	ldd	[%g1+0x08],%f2		! %f2  = 5f328acd, %f3  = 9c5137bf
	ldd	[%g1+0x10],%f4		! %f4  = dd3b182e, %f5  = d9e82ca8
	ldd	[%g1+0x18],%f6		! %f6  = 197005cc, %f7  = a7181c95
	ldd	[%g1+0x20],%f8		! %f8  = f5091d52, %f9  = ccd89658
	ldd	[%g1+0x28],%f10		! %f10 = ef7de6a8, %f11 = c9870a8a
	ldd	[%g1+0x30],%f12		! %f12 = e1cbdd8c, %f13 = a6ce9a26
	ldd	[%g1+0x38],%f14		! %f14 = be372278, %f15 = 3bdf2374
	ldd	[%g1+0x40],%f16		! %f16 = 3c5dc8a9, %f17 = 889d016e
	ldd	[%g1+0x48],%f18		! %f18 = f2875363, %f19 = c8c8d9e4
	ldd	[%g1+0x50],%f20		! %f20 = 446fe5ef, %f21 = bfa7fb0b
	ldd	[%g1+0x58],%f22		! %f22 = 9784da5b, %f23 = cd30801a
	ldd	[%g1+0x60],%f24		! %f24 = e3a28039, %f25 = 01385d18
	ldd	[%g1+0x68],%f26		! %f26 = 7fb3683c, %f27 = 434e483d
	ldd	[%g1+0x70],%f28		! %f28 = 5d2d33ed, %f29 = f64757a2
	ldd	[%g1+0x78],%f30		! %f30 = 1344fe8b, %f31 = 47596348
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000032000058] = 28a6997e, %l3 = 401631ffbfeacffb
	lduwa	[%o4+0x058]%asi,%g2	! %g2 = 401631ffbfeacffb
!	%l3 = 401631ffbfeacffb
	sethi	%hi(0x916a3000),%l3	! %l3 = 00000000916a3000
	set	p0_b1,%o7
	fble,pn	%fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[00000000108000a0] = 7eed7fab 761d0200 996e77f4 59e64d88
	prefetch [%i1+0x0a0],2
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x001,%g2
p0_b1:
!	Registers modified during the branch to p0_near_2
!	%l0  = 0000000000009b27
!	%l1  = 1df965001bf68653
!	%l3  = 000000000000a17d
!	%l5  = ffffffffffffff93
!	%l6  = c1320d006ad5cd08
!	%l7  = 00000000007ce28b
	membar	#Sync			! Added by membar checker (1)
!	Branch On Register, %l0 = 0000000000009b27
	brgz,pn	%l0,p0_b2		! Branch Taken

p0_label_2:
!	Mem[00000000108000a8] = 996e77f4, %l0 = 0000000000009b27
	ldsw	[%i1+0x0a8],%l0		! %l0 = ffffffff996e77f4
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x002,%g2
p0_b2:
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000011000008] = f947aeb1, %l4 = 2b712eff931a429f
	lduwa	[%i2+%o6]0x80,%l4	! %l4 = 00000000f947aeb1
!	%f6  = 197005cc a7181c95, %f22 = 9784da5b cd30801a
	fabsd	%f6 ,%f22		! %f22 = 197005cc a7181c95
!	Mem[00000000118000c0] = 09f726f1 fd87dca4 99641c4b 9a063e0b
	prefetcha [%i3+0x0c0]%asi,16
!	%l2 = 63c1c9ff8ca2e2bf, Mem[0000000011000038] = 6ffcced0a128b4ca
	stxa	%l2,[%i2+0x038]%asi	! Mem[0000000011000038] = 63c1c9ff8ca2e2bf

p0_label_3:
!	Mem[0000000010800000] = cb46575d f6ab580f, %l0 = 996e77f4, %l1 = 1bf68653
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000cb46575d 00000000f6ab580f
	bne,a	p0_b3			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000010800070] = 98f569be, %l2 = 63c1c9ff8ca2e2bf
	swap	[%i1+0x070],%l2		! %l2 = 0000000098f569be
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x003,%g2
p0_b3:
	bgu	p0_b4			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000000] = cd3445cb, %l7 = 00000000007ce28b
	ldsb	[%o4+0x003],%g2		! %g2 = ffffffffffffffcd
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x004,%g2
p0_b4:

p0_label_4:
	membar	#Sync			! Added by membar checker (3)
!	%l5 = ffffffffffffff93, %l6 = c1320d006ad5cd08, %l3 = 000000000000a17d
	and	%l5,%l6,%l3		! %l3 = c1320d006ad5cd00
!	%l6 = c1320d006ad5cd08, Mem[000000003080000a] = c9d09a7a
	stha	%l6,[%o1+0x00a]%asi	! Mem[0000000030800008] = c9d0cd08
!	%l0 = 00000000cb46575d, %l1 = 00000000f6ab580f, %y  = 00000000
	sdiv	%l0,%l1,%l6		! %l6 = ffffffffffffffeb
!	Mem[0000000030800044] = c8fd3b55, %l5 = ffffffffffffff93
	ldswa	[%o1+0x044]%asi,%l5	! %l5 = ffffffffc8fd3b55
!	%l0 = 00000000cb46575d, %l3 = c1320d006ad5cd00, %y  = 00000000
	sdivcc	%l0,%l3,%l4		! %l4 = 0000000000000001, %ccr = 00

p0_label_5:
!	Branch On Register, %l0 = 00000000cb46575d
	brgez,pn %l0,p0_b5		! Branch Taken
!	%l6 = ffffffffffffffeb, Mem[00000000100000c8] = c25619e6bf80d465
	stx	%l6,[%i0+0x0c8]		! Mem[00000000100000c8] = ffffffffffffffeb
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x005,%g2
p0_b5:
	set	p0_b6,%o7
	fbo	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000108000e0] = b58856de 3717c06c cecdffe0 36871a04
	prefetch [%i1+0x0e0],22
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x006,%g2
p0_b6:
!	Registers modified during the branch to p0_far_0
!	%l1  = c1320d006ad5c332
!	%l7  = 2638e089443bb01d
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010000010] = cc2d57e2, %l4 = 0000000000000001
	ldsb	[%i0+0x013],%l4		! %l4 = ffffffffffffffe2

p0_label_6:
	set	p0_b7,%o7
	fbge,a,pt %fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 0
!	%l2 = 0000000098f569be, Mem[0000000010800014] = 1e19913e
	stw	%l2,[%i1+0x014]		! Mem[0000000010800014] = 98f569be
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x007,%g2
p0_b7:
!	Registers modified during the branch to p0_near_1
!	%l1  = c1320d006ad5c332
!	%l3  = 0000000072c81d72
!	%l4  = 00000156ffffe3dd
!	%l5  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (5)
!	%l7 = 2638e089443bb01d, immed = 00000005, %l1 = c1320d006ad5c332
	sra	%l7,0x005,%l1		! %l1 = 000000000221dd80
!	Mem[0000000010000008] = b7080c37, %l2 = 0000000098f569be
	ldsba	[%i0+%o6]0x80,%l2	! %l2 = ffffffffffffffb7
	set	p0_b8,%o7
	fbule,a	p0_far_0_he	! Branch Taken, %fcc0 = 0

p0_label_7:
!	Mem[0000000031800048] = a2784a3a0a304605, %l6 = ffffffffffffffeb
	ldx	[%o3+0x048],%l6		! %l6 = a2784a3a0a304605
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x008,%g2
p0_b8:
!	Registers modified during the branch to p0_far_0
!	%l0  = ffffffffffffffb7
	membar	#Sync			! Added by membar checker (6)
!	%f31 = 47596348, %f22 = 197005cc a7181c95
	fitod	%f31,%f22		! %f22 = 41d1d658 d2000000
!	Mem[0000000011000040] = 08707580 c508e818 f4be9228 36fd4d7c
	prefetcha [%i2+0x040]%asi,20
	set	p0_b9,%o7
	fbuge,a,pt %fcc1,p0_near_0_he	! Branch Taken, %fcc1 = 0
!	%l0 = ffffffb7, %l1 = 0221dd80, Mem[0000000031000048] = ef1b3d6f 47677579
	std	%l0,[%o2+0x048]	! Mem[0000000031000048] = ffffffb7 0221dd80
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x009,%g2
p0_b9:
!	Registers modified during the branch to p0_near_0
!	%l1  = 00000156ffffe394
!	%l3  = ffffffffe40b690f

p0_label_8:
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000031800004] = ed7ebd54, %l3 = ffffffffe40b690f
	ldsha	[%o3+0x006]%asi,%l3	! %l3 = ffffffffffffbd54
!	%l0 = ffffffffffffffb7, %l0 = ffffffffffffffb7, %l1 = 00000156ffffe394
	sllx	%l0,%l0,%l1		! %l1 = db80000000000000
!	%l3 = ffffffffffffbd54
	sethi	%hi(0xe6fc3000),%l3	! %l3 = 00000000e6fc3000
!	Mem[0000000031800004] = ed7ebd54, %l1 = db80000000000000
	ldsw	[%o3+0x004],%l1		! %l1 = ffffffffed7ebd54
!	Mem[00000000110000e8] = ffdbfe25, %l0 = ffffffffffffffb7
	ldsw	[%i2+0x0e8],%l0		! %l0 = ffffffffffdbfe25

p0_label_9:
!	%f12 = e1cbdd8c a6ce9a26, %f12 = e1cbdd8c a6ce9a26, %f24 = e3a28039 01385d18
	fsubd	%f12,%f12,%f24		! %f24 = 00000000 00000000
!	Mem[0000000010000008] = b7080c37 f3e9dcb2, %l0 = ffdbfe25, %l1 = ed7ebd54
	ldda	[%i0+%o6]0x80,%l0	! %l0 = 00000000b7080c37 00000000f3e9dcb2
!	%f16 = 3c5dc8a9 889d016e, %f30 = 1344fe8b 47596348
	fnegd	%f16,%f30		! %f30 = bc5dc8a9 889d016e
	set	p0_b10,%o7
	fba,a	p0_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800000] = 1295315138797fa5, %l4 = 00000156ffffe3dd
	ldxa	[%i3+%g0]0x80,%l4	! Annulled
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x00a,%g2
p0_b10:
!	Registers modified during the branch to p0_far_3
!	%l2  = 00000000000000b7
!	%l4  = ffffffff48f7f338
!	%l5  = 00000000f3e9df8e
!	%l6  = ffffffffffffffff

p0_label_10:
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000031800048] = a2784a3a0a304605, %l7 = 2638e089443bb01d
	ldxa	[%o3+0x048]%asi,%l7	! %l7 = a2784a3a0a304605
!	Mem[0000000010800040] = fc03a46e 90316c6d 4c23f65d f48baf51
	prefetch [%i1+0x040],0
!	Mem[0000000030000040] = 161a131427efc08a, %l6 = ffffffffffffffff
	ldx	[%o0+0x040],%l6		! %l6 = 161a131427efc08a
!	%f4  = dd3b182e d9e82ca8, %f10 = ef7de6a8 c9870a8a
	fnegd	%f4 ,%f10		! %f10 = 5d3b182e d9e82ca8
!	Mem[0000000010000080] = 399290d1 7d05e794 93873cd6 6c83c24b
	prefetcha [%i0+0x080]%asi,20

p0_label_11:
!	%f22 = 41d1d658 d2000000, %f13 = a6ce9a26
	fdtoi	%f22,%f13		! %f13 = 47596348
!	%l2 = 00000000000000b7, immed = 0000001f, %l6 = 161a131427efc08a
	srl	%l2,0x01f,%l6		! %l6 = 0000000000000000
	set	p0_b11,%o7
	fba,a	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000108000c2] = 4c8014d4, %l4 = ffffffff48f7f338
	ldstub	[%i1+0x0c2],%l4		! Annulled
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x00b,%g2
p0_b11:
!	Registers modified during the branch to p0_far_3
!	%l0  = a2784a3ac138523d
!	%l2  = ffffffffff9f4ee5
!	%l4  = 00000000e6fc2725
!	%l5  = ffffffffffffffed
	membar	#Sync			! Added by membar checker (9)
!	Branch On Register, %l0 = a2784a3ac138523d
	brgz,pt	%l0,p0_not_taken_0	! Branch Not Taken

p0_label_12:
!	Mem[000000001080002d] = fe3aca4d, %l0 = a2784a3ac138523d
	ldstub	[%i1+0x02d],%l0		! %l0 = 000000000000003a
p0_b12:
	membar	#Sync			! Added by membar checker (10)
!	Mem[00000000110000a0] = 10cf17ea 59bd5dfd fb044f74 84150ae1
	prefetch [%i2+0x0a0],22
	fbul,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000010800020] = 249b7140 003e29da 9395d3a2 feffca4d
	prefetch [%i1+0x020],22	! Annulled
p0_b13:
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010000008] = b7080c37, %l5 = ffffffffffffffed
	lduba	[%i0+%o6]0x80,%l5	! %l5 = 00000000000000b7

p0_label_13:
	set	p0_b14,%o7
	fbge,a	p0_far_0_he	! Branch Taken, %fcc0 = 0
!	%l0 = 000000000000003a, Mem[0000000011000000] = 12f4def1
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000011000000] = 0000003a
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x00e,%g2
p0_b14:
!	Registers modified during the branch to p0_far_0
!	%l0  = ffffffffffffdef7
	bpos,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001080008a] = 33658700, %l0 = ffffffffffffdef7
	ldstub	[%i1+0x08a],%l0		! Annulled
p0_b15:
	membar	#Sync			! Added by membar checker (12)
!	%f1  = a76d0a3e, %f10 = 5d3b182e, %f2  = 5f328acd 9c5137bf
	fsmuld	%f1 ,%f10,%f2 		! %f2  = c0a5a79b daf4e480

p0_label_14:
!	%l6 = 0000000000000000, immed = 00000769, %l1 = 00000000f3e9dcb2
	andcc	%l6,0x769,%l1		! %l1 = 0000000000000000, %ccr = 44
	set	p0_b16,%o7
	fbge,pt	%fcc2,p0_near_3_he	! Branch Taken, %fcc2 = 0
!	Mem[00000000108000dc] = 0dba7cf5, %l7 = a2784a3a0a304605
	ldub	[%i1+0x0dc],%l7		! %l7 = 000000000000000d
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x010,%g2
p0_b16:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000000000
!	%l3  = ffffffffdc952050
!	%l7  = fffffffffffffff2
	bgu	p0_b17			! Branch Taken, %ccr = 88, CWP = 0
!	%l4 = e6fc2725, %l5 = 000000b7, Mem[0000000011800008] = 7a4680c2 1a38767b
	stda	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = e6fc2725 000000b7
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x011,%g2
p0_b17:

p0_label_15:
	membar	#Sync			! Added by membar checker (13)
!	%l0 = 0000000000000000, Mem[0000000011800008] = e6fc2725
	stha	%l0,[%i3+%o6]0x80	! Mem[0000000011800008] = 00002725
!	%l0 = 0000000000000000, immed = 000003b6, %y  = 00000156
	sdivx	%l0,0x3b6,%l7		! %l7 = 0000000000000000
	set	p0_b18,%o7
	fble,a,pt %fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 0
!	%l4 = 00000000e6fc2725, Mem[0000000011800000] = 12953151
	stha	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = 27253151
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x012,%g2
p0_b18:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000ffff
!	%l1  = 0000000000000000
!	%l3  = 000000000000e394
!	%l5  = ffffffffffffff66
!	%l6  = 000000000000e394
!	%l7  = 000000007fffffff
	membar	#Sync			! Added by membar checker (14)
!	Mem[000000001100008c] = 9da8bf35, %l0 = 000000000000ffff
	ldub	[%i2+0x08e],%l0		! %l0 = 00000000000000bf

p0_label_16:
!	%f22 = 41d1d658 d2000000, %f4  = dd3b182e d9e82ca8
	fdtox	%f22,%f4 		! %f4  = 00000000 47596348
!	%l1 = 0000000000000000, Mem[000000003000000c] = f40e214c
	stw	%l1,[%o0+0x00c]		! Mem[000000003000000c] = 00000000
!	%l4 = 00000000e6fc2725, %l2 = ffffffffff9f4ee5, %l4 = 00000000e6fc2725
	orcc	%l4,%l2,%l4		! %l4 = ffffffffffff6fe5, %ccr = 88
!	%l1 = 0000000000000000, Mem[0000000031000004] = 8381ca34
	stw	%l1,[%o2+0x004]		! Mem[0000000031000004] = 00000000
!	%l3 = 000000000000e394, %l1 = 0000000000000000, %l4 = ffffffffffff6fe5
	addcc	%l3,%l1,%l4		! %l4 = 000000000000e394, %ccr = 00

p0_label_17:
	set	p0_b19,%o7
	fbuge,a	p0_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000006] = 00000000, %l7 = 000000007fffffff
	ldstub	[%o2+0x006],%l7		! %l7 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x013,%g2
p0_b19:
!	Registers modified during the branch to p0_far_3
!	%l2  = 0000000000000000
!	%l4  = ffffffffffffffb0
!	%l5  = 00000000000002dc
!	%l6  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010800040] = fc03a46e 90316c6d 4c23f65d f48baf51
	prefetcha [%i1+0x040]%asi,3
!	%f24 = 00000000, %f31 = 889d016e
	fabss	%f24,%f31		! %f31 = 00000000
	set	p0_b20,%o7
	fbge,a,pn %fcc2,p0_near_2_le	! Branch Taken, %fcc2 = 0

p0_label_18:
!	Mem[0000000011800008] = 00002725, %l0 = 00000000000000bf
	ldsba	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x014,%g2
p0_b20:
!	Registers modified during the branch to p0_near_2
!	%l3  = ffffffffffffc71d
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000011800000] = 27253151 38797fa5 00002725 000000b7
	prefetcha [%i3+0x000]%asi,0
	set	p0_b21,%o7
	fbo	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	%l7 = 0000000000000000, Mem[0000000011800008] = 00002725000000b7
	stxa	%l7,[%i3+%o6]0x80	! Mem[0000000011800008] = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x015,%g2
p0_b21:
!	Registers modified during the branch to p0_far_3
!	%l0  = 0000000000000001
!	%l2  = 0000000000000000
!	%l4  = ffffffffffffbe42
!	%l5  = ffffffffffffffe8
	membar	#Sync			! Added by membar checker (17)
!	Mem[00000000100000c0] = f0b2218d 2012a15a ffffffff ffffffeb
	prefetcha [%i0+0x0c0]%asi,22

p0_label_19:
!	Mem[0000000011800000] = 27253151, %l0 = 0000000000000001
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000027
!	%f8  = f5091d52, %f30 = bc5dc8a9
	fnegs	%f8 ,%f30		! %f30 = 75091d52
!	%l5 = ffffffffffffffe8, immed = fffff565, %l3 = ffffffffffffc71d
	add	%l5,-0xa9b,%l3		! %l3 = fffffffffffff54d
!	Mem[000000001000008c] = 6c83c24b, %l4 = ffffffffffffbe42
	ldswa	[%i0+0x08c]%asi,%l4	! %l4 = 000000006c83c24b
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 88

p0_label_20:
!	Mem[0000000011800018] = 3a353a09, %l2 = 0000000000000000
	swap	[%i3+0x018],%l2		! %l2 = 000000003a353a09
p0_b22:
	set	p0_b23,%o7
	fbule,a	p0_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[000000003180000c] = 00000000, %l6 = ffffffffffffffff
	lduw	[%o3+0x00c],%l6		! %l6 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x017,%g2
p0_b23:
!	Registers modified during the branch to p0_far_2
!	%l3  = fffffffffffff55a
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010000000] = c2a99d03, %l1 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000c2
!	Mem[0000000012000054] = 9e9abbd8, %l6 = 0000000000000000
	ldsba	[%i4+0x056]%asi,%l6	! %l6 = ffffffffffffffbb

p0_label_21:
!	%l0 = 0000000000000027, Mem[0000000011000049] = f4be9228
	stba	%l0,[%i2+0x049]%asi	! Mem[0000000011000048] = f4279228
!	%l6 = ffffffffffffffbb, Mem[0000000010800000] = cb46575d
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010800000] = ffbb575d
	set	p0_b24,%o7
	fble,a,pt %fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000010000000] = c2a99d03, %l6 = ffffffffffffffbb
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000c2
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x018,%g2
p0_b24:
!	Registers modified during the branch to p0_near_1
!	%l1  = 00000000000000c2
!	%l3  = 0000000000000000
!	%l4  = 00000000000103ee
!	%l5  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000031800008] = 00000000, %l0 = 0000000000000027
	ldsha	[%o3+0x008]%asi,%l0	! %l0 = 0000000000000000

p0_label_22:
	set	p0_b25,%o7
	fbo,a,pt %fcc2,p0_near_2_le	! Branch Taken, %fcc2 = 0
!	%l1 = 00000000000000c2, Mem[0000000030800048] = d04dff95699bdeb4
	stx	%l1,[%o1+0x048]		! Mem[0000000030800048] = 00000000000000c2
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x019,%g2
p0_b25:
!	Registers modified during the branch to p0_near_2
!	%l3  = ffffffffffffc71d
	membar	#Sync			! Added by membar checker (20)
!	%l3 = ffffffffffffc71d, Mem[000000003200002a] = 64084b72
	sth	%l3,[%o4+0x02a]		! Mem[0000000032000028] = c71d4b72
!	Mem[0000000011800038] = 69a5a071 e9df30fa, %l4 = 000103ee, %l5 = ffffffff
	ldd	[%i3+0x038],%l4		! %l4 = 0000000069a5a071 00000000e9df30fa
	set	p0_b26,%o7
	fbuge	p0_far_0_he	! Branch Taken, %fcc0 = 0

p0_label_23:
!	Mem[0000000010000000] = ffa99d03, %l0 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x01a,%g2
p0_b26:
!	Registers modified during the branch to p0_far_0
!	%l0  = 000000003a353acb
	membar	#Sync			! Added by membar checker (21)
!	%f12 = e1cbdd8c 47596348, %f30 = 75091d52 00000000
	fcmped	%fcc0,%f12,%f30		! %fcc0 = 1
!	Mem[0000000030800000] = c363e5bb 1ed0e670, %l4 = 69a5a071, %l5 = e9df30fa
	ldda	[%o1+0x000]%asi,%l4	! %l4 = 00000000c363e5bb 000000001ed0e670
	bl,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000013000080] = c785c3a3 f738d6c7 8dfb716c 7af447b4
	prefetch [%i6+0x080],21	! Annulled
p0_b27:

p0_label_24:
	bl,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001180008c] = 93ed2588, %l2 = 000000003a353a09
	ldsb	[%i3+0x08d],%l2		! Annulled
p0_b28:
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010800080] = 87557d52 ed53e833 33658700 ec0215ba
	prefetch [%i1+0x080],4
	fbne,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000013000060] = 66d3ea72 799c7fb4 174a55d1 ff0b0046
	prefetch [%i6+0x060],0	! Annulled
p0_b29:

p0_label_25:
	membar	#Sync			! Added by membar checker (23)
!	%f5  = 47596348, %f30 = 75091d52
	fcmpes	%fcc0,%f5 ,%f30		! %fcc0 = 1
!	Mem[00000000100000a0] = dbade58d ce0f9fac 62f42d55 109941d0
	prefetch [%i0+0x0a0],21
!	%f9  = ccd89658, %f5  = 47596348
	fnegs	%f9 ,%f5 		! %f5  = 4cd89658
!	%l2 = 000000003a353a09, immed = fffffc48, %l4 = 00000000c363e5bb
	subc	%l2,-0x3b8,%l4		! %l4 = 000000003a353dc1
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44

p0_label_26:
!	Mem[0000000010000000] = ffa99d03, %l5 = 000000001ed0e670
	ldstuba	[%i0+%g0]0x80,%l5	! Annulled
p0_b30:
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010000020] = 6a945b6e d264d1c7
	flush	%i0+0x020
	fbue	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000108000c0] = 4c8014d4 28bd7fa6 8b6c40a4 e3eca4a6
	prefetch [%i1+0x0c0],21
p0_b31:
	membar	#Sync			! Added by membar checker (25)
!	%l2 = 000000003a353a09, immed = fffff2fd, %l6 = 00000000000000c2
	addccc	%l2,-0xd03,%l6		! %l6 = 000000003a352d06, %ccr = 11

p0_label_27:
!	Mem[0000000010000000] = ffa99d03, %l6 = 000000003a352d06
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
	ble,a	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	%l2 = 000000003a353a09, Mem[0000000010000000] = ffa99d03ddcaeec9
	stxa	%l2,[%i0+%g0]0x80	! Annulled
p0_b32:
	membar	#Sync			! Added by membar checker (26)
	fbn,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000040000016] = 1b040b17, %l1 = 00000000000000c2
	ldstub	[%o5+0x016],%l1		! Annulled
p0_b33:

p0_label_28:
	bcs	p0_b34			! Branch Taken, %ccr = 11, CWP = 0
!	Mem[0000000011800008] = 00000000, %l6 = 00000000000000ff
	lduha	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x022,%g2
p0_b34:
	membar	#Sync			! Added by membar checker (27)
!	%l5 = 000000001ed0e670, immed = fffff107, %l5 = 000000001ed0e670
	orn	%l5,-0xef9,%l5		! %l5 = 000000001ed0eef8
!	%l5 = 000000001ed0eef8
	sethi	%hi(0x45bbe400),%l5	! %l5 = 0000000045bbe400
	set	p0_b35,%o7
	fble,a,pt %fcc2,p0_near_3_he	! Branch Taken, %fcc2 = 0

p0_label_29:
!	%l1 = 00000000000000c2, Mem[0000000011800000] = 27253151
	stba	%l1,[%i3+%g0]0x80	! Mem[0000000011800000] = c2253151
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x023,%g2
p0_b35:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000000000
!	%l3  = 0000000000000000
!	%l7  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (28)
!	%l7 = ffffffffffffffff, immed = 00000f80, %y  = 00000000
	sdivx	%l7,0xf80,%l3		! %l3 = 0000000000000000
!	Mem[0000000032000020] = 881b2ad7, %l6 = 0000000000000000
	ldswa	[%o4+0x020]%asi,%g2	! %g2 = 0000000000000000
!	%l5 = 0000000045bbe400, %l0 = 0000000000000000, %l5 = 0000000045bbe400
	srl	%l5,%l0,%l5		! %l5 = 0000000045bbe400
!	Jump to jmpl_1, CWP = 0
	set	p0_jmpl_1_he,%g1
	jmpl	%g1,%g6

p0_label_30:
!	Mem[0000000010800008] = 015e7bad, %l7 = ffffffffffffffff
	lduwa	[%i1+%o6]0x80,%l7	! %l7 = 00000000015e7bad
!	Registers modified during the branch to p0_jmpl_1
!	%l3  = 0000000d8a7f3b14
!	%l4  = ffffffffc5cac6b9
!	%l7  = 00000000ed7ebd54
!	%l4 = ffffffffc5cac6b9, Mem[0000000011800008] = 00000000
	stha	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = c6b90000
	fbn,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[00000000108000e0] = b58856de 3717c06c cecdffe0 36871a04
	prefetch [%i1+0x0e0],23
p0_b36:
	membar	#Sync			! Added by membar checker (29)
!	Branch On Register, %l4 = ffffffffc5cac6b9
	brgez,pn %l4,p0_not_taken_0	! Branch Not Taken

p0_label_31:
!	Mem[0000000031800000] = 8ab36016, %l5 = 0000000045bbe400
	ldsw	[%o3+0x000],%l5		! %l5 = ffffffff8ab36016
p0_b37:
	membar	#Sync			! Added by membar checker (30)
!	%l5 = ffffffff8ab36016, %l5 = ffffffff8ab36016, %l7 = 00000000ed7ebd54
	addccc	%l5,%l5,%l7		! %l7 = ffffffff1566c02c, %ccr = 93
	fbul,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000011000084] = 336f74fc, %l7 = ffffffff1566c02c
	ldsw	[%i2+0x084],%l7		! Annulled
p0_b38:
	set	p0_b39,%o7
	fba	p0_far_3_he	! Branch Taken, %fcc0 = 1

p0_label_32:
!	Mem[0000000032000074] = b8b0b88b, %l2 = 000000003a353a09
	lduw	[%o4+0x074],%g2		! %g2 = 000000003a353a09
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x027,%g2
p0_b39:
!	Registers modified during the branch to p0_far_3
!	%l2  = 0000000000000000
!	%l4  = ffffffffffffff0f
!	%l5  = 000000000000039e
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	%f10 = 5d3b182e, %f9  = ccd89658
	fmovs	%f10,%f9 		! %f9  = 5d3b182e
!	%f24 = 00000000 00000000, %f12 = e1cbdd8c 47596348
	fxtod	%f24,%f12		! %f12 = 00000000 00000000
!	%l1 = 00000000000000c2, immed = fffffe34, %l4 = ffffffffffffff0f
	xorcc	%l1,-0x1cc,%l4		! %l4 = fffffffffffffef6, %ccr = 88
!	%f12 = 00000000, %f15 = 3bdf2374, %f8  = f5091d52
	fadds	%f12,%f15,%f8 		! %f8  = 3bdf2374

p0_label_33:
!	%f12 = 00000000, %f30 = 75091d52 00000000
	fitod	%f12,%f30		! %f30 = 00000000 00000000
!	%l6 = 0000000000000000, %l7 = ffffffff1566c02c, %y  = 0000000d
	sdiv	%l6,%l7,%l5		! %l5 = 000000000000009b
!	%l0 = 0000000000000000, immed = fffffd9a, %l7 = ffffffff1566c02c
	xorcc	%l0,-0x266,%l7		! %l7 = fffffffffffffd9a, %ccr = 88
!	Mem[0000000011000054] = 5fdfc083, %l4 = fffffffffffffef6
	ldsba	[%i2+0x055]%asi,%l4	! %l4 = ffffffffffffffdf
	fbu,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0

p0_label_34:
!	Mem[0000000032000020] = 881b2ad7 861878d1 a417c71d 4b729f64
	prefetch [%o4+0x020],21
p0_b40:
	membar	#Sync			! Added by membar checker (32)
	set	p0_b41,%o7
	fbue,pn	%fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[000000003180004c] = 0a304605, %l6 = 0000000000000000
	ldsh	[%o3+0x04e],%l6		! %l6 = 0000000000004605
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x029,%g2
p0_b41:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000ffff
!	%l1  = 0000000000004605
!	%l3  = 000000000000e394
!	%l5  = ffffffffffffff66
!	%l6  = 000000000000e394
!	%l7  = 000000000f3244d6
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010800000] = ffbb575d, %l3 = 000000000000e394
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ffbb575d
!	Mem[000000003180000c] = 000000c2, %l3 = 00000000ffbb575d
	ldsw	[%o3+0x00c],%l3		! %l3 = 00000000000000c2

p0_label_35:
!	%l0 = 000000000000ffff, immed = 00000e26, %l4 = ffffffffffffffdf
	subccc	%l0,0xe26,%l4		! %l4 = 000000000000f1d9, %ccr = 00
!	%l5 = ffffffffffffff66
	setx	0x2ddab8472ddab847,%g7,%l5 ! %l5 = 2ddab8472ddab847
!	%l6 = 000000000000e394, %l7 = 000000000f3244d6, %y  = 0000000d
	smul	%l6,%l7,%l0		! %l0 = 00000d825c198db8
!	%l6 = 000000000000e394, immed = 00000438, %y  = 00000d82
	sdiv	%l6,0x438,%l4		! %l4 = 000000007fffffff
!	%f4  = 00000000, %f0  = f651b70b a76d0a3e
	fstox	%f4 ,%f0 		! %f0  = 00000000 00000000

p0_label_36:
!	%l3 = 00000000000000c2, immed = 00000fa1, %l3 = 00000000000000c2
	addcc	%l3,0xfa1,%l3		! %l3 = 0000000000001063, %ccr = 00
	nop
!	Mem[0000000010800000] = ffbb575d, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffbb575d
!	%f30 = 00000000, %f27 = 434e483d
	fabss	%f30,%f27		! %f27 = 00000000
!	Mem[0000000011800008] = c6b90000, %l0 = 00000d825c198db8
	lduba	[%i3+%o6]0x80,%l0	! %l0 = 00000000000000c6

p0_label_37:
	fbu,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000030800000] = c363e5bb, %l7 = 000000000f3244d6
	swap	[%o1+0x000],%l7		! %l7 = 00000000c363e5bb
p0_b42:
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010000068] = af4b8336, %l2 = ffffffffffbb575d
	ldsha	[%i0+0x06a]%asi,%l2	! %l2 = ffffffffffff8336
!	%f0  = 00000000 00000000, %f0  = 00000000
	fdtoi	%f0 ,%f0 		! %f0  = 00000000
!	%l2 = ffffffffffff8336
	setx	0xd24b33ddd24b33dd,%g7,%l2 ! %l2 = d24b33ddd24b33dd

p0_label_38:
!	%f12 = 00000000 00000000, %f8  = 3bdf2374 5d3b182e
	fxtod	%f12,%f8 		! %f8  = 00000000 00000000
!	Mem[0000000010000050] = 96d83e6c 8d13d7f8, %l2 = d24b33dd, %l3 = 00001063
	ldd	[%i0+0x050],%l2		! %l2 = 0000000096d83e6c 000000008d13d7f8
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000032000070] = 66e2e436, %l7 = 00000000c363e5bb
	ldsw	[%o4+0x070],%g2		! Annulled
p0_b43:
	membar	#Sync			! Added by membar checker (35)
!	Mem[000000003080004f] = 000000c2, %l3 = 000000008d13d7f8
	ldstub	[%o1+0x04f],%l3		! %l3 = 00000000000000c2

p0_label_39:
!	%l1 = 0000000000004605, Mem[000000003000004e] = 1dce8b1d
	stha	%l1,[%o0+0x04e]%asi	! Mem[000000003000004c] = 1dce4605
!	%l6 = 000000000000e394, %l1 = 0000000000004605, %l1 = 0000000000004605
	andn	%l6,%l1,%l1		! %l1 = 000000000000a190
!	%f31 = 00000000, %f3  = daf4e480, %f22 = 41d1d658
	fadds	%f31,%f3 ,%f22		! %f22 = daf4e480
!	Mem[00000000100000e0] = 3240adda 491015b6 2decf098 89e67855
	prefetch [%i0+0x0e0],23
!	%f23 = d2000000, %f9  = 00000000
	fmovs	%f23,%f9 		! %f9  = d2000000

p0_label_40:
!	%f23 = d2000000, %f2  = c0a5a79b
	fcmpes	%fcc1,%f23,%f2 		! %fcc1 = 1
!	%f6  = 197005cc a7181c95, %f10 = 5d3b182e d9e82ca8
	fcmped	%fcc0,%f6 ,%f10		! %fcc0 = 1
!	%l0 = 00000000000000c6, immed = 0000000e, %l3 = 00000000000000c2
	srax	%l0,0x00e,%l3		! %l3 = 0000000000000000
!	%l5 = 2ddab8472ddab847, immed = 00000c5a, %l6 = 000000000000e394
	andn	%l5,0xc5a,%l6		! %l6 = 2ddab8472ddab005
	bne	p0_b44			! Branch Taken, %ccr = 00, CWP = 0

p0_label_41:
!	Mem[0000000031000048] = ffffffb7 0221dd80, %l4 = 7fffffff, %l5 = 2ddab847
	ldd	[%o2+0x048],%l4		! %l4 = 00000000ffffffb7 000000000221dd80
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x02c,%g2
p0_b44:
	membar	#Sync			! Added by membar checker (36)
!	%l3 = 0000000000000000, immed = 00000b54, %l5 = 000000000221dd80
	xorcc	%l3,0xb54,%l5		! %l5 = 0000000000000b54, %ccr = 00
!	%l6 = 2ddab8472ddab005, %l6 = 2ddab8472ddab005, %l7 = 00000000c363e5bb
	and	%l6,%l6,%l7		! %l7 = 2ddab8472ddab005
!	%l5 = 0000000000000b54, %l6 = 2ddab8472ddab005, %l5 = 0000000000000b54
	xor	%l5,%l6,%l5		! %l5 = 2ddab8472ddabb51
!	%f1  = 00000000, %f1  = 00000000
	fcmpes	%fcc2,%f1 ,%f1 		! %fcc2 = 0

p0_label_42:
!	Mem[0000000010800008] = 015e7bad9ef32d10, %l3 = 0000000000000000
	ldxa	[%i1+%o6]0x80,%l3	! %l3 = 015e7bad9ef32d10
!	Mem[0000000030000040] = 161a1314 27efc08a, %l0 = 000000c6, %l1 = 0000a190
	ldd	[%o0+0x040],%l0		! %l0 = 00000000161a1314 0000000027efc08a
!	%l2 = 0000000096d83e6c, Mem[0000000011800008] = c6b90000
	stba	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = 6cb90000
!	Mem[0000000011800008] = 6cb90000, %l7 = 2ddab8472ddab005
	lduha	[%i3+%o6]0x80,%l7	! %l7 = 0000000000006cb9
!	%l5 = 2ddab8472ddabb51, immed = 00000017, %l1 = 0000000027efc08a
	sll	%l5,0x017,%l1		! %l1 = 2396ed5da8800000

p0_label_43:
!	Mem[00000000118000f4] = 814a299d, %l1 = 2396ed5da8800000
	ldsw	[%i3+0x0f4],%l1		! %l1 = ffffffff814a299d
!	Mem[0000000010000080] = 399290d1, %l2 = 0000000096d83e6c
	ldsh	[%i0+0x082],%l2		! %l2 = ffffffffffff90d1
!	%f4  = 00000000, %f21 = bfa7fb0b
	fnegs	%f4 ,%f21		! %f21 = 80000000
	bcc	p0_b45			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000010000020] = 6a945b6e d264d1c7 850c6a4a 390a0b72
	prefetch [%i0+0x020],20
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x02d,%g2
p0_b45:

p0_label_44:
	membar	#Sync			! Added by membar checker (37)
!	Denormal Floating Point Operation Nullified
	nop
!	%l3 = 015e7bad9ef32d10, %l1 = ffffffff814a299d, %y  = 00000d82
	udiv	%l3,%l1,%l4		! %l4 = 0000000000001ac0
!	Mem[0000000031000000] = c849a494, %l4 = 0000000000001ac0
	lduh	[%o2+0x000],%l4		! %l4 = 000000000000c849
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l6 = 2ddab8472ddab005, Mem[0000000011800000] = c225315138b97fa5
	stxa	%l6,[%i3+%g0]0x80	! Mem[0000000011800000] = 2ddab8472ddab005
p0_b46:

p0_label_45:
	membar	#Sync			! Added by membar checker (38)
!	%l4 = 0000c849, %l5 = 2ddabb51, Mem[0000000011000080] = 0f2289a6 336f74fc
	stda	%l4,[%i2+0x080]%asi	! Mem[0000000011000080] = 0000c849 2ddabb51
	bg	p0_b47			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000011000008] = f947aeb1, %l1 = ffffffff814a299d
	ldsba	[%i2+%o6]0x80,%l1	! %l1 = fffffffffffffff9
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x02f,%g2
p0_b47:
	membar	#Sync			! Added by membar checker (39)
!	%f13 = 00000000, %f28 = 5d2d33ed
	fitos	%f13,%f28		! %f28 = 00000000
!	Mem[0000000011800040] = 616faadb 4a07cc6d 98690296 a40aa2f9
	prefetch [%i3+0x040],3

p0_label_46:
!	%l6 = 2ddab8472ddab005, %l0 = 00000000161a1314, %l6 = 2ddab8472ddab005
	andcc	%l6,%l0,%l6		! %l6 = 00000000041a1004, %ccr = 00
	bpos,a	p0_b48			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000011800010] = 6d701cd2, %l3 = 015e7bad9ef32d10
	ldsb	[%i3+0x011],%l3		! %l3 = 0000000000000070
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x030,%g2
p0_b48:
	bneg	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031800004] = ed7ebd54, %l6 = 00000000041a1004
	ldsw	[%o3+0x004],%l6		! %l6 = ffffffffed7ebd54
p0_b49:

p0_label_47:
	bge	p0_b50			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000011000008] = f947aeb1 746df82e, %l0 = 161a1314, %l1 = fffffff9
	ldda	[%i2+%o6]0x80,%l0	! %l0 = 00000000f947aeb1 00000000746df82e
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x032,%g2
p0_b50:
	membar	#Sync			! Added by membar checker (40)
	set	p0_b51,%o7
	fbe,a,pt %fcc3,p0_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[00000000100000d0] = 4204f1a8 7ec0a8e4, %l2 = ffff90d1, %l3 = 00000070
	ldd	[%i0+0x0d0],%l2		! %l2 = 000000004204f1a8 000000007ec0a8e4
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x033,%g2
p0_b51:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000ffff
!	%l1  = ffffffff143913e5
!	%l3  = 000000000000e394
!	%l5  = ffffffffffffff66
!	%l6  = 00000000f9489245
!	%l7  = 000000007fffffff
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 02

p0_label_48:
!	Mem[0000000010000000] = ffa99d03, %l1 = ffffffff143913e5
	swapa	[%i0+%g0]0x80,%l1	! Annulled
p0_b52:
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000012800000] = a88a8474, %l2 = 000000004204f1a8
	ldsha	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffa88a
!	Mem[0000000010000000] = ffa99d03ddcaeec9, %l4 = 000000000000c849
	ldxa	[%i0+%g0]0x80,%l4	! %l4 = ffa99d03ddcaeec9
!	Mem[0000000030800004] = 1ed0e670, %l6 = 00000000f9489245
	ldsba	[%o1+0x007]%asi,%l6	! %l6 = 0000000000000070
!	Mem[0000000011000000] = 0000003a, %l5 = ffffffffffffff66
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_49:
!	Branch On Register, %l6 = 0000000000000070
	brgz,a,pt %l6,p0_b53		! Branch Taken
!	Mem[000000003000000c] = 00000000, %l4 = ffa99d03ddcaeec9
	lduh	[%o0+0x00e],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x035,%g2
p0_b53:
	membar	#Sync			! Added by membar checker (42)
!	%l4 = 0000000000000000, immed = 00000d25, %l3 = 000000000000e394
	orncc	%l4,0xd25,%l3		! %l3 = fffffffffffff2da, %ccr = 88
!	call to call_3, CWP = 0
	call	p0_call_3_he
!	%l0 = 0000ffff, %l1 = 143913e5, Mem[0000000010000000] = ffa99d03 ddcaeec9
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010000000] = 0000ffff 143913e5
!	Registers modified during the branch to p0_call_3
!	%l2  = 000000007fb1c6ed
!	%l4  = 0000000000064140
!	%l5  = ffffece7004e3912
!	%l7  = 0000000000000000

p0_label_50:
!	Mem[00000000118000a0] = 043f7e9e e389c3f2 fcea08dd 1a8b61e1
	prefetcha [%i3+0x0a0]%asi,20
!	Branch On Register, %l5 = ffffece7004e3912
	brnz,a,pt %l5,p0_b54		! Branch Taken
!	Mem[0000000012000008] = 448d5504, %l2 = 000000007fb1c6ed
	ldsba	[%i4+%o6]0x80,%l2	! %l2 = 0000000000000044
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x036,%g2
p0_b54:
	membar	#Sync			! Added by membar checker (43)
!	%l2 = 0000000000000044, Mem[0000000011800000] = 2ddab847
	stha	%l2,[%i3+%g0]0x80	! Mem[0000000011800000] = 0044b847
	set	p0_b55,%o7
	fbule,a,pn %fcc0,p0_near_1_he	! Branch Taken, %fcc0 = 1

p0_label_51:
!	%l2 = 0000000000000044, Mem[0000000031800007] = ed7ebd54
	stb	%l2,[%o3+0x007]		! Mem[0000000031800004] = ed7ebd44
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x037,%g2
p0_b55:
!	Registers modified during the branch to p0_near_1
!	%l1  = ffffffff143913e5
!	%l3  = 0000000000000000
!	%l4  = 0000000000009610
!	%l5  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (44)
!	Mem[000000003080004c] = 000000ff, %l2 = 0000000000000044
	swap	[%o1+0x04c],%l2		! %l2 = 00000000000000ff
!	Mem[00000000108000e0] = b58856de, %l7 = 0000000000000000
	ldswa	[%i1+0x0e0]%asi,%l7	! %l7 = ffffffffb58856de
	fbug,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010000000] = 0000ffff, %l0 = 000000000000ffff
	lduwa	[%i0+%g0]0x80,%l0	! Annulled
p0_b56:

p0_label_52:
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l6 = 00000070, %l7 = b58856de, Mem[0000000011000010] = 9573563e b388a3a2
	std	%l6,[%i2+0x010]	! Annulled
p0_b57:
	membar	#Sync			! Added by membar checker (45)
!	%f27 = 00000000, %f13 = 00000000
	fitos	%f27,%f13		! %f13 = 00000000
!	%l1 = ffffffff143913e5, %l7 = ffffffffb58856de, %y  = 00000000
	sdivcc	%l1,%l7,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l4 = 0000000000009610, %l5 = 0000000000000000, %l3 = 0000000000000000
	sllx	%l4,%l5,%l3		! %l3 = 0000000000009610

p0_label_53:
!	Mem[0000000032000020] = 881b2ad7 861878d1 a417c71d 4b729f64
	prefetcha [%o4+0x020]%asi,23
	bne	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l1 = ffffffff143913e5, Mem[00000000108000d8] = dc57da9e
	sth	%l1,[%i1+0x0d8]		! Mem[00000000108000d8] = 13e5da9e
p0_b58:
	membar	#Sync			! Added by membar checker (46)
!	%f12 = 00000000 00000000, %f31 = 00000000
	fdtos	%f12,%f31		! %f31 = 00000000
!	%l6 = 0000000000000070, %l0 = 000000000000ffff, %y  = 00000000
	smulcc	%l6,%l0,%l0		! %l0 = 00000000006fff90, %ccr = 00

p0_label_54:
!	Mem[0000000011800070] = d122af53, %l3 = 0000000000009610
	lduwa	[%i3+0x070]%asi,%l3	! %l3 = 00000000d122af53
	bne,a	p0_b59			! Branch Taken, %ccr = 00, CWP = 0
!	%l7 = ffffffffb58856de, Mem[000000001000001c] = f227e2a4
	stw	%l7,[%i0+0x01c]		! Mem[000000001000001c] = b58856de
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x03b,%g2
p0_b59:
	membar	#Sync			! Added by membar checker (47)
!	%f26 = 7fb3683c 00000000, %f20 = 446fe5ef 80000000
	fcmpd	%fcc0,%f26,%f20		! %fcc0 = 2
!	%f11 = d9e82ca8, %f21 = 80000000
	fcmpes	%fcc1,%f11,%f21		! %fcc1 = 1

p0_label_55:
!	Mem[0000000010800048] = 4c23f65d, %l6 = 0000000000000070
	swapa	[%i1+0x048]%asi,%l6	! %l6 = 000000004c23f65d
	set	p0_b60,%o7
	fbug	p0_far_1_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000011000030] = 622c64ef 14e31da6, %l0 = 006fff90, %l1 = 143913e5
	ldd	[%i2+0x030],%l0		! %l0 = 00000000622c64ef 0000000014e31da6
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x03c,%g2
p0_b60:
!	Registers modified during the branch to p0_far_1
!	%l2  = 000000000000002f
!	%l3  = 00000000aff27420
!	%l4  = 000000009558542f
	bgu,a	p0_b61			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000011800000] = 0044b847, %l7 = ffffffffb58856de
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x03d,%g2
p0_b61:

p0_label_56:
	bne	p0_b62			! Branch Taken, %ccr = 00, CWP = 0
!	%l2 = 000000000000002f, Mem[0000000011800008] = 6cb90000
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = 002f0000
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x03e,%g2
p0_b62:
	membar	#Sync			! Added by membar checker (48)
!	%l6 = 000000004c23f65d, Mem[0000000010800000] = ffbb575df6ab580f
	stxa	%l6,[%i1+%g0]0x80	! Mem[0000000010800000] = 000000004c23f65d
	fbu	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000010800000] = 00000000 4c23f65d 015e7bad 9ef32d10
	prefetch [%i1+0x000],22
p0_b63:

p0_label_57:
	membar	#Sync			! Added by membar checker (49)
	set	p0_b64,%o7
	fbul,pt	%fcc1,p0_near_0_le	! Branch Taken, %fcc1 = 1
!	%l0 = 00000000622c64ef, Mem[0000000011800000] = ff44b847
	stba	%l0,[%i3+%g0]0x80	! Mem[0000000011800000] = ef44b847
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x040,%g2
p0_b64:
!	Registers modified during the branch to p0_near_0
!	%l0  = ffffffff64f09fb8
!	%l7  = ffffffff6aa7abff
	membar	#Sync			! Added by membar checker (50)
!	%l7 = ffffffff6aa7abff, immed = 0000094c, %l0 = ffffffff64f09fb8
	subccc	%l7,0x94c,%l0		! %l0 = ffffffff6aa7a2b2, %ccr = 80
	set	p0_b65,%o7
	fbg,a	p0_far_3_le	! Branch Taken, %fcc0 = 2
!	%l5 = 0000000000000000, Mem[0000000010000008] = b7080c37
	stba	%l5,[%i0+%o6]0x80	! Mem[0000000010000008] = 00080c37
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x041,%g2
p0_b65:
!	Registers modified during the branch to p0_far_3
!	%l0  = fffffffed54f4eb1
!	%l2  = 0000000000000000
!	%l4  = 00000000aff26b45
!	%l5  = ffffffffffffffe8

p0_label_58:
	bgu	p0_b66			! Branch Taken, %ccr = 88, CWP = 0
!	%l0 = fffffffed54f4eb1, Mem[0000000011800030] = 6658397f
	stw	%l0,[%i3+0x030]		! Mem[0000000011800030] = d54f4eb1
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x042,%g2
p0_b66:
	membar	#Sync			! Added by membar checker (51)
!	%l5 = ffffffffffffffe8, %l5 = ffffffffffffffe8, %l4 = 00000000aff26b45
	orncc	%l5,%l5,%l4		! %l4 = ffffffffffffffff, %ccr = 88
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000010000000] = 0000ffff, %l3 = 00000000aff27420
	lduwa	[%i0+%g0]0x80,%l3	! Annulled
p0_b67:

p0_label_59:
	membar	#Sync			! Added by membar checker (52)
	set	p0_b68,%o7
	fble,a,pn %fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000031800040] = 2638e089, %l1 = 0000000014e31da6
	ldsb	[%o3+0x042],%l1		! %l1 = ffffffffffffffe0
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x044,%g2
p0_b68:
!	Registers modified during the branch to p0_near_3
!	%l3  = ffffffffffffffb7
!	%l4  = ffffffffffffe833
!	%l5  = ffffffffffffffe0
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000010000008] = 00080c37, %l4 = ffffffffffffe833
	lduha	[%i0+%o6]0x80,%l4	! %l4 = 0000000000000008
!	Registers modified during the branch to p0_jmpl_2
!	%l2  = 0000000000000000
!	%l3  = ffffffffffe28bae
	set	p0_b69,%o7
	fbg	p0_far_3_he	! Branch Taken, %fcc0 = 2

p0_label_60:
!	%l5 = ffffffffffffffe0, Mem[0000000010000008] = 00080c37
	stha	%l5,[%i0+%o6]0x80	! Mem[0000000010000008] = ffe00c37
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x045,%g2
p0_b69:
!	Registers modified during the branch to p0_far_3
!	%l2  = 0000000000000003
!	%l4  = 000000012ab0b1be
!	%l5  = 00000000000002bc
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (53)
!	%l3 = ffffffffffe28bae, Mem[0000000011800008] = 002f000000000000
	stxa	%l3,[%i3+%o6]0x80	! Mem[0000000011800008] = ffffffffffe28bae
!	%l6 = 0000000000000000, %l2 = 0000000000000003, %l3 = ffffffffffe28bae
	addccc	%l6,%l2,%l3		! %l3 = 0000000000000003, %ccr = 00
!	%l7 = ffffffff6aa7abff, immed = 000008da, %l0 = fffffffed54f4eb1
	subc	%l7,0x8da,%l0		! %l0 = ffffffff6aa7a325
!	%l3 = 0000000000000003, %l3 = 0000000000000003, %y  = 00000000
	mulx	%l3,%l3,%l6		! %l6 = 0000000000000009

p0_label_61:
!	%l4 = 000000012ab0b1be, Mem[0000000011800000] = ef44b847
	stba	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = be44b847
!	Mem[0000000030000000] = 194cca03, %l3 = 0000000000000003
	lduwa	[%o0+0x000]%asi,%l3	! %l3 = 00000000194cca03
	set	p0_b70,%o7
	fbo	p0_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031000008] = ffffffb7, %l5 = 00000000000002bc
	ldsw	[%o2+0x008],%l5		! %l5 = ffffffffffffffb7
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x046,%g2
p0_b70:
!	Registers modified during the branch to p0_far_0
!	%l1  = 00000000194cc035
!	%l7  = 2638e089443bb01d
	membar	#Sync			! Added by membar checker (54)
	fbu,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2

p0_label_62:
!	Mem[0000000010800008] = 015e7bad9ef32d10, %l5 = ffffffffffffffb7
	ldxa	[%i1+%o6]0x80,%l5	! %l5 = 015e7bad9ef32d10
p0_b71:
	membar	#Sync			! Added by membar checker (55)
!	%l1 = 00000000194cc035, %l0 = ffffffff6aa7a325, %l2 = 0000000000000003
	tsubcc	%l1,%l0,%l2		! %l2 = 00000000aea51d10, %ccr = 1b
!	%l1 = 00000000194cc035, %l0 = ffffffff6aa7a325, %l0 = ffffffff6aa7a325
	addc	%l1,%l0,%l0		! %l0 = ffffffff83f4635b
!	Mem[00000000118000f0] = af85a093 814a299d, %l0 = 83f4635b, %l1 = 194cc035
	ldd	[%i3+0x0f0],%l0		! %l0 = 00000000af85a093 00000000814a299d
!	%l1 = 00000000814a299d, %l7 = 2638e089443bb01d, %l4 = 000000012ab0b1be
	andn	%l1,%l7,%l4		! %l4 = 0000000081400980

p0_label_63:
!	%l5 = 015e7bad9ef32d10, Mem[000000003200007d] = 093a5d00
	stb	%l5,[%o4+0x07d]		! Mem[000000003200007c] = 103a5d00
	bg	p0_b72			! Branch Taken, %ccr = 1b, CWP = 0
!	Mem[0000000011800008] = ffffffff, %l0 = 00000000af85a093
	ldsha	[%i3+%o6]0x80,%l0	! %l0 = ffffffffffffffff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x048,%g2
p0_b72:
	bvc,a	p0_not_taken_0		! Branch Not Taken, %ccr = 1b
!	Mem[0000000010800080] = 87557d52 ed53e833 33658700 ec0215ba
	prefetch [%i1+0x080],4	! Annulled
p0_b73:

p0_label_64:
	membar	#Sync			! Added by membar checker (56)
!	Mem[000000003100000c] = ffffe394, %l0 = ffffffffffffffff
	lduh	[%o2+0x00e],%l0		! %l0 = 000000000000e394
!	%l6 = 0000000000000009, %l3 = 00000000194cca03, %l5 = 015e7bad9ef32d10
	sll	%l6,%l3,%l5		! %l5 = 0000000000000048
!	Mem[0000000010000020] = 6a945b6e d264d1c7 850c6a4a 390a0b72
	prefetch [%i0+0x020],4
!	%l1 = 00000000814a299d, %l1 = 00000000814a299d, %l0 = 000000000000e394
	addc	%l1,%l1,%l0		! %l0 = 000000010294533b
!	%l4 = 0000000081400980, Mem[0000000030000000] = 194cca03b737d7ae
	stx	%l4,[%o0+0x000]		! Mem[0000000030000000] = 0000000081400980

p0_label_65:
!	%f6  = 197005cc a7181c95, %f28 = 00000000 f64757a2
	fnegd	%f6 ,%f28		! %f28 = 997005cc a7181c95
	set	p0_b74,%o7
	fbe,pt	%fcc3,p0_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000010000000] = 0000ffff143913e5, %l6 = 0000000000000009
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 0000ffff143913e5
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x04a,%g2
p0_b74:
!	Registers modified during the branch to p0_near_0
!	%l0  = 0000000067fd55cb
!	%l7  = ffffffffd01aeb6f
	membar	#Sync			! Added by membar checker (57)
!	%f29 = a7181c95, %f28 = 997005cc a7181c95
	fstod	%f29,%f28		! %f28 = bce30392 a0000000
!	Mem[0000000011800008] = ffffffff, %l7 = ffffffffd01aeb6f
	lduha	[%i3+%o6]0x80,%l7	! %l7 = 000000000000ffff

p0_label_66:
	set	p0_b75,%o7
	fble,a,pt %fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 0
!	%l3 = 00000000194cca03, Mem[0000000030800044] = c8fd3b55
	stw	%l3,[%o1+0x044]		! Mem[0000000030800044] = 194cca03
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x04b,%g2
p0_b75:
!	Registers modified during the branch to p0_near_3
!	%l3  = ffffffffffffffb7
!	%l4  = ffffffffffffe833
!	%l5  = 0000000000000008
	membar	#Sync			! Added by membar checker (58)
	set	p0_b76,%o7
	fbo,a,pn %fcc3,p0_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000010800008] = 015e7bad, %l6 = 0000ffff143913e5
	lduwa	[%i1+%o6]0x80,%l6	! %l6 = 00000000015e7bad
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x04c,%g2
p0_b76:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000ffff
!	%l1  = 0000000066a32e66
!	%l3  = 000000000000e394
!	%l5  = ffffffffffffff66
!	%l6  = 0000000067fe395f
!	%l7  = 000000000079900a
	fbule	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2

p0_label_67:
!	%l3 = 000000000000e394, Mem[0000000010800000] = 000000004c23f65d
	stxa	%l3,[%i1+%g0]0x80	! Mem[0000000010800000] = 000000000000e394
p0_b77:
	set	p0_b78,%o7
	fbge,a	p0_far_1_le	! Branch Taken, %fcc0 = 2
!	%l4 = ffffffffffffe833, Mem[0000000011800000] = be44b847
	stwa	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = ffffe833
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x04e,%g2
p0_b78:
!	Registers modified during the branch to p0_far_1
!	%l2  = 000066a2c7c2d19a
!	%l5  = 000000000000ff00
!	%l7  = 000066a2c7c2b9cd
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000011800008] = ffffffff, %l3 = 000000000000e394
	ldsba	[%i3+%o6]0x80,%l3	! %l3 = ffffffffffffffff
!	%f20 = 446fe5ef 80000000, %f2  = c0a5a79b daf4e480
	fcmped	%fcc0,%f20,%f2 		! %fcc0 = 2

p0_label_68:
!	%f7  = a7181c95, %f30 = 00000000, %f16 = 3c5dc8a9 889d016e
	fsmuld	%f7 ,%f30,%f16		! %f16 = 80000000 00000000
!	Mem[0000000010800008] = 015e7bad, %l4 = ffffffffffffe833
	ldsba	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000001
!	Mem[00000000108000e0] = b58856de 3717c06c cecdffe0 36871a04
	prefetch [%i1+0x0e0],16
!	Mem[0000000011800008] = ffffffff, %l7 = 000066a2c7c2b9cd
	lduha	[%i3+%o6]0x80,%l7	! %l7 = 000000000000ffff
!	%l5 = 000000000000ff00, immed = 0000003e, %l3 = ffffffffffffffff
	sllx	%l5,0x03e,%l3		! %l3 = 0000000000000000

p0_label_69:
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 19
!	%l4 = 00000001, %l5 = 0000ff00, Mem[0000000010000000] = 0000ffff 143913e5
	stda	%l4,[%i0+%g0]0x80	! Annulled
p0_b79:
	membar	#Sync			! Added by membar checker (60)
!	Branch On Register, %l2 = 000066a2c7c2d19a
	brgz,a,pt %l2,p0_b80		! Branch Taken
!	Mem[0000000011000008] = f947aeb1, %l4 = 0000000000000001
	lduwa	[%i2+%o6]0x80,%l4	! %l4 = 00000000f947aeb1
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x050,%g2
p0_b80:
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2

p0_label_70:
!	Mem[0000000012800000] = a88a8474, %l6 = 0000000067fe395f
	lduha	[%i5+%g0]0x80,%l6	! Annulled
p0_b81:
	membar	#Sync			! Added by membar checker (61)
!	%f17 = 00000000, %f4  = 00000000, %f0  = 00000000 00000000
	fsmuld	%f17,%f4 ,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],2
!	%l6 = 67fe395f, %l7 = 0000ffff, Mem[00000000108000b0] = 20d388cd e79f975d
	std	%l6,[%i1+0x0b0]	! Mem[00000000108000b0] = 67fe395f 0000ffff
!	Mem[0000000030000000] = 00000000, %l3 = 0000000000000000
	ldsh	[%o0+0x002],%l3		! %l3 = 0000000000000000

p0_label_71:
	bcc	p0_not_taken_0		! Branch Not Taken, %ccr = 19
!	Mem[00000000100000c0] = f0b2218d 2012a15a ffffffff ffffffeb
	prefetch [%i0+0x0c0],3
p0_b82:
	membar	#Sync			! Added by membar checker (62)
!	%l7 = 000000000000ffff, Mem[0000000032000048] = b4eadc8a53902166
	stx	%l7,[%o4+0x048]		! Mem[0000000032000048] = 000000000000ffff
!	%l6 = 0000000067fe395f, Mem[0000000011000008] = f947aeb1
	stba	%l6,[%i2+%o6]0x80	! Mem[0000000011000008] = 5f47aeb1
!	%l6 = 0000000067fe395f, immed = fffff232, %y  = 000066a2
	umulcc	%l6,-0xdce,%l4		! %l4 = 67fe33c36884028e, %ccr = 00

p0_label_72:
	bvc,a	p0_b83			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000100000c0] = f0b2218d 2012a15a ffffffff ffffffeb
	prefetch [%i0+0x0c0],3
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x053,%g2
p0_b83:
	membar	#Sync			! Added by membar checker (63)
!	%l1 = 0000000066a32e66, %l2 = 000066a2c7c2d19a, %l1 = 0000000066a32e66
	orn	%l1,%l2,%l1		! %l1 = ffff995d7ebf2e67
!	%l0 = 000000000000ffff, Mem[0000000011000008] = 5f47aeb1
	stha	%l0,[%i2+%o6]0x80	! Mem[0000000011000008] = ffffaeb1
!	Mem[00000000118000eb] = f11615f9, %l5 = 000000000000ff00
	ldstub	[%i3+0x0eb],%l5		! %l5 = 00000000000000f9

p0_label_73:
!	Mem[0000000011800080] = 454734c9 42e045b5 1d39467c 93ed2588
	prefetch [%i3+0x080],22
!	%l5 = 00000000000000f9, Mem[0000000010800008] = 015e7bad
	stba	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = f95e7bad
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000031000048] = ffffffb7, %l0 = 000000000000ffff
	lduw	[%o2+0x048],%l0		! %l0 = 00000000ffffffb7
!	Registers modified during the branch to p0_jmpl_2
!	%l2  = 04cc6c46e3bcab30
!	%l3  = ffffffff80000000
!	%l1 = ffff995d7ebf2e67, Mem[0000000010000008] = ffe00c37
	stwa	%l1,[%i0+%o6]0x80	! Mem[0000000010000008] = 7ebf2e67

p0_label_74:
!	Mem[0000000012000098] = d471218c, %l7 = 000000000000ffff
	ldsw	[%i4+0x098],%l7		! %l7 = ffffffffd471218c
!	%l0 = 00000000ffffffb7, immed = 00000ab3, %l4 = 67fe33c36884028e
	orn	%l0,0xab3,%l4		! %l4 = ffffffffffffffff
	set	p0_b84,%o7
	fba,pt	%fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000010800050] = 1ff0c9f2, %l1 = ffff995d7ebf2e67
	lduh	[%i1+0x050],%l1		! %l1 = 0000000000001ff0
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x054,%g2
p0_b84:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000ffff
!	%l1  = 000000009801c6e8
!	%l3  = 000000000000e394
!	%l5  = ffffffffffffff66
!	%l6  = 000000010000e34b
!	%l7  = 000000007fffffff
	membar	#Sync			! Added by membar checker (64)
!	%f31 = 00000000, %f28 = bce30392
	fnegs	%f31,%f28		! %f28 = 80000000

p0_label_75:
!	Mem[0000000011000008] = ffffaeb1, %l4 = ffffffffffffffff
	lduba	[%i2+%o6]0x80,%l4	! %l4 = 00000000000000ff
	bpos	p0_b85			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[0000000013000008] = 0e143d25, %l5 = ffffffffffffff66
	lduba	[%i6+%o6]0x80,%l5	! %l5 = 000000000000000e
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x055,%g2
p0_b85:
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000031000008] = ffffffb7ffffe394, %l5 = 000000000000000e
	ldxa	[%o2+0x008]%asi,%l5	! %l5 = ffffffb7ffffe394
!	%l2 = 04cc6c46e3bcab30, Mem[0000000010800008] = f95e7bad
	stwa	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = e3bcab30

p0_label_76:
!	Mem[0000000011000014] = b388a3a2, %l4 = 00000000000000ff
	swap	[%i2+0x014],%l4		! %l4 = 00000000b388a3a2
	set	p0_b86,%o7
	fbge	p0_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000010000000] = 0000ffff, %l2 = 04cc6c46e3bcab30
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 000000000000ffff
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x056,%g2
p0_b86:
!	Registers modified during the branch to p0_far_3
!	%l0  = 000000008000fffe
!	%l2  = ffffffffffffffff
!	%l4  = 000000000000dab9
!	%l5  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (66)
	set	p0_b87,%o7
	fblg,a,pt %fcc0,p0_near_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000040] = c78fef2b 03faa03f 00000000 0000ffff
	prefetch [%o4+0x040],21
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x057,%g2
p0_b87:
!	Registers modified during the branch to p0_near_1
!	%l1  = 0000000000000000

p0_label_77:
	membar	#Sync			! Added by membar checker (67)
!	%f11 = d9e82ca8, %f12 = 00000000 00000000
	fitod	%f11,%f12		! %f12 = c1c30be9 ac000000
!	%l2 = ffffffff, %l3 = 0000e394, Mem[00000000108000c8] = 8b6c40a4 e3eca4a6
	std	%l2,[%i1+0x0c8]	! Mem[00000000108000c8] = ffffffff 0000e394
!	%l2 = ffffffffffffffff, %l7 = 000000007fffffff, %l7 = 000000007fffffff
	sll	%l2,%l7,%l7		! %l7 = ffffffff80000000
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	 Annulled
	ldda	[%i2+%o6]0x80,%l6
p0_b88:

p0_label_78:
	membar	#Sync			! Added by membar checker (68)
	fbu,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l0 = 8000fffe, %l1 = 00000000, Mem[0000000010800000] = 00000000 0000e394
	stda	%l0,[%i1+%g0]0x80	! Annulled
p0_b89:
	membar	#Sync			! Added by membar checker (69)
!	Mem[000000003000004e] = 1dce4605, %l0 = 000000008000fffe
	ldstuba	[%o0+0x04e]%asi,%l0	! %l0 = 0000000000000046
!	%f5  = 4cd89658, %f28 = 80000000 a0000000
	fstox	%f5 ,%f28		! %f28 = 00000000 06c4b2c0
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88

p0_label_79:
!	%l5 = ffffffffffffffff, Mem[0000000011000008] = ffffaeb1746df82e
	stxa	%l5,[%i2+%o6]0x80	! Annulled
p0_b90:
	membar	#Sync			! Added by membar checker (70)
!	%l0 = 0000000000000046, %l1 = 0000000000000000, %l2 = ffffffffffffffff
	sll	%l0,%l1,%l2		! %l2 = 0000000000000046
	bgu,a	p0_b91			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010800098] = c71d6ebd, %l2 = 0000000000000046
	ldsw	[%i1+0x098],%l2		! %l2 = ffffffffc71d6ebd
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x05b,%g2
p0_b91:
	membar	#Sync			! Added by membar checker (71)
!	%l2 = ffffffffc71d6ebd, immed = 00000083, %y  = 67fe33c3
	udivcc	%l2,0x083,%l5		! %l5 = 00000000ffffffff, %ccr = 0a

p0_label_80:
	set	p0_b92,%o7
	fbo,pt	%fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000012800040] = 96c9a503 a4e0a320, %l6 = 0000e34b, %l7 = 80000000
	ldd	[%i5+0x040],%l6		! %l6 = 0000000096c9a503 00000000a4e0a320
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x05c,%g2
p0_b92:
!	Registers modified during the branch to p0_near_0
!	%l0  = ffffffffffff129e
!	%l7  = 0000000038e24bfb
	membar	#Sync			! Added by membar checker (72)
!	%l1 = 0000000000000000
	sethi	%hi(0x708f5800),%l1	! %l1 = 00000000708f5800
!	%l4 = 000000000000dab9, %l1 = 00000000708f5800, %l7 = 0000000038e24bfb
	addc	%l4,%l1,%l7		! %l7 = 00000000709032ba
!	Mem[000000003080004c] = 00000044, %l5 = 00000000ffffffff
	ldsh	[%o1+0x04c],%l5		! %l5 = 0000000000000000

p0_label_81:
!	%l0 = ffffffffffff129e, %l1 = 00000000708f5800, %y  = 67fe33c3
	sdiv	%l0,%l1,%l1		! %l1 = 000000007fffffff
!	%f1  = 00000000, %f22 = daf4e480, %f3  = daf4e480
	fdivs	%f1 ,%f22,%f3 		! %f3  = 80000000
!	%f4  = 00000000 4cd89658, %f18 = f2875363 c8c8d9e4
	fmovd	%f4 ,%f18		! %f18 = 00000000 4cd89658
	fbul	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000011800000] = ffffe833 2ddab005, %l6 = 96c9a503, %l7 = 709032ba
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000ffffe833 000000002ddab005
p0_b93:

p0_label_82:
	membar	#Sync			! Added by membar checker (73)
!	%l6 = 00000000ffffe833, %l2 = ffffffffc71d6ebd, %y  = 67fe33c3
	smulcc	%l6,%l2,%l2		! %l2 = 00000549e87b57a7, %ccr = 08
	fbug,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l3 = 000000000000e394, Mem[0000000030000040] = 161a131427efc08a
	stx	%l3,[%o0+0x040]		! Annulled
p0_b94:
	fbul	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000010800000] = 00000000, %l1 = 000000007fffffff
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
p0_b95:

p0_label_83:
	membar	#Sync			! Added by membar checker (74)
	nop
!	%l5 = 0000000000000000, %l7 = 000000002ddab005, %l0 = ffffffffffff129e
	orn	%l5,%l7,%l0		! %l0 = ffffffffd2254ffa
!	Mem[0000000010000098] = 8bcbd8a0 c7894338, %l4 = 0000dab9, %l5 = 00000000
	ldd	[%i0+0x098],%l4		! %l4 = 000000008bcbd8a0 00000000c7894338
!	Mem[0000000031800040] = 8bcbd8a0 c7894338, %l1 = 0000000000000000, %l4 = 000000008bcbd8a0
	add	%o3,0x40,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = 2638e089443bb01d
!	%l1 = 0000000000000000, immed = fffff654, %y  = 00000549
	umul	%l1,-0x9ac,%l4		! %l4 = 0000000000000000

p0_label_84:
	set	p0_b96,%o7
	fbug,a	p0_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000010800000] = ff000000, %l0 = ffffffffd2254ffa
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffff00
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x060,%g2
p0_b96:
!	Registers modified during the branch to p0_far_0
!	%l0  = 00000549e87b57a7
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010000000] = 0000ffff, %l3 = 000000000000e394
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 000000000000ffff
!	%l0 = 00000549e87b57a7, Mem[0000000031000008] = ffffffb7
	stw	%l0,[%o2+0x008]		! Mem[0000000031000008] = e87b57a7
!	%l4 = 0000000000000000, %l0 = 00000549e87b57a7, %y  = 00000000
	sdivx	%l4,%l0,%l2		! %l2 = 0000000000000000

p0_label_85:
	set	p0_b97,%o7
	fbne	p0_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000010000040] = d75a1ffe aa1557f6 6399850b acea7c83
	prefetch [%i0+0x040],3
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x061,%g2
p0_b97:
!	Registers modified during the branch to p0_far_0
!	%l0  = 0000000000000000
	membar	#Sync			! Added by membar checker (76)
	set	p0_b98,%o7
	fbe,a,pt %fcc3,p0_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[00000000110000e0] = 242bc1b5 c6ce0a87 ffdbfe25 8ef0da4b
	prefetch [%i2+0x0e0],21
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x062,%g2
p0_b98:
!	Registers modified during the branch to p0_near_0
!	%l0  = fffffffffffef633
!	%l7  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000010000000] = 0000e394, %l3 = 000000000000ffff
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000

p0_label_86:
!	%f31 = 00000000, %f4  = 00000000
	fabss	%f31,%f4 		! %f4  = 00000000
!	Mem[0000000032000060] = 0818b15de53da238, %l5 = 00000000c7894338
	ldxa	[%o4+0x060]%asi,%g2	! %g2 = 0818b15de53da238
!	%l3 = 0000000000000000, immed = 00000018, %l1 = 0000000000000000
	srlx	%l3,0x018,%l1		! %l1 = 0000000000000000
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i3+%o6]0x80,%l4
p0_b99:

p0_label_87:
	bgu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[0000000010800042] = fc03a46e, %l2 = 0000000000000000
	ldstub	[%i1+0x042],%l2		! Annulled
p0_b100:
	membar	#Sync			! Added by membar checker (78)
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010800008] = e3bcab30 9ef32d10
	stda	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = 00000000 00000000
!	Mem[000000003000000c] = 00000000, %l5 = 00000000c7894338
	lduha	[%o0+0x00e]%asi,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, %l7 = ffffffffffffffff, %l1 = 0000000000000000
	srlx	%l4,%l7,%l1		! %l1 = 0000000000000000

p0_label_88:
!	%f0  = 00000000, %f18 = 00000000
	fcmps	%fcc1,%f0 ,%f18		! %fcc1 = 0
	nop				! Delay added due to fcmp
	fbn,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000010800000] = ff000000, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l4	! Annulled
p0_b101:
	membar	#Sync			! Added by membar checker (79)
!	%f1  = 00000000, %f13 = ac000000, %f5  = 4cd89658
	fdivs	%f1 ,%f13,%f5 		! %f5  = 80000000
!	Mem[0000000011000008] = ffffaeb1, %l7 = ffffffffffffffff
	ldsha	[%i2+%o6]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_89:
	set	p0_b102,%o7
	fbe,pn	%fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000010800000] = ff000000, %l0 = fffffffffffef633
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x066,%g2
p0_b102:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000ffff
!	%l1  = 00000000ffffe8cc
!	%l3  = 000000000000e394
!	%l5  = ffffffffffffff66
!	%l6  = 000000000000e493
!	%l7  = 000000000000010b
	membar	#Sync			! Added by membar checker (80)
!	%f24 = 00000000, %f15 = 3bdf2374, %f20 = 446fe5ef
	fdivs	%f24,%f15,%f20		! %f20 = 00000000
!	Mem[0000000010800040] = fc03a46e 90316c6d 00000070 f48baf51
	prefetch [%i1+0x040],4
!	Mem[0000000030000000] = 00000000, %l1 = 00000000ffffe8cc
	swap	[%o0+0x000],%l1		! %l1 = 0000000000000000

p0_label_90:
!	Mem[00000000100000c0] = f0b2218d 2012a15a ffffffff ffffffeb
	prefetcha [%i0+0x0c0]%asi,16
	fblg,a,pn %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000011000008] = ffffaeb1, %l4 = 0000000000000000
	lduha	[%i2+%o6]0x80,%l4	! Annulled
p0_b103:
	membar	#Sync			! Added by membar checker (81)
!	%l4 = 0000000000000000, immed = fffff52f, %y  = 00000000
	sdivx	%l4,-0xad1,%l3		! %l3 = 0000000000000000
!	Mem[0000000031800049] = 00c24a3a, %l1 = 0000000000000000
	ldstuba	[%o3+0x049]%asi,%l1	! %l1 = 00000000000000c2

p0_label_91:
!	%l6 = 000000000000e493, immed = 00000a76, %y  = 00000000
	smulcc	%l6,0xa76,%l5		! %l5 = 00000000095719c2, %ccr = 00
!	%l7 = 000000000000010b, Mem[0000000010800008] = 00000000
	stwa	%l7,[%i1+%o6]0x80	! Mem[0000000010800008] = 0000010b
!	Mem[0000000030800040] = 435df72f, %l3 = 0000000000000000
	lduw	[%o1+0x040],%l3		! %l3 = 00000000435df72f
!	%l7 = 000000000000010b, %l1 = 00000000000000c2, %l4 = 0000000000000000
	orcc	%l7,%l1,%l4		! %l4 = 00000000000001cb, %ccr = 00
!	%l6 = 000000000000e493, %l0 = 000000000000ffff, %l0 = 000000000000ffff
	addc	%l6,%l0,%l0		! %l0 = 000000000001e492

p0_label_92:
!	Mem[0000000011000000] = ff00003a, %l3 = 00000000435df72f
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff00003a
!	%f16 = 80000000 00000000, %f16 = 80000000
	fdtoi	%f16,%f16		! %f16 = 00000000
	set	p0_b104,%o7
	fbuge,pt %fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 0
!	Mem[00000000110000e0] = 242bc1b5 c6ce0a87 ffdbfe25 8ef0da4b
	prefetch [%i2+0x0e0],0
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x068,%g2
p0_b104:
!	Registers modified during the branch to p0_near_1
!	%l1  = 00000000000000c2
!	%l3  = 000000000000004c
!	%l4  = 00000000013240f5
!	%l5  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (82)
!	%l7 = 000000000000010b, %l0 = 000000000001e492, %l0 = 000000000001e492
	addc	%l7,%l0,%l0		! %l0 = 000000000001e59d

p0_label_93:
!	Mem[0000000010000000] = 0000e394 143913e5 7ebf2e67 f3e9dcb2
	prefetch [%i0+0x000],23
	set	p0_b105,%o7
	fble,a,pt %fcc3,p0_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],3
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x069,%g2
p0_b105:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000ffff
!	%l1  = 000000000001010e
!	%l3  = 000000000000e394
!	%l5  = ffffffffffffff66
!	%l6  = 000000000002c931
!	%l7  = 0000000000000341
	membar	#Sync			! Added by membar checker (83)
!	%f24 = 00000000 00000000, %f14 = be372278 3bdf2374
	fabsd	%f24,%f14		! %f14 = 00000000 00000000
!	Mem[0000000010000000] = 0000e394, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_94:
	ble,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011000000] = 435df72f, %l5 = ffffffffffffff66
	ldswa	[%i2+%g0]0x80,%l5	! Annulled
p0_b106:
	membar	#Sync			! Added by membar checker (84)
!	Mem[0000000010800008] = 0000010b, %l6 = 000000000002c931
	lduba	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000000
!	%l1 = 000000000001010e, immed = 0000000a, %l3 = 000000000000e394
	srax	%l1,0x00a,%l3		! %l3 = 0000000000000040
!	%l0 = 000000000000ffff, immed = 0000033b, %l5 = ffffffffffffff66
	taddcc	%l0,0x33b,%l5		! %l5 = 000000000001033a, %ccr = 02

p0_label_95:
!	%l4 = 00000000013240f5, Mem[00000000108000e8] = cecdffe036871a04
	stxa	%l4,[%i1+0x0e8]%asi	! Mem[00000000108000e8] = 00000000013240f5
	bne	p0_b107			! Branch Taken, %ccr = 02, CWP = 0
!	%l1 = 000000000001010e, Mem[0000000011000034] = 14e31da6
	sth	%l1,[%i2+0x034]		! Mem[0000000011000034] = 010e1da6
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x06b,%g2
p0_b107:
	membar	#Sync			! Added by membar checker (85)
!	%f8  = 00000000, %f24 = 00000000 00000000
	fstox	%f8 ,%f24		! %f24 = 00000000 00000000
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 02

p0_label_96:
!	Mem[0000000011000080] = 0000c849 2ddabb51 53a9057f 9da8bf35
	prefetch [%i2+0x080],2	! Annulled
p0_b108:
	membar	#Sync			! Added by membar checker (86)
!	%l2 = 0000000000000000, Mem[0000000031000046] = 31f5238b
	stba	%l2,[%o2+0x046]%asi	! Mem[0000000031000044] = 31f5008b
!	Mem[0000000011000000] = 435df72f, %l6 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l6	! %l6 = 00000000435df72f
!	%l0 = 000000000000ffff, %l4 = 00000000013240f5, %l3 = 0000000000000040
	addcc	%l0,%l4,%l3		! %l3 = 00000000013340f4, %ccr = 00
	set	p0_b109,%o7
	fbuge	p0_far_1_le	! Branch Taken, %fcc0 = 2

p0_label_97:
!	Mem[0000000011000060] = 952b53fb a0342f53 47520cc4 c548de95
	prefetch [%i2+0x060],21
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x06d,%g2
p0_b109:
!	Registers modified during the branch to p0_far_1
!	%l2  = 00000001010cfef2
!	%l5  = 000000000000ff00
!	%l7  = 00000001023f3fe7
	membar	#Sync			! Added by membar checker (87)
!	Mem[0000000030800040] = 435df72f 194cca03, %l0 = 0000ffff, %l1 = 0001010e
	ldd	[%o1+0x040],%l0		! %l0 = 00000000435df72f 00000000194cca03
!	Branch On Register, %l5 = 000000000000ff00
	brgz,a,pt %l5,p0_b110		! Branch Taken
!	%l6 = 00000000435df72f, Mem[0000000011000000] = 435df72f
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000011000000] = 435df72f
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x06e,%g2
p0_b110:
	membar	#Sync			! Added by membar checker (88)
!	Mem[0000000011800048] = 98690296, %l3 = 00000000013340f4
	ldsw	[%i3+0x048],%l3		! %l3 = ffffffff98690296

p0_label_98:
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l3 = ffffffff98690296, Mem[0000000010000000] = 0000e394143913e5
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000010000000] = ffffffff98690296
p0_b111:
	membar	#Sync			! Added by membar checker (89)
!	%l1 = 00000000194cca03, Mem[0000000010000000] = ffffffff98690296
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = 00000000194cca03
!	%f16 = 00000000 00000000, %f6  = 197005cc a7181c95, %f12 = c1c30be9 ac000000
	fmuld	%f16,%f6 ,%f12		! %f12 = 00000000 00000000
!	Branch On Register, %l2 = 00000001010cfef2
	brz,a,pn %l2,p0_not_taken_0	! Branch Not Taken

p0_label_99:
!	Mem[0000000011800060] = e907faa7 9efc715c a6442cc1 ee677a3f
	prefetch [%i3+0x060],16	! Annulled
p0_b112:
	membar	#Sync			! Added by membar checker (90)
!	%f12 = 00000000, %f0  = 00000000
	fabss	%f12,%f0 		! %f0  = 00000000
!	%f4  = 00000000, %f10 = 5d3b182e, %f19 = 4cd89658
	fdivs	%f4 ,%f10,%f19		! %f19 = 00000000
!	Mem[0000000011000000] = 435df72f, %l0 = 00000000435df72f
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000435d
!	%f22 = daf4e480 d2000000, %f10 = 5d3b182e d9e82ca8
	fcmped	%fcc0,%f22,%f10		! %fcc0 = 1

p0_label_100:
!	Mem[0000000011000008] = ffffaeb1, %l7 = 00000001023f3fe7
	lduba	[%i2+%o6]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000032000050] = a93c5722, %l6 = 00000000435df72f
	lduba	[%o4+0x050]%asi,%g2	! %g2 = 00000000000000a9
!	%f8  = 00000000, %f0  = 00000000
	fcmpes	%fcc2,%f8 ,%f0 		! %fcc2 = 0
!	%l0 = 000000000000435d, Mem[0000000032000014] = c2eec50c
	sth	%l0,[%o4+0x014]		! Mem[0000000032000014] = 435dc50c
!	%l6 = 00000000435df72f, Mem[0000000040000012] = 22361c2d
	sth	%l6,[%o5+0x012]		! Mem[0000000040000010] = 2236f72f

p0_label_101:
	bg	p0_b113			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000010000008] = 7ebf2e67, %l7 = 00000000000000ff
	lduwa	[%i0+%o6]0x80,%l7	! %l7 = 000000007ebf2e67
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x071,%g2
p0_b113:
	membar	#Sync			! Added by membar checker (91)
!	%l6 = 00000000435df72f, Mem[0000000011800000] = ffffe8332ddab005
	stxa	%l6,[%i3+%g0]0x80	! Mem[0000000011800000] = 00000000435df72f

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba,a	p0_branch_failed
p0_not_taken_0_end:

!	Mem[0000000031800040] = 2638e089, %l1 = 00000000194cca03
	lduha	[%o3+0x040]%asi,%l1	! %l1 = 0000000000002638
!	%l6 = 00000000435df72f, %l0 = 000000000000435d, %l0 = 000000000000435d
	addc	%l6,%l0,%l0		! %l0 = 00000000435e3a8c

p0_label_102:
!	%l1 = 0000000000002638, Mem[0000000030800040] = 435df72f
	stwa	%l1,[%o1+0x040]%asi	! Mem[0000000030800040] = 00002638
	fbne,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[000000003000000c] = 00000000, %l0 = 00000000435e3a8c
	ldsb	[%o0+0x00d],%l0		! Annulled
p0_b114:
	membar	#Sync			! Added by membar checker (92)
	set	p0_b115,%o7
	fbule,a,pn %fcc2,p0_near_0_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000010000000] = 00000000, %l0 = 00000000435e3a8c
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x073,%g2
p0_b115:
!	Registers modified during the branch to p0_near_0
!	%l1  = 00000001023f3fe7
!	%l3  = ffffffffffeb0cb7

p0_label_103:
	membar	#Sync			! Added by membar checker (93)
!	Mem[0000000011800000] = 00000000, %l1 = 00000001023f3fe7
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l2 = 00000001010cfef2, %l4 = 00000000013240f5, %l5 = 000000000000ff00
	xnorcc	%l2,%l4,%l5		! %l5 = fffffffeffc141f8, %ccr = 88
!	%f14 = 00000000, %f16 = 00000000 00000000
	fstod	%f14,%f16		! %f16 = 00000000 00000000
!	Mem[0000000031000008] = 00000000 00000000, %l7 = 000000007ebf2e67, %l3 = ffffffffffeb0cb7
	add	%o2,0x08,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = 00000000023f3fe7
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],4

p0_label_104:
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000032000018] = 66c8776e, %l0 = 0000000000000000
	lduh	[%o4+0x01a],%g2		! Annulled
p0_b116:
	membar	#Sync			! Added by membar checker (94)
	nop
!	%l4 = 00000000013240f5, %l4 = 00000000013240f5, %l0 = 0000000000000000
	add	%l4,%l4,%l0		! %l0 = 00000000026481ea
!	%l1 = 0000000000000000, immed = 00000005, %l3 = 00000000023f3fe7
	sllx	%l1,0x005,%l3		! %l3 = 0000000000000000

p0_label_105:
!	Mem[00000000118000c6] = fd87dca4, %l6 = 00000000435df72f
	ldstuba	[%i3+0x0c6]%asi,%l6	! %l6 = 00000000000000dc
!	Mem[0000000011000008] = ffffaeb1, %l7 = 000000007ebf2e67
	lduwa	[%i2+%o6]0x80,%l7	! %l7 = 00000000ffffaeb1
	bne	p0_b117			! Branch Taken, %ccr = 88, CWP = 0
!	%l3 = 0000000000000000, Mem[0000000011000000] = 435df72f
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000011000000] = 005df72f
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x075,%g2
p0_b117:
	membar	#Sync			! Added by membar checker (95)
!	Mem[0000000011000008] = ffffaeb1, %l2 = 00000001010cfef2
	lduha	[%i2+%o6]0x80,%l2	! %l2 = 000000000000ffff

p0_label_106:
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetcha [%o4+0x000]%asi,3
!	%l7 = 00000000ffffaeb1, %l0 = 00000000026481ea, %y  = 00000001
	udivcc	%l7,%l0,%l0		! %l0 = 00000000000000d5, %ccr = 00
!	Mem[00000000110000fc] = 3ae040f5, %l4 = 00000000013240f5
	ldswa	[%i2+0x0fc]%asi,%l4	! %l4 = 000000003ae040f5
!	%l5 = fffffffeffc141f8, %l0 = 00000000000000d5, %l0 = 00000000000000d5
	srlx	%l5,%l0,%l0		! %l0 = 000007fffffff7fe
	fbuge	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_107:
!	Mem[000000001100002c] = 62d429fc, %l7 = 00000000ffffaeb1
	ldsh	[%i2+0x02e],%l7		! %l7 = 00000000000029fc
p0_b118:
	membar	#Sync			! Added by membar checker (96)
!	Mem[0000000010800008] = 0000010b00000000, %l6 = 00000000000000dc
	ldxa	[%i1+%o6]0x80,%l6	! %l6 = 0000010b00000000
!	%l5 = fffffffeffc141f8, immed = 000003d4, %y  = 00000001
	sdivx	%l5,0x3d4,%l4		! %l4 = ffffffffffbd1001
!	%l4 = ffffffffffbd1001, immed = 00000ef5, %y  = 00000001
	udiv	%l4,0xef5,%l4		! %l4 = 00000000002236c2
!	%l7 = 00000000000029fc, %l0 = 000007fffffff7fe, %l2 = 000000000000ffff
	xorcc	%l7,%l0,%l2		! %l2 = 000007ffffffde02, %ccr = 08

p0_label_108:
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l1 = 0000000000000000, Mem[000000001100003d] = 8ca2e2bf
	stb	%l1,[%i2+0x03d]		! Annulled
p0_b119:
	membar	#Sync			! Added by membar checker (97)
!	Mem[0000000030000000] = ffffe8cc 81400980, %l4 = 002236c2, %l5 = ffc141f8
	ldda	[%o0+0x000]%asi,%l4	! %l4 = 00000000ffffe8cc 0000000081400980
!	%f30 = 00000000, %f26 = 7fb3683c 00000000
	fstod	%f30,%f26		! %f26 = 00000000 00000000
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_109:
!	Mem[000000003200002c] = 4b729f64, %l1 = 0000000000000000
	ldsw	[%o4+0x02c],%g2		! %g2 = 0000000000000000
p0_b120:
	membar	#Sync			! Added by membar checker (98)
!	%l0 = 000007fffffff7fe, Mem[0000000031800040] = 2638e089443bb01d
	stx	%l0,[%o3+0x040]		! Mem[0000000031800040] = 000007fffffff7fe
!	%l3 = 0000000000000000, Mem[000000001180006a] = a6442cc1
	stb	%l3,[%i3+0x06a]		! Mem[0000000011800068] = a64400c1
!	Mem[0000000030000048] = 9558542f, %l1 = 0000000000000000
	ldsha	[%o0+0x048]%asi,%l1	! %l1 = ffffffffffff9558
!	Mem[0000000032000078] = bd30fe10, %l4 = 00000000ffffe8cc
	ldsb	[%o4+0x07a],%g2		! %g2 = ffffffffffffffbd

p0_label_110:
	bpos,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l1 = ffffffffffff9558, Mem[0000000011800008] = ffffffffffe28bae
	stxa	%l1,[%i3+%o6]0x80	! Annulled
p0_b121:
	membar	#Sync			! Added by membar checker (99)
!	Branch On Register, %l3 = 0000000000000000
	brgz,a,pt %l3,p0_not_taken_0	! Branch Not Taken
!	%l2 = 000007ffffffde02, Mem[0000000032000008] = 6b78d8c7d8311ea6
	stx	%l2,[%o4+0x008]		! Annulled
p0_b122:
	membar	#Sync			! Added by membar checker (100)
!	%l5 = 0000000081400980, Mem[0000000030800048] = 0000000000000044
	stx	%l5,[%o1+0x048]		! Mem[0000000030800048] = 0000000081400980

p0_label_111:
!	%l3 = 0000000000000000, %l7 = 00000000000029fc, %y  = 00000001
	mulx	%l3,%l7,%l6		! %l6 = 0000000000000000
!	%l2 = 000007ffffffde02, immed = 000000c7, %l7 = 00000000000029fc
	sub	%l2,0x0c7,%l7		! %l7 = 000007ffffffdd3b
	fbul,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000011800048] = 98690296, %l6 = 0000000000000000
	ldub	[%i3+0x04b],%l6		! Annulled
p0_b123:
	membar	#Sync			! Added by membar checker (101)
!	%l7 = 000007ffffffdd3b, immed = fffff0ad, %l3 = 0000000000000000
	addcc	%l7,-0xf53,%l3		! %l3 = 000007ffffffcde8, %ccr = 19

p0_label_112:
!	%l1 = ffffffffffff9558, %l0 = 000007fffffff7fe, %y  = 00000001
	udivcc	%l1,%l0,%l0		! %l0 = 0000000000000001, %ccr = 00
	fbe,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l6 = 0000000000000000, Mem[00000000120000f8] = 882ea66a
	stb	%l6,[%i4+0x0f8]		! Annulled
p0_b124:
	membar	#Sync			! Added by membar checker (102)
!	Branch On Register, %l2 = 000007ffffffde02
	brlz,pn	%l2,p0_not_taken_0	! Branch Not Taken
!	%l7 = 000007ffffffdd3b, Mem[0000000031800040] = 000007fffffff7fe
	stx	%l7,[%o3+0x040]		! Mem[0000000031800040] = 000007ffffffdd3b
p0_b125:

p0_label_113:
	membar	#Sync			! Added by membar checker (103)
!	%l6 = 0000000000000000, %l0 = 0000000000000001, %l0 = 0000000000000001
	addc	%l6,%l0,%l0		! %l0 = 0000000000000001
!	%l4 = 00000000ffffe8cc, Mem[000000001280006c] = c21b8f99
	stw	%l4,[%i5+0x06c]		! Mem[000000001280006c] = ffffe8cc
!	Mem[0000000011000080] = 0000c849, %l2 = ffffde02, %l2 = ffffde02
	add	%i2,0x80,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 000000000000c849
!	%l2 = 000000000000c849, %l7 = 000007ffffffdd3b, %y  = 00000001
	smulcc	%l2,%l7,%l6		! %l6 = ffffffffe4cc2dd3, %ccr = 88
!	%f14 = 00000000 00000000, %f0  = 00000000 00000000
	fxtod	%f14,%f0 		! %f0  = 00000000 00000000

p0_label_114:
!	%l7 = 000007ffffffdd3b, Mem[000000001080005e] = 4b62348e
	stb	%l7,[%i1+0x05e]		! Mem[000000001080005c] = 4b623b8e
	fbge,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = 000007ffffffdd3b, Mem[0000000010000008] = 7ebf2e67
	stwa	%l7,[%i0+%o6]0x80	! Annulled
p0_b126:
	membar	#Sync			! Added by membar checker (104)
	set	p0_b127,%o7
	fbuge,pn %fcc2,p0_near_2_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000011800008] = ffffffff, %l1 = ffffffffffff9558
	ldsba	[%i3+%o6]0x80,%l1	! %l1 = ffffffffffffffff
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x07f,%g2
p0_b127:
!	Registers modified during the branch to p0_near_2
!	%l3  = ffffffffffffc71d

p0_label_115:
	membar	#Sync			! Added by membar checker (105)
!	Branch On Register, %l6 = ffffffffe4cc2dd3
	brlez,a,pn %l6,p0_b128		! Branch Taken
!	Mem[00000000110000b0] = 47ff7acd, %l7 = 000007ffffffdd3b
	ldsh	[%i2+0x0b2],%l7		! %l7 = 0000000000007acd
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x080,%g2
p0_b128:
	membar	#Sync			! Added by membar checker (106)
!	%l2 = 000000000000c849, %l2 = 000000000000c849, %l6 = ffffffffe4cc2dd3
	addccc	%l2,%l2,%l6		! %l6 = 0000000000019092, %ccr = 00
!	Mem[00000000108000c0] = 4c8014d4 28bd7fa6 ffffffff 0000e394
	prefetch [%i1+0x0c0],4
!	%l4 = 00000000ffffe8cc, immed = 00000132, %l5 = 0000000081400980
	orcc	%l4,0x132,%l5		! %l5 = 00000000ffffe9fe, %ccr = 08

p0_label_116:
	bpos,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[00000000118000a0] = 043f7e9e 00000c49 fcea08dd 1a8b61e1
	prefetch [%i3+0x0a0],21	! Annulled
p0_b129:
	membar	#Sync			! Added by membar checker (107)
!	%l7 = 0000000000007acd, immed = fffff681, %l5 = 00000000ffffe9fe
	orcc	%l7,-0x97f,%l5		! %l5 = fffffffffffffecd, %ccr = 88
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[00000000100000e0] = 3240adda 491015b6 2decf098 89e67855
	prefetch [%i0+0x0e0],2
p0_b130:

p0_label_117:
	membar	#Sync			! Added by membar checker (108)
!	Mem[0000000010000058] = b77d7492, %l3 = ffffffffffffc71d
	ldsb	[%i0+0x05b],%l3		! %l3 = ffffffffffffff92
!	%l3 = ffffffffffffff92, %l2 = 000000000000c849, %l4 = 00000000ffffe8cc
	subc	%l3,%l2,%l4		! %l4 = ffffffffffff3749
!	Mem[000000003180004c] = 0a304605, %l3 = ffffffffffffff92
	swap	[%o3+0x04c],%l3		! %l3 = 000000000a304605
!	%l1 = ffffffffffffffff, Mem[0000000010800008] = 0000010b
	stha	%l1,[%i1+%o6]0x80	! Mem[0000000010800008] = ffff010b
	fbge,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_118:
!	Mem[00000000100000c0] = f0b2218d 2012a15a ffffffff ffffffeb
	prefetch [%i0+0x0c0],1
p0_b131:
	membar	#Sync			! Added by membar checker (109)
!	Mem[0000000011800004] = 435df72f, %l3 = 0a304605, %l3 = 0a304605
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000435df72f
!	%f19 = 00000000, %f12 = 00000000 00000000
	fstod	%f19,%f12		! %f12 = 00000000 00000000
!	Jump to jmpl_0, CWP = 0
	set	p0_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	Mem[000000003200001c] = c9b5881b, %l2 = 000000000000c849
	lduh	[%o4+0x01e],%g2		! %g2 = 000000000000c9b5
!	Registers modified during the branch to p0_jmpl_0
!	%l0  = 000000000000018c
!	%l5  = 000000000000c848

p0_label_119:
!	call to call_2, CWP = 0
	call	p0_call_2_he
!	Mem[00000000118000d4] = 34ba851e, %l6 = 0000000000019092
	ldstub	[%i3+0x0d4],%l6		! %l6 = 0000000000000034
!	Registers modified during the branch to p0_call_2
!	%l0  = 000000000a9eb6eb
!	%l1  = 0000000000000000
!	%l3  = 0000000000001933
!	%l4  = 0000000000086ccc
!	%l7  = 0000000000000f14
!	%l2 = 000000000000c849, Mem[0000000010800008] = ffff010b
	stba	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = 49ff010b
!	%l6 = 00000034, %l7 = 00000f14, Mem[0000000010800068] = 4008c917 ae6d55aa
	std	%l6,[%i1+0x068]	! Mem[0000000010800068] = 00000034 00000f14
	set	p0_b132,%o7
	fbo,pt	%fcc2,p0_near_1_le	! Branch Taken, %fcc2 = 0

p0_label_120:
!	Mem[0000000032000020] = 881b2ad7 861878d1 a417c71d 4b729f64
	prefetch [%o4+0x020],16
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x084,%g2
p0_b132:
!	Registers modified during the branch to p0_near_1
!	%l1  = 0000000000193300
	fbu	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000030000000] = ffffe8cc, %l4 = 0000000000086ccc
	ldsb	[%o0+0x002],%l4		! %l4 = ffffffffffffffe8
p0_b133:
	membar	#Sync			! Added by membar checker (110)
!	%l4 = ffffffffffffffe8, immed = 00000c0f, %y  = 00000edf
	mulx	%l4,0xc0f,%l2		! %l2 = fffffffffffede98
!	%l0 = 000000000a9eb6eb, immed = 00000022, %l5 = 000000000000c848
	srlx	%l0,0x022,%l5		! %l5 = 0000000000000000

p0_label_121:
!	%f30 = 00000000, %f10 = 5d3b182e
	fnegs	%f30,%f10		! %f10 = 80000000
!	%l4 = ffffffffffffffe8, immed = fffff204, %l0 = 000000000a9eb6eb
	andn	%l4,-0xdfc,%l0		! %l0 = 0000000000000de8
!	%l6 = 0000000000000034, Mem[00000000110000f4] = 1fb7f5ab
	stwa	%l6,[%i2+0x0f4]%asi	! Mem[00000000110000f4] = 00000034
!	%l6 = 0000000000000034, %l1 = 0000000000193300, %y  = 00000edf
	udivcc	%l6,%l1,%l2		! %l2 = 000000000097137c, %ccr = 00
	set	p0_b134,%o7
	fbne	p0_far_1_le	! Branch Taken, %fcc0 = 1

p0_label_122:
!	Mem[0000000011000000] = 005df72f 75f1665c ffffaeb1 746df82e
	prefetch [%i2+0x000],21
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x086,%g2
p0_b134:
!	Registers modified during the branch to p0_far_1
!	%l2  = 000000015e6d3800
!	%l5  = 000000000000ff00
!	%l7  = 000000015e6d37e8
	set	p0_b135,%o7
	fblg	p0_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000010000080] = 399290d1 7d05e794 93873cd6 6c83c24b
	prefetch [%i0+0x080],1
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x087,%g2
p0_b135:
!	Registers modified during the branch to p0_far_3
!	%l0  = 000000015e6d45d1
!	%l2  = 0000000000001933
!	%l4  = 0000000000001058
!	%l5  = fffffffffffffffb
	membar	#Sync			! Added by membar checker (111)
!	Mem[00000000108000c8] = ffffffff, %l1 = 0000000000193300
	swap	[%i1+0x0c8],%l1		! %l1 = 00000000ffffffff
!	Branch On Register, %l1 = 00000000ffffffff
	brz,a,pn %l1,p0_not_taken_0	! Branch Not Taken

p0_label_123:
!	Mem[0000000011800040] = 616faadb 4a07cc6d 98690296 a40aa2f9
	prefetch [%i3+0x040],1	! Annulled
p0_b136:
	membar	#Sync			! Added by membar checker (112)
!	%f14 = 00000000 00000000, %f16 = 00000000 00000000
	fcmped	%fcc3,%f14,%f16		! %fcc3 = 0
!	%f18 = 00000000 00000000, %f12 = 00000000 00000000, %f22 = daf4e480 d2000000
	fsubd	%f18,%f12,%f22		! %f22 = 00000000 00000000
!	%f22 = 00000000 00000000, %f6  = 197005cc a7181c95
	fcmpd	%fcc2,%f22,%f6 		! %fcc2 = 1
!	%l2 = 0000000000001933, %l4 = 0000000000001058, %y  = 00000001
	umul	%l2,%l4,%l2		! %l2 = 00000000019bd988

p0_label_124:
!	%f12 = 00000000 00000000, %f21 = 80000000
	fdtoi	%f12,%f21		! %f21 = 00000000
	set	p0_b137,%o7
	fbe,pn	%fcc1,p0_near_2_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000011800008] = ffffffffffe28bae, %l3 = 0000000000001933
	ldxa	[%i3+%o6]0x80,%l3	! %l3 = ffffffffffe28bae
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x089,%g2
p0_b137:
!	Registers modified during the branch to p0_near_2
!	%l3  = ffffffffffffc71d
	bne,a	p0_b138			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],3
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x08a,%g2
p0_b138:

p0_label_125:
	membar	#Sync			! Added by membar checker (113)
!	Mem[0000000010800008] = 49ff010b, %l3 = ffffffffffffc71d
	ldswa	[%i1+%o6]0x80,%l3	! %l3 = 0000000049ff010b
	fbge,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000011000008] = ffffaeb1746df82e, %l0 = 000000015e6d45d1
	ldxa	[%i2+%o6]0x80,%l0	! Annulled
p0_b139:
	membar	#Sync			! Added by membar checker (114)
!	Mem[0000000010800014] = 98f569be, %l3 = 0000000049ff010b
	ldsw	[%i1+0x014],%l3		! %l3 = ffffffff98f569be
!	Mem[0000000031800040] = 000007ff, %l7 = 000000015e6d37e8
	ldsw	[%o3+0x040],%l7		! %l7 = 00000000000007ff

p0_label_126:
!	Branch On Register, %l4 = 0000000000001058
	brgez,a,pn %l4,p0_b140		! Branch Taken
!	Mem[0000000011800008] = ffffffff, %l1 = 00000000ffffffff
	ldstuba	[%i3+%o6]0x80,%l1	! %l1 = 00000000000000ff
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x08c,%g2
p0_b140:
	bvc,a	p0_b141			! Branch Taken, %ccr = 88, CWP = 0
!	%l7 = 00000000000007ff, Mem[00000000108000b6] = 0000ffff
	stb	%l7,[%i1+0x0b6]		! Mem[00000000108000b4] = 0000ffff
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x08d,%g2
p0_b141:
	membar	#Sync			! Added by membar checker (115)
!	%l3 = ffffffff98f569be, immed = fffffa6a, %y  = 00000000
	umul	%l3,-0x596,%l7		! %l7 = 98f56667952354ac

p0_label_127:
!	Mem[0000000032000020] = 881b2ad7 861878d1 a417c71d 4b729f64
	prefetcha [%o4+0x020]%asi,2
!	Mem[0000000011800070] = d122af53, %l2 = 00000000019bd988
	ldsha	[%i3+0x072]%asi,%l2	! %l2 = ffffffffffffaf53
!	%l3 = ffffffff98f569be, immed = 0000001c, %l1 = 00000000000000ff
	srl	%l3,0x01c,%l1		! %l1 = 0000000000000009
	bne	p0_b142			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010800040] = fc03a46e 90316c6d 00000070 f48baf51
	prefetch [%i1+0x040],20
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x08e,%g2
p0_b142:

p0_label_128:
	membar	#Sync			! Added by membar checker (116)
!	%l1 = 0000000000000009, %l0 = 000000015e6d45d1, %l3 = ffffffff98f569be
	sll	%l1,%l0,%l3		! %l3 = 0000000000120000
!	%l6 = 0000000000000034, %l1 = 0000000000000009, %l4 = 0000000000001058
	sll	%l6,%l1,%l4		! %l4 = 0000000000006800
!	%l1 = 0000000000000009, immed = fffff03a, %l7 = 98f56667952354ac
	tsubcc	%l1,-0xfc6,%l7		! %l7 = 0000000000000fcf, %ccr = 13
!	%f14 = 00000000 00000000, %f18 = 00000000 00000000
	fcmpd	%fcc3,%f14,%f18		! %fcc3 = 0
!	%l2 = ffffffffffffaf53, Mem[0000000032000018] = 98d866c8776ec9b5
	stxa	%l2,[%o4+0x018]%asi	! Mem[0000000032000018] = ffffffffffffaf53

p0_label_129:
!	%l4 = 0000000000006800, %l3 = 0000000000120000, %l3 = 0000000000120000
	subc	%l4,%l3,%l3		! %l3 = ffffffffffee67ff
!	Branch On Register, %l6 = 0000000000000034
	brlez,pn %l6,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000030800048] = 00000000, %l1 = 0000000000000009
	lduw	[%o1+0x048],%l1		! %l1 = 0000000000000000
p0_b143:
	membar	#Sync			! Added by membar checker (117)
!	%l2 = ffffffffffffaf53, %l1 = 0000000000000000, %l4 = 0000000000006800
	andncc	%l2,%l1,%l4		! %l4 = ffffffffffffaf53, %ccr = 88
	bleu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88

p0_label_130:
!	Mem[0000000011800000] = 00000000, %l2 = ffffffffffffaf53
	lduwa	[%i3+%g0]0x80,%l2	! Annulled
p0_b144:
	set	p0_b145,%o7
	fbne	p0_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000010000008] = 7ebf2e67, %l2 = ffffffffffffaf53
	ldstuba	[%i0+%o6]0x80,%l2	! %l2 = 000000000000007e
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x091,%g2
p0_b145:
!	Registers modified during the branch to p0_far_1
!	%l2  = 0000000000000000
!	%l5  = 000000000000ff00
!	%l7  = ffffffffffffaf53
	membar	#Sync			! Added by membar checker (118)
!	Mem[0000000011000060] = 952b53fba0342f53, %l2 = 0000000000000000
	ldx	[%i2+0x060],%l2		! %l2 = 952b53fba0342f53
!	Mem[0000000011800000] = 00000000 435df72f
	flush	%i3+0x000

p0_label_131:
!	%f14 = 00000000 00000000, %f10 = 80000000 d9e82ca8
	fnegd	%f14,%f10		! %f10 = 80000000 00000000
!	%l4 = ffffffffffffaf53, Mem[0000000010800062] = 56d21b60
	sth	%l4,[%i1+0x062]		! Mem[0000000010800060] = 56d2af53
!	%l2 = 952b53fba0342f53, immed = fffff671, %y  = 00000000
	umulcc	%l2,-0x98f,%l1		! %l1 = a0342957ad2fa5a3, %ccr = 88
!	%l0 = 000000015e6d45d1, %l0 = 000000015e6d45d1, %l5 = 000000000000ff00
	xorcc	%l0,%l0,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l3 = ffffffffffee67ff
	sethi	%hi(0x22376400),%l3	! %l3 = 0000000022376400

p0_label_132:
!	Mem[0000000010800008] = 49ff010b00000000, %l3 = 0000000022376400
	ldxa	[%i1+%o6]0x80,%l3	! %l3 = 49ff010b00000000
!	%l7 = ffffffffffffaf53, immed = fffff123, %l4 = ffffffffffffaf53
	orn	%l7,-0xedd,%l4		! %l4 = ffffffffffffafdf
!	Mem[0000000030800000] = 0f3244d6, %l4 = ffffffffffffafdf
	swapa	[%o1+0x000]%asi,%l4	! %l4 = 000000000f3244d6
	set	p0_b146,%o7
	fbo,a,pt %fcc1,p0_near_3_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000032000020] = 881b2ad7 861878d1 a417c71d 4b729f64
	prefetch [%o4+0x020],21
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x092,%g2
p0_b146:
!	Registers modified during the branch to p0_near_3
!	%l3  = ffffffffffffffb7
!	%l4  = ffffffffffffe833
!	%l5  = 0000000000000000

p0_label_133:
	membar	#Sync			! Added by membar checker (119)
!	%l4 = ffffffffffffe833
	setx	0x25d61c2125d61c21,%g7,%l4 ! %l4 = 25d61c2125d61c21
!	%l4 = 25d61c21, %l5 = 00000000, Mem[0000000011000058] = d2806936 e89390eb
	stda	%l4,[%i2+0x058]%asi	! Mem[0000000011000058] = 25d61c21 00000000
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000010800059] = 6c441ef8, %l0 = 000000015e6d45d1
	ldstub	[%i1+0x059],%l0		! Annulled
p0_b147:
	fbue,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_134:
!	Mem[0000000030800048] = 00000000, %l0 = 000000015e6d45d1
	ldsw	[%o1+0x048],%l0		! Annulled
p0_b148:
	membar	#Sync			! Added by membar checker (120)
	set	p0_b149,%o7
	fbue,a,pn %fcc3,p0_near_3_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000010000008] = ffbf2e67, %l1 = a0342957ad2fa5a3
	lduwa	[%i0+%o6]0x80,%l1	! %l1 = 00000000ffbf2e67
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x095,%g2
p0_b149:
!	Registers modified during the branch to p0_near_3
!	%l0  = 000000000047f244
!	%l3  = 000000007fffffff
!	%l7  = 000000000047f2fc
	membar	#Sync			! Added by membar checker (121)
!	%l1 = 00000000ffbf2e67, %l7 = 000000000047f2fc, %y  = a0342957
	umulcc	%l1,%l7,%l0		! %l0 = 0047e0c458a00b64, %ccr = 00
!	Branch On Register, %l6 = 0000000000000034
	brgez,a,pt %l6,p0_b150		! Branch Taken

p0_label_135:
!	%l3 = 000000007fffffff, Mem[0000000011800008] = ffffffff
	stwa	%l3,[%i3+%o6]0x80	! Mem[0000000011800008] = 7fffffff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x096,%g2
p0_b150:
	membar	#Sync			! Added by membar checker (122)
!	%f27 = 00000000, %f16 = 00000000
	fnegs	%f27,%f16		! %f16 = 80000000
!	%l0 = 0047e0c458a00b64, %l0 = 0047e0c458a00b64, %l0 = 0047e0c458a00b64
	orn	%l0,%l0,%l0		! %l0 = ffffffffffffffff
!	%f18 = 00000000 00000000, %f18 = 00000000 00000000
	fdtox	%f18,%f18		! %f18 = 00000000 00000000
	fbue	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_136:
!	Mem[0000000011800000] = 00000000, %l1 = 00000000ffbf2e67
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
p0_b151:
	membar	#Sync			! Added by membar checker (123)
!	Branch On Register, %l5 = 0000000000000000
	brz,pt	%l5,p0_b152		! Branch Taken
!	%l7 = 000000000047f2fc, Mem[000000003000000c] = 00000000
	stb	%l7,[%o0+0x00c]		! Mem[000000003000000c] = fc000000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x098,%g2
p0_b152:
	membar	#Sync			! Added by membar checker (124)
!	%l6 = 0000000000000034, immed = fffff6fd, %y  = 0047e0c4
	udivcc	%l6,-0x903,%l0		! %l0 = 000000000047e0c6, %ccr = 00
!	%l5 = 0000000000000000, Mem[0000000010800008] = 49ff010b
	stha	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = 0000010b

p0_label_137:
!	Mem[0000000032000020] = 881b2ad7 861878d1 a417c71d 4b729f64
	prefetch [%o4+0x020],16
!	%l2 = 952b53fba0342f53, %l0 = 000000000047e0c6, %l0 = 000000000047e0c6
	addc	%l2,%l0,%l0		! %l0 = 952b53fba07c1019
	fbuge,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l5 = 0000000000000000, Mem[0000000031800048] = ffff4a3a
	sth	%l5,[%o3+0x048]		! Annulled
p0_b153:
	membar	#Sync			! Added by membar checker (125)
!	Mem[0000000030000040] = 881b2ad7 861878d1, %l6 = 0000000000000034, %l1 = 0000000000000000
	add	%o0,0x40,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 161a131427efc08a

p0_label_138:
!	%l0 = 952b53fba07c1019, immed = fffff580, %l0 = 952b53fba07c1019
	xorcc	%l0,-0xa80,%l0		! %l0 = 6ad4ac045f83e599, %ccr = 00
!	Mem[0000000011800060] = e907faa7 9efc715c a64400c1 ee677a3f
	prefetch [%i3+0x060],4
!	Branch On Register, %l2 = 952b53fba0342f53
	brlz,pt	%l2,p0_b154		! Branch Taken
!	Mem[000000003100004c] = 0221dd80, %l1 = 161a131427efc08a
	ldsh	[%o2+0x04e],%l1		! %l1 = ffffffffffffdd80
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x09a,%g2
p0_b154:
	membar	#Sync			! Added by membar checker (126)
	fbu,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0

p0_label_139:
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],20	! Annulled
p0_b155:
	membar	#Sync			! Added by membar checker (127)
!	%l1 = ffffffffffffdd80, Mem[0000000031800040] = 000007ffffffdd3b
	stxa	%l1,[%o3+0x040]%asi	! Mem[0000000031800040] = ffffffffffffdd80
!	%f20 = 00000000 00000000, %f15 = 00000000
	fxtos	%f20,%f15		! %f15 = 00000000
!	Mem[0000000011000050] = 98753658, %l4 = 25d61c2125d61c21
	ldsh	[%i2+0x052],%l4		! %l4 = 0000000000003658
!	%l2 = 952b53fba0342f53, Mem[000000001180004b] = 98690296
	stb	%l2,[%i3+0x04b]		! Mem[0000000011800048] = 98690253

p0_label_140:
!	Mem[0000000010000004] = 194cca03, %l0 = 6ad4ac045f83e599
	ldsh	[%i0+0x006],%l0		! %l0 = ffffffffffffca03
	fbg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 952b53fba0342f53, Mem[00000000108000a4] = 761d0200
	stw	%l2,[%i1+0x0a4]		! Mem[00000000108000a4] = a0342f53
p0_b156:
	membar	#Sync			! Added by membar checker (128)
!	Branch On Register, %l2 = 952b53fba0342f53
	brnz,a,pn %l2,p0_b157		! Branch Taken
!	Mem[00000000100000c0] = f0b2218d 2012a15a ffffffff ffffffeb
	prefetch [%i0+0x0c0],3
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x09d,%g2
p0_b157:

p0_label_141:
	membar	#Sync			! Added by membar checker (129)
!	Mem[0000000031000008] = 00000000, %l4 = 0000000000003658
	ldswa	[%o2+0x008]%asi,%l4	! %l4 = 0000000000000000
!	%l2 = 952b53fba0342f53, Mem[00000000108000e4] = 3717c06c
	stb	%l2,[%i1+0x0e4]		! Mem[00000000108000e4] = 5317c06c
!	%f24 = 00000000 00000000, %f26 = 00000000 00000000
	fdtox	%f24,%f26		! %f26 = 00000000 00000000
!	Mem[0000000011000000] = 005df72f 75f1665c ffffaeb1 746df82e
	prefetcha [%i2+0x000]%asi,4
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000118000a8] = fcea08dd 1a8b61e1
	std	%l4,[%i3+0x0a8]	! Mem[00000000118000a8] = 00000000 00000000

p0_label_142:
	nop
!	%f19 = 00000000, %f16 = 80000000
	fitos	%f19,%f16		! %f16 = 00000000
	set	p0_b158,%o7
	fbl,a,pn %fcc0,p0_near_0_he	! Branch Taken, %fcc0 = 1
!	Mem[00000000130000e0] = 680bd5b6 d44a5278 4a7a0d61 858f9810
	prefetch [%i6+0x0e0],2
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x09e,%g2
p0_b158:
!	Registers modified during the branch to p0_near_0
!	%l1  = 952b53fba0342f53
!	%l3  = ffffffff80000000
	membar	#Sync			! Added by membar checker (130)
!	%f24 = 00000000 00000000, %f12 = 00000000 00000000
	fmovd	%f24,%f12		! %f12 = 00000000 00000000

p0_label_143:
!	%l7 = 000000000047f2fc, %l3 = ffffffff80000000, %l6 = 0000000000000034
	xnor	%l7,%l3,%l6		! %l6 = 000000007fb80d03
!	Branch On Register, %l7 = 000000000047f2fc
	brz,pt	%l7,p0_not_taken_0	! Branch Not Taken
!	%l1 = 952b53fba0342f53, Mem[0000000032000006] = cb056b78
	stb	%l1,[%o4+0x006]		! Mem[0000000032000004] = 53056b78
p0_b159:
	membar	#Sync			! Added by membar checker (131)
!	%f24 = 00000000, %f12 = 00000000
	fcmpes	%fcc3,%f24,%f12		! %fcc3 = 0
!	Mem[0000000031000004] = 0000ff00, %l7 = 000000000047f2fc
	ldsh	[%o2+0x006],%l7		! %l7 = ffffffffffffff00

p0_label_144:
	set	p0_b160,%o7
	fbo	p0_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000010000074] = 1675deef, %l1 = 952b53fba0342f53
	ldub	[%i0+0x076],%l1		! %l1 = 00000000000000de
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0a0,%g2
p0_b160:
!	Registers modified during the branch to p0_far_2
!	%l1  = ffffffff80000000
!	%l2  = 0000de0000000000
!	%l6  = 000000000047e0c7
	membar	#Sync			! Added by membar checker (132)
!	%l5 = 0000000000000000, Mem[000000003000004e] = 1dceff05
	sth	%l5,[%o0+0x04e]		! Mem[000000003000004c] = 1dce0000
!	%l0 = ffffffffffffca03, Mem[000000003100004a] = ffffffb7
	sth	%l0,[%o2+0x04a]		! Mem[0000000031000048] = ffffca03
!	%l2 = 0000de0000000000, %l2 = 0000de0000000000, %l3 = ffffffff80000000
	orcc	%l2,%l2,%l3		! %l3 = 0000de0000000000, %ccr = 04

p0_label_145:
!	%f30 = 00000000 00000000, %f26 = 00000000 00000000, %f6  = 197005cc a7181c95
	fsubd	%f30,%f26,%f6 		! %f6  = 00000000 00000000
!	Branch On Register, %l4 = 0000000000000000
	brlez,pt %l4,p0_b161		! Branch Taken
!	%l1 = ffffffff80000000, Mem[0000000010000000] = 00000000194cca03
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = ffffffff80000000
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x0a1,%g2
p0_b161:
	membar	#Sync			! Added by membar checker (133)
!	Mem[0000000010800020] = 249b7140 003e29da 9395d3a2 feffca4d
	prefetch [%i1+0x020],20
!	Mem[0000000010000000] = ffffffff, %l7 = ffffffffffffff00
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ffffffff

p0_label_146:
!	Mem[0000000031000004] = 0000ff00, %l4 = 00000000, %l3 = 00000000
	add	%o2,0x04,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 000000000000ff00
!	Mem[0000000012800070] = c082ad12 3d1c3f9c, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i5+0x070]%asi,%l2	! %l2 = 00000000c082ad12 000000003d1c3f9c
!	%l4 = 0000000000000000, %l5 = 0000000000000000, %l6 = 000000000047e0c7
	xnor	%l4,%l5,%l6		! %l6 = ffffffffffffffff
!	Mem[0000000011800020] = d6f7c37e 93385e47 1c16a88b 2cc86f16
	prefetch [%i3+0x020],0
	set	p0_b162,%o7
	fbule,a	p0_far_2_he	! Branch Taken, %fcc0 = 1

p0_label_147:
!	Mem[0000000010000000] = ffffff00, %l1 = ffffffff80000000
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0a2,%g2
p0_b162:
!	Registers modified during the branch to p0_far_2
!	%l3  = ffffffffc2e3c063
!	call to call_2, CWP = 0
	call	p0_call_2_he
!	Mem[0000000010000008] = ffbf2e67, %l7 = 00000000ffffffff
	swapa	[%i0+%o6]0x80,%l7	! %l7 = 00000000ffbf2e67
!	Registers modified during the branch to p0_call_2
!	%l0  = 00000a352dd34b56
!	%l1  = 0000000000000000
!	%l3  = 0000000000001a33
!	%l4  = fffffffffff85b84
!	%l7  = 0000000000001014
	membar	#Sync			! Added by membar checker (134)
!	Mem[0000000011000000] = 005df72f 75f1665c ffffaeb1 746df82e
	prefetch [%i2+0x000],2
	fblg,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0

p0_label_148:
!	%l3 = 0000000000001a33, Mem[0000000011800048] = 98690253
	sth	%l3,[%i3+0x048]		! Annulled
p0_b163:
	membar	#Sync			! Added by membar checker (135)
!	%f16 = 00000000 00000000, %f30 = 00000000
	fxtos	%f16,%f30		! %f30 = 00000000
!	%l0 = 00000a352dd34b56, Mem[0000000010000008] = ffffffff
	stha	%l0,[%i0+%o6]0x80	! Mem[0000000010000008] = 4b56ffff
	set	p0_b164,%o7
	fbo,pn	%fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000011000008] = ffffaeb1, %l1 = 0000000000000000
	ldswa	[%i2+%o6]0x80,%l1	! %l1 = ffffffffffffaeb1
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x0a4,%g2
p0_b164:
!	Registers modified during the branch to p0_near_0
!	%l0  = ffffffffffff8ab0
!	%l7  = 00000000c0850969

p0_label_149:
	membar	#Sync			! Added by membar checker (136)
!	%l5 = 0000000000000000, immed = 00000002, %l2 = 00000000c082ad12
	srl	%l5,0x002,%l2		! %l2 = 0000000000000000
	bgu,a	p0_b165			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010800000] = ff000000, %l4 = fffffffffff85b84
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x0a5,%g2
p0_b165:
	membar	#Sync			! Added by membar checker (137)
!	%f18 = 00000000 00000000, %f20 = 00000000 00000000
	fxtod	%f18,%f20		! %f20 = 00000000 00000000
!	%f14 = 00000000 00000000, %f22 = 00000000 00000000
	fnegd	%f14,%f22		! %f22 = 80000000 00000000

p0_label_150:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],20
p0_b166:
	membar	#Sync			! Added by membar checker (138)
!	Mem[0000000030800048] = 00000000, %l5 = 0000000000000000
	ldsba	[%o1+0x049]%asi,%l5	! %l5 = 0000000000000000
!	%f20 = 00000000 00000000, %f22 = 80000000 00000000, %f14 = 00000000 00000000
	fsubd	%f20,%f22,%f14		! %f14 = 00000000 00000000
!	%l1 = ffffffffffffaeb1, %l2 = 0000000000000000, %l3 = 0000000000001a33
	andncc	%l1,%l2,%l3		! %l3 = ffffffffffffaeb1, %ccr = 88

p0_label_151:
!	%l6 = ffffffffffffffff, Mem[0000000030000008] = f08a7f02fc000000
	stx	%l6,[%o0+0x008]		! Mem[0000000030000008] = ffffffffffffffff
!	%f2  = c0a5a79b 80000000, %f2  = c0a5a79b 80000000, %f16 = 00000000 00000000
	fsubd	%f2 ,%f2 ,%f16		! %f16 = 00000000 00000000
!	%f10 = 80000000 00000000, %f12 = 00000000 00000000, %f0  = 00000000 00000000
	fmuld	%f10,%f12,%f0 		! %f0  = 80000000 00000000
	set	p0_b167,%o7
	fbul,a	p0_far_1_le	! Branch Taken, %fcc0 = 1
!	%l5 = 0000000000000000, Mem[000000003000004c] = 1dce0000
	sth	%l5,[%o0+0x04c]		! Mem[000000003000004c] = 00000000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x0a7,%g2
p0_b167:
!	Registers modified during the branch to p0_far_1
!	%l2  = 00000000254283b0
!	%l5  = 000000000000ff00
!	%l7  = 00000000254382b0

p0_label_152:
	membar	#Sync			! Added by membar checker (139)
	set	p0_b168,%o7
	fbo,pt	%fcc0,p0_near_2_le	! Branch Taken, %fcc0 = 1
!	%l0 = ffffffffffff8ab0, Mem[0000000011800078] = fa8490dc5542d787
	stx	%l0,[%i3+0x078]		! Mem[0000000011800078] = ffffffffffff8ab0
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0a8,%g2
p0_b168:
!	Registers modified during the branch to p0_near_2
!	%l3  = ffffffffffffc71d
	membar	#Sync			! Added by membar checker (140)
!	Mem[0000000030800008] = c9d0cd08, %l3 = ffffffffffffc71d
	swap	[%o1+0x008],%l3		! %l3 = 00000000c9d0cd08
!	%l7 = 00000000254382b0, Mem[0000000011800000] = 00000000
	stwa	%l7,[%i3+%g0]0x80	! Mem[0000000011800000] = 254382b0
!	Mem[0000000031800008] = ffff8ab0, %l4 = 000000000000ff00
	ldstub	[%o3+0x008],%l4		! %l4 = 00000000000000ff

p0_label_153:
!	%f16 = 00000000, %f0  = 80000000, %f19 = 00000000
	fadds	%f16,%f0 ,%f19		! %f19 = 00000000
!	%l3 = 00000000c9d0cd08, %l3 = 00000000c9d0cd08, %y  = 00000000
	mulx	%l3,%l3,%l4		! %l4 = 9f198c446135d040
!	%l0 = ffffffffffff8ab0, immed = fffff306, %l2 = 00000000254283b0
	andcc	%l0,-0xcfa,%l2		! %l2 = ffffffffffff8200, %ccr = 88
	ba	p0_b169			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000031800048] = aeb14a3a, %l0 = ffffffffffff8ab0
	ldub	[%o3+0x048],%l0		! %l0 = 00000000000000ae
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x0a9,%g2
p0_b169:

p0_label_154:
	membar	#Sync			! Added by membar checker (141)
!	Mem[0000000032000040] = c78fef2b 03faa03f 00000000 0000ffff
	prefetcha [%o4+0x040]%asi,20
!	%f28 = 00000000 06c4b2c0, %f6  = 00000000 00000000
	fxtod	%f28,%f6 		! %f6  = 419b12cb 00000000
!	%l2 = ffffffffffff8200, %l5 = 000000000000ff00, %l6 = ffffffffffffffff
	subccc	%l2,%l5,%l6		! %l6 = fffffffffffe8300, %ccr = 88
!	Mem[0000000010000008] = 4b56ffff, %l6 = fffffffffffe8300
	ldswa	[%i0+%o6]0x80,%l6	! %l6 = 000000004b56ffff
!	%l2 = ffffffffffff8200, %l1 = ffffffffffffaeb1, %l6 = 000000004b56ffff
	andcc	%l2,%l1,%l6		! %l6 = ffffffffffff8200, %ccr = 88

p0_label_155:
!	Mem[0000000010800020] = 249b7140 003e29da 9395d3a2 feffca4d
	prefetch [%i1+0x020],16
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l6 = ffff8200, %l7 = 254382b0, Mem[0000000010000000] = ffffff00 80000000
	stda	%l6,[%i0+%g0]0x80	! Annulled
p0_b170:
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000010800008] = 0000010b, %l0 = 00000000000000ae
	swapa	[%i1+%o6]0x80,%l0	! Annulled
p0_b171:

p0_label_156:
	membar	#Sync			! Added by membar checker (142)
	fbue,pt	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l5 = 000000000000ff00, Mem[0000000030800048] = 00000000
	stw	%l5,[%o1+0x048]		! Mem[0000000030800048] = 0000ff00
p0_b172:
	membar	#Sync			! Added by membar checker (143)
!	Mem[000000001000004c] = acea7c83, %l7 = 00000000254382b0
	lduwa	[%i0+0x04c]%asi,%l7	! %l7 = 00000000acea7c83
!	%f23 = 00000000, %f12 = 00000000
	fmovs	%f23,%f12		! %f12 = 00000000
!	Mem[00000000108000a0] = 7eed7fab a0342f53 996e77f4 59e64d88
	prefetch [%i1+0x0a0],21

p0_label_157:
!	%f0  = 80000000 00000000, %f30 = 00000000 00000000
	fnegd	%f0 ,%f30		! %f30 = 00000000 00000000
!	%l0 = 00000000000000ae, %l6 = ffffffffffff8200, %l1 = ffffffffffffaeb1
	addcc	%l0,%l6,%l1		! %l1 = ffffffffffff82ae, %ccr = 88
!	%f5  = 80000000, %f31 = 00000000
	fcmpes	%fcc2,%f5 ,%f31		! %fcc2 = 0
!	Mem[0000000010000008] = 4b56ffff f3e9dcb2, %l2 = ffff8200, %l3 = c9d0cd08
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 000000004b56ffff 00000000f3e9dcb2
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88

p0_label_158:
!	Mem[0000000030000000] = ffffe8cc, %l1 = ffffffffffff82ae
	swap	[%o0+0x000],%l1		! Annulled
p0_b173:
	membar	#Sync			! Added by membar checker (144)
!	%l5 = 000000000000ff00, immed = fffff06d, %l4 = 9f198c446135d040
	subc	%l5,-0xf93,%l4		! %l4 = 0000000000010e93
!	%f28 = 00000000 06c4b2c0, %f28 = 00000000 06c4b2c0
	fxtod	%f28,%f28		! %f28 = 419b12cb 00000000
	bcc	p0_b174			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000011000080] = 0000c849 2ddabb51 53a9057f 9da8bf35
	prefetch [%i2+0x080],21
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0ae,%g2
p0_b174:

p0_label_159:
	membar	#Sync			! Added by membar checker (145)
	fbu,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010800030] = a14ae14e, %l3 = 00000000f3e9dcb2
	ldub	[%i1+0x032],%l3		! Annulled
p0_b175:
	membar	#Sync			! Added by membar checker (146)
!	%l6 = ffff8200, %l7 = acea7c83, Mem[0000000010800008] = 0000010b 00000000
	stda	%l6,[%i1+%o6]0x80	! Mem[0000000010800008] = ffff8200 acea7c83
!	%f3  = 80000000, %f3  = 80000000
	fmovs	%f3 ,%f3 		! %f3  = 80000000
!	%l5 = 000000000000ff00, immed = fffff5b8, %l1 = ffffffffffff82ae
	andncc	%l5,-0xa48,%l1		! %l1 = 0000000000000a00, %ccr = 00

p0_label_160:
	fbug,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000011800060] = e907faa7 9efc715c a64400c1 ee677a3f
	prefetch [%i3+0x060],16
p0_b176:
	membar	#Sync			! Added by membar checker (147)
!	%l6 = ffffffffffff8200, %l0 = 00000000000000ae, %l0 = 00000000000000ae
	addcc	%l6,%l0,%l0		! %l0 = ffffffffffff82ae, %ccr = 88
!	Mem[0000000010000020] = 6a945b6e, %l5 = 000000000000ff00
	swap	[%i0+0x020],%l5		! %l5 = 000000006a945b6e
!	Mem[00000000108000c0] = 4c8014d4 28bd7fa6 00193300 0000e394
	prefetcha [%i1+0x0c0]%asi,1

p0_label_161:
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010000000] = ffffff00, %l5 = 000000006a945b6e
	lduba	[%i0+%g0]0x80,%l5	! Annulled
p0_b177:
	membar	#Sync			! Added by membar checker (148)
!	%l0 = ffffffffffff82ae, immed = 00000d93, %l6 = ffffffffffff8200
	orcc	%l0,0xd93,%l6		! %l6 = ffffffffffff8fbf, %ccr = 88
!	Mem[0000000040000010] = 2236f72f, %l7 = 00000000acea7c83
	ldsh	[%o5+0x012],%l7		! %l7 = fffffffffffff72f
	set	p0_b178,%o7
	fble,a,pn %fcc1,p0_near_1_le	! Branch Taken, %fcc1 = 0

p0_label_162:
!	%l3 = 00000000f3e9dcb2, Mem[0000000031000044] = 31f5008b
	stw	%l3,[%o2+0x044]		! Mem[0000000031000044] = f3e9dcb2
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x0b2,%g2
p0_b178:
!	Registers modified during the branch to p0_near_1
!	%l1  = 772c800000000000
	membar	#Sync			! Added by membar checker (149)
!	%l1 = 772c800000000000, immed = 0000001b, %l4 = 0000000000010e93
	sll	%l1,0x01b,%l4		! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[000000003100004b] = ffffca03
	stb	%l4,[%o2+0x04b]		! Mem[0000000031000048] = ffffca00
!	Mem[0000000010800008] = ffff8200 acea7c83, %l0 = ffff82ae, %l1 = 00000000
	ldda	[%i1+%o6]0x80,%l0	! %l0 = 00000000ffff8200 00000000acea7c83
!	%l2 = 000000004b56ffff, %l1 = 00000000acea7c83, %l4 = 0000000000000000
	tsubcc	%l2,%l1,%l4		! %l4 = ffffffff9e6c837c, %ccr = 9b

p0_label_163:
	bvs,a	p0_b179			! Branch Taken, %ccr = 9b, CWP = 0
!	Mem[0000000010000070] = 2c039311, %l5 = 000000006a945b6e
	ldub	[%i0+0x072],%l5		! %l5 = 0000000000000093
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x0b3,%g2
p0_b179:
	membar	#Sync			! Added by membar checker (150)
!	%l6 = ffff8fbf, %l7 = fffff72f, Mem[0000000010000008] = 4b56ffff f3e9dcb2
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000010000008] = ffff8fbf fffff72f
!	%l4 = ffffffff9e6c837c, immed = 00000ab6, %l3 = 00000000f3e9dcb2
	orcc	%l4,0xab6,%l3		! %l3 = ffffffff9e6c8bfe, %ccr = 88
!	Mem[0000000032000008] = 6b78d8c7, %l7 = fffffffffffff72f
	ldsb	[%o4+0x008],%g2		! %g2 = 000000000000006b

p0_label_164:
!	Mem[0000000010000080] = 399290d1 7d05e794 93873cd6 6c83c24b
	prefetch [%i0+0x080],20
!	%l7 = fffffffffffff72f, %l0 = 00000000ffff8200, %l6 = ffffffffffff8fbf
	srlx	%l7,%l0,%l6		! %l6 = fffffffffffff72f
!	%l2 = 000000004b56ffff, Mem[0000000010000074] = 1675deef
	stba	%l2,[%i0+0x074]%asi	! Mem[0000000010000074] = ff75deef
!	%l6 = fffffffffffff72f, %l1 = 00000000acea7c83, %l2 = 000000004b56ffff
	xnorcc	%l6,%l1,%l2		! %l2 = 00000000acea7453, %ccr = 08
!	%l7 = fffffffffffff72f, Mem[0000000011800008] = 7fffffff
	stba	%l7,[%i3+%o6]0x80	! Mem[0000000011800008] = 2fffffff

p0_label_165:
!	%l3 = ffffffff9e6c8bfe, immed = fffff361, %l0 = 00000000ffff8200
	tsubcc	%l3,-0xc9f,%l0		! %l0 = ffffffff9e6c989d, %ccr = 9b
!	Mem[00000000110000e0] = 242bc1b5 c6ce0a87 ffdbfe25 8ef0da4b
	prefetcha [%i2+0x0e0]%asi,21
!	%l1 = 00000000acea7c83, %l0 = ffffffff9e6c989d, %l0 = ffffffff9e6c989d
	addc	%l1,%l0,%l0		! %l0 = 000000004b571521
!	Mem[00000000118000d4] = ffba851e, %l7 = fffffffffffff72f
	ldsha	[%i3+0x0d4]%asi,%l7	! %l7 = ffffffffffffffba
!	%f16 = 00000000 00000000, %f18 = 00000000 00000000
	fcmped	%fcc1,%f16,%f18		! %fcc1 = 0

p0_label_166:
!	%l1 = 00000000acea7c83, Mem[000000003000004c] = 00000000
	stwa	%l1,[%o0+0x04c]%asi	! Mem[000000003000004c] = acea7c83
!	%f2  = c0a5a79b 80000000, %f12 = 00000000 00000000
	fcmped	%fcc2,%f2 ,%f12		! %fcc2 = 1
!	%l7 = ffffffffffffffba, Mem[0000000011800088] = 1d39467c93ed2588
	stx	%l7,[%i3+0x088]		! Mem[0000000011800088] = ffffffffffffffba
!	%l4 = ffffffff9e6c837c, Mem[0000000011800000] = 254382b0
	stba	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = 7c4382b0
!	%f16 = 00000000 00000000, %f31 = 00000000
	fdtoi	%f16,%f31		! %f31 = 00000000

p0_label_167:
	fbe,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010000000] = ffffff00, %l7 = ffffffffffffffba
	lduwa	[%i0+%g0]0x80,%l7	! Annulled
p0_b180:
	membar	#Sync			! Added by membar checker (151)
!	%l1 = 00000000acea7c83, %l0 = 000000004b571521, %l0 = 000000004b571521
	xorcc	%l1,%l0,%l0		! %l0 = 00000000e7bd69a2, %ccr = 08
!	%l2 = 00000000acea7453, %l3 = ffffffff9e6c8bfe, %l2 = 00000000acea7453
	srlx	%l2,%l3,%l2		! %l2 = 0000000000000000
!	Mem[0000000010800040] = fc03a46e90316c6d, %l0 = 00000000e7bd69a2
	ldx	[%i1+0x040],%l0		! %l0 = fc03a46e90316c6d

p0_label_168:
!	call to call_3, CWP = 0
	call	p0_call_3_le
!	Mem[0000000011800060] = e907faa7 9efc715c a64400c1 ee677a3f
	prefetch [%i3+0x060],4
!	Registers modified during the branch to p0_call_3
!	%l0  = fc03a46e9031753e
!	%l2  = ffffffffffffff6f
!	%l3  = 0000000081400980
!	%l4  = 0000000000000036
!	%f10 = 80000000 00000000, %f24 = 00000000 00000000
	fcmpd	%fcc0,%f10,%f24		! %fcc0 = 0
!	%l0 = 9031753e, %l1 = acea7c83, Mem[0000000031000008] = ffffca03 a0342f53
	std	%l0,[%o2+0x008]	! Mem[0000000031000008] = 9031753e acea7c83
	fblg,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0

p0_label_169:
!	%l1 = 00000000acea7c83, Mem[0000000010800000] = ff000000
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010800000] = 7c830000
p0_b181:
	set	p0_b182,%o7
	fbge,a	p0_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800028] = 1c16a88b, %l7 = ffffffffffffffba
	ldsw	[%i3+0x028],%l7		! %l7 = 000000001c16a88b
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x0b6,%g2
p0_b182:
!	Registers modified during the branch to p0_far_2
!	%l3  = ffffffff7ebff6ec
	bcc,a	p0_b183			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000031800004] = ed7ebd44, %l2 = ffffffffffffff6f
	ldub	[%o3+0x006],%l2		! %l2 = 00000000000000bd
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x0b7,%g2
p0_b183:

p0_label_170:
	membar	#Sync			! Added by membar checker (152)
!	Branch On Register, %l2 = 00000000000000bd
	brlz,pt	%l2,p0_not_taken_0	! Branch Not Taken
!	%l5 = 0000000000000093, Mem[0000000011800000] = 7c4382b0
	stba	%l5,[%i3+%g0]0x80	! Mem[0000000011800000] = 934382b0
p0_b184:
	membar	#Sync			! Added by membar checker (153)
!	%l4 = 0000000000000036, immed = 000007b0, %l2 = 00000000000000bd
	and	%l4,0x7b0,%l2		! %l2 = 0000000000000030
!	Mem[0000000011800018] = 00000000 000000bd, %l2 = 0000000000000030, %l1 = 00000000acea7c83
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 000000009e88f71b
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 80

p0_label_171:
!	%l4 = 0000000000000036, Mem[000000001000008e] = 6c83c24b
	stb	%l4,[%i0+0x08e]		! Annulled
p0_b185:
	membar	#Sync			! Added by membar checker (154)
!	Mem[00000000110000c0] = b188fd9b 4f18568c 2df742d9 4e6c8671
	prefetcha [%i2+0x0c0]%asi,16
	set	p0_b186,%o7
	fbule,a,pt %fcc3,p0_near_2_he	! Branch Taken, %fcc3 = 0
!	%l0 = 9031753e, %l1 = 9e88f71b, Mem[0000000011000000] = 005df72f 75f1665c
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000011000000] = 9031753e 9e88f71b
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x0ba,%g2
p0_b186:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000acea
!	%l1  = 03fc5b916fce8211
!	%l3  = 0000000000007c83
!	%l5  = ffffffffffffffac
!	%l6  = fc03a46e9031f1c1
!	%l7  = 0000000000a88e8b
	membar	#Sync			! Added by membar checker (155)
!	Mem[0000000010800020] = 249b7140, %l7 = 0000000000a88e8b
	lduh	[%i1+0x020],%l7		! %l7 = 000000000000249b

p0_label_172:
!	%l1 = 03fc5b916fce8211, immed = 00000f47, %l2 = 0000000000000030
	sub	%l1,0xf47,%l2		! %l2 = 03fc5b916fce72ca
	set	p0_b187,%o7
	fblg,a,pn %fcc2,p0_near_3_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000010800008] = ffff8200 acea7c83, %l4 = 00000036, %l5 = ffffffac
	ldda	[%i1+%o6]0x80,%l4	! %l4 = 00000000ffff8200 00000000acea7c83
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0bb,%g2
p0_b187:
!	Registers modified during the branch to p0_near_3
!	%l0  = 00011f0bb1a28c3d
!	%l3  = fffffffffff11133
!	%l7  = fffffffffffffffd
!	call to call_2, CWP = 0
	call	p0_call_2_le
!	%l0 = 00011f0bb1a28c3d, Mem[0000000031800040] = ffffffff
	stw	%l0,[%o3+0x040]		! Mem[0000000031800040] = b1a28c3d
!	Registers modified during the branch to p0_call_2
!	%l2  = 00000000ffffffff
!	%l3  = ffffc71d58497fe0
!	%l4  = acea276796b78600
!	%l7  = 00000000b58856de

p0_label_173:
	membar	#Sync			! Added by membar checker (156)
!	%f6  = 419b12cb, %f25 = 00000000
	fcmps	%fcc1,%f6 ,%f25		! %fcc1 = 2
!	%l2 = 00000000ffffffff, %l4 = acea276796b78600, %y  = acea2767
	udivx	%l2,%l4,%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, immed = fffff442, %y  = acea2767
	udivx	%l6,-0xbbe,%l4		! %l4 = 0000000000000000
!	Mem[00000000118000a0] = 043f7e9e fff85fcd 00000000 00000000
	prefetcha [%i3+0x0a0]%asi,0
!	Mem[0000000010000028] = 850c6a4a, %l0 = 00011f0bb1a28c3d
	lduba	[%i0+0x029]%asi,%l0	! %l0 = 000000000000000c

p0_label_174:
!	%l6 = 0000000000000000, Mem[0000000031000048] = ffffca000221dd80
	stxa	%l6,[%o2+0x048]%asi	! Mem[0000000031000048] = 0000000000000000
!	Mem[0000000010000000] = ffffff00, %l2 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
	set	p0_b188,%o7
	fble	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800008] = 2fffffff, %l3 = ffffc71d58497fe0
	ldstuba	[%i3+%o6]0x80,%l3	! %l3 = 000000000000002f
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x0bc,%g2
p0_b188:
!	Registers modified during the branch to p0_far_1
!	%l2  = 000000053dae18cc
!	%l5  = 000000000000ff00
!	%l7  = 000000053dae18cc
	bleu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_175:
!	Mem[00000000100000d0] = 4204f1a8, %l4 = 0000000000000000
	lduh	[%i0+0x0d2],%l4		! Annulled
p0_b189:
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011800080] = 454734c9 42e045b5 ffffffff ffffffba
	prefetch [%i3+0x080],4	! Annulled
p0_b190:
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011000008] = ffffaeb1746df82e, %l2 = 000000053dae18cc
	ldxa	[%i2+%o6]0x80,%l2	! Annulled
p0_b191:

p0_label_176:
	membar	#Sync			! Added by membar checker (157)
!	%l2 = 000000053dae18cc, immed = 00000405, %l2 = 000000053dae18cc
	orn	%l2,0x405,%l2		! %l2 = fffffffffffffbfe
!	Mem[0000000011800080] = 454734c9 42e045b5 ffffffff ffffffba
	prefetch [%i3+0x080],16
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = 000000053dae18cc, Mem[00000000100000b0] = f53a7c5c34bc85c9
	stx	%l7,[%i0+0x0b0]		! Annulled
p0_b192:
	ble,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_177:
!	Mem[0000000011000008] = ffffaeb1746df82e, %l3 = 000000000000002f
	ldxa	[%i2+%o6]0x80,%l3	! Annulled
p0_b193:
	membar	#Sync			! Added by membar checker (158)
!	Branch On Register, %l7 = 000000053dae18cc
	brgz,a,pt %l7,p0_b194		! Branch Taken
!	Mem[000000003080004c] = 81400980, %l3 = 000000000000002f
	swap	[%o1+0x04c],%l3		! %l3 = 0000000081400980
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x0c2,%g2
p0_b194:
!	Jump to jmpl_0, CWP = 0
	set	p0_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000011000000] = 9031753e, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = ffffffff9031753e
!	Registers modified during the branch to p0_jmpl_0
!	%l5  = 0000000000000200
!	%l6  = 00000000ffffc71d

p0_label_178:
	membar	#Sync			! Added by membar checker (159)
!	%f28 = 419b12cb 00000000, %f28 = 419b12cb 00000000
	fcmpd	%fcc1,%f28,%f28		! %fcc1 = 0
!	%l7 = 000000053dae18cc, immed = 00000008, %l3 = 0000000081400980
	srlx	%l7,0x008,%l3		! %l3 = 00000000053dae18
!	%l3 = 00000000053dae18, %l6 = 00000000ffffc71d, %l5 = 0000000000000200
	xnor	%l3,%l6,%l5		! %l5 = ffffffff053d96fa
!	%l3 = 00000000053dae18, immed = fffff44f, %l4 = 0000000000000000
	taddcc	%l3,-0xbb1,%l4		! %l4 = 00000000053da267, %ccr = 13
!	%f16 = 00000000 00000000, %f30 = 00000000 00000000
	fabsd	%f16,%f30		! %f30 = 00000000 00000000

p0_label_179:
	set	p0_b195,%o7
	fbuge	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800008] = ffff8200 acea7c83, %l2 = fffffbfe, %l3 = 053dae18
	ldda	[%i1+%o6]0x80,%l2	! %l2 = 00000000ffff8200 00000000acea7c83
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x0c3,%g2
p0_b195:
!	Registers modified during the branch to p0_far_1
!	%l2  = 000000053dae18cc
!	%l5  = 000000000000ff00
!	%l7  = 0000000542ebbb33
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000108000a4] = a0342f53, %l1 = 03fc5b916fce8211
	ldsb	[%i1+0x0a5],%l1		! Annulled
p0_b196:
	bcc,a	p0_b197			! Branch Taken, %ccr = 00, CWP = 0

p0_label_180:
!	Mem[0000000010800008] = ffff8200, %l4 = 00000000053da267
	lduha	[%i1+%o6]0x80,%l4	! %l4 = 000000000000ffff
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x0c5,%g2
p0_b197:
	membar	#Sync			! Added by membar checker (160)
!	%l5 = 000000000000ff00, Mem[0000000010800008] = ffff8200
	stha	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = ff008200
!	Mem[0000000031000008] = 9031753e, %l3 = 00000000acea7c83
	ldstuba	[%o2+0x008]%asi,%l3	! %l3 = 0000000000000090
	set	p0_b198,%o7
	fblg,pn	%fcc2,p0_near_2_le	! Branch Taken, %fcc2 = 1
!	%l0 = 000000000000000c, Mem[0000000010800090] = 30490453
	stw	%l0,[%i1+0x090]		! Mem[0000000010800090] = 0000000c
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p0_branch_failed
	mov	0x0c6,%g2
p0_b198:
!	Registers modified during the branch to p0_near_2
!	%l3  = ffffffffffffc71d

p0_label_181:
	membar	#Sync			! Added by membar checker (161)
!	%l2 = 000000053dae18cc, Mem[0000000010000008] = ffff8fbf
	stba	%l2,[%i0+%o6]0x80	! Mem[0000000010000008] = ccff8fbf
!	%f6  = 419b12cb 00000000, %f0  = 80000000
	fdtos	%f6 ,%f0 		! %f0  = 4cd89658
!	Mem[000000001000006c] = 24eb2dd5, %l4 = 000000000000ffff
	ldsb	[%i0+0x06c],%l4		! %l4 = 0000000000000024
!	Mem[0000000012000020] = 7672c4b86919544d, %l7 = 0000000542ebbb33
	ldx	[%i4+0x020],%l7		! %l7 = 7672c4b86919544d
!	Mem[0000000030000008] = ffffffffffffffff, %l3 = ffffffffffffc71d
	ldx	[%o0+0x008],%l3		! %l3 = ffffffffffffffff

p0_label_182:
!	%l6 = 00000000ffffc71d, Mem[0000000031800008] = 0000000c6fce8211
	stxa	%l6,[%o3+0x008]%asi	! Mem[0000000031800008] = 00000000ffffc71d
!	%l6 = 00000000ffffc71d, %l4 = 0000000000000024, %l5 = 000000000000ff00
	sllx	%l6,%l4,%l5		! %l5 = fffc71d000000000
!	Mem[0000000040000014] = 1b040b17, %l4 = 0000000000000024
	ldsb	[%o5+0x015],%l4		! %l4 = 0000000000000004
!	%f22 = 80000000 00000000, %f16 = 00000000 00000000
	fcmpd	%fcc0,%f22,%f16		! %fcc0 = 0
!	Mem[0000000011000080] = 0000c849 2ddabb51, %l6 = ffffc71d, %l7 = 6919544d
	ldda	[%i2+0x080]%asi,%l6	! %l6 = 000000000000c849 000000002ddabb51

p0_label_183:
!	Mem[0000000030000040] = 161a1314 27efc08a, %l6 = 0000c849, %l7 = 2ddabb51
	ldda	[%o0+0x040]%asi,%l6	! %l6 = 00000000161a1314 0000000027efc08a
!	Mem[00000000100000d0] = 4204f1a8, %l5 = fffc71d000000000
	ldsba	[%i0+0x0d3]%asi,%l5	! %l5 = ffffffffffffffa8
!	Mem[0000000030800000] = ffffafdf, %l6 = 00000000161a1314
	swapa	[%o1+0x000]%asi,%l6	! %l6 = 00000000ffffafdf
	set	p0_b199,%o7
	fbue,pn	%fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 0
!	%l6 = 00000000ffffafdf, Mem[0000000031800040] = b1a28c3d
	sth	%l6,[%o3+0x040]		! Mem[0000000031800040] = afdf8c3d
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p0_branch_failed
	mov	0x0c7,%g2
p0_b199:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000000000acea
!	%l1  = 00000000ffffafd3
!	%l3  = 0000000000007c83
!	%l5  = ffffffffffffffac
!	%l6  = 0000000000007c8f
!	%l7  = 0000000005d84207

p0_label_184:
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000004] = 81400980, %l5 = ffffffffffffffac
	swap	[%o0+0x004],%l5		! Annulled
p0_b200:
	membar	#Sync			! Added by membar checker (162)
!	%l7 = 0000000005d84207, Mem[0000000010000008] = ccff8fbf
	stha	%l7,[%i0+%o6]0x80	! Mem[0000000010000008] = 42078fbf
	bleu	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011800000] = 934382b0, %l0 = 000000000000acea
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000934382b0
p0_b201:

p0_label_185:
	membar	#Sync			! Added by membar checker (163)
!	%f0  = 4cd89658, %f2  = c0a5a79b 80000000
	fstox	%f0 ,%f2 		! %f2  = 00000000 06c4b2c0
!	%l5 = ffffffffffffffac, %l1 = 00000000ffffafd3, %y  = 00000005
	udiv	%l5,%l1,%l3		! %l3 = 0000000000000006
	set	p0_b202,%o7
	fbue,a	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011000074] = 17cdf5b6, %l3 = 0000000000000006
	ldub	[%i2+0x077],%l3		! %l3 = 00000000000000b6
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x0ca,%g2
p0_b202:
!	Registers modified during the branch to p0_far_1
!	%l2  = 0000220e044b0710
!	%l5  = 000000000000ff00
!	%l7  = 0000220e044b0714
	membar	#Sync			! Added by membar checker (164)
!	%l5 = 000000000000ff00
	sethi	%hi(0x34c22000),%l5	! %l5 = 0000000034c22000

p0_label_186:
!	Mem[0000000031000004] = 0000ff00, %l5 = 0000000034c22000
	ldswa	[%o2+0x004]%asi,%l5	! %l5 = 000000000000ff00
!	%f20 = 00000000 00000000, %f12 = 00000000 00000000, %f18 = 00000000 00000000
	fsubd	%f20,%f12,%f18		! %f18 = 00000000 00000000
!	Mem[0000000030000044] = 27efc08a, %l5 = 000000000000ff00
	ldswa	[%o0+0x044]%asi,%l5	! %l5 = 0000000027efc08a
!	%l3 = 00000000000000b6, immed = 00000003, %l3 = 00000000000000b6
	sra	%l3,0x003,%l3		! %l3 = 0000000000000016
!	Mem[0000000011000000] = 9031753e, %l2 = 0000220e044b0710
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffff90

p0_label_187:
	set	p0_b203,%o7
	fbue,a,pn %fcc3,p0_near_0_le	! Branch Taken, %fcc3 = 0
!	%l7 = 0000220e044b0714, Mem[00000000108000f3] = e4eadb8e
	stb	%l7,[%i1+0x0f3]		! Mem[00000000108000f0] = e4eadb14
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p0_branch_failed
	mov	0x0cb,%g2
p0_b203:
!	Registers modified during the branch to p0_near_0
!	%l0  = 00000000ffffa5ef
!	%l7  = 000000000000006b
	membar	#Sync			! Added by membar checker (165)
!	%f4  = 00000000, %f2  = 00000000, %f21 = 00000000
	fadds	%f4 ,%f2 ,%f21		! %f21 = 00000000
!	Mem[0000000040000010] = 22fff72f, %l0 = 00000000ffffa5ef
	ldstuba	[%o5+0x010]%asi,%l0	! %l0 = 0000000000000022
!	Mem[0000000011800080] = 454734c9 42e045b5 ffffffff ffffffba
	prefetch [%i3+0x080],1

p0_label_188:
!	Mem[0000000010800020] = 249b7140 003e29da 9395d3a2 feffca4d
	prefetcha [%i1+0x020]%asi,0
!	%l6 = 0000000000007c8f, %l6 = 0000000000007c8f, %l3 = 0000000000000016
	srl	%l6,%l6,%l3		! %l3 = 0000000000000000
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000010800008] = ff008200, %l3 = 0000000000000000
	ldstuba	[%i1+%o6]0x80,%l3	! %l3 = 00000000000000ff
!	Registers modified during the branch to p0_jmpl_2
!	%l2  = fffffffffffac380
!	%l3  = ffffffff80000000
	fbn,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_189:
!	Mem[0000000011000000] = 9031753e, %l0 = 0000000000000022
	ldstuba	[%i2+%g0]0x80,%l0	! Annulled
p0_b204:
	membar	#Sync			! Added by membar checker (166)
!	%l7 = 000000000000006b, immed = 0000001d, %l0 = 0000000000000022
	sll	%l7,0x01d,%l0		! %l0 = 0000000d60000000
	fbug,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000010000008] = 42078fbf fffff72f, %l2 = fffac380, %l3 = 80000000
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 0000000042078fbf 00000000fffff72f
p0_b205:
	set	p0_b206,%o7
	fble,a	p0_far_2_he	! Branch Taken, %fcc0 = 0

p0_label_190:
!	Mem[0000000010000008] = 42078fbf, %l3 = 00000000fffff72f
	ldsha	[%i0+%o6]0x80,%l3	! %l3 = 0000000000004207
!	The following code should not be executed
	nop
	ba	p0_branch_failed
	mov	0x0ce,%g2
p0_b206:
!	Registers modified during the branch to p0_far_2
!	%l3  = ffffffffd8107d72
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011800000] = 0000acea, %l1 = 00000000ffffafd3
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
p0_b207:
	membar	#Sync			! Added by membar checker (167)
	set	p0_b208,%o7
	fbue,a,pn %fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000011800000] = ff00acea 435df72f ffffffff ffe28bae
	prefetch [%i3+0x000],3
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x0d0,%g2
p0_b208:
!	Registers modified during the branch to p0_near_1
!	%l1  = 0000000000000000
!	%l3  = 0000000000000029
!	%l4  = 0000000000a6e399
!	%l5  = ffffffffffffffff

p0_label_191:
	membar	#Sync			! Added by membar checker (168)
!	Mem[0000000040000010] = fffff72f1b040b17, %l5 = ffffffffffffffff
	ldxa	[%o5+0x010]%asi,%l5	! %l5 = fffff72f1b040b17
	fbue,pn	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000031800004] = ed7ebd44, %l4 = 0000000000a6e399
	lduh	[%o3+0x004],%l4		! %l4 = 000000000000ed7e
p0_b209:
	membar	#Sync			! Added by membar checker (169)
!	%l3 = 0000000000000029, %l5 = fffff72f1b040b17, %l0 = 0000000d60000000
	xorcc	%l3,%l5,%l0		! %l0 = fffff72f1b040b3e, %ccr = 80
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 80

p0_label_192:
!	 Annulled
	ldda	[%i2+%o6]0x80,%l4
p0_b210:
	membar	#Sync			! Added by membar checker (170)
!	%f24 = 00000000, %f26 = 00000000 00000000
	fstox	%f24,%f26		! %f26 = 00000000 00000000
!	%f26 = 00000000 00000000, %f4  = 00000000 80000000
	fnegd	%f26,%f4 		! %f4  = 80000000 00000000
!	%l1 = 0000000000000000, immed = fffff3da, %l5 = fffff72f1b040b17
	addccc	%l1,-0xc26,%l5		! %l5 = fffffffffffff3da, %ccr = 88
!	%l3 = 0000000000000029, Mem[0000000010800096] = fc7766d5
	stha	%l3,[%i1+0x096]%asi	! Mem[0000000010800094] = fc770029

p0_label_193:
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 00007c8f, %l7 = 0000006b, Mem[0000000030000040] = 161a1314 27efc08a
	std	%l6,[%o0+0x040]	! Mem[0000000030000040] = 00007c8f 0000006b
p0_b211:
	membar	#Sync			! Added by membar checker (171)
!	Mem[0000000011000080] = 0000c849 2ddabb51 53a9057f 9da8bf35
	prefetch [%i2+0x080],1
	set	p0_b212,%o7
	fble,a	p0_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001100007c] = 8e092aa1, %l7 = 000000000000006b
	ldsh	[%i2+0x07e],%l7		! %l7 = 0000000000002aa1
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p0_branch_failed
	mov	0x0d4,%g2
p0_b212:
!	Registers modified during the branch to p0_far_3
!	%l2  = 0000000000000d82
!	%l4  = 000008d0e4fbf431
!	%l5  = 00000000000002dc
!	%l6  = 0000000000000000

p0_label_194:
	bneg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[00000000100000a0] = dbade58d ce0f9fac 62f42d55 109941d0
	prefetch [%i0+0x0a0],4	! Annulled
p0_b213:
	membar	#Sync			! Added by membar checker (172)
!	%l4 = 000008d0e4fbf431, %l2 = 0000000000000d82, %y  = 00000000
	sdivcc	%l4,%l2,%l5		! %l5 = 000000000010f3b5, %ccr = 00
!	%f31 = 00000000, %f9  = d2000000, %f3  = 06c4b2c0
	fdivs	%f31,%f9 ,%f3 		! %f3  = 80000000
	fbul	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_195:
!	Mem[0000000011800008] = ffffffff, %l4 = 000008d0e4fbf431
	ldstuba	[%i3+%o6]0x80,%l4	! %l4 = 00000000000000ff
p0_b214:
	membar	#Sync			! Added by membar checker (173)
!	%l0 = fffff72f1b040b3e, immed = 0000049c, %l6 = 0000000000000000
	xor	%l0,0x49c,%l6		! %l6 = fffff72f1b040fa2
!	%l0 = fffff72f1b040b3e, %l4 = 00000000000000ff, %l2 = 0000000000000d82
	addccc	%l0,%l4,%l2		! %l2 = fffff72f1b040c3d, %ccr = 80
!	Branch On Register, %l4 = 00000000000000ff
	brgez,a,pt %l4,p0_b215		! Branch Taken
!	Mem[0000000031000046] = f3e9dcb2, %l5 = 000000000010f3b5
	ldstub	[%o2+0x046],%l5		! %l5 = 00000000000000dc
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p0_branch_failed
	mov	0x0d7,%g2
p0_b215:

p0_label_196:
	membar	#Sync			! Added by membar checker (174)
!	%l4 = 000000ff, %l5 = 000000dc, Mem[00000000100000e8] = 2decf098 89e67855
	std	%l4,[%i0+0x0e8]	! Mem[00000000100000e8] = 000000ff 000000dc
!	%f11 = 00000000, %f10 = 80000000
	fabss	%f11,%f10		! %f10 = 00000000
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000011000000] = 9031753e, %l3 = 0000000000000029
	ldstuba	[%i2+%g0]0x80,%l3	! Annulled
p0_b216:
	membar	#Sync			! Added by membar checker (175)
!	Mem[0000000010800050] = 9031753e 00000090, %l7 = 0000000000002aa1, %l2 = fffff72f1b040c3d
	add	%i1,0x50,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 1ff0c9f224784d1e

p0_label_197:
!	Mem[00000000108000bc] = 8f5fba0d, %l1 = 00000000, %l4 = 000000ff
	add	%i1,0xbc,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000008f5fba0d
	nop
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldd	[%i2+0x050],%l4
p0_b217:
	membar	#Sync			! Added by membar checker (176)
!	%l1 = 0000000000000000
	sethi	%hi(0xbc73dc00),%l1	! %l1 = 00000000bc73dc00

p0_label_198:
!	%l0 = fffff72f1b040b3e, Mem[0000000010000000] = ffffff0080000000
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000010000000] = fffff72f1b040b3e
!	%l5 = 00000000000000dc, Mem[0000000031000044] = f3e9ffb2
	stb	%l5,[%o2+0x044]		! Mem[0000000031000044] = dce9ffb2
!	%l1 = 00000000bc73dc00, Mem[0000000011000008] = ffffaeb1
	stwa	%l1,[%i2+%o6]0x80	! Mem[0000000011000008] = bc73dc00
	fbug,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l1 = 00000000bc73dc00, Mem[0000000012000008] = 448d5504
	stwa	%l1,[%i4+%o6]0x80	! Annulled
p0_b218:

p0_label_199:
	membar	#Sync			! Added by membar checker (177)
!	Mem[0000000032000020] = 881b2ad7 861878d1 a417c71d 4b729f64
	prefetcha [%o4+0x020]%asi,23
	ble,a	p0_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000010000060] = 1c25b2c1 6ef7b265 af4b8336 24eb2dd5
	prefetch [%i0+0x060],0	! Annulled
p0_b219:
	membar	#Sync			! Added by membar checker (178)
!	Mem[0000000010800014] = 98f569be, %l7 = 0000000000002aa1
	lduwa	[%i1+0x014]%asi,%l7	! %l7 = 0000000098f569be
	set	p0_b220,%o7
	fbuge,a,pn %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 0

p0_label_200:
!	Mem[0000000040000014] = 1b040b17, %l6 = fffff72f1b040fa2
	lduh	[%o5+0x014],%l6		! %l6 = 0000000000001b04
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0dc,%g2
p0_b220:
!	Registers modified during the branch to p0_near_0
!	%l0  = 00000000bc73d209
!	%l7  = e00f360d54d808ec
	membar	#Sync			! Added by membar checker (179)
	fbul,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000003080000c] = 58497fe0, %l7 = e00f360d54d808ec
	lduh	[%o1+0x00c],%l7		! %l7 = 0000000000005849
p0_b221:
	membar	#Sync			! Added by membar checker (180)
!	Mem[00000000110000c0] = b188fd9b 4f18568c 2df742d9 4e6c8671
	prefetcha [%i2+0x0c0]%asi,21
!	Mem[0000000012800094] = bc575bbf, %l3 = 0000000000000029
	ldsb	[%i5+0x095],%l3		! %l3 = 0000000000000057

!	End of Random Code for Processor 0

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x000]		! Set processor 0 done flag

!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000bc73d209
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000bc73dc00
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 1ff0c9f224784d1e
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000057
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000008f5fba0d
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000dc
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000001b04
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000005849
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_temp,%g1
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 4cd89658 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 80000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 80000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 419b12cb 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 d2000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 80000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 419b12cb 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p0_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = fffff72f1b040b3e
	ldx	[%i0+0x000],%g3		! Observed data at 0000000010000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 42078fbffffff72f
	ldx	[%i0+0x008],%g3		! Observed data at 0000000010000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = bffddce5b58856de
	ldx	[%i0+0x018],%g3		! Observed data at 0000000010000018
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 0000ff00d264d1c7
	ldx	[%i0+0x020],%g3		! Observed data at 0000000010000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 2c039311ff75deef
	ldx	[%i0+0x070],%g3		! Observed data at 0000000010000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = ffffffffffffffeb
	ldx	[%i0+0x0c8],%g3		! Observed data at 00000000100000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 000000ff000000dc
	ldx	[%i0+0x0e8],%g3		! Observed data at 00000000100000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 7c8300000000e394
	ldx	[%i1+0x000],%g3		! Observed data at 0000000010800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff008200acea7c83
	ldx	[%i1+0x008],%g3		! Observed data at 0000000010800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 3cb02dae98f569be
	ldx	[%i1+0x010],%g3		! Observed data at 0000000010800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 9395d3a2feffca4d
	ldx	[%i1+0x028],%g3		! Observed data at 0000000010800028
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 00000070f48baf51
	ldx	[%i1+0x048],%g3		! Observed data at 0000000010800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 6c441ef84b623b8e
	ldx	[%i1+0x058],%g3		! Observed data at 0000000010800058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 56d2af53497e7551
	ldx	[%i1+0x060],%g3		! Observed data at 0000000010800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 0000003400000f14
	ldx	[%i1+0x068],%g3		! Observed data at 0000000010800068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 8ca2e2bf040d01b2
	ldx	[%i1+0x070],%g3		! Observed data at 0000000010800070
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 0000000cfc770029
	ldx	[%i1+0x090],%g3		! Observed data at 0000000010800090
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 7eed7faba0342f53
	ldx	[%i1+0x0a0],%g3		! Observed data at 00000000108000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = 67fe395f0000ffff
	ldx	[%i1+0x0b0],%g3		! Observed data at 00000000108000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 001933000000e394
	ldx	[%i1+0x0c8],%g3		! Observed data at 00000000108000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 13e5da9e0dba7cf5
	ldx	[%i1+0x0d8],%g3		! Observed data at 00000000108000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = b58856de5317c06c
	ldx	[%i1+0x0e0],%g3		! Observed data at 00000000108000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 00000000013240f5
	ldx	[%i1+0x0e8],%g3		! Observed data at 00000000108000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = e4eadb1496d86923
	ldx	[%i1+0x0f0],%g3		! Observed data at 00000000108000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f0,%g4

	set	p0_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 9031753e9e88f71b
	ldx	[%i2+0x000],%g3		! Observed data at 0000000011000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = bc73dc00746df82e
	ldx	[%i2+0x008],%g3		! Observed data at 0000000011000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 9573563e000000ff
	ldx	[%i2+0x010],%g3		! Observed data at 0000000011000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 622c64ef010e1da6
	ldx	[%i2+0x030],%g3		! Observed data at 0000000011000030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x038],%g2		! Expect data = 63c1c9ff8ca2e2bf
	ldx	[%i2+0x038],%g3		! Observed data at 0000000011000038
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x048],%g2		! Expect data = f427922836fd4d7c
	ldx	[%i2+0x048],%g3		! Observed data at 0000000011000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 25d61c2100000000
	ldx	[%i2+0x058],%g3		! Observed data at 0000000011000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x078],%g2		! Expect data = ee02900b8e092aa1
	ldx	[%i2+0x078],%g3		! Observed data at 0000000011000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x080],%g2		! Expect data = 0000c8492ddabb51
	ldx	[%i2+0x080],%g3		! Observed data at 0000000011000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = a689834000000034
	ldx	[%i2+0x0f0],%g3		! Observed data at 00000000110000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = b6df414f3ae00000
	ldx	[%i2+0x0f8],%g3		! Observed data at 00000000110000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff00acea435df72f
	ldx	[%i3+0x000],%g3		! Observed data at 0000000011800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffffffffffe28bae
	ldx	[%i3+0x008],%g3		! Observed data at 0000000011800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 000000009e88f71b
	ldx	[%i3+0x018],%g3		! Observed data at 0000000011800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x030],%g2		! Expect data = d54f4eb106ec1024
	ldx	[%i3+0x030],%g3		! Observed data at 0000000011800030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 98690253a40aa2f9
	ldx	[%i3+0x048],%g3		! Observed data at 0000000011800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x068],%g2		! Expect data = a64400c1ee677a3f
	ldx	[%i3+0x068],%g3		! Observed data at 0000000011800068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x078],%g2		! Expect data = ffffffffffff8ab0
	ldx	[%i3+0x078],%g3		! Observed data at 0000000011800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x088],%g2		! Expect data = ffffffffffffffba
	ldx	[%i3+0x088],%g3		! Observed data at 0000000011800088
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 3eb25c9700000000
	ldx	[%i3+0x098],%g3		! Observed data at 0000000011800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 043f7e9e8f5fbe4d
	ldx	[%i3+0x0a0],%g3		! Observed data at 00000000118000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x0a8],%g3		! Observed data at 00000000118000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 09f726f1fd87ffa4
	ldx	[%i3+0x0c0],%g3		! Observed data at 00000000118000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 73a82fbfffba851e
	ldx	[%i3+0x0d0],%g3		! Observed data at 00000000118000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = f11615ff548bfdc5
	ldx	[%i3+0x0e8],%g3		! Observed data at 00000000118000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local4_expect,%g1
	ldx	[%g1+0x070],%g2		! Expect data = 000000053dae18cc
	ldx	[%i4+0x070],%g3		! Observed data at 0000000012000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x070,%g4

	set	p0_local5_expect,%g1
	ldx	[%g1+0x068],%g2		! Expect data = 88b54ced1dffe8cc
	ldx	[%i5+0x068],%g3		! Observed data at 0000000012800068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4

	set	p0_local6_expect,%g1

!	Processor 0, local 6 is clean



!	Check Shared Memory

	set	share0_expect,%g4
	set	p0_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p0_memcheck_share0:
	ldx	[%g4+0x00],%g2	! Expected value = ffffe8cc81400980
	ldx	[%o0+0x00],%g3	! Read value at Mem[0000000030000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = ffffffffffffffff
	ldx	[%o0+0x08],%g3	! Read value at Mem[0000000030000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 00007c8f0000006b
	ldx	[%o0+0x40],%g3	! Read value at Mem[0000000030000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 9558542facea7c83
	ldx	[%o0+0x48],%g3	! Read value at Mem[0000000030000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p0_memcheck_share1:
	ldx	[%g4+0x00],%g2	! Expected value = 161a13141ed0e670
	ldx	[%o1+0x00],%g3	! Read value at Mem[0000000030800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 0000000058497fe0
	ldx	[%o1+0x08],%g3	! Read value at Mem[0000000030800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 00002638194cca03
	ldx	[%o1+0x40],%g3	! Read value at Mem[0000000030800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 0000ff000000002f
	ldx	[%o1+0x48],%g3	! Read value at Mem[0000000030800048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p0_memcheck_share2:
	ldx	[%g4+0x00],%g2	! Expected value = c849a4940000ff00
	ldx	[%o2+0x00],%g3	! Read value at Mem[0000000031000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = ff31753eacea7c83
	ldx	[%o2+0x08],%g3	! Read value at Mem[0000000031000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = d122fecddce9ffb2
	ldx	[%o2+0x40],%g3	! Read value at Mem[0000000031000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 0000000000000000
	ldx	[%o2+0x48],%g3	! Read value at Mem[0000000031000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p0_memcheck_share3:
	ldx	[%g4+0x00],%g2	! Expected value = 8ab36016ed7ebd44
	ldx	[%o3+0x00],%g3	! Read value at Mem[0000000031800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 00000000ffffc71d
	ldx	[%o3+0x08],%g3	! Read value at Mem[0000000031800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = afdf8c3dffffdd80
	ldx	[%o3+0x40],%g3	! Read value at Mem[0000000031800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 82114a3affffff92
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
	addccc	%l3,0x9ce,%l7
	subccc	%l1,%l7,%l0
	or	%l4,0xc49,%l7
	stw	%l7,[%i3+0x0a4]		! Mem[00000000118000a4]
	xnor	%l2,%l4,%l7
	prefetch [%i1+0x080],1
	done

p0_trap1o:
	addccc	%l3,0x9ce,%l7
	subccc	%l1,%l7,%l0
	or	%l4,0xc49,%l7
	stw	%l7,[%o3+0x0a4]		! Mem[00000000118000a4]
	xnor	%l2,%l4,%l7
	prefetch [%o1+0x080],1
	done


p0_trap2e:
	prefetch [%i3+0x080],23
	addc	%l4,%l2,%l1
	sdivcc	%l2,-0xc45,%l3
	prefetch [%i2+0x0e0],4
	sth	%l4,[%i2+0x0fe]		! Mem[00000000110000fe]
	std	%l0,[%o2+0x008]		! Mem[0000000031000008]
	done

p0_trap2o:
	prefetch [%o3+0x080],23
	addc	%l4,%l2,%l1
	sdivcc	%l2,-0xc45,%l3
	prefetch [%o2+0x0e0],4
	sth	%l4,[%o2+0x0fe]		! Mem[00000000110000fe]
	std	%l0,[%i2+0x008]		! Mem[0000000031000008]
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
	ldx	[%g1+0x000],%l0	! %l0 = c1320d006ad52b8b
	ldx	[%g1+0x008],%l1	! %l1 = c7d1e1ff83d88441
	ldx	[%g1+0x010],%l2	! %l2 = 63c1c9ff8ca2e2bf
	ldx	[%g1+0x018],%l3	! %l3 = 401631ffbfeacffb
	ldx	[%g1+0x020],%l4	! %l4 = 2b712eff931a429f
	ldx	[%g1+0x028],%l5	! %l5 = 9930ef0023dc346a
	ldx	[%g1+0x030],%l6	! %l6 = dccb68007123add8
	ldx	[%g1+0x038],%l7	! %l7 = 72e581004ccb23a4

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
	ldd	[%g1+0x00],%f0		! %f0  = 95cc54db, %f1  = 4a96e7ef
	ldd	[%g1+0x08],%f2		! %f2  = 5986ef9c, %f3  = a663fdda
	ldd	[%g1+0x10],%f4		! %f4  = 27bc5dc7, %f5  = 44a91a12
	ldd	[%g1+0x18],%f6		! %f6  = 00b200a6, %f7  = 90a4f536
	ldd	[%g1+0x20],%f8		! %f8  = 12f139be, %f9  = 3614a631
	ldd	[%g1+0x28],%f10		! %f10 = f03c8ea9, %f11 = 4000e4db
	ldd	[%g1+0x30],%f12		! %f12 = 2a310a65, %f13 = 2543cb73
	ldd	[%g1+0x38],%f14		! %f14 = 360ec0c8, %f15 = 814d7ace
	ldd	[%g1+0x40],%f16		! %f16 = 2172f944, %f17 = 178254a0
	ldd	[%g1+0x48],%f18		! %f18 = 5b0fe911, %f19 = 983a8112
	ldd	[%g1+0x50],%f20		! %f20 = fadf1688, %f21 = 5cfccdbb
	ldd	[%g1+0x58],%f22		! %f22 = bcd36979, %f23 = da6d582b
	ldd	[%g1+0x60],%f24		! %f24 = a3d0a6b2, %f25 = 5bfd3d02
	ldd	[%g1+0x68],%f26		! %f26 = 1abc142e, %f27 = 684309ae
	ldd	[%g1+0x70],%f28		! %f28 = 6a2ba0dc, %f29 = 36234d66
	ldd	[%g1+0x78],%f30		! %f30 = 82843eb6, %f31 = a53af447
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 1

p1_label_1:
!	%l6 = daf47c79, %l7 = cd196892, Mem[0000000040000018] = 12233e2b 24300020
	std	%l6,[%o5+0x018]	! Mem[0000000040000018] = daf47c79 cd196892
	ble,a	p1_b1			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000014000048] = cb22e3648532cd3a, %l4 = 5b83b4003e5f6d44
	ldx	[%i0+0x048],%l4		! %l4 = cb22e3648532cd3a
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x001,%g2
p1_b1:
	membar	#Sync			! Added by membar checker (181)
!	%l5 = 66576b005df2c2c6, Mem[000000003200006e] = a99666e2
	sth	%l5,[%o4+0x06e]		! Mem[000000003200006c] = c2c666e2
!	Mem[00000000140000cc] = 7237cb9b, %l1 = 061cbc0051ab6532
	lduw	[%i0+0x0cc],%l1		! %l1 = 000000007237cb9b

p1_label_2:
!	%l5 = 66576b005df2c2c6, immed = 00000c68, %y  = 00000000
	sdiv	%l5,0xc68,%l0		! %l0 = 0000000000079299
!	Mem[0000000015800180] = 2eb7bbb1 8183ff3e 53e0d232 0215645f
	prefetch [%i3+0x180],0
	set	p1_b2,%o7
	fbge,pn	%fcc0,p1_near_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800008] = f0f11240, %l2 = 3a66ef006e8c85ae
	ldsha	[%i3+%o6]0x80,%l2	! %l2 = fffffffffffff0f1
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x002,%g2
p1_b2:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = ffffffff8dcfa6fd
!	%l5  = 0000000000000006
	membar	#Sync			! Added by membar checker (182)
!	Mem[0000000014800000] = 0d07c390 a763720d 2a197008 53bdb5a7
	prefetch [%i1+0x000],0

p1_label_3:
	set	p1_b3,%o7
	fbo,a,pt %fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000032000074] = b8b0b88b, %l1 = 0000000014328fe0
	lduw	[%o4+0x074],%g2		! %g2 = 0000000014328fe0
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x003,%g2
p1_b3:
!	Registers modified during the branch to p1_near_2
!	%l0  = 4ec569ffdaf47fbd
!	%l5  = 125cb97a9abe53a6
	membar	#Sync			! Added by membar checker (183)
!	Branch On Register, %l3 = 08a831ffaff10460
	brgz,a,pn %l3,p1_b4		! Branch Taken
!	Mem[0000000014000000] = 0525857b, %l4 = ffffffff8dcfa6fd
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = 000000000525857b
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x004,%g2
p1_b4:
	membar	#Sync			! Added by membar checker (184)
!	%f19 = 983a8112, %f12 = 2a310a65, %f20 = fadf1688 5cfccdbb
	fsmuld	%f19,%f12,%f20		! %f20 = b8601f5a 02340340

p1_label_4:
	fbul,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000014000008] = 348bcced, %l7 = 3b0f9effcd196892
	swapa	[%i0+%o6]0x80,%l7	! %l7 = 00000000348bcced
p1_b5:
	membar	#Sync			! Added by membar checker (185)
!	Mem[0000000014800000] = 0d07c390, %l4 = 000000000525857b
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = 000000000000000d
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 1b
!	Mem[0000000030000058] = 9c3c5e908049fa10, %l3 = 08a831ffaff10460
	ldx	[%o0+0x058],%l3		! Annulled
p1_b6:

p1_label_5:
	membar	#Sync			! Added by membar checker (186)
!	%l2 = fffffffffffff0f1, %l4 = 000000000000000d, %l4 = 000000000000000d
	tsubcc	%l2,%l4,%l4		! %l4 = fffffffffffff0e4, %ccr = 8a
!	Mem[0000000030000054] = 023b81c1, %l4 = fffffffffffff0e4
	lduha	[%o0+0x056]%asi,%l4	! %l4 = 00000000000081c1
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000158000c0] = b5e2350f af896887 102ddf6d 17f2610b
	prefetch [%i3+0x0c0],1
p1_b7:
	membar	#Sync			! Added by membar checker (187)
!	%l4 = 00000000000081c1, %l0 = 4ec569ffdaf47fbd, %l6 = 4ec569ffdaf47c79
	orcc	%l4,%l0,%l6		! %l6 = 4ec569ffdaf4fffd, %ccr = 08

p1_label_6:
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldd	[%i1+0x1a0],%l6
p1_b8:
	membar	#Sync			! Added by membar checker (188)
!	Mem[00000000158001b8] = 48d7ee25, %l1 = 0000000014328fe0
	lduwa	[%i3+0x1b8]%asi,%l1	! %l1 = 0000000048d7ee25
	fbg,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l4 = 00000000000081c1, Mem[00000000150001e8] = 207b830430b8346b
	stx	%l4,[%i2+0x1e8]		! Mem[00000000150001e8] = 00000000000081c1
p1_b9:

p1_label_7:
	membar	#Sync			! Added by membar checker (189)
!	%l0 = 4ec569ffdaf47fbd, immed = fffff210, %l3 = 08a831ffaff10460
	xnor	%l0,-0xdf0,%l3		! %l3 = 4ec569ffdaf47252
	bne,a	p1_b10			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000014800000] = 0d07c390a763720d, %l1 = 0000000048d7ee25
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = 0d07c390a763720d
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x00a,%g2
p1_b10:
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l2 = fffff0f1, %l3 = daf47252, Mem[00000000140000f0] = f6626c54 b9f2e316
	std	%l2,[%i0+0x0f0]	! Mem[00000000140000f0] = fffff0f1 daf47252
p1_b11:

p1_label_8:
	membar	#Sync			! Added by membar checker (190)
	nop
!	%l4 = 00000000000081c1, immed = 00000017, %l6 = 4ec569ffdaf4fffd
	srlx	%l4,0x017,%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, %l1 = 0d07c390a763720d, %l6 = 0000000000000000
	orn	%l6,%l1,%l6		! %l6 = f2f83c6f589c8df2
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l4 = 00000000000081c1, Mem[0000000015000000] = e59e6689bd9cedca
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000015000000] = 00000000000081c1
p1_b12:

p1_label_9:
	membar	#Sync			! Added by membar checker (191)
!	Mem[00000000148000a0] = 92cd453286a250a9, %l4 = 00000000000081c1
	ldx	[%i1+0x0a0],%l4		! %l4 = 92cd453286a250a9
	bneg	p1_b13			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000015000008] = d85cebc7, %l3 = 4ec569ffdaf47252
	lduha	[%i2+%o6]0x80,%l3	! %l3 = 000000000000d85c
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x00d,%g2
p1_b13:
	membar	#Sync			! Added by membar checker (192)
!	%l4 = 92cd453286a250a9, %l4 = 92cd453286a250a9, %l0 = 4ec569ffdaf47fbd
	sll	%l4,%l4,%l0		! %l0 = 9a8a650d44a15200
	fbne	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_10:
!	Mem[000000003000001e] = 1176ba81, %l1 = 0d07c390a763720d
	ldstub	[%o0+0x01e],%l1		! %l1 = 00000000000000ba
p1_b14:
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000014800020] = 0cee9988 d47c954b 0537e0b4 e4071d5f
	prefetch [%i1+0x020],3	! Annulled
p1_b15:
	membar	#Sync			! Added by membar checker (193)
!	Branch On Register, %l2 = fffffffffffff0f1
	brlez,pt %l2,p1_b16		! Branch Taken
!	%l1 = 00000000000000ba, Mem[0000000014800191] = 456fc8ca
	stb	%l1,[%i1+0x191]		! Mem[0000000014800190] = 45bac8ca
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x010,%g2
p1_b16:

p1_label_11:
	membar	#Sync			! Added by membar checker (194)
!	%l0 = 9a8a650d44a15200, Mem[0000000017000008] = 8c2690f6
	stha	%l0,[%i6+%o6]0x80	! Mem[0000000017000008] = 520090f6
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000014000000] = 0525857b, %l4 = 92cd453286a250a9
	ldstuba	[%i0+%g0]0x80,%l4	! Annulled
p1_b17:
	membar	#Sync			! Added by membar checker (195)
!	%l5 = 125cb97a9abe53a6, immed = 00000ab6, %y  = 00000000
	umul	%l5,0xab6,%l3		! %l3 = 000006797293f404
	bvc,a	p1_b18			! Branch Taken, %ccr = 08, CWP = 0

p1_label_12:
!	%l1 = 00000000000000ba, Mem[0000000014800008] = 2a19700853bdb5a7
	stxa	%l1,[%i1+%o6]0x80	! Mem[0000000014800008] = 00000000000000ba
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x012,%g2
p1_b18:
	membar	#Sync			! Added by membar checker (196)
!	Mem[0000000014800198] = 08fe564e, %l4 = 92cd453286a250a9
	swap	[%i1+0x198],%l4		! %l4 = 0000000008fe564e
	set	p1_b19,%o7
	fbo,pt	%fcc1,p1_near_2_le	! Branch Taken, %fcc1 = 0
!	%l6 = 589c8df2, %l7 = 348bcced, Mem[0000000015000008] = d85cebc7 2f859c56
	stda	%l6,[%i2+%o6]0x80	! Mem[0000000015000008] = 589c8df2 348bcced
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x013,%g2
p1_b19:
!	Registers modified during the branch to p1_near_2
!	%l2  = 9a8a5e93d20d5dfc
!	%l5  = 000cf2e527e80800
!	%l6  = 65759af2b3a0fbb1
	membar	#Sync			! Added by membar checker (197)
!	%l0 = 9a8a650d44a15200, %l4 = 0000000008fe564e, %l1 = 00000000000000ba
	srl	%l0,%l4,%l1		! %l1 = 0000000000011285

p1_label_13:
!	Mem[0000000015800110] = a0e6b7ab, %l6 = 65759af2b3a0fbb1
	ldsha	[%i3+0x110]%asi,%l6	! %l6 = ffffffffffffa0e6
	bcs	p1_b20			! Branch Taken, %ccr = 89, CWP = 0
!	Mem[00000000158001b0] = bc7f1faef3e10492, %l3 = 000006797293f404
	ldx	[%i3+0x1b0],%l3		! %l3 = bc7f1faef3e10492
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x014,%g2
p1_b20:
	membar	#Sync			! Added by membar checker (198)
	set	p1_b21,%o7
	fbuge,a,pn %fcc3,p1_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000015000000] = 00000000, %l5 = 000cf2e527e80800
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x015,%g2
p1_b21:
!	Registers modified during the branch to p1_near_2
!	%l0  = ffffffffffffa42a
!	%l5  = 125cb97a9abe53a6

p1_label_14:
	membar	#Sync			! Added by membar checker (199)
!	Branch On Register, %l5 = 125cb97a9abe53a6
	brnz,a,pt %l5,p1_b22		! Branch Taken
!	%l6 = ffffffffffffa0e6, Mem[0000000017000120] = 8dc00784498062f2
	stx	%l6,[%i6+0x120]		! Mem[0000000017000120] = ffffffffffffa0e6
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x016,%g2
p1_b22:
	membar	#Sync			! Added by membar checker (200)
	set	p1_b23,%o7
	fba,pt	%fcc2,p1_near_0_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000014800008] = 00000000, %l3 = bc7f1faef3e10492
	ldswa	[%i1+%o6]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x017,%g2
p1_b23:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = 0000000000014950
!	%l5  = 000000000000348b
	membar	#Sync			! Added by membar checker (201)
!	%l0 = 0000000063b20536, Mem[0000000030000058] = 00000000348bcced
	stx	%l0,[%o0+0x058]		! Mem[0000000030000058] = 0000000063b20536

p1_label_15:
!	%l7 = 00000000348bcced, %l0 = 0000000063b20536, %y  = 00000679
	udivcc	%l7,%l0,%l5		! %l5 = 000000000000109f, %ccr = 00
!	Mem[00000000158001a0] = bf504ba5 20fbacf8 9add8020 a816a8f3
	prefetch [%i3+0x1a0],16
!	%f20 = b8601f5a, %f16 = 2172f944 178254a0
	fstod	%f20,%f16		! %f16 = bf0c03eb 40000000
	nop
!	%l0 = 63b20536, %l1 = 14328fe0, Mem[0000000014000098] = 3a31242d fb82c49f
	std	%l0,[%i0+0x098]	! Mem[0000000014000098] = 63b20536 14328fe0

p1_label_16:
!	Mem[0000000014000180] = a38d684f 6b85385a 612dc203 bf87f77b
	prefetch [%i0+0x180],3
	set	p1_b24,%o7
	fba,a,pn %fcc1,p1_near_3_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000015800000] = 37017cc8, %l6 = ffffffffffffa0e6
	lduha	[%i3+%g0]0x80,%l6	! Annulled
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x018,%g2
p1_b24:
!	Registers modified during the branch to p1_near_3
!	%l0  = 0000000000000a68
!	%l3  = 00000000348d163e
!	%l5  = 0000000031540281
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000184] = d6524aa1, %l4 = 0000000000014950
	ldsw	[%i2+0x184],%l4		! Annulled
p1_b25:

p1_label_17:
	membar	#Sync			! Added by membar checker (202)
!	Mem[0000000015800060] = 6f8822fd 889bea7c 46352f28 506444c1
	prefetch [%i3+0x060],16
!	%l1 = 0000000014328fe0, immed = fffffce5, %l1 = 0000000014328fe0
	xorcc	%l1,-0x31b,%l1		! %l1 = ffffffffebcd7305, %ccr = 88
	set	p1_b26,%o7
	fbge,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000010] = e6f398ec, %l7 = 00000000348bcced
	ldub	[%o2+0x012],%l7		! %l7 = 0000000000000098
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x01a,%g2
p1_b26:
!	Registers modified during the branch to p1_far_2
!	%l3  = 0000000000000679
!	%l6  = fffffffffffdffe7
!	%l7  = 000000002ffec3a8
	membar	#Sync			! Added by membar checker (203)
!	%f14 = 360ec0c8, %f17 = 40000000, %f10 = f03c8ea9
	fmuls	%f14,%f17,%f10		! %f10 = 368ec0c8

p1_label_18:
!	%f22 = bcd36979, %f17 = 40000000
	fnegs	%f22,%f17		! %f17 = 3cd36979
!	%f2  = 5986ef9c a663fdda, %f18 = 5b0fe911 983a8112
	fnegd	%f2 ,%f18		! %f18 = d986ef9c a663fdda
	set	p1_b27,%o7
	fbo,pt	%fcc3,p1_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000014800000] = 0d07c390, %l5 = 0000000031540281
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 000000000d07c390
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x01b,%g2
p1_b27:
!	Registers modified during the branch to p1_near_2
!	%l0  = fffffffffffe032b
!	%l5  = 125cb97a9abe53a6
	membar	#Sync			! Added by membar checker (204)
	fbug,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0

p1_label_19:
!	%l0 = fffe032b, %l1 = ebcd7305, Mem[0000000014800008] = 00000000 000000ba
	stda	%l0,[%i1+%o6]0x80	! Annulled
p1_b28:
	membar	#Sync			! Added by membar checker (205)
!	%f23 = da6d582b, %f23 = da6d582b, %f25 = 5bfd3d02
	fsubs	%f23,%f23,%f25		! %f25 = 00000000
	fbl,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000014800008] = 00000000, %l4 = 0000000000014950
	ldswa	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
p1_b29:
	membar	#Sync			! Added by membar checker (206)
!	%l2 = 9a8a5e93d20d5dfc, %l6 = fffffffffffdffe7, %l3 = 0000000000000679
	sllx	%l2,%l6,%l3		! %l3 = 06aefe0000000000

p1_label_20:
	set	p1_b30,%o7
	fbo	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000008] = cd196892, %l2 = 9a8a5e93d20d5dfc
	ldsba	[%i0+%o6]0x80,%l2	! %l2 = ffffffffffffffcd
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x01e,%g2
p1_b30:
!	Registers modified during the branch to p1_far_3
!	%l3  = ffffffffffffffcd
!	%l6  = 000000000000067a
	membar	#Sync			! Added by membar checker (207)
!	%l2 = ffffffffffffffcd, immed = fffff6ea, %l7 = 000000002ffec3a8
	taddcc	%l2,-0x916,%l7		! %l7 = fffffffffffff6b7, %ccr = 9b
	bvc	p1_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000015000008] = 589c8df2, %l1 = ffffffffebcd7305
	ldstuba	[%i2+%o6]0x80,%l1	! %l1 = 0000000000000058
p1_b31:

p1_label_21:
	membar	#Sync			! Added by membar checker (208)
!	%l4 = 0000000000000000, %l1 = 0000000000000058, %y  = 00000679
	sdiv	%l4,%l1,%l7		! %l7 = 000000007fffffff
!	%l2 = ffffffffffffffcd, immed = fffff597, %l7 = 000000007fffffff
	tsubcc	%l2,-0xa69,%l7		! %l7 = 0000000000000a36, %ccr = 02
!	%l2 = ffffffffffffffcd, Mem[0000000014800008] = 00000000
	stha	%l2,[%i1+%o6]0x80	! Mem[0000000014800008] = ffcd0000
!	%f25 = 00000000, %f18 = d986ef9c, %f23 = da6d582b
	fdivs	%f25,%f18,%f23		! %f23 = 80000000
	fbug	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_22:
!	Mem[0000000032000018] = d866c877, %l4 = 0000000000000000
	ldub	[%o4+0x019],%g2		! %g2 = 00000000000000d8
p1_b32:
	membar	#Sync			! Added by membar checker (209)
	fbg,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000120] = 05b5ef09 02444531 a14ee180 05048ebd
	prefetch [%i0+0x120],22
p1_b33:
	membar	#Sync			! Added by membar checker (210)
!	%l1 = 0000000000000058, %l2 = ffffffffffffffcd, %l1 = 0000000000000058
	sll	%l1,%l2,%l1		! %l1 = 00000000000b0000
!	%l2 = ffffffcd, %l3 = ffffffcd, Mem[0000000030000018] = 1c62b073 1176ff81
	std	%l2,[%o0+0x018]	! Mem[0000000030000018] = ffffffcd ffffffcd

p1_label_23:
!	%l4 = 0000000000000000, immed = fffffcde, %l7 = 0000000000000a36
	xnor	%l4,-0x322,%l7		! %l7 = 0000000000000321
!	Branch On Register, %l0 = fffffffffffe032b
	brlz,pt	%l0,p1_b34		! Branch Taken
!	Mem[0000000032000050] = 224de4a5, %l0 = fffffffffffe032b
	ldub	[%o4+0x053],%g2		! %g2 = 0000000000000022
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x022,%g2
p1_b34:
	membar	#Sync			! Added by membar checker (211)
!	%f25 = 00000000, %f9  = 3614a631, %f18 = d986ef9c
	fsubs	%f25,%f9 ,%f18		! %f18 = b614a631
!	%l0 = fffffffffffe032b, Mem[0000000030000018] = ffffffcdffffffcd
	stxa	%l0,[%o0+0x018]%asi	! Mem[0000000030000018] = fffffffffffe032b

p1_label_24:
	fbul,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[00000000140000c0] = c00d88f9 439c7079 c79cb202 7237cb9b
	prefetch [%i0+0x0c0],23
p1_b35:
	membar	#Sync			! Added by membar checker (212)
!	Mem[000000003180001c] = 93078c9a, %l4 = 0000000000000000
	ldsw	[%o3+0x01c],%l4		! %l4 = ffffffff93078c9a
	set	p1_b36,%o7
	fble,a,pn %fcc0,p1_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000008] = cd196892, %l3 = ffffffffffffffcd
	ldswa	[%i0+%o6]0x80,%l3	! %l3 = ffffffffcd196892
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x024,%g2
p1_b36:
!	Registers modified during the branch to p1_near_3
!	%l2  = ffffffffcd1b6567
!	%l5  = 00000000000003a8

p1_label_25:
	membar	#Sync			! Added by membar checker (213)
!	%l1 = 00000000000b0000, immed = 0000001d, %l0 = fffffffffffe032b
	srlx	%l1,0x01d,%l0		! %l0 = 0000000000000000
!	%f8  = 12f139be, %f14 = 360ec0c8
	fnegs	%f8 ,%f14		! %f14 = 92f139be
!	%f14 = 92f139be 814d7ace, %f22 = bcd36979 80000000
	fabsd	%f14,%f22		! %f22 = 12f139be 814d7ace
	set	p1_b37,%o7
	fbge,pt	%fcc1,p1_near_0_he	! Branch Taken, %fcc1 = 0
!	%l1 = 00000000000b0000, Mem[0000000014800000] = 0d07c390
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000014800000] = 0007c390
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x025,%g2
p1_b37:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = fffffffffff4ffff
!	%l5  = 0000000000000000

p1_label_26:
	membar	#Sync			! Added by membar checker (214)
!	Branch On Register, %l2 = ffffffffcd1b6567
	brgez,pn %l2,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000031800050] = 1f6ed9a9 0000109f, %l2 = cd1b6567, %l3 = cd196892
	ldd	[%o3+0x050],%l2		! %l2 = 000000001f6ed9a9 000000000000109f
p1_b38:
	membar	#Sync			! Added by membar checker (215)
!	%l2 = 1f6ed9a9, %l3 = 0000109f, Mem[0000000030000018] = ffffffff fffe032b
	stda	%l2,[%o0+0x018]%asi	! Mem[0000000030000018] = 1f6ed9a9 0000109f
!	%f25 = 00000000, %f0  = 95cc54db, %f7  = 90a4f536
	fsubs	%f25,%f0 ,%f7 		! %f7  = 15cc54db
!	Mem[000000003080005c] = 3c7e75d1, %l6 = 0000067a, %l7 = 00000321
	add	%o1,0x5c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 000000003c7e75d1

p1_label_27:
	bg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l7 = 000000003c7e75d1, Mem[0000000014000000] = 0525857b
	stba	%l7,[%i0+%g0]0x80	! Annulled
p1_b39:
	membar	#Sync			! Added by membar checker (216)
!	Mem[00000000158001ac] = a816a8f3, %l1 = 0000000014328fe0
	ldsba	[%i3+0x1af]%asi,%l1	! %l1 = fffffffffffffff3
!	%l0 = 0000000063b20536, immed = fffff9ea, %l7 = 000000003c7e75d1
	addccc	%l0,-0x616,%l7		! %l7 = 0000000063b1ff20, %ccr = 11
!	%l0 = 0000000063b20536, immed = 000001be, %l3 = 000000000000109f
	andncc	%l0,0x1be,%l3		! %l3 = 0000000063b20400, %ccr = 00

p1_label_28:
	set	p1_b40,%o7
	fbo,pn	%fcc1,p1_near_0_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000014800000] = 0007c390, %l5 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000007
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x028,%g2
p1_b40:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = 0000000063b2053a
!	%l5  = 0000000000000018
	membar	#Sync			! Added by membar checker (217)
!	Mem[0000000014000188] = 612dc203, %l0 = 0000000063b20536
	swap	[%i0+0x188],%l0		! %l0 = 00000000612dc203
	set	p1_b41,%o7
	fbule,pt %fcc2,p1_near_1_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000015000180] = b583c178 d6524aa1 bcd489ed 08b4f857
	prefetch [%i2+0x180],21
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x029,%g2
p1_b41:
!	Registers modified during the branch to p1_near_1
!	%l4  = 000000001432965a
!	%l7  = 0000000000000000

p1_label_29:
	membar	#Sync			! Added by membar checker (218)
!	Mem[0000000015800008] = f0f11240, %l5 = 0000000000000018
	ldstuba	[%i3+%o6]0x80,%l5	! %l5 = 00000000000000f0
!	%l4 = 000000001432965a, Mem[0000000015800008] = fff11240
	stwa	%l4,[%i3+%o6]0x80	! Mem[0000000015800008] = 1432965a
!	Mem[0000000015000000] = 00000000 000081c1 ff9c8df2 348bcced
	prefetch [%i2+0x000],22
!	Mem[00000000148001ec] = 00059d44, %l4 = 000000001432965a
	ldswa	[%i1+0x1ec]%asi,%l4	! %l4 = 0000000000059d44
	set	p1_b42,%o7
	fble,pt	%fcc3,p1_near_3_he	! Branch Taken, %fcc3 = 0

p1_label_30:
!	Mem[00000000158000c4] = af896887, %l6 = 000000000000067a
	ldsh	[%i3+0x0c6],%l6		! %l6 = 0000000000006887
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x02a,%g2
p1_b42:
!	Registers modified during the branch to p1_near_3
!	%l2  = 00000000028441fd
!	%l5  = 00000000000065b5
	membar	#Sync			! Added by membar checker (219)
!	%f20 = b8601f5a, %f25 = 00000000, %f20 = b8601f5a
	fsubs	%f20,%f25,%f20		! %f20 = b8601f5a
	bpos	p1_b43			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[0000000015800180] = 2eb7bbb1 8183ff3e 53e0d232 0215645f
	prefetch [%i3+0x180],16
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x02b,%g2
p1_b43:
	membar	#Sync			! Added by membar checker (220)
!	Mem[0000000014000000] = 0525857b, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000005

p1_label_31:
!	%f25 = 00000000, %f22 = 12f139be, %f19 = a663fdda
	fmuls	%f25,%f22,%f19		! %f19 = 00000000
!	%f0  = 95cc54db 4a96e7ef, %f0  = 95cc54db 4a96e7ef, %f16 = bf0c03eb 3cd36979
	fdivd	%f0 ,%f0 ,%f16		! %f16 = 3ff00000 00000000
!	Mem[0000000014800190] = 45bac8ca, %l1 = 0000000014328fe0
	swapa	[%i1+0x190]%asi,%l1	! %l1 = 0000000045bac8ca
!	Mem[0000000030800058] = 18907542, %l6 = 0000000000006887
	lduh	[%o1+0x058],%l6		! %l6 = 0000000000001890
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_32:
!	Mem[0000000015000080] = 38f7db20 be32e3cc bba6a716 e6b021b7
	prefetch [%i2+0x080],0
p1_b44:
	set	p1_b45,%o7
	fbo,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800008] = ffcd0000, %l7 = 0000000000000005
	ldstuba	[%i1+%o6]0x80,%l7	! %l7 = 00000000000000ff
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x02d,%g2
p1_b45:
!	Registers modified during the branch to p1_far_3
!	%l3  = 000000000281dcb9
!	%l6  = 0000000000000679
	membar	#Sync			! Added by membar checker (221)
!	%l0 = 00000000612dc203, %l6 = 0000000000000679, %l6 = 0000000000000679
	xnorcc	%l0,%l6,%l6		! %l6 = ffffffff9ed23b85, %ccr = 88
!	Mem[00000000158001d8] = 6c9da207, %l0 = 00000000612dc203
	swap	[%i3+0x1d8],%l0		! %l0 = 000000006c9da207

p1_label_33:
!	%l6 = ffffffff9ed23b85, %l6 = ffffffff9ed23b85, %l1 = 0000000045bac8ca
	addcc	%l6,%l6,%l1		! %l1 = ffffffff3da4770a, %ccr = 93
!	%f16 = 3ff00000 00000000, %f20 = b8601f5a 02340340
	fcmped	%fcc2,%f16,%f20		! %fcc2 = 2
!	%f10 = 368ec0c8, %f16 = 3ff00000
	fabss	%f10,%f16		! %f16 = 368ec0c8
	fbul,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000014800068] = b8757c7c, %l1 = ffffffff3da4770a
	ldsb	[%i1+0x06b],%l1		! %l1 = 000000000000007c
p1_b46:

p1_label_34:
	bl,a	p1_b47			! Branch Taken, %ccr = 93, CWP = 0
!	%l7 = 00000000000000ff, Mem[0000000032000060] = 0818b15de53da238
	stx	%l7,[%o4+0x060]		! Mem[0000000032000060] = 00000000000000ff
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x02f,%g2
p1_b47:
	membar	#Sync			! Added by membar checker (222)
!	Mem[0000000032000010] = 852cb3e2 c2eec50c, %l2 = 028441fd, %l3 = 0281dcb9
	ldda	[%o4+0x010]%asi,%g2	! %l2 = 00000000028441fd 000000000281dcb9
!	%f0  = 95cc54db 4a96e7ef, %f0  = 95cc54db 4a96e7ef, %f16 = 368ec0c8 00000000
	fdivd	%f0 ,%f0 ,%f16		! %f16 = 3ff00000 00000000
!	%l2 = 028441fd, %l3 = 0281dcb9, Mem[0000000030800058] = 18907542 3c7e75d1
	std	%l2,[%o1+0x058]	! Mem[0000000030800058] = 028441fd 0281dcb9

p1_label_35:
!	%l3 = 000000000281dcb9, immed = 00000b42, %l6 = ffffffff9ed23b85
	subc	%l3,0xb42,%l6		! %l6 = 000000000281d176
!	%l5 = 00000000000065b5, Mem[0000000030800017] = 14328fe0
	stba	%l5,[%o1+0x017]%asi	! Mem[0000000030800014] = 14328fb5
	bcs,a	p1_b48			! Branch Taken, %ccr = 93, CWP = 0
!	Mem[0000000030800058] = 028441fd 0281dcb9, %l6 = 0281d176, %l7 = 000000ff
	ldd	[%o1+0x058],%l6		! %l6 = 00000000028441fd 000000000281dcb9
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x030,%g2
p1_b48:
	membar	#Sync			! Added by membar checker (223)
!	%l2 = 00000000028441fd, Mem[000000003080005e] = 0281dcb9
	sth	%l2,[%o1+0x05e]		! Mem[000000003080005c] = 028141fd

p1_label_36:
!	%l0 = 000000006c9da207, immed = fffff492, %l3 = 000000000281dcb9
	xnor	%l0,-0xb6e,%l3		! %l3 = 000000006c9da96a
!	Mem[0000000014000040] = 125cb97a 9abe53a6 cb22e364 8532cd3a
	prefetch [%i0+0x040],4
!	Mem[000000003000005c] = 63b20536, %l7 = 000000000281dcb9
	lduba	[%o0+0x05f]%asi,%l7	! %l7 = 0000000000000036
	fbne,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	 Annulled
	ldd	[%i3+0x120],%l4
p1_b49:

p1_label_37:
	set	p1_b50,%o7
	fba	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	%l0 = 000000006c9da207, Mem[0000000031800050] = 1f6ed9a9
	stw	%l0,[%o3+0x050]		! Mem[0000000031800050] = 6c9da207
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x032,%g2
p1_b50:
!	Registers modified during the branch to p1_far_0
!	%l2  = 0000000000a1107f
!	%l3  = 00000000028440ac
!	%l4  = 000000016c9da206
!	%l7  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (224)
!	%l2 = 0000000000a1107f, immed = 00000c59, %l0 = 000000006c9da207
	andcc	%l2,0xc59,%l0		! %l0 = 0000000000000059, %ccr = 00
	fbn,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000014800060] = c375a6b5 748d116a, %l2 = 00a1107f, %l3 = 028440ac
	ldd	[%i1+0x060],%l2		! %l2 = 00000000c375a6b5 00000000748d116a
p1_b51:

p1_label_38:
	membar	#Sync			! Added by membar checker (225)
!	Mem[0000000014000100] = e13fef01 a0eda399 f5d21ab7 a0a1752c
	prefetch [%i0+0x100],4
!	%l5 = 00000000000065b5, Mem[0000000030000010] = 6d4f812711bf7433
	stx	%l5,[%o0+0x010]		! Mem[0000000030000010] = 00000000000065b5
!	%f2  = 5986ef9c, %f27 = 684309ae, %f0  = 95cc54db 4a96e7ef
	fsmuld	%f2 ,%f27,%f0 		! %f0  = 4849b367 7dd60200
!	%f3  = a663fdda, %f27 = 684309ae
	fnegs	%f3 ,%f27		! %f27 = 2663fdda
	set	p1_b52,%o7
	fble,a	p1_far_0_le	! Branch Taken, %fcc0 = 0

p1_label_39:
!	Mem[0000000015800008] = 1432965a, %l5 = 00000000000065b5
	lduha	[%i3+%o6]0x80,%l5	! %l5 = 0000000000001432
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x034,%g2
p1_b52:
	membar	#Sync			! Added by membar checker (226)
!	%l2 = 00000000c375a6b5, %l2 = 00000000c375a6b5, %y  = 00000679
	udivcc	%l2,%l2,%l4		! %l4 = 000000000000087b, %ccr = 00
!	%l0 = 0000000000000059, immed = fffff8aa, %y  = 00000679
	udivcc	%l0,-0x756,%l5		! %l5 = 0000000000000679, %ccr = 00
	fbu,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l5 = 0000000000000679, Mem[0000000031000010] = e6f398ecb9bf24d3
	stx	%l5,[%o2+0x010]		! Annulled
p1_b53:

p1_label_40:
	membar	#Sync			! Added by membar checker (227)
!	Mem[0000000014800000] = 0007c390 a763720d, %l4 = 0000087b, %l5 = 00000679
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 000000000007c390 00000000a763720d
	fbule,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000030800050] = c5a66cf7, %l2 = 00000000c375a6b5
	ldub	[%o1+0x051],%l2		! Annulled
p1_b54:
	membar	#Sync			! Added by membar checker (228)
!	%l1 = 000000000000007c, immed = fffff686, %y  = 00000679
	smulcc	%l1,-0x97a,%l7		! %l7 = fffffffffffb68e8, %ccr = 88
!	Mem[0000000032000028] = 64084b72, %l2 = 00000000c375a6b5
	ldsh	[%o4+0x02a],%g2		! %g2 = 0000000000006408

p1_label_41:
!	Mem[0000000032000020] = 881b2ad7 861878d1 a4176408 4b729f64
	prefetcha [%o4+0x020]%asi,3
!	Mem[0000000015000000] = 00000000, %l0 = 0000000000000059
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, immed = fffffa82, %l2 = 00000000c375a6b5
	subc	%l0,-0x57e,%l2		! %l2 = 000000000000057e
!	%f17 = 00000000, %f18 = b614a631, %f9  = 3614a631
	fdivs	%f17,%f18,%f9 		! %f9  = 80000000
!	%f0  = 4849b367 7dd60200, %f0  = 4849b367 7dd60200, %f22 = 12f139be 814d7ace
	fsubd	%f0 ,%f0 ,%f22		! %f22 = 00000000 00000000

p1_label_42:
!	Mem[0000000030800016] = 14328fb5, %l5 = 00000000a763720d
	ldstuba	[%o1+0x016]%asi,%l5	! %l5 = 000000000000008f
!	%l6 = 00000000028441fd, Mem[0000000015800008] = 1432965a393f1d0b
	stxa	%l6,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000000028441fd
	set	p1_b55,%o7
	fba	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800018] = 43a4137d, %l4 = 000000000007c390
	ldsb	[%o3+0x01a],%l4		! %l4 = 0000000000000013
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x037,%g2
p1_b55:
!	Registers modified during the branch to p1_far_3
!	%l3  = 000000000000056d
!	%l6  = 00000000ffffffff
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_43:
!	Mem[0000000014800060] = c375a6b5 748d116a b8757c7c 645a4f78
	prefetch [%i1+0x060],3	! Annulled
p1_b56:
	membar	#Sync			! Added by membar checker (229)
!	%l2 = 000000000000057e, %l1 = 000000000000007c, %l4 = 0000000000000013
	andncc	%l2,%l1,%l4		! %l4 = 0000000000000502, %ccr = 00
!	%l6 = 00000000ffffffff, immed = fffff487, %l2 = 000000000000057e
	xnorcc	%l6,-0xb79,%l2		! %l2 = 00000000fffff487, %ccr = 08
!	%l3 = 000000000000056d, immed = 00000001, %l3 = 000000000000056d
	srlx	%l3,0x001,%l3		! %l3 = 00000000000002b6
!	Mem[0000000031800018] = 43a4137d, %l0 = 0000000000000000
	ldsh	[%o3+0x01a],%l0		! %l0 = 000000000000137d

p1_label_44:
	bcc	p1_b57			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000015000000] = 00000000 000081c1, %l4 = 00000502, %l5 = 0000008f
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000000081c1
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x039,%g2
p1_b57:
	membar	#Sync			! Added by membar checker (230)
!	%l0 = 000000000000137d, %l1 = 000000000000007c, %l3 = 00000000000002b6
	sub	%l0,%l1,%l3		! %l3 = 0000000000001301
!	%f12 = 2a310a65, %f23 = 00000000, %f6  = 00b200a6
	fsubs	%f12,%f23,%f6 		! %f6  = 2a310a65
!	Branch On Register, %l4 = 0000000000000000
	brgez,pt %l4,p1_b58		! Branch Taken

p1_label_45:
!	%l6 = 00000000ffffffff, Mem[0000000014000010] = e82f54e79246aee6
	stx	%l6,[%i0+0x010]		! Mem[0000000014000010] = 00000000ffffffff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x03a,%g2
p1_b58:
	membar	#Sync			! Added by membar checker (231)
!	%l2 = 00000000fffff487, %l0 = 000000000000137d, %l0 = 000000000000137d
	addc	%l2,%l0,%l0		! %l0 = 0000000100000804
!	%l5 = 00000000000081c1, Mem[00000000150001e9] = 00000000
	stb	%l5,[%i2+0x1e9]		! Mem[00000000150001e8] = 00c10000
!	%l7 = fffffffffffb68e8, immed = 0000028a, %l0 = 0000000100000804
	add	%l7,0x28a,%l0		! %l0 = fffffffffffb6b72
!	%f28 = 6a2ba0dc 36234d66, %f24 = a3d0a6b2 00000000
	fabsd	%f28,%f24		! %f24 = 6a2ba0dc 36234d66

p1_label_46:
!	%f2  = 5986ef9c a663fdda, %f14 = 92f139be 814d7ace
	fcmpd	%fcc1,%f2 ,%f14		! %fcc1 = 2
!	%l0 = fffffffffffb6b72, Mem[00000000140001c0] = 99a10105fbe4c980
	stx	%l0,[%i0+0x1c0]		! Mem[00000000140001c0] = fffffffffffb6b72
!	%l1 = 000000000000007c, immed = 000005ec, %l6 = 00000000ffffffff
	andcc	%l1,0x5ec,%l6		! %l6 = 000000000000006c, %ccr = 00
!	%l0 = fffffffffffb6b72, immed = 00000cc4, %l2 = 00000000fffff487
	andcc	%l0,0xcc4,%l2		! %l2 = 0000000000000840, %ccr = 00
!	Mem[00000000140000e8] = 5a4b4229, %l3 = 0000000000001301
	lduba	[%i0+0x0e9]%asi,%l3	! %l3 = 000000000000004b

p1_label_47:
!	%f10 = 368ec0c8 4000e4db, %f20 = b8601f5a 02340340
	fnegd	%f10,%f20		! %f20 = b68ec0c8 4000e4db
!	%l0 = fffffffffffb6b72, %l7 = fffffffffffb68e8, %y  = ffffffff
	sdivx	%l0,%l7,%l6		! %l6 = 0000000000000000
!	%l5 = 00000000000081c1, immed = 00000dbc, %l7 = fffffffffffb68e8
	xorcc	%l5,0xdbc,%l7		! %l7 = 0000000000008c7d, %ccr = 00
!	%l6 = 0000000000000000, %l7 = 0000000000008c7d, %l3 = 000000000000004b
	addccc	%l6,%l7,%l3		! %l3 = 0000000000008c7d, %ccr = 00
!	Mem[0000000030000050] = 9e241171 023b81c1, %l4 = 00000000, %l5 = 000081c1
	ldda	[%o0+0x050]%asi,%l4	! %l4 = 000000009e241171 00000000023b81c1

p1_label_48:
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800050] = c5a66cf7, %l5 = 00000000023b81c1
	ldsh	[%o1+0x052],%l5		! %l5 = 0000000000006cf7
p1_b59:
	membar	#Sync			! Added by membar checker (232)
!	%l0 = fffffffffffb6b72, %l7 = 0000000000008c7d, %l7 = 0000000000008c7d
	orn	%l0,%l7,%l7		! %l7 = ffffffffffff7bf2
!	Mem[000000003100001c] = de53bbc8, %l3 = 0000000000008c7d
	ldswa	[%o2+0x01c]%asi,%l3	! %l3 = ffffffffde53bbc8
!	Mem[0000000015800000] = 37017cc8, %l1 = 000000000000007c
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 0000000037017cc8

p1_label_49:
!	Mem[000000001400019b] = abda0673, %l1 = 0000000037017cc8
	ldstuba	[%i0+0x19b]%asi,%l1	! %l1 = 0000000000000073
	set	p1_b60,%o7
	fbuge,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800080] = 5e0c336d 4d03e30e abe13425 3bbf8c30
	prefetch [%i3+0x080],21
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x03c,%g2
p1_b60:
!	Registers modified during the branch to p1_far_1
!	%l2  = 0000000000025f42
!	%l6  = fffffffff78abbca
	membar	#Sync			! Added by membar checker (233)
!	%l1 = 0000000000000073, %l3 = ffffffffde53bbc8, %l0 = fffffffffffb6b72
	taddcc	%l1,%l3,%l0		! %l0 = ffffffffde53bc3b, %ccr = 8a
	set	p1_b61,%o7
	fbuge,pt %fcc0,p1_near_1_le	! Branch Taken, %fcc0 = 0

p1_label_50:
!	Mem[000000003180005c] = eaf0adb3, %l5 = 0000000000006cf7
	ldsh	[%o3+0x05c],%l5		! %l5 = ffffffffffffeaf0
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x03d,%g2
p1_b61:
!	Registers modified during the branch to p1_near_1
!	%l4  = fffffffff78abc3d
!	%l7  = 00000000000000ff
	membar	#Sync			! Added by membar checker (234)
	fbu,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	 Annulled
	ldd	[%o1+0x058],%l2
p1_b62:
	membar	#Sync			! Added by membar checker (235)
!	Mem[0000000014800000] = 0007c390 a763720d ffcd0000 000000ba
	prefetcha [%i1+0x000]%asi,20
!	%l1 = 0000000000000073, Mem[0000000030000050] = 0000000000006cf7
	stx	%l1,[%o0+0x050]		! Mem[0000000030000050] = 0000000000000073

p1_label_51:
!	Mem[000000001500009c] = 74886cdb, %l3 = de53bbc8, %l6 = f78abbca
	add	%i2,0x9c,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000074886cdb
!	%l0 = ffffffffde53bc3b, %l1 = 0000000000000073, %y  = ffffffff
	smulcc	%l0,%l1,%l3		! %l3 = fffffff0df9d8e81, %ccr = 88
!	Branch On Register, %l4 = fffffffff78abc3d
	brlz,a,pn %l4,p1_b63		! Branch Taken
!	Mem[0000000030000054] = 00000073, %l7 = 00000000000000ff
	lduw	[%o0+0x054],%l7		! %l7 = 0000000000000073
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x03f,%g2
p1_b63:
	membar	#Sync			! Added by membar checker (236)
!	%f16 = 3ff00000 00000000, %f26 = 1abc142e
	fdtos	%f16,%f26		! %f26 = 3f800000

p1_label_52:
	fbg,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000015000140] = 66fabc10 bff6ee6d 9c7dca3d 46a3f321
	prefetch [%i2+0x140],4	! Annulled
p1_b64:
	membar	#Sync			! Added by membar checker (237)
!	%l7 = 0000000000000073, %l1 = 0000000000000073, %y  = fffffff0
	sdivcc	%l7,%l1,%l0		! %l0 = ffffffffdc61f2a6, %ccr = 88
!	%f16 = 3ff00000, %f4  = 27bc5dc7
	fmovs	%f16,%f4 		! %f4  = 3ff00000
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88

p1_label_53:
!	Mem[0000000015000000] = 00000000, %l4 = fffffffff78abc3d
	lduha	[%i2+%g0]0x80,%l4	! Annulled
p1_b65:
	bg	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000017000000] = e952ab5e 6875ad93, %l2 = 00025f42, %l3 = df9d8e81
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 00000000e952ab5e 000000006875ad93
p1_b66:
	membar	#Sync			! Added by membar checker (238)
!	Mem[0000000030800058] = 028441fd, %l0 = ffffffffdc61f2a6
	swap	[%o1+0x058],%l0		! %l0 = 00000000028441fd
	set	p1_b67,%o7
	fbo,a,pt %fcc3,p1_near_3_he	! Branch Taken, %fcc3 = 0

p1_label_54:
!	%l3 = 000000006875ad93, Mem[000000001580014a] = ebb27521
	stb	%l3,[%i3+0x14a]		! Mem[0000000015800148] = ebb29321
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x043,%g2
p1_b67:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000065f16b96
!	%l5  = 0000000074886a09
	membar	#Sync			! Added by membar checker (239)
!	Mem[0000000032000020] = 881b2ad7, %l7 = 0000000000000073
	lduw	[%o4+0x020],%g2		! %g2 = 0000000000000073
	ba	p1_b68			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[00000000158001a0] = bf504ba5 20fbacf8 9add8020 a816a8f3
	prefetch [%i3+0x1a0],20
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x044,%g2
p1_b68:
	membar	#Sync			! Added by membar checker (240)
!	%l1 = 0000000000000073, %l0 = 00000000028441fd, %l7 = 0000000000000073
	subc	%l1,%l0,%l7		! %l7 = fffffffffd7bbe75

p1_label_55:
!	%f12 = 2a310a65 2543cb73, %f4  = 3ff00000 44a91a12
	fcmpd	%fcc3,%f12,%f4 		! %fcc3 = 1
!	%l3 = 000000006875ad93, %l4 = fffffffff78abc3d, %l7 = fffffffffd7bbe75
	srl	%l3,%l4,%l7		! %l7 = 0000000000000003
	set	p1_b69,%o7
	fble,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	%l7 = 0000000000000003, Mem[0000000030800052] = c5a66cf7
	sth	%l7,[%o1+0x052]		! Mem[0000000030800050] = c5a60003
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x045,%g2
p1_b69:
!	Registers modified during the branch to p1_far_0
!	%l2  = 00000000197c5ae5
!	%l3  = 0000000074886b8a
!	%l4  = 00000001028441fc
!	%l7  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (241)
!	Mem[0000000014000008] = cd196892, %l2 = 00000000197c5ae5
	ldsba	[%i0+%o6]0x80,%l2	! %l2 = ffffffffffffffcd

p1_label_56:
!	%l5 = 0000000074886a09, immed = fffff6fb, %l3 = 0000000074886b8a
	xnor	%l5,-0x905,%l3		! %l3 = 000000007488630d
!	Mem[0000000015000168] = e75807e7, %l4 = 028441fc, %l4 = 028441fc
	add	%i2,0x168,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 00000000e75807e7
!	%l5 = 0000000074886a09, %l2 = ffffffffffffffcd, %l6 = 0000000074886cdb
	sllx	%l5,%l2,%l6		! %l6 = 00000e910d412000
!	%f26 = 3f800000, %f18 = b614a631
	fstoi	%f26,%f18		! %f18 = 00000001
	bvc	p1_not_taken_0		! Branch Not Taken, %ccr = 0a

p1_label_57:
!	Mem[0000000015800008] = 00000000, %l2 = ffffffffffffffcd
	ldsba	[%i3+%o6]0x80,%l2	! %l2 = 0000000000000000
p1_b70:
	membar	#Sync			! Added by membar checker (242)
!	%f4  = 3ff00000, %f29 = 36234d66
	fnegs	%f4 ,%f29		! %f29 = bff00000
!	%l7 = 00000000ffffffff, immed = 0000000b, %l3 = 000000007488630d
	sra	%l7,0x00b,%l3		! %l3 = ffffffffffffffff
	set	p1_b71,%o7
	fbe	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003180001c] = 93078c9a, %l2 = 0000000000000000
	ldsb	[%o3+0x01f],%l2		! %l2 = ffffffffffffff9a
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x047,%g2
p1_b71:

p1_label_58:
	membar	#Sync			! Added by membar checker (243)
!	%l2 = ffffffffffffff9a, %l7 = 00000000ffffffff, %l4 = 00000000e75807e7
	andncc	%l2,%l7,%l4		! %l4 = ffffffff00000000, %ccr = 84
!	%f22 = 00000000 00000000, %f14 = 92f139be 814d7ace, %f16 = 3ff00000 00000000
	fdivd	%f22,%f14,%f16		! %f16 = 80000000 00000000
!	Mem[0000000015000040] = d4cd5edb 4788f0a5 24093edc 92cc491f
	prefetch [%i2+0x040],1
	bne	p1_not_taken_0		! Branch Not Taken, %ccr = 84
!	Mem[000000004000001c] = cd196892, %l2 = ffffffffffffff9a
	lduh	[%o5+0x01e],%l2		! %l2 = 0000000000006892
p1_b72:

p1_label_59:
	membar	#Sync			! Added by membar checker (244)
!	Branch On Register, %l0 = 00000000028441fd
	brlez,a,pt %l0,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000020] = fd1686c2 6f7aae93 580ceb03 104d0c15
	prefetch [%i0+0x020],23	! Annulled
p1_b73:
	bg	p1_not_taken_0		! Branch Not Taken, %ccr = 84
!	%l0 = 00000000028441fd, Mem[000000004000001e] = cd196892
	sth	%l0,[%o5+0x01e]		! Mem[000000004000001c] = cd1941fd
p1_b74:
	bge,a	p1_b75			! Branch Taken, %ccr = 84, CWP = 0

p1_label_60:
!	Mem[0000000031800054] = 0000109f, %l5 = 0000000074886a09
	ldsh	[%o3+0x056],%l5		! %l5 = 000000000000109f
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x04b,%g2
p1_b75:
	membar	#Sync			! Added by membar checker (245)
!	%l0 = 00000000028441fd, Mem[0000000014800000] = 0007c390
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000014800000] = 028441fd
!	%l1 = 0000000000000073, %l6 = 00000e910d412000, %y  = fffffff0
	udivx	%l1,%l6,%l3		! %l3 = 0000000000000000
!	Mem[0000000030000018] = 1f6ed9a9 0000109f, %l0 = 028441fd, %l1 = 00000073
	ldda	[%o0+0x018]%asi,%l0	! %l0 = 000000001f6ed9a9 000000000000109f
!	Mem[000000003200006c] = 70bdc2c6, %l0 = 000000001f6ed9a9
	ldsw	[%o4+0x06c],%g2		! %g2 = 000000001f6ed9a9

p1_label_61:
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 84
!	Mem[0000000015000148] = 9c7dca3d, %l1 = 000000000000109f
	ldub	[%i2+0x148],%l1		! Annulled
p1_b76:
	ble	p1_b77			! Branch Taken, %ccr = 84, CWP = 0
!	%l2 = 00006892, %l3 = 00000000, Mem[0000000030800010] = ff000000 1432ffb5
	std	%l2,[%o1+0x010]	! Mem[0000000030800010] = 00006892 00000000
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x04d,%g2
p1_b77:
	membar	#Sync			! Added by membar checker (246)
!	Mem[00000000150000a5] = f93862a8, %l7 = 00000000ffffffff
	ldstuba	[%i2+0x0a5]%asi,%l7	! %l7 = 0000000000000038

p1_label_62:
	set	p1_b78,%o7
	fbuge,pt %fcc2,p1_near_0_le	! Branch Taken, %fcc2 = 2
!	Mem[0000000015800160] = e6b32122 86599b47 eec4aba8 e30bc8f4
	prefetch [%i3+0x160],22
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x04e,%g2
p1_b78:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffffffffffffff
!	%l3  = 0000000000000000
!	%l7  = 0000000000006892
	membar	#Sync			! Added by membar checker (247)
!	Mem[00000000160001d0] = 0d134630, %l2 = 0000000000006892
	ldsh	[%i4+0x1d2],%l2		! %l2 = 0000000000004630
	fblg,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000008] = cd196892, %l2 = 0000000000004630
	lduha	[%i0+%o6]0x80,%l2	! %l2 = 000000000000cd19
p1_b79:

p1_label_63:
	membar	#Sync			! Added by membar checker (248)
	fbue,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[00000000140000e0] = 3086eccb eddfc120 5a4b4229 26027f7d
	prefetch [%i0+0x0e0],23
p1_b80:
	membar	#Sync			! Added by membar checker (249)
!	%l6 = 00000e910d412000, %l5 = 000000000000109f, %y  = fffffff0
	udiv	%l6,%l5,%l2		! %l2 = 00000000ffffffff
!	Mem[0000000014800160] = 084c9f70 6457f5e3 5215c24b c0df7d96
	prefetcha [%i1+0x160]%asi,0
!	%f16 = 80000000 00000000, %f6  = 2a310a65 15cc54db
	fmovd	%f16,%f6 		! %f6  = 80000000 00000000

p1_label_64:
	set	p1_b81,%o7
	fbug,a,pt %fcc1,p1_near_2_le	! Branch Taken, %fcc1 = 2
!	%l5 = 000000000000109f, Mem[0000000014800008] = ffcd0000
	stba	%l5,[%i1+%o6]0x80	! Mem[0000000014800008] = 9fcd0000
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x051,%g2
p1_b81:
!	Registers modified during the branch to p1_near_2
!	%l2  = 000000001f6ed9a9
!	%l5  = 0000000000000000
!	%l6  = 00000000e0912656
	set	p1_b82,%o7
	fbule,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	%l4 = ffffffff00000000, Mem[000000003000005c] = 00006892
	stw	%l4,[%o0+0x05c]		! Mem[000000003000005c] = 00000000
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x052,%g2
p1_b82:
!	Registers modified during the branch to p1_far_3
!	%l3  = ffffffff1f6ed9a9
!	%l6  = 00000000ffffffff
	ba	p1_b83			! Branch Taken, %ccr = 0a, CWP = 0

p1_label_65:
!	%l7 = 0000000000006892, Mem[0000000015800008] = 00000000028441fd
	stxa	%l7,[%i3+%o6]0x80	! Mem[0000000015800008] = 0000000000006892
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x053,%g2
p1_b83:
	membar	#Sync			! Added by membar checker (250)
!	Mem[0000000014000008] = cd196892, %l0 = 000000001f6ed9a9
	lduha	[%i0+%o6]0x80,%l0	! %l0 = 000000000000cd19
!	%l0 = 000000000000cd19, Mem[000000001400005c] = 04e23803
	stba	%l0,[%i0+0x05c]%asi	! Mem[000000001400005c] = 19e23803
!	%l7 = 0000000000006892
	sethi	%hi(0x4a688000),%l7	! %l7 = 000000004a688000
	bne,a	p1_b84			! Branch Taken, %ccr = 0a, CWP = 0

p1_label_66:
!	Mem[0000000016800008] = b45c5717, %l4 = ffffffff00000000
	lduha	[%i5+%o6]0x80,%l4	! %l4 = 000000000000b45c
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x054,%g2
p1_b84:
	membar	#Sync			! Added by membar checker (251)
	fbe,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[00000000140000ec] = 26027f7d, %l5 = 0000000000000000
	ldsh	[%i0+0x0ee],%l5		! Annulled
p1_b85:
	fbug	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000050] = 00000000, %l5 = 0000000000000000
	ldsh	[%o0+0x052],%l5		! %l5 = 0000000000000000
p1_b86:

p1_label_67:
	membar	#Sync			! Added by membar checker (252)
!	%l6 = 00000000ffffffff, %l1 = ffffffffffffffff, %l6 = 00000000ffffffff
	addc	%l6,%l1,%l6		! %l6 = 00000000fffffffe
!	%l6 = 00000000fffffffe, immed = fffffaee, %l6 = 00000000fffffffe
	sub	%l6,-0x512,%l6		! %l6 = 0000000100000510
!	%f0  = 4849b367 7dd60200, %f6  = 80000000 00000000, %f30 = 82843eb6 a53af447
	fmuld	%f0 ,%f6 ,%f30		! %f30 = 80000000 00000000
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[0000000014000008] = cd196892, %l5 = 0000000000000000
	lduba	[%i0+%o6]0x80,%l5	! %l5 = 00000000000000cd
p1_b87:

p1_label_68:
	membar	#Sync			! Added by membar checker (253)
!	%f10 = 368ec0c8 4000e4db, %f8  = 12f139be 80000000
	fcmped	%fcc3,%f10,%f8 		! %fcc3 = 2
	nop				! Delay added due to fcmp
	set	p1_b88,%o7
	fba,a,pn %fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000031800014] = b9a1a310, %l1 = ffffffffffffffff
	ldub	[%o3+0x014],%l1		! Annulled
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x058,%g2
p1_b88:
!	Registers modified during the branch to p1_near_2
!	%l0  = 0000000100000854
!	%l5  = 125cb97a9abe53a6
	membar	#Sync			! Added by membar checker (254)
	set	p1_b89,%o7
	fble,pn	%fcc0,p1_near_1_le	! Branch Taken, %fcc0 = 0
!	%l0 = 00000854, %l1 = ffffffff, Mem[0000000031000018] = 4243b288 de53bbc8
	std	%l0,[%o2+0x018]	! Mem[0000000031000018] = 00000854 ffffffff
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x059,%g2
p1_b89:
!	Registers modified during the branch to p1_near_1
!	%l4  = 000000010000050f
!	%l7  = 0000000000000000

p1_label_69:
	membar	#Sync			! Added by membar checker (255)
!	%l3 = ffffffff1f6ed9a9
	sethi	%hi(0xeba9f000),%l3	! %l3 = 00000000eba9f000
	bvs,a	p1_b90			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[0000000015800000] = 37017cc8, %l3 = 00000000eba9f000
	lduha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000003701
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x05a,%g2
p1_b90:
	bpos,a	p1_b91			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[0000000015800067] = 889bea7c, %l4 = 000000010000050f
	ldstub	[%i3+0x067],%l4		! %l4 = 000000000000007c
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x05b,%g2
p1_b91:

p1_label_70:
	membar	#Sync			! Added by membar checker (256)
!	%f14 = 92f139be 814d7ace, %f22 = 00000000 00000000, %f24 = 6a2ba0dc 36234d66
	faddd	%f14,%f22,%f24		! %f24 = 92f139be 814d7ace
!	Mem[0000000031000014] = b9bf24d3, %l7 = 0000000000000000
	ldsb	[%o2+0x015],%l7		! %l7 = ffffffffffffffbf
!	%l0 = 0000000100000854, %l0 = 0000000100000854, %l3 = 0000000000003701
	andn	%l0,%l0,%l3		! %l3 = 0000000000000000
	fbl,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000014000164] = a1bdb372, %l7 = ffffffffffffffbf
	lduh	[%i0+0x166],%l7		! %l7 = 000000000000b372
p1_b92:

p1_label_71:
	membar	#Sync			! Added by membar checker (257)
!	Mem[0000000015000080] = 38f7db20 be32e3cc bba6a716 e6b021b7
	prefetch [%i2+0x080],0
!	%l4 = 000000000000007c, %l5 = 125cb97a9abe53a6, %y  = fffffff0
	umul	%l4,%l5,%l6		! %l6 = 0000004af4308468
!	Denormal Floating Point Operation Nullified
	nop
!	%f8  = 12f139be 80000000, %f2  = 5986ef9c a663fdda
	fcmped	%fcc1,%f8 ,%f2 		! %fcc1 = 1
!	Mem[0000000030000055] = 00000073, %l2 = 000000001f6ed9a9
	ldstuba	[%o0+0x055]%asi,%l2	! %l2 = 0000000000000000

p1_label_72:
!	Mem[0000000014000090] = 579b8cc7, %l6 = 0000004af4308468
	swap	[%i0+0x090],%l6		! %l6 = 00000000579b8cc7
!	%f20 = b68ec0c8, %f26 = 3f800000
	fabss	%f20,%f26		! %f26 = 368ec0c8
	bl,a	p1_b93			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[0000000015000160] = d9214ef8 c62586d2 e75807e7 24349ca1
	prefetch [%i2+0x160],4
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x05d,%g2
p1_b93:
	membar	#Sync			! Added by membar checker (258)
!	Mem[0000000015000008] = ff9c8df2, %l7 = 000000000000b372
	ldswa	[%i2+%o6]0x80,%l7	! %l7 = ffffffffff9c8df2

p1_label_73:
!	%l1 = ffffffffffffffff, Mem[000000003200000c] = d8311ea6
	stw	%l1,[%o4+0x00c]		! Mem[000000003200000c] = ffffffff
!	%f14 = 92f139be 814d7ace, %f26 = 368ec0c8 2663fdda
	fabsd	%f14,%f26		! %f26 = 12f139be 814d7ace
!	Mem[0000000014000070] = 6dc83382, %l7 = ffffffffff9c8df2
	ldsha	[%i0+0x070]%asi,%l7	! %l7 = 0000000000006dc8
!	%l0 = 0000000100000854
	setx	0x78a4b49b78a4b49b,%g7,%l0 ! %l0 = 78a4b49b78a4b49b
	set	p1_b94,%o7
	fble,a	p1_far_2_he	! Branch Taken, %fcc0 = 0

p1_label_74:
!	%l1 = ffffffffffffffff, Mem[0000000030000050] = 00000000
	stw	%l1,[%o0+0x050]		! Mem[0000000030000050] = ffffffff
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x05e,%g2
p1_b94:
!	Registers modified during the branch to p1_far_2
!	%l0  = 000000000000007c
!	%l1  = ffffffffffffffff
!	%l2  = 0000000000000000
!	%l3  = 0000000000000004
!	%l7  = 000000000000007c
	membar	#Sync			! Added by membar checker (259)
!	%l5 = 125cb97a9abe53a6, immed = 00000ad4, %l5 = 125cb97a9abe53a6
	subc	%l5,0xad4,%l5		! %l5 = 125cb97a9abe48d1
!	Branch On Register, %l2 = 0000000000000000
	brlez,pn %l2,p1_b95		! Branch Taken
!	%l1 = ffffffffffffffff, Mem[000000001580004e] = 786e0cde
	sth	%l1,[%i3+0x04e]		! Mem[000000001580004c] = 786effff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x05f,%g2
p1_b95:
	membar	#Sync			! Added by membar checker (260)
!	Mem[0000000015000008] = ff9c8df2, %l6 = 00000000579b8cc7
	ldstuba	[%i2+%o6]0x80,%l6	! %l6 = 00000000000000ff

p1_label_75:
	fbue,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000032000010] = 852cb3e2, %l2 = 0000000000000000
	ldsw	[%o4+0x010],%g2		! Annulled
p1_b96:
	membar	#Sync			! Added by membar checker (261)
!	%f23 = 00000000, %f10 = 368ec0c8, %f12 = 2a310a65
	fdivs	%f23,%f10,%f12		! %f12 = 00000000
!	%l0 = 000000000000007c, immed = fffff73b, %l7 = 000000000000007c
	xnorcc	%l0,-0x8c5,%l7		! %l7 = 00000000000008b8, %ccr = 00
	set	p1_b97,%o7
	fba,a	p1_far_1_le	! Branch Taken, %fcc0 = 0

p1_label_76:
!	Mem[0000000014800008] = 9fcd0000, %l3 = 0000000000000004
	ldstuba	[%i1+%o6]0x80,%l3	! Annulled
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x061,%g2
p1_b97:
!	Registers modified during the branch to p1_far_1
!	%l2  = 0000000000000000
!	%l6  = fffffffff78abbca
	set	p1_b98,%o7
	fbuge	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000013] = 039d473f, %l3 = 0000000000000004
	ldstub	[%i2+0x013],%l3		! %l3 = 000000000000003f
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x062,%g2
p1_b98:
!	Registers modified during the branch to p1_far_0
!	%l2  = 0000000000000000
!	%l3  = fffffffff78aba79
!	%l4  = 000000000000007c
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (262)
!	%f6  = 80000000 00000000, %f24 = 92f139be 814d7ace, %f28 = 6a2ba0dc bff00000
	fdivd	%f6 ,%f24,%f28		! %f28 = 00000000 00000000
!	%f14 = 92f139be, %f10 = 368ec0c8 4000e4db
	fstod	%f14,%f10		! %f10 = ba5e2737 c0000000

p1_label_77:
!	%l0 = 000000000000007c, immed = fffff4f4, %y  = 00000000
	sdivcc	%l0,-0xb0c,%l1		! %l1 = 0000000000000000, %ccr = 44
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 000000000000007c, Mem[0000000030000054] = 9abe48d1
	sth	%l4,[%o0+0x054]		! Mem[0000000030000054] = 007c48d1
p1_b99:
	membar	#Sync			! Added by membar checker (263)
!	%l5 = 125cb97a9abe48d1, %l7 = 0000000000000000, %l6 = fffffffff78abbca
	srlx	%l5,%l7,%l6		! %l6 = 125cb97a9abe48d1
!	Mem[000000001400001c] = 84e87c0c, %l4 = 000000000000007c
	lduba	[%i0+0x01d]%asi,%l4	! %l4 = 00000000000000e8

p1_label_78:
!	%f4  = 3ff00000, %f29 = 00000000
	fmovs	%f4 ,%f29		! %f29 = 3ff00000
!	%l1 = 0000000000000000, immed = 0000005a, %l0 = 000000000000007c
	xorcc	%l1,0x05a,%l0		! %l0 = 000000000000005a, %ccr = 00
	set	p1_b100,%o7
	fbue,a	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[000000003100005c] = 2e62e2c5, %l3 = fffffffff78aba79
	ldsw	[%o2+0x05c],%l3		! %l3 = 000000002e62e2c5
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x064,%g2
p1_b100:
!	Registers modified during the branch to p1_far_3
!	%l4  = 00000000000000c0
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (264)
!	Mem[0000000014800000] = 028441fd, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000028441fd

p1_label_79:
!	Branch On Register, %l0 = 000000000000005a
	brlz,a,pn %l0,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000000] = ff25857b, %l1 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l1	! Annulled
p1_b101:
	membar	#Sync			! Added by membar checker (265)
!	Mem[0000000015000130] = 730697ba 0e892425, %l0 = 0000005a, %l1 = 00000000
	ldda	[%i2+0x130]%asi,%l0	! %l0 = 00000000730697ba 000000000e892425
!	%f9  = 80000000, %f22 = 00000000, %f15 = 814d7ace
	fmuls	%f9 ,%f22,%f15		! %f15 = 80000000
	bne,a	p1_b102			! Branch Taken, %ccr = 00, CWP = 0

p1_label_80:
!	Mem[0000000014800008] = 9fcd0000, %l7 = 0000000000000000
	lduba	[%i1+%o6]0x80,%l7	! %l7 = 000000000000009f
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x066,%g2
p1_b102:
	membar	#Sync			! Added by membar checker (266)
!	%l5 = 125cb97a9abe48d1, Mem[0000000014000141] = e26c2aed
	stb	%l5,[%i0+0x141]		! Mem[0000000014000140] = e2d12aed
!	%f30 = 80000000, %f11 = c0000000, %f3  = a663fdda
	fsubs	%f30,%f11,%f3 		! %f3  = 40000000
!	%f12 = 00000000, %f25 = 814d7ace
	fcmpes	%fcc0,%f12,%f25		! %fcc0 = 2
	nop				! Delay added due to fcmp
	fbu,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 2

p1_label_81:
!	Mem[0000000032000060] = 00000000 000000ff 65b76271 70bdc2c6
	prefetch [%o4+0x060],4	! Annulled
p1_b103:
	membar	#Sync			! Added by membar checker (267)
!	Mem[0000000030000018] = 1f6ed9a9 0000109f, %l2 = 028441fd, %l3 = 2e62e2c5
	ldd	[%o0+0x018],%l2		! %l2 = 000000001f6ed9a9 000000000000109f
!	Mem[0000000014000000] = ff25857b, %l1 = 000000000e892425
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000014800120] = 9cf726c4 00cbea2c 9552f6d7 ee07d2b6
	prefetch [%i1+0x120],22
!	%l1 = 00000000000000ff, Mem[0000000040000018] = daf47c79
	stha	%l1,[%o5+0x018]%asi	! Mem[0000000040000018] = 00ff7c79

p1_label_82:
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000014800000] = 00000000, %l7 = 000000000000009f
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
p1_b104:
	membar	#Sync			! Added by membar checker (268)
!	%f16 = 80000000 00000000, %f10 = ba5e2737 c0000000, %f4  = 3ff00000 44a91a12
	fdivd	%f16,%f10,%f4 		! %f4  = 00000000 00000000
	set	p1_b105,%o7
	fbge,a	p1_far_0_he	! Branch Taken, %fcc0 = 2
!	%l0 = 730697ba, %l1 = 000000ff, Mem[0000000014800008] = 9fcd0000 000000ba
	stda	%l0,[%i1+%o6]0x80	! Mem[0000000014800008] = 730697ba 000000ff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x069,%g2
p1_b105:
!	Registers modified during the branch to p1_far_0
!	%l2  = 0000000007dbb66a
!	%l3  = 125cb97a9abe4780
!	%l4  = 00000000730697be
!	%l7  = 0000000000000004

p1_label_83:
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l0 = 730697ba, %l1 = 000000ff, Mem[0000000031800050] = 6c9da207 0000109f
	std	%l0,[%o3+0x050]	! Annulled
p1_b106:
	fbue,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i0+%o6]0x80,%l0
p1_b107:
	membar	#Sync			! Added by membar checker (269)
!	%l0 = 00000000730697ba, Mem[0000000015800000] = 37017cc8
	stwa	%l0,[%i3+%g0]0x80	! Mem[0000000015800000] = 730697ba

p1_label_84:
!	%f4  = 00000000 00000000, %f12 = 00000000
	fxtos	%f4 ,%f12		! %f12 = 00000000
!	%l2 = 0000000007dbb66a, %l1 = 00000000000000ff, %l3 = 125cb97a9abe4780
	taddcc	%l2,%l1,%l3		! %l3 = 0000000007dbb769, %ccr = 02
!	Mem[0000000016000000] = 4c9254d4, %l3 = 0000000007dbb769
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000004c92
!	%l0 = 730697ba, %l1 = 000000ff, Mem[00000000140000d8] = eb70cd58 a5f3b80a
	std	%l0,[%i0+0x0d8]	! Mem[00000000140000d8] = 730697ba 000000ff
!	Mem[0000000014800000] = ff000000, %l4 = 00000000730697be
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff000000

p1_label_85:
!	%l2 = 0000000007dbb66a, immed = fffff01f, %l1 = 00000000000000ff
	sub	%l2,-0xfe1,%l1		! %l1 = 0000000007dbc64b
!	%f22 = 00000000 00000000, %f14 = 92f139be 80000000, %f22 = 00000000 00000000
	fmuld	%f22,%f14,%f22		! %f22 = 80000000 00000000
!	%l2 = 0000000007dbb66a, immed = ffffff58, %l7 = 0000000000000004
	tsubcc	%l2,-0x0a8,%l7		! %l7 = 0000000007dbb712, %ccr = 13
!	%f30 = 80000000, %f16 = 80000000
	fstoi	%f30,%f16		! %f16 = 00000000
	set	p1_b108,%o7
	fbo,a	p1_far_1_he	! Branch Taken, %fcc0 = 2

p1_label_86:
!	Mem[0000000014000000] = ff25857b, %l5 = 125cb97a9abe48d1
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x06c,%g2
p1_b108:
!	Registers modified during the branch to p1_far_1
!	%l2  = 0000000000004080
!	%l3  = 0000000000003a56
	membar	#Sync			! Added by membar checker (270)
!	%l1 = 0000000007dbc64b, Mem[0000000015800128] = e21099f0
	stwa	%l1,[%i3+0x128]%asi	! Mem[0000000015800128] = 07dbc64b
!	Mem[00000000150000f0] = 8f887ff2 04ac037b, %l4 = ff000000, %l5 = ffffffff
	ldd	[%i2+0x0f0],%l4		! %l4 = 000000008f887ff2 0000000004ac037b
!	Mem[0000000015800008] = 00000000, %l5 = 0000000004ac037b
	lduwa	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000000
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 2

p1_label_87:
!	Mem[0000000015800000] = 730697ba, %l0 = 00000000730697ba
	lduwa	[%i3+%g0]0x80,%l0	! Annulled
p1_b109:
	membar	#Sync			! Added by membar checker (271)
!	%f13 = 2543cb73, %f2  = 5986ef9c 40000000
	fitod	%f13,%f2 		! %f2  = 41c2a1e5 b9800000
!	%l5 = 0000000000000000, immed = fffff522, %l1 = 0000000007dbc64b
	sub	%l5,-0xade,%l1		! %l1 = 0000000000000ade
!	%l3 = 0000000000003a56, %l5 = 0000000000000000, %l5 = 0000000000000000
	sra	%l3,%l5,%l5		! %l5 = 0000000000003a56
!	%f22 = 80000000 00000000, %f10 = ba5e2737 c0000000, %f14 = 92f139be 80000000
	fsubd	%f22,%f10,%f14		! %f14 = 3a5e2737 c0000000

p1_label_88:
!	%l5 = 0000000000003a56, Mem[0000000032000030] = 6d1accd5
	stha	%l5,[%o4+0x030]%asi	! Mem[0000000032000030] = 3a56ccd5
!	%f10 = ba5e2737 c0000000, %f14 = 3a5e2737 c0000000
	fcmpd	%fcc0,%f10,%f14		! %fcc0 = 1
!	%l5 = 0000000000003a56, immed = 00000144, %l0 = 00000000730697ba
	xorcc	%l5,0x144,%l0		! %l0 = 0000000000003b12, %ccr = 00
!	%f3  = b9800000, %f22 = 80000000
	fmovs	%f3 ,%f22		! %f22 = b9800000
!	%f4  = 00000000, %f21 = 4000e4db, %f23 = 00000000
	fdivs	%f4 ,%f21,%f23		! %f23 = 00000000

p1_label_89:
!	Mem[0000000015000000] = 00000000, %l2 = 0000000000004080
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030000018] = 1f6ed9a9, %l2 = 0000000000000000
	lduh	[%o0+0x01a],%l2		! %l2 = 000000000000d9a9
!	%f24 = 92f139be 814d7ace, %f2  = 41c2a1e5 b9800000
	fabsd	%f24,%f2 		! %f2  = 12f139be 814d7ace
!	%f16 = 00000000 00000000, %f30 = 80000000 00000000
	fabsd	%f16,%f30		! %f30 = 00000000 00000000
	fbge,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1

p1_label_90:
!	%l1 = 0000000000000ade, Mem[0000000031000058] = ab786e722e62e2c5
	stx	%l1,[%o2+0x058]		! Annulled
p1_b110:
	fbuge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014000000] = ff25857be1e75c6c, %l2 = 000000000000d9a9
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = ff25857be1e75c6c
p1_b111:
	membar	#Sync			! Added by membar checker (272)
!	%l6 = 125cb97a9abe48d1, immed = fffff8ff, %y  = 00000000
	sdivx	%l6,-0x701,%l3		! %l3 = fffd60d7ab1a97e0
	fble,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2

p1_label_91:
!	Mem[0000000015800140] = c26b3d57, %l6 = 125cb97a9abe48d1
	lduw	[%i3+0x140],%l6		! Annulled
p1_b112:
	membar	#Sync			! Added by membar checker (273)
!	%l4 = 000000008f887ff2, Mem[00000000160000b8] = a8896b7325963d61
	stxa	%l4,[%i4+0x0b8]%asi	! Mem[00000000160000b8] = 000000008f887ff2
!	%l2 = ff25857be1e75c6c, %l5 = 0000000000003a56, %y  = 00000000
	udivx	%l2,%l5,%l4		! %l4 = 00045fadcfdcecf6
!	%f21 = 4000e4db, %f23 = 00000000, %f14 = 3a5e2737
	fmuls	%f21,%f23,%f14		! %f14 = 00000000
!	%f2  = 12f139be 814d7ace, %f24 = 92f139be 814d7ace
	fcmped	%fcc0,%f2 ,%f24		! %fcc0 = 2

p1_label_92:
!	%l2 = ff25857be1e75c6c, Mem[0000000031000052] = 00000000
	sth	%l2,[%o2+0x052]		! Mem[0000000031000050] = 00005c6c
!	%l5 = 0000000000003a56, immed = fffff3eb, %l0 = 0000000000003b12
	andn	%l5,-0xc15,%l0		! %l0 = 0000000000000814
!	%l4 = 00045fadcfdcecf6, %l1 = 0000000000000ade, %l6 = 125cb97a9abe48d1
	orcc	%l4,%l1,%l6		! %l6 = 00045fadcfdceefe, %ccr = 08
!	%f4  = 00000000, %f3  = 814d7ace, %f15 = c0000000
	fdivs	%f4 ,%f3 ,%f15		! %f15 = 80000000
!	Mem[0000000015000008] = ff9c8df2348bcced, %l1 = 0000000000000ade
	ldxa	[%i2+%o6]0x80,%l1	! %l1 = ff9c8df2348bcced

p1_label_93:
!	%l2 = ff25857be1e75c6c, immed = 00000209, %y  = 00000000
	mulx	%l2,0x209,%l7		! %l7 = 435ca91ebfdb17cc
	set	p1_b113,%o7
	fbo,a,pn %fcc3,p1_near_2_le	! Branch Taken, %fcc3 = 2
!	Mem[0000000032000048] = b4eadc8a, %l0 = 0000000000000814
	ldsw	[%o4+0x048],%g2		! %g2 = 0000000000000814
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x071,%g2
p1_b113:
!	Registers modified during the branch to p1_near_2
!	%l2  = 00029f2854e57034
!	%l5  = fac1af56352fc000
!	%l6  = fffba05230231b1d
	membar	#Sync			! Added by membar checker (274)
!	%l0 = 0000000000000814, Mem[0000000031000019] = 00000854
	stb	%l0,[%o2+0x019]		! Mem[0000000031000018] = 00140854
!	%f0  = 4849b367, %f11 = c0000000, %f4  = 00000000 00000000
	fsmuld	%f0 ,%f11,%f4 		! %f4  = c119366c e0000000

p1_label_94:
!	Mem[0000000032000044] = 03faa03f, %l3 = fffd60d7ab1a97e0
	lduwa	[%o4+0x044]%asi,%g2	! %g2 = fffd60d7ab1a97e0
!	%l0 = 0000000000000814, Mem[000000003200001b] = c8776ec9
	stba	%l0,[%o4+0x01b]%asi	! Mem[0000000032000018] = 14776ec9
!	%l3 = fffd60d7ab1a97e0, Mem[0000000030800058] = dc61f2a6
	stha	%l3,[%o1+0x058]%asi	! Mem[0000000030800058] = 97e0f2a6
	bcc	p1_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[00000000140001c0] = ffffffff fffb6b72 f067460d 5812992f
	prefetch [%i0+0x1c0],16
p1_b114:

p1_label_95:
	membar	#Sync			! Added by membar checker (275)
!	%f2  = 12f139be, %f18 = 00000001
	fnegs	%f2 ,%f18		! %f18 = 92f139be
!	Mem[0000000014800160] = 084c9f70 6457f5e3
	flush	%i1+0x160
!	%l3 = fffd60d7ab1a97e0, immed = fffff4e5, %l7 = 435ca91ebfdb17cc
	add	%l3,-0xb1b,%l7		! %l7 = fffd60d7ab1a8cc5
	ba	p1_b115			! Branch Taken, %ccr = 11, CWP = 0
!	%l4 = cfdcecf6, %l5 = 352fc000, Mem[0000000015800008] = 00000000 00006892
	stda	%l4,[%i3+%o6]0x80	! Mem[0000000015800008] = cfdcecf6 352fc000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x073,%g2
p1_b115:

p1_label_96:
	membar	#Sync			! Added by membar checker (276)
!	Mem[00000000140000d4] = 680cfb6b, %l5 = fac1af56352fc000
	ldsw	[%i0+0x0d4],%l5		! %l5 = 00000000680cfb6b
!	%l5 = 00000000680cfb6b, immed = fffff724, %l4 = 00045fadcfdcecf6
	xnor	%l5,-0x8dc,%l4		! %l4 = 00000000680cf3b0
!	Mem[0000000030000054] = 007c48d1, %l4 = 00000000680cf3b0
	ldsw	[%o0+0x054],%l4		! %l4 = 00000000007c48d1
!	Mem[0000000014000000] = ff25857b, %l0 = 0000000000000814
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000032000010] = b3e2c2ee, %l4 = 00000000007c48d1
	ldsha	[%o4+0x012]%asi,%g2	! %g2 = ffffffffffffb3e2

p1_label_97:
	ble,a	p1_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000015000158] = 94dd6510, %l6 = fffba05230231b1d
	swap	[%i2+0x158],%l6		! Annulled
p1_b116:
	membar	#Sync			! Added by membar checker (277)
!	%l5 = 00000000680cfb6b, immed = 0000015a, %l0 = 00000000000000ff
	add	%l5,0x15a,%l0		! %l0 = 00000000680cfcc5
!	%l5 = 00000000680cfb6b, immed = 00000ec9, %y  = 00000000
	smul	%l5,0xec9,%l4		! %l4 = 0000060267f14103
	set	p1_b117,%o7
	fbg,a	p1_far_2_le	! Branch Taken, %fcc0 = 2

p1_label_98:
!	Mem[000000003000001c] = 0000109f, %l3 = fffd60d7ab1a97e0
	lduw	[%o0+0x01c],%l3		! %l3 = 000000000000109f
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x075,%g2
p1_b117:
!	Registers modified during the branch to p1_far_2
!	%l3  = 0000000000000602
!	%l6  = ff9c8df2ffffeeef
!	%l7  = 000000002ffec3a8
	membar	#Sync			! Added by membar checker (278)
!	%l6 = ffffeeef, %l7 = 2ffec3a8, Mem[0000000014800008] = 730697ba 000000ff
	stda	%l6,[%i1+%o6]0x80	! Mem[0000000014800008] = ffffeeef 2ffec3a8
!	%l1 = ff9c8df2348bcced, Mem[000000003200006c] = 70bdc2c6
	stha	%l1,[%o4+0x06c]%asi	! Mem[000000003200006c] = ccedc2c6
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[00000000140000a0] = e1c3db97 c3a2ef2d 7a2f8638 c2ea976b
	prefetch [%i0+0x0a0],22
p1_b118:

p1_label_99:
	membar	#Sync			! Added by membar checker (279)
!	%l1 = ff9c8df2348bcced, immed = 00000178, %y  = 00000602
	umul	%l1,0x178,%l1		! %l1 = 0000004d2d54fc18
!	%l5 = 00000000680cfb6b, Mem[000000003100005f] = 2e62e2c5
	stb	%l5,[%o2+0x05f]		! Mem[000000003100005c] = 2e62e26b
!	%l7 = 000000002ffec3a8, Mem[00000000150001b8] = ddcda3d0
	stba	%l7,[%i2+0x1b8]%asi	! Mem[00000000150001b8] = a8cda3d0
!	Mem[00000000148000e0] = 8cd0397b eedeaf9e 1ee63baf cc5d3a99
	prefetcha [%i1+0x0e0]%asi,1
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 11

p1_label_100:
!	Mem[00000000140000c8] = c79cb202, %l3 = 0000000000000602
	swap	[%i0+0x0c8],%l3		! Annulled
p1_b119:
	membar	#Sync			! Added by membar checker (280)
!	%f4  = c119366c e0000000, %f20 = b68ec0c8 4000e4db
	fnegd	%f4 ,%f20		! %f20 = 4119366c e0000000
!	Mem[0000000015000008] = ff9c8df2, %l7 = 000000002ffec3a8
	ldswa	[%i2+%o6]0x80,%l7	! %l7 = ffffffffff9c8df2
	bcc	p1_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000030800015] = 00000000, %l5 = 00000000680cfb6b
	ldstub	[%o1+0x015],%l5		! %l5 = 0000000000000000
p1_b120:

p1_label_101:
	membar	#Sync			! Added by membar checker (281)
!	%f20 = 4119366c e0000000, %f26 = 12f139be 814d7ace
	fnegd	%f20,%f26		! %f26 = c119366c e0000000

	ba,a	p1_not_taken_0_end
p1_not_taken_0:
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba,a	p1_branch_failed
p1_not_taken_0_end:

!	%l0 = 00000000680cfcc5, immed = 00000bcf, %y  = 0000004d
	mulx	%l0,0xbcf,%l6		! %l6 = 000004ccb15cda4b
!	Mem[0000000030800050] = c5a600039bcd4b21, %l6 = 000004ccb15cda4b
	ldxa	[%o1+0x050]%asi,%l6	! %l6 = c5a600039bcd4b21
!	Mem[000000001480016c] = c0df7d96, %l1 = 0000004d2d54fc18
	ldstuba	[%i1+0x16c]%asi,%l1	! %l1 = 00000000000000c0
!	Mem[0000000015800000] = 730697ba ff02c55d cfdcecf6 352fc000
	prefetcha [%i3+0x000]%asi,1

p1_label_102:
!	%l5 = 0000000000000000, %l0 = 00000000680cfcc5, %l6 = c5a600039bcd4b21
	addcc	%l5,%l0,%l6		! %l6 = 00000000680cfcc5, %ccr = 00
	bcs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000015800008] = cfdcecf6, %l0 = 00000000680cfcc5
	swapa	[%i3+%o6]0x80,%l0	! Annulled
p1_b121:
	membar	#Sync			! Added by membar checker (282)
!	Branch On Register, %l6 = 00000000680cfcc5
	brgez,a,pt %l6,p1_b122		! Branch Taken
!	Mem[0000000014000044] = 9abe53a6, %l3 = 0000000000000602
	lduh	[%i0+0x046],%l3		! %l3 = 00000000000053a6
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x07a,%g2
p1_b122:

p1_label_103:
	membar	#Sync			! Added by membar checker (283)
!	%l3 = 00000000000053a6, %l5 = 0000000000000000, %l7 = ffffffffff9c8df2
	sra	%l3,%l5,%l7		! %l7 = 00000000000053a6
!	Mem[000000001500014c] = 46a3f321, %l3 = 00000000000053a6
	lduw	[%i2+0x14c],%l3		! %l3 = 0000000046a3f321
!	Mem[0000000015800008] = cfdcecf6352fc000, %l5 = 0000000000000000
	ldxa	[%i3+%o6]0x80,%l5	! %l5 = cfdcecf6352fc000
!	Mem[0000000032000008] = 6b78d8c7ffffffff, %l3 = 0000000046a3f321
	ldx	[%o4+0x008],%g2		! %g2 = 6b78d8c7ffffffff
!	%l0 = 00000000680cfcc5, Mem[0000000040000018] = 00ff7c79
	sth	%l0,[%o5+0x018]		! Mem[0000000040000018] = fcc57c79

p1_label_104:
!	%l2 = 00029f2854e57034, Mem[0000000015800008] = cfdcecf6
	stba	%l2,[%i3+%o6]0x80	! Mem[0000000015800008] = 34dcecf6
!	Mem[00000000148001e0] = 317a524a 5f3409e8 713ac207 00059d44
	prefetch [%i1+0x1e0],4
	set	p1_b123,%o7
	fbge,pt	%fcc3,p1_near_2_le	! Branch Taken, %fcc3 = 2
!	Mem[0000000031000011] = e6f398ec, %l1 = 00000000000000c0
	ldstub	[%o2+0x011],%l1		! %l1 = 00000000000000f3
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x07b,%g2
p1_b123:
!	Registers modified during the branch to p1_near_2
!	%l2  = 00000000216909a4
!	%l5  = 0000008d47e64200
!	%l6  = fffff9fdf0024239
	membar	#Sync			! Added by membar checker (284)
!	%f21 = e0000000, %f14 = 00000000
	fnegs	%f21,%f14		! %f14 = 60000000

p1_label_105:
	bcc	p1_b124			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[00000000168001a0] = 9f1f3c23 ccb6388e 4600a6fa 13a45b0c
	prefetch [%i5+0x1a0],16
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x07c,%g2
p1_b124:
	membar	#Sync			! Added by membar checker (285)
!	Mem[0000000015800180] = 2eb7bbb1 8183ff3e 53e0d232 0215645f
	prefetch [%i3+0x180],20
!	Mem[0000000015000094] = 1f5a9693, %l7 = 00000000000053a6
	ldswa	[%i2+0x094]%asi,%l7	! %l7 = 000000001f5a9693
!	Mem[0000000014800080] = ef71ac9661c2cbc4, %l3 = 0000000046a3f321
	ldxa	[%i1+0x080]%asi,%l3	! %l3 = ef71ac9661c2cbc4

p1_label_106:
!	Mem[0000000014000008] = cd196892 cf7f7aee, %l4 = 67f14103, %l5 = 47e64200
	ldda	[%i0+%o6]0x80,%l4	! %l4 = 00000000cd196892 00000000cf7f7aee
!	Mem[0000000014800004] = a763720d, %l5 = 00000000cf7f7aee
	swapa	[%i1+0x004]%asi,%l5	! %l5 = 00000000a763720d
	set	p1_b125,%o7
	fbo,a,pt %fcc1,p1_near_1_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000015000000] = 00000000, %l1 = 00000000000000f3
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x07d,%g2
p1_b125:
!	Registers modified during the branch to p1_near_1
!	%l4  = fffff9fdf0024239
!	%l7  = 00000000000000ff
	membar	#Sync			! Added by membar checker (286)
!	Mem[00000000150000a0] = c0d90fbd f9ff62a8 298884b0 44f2eb82
	prefetcha [%i2+0x0a0]%asi,23

p1_label_107:
	bleu	p1_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[00000000158001b0] = bc7f1fae, %l7 = 00000000000000ff
	ldub	[%i3+0x1b1],%l7		! %l7 = 000000000000007f
p1_b126:
	membar	#Sync			! Added by membar checker (287)
!	%l6 = fffff9fdf0024239, %l6 = fffff9fdf0024239, %l4 = fffff9fdf0024239
	orncc	%l6,%l6,%l4		! %l4 = ffffffffffffffff, %ccr = 88
!	Mem[00000000148000e0] = 8cd0397b eedeaf9e 1ee63baf cc5d3a99
	prefetcha [%i1+0x0e0]%asi,22
	bpos	p1_not_taken_0		! Branch Not Taken, %ccr = 88

p1_label_108:
!	Mem[0000000015800008] = 34dcecf6, %l3 = ef71ac9661c2cbc4
	ldswa	[%i3+%o6]0x80,%l3	! %l3 = 0000000034dcecf6
p1_b127:
	membar	#Sync			! Added by membar checker (288)
!	%l2 = 00000000216909a4, Mem[00000000140000ec] = 26027f7d
	stwa	%l2,[%i0+0x0ec]%asi	! Mem[00000000140000ec] = 216909a4
!	%l1 = 0000000000000000, immed = 00000006, %l7 = 000000000000007f
	srl	%l1,0x006,%l7		! %l7 = 0000000000000000
!	%l3 = 0000000034dcecf6, immed = fffffbb1, %y  = 0000004d
	umul	%l3,-0x44f,%l3		! %l3 = 34dcec123c1f0816
!	%l5 = 00000000a763720d, %l3 = 34dcec123c1f0816, %l6 = fffff9fdf0024239
	sra	%l5,%l3,%l6		! %l6 = fffffffffffffe9d

p1_label_109:
!	%l5 = 00000000a763720d, immed = 000009c4, %y  = 34dcec12
	udiv	%l5,0x9c4,%l6		! %l6 = 00000000ffffffff
!	Mem[00000000158001c0] = 36436ad2 3158c829 6e0e431a eb5eb5d5
	prefetch [%i3+0x1c0],2
!	%l7 = 0000000000000000, immed = ffffff70, %l3 = 34dcec123c1f0816
	or	%l7,-0x090,%l3		! %l3 = ffffffffffffff70
!	%l4 = ffffffffffffffff
	setx	0x1774a40d1774a40d,%g7,%l4 ! %l4 = 1774a40d1774a40d
!	Mem[0000000014000008] = cd196892, %l5 = 00000000a763720d
	lduwa	[%i0+%o6]0x80,%l5	! %l5 = 00000000cd196892

p1_label_110:
!	Branch On Register, %l6 = 00000000ffffffff
	brlez,pn %l6,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000000] = ff25857b, %l0 = 00000000680cfcc5
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff25857b
p1_b128:
	membar	#Sync			! Added by membar checker (289)
!	%l6 = 00000000ffffffff, immed = 00000036, %l4 = 1774a40d1774a40d
	srax	%l6,0x036,%l4		! %l4 = 0000000000000000
!	Mem[0000000015800000] = 730697ba, %l6 = 00000000ffffffff
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000730697ba
	set	p1_b129,%o7
	fbuge,a,pt %fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 2

p1_label_111:
!	Mem[0000000014800000] = 730697be, %l5 = 00000000cd196892
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000073
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x081,%g2
p1_b129:
!	Registers modified during the branch to p1_near_2
!	%l0  = 0000000073069afe
!	%l5  = 125cb97a9abe53a6
	membar	#Sync			! Added by membar checker (290)
!	%f11 = c0000000, %f19 = 00000000
	fstoi	%f11,%f19		! %f19 = fffffffe
	bgu	p1_not_taken_0		! Branch Not Taken, %ccr = 13
!	%l1 = 0000000000000000, Mem[0000000015800008] = 34dcecf6
	stha	%l1,[%i3+%o6]0x80	! Mem[0000000015800008] = 0000ecf6
p1_b130:
	set	p1_b131,%o7
	fblg	p1_far_3_le	! Branch Taken, %fcc0 = 2

p1_label_112:
!	Mem[00000000150001e8] = 00c10000 000081c1, %l4 = 00000000, %l5 = 9abe53a6
	ldd	[%i2+0x1e8],%l4		! %l4 = 0000000000c10000 00000000000081c1
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x083,%g2
p1_b131:
!	Registers modified during the branch to p1_far_3
!	%l3  = 0000000021a809a4
!	%l6  = 0000000034dced49
	membar	#Sync			! Added by membar checker (291)
!	%l4 = 0000000000c10000, Mem[0000000031000014] = b9bf24d3
	stwa	%l4,[%o2+0x014]%asi	! Mem[0000000031000014] = 00c10000
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000032000050] = a93c5722, %l0 = 0000000073069afe
	ldub	[%o4+0x050],%g2		! Annulled
p1_b132:
	membar	#Sync			! Added by membar checker (292)
!	Mem[0000000014800028] = 0537e0b4, %l6 = 0000000034dced49
	swapa	[%i1+0x028]%asi,%l6	! %l6 = 000000000537e0b4

p1_label_113:
!	%l2 = 00000000216909a4, immed = fffffc1b, %l4 = 0000000000c10000
	addcc	%l2,-0x3e5,%l4		! %l4 = 00000000216905bf, %ccr = 11
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000014000068] = ddca7f7a, %l6 = 000000000537e0b4
	lduh	[%i0+0x068],%l6		! Annulled
p1_b133:
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 11
!	%l4 = 00000000216905bf, Mem[0000000014800000] = 730697be
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000014800000] = bf0697be
p1_b134:

p1_label_114:
	membar	#Sync			! Added by membar checker (293)
!	%l6 = 0537e0b4, %l7 = 00000000, Mem[0000000014000000] = 680cfcc5 e1e75c6c
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000014000000] = 0537e0b4 00000000
!	%f23 = 00000000, %f12 = 00000000
	fcmpes	%fcc0,%f23,%f12		! %fcc0 = 0
!	Mem[0000000015800008] = 0000ecf6, %l1 = 0000000000000000
	ldsha	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000008] = ff9c8df2, %l2 = 00000000216909a4
	ldsha	[%i2+%o6]0x80,%l2	! Annulled
p1_b135:

p1_label_115:
	membar	#Sync			! Added by membar checker (294)
	fbu,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000017000008] = 520090f6f607ff78, %l4 = 00000000216905bf
	ldxa	[%i6+%o6]0x80,%l4	! Annulled
p1_b136:
	membar	#Sync			! Added by membar checker (295)
!	%f26 = c119366c e0000000, %f0  = 4849b367
	fdtos	%f26,%f0 		! %f0  = c8c9b367
!	%l0 = 0000000073069afe, immed = 00000006, %l3 = 0000000021a809a4
	srl	%l0,0x006,%l3		! %l3 = 0000000001cc1a6b
!	Branch On Register, %l1 = 0000000000000000
	brgez,a,pn %l1,p1_b137		! Branch Taken

p1_label_116:
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 ffffffff
	prefetch [%o4+0x000],23
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x089,%g2
p1_b137:
	membar	#Sync			! Added by membar checker (296)
!	Mem[000000003100005c] = 2e62e26b, %l3 = 0000000001cc1a6b
	swap	[%o2+0x05c],%l3		! %l3 = 000000002e62e26b
!	%f0  = c8c9b367, %f17 = 00000000, %f15 = 80000000
	fadds	%f0 ,%f17,%f15		! %f15 = c8c9b367
	set	p1_b138,%o7
	fbne,a,pt %fcc1,p1_near_0_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000014000000] = 0537e0b4, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000005
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x08a,%g2
p1_b138:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffffffd19d1d94
!	%l3  = 0000000000000020
!	%l7  = 0000000000000800

p1_label_117:
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000000] = 0537e0b4, %l7 = 0000000000000800
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000005
p1_b139:
	membar	#Sync			! Added by membar checker (297)
!	%l6 = 000000000537e0b4, %l2 = 00000000216909a4, %y  = 34dcec12
	udivcc	%l6,%l2,%l5		! %l5 = 00000000ffffffff, %ccr = 0a
!	Mem[0000000031000010] = e6ff98ec00c10000, %l4 = 00000000216905bf
	ldxa	[%o2+0x010]%asi,%l4	! %l4 = e6ff98ec00c10000
!	%l1 = ffffffffd19d1d94, %l2 = 00000000216909a4, %y  = 34dcec12
	udivcc	%l1,%l2,%l5		! %l5 = 00000000ffffffff, %ccr = 0a

p1_label_118:
!	%l3 = 0000000000000020, immed = 000009b0, %y  = 34dcec12
	udivcc	%l3,0x9b0,%l5		! %l5 = 00000000ffffffff, %ccr = 0a
	fbu,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000032000068] = 65b76271 ccedc2c6, %l4 = 00c10000, %l5 = ffffffff
	ldd	[%o4+0x068],%g2		! %l4 = e6ff98ec00c10000 00000000ffffffff
p1_b140:
	membar	#Sync			! Added by membar checker (298)
!	Mem[0000000014000180] = a38d684f 6b85385a
	flush	%i0+0x180
	nop

p1_label_119:
!	%l2 = 00000000216909a4, immed = fffffac2, %y  = 34dcec12
	udivx	%l2,-0x53e,%l4		! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[000000003200004c] = 53902166
	stha	%l4,[%o4+0x04c]%asi	! Mem[000000003200004c] = 00002166
	set	p1_b141,%o7
	fbue	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	%l6 = 0537e0b4, %l7 = 00000005, Mem[0000000014000000] = 0537e0b4 00000000
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000014000000] = 0537e0b4 00000005
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x08d,%g2
p1_b141:
!	Registers modified during the branch to p1_far_3
!	%l3  = 00000000216909a4
!	%l6  = 0000000034dced49
	membar	#Sync			! Added by membar checker (299)
!	Mem[0000000015800000] = ffffffff, %l6 = 0000000034dced49
	ldsba	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffffff

p1_label_120:
	set	p1_b142,%o7
	fbge	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000014800000] = bf0697be cf7f7aee
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000014800000] = 00000000 ffffffff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x08e,%g2
p1_b142:
!	Registers modified during the branch to p1_far_1
!	%l2  = ffffffff80000000
!	%l6  = fffffffff78abbca
	membar	#Sync			! Added by membar checker (300)
!	Mem[00000000150000b0] = 0ae2e40b, %l4 = 0000000000000000
	lduha	[%i2+0x0b0]%asi,%l4	! %l4 = 0000000000000ae2
!	%f30 = 00000000 00000000, %f17 = 00000000
	fdtos	%f30,%f17		! %f17 = 00000000
!	%l4 = 0000000000000ae2, %l5 = 00000000ffffffff, %l4 = 0000000000000ae2
	orncc	%l4,%l5,%l4		! %l4 = ffffffff00000ae2, %ccr = 80

p1_label_121:
!	%l2 = 80000000, %l3 = 216909a4, Mem[0000000014800000] = 00000000 ffffffff
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000014800000] = 80000000 216909a4
!	Mem[00000000148001a0] = 1c6e060b ed779e87 22d8d07f 230b5922
	prefetcha [%i1+0x1a0]%asi,3
	set	p1_b143,%o7
	fba	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000018] = 00140854 ffffffff, %l0 = 73069afe, %l1 = d19d1d94
	ldd	[%o2+0x018],%l0		! %l0 = 0000000000140854 00000000ffffffff
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x08f,%g2
p1_b143:
!	Registers modified during the branch to p1_far_3
!	%l4  = ffffffff000008c2
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (301)
!	Mem[0000000015000180] = b583c178, %l0 = 0000000000140854
	ldsw	[%i2+0x180],%l0		! %l0 = ffffffffb583c178

p1_label_122:
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003000005c] = 000053a6, %l5 = 00000000ffffffff
	lduh	[%o0+0x05e],%l5		! %l5 = 00000000000053a6
p1_b144:
	membar	#Sync			! Added by membar checker (302)
	nop
!	Mem[0000000031800050] = 6c9da207 0000109f, %l6 = f78abbca, %l7 = 00000000
	ldd	[%o3+0x050],%l6		! %l6 = 000000006c9da207 000000000000109f
!	%l4 = ffffffff000008c2, immed = 000009af, %l1 = 00000000ffffffff
	andncc	%l4,0x9af,%l1		! %l1 = ffffffff00000040, %ccr = 80

p1_label_123:
!	%l1 = ffffffff00000040, Mem[0000000030800055] = 9bcd4b21
	stba	%l1,[%o1+0x055]%asi	! Mem[0000000030800054] = 9b404b21
!	%l7 = 000000000000109f, immed = 00000748, %l0 = ffffffffb583c178
	orncc	%l7,0x748,%l0		! %l0 = fffffffffffff8bf, %ccr = 88
!	%l1 = ffffffff00000040, Mem[00000000168000a7] = 5783b3e8
	stba	%l1,[%i5+0x0a7]%asi	! Mem[00000000168000a4] = 5783b340
	set	p1_b145,%o7
	fbge,pt	%fcc3,p1_near_0_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000032000070] = e436b8b0, %l2 = ffffffff80000000
	lduh	[%o4+0x072],%g2		! %g2 = 000000000000e436
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x091,%g2
p1_b145:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = ffffffff00000700
!	%l5  = 000000000000109f

p1_label_124:
	membar	#Sync			! Added by membar checker (303)
!	%f22 = b9800000 00000000, %f10 = ba5e2737 c0000000, %f16 = 00000000 00000000
	fmuld	%f22,%f10,%f16		! %f16 = 33ee2737 c0000000
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = 00000000216909a4, Mem[00000000158000d8] = 2bfdbd9f
	stw	%l3,[%i3+0x0d8]		! Annulled
p1_b146:
	membar	#Sync			! Added by membar checker (304)
!	Mem[000000004000001c] = cd1941fd, %l2 = ffffffff80000000
	lduwa	[%o5+0x01c]%asi,%l2	! %l2 = 00000000cd1941fd
!	%l4 = ffffffff00000700, immed = 0000001d, %l2 = 00000000cd1941fd
	srax	%l4,0x01d,%l2		! %l2 = fffffffffffffff8

p1_label_125:
!	%f11 = c0000000, %f2  = 12f139be, %f5  = e0000000
	fmuls	%f11,%f2 ,%f5 		! %f5  = 937139be
!	%l5 = 000000000000109f, Mem[0000000014800022] = 0cee9988
	stha	%l5,[%i1+0x022]%asi	! Mem[0000000014800020] = 0cee109f
	fbn,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000014800060] = c375a6b5 748d116a b8757c7c 645a4f78
	prefetch [%i1+0x060],4	! Annulled
p1_b147:
	set	p1_b148,%o7
	fba	p1_far_1_he	! Branch Taken, %fcc0 = 0

p1_label_126:
!	Mem[0000000015800000] = ffffffff, %l4 = ffffffff00000700
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x094,%g2
p1_b148:
!	Registers modified during the branch to p1_far_1
!	%l2  = 0000000021690180
!	%l3  = 000000002168fb56
	membar	#Sync			! Added by membar checker (305)
!	%f8  = 12f139be 80000000, %f4  = c119366c 937139be
	fcmped	%fcc1,%f8 ,%f4 		! %fcc1 = 2
!	%f17 = c0000000, %f5  = 937139be
	fabss	%f17,%f5 		! %f5  = 40000000
	fbne,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800120] = eee61d1f 8bb77e28 07dbc64b ac232261
	prefetch [%i3+0x120],23	! Annulled
p1_b149:

p1_label_127:
	bcc	p1_b150			! Branch Taken, %ccr = 00, CWP = 0
!	%l1 = 0000000014328fe0, Mem[0000000015000008] = ff9c8df2
	stwa	%l1,[%i2+%o6]0x80	! Mem[0000000015000008] = 14328fe0
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x096,%g2
p1_b150:
!	Jump to jmpl_3, CWP = 0
	set	p1_jmpl_3_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000015800008] = 0000ecf6, %l6 = 000000006c9da207
	lduwa	[%i3+%o6]0x80,%l6	! %l6 = 000000000000ecf6
	membar	#Sync			! Added by membar checker (306)
!	%l2 = 0000000021690180, %l0 = 0000000063b20536, %l0 = 0000000063b20536
	addc	%l2,%l0,%l0		! %l0 = 00000000851b06b6

p1_label_128:
!	%l3 = 000000002168fb56, Mem[0000000014800008] = ffffeeef
	stwa	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = 2168fb56
!	%l2 = 21690180, %l3 = 2168fb56, Mem[0000000016000000] = 4c9254d4 76e5d930
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000016000000] = 21690180 2168fb56
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000015800080] = 5e0c336d 4d03e30e abe13425 3bbf8c30
	prefetch [%i3+0x080],20
!	Registers modified during the branch to p1_jmpl_0
!	%l1  = 0000000000000000
!	%l2  = 0197f077845c0400
!	%l3  = 0197f07809770ab6
!	Mem[0000000015800008] = 0000ecf6, %l4 = 00000000ffffffff
	lduha	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000

p1_label_129:
!	%f8  = 12f139be 80000000, %f24 = 92f139be 814d7ace
	fmovd	%f8 ,%f24		! %f24 = 12f139be 80000000
!	%l5 = 000000000000109f, %l4 = 0000000000000000, %y  = 0197f077
	umul	%l5,%l4,%l4		! %l4 = 0000000000000000
!	%l6 = 000000000000ecf6, %l4 = 0000000000000000, %l2 = 0197f077845c0400
	sllx	%l6,%l4,%l2		! %l2 = 000000000000ecf6
!	%l4 = 0000000000000000, %l5 = 000000000000109f, %y  = 00000000
	umul	%l4,%l5,%l7		! %l7 = 0000000000000000
!	%f30 = 00000000, %f5  = 40000000
	fmovs	%f30,%f5 		! %f5  = 00000000

p1_label_130:
!	%f26 = c119366c, %f20 = 4119366c
	fmovs	%f26,%f20		! %f20 = c119366c
!	%l3 = 0197f07809770ab6, immed = 000009c8, %l5 = 000000000000109f
	tsubcc	%l3,0x9c8,%l5		! %l5 = 0197f078097700ee, %ccr = 02
!	Mem[0000000032000058] = 28a6997e, %l7 = 0000000000000000
	ldsw	[%o4+0x058],%g2		! %g2 = 0000000000000000
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000150001a8] = 3fd5a117 f647e958, %l2 = 0000ecf6, %l3 = 09770ab6
	ldd	[%i2+0x1a8],%l2		! %l2 = 000000003fd5a117 00000000f647e958
p1_b151:

p1_label_131:
	membar	#Sync			! Added by membar checker (307)
!	%l4 = 0000000000000000, %l1 = 0000000000000000, %l6 = 000000000000ecf6
	orcc	%l4,%l1,%l6		! %l6 = 0000000000000000, %ccr = 44
!	%f18 = 92f139be fffffffe, %f26 = c119366c e0000000
	fmovd	%f18,%f26		! %f26 = 92f139be fffffffe
!	Mem[0000000016800008] = b45c5717, %l7 = 0000000000000000
	lduha	[%i5+%o6]0x80,%l7	! %l7 = 000000000000b45c
!	Mem[0000000030800050] = c5a60003 9b404b21, %l4 = 00000000, %l5 = 097700ee
	ldd	[%o1+0x050],%l4		! %l4 = 00000000c5a60003 000000009b404b21
!	%l4 = 00000000c5a60003, Mem[0000000014000070] = 6dc8338223d0ea5d
	stxa	%l4,[%i0+0x070]%asi	! Mem[0000000014000070] = 00000000c5a60003

p1_label_132:
!	%l3 = 00000000f647e958, Mem[0000000014000014] = ffffffff
	stwa	%l3,[%i0+0x014]%asi	! Mem[0000000014000014] = f647e958
!	%l0 = 00000000851b06b6, Mem[0000000015800008] = 0000ecf6
	stwa	%l0,[%i3+%o6]0x80	! Mem[0000000015800008] = 851b06b6
!	%l7 = 000000000000b45c, Mem[0000000014800008] = 2168fb562ffec3a8
	stxa	%l7,[%i1+%o6]0x80	! Mem[0000000014800008] = 000000000000b45c
!	%l7 = 000000000000b45c, %l7 = 000000000000b45c, %y  = 00000000
	udivx	%l7,%l7,%l0		! %l0 = 0000000000000001
	set	p1_b152,%o7
	fbuge,pn %fcc1,p1_near_1_le	! Branch Taken, %fcc1 = 2

p1_label_133:
!	Mem[0000000015000008] = 14328fe0, %l2 = 000000003fd5a117
	lduha	[%i2+%o6]0x80,%l2	! %l2 = 0000000000001432
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x098,%g2
p1_b152:
!	Registers modified during the branch to p1_near_1
!	%l4  = 0000000000000000
!	%l7  = 00000000000000ff
	membar	#Sync			! Added by membar checker (308)
!	%l7 = 00000000000000ff, immed = 000008c2, %l4 = 0000000000000000
	xor	%l7,0x8c2,%l4		! %l4 = 000000000000083d
	set	p1_b153,%o7
	fbne,a,pt %fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 2
!	Mem[0000000015800100] = 15d44ab7 fbade95c ca01e4b0 f2581233
	prefetch [%i3+0x100],1
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x099,%g2
p1_b153:
!	Registers modified during the branch to p1_near_2
!	%l0  = 0000000000000344
!	%l5  = 125cb97a9abe53a6
	membar	#Sync			! Added by membar checker (309)
!	Mem[0000000015800000] = ffffffff ff02c55d 851b06b6 352fc000
	prefetch [%i3+0x000],0

p1_label_134:
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000148001a8] = 22d8d07f, %l7 = 00000000000000ff
	lduh	[%i1+0x1aa],%l7		! %l7 = 000000000000d07f
p1_b154:
	membar	#Sync			! Added by membar checker (310)
!	Mem[0000000015800008] = 851b06b6, %l0 = 0000000000000344
	lduba	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000085
!	%l5 = 125cb97a9abe53a6, %l0 = 0000000000000085, %l3 = 00000000f647e958
	sllx	%l5,%l0,%l3		! %l3 = 4b972f5357ca74c0
!	%f4  = c119366c, %f5  = 00000000
	fcmps	%fcc2,%f4 ,%f5 		! %fcc2 = 1

p1_label_135:
	nop				! Delay added due to fcmp
	set	p1_b155,%o7
	fbo,a,pn %fcc3,p1_near_3_le	! Branch Taken, %fcc3 = 2
!	%l1 = 0000000000000000, Mem[0000000015800008] = 851b06b6
	stwa	%l1,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000000
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x09b,%g2
p1_b155:
!	Registers modified during the branch to p1_near_3
!	%l0  = 0000000000000a5f
!	%l3  = 000000000000d8bd
!	%l5  = 000000000000109f
	membar	#Sync			! Added by membar checker (311)
!	%l1 = 0000000000000000, Mem[0000000014000000] = 0537e0b4
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000014000000] = 00000000
!	Mem[00000000140000e0] = 3086eccbeddfc120, %l3 = 000000000000d8bd
	ldxa	[%i0+0x0e0]%asi,%l3	! %l3 = 3086eccbeddfc120
!	%f27 = fffffffe, %f27 = fffffffe, %f2  = 12f139be
	fdivs	%f27,%f27,%f2 		! %f2  = fffffffe

p1_label_136:
!	Branch On Register, %l6 = 0000000000000000
	brz,pn	%l6,p1_b156		! Branch Taken
!	Mem[0000000015000000] = 000000f3, %l7 = 000000000000d07f
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x09c,%g2
p1_b156:
	membar	#Sync			! Added by membar checker (312)
!	Mem[000000003080001c] = 2ffec3a8, %l2 = 00001432, %l4 = 0000083d
	add	%o1,0x1c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 000000002ffec3a8
!	%l6 = 0000000000000000, %l1 = 0000000000000000, %l6 = 0000000000000000
	add	%l6,%l1,%l6		! %l6 = 0000000000000000
!	%l2 = 0000000000001432, Mem[00000000150001f8] = 48d225ec
	sth	%l2,[%i2+0x1f8]		! Mem[00000000150001f8] = 143225ec

p1_label_137:
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 13
!	%l6 = 0000000000000000, Mem[0000000030800016] = 00000000
	stb	%l6,[%o1+0x016]		! Annulled
p1_b157:
	membar	#Sync			! Added by membar checker (313)
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000014000008] = cd196892 cf7f7aee
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000014000008] = 00000000 00000000
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = 00000000, %l2 = 0000000000001432
	swapa	[%i1+%o6]0x80,%l2	! Annulled
p1_b158:

p1_label_138:
	membar	#Sync			! Added by membar checker (314)
!	%l6 = 0000000000000000, %l4 = 000000002ffec3a8, %y  = 00000000
	sdivcc	%l6,%l4,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l2 = 0000000000001432, %l4 = 000000002ffec3a8, %l4 = 000000002ffec3a8
	xnorcc	%l2,%l4,%l4		! %l4 = ffffffffd0012865, %ccr = 88
!	%l5 = 0000000000000000, Mem[0000000031800018] = 43a4137d93078c9a
	stxa	%l5,[%o3+0x018]%asi	! Mem[0000000031800018] = 0000000000000000
	set	p1_b159,%o7
	fble	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000060] = 00000000 000000ff 65b76271 ccedc2c6
	prefetch [%o4+0x060],4
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x09f,%g2
p1_b159:
!	Registers modified during the branch to p1_far_3
!	%l4  = ffffffffd0012845
!	%l7  = 0000000000000000

p1_label_139:
	membar	#Sync			! Added by membar checker (315)
!	%f25 = 80000000, %f28 = 00000000 3ff00000
	fitod	%f25,%f28		! %f28 = c1e00000 00000000
!	%l1 = 0000000000000000, immed = fffff1d6, %l3 = 3086eccbeddfc120
	subc	%l1,-0xe2a,%l3		! %l3 = 0000000000000e2a
!	%l2 = 0000000000001432
	setx	0x168bccd9168bccd9,%g7,%l2 ! %l2 = 168bccd9168bccd9
!	%f10 = ba5e2737 c0000000, %f6  = 80000000 00000000, %f28 = c1e00000 00000000
	faddd	%f10,%f6 ,%f28		! %f28 = ba5e2737 c0000000
!	%l0 = 0000000000000a5f, immed = fffff14b, %l0 = 0000000000000a5f
	orn	%l0,-0xeb5,%l0		! %l0 = 0000000000000eff

p1_label_140:
!	%l3 = 0000000000000e2a, immed = fffff4d0, %l1 = 0000000000000000
	xnor	%l3,-0xb30,%l1		! %l1 = 0000000000000505
	set	p1_b160,%o7
	fbule,a,pt %fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000015000008] = 14328fe0, %l3 = 0000000000000e2a
	ldsha	[%i2+%o6]0x80,%l3	! %l3 = 0000000000001432
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x0a0,%g2
p1_b160:
!	Registers modified during the branch to p1_near_2
!	%l0  = 0000000000000344
!	%l5  = 125cb97a9abe53a6
	membar	#Sync			! Added by membar checker (316)
!	Mem[0000000015800008] = 00000000, %l4 = ffffffffd0012845
	ldsha	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
!	%l2 = 168bccd9168bccd9, %l2 = 168bccd9168bccd9, %y  = 00000000
	umulcc	%l2,%l2,%l7		! %l7 = 01fc538d63908ff1, %ccr = 00

p1_label_141:
!	Mem[00000000140001b4] = 32659254, %l5 = 125cb97a9abe53a6
	lduh	[%i0+0x1b4],%l5		! %l5 = 0000000000003265
!	Mem[000000001480019c] = 2cbc86c3, %l4 = 0000000000000000
	ldsh	[%i1+0x19c],%l4		! %l4 = 0000000000002cbc
!	%l3 = 0000000000001432, %l5 = 0000000000003265, %l0 = 0000000000000344
	subc	%l3,%l5,%l0		! %l0 = ffffffffffffe1cd
!	%f9  = 80000000, %f28 = ba5e2737, %f18 = 92f139be
	fdivs	%f9 ,%f28,%f18		! %f18 = 00000000
!	Jump to jmpl_1, CWP = 0
	set	p1_jmpl_1_le,%g1
	jmpl	%g1,%g6

p1_label_142:
!	Mem[0000000015000008] = 14328fe0 348bcced, %l6 = 00000000, %l7 = 63908ff1
	ldd	[%i2+0x008],%l6		! %l6 = 0000000014328fe0 00000000348bcced
!	Registers modified during the branch to p1_jmpl_1
!	%l0  = 00000000000168bc
!	%l2  = 00000000ffffffff
!	%l3  = 0000000000000377
!	%l5  = 000000009e0d4bb4
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000000] = 00000000, %l3 = 0000000000000377
	lduwa	[%i0+%g0]0x80,%l3	! Annulled
p1_b161:
	membar	#Sync			! Added by membar checker (317)
!	Mem[00000000148001e0] = 317a524a 5f3409e8 713ac207 00059d44
	prefetcha [%i1+0x1e0]%asi,0
!	%l6 = 14328fe0, %l7 = 348bcced, Mem[0000000015000000] = 000000f3 000081c1
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000015000000] = 14328fe0 348bcced

p1_label_143:
!	%f12 = 00000000 2543cb73, %f10 = ba5e2737 c0000000
	fabsd	%f12,%f10		! %f10 = 00000000 2543cb73
!	Mem[0000000016000194] = 8b8f9a22, %l3 = 0000000000000377
	lduw	[%i4+0x194],%l3		! %l3 = 000000008b8f9a22
!	%f8  = 12f139be 80000000, %f30 = 00000000 00000000, %f4  = c119366c 00000000
	fsubd	%f8 ,%f30,%f4 		! %f4  = 12f139be 80000000
!	Mem[00000000148000cb] = 487eb118, %l1 = 0000000000000505
	ldstuba	[%i1+0x0cb]%asi,%l1	! %l1 = 0000000000000018
	set	p1_b162,%o7
	fbne,pt	%fcc2,p1_near_0_he	! Branch Taken, %fcc2 = 1

p1_label_144:
!	Mem[0000000014000008] = 00000000, %l6 = 0000000014328fe0
	ldswa	[%i0+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0a2,%g2
p1_b162:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = fffffffffffe975b
!	%l5  = 0000000000000006
	fbug,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 0000000063b20536, Mem[0000000014000008] = 0000000000000000
	stxa	%l0,[%i0+%o6]0x80	! Annulled
p1_b163:
	set	p1_b164,%o7
	fbuge,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	%l6 = 00000000, %l7 = 348bcced, Mem[0000000032000000] = 33b3aecd 3445cb05
	std	%l6,[%o4+0x000]	! Mem[0000000032000000] = 00000000 348bcced
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0a4,%g2
p1_b164:
!	Registers modified during the branch to p1_far_0
!	%l2  = ffffffffffffffff
!	%l3  = fffffffffffffeaf
!	%l4  = 0000000163b20535
!	%l7  = 00000000ffffffff

p1_label_145:
	membar	#Sync			! Added by membar checker (318)
!	Mem[00000000150000e0] = c0da132c 899b991d 1b389e36 e64cc135
	prefetch [%i2+0x0e0],23
!	Mem[000000003180001f] = 00000000, %l4 = 0000000163b20535
	ldstuba	[%o3+0x01f]%asi,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000040000018] = fcc57c79 cd1941fd
	stda	%l6,[%o5+0x018]%asi	! Mem[0000000040000018] = 00000000 ffffffff
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[0000000015800190] = 12f62cd0fa7bb3b7, %l5 = 0000000000000006
	ldx	[%i3+0x190],%l5		! Annulled
p1_b165:

p1_label_146:
	membar	#Sync			! Added by membar checker (319)
!	Mem[0000000015000090] = 872dfd6b, %l2 = ffffffffffffffff
	ldstub	[%i2+0x090],%l2		! %l2 = 0000000000000087
	set	p1_b166,%o7
	fbuge,pt %fcc0,p1_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000000] = 14328fe0 348bcced, %l4 = 00000000, %l5 = 00000006
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000014328fe0 00000000348bcced
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0a6,%g2
p1_b166:
!	Registers modified during the branch to p1_near_3
!	%l2  = ffffffff9c4df979
!	%l5  = fffffffffffffd2e
	bg	p1_b167			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000014000026] = 6f7aae93, %l6 = 0000000000000000
	ldstub	[%i0+0x026],%l6		! %l6 = 00000000000000ae
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0a7,%g2
p1_b167:

p1_label_147:
	membar	#Sync			! Added by membar checker (320)
!	%l7 = 00000000ffffffff, Mem[000000001680003e] = 3a2320ee
	stha	%l7,[%i5+0x03e]%asi	! Mem[000000001680003c] = 3a23ffff
!	Mem[0000000014800008] = 00000000, %l6 = 00000000000000ae
	ldstuba	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000000
!	%l2 = ffffffff9c4df979, %l6 = 0000000000000000, %l6 = 0000000000000000
	addc	%l2,%l6,%l6		! %l6 = ffffffff9c4df979
!	Mem[000000003100005e] = 01cc1a6b, %l1 = 0000000014328fe0
	ldstuba	[%o2+0x05e]%asi,%l1	! %l1 = 000000000000001a
	fbu,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2

p1_label_148:
!	Mem[0000000014000000] = 00000000, %l1 = 000000000000001a
	ldstuba	[%i0+%g0]0x80,%l1	! Annulled
p1_b168:
	membar	#Sync			! Added by membar checker (321)
!	%l2 = ffffffff9c4df979, %l2 = ffffffff9c4df979, %l2 = ffffffff9c4df979
	sll	%l2,%l2,%l2		! %l2 = ff389bf2f2000000
!	Mem[0000000031800058] = 77f3dbeb, %l6 = ffffffff9c4df979
	ldsha	[%o3+0x058]%asi,%l6	! %l6 = 00000000000077f3
!	%l2 = ff389bf2f2000000, Mem[0000000016000008] = f3e1b30a
	stha	%l2,[%i4+%o6]0x80	! Mem[0000000016000008] = 0000b30a
!	Branch On Register, %l6 = 00000000000077f3
	brgez,pn %l6,p1_b169		! Branch Taken

p1_label_149:
!	%l5 = fffffffffffffd2e, Mem[0000000015000008] = 14328fe0
	stwa	%l5,[%i2+%o6]0x80	! Mem[0000000015000008] = fffffd2e
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0a9,%g2
p1_b169:
	membar	#Sync			! Added by membar checker (322)
!	%f10 = 00000000, %f15 = c8c9b367
	fnegs	%f10,%f15		! %f15 = 80000000
!	%l6 = 00000000000077f3, immed = 00000a8b, %y  = 01fc538d
	umulcc	%l6,0xa8b,%l4		! %l4 = 0000000004f09ef1, %ccr = 00
	set	p1_b170,%o7
	fbge,a,pn %fcc1,p1_near_0_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000014800120] = 9cf726c4 00cbea2c 9552f6d7 ee07d2b6
	prefetch [%i1+0x120],1
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0aa,%g2
p1_b170:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = ffffffff9c4dfad3
!	%l5  = 0000000000001fff

p1_label_150:
	membar	#Sync			! Added by membar checker (323)
!	%f22 = b9800000, %f19 = fffffffe
	fabss	%f22,%f19		! %f19 = 39800000
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800008] = 00000000, %l4 = ffffffff9c4dfad3
	ldsha	[%i3+%o6]0x80,%l4	! Annulled
p1_b171:
	membar	#Sync			! Added by membar checker (324)
!	Mem[0000000030800018] = ff7deee32ffec3a8, %l3 = fffffffffffffeaf
	ldxa	[%o1+0x018]%asi,%l3	! %l3 = ff7deee32ffec3a8
	fbu,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2

p1_label_151:
!	%l1 = 0000000014328fe0, Mem[0000000015800000] = ffffffff
	stha	%l1,[%i3+%g0]0x80	! Mem[0000000015800000] = 8fe0ffff
p1_b172:
	membar	#Sync			! Added by membar checker (325)
!	%f0  = c8c9b367 7dd60200, %f0  = c8c9b367 7dd60200
	fcmped	%fcc0,%f0 ,%f0 		! %fcc0 = 0
!	Mem[0000000015800000] = 8fe0ffff ff02c55d 00000000 352fc000
	prefetcha [%i3+0x000]%asi,4
!	Mem[0000000015800000] = 8fe0ffff ff02c55d 00000000 352fc000
	prefetch [%i3+0x000],20
	bvs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88

p1_label_152:
!	 Annulled
	ldda	[%i3+%o6]0x80,%l0
p1_b173:
	membar	#Sync			! Added by membar checker (326)
!	%l7 = 00000000ffffffff, Mem[0000000014000008] = 0000000000000000
	stxa	%l7,[%i0+%o6]0x80	! Mem[0000000014000008] = 00000000ffffffff
	fbl,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l5 = 0000000000001fff, Mem[0000000015000008] = fffffd2e
	stwa	%l5,[%i2+%o6]0x80	! Mem[0000000015000008] = 00001fff
p1_b174:
	bcc,a	p1_b175			! Branch Taken, %ccr = 88, CWP = 0

p1_label_153:
!	Mem[0000000032000004] = cced6b78, %l3 = ff7deee32ffec3a8
	ldsh	[%o4+0x006],%g2		! %g2 = ffffffffffffcced
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x0af,%g2
p1_b175:
	membar	#Sync			! Added by membar checker (327)
	set	p1_b176,%o7
	fbuge,a,pt %fcc0,p1_near_2_le	! Branch Taken, %fcc0 = 0
!	%l0 = 0000000063b20536, Mem[000000003000005d] = 000053a6
	stb	%l0,[%o0+0x05d]		! Mem[000000003000005c] = 003653a6
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0b0,%g2
p1_b176:
!	Registers modified during the branch to p1_near_2
!	%l2  = 0082111d33b3418e
!	%l5  = fbddc65ffd875000
!	%l6  = 000000000000001a
	membar	#Sync			! Added by membar checker (328)
!	%l5 = fbddc65ffd875000, %l0 = 0000000063b20536, %y  = 00000000
	udivcc	%l5,%l0,%l3		! %l3 = 0000000000000002, %ccr = 00
!	Mem[00000000140001dc] = b4563149, %l2 = 0082111d33b3418e
	ldstub	[%i0+0x1dc],%l2		! %l2 = 00000000000000b4

p1_label_154:
!	%l7 = 00000000ffffffff, Mem[00000000148000c6] = 7f6dcbb2
	stb	%l7,[%i1+0x0c6]		! Mem[00000000148000c4] = 7f6dffb2
!	Mem[0000000031000010] = e6ff98ec, %l0 = 0000000063b20536
	ldsw	[%o2+0x010],%l0		! %l0 = ffffffffe6ff98ec
!	Mem[00000000158001d8] = 612dc203, %l3 = 0000000000000002
	ldsw	[%i3+0x1d8],%l3		! %l3 = 00000000612dc203
	set	p1_b177,%o7
	fble,a,pt %fcc0,p1_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003100005c] = 01ccff6b, %l1 = 0000000014328fe0
	lduh	[%o2+0x05c],%l1		! %l1 = 00000000000001cc
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0b1,%g2
p1_b177:
!	Registers modified during the branch to p1_near_3
!	%l0  = 0000000000000a5f
!	%l3  = 000000009c4dfad3
!	%l5  = 000000009abe53a6

p1_label_155:
	membar	#Sync			! Added by membar checker (329)
!	%l6 = 000000000000001a, immed = fffff1a0, %l0 = 0000000000000a5f
	subccc	%l6,-0xe60,%l0		! %l0 = 0000000000000e79, %ccr = 11
!	Mem[0000000014000008] = 00000000, %l2 = 00000000000000b4
	swapa	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000
	set	p1_b178,%o7
	fbo,a	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001480018c] = c91ba54b, %l6 = 000000000000001a
	ldsb	[%i1+0x18d],%l6		! %l6 = 000000000000001b
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p1_branch_failed
	mov	0x0b2,%g2
p1_b178:
!	Registers modified during the branch to p1_far_1
!	%l2  = 000000009c4df080
!	%l3  = 000000009c4dea56
	membar	#Sync			! Added by membar checker (330)
!	%f1  = 7dd60200, %f18 = 00000000, %f22 = b9800000
	fsubs	%f1 ,%f18,%f22		! %f22 = 7dd60200

p1_label_156:
!	%f25 = 80000000, %f16 = 33ee2737
	fabss	%f25,%f16		! %f16 = 00000000
!	Mem[000000001480000c] = 0000b45c, %l7 = 00000000ffffffff
	ldub	[%i1+0x00f],%l7		! %l7 = 000000000000005c
!	%l3 = 000000009c4dea56, immed = fffff44d, %l3 = 000000009c4dea56
	xnorcc	%l3,-0xbb3,%l3		! %l3 = 000000009c4de1e4, %ccr = 08
!	%l0 = 0000000000000e79, immed = 00000ccc, %y  = 00000000
	sdivcc	%l0,0xccc,%l1		! %l1 = 0000000000000001, %ccr = 00
	fbuge,pt %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 1

p1_label_157:
!	Mem[0000000014800120] = 9cf726c4 00cbea2c 9552f6d7 ee07d2b6
	prefetch [%i1+0x120],23
p1_b179:
	bge	p1_b180			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000140001f0] = a7276759 2c2e64df, %l0 = 00000e79, %l1 = 00000001
	ldd	[%i0+0x1f0],%l0		! %l0 = 00000000a7276759 000000002c2e64df
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0b4,%g2
p1_b180:
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l5 = 000000009abe53a6, Mem[000000001500001d] = 47a1c5b7
	stb	%l5,[%i2+0x01d]		! Mem[000000001500001c] = 47a6c5b7
p1_b181:

p1_label_158:
	membar	#Sync			! Added by membar checker (331)
	set	p1_b182,%o7
	fba,a,pn %fcc2,p1_near_1_le	! Branch Taken, %fcc2 = 1
!	Mem[00000000150000c8] = fa4392bb, %l6 = 000000000000001b
	swap	[%i2+0x0c8],%l6		! Annulled
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x0b6,%g2
p1_b182:
!	Registers modified during the branch to p1_near_1
!	%l4  = 000000002c2e64fa
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (332)
!	%l5 = 000000009abe53a6, %l1 = 000000002c2e64df, %l2 = 000000009c4df080
	taddcc	%l5,%l1,%l2		! %l2 = 00000000c6ecb885, %ccr = 0a
!	%f2  = fffffffe, %f7  = 00000000
	fcmps	%fcc3,%f2 ,%f7 		! %fcc3 = 3
!	%l4 = 000000002c2e64fa, immed = fffff1c7, %y  = 00000000
	mulx	%l4,-0xe39,%l6		! %l6 = fffffd8ba025d856

p1_label_159:
!	%l5 = 000000009abe53a6, immed = 00000014, %l4 = 000000002c2e64fa
	srl	%l5,0x014,%l4		! %l4 = 00000000000009ab
	fbul,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000008] = 000000b4, %l5 = 000000009abe53a6
	ldsha	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000
p1_b183:
	membar	#Sync			! Added by membar checker (333)
	set	p1_b184,%o7
	fbne,a,pt %fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 1
!	%l6 = fffffd8ba025d856, Mem[0000000031800016] = b9a1a310
	stb	%l6,[%o3+0x016]		! Mem[0000000031800014] = b9a15610
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0b8,%g2
p1_b184:
!	Registers modified during the branch to p1_near_2
!	%l0  = fffffd8ba025db9a
!	%l5  = 125cb97a9abe53a6

p1_label_160:
	membar	#Sync			! Added by membar checker (334)
!	%l2 = 00000000c6ecb885, %l0 = fffffd8ba025db9a, %y  = 00000000
	udivcc	%l2,%l0,%l4		! %l4 = 0000000000000001, %ccr = 00
!	Mem[0000000014000000] = 00000000, %l0 = fffffd8ba025db9a
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f30 = 00000000 00000000, %f2  = fffffffe 814d7ace
	fdtox	%f30,%f2 		! %f2  = 00000000 00000000
!	Mem[0000000030800018] = ff7deee32ffec3a8, %l3 = 000000009c4de1e4
	ldxa	[%o1+0x018]%asi,%l3	! %l3 = ff7deee32ffec3a8
!	Mem[0000000014000008] = 000000b4, %l3 = ff7deee32ffec3a8
	ldstuba	[%i0+%o6]0x80,%l3	! %l3 = 0000000000000000

p1_label_161:
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031000014] = 00c10000, %l6 = fffffd8ba025d856
	lduw	[%o2+0x014],%l6		! Annulled
p1_b185:
	membar	#Sync			! Added by membar checker (335)
!	%l5 = 125cb97a9abe53a6, immed = fffffd54, %l4 = 0000000000000001
	and	%l5,-0x2ac,%l4		! %l4 = 125cb97a9abe5104
!	%l0 = 0000000000000000, %l3 = 0000000000000000, %l1 = 000000002c2e64df
	add	%l0,%l3,%l1		! %l1 = 0000000000000000
	bvc	p1_b186			! Branch Taken, %ccr = 00, CWP = 0

p1_label_162:
!	Mem[0000000014000008] = ff0000b4, %l3 = 0000000000000000
	ldsha	[%i0+%o6]0x80,%l3	! %l3 = ffffffffffffff00
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0ba,%g2
p1_b186:
	membar	#Sync			! Added by membar checker (336)
!	Mem[0000000032000020] = 881b2ad7 861878d1 a4176408 4b729f64
	prefetch [%o4+0x020],16
!	%f30 = 00000000 00000000, %f11 = 2543cb73
	fdtoi	%f30,%f11		! %f11 = 00000000
!	Mem[0000000031000058] = ab786e72, %l3 = ffffffffffffff00
	ldsha	[%o2+0x058]%asi,%l3	! %l3 = ffffffffffffab78
	fbne	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_163:
!	Mem[0000000014000008] = ff0000b4, %l1 = 0000000000000000
	ldstuba	[%i0+%o6]0x80,%l1	! %l1 = 00000000000000ff
p1_b187:
	membar	#Sync			! Added by membar checker (337)
!	%f28 = ba5e2737 c0000000, %f20 = c119366c e0000000, %f14 = 60000000 80000000
	fmuld	%f28,%f20,%f14		! %f14 = 3b87c1ec 5382ae40
!	%f2  = 00000000 00000000, %f10 = 00000000 00000000
	fdtox	%f2 ,%f10		! %f10 = 00000000 00000000
!	%l2 = 00000000c6ecb885, %l4 = 125cb97a9abe5104, %y  = 00000000
	udiv	%l2,%l4,%l6		! %l6 = 0000000000000001
	fbge,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 1

p1_label_164:
!	Mem[000000001580009f] = 0f94e9cb, %l3 = ffffffffffffab78
	ldstub	[%i3+0x09f],%l3		! %l3 = 00000000000000cb
p1_b188:
	membar	#Sync			! Added by membar checker (338)
!	%l2 = c6ecb885, %l3 = 000000cb, Mem[0000000030800058] = 97e0f2a6 025b41fd
	stda	%l2,[%o1+0x058]%asi	! Mem[0000000030800058] = c6ecb885 000000cb
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000015800000] = 8fe0ffff, %l4 = 125cb97a9abe5104
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000008fe0
p1_b189:
	membar	#Sync			! Added by membar checker (339)
	set	p1_b190,%o7
	fblg,pn	%fcc1,p1_near_0_le	! Branch Taken, %fcc1 = 2

p1_label_165:
!	Mem[00000000158000a4] = b23606f0, %l4 = 0000000000008fe0
	ldsw	[%i3+0x0a4],%l4		! %l4 = ffffffffb23606f0
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0be,%g2
p1_b190:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffffffffffff34
!	%l3  = 0000000000000000
!	%l7  = 0000000044c8b805
	membar	#Sync			! Added by membar checker (340)
!	Mem[0000000015000180] = b583c178 d6524aa1 bcd489ed 08b4f857
	prefetcha [%i2+0x180]%asi,23
!	%l3 = 0000000000000000, immed = fffff64e, %y  = 00000000
	smulcc	%l3,-0x9b2,%l7		! %l7 = 0000000000000000, %ccr = 44
!	Mem[0000000030000010] = 00000000, %l6 = 0000000000000001
	ldsw	[%o0+0x010],%l6		! %l6 = 0000000000000000
!	Mem[0000000015000000] = 14328fe0, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000014

p1_label_166:
!	Mem[0000000015000079] = 682761ee, %l4 = ffffffffb23606f0
	ldstuba	[%i2+0x079]%asi,%l4	! %l4 = 0000000000000027
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000140001a4] = 717a6209, %l6 = 0000000000000014
	ldsw	[%i0+0x1a4],%l6		! Annulled
p1_b191:
	membar	#Sync			! Added by membar checker (341)
!	Mem[0000000016000008] = 0000b30a, %l3 = 0000000000000000
	ldsha	[%i4+%o6]0x80,%l3	! %l3 = 0000000000000000
!	%f20 = c119366c e0000000, %f8  = 12f139be 80000000
	fcmpd	%fcc0,%f20,%f8 		! %fcc0 = 1

p1_label_167:
	nop				! Delay added due to fcmp
	set	p1_b192,%o7
	fbul,pt	%fcc3,p1_near_0_he	! Branch Taken, %fcc3 = 3
!	Mem[0000000014800000] = 80000000, %l1 = ffffffffffffff34
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffff8000
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x0c0,%g2
p1_b192:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000063b20536
!	%l1  = 0000000014328fe0
!	%l4  = 0000000000007fff
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (342)
!	Mem[0000000014800014] = f538790c, %l5 = 0000000000000000
	ldswa	[%i1+0x014]%asi,%l5	! %l5 = fffffffff538790c
!	Mem[0000000030800050] = 00000001 00000001, %l7 = 0000000000000000, %l1 = 0000000014328fe0
	add	%o1,0x50,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = c5a600039b404b21
	fbn,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2

p1_label_168:
!	Mem[0000000014800100] = 5c50bfd8 6c57dc3f 6833fa8d d2d8856f
	prefetch [%i1+0x100],20	! Annulled
p1_b193:
	membar	#Sync			! Added by membar checker (343)
!	%f22 = 7dd60200 00000000, %f8  = 12f139be 80000000
	fabsd	%f22,%f8 		! %f8  = 7dd60200 00000000
	fbn,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 3
!	%l7 = 0000000000000000, Mem[00000000148001d0] = 1c32a2d5
	sth	%l7,[%i1+0x1d0]		! Mem[00000000148001d0] = 0000a2d5
p1_b194:
	bpos	p1_b195			! Branch Taken, %ccr = 00, CWP = 0

p1_label_169:
!	Mem[0000000014800000] = 80000000, %l4 = 0000000000007fff
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000008000
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p1_branch_failed
	mov	0x0c3,%g2
p1_b195:
	membar	#Sync			! Added by membar checker (344)
!	%f8  = 7dd60200, %f1  = 7dd60200, %f30 = 00000000
	fadds	%f8 ,%f1 ,%f30		! %f30 = 7e560200
	bgu	p1_b196			! Branch Taken, %ccr = 00, CWP = 0
!	%l3 = 0000000000000000, Mem[0000000015000008] = 00001fff
	stwa	%l3,[%i2+%o6]0x80	! Mem[0000000015000008] = 00000000
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x0c4,%g2
p1_b196:
	membar	#Sync			! Added by membar checker (345)
	fbu,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1

p1_label_170:
!	Mem[0000000014000008] = ff0000b4, %l1 = c5a600039b404b21
	lduwa	[%i0+%o6]0x80,%l1	! Annulled
p1_b197:
	membar	#Sync			! Added by membar checker (346)
!	%f2  = 00000000, %f26 = 92f139be
	fnegs	%f2 ,%f26		! %f26 = 80000000
!	Branch On Register, %l1 = c5a600039b404b21
	brlz,a,pt %l1,p1_b198		! Branch Taken
!	Mem[0000000014000128] = a14ee180, %l7 = 0000000000000000
	ldsb	[%i0+0x12b],%l7		! %l7 = ffffffffffffff80
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0c6,%g2
p1_b198:
	membar	#Sync			! Added by membar checker (347)
!	Mem[0000000032000048] = b4eadc8a 00002166, %l0 = 63b20536, %l1 = 9b404b21
	ldd	[%o4+0x048],%g2		! %l0 = 0000000063b20536 c5a600039b404b21

p1_label_171:
!	Mem[0000000031000054] = 0000007c, %l4 = 0000000000008000
	ldstub	[%o2+0x054],%l4		! %l4 = 0000000000000000
!	%l7 = ffffffffffffff80, Mem[000000003200005e] = 12280000
	stha	%l7,[%o4+0x05e]%asi	! Mem[000000003200005c] = ff800000
!	Mem[0000000015000008] = 00000000, %l5 = fffffffff538790c
	ldsba	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, %l0 = 0000000063b20536, %l1 = c5a600039b404b21
	srax	%l4,%l0,%l1		! %l1 = 0000000000000000
!	%l6 = 0000000000000014, Mem[000000003180001c] = 000000ff
	stw	%l6,[%o3+0x01c]		! Mem[000000003180001c] = 00000014

p1_label_172:
!	%f4  = 12f139be, %f18 = 00000000, %f4  = 12f139be 80000000
	fsmuld	%f4 ,%f18,%f4 		! %f4  = 00000000 00000000
!	%f2  = 00000000 00000000, %f20 = c119366c e0000000
	fxtod	%f2 ,%f20		! %f20 = 00000000 00000000
!	%f2  = 00000000 00000000, %f26 = 80000000 fffffffe
	fdtox	%f2 ,%f26		! %f26 = 00000000 00000000
!	%l6 = 0000000000000014, immed = 000005ad, %y  = 00000000
	smulcc	%l6,0x5ad,%l2		! %l2 = 0000000000007184, %ccr = 00
	bcc	p1_b199			! Branch Taken, %ccr = 00, CWP = 0

p1_label_173:
!	Mem[0000000030000052] = 00000000, %l7 = ffffffffffffff80
	ldstub	[%o0+0x052],%l7		! %l7 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0c7,%g2
p1_b199:
	membar	#Sync			! Added by membar checker (348)
!	%l2 = 0000000000007184, %l0 = 0000000063b20536, %l6 = 0000000000000014
	addcc	%l2,%l0,%l6		! %l6 = 0000000063b276ba, %ccr = 00
!	Mem[0000000032000020] = 881b2ad7 861878d1 a4176408 4b729f64
	prefetcha [%o4+0x020]%asi,22
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000015800008] = 00000000, %l6 = 0000000063b276ba
	ldstuba	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000
p1_b200:

p1_label_174:
	membar	#Sync			! Added by membar checker (349)
!	%l3 = 0000000000000000, immed = 00000c24, %l7 = 0000000000000000
	xnor	%l3,0xc24,%l7		! %l7 = fffffffffffff3db
!	%f25 = 80000000, %f5  = 00000000
	fmovs	%f25,%f5 		! %f5  = 80000000
	fbo,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 3
!	%l0 = 0000000063b20536, Mem[0000000015800000] = 8fe0ffff
	stha	%l0,[%i3+%g0]0x80	! Mem[0000000015800000] = 0536ffff
p1_b201:
	set	p1_b202,%o7
	fblg	p1_far_0_le	! Branch Taken, %fcc0 = 1

p1_label_175:
!	Mem[0000000030000018] = 1f6ed9a9 0000109f, %l4 = 00000000, %l5 = 00000000
	ldd	[%o0+0x018],%l4		! %l4 = 000000001f6ed9a9 000000000000109f
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0ca,%g2
p1_b202:
	membar	#Sync			! Added by membar checker (350)
!	Mem[000000001480009d] = 9f285ae8, %l5 = 000000000000109f
	ldstuba	[%i1+0x09d]%asi,%l5	! %l5 = 0000000000000028
	fbe,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = 000000001f6ed9a9, Mem[0000000040000018] = 00000000ffffffff
	stx	%l4,[%o5+0x018]		! Mem[0000000040000018] = 000000001f6ed9a9
p1_b203:
	membar	#Sync			! Added by membar checker (351)
!	%f18 = 00000000 39800000, %f4  = 00000000 80000000
	fnegd	%f18,%f4 		! %f4  = 80000000 39800000

p1_label_176:
	set	p1_b204,%o7
	fbl,a	p1_far_3_le	! Branch Taken, %fcc0 = 1
!	%l1 = 0000000000000000, Mem[0000000015000008] = 00000000
	stba	%l1,[%i2+%o6]0x80	! Mem[0000000015000008] = 00000000
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0cc,%g2
p1_b204:
!	Registers modified during the branch to p1_far_3
!	%l3  = 000000001f6ea82d
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (352)
!	%f11 = 00000000, %f30 = 7e560200, %f2  = 00000000
	fadds	%f11,%f30,%f2 		! %f2  = 7e560200
!	Mem[0000000031800010] = c58ed73a, %l5 = 0000000000000028
	lduha	[%o3+0x012]%asi,%l5	! %l5 = 000000000000d73a
!	Mem[0000000015000094] = 1f5a9693, %l7 = fffffffffffff3db
	ldsh	[%i2+0x096],%l7		! %l7 = ffffffffffff9693

p1_label_177:
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015800000] = 0536ffff ff02c55d ff000000 352fc000
	prefetch [%i3+0x000],16
p1_b205:
	membar	#Sync			! Added by membar checker (353)
!	%f10 = 00000000 00000000, %f0  = c8c9b367 7dd60200
	fnegd	%f10,%f0 		! %f0  = 80000000 00000000
!	Branch On Register, %l0 = 0000000063b20536
	brlez,a,pn %l0,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000030800058] = c6ecb885, %l6 = 0000000000000000
	swap	[%o1+0x058],%l6		! Annulled
p1_b206:

p1_label_178:
	membar	#Sync			! Added by membar checker (354)
!	%l7 = ffffffffffff9693, %l0 = 0000000063b20536, %l4 = 000000001f6ed9a9
	srlx	%l7,%l0,%l4		! %l4 = 00000000000003ff
!	%f30 = 7e560200 00000000, %f24 = 12f139be 80000000
	fcmped	%fcc2,%f30,%f24		! %fcc2 = 2
!	%l7 = ffffffffffff9693, %l7 = ffffffffffff9693, %y  = 00000000
	udiv	%l7,%l7,%l0		! %l0 = 0000000000000001
!	%l0 = 0000000000000001, %l1 = 0000000000000000, %y  = 00000000
	smulcc	%l0,%l1,%l2		! %l2 = 0000000000000000, %ccr = 44
!	Mem[0000000015000038] = 733dfb52, %l6 = 0000000000000000
	lduh	[%i2+0x038],%l6		! %l6 = 000000000000733d

p1_label_179:
!	%l0 = 00000001, %l1 = 00000000, Mem[0000000014000008] = ff0000b4 ffffffff
	stda	%l0,[%i0+%o6]0x80	! Mem[0000000014000008] = 00000001 00000000
	fbue,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = ffffffffffff9693, Mem[0000000015800000] = 0536ffff
	stha	%l7,[%i3+%g0]0x80	! Annulled
p1_b207:
	membar	#Sync			! Added by membar checker (355)
!	%f16 = 00000000 c0000000, %f18 = 00000000 39800000
	fabsd	%f16,%f18		! %f18 = 00000000 c0000000
	set	p1_b208,%o7
	fba	p1_far_0_le	! Branch Taken, %fcc0 = 1

p1_label_180:
!	%l3 = 000000001f6ea82d, Mem[0000000014800000] = 80000000
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000014800000] = 2d000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0d0,%g2
p1_b208:
	membar	#Sync			! Added by membar checker (356)
!	%l2 = 00000000, %l3 = 1f6ea82d, Mem[0000000030800018] = ff7deee3 2ffec3a8
	std	%l2,[%o1+0x018]	! Mem[0000000030800018] = 00000000 1f6ea82d
!	Mem[00000000158001f8] = 1dc7901a, %l0 = 0000000000000001
	ldstub	[%i3+0x1f8],%l0		! %l0 = 000000000000001d
!	%f24 = 12f139be 80000000, %f2  = 7e560200 00000000
	fcmped	%fcc1,%f24,%f2 		! %fcc1 = 1
!	%l3 = 000000001f6ea82d, Mem[00000000148001e8] = 713ac207
	stw	%l3,[%i1+0x1e8]		! Mem[00000000148001e8] = 1f6ea82d

p1_label_181:
!	Mem[0000000030000018] = 00000001 00000001, %l1 = 0000000000000000, %l3 = 000000001f6ea82d
	add	%o0,0x18,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 1f6ed9a90000109f
	set	p1_b209,%o7
	fbl,a	p1_far_3_he	! Branch Taken, %fcc0 = 1
!	%l3 = 1f6ed9a90000109f, Mem[0000000014800008] = ff0000000000b45c
	stxa	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = 1f6ed9a90000109f
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x0d1,%g2
p1_b209:
!	Registers modified during the branch to p1_far_3
!	%l4  = 00000000000000c7
!	%l7  = 000000ffffffffff
	membar	#Sync			! Added by membar checker (357)
!	%l1 = 0000000000000000, immed = fffffd8b, %y  = 00000000
	sdivcc	%l1,-0x275,%l4		! %l4 = 0000000000000000, %ccr = 44
!	Mem[0000000014000000] = 00000000 00000005 00000001 00000000
	prefetch [%i0+0x000],22

p1_label_182:
!	%f29 = c0000000, %f30 = 7e560200 00000000
	fstod	%f29,%f30		! %f30 = c0000000 00000000
!	Branch On Register, %l5 = 000000000000d73a
	brlez,pn %l5,p1_not_taken_0	! Branch Not Taken
!	%l6 = 000000000000733d, Mem[0000000040000018] = 000000001f6ed9a9
	stx	%l6,[%o5+0x018]		! Mem[0000000040000018] = 000000000000733d
p1_b210:
	membar	#Sync			! Added by membar checker (358)
!	Mem[0000000032000000] = 00000000 348bcced 6b78d8c7 ffffffff
	prefetcha [%o4+0x000]%asi,16
!	%l3 = 1f6ed9a90000109f, Mem[0000000015800000] = 0536ffff
	stba	%l3,[%i3+%g0]0x80	! Mem[0000000015800000] = 9f36ffff

p1_label_183:
	be	p1_b211			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000031800014] = b9a15610, %l4 = 0000000000000000
	lduw	[%o3+0x014],%l4		! %l4 = 00000000b9a15610
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0d3,%g2
p1_b211:
	membar	#Sync			! Added by membar checker (359)
!	%l0 = 000000000000001d, immed = 000009da, %l4 = 00000000b9a15610
	orncc	%l0,0x9da,%l4		! %l4 = fffffffffffff63d, %ccr = 88
	set	p1_b212,%o7
	fbo,a,pt %fcc1,p1_near_3_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000014800008] = 1f6ed9a9, %l3 = 1f6ed9a90000109f
	ldstuba	[%i1+%o6]0x80,%l3	! %l3 = 000000000000001f
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x0d4,%g2
p1_b212:
!	Registers modified during the branch to p1_near_3
!	%l0  = 0000000000000a54
!	%l3  = 000000fffffff63c
!	%l5  = 00000000fd875000

p1_label_184:
	membar	#Sync			! Added by membar checker (360)
!	Mem[0000000014800008] = ff6ed9a90000109f, %l7 = 000000ffffffffff
	ldxa	[%i1+%o6]0x80,%l7	! %l7 = ff6ed9a90000109f
!	Mem[000000001580010c] = f2581233, %l6 = 000000000000733d
	ldswa	[%i3+0x10c]%asi,%l6	! %l6 = fffffffff2581233
!	Mem[0000000015000040] = d4cd5edb 4788f0a5 24093edc 92cc491f
	prefetch [%i2+0x040],4
!	Mem[0000000031000018] = 00140854, %l5 = 00000000fd875000
	ldsh	[%o2+0x01a],%l5		! %l5 = 0000000000000854
!	%l3 = 000000fffffff63c, %l1 = 0000000000000000, %l5 = 0000000000000854
	taddcc	%l3,%l1,%l5		! %l5 = 000000fffffff63c, %ccr = 08

p1_label_185:
	fbge,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[0000000015000000] = 14328fe0, %l4 = fffffffffffff63d
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000001432
p1_b213:
	membar	#Sync			! Added by membar checker (361)
!	%l3 = 000000fffffff63c, Mem[00000000150001e2] = 44c5fcf3
	stha	%l3,[%i2+0x1e2]%asi	! Mem[00000000150001e0] = 44c5f63c
	bvc,a	p1_b214			! Branch Taken, %ccr = 08, CWP = 0
!	%l5 = 000000fffffff63c, Mem[00000000158001a7] = 20fbacf8
	stb	%l5,[%i3+0x1a7]		! Mem[00000000158001a4] = 20fbac3c
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0d6,%g2
p1_b214:

p1_label_186:
	membar	#Sync			! Added by membar checker (362)
!	%l7 = ff6ed9a90000109f, immed = fffff577, %l1 = 0000000000000000
	or	%l7,-0xa89,%l1		! %l1 = fffffffffffff5ff
!	Mem[0000000031800010] = c58ed73ab9a15610, %l2 = 0000000000000000
	ldx	[%o3+0x010],%l2		! %l2 = c58ed73ab9a15610
	set	p1_b215,%o7
	fbule	p1_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000014000008] = 00000001, %l3 = 000000fffffff63c
	ldstuba	[%i0+%o6]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p1_branch_failed
	mov	0x0d7,%g2
p1_b215:
!	Registers modified during the branch to p1_far_1
!	%l2  = 0000000000000000
!	%l6  = fffffffff78abbca
	membar	#Sync			! Added by membar checker (363)
!	Mem[0000000014000008] = ff000001, %l7 = ff6ed9a90000109f
	swapa	[%i0+%o6]0x80,%l7	! %l7 = 00000000ff000001

p1_label_187:
!	%l1 = fffffffffffff5ff, immed = 00000c15, %l6 = fffffffff78abbca
	xnorcc	%l1,0xc15,%l6		! %l6 = 0000000000000615, %ccr = 00
!	%l0 = 0000000000000a54, Mem[0000000015000008] = 00000000
	stha	%l0,[%i2+%o6]0x80	! Mem[0000000015000008] = 0a540000
!	%l2 = 0000000000000000, %l5 = 000000fffffff63c, %l4 = 0000000000001432
	orncc	%l2,%l5,%l4		! %l4 = ffffff00000009c3, %ccr = 80
!	%l1 = fffffffffffff5ff, Mem[0000000030800018] = 000000001f6ea82d
	stx	%l1,[%o1+0x018]		! Mem[0000000030800018] = fffffffffffff5ff
!	%f22 = 7dd60200 00000000, %f2  = 7e560200 00000000
	fcmped	%fcc2,%f22,%f2 		! %fcc2 = 1

p1_label_188:
!	Mem[0000000032000040] = c78fef2b 03faa03f b4eadc8a 00002166
	prefetch [%o4+0x040],23
!	%f8  = 7dd60200 00000000, %f6  = 80000000 00000000, %f30 = c0000000 00000000
	fmuld	%f8 ,%f6 ,%f30		! %f30 = 80000000 00000000
!	%l6 = 0000000000000615, immed = 00000af2, %l6 = 0000000000000615
	xor	%l6,0xaf2,%l6		! %l6 = 0000000000000ce7
	bl	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	%l5 = 000000fffffff63c, Mem[0000000030000058] = 00000000
	stb	%l5,[%o0+0x058]		! Mem[0000000030000058] = 3c000000
p1_b216:

p1_label_189:
	membar	#Sync			! Added by membar checker (364)
!	%l2 = 0000000000000000, Mem[0000000015800008] = ff000000
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000000
!	%l4 = ffffff00000009c3, %l5 = 000000fffffff63c, %y  = 00000000
	smul	%l4,%l5,%l1		! %l1 = ffffffffffa0abb4
!	Mem[0000000015800008] = 00000000, %l0 = 0000000000000a54
	lduwa	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000
!	%l2 = 0000000000000000
	sethi	%hi(0x9341e400),%l2	! %l2 = 000000009341e400
!	%f20 = 00000000, %f30 = 80000000
	fmovs	%f20,%f30		! %f30 = 00000000

p1_label_190:
!	%l6 = 0000000000000ce7, immed = 00000797, %l1 = ffffffffffa0abb4
	or	%l6,0x797,%l1		! %l1 = 0000000000000ff7
!	%l1 = 0000000000000ff7, immed = fffff9bb, %l2 = 000000009341e400
	and	%l1,-0x645,%l2		! %l2 = 00000000000009b3
!	%l1 = 0000000000000ff7, immed = 000008bb, %l5 = 000000fffffff63c
	tsubcc	%l1,0x8bb,%l5		! %l5 = 000000000000073c, %ccr = 02
!	Branch On Register, %l6 = 0000000000000ce7
	brz,pt	%l6,p1_not_taken_0	! Branch Not Taken
!	%l0 = 0000000000000000, Mem[0000000032000002] = 0000348b
	stb	%l0,[%o4+0x002]		! Mem[0000000032000000] = 0000348b
p1_b217:

p1_label_191:
	membar	#Sync			! Added by membar checker (365)
!	Mem[0000000015800008] = 00000000, %l3 = 0000000000000000
	lduwa	[%i3+%o6]0x80,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000ff000001, %l5 = 000000000000073c, %l4 = ffffff00000009c3
	sll	%l7,%l5,%l4		! %l4 = 0ff0000010000000
!	Mem[00000000140000c0] = c00d88f9, %l7 = 00000000ff000001
	lduba	[%i0+0x0c1]%asi,%l7	! %l7 = 000000000000000d
!	Mem[0000000014800008] = ff6ed9a9, %l3 = 0000000000000000
	lduha	[%i1+%o6]0x80,%l3	! %l3 = 000000000000ff6e
	bpos,a	p1_b218			! Branch Taken, %ccr = 02, CWP = 0

p1_label_192:
!	Mem[0000000015000148] = 9c7dca3d, %l6 = 0000000000000ce7
	ldsb	[%i2+0x148],%l6		! %l6 = ffffffffffffff9c
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x0da,%g2
p1_b218:
	set	p1_b219,%o7
	fbul	p1_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000015800008] = 00000000, %l4 = 0ff0000010000000
	ldsha	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0db,%g2
p1_b219:
!	Registers modified during the branch to p1_far_3
!	%l4  = 0000000000000000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (366)
!	Mem[00000000158000b0] = c0e8f690, %l4 = 0000000000000000
	ldsw	[%i3+0x0b0],%l4		! %l4 = ffffffffc0e8f690
!	%l0 = 0000000000000000, immed = fffffe89, %l5 = 000000000000073c
	orn	%l0,-0x177,%l5		! %l5 = 0000000000000176

p1_label_193:
!	%f23 = 00000000, %f18 = 00000000, %f8  = 7dd60200
	fadds	%f23,%f18,%f8 		! %f8  = 00000000
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000015000060] = e427ef57 9dfcabc1 d091e8ec 6026dbcc
	prefetch [%i2+0x060],4
p1_b220:
	membar	#Sync			! Added by membar checker (367)
!	%l3 = 000000000000ff6e, immed = 00000002, %l4 = ffffffffc0e8f690
	srl	%l3,0x002,%l4		! %l4 = 0000000000003fdb
!	%f7  = 00000000, %f24 = 12f139be
	fstoi	%f7 ,%f24		! %f24 = 00000000

p1_label_194:
!	Mem[0000000015800160] = e6b32122 86599b47 eec4aba8 e30bc8f4
	prefetcha [%i3+0x160]%asi,2
!	%l6 = ffffffffffffff9c, immed = 000007de, %l2 = 00000000000009b3
	tsubcc	%l6,0x7de,%l2		! %l2 = fffffffffffff7be, %ccr = 8a
!	%l3 = 000000000000ff6e, %l0 = 0000000000000000, %y  = ffffffff
	umulcc	%l3,%l0,%l2		! %l2 = 0000000000000000, %ccr = 44
!	%f14 = 3b87c1ec 5382ae40, %f22 = 7dd60200 00000000
	fcmpd	%fcc3,%f14,%f22		! %fcc3 = 1
!	%l0 = 0000000000000000, %l5 = 0000000000000176, %l7 = 0000000000000000
	addc	%l0,%l5,%l7		! %l7 = 0000000000000176

p1_label_195:
!	%l3 = 000000000000ff6e, immed = 000001cc, %y  = 00000000
	umulcc	%l3,0x1cc,%l1		! %l1 = 0000000001caf9a8, %ccr = 00
	fbue,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000014800008] = ff6ed9a9, %l5 = 0000000000000176
	lduba	[%i1+%o6]0x80,%l5	! %l5 = 00000000000000ff
p1_b221:
	membar	#Sync			! Added by membar checker (368)
!	%l0 = 00000000, %l1 = 01caf9a8, Mem[0000000015000000] = 14328fe0 348bcced
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000015000000] = 00000000 01caf9a8
!	%f6  = 80000000, %f8  = 00000000
	fmovs	%f6 ,%f8 		! %f8  = 80000000

p1_label_196:
	bg,a	p1_b222			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000150000e0] = c0da132c 899b991d 1b389e36 e64cc135
	prefetch [%i2+0x0e0],21
!	The following code should not be executed
	nop
	ba	p1_branch_failed
	mov	0x0de,%g2
p1_b222:
	membar	#Sync			! Added by membar checker (369)
	set	p1_b223,%o7
	fbule,pt %fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000031800018] = 00000000 00000014, %l4 = 00003fdb, %l5 = 000000ff
	ldd	[%o3+0x018],%l4		! %l4 = 0000000000000000 0000000000000014
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x0df,%g2
p1_b223:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffffffffff0091
!	%l3  = 0000000000000e00
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (370)
!	%l4 = 0000000000000000, Mem[0000000017000008] = 520090f6
	stwa	%l4,[%i6+%o6]0x80	! Mem[0000000017000008] = 00000000

p1_label_197:
!	%l7 = 0000000000000000, immed = 000004e6, %l5 = 0000000000000014
	orncc	%l7,0x4e6,%l5		! %l5 = fffffffffffffb19, %ccr = 88
!	%l3 = 0000000000000e00, %l5 = fffffffffffffb19, %y  = 00000000
	udivcc	%l3,%l5,%l1		! %l1 = 0000000000000000, %ccr = 44
	fbn,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000008] = 0a540000, %l2 = 0000000000000000
	lduwa	[%i2+%o6]0x80,%l2	! Annulled
p1_b224:
	membar	#Sync			! Added by membar checker (371)
!	%l6 = ffffffffffffff9c, immed = 000002e3, %l0 = 0000000000000000
	addccc	%l6,0x2e3,%l0		! %l0 = 000000000000027f, %ccr = 11

p1_label_198:
!	%l1 = 0000000000000000, %l5 = fffffffffffffb19, %y  = 00000000
	sdiv	%l1,%l5,%l1		! %l1 = 0000000000000000
!	Branch On Register, %l7 = 0000000000000000
	brlez,pt %l7,p1_b225		! Branch Taken
!	%l0 = 0000027f, %l1 = 00000000, Mem[0000000016000008] = 0000b30a 0a770fb9
	stda	%l0,[%i4+%o6]0x80	! Mem[0000000016000008] = 0000027f 00000000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p1_branch_failed
	mov	0x0e1,%g2
p1_b225:
	membar	#Sync			! Added by membar checker (372)
!	Mem[0000000015000080] = 38f7db20 be32e3cc bba6a716 e6b021b7
	prefetcha [%i2+0x080]%asi,16
!	call to call_1, CWP = 0
	call	p1_call_1_le

p1_label_199:
!	Mem[00000000150000f4] = 04ac037b, %l3 = 0000000000000e00
	ldsh	[%i2+0x0f4],%l3		! %l3 = 00000000000004ac
!	Registers modified during the branch to p1_call_1
!	%l2  = 0000000000000000
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000014800008] = ff6ed9a9, %l0 = 000000000000027f
	ldstuba	[%i1+%o6]0x80,%l0	! %l0 = 00000000000000ff
p1_b226:
	membar	#Sync			! Added by membar checker (373)
!	%f28 = ba5e2737 c0000000, %f8  = 80000000 00000000
	fcmped	%fcc3,%f28,%f8 		! %fcc3 = 1
	nop				! Delay added due to fcmp
	set	p1_b227,%o7
	fba,pn	%fcc0,p1_near_3_le	! Branch Taken, %fcc0 = 1

p1_label_200:
!	Mem[00000000148001f8] = f78abbca, %l7 = 0000000000000000
	ldsb	[%i1+0x1f8],%l7		! %l7 = fffffffffffffff7
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x0e3,%g2
p1_b227:
!	Registers modified during the branch to p1_near_3
!	%l0  = 0000000000000a5f
!	%l3  = fffffffffffffff8
!	%l5  = 000000000000d73a
	membar	#Sync			! Added by membar checker (374)
!	Mem[00000000168001b8] = 1f447239, %l6 = ffffffffffffff9c
	lduha	[%i5+0x1b8]%asi,%l6	! %l6 = 0000000000001f44
	set	p1_b228,%o7
	fbul	p1_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000078] = f255bd30fe093a5d, %l4 = 0000000000000000
	ldx	[%o4+0x078],%g2		! %g2 = f255bd30fe093a5d
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p1_branch_failed
	mov	0x0e4,%g2
p1_b228:
!	Registers modified during the branch to p1_far_3
!	%l3  = 0000000000000000
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (375)
	nop

	membar	#Sync			! Force all stores to complete

!	End of Random Code for Processor 1

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x004]		! Set processor 1 done flag

!	Check Registers

p1_check_registers:
	set	p1_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000a5f
	bne,a,pn %xcc,p1_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000000000d73a
	bne,a,pn %xcc,p1_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be fffffffffffffff7
	bne,a,pn %xcc,p1_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p1_check_fp_registers:
	set	p1_temp,%g1
	set	p1_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 80000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 7e560200 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 80000000 39800000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 80000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 80000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 2543cb73
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 3b87c1ec 5382ae40
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 c0000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 c0000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 7dd60200 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 80000000
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
	cmp	%l0,%l1			! %f28 should be ba5e2737 c0000000
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
	ldx	[%g1+0x000],%g2		! Expect data = 0000000000000005
	ldx	[%i0+0x000],%g3		! Observed data at 0000000014000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000109f00000000
	ldx	[%i0+0x008],%g3		! Observed data at 0000000014000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 00000000f647e958
	ldx	[%i0+0x010],%g3		! Observed data at 0000000014000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 0000000d6f7aff93
	ldx	[%i0+0x020],%g3		! Observed data at 0000000014000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x058],%g2		! Expect data = aab7af1b19e23803
	ldx	[%i0+0x058],%g3		! Observed data at 0000000014000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 00000000c5a60003
	ldx	[%i0+0x070],%g3		! Observed data at 0000000014000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x090],%g2		! Expect data = f4308468441f9f1d
	ldx	[%i0+0x090],%g3		! Observed data at 0000000014000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 63b2053614328fe0
	ldx	[%i0+0x098],%g3		! Observed data at 0000000014000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 730697ba000000ff
	ldx	[%i0+0x0d8],%g3		! Observed data at 00000000140000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 5a4b4229216909a4
	ldx	[%i0+0x0e8],%g3		! Observed data at 00000000140000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = fffff0f1daf47252
	ldx	[%i0+0x0f0],%g3		! Observed data at 00000000140000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x140],%g2		! Expect data = e2d12aed54af96ff
	ldx	[%i0+0x140],%g3		! Observed data at 0000000014000140
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x160],%g2		! Expect data = aa977034a1bdb372
	ldx	[%i0+0x160],%g3		! Observed data at 0000000014000160
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x188],%g2		! Expect data = 63b20536bf87f77b
	ldx	[%i0+0x188],%g3		! Observed data at 0000000014000188
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x188,%g4
	ldx	[%g1+0x198],%g2		! Expect data = abda06fff2b571f2
	ldx	[%i0+0x198],%g3		! Observed data at 0000000014000198
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1c0],%g2		! Expect data = fffffffffffb6b72
	ldx	[%i0+0x1c0],%g3		! Observed data at 00000000140001c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1c0,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = 0a18cbd9ff563149
	ldx	[%i0+0x1d8],%g3		! Observed data at 00000000140001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d8,%g4

	set	p1_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 2d000000216909a4
	ldx	[%i1+0x000],%g3		! Observed data at 0000000014800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff6ed9a90000109f
	ldx	[%i1+0x008],%g3		! Observed data at 0000000014800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 0cee109fd47c954b
	ldx	[%i1+0x020],%g3		! Observed data at 0000000014800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 34dced49e4071d5f
	ldx	[%i1+0x028],%g3		! Observed data at 0000000014800028
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 1134920600003265
	ldx	[%i1+0x090],%g3		! Observed data at 0000000014800090
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 141736c99fff5ae8
	ldx	[%i1+0x098],%g3		! Observed data at 0000000014800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 1f3d6d1c7f6dffb2
	ldx	[%i1+0x0c0],%g3		! Observed data at 00000000148000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 487eb1ff1b3111ca
	ldx	[%i1+0x0c8],%g3		! Observed data at 00000000148000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x168],%g2		! Expect data = 0000000000003265
	ldx	[%i1+0x168],%g3		! Observed data at 0000000014800168
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x190],%g2		! Expect data = 14328fe0afda3d0b
	ldx	[%i1+0x190],%g3		! Observed data at 0000000014800190
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 86a250a92cbc86c3
	ldx	[%i1+0x198],%g3		! Observed data at 0000000014800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = 0000a2d55a066e80
	ldx	[%i1+0x1d0],%g3		! Observed data at 00000000148001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 1f6ea82d00059d44
	ldx	[%i1+0x1e8],%g3		! Observed data at 00000000148001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1e8,%g4

	set	p1_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000001caf9a8
	ldx	[%i2+0x000],%g3		! Observed data at 0000000015000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0a540000348bcced
	ldx	[%i2+0x008],%g3		! Observed data at 0000000015000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 039d47ffb993f000
	ldx	[%i2+0x010],%g3		! Observed data at 0000000015000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 8447c7b947a6c5b7
	ldx	[%i2+0x018],%g3		! Observed data at 0000000015000018
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 68ff61eefa2ad6b5
	ldx	[%i2+0x078],%g3		! Observed data at 0000000015000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x090],%g2		! Expect data = ff2dfd6b1f5a9693
	ldx	[%i2+0x090],%g3		! Observed data at 0000000015000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = c0d90fbdf9ff62a8
	ldx	[%i2+0x0a0],%g3		! Observed data at 00000000150000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = a8cda3d0ddc3b9e7
	ldx	[%i2+0x1b8],%g3		! Observed data at 00000000150001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1b8,%g4
	ldx	[%g1+0x1e0],%g2		! Expect data = 44c5f63ca23f7634
	ldx	[%i2+0x1e0],%g3		! Observed data at 00000000150001e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1e0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 00c10000000081c1
	ldx	[%i2+0x1e8],%g3		! Observed data at 00000000150001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 143225ec078c240b
	ldx	[%i2+0x1f8],%g3		! Observed data at 00000000150001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 9f36ffffff02c55d
	ldx	[%i3+0x000],%g3		! Observed data at 0000000015800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 00000000352fc000
	ldx	[%i3+0x008],%g3		! Observed data at 0000000015800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 000014325bd13c04
	ldx	[%i3+0x040],%g3		! Observed data at 0000000015800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 475297f3786effff
	ldx	[%i3+0x048],%g3		! Observed data at 0000000015800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 6f8822fd889beaff
	ldx	[%i3+0x060],%g3		! Observed data at 0000000015800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 0d08216c0f94e9ff
	ldx	[%i3+0x098],%g3		! Observed data at 0000000015800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 07dbc64bac232261
	ldx	[%i3+0x128],%g3		! Observed data at 0000000015800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x148],%g2		! Expect data = ebb293214a08e0f9
	ldx	[%i3+0x148],%g3		! Observed data at 0000000015800148
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = bf504ba520fbac3c
	ldx	[%i3+0x1a0],%g3		! Observed data at 00000000158001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = 612dc2035cc5a0a9
	ldx	[%i3+0x1d8],%g3		! Observed data at 00000000158001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = ffc7901ad25eadb8
	ldx	[%i3+0x1f8],%g3		! Observed data at 00000000158001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 216901802168fb56
	ldx	[%i4+0x000],%g3		! Observed data at 0000000016000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000027f00000000
	ldx	[%i4+0x008],%g3		! Observed data at 0000000016000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 000000008f887ff2
	ldx	[%i4+0x0b8],%g3		! Observed data at 00000000160000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0b8,%g4

	set	p1_local5_expect,%g1
	ldx	[%g1+0x038],%g2		! Expect data = eb08a5ef3a23ffff
	ldx	[%i5+0x038],%g3		! Observed data at 0000000016800038
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = a5a9331d5783b340
	ldx	[%i5+0x0a0],%g3		! Observed data at 00000000168000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a0,%g4

	set	p1_local6_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 00000000f607ff78
	ldx	[%i6+0x008],%g3		! Observed data at 0000000017000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x120],%g2		! Expect data = ffffffffffffa0e6
	ldx	[%i6+0x120],%g3		! Observed data at 0000000017000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x120,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p1_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p1_memcheck_share0:
	ldx	[%g4+0x10],%g2	! Expected value = 00000000000065b5
	ldx	[%o0+0x10],%g3	! Read value at Mem[0000000030000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 1f6ed9a90000109f
	ldx	[%o0+0x18],%g3	! Read value at Mem[0000000030000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 000000fffffff63c
	ldx	[%o0+0x50],%g3	! Read value at Mem[0000000030000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 3c000000ffffffff
	ldx	[%o0+0x58],%g3	! Read value at Mem[0000000030000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p1_memcheck_share1:
	ldx	[%g4+0x10],%g2	! Expected value = 0000000000000000
	ldx	[%o1+0x10],%g3	! Read value at Mem[0000000030800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = fffffffffffff5ff
	ldx	[%o1+0x18],%g3	! Read value at Mem[0000000030800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = c5a600039b404b21
	ldx	[%o1+0x50],%g3	! Read value at Mem[0000000030800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = c6ecb885000000cb
	ldx	[%o1+0x58],%g3	! Read value at Mem[0000000030800058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p1_memcheck_share2:
	ldx	[%g4+0x10],%g2	! Expected value = e6ff98ec00c10000
	ldx	[%o2+0x10],%g3	! Read value at Mem[0000000031000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 00140854ffffffff
	ldx	[%o2+0x18],%g3	! Read value at Mem[0000000031000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 00005c6cff00007c
	ldx	[%o2+0x50],%g3	! Read value at Mem[0000000031000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = ab786e7201ccff6b
	ldx	[%o2+0x58],%g3	! Read value at Mem[0000000031000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p1_memcheck_share3:
	ldx	[%g4+0x10],%g2	! Expected value = c58ed73ab9a15610
	ldx	[%o3+0x10],%g3	! Read value at Mem[0000000031800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 0000000000000014
	ldx	[%o3+0x18],%g3	! Read value at Mem[0000000031800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 6c9da207fffffb19
	ldx	[%o3+0x50],%g3	! Read value at Mem[0000000031800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 77f3dbebeaf0adb3
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
	stb	%l2,[%o3+0x05b]		! Mem[000000003180005b]
	subccc	%l2,%l7,%l4
	udiv	%l2,-0xe67,%l5
	andn	%l0,%l3,%l6
	add	%l3,%l7,%l2
	sdiv	%l7,0xa77,%l5
	prefetch [%i2+0x040],4
	done

p1_trap1o:
	stb	%l2,[%i3+0x05b]		! Mem[000000003180005b]
	subccc	%l2,%l7,%l4
	udiv	%l2,-0xe67,%l5
	andn	%l0,%l3,%l6
	add	%l3,%l7,%l2
	sdiv	%l7,0xa77,%l5
	prefetch [%o2+0x040],4
	done


p1_trap2e:
	ldsb	[%o3+0x059],%l4		! Mem[0000000031800059]
	umulcc	%l4,-0xa87,%l0
	xorcc	%l5,%l4,%l0
	done

p1_trap2o:
	ldsb	[%i3+0x059],%l4		! Mem[0000000031800059]
	umulcc	%l4,-0xa87,%l0
	xorcc	%l5,%l4,%l0
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
	ldx	[%g1+0x000],%l0	! %l0 = 9bc8ee003b9a12e8
	ldx	[%g1+0x008],%l1	! %l1 = 061cbc0051ab6532
	ldx	[%g1+0x010],%l2	! %l2 = 3a66ef006e8c85ae
	ldx	[%g1+0x018],%l3	! %l3 = 08a831ffaff10460
	ldx	[%g1+0x020],%l4	! %l4 = 5b83b4003e5f6d44
	ldx	[%g1+0x028],%l5	! %l5 = 66576b005df2c2c6
	ldx	[%g1+0x030],%l6	! %l6 = 4ec569ffdaf47c79
	ldx	[%g1+0x038],%l7	! %l7 = 3b0f9effcd196892

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
	ldd	[%g1+0x00],%f0		! %f0  = 93fbde0b, %f1  = 08c65226
	ldd	[%g1+0x08],%f2		! %f2  = a09afd44, %f3  = 10884754
	ldd	[%g1+0x10],%f4		! %f4  = 436075fc, %f5  = 9f507092
	ldd	[%g1+0x18],%f6		! %f6  = e77a8b81, %f7  = 7c07a3f7
	ldd	[%g1+0x20],%f8		! %f8  = 116760d3, %f9  = 9eae2418
	ldd	[%g1+0x28],%f10		! %f10 = 0df08775, %f11 = 0ed31bbc
	ldd	[%g1+0x30],%f12		! %f12 = a759978b, %f13 = 8343c848
	ldd	[%g1+0x38],%f14		! %f14 = a59d913a, %f15 = 1e2b5361
	ldd	[%g1+0x40],%f16		! %f16 = 6955c646, %f17 = 1e46fe0d
	ldd	[%g1+0x48],%f18		! %f18 = 608c936b, %f19 = 9ee48851
	ldd	[%g1+0x50],%f20		! %f20 = 170ede4b, %f21 = c07cc140
	ldd	[%g1+0x58],%f22		! %f22 = 379c62da, %f23 = 6c020d29
	ldd	[%g1+0x60],%f24		! %f24 = e6f6917b, %f25 = 75f8f562
	ldd	[%g1+0x68],%f26		! %f26 = f332ad93, %f27 = c965d8a1
	ldd	[%g1+0x70],%f28		! %f28 = 6b51f2be, %f29 = cb6e7e6c
	ldd	[%g1+0x78],%f30		! %f30 = 52cb6f77, %f31 = 5509fe7e
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 2

p2_label_1:
!	%l0 = b188ce0020e54ef2, %l2 = ef11c5ffa8142266, %l5 = 52847bffc66dae5c
	subc	%l0,%l2,%l5		! %l5 = c277080078d12c8c
!	Mem[0000000018800008] = 72551e96, %l3 = 0ca7ff000802fb48
	ldstuba	[%i1+%o6]0x80,%l3	! %l3 = 0000000000000072
	bneg	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l7 = b2bc60fff09c6b1f, Mem[0000000030000020] = 5f7de36a519a64c8
	stx	%l7,[%o0+0x020]		! Mem[0000000030000020] = b2bc60fff09c6b1f
p2_b1:
	bl,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44

p2_label_2:
!	 Annulled
	ldd	[%i0+0x1f8],%l4
p2_b2:
	membar	#Sync			! Added by membar checker (376)
!	Mem[0000000031000020] = 6f95f13c, %l2 = ef11c5ffa8142266
	lduwa	[%o2+0x020]%asi,%l2	! %l2 = 000000006f95f13c
	set	p2_b3,%o7
	fbge	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000040000038] = 2b31240f, %l4 = da9663ffdba9f716
	ldstub	[%o5+0x038],%l4		! %l4 = 000000000000002b
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x003,%g2
p2_b3:
!	Registers modified during the branch to p2_far_0
!	%l4  = 000000000041ca9d
!	%l7  = 000000000000098d
	membar	#Sync			! Added by membar checker (377)
!	%l6 = 57ad8b4e, %l7 = 0000098d, Mem[000000001b000000] = 95c9a8f8 ce7f2241
	stda	%l6,[%i6+%g0]0x80	! Mem[000000001b000000] = 57ad8b4e 0000098d

p2_label_3:
	bvc	p2_b4			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000019800008] = 0dc3ce87, %l2 = 000000006f95f13c
	swapa	[%i3+%o6]0x80,%l2	! %l2 = 000000000dc3ce87
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x004,%g2
p2_b4:
	membar	#Sync			! Added by membar checker (378)
!	%l3 = 0000000000000072, immed = 00000ca7, %y  = 00000000
	udiv	%l3,0xca7,%l1		! %l1 = 0000000000000000
!	%l5 = c277080078d12c8c
	sethi	%hi(0x65e81800),%l5	! %l5 = 0000000065e81800
	set	p2_b5,%o7
	fba,pn	%fcc2,p2_near_0_le	! Branch Taken, %fcc2 = 0

p2_label_4:
!	%l5 = 0000000065e81800, Mem[0000000019800000] = 40a3042c
	stba	%l5,[%i3+%g0]0x80	! Mem[0000000019800000] = 00a3042c
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x005,%g2
p2_b5:
!	Registers modified during the branch to p2_near_0
!	%l6  = 0000000000000072
!	Jump to jmpl_2, CWP = 0
	set	p2_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000031800064] = 12091d8b, %l2 = 000000000dc3ce87
	swap	[%o3+0x064],%l2		! %l2 = 0000000012091d8b
!	Registers modified during the branch to p2_jmpl_2
!	%l5  = 000000000000009f
!	%l6  = ffffffffffffffff
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l1 = 0000000000000000, Mem[000000001a800000] = f57accc2
	stba	%l1,[%i5+%g0]0x80	! Mem[000000001a800000] = 007accc2
p2_b6:

p2_label_5:
	membar	#Sync			! Added by membar checker (379)
!	%f28 = 6b51f2be cb6e7e6c, %f28 = 6b51f2be cb6e7e6c, %f4  = 436075fc 9f507092
	fdivd	%f28,%f28,%f4 		! %f4  = 3ff00000 00000000
!	%f5  = 00000000, %f11 = 0ed31bbc, %f9  = 9eae2418
	fdivs	%f5 ,%f11,%f9 		! %f9  = 00000000
!	%l0 = b188ce0020e54ef2, immed = 0000066a, %l4 = 000000000041ca9d
	subccc	%l0,0x66a,%l4		! %l4 = b188ce0020e54888, %ccr = 80
!	%l3 = 0000000000000072, immed = fffff855, %y  = 00000000
	umul	%l3,-0x7ab,%l2		! %l2 = 00000071fffc95da
!	%l2 = 00000071fffc95da, immed = 00000742, %y  = 00000071
	umul	%l2,0x742,%l0		! %l0 = 00000741e7379834

p2_label_6:
!	%f26 = f332ad93 c965d8a1, %f8  = 116760d3 00000000
	fnegd	%f26,%f8 		! %f8  = 7332ad93 c965d8a1
!	Mem[0000000018000148] = 86a13a26, %l6 = ffffffffffffffff
	lduh	[%i0+0x148],%l6		! %l6 = 00000000000086a1
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019800008] = 6f95f13c, %l6 = 00000000000086a1
	ldswa	[%i3+%o6]0x80,%l6	! %l6 = 000000006f95f13c
p2_b7:
	membar	#Sync			! Added by membar checker (380)
!	Branch On Register, %l5 = 000000000000009f
	brgz,a,pt %l5,p2_b8		! Branch Taken

p2_label_7:
!	Mem[0000000019800000] = 00a3042c, %l3 = 0000000000000072
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000a3
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x008,%g2
p2_b8:
!	call to call_3, CWP = 0
	call	p2_call_3_he
!	%l6 = 6f95f13c, %l7 = 0000098d, Mem[0000000018000150] = 52ed6535 235da7af
	std	%l6,[%i0+0x150]	! Mem[0000000018000150] = 6f95f13c 0000098d
!	Registers modified during the branch to p2_call_3
!	%l1  = b188ce0020e54784
!	%l2  = fffff8be775d96f7
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (381)
!	%l2 = fffff8be775d96f7, %l4 = b188ce0020e54888, %y  = 00000741
	sdivx	%l2,%l4,%l4		! %l4 = 0000000000000000
	fbg,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0

p2_label_8:
!	Mem[0000000019000008] = 3688bfbd, %l1 = b188ce0020e54784
	lduba	[%i2+%o6]0x80,%l1	! %l1 = 0000000000000036
p2_b9:
	membar	#Sync			! Added by membar checker (382)
!	%l1 = 0000000000000036, Mem[0000000031000020] = 6f95f13c
	sth	%l1,[%o2+0x020]		! Mem[0000000031000020] = 0036f13c
!	%l3 = 00000000000000a3, immed = fffff7ba, %l2 = fffff8be775d96f7
	orn	%l3,-0x846,%l2		! %l2 = 00000000000008e7
!	%f10 = 0df08775, %f4  = 3ff00000, %f26 = f332ad93 c965d8a1
	fsmuld	%f10,%f4 ,%f26		! %f26 = 39cc2fdf b6000000
!	%l3 = 00000000000000a3, Mem[0000000031800020] = 5c0b79bd2ed9cbf6
	stx	%l3,[%o3+0x020]		! Mem[0000000031800020] = 00000000000000a3

p2_label_9:
!	Mem[0000000031800060] = b604127d, %l5 = 0000000000000000
	ldub	[%o3+0x063],%l5		! %l5 = 000000000000007d
!	Mem[000000001800004c] = 9f22183d, %l4 = 00000000, %l1 = 00000036
	add	%i0,0x4c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 000000009f22183d
!	%l7 = 000000000000098d, %l4 = 0000000000000000, %l4 = 0000000000000000
	sub	%l7,%l4,%l4		! %l4 = 000000000000098d
	bl	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000018800008] = ff551e96, %l2 = 00000000000008e7
	swapa	[%i1+%o6]0x80,%l2	! %l2 = 00000000ff551e96
p2_b10:

p2_label_10:
	membar	#Sync			! Added by membar checker (383)
!	%l2 = 00000000ff551e96, immed = 00000005, %l7 = 000000000000098d
	sra	%l2,0x005,%l7		! %l7 = fffffffffffaa8f4
	bne	p2_b11			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000040000038] = ff31240f, %l0 = 00000741e7379834
	lduw	[%o5+0x038],%l0		! %l0 = 00000000ff31240f
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x00b,%g2
p2_b11:
	membar	#Sync			! Added by membar checker (384)
!	%l3 = 00000000000000a3, %l3 = 00000000000000a3, %y  = 00000741
	udivx	%l3,%l3,%l1		! %l1 = 0000000000000001
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_11:
!	Mem[0000000019000008] = 3688bfbd4d6ba292, %l2 = 00000000ff551e96
	ldxa	[%i2+%o6]0x80,%l2	! Annulled
p2_b12:
	bneg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[000000001880017d] = 48f421ce, %l1 = 0000000000000001
	ldstub	[%i1+0x17d],%l1		! Annulled
p2_b13:
	membar	#Sync			! Added by membar checker (385)
!	%l2 = ff551e96, %l3 = 000000a3, Mem[0000000018800000] = a45c5018 01d1d4d2
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000018800000] = ff551e96 000000a3
!	%f4  = 3ff00000 00000000, %f15 = 1e2b5361
	fdtoi	%f4 ,%f15		! %f15 = 00000001

p2_label_12:
!	%l6 = 000000006f95f13c, Mem[000000001800006c] = d321409a
	stw	%l6,[%i0+0x06c]		! Mem[000000001800006c] = 6f95f13c
!	Mem[00000000180001e0] = bf58e557 01a2b728 1f89df85 ca398c52
	prefetcha [%i0+0x1e0]%asi,4
!	Mem[0000000019800020] = db1c7c52 bfaffefd d5f11646 3ee8a0ac
	prefetch [%i3+0x020],16
!	%l0 = 00000000ff31240f, %l0 = 00000000ff31240f, %l0 = 00000000ff31240f
	addc	%l0,%l0,%l0		! %l0 = 00000001fe62481e
!	Mem[00000000188001a0] = 2a6dc0cb 5495af3d
	flush	%i1+0x1a0

p2_label_13:
!	Mem[0000000032000028] = a4176408 4b729f64, %l6 = 6f95f13c, %l7 = fffaa8f4
	ldd	[%o4+0x028],%g2		! %l6 = 000000006f95f13c fffffffffffaa8f4
	fblg,pt	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000019800000] = 00a3042c, %l5 = 000000000000007d
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000a3
p2_b14:
	membar	#Sync			! Added by membar checker (386)
	set	p2_b15,%o7
	fbue,pn	%fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 0
!	%l0 = 00000001fe62481e, Mem[0000000019000008] = 3688bfbd
	stha	%l0,[%i2+%o6]0x80	! Mem[0000000019000008] = 481ebfbd
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x00f,%g2
p2_b15:
!	Registers modified during the branch to p2_near_0
!	%l6  = 00000000000000a4

p2_label_14:
	membar	#Sync			! Added by membar checker (387)
!	%f29 = cb6e7e6c, %f25 = 75f8f562
	fstoi	%f29,%f25		! %f25 = ff118194
!	Branch On Register, %l5 = 00000000000000a3
	brnz,pn	%l5,p2_b16		! Branch Taken
!	Mem[0000000018800000] = ff551e96, %l4 = 000000000000098d
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 000000000000ff55
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x010,%g2
p2_b16:
	fblg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldda	[%i3+%o6]0x80,%l0
p2_b17:

p2_label_15:
	membar	#Sync			! Added by membar checker (388)
!	%f31 = 5509fe7e, %f14 = a59d913a 00000001
	fitod	%f31,%f14		! %f14 = 41d5427f 9f800000
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000018000000] = c19e4c3a, %l3 = 00000000000000a3
	lduwa	[%i0+%g0]0x80,%l3	! Annulled
p2_b18:
	membar	#Sync			! Added by membar checker (389)
!	%l5 = 00000000000000a3
	sethi	%hi(0xb1e60000),%l5	! %l5 = 00000000b1e60000
!	%l5 = 00000000b1e60000, %l4 = 000000000000ff55, %l3 = 00000000000000a3
	addc	%l5,%l4,%l3		! %l3 = 00000000b1e6ff55

p2_label_16:
!	%l6 = 00000000000000a4, immed = 0000026f, %l6 = 00000000000000a4
	andcc	%l6,0x26f,%l6		! %l6 = 0000000000000024, %ccr = 00
	set	p2_b19,%o7
	fba,pn	%fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 0
!	%l0 = 00000001fe62481e, Mem[00000000198001be] = 7428bace
	sth	%l0,[%i3+0x1be]		! Mem[00000000198001bc] = 7428481e
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x013,%g2
p2_b19:
!	Registers modified during the branch to p2_near_0
!	%l0  = fffffffe019dbf88
!	%l1  = ffffffffea82b7fe
!	%l3  = ffffffff4e1900aa
!	%l7  = 0000000000000741
	membar	#Sync			! Added by membar checker (390)
	fbne,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l2 = 00000000ff551e96, Mem[0000000018000008] = 75ab3868
	stha	%l2,[%i0+%o6]0x80	! Annulled
p2_b20:

p2_label_17:
	membar	#Sync			! Added by membar checker (391)
!	%f0  = 93fbde0b 08c65226, %f0  = 93fbde0b 08c65226, %f4  = 3ff00000 00000000
	faddd	%f0 ,%f0 ,%f4 		! %f4  = 940bde0b 08c65226
!	%f27 = b6000000, %f14 = 41d5427f 9f800000
	fitod	%f27,%f14		! %f14 = c1d28000 00000000
	bg	p2_b21			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000019800018] = fe0e36ecff48af05, %l7 = 0000000000000741
	ldx	[%i3+0x018],%l7		! %l7 = fe0e36ecff48af05
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x015,%g2
p2_b21:
	membar	#Sync			! Added by membar checker (392)
!	Mem[0000000018000108] = 75f10817 b969bcb2, %l0 = 019dbf88, %l1 = ea82b7fe
	ldda	[%i0+0x108]%asi,%l0	! %l0 = 0000000075f10817 00000000b969bcb2

p2_label_18:
	fbne	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000024] = ab728bcb, %l6 = 0000000000000024
	ldsw	[%i2+0x024],%l6		! %l6 = ffffffffab728bcb
p2_b22:
	membar	#Sync			! Added by membar checker (393)
!	%l5 = 00000000b1e60000, %l4 = 000000000000ff55, %y  = 00000741
	smul	%l5,%l4,%l5		! %l5 = ffffb21a2b5e0000
!	%f20 = 170ede4b, %f27 = b6000000, %f16 = 6955c646
	fdivs	%f20,%f27,%f16		! %f16 = a08ede4b
!	%l4 = 000000000000ff55, Mem[0000000019800008] = 6f95f13c564e70b7
	stxa	%l4,[%i3+%o6]0x80	! Mem[0000000019800008] = 000000000000ff55

p2_label_19:
	fbn,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001a000000] = e5c56ed0, %l1 = 00000000b969bcb2
	ldsha	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffe5c5
p2_b23:
	membar	#Sync			! Added by membar checker (394)
!	Mem[0000000032000048] = dc8a5390, %l3 = ffffffff4e1900aa
	ldub	[%o4+0x04a],%g2		! %g2 = 00000000000000dc
!	Mem[0000000031000060] = fae110ef 23597606, %l2 = ff551e96, %l3 = 4e1900aa
	ldd	[%o2+0x060],%l2		! %l2 = 00000000fae110ef 0000000023597606
!	Mem[0000000018800008] = 000008e7, %l5 = ffffb21a2b5e0000
	ldsha	[%i1+%o6]0x80,%l5	! %l5 = 0000000000000000

p2_label_20:
	bvc	p2_b24			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[00000000198001c0] = 999e6b21 821cfe74 d8463ed4 8c79b395
	prefetch [%i3+0x1c0],3
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x018,%g2
p2_b24:
	membar	#Sync			! Added by membar checker (395)
!	%l7 = fe0e36ecff48af05, immed = fffff1c1, %l4 = 000000000000ff55
	or	%l7,-0xe3f,%l4		! %l4 = ffffffffffffffc5
	set	p2_b25,%o7
	fble,a	p2_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800020] = 00000000 000000a3, %l4 = ffffffc5, %l5 = 00000000
	ldd	[%o3+0x020],%l4		! %l4 = 0000000000000000 00000000000000a3
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x019,%g2
p2_b25:
!	Registers modified during the branch to p2_far_1
!	%l3  = fffffffffffffbef
!	%l4  = 0000000004e195c1
!	%l5  = 04e19588ea958824
!	%l7  = 04e19588ea958004

p2_label_21:
	membar	#Sync			! Added by membar checker (396)
!	%l5 = 04e19588ea958824, Mem[000000001900002e] = eb6cabe7
	sth	%l5,[%i2+0x02e]		! Mem[000000001900002c] = eb6c8824
	set	p2_b26,%o7
	fble	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	%l3 = fffffffffffffbef, Mem[0000000018000008] = 75ab3868
	stha	%l3,[%i0+%o6]0x80	! Mem[0000000018000008] = fbef3868
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x01a,%g2
p2_b26:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000ebe210
!	%l7  = 000000000000050a
	membar	#Sync			! Added by membar checker (397)
!	%f15 = 00000000, %f20 = 170ede4b, %f18 = 608c936b
	fadds	%f15,%f20,%f18		! %f18 = 170ede4b
	fbne	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_22:
!	Mem[00000000198001cc] = 8c79b395, %l2 = 00000000fae110ef
	ldsw	[%i3+0x1cc],%l2		! %l2 = ffffffff8c79b395
p2_b27:
	membar	#Sync			! Added by membar checker (398)
!	%l5 = 04e19588ea958824, immed = fffff81d, %l5 = 04e19588ea958824
	subc	%l5,-0x7e3,%l5		! %l5 = 04e19588ea959006
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000180001b8] = 19eb970c 9049a34d, %l6 = ab728bcb, %l7 = 0000050a
	ldd	[%i0+0x1b8],%l6		! %l6 = 0000000019eb970c 000000009049a34d
p2_b28:
	membar	#Sync			! Added by membar checker (399)
!	%f10 = 0df08775 0ed31bbc, %f10 = 0df08775 0ed31bbc, %f10 = 0df08775 0ed31bbc
	faddd	%f10,%f10,%f10		! %f10 = 0e008775 0ed31bbc

p2_label_23:
!	%l1 = ffffffffffffe5c5, Mem[0000000030000060] = 260bfb53
	stha	%l1,[%o0+0x060]%asi	! Mem[0000000030000060] = e5c5fb53
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031000024] = ff172702, %l5 = 04e19588ea959006
	ldub	[%o2+0x026],%l5		! Annulled
p2_b29:
	membar	#Sync			! Added by membar checker (400)
!	Branch On Register, %l7 = 000000009049a34d
	brlz,a,pt %l7,p2_not_taken_0	! Branch Not Taken
!	%l5 = 04e19588ea959006, Mem[0000000018000000] = c19e4c3a
	stha	%l5,[%i0+%g0]0x80	! Annulled
p2_b30:

p2_label_24:
	membar	#Sync			! Added by membar checker (401)
!	%l6 = 19eb970c, %l7 = 9049a34d, Mem[0000000018800008] = 000008e7 4254b59d
	stda	%l6,[%i1+%o6]0x80	! Mem[0000000018800008] = 19eb970c 9049a34d
!	%f4  = 940bde0b 08c65226, %f22 = 379c62da 6c020d29
	fabsd	%f4 ,%f22		! %f22 = 140bde0b 08c65226
!	Branch On Register, %l0 = 0000000075f10817
	brz,a,pt %l0,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018000008] = fbef3868, %l6 = 0000000019eb970c
	lduwa	[%i0+%o6]0x80,%l6	! Annulled
p2_b31:
	membar	#Sync			! Added by membar checker (402)
!	%f10 = 0e008775 0ed31bbc, %f12 = a759978b 8343c848
	fabsd	%f10,%f12		! %f12 = 0e008775 0ed31bbc

p2_label_25:
!	Mem[0000000019000008] = 481ebfbd, %l6 = 0000000019eb970c
	lduba	[%i2+%o6]0x80,%l6	! %l6 = 0000000000000048
!	%l0 = 0000000075f10817, immed = 00000004, %l3 = fffffffffffffbef
	sll	%l0,0x004,%l3		! %l3 = 000000075f108170
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000018800000] = ff551e96, %l4 = 0000000000ebe210
	lduwa	[%i1+%g0]0x80,%l4	! Annulled
p2_b32:
	membar	#Sync			! Added by membar checker (403)
!	Mem[0000000018000160] = 3d257678 a4263eda c8c95ec3 41679952
	prefetcha [%i0+0x160]%asi,21

p2_label_26:
!	%l0 = 0000000075f10817, immed = fffffefc, %l3 = 000000075f108170
	andn	%l0,-0x104,%l3		! %l3 = 0000000000000003
!	%l5 = 04e19588ea959006, %l7 = 000000009049a34d, %l5 = 04e19588ea959006
	sll	%l5,%l7,%l5		! %l5 = 32b11d52b200c000
!	%l7 = 000000009049a34d, %l5 = 32b11d52b200c000, %l4 = 0000000000ebe210
	add	%l7,%l5,%l4		! %l4 = 32b11d53424a634d
!	Mem[000000001900016c] = 57388d84, %l4 = 32b11d53424a634d
	swapa	[%i2+0x16c]%asi,%l4	! %l4 = 0000000057388d84
!	%l6 = 0000000000000048, Mem[0000000030000020] = b2bc60ff
	stwa	%l6,[%o0+0x020]%asi	! Mem[0000000030000020] = 00000048

p2_label_27:
	bl,a	p2_not_taken_0		! Branch Not Taken, %ccr = 11
!	%l1 = ffffffffffffe5c5, Mem[0000000030000060] = e5c5fb53
	sth	%l1,[%o0+0x060]		! Annulled
p2_b33:
	membar	#Sync			! Added by membar checker (404)
!	%l2 = ffffffff8c79b395, %l2 = ffffffff8c79b395, %l2 = ffffffff8c79b395
	andncc	%l2,%l2,%l2		! %l2 = 0000000000000000, %ccr = 44
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000174] = 8c9e0c49, %l7 = 000000009049a34d
	lduh	[%i2+0x174],%l7		! %l7 = 0000000000008c9e
p2_b34:

p2_label_28:
	membar	#Sync			! Added by membar checker (405)
!	%l0 = 0000000075f10817, immed = 00000011, %l6 = 0000000000000048
	sra	%l0,0x011,%l6		! %l6 = 0000000000003af8
!	call to call_0, CWP = 0
	call	p2_call_0_he
!	%l6 = 0000000000003af8, Mem[0000000018000008] = fbef3868
	stba	%l6,[%i0+%o6]0x80	! Mem[0000000018000008] = f8ef3868
!	Registers modified during the branch to p2_call_0
!	%l1  = 000000000edfe763
!	%l7  = 00002fe8c24b8778
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],16	! Annulled
p2_b35:

p2_label_29:
	membar	#Sync			! Added by membar checker (406)
!	Mem[00000000198000fc] = 8f1ea26a, %l4 = 0000000057388d84
	lduh	[%i3+0x0fe],%l4		! %l4 = 000000000000a26a
!	%l1 = 000000000edfe763, %l1 = 000000000edfe763, %l6 = 0000000000003af8
	xnor	%l1,%l1,%l6		! %l6 = ffffffffffffffff
!	Mem[0000000018800008] = 19eb970c, %l7 = 00002fe8c24b8778
	ldstuba	[%i1+%o6]0x80,%l7	! %l7 = 0000000000000019
!	Jump to jmpl_0, CWP = 0
	set	p2_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	%l6 = ffffffffffffffff, Mem[0000000032000074] = b8b0b88b
	stb	%l6,[%o4+0x074]		! Mem[0000000032000074] = ffb0b88b
!	Registers modified during the branch to p2_jmpl_0
!	%l0  = fffc8357fffff4a4
!	%l1  = 00037ca800000b5c
!	%l3  = 0000000000006f95
!	%l4  = ffffffffffff817f
!	%l6  = 00037ca800000000

p2_label_30:
	bne,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l4 = ffff817f, %l5 = b200c000, Mem[0000000019800108] = f1ae171b d0f61e71
	std	%l4,[%i3+0x108]	! Annulled
p2_b36:
	membar	#Sync			! Added by membar checker (407)
!	%l6 = 00037ca800000000, %l0 = fffc8357fffff4a4, %l7 = 0000000000000019
	orcc	%l6,%l0,%l7		! %l7 = fffffffffffff4a4, %ccr = 88
	set	p2_b37,%o7
	fbue,a,pt %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000018000000] = c19e4c3aedea0482, %l0 = fffc8357fffff4a4
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = c19e4c3aedea0482
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x025,%g2
p2_b37:
!	Registers modified during the branch to p2_near_0
!	%l6  = 00037ca800007af1

p2_label_31:
	membar	#Sync			! Added by membar checker (408)
!	%f31 = 5509fe7e, %f27 = b6000000, %f8  = 7332ad93
	fmuls	%f31,%f27,%f8 		! %f8  = cb89fe7e
!	Branch On Register, %l0 = c19e4c3aedea0482
	brgz,a,pn %l0,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018800140] = e04ad260 b6b83f4f da3fc704 7dbf7425
	prefetch [%i1+0x140],22	! Annulled
p2_b38:
	membar	#Sync			! Added by membar checker (409)
!	Branch On Register, %l5 = 32b11d52b200c000
	brlz,a,pn %l5,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018800000] = ff551e96, %l3 = 0000000000006f95
	ldstuba	[%i1+%g0]0x80,%l3	! Annulled
p2_b39:

p2_label_32:
	membar	#Sync			! Added by membar checker (410)
!	%f30 = 52cb6f77 5509fe7e, %f12 = 0e008775 0ed31bbc
	fmovd	%f30,%f12		! %f12 = 52cb6f77 5509fe7e
!	%l6 = 00007af1, %l7 = fffff4a4, Mem[0000000018000008] = f8ef3868 dacee5b7
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000018000008] = 00007af1 fffff4a4
	bpos,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000003080006c] = 818ebc3c, %l0 = c19e4c3aedea0482
	lduh	[%o1+0x06e],%l0		! Annulled
p2_b40:
	membar	#Sync			! Added by membar checker (411)
!	%l6 = 00037ca800007af1, immed = 00000e8c, %l1 = 00037ca800000b5c
	sub	%l6,0xe8c,%l1		! %l1 = 00037ca800006c65

p2_label_33:
!	Mem[0000000030800020] = 8fa0e5f7, %l6 = 00007af1, %l3 = 00006f95
	add	%o1,0x20,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 000000008fa0e5f7
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = fffffffffffff4a4, Mem[0000000018800008] = ffeb970c
	stba	%l7,[%i1+%o6]0x80	! Mem[0000000018800008] = a4eb970c
p2_b41:
	bvc	p2_b42			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[00000000180000c8] = 944b8a32, %l5 = 32b11d52b200c000
	ldsh	[%i0+0x0ca],%l5		! %l5 = ffffffffffff8a32
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x02a,%g2
p2_b42:

p2_label_34:
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000120] = fc026d02 67857755 25a15ca3 48d9e16c
	prefetch [%i2+0x120],4
p2_b43:
	membar	#Sync			! Added by membar checker (412)
!	%f15 = 00000000, %f28 = 6b51f2be, %f3  = 10884754
	fadds	%f15,%f28,%f3 		! %f3  = 6b51f2be
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000108] = 44bfc8ee, %l0 = c19e4c3aedea0482
	lduh	[%i2+0x108],%l0		! Annulled
p2_b44:

p2_label_35:
	membar	#Sync			! Added by membar checker (413)
!	Mem[0000000018800008] = a4eb970c9049a34d, %l7 = fffffffffffff4a4
	ldxa	[%i1+%o6]0x80,%l7	! %l7 = a4eb970c9049a34d
	bg	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[00000000190000e0] = 1d941ae0 66457867 5adcb052 ac1c4bfc
	prefetch [%i2+0x0e0],23
p2_b45:
	membar	#Sync			! Added by membar checker (414)
!	%f29 = cb6e7e6c, %f31 = 5509fe7e, %f20 = 170ede4b c07cc140
	fsmuld	%f29,%f31,%f20		! %f20 = c42011d7 d3ac2500
!	Mem[0000000031000020] = 0036f13c, %l4 = ffffffffffff817f
	ldsb	[%o2+0x022],%l4		! %l4 = fffffffffffffff1

p2_label_36:
!	Mem[0000000018800120] = e09dab45 4a2d2c31 46b70e52 cf270518
	prefetcha [%i1+0x120]%asi,20
!	%f14 = c1d28000 00000000, %f26 = 39cc2fdf b6000000, %f22 = 140bde0b 08c65226
	fmuld	%f14,%f26,%f22		! %f22 = bbb04bad 55380000
!	Branch On Register, %l5 = ffffffffffff8a32
	brlez,pt %l5,p2_b46		! Branch Taken
!	Mem[0000000032000058] = 28a6997e, %l0 = c19e4c3aedea0482
	lduh	[%o4+0x058],%g2		! %g2 = 00000000000028a6
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x02e,%g2
p2_b46:
	membar	#Sync			! Added by membar checker (415)
!	%l5 = ffffffffffff8a32, immed = 000003a1, %y  = 00002fe8
	umulcc	%l5,0x3a1,%l6		! %l6 = 000003a0fe547f72, %ccr = 08

p2_label_37:
	bvs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l4 = fffffffffffffff1, Mem[0000000018000008] = 00007af1
	stba	%l4,[%i0+%o6]0x80	! Annulled
p2_b47:
	membar	#Sync			! Added by membar checker (416)
!	%f18 = 170ede4b 9ee48851, %f10 = 0e008775 0ed31bbc
	fnegd	%f18,%f10		! %f10 = 970ede4b 9ee48851
	fbul,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	 Annulled
	ldd	[%o2+0x068],%l4
p2_b48:

p2_label_38:
	membar	#Sync			! Added by membar checker (417)
!	Mem[0000000018000008] = 00007af1, %l6 = 000003a0fe547f72
	ldsba	[%i0+%o6]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000188000c4] = 19df5eaa, %l2 = 0000000000000000
	lduw	[%i1+0x0c4],%l2		! %l2 = 0000000019df5eaa
!	%l5 = ffffffffffff8a32, %l4 = fffffffffffffff1, %l5 = ffffffffffff8a32
	sub	%l5,%l4,%l5		! %l5 = ffffffffffff8a41
!	Mem[0000000030000024] = f09c6b1f, %l4 = fffffffffffffff1
	ldub	[%o0+0x024],%l4		! %l4 = 00000000000000f0
!	%l3 = 000000008fa0e5f7, immed = 0000092f, %y  = 000003a0
	smulcc	%l3,0x92f,%l1		! %l1 = fffffbf8069fe759, %ccr = 80

p2_label_39:
!	%l7 = a4eb970c9049a34d, %l0 = c19e4c3aedea0482, %l3 = 000000008fa0e5f7
	or	%l7,%l0,%l3		! %l3 = e5ffdf3efdeba7cf
	bgu,a	p2_b49			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000031800024] = 000000a3, %l6 = 0000000000000000
	lduh	[%o3+0x026],%l6		! %l6 = 00000000000000a3
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x031,%g2
p2_b49:
	membar	#Sync			! Added by membar checker (418)
!	%l7 = a4eb970c9049a34d, immed = fffffe5e, %y  = fffffbf8
	smulcc	%l7,-0x1a2,%l7		! %l7 = 000000b667c35c46, %ccr = 00
	bcc	p2_b50			! Branch Taken, %ccr = 00, CWP = 0

p2_label_40:
!	%l1 = fffffbf8069fe759, Mem[0000000019000008] = 481ebfbd4d6ba292
	stxa	%l1,[%i2+%o6]0x80	! Mem[0000000019000008] = fffffbf8069fe759
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x032,%g2
p2_b50:
	membar	#Sync			! Added by membar checker (419)
	fbug,a,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000018000000] = c19e4c3aedea0482, %l6 = 00000000000000a3
	ldxa	[%i0+%g0]0x80,%l6	! Annulled
p2_b51:
	membar	#Sync			! Added by membar checker (420)
!	Mem[0000000030800028] = ea82b7fe, %l1 = fffffbf8069fe759
	ldstub	[%o1+0x028],%l1		! %l1 = 00000000000000ea
!	%l3 = e5ffdf3efdeba7cf, immed = 00000009, %l4 = 00000000000000f0
	sra	%l3,0x009,%l4		! %l4 = fffffffffffef5d3

p2_label_41:
!	Mem[0000000018800000] = ff551e96, %l0 = c19e4c3aedea0482
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff551e96
!	%f18 = 170ede4b 9ee48851, %f18 = 170ede4b 9ee48851, %f24 = e6f6917b ff118194
	fdivd	%f18,%f18,%f24		! %f24 = 3ff00000 00000000
	bgu,a	p2_b52			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000003100002c] = 9875606e, %l0 = 00000000ff551e96
	ldub	[%o2+0x02e],%l0		! %l0 = 0000000000000060
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x034,%g2
p2_b52:
	membar	#Sync			! Added by membar checker (421)
!	%l2 = 0000000019df5eaa, %l7 = 000000b667c35c46, %l5 = ffffffffffff8a41
	add	%l2,%l7,%l5		! %l5 = 000000b681a2baf0

p2_label_42:
!	%l0 = 0000000000000060, immed = fffff6c9, %y  = 000000b6
	sdivx	%l0,-0x937,%l2		! %l2 = 0000000000000000
!	Mem[0000000030000068] = ffffe5c5 e04ffb20, %l4 = fffef5d3, %l5 = 81a2baf0
	ldd	[%o0+0x068],%l4		! %l4 = 00000000ffffe5c5 00000000e04ffb20
!	%f0  = 93fbde0b 08c65226, %f22 = bbb04bad 55380000
	fmovd	%f0 ,%f22		! %f22 = 93fbde0b 08c65226
!	%l3 = e5ffdf3efdeba7cf, %l0 = 0000000000000060, %l3 = e5ffdf3efdeba7cf
	sllx	%l3,%l0,%l3		! %l3 = fdeba7cf00000000
	bneg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00

p2_label_43:
!	Mem[00000000190001a0] = 472c3ce9 9cd72e02 a5f0abcb 1cb5ae5b
	prefetch [%i2+0x1a0],16	! Annulled
p2_b53:
	membar	#Sync			! Added by membar checker (422)
!	%l1 = 00000000000000ea, %l0 = 0000000000000060, %l7 = 000000b667c35c46
	sub	%l1,%l0,%l7		! %l7 = 000000000000008a
	set	p2_b54,%o7
	fba,pt	%fcc1,p2_near_3_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000019800030] = e9571d8f, %l2 = 0000000000000000
	lduh	[%i3+0x030],%l2		! %l2 = 000000000000e957
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x036,%g2
p2_b54:
!	Registers modified during the branch to p2_near_3
!	%l0  = ffffffffffffffff
!	%l4  = ffffffff818ebc3c
	membar	#Sync			! Added by membar checker (423)
!	%f30 = 52cb6f77 5509fe7e, %f14 = c1d28000 00000000
	fabsd	%f30,%f14		! %f14 = 52cb6f77 5509fe7e

p2_label_44:
!	%f0  = 93fbde0b, %f0  = 93fbde0b, %f5  = 08c65226
	fdivs	%f0 ,%f0 ,%f5 		! %f5  = 3f800000
	fblg,a,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l6 = 00000000000000a3, Mem[0000000040000038] = ff31240f
	sth	%l6,[%o5+0x038]		! Annulled
p2_b55:
	membar	#Sync			! Added by membar checker (424)
!	Mem[0000000019800100] = 29a2081a612aa01d, %l3 = fdeba7cf00000000
	ldxa	[%i3+0x100]%asi,%l3	! %l3 = 29a2081a612aa01d
!	Mem[0000000019800125] = ffc41cb8, %l2 = 000000000000e957
	ldstub	[%i3+0x125],%l2		! %l2 = 00000000000000c4

p2_label_45:
!	%l6 = 00000000000000a3, immed = 00000f0f, %y  = 000000b6
	udiv	%l6,0xf0f,%l3		! %l3 = 000000000c160c16
!	Mem[0000000019000000] = 89d92f9a e8c30e4f fffffbf8 069fe759
	prefetcha [%i2+0x000]%asi,2
!	%f22 = 93fbde0b 08c65226, %f22 = 93fbde0b 08c65226, %f24 = 3ff00000 00000000
	fsubd	%f22,%f22,%f24		! %f24 = 00000000 00000000
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000018800080] = 5f3ae261 c4c71214 8bac361d 11953042
	prefetch [%i1+0x080],3
p2_b56:

p2_label_46:
	membar	#Sync			! Added by membar checker (425)
!	%l0 = ffffffffffffffff, %l2 = 00000000000000c4, %y  = 000000b6
	sdiv	%l0,%l2,%l7		! %l7 = 000000007fffffff
!	%l3 = 000000000c160c16, Mem[0000000018000000] = c19e4c3a
	stw	%l3,[%i0+0x000]		! Mem[0000000018000000] = 0c160c16
!	%l1 = 00000000000000ea, immed = fffff1a1, %l6 = 00000000000000a3
	add	%l1,-0xe5f,%l6		! %l6 = fffffffffffff28b
!	%f22 = 93fbde0b 08c65226, %f8  = cb89fe7e c965d8a1
	fnegd	%f22,%f8 		! %f8  = 13fbde0b 08c65226
!	%l6 = fffffffffffff28b, immed = fffffc2a, %y  = 000000b6
	udivx	%l6,-0x3d6,%l6		! %l6 = 0000000000000000

p2_label_47:
!	%l0 = ffffffffffffffff, %l3 = 000000000c160c16, %y  = 000000b6
	udiv	%l0,%l3,%l1		! %l1 = 0000000000000f24
!	%l6 = 0000000000000000, immed = 00000838, %l3 = 000000000c160c16
	subc	%l6,0x838,%l3		! %l3 = fffffffffffff7c8
	bge	p2_b57			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000018800008] = a4eb970c, %l4 = ffffffff818ebc3c
	lduba	[%i1+%o6]0x80,%l4	! %l4 = 00000000000000a4
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x039,%g2
p2_b57:
	membar	#Sync			! Added by membar checker (426)
!	%l2 = 00000000000000c4, immed = fffffcaa, %y  = 000000b6
	udivcc	%l2,-0x356,%l6		! %l6 = 00000000000000b6, %ccr = 00

p2_label_48:
!	Mem[0000000018800000] = ff551e96, %l7 = 000000007fffffff
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = ffffffffff551e96
!	%f2  = a09afd44 6b51f2be, %f0  = 93fbde0b 08c65226
	fcmpd	%fcc2,%f2 ,%f0 		! %fcc2 = 1
!	Mem[00000000188000e0] = 0a664aca 31eab060 faac6756 85709e4e
	prefetcha [%i1+0x0e0]%asi,21
!	%l3 = fffffffffffff7c8, immed = 00000a36, %y  = 000000b6
	smulcc	%l3,0xa36,%l7		! %l7 = ffffffffffac1430, %ccr = 88
	set	p2_b58,%o7
	fbule,pt %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0

p2_label_49:
!	Mem[0000000018800050] = b487ca88 d2eb8352, %l0 = ffffffff, %l1 = 00000f24
	ldd	[%i1+0x050],%l0		! %l0 = 00000000b487ca88 00000000d2eb8352
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x03a,%g2
p2_b58:
!	Registers modified during the branch to p2_near_0
!	%l6  = 00000000d2eb7b1a
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018000180] = 12d473d5 39d9781d 9fa53b84 6ee1128e
	prefetch [%i0+0x180],1	! Annulled
p2_b59:
	membar	#Sync			! Added by membar checker (427)
!	%l6 = d2eb7b1a, %l7 = ffac1430, Mem[0000000019000000] = 89d92f9a e8c30e4f
	stda	%l6,[%i2+0x000]%asi	! Mem[0000000019000000] = d2eb7b1a ffac1430
	ba	p2_b60			! Branch Taken, %ccr = 88, CWP = 0

p2_label_50:
!	Mem[0000000018000000] = 0c160c16, %l4 = 00000000000000a4
	lduba	[%i0+%g0]0x80,%l4	! %l4 = 000000000000000c
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x03c,%g2
p2_b60:
	membar	#Sync			! Added by membar checker (428)
	nop
!	Mem[0000000018800000] = ff551e96, %l6 = 00000000d2eb7b1a
	ldsba	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffffff
	set	p2_b61,%o7
	fble,pn	%fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000032000040] = c78fef2b 03faa03f b4eadc8a 53902166
	prefetch [%o4+0x040],22
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x03d,%g2
p2_b61:
!	Registers modified during the branch to p2_near_2
!	%l0  = 00000001690f9510
!	%l1  = 0000000000000076
!	%l3  = ffffffffffffffe8
!	%l6  = fffffffffffffae1
!	%l7  = 0000000000000000

p2_label_51:
	membar	#Sync			! Added by membar checker (429)
!	%l2 = 00000000000000c4, immed = 00000f7c, %l5 = 00000000e04ffb20
	xnorcc	%l2,0xf7c,%l5		! %l5 = fffffffffffff047, %ccr = 88
	set	p2_b62,%o7
	fbule,a,pt %fcc1,p2_near_3_he	! Branch Taken, %fcc1 = 0
!	Mem[00000000188000a0] = 8bd850be, %l6 = fffffffffffffae1
	ldub	[%i1+0x0a3],%l6		! %l6 = 00000000000000be
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x03e,%g2
p2_b62:
!	Registers modified during the branch to p2_near_3
!	%l0  = ffffffffffffffff
!	%l4  = ffffffff818ebc3c
	fbne	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019800020] = db1c7c52 bfaffefd d5f11646 3ee8a0ac
	prefetch [%i3+0x020],4
p2_b63:

p2_label_52:
	fbul	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 818ebc3c, %l5 = fffff047, Mem[0000000019800008] = 00000000 0000ff55
	stda	%l4,[%i3+%o6]0x80	! Mem[0000000019800008] = 818ebc3c fffff047
p2_b64:
	membar	#Sync			! Added by membar checker (430)
!	%f18 = 170ede4b 9ee48851, %f28 = 6b51f2be cb6e7e6c
	fcmped	%fcc0,%f18,%f28		! %fcc0 = 1
!	Branch On Register, %l1 = 0000000000000076
	brlz,pt	%l1,p2_not_taken_0	! Branch Not Taken
!	Mem[000000001b000000] = 57ad8b4e, %l1 = 0000000000000076
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000057
p2_b65:

p2_label_53:
	membar	#Sync			! Added by membar checker (431)
!	Mem[0000000019800048] = 49c6c07a94af9529, %l2 = 00000000000000c4
	ldxa	[%i3+0x048]%asi,%l2	! %l2 = 49c6c07a94af9529
	bneg	p2_b66			! Branch Taken, %ccr = 88, CWP = 0
!	%l1 = 0000000000000057, Mem[0000000018000006] = edea0482
	sth	%l1,[%i0+0x006]		! Mem[0000000018000004] = edea0057
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x042,%g2
p2_b66:
	membar	#Sync			! Added by membar checker (432)
!	Mem[000000003200001c] = 776ec9b5, %l3 = ffffffffffffffe8
	ldsh	[%o4+0x01c],%g2		! %g2 = 000000000000776e
!	%f16 = a08ede4b 1e46fe0d, %f16 = a08ede4b 1e46fe0d, %f2  = a09afd44 6b51f2be
	fdivd	%f16,%f16,%f2 		! %f2  = 3ff00000 00000000

p2_label_54:
	set	p2_b67,%o7
	fble,pn	%fcc2,p2_near_0_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000019000008] = fffffbf8, %l1 = 0000000000000057
	ldsha	[%i2+%o6]0x80,%l1	! %l1 = ffffffffffffffff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x043,%g2
p2_b67:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000869
!	%l1  = ffffffffff82b7fe
!	%l3  = ffffffff818eb384
!	%l7  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (433)
!	%l0 = 0000000000000869, %l5 = fffffffffffff047, %l0 = 0000000000000869
	xnorcc	%l0,%l5,%l0		! %l0 = 00000000000007d1, %ccr = 00
!	%f2  = 3ff00000 00000000, %f8  = 13fbde0b
	fdtoi	%f2 ,%f8 		! %f8  = 00000001
!	Branch On Register, %l3 = ffffffff818eb384
	brz,pn	%l3,p2_not_taken_0	! Branch Not Taken

p2_label_55:
!	%l0 = 00000000000007d1, Mem[0000000031000068] = 934a3c463bfa8c7e
	stx	%l0,[%o2+0x068]		! Mem[0000000031000068] = 00000000000007d1
p2_b68:
	membar	#Sync			! Added by membar checker (434)
!	%l3 = ffffffff818eb384, %l3 = ffffffff818eb384, %l4 = ffffffff818ebc3c
	andncc	%l3,%l3,%l4		! %l4 = 0000000000000000, %ccr = 44
!	%l4 = 0000000000000000, immed = fffffbb2, %l2 = 49c6c07a94af9529
	addcc	%l4,-0x44e,%l2		! %l2 = fffffffffffffbb2, %ccr = 88
!	Mem[0000000019800000] = 00a3042c, %l4 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000a3042c
!	Mem[00000000190001ec] = d971f5db, %l4 = 0000000000a3042c
	ldsha	[%i2+0x1ec]%asi,%l4	! %l4 = ffffffffffffd971

p2_label_56:
!	Mem[0000000032000040] = c78fef2b 03faa03f b4eadc8a 53902166
	prefetcha [%o4+0x040]%asi,0
!	Mem[0000000018000008] = 00007af1, %l7 = 00000000ffffffff
	lduha	[%i0+%o6]0x80,%l7	! %l7 = 0000000000000000
	fbl,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l5 = fffffffffffff047, Mem[0000000018800008] = a4eb970c9049a34d
	stxa	%l5,[%i1+%o6]0x80	! Mem[0000000018800008] = fffffffffffff047
p2_b69:
	membar	#Sync			! Added by membar checker (435)
!	%l5 = fffffffffffff047
	setx	0x807b0084807b0084,%g7,%l5 ! %l5 = 807b0084807b0084

p2_label_57:
!	%f4  = 940bde0b 3f800000, %f24 = 00000000 00000000, %f14 = 52cb6f77 5509fe7e
	fsubd	%f4 ,%f24,%f14		! %f14 = 940bde0b 3f800000
	set	p2_b70,%o7
	fble	p2_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000019000040] = 638a60db 73da93db c21f707e d37d7c32
	prefetch [%i2+0x040],16
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x046,%g2
p2_b70:
!	Registers modified during the branch to p2_far_0
!	%l4  = 000000000000000f
!	%l7  = ffffffff818ebc9f
	membar	#Sync			! Added by membar checker (436)
!	Mem[0000000032000024] = 861878d1, %l0 = 00000000000007d1
	ldswa	[%o4+0x024]%asi,%g2	! %g2 = 00000000000007d1
	fbug,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0

p2_label_58:
!	Mem[0000000032000010] = 852cb3e2c2eec50c, %l4 = 000000000000000f
	ldx	[%o4+0x010],%g2		! %g2 = 852cb3e2c2eec50c
p2_b71:
	membar	#Sync			! Added by membar checker (437)
	set	p2_b72,%o7
	fble,a,pt %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000031800020] = 00000000, %l4 = 000000000000000f
	ldsb	[%o3+0x021],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x048,%g2
p2_b72:
!	Registers modified during the branch to p2_near_0
!	%l6  = ffffffff81116b82
	membar	#Sync			! Added by membar checker (438)
!	%l4 = 0000000000000000, %l0 = 00000000000007d1, %l0 = 00000000000007d1
	sub	%l4,%l0,%l0		! %l0 = fffffffffffff82f
	set	p2_b73,%o7
	fbo,a,pt %fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 0

p2_label_59:
!	%l5 = 807b0084807b0084, Mem[0000000019000008] = fffffbf8
	stha	%l5,[%i2+%o6]0x80	! Mem[0000000019000008] = 0084fbf8
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x049,%g2
p2_b73:
!	Registers modified during the branch to p2_near_0
!	%l6  = ffffffff81116b82
	membar	#Sync			! Added by membar checker (439)
!	%l7 = ffffffff818ebc9f, %l3 = ffffffff818eb384, %l7 = ffffffff818ebc9f
	sub	%l7,%l3,%l7		! %l7 = 000000000000091b
!	%l2 = fffffbb2, %l3 = 818eb384, Mem[0000000019000130] = d03822b1 f0748502
	std	%l2,[%i2+0x130]	! Mem[0000000019000130] = fffffbb2 818eb384
!	Mem[0000000018800180] = 659ae390 7c0b0147 aaf4a4c2 9fa6410e
	prefetcha [%i1+0x180]%asi,20
!	Branch On Register, %l4 = 0000000000000000
	brgez,a,pt %l4,p2_b74		! Branch Taken

p2_label_60:
!	%l7 = 000000000000091b, Mem[000000003180002a] = d5aa6fd5
	sth	%l7,[%o3+0x02a]		! Mem[0000000031800028] = d5aa091b
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x04a,%g2
p2_b74:
	membar	#Sync			! Added by membar checker (440)
	set	p2_b75,%o7
	fble,a,pt %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[00000000180000e8] = 20edb629, %l4 = 0000000000000000
	lduw	[%i0+0x0e8],%l4		! %l4 = 0000000020edb629
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x04b,%g2
p2_b75:
!	Registers modified during the branch to p2_near_0
!	%l6  = ffffffff81116b82
	membar	#Sync			! Added by membar checker (441)
!	Mem[0000000019800080] = e1edb0cc 0c700251 2a23f03b 665229bc
	prefetch [%i3+0x080],21
!	Branch On Register, %l3 = ffffffff818eb384
	brgez,a,pn %l3,p2_not_taken_0	! Branch Not Taken

p2_label_61:
!	Mem[0000000030000068] = ffffe5c5, %l2 = fffffffffffffbb2
	swap	[%o0+0x068],%l2		! Annulled
p2_b76:
	membar	#Sync			! Added by membar checker (442)
!	%l5 = 807b0084807b0084, immed = fffffb78, %y  = ffffffff
	mulx	%l5,-0x488,%l7		! %l7 = d2a5a799d2a5a9e0
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	%l4 = 20edb629, %l5 = 807b0084, Mem[0000000030800060] = 27f7110e ebd399f4
	std	%l4,[%o1+0x060]	! Mem[0000000030800060] = 20edb629 807b0084
!	Registers modified during the branch to p2_jmpl_3
!	%l1  = 00000000ffffffff
!	%l2  = 6f95f13c0000098d
!	%l4  = 0000000000000409
!	%l0 = fffffffffffff82f, immed = 00000002, %l0 = fffffffffffff82f
	srax	%l0,0x002,%l0		! %l0 = fffffffffffffe0b

p2_label_62:
!	%l4 = 00000409, %l5 = 807b0084, Mem[0000000018800158] = 47c4c05e b7f13bd3
	stda	%l4,[%i1+0x158]%asi	! Mem[0000000018800158] = 00000409 807b0084
!	Mem[0000000031000060] = fae110ef, %l1 = 00000000ffffffff
	ldswa	[%o2+0x060]%asi,%l1	! %l1 = fffffffffae110ef
	set	p2_b77,%o7
	fbuge,a,pn %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000019000090] = 807f24a8 36f94972, %l4 = 00000409, %l5 = 807b0084
	ldd	[%i2+0x090],%l4		! %l4 = 00000000807f24a8 0000000036f94972
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x04d,%g2
p2_b77:
!	Registers modified during the branch to p2_near_0
!	%l6  = ffffffff7c6fc473
	membar	#Sync			! Added by membar checker (443)
!	Mem[0000000031800024] = 000000a3, %l2 = 6f95f13c0000098d
	ldsh	[%o3+0x024],%l2		! %l2 = 0000000000000000

p2_label_63:
!	Mem[00000000190000c0] = a68f9482 d3b29b7b be5c6620 c1043392
	prefetch [%i2+0x0c0],4
!	Mem[0000000018800008] = ffffffff, %l7 = d2a5a799d2a5a9e0
	lduwa	[%i1+%o6]0x80,%l7	! %l7 = 00000000ffffffff
!	%l6 = 7c6fc473, %l7 = ffffffff, Mem[0000000019000008] = 0084fbf8 069fe759
	stda	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = 7c6fc473 ffffffff
!	%l3 = ffffffff818eb384, immed = 00000a5f, %y  = ffffffff
	smul	%l3,0xa5f,%l1		! %l1 = fffffae0a6f7c5fc
!	%l2 = 0000000000000000, immed = fffff801, %l6 = ffffffff7c6fc473
	xor	%l2,-0x7ff,%l6		! %l6 = fffffffffffff801

p2_label_64:
!	%l5 = 0000000036f94972, immed = 00000002, %l0 = fffffffffffffe0b
	srax	%l5,0x002,%l0		! %l0 = 000000000dbe525c
!	%l2 = 00000000, %l3 = 818eb384, Mem[0000000030800028] = ff82b7fe 95e2b048
	stda	%l2,[%o1+0x028]%asi	! Mem[0000000030800028] = 00000000 818eb384
!	Mem[0000000019000008] = 7c6fc473ffffffff, %l0 = 000000000dbe525c
	ldxa	[%i2+%o6]0x80,%l0	! %l0 = 7c6fc473ffffffff
!	%l1 = fffffae0a6f7c5fc, Mem[000000001a000072] = 26618c25
	stha	%l1,[%i4+0x072]%asi	! Mem[000000001a000070] = 2661c5fc
!	Mem[00000000188000c0] = b5ea15b1, %l6 = fffffffffffff801
	lduh	[%i1+0x0c2],%l6		! %l6 = 00000000000015b1

p2_label_65:
!	%l6 = 00000000000015b1, immed = fffff90a, %y  = fffffae0
	udivx	%l6,-0x6f6,%l3		! %l3 = 0000000000000000
	fbe,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003080006c] = 818ebc3c, %l1 = fffffae0a6f7c5fc
	ldub	[%o1+0x06f],%l1		! Annulled
p2_b78:
	membar	#Sync			! Added by membar checker (444)
!	%l5 = 0000000036f94972, %l0 = 7c6fc473ffffffff, %l5 = 0000000036f94972
	orn	%l5,%l0,%l5		! %l5 = 83903b8c36f94972
!	%l0 = 7c6fc473ffffffff, Mem[0000000018800000] = ff551e96000000a3
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000018800000] = 7c6fc473ffffffff

p2_label_66:
!	Mem[0000000019800048] = 49c6c07a, %l2 = 0000000000000000
	swap	[%i3+0x048],%l2		! %l2 = 0000000049c6c07a
!	%f15 = 3f800000, %f18 = 170ede4b
	fstoi	%f15,%f18		! %f18 = 00000001
	set	p2_b79,%o7
	fbuge,pn %fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 0
!	Mem[000000001a800024] = a2d7df3d, %l3 = 0000000000000000
	ldsb	[%i5+0x025],%l3		! %l3 = ffffffffffffffd7
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x04f,%g2
p2_b79:
!	Registers modified during the branch to p2_near_2
!	%l0  = f8df88e7fffffffe
!	%l1  = 0000000000000076
!	%l3  = fffffffffffffff7
!	%l6  = fffffffffffffae1
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (445)
!	%l6 = fffffffffffffae1, immed = 00000006, %l6 = fffffffffffffae1
	taddcc	%l6,0x006,%l6		! %l6 = fffffffffffffae7, %ccr = 8a

p2_label_67:
!	%f15 = 3f800000, %f0  = 93fbde0b
	fstoi	%f15,%f0 		! %f0  = 00000001
!	Mem[0000000018000008] = 00007af1fffff4a4, %l1 = 0000000000000076
	ldxa	[%i0+%o6]0x80,%l1	! %l1 = 00007af1fffff4a4
	set	p2_b80,%o7
	fbule,a	p2_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000031000060] = fae110ef, %l4 = 00000000807f24a8
	ldsh	[%o2+0x060],%l4		! %l4 = fffffffffffffae1
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x050,%g2
p2_b80:
!	Registers modified during the branch to p2_far_2
!	%l4  = ffffffffffffe5c5
!	%l7  = 00000000000000cd
	membar	#Sync			! Added by membar checker (446)
!	Mem[0000000018000008] = 00007af1, %l5 = 83903b8c36f94972
	lduba	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000

p2_label_68:
	set	p2_b81,%o7
	fba	p2_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[00000000188001c0] = 8a2ec91d 22cc2962 13b436f1 c193071f
	prefetch [%i1+0x1c0],16
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x051,%g2
p2_b81:
!	Registers modified during the branch to p2_far_2
!	%l2  = fffffffffff1bf11
	membar	#Sync			! Added by membar checker (447)
!	%l2 = fffffffffff1bf11, %l7 = 00000000000000cd, %l5 = 0000000000000000
	sub	%l2,%l7,%l5		! %l5 = fffffffffff1be44
	fbge	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019000140] = dfbc038e 6fedf443 220e699b 29d778e0
	prefetch [%i2+0x140],1
p2_b82:

p2_label_69:
	membar	#Sync			! Added by membar checker (448)
	fbn,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000019000020] = c3da9098 ab728bcb fd62e62e eb6c8824
	prefetch [%i2+0x020],22
p2_b83:
	membar	#Sync			! Added by membar checker (449)
!	%l5 = fffffffffff1be44, %l3 = fffffffffffffff7, %l4 = ffffffffffffe5c5
	xnorcc	%l5,%l3,%l4		! %l4 = fffffffffff1be4c, %ccr = 88
!	Mem[00000000198001c0] = 999e6b21 821cfe74 d8463ed4 8c79b395
	prefetch [%i3+0x1c0],0
!	%f9  = 08c65226, %f24 = 00000000
	fcmps	%fcc1,%f9 ,%f24		! %fcc1 = 2

p2_label_70:
!	%l6 = fffffffffffffae7, %l0 = f8df88e7fffffffe, %y  = fffffae0
	mulx	%l6,%l0,%l5		! %l5 = 547f195800000a32
!	%l4 = fff1be4c, %l5 = 00000a32, Mem[0000000032000058] = 28a6997e 1d581228
	stda	%l4,[%o4+0x058]%asi	! Mem[0000000032000058] = fff1be4c 00000a32
!	Mem[0000000019800010] = 4d84fa3b4a365c14, %l5 = 547f195800000a32
	ldxa	[%i3+0x010]%asi,%l5	! %l5 = 4d84fa3b4a365c14
	set	p2_b84,%o7
	fbg,pt	%fcc1,p2_near_3_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001b000020] = 0501d1df c9f30cca 3fdae4f9 742acabc
	prefetch [%i6+0x020],22
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x054,%g2
p2_b84:
!	Registers modified during the branch to p2_near_3
!	%l0  = ffffffffffffffff
!	%l4  = ffffffff818ebc3c

p2_label_71:
	membar	#Sync			! Added by membar checker (450)
	set	p2_b85,%o7
	fbule,pt %fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 1
!	%l4 = ffffffff818ebc3c, Mem[000000001880004c] = 60633ac2
	stw	%l4,[%i1+0x04c]		! Mem[000000001880004c] = 818ebc3c
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x055,%g2
p2_b85:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0007ffffffffff8d
!	%l1  = 00007af1fffff0a0
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (451)
!	Mem[0000000018000008] = 00007af1, %l3 = fffffffffffffff7
	lduwa	[%i0+%o6]0x80,%l3	! %l3 = 0000000000007af1
!	%l3 = 0000000000007af1
	setx	0x4b6130e54b6130e5,%g7,%l3 ! %l3 = 4b6130e54b6130e5
	ba	p2_b86			! Branch Taken, %ccr = 88, CWP = 0

p2_label_72:
!	%l4 = ffffffff818ebc3c, Mem[0000000032000047] = 3fb4eadc
	stb	%l4,[%o4+0x047]		! Mem[0000000032000044] = 3cb4eadc
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x056,%g2
p2_b86:
	bneg,a	p2_b87			! Branch Taken, %ccr = 88, CWP = 0
!	%l3 = 4b6130e54b6130e5, Mem[0000000018000000] = 0c160c16
	stwa	%l3,[%i0+%g0]0x80	! Mem[0000000018000000] = 4b6130e5
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x057,%g2
p2_b87:
	membar	#Sync			! Added by membar checker (452)
!	Mem[0000000018800158] = 00000409 807b0084, %l4 = 818ebc3c, %l5 = 4a365c14
	ldd	[%i1+0x158],%l4		! %l4 = 0000000000000409 00000000807b0084
!	%f24 = 00000000, %f18 = 00000001
	fabss	%f24,%f18		! %f18 = 00000000

p2_label_73:
!	%l0 = 0007ffffffffff8d
	sethi	%hi(0x1ea36c00),%l0	! %l0 = 000000001ea36c00
!	%l5 = 00000000807b0084, Mem[000000001980011e] = 87516832
	stb	%l5,[%i3+0x11e]		! Mem[000000001980011c] = 87518432
	bvc,a	p2_b88			! Branch Taken, %ccr = 88, CWP = 0
!	%l4 = 0000000000000409, Mem[0000000031000020] = 00007af1
	sth	%l4,[%o2+0x020]		! Mem[0000000031000020] = 04097af1
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x058,%g2
p2_b88:
	membar	#Sync			! Added by membar checker (453)
!	Mem[000000003200005c] = 0a320818, %l4 = 0000000000000409
	lduha	[%o4+0x05e]%asi,%g2	! %g2 = 0000000000000a32

p2_label_74:
	set	p2_b89,%o7
	fblg,a	p2_far_2_le	! Branch Taken, %fcc0 = 1
!	%l6 = fffffae7, %l7 = 000000cd, Mem[00000000190000a8] = c5a699f8 99214275
	std	%l6,[%i2+0x0a8]	! Mem[00000000190000a8] = fffffae7 000000cd
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x059,%g2
p2_b89:
!	Registers modified during the branch to p2_far_2
!	%l4  = ffffffffffffe5c5
!	%l7  = 00000000000000ff
	membar	#Sync			! Added by membar checker (454)
!	%l7 = 00000000000000ff, immed = 00000a93, %l1 = 00007af1fffff0a0
	add	%l7,0xa93,%l1		! %l1 = 0000000000000b92
!	Branch On Register, %l1 = 0000000000000b92
	brlez,a,pn %l1,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000031800060] = b604127d, %l5 = 00000000807b0084
	ldsb	[%o3+0x061],%l5		! Annulled
p2_b90:

p2_label_75:
	membar	#Sync			! Added by membar checker (455)
!	Mem[00000000198000a1] = bfec7b4a, %l1 = 0000000000000b92
	ldstub	[%i3+0x0a1],%l1		! %l1 = 00000000000000ec
!	%l3 = 4b6130e54b6130e5
	setx	0x9622347196223471,%g7,%l3 ! %l3 = 9622347196223471
!	%l7 = 00000000000000ff, Mem[00000000180001c9] = 213e33dd
	stb	%l7,[%i0+0x1c9]		! Mem[00000000180001c8] = 21ff33dd
!	%l2 = 0000000000000000, Mem[0000000018000008] = 00007af1
	stha	%l2,[%i0+%o6]0x80	! Mem[0000000018000008] = 00007af1
!	Mem[0000000031800068] = 6f28429f, %l6 = fffffffffffffae7
	swap	[%o3+0x068],%l6		! %l6 = 000000006f28429f

p2_label_76:
	fbule,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000019000000] = d2eb7b1a, %l5 = 00000000807b0084
	lduba	[%i2+%g0]0x80,%l5	! Annulled
p2_b91:
	membar	#Sync			! Added by membar checker (456)
!	%l7 = 00000000000000ff, Mem[00000000188000c0] = b5ea15b119df5eaa
	stxa	%l7,[%i1+0x0c0]%asi	! Mem[00000000188000c0] = 00000000000000ff
!	Mem[0000000030800068] = bfb6f6dc, %l1 = 00000000000000ec
	lduh	[%o1+0x068],%l1		! %l1 = 000000000000bfb6
!	Mem[000000001b0000e0] = 2bd8e1fd cd7acd8b 16ef3626 2b97ee49
	prefetcha [%i6+0x0e0]%asi,16

p2_label_77:
!	%l4 = ffffffffffffe5c5, %l0 = 000000001ea36c00, %y  = fffffae0
	smulcc	%l4,%l0,%l3		! %l3 = fffffcdc575e1c00, %ccr = 80
	bleu	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[000000003200003c] = 8e654ab1, %l7 = 00000000000000ff
	lduh	[%o4+0x03c],%g2		! %g2 = 0000000000008e65
p2_b92:
	membar	#Sync			! Added by membar checker (457)
!	%l3 = fffffcdc575e1c00, %l0 = 000000001ea36c00, %l0 = 000000001ea36c00
	addc	%l3,%l0,%l0		! %l0 = fffffcdc76018800
	bpos,a	p2_b93			! Branch Taken, %ccr = 80, CWP = 0

p2_label_78:
!	%l3 = fffffcdc575e1c00, Mem[0000000018000160] = 3d257678
	sth	%l3,[%i0+0x160]		! Mem[0000000018000160] = 1c007678
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x05d,%g2
p2_b93:
	membar	#Sync			! Added by membar checker (458)
!	Mem[000000003180006c] = 274d0f5e, %l7 = 00000000000000ff
	lduwa	[%o3+0x06c]%asi,%l7	! %l7 = 00000000274d0f5e
!	%l6 = 000000006f28429f
	sethi	%hi(0x3c24d000),%l6	! %l6 = 000000003c24d000
!	Mem[0000000030000020] = 00000048, %l2 = 0000000000000000
	lduwa	[%o0+0x020]%asi,%l2	! %l2 = 0000000000000048
!	%f2  = 3ff00000, %f21 = d3ac2500
	fcmps	%fcc0,%f2 ,%f21		! %fcc0 = 2

p2_label_79:
	nop				! Delay added due to fcmp
	fbu,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018000000] = 4b6130e5, %l2 = 0000000000000048
	lduba	[%i0+%g0]0x80,%l2	! Annulled
p2_b94:
	membar	#Sync			! Added by membar checker (459)
!	%l2 = 0000000000000048, %l1 = 000000000000bfb6, %l6 = 000000003c24d000
	addccc	%l2,%l1,%l6		! %l6 = 000000000000bffe, %ccr = 00
!	Branch On Register, %l0 = fffffcdc76018800
	brgez,pt %l0,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019800000] = 00a3042c, %l7 = 00000000274d0f5e
	lduwa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000a3042c
p2_b95:

p2_label_80:
	membar	#Sync			! Added by membar checker (460)
!	Mem[0000000019800008] = 818ebc3cfffff047, %l3 = fffffcdc575e1c00
	ldxa	[%i3+%o6]0x80,%l3	! %l3 = 818ebc3cfffff047
	bneg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001900016c] = 424a634d, %l7 = 0000000000a3042c
	swap	[%i2+0x16c],%l7		! Annulled
p2_b96:
	bcc	p2_b97			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000188000a8] = dad28fa6, %l0 = fffffcdc76018800
	lduh	[%i1+0x0a8],%l0		! %l0 = 000000000000dad2
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x061,%g2
p2_b97:

p2_label_81:
	membar	#Sync			! Added by membar checker (461)
	fble,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000018000000] = 4b6130e5, %l0 = 000000000000dad2
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = 000000004b6130e5
p2_b98:
	membar	#Sync			! Added by membar checker (462)
!	%f24 = 00000000 00000000, %f10 = 970ede4b 9ee48851
	fxtod	%f24,%f10		! %f10 = 00000000 00000000
!	Branch On Register, %l0 = 000000004b6130e5
	brz,pn	%l0,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],20
p2_b99:

p2_label_82:
	be	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031800064] = 0dc3ce87, %l6 = 000000000000bffe
	lduw	[%o3+0x064],%l6		! %l6 = 000000000dc3ce87
p2_b100:
	membar	#Sync			! Added by membar checker (463)
!	%f31 = 5509fe7e, %f24 = 00000000, %f29 = cb6e7e6c
	fadds	%f31,%f24,%f29		! %f29 = 5509fe7e
!	%l4 = ffffffffffffe5c5, immed = fffff5b0, %y  = fffffcdc
	umulcc	%l4,-0xa50,%l7		! %l7 = ffffdb75010e8070, %ccr = 80
!	%l4 = ffffffffffffe5c5, immed = 0000049f, %l5 = 00000000807b0084
	sub	%l4,0x49f,%l5		! %l5 = ffffffffffffe126

p2_label_83:
!	%f10 = 00000000, %f25 = 00000000, %f25 = 00000000
	fadds	%f10,%f25,%f25		! %f25 = 00000000
!	%l3 = 818ebc3cfffff047, Mem[0000000031000064] = 23597606
	stwa	%l3,[%o2+0x064]%asi	! Mem[0000000031000064] = fffff047
!	Mem[0000000031800020] = 00000000, %l3 = 818ebc3cfffff047
	lduwa	[%o3+0x020]%asi,%l3	! %l3 = 0000000000000000
!	%f24 = 00000000 00000000, %f2  = 3ff00000 00000000
	fdtox	%f24,%f2 		! %f2  = 00000000 00000000
!	Mem[0000000040000038] = ff31240f, %l6 = 000000000dc3ce87
	swapa	[%o5+0x038]%asi,%l6	! %l6 = 00000000ff31240f

p2_label_84:
!	Mem[0000000018800000] = 7c6fc473, %l0 = 000000004b6130e5
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = 000000007c6fc473
!	%l4 = ffffffffffffe5c5, immed = 0000002a, %l5 = ffffffffffffe126
	srax	%l4,0x02a,%l5		! %l5 = ffffffffffffffff
!	%l1 = 000000000000bfb6, %l2 = 0000000000000048, %l3 = 0000000000000000
	and	%l1,%l2,%l3		! %l3 = 0000000000000000
!	%l0 = 000000007c6fc473, immed = 00000155, %l5 = ffffffffffffffff
	or	%l0,0x155,%l5		! %l5 = 000000007c6fc577
!	Denormal Floating Point Operation Nullified
	nop

p2_label_85:
!	Mem[0000000018800000] = 7c6fc473, %l7 = ffffdb75010e8070
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000007c6f
!	%f24 = 00000000 00000000, %f28 = 6b51f2be
	fxtos	%f24,%f28		! %f28 = 00000000
!	%l3 = 0000000000000000, Mem[0000000030800020] = 8fa0e5f7
	stwa	%l3,[%o1+0x020]%asi	! Mem[0000000030800020] = 00000000
	bge	p2_b101			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],16
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x065,%g2
p2_b101:

p2_label_86:
	membar	#Sync			! Added by membar checker (464)
!	Mem[00000000180000f8] = 2fb258e1, %l3 = 0000000000000000
	swap	[%i0+0x0f8],%l3		! %l3 = 000000002fb258e1
!	Mem[0000000018000091] = 61bf7525, %l1 = 000000000000bfb6
	ldstuba	[%i0+0x091]%asi,%l1	! %l1 = 00000000000000bf
!	%f29 = 5509fe7e, %f7  = 7c07a3f7
	fcmps	%fcc1,%f29,%f7 		! %fcc1 = 1
!	Mem[0000000018800018] = 71d98208, %l6 = 00000000ff31240f
	lduw	[%i1+0x018],%l6		! %l6 = 0000000071d98208
!	Mem[000000001980012c] = f68cfa03, %l7 = 0000000000007c6f
	swap	[%i3+0x12c],%l7		! %l7 = 00000000f68cfa03

p2_label_87:
!	%l4 = ffffffffffffe5c5, %l4 = ffffffffffffe5c5, %y  = ffffdb75
	smul	%l4,%l4,%l4		! %l4 = 0000000002b00999
	set	p2_b102,%o7
	fbg,a	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	%l0 = 000000007c6fc473, Mem[0000000018000000] = 4b6130e5
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000018000000] = 7c6fc473
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x066,%g2
p2_b102:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000f8df88
!	%l7  = 000000002fb261fc
	membar	#Sync			! Added by membar checker (465)
!	%f7  = 7c07a3f7, %f25 = 00000000, %f6  = e77a8b81
	fmuls	%f7 ,%f25,%f6 		! %f6  = 00000000
	set	p2_b103,%o7
	fbug,a	p2_far_2_he	! Branch Taken, %fcc0 = 2

p2_label_88:
!	%l0 = 000000007c6fc473, Mem[00000000190001f7] = b8f8a363
	stb	%l0,[%i2+0x1f7]		! Mem[00000000190001f4] = b8f8a373
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x067,%g2
p2_b103:
!	Registers modified during the branch to p2_far_2
!	%l2  = 00000000007c6fc4
	bpos,a	p2_b104			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000198001c0] = 999e6b21 821cfe74 d8463ed4 8c79b395
	prefetch [%i3+0x1c0],3
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x068,%g2
p2_b104:
	membar	#Sync			! Added by membar checker (466)
!	Mem[000000003180006e] = 274d0f5e, %l6 = 0000000071d98208
	ldstuba	[%o3+0x06e]%asi,%l6	! %l6 = 000000000000000f
!	%l2 = 00000000007c6fc4, immed = fffffa2b, %y  = 00000000
	smul	%l2,-0x5d5,%l6		! %l6 = fffffffd2a482dec

p2_label_89:
!	Branch On Register, %l4 = 0000000000f8df88
	brgz,a,pn %l4,p2_b105		! Branch Taken
!	Mem[0000000019800008] = 818ebc3c, %l3 = 000000002fb258e1
	lduha	[%i3+%o6]0x80,%l3	! %l3 = 000000000000818e
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x069,%g2
p2_b105:
	membar	#Sync			! Added by membar checker (467)
!	Denormal Floating Point Operation Nullified
	nop
	set	p2_b106,%o7
	fble,a,pt %fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 0
!	%l3 = 000000000000818e, Mem[0000000040000038] = 0dc3ce87
	stw	%l3,[%o5+0x038]		! Mem[0000000040000038] = 0000818e
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x06a,%g2
p2_b106:
!	Registers modified during the branch to p2_near_3
!	%l1  = 0000000000000000
!	%l4  = 000000000000004f
!	%l5  = 0000000000000000

p2_label_90:
	membar	#Sync			! Added by membar checker (468)
!	%l4 = 000000000000004f, %l6 = fffffffd2a482dec, %l3 = 000000000000818e
	tsubcc	%l4,%l6,%l3		! %l3 = 00000002d5b7d263, %ccr = 1b
!	Mem[0000000032000024] = 861878d1, %l6 = fffffffd2a482dec
	ldsw	[%o4+0x024],%g2		! %g2 = fffffffd2a482dec
!	%l2 = 00000000007c6fc4, %l3 = 00000002d5b7d263, %l7 = 000000002fb261fc
	orn	%l2,%l3,%l7		! %l7 = fffffffd2a7c6fdc
!	Mem[0000000018000000] = 7c6fc473, %l7 = fffffffd2a7c6fdc
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = 000000007c6fc473
	bcs,a	p2_b107			! Branch Taken, %ccr = 1b, CWP = 0

p2_label_91:
!	%l5 = 0000000000000000, Mem[0000000018800008] = ffffffff
	stba	%l5,[%i1+%o6]0x80	! Mem[0000000018800008] = 00ffffff
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x06b,%g2
p2_b107:
	membar	#Sync			! Added by membar checker (469)
!	%f2  = 00000000 00000000, %f5  = 3f800000
	fdtos	%f2 ,%f5 		! %f5  = 00000000
!	Mem[0000000019800000] = 00a3042c, %l3 = 00000002d5b7d263
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000018800054] = d2eb8352, %l0 = 000000007c6fc473
	swap	[%i1+0x054],%l0		! %l0 = 00000000d2eb8352
!	Mem[0000000030000068] = ffffe5c5, %l4 = 000000000000004f
	lduw	[%o0+0x068],%l4		! %l4 = 00000000ffffe5c5

p2_label_92:
!	%f24 = 00000000 00000000, %f30 = 52cb6f77 5509fe7e, %f26 = 39cc2fdf b6000000
	fmuld	%f24,%f30,%f26		! %f26 = 00000000 00000000
	bge	p2_b108			! Branch Taken, %ccr = 1b, CWP = 0
!	Mem[00000000190000c4] = d3b29b7b, %l1 = 0000000000000000
	ldub	[%i2+0x0c5],%l1		! %l1 = 00000000000000b2
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x06c,%g2
p2_b108:
	bvc	p2_not_taken_0		! Branch Not Taken, %ccr = 1b
!	Mem[0000000019000000] = d2eb7b1a, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = ffffffffd2eb7b1a
p2_b109:

p2_label_93:
	membar	#Sync			! Added by membar checker (470)
!	Denormal Floating Point Operation Nullified
	nop
!	%f2  = 00000000 00000000, %f25 = 00000000
	fxtos	%f2 ,%f25		! %f25 = 00000000
	set	p2_b110,%o7
	fbne,a	p2_far_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031800060] = b604127d0dc3ce87, %l0 = 00000000d2eb8352
	ldx	[%o3+0x060],%l0		! %l0 = b604127d0dc3ce87
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x06e,%g2
p2_b110:
!	Registers modified during the branch to p2_far_1
!	%l3  = ffffffffffffffec
!	%l4  = 0000000000000000
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (471)
!	%l0 = b604127d0dc3ce87, %l0 = b604127d0dc3ce87, %l0 = b604127d0dc3ce87
	addccc	%l0,%l0,%l0		! %l0 = 6c0824fa1b879d0e, %ccr = 30

p2_label_94:
!	Denormal Floating Point Operation Nullified
	nop
!	%l4 = 0000000000000000, immed = 00000025, %l6 = fffffffd2a482dec
	srlx	%l4,0x025,%l6		! %l6 = 0000000000000000
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i0+%o6]0x80,%l2
p2_b111:
	membar	#Sync			! Added by membar checker (472)
!	%f20 = c42011d7 d3ac2500, %f24 = 00000000 00000000
	fcmped	%fcc3,%f20,%f24		! %fcc3 = 1

p2_label_95:
!	Mem[0000000018000000] = 7c6fc473 edea0057, %l2 = 007c6fc4, %l3 = ffffffec
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 000000007c6fc473 00000000edea0057
!	Mem[000000001a800040] = 842790d7 949a3582 25e6e3d5 5718168f
	prefetch [%i5+0x040],4
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000031000064] = fffff047, %l6 = 0000000000000000
	ldsw	[%o2+0x064],%l6		! Annulled
p2_b112:
	membar	#Sync			! Added by membar checker (473)
	fbe,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_96:
!	%l7 = 0000000000000000, Mem[0000000019800008] = 818ebc3c
	stwa	%l7,[%i3+%o6]0x80	! Annulled
p2_b113:
	membar	#Sync			! Added by membar checker (474)
!	%l7 = 0000000000000000, immed = 00000807, %l2 = 000000007c6fc473
	or	%l7,0x807,%l2		! %l2 = 0000000000000807
	fble,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l4 = 0000000000000000, Mem[000000001980018a] = 9ca7bab2
	sth	%l4,[%i3+0x18a]		! Annulled
p2_b114:
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_97:
!	Mem[0000000018800000] = 7c6fc473ffffffff, %l6 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l6	! Annulled
p2_b115:
	membar	#Sync			! Added by membar checker (475)
!	Branch On Register, %l4 = 0000000000000000
	brnz,pn	%l4,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000040000038] = 0000818e, %l4 = 0000000000000000
	ldsw	[%o5+0x038],%l4		! %l4 = 000000000000818e
p2_b116:
	membar	#Sync			! Added by membar checker (476)
!	Mem[0000000019000158] = 48358315 85861169, %l0 = 1b879d0e, %l1 = 000000b2
	ldda	[%i2+0x158]%asi,%l0	! %l0 = 0000000048358315 0000000085861169
!	%l6 = 0000000000000000, %l0 = 0000000048358315, %l7 = 0000000000000000
	xorcc	%l6,%l0,%l7		! %l7 = 0000000048358315, %ccr = 00

p2_label_98:
!	Mem[0000000031000029] = 58550d7a, %l7 = 0000000048358315
	ldstuba	[%o2+0x029]%asi,%l7	! %l7 = 0000000000000055
!	Mem[0000000018800140] = e04ad260 b6b83f4f da3fc704 7dbf7425
	prefetch [%i1+0x140],22
	fbe,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000019800000] = 00a3042c, %l2 = 0000000000000807
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000a3042c
p2_b117:
	fbe	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_99:
!	Mem[00000000188000ac] = fa578e83, %l5 = 0000000000000000
	ldsb	[%i1+0x0af],%l5		! %l5 = ffffffffffffff83
p2_b118:
	bvc	p2_b119			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000019800008] = 818ebc3c, %l0 = 0000000048358315
	ldswa	[%i3+%o6]0x80,%l0	! %l0 = ffffffff818ebc3c
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x077,%g2
p2_b119:
	membar	#Sync			! Added by membar checker (477)
!	%l5 = ffffffffffffff83, immed = ffffff44, %y  = 00000000
	udivcc	%l5,-0x0bc,%l7		! %l7 = 0000000000000001, %ccr = 00
	set	p2_b120,%o7
	fba	p2_far_0_he	! Branch Taken, %fcc0 = 2

p2_label_100:
!	%l1 = 0000000085861169, Mem[0000000019800000] = 00000807
	stba	%l1,[%i3+%g0]0x80	! Mem[0000000019800000] = 69000807
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x078,%g2
p2_b120:
!	Registers modified during the branch to p2_far_0
!	%l0  = 0000000000000000
!	%l2  = fffffffffffffcc3
!	%l3  = fffffffffffff288
!	%l6  = 00000000818eb384
	membar	#Sync			! Added by membar checker (478)
!	%f10 = 00000000 00000000, %f4  = 940bde0b 00000000, %f30 = 52cb6f77 5509fe7e
	fmuld	%f10,%f4 ,%f30		! %f30 = 80000000 00000000
!	%f14 = 940bde0b, %f15 = 3f800000, %f0  = 00000001 08c65226
	nop
!	%l5 = ffffffffffffff83, %l6 = 00000000818eb384, %y  = ffffffff
	mulx	%l5,%l6,%l2		! %l2 = ffffffc0bd52588c
!	Mem[0000000019800000] = 69000807 dfc4394e, %l2 = bd52588c, %l3 = fffff288
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 0000000069000807 00000000dfc4394e

p2_label_101:
	bpos,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000030000028] = 5db827fc, %l2 = 0000000069000807
	ldsb	[%o0+0x029],%l2		! Annulled
p2_b121:
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l4 = 000000000000818e, Mem[0000000019000008] = 7c6fc473
	stwa	%l4,[%i2+%o6]0x80	! Annulled
p2_b122:
	membar	#Sync			! Added by membar checker (479)
!	Branch On Register, %l0 = 0000000000000000
	brlz,pt	%l0,p2_not_taken_0	! Branch Not Taken

p2_label_102:
!	Mem[0000000018800080] = 5f3ae261 c4c71214 8bac361d 11953042
	prefetch [%i1+0x080],3
p2_b123:
	membar	#Sync			! Added by membar checker (480)
!	%f24 = 00000000 00000000, %f7  = 7c07a3f7
	fdtoi	%f24,%f7 		! %f7  = 00000000

	ba,a	p2_not_taken_0_end
p2_not_taken_0:
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba,a	p2_branch_failed
p2_not_taken_0_end:

!	%l6 = 00000000818eb384, immed = fffffc27, %l7 = 0000000000000001
	taddcc	%l6,-0x3d9,%l7		! %l7 = 00000000818eafab, %ccr = 1b
!	%l1 = 0000000085861169, %l0 = 0000000000000000, %l6 = 00000000818eb384
	orncc	%l1,%l0,%l6		! %l6 = ffffffffffffffff, %ccr = 88
!	%l4 = 0000818e, %l5 = ffffff83, Mem[0000000031800020] = 00000000 000000a3
	stda	%l4,[%o3+0x020]%asi	! Mem[0000000031800020] = 0000818e ffffff83

p2_label_103:
!	Mem[000000001800003c] = 70b448ec, %l1 = 0000000085861169
	lduba	[%i0+0x03c]%asi,%l1	! %l1 = 0000000000000070
!	Mem[000000003000006c] = e04ffb20, %l4 = 0000818e, %l7 = 818eafab
	add	%o0,0x6c,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 00000000e04ffb20
!	%l5 = ffffffffffffff83, immed = fffff6c5, %y  = ffffffff
	umul	%l5,-0x93b,%l3		! %l3 = fffff648000481cf
	bneg,a	p2_b124			! Branch Taken, %ccr = 88, CWP = 0
!	%l4 = 000000000000818e, Mem[0000000019800000] = 69000807
	stha	%l4,[%i3+%g0]0x80	! Mem[0000000019800000] = 818e0807
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x07c,%g2
p2_b124:

p2_label_104:
	membar	#Sync			! Added by membar checker (481)
	fbu,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[000000001b000000] = 57ad8b4e, %l2 = 0000000069000807
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = 0000000057ad8b4e
p2_b125:
	membar	#Sync			! Added by membar checker (482)
!	%l2 = 0000000057ad8b4e, %l6 = ffffffffffffffff, %l1 = 0000000000000070
	orcc	%l2,%l6,%l1		! %l1 = ffffffffffffffff, %ccr = 88
	bge,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000018000000] = 7c6fc473 edea0057
	stda	%l0,[%i0+%g0]0x80	! Annulled
p2_b126:

p2_label_105:
	membar	#Sync			! Added by membar checker (483)
!	Mem[0000000031000028] = 58ff0d7a9875606e, %l2 = 0000000057ad8b4e
	ldx	[%o2+0x028],%l2		! %l2 = 58ff0d7a9875606e
!	Mem[0000000018800000] = 7c6fc473, %l2 = 58ff0d7a9875606e
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 000000000000007c
!	Branch On Register, %l5 = ffffffffffffff83
	brnz,pt	%l5,p2_b127		! Branch Taken
!	Mem[0000000019000000] = d2eb7b1a, %l3 = fffff648000481cf
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 000000000000d2eb
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x07f,%g2
p2_b127:
	membar	#Sync			! Added by membar checker (484)
	fbe,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1

p2_label_106:
!	Mem[0000000030000068] = ffffe5c5 e04ffb20, %l4 = 0000818e, %l5 = ffffff83
	ldd	[%o0+0x068],%l4		! %l4 = 00000000ffffe5c5 00000000e04ffb20
p2_b128:
	membar	#Sync			! Added by membar checker (485)
!	%l4 = 00000000ffffe5c5, immed = 000001e5, %y  = fffff648
	mulx	%l4,0x1e5,%l4		! %l4 = 000001e4ffce4e39
!	%l3 = 000000000000d2eb, %l0 = 0000000000000000, %l0 = 0000000000000000
	addc	%l3,%l0,%l0		! %l0 = 000000000000d2eb
!	%l4 = 000001e4ffce4e39, %l0 = 000000000000d2eb, %l0 = 000000000000d2eb
	subc	%l4,%l0,%l0		! %l0 = 000001e4ffcd7b4e
!	%l6 = ffffffffffffffff, %l1 = ffffffffffffffff, %y  = fffff648
	smulcc	%l6,%l1,%l3		! %l3 = 0000000000000001, %ccr = 00

p2_label_107:
!	%f21 = d3ac2500, %f10 = 00000000 00000000
	fstox	%f21,%f10		! %f10 = fffffea7 b6000000
	fbe	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018000000] = 7c6fc473, %l7 = 00000000e04ffb20
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 000000000000007c
p2_b129:
	membar	#Sync			! Added by membar checker (486)
!	%l3 = 0000000000000001, immed = 00000ee1, %y  = 00000000
	sdivcc	%l3,0xee1,%l7		! %l7 = 0000000000000000, %ccr = 44
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 44

p2_label_108:
!	Mem[00000000180001cc] = d5c84d9a, %l2 = 000000000000007c
	lduh	[%i0+0x1cc],%l2		! %l2 = 000000000000d5c8
p2_b130:
	membar	#Sync			! Added by membar checker (487)
!	%l5 = 00000000e04ffb20, immed = fffff8c1, %y  = 00000000
	sdiv	%l5,-0x73f,%l5		! %l5 = ffffffffffe10b2f
!	%l7 = 0000000000000000, Mem[0000000018000008] = 00007af1
	stba	%l7,[%i0+%o6]0x80	! Mem[0000000018000008] = 00007af1
!	Mem[0000000018000100] = c7a4dd48 8d71efd8 75f10817 b969bcb2
	prefetcha [%i0+0x100]%asi,2
!	%f14 = 940bde0b 3f800000, %f30 = 80000000 00000000
	fmovd	%f14,%f30		! %f30 = 940bde0b 3f800000

p2_label_109:
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l3 = 0000000000000001, Mem[0000000031000064] = fffff047
	sth	%l3,[%o2+0x064]		! Mem[0000000031000064] = 0001f047
p2_b131:
	membar	#Sync			! Added by membar checker (488)
!	Mem[0000000018800000] = 7c6fc473, %l1 = ffffffffffffffff
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 000000007c6fc473
!	%f31 = 3f800000, %f6  = 00000000
	fabss	%f31,%f6 		! %f6  = 3f800000
!	%l2 = 000000000000d5c8, Mem[000000001a0001a2] = fff04719
	stha	%l2,[%i4+0x1a2]%asi	! Mem[000000001a0001a0] = fff0d5c8

p2_label_110:
!	%l6 = ffffffffffffffff, immed = ffffff15, %l3 = 0000000000000001
	and	%l6,-0x0eb,%l3		! %l3 = ffffffffffffff15
!	Mem[0000000031000064] = 0001f047, %l6 = ffffffffffffffff
	ldsba	[%o2+0x064]%asi,%l6	! %l6 = 0000000000000000
!	Mem[000000001b000194] = ed9aeafe, %l3 = ffffffffffffff15
	ldsba	[%i6+0x197]%asi,%l3	! %l3 = fffffffffffffffe
!	Branch On Register, %l2 = 000000000000d5c8
	brgz,pn	%l2,p2_b132		! Branch Taken
!	Mem[0000000019000000] = d2eb7b1a, %l4 = 000001e4ffce4e39
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000d2
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x084,%g2
p2_b132:

p2_label_111:
!	call to call_2, CWP = 0
	call	p2_call_2_he
!	Mem[0000000018000080] = 8d18612c 24e14ab8 7cb89c1e 6d48f33c
	prefetch [%i0+0x080],3
!	Registers modified during the branch to p2_call_2
!	%l0  = 0000000000000000
!	%l1  = 00000000000000d5
!	%l2  = 0000000000000004
!	%l6  = 00d5000000000000
	membar	#Sync			! Added by membar checker (489)
!	Mem[00000000188001fa] = 875a0cb2, %l1 = 00000000000000d5
	ldstuba	[%i1+0x1fa]%asi,%l1	! %l1 = 000000000000000c
!	Mem[0000000019800120] = a410a321 ffff1cb8 6eed202e 00007c6f
	prefetcha [%i3+0x120]%asi,20
!	%f24 = 00000000, %f5  = 00000000
	fitos	%f24,%f5 		! %f5  = 00000000

p2_label_112:
	set	p2_b133,%o7
	fblg	p2_far_1_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000018000008] = 00007af1, %l4 = 00000000000000d2
	ldstuba	[%i0+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x085,%g2
p2_b133:
!	Registers modified during the branch to p2_far_1
!	%l0  = ffffffffffffffff
!	%l7  = 0000000000000e54
	bleu	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000018000000] = 7c6fc473, %l0 = ffffffffffffffff
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 000000007c6fc473
p2_b134:
	membar	#Sync			! Added by membar checker (490)
!	%l4 = 0000000000000000, %l5 = ffffffffffe10b2f, %l0 = 000000007c6fc473
	srl	%l4,%l5,%l0		! %l0 = 0000000000000000

p2_label_113:
!	%l0 = 00000000, %l1 = 0000000c, Mem[0000000031000028] = 58ff0d7a 9875606e
	stda	%l0,[%o2+0x028]%asi	! Mem[0000000031000028] = 00000000 0000000c
!	%l2 = 00000004, %l3 = fffffffe, Mem[00000000180000c0] = 71bd044c 976077ec
	std	%l2,[%i0+0x0c0]	! Mem[00000000180000c0] = 00000004 fffffffe
!	%f20 = c42011d7, %f20 = c42011d7 d3ac2500
	fstod	%f20,%f20		! %f20 = c084023a e0000000
!	Mem[0000000031000068] = 00000000, %l7 = 0000000000000e54
	ldsba	[%o2+0x069]%asi,%l7	! %l7 = 0000000000000000
!	Branch On Register, %l2 = 0000000000000004
	brgz,a,pt %l2,p2_b135		! Branch Taken

p2_label_114:
!	%l2 = 00000004, %l3 = fffffffe, Mem[0000000018800000] = ffffffff ffffffff
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000018800000] = 00000004 fffffffe
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x087,%g2
p2_b135:
	membar	#Sync			! Added by membar checker (491)
!	%l0 = 0000000000000000, Mem[00000000190001a9] = a5f0abcb
	stba	%l0,[%i2+0x1a9]%asi	! Mem[00000000190001a8] = a500abcb
	set	p2_b136,%o7
	fbl,a,pt %fcc3,p2_near_0_he	! Branch Taken, %fcc3 = 1
!	%l0 = 0000000000000000, Mem[0000000018800190] = 66c6dab6c828ba13
	stx	%l0,[%i1+0x190]		! Mem[0000000018800190] = 0000000000000000
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x088,%g2
p2_b136:
!	Registers modified during the branch to p2_near_0
!	%l0  = fffffffffffff796
!	%l1  = fffffffffffffb7b
!	%l2  = 00000000001efdd6
!	%l3  = 00000000001ef4d0
!	%l4  = 0000000000000233
	membar	#Sync			! Added by membar checker (492)
!	Mem[00000000190001f0] = 8a1a5c13, %l2 = 00000000001efdd6
	ldsha	[%i2+0x1f2]%asi,%l2	! %l2 = 0000000000005c13

p2_label_115:
!	Mem[0000000018800050] = b487ca88, %l5 = ffffffffffe10b2f
	ldswa	[%i1+0x050]%asi,%l5	! %l5 = ffffffffb487ca88
!	Mem[00000000188000f8] = 68036fdc, %l6 = 00d5000000000000
	ldswa	[%i1+0x0f8]%asi,%l6	! %l6 = 0000000068036fdc
	fbl,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001a800008] = a35d0fa3, %l0 = fffffffffffff796
	lduwa	[%i5+%o6]0x80,%l0	! Annulled
p2_b137:
	membar	#Sync			! Added by membar checker (493)
!	%l6 = 0000000068036fdc, immed = fffff66c, %l7 = 0000000000000000
	sub	%l6,-0x994,%l7		! %l7 = 0000000068037970

p2_label_116:
	bg,a	p2_b138			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000018000000] = 7c6fc473, %l1 = fffffffffffffb7b
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = 000000007c6fc473
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x08a,%g2
p2_b138:
	fbe,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000003100006c] = 000007d1, %l3 = 00000000001ef4d0
	ldsb	[%o2+0x06f],%l3		! Annulled
p2_b139:
	membar	#Sync			! Added by membar checker (494)
!	Mem[0000000018000008] = ff007af1, %l5 = ffffffffb487ca88
	ldsha	[%i0+%o6]0x80,%l5	! %l5 = ffffffffffffff00

p2_label_117:
!	%f30 = 940bde0b 3f800000, %f20 = c084023a e0000000
	fcmped	%fcc2,%f30,%f20		! %fcc2 = 2
!	%l3 = 00000000001ef4d0
	setx	0x092d57a2092d57a2,%g7,%l3 ! %l3 = 092d57a2092d57a2
!	%l7 = 0000000068037970, %l1 = 000000007c6fc473, %l3 = 092d57a2092d57a2
	sllx	%l7,%l1,%l3		! %l3 = cb80000000000000
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetcha [%o4+0x000]%asi,3

p2_label_118:
!	%f16 = a08ede4b 1e46fe0d, %f24 = 00000000 00000000
	fabsd	%f16,%f24		! %f24 = 208ede4b 1e46fe0d
!	%f31 = 3f800000, %f18 = 00000000 9ee48851
	fstox	%f31,%f18		! %f18 = 00000000 00000001
!	%l6 = 0000000068036fdc, immed = fffff93c, %y  = 00000000
	smulcc	%l6,-0x6c4,%l6		! %l6 = fffffd4048bf3390, %ccr = 80
!	Denormal Floating Point Operation Nullified
	nop
	set	p2_b140,%o7
	fba	p2_far_3_he	! Branch Taken, %fcc0 = 2

p2_label_119:
!	%l4 = 00000233, %l5 = ffffff00, Mem[0000000031800028] = d5aa091b 1f1ba576
	std	%l4,[%o3+0x028]	! Mem[0000000031800028] = 00000233 ffffff00
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x08c,%g2
p2_b140:
	membar	#Sync			! Added by membar checker (495)
!	Branch On Register, %l0 = fffffffffffff796
	brlez,a,pn %l0,p2_b141		! Branch Taken
!	%l3 = cb80000000000000, Mem[0000000018800008] = 00ffffff
	stwa	%l3,[%i1+%o6]0x80	! Mem[0000000018800008] = 00000000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x08d,%g2
p2_b141:
	membar	#Sync			! Added by membar checker (496)
!	%f10 = fffffea7 b6000000, %f30 = 940bde0b 3f800000, %f24 = 208ede4b 1e46fe0d
	fmuld	%f10,%f30,%f24		! %f24 = fffffea7 b6000000
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 80

p2_label_120:
!	Mem[0000000018800000] = 00000004, %l3 = cb80000000000000
	ldswa	[%i1+%g0]0x80,%l3	! Annulled
p2_b142:
	membar	#Sync			! Added by membar checker (497)
!	%l1 = 000000007c6fc473, immed = ffffff96, %y  = fffffd40
	udivcc	%l1,-0x06a,%l1		! %l1 = 00000000fffffdaa, %ccr = 08
!	%l6 = fffffd4048bf3390, %l5 = ffffffffffffff00, %l5 = ffffffffffffff00
	subc	%l6,%l5,%l5		! %l5 = fffffd4048bf3490
!	%l7 = 0000000068037970, immed = fffff8b8, %y  = fffffd40
	udivcc	%l7,-0x748,%l0		! %l0 = 00000000ffffffff, %ccr = 0a
	set	p2_b143,%o7
	fba	p2_far_0_le	! Branch Taken, %fcc0 = 2

p2_label_121:
!	%l6 = 48bf3390, %l7 = 68037970, Mem[0000000030000068] = ffffe5c5 e04ffb20
	std	%l6,[%o0+0x068]	! Mem[0000000030000068] = 48bf3390 68037970
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x08f,%g2
p2_b143:
!	Registers modified during the branch to p2_far_0
!	%l4  = ffffffffffffffff
!	%l7  = cb8000000000091b
	membar	#Sync			! Added by membar checker (498)
	set	p2_b144,%o7
	fbg,pn	%fcc0,p2_near_1_he	! Branch Taken, %fcc0 = 2
!	%l4 = ffffffff, %l5 = 48bf3490, Mem[0000000018000000] = 7c6fc473 edea0057
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000018000000] = ffffffff 48bf3490
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x090,%g2
p2_b144:
!	Registers modified during the branch to p2_near_1
!	%l3  = ffffffffb3dbb9cd
!	%l4  = 0000000000ef4000
!	%l7  = cb8000000000077a
	membar	#Sync			! Added by membar checker (499)
!	%l1 = 00000000fffffdaa, immed = fffff1bb, %y  = fffffd40
	udiv	%l1,-0xe45,%l3		! %l3 = 00000000ffffffff
!	%l0 = 00000000ffffffff
	sethi	%hi(0xe0dc2000),%l0	! %l0 = 00000000e0dc2000

p2_label_122:
!	%f26 = 00000000, %f15 = 3f800000, %f24 = fffffea7
	fmuls	%f26,%f15,%f24		! %f24 = 00000000
	fbul	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l3 = 00000000ffffffff, Mem[0000000019800000] = 818e0807dfc4394e
	stxa	%l3,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000000ffffffff
p2_b145:
	membar	#Sync			! Added by membar checker (500)
!	%l2 = 00005c13, %l3 = ffffffff, Mem[0000000018800120] = e09dab45 4a2d2c31
	std	%l2,[%i1+0x120]	! Mem[0000000018800120] = 00005c13 ffffffff
	fbug,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1

p2_label_123:
!	Mem[0000000018800000] = 00000004, %l4 = 0000000000ef4000
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000004
p2_b146:
	membar	#Sync			! Added by membar checker (501)
!	%l7 = cb8000000000077a, immed = 00000012, %l3 = 00000000ffffffff
	srlx	%l7,0x012,%l3		! %l3 = 000032e000000000
!	%f10 = fffffea7 b6000000, %f20 = c084023a e0000000
	fxtod	%f10,%f20		! %f20 = c27584a0 00000000
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800008] = 00000000fffff047, %l2 = 0000000000005c13
	ldxa	[%i1+%o6]0x80,%l2	! %l2 = 00000000fffff047
p2_b147:

p2_label_124:
	membar	#Sync			! Added by membar checker (502)
!	Mem[0000000018800170] = 2d1f9354, %l5 = fffffd4048bf3490
	ldsba	[%i1+0x172]%asi,%l5	! %l5 = ffffffffffffff93
!	Mem[00000000190000a4] = 6595a3e9, %l4 = 0000000000000004
	swap	[%i2+0x0a4],%l4		! %l4 = 000000006595a3e9
!	%f22 = 93fbde0b 08c65226, %f30 = 940bde0b 3f800000, %f4  = 940bde0b 00000000
	fsubd	%f22,%f30,%f4 		! %f4  = 13fbde0b 7639adda
	fbe,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800008] = 00000000, %l2 = 00000000fffff047
	ldsba	[%i1+%o6]0x80,%l2	! Annulled
p2_b148:

p2_label_125:
	membar	#Sync			! Added by membar checker (503)
!	%l7 = cb8000000000077a, %l5 = ffffffffffffff93, %y  = fffffd40
	mulx	%l7,%l5,%l5		! %l5 = 5a7ffffffffcd10e
!	%l2 = 00000000fffff047, immed = 00000959, %l0 = 00000000e0dc2000
	xor	%l2,0x959,%l0		! %l0 = 00000000fffff91e
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018000000] = ffffffff, %l0 = 00000000fffff91e
	lduha	[%i0+%g0]0x80,%l0	! Annulled
p2_b149:
	membar	#Sync			! Added by membar checker (504)
!	%f30 = 940bde0b, %f4  = 13fbde0b
	fnegs	%f30,%f4 		! %f4  = 140bde0b

p2_label_126:
!	Mem[0000000018800000] = 00000004, %l3 = 000032e000000000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Branch On Register, %l1 = 00000000fffffdaa
	brlz,a,pt %l1,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000008] = 7c6fc473, %l2 = 00000000fffff047
	ldsha	[%i2+%o6]0x80,%l2	! Annulled
p2_b150:
	membar	#Sync			! Added by membar checker (505)
!	%f16 = a08ede4b 1e46fe0d, %f18 = 00000000 00000001
	fmovd	%f16,%f18		! %f18 = a08ede4b 1e46fe0d
!	Mem[0000000019000080] = a6f61762 5f0452b5
	flush	%i2+0x080

p2_label_127:
!	%f15 = 3f800000, %f12 = 52cb6f77 5509fe7e
	fstox	%f15,%f12		! %f12 = 00000000 00000001
!	%l1 = 00000000fffffdaa, immed = fffff28b, %l0 = 00000000fffff91e
	and	%l1,-0xd75,%l0		! %l0 = 00000000fffff08a
!	%f2  = 00000000 00000000, %f16 = a08ede4b 1e46fe0d, %f2  = 00000000 00000000
	fsubd	%f2 ,%f16,%f2 		! %f2  = 208ede4b 1e46fe0d
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],22
!	%f30 = 940bde0b, %f18 = a08ede4b, %f10 = fffffea7 b6000000
	fsmuld	%f30,%f18,%f10		! %f10 = 36a383a7 6865ce40

p2_label_128:
!	%f19 = 1e46fe0d, %f27 = 00000000, %f2  = 208ede4b
	fsubs	%f19,%f27,%f2 		! %f2  = 1e46fe0d
!	%f20 = c27584a0 00000000, %f0  = 00000001 08c65226
	fdtox	%f20,%f0 		! %f0  = fffffea7 b6000000
	set	p2_b151,%o7
	fba,a,pn %fcc3,p2_near_2_he	! Branch Taken, %fcc3 = 1
!	Mem[0000000019000000] = ffeb7b1a, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l3	! Annulled
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x097,%g2
p2_b151:
!	Registers modified during the branch to p2_near_2
!	%l1  = fffffffffffff29b
!	%l3  = 0000000000000043
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (506)
!	%l0 = 00000000fffff08a
	sethi	%hi(0x8a01b800),%l0	! %l0 = 000000008a01b800

p2_label_129:
!	Branch On Register, %l6 = fffffd4048bf3390
	brgez,pn %l6,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000008] = 7c6fc473ffffffff, %l1 = fffffffffffff29b
	ldxa	[%i2+%o6]0x80,%l1	! %l1 = 7c6fc473ffffffff
p2_b152:
	membar	#Sync			! Added by membar checker (507)
!	%f29 = 5509fe7e, %f6  = 3f800000 00000000
	fstox	%f29,%f6 		! %f6  = 0000089f e7e00000
!	Mem[0000000018800080] = 5f3ae261 c4c71214 8bac361d 11953042
	prefetcha [%i1+0x080]%asi,3
	fbg,a,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1

p2_label_130:
!	Mem[0000000018800000] = ff000004, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l7	! Annulled
p2_b153:
	membar	#Sync			! Added by membar checker (508)
!	%f12 = 00000000, %f26 = 00000000
	fcmps	%fcc2,%f12,%f26		! %fcc2 = 0
!	%l6 = fffffd4048bf3390, %l3 = 0000000000000043, %l5 = 5a7ffffffffcd10e
	orncc	%l6,%l3,%l5		! %l5 = ffffffffffffffbc, %ccr = 88
!	Denormal Floating Point Operation Nullified
	nop
!	%f0  = fffffea7, %f22 = 93fbde0b
	fitos	%f0 ,%f22		! %f22 = c3ac8000

p2_label_131:
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetch [%o4+0x000],2
	set	p2_b154,%o7
	fblg	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetch [%o4+0x000],1
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x09a,%g2
p2_b154:
!	Registers modified during the branch to p2_far_0
!	%l4  = ffffffffff140370
!	%l7  = 000000000000095e
	membar	#Sync			! Added by membar checker (509)
!	Mem[000000001b000018] = 0c18deba, %l4 = ffffffffff140370
	lduh	[%i6+0x018],%l4		! %l4 = 0000000000000c18
	bge	p2_b155			! Branch Taken, %ccr = 00, CWP = 0

p2_label_132:
!	%l7 = 000000000000095e, Mem[0000000030800064] = 807b0084
	stb	%l7,[%o1+0x064]		! Mem[0000000030800064] = 5e7b0084
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x09b,%g2
p2_b155:
	membar	#Sync			! Added by membar checker (510)
!	Mem[0000000018000008] = ff007af1, %l7 = 000000000000095e
	lduwa	[%i0+%o6]0x80,%l7	! %l7 = 00000000ff007af1
!	%f15 = 3f800000, %f17 = 1e46fe0d
	fcmps	%fcc2,%f15,%f17		! %fcc2 = 2
!	%f14 = 940bde0b 3f800000, %f18 = a08ede4b 1e46fe0d
	fcmpd	%fcc0,%f14,%f18		! %fcc0 = 2
!	%l2 = 00000000fffff047, Mem[0000000030000022] = 00000048
	stba	%l2,[%o0+0x022]%asi	! Mem[0000000030000020] = 00004748

p2_label_133:
!	Mem[000000003100002c] = 0000000c, %l3 = 0000000000000043
	swap	[%o2+0x02c],%l3		! %l3 = 000000000000000c
!	Mem[0000000031800068] = fffffae7274dff00, %l2 = 00000000fffff047
	ldxa	[%o3+0x068]%asi,%l2	! %l2 = fffffae7274dff00
!	Denormal Floating Point Operation Nullified
	nop
!	%f21 = 00000000, %f8  = 00000001
	fabss	%f21,%f8 		! %f8  = 00000000
!	%f8  = 00000000, %f29 = 5509fe7e, %f2  = 1e46fe0d
	fsubs	%f8 ,%f29,%f2 		! %f2  = d509fe7e

p2_label_134:
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i2+%g0]0x80,%l0
p2_b156:
	membar	#Sync			! Added by membar checker (511)
	fbe,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l4 = 00000c18, %l5 = ffffffbc, Mem[0000000030800060] = 20edb629 5e7b0084
	std	%l4,[%o1+0x060]	! Mem[0000000030800060] = 00000c18 ffffffbc
p2_b157:
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_135:
!	%l0 = 000000008a01b800, Mem[0000000019000008] = 7c6fc473
	stba	%l0,[%i2+%o6]0x80	! Mem[0000000019000008] = 006fc473
p2_b158:
	set	p2_b159,%o7
	fbne	p2_far_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000019800100] = 29a2081a 612aa01d f1ae171b d0f61e71
	prefetch [%i3+0x100],1
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x09f,%g2
p2_b159:
!	Registers modified during the branch to p2_far_1
!	%l3  = fffffffffffffbf4
!	%l4  = 0000000000000000
!	%l5  = 0000000000000090
!	%l7  = 0000000000000090
	membar	#Sync			! Added by membar checker (512)
!	%l3 = fffffffffffffbf4
	setx	0x2bf593ae2bf593ae,%g7,%l3 ! %l3 = 2bf593ae2bf593ae
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetcha [%o4+0x060]%asi,4

p2_label_136:
!	%l0 = 000000008a01b800, %l1 = 7c6fc473ffffffff, %l2 = fffffae7274dff00
	srlx	%l0,%l1,%l2		! %l2 = 0000000000000000
	set	p2_b160,%o7
	fbul,a,pn %fcc3,p2_near_3_he	! Branch Taken, %fcc3 = 1
!	Mem[0000000030800064] = ffffffbc, %l3 = 2bf593ae2bf593ae
	ldsw	[%o1+0x064],%l3		! %l3 = ffffffffffffffbc
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0a0,%g2
p2_b160:
!	Registers modified during the branch to p2_near_3
!	%l0  = ffffffffffffffff
!	%l4  = ffffffff818ebc3c
	membar	#Sync			! Added by membar checker (513)
!	%l1 = 7c6fc473ffffffff, %l0 = ffffffffffffffff, %l0 = ffffffffffffffff
	addc	%l1,%l0,%l0		! %l0 = 7c6fc473fffffffe
!	%l5 = 0000000000000090, immed = fffffc0e, %l4 = ffffffff818ebc3c
	subccc	%l5,-0x3f2,%l4		! %l4 = 0000000000000482, %ccr = 11

p2_label_137:
!	%f0  = fffffea7, %f2  = d509fe7e
	fitos	%f0 ,%f2 		! %f2  = c3ac8000
	bpos,a	p2_b161			! Branch Taken, %ccr = 11, CWP = 0
!	Mem[0000000032000020] = 881b2ad7 861878d1 a4176408 4b729f64
	prefetch [%o4+0x020],1
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0a1,%g2
p2_b161:
	membar	#Sync			! Added by membar checker (514)
!	Mem[0000000031800028] = 00000233, %l5 = 0000000000000090
	ldub	[%o3+0x029],%l5		! %l5 = 0000000000000000
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetch [%o4+0x000],22

p2_label_138:
!	%f30 = 940bde0b, %f19 = 1e46fe0d, %f18 = a08ede4b 1e46fe0d
	fsmuld	%f30,%f19,%f18		! %f18 = b65b2e22 7acc23c0
!	%l1 = 7c6fc473ffffffff, immed = 00000275, %l0 = 7c6fc473fffffffe
	andcc	%l1,0x275,%l0		! %l0 = 0000000000000275, %ccr = 00
!	%l7 = 0000000000000090, %l3 = ffffffffffffffbc, %l7 = 0000000000000090
	xnor	%l7,%l3,%l7		! %l7 = 00000000000000d3
	be	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000019800060] = dc1cb79e ac887dfa 1d10ddc4 bebc601e
	prefetch [%i3+0x060],0
p2_b162:

p2_label_139:
	bg,a	p2_b163			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001a000008] = f6b7b3e1, %l3 = ffffffffffffffbc
	lduwa	[%i4+%o6]0x80,%l3	! %l3 = 00000000f6b7b3e1
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0a3,%g2
p2_b163:
	membar	#Sync			! Added by membar checker (515)
!	Mem[00000000198000c0] = ccfb45ee a4e6f6ea 14219f3f 600df678
	prefetch [%i3+0x0c0],1
!	%l2 = 0000000000000000, Mem[000000003000006c] = 68037970
	stha	%l2,[%o0+0x06c]%asi	! Mem[000000003000006c] = 00007970
!	Mem[0000000019800000] = 00000000, %l4 = 0000000000000482
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000

p2_label_140:
!	%l0 = 0000000000000275, Mem[0000000030000024] = f09c6b1f
	stwa	%l0,[%o0+0x024]%asi	! Mem[0000000030000024] = 00000275
!	Mem[0000000030800068] = bfb6f6dc, %l0 = 0000000000000275
	ldsb	[%o1+0x06b],%l0		! %l0 = ffffffffffffffdc
!	%f4  = 140bde0b 7639adda, %f6  = 0000089f e7e00000
	fnegd	%f4 ,%f6 		! %f6  = 940bde0b 7639adda
!	Mem[0000000018000000] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000180000ec] = c14edf83, %l0 = ffffffffffffffdc
	ldsha	[%i0+0x0ee]%asi,%l0	! %l0 = ffffffffffffdf83

p2_label_141:
!	%l5 = 0000000000000000, %l7 = 00000000000000d3, %l6 = fffffd4048bf3390
	xorcc	%l5,%l7,%l6		! %l6 = 00000000000000d3, %ccr = 00
	bgu,a	p2_b164			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000018800000] = ff000004, %l7 = 00000000000000d3
	lduwa	[%i1+%g0]0x80,%l7	! %l7 = 00000000ff000004
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0a4,%g2
p2_b164:
	membar	#Sync			! Added by membar checker (516)
!	Mem[0000000018000008] = ff007af1, %l5 = 0000000000000000
	lduba	[%i0+%o6]0x80,%l5	! %l5 = 00000000000000ff
	bge,a	p2_b165			! Branch Taken, %ccr = 00, CWP = 0

p2_label_142:
!	%l1 = 7c6fc473ffffffff, Mem[0000000018800000] = ff000004fffffffe
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000018800000] = 7c6fc473ffffffff
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x0a5,%g2
p2_b165:
	membar	#Sync			! Added by membar checker (517)
!	%f0  = fffffea7, %f29 = 5509fe7e
	fitos	%f0 ,%f29		! %f29 = c3ac8000
!	Mem[00000000190000e0] = 1d941ae0 66457867 5adcb052 ac1c4bfc
	prefetcha [%i2+0x0e0]%asi,20
!	%l6 = 00000000000000d3, immed = 000001fa, %l4 = 0000000000000000
	tsubcc	%l6,0x1fa,%l4		! %l4 = fffffffffffffed9, %ccr = 9b
	bneg	p2_b166			! Branch Taken, %ccr = 9b, CWP = 0

p2_label_143:
!	Mem[0000000019000008] = 006fc473, %l6 = 00000000000000d3
	swapa	[%i2+%o6]0x80,%l6	! %l6 = 00000000006fc473
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0a6,%g2
p2_b166:
	membar	#Sync			! Added by membar checker (518)
!	%f30 = 940bde0b 3f800000, %f18 = b65b2e22 7acc23c0
	fabsd	%f30,%f18		! %f18 = 140bde0b 3f800000
!	%l1 = 7c6fc473ffffffff, %l0 = ffffffffffffdf83, %y  = 00000000
	smul	%l1,%l0,%l1		! %l1 = 000000000000207d
!	%l1 = 000000000000207d, %l2 = 00000000000000ff, %l1 = 000000000000207d
	orn	%l1,%l2,%l1		! %l1 = ffffffffffffff7d
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 9b

p2_label_144:
!	Mem[0000000018000192] = a4354eca, %l2 = 00000000000000ff
	ldstub	[%i0+0x192],%l2		! %l2 = 000000000000004e
p2_b167:
	membar	#Sync			! Added by membar checker (519)
!	%f29 = c3ac8000, %f28 = 00000000 c3ac8000
	fstox	%f29,%f28		! %f28 = ffffffff fffffea7
!	Mem[000000003100006c] = 000007d1, %l4 = fffffffffffffed9
	ldub	[%o2+0x06e],%l4		! %l4 = 0000000000000007
	set	p2_b168,%o7
	fbo	p2_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000019000040] = 638a60db 73da93db c21f707e d37d7c32
	prefetch [%i2+0x040],16
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x0a8,%g2
p2_b168:
!	Registers modified during the branch to p2_far_0
!	%l0  = 0000000000000000
!	%l2  = ffffffff00fffcc6
!	%l3  = fffff29577ffca20
!	%l6  = 00000000818eb384

p2_label_145:
	bpos	p2_b169			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[000000001a800140] = 7baff003 b6d3827f e9237c4b c4ad126a
	prefetch [%i5+0x140],22
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x0a9,%g2
p2_b169:
	membar	#Sync			! Added by membar checker (520)
!	Mem[0000000032000004] = cb056b78, %l7 = 00000000ff000004
	lduh	[%o4+0x006],%g2		! %g2 = 000000000000cb05
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000031800028] = 00000233, %l0 = 0000000000000000
	ldub	[%o3+0x028],%l0		! %l0 = 0000000000000000
p2_b170:

p2_label_146:
	membar	#Sync			! Added by membar checker (521)
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],20
!	%l2 = ffffffff00fffcc6, immed = 0000000f, %l3 = fffff29577ffca20
	srl	%l2,0x00f,%l3		! %l3 = 00000000000001ff
	set	p2_b171,%o7
	fbo,a	p2_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetch [%o4+0x060],23
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x0ab,%g2
p2_b171:
!	Registers modified during the branch to p2_far_2
!	%l4  = 0000000048bf3390
!	%l7  = 00000000000000ff
!	Jump to jmpl_0, CWP = 0
	set	p2_jmpl_0_he,%g1
	jmpl	%g1,%g6

p2_label_147:
!	Mem[0000000019800180] = 9738bb7d 085e9193 9ca7bab2 21ebb21d
	prefetch [%i3+0x180],22
!	Registers modified during the branch to p2_jmpl_0
!	%l1  = ffffffff00fffbc7
!	%l5  = 0000000000000000
!	%l6  = 0000000000bf3380
	membar	#Sync			! Added by membar checker (522)
!	%l1 = ffffffff00fffbc7, immed = 000003f9, %l0 = 0000000000000000
	xnorcc	%l1,0x3f9,%l0		! %l0 = 00000000ff0007c1, %ccr = 08
!	%l6 = 0000000000bf3380, immed = 00000f26, %l2 = ffffffff00fffcc6
	addccc	%l6,0xf26,%l2		! %l2 = 0000000000bf42a6, %ccr = 00
	fbn,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l7 = 00000000000000ff, Mem[0000000031800020] = 0000818effffff83
	stx	%l7,[%o3+0x020]		! Annulled
p2_b172:

p2_label_148:
	membar	#Sync			! Added by membar checker (523)
	fbl,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l7 = 00000000000000ff, Mem[000000001a800008] = a35d0fa3
	stba	%l7,[%i5+%o6]0x80	! Mem[000000001a800008] = ff5d0fa3
p2_b173:
	membar	#Sync			! Added by membar checker (524)
!	%l7 = 00000000000000ff, %l1 = ffffffff00fffbc7, %y  = ffffffff
	mulx	%l7,%l1,%l3		! %l3 = ffffff01fefbcb39
	bleu	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001a000000] = e5c56ed0, %l5 = 0000000000000000
	lduba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000e5
p2_b174:

p2_label_149:
	membar	#Sync			! Added by membar checker (525)
!	Mem[00000000190000db] = bc3820e1, %l3 = ffffff01fefbcb39
	ldstub	[%i2+0x0db],%l3		! %l3 = 00000000000000e1
!	%l4 = 0000000048bf3390, Mem[0000000018000000] = ffffffff48bf3490
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000018000000] = 0000000048bf3390
	set	p2_b175,%o7
	fbug	p2_far_3_he	! Branch Taken, %fcc0 = 2
!	%l6 = 0000000000bf3380, Mem[0000000019000000] = ffeb7b1a
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000019000000] = 80eb7b1a
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x0af,%g2
p2_b175:
	membar	#Sync			! Added by membar checker (526)
	set	p2_b176,%o7
	fba,a,pn %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 1

p2_label_150:
!	Mem[0000000019800000] = 00000000, %l3 = 00000000000000e1
	swapa	[%i3+%g0]0x80,%l3	! Annulled
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0b0,%g2
p2_b176:
!	Registers modified during the branch to p2_near_0
!	%l6  = ffffffff00fffca8
	membar	#Sync			! Added by membar checker (527)
!	%f6  = 940bde0b 7639adda, %f6  = 940bde0b 7639adda
	fcmpd	%fcc3,%f6 ,%f6 		! %fcc3 = 0
!	%f28 = ffffffff fffffea7, %f26 = 00000000 00000000
	fnegd	%f28,%f26		! %f26 = 7fffffff fffffea7
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[00000000188001a0] = 2a6dc0cb5495af3d, %l1 = ffffffff00fffbc7
	ldx	[%i1+0x1a0],%l1		! Annulled
p2_b177:

p2_label_151:
	bvc	p2_b178			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000040] = ef2b03fa, %l1 = ffffffff00fffbc7
	lduh	[%o4+0x042],%g2		! %g2 = 000000000000ef2b
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0b2,%g2
p2_b178:
	membar	#Sync			! Added by membar checker (528)
!	Mem[0000000019800060] = dc1cb79e ac887dfa 1d10ddc4 bebc601e
	prefetcha [%i3+0x060]%asi,16
	bl,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000018800040] = b002c34e 6526a47b 378b2e79 818ebc3c
	prefetch [%i1+0x040],20	! Annulled
p2_b179:

p2_label_152:
	membar	#Sync			! Added by membar checker (529)
!	%l5 = 00000000000000e5, %l2 = 0000000000bf42a6, %l4 = 0000000048bf3390
	taddcc	%l5,%l2,%l4		! %l4 = 0000000000bf438b, %ccr = 02
!	Jump to jmpl_2, CWP = 0
	set	p2_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000019000008] = 000000d3, %l5 = 00000000000000e5
	ldswa	[%i2+%o6]0x80,%l5	! %l5 = 00000000000000d3
!	Registers modified during the branch to p2_jmpl_2
!	%l1  = ffffffffffff7614
!	%l2  = 00000000be844775
!	%l3  = ffffffffffe29b9b
!	%l6  = 00000001bd844bae
!	%f10 = 36a383a7, %f10 = 36a383a7, %f6  = 940bde0b
	fdivs	%f10,%f10,%f6 		! %f6  = 3f800000
!	Branch On Register, %l5 = 00000000000000d3
	brgz,a,pt %l5,p2_b180		! Branch Taken

p2_label_153:
!	%l3 = ffffffffffe29b9b, Mem[0000000018000004] = 48bf3390
	stw	%l3,[%i0+0x004]		! Mem[0000000018000004] = ffe29b9b
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0b4,%g2
p2_b180:
	membar	#Sync			! Added by membar checker (530)
!	Mem[000000003100002c] = 00000043, %l6 = 00000001bd844bae
	ldsb	[%o2+0x02e],%l6		! %l6 = 0000000000000000
!	%l1 = ffffffffffff7614, immed = fffffd29, %l3 = ffffffffffe29b9b
	add	%l1,-0x2d7,%l3		! %l3 = ffffffffffff733d
!	%f16 = a08ede4b 1e46fe0d, %f4  = 140bde0b 7639adda
	fcmpd	%fcc2,%f16,%f4 		! %fcc2 = 1
	nop				! Delay added due to fcmp
	fbug,a,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1

p2_label_154:
!	Mem[0000000018000008] = ff007af1fffff4a4, %l3 = ffffffffffff733d
	ldxa	[%i0+%o6]0x80,%l3	! Annulled
p2_b181:
	bg	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000019800000] = 00000000 ffffffff, %l4 = 00bf438b, %l5 = 000000d3
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000ffffffff
p2_b182:
	membar	#Sync			! Added by membar checker (531)
!	%l0 = 00000000ff0007c1, Mem[000000003180006c] = 274dff00
	stwa	%l0,[%o3+0x06c]%asi	! Mem[000000003180006c] = ff0007c1
!	%f6  = 3f800000, %f6  = 3f800000, %f8  = 00000000
	fadds	%f6 ,%f6 ,%f8 		! %f8  = 40000000

p2_label_155:
	bgu	p2_b183			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000018800180] = 659ae390 7c0b0147 aaf4a4c2 9fa6410e
	prefetch [%i1+0x180],3
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0b7,%g2
p2_b183:
	membar	#Sync			! Added by membar checker (532)
!	Mem[0000000019000134] = 818eb384, %l3 = ffffffffffff733d
	ldswa	[%i2+0x134]%asi,%l3	! %l3 = ffffffff818eb384
!	%l0 = ff0007c1, %l1 = ffff7614, Mem[0000000018800008] = 00000000 fffff047
	stda	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = ff0007c1 ffff7614
!	%f26 = 7fffffff fffffea7, %f22 = c3ac8000 08c65226
	fcmpd	%fcc3,%f26,%f22		! %fcc3 = 3

p2_label_156:
!	Branch On Register, %l3 = ffffffff818eb384
	brgez,pn %l3,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019800008] = 818ebc3cfffff047, %l5 = 00000000ffffffff
	ldxa	[%i3+%o6]0x80,%l5	! %l5 = 818ebc3cfffff047
p2_b184:
	bneg,a	p2_b185			! Branch Taken, %ccr = 88, CWP = 0
!	%l3 = ffffffff818eb384, Mem[0000000018800000] = 7c6fc473
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000018800000] = 846fc473
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x0b9,%g2
p2_b185:
	bge,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88

p2_label_157:
!	%l1 = ffffffffffff7614, Mem[000000001a000000] = e5c56ed0cdfd4790
	stxa	%l1,[%i4+%g0]0x80	! Annulled
p2_b186:
	membar	#Sync			! Added by membar checker (533)
!	Branch On Register, %l5 = 818ebc3cfffff047
	brnz,pt	%l5,p2_b187		! Branch Taken
!	Mem[0000000019800070] = 77f06f36, %l3 = ffffffff818eb384
	lduh	[%i3+0x070],%l3		! %l3 = 00000000000077f0
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0bb,%g2
p2_b187:
	membar	#Sync			! Added by membar checker (534)
!	%l6 = 0000000000000000, Mem[0000000031000028] = 0000000000000043
	stx	%l6,[%o2+0x028]		! Mem[0000000031000028] = 0000000000000000
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_158:
!	Mem[000000001880019c] = c7223698, %l4 = 0000000000000000
	swap	[%i1+0x19c],%l4		! %l4 = 00000000c7223698
p2_b188:
!	call to call_3, CWP = 0
	call	p2_call_3_he
!	%l1 = ffffffffffff7614, Mem[0000000019000008] = 000000d3
	stwa	%l1,[%i2+%o6]0x80	! Mem[0000000019000008] = ffff7614
!	Registers modified during the branch to p2_call_3
!	%l1  = 00000000c7223594
!	%l2  = ffffffff00fff83e
!	%l5  = 0000000000000000
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l0 = 00000000ff0007c1, Mem[000000001a000008] = f6b7b3e1
	stba	%l0,[%i4+%o6]0x80	! Annulled
p2_b189:

p2_label_159:
	bneg,a	p2_b190			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000031000020] = 7c6fc473, %l5 = 0000000000000000
	swap	[%o2+0x020],%l5		! %l5 = 000000007c6fc473
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x0be,%g2
p2_b190:
	membar	#Sync			! Added by membar checker (535)
	set	p2_b191,%o7
	fbne,a,pt %fcc3,p2_near_0_he	! Branch Taken, %fcc3 = 3
!	Mem[0000000019000008] = ffff7614, %l6 = 0000000000000000
	ldsba	[%i2+%o6]0x80,%l6	! %l6 = ffffffffffffffff
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0bf,%g2
p2_b191:
!	Registers modified during the branch to p2_near_0
!	%l0  = ffffffff00fff057
!	%l1  = 0000000000000000
!	%l3  = ffffffff44b20d14
!	%l7  = 0000000000000000
	set	p2_b192,%o7
	fbuge,a	p2_far_2_le	! Branch Taken, %fcc0 = 2

p2_label_160:
!	%l5 = 000000007c6fc473, Mem[0000000031800060] = b604127d
	stb	%l5,[%o3+0x060]		! Mem[0000000031800060] = 7304127d
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x0c0,%g2
p2_b192:
!	Registers modified during the branch to p2_far_2
!	%l4  = 0000000048bf3390
!	%l7  = 00000000000000ff
	bl	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000018000000] = 00000000, %l3 = ffffffff44b20d14
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
p2_b193:
	set	p2_b194,%o7
	fbuge,a	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031000066] = 0001f047, %l4 = 0000000048bf3390
	ldstub	[%o2+0x066],%l4		! %l4 = 00000000000000f0
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0c2,%g2
p2_b194:
!	Registers modified during the branch to p2_far_0
!	%l4  = 000000000001ffe0
!	%l7  = 000000000000091b

p2_label_161:
	membar	#Sync			! Added by membar checker (536)
!	Denormal Floating Point Operation Nullified
	nop
!	%l3 = 0000000000000000, %l0 = ffffffff00fff057, %l7 = 000000000000091b
	sll	%l3,%l0,%l7		! %l7 = 0000000000000000
!	%f25 = b6000000, %f1  = b6000000, %f28 = ffffffff
	fdivs	%f25,%f1 ,%f28		! %f28 = 3f800000
!	Mem[0000000018000128] = 730ed353, %l2 = ffffffff00fff83e
	ldsw	[%i0+0x128],%l2		! %l2 = 00000000730ed353
!	%l3 = 0000000000000000, immed = 00000593, %l2 = 00000000730ed353
	sub	%l3,0x593,%l2		! %l2 = fffffffffffffa6d

p2_label_162:
	bl,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000030800020] = 00000000, %l4 = 000000000001ffe0
	lduw	[%o1+0x020],%l4		! Annulled
p2_b195:
	membar	#Sync			! Added by membar checker (537)
!	Mem[0000000019000064] = 9ffea5a3, %l5 = 000000007c6fc473
	ldsba	[%i2+0x066]%asi,%l5	! %l5 = ffffffffffffffa5
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000019800008] = 818ebc3c fffff047
	stda	%l6,[%i3+%o6]0x80	! Mem[0000000019800008] = ffffffff 00000000
!	Mem[0000000018000008] = ff007af1, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o6]0x80,%l6	! %l6 = 00000000000000ff

p2_label_163:
!	Mem[000000003080006c] = 818ebc3c, %l3 = 0000000000000000
	ldub	[%o1+0x06d],%l3		! %l3 = 000000000000008e
!	%f8  = 40000000, %f14 = 940bde0b 3f800000
	fstox	%f8 ,%f14		! %f14 = 00000000 00000002
!	%l6 = 000000ff, %l7 = 00000000, Mem[00000000190000e8] = 5adcb052 ac1c4bfc
	std	%l6,[%i2+0x0e8]	! Mem[00000000190000e8] = 000000ff 00000000
!	Mem[0000000018800000] = 846fc473, %l2 = fffffffffffffa6d
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000846fc473
!	%f31 = 3f800000, %f10 = 36a383a7 6865ce40
	fstox	%f31,%f10		! %f10 = 00000000 00000001

p2_label_164:
!	%f0  = fffffea7 b6000000, %f0  = fffffea7 b6000000
	fxtod	%f0 ,%f0 		! %f0  = c27584a0 00000000
!	Mem[00000000190001ec] = d971f5db, %l3 = 0000008e, %l0 = 00fff057
	add	%i2,0x1ec,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000d971f5db
!	Mem[0000000018800008] = ff0007c1, %l7 = 0000000000000000
	lduha	[%i1+%o6]0x80,%l7	! %l7 = 000000000000ff00
!	%f0  = c27584a0 00000000, %f26 = 7fffffff fffffea7, %f16 = a08ede4b 1e46fe0d
	fmuld	%f0 ,%f26,%f16		! %f16 = 7fffffff fffffea7
!	%l7 = 000000000000ff00, %l1 = 0000000000000000, %l5 = ffffffffffffffa5
	sra	%l7,%l1,%l5		! %l5 = 000000000000ff00

p2_label_165:
	set	p2_b196,%o7
	fbg,a	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001a800120] = 192c0075 5f611e6b aa362f81 cb1d2dff
	prefetch [%i5+0x120],21
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p2_branch_failed
	mov	0x0c4,%g2
p2_b196:
!	Registers modified during the branch to p2_far_0
!	%l4  = ffffffffffb2e3eb
!	%l7  = 00000000000009a9
	set	p2_b197,%o7
	fbo	p2_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000019800040] = d2d95289, %l5 = 000000000000ff00
	ldub	[%i3+0x041],%l5		! %l5 = 00000000000000d9
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x0c5,%g2
p2_b197:
!	Registers modified during the branch to p2_far_0
!	%l0  = 0000000000000000
!	%l2  = fffffffffffff56b
!	%l3  = ffffffffff7de3c8
!	%l6  = 00000000818eb384
	membar	#Sync			! Added by membar checker (538)
!	%l1 = 0000000000000000, Mem[0000000019800058] = d1df47ef82f6e5ef
	stxa	%l1,[%i3+0x058]%asi	! Mem[0000000019800058] = 0000000000000000

p2_label_166:
!	Mem[0000000018000008] = ff007af1, %l7 = 00000000000009a9
	lduha	[%i0+%o6]0x80,%l7	! %l7 = 000000000000ff00
!	%l0 = 0000000000000000, Mem[000000003000002e] = 0000ff00
	stb	%l0,[%o0+0x02e]		! Mem[000000003000002c] = 00000000
	bpos,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018800000] = fffffa6dffffffff, %l7 = 000000000000ff00
	ldxa	[%i1+%g0]0x80,%l7	! Annulled
p2_b198:
	membar	#Sync			! Added by membar checker (539)
!	Mem[0000000030800068] = bfb6f6dc, %l3 = ffffffffff7de3c8
	ldsha	[%o1+0x068]%asi,%l3	! %l3 = ffffffffffffbfb6

p2_label_167:
!	Mem[0000000018000008] = ff007af1, %l1 = 0000000000000000
	ldsba	[%i0+%o6]0x80,%l1	! %l1 = ffffffffffffffff
!	%l1 = ffffffffffffffff, %l7 = 000000000000ff00, %l2 = fffffffffffff56b
	and	%l1,%l7,%l2		! %l2 = 000000000000ff00
	set	p2_b199,%o7
	fbne,a,pt %fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000018800020] = 6535215c, %l3 = ffffffffffffbfb6
	ldsb	[%i1+0x022],%l3		! %l3 = 0000000000000021
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0c7,%g2
p2_b199:
!	Registers modified during the branch to p2_near_1
!	%l0  = 000000000000ff00
!	%l1  = fffffffffffff1b3
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (540)
!	%l7 = 000000000000ff00, %l6 = 00000000818eb384, %l2 = 0000000000000000
	orcc	%l7,%l6,%l2		! %l2 = 00000000818eff84, %ccr = 08

p2_label_168:
!	Jump to jmpl_2, CWP = 0
	set	p2_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	%l4 = ffffffffffb2e3eb, Mem[0000000019800000] = 00000000
	stwa	%l4,[%i3+%g0]0x80	! Mem[0000000019800000] = ffb2e3eb
!	Registers modified during the branch to p2_jmpl_2
!	%l1  = ffffffff80000000
!	%l2  = 0000feb331071500
!	%l3  = ffffffff80000000
!	%l6  = 0000feb33107234d
!	Mem[0000000018000008] = ff007af1, %l6 = 0000feb33107234d
	ldswa	[%i0+%o6]0x80,%l6	! %l6 = ffffffffff007af1
!	%l5 = 00000000000000d9, %l1 = ffffffff80000000, %l5 = 00000000000000d9
	xorcc	%l5,%l1,%l5		! %l5 = ffffffff800000d9, %ccr = 88
!	Denormal Floating Point Operation Nullified
	nop

p2_label_169:
	set	p2_b200,%o7
	fbg,a	p2_far_2_le	! Branch Taken, %fcc0 = 2
!	%l0 = 000000000000ff00, Mem[0000000018000008] = ff007af1
	stha	%l0,[%i0+%o6]0x80	! Mem[0000000018000008] = ff007af1
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x0c8,%g2
p2_b200:
!	Registers modified during the branch to p2_far_2
!	%l4  = 0000000048bf3390
!	%l7  = 00000000000000ff
	membar	#Sync			! Added by membar checker (541)
!	Mem[00000000190001f2] = 8a1a5c13, %l5 = ffffffff800000d9
	ldstuba	[%i2+0x1f2]%asi,%l5	! %l5 = 000000000000005c
!	%l6 = ffffffffff007af1, %l7 = 00000000000000ff, %l4 = 0000000048bf3390
	srax	%l6,%l7,%l4		! %l4 = ffffffffffffffff
!	%l2 = 0000feb331071500, Mem[0000000019000152] = a9ebc811
	stha	%l2,[%i2+0x152]%asi	! Mem[0000000019000150] = a9eb1500

p2_label_170:
!	%l7 = 00000000000000ff, %l5 = 000000000000005c, %y  = 0000feb3
	smul	%l7,%l5,%l3		! %l3 = 0000000000005ba4
!	%l2 = 0000feb331071500, %l6 = ffffffffff007af1, %l0 = 000000000000ff00
	xnorcc	%l2,%l6,%l0		! %l0 = 0000feb331f8900e, %ccr = 00
!	Branch On Register, %l4 = ffffffffffffffff
	brgez,pt %l4,p2_not_taken_0	! Branch Not Taken
!	%l4 = ffffffffffffffff, Mem[0000000019000080] = a6f617625f0452b5
	stx	%l4,[%i2+0x080]		! Mem[0000000019000080] = ffffffffffffffff
p2_b201:
	membar	#Sync			! Added by membar checker (542)
!	%l7 = 00000000000000ff, %l6 = ffffffffff007af1, %y  = 00000000
	udiv	%l7,%l6,%l3		! %l3 = 0000000000000000

p2_label_171:
!	Mem[0000000019000160] = 2cd99b7b 2bb7f8cb c1935c10 424a634d
	prefetcha [%i2+0x160]%asi,2
	set	p2_b202,%o7
	fbg,a	p2_far_1_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000019800008] = ffffffff, %l1 = ffffffff80000000
	swapa	[%i3+%o6]0x80,%l1	! %l1 = 00000000ffffffff
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0ca,%g2
p2_b202:
!	Registers modified during the branch to p2_far_1
!	%l0  = 0000000000000000
!	%l7  = fffffffffffff1ab
	membar	#Sync			! Added by membar checker (543)
!	Branch On Register, %l2 = 0000feb331071500
	brlez,a,pn %l2,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019800080] = e1edb0cc 0c700251 2a23f03b 665229bc
	prefetch [%i3+0x080],2	! Annulled
p2_b203:

p2_label_172:
	membar	#Sync			! Added by membar checker (544)
!	Mem[0000000019800000] = ffb2e3eb ffffffff 80000000 00000000
	prefetcha [%i3+0x000]%asi,16
	fbe,pn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018000000] = 44b20d14, %l0 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 0000000044b20d14
p2_b204:
	membar	#Sync			! Added by membar checker (545)
!	%l2 = 0000feb331071500, immed = fffff9f4, %y  = 00000000
	udivcc	%l2,-0x60c,%l4		! %l4 = 0000000000000000, %ccr = 44
	bgu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44

p2_label_173:
!	Mem[0000000018800000] = fffffa6d, %l7 = fffffffffffff1ab
	ldstuba	[%i1+%g0]0x80,%l7	! Annulled
p2_b205:
	membar	#Sync			! Added by membar checker (546)
!	%l1 = 00000000ffffffff, Mem[0000000018000080] = 8d18612c24e14ab8
	stxa	%l1,[%i0+0x080]%asi	! Mem[0000000018000080] = 00000000ffffffff
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l6 = ff007af1, %l7 = fffff1ab, Mem[0000000031000068] = 00000000 000007d1
	std	%l6,[%o2+0x068]	! Annulled
p2_b206:
	membar	#Sync			! Added by membar checker (547)
!	%l3 = 0000000000000000, immed = 0000000b, %l0 = 0000000044b20d14
	srlx	%l3,0x00b,%l0		! %l0 = 0000000000000000

p2_label_174:
!	Mem[0000000019800000] = ffb2e3eb, %l2 = 0000feb331071500
	ldsha	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffb2
	fblg,pt	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[00000000180000f0] = 3b8b4094, %l1 = 00000000ffffffff
	lduw	[%i0+0x0f0],%l1		! %l1 = 000000003b8b4094
p2_b207:
!	Jump to jmpl_1, CWP = 0
	set	p2_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000030800060] = 00000c18, %l5 = 000000000000005c
	lduw	[%o1+0x060],%l5		! %l5 = 0000000000000c18
!	Registers modified during the branch to p2_jmpl_1
!	%l2  = 0000000000000000
!	%l5  = 0000000000000000
!	%l6  = 000000000000007d

p2_label_175:
	membar	#Sync			! Added by membar checker (548)
!	%l0 = 0000000000000000, immed = 00000cd1, %l3 = 0000000000000000
	and	%l0,0xcd1,%l3		! %l3 = 0000000000000000
	nop
!	Mem[0000000018000078] = 644bf77e, %l5 = 0000000000000000
	ldsw	[%i0+0x078],%l5		! %l5 = 00000000644bf77e
	ble,a	p2_b208			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000018800000] = fffffa6d, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0d0,%g2
p2_b208:

p2_label_176:
	membar	#Sync			! Added by membar checker (549)
!	%l3 = 0000000000000000, immed = fffff4b4, %l6 = 000000000000007d
	xor	%l3,-0xb4c,%l6		! %l6 = fffffffffffff4b4
!	%l3 = 0000000000000000
	setx	0x4e7a38f84e7a38f8,%g7,%l3 ! %l3 = 4e7a38f84e7a38f8
!	Mem[0000000018800000] = fffffa6dffffffff, %l4 = ffffffffffffffff
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = fffffa6dffffffff
!	Mem[0000000019000008] = ffff7614, %l2 = 0000000000000000
	swapa	[%i2+%o6]0x80,%l2	! %l2 = 00000000ffff7614
	set	p2_b209,%o7
	fbo,pt	%fcc1,p2_near_1_he	! Branch Taken, %fcc1 = 1

p2_label_177:
!	Mem[0000000030000028] = 5db827fc, %l7 = fffffffffffff1ab
	swap	[%o0+0x028],%l7		! %l7 = 000000005db827fc
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0d1,%g2
p2_b209:
!	Registers modified during the branch to p2_near_1
!	%l3  = 00000000000ada20
!	%l4  = 000000005db8265b
!	%l7  = 000000005db8265b
	set	p2_b210,%o7
	fbne,a	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	%l4 = 000000005db8265b, Mem[00000000188000f2] = 9d17887e
	sth	%l4,[%i1+0x0f2]		! Mem[00000000188000f0] = 9d17265b
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x0d2,%g2
p2_b210:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000000
!	%l7  = 00000000000ae33b
	membar	#Sync			! Added by membar checker (550)
!	Mem[0000000019800000] = ffb2e3eb ffffffff, %l2 = ffff7614, %l3 = 000ada20
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffb2e3eb 00000000ffffffff
!	Mem[0000000030000068] = 48bf3390, %l1 = 000000003b8b4094
	lduw	[%o0+0x068],%l1		! %l1 = 0000000048bf3390

p2_label_178:
!	Mem[0000000019800008] = 80000000, %l7 = 00000000000ae33b
	ldswa	[%i3+%o6]0x80,%l7	! %l7 = ffffffff80000000
	set	p2_b211,%o7
	fbug,pt	%fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000019000000] = 80eb7b1a, %l7 = ffffffff80000000
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 00000000000080eb
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x0d3,%g2
p2_b211:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000000
!	%l1  = 0000000048bf3190
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (551)
!	%l3 = 00000000ffffffff, immed = 000005ef, %l4 = 0000000000000000
	xnor	%l3,0x5ef,%l4		! %l4 = ffffffff000005ef
!	Mem[0000000018000090] = 00000000 000080eb, %l2 = 0000000000000000, %l3 = 00000000ffffffff
	add	%i0,0x90,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 61ff752512c754d3

p2_label_179:
!	Mem[0000000019000160] = 2cd99b7b 2bb7f8cb c1935c10 424a634d
	prefetcha [%i2+0x160]%asi,21
!	%f19 = 3f800000, %f6  = 3f800000 7639adda
	fstox	%f19,%f6 		! %f6  = 00000000 00000001
!	Mem[0000000032000020] = 881b2ad7 861878d1 a4176408 4b729f64
	prefetcha [%o4+0x020]%asi,21
!	Mem[000000003100002c] = 00000000, %l3 = 61ff752512c754d3
	swap	[%o2+0x02c],%l3		! %l3 = 0000000000000000
	fbu,a,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1

p2_label_180:
!	Mem[0000000018800008] = ff0007c1, %l3 = 0000000000000000
	ldsba	[%i1+%o6]0x80,%l3	! Annulled
p2_b212:
	membar	#Sync			! Added by membar checker (552)
!	%l6 = fffffffffffff4b4, %l7 = 00000000000080eb, %l0 = 0000000000000000
	addcc	%l6,%l7,%l0		! %l0 = 000000000000759f, %ccr = 11
	set	p2_b213,%o7
	fba	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	%l4 = ffffffff000005ef, Mem[0000000030800060] = 00000c18
	stw	%l4,[%o1+0x060]		! Mem[0000000030800060] = 000005ef
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x0d5,%g2
p2_b213:
!	Registers modified during the branch to p2_far_0
!	%l4  = 00000000000000eb
!	%l7  = 000000000000091c
	membar	#Sync			! Added by membar checker (553)
!	Mem[0000000031000020] = 00000000ffffffff, %l6 = fffffffffffff4b4
	ldx	[%o2+0x020],%l6		! %l6 = 00000000ffffffff

p2_label_181:
!	%l7 = 000000000000091c, Mem[0000000018800000] = fffffa6d
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000018800000] = 091cfa6d
!	%l6 = 00000000ffffffff, %l2 = 0000000000000000, %l4 = 00000000000000eb
	srax	%l6,%l2,%l4		! %l4 = 00000000ffffffff
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000032000050] = a93c5722 4de4a579, %l2 = 00000000, %l3 = 00000000
	ldd	[%o4+0x050],%g2		! %l2 = 0000000000000000 0000000000000000
!	Registers modified during the branch to p2_jmpl_3
!	%l1  = 0000000000000000
!	%l2  = 000000000000001a
!	%l5  = 0000000000000000
!	%f31 = 3f800000, %f11 = 00000001
	fstoi	%f31,%f11		! %f11 = 00000001

p2_label_182:
	bpos	p2_b214			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000018800100] = db332de9 08d0e4bb 9d257e12 ce790e14
	prefetch [%i1+0x100],23
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p2_branch_failed
	mov	0x0d6,%g2
p2_b214:
	membar	#Sync			! Added by membar checker (554)
!	%l6 = 00000000ffffffff, %l5 = 0000000000000000, %y  = 00000000
	umulcc	%l6,%l5,%l1		! %l1 = 0000000000000000, %ccr = 44
!	%l1 = 0000000000000000, immed = 00000012, %l4 = 00000000ffffffff
	sll	%l1,0x012,%l4		! %l4 = 0000000000000000
!	Branch On Register, %l0 = 000000000000759f
	brnz,pt	%l0,p2_b215		! Branch Taken

p2_label_183:
!	Mem[0000000018800140] = e04ad260 b6b83f4f da3fc704 7dbf7425
	prefetch [%i1+0x140],16
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x0d7,%g2
p2_b215:
	membar	#Sync			! Added by membar checker (555)
!	%l3 = 0000000000000000, %l2 = 000000000000001a, %l1 = 0000000000000000
	and	%l3,%l2,%l1		! %l1 = 0000000000000000
!	%f26 = 7fffffff, %f15 = 00000002
	fnegs	%f26,%f15		! %f15 = ffffffff
!	Mem[0000000018000000] = 44b20d14, %l2 = 000000000000001a
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000044
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_184:
!	Mem[0000000018800180] = 659ae390 7c0b0147 aaf4a4c2 9fa6410e
	prefetch [%i1+0x180],2	! Annulled
p2_b216:
	membar	#Sync			! Added by membar checker (556)
	fble,pt	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[0000000018000008] = ff007af1, %l0 = 000000000000759f
	lduwa	[%i0+%o6]0x80,%l0	! %l0 = 00000000ff007af1
p2_b217:
	membar	#Sync			! Added by membar checker (557)
!	%l0 = 00000000ff007af1, %l4 = 0000000000000000, %l2 = 0000000000000044
	andcc	%l0,%l4,%l2		! %l2 = 0000000000000000, %ccr = 44
!	%f1  = 00000000, %f8  = 40000000, %f0  = c27584a0
	fmuls	%f1 ,%f8 ,%f0 		! %f0  = 00000000

p2_label_185:
!	%f8  = 40000000 08c65226, %f8  = 40000000 08c65226
	fabsd	%f8 ,%f8 		! %f8  = 40000000 08c65226
	set	p2_b218,%o7
	fba,a,pt %fcc2,p2_near_3_le	! Branch Taken, %fcc2 = 1
!	%l3 = 0000000000000000, Mem[0000000030800024] = c34bbf85
	stw	%l3,[%o1+0x024]		! Annulled
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p2_branch_failed
	mov	0x0da,%g2
p2_b218:
!	Registers modified during the branch to p2_near_3
!	%l1  = 00000000ff007af1
!	%l4  = 0000000000000000
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (558)
!	Mem[0000000019800180] = 9738bb7d 085e9193 9ca7bab2 21ebb21d
	prefetcha [%i3+0x180]%asi,1
	set	p2_b219,%o7
	fbule,a,pt %fcc1,p2_near_1_le	! Branch Taken, %fcc1 = 1

p2_label_186:
!	Mem[000000003000002c] = 644bf77e, %l6 = 00000000ffffffff
	swap	[%o0+0x02c],%l6		! %l6 = 00000000644bf77e
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x0db,%g2
p2_b219:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000000
!	%l1  = 00000000ff0070b1
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (559)
!	%f15 = ffffffff, %f5  = 7639adda
	fitos	%f15,%f5 		! %f5  = bf800000
	ba,a	p2_b220			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000032000060] = 0818b15de53da238, %l3 = 0000000000000000
	ldx	[%o4+0x060],%g2		! Annulled
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0dc,%g2
p2_b220:
	membar	#Sync			! Added by membar checker (560)
!	Mem[000000003000006c] = 00007970, %l0 = 0000000000000000
	lduba	[%o0+0x06c]%asi,%l0	! %l0 = 0000000000000000

p2_label_187:
!	%f12 = 00000000, %f31 = 3f800000, %f19 = 3f800000
	fdivs	%f12,%f31,%f19		! %f19 = 00000000
!	Denormal Floating Point Operation Nullified
	nop
!	%l5 = 0000000000000000, immed = 0000079c, %y  = 00000000
	udiv	%l5,0x79c,%l2		! %l2 = 0000000000000000
!	%l3 = 0000000000000000, immed = 00000f91, %l2 = 0000000000000000
	andn	%l3,0xf91,%l2		! %l2 = 0000000000000000
	set	p2_b221,%o7
	fbne,a,pt %fcc1,p2_near_1_le	! Branch Taken, %fcc1 = 1

p2_label_188:
!	Mem[0000000018800028] = eb892e0d, %l0 = 0000000000000000
	lduh	[%i1+0x02a],%l0		! %l0 = 0000000000002e0d
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0dd,%g2
p2_b221:
!	Registers modified during the branch to p2_near_1
!	%l0  = 0000000000000000
!	%l1  = 00000000ff0070b1
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (561)
!	Mem[0000000031000068] = 00000000, %l6 = 00000000644bf77e
	ldsw	[%o2+0x068],%l6		! %l6 = 0000000000000000
!	%f8  = 40000000 08c65226, %f26 = 7fffffff fffffea7
	fcmped	%fcc1,%f8 ,%f26		! %fcc1 = 3
!	%l2 = 0000000000000000, immed = fffffe4d, %y  = 00000000
	sdivx	%l2,-0x1b3,%l3		! %l3 = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000198000a0] = bfff7b4a
	stw	%l0,[%i3+0x0a0]		! Mem[00000000198000a0] = 00000000

p2_label_189:
!	%l0 = 0000000000000000, %l6 = 0000000000000000, %l0 = 0000000000000000
	andn	%l0,%l6,%l0		! %l0 = 0000000000000000
	fbg,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[0000000032000064] = e53da238, %l3 = 0000000000000000
	ldsw	[%o4+0x064],%g2		! Annulled
p2_b222:
	membar	#Sync			! Added by membar checker (562)
!	%l0 = 0000000000000000, %l7 = 000000000000091c, %y  = 00000000
	sdivx	%l0,%l7,%l6		! %l6 = 0000000000000000
!	Branch On Register, %l6 = 0000000000000000
	brz,a,pn %l6,p2_b223		! Branch Taken

p2_label_190:
!	Mem[0000000019000008] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x0df,%g2
p2_b223:
	membar	#Sync			! Added by membar checker (563)
!	%l7 = 000000000000091c, Mem[0000000019800008] = 8000000000000000
	stxa	%l7,[%i3+%o6]0x80	! Mem[0000000019800008] = 000000000000091c
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000019800000] = ffb2e3eb ffffffff
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000000 00000000
	nop
!	%f22 = c3ac8000, %f24 = 00000000
	fcmps	%fcc2,%f22,%f24		! %fcc2 = 1

p2_label_191:
!	%l2 = 0000000000000000, Mem[0000000018800008] = ff0007c1ffff7614
	stxa	%l2,[%i1+%o6]0x80	! Mem[0000000018800008] = 0000000000000000
!	Mem[0000000032000038] = 5506e65d 8e654ab1, %l2 = 00000000, %l3 = 00000000
	ldd	[%o4+0x038],%g2		! %l2 = 0000000000000000 0000000000000000
!	%f12 = 00000000 00000001, %f24 = 00000000 b6000000
	fxtod	%f12,%f24		! %f24 = 3ff00000 00000000
!	%f6  = 00000000 00000001, %f26 = 7fffffff fffffea7
	fxtod	%f6 ,%f26		! %f26 = 3ff00000 00000000
!	%l6 = 0000000000000000, immed = 00000035, %l0 = 0000000000000000
	srax	%l6,0x035,%l0		! %l0 = 0000000000000000

p2_label_192:
!	Mem[0000000019000174] = 8c9e0c49, %l4 = 0000000000000000
	ldsw	[%i2+0x174],%l4		! %l4 = ffffffff8c9e0c49
!	Mem[0000000018000008] = ff007af1, %l1 = 00000000ff0070b1
	ldsba	[%i0+%o6]0x80,%l1	! %l1 = ffffffffffffffff
	set	p2_b224,%o7
	fbg,pn	%fcc0,p2_near_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000018800000] = 091cfa6d, %l7 = 000000000000091c
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000009
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x0e0,%g2
p2_b224:
!	Registers modified during the branch to p2_near_2
!	%l0  = 0000000000000000
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l6  = fffffffffffffae1
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (564)
!	%f5  = bf800000, %f17 = fffffea7
	fcmpes	%fcc3,%f5 ,%f17		! %fcc3 = 3

p2_label_193:
!	%l5 = 0000000000000000, Mem[0000000030000024] = 00000275
	stba	%l5,[%o0+0x024]%asi	! Mem[0000000030000024] = 00000275
!	%l3 = 0000000000000000, immed = fffff7c1, %l4 = ffffffff8c9e0c49
	addcc	%l3,-0x83f,%l4		! %l4 = fffffffffffff7c1, %ccr = 88
!	Branch On Register, %l2 = 0000000000000000
	brlz,pt	%l2,p2_not_taken_0	! Branch Not Taken
!	Mem[00000000190000b0] = 5744bd86, %l7 = 0000000000000000
	ldsb	[%i2+0x0b0],%l7		! %l7 = 0000000000000057
p2_b225:
	membar	#Sync			! Added by membar checker (565)
!	Mem[0000000032000020] = 881b2ad7 861878d1 a4176408 4b729f64
	prefetcha [%o4+0x020]%asi,23

p2_label_194:
!	Branch On Register, %l3 = 0000000000000000
	brgez,pt %l3,p2_b226		! Branch Taken
!	Mem[0000000032000040] = c78fef2b 03faa03c b4eadc8a 53902166
	prefetch [%o4+0x040],16
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p2_branch_failed
	mov	0x0e2,%g2
p2_b226:
	membar	#Sync			! Added by membar checker (566)
!	%l0 = 0000000000000000, immed = 00000862, %y  = 00000000
	umul	%l0,0x862,%l7		! %l7 = 0000000000000000
	fbo,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[0000000018000040] = ab3f0d18 f0236eae 0a3ccbe3 9f22183d
	prefetch [%i0+0x040],4
p2_b227:

p2_label_195:
	set	p2_b228,%o7
	fbge	p2_far_1_he	! Branch Taken, %fcc0 = 2
!	Mem[00000000180000b8] = 1fe42d31, %l2 = 0000000000000000
	ldsb	[%i0+0x0bb],%l2		! %l2 = 0000000000000031
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p2_branch_failed
	mov	0x0e4,%g2
p2_b228:
!	Registers modified during the branch to p2_far_1
!	%l0  = 0000000000000000
!	%l7  = fffffffffffff1ab
	membar	#Sync			! Added by membar checker (567)
!	%f26 = 3ff00000, %f6  = 00000000
	fcmpes	%fcc3,%f26,%f6 		! %fcc3 = 2
!	Mem[000000003200007c] = fe093a5d, %l5 = 0000000000000000
	lduw	[%o4+0x07c],%g2		! %g2 = 0000000000000000
!	%l6 = fffffffffffffae1, %l0 = 0000000000000000, %l6 = fffffffffffffae1
	taddcc	%l6,%l0,%l6		! %l6 = fffffffffffffae1, %ccr = 8a

p2_label_196:
!	%l3 = 0000000000000000, Mem[0000000031800068] = fffffae7
	stb	%l3,[%o3+0x068]		! Mem[0000000031800068] = 00fffae7
!	%l5 = 0000000000000000, %l0 = 0000000000000000, %l0 = 0000000000000000
	addc	%l5,%l0,%l0		! %l0 = 0000000000000000
!	Mem[00000000180000bc] = e4742de5, %l2 = 0000000000000031
	ldsha	[%i0+0x0bc]%asi,%l2	! %l2 = ffffffffffffe474
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l3 = 0000000000000000, Mem[0000000032000045] = faa03cb4
	stb	%l3,[%o4+0x045]		! Annulled
p2_b229:

p2_label_197:
	membar	#Sync			! Added by membar checker (568)
!	%f16 = 7fffffff fffffea7, %f20 = c27584a0 00000000
	fcmpd	%fcc1,%f16,%f20		! %fcc1 = 3
!	%f29 = fffffea7, %f24 = 3ff00000
	fcmps	%fcc2,%f29,%f24		! %fcc2 = 3
!	%f18 = 140bde0b 00000000, %f20 = c27584a0 00000000
	fabsd	%f18,%f20		! %f20 = 140bde0b 00000000
!	%l2 = ffffffffffffe474, Mem[000000003080006a] = bfb6f6dc
	stb	%l2,[%o1+0x06a]		! Mem[0000000030800068] = bfb674dc
!	Mem[0000000019000030] = a4a2337fd53ed026, %l2 = ffffffffffffe474
	ldx	[%i2+0x030],%l2		! %l2 = a4a2337fd53ed026

p2_label_198:
!	%f26 = 3ff00000 00000000, %f22 = c3ac8000 08c65226
	fdtox	%f26,%f22		! %f22 = 00000000 00000001
!	%l5 = 0000000000000000, immed = 00000011, %l3 = 0000000000000000
	srl	%l5,0x011,%l3		! %l3 = 0000000000000000
!	Mem[0000000019800060] = dc1cb79e ac887dfa 1d10ddc4 bebc601e
	prefetcha [%i3+0x060]%asi,1
!	%l5 = 0000000000000000, %l1 = 0000000000000000, %l7 = fffffffffffff1ab
	taddcc	%l5,%l1,%l7		! %l7 = 0000000000000000, %ccr = 44
!	%l2 = a4a2337fd53ed026, Mem[00000000180000c8] = 944b8a32
	stw	%l2,[%i0+0x0c8]		! Mem[00000000180000c8] = d53ed026

p2_label_199:
!	%l1 = 0000000000000000, immed = 0000046a, %l5 = 0000000000000000
	tsubcc	%l1,0x46a,%l5		! %l5 = fffffffffffffb96, %ccr = 9b
	set	p2_b230,%o7
	fblg,pn	%fcc3,p2_near_1_le	! Branch Taken, %fcc3 = 2
!	%l5 = fffffffffffffb96, Mem[00000000190000a8] = fffffae7000000cd
	stx	%l5,[%i2+0x0a8]		! Mem[00000000190000a8] = fffffffffffffb96
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0e6,%g2
p2_b230:
!	Registers modified during the branch to p2_near_1
!	%l0  = a4a2337fd53ed026
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (569)
!	%l5 = fffffffffffffb96, immed = 000006aa, %y  = 00000000
	mulx	%l5,0x6aa,%l4		! %l4 = ffffffffffe2959c
!	Mem[00000000188000a0] = 8bd850be 66b5a15e dad28fa6 fa578e83
	prefetcha [%i1+0x0a0]%asi,4

p2_label_200:
	set	p2_b231,%o7
	fba	p2_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000018000008] = ff007af1, %l6 = fffffffffffffae1
	lduha	[%i0+%o6]0x80,%l6	! %l6 = 000000000000ff00
!	The following code should not be executed
	nop
	ba	p2_branch_failed
	mov	0x0e7,%g2
p2_b231:
!	Registers modified during the branch to p2_far_3
!	%l1  = 0000000000004fdf
!	%l2  = 0000000000009fbe
!	%l4  = 00ffffffffffe295
	membar	#Sync			! Added by membar checker (570)
!	%f26 = 3ff00000 00000000, %f26 = 3ff00000 00000000
	fcmpd	%fcc1,%f26,%f26		! %fcc1 = 0
!	%f19 = 00000000, %f30 = 940bde0b, %f30 = 940bde0b
	fmuls	%f19,%f30,%f30		! %f30 = 80000000
!	%l3 = 0000000000000000, immed = fffff690, %y  = 00000000
	udivcc	%l3,-0x970,%l0		! %l0 = 0000000000000000, %ccr = 44

!	End of Random Code for Processor 2

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x008]		! Set processor 2 done flag

!	Check Registers

p2_check_registers:
	set	p2_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne,a,pn %xcc,p2_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000004fdf
	bne,a,pn %xcc,p2_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000009fbe
	bne,a,pn %xcc,p2_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p2_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00ffffffffffe295
	bne,a,pn %xcc,p2_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be fffffffffffffb96
	bne,a,pn %xcc,p2_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000ff00
	bne,a,pn %xcc,p2_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p2_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p2_check_fp_registers:
	set	p2_temp,%g1
	set	p2_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 00000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be c3ac8000 1e46fe0d
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 140bde0b bf800000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 00000001
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 40000000 08c65226
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000001
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 00000001
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 ffffffff
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 7fffffff fffffea7
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 140bde0b 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 140bde0b 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000001
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 3ff00000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 3ff00000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 3f800000 fffffea7
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 80000000 3f800000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p2_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 44b20d14ffe29b9b
	ldx	[%i0+0x000],%g3		! Observed data at 0000000018000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff007af1fffff4a4
	ldx	[%i0+0x008],%g3		! Observed data at 0000000018000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 07fa28386f95f13c
	ldx	[%i0+0x068],%g3		! Observed data at 0000000018000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x080],%g2		! Expect data = 00000000ffffffff
	ldx	[%i0+0x080],%g3		! Observed data at 0000000018000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 61ff752512c754d3
	ldx	[%i0+0x090],%g3		! Observed data at 0000000018000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 00000004fffffffe
	ldx	[%i0+0x0c0],%g3		! Observed data at 00000000180000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = d53ed0261e0c3820
	ldx	[%i0+0x0c8],%g3		! Observed data at 00000000180000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 00000000d63ad822
	ldx	[%i0+0x0f8],%g3		! Observed data at 00000000180000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f8,%g4
	ldx	[%g1+0x150],%g2		! Expect data = 6f95f13c0000098d
	ldx	[%i0+0x150],%g3		! Observed data at 0000000018000150
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x160],%g2		! Expect data = 1c007678a4263eda
	ldx	[%i0+0x160],%g3		! Observed data at 0000000018000160
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x190],%g2		! Expect data = a435ffca0f0e2768
	ldx	[%i0+0x190],%g3		! Observed data at 0000000018000190
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = ffff817fb200c000
	ldx	[%i0+0x1b8],%g3		! Observed data at 00000000180001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b8,%g4
	ldx	[%g1+0x1c8],%g2		! Expect data = 21ff33ddd5c84d9a
	ldx	[%i0+0x1c8],%g3		! Observed data at 00000000180001c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1c8,%g4

	set	p2_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff1cfa6dffffffff
	ldx	[%i1+0x000],%g3		! Observed data at 0000000018800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000000000
	ldx	[%i1+0x008],%g3		! Observed data at 0000000018800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 378b2e79818ebc3c
	ldx	[%i1+0x048],%g3		! Observed data at 0000000018800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x050],%g2		! Expect data = b487ca887c6fc473
	ldx	[%i1+0x050],%g3		! Observed data at 0000000018800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 00000000000000ff
	ldx	[%i1+0x0c0],%g3		! Observed data at 00000000188000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = 9d17265be3cadba4
	ldx	[%i1+0x0f0],%g3		! Observed data at 00000000188000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 00005c13ffffffff
	ldx	[%i1+0x120],%g3		! Observed data at 0000000018800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x158],%g2		! Expect data = 00000409807b0084
	ldx	[%i1+0x158],%g3		! Observed data at 0000000018800158
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x190],%g2		! Expect data = 0000000000000000
	ldx	[%i1+0x190],%g3		! Observed data at 0000000018800190
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 423b847700000000
	ldx	[%i1+0x198],%g3		! Observed data at 0000000018800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 875affb2a94deca9
	ldx	[%i1+0x1f8],%g3		! Observed data at 00000000188001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f8,%g4

	set	p2_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 80eb7b1affac1430
	ldx	[%i2+0x000],%g3		! Observed data at 0000000019000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 00000000ffffffff
	ldx	[%i2+0x008],%g3		! Observed data at 0000000019000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 840152a188b9da6e
	ldx	[%i2+0x010],%g3		! Observed data at 0000000019000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x028],%g2		! Expect data = fd62e62eeb6c8824
	ldx	[%i2+0x028],%g3		! Observed data at 0000000019000028
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 0000098d818eb384
	ldx	[%i2+0x078],%g3		! Observed data at 0000000019000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x080],%g2		! Expect data = ffffffffffffffff
	ldx	[%i2+0x080],%g3		! Observed data at 0000000019000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 3282f65200000004
	ldx	[%i2+0x0a0],%g3		! Observed data at 00000000190000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = fffffffffffffb96
	ldx	[%i2+0x0a8],%g3		! Observed data at 00000000190000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = d02407553cffc3e6
	ldx	[%i2+0x0d0],%g3		! Observed data at 00000000190000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = bc3820fffcacb914
	ldx	[%i2+0x0d8],%g3		! Observed data at 00000000190000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 000000ff00000000
	ldx	[%i2+0x0e8],%g3		! Observed data at 00000000190000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x100],%g2		! Expect data = 00000000000000e5
	ldx	[%i2+0x100],%g3		! Observed data at 0000000019000100
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x130],%g2		! Expect data = fffffbb2818eb384
	ldx	[%i2+0x130],%g3		! Observed data at 0000000019000130
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x150],%g2		! Expect data = a9eb15005ca74c94
	ldx	[%i2+0x150],%g3		! Observed data at 0000000019000150
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x168],%g2		! Expect data = c1935c10424a634d
	ldx	[%i2+0x168],%g3		! Observed data at 0000000019000168
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = a500abcb1cb5ae5b
	ldx	[%i2+0x1a8],%g3		! Observed data at 00000000190001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 8a1aff13b8f8a373
	ldx	[%i2+0x1f0],%g3		! Observed data at 00000000190001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f0,%g4

	set	p2_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x000],%g3		! Observed data at 0000000019800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 000000000000091c
	ldx	[%i3+0x008],%g3		! Observed data at 0000000019800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 0000000094af9529
	ldx	[%i3+0x048],%g3		! Observed data at 0000000019800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x058],%g3		! Observed data at 0000000019800058
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 00000000c5bc9e66
	ldx	[%i3+0x0a0],%g3		! Observed data at 00000000198000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x118],%g2		! Expect data = b0fb38b887518432
	ldx	[%i3+0x118],%g3		! Observed data at 0000000019800118
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x120],%g2		! Expect data = a410a321ffff1cb8
	ldx	[%i3+0x120],%g3		! Observed data at 0000000019800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 6eed202e00007c6f
	ldx	[%i3+0x128],%g3		! Observed data at 0000000019800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x170],%g2		! Expect data = 818eb3846497bf22
	ldx	[%i3+0x170],%g3		! Observed data at 0000000019800170
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = e85207887428481e
	ldx	[%i3+0x1b8],%g3		! Observed data at 00000000198001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b8,%g4

	set	p2_local4_expect,%g1
	ldx	[%g1+0x070],%g2		! Expect data = 2661c5fc732abe89
	ldx	[%i4+0x070],%g3		! Observed data at 000000001a000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = fff0d5c8f21c9afe
	ldx	[%i4+0x1a0],%g3		! Observed data at 000000001a0001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a0,%g4

	set	p2_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 007accc21ef6fa8a
	ldx	[%i5+0x000],%g3		! Observed data at 000000001a800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff5d0fa351b6314c
	ldx	[%i5+0x008],%g3		! Observed data at 000000001a800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4

	set	p2_local6_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 57ad8b4e0000098d
	ldx	[%i6+0x000],%g3		! Observed data at 000000001b000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p2_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p2_memcheck_share0:
	ldx	[%g4+0x20],%g2	! Expected value = 0000474800000275
	ldx	[%o0+0x20],%g3	! Read value at Mem[0000000030000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = fffff1abffffffff
	ldx	[%o0+0x28],%g3	! Read value at Mem[0000000030000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = e5c5fb53ffd2ff00
	ldx	[%o0+0x60],%g3	! Read value at Mem[0000000030000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = ffffe295fffffb96
	ldx	[%o0+0x68],%g3	! Read value at Mem[0000000030000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p2_memcheck_share1:
	ldx	[%g4+0x20],%g2	! Expected value = 00000000c34bbf85
	ldx	[%o1+0x20],%g3	! Read value at Mem[0000000030800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 00000000818eb384
	ldx	[%o1+0x28],%g3	! Read value at Mem[0000000030800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 000005efffffffbc
	ldx	[%o1+0x60],%g3	! Read value at Mem[0000000030800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = bfb674dc818ebc3c
	ldx	[%o1+0x68],%g3	! Read value at Mem[0000000030800068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p2_memcheck_share2:
	ldx	[%g4+0x20],%g2	! Expected value = 00000000ffffffff
	ldx	[%o2+0x20],%g3	! Read value at Mem[0000000031000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 0000000012c754d3
	ldx	[%o2+0x28],%g3	! Read value at Mem[0000000031000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = fae110ef0001ff47
	ldx	[%o2+0x60],%g3	! Read value at Mem[0000000031000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 00000000000007d1
	ldx	[%o2+0x68],%g3	! Read value at Mem[0000000031000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p2_memcheck_share3:
	ldx	[%g4+0x20],%g2	! Expected value = 0000818effffff83
	ldx	[%o3+0x20],%g3	! Read value at Mem[0000000031800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 00000233ffffff00
	ldx	[%o3+0x28],%g3	! Read value at Mem[0000000031800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 7304127d0dc3ce87
	ldx	[%o3+0x60],%g3	! Read value at Mem[0000000031800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 00fffae7ff0007c1
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
	sll	%l3,%l1,%l3
	prefetch [%i2+0x1a0],0
	ldsb	[%o2+0x02b],%l3		! Mem[000000003100002b]
	ldsh	[%i2+0x024],%l7		! Mem[0000000019000024]
	prefetch [%i0+0x1e0],21
	sdivcc	%l0,-0x3e1,%l0
	done

p2_trap1o:
	sll	%l3,%l1,%l3
	prefetch [%o2+0x1a0],0
	ldsb	[%i2+0x02b],%l3		! Mem[000000003100002b]
	ldsh	[%o2+0x024],%l7		! Mem[0000000019000024]
	prefetch [%o0+0x1e0],21
	sdivcc	%l0,-0x3e1,%l0
	done


p2_trap2e:
	sllx	%l5,0x01b,%l4
	mulx	%l0,-0xa89,%l6
	smulcc	%l7,%l5,%l4
	umulcc	%l0,-0x0b9,%l3
	done

p2_trap2o:
	sllx	%l5,0x01b,%l4
	mulx	%l0,-0xa89,%l6
	smulcc	%l7,%l5,%l4
	umulcc	%l0,-0x0b9,%l3
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
	ldx	[%g1+0x000],%l0	! %l0 = b188ce0020e54ef2
	ldx	[%g1+0x008],%l1	! %l1 = 8e4c18000c7789ed
	ldx	[%g1+0x010],%l2	! %l2 = ef11c5ffa8142266
	ldx	[%g1+0x018],%l3	! %l3 = 0ca7ff000802fb48
	ldx	[%g1+0x020],%l4	! %l4 = da9663ffdba9f716
	ldx	[%g1+0x028],%l5	! %l5 = 52847bffc66dae5c
	ldx	[%g1+0x030],%l6	! %l6 = 893bfd0057ad8b4e
	ldx	[%g1+0x038],%l7	! %l7 = b2bc60fff09c6b1f

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
	ldd	[%g1+0x00],%f0		! %f0  = 14211f3f, %f1  = 3ef9477e
	ldd	[%g1+0x08],%f2		! %f2  = 1505b9a3, %f3  = f8dd440d
	ldd	[%g1+0x10],%f4		! %f4  = 23c6fb97, %f5  = 68473596
	ldd	[%g1+0x18],%f6		! %f6  = 7fbc38c6, %f7  = 3bbcdebd
	ldd	[%g1+0x20],%f8		! %f8  = 3b1196c3, %f9  = 3512add5
	ldd	[%g1+0x28],%f10		! %f10 = e2ba4774, %f11 = 07861984
	ldd	[%g1+0x30],%f12		! %f12 = 7416790c, %f13 = 51ab13be
	ldd	[%g1+0x38],%f14		! %f14 = 4a487859, %f15 = 1b01cadd
	ldd	[%g1+0x40],%f16		! %f16 = e78f218d, %f17 = 22e0cc01
	ldd	[%g1+0x48],%f18		! %f18 = 0c85cda4, %f19 = 7341e08e
	ldd	[%g1+0x50],%f20		! %f20 = d38509b6, %f21 = 5cdcd0af
	ldd	[%g1+0x58],%f22		! %f22 = 46fca10c, %f23 = f1f75fc7
	ldd	[%g1+0x60],%f24		! %f24 = 6c215494, %f25 = 5acc351a
	ldd	[%g1+0x68],%f26		! %f26 = b626c87e, %f27 = a78a4db4
	ldd	[%g1+0x70],%f28		! %f28 = 99d02909, %f29 = c4a1337c
	ldd	[%g1+0x78],%f30		! %f30 = bc4910b1, %f31 = 10408c9b
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 3

p3_label_1:
!	%l7 = ef9f6e00018b3c33, Mem[000000001d000000] = 491e36db2e56493c
	stxa	%l7,[%i2+%g0]0x80	! Mem[000000001d000000] = ef9f6e00018b3c33
!	%f13 = 51ab13be, %f24 = 6c215494 5acc351a
	fstox	%f13,%f24		! %f24 = 00000015 6277c000
!	Mem[000000001f000000] = 42b40925, %l7 = ef9f6e00018b3c33
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000042
!	%l0 = b6a3ef00369d7afa, immed = ffffff13, %l6 = d5a49e004c9cc338
	xnor	%l0,-0x0ed,%l6		! %l6 = b6a3ef00369d7a16
	bl	p3_not_taken_0		! Branch Not Taken, %ccr = 44

p3_label_2:
!	%l0 = b6a3ef00369d7afa, Mem[0000000030000030] = 77000e8b
	sth	%l0,[%o0+0x030]		! Mem[0000000030000030] = 7afa0e8b
p3_b1:
	membar	#Sync			! Added by membar checker (571)
!	%f4  = 23c6fb97 68473596, %f4  = 23c6fb97 68473596, %f20 = d38509b6 5cdcd0af
	fdivd	%f4 ,%f4 ,%f20		! %f20 = 3ff00000 00000000
!	Mem[000000001d000008] = fedb9424, %l2 = 44102100674b0bb4
	ldswa	[%i2+%o6]0x80,%l2	! %l2 = fffffffffedb9424
!	%l0 = b6a3ef00369d7afa, immed = fffff9aa, %y  = 00000000
	sdiv	%l0,-0x656,%l2		! %l2 = fffffffffff7614f
	fbul	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_3:
!	Mem[0000000030800038] = 67a481ef 7f8a7d38, %l0 = 369d7afa, %l1 = e6a174a5
	ldd	[%o1+0x038],%l0		! %l0 = 0000000067a481ef 000000007f8a7d38
p3_b2:
	membar	#Sync			! Added by membar checker (572)
	fbg,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000038] = 52e86852, %l7 = 0000000000000042
	lduh	[%o0+0x038],%l7		! Annulled
p3_b3:
	membar	#Sync			! Added by membar checker (573)
!	Mem[000000001d800060] = dc76ec7b cb2416e2 b3e73138 6ba1b825
	prefetch [%i3+0x060],22
!	%f21 = 00000000, %f19 = 7341e08e, %f2  = 1505b9a3
	fsubs	%f21,%f19,%f2 		! %f2  = f341e08e

p3_label_4:
!	Mem[000000001c800160] = e2f2211c f229388f e4660f47 e1580b8a
	prefetch [%i1+0x160],4
	fbl	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 0000000067a481ef, Mem[000000001d800000] = 1789e69b334881fb
	stxa	%l0,[%i3+%g0]0x80	! Mem[000000001d800000] = 0000000067a481ef
p3_b4:
	membar	#Sync			! Added by membar checker (574)
!	Mem[000000001c0000c0] = ca5f5b2c 42f2130d 28c635fb 8252f492
	prefetcha [%i0+0x0c0]%asi,4
!	Mem[0000000031000030] = 208c9a4d 8bf7461f, %l2 = fff7614f, %l3 = a40f1271
	ldda	[%o2+0x030]%asi,%l2	! %l2 = 00000000208c9a4d 000000008bf7461f

p3_label_5:
!	Mem[000000001d800008] = 05f99a8a 9b5d633c, %l6 = 369d7a16, %l7 = 00000042
	ldda	[%i3+%o6]0x80,%l6	! %l6 = 0000000005f99a8a 000000009b5d633c
!	%f20 = 3ff00000 00000000, %f16 = e78f218d 22e0cc01, %f26 = b626c87e a78a4db4
	fmuld	%f20,%f16,%f26		! %f26 = e78f218d 22e0cc01
	set	p3_b5,%o7
	fbue	p3_far_1_he	! Branch Taken, %fcc0 = 0
!	%l1 = 000000007f8a7d38, Mem[000000001d000008] = fedb94248e319fc8
	stxa	%l1,[%i2+%o6]0x80	! Mem[000000001d000008] = 000000007f8a7d38
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x005,%g2
p3_b5:
!	Registers modified during the branch to p3_far_1
!	%l3  = 09b5d633c0000000
!	%l5  = 000000000000aaf6
!	%l6  = 9b5d59e4d6b4b890
	membar	#Sync			! Added by membar checker (575)
!	Mem[000000003200001c] = 776ec9b5, %l4 = f8cf18ffa510d6ac
	lduwa	[%o4+0x01c]%asi,%g2	! %g2 = f8cf18ffa510d6ac

p3_label_6:
!	Mem[0000000032000010] = 852cb3e2c2eec50c, %l3 = 09b5d633c0000000
	ldxa	[%o4+0x010]%asi,%g2	! %g2 = 852cb3e2c2eec50c
!	%f7  = 3bbcdebd, %f18 = 0c85cda4 7341e08e
	fitod	%f7 ,%f18		! %f18 = 41cdde6f 5e800000
	fbug,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001c0001c0] = 9658fc4f 0ab72c91 87e3ea80 5d86f69b
	prefetch [%i0+0x1c0],0	! Annulled
p3_b6:
	membar	#Sync			! Added by membar checker (576)
!	%l2 = 00000000208c9a4d, Mem[000000001d800108] = 84aa3236b59de614
	stxa	%l2,[%i3+0x108]%asi	! Mem[000000001d800108] = 00000000208c9a4d

p3_label_7:
!	%l6 = 9b5d59e4d6b4b890, %l1 = 000000007f8a7d38, %l4 = f8cf18ffa510d6ac
	srax	%l6,%l1,%l4		! %l4 = ffffffffffffff9b
	bgu	p3_b7			! Branch Taken, %ccr = 88, CWP = 0
!	%l2 = 00000000208c9a4d, Mem[000000001d800008] = 05f99a8a
	stha	%l2,[%i3+%o6]0x80	! Mem[000000001d800008] = 9a4d9a8a
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x007,%g2
p3_b7:
	membar	#Sync			! Added by membar checker (577)
!	Mem[0000000032000044] = 03faa03f, %l3 = 09b5d633c0000000
	lduh	[%o4+0x044],%g2		! %g2 = 00000000000003fa
!	Branch On Register, %l6 = 9b5d59e4d6b4b890
	brlez,a,pn %l6,p3_b8		! Branch Taken

p3_label_8:
!	%l2 = 00000000208c9a4d, Mem[0000000030800030] = 560c6519
	sth	%l2,[%o1+0x030]		! Mem[0000000030800030] = 9a4d6519
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x008,%g2
p3_b8:
	membar	#Sync			! Added by membar checker (578)
!	%f13 = 51ab13be, %f8  = 3b1196c3 3512add5
	fstox	%f13,%f8 		! %f8  = 00000015 6277c000
	set	p3_b9,%o7
	fbuge,pn %fcc3,p3_near_2_le	! Branch Taken, %fcc3 = 0
!	Mem[000000001d800020] = 04466cb2 2acf68a0 c131b41e f69e5a90
	prefetch [%i3+0x020],3
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x009,%g2
p3_b9:
!	Registers modified during the branch to p3_near_2
!	%l1  = 0000035d1fd390c1
!	%l2  = 000000009b5d61a9
!	%l3  = 0000000040aa5985
	membar	#Sync			! Added by membar checker (579)
	fbl,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_9:
!	Mem[000000001c0001e0] = b8a18200 ba93a2cd 96fe969d 523ff53e
	prefetch [%i0+0x1e0],4	! Annulled
p3_b10:
	membar	#Sync			! Added by membar checker (580)
!	Mem[0000000030800074] = adf5abb4, %l1 = 0000035d1fd390c1
	lduha	[%o1+0x076]%asi,%l1	! %l1 = 000000000000abb4
!	%l1 = 000000000000abb4, %l1 = 000000000000abb4, %l1 = 000000000000abb4
	or	%l1,%l1,%l1		! %l1 = 000000000000abb4
!	Mem[0000000032000060] = 0818b15d, %l7 = 000000009b5d633c
	ldsb	[%o4+0x060],%g2		! %g2 = 0000000000000008
!	%f15 = 1b01cadd, %f7  = 3bbcdebd, %f24 = 00000015 6277c000
	nop

p3_label_10:
!	%f1  = 3ef9477e, %f10 = e2ba4774 07861984
	fstod	%f1 ,%f10		! %f10 = 3fdf28ef c0000000
!	%f27 = 22e0cc01, %f22 = 46fca10c f1f75fc7
	fitod	%f27,%f22		! %f22 = 41c17066 00800000
	bgu	p3_b11			! Branch Taken, %ccr = 00, CWP = 0
!	%l6 = 9b5d59e4d6b4b890, Mem[000000001c000008] = 9c2e44ca
	stwa	%l6,[%i0+%o6]0x80	! Mem[000000001c000008] = d6b4b890
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x00b,%g2
p3_b11:
	membar	#Sync			! Added by membar checker (581)
!	%f2  = f341e08e f8dd440d, %f2  = f341e08e f8dd440d, %f22 = 41c17066 00800000
	faddd	%f2 ,%f2 ,%f22		! %f22 = f351e08e f8dd440d

p3_label_11:
!	%l2 = 9b5d61a9, %l3 = 40aa5985, Mem[0000000032000048] = b4eadc8a 53902166
	std	%l2,[%o4+0x048]	! Mem[0000000032000048] = 9b5d61a9 40aa5985
!	Mem[000000001f0001e0] = 6e7b7eb9 47f918d0 e3092d18 e536d302
	prefetcha [%i6+0x1e0]%asi,22
!	%f6  = 7fbc38c6, %f15 = 1b01cadd
	fmovs	%f6 ,%f15		! %f15 = 7fbc38c6
!	%f20 = 3ff00000, %f18 = 41cdde6f, %f19 = 5e800000
	fadds	%f20,%f18,%f19		! %f19 = 41dcde6f
!	Mem[000000001d800008] = 9a4d9a8a, %l2 = 000000009b5d61a9
	ldswa	[%i3+%o6]0x80,%l2	! %l2 = ffffffff9a4d9a8a

p3_label_12:
!	%l6 = 9b5d59e4d6b4b890
	sethi	%hi(0xfd5a8c00),%l6	! %l6 = 00000000fd5a8c00
!	%l5 = 000000000000aaf6, %l1 = 000000000000abb4, %l5 = 000000000000aaf6
	taddcc	%l5,%l1,%l5		! %l5 = 00000000000156aa, %ccr = 02
!	%l3 = 0000000040aa5985, %l0 = 0000000067a481ef, %l6 = 00000000fd5a8c00
	taddcc	%l3,%l0,%l6		! %l6 = 00000000a84edb74, %ccr = 0a
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetch [%o4+0x000],2
!	Mem[000000001d000000] = ef9f6e00, %l0 = 0000000067a481ef
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = ffffffffef9f6e00

p3_label_13:
!	Mem[0000000030000078] = 3e4fad65 d29b6b99, %l2 = 9a4d9a8a, %l3 = 40aa5985
	ldd	[%o0+0x078],%l2		! %l2 = 000000003e4fad65 00000000d29b6b99
!	%f12 = 7416790c, %f0  = 14211f3f
	fnegs	%f12,%f0 		! %f0  = f416790c
	nop
!	Branch On Register, %l0 = ffffffffef9f6e00
	brgez,pt %l0,p3_not_taken_0	! Branch Not Taken
!	Mem[000000003200000c] = d8311ea6, %l4 = ffffffffffffff9b
	ldsw	[%o4+0x00c],%g2		! %g2 = ffffffffffffff9b
p3_b12:

p3_label_14:
	membar	#Sync			! Added by membar checker (582)
!	Mem[000000001c800000] = 3a73eff8, %l2 = 000000003e4fad65
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000003a73
!	%f18 = 41cdde6f, %f8  = 00000015
	fabss	%f18,%f8 		! %f8  = 41cdde6f
!	Mem[000000001c8001c0] = e893e1e9 c595ec4d
	flush	%i1+0x1c0
	set	p3_b13,%o7
	fbo,pt	%fcc1,p3_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[000000001c000104] = 2f73f8b5, %l0 = ffffffffef9f6e00
	lduh	[%i0+0x104],%l0		! %l0 = 0000000000002f73
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x00d,%g2
p3_b13:
!	Registers modified during the branch to p3_near_0
!	%l7  = 000000000000699a

p3_label_15:
	membar	#Sync			! Added by membar checker (583)
!	Mem[000000001d000000] = ef9f6e00, %l6 = 00000000a84edb74
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffef9f
!	Mem[000000001d800000] = 0000000067a481ef, %l0 = 0000000000002f73
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = 0000000067a481ef
!	%l2 = 0000000000003a73, %l1 = 000000000000abb4, %l5 = 00000000000156aa
	xnor	%l2,%l1,%l5		! %l5 = ffffffffffff6e38
!	%l1 = 000000000000abb4, %l5 = ffffffffffff6e38, %y  = 00000465
	sdiv	%l1,%l5,%l1		! %l1 = fffffffff8486ff2
!	Mem[0000000032000040] = c78fef2b03faa03f, %l1 = fffffffff8486ff2
	ldxa	[%o4+0x040]%asi,%g2	! %g2 = c78fef2b03faa03f

p3_label_16:
!	%l1 = fffffffff8486ff2, %l5 = ffffffffffff6e38, %l7 = 000000000000699a
	sra	%l1,%l5,%l7		! %l7 = fffffffffffffff8
!	%l5 = ffffffffffff6e38, Mem[0000000031800036] = e4f27bb0
	sth	%l5,[%o3+0x036]		! Mem[0000000031800034] = e4f26e38
!	%f5  = 68473596, %f20 = 3ff00000 00000000
	fitod	%f5 ,%f20		! %f20 = 41da11cd 65800000
!	Mem[000000001c80006c] = 6b47fd7b, %l6 = ffffffffffffef9f
	ldswa	[%i1+0x06c]%asi,%l6	! %l6 = 000000006b47fd7b
!	%l4 = ffffff9b, %l5 = ffff6e38, Mem[000000001c000180] = 6852d35b 3e6d1c7f
	std	%l4,[%i0+0x180]	! Mem[000000001c000180] = ffffff9b ffff6e38

p3_label_17:
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000030000038] = 52e86852, %l7 = fffffffffffffff8
	ldsw	[%o0+0x038],%l7		! Annulled
p3_b14:
	membar	#Sync			! Added by membar checker (584)
!	%l6 = 000000006b47fd7b, immed = 00000f19, %l7 = fffffffffffffff8
	tsubcc	%l6,0xf19,%l7		! %l7 = 000000006b47ee62, %ccr = 02
!	%f8  = 41cdde6f, %f19 = 41dcde6f, %f19 = 41dcde6f
	fsubs	%f8 ,%f19,%f19		! %f19 = bff00000
!	Mem[0000000031000034] = 8bf7461f, %l4 = ffffffffffffff9b
	lduba	[%o2+0x036]%asi,%l4	! %l4 = 0000000000000046

p3_label_18:
!	%l0 = 67a481ef, %l1 = f8486ff2, Mem[000000001c0001d0] = eb4bf103 0c1f155f
	std	%l0,[%i0+0x1d0]	! Mem[000000001c0001d0] = 67a481ef f8486ff2
	set	p3_b15,%o7
	fbe,pn	%fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 0
!	%l1 = fffffffff8486ff2, Mem[0000000030800070] = 7a50ba7badf5abb4
	stx	%l1,[%o1+0x070]		! Mem[0000000030800070] = fffffffff8486ff2
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x00f,%g2
p3_b15:
!	Registers modified during the branch to p3_near_2
!	%l6  = ffffffa85e8f3106
	fbug,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l5 = ffffffffffff6e38, Mem[000000001d000008] = 000000007f8a7d38
	stxa	%l5,[%i2+%o6]0x80	! Annulled
p3_b16:

p3_label_19:
	membar	#Sync			! Added by membar checker (585)
!	Mem[000000001c800120] = 078e8e30 2345cff0 fd2cebe2 7446c3b8
	prefetcha [%i1+0x120]%asi,0
!	Mem[0000000031000034] = 8bf7461f, %l5 = ffff6e38, %l0 = 67a481ef
	add	%o2,0x34,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 000000008bf7461f
!	Mem[000000001d800174] = 0b934178, %l6 = ffffffa85e8f3106
	ldswa	[%i3+0x174]%asi,%l6	! %l6 = 000000000b934178
!	Mem[000000001d0001e4] = b62bd510, %l4 = 0000000000000046
	swap	[%i2+0x1e4],%l4		! %l4 = 00000000b62bd510
!	Mem[000000001d800008] = 9a4d9a8a, %l5 = ffffffffffff6e38
	swapa	[%i3+%o6]0x80,%l5	! %l5 = 000000009a4d9a8a

p3_label_20:
!	Mem[0000000032000014] = c2eec50c, %l7 = 000000006b47ee62
	ldsw	[%o4+0x014],%g2		! %g2 = 000000006b47ee62
!	%l4 = 00000000b62bd510
	setx	0x823ea5de823ea5de,%g7,%l4 ! %l4 = 823ea5de823ea5de
	bcc	p3_b17			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[000000001c800000] = 3a73eff8 b1be224e ad76cf25 47227882
	prefetch [%i1+0x000],4
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x011,%g2
p3_b17:
	membar	#Sync			! Added by membar checker (586)
!	%l5 = 000000009a4d9a8a, immed = 000007eb, %y  = ffffffa8
	udivx	%l5,0x7eb,%l1		! %l1 = 0000000000137cdb

p3_label_21:
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[000000001d800180] = f6ad421b 3c846604 a0a831da 7aee11a4
	prefetch [%i3+0x180],3
p3_b18:
	membar	#Sync			! Added by membar checker (587)
!	%l0 = 000000008bf7461f, immed = fffff4a0, %l2 = 0000000000003a73
	taddcc	%l0,-0xb60,%l2		! %l2 = 000000008bf73abf, %ccr = 1b
!	%f9  = 6277c000, %f26 = e78f218d, %f25 = 6277c000
	fsubs	%f9 ,%f26,%f25		! %f25 = 678f4085
!	Mem[000000001d8001a0] = 73d994a7 a86470f0 665c6b24 5a86158b
	prefetcha [%i3+0x1a0]%asi,21

p3_label_22:
!	Mem[000000001d000000] = ef9f6e00, %l2 = 000000008bf73abf
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = ffffffffef9f6e00
!	%f6  = 7fbc38c6 3bbcdebd, %f4  = 23c6fb97 68473596
	fnegd	%f6 ,%f4 		! %f4  = ffbc38c6 3bbcdebd
!	Mem[000000001c8001b8] = 9e5c394c, %l0 = 000000008bf7461f
	ldsh	[%i1+0x1b8],%l0		! %l0 = ffffffffffff9e5c
!	Mem[000000001d800000] = 00000000, %l1 = 0000000000137cdb
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l2 = ffffffffef9f6e00, %l3 = 00000000d29b6b99, %l6 = 000000000b934178
	andcc	%l2,%l3,%l6		! %l6 = 00000000c29b6a00, %ccr = 08

p3_label_23:
!	%l6 = 00000000c29b6a00, immed = 0000059f, %y  = ffffffa8
	udivx	%l6,0x59f,%l1		! %l1 = 0000000000229ef0
!	%f10 = 3fdf28ef c0000000, %f2  = f341e08e
	fdtos	%f10,%f2 		! %f2  = 3ef9477e
!	%f26 = e78f218d, %f13 = 51ab13be
	fabss	%f26,%f13		! %f13 = 678f218d
!	%l4 = 823ea5de823ea5de, %l4 = 823ea5de823ea5de, %l1 = 0000000000229ef0
	orncc	%l4,%l4,%l1		! %l1 = ffffffffffffffff, %ccr = 88
	bvc,a	p3_b19			! Branch Taken, %ccr = 88, CWP = 0

p3_label_24:
!	Mem[000000001c000060] = b9631352 6f64f394 1a4a73ae 65d5c020
	prefetch [%i0+0x060],4
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x013,%g2
p3_b19:
	membar	#Sync			! Added by membar checker (588)
!	Denormal Floating Point Operation Nullified
	nop
!	%l3 = 00000000d29b6b99, immed = fffff4de, %y  = ffffffa8
	umul	%l3,-0xb22,%l6		! %l6 = d29b627059bc22ae
!	Mem[000000001d000000] = ef9f6e00, %l7 = 000000006b47ee62
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffffef
!	Branch On Register, %l3 = 00000000d29b6b99
	brnz,a,pt %l3,p3_b20		! Branch Taken

p3_label_25:
!	Mem[000000001d0000e0] = b31104d1 7a084393 466d958f 9d76cb4e
	prefetch [%i2+0x0e0],16
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x014,%g2
p3_b20:
	membar	#Sync			! Added by membar checker (589)
!	%l2 = ffffffffef9f6e00, Mem[000000001c000118] = f7d1e584e19825bc
	stx	%l2,[%i0+0x118]		! Mem[000000001c000118] = ffffffffef9f6e00
!	%l2 = ef9f6e00, %l3 = d29b6b99, Mem[000000001d8000a8] = 6bc424eb 1f42c135
	std	%l2,[%i3+0x0a8]	! Mem[000000001d8000a8] = ef9f6e00 d29b6b99
!	%l0 = ffffffffffff9e5c, Mem[0000000031000074] = 0e6e197c
	stw	%l0,[%o2+0x074]		! Mem[0000000031000074] = ffff9e5c
	bvs	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_26:
!	Mem[0000000032000034] = 54a19e55, %l5 = 000000009a4d9a8a
	ldub	[%o4+0x035],%g2		! %g2 = 0000000000000054
p3_b21:
	membar	#Sync			! Added by membar checker (590)
!	%l6 = d29b627059bc22ae, Mem[000000001d800008] = ffff6e38
	stba	%l6,[%i3+%o6]0x80	! Mem[000000001d800008] = aeff6e38
!	Mem[000000001c00018c] = a2ed0138, %l5 = 000000009a4d9a8a
	ldub	[%i0+0x18e],%l5		! %l5 = 0000000000000001
	fbu,pn	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l3 = 00000000d29b6b99, Mem[000000001d000000] = ef9f6e00
	stba	%l3,[%i2+%g0]0x80	! Mem[000000001d000000] = 999f6e00
p3_b22:

p3_label_27:
	membar	#Sync			! Added by membar checker (591)
!	%l5 = 0000000000000001, Mem[0000000030800074] = f8486ff2
	stb	%l5,[%o1+0x074]		! Mem[0000000030800074] = 01486ff2
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetch [%o4+0x000],20
!	Mem[0000000032000020] = 881b2ad7 861878d1 a4176408 4b729f64
	prefetch [%o4+0x020],3
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031800030] = 0014bdb3, %l7 = ffffffffffffffef
	ldsh	[%o3+0x030],%l7		! %l7 = 0000000000000014
p3_b23:

p3_label_28:
	membar	#Sync			! Added by membar checker (592)
!	%f11 = c0000000, %f29 = c4a1337c, %f3  = f8dd440d
	fsubs	%f11,%f29,%f3 		! %f3  = 44a0f37c
!	Mem[0000000030800078] = b2bee63b, %l3 = 00000000d29b6b99
	lduw	[%o1+0x078],%l3		! %l3 = 00000000b2bee63b
!	%f1  = 3ef9477e, %f12 = 7416790c 678f218d
	fitod	%f1 ,%f12		! %f12 = 41cf7ca3 bf000000
	fbne,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000003200004c] = 40aa5985, %l1 = ffffffffffffffff
	ldsw	[%o4+0x04c],%g2		! Annulled
p3_b24:

p3_label_29:
!	call to call_1, CWP = 0
	call	p3_call_1_he
!	Mem[0000000030000034] = b6453fd3, %l3 = 00000000b2bee63b
	ldub	[%o0+0x035],%l3		! %l3 = 0000000000000045
!	Registers modified during the branch to p3_call_1
!	%l0  = ffffffffffff9e40
!	%l4  = fffffffffffffee7
!	%l5  = fffffffffffff5f8
!	%l6  = 0000000010609214
	membar	#Sync			! Added by membar checker (593)
	set	p3_b25,%o7
	fble,a,pn %fcc3,p3_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[000000001d800008] = aeff6e38, %l5 = fffffffffffff5f8
	swapa	[%i3+%o6]0x80,%l5	! %l5 = 00000000aeff6e38
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x019,%g2
p3_b25:
!	Registers modified during the branch to p3_near_0
!	%l7  = 000000000000699a
	membar	#Sync			! Added by membar checker (594)
	fbne,pn	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 0

p3_label_30:
!	%l1 = ffffffffffffffff, Mem[000000001d800000] = 0000000067a481ef
	stxa	%l1,[%i3+%g0]0x80	! Mem[000000001d800000] = ffffffffffffffff
p3_b26:
	fbl	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d800000] = ffffffff, %l1 = ffffffffffffffff
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffffff
p3_b27:
	membar	#Sync			! Added by membar checker (595)
!	Mem[000000001d000000] = 999f6e00, %l4 = fffffffffffffee7
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffff99
!	%f0  = f416790c 3ef9477e, %f0  = f416790c 3ef9477e
	fabsd	%f0 ,%f0 		! %f0  = 7416790c 3ef9477e

p3_label_31:
!	%l4 = ffffffffffffff99
	sethi	%hi(0x55966400),%l4	! %l4 = 0000000055966400
!	%l6 = 0000000010609214, immed = fffff411, %l0 = ffffffffffff9e40
	andn	%l6,-0xbef,%l0		! %l0 = 0000000000000204
	fbg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = 0000000000000045, Mem[000000001c000008] = d6b4b89054b24f14
	stxa	%l3,[%i0+%o6]0x80	! Mem[000000001c000008] = 0000000000000045
p3_b28:
	membar	#Sync			! Added by membar checker (596)
!	Mem[000000001d000000] = 999f6e00, %l4 = 0000000055966400
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000099

p3_label_32:
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l7 = 000000000000699a, Mem[000000001d000000] = ff9f6e00
	stwa	%l7,[%i2+%g0]0x80	! Annulled
p3_b29:
	membar	#Sync			! Added by membar checker (597)
!	%f13 = bf000000, %f12 = 41cf7ca3, %f3  = 44a0f37c
	fsubs	%f13,%f12,%f3 		! %f3  = c1d37ca3
	fbne	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 00000099, %l5 = aeff6e38, Mem[0000000031000030] = 208c9a4d 8bf7461f
	std	%l4,[%o2+0x030]	! Mem[0000000031000030] = 00000099 aeff6e38
p3_b30:

p3_label_33:
	membar	#Sync			! Added by membar checker (598)
!	%l4 = 0000000000000099, %l3 = 0000000000000045, %y  = ffffff2d
	umulcc	%l4,%l3,%l5		! %l5 = 000000000000293d, %ccr = 00
!	%l7 = 000000000000699a, immed = 00000023, %l3 = 0000000000000045
	srax	%l7,0x023,%l3		! %l3 = 0000000000000000
!	%f6  = 7fbc38c6 3bbcdebd, %f2  = 3ef9477e c1d37ca3
	fcmpd	%fcc2,%f6 ,%f2 		! %fcc2 = 2
!	Branch On Register, %l5 = 000000000000293d
	brgez,a,pn %l5,p3_b31		! Branch Taken
!	Mem[000000001d0000b0] = 76ab7efc, %l5 = 000000000000293d
	ldsh	[%i2+0x0b2],%l5		! %l5 = 0000000000007efc
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x01f,%g2
p3_b31:

p3_label_34:
	membar	#Sync			! Added by membar checker (599)
!	Mem[000000001d800008] = fffff5f8, %l0 = 0000000000000204
	lduha	[%i3+%o6]0x80,%l0	! %l0 = 000000000000ffff
!	%l4 = 0000000000000099, %l6 = 0000000010609214, %l4 = 0000000000000099
	orncc	%l4,%l6,%l4		! %l4 = ffffffffef9f6dfb, %ccr = 88
	bgu,a	p3_b32			! Branch Taken, %ccr = 88, CWP = 0
!	%l0 = 0000ffff, %l1 = ffffffff, Mem[0000000030000038] = 52e86852 72dbaf1c
	std	%l0,[%o0+0x038]	! Mem[0000000030000038] = 0000ffff ffffffff
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x020,%g2
p3_b32:
	membar	#Sync			! Added by membar checker (600)
	fbul,pt	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0

p3_label_35:
!	Mem[000000001c8000c8] = 57af567b, %l3 = 0000000000000000
	swap	[%i1+0x0c8],%l3		! %l3 = 0000000057af567b
p3_b33:
	membar	#Sync			! Added by membar checker (601)
!	Mem[000000001c000000] = badc185a, %l2 = ffffffffef9f6e00
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 00000000badc185a
!	%l5 = 0000000000007efc, %l7 = 000000000000699a, %l2 = 00000000badc185a
	tsubcc	%l5,%l7,%l2		! %l2 = 0000000000001562, %ccr = 02
!	%l4 = ffffffffef9f6dfb, Mem[000000001d0001d8] = 37e8ef40
	sth	%l4,[%i2+0x1d8]		! Mem[000000001d0001d8] = 6dfbef40
!	%l1 = ffffffffffffffff, Mem[000000001c000008] = 0000000000000045
	stxa	%l1,[%i0+%o6]0x80	! Mem[000000001c000008] = ffffffffffffffff

p3_label_36:
!	%f1  = 3ef9477e, %f17 = 22e0cc01, %f24 = 00000015 678f4085
	nop
!	%f3  = c1d37ca3, %f8  = 41cdde6f, %f23 = f8dd440d
	fadds	%f3 ,%f8 ,%f23		! %f23 = bf33c680
	fbl,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001d800008] = fffff5f89b5d633c, %l1 = ffffffffffffffff
	ldxa	[%i3+%o6]0x80,%l1	! Annulled
p3_b34:
	membar	#Sync			! Added by membar checker (602)
!	%l1 = ffffffffffffffff, %l2 = 0000000000001562, %y  = 00000000
	udiv	%l1,%l2,%l5		! %l5 = 00000000000bf8e4

p3_label_37:
	ba	p3_b35			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[000000001d000008] = 00000000, %l4 = ffffffffef9f6dfb
	lduwa	[%i2+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x023,%g2
p3_b35:
	membar	#Sync			! Added by membar checker (603)
!	Mem[000000001c8001e4] = f972e646, %l5 = 00000000000bf8e4
	ldswa	[%i1+0x1e4]%asi,%l5	! %l5 = fffffffff972e646
!	%l6 = 0000000010609214, %l7 = 000000000000699a, %l4 = 0000000000000000
	orn	%l6,%l7,%l4		! %l4 = ffffffffffff9675
	ble,a	p3_b36			! Branch Taken, %ccr = 02, CWP = 0

p3_label_38:
!	Mem[000000001d000008] = 00000000, %l6 = 0000000010609214
	lduba	[%i2+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x024,%g2
p3_b36:
	membar	#Sync			! Added by membar checker (604)
!	%l2 = 0000000000001562, immed = 0000001d, %l3 = 0000000057af567b
	sllx	%l2,0x01d,%l3		! %l3 = 000002ac40000000
!	%f19 = bff00000, %f24 = 00000015 678f4085
	fstod	%f19,%f24		! %f24 = bffe0000 00000000
	set	p3_b37,%o7
	fbule,a	p3_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001d0000e0] = b31104d1 7a084393 466d958f 9d76cb4e
	prefetch [%i2+0x0e0],1
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x025,%g2
p3_b37:

p3_label_39:
	membar	#Sync			! Added by membar checker (605)
!	Mem[000000001c8001a0] = 31594954 2aa5ba4a 7e802ef9 22251c41
	prefetch [%i1+0x1a0],20
!	%l4 = ffffffffffff9675, %l5 = fffffffff972e646, %l4 = ffffffffffff9675
	tsubcc	%l4,%l5,%l4		! %l4 = 00000000068cb02f, %ccr = 02
	set	p3_b38,%o7
	fbule,a,pn %fcc3,p3_near_3_he	! Branch Taken, %fcc3 = 0
!	Mem[000000001c800000] = 3a73eff8, %l5 = fffffffff972e646
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 000000003a73eff8
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x026,%g2
p3_b38:
!	Registers modified during the branch to p3_near_3
!	%l6  = 7afa0e8bb6453fd3
	membar	#Sync			! Added by membar checker (606)
!	Mem[000000001c8001a8] = 00000000 2aa5ba4a, %l5 = 000000003a73eff8, %l3 = 000002ac40000000
	add	%i1,0x1a8,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 7e802ef922251c41

p3_label_40:
!	%l5 = 000000003a73eff8, %l6 = 7afa0e8bb6453fd3, %l0 = 000000000000ffff
	addccc	%l5,%l6,%l0		! %l0 = 7afa0e8bf0b92fcb, %ccr = 08
!	%l3 = 7e802ef922251c41, %l5 = 000000003a73eff8, %l6 = 7afa0e8bb6453fd3
	orcc	%l3,%l5,%l6		! %l6 = 7e802ef93a77fff9, %ccr = 00
!	Mem[000000001c800000] = 3a73eff8 b1be224e, %l4 = 068cb02f, %l5 = 3a73eff8
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 000000003a73eff8 00000000b1be224e
!	%l7 = 000000000000699a, immed = fffffdb7, %l5 = 00000000b1be224e
	orncc	%l7,-0x249,%l5		! %l5 = 0000000000006bda, %ccr = 00
!	%l3 = 7e802ef922251c41, %l5 = 0000000000006bda, %l7 = 000000000000699a
	addccc	%l3,%l5,%l7		! %l7 = 7e802ef92225881b, %ccr = 00

p3_label_41:
!	Mem[000000001d800180] = f6ad421b 3c846604 a0a831da 7aee11a4
	prefetcha [%i3+0x180]%asi,21
	set	p3_b39,%o7
	fbule	p3_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000010] = 852cb3e2c2eec50c, %l1 = ffffffffffffffff
	ldx	[%o4+0x010],%g2		! %g2 = 852cb3e2c2eec50c
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x027,%g2
p3_b39:
!	Registers modified during the branch to p3_far_0
!	%l4  = 7e802ef92225881a
!	%l5  = fffffffffffcdccc
!	%l6  = 000000000011128e
	membar	#Sync			! Added by membar checker (607)
	set	p3_b40,%o7
	fbe,a,pn %fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 0
!	%l3 = 7e802ef922251c41, Mem[0000000031000030] = 00000099aeff6e38
	stx	%l3,[%o2+0x030]		! Mem[0000000031000030] = 7e802ef922251c41
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x028,%g2
p3_b40:
!	Registers modified during the branch to p3_near_2
!	%l6  = fffffffffffff4a5

p3_label_42:
	membar	#Sync			! Added by membar checker (608)
!	Mem[000000001c000000] = badc185a, %l4 = 7e802ef92225881a
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000badc185a
!	%f20 = 41da11cd 65800000, %f4  = ffbc38c6 3bbcdebd
	fdtox	%f20,%f4 		! %f4  = 00000000 68473596
!	%l1 = ffffffffffffffff
	sethi	%hi(0x6b857c00),%l1	! %l1 = 000000006b857c00
!	%f17 = 22e0cc01, %f11 = c0000000, %f12 = 41cf7ca3
	fmuls	%f17,%f11,%f12		! %f12 = a360cc01
!	%l4 = 00000000badc185a, immed = 0000002b, %l7 = 7e802ef92225881b
	srlx	%l4,0x02b,%l7		! %l7 = 0000000000000000

p3_label_43:
	bvs	p3_b41			! Branch Taken, %ccr = 02, CWP = 0
!	%l3 = 7e802ef922251c41, Mem[000000001c800108] = 1b8589709bd25bf0
	stx	%l3,[%i1+0x108]		! Mem[000000001c800108] = 7e802ef922251c41
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x029,%g2
p3_b41:
	membar	#Sync			! Added by membar checker (609)
!	Mem[000000001d000010] = 5dd9a630 b15572da, %l2 = 00001562, %l3 = 22251c41
	ldda	[%i2+0x010]%asi,%l2	! %l2 = 000000005dd9a630 00000000b15572da
!	%l6 = fffffffffffff4a5, %l7 = 0000000000000000, %l7 = 0000000000000000
	subc	%l6,%l7,%l7		! %l7 = fffffffffffff4a5
	set	p3_b42,%o7
	fbo,pn	%fcc3,p3_near_3_le	! Branch Taken, %fcc3 = 0

p3_label_44:
!	Mem[000000003080007c] = f6783e55, %l0 = 7afa0e8bf0b92fcb
	swap	[%o1+0x07c],%l0		! %l0 = 00000000f6783e55
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x02a,%g2
p3_b42:
!	Registers modified during the branch to p3_near_3
!	%l3  = 0000033c75cff706
!	%l4  = 00000000000b2c97
!	%l7  = 000000000026a0ea
	membar	#Sync			! Added by membar checker (610)
!	Mem[000000001c000008] = ffffffff, %l1 = 000000006b857c00
	ldstuba	[%i0+%o6]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000001d800040] = c5e497a4 249b765a 8b470a80 fe4607e7
	prefetcha [%i3+0x040]%asi,22
!	%f17 = 22e0cc01, %f4  = 00000000, %f28 = 99d02909
	fadds	%f17,%f4 ,%f28		! %f28 = 22e0cc01
!	%l6 = fffffffffffff4a5, %l7 = 000000000026a0ea, %l2 = 000000005dd9a630
	srax	%l6,%l7,%l2		! %l2 = ffffffffffffffff

p3_label_45:
!	%l0 = 00000000f6783e55, immed = fffff899, %l1 = 00000000000000ff
	andncc	%l0,-0x767,%l1		! %l1 = 0000000000000644, %ccr = 00
	set	p3_b43,%o7
	fbuge	p3_far_0_he	! Branch Taken, %fcc0 = 0
!	%l2 = ffffffffffffffff, Mem[000000001d8000f0] = 4a8c198a
	stb	%l2,[%i3+0x0f0]		! Mem[000000001d8000f0] = ff8c198a
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x02b,%g2
p3_b43:
!	Registers modified during the branch to p3_far_0
!	%l1  = 0000000000000014
!	%l4  = 0000000000000000
!	%l5  = 00000000f65e9ebf
	membar	#Sync			! Added by membar checker (611)
!	%l3 = 0000033c75cff706, Mem[000000001c8000f4] = 1bbc7523
	stwa	%l3,[%i1+0x0f4]%asi	! Mem[000000001c8000f4] = 75cff706
!	Mem[0000000030800074] = 01486ff2, %l3 = 0000033c75cff706
	lduw	[%o1+0x074],%l3		! %l3 = 0000000001486ff2

p3_label_46:
!	%l3 = 0000000001486ff2, immed = fffff575, %y  = ffffffff
	sdivx	%l3,-0xa8b,%l5		! %l5 = ffffffffffffe0da
	fbu,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800070] = ffffffff, %l2 = ffffffffffffffff
	lduh	[%o1+0x070],%l2		! Annulled
p3_b44:
	membar	#Sync			! Added by membar checker (612)
	set	p3_b45,%o7
	fble,pn	%fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 0
!	%l0 = 00000000f6783e55, Mem[0000000032000030] = 6d1accd5
	stb	%l0,[%o4+0x030]		! Mem[0000000032000030] = 551accd5
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x02d,%g2
p3_b45:
!	Registers modified during the branch to p3_near_1
!	%l7  = ffffffffffffffff

p3_label_47:
	membar	#Sync			! Added by membar checker (613)
!	%l2 = ffffffffffffffff, immed = fffffb28, %l0 = 00000000f6783e55
	addccc	%l2,-0x4d8,%l0		! %l0 = fffffffffffffb27, %ccr = 99
	nop
!	%l7 = ffffffffffffffff, Mem[000000001d000000] = ff9f6e00
	stha	%l7,[%i2+%g0]0x80	! Mem[000000001d000000] = ffff6e00
!	%l7 = ffffffffffffffff, immed = 0000034f, %l1 = 0000000000000014
	add	%l7,0x34f,%l1		! %l1 = 000000000000034e
	set	p3_b46,%o7
	fbue	p3_far_3_le	! Branch Taken, %fcc0 = 0

p3_label_48:
!	Mem[000000001c000120] = 689b5cf7 a6a6cbc3 0860658b cc69ec5b
	prefetch [%i0+0x120],22
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x02e,%g2
p3_b46:
!	Registers modified during the branch to p3_far_3
!	%l1  = 00000000ffffffff
!	%l7  = 0000000007fff45c
	membar	#Sync			! Added by membar checker (614)
!	Branch On Register, %l7 = 0000000007fff45c
	brlez,a,pt %l7,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c8001e0] = 4488af73 f972e646 2ab710bd d38580e8
	prefetch [%i1+0x1e0],0	! Annulled
p3_b47:
	membar	#Sync			! Added by membar checker (615)
!	%f28 = 22e0cc01, %f28 = 22e0cc01, %f5  = 68473596
	fsubs	%f28,%f28,%f5 		! %f5  = 00000000
!	%l7 = 0000000007fff45c, %l6 = fffffffffffff4a5, %l5 = ffffffffffffe0da
	andcc	%l7,%l6,%l5		! %l5 = 0000000007fff404, %ccr = 00

p3_label_49:
!	Mem[000000001c000160] = 9a66bedf 079eacd2 d30b8ab8 0f075148
	prefetcha [%i0+0x160]%asi,0
!	%l4 = 00000000, %l5 = 07fff404, Mem[000000001d800020] = 04466cb2 2acf68a0
	stda	%l4,[%i3+0x020]%asi	! Mem[000000001d800020] = 00000000 07fff404
!	%l0 = fffffffffffffb27, %l0 = fffffffffffffb27, %l2 = ffffffffffffffff
	or	%l0,%l0,%l2		! %l2 = fffffffffffffb27
	set	p3_b48,%o7
	fbule	p3_far_2_le	! Branch Taken, %fcc0 = 0
!	%l0 = fffffffffffffb27, Mem[000000003000007e] = ffffffff
	stb	%l0,[%o0+0x07e]		! Mem[000000003000007c] = ffff27ff
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x030,%g2
p3_b48:

p3_label_50:
	membar	#Sync			! Added by membar checker (616)
!	%l0 = fffffffffffffb27
	sethi	%hi(0x3c87f400),%l0	! %l0 = 000000003c87f400
	set	p3_b49,%o7
	fbule,a,pn %fcc1,p3_near_3_le	! Branch Taken, %fcc1 = 0
!	%l2 = fffffffffffffb27, Mem[000000001c800008] = ad76cf2547227882
	stx	%l2,[%i1+0x008]		! Mem[000000001c800008] = fffffffffffffb27
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x031,%g2
p3_b49:
!	Registers modified during the branch to p3_near_3
!	%l3  = 0000000000000000
!	%l4  = 0000000000295fad
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (617)
	set	p3_b50,%o7
	fblg,pn	%fcc2,p3_near_1_he	! Branch Taken, %fcc2 = 2
!	%l2 = fffffffffffffb27, Mem[000000001d0001fc] = c6721909
	sth	%l2,[%i2+0x1fc]		! Mem[000000001d0001fc] = fb271909
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x032,%g2
p3_b50:
!	Registers modified during the branch to p3_near_1
!	%l4  = 0000000000000001

p3_label_51:
	membar	#Sync			! Added by membar checker (618)
!	%l0 = 000000003c87f400, immed = 00000741, %l6 = fffffffffffff4a5
	orn	%l0,0x741,%l6		! %l6 = fffffffffffffcbe
	set	p3_b51,%o7
	fbne,pt	%fcc2,p3_near_3_he	! Branch Taken, %fcc2 = 2
!	Mem[000000001c000000] = 2225881a, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 000000002225881a
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x033,%g2
p3_b51:
!	Registers modified during the branch to p3_near_3
!	%l6  = 7afa0e8bb6453fd3
	membar	#Sync			! Added by membar checker (619)
!	Mem[000000001c000008] = ffffffff, %l1 = 00000000ffffffff
	ldsha	[%i0+%o6]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[000000004000003c] = 033d3f1d, %l0 = 000000003c87f400
	swap	[%o5+0x03c],%l0		! %l0 = 00000000033d3f1d

p3_label_52:
!	%f23 = bf33c680, %f12 = a360cc01
	fnegs	%f23,%f12		! %f12 = 3f33c680
	bgu	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l7 = 000000002225881a, Mem[000000001d000008] = 00000000
	stwa	%l7,[%i2+%o6]0x80	! Mem[000000001d000008] = 2225881a
p3_b52:
	membar	#Sync			! Added by membar checker (620)
!	%l3 = 0000000000000000, immed = 00000cc5, %l7 = 000000002225881a
	or	%l3,0xcc5,%l7		! %l7 = 0000000000000cc5
!	Mem[000000001c80018c] = 1ac349b2, %l5 = 0000000007fff404
	ldsb	[%i1+0x18e],%l5		! %l5 = 0000000000000049

p3_label_53:
!	%f20 = 41da11cd 65800000, %f19 = bff00000
	fdtoi	%f20,%f19		! %f19 = 68473596
!	Mem[0000000030000074] = bd4bbd95, %l6 = b6453fd3, %l1 = ffffffff
	add	%o0,0x74,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000bd4bbd95
!	Mem[000000001d800000] = ffffffff, %l7 = 0000000000000cc5
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[000000003100007c] = fed80d66, %l1 = bd4bbd95, %l2 = fffffb27
	add	%o2,0x7c,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000fed80d66
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 44

p3_label_54:
!	Mem[000000001c8001fc] = ef738c37, %l4 = 0000000000000001
	ldub	[%i1+0x1fd],%l4		! %l4 = 0000000000000073
p3_b53:
	membar	#Sync			! Added by membar checker (621)
!	%l2 = 00000000fed80d66, %l7 = ffffffffffffffff, %l1 = 00000000bd4bbd95
	srax	%l2,%l7,%l1		! %l1 = 0000000000000000
!	%l2 = 00000000fed80d66, %l3 = 0000000000000000, %l0 = 00000000033d3f1d
	srlx	%l2,%l3,%l0		! %l0 = 00000000fed80d66
!	Mem[000000001f000060] = 0ef803e6 225a2f31 97526558 fcb2fed6
	prefetch [%i6+0x060],2
!	Mem[000000001c0001b0] = 1281300b, %l6 = 7afa0e8bb6453fd3
	ldswa	[%i0+0x1b0]%asi,%l6	! %l6 = 000000001281300b

p3_label_55:
!	%l6 = 000000001281300b, Mem[0000000030800038] = 67a481ef7f8a7d38
	stxa	%l6,[%o1+0x038]%asi	! Mem[0000000030800038] = 000000001281300b
!	%l7 = ffffffffffffffff, %l6 = 000000001281300b, %l0 = 00000000fed80d66
	andncc	%l7,%l6,%l0		! %l0 = ffffffffed7ecff4, %ccr = 88
!	%f17 = 22e0cc01, %f4  = 00000000, %f0  = 7416790c
	fmuls	%f17,%f4 ,%f0 		! %f0  = 00000000
	set	p3_b54,%o7
	fbe	p3_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000074] = ffff9e5c, %l1 = 0000000000000000
	ldsw	[%o2+0x074],%l1		! %l1 = ffffffffffff9e5c
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x036,%g2
p3_b54:
!	Registers modified during the branch to p3_far_1
!	%l0  = 000000000014bdb3
!	%l1  = 00000000e4f26e38
!	%l3  = 000000000000101d
!	%l5  = 0000000000d702f8
!	%l7  = 0000000000049173

p3_label_56:
	membar	#Sync			! Added by membar checker (622)
!	%l6 = 000000001281300b, immed = 000001e9, %l5 = 0000000000d702f8
	andncc	%l6,0x1e9,%l5		! %l5 = 0000000012813002, %ccr = 00
!	%f30 = bc4910b1 10408c9b, %f30 = bc4910b1 10408c9b
	fabsd	%f30,%f30		! %f30 = 3c4910b1 10408c9b
!	%l4 = 0000000000000073, %l0 = 000000000014bdb3, %l1 = 00000000e4f26e38
	addccc	%l4,%l0,%l1		! %l1 = 000000000014be26, %ccr = 00
!	%l4 = 0000000000000073
	setx	0xb2ec8cf1b2ec8cf1,%g7,%l4 ! %l4 = b2ec8cf1b2ec8cf1
	fbul,pt	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0

p3_label_57:
!	Mem[0000000031800078] = 3096a946, %l3 = 000000000000101d
	ldsh	[%o3+0x07a],%l3		! %l3 = ffffffffffffa946
p3_b55:
	membar	#Sync			! Added by membar checker (623)
!	%l0 = 000000000014bdb3, %l6 = 000000001281300b, %l6 = 000000001281300b
	srlx	%l0,%l6,%l6		! %l6 = 0000000000000297
	set	p3_b56,%o7
	fbge	p3_far_3_he	! Branch Taken, %fcc0 = 0
!	%l3 = ffffffffffffa946, Mem[0000000031800078] = 3096a946
	sth	%l3,[%o3+0x078]		! Mem[0000000031800078] = a946a946
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x038,%g2
p3_b56:
!	Registers modified during the branch to p3_far_3
!	%l0  = fffffc129dbbb392
!	%l4  = 000000000000e974
!	%l6  = 00000000a946a946
!	%l7  = 00000000fff8c345
	membar	#Sync			! Added by membar checker (624)
!	%l3 = ffffffffffffa946, immed = 0000000c, %l4 = 000000000000e974
	srax	%l3,0x00c,%l4		! %l4 = fffffffffffffffa

p3_label_58:
!	Mem[000000001d8000e0] = 6a58421c f8793796 7398c137 76f7b63b
	prefetch [%i3+0x0e0],4
	fbn,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d800008] = fffff5f89b5d633c, %l1 = 000000000014be26
	ldxa	[%i3+%o6]0x80,%l1	! Annulled
p3_b57:
	membar	#Sync			! Added by membar checker (625)
!	%l4 = fffffffffffffffa, %l1 = 000000000014be26, %l7 = 00000000fff8c345
	tsubcc	%l4,%l1,%l7		! %l7 = ffffffffffeb41d4, %ccr = 8a
!	Branch On Register, %l5 = 0000000012813002
	brnz,a,pt %l5,p3_b58		! Branch Taken

p3_label_59:
!	Mem[000000001c000080] = 0616fab1, %l7 = ffffffffffeb41d4
	lduh	[%i0+0x080],%l7		! %l7 = 0000000000000616
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x03a,%g2
p3_b58:
	membar	#Sync			! Added by membar checker (626)
!	%l5 = 0000000012813002
	setx	0x23618bb923618bb9,%g7,%l5 ! %l5 = 23618bb923618bb9
!	%f10 = 3fdf28ef c0000000, %f12 = 3f33c680
	fdtos	%f10,%f12		! %f12 = 3ef9477e
!	Mem[000000001d800120] = 75f28769 7a8b21e9 42c14c8e b32091c4
	prefetcha [%i3+0x120]%asi,21
!	Mem[000000001e8001a0] = ed1d8d20 39af8138 c5f461a6 19cf8fe7
	prefetch [%i5+0x1a0],22

p3_label_60:
	set	p3_b59,%o7
	fbe	p3_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000075] = ffff9e5c, %l6 = 00000000a946a946
	ldstub	[%o2+0x075],%l6		! %l6 = 00000000000000ff
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x03b,%g2
p3_b59:
!	Registers modified during the branch to p3_far_1
!	%l0  = 000000000014bdb3
!	%l1  = 00000000e4f26e38
!	%l3  = 000000000000101d
!	%l5  = 0000000000d702f8
!	%l7  = 0000000000000000
	fbul	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c000008] = ffffffff, %l3 = 000000000000101d
	lduba	[%i0+%o6]0x80,%l3	! %l3 = 00000000000000ff
p3_b60:
	bpos,a	p3_b61			! Branch Taken, %ccr = 44, CWP = 0

p3_label_61:
!	Mem[000000001d800120] = 75f28769 7a8b21e9 42c14c8e b32091c4
	prefetch [%i3+0x120],4
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x03d,%g2
p3_b61:
	membar	#Sync			! Added by membar checker (627)
!	%l5 = 0000000000d702f8, %l1 = 00000000e4f26e38, %l2 = 00000000fed80d66
	andcc	%l5,%l1,%l2		! %l2 = 0000000000d20238, %ccr = 00
!	%l0 = 000000000014bdb3, %l4 = fffffffffffffffa, %l5 = 0000000000d702f8
	andncc	%l0,%l4,%l5		! %l5 = 0000000000000001, %ccr = 00
	set	p3_b62,%o7
	fbo,pn	%fcc2,p3_near_0_le	! Branch Taken, %fcc2 = 2
!	%l6 = 000000ff, %l7 = 00000000, Mem[000000001d000008] = 2225881a 7f8a7d38
	stda	%l6,[%i2+%o6]0x80	! Mem[000000001d000008] = 000000ff 00000000
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x03e,%g2
p3_b62:
!	Registers modified during the branch to p3_near_0
!	%l7  = 000000000000699a

p3_label_62:
	membar	#Sync			! Added by membar checker (628)
!	Mem[000000001d800008] = fffff5f89b5d633c, %l0 = 000000000014bdb3
	ldxa	[%i3+%o6]0x80,%l0	! %l0 = fffff5f89b5d633c
	fblg,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000001d000008] = 000000ff, %l2 = 0000000000d20238
	swapa	[%i2+%o6]0x80,%l2	! %l2 = 00000000000000ff
p3_b63:
	bne	p3_b64			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d800008] = fffff5f8, %l6 = 00000000000000ff
	ldswa	[%i3+%o6]0x80,%l6	! %l6 = fffffffffffff5f8
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x040,%g2
p3_b64:

p3_label_63:
	membar	#Sync			! Added by membar checker (629)
!	Mem[000000001c000044] = c20fab3f, %l1 = 00000000e4f26e38
	ldsw	[%i0+0x044],%l1		! %l1 = ffffffffc20fab3f
!	Mem[0000000030800073] = fffff4a5, %l1 = ffffffffc20fab3f
	ldstuba	[%o1+0x073]%asi,%l1	! %l1 = 00000000000000a5
	fblg,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetch [%o4+0x000],20
p3_b65:
	membar	#Sync			! Added by membar checker (630)
!	Branch On Register, %l6 = fffffffffffff5f8
	brgz,a,pn %l6,p3_not_taken_0	! Branch Not Taken

p3_label_64:
!	%l7 = 000000000000699a, Mem[000000001d8001d9] = d0f82248
	stb	%l7,[%i3+0x1d9]		! Annulled
p3_b66:
	fbu,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d000180] = e1bd9630 cef2f2fa 6fadd099 496ffd7c
	prefetch [%i2+0x180],23	! Annulled
p3_b67:
	bvc	p3_b68			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001c800000] = 3a73eff8, %l7 = 000000000000699a
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 000000003a73eff8
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x044,%g2
p3_b68:

p3_label_65:
!	Jump to jmpl_3, CWP = 0
	set	p3_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001d000008] = 00d2023800000000, %l2 = 00000000000000ff
	ldxa	[%i2+%o6]0x80,%l2	! %l2 = 00d2023800000000
!	Registers modified during the branch to p3_jmpl_3
!	%l0  = fffffffffffff5f9
!	%l1  = 0000000000000000
!	%l4  = 000000006423c08a
!	%l5  = 000000007bafd24c
	membar	#Sync			! Added by membar checker (631)
	set	p3_b69,%o7
	fba,pn	%fcc0,p3_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001f0001e0] = 6e7b7eb9 47f918d0 e3092d18 e536d302
	prefetch [%i6+0x1e0],16
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x045,%g2
p3_b69:
!	Registers modified during the branch to p3_near_3
!	%l3  = 000001bbfa82a3d6
!	%l4  = 0000000000193086
!	%l7  = 0000000000429a04
	membar	#Sync			! Added by membar checker (632)
!	Mem[000000001d000008] = 00d2023800000000, %l4 = 0000000000193086
	ldxa	[%i2+%o6]0x80,%l4	! %l4 = 00d2023800000000

p3_label_66:
!	%l6 = fffff5f8, %l7 = 00429a04, Mem[0000000031000070] = 2e0eaaf6 ffff9e5c
	stda	%l6,[%o2+0x070]%asi	! Mem[0000000031000070] = fffff5f8 00429a04
!	%f29 = c4a1337c, %f8  = 41cdde6f, %f10 = 3fdf28ef c0000000
	fsmuld	%f29,%f8 ,%f10		! %f10 = c0e03449 5adb5880
!	%l4 = 00d2023800000000, Mem[000000001d800118] = d76e4ba4
	stwa	%l4,[%i3+0x118]%asi	! Mem[000000001d800118] = 00000000
!	%l3 = 000001bbfa82a3d6, Mem[000000001d000000] = ffff6e00018b3c33
	stxa	%l3,[%i2+%g0]0x80	! Mem[000000001d000000] = 000001bbfa82a3d6
	bge,a	p3_b70			! Branch Taken, %ccr = 00, CWP = 0

p3_label_67:
!	Mem[000000001c800000] = 0000699a, %l5 = 000000007bafd24c
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x046,%g2
p3_b70:
	membar	#Sync			! Added by membar checker (633)
!	Mem[000000001c000180] = ffffff9b ffff6e38 9b303ad3 a2ed0138
	prefetch [%i0+0x180],1
!	Jump to jmpl_2, CWP = 0
	set	p3_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	%l1 = 0000000000000000, Mem[000000001d800008] = fffff5f8
	stba	%l1,[%i3+%o6]0x80	! Mem[000000001d800008] = 00fff5f8
!	Registers modified during the branch to p3_jmpl_2
!	%l0  = 00d2023800000a36
!	%l0 = 00d2023800000a36, Mem[000000001d8000e1] = 6a58421c
	stba	%l0,[%i3+0x0e1]%asi	! Mem[000000001d8000e0] = 6a36421c

p3_label_68:
!	Jump to jmpl_1, CWP = 0
	set	p3_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001c80001c] = 08d9e14e, %l7 = 0000000000429a04
	ldub	[%i1+0x01e],%l7		! %l7 = 00000000000000e1
!	Registers modified during the branch to p3_jmpl_1
!	%l0  = 00000000a458d8f3
!	%l1  = 0000000000000000
!	%l5  = 0000000000000486
	set	p3_b71,%o7
	fbule,a	p3_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d8001a0] = 73d994a7 a86470f0 665c6b24 5a86158b
	prefetch [%i3+0x1a0],21
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x047,%g2
p3_b71:
!	Registers modified during the branch to p3_far_3
!	%l0  = fffffc128b3a8816
!	%l4  = 000000000000e974
!	%l6  = 00000000a946a946
!	%l7  = 00d202385b70c205
	membar	#Sync			! Added by membar checker (634)
!	%l4 = 000000000000e974, immed = fffff922, %l1 = 0000000000000000
	xnor	%l4,-0x6de,%l1		! %l1 = 000000000000efa9

p3_label_69:
!	%f30 = 3c4910b1 10408c9b, %f16 = e78f218d 22e0cc01
	fcmped	%fcc2,%f30,%f16		! %fcc2 = 2
!	%l0 = fffffc128b3a8816, %l4 = 000000000000e974, %y  = fffffc12
	sdivcc	%l0,%l4,%l4		! %l4 = fffffffffbb16fe2, %ccr = 88
!	%f24 = bffe0000 00000000, %f4  = 00000000 00000000, %f24 = bffe0000 00000000
	fsubd	%f24,%f4 ,%f24		! %f24 = bffe0000 00000000
!	%l5 = 0000000000000486, %l6 = 00000000a946a946, %l1 = 000000000000efa9
	addcc	%l5,%l6,%l1		! %l1 = 00000000a946adcc, %ccr = 08
	set	p3_b72,%o7
	fbuge,pn %fcc3,p3_near_1_he	! Branch Taken, %fcc3 = 0

p3_label_70:
!	%l3 = 000001bbfa82a3d6, Mem[000000001c00017b] = b3718b2f
	stb	%l3,[%i0+0x17b]		! Mem[000000001c000178] = b3718bd6
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x048,%g2
p3_b72:
!	Registers modified during the branch to p3_near_1
!	%l4  = ffffffffffecc86a
	membar	#Sync			! Added by membar checker (635)
!	Mem[000000001d800008] = 00fff5f8, %l1 = 00000000a946adcc
	ldsha	[%i3+%o6]0x80,%l1	! %l1 = 00000000000000ff
!	%l0 = fffffc128b3a8816, immed = 00000c7c, %l3 = 000001bbfa82a3d6
	or	%l0,0xc7c,%l3		! %l3 = fffffc128b3a8c7e
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001d800000] = ffffffff, %l0 = fffffc128b3a8816
	ldsha	[%i3+%g0]0x80,%l0	! Annulled
p3_b73:

p3_label_71:
	membar	#Sync			! Added by membar checker (636)
!	%l5 = 0000000000000486, Mem[000000001d800000] = ffffffff
	stwa	%l5,[%i3+%g0]0x80	! Mem[000000001d800000] = 00000486
!	%l2 = 00d2023800000000, %l7 = 00d202385b70c205, %l0 = fffffc128b3a8816
	addcc	%l2,%l7,%l0		! %l0 = 01a404705b70c205, %ccr = 00
!	%f16 = e78f218d 22e0cc01, %f20 = 41da11cd 65800000
	fcmpd	%fcc1,%f16,%f20		! %fcc1 = 1
!	%f15 = 7fbc38c6, %f28 = 22e0cc01
	fcmps	%fcc0,%f15,%f28		! %fcc0 = 3
	nop				! Delay added due to fcmp
	set	p3_b74,%o7
	fbo,pt	%fcc1,p3_near_2_he	! Branch Taken, %fcc1 = 1

p3_label_72:
!	Mem[000000001c800000] = 0000699ab1be224e, %l7 = 00d202385b70c205
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 0000699ab1be224e
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x04a,%g2
p3_b74:
!	Registers modified during the branch to p3_near_2
!	%l6  = 00000000000b4fa5
	membar	#Sync			! Added by membar checker (637)
!	%f20 = 41da11cd, %f24 = bffe0000 00000000
	fitod	%f20,%f24		! %f24 = 41d07684 73400000
!	call to call_0, CWP = 0
	call	p3_call_0_le
!	Mem[000000001c800008] = ffffffff, %l3 = fffffc128b3a8c7e
	lduwa	[%i1+%o6]0x80,%l3	! %l3 = 00000000ffffffff
!	Registers modified during the branch to p3_call_0
!	%l0  = 00000000119e0e84
!	%l1  = 00d26ba2b1be224e
!	%l5  = 0000000042c14c8e
!	%l6  = 01a404705b70b806
!	%l3 = 00000000ffffffff
	setx	0xd0e1ceaad0e1ceaa,%g7,%l3 ! %l3 = d0e1ceaad0e1ceaa

p3_label_73:
!	%l6 = 01a404705b70b806, immed = 0000001c, %l6 = 01a404705b70b806
	srlx	%l6,0x01c,%l6		! %l6 = 000000001a404705
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l1 = 00d26ba2b1be224e, Mem[000000001c800000] = 0000699a
	stba	%l1,[%i1+%g0]0x80	! Annulled
p3_b75:
	membar	#Sync			! Added by membar checker (638)
!	%l5 = 0000000042c14c8e, Mem[000000001d000000] = 000001bb
	stba	%l5,[%i2+%g0]0x80	! Mem[000000001d000000] = 8e0001bb
!	Mem[000000001c000008] = ffffffff, %l0 = 00000000119e0e84
	ldstuba	[%i0+%o6]0x80,%l0	! %l0 = 00000000000000ff

p3_label_74:
	set	p3_b76,%o7
	fbo,a,pt %fcc1,p3_near_2_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000032000028] = a4176408 4b729f64, %l4 = ffecc86a, %l5 = 42c14c8e
	ldd	[%o4+0x028],%g2		! %l4 = ffffffffffecc86a 0000000042c14c8e
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x04c,%g2
p3_b76:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000000846b1
!	%l2  = 0000000000000000
!	%l3  = 0000000040aa5985
	membar	#Sync			! Added by membar checker (639)
	fbue,pn	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001c800008] = ffffffff fffffb27, %l6 = 1a404705, %l7 = b1be224e
	ldda	[%i1+%o6]0x80,%l6	! %l6 = 00000000ffffffff 00000000fffffb27
p3_b77:
	membar	#Sync			! Added by membar checker (640)
!	Branch On Register, %l6 = 00000000ffffffff
	brlez,a,pn %l6,p3_not_taken_0	! Branch Not Taken

p3_label_75:
!	Mem[000000001c800008] = ffffffff, %l3 = 0000000040aa5985
	lduwa	[%i1+%o6]0x80,%l3	! Annulled
p3_b78:
	bcc,a	p3_b79			! Branch Taken, %ccr = 00, CWP = 0
!	%l2 = 0000000000000000, Mem[000000001d800000] = 00000486ffffffff
	stxa	%l2,[%i3+%g0]0x80	! Mem[000000001d800000] = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x04f,%g2
p3_b79:
	membar	#Sync			! Added by membar checker (641)
!	%l6 = 00000000ffffffff, %l7 = 00000000fffffb27, %l6 = 00000000ffffffff
	taddcc	%l6,%l7,%l6		! %l6 = 00000001fffffb26, %ccr = 0b
	bcs,a	p3_b80			! Branch Taken, %ccr = 0b, CWP = 0

p3_label_76:
!	Mem[000000001e800000] = 3b7bb77c, %l4 = ffffffffffecc86a
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 000000000000003b
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x050,%g2
p3_b80:
	membar	#Sync			! Added by membar checker (642)
!	Mem[000000001d000008] = 00d20238, %l1 = 00000000000846b1
	lduha	[%i2+%o6]0x80,%l1	! %l1 = 00000000000000d2
!	Branch On Register, %l6 = 00000001fffffb26
	brgz,a,pn %l6,p3_b81		! Branch Taken
!	Mem[0000000032000078] = 55bd30fe, %l7 = 00000000fffffb27
	ldub	[%o4+0x079],%g2		! %g2 = 0000000000000055
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x051,%g2
p3_b81:
	membar	#Sync			! Added by membar checker (643)
!	%f24 = 41d07684 73400000, %f4  = 00000000 00000000, %f26 = e78f218d 22e0cc01
	fmuld	%f24,%f4 ,%f26		! %f26 = 00000000 00000000

p3_label_77:
!	Mem[000000001d800008] = 00fff5f8, %l6 = 00000001fffffb26
	ldstuba	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030000030] = 7afa0e8b, %l6 = 0000000000000000
	lduw	[%o0+0x030],%l6		! %l6 = 000000007afa0e8b
	bneg,a	p3_b82			! Branch Taken, %ccr = 0b, CWP = 0
!	%l7 = 00000000fffffb27, Mem[000000003180007a] = a946a946
	sth	%l7,[%o3+0x07a]		! Mem[0000000031800078] = a946fb27
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x052,%g2
p3_b82:
	membar	#Sync			! Added by membar checker (644)
!	%f4  = 00000000, %f5  = 00000000, %f12 = 3ef9477e
	fmuls	%f4 ,%f5 ,%f12		! %f12 = 00000000

p3_label_78:
!	Mem[000000001c000040] = 3ef9477e 00000000, %l5 = 0000000042c14c8e, %l1 = 00000000000000d2
	add	%i0,0x40,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 891875c5c20fab3f
!	%l0 = 00000000000000ff, Mem[000000001d000008] = 00d20238
	stwa	%l0,[%i2+%o6]0x80	! Mem[000000001d000008] = 000000ff
!	%f26 = 00000000 00000000, %f16 = e78f218d 22e0cc01
	fmovd	%f26,%f16		! %f16 = 00000000 00000000
!	Branch On Register, %l3 = 0000000040aa5985
	brnz,a,pn %l3,p3_b83		! Branch Taken
!	Mem[000000001c000000] = 00000000, %l4 = 000000000000003b
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x053,%g2
p3_b83:

p3_label_79:
	membar	#Sync			! Added by membar checker (645)
!	Mem[000000001d000150] = 00000000 00000000, %l7 = 00000000fffffb27, %l6 = 000000007afa0e8b
	add	%i2,0x150,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = e5f41a483a0df722
!	Mem[0000000030000070] = 77ed0486 bd4bbd95, %l6 = 3a0df722, %l7 = fffffb27
	ldda	[%o0+0x070]%asi,%l6	! %l6 = 0000000077ed0486 00000000bd4bbd95
!	%l5 = 0000000042c14c8e, Mem[000000001d000000] = 8e0001bb
	stwa	%l5,[%i2+%g0]0x80	! Mem[000000001d000000] = 42c14c8e
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000032000040] = c78fef2b 03faa03f 9b5d61a9 40aa5985
	prefetch [%o4+0x040],21
p3_b84:

p3_label_80:
	membar	#Sync			! Added by membar checker (646)
!	Mem[000000001c0000a0] = 8690aaa9 c6592447 dcbbf811 2347aca5
	prefetch [%i0+0x0a0],1
!	%l6 = 0000000077ed0486, Mem[000000001d000011] = 5dd9a630
	stb	%l6,[%i2+0x011]		! Mem[000000001d000010] = 5d86a630
!	%l0 = 00000000000000ff, Mem[000000001c000109] = 8346cb10
	stba	%l0,[%i0+0x109]%asi	! Mem[000000001c000108] = 83ffcb10
!	%l5 = 0000000042c14c8e, %l2 = 0000000000000000, %l5 = 0000000042c14c8e
	srl	%l5,%l2,%l5		! %l5 = 0000000042c14c8e
!	%f4  = 00000000, %f22 = f351e08e, %f26 = 00000000
	fsubs	%f4 ,%f22,%f26		! %f26 = 7351e08e

p3_label_81:
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 0b
!	Mem[000000001d800000] = 00000000 00000000 fffff5f8 9b5d633c
	prefetch [%i3+0x000],0	! Annulled
p3_b85:
	fblg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001d800060] = dc76ec7b cb2416e2 b3e73138 6ba1b825
	prefetch [%i3+0x060],23
p3_b86:
	membar	#Sync			! Added by membar checker (647)
!	%f22 = f351e08e, %f12 = 00000000
	fabss	%f22,%f12		! %f12 = 7351e08e

p3_label_82:
	fblg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000030800074] = 5b70c205, %l5 = 0000000042c14c8e
	ldsh	[%o1+0x074],%l5		! Annulled
p3_b87:
	membar	#Sync			! Added by membar checker (648)
!	%l2 = 0000000000000000
	setx	0x2c3e77ef2c3e77ef,%g7,%l2 ! %l2 = 2c3e77ef2c3e77ef
!	Branch On Register, %l2 = 2c3e77ef2c3e77ef
	brgez,a,pt %l2,p3_b88		! Branch Taken
!	Mem[000000001c800000] = 0000699a, %l7 = 00000000bd4bbd95
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x058,%g2
p3_b88:

p3_label_83:
	set	p3_b89,%o7
	fbule,a	p3_far_1_le	! Branch Taken, %fcc0 = 3
!	%l4 = 00000000, %l5 = 42c14c8e, Mem[000000001d8000a8] = ef9f6e00 d29b6b99
	std	%l4,[%i3+0x0a8]	! Mem[000000001d8000a8] = 00000000 42c14c8e
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x059,%g2
p3_b89:
!	Registers modified during the branch to p3_far_1
!	%l0  = 000000000014bdb3
!	%l1  = 00000000e4f26e38
!	%l3  = 000000000000101d
!	%l5  = 0000000000d702f8
!	%l7  = 00000000001d9b09
	membar	#Sync			! Added by membar checker (649)
!	%l1 = 00000000e4f26e38, %l5 = 0000000000d702f8, %l6 = 0000000077ed0486
	orncc	%l1,%l5,%l6		! %l6 = fffffffffffaff3f, %ccr = 88
!	%l2 = 2c3e77ef2c3e77ef, immed = fffffb00, %l7 = 00000000001d9b09
	addccc	%l2,-0x500,%l7		! %l7 = 2c3e77ef2c3e72ef, %ccr = 11
!	%l6 = fffffffffffaff3f, immed = fffffd0c, %y  = 00000000
	mulx	%l6,-0x2f4,%l4		! %l4 = 000000000ec639f4

p3_label_84:
	set	p3_b90,%o7
	fbuge,pn %fcc2,p3_near_1_le	! Branch Taken, %fcc2 = 2
!	%l6 = fffffffffffaff3f, Mem[0000000032000038] = 5506e65d8e654ab1
	stx	%l6,[%o4+0x038]		! Mem[0000000032000038] = fffffffffffaff3f
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x05a,%g2
p3_b90:
!	Registers modified during the branch to p3_near_1
!	%l7  = fffffffffd3ff7ef
	membar	#Sync			! Added by membar checker (650)
!	%l4 = 0ec639f4, %l5 = 00d702f8, Mem[0000000031000070] = fffff5f8 00429a04
	std	%l4,[%o2+0x070]	! Mem[0000000031000070] = 0ec639f4 00d702f8
!	%f6  = 7fbc38c6 3bbcdebd, %f16 = 00000000 00000000, %f8  = 41cdde6f 6277c000
	fsubd	%f6 ,%f16,%f8 		! %f8  = 7fbc38c6 3bbcdebd
!	%f30 = 3c4910b1, %f24 = 41d07684 73400000
	fstod	%f30,%f24		! %f24 = 3f892216 20000000

p3_label_85:
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c800000] = 0000699a, %l7 = fffffffffd3ff7ef
	ldswa	[%i1+%g0]0x80,%l7	! Annulled
p3_b91:
	membar	#Sync			! Added by membar checker (651)
!	%f14 = 4a487859 7fbc38c6, %f8  = 7fbc38c6 3bbcdebd
	fcmpd	%fcc2,%f14,%f8 		! %fcc2 = 1
	nop				! Delay added due to fcmp
	set	p3_b92,%o7
	fbo,a,pt %fcc2,p3_near_2_le	! Branch Taken, %fcc2 = 1
!	%l3 = 000000000000101d, Mem[0000000031000038] = b252840ec0a4a893
	stx	%l3,[%o2+0x038]		! Mem[0000000031000038] = 000000000000101d
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x05c,%g2
p3_b92:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000ac54223d
!	%l2  = 0000000000000000
!	%l3  = 0000000040aa5985

p3_label_86:
	membar	#Sync			! Added by membar checker (652)
!	Mem[0000000031800078] = a946fb27, %l3 = 40aa5985, %l3 = 40aa5985
	add	%o3,0x78,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000a946fb27
!	%l1 = 00000000ac54223d, %l1 = 00000000ac54223d, %y  = 00000000
	udiv	%l1,%l1,%l6		! %l6 = 0000000000000001
	set	p3_b93,%o7
	fbne,a	p3_far_2_he	! Branch Taken, %fcc0 = 3
!	Mem[000000001c8000e0] = 4dde24b6 2c70e2b6 19bab705 4098afda
	prefetch [%i1+0x0e0],2
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x05d,%g2
p3_b93:
!	Registers modified during the branch to p3_far_2
!	%l5  = 00562a111e800000
	membar	#Sync			! Added by membar checker (653)
!	%l7 = fffffffffd3ff7ef, immed = 00000d10, %y  = 00000000
	umul	%l7,0xd10,%l1		! %l1 = 00000cec1396a1f0

p3_label_87:
	set	p3_b94,%o7
	fbuge,a	p3_far_1_he	! Branch Taken, %fcc0 = 3
!	Mem[000000001c000000] = ff000000, %l0 = 000000000014bdb3
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x05e,%g2
p3_b94:
!	Registers modified during the branch to p3_far_1
!	%l3  = ffd3ff7ef0000000
!	%l5  = 00000000000039f4
!	%l6  = fd3fe8b5537c25a4
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	%l0 = 00000000000000ff, Mem[000000001d0000e8] = 466d958f
	stw	%l0,[%i2+0x0e8]		! Mem[000000001d0000e8] = 000000ff
p3_b95:
	membar	#Sync			! Added by membar checker (654)
!	Mem[000000001f000000] = 42b40925, %l6 = fd3fe8b5537c25a4
	lduha	[%i6+%g0]0x80,%l6	! %l6 = 00000000000042b4

p3_label_88:
!	%l4 = 000000000ec639f4, %l6 = 00000000000042b4, %l2 = 0000000000000000
	xnor	%l4,%l6,%l2		! %l2 = fffffffff13984bf
!	%f23 = bf33c680, %f25 = 20000000, %f6  = 7fbc38c6 3bbcdebd
	fsmuld	%f23,%f25,%f6 		! %f6  = bbf678d0 00000000
!	Jump to jmpl_1, CWP = 0
	set	p3_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001d000140] = f613e721 42f8d335 a55bca4c 4e360878
	prefetch [%i2+0x140],2
!	Registers modified during the branch to p3_jmpl_1
!	%l0  = 00000000a458d8f3
!	%l1  = 0000000000003fff
!	%l5  = 0000000000000486
!	Mem[0000000031800070] = 2de0ad74, %l0 = 00000000a458d8f3
	lduw	[%o3+0x070],%l0		! %l0 = 000000002de0ad74

p3_label_89:
	bgu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[000000001d8000e0] = 6a36421c f8793796 7398c137 76f7b63b
	prefetch [%i3+0x0e0],22	! Annulled
p3_b96:
	membar	#Sync			! Added by membar checker (655)
!	Mem[0000000031000037] = 22251c41, %l1 = 0000000000003fff
	ldstuba	[%o2+0x037]%asi,%l1	! %l1 = 0000000000000041
!	%l5 = 0000000000000486, immed = 00000e37, %l6 = 00000000000042b4
	addccc	%l5,0xe37,%l6		! %l6 = 00000000000012be, %ccr = 00
!	%l0 = 2de0ad74, %l1 = 00000041, Mem[000000001c800000] = 0000699a b1be224e
	stda	%l0,[%i1+%g0]0x80	! Mem[000000001c800000] = 2de0ad74 00000041

p3_label_90:
	bg	p3_b97			! Branch Taken, %ccr = 00, CWP = 0
!	%l2 = fffffffff13984bf, Mem[000000001d800000] = 00000000
	stha	%l2,[%i3+%g0]0x80	! Mem[000000001d800000] = 84bf0000
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x061,%g2
p3_b97:
	membar	#Sync			! Added by membar checker (656)
!	Mem[000000001d0000a0] = 32bd17d8 55e6900c 2226d305 1fd31d7e
	prefetch [%i2+0x0a0],20
!	%f11 = 5adb5880, %f11 = 5adb5880, %f21 = 65800000
	fdivs	%f11,%f11,%f21		! %f21 = 3f800000
	bcc	p3_b98			! Branch Taken, %ccr = 00, CWP = 0

p3_label_91:
!	Mem[000000001d800000] = 84bf0000, %l6 = 00000000000012be
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffff84bf
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x062,%g2
p3_b98:
	membar	#Sync			! Added by membar checker (657)
!	Mem[000000001c800000] = 2de0ad74, %l0 = 000000002de0ad74
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 000000000000002d
	bne,a	p3_b99			! Branch Taken, %ccr = 00, CWP = 0
!	%l5 = 0000000000000486, Mem[000000001d000008] = 000000ff
	stwa	%l5,[%i2+%o6]0x80	! Mem[000000001d000008] = 00000486
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x063,%g2
p3_b99:
	membar	#Sync			! Added by membar checker (658)
!	%l4 = 000000000ec639f4, %l0 = 000000000000002d, %l6 = ffffffffffff84bf
	and	%l4,%l0,%l6		! %l6 = 0000000000000024

p3_label_92:
!	%l7 = fffffffffd3ff7ef, Mem[0000000031800038] = 75cff706
	stha	%l7,[%o3+0x038]%asi	! Mem[0000000031800038] = f7eff706
	bvc	p3_b100			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c000008] = ffffffffffffffff, %l1 = 0000000000000041
	ldxa	[%i0+%o6]0x80,%l1	! %l1 = ffffffffffffffff
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x064,%g2
p3_b100:
	membar	#Sync			! Added by membar checker (659)
!	Mem[000000001c000000] = ff000000, %l2 = fffffffff13984bf
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	%l6 = 0000000000000024, immed = 00000b94, %y  = fd3fe8b5
	umul	%l6,0xb94,%l6		! %l6 = 000000000001a0d0

p3_label_93:
	set	p3_b101,%o7
	fbue,a,pn %fcc3,p3_near_3_he	! Branch Taken, %fcc3 = 0
!	%l6 = 0001a0d0, %l7 = fd3ff7ef, Mem[000000001c000000] = ff000000 bb84edf3
	stda	%l6,[%i0+%g0]0x80	! Mem[000000001c000000] = 0001a0d0 fd3ff7ef
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x065,%g2
p3_b101:
!	Registers modified during the branch to p3_near_3
!	%l6  = 7afa0e8bb6453fd3
	membar	#Sync			! Added by membar checker (660)
!	Mem[000000001c0000c0] = ca5f5b2c 42f2130d 28c635fb 8252f492
	prefetch [%i0+0x0c0],16
!	%l3 = ffd3ff7ef0000000, immed = 00000cf1, %l7 = fffffffffd3ff7ef
	add	%l3,0xcf1,%l7		! %l7 = ffd3ff7ef0000cf1
!	%f20 = 41da11cd 3f800000, %f10 = c0e03449 5adb5880
	fdtox	%f20,%f10		! %f10 = 00000000 684734fe

p3_label_94:
!	Mem[0000000031000078] = 34647f13fed80d66, %l6 = 7afa0e8bb6453fd3
	ldxa	[%o2+0x078]%asi,%l6	! %l6 = 34647f13fed80d66
	bvs	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l4 = 000000000ec639f4, Mem[000000001c800000] = 2de0ad74
	stha	%l4,[%i1+%g0]0x80	! Mem[000000001c800000] = 39f4ad74
p3_b102:
	membar	#Sync			! Added by membar checker (661)
!	Mem[000000001d0000e0] = b31104d1 7a084393 000000ff 9d76cb4e
	prefetcha [%i2+0x0e0]%asi,4
!	%l2 = ff000000, %l3 = f0000000, Mem[000000001d000000] = 42c14c8e fa82a3d6
	stda	%l2,[%i2+%g0]0x80	! Mem[000000001d000000] = ff000000 f0000000

p3_label_95:
	fbge,pn	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000032000000] = 33b3aecd 3445cb05 6b78d8c7 d8311ea6
	prefetch [%o4+0x000],23
p3_b103:
	membar	#Sync			! Added by membar checker (662)
!	%l6 = 34647f13fed80d66, Mem[000000001d800008] = fffff5f8
	stha	%l6,[%i3+%o6]0x80	! Mem[000000001d800008] = 0d66f5f8
!	%f20 = 41da11cd 3f800000, %f8  = 7fbc38c6 3bbcdebd
	fdtox	%f20,%f8 		! %f8  = 00000000 684734fe
!	Mem[0000000031000034] = 22251cff, %l5 = 0000000000000486
	ldsha	[%o2+0x034]%asi,%l5	! %l5 = 0000000000002225

p3_label_96:
!	Mem[000000001d000100] = 538d6b9c e72a71c2 e1e1afed 49c1c542
	prefetcha [%i2+0x100]%asi,2
!	%l1 = ffffffffffffffff, Mem[000000001d000000] = ff000000
	stba	%l1,[%i2+%g0]0x80	! Mem[000000001d000000] = ff000000
!	%l6 = fed80d66, %l7 = f0000cf1, Mem[000000001c000118] = ffffffff ef9f6e00
	std	%l6,[%i0+0x118]	! Mem[000000001c000118] = fed80d66 f0000cf1
!	%l5 = 0000000000002225, immed = fffff27e, %l4 = 000000000ec639f4
	taddcc	%l5,-0xd82,%l4		! %l4 = 00000000000014a3, %ccr = 13
!	%l4 = 00000000000014a3
	sethi	%hi(0xfb7b8c00),%l4	! %l4 = 00000000fb7b8c00

p3_label_97:
!	%l5 = 0000000000002225, %l5 = 0000000000002225, %l2 = 00000000ff000000
	subc	%l5,%l5,%l2		! %l2 = ffffffffffffffff
!	%f23 = bf33c680, %f0  = 00000000, %f12 = 7351e08e
	fsubs	%f23,%f0 ,%f12		! %f12 = bf33c680
!	call to call_1, CWP = 0
	call	p3_call_1_he
!	%l5 = 0000000000002225, Mem[000000001d0001ac] = 2f18c5f8
	stw	%l5,[%i2+0x1ac]		! Mem[000000001d0001ac] = 00002225
!	Registers modified during the branch to p3_call_1
!	%l0  = 0000000000000020
!	%l4  = ffffffffffffffff
!	%l5  = 002c00810ffff91d
!	%l6  = ffd3ff7ef0000cf2
!	%l0 = 0000000000000020, %l7 = ffd3ff7ef0000cf1, %l7 = ffd3ff7ef0000cf1
	srlx	%l0,%l7,%l7		! %l7 = 0000000000000000

p3_label_98:
	fbn,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	%l4 = ffffffffffffffff, Mem[000000001d800000] = 84bf000000000000
	stxa	%l4,[%i3+%g0]0x80	! Annulled
p3_b104:
	membar	#Sync			! Added by membar checker (663)
!	%f18 = 41cdde6f, %f21 = 3f800000
	fabss	%f18,%f21		! %f21 = 41cdde6f
!	%l3 = ffd3ff7ef0000000, %l7 = 0000000000000000, %l5 = 002c00810ffff91d
	orncc	%l3,%l7,%l5		! %l5 = ffffffffffffffff, %ccr = 88
!	%l6 = ffd3ff7ef0000cf2, %l2 = ffffffffffffffff, %l0 = 0000000000000020
	xnorcc	%l6,%l2,%l0		! %l0 = ffd3ff7ef0000cf2, %ccr = 88

p3_label_99:
	set	p3_b105,%o7
	fbule,a,pt %fcc2,p3_near_0_le	! Branch Taken, %fcc2 = 1
!	%l7 = 0000000000000000, Mem[000000001d000000] = ff000000
	stwa	%l7,[%i2+%g0]0x80	! Mem[000000001d000000] = 00000000
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x069,%g2
p3_b105:
!	Registers modified during the branch to p3_near_0
!	%l7  = 000000000000699a
	membar	#Sync			! Added by membar checker (664)
!	Mem[000000003200000c] = d8311ea6, %l7 = 000000000000699a
	ldswa	[%o4+0x00c]%asi,%g2	! %g2 = 000000000000699a
	set	p3_b106,%o7
	fbuge,a	p3_far_1_he	! Branch Taken, %fcc0 = 3
!	%l2 = ffffffffffffffff, Mem[000000001d80013b] = e88fac54
	stb	%l2,[%i3+0x13b]		! Mem[000000001d800138] = e88facff
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x06a,%g2
p3_b106:
!	Registers modified during the branch to p3_far_1
!	%l3  = 00000699a0000000
!	%l5  = 00000000000039f4
!	%l6  = 00006999f9a6b9d8

p3_label_100:
	membar	#Sync			! Added by membar checker (665)
!	%l4 = ffffffffffffffff, immed = 0000077c, %y  = 00006999
	sdiv	%l4,0x77c,%l7		! %l7 = 000000007fffffff
!	Mem[000000001c800158] = 914d56a9, %l5 = 00000000000039f4
	ldsba	[%i1+0x159]%asi,%l5	! %l5 = 000000000000004d
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	 Annulled
	ldda	[%i3+%g0]0x80,%l2
p3_b107:
	membar	#Sync			! Added by membar checker (666)
!	Mem[000000001d8000cf] = abcaeef6, %l4 = ffffffffffffffff
	ldstuba	[%i3+0x0cf]%asi,%l4	! %l4 = 00000000000000f6

p3_label_101:
	fbge,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l6 = f9a6b9d8, %l7 = 7fffffff, Mem[000000001c000008] = ffffffff ffffffff
	stda	%l6,[%i0+%o6]0x80	! Annulled
p3_b108:
	membar	#Sync			! Added by membar checker (667)
!	%l4 = 00000000000000f6, Mem[0000000031000030] = 7e802ef922251cff
	stx	%l4,[%o2+0x030]		! Mem[0000000031000030] = 00000000000000f6

	ba,a	p3_not_taken_0_end
p3_not_taken_0:
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba,a	p3_branch_failed
p3_not_taken_0_end:

!	%l7 = 000000007fffffff, immed = 000004f3, %y  = 00006999
	umulcc	%l7,0x4f3,%l0		! %l0 = 000002797ffffb0d, %ccr = 00
!	Mem[000000001d0001b0] = f9a6b9d8 7fffffff, %l5 = 000000000000004d, %l3 = 00000699a0000000
	add	%i2,0x1b0,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 91e599c78340683c

p3_label_102:
	set	p3_b109,%o7
	fbule	p3_far_1_le	! Branch Taken, %fcc0 = 3
!	Mem[000000001c800000] = 39f4ad7400000041, %l3 = 91e599c78340683c
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 39f4ad7400000041
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x06d,%g2
p3_b109:
!	Registers modified during the branch to p3_far_1
!	%l0  = 000000000014bdb3
!	%l1  = 00000000e4f26e38
!	%l3  = 000000000000101d
!	%l5  = 0000000000d702f8
!	%l7  = 00000000003da161
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l6 = f9a6b9d8, %l7 = 003da161, Mem[000000001e000008] = 987cbf79 d6f82c43
	stda	%l6,[%i4+%o6]0x80	! Mem[000000001e000008] = f9a6b9d8 003da161
p3_b110:
	membar	#Sync			! Added by membar checker (668)
!	%l0 = 000000000014bdb3, %l4 = 00000000000000f6, %l4 = 00000000000000f6
	andncc	%l0,%l4,%l4		! %l4 = 000000000014bd01, %ccr = 00

p3_label_103:
!	%l4 = 0014bd01, %l5 = 00d702f8, Mem[000000001c000008] = ffffffff ffffffff
	stda	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = 0014bd01 00d702f8
!	Mem[000000001d000020] = 7d5435e1 ad1593aa 5d69dae0 c4795a9e
	prefetch [%i2+0x020],0
!	Mem[000000001d8001a0] = 73d994a7, %l7 = 00000000003da161
	ldsha	[%i3+0x1a2]%asi,%l7	! %l7 = ffffffffffff94a7
	fbn,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[000000001c000000] = 0001a0d0, %l3 = 000000000000101d
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = 000000000001a0d0
p3_b111:

p3_label_104:
	set	p3_b112,%o7
	fbule	p3_far_2_le	! Branch Taken, %fcc0 = 3
!	Mem[000000001d8000d8] = 699ac37c, %l2 = ffffffffffffffff
	swap	[%i3+0x0d8],%l2		! %l2 = 00000000699ac37c
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x070,%g2
p3_b112:
	membar	#Sync			! Added by membar checker (669)
!	Mem[000000001d80017c] = c8d5d867, %l1 = 00000000e4f26e38
	lduw	[%i3+0x17c],%l1		! %l1 = 00000000c8d5d867
	fbge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001c8001a0] = 31594954, %l6 = 00006999f9a6b9d8
	ldub	[%i1+0x1a2],%l6		! %l6 = 0000000000000049
p3_b113:

p3_label_105:
	membar	#Sync			! Added by membar checker (670)
!	%l7 = ffffffffffff94a7, %l5 = 0000000000d702f8, %l1 = 00000000c8d5d867
	sllx	%l7,%l5,%l1		! %l1 = a700000000000000
	fbge,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000001c000000] = 0001a0d0, %l3 = 000000000001a0d0
	lduha	[%i0+%g0]0x80,%l3	! Annulled
p3_b114:
	membar	#Sync			! Added by membar checker (671)
!	%l4 = 000000000014bd01, Mem[000000001c000008] = 0014bd0100d702f8
	stxa	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = 000000000014bd01
!	Mem[000000001c800024] = 7ec470af, %l3 = 000000000001a0d0
	ldsh	[%i1+0x024],%l3		! %l3 = 0000000000007ec4

p3_label_106:
!	Mem[000000001d800080] = aa4d28aa 7c2eae82 d411f645 b1fa68aa
	prefetcha [%i3+0x080]%asi,22
!	Branch On Register, %l0 = 000000000014bdb3
	brgez,pn %l0,p3_b115		! Branch Taken
!	Mem[000000001d800160] = 3b6c665c f190e1f4 40991618 243ee403
	prefetch [%i3+0x160],0
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x073,%g2
p3_b115:
	membar	#Sync			! Added by membar checker (672)
	fbge,pn	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000032000038] = fffffffffffaff3f, %l0 = 000000000014bdb3
	ldx	[%o4+0x038],%g2		! %g2 = fffffffffffaff3f
p3_b116:

p3_label_107:
	membar	#Sync			! Added by membar checker (673)
!	%l6 = 0000000000000049, immed = fffffad8, %y  = 00000000
	sdiv	%l6,-0x528,%l4		! %l4 = 0000000000000000
!	Branch On Register, %l0 = 000000000014bdb3
	brgz,a,pn %l0,p3_b117		! Branch Taken
!	Mem[000000001d800020] = 00000000 07fff404 c131b41e f69e5a90
	prefetch [%i3+0x020],22
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x075,%g2
p3_b117:
	membar	#Sync			! Added by membar checker (674)
!	%l2 = 00000000699ac37c, Mem[000000003100003a] = 00000000
	sth	%l2,[%o2+0x03a]		! Mem[0000000031000038] = 0000c37c
!	%l3 = 0000000000007ec4, immed = fffff930, %l7 = ffffffffffff94a7
	andn	%l3,-0x6d0,%l7		! %l7 = 00000000000006c4

p3_label_108:
!	%l6 = 0000000000000049, %l7 = 00000000000006c4, %l7 = 00000000000006c4
	orcc	%l6,%l7,%l7		! %l7 = 00000000000006cd, %ccr = 00
!	%l7 = 00000000000006cd, immed = 00000002, %l1 = a700000000000000
	sra	%l7,0x002,%l1		! %l1 = 00000000000001b3
	bge	p3_b118			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d000000] = 00000000, %l2 = 00000000699ac37c
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x076,%g2
p3_b118:
	membar	#Sync			! Added by membar checker (675)
!	Mem[0000000031800078] = a946fb27 5b70c68d, %l2 = 00000000, %l3 = 00007ec4
	ldd	[%o3+0x078],%l2		! %l2 = 00000000a946fb27 000000005b70c68d

p3_label_109:
!	%f21 = 41cdde6f, %f17 = 00000000
	fmovs	%f21,%f17		! %f17 = 41cdde6f
!	%l4 = 0000000000000000, Mem[0000000030000031] = 7afa0e8b
	stb	%l4,[%o0+0x031]		! Mem[0000000030000030] = 7a000e8b
	bpos	p3_b119			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c80004c] = e10a4cf2, %l7 = 00000000000006cd
	swap	[%i1+0x04c],%l7		! %l7 = 00000000e10a4cf2
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x077,%g2
p3_b119:
	membar	#Sync			! Added by membar checker (676)
!	%l4 = 0000000000000000, Mem[000000001c8001bb] = 9e5c394c
	stba	%l4,[%i1+0x1bb]%asi	! Mem[000000001c8001b8] = 9e5c3900

p3_label_110:
!	Mem[000000001d000080] = 4a024687 4f0d6854 14e97a97 5cff7329
	prefetcha [%i2+0x080]%asi,21
!	%l3 = 000000005b70c68d, immed = 00000121, %y  = 00000000
	sdivx	%l3,0x121,%l3		! %l3 = 000000000050ffcd
	fbuge,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l1 = 00000000000001b3, Mem[0000000031800079] = a946fb27
	stb	%l1,[%o3+0x079]		! Annulled
p3_b120:
	membar	#Sync			! Added by membar checker (677)
!	%l6 = 00000049, %l7 = e10a4cf2, Mem[000000001d000000] = 699ac37c f0000000
	stda	%l6,[%i2+%g0]0x80	! Mem[000000001d000000] = 00000049 e10a4cf2

p3_label_111:
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d0001e4] = 00000046, %l6 = 0000000000000049
	ldsh	[%i2+0x1e6],%l6		! Annulled
p3_b121:
	membar	#Sync			! Added by membar checker (678)
!	Mem[000000001c800008] = ffffffff, %l7 = 00000000e10a4cf2
	ldsha	[%i1+%o6]0x80,%l7	! %l7 = ffffffffffffffff
!	%l3 = 000000000050ffcd, immed = 00000724, %y  = 00000000
	sdivcc	%l3,0x724,%l7		! %l7 = 0000000000000b57, %ccr = 00
!	%l5 = 0000000000d702f8, %l1 = 00000000000001b3, %l2 = 00000000a946fb27
	subccc	%l5,%l1,%l2		! %l2 = 0000000000d70145, %ccr = 00

p3_label_112:
!	%f10 = 00000000 684734fe, %f26 = 7351e08e 00000000
	fabsd	%f10,%f26		! %f26 = 00000000 684734fe
!	%l2 = 0000000000d70145, Mem[000000003080003a] = 00000000
	stha	%l2,[%o1+0x03a]%asi	! Mem[0000000030800038] = 00000145
!	Mem[0000000032000060] = 0818b15d e53da238 65b76271 70bda996
	prefetcha [%o4+0x060]%asi,22
!	%l4 = 0000000000000000, immed = 000005e4, %l7 = 0000000000000b57
	taddcc	%l4,0x5e4,%l7		! %l7 = 00000000000005e4, %ccr = 00
	set	p3_b122,%o7
	fbo,a,pn %fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 1

p3_label_113:
!	Mem[000000001c800000] = 39f4ad74, %l6 = 0000000000000049
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 0000000039f4ad74
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x07a,%g2
p3_b122:
!	Registers modified during the branch to p3_near_1
!	%l4  = fffffffffff96ba9
	membar	#Sync			! Added by membar checker (679)
!	Mem[000000004000003e] = 3c87f400, %l3 = 000000000050ffcd
	ldstuba	[%o5+0x03e]%asi,%l3	! %l3 = 00000000000000f4
	fbo,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000030000070] = 77ed02f8bd4bbd95, %l6 = 0000000039f4ad74
	ldx	[%o0+0x070],%l6		! Annulled
p3_b123:
	membar	#Sync			! Added by membar checker (680)
!	Mem[000000001d000008] = 00000486, %l3 = 00000000000000f4
	lduwa	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000486

p3_label_114:
	set	p3_b124,%o7
	fbuge	p3_far_3_he	! Branch Taken, %fcc0 = 3
!	Mem[0000000031800078] = a946fb27 5b70c68d, %l2 = 00d70145, %l3 = 00000486
	ldd	[%o3+0x078],%l2		! %l2 = 00000000a946fb27 000000005b70c68d
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x07c,%g2
p3_b124:
!	Registers modified during the branch to p3_far_3
!	%l0  = fffffc128fc6cf20
!	%l4  = 000000000000e974
!	%l6  = 00000000a946fb27
!	%l7  = 00000000fb76f305
	fbo	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001c800000] = 39f4ad74, %l7 = 00000000fb76f305
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000039f4ad74
p3_b125:
	membar	#Sync			! Added by membar checker (681)
!	%l2 = 00000000a946fb27, %l2 = 00000000a946fb27, %l0 = fffffc128fc6cf20
	add	%l2,%l2,%l0		! %l0 = 00000001528df64e

p3_label_115:
!	%f28 = 22e0cc01, %f26 = 00000000, %f9  = 684734fe
	fadds	%f28,%f26,%f9 		! %f9  = 22e0cc01
!	Mem[0000000031800074] = e4ed7538, %l6 = 00000000a946fb27
	swapa	[%o3+0x074]%asi,%l6	! %l6 = 00000000e4ed7538
!	Mem[0000000030800073] = 39f4ad74, %l7 = 0000000039f4ad74
	ldstub	[%o1+0x073],%l7		! %l7 = 0000000000000074
	bge,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d00017c] = 3b2d798d, %l2 = 00000000a946fb27
	ldsw	[%i2+0x17c],%l2		! Annulled
p3_b126:

p3_label_116:
	membar	#Sync			! Added by membar checker (682)
!	Mem[000000001d000000] = 00000049 e10a4cf2 00000486 00000000
	prefetch [%i2+0x000],22
!	%l2 = 00000000a946fb27, %l2 = 00000000a946fb27, %l2 = 00000000a946fb27
	srlx	%l2,%l2,%l2		! %l2 = 0000000000000000
	nop
!	%f24 = 3f892216 20000000, %f20 = 41da11cd
	fdtos	%f24,%f20		! %f20 = 3c4910b1
	bvc	p3_b127			! Branch Taken, %ccr = 88, CWP = 0

p3_label_117:
!	Mem[000000001c800058] = 275b4a2aa1b58c16, %l3 = 000000005b70c68d
	ldx	[%i1+0x058],%l3		! %l3 = 275b4a2aa1b58c16
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x07f,%g2
p3_b127:
	bvc	p3_b128			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000030800074] = 000005e4, %l6 = 00000000e4ed7538
	ldsw	[%o1+0x074],%l6		! %l6 = 00000000000005e4
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x080,%g2
p3_b128:
	fbo,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001c0001a0] = 0600c3aa 7afc9721 eb32acd7 6a0857e9
	prefetch [%i0+0x1a0],22	! Annulled
p3_b129:

p3_label_118:
	membar	#Sync			! Added by membar checker (683)
!	Branch On Register, %l2 = 0000000000000000
	brz,a,pt %l2,p3_b130		! Branch Taken
!	Mem[000000001c800028] = 7647cb32, %l2 = 0000000000000000
	ldsw	[%i1+0x028],%l2		! %l2 = 000000007647cb32
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x082,%g2
p3_b130:
	membar	#Sync			! Added by membar checker (684)
!	%l3 = 275b4a2aa1b58c16, immed = 00000ebe, %y  = fffffc12
	smulcc	%l3,0xebe,%l4		! %l4 = fffffa91f2672c54, %ccr = 88
!	%l5 = 0000000000d702f8, %l6 = 00000000000005e4, %y  = fffffa91
	sdiv	%l5,%l6,%l1		! %l1 = ffffffff80000000
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_119:
!	Mem[0000000030800074] = 000005e4, %l5 = 0000000000d702f8
	ldsh	[%o1+0x074],%l5		! Annulled
p3_b131:
	membar	#Sync			! Added by membar checker (685)
!	Mem[000000001c800148] = 9f2bbf0c, %l1 = ffffffff80000000
	lduba	[%i1+0x148]%asi,%l1	! %l1 = 000000000000009f
!	Mem[000000001d0000c8] = 12e1fc6e 8fb70678, %l0 = 528df64e, %l1 = 0000009f
	ldda	[%i2+0x0c8]%asi,%l0	! %l0 = 0000000012e1fc6e 000000008fb70678
!	%l5 = 0000000000d702f8, %l2 = 000000007647cb32, %l0 = 0000000012e1fc6e
	subc	%l5,%l2,%l0		! %l0 = ffffffff8a8f37c6
!	Mem[000000001d0001e0] = b654dc29, %l4 = fffffa91f2672c54
	ldsb	[%i2+0x1e1],%l4		! %l4 = 0000000000000054

p3_label_120:
!	%f26 = 00000000, %f21 = 41cdde6f, %f30 = 3c4910b1 10408c9b
	fsmuld	%f26,%f21,%f30		! %f30 = 00000000 00000000
!	Mem[0000000031800030] = 0014bdb3e4f26e38, %l7 = 0000000000000074
	ldxa	[%o3+0x030]%asi,%l7	! %l7 = 0014bdb3e4f26e38
	fbo,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001c0000e0] = 70df73f7, %l0 = ffffffff8a8f37c6
	ldsw	[%i0+0x0e0],%l0		! Annulled
p3_b132:
	ba	p3_b133			! Branch Taken, %ccr = 88, CWP = 0

p3_label_121:
!	Mem[000000001d000198] = 6423c08a, %l0 = ffffffff8a8f37c6
	ldsh	[%i2+0x19a],%l0		! %l0 = ffffffffffffc08a
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x085,%g2
p3_b133:
	membar	#Sync			! Added by membar checker (686)
!	Mem[0000000030000038] = 00000000 0000c08a, %l2 = 000000007647cb32, %l5 = 0000000000d702f8
	add	%o0,0x38,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 0000ffffffffffff
!	Mem[000000003100003e] = 0000101d, %l0 = ffffffffffffc08a
	ldstub	[%o2+0x03e],%l0		! %l0 = 0000000000000010
!	%l4 = 0000000000000054, immed = fffff68d, %l2 = 000000007647cb32
	sub	%l4,-0x973,%l2		! %l2 = 00000000000009c7
!	%l0 = 0000000000000010, immed = 000008f0, %l6 = 00000000000005e4
	subccc	%l0,0x8f0,%l6		! %l6 = fffffffffffff720, %ccr = 99

p3_label_122:
!	Mem[000000001d800188] = a0a831da, %l4 = 0000000000000054
	ldswa	[%i3+0x188]%asi,%l4	! %l4 = ffffffffa0a831da
!	%f2  = 3ef9477e c1d37ca3, %f20 = 3c4910b1 41cdde6f
	fcmped	%fcc3,%f2 ,%f20		! %fcc3 = 2
!	Mem[000000001f00015c] = 79b04ed7, %l6 = fffffffffffff720
	ldsba	[%i6+0x15e]%asi,%l6	! %l6 = 000000000000004e
!	Mem[000000001c800008] = ffffffff, %l5 = 0000ffffffffffff
	lduba	[%i1+%o6]0x80,%l5	! %l5 = 00000000000000ff
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3

p3_label_123:
!	Mem[000000001c800120] = 078e8e30 2345cff0 fd2cebe2 7446c3b8
	prefetch [%i1+0x120],20
p3_b134:
	membar	#Sync			! Added by membar checker (687)
	fbue,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l7 = 0014bdb3e4f26e38, Mem[000000001d0001aa] = 70b186e2
	sth	%l7,[%i2+0x1aa]		! Annulled
p3_b135:
	membar	#Sync			! Added by membar checker (688)
	set	p3_b136,%o7
	fbul,a,pt %fcc0,p3_near_2_le	! Branch Taken, %fcc0 = 3
!	Mem[0000000030800034] = 41a01ad3, %l1 = 000000008fb70678
	ldsb	[%o1+0x037],%l1		! %l1 = ffffffffffffffd3
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x088,%g2
p3_b136:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000000084f0
!	%l2  = 00000000ffffffff
!	%l3  = 0000000040aa5985

p3_label_124:
	membar	#Sync			! Added by membar checker (689)
!	%l0 = 0000000000000010, immed = fffff7f2, %l0 = 0000000000000010
	sub	%l0,-0x80e,%l0		! %l0 = 000000000000081e
!	%l0 = 000000000000081e, immed = fffff82b, %l6 = 000000000000004e
	and	%l0,-0x7d5,%l6		! %l6 = 000000000000080a
!	%f6  = bbf678d0 00000000, %f8  = 00000000 22e0cc01
	fabsd	%f6 ,%f8 		! %f8  = 3bf678d0 00000000
!	Branch On Register, %l3 = 0000000040aa5985
	brnz,a,pn %l3,p3_b137		! Branch Taken
!	%l4 = a0a831da, %l5 = 000000ff, Mem[000000001c800000] = fb76f305 00000041
	stda	%l4,[%i1+%g0]0x80	! Mem[000000001c800000] = a0a831da 000000ff
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x089,%g2
p3_b137:

p3_label_125:
	membar	#Sync			! Added by membar checker (690)
!	%l2 = 00000000ffffffff, %l2 = 00000000ffffffff, %l4 = ffffffffa0a831da
	xnorcc	%l2,%l2,%l4		! %l4 = ffffffffffffffff, %ccr = 88
!	%l2 = 00000000ffffffff, Mem[000000001c800008] = ffffffff
	stwa	%l2,[%i1+%o6]0x80	! Mem[000000001c800008] = ffffffff
!	%f3  = c1d37ca3, %f16 = 00000000
	fabss	%f3 ,%f16		! %f16 = 41d37ca3
!	%l4 = ffffffffffffffff, %l6 = 000000000000080a, %l3 = 0000000040aa5985
	subc	%l4,%l6,%l3		! %l3 = fffffffffffff7f5
!	%f18 = 41cdde6f, %f9  = 00000000
	fnegs	%f18,%f9 		! %f9  = c1cdde6f

p3_label_126:
	fbg,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000031000038] = 0000c37c, %l1 = 00000000000084f0
	ldub	[%o2+0x039],%l1		! %l1 = 0000000000000000
p3_b138:
	membar	#Sync			! Added by membar checker (691)
!	Mem[000000001c800000] = a0a831da, %l0 = 000000000000081e
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000a0
!	%l5 = 00000000000000ff, immed = 0000003e, %l3 = fffffffffffff7f5
	sllx	%l5,0x03e,%l3		! %l3 = c000000000000000
!	Mem[000000001d000000] = 00000049, %l3 = c000000000000000
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000

p3_label_127:
!	%l7 = 0014bdb3e4f26e38, %l1 = 0000000000000000, %l1 = 0000000000000000
	xorcc	%l7,%l1,%l1		! %l1 = 0014bdb3e4f26e38, %ccr = 08
!	%l0 = 00000000000000a0, immed = fffff297, %l1 = 0014bdb3e4f26e38
	or	%l0,-0xd69,%l1		! %l1 = fffffffffffff2b7
!	Branch On Register, %l0 = 00000000000000a0
	brgez,a,pt %l0,p3_b139		! Branch Taken
!	Mem[000000001c0001a0] = 0600c3aa 7afc9721 eb32acd7 6a0857e9
	prefetch [%i0+0x1a0],1
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x08b,%g2
p3_b139:
	membar	#Sync			! Added by membar checker (692)
!	Mem[000000001c000060] = b9631352 6f64f394 1a4a73ae 65d5c020
	prefetcha [%i0+0x060]%asi,20

p3_label_128:
!	Mem[000000001d000000] = 00000049, %l7 = 0014bdb3e4f26e38
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000049
	set	p3_b140,%o7
	fbne,a	p3_far_3_le	! Branch Taken, %fcc0 = 3
!	Mem[000000003200005c] = 12280818, %l5 = 00000000000000ff
	ldsh	[%o4+0x05e],%g2		! %g2 = 0000000000001228
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x08c,%g2
p3_b140:
!	Registers modified during the branch to p3_far_3
!	%l1  = 00000000001e65a2
!	%l7  = fffffffffffff7f5
	membar	#Sync			! Added by membar checker (693)
!	%l7 = fffffffffffff7f5, Mem[000000001d800008] = 0d66f5f8
	stha	%l7,[%i3+%o6]0x80	! Mem[000000001d800008] = f7f5f5f8
	bpos	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_129:
!	Mem[000000001d80010c] = 208c9a4d, %l7 = fffffffffffff7f5
	swap	[%i3+0x10c],%l7		! %l7 = 00000000208c9a4d
p3_b141:
	membar	#Sync			! Added by membar checker (694)
!	Mem[000000001c8000c0] = 46c60a29 df63f4f4 00000000 8059b30b
	prefetcha [%i1+0x0c0]%asi,20
!	Mem[000000001d0001f3] = 0a953f8e, %l4 = ffffffffffffffff
	ldstuba	[%i2+0x1f3]%asi,%l4	! %l4 = 000000000000008e
!	%l4 = 000000000000008e, %l0 = 00000000000000a0, %l7 = 00000000208c9a4d
	addccc	%l4,%l0,%l7		! %l7 = 000000000000012e, %ccr = 00
!	%l1 = 00000000001e65a2, %l2 = 00000000ffffffff, %l0 = 00000000000000a0
	addccc	%l1,%l2,%l0		! %l0 = 00000001001e65a1, %ccr = 01

p3_label_130:
	bge,a	p3_b142			! Branch Taken, %ccr = 01, CWP = 0
!	Mem[000000001d000180] = e1bd9630cef2f2fa, %l2 = 00000000ffffffff
	ldx	[%i2+0x180],%l2		! %l2 = e1bd9630cef2f2fa
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x08e,%g2
p3_b142:
	membar	#Sync			! Added by membar checker (695)
!	%l0 = 00000001001e65a1, %l7 = 000000000000012e, %l0 = 00000001001e65a1
	sll	%l0,%l7,%l0		! %l0 = 0000400799684000
	fbl,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001d000150] = e5f41a48, %l4 = 000000000000008e
	ldsb	[%i2+0x151],%l4		! Annulled
p3_b143:

p3_label_131:
	membar	#Sync			! Added by membar checker (696)
!	Branch On Register, %l2 = e1bd9630cef2f2fa
	brz,pt	%l2,p3_not_taken_0	! Branch Not Taken
!	Mem[000000003180003c] = 0602bd59, %l3 = 0000000000000000
	swap	[%o3+0x03c],%l3		! %l3 = 000000000602bd59
p3_b144:
	membar	#Sync			! Added by membar checker (697)
!	%l3 = 000000000602bd59, Mem[0000000031000038] = 0000c37c
	stb	%l3,[%o2+0x038]		! Mem[0000000031000038] = 5900c37c
	set	p3_b145,%o7
	fbge,pt	%fcc3,p3_near_1_he	! Branch Taken, %fcc3 = 2
!	Mem[000000001c000000] = 0001a0d0 fd3ff7ef 00000000 0014bd01
	prefetch [%i0+0x000],4
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x091,%g2
p3_b145:
!	Registers modified during the branch to p3_near_1
!	%l4  = 0000000000000000

p3_label_132:
	set	p3_b146,%o7
	fbue,a	p3_far_0_le	! Branch Taken, %fcc0 = 3
!	Mem[000000001d000000] = 00000049, %l1 = 00000000001e65a2
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x092,%g2
p3_b146:
!	Registers modified during the branch to p3_far_0
!	%l4  = 000000000000012e
!	%l5  = ffffffffffff729c
!	%l6  = 000000000003015e
	membar	#Sync			! Added by membar checker (698)
!	%l4 = 000000000000012e, immed = 00000d6a, %y  = 00000000
	sdivcc	%l4,0xd6a,%l5		! %l5 = 0000000000000000, %ccr = 44
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001d000008] = 0000048600000000, %l0 = 0000400799684000
	ldxa	[%i2+%o6]0x80,%l0	! %l0 = 0000048600000000
p3_b147:

p3_label_133:
	membar	#Sync			! Added by membar checker (699)
	fbe,pn	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000030800038] = 00000145, %l0 = 0000048600000000
	ldsh	[%o1+0x038],%l0		! %l0 = 0000000000000000
p3_b148:
	membar	#Sync			! Added by membar checker (700)
!	%l6 = 000000000003015e, Mem[000000001d800000] = 84bf000000000000
	stxa	%l6,[%i3+%g0]0x80	! Mem[000000001d800000] = 000000000003015e
	fbug,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[000000001c8001a0] = 31594954 2aa5ba4a 7e802ef9 22251c41
	prefetch [%i1+0x1a0],1	! Annulled
p3_b149:

p3_label_134:
	bvs	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000032000040] = c78fef2b 03faa03f 9b5d61a9 40aa5985
	prefetch [%o4+0x040],21
p3_b150:
	membar	#Sync			! Added by membar checker (701)
!	%f27 = 684734fe, %f5  = 00000000
	fnegs	%f27,%f5 		! %f5  = e84734fe
!	%l0 = 0000000000000000, Mem[0000000030800039] = 00000145
	stba	%l0,[%o1+0x039]%asi	! Mem[0000000030800038] = 00000145
!	%l5 = 0000000000000000, immed = 00000d06, %l7 = 000000000000012e
	orncc	%l5,0xd06,%l7		! %l7 = fffffffffffff2f9, %ccr = 88

p3_label_135:
	ble	p3_b151			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000030800078] = b2bee63b, %l1 = 0000000000000000
	ldub	[%o1+0x07b],%l1		! %l1 = 000000000000003b
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x097,%g2
p3_b151:
	membar	#Sync			! Added by membar checker (702)
!	Mem[0000000030800078] = b2bee63bf0b92fcb, %l4 = 000000000000012e
	ldxa	[%o1+0x078]%asi,%l4	! %l4 = b2bee63bf0b92fcb
!	%f10 = 00000000, %f11 = 684734fe, %f30 = 00000000
	fmuls	%f10,%f11,%f30		! %f30 = 00000000
!	%l0 = 0000000000000000, Mem[000000001c800008] = ffffffff
	stba	%l0,[%i1+%o6]0x80	! Mem[000000001c800008] = 00ffffff

p3_label_136:
	set	p3_b152,%o7
	fbne,pt	%fcc0,p3_near_2_he	! Branch Taken, %fcc0 = 3
!	Mem[000000001d800000] = 00000000, %l3 = 000000000602bd59
	lduha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x098,%g2
p3_b152:
!	Registers modified during the branch to p3_near_2
!	%l6  = 0000000000029df9
	membar	#Sync			! Added by membar checker (703)
!	%f16 = 41d37ca3 41cdde6f, %f28 = 22e0cc01 c4a1337c
	fnegd	%f16,%f28		! %f28 = c1d37ca3 41cdde6f
	bpos	p3_not_taken_0		! Branch Not Taken, %ccr = 8a
!	%l5 = 0000000000000000, Mem[000000001c000008] = 00000000
	stha	%l5,[%i0+%o6]0x80	! Mem[000000001c000008] = 00000000
p3_b153:

p3_label_137:
	membar	#Sync			! Added by membar checker (704)
	set	p3_b154,%o7
	fbuge,a,pn %fcc0,p3_near_1_he	! Branch Taken, %fcc0 = 3
!	Mem[000000003180003c] = 00000000, %l1 = 000000000000003b
	ldsw	[%o3+0x03c],%l1		! %l1 = 0000000000000000
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x09a,%g2
p3_b154:
!	Registers modified during the branch to p3_near_1
!	%l4  = ffffffffffffffb4
	membar	#Sync			! Added by membar checker (705)
!	%f14 = 4a487859 7fbc38c6, %f16 = 41d37ca3 41cdde6f
	fcmpd	%fcc1,%f14,%f16		! %fcc1 = 2
!	%l3 = 0000000000000000, %l4 = ffffffffffffffb4, %l6 = 0000000000029df9
	or	%l3,%l4,%l6		! %l6 = ffffffffffffffb4
!	%l4 = ffffffffffffffb4, %l3 = 0000000000000000, %l1 = 0000000000000000
	xnor	%l4,%l3,%l1		! %l1 = 000000000000004b

p3_label_138:
!	%l0 = 00000000, %l1 = 0000004b, Mem[0000000032000018] = 98d866c8 776ec9b5
	std	%l0,[%o4+0x018]	! Mem[0000000032000018] = 00000000 0000004b
!	Mem[000000001d000000] = ff000049, %l1 = 000000000000004b
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[000000003000007c] = 00000000, %l4 = ffffffffffffffb4
	swapa	[%o0+0x07c]%asi,%l4	! %l4 = 0000000000000000
!	%f30 = 00000000 00000000, %f20 = 3c4910b1 41cdde6f, %f14 = 4a487859 7fbc38c6
	fsubd	%f30,%f20,%f14		! %f14 = bc4910b1 41cdde6f
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 8a

p3_label_139:
!	Mem[000000001d000008] = 00000486, %l4 = 0000000000000000
	lduba	[%i2+%o6]0x80,%l4	! Annulled
p3_b155:
	membar	#Sync			! Added by membar checker (706)
	set	p3_b156,%o7
	fbu,pn	%fcc0,p3_near_1_he	! Branch Taken, %fcc0 = 3
!	Mem[000000001c0000f0] = 06ac0cf2, %l0 = 0000000000000000
	ldsh	[%i0+0x0f0],%l0		! %l0 = 00000000000006ac
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x09c,%g2
p3_b156:
!	Registers modified during the branch to p3_near_1
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (707)
!	%f24 = 3f892216 20000000, %f5  = e84734fe
	fdtos	%f24,%f5 		! %f5  = 3c4910b1
!	%l2 = e1bd9630cef2f2fa, %l0 = 00000000000006ac, %l5 = 0000000000000000
	tsubcc	%l2,%l0,%l5		! %l5 = e1bd9630cef2ec4e, %ccr = 8a

p3_label_140:
!	Mem[000000001d000084] = 4f0d6854, %l2 = e1bd9630cef2f2fa
	swap	[%i2+0x084],%l2		! %l2 = 000000004f0d6854
!	%l5 = e1bd9630cef2ec4e
	sethi	%hi(0xe3727800),%l5	! %l5 = 00000000e3727800
!	%f31 = 00000000, %f6  = bbf678d0
	fmovs	%f31,%f6 		! %f6  = 00000000
!	Mem[000000001d800000] = 00000000, %l2 = 000000004f0d6854
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
	fbn,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3

p3_label_141:
!	Mem[0000000031800038] = f7eff706, %l5 = 00000000e3727800
	lduw	[%o3+0x038],%l5		! Annulled
p3_b157:
	membar	#Sync			! Added by membar checker (708)
!	Mem[000000003200006c] = 70bda996, %l3 = 0000000000000000
	ldsha	[%o4+0x06c]%asi,%g2	! %g2 = 00000000000070bd
!	Mem[0000000030800078] = b2bee63b, %l6 = ffffffffffffffb4
	ldsw	[%o1+0x078],%l6		! %l6 = ffffffffb2bee63b
	fbule,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001d800020] = 00000000 07fff404 c131b41e f69e5a90
	prefetch [%i3+0x020],22
p3_b158:

p3_label_142:
	membar	#Sync			! Added by membar checker (709)
!	%l3 = 0000000000000000, %l5 = 00000000e3727800, %l0 = 00000000000006ac
	add	%l3,%l5,%l0		! %l0 = 00000000e3727800
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[000000001e800080] = 51437964 c177097d 76492ae8 794029f6
	prefetch [%i5+0x080],1
p3_b159:
	bvs	p3_b160			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[000000001c0001c4] = 0ab72c91, %l0 = 00000000e3727800
	ldsw	[%i0+0x1c4],%l0		! %l0 = 000000000ab72c91
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x0a0,%g2
p3_b160:

p3_label_143:
	membar	#Sync			! Added by membar checker (710)
!	%l4 = 0000000000000000, Mem[0000000031000034] = 000000f6
	stha	%l4,[%o2+0x034]%asi	! Mem[0000000031000034] = 000000f6
!	%f22 = f351e08e bf33c680, %f4  = 00000000 3c4910b1
	fabsd	%f22,%f4 		! %f4  = 7351e08e bf33c680
!	Mem[000000001c800040] = 26850a85, %l2 = 0000000000000000
	ldsb	[%i1+0x040],%l2		! %l2 = 0000000000000026
!	%l1 = ffffffffffffffff, immed = fffff437, %y  = 00000000
	umul	%l1,-0xbc9,%l1		! %l1 = fffff43600000bc9
!	%l4 = 0000000000000000, immed = fffff3b9, %l0 = 000000000ab72c91
	addccc	%l4,-0xc47,%l0		! %l0 = fffffffffffff3b9, %ccr = 88

p3_label_144:
!	%l3 = 0000000000000000, %l5 = 00000000e3727800, %l3 = 0000000000000000
	orncc	%l3,%l5,%l3		! %l3 = ffffffff1c8d87ff, %ccr = 80
	fbe,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000001d800000] = 4f0d68540003015e, %l4 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = 4f0d68540003015e
p3_b161:
	membar	#Sync			! Added by membar checker (711)
!	Mem[000000001f000008] = 75abb3be, %l5 = 00000000e3727800
	lduha	[%i6+%o6]0x80,%l5	! %l5 = 00000000000075ab
!	%l2 = 0000000000000026, Mem[0000000030800038] = 00000145
	stwa	%l2,[%o1+0x038]%asi	! Mem[0000000030800038] = 00000026

p3_label_145:
!	%l1 = fffff43600000bc9, immed = 00000923, %l6 = ffffffffb2bee63b
	addcc	%l1,0x923,%l6		! %l6 = fffff436000014ec, %ccr = 80
!	Branch On Register, %l0 = fffffffffffff3b9
	brnz,pn	%l0,p3_b162		! Branch Taken
!	%l5 = 00000000000075ab, Mem[000000001d800008] = f7f5f5f8
	stba	%l5,[%i3+%o6]0x80	! Mem[000000001d800008] = abf5f5f8
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x0a2,%g2
p3_b162:
	membar	#Sync			! Added by membar checker (712)
!	%l1 = fffff43600000bc9, Mem[000000001d000096] = 6697f840
	stha	%l1,[%i2+0x096]%asi	! Mem[000000001d000094] = 66970bc9
	set	p3_b163,%o7
	fble,a,pn %fcc2,p3_near_0_le	! Branch Taken, %fcc2 = 1

p3_label_146:
!	%l2 = 0000000000000026, Mem[000000003180007c] = 5b70c68d
	stw	%l2,[%o3+0x07c]		! Mem[000000003180007c] = 00000026
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0a3,%g2
p3_b163:
!	Registers modified during the branch to p3_near_0
!	%l7  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (713)
!	%l7 = ffffffffffffffff, immed = fffff27d, %y  = ffffffff
	udivx	%l7,-0xd83,%l3		! %l3 = 0000000000000001
!	Branch On Register, %l4 = 4f0d68540003015e
	brz,a,pt %l4,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c000008] = 000000000014bd01, %l2 = 0000000000000026
	ldxa	[%i0+%o6]0x80,%l2	! Annulled
p3_b164:
	membar	#Sync			! Added by membar checker (714)
!	%f12 = bf33c680 bf000000, %f18 = 41cdde6f 68473596
	fmovd	%f12,%f18		! %f18 = bf33c680 bf000000

p3_label_147:
	bge	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d000060] = ceef0799, %l1 = fffff43600000bc9
	swap	[%i2+0x060],%l1		! %l1 = 00000000ceef0799
p3_b165:
	membar	#Sync			! Added by membar checker (715)
!	%f26 = 00000000, %f15 = 41cdde6f
	fnegs	%f26,%f15		! %f15 = 80000000
!	Branch On Register, %l3 = 0000000000000001
	brz,pt	%l3,p3_not_taken_0	! Branch Not Taken
!	%l6 = fffff436000014ec, Mem[0000000030000070] = 77ed0000bd4bbd95
	stx	%l6,[%o0+0x070]		! Mem[0000000030000070] = fffff436000014ec
p3_b166:

p3_label_148:
	membar	#Sync			! Added by membar checker (716)
!	Mem[000000001d800060] = dc76ec7b cb2416e2 b3e73138 6ba1b825
	prefetcha [%i3+0x060]%asi,23
	bl,a	p3_b167			! Branch Taken, %ccr = 88, CWP = 0
!	%l0 = fffffffffffff3b9, Mem[000000001e000008] = f9a6b9d8003da161
	stxa	%l0,[%i4+%o6]0x80	! Mem[000000001e000008] = fffffffffffff3b9
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0a7,%g2
p3_b167:
!	Jump to jmpl_2, CWP = 0
	set	p3_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	%l2 = 0000000000000026, Mem[000000001d8001a0] = 73d994a7a86470f0
	stx	%l2,[%i3+0x1a0]		! Mem[000000001d8001a0] = 0000000000000026
!	Registers modified during the branch to p3_jmpl_2
!	%l3  = 00000000ffffffff
!	%l4  = 0000000000000003
!	%l6  = fffffffffffffffe

p3_label_149:
	membar	#Sync			! Added by membar checker (717)
!	%l1 = 00000000ceef0799, immed = 0000003e, %l2 = 0000000000000026
	sllx	%l1,0x03e,%l2		! %l2 = 4000000000000000
!	%l1 = 00000000ceef0799, %l0 = fffffffffffff3b9, %l0 = fffffffffffff3b9
	subccc	%l1,%l0,%l0		! %l0 = 00000000ceef13e0, %ccr = 19
!	Mem[000000001d0001e0] = b654dc29 00000046 11b631eb 4dbe2004
	prefetcha [%i2+0x1e0]%asi,2
	fbge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001e000008] = ffffffff, %l7 = ffffffffffffffff
	lduwa	[%i4+%o6]0x80,%l7	! Annulled
p3_b168:

p3_label_150:
	membar	#Sync			! Added by membar checker (718)
	nop
!	%l3 = 00000000ffffffff, immed = fffffef3, %l7 = ffffffffffffffff
	sub	%l3,-0x10d,%l7		! %l7 = 000000010000010c
!	%l4 = 0000000000000003, immed = 00000555, %l3 = 00000000ffffffff
	addcc	%l4,0x555,%l3		! %l3 = 0000000000000558, %ccr = 00
	fbge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000031000038] = 5900c37c, %l0 = 00000000ceef13e0
	ldstub	[%o2+0x038],%l0		! %l0 = 0000000000000059
p3_b169:

p3_label_151:
	membar	#Sync			! Added by membar checker (719)
!	%l1 = 00000000ceef0799, immed = 00000832, %y  = ffffffff
	udiv	%l1,0x832,%l4		! %l4 = 00000000ffffffff
	set	p3_b170,%o7
	fbuge,a,pn %fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000031800078] = a946fb27, %l5 = 00000000000075ab
	ldstub	[%o3+0x078],%l5		! %l5 = 00000000000000a9
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0aa,%g2
p3_b170:
!	Registers modified during the branch to p3_near_0
!	%l1  = 000000000000079a
!	%l2  = fffffffffffffffc
!	%l4  = 00000000000000a7
	membar	#Sync			! Added by membar checker (720)
!	Mem[000000001f000008] = 75abb3be, %l7 = 000000010000010c
	ldswa	[%i6+%o6]0x80,%l7	! %l7 = 0000000075abb3be
	fble,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2

p3_label_152:
!	Mem[000000001d800008] = abf5f5f89b5d633c, %l0 = 0000000000000059
	ldx	[%i3+0x008],%l0		! Annulled
p3_b171:
	set	p3_b172,%o7
	fbul,a	p3_far_3_he	! Branch Taken, %fcc0 = 3
!	Mem[000000001e000000] = d5345f62, %l1 = 000000000000079a
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 00000000d5345f62
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0ac,%g2
p3_b172:
!	Registers modified during the branch to p3_far_3
!	%l0  = fffffff79eefccd1
!	%l4  = 000000000000e974
!	%l6  = 00000000ff46fb27
!	%l7  = fffffffffffff344
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c800100] = 11127282 ff3bbdf6 7e802ef9 22251c41
	prefetch [%i1+0x100],23	! Annulled
p3_b173:

p3_label_153:
	membar	#Sync			! Added by membar checker (721)
!	%l5 = 00000000000000a9, Mem[000000001c000098] = 4bb7d8c0
	stwa	%l5,[%i0+0x098]%asi	! Mem[000000001c000098] = 000000a9
	set	p3_b174,%o7
	fbne	p3_far_2_he	! Branch Taken, %fcc0 = 3
!	%l3 = 0000000000000558, Mem[000000001d000008] = 00000486
	stwa	%l3,[%i2+%o6]0x80	! Mem[000000001d000008] = 00000558
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x0ae,%g2
p3_b174:
!	Registers modified during the branch to p3_far_2
!	%l5  = 006a9a2fb1000000
	membar	#Sync			! Added by membar checker (722)
!	Mem[000000001c000000] = 0001a0d0, %l5 = 006a9a2fb1000000
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
	nop

p3_label_154:
!	%l1 = 00000000d5345f62, immed = 000003e4, %l2 = fffffffffffffffc
	orcc	%l1,0x3e4,%l2		! %l2 = 00000000d5345fe6, %ccr = 08
!	%l0 = fffffff79eefccd1, %l0 = fffffff79eefccd1, %l5 = 0000000000000000
	srlx	%l0,%l0,%l5		! %l5 = 00007ffffffbcf77
!	%f18 = bf33c680, %f12 = bf33c680, %f4  = 7351e08e
	fdivs	%f18,%f12,%f4 		! %f4  = 3f800000
!	Mem[000000001c8000c0] = 46c60a29 df63f4f4 00000000 8059b30b
	prefetcha [%i1+0x0c0]%asi,4
!	%f19 = bf000000, %f23 = bf33c680
	fabss	%f19,%f23		! %f23 = 3f000000

p3_label_155:
!	Mem[000000004000003c] = 3c87ff00, %l4 = 000000000000e974
	swapa	[%o5+0x03c]%asi,%l4	! %l4 = 000000003c87ff00
!	Mem[000000003080003c] = 1281300b, %l3 = 0000000000000558
	ldub	[%o1+0x03f],%l3		! %l3 = 000000000000000b
!	%l4 = 000000003c87ff00, %l6 = 00000000ff46fb27, %l0 = fffffff79eefccd1
	orn	%l4,%l6,%l0		! %l0 = ffffffff3cbfffd8
!	Mem[0000000031000070] = 0ec639f4, %l4 = 000000003c87ff00
	ldstub	[%o2+0x070],%l4		! %l4 = 000000000000000e
!	Mem[000000001c800008] = 00ffffff, %l4 = 000000000000000e
	lduha	[%i1+0x00a]%asi,%l4	! %l4 = 000000000000ffff

p3_label_156:
!	%f4  = 3f800000, %f7  = 00000000
	fstoi	%f4 ,%f7 		! %f7  = 00000001
!	Mem[000000003200007c] = 5d000000, %l2 = 00000000d5345fe6
	ldub	[%o4+0x07f],%g2		! %g2 = 000000000000005d
!	Mem[0000000032000040] = c78fef2b 03faa03f 9b5d61a9 40aa5985
	prefetcha [%o4+0x040]%asi,23
!	Mem[000000001c000008] = 00000000 0014bd01, %l0 = 3cbfffd8, %l1 = d5345f62
	ldda	[%i0+%o6]0x80,%l0	! %l0 = 0000000000000000 000000000014bd01
	set	p3_b175,%o7
	fbul,a	p3_far_2_he	! Branch Taken, %fcc0 = 3

p3_label_157:
!	%l3 = 000000000000000b, Mem[000000001d000000] = ff000049
	stha	%l3,[%i2+%g0]0x80	! Mem[000000001d000000] = 000b0049
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0af,%g2
p3_b175:
!	Registers modified during the branch to p3_far_2
!	%l5  = 00000a5e80800000
	membar	#Sync			! Added by membar checker (723)
!	%l2 = 00000000d5345fe6, immed = 00000713, %l0 = 0000000000000000
	sub	%l2,0x713,%l0		! %l0 = 00000000d53458d3
	set	p3_b176,%o7
	fba,a	p3_far_0_he	! Branch Taken, %fcc0 = 3
!	%l1 = 000000000014bd01, Mem[0000000030000078] = 99684000
	stb	%l1,[%o0+0x078]		! Annulled
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0b0,%g2
p3_b176:
!	Registers modified during the branch to p3_far_0
!	%l1  = 00000000000000ff
!	%l4  = 0000000000000901
!	%l5  = ffffffff2acbab97
	membar	#Sync			! Added by membar checker (724)
!	Mem[000000001c0000b0] = f0d1bab4, %l7 = fffffffffffff344
	swapa	[%i0+0x0b0]%asi,%l7	! %l7 = 00000000f0d1bab4

p3_label_158:
!	%l0 = 00000000d53458d3, Mem[0000000031000078] = 34647f13
	stha	%l0,[%o2+0x078]%asi	! Mem[0000000031000078] = 58d37f13
!	%l3 = 000000000000000b, Mem[0000000030800032] = 9a4d6519
	sth	%l3,[%o1+0x032]		! Mem[0000000030800030] = 9a4d000b
!	%l6 = 00000000ff46fb27, immed = 00000007, %l2 = 00000000d5345fe6
	sra	%l6,0x007,%l2		! %l2 = fffffffffffe8df6
!	Mem[000000001d000168] = 9bc559e3, %l4 = 0000000000000901
	ldsba	[%i2+0x168]%asi,%l4	! %l4 = ffffffffffffff9b
!	%f4  = 3f800000, %f22 = f351e08e 3f000000
	fstox	%f4 ,%f22		! %f22 = 00000000 00000001

p3_label_159:
	set	p3_b177,%o7
	fbuge,a,pn %fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001c0001ec] = 523ff53e, %l1 = 00000000000000ff
	lduh	[%i0+0x1ee],%l1		! %l1 = 000000000000f53e
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0b1,%g2
p3_b177:
!	Registers modified during the branch to p3_near_0
!	%l1  = 000000000000024d
!	%l2  = fffffffffffffffc
!	%l4  = 000000002a12a6be
	bgu	p3_b178			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d800000] = 4f0d6854, %l3 = 000000000000000b
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 000000004f0d6854
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0b2,%g2
p3_b178:
	membar	#Sync			! Added by membar checker (725)
!	Mem[0000000031800038] = 0000000b00000000, %l5 = ffffffff2acbab97
	ldxa	[%o3+0x038]%asi,%l5	! %l5 = 0000000b00000000

p3_label_160:
	set	p3_b179,%o7
	fbne,pn	%fcc2,p3_near_0_le	! Branch Taken, %fcc2 = 1
!	%l0 = 00000000d53458d3, Mem[000000001d800000] = 0000000b
	stba	%l0,[%i3+%g0]0x80	! Mem[000000001d800000] = d300000b
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x0b3,%g2
p3_b179:
!	Registers modified during the branch to p3_near_0
!	%l7  = ffffffffffffffff
	bcc,a	p3_b180			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d000000] = 000b0049, %l1 = 000000000000024d
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 00000000000b0049
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x0b4,%g2
p3_b180:
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 00

p3_label_161:
!	Mem[000000001d800080] = aa4d28aa 7c2eae82 d411f645 b1fa68aa
	prefetch [%i3+0x080],2
p3_b181:
	membar	#Sync			! Added by membar checker (726)
!	%f4  = 3f800000 bf33c680, %f4  = 3f800000 bf33c680, %f2  = 3ef9477e c1d37ca3
	fdivd	%f4 ,%f4 ,%f2 		! %f2  = 3ff00000 00000000
	bgu,a	p3_b182			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d800000] = d300000b, %l4 = 000000002a12a6be
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffd3
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x0b6,%g2
p3_b182:
	membar	#Sync			! Added by membar checker (727)
!	Mem[000000001c000000] = 0001a0d0, %l3 = 000000004f0d6854
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000001

p3_label_162:
	bcc,a	p3_b183			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d800154] = f30285ac, %l2 = fffffffffffffffc
	ldsb	[%i3+0x155],%l2		! %l2 = 0000000000000002
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x0b7,%g2
p3_b183:
	membar	#Sync			! Added by membar checker (728)
!	%f9  = c1cdde6f, %f8  = 3bf678d0 c1cdde6f
	fstod	%f9 ,%f8 		! %f8  = c039bbcd e0000000
!	Mem[000000001d000000] = 000b0049, %l7 = ffffffffffffffff
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = 00000000000b0049
!	%l6 = 00000000ff46fb27, %l0 = 00000000d53458d3, %y  = 00000009
	sdivx	%l6,%l0,%l3		! %l3 = 0000000000000001

p3_label_163:
!	%l2 = 0000000000000002, immed = 00000429, %y  = 00000009
	smul	%l2,0x429,%l4		! %l4 = 0000000000000852
!	Mem[000000001d800008] = abf5f5f8, %l6 = 00000000ff46fb27
	lduwa	[%i3+%o6]0x80,%l6	! %l6 = 00000000abf5f5f8
!	Mem[000000001c000110] = feff836a, %l1 = 00000000000b0049
	lduw	[%i0+0x110],%l1		! %l1 = 00000000feff836a
!	%l5 = 0000000b00000000, %l5 = 0000000b00000000, %l6 = 00000000abf5f5f8
	tsubcc	%l5,%l5,%l6		! %l6 = 0000000000000000, %ccr = 44
	set	p3_b184,%o7
	fbue,a,pn %fcc0,p3_near_3_le	! Branch Taken, %fcc0 = 3

p3_label_164:
!	%l4 = 0000000000000852, Mem[000000001c000008] = 000000000014bd01
	stxa	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = 0000000000000852
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0b8,%g2
p3_b184:
!	Registers modified during the branch to p3_near_3
!	%l3  = 000000000024e38e
!	%l4  = ffffffffffffffff
!	%l7  = ffffffffffbda8b7
	membar	#Sync			! Added by membar checker (729)
!	%l7 = ffffffffffbda8b7, immed = 000000c0, %l7 = ffffffffffbda8b7
	andncc	%l7,0x0c0,%l7		! %l7 = ffffffffffbda837, %ccr = 88
!	%f24 = 3f892216, %f26 = 00000000 684734fe
	fstod	%f24,%f26		! %f26 = 3ff12442 c0000000
!	Mem[000000001c800160] = e2f2211c f229388f e4660f47 e1580b8a
	prefetch [%i1+0x160],0
!	%f26 = 3ff12442, %f15 = 80000000, %f24 = 3f892216 20000000
	fsmuld	%f26,%f15,%f24		! %f24 = 80000000 00000000

p3_label_165:
	bleu	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000031800038] = 0000000b, %l1 = 00000000feff836a
	ldsh	[%o3+0x038],%l1		! %l1 = 0000000000000000
p3_b185:
	membar	#Sync			! Added by membar checker (730)
	fble,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001d800008] = abf5f5f8, %l1 = 0000000000000000
	ldswa	[%i3+%o6]0x80,%l1	! Annulled
p3_b186:
	fbge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3

p3_label_166:
!	%l0 = d53458d3, %l1 = 00000000, Mem[000000001c800118] = fbbd544e 309ce53a
	std	%l0,[%i1+0x118]	! Mem[000000001c800118] = d53458d3 00000000
p3_b187:
	membar	#Sync			! Added by membar checker (731)
!	Mem[000000001d8000e0] = 6a36421c f8793796 7398c137 76f7b63b
	prefetch [%i3+0x0e0],16
	fbo,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001c800008] = 00ffffff, %l2 = 0000000000000002
	lduba	[%i1+%o6]0x80,%l2	! %l2 = 0000000000000000
p3_b188:
	membar	#Sync			! Added by membar checker (732)
!	%f28 = c1d37ca3, %f6  = 00000000
	fabss	%f28,%f6 		! %f6  = 41d37ca3

p3_label_167:
!	%l3 = 000000000024e38e, Mem[000000001d000000] = 000b0049e10a4cf2
	stxa	%l3,[%i2+%g0]0x80	! Mem[000000001d000000] = 000000000024e38e
!	%f4  = 3f800000 bf33c680, %f18 = bf33c680 bf000000
	fnegd	%f4 ,%f18		! %f18 = bf800000 bf33c680
!	Mem[000000001c000008] = 00000000, %l7 = ffffffffffbda837
	swapa	[%i0+%o6]0x80,%l7	! %l7 = 0000000000000000
	bgu	p3_b189			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d000000] = 00000000, %l4 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0bd,%g2
p3_b189:

p3_label_168:
	membar	#Sync			! Added by membar checker (733)
!	Mem[000000001c000120] = 689b5cf7 a6a6cbc3, %l4 = 00000000, %l5 = 00000000
	ldd	[%i0+0x120],%l4		! %l4 = 00000000689b5cf7 00000000a6a6cbc3
!	%l6 = 0000000000000000, immed = ffffffb2, %y  = 00000000
	umulcc	%l6,-0x04e,%l1		! %l1 = 0000000000000000, %ccr = 44
!	%l1 = 0000000000000000, immed = 000001b0, %y  = 00000000
	smulcc	%l1,0x1b0,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l0 = 00000000d53458d3, %l3 = 000000000024e38e, %l7 = 0000000000000000
	andcc	%l0,%l3,%l7		! %l7 = 0000000000244082, %ccr = 00
!	%f2  = 3ff00000, %f21 = 41cdde6f
	fmovs	%f2 ,%f21		! %f21 = 3ff00000

p3_label_169:
!	%f2  = 3ff00000, %f10 = 00000000
	fabss	%f2 ,%f10		! %f10 = 3ff00000
!	Mem[000000001c800008] = 00fffffffffffb27, %l3 = 000000000024e38e
	ldxa	[%i1+%o6]0x80,%l3	! %l3 = 00fffffffffffb27
!	%l3 = 00fffffffffffb27, immed = 0000001d, %l6 = 0000000000000000
	srl	%l3,0x01d,%l6		! %l6 = 0000000000000007
!	%f18 = bf800000, %f8  = c039bbcd e0000000
	fstox	%f18,%f8 		! %f8  = ffffffff ffffffff
!	%f9  = ffffffff, %f3  = 00000000, %f27 = c0000000
	fdivs	%f9 ,%f3 ,%f27		! %f27 = ffffffff

p3_label_170:
!	Mem[000000001d800008] = abf5f5f8, %l2 = 0000000000000000
	lduba	[%i3+%o6]0x80,%l2	! %l2 = 00000000000000ab
!	%l1 = 0000000000000000, %l3 = 00fffffffffffb27, %y  = 00000000
	umulcc	%l1,%l3,%l4		! %l4 = 0000000000000000, %ccr = 44
!	Mem[000000001d000008] = 00000558, %l1 = 0000000000000000
	ldsha	[%i2+%o6]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001c0001d0] = 67a481ef, %l3 = 00fffffffffffb27
	lduw	[%i0+0x1d0],%l3		! %l3 = 0000000067a481ef
	bvc	p3_b190			! Branch Taken, %ccr = 44, CWP = 0

p3_label_171:
!	Mem[0000000031000070] = ffc639f4, %l5 = 0000000000000000
	ldsh	[%o2+0x070],%l5		! %l5 = ffffffffffffffc6
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0be,%g2
p3_b190:
	membar	#Sync			! Added by membar checker (734)
!	%f4  = 3f800000 bf33c680, %f18 = bf800000 bf33c680
	fcmpd	%fcc0,%f4 ,%f18		! %fcc0 = 2
!	Mem[000000001c000140] = dfdb1c50 e1c822f4 5e9828c9 14472886
	prefetcha [%i0+0x140]%asi,20
!	Mem[000000001c000058] = 45730afde65df9f0, %l3 = 0000000067a481ef
	ldxa	[%i0+0x058]%asi,%l3	! %l3 = 45730afde65df9f0
	set	p3_b191,%o7
	fbuge,a	p3_far_0_he	! Branch Taken, %fcc0 = 2

p3_label_172:
!	Mem[000000001d800000] = d300000b, %l3 = 45730afde65df9f0
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffd300
!	The following code should not be executed
	stxa	%l4,[%i0+0x088]%asi
	nop
	fstox	%f1,%f22
	nop
	nop
	nop
	ba	p3_branch_failed
	mov	0x0bf,%g2
p3_b191:
!	Registers modified during the branch to p3_far_0
!	%l1  = 00000000000000ff
!	%l4  = 0000000000000000
!	%l5  = 00000000d5101851
	set	p3_b192,%o7
	fbug	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031800074] = a946fb27, %l4 = 0000000000000000
	ldsb	[%o3+0x075],%l4		! %l4 = 0000000000000046
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x0c0,%g2
p3_b192:
!	Registers modified during the branch to p3_far_1
!	%l0  = 000000000014bdb3
!	%l1  = 00000000e4f26e38
!	%l3  = 000000000000101d
!	%l5  = 0000000000d702f8
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (735)
!	%f4  = 3f800000 bf33c680, %f4  = 3f800000 bf33c680, %f28 = c1d37ca3 41cdde6f
	fdivd	%f4 ,%f4 ,%f28		! %f28 = 3ff00000 00000000
!	%l2 = 00000000000000ab, Mem[000000003100007c] = fed80d66
	sth	%l2,[%o2+0x07c]		! Mem[000000003100007c] = 00ab0d66

p3_label_173:
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001d800100] = cb197bc0 28f7beac 00000000 fffff7f5
	prefetch [%i3+0x100],0
p3_b193:
	membar	#Sync			! Added by membar checker (736)
!	%l2 = 00000000000000ab, %l1 = 00000000e4f26e38, %l3 = 000000000000101d
	xor	%l2,%l1,%l3		! %l3 = 00000000e4f26e93
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l0 = 0014bdb3, %l1 = e4f26e38, Mem[000000001d000000] = ffffffff 0024e38e
	stda	%l0,[%i2+%g0]0x80	! Annulled
p3_b194:

p3_label_174:
	membar	#Sync			! Added by membar checker (737)
!	%l4 = 0000000000000046, immed = fffff83b, %l7 = 0000000000000000
	orncc	%l4,-0x7c5,%l7		! %l7 = 00000000000007c6, %ccr = 00
	set	p3_b195,%o7
	fbuge	p3_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000030000038] = 0000ffff, %l5 = 0000000000d702f8
	ldub	[%o0+0x03b],%l5		! %l5 = 00000000000000ff
!	The following code should not be executed
	nop
	fdivd	%f24,%f20,%f6
	srl	%l0,%l0,%l0
	fmuls	%f20,%f29,%f0
	fxtoq	%f8,%f0
	bn,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0c3,%g2
p3_b195:
!	Registers modified during the branch to p3_far_3
!	%l1  = 00000000001e65a3
!	%l7  = fffffffffffffff9
	membar	#Sync			! Added by membar checker (738)
!	%l0 = 000000000014bdb3, immed = 00000d1a, %l7 = fffffffffffffff9
	or	%l0,0xd1a,%l7		! %l7 = 000000000014bdbb
!	Branch On Register, %l2 = 00000000000000ab
	brnz,a,pn %l2,p3_b196		! Branch Taken

p3_label_175:
!	Mem[000000001c800000] = ffa831da, %l7 = 000000000014bdbb
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 000000000000ffa8
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x0c4,%g2
p3_b196:
	membar	#Sync			! Added by membar checker (739)
!	Mem[000000001f0001c0] = 001b07f8 193460e3 8df82332 06c251b7
	prefetcha [%i6+0x1c0]%asi,0
!	%l6 = 00000007, %l7 = 0000ffa8, Mem[000000001c8001a8] = 7e802ef9 22251c41
	stda	%l6,[%i1+0x1a8]%asi	! Mem[000000001c8001a8] = 00000007 0000ffa8
!	Mem[0000000030000038] = 0000ffffffffffff, %l1 = 00000000001e65a3
	ldxa	[%o0+0x038]%asi,%l1	! %l1 = 0000ffffffffffff
!	%f20 = 3c4910b1 3ff00000, %f20 = 3c4910b1 3ff00000, %f20 = 3c4910b1 3ff00000
	fdivd	%f20,%f20,%f20		! %f20 = 3ff00000 00000000

p3_label_176:
!	%l2 = 00000000000000ab, immed = 00000b40, %l4 = 0000000000000046
	xorcc	%l2,0xb40,%l4		! %l4 = 0000000000000beb, %ccr = 00
	set	p3_b197,%o7
	fbo	p3_far_3_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001d8001c0] = 1c19bf31 04a8b6b8 8e14d364 097ad5cb
	prefetch [%i3+0x1c0],21
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x0c5,%g2
p3_b197:
!	Registers modified during the branch to p3_far_3
!	%l0  = fffffff79eefcd27
!	%l4  = 000000000000e974
!	%l6  = 00000000ff46fb27
!	%l7  = 0000000000000005
	membar	#Sync			! Added by membar checker (740)
!	%l1 = 0000ffffffffffff, Mem[000000001d8001a0] = 0000000000000026
	stx	%l1,[%i3+0x1a0]		! Mem[000000001d8001a0] = 0000ffffffffffff
!	Mem[000000001d8001a0] = 0000ffff ffffffff 665c6b24 5a86158b
	prefetcha [%i3+0x1a0]%asi,4

p3_label_177:
!	%f14 = bc4910b1, %f23 = 00000001
	fabss	%f14,%f23		! %f23 = 3c4910b1
!	Mem[000000001c000158] = d201cdcbe89193e3, %l0 = fffffff79eefcd27
	ldx	[%i0+0x158],%l0		! %l0 = d201cdcbe89193e3
!	%f15 = 80000000, %f8  = ffffffff, %f0  = 00000000 3ef9477e
	nop
!	Jump to jmpl_3, CWP = 0
	set	p3_jmpl_3_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000032000034] = 1754a19e, %l1 = 0000ffffffffffff
	ldsw	[%o4+0x034],%g2		! %g2 = 0000ffffffffffff
!	Registers modified during the branch to p3_jmpl_3
!	%l1  = 000000000000000f
!	%l4  = 000000000003fd1b
!	%l5  = 0000000000000005

p3_label_178:
!	%l7 = 0000000000000005, %l1 = 000000000000000f, %y  = fffffff7
	udivx	%l7,%l1,%l6		! %l6 = 0000000000000000
!	%f18 = bf800000, %f1  = 3ef9477e
	fstoi	%f18,%f1 		! %f1  = ffffffff
!	%l2 = 00000000000000ab, immed = 00000e5f, %l7 = 0000000000000005
	subccc	%l2,0xe5f,%l7		! %l7 = fffffffffffff24c, %ccr = 99
	bge	p3_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[000000001d800000] = d300000b, %l3 = 00000000e4f26e93
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000d3
p3_b198:

p3_label_179:
	membar	#Sync			! Added by membar checker (741)
	fbue,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000001c8001a0] = 31594954 2aa5ba4a 00000007 0000ffa8
	prefetch [%i1+0x1a0],1
p3_b199:
	membar	#Sync			! Added by membar checker (742)
!	Mem[0000000030000034] = b6453fd3, %l7 = fffffffffffff24c
	swapa	[%o0+0x034]%asi,%l7	! %l7 = 00000000b6453fd3
!	%l0 = d201cdcbe89193e3, immed = fffffb0f, %l2 = 00000000000000ab
	addcc	%l0,-0x4f1,%l2		! %l2 = d201cdcbe8918ef2, %ccr = 99
!	%f28 = 3ff00000 00000000, %f10 = 3ff00000
	fdtoi	%f28,%f10		! %f10 = 00000001

p3_label_180:
!	Mem[0000000030800070] = 00000000000075ab, %l2 = d201cdcbe8918ef2
	ldx	[%o1+0x070],%l2		! %l2 = 00000000000075ab
!	%f10 = 00000001 684734fe, %f26 = 3ff12442 ffffffff
	fmovd	%f10,%f26		! %f26 = 00000001 684734fe
	fbg,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000031000070] = ffc639f4, %l5 = 0000000000000005
	lduw	[%o2+0x070],%l5		! Annulled
p3_b200:
	membar	#Sync			! Added by membar checker (743)
!	%l6 = 0000000000000000, immed = 0000021a, %l7 = 00000000b6453fd3
	orn	%l6,0x21a,%l7		! %l7 = fffffffffffffde5

p3_label_181:
	set	p3_b201,%o7
	fbg,a,pt %fcc3,p3_near_0_le	! Branch Taken, %fcc3 = 2
!	Mem[000000001d80000c] = 9b5d633c, %l1 = 000000000000000f
	lduh	[%i3+0x00c],%l1		! %l1 = 0000000000009b5d
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0c9,%g2
p3_b201:
!	Registers modified during the branch to p3_near_0
!	%l7  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (744)
!	Branch On Register, %l0 = d201cdcbe89193e3
	brnz,pt	%l0,p3_b202		! Branch Taken
!	Mem[000000001d000000] = ffffffff, %l5 = 0000000000000005
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	The following code should not be executed
	fstox	%f15,%f8
	ba	p3_branch_failed
	mov	0x0ca,%g2
p3_b202:
	membar	#Sync			! Added by membar checker (745)
!	%l3 = 00000000000000d3, immed = 00000c7f, %l1 = 0000000000009b5d
	andn	%l3,0xc7f,%l1		! %l1 = 0000000000000080

p3_label_182:
!	Mem[000000001c8001c0] = e893e1e9 c595ec4d c72b9bb6 f6d64294
	prefetcha [%i1+0x1c0]%asi,3
!	%l3 = 00000000000000d3, immed = fffff065, %l6 = 0000000000000000
	tsubcc	%l3,-0xf9b,%l6		! %l6 = 000000000000106e, %ccr = 13
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c000008] = ffbda837 00000852, %l2 = 000075ab, %l3 = 000000d3
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 00000000ffbda837 0000000000000852
p3_b203:
	set	p3_b204,%o7
	fbg,a	p3_far_0_le	! Branch Taken, %fcc0 = 2

p3_label_183:
!	Mem[0000000030800078] = b2bee63b, %l3 = 0000000000000852
	ldstub	[%o1+0x078],%l3		! %l3 = 00000000000000b2
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0cc,%g2
p3_b204:
!	Registers modified during the branch to p3_far_0
!	%l4  = 000000000000007f
!	%l5  = 0000000000000000
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (746)
!	Mem[0000000030800038] = 00000026, %l0 = d201cdcbe89193e3
	swap	[%o1+0x038],%l0		! %l0 = 0000000000000026
!	%f27 = 684734fe, %f28 = 3ff00000, %f4  = 3f800000 bf33c680
	fsmuld	%f27,%f28,%f4 		! %f4  = 45175835 c4000000
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d000008] = 00000558, %l0 = 0000000000000026
	ldstuba	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000
p3_b205:

p3_label_184:
	bgu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l5 = 0000000000000000, Mem[000000001d800000] = d300000b
	stha	%l5,[%i3+%g0]0x80	! Annulled
p3_b206:
	membar	#Sync			! Added by membar checker (747)
!	Mem[000000003080003c] = 1281300b, %l0 = 0000000000000000
	ldsw	[%o1+0x03c],%l0		! %l0 = 000000001281300b
!	Mem[000000001d80014c] = 35822a23, %l7 = ffffffff, %l2 = ffbda837
	add	%i3,0x14c,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 0000000035822a23
	fbule,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2

p3_label_185:
!	%l2 = 0000000035822a23, Mem[000000001d800138] = e88facff57db131b
	stx	%l2,[%i3+0x138]		! Mem[000000001d800138] = 0000000035822a23
p3_b207:
	membar	#Sync			! Added by membar checker (748)
!	%f10 = 00000001 684734fe, %f8  = ffffffff ffffffff
	fnegd	%f10,%f8 		! %f8  = 80000001 684734fe
!	Mem[000000001c800192] = a2a59e20, %l4 = 000000000000007f
	ldstuba	[%i1+0x192]%asi,%l4	! %l4 = 000000000000009e
!	Mem[000000001e800060] = 907910a9 2f9c8834 45581029 5c591dfb
	prefetcha [%i5+0x060]%asi,2
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 44

p3_label_186:
!	Mem[000000001c800000] = ffa831da, %l7 = ffffffffffffffff
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff
p3_b208:
	membar	#Sync			! Added by membar checker (749)
!	%l1 = 0000000000000080, %l7 = ffffffffffffffff, %y  = 00000000
	smul	%l1,%l7,%l4		! %l4 = ffffffffffffff80
!	Mem[0000000031800030] = 0014bdb3e4f26e38, %l7 = ffffffffffffffff
	ldxa	[%o3+0x030]%asi,%l7	! %l7 = 0014bdb3e4f26e38
!	Mem[000000001c800008] = 00fffffffffffb27, %l7 = 0014bdb3e4f26e38
	ldxa	[%i1+%o6]0x80,%l7	! %l7 = 00fffffffffffb27
	fbge,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1

p3_label_187:
!	Mem[000000001c800008] = 00fffffffffffb27, %l6 = 0000000000000000
	ldxa	[%i1+%o6]0x80,%l6	! Annulled
p3_b209:
	membar	#Sync			! Added by membar checker (750)
	set	p3_b210,%o7
	fbuge,a,pt %fcc0,p3_near_3_le	! Branch Taken, %fcc0 = 2
!	%l3 = 00000000000000b2, Mem[000000001c800008] = 00ffffff
	stha	%l3,[%i1+%o6]0x80	! Mem[000000001c800008] = 00b2ffff
!	The following code should not be executed
	bvs,a	p0_not_taken_0
	nop
	fsubs	%f10,%f24,%f2
	nop
	fbu	p0_not_taken_0
	fitos	%f7,%f6
	fdivd	%f2,%f16,%f0
	ba	p3_branch_failed
	mov	0x0d2,%g2
p3_b210:
!	Registers modified during the branch to p3_near_3
!	%l3  = fffffffffffdc880
!	%l4  = 0000000000000000
!	%l7  = 0000000000429a04
!	call to call_3, CWP = 0
	call	p3_call_3_he
!	Mem[000000001c000020] = f81c15d9, %l7 = 0000000000429a04
	ldstub	[%i0+0x020],%l7		! %l7 = 00000000000000f8
!	Registers modified during the branch to p3_call_3
!	%l2  = fffffffffffffe3f

p3_label_188:
	membar	#Sync			! Added by membar checker (751)
!	%l2 = fffffffffffffe3f, Mem[000000001c8001a8] = 000000070000ffa8
	stxa	%l2,[%i1+0x1a8]%asi	! Mem[000000001c8001a8] = fffffffffffffe3f
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d000008] = ff000558, %l3 = fffffffffffdc880
	ldswa	[%i2+%o6]0x80,%l3	! Annulled
p3_b211:
	membar	#Sync			! Added by membar checker (752)
!	Mem[000000001c8000c0] = 46c60a29 df63f4f4 00000000 8059b30b
	prefetch [%i1+0x0c0],22
	fbul,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2

p3_label_189:
!	Mem[000000001d800008] = abf5f5f8, %l3 = fffffffffffdc880
	ldsba	[%i3+%o6]0x80,%l3	! %l3 = ffffffffffffffab
p3_b212:
	membar	#Sync			! Added by membar checker (753)
!	Branch On Register, %l7 = 00000000000000f8
	brz,a,pn %l7,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c80002c] = 664409af, %l4 = 0000000000000000
	lduw	[%i1+0x02c],%l4		! Annulled
p3_b213:
	membar	#Sync			! Added by membar checker (754)
!	%f29 = 00000000, %f10 = 00000001
	fmovs	%f29,%f10		! %f10 = 00000000
!	%l5 = 0000000000000000
	setx	0x0f6a32f40f6a32f4,%g7,%l5 ! %l5 = 0f6a32f40f6a32f4

p3_label_190:
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c800100] = 11127282 ff3bbdf6 7e802ef9 22251c41
	prefetch [%i1+0x100],0	! Annulled
p3_b214:
	membar	#Sync			! Added by membar checker (755)
!	%f16 = 41d37ca3 41cdde6f, %f6  = 41d37ca3 00000001
	fcmpd	%fcc1,%f16,%f6 		! %fcc1 = 2
!	%f24 = 80000000 00000000, %f28 = 3ff00000 00000000, %f30 = 00000000 00000000
	fmuld	%f24,%f28,%f30		! %f30 = 80000000 00000000
!	%l0 = 000000001281300b, immed = 00000015, %l7 = 00000000000000f8
	sra	%l0,0x015,%l7		! %l7 = 0000000000000094

p3_label_191:
!	Branch On Register, %l4 = 0000000000000000
	brgz,a,pt %l4,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d800000] = d300000b 0003015e abf5f5f8 9b5d633c
	prefetch [%i3+0x000],22	! Annulled
p3_b215:
	membar	#Sync			! Added by membar checker (756)
!	%f23 = 3c4910b1, %f16 = 41d37ca3
	fnegs	%f23,%f16		! %f16 = bc4910b1
!	%l3 = ffffffffffffffab, Mem[0000000030800030] = 9a4d000b
	stha	%l3,[%o1+0x030]%asi	! Mem[0000000030800030] = ffab000b
	fble,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2

p3_label_192:
!	Mem[000000001d000068] = 51f76933, %l4 = 0000000000000000
	lduh	[%i2+0x06a],%l4		! Annulled
p3_b216:
	membar	#Sync			! Added by membar checker (757)
!	%f26 = 00000001, %f22 = 00000000
	fabss	%f26,%f22		! %f22 = 00000001
	set	p3_b217,%o7
	fbge,a	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001d800000] = d300000b 0003015e, %l4 = 00000000, %l5 = 0f6a32f4
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000d300000b 000000000003015e
!	The following code should not be executed
	fnegd	%f14,%f22
	ba	p0_not_taken_0
	sllx	%l0,0x024,%l0
	nop
	ba	p3_branch_failed
	mov	0x0d9,%g2
p3_b217:
	membar	#Sync			! Added by membar checker (758)
	set	p3_b218,%o7
	fba,a,pt %fcc3,p3_near_0_le	! Branch Taken, %fcc3 = 2

p3_label_193:
!	 Annulled
	ldda	[%i2+%g0]0x80,%l0
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x0da,%g2
p3_b218:
!	Registers modified during the branch to p3_near_0
!	%l7  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (759)
	fble,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l6 = 00000000, %l7 = ffffffff, Mem[000000001c800128] = fd2cebe2 7446c3b8
	std	%l6,[%i1+0x128]	! Annulled
p3_b219:
	membar	#Sync			! Added by membar checker (760)
!	Mem[000000001d800120] = 75f28769 7a8b21e9 00000486 b32091c4
	prefetcha [%i3+0x120]%asi,22
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_194:
!	Mem[000000001c8000c0] = 46c60a29 df63f4f4 00000000 8059b30b
	prefetch [%i1+0x0c0],1
p3_b220:
	membar	#Sync			! Added by membar checker (761)
	set	p3_b221,%o7
	fbug,pn	%fcc1,p3_near_0_le	! Branch Taken, %fcc1 = 2
!	Mem[000000001c800120] = 078e8e30 2345cff0 fd2cebe2 7446c3b8
	prefetch [%i1+0x120],3
!	The following code should not be executed
	fbug,a	p0_not_taken_0
	fadds	%f28,%f14,%f9
	fstox	%f23,%f30
	stx	%l4,[%o3+0x040]
	ba	p3_branch_failed
	mov	0x0dd,%g2
p3_b221:
!	Registers modified during the branch to p3_near_0
!	%l7  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (762)
!	Mem[000000001c800000] = ffa831da, %l6 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 000000000000ffa8
	fbule,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2

p3_label_195:
!	Mem[000000001c000158] = d201cdcbe89193e3, %l7 = ffffffffffffffff
	ldx	[%i0+0x158],%l7		! %l7 = d201cdcbe89193e3
p3_b222:
	membar	#Sync			! Added by membar checker (763)
!	%l1 = 0000000000000080, immed = 00000c7d, %y  = 00000000
	udivx	%l1,0xc7d,%l2		! %l2 = 0000000000000000
!	%l0 = 000000001281300b, %l6 = 000000000000ffa8, %y  = 00000000
	udivx	%l0,%l6,%l4		! %l4 = 0000000000001287
!	%l2 = 0000000000000000, %l5 = 000000000003015e, %l1 = 0000000000000080
	srlx	%l2,%l5,%l1		! %l1 = 0000000000000000
!	%l6 = 000000000000ffa8, %l5 = 000000000003015e, %l2 = 0000000000000000
	andn	%l6,%l5,%l2		! %l2 = 000000000000fea0

p3_label_196:
!	%f20 = 3ff00000 00000000, %f20 = 3ff00000 00000000
	fabsd	%f20,%f20		! %f20 = 3ff00000 00000000
	set	p3_b223,%o7
	fbo,pt	%fcc1,p3_near_2_he	! Branch Taken, %fcc1 = 2
!	%l0 = 1281300b, %l1 = 00000000, Mem[0000000031000038] = ff00c37c 0000ff1d
	std	%l0,[%o2+0x038]	! Mem[0000000031000038] = 1281300b 00000000
!	The following code should not be executed
	nop
	ba	p3_branch_failed
	mov	0x0df,%g2
p3_b223:
!	Registers modified during the branch to p3_near_2
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (764)
!	Mem[000000001d000044] = be8001bf, %l0 = 1281300b, %l1 = 00000000
	add	%i2,0x44,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000be8001bf
!	%f2  = 3ff00000, %f10 = 00000000, %f23 = 3c4910b1
	fmuls	%f2 ,%f10,%f23		! %f23 = 00000000

p3_label_197:
!	Mem[0000000032000038] = fffffffffffaff3f, %l5 = 000000000003015e
	ldx	[%o4+0x038],%g2		! %g2 = fffffffffffaff3f
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 13
!	 Annulled
	ldd	[%i1+0x028],%l0
p3_b224:
	set	p3_b225,%o7
	fbug	p3_far_2_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001c800008] = 00b2ffff, %l0 = 000000001281300b
	lduba	[%i1+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	smul	%l0,0xa4f,%l0
	stb	%l5,[%i2+0x0fb]
	ldsha	[%o3+0x008]%asi,%l2
	lduha	[%i4+0x02c]%asi,%l0
	ldsha	[%o2+0x048]%asi,%l2
	fbl,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0e1,%g2
p3_b225:
!	Registers modified during the branch to p3_far_2
!	%l5  = 005f4000df800000

p3_label_198:
	bge,a	p3_not_taken_0		! Branch Not Taken, %ccr = 13
!	%l4 = 00001287, %l5 = df800000, Mem[000000001c000008] = 00000000 1281300b
	stda	%l4,[%i0+%o6]0x80	! Annulled
p3_b226:
	membar	#Sync			! Added by membar checker (765)
!	Mem[000000003080003c] = 1281300b, %l2 = 000000000000fea0
	lduwa	[%o1+0x03c]%asi,%l2	! %l2 = 000000001281300b
!	%l4 = 0000000000001287, immed = fffffdcf, %l3 = ffffffffffffffab
	orncc	%l4,-0x231,%l3		! %l3 = 00000000000012b7, %ccr = 00
!	call to call_3, CWP = 0
	call	p3_call_3_le

p3_label_199:
!	%l0 = 00000000, %l1 = be8001bf, Mem[0000000031000038] = 1281300b 00000000
	std	%l0,[%o2+0x038]	! Mem[0000000031000038] = 00000000 be8001bf
!	Registers modified during the branch to p3_call_3
!	%l1  = c320400000000000
!	%l3  = 005f4000df800000
!	%l5  = 1027c9719a800000
!	%l7  = 00000000f1a6d2b0
	fbue	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c800000] = ffa831da, %l7 = 00000000f1a6d2b0
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffa8
p3_b227:
	membar	#Sync			! Added by membar checker (766)
!	Mem[000000001d800140] = cc6fae23 de4ba74f a1e7b86b 35822a23
	prefetch [%i3+0x140],3
!	Mem[0000000031800034] = e4f26e38, %l1 = c320400000000000
	lduh	[%o3+0x036],%l1		! %l1 = 0000000000006e38

p3_label_200:
!	%f18 = bf800000 bf33c680, %f12 = bf33c680 bf000000
	fcmped	%fcc2,%f18,%f12		! %fcc2 = 1
!	%l4 = 0000000000001287, immed = fffff981, %y  = 1027c971
	sdivcc	%l4,-0x67f,%l1		! %l1 = ffffffff80000000, %ccr = 8a
!	%l3 = 005f4000df800000, Mem[000000001c000000] = 0001a0d0fd3ff7ef
	stxa	%l3,[%i0+%g0]0x80	! Mem[000000001c000000] = 005f4000df800000
!	Mem[0000000031000038] = 00000000, %l3 = 005f4000df800000
	swap	[%o2+0x038],%l3		! %l3 = 0000000000000000
	set	p3_b228,%o7
	fba,pt	%fcc3,p3_near_3_he	! Branch Taken, %fcc3 = 2
	nop
	ba	p3_branch_failed
	mov	0x0e4,%g2
	nop
p3_b228:
!	Registers modified during the branch to p3_near_3
!	%l6  = 7a000e8bfffff24c
	nop

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
	cmp	%l1,%g2			! %l1 should be ffffffff80000000
	bne,a,pn %xcc,p3_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000001281300b
	bne,a,pn %xcc,p3_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000001287
	bne,a,pn %xcc,p3_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 1027c9719a800000
	bne,a,pn %xcc,p3_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 7a000e8bfffff24c
	bne,a,pn %xcc,p3_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffffffffa8
	bne,a,pn %xcc,p3_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x1027c971,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 ffffffff
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 3ff00000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 45175835 c4000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 41d37ca3 00000001
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 80000001 684734fe
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 684734fe
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be bf33c680 bf000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be bc4910b1 80000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be bc4910b1 41cdde6f
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be bf800000 bf33c680
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 3ff00000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000001 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 80000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000001 684734fe
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 3ff00000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 80000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p3_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 005f4000df800000
	ldx	[%i0+0x000],%g3		! Observed data at 000000001c000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 000000001281300b
	ldx	[%i0+0x008],%g3		! Observed data at 000000001c000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = ff1c15d93fce0db8
	ldx	[%i0+0x020],%g3		! Observed data at 000000001c000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 000000a95f7a9b6c
	ldx	[%i0+0x098],%g3		! Observed data at 000000001c000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = fffff344f300b06d
	ldx	[%i0+0x0b0],%g3		! Observed data at 000000001c0000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 4e52ea24f3fcf3a9
	ldx	[%i0+0x0d8],%g3		! Observed data at 000000001c0000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 83ffcb10e790f643
	ldx	[%i0+0x108],%g3		! Observed data at 000000001c000108
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x118],%g2		! Expect data = fed80d66f0000cf1
	ldx	[%i0+0x118],%g3		! Observed data at 000000001c000118
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x178],%g2		! Expect data = b3718bd6eff02148
	ldx	[%i0+0x178],%g3		! Observed data at 000000001c000178
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x178,%g4
	ldx	[%g1+0x180],%g2		! Expect data = ffffff9bffff6e38
	ldx	[%i0+0x180],%g3		! Observed data at 000000001c000180
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = 67a481eff8486ff2
	ldx	[%i0+0x1d0],%g3		! Observed data at 000000001c0001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1d0,%g4

	set	p3_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ffa831da000000ff
	ldx	[%i1+0x000],%g3		! Observed data at 000000001c800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 00b2fffffffffb27
	ldx	[%i1+0x008],%g3		! Observed data at 000000001c800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x048],%g2		! Expect data = bd9326d6000006cd
	ldx	[%i1+0x048],%g3		! Observed data at 000000001c800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 000000008059b30b
	ldx	[%i1+0x0c8],%g3		! Observed data at 000000001c8000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = d5823ec875cff706
	ldx	[%i1+0x0f0],%g3		! Observed data at 000000001c8000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x100],%g2		! Expect data = 11127282ff3bbdf6
	ldx	[%i1+0x100],%g3		! Observed data at 000000001c800100
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 7e802ef922251c41
	ldx	[%i1+0x108],%g3		! Observed data at 000000001c800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x118],%g2		! Expect data = d53458d300000000
	ldx	[%i1+0x118],%g3		! Observed data at 000000001c800118
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x190],%g2		! Expect data = a2a5ff209ecf382a
	ldx	[%i1+0x190],%g3		! Observed data at 000000001c800190
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = fffffffffffffe3f
	ldx	[%i1+0x1a8],%g3		! Observed data at 000000001c8001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = 9e5c390082e11625
	ldx	[%i1+0x1b8],%g3		! Observed data at 000000001c8001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b8,%g4

	set	p3_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ffffffff0024e38e
	ldx	[%i2+0x000],%g3		! Observed data at 000000001d000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff00055800000000
	ldx	[%i2+0x008],%g3		! Observed data at 000000001d000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 5d86a630b15572da
	ldx	[%i2+0x010],%g3		! Observed data at 000000001d000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 00000bc91dce738f
	ldx	[%i2+0x060],%g3		! Observed data at 000000001d000060
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x080],%g2		! Expect data = 4a024687cef2f2fa
	ldx	[%i2+0x080],%g3		! Observed data at 000000001d000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x090],%g2		! Expect data = a29b6cc866970bc9
	ldx	[%i2+0x090],%g3		! Observed data at 000000001d000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 000000ff9d76cb4e
	ldx	[%i2+0x0e8],%g3		! Observed data at 000000001d0000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 70b186e200002225
	ldx	[%i2+0x1a8],%g3		! Observed data at 000000001d0001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = 6dfbef4040478c2b
	ldx	[%i2+0x1d8],%g3		! Observed data at 000000001d0001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1d8,%g4
	ldx	[%g1+0x1e0],%g2		! Expect data = b654dc2900000046
	ldx	[%i2+0x1e0],%g3		! Observed data at 000000001d0001e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e0,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 0a953ffff33e9985
	ldx	[%i2+0x1f0],%g3		! Observed data at 000000001d0001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f0,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 0ab1bb29fb271909
	ldx	[%i2+0x1f8],%g3		! Observed data at 000000001d0001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f8,%g4

	set	p3_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = d300000b0003015e
	ldx	[%i3+0x000],%g3		! Observed data at 000000001d800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = abf5f5f89b5d633c
	ldx	[%i3+0x008],%g3		! Observed data at 000000001d800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 0000000007fff404
	ldx	[%i3+0x020],%g3		! Observed data at 000000001d800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x040],%g2		! Expect data = c5e497a4e89193e3
	ldx	[%i3+0x040],%g3		! Observed data at 000000001d800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 0000000042c14c8e
	ldx	[%i3+0x0a8],%g3		! Observed data at 000000001d8000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = c030ff9aabcaeeff
	ldx	[%i3+0x0c8],%g3		! Observed data at 000000001d8000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = ffffffff5b2c472c
	ldx	[%i3+0x0d8],%g3		! Observed data at 000000001d8000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 6a36421cf8793796
	ldx	[%i3+0x0e0],%g3		! Observed data at 000000001d8000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = ff8c198a597a97c0
	ldx	[%i3+0x0f0],%g3		! Observed data at 000000001d8000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 00000000fffff7f5
	ldx	[%i3+0x108],%g3		! Observed data at 000000001d800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 000000009935ec2c
	ldx	[%i3+0x118],%g3		! Observed data at 000000001d800118
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 00000486b32091c4
	ldx	[%i3+0x128],%g3		! Observed data at 000000001d800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x138],%g2		! Expect data = 0000000035822a23
	ldx	[%i3+0x138],%g3		! Observed data at 000000001d800138
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = 0000ffffffffffff
	ldx	[%i3+0x1a0],%g3		! Observed data at 000000001d8001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a0,%g4

	set	p3_local4_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = fffffffffffff3b9
	ldx	[%i4+0x008],%g3		! Observed data at 000000001e000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4

	set	p3_local5_expect,%g1

!	Processor 3, local 5 is clean


	set	p3_local6_expect,%g1

!	Processor 3, local 6 is clean



!	Check Shared Memory

	set	share0_expect,%g4
	set	p3_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p3_memcheck_share0:
	ldx	[%g4+0x30],%g2	! Expected value = 7a000e8bfffff24c
	ldx	[%o0+0x30],%g3	! Read value at Mem[0000000030000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 0000ffffffffffff
	ldx	[%o0+0x38],%g3	! Read value at Mem[0000000030000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = fffff436000014ec
	ldx	[%o0+0x70],%g3	! Read value at Mem[0000000030000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = e89193e300000080
	ldx	[%o0+0x78],%g3	! Read value at Mem[0000000030000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p3_memcheck_share1:
	ldx	[%g4+0x30],%g2	! Expected value = ffab000b41a01ad3
	ldx	[%o1+0x30],%g3	! Read value at Mem[0000000030800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = e89193e31281300b
	ldx	[%o1+0x38],%g3	! Read value at Mem[0000000030800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 00000000000075ab
	ldx	[%o1+0x70],%g3	! Read value at Mem[0000000030800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = ffbee63bf0b92fcb
	ldx	[%o1+0x78],%g3	! Read value at Mem[0000000030800078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p3_memcheck_share2:
	ldx	[%g4+0x30],%g2	! Expected value = 00000000000000f6
	ldx	[%o2+0x30],%g3	! Read value at Mem[0000000031000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = df800000be8001bf
	ldx	[%o2+0x38],%g3	! Read value at Mem[0000000031000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = ffc639f400d702f8
	ldx	[%o2+0x70],%g3	! Read value at Mem[0000000031000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 58d37f1300ab0d66
	ldx	[%o2+0x78],%g3	! Read value at Mem[0000000031000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p3_memcheck_share3:
	ldx	[%g4+0x30],%g2	! Expected value = 0014bdb3e4f26e38
	ldx	[%o3+0x30],%g3	! Read value at Mem[0000000031800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = ffffd30000000000
	ldx	[%o3+0x38],%g3	! Read value at Mem[0000000031800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 2de0ad74a946fb27
	ldx	[%o3+0x70],%g3	! Read value at Mem[0000000031800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = ff46fb2700000026
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
	and	%l6,%l1,%l7
	andcc	%l1,-0x8f3,%l7
	xorcc	%l4,%l6,%l5
	umul	%l4,-0xd5d,%l4
	addc	%l1,%l0,%l0
	done

p3_trap1o:
	and	%l6,%l1,%l7
	andcc	%l1,-0x8f3,%l7
	xorcc	%l4,%l6,%l5
	umul	%l4,-0xd5d,%l4
	addc	%l1,%l0,%l0
	done


p3_trap2e:
	andn	%l4,%l1,%l3
	ldsb	[%i3+0x0e5],%l3		! Mem[000000001d8000e5]
	stw	%l6,[%i1+0x0ec]		! Mem[000000001c8000ec]
	done

p3_trap2o:
	andn	%l4,%l1,%l3
	ldsb	[%o3+0x0e5],%l3		! Mem[000000001d8000e5]
	stw	%l6,[%o1+0x0ec]		! Mem[000000001c8000ec]
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
	ldx	[%g1+0x000],%l0	! %l0 = b6a3ef00369d7afa
	ldx	[%g1+0x008],%l1	! %l1 = bfce9cffe6a174a5
	ldx	[%g1+0x010],%l2	! %l2 = 44102100674b0bb4
	ldx	[%g1+0x018],%l3	! %l3 = 7392d3ffa40f1271
	ldx	[%g1+0x020],%l4	! %l4 = f8cf18ffa510d6ac
	ldx	[%g1+0x028],%l5	! %l5 = add0a4fff4d27731
	ldx	[%g1+0x030],%l6	! %l6 = d5a49e004c9cc338
	ldx	[%g1+0x038],%l7	! %l7 = ef9f6e00018b3c33

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
	addccc	%l3,0x9ce,%l7
	subccc	%l1,%l7,%l0
	or	%l4,0xc49,%l7
	stw	%l7,[%i3+0x0a4]		! Mem[00000000118000a4]
	xnor	%l2,%l4,%l7
	jmpl	%o7,%g0
	prefetch [%i1+0x080],1
p0_near_0_lo:
	addccc	%l3,0x9ce,%l7
	subccc	%l1,%l7,%l0
	or	%l4,0xc49,%l7
	stw	%l7,[%o3+0x0a4]		! Mem[00000000118000a4]
	xnor	%l2,%l4,%l7
	jmpl	%o7,%g0
	prefetch [%o1+0x080],1
p0_near_0_he:
	prefetch [%i3+0x080],23
	addc	%l4,%l2,%l1
	sdivcc	%l2,-0xc45,%l3
	prefetch [%i2+0x0e0],4
	sth	%l4,[%i2+0x0fe]		! Mem[00000000110000fe]
	jmpl	%o7,%g0
	std	%l0,[%o2+0x008]		! Mem[0000000031000008]
p0_near_0_ho:
	prefetch [%o3+0x080],23
	addc	%l4,%l2,%l1
	sdivcc	%l2,-0xc45,%l3
	prefetch [%o2+0x0e0],4
	sth	%l4,[%o2+0x0fe]		! Mem[00000000110000fe]
	jmpl	%o7,%g0
	std	%l0,[%i2+0x008]		! Mem[0000000031000008]
p1_near_0_le:
	prefetch [%i2+0x1c0],4
	udivx	%l0,-0x66e,%l1
	xnorcc	%l1,%l3,%l1
	bpos	near3_b2b_l
	andncc	%l6,-0xe23,%l3
	andn	%l2,%l4,%l7
	jmpl	%o7,%g0
	prefetch [%i0+0x100],2
p1_near_0_lo:
	prefetch [%o2+0x1c0],4
	udivx	%l0,-0x66e,%l1
	xnorcc	%l1,%l3,%l1
	bpos	near3_b2b_l
	andncc	%l6,-0xe23,%l3
	andn	%l2,%l4,%l7
	jmpl	%o7,%g0
	prefetch [%o0+0x100],2
p1_near_0_he:
	xnorcc	%l0,%l1,%l4
	ldd	[%i4+0x140],%l0		! Mem[0000000016000140]
	jmpl	%o7,%g0
	srl	%l7,%l4,%l5
p1_near_0_ho:
	xnorcc	%l0,%l1,%l4
	ldd	[%o4+0x140],%l0		! Mem[0000000016000140]
	jmpl	%o7,%g0
	srl	%l7,%l4,%l5
p2_near_0_le:
	jmpl	%o7,%g0
	addc	%l1,%l3,%l6
p2_near_0_lo:
	jmpl	%o7,%g0
	addc	%l1,%l3,%l6
p2_near_0_he:
	ldsb	[%o3+0x068],%l1		! Mem[0000000031800068]
	xnorcc	%l4,%l5,%l3
	xorcc	%l0,-0x86a,%l0
	bl	far3_b2b_h
	ldsw	[%o1+0x028],%l1		! Mem[0000000030800028]
	udiv	%l4,-0x2de,%l7
	jmpl	%o7,%g0
	nop
p2_near_0_ho:
	ldsb	[%i3+0x068],%l1		! Mem[0000000031800068]
	xnorcc	%l4,%l5,%l3
	xorcc	%l0,-0x86a,%l0
	bl	far3_b2b_h
	ldsw	[%i1+0x028],%l1		! Mem[0000000030800028]
	udiv	%l4,-0x2de,%l7
	jmpl	%o7,%g0
	nop
p3_near_0_le:
	smulcc	%l6,-0xcd7,%l7
	jmpl	%o7,%g0
	ldsh	[%i3+0x0d8],%l7		! Mem[000000001d8000d8]
p3_near_0_lo:
	smulcc	%l6,-0xcd7,%l7
	jmpl	%o7,%g0
	ldsh	[%o3+0x0d8],%l7		! Mem[000000001d8000d8]
p3_near_0_he:
	bg	near0_b2b_h
	ldsb	[%i0+0x0dd],%l2		! Mem[000000001c0000dd]
	xor	%l0,-0x9f8,%l0
	andncc	%l7,%l2,%l3
	nop
	xor	%l3,%l5,%l7
	jmpl	%o7,%g0
	prefetch [%i3+0x1e0],0
p3_near_0_ho:
	bg	near0_b2b_h
	ldsb	[%o0+0x0dd],%l2		! Mem[000000001c0000dd]
	xor	%l0,-0x9f8,%l0
	andncc	%l7,%l2,%l3
	nop
	xor	%l3,%l5,%l7
	jmpl	%o7,%g0
	prefetch [%o3+0x1e0],0
near0_b2b_h:
	orncc	%l6,-0x971,%l1
	addccc	%l6,%l5,%l4
	jmpl	%o7,%g0
	addcc	%l3,0x242,%l1
near0_b2b_l:
	smulcc	%l4,0xebf,%l7
	umulcc	%l5,%l0,%l0
	jmpl	%o7,%g0
	add	%l5,%l4,%l3
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	sllx	%l3,%l5,%l1
	jmpl	%o7,%g0
	prefetch [%i2+0x020],1
p0_near_1_lo:
	sllx	%l3,%l5,%l1
	jmpl	%o7,%g0
	prefetch [%o2+0x020],1
p0_near_1_he:
	bvs	far3_b2b_h
	xnorcc	%l2,%l2,%l5
	umulcc	%l6,0x157,%l4
	and	%l1,%l1,%l1
	jmpl	%o7,%g0
	sdivcc	%l6,0x2fd,%l3
p0_near_1_ho:
	bvs	far3_b2b_h
	xnorcc	%l2,%l2,%l5
	umulcc	%l6,0x157,%l4
	and	%l1,%l1,%l1
	jmpl	%o7,%g0
	sdivcc	%l6,0x2fd,%l3
p1_near_1_le:
	taddcc	%l1,%l6,%l4
	prefetch [%i1+0x160],22
	prefetch [%i3+0x120],2
	prefetch [%i2+0x1e0],3
	prefetch [%i2+0x160],22
	jmpl	%o7,%g0
	ldstub	[%o1+0x010],%l7		! Mem[0000000030800010]
p1_near_1_lo:
	taddcc	%l1,%l6,%l4
	prefetch [%o1+0x160],22
	prefetch [%o3+0x120],2
	prefetch [%o2+0x1e0],3
	prefetch [%o2+0x160],22
	jmpl	%o7,%g0
	ldstub	[%i1+0x010],%l7		! Mem[0000000030800010]
p1_near_1_he:
	smulcc	%l4,0x72b,%l6
	lduw	[%o0+0x010],%l2		! Mem[0000000030000010]
	jmpl	%o7,%g0
	addccc	%l7,0x3da,%l0
p1_near_1_ho:
	smulcc	%l4,0x72b,%l6
	lduw	[%i0+0x010],%l2		! Mem[0000000030000010]
	jmpl	%o7,%g0
	addccc	%l7,0x3da,%l0
p2_near_1_le:
	orncc	%l3,0xe36,%l0
	andn	%l1,0xe4c,%l1
	srlx	%l2,%l7,%l0
	jmpl	%o7,%g0
	lduw	[%o1+0x028],%l2		! Mem[0000000030800028]
p2_near_1_lo:
	orncc	%l3,0xe36,%l0
	andn	%l1,0xe4c,%l1
	srlx	%l2,%l7,%l0
	jmpl	%o7,%g0
	lduw	[%i1+0x028],%l2		! Mem[0000000030800028]
p2_near_1_he:
	subccc	%l7,0x1a1,%l7
	sra	%l6,0x004,%l4
	sll	%l1,%l5,%l3
	sdivcc	%l5,0x93e,%l3
	jmpl	%o7,%g0
	sll	%l7,%l3,%l4
p2_near_1_ho:
	subccc	%l7,0x1a1,%l7
	sra	%l6,0x004,%l4
	sll	%l1,%l5,%l3
	sdivcc	%l5,0x93e,%l3
	jmpl	%o7,%g0
	sll	%l7,%l3,%l4
p3_near_1_le:
	jmpl	%o7,%g0
	orncc	%l2,%l4,%l7
p3_near_1_lo:
	jmpl	%o7,%g0
	orncc	%l2,%l4,%l7
p3_near_1_he:
	sdivx	%l6,-0x8cf,%l4
	std	%l0,[%o1+0x070]		! Mem[0000000030800070]
	prefetch [%i3+0x080],3
	sth	%l5,[%o0+0x072]		! Mem[0000000030000072]
	jmpl	%o7,%g0
	std	%l6,[%o1+0x070]		! Mem[0000000030800070]
p3_near_1_ho:
	sdivx	%l6,-0x8cf,%l4
	std	%l0,[%i1+0x070]		! Mem[0000000030800070]
	prefetch [%o3+0x080],3
	sth	%l5,[%i0+0x072]		! Mem[0000000030000072]
	jmpl	%o7,%g0
	std	%l6,[%i1+0x070]		! Mem[0000000030800070]
near1_b2b_h:
	xor	%l7,0xc3f,%l1
	jmpl	%o7,%g0
	addcc	%l1,%l3,%l6
near1_b2b_l:
	orn	%l6,%l1,%l5
	jmpl	%o7,%g0
	sdiv	%l4,0x648,%l5
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	stb	%l6,[%i5+0x06c]		! Mem[000000001280006c]
	std	%l0,[%o3+0x008]		! Mem[0000000031800008]
	ldsh	[%i1+0x098],%l3		! Mem[0000000010800098]
	jmpl	%o7,%g0
	sth	%l1,[%o3+0x048]		! Mem[0000000031800048]
p0_near_2_lo:
	stb	%l6,[%o5+0x06c]		! Mem[000000001280006c]
	std	%l0,[%i3+0x008]		! Mem[0000000031800008]
	ldsh	[%o1+0x098],%l3		! Mem[0000000010800098]
	jmpl	%o7,%g0
	sth	%l1,[%i3+0x048]		! Mem[0000000031800048]
p0_near_2_he:
	lduh	[%o2+0x00e],%l3		! Mem[000000003100000e]
	xorcc	%l6,%l0,%l1
	taddcc	%l0,%l3,%l6
	sdivx	%l3,-0x178,%l5
	lduh	[%o2+0x00c],%l0		! Mem[000000003100000c]
	prefetch [%i3+0x0c0],1
	jmpl	%o7,%g0
	sdivcc	%l6,0x0db,%l7
p0_near_2_ho:
	lduh	[%i2+0x00e],%l3		! Mem[000000003100000e]
	xorcc	%l6,%l0,%l1
	taddcc	%l0,%l3,%l6
	sdivx	%l3,-0x178,%l5
	lduh	[%i2+0x00c],%l0		! Mem[000000003100000c]
	prefetch [%o3+0x0c0],1
	jmpl	%o7,%g0
	sdivcc	%l6,0x0db,%l7
p1_near_2_le:
	xnor	%l0,%l4,%l6
	tsubcc	%l0,%l3,%l2
	sll	%l3,0x009,%l5
	jmpl	%o7,%g0
	stx	%l7,[%o0+0x058]		! Mem[0000000030000058]
p1_near_2_lo:
	xnor	%l0,%l4,%l6
	tsubcc	%l0,%l3,%l2
	sll	%l3,0x009,%l5
	jmpl	%o7,%g0
	stx	%l7,[%i0+0x058]		! Mem[0000000030000058]
p1_near_2_he:
	ldx	[%i0+0x040],%l5		! Mem[0000000014000040]
	jmpl	%o7,%g0
	tsubcc	%l6,-0x344,%l0
p1_near_2_ho:
	ldx	[%o0+0x040],%l5		! Mem[0000000014000040]
	jmpl	%o7,%g0
	tsubcc	%l6,-0x344,%l0
p2_near_2_le:
	ldsb	[%i1+0x032],%l7		! Mem[0000000018800032]
	ldsh	[%o2+0x060],%l6		! Mem[0000000031000060]
	or	%l3,%l5,%l3
	ldsb	[%o3+0x02f],%l1		! Mem[000000003180002f]
	udivx	%l1,-0xd77,%l7
	jmpl	%o7,%g0
	addc	%l0,%l0,%l0
p2_near_2_lo:
	ldsb	[%o1+0x032],%l7		! Mem[0000000018800032]
	ldsh	[%i2+0x060],%l6		! Mem[0000000031000060]
	or	%l3,%l5,%l3
	ldsb	[%i3+0x02f],%l1		! Mem[000000003180002f]
	udivx	%l1,-0xd77,%l7
	jmpl	%o7,%g0
	addc	%l0,%l0,%l0
p2_near_2_he:
	umul	%l5,%l3,%l7
	subc	%l6,%l7,%l1
	stb	%l7,[%o3+0x06f]		! Mem[000000003180006f]
	add	%l5,%l3,%l1
	ldsh	[%i0+0x114],%l1		! Mem[0000000018000114]
	xnor	%l7,0xd64,%l1
	jmpl	%o7,%g0
	ldstub	[%o0+0x064],%l3		! Mem[0000000030000064]
p2_near_2_ho:
	umul	%l5,%l3,%l7
	subc	%l6,%l7,%l1
	stb	%l7,[%i3+0x06f]		! Mem[000000003180006f]
	add	%l5,%l3,%l1
	ldsh	[%o0+0x114],%l1		! Mem[0000000018000114]
	xnor	%l7,0xd64,%l1
	jmpl	%o7,%g0
	ldstub	[%i0+0x064],%l3		! Mem[0000000030000064]
p3_near_2_le:
	add	%l3,-0x3ab,%l1
	ldsw	[%i1+0x138],%l3		! Mem[000000001c800138]
	udivcc	%l6,-0xccc,%l2
	umulcc	%l0,0x84f,%l1
	jmpl	%o7,%g0
	prefetch [%i3+0x1c0],0
p3_near_2_lo:
	add	%l3,-0x3ab,%l1
	ldsw	[%o1+0x138],%l3		! Mem[000000001c800138]
	udivcc	%l6,-0xccc,%l2
	umulcc	%l0,0x84f,%l1
	jmpl	%o7,%g0
	prefetch [%o3+0x1c0],0
p3_near_2_he:
	taddcc	%l3,%l2,%l6
	jmpl	%o7,%g0
	smul	%l1,0xb5b,%l6
p3_near_2_ho:
	taddcc	%l3,%l2,%l6
	jmpl	%o7,%g0
	smul	%l1,0xb5b,%l6
near2_b2b_h:
	mulx	%l0,-0xe3f,%l0
	jmpl	%o7,%g0
	sub	%l4,0xa29,%l7
near2_b2b_l:
	sdivcc	%l1,-0x0ca,%l5
	jmpl	%o7,%g0
	xor	%l1,-0xea8,%l6
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	ldsw	[%o2+0x048],%l3		! Mem[0000000031000048]
	prefetch [%i0+0x0a0],20
	ldsh	[%i1+0x086],%l4		! Mem[0000000010800086]
	jmpl	%o7,%g0
	andcc	%l1,%l5,%l5
p0_near_3_lo:
	ldsw	[%i2+0x048],%l3		! Mem[0000000031000048]
	prefetch [%o0+0x0a0],20
	ldsh	[%o1+0x086],%l4		! Mem[0000000010800086]
	jmpl	%o7,%g0
	andcc	%l1,%l5,%l5
p0_near_3_he:
	prefetch [%i2+0x020],2
	sdiv	%l6,-0x9a8,%l3
	subccc	%l7,0x9b7,%l0
	nop
	sdivx	%l1,0x38e,%l0
	andncc	%l7,%l0,%l7
	jmpl	%o7,%g0
	orncc	%l6,%l7,%l7
p0_near_3_ho:
	prefetch [%o2+0x020],2
	sdiv	%l6,-0x9a8,%l3
	subccc	%l7,0x9b7,%l0
	nop
	sdivx	%l1,0x38e,%l0
	andncc	%l7,%l0,%l7
	jmpl	%o7,%g0
	orncc	%l6,%l7,%l7
p1_near_3_le:
	swap	[%o3+0x054],%l5		! Mem[0000000031800054]
	sdivx	%l6,-0x9c4,%l3
	stx	%l1,[%o1+0x010]		! Mem[0000000030800010]
	tsubcc	%l3,-0xa5f,%l0
	jmpl	%o7,%g0
	addc	%l4,%l7,%l3
p1_near_3_lo:
	swap	[%i3+0x054],%l5		! Mem[0000000031800054]
	sdivx	%l6,-0x9c4,%l3
	stx	%l1,[%i1+0x010]		! Mem[0000000030800010]
	tsubcc	%l3,-0xa5f,%l0
	jmpl	%o7,%g0
	addc	%l4,%l7,%l3
p1_near_3_he:
	taddcc	%l6,-0x2d2,%l5
	prefetch [%i3+0x040],22
	jmpl	%o7,%g0
	sub	%l3,%l0,%l2
p1_near_3_ho:
	taddcc	%l6,-0x2d2,%l5
	prefetch [%o3+0x040],22
	jmpl	%o7,%g0
	sub	%l3,%l0,%l2
p2_near_3_le:
	ldub	[%o0+0x06d],%l4		! Mem[000000003000006d]
	prefetch [%i1+0x020],16
	srlx	%l4,%l6,%l5
	prefetch [%i2+0x080],21
	jmpl	%o7,%g0
	srl	%l0,%l1,%l1
p2_near_3_lo:
	ldub	[%i0+0x06d],%l4		! Mem[000000003000006d]
	prefetch [%o1+0x020],16
	srlx	%l4,%l6,%l5
	prefetch [%o2+0x080],21
	jmpl	%o7,%g0
	srl	%l0,%l1,%l1
p2_near_3_he:
	stx	%l1,[%o2+0x020]		! Mem[0000000031000020]
	ldsw	[%o1+0x06c],%l4		! Mem[000000003080006c]
	jmpl	%o7,%g0
	srax	%l3,%l4,%l0
p2_near_3_ho:
	stx	%l1,[%i2+0x020]		! Mem[0000000031000020]
	ldsw	[%i1+0x06c],%l4		! Mem[000000003080006c]
	jmpl	%o7,%g0
	srax	%l3,%l4,%l0
p3_near_3_le:
	mulx	%l4,0x46f,%l3
	sdivcc	%l4,-0x630,%l4
	jmpl	%o7,%g0
	sdivcc	%l1,-0x3d8,%l7
p3_near_3_lo:
	mulx	%l4,0x46f,%l3
	sdivcc	%l4,-0x630,%l4
	jmpl	%o7,%g0
	sdivcc	%l1,-0x3d8,%l7
p3_near_3_he:
	jmpl	%o7,%g0
	ldx	[%o0+0x030],%l6		! Mem[0000000030000030]
p3_near_3_ho:
	jmpl	%o7,%g0
	ldx	[%i0+0x030],%l6		! Mem[0000000030000030]
near3_b2b_h:
	srl	%l3,%l6,%l5
	subccc	%l2,%l1,%l1
	sdivcc	%l0,-0xeea,%l2
	smul	%l6,%l3,%l0
	jmpl	%o7,%g0
	add	%l3,%l1,%l3
near3_b2b_l:
	sub	%l3,-0x72f,%l2
	udivcc	%l7,0x9a1,%l0
	addcc	%l7,-0x2f9,%l5
	srax	%l5,0x018,%l0
	jmpl	%o7,%g0
	andn	%l4,%l5,%l7
user_near3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far0_start:
p0_far_0_le:
	ldx	[%o3+0x040],%l7		! Mem[0000000031800040]
	jmpl	%o7,%g0
	subccc	%l3,0x9ce,%l1
p0_far_0_lo:
	ldx	[%i3+0x040],%l7		! Mem[0000000031800040]
	jmpl	%o7,%g0
	subccc	%l3,0x9ce,%l1
p0_far_0_he:
	or	%l2,%l1,%l0
	stw	%l4,[%i3+0x09c]		! Mem[000000001180009c]
	prefetch [%i3+0x060],20
	jmpl	%o7,%g0
	prefetch [%i2+0x060],0
p0_far_0_ho:
	or	%l2,%l1,%l0
	stw	%l4,[%o3+0x09c]		! Mem[000000001180009c]
	prefetch [%o3+0x060],20
	jmpl	%o7,%g0
	prefetch [%o2+0x060],0
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p1_far_0_le:
	jmpl	%o7,%g0
	prefetch [%i3+0x000],22
p1_far_0_lo:
	jmpl	%o7,%g0
	prefetch [%o3+0x000],22
p1_far_0_he:
	udivcc	%l3,0x3f1,%l7
	sra	%l2,0x002,%l2
	stb	%l4,[%o1+0x05d]		! Mem[000000003080005d]
	add	%l7,%l0,%l4
	nop
	prefetch [%i3+0x140],23
	jmpl	%o7,%g0
	subc	%l6,0x151,%l3
p1_far_0_ho:
	udivcc	%l3,0x3f1,%l7
	sra	%l2,0x002,%l2
	stb	%l4,[%i1+0x05d]		! Mem[000000003080005d]
	add	%l7,%l0,%l4
	nop
	prefetch [%o3+0x140],23
	jmpl	%o7,%g0
	subc	%l6,0x151,%l3
p1_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p2_far_0_le:
	sra	%l0,0x007,%l4
	addccc	%l3,0x91b,%l7
	stw	%l5,[%o0+0x02c]		! Mem[000000003000002c]
	jmpl	%o7,%g0
	prefetch [%i1+0x0e0],21
p2_far_0_lo:
	sra	%l0,0x007,%l4
	addccc	%l3,0x91b,%l7
	stw	%l5,[%i0+0x02c]		! Mem[000000003000002c]
	jmpl	%o7,%g0
	prefetch [%o1+0x0e0],21
p2_far_0_he:
	xorcc	%l1,%l1,%l0
	smul	%l4,-0x61e,%l6
	xnorcc	%l7,0x33d,%l2
	mulx	%l7,-0xd78,%l3
	jmpl	%o7,%g0
	ldx	[%o1+0x028],%l6		! Mem[0000000030800028]
p2_far_0_ho:
	xorcc	%l1,%l1,%l0
	smul	%l4,-0x61e,%l6
	xnorcc	%l7,0x33d,%l2
	mulx	%l7,-0xd78,%l3
	jmpl	%o7,%g0
	ldx	[%i1+0x028],%l6		! Mem[0000000030800028]
p2_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p3_far_0_le:
	sdivcc	%l3,-0xae2,%l5
	sra	%l3,0x009,%l6
	addc	%l7,%l1,%l4
	jmpl	%o7,%g0
	std	%l0,[%o0+0x078]		! Mem[0000000030000078]
p3_far_0_lo:
	sdivcc	%l3,-0xae2,%l5
	sra	%l3,0x009,%l6
	addc	%l7,%l1,%l4
	jmpl	%o7,%g0
	std	%l0,[%i0+0x078]		! Mem[0000000030000078]
p3_far_0_he:
	udiv	%l5,0xc5b,%l5
	andcc	%l1,0x92b,%l4
	ldstub	[%i1+0x104],%l1		! Mem[000000001c800104]
	xorcc	%l0,%l7,%l5
	jmpl	%o7,%g0
	stw	%l3,[%o3+0x038]		! Mem[0000000031800038]
p3_far_0_ho:
	udiv	%l5,0xc5b,%l5
	andcc	%l1,0x92b,%l4
	ldstub	[%o1+0x104],%l1		! Mem[000000001c800104]
	xorcc	%l0,%l7,%l5
	jmpl	%o7,%g0
	stw	%l3,[%i3+0x038]		! Mem[0000000031800038]
p3_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	andn	%l2,%l0,%l0
	andncc	%l1,%l7,%l0
	jmpl	%o7,%g0
	addc	%l3,%l4,%l6
far0_b2b_l:
	sra	%l4,%l5,%l0
	sra	%l1,%l0,%l5
	jmpl	%o7,%g0
	udivx	%l7,0xfa2,%l2
user_far0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far1_start:
p0_far_1_le:
	smulcc	%l1,%l0,%l2
	lduw	[%o2+0x004],%l5		! Mem[0000000031000004]
	prefetch [%i3+0x080],21
	prefetch [%i3+0x040],3
	xnorcc	%l6,0xd36,%l7
	jmpl	%o7,%g0
	addcc	%l4,%l2,%l7
p0_far_1_lo:
	smulcc	%l1,%l0,%l2
	lduw	[%i2+0x004],%l5		! Mem[0000000031000004]
	prefetch [%o3+0x080],21
	prefetch [%o3+0x040],3
	xnorcc	%l6,0xd36,%l7
	jmpl	%o7,%g0
	addcc	%l4,%l2,%l7
p0_far_1_he:
	swap	[%o2+0x040],%l3		! Mem[0000000031000040]
	prefetch [%i2+0x080],23
	lduw	[%o0+0x048],%l4		! Mem[0000000030000048]
	jmpl	%o7,%g0
	and	%l4,%l2,%l2
p0_far_1_ho:
	swap	[%i2+0x040],%l3		! Mem[0000000031000040]
	prefetch [%o2+0x080],23
	lduw	[%i0+0x048],%l4		! Mem[0000000030000048]
	jmpl	%o7,%g0
	and	%l4,%l2,%l2
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p1_far_1_le:
	prefetch [%i6+0x000],16
	sdivcc	%l3,-0xe32,%l2
	prefetch [%i3+0x160],3
	ldsw	[%i1+0x1f8],%l6		! Mem[00000000148001f8]
	stx	%l5,[%o0+0x050]		! Mem[0000000030000050]
	jmpl	%o7,%g0
	prefetch [%i0+0x1c0],23
p1_far_1_lo:
	prefetch [%o6+0x000],16
	sdivcc	%l3,-0xe32,%l2
	prefetch [%o3+0x160],3
	ldsw	[%o1+0x1f8],%l6		! Mem[00000000148001f8]
	stx	%l5,[%i0+0x050]		! Mem[0000000030000050]
	jmpl	%o7,%g0
	prefetch [%o0+0x1c0],23
p1_far_1_he:
	andcc	%l3,-0xe78,%l2
	prefetch [%i1+0x160],2
	jmpl	%o7,%g0
	add	%l2,-0x62a,%l3
p1_far_1_ho:
	andcc	%l3,-0xe78,%l2
	prefetch [%o1+0x160],2
	jmpl	%o7,%g0
	add	%l2,-0x62a,%l3
p1_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p2_far_1_le:
	umulcc	%l3,%l3,%l5
	sra	%l0,0x00f,%l3
	sth	%l2,[%o0+0x066]		! Mem[0000000030000066]
	udivcc	%l4,-0xbc8,%l4
	and	%l5,-0xb21,%l7
	jmpl	%o7,%g0
	orcc	%l6,-0x51c,%l3
p2_far_1_lo:
	umulcc	%l3,%l3,%l5
	sra	%l0,0x00f,%l3
	sth	%l2,[%i0+0x066]		! Mem[0000000030000066]
	udivcc	%l4,-0xbc8,%l4
	and	%l5,-0xb21,%l7
	jmpl	%o7,%g0
	orcc	%l6,-0x51c,%l3
p2_far_1_he:
	tsubcc	%l0,%l3,%l7
	srax	%l3,0x021,%l7
	srlx	%l7,%l0,%l0
	xnorcc	%l7,0xe54,%l7
	jmpl	%o7,%g0
	prefetch [%i2+0x1c0],21
p2_far_1_ho:
	tsubcc	%l0,%l3,%l7
	srax	%l3,0x021,%l7
	srlx	%l7,%l0,%l0
	xnorcc	%l7,0xe54,%l7
	jmpl	%o7,%g0
	prefetch [%o2+0x1c0],21
p2_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p3_far_1_le:
	ldsh	[%i1+0x170],%l3		! Mem[000000001c800170]
	xnorcc	%l7,-0x5e0,%l1
	smulcc	%l3,0xd58,%l5
	ldd	[%o3+0x030],%l0		! Mem[0000000031800030]
	jmpl	%o7,%g0
	sdivcc	%l6,0x40d,%l7
p3_far_1_lo:
	ldsh	[%o1+0x170],%l3		! Mem[000000001c800170]
	xnorcc	%l7,-0x5e0,%l1
	smulcc	%l3,0xd58,%l5
	ldd	[%i3+0x030],%l0		! Mem[0000000031800030]
	jmpl	%o7,%g0
	sdivcc	%l6,0x40d,%l7
p3_far_1_he:
	sll	%l7,0x01c,%l3
	lduh	[%o2+0x072],%l5		! Mem[0000000031000072]
	jmpl	%o7,%g0
	umulcc	%l7,-0xf64,%l6
p3_far_1_ho:
	sll	%l7,0x01c,%l3
	lduh	[%i2+0x072],%l5		! Mem[0000000031000072]
	jmpl	%o7,%g0
	umulcc	%l7,-0xf64,%l6
p3_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	andcc	%l4,-0x5ca,%l7
	srlx	%l3,0x01d,%l3
	jmpl	%o7,%g0
	xnor	%l1,%l4,%l0
far1_b2b_l:
	orn	%l1,0xb52,%l1
	andcc	%l6,0x437,%l4
	jmpl	%o7,%g0
	addccc	%l1,-0x524,%l5
user_far1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far2_start:
p0_far_2_le:
	sllx	%l1,0x028,%l2
	sdiv	%l0,-0xdc3,%l6
	prefetch [%i2+0x040],2
	udivcc	%l3,-0xa31,%l6
	prefetch [%i2+0x000],2
	prefetch [%i0+0x0e0],2
	jmpl	%o7,%g0
	taddcc	%l3,%l4,%l1
p0_far_2_lo:
	sllx	%l1,0x028,%l2
	sdiv	%l0,-0xdc3,%l6
	prefetch [%o2+0x040],2
	udivcc	%l3,-0xa31,%l6
	prefetch [%o2+0x000],2
	prefetch [%o0+0x0e0],2
	jmpl	%o7,%g0
	taddcc	%l3,%l4,%l1
p0_far_2_he:
	jmpl	%o7,%g0
	xnorcc	%l5,%l3,%l3
p0_far_2_ho:
	jmpl	%o7,%g0
	xnorcc	%l5,%l3,%l3
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p1_far_2_le:
	ldd	[%o1+0x018],%l6		! Mem[0000000030800018]
	udiv	%l1,-0xe82,%l3
	or	%l6,%l1,%l6
	jmpl	%o7,%g0
	sth	%l2,[%i0+0x162]		! Mem[0000000014000162]
p1_far_2_lo:
	ldd	[%i1+0x018],%l6		! Mem[0000000030800018]
	udiv	%l1,-0xe82,%l3
	or	%l6,%l1,%l6
	jmpl	%o7,%g0
	sth	%l2,[%o0+0x162]		! Mem[0000000014000162]
p1_far_2_he:
	stx	%l4,[%o2+0x050]		! Mem[0000000031000050]
	and	%l1,%l4,%l0
	or	%l4,%l4,%l7
	orn	%l4,%l0,%l1
	andn	%l7,-0x187,%l3
	jmpl	%o7,%g0
	umul	%l2,-0x0d1,%l2
p1_far_2_ho:
	stx	%l4,[%i2+0x050]		! Mem[0000000031000050]
	and	%l1,%l4,%l0
	or	%l4,%l4,%l7
	orn	%l4,%l0,%l1
	andn	%l7,-0x187,%l3
	jmpl	%o7,%g0
	umul	%l2,-0x0d1,%l2
p1_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p2_far_2_le:
	ldstub	[%i2+0x0d5],%l7		! Mem[00000000190000d5]
	jmpl	%o7,%g0
	ldsw	[%o0+0x068],%l4		! Mem[0000000030000068]
p2_far_2_lo:
	ldstub	[%o2+0x0d5],%l7		! Mem[00000000190000d5]
	jmpl	%o7,%g0
	ldsw	[%i0+0x068],%l4		! Mem[0000000030000068]
p2_far_2_he:
	jmpl	%o7,%g0
	srax	%l0,%l6,%l2
p2_far_2_ho:
	jmpl	%o7,%g0
	srax	%l0,%l6,%l2
p2_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p3_far_2_le:
	jmpl	%o7,%g0
	prefetch [%i2+0x080],3
p3_far_2_lo:
	jmpl	%o7,%g0
	prefetch [%o2+0x080],3
p3_far_2_he:
	sllx	%l1,0x017,%l5
	jmpl	%o7,%g0
	stw	%l7,[%i3+0x044]		! Mem[000000001d800044]
p3_far_2_ho:
	sllx	%l1,0x017,%l5
	jmpl	%o7,%g0
	stw	%l7,[%o3+0x044]		! Mem[000000001d800044]
p3_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	sllx	%l0,0x022,%l5
far2_b2b_l:
	jmpl	%o7,%g0
	orcc	%l5,-0x4e2,%l2
user_far2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far3_start:
p0_far_3_le:
	sra	%l1,%l7,%l2
	addc	%l7,%l0,%l0
	taddcc	%l3,-0x8db,%l4
	jmpl	%o7,%g0
	orncc	%l2,0x017,%l5
p0_far_3_lo:
	sra	%l1,%l7,%l2
	addc	%l7,%l0,%l0
	taddcc	%l3,-0x8db,%l4
	jmpl	%o7,%g0
	orncc	%l2,0x017,%l5
p0_far_3_he:
	xorcc	%l0,-0x0f1,%l4
	subccc	%l1,-0x2dc,%l5
	srax	%l2,0x037,%l6
	jmpl	%o7,%g0
	srl	%l0,%l4,%l2
p0_far_3_ho:
	xorcc	%l0,-0x0f1,%l4
	subccc	%l1,-0x2dc,%l5
	srax	%l2,0x037,%l6
	jmpl	%o7,%g0
	srl	%l0,%l4,%l2
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p1_far_3_le:
	xorcc	%l2,%l4,%l3
	jmpl	%o7,%g0
	udivcc	%l2,-0x5e4,%l6
p1_far_3_lo:
	xorcc	%l2,%l4,%l3
	jmpl	%o7,%g0
	udivcc	%l2,-0x5e4,%l6
p1_far_3_he:
	prefetch [%i3+0x000],23
	stw	%l7,[%i0+0x020]		! Mem[0000000014000020]
	and	%l4,-0x739,%l4
	jmpl	%o7,%g0
	srlx	%l7,0x018,%l7
p1_far_3_ho:
	prefetch [%o3+0x000],23
	stw	%l7,[%o0+0x020]		! Mem[0000000014000020]
	and	%l4,-0x739,%l4
	jmpl	%o7,%g0
	srlx	%l7,0x018,%l7
p1_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p2_far_3_le:
	ldsw	[%o0+0x020],%l2		! Mem[0000000030000020]
	srlx	%l4,%l2,%l4
	orncc	%l2,-0xbd8,%l1
	taddcc	%l1,%l1,%l2
	jmpl	%o7,%g0
	std	%l4,[%o0+0x068]		! Mem[0000000030000068]
p2_far_3_lo:
	ldsw	[%i0+0x020],%l2		! Mem[0000000030000020]
	srlx	%l4,%l2,%l4
	orncc	%l2,-0xbd8,%l1
	taddcc	%l1,%l1,%l2
	jmpl	%o7,%g0
	std	%l4,[%i0+0x068]		! Mem[0000000030000068]
p2_far_3_he:
	jmpl	%o7,%g0
	stx	%l5,[%i2+0x100]		! Mem[0000000019000100]
p2_far_3_ho:
	jmpl	%o7,%g0
	stx	%l5,[%o2+0x100]		! Mem[0000000019000100]
p2_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p3_far_3_le:
	sub	%l4,%l0,%l1
	mulx	%l2,0x5f1,%l1
	srl	%l5,%l6,%l1
	sdivx	%l6,0xe47,%l7
	mulx	%l1,%l4,%l7
	xnorcc	%l6,%l1,%l7
	jmpl	%o7,%g0
	udiv	%l7,0x86c,%l1
p3_far_3_lo:
	sub	%l4,%l0,%l1
	mulx	%l2,0x5f1,%l1
	srl	%l5,%l6,%l1
	sdivx	%l6,0xe47,%l7
	mulx	%l1,%l4,%l7
	xnorcc	%l6,%l1,%l7
	jmpl	%o7,%g0
	udiv	%l7,0x86c,%l1
p3_far_3_he:
	ldd	[%o3+0x078],%l6		! Mem[0000000031800078]
	or	%l7,%l2,%l7
	smulcc	%l6,0xb98,%l0
	and	%l7,-0xcbb,%l7
	addc	%l5,%l0,%l0
	jmpl	%o7,%g0
	lduh	[%i1+0x068],%l4		! Mem[000000001c800068]
p3_far_3_ho:
	ldd	[%i3+0x078],%l6		! Mem[0000000031800078]
	or	%l7,%l2,%l7
	smulcc	%l6,0xb98,%l0
	and	%l7,-0xcbb,%l7
	addc	%l5,%l0,%l0
	jmpl	%o7,%g0
	lduh	[%o1+0x068],%l4		! Mem[000000001c800068]
p3_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sub	%l0,-0x3e5,%l1
	sdiv	%l3,0xe0e,%l4
	jmpl	%o7,%g0
	orncc	%l3,-0x987,%l2
far3_b2b_l:
	nop
	andcc	%l6,-0x2bd,%l4
	jmpl	%o7,%g0
	sll	%l2,0x000,%l6
user_far3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	andncc	%l1,-0xb83,%l5
	udivx	%l2,-0x3d6,%l6
	stx	%l7,[%i4+0x070]		! Mem[0000000012000070]
	jmpl	%g6+8,%g0
	swap	[%o1+0x008],%l6		! Mem[0000000030800008]
p0_call_0_le:
	srax	%l6,0x00b,%l1
	lduw	[%o3+0x000],%l5		! Mem[0000000031800000]
	retl
	prefetch [%i1+0x000],3
p0_jmpl_0_lo:
	andncc	%l1,-0xb83,%l5
	udivx	%l2,-0x3d6,%l6
	stx	%l7,[%o4+0x070]		! Mem[0000000012000070]
	jmpl	%g6+8,%g0
	swap	[%i1+0x008],%l6		! Mem[0000000030800008]
p0_call_0_lo:
	srax	%l6,0x00b,%l1
	lduw	[%i3+0x000],%l5		! Mem[0000000031800000]
	retl
	prefetch [%o1+0x000],3
p0_jmpl_0_he:
	sth	%l5,[%o2+0x042]		! Mem[0000000031000042]
	xor	%l0,0x18d,%l0
	prefetch [%i3+0x0a0],3
	jmpl	%g6+8,%g0
	addc	%l2,%l1,%l5
p0_call_0_he:
	sdiv	%l5,0xa3e,%l0
	subc	%l7,0x481,%l6
	or	%l3,-0x1c3,%l6
	sub	%l7,%l1,%l2
	udivcc	%l6,-0xfd6,%l5
	retl
	umul	%l7,0xe55,%l6
p0_jmpl_0_ho:
	sth	%l5,[%i2+0x042]		! Mem[0000000031000042]
	xor	%l0,0x18d,%l0
	prefetch [%o3+0x0a0],3
	jmpl	%g6+8,%g0
	addc	%l2,%l1,%l5
p0_call_0_ho:
	sdiv	%l5,0xa3e,%l0
	subc	%l7,0x481,%l6
	or	%l3,-0x1c3,%l6
	sub	%l7,%l1,%l2
	udivcc	%l6,-0xfd6,%l5
	retl
	umul	%l7,0xe55,%l6
p1_jmpl_0_le:
	lduh	[%i1+0x106],%l3		! Mem[0000000014800106]
	prefetch [%i2+0x000],21
	udiv	%l4,0xeb6,%l2
	umul	%l1,%l1,%l2
	srlx	%l5,%l1,%l1
	andn	%l4,%l2,%l3
	jmpl	%g6+8,%g0
	taddcc	%l2,%l0,%l3
p1_call_0_le:
	andncc	%l0,%l5,%l4
	prefetch [%i0+0x0e0],22
	retl
	prefetch [%i1+0x1e0],23
p1_jmpl_0_lo:
	lduh	[%o1+0x106],%l3		! Mem[0000000014800106]
	prefetch [%o2+0x000],21
	udiv	%l4,0xeb6,%l2
	umul	%l1,%l1,%l2
	srlx	%l5,%l1,%l1
	andn	%l4,%l2,%l3
	jmpl	%g6+8,%g0
	taddcc	%l2,%l0,%l3
p1_call_0_lo:
	andncc	%l0,%l5,%l4
	prefetch [%o0+0x0e0],22
	retl
	prefetch [%o1+0x1e0],23
p1_jmpl_0_he:
	xor	%l1,%l2,%l6
	stw	%l7,[%i0+0x024]		! Mem[0000000014000024]
	orcc	%l6,%l1,%l2
	ldstub	[%o2+0x014],%l0		! Mem[0000000031000014]
	jmpl	%g6+8,%g0
	srl	%l2,%l4,%l2
p1_call_0_he:
	swap	[%o3+0x050],%l3		! Mem[0000000031800050]
	ldsh	[%o3+0x012],%l7		! Mem[0000000031800012]
	retl
	ldsh	[%o1+0x010],%l0		! Mem[0000000030800010]
p1_jmpl_0_ho:
	xor	%l1,%l2,%l6
	stw	%l7,[%o0+0x024]		! Mem[0000000014000024]
	orcc	%l6,%l1,%l2
	ldstub	[%i2+0x014],%l0		! Mem[0000000031000014]
	jmpl	%g6+8,%g0
	srl	%l2,%l4,%l2
p1_call_0_ho:
	swap	[%i3+0x050],%l3		! Mem[0000000031800050]
	ldsh	[%i3+0x012],%l7		! Mem[0000000031800012]
	retl
	ldsh	[%i1+0x010],%l0		! Mem[0000000030800010]
p2_jmpl_0_le:
	ldsh	[%i2+0x13e],%l4		! Mem[000000001900013e]
	lduh	[%i0+0x06c],%l3		! Mem[000000001800006c]
	std	%l4,[%i0+0x1b8]		! Mem[00000000180001b8]
	prefetch [%i2+0x180],0
	sllx	%l3,%l1,%l6
	xnor	%l6,-0xb5d,%l1
	jmpl	%g6+8,%g0
	sub	%l2,%l1,%l0
p2_call_0_le:
	taddcc	%l4,%l2,%l7
	retl
	prefetch [%i1+0x0c0],2
p2_jmpl_0_lo:
	ldsh	[%o2+0x13e],%l4		! Mem[000000001900013e]
	lduh	[%o0+0x06c],%l3		! Mem[000000001800006c]
	std	%l4,[%o0+0x1b8]		! Mem[00000000180001b8]
	prefetch [%o2+0x180],0
	sllx	%l3,%l1,%l6
	xnor	%l6,-0xb5d,%l1
	jmpl	%g6+8,%g0
	sub	%l2,%l1,%l0
p2_call_0_lo:
	taddcc	%l4,%l2,%l7
	retl
	prefetch [%o1+0x0c0],2
p2_jmpl_0_he:
	sll	%l4,%l2,%l5
	prefetch [%i0+0x160],21
	orcc	%l7,%l2,%l6
	or	%l0,%l0,%l5
	subccc	%l2,%l7,%l1
	and	%l4,%l1,%l6
	jmpl	%g6+8,%g0
	prefetch [%i1+0x0a0],21
p2_call_0_he:
	swap	[%o0+0x068],%l1		! Mem[0000000030000068]
	prefetch [%i3+0x0a0],21
	retl
	umul	%l4,%l7,%l7
p2_jmpl_0_ho:
	sll	%l4,%l2,%l5
	prefetch [%o0+0x160],21
	orcc	%l7,%l2,%l6
	or	%l0,%l0,%l5
	subccc	%l2,%l7,%l1
	and	%l4,%l1,%l6
	jmpl	%g6+8,%g0
	prefetch [%o1+0x0a0],21
p2_call_0_ho:
	swap	[%i0+0x068],%l1		! Mem[0000000030000068]
	prefetch [%o3+0x0a0],21
	retl
	umul	%l4,%l7,%l7
p3_jmpl_0_le:
	jmpl	%g6+8,%g0
	stx	%l1,[%i3+0x068]		! Mem[000000001d800068]
p3_call_0_le:
	subccc	%l0,0x9ff,%l6
	xor	%l4,%l7,%l0
	swap	[%i0+0x0d8],%l0		! Mem[000000001c0000d8]
	xor	%l2,%l7,%l1
	prefetch [%i0+0x100],21
	retl
	swap	[%i3+0x128],%l5		! Mem[000000001d800128]
p3_jmpl_0_lo:
	jmpl	%g6+8,%g0
	stx	%l1,[%o3+0x068]		! Mem[000000001d800068]
p3_call_0_lo:
	subccc	%l0,0x9ff,%l6
	xor	%l4,%l7,%l0
	swap	[%o0+0x0d8],%l0		! Mem[000000001c0000d8]
	xor	%l2,%l7,%l1
	prefetch [%o0+0x100],21
	retl
	swap	[%o3+0x128],%l5		! Mem[000000001d800128]
p3_jmpl_0_he:
	udivx	%l1,0x5db,%l4
	prefetch [%i1+0x0e0],4
	umulcc	%l5,%l2,%l0
	xnorcc	%l4,0xcbe,%l0
	smulcc	%l5,-0xb71,%l2
	addcc	%l2,%l7,%l5
	jmpl	%g6+8,%g0
	addc	%l4,%l0,%l0
p3_call_0_he:
	nop
	udiv	%l3,-0x905,%l3
	retl
	srl	%l2,%l1,%l6
p3_jmpl_0_ho:
	udivx	%l1,0x5db,%l4
	prefetch [%o1+0x0e0],4
	umulcc	%l5,%l2,%l0
	xnorcc	%l4,0xcbe,%l0
	smulcc	%l5,-0xb71,%l2
	addcc	%l2,%l7,%l5
	jmpl	%g6+8,%g0
	addc	%l4,%l0,%l0
p3_call_0_ho:
	nop
	udiv	%l3,-0x905,%l3
	retl
	srl	%l2,%l1,%l6
user_jump0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	sub	%l3,-0x49e,%l2
	prefetch [%i2+0x0c0],4
	taddcc	%l5,-0xc14,%l5
	jmpl	%g6+8,%g0
	ldstub	[%i1+0x0bd],%l0		! Mem[00000000108000bd]
p0_call_1_le:
	ldstub	[%i3+0x0cd],%l6		! Mem[00000000118000cd]
	sdivcc	%l7,0xf73,%l1
	prefetch [%i1+0x080],20
	andn	%l2,%l2,%l6
	std	%l4,[%i1+0x040]		! Mem[0000000010800040]
	prefetch [%i2+0x040],3
	retl
	tsubcc	%l2,%l0,%l0
p0_jmpl_1_lo:
	sub	%l3,-0x49e,%l2
	prefetch [%o2+0x0c0],4
	taddcc	%l5,-0xc14,%l5
	jmpl	%g6+8,%g0
	ldstub	[%o1+0x0bd],%l0		! Mem[00000000108000bd]
p0_call_1_lo:
	ldstub	[%o3+0x0cd],%l6		! Mem[00000000118000cd]
	sdivcc	%l7,0xf73,%l1
	prefetch [%o1+0x080],20
	andn	%l2,%l2,%l6
	std	%l4,[%o1+0x040]		! Mem[0000000010800040]
	prefetch [%o2+0x040],3
	retl
	tsubcc	%l2,%l0,%l0
p0_jmpl_1_he:
	umul	%l7,0x9e4,%l3
	srlx	%l4,0x020,%l4
	subc	%l1,%l2,%l4
	stb	%l2,[%i2+0x07d]		! Mem[000000001100007d]
	lduw	[%o3+0x004],%l7		! Mem[0000000031800004]
	prefetch [%i4+0x020],21
	jmpl	%g6+8,%g0
	stb	%l4,[%i3+0x005]		! Mem[0000000011800005]
p0_call_1_he:
	smul	%l1,%l2,%l6
	ldsh	[%i1+0x0aa],%l3		! Mem[00000000108000aa]
	prefetch [%i6+0x060],1
	xnorcc	%l6,%l2,%l0
	sll	%l4,0x014,%l2
	retl
	prefetch [%i0+0x040],20
p0_jmpl_1_ho:
	umul	%l7,0x9e4,%l3
	srlx	%l4,0x020,%l4
	subc	%l1,%l2,%l4
	stb	%l2,[%o2+0x07d]		! Mem[000000001100007d]
	lduw	[%i3+0x004],%l7		! Mem[0000000031800004]
	prefetch [%o4+0x020],21
	jmpl	%g6+8,%g0
	stb	%l4,[%o3+0x005]		! Mem[0000000011800005]
p0_call_1_ho:
	smul	%l1,%l2,%l6
	ldsh	[%o1+0x0aa],%l3		! Mem[00000000108000aa]
	prefetch [%o6+0x060],1
	xnorcc	%l6,%l2,%l0
	sll	%l4,0x014,%l2
	retl
	prefetch [%o0+0x040],20
p1_jmpl_1_le:
	stx	%l5,[%i1+0x168]		! Mem[0000000014800168]
	swap	[%i3+0x040],%l3		! Mem[0000000015800040]
	srlx	%l2,0x02c,%l0
	tsubcc	%l1,0x18e,%l3
	udivcc	%l2,0x72e,%l2
	jmpl	%g6+8,%g0
	swap	[%i1+0x094],%l5		! Mem[0000000014800094]
p1_call_1_le:
	retl
	srax	%l0,0x011,%l2
p1_jmpl_1_lo:
	stx	%l5,[%o1+0x168]		! Mem[0000000014800168]
	swap	[%o3+0x040],%l3		! Mem[0000000015800040]
	srlx	%l2,0x02c,%l0
	tsubcc	%l1,0x18e,%l3
	udivcc	%l2,0x72e,%l2
	jmpl	%g6+8,%g0
	swap	[%o1+0x094],%l5		! Mem[0000000014800094]
p1_call_1_lo:
	retl
	srax	%l0,0x011,%l2
p1_jmpl_1_he:
	srax	%l1,%l4,%l3
	prefetch [%i0+0x040],0
	jmpl	%g6+8,%g0
	prefetch [%i0+0x1a0],23
p1_call_1_he:
	umulcc	%l5,%l4,%l5
	retl
	sdivx	%l6,-0x4e9,%l7
p1_jmpl_1_ho:
	srax	%l1,%l4,%l3
	prefetch [%o0+0x040],0
	jmpl	%g6+8,%g0
	prefetch [%o0+0x1a0],23
p1_call_1_ho:
	umulcc	%l5,%l4,%l5
	retl
	sdivx	%l6,-0x4e9,%l7
p2_jmpl_1_le:
	sra	%l1,0x00a,%l5
	ldub	[%i1+0x14c],%l6		! Mem[000000001880014c]
	sllx	%l0,0x019,%l2
	prefetch [%i1+0x060],2
	sub	%l6,%l6,%l5
	andncc	%l3,%l7,%l2
	jmpl	%g6+8,%g0
	prefetch [%i3+0x120],0
p2_call_1_le:
	sdivcc	%l5,-0x366,%l2
	prefetch [%i2+0x140],3
	ldsw	[%o0+0x024],%l7		! Mem[0000000030000024]
	xnor	%l5,%l1,%l3
	retl
	prefetch [%i0+0x0c0],1
p2_jmpl_1_lo:
	sra	%l1,0x00a,%l5
	ldub	[%o1+0x14c],%l6		! Mem[000000001880014c]
	sllx	%l0,0x019,%l2
	prefetch [%o1+0x060],2
	sub	%l6,%l6,%l5
	andncc	%l3,%l7,%l2
	jmpl	%g6+8,%g0
	prefetch [%o3+0x120],0
p2_call_1_lo:
	sdivcc	%l5,-0x366,%l2
	prefetch [%o2+0x140],3
	ldsw	[%i0+0x024],%l7		! Mem[0000000030000024]
	xnor	%l5,%l1,%l3
	retl
	prefetch [%o0+0x0c0],1
p2_jmpl_1_he:
	lduw	[%i0+0x0c4],%l7		! Mem[00000000180000c4]
	prefetch [%i0+0x1c0],1
	smul	%l6,%l7,%l1
	sth	%l6,[%o0+0x06a]		! Mem[000000003000006a]
	jmpl	%g6+8,%g0
	stw	%l1,[%i0+0x1c4]		! Mem[00000000180001c4]
p2_call_1_he:
	sth	%l5,[%i1+0x18e]		! Mem[000000001880018e]
	lduh	[%o2+0x06e],%l0		! Mem[000000003100006e]
	xnorcc	%l7,%l3,%l5
	andncc	%l1,-0xbb0,%l2
	retl
	swap	[%i2+0x10c],%l6		! Mem[000000001900010c]
p2_jmpl_1_ho:
	lduw	[%o0+0x0c4],%l7		! Mem[00000000180000c4]
	prefetch [%o0+0x1c0],1
	smul	%l6,%l7,%l1
	sth	%l6,[%i0+0x06a]		! Mem[000000003000006a]
	jmpl	%g6+8,%g0
	stw	%l1,[%o0+0x1c4]		! Mem[00000000180001c4]
p2_call_1_ho:
	sth	%l5,[%o1+0x18e]		! Mem[000000001880018e]
	lduh	[%i2+0x06e],%l0		! Mem[000000003100006e]
	xnorcc	%l7,%l3,%l5
	andncc	%l1,-0xbb0,%l2
	retl
	swap	[%o2+0x10c],%l6		! Mem[000000001900010c]
p3_jmpl_1_le:
	lduw	[%i2+0x124],%l0		! Mem[000000001d000124]
	taddcc	%l7,-0x6be,%l5
	srlx	%l7,0x032,%l1
	jmpl	%g6+8,%g0
	ldsh	[%i1+0x0fa],%l5		! Mem[000000001c8000fa]
p3_call_1_le:
	and	%l4,0xf49,%l6
	sll	%l7,0x00a,%l7
	srlx	%l4,0x025,%l5
	prefetch [%i0+0x060],2
	ldd	[%i3+0x160],%l6		! Mem[000000001d800160]
	retl
	swap	[%i2+0x110],%l1		! Mem[000000001d000110]
p3_jmpl_1_lo:
	lduw	[%o2+0x124],%l0		! Mem[000000001d000124]
	taddcc	%l7,-0x6be,%l5
	srlx	%l7,0x032,%l1
	jmpl	%g6+8,%g0
	ldsh	[%o1+0x0fa],%l5		! Mem[000000001c8000fa]
p3_call_1_lo:
	and	%l4,0xf49,%l6
	sll	%l7,0x00a,%l7
	srlx	%l4,0x025,%l5
	prefetch [%o0+0x060],2
	ldd	[%o3+0x160],%l6		! Mem[000000001d800160]
	retl
	swap	[%o2+0x110],%l1		! Mem[000000001d000110]
p3_jmpl_1_he:
	orncc	%l4,%l5,%l5
	taddcc	%l6,%l1,%l3
	lduh	[%i2+0x1e4],%l5		! Mem[000000001d0001e4]
	jmpl	%g6+8,%g0
	orcc	%l1,%l0,%l3
p3_call_1_he:
	xorcc	%l7,-0xa14,%l5
	sub	%l7,%l2,%l6
	prefetch [%i1+0x100],20
	andcc	%l0,-0x0a0,%l0
	retl
	or	%l2,-0x719,%l4
p3_jmpl_1_ho:
	orncc	%l4,%l5,%l5
	taddcc	%l6,%l1,%l3
	lduh	[%o2+0x1e4],%l5		! Mem[000000001d0001e4]
	jmpl	%g6+8,%g0
	orcc	%l1,%l0,%l3
p3_call_1_ho:
	xorcc	%l7,-0xa14,%l5
	sub	%l7,%l2,%l6
	prefetch [%o1+0x100],20
	andcc	%l0,-0x0a0,%l0
	retl
	or	%l2,-0x719,%l4
user_jump1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	smulcc	%l2,%l3,%l2
	jmpl	%g6+8,%g0
	sra	%l1,%l4,%l5
p0_call_2_le:
	umul	%l5,%l4,%l4
	sdiv	%l7,0x341,%l7
	lduw	[%i1+0x0e0],%l7		! Mem[00000000108000e0]
	prefetch [%i3+0x000],20
	udivcc	%l4,0x2a6,%l2
	retl
	ldx	[%o1+0x008],%l3		! Mem[0000000030800008]
p0_jmpl_2_lo:
	smulcc	%l2,%l3,%l2
	jmpl	%g6+8,%g0
	sra	%l1,%l4,%l5
p0_call_2_lo:
	umul	%l5,%l4,%l4
	sdiv	%l7,0x341,%l7
	lduw	[%o1+0x0e0],%l7		! Mem[00000000108000e0]
	prefetch [%o3+0x000],20
	udivcc	%l4,0x2a6,%l2
	retl
	ldx	[%i1+0x008],%l3		! Mem[0000000030800008]
p0_jmpl_2_he:
	mulx	%l2,0xbf8,%l2
	jmpl	%g6+8,%g0
	sdiv	%l5,-0x8b1,%l3
p0_call_2_he:
	sdivx	%l3,0x7ff,%l4
	srlx	%l6,0x018,%l0
	subc	%l1,-0xf15,%l7
	umulcc	%l1,0xee0,%l3
	add	%l7,0xa1f,%l3
	mulx	%l2,0xd93,%l0
	retl
	and	%l5,0x1a4,%l1
p0_jmpl_2_ho:
	mulx	%l2,0xbf8,%l2
	jmpl	%g6+8,%g0
	sdiv	%l5,-0x8b1,%l3
p0_call_2_ho:
	sdivx	%l3,0x7ff,%l4
	srlx	%l6,0x018,%l0
	subc	%l1,-0xf15,%l7
	umulcc	%l1,0xee0,%l3
	add	%l7,0xa1f,%l3
	mulx	%l2,0xd93,%l0
	retl
	and	%l5,0x1a4,%l1
p1_jmpl_2_le:
	stb	%l4,[%o2+0x05c]		! Mem[000000003100005c]
	prefetch [%i2+0x1e0],2
	srlx	%l4,%l6,%l3
	jmpl	%g6+8,%g0
	addc	%l5,%l0,%l0
p1_call_2_le:
	srax	%l1,0x016,%l6
	nop
	prefetch [%i3+0x060],22
	retl
	andcc	%l1,%l5,%l0
p1_jmpl_2_lo:
	stb	%l4,[%i2+0x05c]		! Mem[000000003100005c]
	prefetch [%o2+0x1e0],2
	srlx	%l4,%l6,%l3
	jmpl	%g6+8,%g0
	addc	%l5,%l0,%l0
p1_call_2_lo:
	srax	%l1,0x016,%l6
	nop
	prefetch [%o3+0x060],22
	retl
	andcc	%l1,%l5,%l0
p1_jmpl_2_he:
	ldsw	[%i3+0x138],%l2		! Mem[0000000015800138]
	prefetch [%i1+0x1a0],22
	jmpl	%g6+8,%g0
	or	%l7,0x40e,%l4
p1_call_2_he:
	prefetch [%i3+0x0a0],2
	sll	%l7,0x016,%l4
	prefetch [%i3+0x1e0],16
	retl
	stx	%l4,[%o0+0x018]		! Mem[0000000030000018]
p1_jmpl_2_ho:
	ldsw	[%o3+0x138],%l2		! Mem[0000000015800138]
	prefetch [%o1+0x1a0],22
	jmpl	%g6+8,%g0
	or	%l7,0x40e,%l4
p1_call_2_ho:
	prefetch [%o3+0x0a0],2
	sll	%l7,0x016,%l4
	prefetch [%o3+0x1e0],16
	retl
	stx	%l4,[%i0+0x018]		! Mem[0000000030000018]
p2_jmpl_2_le:
	stb	%l2,[%i2+0x010]		! Mem[0000000019000010]
	umul	%l7,%l4,%l2
	subccc	%l2,%l1,%l6
	sdivcc	%l4,-0x163,%l1
	prefetch [%i3+0x1a0],16
	jmpl	%g6+8,%g0
	sdiv	%l0,-0x8ad,%l3
p2_call_2_le:
	mulx	%l4,%l0,%l2
	sdivcc	%l3,-0x003,%l5
	prefetch [%i3+0x080],20
	retl
	prefetch [%i2+0x180],0
p2_jmpl_2_lo:
	stb	%l2,[%o2+0x010]		! Mem[0000000019000010]
	umul	%l7,%l4,%l2
	subccc	%l2,%l1,%l6
	sdivcc	%l4,-0x163,%l1
	prefetch [%o3+0x1a0],16
	jmpl	%g6+8,%g0
	sdiv	%l0,-0x8ad,%l3
p2_call_2_lo:
	mulx	%l4,%l0,%l2
	sdivcc	%l3,-0x003,%l5
	prefetch [%o3+0x080],20
	retl
	prefetch [%o2+0x180],0
p2_jmpl_2_he:
	ldub	[%i1+0x016],%l6		! Mem[0000000018800016]
	orn	%l2,%l1,%l6
	jmpl	%g6+8,%g0
	ldub	[%i2+0x064],%l5		! Mem[0000000019000064]
p2_call_2_he:
	ldub	[%i5+0x04b],%l1		! Mem[000000001a80004b]
	mulx	%l7,0x375,%l0
	ldub	[%o2+0x020],%l2		! Mem[0000000031000020]
	prefetch [%i0+0x1a0],4
	retl
	sllx	%l1,0x030,%l6
p2_jmpl_2_ho:
	ldub	[%o1+0x016],%l6		! Mem[0000000018800016]
	orn	%l2,%l1,%l6
	jmpl	%g6+8,%g0
	ldub	[%o2+0x064],%l5		! Mem[0000000019000064]
p2_call_2_ho:
	ldub	[%o5+0x04b],%l1		! Mem[000000001a80004b]
	mulx	%l7,0x375,%l0
	ldub	[%i2+0x020],%l2		! Mem[0000000031000020]
	prefetch [%o0+0x1a0],4
	retl
	sllx	%l1,0x030,%l6
p3_jmpl_2_le:
	mulx	%l1,%l3,%l0
	jmpl	%g6+8,%g0
	xnor	%l4,-0xa37,%l0
p3_call_2_le:
	retl
	std	%l0,[%o2+0x078]		! Mem[0000000031000078]
p3_jmpl_2_lo:
	mulx	%l1,%l3,%l0
	jmpl	%g6+8,%g0
	xnor	%l4,-0xa37,%l0
p3_call_2_lo:
	retl
	std	%l0,[%i2+0x078]		! Mem[0000000031000078]
p3_jmpl_2_he:
	udivx	%l1,0x971,%l4
	sllx	%l7,%l3,%l6
	prefetch [%i2+0x000],20
	udiv	%l3,0x8d1,%l3
	srlx	%l7,%l6,%l4
	jmpl	%g6+8,%g0
	stx	%l5,[%o1+0x070]		! Mem[0000000030800070]
p3_call_2_he:
	andncc	%l5,-0xb55,%l3
	add	%l4,%l1,%l5
	orcc	%l4,-0x5cc,%l0
	subccc	%l7,0x25e,%l0
	prefetch [%i1+0x1e0],2
	retl
	sll	%l7,0x011,%l0
p3_jmpl_2_ho:
	udivx	%l1,0x971,%l4
	sllx	%l7,%l3,%l6
	prefetch [%o2+0x000],20
	udiv	%l3,0x8d1,%l3
	srlx	%l7,%l6,%l4
	jmpl	%g6+8,%g0
	stx	%l5,[%i1+0x070]		! Mem[0000000030800070]
p3_call_2_ho:
	andncc	%l5,-0xb55,%l3
	add	%l4,%l1,%l5
	orcc	%l4,-0x5cc,%l0
	subccc	%l7,0x25e,%l0
	prefetch [%o1+0x1e0],2
	retl
	sll	%l7,0x011,%l0
user_jump2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	nop
	andn	%l0,-0xc12,%l5
	jmpl	%g6+8,%g0
	or	%l3,-0x95a,%l7
p0_call_3_le:
	sdiv	%l2,-0xe9a,%l3
	andn	%l3,0xac7,%l3
	ldstub	[%o5+0x011],%l4		! Mem[0000000040000011]
	ldd	[%o0+0x000],%l2		! Mem[0000000030000000]
	subccc	%l0,%l6,%l0
	prefetch [%i2+0x000],16
	retl
	or	%l6,-0x098,%l2
p0_jmpl_3_lo:
	nop
	andn	%l0,-0xc12,%l5
	jmpl	%g6+8,%g0
	or	%l3,-0x95a,%l7
p0_call_3_lo:
	sdiv	%l2,-0xe9a,%l3
	andn	%l3,0xac7,%l3
	ldstub	[%i5+0x011],%l4		! Mem[0000000040000011]
	ldd	[%i0+0x000],%l2		! Mem[0000000030000000]
	subccc	%l0,%l6,%l0
	prefetch [%o2+0x000],16
	retl
	or	%l6,-0x098,%l2
p0_jmpl_3_he:
	ldx	[%o0+0x000],%l7		! Mem[0000000030000000]
	sra	%l7,%l3,%l4
	prefetch [%i1+0x000],4
	jmpl	%g6+8,%g0
	sdiv	%l7,-0xe8f,%l2
p0_call_3_he:
	umul	%l3,-0x5f3,%l5
	andn	%l1,%l7,%l4
	sllx	%l2,0x03f,%l4
	mulx	%l6,0xe4c,%l4
	andncc	%l7,%l5,%l2
	nop
	retl
	srax	%l0,%l1,%l7
p0_jmpl_3_ho:
	ldx	[%i0+0x000],%l7		! Mem[0000000030000000]
	sra	%l7,%l3,%l4
	prefetch [%o1+0x000],4
	jmpl	%g6+8,%g0
	sdiv	%l7,-0xe8f,%l2
p0_call_3_ho:
	umul	%l3,-0x5f3,%l5
	andn	%l1,%l7,%l4
	sllx	%l2,0x03f,%l4
	mulx	%l6,0xe4c,%l4
	andncc	%l7,%l5,%l2
	nop
	retl
	srax	%l0,%l1,%l7
p1_jmpl_3_le:
	ldx	[%i3+0x0c8],%l6		! Mem[00000000158000c8]
	ldx	[%i3+0x100],%l4		! Mem[0000000015800100]
	addc	%l0,%l0,%l0
	jmpl	%g6+8,%g0
	prefetch [%i5+0x000],4
p1_call_3_le:
	udiv	%l3,0x6c0,%l5
	mulx	%l6,%l7,%l7
	ldsh	[%o3+0x058],%l7		! Mem[0000000031800058]
	prefetch [%i3+0x0a0],23
	retl
	smul	%l5,%l0,%l2
p1_jmpl_3_lo:
	ldx	[%o3+0x0c8],%l6		! Mem[00000000158000c8]
	ldx	[%o3+0x100],%l4		! Mem[0000000015800100]
	addc	%l0,%l0,%l0
	jmpl	%g6+8,%g0
	prefetch [%o5+0x000],4
p1_call_3_lo:
	udiv	%l3,0x6c0,%l5
	mulx	%l6,%l7,%l7
	ldsh	[%i3+0x058],%l7		! Mem[0000000031800058]
	prefetch [%o3+0x0a0],23
	retl
	smul	%l5,%l0,%l2
p1_jmpl_3_he:
	jmpl	%g6+8,%g0
	sth	%l0,[%o0+0x056]		! Mem[0000000030000056]
p1_call_3_he:
	prefetch [%i0+0x1e0],16
	sll	%l5,%l7,%l1
	add	%l0,0x890,%l3
	ldub	[%o3+0x053],%l7		! Mem[0000000031800053]
	sllx	%l6,%l4,%l6
	stx	%l6,[%o3+0x058]		! Mem[0000000031800058]
	retl
	ldsb	[%i6+0x10d],%l7		! Mem[000000001700010d]
p1_jmpl_3_ho:
	jmpl	%g6+8,%g0
	sth	%l0,[%i0+0x056]		! Mem[0000000030000056]
p1_call_3_ho:
	prefetch [%o0+0x1e0],16
	sll	%l5,%l7,%l1
	add	%l0,0x890,%l3
	ldub	[%i3+0x053],%l7		! Mem[0000000031800053]
	sllx	%l6,%l4,%l6
	stx	%l6,[%i3+0x058]		! Mem[0000000031800058]
	retl
	ldsb	[%o6+0x10d],%l7		! Mem[000000001700010d]
p2_jmpl_3_le:
	prefetch [%i1+0x060],1
	andn	%l4,%l2,%l4
	ldx	[%i0+0x150],%l2		! Mem[0000000018000150]
	std	%l2,[%i2+0x078]		! Mem[0000000019000078]
	udiv	%l6,-0xd9f,%l1
	jmpl	%g6+8,%g0
	stw	%l3,[%i3+0x170]		! Mem[0000000019800170]
p2_call_3_le:
	ldsw	[%o2+0x060],%l0		! Mem[0000000031000060]
	prefetch [%i0+0x180],21
	retl
	mulx	%l6,%l0,%l7
p2_jmpl_3_lo:
	prefetch [%o1+0x060],1
	andn	%l4,%l2,%l4
	ldx	[%o0+0x150],%l2		! Mem[0000000018000150]
	std	%l2,[%o2+0x078]		! Mem[0000000019000078]
	udiv	%l6,-0xd9f,%l1
	jmpl	%g6+8,%g0
	stw	%l3,[%o3+0x170]		! Mem[0000000019800170]
p2_call_3_lo:
	ldsw	[%i2+0x060],%l0		! Mem[0000000031000060]
	prefetch [%o0+0x180],21
	retl
	mulx	%l6,%l0,%l7
p2_jmpl_3_he:
	ldub	[%o1+0x061],%l5		! Mem[0000000030800061]
	andn	%l5,%l0,%l1
	jmpl	%g6+8,%g0
	ldub	[%i3+0x1fa],%l2		! Mem[00000000198001fa]
p2_call_3_he:
	prefetch [%i2+0x080],22
	andncc	%l6,-0xfd7,%l5
	addccc	%l4,-0x104,%l1
	subccc	%l4,%l5,%l5
	xnor	%l0,%l6,%l2
	retl
	udivx	%l3,-0xbea,%l5
p2_jmpl_3_ho:
	ldub	[%i1+0x061],%l5		! Mem[0000000030800061]
	andn	%l5,%l0,%l1
	jmpl	%g6+8,%g0
	ldub	[%o3+0x1fa],%l2		! Mem[00000000198001fa]
p2_call_3_ho:
	prefetch [%o2+0x080],22
	andncc	%l6,-0xfd7,%l5
	addccc	%l4,-0x104,%l1
	subccc	%l4,%l5,%l5
	xnor	%l0,%l6,%l2
	retl
	udivx	%l3,-0xbea,%l5
p3_jmpl_3_le:
	srlx	%l5,%l6,%l1
	prefetch [%i2+0x120],0
	addccc	%l5,%l6,%l0
	ldd	[%i2+0x198],%l4		! Mem[000000001d000198]
	jmpl	%g6+8,%g0
	prefetch [%i2+0x1c0],22
p3_call_3_le:
	prefetch [%i1+0x020],22
	taddcc	%l0,%l5,%l3
	srl	%l2,0x01b,%l7
	mulx	%l5,%l3,%l1
	lduw	[%i2+0x040],%l7		! Mem[000000001d000040]
	retl
	umulcc	%l2,%l3,%l5
p3_jmpl_3_lo:
	srlx	%l5,%l6,%l1
	prefetch [%o2+0x120],0
	addccc	%l5,%l6,%l0
	ldd	[%o2+0x198],%l4		! Mem[000000001d000198]
	jmpl	%g6+8,%g0
	prefetch [%o2+0x1c0],22
p3_call_3_lo:
	prefetch [%o1+0x020],22
	taddcc	%l0,%l5,%l3
	srl	%l2,0x01b,%l7
	mulx	%l5,%l3,%l1
	lduw	[%o2+0x040],%l7		! Mem[000000001d000040]
	retl
	umulcc	%l2,%l3,%l5
p3_jmpl_3_he:
	srl	%l6,0x01c,%l1
	sdiv	%l5,0xe7e,%l5
	srlx	%l6,%l5,%l4
	and	%l0,%l6,%l5
	prefetch [%i0+0x0c0],22
	jmpl	%g6+8,%g0
	or	%l7,%l7,%l5
p3_call_3_he:
	or	%l0,%l6,%l2
	stx	%l2,[%i0+0x008]		! Mem[000000001c000008]
	srax	%l2,%l3,%l2
	orncc	%l2,0x1cb,%l2
	prefetch [%i1+0x120],23
	retl
	prefetch [%i1+0x160],20
p3_jmpl_3_ho:
	srl	%l6,0x01c,%l1
	sdiv	%l5,0xe7e,%l5
	srlx	%l6,%l5,%l4
	and	%l0,%l6,%l5
	prefetch [%o0+0x0c0],22
	jmpl	%g6+8,%g0
	or	%l7,%l7,%l5
p3_call_3_ho:
	or	%l0,%l6,%l2
	stx	%l2,[%o0+0x008]		! Mem[000000001c000008]
	srax	%l2,%l3,%l2
	orncc	%l2,0x1cb,%l2
	prefetch [%o1+0x120],23
	retl
	prefetch [%o1+0x160],20
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
	.word	0xc1320d00,0x6ad52b8b		! Init value for %l0
	.word	0xc7d1e1ff,0x83d88441		! Init value for %l1
	.word	0x63c1c9ff,0x8ca2e2bf		! Init value for %l2
	.word	0x401631ff,0xbfeacffb		! Init value for %l3
	.word	0x2b712eff,0x931a429f		! Init value for %l4
	.word	0x9930ef00,0x23dc346a		! Init value for %l5
	.word	0xdccb6800,0x7123add8		! Init value for %l6
	.word	0x72e58100,0x4ccb23a4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xf651b70b,0xa76d0a3e		! Init value for %f0 
	.word	0x5f328acd,0x9c5137bf		! Init value for %f2 
	.word	0xdd3b182e,0xd9e82ca8		! Init value for %f4 
	.word	0x197005cc,0xa7181c95		! Init value for %f6 
	.word	0xf5091d52,0xccd89658		! Init value for %f8 
	.word	0xef7de6a8,0xc9870a8a		! Init value for %f10
	.word	0xe1cbdd8c,0xa6ce9a26		! Init value for %f12
	.word	0xbe372278,0x3bdf2374		! Init value for %f14
	.word	0x3c5dc8a9,0x889d016e		! Init value for %f16
	.word	0xf2875363,0xc8c8d9e4		! Init value for %f18
	.word	0x446fe5ef,0xbfa7fb0b		! Init value for %f20
	.word	0x9784da5b,0xcd30801a		! Init value for %f22
	.word	0xe3a28039,0x01385d18		! Init value for %f24
	.word	0x7fb3683c,0x434e483d		! Init value for %f26
	.word	0x5d2d33ed,0xf64757a2		! Init value for %f28
	.word	0x1344fe8b,0x47596348		! Init value for %f30
	.word	0x81c60469,0xc2a831ab		! Init value for %f32
	.word	0x20cfec03,0x1dd9827e		! Init value for %f34
	.word	0x86f1563b,0xa0b61d0d		! Init value for %f36
	.word	0x4a6978ca,0x0b50c144		! Init value for %f38
	.word	0x73bb85ba,0x6a4f4a85		! Init value for %f40
	.word	0x5602353f,0x7d9071fe		! Init value for %f42
	.word	0x5cf9d006,0xdb995711		! Init value for %f44
	.word	0x871f7197,0xe12ded86		! Init value for %f46
	.word	0x593815af,0xfff458ae
	.word	0x3b0c77a1,0x47ec5d25
	.word	0xfa41ab16,0x3de39594
	.word	0xcd41e11a,0x2614b5a3
	.word	0xa3e4cc15,0x54e5846a
	.word	0xc2b48bcb,0x877d9081
	.word	0xb7f9eaa9,0x8b9bfcc3
	.word	0x4747ed4c,0xa3c1b7e1
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
	.word	0x00000000,0xbc73d209
	.word	0x00000000,0xbc73dc00
	.word	0x1ff0c9f2,0x24784d1e
	.word	0x00000000,0x00000057
	.word	0x00000000,0x8f5fba0d
	.word	0x00000000,0x000000dc
	.word	0x00000000,0x00001b04
	.word	0x00000000,0x00005849
p0_expected_fp_regs:
	.word	0x4cd89658,0x00000000
	.word	0x00000000,0x80000000
	.word	0x80000000,0x00000000
	.word	0x419b12cb,0x00000000
	.word	0x00000000,0xd2000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x80000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x419b12cb,0x00000000
	.word	0x00000000,0x00000000
	.word	0x81c60469,0xc2a831ab
	.word	0x20cfec03,0x1dd9827e
	.word	0x86f1563b,0xa0b61d0d
	.word	0x4a6978ca,0x0b50c144
	.word	0x73bb85ba,0x6a4f4a85
	.word	0x5602353f,0x7d9071fe
	.word	0x5cf9d006,0xdb995711
	.word	0x871f7197,0xe12ded86
p0_local0_expect:
	.word	0xfffff72f,0x1b040b3e
	.word	0x42078fbf,0xfffff72f
	.word	0xcc2d57e2,0xe53918ec
	.word	0xbffddce5,0xb58856de
	.word	0x0000ff00,0xd264d1c7
	.word	0x850c6a4a,0x390a0b72
	.word	0x1ab7a2d6,0xf12ba566
	.word	0xc314abb1,0xb7d9b57c
	.word	0xd75a1ffe,0xaa1557f6
	.word	0x6399850b,0xacea7c83
	.word	0x96d83e6c,0x8d13d7f8
	.word	0xb77d7492,0xebaf2c59
	.word	0x1c25b2c1,0x6ef7b265
	.word	0xaf4b8336,0x24eb2dd5
	.word	0x2c039311,0xff75deef
	.word	0x1478e280,0x74f325d7
	.word	0x399290d1,0x7d05e794
	.word	0x93873cd6,0x6c83c24b
	.word	0x55e0e586,0x46199413
	.word	0x8bcbd8a0,0xc7894338
	.word	0xdbade58d,0xce0f9fac
	.word	0x62f42d55,0x109941d0
	.word	0xf53a7c5c,0x34bc85c9
	.word	0x9deb454b,0xbc96d39b
	.word	0xf0b2218d,0x2012a15a
	.word	0xffffffff,0xffffffeb
	.word	0x4204f1a8,0x7ec0a8e4
	.word	0xe7043085,0xd4b28daa
	.word	0x3240adda,0x491015b6
	.word	0x000000ff,0x000000dc
	.word	0x9c52de65,0xb6faf6b2
	.word	0x01821b1e,0x1536b00e
p0_local1_expect:
	.word	0x7c830000,0x0000e394
	.word	0xff008200,0xacea7c83
	.word	0x3cb02dae,0x98f569be
	.word	0x86ff1391,0x15252d26
	.word	0x249b7140,0x003e29da
	.word	0x9395d3a2,0xfeffca4d
	.word	0xa14ae14e,0x7a9b6af8
	.word	0x245303ad,0x5d1d9e98
	.word	0xfc03a46e,0x90316c6d
	.word	0x00000070,0xf48baf51
	.word	0x1ff0c9f2,0x24784d1e
	.word	0x6c441ef8,0x4b623b8e
	.word	0x56d2af53,0x497e7551
	.word	0x00000034,0x00000f14
	.word	0x8ca2e2bf,0x040d01b2
	.word	0xbd93a729,0xa9f48915
	.word	0x87557d52,0xed53e833
	.word	0x33658700,0xec0215ba
	.word	0x0000000c,0xfc770029
	.word	0xc71d6ebd,0x44480704
	.word	0x7eed7fab,0xa0342f53
	.word	0x996e77f4,0x59e64d88
	.word	0x67fe395f,0x0000ffff
	.word	0x6cef4dc4,0x8f5fba0d
	.word	0x4c8014d4,0x28bd7fa6
	.word	0x00193300,0x0000e394
	.word	0x54d2b41a,0xb532cb84
	.word	0x13e5da9e,0x0dba7cf5
	.word	0xb58856de,0x5317c06c
	.word	0x00000000,0x013240f5
	.word	0xe4eadb14,0x96d86923
	.word	0xe73a5353,0xd20935c9
p0_local2_expect:
	.word	0x9031753e,0x9e88f71b
	.word	0xbc73dc00,0x746df82e
	.word	0x9573563e,0x000000ff
	.word	0xae40ce1a,0x9c5e2fc6
	.word	0x5650596e,0xe8a2730a
	.word	0x65c22726,0x62d429fc
	.word	0x622c64ef,0x010e1da6
	.word	0x63c1c9ff,0x8ca2e2bf
	.word	0x08707580,0xc508e818
	.word	0xf4279228,0x36fd4d7c
	.word	0x98753658,0x5fdfc083
	.word	0x25d61c21,0x00000000
	.word	0x952b53fb,0xa0342f53
	.word	0x47520cc4,0xc548de95
	.word	0xdc6c010e,0x17cdf5b6
	.word	0xee02900b,0x8e092aa1
	.word	0x0000c849,0x2ddabb51
	.word	0x53a9057f,0x9da8bf35
	.word	0x81789bd7,0x2881e889
	.word	0x6212d221,0x6c189012
	.word	0x10cf17ea,0x59bd5dfd
	.word	0xfb044f74,0x84150ae1
	.word	0x47ff7acd,0x893092c1
	.word	0xd2674637,0xff80d864
	.word	0xb188fd9b,0x4f18568c
	.word	0x2df742d9,0x4e6c8671
	.word	0x13aef859,0x6406541e
	.word	0xf922406f,0x41e862d6
	.word	0x242bc1b5,0xc6ce0a87
	.word	0xffdbfe25,0x8ef0da4b
	.word	0xa6898340,0x00000034
	.word	0xb6df414f,0x3ae00000
p0_local3_expect:
	.word	0xff00acea,0x435df72f
	.word	0xffffffff,0xffe28bae
	.word	0x6d701cd2,0x9689c695
	.word	0x00000000,0x9e88f71b
	.word	0xd6f7c37e,0x93385e47
	.word	0x1c16a88b,0x2cc86f16
	.word	0xd54f4eb1,0x06ec1024
	.word	0x69a5a071,0xe9df30fa
	.word	0x616faadb,0x4a07cc6d
	.word	0x98690253,0xa40aa2f9
	.word	0x2ad9ad41,0xb9eb7e0a
	.word	0xcaef197a,0x5a256788
	.word	0xe907faa7,0x9efc715c
	.word	0xa64400c1,0xee677a3f
	.word	0xd122af53,0x4d259a90
	.word	0xffffffff,0xffff8ab0
	.word	0x454734c9,0x42e045b5
	.word	0xffffffff,0xffffffba
	.word	0xf0d6737c,0xa527f367
	.word	0x3eb25c97,0x00000000
	.word	0x043f7e9e,0x8f5fbe4d
	.word	0x00000000,0x00000000
	.word	0xadaa4d94,0xadd4db75
	.word	0xcda06b7b,0x57a9b888
	.word	0x09f726f1,0xfd87ffa4
	.word	0x99641c4b,0x9a063e0b
	.word	0x73a82fbf,0xffba851e
	.word	0x1af8dfc2,0x8fc2f416
	.word	0x3e426c78,0xa491e3c1
	.word	0xf11615ff,0x548bfdc5
	.word	0xaf85a093,0x814a299d
	.word	0x86650338,0xe00ce2f2
p0_local4_expect:
	.word	0x529d55a2,0x8ad88cb7
	.word	0x448d5504,0x6a036015
	.word	0xd1e046b6,0x625ea7da
	.word	0x70347e80,0xa75ff499
	.word	0x7672c4b8,0x6919544d
	.word	0x9ede91fc,0x271f3fbe
	.word	0x7125468d,0xa10a483d
	.word	0x21480381,0x932025cf
	.word	0xbc97cfe7,0x508d8571
	.word	0xa7510d49,0xe15c0cce
	.word	0x10737df9,0x9e9abbd8
	.word	0xed89b219,0xb608ef51
	.word	0x266cbcac,0xdb43fbc3
	.word	0x50d75011,0xa385c798
	.word	0x00000005,0x3dae18cc
	.word	0x8f951e45,0x01318fa3
	.word	0xa7c60559,0x38d487b7
	.word	0x1a4e5dfb,0xe94ca0c2
	.word	0x8432244f,0x1a4c9c0e
	.word	0xd471218c,0xf6d74d1a
	.word	0x9f74123e,0xf48cfd80
	.word	0xe75e22c0,0x5e4fb5ce
	.word	0xee82866e,0x68a1f67d
	.word	0xd52bd605,0x12467c40
	.word	0x4e7412b6,0xad01bca1
	.word	0xe3f334bd,0xd9409a46
	.word	0x440dacbe,0x3d147f15
	.word	0x5b6e0f95,0xbb46d0a2
	.word	0x6493598d,0x74094a03
	.word	0xd5492c3b,0xbe78d30b
	.word	0x3af0bfc3,0x34d11bbd
	.word	0x882ea66a,0xb1792b26
p0_local5_expect:
	.word	0xa88a8474,0x85056ef1
	.word	0x0f91ff4c,0x6af7cf9e
	.word	0xcff1e98d,0x587a3675
	.word	0x663d9d63,0xc700a155
	.word	0x42674eda,0x421acf1e
	.word	0x8ce9b989,0x031ae49f
	.word	0x6eccf332,0xbdd4eaf4
	.word	0x157fb4d9,0xa7adb59c
	.word	0x96c9a503,0xa4e0a320
	.word	0x563bf446,0xbc2bdbd9
	.word	0xd34123b2,0x032e43d5
	.word	0xadf56b26,0xbb7ba545
	.word	0x14fa5be3,0xf28458b6
	.word	0x88b54ced,0x1dffe8cc
	.word	0xc082ad12,0x3d1c3f9c
	.word	0x834bdd48,0xb639911a
	.word	0x13518546,0xdeed741a
	.word	0x9dc075f8,0xc22c1ebf
	.word	0x79d806e2,0xbc575bbf
	.word	0xfcf02d1f,0x6f2b0f29
	.word	0x3302d528,0x3e0b24ce
	.word	0x8103f455,0x86a4ce15
	.word	0xf3967655,0x9501a214
	.word	0x1a5835c9,0x99f31869
	.word	0xcd0c3d48,0xcdffcc3c
	.word	0x5b822477,0x2535658b
	.word	0x3f1511b0,0xba235802
	.word	0xe170d56f,0xcce4a271
	.word	0xc293622b,0x5d7b40cd
	.word	0xa4b472c7,0x83359248
	.word	0x6d04ef73,0x9bdd65ba
	.word	0xdd0f432a,0xbc5ab18d
p0_local6_expect:
	.word	0x36c7caa6,0x94e11ab3
	.word	0x0e143d25,0xf4960ab8
	.word	0x57d0ea28,0x8b0a13a5
	.word	0x66c5ec86,0x264bf190
	.word	0x42367c17,0x62a52b71
	.word	0x8bb99fc0,0x69aef85b
	.word	0x71879b76,0x2aebbaf0
	.word	0xebc40d18,0x59a202d3
	.word	0xb8285b47,0x55c257bc
	.word	0xdd708f24,0xa716c7c2
	.word	0x7515ea0f,0xa0a77c05
	.word	0xe344f8bf,0x35397146
	.word	0x66d3ea72,0x799c7fb4
	.word	0x174a55d1,0xff0b0046
	.word	0xc09bc4c4,0x6f6ec889
	.word	0x53e423b4,0x0c4c029b
	.word	0xc785c3a3,0xf738d6c7
	.word	0x8dfb716c,0x7af447b4
	.word	0xd1d91cf2,0x58de6750
	.word	0x87be5a4e,0xf22de8c7
	.word	0xe078e12d,0x7989c6b3
	.word	0x769fc42b,0xb4d8be67
	.word	0x4fade890,0x675ec68c
	.word	0xd11e37cc,0x8d4ddebf
	.word	0x797597de,0xa36d5fb7
	.word	0x9a4232b0,0xdf522065
	.word	0x10edee25,0xf4ef4f93
	.word	0xa64347ab,0xf012b0b4
	.word	0x680bd5b6,0xd44a5278
	.word	0x4a7a0d61,0x858f9810
	.word	0x6e6b526f,0x84957fd5
	.word	0x42ff1d43,0xcec3092b
share0_expect:
	.word	0xffffe8cc,0x81400980
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000065b5
	.word	0x1f6ed9a9,0x0000109f
	.word	0x00004748,0x00000275
	.word	0xfffff1ab,0xffffffff
	.word	0x7a000e8b,0xfffff24c
	.word	0x0000ffff,0xffffffff
	.word	0x00007c8f,0x0000006b
	.word	0x9558542f,0xacea7c83
	.word	0x000000ff,0xfffff63c
	.word	0x3c000000,0xffffffff
	.word	0xe5c5fb53,0xffd2ff00
	.word	0xffffe295,0xfffffb96
	.word	0xfffff436,0x000014ec
	.word	0xe89193e3,0x00000080
share1_expect:
	.word	0x161a1314,0x1ed0e670
	.word	0x00000000,0x58497fe0
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xfffff5ff
	.word	0x00000000,0xc34bbf85
	.word	0x00000000,0x818eb384
	.word	0xffab000b,0x41a01ad3
	.word	0xe89193e3,0x1281300b
	.word	0x00002638,0x194cca03
	.word	0x0000ff00,0x0000002f
	.word	0xc5a60003,0x9b404b21
	.word	0xc6ecb885,0x000000cb
	.word	0x000005ef,0xffffffbc
	.word	0xbfb674dc,0x818ebc3c
	.word	0x00000000,0x000075ab
	.word	0xffbee63b,0xf0b92fcb
share2_expect:
	.word	0xc849a494,0x0000ff00
	.word	0xff31753e,0xacea7c83
	.word	0xe6ff98ec,0x00c10000
	.word	0x00140854,0xffffffff
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x12c754d3
	.word	0x00000000,0x000000f6
	.word	0xdf800000,0xbe8001bf
	.word	0xd122fecd,0xdce9ffb2
	.word	0x00000000,0x00000000
	.word	0x00005c6c,0xff00007c
	.word	0xab786e72,0x01ccff6b
	.word	0xfae110ef,0x0001ff47
	.word	0x00000000,0x000007d1
	.word	0xffc639f4,0x00d702f8
	.word	0x58d37f13,0x00ab0d66
share3_expect:
	.word	0x8ab36016,0xed7ebd44
	.word	0x00000000,0xffffc71d
	.word	0xc58ed73a,0xb9a15610
	.word	0x00000000,0x00000014
	.word	0x0000818e,0xffffff83
	.word	0x00000233,0xffffff00
	.word	0x0014bdb3,0xe4f26e38
	.word	0xffffd300,0x00000000
	.word	0xafdf8c3d,0xffffdd80
	.word	0x82114a3a,0xffffff92
	.word	0x6c9da207,0xfffffb19
	.word	0x77f3dbeb,0xeaf0adb3
	.word	0x7304127d,0x0dc3ce87
	.word	0x00fffae7,0xff0007c1
	.word	0x2de0ad74,0xa946fb27
	.word	0xff46fb27,0x00000026
share4_expect:
p1_init_registers:
	.word	0x9bc8ee00,0x3b9a12e8		! Init value for %l0
	.word	0x061cbc00,0x51ab6532		! Init value for %l1
	.word	0x3a66ef00,0x6e8c85ae		! Init value for %l2
	.word	0x08a831ff,0xaff10460		! Init value for %l3
	.word	0x5b83b400,0x3e5f6d44		! Init value for %l4
	.word	0x66576b00,0x5df2c2c6		! Init value for %l5
	.word	0x4ec569ff,0xdaf47c79		! Init value for %l6
	.word	0x3b0f9eff,0xcd196892		! Init value for %l7
	.align	64
p1_init_freg:
	.word	0x95cc54db,0x4a96e7ef		! Init value for %f0 
	.word	0x5986ef9c,0xa663fdda		! Init value for %f2 
	.word	0x27bc5dc7,0x44a91a12		! Init value for %f4 
	.word	0x00b200a6,0x90a4f536		! Init value for %f6 
	.word	0x12f139be,0x3614a631		! Init value for %f8 
	.word	0xf03c8ea9,0x4000e4db		! Init value for %f10
	.word	0x2a310a65,0x2543cb73		! Init value for %f12
	.word	0x360ec0c8,0x814d7ace		! Init value for %f14
	.word	0x2172f944,0x178254a0		! Init value for %f16
	.word	0x5b0fe911,0x983a8112		! Init value for %f18
	.word	0xfadf1688,0x5cfccdbb		! Init value for %f20
	.word	0xbcd36979,0xda6d582b		! Init value for %f22
	.word	0xa3d0a6b2,0x5bfd3d02		! Init value for %f24
	.word	0x1abc142e,0x684309ae		! Init value for %f26
	.word	0x6a2ba0dc,0x36234d66		! Init value for %f28
	.word	0x82843eb6,0xa53af447		! Init value for %f30
	.word	0xbe0764b1,0xa9a6c1ba		! Init value for %f32
	.word	0xef8f9062,0x3cfa3c1b		! Init value for %f34
	.word	0xa2e63850,0x983f8a9a		! Init value for %f36
	.word	0x07d31288,0xaf448401		! Init value for %f38
	.word	0xa2f7a5c1,0x50a04696		! Init value for %f40
	.word	0xa9f719a1,0x54a642a3		! Init value for %f42
	.word	0x05a1b066,0xfb2d96a1		! Init value for %f44
	.word	0xfeaf9f5d,0x7e362456		! Init value for %f46
	.word	0x1737b5d0,0xd0c8c7d1
	.word	0x70cc2f7c,0xb3667c7e
	.word	0xfc0683c3,0xb844af16
	.word	0xe578c9dd,0xc26809a5
	.word	0xa8a9541b,0x1e26feed
	.word	0xfd6a8cc1,0x44a8a899
	.word	0xfeae725a,0xdbbcbe44
	.word	0xd7f4ff82,0x3f752f26
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
	.word	0x00000000,0x00000a5f
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000d73a
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xfffffff7
p1_expected_fp_regs:
	.word	0x80000000,0x00000000
	.word	0x7e560200,0x00000000
	.word	0x80000000,0x39800000
	.word	0x80000000,0x00000000
	.word	0x80000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x2543cb73
	.word	0x3b87c1ec,0x5382ae40
	.word	0x00000000,0xc0000000
	.word	0x00000000,0xc0000000
	.word	0x00000000,0x00000000
	.word	0x7dd60200,0x00000000
	.word	0x00000000,0x80000000
	.word	0x00000000,0x00000000
	.word	0xba5e2737,0xc0000000
	.word	0x00000000,0x00000000
	.word	0xbe0764b1,0xa9a6c1ba
	.word	0xef8f9062,0x3cfa3c1b
	.word	0xa2e63850,0x983f8a9a
	.word	0x07d31288,0xaf448401
	.word	0xa2f7a5c1,0x50a04696
	.word	0xa9f719a1,0x54a642a3
	.word	0x05a1b066,0xfb2d96a1
	.word	0xfeaf9f5d,0x7e362456
p1_local0_expect:
	.word	0x00000000,0x00000005
	.word	0x0000109f,0x00000000
	.word	0x00000000,0xf647e958
	.word	0x06038f7c,0x84e87c0c
	.word	0x0000000d,0x6f7aff93
	.word	0x580ceb03,0x104d0c15
	.word	0x4c4430c0,0xaeb8c60d
	.word	0xff45831f,0xb7fade05
	.word	0x125cb97a,0x9abe53a6
	.word	0xcb22e364,0x8532cd3a
	.word	0xe8a03115,0x7d47dd7e
	.word	0xaab7af1b,0x19e23803
	.word	0x5977782e,0x4989d541
	.word	0xddca7f7a,0xeb250403
	.word	0x00000000,0xc5a60003
	.word	0xe3579149,0xa174b09c
	.word	0x65482635,0x7d50832c
	.word	0x8b716a56,0x785f56e4
	.word	0xf4308468,0x441f9f1d
	.word	0x63b20536,0x14328fe0
	.word	0xe1c3db97,0xc3a2ef2d
	.word	0x7a2f8638,0xc2ea976b
	.word	0x33c7db02,0xe87ae81b
	.word	0x4a11922b,0xac33e3af
	.word	0xc00d88f9,0x439c7079
	.word	0xc79cb202,0x7237cb9b
	.word	0xfff969c1,0x680cfb6b
	.word	0x730697ba,0x000000ff
	.word	0x3086eccb,0xeddfc120
	.word	0x5a4b4229,0x216909a4
	.word	0xfffff0f1,0xdaf47252
	.word	0x559e3ab0,0xf979ee40
	.word	0xe13fef01,0xa0eda399
	.word	0xf5d21ab7,0xa0a1752c
	.word	0x8991a3ec,0x35d58be7
	.word	0x19590582,0xea5c0814
	.word	0x05b5ef09,0x02444531
	.word	0xa14ee180,0x05048ebd
	.word	0xb2d65a67,0x96e1d7f4
	.word	0xd530223a,0xbc960602
	.word	0xe2d12aed,0x54af96ff
	.word	0xfcbd8af0,0x71ab757d
	.word	0x8c3906e3,0x7e7e3041
	.word	0x6f9d57d6,0x17ec1a12
	.word	0xaa977034,0xa1bdb372
	.word	0x51221772,0xdadcf1e0
	.word	0xa6a86563,0x882c9bb1
	.word	0xe57eaec8,0x5a6b9c99
	.word	0xa38d684f,0x6b85385a
	.word	0x63b20536,0xbf87f77b
	.word	0x3a39045c,0xa248fa6b
	.word	0xabda06ff,0xf2b571f2
	.word	0x0f7c58c1,0x717a6209
	.word	0x382df9b3,0x4eb2392d
	.word	0x2931691d,0x32659254
	.word	0x0aaf6652,0x103765fb
	.word	0xffffffff,0xfffb6b72
	.word	0xf067460d,0x5812992f
	.word	0xf3fa7d98,0xe35f84bc
	.word	0x0a18cbd9,0xff563149
	.word	0x5b2c3c12,0xc2aeacae
	.word	0xefbf415c,0x8991265d
	.word	0xa7276759,0x2c2e64df
	.word	0x8641723f,0xea66cbac
p1_local1_expect:
	.word	0x2d000000,0x216909a4
	.word	0xff6ed9a9,0x0000109f
	.word	0xd30a35f8,0xf538790c
	.word	0x8fb629d2,0xcc44f0cb
	.word	0x0cee109f,0xd47c954b
	.word	0x34dced49,0xe4071d5f
	.word	0x7a0367b9,0x31f640f9
	.word	0xa5b061b9,0x84e0c29d
	.word	0x48ce9512,0x263a9546
	.word	0x098cec87,0x7ec9619b
	.word	0xea67fc12,0x17897290
	.word	0x9429e77c,0x39a0cca9
	.word	0xc375a6b5,0x748d116a
	.word	0xb8757c7c,0x645a4f78
	.word	0x98e94567,0xddf4a3ae
	.word	0x35d071b7,0xd67f4149
	.word	0xef71ac96,0x61c2cbc4
	.word	0xc002299e,0x2746a4bd
	.word	0x11349206,0x00003265
	.word	0x141736c9,0x9fff5ae8
	.word	0x92cd4532,0x86a250a9
	.word	0x902d2cbb,0x48268fe5
	.word	0xf5fc8a92,0x84e8c503
	.word	0xc92d007f,0xecea23f4
	.word	0x1f3d6d1c,0x7f6dffb2
	.word	0x487eb1ff,0x1b3111ca
	.word	0xc5ea221d,0xc6949581
	.word	0xad645bbd,0x91c52865
	.word	0x8cd0397b,0xeedeaf9e
	.word	0x1ee63baf,0xcc5d3a99
	.word	0xa1730337,0xecc5534c
	.word	0x8e8e8f28,0xb19cd7cb
	.word	0x5c50bfd8,0x6c57dc3f
	.word	0x6833fa8d,0xd2d8856f
	.word	0x60642b49,0xa67f18f0
	.word	0x6bd62eda,0x1b78c915
	.word	0x9cf726c4,0x00cbea2c
	.word	0x9552f6d7,0xee07d2b6
	.word	0xbc8963c1,0xfec1a8c4
	.word	0x10255702,0xfca0546e
	.word	0x5455738d,0x007feaab
	.word	0xbf1b3fb8,0xd722d884
	.word	0x2207fa0a,0x1550fa07
	.word	0x9f81126a,0xef834d7a
	.word	0x084c9f70,0x6457f5e3
	.word	0x00000000,0x00003265
	.word	0x2b804f9b,0x34900a55
	.word	0x8358442a,0x49ba1d57
	.word	0xd2857112,0x13002df1
	.word	0x6599fd9c,0xc91ba54b
	.word	0x14328fe0,0xafda3d0b
	.word	0x86a250a9,0x2cbc86c3
	.word	0x1c6e060b,0xed779e87
	.word	0x22d8d07f,0x230b5922
	.word	0xe9278378,0x2efd1a17
	.word	0xc35f861c,0xd9423dfa
	.word	0xefc485f1,0xd170b2d8
	.word	0xce203681,0x46aecc75
	.word	0x0000a2d5,0x5a066e80
	.word	0x76b3c1c6,0x96b5b382
	.word	0x317a524a,0x5f3409e8
	.word	0x1f6ea82d,0x00059d44
	.word	0x28d9ace2,0xe036b842
	.word	0xf78abbca,0x4111584c
p1_local2_expect:
	.word	0x00000000,0x01caf9a8
	.word	0x0a540000,0x348bcced
	.word	0x039d47ff,0xb993f000
	.word	0x8447c7b9,0x47a6c5b7
	.word	0x71f7f4ac,0xc479954d
	.word	0xda338c69,0x7a383d72
	.word	0x664ab64c,0xac88b02a
	.word	0x733dfb52,0xb79a46f3
	.word	0xd4cd5edb,0x4788f0a5
	.word	0x24093edc,0x92cc491f
	.word	0xf381a391,0x1594ae01
	.word	0xe62c3a82,0xc923788e
	.word	0xe427ef57,0x9dfcabc1
	.word	0xd091e8ec,0x6026dbcc
	.word	0xf64e4948,0x889d4670
	.word	0x68ff61ee,0xfa2ad6b5
	.word	0x38f7db20,0xbe32e3cc
	.word	0xbba6a716,0xe6b021b7
	.word	0xff2dfd6b,0x1f5a9693
	.word	0xc916e050,0x74886cdb
	.word	0xc0d90fbd,0xf9ff62a8
	.word	0x298884b0,0x44f2eb82
	.word	0x0ae2e40b,0xc2137e53
	.word	0x6a528d15,0xd016b723
	.word	0x4aec2a63,0x4f8ec511
	.word	0xfa4392bb,0x178fffc2
	.word	0x9672e3a1,0x43820014
	.word	0x5da9afd6,0xb87b0bb9
	.word	0xc0da132c,0x899b991d
	.word	0x1b389e36,0xe64cc135
	.word	0x8f887ff2,0x04ac037b
	.word	0x43942130,0xcbc021fd
	.word	0xde9759ed,0x0dda0e2e
	.word	0x52dd9d77,0x8f0191d0
	.word	0xfdc50465,0x84da284b
	.word	0xb894a954,0x4b47794f
	.word	0xac13b546,0x7c503bdd
	.word	0x01db06cb,0xbc874d9d
	.word	0x730697ba,0x0e892425
	.word	0x65cd2f96,0x1f0a083f
	.word	0x66fabc10,0xbff6ee6d
	.word	0x9c7dca3d,0x46a3f321
	.word	0x98125a61,0x781d66dd
	.word	0x94dd6510,0x9e4cde57
	.word	0xd9214ef8,0xc62586d2
	.word	0xe75807e7,0x24349ca1
	.word	0xa04106a8,0xb841b9ac
	.word	0x3aba04c8,0xc9f69a83
	.word	0xb583c178,0xd6524aa1
	.word	0xbcd489ed,0x08b4f857
	.word	0xd0e81bae,0xbdf46f64
	.word	0xa5d56361,0x4b956815
	.word	0x7de74890,0x9d48a2be
	.word	0x3fd5a117,0xf647e958
	.word	0x5959aec6,0xe082435f
	.word	0xa8cda3d0,0xddc3b9e7
	.word	0x949cf6b2,0x20f3a8fe
	.word	0x558c648a,0x252bbe8d
	.word	0x8bb2528b,0x9a18de57
	.word	0x0853be2d,0x36d6ea86
	.word	0x44c5f63c,0xa23f7634
	.word	0x00c10000,0x000081c1
	.word	0x55886cd2,0xab752a58
	.word	0x143225ec,0x078c240b
p1_local3_expect:
	.word	0x9f36ffff,0xff02c55d
	.word	0x00000000,0x352fc000
	.word	0x2cd24b1c,0x26185f97
	.word	0xaea766ae,0x9fab1267
	.word	0x1a3f0c02,0x30b1990d
	.word	0x582a2109,0x801fbcd0
	.word	0x56216542,0x115e7bdd
	.word	0x04f15a69,0x5a56cc2c
	.word	0x00001432,0x5bd13c04
	.word	0x475297f3,0x786effff
	.word	0xf5fa57d2,0x953f7c9a
	.word	0x3bc1ddb3,0x7c76cd23
	.word	0x6f8822fd,0x889beaff
	.word	0x46352f28,0x506444c1
	.word	0x10deda76,0xa6be5638
	.word	0xb8c40c88,0xb97e6110
	.word	0x5e0c336d,0x4d03e30e
	.word	0xabe13425,0x3bbf8c30
	.word	0x2ae7f1a1,0x5725b2f8
	.word	0x0d08216c,0x0f94e9ff
	.word	0x7379456b,0xb23606f0
	.word	0x8b80e114,0x2ad1dc1d
	.word	0xc0e8f690,0xe2f14329
	.word	0x25fffdf9,0xd60630f3
	.word	0xb5e2350f,0xaf896887
	.word	0x102ddf6d,0x17f2610b
	.word	0x6ce50fa2,0x60bf9284
	.word	0x2bfdbd9f,0xd09d2ff7
	.word	0xd5366eb6,0x1b8e703e
	.word	0x84d5a2f9,0xd0388675
	.word	0x409ada11,0xd5da0542
	.word	0x3bc863f9,0xd8486391
	.word	0x15d44ab7,0xfbade95c
	.word	0xca01e4b0,0xf2581233
	.word	0xa0e6b7ab,0x68c1fa60
	.word	0xbbe06ce6,0x5d53e416
	.word	0xeee61d1f,0x8bb77e28
	.word	0x07dbc64b,0xac232261
	.word	0x0eaf565c,0x8a04502d
	.word	0xf6910c19,0x00db9add
	.word	0xc26b3d57,0x9b45e334
	.word	0xebb29321,0x4a08e0f9
	.word	0x814a523f,0x11ecbad7
	.word	0x4be011d0,0xe3f4f303
	.word	0xe6b32122,0x86599b47
	.word	0xeec4aba8,0xe30bc8f4
	.word	0x13bdc0ec,0x31326c9a
	.word	0x49bc7700,0x24900675
	.word	0x2eb7bbb1,0x8183ff3e
	.word	0x53e0d232,0x0215645f
	.word	0x12f62cd0,0xfa7bb3b7
	.word	0x42a80da4,0x1b905090
	.word	0xbf504ba5,0x20fbac3c
	.word	0x9add8020,0xa816a8f3
	.word	0xbc7f1fae,0xf3e10492
	.word	0x48d7ee25,0xa717a9a5
	.word	0x36436ad2,0x3158c829
	.word	0x6e0e431a,0xeb5eb5d5
	.word	0x2cfaa6ff,0xd1caaf2b
	.word	0x612dc203,0x5cc5a0a9
	.word	0x8e6139f2,0xffa8473b
	.word	0x787583ae,0x9d7399a0
	.word	0x431735db,0x0827a3cb
	.word	0xffc7901a,0xd25eadb8
p1_local4_expect:
	.word	0x21690180,0x2168fb56
	.word	0x0000027f,0x00000000
	.word	0xca83a113,0x0ab16c8c
	.word	0xc2a6871f,0xc04ce2c7
	.word	0xe5f183f6,0x572c8ea5
	.word	0x23171350,0x204c93c2
	.word	0x71b6a157,0x3c3e416d
	.word	0x9679395e,0x0bf8fdde
	.word	0x191eee26,0xd2e27482
	.word	0x002d7675,0x3181aeb9
	.word	0xcb2667e0,0xa3d4bbe2
	.word	0xf8e91e5a,0x5dbbeeb1
	.word	0x449d5d0c,0x4b4bb036
	.word	0x89dd4dbb,0xc1768289
	.word	0x13802d25,0xd370aec5
	.word	0x4a88a23b,0x0e21b2b7
	.word	0xf8268c32,0x4ad4d912
	.word	0xd3fb11f4,0x0dc2804f
	.word	0xed270b71,0xaf183574
	.word	0x04a2dd7c,0xed829bbc
	.word	0xebb318fc,0xb899b025
	.word	0xa55d528a,0xd5bfc6ca
	.word	0xfe811444,0x5023b3f4
	.word	0x00000000,0x8f887ff2
	.word	0xa74ae984,0x5ff11b4d
	.word	0x01b4d53e,0xc81d39ad
	.word	0x27b6632e,0xbcba5bfb
	.word	0x139059c6,0x350cb4d3
	.word	0x2e87314a,0x4939859a
	.word	0xbc90b607,0x6ca5c1a4
	.word	0x0d48a9d4,0x0e2a2ccb
	.word	0xc28734c3,0xe4933c6c
	.word	0x8feec11f,0x373a74a0
	.word	0x395386d6,0x711cb1cd
	.word	0x9e583f8e,0xe7c67e2f
	.word	0xe03281bf,0x180c9e57
	.word	0xb8d934da,0xa0ea139e
	.word	0x64374a75,0xba750d0d
	.word	0xe682233b,0x22635350
	.word	0xd2b74f24,0x46c7b026
	.word	0x63b20536,0x14328fe0
	.word	0x152fc133,0x6ea5b2b1
	.word	0xaec797f5,0x8d67c355
	.word	0xbb1e7902,0x99a39ade
	.word	0x621f359d,0xfa37939e
	.word	0xb6de399f,0x4f07061c
	.word	0x70e8ddc3,0xa43f21f8
	.word	0xb9d3beea,0x6e67618a
	.word	0xe06832e4,0x13dd2b6d
	.word	0xa31c0e18,0x9862e098
	.word	0x69501ade,0x8b8f9a22
	.word	0x9a4e741a,0x3685909c
	.word	0x7bf3835d,0xde362deb
	.word	0x78ffa1c5,0xa684b296
	.word	0x420b64f4,0x852229cf
	.word	0x245ae16d,0x13cc347f
	.word	0xe50321a4,0xfaf244a9
	.word	0x2963514a,0x1a976de9
	.word	0x0d134630,0x85c7dce8
	.word	0x01e33d8d,0xa4957102
	.word	0x2f3aabbf,0x9ed01027
	.word	0x437066d5,0x0b30fdad
	.word	0x312253ec,0xae2ddbc8
	.word	0x3508d3f6,0x1edd83ec
p1_local5_expect:
	.word	0x94c88a73,0x6829a7d6
	.word	0xb45c5717,0x225951a5
	.word	0xa5ed104b,0xbd512292
	.word	0x47652ad1,0xd9af4c23
	.word	0x321be2e2,0xa80e4b55
	.word	0xb4ba1ac7,0x367097c0
	.word	0x85159cde,0x89f8296e
	.word	0xeb08a5ef,0x3a23ffff
	.word	0x2ac327ef,0xeecbe01f
	.word	0xecee9ca4,0xc504c8ce
	.word	0x92560b71,0x3ec0ce68
	.word	0xd00af455,0x7c2e1053
	.word	0x9d772bd5,0x331c514e
	.word	0x951fe4ea,0xf343a590
	.word	0xe11e42b7,0xf400471d
	.word	0xff7d94f8,0x6131b229
	.word	0x98e56cb0,0x1e498d4f
	.word	0x96bfe1ad,0xcad48d44
	.word	0x4b0533de,0x4b57bba1
	.word	0xf49e7c37,0xfb0f87ca
	.word	0xa5a9331d,0x5783b340
	.word	0xbd1bb086,0x5d3884f1
	.word	0xc2872e57,0x4a2ca5e4
	.word	0xeeac533a,0x86afd3b8
	.word	0xcf17e175,0x4b01843f
	.word	0xde4baf44,0x5eb86961
	.word	0xf938214f,0xcbcd2335
	.word	0xa11e8ab7,0x44f8a112
	.word	0x6ec9f837,0x7ca1407d
	.word	0x1d8ea2d4,0x6c36e4fb
	.word	0x391032fc,0xc81f1adb
	.word	0x691a27cc,0x2624e5a2
	.word	0xb48d21fa,0x10a280a4
	.word	0xab35d785,0xf97bab41
	.word	0x687e6628,0x82d82a3b
	.word	0x258c7bd6,0x8a062194
	.word	0xc649e268,0x7a2f54cc
	.word	0x2e80e5bf,0xa4cf8f28
	.word	0x04615a07,0xba348ed3
	.word	0x31994e37,0x276c5955
	.word	0xb9f2d536,0xf842fd90
	.word	0xea79be9f,0xc2268ab0
	.word	0xa67da6e9,0x399970a7
	.word	0x046f5e78,0x84cac26d
	.word	0x1f3e9d6d,0x7463cedd
	.word	0x8bf245a1,0x7bc755c8
	.word	0x8cc54fc9,0x7542373b
	.word	0xbd54be90,0xcba6bf11
	.word	0x8cbc4c2b,0xfc96c962
	.word	0x0c246ff4,0x09b32732
	.word	0x7983d47d,0xe3e155dc
	.word	0x7c6d7ff4,0x89fcb3f7
	.word	0x9f1f3c23,0xccb6388e
	.word	0x4600a6fa,0x13a45b0c
	.word	0x91ec1ff2,0x57227563
	.word	0x1f447239,0x1138b149
	.word	0x3250e516,0x4497e78e
	.word	0x283a7bbe,0x3c759d07
	.word	0xee3fd539,0x799a94d2
	.word	0xd18d2dce,0x6b52074f
	.word	0x982f299d,0x65cfd396
	.word	0xcd38e914,0xf1ebab3a
	.word	0x14f18cea,0xdbb40208
	.word	0x8871d512,0x8643cfa7
p1_local6_expect:
	.word	0xe952ab5e,0x6875ad93
	.word	0x00000000,0xf607ff78
	.word	0x5d29265e,0x4c3b3b5e
	.word	0x9fd1c213,0x816ffdde
	.word	0xd635cf2b,0x8094df08
	.word	0xc8e54556,0xf32a1ce5
	.word	0x349a0cc0,0x6197cc24
	.word	0xe8f5f9df,0xbb298cdb
	.word	0x2787f8c2,0xd38fae9a
	.word	0x1090ae08,0x03863f48
	.word	0x357d14fd,0x67666113
	.word	0x5503f1b4,0x920e4921
	.word	0x94442ce5,0x0e4010fe
	.word	0x2407360d,0xf6d924fd
	.word	0x6e8039d0,0x1d6060e0
	.word	0x6828638d,0x877de56d
	.word	0x64622729,0x6b330728
	.word	0xf5aa6ada,0x28269f38
	.word	0x73d9cd17,0x40d7b147
	.word	0x7386883d,0x678bdd4a
	.word	0x5f53ac33,0xc41f0b1f
	.word	0x5665586b,0x00e723cd
	.word	0x59b1abbd,0xba55214b
	.word	0xe670d248,0xaf19647a
	.word	0xd6f2b640,0x6d5eed83
	.word	0x093cf4b3,0xadf1bd11
	.word	0x58946747,0x9392a0b5
	.word	0x76aceba2,0xccbd3028
	.word	0x76457887,0x7d4f75d5
	.word	0xddd80ae3,0xa9397f2d
	.word	0x2afd6690,0x4c1390cb
	.word	0x76c94052,0xf062276a
	.word	0x5dabc828,0x0201b4ad
	.word	0xc605a308,0xfbab8185
	.word	0x887260b7,0x42aca295
	.word	0x5d3696f9,0xd8afeeae
	.word	0xffffffff,0xffffa0e6
	.word	0x2080e726,0x33a1a9a7
	.word	0xe24f0099,0x7928826e
	.word	0x8657e9b9,0x477e365d
	.word	0xaa88b105,0x480374dd
	.word	0x52df6429,0x2202bfbe
	.word	0x23d649bd,0x94e2003a
	.word	0xe39535b0,0xc2ca5e97
	.word	0xd955e32c,0xd1156a3b
	.word	0x6fc4f669,0x21114388
	.word	0x5bc24e15,0x3d981eed
	.word	0x2d24ee4f,0x844ea710
	.word	0x640be975,0x7273a7e2
	.word	0x6ef5cc2f,0x06f5127f
	.word	0xcdeafd93,0x666fce63
	.word	0x1ddf5c21,0x076d4537
	.word	0x6c0e5aa3,0x0f85b91f
	.word	0xdc7f43f5,0x4eb1854f
	.word	0xedb867be,0xbffc0479
	.word	0x54fe3ac8,0x3e792a61
	.word	0xb22c4df6,0x766971bc
	.word	0x6baebb64,0x52558492
	.word	0xdf65cb94,0xe3c1edfb
	.word	0xebd1c8af,0x89697ca3
	.word	0xecd71525,0x7d8bbc7f
	.word	0x052d0e0a,0x71dc9f85
	.word	0x9db396cc,0xeb186d15
	.word	0x6aaa5e07,0x7010b451
p2_init_registers:
	.word	0xb188ce00,0x20e54ef2		! Init value for %l0
	.word	0x8e4c1800,0x0c7789ed		! Init value for %l1
	.word	0xef11c5ff,0xa8142266		! Init value for %l2
	.word	0x0ca7ff00,0x0802fb48		! Init value for %l3
	.word	0xda9663ff,0xdba9f716		! Init value for %l4
	.word	0x52847bff,0xc66dae5c		! Init value for %l5
	.word	0x893bfd00,0x57ad8b4e		! Init value for %l6
	.word	0xb2bc60ff,0xf09c6b1f		! Init value for %l7
	.align	64
p2_init_freg:
	.word	0x93fbde0b,0x08c65226		! Init value for %f0 
	.word	0xa09afd44,0x10884754		! Init value for %f2 
	.word	0x436075fc,0x9f507092		! Init value for %f4 
	.word	0xe77a8b81,0x7c07a3f7		! Init value for %f6 
	.word	0x116760d3,0x9eae2418		! Init value for %f8 
	.word	0x0df08775,0x0ed31bbc		! Init value for %f10
	.word	0xa759978b,0x8343c848		! Init value for %f12
	.word	0xa59d913a,0x1e2b5361		! Init value for %f14
	.word	0x6955c646,0x1e46fe0d		! Init value for %f16
	.word	0x608c936b,0x9ee48851		! Init value for %f18
	.word	0x170ede4b,0xc07cc140		! Init value for %f20
	.word	0x379c62da,0x6c020d29		! Init value for %f22
	.word	0xe6f6917b,0x75f8f562		! Init value for %f24
	.word	0xf332ad93,0xc965d8a1		! Init value for %f26
	.word	0x6b51f2be,0xcb6e7e6c		! Init value for %f28
	.word	0x52cb6f77,0x5509fe7e		! Init value for %f30
	.word	0x4bbe4af4,0xe48a1aa7		! Init value for %f32
	.word	0x7a0e666c,0x45ea3dc6		! Init value for %f34
	.word	0x64ae749b,0xba985b44		! Init value for %f36
	.word	0x194774dd,0xa01d1124		! Init value for %f38
	.word	0x8432688e,0xde85954a		! Init value for %f40
	.word	0x5bec3085,0xc7beb1c0		! Init value for %f42
	.word	0x6cfd14f4,0xa2a4251c		! Init value for %f44
	.word	0xbed114ba,0x91637349		! Init value for %f46
	.word	0xbad11686,0x585f18ae
	.word	0xc4face49,0x4eaa938a
	.word	0x96b9b1db,0x20fe55ba
	.word	0xebc438db,0x86ab5991
	.word	0xd23bdf85,0x765ac18b
	.word	0x92ddc986,0xbcf04ced
	.word	0xcbad3438,0xfa102306
	.word	0x326318e5,0xd58cad60
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00004fdf
	.word	0x00000000,0x00009fbe
	.word	0x00000000,0x00000000
	.word	0x00ffffff,0xffffe295
	.word	0xffffffff,0xfffffb96
	.word	0x00000000,0x0000ff00
	.word	0x00000000,0x00000000
p2_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0xc3ac8000,0x1e46fe0d
	.word	0x140bde0b,0xbf800000
	.word	0x00000000,0x00000001
	.word	0x40000000,0x08c65226
	.word	0x00000000,0x00000001
	.word	0x00000000,0x00000001
	.word	0x00000000,0xffffffff
	.word	0x7fffffff,0xfffffea7
	.word	0x140bde0b,0x00000000
	.word	0x140bde0b,0x00000000
	.word	0x00000000,0x00000001
	.word	0x3ff00000,0x00000000
	.word	0x3ff00000,0x00000000
	.word	0x3f800000,0xfffffea7
	.word	0x80000000,0x3f800000
	.word	0x4bbe4af4,0xe48a1aa7
	.word	0x7a0e666c,0x45ea3dc6
	.word	0x64ae749b,0xba985b44
	.word	0x194774dd,0xa01d1124
	.word	0x8432688e,0xde85954a
	.word	0x5bec3085,0xc7beb1c0
	.word	0x6cfd14f4,0xa2a4251c
	.word	0xbed114ba,0x91637349
p2_local0_expect:
	.word	0x44b20d14,0xffe29b9b
	.word	0xff007af1,0xfffff4a4
	.word	0xf638b9c9,0x151c32b2
	.word	0xe2bf3765,0x7bb4b3cb
	.word	0xd57480b7,0x3ae064c5
	.word	0x0657f3b9,0x94972229
	.word	0x5ecd3a88,0x25ee8559
	.word	0xb4a44db5,0x70b448ec
	.word	0xab3f0d18,0xf0236eae
	.word	0x0a3ccbe3,0x9f22183d
	.word	0xcd4a54b8,0xedaa1385
	.word	0x48017ee4,0x23fabf48
	.word	0xdbc8c6fb,0xefb527fd
	.word	0x07fa2838,0x6f95f13c
	.word	0xacd2fbc5,0x50968df0
	.word	0x644bf77e,0xb6e4138a
	.word	0x00000000,0xffffffff
	.word	0x7cb89c1e,0x6d48f33c
	.word	0x61ff7525,0x12c754d3
	.word	0x65aee6f2,0x23f38fc5
	.word	0x0d8c190a,0x065ef602
	.word	0xf82d7c6a,0xb8eb47c3
	.word	0xfaa1500f,0x632c02ca
	.word	0x1fe42d31,0xe4742de5
	.word	0x00000004,0xfffffffe
	.word	0xd53ed026,0x1e0c3820
	.word	0x48cb030b,0x171e0a01
	.word	0xd258c4d0,0x5ee18fcb
	.word	0xdc3a1c09,0x5efaf2dc
	.word	0x20edb629,0xc14edf83
	.word	0x3b8b4094,0x55b315c6
	.word	0x00000000,0xd63ad822
	.word	0xc7a4dd48,0x8d71efd8
	.word	0x75f10817,0xb969bcb2
	.word	0x34ba90ec,0xa1ff9d40
	.word	0x85a7077a,0x45551156
	.word	0x7769e7f8,0xcd1e25d7
	.word	0x730ed353,0x8b731559
	.word	0xe58ffbe7,0x9ab5778c
	.word	0x8213074b,0x1795a6b5
	.word	0xa106d8dc,0x3d2a662f
	.word	0x86a13a26,0x0261c716
	.word	0x6f95f13c,0x0000098d
	.word	0x6656f161,0xb4334c12
	.word	0x1c007678,0xa4263eda
	.word	0xc8c95ec3,0x41679952
	.word	0x6995d1d4,0xae7c2e32
	.word	0x788597cc,0x55371713
	.word	0x12d473d5,0x39d9781d
	.word	0x9fa53b84,0x6ee1128e
	.word	0xa435ffca,0x0f0e2768
	.word	0x5f63dd62,0xf8c001c5
	.word	0xe8779a84,0x0cafe5c6
	.word	0x9927b873,0x2cab6312
	.word	0x0048adb7,0x6c0f4487
	.word	0xffff817f,0xb200c000
	.word	0x552d1bfd,0x9061e35d
	.word	0x21ff33dd,0xd5c84d9a
	.word	0x9bfba188,0xf5168813
	.word	0xafa9525c,0xa47de9c6
	.word	0xbf58e557,0x01a2b728
	.word	0x1f89df85,0xca398c52
	.word	0x9c50af5e,0x138422e1
	.word	0xc30d0054,0x0c50a2cd
p2_local1_expect:
	.word	0xff1cfa6d,0xffffffff
	.word	0x00000000,0x00000000
	.word	0xe5428b8e,0x90c12d09
	.word	0x71d98208,0x6ca7d14b
	.word	0x6535215c,0x08a714ea
	.word	0xeb892e0d,0xd864327e
	.word	0x69ab49d6,0x68cf6056
	.word	0x54bd582d,0x495042bb
	.word	0xb002c34e,0x6526a47b
	.word	0x378b2e79,0x818ebc3c
	.word	0xb487ca88,0x7c6fc473
	.word	0x2dcd489b,0x958925ef
	.word	0xee74bc30,0x3c215db9
	.word	0x7c4b81d7,0xbb7feec8
	.word	0x469d69d7,0xc87bf2f8
	.word	0x15878a22,0x0ba5dbea
	.word	0x5f3ae261,0xc4c71214
	.word	0x8bac361d,0x11953042
	.word	0xfcf855e3,0x62753bf5
	.word	0xc9552731,0xf610a5b6
	.word	0x8bd850be,0x66b5a15e
	.word	0xdad28fa6,0xfa578e83
	.word	0xa0b90f65,0x705e0002
	.word	0xd30ad24e,0x3b9c5878
	.word	0x00000000,0x000000ff
	.word	0x06097ce4,0xd13308f3
	.word	0x5b3f2fc0,0x19e47f45
	.word	0x82cfb08c,0x761adcb2
	.word	0x0a664aca,0x31eab060
	.word	0xfaac6756,0x85709e4e
	.word	0x9d17265b,0xe3cadba4
	.word	0x68036fdc,0x0c088d7c
	.word	0xdb332de9,0x08d0e4bb
	.word	0x9d257e12,0xce790e14
	.word	0x4ceaee96,0x561c35a3
	.word	0x5ba025f5,0x4494946e
	.word	0x00005c13,0xffffffff
	.word	0x46b70e52,0xcf270518
	.word	0xf0b633b0,0x2f9b6a9d
	.word	0xe22ea5b8,0x2bb8f5ba
	.word	0xe04ad260,0xb6b83f4f
	.word	0xda3fc704,0x7dbf7425
	.word	0x7db59c9e,0x1005e89d
	.word	0x00000409,0x807b0084
	.word	0x288cf13a,0xeef0f2c0
	.word	0xf7d8b944,0xd386625c
	.word	0x2d1f9354,0x0bebade0
	.word	0x08ebf714,0x48f421ce
	.word	0x659ae390,0x7c0b0147
	.word	0xaaf4a4c2,0x9fa6410e
	.word	0x00000000,0x00000000
	.word	0x423b8477,0x00000000
	.word	0x2a6dc0cb,0x5495af3d
	.word	0xb86b2410,0x3f674163
	.word	0x5873c494,0xbcfbb551
	.word	0x4237fb5e,0x08cee0bc
	.word	0x8a2ec91d,0x22cc2962
	.word	0x13b436f1,0xc193071f
	.word	0x7e04801d,0x116c9adb
	.word	0xa20f919a,0xd7be1626
	.word	0x95d0a34c,0xc18b79d5
	.word	0x01c69ddd,0x20851ea1
	.word	0xca60febc,0x79f2bb79
	.word	0x875affb2,0xa94deca9
p2_local2_expect:
	.word	0x80eb7b1a,0xffac1430
	.word	0x00000000,0xffffffff
	.word	0x840152a1,0x88b9da6e
	.word	0x98939c21,0xaeb25181
	.word	0xc3da9098,0xab728bcb
	.word	0xfd62e62e,0xeb6c8824
	.word	0xa4a2337f,0xd53ed026
	.word	0x0b18aa16,0xb53c3340
	.word	0x638a60db,0x73da93db
	.word	0xc21f707e,0xd37d7c32
	.word	0x7cb2ce7b,0x44d4267b
	.word	0x1928ee55,0x182b7b8a
	.word	0x73aa4bb2,0x9ffea5a3
	.word	0x2f833bc2,0x2c37be8b
	.word	0x80ad652a,0x207711f2
	.word	0x0000098d,0x818eb384
	.word	0xffffffff,0xffffffff
	.word	0x090e77ba,0x16b1e15f
	.word	0x807f24a8,0x36f94972
	.word	0x6fbb12b6,0xbd26288b
	.word	0x3282f652,0x00000004
	.word	0xffffffff,0xfffffb96
	.word	0x5744bd86,0x33845924
	.word	0x734d33d9,0x5b712f63
	.word	0xa68f9482,0xd3b29b7b
	.word	0xbe5c6620,0xc1043392
	.word	0xd0240755,0x3cffc3e6
	.word	0xbc3820ff,0xfcacb914
	.word	0x1d941ae0,0x66457867
	.word	0x000000ff,0x00000000
	.word	0x1c2fea83,0x9acccdbf
	.word	0x5ca98c75,0x937f0c98
	.word	0x00000000,0x000000e5
	.word	0x44bfc8ee,0x90550583
	.word	0x1d1ac70c,0x5ab9d0f0
	.word	0xe2f6da9c,0xc9779520
	.word	0xfc026d02,0x67857755
	.word	0x25a15ca3,0x48d9e16c
	.word	0xfffffbb2,0x818eb384
	.word	0x9765c06d,0xde5b817f
	.word	0xdfbc038e,0x6fedf443
	.word	0x220e699b,0x29d778e0
	.word	0xa9eb1500,0x5ca74c94
	.word	0x48358315,0x85861169
	.word	0x2cd99b7b,0x2bb7f8cb
	.word	0xc1935c10,0x424a634d
	.word	0xb2c617c2,0x8c9e0c49
	.word	0x22ab88e1,0x209395f8
	.word	0x07dff97c,0x67d9cecc
	.word	0xac458102,0xd25deddf
	.word	0x3c2ce13d,0xf0654760
	.word	0xa01b4168,0xd08ebe09
	.word	0x472c3ce9,0x9cd72e02
	.word	0xa500abcb,0x1cb5ae5b
	.word	0x52e9860d,0x508a04fc
	.word	0x1315f7cc,0xd42b92be
	.word	0x5a399830,0x2d9720c0
	.word	0xdcce89d7,0x6bb55606
	.word	0xbc849652,0x94d775c6
	.word	0x70d34890,0x575d855e
	.word	0xb279f1e3,0x5a2e84b3
	.word	0xbf13e4e6,0xd971f5db
	.word	0x8a1aff13,0xb8f8a373
	.word	0xd8f1a9ec,0x894e2ba8
p2_local3_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000091c
	.word	0x4d84fa3b,0x4a365c14
	.word	0xfe0e36ec,0xff48af05
	.word	0xdb1c7c52,0xbfaffefd
	.word	0xd5f11646,0x3ee8a0ac
	.word	0xe9571d8f,0x6bd61979
	.word	0xe5309591,0xc049a7d7
	.word	0xd2d95289,0x19dcfd20
	.word	0x00000000,0x94af9529
	.word	0x0fd979f4,0xfc7a7b21
	.word	0x00000000,0x00000000
	.word	0xdc1cb79e,0xac887dfa
	.word	0x1d10ddc4,0xbebc601e
	.word	0x77f06f36,0xd12ea64f
	.word	0x7fe27978,0x31b56e24
	.word	0xe1edb0cc,0x0c700251
	.word	0x2a23f03b,0x665229bc
	.word	0x103503f8,0x752fb0af
	.word	0x10f205a3,0xdaac7469
	.word	0x00000000,0xc5bc9e66
	.word	0xa69d9d89,0x77cf6021
	.word	0x8cda93bb,0xee6a07e6
	.word	0x7adb4f97,0xfb641df4
	.word	0xccfb45ee,0xa4e6f6ea
	.word	0x14219f3f,0x600df678
	.word	0x24c51624,0x64574edf
	.word	0xf9f038e5,0x5b8ca209
	.word	0x472ed3eb,0x10478c1d
	.word	0xad6f7d73,0x8860c814
	.word	0x7a47a62f,0x230a5101
	.word	0x4207ce65,0x8f1ea26a
	.word	0x29a2081a,0x612aa01d
	.word	0xf1ae171b,0xd0f61e71
	.word	0xfc767add,0x4b720928
	.word	0xb0fb38b8,0x87518432
	.word	0xa410a321,0xffff1cb8
	.word	0x6eed202e,0x00007c6f
	.word	0x86a350e6,0x8312a004
	.word	0xd26d15da,0xcf47283f
	.word	0x8bc67ee3,0x538a884e
	.word	0x6c6b7211,0x45b9a5de
	.word	0xb2af1270,0xee9e3db1
	.word	0x17983218,0x198533cc
	.word	0x97b3e8b2,0xb3ffc52d
	.word	0xd654d270,0x7998c2df
	.word	0x818eb384,0x6497bf22
	.word	0x23b9e752,0xb43b76c3
	.word	0x9738bb7d,0x085e9193
	.word	0x9ca7bab2,0x21ebb21d
	.word	0xc86676f8,0x75db466b
	.word	0xdd185351,0x7882c369
	.word	0xc62538dc,0xa3ee41c5
	.word	0x503992e7,0x6fea5ca4
	.word	0x4db3a2e7,0x73c20d2b
	.word	0xe8520788,0x7428481e
	.word	0x999e6b21,0x821cfe74
	.word	0xd8463ed4,0x8c79b395
	.word	0xe5d729e0,0x8e81897d
	.word	0xe33f1299,0x46bafe56
	.word	0xbbbfc97d,0x90b8b082
	.word	0xf203551f,0x42fef5a1
	.word	0xfdcab7ad,0x4af6e6e0
	.word	0x6f671abc,0x4bc67b5a
p2_local4_expect:
	.word	0xe5c56ed0,0xcdfd4790
	.word	0xf6b7b3e1,0xfd127531
	.word	0x4ee459e6,0x1eeeb0b3
	.word	0xdf884b54,0x48ab8ef5
	.word	0x0d646f84,0x78ae4957
	.word	0x15528bde,0xbd13e5aa
	.word	0x8a886905,0xf99f9a00
	.word	0x8cca9878,0x3364c35e
	.word	0x17038b89,0xe8e9762d
	.word	0xfdf85794,0xb2dbca0c
	.word	0x5a814f2c,0xaee618da
	.word	0xe679a369,0x5d1f9c53
	.word	0x74b88766,0x871019d1
	.word	0xf6fe2202,0x2f8016cf
	.word	0x2661c5fc,0x732abe89
	.word	0xc052d96a,0x893a0e46
	.word	0xdb055c76,0x2834b5fe
	.word	0xfe7a51f2,0x05cae8c5
	.word	0xb582af69,0xc19089a0
	.word	0xac11b58e,0x06786680
	.word	0x67cc8bdd,0x02123739
	.word	0x95e6b34c,0x5f5993c7
	.word	0x47fc9998,0x5e77b56e
	.word	0x1a48d9f9,0x5ee49155
	.word	0xf90e6029,0x4ebb6ada
	.word	0xf5561fdd,0x9a66c87a
	.word	0x283a2e1e,0x44254a59
	.word	0x58c7104d,0xcca07240
	.word	0x4c9ab22a,0xdd40202a
	.word	0x1c03f382,0x740b83c7
	.word	0xddfab742,0xe2d489bc
	.word	0x1f3d28ab,0x4461c3ab
	.word	0x67703865,0x62dee8af
	.word	0x3f2b0cc4,0xa6b1cda9
	.word	0xc9d2adc4,0xcb12162e
	.word	0x2585d9bc,0xea6f3fbc
	.word	0xcc44e6c8,0x29999bbd
	.word	0xa6c29e18,0x5b59bcc4
	.word	0xbe91f9db,0xf03e3116
	.word	0xce847f91,0x7a76bfda
	.word	0xc6356a26,0xbbaa98f9
	.word	0x49bd96f3,0x0c4f7cac
	.word	0x9f675bc5,0x4baea7ca
	.word	0xda8306a8,0x1db4dce9
	.word	0xbca0668d,0x1614d0ba
	.word	0x266931ab,0x447fc8ff
	.word	0x5178807e,0x206418ac
	.word	0x785998f6,0x03b12686
	.word	0x95447190,0x51626ea6
	.word	0x1251ea82,0xb8be18bb
	.word	0x629df98c,0x0cf070c9
	.word	0x192ea02c,0x94f44725
	.word	0xfff0d5c8,0xf21c9afe
	.word	0x2e97063e,0xa3f0974b
	.word	0xf5847533,0xab2e156d
	.word	0xae5f51de,0x88ddc706
	.word	0x87265033,0xf7316551
	.word	0xf675667f,0xde63addc
	.word	0xf4f7e632,0x43d9aa60
	.word	0xdfd42ab8,0xeb23c837
	.word	0xae35b3c6,0x9547d856
	.word	0x71e47eb3,0x82762401
	.word	0x7ab94218,0x8c0bcf8f
	.word	0xd10b2f42,0x8e6cd044
p2_local5_expect:
	.word	0x007accc2,0x1ef6fa8a
	.word	0xff5d0fa3,0x51b6314c
	.word	0x6ee6ef0c,0x717b7514
	.word	0xd97c8893,0x0f18c9b6
	.word	0xf351ea81,0xa2d7df3d
	.word	0x00c6612d,0xe91a437a
	.word	0x4149724d,0x60bbef7c
	.word	0x780e0b7f,0x64a057a4
	.word	0x842790d7,0x949a3582
	.word	0x25e6e3d5,0x5718168f
	.word	0xb5869ddb,0xa3996906
	.word	0x95cf9c6f,0xbd2273e7
	.word	0xc047e009,0xe1417784
	.word	0x238a6f04,0xe94c6bfd
	.word	0xe76a8c87,0x3303a7a1
	.word	0x5f368f1a,0xa8afbae7
	.word	0x2d7665f4,0x8e4aa06b
	.word	0xf50c7178,0xc8199dca
	.word	0x60850afe,0xbca316a2
	.word	0x13cb17ee,0xb97784bd
	.word	0x8b50292e,0x9e3d162e
	.word	0x51a7d23f,0x0f073344
	.word	0xc11c9c05,0xcf0ea0cd
	.word	0xdea6f54a,0x91752f31
	.word	0xb32d7afe,0xe7be9567
	.word	0x852ab9b7,0x1c83b1aa
	.word	0x5ad5d763,0xd831ebe3
	.word	0x11b89f15,0xd6841c68
	.word	0x399a9842,0x4b8d4856
	.word	0x8996fce2,0x403f9f29
	.word	0xc78edb9f,0xd3727487
	.word	0x13e1e2cb,0x37f64ba8
	.word	0xd9924bf4,0x3f837c60
	.word	0x84d418a2,0xb1e06302
	.word	0x321ef216,0xaa02f216
	.word	0xa9f7e926,0x7813cf30
	.word	0x192c0075,0x5f611e6b
	.word	0xaa362f81,0xcb1d2dff
	.word	0xa22967ea,0xc3d072ea
	.word	0xe26d4b5e,0x17b73620
	.word	0x7baff003,0xb6d3827f
	.word	0xe9237c4b,0xc4ad126a
	.word	0xb3a2e546,0x4627e38d
	.word	0x4617b25e,0x89a1fcd6
	.word	0x574cc2a4,0x6eafe76c
	.word	0x907d5995,0x50d22dc5
	.word	0x52559372,0xbddf9e95
	.word	0xc74c7fa3,0xcd505423
	.word	0xc9632bb6,0xf1fc2bcb
	.word	0xcab529e3,0x9513caa2
	.word	0xfe156395,0xbf46af37
	.word	0x91a7d26d,0xc91a0987
	.word	0x326528ee,0x392786b6
	.word	0x9f46b25f,0xac8d1ea2
	.word	0x6fdd466c,0x74828e01
	.word	0xf1451b6d,0x5d4f7955
	.word	0xec9fece7,0x95263a64
	.word	0x7367e235,0x6e014595
	.word	0x9f2768b7,0xcb54f97d
	.word	0x9a3df7d9,0xb3520296
	.word	0x7dd04c78,0x663203aa
	.word	0x0f5f3668,0x5f307428
	.word	0xebf89384,0x868b8b83
	.word	0xff452c6f,0x17c39695
p2_local6_expect:
	.word	0x57ad8b4e,0x0000098d
	.word	0x7f1c37c1,0xfcab1577
	.word	0x0afdc622,0xa942fcfc
	.word	0x0c18deba,0xbffef8e2
	.word	0x0501d1df,0xc9f30cca
	.word	0x3fdae4f9,0x742acabc
	.word	0xd8962a3c,0xe4b06f4f
	.word	0xa4222518,0xb6913a22
	.word	0x7a14f03f,0x1f37745e
	.word	0xcae8a1fa,0x13491e58
	.word	0x2d160b2a,0x42a66d18
	.word	0xf1b28b67,0x89cdd3b7
	.word	0x0bf3cfc7,0x7846cf8d
	.word	0x4de93933,0x703e9d1d
	.word	0x4682ca69,0x1005d33b
	.word	0x19aa2712,0xfe9ce431
	.word	0xb9693e81,0x958977f1
	.word	0x3fd178a5,0x81672897
	.word	0x642b37bd,0xef54e714
	.word	0x7fa70b0a,0x7edc6caa
	.word	0x7990dc0c,0xd4798eb1
	.word	0xfa3eddc1,0xb9546fef
	.word	0xf3aa1b9b,0x294aaa0b
	.word	0x3637a048,0x229eb8de
	.word	0xf50897ec,0x325008c4
	.word	0x243ab6b8,0x94f0dc81
	.word	0x56b08aeb,0x2d048b9a
	.word	0x5a734f40,0x69c37ae6
	.word	0x2bd8e1fd,0xcd7acd8b
	.word	0x16ef3626,0x2b97ee49
	.word	0x52743e46,0x0379244f
	.word	0x7dd88251,0x7d163378
	.word	0xa575581d,0x0106bb6f
	.word	0x10b13878,0xf63be96b
	.word	0x87b1c165,0xaff33679
	.word	0xd2346b0b,0xb12303d1
	.word	0x7012fdf7,0xbebc6d66
	.word	0xac4a8778,0x25e7f27f
	.word	0xb9639f44,0x4be5c64c
	.word	0x3d73e61b,0x3b0d1af3
	.word	0x8b48a961,0xa6251d6e
	.word	0x4ef1c073,0xaf26731d
	.word	0xe118f23f,0x9ae13a1e
	.word	0x62f542b7,0xe568c6f2
	.word	0xaab37dcd,0x1053c4ec
	.word	0xae99d308,0x55c6ad43
	.word	0x68998c59,0x4c76b9a2
	.word	0x8fe30094,0x1462318d
	.word	0x7badb0b8,0x93e77ace
	.word	0x12514d34,0x49e39325
	.word	0xcd80a263,0xed9aeafe
	.word	0x79098733,0x701c3be8
	.word	0xbe8d734a,0x2a538be5
	.word	0xaf4a9ebf,0xd8fc4a1f
	.word	0x4dcf9e38,0x43b9d54d
	.word	0x0b820396,0x3c583081
	.word	0x12d17d35,0x3b6d607b
	.word	0x22e7aa7b,0x7895875d
	.word	0x72030823,0x9ed49698
	.word	0x6700a36d,0xaa83f4f7
	.word	0xca876a95,0x94857869
	.word	0xb4a2f565,0xdea7a14d
	.word	0xcf641de9,0x1d078f09
	.word	0x54b45a54,0xd04595cf
p3_init_registers:
	.word	0xb6a3ef00,0x369d7afa		! Init value for %l0
	.word	0xbfce9cff,0xe6a174a5		! Init value for %l1
	.word	0x44102100,0x674b0bb4		! Init value for %l2
	.word	0x7392d3ff,0xa40f1271		! Init value for %l3
	.word	0xf8cf18ff,0xa510d6ac		! Init value for %l4
	.word	0xadd0a4ff,0xf4d27731		! Init value for %l5
	.word	0xd5a49e00,0x4c9cc338		! Init value for %l6
	.word	0xef9f6e00,0x018b3c33		! Init value for %l7
	.align	64
p3_init_freg:
	.word	0x14211f3f,0x3ef9477e		! Init value for %f0 
	.word	0x1505b9a3,0xf8dd440d		! Init value for %f2 
	.word	0x23c6fb97,0x68473596		! Init value for %f4 
	.word	0x7fbc38c6,0x3bbcdebd		! Init value for %f6 
	.word	0x3b1196c3,0x3512add5		! Init value for %f8 
	.word	0xe2ba4774,0x07861984		! Init value for %f10
	.word	0x7416790c,0x51ab13be		! Init value for %f12
	.word	0x4a487859,0x1b01cadd		! Init value for %f14
	.word	0xe78f218d,0x22e0cc01		! Init value for %f16
	.word	0x0c85cda4,0x7341e08e		! Init value for %f18
	.word	0xd38509b6,0x5cdcd0af		! Init value for %f20
	.word	0x46fca10c,0xf1f75fc7		! Init value for %f22
	.word	0x6c215494,0x5acc351a		! Init value for %f24
	.word	0xb626c87e,0xa78a4db4		! Init value for %f26
	.word	0x99d02909,0xc4a1337c		! Init value for %f28
	.word	0xbc4910b1,0x10408c9b		! Init value for %f30
	.word	0xc86bf9f5,0x47fc494e		! Init value for %f32
	.word	0x1a49c88b,0x6e2e1a55		! Init value for %f34
	.word	0x8794b320,0x84a45e3d		! Init value for %f36
	.word	0x904fe450,0x4c821f3d		! Init value for %f38
	.word	0x1039cc80,0x7a8e8fad		! Init value for %f40
	.word	0x2b9c7155,0x00dbb3ea		! Init value for %f42
	.word	0x150d06f4,0x11542ec1		! Init value for %f44
	.word	0xa018efe0,0xcf6c0e43		! Init value for %f46
	.word	0x10b45679,0xa51af16e
	.word	0xabe7904d,0x6c5bf2e6
	.word	0x1405d6e8,0x9399fdfb
	.word	0x1e5f1508,0x33e24e9e
	.word	0x653966af,0x6873e288
	.word	0xc047f22d,0x1c13ef23
	.word	0x27e60838,0x66fdbe87
	.word	0xe7ae3e20,0x6c5f2c4d
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
	.word	0xffffffff,0x80000000
	.word	0x00000000,0x1281300b
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00001287
	.word	0x1027c971,0x9a800000
	.word	0x7a000e8b,0xfffff24c
	.word	0xffffffff,0xffffffa8
p3_expected_fp_regs:
	.word	0x00000000,0xffffffff
	.word	0x3ff00000,0x00000000
	.word	0x45175835,0xc4000000
	.word	0x41d37ca3,0x00000001
	.word	0x80000001,0x684734fe
	.word	0x00000000,0x684734fe
	.word	0xbf33c680,0xbf000000
	.word	0xbc4910b1,0x80000000
	.word	0xbc4910b1,0x41cdde6f
	.word	0xbf800000,0xbf33c680
	.word	0x3ff00000,0x00000000
	.word	0x00000001,0x00000000
	.word	0x80000000,0x00000000
	.word	0x00000001,0x684734fe
	.word	0x3ff00000,0x00000000
	.word	0x80000000,0x00000000
	.word	0xc86bf9f5,0x47fc494e
	.word	0x1a49c88b,0x6e2e1a55
	.word	0x8794b320,0x84a45e3d
	.word	0x904fe450,0x4c821f3d
	.word	0x1039cc80,0x7a8e8fad
	.word	0x2b9c7155,0x00dbb3ea
	.word	0x150d06f4,0x11542ec1
	.word	0xa018efe0,0xcf6c0e43
p3_local0_expect:
	.word	0x005f4000,0xdf800000
	.word	0x00000000,0x1281300b
	.word	0x0c78afac,0x4f215f24
	.word	0x276b1a2d,0x404af3f0
	.word	0xff1c15d9,0x3fce0db8
	.word	0x2f78b8e2,0x1ce74adc
	.word	0x6dfb9080,0xe352dd6c
	.word	0x11345c50,0x4b43a91e
	.word	0x891875c5,0xc20fab3f
	.word	0x15271ea1,0x416c0f5c
	.word	0xa1bfb9a0,0x5c5044c7
	.word	0x45730afd,0xe65df9f0
	.word	0xb9631352,0x6f64f394
	.word	0x1a4a73ae,0x65d5c020
	.word	0xc72b8e16,0xda324802
	.word	0x0b4d5687,0xef6136f0
	.word	0x0616fab1,0xa168d85b
	.word	0x0d59d023,0x601350c1
	.word	0x64e352b9,0xf92c3d10
	.word	0x000000a9,0x5f7a9b6c
	.word	0x8690aaa9,0xc6592447
	.word	0xdcbbf811,0x2347aca5
	.word	0xfffff344,0xf300b06d
	.word	0xd0ebbea8,0x358268c8
	.word	0xca5f5b2c,0x42f2130d
	.word	0x28c635fb,0x8252f492
	.word	0xaa1cd156,0x1474b94a
	.word	0x4e52ea24,0xf3fcf3a9
	.word	0x70df73f7,0x09f37d65
	.word	0xa2d9b918,0x4cd2694f
	.word	0x06ac0cf2,0x98ce7887
	.word	0x36d082b9,0x9e7e8dd5
	.word	0x1712bf33,0x2f73f8b5
	.word	0x83ffcb10,0xe790f643
	.word	0xfeff836a,0x0a3405dd
	.word	0xfed80d66,0xf0000cf1
	.word	0x689b5cf7,0xa6a6cbc3
	.word	0x0860658b,0xcc69ec5b
	.word	0x9200aeae,0xc2226579
	.word	0xefdb4b72,0x262a8c4c
	.word	0xdfdb1c50,0xe1c822f4
	.word	0x5e9828c9,0x14472886
	.word	0x111d8b24,0xf5276802
	.word	0xd201cdcb,0xe89193e3
	.word	0x9a66bedf,0x079eacd2
	.word	0xd30b8ab8,0x0f075148
	.word	0x07940b90,0xc43cbc8d
	.word	0xb3718bd6,0xeff02148
	.word	0xffffff9b,0xffff6e38
	.word	0x9b303ad3,0xa2ed0138
	.word	0xa3a7624a,0xb045b660
	.word	0xed8392f8,0xe87932f7
	.word	0x0600c3aa,0x7afc9721
	.word	0xeb32acd7,0x6a0857e9
	.word	0x1281300b,0x2a7f1c0a
	.word	0x809baef1,0x9935461a
	.word	0x9658fc4f,0x0ab72c91
	.word	0x87e3ea80,0x5d86f69b
	.word	0x67a481ef,0xf8486ff2
	.word	0x1f94797f,0xec32d152
	.word	0xb8a18200,0xba93a2cd
	.word	0x96fe969d,0x523ff53e
	.word	0xf94d8f8d,0xc651fc84
	.word	0x7a39741c,0x60f3894b
p3_local1_expect:
	.word	0xffa831da,0x000000ff
	.word	0x00b2ffff,0xfffffb27
	.word	0xdb810f65,0xb830e523
	.word	0x78f31018,0x08d9e14e
	.word	0x9ac01528,0x7ec470af
	.word	0x7647cb32,0x664409af
	.word	0x03364956,0xac3738be
	.word	0xb4585991,0x229c151e
	.word	0x26850a85,0xc2276e62
	.word	0xbd9326d6,0x000006cd
	.word	0xd8186e06,0x850960df
	.word	0x275b4a2a,0xa1b58c16
	.word	0xfe354149,0xf70a8e18
	.word	0xe974f613,0x6b47fd7b
	.word	0xce42b95a,0x3da35d9c
	.word	0x47108462,0xfc2571f6
	.word	0xe98299e6,0x25472e91
	.word	0x40becb9d,0x767c5af7
	.word	0x97673fb8,0xda43d962
	.word	0x19604bc5,0xdb754214
	.word	0xa139333e,0x9e45e82a
	.word	0xabc24094,0x5289b43b
	.word	0x208a8a7e,0x0525b99b
	.word	0x4dce1e51,0xc0689507
	.word	0x46c60a29,0xdf63f4f4
	.word	0x00000000,0x8059b30b
	.word	0x267741c2,0x39e66355
	.word	0x17127fa6,0x01211896
	.word	0x4dde24b6,0x2c70e2b6
	.word	0x19bab705,0x4098afda
	.word	0xd5823ec8,0x75cff706
	.word	0x426e0486,0x9a605d11
	.word	0x11127282,0xff3bbdf6
	.word	0x7e802ef9,0x22251c41
	.word	0xe67bbbcf,0x8d06c53a
	.word	0xd53458d3,0x00000000
	.word	0x078e8e30,0x2345cff0
	.word	0xfd2cebe2,0x7446c3b8
	.word	0x3b0e2c5f,0x474fef84
	.word	0x40aa5985,0x6501cff4
	.word	0x09da859a,0x8e9fdbe4
	.word	0x9f2bbf0c,0x88a1b43e
	.word	0x379eb679,0xd9beb611
	.word	0x914d56a9,0x22f23e6d
	.word	0xe2f2211c,0xf229388f
	.word	0xe4660f47,0xe1580b8a
	.word	0x101dc863,0xb397970b
	.word	0x77c4a084,0x20b87db0
	.word	0x9abc790a,0xe775e1c9
	.word	0x29e999c9,0x1ac349b2
	.word	0xa2a5ff20,0x9ecf382a
	.word	0xc27fd38f,0x8e9b5ea2
	.word	0x31594954,0x2aa5ba4a
	.word	0xffffffff,0xfffffe3f
	.word	0x7a0153a3,0x6546d584
	.word	0x9e5c3900,0x82e11625
	.word	0xe893e1e9,0xc595ec4d
	.word	0xc72b9bb6,0xf6d64294
	.word	0xe1996ba3,0x1fb30dbf
	.word	0x97be4076,0x05e238be
	.word	0x4488af73,0xf972e646
	.word	0x2ab710bd,0xd38580e8
	.word	0xa4081b94,0x2fb51aa7
	.word	0xcda2a041,0xef738c37
p3_local2_expect:
	.word	0xffffffff,0x0024e38e
	.word	0xff000558,0x00000000
	.word	0x5d86a630,0xb15572da
	.word	0x9f8e5a2a,0xeebc2cd1
	.word	0x7d5435e1,0xad1593aa
	.word	0x5d69dae0,0xc4795a9e
	.word	0x612e4eff,0x2af5cd55
	.word	0x2ff3abb1,0x4fa82dab
	.word	0xf1a6d2b0,0xbe8001bf
	.word	0x49fb6899,0xddedb1dd
	.word	0x7ed613cf,0x91c8642f
	.word	0xd15bf2d0,0x493ddaf7
	.word	0x00000bc9,0x1dce738f
	.word	0x51f76933,0x6438b22d
	.word	0x42706e12,0xc529db14
	.word	0x0a63814e,0xf64910d0
	.word	0x4a024687,0xcef2f2fa
	.word	0x14e97a97,0x5cff7329
	.word	0xa29b6cc8,0x66970bc9
	.word	0x119d4d7a,0xd3aedcc9
	.word	0x32bd17d8,0x55e6900c
	.word	0x2226d305,0x1fd31d7e
	.word	0x76ab7efc,0x35a7e09b
	.word	0xc5ea5472,0x9c431ce9
	.word	0x159442db,0x89b4219a
	.word	0x12e1fc6e,0x8fb70678
	.word	0x5407a1fc,0x1836df2f
	.word	0x27a5b16f,0x750506e9
	.word	0xb31104d1,0x7a084393
	.word	0x000000ff,0x9d76cb4e
	.word	0x3e8d1024,0x533699f5
	.word	0x27aea895,0x775e56ef
	.word	0x538d6b9c,0xe72a71c2
	.word	0xe1e1afed,0x49c1c542
	.word	0x5e45cd53,0x7f815160
	.word	0xffc010ca,0x237fb0aa
	.word	0x9a2a4a5f,0xa458d8f3
	.word	0xc8e83b8e,0xc70c08f9
	.word	0xd044ab4b,0x415867c8
	.word	0x18affc0d,0xea84d4b0
	.word	0xf613e721,0x42f8d335
	.word	0xa55bca4c,0x4e360878
	.word	0xe5f41a48,0x3a0df722
	.word	0x6a2ea481,0x445b036f
	.word	0x4157d069,0x908dae4e
	.word	0x9bc559e3,0x118792aa
	.word	0x54991956,0x9afd2d2e
	.word	0xc1b09b0a,0x3b2d798d
	.word	0xe1bd9630,0xcef2f2fa
	.word	0x6fadd099,0x496ffd7c
	.word	0x8857f36a,0x1bdcfcd5
	.word	0x6423c08a,0x7bafd24c
	.word	0x1566ba26,0x33cabf4b
	.word	0x70b186e2,0x00002225
	.word	0x91e599c7,0x8340683c
	.word	0xeb9657a5,0x99f4eade
	.word	0xf8ee15ac,0xcef59fd2
	.word	0xce05c8ab,0x252a7ac7
	.word	0xc957a5cd,0xb0ba86c1
	.word	0x6dfbef40,0x40478c2b
	.word	0xb654dc29,0x00000046
	.word	0x11b631eb,0x4dbe2004
	.word	0x0a953fff,0xf33e9985
	.word	0x0ab1bb29,0xfb271909
p3_local3_expect:
	.word	0xd300000b,0x0003015e
	.word	0xabf5f5f8,0x9b5d633c
	.word	0xa1e6e4ff,0x75018d90
	.word	0xdcba772b,0x0079aba6
	.word	0x00000000,0x07fff404
	.word	0xc131b41e,0xf69e5a90
	.word	0x60f500e4,0x0799d320
	.word	0xb49938b8,0x0b5b8223
	.word	0xc5e497a4,0xe89193e3
	.word	0x8b470a80,0xfe4607e7
	.word	0xba945634,0x87a0057f
	.word	0x4406b492,0xa36460f4
	.word	0xdc76ec7b,0xcb2416e2
	.word	0xb3e73138,0x6ba1b825
	.word	0x1127e988,0x9740ae89
	.word	0x11e706ce,0xb8f769f4
	.word	0xaa4d28aa,0x7c2eae82
	.word	0xd411f645,0xb1fa68aa
	.word	0x7dbd4cc0,0xf4a4bab9
	.word	0x8cd2ebce,0x3b1a8157
	.word	0xa2a4a381,0x3db63c62
	.word	0x00000000,0x42c14c8e
	.word	0x9daf9fed,0xcaf0e734
	.word	0x946bfc0b,0x5604054f
	.word	0x3fa341d7,0x5d457aa0
	.word	0xc030ff9a,0xabcaeeff
	.word	0x92f16c74,0xd728de8c
	.word	0xffffffff,0x5b2c472c
	.word	0x6a36421c,0xf8793796
	.word	0x7398c137,0x76f7b63b
	.word	0xff8c198a,0x597a97c0
	.word	0xdbfd9b18,0xc85bab0a
	.word	0xcb197bc0,0x28f7beac
	.word	0x00000000,0xfffff7f5
	.word	0x9f8ac7d2,0x7fcb654d
	.word	0x00000000,0x9935ec2c
	.word	0x75f28769,0x7a8b21e9
	.word	0x00000486,0xb32091c4
	.word	0x9fb2a234,0x3fc29a8d
	.word	0x00000000,0x35822a23
	.word	0xcc6fae23,0xde4ba74f
	.word	0xa1e7b86b,0x35822a23
	.word	0x5a631105,0xf30285ac
	.word	0x55e4adeb,0xe7f243ca
	.word	0x3b6c665c,0xf190e1f4
	.word	0x40991618,0x243ee403
	.word	0x5318f9bd,0x0b934178
	.word	0xb0e79008,0xc8d5d867
	.word	0xf6ad421b,0x3c846604
	.word	0xa0a831da,0x7aee11a4
	.word	0x30c45c99,0x44883aa9
	.word	0x5cee0fa9,0xd43ea638
	.word	0x0000ffff,0xffffffff
	.word	0x665c6b24,0x5a86158b
	.word	0xd3fa21e3,0x24252f74
	.word	0xda1e6776,0x9b7b55d7
	.word	0x1c19bf31,0x04a8b6b8
	.word	0x8e14d364,0x097ad5cb
	.word	0x84d611ad,0x7658d421
	.word	0xd0f82248,0xc309921c
	.word	0xb2037305,0x7192326e
	.word	0xc887923f,0x299cb78b
	.word	0x37db9f7c,0x9ff74b4e
	.word	0x28ba3a9a,0xcaa1b464
p3_local4_expect:
	.word	0xd5345f62,0xa05ff378
	.word	0xffffffff,0xfffff3b9
	.word	0x3edf5ad8,0x6db69a7d
	.word	0xd0f3a5bd,0x40fd780f
	.word	0x5727fea5,0x0f895beb
	.word	0x3e23aa76,0x962ca426
	.word	0x20aad2f6,0x2225fac4
	.word	0x228298fb,0x2a1d5efd
	.word	0x4f37a946,0xfe3a4d23
	.word	0x61102c38,0x09e6fca6
	.word	0x1352486a,0xf3c6a4f0
	.word	0xae3b5f7c,0xae754b29
	.word	0xcbb0fefc,0x7713ba05
	.word	0x9ec6c04b,0xe248e564
	.word	0xe57d9280,0x0409ad73
	.word	0x64ee3e12,0xfda33158
	.word	0x900ce3e5,0x0a9d0997
	.word	0x5331a121,0x849da10e
	.word	0x7c34bba0,0x430b72d2
	.word	0x75d5917e,0x61e173bd
	.word	0x946b7db0,0x4ccc0fed
	.word	0x88b9abce,0x210f399d
	.word	0xa0bfbdda,0xdce4f70a
	.word	0x530ca1c0,0x242485a4
	.word	0x20339b9e,0x52157a63
	.word	0x1e8c8fd9,0xdc21308b
	.word	0x6ff7e08f,0x847c16f6
	.word	0x47a7d039,0x77756228
	.word	0x68649ab6,0x19b61b24
	.word	0x629af086,0xd47217f3
	.word	0xb05b5572,0xcf22b20d
	.word	0x90b7537f,0x66cc28f8
	.word	0x919187ce,0x9e06057d
	.word	0xfbb6fdcc,0x41ec3aa1
	.word	0xaf46ef05,0x916c5cc9
	.word	0x28f36cec,0x901a4487
	.word	0x6d9a6886,0x72e17e87
	.word	0x9c6524ce,0x01d427ae
	.word	0x5ae3b777,0x8f292333
	.word	0x2ee6d4ed,0xc89c9174
	.word	0x0484d4c7,0x90daf563
	.word	0x6143a559,0x4da0c550
	.word	0xb47d341c,0xf061995d
	.word	0x56fca70b,0x7a2c8d4b
	.word	0x0e790b70,0x859a05de
	.word	0x9ca7884c,0xdee88cff
	.word	0x4d304748,0x3a7725d9
	.word	0xf601f27e,0x66eaae51
	.word	0x0958075e,0x8ded37da
	.word	0xfcc2fcf8,0x663ee296
	.word	0x3f19f663,0x5a3c8a9d
	.word	0x8b8efeb7,0x5ffedca0
	.word	0x5365169a,0x82bba046
	.word	0xf1d9d10b,0xe28d9e89
	.word	0x658bacb8,0x5a7ff228
	.word	0x32bd1890,0x7d362b1c
	.word	0xe08f5c8d,0x8df5efa6
	.word	0x8ff0d800,0xce67e2fb
	.word	0x9eeda70f,0x46c74f52
	.word	0x7ba511a1,0x17d9098f
	.word	0x52ad3051,0x761a9aa2
	.word	0x9d4e7bdb,0x700af88f
	.word	0x29746d8e,0x30fe2409
	.word	0x413fd591,0x8b5264ee
p3_local5_expect:
	.word	0x3b7bb77c,0x4b23d5e4
	.word	0x79f56d71,0xc3737ce1
	.word	0x6f32ff58,0xa03ef307
	.word	0x96edfe66,0xd50383b4
	.word	0x9eb79e6c,0x0b8557b3
	.word	0xa2935f42,0xe3bf605a
	.word	0xb0234d99,0xc0d2a9af
	.word	0x06657f69,0x9552fa49
	.word	0x7041fb52,0x8f8c29c3
	.word	0x699a964d,0x00772843
	.word	0xc12f7e17,0xb005f77e
	.word	0xf21ed0c1,0xe3e42634
	.word	0x907910a9,0x2f9c8834
	.word	0x45581029,0x5c591dfb
	.word	0x7d9ff392,0xa48d578d
	.word	0x4846d768,0x2de023c1
	.word	0x51437964,0xc177097d
	.word	0x76492ae8,0x794029f6
	.word	0xa63438ec,0xd398d5fd
	.word	0x965c7226,0x3c3e467b
	.word	0x0cdf5c39,0x9722b8da
	.word	0x8b3fc99e,0xaada36c6
	.word	0x556bdd81,0x58f6126b
	.word	0xda83faea,0x953f9284
	.word	0x62b603b1,0xc187de1f
	.word	0xffa0a4a2,0x71534c1a
	.word	0x440789c9,0x6017c3fc
	.word	0xb8278bc9,0xd18c5eff
	.word	0xce482a06,0xd4683006
	.word	0x76902a4f,0xa00593d4
	.word	0xb24ea81f,0x90974dda
	.word	0x5a8afa4d,0xd4889c17
	.word	0xce5d35df,0xbc29a7d8
	.word	0x517f2a6b,0x84cba490
	.word	0x61cfe88a,0xe9297844
	.word	0x0045a723,0xaf7fcc56
	.word	0x6f45727c,0x99f9cf8e
	.word	0x16a8ff08,0x4749f43c
	.word	0xb10049c3,0xe98d4851
	.word	0xedf36934,0xe465e72e
	.word	0xf56cbaff,0x42efabb6
	.word	0x657c1799,0x88b6301f
	.word	0x25fcb273,0x67d4cd57
	.word	0xe9af9e46,0xb5d5d2a0
	.word	0xec286caa,0xb2b9482f
	.word	0x29605732,0x8d8d369a
	.word	0x94e2dac2,0x133a6fe5
	.word	0x9102e635,0x0022068a
	.word	0xd25b591a,0x8bb4281f
	.word	0xbe8ed4e7,0x8475b477
	.word	0xa3ef00e2,0x78c7d210
	.word	0xf7cfcb1c,0xe7f2a5cc
	.word	0xed1d8d20,0x39af8138
	.word	0xc5f461a6,0x19cf8fe7
	.word	0xf872a5df,0xc5fc4e5f
	.word	0x732ed6df,0xbd367e68
	.word	0x8614ea4a,0xbffaf38e
	.word	0x27877247,0x9c37774b
	.word	0x54d18fd4,0x89c9c752
	.word	0x67ca6c8c,0x45cfc3f6
	.word	0xaa1c5459,0x07a1327e
	.word	0xe79c18e1,0x412a26a8
	.word	0x6f061531,0x81fbb374
	.word	0x59854c91,0x9983a62b
p3_local6_expect:
	.word	0x42b40925,0xcb22ac0c
	.word	0x75abb3be,0xeea6a455
	.word	0x2d324492,0x5bae8f62
	.word	0x02468ce6,0xc28036cb
	.word	0xb69e9527,0x1893d7e0
	.word	0xfd89b3cf,0xe6a9e2c9
	.word	0xb4a136b0,0x5bb3d232
	.word	0x8466d61a,0xbebc2b5c
	.word	0xd7d7dcd6,0x66fe922b
	.word	0x384c75bf,0x82459287
	.word	0x8d7a96e9,0x12b6ca50
	.word	0x32b7ea42,0x2f24db2f
	.word	0x0ef803e6,0x225a2f31
	.word	0x97526558,0xfcb2fed6
	.word	0x3a0914f8,0x6b0826c9
	.word	0x62f19805,0xd551d812
	.word	0x6505ab8d,0x36d85150
	.word	0x1432303e,0xa8b42cdd
	.word	0xb55e0a40,0x8dbd3397
	.word	0x03c292aa,0x738f6bcb
	.word	0xc12a5056,0x5b49b8e5
	.word	0x1844d9b7,0xef27d756
	.word	0xb9bbd5e4,0x48670942
	.word	0xc3a0d424,0xf7d0cd45
	.word	0x7b437911,0x3062d4dd
	.word	0x13a2324c,0x7f24e437
	.word	0x91bd77c8,0xe9b94cef
	.word	0xab775695,0x61b7fc62
	.word	0x2cf6b778,0xe76a6879
	.word	0x9e687ec4,0xbfd4711f
	.word	0x3cc51bee,0xe0f50952
	.word	0xbdc7a4b5,0x1c0119a3
	.word	0x5c65332d,0xd0e8ef16
	.word	0x7c71669a,0xff60fae7
	.word	0xd64f303c,0x64349b55
	.word	0x064586b1,0xc5720b5c
	.word	0x5cca5fc0,0xb39cef99
	.word	0xd3a7e8a4,0xd36c462c
	.word	0x5e308399,0x49fd1084
	.word	0xe0aa3a17,0x5ef3b214
	.word	0x6ee5bba7,0x1a4dfe9e
	.word	0xb862dcd9,0xea3d55e5
	.word	0xbb0995dc,0x8553b167
	.word	0x4e5cced2,0x79b04ed7
	.word	0x2bb3f619,0x09abea56
	.word	0xd5dd0d88,0xabaabbf0
	.word	0x157c9402,0xdca7aa4f
	.word	0xf8f5afdc,0x1a752bdd
	.word	0x83a5a1ae,0x2784cea5
	.word	0x66f13201,0x65cf9a1d
	.word	0x7636e6e5,0xd6ee86eb
	.word	0x9211d2e7,0x3694f34a
	.word	0xb092c512,0x9c9d08de
	.word	0x9f5e67a3,0xef3422fb
	.word	0x6e319fc2,0x9e1bcdbe
	.word	0xcec9000d,0xaab4b302
	.word	0x001b07f8,0x193460e3
	.word	0x8df82332,0x06c251b7
	.word	0x5befc604,0xa8a8764e
	.word	0x74b2d4c4,0x132f924c
	.word	0x6e7b7eb9,0x47f918d0
	.word	0xe3092d18,0xe536d302
	.word	0x25d60fb5,0x207bba59
	.word	0xdd782c5c,0xe794b55e

expected_common:
	.word	0x35170a3e,0x29310112,0x1d0b1a28,0x2d19250d
	.word	0xfffff72f,0x1b040b17,0x00000000,0x0000733d
	.word	0x2d153b35,0x3903193a,0x3c3b2c2c,0x24272706
	.word	0x03253508,0x2a041f16,0x0000818e,0x0000e974
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
	.word	0xc2a99d03,0xddcaeec9,0xb7080c37,0xf3e9dcb2
	.word	0xcc2d57e2,0xe53918ec,0xbffddce5,0xf227e2a4
	.word	0x6a945b6e,0xd264d1c7,0x850c6a4a,0x390a0b72
	.word	0x1ab7a2d6,0xf12ba566,0xc314abb1,0xb7d9b57c
	.word	0xd75a1ffe,0xaa1557f6,0x6399850b,0xacea7c83
	.word	0x96d83e6c,0x8d13d7f8,0xb77d7492,0xebaf2c59
	.word	0x1c25b2c1,0x6ef7b265,0xaf4b8336,0x24eb2dd5
	.word	0x2c039311,0x1675deef,0x1478e280,0x74f325d7
	.word	0x399290d1,0x7d05e794,0x93873cd6,0x6c83c24b
	.word	0x55e0e586,0x46199413,0x8bcbd8a0,0xc7894338
	.word	0xdbade58d,0xce0f9fac,0x62f42d55,0x109941d0
	.word	0xf53a7c5c,0x34bc85c9,0x9deb454b,0xbc96d39b
	.word	0xf0b2218d,0x2012a15a,0xc25619e6,0xbf80d465
	.word	0x4204f1a8,0x7ec0a8e4,0xe7043085,0xd4b28daa
	.word	0x3240adda,0x491015b6,0x2decf098,0x89e67855
	.word	0x9c52de65,0xb6faf6b2,0x01821b1e,0x1536b00e
	.word	0xf27c395d,0x89a2a486,0x58c4dc36,0x2ab47e5d
	.word	0xb7fad8d8,0x44d2d395,0x942ca3ad,0xd682b1ca
	.word	0x514868e5,0xa8a11e08,0x094c2740,0x2519033c
	.word	0x8bc987b7,0x290ed470,0x622d239c,0xcd6a21e3
p0_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local1_begin:
p0_local1_start:
	.word	0xcb46575d,0xf6ab580f,0x015e7bad,0x9ef32d10
	.word	0x3cb02dae,0x1e19913e,0x86ff1391,0x15252d26
	.word	0x249b7140,0x003e29da,0x9395d3a2,0xfe3aca4d
	.word	0xa14ae14e,0x7a9b6af8,0x245303ad,0x5d1d9e98
	.word	0xfc03a46e,0x90316c6d,0x4c23f65d,0xf48baf51
	.word	0x1ff0c9f2,0x24784d1e,0x6c441ef8,0x4b62348e
	.word	0x56d21b60,0x497e7551,0x4008c917,0xae6d55aa
	.word	0x98f569be,0x040d01b2,0xbd93a729,0xa9f48915
	.word	0x87557d52,0xed53e833,0x33658700,0xec0215ba
	.word	0x30490453,0xfc7766d5,0xc71d6ebd,0x44480704
	.word	0x7eed7fab,0x761d0200,0x996e77f4,0x59e64d88
	.word	0x20d388cd,0xe79f975d,0x6cef4dc4,0x8f5fba0d
	.word	0x4c8014d4,0x28bd7fa6,0x8b6c40a4,0xe3eca4a6
	.word	0x54d2b41a,0xb532cb84,0xdc57da9e,0x0dba7cf5
	.word	0xb58856de,0x3717c06c,0xcecdffe0,0x36871a04
	.word	0xe4eadb8e,0x96d86923,0xe73a5353,0xd20935c9
	.word	0xc9704cc1,0x1f5888d9,0x4a31370e,0xb9761419
	.word	0x551b178f,0x386e3469,0x8add91e7,0xe836ac5a
	.word	0x41a5edc8,0xc2747bcc,0xdabd40b5,0xbd39a565
	.word	0x0c5fba86,0x16d17246,0x855e5922,0x36a665bd
p0_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local2_begin:
p0_local2_start:
	.word	0x12f4def1,0x75f1665c,0xf947aeb1,0x746df82e
	.word	0x9573563e,0xb388a3a2,0xae40ce1a,0x9c5e2fc6
	.word	0x5650596e,0xe8a2730a,0x65c22726,0x62d429fc
	.word	0x622c64ef,0x14e31da6,0x6ffcced0,0xa128b4ca
	.word	0x08707580,0xc508e818,0xf4be9228,0x36fd4d7c
	.word	0x98753658,0x5fdfc083,0xd2806936,0xe89390eb
	.word	0x952b53fb,0xa0342f53,0x47520cc4,0xc548de95
	.word	0xdc6c010e,0x17cdf5b6,0xee02900b,0x8e402aa1
	.word	0x0f2289a6,0x336f74fc,0x53a9057f,0x9da8bf35
	.word	0x81789bd7,0x2881e889,0x6212d221,0x6c189012
	.word	0x10cf17ea,0x59bd5dfd,0xfb044f74,0x84150ae1
	.word	0x47ff7acd,0x893092c1,0xd2674637,0xff80d864
	.word	0xb188fd9b,0x4f18568c,0x2df742d9,0x4e6c8671
	.word	0x13aef859,0x6406541e,0xf922406f,0x41e862d6
	.word	0x242bc1b5,0xc6ce0a87,0xffdbfe25,0x8ef0da4b
	.word	0xa6898340,0x1fb7f5ab,0xb6df414f,0x3ae079f5
	.word	0x6d22ff13,0x4f5b02db,0xd2b78b4c,0xb9ea1607
	.word	0xe85cdd03,0x9bade7d9,0x2ddd23e4,0x6e01f836
	.word	0xa0e59755,0xaf23e634,0x12008f8a,0x8aba9177
	.word	0x746658ef,0xe583c233,0xe86f29e6,0x0bd1baf5
p0_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local3_begin:
p0_local3_start:
	.word	0x12953151,0x38797fa5,0x7a4680c2,0x1a38767b
	.word	0x6d701cd2,0x9689c695,0x3a353a09,0x9e88f71b
	.word	0xd6f7c37e,0x93385e47,0x1c16a88b,0x2cc86f16
	.word	0x6658397f,0x06ec1024,0x69a5a071,0xe9df30fa
	.word	0x616faadb,0x4a07cc6d,0x98690296,0xa40aa2f9
	.word	0x2ad9ad41,0xb9eb7e0a,0xcaef197a,0x5a256788
	.word	0xe907faa7,0x9efc715c,0xa6442cc1,0xee677a3f
	.word	0xd122af53,0x4d259a90,0xfa8490dc,0x5542d787
	.word	0x454734c9,0x42e045b5,0x1d39467c,0x93ed2588
	.word	0xf0d6737c,0xa527f367,0x3eb25c97,0xf1b9abef
	.word	0x043f7e9e,0xe389c3f2,0xfcea08dd,0x1a8b61e1
	.word	0xadaa4d94,0xadd4db75,0xcda06b7b,0x57a9b888
	.word	0x09f726f1,0xfd87dca4,0x99641c4b,0x9a063e0b
	.word	0x73a82fbf,0x34ba851e,0x1af8dfc2,0x8fc2f416
	.word	0x3e426c78,0xa491e3c1,0xf11615f9,0x548bfdc5
	.word	0xaf85a093,0x814a299d,0x86650338,0xe00ce2f2
	.word	0x681f83e6,0x886ef8ba,0x8cb5aa65,0xe1cd7acf
	.word	0x72b0e072,0xf299aa52,0xe899fa1b,0xdeb3b602
	.word	0x98febd8a,0x4e23eefa,0x423d3acf,0x805a5e04
	.word	0x72ef228e,0x67416070,0x14d39148,0x792800ce
p0_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local4_begin:
p0_local4_start:
	.word	0x529d55a2,0x8ad88cb7,0x448d5504,0x6a036015
	.word	0xd1e046b6,0x625ea7da,0x70347e80,0xa75ff499
	.word	0x7672c4b8,0x6919544d,0x9ede91fc,0x271f3fbe
	.word	0x7125468d,0xa10a483d,0x21480381,0x932025cf
	.word	0xbc97cfe7,0x508d8571,0xa7510d49,0xe15c0cce
	.word	0x10737df9,0x9e9abbd8,0xed89b219,0xb608ef51
	.word	0x266cbcac,0xdb43fbc3,0x50d75011,0xa385c798
	.word	0x9c554d3e,0x08bddc44,0x8f951e45,0x01318fa3
	.word	0xa7c60559,0x38d487b7,0x1a4e5dfb,0xe94ca0c2
	.word	0x8432244f,0x1a4c9c0e,0xd471218c,0xf6d74d1a
	.word	0x9f74123e,0xf48cfd80,0xe75e22c0,0x5e4fb5ce
	.word	0xee82866e,0x68a1f67d,0xd52bd605,0x12467c40
	.word	0x4e7412b6,0xad01bca1,0xe3f334bd,0xd9409a46
	.word	0x440dacbe,0x3d147f15,0x5b6e0f95,0xbb46d0a2
	.word	0x6493598d,0x74094a03,0xd5492c3b,0xbe78d30b
	.word	0x3af0bfc3,0x34d11bbd,0x882ea66a,0xb1792b26
	.word	0xbd4cb496,0x160b19c2,0x801aa50a,0x715cfe23
	.word	0x56313f19,0x5a74cd52,0x1eb34a7d,0x5e63dfa4
	.word	0xc768988a,0xeb59b11b,0x72f0dcb0,0x9c751419
	.word	0x06de6777,0xce5e6bb3,0xbe81e3cf,0x8356410f
p0_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local5_begin:
p0_local5_start:
	.word	0xa88a8474,0x85056ef1,0x0f91ff4c,0x6af7cf9e
	.word	0xcff1e98d,0x587a3675,0x663d9d63,0xc700a155
	.word	0x42674eda,0x421acf1e,0x8ce9b989,0x031ae49f
	.word	0x6eccf332,0xbdd4eaf4,0x157fb4d9,0xa7adb59c
	.word	0x96c9a503,0xa4e0a320,0x563bf446,0xbc2bdbd9
	.word	0xd34123b2,0x032e43d5,0xadf56b26,0xbb7ba545
	.word	0x14fa5be3,0xf28458b6,0x88b54ced,0xfd1b8f99
	.word	0xc082ad12,0x3d1c3f9c,0x834bdd48,0xb639911a
	.word	0x13518546,0xdeed741a,0x9dc075f8,0xc22c1ebf
	.word	0x79d806e2,0xbc575bbf,0xfcf02d1f,0x6f2b0f29
	.word	0x3302d528,0x3e0b24ce,0x8103f455,0x86a4ce15
	.word	0xf3967655,0x9501a214,0x1a5835c9,0x99f31869
	.word	0xcd0c3d48,0xcdffcc3c,0x5b822477,0x2535658b
	.word	0x3f1511b0,0xba235802,0xe170d56f,0xcce4a271
	.word	0xc293622b,0x5d7b40cd,0xa4b472c7,0x83359248
	.word	0x6d04ef73,0x9bdd65ba,0xdd0f432a,0xbc5ab18d
	.word	0x4385528b,0x688aa0e0,0x472dbca2,0xd11f9812
	.word	0xc82cf178,0xcd533c8f,0xfdadf1f9,0x6d0511fc
	.word	0x00f00af1,0xac80da9d,0x7b76a956,0x33144120
	.word	0x8f2cc620,0x461d84ae,0x97519c95,0x337b9754
p0_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local6_begin:
p0_local6_start:
	.word	0x36c7caa6,0x94e11ab3,0x0e143d25,0xf4960ab8
	.word	0x57d0ea28,0x8b0a13a5,0x66c5ec86,0x264bf190
	.word	0x42367c17,0x62a52b71,0x8bb99fc0,0x69aef85b
	.word	0x71879b76,0x2aebbaf0,0xebc40d18,0x59a202d3
	.word	0xb8285b47,0x55c257bc,0xdd708f24,0xa716c7c2
	.word	0x7515ea0f,0xa0a77c05,0xe344f8bf,0x35397146
	.word	0x66d3ea72,0x799c7fb4,0x174a55d1,0xff0b0046
	.word	0xc09bc4c4,0x6f6ec889,0x53e423b4,0x0c4c029b
	.word	0xc785c3a3,0xf738d6c7,0x8dfb716c,0x7af447b4
	.word	0xd1d91cf2,0x58de6750,0x87be5a4e,0xf22de8c7
	.word	0xe078e12d,0x7989c6b3,0x769fc42b,0xb4d8be67
	.word	0x4fade890,0x675ec68c,0xd11e37cc,0x8d4ddebf
	.word	0x797597de,0xa36d5fb7,0x9a4232b0,0xdf522065
	.word	0x10edee25,0xf4ef4f93,0xa64347ab,0xf012b0b4
	.word	0x680bd5b6,0xd44a5278,0x4a7a0d61,0x858f9810
	.word	0x6e6b526f,0x84957fd5,0x42ff1d43,0xcec3092b
	.word	0x57bbfe4e,0x99c19eb6,0x1532ec77,0xfe5d3feb
	.word	0x56d780ec,0x98db50e4,0xf31f808d,0x3cf7a829
	.word	0xca77ce77,0x809b2980,0xb18450bd,0xeb16fd5b
	.word	0xa43b7c33,0x585b318c,0xb2a3b166,0xb3a984a9
p0_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local0_begin:
p1_local0_start:
	.word	0x0525857b,0xe1e75c6c,0x348bcced,0xcf7f7aee
	.word	0xe82f54e7,0x9246aee6,0x06038f7c,0x84e87c0c
	.word	0xfd1686c2,0x6f7aae93,0x580ceb03,0x104d0c15
	.word	0x4c4430c0,0xaeb8c60d,0xff45831f,0xb7fade05
	.word	0x125cb97a,0x9abe53a6,0xcb22e364,0x8532cd3a
	.word	0xe8a03115,0x7d47dd7e,0xaab7af1b,0x04e23803
	.word	0x5977782e,0x4989d541,0xddca7f7a,0xeb250403
	.word	0x6dc83382,0x23d0ea5d,0xe3579149,0xa174b09c
	.word	0x65482635,0x7d50832c,0x8b716a56,0x785f56e4
	.word	0x579b8cc7,0x441f9f1d,0x3a31242d,0xfb82c49f
	.word	0xe1c3db97,0xc3a2ef2d,0x7a2f8638,0xc2ea976b
	.word	0x33c7db02,0xe87ae81b,0x4a11922b,0xac33e3af
	.word	0xc00d88f9,0x439c7079,0xc79cb202,0x7237cb9b
	.word	0xfff969c1,0x680cfb6b,0xeb70cd58,0xa5f3b80a
	.word	0x3086eccb,0xeddfc120,0x5a4b4229,0x26027f7d
	.word	0xf6626c54,0xb9f2e316,0x559e3ab0,0xf979ee40
	.word	0xe13fef01,0xa0eda399,0xf5d21ab7,0xa0a1752c
	.word	0x8991a3ec,0x35d58be7,0x19590582,0xea5c0814
	.word	0x05b5ef09,0x02444531,0xa14ee180,0x05048ebd
	.word	0xb2d65a67,0x96e1d7f4,0xd530223a,0xbc960602
	.word	0xe26c2aed,0x54af96ff,0xfcbd8af0,0x71ab757d
	.word	0x8c3906e3,0x7e7e3041,0x6f9d57d6,0x17ec1a12
	.word	0xaa97a0ab,0xa1bdb372,0x51221772,0xdadcf1e0
	.word	0xa6a86563,0x882c9bb1,0xe57eaec8,0x5a6b9c99
	.word	0xa38d684f,0x6b85385a,0x612dc203,0xbf87f77b
	.word	0x3a39045c,0xa248fa6b,0xabda0673,0xf2b571f2
	.word	0x0f7c58c1,0x717a6209,0x382df9b3,0x4eb2392d
	.word	0x2931691d,0x32659254,0x0aaf6652,0x103765fb
	.word	0x99a10105,0xfbe4c980,0xf067460d,0x5812992f
	.word	0xf3fa7d98,0xe35f84bc,0x0a18cbd9,0xb4563149
	.word	0x5b2c3c12,0xc2aeacae,0xefbf415c,0x8991265d
	.word	0xa7276759,0x2c2e64df,0x8641723f,0xea66cbac
	.word	0x58f617d4,0x1be54904,0x302438e7,0x159c0dba
	.word	0x4e4e8a49,0x02530939,0xe1fb95fe,0xd45887f5
	.word	0x3a601569,0xa88ca682,0x8fb232d5,0x0186d623
	.word	0xc95c80a7,0x21740f51,0x23a2c5ef,0x786b8be2
p1_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local1_begin:
p1_local1_start:
	.word	0x0d07c390,0xa763720d,0x2a197008,0x53bdb5a7
	.word	0xd30a35f8,0xf538790c,0x8fb629d2,0xcc44f0cb
	.word	0x0cee9988,0xd47c954b,0x0537e0b4,0xe4071d5f
	.word	0x7a0367b9,0x31f640f9,0xa5b061b9,0x84e0c29d
	.word	0x48ce9512,0x263a9546,0x098cec87,0x7ec9619b
	.word	0xea67fc12,0x17897290,0x9429e77c,0x39a0cca9
	.word	0xc375a6b5,0x748d116a,0xb8757c7c,0x645a4f78
	.word	0x98e94567,0xddf4a3ae,0x35d071b7,0xd67f4149
	.word	0xef71ac96,0x61c2cbc4,0xc002299e,0x2746a4bd
	.word	0x11349206,0x9e0d4bb4,0x141736c9,0x9f285ae8
	.word	0x92cd4532,0x86a250a9,0x902d2cbb,0x48268fe5
	.word	0xf5fc8a92,0x84e8c503,0xc92d007f,0xecea23f4
	.word	0x1f3d6d1c,0x7f6dcbb2,0x487eb118,0x1b3111ca
	.word	0xc5ea221d,0xc6949581,0xad645bbd,0x91c52865
	.word	0x8cd0397b,0xeedeaf9e,0x1ee63baf,0xcc5d3a99
	.word	0xa1730337,0xecc5534c,0x8e8e8f28,0xb19cd7cb
	.word	0x5c50bfd8,0x6c57dc3f,0x6833fa8d,0xd2d8856f
	.word	0x60642b49,0xa67f18f0,0x6bd62eda,0x1b78c915
	.word	0x9cf726c4,0x00cbea2c,0x9552f6d7,0xee07d2b6
	.word	0xbc8963c1,0xfec1a8c4,0x10255702,0xfca0546e
	.word	0x5455738d,0x007feaab,0xbf1b3fb8,0xd722d884
	.word	0x2207fa0a,0x1550fa07,0x9f81126a,0xef834d7a
	.word	0x084c9f70,0x6457f5e3,0x5215c24b,0xc0df7d96
	.word	0x2b804f9b,0x34900a55,0x8358442a,0x49ba1d57
	.word	0xd2857112,0x13002df1,0x6599fd9c,0xc91ba54b
	.word	0x456fc8ca,0xafda3d0b,0x08fe564e,0x2cbc86c3
	.word	0x1c6e060b,0xed779e87,0x22d8d07f,0x230b5922
	.word	0xe9278378,0x2efd1a17,0xc35f861c,0xd9423dfa
	.word	0xefc485f1,0xd170b2d8,0xce203681,0x46aecc75
	.word	0x1c32a2d5,0x5a066e80,0x76b3c1c6,0x96b5b382
	.word	0x317a524a,0x5f3409e8,0x713ac207,0x00059d44
	.word	0x28d9ace2,0xe036b842,0xf78abbca,0x4111584c
	.word	0xe3c5985a,0x4ffc85ae,0x32a20976,0x35a88956
	.word	0x282321a6,0x45758716,0x025cf6f2,0xe222c4b9
	.word	0xdddcb4c0,0x45198841,0x94456dd9,0x340513de
	.word	0x0fc87bb3,0x941a96ef,0xa11d592a,0xe4626765
p1_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local2_begin:
p1_local2_start:
	.word	0xe59e6689,0xbd9cedca,0xd85cebc7,0x2f859c56
	.word	0x039d473f,0xb993f000,0x8447c7b9,0x47a1c5b7
	.word	0x71f7f4ac,0xc479954d,0xda338c69,0x7a383d72
	.word	0x664ab64c,0xac88b02a,0x733dfb52,0xb79a46f3
	.word	0xd4cd5edb,0x4788f0a5,0x24093edc,0x92cc491f
	.word	0xf381a391,0x1594ae01,0xe62c3a82,0xc923788e
	.word	0xe427ef57,0x9dfcabc1,0xd091e8ec,0x6026dbcc
	.word	0xf64e4948,0x889d4670,0x682761ee,0xfa2ad6b5
	.word	0x38f7db20,0xbe32e3cc,0xbba6a716,0xe6b021b7
	.word	0x872dfd6b,0x1f5a9693,0xc916e050,0x74886cdb
	.word	0xc0d90fbd,0xf93862a8,0x298884b0,0x44f2eb82
	.word	0x0ae2e40b,0xc2137e53,0x6a528d15,0xd016b723
	.word	0x4aec2a63,0x4f8ec511,0xfa4392bb,0x178fffc2
	.word	0x9672e3a1,0x43820014,0x5da9afd6,0xb87b0bb9
	.word	0xc0da132c,0x899b991d,0x1b389e36,0xe64cc135
	.word	0x8f887ff2,0x04ac037b,0x43942130,0xcbc021fd
	.word	0xde9759ed,0x0dda0e2e,0x52dd9d77,0x8f0191d0
	.word	0xfdc50465,0x84da284b,0xb894a954,0x4b47794f
	.word	0xac13b546,0x7c503bdd,0x01db06cb,0xbc874d9d
	.word	0x730697ba,0x0e892425,0x65cd2f96,0x1f0a083f
	.word	0x66fabc10,0xbff6ee6d,0x9c7dca3d,0x46a3f321
	.word	0x98125a61,0x781d66dd,0x94dd6510,0x9e4cde57
	.word	0xd9214ef8,0xc62586d2,0xe75807e7,0x24349ca1
	.word	0xa04106a8,0xb841b9ac,0x3aba04c8,0xc9f69a83
	.word	0xb583c178,0xd6524aa1,0xbcd489ed,0x08b4f857
	.word	0xd0e81bae,0xbdf46f64,0xa5d56361,0x4b956815
	.word	0x7de74890,0x9d48a2be,0x3fd5a117,0xf647e958
	.word	0x5959aec6,0xe082435f,0xddcda3d0,0xddc3b9e7
	.word	0x949cf6b2,0x20f3a8fe,0x558c648a,0x252bbe8d
	.word	0x8bb2528b,0x9a18de57,0x0853be2d,0x36d6ea86
	.word	0x44c5fcf3,0xa23f7634,0x207b8304,0x30b8346b
	.word	0x55886cd2,0xab752a58,0x48d225ec,0x078c240b
	.word	0xf87ade58,0xfac2e107,0xe24d99db,0x429ad18f
	.word	0x60409f2c,0x141b4e65,0x1ffcc811,0xcaf91079
	.word	0x3328a8b9,0x4b7b2667,0x5e38a9be,0x55f32394
	.word	0xcc0dacb4,0x0d2d6b53,0x023d3e34,0xae3122a4
p1_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local3_begin:
p1_local3_start:
	.word	0x37017cc8,0xff02c55d,0xf0f11240,0x393f1d0b
	.word	0x2cd24b1c,0x26185f97,0xaea766ae,0x9fab1267
	.word	0x1a3f0c02,0x30b1990d,0x582a2109,0x801fbcd0
	.word	0x56216542,0x115e7bdd,0x04f15a69,0x5a56cc2c
	.word	0x9ea65733,0x5bd13c04,0x475297f3,0x786e0cde
	.word	0xf5fa57d2,0x953f7c9a,0x3bc1ddb3,0x7c76cd23
	.word	0x6f8822fd,0x889bea7c,0x46352f28,0x506444c1
	.word	0x10deda76,0xa6be5638,0xb8c40c88,0xb97e6110
	.word	0x5e0c336d,0x4d03e30e,0xabe13425,0x3bbf8c30
	.word	0x2ae7f1a1,0x5725b2f8,0x0d08216c,0x0f94e9cb
	.word	0x7379456b,0xb23606f0,0x8b80e114,0x2ad1dc1d
	.word	0xc0e8f690,0xe2f14329,0x25fffdf9,0xd60630f3
	.word	0xb5e2350f,0xaf896887,0x102ddf6d,0x17f2610b
	.word	0x6ce50fa2,0x60bf9284,0x2bfdbd9f,0xd09d2ff7
	.word	0xd5366eb6,0x1b8e703e,0x84d5a2f9,0xd0388675
	.word	0x409ada11,0xd5da0542,0x3bc863f9,0xd8486391
	.word	0x15d44ab7,0xfbade95c,0xca01e4b0,0xf2581233
	.word	0xa0e6b7ab,0x68c1fa60,0xbbe06ce6,0x5d53e416
	.word	0xeee61d1f,0x8bb77e28,0xe21099f0,0xac232261
	.word	0x0eaf565c,0x8a04502d,0xf6910c19,0x00db9add
	.word	0xc26b3d57,0x9b45e334,0xebb27521,0x4a08e0f9
	.word	0x814a523f,0x11ecbad7,0x4be011d0,0xe3f4f303
	.word	0xe6b32122,0x86599b47,0xeec4aba8,0xe30bc8f4
	.word	0x13bdc0ec,0x31326c9a,0x49bc7700,0x24900675
	.word	0x2eb7bbb1,0x8183ff3e,0x53e0d232,0x0215645f
	.word	0x12f62cd0,0xfa7bb3b7,0x42a80da4,0x1b905090
	.word	0xbf504ba5,0x20fbacf8,0x9add8020,0xa816a8f3
	.word	0xbc7f1fae,0xf3e10492,0x48d7ee25,0xa717a9a5
	.word	0x36436ad2,0x3158c829,0x6e0e431a,0xeb5eb5d5
	.word	0x2cfaa6ff,0xd1caaf2b,0x6c9da207,0x5cc5a0a9
	.word	0x8e6139f2,0xffa8473b,0x787583ae,0x9d7399a0
	.word	0x431735db,0x0827a3cb,0x1dc7901a,0xd25eadb8
	.word	0x8a45aeab,0xe164699c,0xd131b808,0x3e333447
	.word	0x2284fed0,0x161cfcd3,0x71c6bcaa,0x27576613
	.word	0xc476db67,0x8a3cb677,0x79c68d9f,0x2987fa57
	.word	0x6661a4ce,0x17665692,0x0b9e42a3,0xc574e38f
p1_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local4_begin:
p1_local4_start:
	.word	0x4c9254d4,0x76e5d930,0xf3e1b30a,0x0a770fb9
	.word	0xca83a113,0x0ab16c8c,0xc2a6871f,0xc04ce2c7
	.word	0xe5f183f6,0x572c8ea5,0x23171350,0x204c93c2
	.word	0x71b6a157,0x3c3e416d,0x9679395e,0x0bf8fdde
	.word	0x191eee26,0xd2e27482,0x002d7675,0x3181aeb9
	.word	0xcb2667e0,0xa3d4bbe2,0xf8e91e5a,0x5dbbeeb1
	.word	0x449d5d0c,0x4b4bb036,0x89dd4dbb,0xc1768289
	.word	0x13802d25,0xd370aec5,0x4a88a23b,0x0e21b2b7
	.word	0xf8268c32,0x4ad4d912,0xd3fb11f4,0x0dc2804f
	.word	0xed270b71,0xaf183574,0x04a2dd7c,0xed829bbc
	.word	0xebb318fc,0xb899b025,0xa55d528a,0xd5bfc6ca
	.word	0xfe811444,0x5023b3f4,0xa8896b73,0x25963d61
	.word	0xa74ae984,0x5ff11b4d,0x01b4d53e,0xc81d39ad
	.word	0x27b6632e,0xbcba5bfb,0x139059c6,0x350cb4d3
	.word	0x2e87314a,0x4939859a,0xbc90b607,0x6ca5c1a4
	.word	0x0d48a9d4,0x0e2a2ccb,0xc28734c3,0xe4933c6c
	.word	0x8feec11f,0x373a74a0,0x395386d6,0x711cb1cd
	.word	0x9e583f8e,0xe7c67e2f,0xe03281bf,0x180c9e57
	.word	0xb8d934da,0xa0ea139e,0x64374a75,0xba750d0d
	.word	0xe682233b,0x22635350,0xd2b74f24,0x46c7b026
	.word	0x63b20536,0x14328fe0,0x152fc133,0x6ea5b2b1
	.word	0xaec797f5,0x8d67c355,0xbb1e7902,0x99a39ade
	.word	0x621f359d,0xfa37939e,0xb6de399f,0x4f07061c
	.word	0x70e8ddc3,0xa43f21f8,0xb9d3beea,0x6e67618a
	.word	0xe06832e4,0x13dd2b6d,0xa31c0e18,0x9862e098
	.word	0x69501ade,0x8b8f9a22,0x9a4e741a,0x3685909c
	.word	0x7bf3835d,0xde362deb,0x78ffa1c5,0xa684b296
	.word	0x420b64f4,0x852229cf,0x245ae16d,0x13cc347f
	.word	0xe50321a4,0xfaf244a9,0x2963514a,0x1a976de9
	.word	0x0d134630,0x85c7dce8,0x01e33d8d,0xa4957102
	.word	0x2f3aabbf,0x9ed01027,0x437066d5,0x0b30fdad
	.word	0x312253ec,0xae2ddbc8,0x3508d3f6,0x1edd83ec
	.word	0x669f9741,0xdcba1455,0xce8aec56,0xa2e0a49e
	.word	0x73b152a9,0xb379fbc8,0x0596af1d,0xbb0d0e97
	.word	0x9cb2aeb5,0x5b0a04ea,0x8c96f919,0x9fdba368
	.word	0xfcf7ba2b,0xdfb1758a,0x9c89a151,0x1db2ccbd
p1_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local5_begin:
p1_local5_start:
	.word	0x94c88a73,0x6829a7d6,0xb45c5717,0x225951a5
	.word	0xa5ed104b,0xbd512292,0x47652ad1,0xd9af4c23
	.word	0x321be2e2,0xa80e4b55,0xb4ba1ac7,0x367097c0
	.word	0x85159cde,0x89f8296e,0xeb08a5ef,0x3a2320ee
	.word	0x2ac327ef,0xeecbe01f,0xecee9ca4,0xc504c8ce
	.word	0x92560b71,0x3ec0ce68,0xd00af455,0x7c2e1053
	.word	0x9d772bd5,0x331c514e,0x951fe4ea,0xf343a590
	.word	0xe11e42b7,0xf400471d,0xff7d94f8,0x6131b229
	.word	0x98e56cb0,0x1e498d4f,0x96bfe1ad,0xcad48d44
	.word	0x4b0533de,0x4b57bba1,0xf49e7c37,0xfb0f87ca
	.word	0xa5a9331d,0x5783b3e8,0xbd1bb086,0x5d3884f1
	.word	0xc2872e57,0x4a2ca5e4,0xeeac533a,0x86afd3b8
	.word	0xcf17e175,0x4b01843f,0xde4baf44,0x5eb86961
	.word	0xf938214f,0xcbcd2335,0xa11e8ab7,0x44f8a112
	.word	0x6ec9f837,0x7ca1407d,0x1d8ea2d4,0x6c36e4fb
	.word	0x391032fc,0xc81f1adb,0x691a27cc,0x2624e5a2
	.word	0xb48d21fa,0x10a280a4,0xab35d785,0xf97bab41
	.word	0x687e6628,0x82d82a3b,0x258c7bd6,0x8a062194
	.word	0xc649e268,0x7a2f54cc,0x2e80e5bf,0xa4cf8f28
	.word	0x04615a07,0xba348ed3,0x31994e37,0x276c5955
	.word	0xb9f2d536,0xf842fd90,0xea79be9f,0xc2268ab0
	.word	0xa67da6e9,0x399970a7,0x046f5e78,0x84cac26d
	.word	0x1f3e9d6d,0x7463cedd,0x8bf245a1,0x7bc755c8
	.word	0x8cc54fc9,0x7542373b,0xbd54be90,0xcba6bf11
	.word	0x8cbc4c2b,0xfc96c962,0x0c246ff4,0x09b32732
	.word	0x7983d47d,0xe3e155dc,0x7c6d7ff4,0x89fcb3f7
	.word	0x9f1f3c23,0xccb6388e,0x4600a6fa,0x13a45b0c
	.word	0x91ec1ff2,0x57227563,0x1f447239,0x1138b149
	.word	0x3250e516,0x4497e78e,0x283a7bbe,0x3c759d07
	.word	0xee3fd539,0x799a94d2,0xd18d2dce,0x6b52074f
	.word	0x982f299d,0x65cfd396,0xcd38e914,0xf1ebab3a
	.word	0x14f18cea,0xdbb40208,0x8871d512,0x8643cfa7
	.word	0xe7bc1825,0x016fa01c,0x55f1204e,0x5844a6e2
	.word	0xcf28370b,0x1355192b,0x8de8d006,0x989e8c8d
	.word	0xee83aaf1,0xa5418850,0x630d5f18,0x83d76452
	.word	0x3af59573,0x41417552,0x420162b5,0x6efc4956
p1_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local6_begin:
p1_local6_start:
	.word	0xe952ab5e,0x6875ad93,0x8c2690f6,0xf607ff78
	.word	0x5d29265e,0x4c3b3b5e,0x9fd1c213,0x816ffdde
	.word	0xd635cf2b,0x8094df08,0xc8e54556,0xf32a1ce5
	.word	0x349a0cc0,0x6197cc24,0xe8f5f9df,0xbb298cdb
	.word	0x2787f8c2,0xd38fae9a,0x1090ae08,0x03863f48
	.word	0x357d14fd,0x67666113,0x5503f1b4,0x920e4921
	.word	0x94442ce5,0x0e4010fe,0x2407360d,0xf6d924fd
	.word	0x6e8039d0,0x1d6060e0,0x6828638d,0x877de56d
	.word	0x64622729,0x6b330728,0xf5aa6ada,0x28269f38
	.word	0x73d9cd17,0x40d7b147,0x7386883d,0x678bdd4a
	.word	0x5f53ac33,0xc41f0b1f,0x5665586b,0x00e723cd
	.word	0x59b1abbd,0xba55214b,0xe670d248,0xaf19647a
	.word	0xd6f2b640,0x6d5eed83,0x093cf4b3,0xadf1bd11
	.word	0x58946747,0x9392a0b5,0x76aceba2,0xccbd3028
	.word	0x76457887,0x7d4f75d5,0xddd80ae3,0xa9397f2d
	.word	0x2afd6690,0x4c1390cb,0x76c94052,0xf062276a
	.word	0x5dabc828,0x0201b4ad,0xc605a308,0xfbab8185
	.word	0x887260b7,0x42aca295,0x5d3696f9,0xd8afeeae
	.word	0x8dc00784,0x498062f2,0x2080e726,0x33a1a9a7
	.word	0xe24f0099,0x7928826e,0x8657e9b9,0x477e365d
	.word	0xaa88b105,0x480374dd,0x52df6429,0x2202bfbe
	.word	0x23d649bd,0x94e2003a,0xe39535b0,0xc2ca5e97
	.word	0xd955e32c,0xd1156a3b,0x6fc4f669,0x21114388
	.word	0x5bc24e15,0x3d981eed,0x2d24ee4f,0x844ea710
	.word	0x640be975,0x7273a7e2,0x6ef5cc2f,0x06f5127f
	.word	0xcdeafd93,0x666fce63,0x1ddf5c21,0x076d4537
	.word	0x6c0e5aa3,0x0f85b91f,0xdc7f43f5,0x4eb1854f
	.word	0xedb867be,0xbffc0479,0x54fe3ac8,0x3e792a61
	.word	0xb22c4df6,0x766971bc,0x6baebb64,0x52558492
	.word	0xdf65cb94,0xe3c1edfb,0xebd1c8af,0x89697ca3
	.word	0xecd71525,0x7d8bbc7f,0x052d0e0a,0x71dc9f85
	.word	0x9db396cc,0xeb186d15,0x6aaa5e07,0x7010b451
	.word	0x456ea001,0x5120b236,0x0407a56c,0x845990e7
	.word	0x1c221743,0x7f6d17a0,0xcc419334,0x9a620046
	.word	0xeefe0004,0x7a226a30,0xe49cad0f,0xf9d3645f
	.word	0xc237b21e,0x9c583766,0x4c053b00,0x2e5ed2ae
p1_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local0_begin:
p2_local0_start:
	.word	0xc19e4c3a,0xedea0482,0x75ab3868,0xdacee5b7
	.word	0xf638b9c9,0x151c32b2,0xe2bf3765,0x7bb4b3cb
	.word	0xd57480b7,0x3ae064c5,0x0657f3b9,0x94972229
	.word	0x5ecd3a88,0x25ee8559,0xb4a44db5,0x70b448ec
	.word	0xab3f0d18,0xf0236eae,0x0a3ccbe3,0x9f22183d
	.word	0xcd4a54b8,0xedaa1385,0x48017ee4,0x23fabf48
	.word	0xdbc8c6fb,0xefb527fd,0x07fa2838,0xd321409a
	.word	0xacd2fbc5,0x50968df0,0x644bf77e,0xb6e4138a
	.word	0x8d18612c,0x24e14ab8,0x7cb89c1e,0x6d48f33c
	.word	0x61bf7525,0x12c754d3,0x65aee6f2,0x23f38fc5
	.word	0x0d8c190a,0x065ef602,0xf82d7c6a,0xb8eb47c3
	.word	0xfaa1500f,0x632c02ca,0x1fe42d31,0xe4742de5
	.word	0x71bd044c,0x976077ec,0x944b8a32,0x1e0c3820
	.word	0x48cb030b,0x171e0a01,0xd258c4d0,0x5ee18fcb
	.word	0xdc3a1c09,0x5efaf2dc,0x20edb629,0xc14edf83
	.word	0x3b8b4094,0x55b315c6,0x2fb258e1,0xd63ad822
	.word	0xc7a4dd48,0x8d71efd8,0x75f10817,0xb969bcb2
	.word	0x34ba90ec,0xa1ff9d40,0x85a7077a,0x45551156
	.word	0x7769e7f8,0xcd1e25d7,0x730ed353,0x8b731559
	.word	0xe58ffbe7,0x9ab5778c,0x8213074b,0x1795a6b5
	.word	0xa106d8dc,0x3d2a662f,0x86a13a26,0x0261c716
	.word	0x52ed6535,0x235da7af,0x6656f161,0xb4334c12
	.word	0x3d257678,0xa4263eda,0xc8c95ec3,0x41679952
	.word	0x6995d1d4,0xae7c2e32,0x788597cc,0x55371713
	.word	0x12d473d5,0x39d9781d,0x9fa53b84,0x6ee1128e
	.word	0xa4354eca,0x0f0e2768,0x5f63dd62,0xf8c001c5
	.word	0xe8779a84,0x0cafe5c6,0x9927b873,0x2cab6312
	.word	0x0048adb7,0x6c0f4487,0x19eb970c,0x9049a34d
	.word	0x552d1bfd,0x9061e35d,0x213e33dd,0xd5c84d9a
	.word	0x9bfba188,0xf5168813,0xafa9525c,0xa47de9c6
	.word	0xbf58e557,0x01a2b728,0x1f89df85,0xca398c52
	.word	0x9c50af5e,0x138422e1,0xc30d0054,0x0c50a2cd
	.word	0x40f4392f,0x14695f91,0xb82124dc,0x857ac713
	.word	0xf281572a,0xeef4b66a,0xf36a3360,0xae81eb84
	.word	0x0297c206,0x020536c0,0x67758016,0xe7408b57
	.word	0x3f5d25d1,0x6512ba07,0x813741da,0xdcfc57f3
p2_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local1_begin:
p2_local1_start:
	.word	0xa45c5018,0x01d1d4d2,0x72551e96,0x4254b59d
	.word	0xe5428b8e,0x90c12d09,0x71d98208,0x6ca7d14b
	.word	0x6535215c,0x08a714ea,0xeb892e0d,0xd864327e
	.word	0x69ab49d6,0x68cf6056,0x54bd582d,0x495042bb
	.word	0xb002c34e,0x6526a47b,0x378b2e79,0x60633ac2
	.word	0xb487ca88,0xd2eb8352,0x2dcd489b,0x958925ef
	.word	0xee74bc30,0x3c215db9,0x7c4b81d7,0xbb7feec8
	.word	0x469d69d7,0xc87bf2f8,0x15878a22,0x0ba5dbea
	.word	0x5f3ae261,0xc4c71214,0x8bac361d,0x11953042
	.word	0xfcf855e3,0x62753bf5,0xc9552731,0xf610a5b6
	.word	0x8bd850be,0x66b5a15e,0xdad28fa6,0xfa578e83
	.word	0xa0b90f65,0x705e0002,0xd30ad24e,0x3b9c5878
	.word	0xb5ea15b1,0x19df5eaa,0x06097ce4,0xd13308f3
	.word	0x5b3f2fc0,0x19e47f45,0x82cfb08c,0x761adcb2
	.word	0x0a664aca,0x31eab060,0xfaac6756,0x85709e4e
	.word	0x9d17887e,0xe3cadba4,0x68036fdc,0x0c088d7c
	.word	0xdb332de9,0x08d0e4bb,0x9d257e12,0xce790e14
	.word	0x4ceaee96,0x561c35a3,0x5ba025f5,0x4494946e
	.word	0xe09dab45,0x4a2d2c31,0x46b70e52,0xcf270518
	.word	0xf0b633b0,0x2f9b6a9d,0xe22ea5b8,0x2bb8f5ba
	.word	0xe04ad260,0xb6b83f4f,0xda3fc704,0x7dbf7425
	.word	0x7db59c9e,0x1005e89d,0x47c4c05e,0xb7f13bd3
	.word	0x288cf13a,0xeef0f2c0,0xf7d8b944,0xd386625c
	.word	0x2d1f9354,0x0bebade0,0x08ebf714,0x48f421ce
	.word	0x659ae390,0x7c0b0147,0xaaf4a4c2,0x9fa6410e
	.word	0x66c6dab6,0xc828ba13,0x423b8477,0xc7223698
	.word	0x2a6dc0cb,0x5495af3d,0xb86b2410,0x3f674163
	.word	0x5873c494,0xbcfbb551,0x4237fb5e,0x08cee0bc
	.word	0x8a2ec91d,0x22cc2962,0x13b436f1,0xc193071f
	.word	0x7e04801d,0x116c9adb,0xa20f919a,0xd7be1626
	.word	0x95d0a34c,0xc18b79d5,0x01c69ddd,0x20851ea1
	.word	0xca60febc,0x79f2bb79,0x875a0cb2,0xa94deca9
	.word	0xf0bd1159,0x05881624,0x384bb19c,0xada16f76
	.word	0xb94d8c6a,0x790cc024,0x07e8b6d0,0xb0956f8e
	.word	0x86fcdadc,0x297dbeec,0x9a376d6e,0x07315f86
	.word	0x310b9e01,0xac13def0,0x61652703,0x55713e84
p2_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local2_begin:
p2_local2_start:
	.word	0x89d92f9a,0xe8c30e4f,0x3688bfbd,0x4d6ba292
	.word	0xd40152a1,0x88b9da6e,0x98939c21,0xaeb25181
	.word	0xc3da9098,0xab728bcb,0xfd62e62e,0xeb6cabe7
	.word	0xa4a2337f,0xd53ed026,0x0b18aa16,0xb53c3340
	.word	0x638a60db,0x73da93db,0xc21f707e,0xd37d7c32
	.word	0x7cb2ce7b,0x44d4267b,0x1928ee55,0x182b7b8a
	.word	0x73aa4bb2,0x9ffea5a3,0x2f833bc2,0x2c37be8b
	.word	0x80ad652a,0x207711f2,0xae9bf2a1,0x20a575b1
	.word	0xa6f61762,0x5f0452b5,0x090e77ba,0x16b1e15f
	.word	0x807f24a8,0x36f94972,0x6fbb12b6,0xbd26288b
	.word	0x3282f652,0x6595a3e9,0xc5a699f8,0x99214275
	.word	0x5744bd86,0x33845924,0x734d33d9,0x5b712f63
	.word	0xa68f9482,0xd3b29b7b,0xbe5c6620,0xc1043392
	.word	0xd0240755,0x3ccdc3e6,0xbc3820e1,0xfcacb914
	.word	0x1d941ae0,0x66457867,0x5adcb052,0xac1c4bfc
	.word	0x1c2fea83,0x9acccdbf,0x5ca98c75,0x937f0c98
	.word	0xfc952b5b,0x71e76d15,0x44bfc8ee,0x90550583
	.word	0x1d1ac70c,0x5ab9d0f0,0xe2f6da9c,0xc9779520
	.word	0xfc026d02,0x67857755,0x25a15ca3,0x48d9e16c
	.word	0xd03822b1,0xf0748502,0x9765c06d,0xde5b817f
	.word	0xdfbc038e,0x6fedf443,0x220e699b,0x29d778e0
	.word	0xa9ebc811,0x5ca74c94,0x48358315,0x85861169
	.word	0x2cd99b7b,0x2bb7f8cb,0xc1935c10,0x57388d84
	.word	0xb2c617c2,0x8c9e0c49,0x22ab88e1,0x209395f8
	.word	0x07dff97c,0x67d9cecc,0xac458102,0xd25deddf
	.word	0x3c2ce13d,0xf0654760,0xa01b4168,0xd08ebe09
	.word	0x472c3ce9,0x9cd72e02,0xa5f0abcb,0x1cb5ae5b
	.word	0x52e9860d,0x508a04fc,0x1315f7cc,0xd42b92be
	.word	0x5a399830,0x2d9720c0,0xdcce89d7,0x6bb55606
	.word	0xbc849652,0x94d775c6,0x70d34890,0x575d855e
	.word	0xb279f1e3,0x5a2e84b3,0xbf13e4e6,0xd971f5db
	.word	0x8a1a5c13,0xb8f8a363,0xd8f1a9ec,0x894e2ba8
	.word	0xbb806f47,0x38562413,0xf57c7420,0x2ff70be9
	.word	0x3b840d09,0x7449ebf5,0x8376e7b6,0x5d3fa18f
	.word	0xf4eff5f2,0x39f84ce5,0x02bad0ff,0xf99bb4bf
	.word	0x16bc60fa,0xa19a895b,0x4402ef53,0x400355da
p2_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local3_begin:
p2_local3_start:
	.word	0x40a3042c,0xdfc4394e,0x0dc3ce87,0x564e70b7
	.word	0x4d84fa3b,0x4a365c14,0xfe0e36ec,0xff48af05
	.word	0xdb1c7c52,0xbfaffefd,0xd5f11646,0x3ee8a0ac
	.word	0xe9571d8f,0x6bd61979,0xe5309591,0xc049a7d7
	.word	0xd2d95289,0x19dcfd20,0x49c6c07a,0x94af9529
	.word	0x0fd979f4,0xfc7a7b21,0xd1df47ef,0x82f6e5ef
	.word	0xdc1cb79e,0xac887dfa,0x1d10ddc4,0xbebc601e
	.word	0x77f06f36,0xd12ea64f,0x7fe27978,0x31b56e24
	.word	0xe1edb0cc,0x0c700251,0x2a23f03b,0x665229bc
	.word	0x103503f8,0x752fb0af,0x10f205a3,0xdaac7469
	.word	0xbfec7b4a,0xc5bc9e66,0xa69d9d89,0x77cf6021
	.word	0x8cda93bb,0xee6a07e6,0x7adb4f97,0xfb641df4
	.word	0xccfb45ee,0xa4e6f6ea,0x14219f3f,0x600df678
	.word	0x24c51624,0x64574edf,0xf9f038e5,0x5b8ca209
	.word	0x472ed3eb,0x10478c1d,0xad6f7d73,0x8860c814
	.word	0x7a47a62f,0x230a5101,0x4207ce65,0x8f1ea26a
	.word	0x29a2081a,0x612aa01d,0xf1ae171b,0xd0f61e71
	.word	0xfc767add,0x4b720928,0xb0fb38b8,0x87516832
	.word	0xa410a321,0xffc41cb8,0x6eed202e,0xf68cfa03
	.word	0x86a350e6,0x8312a004,0xd26d15da,0xcf47283f
	.word	0x8bc67ee3,0x538a884e,0x6c6b7211,0x45b9a5de
	.word	0xb2af1270,0xee9e3db1,0x17983218,0x198533cc
	.word	0x97b3e8b2,0xb3ffc52d,0xd654d270,0x7998c2df
	.word	0x270d5815,0x6497bf22,0x23b9e752,0xb43b76c3
	.word	0x9738bb7d,0x085e9193,0x9ca7bab2,0x21ebb21d
	.word	0xc86676f8,0x75db466b,0xdd185351,0x7882c369
	.word	0xc62538dc,0xa3ee41c5,0x503992e7,0x6fea5ca4
	.word	0x4db3a2e7,0x73c20d2b,0xe8520788,0x7428bace
	.word	0x999e6b21,0x821cfe74,0xd8463ed4,0x8c79b395
	.word	0xe5d729e0,0x8e81897d,0xe33f1299,0x46bafe56
	.word	0xbbbfc97d,0x90b8b082,0xf203551f,0x42fef5a1
	.word	0xfdcab7ad,0x4af6e6e0,0x6f671abc,0x4bc67b5a
	.word	0xcd80c667,0xb5470fbe,0x7d75a516,0x3b3f4eb2
	.word	0x9b605035,0x4d6adaf8,0x5c7d14ca,0x8b76681f
	.word	0x7470bea3,0x2385831c,0x3f38a850,0xaa009262
	.word	0xefcc180b,0xe74db5c8,0x30db869c,0x5743ac58
p2_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local4_begin:
p2_local4_start:
	.word	0xe5c56ed0,0xcdfd4790,0xf6b7b3e1,0xfd127531
	.word	0x4ee459e6,0x1eeeb0b3,0xdf884b54,0x48ab8ef5
	.word	0x0d646f84,0x78ae4957,0x15528bde,0xbd13e5aa
	.word	0x8a886905,0xf99f9a00,0x8cca9878,0x3364c35e
	.word	0x17038b89,0xe8e9762d,0xfdf85794,0xb2dbca0c
	.word	0x5a814f2c,0xaee618da,0xe679a369,0x5d1f9c53
	.word	0x74b88766,0x871019d1,0xf6fe2202,0x2f8016cf
	.word	0x26618c25,0x732abe89,0xc052d96a,0x893a0e46
	.word	0xdb055c76,0x2834b5fe,0xfe7a51f2,0x05cae8c5
	.word	0xb582af69,0xc19089a0,0xac11b58e,0x06786680
	.word	0x67cc8bdd,0x02123739,0x95e6b34c,0x5f5993c7
	.word	0x47fc9998,0x5e77b56e,0x1a48d9f9,0x5ee49155
	.word	0xf90e6029,0x4ebb6ada,0xf5561fdd,0x9a66c87a
	.word	0x283a2e1e,0x44254a59,0x58c7104d,0xcca07240
	.word	0x4c9ab22a,0xdd40202a,0x1c03f382,0x740b83c7
	.word	0xddfab742,0xe2d489bc,0x1f3d28ab,0x4461c3ab
	.word	0x67703865,0x62dee8af,0x3f2b0cc4,0xa6b1cda9
	.word	0xc9d2adc4,0xcb12162e,0x2585d9bc,0xea6f3fbc
	.word	0xcc44e6c8,0x29999bbd,0xa6c29e18,0x5b59bcc4
	.word	0xbe91f9db,0xf03e3116,0xce847f91,0x7a76bfda
	.word	0xc6356a26,0xbbaa98f9,0x49bd96f3,0x0c4f7cac
	.word	0x9f675bc5,0x4baea7ca,0xda8306a8,0x1db4dce9
	.word	0xbca0668d,0x1614d0ba,0x266931ab,0x447fc8ff
	.word	0x5178807e,0x206418ac,0x785998f6,0x03b12686
	.word	0x95447190,0x51626ea6,0x1251ea82,0xb8be18bb
	.word	0x629df98c,0x0cf070c9,0x192ea02c,0x94f44725
	.word	0xfff04719,0xf21c9afe,0x2e97063e,0xa3f0974b
	.word	0xf5847533,0xab2e156d,0xae5f51de,0x88ddc706
	.word	0x87265033,0xf7316551,0xf675667f,0xde63addc
	.word	0xf4f7e632,0x43d9aa60,0xdfd42ab8,0xeb23c837
	.word	0xae35b3c6,0x9547d856,0x71e47eb3,0x82762401
	.word	0x7ab94218,0x8c0bcf8f,0xd10b2f42,0x8e6cd044
	.word	0x2502b370,0x17bdf12b,0x2bdbdfde,0x7498cf86
	.word	0xd46ecca4,0xd955e89f,0xca6b57a6,0x2961272b
	.word	0x34669c63,0x352eb88c,0xb0829703,0xc09a57de
	.word	0x629a158c,0xcb047c2c,0x5be90468,0xd853e08d
p2_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local5_begin:
p2_local5_start:
	.word	0xf57accc2,0x1ef6fa8a,0xa35d0fa3,0x51b6314c
	.word	0x6ee6ef0c,0x717b7514,0xd97c8893,0x0f18c9b6
	.word	0xf351ea81,0xa2d7df3d,0x00c6612d,0xe91a437a
	.word	0x4149724d,0x60bbef7c,0x780e0b7f,0x64a057a4
	.word	0x842790d7,0x949a3582,0x25e6e3d5,0x5718168f
	.word	0xb5869ddb,0xa3996906,0x95cf9c6f,0xbd2273e7
	.word	0xc047e009,0xe1417784,0x238a6f04,0xe94c6bfd
	.word	0xe76a8c87,0x3303a7a1,0x5f368f1a,0xa8afbae7
	.word	0x2d7665f4,0x8e4aa06b,0xf50c7178,0xc8199dca
	.word	0x60850afe,0xbca316a2,0x13cb17ee,0xb97784bd
	.word	0x8b50292e,0x9e3d162e,0x51a7d23f,0x0f073344
	.word	0xc11c9c05,0xcf0ea0cd,0xdea6f54a,0x91752f31
	.word	0xb32d7afe,0xe7be9567,0x852ab9b7,0x1c83b1aa
	.word	0x5ad5d763,0xd831ebe3,0x11b89f15,0xd6841c68
	.word	0x399a9842,0x4b8d4856,0x8996fce2,0x403f9f29
	.word	0xc78edb9f,0xd3727487,0x13e1e2cb,0x37f64ba8
	.word	0xd9924bf4,0x3f837c60,0x84d418a2,0xb1e06302
	.word	0x321ef216,0xaa02f216,0xa9f7e926,0x7813cf30
	.word	0x192c0075,0x5f611e6b,0xaa362f81,0xcb1d2dff
	.word	0xa22967ea,0xc3d072ea,0xe26d4b5e,0x17b73620
	.word	0x7baff003,0xb6d3827f,0xe9237c4b,0xc4ad126a
	.word	0xb3a2e546,0x4627e38d,0x4617b25e,0x89a1fcd6
	.word	0x574cc2a4,0x6eafe76c,0x907d5995,0x50d22dc5
	.word	0x52559372,0xbddf9e95,0xc74c7fa3,0xcd505423
	.word	0xc9632bb6,0xf1fc2bcb,0xcab529e3,0x9513caa2
	.word	0xfe156395,0xbf46af37,0x91a7d26d,0xc91a0987
	.word	0x326528ee,0x392786b6,0x9f46b25f,0xac8d1ea2
	.word	0x6fdd466c,0x74828e01,0xf1451b6d,0x5d4f7955
	.word	0xec9fece7,0x95263a64,0x7367e235,0x6e014595
	.word	0x9f2768b7,0xcb54f97d,0x9a3df7d9,0xb3520296
	.word	0x7dd04c78,0x663203aa,0x0f5f3668,0x5f307428
	.word	0xebf89384,0x868b8b83,0xff452c6f,0x17c39695
	.word	0x5341983b,0x4051801f,0x16584976,0x363275ed
	.word	0xe20ffec3,0xc2f354a9,0x9eff1c6b,0xedd76d94
	.word	0x5397635d,0xd741ab81,0x171d8b4f,0xf6fe714f
	.word	0xbf77b1e5,0x8c2d3e25,0xab64a560,0xc28726a6
p2_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local6_begin:
p2_local6_start:
	.word	0x95c9a8f8,0xce7f2241,0x7f1c37c1,0xfcab1577
	.word	0x0afdc622,0xa942fcfc,0x0c18deba,0xbffef8e2
	.word	0x0501d1df,0xc9f30cca,0x3fdae4f9,0x742acabc
	.word	0xd8962a3c,0xe4b06f4f,0xa4222518,0xb6913a22
	.word	0x7a14f03f,0x1f37745e,0xcae8a1fa,0x13491e58
	.word	0x2d160b2a,0x42a66d18,0xf1b28b67,0x89cdd3b7
	.word	0x0bf3cfc7,0x7846cf8d,0x4de93933,0x703e9d1d
	.word	0x4682ca69,0x1005d33b,0x19aa2712,0xfe9ce431
	.word	0xb9693e81,0x958977f1,0x3fd178a5,0x81672897
	.word	0x642b37bd,0xef54e714,0x7fa70b0a,0x7edc6caa
	.word	0x7990dc0c,0xd4798eb1,0xfa3eddc1,0xb9546fef
	.word	0xf3aa1b9b,0x294aaa0b,0x3637a048,0x229eb8de
	.word	0xf50897ec,0x325008c4,0x243ab6b8,0x94f0dc81
	.word	0x56b08aeb,0x2d048b9a,0x5a734f40,0x69c37ae6
	.word	0x2bd8e1fd,0xcd7acd8b,0x16ef3626,0x2b97ee49
	.word	0x52743e46,0x0379244f,0x7dd88251,0x7d163378
	.word	0xa575581d,0x0106bb6f,0x10b13878,0xf63be96b
	.word	0x87b1c165,0xaff33679,0xd2346b0b,0xb12303d1
	.word	0x7012fdf7,0xbebc6d66,0xac4a8778,0x25e7f27f
	.word	0xb9639f44,0x4be5c64c,0x3d73e61b,0x3b0d1af3
	.word	0x8b48a961,0xa6251d6e,0x4ef1c073,0xaf26731d
	.word	0xe118f23f,0x9ae13a1e,0x62f542b7,0xe568c6f2
	.word	0xaab37dcd,0x1053c4ec,0xae99d308,0x55c6ad43
	.word	0x68998c59,0x4c76b9a2,0x8fe30094,0x1462318d
	.word	0x7badb0b8,0x93e77ace,0x12514d34,0x49e39325
	.word	0xcd80a263,0xed9aeafe,0x79098733,0x701c3be8
	.word	0xbe8d734a,0x2a538be5,0xaf4a9ebf,0xd8fc4a1f
	.word	0x4dcf9e38,0x43b9d54d,0x0b820396,0x3c583081
	.word	0x12d17d35,0x3b6d607b,0x22e7aa7b,0x7895875d
	.word	0x72030823,0x9ed49698,0x6700a36d,0xaa83f4f7
	.word	0xca876a95,0x94857869,0xb4a2f565,0xdea7a14d
	.word	0xcf641de9,0x1d078f09,0x54b45a54,0xd04595cf
	.word	0xacc77e0a,0xc8463295,0x369deb4a,0x4479ecbb
	.word	0x1e0305ef,0x674d6c18,0xeac7e379,0x9e00ae28
	.word	0xaf4fea4c,0x782d2bf7,0xddfcbf69,0x68f7b7b8
	.word	0xfdb4ace1,0x34d8ed5c,0xc7ecda6f,0x038d59fe
p2_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local0_begin:
p3_local0_start:
	.word	0xbadc185a,0xbb84edf3,0x9c2e44ca,0x54b24f14
	.word	0x0c78afac,0x4f215f24,0x276b1a2d,0x404af3f0
	.word	0xf81c15d9,0x3fce0db8,0x2f78b8e2,0x1ce74adc
	.word	0x6dfb9080,0xe352dd6c,0x11345c50,0x4b43a91e
	.word	0x891875c5,0xc20fab3f,0x15271ea1,0x416c0f5c
	.word	0xa1bfb9a0,0x5c5044c7,0x45730afd,0xe65df9f0
	.word	0xb9631352,0x6f64f394,0x1a4a73ae,0x65d5c020
	.word	0xc72b8e16,0xda324802,0x0b4d5687,0xef6136f0
	.word	0x0616fab1,0xa168d85b,0x0d59d023,0x601350c1
	.word	0x64e352b9,0xf92c3d10,0x4bb7d8c0,0x5f7a9b6c
	.word	0x8690aaa9,0xc6592447,0xdcbbf811,0x2347aca5
	.word	0xf0d1bab4,0xf300b06d,0xd0ebbea8,0x358268c8
	.word	0xca5f5b2c,0x42f2130d,0x28c635fb,0x8252f492
	.word	0xaa1cd156,0x1474b94a,0x119e0e84,0xf3fcf3a9
	.word	0x70df73f7,0x09f37d65,0xa2d9b918,0x4cd2694f
	.word	0x06ac0cf2,0x98ce7887,0x36d082b9,0x9e7e8dd5
	.word	0x1712bf33,0x2f73f8b5,0x8346cb10,0xe790f643
	.word	0xfeff836a,0x0a3405dd,0xf7d1e584,0xe19825bc
	.word	0x689b5cf7,0xa6a6cbc3,0x0860658b,0xcc69ec5b
	.word	0x9200aeae,0xc2226579,0xefdb4b72,0x262a8c4c
	.word	0xdfdb1c50,0xe1c822f4,0x5e9828c9,0x14472886
	.word	0x111d8b24,0xf5276802,0xd201cdcb,0xe89193e3
	.word	0x9a66bedf,0x079eacd2,0xd30b8ab8,0x0f075148
	.word	0x07940b90,0xc43cbc8d,0xb3718b2f,0xeff02148
	.word	0x6852d35b,0x3e6d1c7f,0x9b303ad3,0xa2ed0138
	.word	0xa3a7624a,0xb045b660,0xed8392f8,0xe87932f7
	.word	0x0600c3aa,0x7afc9721,0xeb32acd7,0x6a0857e9
	.word	0x1281300b,0x2a7f1c0a,0x809baef1,0x9935461a
	.word	0x9658fc4f,0x0ab72c91,0x87e3ea80,0x5d86f69b
	.word	0xeb4bf103,0x0c1f155f,0x1f94797f,0xec32d152
	.word	0xb8a18200,0xba93a2cd,0x96fe969d,0x523ff53e
	.word	0xf94d8f8d,0xc651fc84,0x7a39741c,0x60f3894b
	.word	0x29e2f8c8,0xa91d95fa,0x84cb4136,0x20240ea1
	.word	0xd1da1a19,0x064cd7ff,0x440b4205,0xd76c3529
	.word	0x428a3990,0x63a81ccd,0x15ec1906,0x453bfb48
	.word	0x8de08c02,0x10e9398a,0x295d94e7,0x083dfbeb
p3_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local1_begin:
p3_local1_start:
	.word	0x3a73eff8,0xb1be224e,0xad76cf25,0x47227882
	.word	0xdb810f65,0xb830e523,0x78f31018,0x08d9e14e
	.word	0x9ac01528,0x7ec470af,0x7647cb32,0x664409af
	.word	0x03364956,0xac3738be,0xb4585991,0x229c151e
	.word	0x26850a85,0xc2276e62,0xbd9326d6,0xe10a4cf2
	.word	0xd8186e06,0x850960df,0x275b4a2a,0xa1b58c16
	.word	0xfe354149,0xf70a8e18,0xe974f613,0x6b47fd7b
	.word	0xce42b95a,0x3da35d9c,0x47108462,0xfc2571f6
	.word	0xe98299e6,0x25472e91,0x40becb9d,0x767c5af7
	.word	0x97673fb8,0xda43d962,0x19604bc5,0xdb754214
	.word	0xa139333e,0x9e45e82a,0xabc24094,0x5289b43b
	.word	0x208a8a7e,0x0525b99b,0x4dce1e51,0xc0689507
	.word	0x46c60a29,0xdf63f4f4,0x57af567b,0x8059b30b
	.word	0x267741c2,0x39e66355,0x17127fa6,0x01211896
	.word	0x4dde24b6,0x2c70e2b6,0x19bab705,0x4098afda
	.word	0xd5823ec8,0x1bbc7523,0x426e0486,0x9a605d11
	.word	0x11127282,0x143bbdf6,0x1b858970,0x9bd25bf0
	.word	0xe67bbbcf,0x8d06c53a,0xfbbd544e,0x309ce53a
	.word	0x078e8e30,0x2345cff0,0xfd2cebe2,0x7446c3b8
	.word	0x3b0e2c5f,0x474fef84,0x40aa5985,0x6501cff4
	.word	0x09da859a,0x8e9fdbe4,0x9f2bbf0c,0x88a1b43e
	.word	0x379eb679,0xd9beb611,0x914d56a9,0x22f23e6d
	.word	0xe2f2211c,0xf229388f,0xe4660f47,0xe1580b8a
	.word	0x101dc863,0xb397970b,0x77c4a084,0x20b87db0
	.word	0x9abc790a,0xe775e1c9,0x29e999c9,0x1ac349b2
	.word	0xa2a59e20,0x9ecf382a,0xc27fd38f,0x8e9b5ea2
	.word	0x31594954,0x2aa5ba4a,0x7e802ef9,0x22251c41
	.word	0x7a0153a3,0x6546d584,0x9e5c394c,0x82e11625
	.word	0xe893e1e9,0xc595ec4d,0xc72b9bb6,0xf6d64294
	.word	0xe1996ba3,0x1fb30dbf,0x97be4076,0x05e238be
	.word	0x4488af73,0xf972e646,0x2ab710bd,0xd38580e8
	.word	0xa4081b94,0x2fb51aa7,0xcda2a041,0xef738c37
	.word	0x73d6b47b,0xd5ed7943,0xe27a913a,0x4adb71d6
	.word	0xfef2301d,0xd4ba0e66,0xc44272fc,0xf951a1d3
	.word	0x2e892e90,0x13f65726,0xf3332606,0x7adde15f
	.word	0xdd5e18f3,0x345b8c3a,0x24913f11,0x41e41bea
p3_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local2_begin:
p3_local2_start:
	.word	0x491e36db,0x2e56493c,0xfedb9424,0x8e319fc8
	.word	0x5dd9a630,0xb15572da,0x9f8e5a2a,0xeebc2cd1
	.word	0x7d5435e1,0xad1593aa,0x5d69dae0,0xc4795a9e
	.word	0x612e4eff,0x2af5cd55,0x2ff3abb1,0x4fa82dab
	.word	0xf1a6d2b0,0xbe8001bf,0x49fb6899,0xddedb1dd
	.word	0x7ed613cf,0x91c8642f,0xd15bf2d0,0x493ddaf7
	.word	0xceef0799,0x1dce738f,0x51f76933,0x6438b22d
	.word	0x42706e12,0xc529db14,0x0a63814e,0xf64910d0
	.word	0x4a024687,0x4f0d6854,0x14e97a97,0x5cff7329
	.word	0xa29b6cc8,0x6697f840,0x119d4d7a,0xd3aedcc9
	.word	0x32bd17d8,0x55e6900c,0x2226d305,0x1fd31d7e
	.word	0x76ab7efc,0x35a7e09b,0xc5ea5472,0x9c431ce9
	.word	0x159442db,0x89b4219a,0x12e1fc6e,0x8fb70678
	.word	0x5407a1fc,0x1836df2f,0x27a5b16f,0x750506e9
	.word	0xb31104d1,0x7a084393,0x466d958f,0x9d76cb4e
	.word	0x3e8d1024,0x533699f5,0x27aea895,0x775e56ef
	.word	0x538d6b9c,0xe72a71c2,0xe1e1afed,0x49c1c542
	.word	0x5e45cd53,0x7f815160,0xffc010ca,0x237fb0aa
	.word	0x9a2a4a5f,0xa458d8f3,0xc8e83b8e,0xc70c08f9
	.word	0xd044ab4b,0x415867c8,0x18affc0d,0xea84d4b0
	.word	0xf613e721,0x42f8d335,0xa55bca4c,0x4e360878
	.word	0xe5f41a48,0x3a0df722,0x6a2ea481,0x445b036f
	.word	0x4157d069,0x908dae4e,0x9bc559e3,0x118792aa
	.word	0x54991956,0x9afd2d2e,0xc1b09b0a,0x3b2d798d
	.word	0xe1bd9630,0xcef2f2fa,0x6fadd099,0x496ffd7c
	.word	0x8857f36a,0x1bdcfcd5,0x6423c08a,0x7bafd24c
	.word	0x1566ba26,0x33cabf4b,0x70b186e2,0x2f18c5f8
	.word	0x91e599c7,0x8340683c,0xeb9657a5,0x99f4eade
	.word	0xf8ee15ac,0xcef59fd2,0xce05c8ab,0x252a7ac7
	.word	0xc957a5cd,0xb0ba86c1,0x37e8ef40,0x40478c2b
	.word	0xb654dc29,0xb62bd510,0x11b631eb,0x4dbe2004
	.word	0x0a953f8e,0xf33e9985,0x0ab1bb29,0xc6721909
	.word	0x5fc15f0a,0xb3e73d3e,0x8b9a3f91,0x68c6f9f8
	.word	0xc019c9ea,0xc7983bb0,0x929ea20e,0x061a75d3
	.word	0x56359305,0xdeabc416,0x656ece28,0xcf715514
	.word	0x3e5c8efe,0xfeb32c56,0x4de77134,0xd81048bb
p3_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local3_begin:
p3_local3_start:
	.word	0x1789e69b,0x334881fb,0x05f99a8a,0x9b5d633c
	.word	0xa1e6e4ff,0x75018d90,0xdcba772b,0x0079aba6
	.word	0x04466cb2,0x2acf68a0,0xc131b41e,0xf69e5a90
	.word	0x60f500e4,0x0799d320,0xb49938b8,0x0b5b8223
	.word	0xc5e497a4,0x249b765a,0x8b470a80,0xfe4607e7
	.word	0xba945634,0x87a0057f,0x4406b492,0xa36460f4
	.word	0xdc76ec7b,0xcb2416e2,0xb3e73138,0x6ba1b825
	.word	0x1127e988,0x9740ae89,0x11e706ce,0xb8f769f4
	.word	0xaa4d28aa,0x7c2eae82,0xd411f645,0xb1fa68aa
	.word	0x7dbd4cc0,0xf4a4bab9,0x8cd2ebce,0x3b1a8157
	.word	0xa2a4a381,0x3db63c62,0x6bc424eb,0x1f42c135
	.word	0x9daf9fed,0xcaf0e734,0x946bfc0b,0x5604054f
	.word	0x3fa341d7,0x5d457aa0,0xc030ff9a,0xabcaeef6
	.word	0x92f16c74,0xd728de8c,0x699ac37c,0x5b2c472c
	.word	0x6a58421c,0xf8793796,0x7398c137,0x76f7b63b
	.word	0x4a8c198a,0x597a97c0,0xdbfd9b18,0xc85bab0a
	.word	0xcb197bc0,0x28f7beac,0x84aa3236,0xb59de614
	.word	0x9f8ac7d2,0x7fcb654d,0xd76e4ba4,0x9935ec2c
	.word	0x75f28769,0x7a8b21e9,0x42c14c8e,0xb32091c4
	.word	0x9fb2a234,0x3fc29a8d,0xe88fac54,0x57db131b
	.word	0xcc6fae23,0xde4ba74f,0xa1e7b86b,0x35822a23
	.word	0x5a631105,0xf30285ac,0x55e4adeb,0xe7f243ca
	.word	0x3b6c665c,0xf190e1f4,0x40991618,0x243ee403
	.word	0x5318f9bd,0x0b934178,0xb0e79008,0xc8d5d867
	.word	0xf6ad421b,0x3c846604,0xa0a831da,0x7aee11a4
	.word	0x30c45c99,0x44883aa9,0x5cee0fa9,0xd43ea638
	.word	0x73d994a7,0xa86470f0,0x665c6b24,0x5a86158b
	.word	0xd3fa21e3,0x24252f74,0xda1e6776,0x9b7b55d7
	.word	0x1c19bf31,0x04a8b6b8,0x8e14d364,0x097ad5cb
	.word	0x84d611ad,0x7658d421,0xd0f82248,0xc309921c
	.word	0xb2037305,0x7192326e,0xc887923f,0x299cb78b
	.word	0x37db9f7c,0x9ff74b4e,0x28ba3a9a,0xcaa1b464
	.word	0xb80afdce,0x39792e23,0xf60940ae,0x6290b9ae
	.word	0xc45e33ba,0x7ac5619e,0xca315282,0x004ecbc7
	.word	0xb197c8ec,0xc19d9193,0x9ec6f252,0xa3e76490
	.word	0x1354d4b6,0x28a3e49f,0xaa66ae46,0xd854198a
p3_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local4_begin:
p3_local4_start:
	.word	0xd5345f62,0xa05ff378,0x987cbf79,0xd6f82c43
	.word	0x3edf5ad8,0x6db69a7d,0xd0f3a5bd,0x40fd780f
	.word	0x5727fea5,0x0f895beb,0x3e23aa76,0x962ca426
	.word	0x20aad2f6,0x2225fac4,0x228298fb,0x2a1d5efd
	.word	0x4f37a946,0xfe3a4d23,0x61102c38,0x09e6fca6
	.word	0x1352486a,0xf3c6a4f0,0xae3b5f7c,0xae754b29
	.word	0xcbb0fefc,0x7713ba05,0x9ec6c04b,0xe248e564
	.word	0xe57d9280,0x0409ad73,0x64ee3e12,0xfda33158
	.word	0x900ce3e5,0x0a9d0997,0x5331a121,0x849da10e
	.word	0x7c34bba0,0x430b72d2,0x75d5917e,0x61e173bd
	.word	0x946b7db0,0x4ccc0fed,0x88b9abce,0x210f399d
	.word	0xa0bfbdda,0xdce4f70a,0x530ca1c0,0x242485a4
	.word	0x20339b9e,0x52157a63,0x1e8c8fd9,0xdc21308b
	.word	0x6ff7e08f,0x847c16f6,0x47a7d039,0x77756228
	.word	0x68649ab6,0x19b61b24,0x629af086,0xd47217f3
	.word	0xb05b5572,0xcf22b20d,0x90b7537f,0x66cc28f8
	.word	0x919187ce,0x9e06057d,0xfbb6fdcc,0x41ec3aa1
	.word	0xaf46ef05,0x916c5cc9,0x28f36cec,0x901a4487
	.word	0x6d9a6886,0x72e17e87,0x9c6524ce,0x01d427ae
	.word	0x5ae3b777,0x8f292333,0x2ee6d4ed,0xc89c9174
	.word	0x0484d4c7,0x90daf563,0x6143a559,0x4da0c550
	.word	0xb47d341c,0xf061995d,0x56fca70b,0x7a2c8d4b
	.word	0x0e790b70,0x859a05de,0x9ca7884c,0xdee88cff
	.word	0x4d304748,0x3a7725d9,0xf601f27e,0x66eaae51
	.word	0x0958075e,0x8ded37da,0xfcc2fcf8,0x663ee296
	.word	0x3f19f663,0x5a3c8a9d,0x8b8efeb7,0x5ffedca0
	.word	0x5365169a,0x82bba046,0xf1d9d10b,0xe28d9e89
	.word	0x658bacb8,0x5a7ff228,0x32bd1890,0x7d362b1c
	.word	0xe08f5c8d,0x8df5efa6,0x8ff0d800,0xce67e2fb
	.word	0x9eeda70f,0x46c74f52,0x7ba511a1,0x17d9098f
	.word	0x52ad3051,0x761a9aa2,0x9d4e7bdb,0x700af88f
	.word	0x29746d8e,0x30fe2409,0x413fd591,0x8b5264ee
	.word	0xda9820f4,0xe1606b34,0x469fb429,0x82957d7a
	.word	0xac8964c0,0x76bd378b,0xb763df2b,0xaa0272ea
	.word	0xed8ae5f0,0x39330d0b,0x4fae88c5,0x4f7d0d33
	.word	0x97d9aa21,0x9aef2086,0x5f8e1ace,0x3bebafbc
p3_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local5_begin:
p3_local5_start:
	.word	0x3b7bb77c,0x4b23d5e4,0x79f56d71,0xc3737ce1
	.word	0x6f32ff58,0xa03ef307,0x96edfe66,0xd50383b4
	.word	0x9eb79e6c,0x0b8557b3,0xa2935f42,0xe3bf605a
	.word	0xb0234d99,0xc0d2a9af,0x06657f69,0x9552fa49
	.word	0x7041fb52,0x8f8c29c3,0x699a964d,0x00772843
	.word	0xc12f7e17,0xb005f77e,0xf21ed0c1,0xe3e42634
	.word	0x907910a9,0x2f9c8834,0x45581029,0x5c591dfb
	.word	0x7d9ff392,0xa48d578d,0x4846d768,0x2de023c1
	.word	0x51437964,0xc177097d,0x76492ae8,0x794029f6
	.word	0xa63438ec,0xd398d5fd,0x965c7226,0x3c3e467b
	.word	0x0cdf5c39,0x9722b8da,0x8b3fc99e,0xaada36c6
	.word	0x556bdd81,0x58f6126b,0xda83faea,0x953f9284
	.word	0x62b603b1,0xc187de1f,0xffa0a4a2,0x71534c1a
	.word	0x440789c9,0x6017c3fc,0xb8278bc9,0xd18c5eff
	.word	0xce482a06,0xd4683006,0x76902a4f,0xa00593d4
	.word	0xb24ea81f,0x90974dda,0x5a8afa4d,0xd4889c17
	.word	0xce5d35df,0xbc29a7d8,0x517f2a6b,0x84cba490
	.word	0x61cfe88a,0xe9297844,0x0045a723,0xaf7fcc56
	.word	0x6f45727c,0x99f9cf8e,0x16a8ff08,0x4749f43c
	.word	0xb10049c3,0xe98d4851,0xedf36934,0xe465e72e
	.word	0xf56cbaff,0x42efabb6,0x657c1799,0x88b6301f
	.word	0x25fcb273,0x67d4cd57,0xe9af9e46,0xb5d5d2a0
	.word	0xec286caa,0xb2b9482f,0x29605732,0x8d8d369a
	.word	0x94e2dac2,0x133a6fe5,0x9102e635,0x0022068a
	.word	0xd25b591a,0x8bb4281f,0xbe8ed4e7,0x8475b477
	.word	0xa3ef00e2,0x78c7d210,0xf7cfcb1c,0xe7f2a5cc
	.word	0xed1d8d20,0x39af8138,0xc5f461a6,0x19cf8fe7
	.word	0xf872a5df,0xc5fc4e5f,0x732ed6df,0xbd367e68
	.word	0x8614ea4a,0xbffaf38e,0x27877247,0x9c37774b
	.word	0x54d18fd4,0x89c9c752,0x67ca6c8c,0x45cfc3f6
	.word	0xaa1c5459,0x07a1327e,0xe79c18e1,0x412a26a8
	.word	0x6f061531,0x81fbb374,0x59854c91,0x9983a62b
	.word	0xc53639fe,0xa3a11e05,0x9bca3d52,0x9a07c0aa
	.word	0xf38e76b8,0x34dde0d6,0xd86aaa48,0xc34fd77a
	.word	0xc27eb69e,0xe6af21dc,0x14118921,0xcc70785e
	.word	0x9cd6b242,0xaefdb24b,0x67e20075,0xf25688d3
p3_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local6_begin:
p3_local6_start:
	.word	0x42b40925,0xcb22ac0c,0x75abb3be,0xeea6a455
	.word	0x2d324492,0x5bae8f62,0x02468ce6,0xc28036cb
	.word	0xb69e9527,0x1893d7e0,0xfd89b3cf,0xe6a9e2c9
	.word	0xb4a136b0,0x5bb3d232,0x8466d61a,0xbebc2b5c
	.word	0xd7d7dcd6,0x66fe922b,0x384c75bf,0x82459287
	.word	0x8d7a96e9,0x12b6ca50,0x32b7ea42,0x2f24db2f
	.word	0x0ef803e6,0x225a2f31,0x97526558,0xfcb2fed6
	.word	0x3a0914f8,0x6b0826c9,0x62f19805,0xd551d812
	.word	0x6505ab8d,0x36d85150,0x1432303e,0xa8b42cdd
	.word	0xb55e0a40,0x8dbd3397,0x03c292aa,0x738f6bcb
	.word	0xc12a5056,0x5b49b8e5,0x1844d9b7,0xef27d756
	.word	0xb9bbd5e4,0x48670942,0xc3a0d424,0xf7d0cd45
	.word	0x7b437911,0x3062d4dd,0x13a2324c,0x7f24e437
	.word	0x91bd77c8,0xe9b94cef,0xab775695,0x61b7fc62
	.word	0x2cf6b778,0xe76a6879,0x9e687ec4,0xbfd4711f
	.word	0x3cc51bee,0xe0f50952,0xbdc7a4b5,0x1c0119a3
	.word	0x5c65332d,0xd0e8ef16,0x7c71669a,0xff60fae7
	.word	0xd64f303c,0x64349b55,0x064586b1,0xc5720b5c
	.word	0x5cca5fc0,0xb39cef99,0xd3a7e8a4,0xd36c462c
	.word	0x5e308399,0x49fd1084,0xe0aa3a17,0x5ef3b214
	.word	0x6ee5bba7,0x1a4dfe9e,0xb862dcd9,0xea3d55e5
	.word	0xbb0995dc,0x8553b167,0x4e5cced2,0x79b04ed7
	.word	0x2bb3f619,0x09abea56,0xd5dd0d88,0xabaabbf0
	.word	0x157c9402,0xdca7aa4f,0xf8f5afdc,0x1a752bdd
	.word	0x83a5a1ae,0x2784cea5,0x66f13201,0x65cf9a1d
	.word	0x7636e6e5,0xd6ee86eb,0x9211d2e7,0x3694f34a
	.word	0xb092c512,0x9c9d08de,0x9f5e67a3,0xef3422fb
	.word	0x6e319fc2,0x9e1bcdbe,0xcec9000d,0xaab4b302
	.word	0x001b07f8,0x193460e3,0x8df82332,0x06c251b7
	.word	0x5befc604,0xa8a8764e,0x74b2d4c4,0x132f924c
	.word	0x6e7b7eb9,0x47f918d0,0xe3092d18,0xe536d302
	.word	0x25d60fb5,0x207bba59,0xdd782c5c,0xe794b55e
	.word	0x74a8ee98,0xe1a5a95a,0x316b4037,0x92cda87d
	.word	0x95b80b9a,0xa6cf8413,0xd00f7634,0xf31a913b
	.word	0x1a2d3254,0x3f3d6475,0x073bcf27,0x2c0475b8
	.word	0x3d9abdd8,0x461f19fa,0xe3b90eab,0x48748e01
p3_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
share0_begin:
share0_start:
	.word	0x194cca03,0xb737d7ae,0xf08a7f02,0xf40e214c
	.word	0x6d4f8127,0x11bf7433,0x1c62b073,0x1176ba81
	.word	0x5f7de36a,0x519a64c8,0x5db827fc,0x195f363d
	.word	0x77000e8b,0xb6453fd3,0x52e86852,0x72dbaf1c
	.word	0x161a1314,0x27efc08a,0x9558542f,0x1dce8b1d
	.word	0x9e241171,0x023b81c1,0x9c3c5e90,0x8049fa10
	.word	0x260bfb53,0x43d2557c,0x0edfe763,0xe04ffb20
	.word	0x77ed6211,0xbd4bbd95,0x3e4fad65,0xd29b6b99
	.word	0xc8fb0265,0xdee1108d,0x11759420,0x6b0074ac
	.word	0xdd53203e,0x277c24fd,0x15c33c6e,0xf9398924
	.word	0xb5ec2450,0x740eb8b7,0x2e312bed,0x66aef740
	.word	0x1df51693,0x2d47b233,0x61448b67,0x21c824a1
share0_end:
	.seg	"data"
	ALIGN_PAGE_8K
share1_begin:
share1_start:
	.word	0xc363e5bb,0x1ed0e670,0xc9d09a7a,0x58497fe0
	.word	0x30fe405e,0x68f94b8f,0xff7deee3,0x2ffec3a8
	.word	0x8fa0e5f7,0xc34bbf85,0xea82b7fe,0x95e2b048
	.word	0x560c6519,0x41a01ad3,0x67a481ef,0x7f8a7d38
	.word	0x435df72f,0xc8fd3b55,0xd04dff95,0x699bdeb4
	.word	0xc5a66cf7,0x9bcd4b21,0x18907542,0x3c7e75d1
	.word	0x27f7110e,0xebd399f4,0xbfb6f6dc,0x818ebc3c
	.word	0x7a50ba7b,0xadf5abb4,0xb2bee63b,0xf6783e55
	.word	0x7647d291,0xa5e94bc9,0x58d6d73a,0x17fec14c
	.word	0x952dd335,0xbcbf83ab,0x401c0a81,0xb1726d45
	.word	0x6170ef49,0x107a0328,0xd54e196d,0x565c955b
	.word	0x6ee544a3,0x31f15a9f,0x58de1e64,0xaae747f7
share1_end:
	.seg	"data"
	ALIGN_PAGE_8K
share2_begin:
share2_start:
	.word	0xc849a494,0x8381ca34,0x74e9b7e1,0x9b27a17d
	.word	0xe6f398ec,0xb9bf24d3,0x4243b288,0xde53bbc8
	.word	0x6f95f13c,0xff172702,0x58550d7a,0x9875606e
	.word	0x208c9a4d,0x8bf7461f,0xb252840e,0xc0a4a893
	.word	0xaff27420,0x31f5238b,0xef1b3d6f,0x47677579
	.word	0x8f0b34c7,0x83d4f2ea,0xab786e72,0x2e62e2c5
	.word	0xfae110ef,0x23597606,0x934a3c46,0x3bfa8c7e
	.word	0x2e0eaaf6,0x0e6e197c,0x34647f13,0xfed80d66
	.word	0x5f2e602f,0x4ef404c6,0x0570b736,0x223b3a02
	.word	0x1862a4fb,0x80869d0f,0xb07490dc,0x15a1cdee
	.word	0xf62cf931,0x6f27e5bb,0xfe782e00,0x454611ff
	.word	0x6f7591a6,0x949f606e,0x5870595e,0xb880261f
share2_end:
	.seg	"data"
	ALIGN_PAGE_8K
share3_begin:
share3_start:
	.word	0x8ab36016,0xed7ebd54,0x9770f77a,0xa07ef4a1
	.word	0xc58ed73a,0xb9a1a310,0x43a4137d,0x93078c9a
	.word	0x5c0b79bd,0x2ed9cbf6,0xd5aa6fd5,0x1f1ba576
	.word	0x0014bdb3,0xe4f27bb0,0xa9efab41,0x0602bd59
	.word	0x2638e089,0x443bb01d,0xa2784a3a,0x0a304605
	.word	0x1f6ed9a9,0x31540281,0x77f3dbeb,0xeaf0adb3
	.word	0xb604127d,0x12091d8b,0x6f28429f,0x274d0f5e
	.word	0x2de0ad74,0xe4ed7538,0x3096a946,0x5b70c68d
	.word	0x66575806,0xb98ef2f7,0xc962efd8,0x69e70108
	.word	0x46a4c306,0xc737ec90,0xd9ba484b,0x8c6c5628
	.word	0x02563e76,0xf26fd27b,0xf746223b,0xcb0d56b9
	.word	0x79f56c98,0xeaa1768b,0xc338efae,0x126d1ac5
share3_end:
	.seg	"data"
	ALIGN_PAGE_8K
common_begin:
common_start:
	.word	0x35170a3e,0x29310112,0x1d0b1a28,0x2d19250d
	.word	0x22361c2d,0x1b040b17,0x12233e2b,0x24300020
	.word	0x2d153b35,0x3903193a,0x3c3b2c2c,0x24272706
	.word	0x03253508,0x2a041f16,0x2b31240f,0x033d3f1d
	.word	0x592b488f,0x830ae971,0x8123dc96,0x52f0e37b
	.word	0x7cf20070,0xd46ef3df,0xd03717ca,0x3bbd58d8
	.word	0x97c971ac,0xde6ea896,0x9d65760e,0xd9e02368
	.word	0xe894e558,0x11e3d21e,0xccfe1b9d,0x5b928a7a
common_end:
	.seg	"data"
	ALIGN_PAGE_8K
unres0_begin:
unres0_start:
	.word	0x33b3aecd,0x3445cb05,0x6b78d8c7,0xd8311ea6
	.word	0x852cb3e2,0xc2eec50c,0x98d866c8,0x776ec9b5
	.word	0x881b2ad7,0x861878d1,0xa4176408,0x4b729f64
	.word	0x6d1accd5,0x1754a19e,0x5506e65d,0x8e654ab1
	.word	0xc78fef2b,0x03faa03f,0xb4eadc8a,0x53902166
	.word	0xa93c5722,0x4de4a579,0x28a6997e,0x1d581228
	.word	0x0818b15d,0xe53da238,0x65b76271,0x70bda996
	.word	0x66e2e436,0xb8b0b88b,0xf255bd30,0xfe093a5d
	.word	0x0c8f2c5f,0xddabc2b4,0xb5784884,0x346c25d2
	.word	0xd829d87a,0xd4921010,0x60fd17d9,0x27da4f25
	.word	0x1e367c7c,0x0c02704c,0x2f18b12c,0x251ef5f2
	.word	0xee27bea7,0x6df99f0a,0x78937373,0x0e9b7a71
unres0_end:

