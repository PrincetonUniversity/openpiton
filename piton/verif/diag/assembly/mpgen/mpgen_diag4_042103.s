// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mpgen_diag4_042103.s
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
!	Seed = 17
!	CIAM can be on
!	4 Processors, 1000 lines each
!	mpgen   created on Oct 14, 2002 (10:12:19)
!	diag.s created on Apr 10, 2003 (19:27:32)
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
	ldd	[%g1+0x00],%f0		! %f0  = 39e92e2b, %f1  = 9e49f91e
	ldd	[%g1+0x08],%f2		! %f2  = 615bb50d, %f3  = d4681fd7
	ldd	[%g1+0x10],%f4		! %f4  = 1f7b741e, %f5  = 0a666df0
	ldd	[%g1+0x18],%f6		! %f6  = f99821d4, %f7  = 6b354895
	ldd	[%g1+0x20],%f8		! %f8  = 3fe04a9a, %f9  = f8be37e8
	ldd	[%g1+0x28],%f10		! %f10 = a9061ce8, %f11 = 77225ed2
	ldd	[%g1+0x30],%f12		! %f12 = 90050c74, %f13 = c2188a6e
	ldd	[%g1+0x38],%f14		! %f14 = 874205a8, %f15 = 47ede01c
	ldd	[%g1+0x40],%f16		! %f16 = 9908d4e9, %f17 = b79ad666
	ldd	[%g1+0x48],%f18		! %f18 = 77da0ad3, %f19 = 773c8ab4
	ldd	[%g1+0x50],%f20		! %f20 = 0f76be1f, %f21 = 52756a9b
	ldd	[%g1+0x58],%f22		! %f22 = c3a009f3, %f23 = 26b34d3a
	ldd	[%g1+0x60],%f24		! %f24 = f5ee5231, %f25 = 0820bf10
	ldd	[%g1+0x68],%f26		! %f26 = c1bf95ec, %f27 = 3167fded
	ldd	[%g1+0x70],%f28		! %f28 = e507c78d, %f29 = 8255e17a
	ldd	[%g1+0x78],%f30		! %f30 = 82687dd3, %f31 = b6d6f528
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l3 = cdd5b6007b8d1713, immed = fffffb7e, %y  = 00000000
	sdiv	%l3,-0x482,%l1		! %l1 = ffffffffffe4977f
!	Mem[0000000011000044] = 4e17dc6a, %l2 = cf9a19fff6616847
	lduh	[%i2+0x044],%l2		! %l2 = 0000000000004e17
!	%f30 = 82687dd3 b6d6f528, %f12 = 90050c74 c2188a6e
	fmovd	%f30,%f12		! %f12 = 82687dd3 b6d6f528
!	%l3 = cdd5b6007b8d1713, %l1 = ffffffffffe4977f, %l0 = aa861aff8236be13
	xorcc	%l3,%l1,%l0		! %l0 = 322a49ff8469806c, %ccr = 08
!	%l0 = 322a49ff8469806c, Mem[000000003100000a] = 8b9a9814
	sth	%l0,[%o2+0x00a]		! Mem[0000000031000008] = 8b9a806c

p0_label_2:
	fbne,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	 Annulled
	ldda	[%i3+%o6]0x80,%l4
p0_b1:
	membar	#Sync			! Added by membar checker (1)
	fbg,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000031800008] = f3f640e6, %l3 = cdd5b6007b8d1713
	ldsw	[%o3+0x008],%l3		! %l3 = fffffffff3f640e6
p0_b2:
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08

p0_label_3:
!	Mem[0000000010000008] = 760287ab, %l1 = ffffffffffe4977f
	lduha	[%i0+%o6]0x80,%l1	! Annulled
p0_b3:
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000011800088] = 00000030 00004e17, %l1 = ffffffffffe4977f, %l1 = ffffffffffe4977f
	add	%i3,0x88,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = e7921d81a520ff75
!	Mem[0000000011800000] = a79c8f17, %l3 = fffffffff3f640e6
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000a7
	set	p0_b4,%o7
	fbe,a,pt %fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 0
!	%l0 = 322a49ff8469806c, Mem[0000000011000008] = 7411d4f9
	stwa	%l0,[%i2+%o6]0x80	! Mem[0000000011000008] = 8469806c
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x004,%g2
p0_b4:
!	Registers modified during the branch to p0_near_3
!	%l0  = 00000000c4642b0c
!	%l3  = 0000000000027f82
!	%l4  = 0000000000005293
!	%l5  = 0000000004ff04f6
!	%l7  = 04ff04cca01eead0

p0_label_4:
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetcha [%o4+0x020]%asi,23
!	call to call_3, CWP = 0
	call	p0_call_3_he
!	Mem[0000000010000060] = f1dc0e62 2661f391 9b4f2c19 2be00efd
	prefetch [%i0+0x060],22
!	Registers modified during the branch to p0_call_3
!	%l0  = 0000000004ff07f7
!	%l6  = 027f83fb80000000
!	%l7  = fffffffffffffe93
!	%l6 = 027f83fb80000000, %l0 = 0000000004ff07f7, %y  = 04ff04cc
	sdiv	%l6,%l0,%l6		! %l6 = 000000007fffffff
!	Mem[0000000030000044] = c4642b0c, %l4 = 0000000000005293
	swapa	[%o0+0x044]%asi,%l4	! %l4 = 00000000c4642b0c

p0_label_5:
!	%f8  = 3fe04a9a f8be37e8, %f8  = 3fe04a9a f8be37e8, %f16 = 9908d4e9 b79ad666
	fsubd	%f8 ,%f8 ,%f16		! %f16 = 00000000 00000000
!	Mem[0000000011000090] = 045c922f207bd395, %l5 = 0000000004ff04f6
	ldxa	[%i2+0x090]%asi,%l5	! %l5 = 045c922f207bd395
	bpos	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[00000000100000f8] = 2b9da88d, %l0 = 0000000004ff07f7
	ldsw	[%i0+0x0f8],%l0		! %l0 = 000000002b9da88d
p0_b5:
	membar	#Sync			! Added by membar checker (4)
!	%l1 = e7921d81a520ff75, %l2 = 0000000000004e17, %l4 = 00000000c4642b0c
	addc	%l1,%l2,%l4		! %l4 = e7921d81a5214d8c

p0_label_6:
	fbu,a,pt %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000030000044] = 00005293, %l2 = 0000000000004e17
	lduw	[%o0+0x044],%l2		! Annulled
p0_b6:
	membar	#Sync			! Added by membar checker (5)
!	%l6 = 000000007fffffff, %l4 = e7921d81a5214d8c, %y  = 04ff04cc
	umul	%l6,%l4,%l1		! %l1 = 5290a6c55adeb274
!	Mem[00000000108000a4] = 58bd2664, %l3 = 0000000000027f82
	ldsb	[%i1+0x0a7],%l3		! %l3 = 0000000000000064
!	%f5  = 0a666df0, %f2  = 615bb50d d4681fd7
	fitod	%f5 ,%f2 		! %f2  = 41a4ccdb e0000000

p0_label_7:
!	Mem[0000000032000028] = 537245c7b3b6f9b1, %l0 = 000000002b9da88d
	ldx	[%o4+0x028],%g2		! %g2 = 537245c7b3b6f9b1
	fbn,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000010000000] = 51a66245005cbc5f, %l2 = 0000000000004e17
	ldxa	[%i0+%g0]0x80,%l2	! Annulled
p0_b7:
	membar	#Sync			! Added by membar checker (6)
!	%l3 = 0000000000000064, %l1 = 5290a6c55adeb274, %l4 = e7921d81a5214d8c
	srlx	%l3,%l1,%l4		! %l4 = 0000000000000000
	set	p0_b8,%o7
	fbule	p0_far_3_he	! Branch Taken, %fcc0 = 0

p0_label_8:
!	%l6 = 7fffffff, %l7 = fffffe93, Mem[0000000011800008] = b4e8ca61 65c791cd
	stda	%l6,[%i3+%o6]0x80	! Mem[0000000011800008] = 7fffffff fffffe93
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x008,%g2
p0_b8:
!	Registers modified during the branch to p0_far_3
!	%l1  = fffffffffffffffb
!	%l2  = 0000000000000000
!	%l7  = 00000000000064bb
	set	p0_b9,%o7
	fbue	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	%l5 = 045c922f207bd395, Mem[000000003100004a] = 617182b0
	sth	%l5,[%o2+0x04a]		! Mem[0000000031000048] = 6171d395
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x009,%g2
p0_b9:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l1  = ffffffff908e99cb
!	%l3  = 000000006f71028f
!	%l5  = fffffffffffff15a
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000040000010] = 39251e20, %l7 = 00000000000064bb
	swapa	[%o5+0x010]%asi,%l7	! %l7 = 0000000039251e20
!	Mem[00000000128000e0] = a490e9ff 49afc521 6f8dafdb 9e6da62d
	prefetch [%i5+0x0e0],2

p0_label_9:
	set	p0_b10,%o7
	fbge	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000100000b0] = f8aa78cd, %l5 = fffffffffffff15a
	ldsw	[%i0+0x0b0],%l5		! %l5 = fffffffff8aa78cd
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x00a,%g2
p0_b10:
!	Registers modified during the branch to p0_far_1
!	%l0  = fffffffff8aa78cd
!	%l2  = 000000005410dd55
!	%l6  = 000000007ffff30e
	membar	#Sync			! Added by membar checker (8)
	fbl,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = f8aa78cd, %l1 = 908e99cb, Mem[0000000011000000] = c89b1113 1038ade9
	stda	%l0,[%i2+%g0]0x80	! Annulled
p0_b11:
	membar	#Sync			! Added by membar checker (9)
!	Branch On Register, %l3 = 000000006f71028f
	brlz,a,pn %l3,p0_not_taken_0	! Branch Not Taken

p0_label_10:
!	 Annulled
	ldda	[%i4+%o6]0x80,%l4
p0_b12:
	membar	#Sync			! Added by membar checker (10)
!	%l4 = 00000000, %l5 = f8aa78cd, Mem[0000000032000060] = e6a70116 4168fde0
	std	%l4,[%o4+0x060]	! Mem[0000000032000060] = 00000000 f8aa78cd
!	Branch On Register, %l5 = fffffffff8aa78cd
	brz,pt	%l5,p0_not_taken_0	! Branch Not Taken
!	%l5 = fffffffff8aa78cd, Mem[0000000011000000] = c89b11131038ade9
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000011000000] = fffffffff8aa78cd
p0_b13:
	membar	#Sync			! Added by membar checker (11)
!	%l6 = 000000007ffff30e, %l4 = 0000000000000000, %l3 = 000000006f71028f
	subc	%l6,%l4,%l3		! %l3 = 000000007ffff30d

p0_label_11:
!	Mem[0000000010000008] = 760287ab, %l2 = 000000005410dd55
	swapa	[%i0+%o6]0x80,%l2	! %l2 = 00000000760287ab
!	%f19 = 773c8ab4, %f19 = 773c8ab4, %f14 = 874205a8
	fsubs	%f19,%f19,%f14		! %f14 = 00000000
!	%f31 = b6d6f528, %f7  = 6b354895
	fcmpes	%fcc3,%f31,%f7 		! %fcc3 = 1
!	%l3 = 000000007ffff30d, %l6 = 000000007ffff30e, %l2 = 00000000760287ab
	addc	%l3,%l6,%l2		! %l2 = 00000000ffffe61c
!	%l7 = 0000000039251e20, immed = 00000509, %l7 = 0000000039251e20
	addcc	%l7,0x509,%l7		! %l7 = 0000000039252329, %ccr = 00

p0_label_12:
!	Mem[0000000011000000] = ffffffff, %l0 = fffffffff8aa78cd
	lduw	[%i2+0x000],%l0		! %l0 = 00000000ffffffff
	bgu	p0_b14			! Branch Taken, %ccr = 00, CWP = 0
!	%l4 = 00000000, %l5 = f8aa78cd, Mem[0000000011800008] = 7fffffff fffffe93
	stda	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = 00000000 f8aa78cd
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x00e,%g2
p0_b14:
	membar	#Sync			! Added by membar checker (12)
!	%l3 = 000000007ffff30d, immed = fffffb74, %l4 = 0000000000000000
	addcc	%l3,-0x48c,%l4		! %l4 = 000000007fffee81, %ccr = 11
!	Mem[0000000012000000] = d5343bd8, %l5 = fffffffff8aa78cd
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffffd534

p0_label_13:
!	%l4 = 000000007fffee81, immed = 00000f06, %l1 = ffffffff908e99cb
	andcc	%l4,0xf06,%l1		! %l1 = 0000000000000e00, %ccr = 00
	fbuge,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[000000003000000c] = 5246bfae, %l7 = 0000000039252329
	swap	[%o0+0x00c],%l7		! Annulled
p0_b15:
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000011000000] = ffffffff f8aa78cd 8469806c 16a2c4b4
	prefetcha [%i2+0x000]%asi,2
!	%l2 = 00000000ffffe61c, %l2 = 00000000ffffe61c, %l5 = ffffffffffffd534
	orcc	%l2,%l2,%l5		! %l5 = 00000000ffffe61c, %ccr = 08

p0_label_14:
!	Mem[00000000118000c0] = ffffffff f8aa78cd, %l4 = 000000007fffee81, %l7 = 0000000039252329
	add	%i3,0xc0,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = c481d55b24bf5f48
!	%f14 = 00000000 47ede01c, %f8  = 3fe04a9a f8be37e8
	fxtod	%f14,%f8 		! %f8  = 41d1fb78 07000000
	fbl,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000010800008] = 4bb76ead, %l1 = 0000000000000e00
	swapa	[%i1+%o6]0x80,%l1	! %l1 = 000000004bb76ead
p0_b16:
	set	p0_b17,%o7
	fbo	p0_far_3_le	! Branch Taken, %fcc0 = 0

p0_label_15:
!	Mem[000000001000007c] = 145a3757, %l6 = 000000007ffff30e
	swap	[%i0+0x07c],%l6		! %l6 = 00000000145a3757
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x011,%g2
p0_b17:
!	Registers modified during the branch to p0_far_3
!	%l1  = 00000000ffffe61c
!	%l6  = 2000000000000000
	membar	#Sync			! Added by membar checker (14)
	set	p0_b18,%o7
	fbo,pn	%fcc2,p0_near_0_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000010800008] = 00000e00, %l0 = 00000000ffffffff
	lduba	[%i1+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x012,%g2
p0_b18:
!	Registers modified during the branch to p0_near_0
!	%l1  = ffffffffffffffd0
!	%l2  = fffffffffa000000
!	%l5  = 00000000a048f6fa
!	%l7  = ffffffa3b1b498e2
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000031800000] = f4763693, %l5 = a048f6fa, %l5 = a048f6fa
	casa	[%o3]0x80,%l5,%l5	! %l5 = 00000000f4763693
!	Mem[0000000011800008] = 00000000, %l5 = 00000000f4763693
	ldswa	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000000

p0_label_16:
!	%f8  = 41d1fb78, %f16 = 00000000 00000000
	fitod	%f8 ,%f16		! %f16 = 41d0747e de000000
!	%l2 = fffffffffa000000, Mem[0000000010000008] = 5410dd55
	stha	%l2,[%i0+%o6]0x80	! Mem[0000000010000008] = 0000dd55
!	Mem[0000000011800008] = 00000000, %l7 = ffffffa3b1b498e2
	lduha	[%i3+%o6]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000011000008] = 8469806c, %l5 = 0000000000000000
	lduha	[%i2+%o6]0x80,%l5	! %l5 = 0000000000008469
!	%f2  = 41a4ccdb e0000000, %f13 = b6d6f528
	fdtos	%f2 ,%f13		! %f13 = 4d2666df

p0_label_17:
!	%f28 = e507c78d 8255e17a, %f22 = c3a009f3 26b34d3a
	fcmpd	%fcc1,%f28,%f22		! %fcc1 = 1
	nop				! Delay added due to fcmp
	set	p0_b19,%o7
	fbo,pn	%fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 1
!	%l4 = 000000007fffee81, Mem[000000001000009c] = f1889b13
	stw	%l4,[%i0+0x09c]		! Mem[000000001000009c] = 7fffee81
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x013,%g2
p0_b19:
!	Registers modified during the branch to p0_near_2
!	%l2  = 0000000000000d05
!	%l5  = ffffffffffeae9e7
!	%l6  = 0000000000159271
	membar	#Sync			! Added by membar checker (16)
!	%f14 = 00000000, %f8  = 41d1fb78, %f6  = f99821d4
	fdivs	%f14,%f8 ,%f6 		! %f6  = 00000000
!	Mem[00000000108000c0] = 61992cd4 7bdd52bd 515ad1bc 3e054f9e
	prefetch [%i1+0x0c0],22

p0_label_18:
!	Branch On Register, %l5 = ffffffffffeae9e7
	brgez,pn %l5,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010800008] = 00000e00, %l2 = 0000000000000d05
	lduha	[%i1+%o6]0x80,%l2	! %l2 = 0000000000000000
p0_b20:
	membar	#Sync			! Added by membar checker (17)
!	%l7 = 0000000000000000, %l4 = 000000007fffee81, %l1 = ffffffffffffffd0
	xorcc	%l7,%l4,%l1		! %l1 = 000000007fffee81, %ccr = 00
!	Mem[00000000100000e0] = 662528b5 88f902f2 b28f9382 5885c8d6
	prefetcha [%i0+0x0e0]%asi,16
!	%l1 = 000000007fffee81, Mem[0000000010800098] = 1287e9eb5410dd55
	stxa	%l1,[%i1+0x098]%asi	! Mem[0000000010800098] = 000000007fffee81

p0_label_19:
!	Mem[0000000031000040] = f5c44646, %l7 = 0000000000000000
	ldstuba	[%o2+0x040]%asi,%l7	! %l7 = 00000000000000f5
!	%f24 = f5ee5231, %f28 = e507c78d 8255e17a
	fitod	%f24,%f28		! %f28 = c1a4235b 9e000000
!	%l4 = 000000007fffee81
	setx	0x5493495d5493495d,%g7,%l4 ! %l4 = 5493495d5493495d
!	%l3 = 000000007ffff30d, immed = fffff474, %l3 = 000000007ffff30d
	xnor	%l3,-0xb8c,%l3		! %l3 = 000000007ffff886
!	%l4 = 5493495d5493495d, immed = 00000df5, %l3 = 000000007ffff886
	or	%l4,0xdf5,%l3		! %l3 = 5493495d54934dfd

p0_label_20:
!	Mem[00000000108000e0] = 5f17043e 9c079afd 133a660e 48c6327c
	prefetcha [%i1+0x0e0]%asi,0
!	Mem[00000000120000f8] = 30539013, %l7 = 00000000000000f5
	lduw	[%i4+0x0f8],%l7		! %l7 = 0000000030539013
!	%l6 = 0000000000159271, Mem[0000000012000000] = d5343bd8
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000012000000] = 92713bd8
!	%l2 = 00000000, %l3 = 54934dfd, Mem[0000000030800040] = 6f71028f 70365f90
	stda	%l2,[%o1+0x040]%asi	! Mem[0000000030800040] = 00000000 54934dfd
!	%l1 = 000000007fffee81, %l6 = 0000000000159271, %l1 = 000000007fffee81
	and	%l1,%l6,%l1		! %l1 = 0000000000158201

p0_label_21:
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000010000008] = 0000dd557194ab49, %l6 = 0000000000159271
	ldxa	[%i0+%o6]0x80,%l6	! Annulled
p0_b21:
	membar	#Sync			! Added by membar checker (18)
	fbug,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800000] = 649746d5, %l3 = 5493495d54934dfd
	ldsw	[%o1+0x000],%l3		! %l3 = 00000000649746d5
p0_b22:
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_22:
!	Mem[0000000011000040] = f4184310 4e17dc6a a7b627b0 5c7f9b30
	prefetch [%i2+0x040],20
p0_b23:
	membar	#Sync			! Added by membar checker (19)
!	%l1 = 0000000000158201, %l4 = 5493495d5493495d, %l5 = ffffffffffeae9e7
	orn	%l1,%l4,%l5		! %l5 = ab6cb6a2ab7db6a3
!	Mem[0000000011800000] = ff9c8f17 76223665 00000000 f8aa78cd
	prefetcha [%i3+0x000]%asi,16
!	%l0 = 0000000000000000, %l1 = 0000000000158201, %l7 = 0000000030539013
	srax	%l0,%l1,%l7		! %l7 = 0000000000000000
	ble	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_23:
!	Mem[0000000013000000] = e8e4870a, %l2 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffe8e4
p0_b24:
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000032000044] = 73b9cf02, %l4 = 5493495d5493495d
	ldsba	[%o4+0x046]%asi,%g2	! %g2 = 0000000000000073
	fbn,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000031000040] = ffc44646a89260b3, %l2 = ffffffffffffe8e4
	ldx	[%o2+0x040],%l2		! Annulled
p0_b25:
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010000020] = 34285385 da0176ec c0fc5436 228f43cf
	prefetcha [%i0+0x020]%asi,1

p0_label_24:
!	%f19 = 773c8ab4, %f17 = de000000
	fnegs	%f19,%f17		! %f17 = f73c8ab4
	set	p0_b26,%o7
	fble,a,pn %fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],1
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x01a,%g2
p0_b26:
!	Registers modified during the branch to p0_near_1
!	%l0  = 0000000000000000
!	%l3  = b040200000000000
	membar	#Sync			! Added by membar checker (22)
!	%l1 = 0000000000158201, immed = 000009f7, %l6 = 0000000000159271
	or	%l1,0x9f7,%l6		! %l6 = 0000000000158bf7
	set	p0_b27,%o7
	fbul,pt	%fcc3,p0_near_0_he	! Branch Taken, %fcc3 = 1

p0_label_25:
!	Mem[0000000010800060] = d0f60d68 a2638cbe 3c53b7c8 bcb7df59
	prefetch [%i1+0x060],20
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x01b,%g2
p0_b27:
!	Registers modified during the branch to p0_near_0
!	%l1  = ffffffffffffffd0
!	%l2  = fffffffffa000000
!	%l5  = 00000000a048f6fa
!	%l7  = ffffffa3b1b498e2
	membar	#Sync			! Added by membar checker (23)
	fbe,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l2 = fa000000, %l3 = 00000000, Mem[0000000040000010] = 000064bb 382f2a35
	std	%l2,[%o5+0x010]	! Annulled
p0_b28:
	fbul,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031800000] = f47636931c40ab3e, %l1 = ffffffffffffffd0
	ldx	[%o3+0x000],%l1		! Annulled
p0_b29:

p0_label_26:
	membar	#Sync			! Added by membar checker (24)
!	Mem[00000000118000a0] = ccec9797 2b89162f 04ff04f6 f5acf0f2
	prefetcha [%i3+0x0a0]%asi,23
!	Mem[00000000118000c0] = c481d55b 24bf5f48 2d0d4c89 b3d0891c
	prefetch [%i3+0x0c0],3
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000010000008] = 0000dd55, %l6 = 0000000000158bf7
	ldsba	[%i0+%o6]0x80,%l6	! %l6 = 0000000000000000
p0_b30:
	membar	#Sync			! Added by membar checker (25)
!	%l6 = 0000000000000000, Mem[000000003000000a] = cd17fc73
	stb	%l6,[%o0+0x00a]		! Mem[0000000030000008] = cd170073

p0_label_27:
!	Branch On Register, %l1 = ffffffffffffffd0
	brz,pn	%l1,p0_not_taken_0	! Branch Not Taken
!	Mem[00000000118000b0] = d89103cd, %l4 = 5493495d5493495d
	ldub	[%i3+0x0b3],%l4		! %l4 = 00000000000000cd
p0_b31:
	membar	#Sync			! Added by membar checker (26)
	set	p0_b32,%o7
	fbuge,a,pn %fcc2,p0_near_0_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000010800000] = 231007de 6f902ede 00000e00 f1f6afff
	prefetch [%i1+0x000],23
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x020,%g2
p0_b32:
!	Registers modified during the branch to p0_near_0
!	%l1  = ffffffffffffffd0
!	%l2  = fffffffffa000000
!	%l5  = 00000000a048f6fa
!	%l7  = ffffffa3b1b498e2
	set	p0_b33,%o7
	fbule,a	p0_far_2_le	! Branch Taken, %fcc0 = 0

p0_label_28:
!	Mem[0000000011000000] = ffffffff, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x021,%g2
p0_b33:
!	Registers modified during the branch to p0_far_2
!	%l0  = ffffffffffffffff
!	%l1  = 0000005c4e4b671d
!	%l3  = 0000000000000000
!	%l5  = 4fbfdffffffff13e
	membar	#Sync			! Added by membar checker (27)
!	%l0 = ffffffffffffffff, %l0 = ffffffffffffffff, %l0 = ffffffffffffffff
	add	%l0,%l0,%l0		! %l0 = fffffffffffffffe
!	%l0 = fffffffffffffffe, immed = 000000cc, %l5 = 4fbfdffffffff13e
	orncc	%l0,0x0cc,%l5		! %l5 = ffffffffffffffff, %ccr = 88
!	%l2 = fffffffffa000000, immed = 00000de2, %l6 = 000000000000ffff
	orcc	%l2,0xde2,%l6		! %l6 = fffffffffa000de2, %ccr = 88
!	%l5 = ffffffffffffffff, %l6 = fffffffffa000de2, %l1 = 0000005c4e4b671d
	and	%l5,%l6,%l1		! %l1 = fffffffffa000de2

p0_label_29:
!	%l0 = fffffffffffffffe, Mem[0000000010000000] = 51a66245
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010000000] = fffe6245
	set	p0_b34,%o7
	fbe	p0_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000010000000] = fffe6245, %l0 = fffffffffffffffe
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = fffffffffffe6245
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x022,%g2
p0_b34:
!	Registers modified during the branch to p0_far_3
!	%l1  = fffffffffffff9fa
!	%l2  = 000000000000a429
!	%l7  = 00000000000064bb
	membar	#Sync			! Added by membar checker (28)
	set	p0_b35,%o7
	fbule,a,pn %fcc3,p0_near_3_he	! Branch Taken, %fcc3 = 1
!	Mem[00000000100000e0] = 662528b5 88f902f2 b28f9382 5885c8d6
	prefetch [%i0+0x0e0],20
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x023,%g2
p0_b35:
!	Registers modified during the branch to p0_near_3
!	%l0  = 000000000000a000
!	%l1  = 000000007fe0c689
!	%l3  = ffffffffffffffff
!	%l6  = 0000000000000079

p0_label_30:
	membar	#Sync			! Added by membar checker (29)
!	%l5 = ffffffffffffffff, Mem[0000000011000008] = 8469806c
	stha	%l5,[%i2+%o6]0x80	! Mem[0000000011000008] = ffff806c
!	%f28 = c1a4235b, %f3  = e0000000, %f29 = 9e000000
	fmuls	%f28,%f3 ,%f29		! %f29 = 6224235b
	fblg,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000100000e0] = 662528b5 88f902f2 b28f9382 5885c8d6
	prefetch [%i0+0x0e0],2
p0_b36:
	membar	#Sync			! Added by membar checker (30)
	set	p0_b37,%o7
	fbo,a,pn %fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 0

p0_label_31:
!	Mem[0000000011800008] = 00000000, %l3 = ffffffffffffffff
	ldsha	[%i3+%o6]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x025,%g2
p0_b37:
!	Registers modified during the branch to p0_near_1
!	%l0  = 00009ffff8a4e000
!	%l3  = 18d1200000000000
	set	p0_b38,%o7
	fbo	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	%l5 = ffffffffffffffff, Mem[0000000013000008] = 24bc3ece
	stwa	%l5,[%i6+%o6]0x80	! Mem[0000000013000008] = ffffffff
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x026,%g2
p0_b38:
!	Registers modified during the branch to p0_far_3
!	%l1  = ffffffffffffffff
!	%l6  = a000000000000000
	membar	#Sync			! Added by membar checker (31)
!	Branch On Register, %l1 = ffffffffffffffff
	brlez,a,pn %l1,p0_b39		! Branch Taken
!	Mem[0000000031800009] = f3f640e6, %l3 = 18d1200000000000
	ldstub	[%o3+0x009],%l3		! %l3 = 00000000000000f6
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x027,%g2
p0_b39:

p0_label_32:
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000011000000] = ffffffff, %l1 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000003100000a] = 8b9a806c, %l4 = 00000000000000cd
	ldstuba	[%o2+0x00a]%asi,%l4	! %l4 = 0000000000000080
!	%f22 = c3a009f3, %f18 = 77da0ad3 773c8ab4
	fitod	%f22,%f18		! %f18 = c1ce2ffb 06800000
!	Mem[0000000012800000] = 93d8beea 6255eb16 eb8e3664 0b1a9739
	prefetch [%i5+0x000],2
!	%f14 = 00000000, %f11 = 77225ed2, %f16 = 41d0747e
	fdivs	%f14,%f11,%f16		! %f16 = 00000000

p0_label_33:
!	Mem[0000000010800000] = 231007de, %l1 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000023
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000008] = ffff806c, %l3 = 00000000000000f6
	ldstuba	[%i2+%o6]0x80,%l3	! Annulled
p0_b40:
	membar	#Sync			! Added by membar checker (33)
!	%f18 = c1ce2ffb 06800000, %f28 = c1a4235b 6224235b
	fmovd	%f18,%f28		! %f28 = c1ce2ffb 06800000
	set	p0_b41,%o7
	fbo	p0_far_3_le	! Branch Taken, %fcc0 = 0

p0_label_34:
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],16
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x029,%g2
p0_b41:
!	Registers modified during the branch to p0_far_3
!	%l1  = ffffffffffffffff
!	%l6  = 0000000000000000
	fbne	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800008] = 00000e00, %l1 = ffffffffffffffff
	lduha	[%i1+%o6]0x80,%l1	! %l1 = 0000000000000000
p0_b42:
	membar	#Sync			! Added by membar checker (34)
!	%f21 = 52756a9b, %f18 = c1ce2ffb 06800000
	fstox	%f21,%f18		! %f18 = 0000003d 5aa6c000
!	%f26 = c1bf95ec, %f14 = 00000000, %f1  = 9e49f91e
	fsubs	%f26,%f14,%f1 		! %f1  = c1bf95ec

p0_label_35:
!	Mem[0000000010800050] = f276d9c5, %l4 = 0000000000000080
	ldsh	[%i1+0x052],%l4		! %l4 = ffffffffffffd9c5
	fbu,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[00000000118000e0] = fdb8c54a b2b67686 0295b4c8 0030e291
	prefetch [%i3+0x0e0],16
p0_b43:
	membar	#Sync			! Added by membar checker (35)
!	%l6 = 0000000000000000, Mem[00000000110000c6] = 700727dc
	stha	%l6,[%i2+0x0c6]%asi	! Mem[00000000110000c4] = 70070000
!	%l3 = 00000000000000f6, Mem[0000000030800004] = 7fe0c689
	stba	%l3,[%o1+0x004]%asi	! Mem[0000000030800004] = f6e0c689

p0_label_36:
!	%l4 = ffffd9c5, %l5 = ffffffff, Mem[0000000011000000] = ffffffff f8aa78cd
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000011000000] = ffffd9c5 ffffffff
	fbge,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000011000008] = ffff806c, %l6 = 0000000000000000
	ldswa	[%i2+%o6]0x80,%l6	! Annulled
p0_b44:
	membar	#Sync			! Added by membar checker (36)
!	%f10 = a9061ce8, %f28 = c1ce2ffb
	fabss	%f10,%f28		! %f28 = 29061ce8
!	Mem[0000000011800008] = 00000000f8aa78cd, %l4 = ffffffffffffd9c5
	ldxa	[%i3+%o6]0x80,%l4	! %l4 = 00000000f8aa78cd

p0_label_37:
!	%f2  = 41a4ccdb e0000000, %f22 = c3a009f3
	fdtos	%f2 ,%f22		! %f22 = 4d2666df
!	Branch On Register, %l7 = 00000000000064bb
	brlz,a,pn %l7,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010800000] = ff1007de 6f902ede 00000e00 f1f6afff
	prefetch [%i1+0x000],23	! Annulled
p0_b45:
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000003100000c] = e5340074, %l4 = 00000000f8aa78cd
	ldsw	[%o2+0x00c],%l4		! Annulled
p0_b46:

p0_label_38:
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000011000090] = 045c922f, %l5 = ffffffffffffffff
	swapa	[%i2+0x090]%asi,%l5	! %l5 = 00000000045c922f
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	 Annulled
	ldda	[%i6+%o6]0x80,%l2
p0_b47:
	membar	#Sync			! Added by membar checker (38)
!	%l1 = 0000000000000000, Mem[0000000011800000] = ff9c8f17
	stwa	%l1,[%i3+%g0]0x80	! Mem[0000000011800000] = 00000000
!	%l5 = 00000000045c922f, immed = 0000000e, %l7 = 00000000000064bb
	sll	%l5,0x00e,%l7		! %l7 = 00000117248bc000

p0_label_39:
	set	p0_b48,%o7
	fble,a	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800028] = 0b3cc928, %l4 = 00000000f8aa78cd
	ldub	[%i1+0x029],%l4		! %l4 = 000000000000003c
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x030,%g2
p0_b48:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l1  = fffffee8db743fff
!	%l3  = 0000000000000000
!	%l5  = fffffffffffff1c8
	membar	#Sync			! Added by membar checker (39)
!	%l1 = fffffee8db743fff, immed = fffff64b, %y  = 00009fff
	sdiv	%l1,-0x9b5,%l1		! %l1 = ffffffff80000000
!	Jump to jmpl_1, CWP = 0
	set	p0_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[00000000110000e7] = 1536dc46, %l7 = 00000117248bc000
	ldstub	[%i2+0x0e7],%l7		! %l7 = 0000000000000046

p0_label_40:
!	Mem[0000000010800008] = 00000e00 f1f6afff, %l6 = 00000000, %l7 = 00000046
	ldda	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000e00 00000000f1f6afff
!	%l7 = 00000000f1f6afff, Mem[0000000011800034] = 6d17ccc6
	stwa	%l7,[%i3+0x034]%asi	! Mem[0000000011800034] = f1f6afff
!	%f22 = 4d2666df 26b34d3a, %f22 = 4d2666df 26b34d3a, %f0  = 39e92e2b c1bf95ec
	fdivd	%f22,%f22,%f0 		! %f0  = 3ff00000 00000000
	fbul	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000008] = ffff806c, %l5 = fffffffffffff1c8
	lduwa	[%i2+%o6]0x80,%l5	! %l5 = 00000000ffff806c
p0_b49:

p0_label_41:
	membar	#Sync			! Added by membar checker (40)
	set	p0_b50,%o7
	fbue,pt	%fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 0
!	%l7 = 00000000f1f6afff, Mem[0000000010800008] = 00000e00
	stha	%l7,[%i1+%o6]0x80	! Mem[0000000010800008] = afff0e00
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x032,%g2
p0_b50:
!	Registers modified during the branch to p0_near_0
!	%l0  = fffffffffffff68b
!	%l2  = 70ed4f488cc12faa
!	%l3  = 8f12b0b7733ed055
!	%l4  = 0000000080000ed9
!	%l6  = 0000000000000000
!	%l7  = 0000000080000e00
	set	p0_b51,%o7
	fbue,a	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	%l2 = 8cc12faa, %l3 = 733ed055, Mem[00000000118000b0] = d89103cd fd5d2941
	std	%l2,[%i3+0x0b0]	! Mem[00000000118000b0] = 8cc12faa 733ed055
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x033,%g2
p0_b51:
!	Registers modified during the branch to p0_far_3
!	%l1  = 00000000ffff806c
!	%l6  = 2000000000000000
	membar	#Sync			! Added by membar checker (41)
!	%f2  = 41a4ccdb e0000000, %f26 = c1bf95ec
	fdtos	%f2 ,%f26		! %f26 = 4d2666df

p0_label_42:
	set	p0_b52,%o7
	fbule,a,pt %fcc2,p0_near_1_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000011000000] = ffffd9c5, %l1 = 00000000ffff806c
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffffd9c5
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x034,%g2
p0_b52:
!	Registers modified during the branch to p0_near_1
!	%l1  = ffffffff00007b8e
!	%l7  = ffffffffffffda2c
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010800008] = afff0e00, %l6 = 2000000000000000
	lduwa	[%i1+%o6]0x80,%l6	! %l6 = 00000000afff0e00
!	%l0 = fffffffffffff68b, %l3 = 8f12b0b7733ed055, %l0 = fffffffffffff68b
	orn	%l0,%l3,%l0		! %l0 = ffffffffffffffab
!	Mem[0000000010000084] = db845697, %l2 = 70ed4f488cc12faa
	ldsba	[%i0+0x085]%asi,%l2	! %l2 = ffffffffffffff84

p0_label_43:
!	%l4 = 0000000080000ed9, immed = 0000051a, %l0 = ffffffffffffffab
	xnor	%l4,0x51a,%l0		! %l0 = ffffffff7ffff43c
	set	p0_b53,%o7
	fbul,a,pt %fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000030000000] = 74e79c14, %l5 = 00000000ffff806c
	ldsb	[%o0+0x003],%l5		! %l5 = 0000000000000014
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x035,%g2
p0_b53:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000005293
!	%l3  = 0000000000027f82
!	%l4  = 0000000000000400
!	%l5  = 0000000004ff04f6
!	%l7  = 04ff04cca01eead0
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000011800020] = 01833ae1 a9db312b fcb10966 37dcc4af
	prefetch [%i3+0x020],16
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_44:
!	Mem[0000000011000000] = ffff806c, %l3 = 0000000000027f82
	ldstuba	[%i2+%g0]0x80,%l3	! Annulled
p0_b54:
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000040000010] = 000064bb, %l6 = 00000000afff0e00
	lduwa	[%o5+0x010]%asi,%l6	! %l6 = 00000000000064bb
	fbl	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l1 = ffffffff00007b8e, Mem[0000000010000000] = fffe6245
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = 00007b8e
p0_b55:
	membar	#Sync			! Added by membar checker (45)
!	%l7 = 04ff04cca01eead0, %l1 = ffffffff00007b8e, %y  = 04ff04cc
	smulcc	%l7,%l1,%l3		! %l3 = ffffd1b9abf82f60, %ccr = 88

p0_label_45:
!	Mem[000000003100000c] = e5340074, %l6 = 00000000000064bb
	ldub	[%o2+0x00f],%l6		! %l6 = 0000000000000074
!	%f30 = 82687dd3 b6d6f528, %f0  = 3ff00000 00000000
	fcmped	%fcc2,%f30,%f0 		! %fcc2 = 1
!	%l7 = 04ff04cca01eead0, immed = 00000a3e, %l1 = ffffffff00007b8e
	subccc	%l7,0xa3e,%l1		! %l1 = 04ff04cca01ee092, %ccr = 08
!	%f15 = 47ede01c, %f11 = 77225ed2, %f6  = 00000000 6b354895
	nop
	set	p0_b56,%o7
	fbule,a,pn %fcc2,p0_near_0_he	! Branch Taken, %fcc2 = 1

p0_label_46:
!	Mem[0000000011800008] = 00000000, %l5 = 0000000004ff04f6
	lduha	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x038,%g2
p0_b56:
!	Registers modified during the branch to p0_near_0
!	%l1  = ffffffffffffffd0
!	%l2  = fffffffffa000000
!	%l5  = 00000000a048f6fa
!	%l7  = ffffffa3b1b498e2
	fbul,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldda	[%i1+%o6]0x80,%l2
p0_b57:
	membar	#Sync			! Added by membar checker (46)
!	%l6 = 0000000000000074, Mem[0000000010800008] = afff0e00
	stha	%l6,[%i1+%o6]0x80	! Mem[0000000010800008] = 00740e00
	bne,a	p0_b58			! Branch Taken, %ccr = 08, CWP = 0

p0_label_47:
!	Mem[000000001080007c] = b793fb62, %l4 = 0000000000000400
	ldstub	[%i1+0x07c],%l4		! %l4 = 00000000000000b7
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x03a,%g2
p0_b58:
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000011800020] = 01833ae1 a9db312b fcb10966 37dcc4af
	prefetcha [%i3+0x020]%asi,4
!	%l2 = fa000000, %l3 = abf82f60, Mem[0000000010000000] = 00007b8e 005cbc5f
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010000000] = fa000000 abf82f60
!	%l4 = 000000b7, %l5 = a048f6fa, Mem[0000000010000010] = 4f11b5bf 947d02a2
	std	%l4,[%i0+0x010]	! Mem[0000000010000010] = 000000b7 a048f6fa
	bg	p0_not_taken_0		! Branch Not Taken, %ccr = 08

p0_label_48:
!	Mem[0000000010000000] = fa000000, %l6 = 0000000000000074
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = fffffffffa000000
p0_b59:
	membar	#Sync			! Added by membar checker (48)
!	Branch On Register, %l4 = 00000000000000b7
	brlez,a,pn %l4,p0_not_taken_0	! Branch Not Taken
!	Mem[00000000118000d4] = c70e2463, %l3 = ffffd1b9abf82f60
	ldub	[%i3+0x0d6],%l3		! Annulled
p0_b60:
	membar	#Sync			! Added by membar checker (49)
!	%l6 = fa000000, %l7 = b1b498e2, Mem[0000000010800008] = 00740e00 f1f6afff
	stda	%l6,[%i1+%o6]0x80	! Mem[0000000010800008] = fa000000 b1b498e2
!	%f7  = 6b354895, %f17 = f73c8ab4
	fmovs	%f7 ,%f17		! %f17 = 6b354895

p0_label_49:
!	%l3 = ffffd1b9abf82f60, %l0 = 0000000000005293, %l2 = fffffffffa000000
	sra	%l3,%l0,%l2		! %l2 = fffffffffffff57f
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetcha [%o4+0x020]%asi,1
	set	p0_b61,%o7
	fbuge,a,pn %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 0
!	%l0 = 0000000000005293, Mem[0000000011800008] = 00000000
	stha	%l0,[%i3+%o6]0x80	! Mem[0000000011800008] = 52930000
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x03d,%g2
p0_b61:
!	Registers modified during the branch to p0_near_0
!	%l0  = 00000000045e435c
!	%l2  = 70ed4f488cc12faa
!	%l3  = fffff1bffbfeff75
!	%l4  = 00000000f9ffffd9
!	%l6  = 00000000045e4cd1
!	%l7  = 00000000f9ffffd0
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000031800040] = 0d59b4c9 1c3dd8b9, %l4 = f9ffffd9, %l5 = a048f6fa
	ldd	[%o3+0x040],%l4		! %l4 = 000000000d59b4c9 000000001c3dd8b9

p0_label_50:
	set	p0_b62,%o7
	fbge	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000118000dc] = a4fdb2ee, %l6 = 00000000045e4cd1
	ldsw	[%i3+0x0dc],%l6		! %l6 = ffffffffa4fdb2ee
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x03e,%g2
p0_b62:
!	Registers modified during the branch to p0_far_3
!	%l1  = 000000001c3dd8b9
!	%l6  = 2000000000000000
	set	p0_b63,%o7
	fbuge,a	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011000078] = 543eaed6, %l0 = 00000000045e435c
	lduh	[%i2+0x07a],%l0		! %l0 = 000000000000aed6
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x03f,%g2
p0_b63:
!	Registers modified during the branch to p0_far_3
!	%l1  = 000000001c3dd8b9
!	%l6  = 2000000000000000
	membar	#Sync			! Added by membar checker (51)
!	%l5 = 000000001c3dd8b9, Mem[00000000108000ea] = 133a660e
	sth	%l5,[%i1+0x0ea]		! Mem[00000000108000e8] = 133ad8b9

p0_label_51:
!	%f16 = 00000000, %f25 = 0820bf10, %f13 = 4d2666df
	fdivs	%f16,%f25,%f13		! %f13 = 00000000
	bl	p0_b64			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[0000000031800040] = 0d59b4c91c3dd8b9, %l2 = 70ed4f488cc12faa
	ldx	[%o3+0x040],%l2		! %l2 = 0d59b4c91c3dd8b9
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x040,%g2
p0_b64:
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000030800040] = 00000000, %l6 = 2000000000000000
	ldsh	[%o1+0x042],%l6		! %l6 = 0000000000000000
!	%l2 = 0d59b4c91c3dd8b9, immed = 0000001c, %l7 = 00000000f9ffffd0
	sll	%l2,0x01c,%l7		! %l7 = 91c3dd8b90000000

p0_label_52:
!	%l4 = 000000000d59b4c9, %l4 = 000000000d59b4c9, %l7 = 91c3dd8b90000000
	or	%l4,%l4,%l7		! %l7 = 000000000d59b4c9
	set	p0_b65,%o7
	fbge,a,pt %fcc0,p0_near_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010000060] = f1dc0e62 2661f391 9b4f2c19 2be00efd
	prefetch [%i0+0x060],23
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x041,%g2
p0_b65:
!	Registers modified during the branch to p0_near_1
!	%l1  = ffffffffe3c2235b
!	%l7  = 000000000002bb58
	membar	#Sync			! Added by membar checker (53)
!	Denormal Floating Point Operation Nullified
	nop
!	%l7 = 000000000002bb58
	sethi	%hi(0x1e914800),%l7	! %l7 = 000000001e914800

p0_label_53:
!	%l5 = 000000001c3dd8b9, Mem[0000000010800008] = fa000000
	stwa	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = 1c3dd8b9
	set	p0_b66,%o7
	fble,a,pn %fcc1,p0_near_3_le	! Branch Taken, %fcc1 = 1
!	%l1 = ffffffffe3c2235b, Mem[00000000118000f8] = ffffff84
	stw	%l1,[%i3+0x0f8]		! Mem[00000000118000f8] = e3c2235b
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x042,%g2
p0_b66:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000005293
!	%l3  = 0000000000027f82
!	%l4  = 0d59b4c91c3ddd35
!	%l5  = 0000000004ff04f6
!	%l7  = 04ff04cca01eead0
	membar	#Sync			! Added by membar checker (54)
!	%f9  = 07000000, %f23 = 26b34d3a
	fmovs	%f9 ,%f23		! %f23 = 07000000
!	Mem[0000000031000008] = 8b9aff6c e5340074, %l6 = 00000000, %l7 = a01eead0
	ldd	[%o2+0x008],%l6		! %l6 = 000000008b9aff6c 00000000e5340074

p0_label_54:
!	%l4 = 0d59b4c91c3ddd35, %l2 = 0d59b4c91c3dd8b9, %l5 = 0000000004ff04f6
	andcc	%l4,%l2,%l5		! %l5 = 0d59b4c91c3dd831, %ccr = 00
!	Branch On Register, %l4 = 0d59b4c91c3ddd35
	brgez,pt %l4,p0_b67		! Branch Taken
!	Mem[0000000011000054] = cd9b639c, %l7 = 00000000e5340074
	lduw	[%i2+0x054],%l7		! %l7 = 00000000cd9b639c
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x043,%g2
p0_b67:
	bge	p0_b68			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000012800080] = b62c8d98, %l4 = 0d59b4c91c3ddd35
	ldsw	[%i5+0x080],%l4		! %l4 = ffffffffb62c8d98
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x044,%g2
p0_b68:

p0_label_55:
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031800008] = f3ff40e6, %l6 = 000000008b9aff6c
	lduw	[%o3+0x008],%l6		! %l6 = 00000000f3ff40e6
p0_b69:
	membar	#Sync			! Added by membar checker (55)
	nop
!	%l3 = 0000000000027f82, Mem[0000000011800030] = c65c821b
	stwa	%l3,[%i3+0x030]%asi	! Mem[0000000011800030] = 00027f82
!	Mem[000000001080004d] = 08669b45, %l0 = 0000000000005293
	ldstuba	[%i1+0x04d]%asi,%l0	! %l0 = 0000000000000066

p0_label_56:
!	%f0  = 3ff00000 00000000, %f23 = 07000000
	fdtos	%f0 ,%f23		! %f23 = 3f800000
	fbe,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l3 = 0000000000027f82, Mem[0000000030800044] = 54934dfd
	stb	%l3,[%o1+0x044]		! Mem[0000000030800044] = 82934dfd
p0_b70:
	membar	#Sync			! Added by membar checker (56)
!	%l4 = b62c8d98, %l5 = 1c3dd831, Mem[0000000032000020] = abf2ed78 dbe0a62d
	std	%l4,[%o4+0x020]	! Mem[0000000032000020] = b62c8d98 1c3dd831
	fbg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_57:
!	Mem[0000000030800004] = f6e0c689, %l5 = 0d59b4c91c3dd831
	lduw	[%o1+0x004],%l5		! %l5 = 00000000f6e0c689
p0_b71:
	membar	#Sync			! Added by membar checker (57)
!	Branch On Register, %l0 = 0000000000000066
	brgz,pn	%l0,p0_b72		! Branch Taken
!	Mem[0000000011000000] = ffff806c, %l6 = 00000000f3ff40e6
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffff806c
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x048,%g2
p0_b72:
	membar	#Sync			! Added by membar checker (58)
!	%f1  = 00000000, %f19 = 5aa6c000, %f8  = 41d1fb78
	fdivs	%f1 ,%f19,%f8 		! %f8  = 00000000
!	%l6 = ffffffffffff806c, %l4 = ffffffffb62c8d98, %l0 = 0000000000000066
	subccc	%l6,%l4,%l0		! %l0 = 0000000049d2f2d4, %ccr = 00

p0_label_58:
!	Mem[0000000010800000] = ff1007de 6f902ede 1c3dd8b9 b1b498e2
	prefetch [%i1+0x000],20
!	%l4 = b62c8d98, %l5 = f6e0c689, Mem[0000000011800008] = 52930000 f8aa78cd
	stda	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = b62c8d98 f6e0c689
	fblg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011800000] = 00000000, %l3 = 0000000000027f82
	ldsha	[%i3+%g0]0x80,%l3	! Annulled
p0_b73:
	membar	#Sync			! Added by membar checker (59)
!	Branch On Register, %l2 = 0d59b4c91c3dd8b9
	brnz,a,pt %l2,p0_b74		! Branch Taken

p0_label_59:
!	%l5 = 00000000f6e0c689, Mem[0000000010800008] = 1c3dd8b9
	stha	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = c689d8b9
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x04a,%g2
p0_b74:
	membar	#Sync			! Added by membar checker (60)
!	Mem[000000003180004c] = a904d01d, %l6 = ffffffffffff806c
	lduw	[%o3+0x04c],%l6		! %l6 = 00000000a904d01d
	bpos	p0_b75			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000011800014] = 1cb6a6e3, %l4 = ffffffffb62c8d98
	ldsh	[%i3+0x016],%l4		! %l4 = ffffffffffffa6e3
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x04b,%g2
p0_b75:
	membar	#Sync			! Added by membar checker (61)
!	%f0  = 3ff00000, %f15 = 47ede01c, %f25 = 0820bf10
	fsubs	%f0 ,%f15,%f25		! %f25 = c7eddf2c

p0_label_60:
!	%f2  = 41a4ccdb e0000000, %f22 = 4d2666df 3f800000
	fcmpd	%fcc1,%f2 ,%f22		! %fcc1 = 1
!	%l4 = ffffffffffffa6e3, Mem[000000003080000f] = 35761dd0
	stba	%l4,[%o1+0x00f]%asi	! Mem[000000003080000c] = 35761de3
!	Mem[0000000011800008] = b62c8d98, %l0 = 0000000049d2f2d4
	ldstuba	[%i3+%o6]0x80,%l0	! %l0 = 00000000000000b6
!	Mem[0000000030800008] = 2fce25b335761de3, %l3 = 0000000000027f82
	ldx	[%o1+0x008],%l3		! %l3 = 2fce25b335761de3
!	%l2 = 0d59b4c91c3dd8b9, %l3 = 2fce25b335761de3, %l1 = ffffffffe3c2235b
	addcc	%l2,%l3,%l1		! %l1 = 3d27da7c51b3f69c, %ccr = 00

p0_label_61:
!	Branch On Register, %l6 = 00000000a904d01d
	brnz,a,pn %l6,p0_b76		! Branch Taken
!	Mem[0000000011800000] = 00000000, %l6 = 00000000a904d01d
	ldswa	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x04c,%g2
p0_b76:
	membar	#Sync			! Added by membar checker (62)
!	%f12 = 82687dd3, %f26 = 4d2666df 3167fded
	fitod	%f12,%f26		! %f26 = c1df65e0 8b400000
	ba,a	p0_b77			! Branch Taken, %ccr = 00, CWP = 0
!	%l6 = 0000000000000000, Mem[0000000011000000] = ffff806c
	stwa	%l6,[%i2+%g0]0x80	! Annulled
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x04d,%g2
p0_b77:

p0_label_62:
	membar	#Sync			! Added by membar checker (63)
!	%l5 = 00000000f6e0c689, %l2 = 0d59b4c91c3dd8b9, %y  = 04ff04cc
	smul	%l5,%l2,%l1		! %l1 = fefe618d5a981101
!	%f28 = 29061ce8, %f23 = 3f800000, %f3  = e0000000
	fdivs	%f28,%f23,%f3 		! %f3  = 29061ce8
!	%l6 = 0000000000000000
	setx	0x3bc8d2ec3bc8d2ec,%g7,%l6 ! %l6 = 3bc8d2ec3bc8d2ec
!	Mem[0000000031000040] = ffc44646 a89260b3, %l6 = 3bc8d2ec, %l7 = cd9b639c
	ldd	[%o2+0x040],%l6		! %l6 = 00000000ffc44646 00000000a89260b3
	set	p0_b78,%o7
	fbo,a	p0_far_2_le	! Branch Taken, %fcc0 = 0

p0_label_63:
!	Mem[0000000031800040] = 0d59b4c9, %l1 = fefe618d5a981101
	lduw	[%o3+0x040],%l1		! %l1 = 000000000d59b4c9
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x04e,%g2
p0_b78:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l1  = ffffffff576d9f4c
!	%l3  = 0000000000000000
!	%l5  = d031da4cca89ecdd
	set	p0_b79,%o7
	fbule	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000108000e0] = 5f17043e 9c079afd 133ad8b9 48c6327c
	prefetch [%i1+0x0e0],20
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x04f,%g2
p0_b79:
!	Registers modified during the branch to p0_far_1
!	%l0  = d031da4cca89ecdd
!	%l2  = 000000007fffee81
!	%l6  = 00000000ffc43955
	membar	#Sync			! Added by membar checker (64)
	fbn,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l6 = ffc43955, %l7 = a89260b3, Mem[0000000031800048] = 5442f0c1 a904d01d
	std	%l6,[%o3+0x048]	! Mem[0000000031800048] = ffc43955 a89260b3
p0_b80:

p0_label_64:
	membar	#Sync			! Added by membar checker (65)
!	Mem[00000000110000d8] = 3f0ecdc9, %l4 = ffffffffffffa6e3
	ldsha	[%i2+0x0d8]%asi,%l4	! %l4 = 0000000000003f0e
	fbul,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000012800000] = 93d8beea, %l7 = 00000000a89260b3
	lduba	[%i5+%g0]0x80,%l7	! Annulled
p0_b81:
	membar	#Sync			! Added by membar checker (66)
!	%l1 = ffffffff576d9f4c, %l3 = 0000000000000000, %l0 = d031da4cca89ecdd
	sllx	%l1,%l3,%l0		! %l0 = ffffffff576d9f4c
!	%l0 = ffffffff576d9f4c
	setx	0x171a30a2171a30a2,%g7,%l0 ! %l0 = 171a30a2171a30a2

p0_label_65:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l5 = d031da4cca89ecdd, Mem[0000000011800008] = ff2c8d98
	stwa	%l5,[%i3+%o6]0x80	! Mem[0000000011800008] = ca89ecdd
p0_b82:
	membar	#Sync			! Added by membar checker (67)
!	%f0  = 3ff00000 00000000, %f21 = 52756a9b
	fdtos	%f0 ,%f21		! %f21 = 3f800000
!	%l5 = d031da4cca89ecdd
	sethi	%hi(0xf8444000),%l5	! %l5 = 00000000f8444000
!	%l6 = 00000000ffc43955, immed = fffffa1c, %l3 = 0000000000000000
	orcc	%l6,-0x5e4,%l3		! %l3 = fffffffffffffb5d, %ccr = 88

p0_label_66:
	set	p0_b83,%o7
	fbule,pn %fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000010800000] = ff1007de, %l5 = 00000000f8444000
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff1007de
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x053,%g2
p0_b83:
!	Registers modified during the branch to p0_near_2
!	%l2  = 171a30a2171a3da7
!	%l5  = ffffffff00eff82b
!	%l6  = 000000000000000a
	membar	#Sync			! Added by membar checker (68)
	set	p0_b84,%o7
	fbl,pt	%fcc2,p0_near_2_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000011000014] = 64be68de, %l2 = 171a30a2171a3da7
	lduh	[%i2+0x014],%l2		! %l2 = 00000000000064be
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x054,%g2
p0_b84:
!	Registers modified during the branch to p0_near_2
!	%l1  = 0000000000000000
!	%l4  = 171a30a2000a3020
!	%l5  = ffffffff00eff835
	membar	#Sync			! Added by membar checker (69)
!	%f30 = 82687dd3, %f8  = 00000000
	fnegs	%f30,%f8 		! %f8  = 02687dd3

p0_label_67:
!	%l0 = 171a30a2171a30a2, Mem[0000000011000000] = ffff806c
	stba	%l0,[%i2+%g0]0x80	! Mem[0000000011000000] = a2ff806c
!	%f23 = 3f800000, %f6  = 00000000, %f29 = 06800000
	fadds	%f23,%f6 ,%f29		! %f29 = 3f800000
!	Mem[00000000118000a0] = ccec9797 2b89162f 04ff04f6 f5acf0f2
	prefetch [%i3+0x0a0],21
!	%l0 = 171a30a2171a30a2, immed = fffff9d9, %l4 = 171a30a2000a3020
	andncc	%l0,-0x627,%l4		! %l4 = 0000000000000022, %ccr = 00
	fbu,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_68:
!	Mem[0000000010000090] = 92981006, %l5 = ffffffff00eff835
	lduw	[%i0+0x090],%l5		! %l5 = 0000000092981006
p0_b85:
	membar	#Sync			! Added by membar checker (70)
!	%f6  = 00000000, %f13 = 00000000, %f22 = 4d2666df 3f800000
	fsmuld	%f6 ,%f13,%f22		! %f22 = 00000000 00000000
	set	p0_b86,%o7
	fbe,a	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000000] = 1f1cf2e7, %l2 = 00000000000064be
	ldub	[%o4+0x000],%g2		! %g2 = 000000000000001f
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x056,%g2
p0_b86:
!	Registers modified during the branch to p0_far_0
!	%l4  = e8e5cf5de8e5cf57
!	%l5  = 171a30a2171a3000
	membar	#Sync			! Added by membar checker (71)
!	%l5 = 171a30a2171a3000, %l6 = 000000000000000a, %l1 = 0000000000000000
	add	%l5,%l6,%l1		! %l1 = 171a30a2171a300a

p0_label_69:
	nop
!	Mem[0000000010800000] = ff1007de, %l6 = 000000000000000a
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffff10
!	Mem[000000001180003c] = 39bbc054, %l5 = 171a30a2171a3000
	lduha	[%i3+0x03c]%asi,%l5	! %l5 = 00000000000039bb
!	Mem[0000000010800090] = 00000000 000039bb, %l0 = 171a30a2171a30a2, %l5 = 00000000000039bb
	add	%i1,0x90,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 70ed4f488cc12faa
!	%f22 = 00000000 00000000, %f0  = 3ff00000 00000000, %f22 = 00000000 00000000
	faddd	%f22,%f0 ,%f22		! %f22 = 3ff00000 00000000

p0_label_70:
!	%l2 = 00000000000064be, %l0 = 171a30a2171a30a2, %l0 = 171a30a2171a30a2
	addc	%l2,%l0,%l0		! %l0 = 171a30a2171a9560
	set	p0_b87,%o7
	fbo,a	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800040] = 9283bfd5 c256a6e8 1b689d26 08ff9b45
	prefetch [%i1+0x040],3
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x057,%g2
p0_b87:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l1  = ffffffff576d9f4c
!	%l3  = 0000000000000000
!	%l5  = 0000000000000a63
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800000] = ff1007de, %l5 = 0000000000000a63
	lduba	[%i1+%g0]0x80,%l5	! Annulled
p0_b88:

p0_label_71:
	membar	#Sync			! Added by membar checker (72)
!	Mem[0000000031000008] = 8b9aff6c e5340074, %l4 = e8e5cf57, %l5 = 00000a63
	ldd	[%o2+0x008],%l4		! %l4 = 000000008b9aff6c 00000000e5340074
!	%l4 = 000000008b9aff6c, immed = fffff0bd, %l4 = 000000008b9aff6c
	subc	%l4,-0xf43,%l4		! %l4 = 000000008b9b0eaf
!	Branch On Register, %l6 = ffffffffffffff10
	brlz,pt	%l6,p0_b89		! Branch Taken
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],23
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x059,%g2
p0_b89:
	membar	#Sync			! Added by membar checker (73)
!	%l4 = 000000008b9b0eaf, %l2 = 00000000000064be, %l2 = 00000000000064be
	xnor	%l4,%l2,%l2		! %l2 = ffffffff746495ee

p0_label_72:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000013000094] = 73251f14, %l4 = 000000008b9b0eaf
	ldsw	[%i6+0x094],%l4		! %l4 = 0000000073251f14
p0_b90:
	membar	#Sync			! Added by membar checker (74)
!	%f24 = f5ee5231 c7eddf2c, %f22 = 3ff00000 00000000, %f24 = f5ee5231 c7eddf2c
	fdivd	%f24,%f22,%f24		! %f24 = f5ee5231 c7eddf2c
!	%l3 = 0000000000000000, Mem[0000000031800008] = f3ff40e694ca9adc
	stx	%l3,[%o3+0x008]		! Mem[0000000031800008] = 0000000000000000
	set	p0_b91,%o7
	fbul,a,pt %fcc1,p0_near_1_le	! Branch Taken, %fcc1 = 1

p0_label_73:
!	Mem[0000000011800078] = 9f5291e357eed3e0, %l1 = ffffffff576d9f4c
	ldx	[%i3+0x078],%l1		! %l1 = 9f5291e357eed3e0
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x05b,%g2
p0_b91:
!	Registers modified during the branch to p0_near_1
!	%l1  = ffffffff1acbfb96
!	%l7  = 0000000000000000
	bvc	p0_b92			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000010000000] = fa000000, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000fa
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x05c,%g2
p0_b92:
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000011800000] = 00000000, %l0 = 00000000000000fa
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010800000] = ff1007de 6f902ede c689d8b9 b1b498e2
	prefetch [%i1+0x000],2

p0_label_74:
	bgu,a	p0_b93			! Branch Taken, %ccr = 80, CWP = 0
!	%l3 = 0000000000000000, Mem[000000003200003c] = c74e0f0e
	stw	%l3,[%o4+0x03c]		! Mem[000000003200003c] = 00000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x05d,%g2
p0_b93:
	membar	#Sync			! Added by membar checker (76)
!	%l7 = 0000000000000000, %l5 = 00000000e5340074, %l3 = 0000000000000000
	orncc	%l7,%l5,%l3		! %l3 = ffffffff1acbff8b, %ccr = 80
!	%l5 = 00000000e5340074, immed = ffffffed, %l5 = 00000000e5340074
	or	%l5,-0x013,%l5		! %l5 = fffffffffffffffd
!	Mem[0000000030800040] = 00000000, %l1 = ffffffff1acbfb96
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 0000000000000000

p0_label_75:
!	%l7 = 0000000000000000, immed = fffff61b, %y  = fefe618d
	sdiv	%l7,-0x9e5,%l6		! %l6 = 000000007fffffff
!	Mem[0000000031000048] = 6171d395, %l4 = 0000000073251f14
	lduwa	[%o2+0x048]%asi,%l4	! %l4 = 000000006171d395
!	Mem[00000000108000f8] = 94efe48e, %l4 = 000000006171d395
	ldswa	[%i1+0x0f8]%asi,%l4	! %l4 = ffffffff94efe48e
!	%f21 = 3f800000, %f18 = 0000003d 5aa6c000
	fstox	%f21,%f18		! %f18 = 00000000 00000001
	set	p0_b94,%o7
	fblg,a,pn %fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 1

p0_label_76:
!	Mem[0000000030800044] = 82934dfd, %l2 = ffffffff746495ee
	swap	[%o1+0x044],%l2		! %l2 = 0000000082934dfd
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x05e,%g2
p0_b94:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000005293
!	%l3  = 0000000000027f82
!	%l4  = 0000000082935279
!	%l5  = 0000000004ff04f6
!	%l7  = 04ff04cca01eead0
	membar	#Sync			! Added by membar checker (77)
!	Branch On Register, %l5 = 0000000004ff04f6
	brlez,pn %l5,p0_not_taken_0	! Branch Not Taken
!	%l0 = 00005293, %l1 = 00000000, Mem[00000000108000a0] = 10a21895 58bd2664
	std	%l0,[%i1+0x0a0]	! Mem[00000000108000a0] = 00005293 00000000
p0_b95:
	membar	#Sync			! Added by membar checker (78)
!	%l0 = 0000000000005293, %l3 = 0000000000027f82, %l4 = 0000000082935279
	addcc	%l0,%l3,%l4		! %l4 = 000000000002d215, %ccr = 00
!	Mem[00000000130000bc] = 82bd1c1c, %l5 = 0000000004ff04f6
	lduha	[%i6+0x0bc]%asi,%l5	! %l5 = 00000000000082bd

p0_label_77:
	fbu,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000011000040] = f4184310 4e17dc6a a7b627b0 5c7f9b30
	prefetch [%i2+0x040],23
p0_b96:
	membar	#Sync			! Added by membar checker (79)
!	%l2 = 0000000082934dfd, Mem[0000000030000040] = 7838c84a
	stw	%l2,[%o0+0x040]		! Mem[0000000030000040] = 82934dfd
!	%f10 = a9061ce8 77225ed2, %f2  = 41a4ccdb 29061ce8
	fnegd	%f10,%f2 		! %f2  = 29061ce8 77225ed2
	set	p0_b97,%o7
	fbo,pn	%fcc2,p0_near_1_le	! Branch Taken, %fcc2 = 1

p0_label_78:
!	%l4 = 000000000002d215, Mem[0000000010800008] = c689d8b9b1b498e2
	stxa	%l4,[%i1+%o6]0x80	! Mem[0000000010800008] = 000000000002d215
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x061,%g2
p0_b97:
!	Registers modified during the branch to p0_near_1
!	%l1  = ffffffffffff795f
!	%l7  = 0000000000014a4c
	membar	#Sync			! Added by membar checker (80)
	set	p0_b98,%o7
	fbge,a,pt %fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000118000ac] = f5acf0f2, %l4 = 000000000002d215
	ldsb	[%i3+0x0ac],%l4		! %l4 = fffffffffffffff5
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x062,%g2
p0_b98:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000082934140
!	%l1  = 00000000f6e0c689
!	%l3  = fffffffffffffabd
!	%l6  = 0000000000000079
	membar	#Sync			! Added by membar checker (81)
!	%l2 = 0000000082934dfd, immed = 0000011a, %l0 = 0000000082934140
	orcc	%l2,0x11a,%l0		! %l0 = 0000000082934dff, %ccr = 08
	set	p0_b99,%o7
	fbule,a,pt %fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 1

p0_label_79:
!	Mem[0000000010000008] = 0000dd55, %l6 = 0000000000000079
	ldsba	[%i0+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x063,%g2
p0_b99:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000005293
!	%l3  = 0000000000027f82
!	%l4  = 0000000082935279
!	%l5  = 0000000004ff04f6
!	%l7  = 04ff04cca01eead0
	membar	#Sync			! Added by membar checker (82)
!	%l7 = 04ff04cca01eead0, %l5 = 0000000004ff04f6, %l5 = 0000000004ff04f6
	andncc	%l7,%l5,%l5		! %l5 = 04ff04cca000ea00, %ccr = 08
!	%l3 = 0000000000027f82, Mem[0000000010800008] = 00000000
	stha	%l3,[%i1+%o6]0x80	! Mem[0000000010800008] = 7f820000
!	%f12 = 82687dd3, %f18 = 00000000, %f8  = 02687dd3
	fadds	%f12,%f18,%f8 		! %f8  = 82687dd3
!	%f23 = 00000000, %f17 = 6b354895, %f0  = 3ff00000 00000000
	fsmuld	%f23,%f17,%f0 		! %f0  = 00000000 00000000

p0_label_80:
!	%f22 = 3ff00000, %f0  = 00000000, %f21 = 3f800000
	fmuls	%f22,%f0 ,%f21		! %f21 = 00000000
!	%l0 = 0000000000005293, immed = fffff65b, %y  = 04ff04cc
	sdiv	%l0,-0x9a5,%l2		! %l2 = ffffffff80000000
!	%f22 = 3ff00000 00000000, %f26 = c1df65e0 8b400000
	fabsd	%f22,%f26		! %f26 = 3ff00000 00000000
!	%l3 = 0000000000027f82, %l6 = 0000000000000000, %l6 = 0000000000000000
	orn	%l3,%l6,%l6		! %l6 = ffffffffffffffff
!	%f12 = 82687dd3 00000000, %f8  = 82687dd3 07000000, %f8  = 82687dd3 07000000
	faddd	%f12,%f8 ,%f8 		! %f8  = 82787dd3 03800000

p0_label_81:
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000011000000] = a2ff806c, %l3 = 0000000000027f82
	ldsha	[%i2+%g0]0x80,%l3	! Annulled
p0_b100:
	membar	#Sync			! Added by membar checker (83)
!	Mem[0000000010000050] = 8bed25bb 1b4459a3, %l6 = ffffffff, %l7 = a01eead0
	ldda	[%i0+0x050]%asi,%l6	! %l6 = 000000008bed25bb 000000001b4459a3
!	Mem[0000000030000004] = 262c9f8e, %l3 = 0000000000027f82
	lduha	[%o0+0x004]%asi,%l3	! %l3 = 000000000000262c
	set	p0_b101,%o7
	fbul,a,pn %fcc1,p0_near_0_le	! Branch Taken, %fcc1 = 1

p0_label_82:
!	Mem[0000000011000030] = eb89978e, %l4 = 0000000082935279
	ldub	[%i2+0x033],%l4		! %l4 = 000000000000008e
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x065,%g2
p0_b101:
!	Registers modified during the branch to p0_near_0
!	%l0  = 00000000045e435c
!	%l2  = 70ed4f488cc12faa
!	%l3  = 8f12b0b7733ef67d
!	%l4  = 0000000082cdeedd
!	%l6  = 00000000045e4cd1
!	%l7  = 0000000082cdec44
	membar	#Sync			! Added by membar checker (84)
!	%l0 = 00000000045e435c, %l5 = 04ff04cca000ea00, %l1 = 00000000f6e0c689
	andcc	%l0,%l5,%l1		! %l1 = 0000000000004200, %ccr = 00
	fbu,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000000] = ff000000, %l3 = 8f12b0b7733ef67d
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ff000000
p0_b102:
	membar	#Sync			! Added by membar checker (85)
!	Mem[0000000011800040] = 95c287f9 281873da 07498a0b cec1054d
	prefetcha [%i3+0x040]%asi,0

p0_label_83:
!	%l3 = 00000000ff000000, immed = 00000abd, %y  = 04ff04cc
	sdiv	%l3,0xabd,%l6		! %l6 = 000000007fffffff
!	Mem[0000000011000020] = 80efedba 2a65b82e 77787d06 d9387072
	prefetch [%i2+0x020],23
!	%l1 = 0000000000004200, immed = fffffa45, %l6 = 000000007fffffff
	and	%l1,-0x5bb,%l6		! %l6 = 0000000000004200
!	Jump to jmpl_1, CWP = 0
	set	p0_jmpl_1_he,%g1
	jmpl	%g1,%g6
!	Mem[00000000118000e0] = fdb8c54a b2b67686 0295b4c8 0030e291
	prefetch [%i3+0x0e0],3
!	Registers modified during the branch to p0_jmpl_1
!	%l6  = 0000000000000000

p0_label_84:
!	%l0 = 045e435c, %l1 = 00004200, Mem[0000000010800098] = 00000000 7fffee81
	std	%l0,[%i1+0x098]	! Mem[0000000010800098] = 045e435c 00004200
!	%l7 = 0000000082cdec44, immed = 00000009, %l3 = 00000000ff000000
	srl	%l7,0x009,%l3		! %l3 = 00000000004166f6
!	%l4 = 0000000082cdeedd, immed = fffff80b, %y  = 04ff04cc
	sdivx	%l4,-0x7f5,%l1		! %l1 = ffffffffffef8fa8
	bl,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000011000000] = a2ff806c, %l3 = 00000000004166f6
	lduwa	[%i2+%g0]0x80,%l3	! Annulled
p0_b103:

p0_label_85:
	membar	#Sync			! Added by membar checker (86)
!	%l7 = 0000000082cdec44, immed = 0000034e, %l7 = 0000000082cdec44
	add	%l7,0x34e,%l7		! %l7 = 0000000082cdef92
!	Branch On Register, %l5 = 04ff04cca000ea00
	brlz,pt	%l5,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010000008] = 0000dd55, %l7 = 0000000082cdef92
	ldsw	[%i0+0x008],%l7		! %l7 = 000000000000dd55
p0_b104:
	membar	#Sync			! Added by membar checker (87)
!	%l1 = ffffffffffef8fa8, immed = 0000095a, %y  = 04ff04cc
	umul	%l1,0x95a,%l7		! %l7 = 0000095966456910
!	%l0 = 00000000045e435c, immed = 0000001a, %l3 = 00000000004166f6
	srl	%l0,0x01a,%l3		! %l3 = 0000000000000001

p0_label_86:
!	Mem[00000000118000a0] = ccec9797 2b89162f 04ff04f6 f5acf0f2
	prefetch [%i3+0x0a0],23
!	%l4 = 0000000082cdeedd, Mem[0000000011000020] = 80efedba
	stb	%l4,[%i2+0x020]		! Mem[0000000011000020] = ddefedba
	set	p0_b105,%o7
	fbne,a,pt %fcc2,p0_near_3_le	! Branch Taken, %fcc2 = 1
!	Mem[00000000100000e0] = 662528b5 88f902f2 b28f9382 5885c8d6
	prefetch [%i0+0x0e0],22
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x069,%g2
p0_b105:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000005293
!	%l3  = 0000000000027f82
!	%l4  = 70ed4f488cc13426
!	%l5  = 0000000004ff04f6
!	%l7  = 04ff04cca01eead0
	membar	#Sync			! Added by membar checker (88)
!	%f29 = 3f800000, %f12 = 82687dd3 00000000
	fstox	%f29,%f12		! %f12 = 00000000 00000001

p0_label_87:
	fbug,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000010000084] = db845697, %l0 = 0000000000005293
	ldsh	[%i0+0x084],%l0		! %l0 = ffffffffffffdb84
p0_b106:
	membar	#Sync			! Added by membar checker (89)
!	%l1 = ffffffffffef8fa8, %l0 = ffffffffffffdb84, %l5 = 0000000004ff04f6
	or	%l1,%l0,%l5		! %l5 = ffffffffffffdfac
!	Mem[0000000040000010] = 00000000 0000db84, %l2 = 70ed4f488cc12faa, %l1 = ffffffffffef8fa8
	add	%o5,0x10,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 000064bb382f2a35
	bpos,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08

p0_label_88:
!	%l6 = 0000000000000000, Mem[0000000011800008] = ca89ecdd
	stwa	%l6,[%i3+%o6]0x80	! Annulled
p0_b107:
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000000] = 733ef67d, %l5 = ffffffffffffdfac
	ldstuba	[%i0+%g0]0x80,%l5	! Annulled
p0_b108:
	membar	#Sync			! Added by membar checker (90)
	set	p0_b109,%o7
	fbl,a,pt %fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 1
!	%l0 = ffffffffffffdb84, Mem[0000000031800009] = 00000000
	stb	%l0,[%o3+0x009]		! Mem[0000000031800008] = 00840000
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x06d,%g2
p0_b109:
!	Registers modified during the branch to p0_near_1
!	%l0  = ffffcfbf01ad676c
!	%l3  = e546a00000000000

p0_label_89:
	membar	#Sync			! Added by membar checker (91)
!	%l1 = 000064bb382f2a35, %l1 = 000064bb382f2a35, %l5 = ffffffffffffdfac
	subccc	%l1,%l1,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l2 = 70ed4f488cc12faa, %l4 = 70ed4f488cc13426, %l6 = 0000000000000000
	orcc	%l2,%l4,%l6		! %l6 = 70ed4f488cc13fae, %ccr = 08
	fbul,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003000000d] = 5246bfae, %l0 = ffffcfbf01ad676c
	ldstub	[%o0+0x00d],%l0		! Annulled
p0_b110:
	membar	#Sync			! Added by membar checker (92)
	fbg,a,pn %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 1

p0_label_90:
!	%l1 = 000064bb382f2a35, Mem[0000000010000008] = 0000dd557194ab49
	stxa	%l1,[%i0+%o6]0x80	! Annulled
p0_b111:
	membar	#Sync			! Added by membar checker (93)
!	Mem[0000000011000008] = ffff806c, %l1 = 000064bb382f2a35
	swapa	[%i2+%o6]0x80,%l1	! %l1 = 00000000ffff806c
!	%l7 = 04ff04cca01eead0, Mem[00000000100000ae] = c42fbd0c
	sth	%l7,[%i0+0x0ae]		! Mem[00000000100000ac] = c42fead0
!	Branch On Register, %l1 = 00000000ffff806c
	brgz,pn	%l1,p0_b112		! Branch Taken
!	%l4 = 8cc13426, %l5 = 00000000, Mem[0000000012000060] = f81ee9d9 8582a3a9
	std	%l4,[%i4+0x060]	! Mem[0000000012000060] = 8cc13426 00000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x070,%g2
p0_b112:

p0_label_91:
	membar	#Sync			! Added by membar checker (94)
!	%l0 = ffffcfbf01ad676c, immed = fffffac1, %y  = ffffcfbf
	sdiv	%l0,-0x53f,%l4		! %l4 = 000000007fffffff
!	%f26 = 3ff00000 00000000, %f8  = 82787dd3
	fdtoi	%f26,%f8 		! %f8  = 00000001
!	Mem[0000000010800000] = ff1007de 6f902ede 7f820000 0002d215
	prefetch [%i1+0x000],3
!	Mem[0000000010000064] = 2661f391, %l3 = e546a00000000000
	ldsha	[%i0+0x066]%asi,%l3	! %l3 = fffffffffffff391
	bcc	p0_b113			! Branch Taken, %ccr = 08, CWP = 0

p0_label_92:
!	Mem[0000000010000000] = 733ef67d abf82f60 0000dd55 7194ab49
	prefetch [%i0+0x000],1
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x071,%g2
p0_b113:
	membar	#Sync			! Added by membar checker (95)
!	Mem[0000000011000020] = ddefedba 2a65b82e
	flush	%i2+0x020
!	Mem[0000000010800000] = ff1007de 6f902ede, %l0 = 01ad676c, %l1 = ffff806c
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff1007de 000000006f902ede
!	%l0 = 00000000ff1007de, immed = fffff179, %y  = ffffcfbf
	umulcc	%l0,-0xe87,%l4		! %l4 = ff0ff9649e1db5ee, %ccr = 88
!	Mem[00000000110000b0] = f6583fa4, %l0 = ff1007de, %l4 = 9e1db5ee
	add	%i2,0xb0,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000f6583fa4

p0_label_93:
!	%l3 = fffffffffffff391, %l0 = 00000000ff1007de, %l1 = 000000006f902ede
	sra	%l3,%l0,%l1		! %l1 = ffffffffffffffff
!	%l0 = 00000000ff1007de, Mem[0000000010800058] = ec8f686abc7804f6
	stx	%l0,[%i1+0x058]		! Mem[0000000010800058] = 00000000ff1007de
	fbul	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 00000000f6583fa4, Mem[0000000010000000] = 733ef67d
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010000000] = f6583fa4
p0_b114:
	ba,a	p0_b115			! Branch Taken, %ccr = 88, CWP = 0

p0_label_94:
!	Mem[0000000031800048] = ffc43955a89260b3, %l5 = 0000000000000000
	ldx	[%o3+0x048],%l5		! Annulled
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x073,%g2
p0_b115:
	membar	#Sync			! Added by membar checker (96)
!	%f0  = 00000000 00000000, %f20 = 0f76be1f 00000000, %f22 = 3ff00000 00000000
	fdivd	%f0 ,%f20,%f22		! %f22 = 00000000 00000000
!	Mem[0000000011800000] = 0000000076223665, %l0 = 00000000ff1007de
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = 0000000076223665
!	Mem[0000000010000040] = c0e255a9 41e37dac d230e7de e0f55db6
	prefetcha [%i0+0x040]%asi,4
!	%f29 = 3f800000, %f24 = f5ee5231
	fstoi	%f29,%f24		! %f24 = 00000001

p0_label_95:
!	%l2 = 8cc12faa, %l3 = fffff391, Mem[0000000010000000] = f6583fa4 abf82f60
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010000000] = 8cc12faa fffff391
!	%f17 = 6b354895, %f4  = 1f7b741e 0a666df0
	fitod	%f17,%f4 		! %f4  = 41dacd52 25400000
!	%l6 = 70ed4f488cc13fae
	setx	0x4459883c4459883c,%g7,%l6 ! %l6 = 4459883c4459883c
!	Mem[00000000110000bf] = 8a67a9c1, %l6 = 4459883c4459883c
	ldstub	[%i2+0x0bf],%l6		! %l6 = 00000000000000c1
!	%f10 = a9061ce8 77225ed2, %f22 = 00000000 00000000, %f20 = 0f76be1f 00000000
	faddd	%f10,%f22,%f20		! %f20 = a9061ce8 77225ed2

p0_label_96:
!	%f14 = 00000000, %f29 = 3f800000, %f5  = 25400000
	fdivs	%f14,%f29,%f5 		! %f5  = 00000000
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l1 = ffffffffffffffff, Mem[0000000010800080] = 4926d769
	stw	%l1,[%i1+0x080]		! Mem[0000000010800080] = ffffffff
p0_b116:
	membar	#Sync			! Added by membar checker (97)
!	Branch On Register, %l0 = 0000000076223665
	brgz,pt	%l0,p0_b117		! Branch Taken
!	%l6 = 00000000000000c1, Mem[0000000010800008] = 7f820000
	stwa	%l6,[%i1+%o6]0x80	! Mem[0000000010800008] = 000000c1
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x075,%g2
p0_b117:

p0_label_97:
	membar	#Sync			! Added by membar checker (98)
!	Mem[0000000011800040] = 95c287f9 281873da 07498a0b cec1054d
	prefetcha [%i3+0x040]%asi,16
!	Mem[0000000013000074] = d5e49be6, %l2 = 70ed4f488cc12faa
	ldsb	[%i6+0x074],%l2		! %l2 = ffffffffffffffd5
!	Mem[0000000011000000] = a2ff806c, %l2 = ffffffffffffffd5
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffa2ff
!	%l3 = fffffffffffff391, %l2 = ffffffffffffa2ff, %l4 = 00000000f6583fa4
	orn	%l3,%l2,%l4		! %l4 = ffffffffffffff91
!	%f10 = a9061ce8, %f7  = 6b354895
	fnegs	%f10,%f7 		! %f7  = 29061ce8

p0_label_98:
!	%l4 = ffffffffffffff91, Mem[0000000010800000] = ff1007de
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010800000] = 911007de
!	%f31 = b6d6f528, %f28 = 29061ce8
	fmovs	%f31,%f28		! %f28 = b6d6f528
!	%f6  = 00000000, %f31 = b6d6f528
	fmovs	%f6 ,%f31		! %f31 = 00000000
	bl,a	p0_b118			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000011000008] = 382f2a35, %l3 = fffffffffffff391
	swapa	[%i2+%o6]0x80,%l3	! %l3 = 00000000382f2a35
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x076,%g2
p0_b118:

p0_label_99:
	membar	#Sync			! Added by membar checker (99)
!	%f2  = 29061ce8 77225ed2, %f18 = 00000000 00000001
	fnegd	%f2 ,%f18		! %f18 = a9061ce8 77225ed2
!	Mem[0000000030800048] = 9455101f, %l6 = 00000000000000c1
	lduha	[%o1+0x04a]%asi,%l6	! %l6 = 000000000000101f
!	%l0 = 76223665, %l1 = ffffffff, Mem[0000000030000048] = a3edb40c 44ede332
	stda	%l0,[%o0+0x048]%asi	! Mem[0000000030000048] = 76223665 ffffffff
	set	p0_b119,%o7
	fba,a	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	 Annulled
	ldd	[%o1+0x048],%l4
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x077,%g2
p0_b119:
!	Registers modified during the branch to p0_far_3
!	%l1  = 0000000000000000
!	%l6  = 2000000000000000

p0_label_100:
	membar	#Sync			! Added by membar checker (100)
!	%l4 = ffffffffffffff91, %l2 = ffffffffffffa2ff, %l4 = ffffffffffffff91
	xnorcc	%l4,%l2,%l4		! %l4 = ffffffffffffa291, %ccr = 88
!	%f4  = 41dacd52 00000000, %f14 = 00000000 47ede01c
	fmovd	%f4 ,%f14		! %f14 = 41dacd52 00000000
!	%f6  = 00000000, %f10 = a9061ce8
	fcmps	%fcc1,%f6 ,%f10		! %fcc1 = 2
!	%f6  = 00000000, %f7  = 29061ce8
	fitos	%f6 ,%f7 		! %f7  = 00000000
!	%l0 = 0000000076223665, %l7 = 04ff04cca01eead0, %l5 = 0000000000000000
	orn	%l0,%l7,%l5		! %l5 = fb00fb337fe3376f

p0_label_101:
!	%f6  = 00000000 00000000, %f8  = 00000001
	fxtos	%f6 ,%f8 		! %f8  = 00000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:

!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],4
!	%l2 = ffffffffffffa2ff, Mem[0000000011800058] = 695cd411
	stwa	%l2,[%i3+0x058]%asi	! Mem[0000000011800058] = ffffa2ff
!	%l0 = 0000000076223665, immed = fffff42c, %l6 = 2000000000000000
	addcc	%l0,-0xbd4,%l6		! %l6 = 0000000076222a91, %ccr = 11
!	%l4 = ffffffffffffa291, immed = 00000e46, %l1 = 0000000000000000
	orncc	%l4,0xe46,%l1		! %l1 = fffffffffffff3b9, %ccr = 88

p0_label_102:
!	Branch On Register, %l7 = 04ff04cca01eead0
	brlz,pn	%l7,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000011000008] = fffff39116a2c4b4, %l1 = fffffffffffff3b9
	ldxa	[%i2+%o6]0x80,%l1	! %l1 = fffff39116a2c4b4
p0_b120:
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011000020] = ddefedba 2a65b82e 77787d06 d9387072
	prefetch [%i2+0x020],22
p0_b121:
	membar	#Sync			! Added by membar checker (101)
!	Mem[0000000010000008] = 0000dd55, %l0 = 0000000076223665
	lduba	[%i0+%o6]0x80,%l0	! %l0 = 0000000000000000

p0_label_103:
	set	p0_b122,%o7
	fbne,a,pt %fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000011800008] = ca89ecdd, %l3 = 00000000382f2a35
	ldswa	[%i3+%o6]0x80,%l3	! %l3 = ffffffffca89ecdd
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x07a,%g2
p0_b122:
!	Registers modified during the branch to p0_near_2
!	%l2  = 0000000000000d05
!	%l5  = 04d4202412e970b4
!	%l6  = 002b24e892f5b824
	membar	#Sync			! Added by membar checker (102)
	nop
!	%f29 = 3f800000, %f18 = a9061ce8 77225ed2
	fstox	%f29,%f18		! %f18 = 00000000 00000001
	bne	p0_b123			! Branch Taken, %ccr = 00, CWP = 0

p0_label_104:
!	Mem[0000000011800008] = ca89ecddf6e0c689, %l6 = 002b24e892f5b824
	ldxa	[%i3+%o6]0x80,%l6	! %l6 = ca89ecddf6e0c689
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x07b,%g2
p0_b123:
	set	p0_b124,%o7
	fble,a	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000068] = 9bedc4d8, %l0 = 0000000000000000
	ldsh	[%o4+0x06a],%g2		! %g2 = ffffffffffff9bed
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x07c,%g2
p0_b124:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l1  = fb00fb335fe1152f
!	%l3  = 0000000000000000
!	%l5  = 0000000035761de3
	fbl	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000130000e0] = 2438852b 80f8044c 7e8b322e badebd00
	prefetch [%i6+0x0e0],2
p0_b125:

p0_label_105:
	membar	#Sync			! Added by membar checker (103)
!	%f6  = 00000000, %f20 = a9061ce8
	fitos	%f6 ,%f20		! %f20 = 00000000
!	%l1 = fb00fb335fe1152f, Mem[0000000031800040] = 0d59b4c9
	stha	%l1,[%o3+0x040]%asi	! Mem[0000000031800040] = 152fb4c9
	set	p0_b126,%o7
	fba,a	p0_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800000] = 911007de, %l7 = 04ff04cca01eead0
	lduba	[%i1+%g0]0x80,%l7	! Annulled
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x07e,%g2
p0_b126:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l2  = 000000007fffffff
!	%l4  = 0000000000000002
!	%l5  = 00000000d7397d89
!	%l7  = 0000000000000d04
	membar	#Sync			! Added by membar checker (104)
!	%l3 = 0000000000000000, immed = 00000695, %y  = ff0ff964
	udiv	%l3,0x695,%l0		! %l0 = 00000000ffffffff

p0_label_106:
!	%l3 = 0000000000000000, Mem[0000000010000030] = 94441d429056ee8a
	stx	%l3,[%i0+0x030]		! Mem[0000000010000030] = 0000000000000000
!	%l0 = 00000000ffffffff, %l4 = 0000000000000002, %l3 = 0000000000000000
	taddcc	%l0,%l4,%l3		! %l3 = 0000000100000001, %ccr = 03
	bcc	p0_not_taken_0		! Branch Not Taken, %ccr = 03
!	Mem[000000003080000c] = 35761de3, %l6 = ca89ecddf6e0c689
	lduh	[%o1+0x00e],%l6		! %l6 = 0000000000001de3
p0_b127:
	membar	#Sync			! Added by membar checker (105)
!	%f22 = 00000000 00000000, %f15 = 00000000
	fxtos	%f22,%f15		! %f15 = 00000000

p0_label_107:
!	%l1 = fb00fb335fe1152f, immed = 00000019, %l7 = 0000000000000d04
	srlx	%l1,0x019,%l7		! %l7 = 0000007d807d99af
!	%l1 = fb00fb335fe1152f
	sethi	%hi(0x41f65c00),%l1	! %l1 = 0000000041f65c00
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 03
!	Mem[0000000010800000] = 911007de6f902ede, %l6 = 0000000000001de3
	ldxa	[%i1+%g0]0x80,%l6	! Annulled
p0_b128:
	membar	#Sync			! Added by membar checker (106)
!	%l0 = 00000000ffffffff, Mem[00000000128000ee] = 9e6da62d
	stba	%l0,[%i5+0x0ee]%asi	! Mem[00000000128000ec] = 9e6dff2d

p0_label_108:
!	Mem[0000000010000008] = 0000dd55 7194ab49, %l0 = ffffffff, %l1 = 41f65c00
	ldda	[%i0+%o6]0x80,%l0	! %l0 = 000000000000dd55 000000007194ab49
!	%l0 = 000000000000dd55, %l4 = 0000000000000002, %l4 = 0000000000000002
	tsubcc	%l0,%l4,%l4		! %l4 = 000000000000dd53, %ccr = 02
	fbule,pn %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000011000040] = f4184310 4e17dc6a a7b627b0 5c7f9b30
	prefetch [%i2+0x040],16
p0_b129:
	membar	#Sync			! Added by membar checker (107)
!	%l3 = 0000000100000001, immed = 00000bd2, %l3 = 0000000100000001
	and	%l3,0xbd2,%l3		! %l3 = 0000000000000000

p0_label_109:
!	Mem[0000000011000030] = eb89978e 8495449c, %l4 = 0000dd53, %l5 = d7397d89
	ldda	[%i2+0x030]%asi,%l4	! %l4 = 00000000eb89978e 000000008495449c
!	Mem[0000000010000008] = 0000dd55, %l1 = 000000007194ab49
	lduba	[%i0+%o6]0x80,%l1	! %l1 = 0000000000000000
	set	p0_b130,%o7
	fblg,pt	%fcc1,p0_near_0_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000011800070] = 96e633d9 b43d92bf, %l0 = 0000dd55, %l1 = 00000000
	ldd	[%i3+0x070],%l0		! %l0 = 0000000096e633d9 00000000b43d92bf
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x082,%g2
p0_b130:
!	Registers modified during the branch to p0_near_0
!	%l1  = ffffffffffffffe3
!	%l2  = fffffffffc600000
!	%l5  = 00000000a048f6fa
!	%l7  = ffffffa3b1b498e2
	membar	#Sync			! Added by membar checker (108)
!	%l6 = 0000000000001de3, %l5 = 00000000a048f6fa, %l4 = 00000000eb89978e
	addcc	%l6,%l5,%l4		! %l4 = 00000000a04914dd, %ccr = 08

p0_label_110:
!	Mem[0000000010800008] = 000000c10002d215, %l5 = 00000000a048f6fa
	ldx	[%i1+0x008],%l5		! %l5 = 000000c10002d215
!	Mem[0000000011800080] = 138a5aec, %l2 = fffffffffc600000
	ldsba	[%i3+0x081]%asi,%l2	! %l2 = ffffffffffffff8a
!	Mem[0000000030800008] = 2fce25b3, %l6 = 0000000000001de3
	ldswa	[%o1+0x008]%asi,%l6	! %l6 = 000000002fce25b3
!	%l1 = ffffffffffffffe3, Mem[0000000032000068] = d3a59bedc4d847d0
	stx	%l1,[%o4+0x068]		! Mem[0000000032000068] = ffffffffffffffe3
	set	p0_b131,%o7
	fbe,a	p0_far_0_he	! Branch Taken, %fcc0 = 0

p0_label_111:
!	Mem[0000000011800008] = ca89ecdd, %l4 = 00000000a04914dd
	swapa	[%i3+%o6]0x80,%l4	! %l4 = 00000000ca89ecdd
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x083,%g2
p0_b131:
!	Registers modified during the branch to p0_far_0
!	%l1  = 00000000ca89f978
!	%l2  = 00000000ca89ecc0
!	%l4  = 0000000000000000
!	%l7  = ffffffa3b1b4a896
	membar	#Sync			! Added by membar checker (109)
!	Mem[0000000032000060] = 00000000 f8aa78cd ffffffff ffffffe3
	prefetcha [%o4+0x060]%asi,22
	fbg,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l6 = 000000002fce25b3, Mem[0000000011000008] = fffff39116a2c4b4
	stxa	%l6,[%i2+%o6]0x80	! Mem[0000000011000008] = 000000002fce25b3
p0_b132:
	membar	#Sync			! Added by membar checker (110)
!	%f5  = 00000000, %f30 = 82687dd3, %f10 = a9061ce8
	fmuls	%f5 ,%f30,%f10		! %f10 = 80000000

p0_label_112:
!	%l2 = 00000000ca89ecc0, immed = 00000efb, %y  = 00000000
	sdivx	%l2,0xefb,%l2		! %l2 = 00000000000d852b
!	Mem[000000001080002c] = 7f99ca6a, %l0 = 0000000096e633d9
	ldsba	[%i1+0x02e]%asi,%l0	! %l0 = ffffffffffffffca
!	%f26 = 3ff00000 00000000, %f12 = 00000000
	fdtoi	%f26,%f12		! %f12 = 00000001
!	%f26 = 3ff00000 00000000, %f13 = 00000001
	fdtoi	%f26,%f13		! %f13 = 00000001
!	%f6  = 00000000 00000000, %f26 = 3ff00000 00000000, %f30 = 82687dd3 00000000
	faddd	%f6 ,%f26,%f30		! %f30 = 3ff00000 00000000

p0_label_113:
!	%f31 = 00000000, %f20 = 00000000
	fstoi	%f31,%f20		! %f20 = 00000000
	set	p0_b133,%o7
	fblg,a,pt %fcc3,p0_near_1_le	! Branch Taken, %fcc3 = 1
!	%l1 = 00000000ca89f978, Mem[0000000011000008] = 00000000
	stwa	%l1,[%i2+%o6]0x80	! Mem[0000000011000008] = ca89f978
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x085,%g2
p0_b133:
!	Registers modified during the branch to p0_near_1
!	%l1  = ffffff3efffd29f7
!	%l7  = ffffffffffffff28
	membar	#Sync			! Added by membar checker (111)
!	%f27 = 00000000, %f12 = 00000001 00000001
	fstox	%f27,%f12		! %f12 = 00000000 00000000
!	Mem[00000000118000c0] = c481d55b 24bf5f48 2d0d4c89 b3d0891c
	prefetch [%i3+0x0c0],2

p0_label_114:
!	%l6 = 000000002fce25b3, immed = 00000b76, %y  = 00000000
	sdivcc	%l6,0xb76,%l0		! %l0 = 0000000000042bd0, %ccr = 00
!	Mem[0000000031800000] = f4763693 1c40ab3e, %l0 = 00042bd0, %l1 = fffd29f7
	ldda	[%o3+0x000]%asi,%l0	! %l0 = 00000000f4763693 000000001c40ab3e
!	Mem[0000000010800060] = d0f60d68 a2638cbe 3c53b7c8 bcb7df59
	prefetch [%i1+0x060],3
!	%l2 = 00000000000d852b, %l1 = 000000001c40ab3e, %y  = 00000000
	udiv	%l2,%l1,%l3		! %l3 = 0000000000000000
!	%l4 = 0000000000000000, %l5 = 000000c10002d215, %l0 = 00000000f4763693
	sllx	%l4,%l5,%l0		! %l0 = 0000000000000000

p0_label_115:
	set	p0_b134,%o7
	fbl,a,pn %fcc3,p0_near_3_he	! Branch Taken, %fcc3 = 1
!	Mem[0000000010000078] = 2756f1797ffff30e, %l6 = 000000002fce25b3
	ldx	[%i0+0x078],%l6		! %l6 = 2756f1797ffff30e
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x086,%g2
p0_b134:
!	Registers modified during the branch to p0_near_3
!	%l0  = 00000000000d8100
!	%l1  = 00000000f6e0c689
!	%l3  = fffffffffffffa15
!	%l6  = 0000000000000079
	membar	#Sync			! Added by membar checker (112)
!	Mem[0000000012800000] = 93d8beea, %l4 = 0000000000000000
	lduha	[%i5+0x000]%asi,%l4	! %l4 = 00000000000093d8
	fbn,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031000040] = ffc44646, %l7 = ffffffffffffff28
	ldsh	[%o2+0x040],%l7		! Annulled
p0_b135:

p0_label_116:
	membar	#Sync			! Added by membar checker (113)
!	%f30 = 3ff00000, %f0  = 00000000, %f16 = 00000000
	fadds	%f30,%f0 ,%f16		! %f16 = 3ff00000
!	Mem[0000000010000080] = 97d2d580 db845697 c59ce959 00027f82
	prefetcha [%i0+0x080]%asi,16
!	%l2 = 00000000000d852b, Mem[0000000032000051] = f8f53a4a
	stba	%l2,[%o4+0x051]%asi	! Mem[0000000032000050] = 2bf53a4a
!	Mem[0000000011000080] = 37db3a5b f89dff71 23646f8e b0060cec
	prefetcha [%i2+0x080]%asi,16
!	Mem[0000000010000000] = 8cc12faa fffff391 0000dd55 7194ab49
	prefetcha [%i0+0x000]%asi,4

p0_label_117:
!	%l1 = 00000000f6e0c689, %l3 = fffffffffffffa15, %l3 = fffffffffffffa15
	srl	%l1,%l3,%l3		! %l3 = 00000000000007b7
!	Mem[0000000010000000] = 8cc12faafffff391, %l0 = 00000000000d8100
	ldxa	[%i0+0x000]%asi,%l0	! %l0 = 8cc12faafffff391
!	%l2 = 00000000000d852b, immed = fffffebb, %l1 = 00000000f6e0c689
	andcc	%l2,-0x145,%l1		! %l1 = 00000000000d842b, %ccr = 00
!	%l4 = 00000000000093d8, immed = 0000001a, %l0 = 8cc12faafffff391
	sllx	%l4,0x01a,%l0		! %l0 = 0000024f60000000
!	%l2 = 00000000000d852b, Mem[000000003100004c] = c62a5ebb
	stw	%l2,[%o2+0x04c]		! Mem[000000003100004c] = 000d852b

p0_label_118:
!	%l1 = 00000000000d842b
	sethi	%hi(0x74e5a800),%l1	! %l1 = 0000000074e5a800
!	%l5 = 000000c10002d215, immed = 00000036, %l4 = 00000000000093d8
	srlx	%l5,0x036,%l4		! %l4 = 0000000000000000
!	%l0 = 0000024f60000000
	sethi	%hi(0x9d94d400),%l0	! %l0 = 000000009d94d400
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031000044] = a89260b3, %l0 = 000000009d94d400
	lduw	[%o2+0x044],%l0		! %l0 = 00000000a89260b3
p0_b136:

p0_label_119:
	membar	#Sync			! Added by membar checker (114)
!	%f27 = 00000000, %f16 = 3ff00000 6b354895
	fstod	%f27,%f16		! %f16 = 00000000 00000000
!	%l0 = 00000000a89260b3, %l0 = 00000000a89260b3, %y  = 00000000
	udivcc	%l0,%l0,%l7		! %l7 = 0000000000000001, %ccr = 00
!	%l3 = 00000000000007b7, immed = 00000f8e, %y  = 00000000
	sdiv	%l3,0xf8e,%l0		! %l0 = 0000000000000000
!	Mem[0000000031800000] = f47636931c40ab3e, %l5 = 000000c10002d215
	ldxa	[%o3+0x000]%asi,%l5	! %l5 = f47636931c40ab3e
!	%l1 = 0000000074e5a800
	sethi	%hi(0xbeabf400),%l1	! %l1 = 00000000beabf400

p0_label_120:
!	Mem[0000000010800000] = 911007de 6f902ede, %l6 = 00000079, %l7 = 00000001
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000911007de 000000006f902ede
!	%f30 = 3ff00000 00000000, %f26 = 3ff00000 00000000
	fcmped	%fcc2,%f30,%f26		! %fcc2 = 0
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000011000008] = ca89f978, %l1 = 00000000beabf400
	ldstuba	[%i2+%o6]0x80,%l1	! %l1 = 00000000000000ca
!	Registers modified during the branch to p0_jmpl_2
!	%l4  = ffffffffe7921d81
!	%l5  = 00000000000d852b
	set	p0_b137,%o7
	fbuge,pt %fcc1,p0_near_2_le	! Branch Taken, %fcc1 = 2

p0_label_121:
!	Mem[0000000010800008] = 000000c1, %l5 = 00000000000d852b
	lduwa	[%i1+%o6]0x80,%l5	! %l5 = 00000000000000c1
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x089,%g2
p0_b137:
!	Registers modified during the branch to p0_near_2
!	%l1  = 0000000000000000
!	%l4  = 0000000000000000
!	%l5  = 000000009110089f
	membar	#Sync			! Added by membar checker (115)
!	%l4 = 0000000000000000, immed = fffff181, %y  = 00000000
	umul	%l4,-0xe7f,%l6		! %l6 = 0000000000000000
!	%f18 = 00000000, %f16 = 00000000
	fcmps	%fcc0,%f18,%f16		! %fcc0 = 0
!	%l5 = 000000009110089f, Mem[0000000010000008] = 0000dd55
	stha	%l5,[%i0+%o6]0x80	! Mem[0000000010000008] = 089fdd55
	set	p0_b138,%o7
	fbg,a,pt %fcc1,p0_near_3_he	! Branch Taken, %fcc1 = 2

p0_label_122:
!	Mem[0000000011800008] = a04914ddf6e0c689, %l0 = 0000000000000000
	ldxa	[%i3+%o6]0x80,%l0	! %l0 = a04914ddf6e0c689
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x08a,%g2
p0_b138:
!	Registers modified during the branch to p0_near_3
!	%l0  = 00000000000d8100
!	%l1  = 00000000f6e0c689
!	%l3  = fffffffffffff89f
!	%l6  = 0000000000000079
	bpos,a	p0_b139			! Branch Taken, %ccr = 00, CWP = 0
!	%l5 = 000000009110089f, Mem[0000000011000008] = ff89f978
	stha	%l5,[%i2+%o6]0x80	! Mem[0000000011000008] = 089ff978
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x08b,%g2
p0_b139:
	membar	#Sync			! Added by membar checker (116)
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],21
!	%l4 = 0000000000000000, %l3 = fffffffffffff89f, %l4 = 0000000000000000
	orncc	%l4,%l3,%l4		! %l4 = 0000000000000760, %ccr = 00

p0_label_123:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000110000a0] = e122e749 23f7ac82 6d02fa02 ef50322d
	prefetch [%i2+0x0a0],0
p0_b140:
	membar	#Sync			! Added by membar checker (117)
!	%l3 = fffffffffffff89f, %l5 = 000000009110089f, %y  = 00000000
	smul	%l3,%l5,%l5		! %l5 = 0000033298b062c1
	fbn,pt	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000010000008] = 089fdd55, %l7 = 000000006f902ede
	lduha	[%i0+%o6]0x80,%l7	! %l7 = 000000000000089f
p0_b141:

p0_label_124:
	membar	#Sync			! Added by membar checker (118)
	fbg,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 00000760, %l5 = 98b062c1, Mem[0000000011800078] = 9f5291e3 57eed3e0
	std	%l4,[%i3+0x078]	! Mem[0000000011800078] = 00000760 98b062c1
p0_b142:
	membar	#Sync			! Added by membar checker (119)
	fblg,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = 000000000000089f, Mem[0000000010800008] = 000000c1
	stwa	%l7,[%i1+%o6]0x80	! Mem[0000000010800008] = 0000089f
p0_b143:
	membar	#Sync			! Added by membar checker (120)
!	%f26 = 3ff00000, %f28 = b6d6f528
	fcmps	%fcc1,%f26,%f28		! %fcc1 = 2

p0_label_125:
!	%l6 = 0000000000000079, immed = 0000013e, %l0 = 00000000000d8100
	tsubcc	%l6,0x13e,%l0		! %l0 = ffffffffffffff3b, %ccr = 9b
!	Branch On Register, %l6 = 0000000000000079
	brz,pn	%l6,p0_not_taken_0	! Branch Not Taken
!	%l6 = 0000000000000079, Mem[00000000118000c5] = 24bf5f48
	stb	%l6,[%i3+0x0c5]		! Mem[00000000118000c4] = 24795f48
p0_b144:
	membar	#Sync			! Added by membar checker (121)
!	%f22 = 00000000 00000000, %f2  = 29061ce8 77225ed2, %f16 = 00000000 00000000
	fdivd	%f22,%f2 ,%f16		! %f16 = 00000000 00000000
!	%f4  = 41dacd52 00000000, %f20 = 00000000 77225ed2
	fdtox	%f4 ,%f20		! %f20 = 00000000 6b354800

p0_label_126:
!	Mem[00000000118000e0] = fdb8c54a b2b67686 0295b4c8 0030e291
	prefetch [%i3+0x0e0],20
!	Branch On Register, %l1 = 00000000f6e0c689
	brgez,pn %l1,p0_b145		! Branch Taken
!	Mem[0000000010000000] = 8cc12faa, %l7 = 000000000000089f
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 000000000000008c
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x091,%g2
p0_b145:
	membar	#Sync			! Added by membar checker (122)
!	%l3 = fffffffffffff89f, %l1 = 00000000f6e0c689, %y  = 00000332
	udivx	%l3,%l1,%l1		! %l1 = 0000000109758266
!	%f9  = 03800000, %f4  = 41dacd52
	fnegs	%f9 ,%f4 		! %f4  = 83800000

p0_label_127:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000118000a0] = ccec9797 2b89162f 04ff04f6 f5acf0f2
	prefetch [%i3+0x0a0],23
p0_b146:
	membar	#Sync			! Added by membar checker (123)
!	Branch On Register, %l7 = 000000000000008c
	brnz,a,pn %l7,p0_b147		! Branch Taken
!	Mem[0000000011800000] = 0000000076223665, %l3 = fffffffffffff89f
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 0000000076223665
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x093,%g2
p0_b147:
	membar	#Sync			! Added by membar checker (124)
!	Mem[0000000010800008] = 0000089f, %l6 = 0000000000000079
	lduwa	[%i1+%o6]0x80,%l6	! %l6 = 000000000000089f

p0_label_128:
!	Mem[00000000108000e0] = 5f17043e9c079afd, %l5 = 0000033298b062c1
	ldxa	[%i1+0x0e0]%asi,%l5	! %l5 = 5f17043e9c079afd
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = ffffffffffffff3b, Mem[0000000010800000] = 911007de
	stwa	%l0,[%i1+%g0]0x80	! Annulled
p0_b148:
	membar	#Sync			! Added by membar checker (125)
!	%f14 = 41dacd52 00000000, %f10 = 80000000
	fdtoi	%f14,%f10		! %f10 = 6b354800
	set	p0_b149,%o7
	fbo,a,pt %fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 0

p0_label_129:
!	%l4 = 0000000000000760, Mem[0000000030800048] = 9455101fd70920e5
	stx	%l4,[%o1+0x048]		! Mem[0000000030800048] = 0000000000000760
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x095,%g2
p0_b149:
!	Registers modified during the branch to p0_near_2
!	%l2  = fffffffffffff23e
!	%l5  = a0e8fbc163f86503
!	%l6  = 0000000000000001
	membar	#Sync			! Added by membar checker (126)
!	%l7 = 000000000000008c, %l4 = 0000000000000760, %l5 = a0e8fbc163f86503
	andcc	%l7,%l4,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l7 = 000000000000008c, immed = 00000108, %l6 = 0000000000000001
	subc	%l7,0x108,%l6		! %l6 = ffffffffffffff84
	set	p0_b150,%o7
	fbul,pn	%fcc3,p0_near_2_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000031000040] = ffc44646, %l7 = 000000000000008c
	lduh	[%o2+0x042],%l7		! %l7 = 0000000000004646
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x096,%g2
p0_b150:
!	Registers modified during the branch to p0_near_2
!	%l1  = 0000000000000000
!	%l4  = ffffffffffffff00
!	%l5  = ffffffffffffff84

p0_label_130:
	membar	#Sync			! Added by membar checker (127)
!	%l3 = 0000000076223665, %l0 = ffffffffffffff3b, %l0 = ffffffffffffff3b
	orn	%l3,%l0,%l0		! %l0 = 00000000762236e5
!	%f16 = 00000000 00000000, %f12 = 00000000 00000000, %f2  = 29061ce8 77225ed2
	fsubd	%f16,%f12,%f2 		! %f2  = 00000000 00000000
!	%l6 = ffffffffffffff84, Mem[0000000030800040] = 00000000746495ee
	stxa	%l6,[%o1+0x040]%asi	! Mem[0000000030800040] = ffffffffffffff84
	set	p0_b151,%o7
	fble,pn	%fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000040] = ffc44646, %l1 = 0000000000000000
	ldsh	[%o2+0x040],%l1		! %l1 = ffffffffffffffc4
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x097,%g2
p0_b151:
!	Registers modified during the branch to p0_near_3
!	%l0  = fffffffffffff200
!	%l1  = 00000000f6e0c689
!	%l3  = ffffffffffffff95
!	%l6  = 0000000000000079

p0_label_131:
	membar	#Sync			! Added by membar checker (128)
!	%l1 = 00000000f6e0c689, immed = 0000034f, %y  = 00000332
	udivcc	%l1,0x34f,%l5		! %l5 = 00000000f786c37b, %ccr = 08
!	%f30 = 3ff00000 00000000, %f28 = b6d6f528 3f800000
	fcmped	%fcc3,%f30,%f28		! %fcc3 = 2
!	Mem[0000000032000010] = 8758d8b7 59bac2f6, %l0 = fffff200, %l1 = f6e0c689
	ldda	[%o4+0x010]%asi,%g2	! %l0 = fffffffffffff200 00000000f6e0c689
!	%l3 = ffffffffffffff95, %l5 = 00000000f786c37b, %l1 = 00000000f6e0c689
	addcc	%l3,%l5,%l1		! %l1 = 00000000f786c310, %ccr = 19
	bcs,a	p0_b152			! Branch Taken, %ccr = 19, CWP = 0

p0_label_132:
!	Mem[0000000011000000] = a2ff806c, %l0 = fffffffffffff200
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffa2ff
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x098,%g2
p0_b152:
	membar	#Sync			! Added by membar checker (129)
!	%l5 = 00000000f786c37b, %l5 = 00000000f786c37b, %l4 = ffffffffffffff00
	taddcc	%l5,%l5,%l4		! %l4 = 00000001ef0d86f6, %ccr = 0b
!	Mem[000000003000000c] = 5246bfae, %l6 = 0000000000000079
	ldsha	[%o0+0x00e]%asi,%l6	! %l6 = ffffffffffffbfae
	fbul,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000084] = f89dff71, %l5 = 00000000f786c37b
	swap	[%i2+0x084],%l5		! Annulled
p0_b153:

p0_label_133:
	membar	#Sync			! Added by membar checker (130)
!	Mem[0000000010800000] = 911007de, %l3 = ffffffffffffff95
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 0000000000009110
!	Denormal Floating Point Operation Nullified
	nop
!	%l5 = 00000000f786c37b, %l0 = ffffffffffffa2ff, %l6 = ffffffffffffbfae
	orcc	%l5,%l0,%l6		! %l6 = ffffffffffffe3ff, %ccr = 88
!	%f29 = 3f800000, %f22 = 00000000 00000000
	fitod	%f29,%f22		! %f22 = 41cfc000 00000000
	set	p0_b154,%o7
	fba,a	p0_far_0_he	! Branch Taken, %fcc0 = 0

p0_label_134:
!	Mem[0000000011000008] = 089ff9782fce25b3, %l7 = 0000000000004646
	ldxa	[%i2+%o6]0x80,%l7	! Annulled
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x09a,%g2
p0_b154:
!	Registers modified during the branch to p0_far_0
!	%l1  = 00000002e69456be
!	%l2  = 00000002e6944a06
!	%l4  = 000001049f160120
!	%l7  = 00000000000055fa
	membar	#Sync			! Added by membar checker (131)
!	Mem[0000000031800004] = 1c40ab3e, %l6 = ffffffffffffe3ff
	ldub	[%o3+0x004],%l6		! %l6 = 000000000000001c
!	%f0  = 00000000 00000000, %f6  = 00000000 00000000, %f28 = b6d6f528 3f800000
	fsubd	%f0 ,%f6 ,%f28		! %f28 = 00000000 00000000
!	%l0 = ffffffffffffa2ff
	sethi	%hi(0x90feb000),%l0	! %l0 = 0000000090feb000
!	%f0  = 00000000, %f27 = 00000000
	fcmps	%fcc1,%f0 ,%f27		! %fcc1 = 0

p0_label_135:
!	Mem[0000000010800008] = 0000089f, %l1 = 00000002e69456be
	ldstuba	[%i1+%o6]0x80,%l1	! %l1 = 0000000000000000
!	%f16 = 00000000 00000000, %f22 = 41cfc000 00000000, %f26 = 3ff00000 00000000
	fmuld	%f16,%f22,%f26		! %f26 = 00000000 00000000
!	%l5 = 00000000f786c37b, %l7 = 00000000000055fa, %l3 = 0000000000009110
	subc	%l5,%l7,%l3		! %l3 = 00000000f7866d81
!	%l4 = 000001049f160120, Mem[0000000011000000] = a2ff806c
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000011000000] = 9f160120
!	Mem[0000000010000008] = 089fdd55, %l0 = 0000000090feb000
	ldsha	[%i0+%o6]0x80,%l0	! %l0 = 000000000000089f

p0_label_136:
!	%l4 = 000001049f160120, %l5 = 00000000f786c37b, %l0 = 000000000000089f
	orn	%l4,%l5,%l0		! %l0 = ffffffff9f7f3da4
!	%l6 = 000000000000001c, immed = 00000d03, %l3 = 00000000f7866d81
	orcc	%l6,0xd03,%l3		! %l3 = 0000000000000d1f, %ccr = 00
!	%l3 = 0000000000000d1f, immed = 0000003f, %l7 = 00000000000055fa
	srax	%l3,0x03f,%l7		! %l7 = 0000000000000000
!	%l3 = 0000000000000d1f, immed = fffff3a7, %y  = 00000104
	smul	%l3,-0xc59,%l2		! %l2 = ffffffffff5dfc39
!	Mem[0000000011800008] = a04914dd, %l5 = 00000000f786c37b
	lduha	[%i3+%o6]0x80,%l5	! %l5 = 000000000000a049

p0_label_137:
!	Mem[0000000010000008] = 089fdd55, %l2 = ffffffffff5dfc39
	ldstuba	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000008
!	Mem[0000000010000080] = 97d2d580 db845697 c59ce959 00027f82
	prefetch [%i0+0x080],21
!	Mem[00000000108000f4] = c1c0d1c4, %l2 = 0000000000000008
	lduha	[%i1+0x0f4]%asi,%l2	! %l2 = 000000000000c1c0
!	%l2 = 000000000000c1c0, immed = 0000000b, %l1 = 0000000000000000
	addcc	%l2,0x00b,%l1		! %l1 = 000000000000c1cb, %ccr = 00
!	Mem[0000000011800000] = 00000000, %l3 = 0000000000000d1f
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000

p0_label_138:
!	%f7  = 00000000, %f31 = 00000000
	fcmpes	%fcc2,%f7 ,%f31		! %fcc2 = 0
!	%f4  = 83800000 00000000, %f26 = 00000000 00000000, %f26 = 00000000 00000000
	fmuld	%f4 ,%f26,%f26		! %f26 = 80000000 00000000
!	Mem[0000000010000020] = 34285385 da0176ec c0fc5436 228f43cf
	prefetch [%i0+0x020],16
!	Mem[0000000030000040] = 82934dfd, %l6 = 0000001c, %l7 = 00000000
	add	%o0,0x40,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000082934dfd
!	%l6 = 000000000000001c, Mem[0000000010800064] = a2638cbe
	sth	%l6,[%i1+0x064]		! Mem[0000000010800064] = 001c8cbe

p0_label_139:
!	Branch On Register, %l1 = 000000000000c1cb
	brlz,pn	%l1,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010800000] = 911007de, %l1 = 000000000000c1cb
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000091
p0_b155:
	membar	#Sync			! Added by membar checker (132)
!	Mem[0000000011800060] = 43ac58da eccf9dd8 1e9a1edf 7d8fbb5c
	prefetch [%i3+0x060],0
	set	p0_b156,%o7
	fbue	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	%l5 = 000000000000a049, Mem[0000000011000008] = 089ff978
	stwa	%l5,[%i2+%o6]0x80	! Mem[0000000011000008] = 0000a049
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x09c,%g2
p0_b156:
!	Registers modified during the branch to p0_far_1
!	%l0  = 000000000000a049
!	%l2  = 0000000000004200
!	%l6  = fffffffffffff32b

p0_label_140:
	set	p0_b157,%o7
	fbe	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800000] = ff1007de, %l5 = 000000000000a049
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x09d,%g2
p0_b157:
!	Registers modified during the branch to p0_far_0
!	%l4  = 000000000000ac9d
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (133)
!	Branch On Register, %l5 = 0000000000000000
	brgez,a,pn %l5,p0_b158		! Branch Taken
!	Mem[0000000010800040] = 9283bfd5 c256a6e8 1b689d26 08ff9b45
	prefetch [%i1+0x040],23
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x09e,%g2
p0_b158:
	set	p0_b159,%o7
	fbo	p0_far_3_he	! Branch Taken, %fcc0 = 0

p0_label_141:
!	Mem[00000000110000d4] = 32759fe9, %l3 = 0000000000000000
	ldub	[%i2+0x0d6],%l3		! %l3 = 000000000000009f
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x09f,%g2
p0_b159:
!	Registers modified during the branch to p0_far_3
!	%l1  = fffffffffffffdff
!	%l2  = 0000000074635849
!	%l7  = 00000000000064bb
	membar	#Sync			! Added by membar checker (134)
!	%f14 = 41dacd52, %f14 = 41dacd52
	fmovs	%f14,%f14		! %f14 = 41dacd52
!	Mem[0000000011000008] = 0000a049, %l0 = 000000000000a049
	lduha	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000
!	%f5  = 00000000, %f3  = 00000000
	fabss	%f5 ,%f3 		! %f3  = 00000000
!	%l7 = 00000000000064bb, immed = fffffec0, %l0 = 0000000000000000
	addcc	%l7,-0x140,%l0		! %l0 = 000000000000637b, %ccr = 11

p0_label_142:
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000011800040] = 95c287f9 281873da 07498a0b cec1054d
	prefetch [%i3+0x040],1	! Annulled
p0_b160:
	membar	#Sync			! Added by membar checker (135)
!	%l0 = 000000000000637b, immed = fffff0fe, %l4 = 000000000000ac9d
	taddcc	%l0,-0xf02,%l4		! %l4 = 0000000000005479, %ccr = 13
!	%f0  = 00000000 00000000, %f0  = 00000000 00000000
	fcmpd	%fcc2,%f0 ,%f0 		! %fcc2 = 0
!	Denormal Floating Point Operation Nullified
	nop

p0_label_143:
	bvc	p0_not_taken_0		! Branch Not Taken, %ccr = 13
!	Mem[0000000010000000] = 8cc12faa, %l6 = fffffffffffff32b
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 000000000000008c
p0_b161:
	ble,a	p0_b162			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[0000000012800008] = eb8e3664, %l0 = 000000000000637b
	lduha	[%i5+%o6]0x80,%l0	! %l0 = 000000000000eb8e
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0a2,%g2
p0_b162:
	membar	#Sync			! Added by membar checker (136)
!	%l3 = 000000000000009f, %l5 = 0000000000000000, %l6 = 000000000000008c
	xorcc	%l3,%l5,%l6		! %l6 = 000000000000009f, %ccr = 00

p0_label_144:
!	%f18 = 00000000 00000001, %f18 = 00000000 00000001
	fmovd	%f18,%f18		! %f18 = 00000000 00000001
!	%l5 = 0000000000000000, Mem[0000000030000040] = 82934dfd
	stw	%l5,[%o0+0x040]		! Mem[0000000030000040] = 00000000
!	%l6 = 000000000000009f, Mem[0000000011000000] = 9f160120
	stha	%l6,[%i2+%g0]0x80	! Mem[0000000011000000] = 009f0120
!	%l4 = 0000000000005479, %l5 = 0000000000000000, %y  = 00000000
	umul	%l4,%l5,%l0		! %l0 = 0000000000000000
!	%l5 = 0000000000000000, immed = fffff0ff, %y  = 00000000
	umul	%l5,-0xf01,%l6		! %l6 = 0000000000000000

p0_label_145:
!	%l1 = fffffffffffffdff, %l6 = 0000000000000000, %l7 = 00000000000064bb
	sllx	%l1,%l6,%l7		! %l7 = fffffffffffffdff
!	Branch On Register, %l7 = fffffffffffffdff
	brlez,a,pt %l7,p0_b163		! Branch Taken
!	Mem[0000000011800008] = a04914dd, %l1 = fffffffffffffdff
	ldswa	[%i3+%o6]0x80,%l1	! %l1 = ffffffffa04914dd
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0a3,%g2
p0_b163:
	membar	#Sync			! Added by membar checker (137)
!	%f30 = 3ff00000, %f23 = 00000000, %f28 = 00000000
	fmuls	%f30,%f23,%f28		! %f28 = 00000000
!	%l5 = 0000000000000000, Mem[00000000100000f6] = c58df0d5
	stha	%l5,[%i0+0x0f6]%asi	! Mem[00000000100000f4] = c58d0000

p0_label_146:
	set	p0_b164,%o7
	fbule,a,pn %fcc2,p0_near_1_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000010800000] = ff1007de, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0a4,%g2
p0_b164:
!	Registers modified during the branch to p0_near_1
!	%l1  = fffffffffffffb1d
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (138)
!	%l5 = 00000000000000ff, %l3 = 000000000000009f, %l2 = 0000000074635849
	sll	%l5,%l3,%l2		! %l2 = 0000007f80000000
!	%l3 = 000000000000009f, immed = 00000fec, %y  = 00000000
	umulcc	%l3,0xfec,%l2		! %l2 = 000000000009e394, %ccr = 00
	fbl,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0

p0_label_147:
!	Mem[0000000010000000] = ffc12faa, %l4 = 0000000000005479
	swapa	[%i0+%g0]0x80,%l4	! Annulled
p0_b165:
	membar	#Sync			! Added by membar checker (139)
!	Mem[00000000110000e0] = 3e7edcd7 1536dcff 1d887dc5 92971fbf
	prefetcha [%i2+0x0e0]%asi,1
!	%f21 = 6b354800, %f25 = c7eddf2c
	fabss	%f21,%f25		! %f25 = 6b354800
!	%f22 = 41cfc000 00000000, %f7  = 00000000
	fdtoi	%f22,%f7 		! %f7  = 3f800000
!	Mem[0000000011000000] = 009f0120 ffffffff 0000a049 2fce25b3
	prefetch [%i2+0x000],23

p0_label_148:
!	Mem[0000000010000088] = c59ce959, %l5 = 00000000000000ff
	lduha	[%i0+0x088]%asi,%l5	! %l5 = 000000000000c59c
!	%l1 = fffffffffffffb1d, %l1 = fffffffffffffb1d, %y  = 00000000
	udiv	%l1,%l1,%l7		! %l7 = 0000000000000001
!	%l7 = 0000000000000001, %l1 = fffffffffffffb1d, %l6 = 0000000000000000
	orcc	%l7,%l1,%l6		! %l6 = fffffffffffffb1d, %ccr = 88
	fbn,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000010800000] = ff1007de, %l2 = 000000000009e394
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
p0_b166:

p0_label_149:
	membar	#Sync			! Added by membar checker (140)
!	Mem[00000000118000c0] = c481d55b 24795f48 2d0d4c89 b3d0891c
	prefetcha [%i3+0x0c0]%asi,23
!	%l4 = 00005479, %l5 = 0000c59c, Mem[0000000030800000] = 649746d5 f6e0c689
	std	%l4,[%o1+0x000]	! Mem[0000000030800000] = 00005479 0000c59c
!	%f25 = 6b354800, %f22 = 41cfc000 00000000
	fitod	%f25,%f22		! %f22 = 41dacd52 00000000
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = 0000000000000001, Mem[00000000100000f8] = 2b9da88d7e66137a
	stx	%l7,[%i0+0x0f8]		! Mem[00000000100000f8] = 0000000000000001
p0_b167:

p0_label_150:
	membar	#Sync			! Added by membar checker (141)
!	%f25 = 6b354800, %f26 = 80000000, %f29 = 00000000
	fadds	%f25,%f26,%f29		! %f29 = 6b354800
!	Mem[00000000108000cc] = 3e054f9e, %l7 = 0000000000000001
	lduha	[%i1+0x0ce]%asi,%l7	! %l7 = 0000000000004f9e
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011800058] = ffffa2ffaffd02aa, %l3 = 000000000000009f
	ldx	[%i3+0x058],%l3		! %l3 = ffffa2ffaffd02aa
p0_b168:
	bneg	p0_b169			! Branch Taken, %ccr = 88, CWP = 0

p0_label_151:
!	Mem[0000000030000000] = 74e79c14, %l4 = 0000000000005479
	ldub	[%o0+0x002],%l4		! %l4 = 000000000000009c
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x0a9,%g2
p0_b169:
	ble,a	p0_b170			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000011000000] = 009f0120, %l4 = 000000000000009c
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000009f
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x0aa,%g2
p0_b170:
	membar	#Sync			! Added by membar checker (142)
!	%f15 = 00000000, %f22 = 41dacd52
	fitos	%f15,%f22		! %f22 = 00000000
	nop

p0_label_152:
!	%l4 = 000000000000009f, immed = 0000003d, %l6 = fffffffffffffb1d
	srax	%l4,0x03d,%l6		! %l6 = 0000000000000000
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000000] = 009f0120, %l7 = 0000000000004f9e
	ldstuba	[%i2+%g0]0x80,%l7	! Annulled
p0_b171:
	membar	#Sync			! Added by membar checker (143)
!	%l0 = 0000000000000000, Mem[000000003080000a] = 2fce25b3
	stb	%l0,[%o1+0x00a]		! Mem[0000000030800008] = 2fce00b3
!	%l5 = 000000000000c59c, Mem[0000000011800008] = a04914dd
	stha	%l5,[%i3+%o6]0x80	! Mem[0000000011800008] = c59c14dd

p0_label_153:
!	%f21 = 6b354800, %f0  = 00000000, %f0  = 00000000 00000000
	fsmuld	%f21,%f0 ,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000030000008] = cd170073, %l6 = 0000000000000000
	lduwa	[%o0+0x008]%asi,%l6	! %l6 = 00000000cd170073
	fblg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 00000000000000ff, Mem[0000000011800008] = c59c14dd
	stba	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = ff9c14dd
p0_b172:
	membar	#Sync			! Added by membar checker (144)
!	Mem[0000000012000008] = 2304a442, %l6 = 00000000cd170073
	ldsha	[%i4+%o6]0x80,%l6	! %l6 = 0000000000002304

p0_label_154:
!	%l4 = 0000009f, %l5 = 0000c59c, Mem[00000000110000d8] = 3f0ecdc9 df38e53e
	stda	%l4,[%i2+0x0d8]%asi	! Mem[00000000110000d8] = 0000009f 0000c59c
!	%l7 = 0000000000004f9e, %l5 = 000000000000c59c, %l5 = 000000000000c59c
	taddcc	%l7,%l5,%l5		! %l5 = 000000000001153a, %ccr = 02
	bleu	p0_not_taken_0		! Branch Not Taken, %ccr = 02
!	%l1 = fffffffffffffb1d, Mem[0000000011800000] = 00000000
	stwa	%l1,[%i3+%g0]0x80	! Mem[0000000011800000] = fffffb1d
p0_b173:
	membar	#Sync			! Added by membar checker (145)
!	Mem[000000003080004c] = 00000760, %l2 = 00000000000000ff
	ldsw	[%o1+0x04c],%l2		! %l2 = 0000000000000760

p0_label_155:
!	%l7 = 0000000000004f9e, %l6 = 0000000000002304, %l6 = 0000000000002304
	xorcc	%l7,%l6,%l6		! %l6 = 0000000000006c9a, %ccr = 00
!	%l3 = ffffa2ffaffd02aa, %l6 = 0000000000006c9a, %l4 = 000000000000009f
	orn	%l3,%l6,%l4		! %l4 = ffffffffffff93ef
!	Denormal Floating Point Operation Nullified
	nop
	set	p0_b174,%o7
	fble	p0_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000078] = 087d4a36, %l3 = ffffa2ffaffd02aa
	ldsw	[%o4+0x078],%g2		! %g2 = ffffa2ffaffd02aa
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x0ae,%g2
p0_b174:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l2  = fffffffffac687f0
!	%l4  = 0000000000000002
!	%l5  = 00000000d7397d89
!	%l7  = 0000000000000720

p0_label_156:
	membar	#Sync			! Added by membar checker (146)
!	Mem[0000000030000044] = 00005293, %l1 = fffffffffffffb1d
	ldsb	[%o0+0x047],%l1		! %l1 = ffffffffffffff93
	set	p0_b175,%o7
	fbule	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800048] = ffc43955, %l4 = 0000000000000002
	ldsb	[%o3+0x048],%l4		! %l4 = ffffffffffffffff
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x0af,%g2
p0_b175:
!	Registers modified during the branch to p0_far_1
!	%l4  = 0000000000000060
!	%l6  = 000000000000543e
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 000000000000543e, Mem[0000000011800008] = ff9c14ddf6e0c689
	stx	%l6,[%i3+0x008]		! Annulled
p0_b176:

p0_label_157:
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011000040] = f4184310, %l5 = 00000000d7397d89
	swap	[%i2+0x040],%l5		! Annulled
p0_b177:
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000032000020] = b62c8d98 1c3dd831 537245c7 b3b6f9b1
	prefetch [%o4+0x020],4	! Annulled
p0_b178:
	membar	#Sync			! Added by membar checker (147)
!	%f2  = 00000000 00000000, %f0  = 00000000 00000000
	fnegd	%f2 ,%f0 		! %f0  = 80000000 00000000

p0_label_158:
!	%l5 = 00000000d7397d89, Mem[000000003000000e] = 5246bfae
	sth	%l5,[%o0+0x00e]		! Mem[000000003000000c] = 52467d89
!	%l7 = 0000000000000720, immed = 00000730, %y  = 00000000
	udiv	%l7,0x730,%l1		! %l1 = 0000000000000000
!	%l3 = ffffa2ffaffd02aa, %l2 = fffffffffac687f0, %y  = 00000000
	umul	%l3,%l2,%l6		! %l6 = ac658fbd7d162560
!	%l0 = 0000000000000000, %l1 = 0000000000000000, %l1 = 0000000000000000
	xnor	%l0,%l1,%l1		! %l1 = ffffffffffffffff
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_159:
!	Mem[00000000118000b0] = 8cc12faa, %l4 = 0000000000000060
	swap	[%i3+0x0b0],%l4		! Annulled
p0_b179:
	set	p0_b180,%o7
	fbue,a	p0_far_0_he	! Branch Taken, %fcc0 = 0
!	%l2 = fffffffffac687f0, Mem[0000000010800000] = ff1007de
	stha	%l2,[%i1+%g0]0x80	! Mem[0000000010800000] = 87f007de
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x0b4,%g2
p0_b180:
!	Registers modified during the branch to p0_far_0
!	%l1  = 0000000000000d17
!	%l2  = 000000000000005f
!	%l4  = 0000000000000000
!	%l7  = 00000000000016d4
	membar	#Sync			! Added by membar checker (148)
!	%l6 = ac658fbd7d162560, %l3 = ffffa2ffaffd02aa, %l0 = 0000000000000000
	andncc	%l6,%l3,%l0		! %l0 = 00000d0050022540, %ccr = 00
!	Mem[0000000010800060] = d0f60d68 001c8cbe 3c53b7c8 bcb7df59
	prefetch [%i1+0x060],4

p0_label_160:
!	Mem[0000000010000038] = a587394e, %l3 = ffffa2ffaffd02aa
	lduha	[%i0+0x038]%asi,%l3	! %l3 = 000000000000a587
!	%f15 = 00000000, %f20 = 00000000 6b354800
	fstox	%f15,%f20		! %f20 = 00000000 00000000
	set	p0_b181,%o7
	fbule,a,pt %fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000010800000] = 87f007de, %l3 = 000000000000a587
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000087
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0b5,%g2
p0_b181:
!	Registers modified during the branch to p0_near_2
!	%l2  = 00000d0050022845
!	%l5  = ffffffff28c68276
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (149)
!	%l1 = 0000000000000d17, %l3 = 0000000000000087, %l5 = ffffffff28c68276
	orcc	%l1,%l3,%l5		! %l5 = 0000000000000d97, %ccr = 00

p0_label_161:
!	%l7 = 00000000000016d4, Mem[0000000011000008] = 0000a0492fce25b3
	stxa	%l7,[%i2+%o6]0x80	! Mem[0000000011000008] = 00000000000016d4
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011000040] = f4184310 4e17dc6a a7b627b0 5c7f9b30
	prefetch [%i2+0x040],16	! Annulled
p0_b182:
	membar	#Sync			! Added by membar checker (150)
!	%f14 = 41dacd52 00000000, %f1  = 00000000
	fdtos	%f14,%f1 		! %f1  = 4ed66a90
!	Mem[0000000011000008] = 00000000, %l2 = 00000d0050022845
	ldsba	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000000

p0_label_162:
!	%l3 = 0000000000000087, Mem[00000000110000c2] = 6a5fce87
	sth	%l3,[%i2+0x0c2]		! Mem[00000000110000c0] = 6a5f0087
	fbul	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = 0000000000000087, Mem[0000000031000005] = aa5a4a85
	stb	%l3,[%o2+0x005]		! Mem[0000000031000004] = aa874a85
p0_b183:
	membar	#Sync			! Added by membar checker (151)
!	%f4  = 83800000 00000000, %f4  = 83800000 00000000
	fcmped	%fcc3,%f4 ,%f4 		! %fcc3 = 0
!	%l4 = 0000000000000000
	setx	0xab1d8f3cab1d8f3c,%g7,%l4 ! %l4 = ab1d8f3cab1d8f3c

p0_label_163:
!	Mem[0000000011000000] = 009f0120, %l1 = 0000000000000d17
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l0 = 00000d0050022540, %l7 = 00000000000016d4, %l4 = ab1d8f3cab1d8f3c
	xorcc	%l0,%l7,%l4		! %l4 = 00000d0050023394, %ccr = 00
!	Mem[0000000011800000] = fffffb1d 76223665 ff9c14dd f6e0c689
	prefetcha [%i3+0x000]%asi,21
!	%f20 = 00000000 00000000, %f0  = 80000000 4ed66a90
	fdtox	%f20,%f0 		! %f0  = 00000000 00000000
!	%l3 = 0000000000000087, Mem[0000000010000008] = ff9fdd55
	stwa	%l3,[%i0+%o6]0x80	! Mem[0000000010000008] = 00000087

p0_label_164:
!	%f20 = 00000000 00000000, %f12 = 00000000 00000000
	fxtod	%f20,%f12		! %f12 = 00000000 00000000
	set	p0_b184,%o7
	fbue	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000030000044] = 00005293, %l4 = 00000d0050023394
	ldsh	[%o0+0x044],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0b8,%g2
p0_b184:
!	Registers modified during the branch to p0_far_0
!	%l4  = fffff2ffaffddabf
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (152)
!	%l6 = 00000000, %l7 = 000016d4, Mem[0000000011000018] = 51992bf6 3259011a
	stda	%l6,[%i2+0x018]%asi	! Mem[0000000011000018] = 00000000 000016d4
	set	p0_b185,%o7
	fbo,a	p0_far_2_le	! Branch Taken, %fcc0 = 0

p0_label_165:
!	%l4 = fffff2ffaffddabf, Mem[0000000013000000] = e8e4870a
	stba	%l4,[%i6+%g0]0x80	! Mem[0000000013000000] = bfe4870a
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x0b9,%g2
p0_b185:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l1  = 00000000000016d4
!	%l3  = ffffffffffffffff
!	%l5  = fffffffffffff1b9
	membar	#Sync			! Added by membar checker (153)
	nop
!	%f14 = 41dacd52 00000000, %f27 = 00000000
	fdtos	%f14,%f27		! %f27 = 4ed66a90
	fbg,pn	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000010800053] = f276d9c5, %l5 = fffffffffffff1b9
	ldstub	[%i1+0x053],%l5		! %l5 = 00000000000000c5
p0_b186:

p0_label_166:
	membar	#Sync			! Added by membar checker (154)
!	%l3 = ffffffffffffffff, Mem[00000000118000f0] = e4ad6de9469c3a05
	stx	%l3,[%i3+0x0f0]		! Mem[00000000118000f0] = ffffffffffffffff
	bleu	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l5 = 00000000000000c5, Mem[0000000010000068] = 9b4f2c192be00efd
	stx	%l5,[%i0+0x068]		! Mem[0000000010000068] = 00000000000000c5
p0_b187:
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011800000] = fffffb1d, %l1 = 00000000000016d4
	ldstuba	[%i3+%g0]0x80,%l1	! Annulled
p0_b188:

p0_label_167:
	bgu	p0_b189			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010000000] = ffc12faa, %l3 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x0bd,%g2
p0_b189:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000000] = ffc12faa, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 000000000000ffc1
p0_b190:
	membar	#Sync			! Added by membar checker (155)
!	%f13 = 00000000, %f30 = 3ff00000
	fnegs	%f13,%f30		! %f30 = 80000000

p0_label_168:
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],22
	fbl	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000008] = 00000087, %l4 = fffff2ffaffddabf
	lduba	[%i0+%o6]0x80,%l4	! %l4 = 0000000000000000
p0_b191:
	membar	#Sync			! Added by membar checker (156)
!	Branch On Register, %l1 = 00000000000016d4
	brgez,pn %l1,p0_b192		! Branch Taken
!	Mem[0000000012800078] = 391b7592 691109ec, %l2 = 00000000, %l3 = 000000ff
	ldd	[%i5+0x078],%l2		! %l2 = 00000000391b7592 00000000691109ec
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x0c0,%g2
p0_b192:

p0_label_169:
	membar	#Sync			! Added by membar checker (157)
!	%l7 = 00000000000016d4, Mem[00000000110000b8] = 8f695675
	stwa	%l7,[%i2+0x0b8]%asi	! Mem[00000000110000b8] = 000016d4
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000010800080] = ffffffffcf8b51f5, %l1 = 00000000000016d4
	ldx	[%i1+0x080],%l1		! %l1 = ffffffffcf8b51f5
p0_b193:
	membar	#Sync			! Added by membar checker (158)
!	Mem[00000000118000e0] = fdb8c54a b2b67686 0295b4c8 0030e291
	prefetch [%i3+0x0e0],20
!	%l7 = 00000000000016d4, immed = fffff939, %l2 = 00000000391b7592
	orcc	%l7,-0x6c7,%l2		! %l2 = fffffffffffffffd, %ccr = 88

p0_label_170:
	set	p0_b194,%o7
	fbuge,a	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000108000e4] = 9c079afd, %l6 = 000000000000ffc1
	ldsw	[%i1+0x0e4],%l6		! %l6 = ffffffff9c079afd
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x0c2,%g2
p0_b194:
!	Registers modified during the branch to p0_far_0
!	%l4  = 0000000063f86502
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (159)
	set	p0_b195,%o7
	fbue,pt	%fcc2,p0_near_0_le	! Branch Taken, %fcc2 = 0
!	%l2 = fffffffd, %l3 = 691109ec, Mem[0000000010000008] = 00000087 7194ab49
	stda	%l2,[%i0+%o6]0x80	! Mem[0000000010000008] = fffffffd 691109ec
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x0c3,%g2
p0_b195:
!	Registers modified during the branch to p0_near_0
!	%l2  = 70ed4f488cc12faa
!	%l3  = ffffffff9c0793de
!	%l7  = 000000006b92ecf2
	membar	#Sync			! Added by membar checker (160)
!	%f18 = 00000000 00000001, %f20 = 00000000 00000000
	fabsd	%f18,%f20		! %f20 = 00000000 00000001

p0_label_171:
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011800000] = fffffb1d, %l3 = ffffffff9c0793de
	lduwa	[%i3+%g0]0x80,%l3	! Annulled
p0_b196:
	membar	#Sync			! Added by membar checker (161)
!	Mem[0000000010800000] = 87f007de, %l2 = 70ed4f488cc12faa
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = ffffffff87f007de
!	%l2 = ffffffff87f007de, immed = fffffdc8, %y  = 00000000
	udivcc	%l2,-0x238,%l3		! %l3 = 0000000000000000, %ccr = 44
!	%l3 = 0000000000000000, %l0 = 0000000000000000, %l2 = ffffffff87f007de
	sra	%l3,%l0,%l2		! %l2 = 0000000000000000

p0_label_172:
	ble,a	p0_b197			! Branch Taken, %ccr = 44, CWP = 0
!	%l4 = 63f86502, %l5 = 00000000, Mem[0000000010000000] = ffc12faa fffff391
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010000000] = 63f86502 00000000
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x0c5,%g2
p0_b197:
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000011000060] = ba2eca4e cde26abb
	std	%l2,[%i2+0x060]	! Annulled
p0_b198:
	membar	#Sync			! Added by membar checker (162)
!	%l1 = ffffffffcf8b51f5, %l6 = ffffffff9c079afd, %y  = 00000000
	udiv	%l1,%l6,%l7		! %l7 = 0000000000000001

p0_label_173:
!	%f30 = 80000000, %f5  = 00000000
	fabss	%f30,%f5 		! %f5  = 00000000
!	Mem[0000000010000040] = c0e255a9 41e37dac d230e7de e0f55db6
	prefetcha [%i0+0x040]%asi,0
!	Mem[0000000010800000] = 87f007de, %l6 = ffffffff9c079afd
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000087
!	Branch On Register, %l4 = 0000000063f86502
	brnz,pn	%l4,p0_b199		! Branch Taken
!	%l5 = 0000000000000000, Mem[0000000031800042] = 152fb4c9
	sth	%l5,[%o3+0x042]		! Mem[0000000031800040] = 152f0000
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p0_branch_failed
	mov	0x0c7,%g2
p0_b199:

p0_label_174:
	membar	#Sync			! Added by membar checker (163)
!	%l2 = 0000000000000000, %l4 = 0000000063f86502, %y  = 00000000
	udivcc	%l2,%l4,%l4		! %l4 = 0000000000000000, %ccr = 44
!	%l6 = 0000000000000087, immed = 0000029b, %y  = 00000000
	mulx	%l6,0x29b,%l1		! %l1 = 0000000000015fbd
	set	p0_b200,%o7
	fbuge,pn %fcc2,p0_near_0_le	! Branch Taken, %fcc2 = 0
!	Mem[00000000118000f0] = ffffffff, %l0 = 0000000000000000
	lduw	[%i3+0x0f0],%l0		! %l0 = 00000000ffffffff
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x0c8,%g2
p0_b200:
!	Registers modified during the branch to p0_near_0
!	%l2  = 70ed4f488cc12faa
!	%l3  = fffffffffffff6dc
!	%l7  = 0000000000016044
	membar	#Sync			! Added by membar checker (164)
!	%l3 = fffffffffffff6dc, %l7 = 0000000000016044, %y  = 00000000
	mulx	%l3,%l7,%l1		! %l1 = fffffffff36c1270

p0_label_175:
!	%f4  = 83800000 00000000, %f14 = 41dacd52 00000000
	fcmpd	%fcc1,%f4 ,%f14		! %fcc1 = 1
!	%f10 = 6b354800 77225ed2, %f12 = 00000000 00000000
	fnegd	%f10,%f12		! %f12 = eb354800 77225ed2
!	%l0 = 00000000ffffffff, %l7 = 0000000000016044, %l0 = 00000000ffffffff
	andn	%l0,%l7,%l0		! %l0 = 00000000fffe9fbb
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000000] = 63f86502, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l4	! Annulled
p0_b201:

p0_label_176:
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000010800018] = 1c2df9ce, %l7 = 0000000000016044
	ldsw	[%i1+0x018],%l7		! Annulled
p0_b202:
	set	p0_b203,%o7
	fbge,a	p0_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800008] = ff9c14dd f6e0c689, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o6]0x80,%l4	! %l4 = 00000000ff9c14dd 00000000f6e0c689
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x0cb,%g2
p0_b203:
!	Registers modified during the branch to p0_far_1
!	%l4  = 000000000c812d8a
!	%l6  = 000000000000543e
	membar	#Sync			! Added by membar checker (165)
!	%l1 = fffffffff36c1270, immed = 000006b4, %l5 = 00000000f6e0c689
	or	%l1,0x6b4,%l5		! %l5 = fffffffff36c16f4

p0_label_177:
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000060] = f1dc0e62, %l7 = 0000000000016044
	ldsh	[%i0+0x062],%l7		! Annulled
p0_b204:
	membar	#Sync			! Added by membar checker (166)
!	%l6 = 000000000000543e, %l3 = fffffffffffff6dc, %l4 = 000000000c812d8a
	xor	%l6,%l3,%l4		! %l4 = ffffffffffffa2e2
	fbul	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000008] = fffffffd, %l2 = 70ed4f488cc12faa
	ldstuba	[%i0+%o6]0x80,%l2	! %l2 = 00000000000000ff
p0_b205:

p0_label_178:
	membar	#Sync			! Added by membar checker (167)
!	Mem[000000001080003c] = fa6a5820, %l1 = fffffffff36c1270
	ldsb	[%i1+0x03f],%l1		! %l1 = 0000000000000020
!	%l4 = ffffffffffffa2e2, %l0 = 00000000fffe9fbb, %l0 = 00000000fffe9fbb
	addc	%l4,%l0,%l0		! %l0 = 00000000fffe429d
!	Mem[0000000010000000] = 63f8650200000000, %l2 = 00000000000000ff
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = 63f8650200000000
!	%f0  = 00000000, %f29 = 6b354800
	fcmps	%fcc0,%f0 ,%f29		! %fcc0 = 1
	nop

p0_label_179:
!	%f3  = 00000000, %f29 = 6b354800, %f29 = 6b354800
	fdivs	%f3 ,%f29,%f29		! %f29 = 00000000
!	%f2  = 00000000, %f12 = eb354800 77225ed2
	fitod	%f2 ,%f12		! %f12 = 00000000 00000000
	set	p0_b206,%o7
	fbule,a	p0_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000011800008] = ff9c14dd, %l0 = 00000000fffe429d
	ldsba	[%i3+%o6]0x80,%l0	! %l0 = ffffffffffffffff
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p0_branch_failed
	mov	0x0ce,%g2
p0_b206:
!	Registers modified during the branch to p0_far_3
!	%l1  = fffffffff36c16f4
!	%l6  = 4000000000000000
	membar	#Sync			! Added by membar checker (168)
!	Mem[0000000010000008] = fffffffd, %l3 = fffffffffffff6dc
	swap	[%i0+0x008],%l3		! %l3 = 00000000fffffffd

p0_label_180:
!	%l2 = 63f8650200000000, immed = 0000001b, %l2 = 63f8650200000000
	sll	%l2,0x01b,%l2		! %l2 = 1000000000000000
!	Mem[0000000012800000] = 93d8beea, %l0 = ffffffffffffffff
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = ffffffff93d8beea
	bne,a	p0_b207			! Branch Taken, %ccr = 88, CWP = 0
!	%l2 = 1000000000000000, Mem[0000000032000073] = 219d95c8
	stb	%l2,[%o4+0x073]		! Mem[0000000032000070] = 009d95c8
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x0cf,%g2
p0_b207:
	membar	#Sync			! Added by membar checker (169)
!	Mem[0000000031000044] = a89260b3, %l5 = fffffffff36c16f4
	ldsha	[%o2+0x044]%asi,%l5	! %l5 = ffffffffffffa892

p0_label_181:
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000110000a0] = e122e749 23f7ac82 6d02fa02 ef50322d
	prefetch [%i2+0x0a0],3
p0_b208:
	membar	#Sync			! Added by membar checker (170)
!	%l6 = 4000000000000000, Mem[0000000030800044] = ffffff84
	sth	%l6,[%o1+0x044]		! Mem[0000000030800044] = 0000ff84
!	%l5 = ffffffffffffa892, %l0 = ffffffff93d8beea, %y  = 00000000
	sdivcc	%l5,%l0,%l5		! %l5 = fffffffffffffffe, %ccr = 88
	set	p0_b209,%o7
	fbl,a	p0_far_2_he	! Branch Taken, %fcc0 = 1

p0_label_182:
!	%l0 = ffffffff93d8beea, Mem[0000000011800098] = aca6ec54d7397d89
	stx	%l0,[%i3+0x098]		! Mem[0000000011800098] = ffffffff93d8beea
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x0d1,%g2
p0_b209:
!	Registers modified during the branch to p0_far_2
!	%l0  = ffffffff93d8b468
!	%l2  = fffffffffb083e3a
!	%l4  = 0000000000000002
!	%l5  = 00000000d7397d89
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (171)
!	Mem[0000000011800020] = 01833ae1 a9db312b, %l6 = 00000000, %l7 = 00000000
	ldd	[%i3+0x020],%l6		! %l6 = 0000000001833ae1 00000000a9db312b
!	%l4 = 00000002, %l5 = d7397d89, Mem[0000000032000030] = 9197a540 db0e3cdc
	stda	%l4,[%o4+0x030]%asi	! Mem[0000000032000030] = 00000002 d7397d89
!	%f12 = 00000000 00000000, %f4  = 83800000 00000000, %f10 = 6b354800 77225ed2
	faddd	%f12,%f4 ,%f10		! %f10 = 83800000 00000000
!	Mem[0000000011800020] = 01833ae1 a9db312b fcb10966 37dcc4af
	prefetcha [%i3+0x020]%asi,4

p0_label_183:
!	Branch On Register, %l3 = 00000000fffffffd
	brgez,pn %l3,p0_b210		! Branch Taken
!	Mem[0000000032000078] = 087d4a36ceb28373, %l3 = 00000000fffffffd
	ldx	[%o4+0x078],%g2		! %g2 = 087d4a36ceb28373
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0d2,%g2
p0_b210:
	membar	#Sync			! Added by membar checker (172)
!	%l0 = ffffffff93d8b468, immed = 0000076f, %l5 = 00000000d7397d89
	andncc	%l0,0x76f,%l5		! %l5 = ffffffff93d8b000, %ccr = 88
	fbl,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[00000000110000a0] = e122e749 23f7ac82 6d02fa02 ef50322d
	prefetch [%i2+0x0a0],1	! Annulled
p0_b211:

p0_label_184:
	membar	#Sync			! Added by membar checker (173)
!	%f22 = 00000000 00000000, %f4  = 83800000
	fdtoi	%f22,%f4 		! %f4  = 00000000
	set	p0_b212,%o7
	fbule,pt %fcc2,p0_near_3_le	! Branch Taken, %fcc2 = 0
!	%l4 = 00000002, %l5 = 93d8b000, Mem[0000000010000008] = fffff6dc 691109ec
	stda	%l4,[%i0+%o6]0x80	! Mem[0000000010000008] = 00000002 93d8b000
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x0d4,%g2
p0_b212:
!	Registers modified during the branch to p0_near_3
!	%l0  = 0000000000005293
!	%l3  = 0000000000027f82
!	%l4  = fffffffffb0842b6
!	%l5  = 0000000004ff04f6
!	%l7  = 04ff04cca01eead0
	membar	#Sync			! Added by membar checker (174)
!	%f28 = 00000000, %f1  = 00000000, %f10 = 83800000 00000000
	fsmuld	%f28,%f1 ,%f10		! %f10 = 00000000 00000000
!	%l5 = 0000000004ff04f6, immed = 00000007, %l7 = 04ff04cca01eead0
	srl	%l5,0x007,%l7		! %l7 = 000000000009fe09

p0_label_185:
	set	p0_b213,%o7
	fbul,a	p0_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000010800000] = fff007de, %l1 = fffffffff36c16f4
	ldsba	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x0d5,%g2
p0_b213:
!	Registers modified during the branch to p0_far_3
!	%l1  = 0000000004ff04f6
!	%l6  = c000000000000000
	set	p0_b214,%o7
	fbul	p0_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000031000048] = 6171d395000d852b, %l3 = 0000000000027f82
	ldx	[%o2+0x048],%l3		! %l3 = 6171d395000d852b
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x0d6,%g2
p0_b214:
!	Registers modified during the branch to p0_far_0
!	%l1  = 0000000000075464
!	%l2  = 00000000000747ac
!	%l4  = 000d6f99f5a8eaae
!	%l7  = 00000000000a0dbd
	membar	#Sync			! Added by membar checker (175)
!	Mem[00000000108000b8] = 7237c0c5, %l4 = 000d6f99f5a8eaae
	swapa	[%i1+0x0b8]%asi,%l4	! %l4 = 000000007237c0c5

p0_label_186:
!	Branch On Register, %l2 = 00000000000747ac
	brgez,a,pt %l2,p0_b215		! Branch Taken
!	%l5 = 0000000004ff04f6, Mem[0000000010800026] = 4caf1c9e
	sth	%l5,[%i1+0x026]		! Mem[0000000010800024] = 4caf04f6
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p0_branch_failed
	mov	0x0d7,%g2
p0_b215:
	bne	p0_b216			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000030000048] = 76223665, %l6 = c000000000000000
	ldsb	[%o0+0x04a],%l6		! %l6 = 0000000000000036
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x0d8,%g2
p0_b216:
	set	p0_b217,%o7
	fbo,a	p0_far_0_he	! Branch Taken, %fcc0 = 1

p0_label_187:
!	Mem[0000000011800000] = fffffb1d76223665, %l3 = 6171d395000d852b
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = fffffb1d76223665
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x0d9,%g2
p0_b217:
!	Registers modified during the branch to p0_far_0
!	%l1  = 00000000723f21e1
!	%l2  = 00000000723f1529
!	%l4  = 7565c5e4c30838f2
!	%l7  = 00000000000a1d71
	membar	#Sync			! Added by membar checker (176)
!	%f14 = 41dacd52 00000000, %f26 = 80000000
	fdtos	%f14,%f26		! %f26 = 4ed66a90
	fbge	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l6 = 00000036, %l7 = 000a1d71, Mem[0000000011000000] = ff9f0120 ffffffff
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000011000000] = 00000036 000a1d71
p0_b218:
	membar	#Sync			! Added by membar checker (177)
!	%l3 = fffffb1d76223665, immed = fffffc12, %y  = 7565c5e4
	sdiv	%l3,-0x3ee,%l0		! %l0 = ffffffff80000000

p0_label_188:
	fbl,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000011800000] = fffffb1d, %l3 = fffffb1d76223665
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = fffffffffffffb1d
p0_b219:
	membar	#Sync			! Added by membar checker (178)
!	Mem[000000003100000c] = e5340074, %l6 = 0000000000000036
	ldsw	[%o2+0x00c],%l6		! %l6 = ffffffffe5340074
!	Mem[00000000110000f4] = 87ca4343, %l5 = 0000000004ff04f6
	ldub	[%i2+0x0f7],%l5		! %l5 = 0000000000000043
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_189:
!	Mem[0000000013000000] = bfe4870a, %l4 = 7565c5e4c30838f2
	lduwa	[%i6+%g0]0x80,%l4	! Annulled
p0_b220:
	set	p0_b221,%o7
	fbo,a	p0_far_2_le	! Branch Taken, %fcc0 = 1
!	%l5 = 0000000000000043, Mem[0000000010000008] = 00000002
	stha	%l5,[%i0+%o6]0x80	! Mem[0000000010000008] = 00430002
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p0_branch_failed
	mov	0x0dd,%g2
p0_b221:
!	Registers modified during the branch to p0_far_2
!	%l0  = 0000000000000000
!	%l1  = 00000000000a1d71
!	%l3  = ffffffffffffffff
!	%l5  = 0000000000000a23
	membar	#Sync			! Added by membar checker (179)
	fbu,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000030000048] = 76223665, %l0 = 0000000000000000
	ldsb	[%o0+0x049],%l0		! Annulled
p0_b222:

p0_label_190:
	membar	#Sync			! Added by membar checker (180)
!	%l1 = 00000000000a1d71, Mem[0000000030800008] = 2fce00b335761de3
	stxa	%l1,[%o1+0x008]%asi	! Mem[0000000030800008] = 00000000000a1d71
!	Denormal Floating Point Operation Nullified
	nop
!	%f6  = 00000000, %f7  = 3f800000, %f26 = 4ed66a90
	fadds	%f6 ,%f7 ,%f26		! %f26 = 3f800000
!	Mem[0000000032000060] = 00000000 f8aa78cd ffffffff ffffffe3
	prefetch [%o4+0x060],4
	set	p0_b223,%o7
	fbue,pt	%fcc2,p0_near_0_le	! Branch Taken, %fcc2 = 0

p0_label_191:
!	Mem[0000000010000078] = 2756f179, %l3 = ffffffffffffffff
	ldub	[%i0+0x079],%l3		! %l3 = 0000000000000056
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0df,%g2
p0_b223:
!	Registers modified during the branch to p0_near_0
!	%l2  = 70ed4f488cc12faa
!	%l3  = 8a9a3a1b3cf7ce2e
!	%l7  = 00000000e53e1de5
	membar	#Sync			! Added by membar checker (181)
!	Mem[0000000032000070] = 1e009d95, %l6 = ffffffffe5340074
	lduha	[%o4+0x072]%asi,%g2	! %g2 = 0000000000001e00
!	%l4 = 7565c5e4c30838f2, immed = ffffffac, %l0 = 0000000000000000
	andn	%l4,-0x054,%l0		! %l0 = 0000000000000052
	set	p0_b224,%o7
	fbo	p0_far_3_he	! Branch Taken, %fcc0 = 1
!	%l0 = 0000000000000052, Mem[0000000010000062] = f1dc0e62
	sth	%l0,[%i0+0x062]		! Mem[0000000010000060] = f1dc0052
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0e0,%g2
p0_b224:
!	Registers modified during the branch to p0_far_3
!	%l1  = fffffffffffffdff
!	%l2  = 9495870447cac4c4
!	%l7  = 00000000000064bb

p0_label_192:
	membar	#Sync			! Added by membar checker (182)
!	%f11 = 00000000, %f12 = 00000000
	fabss	%f11,%f12		! %f12 = 00000000
!	Mem[0000000032000020] = b62c8d98 1c3dd831 537245c7 b3b6f9b1
	prefetcha [%o4+0x020]%asi,16
!	%f16 = 00000000 00000000, %f14 = 41dacd52 00000000
	fdtox	%f16,%f14		! %f14 = 00000000 00000000
!	Mem[0000000010000008] = 00430002, %l5 = 0000000000000a23
	ldsba	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000
	set	p0_b225,%o7
	fbne,a,pn %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 1

p0_label_193:
!	%l6 = e5340074, %l7 = 000064bb, Mem[0000000010000008] = 00430002 93d8b000
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000010000008] = e5340074 000064bb
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p0_branch_failed
	mov	0x0e1,%g2
p0_b225:
!	Registers modified during the branch to p0_near_0
!	%l2  = 70ed4f488cc12faa
!	%l3  = 8a9a3a1b3cf7ce2e
!	%l7  = 00000000e533fe73
	membar	#Sync			! Added by membar checker (183)
!	Branch On Register, %l2 = 70ed4f488cc12faa
	brlez,pn %l2,p0_not_taken_0	! Branch Not Taken
!	Mem[00000000118000c0] = c481d55b, %l0 = 0000000000000052
	ldsb	[%i3+0x0c1],%l0		! %l0 = ffffffffffffff81
p0_b226:
	membar	#Sync			! Added by membar checker (184)
!	%l0 = ffffffffffffff81, Mem[0000000040000010] = 000064bb382f2a35
	stx	%l0,[%o5+0x010]		! Mem[0000000040000010] = ffffffffffffff81
!	%l2 = 70ed4f488cc12faa, %l6 = ffffffffe5340074, %l1 = fffffffffffffdff
	srax	%l2,%l6,%l1		! %l1 = 000000000000070e

p0_label_194:
	fbne,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000010800000] = fff007de, %l5 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = fffffffffffffff0
p0_b227:
	set	p0_b228,%o7
	fba	p0_far_3_he	! Branch Taken, %fcc0 = 1
!	%l7 = 00000000e533fe73, Mem[0000000031000040] = ffc44646a89260b3
	stx	%l7,[%o2+0x040]		! Mem[0000000031000040] = 00000000e533fe73
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x0e4,%g2
p0_b228:
!	Registers modified during the branch to p0_far_3
!	%l1  = ffffffffffffff7b
!	%l2  = 9495870447cac4c4
!	%l7  = 00000000000064bb
	bgu,a	p0_b229			! Branch Taken, %ccr = 80, CWP = 0

p0_label_195:
!	%l4 = 7565c5e4c30838f2, Mem[0000000011000000] = 00000036000a1d71
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000011000000] = 7565c5e4c30838f2
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p0_branch_failed
	mov	0x0e5,%g2
p0_b229:
	membar	#Sync			! Added by membar checker (185)
	fbue,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010800000] = fff007de, %l5 = fffffffffffffff0
	ldsha	[%i1+%g0]0x80,%l5	! Annulled
p0_b230:
	membar	#Sync			! Added by membar checker (186)
!	%l5 = fffffffffffffff0, %l2 = 9495870447cac4c4, %l5 = fffffffffffffff0
	andn	%l5,%l2,%l5		! %l5 = 6b6a78fbb8353b30
!	%l4 = 7565c5e4c30838f2, %l2 = 9495870447cac4c4, %y  = 94958704
	umulcc	%l4,%l2,%l4		! %l4 = 36b1c22faad8e148, %ccr = 08

p0_label_196:
!	%l3 = 8a9a3a1b3cf7ce2e, immed = 00000005, %l3 = 8a9a3a1b3cf7ce2e
	sllx	%l3,0x005,%l3		! %l3 = 534743679ef9c5c0
!	Mem[0000000031000048] = 6171d395, %l7 = 00000000000064bb
	ldsb	[%o2+0x04b],%l7		! %l7 = ffffffffffffff95
!	Mem[00000000110000a0] = e122e749, %l6 = ffffffffe5340074
	ldsba	[%i2+0x0a3]%asi,%l6	! %l6 = 0000000000000049
!	%l4 = 36b1c22faad8e148, Mem[0000000031000044] = e533fe73
	stwa	%l4,[%o2+0x044]%asi	! Mem[0000000031000044] = aad8e148
	set	p0_b231,%o7
	fba,a,pn %fcc0,p0_near_1_he	! Branch Taken, %fcc0 = 1

p0_label_197:
!	 Annulled
	ldd	[%i2+0x080],%l2
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p0_branch_failed
	mov	0x0e7,%g2
p0_b231:
!	Registers modified during the branch to p0_near_1
!	%l0  = fffff3bc0005d6bb
!	%l3  = ffef600000000000
	membar	#Sync			! Added by membar checker (187)
!	%f22 = 00000000 00000000, %f2  = 00000000 00000000, %f4  = 00000000 00000000
	fmuld	%f22,%f2 ,%f4 		! %f4  = 00000000 00000000
!	%f2  = 00000000 00000000, %f12 = 00000000 00000000
	fcmped	%fcc2,%f2 ,%f12		! %fcc2 = 0
!	%f27 = 4ed66a90, %f28 = 00000000, %f13 = 00000000
	fsubs	%f27,%f28,%f13		! %f13 = 4ed66a90
	fblg,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0

p0_label_198:
!	Mem[0000000040000010] = ffffffff ffffff81, %l0 = 0005d6bb, %l1 = ffffff7b
	ldd	[%o5+0x010],%l0		! %l0 = 00000000ffffffff 00000000ffffff81
p0_b232:
	membar	#Sync			! Added by membar checker (188)
!	%f28 = 00000000, %f8  = 00000000
	fcmps	%fcc3,%f28,%f8 		! %fcc3 = 0
!	%f16 = 00000000, %f30 = 80000000 00000000
	fstox	%f16,%f30		! %f30 = 00000000 00000000
!	%l1 = 00000000ffffff81, immed = 00000a73, %l6 = 0000000000000049
	andcc	%l1,0xa73,%l6		! %l6 = 0000000000000a01, %ccr = 00
!	%l1 = 00000000ffffff81, Mem[0000000011800008] = ff9c14ddf6e0c689
	stxa	%l1,[%i3+%o6]0x80	! Mem[0000000011800008] = 00000000ffffff81

p0_label_199:
	nop
!	%l5 = 6b6a78fbb8353b30
	setx	0x86abf63486abf634,%g7,%l5 ! %l5 = 86abf63486abf634
!	Mem[00000000118000e0] = fdb8c54a b2b67686 0295b4c8 0030e291
	prefetch [%i3+0x0e0],1
!	%f22 = 00000000, %f5  = 00000000, %f24 = 00000001 6b354800
	nop
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_200:
!	%l4 = aad8e148, %l5 = 86abf634, Mem[0000000010800000] = fff007de 6f902ede
	stda	%l4,[%i1+%g0]0x80	! Annulled
p0_b233:
	membar	#Sync			! Added by membar checker (189)
!	%l6 = 0000000000000a01, immed = ffffff77, %y  = fffff3bc
	udivcc	%l6,-0x089,%l7		! %l7 = 00000000fffff444, %ccr = 08
!	%l5 = 86abf63486abf634, %l5 = 86abf63486abf634, %y  = fffff3bc
	smulcc	%l5,%l5,%l1		! %l1 = 39808cd9463ffa90, %ccr = 00
	bvs	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[00000000108000bc] = 62ba88ed, %l0 = 00000000ffffffff
	lduw	[%i1+0x0bc],%l0		! %l0 = 0000000062ba88ed
	nop
p0_b234:
	nop

!	End of Random Code for Processor 0

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x000]		! Set processor 0 done flag

!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000062ba88ed
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 39808cd9463ffa90
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 9495870447cac4c4
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffef600000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 36b1c22faad8e148
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 86abf63486abf634
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000a01
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000fffff444
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x39808cd9,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 3f800000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 03800000
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
	cmp	%l0,%l1			! %f12 should be 00000000 4ed66a90
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
	cmp	%l0,%l1			! %f18 should be 00000000 00000001
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000001
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000001 6b354800
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 3f800000 4ed66a90
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 00000000
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
	ldx	[%g1+0x000],%g2		! Expect data = 63f8650200000000
	ldx	[%i0+0x000],%g3		! Observed data at 0000000010000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = e5340074000064bb
	ldx	[%i0+0x008],%g3		! Observed data at 0000000010000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 000000b7a048f6fa
	ldx	[%i0+0x010],%g3		! Observed data at 0000000010000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 0000000000000000
	ldx	[%i0+0x030],%g3		! Observed data at 0000000010000030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x060],%g2		! Expect data = f1dc00522661f391
	ldx	[%i0+0x060],%g3		! Observed data at 0000000010000060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 00000000000000c5
	ldx	[%i0+0x068],%g3		! Observed data at 0000000010000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 2756f1797ffff30e
	ldx	[%i0+0x078],%g3		! Observed data at 0000000010000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x088],%g2		! Expect data = c59ce9599ef9c5c0
	ldx	[%i0+0x088],%g3		! Observed data at 0000000010000088
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 44d04b4e7fffee81
	ldx	[%i0+0x098],%g3		! Observed data at 0000000010000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = bc432705c42fead0
	ldx	[%i0+0x0a8],%g3		! Observed data at 00000000100000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = 37b6f520c58d0000
	ldx	[%i0+0x0f0],%g3		! Observed data at 00000000100000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 0000000000000001
	ldx	[%i0+0x0f8],%g3		! Observed data at 00000000100000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = fff007de6f902ede
	ldx	[%i1+0x000],%g3		! Observed data at 0000000010800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff00089f0002d215
	ldx	[%i1+0x008],%g3		! Observed data at 0000000010800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = cdd1b3d94caf04f6
	ldx	[%i1+0x020],%g3		! Observed data at 0000000010800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 1b689d2608ff9b45
	ldx	[%i1+0x048],%g3		! Observed data at 0000000010800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x050],%g2		! Expect data = f276d9ffd7397d89
	ldx	[%i1+0x050],%g3		! Observed data at 0000000010800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 00000000ff1007de
	ldx	[%i1+0x058],%g3		! Observed data at 0000000010800058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x060],%g2		! Expect data = d0f60d68001c8cbe
	ldx	[%i1+0x060],%g3		! Observed data at 0000000010800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x078],%g2		! Expect data = db79687eff93fb62
	ldx	[%i1+0x078],%g3		! Observed data at 0000000010800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x080],%g2		! Expect data = ffffffffcf8b51f5
	ldx	[%i1+0x080],%g3		! Observed data at 0000000010800080
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 045e435c00004200
	ldx	[%i1+0x098],%g3		! Observed data at 0000000010800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 0000529300000000
	ldx	[%i1+0x0a0],%g3		! Observed data at 00000000108000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = cd9b00dc032a00e8
	ldx	[%i1+0x0b0],%g3		! Observed data at 00000000108000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = f5a8eaae62ba88ed
	ldx	[%i1+0x0b8],%g3		! Observed data at 00000000108000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 133ad8b948c6327c
	ldx	[%i1+0x0e8],%g3		! Observed data at 00000000108000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 7565c5e4c30838f2
	ldx	[%i2+0x000],%g3		! Observed data at 0000000011000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 00000000000016d4
	ldx	[%i2+0x008],%g3		! Observed data at 0000000011000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 00000000000016d4
	ldx	[%i2+0x018],%g3		! Observed data at 0000000011000018
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x020],%g2		! Expect data = ddefedba2a65b82e
	ldx	[%i2+0x020],%g3		! Observed data at 0000000011000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x058],%g2		! Expect data = b266193804ff07f7
	ldx	[%i2+0x058],%g3		! Observed data at 0000000011000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x090],%g2		! Expect data = ffffffff207bd395
	ldx	[%i2+0x090],%g3		! Observed data at 0000000011000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 000016d48a67a9ff
	ldx	[%i2+0x0b8],%g3		! Observed data at 00000000110000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 6a5f008770070000
	ldx	[%i2+0x0c0],%g3		! Observed data at 00000000110000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 0000009f0000c59c
	ldx	[%i2+0x0d8],%g3		! Observed data at 00000000110000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 3e7edcd71536dcff
	ldx	[%i2+0x0e0],%g3		! Observed data at 00000000110000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e0,%g4

	set	p0_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = fffffb1d76223665
	ldx	[%i3+0x000],%g3		! Observed data at 0000000011800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 00000000ffffff81
	ldx	[%i3+0x008],%g3		! Observed data at 0000000011800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 00027f82f1f6afff
	ldx	[%i3+0x030],%g3		! Observed data at 0000000011800030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x058],%g2		! Expect data = ffffa2ffaffd02aa
	ldx	[%i3+0x058],%g3		! Observed data at 0000000011800058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 0000076098b062c1
	ldx	[%i3+0x078],%g3		! Observed data at 0000000011800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x098],%g2		! Expect data = ffffffff93d8beea
	ldx	[%i3+0x098],%g3		! Observed data at 0000000011800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = 8cc12faa733ed055
	ldx	[%i3+0x0b0],%g3		! Observed data at 00000000118000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = c481d55b24795f48
	ldx	[%i3+0x0c0],%g3		! Observed data at 00000000118000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = ffffffffffffffff
	ldx	[%i3+0x0f0],%g3		! Observed data at 00000000118000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 7fffffff00000000
	ldx	[%i3+0x0f8],%g3		! Observed data at 00000000118000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 92713bd80bb5a74a
	ldx	[%i4+0x000],%g3		! Observed data at 0000000012000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 8cc1342600000000
	ldx	[%i4+0x060],%g3		! Observed data at 0000000012000060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4

	set	p0_local5_expect,%g1
	ldx	[%g1+0x0e8],%g2		! Expect data = 6f8dafdb9e6dff2d
	ldx	[%i5+0x0e8],%g3		! Observed data at 00000000128000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local6_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = bfe4870a78e50fd5
	ldx	[%i6+0x000],%g3		! Observed data at 0000000013000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffffffff22934b23
	ldx	[%i6+0x008],%g3		! Observed data at 0000000013000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p0_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p0_memcheck_share0:
	ldx	[%g4+0x00],%g2	! Expected value = 74e79c14262c9f8e
	ldx	[%o0+0x00],%g3	! Read value at Mem[0000000030000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = cd17007352467d89
	ldx	[%o0+0x08],%g3	! Read value at Mem[0000000030000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 0000000000005293
	ldx	[%o0+0x40],%g3	! Read value at Mem[0000000030000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 76223665ffffffff
	ldx	[%o0+0x48],%g3	! Read value at Mem[0000000030000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p0_memcheck_share1:
	ldx	[%g4+0x00],%g2	! Expected value = 000054790000c59c
	ldx	[%o1+0x00],%g3	! Read value at Mem[0000000030800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 00000000000a1d71
	ldx	[%o1+0x08],%g3	! Read value at Mem[0000000030800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = ffffffff0000ff84
	ldx	[%o1+0x40],%g3	! Read value at Mem[0000000030800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 0000000000000760
	ldx	[%o1+0x48],%g3	! Read value at Mem[0000000030800048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p0_memcheck_share2:
	ldx	[%g4+0x00],%g2	! Expected value = 74328ebbaa874a85
	ldx	[%o2+0x00],%g3	! Read value at Mem[0000000031000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 8b9aff6ce5340074
	ldx	[%o2+0x08],%g3	! Read value at Mem[0000000031000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 00000000aad8e148
	ldx	[%o2+0x40],%g3	! Read value at Mem[0000000031000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 6171d395000d852b
	ldx	[%o2+0x48],%g3	! Read value at Mem[0000000031000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p0_memcheck_share3:
	ldx	[%g4+0x00],%g2	! Expected value = f47636931c40ab3e
	ldx	[%o3+0x00],%g3	! Read value at Mem[0000000031800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 0084000000000000
	ldx	[%o3+0x08],%g3	! Read value at Mem[0000000031800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 152f00001c3dd8b9
	ldx	[%o3+0x40],%g3	! Read value at Mem[0000000031800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = ffc43955a89260b3
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
	add	%l6,%l1,%l7
	ldx	[%i1+0x090],%l2		! Mem[0000000010800090]
	srl	%l7,0x000,%l7
	xnorcc	%l4,0x923,%l3
	ldstub	[%i1+0x0da],%l6		! Mem[00000000108000da]
	done

p0_trap1o:
	add	%l6,%l1,%l7
	ldx	[%o1+0x090],%l2		! Mem[0000000010800090]
	srl	%l7,0x000,%l7
	xnorcc	%l4,0x923,%l3
	ldstub	[%o1+0x0da],%l6		! Mem[00000000108000da]
	done


p0_trap2e:
	ldsh	[%i2+0x088],%l5		! Mem[0000000011000088]
	sdivcc	%l2,0x4cb,%l3
	done

p0_trap2o:
	ldsh	[%o2+0x088],%l5		! Mem[0000000011000088]
	sdivcc	%l2,0x4cb,%l3
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
	ldx	[%g1+0x000],%l0	! %l0 = aa861aff8236be13
	ldx	[%g1+0x008],%l1	! %l1 = ae1911ffb032e3c9
	ldx	[%g1+0x010],%l2	! %l2 = cf9a19fff6616847
	ldx	[%g1+0x018],%l3	! %l3 = cdd5b6007b8d1713
	ldx	[%g1+0x020],%l4	! %l4 = d6fce6fff77f0307
	ldx	[%g1+0x028],%l5	! %l5 = 65b0ff00315d5fe2
	ldx	[%g1+0x030],%l6	! %l6 = 0ec5afffaa1e5890
	ldx	[%g1+0x038],%l7	! %l7 = cc974100351b1e24

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
	ldd	[%g1+0x00],%f0		! %f0  = dce5c2f3, %f1  = a2ef2ac7
	ldd	[%g1+0x08],%f2		! %f2  = 83c8059c, %f3  = 1687b362
	ldd	[%g1+0x10],%f4		! %f4  = e2b3c4bf, %f5  = 6fb1460a
	ldd	[%g1+0x18],%f6		! %f6  = ca59ed86, %f7  = e7c82ede
	ldd	[%g1+0x20],%f8		! %f8  = 8bd0382e, %f9  = d816a931
	ldd	[%g1+0x28],%f10		! %f10 = 578b91e9, %f11 = 637902eb
	ldd	[%g1+0x30],%f12		! %f12 = eabc6fb5, %f13 = 1ada3133
	ldd	[%g1+0x38],%f14		! %f14 = ff149318, %f15 = cf309c26
	ldd	[%g1+0x40],%f16		! %f16 = 87ff6514, %f17 = 3b4b47a0
	ldd	[%g1+0x48],%f18		! %f18 = f7e34b21, %f19 = 1a1820e2
	ldd	[%g1+0x50],%f20		! %f20 = 2e6906d0, %f21 = 7d327503
	ldd	[%g1+0x58],%f22		! %f22 = 356d8d21, %f23 = 2cc72233
	ldd	[%g1+0x60],%f24		! %f24 = 8672b502, %f25 = 27968572
	ldd	[%g1+0x68],%f26		! %f26 = 09b41a16, %f27 = 01fe959e
	ldd	[%g1+0x70],%f28		! %f28 = 789475bc, %f29 = 8b79f0ce
	ldd	[%g1+0x78],%f30		! %f30 = d0e20c0e, %f31 = 1e689fdf
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 1

p1_label_1:
	set	p1_b1,%o7
	fble	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l6 = 6ec379ff82b7dcb9, Mem[0000000015000194] = 3820edc7
	stw	%l6,[%i2+0x194]		! Mem[0000000015000194] = 82b7dcb9
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x001,%g2
p1_b1:
!	Registers modified during the branch to p1_far_2
!	%l0  = dffd565bedd00000
!	%l3  = ffffffffffffff86
!	%l4  = 00000000000002ab
	membar	#Sync			! Added by membar checker (190)
!	%l3 = ffffffffffffff86, %l6 = 6ec379ff82b7dcb9, %l1 = f42ffbffaacb7dba
	srlx	%l3,%l6,%l1		! %l1 = 000000000000007f
	fbne,a,pt %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000015000008] = a7740429, %l0 = dffd565bedd00000
	lduha	[%i2+%o6]0x80,%l0	! Annulled
p1_b2:

p1_label_2:
	bpos	p1_b3			! Branch Taken, %ccr = 44, CWP = 0
!	%l1 = 000000000000007f, Mem[0000000014800130] = 85ccfc7fdae46246
	stx	%l1,[%i1+0x130]		! Mem[0000000014800130] = 000000000000007f
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x003,%g2
p1_b3:
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000015000000] = b05bcd4a, %l4 = 00000000000002ab
	ldsha	[%i2+%g0]0x80,%l4	! Annulled
p1_b4:
	membar	#Sync			! Added by membar checker (191)
	fbul,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_3:
!	%l0 = edd00000, %l1 = 0000007f, Mem[0000000030000018] = 0b82de87 b3d896c3
	std	%l0,[%o0+0x018]	! Annulled
p1_b5:
	membar	#Sync			! Added by membar checker (192)
!	%l5 = a68f8cffcae8058e, Mem[0000000032000060] = e6a70116
	stwa	%l5,[%o4+0x060]%asi	! Mem[0000000032000060] = cae8058e
!	Mem[0000000015800000] = b70bd97c, %l6 = 6ec379ff82b7dcb9
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000b7
!	%l4 = 00000000000002ab, %l4 = 00000000000002ab, %l0 = dffd565bedd00000
	addccc	%l4,%l4,%l0		! %l0 = 0000000000000556, %ccr = 00
!	%l7 = d2d051007a043d92, %l0 = 0000000000000556, %l7 = d2d051007a043d92
	srlx	%l7,%l0,%l7		! %l7 = 0000034b414401e8

p1_label_4:
!	%l3 = ffffffffffffff86
	setx	0xeaf59836eaf59836,%g7,%l3 ! %l3 = eaf59836eaf59836
	fbl,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l2 = 8608d576, %l3 = eaf59836, Mem[0000000017000008] = 4fcbe1c6 3a357ef3
	stda	%l2,[%i6+%o6]0x80	! Annulled
p1_b6:
	membar	#Sync			! Added by membar checker (193)
!	%l0 = 0000000000000556, %l6 = 00000000000000b7, %y  = 00000000
	sdivx	%l0,%l6,%l0		! %l0 = 0000000000000007
!	%f19 = 1a1820e2, %f19 = 1a1820e2, %f4  = e2b3c4bf
	fsubs	%f19,%f19,%f4 		! %f4  = 00000000

p1_label_5:
	fbul,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l0 = 0000000000000007, Mem[0000000015800008] = 8d277ba04cb60455
	stxa	%l0,[%i3+%o6]0x80	! Mem[0000000015800008] = 0000000000000007
p1_b7:
	membar	#Sync			! Added by membar checker (194)
!	%f14 = ff149318, %f31 = 1e689fdf
	fnegs	%f14,%f31		! %f31 = 7f149318
!	%l3 = eaf59836eaf59836, %l4 = 00000000000002ab, %l2 = a883c8ff8608d576
	taddcc	%l3,%l4,%l2		! %l2 = eaf59836eaf59ae1, %ccr = 8a
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 8a

p1_label_6:
!	Mem[0000000015800000] = ff0bd97c, %l7 = 0000034b414401e8
	ldsha	[%i3+%g0]0x80,%l7	! Annulled
p1_b8:
	membar	#Sync			! Added by membar checker (195)
	set	p1_b9,%o7
	fble,a,pn %fcc1,p1_near_1_he	! Branch Taken, %fcc1 = 0
!	Mem[00000000150000c0] = 4d405c55 78534db3, %l6 = 000000b7, %l7 = 414401e8
	ldd	[%i2+0x0c0],%l6		! %l6 = 000000004d405c55 0000000078534db3
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x009,%g2
p1_b9:
!	Registers modified during the branch to p1_near_1
!	%l1  = d5eb306dd5eb35c2
!	%l4  = fffffffffffffbaf
!	%l6  = d5eb306dd5eb3317
	membar	#Sync			! Added by membar checker (196)
	set	p1_b10,%o7
	fbuge,a,pn %fcc1,p1_near_0_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000014800008] = 16232e78, %l1 = d5eb306dd5eb35c2
	ldswa	[%i1+%o6]0x80,%l1	! %l1 = 0000000016232e78
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x00a,%g2
p1_b10:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffb87fffffbbf7
!	%l2  = ffffffff99243c07

p1_label_7:
	membar	#Sync			! Added by membar checker (197)
!	%l0 = 0000000000000007, %l3 = eaf59836eaf59836, %l7 = 0000000078534db3
	sub	%l0,%l3,%l7		! %l7 = 150a67c9150a67d1
!	%l4 = fffffffffffffbaf, %l1 = ffffb87fffffbbf7, %l3 = eaf59836eaf59836
	andn	%l4,%l1,%l3		! %l3 = 0000478000004008
!	%l3 = 0000478000004008, immed = 000002b2, %l0 = 0000000000000007
	xorcc	%l3,0x2b2,%l0		! %l0 = 00004780000042ba, %ccr = 00
!	Mem[0000000014000040] = fcbe3eaf, %l0 = 00004780000042ba
	ldsb	[%i0+0x040],%l0		! %l0 = fffffffffffffffc
!	%l1 = ffffb87fffffbbf7, immed = 00000ca2, %l6 = d5eb306dd5eb3317
	taddcc	%l1,0xca2,%l6		! %l6 = ffffb87fffffc899, %ccr = 8a

p1_label_8:
	set	p1_b11,%o7
	fbe	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	%l3 = 0000478000004008, Mem[0000000014800008] = 16232e78
	stwa	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = 00004008
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x00b,%g2
p1_b11:
!	Registers modified during the branch to p1_far_1
!	%l1  = ffffb87fffffc0c8
!	%l2  = ffffb87fffffc0c0
	membar	#Sync			! Added by membar checker (198)
!	Mem[0000000015000034] = f855a2e2, %l6 = ffffb87fffffc899
	ldsh	[%i2+0x034],%l6		! %l6 = fffffffffffff855
!	%f18 = f7e34b21, %f10 = 578b91e9 637902eb
	fstod	%f18,%f10		! %f10 = c6fc6964 20000000
!	%f0  = dce5c2f3 a2ef2ac7, %f0  = dce5c2f3 a2ef2ac7, %f26 = 09b41a16 01fe959e
	fsubd	%f0 ,%f0 ,%f26		! %f26 = 00000000 00000000

p1_label_9:
!	%l5 = a68f8cffcae8058e, immed = 00000000, %l0 = fffffffffffffffc
	srax	%l5,0x000,%l0		! %l0 = a68f8cffcae8058e
!	%l4 = fffffffffffffbaf, immed = 00000e53, %l0 = a68f8cffcae8058e
	add	%l4,0xe53,%l0		! %l0 = 0000000000000a02
!	Mem[0000000015800008] = 00000000, %l1 = ffffb87fffffc0c8
	ldstuba	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030000018] = 00000000 00000000, %l3 = 0000478000004008, %l3 = 0000478000004008
	add	%o0,0x18,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 0b82de87b3d896c3
!	Mem[0000000016000008] = a071fa34, %l3 = 0b82de87b3d896c3
	ldswa	[%i4+%o6]0x80,%l3	! %l3 = ffffffffa071fa34

p1_label_10:
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000014000008] = 1d5e798b, %l3 = ffffffffa071fa34
	lduba	[%i0+%o6]0x80,%l3	! Annulled
p1_b12:
	membar	#Sync			! Added by membar checker (199)
!	%f19 = 1a1820e2, %f26 = 00000000, %f10 = c6fc6964
	fadds	%f19,%f26,%f10		! %f10 = 1a1820e2
!	Mem[0000000031800054] = 020c630d, %l0 = 0000000000000a02
	ldsha	[%o3+0x054]%asi,%l0	! %l0 = 000000000000020c
!	Mem[0000000040000018] = 220a2b2d 001a270f, %l6 = fffff855, %l7 = 150a67d1
	ldd	[%o5+0x018],%l6		! %l6 = 00000000220a2b2d 00000000001a270f

p1_label_11:
!	Mem[0000000030000058] = 220a2b2d 001a270f, %l2 = ffffb87fffffc0c0, %l5 = a68f8cffcae8058e
	add	%o0,0x58,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = bbd94c79db797e09
!	%l2 = ffffb87fffffc0c0, %l6 = 00000000220a2b2d, %l5 = bbd94c79db797e09
	subc	%l2,%l6,%l5		! %l5 = ffffb87fddf59593
!	%f2  = 83c8059c, %f27 = 00000000
	fmovs	%f2 ,%f27		! %f27 = 83c8059c
!	Mem[0000000031800058] = cd0dfe01, %l7 = 00000000001a270f
	ldsba	[%o3+0x05b]%asi,%l7	! %l7 = 0000000000000001
!	Mem[00000000158001d0] = 92ba32ea 00b095fd, %l2 = ffffc0c0, %l3 = a071fa34
	ldda	[%i3+0x1d0]%asi,%l2	! %l2 = 0000000092ba32ea 0000000000b095fd

p1_label_12:
	bgu	p1_b13			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000015800060] = f56eb4cb cb454ac3 8808d42d 8564df54
	prefetch [%i3+0x060],4
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x00d,%g2
p1_b13:
	membar	#Sync			! Added by membar checker (200)
!	%l4 = fffffffffffffbaf, %l5 = ffffb87fddf59593, %l3 = 0000000000b095fd
	xor	%l4,%l5,%l3		! %l3 = 00004780220a6e3c
	fbl,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l4 = fffffffffffffbaf, Mem[00000000158001d0] = 92ba32ea
	stw	%l4,[%i3+0x1d0]		! Mem[00000000158001d0] = fffffbaf
p1_b14:

p1_label_13:
	membar	#Sync			! Added by membar checker (201)
!	Branch On Register, %l7 = 0000000000000001
	brgez,a,pt %l7,p1_b15		! Branch Taken
!	%l1 = 0000000000000000, Mem[0000000030800054] = 68e7e2ac
	stw	%l1,[%o1+0x054]		! Mem[0000000030800054] = 00000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x00f,%g2
p1_b15:
	bgu,a	p1_b16			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000014800008] = 00004008, %l3 = 00004780220a6e3c
	ldswa	[%i1+%o6]0x80,%l3	! %l3 = 0000000000004008
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x010,%g2
p1_b16:
	membar	#Sync			! Added by membar checker (202)
	fbn,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0

p1_label_14:
!	Mem[0000000014000000] = 8959c203, %l6 = 00000000220a2b2d
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffff89
p1_b17:
	set	p1_b18,%o7
	fba,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	%l7 = 0000000000000001, Mem[0000000015800008] = ff000000
	stha	%l7,[%i3+%o6]0x80	! Annulled
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x012,%g2
p1_b18:
!	Registers modified during the branch to p1_far_0
!	%l6  = 000000000000407e
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (203)
!	Mem[0000000014800180] = e7f53892 0af408b7 d006898a 07b8ac41
	prefetch [%i1+0x180],21
!	Mem[00000000150000a0] = 17ade110 c256c9f3, %l6 = 0000407e, %l7 = 00000000
	ldda	[%i2+0x0a0]%asi,%l6	! %l6 = 0000000017ade110 00000000c256c9f3

p1_label_15:
!	Mem[0000000030800010] = 17ade110 c256c9f3, %l2 = 0000000092ba32ea, %l7 = 00000000c256c9f3
	add	%o1,0x10,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = d1cc995a42936478
!	%f24 = 8672b502, %f26 = 00000000
	fabss	%f24,%f26		! %f26 = 0672b502
!	Branch On Register, %l1 = 0000000000000000
	brnz,a,pt %l1,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014800144] = 68db5906, %l5 = ffffb87fddf59593
	ldsw	[%i1+0x144],%l5		! Annulled
p1_b19:
!	Jump to jmpl_2, CWP = 0
	set	p1_jmpl_2_he,%g1
	jmpl	%g1,%g6

p1_label_16:
!	Mem[0000000015000008] = a7740429, %l6 = 0000000017ade110
	ldsha	[%i2+%o6]0x80,%l6	! %l6 = ffffffffffffa774
!	Registers modified during the branch to p1_jmpl_2
!	%l2  = ffffffffffffffff
!	%l5  = 000000000001847a
	membar	#Sync			! Added by membar checker (204)
!	%l5 = 000000000001847a, Mem[0000000016000000] = 3f4c2d62
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000016000000] = 847a2d62
!	Mem[0000000015000000] = b05bcd4a, %l0 = 000000000000020c
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000b05b
!	Mem[0000000015000060] = 02ecbf92 8b658bae 749d040f 6d352ec9
	prefetcha [%i2+0x060]%asi,22
!	Mem[000000001500000c] = 9b253b0a, %l4 = fffffffffffffbaf
	ldub	[%i2+0x00c],%l4		! %l4 = 000000000000009b

p1_label_17:
	fbne,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l2 = ffffffff, %l3 = 00004008, Mem[0000000014000138] = 99243c07 af3b860c
	std	%l2,[%i0+0x138]	! Mem[0000000014000138] = ffffffff 00004008
p1_b20:
	membar	#Sync			! Added by membar checker (205)
!	%l2 = ffffffffffffffff
	setx	0x61986b5061986b50,%g7,%l2 ! %l2 = 61986b5061986b50
!	%l2 = 61986b5061986b50, %l1 = 0000000000000000, %l5 = 000000000001847a
	subc	%l2,%l1,%l5		! %l5 = 61986b5061986b50
!	Mem[0000000015800008] = ff000000 00000007, %l4 = 0000009b, %l5 = 61986b50
	ldda	[%i3+%o6]0x80,%l4	! %l4 = 00000000ff000000 0000000000000007

p1_label_18:
!	%f0  = dce5c2f3, %f13 = 1ada3133
	fnegs	%f0 ,%f13		! %f13 = 5ce5c2f3
	set	p1_b21,%o7
	fbule,a,pt %fcc1,p1_near_1_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000031000018] = 3126cb3c, %l1 = 0000000000000000
	swap	[%o2+0x018],%l1		! %l1 = 000000003126cb3c
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x015,%g2
p1_b21:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000004
!	%l3  = 61986b5071beeb7c
!	%l7  = fffffffffff8e84f
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l4 = 00000000ff000000, Mem[00000000148000f1] = 20314dcf
	stb	%l4,[%i1+0x0f1]		! Annulled
p1_b22:

p1_label_19:
	membar	#Sync			! Added by membar checker (206)
!	Mem[0000000015800104] = 358325a1, %l0 = 0000000000000004
	lduha	[%i3+0x106]%asi,%l0	! %l0 = 00000000000025a1
!	%f6  = ca59ed86 e7c82ede, %f30 = d0e20c0e 7f149318
	fnegd	%f6 ,%f30		! %f30 = 4a59ed86 e7c82ede
!	%l2 = 61986b5061986b50, Mem[0000000014000158] = ca97c99379a04301
	stxa	%l2,[%i0+0x158]%asi	! Mem[0000000014000158] = 61986b5061986b50
	bl,a	p1_b23			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000032000048] = cf027a2b, %l5 = 0000000000000007
	lduh	[%o4+0x048],%g2		! %g2 = 000000000000cf02
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x017,%g2
p1_b23:

p1_label_20:
	membar	#Sync			! Added by membar checker (207)
!	Mem[0000000015000020] = 50b62fe9 a0ca5417 b67df6c4 f22e7bcd
	prefetch [%i2+0x020],3
!	%l2 = 61986b5061986b50, Mem[0000000015800000] = ff0bd97c
	stha	%l2,[%i3+%g0]0x80	! Mem[0000000015800000] = 6b50d97c
!	%l1 = 000000003126cb3c, immed = fffff0d3, %l1 = 000000003126cb3c
	andncc	%l1,-0xf2d,%l1		! %l1 = 0000000000000b2c, %ccr = 00
!	Mem[0000000032000078] = 087d4a36 ceb28373, %l0 = 000025a1, %l1 = 00000b2c
	ldda	[%o4+0x078]%asi,%g2	! %l0 = 00000000000025a1 0000000000000b2c
!	Mem[0000000015000000] = b05bcd4a, %l4 = 00000000ff000000
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000b05b

p1_label_21:
!	Mem[0000000014800060] = a0f51c34 d843dd11 374b2155 d2dab07a
	prefetch [%i1+0x060],2
!	%l5 = 0000000000000007, Mem[0000000014000103] = 06a33ab8
	stb	%l5,[%i0+0x103]		! Mem[0000000014000100] = 06a33a07
!	%l2 = 61986b5061986b50, immed = 00000de5, %y  = 00000000
	udiv	%l2,0xde5,%l3		! %l3 = 0000000000070625
!	Mem[0000000014000008] = 1d5e798b, %l7 = fffffffffff8e84f
	lduha	[%i0+%o6]0x80,%l7	! %l7 = 0000000000001d5e
!	%l7 = 0000000000001d5e, %l5 = 0000000000000007, %y  = 00000000
	smul	%l7,%l5,%l7		! %l7 = 000000000000cd92

p1_label_22:
!	%l7 = 000000000000cd92, immed = fffff8d9, %y  = 00000000
	mulx	%l7,-0x727,%l0		! %l0 = fffffffffa41b0c2
!	%l5 = 0000000000000007, Mem[0000000014800044] = 10268255
	stwa	%l5,[%i1+0x044]%asi	! Mem[0000000014800044] = 00000007
!	Mem[0000000014800100] = bdf0e0e0 2f4869f3 a4e95180 138b068f
	prefetcha [%i1+0x100]%asi,0
!	%l3 = 0000000000070625, immed = 00000010, %y  = 00000000
	sdivx	%l3,0x010,%l5		! %l5 = 0000000000007062
	fbg,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0

p1_label_23:
!	%l2 = 61986b5061986b50, Mem[0000000015000008] = a7740429
	stba	%l2,[%i2+%o6]0x80	! Mem[0000000015000008] = 50740429
p1_b24:
	membar	#Sync			! Added by membar checker (208)
!	Mem[00000000140001c0] = 02f738ba c7ee8923 7518a725 f2818e88
	prefetch [%i0+0x1c0],20
!	Mem[00000000158000bc] = 64721d99, %l2 = 61986b5061986b50
	ldub	[%i3+0x0be],%l2		! %l2 = 000000000000001d
	set	p1_b25,%o7
	fble,a,pt %fcc1,p1_near_3_he	! Branch Taken, %fcc1 = 0
!	%l6 = ffffa774, %l7 = 0000cd92, Mem[0000000015000008] = 50740429 9b253b0a
	stda	%l6,[%i2+%o6]0x80	! Mem[0000000015000008] = ffffa774 0000cd92
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x019,%g2
p1_b25:
!	Registers modified during the branch to p1_near_3
!	%l4  = ffffffffffa96d5a

p1_label_24:
	membar	#Sync			! Added by membar checker (209)
!	%l4 = ffffffffffa96d5a, immed = 0000017e, %l3 = 0000000000070625
	addcc	%l4,0x17e,%l3		! %l3 = ffffffffffa96ed8, %ccr = 88
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldda	[%i2+%g0]0x80,%l2
p1_b26:
	membar	#Sync			! Added by membar checker (210)
	set	p1_b27,%o7
	fble,pt	%fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[000000003180001c] = 7d3752c0, %l2 = 000000000000001d
	ldsh	[%o3+0x01c],%l2		! %l2 = 0000000000007d37
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x01b,%g2
p1_b27:
!	Registers modified during the branch to p1_near_0
!	%l0  = ffffffffffff96c3
!	%l1  = 0000000000000001
!	%l5  = 0000000000000c4d

p1_label_25:
	membar	#Sync			! Added by membar checker (211)
!	%f26 = 0672b502 83c8059c, %f26 = 0672b502 83c8059c
	fabsd	%f26,%f26		! %f26 = 0672b502 83c8059c
!	%l4 = ffffffffffa96d5a, immed = 000007bd, %y  = 00000000
	sdivcc	%l4,0x7bd,%l7		! %l7 = 00000000002109e0, %ccr = 00
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = 00004008, %l2 = 0000000000007d37
	ldstuba	[%i1+%o6]0x80,%l2	! Annulled
p1_b28:
	membar	#Sync			! Added by membar checker (212)
!	%l3 = ffffffffffa96ed8, %l6 = ffffffffffffa774, %l7 = 00000000002109e0
	orn	%l3,%l6,%l7		! %l7 = ffffffffffa97edb

p1_label_26:
	bneg	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l4 = ffffffffffa96d5a, Mem[0000000030800018] = 853c764e7ca1bbf7
	stx	%l4,[%o1+0x018]		! Mem[0000000030800018] = ffffffffffa96d5a
p1_b29:
	bvc	p1_b30			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000014000104] = 594c2a38, %l1 = 0000000000000001
	ldsh	[%i0+0x104],%l1		! %l1 = 000000000000594c
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x01e,%g2
p1_b30:
	membar	#Sync			! Added by membar checker (213)
!	Mem[0000000015000124] = 307abe47, %l7 = ffffffffffa97edb
	ldsba	[%i2+0x127]%asi,%l7	! %l7 = 0000000000000047

p1_label_27:
!	%l6 = ffffffffffffa774, immed = 0000053a, %l2 = 0000000000007d37
	subccc	%l6,0x53a,%l2		! %l2 = ffffffffffffa23a, %ccr = 88
!	Mem[0000000015000040] = 45fb5aaa 20058553 fbf5e7cb ffa46c85
	prefetcha [%i2+0x040]%asi,0
!	Mem[0000000015000008] = ffffa774, %l0 = ffffffffffff96c3
	ldsba	[%i2+%o6]0x80,%l0	! %l0 = ffffffffffffffff
!	%l0 = ffffffff, %l1 = 0000594c, Mem[0000000016000000] = 847a2d62 a011d178
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000016000000] = ffffffff 0000594c
!	%l1 = 000000000000594c, %l4 = ffffffffffa96d5a, %y  = 00000000
	sdiv	%l1,%l4,%l0		! %l0 = 0000000000000000

p1_label_28:
	set	p1_b31,%o7
	fbule,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000000] = 8959c203 0aee1713 1d5e798b 47a99314
	prefetch [%i0+0x000],2
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x01f,%g2
p1_b31:
!	Registers modified during the branch to p1_far_2
!	%l0  = 00000002ca600000
!	%l3  = ffffffffffffff86
!	%l4  = 0000000000000000
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000000] = b05bcd4a, %l7 = 0000000000000047
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000b0
p1_b32:
	membar	#Sync			! Added by membar checker (214)
!	%l6 = ffffffffffffa774, %l0 = 00000002ca600000, %l0 = 00000002ca600000
	addc	%l6,%l0,%l0		! %l0 = 00000002ca5fa774

p1_label_29:
!	%f0  = dce5c2f3, %f26 = 0672b502 83c8059c
	fstod	%f0 ,%f26		! %f26 = c39cb85e 60000000
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 0000000000000000, Mem[0000000030000018] = 0b82de87
	sth	%l4,[%o0+0x018]		! Mem[0000000030000018] = 0000de87
p1_b33:
	membar	#Sync			! Added by membar checker (215)
!	Mem[00000000158000e4] = ac22818f, %l7 = 00000000000000b0
	swap	[%i3+0x0e4],%l7		! %l7 = 00000000ac22818f
	set	p1_b34,%o7
	fbo,a	p1_far_2_le	! Branch Taken, %fcc0 = 0

p1_label_30:
!	Mem[0000000015800100] = 4d7ad401 358325a1 3f7ebf3f c081587c
	prefetch [%i3+0x100],1
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x022,%g2
p1_b34:
!	Registers modified during the branch to p1_far_2
!	%l0  = 00000002ca600000
!	%l3  = ffffffffffffff86
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (216)
!	%l6 = ffffffffffffa774, immed = 000000e0, %y  = 00000000
	mulx	%l6,0x0e0,%l0		! %l0 = ffffffffffb28580
!	%l7 = 00000000ac22818f, %l1 = 000000000000594c, %l0 = ffffffffffb28580
	orcc	%l7,%l1,%l0		! %l0 = 00000000ac22d9cf, %ccr = 08
	set	p1_b35,%o7
	fbo,pt	%fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 0
!	%l7 = 00000000ac22818f, Mem[0000000015800140] = fc25e511
	stw	%l7,[%i3+0x140]		! Mem[0000000015800140] = ac22818f
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x023,%g2
p1_b35:
!	Registers modified during the branch to p1_near_2
!	%l1  = 00000000002a32b8
!	%l4  = 000000000000007f

p1_label_31:
	membar	#Sync			! Added by membar checker (217)
!	Mem[00000000150000a0] = 17ade110 c256c9f3 d5eb3317 78534db3
	prefetcha [%i2+0x0a0]%asi,2
!	Mem[0000000015800008] = ff000000, %l5 = 0000000000000c4d
	ldswa	[%i3+%o6]0x80,%l5	! %l5 = ffffffffff000000
	bpos	p1_b36			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000150001cc] = a26b2a3e, %l4 = 000000000000007f
	lduw	[%i2+0x1cc],%l4		! %l4 = 00000000a26b2a3e
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x024,%g2
p1_b36:
	membar	#Sync			! Added by membar checker (218)
!	Branch On Register, %l2 = ffffffffffffa23a
	brlez,pn %l2,p1_b37		! Branch Taken

p1_label_32:
!	Mem[0000000015800010] = 5c5b6598, %l1 = 00000000002a32b8
	ldstub	[%i3+0x010],%l1		! %l1 = 000000000000005c
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x025,%g2
p1_b37:
	membar	#Sync			! Added by membar checker (219)
!	%f20 = 2e6906d0 7d327503, %f0  = dce5c2f3 a2ef2ac7
	fcmped	%fcc3,%f20,%f0 		! %fcc3 = 2
!	Mem[0000000015000008] = ffffa774, %l0 = 00000000ac22d9cf
	ldsba	[%i2+%o6]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000015000008] = ffffa774, %l1 = 000000000000005c
	ldswa	[%i2+%o6]0x80,%l1	! %l1 = ffffffffffffa774
!	%f20 = 2e6906d0 7d327503, %f8  = 8bd0382e d816a931
	fcmped	%fcc2,%f20,%f8 		! %fcc2 = 2

p1_label_33:
!	%l6 = ffffffffffffa774, immed = fffff2bf, %y  = 00000000
	umul	%l6,-0xd41,%l2		! %l2 = ffff9a330495978c
!	Mem[0000000032000060] = cae8058e, %l0 = ffffffffffffffff
	ldswa	[%o4+0x060]%asi,%g2	! %g2 = ffffffffffffffff
!	%l4 = 00000000a26b2a3e, immed = fffff9f5, %l1 = ffffffffffffa774
	andcc	%l4,-0x60b,%l1		! %l1 = 00000000a26b2834, %ccr = 08
	set	p1_b38,%o7
	fbe	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	%l5 = ffffffffff000000, Mem[0000000016800000] = cdfc2b66
	stwa	%l5,[%i5+%g0]0x80	! Mem[0000000016800000] = ff000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x026,%g2
p1_b38:
!	Registers modified during the branch to p1_far_1
!	%l1  = ffffffffffffaf25
!	%l2  = ffffffffffffab05

p1_label_34:
	bne	p1_b39			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],3
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x027,%g2
p1_b39:
	membar	#Sync			! Added by membar checker (220)
!	%l2 = ffffffffffffab05, immed = 0000002b, %l3 = ffffffffffffff86
	sllx	%l2,0x02b,%l3		! %l3 = fd58280000000000
!	Mem[000000001480017c] = f6e31d0d, %l2 = ffffffffffffab05
	ldstuba	[%i1+0x17c]%asi,%l2	! %l2 = 00000000000000f6
	nop

p1_label_35:
!	Mem[000000001580006c] = 8564df54, %l5 = ffffffffff000000
	ldsha	[%i3+0x06e]%asi,%l5	! %l5 = ffffffffffffdf54
!	Mem[00000000158001a0] = b13ff60c cac27480 81ecef9d 8bc71958
	prefetcha [%i3+0x1a0]%asi,22
	set	p1_b40,%o7
	fbo,pt	%fcc0,p1_near_1_le	! Branch Taken, %fcc0 = 0
!	%l0 = ffffffff, %l1 = ffffaf25, Mem[0000000030800010] = d1cc995a 42936478
	std	%l0,[%o1+0x010]	! Mem[0000000030800010] = ffffffff ffffaf25
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x028,%g2
p1_b40:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000304
!	%l3  = ffffffffffffaff7
!	%l7  = 000000007fffffff
	membar	#Sync			! Added by membar checker (221)
!	Mem[0000000015000000] = ff5bcd4a, %l7 = 000000007fffffff
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 000000000000ff5b

p1_label_36:
!	Mem[0000000014800000] = 7b838307, %l5 = ffffffffffffdf54
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 000000000000007b
!	call to call_2, CWP = 0
	call	p1_call_2_le
!	%l0 = 0000000000000304, Mem[00000000150001f8] = 0162c4aa
	stw	%l0,[%i2+0x1f8]		! Mem[00000000150001f8] = 00000304
!	Registers modified during the branch to p1_call_2
!	%l0  = 00000000a26b2ac8
!	%l5  = 000000000003ba36
!	%l6  = fffffffffffffe3e
!	Mem[0000000014800008] = 00004008, %l5 = 000000000003ba36
	ldsha	[%i1+%o6]0x80,%l5	! %l5 = 0000000000000000
!	%l2 = 000000f6, %l3 = ffffaff7, Mem[0000000031000058] = 3c5b31a7 d2268f62
	stda	%l2,[%o2+0x058]%asi	! Mem[0000000031000058] = 000000f6 ffffaff7

p1_label_37:
!	Mem[00000000148001a4] = ac8e0453, %l2 = 00000000000000f6
	lduwa	[%i1+0x1a4]%asi,%l2	! %l2 = 00000000ac8e0453
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800040] = 21002f89 f22323ec 82f85f6b 3e3672e4
	prefetch [%i3+0x040],16
p1_b41:
	membar	#Sync			! Added by membar checker (222)
	fble,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l5 = 0000000000000000, Mem[0000000014000000] = 8959c203
	stw	%l5,[%i0+0x000]		! Annulled
p1_b42:

p1_label_38:
	membar	#Sync			! Added by membar checker (223)
!	%l4 = 00000000a26b2a3e, %l5 = 0000000000000000, %l1 = ffffffffffffaf25
	sllx	%l4,%l5,%l1		! %l1 = 00000000a26b2a3e
	bcc,a	p1_b43			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[00000000140000e0] = 22e6d698, %l4 = 00000000a26b2a3e
	lduh	[%i0+0x0e2],%l4		! %l4 = 000000000000d698
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x02b,%g2
p1_b43:
	membar	#Sync			! Added by membar checker (224)
!	%l5 = 0000000000000000, immed = 00000009, %l5 = 0000000000000000
	sra	%l5,0x009,%l5		! %l5 = 0000000000000000
	bcc	p1_b44			! Branch Taken, %ccr = 88, CWP = 0

p1_label_39:
!	Mem[0000000017000080] = c8c0e925 fa53ead5, %l2 = ac8e0453, %l3 = ffffaff7
	ldd	[%i6+0x080],%l2		! %l2 = 00000000c8c0e925 00000000fa53ead5
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x02c,%g2
p1_b44:
	membar	#Sync			! Added by membar checker (225)
!	%l0 = a26b2ac8, %l1 = a26b2a3e, Mem[0000000031800018] = 50e9b36a 7d3752c0
	stda	%l0,[%o3+0x018]%asi	! Mem[0000000031800018] = a26b2ac8 a26b2a3e
!	%f30 = 4a59ed86 e7c82ede, %f30 = 4a59ed86 e7c82ede, %f24 = 8672b502 27968572
	fdivd	%f30,%f30,%f24		! %f24 = 3ff00000 00000000
	fbu,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[00000000148000c0] = 4c8d71e7 23b1c0fc 05e5c87c b5a9dd62
	prefetch [%i1+0x0c0],16	! Annulled
p1_b45:

p1_label_40:
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = 00004008dd9d1ad5, %l3 = 00000000fa53ead5
	ldxa	[%i1+%o6]0x80,%l3	! %l3 = 00004008dd9d1ad5
p1_b46:
	set	p1_b47,%o7
	fbuge	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800000] = 6b50d97c, %l3 = 00004008dd9d1ad5
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = 000000000000006b
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x02f,%g2
p1_b47:
	membar	#Sync			! Added by membar checker (226)
!	%f26 = c39cb85e 60000000, %f10 = 1a1820e2
	fdtos	%f26,%f10		! %f10 = dce5c2f3

p1_label_41:
	set	p1_b48,%o7
	fble,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = abf2ed78 dbe0a62d, %l4 = 0000d698, %l5 = 00000000
	ldd	[%o4+0x020],%g2		! %l4 = 000000000000d698 0000000000000000
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x030,%g2
p1_b48:
	set	p1_b49,%o7
	fbe	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l2 = 00000000c8c0e925, Mem[00000000150000ea] = 526d207c
	sth	%l2,[%i2+0x0ea]		! Mem[00000000150000e8] = 526de925
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x031,%g2
p1_b49:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0005135951f00000
!	%l3  = ffffffffffffff86
!	%l4  = 0000000005135951
	membar	#Sync			! Added by membar checker (227)
!	Mem[0000000031800058] = cd0dfe01, %l0 = 0005135951f00000
	ldsh	[%o3+0x058],%l0		! %l0 = ffffffffffffcd0d

p1_label_42:
!	%f0  = dce5c2f3, %f3  = 1687b362
	fmovs	%f0 ,%f3 		! %f3  = dce5c2f3
!	%l2 = 00000000c8c0e925, immed = 0000001e, %l5 = 0000000000000000
	sllx	%l2,0x01e,%l5		! %l5 = 32303a4940000000
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000015000038] = 340b2a44, %l7 = 000000000000ff5b
	ldub	[%i2+0x039],%l7		! %l7 = 000000000000000b
p1_b50:
	membar	#Sync			! Added by membar checker (228)
!	%f6  = ca59ed86, %f11 = 20000000, %f22 = 356d8d21
	fmuls	%f6 ,%f11,%f22		! %f22 = aad9ed86

p1_label_43:
!	Branch On Register, %l3 = ffffffffffffff86
	brnz,a,pn %l3,p1_b51		! Branch Taken
!	Mem[0000000030000012] = 95bbdd02, %l3 = ffffffffffffff86
	ldstub	[%o0+0x012],%l3		! %l3 = 00000000000000dd
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x033,%g2
p1_b51:
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000014000008] = 1d5e798b, %l5 = 32303a4940000000
	ldswa	[%i0+%o6]0x80,%l5	! Annulled
p1_b52:
	membar	#Sync			! Added by membar checker (229)
!	Mem[0000000014800098] = 721bbede, %l1 = 00000000a26b2a3e
	lduba	[%i1+0x09b]%asi,%l1	! %l1 = 00000000000000de

p1_label_44:
!	%l2 = 00000000c8c0e925, %l7 = 000000000000000b, %l5 = 32303a4940000000
	addcc	%l2,%l7,%l5		! %l5 = 00000000c8c0e930, %ccr = 08
!	%l3 = 00000000000000dd, immed = fffff205, %y  = 00000000
	umulcc	%l3,-0xdfb,%l4		! %l4 = 000000dcfff3ee51, %ccr = 08
!	Mem[0000000030000010] = 95bbff02, %l6 = fffffffffffffe3e
	lduw	[%o0+0x010],%l6		! %l6 = 0000000095bbff02
!	Jump to jmpl_1, CWP = 0
	set	p1_jmpl_1_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000014000000] = 8959c203, %l3 = 00000000000000dd
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000089
!	Registers modified during the branch to p1_jmpl_1
!	%l0  = ffffffffffffffaf
!	%l2  = 000000000000002b
!	%l4  = fffffffffffffdf7
!	%l6  = 0000000000000080
!	%l7  = 00000000abdda42c

p1_label_45:
!	%l0 = ffffffffffffffaf, %l1 = 00000000000000de, %l5 = 00000000c8c0e930
	xor	%l0,%l1,%l5		! %l5 = ffffffffffffff71
!	%l0 = ffffffffffffffaf, Mem[0000000030000014] = abdda42c
	stw	%l0,[%o0+0x014]		! Mem[0000000030000014] = ffffffaf
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],4
p1_b53:
	membar	#Sync			! Added by membar checker (230)
!	%f24 = 3ff00000 00000000, %f0  = dce5c2f3
	fdtos	%f24,%f0 		! %f0  = 3f800000

p1_label_46:
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],2
!	%l4 = fffffffffffffdf7, immed = fffff19e, %y  = 000000dc
	umulcc	%l4,-0xe62,%l6		! %l6 = ffffef95001d4572, %ccr = 80
!	%l4 = fffffffffffffdf7, Mem[0000000031000050] = 1a609c872f6f84e1
	stxa	%l4,[%o2+0x050]%asi	! Mem[0000000031000050] = fffffffffffffdf7
!	%l4 = fffffffffffffdf7, %l7 = 00000000abdda42c, %l1 = 00000000000000de
	xor	%l4,%l7,%l1		! %l1 = ffffffff542259db
!	%f4  = 00000000, %f31 = e7c82ede
	fnegs	%f4 ,%f31		! %f31 = 80000000

p1_label_47:
	set	p1_b54,%o7
	fbug,pn	%fcc3,p1_near_1_he	! Branch Taken, %fcc3 = 2
!	Mem[000000001400007c] = cd20166d, %l3 = 0000000000000089
	lduh	[%i0+0x07c],%l3		! %l3 = 000000000000cd20
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x036,%g2
p1_b54:
!	Registers modified during the branch to p1_near_1
!	%l1  = 0000000000000056
!	%l4  = ffffffffffffffff
!	%l6  = 000000000000cd4b
	set	p1_b55,%o7
	fba,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000000] = 8959c203, %l7 = 00000000abdda42c
	lduba	[%i0+%g0]0x80,%l7	! Annulled
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x037,%g2
p1_b55:
!	Registers modified during the branch to p1_far_0
!	%l6  = ffffffffffffff94
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (231)
!	Mem[0000000014000060] = 829dbdab b54e6e3b, %l6 = ffffff94, %l7 = 00000000
	ldd	[%i0+0x060],%l6		! %l6 = 00000000829dbdab 00000000b54e6e3b

p1_label_48:
!	%l2 = 000000000000002b, Mem[0000000015000000] = ff5bcd4a
	stba	%l2,[%i2+%g0]0x80	! Mem[0000000015000000] = 2b5bcd4a
!	%l5 = ffffffffffffff71, immed = 00000011, %l7 = 00000000b54e6e3b
	srl	%l5,0x011,%l7		! %l7 = 0000000000007fff
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = 0000000000007fff, Mem[0000000015000000] = 2b5bcd4a
	stba	%l7,[%i2+%g0]0x80	! Annulled
p1_b56:
	membar	#Sync			! Added by membar checker (232)
!	Mem[00000000148001a8] = d1e98eeb, %l3 = 000000000000cd20
	ldub	[%i1+0x1ab],%l3		! %l3 = 00000000000000eb

p1_label_49:
!	%l5 = ffffffffffffff71, immed = fffff08d, %l1 = 0000000000000056
	xnorcc	%l5,-0xf73,%l1		! %l1 = fffffffffffff003, %ccr = 88
!	%l5 = ffffffffffffff71, %l1 = fffffffffffff003, %l1 = fffffffffffff003
	sub	%l5,%l1,%l1		! %l1 = 0000000000000f6e
!	%l4 = ffffffffffffffff, %l5 = ffffffffffffff71, %l6 = 00000000829dbdab
	andcc	%l4,%l5,%l6		! %l6 = ffffffffffffff71, %ccr = 88
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001580006c] = 8564df54, %l4 = ffffffffffffffff
	swap	[%i3+0x06c],%l4		! Annulled
p1_b57:

p1_label_50:
	membar	#Sync			! Added by membar checker (233)
!	%l6 = ffffffffffffff71, %l6 = ffffffffffffff71, %l0 = ffffffffffffffaf
	xor	%l6,%l6,%l0		! %l0 = 0000000000000000
!	%l6 = ffffffffffffff71, Mem[0000000015000008] = ffffa7740000cd92
	stxa	%l6,[%i2+%o6]0x80	! Mem[0000000015000008] = ffffffffffffff71
	bl,a	p1_b58			! Branch Taken, %ccr = 88, CWP = 0
!	%l4 = ffffffffffffffff, Mem[0000000014800008] = 00004008
	stha	%l4,[%i1+%o6]0x80	! Mem[0000000014800008] = ffff4008
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x03a,%g2
p1_b58:
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_51:
!	Mem[0000000014800134] = 0000007f, %l5 = ffffffffffffff71
	ldsw	[%i1+0x134],%l5		! %l5 = 000000000000007f
p1_b59:
	membar	#Sync			! Added by membar checker (234)
!	%l0 = 0000000000000000, %l2 = 000000000000002b, %l4 = ffffffffffffffff
	taddcc	%l0,%l2,%l4		! %l4 = 000000000000002b, %ccr = 02
	set	p1_b60,%o7
	fbe,pn	%fcc0,p1_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000158001cc] = 41dcc991, %l1 = 0000000000000f6e
	lduw	[%i3+0x1cc],%l1		! %l1 = 0000000041dcc991
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x03c,%g2
p1_b60:
!	Registers modified during the branch to p1_near_3
!	%l3  = 000000007fffffff
!	%l4  = ffffffff1ca846a8
!	%l6  = 00000000ff838307
!	%l7  = 000000001c541d54
	set	p1_b61,%o7
	fba,a	p1_far_3_he	! Branch Taken, %fcc0 = 0

p1_label_52:
!	Mem[00000000150000e0] = b338009e 9c568279 526de925 636abe85
	prefetch [%i2+0x0e0],16	! Annulled
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x03d,%g2
p1_b61:
!	Registers modified during the branch to p1_far_3
!	%l0  = 00000000ffffffff
!	%l1  = 00000000fffffdf7
!	%l2  = 00000000ffffffff
!	%l4  = ffffffff1cfc5ffc
	membar	#Sync			! Added by membar checker (235)
!	%f25 = 00000000, %f21 = 7d327503, %f8  = 8bd0382e
	fsubs	%f25,%f21,%f8 		! %f8  = fd327503
!	%f24 = 3ff00000 00000000, %f24 = 3ff00000 00000000
	fcmpd	%fcc1,%f24,%f24		! %fcc1 = 0
!	%l1 = 00000000fffffdf7, immed = 0000017d, %l2 = 00000000ffffffff
	and	%l1,0x17d,%l2		! %l2 = 0000000000000175
	bleu,a	p1_not_taken_0		! Branch Not Taken, %ccr = 0a

p1_label_53:
!	%l2 = 00000175, %l3 = 7fffffff, Mem[0000000030800018] = 00000000 ac222834
	std	%l2,[%o1+0x018]	! Annulled
p1_b62:
	membar	#Sync			! Added by membar checker (236)
!	%l1 = 00000000fffffdf7, %l0 = 00000000ffffffff, %l4 = ffffffff1cfc5ffc
	add	%l1,%l0,%l4		! %l4 = 00000001fffffdf6
!	call to call_2, CWP = 0
	call	p1_call_2_he
!	Mem[0000000015800008] = ff000000, %l7 = 000000001c541d54
	ldstuba	[%i3+%o6]0x80,%l7	! %l7 = 00000000000000ff
!	Registers modified during the branch to p1_call_2
!	%l2  = 0000000100000209
!	%l4  = 001fc00000000000
!	%l6  = 0000000000000021
!	%f30 = 4a59ed86 80000000, %f6  = ca59ed86 e7c82ede, %f16 = 87ff6514 3b4b47a0
	fsubd	%f30,%f6 ,%f16		! %f16 = 4a69ed86 b3e4176f

p1_label_54:
	fbl,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l6 = 00000021, %l7 = 000000ff, Mem[0000000014000008] = 1d5e798b 47a99314
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000014000008] = 00000021 000000ff
p1_b63:
	membar	#Sync			! Added by membar checker (237)
!	%l3 = 000000007fffffff, %l7 = 00000000000000ff, %l2 = 0000000100000209
	sub	%l3,%l7,%l2		! %l2 = 000000007fffff00
!	%l1 = 00000000fffffdf7, immed = 00000e07, %l5 = 000000000000007f
	andcc	%l1,0xe07,%l5		! %l5 = 0000000000000c07, %ccr = 00
	bpos,a	p1_b64			! Branch Taken, %ccr = 00, CWP = 0

p1_label_55:
!	%l5 = 0000000000000c07, Mem[000000001580015d] = e4f1100f
	stb	%l5,[%i3+0x15d]		! Mem[000000001580015c] = e407100f
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x040,%g2
p1_b64:
	membar	#Sync			! Added by membar checker (238)
!	%f28 = 789475bc 8b79f0ce, %f20 = 2e6906d0 7d327503
	fcmpd	%fcc1,%f28,%f20		! %fcc1 = 2
!	%f8  = fd327503, %f17 = b3e4176f
	fcmpes	%fcc3,%f8 ,%f17		! %fcc3 = 1
!	Mem[0000000031000058] = 000000f6 ffffaff7, %l4 = 00000000, %l5 = 00000c07
	ldd	[%o2+0x058],%l4		! %l4 = 00000000000000f6 00000000ffffaff7
	bne	p1_b65			! Branch Taken, %ccr = 00, CWP = 0

p1_label_56:
!	%l4 = 00000000000000f6, Mem[0000000014800000] = ff838307
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000014800000] = 000000f6
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x041,%g2
p1_b65:
	membar	#Sync			! Added by membar checker (239)
!	%l5 = 00000000ffffaff7, %l7 = 00000000000000ff, %l3 = 000000007fffffff
	sra	%l5,%l7,%l3		! %l3 = ffffffffffffffff
!	%f20 = 2e6906d0, %f23 = 2cc72233
	fmovs	%f20,%f23		! %f23 = 2e6906d0
!	%l6 = 0000000000000021, %l4 = 00000000000000f6, %l2 = 000000007fffff00
	andcc	%l6,%l4,%l2		! %l2 = 0000000000000020, %ccr = 00
!	%f16 = 4a69ed86 b3e4176f, %f0  = 3f800000 a2ef2ac7
	fcmpd	%fcc2,%f16,%f0 		! %fcc2 = 2

p1_label_57:
	nop				! Delay added due to fcmp
	set	p1_b66,%o7
	fble,pt	%fcc3,p1_near_1_he	! Branch Taken, %fcc3 = 1
!	%l6 = 0000000000000021, Mem[00000000140000ea] = c3cd6633
	sth	%l6,[%i0+0x0ea]		! Mem[00000000140000e8] = c3cd0021
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x042,%g2
p1_b66:
!	Registers modified during the branch to p1_near_1
!	%l1  = 0000000000000040
!	%l4  = fffffffffffffbfe
!	%l6  = 000000000000001f
	membar	#Sync			! Added by membar checker (240)
!	Mem[0000000030000056] = 83493a3d, %l2 = 0000000000000020
	ldstub	[%o0+0x056],%l2		! %l2 = 000000000000003a
!	Mem[0000000015800008] = ff00000000000007, %l3 = ffffffffffffffff
	ldxa	[%i3+%o6]0x80,%l3	! %l3 = ff00000000000007
!	%l6 = 0000001f, %l7 = 000000ff, Mem[0000000031000010] = 0560a389 3d73205d
	stda	%l6,[%o2+0x010]%asi	! Mem[0000000031000010] = 0000001f 000000ff

p1_label_58:
!	%l6 = 000000000000001f
	sethi	%hi(0x482fb800),%l6	! %l6 = 00000000482fb800
!	%l5 = 00000000ffffaff7, Mem[0000000015000190] = 56f218e5
	stha	%l5,[%i2+0x190]%asi	! Mem[0000000015000190] = aff718e5
	bvc	p1_b67			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000014000000] = 8959c203, %l7 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000089
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x043,%g2
p1_b67:
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_59:
!	Mem[0000000014800000] = 000000f6, %l1 = 0000000000000040
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
p1_b68:
	membar	#Sync			! Added by membar checker (241)
!	%l7 = 0000000000000089, immed = fffffc59, %l6 = 00000000482fb800
	addcc	%l7,-0x3a7,%l6		! %l6 = fffffffffffffce2, %ccr = 88
!	%l4 = fffffffffffffbfe, %l4 = fffffffffffffbfe, %y  = ffffef95
	smulcc	%l4,%l4,%l1		! %l1 = 0000000000101004, %ccr = 00
!	%l6 = fffffffffffffce2, %l3 = ff00000000000007, %l1 = 0000000000101004
	andn	%l6,%l3,%l1		! %l1 = 00fffffffffffce0
!	%f26 = c39cb85e, %f4  = 00000000 6fb1460a
	fstod	%f26,%f4 		! %f4  = c073970b c0000000

p1_label_60:
	set	p1_b69,%o7
	fbuge	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	%l6 = fffffffffffffce2, Mem[0000000014000008] = 00000021
	stwa	%l6,[%i0+%o6]0x80	! Mem[0000000014000008] = fffffce2
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x045,%g2
p1_b69:
!	Registers modified during the branch to p1_far_3
!	%l0  = 00000000ffffffff
!	%l1  = 00000000fffffdf7
!	%l2  = 0000000000000000
!	%l4  = fffffffffffffbff
	membar	#Sync			! Added by membar checker (242)
!	Mem[0000000014800080] = 10b4d32f 566c70e1 c9e7c68e acefaa84
	prefetch [%i1+0x080],3
!	%f24 = 3ff00000 00000000, %f6  = ca59ed86
	fdtoi	%f24,%f6 		! %f6  = 00000001
!	%l4 = fffffffffffffbff, immed = 00000b11, %y  = 00000000
	mulx	%l4,0xb11,%l1		! %l1 = ffffffffffd3b0ef

p1_label_61:
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000014800008] = ffff4008, %l4 = fffffffffffffbff
	ldswa	[%i1+%o6]0x80,%l4	! %l4 = ffffffffffff4008
p1_b70:
	membar	#Sync			! Added by membar checker (243)
!	%f29 = 8b79f0ce, %f29 = 8b79f0ce, %f0  = 3f800000 a2ef2ac7
	fsmuld	%f29,%f29,%f0 		! %f0  = 32ee80ca 67dcb880
!	%l4 = ffffffffffff4008, Mem[0000000014800000] = 000000f6
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000014800000] = ffff4008
!	%l1 = ffffffffffd3b0ef, immed = fffff50e, %y  = 00000000
	mulx	%l1,-0xaf2,%l1		! %l1 = 00000001e4f96812

p1_label_62:
!	%f31 = 80000000, %f7  = e7c82ede, %f4  = c073970b
	fdivs	%f31,%f7 ,%f4 		! %f4  = 00000000
!	%l6 = fffffffffffffce2, immed = fffff082, %y  = 00000000
	umulcc	%l6,-0xf7e,%l4		! %l4 = ffffed6400304ac4, %ccr = 80
!	%l3 = ff00000000000007, immed = 00000200, %l0 = 00000000ffffffff
	andcc	%l3,0x200,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%f11 = 20000000, %f9  = d816a931
	fnegs	%f11,%f9 		! %f9  = a0000000
!	Mem[00000000150000e0] = b338009e 9c568279 526de925 636abe85
	prefetch [%i2+0x0e0],2

p1_label_63:
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031800054] = 020c630d, %l0 = 0000000000000000
	ldstub	[%o3+0x054],%l0		! Annulled
p1_b71:
	membar	#Sync			! Added by membar checker (244)
!	%l3 = ff00000000000007
	setx	0x9e5ae1719e5ae171,%g7,%l3 ! %l3 = 9e5ae1719e5ae171
!	Mem[0000000031000058] = 000000f6, %l6 = fffffffffffffce2
	ldsw	[%o2+0x058],%l6		! %l6 = 00000000000000f6
!	Mem[0000000014000030] = f210ac63, %l5 = 00000000ffffaff7
	ldsw	[%i0+0x030],%l5		! %l5 = fffffffff210ac63

p1_label_64:
	bl	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000158001f8] = a0cb353b 8bd1b6db, %l4 = 00304ac4, %l5 = f210ac63
	ldd	[%i3+0x1f8],%l4		! %l4 = 00000000a0cb353b 000000008bd1b6db
p1_b72:
	membar	#Sync			! Added by membar checker (245)
!	%f30 = 4a59ed86, %f28 = 789475bc
	fmovs	%f30,%f28		! %f28 = 4a59ed86
!	Mem[0000000014000068] = 6f1bc0a6, %l7 = 0000000000000089
	ldub	[%i0+0x06b],%l7		! %l7 = 00000000000000a6
!	%l6 = 00000000000000f6, immed = 0000082c, %l7 = 00000000000000a6
	orcc	%l6,0x82c,%l7		! %l7 = 00000000000008fe, %ccr = 00

p1_label_65:
!	%f25 = 00000000, %f29 = 8b79f0ce, %f25 = 00000000
	fadds	%f25,%f29,%f25		! %f25 = 8b79f0ce
!	Mem[000000001480011c] = 278f0b20, %l6 = 00000000000000f6
	ldsba	[%i1+0x11d]%asi,%l6	! %l6 = ffffffffffffff8f
!	Mem[0000000015000100] = 58955c90 b3612c25 02054f65 8273d416
	prefetcha [%i2+0x100]%asi,21
!	Mem[00000000150001f0] = ff22c964, %l0 = 0000000000000000
	lduw	[%i2+0x1f0],%l0		! %l0 = 00000000ff22c964
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_66:
!	Mem[00000000158001c0] = 7b50127d 30feb35d deb2e73a 41dcc991
	prefetch [%i3+0x1c0],22
p1_b73:
	membar	#Sync			! Added by membar checker (246)
!	%l5 = 000000008bd1b6db, Mem[00000000158001ea] = 344ea732
	sth	%l5,[%i3+0x1ea]		! Mem[00000000158001e8] = 344eb6db
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000015800000] = 6b50d97c, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 000000000000006b
!	Registers modified during the branch to p1_jmpl_0
!	%l5  = 000000007fffffff
!	%l7 = 00000000000008fe, Mem[00000000160001ac] = 61c71953
	sth	%l7,[%i4+0x1ac]		! Mem[00000000160001ac] = 08fe1953

p1_label_67:
!	%l2 = 000000000000006b, immed = ffffff41, %y  = ffffed64
	smul	%l2,-0x0bf,%l2		! %l2 = ffffffffffffb02b
!	%f14 = ff149318, %f24 = 3ff00000 8b79f0ce
	fitod	%f14,%f24		! %f24 = c16d6d9d 00000000
!	%l0 = 00000000ff22c964, immed = 0000002d, %l6 = ffffffffffffff8f
	srlx	%l0,0x02d,%l6		! %l6 = 0000000000000000
	set	p1_b74,%o7
	fbue,a	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000000] = 2b5bcd4a, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000002b5b
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x04a,%g2
p1_b74:
!	Registers modified during the branch to p1_far_2
!	%l1  = 000000000000090c

p1_label_68:
	membar	#Sync			! Added by membar checker (247)
!	%l2 = ffffffffffffb02b, %l0 = 00000000ff22c964, %y  = ffffffff
	smulcc	%l2,%l0,%l4		! %l4 = 00000044fbe893cc, %ccr = 08
!	%l1 = 000000000000090c, immed = 00000623, %y  = 00000044
	sdivx	%l1,0x623,%l3		! %l3 = 0000000000000001
	bvc	p1_b75			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000014800000] = ffff4008, %l7 = 00000000000008fe
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x04b,%g2
p1_b75:
	membar	#Sync			! Added by membar checker (248)
!	Mem[0000000015800008] = ff000000, %l1 = 000000000000090c
	ldstuba	[%i3+%o6]0x80,%l1	! %l1 = 00000000000000ff

p1_label_69:
!	%l1 = 00000000000000ff, %l7 = 00000000000000ff, %y  = 00000044
	mulx	%l1,%l7,%l4		! %l4 = 000000000000fe01
	set	p1_b76,%o7
	fbuge,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000148001a0] = 8b555ebe ac8e0453 d1e98eeb 72f5867f
	prefetch [%i1+0x1a0],20
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x04c,%g2
p1_b76:
!	Registers modified during the branch to p1_far_0
!	%l6  = ffffffffffffd4a5
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (249)
!	%f30 = 4a59ed86 80000000, %f24 = c16d6d9d 00000000
	fcmpd	%fcc2,%f30,%f24		! %fcc2 = 2
!	%l1 = 00000000000000ff, Mem[0000000030800012] = ffffffff
	sth	%l1,[%o1+0x012]		! Mem[0000000030800010] = ffff00ff

p1_label_70:
!	Mem[00000000140001a0] = d51f45c3 4c068eba 450fb721 598e1e79
	prefetcha [%i0+0x1a0]%asi,3
!	Mem[000000001580012c] = 07581230, %l7 = 0000000000000000
	lduha	[%i3+0x12e]%asi,%l7	! %l7 = 0000000000001230
!	Mem[0000000031800058] = cd0dfe01152869f1, %l1 = 00000000000000ff
	ldx	[%o3+0x058],%l1		! %l1 = cd0dfe01152869f1
!	%l4 = 000000000000fe01, %l3 = 0000000000000001, %l4 = 000000000000fe01
	tsubcc	%l4,%l3,%l4		! %l4 = 000000000000fe00, %ccr = 02
!	Mem[0000000014800040] = 6e57a011 00000007 414f1a4a ec77ba8e
	prefetcha [%i1+0x040]%asi,21

p1_label_71:
!	Mem[00000000150000b4] = f31ee922, %l4 = 000000000000fe00
	lduwa	[%i2+0x0b4]%asi,%l4	! %l4 = 00000000f31ee922
	ble,a	p1_b77			! Branch Taken, %ccr = 02, CWP = 0
!	%l3 = 0000000000000001, Mem[0000000015000008] = ffffffff
	stwa	%l3,[%i2+%o6]0x80	! Mem[0000000015000008] = 00000001
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p1_branch_failed
	mov	0x04d,%g2
p1_b77:
	membar	#Sync			! Added by membar checker (250)
!	%l7 = 0000000000001230, %l5 = 000000007fffffff, %l4 = 00000000f31ee922
	and	%l7,%l5,%l4		! %l4 = 0000000000001230
!	Mem[00000000140001f0] = f016bb84531fca0d, %l5 = 000000007fffffff
	ldxa	[%i0+0x1f0]%asi,%l5	! %l5 = f016bb84531fca0d

p1_label_72:
!	Mem[0000000015000008] = 00000001, %l1 = cd0dfe01152869f1
	ldswa	[%i2+%o6]0x80,%l1	! %l1 = 0000000000000001
!	%l3 = 0000000000000001, %l7 = 0000000000001230, %l3 = 0000000000000001
	addccc	%l3,%l7,%l3		! %l3 = 0000000000001231, %ccr = 00
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003200005c] = 1f51cae8, %l0 = 00000000ff22c964
	ldsh	[%o4+0x05e],%g2		! Annulled
p1_b78:
	membar	#Sync			! Added by membar checker (251)
!	%l6 = ffffffffffffd4a5, %l7 = 0000000000001230, %y  = 00000044
	udiv	%l6,%l7,%l0		! %l0 = 0000000003cb3769

p1_label_73:
!	Branch On Register, %l5 = f016bb84531fca0d
	brz,a,pn %l5,p1_not_taken_0	! Branch Not Taken
!	Mem[00000000148000a0] = 595830f1 3c6ecb08 9b25b80a f51b9c89
	prefetch [%i1+0x0a0],22	! Annulled
p1_b79:
	membar	#Sync			! Added by membar checker (252)
!	%l7 = 0000000000001230, immed = 000000b1, %l3 = 0000000000001231
	andn	%l7,0x0b1,%l3		! %l3 = 0000000000001200
!	%l0 = 0000000003cb3769, Mem[000000003180005e] = 152869f1
	stha	%l0,[%o3+0x05e]%asi	! Mem[000000003180005c] = 15283769
!	%l5 = f016bb84531fca0d, immed = 0000002f, %l4 = 0000000000001230
	srax	%l5,0x02f,%l4		! %l4 = ffffffffffffe02d

p1_label_74:
!	%l3 = 0000000000001200, %l0 = 0000000003cb3769, %l0 = 0000000003cb3769
	addc	%l3,%l0,%l0		! %l0 = 0000000003cb4969
!	%f25 = 00000000, %f23 = 2e6906d0, %f17 = b3e4176f
	fmuls	%f25,%f23,%f17		! %f17 = 00000000
!	%l0 = 0000000003cb4969, immed = 00000014, %l1 = 0000000000000001
	sllx	%l0,0x014,%l1		! %l1 = 00003cb496900000
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = 0000000000001200, Mem[0000000015800008] = ff00000000000007
	stxa	%l3,[%i3+%o6]0x80	! Annulled
p1_b80:

p1_label_75:
	membar	#Sync			! Added by membar checker (253)
	set	p1_b81,%o7
	fbge,pn	%fcc2,p1_near_2_le	! Branch Taken, %fcc2 = 2
!	Mem[000000001580010c] = c081587c, %l6 = ffffffffffffd4a5
	swap	[%i3+0x10c],%l6		! %l6 = 00000000c081587c
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x051,%g2
p1_b81:
!	Registers modified during the branch to p1_near_2
!	%l3  = 00000000bbd94c79
!	%l4  = 00000000c081587c
!	%l5  = 00003cb4968fffdb
	bvc,a	p1_b82			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000030] = 9197a540, %l0 = 0000000003cb4969
	ldsw	[%o4+0x030],%g2		! %g2 = 0000000003cb4969
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x052,%g2
p1_b82:
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_76:
!	Mem[0000000014800008] = ffff4008, %l5 = 00003cb4968fffdb
	ldstuba	[%i1+%o6]0x80,%l5	! Annulled
p1_b83:
	membar	#Sync			! Added by membar checker (254)
!	%l1 = 00003cb496900000, %l5 = 00003cb4968fffdb, %l7 = 0000000000001230
	addc	%l1,%l5,%l7		! %l7 = 000079692d1fffdb
	bvc	p1_b84			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001580012e] = 07581230, %l2 = ffffffffffffb02b
	ldstub	[%i3+0x12e],%l2		! %l2 = 0000000000000012
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x054,%g2
p1_b84:
	membar	#Sync			! Added by membar checker (255)
!	%f12 = eabc6fb5, %f2  = 83c8059c dce5c2f3
	fitod	%f12,%f2 		! %f2  = c1b54390 4b000000

p1_label_77:
!	%f8  = fd327503 a0000000, %f8  = fd327503 a0000000
	fmovd	%f8 ,%f8 		! %f8  = fd327503 a0000000
!	%l7 = 000079692d1fffdb, %l4 = 00000000c081587c, %l7 = 000079692d1fffdb
	orncc	%l7,%l4,%l7		! %l7 = ffffffff3f7fffdb, %ccr = 80
!	Mem[00000000150000b0] = 975026c8, %l7 = ffffffff3f7fffdb
	ldub	[%i2+0x0b3],%l7		! %l7 = 00000000000000c8
!	%l4 = 00000000c081587c, %l6 = 00000000c081587c, %y  = 00000044
	umulcc	%l4,%l6,%l2		! %l2 = 90c246144b8d7c10, %ccr = 80
!	Mem[0000000014800000] = ffff4008 1c541d54, %l6 = c081587c, %l7 = 000000c8
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffff4008 000000001c541d54

p1_label_78:
	set	p1_b85,%o7
	fbule	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	%l1 = 00003cb496900000, Mem[0000000014000000] = ff59c203
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000014000000] = 96900000
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x055,%g2
p1_b85:
!	Registers modified during the branch to p1_far_1
!	%l1  = 00000000ffff4859
!	%l2  = 00000000ffff4851
	membar	#Sync			! Added by membar checker (256)
	fbe,a,pt %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000014000080] = eed51c69 2dc54464 4da88bbd da72d344
	prefetch [%i0+0x080],0	! Annulled
p1_b86:
	membar	#Sync			! Added by membar checker (257)
!	%f4  = 00000000, %f20 = 2e6906d0, %f10 = dce5c2f3 20000000
	fsmuld	%f4 ,%f20,%f10		! %f10 = 00000000 00000000

p1_label_79:
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 00000000c081587c, Mem[0000000014000008] = fffffce2
	stha	%l4,[%i0+%o6]0x80	! Annulled
p1_b87:
	membar	#Sync			! Added by membar checker (258)
!	%l1 = 00000000ffff4859, immed = fffff349, %l0 = 0000000003cb4969
	andcc	%l1,-0xcb7,%l0		! %l0 = 00000000ffff4049, %ccr = 08
	fblg,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003200000c] = 50058758, %l1 = 00000000ffff4859
	ldsb	[%o4+0x00e],%g2		! %g2 = 0000000000000050
p1_b88:

p1_label_80:
	membar	#Sync			! Added by membar checker (259)
!	%l0 = 00000000ffff4049, Mem[0000000030000058] = 00001200
	sth	%l0,[%o0+0x058]		! Mem[0000000030000058] = 40491200
!	Mem[00000000140000c0] = dd9a3143 fe5210f7 86c41981 4f19b9c1
	prefetch [%i0+0x0c0],16
!	Mem[0000000031800058] = cd0dfe01, %l1 = 00000000ffff4859
	lduwa	[%o3+0x058]%asi,%l1	! %l1 = 00000000cd0dfe01
!	%f11 = 00000000, %f31 = 80000000
	fabss	%f11,%f31		! %f31 = 00000000
	set	p1_b89,%o7
	fbue,a	p1_far_2_le	! Branch Taken, %fcc0 = 0

p1_label_81:
!	Mem[000000003180001c] = c8c0e925, %l5 = 00003cb4968fffdb
	lduw	[%o3+0x01c],%l5		! %l5 = 00000000c8c0e925
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x059,%g2
p1_b89:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0006686ff0080000
!	%l3  = ffffffffffffff86
!	%l4  = 0000000000006686
	membar	#Sync			! Added by membar checker (260)
	fbg,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000014800008] = ffff4008 dd9d1ad5, %l6 = ffff4008, %l7 = 1c541d54
	ldda	[%i1+%o6]0x80,%l6	! %l6 = 00000000ffff4008 00000000dd9d1ad5
p1_b90:
	membar	#Sync			! Added by membar checker (261)
!	%l3 = ffffffffffffff86, %l6 = 00000000ffff4008, %l0 = 0006686ff0080000
	tsubcc	%l3,%l6,%l0		! %l0 = ffffffff0000bf7e, %ccr = 82
	fbe,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2

p1_label_82:
!	Mem[0000000015000008] = 00000001 ffffff71, %l4 = 00006686, %l5 = c8c0e925
	ldda	[%i2+%o6]0x80,%l4	! %l4 = 0000000000000001 00000000ffffff71
p1_b91:
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 82
!	Mem[00000000158001c0] = 7b50127d 30feb35d deb2e73a 41dcc991
	prefetch [%i3+0x1c0],4
p1_b92:
	membar	#Sync			! Added by membar checker (262)
	fbn,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = ffffffffffffff86, Mem[0000000014800008] = ffff4008
	stba	%l3,[%i1+%o6]0x80	! Annulled
p1_b93:

p1_label_83:
	bleu	p1_not_taken_0		! Branch Not Taken, %ccr = 82
!	Mem[0000000014000000] = 96900000, %l6 = 00000000ffff4008
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000096
p1_b94:
	membar	#Sync			! Added by membar checker (263)
!	%l6 = 0000000000000096, immed = fffff434, %l4 = 0000000000000001
	orncc	%l6,-0xbcc,%l4		! %l4 = 0000000000000bdf, %ccr = 00
	set	p1_b95,%o7
	fbge	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000000] = 2b5bcd4a, %l4 = 0000000000000bdf
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = 000000002b5bcd4a
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x05f,%g2
p1_b95:
!	Registers modified during the branch to p1_far_2
!	%l1  = 00000000dd9d1ae3

p1_label_84:
	set	p1_b96,%o7
	fbue,a	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000000] = ff900000, %l6 = 0000000000000096
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x060,%g2
p1_b96:
!	Registers modified during the branch to p1_far_1
!	%l2  = ffffffff2262e61c
	membar	#Sync			! Added by membar checker (264)
!	%l0 = ffffffff0000bf7e, Mem[0000000030800054] = 00000000
	stba	%l0,[%o1+0x054]%asi	! Mem[0000000030800054] = 7e000000
!	%l6 = 00000000000000ff, immed = fffff496, %y  = 90c24614
	udivx	%l6,-0xb6a,%l7		! %l7 = 0000000000000000
	set	p1_b97,%o7
	fbe	p1_far_2_le	! Branch Taken, %fcc0 = 0

p1_label_85:
!	Mem[0000000030000054] = 8349ff3d, %l0 = ffffffff0000bf7e
	ldub	[%o0+0x057],%l0		! %l0 = 000000000000003d
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x061,%g2
p1_b97:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0006ece8d7180000
!	%l3  = ffffffffffffff86
!	%l4  = 000000000000000d
	membar	#Sync			! Added by membar checker (265)
!	%f24 = c16d6d9d 00000000, %f24 = c16d6d9d 00000000, %f28 = 4a59ed86 8b79f0ce
	fmuld	%f24,%f24,%f28		! %f28 = 42eb1024 08924800
!	%f3  = 4b000000, %f0  = 32ee80ca 67dcb880
	fstox	%f3 ,%f0 		! %f0  = 00000000 00800000
!	%l5 = 00000000ffffff71, Mem[0000000032000072] = 1e219d95
	stba	%l5,[%o4+0x072]%asi	! Mem[0000000032000070] = 71219d95
	bg	p1_not_taken_0		! Branch Not Taken, %ccr = 08

p1_label_86:
!	Mem[00000000148000a8] = 9b25b80a, %l5 = 00000000ffffff71
	ldsh	[%i1+0x0a8],%l5		! %l5 = ffffffffffff9b25
p1_b98:
	membar	#Sync			! Added by membar checker (266)
!	%l2 = ffffffff2262e61c, immed = fffff2ff, %l0 = 0006ece8d7180000
	xorcc	%l2,-0xd01,%l0		! %l0 = 00000000dd9d14e3, %ccr = 08
!	%f12 = eabc6fb5 5ce5c2f3, %f2  = c1b54390 4b000000
	fcmped	%fcc2,%f12,%f2 		! %fcc2 = 1
!	%l5 = ffffffffffff9b25, immed = ffffff41, %l1 = 00000000dd9d1ae3
	xorcc	%l5,-0x0bf,%l1		! %l1 = 0000000000006464, %ccr = 00
!	Mem[0000000014800100] = bdf0e0e0 2f4869f3 a4e95180 138b068f
	prefetcha [%i1+0x100]%asi,2

p1_label_87:
	fbge,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000030800058] = 80d8d9ff, %l2 = ffffffff2262e61c
	swap	[%o1+0x058],%l2		! Annulled
p1_b99:
	membar	#Sync			! Added by membar checker (267)
!	Mem[0000000014800000] = ffff4008, %l2 = ffffffff2262e61c
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffff
	ble,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000030000058] = 40491200, %l2 = ffffffffffffffff
	ldub	[%o0+0x05a],%l2		! Annulled
p1_b100:

p1_label_88:
	membar	#Sync			! Added by membar checker (268)
!	%l4 = 000000000000000d, %l3 = ffffffffffffff86, %l1 = 0000000000006464
	addc	%l4,%l3,%l1		! %l1 = ffffffffffffff93
!	%f11 = 00000000, %f21 = 7d327503, %f20 = 2e6906d0
	fsubs	%f11,%f21,%f20		! %f20 = fd327503
!	%l7 = 0000000000000000, immed = 0000000e, %l4 = 000000000000000d
	sll	%l7,0x00e,%l4		! %l4 = 0000000000000000
!	%f15 = cf309c26, %f3  = 4b000000
	fcmps	%fcc1,%f15,%f3 		! %fcc1 = 1
!	%f30 = 4a59ed86 00000000, %f28 = 42eb1024 08924800
	fcmpd	%fcc2,%f30,%f28		! %fcc2 = 2

p1_label_89:
!	Mem[0000000015800000] = ff50d97c482c2ff3, %l1 = ffffffffffffff93
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = ff50d97c482c2ff3
!	%l4 = 0000000000000000, immed = fffffd2c, %y  = 90c24614
	mulx	%l4,-0x2d4,%l4		! %l4 = 0000000000000000
!	%f15 = cf309c26, %f27 = 60000000, %f7  = e7c82ede
	fmuls	%f15,%f27,%f7 		! %f7  = efb09c26
!	Mem[0000000040000018] = e7c82ede 00000012, %l2 = ffffffffffffffff, %l6 = 00000000000000ff
	add	%o5,0x18,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 220aff2d001a270f
!	%l5 = ffffffffffff9b25, immed = 00000ae9, %l3 = ffffffffffffff86
	orncc	%l5,0xae9,%l3		! %l3 = ffffffffffffff37, %ccr = 88

p1_label_90:
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l0 = 00000000dd9d14e3, Mem[0000000015000000] = 2b5bcd4a
	stba	%l0,[%i2+%g0]0x80	! Annulled
p1_b101:
	membar	#Sync			! Added by membar checker (269)
!	%f0  = 00000000, %f12 = eabc6fb5, %f0  = 00000000 00800000
	nop
!	Mem[0000000014800000] = ffff4008, %l1 = ff50d97c482c2ff3
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000014000000] = ff900000 0aee1713 fffffce2 000000ff
	prefetcha [%i0+0x000]%asi,22

p1_label_91:
!	%f11 = 00000000, %f27 = 60000000, %f1  = 00800000
	fsubs	%f11,%f27,%f1 		! %f1  = e0000000
	bne,a	p1_b102			! Branch Taken, %ccr = 88, CWP = 0
!	%l0 = 00000000dd9d14e3, Mem[0000000014000000] = ff900000
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000014000000] = dd9d14e3
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x066,%g2
p1_b102:
	membar	#Sync			! Added by membar checker (270)
!	%f10 = 00000000 00000000, %f12 = eabc6fb5 5ce5c2f3, %f18 = f7e34b21 1a1820e2
	fsubd	%f10,%f12,%f18		! %f18 = 6abc6fb5 5ce5c2f3
!	%l2 = ffffffffffffffff, %l7 = 0000000000000000, %l0 = 00000000dd9d14e3
	srax	%l2,%l7,%l0		! %l0 = ffffffffffffffff

p1_label_92:
	fbg,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000015800060] = f56eb4cb cb454ac3 8808d42d 8564df54
	prefetch [%i3+0x060],2
p1_b103:
	membar	#Sync			! Added by membar checker (271)
!	Branch On Register, %l6 = 220aff2d001a270f
	brlez,a,pn %l6,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000160] = 73deae6e 8c925b8a ba164e1b 539d10c2
	prefetch [%i0+0x160],22	! Annulled
p1_b104:
	membar	#Sync			! Added by membar checker (272)
!	%l5 = ffffffffffff9b25
	setx	0x81040b2881040b28,%g7,%l5 ! %l5 = 81040b2881040b28

p1_label_93:
!	Mem[0000000014800008] = ffff4008dd9d1ad5, %l1 = 00000000000000ff
	ldxa	[%i1+%o6]0x80,%l1	! %l1 = ffff4008dd9d1ad5
!	Mem[00000000158000d0] = 777e747d 84e7c5d3, %l0 = ffffffff, %l1 = dd9d1ad5
	ldd	[%i3+0x0d0],%l0		! %l0 = 00000000777e747d 0000000084e7c5d3
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800164] = 9e8fca23, %l5 = 81040b2881040b28
	ldsh	[%i3+0x166],%l5		! Annulled
p1_b105:
	membar	#Sync			! Added by membar checker (273)
!	Mem[0000000014000060] = 829dbdab, %l7 = 00000000, %l3 = ffffff37
	add	%i0,0x60,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000829dbdab

p1_label_94:
	set	p1_b106,%o7
	fbo,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000140000f4] = f3af3dbd, %l2 = ffffffffffffffff
	lduw	[%i0+0x0f4],%l2		! %l2 = 00000000f3af3dbd
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x06a,%g2
p1_b106:
!	Registers modified during the branch to p1_far_0
!	%l6  = ddf500d27d78655b
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (274)
!	Mem[0000000014800000] = ffff4008, %l3 = 00000000829dbdab
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000f3af3dbd, immed = fffff064, %l3 = 00000000000000ff
	xor	%l2,-0xf9c,%l3		! %l3 = ffffffff0c50cdd9
!	Mem[00000000150001b0] = e1644947, %l3 = ffffffff0c50cdd9
	lduha	[%i2+0x1b2]%asi,%l3	! %l3 = 0000000000004947

p1_label_95:
!	%l2 = f3af3dbd, %l3 = 00004947, Mem[0000000030800018] = 00000000 ac220000
	std	%l2,[%o1+0x018]	! Mem[0000000030800018] = f3af3dbd 00004947
!	%l4 = 0000000000000000, immed = fffffde2, %y  = 90c24614
	sdivx	%l4,-0x21e,%l7		! %l7 = 0000000000000000
!	%l0 = 00000000777e747d, Mem[0000000032000064] = 4168fde0
	stb	%l0,[%o4+0x064]		! Mem[0000000032000064] = 7d68fde0
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000015800008] = ff000000, %l1 = 0000000084e7c5d3
	ldsha	[%i3+%o6]0x80,%l1	! Annulled
p1_b107:

p1_label_96:
	membar	#Sync			! Added by membar checker (275)
!	%l6 = ddf500d27d78655b, Mem[000000001480008b] = c9e7c68e
	stba	%l6,[%i1+0x08b]%asi	! Mem[0000000014800088] = c9e7c65b
!	%f24 = c16d6d9d 00000000, %f21 = 7d327503
	fdtos	%f24,%f21		! %f21 = cb6b6ce8
	bge	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000015000008] = 00000001, %l3 = 0000000000004947
	lduba	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000000
p1_b108:
	membar	#Sync			! Added by membar checker (276)
!	Mem[0000000032000058] = 8092142f, %l6 = ddf500d27d78655b
	ldsha	[%o4+0x05a]%asi,%g2	! %g2 = ffffffffffff8092

p1_label_97:
!	%l0 = 00000000777e747d, immed = 00000038, %l0 = 00000000777e747d
	sllx	%l0,0x038,%l0		! %l0 = 7d00000000000000
!	%l3 = 0000000000000000, %l0 = 7d00000000000000, %l0 = 7d00000000000000
	addc	%l3,%l0,%l0		! %l0 = 7d00000000000000
!	%l1 = 0000000084e7c5d3, %l5 = 81040b2881040b28, %l5 = 81040b2881040b28
	andn	%l1,%l5,%l5		! %l5 = 0000000004e3c4d3
!	%l7 = 0000000000000000, %l1 = 0000000084e7c5d3, %y  = 90c24614
	sdivx	%l7,%l1,%l2		! %l2 = 0000000000000000
	set	p1_b109,%o7
	fbge,a	p1_far_3_le	! Branch Taken, %fcc0 = 0

p1_label_98:
!	%l5 = 0000000004e3c4d3, Mem[0000000032000042] = 9d2d357b
	stb	%l5,[%o4+0x042]		! Mem[0000000032000040] = d32d357b
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x06d,%g2
p1_b109:
	membar	#Sync			! Added by membar checker (277)
!	Mem[0000000016800100] = deb60524 b0dc3442, %l4 = 00000000, %l5 = 04e3c4d3
	ldd	[%i5+0x100],%l4		! %l4 = 00000000deb60524 00000000b0dc3442
!	Mem[0000000030800010] = ffff00ffffffaf25, %l3 = 0000000000000000
	ldxa	[%o1+0x010]%asi,%l3	! %l3 = ffff00ffffffaf25
!	Mem[0000000030000018] = 0000de87, %l5 = 00000000b0dc3442
	ldsw	[%o0+0x018],%l5		! %l5 = 000000000000de87
	set	p1_b110,%o7
	fbo	p1_far_1_he	! Branch Taken, %fcc0 = 0

p1_label_99:
!	Mem[000000003180005c] = e02d3769, %l6 = ddf500d27d78655b
	ldsh	[%o3+0x05c],%l6		! %l6 = ffffffffffffe02d
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x06e,%g2
p1_b110:
!	Registers modified during the branch to p1_far_1
!	%l2  = ffffffff7b181a5a
	set	p1_b111,%o7
	fbuge	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800000] = ffff4008, %l2 = ffffffff7b181a5a
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p1_branch_failed
	mov	0x06f,%g2
p1_b111:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0004273e2e980000
!	%l3  = ffffffffffffff86
!	%l4  = 0000000000000001
	bneg	p1_b112			! Branch Taken, %ccr = 88, CWP = 0
!	%l0 = 0004273e2e980000, Mem[00000000140001f0] = f016bb84531fca0d
	stx	%l0,[%i0+0x1f0]		! Mem[00000000140001f0] = 0004273e2e980000
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x070,%g2
p1_b112:

p1_label_100:
	membar	#Sync			! Added by membar checker (278)
!	%f26 = c39cb85e 60000000, %f9  = a0000000
	fdtos	%f26,%f9 		! %f9  = dce5c2f3
!	Mem[0000000014800008] = ffff4008, %l7 = 0000000000000000
	lduba	[%i1+%o6]0x80,%l7	! %l7 = 00000000000000ff
	set	p1_b113,%o7
	fba	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800000] = ff50d97c, %l4 = 0000000000000001
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x071,%g2
p1_b113:
!	Registers modified during the branch to p1_far_1
!	%l2  = ffffffff7b181a5a
	membar	#Sync			! Added by membar checker (279)
!	Mem[0000000032000040] = d485d32d 357b73b9, %l0 = 2e980000, %l1 = 84e7c5d3
	ldda	[%o4+0x040]%asi,%g2	! %l0 = 0004273e2e980000 0000000084e7c5d3

p1_label_101:
!	Mem[0000000015800000] = ff50d97c, %l4 = ffffffffffffffff
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffff

	ba,a	p1_not_taken_0_end
p1_not_taken_0:
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba,a	p1_branch_failed
p1_not_taken_0_end:

!	Mem[0000000031000058] = d485d32d 000000ff, %l5 = 000000000000de87, %l2 = ffffffff7b181a5a
	add	%o2,0x58,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 000000f6ffffaff7
!	%l2 = 000000f6ffffaff7, %l2 = 000000f6ffffaff7, %l7 = 00000000000000ff
	sll	%l2,%l2,%l7		! %l7 = 7b7fffd7fb800000
!	Mem[00000000158001c8] = deb2e73a, %l7 = 7b7fffd7fb800000
	ldswa	[%i3+0x1c8]%asi,%l7	! %l7 = ffffffffdeb2e73a
!	Branch On Register, %l2 = 000000f6ffffaff7
	brnz,a,pn %l2,p1_b114		! Branch Taken

p1_label_102:
!	Mem[0000000030800058] = 80d8d9ff, %l1 = 0000000084e7c5d3
	ldsh	[%o1+0x058],%l1		! %l1 = ffffffffffff80d8
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x072,%g2
p1_b114:
	membar	#Sync			! Added by membar checker (280)
!	%f20 = fd327503, %f27 = 60000000, %f12 = eabc6fb5 5ce5c2f3
	fsmuld	%f20,%f27,%f12		! %f12 = cbb64ea0 60000000
!	%l4 = ffffffffffffffff, immed = fffff3af, %y  = 90c24614
	sdivx	%l4,-0xc51,%l6		! %l6 = 0000000000000000
!	Mem[00000000148001c0] = fdc1ee6c 993e9ca2
	flush	%i1+0x1c0
!	%l6 = 0000000000000000, immed = 00000744, %l0 = 0004273e2e980000
	addcc	%l6,0x744,%l0		! %l0 = 0000000000000744, %ccr = 00

p1_label_103:
!	%f27 = 60000000, %f15 = cf309c26
	fmovs	%f27,%f15		! %f15 = 60000000
!	Branch On Register, %l0 = 0000000000000744
	brnz,pn	%l0,p1_b115		! Branch Taken
!	%l2 = ffffaff7, %l3 = ffffff86, Mem[0000000014800000] = ffff4008 1c541d54
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000014800000] = ffffaff7 ffffff86
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x073,%g2
p1_b115:
	set	p1_b116,%o7
	fbue	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetch [%o4+0x020],23
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x074,%g2
p1_b116:
!	Registers modified during the branch to p1_far_0
!	%l6  = 0000000000000079
!	%l7  = ffffffffffffffff

p1_label_104:
	membar	#Sync			! Added by membar checker (281)
!	%f30 = 4a59ed86 00000000, %f16 = 4a69ed86 00000000, %f2  = c1b54390 4b000000
	fmuld	%f30,%f16,%f2 		! %f2  = 54d50204 6b112000
	set	p1_b117,%o7
	fbe,a,pn %fcc0,p1_near_2_le	! Branch Taken, %fcc0 = 0
!	%l4 = ffffffffffffffff, Mem[0000000014000050] = cb23110485a68f12
	stx	%l4,[%i0+0x050]		! Mem[0000000014000050] = ffffffffffffffff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x075,%g2
p1_b117:
!	Registers modified during the branch to p1_near_2
!	%l3  = 0000000040491200
!	%l4  = 0000000000001e40
!	%l5  = ffffffffffff80b3
	membar	#Sync			! Added by membar checker (282)
	set	p1_b118,%o7
	fba,pn	%fcc2,p1_near_2_le	! Branch Taken, %fcc2 = 2
!	Mem[0000000015000008] = 00000001, %l2 = 000000f6ffffaff7
	ldsha	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x076,%g2
p1_b118:
!	Registers modified during the branch to p1_near_2
!	%l3  = 00000000ffffff86
!	%l4  = 0000000000000079
!	%l5  = ffffffffffff80b3

p1_label_105:
	membar	#Sync			! Added by membar checker (283)
!	Mem[00000000150001c8] = 9114beea a26b2a3e, %l4 = 00000079, %l5 = ffff80b3
	ldd	[%i2+0x1c8],%l4		! %l4 = 000000009114beea 00000000a26b2a3e
	fbule,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l5 = 00000000a26b2a3e, Mem[0000000030000050] = 56afe7098349ff3d
	stx	%l5,[%o0+0x050]		! Mem[0000000030000050] = 00000000a26b2a3e
p1_b119:
	membar	#Sync			! Added by membar checker (284)
!	%l1 = ffffffffffff80d8, immed = 00000690, %y  = 90c24614
	smul	%l1,0x690,%l7		! %l7 = fffffffffcbd8980
!	%l3 = 00000000ffffff86, Mem[0000000032000079] = 7d4a36ce
	stba	%l3,[%o4+0x079]%asi	! Mem[0000000032000078] = 864a36ce

p1_label_106:
!	Mem[0000000015800110] = 0a514ce82e3bf293, %l2 = 0000000000000000
	ldxa	[%i3+0x110]%asi,%l2	! %l2 = 0a514ce82e3bf293
!	%l1 = ffffffffffff80d8, immed = 0000001a, %l5 = 00000000a26b2a3e
	srax	%l1,0x01a,%l5		! %l5 = ffffffffffffffff
!	%l6 = 0000000000000079, immed = fffff644, %y  = ffffffff
	smulcc	%l6,-0x9bc,%l2		! %l2 = fffffffffffb6624, %ccr = 88
!	%f8  = fd327503, %f13 = 60000000
	fmovs	%f8 ,%f13		! %f13 = fd327503
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88

p1_label_107:
!	%l5 = ffffffffffffffff, Mem[000000001500018c] = 08cbbf59
	stw	%l5,[%i2+0x18c]		! Annulled
p1_b120:
	membar	#Sync			! Added by membar checker (285)
	fbu,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000015800000] = ff50d97c, %l1 = ffffffffffff80d8
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000ff50
p1_b121:
	membar	#Sync			! Added by membar checker (286)
!	%l2 = fffffffffffb6624, %l5 = ffffffffffffffff, %y  = ffffffff
	smul	%l2,%l5,%l0		! %l0 = 00000000000499dc
!	Mem[00000000150001a0] = 1cc89a39 73bb9145 a252c440 3d513b5e
	prefetcha [%i2+0x1a0]%asi,22

p1_label_108:
!	%l7 = fffffffffcbd8980, immed = 00000f7e, %l2 = fffffffffffb6624
	or	%l7,0xf7e,%l2		! %l2 = fffffffffcbd8ffe
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = fcbd8ffe, %l3 = ffffff86, Mem[0000000030800018] = f3af3dbd 00004947
	std	%l2,[%o1+0x018]	! Annulled
p1_b122:
	membar	#Sync			! Added by membar checker (287)
!	%f28 = 42eb1024 08924800, %f12 = cbb64ea0 fd327503
	fdtox	%f28,%f12		! %f12 = 0000d881 20449240
!	Mem[00000000170001e0] = 11652027 a79846cb 077123fd ec11cbc7
	prefetch [%i6+0x1e0],0

p1_label_109:
	bvc,a	p1_b123			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000014800008] = ffff4008, %l5 = ffffffffffffffff
	lduba	[%i1+%o6]0x80,%l5	! %l5 = 00000000000000ff
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x07b,%g2
p1_b123:
	membar	#Sync			! Added by membar checker (288)
!	Mem[0000000031800018] = 00000000, %l4 = 000000009114beea
	lduha	[%o3+0x01a]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000000499dc, Mem[0000000030800050] = 294f054d7e000000
	stx	%l0,[%o1+0x050]		! Mem[0000000030800050] = 00000000000499dc
!	%l3 = 00000000ffffff86, Mem[0000000015000000] = 2b5bcd4a
	stha	%l3,[%i2+%g0]0x80	! Mem[0000000015000000] = ff86cd4a

p1_label_110:
!	%l2 = fffffffffcbd8ffe, immed = fffff957, %y  = 00000000
	udiv	%l2,-0x6a9,%l2		! %l2 = 0000000000000000
	set	p1_b124,%o7
	fble,a	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	%l3 = 00000000ffffff86, Mem[0000000015000000] = ff86cd4a
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000015000000] = 8686cd4a
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x07c,%g2
p1_b124:
!	Registers modified during the branch to p1_far_0
!	%l2  = fffffffffffff853
!	%l3  = 0000000000024cee
!	%l5  = 00000000220aff2d
!	%l6  = ffffffffd42ebad8
	membar	#Sync			! Added by membar checker (289)
!	Branch On Register, %l7 = fffffffffcbd8980
	brgez,pn %l7,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000016800008] = af102bb34b4e3d86, %l5 = 00000000220aff2d
	ldxa	[%i5+%o6]0x80,%l5	! %l5 = af102bb34b4e3d86
p1_b125:

p1_label_111:
	set	p1_b126,%o7
	fbuge,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000016800008] = af102bb3 4b4e3d86, %l2 = fffff853, %l3 = 00024cee
	ldda	[%i5+%o6]0x80,%l2	! %l2 = 00000000af102bb3 000000004b4e3d86
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x07e,%g2
p1_b126:
!	Registers modified during the branch to p1_far_1
!	%l1  = ffffffffd42eb289
!	%l2  = ffffffffd42eb281
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = ffff4008, %l5 = af102bb34b4e3d86
	swapa	[%i1+%o6]0x80,%l5	! Annulled
p1_b127:
	membar	#Sync			! Added by membar checker (290)
!	%l7 = fffffffffcbd8980, immed = fffff2d7, %l4 = 0000000000000000
	orcc	%l7,-0xd29,%l4		! %l4 = fffffffffffffbd7, %ccr = 88

p1_label_112:
!	Mem[0000000014800008] = ffff4008, %l7 = fffffffffcbd8980
	ldsha	[%i1+%o6]0x80,%l7	! %l7 = ffffffffffffffff
	set	p1_b128,%o7
	fbuge,a	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000000] = dd9d14e3, %l7 = ffffffffffffffff
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000dd9d14e3
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x080,%g2
p1_b128:
!	Registers modified during the branch to p1_far_2
!	%l1  = 00000000dd9d14f1
	membar	#Sync			! Added by membar checker (291)
!	%l1 = 00000000dd9d14f1, Mem[000000001680009a] = 6e213dfe
	sth	%l1,[%i5+0x09a]		! Mem[0000000016800098] = 6e2114f1
!	Mem[000000003100001c] = eed87f2b, %l6 = ffffffffd42ebad8
	lduha	[%o2+0x01c]%asi,%l6	! %l6 = 000000000000eed8

p1_label_113:
	fbul,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l0 = 000499dc, %l1 = dd9d14f1, Mem[0000000030000050] = 00000000 a26b2a3e
	std	%l0,[%o0+0x050]	! Annulled
p1_b129:
	membar	#Sync			! Added by membar checker (292)
!	Mem[0000000031800050] = e0d8d112, %l1 = 00000000dd9d14f1
	lduw	[%o3+0x050],%l1		! %l1 = 00000000e0d8d112
	set	p1_b130,%o7
	fbue	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000008] = fffffce2, %l2 = ffffffffd42eb281
	ldswa	[%i0+%o6]0x80,%l2	! %l2 = fffffffffffffce2
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x082,%g2
p1_b130:
!	Registers modified during the branch to p1_far_0
!	%l6  = ffffffffb4b12ca1
!	%l7  = 0000000000000000

p1_label_114:
	membar	#Sync			! Added by membar checker (293)
!	%f7  = efb09c26, %f3  = 6b112000
	fmovs	%f7 ,%f3 		! %f3  = efb09c26
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800008] = ff000000, %l7 = 0000000000000000
	ldsha	[%i3+%o6]0x80,%l7	! %l7 = ffffffffffffff00
p1_b131:
	bneg,a	p1_b132			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[00000000150000c0] = 4d405c55, %l2 = fffffffffffffce2
	swap	[%i2+0x0c0],%l2		! %l2 = 000000004d405c55
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x084,%g2
p1_b132:

p1_label_115:
	set	p1_b133,%o7
	fbe	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800054] = 020c630d, %l5 = af102bb34b4e3d86
	lduw	[%o3+0x054],%l5		! %l5 = 00000000020c630d
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p1_branch_failed
	mov	0x085,%g2
p1_b133:
!	Registers modified during the branch to p1_far_1
!	%l1  = ffffffffb4b124f0
!	%l2  = ffffffffb4b120d0
	membar	#Sync			! Added by membar checker (294)
!	Mem[0000000015000000] = 8686cd4afceb5394, %l0 = 00000000000499dc
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 8686cd4afceb5394
!	%l0 = 8686cd4afceb5394, immed = fffffbcd, %l7 = ffffffffffffff00
	andncc	%l0,-0x433,%l7		! %l7 = 0000000000000010, %ccr = 00
!	%l6 = ffffffffb4b12ca1, immed = fffff442, %l4 = fffffffffffffbd7
	orn	%l6,-0xbbe,%l4		! %l4 = ffffffffb4b12fbd

p1_label_116:
	set	p1_b134,%o7
	fble,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	%l1 = ffffffffb4b124f0, Mem[0000000032000004] = cbdc61c5
	stw	%l1,[%o4+0x004]		! Mem[0000000032000004] = b4b124f0
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x086,%g2
p1_b134:
!	Registers modified during the branch to p1_far_1
!	%l1  = ffffffffb4b124f0
!	%l2  = ffffffffb4b120d0
	membar	#Sync			! Added by membar checker (295)
	set	p1_b135,%o7
	fblg,a,pt %fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 1
!	Mem[00000000140000c0] = dd9a3143 fe5210f7 86c41981 4f19b9c1
	prefetch [%i0+0x0c0],2
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x087,%g2
p1_b135:
!	Registers modified during the branch to p1_near_0
!	%l0  = ffffffffffff96c3
!	%l1  = fffffffffff87151
!	%l5  = fffffffffff97f50
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 9b

p1_label_117:
!	%l7 = 0000000000000010, Mem[0000000030000054] = a26b2a3e
	stb	%l7,[%o0+0x054]		! Annulled
p1_b136:
	bg,a	p1_b137			! Branch Taken, %ccr = 9b, CWP = 0
!	Mem[00000000150000a0] = 17ade110 c256c9f3 d5eb3317 78534db3
	prefetch [%i2+0x0a0],22
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x089,%g2
p1_b137:
	bne	p1_b138			! Branch Taken, %ccr = 9b, CWP = 0
!	Mem[00000000148000c0] = 4c8d71e7 23b1c0fc 05e5c87c b5a9dd62
	prefetch [%i1+0x0c0],23
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x08a,%g2
p1_b138:

p1_label_118:
	membar	#Sync			! Added by membar checker (296)
!	%f24 = c16d6d9d 00000000, %f9  = dce5c2f3
	fdtos	%f24,%f9 		! %f9  = cb6b6ce8
!	Mem[0000000015800144] = c5bcf845, %l2 = ffffffffb4b120d0
	lduha	[%i3+0x146]%asi,%l2	! %l2 = 000000000000f845
	set	p1_b139,%o7
	fbe,pt	%fcc0,p1_near_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000030000018] = 0000de87, %l0 = ffffffffffff96c3
	lduh	[%o0+0x018],%l0		! %l0 = 0000000000000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x08b,%g2
p1_b139:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffffffb4b1fce5
!	%l2  = ffffffffffffffff
	set	p1_b140,%o7
	fba	p1_far_1_he	! Branch Taken, %fcc0 = 0

p1_label_119:
!	%l4 = ffffffffb4b12fbd, Mem[0000000031000010] = 0000001f
	stw	%l4,[%o2+0x010]		! Mem[0000000031000010] = b4b12fbd
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x08c,%g2
p1_b140:
!	Registers modified during the branch to p1_far_1
!	%l2  = ffffffffffff2fbc
	membar	#Sync			! Added by membar checker (297)
!	Mem[0000000031000018] = 00000000, %l7 = 0000000000000010
	lduw	[%o2+0x018],%l7		! %l7 = 0000000000000000
!	%l1 = ffffffffb4b1fce5
	sethi	%hi(0xe8b80800),%l1	! %l1 = 00000000e8b80800
!	%l0 = 00000000, %l1 = e8b80800, Mem[0000000014800000] = ffffaff7 ffffff86
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000014800000] = 00000000 e8b80800
!	%l6 = ffffffffb4b12ca1, %l6 = ffffffffb4b12ca1, %l1 = 00000000e8b80800
	subc	%l6,%l6,%l1		! %l1 = 0000000000000000

p1_label_120:
!	%l5 = fffffffffff97f50, immed = 000006dd, %l5 = fffffffffff97f50
	orn	%l5,0x6dd,%l5		! %l5 = ffffffffffffff72
!	Mem[00000000158000e0] = b13ace27 000000b0 beeee956 f12e6656
	prefetcha [%i3+0x0e0]%asi,1
	set	p1_b141,%o7
	fble	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000000] = ffffffff, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x08d,%g2
p1_b141:
!	Registers modified during the branch to p1_far_3
!	%l0  = 00000000ffffffff
!	%l1  = 00000000fffffdf7
!	%l2  = 00000000ffffffff
!	%l4  = ffffffffb4b12fbd
	bge,a	p1_b142			! Branch Taken, %ccr = 0a, CWP = 0

p1_label_121:
!	%l4 = b4b12fbd, %l5 = ffffff72, Mem[0000000014000000] = 00000000 0aee1713
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000014000000] = b4b12fbd ffffff72
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x08e,%g2
p1_b142:
	membar	#Sync			! Added by membar checker (298)
!	Mem[00000000150001b8] = a452b5ae, %l3 = 000000004b4e3d86
	swapa	[%i2+0x1b8]%asi,%l3	! %l3 = 00000000a452b5ae
!	%l6 = b4b12ca1, %l7 = 00000000, Mem[0000000016800008] = af102bb3 4b4e3d86
	stda	%l6,[%i5+%o6]0x80	! Mem[0000000016800008] = b4b12ca1 00000000
!	%l3 = 00000000a452b5ae, %l2 = 00000000ffffffff, %l3 = 00000000a452b5ae
	sub	%l3,%l2,%l3		! %l3 = ffffffffa452b5af
!	%l0 = 00000000ffffffff, immed = 00000783, %y  = ffffffff
	udivcc	%l0,0x783,%l6		! %l6 = 00000000ffffffff, %ccr = 0a

p1_label_122:
!	Mem[000000003000001c] = b3d896c3, %l6 = 00000000ffffffff
	ldsba	[%o0+0x01f]%asi,%l6	! %l6 = ffffffffffffffc3
	fbu,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l0 = 00000000ffffffff, Mem[0000000030800058] = 80d8d9ff
	stw	%l0,[%o1+0x058]		! Mem[0000000030800058] = ffffffff
p1_b143:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800010] = ff5b6598684f1dd3, %l0 = 00000000ffffffff
	ldx	[%i3+0x010],%l0		! Annulled
p1_b144:

p1_label_123:
	membar	#Sync			! Added by membar checker (299)
!	Mem[0000000015000008] = 00000001, %l6 = ffffffffffffffc3
	ldsba	[%i2+%o6]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000032000008] = d5b78895 a4685005
	std	%l6,[%o4+0x008]	! Mem[0000000032000008] = 00000000 00000000
!	Mem[0000000014000040] = fcbe3eaf f49796cd 858f68ba 7f9f2b7e
	prefetch [%i0+0x040],20
!	%f24 = c16d6d9d, %f26 = c39cb85e 60000000
	fstod	%f24,%f26		! %f26 = c02dadb3 a0000000
	set	p1_b145,%o7
	fba,a,pn %fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 1

p1_label_124:
!	Mem[0000000031000010] = b4b12fbd, %l0 = 00000000ffffffff
	swap	[%o2+0x010],%l0		! Annulled
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x091,%g2
p1_b145:
!	Registers modified during the branch to p1_near_0
!	%l0  = ffffffffffff96c3
!	%l1  = 0000000000000000
!	%l5  = 0000000000000c4d
	membar	#Sync			! Added by membar checker (300)
	set	p1_b146,%o7
	fbuge,a,pt %fcc0,p1_near_2_he	! Branch Taken, %fcc0 = 0
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000031800010] = af442052 dd128db1
	std	%l6,[%o3+0x010]	! Mem[0000000031800010] = 00000000 00000000
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x092,%g2
p1_b146:
!	Registers modified during the branch to p1_near_2
!	%l1  = 0000000000000000
!	%l4  = 000000000000007f
	membar	#Sync			! Added by membar checker (301)
!	Mem[0000000014800008] = ffff4008, %l7 = 0000000000000000
	lduwa	[%i1+%o6]0x80,%l7	! %l7 = 00000000ffff4008
	fbu,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_125:
!	Mem[0000000016800000] = ff000000, %l5 = 0000000000000c4d
	lduba	[%i5+%g0]0x80,%l5	! Annulled
p1_b147:
	membar	#Sync			! Added by membar checker (302)
!	%f13 = 20449240, %f12 = 0000d881
	fabss	%f13,%f12		! %f12 = 20449240
!	%l5 = 0000000000000c4d, Mem[0000000014800000] = 00000000
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000014800000] = 0c4d0000
!	Branch On Register, %l0 = ffffffffffff96c3
	brgz,a,pn %l0,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000015000060] = 02ecbf92 8b658bae 749d040f 6d352ec9
	prefetch [%i2+0x060],4	! Annulled
p1_b148:

p1_label_126:
!	call to call_0, CWP = 0
	call	p1_call_0_le
!	Mem[0000000015000000] = 8686cd4a, %l5 = 0000000000000c4d
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 000000008686cd4a
!	Registers modified during the branch to p1_call_0
!	%l0  = ffffffffffffffff
!	%l1  = ffffffffffff98d5
!	%l3  = 00000000000000d4
!	%l7  = 000000000000003a
	membar	#Sync			! Added by membar checker (303)
!	%f24 = c16d6d9d 00000000, %f10 = 00000000 00000000
	fnegd	%f24,%f10		! %f10 = 416d6d9d 00000000
!	%l3 = 00000000000000d4, %l1 = ffffffffffff98d5, %l5 = 000000008686cd4a
	xor	%l3,%l1,%l5		! %l5 = ffffffffffff9801
!	%l3 = 00000000000000d4, %l3 = 00000000000000d4, %l1 = ffffffffffff98d5
	addcc	%l3,%l3,%l1		! %l1 = 00000000000001a8, %ccr = 00

p1_label_127:
	fbl	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000160] = 73deae6e 8c925b8a ba164e1b 539d10c2
	prefetch [%i0+0x160],3
p1_b149:
	membar	#Sync			! Added by membar checker (304)
!	%f21 = cb6b6ce8, %f22 = aad9ed86
	fabss	%f21,%f22		! %f22 = 4b6b6ce8
!	%l3 = 00000000000000d4, immed = 000007d4, %y  = 00000000
	udiv	%l3,0x7d4,%l7		! %l7 = 0000000000000000
!	Mem[0000000015000120] = a49b2644 307abe47 397e0d96 d803dcc5
	prefetcha [%i2+0x120]%asi,4

p1_label_128:
!	Branch On Register, %l5 = ffffffffffff9801
	brgz,pn	%l5,p1_not_taken_0	! Branch Not Taken
!	%l4 = 000000000000007f, Mem[00000000148000d6] = 41275f4a
	stb	%l4,[%i1+0x0d6]		! Mem[00000000148000d4] = 41277f4a
p1_b150:
	membar	#Sync			! Added by membar checker (305)
!	%l7 = 0000000000000000, Mem[000000003000005e] = dbff7e09
	stba	%l7,[%o0+0x05e]%asi	! Mem[000000003000005c] = dbff0009
	set	p1_b151,%o7
	fble,a,pt %fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000014800008] = ffff4008, %l2 = 00000000ffffffff
	swapa	[%i1+%o6]0x80,%l2	! %l2 = 00000000ffff4008
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p1_branch_failed
	mov	0x097,%g2
p1_b151:
!	Registers modified during the branch to p1_near_2
!	%l1  = 0000000000000000
!	%l4  = 000000000000007f

p1_label_129:
	membar	#Sync			! Added by membar checker (306)
!	%l0 = ffffffffffffffff, %l3 = 00000000000000d4, %l2 = 00000000ffff4008
	srl	%l0,%l3,%l2		! %l2 = 0000000000000fff
!	Mem[0000000017000100] = ae7eed9a 8170ca0a ee0fff88 acbc50cd
	prefetch [%i6+0x100],2
!	%l7 = 0000000000000000, %l4 = 000000000000007f, %l5 = ffffffffffff9801
	tsubcc	%l7,%l4,%l5		! %l5 = ffffffffffffff81, %ccr = 9b
!	Mem[0000000015000014] = 8053c586, %l5 = ffffffffffffff81
	lduw	[%i2+0x014],%l5		! %l5 = 000000008053c586
!	%f10 = 416d6d9d 00000000, %f23 = 2e6906d0
	fdtoi	%f10,%f23		! %f23 = 00eb6ce8

p1_label_130:
!	%l7 = 0000000000000000, Mem[0000000015800008] = ff000000
	stba	%l7,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000000
!	Branch On Register, %l2 = 0000000000000fff
	brlz,pt	%l2,p1_not_taken_0	! Branch Not Taken
!	%l0 = ffffffffffffffff, Mem[0000000032000050] = 84f8f53a4ac9a406
	stx	%l0,[%o4+0x050]		! Mem[0000000032000050] = ffffffffffffffff
p1_b152:
	membar	#Sync			! Added by membar checker (307)
!	Branch On Register, %l5 = 000000008053c586
	brz,pt	%l5,p1_not_taken_0	! Branch Not Taken
!	Mem[000000001500015b] = 0fc4b721, %l0 = ffffffffffffffff
	ldstub	[%i2+0x15b],%l0		! %l0 = 0000000000000021
p1_b153:

p1_label_131:
	membar	#Sync			! Added by membar checker (308)
!	%l0 = 0000000000000021, Mem[0000000030000050] = 00000000a26b2a3e
	stx	%l0,[%o0+0x050]		! Mem[0000000030000050] = 0000000000000021
!	Mem[00000000158000b0] = e262a6b410b19b1d, %l6 = 0000000000000000
	ldxa	[%i3+0x0b0]%asi,%l6	! %l6 = e262a6b410b19b1d
!	%l5 = 000000008053c586, %l6 = e262a6b410b19b1d, %l7 = 0000000000000000
	taddcc	%l5,%l6,%l7		! %l7 = e262a6b4910560a3, %ccr = 8a
!	%l3 = 00000000000000d4, immed = fffffbd2, %l7 = e262a6b4910560a3
	andn	%l3,-0x42e,%l7		! %l7 = 0000000000000004
	bvs	p1_b154			! Branch Taken, %ccr = 8a, CWP = 0

p1_label_132:
!	Mem[0000000015000110] = 0519da0f, %l7 = 0000000000000004
	ldsh	[%i2+0x110],%l7		! %l7 = 0000000000000519
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x09a,%g2
p1_b154:
	bneg	p1_b155			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000014800008] = ffffffff, %l6 = e262a6b410b19b1d
	ldstuba	[%i1+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x09b,%g2
p1_b155:
	membar	#Sync			! Added by membar checker (309)
!	%l1 = 0000000000000000, immed = 0000000a, %l2 = 0000000000000fff
	srl	%l1,0x00a,%l2		! %l2 = 0000000000000000
!	Mem[0000000014000140] = b52ea91a a89a183a adc82a7d f765becf
	prefetch [%i0+0x140],20

p1_label_133:
!	%f4  = 00000000, %f24 = c16d6d9d, %f30 = 4a59ed86
	fdivs	%f4 ,%f24,%f30		! %f30 = 80000000
	fbu,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000000] = b4b12fbd, %l5 = 000000008053c586
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000b4
p1_b156:
	membar	#Sync			! Added by membar checker (310)
!	Mem[0000000014000020] = 47aba15c 463743f4 7468dc52 13eb047b
	prefetch [%i0+0x020],0
!	Mem[0000000014800000] = 0c4d0000, %l4 = 000000000000007f
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 000000000c4d0000

p1_label_134:
!	%l4 = 000000000c4d0000, %l0 = 0000000000000021, %y  = 00000000
	umul	%l4,%l0,%l2		! %l2 = 0000000195ed0000
!	%l4 = 000000000c4d0000, immed = fffffa46, %l2 = 0000000195ed0000
	xnor	%l4,-0x5ba,%l2		! %l2 = 000000000c4d05b9
!	%l4 = 000000000c4d0000, %l6 = 00000000000000ff, %y  = 00000001
	udivcc	%l4,%l6,%l6		! %l6 = 00000000010d5a5a, %ccr = 00
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	 Annulled
	ldda	[%i0+%g0]0x80,%l0
p1_b157:

p1_label_135:
	membar	#Sync			! Added by membar checker (311)
!	Mem[0000000031000057] = fffffdf7, %l5 = 00000000000000b4
	ldstuba	[%o2+0x057]%asi,%l5	! %l5 = 00000000000000f7
!	Branch On Register, %l2 = 000000000c4d05b9
	brz,pn	%l2,p1_not_taken_0	! Branch Not Taken
!	%l6 = 010d5a5a, %l7 = 00000519, Mem[0000000015000050] = 7d09b114 2435e057
	std	%l6,[%i2+0x050]	! Mem[0000000015000050] = 010d5a5a 00000519
p1_b158:
	membar	#Sync			! Added by membar checker (312)
!	Mem[0000000032000000] = 1cf2e7b4, %l0 = 0000000000000021
	ldsba	[%o4+0x001]%asi,%g2	! %g2 = 000000000000001c
!	%l4 = 0c4d0000, %l5 = 000000f7, Mem[0000000015800008] = 00000000 00000007
	stda	%l4,[%i3+%o6]0x80	! Mem[0000000015800008] = 0c4d0000 000000f7

p1_label_136:
!	%l5 = 00000000000000f7, immed = 0000002d, %l7 = 0000000000000519
	xnorcc	%l5,0x02d,%l7		! %l7 = ffffffffffffff25, %ccr = 88
!	%l4 = 000000000c4d0000, %l4 = 000000000c4d0000, %l7 = ffffffffffffff25
	andcc	%l4,%l4,%l7		! %l7 = 000000000c4d0000, %ccr = 00
!	Mem[0000000016000078] = 232c74b5, %l2 = 000000000c4d05b9
	lduh	[%i4+0x078],%l2		! %l2 = 000000000000232c
!	%l3 = 00000000000000d4, immed = 00000b05, %l3 = 00000000000000d4
	xnorcc	%l3,0xb05,%l3		! %l3 = fffffffffffff42e, %ccr = 88
!	%f4  = 00000000 c0000000, %f12 = 20449240 20449240
	fnegd	%f4 ,%f12		! %f12 = 80000000 c0000000

p1_label_137:
!	%l2 = 000000000000232c, Mem[0000000030800057] = 000499dc
	stb	%l2,[%o1+0x057]		! Mem[0000000030800054] = 0004992c
	set	p1_b159,%o7
	fba,pn	%fcc0,p1_near_1_he	! Branch Taken, %fcc0 = 0
!	%l2 = 000000000000232c, Mem[0000000032000078] = 08864a36ceb28373
	stx	%l2,[%o4+0x078]		! Mem[0000000032000078] = 000000000000232c
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x09f,%g2
p1_b159:
!	Registers modified during the branch to p1_near_1
!	%l1  = 0000000000004658
!	%l4  = fffffffffffffb8c
!	%l6  = 000000000000175a
	membar	#Sync			! Added by membar checker (313)
!	%f8  = fd327503 cb6b6ce8, %f28 = 42eb1024 08924800
	fnegd	%f8 ,%f28		! %f28 = 7d327503 cb6b6ce8
!	%l6 = 000000000000175a, immed = 0000000d, %l2 = 000000000000232c
	sra	%l6,0x00d,%l2		! %l2 = 0000000000000000

p1_label_138:
!	%l3 = fffffffffffff42e, immed = 00000cc7, %y  = 00000001
	umulcc	%l3,0xcc7,%l6		! %l6 = 00000cc6ff68f7c2, %ccr = 08
!	%l2 = 0000000000000000, immed = 00000611, %l6 = 00000cc6ff68f7c2
	tsubcc	%l2,0x611,%l6		! %l6 = fffffffffffff9ef, %ccr = 9b
!	%l1 = 0000000000004658, %l3 = fffffffffffff42e, %l3 = fffffffffffff42e
	xor	%l1,%l3,%l3		! %l3 = ffffffffffffb276
!	Branch On Register, %l6 = fffffffffffff9ef
	brnz,pn	%l6,p1_b160		! Branch Taken
!	%l0 = 00000021, %l1 = 00004658, Mem[0000000014000008] = fffffce2 000000ff
	stda	%l0,[%i0+%o6]0x80	! Mem[0000000014000008] = 00000021 00004658
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x0a0,%g2
p1_b160:

p1_label_139:
	membar	#Sync			! Added by membar checker (314)
!	Mem[0000000015000008] = 00000001, %l7 = 000000000c4d0000
	swapa	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000001
	bcc	p1_not_taken_0		! Branch Not Taken, %ccr = 9b
!	%l2 = 00000000, %l3 = ffffb276, Mem[0000000030000018] = 0000de87 b3d896c3
	std	%l2,[%o0+0x018]	! Mem[0000000030000018] = 00000000 ffffb276
p1_b161:
	membar	#Sync			! Added by membar checker (315)
!	Mem[0000000030800010] = ffff00ff, %l2 = 0000000000000000
	lduba	[%o1+0x012]%asi,%l2	! %l2 = 0000000000000000
!	%f0  = 00000000, %f28 = 7d327503, %f22 = 4b6b6ce8
	fmuls	%f0 ,%f28,%f22		! %f22 = 00000000

p1_label_140:
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000140000f0] = d1e22701, %l2 = 0000000000000000
	ldsw	[%i0+0x0f0],%l2		! %l2 = ffffffffd1e22701
p1_b162:
	membar	#Sync			! Added by membar checker (316)
	set	p1_b163,%o7
	fbug,a,pn %fcc2,p1_near_0_he	! Branch Taken, %fcc2 = 2
!	Mem[0000000014800180] = e7f53892 0af408b7 d006898a 07b8ac41
	prefetch [%i1+0x180],4
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x0a3,%g2
p1_b163:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffffffffffffef
!	%l2  = ffffffffffffffff
	set	p1_b164,%o7
	fble,a	p1_far_1_le	! Branch Taken, %fcc0 = 0

p1_label_141:
!	%l6 = fffffffffffff9ef, Mem[000000003080001d] = ffffffff
	stb	%l6,[%o1+0x01d]		! Mem[000000003080001c] = ffefffff
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x0a4,%g2
p1_b164:
!	Registers modified during the branch to p1_far_1
!	%l1  = fffffffffffff1be
!	%l2  = fffffffffffff196
	membar	#Sync			! Added by membar checker (317)
!	Branch On Register, %l7 = 0000000000000001
	brlz,pt	%l7,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000032000040] = d485d32d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],4
p1_b165:
	membar	#Sync			! Added by membar checker (318)
!	Mem[00000000150001b2] = e1644947, %l4 = fffffffffffffb8c
	ldstub	[%i2+0x1b2],%l4		! %l4 = 0000000000000049
!	%l4 = 0000000000000049, %l3 = ffffffffffffb276, %y  = 00000cc6
	smul	%l4,%l3,%l5		! %l5 = ffffffffffe9e3a6

p1_label_142:
!	%l2 = fffffffffffff196
	sethi	%hi(0xea9bec00),%l2	! %l2 = 00000000ea9bec00
!	Mem[0000000031000010] = b4b12fbd, %l6 = fffffffffffff9ef
	ldsb	[%o2+0x011],%l6		! %l6 = ffffffffffffffb1
!	Mem[0000000030000010] = 95bbff02 ffffffaf, %l2 = ea9bec00, %l3 = ffffb276
	ldd	[%o0+0x010],%l2		! %l2 = 0000000095bbff02 00000000ffffffaf
!	%l3 = 00000000ffffffaf, %l0 = 0000000000000021, %l7 = 0000000000000001
	or	%l3,%l0,%l7		! %l7 = 00000000ffffffaf
	fbule,a,pt %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2

p1_label_143:
!	Mem[0000000014800134] = 0000007f, %l7 = 00000000ffffffaf
	ldsb	[%i1+0x135],%l7		! Annulled
p1_b166:
	membar	#Sync			! Added by membar checker (319)
!	%l1 = fffffffffffff1be, immed = 000000fb, %l7 = 00000000ffffffaf
	subccc	%l1,0x0fb,%l7		! %l7 = fffffffffffff0c3, %ccr = 88
!	%l0 = 0000000000000021, Mem[0000000015000058] = 755a468909f4d491
	stxa	%l0,[%i2+0x058]%asi	! Mem[0000000015000058] = 0000000000000021
	set	p1_b167,%o7
	fbo,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800008] = ffffffff, %l3 = 00000000ffffffaf
	lduha	[%i1+%o6]0x80,%l3	! %l3 = 000000000000ffff
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x0a7,%g2
p1_b167:
!	Registers modified during the branch to p1_far_0
!	%l6  = 000000000000ffb1
!	%l7  = 0000000000000000

p1_label_144:
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000018] = 00000000, %l3 = 000000000000ffff
	ldsw	[%o0+0x018],%l3		! %l3 = 0000000000000000
p1_b168:
	membar	#Sync			! Added by membar checker (320)
!	%l6 = 000000000000ffb1, %l6 = 000000000000ffb1, %l7 = 0000000000000000
	and	%l6,%l6,%l7		! %l7 = 000000000000ffb1
!	%l1 = fffffffffffff1be, %l4 = 0000000000000049, %l3 = 0000000000000000
	sllx	%l1,%l4,%l3		! %l3 = ffffffffffe37c00
!	Mem[0000000014000104] = 594c2a38, %l7 = 000000000000ffb1
	swap	[%i0+0x104],%l7		! %l7 = 00000000594c2a38

p1_label_145:
!	%l3 = ffffffffffe37c00, immed = 0000002f, %l6 = 000000000000ffb1
	sllx	%l3,0x02f,%l6		! %l6 = be00000000000000
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000014800000] = 0c4d0000, %l5 = ffffffffffe9e3a6
	ldswa	[%i1+%g0]0x80,%l5	! Annulled
p1_b169:
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[00000000140000a0] = ef99361d 4f4f80c7 8bc2e89f b0af316d
	prefetch [%i0+0x0a0],20	! Annulled
p1_b170:

p1_label_146:
	membar	#Sync			! Added by membar checker (321)
!	Mem[00000000158000e0] = b13ace27 000000b0 beeee956 f12e6656
	prefetcha [%i3+0x0e0]%asi,16
!	Mem[0000000015800008] = 0c4d0000, %l7 = 00000000594c2a38
	lduba	[%i3+%o6]0x80,%l7	! %l7 = 000000000000000c
	set	p1_b171,%o7
	fbge,a	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000030800010] = ffff00ff ffffaf25, %l2 = 95bbff02, %l3 = ffe37c00
	ldd	[%o1+0x010],%l2		! %l2 = 00000000ffff00ff 00000000ffffaf25
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x0ab,%g2
p1_b171:
!	Registers modified during the branch to p1_far_1
!	%l2  = be00000000000e42
	membar	#Sync			! Added by membar checker (322)
!	%l4 = 0000000000000049, %l6 = be00000000000000, %y  = ffffffff
	umulcc	%l4,%l6,%l3		! %l3 = 0000000000000000, %ccr = 44

p1_label_147:
!	Mem[00000000150001a0] = 1cc89a39 73bb9145 a252c440 3d513b5e
	prefetch [%i2+0x1a0],22
!	%l1 = fffffffffffff1be, immed = 00000cbf, %l5 = ffffffffffe9e3a6
	xorcc	%l1,0xcbf,%l5		! %l5 = fffffffffffffd01, %ccr = 88
!	%f22 = 00000000 00eb6ce8, %f10 = 416d6d9d 00000000
	fabsd	%f22,%f10		! %f10 = 00000000 00eb6ce8
	bg	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000015000170] = b8062c0f, %l0 = 0000000000000021
	ldsb	[%i2+0x172],%l0		! %l0 = 000000000000002c
p1_b172:

p1_label_148:
	membar	#Sync			! Added by membar checker (323)
!	Mem[0000000031000050] = ffffffff, %l7 = 000000000000000c
	ldsh	[%o2+0x050],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030000018] = 00000000, %l0 = 000000000000002c
	lduwa	[%o0+0x018]%asi,%l0	! %l0 = 0000000000000000
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000030800059] = ffffffff, %l3 = 0000000000000000
	ldstub	[%o1+0x059],%l3		! %l3 = 00000000000000ff
p1_b173:
	membar	#Sync			! Added by membar checker (324)
!	%f8  = fd327503 cb6b6ce8, %f28 = 7d327503 cb6b6ce8
	fmovd	%f8 ,%f28		! %f28 = fd327503 cb6b6ce8

p1_label_149:
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000030000013] = 95bbff02, %l6 = be00000000000000
	ldstub	[%o0+0x013],%l6		! Annulled
p1_b174:
	membar	#Sync			! Added by membar checker (325)
!	%l7 = ffffffffffffffff, %l0 = 0000000000000000, %l0 = 0000000000000000
	addc	%l7,%l0,%l0		! %l0 = ffffffffffffffff
!	Branch On Register, %l7 = ffffffffffffffff
	brz,a,pt %l7,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014000060] = 829dbdab b54e6e3b 6f1bc0a6 e49be709
	prefetch [%i0+0x060],2	! Annulled
p1_b175:

p1_label_150:
	membar	#Sync			! Added by membar checker (326)
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[0000000015000034] = f855a2e2, %l2 = be00000000000e42
	lduh	[%i2+0x034],%l2		! %l2 = 000000000000f855
!	Mem[00000000150001f0] = ff22c964, %l5 = fffffd01, %l6 = 00000000
	add	%i2,0x1f0,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 00000000ff22c964
!	Mem[0000000015800040] = 21002f89 f22323ec 82f85f6b 3e3672e4
	prefetcha [%i3+0x040]%asi,0
!	Mem[00000000140000c0] = dd9a3143 fe5210f7 86c41981 4f19b9c1
	prefetch [%i0+0x0c0],20

p1_label_151:
!	Mem[0000000031800016] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%o3+0x016]%asi,%l0	! %l0 = 0000000000000000
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800008] = 0c4d0000, %l5 = fffffffffffffd01
	ldsba	[%i3+%o6]0x80,%l5	! Annulled
p1_b176:
	membar	#Sync			! Added by membar checker (327)
!	Mem[00000000158001f0] = f3a18146, %l5 = fffffffffffffd01
	ldswa	[%i3+0x1f0]%asi,%l5	! %l5 = fffffffff3a18146
!	Mem[0000000030000054] = 00000021, %l4 = 0000000000000049
	lduh	[%o0+0x054],%l4		! %l4 = 0000000000000000

p1_label_152:
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000016000008] = a071fa34, %l0 = 0000000000000000
	lduha	[%i4+%o6]0x80,%l0	! Annulled
p1_b177:
	membar	#Sync			! Added by membar checker (328)
!	Mem[00000000148001a0] = 8b555ebe ac8e0453 d1e98eeb 72f5867f
	prefetcha [%i1+0x1a0]%asi,2
!	Mem[0000000031000010] = b4b12fbd, %l4 = 0000000000000000
	lduh	[%o2+0x010],%l4		! %l4 = 000000000000b4b1
!	%l7 = ffffffffffffffff, Mem[000000003180001c] = 00000000
	stw	%l7,[%o3+0x01c]		! Mem[000000003180001c] = ffffffff

p1_label_153:
!	Mem[0000000032000000] = 1f1cf2e7, %l0 = 0000000000000000
	lduwa	[%o4+0x000]%asi,%g2	! %g2 = 0000000000000000
!	Jump to jmpl_2, CWP = 0
	set	p1_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	Mem[000000003100001c] = eed87f2b, %l3 = 00000000000000ff
	lduh	[%o2+0x01e],%l3		! %l3 = 0000000000007f2b
!	Registers modified during the branch to p1_jmpl_2
!	%l2  = 0000000000000000
!	%l6  = ffffffffffa8e44a
!	%l7  = 0000000000cb4904
!	%l6 = ffffffffffa8e44a, %l5 = fffffffff3a18146, %l6 = ffffffffffa8e44a
	sra	%l6,%l5,%l6		! %l6 = fffffffffffea391
!	%l5 = fffffffff3a18146, immed = 00000350, %l2 = 0000000000000000
	addcc	%l5,0x350,%l2		! %l2 = fffffffff3a18496, %ccr = 88

p1_label_154:
!	%f16 = 4a69ed86 00000000, %f12 = 80000000 c0000000
	fnegd	%f16,%f12		! %f12 = ca69ed86 00000000
!	Mem[0000000014000000] = b4b12fbd, %l2 = fffffffff3a18496
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000b4b1
!	%l0 = 0000000000000000, Mem[0000000015800000] = ff50d97c
	stwa	%l0,[%i3+%g0]0x80	! Mem[0000000015800000] = 00000000
!	Jump to jmpl_3, CWP = 0
	set	p1_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	%l2 = 000000000000b4b1, Mem[0000000014000008] = 00000021
	stwa	%l2,[%i0+%o6]0x80	! Mem[0000000014000008] = 0000b4b1
!	Registers modified during the branch to p1_jmpl_3
!	%l2  = ffffffffff1c5fc4
!	%l3  = fffffffffffff1be
!	%l4  = 0000000012c7bdf7

p1_label_155:
!	%l5 = fffffffff3a18146, %l5 = fffffffff3a18146, %l1 = fffffffffffff1be
	sra	%l5,%l5,%l1		! %l1 = ffffffffffce8605
!	%l5 = fffffffff3a18146, Mem[0000000016800008] = b4b12ca1
	stba	%l5,[%i5+%o6]0x80	! Mem[0000000016800008] = 46b12ca1
!	%l1 = ffffffffffce8605, Mem[0000000015800152] = 47e26751
	stha	%l1,[%i3+0x152]%asi	! Mem[0000000015800150] = 47e28605
!	Branch On Register, %l6 = fffffffffffea391
	brz,pn	%l6,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000015800140] = ac22818fc5bcf845, %l3 = fffffffffffff1be
	ldx	[%i3+0x140],%l3		! %l3 = ac22818fc5bcf845
p1_b178:

p1_label_156:
	membar	#Sync			! Added by membar checker (329)
!	%l6 = fffffffffffea391
	setx	0x8a6805cf8a6805cf,%g7,%l6 ! %l6 = 8a6805cf8a6805cf
!	Branch On Register, %l2 = ffffffffff1c5fc4
	brgez,pn %l2,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000015000000] = 8686cd4a, %l4 = 0000000012c7bdf7
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 000000008686cd4a
p1_b179:
	membar	#Sync			! Added by membar checker (330)
!	Mem[0000000015000128] = 12c7bdf7 26d32f12, %l3 = ac22818fc5bcf845, %l2 = ffffffffff1c5fc4
	add	%i2,0x128,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 397e0d96d803dcc5
!	Mem[00000000148001c0] = 12c7bdf7 26d32f12, %l0 = 0000000000000000, %l1 = ffffffffffce8605
	add	%i1,0x1c0,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = fdc1ee6c993e9ca2

p1_label_157:
!	Mem[0000000032000028] = 537245c7b3b6f9b1, %l2 = 397e0d96d803dcc5
	ldx	[%o4+0x028],%g2		! %g2 = 537245c7b3b6f9b1
!	Mem[0000000032000070] = b24c7121, %l2 = 397e0d96d803dcc5
	ldsh	[%o4+0x070],%g2		! %g2 = ffffffffffffb24c
!	%l2 = d803dcc5, %l3 = c5bcf845, Mem[0000000015800018] = f96bc7cc 78a4be77
	stda	%l2,[%i3+0x018]%asi	! Mem[0000000015800018] = d803dcc5 c5bcf845
!	Mem[0000000015000000] = 12c7bdf7, %l2 = 397e0d96d803dcc5
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = 0000000012c7bdf7
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_158:
!	%l1 = fdc1ee6c993e9ca2, Mem[0000000031000052] = ffffffff
	sth	%l1,[%o2+0x052]		! Mem[0000000031000050] = ffff9ca2
p1_b180:
	membar	#Sync			! Added by membar checker (331)
!	Branch On Register, %l3 = ac22818fc5bcf845
	brnz,a,pn %l3,p1_b181		! Branch Taken
!	%l2 = 0000000012c7bdf7, Mem[0000000032000058] = 54998092142f1f51
	stx	%l2,[%o4+0x058]		! Mem[0000000032000058] = 0000000012c7bdf7
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x0b5,%g2
p1_b181:
	membar	#Sync			! Added by membar checker (332)
	set	p1_b182,%o7
	fbo,a,pn %fcc0,p1_near_2_he	! Branch Taken, %fcc0 = 0
!	%l6 = 8a6805cf8a6805cf, Mem[0000000014800008] = ffffffff
	stwa	%l6,[%i1+%o6]0x80	! Mem[0000000014800008] = 8a6805cf
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x0b6,%g2
p1_b182:
!	Registers modified during the branch to p1_near_2
!	%l1  = 1ac33902a2ae18cb
!	%l4  = 000000000000007f

p1_label_159:
	membar	#Sync			! Added by membar checker (333)
!	%f10 = 00000000, %f2  = 54d50204, %f8  = fd327503
	fdivs	%f10,%f2 ,%f8 		! %f8  = 00000000
!	%f8  = 00000000, %f31 = 00000000
	fcmpes	%fcc0,%f8 ,%f31		! %fcc0 = 0
	nop				! Delay added due to fcmp
	set	p1_b183,%o7
	fbug,pt	%fcc2,p1_near_3_he	! Branch Taken, %fcc2 = 2
!	Mem[0000000017000008] = 4fcbe1c6, %l4 = 000000000000007f
	ldsha	[%i6+%o6]0x80,%l4	! %l4 = 0000000000004fcb
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x0b7,%g2
p1_b183:
!	Registers modified during the branch to p1_near_3
!	%l4  = ffffffff80000000
	membar	#Sync			! Added by membar checker (334)
!	%f23 = 00eb6ce8, %f25 = 00000000, %f24 = c16d6d9d
	fsubs	%f23,%f25,%f24		! %f24 = 00eb6ce8

p1_label_160:
!	%l7 = 0000000000cb4904, %l5 = fffffffff3a18146, %l7 = 0000000000cb4904
	andncc	%l7,%l5,%l7		! %l7 = 00000000004a4800, %ccr = 00
!	Mem[0000000015000140] = 75884576 28bd60c7 9ece6b50 76b6ce85
	prefetcha [%i2+0x140]%asi,20
	set	p1_b184,%o7
	fbue,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	%l3 = ac22818fc5bcf845, Mem[0000000014800004] = e8b80800
	sth	%l3,[%i1+0x004]		! Mem[0000000014800004] = f8450800
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0b8,%g2
p1_b184:
	membar	#Sync			! Added by membar checker (335)
!	%l0 = 0000000000000000, %l4 = ffffffff80000000, %y  = 1ac33902
	smul	%l0,%l4,%l5		! %l5 = 0000000000000000

p1_label_161:
	bpos,a	p1_b185			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000014800000] = 0c4d0000 f8450800, %l6 = 8a6805cf, %l7 = 004a4800
	ldd	[%i1+0x000],%l6		! %l6 = 000000000c4d0000 00000000f8450800
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p1_branch_failed
	mov	0x0b9,%g2
p1_b185:
	membar	#Sync			! Added by membar checker (336)
!	Mem[0000000031000050] = ffff9ca2, %l4 = ffffffff80000000
	ldsha	[%o2+0x050]%asi,%l4	! %l4 = ffffffffffffffff
!	%l3 = ac22818fc5bcf845, Mem[000000001480011a] = 09cf7cd9
	stha	%l3,[%i1+0x11a]%asi	! Mem[0000000014800118] = 09cff845
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_162:
!	Mem[0000000014000008] = 0000b4b1, %l2 = 0000000012c7bdf7
	ldsba	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000
p1_b186:
	membar	#Sync			! Added by membar checker (337)
!	%l2 = 00000000, %l3 = c5bcf845, Mem[0000000031800058] = cd0dfe01 1e403769
	stda	%l2,[%o3+0x058]%asi	! Mem[0000000031800058] = 00000000 c5bcf845
!	%l5 = 0000000000000000, %l1 = 1ac33902a2ae18cb, %l5 = 0000000000000000
	xor	%l5,%l1,%l5		! %l5 = 1ac33902a2ae18cb
!	Mem[0000000030000010] = 95bbff02ffffffaf, %l4 = ffffffffffffffff
	ldxa	[%o0+0x010]%asi,%l4	! %l4 = 95bbff02ffffffaf
!	Mem[000000003200003c] = c74e0f0e, %l0 = 0000000000000000
	ldsha	[%o4+0x03c]%asi,%g2	! %g2 = ffffffffffffc74e

p1_label_163:
!	Mem[0000000015000000] = 12c7bdf7, %l1 = 1ac33902a2ae18cb
	lduha	[%i2+%g0]0x80,%l1	! %l1 = 00000000000012c7
!	%l3 = ac22818fc5bcf845, %l4 = 95bbff02ffffffaf, %l7 = 00000000f8450800
	sra	%l3,%l4,%l7		! %l7 = ffffffffffff8b79
!	%f14 = ff149318, %f26 = c02dadb3
	fmovs	%f14,%f26		! %f26 = ff149318
!	%f12 = ca69ed86, %f10 = 00000000, %f16 = 4a69ed86
	fadds	%f12,%f10,%f16		! %f16 = ca69ed86
!	%l4 = 95bbff02ffffffaf, immed = 0000000b, %l5 = 1ac33902a2ae18cb
	sll	%l4,0x00b,%l5		! %l5 = dff817fffffd7800

p1_label_164:
!	%l0 = 0000000000000000, %l6 = 000000000c4d0000, %l7 = ffffffffffff8b79
	xnorcc	%l0,%l6,%l7		! %l7 = fffffffff3b2ffff, %ccr = 88
!	%f13 = 00000000, %f16 = ca69ed86, %f17 = 00000000
	fsubs	%f13,%f16,%f17		! %f17 = 4a69ed86
!	%f10 = 00000000 00eb6ce8, %f18 = 6abc6fb5 5ce5c2f3
	fxtod	%f10,%f18		! %f18 = 416d6d9d 00000000
!	%l1 = 00000000000012c7, %l4 = 95bbff02ffffffaf, %l5 = dff817fffffd7800
	andcc	%l1,%l4,%l5		! %l5 = 0000000000001287, %ccr = 00
!	%l6 = 000000000c4d0000, %l4 = 95bbff02ffffffaf, %y  = 00000000
	udiv	%l6,%l4,%l7		! %l7 = 0000000000000000

p1_label_165:
	fblg,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = 0000000000000000, Mem[00000000158000bc] = 64721d99
	stw	%l7,[%i3+0x0bc]		! Annulled
p1_b187:
	membar	#Sync			! Added by membar checker (338)
!	Mem[0000000031800050] = e0d8d112, %l7 = 0000000000000000
	lduba	[%o3+0x050]%asi,%l7	! %l7 = 00000000000000e0
!	%f15 = 60000000, %f22 = 00000000 00eb6ce8
	fstod	%f15,%f22		! %f22 = 44000000 00000000
	fbue,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1

p1_label_166:
!	Mem[0000000015000178] = dc677a10 2fdf5ee4, %l6 = 0c4d0000, %l7 = 000000e0
	ldd	[%i2+0x178],%l6		! %l6 = 00000000dc677a10 000000002fdf5ee4
p1_b188:
	membar	#Sync			! Added by membar checker (339)
	set	p1_b189,%o7
	fba,a,pt %fcc0,p1_near_1_he	! Branch Taken, %fcc0 = 0
!	%l6 = 00000000dc677a10, Mem[0000000014800008] = 8a6805cf
	stba	%l6,[%i1+%o6]0x80	! Annulled
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p1_branch_failed
	mov	0x0bd,%g2
p1_b189:
!	Registers modified during the branch to p1_near_1
!	%l1  = 0000000000000000
!	%l4  = ffffffffffffffaf
!	%l6  = ac22818fc5bcf845
	membar	#Sync			! Added by membar checker (340)
!	%l5 = 0000000000001287, %l2 = 0000000000000000, %l1 = 0000000000000000
	orncc	%l5,%l2,%l1		! %l1 = ffffffffffffffff, %ccr = 88
!	%f18 = 416d6d9d 00000000, %f5  = c0000000
	fdtos	%f18,%f5 		! %f5  = 4b6b6ce8

p1_label_167:
!	%f8  = 00000000 cb6b6ce8, %f16 = ca69ed86 4a69ed86
	fxtod	%f8 ,%f16		! %f16 = 41e96d6d 9d000000
!	%f14 = ff149318, %f25 = 00000000
	fabss	%f14,%f25		! %f25 = 7f149318
!	%f16 = 41e96d6d 9d000000, %f18 = 416d6d9d 00000000
	fdtox	%f16,%f18		! %f18 = 00000000 cb6b6ce8
	set	p1_b190,%o7
	fbue,pt	%fcc0,p1_near_0_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000158001e0] = 55c02faf 8979b719 344eb6db b755607b
	prefetch [%i3+0x1e0],3
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x0be,%g2
p1_b190:
!	Registers modified during the branch to p1_near_0
!	%l1  = ac22818fc5bcf845
!	%l2  = ffffffffffffffff

p1_label_168:
	set	p1_b191,%o7
	fbe,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000030000058] = 40491200, %l6 = ac22818fc5bcf845
	ldsh	[%o0+0x058],%l6		! %l6 = 0000000000004049
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x0bf,%g2
p1_b191:
	membar	#Sync			! Added by membar checker (341)
!	Mem[00000000148001a0] = 8b555ebe ac8e0453 d1e98eeb 72f5867f
	prefetch [%i1+0x1a0],20
!	Mem[0000000017000008] = 4fcbe1c6, %l7 = 000000002fdf5ee4
	lduwa	[%i6+%o6]0x80,%l7	! %l7 = 000000004fcbe1c6
	fbn,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1

p1_label_169:
!	%l3 = ac22818fc5bcf845, Mem[0000000015000008] = 0c4d0000ffffff71
	stxa	%l3,[%i2+%o6]0x80	! Annulled
p1_b192:
	membar	#Sync			! Added by membar checker (342)
!	%l5 = 0000000000001287, Mem[0000000030800050] = 00000000
	stw	%l5,[%o1+0x050]		! Mem[0000000030800050] = 00001287
	set	p1_b193,%o7
	fbue	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetch [%o4+0x020],1
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x0c1,%g2
p1_b193:
!	Registers modified during the branch to p1_far_0
!	%l6  = 53dd7e703a4347f3
!	%l7  = fffffffffeb08a06
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 88

p1_label_170:
!	%l1 = ac22818fc5bcf845, Mem[0000000014800008] = 8a6805cf
	stba	%l1,[%i1+%o6]0x80	! Mem[0000000014800008] = 456805cf
p1_b194:
	membar	#Sync			! Added by membar checker (343)
!	%l4 = ffffffaf, %l5 = 00001287, Mem[00000000140000f0] = d1e22701 f3af3dbd
	stda	%l4,[%i0+0x0f0]%asi	! Mem[00000000140000f0] = ffffffaf 00001287
!	%f10 = 00000000 00eb6ce8, %f20 = fd327503 cb6b6ce8
	fmovd	%f10,%f20		! %f20 = 00000000 00eb6ce8
	fbug,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000015000000] = 12c7bdf7, %l2 = ffffffffffffffff
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000012
p1_b195:

p1_label_171:
	membar	#Sync			! Added by membar checker (344)
!	%l5 = 0000000000001287, immed = 00000019, %l0 = 0000000000000000
	srax	%l5,0x019,%l0		! %l0 = 0000000000000000
!	Branch On Register, %l4 = ffffffffffffffaf
	brnz,pt	%l4,p1_b196		! Branch Taken
!	Mem[0000000014000108] = f669aab1, %l1 = ac22818fc5bcf845
	ldsh	[%i0+0x10a],%l1		! %l1 = ffffffffffffaab1
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x0c4,%g2
p1_b196:
	membar	#Sync			! Added by membar checker (345)
!	%l4 = ffffffffffffffaf, Mem[0000000015000000] = 12c7bdf7fceb5394
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000015000000] = ffffffffffffffaf
!	Branch On Register, %l4 = ffffffffffffffaf
	brgz,a,pn %l4,p1_not_taken_0	! Branch Not Taken

p1_label_172:
!	Mem[0000000015800000] = 00000000, %l0 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l0	! Annulled
p1_b197:
	membar	#Sync			! Added by membar checker (346)
!	%l6 = 53dd7e703a4347f3, immed = 00000d35, %l5 = 0000000000001287
	xnorcc	%l6,0xd35,%l5		! %l5 = ac22818fc5bcb539, %ccr = 88
!	%l1 = ffffffffffffaab1, %l0 = 0000000000000000, %y  = 00000000
	smulcc	%l1,%l0,%l3		! %l3 = 0000000000000000, %ccr = 44
!	Mem[0000000030000014] = ffffffaf, %l0 = 0000000000000000
	ldsha	[%o0+0x016]%asi,%l0	! %l0 = ffffffffffffffaf
!	%l7 = fffffffffeb08a06, %l3 = 0000000000000000, %l5 = ac22818fc5bcb539
	xor	%l7,%l3,%l5		! %l5 = fffffffffeb08a06

p1_label_173:
!	%l7 = fffffffffeb08a06, Mem[000000001480002a] = 01df5020
	sth	%l7,[%i1+0x02a]		! Mem[0000000014800028] = 01df8a06
	bleu	p1_b198			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000014800060] = a0f51c34, %l2 = 0000000000000012
	swap	[%i1+0x060],%l2		! %l2 = 00000000a0f51c34
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x0c6,%g2
p1_b198:
	membar	#Sync			! Added by membar checker (347)
!	Mem[0000000014000008] = 0000b4b1, %l0 = ffffffffffffffaf
	ldsba	[%i0+%o6]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000032000000] = 1f1cf2e7 b4b124f0 00000000 00000000
	prefetcha [%o4+0x000]%asi,23

p1_label_174:
!	%f16 = 41e96d6d 9d000000, %f16 = 41e96d6d 9d000000
	fcmped	%fcc2,%f16,%f16		! %fcc2 = 0
!	Branch On Register, %l7 = fffffffffeb08a06
	brlz,a,pn %l7,p1_b199		! Branch Taken
!	%l0 = 0000000000000000, Mem[0000000015000088] = 4d0d5c20
	stw	%l0,[%i2+0x088]		! Mem[0000000015000088] = 00000000
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x0c7,%g2
p1_b199:
	membar	#Sync			! Added by membar checker (348)
!	%f28 = fd327503, %f18 = 00000000 cb6b6ce8
	fstod	%f28,%f18		! %f18 = c7a64ea0 60000000
!	Mem[0000000014800000] = 0c4d0000, %l2 = 00000000a0f51c34
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = 000000000c4d0000

p1_label_175:
!	%l2 = 000000000c4d0000, immed = 00000b6e, %l0 = 0000000000000000
	xor	%l2,0xb6e,%l0		! %l0 = 000000000c4d0b6e
	fbn,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[00000000158000b8] = 424bbe18 64721d99, %l6 = 3a4347f3, %l7 = feb08a06
	ldd	[%i3+0x0b8],%l6		! %l6 = 00000000424bbe18 0000000064721d99
p1_b200:
	membar	#Sync			! Added by membar checker (349)
!	%l0 = 000000000c4d0b6e, immed = 00000dfb, %y  = 00000000
	udiv	%l0,0xdfb,%l3		! %l3 = 000000000000e13e
!	%f29 = cb6b6ce8, %f25 = 7f149318
	fabss	%f29,%f25		! %f25 = 4b6b6ce8

p1_label_176:
!	%l2 = 000000000c4d0000, immed = fffff3f9, %l4 = ffffffffffffffaf
	or	%l2,-0xc07,%l4		! %l4 = fffffffffffff3f9
!	Branch On Register, %l3 = 000000000000e13e
	brgz,a,pt %l3,p1_b201		! Branch Taken
!	Mem[000000003100005b] = 000000f6, %l4 = fffffffffffff3f9
	ldstub	[%o2+0x05b],%l4		! %l4 = 00000000000000f6
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p1_branch_failed
	mov	0x0c9,%g2
p1_b201:
	fblg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001400004c] = 7f9f2b7e, %l4 = 00000000000000f6
	ldub	[%i0+0x04f],%l4		! Annulled
p1_b202:

p1_label_177:
	membar	#Sync			! Added by membar checker (350)
!	%l5 = fffffffffeb08a06, Mem[0000000031000018] = 00000000eed87f2b
	stxa	%l5,[%o2+0x018]%asi	! Mem[0000000031000018] = fffffffffeb08a06
	set	p1_b203,%o7
	fbo,a	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000000] = ffffffff, %l0 = 000000000c4d0b6e
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x0cb,%g2
p1_b203:
!	Registers modified during the branch to p1_far_0
!	%l6  = ffffffffbdb4a0d9
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (351)
!	Mem[0000000015000000] = ffffffff, %l1 = ffffffffffffaab1
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffffffff
	bne	p1_not_taken_0		! Branch Not Taken, %ccr = 44

p1_label_178:
!	Mem[0000000014000010] = 003a05a5, %l1 = 00000000ffffffff
	swap	[%i0+0x010],%l1		! %l1 = 00000000003a05a5
p1_b204:
	membar	#Sync			! Added by membar checker (352)
!	Mem[0000000030800058] = ffffffff, %l4 = 00000000000000f6
	ldsh	[%o1+0x05a],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000015800114] = 2e3bf293, %l4 = ffffffffffffffff
	ldsw	[%i3+0x114],%l4		! %l4 = 000000002e3bf293
!	%l1 = 00000000003a05a5, Mem[00000000148001c8] = f49ed11954782b50
	stx	%l1,[%i1+0x1c8]		! Mem[00000000148001c8] = 00000000003a05a5
!	Mem[0000000014800000] = 0c4d0000, %l5 = fffffffffeb08a06
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 000000000000000c

p1_label_179:
!	Mem[0000000015000110] = 0519da0f9f0cb1b8, %l0 = 00000000000000ff
	ldxa	[%i2+0x110]%asi,%l0	! %l0 = 0519da0f9f0cb1b8
!	%l4 = 000000002e3bf293, immed = 00000f1c, %y  = 00000000
	udivcc	%l4,0xf1c,%l2		! %l2 = 0000000000030f59, %ccr = 00
	set	p1_b205,%o7
	fbuge	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	%l3 = 000000000000e13e, Mem[000000001480019f] = 4314f6eb
	stb	%l3,[%i1+0x19f]		! Mem[000000001480019c] = 4314f63e
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x0cd,%g2
p1_b205:
	fbne	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_180:
!	%l0 = 0519da0f9f0cb1b8, Mem[0000000032000040] = d485d32d
	stw	%l0,[%o4+0x040]		! Mem[0000000032000040] = 9f0cb1b8
p1_b206:
	membar	#Sync			! Added by membar checker (353)
!	%l7 = 0000000000000000, immed = fffff5e6, %l0 = 0519da0f9f0cb1b8
	xnorcc	%l7,-0xa1a,%l0		! %l0 = 0000000000000a19, %ccr = 00
!	Mem[00000000148000f4] = 48bff4e9, %l1 = 003a05a5, %l5 = 0000000c
	add	%i1,0xf4,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 0000000048bff4e9
!	Mem[00000000140001a0] = d51f45c3 4c068eba 450fb721 598e1e79
	prefetch [%i0+0x1a0],23
!	%l3 = 000000000000e13e, Mem[00000000148000ac] = f51b9c89
	stw	%l3,[%i1+0x0ac]		! Mem[00000000148000ac] = 0000e13e

p1_label_181:
!	Mem[0000000031800054] = 020c630d, %l4 = 000000002e3bf293
	lduha	[%o3+0x054]%asi,%l4	! %l4 = 000000000000020c
!	%f20 = 00000000 00eb6ce8, %f12 = ca69ed86 00000000
	fnegd	%f20,%f12		! %f12 = 80000000 00eb6ce8
!	%l2 = 00030f59, %l3 = 0000e13e, Mem[00000000170000a8] = 138433a3 b958e1bf
	std	%l2,[%i6+0x0a8]	! Mem[00000000170000a8] = 00030f59 0000e13e
	fbe,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l4 = 0000020c, %l5 = 48bff4e9, Mem[0000000015800000] = 00000000 482c2ff3
	stda	%l4,[%i3+%g0]0x80	! Mem[0000000015800000] = 0000020c 48bff4e9
p1_b207:

p1_label_182:
	membar	#Sync			! Added by membar checker (354)
!	%f31 = 00000000, %f19 = 60000000, %f11 = 00eb6ce8
	fsubs	%f31,%f19,%f11		! %f11 = e0000000
	set	p1_b208,%o7
	fbge,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800008] = 0c4d0000, %l1 = 00000000003a05a5
	ldsba	[%i3+%o6]0x80,%l1	! %l1 = 000000000000000c
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p1_branch_failed
	mov	0x0d0,%g2
p1_b208:
!	Registers modified during the branch to p1_far_1
!	%l1  = ffffffffbdb4a888
!	%l2  = ffffffffbdb4a880
	membar	#Sync			! Added by membar checker (355)
!	%l1 = ffffffffbdb4a888, %l2 = ffffffffbdb4a880, %l7 = 0000000000000000
	sra	%l1,%l2,%l7		! %l7 = ffffffffbdb4a888
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_183:
!	%l2 = bdb4a880, %l3 = 0000e13e, Mem[0000000030800050] = 00001287 0004992c
	std	%l2,[%o1+0x050]	! Annulled
p1_b209:
	membar	#Sync			! Added by membar checker (356)
	set	p1_b210,%o7
	fbul,a,pt %fcc1,p1_near_2_le	! Branch Taken, %fcc1 = 1
!	Mem[00000000140001c0] = 02f738ba, %l0 = 0000000000000a19
	swap	[%i0+0x1c0],%l0		! %l0 = 0000000002f738ba
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p1_branch_failed
	mov	0x0d2,%g2
p1_b210:
!	Registers modified during the branch to p1_near_2
!	%l3  = 0000000040491200
!	%l4  = ef6d283640000000
!	%l5  = ffffffffbdb4a863
	membar	#Sync			! Added by membar checker (357)
!	Mem[0000000031800010] = 00000000 0000e13e, %l1 = ffffffffbdb4a888, %l7 = ffffffffbdb4a888
	add	%o3,0x10,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030000059] = 0000e13e, %l6 = ffffffffbdb4a0d9
	ldstub	[%o0+0x059],%l6		! %l6 = 0000000000000000

p1_label_184:
!	Mem[0000000030000018] = 00000000, %l0 = 0000000002f738ba
	lduw	[%o0+0x018],%l0		! %l0 = 0000000000000000
!	Mem[00000000160001f0] = 51a9e1ed, %l0 = 0000000000000000
	ldub	[%i4+0x1f3],%l0		! %l0 = 00000000000000ed
!	%l0 = 00000000000000ed, %l5 = ffffffffbdb4a863, %l3 = 0000000040491200
	addccc	%l0,%l5,%l3		! %l3 = ffffffffbdb4a950, %ccr = 88
	bneg,a	p1_b211			! Branch Taken, %ccr = 88, CWP = 0
!	%l6 = 00000000, %l7 = 0000ff00, Mem[00000000140000d0] = be28d452 f663e243
	std	%l6,[%i0+0x0d0]	! Mem[00000000140000d0] = 00000000 0000ff00
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x0d3,%g2
p1_b211:

p1_label_185:
	membar	#Sync			! Added by membar checker (358)
	set	p1_b212,%o7
	fbul,a,pn %fcc1,p1_near_1_le	! Branch Taken, %fcc1 = 1
!	%l0 = 00000000000000ed, Mem[0000000014800000] = 0c4d0000
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000014800000] = ed4d0000
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p1_branch_failed
	mov	0x0d4,%g2
p1_b212:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000000
!	%l3  = ffffffffbdb4a888
!	%l7  = ffffffffffffffe5
	membar	#Sync			! Added by membar checker (359)
	set	p1_b213,%o7
	fbo,pt	%fcc1,p1_near_0_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000014000108] = f669aab1, %l6 = 0000000000000000
	ldub	[%i0+0x10b],%l6		! %l6 = 00000000000000b1
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x0d5,%g2
p1_b213:
!	Registers modified during the branch to p1_near_0
!	%l1  = ffffffffbdb4a8b1
!	%l2  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (360)
!	%l4 = ef6d283640000000, immed = fffff0e1, %y  = 00000000
	sdiv	%l4,-0xf1f,%l1		! %l1 = fffffffffffbc47c

p1_label_186:
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015800008] = 0c4d0000, %l3 = ffffffffbdb4a888
	ldsba	[%i3+%o6]0x80,%l3	! %l3 = 000000000000000c
p1_b214:
	membar	#Sync			! Added by membar checker (361)
!	Mem[000000003100005d] = ffffaff7, %l4 = ef6d283640000000
	ldstub	[%o2+0x05d],%l4		! %l4 = 00000000000000ff
!	%l6 = 00000000000000b1, %l7 = ffffffffffffffe5, %l0 = 0000000000000000
	andncc	%l6,%l7,%l0		! %l0 = 0000000000000010, %ccr = 00
!	%f16 = 41e96d6d 9d000000, %f30 = 80000000 00000000, %f2  = 54d50204 efb09c26
	faddd	%f16,%f30,%f2 		! %f2  = 41e96d6d 9d000000

p1_label_187:
!	%l5 = ffffffffbdb4a863, immed = fffffa11, %l6 = 00000000000000b1
	sub	%l5,-0x5ef,%l6		! %l6 = ffffffffbdb4ae52
!	%l7 = ffffffffffffffe5, immed = 00000ca2, %l6 = ffffffffbdb4ae52
	orcc	%l7,0xca2,%l6		! %l6 = ffffffffffffffe7, %ccr = 88
!	Mem[0000000014800000] = ed4d0000, %l1 = fffffffffffbc47c
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 00000000ed4d0000
!	Mem[000000001580013d] = 95ae28d5, %l2 = ffffffffffffffff
	ldstuba	[%i3+0x13d]%asi,%l2	! %l2 = 00000000000000ae
!	%l4 = 00000000000000ff, immed = ffffff08, %l7 = ffffffffffffffe5
	andn	%l4,-0x0f8,%l7		! %l7 = 00000000000000f7

p1_label_188:
!	%f28 = fd327503, %f8  = 00000000
	fnegs	%f28,%f8 		! %f8  = 7d327503
	fbue,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[00000000140000a8] = 8bc2e89f, %l6 = ffffffffffffffe7
	ldsw	[%i0+0x0a8],%l6		! Annulled
p1_b215:
	membar	#Sync			! Added by membar checker (362)
!	Mem[0000000030000018] = 00000000, %l5 = ffffffffbdb4a863
	ldsw	[%o0+0x018],%l5		! %l5 = 0000000000000000
!	%f30 = 80000000 00000000, %f28 = fd327503 cb6b6ce8, %f2  = 41e96d6d 9d000000
	fmuld	%f30,%f28,%f2 		! %f2  = 00000000 00000000

p1_label_189:
!	Mem[0000000032000000] = 1f1cf2e7 b4b124f0 00000000 00000000
	prefetch [%o4+0x000],2
!	Mem[0000000014800160] = a0dad79a 64dcd75a e1d5b220 ffcbb893
	prefetch [%i1+0x160],22
!	%l0 = 0000000000000010, immed = fffff423, %l5 = 0000000000000000
	xorcc	%l0,-0xbdd,%l5		! %l5 = fffffffffffff433, %ccr = 88
!	Branch On Register, %l7 = 00000000000000f7
	brz,a,pn %l7,p1_not_taken_0	! Branch Not Taken
!	%l0 = 0000000000000010, Mem[000000003180001a] = 00000000
	stb	%l0,[%o3+0x01a]		! Annulled
p1_b216:

p1_label_190:
	membar	#Sync			! Added by membar checker (363)
!	Mem[0000000031000055] = fffffdff, %l5 = fffffffffffff433
	ldstuba	[%o2+0x055]%asi,%l5	! %l5 = 00000000000000ff
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 000000ae, %l3 = 0000000c, Mem[0000000031000018] = ffffffff feb08a06
	std	%l2,[%o2+0x018]	! Annulled
p1_b217:
	membar	#Sync			! Added by membar checker (364)
!	%l1 = 00000000ed4d0000, immed = 0000000e, %l7 = 00000000000000f7
	sll	%l1,0x00e,%l7		! %l7 = 00003b5340000000
	set	p1_b218,%o7
	fble	p1_far_0_le	! Branch Taken, %fcc0 = 0

p1_label_191:
!	%l1 = 00000000ed4d0000, Mem[0000000014000000] = b4b12fbd
	stha	%l1,[%i0+%g0]0x80	! Mem[0000000014000000] = 00002fbd
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p1_branch_failed
	mov	0x0da,%g2
p1_b218:
!	Registers modified during the branch to p1_far_0
!	%l2  = fffffffffffff8ac
!	%l3  = 0000000000000008
!	%l5  = 00000000220aff2d
!	%l6  = ffffffffffff67a0
	membar	#Sync			! Added by membar checker (365)
!	%f22 = 44000000 00000000, %f2  = 00000000 00000000
	fmovd	%f22,%f2 		! %f2  = 44000000 00000000
!	Mem[00000000158000a0] = 9b9b2934 92712b23 3c9bee83 5a6b02a0
	prefetch [%i3+0x0a0],0
!	%l4 = 00000000000000ff, %l6 = ffffffffffff67a0, %y  = ffffffff
	mulx	%l4,%l6,%l1		! %l1 = ffffffffff683860
	fbue,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 1

p1_label_192:
!	%l0 = 0000000000000010, Mem[0000000014800008] = 456805cf
	stba	%l0,[%i1+%o6]0x80	! Mem[0000000014800008] = 106805cf
p1_b219:
	membar	#Sync			! Added by membar checker (366)
!	%l7 = 00003b5340000000, immed = 00000e7f, %l6 = ffffffffffff67a0
	andcc	%l7,0xe7f,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Mem[00000000150001c8] = 9114beea, %l4 = 00000000000000ff
	lduwa	[%i2+0x1c8]%asi,%l4	! %l4 = 000000009114beea
!	%l3 = 0000000000000008, Mem[0000000031000050] = ffff9ca2
	stba	%l3,[%o2+0x050]%asi	! Mem[0000000031000050] = 08ff9ca2
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44

p1_label_193:
!	Mem[0000000014800020] = d862855a f5e16053 01df8a06 10d5ec93
	prefetch [%i1+0x020],20	! Annulled
p1_b220:
	membar	#Sync			! Added by membar checker (367)
!	%l1 = ffffffffff683860, Mem[0000000015800000] = 0000020c
	stba	%l1,[%i3+%g0]0x80	! Mem[0000000015800000] = 6000020c
!	%l5 = 00000000220aff2d, immed = 000002b1, %y  = ffffffff
	mulx	%l5,0x2b1,%l0		! %l0 = 0000005b9f98c81d
	fbug	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 0000005b9f98c81d, Mem[0000000014000148] = adc82a7d
	stb	%l0,[%i0+0x148]		! Mem[0000000014000148] = 1dc82a7d
p1_b221:

p1_label_194:
	membar	#Sync			! Added by membar checker (368)
!	%l0 = 0000005b9f98c81d, %l0 = 0000005b9f98c81d, %l3 = 0000000000000008
	srlx	%l0,%l0,%l3		! %l3 = 00000000000002dc
!	Mem[00000000148000e0] = 12c7bdf7 c5bcf845 39a2062b be00a75e
	prefetch [%i1+0x0e0],16
!	%l1 = ffffffffff683860, %l4 = 000000009114beea, %l1 = ffffffffff683860
	orncc	%l1,%l4,%l1		! %l1 = ffffffffffeb7975, %ccr = 88
!	%f18 = c7a64ea0 60000000, %f28 = fd327503 cb6b6ce8
	fabsd	%f18,%f28		! %f28 = 47a64ea0 60000000
!	%l5 = 00000000220aff2d, immed = 00000b11, %y  = ffffffff
	sdivcc	%l5,0xb11,%l5		! %l5 = ffffffffffebf174, %ccr = 88

p1_label_195:
	bleu,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l3 = 00000000000002dc, Mem[0000000015800050] = 12cdf6cbe3a9ce5e
	stx	%l3,[%i3+0x050]		! Annulled
p1_b222:
	membar	#Sync			! Added by membar checker (369)
!	Branch On Register, %l4 = 000000009114beea
	brlz,a,pn %l4,p1_not_taken_0	! Branch Not Taken
!	 Annulled
	ldd	[%o3+0x050],%l6
p1_b223:
	membar	#Sync			! Added by membar checker (370)
!	%l4 = 000000009114beea, %l5 = ffffffffffebf174, %y  = ffffffff
	sdivx	%l4,%l5,%l1		! %l1 = fffffffffffff8c5

p1_label_196:
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000014000108] = f669aab1, %l0 = 0000005b9f98c81d
	lduw	[%i0+0x108],%l0		! %l0 = 00000000f669aab1
p1_b224:
	membar	#Sync			! Added by membar checker (371)
!	Mem[0000000014000008] = 0000b4b1, %l5 = ffffffffffebf174
	ldsha	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000120] = a49b2644 307abe47 397e0d96 d803dcc5
	prefetch [%i2+0x120],4
p1_b225:

p1_label_197:
	membar	#Sync			! Added by membar checker (372)
!	%l3 = 00000000000002dc, immed = fffff761, %l4 = 000000009114beea
	add	%l3,-0x89f,%l4		! %l4 = fffffffffffffa3d
!	Mem[0000000016800008] = 46b12ca1, %l3 = 00000000000002dc
	lduha	[%i5+%o6]0x80,%l3	! %l3 = 00000000000046b1
!	%f16 = 41e96d6d 9d000000, %f22 = 44000000 00000000
	fcmpd	%fcc0,%f16,%f22		! %fcc0 = 1
!	%l6 = 0000000000000000, Mem[0000000030000050] = 00000000
	stwa	%l6,[%o0+0x050]%asi	! Mem[0000000030000050] = 00000000
!	Mem[0000000014800044] = 00000007, %l6 = 0000000000000000
	lduba	[%i1+0x044]%asi,%l6	! %l6 = 0000000000000000

p1_label_198:
	fbug,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000014000000] = 00002fbd, %l1 = fffffffffffff8c5
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
p1_b226:
	membar	#Sync			! Added by membar checker (373)
!	%l7 = 00003b5340000000, Mem[0000000014000000] = 00002fbd
	stba	%l7,[%i0+%g0]0x80	! Mem[0000000014000000] = 00002fbd
!	%l4 = fffffffffffffa3d, immed = fffff043, %y  = ffffffff
	smulcc	%l4,-0xfbd,%l3		! %l3 = 00000000005aadf7, %ccr = 00
!	Mem[0000000014800000] = fffbc47c f8450800 106805cf dd9d1ad5
	prefetcha [%i1+0x000]%asi,21

p1_label_199:
!	Mem[000000001400010c] = 00007fff, %l7 = 00003b5340000000
	ldstuba	[%i0+0x10c]%asi,%l7	! %l7 = 0000000000000000
	bge	p1_b227			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000030800010] = ffff00ff, %l3 = 00000000005aadf7
	ldsb	[%o1+0x010],%l3		! %l3 = ffffffffffffffff
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p1_branch_failed
	mov	0x0e3,%g2
p1_b227:
	membar	#Sync			! Added by membar checker (374)
!	%f5  = 4b6b6ce8, %f23 = 00000000
	fcmps	%fcc1,%f5 ,%f23		! %fcc1 = 2
!	%f31 = 00000000, %f16 = 41e96d6d 9d000000
	fstod	%f31,%f16		! %f16 = 00000000 00000000

p1_label_200:
!	%f20 = 00000000, %f10 = 00000000
	fitos	%f20,%f10		! %f10 = 00000000
	set	p1_b228,%o7
	fba,a,pn %fcc2,p1_near_3_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000014000000] = 00002fbd, %l3 = ffffffffffffffff
	ldsha	[%i0+%g0]0x80,%l3	! Annulled
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p1_branch_failed
	mov	0x0e4,%g2
p1_b228:
!	Registers modified during the branch to p1_near_3
!	%l3  = 0000000000000000
!	%l4  = 000000001311f159
!	%l6  = 00000000fffbc47c
!	%l7  = 00000000f8450800
	membar	#Sync			! Added by membar checker (375)
!	Mem[0000000015800000] = 6000020c, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000060
	fbn,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
	nop
p1_b229:
	nop

!	End of Random Code for Processor 1

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x004]		! Set processor 1 done flag

!	Check Registers

p1_check_registers:
	set	p1_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000f669aab1
	bne,a,pn %xcc,p1_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be fffffffffffff8ac
	bne,a,pn %xcc,p1_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000060
	bne,a,pn %xcc,p1_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000001311f159
	bne,a,pn %xcc,p1_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000fffbc47c
	bne,a,pn %xcc,p1_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000f8450800
	bne,a,pn %xcc,p1_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p1_check_fp_registers:
	set	p1_temp,%g1
	set	p1_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 00000000 e0000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 44000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 4b6b6ce8
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000001 efb09c26
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 7d327503 cb6b6ce8
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 e0000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 80000000 00eb6ce8
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ff149318 60000000
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
	cmp	%l0,%l1			! %f18 should be c7a64ea0 60000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00eb6ce8
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 44000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00eb6ce8 4b6b6ce8
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ff149318 a0000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 47a64ea0 60000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 80000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p1_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00002fbdffffff72
	ldx	[%i0+0x000],%g3		! Observed data at 0000000014000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000b4b100004658
	ldx	[%i0+0x008],%g3		! Observed data at 0000000014000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = ffffffffbe21e7c6
	ldx	[%i0+0x010],%g3		! Observed data at 0000000014000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x050],%g2		! Expect data = ffffffffffffffff
	ldx	[%i0+0x050],%g3		! Observed data at 0000000014000050
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 000000000000ff00
	ldx	[%i0+0x0d0],%g3		! Observed data at 00000000140000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = c3cd0021bce66cb0
	ldx	[%i0+0x0e8],%g3		! Observed data at 00000000140000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = ffffffaf00001287
	ldx	[%i0+0x0f0],%g3		! Observed data at 00000000140000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x100],%g2		! Expect data = 06a33a070000ffb1
	ldx	[%i0+0x100],%g3		! Observed data at 0000000014000100
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x108],%g2		! Expect data = f669aab100000000
	ldx	[%i0+0x108],%g3		! Observed data at 0000000014000108
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x138],%g2		! Expect data = ffffffff00004008
	ldx	[%i0+0x138],%g3		! Observed data at 0000000014000138
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x148],%g2		! Expect data = 1dc82a7df765becf
	ldx	[%i0+0x148],%g3		! Observed data at 0000000014000148
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x158],%g2		! Expect data = 61986b5061986b50
	ldx	[%i0+0x158],%g3		! Observed data at 0000000014000158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x1c0],%g2		! Expect data = 00000a19c7ee8923
	ldx	[%i0+0x1c0],%g3		! Observed data at 00000000140001c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1c0,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 0004273e2e980000
	ldx	[%i0+0x1f0],%g3		! Observed data at 00000000140001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f0,%g4

	set	p1_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = fffbc47cf8450800
	ldx	[%i1+0x000],%g3		! Observed data at 0000000014800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 106805cfdd9d1ad5
	ldx	[%i1+0x008],%g3		! Observed data at 0000000014800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 01df8a0610d5ec93
	ldx	[%i1+0x028],%g3		! Observed data at 0000000014800028
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 6e57a01100000007
	ldx	[%i1+0x040],%g3		! Observed data at 0000000014800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 00000012d843dd11
	ldx	[%i1+0x060],%g3		! Observed data at 0000000014800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x088],%g2		! Expect data = c9e7c65bacefaa84
	ldx	[%i1+0x088],%g3		! Observed data at 0000000014800088
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 9b25b80a0000e13e
	ldx	[%i1+0x0a8],%g3		! Observed data at 00000000148000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 1ba0859041277f4a
	ldx	[%i1+0x0d0],%g3		! Observed data at 00000000148000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 12c7bdf7c5bcf845
	ldx	[%i1+0x0e0],%g3		! Observed data at 00000000148000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 09cff845278f0b20
	ldx	[%i1+0x118],%g3		! Observed data at 0000000014800118
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x130],%g2		! Expect data = 000000000000007f
	ldx	[%i1+0x130],%g3		! Observed data at 0000000014800130
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x178],%g2		! Expect data = 488f2c43ffe31d0d
	ldx	[%i1+0x178],%g3		! Observed data at 0000000014800178
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x178,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 03491d4a4314f63e
	ldx	[%i1+0x198],%g3		! Observed data at 0000000014800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1c8],%g2		! Expect data = 00000000003a05a5
	ldx	[%i1+0x1c8],%g3		! Observed data at 00000000148001c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1c8,%g4

	set	p1_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ffffaab1ffffffaf
	ldx	[%i2+0x000],%g3		! Observed data at 0000000015000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0c4d0000ffffff71
	ldx	[%i2+0x008],%g3		! Observed data at 0000000015000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 010d5a5a00000519
	ldx	[%i2+0x050],%g3		! Observed data at 0000000015000050
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 0000000000000021
	ldx	[%i2+0x058],%g3		! Observed data at 0000000015000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 00000000ca3ae0cc
	ldx	[%i2+0x088],%g3		! Observed data at 0000000015000088
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 000000b1ffffffe5
	ldx	[%i2+0x0a8],%g3		! Observed data at 00000000150000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = fffffce278534db3
	ldx	[%i2+0x0c0],%g3		! Observed data at 00000000150000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 526de925636abe85
	ldx	[%i2+0x0e8],%g3		! Observed data at 00000000150000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x158],%g2		! Expect data = 0fc4b7ffa6609b55
	ldx	[%i2+0x158],%g3		! Observed data at 0000000015000158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x190],%g2		! Expect data = aff718e582b7dcb9
	ldx	[%i2+0x190],%g3		! Observed data at 0000000015000190
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = e164ff47e9dc7f50
	ldx	[%i2+0x1b0],%g3		! Observed data at 00000000150001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = 4b4e3d86a61e80bf
	ldx	[%i2+0x1b8],%g3		! Observed data at 00000000150001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1b8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 00000304c7f3c0a8
	ldx	[%i2+0x1f8],%g3		! Observed data at 00000000150001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff00020c48bff4e9
	ldx	[%i3+0x000],%g3		! Observed data at 0000000015800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0c4d0000000000f7
	ldx	[%i3+0x008],%g3		! Observed data at 0000000015800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = ff5b6598684f1dd3
	ldx	[%i3+0x010],%g3		! Observed data at 0000000015800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x018],%g2		! Expect data = d803dcc5c5bcf845
	ldx	[%i3+0x018],%g3		! Observed data at 0000000015800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = b13ace27000000b0
	ldx	[%i3+0x0e0],%g3		! Observed data at 00000000158000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 3f7ebf3fffffd4a5
	ldx	[%i3+0x108],%g3		! Observed data at 0000000015800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 9a4c786f0758ff30
	ldx	[%i3+0x128],%g3		! Observed data at 0000000015800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x138],%g2		! Expect data = 0920118495ff28d5
	ldx	[%i3+0x138],%g3		! Observed data at 0000000015800138
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x140],%g2		! Expect data = ac22818fc5bcf845
	ldx	[%i3+0x140],%g3		! Observed data at 0000000015800140
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x150],%g2		! Expect data = 47e28605337f1851
	ldx	[%i3+0x150],%g3		! Observed data at 0000000015800150
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x158],%g2		! Expect data = 06dbd1efe407100f
	ldx	[%i3+0x158],%g3		! Observed data at 0000000015800158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = fffffbaf00b095fd
	ldx	[%i3+0x1d0],%g3		! Observed data at 00000000158001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 344eb6dbb755607b
	ldx	[%i3+0x1e8],%g3		! Observed data at 00000000158001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1e8,%g4

	set	p1_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ffffffff0000594c
	ldx	[%i4+0x000],%g3		! Observed data at 0000000016000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 728734cd08fe1953
	ldx	[%i4+0x1a8],%g3		! Observed data at 00000000160001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1a8,%g4

	set	p1_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff000000483566fc
	ldx	[%i5+0x000],%g3		! Observed data at 0000000016800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 46b12ca100000000
	ldx	[%i5+0x008],%g3		! Observed data at 0000000016800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 6e2114f19a6d2319
	ldx	[%i5+0x098],%g3		! Observed data at 0000000016800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x098,%g4

	set	p1_local6_expect,%g1
	ldx	[%g1+0x0a8],%g2		! Expect data = 00030f590000e13e
	ldx	[%i6+0x0a8],%g3		! Observed data at 00000000170000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a8,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p1_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p1_memcheck_share0:
	ldx	[%g4+0x10],%g2	! Expected value = 95bbff02ffffffaf
	ldx	[%o0+0x10],%g3	! Read value at Mem[0000000030000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 00000000ffffb276
	ldx	[%o0+0x18],%g3	! Read value at Mem[0000000030000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 0000000000000021
	ldx	[%o0+0x50],%g3	! Read value at Mem[0000000030000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 00ffe13edbff0009
	ldx	[%o0+0x58],%g3	! Read value at Mem[0000000030000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p1_memcheck_share1:
	ldx	[%g4+0x10],%g2	! Expected value = ffff00ffffffaf25
	ldx	[%o1+0x10],%g3	! Read value at Mem[0000000030800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 000000000000000c
	ldx	[%o1+0x18],%g3	! Read value at Mem[0000000030800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 000012870004992c
	ldx	[%o1+0x50],%g3	! Read value at Mem[0000000030800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = ffffffff636dc5d1
	ldx	[%o1+0x58],%g3	! Read value at Mem[0000000030800058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p1_memcheck_share2:
	ldx	[%g4+0x10],%g2	! Expected value = b4b12fbd0000b1ff
	ldx	[%o2+0x10],%g3	! Read value at Mem[0000000031000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = fffffffffeb08a06
	ldx	[%o2+0x18],%g3	! Read value at Mem[0000000031000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 08ff9ca2fffffdff
	ldx	[%o2+0x50],%g3	! Read value at Mem[0000000031000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 000000ffffffaff7
	ldx	[%o2+0x58],%g3	! Read value at Mem[0000000031000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p1_memcheck_share3:
	ldx	[%g4+0x10],%g2	! Expected value = 000000000000ff00
	ldx	[%o3+0x10],%g3	! Read value at Mem[0000000031800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 0000000000030f59
	ldx	[%o3+0x18],%g3	! Read value at Mem[0000000031800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = e0d8d112020c630d
	ldx	[%o3+0x50],%g3	! Read value at Mem[0000000031800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 00000000020cf845
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
	stb	%l0,[%i0+0x1d3]		! Mem[00000000140001d3]
	addc	%l2,%l7,%l4
	ldsb	[%i1+0x0dd],%l2		! Mem[00000000148000dd]
	ldsw	[%i3+0x198],%l7		! Mem[0000000015800198]
	done

p1_trap1o:
	stb	%l0,[%o0+0x1d3]		! Mem[00000000140001d3]
	addc	%l2,%l7,%l4
	ldsb	[%o1+0x0dd],%l2		! Mem[00000000148000dd]
	ldsw	[%o3+0x198],%l7		! Mem[0000000015800198]
	done


p1_trap2e:
	ldd	[%i2+0x130],%l0		! Mem[0000000015000130]
	addcc	%l5,-0x510,%l0
	nop
	xnor	%l0,-0x744,%l2
	done

p1_trap2o:
	ldd	[%o2+0x130],%l0		! Mem[0000000015000130]
	addcc	%l5,-0x510,%l0
	nop
	xnor	%l0,-0x744,%l2
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
	ldx	[%g1+0x000],%l0	! %l0 = 1ed2de0028404de8
	ldx	[%g1+0x008],%l1	! %l1 = f42ffbffaacb7dba
	ldx	[%g1+0x010],%l2	! %l2 = a883c8ff8608d576
	ldx	[%g1+0x018],%l3	! %l3 = 6740a1ffd03b43a8
	ldx	[%g1+0x020],%l4	! %l4 = 1eef5c007ae95f34
	ldx	[%g1+0x028],%l5	! %l5 = a68f8cffcae8058e
	ldx	[%g1+0x030],%l6	! %l6 = 6ec379ff82b7dcb9
	ldx	[%g1+0x038],%l7	! %l7 = d2d051007a043d92

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
	ldd	[%g1+0x00],%f0		! %f0  = 64685f4b, %f1  = 7b238876
	ldd	[%g1+0x08],%f2		! %f2  = b3efeb7c, %f3  = 8115a924
	ldd	[%g1+0x10],%f4		! %f4  = 35d8ee6c, %f5  = 4a04b5ea
	ldd	[%g1+0x18],%f6		! %f6  = 95d070f1, %f7  = b41f7767
	ldd	[%g1+0x20],%f8		! %f8  = 9c7efa8b, %f9  = affdbcb8
	ldd	[%g1+0x28],%f10		! %f10 = e819b5d5, %f11 = 409e7894
	ldd	[%g1+0x30],%f12		! %f12 = b6726aeb, %f13 = 5b4c8290
	ldd	[%g1+0x38],%f14		! %f14 = acb202e2, %f15 = f3ff9ba1
	ldd	[%g1+0x40],%f16		! %f16 = 990e4d26, %f17 = 893d05b5
	ldd	[%g1+0x48],%f18		! %f18 = e082a653, %f19 = 95732f11
	ldd	[%g1+0x50],%f20		! %f20 = 263dbc5b, %f21 = 0f9001f8
	ldd	[%g1+0x58],%f22		! %f22 = 73ef9cca, %f23 = 356c9db1
	ldd	[%g1+0x60],%f24		! %f24 = 6ce9c22b, %f25 = 4db3aa32
	ldd	[%g1+0x68],%f26		! %f26 = 49fda2d3, %f27 = e0c73091
	ldd	[%g1+0x70],%f28		! %f28 = eaa89486, %f29 = 05bff6dc
	ldd	[%g1+0x78],%f30		! %f30 = 0cd58137, %f31 = 55b44316
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 2

p2_label_1:
	membar	#Sync			! Added by membar checker (376)
!	Mem[00000000188001a0] = 2ebbef9f 9b3c6ba8 2149af03 cbc56675
	prefetch [%i1+0x1a0],2
!	%l0 = a6ae89ffbde5880a, immed = 00000b86, %y  = 00000000
	udivx	%l0,0xb86,%l2		! %l2 = 000e76ef56956cf4
!	%l0 = a6ae89ffbde5880a, %l6 = 83614affe7d392ee, %l5 = ed4e8c0032e95ab4
	andncc	%l0,%l6,%l5		! %l5 = 248e810018240800, %ccr = 00
!	%l7 = dba10f00390120e7, Mem[0000000018000188] = 663f3095
	stwa	%l7,[%i0+0x188]%asi	! Mem[0000000018000188] = 390120e7
!	%l0 = a6ae89ffbde5880a, %l7 = dba10f00390120e7, %l0 = a6ae89ffbde5880a
	orncc	%l0,%l7,%l0		! %l0 = a6fef9ffffffdf1a, %ccr = 88

p2_label_2:
!	%l4 = e49d9bff8bffed76, %l6 = 83614affe7d392ee, %l0 = a6fef9ffffffdf1a
	orncc	%l4,%l6,%l0		! %l0 = fc9fbfff9bffed77, %ccr = 88
!	%f2  = b3efeb7c, %f1  = 7b238876, %f28 = eaa89486 05bff6dc
	fsmuld	%f2 ,%f1 ,%f28		! %f28 = c5f3285a 748d6500
	set	p2_b1,%o7
	fbuge,a	p2_far_3_le	! Branch Taken, %fcc0 = 0
!	%l4 = e49d9bff8bffed76, Mem[0000000019000000] = 6eb559c2045d4189
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = e49d9bff8bffed76
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x001,%g2
p2_b1:
!	Registers modified during the branch to p2_far_3
!	%l0  = 212e40ffb423f577
!	%l4  = e5bfdbffbffffd77
	membar	#Sync			! Added by membar checker (377)
!	Mem[0000000018000008] = 6191a7da 580b62a2, %l0 = b423f577, %l1 = 379fb61d
	ldd	[%i0+0x008],%l0		! %l0 = 000000006191a7da 00000000580b62a2

p2_label_3:
!	%l4 = e5bfdbffbffffd77, Mem[000000001a0001a0] = 2f31dd3c3b5a36ed
	stxa	%l4,[%i4+0x1a0]%asi	! Mem[000000001a0001a0] = e5bfdbffbffffd77
!	%l6 = 83614affe7d392ee, immed = 0000058a, %l7 = dba10f00390120e7
	subccc	%l6,0x58a,%l7		! %l7 = 83614affe7d38d64, %ccr = 88
!	Mem[0000000030800068] = 0a5a619e, %l2 = 000e76ef56956cf4
	swap	[%o1+0x068],%l2		! %l2 = 000000000a5a619e
!	Mem[00000000188001e0] = 490b4342 36d98a66 d99cd4a4 5114acd5
	prefetch [%i1+0x1e0],22
!	Mem[000000003080006c] = d0490d14, %l7 = 83614affe7d38d64
	swapa	[%o1+0x06c]%asi,%l7	! %l7 = 00000000d0490d14

p2_label_4:
!	Mem[00000000188000cf] = 9ba2a44a, %l5 = 248e810018240800
	ldstuba	[%i1+0x0cf]%asi,%l5	! %l5 = 000000000000004a
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018000008] = 6191a7da, %l6 = 83614affe7d392ee
	lduwa	[%i0+%o6]0x80,%l6	! %l6 = 000000006191a7da
p2_b2:
	membar	#Sync			! Added by membar checker (378)
	set	p2_b3,%o7
	fbge,pn	%fcc2,p2_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000018800000] = 837ae20c, %l3 = b4f8a70071ff9a60
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffff83
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x003,%g2
p2_b3:
!	Registers modified during the branch to p2_near_2
!	%l1  = e5bfdbffbffffd71

p2_label_5:
	membar	#Sync			! Added by membar checker (379)
!	%f6  = 95d070f1 b41f7767, %f4  = 35d8ee6c 4a04b5ea
	fmovd	%f6 ,%f4 		! %f4  = 95d070f1 b41f7767
!	%l4 = e5bfdbffbffffd77, immed = 00000c55, %l7 = 00000000d0490d14
	andcc	%l4,0xc55,%l7		! %l7 = 0000000000000c55, %ccr = 00
	set	p2_b4,%o7
	fbue,a,pt %fcc1,p2_near_1_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000030000068] = bfe0e6ab, %l0 = 000000006191a7da
	lduw	[%o0+0x068],%l0		! %l0 = 00000000bfe0e6ab
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x004,%g2
p2_b4:
!	Registers modified during the branch to p2_near_1
!	%l0  = 00000000000000b4
!	%l5  = 00000000000000ab
	bvc,a	p2_b5			! Branch Taken, %ccr = 00, CWP = 0

p2_label_6:
!	Mem[0000000019000008] = f56784a2 d17fefff, %l4 = bffffd77, %l5 = 000000ab
	ldda	[%i2+%o6]0x80,%l4	! %l4 = 00000000f56784a2 00000000d17fefff
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x005,%g2
p2_b5:
	bpos	p2_b6			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000019800000] = dec927b4, %l3 = ffffffffffffff83
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000de
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x006,%g2
p2_b6:
	membar	#Sync			! Added by membar checker (380)
!	Mem[00000000190000bc] = 44d4cc94, %l7 = 0000000000000c55
	lduha	[%i2+0x0bc]%asi,%l7	! %l7 = 00000000000044d4
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_7:
!	Mem[000000001980007c] = bb39d2f7, %l2 = 000000000a5a619e
	swap	[%i3+0x07c],%l2		! Annulled
p2_b7:
	membar	#Sync			! Added by membar checker (381)
!	%l5 = 00000000d17fefff, immed = 00000ac7, %y  = 00000000
	smul	%l5,0xac7,%l7		! %l7 = fffffe0ad9d38539
!	%l1 = e5bfdbffbffffd71, immed = fffffde9, %y  = fffffe0a
	udiv	%l1,-0x217,%l0		! %l0 = 00000000ffffffff
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l4 = f56784a2, %l5 = d17fefff, Mem[000000001a000008] = db8e7850 45742be0
	stda	%l4,[%i4+%o6]0x80	! Mem[000000001a000008] = f56784a2 d17fefff
p2_b8:

p2_label_8:
	membar	#Sync			! Added by membar checker (382)
!	Mem[0000000030000020] = c60f75a3, %l5 = 00000000d17fefff
	lduw	[%o0+0x020],%l5		! %l5 = 00000000c60f75a3
!	Mem[0000000019000000] = e49d9bff, %l7 = fffffe0ad9d38539
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 000000000000e49d
!	%f16 = 990e4d26, %f16 = 990e4d26, %f4  = 95d070f1
	fsubs	%f16,%f16,%f4 		! %f4  = 00000000
!	%l1 = e5bfdbffbffffd71, %l4 = 00000000f56784a2, %y  = fffffe0a
	sdivcc	%l1,%l4,%l6		! %l6 = 0000000000002f4e, %ccr = 00
!	%l0 = 00000000ffffffff, %l4 = 00000000f56784a2, %y  = fffffe0a
	udivcc	%l0,%l4,%l6		! %l6 = 00000000ffffffff, %ccr = 0a

p2_label_9:
	fbn,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l2 = 0a5a619e, %l3 = 000000de, Mem[0000000019000008] = f56784a2 d17fefff
	stda	%l2,[%i2+%o6]0x80	! Annulled
p2_b9:
	membar	#Sync			! Added by membar checker (383)
	nop
!	%l3 = 00000000000000de, Mem[0000000031000068] = 370d28e70d2cf3fe
	stxa	%l3,[%o2+0x068]%asi	! Mem[0000000031000068] = 00000000000000de
!	%f31 = 55b44316, %f4  = 00000000 b41f7767
	fstox	%f31,%f4 		! %f4  = 00001688 62c00000

p2_label_10:
	set	p2_b10,%o7
	fbuge,a	p2_far_3_he	! Branch Taken, %fcc0 = 0
!	%l6 = 00000000ffffffff, Mem[0000000019000038] = b32681279d7e048e
	stx	%l6,[%i2+0x038]		! Mem[0000000019000038] = 00000000ffffffff
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x00a,%g2
p2_b10:
!	Registers modified during the branch to p2_far_3
!	%l0  = fffffffffffff4f2
!	%l3  = ffffffffffff1c41
!	%l5  = 0378000000000000
	membar	#Sync			! Added by membar checker (384)
!	Mem[00000000198001e0] = eaba4551 07e065b6 1ba3182d 2d6f293a
	prefetcha [%i3+0x1e0]%asi,4
!	Branch On Register, %l2 = 000000000a5a619e
	brlez,pt %l2,p2_not_taken_0	! Branch Not Taken
!	Mem[000000001b000000] = a938917f, %l0 = fffffffffffff4f2
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 000000000000a938
p2_b11:

p2_label_11:
	membar	#Sync			! Added by membar checker (385)
!	%l3 = ffffffffffff1c41, immed = 0000001d, %l1 = e5bfdbffbffffd71
	sll	%l3,0x01d,%l1		! %l1 = ffffe38820000000
	set	p2_b12,%o7
	fbe	p2_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000018800008] = 475c4c98 a5c01cca, %l4 = f56784a2, %l5 = 00000000
	ldda	[%i1+%o6]0x80,%l4	! %l4 = 00000000475c4c98 00000000a5c01cca
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x00c,%g2
p2_b12:
!	Registers modified during the branch to p2_far_3
!	%l0  = fffffffffffffcfa
!	%l3  = fffffffffffe37a4
!	%l5  = 0400000000000000
	membar	#Sync			! Added by membar checker (386)
	fbne,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031000060] = ab82d4aa, %l1 = ffffe38820000000
	swap	[%o2+0x060],%l1		! %l1 = 00000000ab82d4aa
p2_b13:

p2_label_12:
	membar	#Sync			! Added by membar checker (387)
!	%l0 = fffffffffffffcfa, immed = fffff999, %l3 = fffffffffffe37a4
	andn	%l0,-0x667,%l3		! %l3 = 0000000000000462
!	Branch On Register, %l1 = 00000000ab82d4aa
	brlz,pt	%l1,p2_not_taken_0	! Branch Not Taken
!	Mem[000000003000006f] = 56c40f6c, %l1 = 00000000ab82d4aa
	ldstub	[%o0+0x06f],%l1		! %l1 = 000000000000006c
p2_b14:
	ble	p2_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000018000140] = ca4975eb df1718e5 b74ffb54 384473cf
	prefetch [%i0+0x140],1
p2_b15:

p2_label_13:
	set	p2_b16,%o7
	fble	p2_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000008] = 6191a7da, %l6 = 00000000ffffffff
	ldstuba	[%i0+%o6]0x80,%l6	! %l6 = 0000000000000061
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x010,%g2
p2_b16:
!	Registers modified during the branch to p2_far_2
!	%l0  = 0000008c40000000
!	%l3  = 00000000000000eb
!	%l5  = 040000000000012d
	membar	#Sync			! Added by membar checker (388)
	fbn,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 000000000a5a619e, Mem[0000000019000130] = 630da7abab862dac
	stx	%l2,[%i2+0x130]		! Mem[0000000019000130] = 000000000a5a619e
p2_b17:
	membar	#Sync			! Added by membar checker (389)
	set	p2_b18,%o7
	fbue,pn	%fcc3,p2_near_3_he	! Branch Taken, %fcc3 = 0

p2_label_14:
!	Mem[000000003100006e] = 000000de, %l5 = 040000000000012d
	ldstub	[%o2+0x06e],%l5		! %l5 = 0000000000000000
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x012,%g2
p2_b18:
!	Registers modified during the branch to p2_near_3
!	%l3  = 0000000000000000
	membar	#Sync			! Added by membar checker (390)
!	%f3  = 8115a924, %f3  = 8115a924, %f12 = b6726aeb
	fadds	%f3 ,%f3 ,%f12		! %f12 = 8195a924
	bleu	p2_b19			! Branch Taken, %ccr = 13, CWP = 0
!	%l2 = 000000000a5a619e, Mem[0000000031000028] = b68c44bcd1404c8a
	stx	%l2,[%o2+0x028]		! Mem[0000000031000028] = 000000000a5a619e
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x013,%g2
p2_b19:
	bneg	p2_not_taken_0		! Branch Not Taken, %ccr = 13

p2_label_15:
!	Mem[0000000018000008] = ff91a7da, %l1 = 000000000000006c
	lduba	[%i0+%o6]0x80,%l1	! %l1 = 00000000000000ff
p2_b20:
	membar	#Sync			! Added by membar checker (391)
!	%l1 = 00000000000000ff, %l2 = 000000000a5a619e, %l4 = 00000000475c4c98
	add	%l1,%l2,%l4		! %l4 = 000000000a5a629d
!	Mem[0000000019000000] = e49d9bff, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 00000000e49d9bff
	bleu,a	p2_b21			! Branch Taken, %ccr = 13, CWP = 0
!	Mem[0000000031000064] = ba15f9a5, %l0 = 0000008c40000000
	ldub	[%o2+0x066],%l0		! %l0 = 00000000000000f9
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x015,%g2
p2_b21:

p2_label_16:
!	Jump to jmpl_2, CWP = 0
	set	p2_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000019800000] = dec927b4, %l1 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000dec9
!	Registers modified during the branch to p2_jmpl_2
!	%l1  = 0000000000000003
!	%l4  = 00000000000001f3
	membar	#Sync			! Added by membar checker (392)
!	%f3  = 8115a924, %f12 = 8195a924, %f30 = 0cd58137
	fdivs	%f3 ,%f12,%f30		! %f30 = 3f000000
!	Mem[0000000018000178] = 709a7634, %l4 = 000001f3, %l2 = 0a5a619e
	add	%i0,0x178,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000709a7634
!	%l3 = 0000000000000000, %l0 = 00000000000000f9, %y  = 00000000
	smulcc	%l3,%l0,%l1		! %l1 = 0000000000000000, %ccr = 44

p2_label_17:
!	%f14 = acb202e2 f3ff9ba1, %f16 = 990e4d26 893d05b5
	fcmpd	%fcc0,%f14,%f16		! %fcc0 = 1
!	%l3 = 0000000000000000, Mem[0000000032000012] = d8b759ba
	stha	%l3,[%o4+0x012]%asi	! Mem[0000000032000010] = 000059ba
!	%l0 = 00000000000000f9, %l4 = 00000000000001f3, %l0 = 00000000000000f9
	addccc	%l0,%l4,%l0		! %l0 = 00000000000002ec, %ccr = 00
!	%l1 = 0000000000000000, Mem[000000004000003a] = 160f3a08
	stha	%l1,[%o5+0x03a]%asi	! Mem[0000000040000038] = 160f0000
	fbuge,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_18:
!	Mem[000000003100002d] = 0a5a619e, %l5 = 00000000e49d9bff
	ldstub	[%o2+0x02d],%l5		! Annulled
p2_b22:
	membar	#Sync			! Added by membar checker (393)
!	%l6 = 0000000000000061
	setx	0xd9a1d59dd9a1d59d,%g7,%l6 ! %l6 = d9a1d59dd9a1d59d
	set	p2_b23,%o7
	fba,pn	%fcc1,p2_near_2_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000018000018] = 92e00c61, %l7 = 000000000000e49d
	ldsw	[%i0+0x018],%l7		! %l7 = ffffffff92e00c61
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x017,%g2
p2_b23:
!	Registers modified during the branch to p2_near_2
!	%l0  = 0000000000000030
!	%l5  = ffffffffffea96cc
!	%l6  = ffffffff92caa32d
	membar	#Sync			! Added by membar checker (394)
!	Mem[0000000030800064] = 6589b4b1, %l0 = 0000000000000030
	lduba	[%o1+0x067]%asi,%l0	! %l0 = 00000000000000b1

p2_label_19:
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[0000000019000000] = e49d9bff, %l5 = ffffffffffea96cc
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffe49d
p2_b24:
	membar	#Sync			! Added by membar checker (395)
!	%l6 = ffffffff92caa32d, Mem[000000001900016c] = 5a259353
	stha	%l6,[%i2+0x16c]%asi	! Mem[000000001900016c] = a32d9353
!	%l0 = 00000000000000b1, %l4 = 00000000000001f3, %l1 = 0000000000000000
	addccc	%l0,%l4,%l1		! %l1 = 00000000000002a5, %ccr = 00
!	Mem[0000000018000100] = 75c9df71 bb4fddb2
	flush	%i0+0x100

p2_label_20:
!	Mem[00000000190000e0] = 4ea47fb9 a337ddb4 43fa14f0 a8df0b2f
	prefetcha [%i2+0x0e0]%asi,4
!	Mem[0000000019000170] = bbfc5100af846a4c, %l7 = ffffffff92e00c61
	ldxa	[%i2+0x170]%asi,%l7	! %l7 = bbfc5100af846a4c
!	Mem[0000000018800000] = 837ae20c 50a6603d 475c4c98 a5c01cca
	prefetcha [%i1+0x000]%asi,23
!	%l5 = ffffffffffffe49d, %l6 = ffffffff92caa32d, %l6 = ffffffff92caa32d
	andn	%l5,%l6,%l6		! %l6 = 000000006d354490
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 00

p2_label_21:
!	%l3 = 0000000000000000, Mem[0000000018800008] = 475c4c98
	stba	%l3,[%i1+%o6]0x80	! Mem[0000000018800008] = 005c4c98
p2_b25:
	membar	#Sync			! Added by membar checker (396)
!	%l0 = 00000000000000b1, immed = 00000e3e, %l5 = ffffffffffffe49d
	subccc	%l0,0xe3e,%l5		! %l5 = fffffffffffff273, %ccr = 99
!	%f29 = 748d6500, %f4  = 00001688
	fnegs	%f29,%f4 		! %f4  = f48d6500
!	%l7 = bbfc5100af846a4c, %l5 = fffffffffffff273, %l0 = 00000000000000b1
	sub	%l7,%l5,%l0		! %l0 = bbfc5100af8477d9
	nop

p2_label_22:
!	Mem[000000003180006a] = 0a5a629d, %l5 = fffffffffffff273
	ldstuba	[%o3+0x06a]%asi,%l5	! %l5 = 0000000000000062
	fbg,pn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000040000038] = 160f0000, %l3 = 0000000000000000
	ldsw	[%o5+0x038],%l3		! %l3 = 00000000160f0000
p2_b26:
	membar	#Sync			! Added by membar checker (397)
!	%f0  = 64685f4b, %f18 = e082a653 95732f11
	fstod	%f0 ,%f18		! %f18 = 448d0be9 60000000
!	%l0 = bbfc5100af8477d9, immed = fffff060, %l4 = 00000000000001f3
	xnor	%l0,-0xfa0,%l4		! %l4 = bbfc5100af847846

p2_label_23:
	bcs,a	p2_b27			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[000000003200000c] = a4685005, %l2 = 00000000709a7634
	lduw	[%o4+0x00c],%g2		! %g2 = 00000000709a7634
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x01b,%g2
p2_b27:
	membar	#Sync			! Added by membar checker (398)
!	%l7 = bbfc5100af846a4c, Mem[0000000018000008] = ff91a7da
	stba	%l7,[%i0+%o6]0x80	! Mem[0000000018000008] = 4c91a7da
!	%f7  = b41f7767, %f16 = 990e4d26 893d05b5
	fstod	%f7 ,%f16		! %f16 = be83eeec e0000000
!	Mem[00000000198000c4] = 2429057c, %l7 = bbfc5100af846a4c
	ldsb	[%i3+0x0c4],%l7		! %l7 = 0000000000000024

p2_label_24:
	set	p2_b28,%o7
	fble,pn	%fcc3,p2_near_3_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000018000120] = 4961c0fa fe0d57a6 d49167a8 1bf1fe47
	prefetch [%i0+0x120],20
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x01c,%g2
p2_b28:
!	Registers modified during the branch to p2_near_3
!	%l3  = 0000000000000062
	bvc,a	p2_b29			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000019800000] = dec927b467494200, %l2 = 00000000709a7634
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = dec927b467494200
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x01d,%g2
p2_b29:
	membar	#Sync			! Added by membar checker (399)
!	%l2 = dec927b467494200, immed = 00000006, %l2 = dec927b467494200
	sra	%l2,0x006,%l2		! %l2 = 00000000019d2508

p2_label_25:
!	Mem[0000000018000000] = 6fe39f6f, %l2 = 00000000019d2508
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 000000006fe39f6f
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = 0000000000000024, Mem[0000000019800000] = dec927b4
	stha	%l7,[%i3+%g0]0x80	! Annulled
p2_b30:
	bneg	p2_b31			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000019800000] = dec927b4, %l7 = 0000000000000024
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000dec9
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x01f,%g2
p2_b31:

p2_label_26:
	membar	#Sync			! Added by membar checker (400)
!	Branch On Register, %l1 = 00000000000002a5
	brgez,a,pt %l1,p2_b32		! Branch Taken
!	Mem[0000000018800008] = 005c4c98, %l4 = bbfc5100af847846
	swapa	[%i1+%o6]0x80,%l4	! %l4 = 00000000005c4c98
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x020,%g2
p2_b32:
	membar	#Sync			! Added by membar checker (401)
	set	p2_b33,%o7
	fbue,a,pn %fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000032000058] = 54998092142f1f51, %l6 = 000000006d354490
	ldx	[%o4+0x058],%g2		! %g2 = 54998092142f1f51
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x021,%g2
p2_b33:
!	Registers modified during the branch to p2_near_0
!	%l1  = 000000000000012c
!	%l3  = 00000000005c3cb5
!	%l7  = 00000000005c476e
	membar	#Sync			! Added by membar checker (402)
!	%l2 = 000000006fe39f6f, immed = fffff769, %y  = 0000012c
	sdivx	%l2,-0x897,%l2		! %l2 = fffffffffff2f969

p2_label_27:
	set	p2_b34,%o7
	fbue,pn	%fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 0
!	%l0 = bbfc5100af8477d9, Mem[0000000018800008] = af847846
	stha	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = 77d97846
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x022,%g2
p2_b34:
!	Registers modified during the branch to p2_near_2
!	%l0  = 0000000000504808
!	%l5  = fffffffc0a26aa60
!	%l6  = fffffffc0a82f1ce
	membar	#Sync			! Added by membar checker (403)
!	Mem[0000000019000120] = f6f00ad4 cb4e7510, %l2 = fff2f969, %l3 = 005c3cb5
	ldda	[%i2+0x120]%asi,%l2	! %l2 = 00000000f6f00ad4 00000000cb4e7510
!	%l4 = 00000000005c4c98, %l6 = fffffffc0a82f1ce, %l5 = fffffffc0a26aa60
	srax	%l4,%l6,%l5		! %l5 = 0000000000000171
	ba,a	p2_b35			! Branch Taken, %ccr = 80, CWP = 0

p2_label_28:
!	Mem[0000000019800188] = d1265475, %l5 = 0000000000000171
	ldub	[%i3+0x188],%l5		! Annulled
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x023,%g2
p2_b35:
	set	p2_b36,%o7
	fbne,a	p2_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000018800020] = 18071128 43532833 11c79e3c 209ff49a
	prefetch [%i1+0x020],1
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x024,%g2
p2_b36:
!	Registers modified during the branch to p2_far_1
!	%l0  = 26165f336b712ae3
!	%l1  = 00000000000008b6
!	%l3  = 00f6f00ad4000000
!	%l5  = 00000000f6f00cb7
	membar	#Sync			! Added by membar checker (404)
!	%l5 = 00000000f6f00cb7, immed = 00000008, %l4 = 00000000005c4c98
	srl	%l5,0x008,%l4		! %l4 = 0000000000f6f00c
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00

p2_label_29:
!	%l3 = 00f6f00ad4000000, Mem[0000000019800008] = 98067e8c
	stwa	%l3,[%i3+%o6]0x80	! Annulled
p2_b37:
	membar	#Sync			! Added by membar checker (405)
!	%l2 = 00000000f6f00ad4, %l3 = 00f6f00ad4000000, %y  = 0000012c
	smul	%l2,%l3,%l1		! %l1 = 018ebe2390000000
!	%l6 = fffffffc0a82f1ce
	sethi	%hi(0xfac7a400),%l6	! %l6 = 00000000fac7a400
!	Mem[000000001a800040] = fb8eee77 dca1a58c b9b87587 b1916db2
	prefetcha [%i5+0x040]%asi,4
!	Mem[00000000190000e0] = 4ea47fb9, %l0 = 26165f336b712ae3
	ldsba	[%i2+0x0e3]%asi,%l0	! %l0 = ffffffffffffffb9

p2_label_30:
!	%l3 = 00f6f00ad4000000, %l5 = 00000000f6f00cb7, %l7 = 00000000005c476e
	andn	%l3,%l5,%l7		! %l7 = 00f6f00a00000000
!	%l0 = ffffffffffffffb9, %l4 = 0000000000f6f00c, %l6 = 00000000fac7a400
	or	%l0,%l4,%l6		! %l6 = ffffffffffffffbd
!	Mem[0000000031000060] = 20000000, %l3 = 00f6f00ad4000000
	ldub	[%o2+0x063],%l3		! %l3 = 0000000000000000
!	%l5 = 00000000f6f00cb7, immed = fffff3db, %y  = 018ebe23
	sdivx	%l5,-0xc25,%l3		! %l3 = ffffffffffebaab1
!	Mem[0000000019000160] = cb8fcaf5 ea3d17f1 83922a0b a32d9353
	prefetcha [%i2+0x160]%asi,1

p2_label_31:
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetcha [%o4+0x040]%asi,3
!	Mem[0000000030800060] = bbc0b6c2, %l6 = ffffffffffffffbd
	swapa	[%o1+0x060]%asi,%l6	! %l6 = 00000000bbc0b6c2
	fbne,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000003080006c] = e7d38d64, %l7 = 00f6f00a00000000
	ldsb	[%o1+0x06e],%l7		! Annulled
p2_b38:
	membar	#Sync			! Added by membar checker (406)
!	Mem[0000000030800068] = 56956cf4e7d38d64, %l2 = 00000000f6f00ad4
	ldx	[%o1+0x068],%l2		! %l2 = 56956cf4e7d38d64

p2_label_32:
!	Mem[000000001880015a] = cd21f72e, %l5 = 00000000f6f00cb7
	ldstub	[%i1+0x15a],%l5		! %l5 = 00000000000000f7
!	Branch On Register, %l5 = 00000000000000f7
	brlez,a,pn %l5,p2_not_taken_0	! Branch Not Taken
!	%l4 = 0000000000f6f00c, Mem[0000000030800026] = 80f46d80
	sth	%l4,[%o1+0x026]		! Annulled
p2_b39:
	membar	#Sync			! Added by membar checker (407)
!	%l0 = ffffffffffffffb9, %l1 = 018ebe2390000000, %l5 = 00000000000000f7
	srl	%l0,%l1,%l5		! %l5 = 00000000ffffffb9
	set	p2_b40,%o7
	fba,a,pt %fcc0,p2_near_0_le	! Branch Taken, %fcc0 = 1

p2_label_33:
!	Mem[0000000031000020] = 82009ce0fb5dcc98, %l5 = 00000000ffffffb9
	ldx	[%o2+0x020],%l5		! Annulled
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x028,%g2
p2_b40:
!	Registers modified during the branch to p2_near_0
!	%l1  = 00000000018ebe28
!	%l3  = 0000000000f6e029
!	%l7  = 0000000000f6eae3
	membar	#Sync			! Added by membar checker (408)
!	Mem[00000000190001a0] = 97726b00, %l0 = ffffffffffffffb9
	ldswa	[%i2+0x1a0]%asi,%l0	! %l0 = ffffffff97726b00
!	Jump to jmpl_1, CWP = 0
	set	p2_jmpl_1_he,%g1
	jmpl	%g1,%g6
!	Mem[00000000188000d0] = daf1b634, %l1 = 00000000018ebe28
	ldsh	[%i1+0x0d0],%l1		! %l1 = ffffffffffffdaf1
!	Registers modified during the branch to p2_jmpl_1
!	%l6  = a96a930b182c5795
!	%f18 = 448d0be9 60000000, %f18 = 448d0be9 60000000, %f30 = 3f000000 55b44316
	faddd	%f18,%f18,%f30		! %f30 = 449d0be9 60000000

p2_label_34:
!	Mem[0000000019800160] = 2667b258 4d63bf0c 2b406102 9085f665
	prefetcha [%i3+0x160]%asi,20
!	Mem[00000000190001c0] = 1f89361c f182e5de 79695c48 32dc5dd0
	prefetcha [%i2+0x1c0]%asi,23
!	Mem[00000000188001ac] = cbc56675, %l4 = 0000000000f6f00c
	ldsh	[%i1+0x1ac],%l4		! %l4 = ffffffffffffcbc5
!	%l5 = 00000000ffffffb9, %l5 = 00000000ffffffb9, %y  = 018ebe23
	umul	%l5,%l5,%l1		! %l1 = ffffff72000013b1
!	Mem[0000000019800008] = 98067e8c, %l5 = 00000000ffffffb9
	lduha	[%i3+%o6]0x80,%l5	! %l5 = 0000000000009806

p2_label_35:
	fbul,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000019800080] = 5cbafed0 d18273b4 7faa41c4 815a7c39
	prefetch [%i3+0x080],22	! Annulled
p2_b41:
	membar	#Sync			! Added by membar checker (409)
!	%l6 = a96a930b182c5795
	sethi	%hi(0xe246f400),%l6	! %l6 = 00000000e246f400
!	%l7 = 0000000000f6eae3, %l0 = ffffffff97726b00, %l0 = ffffffff97726b00
	addc	%l7,%l0,%l0		! %l0 = ffffffff986955e3
!	%l4 = ffffffffffffcbc5, %l6 = 00000000e246f400, %l0 = ffffffff986955e3
	andcc	%l4,%l6,%l0		! %l0 = 00000000e246c000, %ccr = 08

p2_label_36:
!	%l2 = 56956cf4e7d38d64, immed = fffff15b, %y  = ffffff72
	udiv	%l2,-0xea5,%l1		! %l1 = 00000000ffffffff
!	%l1 = 00000000ffffffff, immed = 00000ed5, %y  = ffffff72
	sdiv	%l1,0xed5,%l6		! %l6 = fffffffff67e5922
!	%l0 = 00000000e246c000, %l6 = fffffffff67e5922, %y  = ffffff72
	umul	%l0,%l6,%l3		! %l3 = d9dfaa1b26258000
!	%f8  = 9c7efa8b affdbcb8, %f8  = 9c7efa8b affdbcb8, %f28 = c5f3285a 748d6500
	fsubd	%f8 ,%f8 ,%f28		! %f28 = 00000000 00000000
!	%l3 = d9dfaa1b26258000, %l7 = 0000000000f6eae3, %l7 = 0000000000f6eae3
	sllx	%l3,%l7,%l7		! %l7 = 312c000000000000

p2_label_37:
	set	p2_b42,%o7
	fble	p2_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000018000008] = 4c91a7da, %l4 = ffffffffffffcbc5
	swapa	[%i0+%o6]0x80,%l4	! %l4 = 000000004c91a7da
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x02a,%g2
p2_b42:
!	Registers modified during the branch to p2_far_0
!	%l3  = ffffffffffffff7a
!	%l7  = fffffffff67e5900
	membar	#Sync			! Added by membar checker (410)
!	Mem[0000000019800180] = 05fb285a 330ebde3 d1265475 f8ab097b
	prefetch [%i3+0x180],0
!	%f25 = 4db3aa32, %f13 = 5b4c8290, %f2  = b3efeb7c 8115a924
	fsmuld	%f25,%f13,%f2 		! %f2  = 4531f0e8 2aa40400
!	%l7 = fffffffff67e5900, immed = 00000022, %l2 = 56956cf4e7d38d64
	sllx	%l7,0x022,%l2		! %l2 = d9f9640000000000

p2_label_38:
!	Mem[0000000031800068] = 0a5aff9d3ad39e73, %l7 = fffffffff67e5900
	ldxa	[%o3+0x068]%asi,%l7	! %l7 = 0a5aff9d3ad39e73
!	%l5 = 0000000000009806
	sethi	%hi(0x29056000),%l5	! %l5 = 0000000029056000
!	%f4  = f48d6500, %f23 = 356c9db1
	fcmps	%fcc3,%f4 ,%f23		! %fcc3 = 1
!	%l6 = fffffffff67e5922, %l5 = 0000000029056000, %l7 = 0a5aff9d3ad39e73
	orncc	%l6,%l5,%l7		! %l7 = fffffffff6fedfff, %ccr = 88
!	Mem[00000000188001cc] = ee96c5f2, %l1 = 00000000ffffffff
	swapa	[%i1+0x1cc]%asi,%l1	! %l1 = 00000000ee96c5f2

p2_label_39:
!	%l0 = 00000000e246c000, immed = fffffe4e, %l2 = d9f9640000000000
	subccc	%l0,-0x1b2,%l2		! %l2 = 00000000e246c1b2, %ccr = 19
!	%f28 = 00000000, %f24 = 6ce9c22b, %f24 = 6ce9c22b 4db3aa32
	fsmuld	%f28,%f24,%f24		! %f24 = 00000000 00000000
	fbn,a,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l0 = e246c000, %l1 = ee96c5f2, Mem[0000000031000020] = 82009ce0 fb5dcc98
	std	%l0,[%o2+0x020]	! Annulled
p2_b43:
	membar	#Sync			! Added by membar checker (411)
!	Mem[0000000019800100] = 4d89b0f5 0c6ea1c2 1859c052 524c55f5
	prefetcha [%i3+0x100]%asi,21

p2_label_40:
!	Mem[0000000019800020] = af401f04 5f339e15 8cfd205a 7e7bf6c5
	prefetch [%i3+0x020],21
!	Mem[0000000030000060] = 00000024, %l4 = 4c91a7da, %l0 = e246c000
	add	%o0,0x60,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000000000024
!	%l4 = 000000004c91a7da, %l1 = 00000000ee96c5f2, %l4 = 000000004c91a7da
	orcc	%l4,%l1,%l4		! %l4 = 00000000ee97e7fa, %ccr = 08
!	Mem[0000000031000020] = 82009ce0fb5dcc98, %l5 = 0000000029056000
	ldx	[%o2+0x020],%l5		! %l5 = 82009ce0fb5dcc98
!	%l4 = 00000000ee97e7fa, %l0 = 0000000000000024, %l0 = 0000000000000024
	sub	%l4,%l0,%l0		! %l0 = 00000000ee97e7d6

p2_label_41:
!	%l3 = ffffffffffffff7a, immed = 00000309, %l5 = 82009ce0fb5dcc98
	subc	%l3,0x309,%l5		! %l5 = fffffffffffffc71
	bcc	p2_b44			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[000000001b000008] = a174e808, %l0 = 00000000ee97e7d6
	ldswa	[%i6+%o6]0x80,%l0	! %l0 = ffffffffa174e808
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x02c,%g2
p2_b44:
	membar	#Sync			! Added by membar checker (412)
!	Mem[00000000188000c0] = f8a1f8de aa5ca3a0 ff4944e9 9ba2a4ff
	prefetch [%i1+0x0c0],23
!	Mem[00000000180000c0] = 02c22151 590139dd 49c0d1b4 8d4ed2ec
	prefetcha [%i0+0x0c0]%asi,2

p2_label_42:
!	Branch On Register, %l3 = ffffffffffffff7a
	brlez,pn %l3,p2_b45		! Branch Taken
!	Mem[0000000031800068] = 0a5aff9d 3ad39e73, %l4 = ee97e7fa, %l5 = fffffc71
	ldd	[%o3+0x068],%l4		! %l4 = 000000000a5aff9d 000000003ad39e73
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x02d,%g2
p2_b45:
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l6 = fffffffff67e5922, Mem[000000001a000008] = f56784a2d17fefff
	stxa	%l6,[%i4+%o6]0x80	! Mem[000000001a000008] = fffffffff67e5922
p2_b46:
	ble	p2_b47			! Branch Taken, %ccr = 08, CWP = 0

p2_label_43:
!	Mem[000000001a000108] = 7707a95d81bf4877, %l3 = ffffffffffffff7a
	ldx	[%i4+0x108],%l3		! %l3 = 7707a95d81bf4877
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x02f,%g2
p2_b47:
	membar	#Sync			! Added by membar checker (413)
!	%l6 = fffffffff67e5922, immed = 000007a2, %y  = d9dfaa1b
	smul	%l6,0x7a2,%l7		! %l7 = ffffffb770645584
!	%f6  = 95d070f1 b41f7767, %f24 = 00000000 00000000, %f6  = 95d070f1 b41f7767
	fsubd	%f6 ,%f24,%f6 		! %f6  = 95d070f1 b41f7767
!	Mem[000000003200001c] = 7b5dd384, %l1 = 00000000ee96c5f2
	lduw	[%o4+0x01c],%g2		! %g2 = 00000000ee96c5f2
!	%f12 = 8195a924 5b4c8290, %f30 = 449d0be9 60000000
	fcmped	%fcc2,%f12,%f30		! %fcc2 = 1

p2_label_44:
!	Mem[0000000019000000] = e49d9bff, %l6 = fffffffff67e5922
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffe49d
!	%f29 = 00000000, %f29 = 00000000
	fcmpes	%fcc0,%f29,%f29		! %fcc0 = 0
!	%l4 = 000000000a5aff9d, immed = fffff25f, %l6 = ffffffffffffe49d
	xnor	%l4,-0xda1,%l6		! %l6 = 000000000a5af23d
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l3 = 7707a95d81bf4877, Mem[0000000019000008] = f56784a2d17fefff
	stxa	%l3,[%i2+%o6]0x80	! Annulled
p2_b48:

p2_label_45:
	membar	#Sync			! Added by membar checker (414)
!	Mem[0000000030000023] = c60f75a3, %l5 = 000000003ad39e73
	ldstub	[%o0+0x023],%l5		! %l5 = 00000000000000a3
!	Mem[00000000190000e0] = 4ea47fb9 a337ddb4 43fa14f0 a8df0b2f
	prefetch [%i2+0x0e0],22
!	%l5 = 00000000000000a3, immed = fffffa67, %l0 = ffffffffa174e808
	xorcc	%l5,-0x599,%l0		! %l0 = fffffffffffffac4, %ccr = 88
!	%l6 = 000000000a5af23d, immed = fffff130, %y  = ffffffb7
	mulx	%l6,-0xed0,%l2		! %l2 = ffffff669cdbd870
!	%l4 = 000000000a5aff9d, immed = fffff136, %y  = ffffffb7
	umul	%l4,-0xeca,%l4		! %l4 = 0a5aff03da37b81e

p2_label_46:
!	%l7 = ffffffb770645584, Mem[0000000019000133] = 00000000
	stb	%l7,[%i2+0x133]		! Mem[0000000019000130] = 00000084
	bcc,a	p2_b49			! Branch Taken, %ccr = 88, CWP = 0
!	%l2 = 9cdbd870, %l3 = 81bf4877, Mem[0000000031000060] = 20000000 ba15f9a5
	std	%l2,[%o2+0x060]	! Mem[0000000031000060] = 9cdbd870 81bf4877
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x031,%g2
p2_b49:
	bvc	p2_b50			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000018800008] = 77d97846, %l0 = fffffffffffffac4
	ldsba	[%i1+%o6]0x80,%l0	! %l0 = 0000000000000077
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x032,%g2
p2_b50:

p2_label_47:
	membar	#Sync			! Added by membar checker (415)
	fbn,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019800098] = e94d88a8, %l1 = 00000000ee96c5f2
	swap	[%i3+0x098],%l1		! %l1 = 00000000e94d88a8
p2_b51:
	membar	#Sync			! Added by membar checker (416)
!	%l4 = 0a5aff03da37b81e, immed = fffffe79, %l7 = ffffffb770645584
	subc	%l4,-0x187,%l7		! %l7 = 0a5aff03da37b9a5
!	%f30 = 449d0be9 60000000, %f4  = f48d6500 62c00000
	fabsd	%f30,%f4 		! %f4  = 449d0be9 60000000
	bleu	p2_not_taken_0		! Branch Not Taken, %ccr = 88

p2_label_48:
!	Mem[0000000019800118] = 1b617115, %l6 = 000000000a5af23d
	swap	[%i3+0x118],%l6		! %l6 = 000000001b617115
p2_b52:
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018800008] = 77d97846a5c01cca, %l0 = 0000000000000077
	ldxa	[%i1+%o6]0x80,%l0	! %l0 = 77d97846a5c01cca
p2_b53:
	membar	#Sync			! Added by membar checker (417)
!	%f24 = 00000000 00000000, %f0  = 64685f4b 7b238876
	fdtox	%f24,%f0 		! %f0  = 00000000 00000000
	be	p2_not_taken_0		! Branch Not Taken, %ccr = 88

p2_label_49:
!	Mem[00000000180000b4] = 56f302bb, %l1 = 00000000e94d88a8
	ldub	[%i0+0x0b4],%l1		! %l1 = 0000000000000056
p2_b54:
	membar	#Sync			! Added by membar checker (418)
	set	p2_b55,%o7
	fba,pn	%fcc3,p2_near_1_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000018000000] = 6fe39f6f, %l5 = 00000000000000a3
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 000000000000006f
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x037,%g2
p2_b55:
!	Registers modified during the branch to p2_near_1
!	%l0  = 00000000000000ff
!	%l5  = 000000000000009c
	membar	#Sync			! Added by membar checker (419)
!	Mem[0000000019800014] = 4183553f, %l3 = 7707a95d81bf4877
	lduh	[%i3+0x014],%l3		! %l3 = 0000000000004183
	set	p2_b56,%o7
	fbge	p2_far_0_he	! Branch Taken, %fcc0 = 0

p2_label_50:
!	%l4 = 0a5aff03da37b81e, Mem[0000000018800008] = 77d97846
	stwa	%l4,[%i1+%o6]0x80	! Mem[0000000018800008] = da37b81e
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x038,%g2
p2_b56:
	membar	#Sync			! Added by membar checker (420)
!	%f28 = 00000000 00000000, %f10 = e819b5d5
	fdtoi	%f28,%f10		! %f10 = 00000000
!	Mem[0000000018000008] = ffffcbc5, %l0 = 00000000000000ff
	lduha	[%i0+%o6]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030800020] = 647becc380f46d80, %l1 = 0000000000000056
	ldxa	[%o1+0x020]%asi,%l1	! %l1 = 647becc380f46d80
!	%l2 = 9cdbd870, %l3 = 00004183, Mem[0000000031800028] = 4bc00135 94c52a06
	stda	%l2,[%o3+0x028]%asi	! Mem[0000000031800028] = 9cdbd870 00004183

p2_label_51:
!	%l5 = 000000000000009c, immed = 000002ca, %y  = 0a5aff03
	umul	%l5,0x2ca,%l7		! %l7 = 000000000001b318
!	%f6  = 95d070f1, %f24 = 00000000 00000000
	fitod	%f6 ,%f24		! %f24 = c1da8be3 c3c00000
!	%f1  = 00000000, %f13 = 5b4c8290, %f1  = 00000000
	fmuls	%f1 ,%f13,%f1 		! %f1  = 00000000
!	Mem[0000000018800140] = 882d8548 90b0b362 9e86f040 1df9c71f
	prefetch [%i1+0x140],1
!	Mem[00000000188000a0] = e74c7e41 5d5b1646 a7866d8e 7ce2619e
	prefetcha [%i1+0x0a0]%asi,21

p2_label_52:
!	%l6 = 1b617115, %l7 = 0001b318, Mem[00000000190000f0] = 5cddde6a fc3deb64
	stda	%l6,[%i2+0x0f0]%asi	! Mem[00000000190000f0] = 1b617115 0001b318
!	%l4 = 0a5aff03da37b81e, %l2 = ffffff669cdbd870, %l3 = 0000000000004183
	srl	%l4,%l2,%l3		! %l3 = 000000000000da37
!	Branch On Register, %l0 = 000000000000ffff
	brgz,pt	%l0,p2_b57		! Branch Taken
!	Mem[0000000018800008] = da37b81ea5c01cca, %l4 = 0a5aff03da37b81e
	ldxa	[%i1+%o6]0x80,%l4	! %l4 = da37b81ea5c01cca
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x039,%g2
p2_b57:
	set	p2_b58,%o7
	fbue	p2_far_3_le	! Branch Taken, %fcc0 = 0

p2_label_53:
!	%l4 = a5c01cca, %l5 = 0000009c, Mem[0000000018800000] = 837ae20c 50a6603d
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000018800000] = a5c01cca 0000009c
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x03a,%g2
p2_b58:
!	Registers modified during the branch to p2_far_3
!	%l0  = 000000000001009b
!	%l4  = da37b81ea5c11cdb
	membar	#Sync			! Added by membar checker (421)
!	Mem[0000000018000008] = ffffcbc5, %l6 = 000000001b617115
	ldsba	[%i0+%o6]0x80,%l6	! %l6 = ffffffffffffffff
	set	p2_b59,%o7
	fbuge	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000019000064] = eb7d1a02, %l2 = ffffff669cdbd870
	lduw	[%i2+0x064],%l2		! %l2 = 00000000eb7d1a02
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x03b,%g2
p2_b59:
!	Registers modified during the branch to p2_far_0
!	%l3  = ffffffffffffffff
!	%l7  = fffffffffffff9cd
	bgu,a	p2_b60			! Branch Taken, %ccr = 88, CWP = 0

p2_label_54:
!	%l4 = da37b81ea5c11cdb, Mem[0000000019000000] = e49d9bff
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = db9d9bff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x03c,%g2
p2_b60:
	membar	#Sync			! Added by membar checker (422)
!	%f30 = 449d0be9, %f29 = 00000000
	fnegs	%f30,%f29		! %f29 = c49d0be9
	set	p2_b61,%o7
	fble,a	p2_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018800000] = a5c01cca, %l7 = fffffffffffff9cd
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = ffffffffa5c01cca
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x03d,%g2
p2_b61:
!	Registers modified during the branch to p2_far_2
!	%l4  = 00000000eb7d1a01
!	%l6  = eb7d0dbc9e2a0f52
	set	p2_b62,%o7
	fbe	p2_far_2_le	! Branch Taken, %fcc0 = 0

p2_label_55:
!	Mem[0000000019000080] = e33869a9 c68e93f1 55279682 3dccb9f5
	prefetch [%i2+0x080],23
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x03e,%g2
p2_b62:
!	Registers modified during the branch to p2_far_2
!	%l4  = 00000000eb7d1a01
!	%l6  = eb7d0dbc9e2a0f52
	membar	#Sync			! Added by membar checker (423)
	fbn,a,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l4 = 00000000eb7d1a01, Mem[0000000018800008] = da37b81e
	stba	%l4,[%i1+%o6]0x80	! Annulled
p2_b63:
	membar	#Sync			! Added by membar checker (424)
!	%l4 = 00000000eb7d1a01, Mem[000000001800001a] = 92e00c61
	stb	%l4,[%i0+0x01a]		! Mem[0000000018000018] = 92e00161
	set	p2_b64,%o7
	fbe	p2_far_0_le	! Branch Taken, %fcc0 = 0

p2_label_56:
!	Mem[000000001b000008] = a174e808 fc13a031, %l6 = 9e2a0f52, %l7 = a5c01cca
	ldda	[%i6+%o6]0x80,%l6	! %l6 = 00000000a174e808 00000000fc13a031
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x040,%g2
p2_b64:
!	Registers modified during the branch to p2_far_0
!	%l3  = fffffffffffffe5a
!	%l7  = 00000000a174e808
	membar	#Sync			! Added by membar checker (425)
!	Mem[0000000019000000] = db9d9bff, %l4 = 00000000eb7d1a01
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000db
!	%f18 = 448d0be9, %f28 = 00000000, %f9  = affdbcb8
	fadds	%f18,%f28,%f9 		! %f9  = 448d0be9
	set	p2_b65,%o7
	fbule,a,pn %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0
!	%l3 = fffffffffffffe5a, Mem[0000000018000000] = ffe39f6f
	stwa	%l3,[%i0+%g0]0x80	! Mem[0000000018000000] = fffffe5a
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x041,%g2
p2_b65:
!	Registers modified during the branch to p2_near_0
!	%l1  = 00000000eb7d1061
!	%l3  = fffffffffffff0f8
!	%l7  = fffffffffffffbb2

p2_label_57:
	membar	#Sync			! Added by membar checker (426)
!	Mem[0000000031000064] = 81bf4877, %l5 = 000000000000009c
	lduwa	[%o2+0x064]%asi,%l5	! %l5 = 0000000081bf4877
!	%l6 = 00000000a174e808, Mem[0000000019800093] = d915e503
	stba	%l6,[%i3+0x093]%asi	! Mem[0000000019800090] = d915e508
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000019800020] = af401f04 5f339e15 8cfd205a 7e7bf6c5
	prefetch [%i3+0x020],2	! Annulled
p2_b66:
	membar	#Sync			! Added by membar checker (427)
!	%l5 = 0000000081bf4877, Mem[0000000031000064] = 81bf4877
	stwa	%l5,[%o2+0x064]%asi	! Mem[0000000031000064] = 81bf4877

p2_label_58:
!	%l5 = 0000000081bf4877, %l0 = 000000000001009b, %y  = eb7d0dbc
	udivx	%l5,%l0,%l3		! %l3 = 0000000000008170
!	%l7 = fffffffffffffbb2, immed = 00000008, %l2 = 00000000eb7d1a02
	sra	%l7,0x008,%l2		! %l2 = fffffffffffffffb
!	%l0 = 000000000001009b, %l2 = fffffffffffffffb, %l7 = fffffffffffffbb2
	and	%l0,%l2,%l7		! %l7 = 000000000001009b
	set	p2_b67,%o7
	fbne,pt	%fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000030000060] = 00000024, %l5 = 0000000081bf4877
	lduh	[%o0+0x062],%l5		! %l5 = 0000000000000024
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x043,%g2
p2_b67:
!	Registers modified during the branch to p2_near_1
!	%l1  = 00000000eb7d105c
!	%l4  = ffffffff1483ef38
!	%l5  = fffffffffffef9a7

p2_label_59:
	membar	#Sync			! Added by membar checker (428)
!	Mem[0000000019800100] = 4d89b0f5 0c6ea1c2 1859c052 524c55f5
	prefetcha [%i3+0x100]%asi,1
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000020] = c60f75ff, %l1 = 00000000eb7d105c
	lduw	[%o0+0x020],%l1		! Annulled
p2_b68:
	membar	#Sync			! Added by membar checker (429)
!	%l6 = 00000000a174e808, %l4 = ffffffff1483ef38, %l2 = fffffffffffffffb
	andncc	%l6,%l4,%l2		! %l2 = 00000000a1740000, %ccr = 08
	fblg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_60:
!	%l2 = a1740000, %l3 = 00008170, Mem[0000000030800060] = ffffffbd 6589b4b1
	std	%l2,[%o1+0x060]	! Annulled
p2_b69:
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000198001e6] = 07e065b6, %l3 = 0000000000008170
	ldstub	[%i3+0x1e6],%l3		! %l3 = 0000000000000065
p2_b70:
	membar	#Sync			! Added by membar checker (430)
	set	p2_b71,%o7
	fbo,pn	%fcc2,p2_near_2_he	! Branch Taken, %fcc2 = 1
!	%l1 = 00000000eb7d105c, Mem[0000000031800064] = 6b712ae3
	stw	%l1,[%o3+0x064]		! Mem[0000000031800064] = eb7d105c
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x047,%g2
p2_b71:
!	Registers modified during the branch to p2_near_2
!	%l1  = ffffffff1483ef32

p2_label_61:
	membar	#Sync			! Added by membar checker (431)
!	Mem[000000003000002c] = 9bd38918, %l2 = 00000000a1740000
	swapa	[%o0+0x02c]%asi,%l2	! %l2 = 000000009bd38918
!	Mem[0000000018800000] = a5c01cca, %l3 = 0000000000000065
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000a5c01cca
	set	p2_b72,%o7
	fba	p2_far_2_he	! Branch Taken, %fcc0 = 0
!	%l6 = 00000000a174e808, Mem[0000000019800010] = 16a1a0174183553f
	stx	%l6,[%i3+0x010]		! Mem[0000000019800010] = 00000000a174e808
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x048,%g2
p2_b72:
!	Registers modified during the branch to p2_far_2
!	%l0  = 052e00e650000000
!	%l3  = 00000000a5c01953
!	%l5  = fffffffffffefad4
	membar	#Sync			! Added by membar checker (432)
!	%l4 = ffffffff1483ef38, Mem[0000000031000068] = 00000000
	stw	%l4,[%o2+0x068]		! Mem[0000000031000068] = 1483ef38

p2_label_62:
!	%f16 = be83eeec, %f30 = 449d0be9
	fcmpes	%fcc0,%f16,%f30		! %fcc0 = 1
!	%l2 = 000000009bd38918
	setx	0x10bd463c10bd463c,%g7,%l2 ! %l2 = 10bd463c10bd463c
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018000000] = fffffe5a, %l2 = 10bd463c10bd463c
	lduwa	[%i0+%g0]0x80,%l2	! Annulled
p2_b73:
	membar	#Sync			! Added by membar checker (433)
!	Mem[0000000019800100] = 4d89b0f5 0c6ea1c2 1859c052 524c55f5
	prefetch [%i3+0x100],3

p2_label_63:
!	%f18 = 448d0be9 60000000, %f13 = 5b4c8290
	fdtos	%f18,%f13		! %f13 = 64685f4b
!	Mem[0000000019800140] = b8f065ea 61062e07 dc0d8cd3 12ea854e
	prefetcha [%i3+0x140]%asi,21
!	Mem[00000000190000db] = ff16b9e5, %l1 = ffffffff1483ef32
	ldstub	[%i2+0x0db],%l1		! %l1 = 00000000000000e5
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],0
!	Mem[0000000032000020] = abf2ed78, %l6 = 00000000a174e808
	lduh	[%o4+0x020],%g2		! %g2 = 000000000000abf2

p2_label_64:
!	Branch On Register, %l5 = fffffffffffefad4
	brgz,pn	%l5,p2_not_taken_0	! Branch Not Taken
!	Mem[000000001a800000] = 375e539a, %l2 = 10bd463c10bd463c
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000037
p2_b74:
	membar	#Sync			! Added by membar checker (434)
!	%l5 = fffffffffffefad4, immed = 00000fa9, %l7 = 000000000001009b
	xnorcc	%l5,0xfa9,%l7		! %l7 = 0000000000010a82, %ccr = 00
!	%f0  = 00000000 00000000, %f20 = 263dbc5b
	fdtoi	%f0 ,%f20		! %f20 = 00000000
	nop

p2_label_65:
!	%f4  = 449d0be9 60000000, %f20 = 00000000
	fdtos	%f4 ,%f20		! %f20 = 64e85f4b
!	%f28 = 00000000, %f22 = 73ef9cca, %f29 = c49d0be9
	fmuls	%f28,%f22,%f29		! %f29 = 00000000
	set	p2_b75,%o7
	fble,a	p2_far_2_he	! Branch Taken, %fcc0 = 1
!	%l3 = 00000000a5c01953, Mem[000000003200005f] = 51e6a701
	stb	%l3,[%o4+0x05f]		! Mem[000000003200005c] = 53e6a701
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x04b,%g2
p2_b75:
!	Registers modified during the branch to p2_far_2
!	%l0  = 000000029700654c
!	%l3  = 00000000a5c015dc
!	%l5  = fffffffffffefc01
	membar	#Sync			! Added by membar checker (435)
!	%f12 = 8195a924 64685f4b, %f2  = 4531f0e8 2aa40400
	fnegd	%f12,%f2 		! %f2  = 0195a924 64685f4b

p2_label_66:
!	%f6  = 95d070f1 b41f7767, %f20 = 64e85f4b 0f9001f8
	fcmped	%fcc2,%f6 ,%f20		! %fcc2 = 1
!	%l2 = 0000000000000037, immed = fffff941, %l0 = 000000029700654c
	add	%l2,-0x6bf,%l0		! %l0 = fffffffffffff978
!	%l6 = a174e808, %l7 = 00010a82, Mem[0000000018800000] = 00000065 0000009c
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000018800000] = a174e808 00010a82
	set	p2_b76,%o7
	fble,pt	%fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000019000008] = f56784a2, %l0 = fffffffffffff978
	ldsba	[%i2+%o6]0x80,%l0	! %l0 = fffffffffffffff5
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x04c,%g2
p2_b76:
!	Registers modified during the branch to p2_near_0
!	%l0  = 00000000ffffffff
!	%l1  = 0000000000000ca5
!	%l2  = 0000000000000000
!	%l3  = 0000000000000000
!	%l5  = ffffffff80000000

p2_label_67:
	bcc,a	p2_b77			! Branch Taken, %ccr = 88, CWP = 0
!	%l2 = 0000000000000000, Mem[0000000019800000] = dec927b4
	stba	%l2,[%i3+%g0]0x80	! Mem[0000000019800000] = 00c927b4
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x04d,%g2
p2_b77:
	membar	#Sync			! Added by membar checker (436)
	set	p2_b78,%o7
	fbl,a,pt %fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 1
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000019000068] = 47b31432 8dd899c3
	std	%l2,[%i2+0x068]	! Mem[0000000019000068] = 00000000 00000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x04e,%g2
p2_b78:
!	Registers modified during the branch to p2_near_3
!	%l1  = ffffffff7ffff9f5
!	%l2  = 707e67d46ea9ee30
!	%l5  = ffffffff7ffff1b2
!	%l7  = fffffffffffffff7
	membar	#Sync			! Added by membar checker (437)
!	%l2 = 707e67d46ea9ee30, immed = fffff85e, %l3 = 0000000000000000
	addcc	%l2,-0x7a2,%l3		! %l3 = 707e67d46ea9e68e, %ccr = 11

p2_label_68:
!	Mem[0000000018800000] = a174e808, %l3 = 707e67d46ea9e68e
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000a1
!	%l7 = fffffffffffffff7, immed = fffff491, %y  = eb7d0dbc
	udiv	%l7,-0xb6f,%l4		! %l4 = 00000000eb7d1841
	bgu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000030800068] = 56956cf4e7d38d64, %l3 = 00000000000000a1
	ldx	[%o1+0x068],%l3		! Annulled
p2_b79:
	membar	#Sync			! Added by membar checker (438)
!	Mem[000000001a000000] = ceaf99b4, %l3 = 00000000000000a1
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffceaf

p2_label_69:
!	%l2 = 707e67d46ea9ee30, Mem[0000000018000000] = fffffe5a5fec12a9
	stx	%l2,[%i0+0x000]		! Mem[0000000018000000] = 707e67d46ea9ee30
!	Mem[0000000019000000] = ff9d9bff, %l6 = 00000000a174e808
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffff9d
!	call to call_3, CWP = 0
	call	p2_call_3_he
!	Mem[0000000019800008] = 98067e8c, %l5 = ffffffff7ffff1b2
	ldsba	[%i3+%o6]0x80,%l5	! %l5 = ffffffffffffff98
!	Registers modified during the branch to p2_call_3
!	%l2  = 0000000000000000
!	%l4  = 0000000080000357
!	%l5  = fffffffffffffeb9
!	%l7  = 000002c7ffffe6f8
!	%f2  = 0195a924 64685f4b, %f12 = 8195a924 64685f4b, %f16 = be83eeec e0000000
	fsubd	%f2 ,%f12,%f16		! %f16 = 01a5a924 64685f4b

p2_label_70:
	fbl,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000019000000] = ff9d9bff, %l4 = 0000000080000357
	swapa	[%i2+%g0]0x80,%l4	! Annulled
p2_b80:
	membar	#Sync			! Added by membar checker (439)
!	Mem[00000000188001d8] = 80000357 e0000000, %l2 = 0000000000000000, %l1 = ffffffff7ffff9f5
	add	%i1,0x1d8,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 3adf207d903d4bcb
!	Mem[0000000019800000] = 00c927b4 67494200 98067e8c 5a568f7e
	prefetch [%i3+0x000],20
!	Mem[0000000019800040] = 42e9d279 ebe25987 992de0a9 f5061198
	prefetch [%i3+0x040],16

p2_label_71:
!	Mem[00000000198001c0] = 5d502100 166a0b6e 9b5eac89 cedea44c
	prefetcha [%i3+0x1c0]%asi,23
!	Mem[0000000019000008] = f56784a2, %l2 = 0000000000000000
	ldswa	[%i2+%o6]0x80,%l2	! %l2 = fffffffff56784a2
	bvc	p2_b81			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000030000026] = 9d656cf9, %l6 = ffffffffffffff9d
	ldstub	[%o0+0x026],%l6		! %l6 = 000000000000006c
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x051,%g2
p2_b81:
	membar	#Sync			! Added by membar checker (440)
!	Mem[00000000190001a0] = 97726b00 6936bf59 f343b679 e29494c2
	prefetcha [%i2+0x1a0]%asi,23

p2_label_72:
!	%f12 = 8195a924 64685f4b, %f2  = 0195a924 64685f4b, %f28 = 00000000 00000000
	fdivd	%f12,%f2 ,%f28		! %f28 = bff00000 00000000
!	%l2 = fffffffff56784a2, immed = fffffdaa, %l1 = 3adf207d903d4bcb
	orncc	%l2,-0x256,%l1		! %l1 = fffffffff56786f7, %ccr = 88
!	%f24 = c1da8be3 c3c00000, %f15 = f3ff9ba1
	fdtoi	%f24,%f15		! %f15 = 95d070f1
	bcc,a	p2_b82			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000032000060] = e6a70116 4168fde0 d3a59bed c4d847d0
	prefetch [%o4+0x060],0
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x052,%g2
p2_b82:

p2_label_73:
	membar	#Sync			! Added by membar checker (441)
!	%f30 = 449d0be9 60000000, %f30 = 449d0be9 60000000, %f26 = 49fda2d3 e0c73091
	fdivd	%f30,%f30,%f26		! %f26 = 3ff00000 00000000
!	%l4 = 0000000080000357, %l7 = 000002c7ffffe6f8, %y  = 000002c7
	udivx	%l4,%l7,%l2		! %l2 = 0000000000000000
!	Mem[0000000018000040] = cc21189d 6b8e4284 ab2a9c18 8bfc2ffe
	prefetcha [%i0+0x040]%asi,23
	set	p2_b83,%o7
	fbuge,a,pt %fcc1,p2_near_1_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000018000040] = cc21189d 6b8e4284 ab2a9c18 8bfc2ffe
	prefetch [%i0+0x040],4
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x053,%g2
p2_b83:
!	Registers modified during the branch to p2_near_1
!	%l1  = fffffffff56786f7
!	%l4  = 00000000f56786f7
!	%l5  = fffffd3800001fc4

p2_label_74:
	bn,a	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],1	! Annulled
p2_b84:
	membar	#Sync			! Added by membar checker (442)
!	%f18 = 448d0be9, %f31 = 60000000, %f23 = 356c9db1
	fmuls	%f18,%f31,%f23		! %f23 = 650d0be9
!	%l5 = fffffd3800001fc4, %l2 = 0000000000000000, %l3 = ffffffffffffceaf
	orn	%l5,%l2,%l3		! %l3 = ffffffffffffffff
!	Mem[00000000198000d4] = 77d41d70, %l5 = fffffd3800001fc4
	ldstuba	[%i3+0x0d4]%asi,%l5	! %l5 = 0000000000000077

p2_label_75:
	fbu,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800000] = ff74e808, %l7 = 000002c7ffffe6f8
	lduwa	[%i1+%g0]0x80,%l7	! Annulled
p2_b85:
	membar	#Sync			! Added by membar checker (443)
!	%l5 = 0000000000000077, Mem[0000000030800029] = 3a11a677
	stb	%l5,[%o1+0x029]		! Mem[0000000030800028] = 3a77a677
!	Mem[0000000019000000] = ff9d9bff 8bffed76 f56784a2 d17fefff
	prefetch [%i2+0x000],4
!	%f20 = 64e85f4b 0f9001f8, %f18 = 448d0be9 60000000
	fmovd	%f20,%f18		! %f18 = 64e85f4b 0f9001f8

p2_label_76:
!	%l1 = fffffffff56786f7, immed = fffff2ae, %l4 = 00000000f56786f7
	xor	%l1,-0xd52,%l4		! %l4 = 000000000a987459
!	%f13 = 64685f4b, %f2  = 0195a924, %f4  = 449d0be9 60000000
	fsmuld	%f13,%f2 ,%f4 		! %f4  = 3cd0fb1f c79d3180
!	Mem[0000000032000018] = adf2627b, %l0 = 00000000ffffffff
	ldub	[%o4+0x019],%g2		! %g2 = 00000000000000ad
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000019000000] = ff9d9bff8bffed76, %l4 = 000000000a987459
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = ff9d9bff8bffed76
!	Registers modified during the branch to p2_jmpl_3
!	%l1  = 0000000000000000
!	%l7  = fffffffffffffad9

p2_label_77:
!	%f12 = 8195a924 64685f4b, %f2  = 0195a924 64685f4b, %f24 = c1da8be3 c3c00000
	faddd	%f12,%f2 ,%f24		! %f24 = 00000000 00000000
	fbge,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000018800008] = da37b81e, %l5 = 0000000000000077
	ldsba	[%i1+%o6]0x80,%l5	! %l5 = ffffffffffffffda
p2_b86:
	membar	#Sync			! Added by membar checker (444)
!	%l3 = ffffffffffffffff, Mem[00000000190000bc] = 44d4cc94
	stha	%l3,[%i2+0x0bc]%asi	! Mem[00000000190000bc] = ffffcc94
!	%l0 = 00000000ffffffff, immed = fffffc51, %y  = 000002c7
	mulx	%l0,-0x3af,%l0		! %l0 = fffffc51000003af

p2_label_78:
	set	p2_b87,%o7
	fbo,a,pt %fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 1
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000019800120] = 23a69b98 db477e92
	std	%l2,[%i3+0x120]	! Mem[0000000019800120] = 00000000 ffffffff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x057,%g2
p2_b87:
!	Registers modified during the branch to p2_near_3
!	%l1  = fffffffffffff98f
!	%l2  = 707e67d46ea9ee30
!	%l5  = fffffffffffff1c8
!	%l7  = ffffffffffffffef
	membar	#Sync			! Added by membar checker (445)
!	Mem[0000000030000064] = a9663cd8, %l6 = 000000000000006c
	ldsw	[%o0+0x064],%l6		! %l6 = ffffffffa9663cd8
!	%l6 = ffffffffa9663cd8, %l2 = 707e67d46ea9ee30, %l0 = fffffc51000003af
	orn	%l6,%l2,%l0		! %l0 = ffffffffb9763ddf
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_79:
!	Mem[0000000018000008] = ffffcbc5, %l6 = ffffffffa9663cd8
	ldstuba	[%i0+%o6]0x80,%l6	! Annulled
p2_b88:
	membar	#Sync			! Added by membar checker (446)
!	%f24 = 00000000 00000000, %f30 = 449d0be9 60000000, %f22 = 73ef9cca 650d0be9
	fmuld	%f24,%f30,%f22		! %f22 = 00000000 00000000
!	%l5 = fffffffffffff1c8, Mem[000000003180006b] = 0a5aff9d
	stba	%l5,[%o3+0x06b]%asi	! Mem[0000000031800068] = 0a5affc8
!	%l0 = ffffffffb9763ddf, immed = 00000439, %y  = 000002c7
	udivx	%l0,0x439,%l1		! %l1 = 003ca016bbf7d21d
!	%l0 = ffffffffb9763ddf, Mem[0000000018800000] = ff74e808
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000018800000] = b9763ddf

p2_label_80:
!	%f26 = 3ff00000 00000000, %f16 = 01a5a924 64685f4b
	fdtox	%f26,%f16		! %f16 = 00000000 00000001
!	%l1 = 003ca016bbf7d21d, %l6 = ffffffffa9663cd8, %y  = 000002c7
	smul	%l1,%l6,%l5		! %l5 = 17039c2a8ae61478
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800008] = da37b81e, %l5 = 17039c2a8ae61478
	ldsba	[%i1+%o6]0x80,%l5	! Annulled
p2_b89:
	membar	#Sync			! Added by membar checker (447)
!	%f7  = b41f7767, %f2  = 0195a924
	fcmps	%fcc3,%f7 ,%f2 		! %fcc3 = 1

p2_label_81:
!	%f8  = 9c7efa8b 448d0be9, %f12 = 8195a924 64685f4b
	fcmpd	%fcc2,%f8 ,%f12		! %fcc2 = 1
!	%l5 = 17039c2a8ae61478, immed = 000007fb, %y  = 17039c2a
	udiv	%l5,0x7fb,%l7		! %l7 = 00000000ffffffff
!	Mem[0000000019000040] = 31dc1e8e af9822b0 1d6d4093 21636f8b
	prefetcha [%i2+0x040]%asi,2
!	%l2 = 707e67d46ea9ee30, immed = fffff1fe, %l5 = 17039c2a8ae61478
	andn	%l2,-0xe02,%l5		! %l5 = 0000000000000e00
!	%l1 = 003ca016bbf7d21d, %l2 = 707e67d46ea9ee30, %y  = 17039c2a
	umul	%l1,%l2,%l3		! %l3 = 514141c5cef35b70

p2_label_82:
!	Mem[0000000032000038] = 11724fe5, %l3 = 514141c5cef35b70
	ldsha	[%o4+0x038]%asi,%g2	! %g2 = 0000000000001172
!	%l0 = ffffffffb9763ddf, %l6 = ffffffffa9663cd8, %l3 = 514141c5cef35b70
	srl	%l0,%l6,%l3		! %l3 = 00000000000000b9
!	Mem[0000000018000080] = 5b40e2c6, %l7 = 00000000ffffffff
	ldsba	[%i0+0x080]%asi,%l7	! %l7 = 000000000000005b
	set	p2_b90,%o7
	fbge,pt	%fcc1,p2_near_1_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000030000060] = 00000024, %l4 = ff9d9bff8bffed76
	lduw	[%o0+0x060],%l4		! %l4 = 0000000000000024
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x05a,%g2
p2_b90:
!	Registers modified during the branch to p2_near_1
!	%l0  = 00000000000000ff
!	%l5  = 000000000000009c

p2_label_83:
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000003100006c] = 0000ffde, %l5 = 000000000000009c
	lduh	[%o2+0x06e],%l5		! Annulled
p2_b91:
	membar	#Sync			! Added by membar checker (448)
!	%l7 = 000000000000005b, immed = fffffd9c, %y  = 514141c5
	umulcc	%l7,-0x264,%l4		! %l4 = 0000005affff2674, %ccr = 08
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000190000cc] = fc8db7bb, %l2 = 707e67d46ea9ee30
	ldsw	[%i2+0x0cc],%l2		! Annulled
p2_b92:

p2_label_84:
	membar	#Sync			! Added by membar checker (449)
!	%f0  = 00000000, %f21 = 0f9001f8
	fcmps	%fcc3,%f0 ,%f21		! %fcc3 = 1
!	Branch On Register, %l1 = 003ca016bbf7d21d
	brgez,a,pn %l1,p2_b93		! Branch Taken
!	%l6 = ffffffffa9663cd8, Mem[0000000030000028] = 7fa81ee2
	stw	%l6,[%o0+0x028]		! Mem[0000000030000028] = a9663cd8
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x05d,%g2
p2_b93:
	membar	#Sync			! Added by membar checker (450)
!	%f0  = 00000000 00000000, %f0  = 00000000 00000000
	fdtox	%f0 ,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000019800118] = 0a5af23d, %l1 = 003ca016bbf7d21d
	ldsh	[%i3+0x118],%l1		! %l1 = 0000000000000a5a

p2_label_85:
!	%f24 = 00000000 00000000, %f12 = 8195a924 64685f4b
	fnegd	%f24,%f12		! %f12 = 80000000 00000000
!	%l5 = 000000000000009c
	setx	0xf598a8c0f598a8c0,%g7,%l5 ! %l5 = f598a8c0f598a8c0
	set	p2_b94,%o7
	fble,pt	%fcc2,p2_near_2_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000030800060] = ffffffbd, %l7 = 000000000000005b
	ldsw	[%o1+0x060],%l7		! %l7 = ffffffffffffffbd
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x05e,%g2
p2_b94:
!	Registers modified during the branch to p2_near_2
!	%l0  = 000000506ea92630
!	%l5  = fffc186c09559dd0
!	%l6  = fffc186c09559d8d
	membar	#Sync			! Added by membar checker (451)
!	%l3 = 00000000000000b9, %l2 = 707e67d46ea9ee30, %l6 = fffc186c09559d8d
	sll	%l3,%l2,%l6		! %l6 = 0000000000b90000

p2_label_86:
!	%l1 = 0000000000000a5a, %l1 = 0000000000000a5a, %l3 = 00000000000000b9
	orn	%l1,%l1,%l3		! %l3 = ffffffffffffffff
	fbg,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000003200003c] = 4e0f0ed4, %l7 = ffffffffffffffbd
	ldsb	[%o4+0x03d],%g2		! %g2 = 000000000000004e
p2_b95:
	membar	#Sync			! Added by membar checker (452)
!	Branch On Register, %l6 = 0000000000b90000
	brnz,pt	%l6,p2_b96		! Branch Taken
!	Mem[0000000031800060] = 26165f33eb7d105c, %l6 = 0000000000b90000
	ldx	[%o3+0x060],%l6		! %l6 = 26165f33eb7d105c
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x060,%g2
p2_b96:

p2_label_87:
	membar	#Sync			! Added by membar checker (453)
!	Denormal Floating Point Operation Nullified
	nop
	fbg,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000001880002c] = 209ff49a, %l5 = fffc186c09559dd0
	ldstub	[%i1+0x02c],%l5		! Annulled
p2_b97:
	membar	#Sync			! Added by membar checker (454)
!	Mem[0000000019800060] = 4bb8c42f, %l4 = 0000005affff2674
	swapa	[%i3+0x060]%asi,%l4	! %l4 = 000000004bb8c42f
!	%l1 = 0000000000000a5a, immed = fffffa72, %y  = 0000005a
	sdivx	%l1,-0x58e,%l2		! %l2 = ffffffffffffffff

p2_label_88:
!	%l1 = 0000000000000a5a, Mem[0000000030000028] = a9663cd8
	sth	%l1,[%o0+0x028]		! Mem[0000000030000028] = 0a5a3cd8
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = ffffffffffffffff, Mem[0000000030000024] = 9d65fff9
	sth	%l2,[%o0+0x024]		! Mem[0000000030000024] = fffffff9
p2_b98:
	membar	#Sync			! Added by membar checker (455)
!	%l5 = fffc186c09559dd0, %l2 = ffffffffffffffff, %l1 = 0000000000000a5a
	subccc	%l5,%l2,%l1		! %l1 = fffc186c09559dd0, %ccr = 91
!	%l4 = 000000004bb8c42f, immed = 00000792, %y  = 0000005a
	smul	%l4,0x792,%l5		! %l5 = 0000023d3cbd2bce

p2_label_89:
!	Mem[0000000019800100] = 4d89b0f5 0c6ea1c2 1859c052 524c55f5
	prefetch [%i3+0x100],23
!	Branch On Register, %l6 = 26165f33eb7d105c
	brlz,pt	%l6,p2_not_taken_0	! Branch Not Taken
!	%l2 = ffffffffffffffff, Mem[000000001a800008] = ec0bfb92
	stha	%l2,[%i5+%o6]0x80	! Mem[000000001a800008] = fffffb92
p2_b99:
	membar	#Sync			! Added by membar checker (456)
!	%l3 = ffffffffffffffff, %l3 = ffffffffffffffff, %l0 = 000000506ea92630
	xnor	%l3,%l3,%l0		! %l0 = ffffffffffffffff
!	Mem[0000000032000064] = 68fde0d3, %l7 = ffffffffffffffbd
	lduba	[%o4+0x065]%asi,%g2	! %g2 = 0000000000000068

p2_label_90:
	bgu	p2_not_taken_0		! Branch Not Taken, %ccr = 91
!	Mem[000000003200000c] = 68500587, %l2 = ffffffffffffffff
	ldsb	[%o4+0x00d],%g2		! %g2 = 0000000000000068
p2_b100:
	fbe	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003000002c] = a1740000, %l7 = ffffffffffffffbd
	ldsb	[%o0+0x02e],%l7		! %l7 = 0000000000000000
p2_b101:
	membar	#Sync			! Added by membar checker (457)
!	%l0 = ffffffffffffffff, immed = 00000948, %l1 = fffc186c09559dd0
	xorcc	%l0,0x948,%l1		! %l1 = fffffffffffff6b7, %ccr = 88

p2_label_91:
!	Mem[00000000198001c0] = 5d502100, %l6 = 26165f33eb7d105c
	swap	[%i3+0x1c0],%l6		! %l6 = 000000005d502100
!	Mem[0000000019000194] = 57ee6cb7, %l1 = fffffffffffff6b7
	ldswa	[%i2+0x194]%asi,%l1	! %l1 = 0000000057ee6cb7
!	Mem[0000000018800000] = b9763ddf00010a82, %l7 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = b9763ddf00010a82
	set	p2_b102,%o7
	fbne,a	p2_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000018800130] = 818391c2, %l2 = ffffffffffffffff
	ldub	[%i1+0x133],%l2		! %l2 = 00000000000000c2
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x066,%g2
p2_b102:
!	Registers modified during the branch to p2_far_2
!	%l4  = 00000000000000c1
!	%l6  = 000000c1fff5e412

p2_label_92:
	membar	#Sync			! Added by membar checker (458)
!	%l1 = 0000000057ee6cb7, Mem[0000000018000000] = 707e67d4
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000018000000] = b77e67d4
!	%f29 = 00000000, %f10 = 00000000 409e7894
	fstox	%f29,%f10		! %f10 = 00000000 00000000
!	%l4 = 00000000000000c1, %l2 = 00000000000000c2, %l4 = 00000000000000c1
	xorcc	%l4,%l2,%l4		! %l4 = 0000000000000003, %ccr = 00
!	%l4 = 0000000000000003, Mem[0000000032000058] = 54998092142f1f53
	stx	%l4,[%o4+0x058]		! Mem[0000000032000058] = 0000000000000003
!	Mem[0000000019000008] = f56784a2, %l3 = ffffffffffffffff
	lduwa	[%i2+%o6]0x80,%l3	! %l3 = 00000000f56784a2

p2_label_93:
!	Mem[0000000030800068] = 56956cf4, %l0 = ffffffffffffffff
	swapa	[%o1+0x068]%asi,%l0	! %l0 = 0000000056956cf4
!	Mem[0000000019000008] = f56784a2, %l6 = 000000c1fff5e412
	ldsha	[%i2+%o6]0x80,%l6	! %l6 = fffffffffffff567
!	Mem[0000000018800020] = 18071128 43532833 11c79e3c 209ff49a
	prefetch [%i1+0x020],22
	fbn,a,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000019000000] = ff9d9bff, %l3 = 00000000f56784a2
	ldstuba	[%i2+%g0]0x80,%l3	! Annulled
p2_b103:

p2_label_94:
	membar	#Sync			! Added by membar checker (459)
!	%f23 = 00000000, %f19 = 0f9001f8, %f12 = 80000000
	fadds	%f23,%f19,%f12		! %f12 = 0f9001f8
!	%l3 = 00000000f56784a2
	sethi	%hi(0x52e72c00),%l3	! %l3 = 0000000052e72c00
!	Mem[00000000180000bc] = 1bce09b2, %l3 = 0000000052e72c00
	lduwa	[%i0+0x0bc]%asi,%l3	! %l3 = 000000001bce09b2
!	%f22 = 00000000 00000000, %f15 = 95d070f1
	fxtos	%f22,%f15		! %f15 = 00000000
!	Mem[0000000030000028] = 0a5a3cd8, %l1 = 0000000057ee6cb7
	ldswa	[%o0+0x028]%asi,%l1	! %l1 = 000000000a5a3cd8

p2_label_95:
!	%l6 = fffffffffffff567, %l1 = 000000000a5a3cd8, %l3 = 000000001bce09b2
	sub	%l6,%l1,%l3		! %l3 = fffffffff5a5b88f
!	%l2 = 00000000000000c2, %l3 = fffffffff5a5b88f, %l6 = fffffffffffff567
	sub	%l2,%l3,%l6		! %l6 = 000000000a5a4833
!	Mem[0000000031000028] = 00000000, %l0 = 0000000056956cf4
	lduba	[%o2+0x029]%asi,%l0	! %l0 = 0000000000000000
!	%l7 = b9763ddf00010a82, %l7 = b9763ddf00010a82, %l5 = 0000023d3cbd2bce
	andncc	%l7,%l7,%l5		! %l5 = 0000000000000000, %ccr = 44
	set	p2_b104,%o7
	fba,a,pn %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0

p2_label_96:
!	%l0 = 0000000000000000, Mem[000000001880012d] = 1e826b81
	stb	%l0,[%i1+0x12d]		! Annulled
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x068,%g2
p2_b104:
!	Registers modified during the branch to p2_near_0
!	%l1  = 00000000000000c1
!	%l3  = fffffffffffff020
!	%l7  = fffffffffffffada
	bn,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l3 = fffffffffffff020, Mem[0000000031000060] = 9cdbd87081bf4877
	stx	%l3,[%o2+0x060]		! Annulled
p2_b105:
	membar	#Sync			! Added by membar checker (460)
!	%l0 = 0000000000000000, Mem[0000000018000000] = b77e67d4
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000018000000] = 007e67d4
	be,a	p2_b106			! Branch Taken, %ccr = 44, CWP = 0

p2_label_97:
!	%l7 = fffffffffffffada, Mem[0000000018800008] = da37b81e
	stha	%l7,[%i1+%o6]0x80	! Mem[0000000018800008] = fadab81e
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x06a,%g2
p2_b106:
	membar	#Sync			! Added by membar checker (461)
!	Mem[0000000018800080] = 71c9030a 5a1da192 14e418f1 1ba5d064
	prefetch [%i1+0x080],2
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019000000] = ff9d9bff, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l5	! Annulled
p2_b107:
	membar	#Sync			! Added by membar checker (462)
!	%l2 = 00000000000000c2, immed = 00000e60, %l6 = 000000000a5a4833
	subc	%l2,0xe60,%l6		! %l6 = fffffffffffff262

p2_label_98:
!	%l4 = 0000000000000003, Mem[0000000031000028] = 000000000a5a619e
	stx	%l4,[%o2+0x028]		! Mem[0000000031000028] = 0000000000000003
!	Mem[0000000030000028] = 0a5a3cd8a1740000, %l2 = 00000000000000c2
	ldx	[%o0+0x028],%l2		! %l2 = 0a5a3cd8a1740000
!	%l1 = 00000000000000c1, Mem[0000000031800020] = 7070204d376b20fa
	stxa	%l1,[%o3+0x020]%asi	! Mem[0000000031800020] = 00000000000000c1
!	Mem[0000000019000000] = ff9d9bff, %l6 = fffffffffffff262
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffff9d
!	Mem[0000000018800008] = fadab81e, %l5 = 0000000000000000
	lduha	[%i1+%o6]0x80,%l5	! %l5 = 000000000000fada

p2_label_99:
!	%l0 = 0000000000000000, %l3 = fffffffffffff020, %l6 = ffffffffffffff9d
	xnor	%l0,%l3,%l6		! %l6 = 0000000000000fdf
	fbl,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000018800008] = fadab81e a5c01cca, %l0 = 00000000, %l1 = 000000c1
	ldda	[%i1+%o6]0x80,%l0	! %l0 = 00000000fadab81e 00000000a5c01cca
p2_b108:
	membar	#Sync			! Added by membar checker (463)
	fbu,pt	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000019800138] = 95b2316e, %l0 = 00000000fadab81e
	ldsb	[%i3+0x13b],%l0		! %l0 = 000000000000006e
p2_b109:

p2_label_100:
	membar	#Sync			! Added by membar checker (464)
!	Mem[000000001b0000c0] = c193eeb0 0868a35e 4367314c 37d967a4
	prefetch [%i6+0x0c0],0
!	%l7 = fffffffffffffada, immed = 00000b3e, %y  = 000000c1
	smul	%l7,0xb3e,%l4		! %l4 = ffffffffffc61ecc
!	%l5 = 000000000000fada, Mem[00000000190000fd] = c99f96af
	stb	%l5,[%i2+0x0fd]		! Mem[00000000190000fc] = c9da96af
!	Mem[0000000019800020] = af401f04 5f339e15 8cfd205a 7e7bf6c5
	prefetch [%i3+0x020],0
	set	p2_b110,%o7
	fbule,pt %fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 1

p2_label_101:
!	Mem[000000003200002c] = b3b6f9b1, %l7 = fffffffffffffada
	ldsw	[%o4+0x02c],%g2		! %g2 = fffffffffffffada
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x06e,%g2
p2_b110:
!	Registers modified during the branch to p2_near_0
!	%l1  = 00000000ffffffff
!	%l3  = ffffffffffc60ee9
!	%l7  = ffffffffffc619a3
	membar	#Sync			! Added by membar checker (465)
!	Branch On Register, %l7 = ffffffffffc619a3
	brz,a,pt %l7,p2_not_taken_0	! Branch Not Taken
!	 Annulled
	ldd	[%o0+0x068],%l0
p2_b111:
	membar	#Sync			! Added by membar checker (466)
!	%l5 = 000000000000fada
	sethi	%hi(0xbea66000),%l5	! %l5 = 00000000bea66000

	ba,a	p2_not_taken_0_end
p2_not_taken_0:
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba,a	p2_branch_failed
p2_not_taken_0_end:

!	%f22 = 00000000 00000000, %f24 = 00000000
	fdtoi	%f22,%f24		! %f24 = 00000000

p2_label_102:
!	%f16 = 00000000 00000001, %f28 = bff00000 00000000
	fxtod	%f16,%f28		! %f28 = 3ff00000 00000000
!	%f31 = 60000000, %f2  = 0195a924
	fnegs	%f31,%f2 		! %f2  = e0000000
!	Mem[0000000019800080] = 5cbafed0 d18273b4 7faa41c4 815a7c39
	prefetcha [%i3+0x080]%asi,0
!	Branch On Register, %l3 = ffffffffffc60ee9
	brlz,a,pn %l3,p2_b112		! Branch Taken
!	Mem[0000000019000000] = ff9d9bff 8bffed76, %l6 = 00000fdf, %l7 = ffc619a3
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff9d9bff 000000008bffed76
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x070,%g2
p2_b112:

p2_label_103:
	membar	#Sync			! Added by membar checker (467)
!	%l5 = 00000000bea66000, immed = 000008bd, %y  = ffffffff
	udiv	%l5,0x8bd,%l1		! %l1 = 00000000ffffffff
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = ffffffffffc61ecc, Mem[0000000019800000] = 00c927b4
	stba	%l4,[%i3+%g0]0x80	! Annulled
p2_b113:
	membar	#Sync			! Added by membar checker (468)
!	%l5 = 00000000bea66000, %l5 = 00000000bea66000, %l5 = 00000000bea66000
	or	%l5,%l5,%l5		! %l5 = 00000000bea66000
	bne	p2_not_taken_0		! Branch Not Taken, %ccr = 44

p2_label_104:
!	Mem[0000000018000008] = ffffcbc5, %l2 = 0a5a3cd8a1740000
	ldswa	[%i0+%o6]0x80,%l2	! %l2 = ffffffffffffcbc5
p2_b114:
	membar	#Sync			! Added by membar checker (469)
!	%l5 = 00000000bea66000, immed = 00000150, %l1 = 00000000ffffffff
	taddcc	%l5,0x150,%l1		! %l1 = 00000000bea66150, %ccr = 08
!	%f0  = 00000000 00000000, %f4  = 3cd0fb1f c79d3180
	fmovd	%f0 ,%f4 		! %f4  = 00000000 00000000
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l1 = 00000000bea66150, Mem[0000000019800193] = 09ea8b7a
	stb	%l1,[%i3+0x193]		! Mem[0000000019800190] = 09ea8b50
p2_b115:

p2_label_105:
	membar	#Sync			! Added by membar checker (470)
!	Mem[0000000019800000] = 00c927b4, %l5 = 00000000bea66000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = ffffffffffc61ecc, Mem[0000000019000008] = f56784a2
	stba	%l4,[%i2+%o6]0x80	! Mem[0000000019000008] = cc6784a2
!	%f4  = 00000000 00000000, %f30 = 449d0be9 60000000, %f14 = acb202e2 00000000
	fdivd	%f4 ,%f30,%f14		! %f14 = 00000000 00000000
!	%l1 = 00000000bea66150, immed = 00000014, %l3 = ffffffffffc60ee9
	sra	%l1,0x014,%l3		! %l3 = fffffffffffffbea
	fbge,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_106:
!	Mem[00000000180001b0] = a45bfbd3, %l0 = 000000000000006e
	ldsh	[%i0+0x1b0],%l0		! Annulled
p2_b116:
	membar	#Sync			! Added by membar checker (471)
!	Mem[0000000019000008] = cc6784a2, %l1 = 00000000bea66150
	lduha	[%i2+%o6]0x80,%l1	! %l1 = 000000000000cc67
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l0 = 0000006e, %l1 = 0000cc67, Mem[00000000188001f0] = 39609825 782e15b9
	std	%l0,[%i1+0x1f0]	! Mem[00000000188001f0] = 0000006e 0000cc67
p2_b117:
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08

p2_label_107:
!	Mem[0000000018800008] = fadab81e, %l7 = 000000008bffed76
	lduba	[%i1+%o6]0x80,%l7	! Annulled
p2_b118:
	membar	#Sync			! Added by membar checker (472)
!	Mem[0000000018800000] = b9763ddf00010a82, %l0 = 000000000000006e
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = b9763ddf00010a82
!	%f14 = 00000000, %f2  = e0000000, %f22 = 00000000 00000000
	fsmuld	%f14,%f2 ,%f22		! %f22 = 80000000 00000000
!	%l0 = b9763ddf00010a82, immed = 0000003b, %l5 = 0000000000000000
	srax	%l0,0x03b,%l5		! %l5 = fffffffffffffff7
!	Mem[0000000018000008] = ffffcbc5580b62a2, %l4 = ffffffffffc61ecc
	ldxa	[%i0+%o6]0x80,%l4	! %l4 = ffffcbc5580b62a2

p2_label_108:
!	%l7 = 000000008bffed76
	sethi	%hi(0xbbea5400),%l7	! %l7 = 00000000bbea5400
!	%l3 = fffffffffffffbea, immed = 0000000b, %l6 = 00000000ff9d9bff
	addccc	%l3,0x00b,%l6		! %l6 = fffffffffffffbf5, %ccr = 88
!	%l5 = fffffffffffffff7, %l0 = b9763ddf00010a82, %l3 = fffffffffffffbea
	sub	%l5,%l0,%l3		! %l3 = 4689c220fffef575
	fbug,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	 Annulled
	ldda	[%i3+%g0]0x80,%l6
p2_b119:

p2_label_109:
	membar	#Sync			! Added by membar checker (473)
	fbu,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000019000140] = 3610e89d 0947e6ef 65dece6e bd59d30b
	prefetch [%i2+0x140],23	! Annulled
p2_b120:
	membar	#Sync			! Added by membar checker (474)
!	%l7 = 00000000bbea5400, %l7 = 00000000bbea5400, %l5 = fffffffffffffff7
	addc	%l7,%l7,%l5		! %l5 = 0000000177d4a800
	nop
!	%f22 = 80000000, %f3  = 64685f4b, %f18 = 64e85f4b 0f9001f8
	fsmuld	%f22,%f3 ,%f18		! %f18 = 80000000 00000000

p2_label_110:
!	Mem[0000000019000010] = 5e0e24c5, %l5 = 0000000177d4a800
	ldub	[%i2+0x013],%l5		! %l5 = 00000000000000c5
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l5 = 00000000000000c5, Mem[000000003200006d] = d847d0b2
	stb	%l5,[%o4+0x06d]		! Mem[000000003200006c] = c547d0b2
p2_b121:
	membar	#Sync			! Added by membar checker (475)
!	Mem[0000000019000008] = cc6784a2, %l1 = 000000000000cc67
	lduba	[%i2+%o6]0x80,%l1	! %l1 = 00000000000000cc
	fbuge,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_111:
!	%l0 = 00010a82, %l1 = 000000cc, Mem[0000000018000078] = 7cdd90cd 472ef1d8
	std	%l0,[%i0+0x078]	! Annulled
p2_b122:
	bg	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],1
p2_b123:
	membar	#Sync			! Added by membar checker (476)
!	%l2 = ffffffffffffcbc5, immed = fffff073, %l0 = b9763ddf00010a82
	andn	%l2,-0xf8d,%l0		! %l0 = 0000000000000b84
	set	p2_b124,%o7
	fbule,a	p2_far_2_he	! Branch Taken, %fcc0 = 1

p2_label_112:
!	Mem[0000000019800000] = 00c927b4, %l2 = ffffffffffffcbc5
	ldswa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000c927b4
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x07c,%g2
p2_b124:
!	Registers modified during the branch to p2_far_2
!	%l0  = 4689c220fffef575
!	%l3  = 4689c220fffef1fe
!	%l5  = 00000000000001f2
	membar	#Sync			! Added by membar checker (477)
!	%f9  = 448d0be9, %f31 = 60000000
	fabss	%f9 ,%f31		! %f31 = 448d0be9
!	%f29 = 00000000, %f8  = 9c7efa8b, %f13 = 00000000
	fmuls	%f29,%f8 ,%f13		! %f13 = 80000000
!	Mem[000000001900002c] = b0b5acfb, %l6 = fffffffffffffbf5
	swapa	[%i2+0x02c]%asi,%l6	! %l6 = 00000000b0b5acfb
!	Mem[0000000019800008] = 98067e8c, %l1 = 00000000000000cc
	ldsha	[%i3+%o6]0x80,%l1	! %l1 = ffffffffffff9806

p2_label_113:
!	Mem[00000000180001d0] = da0564ed, %l0 = 4689c220fffef575
	ldsba	[%i0+0x1d1]%asi,%l0	! %l0 = 0000000000000005
!	%l6 = 00000000b0b5acfb
	sethi	%hi(0x7f7df000),%l6	! %l6 = 000000007f7df000
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018000000] = 007e67d4, %l2 = 0000000000c927b4
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 00000000007e67d4
p2_b125:
	set	p2_b126,%o7
	fbne	p2_far_2_he	! Branch Taken, %fcc0 = 1

p2_label_114:
!	Mem[0000000032000028] = 537245c7, %l1 = ffffffffffff9806
	lduh	[%o4+0x028],%g2		! %g2 = 0000000000005372
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x07e,%g2
p2_b126:
!	Registers modified during the branch to p2_far_2
!	%l0  = 4689c220fffef1fe
!	%l3  = 4689c220fffeee86
!	%l5  = 000000000000031f
	membar	#Sync			! Added by membar checker (478)
	fbn,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000019800008] = 98067e8c, %l0 = 4689c220fffef1fe
	ldsba	[%i3+%o6]0x80,%l0	! %l0 = ffffffffffffff98
p2_b127:
	membar	#Sync			! Added by membar checker (479)
!	%l1 = ffffffffffff9806, %l6 = 000000007f7df000, %l5 = 000000000000031f
	orn	%l1,%l6,%l5		! %l5 = ffffffffffff9fff
!	Mem[0000000019800008] = 98067e8c, %l2 = 00000000007e67d4
	lduba	[%i3+%o6]0x80,%l2	! %l2 = 0000000000000098

p2_label_115:
!	Mem[0000000032000024] = dbe0a62d, %l4 = ffffcbc5580b62a2
	ldsw	[%o4+0x024],%g2		! %g2 = ffffcbc5580b62a2
!	%l0 = ffffffffffffff98, %l2 = 0000000000000098, %l1 = ffffffffffff9806
	sub	%l0,%l2,%l1		! %l1 = ffffffffffffff00
	set	p2_b128,%o7
	fble,pn	%fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000019800000] = 00c927b4, %l7 = 00000000bbea5400
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000c927b4
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x080,%g2
p2_b128:
!	Registers modified during the branch to p2_near_1
!	%l1  = ffffffffffffff98
!	%l4  = ffffffffffffffff
!	%l5  = ffffffffff36de88
	membar	#Sync			! Added by membar checker (480)
!	%l0 = ffffffffffffff98, Mem[000000003080002e] = c32b36ed
	stha	%l0,[%o1+0x02e]%asi	! Mem[000000003080002c] = c32bff98

p2_label_116:
!	Mem[0000000032000010] = 87580000 59bac2f6, %l6 = 7f7df000, %l7 = 00c927b4
	ldd	[%o4+0x010],%g2		! %l6 = 000000007f7df000 0000000000c927b4
!	Mem[0000000018800000] = b9763ddf 00010a82 fadab81e a5c01cca
	prefetcha [%i1+0x000]%asi,2
!	%f21 = 0f9001f8, %f18 = 80000000
	fcmpes	%fcc1,%f21,%f18		! %fcc1 = 2
	nop				! Delay added due to fcmp
	fbuge,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l0 = ffffff98, %l1 = ffffff98, Mem[0000000019000000] = ff9d9bff 8bffed76
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000019000000] = ffffff98 ffffff98
p2_b129:

p2_label_117:
	membar	#Sync			! Added by membar checker (481)
!	Mem[0000000030000060] = 00000024, %l4 = ffffffffffffffff
	ldswa	[%o0+0x060]%asi,%l4	! %l4 = 0000000000000024
!	Mem[0000000031800020] = 00000000000000c1, %l7 = 0000000000c927b4
	ldxa	[%o3+0x020]%asi,%l7	! %l7 = 00000000000000c1
!	Branch On Register, %l6 = 000000007f7df000
	brlez,pn %l6,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000040] = 31dc1e8e af9822b0 1d6d4093 21636f8b
	prefetch [%i2+0x040],16
p2_b130:
	membar	#Sync			! Added by membar checker (482)
!	%f2  = e0000000, %f26 = 3ff00000 00000000
	fitod	%f2 ,%f26		! %f26 = c1c00000 00000000

p2_label_118:
!	%l6 = 000000007f7df000, immed = fffffaa6, %l5 = ffffffffff36de88
	xnor	%l6,-0x55a,%l5		! %l5 = 000000007f7df559
!	%l7 = 00000000000000c1, immed = 00000037, %l7 = 00000000000000c1
	srax	%l7,0x037,%l7		! %l7 = 0000000000000000
!	%l6 = 000000007f7df000, immed = 000002d4, %l3 = 4689c220fffeee86
	addcc	%l6,0x2d4,%l3		! %l3 = 000000007f7df2d4, %ccr = 00
	fbu,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l4 = 0000000000000024, Mem[0000000030800060] = ffffffbd
	sth	%l4,[%o1+0x060]		! Annulled
p2_b131:

p2_label_119:
	membar	#Sync			! Added by membar checker (483)
!	%l3 = 000000007f7df2d4, %l5 = 000000007f7df559, %l1 = ffffffffffffff98
	taddcc	%l3,%l5,%l1		! %l1 = 00000000fefbe82d, %ccr = 0a
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[0000000031800028] = 9cdbd870, %l4 = 0000000000000024
	ldsb	[%o3+0x028],%l4		! Annulled
p2_b132:
	membar	#Sync			! Added by membar checker (484)
!	Mem[00000000180001a0] = 1a434ada 9aef305d 31eb7fb4 2fd2b5a6
	prefetcha [%i0+0x1a0]%asi,21
!	%f22 = 80000000, %f30 = 449d0be9
	fcmps	%fcc3,%f22,%f30		! %fcc3 = 1

p2_label_120:
!	Mem[000000001b000000] = a938917f, %l6 = 000000007f7df000
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = ffffffffffffa938
!	%l4 = 0000000000000024, Mem[000000003180002a] = 9cdbd870
	stha	%l4,[%o3+0x02a]%asi	! Mem[0000000031800028] = 9cdb0024
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000060] = e6a70116 4168fde0 d3a59bed c4c547d0
	prefetch [%o4+0x060],20	! Annulled
p2_b133:
	membar	#Sync			! Added by membar checker (485)
!	Mem[0000000019000008] = cc6784a2, %l5 = 000000007f7df559
	ldsba	[%i2+%o6]0x80,%l5	! %l5 = ffffffffffffffcc

p2_label_121:
	set	p2_b134,%o7
	fble,a	p2_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000018800008] = fadab81e, %l0 = ffffffffffffff98
	lduha	[%i1+%o6]0x80,%l0	! %l0 = 000000000000fada
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x086,%g2
p2_b134:
!	Registers modified during the branch to p2_far_1
!	%l0  = 26165f33eb7d105c
!	%l1  = 000000000000023a
!	%l3  = 0000098000000000
!	%l5  = 000000000000027b
	membar	#Sync			! Added by membar checker (486)
!	Mem[0000000018800160] = 97734ba6 0b3a2f93 4ab4ce8a 7912cf48
	prefetcha [%i1+0x160]%asi,16
!	Mem[0000000019800008] = 98067e8c, %l5 = 000000000000027b
	lduha	[%i3+%o6]0x80,%l5	! %l5 = 0000000000009806
	fbe	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_122:
!	%l6 = ffffffffffffa938, Mem[0000000018800000] = b9763ddf
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000018800000] = 38763ddf
p2_b135:
	membar	#Sync			! Added by membar checker (487)
!	%f26 = c1c00000, %f13 = 80000000, %f15 = 00000000
	fsubs	%f26,%f13,%f15		! %f15 = c1c00000
	set	p2_b136,%o7
	fblg,a,pt %fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000019800058] = 1cdd29bc, %l5 = 0000000000009806
	ldub	[%i3+0x05b],%l5		! %l5 = 00000000000000bc
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x088,%g2
p2_b136:
!	Registers modified during the branch to p2_near_3
!	%l1  = fffffffffffff8a9
!	%l2  = 707e67d46ea9ee30
!	%l5  = fffffffffffff0ee
!	%l7  = ffffffffffffffef
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_123:
!	%l7 = ffffffffffffffef, Mem[000000001880014c] = 1df9c71f
	stw	%l7,[%i1+0x14c]		! Mem[000000001880014c] = ffffffef
p2_b137:
	membar	#Sync			! Added by membar checker (488)
!	Branch On Register, %l5 = fffffffffffff0ee
	brgez,pt %l5,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018000190] = f9ae0884, %l4 = 0000000000000024
	ldsh	[%i0+0x192],%l4		! %l4 = 0000000000000884
p2_b138:
	membar	#Sync			! Added by membar checker (489)
!	Mem[0000000030800064] = 6589b4b1, %l5 = fffffffffffff0ee
	ldsba	[%o1+0x067]%asi,%l5	! %l5 = ffffffffffffffb1
!	%l2 = 707e67d46ea9ee30, immed = fffff2b1, %l4 = 0000000000000884
	subc	%l2,-0xd4f,%l4		! %l4 = 707e67d46ea9fb7f

p2_label_124:
	set	p2_b139,%o7
	fbule,pn %fcc2,p2_near_0_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000019800060] = ffff267494383fcf, %l3 = 0000098000000000
	ldx	[%i3+0x060],%l3		! %l3 = ffff267494383fcf
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x08b,%g2
p2_b139:
!	Registers modified during the branch to p2_near_0
!	%l0  = 9694c7085a270bdb
!	%l2  = 707e67d46ea9ff7f
!	%l5  = 00000000000001ff
	membar	#Sync			! Added by membar checker (490)
!	%l5 = 00000000000001ff, immed = 00000941, %y  = ffffffff
	udivcc	%l5,0x941,%l5		! %l5 = 00000000ffffffff, %ccr = 0a
!	%l3 = ffff267494383fcf, immed = 000002c1, %l7 = ffffffffffffffef
	orncc	%l3,0x2c1,%l7		! %l7 = ffffffffffffffff, %ccr = 88
!	%f0  = 00000000 00000000, %f8  = 9c7efa8b
	fdtos	%f0 ,%f8 		! %f8  = 00000000

p2_label_125:
	bg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018800000] = 38763ddf, %l7 = ffffffffffffffff
	lduba	[%i1+%g0]0x80,%l7	! Annulled
p2_b140:
	membar	#Sync			! Added by membar checker (491)
!	Mem[0000000019800000] = bbea5400, %l7 = ffffffffffffffff
	ldsb	[%i3+0x002],%l7		! %l7 = 0000000000000054
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018800040] = 65c26355 1f86bd6b 9e8ba08e 2b3aa1f3
	prefetch [%i1+0x040],2
p2_b141:

p2_label_126:
	membar	#Sync			! Added by membar checker (492)
!	%l6 = ffffa938, %l7 = 00000054, Mem[0000000030800060] = ffffffbd 6589b4b1
	stda	%l6,[%o1+0x060]%asi	! Mem[0000000030800060] = ffffa938 00000054
!	%f20 = 64e85f4b 0f9001f8, %f28 = 3ff00000 00000000, %f6  = 95d070f1 b41f7767
	fmuld	%f20,%f28,%f6 		! %f6  = 64e85f4b 0f9001f8
!	Mem[000000003080006c] = e7d38d64, %l2 = 6ea9ff7f, %l1 = fffff8a9
	add	%o1,0x6c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000e7d38d64
!	%l6 = ffffffffffffa938, immed = 00000024, %l6 = ffffffffffffa938
	sllx	%l6,0x024,%l6		! %l6 = fffa938000000000
!	Mem[0000000019800000] = bbea5400 67494200 98067e8c 5a568f7e
	prefetcha [%i3+0x000]%asi,3

p2_label_127:
!	Mem[0000000040000038] = 160f0000, %l4 = 707e67d46ea9fb7f
	ldsba	[%o5+0x03a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000032000058] = 00000000, %l1 = 00000000e7d38d64
	ldsha	[%o4+0x05a]%asi,%g2	! %g2 = 0000000000000000
!	%l1 = 00000000e7d38d64, immed = 00000012, %l2 = 707e67d46ea9ff7f
	srl	%l1,0x012,%l2		! %l2 = 00000000000039f4
	bneg	p2_b142			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000019800008] = 98067e8c, %l7 = 0000000000000054
	lduba	[%i3+%o6]0x80,%l7	! %l7 = 0000000000000098
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x08e,%g2
p2_b142:

p2_label_128:
	membar	#Sync			! Added by membar checker (493)
!	Mem[000000003100002c] = 00000003, %l0 = 9694c7085a270bdb
	ldsb	[%o2+0x02c],%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000
	sethi	%hi(0xcb46d800),%l0	! %l0 = 00000000cb46d800
!	%f22 = 80000000 00000000, %f2  = e0000000 64685f4b, %f10 = 00000000 00000000
	fdivd	%f22,%f2 ,%f10		! %f10 = 00000000 00000000
!	Mem[0000000019000000] = ffffff98ffffff98, %l1 = 00000000e7d38d64
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = ffffff98ffffff98
	fbe	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_129:
!	Mem[0000000018000008] = ffffcbc5580b62a2, %l6 = fffa938000000000
	ldxa	[%i0+%o6]0x80,%l6	! %l6 = ffffcbc5580b62a2
p2_b143:
	membar	#Sync			! Added by membar checker (494)
!	%f26 = c1c00000 00000000, %f18 = 80000000
	fdtos	%f26,%f18		! %f18 = ce000000
!	Mem[0000000019800000] = bbea540067494200, %l7 = 0000000000000098
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = bbea540067494200
!	Mem[000000003100002c] = 00000003, %l3 = ffff267494383fcf
	lduw	[%o2+0x02c],%l3		! %l3 = 0000000000000003
!	%f3  = 64685f4b, %f12 = 0f9001f8
	fcmpes	%fcc1,%f3 ,%f12		! %fcc1 = 2

p2_label_130:
!	Branch On Register, %l2 = 00000000000039f4
	brgez,a,pn %l2,p2_b144		! Branch Taken
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000032000058] = 00000000 00000003
	std	%l4,[%o4+0x058]	! Mem[0000000032000058] = 00000000 ffffffff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x090,%g2
p2_b144:
	membar	#Sync			! Added by membar checker (495)
!	%f10 = 00000000 00000000, %f6  = 64e85f4b 0f9001f8, %f6  = 64e85f4b 0f9001f8
	faddd	%f10,%f6 ,%f6 		! %f6  = 64e85f4b 0f9001f8
!	%l5 = 00000000ffffffff
	sethi	%hi(0xbee6a800),%l5	! %l5 = 00000000bee6a800
!	Mem[000000003100006c] = 0000ffde, %l3 = 0000000000000003
	ldub	[%o2+0x06f],%l3		! %l3 = 00000000000000de

p2_label_131:
!	%l7 = bbea540067494200, immed = 000001e9, %y  = ffffffff
	umul	%l7,0x1e9,%l2		! %l2 = 000000c54aef1200
	set	p2_b145,%o7
	fble,a,pn %fcc2,p2_near_2_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000031000028] = 00000000, %l3 = 00000000000000de
	ldub	[%o2+0x02a],%l3		! %l3 = 0000000000000000
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x091,%g2
p2_b145:
!	Registers modified during the branch to p2_near_2
!	%l1  = fffffffffffffffa
	membar	#Sync			! Added by membar checker (496)
	set	p2_b146,%o7
	fbul,pn	%fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 1
!	%l2 = 000000c54aef1200, Mem[0000000019800008] = 98067e8c
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000019800008] = 12007e8c
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x092,%g2
p2_b146:
!	Registers modified during the branch to p2_near_0
!	%l1  = 00000000000000c5
!	%l3  = fffffffffffff01d
!	%l7  = fffffffffffffad7

p2_label_132:
	membar	#Sync			! Added by membar checker (497)
!	%l7 = fffffffffffffad7, immed = fffffc1a, %y  = 000000c5
	sdivx	%l7,-0x3e6,%l4		! %l4 = 0000000000000001
	fble,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000030800028] = 3a77a677, %l3 = fffffffffffff01d
	lduh	[%o1+0x028],%l3		! %l3 = 0000000000003a77
p2_b147:
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000019000160] = cb8fcaf5 ea3d17f1 83922a0b a32d9353
	prefetch [%i2+0x160],20
p2_b148:

p2_label_133:
	membar	#Sync			! Added by membar checker (498)
!	Mem[0000000018000008] = ffffcbc5, %l7 = fffffffffffffad7
	lduwa	[%i0+%o6]0x80,%l7	! %l7 = 00000000ffffcbc5
!	%l5 = 00000000bee6a800, %l1 = 00000000000000c5, %y  = 000000c5
	sdiv	%l5,%l1,%l6		! %l6 = 000000007fffffff
!	%l3 = 0000000000003a77, Mem[0000000019000008] = cc6784a2
	stba	%l3,[%i2+%o6]0x80	! Mem[0000000019000008] = 776784a2
!	%l4 = 0000000000000001, immed = 0000001f, %l1 = 00000000000000c5
	sll	%l4,0x01f,%l1		! %l1 = 0000000080000000
	fbu,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2

p2_label_134:
!	%l2 = 4aef1200, %l3 = 00003a77, Mem[0000000018000000] = 007e67d4 6ea9ee30
	stda	%l2,[%i0+%g0]0x80	! Annulled
p2_b149:
	membar	#Sync			! Added by membar checker (499)
	set	p2_b150,%o7
	fbne,a,pt %fcc0,p2_near_0_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000018] = 08adf2627b5dd384, %l3 = 0000000000003a77
	ldx	[%o4+0x018],%g2		! %g2 = 08adf2627b5dd384
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x096,%g2
p2_b150:
!	Registers modified during the branch to p2_near_0
!	%l0  = 00000000cb46d801
!	%l2  = ffffffff7fffffff
!	%l5  = 00000000000001ff
	bpos,a	p2_b151			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[000000001a00007c] = b2921e29, %l5 = 00000000000001ff
	ldsb	[%i4+0x07d],%l5		! %l5 = ffffffffffffff92
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x097,%g2
p2_b151:

p2_label_135:
	membar	#Sync			! Added by membar checker (500)
!	Mem[0000000040000038] = 160f0000, %l3 = 0000000000003a77
	lduw	[%o5+0x038],%l3		! %l3 = 00000000160f0000
	fbuge,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001800013c] = a1ff22e4, %l0 = 00000000cb46d801
	swap	[%i0+0x13c],%l0		! Annulled
p2_b152:
	membar	#Sync			! Added by membar checker (501)
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],21
!	Mem[0000000019800040] = 42e9d279 ebe25987 992de0a9 f5061198
	prefetcha [%i3+0x040]%asi,4

p2_label_136:
	set	p2_b153,%o7
	fbuge,pt %fcc1,p2_near_3_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001a000008] = ffffffff, %l2 = ffffffff7fffffff
	lduha	[%i4+%o6]0x80,%l2	! %l2 = 000000000000ffff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x099,%g2
p2_b153:
!	Registers modified during the branch to p2_near_3
!	%l3  = ffffffffffffff92
	membar	#Sync			! Added by membar checker (502)
!	%f9  = 448d0be9, %f17 = 00000001
	fmovs	%f9 ,%f17		! %f17 = 448d0be9
!	%l4 = 00000001, %l5 = ffffff92, Mem[0000000030800020] = 647becc3 80f46d80
	stda	%l4,[%o1+0x020]%asi	! Mem[0000000030800020] = 00000001 ffffff92
	fbuge	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_137:
!	Mem[0000000019000000] = ffffff98 ffffff98, %l6 = 7fffffff, %l7 = ffffcbc5
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000ffffff98 00000000ffffff98
p2_b154:
	membar	#Sync			! Added by membar checker (503)
!	Branch On Register, %l4 = 0000000000000001
	brlez,pt %l4,p2_not_taken_0	! Branch Not Taken
!	%l7 = 00000000ffffff98, Mem[0000000018000008] = ffffcbc5
	stha	%l7,[%i0+%o6]0x80	! Mem[0000000018000008] = ff98cbc5
p2_b155:
	membar	#Sync			! Added by membar checker (504)
!	%l1 = 0000000080000000, %l6 = 00000000ffffff98, %l2 = 000000000000ffff
	xor	%l1,%l6,%l2		! %l2 = 000000007fffff98
!	%l6 = 00000000ffffff98, %l6 = 00000000ffffff98, %l2 = 000000007fffff98
	andncc	%l6,%l6,%l2		! %l2 = 0000000000000000, %ccr = 44

p2_label_138:
!	Branch On Register, %l4 = 0000000000000001
	brz,pn	%l4,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018000000] = 007e67d4 6ea9ee30 ff98cbc5 580b62a2
	prefetch [%i0+0x000],1
p2_b156:
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = 00000000ffffff98, Mem[0000000019800008] = 12007e8c
	stwa	%l7,[%i3+%o6]0x80	! Mem[0000000019800008] = ffffff98
p2_b157:
	membar	#Sync			! Added by membar checker (505)
!	%l3 = ffffffffffffff92, Mem[00000000190001d8] = d4576abac3dcc286
	stxa	%l3,[%i2+0x1d8]%asi	! Mem[00000000190001d8] = ffffffffffffff92

p2_label_139:
!	Mem[000000003180002c] = 00004183, %l6 = 00000000ffffff98
	ldsw	[%o3+0x02c],%l6		! %l6 = 0000000000004183
!	%l2 = 0000000000000000, Mem[0000000019800008] = ffffff985a568f7e
	stxa	%l2,[%i3+%o6]0x80	! Mem[0000000019800008] = 0000000000000000
!	%l6 = 0000000000004183, Mem[0000000019000000] = ffffff98ffffff98
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000019000000] = 0000000000004183
!	Mem[0000000031800020] = 00000001 00000001, %l4 = 0000000000000001, %l2 = 0000000000000000
	add	%o3,0x20,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 00000000000000c1
!	%f10 = 00000000 00000000, %f2  = e0000000 64685f4b, %f24 = 00000000 00000000
	fmuld	%f10,%f2 ,%f24		! %f24 = 80000000 00000000

p2_label_140:
!	Mem[0000000019000070] = 9102eeb251db7063, %l2 = 00000000000000c1
	ldxa	[%i2+0x070]%asi,%l2	! %l2 = 9102eeb251db7063
!	%l2 = 9102eeb251db7063, Mem[0000000031800068] = 0a5affc8
	stw	%l2,[%o3+0x068]		! Mem[0000000031800068] = 51db7063
!	%f12 = 0f9001f8, %f16 = 00000000
	fabss	%f12,%f16		! %f16 = 0f9001f8
!	Mem[0000000019800008] = 00000000, %l6 = 0000000000004183
	lduba	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000
	set	p2_b158,%o7
	fbne,a	p2_far_0_he	! Branch Taken, %fcc0 = 1

p2_label_141:
!	%l6 = 0000000000000000, Mem[0000000019800098] = ee96c5f2d60f89df
	stx	%l6,[%i3+0x098]		! Mem[0000000019800098] = 0000000000000000
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x09e,%g2
p2_b158:
	membar	#Sync			! Added by membar checker (506)
!	%l7 = 00000000ffffff98
	setx	0xe5925073e5925073,%g7,%l7 ! %l7 = e5925073e5925073
!	%f8  = 00000000, %f21 = 0f9001f8, %f12 = 0f9001f8 80000000
	fsmuld	%f8 ,%f21,%f12		! %f12 = 00000000 00000000
!	%l6 = 0000000000000000, %l4 = 0000000000000001, %y  = 0000012c
	smulcc	%l6,%l4,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%l6 = 00000000, %l7 = e5925073, Mem[0000000018800000] = 38763ddf 00010a82
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000018800000] = 00000000 e5925073

p2_label_142:
!	%l0 = 0000000000000000, Mem[0000000018000008] = ff98cbc5580b62a2
	stxa	%l0,[%i0+%o6]0x80	! Mem[0000000018000008] = 0000000000000000
	bne,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000040000038] = 160f0000, %l5 = ffffffffffffff92
	lduw	[%o5+0x038],%l5		! Annulled
p2_b159:
	membar	#Sync			! Added by membar checker (507)
!	Branch On Register, %l5 = ffffffffffffff92
	brz,a,pn %l5,p2_not_taken_0	! Branch Not Taken
!	%l4 = 00000001, %l5 = ffffff92, Mem[0000000019000000] = 00000000 00004183
	stda	%l4,[%i2+%g0]0x80	! Annulled
p2_b160:

p2_label_143:
	membar	#Sync			! Added by membar checker (508)
!	Mem[0000000031000020] = 82009ce0, %l1 = 80000000, %l4 = 00000001
	add	%o2,0x20,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000082009ce0
!	%f17 = 448d0be9, %f12 = 00000000 00000000
	fstod	%f17,%f12		! %f12 = 4091a17d 20000000
	set	p2_b161,%o7
	fblg	p2_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000019000008] = 776784a2, %l2 = 9102eeb251db7063
	ldswa	[%i2+%o6]0x80,%l2	! %l2 = 00000000776784a2
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x0a1,%g2
p2_b161:
!	Registers modified during the branch to p2_far_1
!	%l0  = 00000000ffffff92
!	%l1  = 000000001ab0af8e
!	%l4  = 0000000000000000
!	%l5  = ffffffffffffff92
!	%l7  = e5925073e5925005
	membar	#Sync			! Added by membar checker (509)
!	%l0 = 00000000ffffff92, %l0 = 00000000ffffff92, %y  = 00000000
	udivx	%l0,%l0,%l5		! %l5 = 0000000000000001

p2_label_144:
	set	p2_b162,%o7
	fbul	p2_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000019800008] = 00000000, %l0 = 00000000ffffff92
	lduba	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0a2,%g2
p2_b162:
!	Registers modified during the branch to p2_far_3
!	%l0  = fffffffffffff0f2
!	%l3  = 1a6daf8c1a6daf8d
!	%l5  = fe48000000000000
	membar	#Sync			! Added by membar checker (510)
	set	p2_b163,%o7
	fble,pn	%fcc3,p2_near_1_he	! Branch Taken, %fcc3 = 1
!	Mem[0000000030800060] = ffffa938, %l0 = fffffffffffff0f2
	ldsh	[%o1+0x062],%l0		! %l0 = ffffffffffffa938
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x0a3,%g2
p2_b163:
!	Registers modified during the branch to p2_near_1
!	%l1  = 0000000092183430
!	%l4  = 00000000921862f7
!	%l5  = 1a6daf8c1a6da939
	membar	#Sync			! Added by membar checker (511)
!	%l2 = 00000000776784a2, immed = fffff7a9, %l0 = ffffffffffffa938
	xorcc	%l2,-0x857,%l0		! %l0 = ffffffff8898730b, %ccr = 88

p2_label_145:
!	Mem[0000000030000028] = 0a5a3cd8, %l6 = 0000000000000000
	swapa	[%o0+0x028]%asi,%l6	! %l6 = 000000000a5a3cd8
!	Mem[0000000018000008] = 00000000, %l0 = ffffffff8898730b
	ldsha	[%i0+%o6]0x80,%l0	! %l0 = 0000000000000000
!	Branch On Register, %l6 = 000000000a5a3cd8
	brgz,a,pn %l6,p2_b164		! Branch Taken
!	%l2 = 00000000776784a2, Mem[0000000019800000] = bbea540067494200
	stxa	%l2,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000000776784a2
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0a4,%g2
p2_b164:
	membar	#Sync			! Added by membar checker (512)
!	%l4 = 00000000921862f7, immed = 00000bd5, %l1 = 0000000092183430
	andncc	%l4,0xbd5,%l1		! %l1 = 0000000092186022, %ccr = 08

p2_label_146:
!	%l0 = 0000000000000000, %l1 = 0000000092186022, %l6 = 000000000a5a3cd8
	xorcc	%l0,%l1,%l6		! %l6 = 0000000092186022, %ccr = 08
!	Mem[0000000019000000] = 0000000000004183, %l6 = 0000000092186022
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000004183
	bcc,a	p2_b165			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000030000020] = c60f75ff fffffff9, %l2 = 776784a2, %l3 = 1a6daf8d
	ldd	[%o0+0x020],%l2		! %l2 = 00000000c60f75ff 00000000fffffff9
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x0a5,%g2
p2_b165:
	membar	#Sync			! Added by membar checker (513)
!	%f23 = 00000000, %f30 = 449d0be9
	fitos	%f23,%f30		! %f30 = 00000000

p2_label_147:
!	%f0  = 00000000 00000000, %f11 = 00000000
	fdtos	%f0 ,%f11		! %f11 = 00000000
!	%l6 = 0000000000004183, immed = fffff5a1, %l3 = 00000000fffffff9
	subccc	%l6,-0xa5f,%l3		! %l3 = 0000000000004be2, %ccr = 11
!	%l0 = 0000000000000000, immed = 00000018, %l0 = 0000000000000000
	sra	%l0,0x018,%l0		! %l0 = 0000000000000000
	set	p2_b166,%o7
	fbne,a,pt %fcc2,p2_near_2_he	! Branch Taken, %fcc2 = 1
!	%l2 = 00000000c60f75ff, Mem[0000000018000108] = 5fb8872826b88920
	stx	%l2,[%i0+0x108]		! Mem[0000000018000108] = 00000000c60f75ff
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0a6,%g2
p2_b166:
!	Registers modified during the branch to p2_near_2
!	%l1  = 00000000921862f1

p2_label_148:
	membar	#Sync			! Added by membar checker (514)
!	%l4 = 921862f7, %l5 = 1a6da939, Mem[0000000031800068] = 51db7063 3ad39e73
	stda	%l4,[%o3+0x068]%asi	! Mem[0000000031800068] = 921862f7 1a6da939
!	%f20 = 64e85f4b 0f9001f8, %f26 = c1c00000 00000000, %f24 = 80000000 00000000
	fdivd	%f20,%f26,%f24		! %f24 = e3185f4b 0f9001f8
	set	p2_b167,%o7
	fba,a	p2_far_3_le	! Branch Taken, %fcc0 = 1
!	%l0 = 0000000000000000, Mem[0000000032000028] = 537245c7b3b6f9b1
	stx	%l0,[%o4+0x028]		! Annulled
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x0a7,%g2
p2_b167:
!	Registers modified during the branch to p2_far_3
!	%l0  = 1a6daf8c1a6da93a
!	%l4  = 1a6daf8c9a7debff
	membar	#Sync			! Added by membar checker (515)
!	%l4 = 1a6daf8c9a7debff, %l5 = 1a6daf8c1a6da939, %l6 = 0000000000004183
	or	%l4,%l5,%l6		! %l6 = 1a6daf8c9a7debff

p2_label_149:
!	%f10 = 00000000 00000000, %f30 = 00000000
	fdtoi	%f10,%f30		! %f30 = 00000000
!	%l4 = 1a6daf8c9a7debff, Mem[0000000019000008] = 776784a2
	stba	%l4,[%i2+%o6]0x80	! Mem[0000000019000008] = ff6784a2
!	%l0 = 1a6daf8c1a6da93a, %l7 = e5925073e5925005, %l6 = 1a6daf8c9a7debff
	subccc	%l0,%l7,%l6		! %l6 = 34db5f1834db5935, %ccr = 11
!	Mem[0000000018800008] = fadab81e a5c01cca, %l6 = 34db5935, %l7 = e5925005
	ldda	[%i1+%o6]0x80,%l6	! %l6 = 00000000fadab81e 00000000a5c01cca
!	Mem[0000000031800068] = 921862f7 1a6da939, %l0 = 1a6da93a, %l1 = 921862f1
	ldda	[%o3+0x068]%asi,%l0	! %l0 = 00000000921862f7 000000001a6da939

p2_label_150:
!	%f4  = 00000000 00000000, %f16 = 0f9001f8 448d0be9, %f10 = 00000000 00000000
	faddd	%f4 ,%f16,%f10		! %f10 = 0f9001f8 448d0be9
!	%l6 = 00000000fadab81e, immed = 000009f5, %y  = 00000000
	sdivcc	%l6,0x9f5,%l7		! %l7 = 0000000000193195, %ccr = 00
!	%l4 = 1a6daf8c9a7debff, immed = 00000397, %y  = 00000000
	udivx	%l4,0x397,%l0		! %l0 = 00075cac957a6d2c
	bgu,a	p2_b168			! Branch Taken, %ccr = 00, CWP = 0
!	%l1 = 000000001a6da939, Mem[000000003000002c] = a1740000
	stw	%l1,[%o0+0x02c]		! Mem[000000003000002c] = 1a6da939
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x0a8,%g2
p2_b168:

p2_label_151:
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = 0000000000193195, Mem[00000000180001b6] = 27fdccda
	stb	%l7,[%i0+0x1b6]		! Mem[00000000180001b4] = 27fd95da
p2_b169:
	membar	#Sync			! Added by membar checker (516)
!	%f14 = 00000000, %f30 = 00000000
	fcmpes	%fcc1,%f14,%f30		! %fcc1 = 0
!	%f20 = 64e85f4b, %f6  = 64e85f4b
	fabss	%f20,%f6 		! %f6  = 64e85f4b
!	%f31 = 448d0be9, %f28 = 3ff00000
	fnegs	%f31,%f28		! %f28 = c48d0be9

p2_label_152:
!	Mem[0000000018800130] = 818391c2ab6cc450, %l2 = 00000000c60f75ff
	ldxa	[%i1+0x130]%asi,%l2	! %l2 = 818391c2ab6cc450
!	%l6 = 00000000fadab81e, Mem[0000000019000008] = ff6784a2
	stwa	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = fadab81e
!	Mem[0000000019800180] = 05fb285a 330ebde3 d1265475 f8ab097b
	prefetch [%i3+0x180],2
!	%f0  = 00000000 00000000, %f16 = 0f9001f8
	fxtos	%f0 ,%f16		! %f16 = 00000000
!	%l1 = 000000001a6da939, immed = 00000e4b, %y  = 00000000
	sdiv	%l1,0xe4b,%l7		! %l7 = 000000000001d95b

p2_label_153:
	fbg,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000030800060] = ffffa938, %l5 = 1a6daf8c1a6da939
	lduw	[%o1+0x060],%l5		! %l5 = 00000000ffffa938
p2_b170:
	fbug,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018000188] = 390120e7, %l3 = 0000000000004be2
	swap	[%i0+0x188],%l3		! Annulled
p2_b171:
	membar	#Sync			! Added by membar checker (517)
!	Mem[00000000190001d6] = f29b9796, %l2 = 818391c2ab6cc450
	ldstub	[%i2+0x1d6],%l2		! %l2 = 0000000000000097

p2_label_154:
!	Mem[000000003200007c] = ceb28373, %l4 = 1a6daf8c9a7debff
	ldswa	[%o4+0x07c]%asi,%g2	! %g2 = 1a6daf8c9a7debff
!	Jump to jmpl_0, CWP = 0
	set	p2_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	%l5 = 00000000ffffa938, Mem[00000000188001e8] = d99cd4a4
	stw	%l5,[%i1+0x1e8]		! Mem[00000000188001e8] = ffffa938
!	Registers modified during the branch to p2_jmpl_0
!	%l4  = 69b6be3269f7affc
!	%l5  = 0000000000000130
!	Mem[0000000019800000] = 00000000, %l4 = 69b6be3269f7affc
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f15 = c1c00000, %f28 = c48d0be9 00000000
	fstod	%f15,%f28		! %f28 = c0380000 00000000

p2_label_155:
!	%f29 = 00000000, %f26 = c1c00000 00000000
	fstod	%f29,%f26		! %f26 = 00000000 00000000
!	%l1 = 000000001a6da939, immed = fffff656, %l7 = 000000000001d95b
	orn	%l1,-0x9aa,%l7		! %l7 = 000000001a6da9b9
!	%l6 = 00000000fadab81e, Mem[0000000019000000] = 00000000
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000019000000] = 1e000000
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000070] = 219d95c8, %l0 = 00075cac957a6d2c
	ldub	[%o4+0x073],%g2		! %g2 = 0000000000000021
p2_b172:

p2_label_156:
	membar	#Sync			! Added by membar checker (518)
!	Mem[0000000019800000] = 00000000, %l0 = 00075cac957a6d2c
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000fadab81e, immed = fffffc2b, %l2 = 0000000000000097
	or	%l6,-0x3d5,%l2		! %l2 = fffffffffffffc3f
!	%f24 = e3185f4b, %f19 = 00000000, %f2  = e0000000
	fmuls	%f24,%f19,%f2 		! %f2  = 80000000
	bgu,a	p2_b173			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000019000000] = 1e000000, %l3 = 0000000000004be2
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 000000000000001e
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0ad,%g2
p2_b173:

p2_label_157:
	set	p2_b174,%o7
	fbne,a	p2_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000018000008] = 00000000 00000000, %l2 = fffffc3f, %l3 = 0000001e
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0ae,%g2
p2_b174:
!	Registers modified during the branch to p2_far_2
!	%l0  = 0000000000000000
!	%l3  = fffffffffffffc89
!	%l5  = 000000000000025d
	membar	#Sync			! Added by membar checker (519)
!	Mem[0000000031000060] = 9cdbd870, %l0 = 0000000000000000
	lduwa	[%o2+0x060]%asi,%l0	! %l0 = 000000009cdbd870
!	Branch On Register, %l6 = 00000000fadab81e
	brlz,pt	%l6,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000168] = 83922a0b, %l5 = 000000000000025d
	lduw	[%i2+0x168],%l5		! %l5 = 0000000083922a0b
p2_b175:

p2_label_158:
	membar	#Sync			! Added by membar checker (520)
!	Mem[0000000018800060] = 8600191b 41af9197 4fe7d178 a68c49a9
	prefetcha [%i1+0x060]%asi,22
!	%f4  = 00000000 00000000, %f24 = e3185f4b 0f9001f8, %f18 = ce000000 00000000
	fdivd	%f4 ,%f24,%f18		! %f18 = 80000000 00000000
!	%f24 = e3185f4b, %f24 = e3185f4b, %f28 = c0380000 00000000
	fsmuld	%f24,%f24,%f28		! %f28 = 48d6ac53 222ffe40
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000031000060] = 9cdbd870, %l7 = 000000001a6da9b9
	lduw	[%o2+0x060],%l7		! Annulled
p2_b176:

p2_label_159:
	membar	#Sync			! Added by membar checker (521)
	set	p2_b177,%o7
	fba,pn	%fcc2,p2_near_2_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000018000060] = ebac59f4 17e52ca8 2b9bc51b cee23f0d
	prefetch [%i0+0x060],22
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p2_branch_failed
	mov	0x0b1,%g2
p2_b177:
!	Registers modified during the branch to p2_near_2
!	%l1  = fffffffffffffffa
!	call to call_1, CWP = 0
	call	p2_call_1_he
!	Mem[0000000018000000] = 007e67d4, %l6 = 00000000fadab81e
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 000000000000007e
	membar	#Sync			! Added by membar checker (522)
!	Mem[000000001900006c] = 00000000, %l1 = fffffffffffffffa
	swapa	[%i2+0x06c]%asi,%l1	! %l1 = 0000000000000000

p2_label_160:
!	%l7 = 000000001a6da9b9, %l2 = 0000000000000000, %y  = 00000000
	mulx	%l7,%l2,%l6		! %l6 = 0000000000000000
!	Mem[0000000030800028] = 3a77a677, %l2 = 0000000000000000
	ldsb	[%o1+0x02b],%l2		! %l2 = 0000000000000077
!	%f17 = 448d0be9, %f27 = 00000000, %f26 = 00000000 00000000
	fsmuld	%f17,%f27,%f26		! %f26 = 00000000 00000000
!	Mem[0000000032000060] = e6a70116 4168fde0 d3a59bed c4c547d0
	prefetcha [%o4+0x060]%asi,2
	fbge,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1

p2_label_161:
!	%l0 = 9cdbd870, %l1 = 00000000, Mem[0000000030800020] = 00000001 ffffff92
	std	%l0,[%o1+0x020]	! Annulled
p2_b178:
	membar	#Sync			! Added by membar checker (523)
!	Branch On Register, %l2 = 0000000000000077
	brlez,a,pt %l2,p2_not_taken_0	! Branch Not Taken
!	Mem[00000000188000c0] = f8a1f8de, %l7 = 000000001a6da9b9
	swap	[%i1+0x0c0],%l7		! Annulled
p2_b179:
	membar	#Sync			! Added by membar checker (524)
	fbl,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],16	! Annulled
p2_b180:

p2_label_162:
	membar	#Sync			! Added by membar checker (525)
!	%l4 = 00000000, %l5 = 83922a0b, Mem[0000000031000028] = 00000000 00000003
	stda	%l4,[%o2+0x028]%asi	! Mem[0000000031000028] = 00000000 83922a0b
!	%l5 = 0000000083922a0b, immed = 0000045f, %y  = 00000000
	smul	%l5,0x45f,%l6		! %l6 = fffffde01be5c615
	set	p2_b181,%o7
	fbne,a,pt %fcc3,p2_near_0_he	! Branch Taken, %fcc3 = 1
!	Mem[0000000030000064] = a9663cd8, %l2 = 0000000000000077
	ldub	[%o0+0x065],%l2		! %l2 = 0000000000000066
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p2_branch_failed
	mov	0x0b5,%g2
p2_b181:
!	Registers modified during the branch to p2_near_0
!	%l0  = 000000009cdbd871
!	%l2  = ffffffffffffffff
!	%l5  = 0000000000000034
	membar	#Sync			! Added by membar checker (526)
!	%f14 = 00000000, %f25 = 0f9001f8
	fstoi	%f14,%f25		! %f25 = 00000000

p2_label_163:
!	%l7 = 000000001a6da9b9, Mem[0000000030000028] = 000000001a6da939
	stx	%l7,[%o0+0x028]		! Mem[0000000030000028] = 000000001a6da9b9
	fbn,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l1 = 0000000000000000, Mem[0000000030000028] = 000000001a6da9b9
	stx	%l1,[%o0+0x028]		! Annulled
p2_b182:
	membar	#Sync			! Added by membar checker (527)
!	%l2 = ffffffffffffffff, immed = fffff26a, %y  = fffffde0
	smul	%l2,-0xd96,%l1		! %l1 = 0000000000000d96
!	Mem[0000000032000028] = 537245c7, %l2 = ffffffffffffffff
	lduh	[%o4+0x028],%g2		! %g2 = 0000000000005372

p2_label_164:
!	Mem[0000000019800020] = af401f045f339e15, %l2 = ffffffffffffffff
	ldxa	[%i3+0x020]%asi,%l2	! %l2 = af401f045f339e15
!	Mem[0000000019800008] = 00000000, %l2 = af401f045f339e15
	ldsba	[%i3+%o6]0x80,%l2	! %l2 = 0000000000000000
!	%f18 = 80000000, %f11 = 448d0be9, %f29 = 222ffe40
	fdivs	%f18,%f11,%f29		! %f29 = 80000000
!	Mem[0000000018000000] = 007e67d4 6ea9ee30 00000000 00000000
	prefetcha [%i0+0x000]%asi,21
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l0 = 000000009cdbd871
	addcc	%l2,%l2,%l0		! %l0 = 0000000000000000, %ccr = 44

p2_label_165:
!	%f26 = 00000000, %f2  = 80000000, %f12 = 4091a17d 20000000
	fsmuld	%f26,%f2 ,%f12		! %f12 = 80000000 00000000
!	%l5 = 0000000000000034, immed = fffff17b, %y  = 00000000
	udivx	%l5,-0xe85,%l7		! %l7 = 0000000000000000
	bpos	p2_b183			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[00000000198000c0] = b68116f7 2429057c 8aa79cce f5d4e7da
	prefetch [%i3+0x0c0],20
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x0b7,%g2
p2_b183:
	set	p2_b184,%o7
	fbne	p2_far_1_le	! Branch Taken, %fcc0 = 1

p2_label_166:
!	Mem[0000000019800008] = 00000000, %l5 = 0000000000000034
	ldsba	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0b8,%g2
p2_b184:
!	Registers modified during the branch to p2_far_1
!	%l0  = 0000000000000000
!	%l1  = 000000001ab0af8e
!	%l4  = 0000000000000000
!	%l5  = fffffde01be5c615
!	%l7  = fffffffffffffc89
	membar	#Sync			! Added by membar checker (528)
!	%f12 = 80000000, %f6  = 64e85f4b, %f25 = 00000000
	fadds	%f12,%f6 ,%f25		! %f25 = 64e85f4b
	fbuge,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018000000] = 007e67d4, %l1 = 000000001ab0af8e
	ldsha	[%i0+%g0]0x80,%l1	! Annulled
p2_b185:
	membar	#Sync			! Added by membar checker (529)
!	Mem[0000000030000068] = bfe0e6ab, %l2 = 0000000000000000
	ldub	[%o0+0x06a],%l2		! %l2 = 00000000000000e6

p2_label_167:
!	%l1 = 000000001ab0af8e, Mem[0000000018000008] = 0000000000000000
	stxa	%l1,[%i0+%o6]0x80	! Mem[0000000018000008] = 000000001ab0af8e
	fbge,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l6 = fffffde01be5c615, Mem[0000000018800008] = fadab81e
	stba	%l6,[%i1+%o6]0x80	! Mem[0000000018800008] = 15dab81e
p2_b186:
	set	p2_b187,%o7
	fbule	p2_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000018800000] = 00000000, %l6 = fffffde01be5c615
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p2_branch_failed
	mov	0x0bb,%g2
p2_b187:
!	Registers modified during the branch to p2_far_2
!	%l0  = fffffffffff91200
!	%l3  = fffffffffffff912
!	%l5  = fffffde01be5c742

p2_label_168:
	membar	#Sync			! Added by membar checker (530)
	set	p2_b188,%o7
	fbue,pt	%fcc1,p2_near_3_he	! Branch Taken, %fcc1 = 0
!	%l4 = 00000000, %l5 = 1be5c742, Mem[0000000019000000] = ff000000 00004183
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = 00000000 1be5c742
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0bc,%g2
p2_b188:
!	Registers modified during the branch to p2_near_3
!	%l3  = fffffde01be5c742
	membar	#Sync			! Added by membar checker (531)
!	%l6 = 0000000000000000, %l6 = 0000000000000000, %y  = ffffffff
	smul	%l6,%l6,%l0		! %l0 = 0000000000000000
!	%f20 = 64e85f4b 0f9001f8, %f4  = 00000000 00000000
	fabsd	%f20,%f4 		! %f4  = 64e85f4b 0f9001f8
!	Branch On Register, %l0 = 0000000000000000
	brgz,a,pn %l0,p2_not_taken_0	! Branch Not Taken

p2_label_169:
!	Mem[000000001900019c] = 7277d760, %l5 = fffffde01be5c742
	lduh	[%i2+0x19e],%l5		! Annulled
p2_b189:
	membar	#Sync			! Added by membar checker (532)
!	%l3 = fffffde01be5c742, %l7 = fffffffffffffc89, %l0 = 0000000000000000
	sll	%l3,%l7,%l0		! %l0 = fffbc037cb8e8400
!	Mem[0000000018800008] = 15dab81e, %l2 = 00000000000000e6
	lduha	[%i1+%o6]0x80,%l2	! %l2 = 00000000000015da
!	%l3 = fffffde01be5c742, immed = 00000477, %l5 = fffffde01be5c742
	taddcc	%l3,0x477,%l5		! %l5 = fffffde01be5cbb9, %ccr = 82
!	%l7 = fffffffffffffc89, immed = 00000022, %l1 = 000000001ab0af8e
	srlx	%l7,0x022,%l1		! %l1 = 000000003fffffff

p2_label_170:
	bne,a	p2_b190			! Branch Taken, %ccr = 82, CWP = 0
!	Mem[00000000190000c0] = 8be1d371 96ed4f33 ed9bdb22 fc8db7bb
	prefetch [%i2+0x0c0],22
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x0be,%g2
p2_b190:
	membar	#Sync			! Added by membar checker (533)
!	%l7 = fffffffffffffc89, immed = fffffdcd, %l4 = 0000000000000000
	xnorcc	%l7,-0x233,%l4		! %l4 = fffffffffffffebb, %ccr = 88
!	Mem[0000000040000039] = 160f0000, %l5 = fffffde01be5cbb9
	ldstuba	[%o5+0x039]%asi,%l5	! %l5 = 000000000000000f
!	%l5 = 000000000000000f, Mem[000000001900010e] = 5c5aebf5
	sth	%l5,[%i2+0x10e]		! Mem[000000001900010c] = 5c5a000f

p2_label_171:
!	%l2 = 00000000000015da, %l2 = 00000000000015da, %y  = 00000000
	sdiv	%l2,%l2,%l4		! %l4 = 0000000000000001
	set	p2_b191,%o7
	fbo,pn	%fcc2,p2_near_3_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000019800008] = 00000000, %l6 = 0000000000000000
	lduha	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x0bf,%g2
p2_b191:
!	Registers modified during the branch to p2_near_3
!	%l1  = fffffffffffff9fa
!	%l2  = 707e67d46ea9ee30
!	%l5  = fffffffffffff1bd
!	%l7  = fffffffffffffffe
	membar	#Sync			! Added by membar checker (534)
!	Mem[0000000018800100] = a9f29d6c b4ace454 6d989821 62a8f98b
	prefetcha [%i1+0x100]%asi,23
!	%l6 = 0000000000000000, %l7 = fffffffffffffffe, %l6 = 0000000000000000
	orcc	%l6,%l7,%l6		! %l6 = fffffffffffffffe, %ccr = 88

p2_label_172:
	fbue,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000018000000] = 007e67d4, %l3 = fffffde01be5c742
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
p2_b192:
	membar	#Sync			! Added by membar checker (535)
!	Mem[00000000190001a0] = 97726b00, %l4 = 0000000000000001
	ldsh	[%i2+0x1a0],%l4		! %l4 = ffffffffffff9772
!	%l4 = ffffffffffff9772, %l1 = fffffffffffff9fa, %y  = 00000000
	sdivx	%l4,%l1,%l2		! %l2 = 0000000000000011
!	Mem[000000001a800008] = fffffb92, %l2 = 0000000000000011
	ldsha	[%i5+%o6]0x80,%l2	! %l2 = ffffffffffffffff

p2_label_173:
!	%l4 = ffffffffffff9772, immed = 00000ee2, %y  = 00000000
	sdivx	%l4,0xee2,%l7		! %l7 = fffffffffffffff9
!	Mem[000000001800009c] = cb064a13, %l5 = fffffffffffff1bd
	ldsb	[%i0+0x09d],%l5		! %l5 = 0000000000000006
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000019800008] = 00000000, %l0 = fffbc037cb8e8400
	ldswa	[%i3+%o6]0x80,%l0	! Annulled
p2_b193:
	membar	#Sync			! Added by membar checker (536)
!	%l2 = ffffffffffffffff, Mem[0000000030000068] = bfe0e6ab56c40fff
	stx	%l2,[%o0+0x068]		! Mem[0000000030000068] = ffffffffffffffff

p2_label_174:
!	%l6 = fffffffffffffffe, Mem[0000000018800000] = 00000000
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000018800000] = fe000000
!	%f27 = 00000000, %f19 = 00000000
	fcmps	%fcc3,%f27,%f19		! %fcc3 = 0
!	%l5 = 0000000000000006, %l0 = fffbc037cb8e8400, %l0 = fffbc037cb8e8400
	add	%l5,%l0,%l0		! %l0 = fffbc037cb8e8406
	set	p2_b194,%o7
	fbul	p2_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[00000000180000bf] = 1bce09b2, %l3 = 0000000000000000
	ldstub	[%i0+0x0bf],%l3		! %l3 = 00000000000000b2
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0c2,%g2
p2_b194:
!	Registers modified during the branch to p2_far_2
!	%l4  = 00000000000000b1
!	%l6  = fffff2a800000d57

p2_label_175:
	membar	#Sync			! Added by membar checker (537)
!	%l3 = 00000000000000b2, Mem[00000000180000da] = 0ffd8403
	stha	%l3,[%i0+0x0da]%asi	! Mem[00000000180000d8] = 0ffd00b2
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],2
!	%l6 = fffff2a800000d57, Mem[0000000018800137] = ab6cc450
	stba	%l6,[%i1+0x137]%asi	! Mem[0000000018800134] = ab6cc457
!	Mem[0000000019800000] = ff000000776784a2, %l4 = 00000000000000b1
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = ff000000776784a2
	bleu	p2_b195			! Branch Taken, %ccr = 13, CWP = 0

p2_label_176:
!	Mem[00000000180000c0] = 02c22151 590139dd 49c0d1b4 8d4ed2ec
	prefetch [%i0+0x0c0],4
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x0c3,%g2
p2_b195:
	membar	#Sync			! Added by membar checker (538)
	set	p2_b196,%o7
	fble,a,pt %fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000019000000] = 00000000, %l7 = fffffffffffffff9
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x0c4,%g2
p2_b196:
!	Registers modified during the branch to p2_near_2
!	%l0  = ff000000776784a2
!	%l5  = fbfffae06aeb1c88
!	%l6  = fbfffae06aeb1c88
	membar	#Sync			! Added by membar checker (539)
	fblg,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[00000000180000a0] = d800e072 c55cb225 d1767b92 6aab4f52
	prefetch [%i0+0x0a0],0	! Annulled
p2_b197:

p2_label_177:
	membar	#Sync			! Added by membar checker (540)
!	%l4 = ff000000776784a2, Mem[00000000180001de] = c09b8bfb
	stb	%l4,[%i0+0x1de]		! Mem[00000000180001dc] = c09ba2fb
!	Mem[00000000190000c0] = 8be1d371 96ed4f33
	flush	%i2+0x0c0
	bcc	p2_b198			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000019800135] = 17b573cb, %l2 = ffffffffffffffff
	ldstub	[%i3+0x135],%l2		! %l2 = 00000000000000b5
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x0c6,%g2
p2_b198:
	membar	#Sync			! Added by membar checker (541)
!	%l0 = ff000000776784a2, Mem[0000000032000030] = 9197a540db0e3cdc
	stxa	%l0,[%o4+0x030]%asi	! Mem[0000000032000030] = ff000000776784a2

p2_label_178:
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[000000003080006c] = e7d38d64, %l6 = fbfffae06aeb1c88
	ldub	[%o1+0x06e],%l6		! Annulled
p2_b199:
	membar	#Sync			! Added by membar checker (542)
!	Mem[0000000019800050] = 31a3451a, %l6 = fbfffae06aeb1c88
	lduha	[%i3+0x052]%asi,%l6	! %l6 = 000000000000451a
!	Mem[0000000018000170] = 05c3a0bb, %l3 = 000000b2, %l0 = 776784a2
	add	%i0,0x170,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000005c3a0bb
!	%l0 = 0000000005c3a0bb, immed = 00000014, %l7 = 0000000000000000
	sra	%l0,0x014,%l7		! %l7 = 000000000000005c

p2_label_179:
!	Mem[0000000019800104] = 0c6ea1c2, %l1 = fffffffffffff9fa
	lduwa	[%i3+0x104]%asi,%l1	! %l1 = 000000000c6ea1c2
!	%l5 = fbfffae06aeb1c88, immed = fffff023, %l0 = 0000000005c3a0bb
	andncc	%l5,-0xfdd,%l0		! %l0 = 0000000000000c88, %ccr = 00
!	%l5 = fbfffae06aeb1c88, immed = 00000006, %l0 = 0000000000000c88
	sll	%l5,0x006,%l0		! %l0 = fffeb81abac72200
	set	p2_b200,%o7
	fbl,a	p2_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000030800020] = 00000001ffffff92, %l6 = 000000000000451a
	ldx	[%o1+0x020],%l6		! %l6 = 00000001ffffff92
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0c8,%g2
p2_b200:
!	Registers modified during the branch to p2_far_0
!	%l3  = ffffffffffffffda
!	%l7  = 00000001fffff980

p2_label_180:
	membar	#Sync			! Added by membar checker (543)
!	%f24 = e3185f4b 64e85f4b, %f4  = 64e85f4b 0f9001f8
	fcmpd	%fcc2,%f24,%f4 		! %fcc2 = 1
!	call to call_2, CWP = 0
	call	p2_call_2_le
!	%l0 = fffeb81abac72200, Mem[0000000018800110] = 8ed6a19210578bdc
	stx	%l0,[%i1+0x110]		! Mem[0000000018800110] = fffeb81abac72200
!	Registers modified during the branch to p2_call_2
!	%l5  = 00000000000032dc
!	%l6  = 31de864096362e10
!	%l4 = ff000000776784a2, %l0 = fffeb81abac72200, %l3 = ffffffffffffffda
	orn	%l4,%l0,%l3		! %l3 = ff0147e5777fddff
	fbge,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1

p2_label_181:
!	Mem[0000000030800020] = 00000001ffffff92, %l6 = 31de864096362e10
	ldx	[%o1+0x020],%l6		! %l6 = 00000001ffffff92
p2_b201:
	membar	#Sync			! Added by membar checker (544)
!	%l1 = 000000000c6ea1c2, immed = 00000034, %l2 = 00000000000000b5
	srax	%l1,0x034,%l2		! %l2 = 0000000000000000
!	%l4 = ff000000776784a2, %l1 = 000000000c6ea1c2, %y  = 31de8640
	umulcc	%l4,%l1,%l0		! %l0 = 05cc74252c7864c4, %ccr = 00
!	%f6  = 64e85f4b, %f27 = 00000000
	fnegs	%f6 ,%f27		! %f27 = e4e85f4b
!	Mem[00000000190000e8] = 43fa14f0 a8df0b2f, %l0 = 2c7864c4, %l1 = 0c6ea1c2
	ldd	[%i2+0x0e8],%l0		! %l0 = 0000000043fa14f0 00000000a8df0b2f

p2_label_182:
!	%l5 = 00000000000032dc, immed = 00000d74, %y  = 05cc7425
	sdivx	%l5,0xd74,%l4		! %l4 = 0000000000000003
!	%l2 = 0000000000000000, %l0 = 0000000043fa14f0, %l6 = 00000001ffffff92
	srl	%l2,%l0,%l6		! %l6 = 0000000000000000
	bneg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031000020] = 82009ce0fb5dcc98, %l7 = 00000001fffff980
	ldx	[%o2+0x020],%l7		! Annulled
p2_b202:
	membar	#Sync			! Added by membar checker (545)
!	Mem[0000000018800120] = 7ddb83ad 1ab0af8e 12b7bc65 1e826b81
	prefetcha [%i1+0x120]%asi,23

p2_label_183:
	fbuge,pt %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000019800008] = 00000000, %l4 = 0000000000000003
	ldsba	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
p2_b203:
	membar	#Sync			! Added by membar checker (546)
!	%f13 = 00000000, %f27 = e4e85f4b
	fcmpes	%fcc0,%f13,%f27		! %fcc0 = 2
!	Mem[00000000198001d8] = a237b170c4560715, %l7 = 00000001fffff980
	ldxa	[%i3+0x1d8]%asi,%l7	! %l7 = a237b170c4560715
	set	p2_b204,%o7
	fblg	p2_far_1_he	! Branch Taken, %fcc0 = 2

p2_label_184:
!	Mem[0000000019000000] = 00000000, %l0 = 0000000043fa14f0
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p2_branch_failed
	mov	0x0cc,%g2
p2_b204:
!	Registers modified during the branch to p2_far_1
!	%l0  = 26162c33eb7d105c
!	%l1  = 00000000000001a2
!	%l3  = 0000000000000000
!	%l5  = 00000000000001e3
	membar	#Sync			! Added by membar checker (547)
!	%f12 = 80000000 00000000, %f20 = 64e85f4b 0f9001f8
	fmovd	%f12,%f20		! %f20 = 80000000 00000000
!	Mem[0000000019000008] = fadab81e, %l0 = 26162c33eb7d105c
	ldsha	[%i2+%o6]0x80,%l0	! %l0 = fffffffffffffada
	fbe,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000031000028] = 00000000, %l6 = 0000000000000000
	lduw	[%o2+0x028],%l6		! %l6 = 0000000000000000
p2_b205:

p2_label_185:
	membar	#Sync			! Added by membar checker (548)
	fbg,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[00000000180001c0] = c1f772b4 e427d49d 1384d15d fafb18f5
	prefetch [%i0+0x1c0],20	! Annulled
p2_b206:
	membar	#Sync			! Added by membar checker (549)
!	Mem[0000000031800024] = 000000c1, %l4 = 0000000000000000
	ldsh	[%o3+0x026],%l4		! %l4 = 00000000000000c1
!	%l6 = 00000000, %l7 = c4560715, Mem[0000000019800000] = ff000000 776784a2
	stda	%l6,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000000 c4560715
!	%l1 = 00000000000001a2, immed = 0000000e, %l0 = fffffffffffffada
	srax	%l1,0x00e,%l0		! %l0 = 0000000000000000

p2_label_186:
!	Mem[0000000018800084] = 5a1da192, %l7 = c4560715, %l0 = 00000000
	add	%i1,0x84,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 000000005a1da192
!	%f6  = 64e85f4b, %f18 = 80000000
	fcmpes	%fcc1,%f6 ,%f18		! %fcc1 = 2
!	%l1 = 00000000000001a2, %l1 = 00000000000001a2, %l6 = 0000000000000000
	sra	%l1,%l1,%l6		! %l6 = 0000000000000068
!	%f14 = 00000000 c1c00000, %f4  = 64e85f4b 0f9001f8
	fxtod	%f14,%f4 		! %f4  = 41e83800 00000000
!	Mem[0000000030000024] = fffffff9, %l6 = 0000000000000068
	lduba	[%o0+0x024]%asi,%l6	! %l6 = 00000000000000ff

p2_label_187:
	fbule,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019000000] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l3	! Annulled
p2_b207:
	membar	#Sync			! Added by membar checker (550)
!	%f18 = 80000000 00000000, %f6  = 64e85f4b 0f9001f8, %f6  = 64e85f4b 0f9001f8
	faddd	%f18,%f6 ,%f6 		! %f6  = 64e85f4b 0f9001f8
!	%l4 = 00000000000000c1, Mem[000000003200005c] = ffffffff
	sth	%l4,[%o4+0x05c]		! Mem[000000003200005c] = 00c1ffff
!	%l2 = 0000000000000000, %l0 = 000000005a1da192, %l0 = 000000005a1da192
	srl	%l2,%l0,%l0		! %l0 = 0000000000000000

p2_label_188:
	set	p2_b208,%o7
	fbge	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	%l0 = 0000000000000000, Mem[0000000018800008] = 15dab81e
	stwa	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = 00000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0d0,%g2
p2_b208:
!	Registers modified during the branch to p2_far_0
!	%l3  = fffffffffffff6ff
!	%l7  = 00000000000000cd
	membar	#Sync			! Added by membar checker (551)
!	Denormal Floating Point Operation Nullified
	nop
!	%l3 = fffffffffffff6ff, immed = 000009df, %l1 = 00000000000001a2
	andcc	%l3,0x9df,%l1		! %l1 = 00000000000000df, %ccr = 00
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_189:
!	Mem[0000000018000180] = 46e393e4 eac0e0d3 390120e7 8c35f0a5
	prefetch [%i0+0x180],0	! Annulled
p2_b209:
	membar	#Sync			! Added by membar checker (552)
!	%l4 = 00000000000000c1, %l0 = 0000000000000000, %l6 = 00000000000000ff
	and	%l4,%l0,%l6		! %l6 = 0000000000000000
	bg	p2_b210			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000190000a8] = 5a2599d2, %l2 = 0000000000000000
	lduw	[%i2+0x0a8],%l2		! %l2 = 000000005a2599d2
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x0d2,%g2
p2_b210:
	membar	#Sync			! Added by membar checker (553)
	set	p2_b211,%o7
	fble,a,pt %fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 1

p2_label_190:
!	Mem[0000000018000040] = cc21189d 6b8e4284 ab2a9c18 8bfc2ffe
	prefetch [%i0+0x040],23
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0d3,%g2
p2_b211:
!	Registers modified during the branch to p2_near_1
!	%l1  = 000000005a259ab1
!	%l4  = ffffffffa5da654e
!	%l5  = fffffffffffff9f1
	membar	#Sync			! Added by membar checker (554)
!	%l7 = 00000000000000cd, immed = fffff5db, %l1 = 000000005a259ab1
	andn	%l7,-0xa25,%l1		! %l1 = 0000000000000004
	fbul,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019800008] = 00000000, %l5 = fffffffffffff9f1
	ldsha	[%i3+%o6]0x80,%l5	! Annulled
p2_b212:
	membar	#Sync			! Added by membar checker (555)
!	%l6 = 0000000000000000, immed = fffff76b, %l1 = 0000000000000004
	andcc	%l6,-0x895,%l1		! %l1 = 0000000000000000, %ccr = 44

p2_label_191:
	bpos,a	p2_b213			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000018800008] = 00000000, %l0 = 0000000000000000
	ldsba	[%i1+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0d5,%g2
p2_b213:
	membar	#Sync			! Added by membar checker (556)
!	Mem[0000000030000068] = ffffffff, %l2 = 5a2599d2, %l6 = 00000000
	add	%o0,0x68,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 00000000ffffffff
	fbule,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018000008] = 00000000, %l3 = fffffffffffff6ff
	swapa	[%i0+%o6]0x80,%l3	! Annulled
p2_b214:

p2_label_192:
	bpos,a	p2_b215			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000018800008] = 00000000, %l4 = ffffffffa5da654e
	swapa	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0d7,%g2
p2_b215:
	membar	#Sync			! Added by membar checker (557)
!	%l6 = 00000000ffffffff, immed = 00000ad2, %l5 = fffffffffffff9f1
	andn	%l6,0xad2,%l5		! %l5 = 00000000fffff52d
!	Mem[00000000198001a0] = c3a75d31 31195f39 5ec04504 5ad864b5
	prefetcha [%i3+0x1a0]%asi,1
!	Jump to jmpl_1, CWP = 0
	set	p2_jmpl_1_le,%g1
	jmpl	%g1,%g6

p2_label_193:
!	%l5 = 00000000fffff52d, Mem[00000000190000ec] = a8df0b2f
	stw	%l5,[%i2+0x0ec]		! Mem[00000000190000ec] = fffff52d
!	Registers modified during the branch to p2_jmpl_1
!	%l0  = 000000007fffffff
!	%l2  = 0000000000000aa9
!	%l6  = 0000000081bf4877
!	Denormal Floating Point Operation Nullified
	nop
!	call to call_2, CWP = 0
	call	p2_call_2_le
!	%l7 = 00000000000000cd, Mem[0000000031000020] = 82009ce0fb5dcc98
	stx	%l7,[%o2+0x020]		! Mem[0000000031000020] = 00000000000000cd
!	Registers modified during the branch to p2_call_2
!	%l5  = 00000000000032dc
!	%l6  = 0000000000000000
	set	p2_b216,%o7
	fbug,a,pn %fcc0,p2_near_2_he	! Branch Taken, %fcc0 = 2

p2_label_194:
!	Mem[0000000019800000] = 00000000, %l5 = 00000000000032dc
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p2_branch_failed
	mov	0x0d8,%g2
p2_b216:
!	Registers modified during the branch to p2_near_2
!	%l1  = fffffffffffffffa
	membar	#Sync			! Added by membar checker (558)
!	%l7 = 00000000000000cd, immed = 000006be, %l4 = 0000000000000000
	orn	%l7,0x6be,%l4		! %l4 = fffffffffffff9cd
!	%f23 = 00000000, %f2  = 80000000 64685f4b
	fitod	%f23,%f2 		! %f2  = 00000000 00000000
!	Mem[0000000018800008] = a5da654e, %l4 = fffffffffffff9cd
	lduba	[%i1+%o6]0x80,%l4	! %l4 = 00000000000000a5
!	%l5 = 0000000000000000, %l7 = 00000000000000cd, %y  = 00000000
	udivx	%l5,%l7,%l3		! %l3 = 0000000000000000

p2_label_195:
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800008] = a5da654e, %l5 = 0000000000000000
	ldsha	[%i1+%o6]0x80,%l5	! Annulled
p2_b217:
	membar	#Sync			! Added by membar checker (559)
!	Mem[0000000032000030] = ff000000, %l5 = 0000000000000000
	ldsba	[%o4+0x030]%asi,%g2	! %g2 = ffffffffffffffff
	set	p2_b218,%o7
	fbg	p2_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001880015c] = 5ef86b1d, %l0 = 000000007fffffff
	lduh	[%i1+0x15c],%l0		! %l0 = 0000000000005ef8
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p2_branch_failed
	mov	0x0da,%g2
p2_b218:
!	Registers modified during the branch to p2_far_3
!	%l0  = 0000000000005ef8
!	%l4  = 0000000000005efd

p2_label_196:
	membar	#Sync			! Added by membar checker (560)
!	%l3 = 0000000000000000, immed = fffff198, %l2 = 0000000000000aa9
	or	%l3,-0xe68,%l2		! %l2 = fffffffffffff198
	fbule,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000019800008] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000000
p2_b219:
	membar	#Sync			! Added by membar checker (561)
!	Mem[00000000188000a0] = e74c7e41 5d5b1646 a7866d8e 7ce2619e
	prefetcha [%i1+0x0a0]%asi,20
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_197:
!	%l4 = 00005efd, %l5 = 00000000, Mem[0000000019000000] = 00000000 1be5c742
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = 00005efd 00000000
p2_b220:
	membar	#Sync			! Added by membar checker (562)
!	Mem[000000001a000008] = ffffffff, %l0 = 0000000000005ef8
	ldswa	[%i4+%o6]0x80,%l0	! %l0 = ffffffffffffffff
!	%l6 = 0000000000000000, immed = fffffbb6, %l6 = 0000000000000000
	andcc	%l6,-0x44a,%l6		! %l6 = 0000000000000000, %ccr = 44
!	%l2 = fffffffffffff198
	setx	0xbc8a1294bc8a1294,%g7,%l2 ! %l2 = bc8a1294bc8a1294
!	%f16 = 00000000, %f25 = 64e85f4b
	fcmpes	%fcc3,%f16,%f25		! %fcc3 = 1

p2_label_198:
!	Mem[0000000018800000] = fe000000, %l6 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 000000000000fe00
!	%l1 = fffffffffffffffa, %l1 = fffffffffffffffa, %l3 = 0000000000000000
	andn	%l1,%l1,%l3		! %l3 = 0000000000000000
!	Mem[0000000018800008] = a5da654e, %l0 = ffffffffffffffff
	lduwa	[%i1+%o6]0x80,%l0	! %l0 = 00000000a5da654e
!	%l3 = 0000000000000000, %l7 = 00000000000000cd, %l2 = bc8a1294bc8a1294
	tsubcc	%l3,%l7,%l2		! %l2 = ffffffffffffff33, %ccr = 9b
!	%l2 = ffffffffffffff33, Mem[0000000019000008] = fadab81ed17fefff
	stxa	%l2,[%i2+%o6]0x80	! Mem[0000000019000008] = ffffffffffffff33

p2_label_199:
!	Mem[0000000019000040] = 31dc1e8e af9822b0 1d6d4093 21636f8b
	prefetch [%i2+0x040],20
	fbule	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000030800068] = ffffffff, %l1 = fffffffffffffffa
	swap	[%o1+0x068],%l1		! %l1 = 00000000ffffffff
p2_b221:
	membar	#Sync			! Added by membar checker (563)
!	%l5 = 0000000000000000, %l3 = 0000000000000000, %l2 = ffffffffffffff33
	andn	%l5,%l3,%l2		! %l2 = 0000000000000000
	set	p2_b222,%o7
	fbge,a	p2_far_3_he	! Branch Taken, %fcc0 = 2

p2_label_200:
!	Mem[00000000198000c0] = b68116f7 2429057c 8aa79cce f5d4e7da
	prefetch [%i3+0x0c0],23
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p2_branch_failed
	mov	0x0de,%g2
p2_b222:
!	Registers modified during the branch to p2_far_3
!	%l0  = fffffffffffffeff
!	%l3  = ffffffffffffff33
!	%l5  = 0000000000000000
!	call to call_0, CWP = 0
	call	p2_call_0_he
!	%l4 = 0000000000005efd, Mem[0000000031800024] = 000000c1
	stb	%l4,[%o3+0x024]		! Mem[0000000031800024] = fd0000c1
!	Registers modified during the branch to p2_call_0
!	%l1  = ffffffff00005efd
!	%l3  = 0000000000000000
!	%l5  = 000000000000fe00
!	%l7  = ffffffffff86c86e
	membar	#Sync			! Added by membar checker (564)
!	Denormal Floating Point Operation Nullified
	nop
!	%l5 = 000000000000fe00, %l7 = ffffffffff86c86e, %l3 = 0000000000000000
	and	%l5,%l7,%l3		! %l3 = 000000000000c800

!	End of Random Code for Processor 2

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x008]		! Set processor 2 done flag

!	Check Registers

p2_check_registers:
	set	p2_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be fffffffffffffeff
	bne,a,pn %xcc,p2_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffff00005efd
	bne,a,pn %xcc,p2_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p2_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000000c800
	bne,a,pn %xcc,p2_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000005efd
	bne,a,pn %xcc,p2_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000000000fe00
	bne,a,pn %xcc,p2_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000fe00
	bne,a,pn %xcc,p2_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffff86c86e
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
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 41e83800 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 64e85f4b 0f9001f8
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 448d0be9
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 0f9001f8 448d0be9
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 80000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 c1c00000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 448d0be9
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 80000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 80000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 80000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be e3185f4b 64e85f4b
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 e4e85f4b
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 48d6ac53 80000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 448d0be9
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p2_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff7e67d46ea9ee30
	ldx	[%i0+0x000],%g3		! Observed data at 0000000018000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 000000001ab0af8e
	ldx	[%i0+0x008],%g3		! Observed data at 0000000018000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 92e001618f3833e2
	ldx	[%i0+0x018],%g3		! Observed data at 0000000018000018
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = d800e072c55cb225
	ldx	[%i0+0x0a0],%g3		! Observed data at 00000000180000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 36a8d1b71bce09ff
	ldx	[%i0+0x0b8],%g3		! Observed data at 00000000180000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 0ffd00b2a10780d1
	ldx	[%i0+0x0d8],%g3		! Observed data at 00000000180000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 00000000c60f75ff
	ldx	[%i0+0x108],%g3		! Observed data at 0000000018000108
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x188],%g2		! Expect data = 390120e78c35f0a5
	ldx	[%i0+0x188],%g3		! Observed data at 0000000018000188
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x188,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = a45bfbd327fd95da
	ldx	[%i0+0x1b0],%g3		! Observed data at 00000000180001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = fd99fc80c09ba2fb
	ldx	[%i0+0x1d8],%g3		! Observed data at 00000000180001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1d8,%g4

	set	p2_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = fe000000e5925073
	ldx	[%i1+0x000],%g3		! Observed data at 0000000018800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = a5da654ea5c01cca
	ldx	[%i1+0x008],%g3		! Observed data at 0000000018800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = a7866d8e7ce2619e
	ldx	[%i1+0x0a8],%g3		! Observed data at 00000000188000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = ff4944e99ba2a4ff
	ldx	[%i1+0x0c8],%g3		! Observed data at 00000000188000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x110],%g2		! Expect data = fffeb81abac72200
	ldx	[%i1+0x110],%g3		! Observed data at 0000000018800110
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x130],%g2		! Expect data = 818391c2ab6cc457
	ldx	[%i1+0x130],%g3		! Observed data at 0000000018800130
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x148],%g2		! Expect data = 9e86f040ffffffef
	ldx	[%i1+0x148],%g3		! Observed data at 0000000018800148
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x158],%g2		! Expect data = cd21ff2e5ef86b1d
	ldx	[%i1+0x158],%g3		! Observed data at 0000000018800158
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x198],%g2		! Expect data = ff1d4956fca23d7b
	ldx	[%i1+0x198],%g3		! Observed data at 0000000018800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1c8],%g2		! Expect data = 79b16c05ffffffff
	ldx	[%i1+0x1c8],%g3		! Observed data at 00000000188001c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1c8,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = ffffa9385114acd5
	ldx	[%i1+0x1e8],%g3		! Observed data at 00000000188001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 0000006e0000cc67
	ldx	[%i1+0x1f0],%g3		! Observed data at 00000000188001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f0,%g4

	set	p2_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00005efd00000000
	ldx	[%i2+0x000],%g3		! Observed data at 0000000019000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffffffffffffff33
	ldx	[%i2+0x008],%g3		! Observed data at 0000000019000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x028],%g2		! Expect data = c8697c80fffffbf5
	ldx	[%i2+0x028],%g3		! Observed data at 0000000019000028
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x038],%g2		! Expect data = 00000000ffffffff
	ldx	[%i2+0x038],%g3		! Observed data at 0000000019000038
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 00000000fffffffa
	ldx	[%i2+0x068],%g3		! Observed data at 0000000019000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 20dfbf8effffcc94
	ldx	[%i2+0x0b8],%g3		! Observed data at 00000000190000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = ff16b9ff43994626
	ldx	[%i2+0x0d8],%g3		! Observed data at 00000000190000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 43fa14f0fffff52d
	ldx	[%i2+0x0e8],%g3		! Observed data at 00000000190000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = 1b6171150001b318
	ldx	[%i2+0x0f0],%g3		! Observed data at 00000000190000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 2211566bc9da96af
	ldx	[%i2+0x0f8],%g3		! Observed data at 00000000190000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f8,%g4
	ldx	[%g1+0x100],%g2		! Expect data = a7d5007ee63509d0
	ldx	[%i2+0x100],%g3		! Observed data at 0000000019000100
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 1963f72b5c5a000f
	ldx	[%i2+0x108],%g3		! Observed data at 0000000019000108
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x130],%g2		! Expect data = 000000840a5a619e
	ldx	[%i2+0x130],%g3		! Observed data at 0000000019000130
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x138],%g2		! Expect data = 51db706322848af2
	ldx	[%i2+0x138],%g3		! Observed data at 0000000019000138
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x168],%g2		! Expect data = 83922a0ba32d9353
	ldx	[%i2+0x168],%g3		! Observed data at 0000000019000168
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = c7273467f29bff96
	ldx	[%i2+0x1d0],%g3		! Observed data at 00000000190001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = ffffffffffffff92
	ldx	[%i2+0x1d8],%g3		! Observed data at 00000000190001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1d8,%g4
	ldx	[%g1+0x1e0],%g2		! Expect data = 5c4500a8249bff46
	ldx	[%i2+0x1e0],%g3		! Observed data at 00000000190001e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1e0,%g4

	set	p2_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 000032dcc4560715
	ldx	[%i3+0x000],%g3		! Observed data at 0000000019800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x008],%g3		! Observed data at 0000000019800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 00000000a174e808
	ldx	[%i3+0x010],%g3		! Observed data at 0000000019800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x060],%g2		! Expect data = ffff267494383fcf
	ldx	[%i3+0x060],%g3		! Observed data at 0000000019800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x090],%g2		! Expect data = d915e5083d417fc4
	ldx	[%i3+0x090],%g3		! Observed data at 0000000019800090
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x098],%g3		! Observed data at 0000000019800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 88afa2ffffd41d70
	ldx	[%i3+0x0d0],%g3		! Observed data at 00000000198000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 0a5af23d51aa4420
	ldx	[%i3+0x118],%g3		! Observed data at 0000000019800118
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 00000000ffffffff
	ldx	[%i3+0x120],%g3		! Observed data at 0000000019800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x130],%g2		! Expect data = 787cf05e17ff73cb
	ldx	[%i3+0x130],%g3		! Observed data at 0000000019800130
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x190],%g2		! Expect data = 09ea8b50bea6982d
	ldx	[%i3+0x190],%g3		! Observed data at 0000000019800190
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x1c0],%g2		! Expect data = eb7d105c166a0b6e
	ldx	[%i3+0x1c0],%g3		! Observed data at 00000000198001c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1c0,%g4
	ldx	[%g1+0x1e0],%g2		! Expect data = eaba455107e0ffb6
	ldx	[%i3+0x1e0],%g3		! Observed data at 00000000198001e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1e0,%g4

	set	p2_local4_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = fffffffff67e5922
	ldx	[%i4+0x008],%g3		! Observed data at 000000001a000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = e5bfdbffbffffd77
	ldx	[%i4+0x1a0],%g3		! Observed data at 000000001a0001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a0,%g4

	set	p2_local5_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = fffffb92c10b5002
	ldx	[%i5+0x008],%g3		! Observed data at 000000001a800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = f1e15c3be49d9bff
	ldx	[%i5+0x010],%g3		! Observed data at 000000001a800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x010,%g4

	set	p2_local6_expect,%g1

!	Processor 2, local 6 is clean



!	Check Shared Memory

	set	share0_expect,%g4
	set	p2_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p2_memcheck_share0:
	ldx	[%g4+0x20],%g2	! Expected value = c60f75fffffffff9
	ldx	[%o0+0x20],%g3	! Read value at Mem[0000000030000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 000000001a6da9b9
	ldx	[%o0+0x28],%g3	! Read value at Mem[0000000030000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = fffffc89a9663cd8
	ldx	[%o0+0x60],%g3	! Read value at Mem[0000000030000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = ffffffffffffffff
	ldx	[%o0+0x68],%g3	! Read value at Mem[0000000030000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p2_memcheck_share1:
	ldx	[%g4+0x20],%g2	! Expected value = 00000001ffffff92
	ldx	[%o1+0x20],%g3	! Read value at Mem[0000000030800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 3a77a677c32bff98
	ldx	[%o1+0x28],%g3	! Read value at Mem[0000000030800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 00005efd0000fe00
	ldx	[%o1+0x60],%g3	! Read value at Mem[0000000030800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = fffffffae7d38d64
	ldx	[%o1+0x68],%g3	! Read value at Mem[0000000030800068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p2_memcheck_share2:
	ldx	[%g4+0x20],%g2	! Expected value = 00000000000000cd
	ldx	[%o2+0x20],%g3	! Read value at Mem[0000000031000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 0000000083922a0b
	ldx	[%o2+0x28],%g3	! Read value at Mem[0000000031000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 9cdbd870ffffffff
	ldx	[%o2+0x60],%g3	! Read value at Mem[0000000031000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 1483ef380000ffde
	ldx	[%o2+0x68],%g3	! Read value at Mem[0000000031000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p2_memcheck_share3:
	ldx	[%g4+0x20],%g2	! Expected value = 00000000fd0000c1
	ldx	[%o3+0x20],%g3	! Read value at Mem[0000000031800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 9cdb002400004183
	ldx	[%o3+0x28],%g3	! Read value at Mem[0000000031800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 26162c33eb7d105c
	ldx	[%o3+0x60],%g3	! Read value at Mem[0000000031800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 921862f71a6da939
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
	andncc	%l2,0x4af,%l4
	smulcc	%l3,%l3,%l6
	ldsw	[%i2+0x03c],%l2		! Mem[000000001900003c]
	prefetch [%i3+0x1a0],23
	stb	%l7,[%o2+0x065]		! Mem[0000000031000065]
	done

p2_trap1o:
	andncc	%l2,0x4af,%l4
	smulcc	%l3,%l3,%l6
	ldsw	[%o2+0x03c],%l2		! Mem[000000001900003c]
	prefetch [%o3+0x1a0],23
	stb	%l7,[%i2+0x065]		! Mem[0000000031000065]
	done


p2_trap2e:
	ldsw	[%i3+0x0c8],%l1		! Mem[00000000198000c8]
	prefetch [%i2+0x1e0],22
	prefetch [%i0+0x000],0
	taddcc	%l6,%l7,%l4
	lduh	[%i4+0x0dc],%l1		! Mem[000000001a0000dc]
	done

p2_trap2o:
	ldsw	[%o3+0x0c8],%l1		! Mem[00000000198000c8]
	prefetch [%o2+0x1e0],22
	prefetch [%o0+0x000],0
	taddcc	%l6,%l7,%l4
	lduh	[%o4+0x0dc],%l1		! Mem[000000001a0000dc]
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
	ldx	[%g1+0x000],%l0	! %l0 = a6ae89ffbde5880a
	ldx	[%g1+0x008],%l1	! %l1 = 75663000379fb61d
	ldx	[%g1+0x010],%l2	! %l2 = 120d2a0003f46526
	ldx	[%g1+0x018],%l3	! %l3 = b4f8a70071ff9a60
	ldx	[%g1+0x020],%l4	! %l4 = e49d9bff8bffed76
	ldx	[%g1+0x028],%l5	! %l5 = ed4e8c0032e95ab4
	ldx	[%g1+0x030],%l6	! %l6 = 83614affe7d392ee
	ldx	[%g1+0x038],%l7	! %l7 = dba10f00390120e7

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
	ldd	[%g1+0x00],%f0		! %f0  = ffeb2f8f, %f1  = 752f01ee
	ldd	[%g1+0x08],%f2		! %f2  = 98611fab, %f3  = 0b8d649d
	ldd	[%g1+0x10],%f4		! %f4  = 6e9d30af, %f5  = 70eeda2e
	ldd	[%g1+0x18],%f6		! %f6  = 7abe898e, %f7  = e2085a5d
	ldd	[%g1+0x20],%f8		! %f8  = 2ffe158b, %f9  = afd2c5cd
	ldd	[%g1+0x28],%f10		! %f10 = d5ebf1dc, %f11 = 3a5046c4
	ldd	[%g1+0x30],%f12		! %f12 = 9b22777c, %f13 = 9b21d14e
	ldd	[%g1+0x38],%f14		! %f14 = 15149651, %f15 = bc23a8ed
	ldd	[%g1+0x40],%f16		! %f16 = ac2a4a0d, %f17 = 2cec9eb1
	ldd	[%g1+0x48],%f18		! %f18 = 5b14d304, %f19 = 476149f6
	ldd	[%g1+0x50],%f20		! %f20 = 23aaba2e, %f21 = 270337c7
	ldd	[%g1+0x58],%f22		! %f22 = 260f4b6c, %f23 = 3921bd57
	ldd	[%g1+0x60],%f24		! %f24 = 1d5a24a4, %f25 = bcd5a682
	ldd	[%g1+0x68],%f26		! %f26 = c4d0888e, %f27 = d65cf1ac
	ldd	[%g1+0x70],%f28		! %f28 = 84e65df9, %f29 = b745e704
	ldd	[%g1+0x78],%f30		! %f30 = b2e28351, %f31 = 6d93ff4b
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 3

p3_label_1:
!	%l0 = 5dc2c70024a95a62, immed = 00000017, %l5 = 57cdf4ffd27cda19
	sra	%l0,0x017,%l5		! %l5 = 0000000000000049
!	%f0  = ffeb2f8f, %f30 = b2e28351, %f25 = bcd5a682
	fdivs	%f0 ,%f30,%f25		! %f25 = ffeb2f8f
!	%f2  = 98611fab, %f2  = 98611fab, %f17 = 2cec9eb1
	fsubs	%f2 ,%f2 ,%f17		! %f17 = 00000000
	set	p3_b1,%o7
	fbge	p3_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001c8001e8] = ea77cb0b, %l1 = bd32db0032e9ee8d
	ldsw	[%i1+0x1e8],%l1		! %l1 = ffffffffea77cb0b
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x001,%g2
p3_b1:
!	Registers modified during the branch to p3_far_1
!	%l3  = 0000000000000009

p3_label_2:
	membar	#Sync			! Added by membar checker (565)
!	Mem[000000001d800160] = c52fe75b 2f991992
	flush	%i3+0x160
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l0 = 5dc2c70024a95a62, Mem[000000001c000008] = e4180dda
	stwa	%l0,[%i0+%o6]0x80	! Mem[000000001c000008] = 24a95a62
p3_b2:
	fbug,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 852ee510, %l7 = 79270aeb, Mem[000000001c800008] = 9ab367e0 f654389e
	stda	%l6,[%i1+%o6]0x80	! Annulled
p3_b3:

p3_label_3:
	membar	#Sync			! Added by membar checker (566)
!	%l1 = ffffffffea77cb0b, %l0 = 5dc2c70024a95a62, %l0 = 5dc2c70024a95a62
	addc	%l1,%l0,%l0		! %l0 = 5dc2c7000f21256d
!	Mem[000000001d800198] = 852ee510 79270aeb, %l0 = 5dc2c7000f21256d, %l6 = 568f59ff852ee510
	add	%i3,0x198,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = a299aa7996657001
!	Mem[000000001d0000cc] = 678fd04a, %l4 = b8598f001bf4b9f4
	ldstuba	[%i2+0x0cc]%asi,%l4	! %l4 = 0000000000000067
	fbug	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c800008] = 9ab367e0, %l4 = 0000000000000067
	swapa	[%i1+%o6]0x80,%l4	! %l4 = 000000009ab367e0
p3_b4:

p3_label_4:
	bpos,a	p3_b5			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c000008] = 24a95a62, %l1 = ffffffffea77cb0b
	swapa	[%i0+%o6]0x80,%l1	! %l1 = 0000000024a95a62
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x005,%g2
p3_b5:
	membar	#Sync			! Added by membar checker (567)
!	Mem[000000001d800080] = 7a0d5b9e a12da434 e5fe90aa 70449daa
	prefetch [%i3+0x080],1
!	Mem[000000001c000014] = 0411cc94, %l0 = 5dc2c7000f21256d
	lduw	[%i0+0x014],%l0		! %l0 = 000000000411cc94
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b78895 a4685005
	prefetch [%o4+0x000],21

p3_label_5:
!	%l0 = 000000000411cc94, %l5 = 0000000000000049, %l6 = a299aa7996657001
	xnor	%l0,%l5,%l6		! %l6 = fffffffffbee3322
!	Mem[000000004000003c] = 0001080e, %l1 = 0000000024a95a62
	lduba	[%o5+0x03d]%asi,%l1	! %l1 = 0000000000000001
!	%f25 = ffeb2f8f, %f19 = 476149f6
	fitos	%f25,%f19		! %f19 = c9a68388
!	%l2 = 0d71b1001d010bbc, %l7 = 53f66e0079270aeb, %l3 = 0000000000000009
	xnorcc	%l2,%l7,%l3		! %l3 = a17820ff9bd9fea8, %ccr = 88
!	Mem[000000001c000058] = 83d4800036baa0af, %l4 = 000000009ab367e0
	ldx	[%i0+0x058],%l4		! %l4 = 83d4800036baa0af

p3_label_6:
	set	p3_b6,%o7
	fba,pt	%fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 0
!	%l6 = fbee3322, %l7 = 79270aeb, Mem[000000001c800000] = 291fa92c 49d9f51b
	stda	%l6,[%i1+%g0]0x80	! Mem[000000001c800000] = fbee3322 79270aeb
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x006,%g2
p3_b6:
!	Registers modified during the branch to p3_near_1
!	%l0  = fffffffffbee3592
!	%l5  = 3d4800036baae830
!	%l7  = fdf7199100000000
	membar	#Sync			! Added by membar checker (568)
!	%f8  = 2ffe158b afd2c5cd, %f28 = 84e65df9 b745e704
	fcmpd	%fcc2,%f8 ,%f28		! %fcc2 = 2
!	Mem[000000001c800000] = fbee3322 79270aeb 00000067 f654389e
	prefetcha [%i1+0x000]%asi,20
!	Mem[000000001c0000a0] = 35561378 ecca160c f1128181 fff06c07
	prefetch [%i0+0x0a0],23

p3_label_7:
!	%l6 = fffffffffbee3322, %l3 = a17820ff9bd9fea8, %l1 = 0000000000000001
	andcc	%l6,%l3,%l1		! %l1 = a17820ff9bc83220, %ccr = 88
!	Mem[000000001c000008] = ea77cb0b, %l1 = a17820ff9bc83220
	lduha	[%i0+%o6]0x80,%l1	! %l1 = 000000000000ea77
	fbne	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d000000] = bfaac829df8f5527, %l0 = fffffffffbee3592
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = bfaac829df8f5527
p3_b7:
	membar	#Sync			! Added by membar checker (569)
!	%f3  = 0b8d649d, %f25 = ffeb2f8f, %f16 = ac2a4a0d
	fmuls	%f3 ,%f25,%f16		! %f16 = ffeb2f8f

p3_label_8:
	set	p3_b8,%o7
	fbge,pn	%fcc3,p3_near_0_he	! Branch Taken, %fcc3 = 0
!	Mem[000000001c800008] = 00000067 f654389e, %l2 = 1d010bbc, %l3 = 9bd9fea8
	ldda	[%i1+%o6]0x80,%l2	! %l2 = 0000000000000067 00000000f654389e
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x008,%g2
p3_b8:
	membar	#Sync			! Added by membar checker (570)
!	%l4 = 83d4800036baa0af, immed = fffff70b, %y  = 00000000
	umul	%l4,-0x8f5,%l0		! %l0 = 36ba9ec4ca5ec085
!	%l1 = 000000000000ea77, %l7 = fdf7199100000000, %l7 = fdf7199100000000
	srl	%l1,%l7,%l7		! %l7 = 000000000000ea77
!	%f19 = c9a68388, %f19 = c9a68388
	fstoi	%f19,%f19		! %f19 = ffeb2f8f

p3_label_9:
!	%f4  = 6e9d30af 70eeda2e, %f4  = 6e9d30af 70eeda2e, %f22 = 260f4b6c 3921bd57
	fsubd	%f4 ,%f4 ,%f22		! %f22 = 00000000 00000000
!	%l6 = fffffffffbee3322, %l1 = 000000000000ea77, %l7 = 000000000000ea77
	sub	%l6,%l1,%l7		! %l7 = fffffffffbed48ab
!	Mem[000000001d000148] = 260f4b6c 3921bd57, %l6 = fffffffffbee3322, %l6 = fffffffffbee3322
	add	%i2,0x148,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 35b14d89b562a63d
!	%l6 = 35b14d89b562a63d, %l2 = 0000000000000067, %l3 = 00000000f654389e
	srax	%l6,%l2,%l3		! %l3 = 00000000006b629b
!	%l5 = 3d4800036baae830, immed = 0000080d, %l4 = 83d4800036baa0af
	andcc	%l5,0x80d,%l4		! %l4 = 0000000000000800, %ccr = 00

p3_label_10:
!	%l4 = 00000800, %l5 = 6baae830, Mem[000000001d800078] = bada29b0 37168e89
	std	%l4,[%i3+0x078]	! Mem[000000001d800078] = 00000800 6baae830
!	Mem[000000001d000008] = 636fc85b a5408c6c, %l0 = ca5ec085, %l1 = 0000ea77
	ldda	[%i2+%o6]0x80,%l0	! %l0 = 00000000636fc85b 00000000a5408c6c
	fbne,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = fffffffffbed48ab, Mem[000000001c800000] = fbee332279270aeb
	stxa	%l7,[%i1+%g0]0x80	! Mem[000000001c800000] = fffffffffbed48ab
p3_b9:
	membar	#Sync			! Added by membar checker (571)
!	%l5 = 3d4800036baae830, immed = fffff55c, %l5 = 3d4800036baae830
	andncc	%l5,-0xaa4,%l5		! %l5 = 0000000000000820, %ccr = 00

p3_label_11:
	set	p3_b10,%o7
	fbule,a	p3_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001c000008] = ea77cb0b, %l5 = 0000000000000820
	swapa	[%i0+%o6]0x80,%l5	! %l5 = 00000000ea77cb0b
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x00a,%g2
p3_b10:
!	Registers modified during the branch to p3_far_1
!	%l3  = 00000000ea77ca0b
	membar	#Sync			! Added by membar checker (572)
!	%l4 = 0000000000000800, Mem[000000001c000195] = d35cb718
	stba	%l4,[%i0+0x195]%asi	! Mem[000000001c000194] = d300b718
!	%l4 = 0000000000000800, immed = fffffe43, %l5 = 00000000ea77cb0b
	addccc	%l4,-0x1bd,%l5		! %l5 = 0000000000000643, %ccr = 11
!	Jump to jmpl_0, CWP = 0
	set	p3_jmpl_0_le,%g1
	jmpl	%g1,%g6

p3_label_12:
!	Mem[000000001d800000] = 811e8da9 987d9ef1, %l4 = 00000800, %l5 = 00000643
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000811e8da9 00000000987d9ef1
!	Registers modified during the branch to p3_jmpl_0
!	%l5  = 0000000000128200
!	Mem[000000001c000060] = 46ace8ed 30254b48 4655de92 e64caabc
	prefetch [%i0+0x060],0
	bge,a	p3_b11			! Branch Taken, %ccr = 11, CWP = 0
!	Mem[000000001d800000] = 811e8da9, %l0 = 00000000636fc85b
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffff811e
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x00b,%g2
p3_b11:
	membar	#Sync			! Added by membar checker (573)
	fbl,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_13:
!	Mem[0000000030800038] = 0f9bee19 33b8f27b, %l4 = 811e8da9, %l5 = 00128200
	ldd	[%o1+0x038],%l4		! %l4 = 000000000f9bee19 0000000033b8f27b
p3_b12:
	membar	#Sync			! Added by membar checker (574)
!	%l3 = 00000000ea77ca0b, immed = fffff1e4, %l1 = 00000000a5408c6c
	andcc	%l3,-0xe1c,%l1		! %l1 = 00000000ea77c000, %ccr = 08
!	%l5 = 0000000033b8f27b, %l1 = 00000000ea77c000, %l2 = 0000000000000067
	sub	%l5,%l1,%l2		! %l2 = ffffffff4941327b
!	%l4 = 000000000f9bee19, %l4 = 000000000f9bee19, %l1 = 00000000ea77c000
	subc	%l4,%l4,%l1		! %l1 = 0000000000000000
!	%f22 = 00000000 00000000, %f20 = 23aaba2e 270337c7
	fabsd	%f22,%f20		! %f20 = 00000000 00000000

p3_label_14:
	set	p3_b13,%o7
	fba,a,pn %fcc0,p3_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001c800000] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l1	! Annulled
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x00d,%g2
p3_b13:
	membar	#Sync			! Added by membar checker (575)
!	%l5 = 0000000033b8f27b, immed = fffff53c, %l2 = ffffffff4941327b
	addccc	%l5,-0xac4,%l2		! %l2 = 0000000033b8e7b7, %ccr = 11
!	Mem[000000001d0000c0] = 16521172 541e77c9 06bff06b ff8fd04a
	prefetch [%i2+0x0c0],0
!	%l6 = 35b14d89b562a63d, %l7 = fffffffffbed48ab, %l2 = 0000000033b8e7b7
	sub	%l6,%l7,%l2		! %l2 = 35b14d89b9755d92

p3_label_15:
!	Mem[000000001d000020] = c8d0b3ba 7c623729 1e006dd1 4b1f68ba
	prefetcha [%i2+0x020]%asi,0
!	Mem[0000000031800038] = ec81cec3, %l5 = 0000000033b8f27b
	ldub	[%o3+0x039],%l5		! %l5 = 0000000000000081
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 11
!	%l7 = fffffffffbed48ab, Mem[000000001d000008] = 636fc85b
	stba	%l7,[%i2+%o6]0x80	! Mem[000000001d000008] = ab6fc85b
p3_b14:
	membar	#Sync			! Added by membar checker (576)
!	Mem[000000003100007c] = 6386028c, %l7 = fffffffffbed48ab
	lduh	[%o2+0x07e],%l7		! %l7 = 000000000000028c

p3_label_16:
!	%l2 = b9755d92, %l3 = ea77ca0b, Mem[0000000032000050] = 84f8f53a 4ac9a406
	stda	%l2,[%o4+0x050]%asi	! Mem[0000000032000050] = b9755d92 ea77ca0b
!	%l4 = 0f9bee19, %l5 = 00000081, Mem[0000000030000078] = 9c0229a1 1e48186d
	std	%l4,[%o0+0x078]	! Mem[0000000030000078] = 0f9bee19 00000081
	set	p3_b15,%o7
	fbule,pn %fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[000000001d800080] = 7a0d5b9e a12da434 e5fe90aa 70449daa
	prefetch [%i3+0x080],4
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x00f,%g2
p3_b15:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000001b36
!	%l1  = 0000000000753be5
!	%l4  = 000000000000051d
!	%l5  = 0000000000001b9b
!	%l6  = 0000194898d67da9
	fblg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_17:
!	%l4 = 0000051d, %l5 = 00001b9b, Mem[0000000030000078] = 0f9bee19 00000081
	std	%l4,[%o0+0x078]	! Annulled
p3_b16:
	membar	#Sync			! Added by membar checker (577)
!	Branch On Register, %l4 = 000000000000051d
	brnz,pn	%l4,p3_b17		! Branch Taken
!	Mem[000000001c800008] = 00000067, %l6 = 0000194898d67da9
	ldstuba	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x011,%g2
p3_b17:
	membar	#Sync			! Added by membar checker (578)
!	Mem[000000001d000000] = bfaac829, %l4 = 000000000000051d
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000bf
!	%l0 = 0000000000001b36, immed = 000008bc, %y  = 00001948
	smulcc	%l0,0x8bc,%l2		! %l2 = 0000000000edaba8, %ccr = 00

p3_label_18:
	fbul,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001d000074] = 98023a05, %l3 = 00000000ea77ca0b
	ldub	[%i2+0x076],%l3		! Annulled
p3_b18:
	membar	#Sync			! Added by membar checker (579)
!	%f30 = b2e28351 6d93ff4b, %f16 = ffeb2f8f 00000000
	fnegd	%f30,%f16		! %f16 = 32e28351 6d93ff4b
!	%l6 = 0000000000000000, %l4 = 00000000000000bf, %l6 = 0000000000000000
	andncc	%l6,%l4,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Branch On Register, %l5 = 0000000000001b9b
	brz,a,pt %l5,p3_not_taken_0	! Branch Not Taken

p3_label_19:
!	%l6 = 00000000, %l7 = 0000028c, Mem[000000001c000048] = 9f1f9dd5 90739d27
	std	%l6,[%i0+0x048]	! Annulled
p3_b19:
	membar	#Sync			! Added by membar checker (580)
	fbug,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001e0001f4] = a80dbfdf, %l0 = 0000000000001b36
	lduh	[%i4+0x1f6],%l0		! %l0 = 000000000000bfdf
p3_b20:
	fbn,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldd	[%o4+0x050],%g2
p3_b21:

p3_label_20:
	membar	#Sync			! Added by membar checker (581)
	fbn,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c800173] = 647e8b07, %l1 = 0000000000753be5
	ldstub	[%i1+0x173],%l1		! Annulled
p3_b22:
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l5 = 0000000000001b9b, Mem[0000000030000078] = 0f9bee1900000081
	stx	%l5,[%o0+0x078]		! Annulled
p3_b23:
	membar	#Sync			! Added by membar checker (582)
!	%l2 = 0000000000edaba8, immed = fffff347, %l3 = 00000000ea77ca0b
	and	%l2,-0xcb9,%l3		! %l3 = 0000000000eda300

p3_label_21:
!	call to call_0, CWP = 0
	call	p3_call_0_le
!	Mem[000000001d800000] = 811e8da9, %l4 = 00000000000000bf
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffff81
!	Registers modified during the branch to p3_call_0
!	%l1  = 000000000075fbc4
!	%l6  = 00000000ddc5f9e2
	set	p3_b24,%o7
	fbue	p3_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d800000] = 811e8da9, %l5 = 0000000000001b9b
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = ffffffff811e8da9
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x018,%g2
p3_b24:
!	Registers modified during the branch to p3_far_3
!	%l2  = 0000000000000067
!	%l3  = 00000000001d7ef1
!	%l4  = 921540f49ccf7032
!	%l5  = fffffffffffffff7
!	%l7  = 00000000001d784e
	membar	#Sync			! Added by membar checker (583)
!	%f20 = 00000000 00000000, %f8  = 2ffe158b afd2c5cd, %f18 = 5b14d304 ffeb2f8f
	fdivd	%f20,%f8 ,%f18		! %f18 = 00000000 00000000

p3_label_22:
!	%l4 = 9ccf7032, %l5 = fffffff7, Mem[0000000031000070] = a9f83b36 9efe5d8e
	std	%l4,[%o2+0x070]	! Mem[0000000031000070] = 9ccf7032 fffffff7
!	%l4 = 921540f49ccf7032, %l2 = 0000000000000067, %y  = 00000000
	udivx	%l4,%l2,%l4		! %l4 = 016b14839e1ade4b
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[000000001d800000] = 811e8da9, %l7 = 00000000001d784e
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffff811e
p3_b25:
	membar	#Sync			! Added by membar checker (584)
!	Mem[0000000032000058] = 54998092 142f1f51, %l0 = 0000bfdf, %l1 = 0075fbc4
	ldda	[%o4+0x058]%asi,%g2	! %l0 = 000000000000bfdf 000000000075fbc4

p3_label_23:
!	Branch On Register, %l4 = 016b14839e1ade4b
	brlz,pn	%l4,p3_not_taken_0	! Branch Not Taken
!	%l7 = ffffffffffff811e, Mem[0000000030000036] = 3670d255
	sth	%l7,[%o0+0x036]		! Mem[0000000030000034] = 3670811e
p3_b26:
	membar	#Sync			! Added by membar checker (585)
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetcha [%o4+0x040]%asi,21
!	%l0 = 0000bfdf, %l1 = 0075fbc4, Mem[000000001d000008] = ab6fc85b a5408c6c
	stda	%l0,[%i2+%o6]0x80	! Mem[000000001d000008] = 0000bfdf 0075fbc4
!	Mem[000000001d8001e8] = a767b88d06543d1e, %l7 = ffffffffffff811e
	ldx	[%i3+0x1e8],%l7		! %l7 = a767b88d06543d1e

p3_label_24:
!	%l7 = a767b88d06543d1e, %l3 = 00000000001d7ef1, %l3 = 00000000001d7ef1
	srl	%l7,%l3,%l3		! %l3 = 000000000000032a
!	Mem[000000001f000180] = f53e5184 58bf0d1d da2620b6 454828a5
	prefetcha [%i6+0x180]%asi,4
!	%l7 = a767b88d06543d1e, immed = 0000060b, %l6 = 00000000ddc5f9e2
	orncc	%l7,0x60b,%l6		! %l6 = fffffffffffffdfe, %ccr = 88
	fbg,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001d000108] = 2f3eea2c, %l7 = a767b88d06543d1e
	ldsw	[%i2+0x108],%l7		! %l7 = 000000002f3eea2c
p3_b27:

p3_label_25:
	set	p3_b28,%o7
	fbo	p3_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001c800000] = ffffffff fbed48ab ff000067 f654389e
	prefetch [%i1+0x000],21
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x01c,%g2
p3_b28:
!	Registers modified during the branch to p3_far_1
!	%l0  = b885e57319e3e064
!	%l4  = fffffffffff5787c
!	%l5  = 001520840b394625
!	%l6  = 000000000034d6d9
!	%l7  = 00152083dbfa5bf9
	membar	#Sync			! Added by membar checker (586)
!	%f8  = 2ffe158b afd2c5cd, %f6  = 7abe898e e2085a5d
	fabsd	%f8 ,%f6 		! %f6  = 2ffe158b afd2c5cd
!	Jump to jmpl_3, CWP = 0
	set	p3_jmpl_3_he,%g1
	jmpl	%g1,%g6
!	Mem[000000001e8000e0] = 9b2a0ec1 a982ef6f d4b7b1ee 54912486
	prefetch [%i5+0x0e0],20

p3_label_26:
!	%l2 = 0000000000000067, Mem[000000001d000000] = bfaac829df8f5527
	stxa	%l2,[%i2+%g0]0x80	! Mem[000000001d000000] = 0000000000000067
!	Mem[0000000030000078] = 0f9bee19 00000081, %l0 = 19e3e064, %l1 = 0075fbc4
	ldda	[%o0+0x078]%asi,%l0	! %l0 = 000000000f9bee19 0000000000000081
!	%l6 = 000000000034d6d9, Mem[000000001d0001ea] = 3cf50739
	sth	%l6,[%i2+0x1ea]		! Mem[000000001d0001e8] = 3cf5d6d9
	ble	p3_b29			! Branch Taken, %ccr = 09, CWP = 0
!	%l0 = 000000000f9bee19, Mem[000000001d800008] = 89e8bbe3
	stba	%l0,[%i3+%o6]0x80	! Mem[000000001d800008] = 19e8bbe3
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x01d,%g2
p3_b29:

p3_label_27:
	membar	#Sync			! Added by membar checker (587)
!	%l7 = 00152083dbfa5bf9, immed = fffff7d9, %l2 = 0000000000000067
	addcc	%l7,-0x827,%l2		! %l2 = 00152083dbfa53d2, %ccr = 19
!	%l6 = 000000000034d6d9, %l6 = 000000000034d6d9, %l2 = 00152083dbfa53d2
	taddcc	%l6,%l6,%l2		! %l2 = 000000000069adb2, %ccr = 02
!	%l4 = fffffffffff5787c, %l4 = fffffffffff5787c, %l4 = fffffffffff5787c
	sllx	%l4,%l4,%l4		! %l4 = c000000000000000
!	%l5 = 001520840b394625, %l6 = 000000000034d6d9, %y  = 00000000
	udiv	%l5,%l6,%l6		! %l6 = 0000000000000036
!	call to call_1, CWP = 0
	call	p3_call_1_le

p3_label_28:
!	Mem[000000001c800000] = ffffffff, %l6 = 0000000000000036
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Registers modified during the branch to p3_call_1
!	%l4  = 000000000f9bee19
!	%l6  = 0000000000000808
!	%l7  = 0000000000000000
!	%l0 = 000000000f9bee19, immed = fffff444, %l2 = 000000000069adb2
	tsubcc	%l0,-0xbbc,%l2		! %l2 = 000000000f9bf9d5, %ccr = 13
	fbl,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 0f9bee19, %l5 = 0b394625, Mem[000000001c800180] = 2a022b4c 58b0b840
	std	%l4,[%i1+0x180]	! Mem[000000001c800180] = 0f9bee19 0b394625
p3_b30:
	membar	#Sync			! Added by membar checker (588)
!	%l2 = 0f9bf9d5, %l3 = 0000032a, Mem[0000000032000030] = 9197a540 db0e3cdc
	std	%l2,[%o4+0x030]	! Mem[0000000032000030] = 0f9bf9d5 0000032a

p3_label_29:
!	%l2 = 000000000f9bf9d5, %l5 = 001520840b394625, %y  = 00000000
	mulx	%l2,%l5,%l4		! %l4 = 0acfa391af4859c9
!	%f10 = d5ebf1dc, %f10 = d5ebf1dc, %f11 = 3a5046c4
	fadds	%f10,%f10,%f11		! %f11 = d66bf1dc
!	Mem[000000001d000008] = 0000bfdf, %l7 = 0000000000000000
	lduba	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000000
	bleu,a	p3_b31			! Branch Taken, %ccr = 13, CWP = 0
!	%l4 = af4859c9, %l5 = 0b394625, Mem[000000001c000008] = 00000820 bda6a27b
	stda	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = af4859c9 0b394625
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x01f,%g2
p3_b31:

p3_label_30:
	membar	#Sync			! Added by membar checker (589)
!	Mem[000000001d8000c0] = 2baebe4b b34405ef aedbfa9f eca1b220
	prefetcha [%i3+0x0c0]%asi,16
	bcc	p3_not_taken_0		! Branch Not Taken, %ccr = 13
!	Mem[000000001c000000] = ccf7290c, %l2 = 000000000f9bf9d5
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000cc
p3_b32:
	membar	#Sync			! Added by membar checker (590)
!	%l4 = 0acfa391af4859c9, immed = 00000604, %y  = 00000000
	smul	%l4,0x604,%l1		! %l1 = fffffe1a6f3c1d24
!	Mem[0000000031800078] = 9e1ade4b fffffff7, %l0 = 0f9bee19, %l1 = 6f3c1d24
	ldd	[%o3+0x078],%l0		! %l0 = 000000009e1ade4b 00000000fffffff7

p3_label_31:
!	%l4 = 0acfa391af4859c9, Mem[000000001d800008] = 19e8bbe3
	stba	%l4,[%i3+%o6]0x80	! Mem[000000001d800008] = c9e8bbe3
!	Mem[000000001c800008] = ff000067, %l2 = 00000000000000cc
	lduha	[%i1+%o6]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[000000001d800008] = c9e8bbe3, %l6 = 0000000000000808
	swapa	[%i3+%o6]0x80,%l6	! %l6 = 00000000c9e8bbe3
!	%l6 = 00000000c9e8bbe3, Mem[000000001c000008] = af4859c9
	stwa	%l6,[%i0+%o6]0x80	! Mem[000000001c000008] = c9e8bbe3
	ble,a	p3_b33			! Branch Taken, %ccr = 13, CWP = 0

p3_label_32:
!	Mem[000000001c800000] = ffffffff, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x021,%g2
p3_b33:
	membar	#Sync			! Added by membar checker (591)
!	%f14 = 15149651 bc23a8ed, %f10 = d5ebf1dc d66bf1dc
	fmovd	%f14,%f10		! %f10 = 15149651 bc23a8ed
	set	p3_b34,%o7
	fbo,pt	%fcc0,p3_near_2_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d800060] = 12cb0952 991efd44 89e08803 69b04492
	prefetch [%i3+0x060],23
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x022,%g2
p3_b34:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000001b36
!	%l1  = 0000000000000000
!	%l4  = 00000000ffffffff
!	%l5  = 0000000000001b9b
!	%l6  = 000000000057586e
	membar	#Sync			! Added by membar checker (592)
!	%l7 = ffffffffffffffff, %l2 = 000000000000ff00, %l6 = 000000000057586e
	xnor	%l7,%l2,%l6		! %l6 = 000000000000ff00

p3_label_33:
!	%l6 = 000000000000ff00, immed = 000006c1, %l7 = ffffffffffffffff
	orncc	%l6,0x6c1,%l7		! %l7 = ffffffffffffff3e, %ccr = 88
!	%l6 = 000000000000ff00, %l7 = ffffffffffffff3e, %l6 = 000000000000ff00
	add	%l6,%l7,%l6		! %l6 = 000000000000fe3e
	fbg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 000000000000ff00, Mem[000000001c0001f8] = 6c0eb3bd
	sth	%l2,[%i0+0x1f8]		! Mem[000000001c0001f8] = ff00b3bd
p3_b35:
	membar	#Sync			! Added by membar checker (593)
!	%l0 = 00001b36, %l1 = 00000000, Mem[000000001c000008] = c9e8bbe3 0b394625
	stda	%l0,[%i0+%o6]0x80	! Mem[000000001c000008] = 00001b36 00000000

p3_label_34:
	set	p3_b36,%o7
	fbge,pt	%fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 0
!	%l7 = ffffffffffffff3e, Mem[000000001d80019c] = 96657001
	sth	%l7,[%i3+0x19c]		! Mem[000000001d80019c] = ff3e7001
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x024,%g2
p3_b36:
!	Registers modified during the branch to p3_near_1
!	%l1  = 0000000000000000
!	%l6  = 0000000000000000
!	%l7  = 0000000000000e5d
	membar	#Sync			! Added by membar checker (594)
!	%f18 = 00000000 00000000, %f4  = 6e9d30af 70eeda2e
	fcmped	%fcc2,%f18,%f4 		! %fcc2 = 1
!	%l5 = 0000000000001b9b, %l0 = 0000000000001b36, %y  = 00000000
	sdivcc	%l5,%l0,%l1		! %l1 = 0000000000000001, %ccr = 00
!	%f8  = 2ffe158b, %f8  = 2ffe158b, %f10 = 15149651
	fdivs	%f8 ,%f8 ,%f10		! %f10 = 3f800000

p3_label_35:
	set	p3_b37,%o7
	fbuge,pt %fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001d000000] = 0000000000000067, %l5 = 0000000000001b9b
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000067
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x025,%g2
p3_b37:
!	Registers modified during the branch to p3_near_1
!	%l1  = 0000000000000000
!	%l6  = 0000000000000000
!	%l7  = 0000000000000e5d
	ba	p3_b38			! Branch Taken, %ccr = 44, CWP = 0
!	%l5 = 0000000000000067, Mem[000000003080003c] = 33b8f27b
	stw	%l5,[%o1+0x03c]		! Mem[000000003080003c] = 00000067
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x026,%g2
p3_b38:
	set	p3_b39,%o7
	fbuge,a	p3_far_1_le	! Branch Taken, %fcc0 = 0

p3_label_36:
!	Mem[000000001d800020] = 1a87ccdb 487ee5de 3ee46422 e1f49638
	prefetch [%i3+0x020],20
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x027,%g2
p3_b39:
!	Registers modified during the branch to p3_far_1
!	%l0  = b885e57319e3e064
!	%l4  = ffffffffffeef37b
!	%l5  = 0000000000000000
!	%l6  = 0000000000558e5e
!	%l7  = fffffffffffff1a3
	membar	#Sync			! Added by membar checker (595)
!	%l3 = 000000000000032a, immed = fffff553, %l1 = 0000000000000000
	taddcc	%l3,-0xaad,%l1		! %l1 = fffffffffffff87d, %ccr = 8a
!	Mem[000000001c000020] = 00000067 0000032a d139a489 cb416a98
	prefetcha [%i0+0x020]%asi,3
!	%l6 = 0000000000558e5e, %l6 = 0000000000558e5e, %l3 = 000000000000032a
	orcc	%l6,%l6,%l3		! %l3 = 0000000000558e5e, %ccr = 00
!	Mem[0000000030800034] = 9a9fd348, %l1 = fffffffffffff87d
	ldsb	[%o1+0x034],%l1		! %l1 = ffffffffffffff9a

p3_label_37:
!	%f16 = 32e28351 6d93ff4b, %f12 = 9b22777c 9b21d14e
	fmovd	%f16,%f12		! %f12 = 32e28351 6d93ff4b
!	Mem[000000001d800000] = 811e8da9, %l3 = 0000000000558e5e
	lduha	[%i3+%g0]0x80,%l3	! %l3 = 000000000000811e
!	%l1 = ffffffffffffff9a, %l5 = 0000000000000000, %l0 = b885e57319e3e064
	xnor	%l1,%l5,%l0		! %l0 = 0000000000000065
!	%l6 = 0000000000558e5e, %l6 = 0000000000558e5e, %l3 = 000000000000811e
	subc	%l6,%l6,%l3		! %l3 = 0000000000000000
!	%l4 = ffffffffffeef37b, Mem[000000001c000000] = ccf7290ccf69c147
	stxa	%l4,[%i0+%g0]0x80	! Mem[000000001c000000] = ffffffffffeef37b

p3_label_38:
!	%l2 = 000000000000ff00, Mem[0000000031000078] = dcd6c89e6386028c
	stxa	%l2,[%o2+0x078]%asi	! Mem[0000000031000078] = 000000000000ff00
	set	p3_b40,%o7
	fbo,pn	%fcc2,p3_near_3_he	! Branch Taken, %fcc2 = 1
!	Mem[000000001c800008] = ff000067, %l4 = ffffffffffeef37b
	ldsha	[%i1+%o6]0x80,%l4	! %l4 = ffffffffffffff00
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x028,%g2
p3_b40:
	membar	#Sync			! Added by membar checker (596)
!	%l6 = 0000000000558e5e, Mem[000000003180003e] = a7faf048
	stba	%l6,[%o3+0x03e]%asi	! Mem[000000003180003c] = a7fa5e48
	bge	p3_b41			! Branch Taken, %ccr = 00, CWP = 0

p3_label_39:
!	Mem[000000001c000000] = ffffffff, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ffffffff
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x029,%g2
p3_b41:
	membar	#Sync			! Added by membar checker (597)
	fbg,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l6 = 0000000000558e5e, Mem[000000001c000000] = ffffffff
	stha	%l6,[%i0+%g0]0x80	! Annulled
p3_b42:
	membar	#Sync			! Added by membar checker (598)
	set	p3_b43,%o7
	fbe,pt	%fcc1,p3_near_3_he	! Branch Taken, %fcc1 = 0
!	Mem[000000001d000008] = 0000bfdf, %l5 = 00000000ffffffff
	lduba	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x02b,%g2
p3_b43:

p3_label_40:
	membar	#Sync			! Added by membar checker (599)
!	%l3 = 0000000000000000, immed = fffff123, %l4 = ffffffffffffff00
	xor	%l3,-0xedd,%l4		! %l4 = fffffffffffff123
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d000160] = 898566a9 6d9c1817 1ec900e9 5e1cd62e
	prefetch [%i2+0x160],2	! Annulled
p3_b44:
	membar	#Sync			! Added by membar checker (600)
!	%l7 = fffffffffffff1a3, %l1 = ffffffffffffff9a, %y  = 00000000
	udiv	%l7,%l1,%l5		! %l5 = 0000000000000000
!	Mem[000000001c800008] = ff000067, %l3 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l3	! %l3 = ffffffffff000067

p3_label_41:
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l7 = fffffffffffff1a3, Mem[000000001d000154] = 20ae06e0
	stw	%l7,[%i2+0x154]		! Annulled
p3_b45:
	membar	#Sync			! Added by membar checker (601)
!	%l4 = fffffffffffff123, immed = 000000a5, %y  = 00000000
	sdivcc	%l4,0x0a5,%l2		! %l2 = 00000000018d3001, %ccr = 00
	nop
!	%l5 = 0000000000000000, immed = 00000c27, %l5 = 0000000000000000
	xorcc	%l5,0xc27,%l5		! %l5 = 0000000000000c27, %ccr = 00

p3_label_42:
	set	p3_b46,%o7
	fbge	p3_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d00010c] = ea286c6a, %l2 = 00000000018d3001
	lduh	[%i2+0x10c],%l2		! %l2 = 000000000000ea28
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x02e,%g2
p3_b46:
!	Registers modified during the branch to p3_far_0
!	%l3  = 00000000000000c4
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d8000f0] = c0e9062f9f709a53, %l5 = 0000000000000c27
	ldx	[%i3+0x0f0],%l5		! Annulled
p3_b47:
	membar	#Sync			! Added by membar checker (602)
!	%l5 = 0000000000000c27, Mem[000000001d80019e] = ff3e7001
	stha	%l5,[%i3+0x19e]%asi	! Mem[000000001d80019c] = ff3e0c27

p3_label_43:
	fbne,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000001c800040] = d411ddf9 70aa5786 75402a15 e9983f32
	prefetch [%i1+0x040],2	! Annulled
p3_b48:
	membar	#Sync			! Added by membar checker (603)
!	%l6 = 0000000000558e5e, immed = 00000ffa, %y  = 00000000
	udivx	%l6,0xffa,%l6		! %l6 = 000000000000055a
!	%f8  = 2ffe158b, %f21 = 00000000
	fcmps	%fcc0,%f8 ,%f21		! %fcc0 = 2
!	Mem[0000000031800030] = 530284a5, %l2 = 000000000000ea28
	lduwa	[%o3+0x030]%asi,%l2	! %l2 = 00000000530284a5

p3_label_44:
!	Mem[000000001c000024] = 0000032a, %l1 = ffffff9a, %l4 = fffff123
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000000000032a
	fbg,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001c8001c4] = a79401ad, %l5 = 0000000000000c27
	lduw	[%i1+0x1c4],%l5		! Annulled
p3_b49:
	membar	#Sync			! Added by membar checker (604)
!	Mem[000000004000003c] = 0001080e, %l4 = 000000000000032a
	lduw	[%o5+0x03c],%l4		! %l4 = 000000000001080e
	set	p3_b50,%o7
	fbule,pn %fcc3,p3_near_2_le	! Branch Taken, %fcc3 = 0

p3_label_45:
!	Mem[000000001c000035] = 3e6d27fc, %l7 = fffffffffffff1a3
	ldstub	[%i0+0x035],%l7		! %l7 = 000000000000006d
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x032,%g2
p3_b50:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000000400
	membar	#Sync			! Added by membar checker (605)
!	Branch On Register, %l1 = ffffffffffffff9a
	brnz,a,pn %l1,p3_b51		! Branch Taken
!	Mem[000000001d000008] = 0000bfdf 0075fbc4, %l6 = 0000055a, %l7 = 0000006d
	ldda	[%i2+%o6]0x80,%l6	! %l6 = 000000000000bfdf 000000000075fbc4
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x033,%g2
p3_b51:
	bg,a	p3_b52			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000031800078] = ffffffff, %l2 = 00000000530284a5
	swap	[%o3+0x078],%l2		! %l2 = 00000000ffffffff
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x034,%g2
p3_b52:

p3_label_46:
	membar	#Sync			! Added by membar checker (606)
!	Mem[000000001c8001a0] = af3f4017 6b8a79aa ace15e24 d552b2aa
	prefetcha [%i1+0x1a0]%asi,20
!	%l2 = 00000000ffffffff, immed = fffffe42, %y  = 00000000
	udivcc	%l2,-0x1be,%l5		! %l5 = 0000000000000001, %ccr = 00
	fbul,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000001c0001e0] = 2fa4adbf e70ff2ea 768d1280 0b7ac1b5
	prefetch [%i0+0x1e0],16
p3_b53:
	membar	#Sync			! Added by membar checker (607)
	fbul,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_47:
!	Mem[000000001d800008] = 00000808, %l7 = 000000000075fbc4
	lduha	[%i3+%o6]0x80,%l7	! Annulled
p3_b54:
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c000000] = ffffffff, %l6 = 000000000000bfdf
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
p3_b55:
	membar	#Sync			! Added by membar checker (608)
!	Mem[0000000031800038] = ec81cec3, %l2 = 00000000ffffffff
	ldsw	[%o3+0x038],%l2		! %l2 = ffffffffec81cec3
!	%l6 = 000000ff, %l7 = 0075fbc4, Mem[0000000031000038] = 23e6663d 25e2febf
	stda	%l6,[%o2+0x038]%asi	! Mem[0000000031000038] = 000000ff 0075fbc4

p3_label_48:
!	%l2 = ffffffffec81cec3, immed = fffff80b, %l1 = ffffffffffffff9a
	addcc	%l2,-0x7f5,%l1		! %l1 = ffffffffec81c6ce, %ccr = 99
!	%l1 = ffffffffec81c6ce, immed = 0000002f, %l0 = 0000000000000400
	sllx	%l1,0x02f,%l0		! %l0 = e367000000000000
!	%l0 = e367000000000000, %l3 = 00000000000000c4, %y  = 00000000
	sdiv	%l0,%l3,%l5		! %l5 = 0000000000000000
!	%f18 = 00000000 00000000, %f0  = ffeb2f8f 752f01ee, %f4  = 6e9d30af 70eeda2e
	faddd	%f18,%f0 ,%f4 		! %f4  = ffeb2f8f 752f01ee
	fbue,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_49:
!	Mem[000000001c000000] = ffffffff, %l2 = ffffffffec81cec3
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffffff
p3_b56:
	membar	#Sync			! Added by membar checker (609)
!	Mem[000000001c800000] = ffffffff, %l2 = ffffffffffffffff
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ffffffff
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l7 = 000000000075fbc4, Mem[000000001d000000] = 00000000
	stba	%l7,[%i2+%g0]0x80	! Mem[000000001d000000] = c4000000
p3_b57:
	membar	#Sync			! Added by membar checker (610)
!	Mem[000000001d800158] = 1a36efbd, %l0 = e367000000000000
	ldswa	[%i3+0x158]%asi,%l0	! %l0 = 000000001a36efbd

p3_label_50:
!	Mem[000000001c0000b4] = c6a7e49d, %l4 = 000000000001080e
	ldsh	[%i0+0x0b4],%l4		! %l4 = ffffffffffffc6a7
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[000000001c800008] = ff000067, %l3 = 00000000000000c4
	ldsha	[%i1+%o6]0x80,%l3	! %l3 = ffffffffffffff00
p3_b58:
	bge	p3_not_taken_0		! Branch Not Taken, %ccr = 99
!	%l3 = ffffffffffffff00, Mem[000000003200000a] = 8895a468
	stb	%l3,[%o4+0x00a]		! Mem[0000000032000008] = 0095a468
p3_b59:

p3_label_51:
	membar	#Sync			! Added by membar checker (611)
!	%l5 = 0000000000000000
	sethi	%hi(0x8b879000),%l5	! %l5 = 000000008b879000
!	%l3 = ffffffffffffff00, %l5 = 000000008b879000, %l7 = 000000000075fbc4
	orn	%l3,%l5,%l7		! %l7 = ffffffffffffffff
!	%l7 = ffffffffffffffff, immed = fffff761, %l3 = ffffffffffffff00
	taddcc	%l7,-0x89f,%l3		! %l3 = fffffffffffff760, %ccr = 9b
	set	p3_b60,%o7
	fbuge	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001d000000] = c4000000, %l4 = ffffffffffffc6a7
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000c400
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x03c,%g2
p3_b60:
!	Registers modified during the branch to p3_far_2
!	%l1  = ffffffffd24ad711
!	%l2  = fffffffffffff067
!	%l3  = 000000001a36efbd
!	%l5  = 0000000000001426

p3_label_52:
	membar	#Sync			! Added by membar checker (612)
!	%l0 = 1a36efbd, %l1 = d24ad711, Mem[000000001c0000b0] = 9e1423e1 c6a7e49d
	stda	%l0,[%i0+0x0b0]%asi	! Mem[000000001c0000b0] = 1a36efbd d24ad711
	bvc,a	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	%l1 = ffffffffd24ad711, Mem[000000001d800008] = 00000808
	stba	%l1,[%i3+%o6]0x80	! Annulled
p3_b61:
	membar	#Sync			! Added by membar checker (613)
	fbu,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i0+%g0]0x80,%l0
p3_b62:

p3_label_53:
	membar	#Sync			! Added by membar checker (614)
!	%l4 = 000000000000c400, Mem[0000000031800078] = 530284a5
	stwa	%l4,[%o3+0x078]%asi	! Mem[0000000031800078] = 0000c400
!	Mem[000000001d000140] = 62e7dc9d a98579f0 35b14d89 b562a63d
	prefetch [%i2+0x140],2
!	%l4 = 000000000000c400, immed = fffff62a, %l1 = ffffffffd24ad711
	xor	%l4,-0x9d6,%l1		! %l1 = ffffffffffff322a
!	Mem[0000000031000030] = 0264d90a 8765fdee, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%o2+0x030]%asi,%l6	! %l6 = 000000000264d90a 000000008765fdee
!	%f0  = ffeb2f8f 752f01ee, %f18 = 00000000 00000000, %f20 = 00000000 00000000
	fsubd	%f0 ,%f18,%f20		! %f20 = ffeb2f8f 752f01ee

p3_label_54:
	bg,a	p3_b63			! Branch Taken, %ccr = 9b, CWP = 0
!	Mem[000000001d000008] = 0000bfdf, %l7 = 000000008765fdee
	ldstuba	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x03f,%g2
p3_b63:
	membar	#Sync			! Added by membar checker (615)
!	%l5 = 0000000000001426, %l0 = 000000001a36efbd, %l6 = 000000000264d90a
	orcc	%l5,%l0,%l6		! %l6 = 000000001a36ffbf, %ccr = 00
	set	p3_b64,%o7
	fbo,a,pn %fcc2,p3_near_1_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000030000038] = 1a36efbd, %l0 = 000000001a36efbd
	ldsb	[%o0+0x03b],%l0		! %l0 = ffffffffffffffbd
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x040,%g2
p3_b64:
!	Registers modified during the branch to p3_near_1
!	%l1  = 0000000000000000
!	%l6  = 0000000000000000
!	%l7  = 0000000000000400

p3_label_55:
	membar	#Sync			! Added by membar checker (616)
	fbul,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000030800074] = 6023d87c, %l3 = 000000001a36efbd
	swap	[%o1+0x074],%l3		! Annulled
p3_b65:
	membar	#Sync			! Added by membar checker (617)
!	%l3 = 000000001a36efbd, %l0 = ffffffffffffffbd, %l1 = 0000000000000000
	and	%l3,%l0,%l1		! %l1 = 000000001a36efbd
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001c800008] = ff000067f654389e, %l1 = 000000001a36efbd
	ldxa	[%i1+%o6]0x80,%l1	! Annulled
p3_b66:

p3_label_56:
	membar	#Sync			! Added by membar checker (618)
!	%l1 = 000000001a36efbd, Mem[000000001f0000a8] = bb024d7e
	sth	%l1,[%i6+0x0a8]		! Mem[000000001f0000a8] = efbd4d7e
!	Mem[0000000030800038] = 0f9bee19 00000067, %l4 = 0000c400, %l5 = 00001426
	ldd	[%o1+0x038],%l4		! %l4 = 000000000f9bee19 0000000000000067
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000030800030] = fff5787c9a9fd348, %l4 = 000000000f9bee19
	ldx	[%o1+0x030],%l4		! %l4 = fff5787c9a9fd348
p3_b67:
	membar	#Sync			! Added by membar checker (619)
!	%l7 = 0000000000000400, immed = fffff7a9, %l7 = 0000000000000400
	or	%l7,-0x857,%l7		! %l7 = fffffffffffff7a9

p3_label_57:
!	Mem[000000001c80009c] = 1d541982, %l4 = fff5787c9a9fd348
	lduw	[%i1+0x09c],%l4		! %l4 = 000000001d541982
!	Branch On Register, %l2 = fffffffffffff067
	brnz,pn	%l2,p3_b68		! Branch Taken
!	%l6 = 00000000, %l7 = fffff7a9, Mem[000000001d800008] = 00000808 173258db
	stda	%l6,[%i3+%o6]0x80	! Mem[000000001d800008] = 00000000 fffff7a9
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x044,%g2
p3_b68:
	membar	#Sync			! Added by membar checker (620)
!	%l4 = 000000001d541982, %l4 = 000000001d541982, %l6 = 0000000000000000
	addccc	%l4,%l4,%l6		! %l6 = 000000003aa83304, %ccr = 00
!	%f22 = 00000000 00000000, %f31 = 6d93ff4b
	fxtos	%f22,%f31		! %f31 = 00000000

p3_label_58:
!	%l5 = 0000000000000067, immed = fffff3ce, %l6 = 000000003aa83304
	subccc	%l5,-0xc32,%l6		! %l6 = 0000000000000c99, %ccr = 11
!	%f2  = 98611fab 0b8d649d, %f18 = 00000000 00000000, %f6  = 2ffe158b afd2c5cd
	fmuld	%f2 ,%f18,%f6 		! %f6  = 80000000 00000000
!	%l7 = fffffffffffff7a9, %l2 = fffffffffffff067, %l3 = 000000001a36efbd
	xorcc	%l7,%l2,%l3		! %l3 = 00000000000007ce, %ccr = 00
!	%l5 = 0000000000000067, %l7 = fffffffffffff7a9, %y  = 00000000
	umul	%l5,%l7,%l1		! %l1 = 00000066fffca4ff
!	%f28 = 84e65df9 b745e704, %f12 = 32e28351 6d93ff4b
	fcmped	%fcc0,%f28,%f12		! %fcc0 = 1

p3_label_59:
!	%l3 = 00000000000007ce, immed = fffff407, %y  = 00000066
	udivx	%l3,-0xbf9,%l7		! %l7 = 0000000000000000
!	%f4  = ffeb2f8f 752f01ee, %f0  = ffeb2f8f 752f01ee, %f24 = 1d5a24a4 ffeb2f8f
	fdivd	%f4 ,%f0 ,%f24		! %f24 = 3ff00000 00000000
!	Mem[0000000032000060] = e6a70116 4168fde0 d3a59bed c4d847d0
	prefetcha [%o4+0x060]%asi,23
!	Mem[000000001d000108] = 2f3eea2c ea286c6a, %l0 = ffffffbd, %l1 = fffca4ff
	ldd	[%i2+0x108],%l0		! %l0 = 000000002f3eea2c 00000000ea286c6a
!	%l3 = 00000000000007ce, immed = 0000017b, %y  = 00000066
	mulx	%l3,0x17b,%l3		! %l3 = 00000000000b8dfa

p3_label_60:
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l7 = 0000000000000000, Mem[000000001c800086] = c144b49e
	stb	%l7,[%i1+0x086]		! Annulled
p3_b69:
	membar	#Sync			! Added by membar checker (621)
!	%l7 = 0000000000000000, %l2 = fffffffffffff067, %y  = 00000066
	smulcc	%l7,%l2,%l7		! %l7 = 0000000000000000, %ccr = 44
!	%l5 = 0000000000000067, Mem[0000000030800074] = 6023d87c
	stwa	%l5,[%o1+0x074]%asi	! Mem[0000000030800074] = 00000067
!	Mem[000000001d8000d4] = 68f3200e, %l0 = 000000002f3eea2c
	swap	[%i3+0x0d4],%l0		! %l0 = 0000000068f3200e

p3_label_61:
	set	p3_b70,%o7
	fbul	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[000000003000007c] = 00000081, %l4 = 000000001d541982
	swap	[%o0+0x07c],%l4		! %l4 = 0000000000000081
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x046,%g2
p3_b70:
!	Registers modified during the branch to p3_far_0
!	%l3  = 00000000000000ff
	membar	#Sync			! Added by membar checker (622)
!	%l2 = fffff067, %l3 = 000000ff, Mem[000000001c800000] = ffffffff fbed48ab
	stda	%l2,[%i1+%g0]0x80	! Mem[000000001c800000] = fffff067 000000ff
	ble	p3_b71			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[000000001c000008] = 00001b3600000000, %l4 = 0000000000000081
	ldxa	[%i0+%o6]0x80,%l4	! %l4 = 00001b3600000000
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x047,%g2
p3_b71:

p3_label_62:
	membar	#Sync			! Added by membar checker (623)
!	%l4 = 00001b3600000000, Mem[0000000032000060] = e6a701164168fde0
	stxa	%l4,[%o4+0x060]%asi	! Mem[0000000032000060] = 00001b3600000000
!	Mem[000000001c000100] = b12933f9 41d38ced 0166c383 6760874d
	prefetch [%i0+0x100],16
!	Mem[000000001d80001c] = 2390eeb0, %l1 = 00000000ea286c6a
	ldsw	[%i3+0x01c],%l1		! %l1 = 000000002390eeb0
!	Mem[0000000031800030] = 530284a5b3f691fe, %l6 = 0000000000000c99
	ldx	[%o3+0x030],%l6		! %l6 = 530284a5b3f691fe
!	Mem[000000001d80001c] = 2390eeb0, %l0 = 0000000068f3200e
	lduba	[%i3+0x01d]%asi,%l0	! %l0 = 0000000000000090

p3_label_63:
!	Mem[000000001c000000] = ffffffff, %l3 = 00000000000000ff
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	%l7 = 0000000000000000, Mem[000000001c800145] = 6f13d71c
	stb	%l7,[%i1+0x145]		! Mem[000000001c800144] = 6f00d71c
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l5 = 0000000000000067, Mem[000000003000003d] = ec81c6ce
	stb	%l5,[%o0+0x03d]		! Annulled
p3_b72:
	membar	#Sync			! Added by membar checker (624)
	fbu,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1

p3_label_64:
!	Mem[000000001c000008] = 00001b36, %l3 = ffffffffffffffff
	ldsba	[%i0+%o6]0x80,%l3	! Annulled
p3_b73:
	membar	#Sync			! Added by membar checker (625)
!	Mem[000000001c800154] = f707c1ee, %l3 = ffffffffffffffff
	lduba	[%i1+0x156]%asi,%l3	! %l3 = 00000000000000c1
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = 0000000000000000, Mem[0000000030000071] = 8a77f703
	stb	%l7,[%o0+0x071]		! Mem[0000000030000070] = 8a00f703
p3_b74:
	membar	#Sync			! Added by membar checker (626)
!	Mem[000000001d000008] = ff00bfdf0075fbc4, %l0 = 0000000000000090
	ldxa	[%i2+%o6]0x80,%l0	! %l0 = ff00bfdf0075fbc4

p3_label_65:
!	%l4 = 00001b3600000000, %l6 = 530284a5b3f691fe, %l3 = 00000000000000c1
	sub	%l4,%l6,%l3		! %l3 = acfd96904c096e02
!	Mem[000000001c000000] = ffffffff, %l4 = 00001b3600000000
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	%l6 = 530284a5b3f691fe, Mem[000000001c80008c] = c1be4a71
	stwa	%l6,[%i1+0x08c]%asi	! Mem[000000001c80008c] = b3f691fe
!	%l4 = ffffffffffffffff, immed = fffffaa3, %y  = 00000000
	mulx	%l4,-0x55d,%l1		! %l1 = 000000000000055d
!	Mem[000000001c00005c] = 36baa0af, %l2 = fffffffffffff067
	ldstub	[%i0+0x05c],%l2		! %l2 = 0000000000000036

p3_label_66:
!	%f11 = bc23a8ed, %f11 = bc23a8ed, %f15 = bc23a8ed
	fadds	%f11,%f11,%f15		! %f15 = bca3a8ed
!	%l6 = 530284a5b3f691fe, immed = 000008cb, %l3 = acfd96904c096e02
	addcc	%l6,0x8cb,%l3		! %l3 = 530284a5b3f69ac9, %ccr = 08
!	%l4 = ffffffffffffffff, Mem[0000000031000030] = 0264d90a8765fdee
	stx	%l4,[%o2+0x030]		! Mem[0000000031000030] = ffffffffffffffff
!	%l0 = ff00bfdf0075fbc4, immed = 0000029c, %l6 = 530284a5b3f691fe
	xor	%l0,0x29c,%l6		! %l6 = ff00bfdf0075f958
!	%l0 = ff00bfdf0075fbc4, %l1 = 000000000000055d, %y  = 00000000
	sdivx	%l0,%l1,%l3		! %l3 = ffffd06863c0b121

p3_label_67:
!	%l7 = 0000000000000000, immed = fffff29d, %y  = 00000000
	udiv	%l7,-0xd63,%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, %l1 = 000000000000055d, %l3 = ffffd06863c0b121
	sub	%l0,%l1,%l3		! %l3 = fffffffffffffaa3
!	Mem[000000001d800100] = bc23a8ed 00000036, %l4 = ffffffffffffffff, %l4 = ffffffffffffffff
	add	%i3,0x100,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = eea2862015aac7c2
	set	p3_b75,%o7
	fblg	p3_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d800000] = 811e8da9, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000811e
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x04b,%g2
p3_b75:
!	Registers modified during the branch to p3_far_2
!	%l0  = 0000000000000ccd
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 000000000000ff00
!	%l5  = 0000938e76b3365a

p3_label_68:
	membar	#Sync			! Added by membar checker (627)
!	%f0  = ffeb2f8f, %f19 = 00000000
	fcmpes	%fcc3,%f0 ,%f19		! %fcc3 = 3
!	%l3 = 000000000000ff00, %l4 = eea2862015aac7c2, %l4 = eea2862015aac7c2
	addc	%l3,%l4,%l4		! %l4 = eea2862015abc6c2
!	Mem[000000001d0000ac] = 56eff1a4, %l5 = 0000938e76b3365a
	lduh	[%i2+0x0ac],%l5		! %l5 = 00000000000056ef
!	%l2 = 0000000000000000, %l7 = 000000000000811e, %l6 = ff00bfdf0075f958
	add	%l2,%l7,%l6		! %l6 = 000000000000811e
!	%f0  = ffeb2f8f, %f7  = 00000000
	fitos	%f0 ,%f7 		! %f7  = c9a68388

p3_label_69:
!	Branch On Register, %l6 = 000000000000811e
	brlez,a,pn %l6,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d000008] = ff00bfdf0075fbc4, %l5 = 00000000000056ef
	ldxa	[%i2+%o6]0x80,%l5	! Annulled
p3_b76:
	membar	#Sync			! Added by membar checker (628)
!	%l5 = 00000000000056ef, Mem[000000001c000008] = 00001b36
	stba	%l5,[%i0+%o6]0x80	! Mem[000000001c000008] = ef001b36
!	Mem[000000001c0000c0] = d4243fa0, %l2 = 0000000000000000
	swapa	[%i0+0x0c0]%asi,%l2	! %l2 = 00000000d4243fa0
!	%f24 = 3ff00000 00000000, %f20 = ffeb2f8f 752f01ee
	fcmped	%fcc2,%f24,%f20		! %fcc2 = 2

p3_label_70:
!	Mem[000000001c800100] = b75076ce 5fb34d61 1b963252 913ec946
	prefetch [%i1+0x100],3
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001c8001c0] = 0bd6495c a79401ad dd73c9d9 9203f615
	prefetch [%i1+0x1c0],0	! Annulled
p3_b77:
	membar	#Sync			! Added by membar checker (629)
!	%l3 = 000000000000ff00, Mem[000000001c800108] = 1b963252
	stha	%l3,[%i1+0x108]%asi	! Mem[000000001c800108] = ff003252
	set	p3_b78,%o7
	fbug,pn	%fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 3

p3_label_71:
!	%l6 = 000000000000811e, Mem[000000001d800000] = 811e8da9
	stba	%l6,[%i3+%g0]0x80	! Mem[000000001d800000] = 1e1e8da9
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x04e,%g2
p3_b78:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000001b36
!	%l1  = 000000000000ff00
!	%l4  = 000000000000051d
!	%l5  = 0000000000001b9b
!	%l6  = 000000001b7f6500
	membar	#Sync			! Added by membar checker (630)
!	Mem[000000001d000000] = c4000000, %l5 = 0000000000001b9b
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = ffffffffc4000000
!	Jump to jmpl_0, CWP = 0
	set	p3_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001d800008] = 00000000fffff7a9, %l0 = 0000000000001b36
	ldxa	[%i3+%o6]0x80,%l0	! %l0 = 00000000fffff7a9
!	Registers modified during the branch to p3_jmpl_0
!	%l5  = 0000000000007e00
!	%f30 = b2e28351 00000000, %f22 = 00000000 00000000, %f20 = ffeb2f8f 752f01ee
	fsubd	%f30,%f22,%f20		! %f20 = b2e28351 00000000

p3_label_72:
	fbn,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[000000001c800008] = ff000067, %l7 = 000000000000811e
	swapa	[%i1+%o6]0x80,%l7	! Annulled
p3_b79:
	membar	#Sync			! Added by membar checker (631)
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b70095 a4685005
	prefetch [%o4+0x000],22
!	%l4 = 000000000000051d
	setx	0x9a4b03b29a4b03b2,%g7,%l4 ! %l4 = 9a4b03b29a4b03b2
	set	p3_b80,%o7
	fbule,a	p3_far_2_he	! Branch Taken, %fcc0 = 1

p3_label_73:
!	Mem[000000001d0000a0] = ddc5f9e2 67eab1f9 a26cc3e8 56eff1a4
	prefetch [%i2+0x0a0],0
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x050,%g2
p3_b80:
!	Registers modified during the branch to p3_far_2
!	%l0  = 0000000000000ccd
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 000000000000ff00
!	%l5  = 0000938e76b3365a
	membar	#Sync			! Added by membar checker (632)
!	%l7 = 000000000000811e, Mem[000000001c000014] = 0411cc94
	stb	%l7,[%i0+0x014]		! Mem[000000001c000014] = 1e11cc94
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l0 = 0000000000000ccd, Mem[0000000031800034] = b3f691fe
	stw	%l0,[%o3+0x034]		! Mem[0000000031800034] = 00000ccd
p3_b81:
	membar	#Sync			! Added by membar checker (633)
!	Mem[000000001c000008] = ef001b36, %l4 = 9a4b03b29a4b03b2
	lduha	[%i0+%o6]0x80,%l4	! %l4 = 000000000000ef00

p3_label_74:
	set	p3_b82,%o7
	fbl,a	p3_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c8000a4] = 13ff1d0c, %l4 = 000000000000ef00
	lduw	[%i1+0x0a4],%l4		! %l4 = 0000000013ff1d0c
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x052,%g2
p3_b82:
!	Registers modified during the branch to p3_far_2
!	%l0  = 0000000000000ccd
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 000000000000ff00
!	%l5  = 0000938e76b3365a
	membar	#Sync			! Added by membar checker (634)
!	Mem[000000001c000000] = ffffffff, %l3 = 000000000000ff00
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 000000000000ffff
!	%f24 = 3ff00000 00000000, %f8  = 2ffe158b afd2c5cd
	fdtox	%f24,%f8 		! %f8  = 00000000 00000001
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00

p3_label_75:
!	%l5 = 0000938e76b3365a, Mem[000000001d000127] = 5aa44f22
	stb	%l5,[%i2+0x127]		! Annulled
p3_b83:
	membar	#Sync			! Added by membar checker (635)
!	%l6 = 000000001b7f6500, Mem[000000001e8001ba] = 1541a2af
	stb	%l6,[%i5+0x1ba]		! Mem[000000001e8001b8] = 154100af
!	Mem[000000004000003c] = 0001080e, %l7 = 000000000000811e
	lduha	[%o5+0x03e]%asi,%l7	! %l7 = 000000000000080e
!	%f4  = ffeb2f8f, %f13 = 6d93ff4b
	fitos	%f4 ,%f13		! %f13 = c9a68388
!	Mem[0000000032000028] = 537245c7, %l6 = 000000001b7f6500
	ldsha	[%o4+0x028]%asi,%g2	! %g2 = 0000000000005372

p3_label_76:
!	%l7 = 000000000000080e, Mem[000000001d000008] = ff00bfdf
	stwa	%l7,[%i2+%o6]0x80	! Mem[000000001d000008] = 0000080e
!	Mem[000000001c800008] = ff000067, %l1 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l1	! %l1 = ffffffffff000067
!	Mem[0000000030800074] = 00000067, %l4 = 0000000013ff1d0c
	lduw	[%o1+0x074],%l4		! %l4 = 0000000000000067
	fbuge,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d000000] = c4000000, %l3 = 000000000000ffff
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000c4000000
p3_b84:

p3_label_77:
	membar	#Sync			! Added by membar checker (636)
!	%l4 = 0000000000000067, immed = fffffe17, %y  = 00000000
	umul	%l4,-0x1e9,%l7		! %l7 = 00000066ffff3b41
!	Mem[000000001d800000] = 1e1e8da9, %l0 = 0000000000000ccd
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 000000001e1e8da9
!	Mem[0000000032000048] = cf027a2b, %l4 = 0000000000000067
	ldsw	[%o4+0x048],%g2		! %g2 = 0000000000000067
!	%l0 = 000000001e1e8da9, %l2 = 0000000000000000, %l1 = ffffffffff000067
	subccc	%l0,%l2,%l1		! %l1 = 000000001e1e8da9, %ccr = 00
!	Mem[000000001c000130] = 297ec66b, %l1 = 1e1e8da9, %l1 = 1e1e8da9
	add	%i0,0x130,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 00000000297ec66b

p3_label_78:
!	%f8  = 00000000, %f23 = 00000000
	fabss	%f8 ,%f23		! %f23 = 00000000
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031000074] = fffffff7, %l1 = 00000000297ec66b
	ldsh	[%o2+0x074],%l1		! Annulled
p3_b85:
	membar	#Sync			! Added by membar checker (637)
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b70095 a4685005
	prefetcha [%o4+0x000]%asi,4
	set	p3_b86,%o7
	fbl,a	p3_far_2_he	! Branch Taken, %fcc0 = 1

p3_label_79:
!	Mem[000000001c000008] = ef001b36, %l0 = 000000001e1e8da9
	ldsha	[%i0+%o6]0x80,%l0	! %l0 = ffffffffffffef00
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x056,%g2
p3_b86:
!	Registers modified during the branch to p3_far_2
!	%l0  = 0000000000000ccd
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 000000000000ff00
!	%l5  = 0000938e76b3365a
	membar	#Sync			! Added by membar checker (638)
!	%f10 = 3f800000, %f2  = 98611fab 0b8d649d
	fstox	%f10,%f2 		! %f2  = 00000000 00000001
	fbug	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l0 = 0000000000000ccd, Mem[000000001c000000] = ffffffff
	stba	%l0,[%i0+%g0]0x80	! Mem[000000001c000000] = cdffffff
p3_b87:
	membar	#Sync			! Added by membar checker (639)
!	%f21 = 00000000, %f30 = b2e28351
	fcmpes	%fcc0,%f21,%f30		! %fcc0 = 2

p3_label_80:
!	%f13 = c9a68388, %f14 = 15149651
	fstoi	%f13,%f14		! %f14 = ffeb2f8f
	set	p3_b88,%o7
	fbne,a	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	%l0 = 00000ccd, %l1 = 00000000, Mem[000000001e800050] = 0c578a45 2b0f918b
	std	%l0,[%i5+0x050]	! Mem[000000001e800050] = 00000ccd 00000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x058,%g2
p3_b88:
!	Registers modified during the branch to p3_far_1
!	%l0  = b885e57319e3e064
!	%l4  = fffffffff93502ef
!	%l5  = 0000000c2d6da777
!	%l6  = 000000002216b9d1
!	%l7  = ffffffa52d6e6c36
	membar	#Sync			! Added by membar checker (640)
!	%l4 = fffffffff93502ef, immed = 00000007, %l0 = b885e57319e3e064
	srl	%l4,0x007,%l0		! %l0 = 0000000001f26a05
	bne	p3_b89			! Branch Taken, %ccr = 91, CWP = 0

p3_label_81:
!	%l4 = f93502ef, %l5 = 2d6da777, Mem[000000001c000000] = cdffffff ffeef37b
	stda	%l4,[%i0+%g0]0x80	! Mem[000000001c000000] = f93502ef 2d6da777
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x059,%g2
p3_b89:
	bcc	p3_not_taken_0		! Branch Not Taken, %ccr = 91
!	%l0 = 0000000001f26a05, Mem[000000001c800008] = ff000067
	stha	%l0,[%i1+%o6]0x80	! Mem[000000001c800008] = 6a050067
p3_b90:
	membar	#Sync			! Added by membar checker (641)
!	%l3 = 000000000000ff00, immed = fffff283, %y  = 00000066
	sdivcc	%l3,-0xd7d,%l5		! %l5 = fffffffff87018d7, %ccr = 88
!	Mem[000000001c800020] = 0927ef90 6c0b594e 266c8478 d3c2533f
	prefetch [%i1+0x020],4

p3_label_82:
	set	p3_b91,%o7
	fblg,a,pn %fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001d800000] = 00000ccd, %l7 = ffffffa52d6e6c36
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x05b,%g2
p3_b91:
!	Registers modified during the branch to p3_near_1
!	%l1  = 0000000000000000
!	%l6  = 0000000000000066
!	%l7  = 000000000000024d
	membar	#Sync			! Added by membar checker (642)
!	%f18 = 00000000, %f6  = 80000000
	fstoi	%f18,%f6 		! %f6  = 00000000
!	%f16 = 32e28351 6d93ff4b, %f14 = ffeb2f8f bca3a8ed
	fcmped	%fcc1,%f16,%f14		! %fcc1 = 2
!	%l4 = f93502ef, %l5 = f87018d7, Mem[0000000031000070] = 9ccf7032 fffffff7
	stda	%l4,[%o2+0x070]%asi	! Mem[0000000031000070] = f93502ef f87018d7

p3_label_83:
!	Mem[000000001c000008] = ef001b3600000000, %l7 = 000000000000024d
	ldxa	[%i0+%o6]0x80,%l7	! %l7 = ef001b3600000000
!	%f13 = c9a68388, %f25 = 00000000, %f0  = ffeb2f8f
	fadds	%f13,%f25,%f0 		! %f0  = c9a68388
!	%f8  = 00000000, %f26 = c4d0888e
	fnegs	%f8 ,%f26		! %f26 = 80000000
	set	p3_b92,%o7
	fbg	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000030000038] = 1a36efbd, %l0 = 0000000001f26a05
	lduh	[%o0+0x03a],%l0		! %l0 = 000000000000efbd
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x05c,%g2
p3_b92:
!	Registers modified during the branch to p3_far_1
!	%l0  = b885e57319e3e064
!	%l4  = ffffffffffef674b
!	%l5  = 001520840b38a662
!	%l6  = 0000000000534931
!	%l7  = 1115054e0b38a662

p3_label_84:
	membar	#Sync			! Added by membar checker (643)
	set	p3_b93,%o7
	fbule,pt %fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 3
!	%l2 = 0000000000000000, Mem[000000001c800008] = 6a050067
	stha	%l2,[%i1+%o6]0x80	! Mem[000000001c800008] = 00000067
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x05d,%g2
p3_b93:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000001b36
!	%l1  = 000000000000ff00
!	%l4  = 000000000000051d
!	%l5  = 0000000000001b9b
!	%l6  = 000000001b7f6500
	membar	#Sync			! Added by membar checker (644)
!	%l6 = 000000001b7f6500, %l1 = 000000000000ff00, %l6 = 000000001b7f6500
	add	%l6,%l1,%l6		! %l6 = 000000001b806400
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c800008] = 00000067, %l3 = 000000000000ff00
	ldsha	[%i1+%o6]0x80,%l3	! %l3 = 0000000000000000
p3_b94:

p3_label_85:
	membar	#Sync			! Added by membar checker (645)
!	%l5 = 0000000000001b9b, immed = 0000001b, %l3 = 0000000000000000
	sll	%l5,0x01b,%l3		! %l3 = 000000dcd8000000
!	Mem[0000000032000060] = 00001b36 00000000 d3a59bed c4d847d0
	prefetch [%o4+0x060],23
!	%l1 = 000000000000ff00, %l6 = 000000001b806400, %y  = 00000000
	mulx	%l1,%l6,%l4		! %l4 = 00001b64e39c0000
!	%f12 = 32e28351 c9a68388, %f6  = 00000000 c9a68388
	fmovd	%f12,%f6 		! %f6  = 32e28351 c9a68388
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_86:
!	Mem[000000001c000008] = ef001b36, %l6 = 000000001b806400
	ldswa	[%i0+%o6]0x80,%l6	! %l6 = ffffffffef001b36
p3_b95:
	membar	#Sync			! Added by membar checker (646)
!	%l0 = 0000000000001b36, immed = 00000006, %l5 = 0000000000001b9b
	sll	%l0,0x006,%l5		! %l5 = 000000000006cd80
!	Branch On Register, %l0 = 0000000000001b36
	brgez,a,pn %l0,p3_b96		! Branch Taken
!	%l6 = ef001b36, %l7 = 0b38a662, Mem[000000001d8001a0] = 52d31f21 c5b167f0
	std	%l6,[%i3+0x1a0]	! Mem[000000001d8001a0] = ef001b36 0b38a662
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x060,%g2
p3_b96:
	membar	#Sync			! Added by membar checker (647)
!	%f21 = 00000000, %f29 = b745e704
	fabss	%f21,%f29		! %f29 = 00000000

p3_label_87:
	bvc	p3_b97			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c800180] = 0f9bee19 0b394625 ae74cc42 4733cd41
	prefetch [%i1+0x180],2
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x061,%g2
p3_b97:
	membar	#Sync			! Added by membar checker (648)
!	Mem[0000000030800070] = 806b575c, %l1 = 000000000000ff00
	ldsba	[%o1+0x073]%asi,%l1	! %l1 = 000000000000005c
	set	p3_b98,%o7
	fblg	p3_far_3_le	! Branch Taken, %fcc0 = 2
!	%l6 = ffffffffef001b36, Mem[000000001d000016] = a07190e0
	stb	%l6,[%i2+0x016]		! Mem[000000001d000014] = a07136e0
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x062,%g2
p3_b98:
!	Registers modified during the branch to p3_far_3
!	%l3  = 271ce00000000000
!	%l4  = d8e3200000001b36
!	%l7  = 271ce0000000005c

p3_label_88:
	membar	#Sync			! Added by membar checker (649)
!	%l6 = ffffffffef001b36, %l7 = 271ce0000000005c, %y  = 00000000
	smulcc	%l6,%l7,%l2		! %l2 = fffffff9e409c768, %ccr = 88
	set	p3_b99,%o7
	fbug,a,pn %fcc3,p3_near_0_he	! Branch Taken, %fcc3 = 3
!	Mem[000000001c000000] = f93502ef, %l2 = fffffff9e409c768
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000f93502ef
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x063,%g2
p3_b99:
	membar	#Sync			! Added by membar checker (650)
!	Denormal Floating Point Operation Nullified
	nop
	fbe,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_89:
!	%l3 = 271ce00000000000, Mem[000000001d800199] = a299aa79
	stb	%l3,[%i3+0x199]		! Annulled
p3_b100:
	membar	#Sync			! Added by membar checker (651)
!	%l5 = 000000000006cd80, immed = fffffa63, %y  = fffffff9
	umulcc	%l5,-0x59d,%l0		! %l0 = 0006cd7fd9d07880, %ccr = 08
	bg,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001d8000a0] = 61be0dd6 163cd6ef 1338cce1 d97994aa
	prefetch [%i3+0x0a0],1	! Annulled
p3_b101:
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08

p3_label_90:
!	Mem[000000001c8000e0] = 97edbd56 9abf5be6 dd186cb6 0c322416
	prefetch [%i1+0x0e0],3	! Annulled
p3_b102:
	membar	#Sync			! Added by membar checker (652)
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetch [%o4+0x020],1
	fbe,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[000000001d000008] = 0000080e, %l4 = d8e3200000001b36
	lduwa	[%i2+%o6]0x80,%l4	! %l4 = 000000000000080e
p3_b103:
	membar	#Sync			! Added by membar checker (653)
!	%f0  = c9a68388, %f14 = ffeb2f8f bca3a8ed
	fstox	%f0 ,%f14		! %f14 = ffffffff ffeb2f8f

p3_label_91:
!	%l2 = 00000000f93502ef, %l6 = ffffffffef001b36, %l4 = 000000000000080e
	andncc	%l2,%l6,%l4		! %l4 = 00000000103500c9, %ccr = 00
!	Mem[000000003180007c] = f87018d7, %l4 = 103500c9, %l5 = 0006cd80
	add	%o3,0x7c,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000f87018d7
	bvc,a	p3_b104			! Branch Taken, %ccr = 00, CWP = 0
!	%l0 = d9d07880, %l1 = 0000005c, Mem[000000001d800008] = 00000000 fffff7a9
	stda	%l0,[%i3+%o6]0x80	! Mem[000000001d800008] = d9d07880 0000005c
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x068,%g2
p3_b104:
	membar	#Sync			! Added by membar checker (654)
!	%l0 = 0006cd7fd9d07880, immed = fffff99d, %y  = 0006cd7f
	sdivcc	%l0,-0x663,%l2		! %l2 = ffffffff80000000, %ccr = 8a

p3_label_92:
	set	p3_b105,%o7
	fbge,a,pn %fcc2,p3_near_3_he	! Branch Taken, %fcc2 = 2
!	Mem[000000001c800180] = 0f9bee19 0b394625 ae74cc42 4733cd41
	prefetch [%i1+0x180],1
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x069,%g2
p3_b105:
	membar	#Sync			! Added by membar checker (655)
!	Mem[000000001d000000] = 0000ffff, %l7 = 271ce0000000005c
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 000000000000ffff
!	%l6 = ffffffffef001b36, immed = 0000000e, %l7 = 000000000000ffff
	srax	%l6,0x00e,%l7		! %l7 = ffffffffffffbc00
!	%l7 = ffffffffffffbc00, Mem[000000001d000188] = 1317f1b87fa659ba
	stx	%l7,[%i2+0x188]		! Mem[000000001d000188] = ffffffffffffbc00

p3_label_93:
!	Mem[0000000031800078] = f93502ef, %l1 = 000000000000005c
	ldsba	[%o3+0x078]%asi,%l1	! %l1 = fffffffffffffff9
	set	p3_b106,%o7
	fbuge,pt %fcc0,p3_near_2_le	! Branch Taken, %fcc0 = 2
!	%l4 = 00000000103500c9, Mem[0000000030000070] = 8a00f703ead82d30
	stx	%l4,[%o0+0x070]		! Mem[0000000030000070] = 00000000103500c9
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x06a,%g2
p3_b106:
!	Registers modified during the branch to p3_near_2
!	%l0  = ffffffff80000000
	membar	#Sync			! Added by membar checker (656)
!	%f12 = 32e28351, %f1  = 752f01ee, %f30 = b2e28351 00000000
	fsmuld	%f12,%f1 ,%f30		! %f30 = 45135b2f 2f0cc9c0
!	Mem[000000003180003a] = ec81cec3, %l3 = 271ce00000000000
	ldstuba	[%o3+0x03a]%asi,%l3	! %l3 = 00000000000000ce

p3_label_94:
!	%l3 = 00000000000000ce, immed = 0000003b, %l5 = 00000000f87018d7
	sllx	%l3,0x03b,%l5		! %l5 = 7000000000000000
	set	p3_b107,%o7
	fbge,a,pn %fcc1,p3_near_3_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001d800008] = d9d078800000005c, %l4 = 00000000103500c9
	ldxa	[%i3+%o6]0x80,%l4	! %l4 = d9d078800000005c
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x06b,%g2
p3_b107:
	membar	#Sync			! Added by membar checker (657)
!	%l0 = ffffffff80000000, %l1 = fffffffffffffff9, %l0 = ffffffff80000000
	addccc	%l0,%l1,%l0		! %l0 = ffffffff7ffffff9, %ccr = 93
!	Mem[000000001d000008] = 0000080e, %l5 = 7000000000000000
	ldsha	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000000

p3_label_95:
	set	p3_b108,%o7
	fbne,a,pt %fcc1,p3_near_3_le	! Branch Taken, %fcc1 = 2
!	Mem[000000001d8000cc] = eca1b220, %l1 = fffffffffffffff9
	ldsw	[%i3+0x0cc],%l1		! %l1 = ffffffffeca1b220
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x06c,%g2
p3_b108:
!	Registers modified during the branch to p3_near_3
!	%l2  = 000000007fffffff
!	%l3  = 000000000000005c
	membar	#Sync			! Added by membar checker (658)
!	%l5 = 0000000000000000, %l4 = d9d078800000005c, %l0 = ffffffff7ffffff9
	orcc	%l5,%l4,%l0		! %l0 = d9d078800000005c, %ccr = 80
!	%f0  = c9a68388, %f23 = 00000000
	fcmps	%fcc2,%f0 ,%f23		! %fcc2 = 1
!	%l0 = d9d078800000005c, immed = fffffa95, %y  = 0006cd7f
	smulcc	%l0,-0x56b,%l2		! %l2 = fffffffffffe0d8c, %ccr = 88

p3_label_96:
!	%f8  = 00000000 00000001, %f14 = ffffffff ffeb2f8f
	fxtod	%f8 ,%f14		! %f14 = 3ff00000 00000000
!	%f22 = 00000000 00000000, %f27 = d65cf1ac
	fdtoi	%f22,%f27		! %f27 = 00000000
!	Mem[000000001d800000] = 00000ccd, %l4 = d9d078800000005c
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000000000000, immed = 000003cc, %l3 = 000000000000005c
	orcc	%l5,0x3cc,%l3		! %l3 = 00000000000003cc, %ccr = 00
!	%f22 = 00000000 00000000, %f11 = bc23a8ed
	fxtos	%f22,%f11		! %f11 = 00000000

p3_label_97:
!	%l2 = fffffffffffe0d8c, %l0 = d9d078800000005c, %l0 = d9d078800000005c
	addc	%l2,%l0,%l0		! %l0 = d9d0787ffffe0de8
!	%l0 = fffe0de8, %l1 = eca1b220, Mem[000000001c000000] = e409c768 2d6da777
	stda	%l0,[%i0+%g0]0x80	! Mem[000000001c000000] = fffe0de8 eca1b220
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l3 = 00000000000003cc, Mem[000000001d8001e0] = c1872bc8
	stw	%l3,[%i3+0x1e0]		! Annulled
p3_b109:
	membar	#Sync			! Added by membar checker (659)
!	%f3  = 00000001, %f4  = ffeb2f8f
	fmovs	%f3 ,%f4 		! %f4  = 00000001

p3_label_98:
!	Jump to jmpl_1, CWP = 0
	set	p3_jmpl_1_he,%g1
	jmpl	%g1,%g6
!	Mem[000000001d800118] = 50b792fa, %l3 = 00000000000003cc
	swap	[%i3+0x118],%l3		! %l3 = 0000000050b792fa
!	Registers modified during the branch to p3_jmpl_1
!	%l6  = 00000000b885e573
!	%l7  = d9d0787ffffe0de8
	set	p3_b110,%o7
	fbule,pn %fcc2,p3_near_0_he	! Branch Taken, %fcc2 = 1
!	Mem[000000001c000008] = ef001b36, %l2 = fffffffffffe0d8c
	ldswa	[%i0+%o6]0x80,%l2	! %l2 = ffffffffef001b36
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x06e,%g2
p3_b110:
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_99:
!	Mem[000000001d0000e0] = e8775dd7 0f9f5f89 e7f7d6a9 e8299fab
	prefetch [%i2+0x0e0],21	! Annulled
p3_b111:
	membar	#Sync			! Added by membar checker (660)
!	Mem[0000000032000030] = 0f9bf9d5 0000032a, %l6 = b885e573, %l7 = fffe0de8
	ldda	[%o4+0x030]%asi,%g2	! %l6 = 00000000b885e573 d9d0787ffffe0de8
!	%l6 = 00000000b885e573, %l7 = d9d0787ffffe0de8, %l5 = 0000000000000000
	add	%l6,%l7,%l5		! %l5 = d9d07880b883f35b
!	%l6 = 00000000b885e573, Mem[000000001c800008] = 00000067
	stha	%l6,[%i1+%o6]0x80	! Mem[000000001c800008] = e5730067
!	Mem[000000001e800164] = c18ca900, %l6 = 00000000b885e573
	ldsha	[%i5+0x164]%asi,%l6	! %l6 = ffffffffffffc18c

p3_label_100:
!	Branch On Register, %l0 = d9d0787ffffe0de8
	brz,a,pt %l0,p3_not_taken_0	! Branch Not Taken
!	%l0 = fffe0de8, %l1 = eca1b220, Mem[000000001d800000] = ff000ccd 987d9ef1
	stda	%l0,[%i3+%g0]0x80	! Annulled
p3_b112:
	membar	#Sync			! Added by membar checker (661)
!	Mem[000000001d8001fc] = bc6fb866, %l4 = 0000000000000000
	swap	[%i3+0x1fc],%l4		! %l4 = 00000000bc6fb866
!	%f23 = 00000000, %f26 = 80000000 00000000
	fitod	%f23,%f26		! %f26 = 00000000 00000000
!	%l4 = 00000000bc6fb866, immed = 00000c41, %l7 = d9d0787ffffe0de8
	subc	%l4,0xc41,%l7		! %l7 = 00000000bc6fac25

p3_label_101:
!	Mem[000000001d0001c8] = 214011ac, %l0 = d9d0787ffffe0de8
	swap	[%i2+0x1c8],%l0		! %l0 = 00000000214011ac

	ba,a	p3_not_taken_0_end
p3_not_taken_0:
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba,a	p3_branch_failed
p3_not_taken_0_end:

!	%l7 = 00000000bc6fac25, immed = fffff9bf, %y  = ffffffff
	udivcc	%l7,-0x641,%l0		! %l0 = 00000000ffffffff, %ccr = 0a
!	Mem[000000001e800100] = 2271771d f356b927 b0c0d6c7 71988f08
	prefetch [%i5+0x100],22
!	Mem[000000001d0000e0] = e8775dd7 0f9f5f89 e7f7d6a9 e8299fab
	prefetcha [%i2+0x0e0]%asi,1
!	%l6 = ffffffffffffc18c, %l4 = 00000000bc6fb866, %l4 = 00000000bc6fb866
	andcc	%l6,%l4,%l4		! %l4 = 00000000bc6f8004, %ccr = 08

p3_label_102:
!	%l4 = 00000000bc6f8004, %l6 = ffffffffffffc18c, %l3 = 0000000050b792fa
	addccc	%l4,%l6,%l3		! %l3 = 00000000bc6f4190, %ccr = 19
!	%l5 = d9d07880b883f35b, %l0 = 00000000ffffffff, %l0 = 00000000ffffffff
	addc	%l5,%l0,%l0		! %l0 = d9d07881b883f35b
!	Branch On Register, %l2 = ffffffffef001b36
	brnz,pn	%l2,p3_b113		! Branch Taken
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetch [%o4+0x020],16
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x071,%g2
p3_b113:
	membar	#Sync			! Added by membar checker (662)
	fbul,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_103:
!	%l7 = 00000000bc6fac25, Mem[000000001c00005c] = ffbaa0af
	stw	%l7,[%i0+0x05c]		! Mem[000000001c00005c] = bc6fac25
p3_b114:
	bcs,a	p3_b115			! Branch Taken, %ccr = 19, CWP = 0
!	Mem[000000001c000000] = fffe0de8eca1b220, %l5 = d9d07880b883f35b
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = fffe0de8eca1b220
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x073,%g2
p3_b115:
	membar	#Sync			! Added by membar checker (663)
!	Mem[000000001d000000] = 0000005c00000067, %l5 = fffe0de8eca1b220
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 0000005c00000067
!	Mem[000000001c800174] = a44be492, %l7 = 00000000bc6fac25
	ldswa	[%i1+0x174]%asi,%l7	! %l7 = ffffffffa44be492

p3_label_104:
!	Mem[000000003180007c] = f87018d7, %l6 = ffffffffffffc18c
	swap	[%o3+0x07c],%l6		! %l6 = 00000000f87018d7
	set	p3_b116,%o7
	fbug,pn	%fcc0,p3_near_2_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001d000000] = 0000005c 00000067, %l6 = f87018d7, %l7 = a44be492
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 000000000000005c 0000000000000067
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x074,%g2
p3_b116:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000001b36
!	%l1  = 000000000000bc6f
!	%l4  = ffffffffeca1b73d
!	%l5  = 0000000000001b9b
!	%l6  = 00001451d346e230
	bg,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l7 = 0000000000000067, Mem[000000001d000000] = 0000005c
	stha	%l7,[%i2+%g0]0x80	! Annulled
p3_b117:

p3_label_105:
	membar	#Sync			! Added by membar checker (664)
	set	p3_b118,%o7
	fba,pt	%fcc1,p3_near_3_le	! Branch Taken, %fcc1 = 2
!	%l5 = 0000000000001b9b, Mem[0000000030800030] = fff5787c
	sth	%l5,[%o1+0x030]		! Mem[0000000030800030] = 1b9b787c
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x076,%g2
p3_b118:
!	Registers modified during the branch to p3_near_3
!	%l2  = 000000007fffffff
!	%l3  = 000000000001d943
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000032000060] = 00001b36 00000000 d3a59bed c4d847d0
	prefetch [%o4+0x060],1	! Annulled
p3_b119:
	bvs	p3_b120			! Branch Taken, %ccr = 02, CWP = 0

p3_label_106:
!	Mem[000000001c000008] = ef001b36, %l6 = 00001451d346e230
	ldswa	[%i0+%o6]0x80,%l6	! %l6 = ffffffffef001b36
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x078,%g2
p3_b120:
	membar	#Sync			! Added by membar checker (665)
!	%l0 = 0000000000001b36, Mem[000000001d8001b6] = 5efa64db
	sth	%l0,[%i3+0x1b6]		! Mem[000000001d8001b4] = 5efa1b36
!	Mem[000000001c000008] = ef001b36, %l6 = ffffffffef001b36
	lduwa	[%i0+%o6]0x80,%l6	! %l6 = 00000000ef001b36
!	%f26 = 00000000, %f6  = 32e28351 c9a68388
	fstox	%f26,%f6 		! %f6  = 00000000 00000000
!	%l0 = 0000000000001b36, immed = ffffffea, %l0 = 0000000000001b36
	xorcc	%l0,-0x016,%l0		! %l0 = ffffffffffffe4dc, %ccr = 88

p3_label_107:
!	%l6 = 00000000ef001b36
	setx	0x66ce164266ce1642,%g7,%l6 ! %l6 = 66ce164266ce1642
!	Mem[000000001c000040] = dbfc08f0 337d74ee
	flush	%i0+0x040
!	%f7  = 00000000, %f1  = 752f01ee
	fitos	%f7 ,%f1 		! %f1  = 00000000
!	%l0 = ffffffffffffe4dc, %l7 = 0000000000000067, %l3 = 000000000001d943
	or	%l0,%l7,%l3		! %l3 = ffffffffffffe4ff
!	%l3 = ffffffffffffe4ff, immed = fffff1da, %l4 = ffffffffeca1b73d
	and	%l3,-0xe26,%l4		! %l4 = ffffffffffffe0da

p3_label_108:
	set	p3_b121,%o7
	fbge	p3_far_2_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001d000008] = 0000080e, %l4 = ffffffffffffe0da
	swapa	[%i2+%o6]0x80,%l4	! %l4 = 000000000000080e
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x079,%g2
p3_b121:
!	Registers modified during the branch to p3_far_2
!	%l0  = 0000000000000ccd
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 000000000000ff00
!	%l5  = 0000938e76b3365a
	membar	#Sync			! Added by membar checker (666)
!	%l1 = 0000000000000000, %l7 = 0000000000000067, %l7 = 0000000000000067
	addcc	%l1,%l7,%l7		! %l7 = 0000000000000067, %ccr = 00
!	Mem[000000001d800088] = e5fe90aa, %l7 = 00000067, %l0 = 00000ccd
	add	%i3,0x88,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000e5fe90aa
	bne	p3_b122			! Branch Taken, %ccr = 00, CWP = 0

p3_label_109:
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],21
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x07a,%g2
p3_b122:
	membar	#Sync			! Added by membar checker (667)
!	%l0 = 00000000e5fe90aa, %l7 = 0000000000000067, %y  = 00001451
	umul	%l0,%l7,%l1		! %l1 = 0000005c896c3466
!	%l6 = 66ce164266ce1642
	sethi	%hi(0xd05cd800),%l6	! %l6 = 00000000d05cd800
!	Mem[000000001c8001ac] = d552b2aa, %l6 = d05cd800, %l6 = d05cd800
	add	%i1,0x1ac,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000d552b2aa
!	Mem[000000001d000008] = ffffe0da, %l4 = 000000000000080e
	lduha	[%i2+%o6]0x80,%l4	! %l4 = 000000000000ffff

p3_label_110:
	bcc	p3_b123			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c800000] = fffff067, %l3 = 000000000000ff00
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x07b,%g2
p3_b123:
	membar	#Sync			! Added by membar checker (668)
!	%l7 = 0000000000000067, Mem[0000000030800038] = 0f9bee1900000067
	stxa	%l7,[%o1+0x038]%asi	! Mem[0000000030800038] = 0000000000000067
!	%l1 = 0000005c896c3466, %l3 = ffffffffffffffff, %y  = 0000005c
	sdivx	%l1,%l3,%l4		! %l4 = ffffffa37693cb9a
!	%l6 = 00000000d552b2aa, %l3 = ffffffffffffffff, %y  = 0000005c
	udivcc	%l6,%l3,%l2		! %l2 = 000000000000005c, %ccr = 00

p3_label_111:
!	%l4 = ffffffa37693cb9a, %l2 = 000000000000005c, %y  = 0000005c
	udivx	%l4,%l2,%l2		! %l2 = 02c8590a1fe5c7c7
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetch [%o4+0x020],0
	set	p3_b124,%o7
	fblg	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	%l0 = 00000000e5fe90aa, Mem[000000001d800008] = d9d07880
	stba	%l0,[%i3+%o6]0x80	! Mem[000000001d800008] = aad07880
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x07c,%g2
p3_b124:
!	Registers modified during the branch to p3_far_1
!	%l0  = b885e57319e3e064
!	%l4  = fffffffff9d79a85
!	%l5  = 0000000c2d6da777
!	%l6  = 000000001ee6cb20
!	%l7  = 0000000c2d6da710
	membar	#Sync			! Added by membar checker (669)
!	Mem[000000001d800000] = ff000ccd, %l3 = ffffffffffffffff
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff000ccd

p3_label_112:
	bl	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d800180] = 9afd4c50 fdb15ab7 95c82b83 ec304854
	prefetch [%i3+0x180],20
p3_b125:
	membar	#Sync			! Added by membar checker (670)
!	Branch On Register, %l5 = 0000000c2d6da777
	brgz,a,pn %l5,p3_b126		! Branch Taken
!	Mem[000000001c000158] = 2c6109f4, %l3 = 00000000ff000ccd
	lduh	[%i0+0x15a],%l3		! %l3 = 00000000000009f4
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x07e,%g2
p3_b126:
	bvc	p3_b127			! Branch Taken, %ccr = 00, CWP = 0

p3_label_113:
!	Mem[000000001c800008] = e5730067, %l2 = 02c8590a1fe5c7c7
	lduha	[%i1+%o6]0x80,%l2	! %l2 = 000000000000e573
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x07f,%g2
p3_b127:
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d000000] = 0000005c, %l6 = 000000001ee6cb20
	ldsha	[%i2+%g0]0x80,%l6	! Annulled
p3_b128:
	membar	#Sync			! Added by membar checker (671)
!	%f30 = 45135b2f 2f0cc9c0, %f24 = 3ff00000 00000000, %f26 = 00000000 00000000
	fdivd	%f30,%f24,%f26		! %f26 = 45135b2f 2f0cc9c0
!	Mem[000000001d8001b8] = e9972bab 859e033c, %l0 = 19e3e064, %l1 = 896c3466
	ldda	[%i3+0x1b8]%asi,%l0	! %l0 = 00000000e9972bab 00000000859e033c

p3_label_114:
!	%l6 = 000000001ee6cb20, Mem[0000000030800034] = 9a9fd348
	sth	%l6,[%o1+0x034]		! Mem[0000000030800034] = cb20d348
!	%l5 = 0000000c2d6da777, %l3 = 00000000000009f4, %l1 = 00000000859e033c
	or	%l5,%l3,%l1		! %l1 = 0000000c2d6daff7
!	%l2 = 000000000000e573, immed = 000008d2, %l3 = 00000000000009f4
	orncc	%l2,0x8d2,%l3		! %l3 = fffffffffffff77f, %ccr = 88
!	Mem[000000001d800008] = aad07880, %l5 = 0000000c2d6da777
	ldsha	[%i3+%o6]0x80,%l5	! %l5 = ffffffffffffaad0
	set	p3_b129,%o7
	fblg,a,pn %fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 2

p3_label_115:
!	Mem[000000001d80001c] = 2390eeb0, %l6 = 000000001ee6cb20
	ldub	[%i3+0x01d],%l6		! %l6 = 0000000000000090
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x081,%g2
p3_b129:
!	Registers modified during the branch to p3_near_1
!	%l0  = 0000000000000300
!	%l5  = ffffffff9d7a8590
!	%l7  = 0000004800000000
!	Jump to jmpl_1, CWP = 0
	set	p3_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	%l3 = fffffffffffff77f, Mem[0000000031000030] = ffffffff
	stb	%l3,[%o2+0x030]		! Mem[0000000031000030] = 7fffffff
!	Registers modified during the branch to p3_jmpl_1
!	%l1  = 46ace8ed30254b48
!	%l2  = 00000047fffffd00
!	%l3  = 000000000000007f
!	%l4  = 000000480000071a
!	%l5  = 0000000000000050
	membar	#Sync			! Added by membar checker (672)
!	%l6 = 0000000000000090, Mem[000000001c800176] = a44be492
	stba	%l6,[%i1+0x176]%asi	! Mem[000000001c800174] = a44b9092
!	Mem[000000001c00007c] = 35bcacda, %l5 = 0000000000000050
	ldsba	[%i0+0x07d]%asi,%l5	! %l5 = ffffffffffffffbc

p3_label_116:
!	%l4 = 000000480000071a, immed = fffff85b, %l6 = 0000000000000090
	subccc	%l4,-0x7a5,%l6		! %l6 = 0000004800000ebe, %ccr = 11
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[000000001d000008] = ffffe0da, %l4 = 000000480000071a
	ldstuba	[%i2+%o6]0x80,%l4	! %l4 = 00000000000000ff
p3_b130:
	membar	#Sync			! Added by membar checker (673)
!	%l0 = 00000300, %l1 = 30254b48, Mem[000000001d000000] = 0000005c 00000067
	stda	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = 00000300 30254b48
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b70095 a4685005
	prefetch [%o4+0x000],0

p3_label_117:
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[000000001c000000] = fffe0de8, %l6 = 0000004800000ebe
	lduwa	[%i0+%g0]0x80,%l6	! Annulled
p3_b131:
	membar	#Sync			! Added by membar checker (674)
!	Mem[000000001c0001cc] = 0123ce29, %l5 = ffffffffffffffbc
	lduwa	[%i0+0x1cc]%asi,%l5	! %l5 = 000000000123ce29
!	%l7 = 0000004800000000, %l7 = 0000004800000000, %l5 = 000000000123ce29
	orn	%l7,%l7,%l5		! %l5 = ffffffffffffffff
!	%l6 = 0000004800000ebe, %l0 = 0000000000000300, %l0 = 0000000000000300
	addc	%l6,%l0,%l0		! %l0 = 00000048000011bf

p3_label_118:
!	%l6 = 0000004800000ebe, immed = 00000012, %l0 = 00000048000011bf
	srax	%l6,0x012,%l0		! %l0 = 0000000000120000
!	%l4 = 000000ff, %l5 = ffffffff, Mem[000000001c0001b8] = 860a93ab eda7ffd2
	stda	%l4,[%i0+0x1b8]%asi	! Mem[000000001c0001b8] = 000000ff ffffffff
!	Mem[000000001d000160] = 898566a9, %l5 = ffffffffffffffff
	ldsba	[%i2+0x162]%asi,%l5	! %l5 = 0000000000000066
!	Mem[0000000031000038] = 000000ff0075fbc4, %l0 = 0000000000120000
	ldx	[%o2+0x038],%l0		! %l0 = 000000ff0075fbc4
!	%l5 = 0000000000000066, %l2 = 00000047fffffd00, %y  = 0000005c
	smulcc	%l5,%l2,%l3		! %l3 = fffffffffffece00, %ccr = 88

p3_label_119:
!	Mem[000000001d800000] = ff000ccd, %l7 = 0000004800000000
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = fffffffffffece00, Mem[000000001c000068] = 4655de92
	stb	%l3,[%i0+0x068]		! Mem[000000001c000068] = 0055de92
!	%l4 = 000000ff, %l5 = 00000066, Mem[000000001d8000b8] = 2c87536d 58757e0c
	std	%l4,[%i3+0x0b8]	! Mem[000000001d8000b8] = 000000ff 00000066
!	%f14 = 3ff00000 00000000, %f1  = 00000000
	fdtoi	%f14,%f1 		! %f1  = 00000001
!	%l4 = 00000000000000ff, Mem[0000000031000038] = 000000ff0075fbc4
	stx	%l4,[%o2+0x038]		! Mem[0000000031000038] = 00000000000000ff

p3_label_120:
!	%l3 = fffffffffffece00, immed = 000009f0, %l7 = 00000000000000ff
	andcc	%l3,0x9f0,%l7		! %l7 = 0000000000000800, %ccr = 00
!	Mem[000000001d800000] = ff000ccd987d9ef1, %l2 = 00000047fffffd00
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = ff000ccd987d9ef1
!	Mem[000000001c000000] = fffe0de8, %l3 = fffffffffffece00
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 000000000000fffe
!	%l3 = 000000000000fffe, %l5 = 0000000000000066, %y  = ffffffff
	sdiv	%l3,%l5,%l6		! %l6 = fffffffffd7d8000
!	%l3 = 000000000000fffe, immed = 00000553, %l0 = 000000ff0075fbc4
	xor	%l3,0x553,%l0		! %l0 = 000000000000faad

p3_label_121:
!	%l6 = fd7d8000, %l7 = 00000800, Mem[000000001c800028] = 266c8478 d3c2533f
	std	%l6,[%i1+0x028]	! Mem[000000001c800028] = fd7d8000 00000800
!	%f10 = 3f800000 00000000, %f6  = 00000000
	fdtos	%f10,%f6 		! %f6  = 3c000000
!	call to call_1, CWP = 0
	call	p3_call_1_he
!	Mem[0000000031800070] = 648b20ff, %l1 = 46ace8ed30254b48
	lduh	[%o3+0x072],%l1		! %l1 = 00000000000020ff
!	Registers modified during the branch to p3_call_1
!	%l7  = 0000000002827f99
!	%l0 = 000000000000faad, %l6 = fffffffffd7d8000, %l3 = 000000000000fffe
	or	%l0,%l6,%l3		! %l3 = fffffffffd7dfaad

p3_label_122:
	set	p3_b132,%o7
	fbne	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	%l6 = fffffffffd7d8000, Mem[0000000030800078] = 00000047fffffd00
	stx	%l6,[%o1+0x078]		! Mem[0000000030800078] = fffffffffd7d8000
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x084,%g2
p3_b132:
!	Registers modified during the branch to p3_far_2
!	%l1  = ffffffffffff2652
!	%l2  = 0000000002827001
!	%l3  = 0000000000000000
!	%l5  = 0000000000001426
	membar	#Sync			! Added by membar checker (675)
!	Mem[000000001c8001e0] = f907ace6 ff8734d6
	flush	%i1+0x1e0
!	%f2  = 00000000 00000001, %f4  = 00000001 752f01ee
	fxtod	%f2 ,%f4 		! %f4  = 3ff00000 00000000
!	%l5 = 0000000000001426, %l6 = fffffffffd7d8000, %y  = ffffffff
	umulcc	%l5,%l6,%l3		! %l3 = 000013f36ea10000, %ccr = 00

p3_label_123:
	fbl,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d000000] = 00000300, %l7 = 0000000002827f99
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
p3_b133:
	membar	#Sync			! Added by membar checker (676)
!	Mem[000000001d0001c0] = 1dfd8d1d c279e24e fffe0de8 f78974fa
	prefetcha [%i2+0x1c0]%asi,20
!	Mem[000000001c000008] = ef001b36, %l2 = 0000000002827001
	lduwa	[%i0+%o6]0x80,%l2	! %l2 = 00000000ef001b36
	set	p3_b134,%o7
	fba,pn	%fcc2,p3_near_0_he	! Branch Taken, %fcc2 = 1

p3_label_124:
!	Mem[000000001c00006c] = e64caabc, %l7 = 0000000000000000
	lduw	[%i0+0x06c],%l7		! %l7 = 00000000e64caabc
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x086,%g2
p3_b134:
	membar	#Sync			! Added by membar checker (677)
!	Mem[0000000030000034] = 3670811e, %l6 = fd7d8000, %l5 = 00001426
	add	%o0,0x34,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 000000003670811e
	bl	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c000008] = ef001b3600000000, %l4 = 00000000000000ff
	ldxa	[%i0+%o6]0x80,%l4	! %l4 = ef001b3600000000
p3_b135:
	membar	#Sync			! Added by membar checker (678)
!	%l5 = 000000003670811e, immed = fffff1fc, %y  = 000013f3
	umul	%l5,-0xe04,%l7		! %l7 = 36707e22ff2e5788

p3_label_125:
!	Mem[000000001d000008] = ffffe0da 0075fbc4, %l2 = ef001b36, %l3 = 6ea10000
	ldda	[%i2+%o6]0x80,%l2	! %l2 = 00000000ffffe0da 000000000075fbc4
!	%l0 = 000000000000faad
	setx	0x8a1c3e5d8a1c3e5d,%g7,%l0 ! %l0 = 8a1c3e5d8a1c3e5d
!	Mem[000000001f00000c] = 09b2d8ac, %l4 = ef001b3600000000
	lduwa	[%i6+0x00c]%asi,%l4	! %l4 = 0000000009b2d8ac
	set	p3_b136,%o7
	fbo,pt	%fcc2,p3_near_3_le	! Branch Taken, %fcc2 = 1
!	Mem[000000003000003a] = 0000faad, %l4 = 0000000009b2d8ac
	ldstub	[%o0+0x03a],%l4		! %l4 = 00000000000000fa
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x088,%g2
p3_b136:
!	Registers modified during the branch to p3_near_3
!	%l2  = 000000007fffffff
!	%l3  = 0000000000000000

p3_label_126:
	membar	#Sync			! Added by membar checker (679)
!	Branch On Register, %l6 = fffffffffd7d8000
	brnz,pn	%l6,p3_b137		! Branch Taken
!	Mem[0000000031800030] = 530284a5, %l3 = 0000000000000000
	lduw	[%o3+0x030],%l3		! %l3 = 00000000530284a5
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x089,%g2
p3_b137:
	membar	#Sync			! Added by membar checker (680)
!	Mem[0000000030000039] = 0000ffad, %l4 = 00000000000000fa
	ldstuba	[%o0+0x039]%asi,%l4	! %l4 = 0000000000000000
!	%l5 = 000000003670811e, immed = fffff8e5, %l4 = 0000000000000000
	sub	%l5,-0x71b,%l4		! %l4 = 0000000036708839
	set	p3_b138,%o7
	fbo,pt	%fcc2,p3_near_2_le	! Branch Taken, %fcc2 = 1

p3_label_127:
!	Mem[0000000031800036] = 00000ccd, %l3 = 00000000530284a5
	ldstub	[%o3+0x036],%l3		! %l3 = 000000000000000c
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x08a,%g2
p3_b138:
!	Registers modified during the branch to p3_near_2
!	%l0  = 000000007d7d8000
	membar	#Sync			! Added by membar checker (681)
!	Mem[0000000031800078] = 7693cb9a76b3365a, %l0 = 000000007d7d8000
	ldxa	[%o3+0x078]%asi,%l0	! %l0 = 7693cb9a76b3365a
!	%l3 = 000000000000000c, Mem[000000001d0001b0] = 1e2b74ea
	sth	%l3,[%i2+0x1b0]		! Mem[000000001d0001b0] = 000c74ea
	set	p3_b139,%o7
	fbug,a,pn %fcc0,p3_near_3_le	! Branch Taken, %fcc0 = 2
!	%l6 = fffffffffd7d8000, Mem[0000000031800070] = 648b20ff2e148b8e
	stx	%l6,[%o3+0x070]		! Mem[0000000031800070] = fffffffffd7d8000
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x08b,%g2
p3_b139:
!	Registers modified during the branch to p3_near_3
!	%l2  = 000000007fffffff
!	%l3  = 0000000000000d9c

p3_label_128:
	membar	#Sync			! Added by membar checker (682)
!	%f2  = 00000000 00000001, %f3  = 00000001
	fxtos	%f2 ,%f3 		! %f3  = 3f800000
!	Mem[000000001c000000] = fffe0de8, %l1 = ffffffffffff2652
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000001c0000a0] = 35561378, %l0 = 7693cb9a76b3365a
	swapa	[%i0+0x0a0]%asi,%l0	! %l0 = 0000000035561378
	bne	p3_b140			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[000000001d000008] = ffffe0da, %l1 = 00000000000000ff
	ldstuba	[%i2+%o6]0x80,%l1	! %l1 = 00000000000000ff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x08c,%g2
p3_b140:

p3_label_129:
	set	p3_b141,%o7
	fbuge	p3_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[000000004000003c] = 0001080e, %l5 = 000000003670811e
	ldub	[%o5+0x03c],%l5		! %l5 = 0000000000000000
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x08d,%g2
p3_b141:
!	Registers modified during the branch to p3_far_0
!	%l5  = 7f972bc300d1a878
!	%l6  = 000002d5df70f520
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c8000a0] = 140c2965 13ff1d0c, %l2 = 7fffffff, %l3 = 00000d9c
	ldd	[%i1+0x0a0],%l2		! %l2 = 00000000140c2965 0000000013ff1d0c
p3_b142:
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 02

p3_label_130:
!	Mem[000000001e000008] = 6eb3806a, %l1 = 00000000000000ff
	lduwa	[%i4+%o6]0x80,%l1	! %l1 = 000000006eb3806a
p3_b143:
	membar	#Sync			! Added by membar checker (683)
!	Mem[000000001d0001f0] = 6441057b, %l1 = 000000006eb3806a
	ldsw	[%i2+0x1f0],%l1		! %l1 = 000000006441057b
!	%f24 = 3ff00000 00000000, %f26 = 45135b2f
	fdtoi	%f24,%f26		! %f26 = 00000001
	set	p3_b144,%o7
	fbg	p3_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001c0001e0] = 2fa4adbf e70ff2ea 768d1280 0b7ac1b5
	prefetch [%i0+0x1e0],16
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x090,%g2
p3_b144:
!	Registers modified during the branch to p3_far_3
!	%l3  = 01b38441c8000000
!	%l4  = fe4c7bbe6d561378
!	%l7  = 01b384422c41057c

p3_label_131:
	membar	#Sync			! Added by membar checker (684)
!	Mem[000000001d0000c0] = 16521172 541e77c9 06bff06b ff8fd04a
	prefetcha [%i2+0x0c0]%asi,21
!	%f24 = 3ff00000 00000000, %f12 = 32e28351 c9a68388, %f24 = 3ff00000 00000000
	fmuld	%f24,%f12,%f24		! %f24 = 32e28351 c9a68388
!	%l1 = 000000006441057b, Mem[0000000030800034] = cb20d348
	sth	%l1,[%o1+0x034]		! Mem[0000000030800034] = 057bd348
!	Branch On Register, %l4 = fe4c7bbe6d561378
	brlez,a,pt %l4,p3_b145		! Branch Taken
!	Mem[000000001d000078] = a04af9aa, %l1 = 000000006441057b
	ldsb	[%i2+0x078],%l1		! %l1 = ffffffffffffffa0
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x091,%g2
p3_b145:

p3_label_132:
	membar	#Sync			! Added by membar checker (685)
!	Mem[000000001d000000] = 0000030030254b48, %l3 = 01b38441c8000000
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = 0000030030254b48
!	%l6 = 000002d5df70f520, immed = fffff364, %l1 = ffffffffffffffa0
	subc	%l6,-0xc9c,%l1		! %l1 = 000002d5df7101bb
!	Mem[0000000031000030] = 7fffffff, %l4 = fe4c7bbe6d561378
	ldsh	[%o2+0x030],%l4		! %l4 = 0000000000007fff
!	%l7 = 01b384422c41057c, %l0 = 0000000035561378, %y  = 7f972bc3
	smul	%l7,%l0,%l5		! %l5 = 09385758158ac620
!	%f12 = 32e28351 c9a68388, %f16 = 32e28351 6d93ff4b
	fcmpd	%fcc3,%f12,%f16		! %fcc3 = 2

p3_label_133:
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b70095 a4685005
	prefetcha [%o4+0x000]%asi,20
!	%l0 = 0000000035561378, %l2 = 00000000140c2965, %l3 = 0000030030254b48
	srax	%l0,%l2,%l3		! %l3 = 0000000000000000
!	%f13 = c9a68388, %f25 = c9a68388
	fstoi	%f13,%f25		! %f25 = ffeb2f8f
!	Branch On Register, %l0 = 0000000035561378
	brlz,pn	%l0,p3_not_taken_0	! Branch Not Taken
!	Mem[0000000031000030] = 7fffffff, %l7 = 01b384422c41057c
	ldsw	[%o2+0x030],%l7		! %l7 = 000000007fffffff
p3_b146:

p3_label_134:
	membar	#Sync			! Added by membar checker (686)
!	Mem[000000001c800008] = e5730067, %l3 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l3	! %l3 = ffffffffe5730067
!	%f20 = b2e28351, %f8  = 00000000, %f25 = ffeb2f8f
	fadds	%f20,%f8 ,%f25		! %f25 = b2e28351
!	Mem[000000001c000080] = 74347eff 865a0a08 58c32631 c85fab1b
	prefetcha [%i0+0x080]%asi,0
!	%f16 = 32e28351 6d93ff4b, %f20 = b2e28351 00000000
	fnegd	%f16,%f20		! %f20 = b2e28351 6d93ff4b
!	%l7 = 000000007fffffff, %l0 = 0000000035561378, %l0 = 0000000035561378
	addc	%l7,%l0,%l0		! %l0 = 00000000b5561378

p3_label_135:
	set	p3_b147,%o7
	fblg,a	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000030000078] = 0f9bee191d541982, %l4 = 0000000000007fff
	ldx	[%o0+0x078],%l4		! %l4 = 0f9bee191d541982
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x093,%g2
p3_b147:
!	Registers modified during the branch to p3_far_2
!	%l1  = 000002d52a1aee43
!	%l2  = 000000007ffff067
!	%l3  = 000000002d5584de
!	%l5  = 0000000000001426
	membar	#Sync			! Added by membar checker (687)
	fbu,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000001d800080] = 7a0d5b9e a12da434 e5fe90aa 70449daa
	prefetch [%i3+0x080],22
p3_b148:
	fbule,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_136:
!	Mem[000000001c8001a0] = af3f4017 6b8a79aa ace15e24 d552b2aa
	prefetch [%i1+0x1a0],0	! Annulled
p3_b149:
	membar	#Sync			! Added by membar checker (688)
	set	p3_b150,%o7
	fbge,pt	%fcc1,p3_near_1_le	! Branch Taken, %fcc1 = 2
!	Mem[000000001d0000a0] = ddc5f9e2 67eab1f9 a26cc3e8 56eff1a4
	prefetch [%i2+0x0a0],16
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x096,%g2
p3_b150:
!	Registers modified during the branch to p3_near_1
!	%l1  = 018436af9682fd7e
!	%l6  = 00000000093857aa
!	%l7  = 0000000000000800
	set	p3_b151,%o7
	fbuge,a	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001c800000] = fffff067 000000ff e5730067 f654389e
	prefetch [%i1+0x000],4
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x097,%g2
p3_b151:
!	Registers modified during the branch to p3_far_2
!	%l1  = 018436aee12cea06
!	%l2  = fffffffffffff868
!	%l3  = 000000002d5584de
!	%l5  = 0000000000001426

p3_label_137:
	ba,a	p3_b152			! Branch Taken, %ccr = 08, CWP = 0
!	%l6 = 00000000093857aa, Mem[0000000030000070] = 00000000
	sth	%l6,[%o0+0x070]		! Annulled
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x098,%g2
p3_b152:
	membar	#Sync			! Added by membar checker (689)
!	Mem[000000003000007c] = 1d541982, %l6 = 093857aa, %l3 = 2d5584de
	add	%o0,0x7c,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 000000001d541982
!	%l4 = 0f9bee191d541982, immed = fffff304, %l3 = 000000001d541982
	subc	%l4,-0xcfc,%l3		! %l3 = 0f9bee191d54267e
!	%f6  = 3c000000 00000000, %f30 = 45135b2f 2f0cc9c0
	fcmped	%fcc1,%f6 ,%f30		! %fcc1 = 1

p3_label_138:
!	Mem[000000001c8001f0] = 9c31159d, %l6 = 00000000093857aa
	ldstuba	[%i1+0x1f0]%asi,%l6	! %l6 = 000000000000009c
!	%f10 = 3f800000, %f14 = 3ff00000
	fstoi	%f10,%f14		! %f14 = 00000001
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000030800074] = 00000067, %l7 = 0000000000000800
	swap	[%o1+0x074],%l7		! Annulled
p3_b153:
	bcc	p3_b154			! Branch Taken, %ccr = 08, CWP = 0

p3_label_139:
!	Mem[000000001d000060] = 6ec9aac0 9602952f de50fbf9 6f4838ff
	prefetch [%i2+0x060],3
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x09a,%g2
p3_b154:
	membar	#Sync			! Added by membar checker (690)
!	%f12 = 32e28351 c9a68388, %f24 = 32e28351 b2e28351
	fabsd	%f12,%f24		! %f24 = 32e28351 c9a68388
!	%l6 = 0000009c, %l7 = 00000800, Mem[0000000031800038] = ec81ffc3 a7fa5e48
	stda	%l6,[%o3+0x038]%asi	! Mem[0000000031800038] = 0000009c 00000800
!	%f10 = 3f800000, %f21 = 6d93ff4b
	fabss	%f10,%f21		! %f21 = 3f800000
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 08

p3_label_140:
!	Mem[000000001c800000] = fffff067, %l7 = 0000000000000800
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
p3_b155:
	membar	#Sync			! Added by membar checker (691)
!	%f21 = 3f800000, %f2  = 00000000
	fstoi	%f21,%f2 		! %f2  = 00000001
!	%f17 = 6d93ff4b, %f11 = 00000000
	fnegs	%f17,%f11		! %f11 = ed93ff4b
!	%l1 = 018436aee12cea06, %l1 = 018436aee12cea06, %l2 = fffffffffffff868
	andcc	%l1,%l1,%l2		! %l2 = 018436aee12cea06, %ccr = 08
!	Mem[000000001c8000d0] = 49792b1b 4e593acb, %l4 = 1d541982, %l5 = 00001426
	ldd	[%i1+0x0d0],%l4		! %l4 = 0000000049792b1b 000000004e593acb

p3_label_141:
!	Mem[0000000032000024] = dbe0a62d, %l6 = 000000000000009c
	lduha	[%o4+0x024]%asi,%g2	! %g2 = 000000000000dbe0
!	Mem[0000000030000078] = 0f9bee19, %l6 = 000000000000009c
	lduwa	[%o0+0x078]%asi,%l6	! %l6 = 000000000f9bee19
!	%l4 = 0000000049792b1b, immed = 00000038, %l1 = 018436aee12cea06
	sllx	%l4,0x038,%l1		! %l1 = 1b00000000000000
	fbue,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001d8001e0] = c1872bc8 5957621c a767b88d 06543d1e
	prefetch [%i3+0x1e0],0	! Annulled
p3_b156:

p3_label_142:
	set	p3_b157,%o7
	fbne,a	p3_far_3_he	! Branch Taken, %fcc0 = 2
!	%l5 = 000000004e593acb, Mem[000000001d000008] = ffffe0da
	stwa	%l5,[%i2+%o6]0x80	! Mem[000000001d000008] = 4e593acb
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x09d,%g2
p3_b157:
!	Registers modified during the branch to p3_far_3
!	%l2  = 00000000000000ff
!	%l3  = 0000000000000000
!	%l4  = 04c6f357194877d3
!	%l5  = ffffffffffffff00
!	%l7  = fffffffffffff95d
	membar	#Sync			! Added by membar checker (692)
!	Mem[000000001d000118] = 8936c76b 0c725f30, %l6 = 0f9bee19, %l7 = fffff95d
	ldd	[%i2+0x118],%l6		! %l6 = 000000008936c76b 000000000c725f30
!	%l6 = 000000008936c76b, Mem[000000001c000008] = ef001b36
	stha	%l6,[%i0+%o6]0x80	! Mem[000000001c000008] = c76b1b36
!	%f10 = 3f800000, %f21 = 3f800000
	fstoi	%f10,%f21		! %f21 = 00000001

p3_label_143:
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d000000] = 00000300, %l4 = 04c6f357194877d3
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
p3_b158:
	membar	#Sync			! Added by membar checker (693)
	nop
!	Mem[000000001d000008] = 4e593acb, %l2 = 00000000000000ff
	swapa	[%i2+%o6]0x80,%l2	! %l2 = 000000004e593acb
!	%l0 = 00000000b5561378, %l4 = 0000000000000000, %l6 = 000000008936c76b
	orncc	%l0,%l4,%l6		! %l6 = ffffffffffffffff, %ccr = 88

p3_label_144:
	set	p3_b159,%o7
	fba,pn	%fcc0,p3_near_2_he	! Branch Taken, %fcc0 = 2
!	%l4 = 0000000000000000, Mem[000000001d800000] = ff000ccd987d9ef1
	stxa	%l4,[%i3+%g0]0x80	! Mem[000000001d800000] = 0000000000000000
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x09f,%g2
p3_b159:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000001b36
!	%l1  = 0000000000000000
!	%l4  = 1b0000000000051d
!	%l5  = 0000000000001b9b
!	%l6  = 0000000000000000
	bcc,a	p3_b160			! Branch Taken, %ccr = 44, CWP = 0
!	%l2 = 000000004e593acb, Mem[000000001c800000] = fffff067
	stwa	%l2,[%i1+%g0]0x80	! Mem[000000001c800000] = 4e593acb
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0a0,%g2
p3_b160:
	membar	#Sync			! Added by membar checker (694)
!	%f13 = c9a68388, %f19 = 00000000
	fstoi	%f13,%f19		! %f19 = ffeb2f8f

p3_label_145:
!	%l7 = 000000000c725f30, %l6 = 0000000000000000, %l6 = 0000000000000000
	xnorcc	%l7,%l6,%l6		! %l6 = fffffffff38da0cf, %ccr = 88
!	%f19 = ffeb2f8f, %f22 = 00000000 00000000
	fitod	%f19,%f22		! %f22 = c134d071 00000000
	nop
!	%l4 = 1b0000000000051d, %l1 = 0000000000000000, %l1 = 0000000000000000
	andcc	%l4,%l1,%l1		! %l1 = 0000000000000000, %ccr = 44
	set	p3_b161,%o7
	fba,a,pt %fcc3,p3_near_1_he	! Branch Taken, %fcc3 = 2

p3_label_146:
!	%l2 = 000000004e593acb, Mem[0000000031000039] = 00000000
	stb	%l2,[%o2+0x039]		! Annulled
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x0a1,%g2
p3_b161:
!	Registers modified during the branch to p3_near_1
!	%l0  = fffffffff38da33f
!	%l5  = b000000000012f10
!	%l7  = f9c6d06780000000
	membar	#Sync			! Added by membar checker (695)
!	%l0 = fffffffff38da33f, Mem[0000000030800030] = 1b9b787c057bd348
	stxa	%l0,[%o1+0x030]%asi	! Mem[0000000030800030] = fffffffff38da33f
!	%f5  = 00000000, %f30 = 45135b2f, %f8  = 00000000
	fdivs	%f5 ,%f30,%f8 		! %f8  = 00000000
!	%l0 = fffffffff38da33f, Mem[000000001c800000] = 4e593acb
	stba	%l0,[%i1+%g0]0x80	! Mem[000000001c800000] = 3f593acb
!	%l1 = 0000000000000000, %l6 = fffffffff38da0cf, %y  = 00000000
	udivcc	%l1,%l6,%l0		! %l0 = 0000000000000000, %ccr = 44

p3_label_147:
	set	p3_b162,%o7
	fbne,pn	%fcc3,p3_near_2_le	! Branch Taken, %fcc3 = 2
!	Mem[000000001c800008] = e5730067, %l6 = fffffffff38da0cf
	ldsba	[%i1+%o6]0x80,%l6	! %l6 = ffffffffffffffe5
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0a2,%g2
p3_b162:
!	Registers modified during the branch to p3_near_2
!	%l0  = 000000004e593ac1
	membar	#Sync			! Added by membar checker (696)
!	Mem[0000000032000060] = 00001b36 00000000 d3a59bed c4d847d0
	prefetch [%o4+0x060],4
	set	p3_b163,%o7
	fbl,a,pt %fcc2,p3_near_1_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetch [%o4+0x020],3
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0a3,%g2
p3_b163:
!	Registers modified during the branch to p3_near_1
!	%l0  = 0000000000000255
!	%l5  = b000000000012f10
!	%l7  = fffffff280000000

p3_label_148:
	membar	#Sync			! Added by membar checker (697)
	set	p3_b164,%o7
	fblg,pt	%fcc2,p3_near_3_he	! Branch Taken, %fcc2 = 1
!	%l1 = 0000000000000000, Mem[000000001c800008] = e5730067
	stha	%l1,[%i1+%o6]0x80	! Mem[000000001c800008] = 00000067
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x0a4,%g2
p3_b164:
	membar	#Sync			! Added by membar checker (698)
!	Mem[0000000030800074] = 00000067, %l6 = ffffffffffffffe5
	lduwa	[%o1+0x074]%asi,%l6	! %l6 = 0000000000000067
!	%l0 = 00000255, %l1 = 00000000, Mem[0000000032000030] = 0f9bf9d5 0000032a
	std	%l0,[%o4+0x030]	! Mem[0000000032000030] = 00000255 00000000
!	Mem[000000003080007c] = fd7d8000, %l3 = 0000000000000000
	lduha	[%o1+0x07c]%asi,%l3	! %l3 = 000000000000fd7d

p3_label_149:
!	Mem[0000000030000030] = 1b36e5d43670811e, %l5 = b000000000012f10
	ldx	[%o0+0x030],%l5		! %l5 = 1b36e5d43670811e
!	%l3 = 000000000000fd7d, Mem[000000001c800008] = 00000067f654389e
	stxa	%l3,[%i1+%o6]0x80	! Mem[000000001c800008] = 000000000000fd7d
	set	p3_b165,%o7
	fbne,pt	%fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 1
!	Mem[000000001c800000] = 3f593acb, %l2 = 000000004e593acb
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000003f59
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x0a5,%g2
p3_b165:
!	Registers modified during the branch to p3_near_1
!	%l0  = 00000000000002d7
!	%l5  = b000000000012f10
!	%l7  = 0000003380000000
	membar	#Sync			! Added by membar checker (699)
!	Mem[000000003000007c] = 1d541982, %l1 = 0000000000000000
	lduh	[%o0+0x07c],%l1		! %l1 = 0000000000001d54

p3_label_150:
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c000000] = fffe0de8, %l7 = 0000003380000000
	swapa	[%i0+%g0]0x80,%l7	! Annulled
p3_b166:
	membar	#Sync			! Added by membar checker (700)
!	%l6 = 0000000000000067, %l4 = 1b0000000000051d, %y  = 00000000
	smulcc	%l6,%l4,%l5		! %l5 = 0000000000020eab, %ccr = 00
!	Mem[000000001d000180] = 235b7832 84ad917d 00000000 00000d9c
	prefetch [%i2+0x180],20
	bgu,a	p3_b167			! Branch Taken, %ccr = 00, CWP = 0

p3_label_151:
!	%l5 = 0000000000020eab, Mem[0000000031800038] = 0000009c00000800
	stx	%l5,[%o3+0x038]		! Mem[0000000031800038] = 0000000000020eab
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x0a7,%g2
p3_b167:
	membar	#Sync			! Added by membar checker (701)
!	Mem[000000001c800008] = 00000000, %l2 = 0000000000003f59
	swapa	[%i1+%o6]0x80,%l2	! %l2 = 0000000000000000
!	Mem[000000001d000008] = 000000ff, %l5 = 0000000000020eab
	lduwa	[%i2+%o6]0x80,%l5	! %l5 = 00000000000000ff
!	%f22 = c134d071 00000000, %f4  = 3ff00000
	fdtos	%f22,%f4 		! %f4  = c9a68388
!	%l4 = 1b0000000000051d, %l0 = 00000000000002d7, %l0 = 00000000000002d7
	addc	%l4,%l0,%l0		! %l0 = 1b000000000007f4

p3_label_152:
!	%l4 = 0000051d, %l5 = 000000ff, Mem[0000000030000038] = b5561378 9682fd7e
	std	%l4,[%o0+0x038]	! Mem[0000000030000038] = 0000051d 000000ff
!	%f24 = 32e28351, %f10 = 3f800000, %f12 = 32e28351
	fdivs	%f24,%f10,%f12		! %f12 = 32e28351
!	%l0 = 1b000000000007f4, %l1 = 0000000000001d54, %l0 = 1b000000000007f4
	add	%l0,%l1,%l0		! %l0 = 1b00000000002548
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c800008] = 00003f59, %l3 = 000000000000fd7d
	lduha	[%i1+%o6]0x80,%l3	! Annulled
p3_b168:

p3_label_153:
	membar	#Sync			! Added by membar checker (702)
!	%l4 = 1b0000000000051d, Mem[000000001c800000] = 3f593acb000000ff
	stxa	%l4,[%i1+%g0]0x80	! Mem[000000001c800000] = 1b0000000000051d
!	%l2 = 0000000000000000, Mem[000000001d000000] = 0000030030254b48
	stxa	%l2,[%i2+%g0]0x80	! Mem[000000001d000000] = 0000000000000000
	fbue,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c800000] = 1b000000, %l1 = 0000000000001d54
	lduha	[%i1+%g0]0x80,%l1	! Annulled
p3_b169:
	membar	#Sync			! Added by membar checker (703)
!	Mem[000000001e800000] = d89d74c1 ee3b3bc6 4308f544 0b908ac4
	prefetcha [%i5+0x000]%asi,21

p3_label_154:
	ba,a	p3_b170			! Branch Taken, %ccr = 00, CWP = 0
!	%l5 = 00000000000000ff, Mem[000000001c800000] = 1b0000000000051d
	stxa	%l5,[%i1+%g0]0x80	! Annulled
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0aa,%g2
p3_b170:
	membar	#Sync			! Added by membar checker (704)
	fbu,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetch [%o4+0x020],16
p3_b171:
	membar	#Sync			! Added by membar checker (705)
!	%l3 = 000000000000fd7d, immed = fffff2cd, %l2 = 0000000000000000
	subc	%l3,-0xd33,%l2		! %l2 = 0000000000010ab0

p3_label_155:
!	Mem[000000001c000008] = c76b1b36, %l1 = 0000000000001d54
	ldstuba	[%i0+%o6]0x80,%l1	! %l1 = 00000000000000c7
!	Branch On Register, %l1 = 00000000000000c7
	brgz,a,pn %l1,p3_b172		! Branch Taken
!	Mem[000000001d0001c0] = 1dfd8d1d c279e24e fffe0de8 f78974fa
	prefetch [%i2+0x1c0],22
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0ac,%g2
p3_b172:
	membar	#Sync			! Added by membar checker (706)
	set	p3_b173,%o7
	fbuge,pn %fcc3,p3_near_1_le	! Branch Taken, %fcc3 = 2
!	Mem[0000000031000038] = 00000000, %l7 = 0000003380000000
	ldsb	[%o2+0x03b],%l7		! %l7 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0ad,%g2
p3_b173:
!	Registers modified during the branch to p3_near_1
!	%l1  = 0000000000000000
!	%l6  = 0000000000000000
!	%l7  = 000000000000041d

p3_label_156:
	membar	#Sync			! Added by membar checker (707)
!	%l5 = 00000000000000ff, Mem[0000000032000076] = c856087d
	stha	%l5,[%o4+0x076]%asi	! Mem[0000000032000074] = 00ff087d
!	%l4 = 1b0000000000051d, %l6 = 0000000000000000, %l1 = 0000000000000000
	addc	%l4,%l6,%l1		! %l1 = 1b0000000000051d
!	%l6 = 0000000000000000, Mem[0000000031000038] = 00000000000000ff
	stx	%l6,[%o2+0x038]		! Mem[0000000031000038] = 0000000000000000
!	%l3 = 000000000000fd7d, %l2 = 0000000000010ab0, %y  = 00000000
	smul	%l3,%l2,%l3		! %l3 = 00000001081227f0
!	Mem[000000001c800008] = 00003f59, %l0 = 1b00000000002548
	ldsba	[%i1+%o6]0x80,%l0	! %l0 = 0000000000000000

p3_label_157:
	be	p3_b174			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b70095 a4685005
	prefetch [%o4+0x000],21
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x0ae,%g2
p3_b174:
	fbl,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l7 = 000000000000041d, Mem[000000001d000008] = 000000ff0075fbc4
	stxa	%l7,[%i2+%o6]0x80	! Annulled
p3_b175:
	membar	#Sync			! Added by membar checker (708)
!	%f27 = 2f0cc9c0, %f19 = ffeb2f8f, %f24 = 32e28351
	fdivs	%f27,%f19,%f24		! %f24 = ffeb2f8f

p3_label_158:
!	%l2 = 0000000000010ab0, %l6 = 0000000000000000, %l3 = 00000001081227f0
	subc	%l2,%l6,%l3		! %l3 = 0000000000010ab0
!	%l7 = 000000000000041d, %l1 = 1b0000000000051d, %y  = 00000001
	sdivcc	%l7,%l1,%l6		! %l6 = 00000000003210d2, %ccr = 00
!	Mem[000000001c000000] = fffe0de8 eca1b220 ff6b1b36 00000000
	prefetcha [%i0+0x000]%asi,23
	nop
!	Denormal Floating Point Operation Nullified
	nop

p3_label_159:
!	%l2 = 0000000000010ab0, %l0 = 0000000000000000, %l1 = 1b0000000000051d
	addc	%l2,%l0,%l1		! %l1 = 0000000000010ab0
	set	p3_b176,%o7
	fbuge,a,pn %fcc3,p3_near_1_le	! Branch Taken, %fcc3 = 2
!	Mem[000000003000007c] = 1d541982, %l6 = 00000000003210d2
	ldsh	[%o0+0x07e],%l6		! %l6 = 0000000000001982
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x0b0,%g2
p3_b176:
!	Registers modified during the branch to p3_near_1
!	%l1  = 0000000000010ab0
!	%l6  = 0000000000000001
!	%l7  = 000000000000041d
	membar	#Sync			! Added by membar checker (709)
!	Mem[000000001c800008] = 00003f590000fd7d, %l4 = 1b0000000000051d
	ldxa	[%i1+%o6]0x80,%l4	! %l4 = 00003f590000fd7d
!	Mem[000000001d000008] = 000000ff, %l3 = 0000000000010ab0
	lduba	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000000

p3_label_160:
	fbuge,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l7 = 000000000000041d, Mem[000000003080003a] = 00000000
	stb	%l7,[%o1+0x03a]		! Mem[0000000030800038] = 00001d00
p3_b177:
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l2 = 0000000000010ab0, Mem[000000001c800008] = 00003f59
	stha	%l2,[%i1+%o6]0x80	! Annulled
p3_b178:
	membar	#Sync			! Added by membar checker (710)
!	%f16 = 32e28351 6d93ff4b, %f6  = 3c000000 00000000, %f24 = ffeb2f8f c9a68388
	fdivd	%f16,%f6 ,%f24		! %f24 = 36d28351 6d93ff4b

p3_label_161:
	bg,a	p3_b179			! Branch Taken, %ccr = 00, CWP = 0
!	%l7 = 000000000000041d, Mem[000000001d000008] = 000000ff
	stha	%l7,[%i2+%o6]0x80	! Mem[000000001d000008] = 041d00ff
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0b3,%g2
p3_b179:
	membar	#Sync			! Added by membar checker (711)
!	%l3 = 0000000000000000, Mem[000000001d800000] = 00000000
	stha	%l3,[%i3+%g0]0x80	! Mem[000000001d800000] = 00000000
!	Mem[000000003100007c] = 0000ff00, %l5 = 00000000000000ff
	lduwa	[%o2+0x07c]%asi,%l5	! %l5 = 000000000000ff00
!	%l4 = 0000fd7d, %l5 = 0000ff00, Mem[000000001c000118] = 9b81c89a 4e12388d
	std	%l4,[%i0+0x118]	! Mem[000000001c000118] = 0000fd7d 0000ff00

p3_label_162:
	set	p3_b180,%o7
	fblg,pn	%fcc0,p3_near_3_he	! Branch Taken, %fcc0 = 2
!	%l7 = 000000000000041d, Mem[000000001c800008] = 00003f59
	stba	%l7,[%i1+%o6]0x80	! Mem[000000001c800008] = 1d003f59
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x0b4,%g2
p3_b180:
	membar	#Sync			! Added by membar checker (712)
!	%l3 = 0000000000000000, %l0 = 0000000000000000, %y  = 00000000
	umul	%l3,%l0,%l2		! %l2 = 0000000000000000
!	%f12 = 32e28351, %f20 = b2e28351, %f0  = c9a68388 00000001
	fsmuld	%f12,%f20,%f0 		! %f0  = bcc90d83 cbfff420
!	Mem[000000001c8001c0] = 0bd6495c a79401ad dd73c9d9 9203f615
	prefetcha [%i1+0x1c0]%asi,20

p3_label_163:
!	Mem[000000001d800060] = 12cb0952 991efd44 89e08803 69b04492
	prefetch [%i3+0x060],3
!	Mem[000000001d0001a8] = 554d9bce, %l7 = 000000000000041d
	lduba	[%i2+0x1a8]%asi,%l7	! %l7 = 0000000000000055
!	%l2 = 0000000000000000, Mem[0000000032000078] = 087d4a36ceb28373
	stx	%l2,[%o4+0x078]		! Mem[0000000032000078] = 0000000000000000
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d000008] = 041d00ff, %l7 = 0000000000000055
	swapa	[%i2+%o6]0x80,%l7	! Annulled
p3_b181:

p3_label_164:
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l6 = 0000000000000001, Mem[000000001d800008] = aad07880
	stwa	%l6,[%i3+%o6]0x80	! Mem[000000001d800008] = 00000001
p3_b182:
	membar	#Sync			! Added by membar checker (713)
!	Mem[000000001e000000] = bf829b5217739cf4, %l4 = 00003f590000fd7d
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = bf829b5217739cf4
	fbe,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l3 = 0000000000000000, Mem[000000001d000000] = 00000000
	stba	%l3,[%i2+%g0]0x80	! Annulled
p3_b183:

p3_label_165:
	membar	#Sync			! Added by membar checker (714)
!	Mem[000000001c800000] = 1b000000, %l1 = 0000000000010ab0
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 000000001b000000
	fbule	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001e000008] = 6eb3806adc8589c8, %l0 = 0000000000000000
	ldxa	[%i4+%o6]0x80,%l0	! %l0 = 6eb3806adc8589c8
p3_b184:
	membar	#Sync			! Added by membar checker (715)
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 537245c7 b3b6f9b1
	prefetcha [%o4+0x020]%asi,16
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2

p3_label_166:
!	Mem[000000001c800000] = 1b000000, %l1 = 000000001b000000
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 000000001b000000
p3_b185:
	membar	#Sync			! Added by membar checker (716)
!	%f12 = 32e28351 c9a68388, %f12 = 32e28351 c9a68388, %f28 = 84e65df9 00000000
	faddd	%f12,%f12,%f28		! %f28 = 32f28351 c9a68388
!	%l0 = 6eb3806adc8589c8, %l0 = 6eb3806adc8589c8, %y  = 00000000
	smul	%l0,%l0,%l7		! %l7 = 04eab6e833f7ac40
!	Mem[0000000032000060] = 00001b36, %l1 = 000000001b000000
	ldsw	[%o4+0x060],%g2		! %g2 = 000000001b000000
!	%f0  = bcc90d83, %f26 = 00000001
	fabss	%f0 ,%f26		! %f26 = 3cc90d83

p3_label_167:
!	Mem[000000001c800000] = 1b000000 0000051d 1d003f59 0000fd7d
	prefetch [%i1+0x000],0
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000032000000] = 1f1cf2e7 cbdc61c5 d5b70095 a4685005
	prefetch [%o4+0x000],23	! Annulled
p3_b186:
	set	p3_b187,%o7
	fbug,a	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	%l5 = 000000000000ff00, Mem[000000001c800000] = 1b0000000000051d
	stxa	%l5,[%i1+%g0]0x80	! Mem[000000001c800000] = 000000000000ff00
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x0bb,%g2
p3_b187:
!	Registers modified during the branch to p3_far_1
!	%l0  = fffffffffd7d8000
!	%l4  = ffffffff80000000
!	%l5  = 0000000000000015
!	%l6  = 00000000ffffffff
!	%l7  = fb154917cc0853d5

p3_label_168:
	membar	#Sync			! Added by membar checker (717)
	fbue,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001d0000ec] = e8299fab, %l6 = 00000000ffffffff
	ldsw	[%i2+0x0ec],%l6		! Annulled
p3_b188:
	membar	#Sync			! Added by membar checker (718)
!	Mem[000000001c800180] = 0f9bee19 0b394625 ae74cc42 4733cd41
	prefetch [%i1+0x180],23
!	Mem[000000001d000100] = 4c6cab1d 21d40387 2f3eea2c ea286c6a
	prefetch [%i2+0x100],22
!	%l7 = fb154917cc0853d5, %l2 = 0000000000000000, %l6 = 00000000ffffffff
	andncc	%l7,%l2,%l6		! %l6 = fb154917cc0853d5, %ccr = 88

p3_label_169:
!	Mem[000000001d800000] = 00000000, %l3 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Branch On Register, %l7 = fb154917cc0853d5
	brlz,a,pt %l7,p3_b189		! Branch Taken
!	%l1 = 000000001b000000, Mem[000000001c000008] = ff6b1b36
	stba	%l1,[%i0+%o6]0x80	! Mem[000000001c000008] = 006b1b36
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x0bd,%g2
p3_b189:
	membar	#Sync			! Added by membar checker (719)
!	Mem[000000001c0001a0] = 3825d380 8a86bcef 7c2c0ada a07da629
	prefetcha [%i0+0x1a0]%asi,23
	bcc	p3_b190			! Branch Taken, %ccr = 88, CWP = 0

p3_label_170:
!	Mem[000000003080003e] = 00000067, %l3 = 0000000000000000
	ldstub	[%o1+0x03e],%l3		! %l3 = 0000000000000000
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x0be,%g2
p3_b190:
	membar	#Sync			! Added by membar checker (720)
!	%l7 = fb154917cc0853d5
	sethi	%hi(0x000ee800),%l7	! %l7 = 00000000000ee800
!	Mem[0000000031800030] = 530284a5 0000ffcd, %l0 = fd7d8000, %l1 = 1b000000
	ldd	[%o3+0x030],%l0		! %l0 = 00000000530284a5 000000000000ffcd
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetcha [%o4+0x040]%asi,2
!	%f6  = 3c000000 00000000, %f26 = 3cc90d83 2f0cc9c0, %f6  = 3c000000 00000000
	faddd	%f6 ,%f26,%f6 		! %f6  = 3cc90e83 2f0cc9c0

p3_label_171:
	fbn,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000032000040] = d4859d2d 357b73b9 cf027a2b 7f7cab97
	prefetch [%o4+0x040],16	! Annulled
p3_b191:
	membar	#Sync			! Added by membar checker (721)
!	%f10 = 3f800000 ed93ff4b, %f30 = 45135b2f 2f0cc9c0
	fcmped	%fcc2,%f10,%f30		! %fcc2 = 1
!	Mem[000000001c000000] = fffe0de8, %l6 = fb154917cc0853d5
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 00000000fffe0de8
!	Mem[000000001c8001e0] = f907ace6 ff8734d6 ea77cb0b 5fe37d16
	prefetcha [%i1+0x1e0]%asi,2

p3_label_172:
!	Mem[000000001d000158] = 55aa3818, %l5 = 0000000000000015
	swapa	[%i2+0x158]%asi,%l5	! %l5 = 0000000055aa3818
!	%l7 = 00000000000ee800, %l7 = 00000000000ee800, %l2 = 0000000000000000
	xorcc	%l7,%l7,%l2		! %l2 = 0000000000000000, %ccr = 44
!	%l6 = 00000000fffe0de8, %l6 = 00000000fffe0de8, %l3 = 0000000000000000
	srax	%l6,%l6,%l3		! %l3 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000032000028] = 537245c7b3b6f9b1
	stx	%l2,[%o4+0x028]		! Mem[0000000032000028] = 0000000000000000
!	Mem[000000001d800000] = 00000000, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000

p3_label_173:
!	%l7 = 00000000000ee800, immed = 00000cad, %l7 = 00000000000ee800
	orncc	%l7,0xcad,%l7		! %l7 = fffffffffffffb52, %ccr = 88
!	Mem[000000001d000000] = 00000000, %l6 = 00000000fffe0de8
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
	set	p3_b192,%o7
	fbug,a	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031000030] = 7fffffff, %l0 = 00000000530284a5
	lduh	[%o2+0x030],%l0		! %l0 = 0000000000007fff
!	The following code should not be executed
	lduh	[%o1+0x008],%l4
	nop
	nop
	srax	%l0,%l0,%l0
	ldsha	[%o0+0x040]%asi,%l2
	ba	p3_branch_failed
	mov	0x0c0,%g2
p3_b192:
!	Registers modified during the branch to p3_far_1
!	%l0  = fffffffffd7d8000
!	%l4  = ffffffff80000000
!	%l5  = 00000000000711d8
!	%l6  = 00000000ffffffff
!	%l7  = 0000000000071686
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 11

p3_label_174:
!	 Annulled
	ldd	[%o4+0x038],%g2
p3_b193:
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 11
!	%l5 = 00000000000711d8, Mem[000000001d000000] = fffe0de8
	stha	%l5,[%i2+%g0]0x80	! Annulled
p3_b194:
	membar	#Sync			! Added by membar checker (722)
!	Mem[000000001c8001a0] = af3f4017 6b8a79aa ace15e24 d552b2aa
	prefetch [%i1+0x1a0],23
!	%l0 = fffffffffd7d8000, immed = fffff927, %y  = 04eab6e8
	umulcc	%l0,-0x6d9,%l5		! %l5 = fd7d79382f9e8000, %ccr = 80

p3_label_175:
	set	p3_b195,%o7
	fbg	p3_far_0_he	! Branch Taken, %fcc0 = 2
!	%l5 = fd7d79382f9e8000, Mem[000000001e80019c] = ffaef158
	stw	%l5,[%i5+0x19c]		! Mem[000000001e80019c] = 2f9e8000
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0c3,%g2
p3_b195:
!	Registers modified during the branch to p3_far_0
!	%l3  = 00000000000000ff
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 80
!	%l7 = 0000000000071686, Mem[000000001d00002a] = 1e006dd1
	sth	%l7,[%i2+0x02a]		! Mem[000000001d000028] = 1e001686
p3_b196:
	membar	#Sync			! Added by membar checker (723)
!	%f15 = 00000000, %f20 = b2e28351, %f5  = 00000000
	fdivs	%f15,%f20,%f5 		! %f5  = 80000000

p3_label_176:
	set	p3_b197,%o7
	fbo	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	%l0 = fd7d8000, %l1 = 0000ffcd, Mem[000000001d000000] = fffe0de8 00000000
	stda	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = fd7d8000 0000ffcd
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x0c5,%g2
p3_b197:
!	Registers modified during the branch to p3_far_1
!	%l0  = fffffffffd7d8000
!	%l4  = 000000007fffffff
!	%l5  = 0014eb7d60928988
!	%l6  = 00000000ffffffff
!	%l7  = 0014eb7d608b7302
	membar	#Sync			! Added by membar checker (724)
!	%f4  = c9a68388, %f17 = 6d93ff4b
	fcmpes	%fcc0,%f4 ,%f17		! %fcc0 = 1
!	Mem[000000001c800000] = 00000000, %l0 = fffffffffd7d8000
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l1 = 000000000000ffcd
	setx	0x5689dd955689dd95,%g7,%l1 ! %l1 = 5689dd955689dd95

p3_label_177:
!	Mem[000000001e800040] = f27a83f9 6785bf91 4ebfac9a b7c26433
	prefetch [%i5+0x040],2
!	%l4 = 000000007fffffff, %l0 = 0000000000000000, %l2 = 0000000000000000
	sllx	%l4,%l0,%l2		! %l2 = 000000007fffffff
	ba,a	p3_b198			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c000180] = 12a06b4f c1f3ff88 1783226b 176161f7
	prefetch [%i0+0x180],23	! Annulled
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x0c6,%g2
p3_b198:
	membar	#Sync			! Added by membar checker (725)
!	%l5 = 0014eb7d60928988, immed = 00000013, %l1 = 5689dd955689dd95
	srlx	%l5,0x013,%l1		! %l1 = 000000029d6fac12

p3_label_178:
!	Mem[0000000031000038] = 0000000000000000, %l3 = 00000000000000ff
	ldx	[%o2+0x038],%l3		! %l3 = 0000000000000000
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001e8000e8] = d4b7b1ee54912486, %l3 = 0000000000000000
	ldx	[%i5+0x0e8],%l3		! Annulled
p3_b199:
	fbge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l6 = 00000000ffffffff, Mem[000000001e800008] = 4308f5440b908ac4
	stxa	%l6,[%i5+%o6]0x80	! Annulled
p3_b200:

p3_label_179:
	membar	#Sync			! Added by membar checker (726)
!	Mem[000000001c8001a0] = af3f4017 6b8a79aa, %l2 = 7fffffff, %l3 = 00000000
	ldd	[%i1+0x1a0],%l2		! %l2 = 00000000af3f4017 000000006b8a79aa
!	%l1 = 000000029d6fac12, immed = fffff667, %l6 = 00000000ffffffff
	andn	%l1,-0x999,%l6		! %l6 = 0000000000000810
!	%l5 = 0014eb7d60928988, %l0 = 0000000000000000, %l0 = 0000000000000000
	xnor	%l5,%l0,%l0		! %l0 = ffeb14829f6d7677
	set	p3_b201,%o7
	fblg,pn	%fcc0,p3_near_2_le	! Branch Taken, %fcc0 = 1
!	%l3 = 000000006b8a79aa, Mem[000000001c00009a] = b83f2ac9
	sth	%l3,[%i0+0x09a]		! Mem[000000001c000098] = b83f79aa
!	The following code should not be executed
	fbul,a	p0_not_taken_0
	sllx	%l0,%l0,%l0
	nop
	fabsd	%f6,%f8
	ba	p3_branch_failed
	mov	0x0c9,%g2
p3_b201:
!	Registers modified during the branch to p3_near_2
!	%l0  = 0000000000000010

p3_label_180:
	fbuge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c8000e0] = 97edbd56 9abf5be6 dd186cb6 0c322416
	prefetch [%i1+0x0e0],0	! Annulled
p3_b202:
	membar	#Sync			! Added by membar checker (727)
!	Denormal Floating Point Operation Nullified
	nop
!	%l4 = 000000007fffffff, Mem[0000000031800038] = 0000000000020eab
	stxa	%l4,[%o3+0x038]%asi	! Mem[0000000031800038] = 000000007fffffff
!	Mem[000000001c0001d0] = c8f5b198, %l6 = 0000000000000810
	ldsha	[%i0+0x1d2]%asi,%l6	! %l6 = ffffffffffffb198

p3_label_181:
	set	p3_b203,%o7
	fbule	p3_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c800000] = 00000000, %l6 = ffffffffffffb198
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fba,a	p0_not_taken_0
	nop
	fdivs	%f3,%f18,%f23
	nop
	bneg	p0_not_taken_0
	mulx	%l0,0xfca,%l0
	nop
	std	%l6,[%o1+0x000]
	ba	p3_branch_failed
	mov	0x0cb,%g2
p3_b203:
!	Registers modified during the branch to p3_far_2
!	%l0  = 0000000000000ccd
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 000000000000ff00
!	%l5  = 0000938e76b3365a
	bpos	p3_b204			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c000000] = cc0853d5, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffcc08
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x0cc,%g2
p3_b204:
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00

p3_label_182:
!	Mem[000000001c800008] = 1d003f590000fd7d, %l0 = 0000000000000ccd
	ldxa	[%i1+%o6]0x80,%l0	! Annulled
p3_b205:
	membar	#Sync			! Added by membar checker (728)
!	%l2 = 0000000000000000, Mem[000000001d000008] = 041d00ff
	stha	%l2,[%i2+%o6]0x80	! Mem[000000001d000008] = 000000ff
!	Mem[000000001c000160] = a757a793 b5b542a3 489c696f 7daf8672
	prefetch [%i0+0x160],3
!	Branch On Register, %l6 = 0000000000000000
	brgez,a,pt %l6,p3_b206		! Branch Taken
!	Mem[0000000031800078] = 80000000, %l4 = 000000007fffffff
	lduw	[%o3+0x078],%l4		! %l4 = 0000000080000000
!	The following code should not be executed
	nop
	ldsha	[%i0+0x062]%asi,%l0
	fnegd	%f18,%f12
	fbge	p0_not_taken_0
	stw	%l6,[%o0+0x000]
	nop
	sdivx	%l0,%l0,%l0
	nop
	ba	p3_branch_failed
	mov	0x0ce,%g2
p3_b206:

p3_label_183:
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = 0000000080000000, Mem[000000001c000000] = cc0853d5
	stwa	%l4,[%i0+%g0]0x80	! Mem[000000001c000000] = 80000000
p3_b207:
	membar	#Sync			! Added by membar checker (729)
!	Mem[0000000031800070] = ffffffff, %l4 = 0000000080000000
	ldub	[%o3+0x073],%l4		! %l4 = 00000000000000ff
!	%l3 = 000000000000ff00, %l3 = 000000000000ff00, %l7 = 0014eb7d608b7302
	subc	%l3,%l3,%l7		! %l7 = 0000000000000000
!	Mem[000000001d800148] = 3bb10b7b, %l3 = 000000000000ff00
	swap	[%i3+0x148],%l3		! %l3 = 000000003bb10b7b

p3_label_184:
!	Mem[0000000032000060] = 00001b36 00000000 d3a59bed c4d847d0
	prefetch [%o4+0x060],20
!	Branch On Register, %l3 = 000000003bb10b7b
	brz,pt	%l3,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d000000] = fd7d8000, %l1 = ffffffffffffcc08
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000fd
p3_b208:
	membar	#Sync			! Added by membar checker (730)
	nop
!	Mem[000000001d800168] = 0d3006f4, %l4 = 00000000000000ff
	lduwa	[%i3+0x168]%asi,%l4	! %l4 = 000000000d3006f4

p3_label_185:
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c800004] = 0000ff00, %l2 = 0000000000000000
	swap	[%i1+0x004],%l2		! %l2 = 000000000000ff00
p3_b209:
!	Jump to jmpl_0, CWP = 0
	set	p3_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	%l7 = 0000000000000000, Mem[0000000031800070] = fffffffffd7d8000
	stx	%l7,[%o3+0x070]		! Mem[0000000031800070] = 0000000000000000
!	Registers modified during the branch to p3_jmpl_0
!	%l3  = 00000000fd7d7e62
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_186:
!	Mem[000000003000003b] = 0000051d, %l6 = 0000000000000000
	ldstub	[%o0+0x03b],%l6		! %l6 = 000000000000001d
p3_b210:
	membar	#Sync			! Added by membar checker (731)
!	%l1 = 00000000000000fd, %l0 = 0000000000000ccd, %y  = fd7d7938
	udiv	%l1,%l0,%l2		! %l2 = 00000000ffffffff
!	Mem[000000001d800000] = 00000000, %l5 = 0000938e76b3365a
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001c800000] = 00000000, %l0 = 0000000000000ccd
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f22 = c134d071 00000000, %f4  = c9a68388 80000000
	fdtox	%f22,%f4 		! %f4  = ffffffff ffeb2f8f

p3_label_187:
!	Mem[0000000031000070] = f93502eff87018d7, %l0 = 0000000000000000
	ldx	[%o2+0x070],%l0		! %l0 = f93502eff87018d7
!	%l2 = 00000000ffffffff, %l7 = 0000000000000000, %l3 = 00000000fd7d7e62
	xorcc	%l2,%l7,%l3		! %l3 = 00000000ffffffff, %ccr = 08
!	%f24 = 36d28351, %f15 = 00000000
	fmovs	%f24,%f15		! %f15 = 36d28351
!	%f30 = 45135b2f 2f0cc9c0, %f30 = 45135b2f 2f0cc9c0, %f20 = b2e28351 00000001
	faddd	%f30,%f30,%f20		! %f20 = 45235b2f 2f0cc9c0
!	%f8  = 00000000, %f26 = 3cc90d83
	fnegs	%f8 ,%f26		! %f26 = 80000000

p3_label_188:
!	Mem[000000001c000080] = 74347eff 865a0a08 58c32631 c85fab1b
	prefetch [%i0+0x080],21
!	%l0 = f93502eff87018d7, %l2 = 00000000ffffffff, %y  = fd7d7938
	umulcc	%l0,%l2,%l2		! %l2 = f87018d6078fe729, %ccr = 80
!	Mem[0000000030000034] = 3670811e, %l7 = 00000000, %l4 = 0d3006f4
	add	%o0,0x34,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 000000003670811e
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003100003c] = 00000000, %l6 = 000000000000001d
	ldstub	[%o2+0x03c],%l6		! %l6 = 0000000000000000
p3_b211:

p3_label_189:
	membar	#Sync			! Added by membar checker (732)
!	Mem[0000000031000078] = 00000000, %l3 = 00000000ffffffff
	swapa	[%o2+0x078]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030000070] = 00000000, %l1 = 00000000000000fd
	lduw	[%o0+0x070],%l1		! %l1 = 0000000000000000
!	%l0 = f93502eff87018d7, %l2 = f87018d6078fe729, %l3 = 0000000000000000
	andn	%l0,%l2,%l3		! %l3 = 01050229f87018d6
!	Mem[000000003080007c] = fd7d8000, %l0 = f93502eff87018d7
	ldsha	[%o1+0x07e]%asi,%l0	! %l0 = ffffffffffff8000
!	%l2 = f87018d6078fe729, Mem[0000000030000034] = 3670811e
	stha	%l2,[%o0+0x034]%asi	! Mem[0000000030000034] = e729811e

p3_label_190:
!	Mem[0000000030800070] = 806b575c00000067, %l6 = 0000000000000000
	ldxa	[%o1+0x070]%asi,%l6	! %l6 = 806b575c00000067
!	%l4 = 000000003670811e, Mem[000000001c000000] = 80000000
	stba	%l4,[%i0+%g0]0x80	! Mem[000000001c000000] = 1e000000
!	%f12 = 32e28351, %f22 = c134d071 00000000
	fitod	%f12,%f22		! %f22 = 41c97141 a8800000
!	Mem[0000000030000074] = 103500c9, %l2 = f87018d6078fe729
	ldsw	[%o0+0x074],%l2		! %l2 = 00000000103500c9
!	Mem[0000000032000020] = abf2ed78 dbe0a62d 00000000 00000000
	prefetch [%o4+0x020],16

p3_label_191:
!	%f22 = 41c97141 a8800000, %f5  = ffeb2f8f
	fdtoi	%f22,%f5 		! %f5  = 32e28351
!	Mem[000000001d800008] = 00000001, %l3 = 01050229f87018d6
	swapa	[%i3+%o6]0x80,%l3	! %l3 = 0000000000000001
!	%l0 = ffffffffffff8000, immed = 0000001e, %l6 = 806b575c00000067
	sra	%l0,0x01e,%l6		! %l6 = ffffffffffffffff
	bvc	p3_b212			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[000000001d000000] = fd7d8000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000fd
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x0d4,%g2
p3_b212:

p3_label_192:
	membar	#Sync			! Added by membar checker (733)
!	%l2 = 103500c9, %l3 = 00000001, Mem[0000000031800038] = 00000000 7fffffff
	std	%l2,[%o3+0x038]	! Mem[0000000031800038] = 103500c9 00000001
	fbge,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[000000001c000000] = 1e000000eca1b220, %l4 = 000000003670811e
	ldxa	[%i0+%g0]0x80,%l4	! Annulled
p3_b213:
	membar	#Sync			! Added by membar checker (734)
!	%l6 = ffffffffffffffff
	sethi	%hi(0x91892800),%l6	! %l6 = 0000000091892800
!	%l4 = 3670811e, %l5 = 00000000, Mem[000000001f000008] = c8a3b7dd 09b2d8ac
	stda	%l4,[%i6+%o6]0x80	! Mem[000000001f000008] = 3670811e 00000000

p3_label_193:
!	Mem[000000001d800160] = c52fe75b 2f991992 0d3006f4 4e1615cc
	prefetch [%i3+0x160],1
	fbuge,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l2 = 00000000103500c9, Mem[000000001c000008] = 006b1b36
	stha	%l2,[%i0+%o6]0x80	! Annulled
p3_b214:
	set	p3_b215,%o7
	fbo,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c000000] = 1e000000eca1b220, %l0 = ffffffffffff8000
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 1e000000eca1b220
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x0d7,%g2
p3_b215:
!	Registers modified during the branch to p3_far_0
!	%l3  = 00000000000000ff

p3_label_194:
	bneg,a	p3_not_taken_0		! Branch Not Taken, %ccr = 80
!	%l4 = 000000003670811e, Mem[0000000030000030] = 1b36e5d4
	stw	%l4,[%o0+0x030]		! Annulled
p3_b216:
	membar	#Sync			! Added by membar checker (735)
!	%l7 = 0000000000000000, %l0 = 1e000000eca1b220, %l5 = 0000000000000000
	orncc	%l7,%l0,%l5		! %l5 = e1ffffff135e4ddf, %ccr = 80
!	%l0 = 1e000000eca1b220, immed = ffffff1d, %l7 = 0000000000000000
	sub	%l0,-0x0e3,%l7		! %l7 = 1e000000eca1b303
!	%l0 = 1e000000eca1b220, %l6 = 0000000091892800, %y  = f87018d6
	sdivcc	%l0,%l6,%l0		! %l0 = 00000000118670a6, %ccr = 00

p3_label_195:
!	call to call_3, CWP = 0
	call	p3_call_3_le
!	Mem[000000001c800000] = 00000000, %l6 = 0000000091892800
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Registers modified during the branch to p3_call_3
!	%l0  = 00000000000013ff
	fbu,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 00000000103500c9, Mem[000000001d000000] = ff7d8000
	stha	%l2,[%i2+%g0]0x80	! Mem[000000001d000000] = 00c98000
p3_b217:
	membar	#Sync			! Added by membar checker (736)
!	Mem[000000001c8001e0] = f907ace6, %l4 = 000000003670811e
	lduw	[%i1+0x1e0],%l4		! %l4 = 00000000f907ace6

p3_label_196:
!	%l6 = 0000000000000000, immed = 00000021, %l7 = 1e000000eca1b303
	srlx	%l6,0x021,%l7		! %l7 = 0000000000000000
!	%f4  = ffffffff 32e28351, %f14 = 00000001 36d28351
	fxtod	%f4 ,%f14		! %f14 = c1e9a3af 95e00000
!	%l0 = 00000000000013ff, %l2 = 00000000103500c9, %l5 = e1ffffff135e4ddf
	orn	%l0,%l2,%l5		! %l5 = ffffffffefcaffff
!	Mem[0000000031800078] = 80000000, %l6 = 0000000000000000
	ldsh	[%o3+0x07a],%l6		! %l6 = 0000000000000000
!	%l1 = 00000000000000fd, Mem[000000001c000024] = 0000032a
	stwa	%l1,[%i0+0x024]%asi	! Mem[000000001c000024] = 000000fd

p3_label_197:
!	%l7 = 0000000000000000
	sethi	%hi(0x72ee4000),%l7	! %l7 = 0000000072ee4000
!	%l5 = ffffffffefcaffff, %l5 = ffffffffefcaffff, %l1 = 00000000000000fd
	sll	%l5,%l5,%l1		! %l1 = f7e57fff80000000
	set	p3_b218,%o7
	fbo,a	p3_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c800030] = 08314062, %l2 = 00000000103500c9
	ldsh	[%i1+0x030],%l2		! %l2 = 0000000000000831
!	The following code should not be executed
	fitos	%f26,%f24
	ldsha	[%i1+0x0e6]%asi,%l6
	ba	p3_branch_failed
	mov	0x0da,%g2
p3_b218:
!	Registers modified during the branch to p3_far_1
!	%l3  = ffffffffefcafe8f
	membar	#Sync			! Added by membar checker (737)
!	Mem[000000001d80015c] = 1f86acbc, %l3 = ffffffffefcafe8f
	ldsh	[%i3+0x15e],%l3		! %l3 = ffffffffffffacbc

p3_label_198:
	set	p3_b219,%o7
	fbo	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d000160] = 898566a9 6d9c1817 1ec900e9 5e1cd62e
	prefetch [%i2+0x160],2
!	The following code should not be executed
	nop
	nop
	nop
	xor	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0db,%g2
p3_b219:
!	Registers modified during the branch to p3_far_0
!	%l3  = 00000000000000ff
	bl,a	p3_b220			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000003080007e] = fd7d8000, %l4 = 00000000f907ace6
	ldstub	[%o1+0x07e],%l4		! %l4 = 0000000000000080
!	The following code should not be executed
	bvs	p0_not_taken_0
	fmuld	%f30,%f28,%f20
	nop
	ba	p3_branch_failed
	mov	0x0dc,%g2
p3_b220:
	membar	#Sync			! Added by membar checker (738)
!	Mem[0000000032000048] = 7a2b7f7c, %l0 = 00000000000013ff
	ldsha	[%o4+0x04a]%asi,%g2	! %g2 = 0000000000007a2b

p3_label_199:
!	Mem[0000000032000058] = 54998092 142f1f51, %l4 = 00000080, %l5 = efcaffff
	ldda	[%o4+0x058]%asi,%g2	! %l4 = 0000000000000080 ffffffffefcaffff
	fbge,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000001d800098] = ede3c468, %l6 = 0000000000000000
	ldsh	[%i3+0x098],%l6		! %l6 = ffffffffffffede3
p3_b221:
	membar	#Sync			! Added by membar checker (739)
!	%f10 = 3f800000, %f24 = 36d28351 6d93ff4b
	fstox	%f10,%f24		! %f24 = 00000000 00000001
!	Mem[0000000031000070] = f93502eff87018d7, %l0 = 00000000000013ff
	ldxa	[%o2+0x070]%asi,%l0	! %l0 = f93502eff87018d7

p3_label_200:
	bn,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000031000033] = 7fffffff, %l6 = ffffffffffffede3
	ldstub	[%o2+0x033],%l6		! Annulled
p3_b222:
	ba,a	p3_b223			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001c800000] = 00000000, %l2 = 0000000000000831
	ldsha	[%i1+%g0]0x80,%l2	! Annulled
!	The following code should not be executed
	fble	p0_not_taken_0
	nop
	ldsba	[%o3+0x009]%asi,%l3
	ba	p3_branch_failed
	mov	0x0df,%g2
p3_b223:
	membar	#Sync			! Added by membar checker (740)
	fbn,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
	nop
p3_b224:
	nop

!	End of Random Code for Processor 3

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x00c]		! Set processor 3 done flag

!	Check Registers

p3_check_registers:
	set	p3_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be f93502eff87018d7
	bne,a,pn %xcc,p3_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be f7e57fff80000000
	bne,a,pn %xcc,p3_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000831
	bne,a,pn %xcc,p3_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p3_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000080
	bne,a,pn %xcc,p3_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffefcaffff
	bne,a,pn %xcc,p3_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ffffffffffffede3
	bne,a,pn %xcc,p3_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000072ee4000
	bne,a,pn %xcc,p3_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xf87018d6,%g2
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
	cmp	%l0,%l1			! %f0  should be bcc90d83 cbfff420
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000001 3f800000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffffffff 32e28351
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 3cc90e83 2f0cc9c0
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 00000001
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 3f800000 ed93ff4b
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 32e28351 c9a68388
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be c1e9a3af 95e00000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 32e28351 6d93ff4b
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 ffeb2f8f
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 45235b2f 2f0cc9c0
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 41c97141 a8800000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 00000001
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 80000000 2f0cc9c0
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 32f28351 c9a68388
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 45135b2f 2f0cc9c0
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p3_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 1e000000eca1b220
	ldx	[%i0+0x000],%g3		! Observed data at 000000001c000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 006b1b3600000000
	ldx	[%i0+0x008],%g3		! Observed data at 000000001c000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 6a65cf321e11cc94
	ldx	[%i0+0x010],%g3		! Observed data at 000000001c000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 00000067000000fd
	ldx	[%i0+0x020],%g3		! Observed data at 000000001c000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 1aa4c26a3eff27fc
	ldx	[%i0+0x030],%g3		! Observed data at 000000001c000030
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 83d48000bc6fac25
	ldx	[%i0+0x058],%g3		! Observed data at 000000001c000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 0055de92e64caabc
	ldx	[%i0+0x068],%g3		! Observed data at 000000001c000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x098],%g2		! Expect data = b83f79aa4406c658
	ldx	[%i0+0x098],%g3		! Observed data at 000000001c000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 76b3365aecca160c
	ldx	[%i0+0x0a0],%g3		! Observed data at 000000001c0000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = 1a36efbdd24ad711
	ldx	[%i0+0x0b0],%g3		! Observed data at 000000001c0000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 0000000062a42298
	ldx	[%i0+0x0c0],%g3		! Observed data at 000000001c0000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 0000fd7d0000ff00
	ldx	[%i0+0x118],%g3		! Observed data at 000000001c000118
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x190],%g2		! Expect data = 66d2fe33d300b718
	ldx	[%i0+0x190],%g3		! Observed data at 000000001c000190
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = 000000ffffffffff
	ldx	[%i0+0x1b8],%g3		! Observed data at 000000001c0001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = ff00b3bd6917c904
	ldx	[%i0+0x1f8],%g3		! Observed data at 000000001c0001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f8,%g4

	set	p3_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000000000000
	ldx	[%i1+0x000],%g3		! Observed data at 000000001c800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 1d003f590000fd7d
	ldx	[%i1+0x008],%g3		! Observed data at 000000001c800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x028],%g2		! Expect data = fd7d800000000800
	ldx	[%i1+0x028],%g3		! Observed data at 000000001c800028
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 0054e9d6b3f691fe
	ldx	[%i1+0x088],%g3		! Observed data at 000000001c800088
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x108],%g2		! Expect data = ff003252913ec946
	ldx	[%i1+0x108],%g3		! Observed data at 000000001c800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x140],%g2		! Expect data = 74d35cc56f00d71c
	ldx	[%i1+0x140],%g3		! Observed data at 000000001c800140
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x170],%g2		! Expect data = 647e8b07a44b9092
	ldx	[%i1+0x170],%g3		! Observed data at 000000001c800170
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x180],%g2		! Expect data = 0f9bee190b394625
	ldx	[%i1+0x180],%g3		! Observed data at 000000001c800180
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = 6fe7aa5e4dd77dff
	ldx	[%i1+0x1d0],%g3		! Observed data at 000000001c8001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = ff31159d70adbf60
	ldx	[%i1+0x1f0],%g3		! Observed data at 000000001c8001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f0,%g4

	set	p3_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00c980000000ffcd
	ldx	[%i2+0x000],%g3		! Observed data at 000000001d000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 000000ff0075fbc4
	ldx	[%i2+0x008],%g3		! Observed data at 000000001d000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 403da75ca07136e0
	ldx	[%i2+0x010],%g3		! Observed data at 000000001d000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 1e0016864b1f68ba
	ldx	[%i2+0x028],%g3		! Observed data at 000000001d000028
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 06bff06bff8fd04a
	ldx	[%i2+0x0c8],%g3		! Observed data at 000000001d0000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x158],%g2		! Expect data = 00000015f24836da
	ldx	[%i2+0x158],%g3		! Observed data at 000000001d000158
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x170],%g2		! Expect data = 3e42fbc4a1c92b2a
	ldx	[%i2+0x170],%g3		! Observed data at 000000001d000170
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x188],%g2		! Expect data = 0000000000000d9c
	ldx	[%i2+0x188],%g3		! Observed data at 000000001d000188
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x188,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 000c74ea19c290f0
	ldx	[%i2+0x1b0],%g3		! Observed data at 000000001d0001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1c8],%g2		! Expect data = fffe0de8f78974fa
	ldx	[%i2+0x1c8],%g3		! Observed data at 000000001d0001c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1c8,%g4
	ldx	[%g1+0x1e0],%g2		! Expect data = 777bc038c5e0005b
	ldx	[%i2+0x1e0],%g3		! Observed data at 000000001d0001e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 3cf5d6d9ebf0e330
	ldx	[%i2+0x1e8],%g3		! Observed data at 000000001d0001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e8,%g4

	set	p3_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 76b3365a00000000
	ldx	[%i3+0x000],%g3		! Observed data at 000000001d800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = f87018d60000005c
	ldx	[%i3+0x008],%g3		! Observed data at 000000001d800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = d094ff9f2390eeb0
	ldx	[%i3+0x018],%g3		! Observed data at 000000001d800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 000008006baae830
	ldx	[%i3+0x078],%g3		! Observed data at 000000001d800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 000000ff00000066
	ldx	[%i3+0x0b8],%g3		! Observed data at 000000001d8000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 011589da2f3eea2c
	ldx	[%i3+0x0d0],%g3		! Observed data at 000000001d8000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 122e7552dedb346e
	ldx	[%i3+0x0e8],%g3		! Observed data at 000000001d8000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 000003cc80dfd51d
	ldx	[%i3+0x118],%g3		! Observed data at 000000001d800118
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x148],%g2		! Expect data = 0000ff003645c0c7
	ldx	[%i3+0x148],%g3		! Observed data at 000000001d800148
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x148,%g4
	ldx	[%g1+0x198],%g2		! Expect data = a299aa79ff3e0c27
	ldx	[%i3+0x198],%g3		! Observed data at 000000001d800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = ef001b360b38a662
	ldx	[%i3+0x1a0],%g3		! Observed data at 000000001d8001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = aebb42b45efa1b36
	ldx	[%i3+0x1b0],%g3		! Observed data at 000000001d8001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 80fef98400000000
	ldx	[%i3+0x1f8],%g3		! Observed data at 000000001d8001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f8,%g4

	set	p3_local4_expect,%g1

!	Processor 3, local 4 is clean


	set	p3_local5_expect,%g1
	ldx	[%g1+0x050],%g2		! Expect data = 00000ccd00000000
	ldx	[%i5+0x050],%g3		! Observed data at 000000001e800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 0000ff003bb10b7b
	ldx	[%i5+0x128],%g3		! Observed data at 000000001e800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 73ea62da2f9e8000
	ldx	[%i5+0x198],%g3		! Observed data at 000000001e800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = 154100af4ea2bdbf
	ldx	[%i5+0x1b8],%g3		! Observed data at 000000001e8001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b8,%g4

	set	p3_local6_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 3670811e00000000
	ldx	[%i6+0x008],%g3		! Observed data at 000000001f000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = efbd4d7ea26fee95
	ldx	[%i6+0x0a8],%g3		! Observed data at 000000001f0000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0a8,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p3_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p3_memcheck_share0:
	ldx	[%g4+0x30],%g2	! Expected value = 1b36e5d4e729811e
	ldx	[%o0+0x30],%g3	! Read value at Mem[0000000030000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 000005ff000000ff
	ldx	[%o0+0x38],%g3	! Read value at Mem[0000000030000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 00000000103500c9
	ldx	[%o0+0x70],%g3	! Read value at Mem[0000000030000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 0f9bee191d541982
	ldx	[%o0+0x78],%g3	! Read value at Mem[0000000030000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p3_memcheck_share1:
	ldx	[%g4+0x30],%g2	! Expected value = fffffffff38da33f
	ldx	[%o1+0x30],%g3	! Read value at Mem[0000000030800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 00001d000000ff67
	ldx	[%o1+0x38],%g3	! Read value at Mem[0000000030800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 806b575c00000067
	ldx	[%o1+0x70],%g3	! Read value at Mem[0000000030800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = fffffffffd7dff00
	ldx	[%o1+0x78],%g3	! Read value at Mem[0000000030800078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p3_memcheck_share2:
	ldx	[%g4+0x30],%g2	! Expected value = 7fffffffffffffff
	ldx	[%o2+0x30],%g3	! Read value at Mem[0000000031000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 00000000ff000000
	ldx	[%o2+0x38],%g3	! Read value at Mem[0000000031000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = f93502eff87018d7
	ldx	[%o2+0x70],%g3	! Read value at Mem[0000000031000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = ffffffff0000ff00
	ldx	[%o2+0x78],%g3	! Read value at Mem[0000000031000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p3_memcheck_share3:
	ldx	[%g4+0x30],%g2	! Expected value = 530284a50000ffcd
	ldx	[%o3+0x30],%g3	! Read value at Mem[0000000031800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 103500c900000001
	ldx	[%o3+0x38],%g3	! Read value at Mem[0000000031800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 0000000000000000
	ldx	[%o3+0x70],%g3	! Read value at Mem[0000000031800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 800000002f9e8000
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
	sll	%l3,0x016,%l7
	prefetch [%i3+0x1e0],4
	or	%l1,0x024,%l2
	ldsb	[%o1+0x036],%l3		! Mem[0000000030800036]
	done

p3_trap1o:
	sll	%l3,0x016,%l7
	prefetch [%o3+0x1e0],4
	or	%l1,0x024,%l2
	ldsb	[%i1+0x036],%l3		! Mem[0000000030800036]
	done


p3_trap2e:
	nop
	taddcc	%l0,%l3,%l6
	sllx	%l3,0x01f,%l2
	add	%l7,%l7,%l5
	sll	%l6,%l0,%l0
	lduh	[%o5+0x03c],%l0		! Mem[000000004000003c]
	done

p3_trap2o:
	nop
	taddcc	%l0,%l3,%l6
	sllx	%l3,0x01f,%l2
	add	%l7,%l7,%l5
	sll	%l6,%l0,%l0
	lduh	[%i5+0x03c],%l0		! Mem[000000004000003c]
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
	ldx	[%g1+0x000],%l0	! %l0 = 5dc2c70024a95a62
	ldx	[%g1+0x008],%l1	! %l1 = bd32db0032e9ee8d
	ldx	[%g1+0x010],%l2	! %l2 = 0d71b1001d010bbc
	ldx	[%g1+0x018],%l3	! %l3 = 306ad400324ab889
	ldx	[%g1+0x020],%l4	! %l4 = b8598f001bf4b9f4
	ldx	[%g1+0x028],%l5	! %l5 = 57cdf4ffd27cda19
	ldx	[%g1+0x030],%l6	! %l6 = 568f59ff852ee510
	ldx	[%g1+0x038],%l7	! %l7 = 53f66e0079270aeb

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
	add	%l6,%l1,%l7
	ldx	[%i1+0x090],%l2		! Mem[0000000010800090]
	bl	near2_b2b_l
	srl	%l7,0x000,%l7
	jmpl	%o7,%g0
	xnorcc	%l4,0x923,%l3
p0_near_0_lo:
	add	%l6,%l1,%l7
	ldx	[%o1+0x090],%l2		! Mem[0000000010800090]
	bl	near2_b2b_l
	srl	%l7,0x000,%l7
	jmpl	%o7,%g0
	xnorcc	%l4,0x923,%l3
p0_near_0_he:
	ldx	[%o3+0x000],%l5		! Mem[0000000031800000]
	srax	%l5,0x015,%l7
	ldsb	[%o1+0x00f],%l1		! Mem[000000003080000f]
	std	%l2,[%i3+0x0f8]		! Mem[00000000118000f8]
	sll	%l1,0x015,%l2
	jmpl	%o7,%g0
	lduw	[%i3+0x018],%l5		! Mem[0000000011800018]
p0_near_0_ho:
	ldx	[%i3+0x000],%l5		! Mem[0000000031800000]
	srax	%l5,0x015,%l7
	ldsb	[%i1+0x00f],%l1		! Mem[000000003080000f]
	std	%l2,[%o3+0x0f8]		! Mem[00000000118000f8]
	sll	%l1,0x015,%l2
	jmpl	%o7,%g0
	lduw	[%o3+0x018],%l5		! Mem[0000000011800018]
p1_near_0_le:
	prefetch [%i5+0x100],2
	bcc	near0_b2b_l
	ldsh	[%o0+0x01e],%l0		! Mem[000000003000001e]
	ldsw	[%i0+0x16c],%l7		! Mem[000000001400016c]
	swap	[%i1+0x0d0],%l2		! Mem[00000000148000d0]
	jmpl	%o7,%g0
	prefetch [%i0+0x1a0],23
p1_near_0_lo:
	prefetch [%o5+0x100],2
	bcc	near0_b2b_l
	ldsh	[%i0+0x01e],%l0		! Mem[000000003000001e]
	ldsw	[%o0+0x16c],%l7		! Mem[000000001400016c]
	swap	[%o1+0x0d0],%l2		! Mem[00000000148000d0]
	jmpl	%o7,%g0
	prefetch [%o0+0x1a0],23
p1_near_0_he:
	orcc	%l2,%l6,%l1
	ldsw	[%i0+0x138],%l2		! Mem[0000000014000138]
	prefetch [%i2+0x100],21
	prefetch [%i6+0x160],0
	jmpl	%o7,%g0
	std	%l6,[%i2+0x0a8]		! Mem[00000000150000a8]
p1_near_0_ho:
	orcc	%l2,%l6,%l1
	ldsw	[%o0+0x138],%l2		! Mem[0000000014000138]
	prefetch [%o2+0x100],21
	prefetch [%o6+0x160],0
	jmpl	%o7,%g0
	std	%l6,[%o2+0x0a8]		! Mem[00000000150000a8]
p2_near_0_le:
	ldstub	[%i2+0x1e6],%l3		! Mem[00000000190001e6]
	sth	%l0,[%i0+0x0a0]		! Mem[00000000180000a0]
	subc	%l4,0x529,%l7
	add	%l4,-0xfe3,%l3
	jmpl	%o7,%g0
	udiv	%l5,-0x2e0,%l1
p2_near_0_lo:
	ldstub	[%o2+0x1e6],%l3		! Mem[00000000190001e6]
	sth	%l0,[%o0+0x0a0]		! Mem[00000000180000a0]
	subc	%l4,0x529,%l7
	add	%l4,-0xfe3,%l3
	jmpl	%o7,%g0
	udiv	%l5,-0x2e0,%l1
p2_near_0_he:
	bl	near3_b2b_h
	srlx	%l1,0x023,%l2
	srlx	%l7,%l3,%l3
	andcc	%l0,0xca5,%l1
	orncc	%l5,%l4,%l0
	sdiv	%l3,0x40b,%l5
	jmpl	%o7,%g0
	udiv	%l7,0xbdc,%l0
p2_near_0_ho:
	bl	near3_b2b_h
	srlx	%l1,0x023,%l2
	srlx	%l7,%l3,%l3
	andcc	%l0,0xca5,%l1
	orncc	%l5,%l4,%l0
	sdiv	%l3,0x40b,%l5
	jmpl	%o7,%g0
	udiv	%l7,0xbdc,%l0
p3_near_0_le:
	xnor	%l7,-0x82a,%l1
	be	far2_b2b_l
	orn	%l0,%l7,%l7
	prefetch [%i0+0x080],1
	mulx	%l2,%l0,%l6
	jmpl	%o7,%g0
	xor	%l4,0xebc,%l6
p3_near_0_lo:
	xnor	%l7,-0x82a,%l1
	be	far2_b2b_l
	orn	%l0,%l7,%l7
	prefetch [%o0+0x080],1
	mulx	%l2,%l0,%l6
	jmpl	%o7,%g0
	xor	%l4,0xebc,%l6
p3_near_0_he:
	jmpl	%o7,%g0
	stb	%l1,[%i3+0x0eb]		! Mem[000000001d8000eb]
p3_near_0_ho:
	jmpl	%o7,%g0
	stb	%l1,[%o3+0x0eb]		! Mem[000000001d8000eb]
near0_b2b_h:
	subc	%l5,%l6,%l1
	xorcc	%l1,%l7,%l1
	tsubcc	%l7,-0xbcb,%l7
	jmpl	%o7,%g0
	addcc	%l5,%l0,%l3
near0_b2b_l:
	sdivcc	%l1,0xb7f,%l5
	nop
	sdiv	%l1,0x9f7,%l1
	jmpl	%o7,%g0
	tsubcc	%l5,-0xc4d,%l5
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	prefetch [%i0+0x080],16
	xorcc	%l5,-0x41e,%l1
	jmpl	%o7,%g0
	sllx	%l0,0x002,%l7
p0_near_1_lo:
	prefetch [%o0+0x080],16
	xorcc	%l5,-0x41e,%l1
	jmpl	%o7,%g0
	sllx	%l0,0x002,%l7
p0_near_1_he:
	stw	%l3,[%i0+0x08c]		! Mem[000000001000008c]
	umulcc	%l0,-0xbc5,%l0
	prefetch [%i3+0x040],1
	sllx	%l1,0x02d,%l3
	jmpl	%o7,%g0
	prefetch [%i3+0x0c0],2
p0_near_1_ho:
	stw	%l3,[%o0+0x08c]		! Mem[000000001000008c]
	umulcc	%l0,-0xbc5,%l0
	prefetch [%o3+0x040],1
	sllx	%l1,0x02d,%l3
	jmpl	%o7,%g0
	prefetch [%o3+0x0c0],2
p1_near_1_le:
	prefetch [%i0+0x060],1
	and	%l5,0x384,%l0
	orcc	%l2,%l1,%l3
	prefetch [%i2+0x140],20
	sdivcc	%l7,-0x963,%l7
	jmpl	%o7,%g0
	prefetch [%i4+0x1a0],2
p1_near_1_lo:
	prefetch [%o0+0x060],1
	and	%l5,0x384,%l0
	orcc	%l2,%l1,%l3
	prefetch [%o2+0x140],20
	sdivcc	%l7,-0x963,%l7
	jmpl	%o7,%g0
	prefetch [%o4+0x1a0],2
p1_near_1_he:
	add	%l2,%l2,%l1
	addc	%l2,%l3,%l6
	jmpl	%o7,%g0
	or	%l4,-0x474,%l4
p1_near_1_ho:
	add	%l2,%l2,%l1
	addc	%l2,%l3,%l6
	jmpl	%o7,%g0
	or	%l4,-0x474,%l4
p2_near_1_le:
	ldub	[%o2+0x060],%l5		! Mem[0000000031000060]
	jmpl	%o7,%g0
	ldstub	[%i1+0x198],%l0		! Mem[0000000018800198]
p2_near_1_lo:
	ldub	[%i2+0x060],%l5		! Mem[0000000031000060]
	jmpl	%o7,%g0
	ldstub	[%o1+0x198],%l0		! Mem[0000000018800198]
p2_near_1_he:
	taddcc	%l4,-0xa1e,%l4
	taddcc	%l1,%l2,%l1
	prefetch [%i2+0x180],22
	xnorcc	%l0,%l1,%l4
	jmpl	%o7,%g0
	xnorcc	%l7,0x6c3,%l5
p2_near_1_ho:
	taddcc	%l4,-0xa1e,%l4
	taddcc	%l1,%l2,%l1
	prefetch [%o2+0x180],22
	xnorcc	%l0,%l1,%l4
	jmpl	%o7,%g0
	xnorcc	%l7,0x6c3,%l5
p3_near_1_le:
	andn	%l4,-0xe5e,%l7
	lduh	[%i2+0x132],%l6		! Mem[000000001d000132]
	ldub	[%o5+0x03c],%l6		! Mem[000000004000003c]
	udiv	%l1,-0x8e1,%l6
	jmpl	%o7,%g0
	umulcc	%l1,%l6,%l1
p3_near_1_lo:
	andn	%l4,-0xe5e,%l7
	lduh	[%o2+0x132],%l6		! Mem[000000001d000132]
	ldub	[%i5+0x03c],%l6		! Mem[000000004000003c]
	udiv	%l1,-0x8e1,%l6
	jmpl	%o7,%g0
	umulcc	%l1,%l6,%l1
p3_near_1_he:
	lduh	[%i0+0x14e],%l0		! Mem[000000001c00014e]
	sll	%l6,0x01f,%l7
	sub	%l4,-0xdd4,%l5
	stb	%l1,[%i2+0x1e6]		! Mem[000000001d0001e6]
	sllx	%l5,0x004,%l5
	jmpl	%o7,%g0
	taddcc	%l6,0x270,%l0
p3_near_1_ho:
	lduh	[%o0+0x14e],%l0		! Mem[000000001c00014e]
	sll	%l6,0x01f,%l7
	sub	%l4,-0xdd4,%l5
	stb	%l1,[%o2+0x1e6]		! Mem[000000001d0001e6]
	sllx	%l5,0x004,%l5
	jmpl	%o7,%g0
	taddcc	%l6,0x270,%l0
near1_b2b_h:
	sll	%l6,0x014,%l3
	udivcc	%l2,-0x617,%l3
	srl	%l1,%l4,%l6
	or	%l0,%l4,%l1
	jmpl	%o7,%g0
	sll	%l4,%l6,%l5
near1_b2b_l:
	xnor	%l4,%l3,%l5
	sub	%l0,0x96c,%l4
	subc	%l0,0x420,%l7
	xnorcc	%l0,0xf85,%l6
	jmpl	%o7,%g0
	xnorcc	%l1,%l0,%l2
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	addcc	%l5,%l6,%l5
	xor	%l7,%l7,%l1
	jmpl	%o7,%g0
	and	%l0,%l5,%l4
p0_near_2_lo:
	addcc	%l5,%l6,%l5
	xor	%l7,%l7,%l1
	jmpl	%o7,%g0
	and	%l0,%l5,%l4
p0_near_2_he:
	prefetch [%i2+0x0a0],3
	prefetch [%i0+0x040],22
	xorcc	%l0,0xd05,%l2
	stw	%l5,[%i3+0x09c]		! Mem[000000001180009c]
	udivx	%l4,0x5ef,%l6
	xnorcc	%l5,%l6,%l5
	jmpl	%o7,%g0
	prefetch [%i3+0x080],21
p0_near_2_ho:
	prefetch [%o2+0x0a0],3
	prefetch [%o0+0x040],22
	xorcc	%l0,0xd05,%l2
	stw	%l5,[%o3+0x09c]		! Mem[000000001180009c]
	udivx	%l4,0x5ef,%l6
	xnorcc	%l5,%l6,%l5
	jmpl	%o7,%g0
	prefetch [%o3+0x080],21
p1_near_2_le:
	add	%l1,-0x025,%l5
	sth	%l4,[%o3+0x05c]		! Mem[000000003180005c]
	sll	%l6,%l3,%l4
	jmpl	%o7,%g0
	swap	[%o0+0x058],%l3		! Mem[0000000030000058]
p1_near_2_lo:
	add	%l1,-0x025,%l5
	sth	%l4,[%i3+0x05c]		! Mem[000000003180005c]
	sll	%l6,%l3,%l4
	jmpl	%o7,%g0
	swap	[%i0+0x058],%l3		! Mem[0000000030000058]
p1_near_2_he:
	smulcc	%l6,%l3,%l1
	ldsb	[%o2+0x01e],%l4		! Mem[000000003100001e]
	stx	%l0,[%o1+0x018]		! Mem[0000000030800018]
	jmpl	%o7,%g0
	std	%l2,[%i1+0x0e0]		! Mem[00000000148000e0]
p1_near_2_ho:
	smulcc	%l6,%l3,%l1
	ldsb	[%i2+0x01e],%l4		! Mem[000000003100001e]
	stx	%l0,[%i1+0x018]		! Mem[0000000030800018]
	jmpl	%o7,%g0
	std	%l2,[%o1+0x0e0]		! Mem[00000000148000e0]
p2_near_2_le:
	sdivx	%l7,-0x058,%l6
	prefetch [%i3+0x080],3
	and	%l2,%l4,%l0
	srl	%l6,%l7,%l6
	mulx	%l4,-0xafc,%l5
	jmpl	%o7,%g0
	addcc	%l7,%l5,%l6
p2_near_2_lo:
	sdivx	%l7,-0x058,%l6
	prefetch [%o3+0x080],3
	and	%l2,%l4,%l0
	srl	%l6,%l7,%l6
	mulx	%l4,-0xafc,%l5
	jmpl	%o7,%g0
	addcc	%l7,%l5,%l6
p2_near_2_he:
	jmpl	%o7,%g0
	add	%l4,-0x006,%l1
p2_near_2_ho:
	jmpl	%o7,%g0
	add	%l4,-0x006,%l1
p3_near_2_le:
	and	%l2,%l6,%l0
	jmpl	%o7,%g0
	prefetch [%i3+0x1e0],23
p3_near_2_lo:
	and	%l2,%l6,%l0
	jmpl	%o7,%g0
	prefetch [%o3+0x1e0],23
p3_near_2_he:
	sdivx	%l7,0x6aa,%l0
	lduh	[%o0+0x030],%l0		! Mem[0000000030000030]
	orcc	%l1,0x51d,%l4
	xnor	%l0,-0x0ae,%l5
	umulcc	%l3,%l5,%l6
	jmpl	%o7,%g0
	srl	%l3,%l6,%l1
p3_near_2_ho:
	sdivx	%l7,0x6aa,%l0
	lduh	[%i0+0x030],%l0		! Mem[0000000030000030]
	orcc	%l1,0x51d,%l4
	xnor	%l0,-0x0ae,%l5
	umulcc	%l3,%l5,%l6
	jmpl	%o7,%g0
	srl	%l3,%l6,%l1
near2_b2b_h:
	and	%l1,%l5,%l7
	xnor	%l5,-0x464,%l3
	and	%l2,%l3,%l1
	jmpl	%o7,%g0
	sdiv	%l0,0xe59,%l0
near2_b2b_l:
	orncc	%l7,-0x6da,%l4
	mulx	%l0,0xd8b,%l6
	orn	%l3,%l2,%l3
	jmpl	%o7,%g0
	taddcc	%l6,-0x975,%l0
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	addccc	%l2,0x47c,%l4
	ldsw	[%i3+0x0a8],%l5		! Mem[00000000118000a8]
	sdivx	%l3,0x2b7,%l7
	umul	%l5,-0x848,%l7
	srl	%l5,0x009,%l3
	lduw	[%o0+0x044],%l0		! Mem[0000000030000044]
	jmpl	%o7,%g0
	prefetch [%i1+0x080],22
p0_near_3_lo:
	addccc	%l2,0x47c,%l4
	ldsw	[%o3+0x0a8],%l5		! Mem[00000000118000a8]
	sdivx	%l3,0x2b7,%l7
	umul	%l5,-0x848,%l7
	srl	%l5,0x009,%l3
	lduw	[%i0+0x044],%l0		! Mem[0000000030000044]
	jmpl	%o7,%g0
	prefetch [%o1+0x080],22
p0_near_3_he:
	ldsb	[%i1+0x0a7],%l0		! Mem[00000000108000a7]
	orncc	%l5,0x7ea,%l3
	sll	%l0,%l0,%l6
	ldub	[%i1+0x079],%l6		! Mem[0000000010800079]
	ldd	[%o1+0x000],%l0		! Mem[0000000030800000]
	xorcc	%l4,0xed5,%l0
	jmpl	%o7,%g0
	andcc	%l2,-0xcc0,%l0
p0_near_3_ho:
	ldsb	[%o1+0x0a7],%l0		! Mem[00000000108000a7]
	orncc	%l5,0x7ea,%l3
	sll	%l0,%l0,%l6
	ldub	[%o1+0x079],%l6		! Mem[0000000010800079]
	ldd	[%i1+0x000],%l0		! Mem[0000000030800000]
	xorcc	%l4,0xed5,%l0
	jmpl	%o7,%g0
	andcc	%l2,-0xcc0,%l0
p1_near_3_le:
	prefetch [%i1+0x0a0],23
	lduw	[%i3+0x080],%l3		! Mem[0000000015800080]
	tsubcc	%l0,%l3,%l4
	stw	%l7,[%i0+0x10c]		! Mem[000000001400010c]
	sdivcc	%l7,-0xb88,%l3
	jmpl	%o7,%g0
	ldd	[%i1+0x000],%l6		! Mem[0000000014800000]
p1_near_3_lo:
	prefetch [%o1+0x0a0],23
	lduw	[%o3+0x080],%l3		! Mem[0000000015800080]
	tsubcc	%l0,%l3,%l4
	stw	%l7,[%o0+0x10c]		! Mem[000000001400010c]
	sdivcc	%l7,-0xb88,%l3
	jmpl	%o7,%g0
	ldd	[%o1+0x000],%l6		! Mem[0000000014800000]
p1_near_3_he:
	jmpl	%o7,%g0
	sdiv	%l6,-0x2f5,%l4
p1_near_3_ho:
	jmpl	%o7,%g0
	sdiv	%l6,-0x2f5,%l4
p2_near_3_le:
	addccc	%l5,-0x130,%l7
	xor	%l7,0xf62,%l5
	xnorcc	%l7,-0x726,%l1
	orncc	%l1,0x099,%l7
	jmpl	%o7,%g0
	ldx	[%i0+0x118],%l2		! Mem[0000000018000118]
p2_near_3_lo:
	addccc	%l5,-0x130,%l7
	xor	%l7,0xf62,%l5
	xnorcc	%l7,-0x726,%l1
	orncc	%l1,0x099,%l7
	jmpl	%o7,%g0
	ldx	[%o0+0x118],%l2		! Mem[0000000018000118]
p2_near_3_he:
	smul	%l3,0xda0,%l3
	or	%l5,%l5,%l3
	jmpl	%o7,%g0
	stw	%l7,[%o0+0x060]		! Mem[0000000030000060]
p2_near_3_ho:
	smul	%l3,0xda0,%l3
	or	%l5,%l5,%l3
	jmpl	%o7,%g0
	stw	%l7,[%i0+0x060]		! Mem[0000000030000060]
p3_near_3_le:
	sdivcc	%l7,0x449,%l2
	prefetch [%i1+0x0e0],0
	jmpl	%o7,%g0
	srl	%l4,%l1,%l3
p3_near_3_lo:
	sdivcc	%l7,0x449,%l2
	prefetch [%o1+0x0e0],0
	jmpl	%o7,%g0
	srl	%l4,%l1,%l3
p3_near_3_he:
	jmpl	%o7,%g0
	prefetch [%i3+0x100],16
p3_near_3_ho:
	jmpl	%o7,%g0
	prefetch [%o3+0x100],16
near3_b2b_h:
	addc	%l4,%l0,%l0
	sll	%l7,0x01d,%l2
	orncc	%l4,%l1,%l2
	jmpl	%o7,%g0
	srl	%l7,0x017,%l5
near3_b2b_l:
	sdivcc	%l0,-0x42e,%l1
	srlx	%l0,%l4,%l3
	subc	%l6,-0x22e,%l1
	jmpl	%o7,%g0
	xorcc	%l4,0x43e,%l5
user_near3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far0_start:
p0_far_0_le:
	andcc	%l0,%l3,%l5
	xnorcc	%l0,%l6,%l4
	prefetch [%i3+0x0e0],1
	jmpl	%o7,%g0
	prefetch [%i3+0x0a0],23
p0_far_0_lo:
	andcc	%l0,%l3,%l5
	xnorcc	%l0,%l6,%l4
	prefetch [%o3+0x0e0],1
	jmpl	%o7,%g0
	prefetch [%o3+0x0a0],23
p0_far_0_he:
	add	%l4,%l1,%l2
	umulcc	%l0,-0x4f2,%l4
	umulcc	%l4,%l3,%l4
	addcc	%l7,0xfb4,%l7
	jmpl	%o7,%g0
	addcc	%l2,0xcb8,%l1
p0_far_0_ho:
	add	%l4,%l1,%l2
	umulcc	%l0,-0x4f2,%l4
	umulcc	%l4,%l3,%l4
	addcc	%l7,0xfb4,%l7
	jmpl	%o7,%g0
	addcc	%l2,0xcb8,%l1
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p1_far_0_le:
	sll	%l4,%l7,%l6
	smul	%l0,-0x986,%l6
	lduw	[%o5+0x018],%l5		! Mem[0000000040000018]
	sra	%l0,0x001,%l3
	ldstub	[%o0+0x05d],%l2		! Mem[000000003000005d]
	prefetch [%i0+0x160],3
	jmpl	%o7,%g0
	xnor	%l4,0x7ac,%l2
p1_far_0_lo:
	sll	%l4,%l7,%l6
	smul	%l0,-0x986,%l6
	lduw	[%i5+0x018],%l5		! Mem[0000000040000018]
	sra	%l0,0x001,%l3
	ldstub	[%i0+0x05d],%l2		! Mem[000000003000005d]
	prefetch [%o0+0x160],3
	jmpl	%o7,%g0
	xnor	%l4,0x7ac,%l2
p1_far_0_he:
	xnor	%l6,%l3,%l6
	nop
	jmpl	%o7,%g0
	srax	%l3,0x026,%l7
p1_far_0_ho:
	xnor	%l6,%l3,%l6
	nop
	jmpl	%o7,%g0
	srax	%l3,0x026,%l7
p1_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p2_far_0_le:
	xnorcc	%l7,0xa03,%l7
	andn	%l6,0x632,%l7
	xnor	%l4,%l1,%l3
	orncc	%l6,0x9a5,%l3
	jmpl	%o7,%g0
	nop
p2_far_0_lo:
	xnorcc	%l7,0xa03,%l7
	andn	%l6,0x632,%l7
	xnor	%l4,%l1,%l3
	orncc	%l6,0x9a5,%l3
	jmpl	%o7,%g0
	nop
p2_far_0_he:
	jmpl	%o7,%g0
	stw	%l2,[%i2+0x138]		! Mem[0000000019000138]
p2_far_0_ho:
	jmpl	%o7,%g0
	stw	%l2,[%o2+0x138]		! Mem[0000000019000138]
p2_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p3_far_0_le:
	umul	%l0,%l3,%l6
	stx	%l3,[%i2+0x188]		! Mem[000000001d000188]
	prefetch [%i2+0x0e0],23
	jmpl	%o7,%g0
	umul	%l2,%l7,%l5
p3_far_0_lo:
	umul	%l0,%l3,%l6
	stx	%l3,[%o2+0x188]		! Mem[000000001d000188]
	prefetch [%o2+0x0e0],23
	jmpl	%o7,%g0
	umul	%l2,%l7,%l5
p3_far_0_he:
	jmpl	%o7,%g0
	ldstub	[%i1+0x1d7],%l3		! Mem[000000001c8001d7]
p3_far_0_ho:
	jmpl	%o7,%g0
	ldstub	[%o1+0x1d7],%l3		! Mem[000000001c8001d7]
p3_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	smul	%l6,0x6ef,%l3
far0_b2b_l:
	jmpl	%o7,%g0
	addcc	%l0,%l4,%l4
user_far0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far1_start:
p0_far_1_le:
	andn	%l2,%l1,%l4
	prefetch [%i0+0x040],2
	jmpl	%o7,%g0
	lduh	[%i2+0x078],%l6		! Mem[0000000011000078]
p0_far_1_lo:
	andn	%l2,%l1,%l4
	prefetch [%o0+0x040],2
	jmpl	%o7,%g0
	lduh	[%o2+0x078],%l6		! Mem[0000000011000078]
p0_far_1_he:
	stb	%l3,[%i1+0x0b2]		! Mem[00000000108000b2]
	taddcc	%l6,-0xcf1,%l6
	ldsh	[%i0+0x07e],%l0		! Mem[000000001000007e]
	and	%l5,%l5,%l0
	lduw	[%i1+0x09c],%l2		! Mem[000000001080009c]
	jmpl	%o7,%g0
	prefetch [%i0+0x0e0],0
p0_far_1_ho:
	stb	%l3,[%o1+0x0b2]		! Mem[00000000108000b2]
	taddcc	%l6,-0xcf1,%l6
	ldsh	[%o0+0x07e],%l0		! Mem[000000001000007e]
	and	%l5,%l5,%l0
	lduw	[%o1+0x09c],%l2		! Mem[000000001080009c]
	jmpl	%o7,%g0
	prefetch [%o0+0x0e0],0
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p1_far_1_le:
	prefetch [%i0+0x000],22
	sth	%l1,[%o1+0x01e]		! Mem[000000003080001e]
	xnorcc	%l6,-0x852,%l1
	jmpl	%o7,%g0
	andcc	%l1,-0x429,%l2
p1_far_1_lo:
	prefetch [%o0+0x000],22
	sth	%l1,[%i1+0x01e]		! Mem[000000003080001e]
	xnorcc	%l6,-0x852,%l1
	jmpl	%o7,%g0
	andcc	%l1,-0x429,%l2
p1_far_1_he:
	prefetch [%i1+0x080],21
	jmpl	%o7,%g0
	subc	%l6,%l1,%l2
p1_far_1_ho:
	prefetch [%o1+0x080],21
	jmpl	%o7,%g0
	subc	%l6,%l1,%l2
p1_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p2_far_1_le:
	prefetch [%i3+0x000],3
	lduw	[%i1+0x124],%l1		! Mem[0000000018800124]
	addcc	%l7,%l3,%l7
	prefetch [%i6+0x040],21
	umulcc	%l0,%l7,%l4
	srl	%l5,%l0,%l0
	jmpl	%o7,%g0
	xorcc	%l6,%l5,%l5
p2_far_1_lo:
	prefetch [%o3+0x000],3
	lduw	[%o1+0x124],%l1		! Mem[0000000018800124]
	addcc	%l7,%l3,%l7
	prefetch [%o6+0x040],21
	umulcc	%l0,%l7,%l4
	srl	%l5,%l0,%l0
	jmpl	%o7,%g0
	xorcc	%l6,%l5,%l5
p2_far_1_he:
	andn	%l7,0x748,%l0
	xor	%l5,%l1,%l5
	sllx	%l2,%l4,%l3
	ldx	[%o3+0x060],%l0		! Mem[0000000031800060]
	addcc	%l2,0x1e3,%l5
	andcc	%l5,0xbbe,%l1
	jmpl	%o7,%g0
	prefetch [%i3+0x080],16
p2_far_1_ho:
	andn	%l7,0x748,%l0
	xor	%l5,%l1,%l5
	sllx	%l2,%l4,%l3
	ldx	[%i3+0x060],%l0		! Mem[0000000031800060]
	addcc	%l2,0x1e3,%l5
	andcc	%l5,0xbbe,%l1
	jmpl	%o7,%g0
	prefetch [%o3+0x080],16
p2_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p3_far_1_le:
	std	%l4,[%o3+0x078]		! Mem[0000000031800078]
	udiv	%l4,0x2fe,%l6
	sdiv	%l4,-0xf04,%l4
	udivx	%l5,0xc1e,%l5
	prefetch [%i0+0x000],4
	ldx	[%o1+0x078],%l0		! Mem[0000000030800078]
	jmpl	%o7,%g0
	subccc	%l5,%l7,%l7
p3_far_1_lo:
	std	%l4,[%i3+0x078]		! Mem[0000000031800078]
	udiv	%l4,0x2fe,%l6
	sdiv	%l4,-0xf04,%l4
	udivx	%l5,0xc1e,%l5
	prefetch [%o0+0x000],4
	ldx	[%i1+0x078],%l0		! Mem[0000000030800078]
	jmpl	%o7,%g0
	subccc	%l5,%l7,%l7
p3_far_1_he:
	jmpl	%o7,%g0
	andncc	%l5,0x170,%l3
p3_far_1_ho:
	jmpl	%o7,%g0
	andncc	%l5,0x170,%l3
p3_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	xor	%l2,-0xca6,%l0
	sdiv	%l3,-0xfc0,%l7
	umulcc	%l7,%l3,%l6
	sub	%l4,%l4,%l7
	sra	%l6,%l5,%l4
	jmpl	%o7,%g0
	xnorcc	%l4,%l2,%l7
far1_b2b_l:
	umul	%l7,%l2,%l4
	xorcc	%l1,-0xa1e,%l5
	smul	%l1,-0xed9,%l1
	smul	%l3,%l5,%l1
	xorcc	%l4,%l4,%l7
	jmpl	%o7,%g0
	srlx	%l6,%l6,%l3
user_far1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far2_start:
p0_far_2_le:
	xnor	%l3,0xec1,%l5
	add	%l4,0x09f,%l0
	prefetch [%i0+0x040],2
	srax	%l7,0x03c,%l0
	ldsw	[%o1+0x040],%l3		! Mem[0000000030800040]
	jmpl	%o7,%g0
	xnor	%l7,%l3,%l1
p0_far_2_lo:
	xnor	%l3,0xec1,%l5
	add	%l4,0x09f,%l0
	prefetch [%o0+0x040],2
	srax	%l7,0x03c,%l0
	ldsw	[%i1+0x040],%l3		! Mem[0000000030800040]
	jmpl	%o7,%g0
	xnor	%l7,%l3,%l1
p0_far_2_he:
	and	%l0,-0xa97,%l0
	ldd	[%i1+0x050],%l4		! Mem[0000000010800050]
	ldub	[%i2+0x0a9],%l4		! Mem[00000000110000a9]
	andn	%l2,-0xf3f,%l7
	jmpl	%o7,%g0
	sdivcc	%l1,-0x031,%l2
p0_far_2_ho:
	and	%l0,-0xa97,%l0
	ldd	[%o1+0x050],%l4		! Mem[0000000010800050]
	ldub	[%o2+0x0a9],%l4		! Mem[00000000110000a9]
	andn	%l2,-0xf3f,%l7
	jmpl	%o7,%g0
	sdivcc	%l1,-0x031,%l2
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p1_far_2_le:
	srl	%l1,%l2,%l4
	ldsb	[%i0+0x0c8],%l3		! Mem[00000000140000c8]
	jmpl	%o7,%g0
	sll	%l1,0x013,%l0
p1_far_2_lo:
	srl	%l1,%l2,%l4
	ldsb	[%o0+0x0c8],%l3		! Mem[00000000140000c8]
	jmpl	%o7,%g0
	sll	%l1,0x013,%l0
p1_far_2_he:
	jmpl	%o7,%g0
	addccc	%l7,0x00e,%l1
p1_far_2_ho:
	jmpl	%o7,%g0
	addccc	%l7,0x00e,%l1
p1_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p2_far_2_le:
	prefetch [%i3+0x0c0],4
	sdivx	%l2,0x4da,%l4
	umul	%l2,-0xd57,%l6
	sub	%l6,0x417,%l4
	prefetch [%i1+0x180],22
	taddcc	%l2,%l3,%l4
	jmpl	%o7,%g0
	prefetch [%i6+0x120],2
p2_far_2_lo:
	prefetch [%o3+0x0c0],4
	sdivx	%l2,0x4da,%l4
	umul	%l2,-0xd57,%l6
	sub	%l6,0x417,%l4
	prefetch [%o1+0x180],22
	taddcc	%l2,%l3,%l4
	jmpl	%o7,%g0
	prefetch [%o6+0x120],2
p2_far_2_he:
	sllx	%l3,%l7,%l0
	subc	%l3,0x377,%l3
	tsubcc	%l5,-0x12d,%l5
	jmpl	%o7,%g0
	prefetch [%i3+0x000],20
p2_far_2_ho:
	sllx	%l3,%l7,%l0
	subc	%l3,0x377,%l3
	tsubcc	%l5,-0x12d,%l5
	jmpl	%o7,%g0
	prefetch [%o3+0x000],20
p2_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p3_far_2_le:
	prefetch [%i1+0x0a0],1
	lduh	[%i1+0x124],%l5		! Mem[000000001c800124]
	std	%l0,[%o0+0x038]		! Mem[0000000030000038]
	srl	%l0,%l4,%l3
	sub	%l7,0xf98,%l2
	sub	%l1,%l0,%l1
	jmpl	%o7,%g0
	prefetch [%i3+0x1e0],3
p3_far_2_lo:
	prefetch [%o1+0x0a0],1
	lduh	[%o1+0x124],%l5		! Mem[000000001c800124]
	std	%l0,[%i0+0x038]		! Mem[0000000030000038]
	srl	%l0,%l4,%l3
	sub	%l7,0xf98,%l2
	sub	%l1,%l0,%l1
	jmpl	%o7,%g0
	prefetch [%o3+0x1e0],3
p3_far_2_he:
	ldd	[%o2+0x078],%l2		! Mem[0000000031000078]
	srlx	%l2,0x02c,%l1
	stb	%l4,[%i3+0x01a]		! Mem[000000001d80001a]
	sub	%l1,-0xccd,%l0
	prefetch [%i2+0x180],23
	jmpl	%o7,%g0
	ldx	[%i1+0x0a8],%l5		! Mem[000000001c8000a8]
p3_far_2_ho:
	ldd	[%i2+0x078],%l2		! Mem[0000000031000078]
	srlx	%l2,0x02c,%l1
	stb	%l4,[%o3+0x01a]		! Mem[000000001d80001a]
	sub	%l1,-0xccd,%l0
	prefetch [%o2+0x180],23
	jmpl	%o7,%g0
	ldx	[%o1+0x0a8],%l5		! Mem[000000001c8000a8]
p3_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	xnor	%l6,0x89a,%l2
far2_b2b_l:
	jmpl	%o7,%g0
	xnorcc	%l2,-0x0ab,%l1
user_far2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far3_start:
p0_far_3_le:
	or	%l5,%l5,%l1
	sllx	%l4,0x03d,%l6
	jmpl	%o7,%g0
	prefetch [%i1+0x020],4
p0_far_3_lo:
	or	%l5,%l5,%l1
	sllx	%l4,0x03d,%l6
	jmpl	%o7,%g0
	prefetch [%o1+0x020],4
p0_far_3_he:
	ldx	[%o0+0x008],%l1		! Mem[0000000030000008]
	andncc	%l5,0xc26,%l1
	orncc	%l7,0x685,%l1
	smulcc	%l0,%l6,%l7
	umulcc	%l4,%l4,%l2
	jmpl	%o7,%g0
	lduh	[%i6+0x036],%l7		! Mem[0000000013000036]
p0_far_3_ho:
	ldx	[%i0+0x008],%l1		! Mem[0000000030000008]
	andncc	%l5,0xc26,%l1
	orncc	%l7,0x685,%l1
	smulcc	%l0,%l6,%l7
	umulcc	%l4,%l4,%l2
	jmpl	%o7,%g0
	lduh	[%o6+0x036],%l7		! Mem[0000000013000036]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p1_far_3_le:
	prefetch [%i3+0x0c0],20
	prefetch [%i1+0x0a0],16
	prefetch [%i0+0x060],3
	jmpl	%o7,%g0
	stx	%l2,[%o3+0x018]		! Mem[0000000031800018]
p1_far_3_lo:
	prefetch [%o3+0x0c0],20
	prefetch [%o1+0x0a0],16
	prefetch [%o0+0x060],3
	jmpl	%o7,%g0
	stx	%l2,[%i3+0x018]		! Mem[0000000031800018]
p1_far_3_he:
	orcc	%l4,%l7,%l4
	xor	%l7,%l4,%l1
	prefetch [%i2+0x0a0],20
	prefetch [%i0+0x060],0
	prefetch [%i4+0x0a0],0
	udivcc	%l3,0x134,%l2
	jmpl	%o7,%g0
	ldd	[%o2+0x050],%l0		! Mem[0000000031000050]
p1_far_3_ho:
	orcc	%l4,%l7,%l4
	xor	%l7,%l4,%l1
	prefetch [%o2+0x0a0],20
	prefetch [%o0+0x060],0
	prefetch [%o4+0x0a0],0
	udivcc	%l3,0x134,%l2
	jmpl	%o7,%g0
	ldd	[%i2+0x050],%l0		! Mem[0000000031000050]
p1_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p2_far_3_le:
	prefetch [%i1+0x140],20
	addc	%l5,%l0,%l0
	jmpl	%o7,%g0
	orcc	%l4,%l0,%l4
p2_far_3_lo:
	prefetch [%o1+0x140],20
	addc	%l5,%l0,%l0
	jmpl	%o7,%g0
	orcc	%l4,%l0,%l4
p2_far_3_he:
	orncc	%l4,0xf0d,%l0
	sllx	%l3,%l0,%l5
	jmpl	%o7,%g0
	tsubcc	%l3,%l7,%l3
p2_far_3_ho:
	orncc	%l4,0xf0d,%l0
	sllx	%l3,%l0,%l5
	jmpl	%o7,%g0
	tsubcc	%l3,%l7,%l3
p2_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p3_far_3_le:
	addcc	%l7,0xa1b,%l7
	sllx	%l4,0x01b,%l3
	tsubcc	%l0,%l3,%l4
	prefetch [%i0+0x000],22
	jmpl	%o7,%g0
	addc	%l3,%l1,%l7
p3_far_3_lo:
	addcc	%l7,0xa1b,%l7
	sllx	%l4,0x01b,%l3
	tsubcc	%l0,%l3,%l4
	prefetch [%o0+0x000],22
	jmpl	%o7,%g0
	addc	%l3,%l1,%l7
p3_far_3_he:
	ldstub	[%i0+0x1be],%l2		! Mem[000000001c0001be]
	addccc	%l6,%l4,%l4
	mulx	%l6,%l5,%l4
	srl	%l1,%l6,%l3
	orncc	%l1,%l7,%l5
	jmpl	%o7,%g0
	tsubcc	%l3,0x6a3,%l7
p3_far_3_ho:
	ldstub	[%o0+0x1be],%l2		! Mem[000000001c0001be]
	addccc	%l6,%l4,%l4
	mulx	%l6,%l5,%l4
	srl	%l1,%l6,%l3
	orncc	%l1,%l7,%l5
	jmpl	%o7,%g0
	tsubcc	%l3,0x6a3,%l7
p3_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	andcc	%l4,%l7,%l1
	jmpl	%o7,%g0
	subccc	%l6,%l1,%l6
far3_b2b_l:
	nop
	jmpl	%o7,%g0
	srlx	%l7,%l0,%l3
user_far3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	srlx	%l2,%l6,%l0
p0_call_0_le:
	retl
	prefetch [%i2+0x0c0],21
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	srlx	%l2,%l6,%l0
p0_call_0_lo:
	retl
	prefetch [%o2+0x0c0],21
p0_jmpl_0_he:
	srl	%l1,%l2,%l1
	andcc	%l0,0xe62,%l5
	jmpl	%g6+8,%g0
	srl	%l3,0x01f,%l5
p0_call_0_he:
	ldd	[%o1+0x000],%l6		! Mem[0000000030800000]
	udivcc	%l2,0x158,%l7
	srl	%l3,0x01f,%l2
	stw	%l0,[%o3+0x044]		! Mem[0000000031800044]
	xnorcc	%l4,%l2,%l3
	prefetch [%i3+0x0c0],16
	retl
	andncc	%l7,%l0,%l4
p0_jmpl_0_ho:
	srl	%l1,%l2,%l1
	andcc	%l0,0xe62,%l5
	jmpl	%g6+8,%g0
	srl	%l3,0x01f,%l5
p0_call_0_ho:
	ldd	[%i1+0x000],%l6		! Mem[0000000030800000]
	udivcc	%l2,0x158,%l7
	srl	%l3,0x01f,%l2
	stw	%l0,[%i3+0x044]		! Mem[0000000031800044]
	xnorcc	%l4,%l2,%l3
	prefetch [%o3+0x0c0],16
	retl
	andncc	%l7,%l0,%l4
p1_jmpl_0_le:
	orcc	%l4,0x557,%l6
	orncc	%l0,0xcdf,%l5
	ldsw	[%i3+0x1d4],%l5		! Mem[00000000158001d4]
	jmpl	%g6+8,%g0
	prefetch [%i4+0x060],2
p1_call_0_le:
	ldub	[%i3+0x134],%l3		! Mem[0000000015800134]
	sub	%l0,-0x212,%l1
	and	%l4,-0x7c6,%l7
	retl
	ldsb	[%o2+0x05c],%l0		! Mem[000000003100005c]
p1_jmpl_0_lo:
	orcc	%l4,0x557,%l6
	orncc	%l0,0xcdf,%l5
	ldsw	[%o3+0x1d4],%l5		! Mem[00000000158001d4]
	jmpl	%g6+8,%g0
	prefetch [%o4+0x060],2
p1_call_0_lo:
	ldub	[%o3+0x134],%l3		! Mem[0000000015800134]
	sub	%l0,-0x212,%l1
	and	%l4,-0x7c6,%l7
	retl
	ldsb	[%i2+0x05c],%l0		! Mem[000000003100005c]
p1_jmpl_0_he:
	jmpl	%g6+8,%g0
	sdiv	%l0,-0x2b3,%l5
p1_call_0_he:
	lduw	[%o1+0x050],%l5		! Mem[0000000030800050]
	ldsw	[%o3+0x05c],%l5		! Mem[000000003180005c]
	ldd	[%o2+0x058],%l0		! Mem[0000000031000058]
	ldstub	[%o3+0x059],%l6		! Mem[0000000031800059]
	or	%l4,%l1,%l6
	stx	%l7,[%o2+0x058]		! Mem[0000000031000058]
	retl
	prefetch [%i1+0x040],23
p1_jmpl_0_ho:
	jmpl	%g6+8,%g0
	sdiv	%l0,-0x2b3,%l5
p1_call_0_ho:
	lduw	[%i1+0x050],%l5		! Mem[0000000030800050]
	ldsw	[%i3+0x05c],%l5		! Mem[000000003180005c]
	ldd	[%i2+0x058],%l0		! Mem[0000000031000058]
	ldstub	[%i3+0x059],%l6		! Mem[0000000031800059]
	or	%l4,%l1,%l6
	stx	%l7,[%i2+0x058]		! Mem[0000000031000058]
	retl
	prefetch [%o1+0x040],23
p2_jmpl_0_le:
	sllx	%l5,%l4,%l0
	jmpl	%g6+8,%g0
	sub	%l3,0x321,%l6
p2_call_0_le:
	prefetch [%i6+0x0a0],4
	udivx	%l2,0x516,%l0
	retl
	lduw	[%i2+0x170],%l0		! Mem[0000000019000170]
p2_jmpl_0_lo:
	sllx	%l5,%l4,%l0
	jmpl	%g6+8,%g0
	sub	%l3,0x321,%l6
p2_call_0_lo:
	prefetch [%o6+0x0a0],4
	udivx	%l2,0x516,%l0
	retl
	lduw	[%o2+0x170],%l0		! Mem[0000000019000170]
p2_jmpl_0_he:
	sll	%l4,%l3,%l4
	prefetch [%i0+0x1a0],3
	prefetch [%i3+0x080],2
	andn	%l1,-0x131,%l5
	prefetch [%i2+0x060],4
	jmpl	%g6+8,%g0
	stb	%l0,[%o3+0x062]		! Mem[0000000031800062]
p2_call_0_he:
	orcc	%l2,%l6,%l5
	sdiv	%l3,0x21b,%l7
	sub	%l0,%l0,%l3
	xnorcc	%l1,%l4,%l1
	prefetch [%i1+0x060],0
	tsubcc	%l4,%l7,%l7
	retl
	std	%l4,[%o1+0x060]		! Mem[0000000030800060]
p2_jmpl_0_ho:
	sll	%l4,%l3,%l4
	prefetch [%o0+0x1a0],3
	prefetch [%o3+0x080],2
	andn	%l1,-0x131,%l5
	prefetch [%o2+0x060],4
	jmpl	%g6+8,%g0
	stb	%l0,[%i3+0x062]		! Mem[0000000031800062]
p2_call_0_ho:
	orcc	%l2,%l6,%l5
	sdiv	%l3,0x21b,%l7
	sub	%l0,%l0,%l3
	xnorcc	%l1,%l4,%l1
	prefetch [%o1+0x060],0
	tsubcc	%l4,%l7,%l7
	retl
	std	%l4,[%i1+0x060]		! Mem[0000000030800060]
p3_jmpl_0_le:
	prefetch [%i3+0x120],0
	jmpl	%g6+8,%g0
	andn	%l3,%l7,%l5
p3_call_0_le:
	lduw	[%i2+0x0a0],%l6		! Mem[000000001d0000a0]
	prefetch [%i2+0x0e0],21
	retl
	addcc	%l1,%l0,%l1
p3_jmpl_0_lo:
	prefetch [%o3+0x120],0
	jmpl	%g6+8,%g0
	andn	%l3,%l7,%l5
p3_call_0_lo:
	lduw	[%o2+0x0a0],%l6		! Mem[000000001d0000a0]
	prefetch [%o2+0x0e0],21
	retl
	addcc	%l1,%l0,%l1
p3_jmpl_0_he:
	std	%l2,[%i5+0x128]		! Mem[000000001e800128]
	jmpl	%g6+8,%g0
	udiv	%l5,-0x537,%l3
p3_call_0_he:
	udivx	%l2,0x990,%l0
	retl
	prefetch [%i2+0x020],0
p3_jmpl_0_ho:
	std	%l2,[%o5+0x128]		! Mem[000000001e800128]
	jmpl	%g6+8,%g0
	udiv	%l5,-0x537,%l3
p3_call_0_ho:
	udivx	%l2,0x990,%l0
	retl
	prefetch [%o2+0x020],0
user_jump0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	prefetch [%i1+0x040],2
p0_call_1_le:
	sub	%l1,%l7,%l5
	retl
	stx	%l7,[%o1+0x040]		! Mem[0000000030800040]
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	prefetch [%o1+0x040],2
p0_call_1_lo:
	sub	%l1,%l7,%l5
	retl
	stx	%l7,[%i1+0x040]		! Mem[0000000030800040]
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	andcc	%l5,0x5b8,%l6
p0_call_1_he:
	xnor	%l2,0xc2d,%l5
	tsubcc	%l3,%l3,%l7
	srlx	%l4,0x022,%l4
	ldub	[%i4+0x080],%l5		! Mem[0000000012000080]
	retl
	stw	%l0,[%i0+0x098]		! Mem[0000000010000098]
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	andcc	%l5,0x5b8,%l6
p0_call_1_ho:
	xnor	%l2,0xc2d,%l5
	tsubcc	%l3,%l3,%l7
	srlx	%l4,0x022,%l4
	ldub	[%o4+0x080],%l5		! Mem[0000000012000080]
	retl
	stw	%l0,[%o0+0x098]		! Mem[0000000010000098]
p1_jmpl_1_le:
	ldub	[%o0+0x058],%l7		! Mem[0000000030000058]
	std	%l6,[%o0+0x018]		! Mem[0000000030000018]
	jmpl	%g6+8,%g0
	sdivx	%l6,0xb61,%l0
p1_call_1_le:
	addc	%l7,%l5,%l0
	retl
	andn	%l0,%l4,%l1
p1_jmpl_1_lo:
	ldub	[%i0+0x058],%l7		! Mem[0000000030000058]
	std	%l6,[%i0+0x018]		! Mem[0000000030000018]
	jmpl	%g6+8,%g0
	sdivx	%l6,0xb61,%l0
p1_call_1_lo:
	addc	%l7,%l5,%l0
	retl
	andn	%l0,%l4,%l1
p1_jmpl_1_he:
	sdiv	%l4,0xfe5,%l4
	ldd	[%o0+0x010],%l6		! Mem[0000000030000010]
	or	%l4,-0x21d,%l4
	ldsb	[%o0+0x051],%l0		! Mem[0000000030000051]
	and	%l3,-0x70a,%l6
	prefetch [%i3+0x140],23
	jmpl	%g6+8,%g0
	ldstub	[%o5+0x01a],%l2		! Mem[000000004000001a]
p1_call_1_he:
	or	%l2,%l0,%l0
	tsubcc	%l6,%l6,%l3
	stw	%l1,[%i1+0x1f8]		! Mem[00000000148001f8]
	sll	%l3,%l4,%l7
	retl
	udivcc	%l2,0x1a9,%l1
p1_jmpl_1_ho:
	sdiv	%l4,0xfe5,%l4
	ldd	[%i0+0x010],%l6		! Mem[0000000030000010]
	or	%l4,-0x21d,%l4
	ldsb	[%i0+0x051],%l0		! Mem[0000000030000051]
	and	%l3,-0x70a,%l6
	prefetch [%o3+0x140],23
	jmpl	%g6+8,%g0
	ldstub	[%i5+0x01a],%l2		! Mem[000000004000001a]
p1_call_1_ho:
	or	%l2,%l0,%l0
	tsubcc	%l6,%l6,%l3
	stw	%l1,[%o1+0x1f8]		! Mem[00000000148001f8]
	sll	%l3,%l4,%l7
	retl
	udivcc	%l2,0x1a9,%l1
p2_jmpl_1_le:
	sub	%l0,-0x407,%l2
	prefetch [%i3+0x180],23
	add	%l1,0xaa9,%l2
	sdiv	%l1,0x3f6,%l0
	jmpl	%g6+8,%g0
	swap	[%o2+0x064],%l6		! Mem[0000000031000064]
p2_call_1_le:
	stb	%l0,[%i0+0x0a6]		! Mem[00000000180000a6]
	sth	%l4,[%o1+0x064]		! Mem[0000000030800064]
	std	%l0,[%o3+0x060]		! Mem[0000000031800060]
	mulx	%l2,%l0,%l1
	retl
	andncc	%l2,%l3,%l1
p2_jmpl_1_lo:
	sub	%l0,-0x407,%l2
	prefetch [%o3+0x180],23
	add	%l1,0xaa9,%l2
	sdiv	%l1,0x3f6,%l0
	jmpl	%g6+8,%g0
	swap	[%i2+0x064],%l6		! Mem[0000000031000064]
p2_call_1_lo:
	stb	%l0,[%o0+0x0a6]		! Mem[00000000180000a6]
	sth	%l4,[%i1+0x064]		! Mem[0000000030800064]
	std	%l0,[%i3+0x060]		! Mem[0000000031800060]
	mulx	%l2,%l0,%l1
	retl
	andncc	%l2,%l3,%l1
p2_jmpl_1_he:
	jmpl	%g6+8,%g0
	xor	%l1,%l2,%l6
p2_call_1_he:
	sth	%l6,[%i2+0x102]		! Mem[0000000019000102]
	retl
	nop
p2_jmpl_1_ho:
	jmpl	%g6+8,%g0
	xor	%l1,%l2,%l6
p2_call_1_ho:
	sth	%l6,[%o2+0x102]		! Mem[0000000019000102]
	retl
	nop
p3_jmpl_1_le:
	tsubcc	%l7,-0x71a,%l4
	sub	%l7,%l0,%l2
	ldsb	[%i2+0x031],%l5		! Mem[000000001d000031]
	ldub	[%o2+0x030],%l3		! Mem[0000000031000030]
	stx	%l2,[%o1+0x078]		! Mem[0000000030800078]
	ldx	[%i0+0x060],%l1		! Mem[000000001c000060]
	jmpl	%g6+8,%g0
	prefetch [%i3+0x000],1
p3_call_1_le:
	sll	%l4,0x00a,%l7
	prefetch [%i2+0x120],22
	prefetch [%i1+0x060],4
	sll	%l0,%l7,%l4
	retl
	andn	%l0,-0x8ed,%l6
p3_jmpl_1_lo:
	tsubcc	%l7,-0x71a,%l4
	sub	%l7,%l0,%l2
	ldsb	[%o2+0x031],%l5		! Mem[000000001d000031]
	ldub	[%i2+0x030],%l3		! Mem[0000000031000030]
	stx	%l2,[%i1+0x078]		! Mem[0000000030800078]
	ldx	[%o0+0x060],%l1		! Mem[000000001c000060]
	jmpl	%g6+8,%g0
	prefetch [%o3+0x000],1
p3_call_1_lo:
	sll	%l4,0x00a,%l7
	prefetch [%o2+0x120],22
	prefetch [%o1+0x060],4
	sll	%l0,%l7,%l4
	retl
	andn	%l0,-0x8ed,%l6
p3_jmpl_1_he:
	ldd	[%o1+0x078],%l6		! Mem[0000000030800078]
	jmpl	%g6+8,%g0
	or	%l0,%l0,%l7
p3_call_1_he:
	retl
	xnor	%l5,%l6,%l7
p3_jmpl_1_ho:
	ldd	[%i1+0x078],%l6		! Mem[0000000030800078]
	jmpl	%g6+8,%g0
	or	%l0,%l0,%l7
p3_call_1_ho:
	retl
	xnor	%l5,%l6,%l7
user_jump1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	prefetch [%i3+0x060],20
	prefetch [%i2+0x0a0],2
	sll	%l0,0x018,%l0
	sll	%l2,%l4,%l6
	ldstub	[%o0+0x04c],%l3		! Mem[000000003000004c]
	jmpl	%g6+8,%g0
	sra	%l0,0x005,%l7
p0_call_2_le:
	and	%l0,0x60f,%l1
	sdiv	%l1,0xc86,%l1
	retl
	sdivcc	%l0,0x0e2,%l0
p0_jmpl_2_lo:
	prefetch [%o3+0x060],20
	prefetch [%o2+0x0a0],2
	sll	%l0,0x018,%l0
	sll	%l2,%l4,%l6
	ldstub	[%i0+0x04c],%l3		! Mem[000000003000004c]
	jmpl	%g6+8,%g0
	sra	%l0,0x005,%l7
p0_call_2_lo:
	and	%l0,0x60f,%l1
	sdiv	%l1,0xc86,%l1
	retl
	sdivcc	%l0,0x0e2,%l0
p0_jmpl_2_he:
	ldsw	[%i3+0x088],%l4		! Mem[0000000011800088]
	jmpl	%g6+8,%g0
	sll	%l2,%l0,%l5
p0_call_2_he:
	udivx	%l4,0x118,%l5
	mulx	%l2,%l5,%l6
	prefetch [%i3+0x000],23
	sdiv	%l1,-0x1de,%l7
	retl
	andn	%l7,%l7,%l1
p0_jmpl_2_ho:
	ldsw	[%o3+0x088],%l4		! Mem[0000000011800088]
	jmpl	%g6+8,%g0
	sll	%l2,%l0,%l5
p0_call_2_ho:
	udivx	%l4,0x118,%l5
	mulx	%l2,%l5,%l6
	prefetch [%o3+0x000],23
	sdiv	%l1,-0x1de,%l7
	retl
	andn	%l7,%l7,%l1
p1_jmpl_2_le:
	sra	%l0,0x005,%l2
	sdiv	%l5,-0x2cc,%l6
	prefetch [%i2+0x000],2
	jmpl	%g6+8,%g0
	smulcc	%l1,%l1,%l7
p1_call_2_le:
	smul	%l2,0x3e1,%l5
	orcc	%l5,-0x1c8,%l6
	retl
	xor	%l2,%l4,%l0
p1_jmpl_2_lo:
	sra	%l0,0x005,%l2
	sdiv	%l5,-0x2cc,%l6
	prefetch [%o2+0x000],2
	jmpl	%g6+8,%g0
	smulcc	%l1,%l1,%l7
p1_call_2_lo:
	smul	%l2,0x3e1,%l5
	orcc	%l5,-0x1c8,%l6
	retl
	xor	%l2,%l4,%l0
p1_jmpl_2_he:
	prefetch [%i2+0x1c0],22
	prefetch [%i0+0x1c0],23
	smulcc	%l4,-0x05a,%l5
	jmpl	%g6+8,%g0
	orn	%l0,%l1,%l2
p1_call_2_he:
	or	%l4,-0x90e,%l6
	xor	%l4,%l0,%l2
	sllx	%l5,0x02e,%l4
	stb	%l2,[%o0+0x053]		! Mem[0000000030000053]
	retl
	ldub	[%i1+0x06a],%l6		! Mem[000000001480006a]
p1_jmpl_2_ho:
	prefetch [%o2+0x1c0],22
	prefetch [%o0+0x1c0],23
	smulcc	%l4,-0x05a,%l5
	jmpl	%g6+8,%g0
	orn	%l0,%l1,%l2
p1_call_2_ho:
	or	%l4,-0x90e,%l6
	xor	%l4,%l0,%l2
	sllx	%l5,0x02e,%l4
	stb	%l2,[%i0+0x053]		! Mem[0000000030000053]
	retl
	ldub	[%o1+0x06a],%l6		! Mem[000000001480006a]
p2_jmpl_2_le:
	prefetch [%i2+0x140],21
	subc	%l6,%l3,%l0
	prefetch [%i0+0x0e0],20
	nop
	xnorcc	%l1,-0x61c,%l7
	ldstub	[%o2+0x020],%l4		! Mem[0000000031000020]
	jmpl	%g6+8,%g0
	prefetch [%i0+0x180],20
p2_call_2_le:
	smul	%l5,%l4,%l6
	retl
	ldsh	[%i2+0x1cc],%l5		! Mem[00000000190001cc]
p2_jmpl_2_lo:
	prefetch [%o2+0x140],21
	subc	%l6,%l3,%l0
	prefetch [%o0+0x0e0],20
	nop
	xnorcc	%l1,-0x61c,%l7
	ldstub	[%i2+0x020],%l4		! Mem[0000000031000020]
	jmpl	%g6+8,%g0
	prefetch [%o0+0x180],20
p2_call_2_lo:
	smul	%l5,%l4,%l6
	retl
	ldsh	[%o2+0x1cc],%l5		! Mem[00000000190001cc]
p2_jmpl_2_he:
	prefetch [%i2+0x140],2
	stw	%l4,[%o3+0x068]		! Mem[0000000031800068]
	srax	%l5,%l2,%l1
	prefetch [%i1+0x100],21
	andn	%l5,-0x1f4,%l4
	stw	%l5,[%i5+0x014]		! Mem[000000001a800014]
	jmpl	%g6+8,%g0
	sth	%l2,[%i1+0x0ae]		! Mem[00000000188000ae]
p2_call_2_he:
	stx	%l7,[%o0+0x068]		! Mem[0000000030000068]
	prefetch [%i0+0x100],20
	srl	%l4,%l4,%l3
	nop
	prefetch [%i2+0x000],23
	retl
	ldsh	[%o2+0x06e],%l2		! Mem[000000003100006e]
p2_jmpl_2_ho:
	prefetch [%o2+0x140],2
	stw	%l4,[%i3+0x068]		! Mem[0000000031800068]
	srax	%l5,%l2,%l1
	prefetch [%o1+0x100],21
	andn	%l5,-0x1f4,%l4
	stw	%l5,[%o5+0x014]		! Mem[000000001a800014]
	jmpl	%g6+8,%g0
	sth	%l2,[%o1+0x0ae]		! Mem[00000000188000ae]
p2_call_2_ho:
	stx	%l7,[%i0+0x068]		! Mem[0000000030000068]
	prefetch [%o0+0x100],20
	srl	%l4,%l4,%l3
	nop
	prefetch [%o2+0x000],23
	retl
	ldsh	[%i2+0x06e],%l2		! Mem[000000003100006e]
p3_jmpl_2_le:
	tsubcc	%l1,%l4,%l4
	srl	%l3,0x002,%l4
	sdivx	%l2,-0xf38,%l3
	ldd	[%i2+0x170],%l0		! Mem[000000001d000170]
	jmpl	%g6+8,%g0
	addcc	%l2,%l4,%l0
p3_call_2_le:
	sdiv	%l3,-0x7af,%l0
	smul	%l5,0x53b,%l1
	lduh	[%o2+0x076],%l5		! Mem[0000000031000076]
	xor	%l1,0x4b3,%l3
	andn	%l6,0x959,%l7
	retl
	stx	%l0,[%i6+0x150]		! Mem[000000001f000150]
p3_jmpl_2_lo:
	tsubcc	%l1,%l4,%l4
	srl	%l3,0x002,%l4
	sdivx	%l2,-0xf38,%l3
	ldd	[%o2+0x170],%l0		! Mem[000000001d000170]
	jmpl	%g6+8,%g0
	addcc	%l2,%l4,%l0
p3_call_2_lo:
	sdiv	%l3,-0x7af,%l0
	smul	%l5,0x53b,%l1
	lduh	[%i2+0x076],%l5		! Mem[0000000031000076]
	xor	%l1,0x4b3,%l3
	andn	%l6,0x959,%l7
	retl
	stx	%l0,[%o6+0x150]		! Mem[000000001f000150]
p3_jmpl_2_he:
	xnorcc	%l7,%l3,%l1
	andcc	%l4,%l0,%l3
	jmpl	%g6+8,%g0
	udivcc	%l2,-0xbcf,%l6
p3_call_2_he:
	ldx	[%o0+0x038],%l6		! Mem[0000000030000038]
	stb	%l1,[%o3+0x03f]		! Mem[000000003180003f]
	tsubcc	%l4,-0x030,%l1
	prefetch [%i0+0x100],20
	retl
	sdiv	%l2,0x9d4,%l2
p3_jmpl_2_ho:
	xnorcc	%l7,%l3,%l1
	andcc	%l4,%l0,%l3
	jmpl	%g6+8,%g0
	udivcc	%l2,-0xbcf,%l6
p3_call_2_ho:
	ldx	[%i0+0x038],%l6		! Mem[0000000030000038]
	stb	%l1,[%i3+0x03f]		! Mem[000000003180003f]
	tsubcc	%l4,-0x030,%l1
	prefetch [%o0+0x100],20
	retl
	sdiv	%l2,0x9d4,%l2
user_jump2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	swap	[%o0+0x040],%l0		! Mem[0000000030000040]
	lduw	[%o2+0x040],%l6		! Mem[0000000031000040]
	jmpl	%g6+8,%g0
	tsubcc	%l4,-0x22d,%l0
p0_call_3_le:
	swap	[%i2+0x014],%l7		! Mem[0000000011000014]
	umulcc	%l3,%l6,%l1
	retl
	xor	%l3,%l7,%l3
p0_jmpl_3_lo:
	swap	[%i0+0x040],%l0		! Mem[0000000030000040]
	lduw	[%i2+0x040],%l6		! Mem[0000000031000040]
	jmpl	%g6+8,%g0
	tsubcc	%l4,-0x22d,%l0
p0_call_3_lo:
	swap	[%o2+0x014],%l7		! Mem[0000000011000014]
	umulcc	%l3,%l6,%l1
	retl
	xor	%l3,%l7,%l3
p0_jmpl_3_he:
	xnorcc	%l0,%l2,%l3
	xnorcc	%l7,0xbf1,%l1
	subc	%l7,0x756,%l1
	stb	%l6,[%i1+0x0e2]		! Mem[00000000108000e2]
	subc	%l1,-0x9f3,%l2
	smulcc	%l5,%l4,%l0
	jmpl	%g6+8,%g0
	ldsh	[%o0+0x042],%l6		! Mem[0000000030000042]
p0_call_3_he:
	sdivcc	%l6,-0x7e4,%l7
	orcc	%l4,-0x3ee,%l7
	orn	%l5,-0x3f4,%l0
	sllx	%l0,0x01f,%l6
	retl
	stw	%l0,[%i2+0x05c]		! Mem[000000001100005c]
p0_jmpl_3_ho:
	xnorcc	%l0,%l2,%l3
	xnorcc	%l7,0xbf1,%l1
	subc	%l7,0x756,%l1
	stb	%l6,[%o1+0x0e2]		! Mem[00000000108000e2]
	subc	%l1,-0x9f3,%l2
	smulcc	%l5,%l4,%l0
	jmpl	%g6+8,%g0
	ldsh	[%i0+0x042],%l6		! Mem[0000000030000042]
p0_call_3_ho:
	sdivcc	%l6,-0x7e4,%l7
	orcc	%l4,-0x3ee,%l7
	orn	%l5,-0x3f4,%l0
	sllx	%l0,0x01f,%l6
	retl
	stw	%l0,[%o2+0x05c]		! Mem[000000001100005c]
p1_jmpl_3_le:
	stb	%l2,[%o2+0x016]		! Mem[0000000031000016]
	ldub	[%i2+0x00b],%l3		! Mem[000000001500000b]
	lduw	[%i2+0x010],%l4		! Mem[0000000015000010]
	andncc	%l1,%l3,%l3
	prefetch [%i5+0x1a0],21
	prefetch [%i3+0x140],2
	jmpl	%g6+8,%g0
	sdiv	%l5,-0x112,%l2
p1_call_3_le:
	ldub	[%i3+0x15c],%l2		! Mem[000000001580015c]
	ldub	[%o0+0x05d],%l0		! Mem[000000003000005d]
	prefetch [%i3+0x000],22
	xnorcc	%l7,%l7,%l6
	subc	%l0,%l2,%l1
	xorcc	%l5,%l2,%l6
	retl
	tsubcc	%l2,%l7,%l5
p1_jmpl_3_lo:
	stb	%l2,[%i2+0x016]		! Mem[0000000031000016]
	ldub	[%o2+0x00b],%l3		! Mem[000000001500000b]
	lduw	[%o2+0x010],%l4		! Mem[0000000015000010]
	andncc	%l1,%l3,%l3
	prefetch [%o5+0x1a0],21
	prefetch [%o3+0x140],2
	jmpl	%g6+8,%g0
	sdiv	%l5,-0x112,%l2
p1_call_3_lo:
	ldub	[%o3+0x15c],%l2		! Mem[000000001580015c]
	ldub	[%i0+0x05d],%l0		! Mem[000000003000005d]
	prefetch [%o3+0x000],22
	xnorcc	%l7,%l7,%l6
	subc	%l0,%l2,%l1
	xorcc	%l5,%l2,%l6
	retl
	tsubcc	%l2,%l7,%l5
p1_jmpl_3_he:
	sth	%l4,[%i0+0x048]		! Mem[0000000014000048]
	lduh	[%o1+0x01e],%l4		! Mem[000000003080001e]
	jmpl	%g6+8,%g0
	ldsh	[%o3+0x01c],%l5		! Mem[000000003180001c]
p1_call_3_he:
	srlx	%l1,0x017,%l5
	retl
	addccc	%l4,-0x68e,%l5
p1_jmpl_3_ho:
	sth	%l4,[%o0+0x048]		! Mem[0000000014000048]
	lduh	[%i1+0x01e],%l4		! Mem[000000003080001e]
	jmpl	%g6+8,%g0
	ldsh	[%i3+0x01c],%l5		! Mem[000000003180001c]
p1_call_3_ho:
	srlx	%l1,0x017,%l5
	retl
	addccc	%l4,-0x68e,%l5
p2_jmpl_3_le:
	andn	%l7,0x6df,%l0
	smul	%l7,-0x638,%l6
	srlx	%l3,0x021,%l2
	ldx	[%o2+0x020],%l3		! Mem[0000000031000020]
	prefetch [%i1+0x0e0],16
	jmpl	%g6+8,%g0
	stw	%l5,[%i3+0x134]		! Mem[0000000019800134]
p2_call_3_le:
	addccc	%l4,-0x2bc,%l2
	stb	%l6,[%o0+0x060]		! Mem[0000000030000060]
	stb	%l6,[%o3+0x02d]		! Mem[000000003180002d]
	and	%l2,%l3,%l6
	sub	%l7,-0x1c4,%l5
	xorcc	%l7,%l6,%l4
	retl
	smulcc	%l6,%l6,%l2
p2_jmpl_3_lo:
	andn	%l7,0x6df,%l0
	smul	%l7,-0x638,%l6
	srlx	%l3,0x021,%l2
	ldx	[%i2+0x020],%l3		! Mem[0000000031000020]
	prefetch [%o1+0x0e0],16
	jmpl	%g6+8,%g0
	stw	%l5,[%o3+0x134]		! Mem[0000000019800134]
p2_call_3_lo:
	addccc	%l4,-0x2bc,%l2
	stb	%l6,[%i0+0x060]		! Mem[0000000030000060]
	stb	%l6,[%i3+0x02d]		! Mem[000000003180002d]
	and	%l2,%l3,%l6
	sub	%l7,-0x1c4,%l5
	xorcc	%l7,%l6,%l4
	retl
	smulcc	%l6,%l6,%l2
p2_jmpl_3_he:
	sdivx	%l6,-0x569,%l1
	jmpl	%g6+8,%g0
	or	%l2,-0x527,%l7
p2_call_3_he:
	prefetch [%i3+0x140],0
	sllx	%l3,0x00b,%l2
	prefetch [%i0+0x140],22
	orncc	%l2,0x946,%l5
	xnorcc	%l1,0x55d,%l4
	sub	%l7,%l7,%l2
	retl
	umulcc	%l7,0x2c8,%l7
p2_jmpl_3_ho:
	sdivx	%l6,-0x569,%l1
	jmpl	%g6+8,%g0
	or	%l2,-0x527,%l7
p2_call_3_ho:
	prefetch [%o3+0x140],0
	sllx	%l3,0x00b,%l2
	prefetch [%o0+0x140],22
	orncc	%l2,0x946,%l5
	xnorcc	%l1,0x55d,%l4
	sub	%l7,%l7,%l2
	retl
	umulcc	%l7,0x2c8,%l7
p3_jmpl_3_le:
	sdivx	%l4,0x983,%l7
	jmpl	%g6+8,%g0
	ldsw	[%o1+0x034],%l1		! Mem[0000000030800034]
p3_call_3_le:
	retl
	ldsh	[%i1+0x0a4],%l0		! Mem[000000001c8000a4]
p3_jmpl_3_lo:
	sdivx	%l4,0x983,%l7
	jmpl	%g6+8,%g0
	ldsw	[%i1+0x034],%l1		! Mem[0000000030800034]
p3_call_3_lo:
	retl
	ldsh	[%o1+0x0a4],%l0		! Mem[000000001c8000a4]
p3_jmpl_3_he:
	prefetch [%i1+0x000],0
	std	%l2,[%i0+0x020]		! Mem[000000001c000020]
	stw	%l4,[%o1+0x030]		! Mem[0000000030800030]
	jmpl	%g6+8,%g0
	sth	%l1,[%i2+0x172]		! Mem[000000001d000172]
p3_call_3_he:
	retl
	prefetch [%i1+0x1e0],21
p3_jmpl_3_ho:
	prefetch [%o1+0x000],0
	std	%l2,[%o0+0x020]		! Mem[000000001c000020]
	stw	%l4,[%i1+0x030]		! Mem[0000000030800030]
	jmpl	%g6+8,%g0
	sth	%l1,[%o2+0x172]		! Mem[000000001d000172]
p3_call_3_ho:
	retl
	prefetch [%o1+0x1e0],21
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
	.word	0xaa861aff,0x8236be13		! Init value for %l0
	.word	0xae1911ff,0xb032e3c9		! Init value for %l1
	.word	0xcf9a19ff,0xf6616847		! Init value for %l2
	.word	0xcdd5b600,0x7b8d1713		! Init value for %l3
	.word	0xd6fce6ff,0xf77f0307		! Init value for %l4
	.word	0x65b0ff00,0x315d5fe2		! Init value for %l5
	.word	0x0ec5afff,0xaa1e5890		! Init value for %l6
	.word	0xcc974100,0x351b1e24		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x39e92e2b,0x9e49f91e		! Init value for %f0 
	.word	0x615bb50d,0xd4681fd7		! Init value for %f2 
	.word	0x1f7b741e,0x0a666df0		! Init value for %f4 
	.word	0xf99821d4,0x6b354895		! Init value for %f6 
	.word	0x3fe04a9a,0xf8be37e8		! Init value for %f8 
	.word	0xa9061ce8,0x77225ed2		! Init value for %f10
	.word	0x90050c74,0xc2188a6e		! Init value for %f12
	.word	0x874205a8,0x47ede01c		! Init value for %f14
	.word	0x9908d4e9,0xb79ad666		! Init value for %f16
	.word	0x77da0ad3,0x773c8ab4		! Init value for %f18
	.word	0x0f76be1f,0x52756a9b		! Init value for %f20
	.word	0xc3a009f3,0x26b34d3a		! Init value for %f22
	.word	0xf5ee5231,0x0820bf10		! Init value for %f24
	.word	0xc1bf95ec,0x3167fded		! Init value for %f26
	.word	0xe507c78d,0x8255e17a		! Init value for %f28
	.word	0x82687dd3,0xb6d6f528		! Init value for %f30
	.word	0xe5cfd831,0x8f25e233		! Init value for %f32
	.word	0xad96c3ab,0x358c4796		! Init value for %f34
	.word	0xeb1152ab,0x01291a5d		! Init value for %f36
	.word	0x74a3dec2,0x1357536c		! Init value for %f38
	.word	0x9d03c8da,0xbba3176d		! Init value for %f40
	.word	0x3bb4bcdf,0x75a10566		! Init value for %f42
	.word	0xdb8f4ed6,0xcc13f621		! Init value for %f44
	.word	0xb4cc2857,0xddcc9de6		! Init value for %f46
	.word	0x7204e3f7,0x7a6d63ee
	.word	0x709dd5a1,0x4e8171ad
	.word	0x132bcc16,0xa006a44c
	.word	0x5a84de62,0x43f3388b
	.word	0x07463815,0xd2d152a2
	.word	0xa18ae873,0x15d84e61
	.word	0x29db22c9,0x1035f893
	.word	0xfabda76c,0x25330549
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
	.word	0x00000000,0x62ba88ed
	.word	0x39808cd9,0x463ffa90
	.word	0x94958704,0x47cac4c4
	.word	0xffef6000,0x00000000
	.word	0x36b1c22f,0xaad8e148
	.word	0x86abf634,0x86abf634
	.word	0x00000000,0x00000a01
	.word	0x00000000,0xfffff444
p0_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x3f800000
	.word	0x00000000,0x03800000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x4ed66a90
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000001
	.word	0x00000000,0x00000001
	.word	0x00000000,0x00000000
	.word	0x00000001,0x6b354800
	.word	0x3f800000,0x4ed66a90
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xe5cfd831,0x8f25e233
	.word	0xad96c3ab,0x358c4796
	.word	0xeb1152ab,0x01291a5d
	.word	0x74a3dec2,0x1357536c
	.word	0x9d03c8da,0xbba3176d
	.word	0x3bb4bcdf,0x75a10566
	.word	0xdb8f4ed6,0xcc13f621
	.word	0xb4cc2857,0xddcc9de6
p0_local0_expect:
	.word	0x63f86502,0x00000000
	.word	0xe5340074,0x000064bb
	.word	0x000000b7,0xa048f6fa
	.word	0xe729698a,0x3fefeb2c
	.word	0x34285385,0xda0176ec
	.word	0xc0fc5436,0x228f43cf
	.word	0x00000000,0x00000000
	.word	0xa587394e,0xf1a7f7c6
	.word	0xc0e255a9,0x41e37dac
	.word	0xd230e7de,0xe0f55db6
	.word	0x8bed25bb,0x1b4459a3
	.word	0x4ea42c44,0xa8018b68
	.word	0xf1dc0052,0x2661f391
	.word	0x00000000,0x000000c5
	.word	0x056e0736,0x53ec6315
	.word	0x2756f179,0x7ffff30e
	.word	0x97d2d580,0xdb845697
	.word	0xc59ce959,0x9ef9c5c0
	.word	0x92981006,0x64ab841b
	.word	0x44d04b4e,0x7fffee81
	.word	0x4bb5bb98,0xa36411e8
	.word	0xbc432705,0xc42fead0
	.word	0xf8aa78cd,0x2fa873c0
	.word	0x8f375fdc,0x311b4189
	.word	0x054176fb,0xa2a783fb
	.word	0x4200c80d,0xbe329e4a
	.word	0xe47c3df6,0x588d1cdd
	.word	0x930503a8,0x1fd384d4
	.word	0x662528b5,0x88f902f2
	.word	0xb28f9382,0x5885c8d6
	.word	0x37b6f520,0xc58d0000
	.word	0x00000000,0x00000001
p0_local1_expect:
	.word	0xfff007de,0x6f902ede
	.word	0xff00089f,0x0002d215
	.word	0x23e259ad,0x4dcd57c8
	.word	0x1c2df9ce,0x47dcea36
	.word	0xcdd1b3d9,0x4caf04f6
	.word	0x0b3cc928,0x7f99ca6a
	.word	0x95d4790a,0x2d6c7d05
	.word	0xc296da9e,0xfa6a5820
	.word	0x9283bfd5,0xc256a6e8
	.word	0x1b689d26,0x08ff9b45
	.word	0xf276d9ff,0xd7397d89
	.word	0x00000000,0xff1007de
	.word	0xd0f60d68,0x001c8cbe
	.word	0x3c53b7c8,0xbcb7df59
	.word	0x0e5c6867,0x48be46ca
	.word	0xdb79687e,0xff93fb62
	.word	0xffffffff,0xcf8b51f5
	.word	0x6445e292,0x32d592e3
	.word	0x70ed4f48,0x8cc12faa
	.word	0x045e435c,0x00004200
	.word	0x00005293,0x00000000
	.word	0x6bdd8d1b,0x7f04aa10
	.word	0xcd9b00dc,0x032a00e8
	.word	0xf5a8eaae,0x62ba88ed
	.word	0x61992cd4,0x7bdd52bd
	.word	0x515ad1bc,0x3e054f9e
	.word	0xa08f82ec,0xe58a1f96
	.word	0x1a95040a,0x9275d3ac
	.word	0x5f17043e,0x9c079afd
	.word	0x133ad8b9,0x48c6327c
	.word	0xe277fc28,0xc1c0d1c4
	.word	0x94efe48e,0x308f2b5b
p0_local2_expect:
	.word	0x7565c5e4,0xc30838f2
	.word	0x00000000,0x000016d4
	.word	0x105700f1,0x64be68de
	.word	0x00000000,0x000016d4
	.word	0xddefedba,0x2a65b82e
	.word	0x77787d06,0xd9387072
	.word	0xeb89978e,0x8495449c
	.word	0x0a4536e7,0xb258935e
	.word	0xf4184310,0x4e17dc6a
	.word	0xa7b627b0,0x5c7f9b30
	.word	0xd95be3a8,0xcd9b639c
	.word	0xb2661938,0x04ff07f7
	.word	0xba2eca4e,0xcde26abb
	.word	0x3073d42b,0x35bc2823
	.word	0xf66cb564,0xf5a73f95
	.word	0x543eaed6,0xe766f006
	.word	0x37db3a5b,0xf89dff71
	.word	0x23646f8e,0xb0060cec
	.word	0xffffffff,0x207bd395
	.word	0x05874d3f,0xa1649319
	.word	0xe122e749,0x23f7ac82
	.word	0x6d02fa02,0xef50322d
	.word	0xf6583fa4,0x09f59631
	.word	0x000016d4,0x8a67a9ff
	.word	0x6a5f0087,0x70070000
	.word	0x4503c453,0xf2cea32c
	.word	0x96b615d1,0x32759fe9
	.word	0x0000009f,0x0000c59c
	.word	0x3e7edcd7,0x1536dcff
	.word	0x1d887dc5,0x92971fbf
	.word	0x6fb3b0f5,0x87ca4343
	.word	0xc5528868,0x67948e5b
p0_local3_expect:
	.word	0xfffffb1d,0x76223665
	.word	0x00000000,0xffffff81
	.word	0x0969aa52,0x1cb6a6e3
	.word	0xa048f6fa,0xe07af6ad
	.word	0x01833ae1,0xa9db312b
	.word	0xfcb10966,0x37dcc4af
	.word	0x00027f82,0xf1f6afff
	.word	0xba627357,0x39bbc054
	.word	0x95c287f9,0x281873da
	.word	0x07498a0b,0xcec1054d
	.word	0x829bff3e,0xb3ec0b39
	.word	0xffffa2ff,0xaffd02aa
	.word	0x43ac58da,0xeccf9dd8
	.word	0x1e9a1edf,0x7d8fbb5c
	.word	0x96e633d9,0xb43d92bf
	.word	0x00000760,0x98b062c1
	.word	0x138a5aec,0x78a6cdb7
	.word	0xe7921d81,0xa520ff75
	.word	0xa39a8654,0x04e3a3f8
	.word	0xffffffff,0x93d8beea
	.word	0xccec9797,0x2b89162f
	.word	0x04ff04f6,0xf5acf0f2
	.word	0x8cc12faa,0x733ed055
	.word	0x07ec1a04,0x8b0f674d
	.word	0xc481d55b,0x24795f48
	.word	0x2d0d4c89,0xb3d0891c
	.word	0xb21c82cb,0xc70e2463
	.word	0x79b14677,0xa4fdb2ee
	.word	0xfdb8c54a,0xb2b67686
	.word	0x0295b4c8,0x0030e291
	.word	0xffffffff,0xffffffff
	.word	0x7fffffff,0x00000000
p0_local4_expect:
	.word	0x92713bd8,0x0bb5a74a
	.word	0x2304a442,0x49850e9f
	.word	0x719e0e3c,0x24883b0d
	.word	0x8a019f5e,0xc018e242
	.word	0x76c78f58,0xb21205a9
	.word	0x527ed100,0x0a51a2b5
	.word	0x6968fa0c,0x01f110d6
	.word	0x0c1d360d,0xed20c0ad
	.word	0x2647c419,0x85c24227
	.word	0xcf4b8b3f,0x52d51a49
	.word	0xf5a6fb89,0x6e95d74e
	.word	0x93f82611,0x433bca30
	.word	0x8cc13426,0x00000000
	.word	0x670bd5b4,0xb16f2183
	.word	0x5cde60b9,0x129a8060
	.word	0x4aa5dece,0x630c3f0c
	.word	0x2581a785,0xaa6fe983
	.word	0x210277f9,0x7189b9df
	.word	0x2e280803,0xf5b34f4a
	.word	0x6cc62e1f,0x1d0dafde
	.word	0x27b0a454,0x3d765ab2
	.word	0x084582a6,0x934de2a8
	.word	0x8177b830,0xf55ece06
	.word	0xd72aa316,0x55aa3ae5
	.word	0x66f2eae5,0x6be55140
	.word	0x2be53d36,0xdac6de81
	.word	0xe64ff9cd,0x1f65f32e
	.word	0xa0228b06,0x55fdb4c5
	.word	0xbb130735,0xf2f632c2
	.word	0xd47b486d,0x0ed6e91b
	.word	0x827f5fb3,0x7bbf4c9b
	.word	0x30539013,0x915a1905
p0_local5_expect:
	.word	0x93d8beea,0x6255eb16
	.word	0xeb8e3664,0x0b1a9739
	.word	0xc333df44,0x8b68c9fe
	.word	0xcdf8bf75,0x3d4bc905
	.word	0x35db9a3b,0x4d212225
	.word	0xd4d25312,0x32987166
	.word	0x65160601,0xf255e72f
	.word	0xea74e102,0xdf63cc2c
	.word	0x4427e039,0x77c2da2c
	.word	0xeab0c4bb,0x557865b0
	.word	0x7e24828e,0x07d87dc9
	.word	0xad3448b2,0x95a74b8d
	.word	0x90484356,0x1a600495
	.word	0x8c3d2553,0xc4e4544e
	.word	0x8063f4dd,0x82fcd0c9
	.word	0x391b7592,0x691109ec
	.word	0xb62c8d98,0xcab1a74a
	.word	0xd691d27e,0xa5aa3b52
	.word	0x6a5ba5a8,0x08728aaf
	.word	0x0760eeca,0xa4eab2c7
	.word	0x538bf88f,0x919f0a29
	.word	0xb9535818,0xbc77a516
	.word	0x7c0c0455,0x45db4f75
	.word	0xdbfd01b5,0xe21041b4
	.word	0x8af43cd9,0x79cd3fa1
	.word	0x18c9a898,0xa067fd44
	.word	0x869bb48f,0x39430a3b
	.word	0xe7a62890,0x00663ada
	.word	0xa490e9ff,0x49afc521
	.word	0x6f8dafdb,0x9e6dff2d
	.word	0x6bdfba37,0x1597ed78
	.word	0x0129fc23,0x78c9783a
p0_local6_expect:
	.word	0xbfe4870a,0x78e50fd5
	.word	0xffffffff,0x22934b23
	.word	0xe0b2dfed,0x93f5d6f8
	.word	0x7a41f100,0xe635861d
	.word	0x8cb123f6,0xca9f24b8
	.word	0xfa59a8f7,0x4e9a4401
	.word	0x781ecb88,0xbfdf64bb
	.word	0x42efc1c6,0x417c25a8
	.word	0x30638df0,0x18535633
	.word	0x564e5457,0x0c3453bc
	.word	0x87c5fad4,0x08395542
	.word	0x2311fc27,0xd9d305f5
	.word	0x62c1f21f,0x71b896ee
	.word	0x9f792312,0x1fa51e44
	.word	0xa92fbe89,0xd5e49be6
	.word	0x9ae80b54,0x9d697a01
	.word	0x5fcb7e4c,0xe3056103
	.word	0xe723428b,0x8c4149c7
	.word	0x58b16854,0x73251f14
	.word	0x8f841d6a,0x2e2ec598
	.word	0x111e44b6,0xcd35889f
	.word	0xebf6f2d5,0x2ef64be3
	.word	0xedd69843,0xa294290f
	.word	0x83af3078,0x82bd1c1c
	.word	0xd3461dc4,0xd140b027
	.word	0x749f5f7e,0x6b46ecaf
	.word	0xb79ef998,0xef5fa0ed
	.word	0xfb3ca44d,0xf3b50d0b
	.word	0x2438852b,0x80f8044c
	.word	0x7e8b322e,0xbadebd00
	.word	0x8eab7239,0xf7b25b48
	.word	0x1b192d3f,0x27786495
share0_expect:
	.word	0x74e79c14,0x262c9f8e
	.word	0xcd170073,0x52467d89
	.word	0x95bbff02,0xffffffaf
	.word	0x00000000,0xffffb276
	.word	0xc60f75ff,0xfffffff9
	.word	0x00000000,0x1a6da9b9
	.word	0x1b36e5d4,0xe729811e
	.word	0x000005ff,0x000000ff
	.word	0x00000000,0x00005293
	.word	0x76223665,0xffffffff
	.word	0x00000000,0x00000021
	.word	0x00ffe13e,0xdbff0009
	.word	0xfffffc89,0xa9663cd8
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x103500c9
	.word	0x0f9bee19,0x1d541982
share1_expect:
	.word	0x00005479,0x0000c59c
	.word	0x00000000,0x000a1d71
	.word	0xffff00ff,0xffffaf25
	.word	0x00000000,0x0000000c
	.word	0x00000001,0xffffff92
	.word	0x3a77a677,0xc32bff98
	.word	0xffffffff,0xf38da33f
	.word	0x00001d00,0x0000ff67
	.word	0xffffffff,0x0000ff84
	.word	0x00000000,0x00000760
	.word	0x00001287,0x0004992c
	.word	0xffffffff,0x636dc5d1
	.word	0x00005efd,0x0000fe00
	.word	0xfffffffa,0xe7d38d64
	.word	0x806b575c,0x00000067
	.word	0xffffffff,0xfd7dff00
share2_expect:
	.word	0x74328ebb,0xaa874a85
	.word	0x8b9aff6c,0xe5340074
	.word	0xb4b12fbd,0x0000b1ff
	.word	0xffffffff,0xfeb08a06
	.word	0x00000000,0x000000cd
	.word	0x00000000,0x83922a0b
	.word	0x7fffffff,0xffffffff
	.word	0x00000000,0xff000000
	.word	0x00000000,0xaad8e148
	.word	0x6171d395,0x000d852b
	.word	0x08ff9ca2,0xfffffdff
	.word	0x000000ff,0xffffaff7
	.word	0x9cdbd870,0xffffffff
	.word	0x1483ef38,0x0000ffde
	.word	0xf93502ef,0xf87018d7
	.word	0xffffffff,0x0000ff00
share3_expect:
	.word	0xf4763693,0x1c40ab3e
	.word	0x00840000,0x00000000
	.word	0x00000000,0x0000ff00
	.word	0x00000000,0x00030f59
	.word	0x00000000,0xfd0000c1
	.word	0x9cdb0024,0x00004183
	.word	0x530284a5,0x0000ffcd
	.word	0x103500c9,0x00000001
	.word	0x152f0000,0x1c3dd8b9
	.word	0xffc43955,0xa89260b3
	.word	0xe0d8d112,0x020c630d
	.word	0x00000000,0x020cf845
	.word	0x26162c33,0xeb7d105c
	.word	0x921862f7,0x1a6da939
	.word	0x00000000,0x00000000
	.word	0x80000000,0x2f9e8000
share4_expect:
p1_init_registers:
	.word	0x1ed2de00,0x28404de8		! Init value for %l0
	.word	0xf42ffbff,0xaacb7dba		! Init value for %l1
	.word	0xa883c8ff,0x8608d576		! Init value for %l2
	.word	0x6740a1ff,0xd03b43a8		! Init value for %l3
	.word	0x1eef5c00,0x7ae95f34		! Init value for %l4
	.word	0xa68f8cff,0xcae8058e		! Init value for %l5
	.word	0x6ec379ff,0x82b7dcb9		! Init value for %l6
	.word	0xd2d05100,0x7a043d92		! Init value for %l7
	.align	64
p1_init_freg:
	.word	0xdce5c2f3,0xa2ef2ac7		! Init value for %f0 
	.word	0x83c8059c,0x1687b362		! Init value for %f2 
	.word	0xe2b3c4bf,0x6fb1460a		! Init value for %f4 
	.word	0xca59ed86,0xe7c82ede		! Init value for %f6 
	.word	0x8bd0382e,0xd816a931		! Init value for %f8 
	.word	0x578b91e9,0x637902eb		! Init value for %f10
	.word	0xeabc6fb5,0x1ada3133		! Init value for %f12
	.word	0xff149318,0xcf309c26		! Init value for %f14
	.word	0x87ff6514,0x3b4b47a0		! Init value for %f16
	.word	0xf7e34b21,0x1a1820e2		! Init value for %f18
	.word	0x2e6906d0,0x7d327503		! Init value for %f20
	.word	0x356d8d21,0x2cc72233		! Init value for %f22
	.word	0x8672b502,0x27968572		! Init value for %f24
	.word	0x09b41a16,0x01fe959e		! Init value for %f26
	.word	0x789475bc,0x8b79f0ce		! Init value for %f28
	.word	0xd0e20c0e,0x1e689fdf		! Init value for %f30
	.word	0x77f26e21,0xaef4d6b2		! Init value for %f32
	.word	0x3dfb9302,0x7cf40923		! Init value for %f34
	.word	0x74d35da0,0x04074e2a		! Init value for %f36
	.word	0xd8016908,0x6f9cf951		! Init value for %f38
	.word	0x149dbd61,0xa77d0cb6		! Init value for %f40
	.word	0x9c824161,0x320157e3		! Init value for %f42
	.word	0x0d4457e6,0xe2467971		! Init value for %f44
	.word	0x0c604045,0x281fefd6		! Init value for %f46
	.word	0x97ca7cd0,0xd398e5a9
	.word	0x2d63a1bc,0x62042806
	.word	0xab33c7f3,0xa928911e
	.word	0x0a408a0d,0xeb850025
	.word	0x4665ff33,0xcf0d6ac5
	.word	0xd881e731,0x7c76d311
	.word	0x3486445a,0x6219d88c
	.word	0xe606fe32,0xc593eae6
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
	.word	0x00000000,0xf669aab1
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xfffff8ac
	.word	0x00000000,0x00000060
	.word	0x00000000,0x1311f159
	.word	0x00000000,0x00000000
	.word	0x00000000,0xfffbc47c
	.word	0x00000000,0xf8450800
p1_expected_fp_regs:
	.word	0x00000000,0xe0000000
	.word	0x44000000,0x00000000
	.word	0x00000000,0x4b6b6ce8
	.word	0x00000001,0xefb09c26
	.word	0x7d327503,0xcb6b6ce8
	.word	0x00000000,0xe0000000
	.word	0x80000000,0x00eb6ce8
	.word	0xff149318,0x60000000
	.word	0x00000000,0x00000000
	.word	0xc7a64ea0,0x60000000
	.word	0x00000000,0x00eb6ce8
	.word	0x44000000,0x00000000
	.word	0x00eb6ce8,0x4b6b6ce8
	.word	0xff149318,0xa0000000
	.word	0x47a64ea0,0x60000000
	.word	0x80000000,0x00000000
	.word	0x77f26e21,0xaef4d6b2
	.word	0x3dfb9302,0x7cf40923
	.word	0x74d35da0,0x04074e2a
	.word	0xd8016908,0x6f9cf951
	.word	0x149dbd61,0xa77d0cb6
	.word	0x9c824161,0x320157e3
	.word	0x0d4457e6,0xe2467971
	.word	0x0c604045,0x281fefd6
p1_local0_expect:
	.word	0x00002fbd,0xffffff72
	.word	0x0000b4b1,0x00004658
	.word	0xffffffff,0xbe21e7c6
	.word	0xe5b56b67,0x875ab956
	.word	0x47aba15c,0x463743f4
	.word	0x7468dc52,0x13eb047b
	.word	0xf210ac63,0x06721fbd
	.word	0x16b49228,0x8f294f05
	.word	0xfcbe3eaf,0xf49796cd
	.word	0x858f68ba,0x7f9f2b7e
	.word	0xffffffff,0xffffffff
	.word	0x47942e95,0x38539d9e
	.word	0x829dbdab,0xb54e6e3b
	.word	0x6f1bc0a6,0xe49be709
	.word	0xe586543a,0xc23ed50b
	.word	0x56b6adda,0xcd20166d
	.word	0xeed51c69,0x2dc54464
	.word	0x4da88bbd,0xda72d344
	.word	0xebaec926,0x3e4494ac
	.word	0xed9ff6ff,0x72e2694d
	.word	0xef99361d,0x4f4f80c7
	.word	0x8bc2e89f,0xb0af316d
	.word	0x9e71f218,0xc8f94f9b
	.word	0x41fd62ca,0xcac2993b
	.word	0xdd9a3143,0xfe5210f7
	.word	0x86c41981,0x4f19b9c1
	.word	0x00000000,0x0000ff00
	.word	0xca62ce39,0xafacc57b
	.word	0x22e6d698,0x35aad59a
	.word	0xc3cd0021,0xbce66cb0
	.word	0xffffffaf,0x00001287
	.word	0xc1bf4a14,0x6d272b9e
	.word	0x06a33a07,0x0000ffb1
	.word	0xf669aab1,0x00000000
	.word	0x30a458c7,0x14ee7874
	.word	0xf021fb94,0x8d7125d7
	.word	0x14d97c12,0xbf6eba44
	.word	0x8d37b799,0x8cec6a31
	.word	0x829d47c0,0x18c2c145
	.word	0xffffffff,0x00004008
	.word	0xb52ea91a,0xa89a183a
	.word	0x1dc82a7d,0xf765becf
	.word	0x4f4cada0,0x4510bce5
	.word	0x61986b50,0x61986b50
	.word	0x73deae6e,0x8c925b8a
	.word	0xba164e1b,0x539d10c2
	.word	0x2e4de62a,0xf4e70b90
	.word	0x314fb74b,0xda38c931
	.word	0xeea26d20,0x397724f1
	.word	0x683c8f27,0xae6e8862
	.word	0x57b3b903,0x9ed7371b
	.word	0xebbec764,0xd946921b
	.word	0xd51f45c3,0x4c068eba
	.word	0x450fb721,0x598e1e79
	.word	0x348b3723,0xf788e0dd
	.word	0x231d5e85,0xe95d97f4
	.word	0x00000a19,0xc7ee8923
	.word	0x7518a725,0xf2818e88
	.word	0xc9c607ed,0xca7729bf
	.word	0xa574d4a0,0xa1d7f784
	.word	0x901e20c1,0x4c9ceb21
	.word	0xcae77d3a,0xe449bcce
	.word	0x0004273e,0x2e980000
	.word	0xe3628f19,0x2b70d4af
p1_local1_expect:
	.word	0xfffbc47c,0xf8450800
	.word	0x106805cf,0xdd9d1ad5
	.word	0xabb43520,0x45035597
	.word	0xcb08ced0,0x71a2ed44
	.word	0xd862855a,0xf5e16053
	.word	0x01df8a06,0x10d5ec93
	.word	0x6ec5eaec,0x808a966f
	.word	0xeac7ed01,0xea5794d9
	.word	0x6e57a011,0x00000007
	.word	0x414f1a4a,0xec77ba8e
	.word	0xf2ebf95f,0xd5af118b
	.word	0xbe60cec2,0x0dd15780
	.word	0x00000012,0xd843dd11
	.word	0x374b2155,0xd2dab07a
	.word	0x2a8e6024,0x217babc8
	.word	0x237cfaa7,0xff80296e
	.word	0x10b4d32f,0x566c70e1
	.word	0xc9e7c65b,0xacefaa84
	.word	0xa45252f6,0x3c6af93d
	.word	0x721bbede,0xa6f3e6b4
	.word	0x595830f1,0x3c6ecb08
	.word	0x9b25b80a,0x0000e13e
	.word	0xc64acdcb,0xd6bcc555
	.word	0x3cf38ff2,0xfcaa3e6b
	.word	0x4c8d71e7,0x23b1c0fc
	.word	0x05e5c87c,0xb5a9dd62
	.word	0x1ba08590,0x41277f4a
	.word	0x72c8c0bd,0x5187c0a1
	.word	0x12c7bdf7,0xc5bcf845
	.word	0x39a2062b,0xbe00a75e
	.word	0x20314dcf,0x48bff4e9
	.word	0xe3d80497,0xca0c3824
	.word	0xbdf0e0e0,0x2f4869f3
	.word	0xa4e95180,0x138b068f
	.word	0x93c1d795,0x4b54fcdf
	.word	0x09cff845,0x278f0b20
	.word	0xff862a2a,0x2adf1a8d
	.word	0xe36897b4,0x5b84e42c
	.word	0x00000000,0x0000007f
	.word	0x44a73609,0x02f8f114
	.word	0xf52a368a,0x68db5906
	.word	0x29ff40dd,0xef88a97b
	.word	0x88e464b0,0xd18ca904
	.word	0xbca1031a,0x558dbe07
	.word	0xa0dad79a,0x64dcd75a
	.word	0xe1d5b220,0xffcbb893
	.word	0x5914efbb,0x7d07e1b6
	.word	0x488f2c43,0xffe31d0d
	.word	0xe7f53892,0x0af408b7
	.word	0xd006898a,0x07b8ac41
	.word	0x00cbea0c,0xca1d7c43
	.word	0x03491d4a,0x4314f63e
	.word	0x8b555ebe,0xac8e0453
	.word	0xd1e98eeb,0x72f5867f
	.word	0x2a7932bf,0xa66f07ea
	.word	0x9a2b5400,0xf84558af
	.word	0xfdc1ee6c,0x993e9ca2
	.word	0x00000000,0x003a05a5
	.word	0xf325a249,0x79be02cd
	.word	0x1582667d,0xb6863ff8
	.word	0xa64c92be,0xa2af993a
	.word	0x2470ba12,0x166dd090
	.word	0xf62b7e4f,0x98d5e7b4
	.word	0xd5665b52,0x12b1e242
p1_local2_expect:
	.word	0xffffaab1,0xffffffaf
	.word	0x0c4d0000,0xffffff71
	.word	0x12c7bdf7,0x8053c586
	.word	0xf3b4da0f,0xe4ea69f0
	.word	0x50b62fe9,0xa0ca5417
	.word	0xb67df6c4,0xf22e7bcd
	.word	0xac5fd861,0xf855a2e2
	.word	0x340b2a44,0x536b6bd2
	.word	0x45fb5aaa,0x20058553
	.word	0xfbf5e7cb,0xffa46c85
	.word	0x010d5a5a,0x00000519
	.word	0x00000000,0x00000021
	.word	0x02ecbf92,0x8b658bae
	.word	0x749d040f,0x6d352ec9
	.word	0xefecfbfc,0xd0a6f4e4
	.word	0x650c0170,0xa46b68f0
	.word	0xe6cc94de,0x28a670ed
	.word	0x00000000,0xca3ae0cc
	.word	0x98adacbe,0x6863acf7
	.word	0x6aa37e4b,0x2ee54f5b
	.word	0x17ade110,0xc256c9f3
	.word	0x000000b1,0xffffffe5
	.word	0x975026c8,0xf31ee922
	.word	0x4af33fcb,0x01d11693
	.word	0xfffffce2,0x78534db3
	.word	0x337633b3,0x807d5309
	.word	0xd8702a03,0x8d69645a
	.word	0xd81cc3a9,0x87e94a6c
	.word	0xb338009e,0x9c568279
	.word	0x526de925,0x636abe85
	.word	0x5510ac1e,0x919fafdd
	.word	0x7ebb69da,0xc48a47d3
	.word	0x58955c90,0xb3612c25
	.word	0x02054f65,0x8273d416
	.word	0x0519da0f,0x9f0cb1b8
	.word	0x8f607e05,0x82b91af3
	.word	0xa49b2644,0x307abe47
	.word	0x397e0d96,0xd803dcc5
	.word	0x844f4c33,0x9d2e07fd
	.word	0x8a751532,0xb447501d
	.word	0x75884576,0x28bd60c7
	.word	0x9ece6b50,0x76b6ce85
	.word	0xd0ab24ad,0x51967ed9
	.word	0x0fc4b7ff,0xa6609b55
	.word	0x78334018,0x8a6ec247
	.word	0xa6e207c8,0xce43e962
	.word	0xb8062c0f,0x12b6bc69
	.word	0xdc677a10,0x2fdf5ee4
	.word	0xe9f22168,0xa0f47d23
	.word	0x6cdfb628,0x08cbbf59
	.word	0xaff718e5,0x82b7dcb9
	.word	0x3b54137e,0x5bb0848c
	.word	0x1cc89a39,0x73bb9145
	.word	0xa252c440,0x3d513b5e
	.word	0xe164ff47,0xe9dc7f50
	.word	0x4b4e3d86,0xa61e80bf
	.word	0x7e509e40,0xa92fbacf
	.word	0x9114beea,0xa26b2a3e
	.word	0xade1415a,0xc335a175
	.word	0x187ec223,0x97a79d4f
	.word	0xc9806a55,0x8675b39e
	.word	0x40c0929b,0x4564b6e4
	.word	0xff22c964,0x5a28b51b
	.word	0x00000304,0xc7f3c0a8
p1_local3_expect:
	.word	0xff00020c,0x48bff4e9
	.word	0x0c4d0000,0x000000f7
	.word	0xff5b6598,0x684f1dd3
	.word	0xd803dcc5,0xc5bcf845
	.word	0x94792596,0xfd5c5697
	.word	0x77da7272,0x4d7bc975
	.word	0x47b2b411,0x8bc91ee8
	.word	0xf9e95fea,0x95878b05
	.word	0x21002f89,0xf22323ec
	.word	0x82f85f6b,0x3e3672e4
	.word	0x12cdf6cb,0xe3a9ce5e
	.word	0x743d13fa,0x7b8ce37a
	.word	0xf56eb4cb,0xcb454ac3
	.word	0x8808d42d,0x8564df54
	.word	0xad017548,0x17d7b7d9
	.word	0x5566504e,0xe5ea9438
	.word	0xe357b958,0x300f8880
	.word	0x9d1dabe5,0xcca2d7e6
	.word	0xb4aa181d,0xab55f908
	.word	0xc0b006d9,0x2014a9a8
	.word	0x9b9b2934,0x92712b23
	.word	0x3c9bee83,0x5a6b02a0
	.word	0xe262a6b4,0x10b19b1d
	.word	0x424bbe18,0x64721d99
	.word	0x768afeb9,0x16475353
	.word	0xd759023f,0x6250994f
	.word	0x777e747d,0x84e7c5d3
	.word	0x3d3359ba,0xff7c0cdc
	.word	0xb13ace27,0x000000b0
	.word	0xbeeee956,0xf12e6656
	.word	0x5c03e209,0xef730f6d
	.word	0x158b4c29,0xbb5adf32
	.word	0x4d7ad401,0x358325a1
	.word	0x3f7ebf3f,0xffffd4a5
	.word	0x0a514ce8,0x2e3bf293
	.word	0xeb4aaa8b,0x0431ee50
	.word	0x23314e0e,0x3948bade
	.word	0x9a4c786f,0x0758ff30
	.word	0x8465ebe8,0xd403e659
	.word	0x09201184,0x95ff28d5
	.word	0xac22818f,0xc5bcf845
	.word	0xd1142827,0x75a7e00c
	.word	0x47e28605,0x337f1851
	.word	0x06dbd1ef,0xe407100f
	.word	0x5dc7d5e0,0x9e8fca23
	.word	0x6150eb82,0x0e48cd47
	.word	0x1e4a9b90,0xc437a01c
	.word	0xf9a7e04c,0x4b01609a
	.word	0x31dc1308,0xbd18c18d
	.word	0x9289aba1,0x985d2f1e
	.word	0x5a2caf1a,0x1198878f
	.word	0x2a82d190,0xc8a11567
	.word	0xb13ff60c,0xcac27480
	.word	0x81ecef9d,0x8bc71958
	.word	0x69d2dbc8,0x044ba963
	.word	0x87498146,0xcf208a32
	.word	0x7b50127d,0x30feb35d
	.word	0xdeb2e73a,0x41dcc991
	.word	0xfffffbaf,0x00b095fd
	.word	0x9fa550bf,0x8a7ec74b
	.word	0x55c02faf,0x8979b719
	.word	0x344eb6db,0xb755607b
	.word	0xf3a18146,0x1002f250
	.word	0xa0cb353b,0x8bd1b6db
p1_local4_expect:
	.word	0xffffffff,0x0000594c
	.word	0xa071fa34,0x9a742070
	.word	0xd60ebd4a,0xb8a442f9
	.word	0x723216d3,0x98b97634
	.word	0x0a7fdc8f,0x8a87e64f
	.word	0xb371f11e,0x8f0e4ebd
	.word	0x6cdd58c8,0x1304d032
	.word	0xe620102f,0x7e9110fd
	.word	0x1f570066,0x091620ae
	.word	0xd04c4b9e,0x253e6e1a
	.word	0x6fc1d7ad,0xd39e8431
	.word	0xd2906458,0x3ea679c2
	.word	0x9ad86ed2,0x5c9796c9
	.word	0xa07335bc,0xce6a07d6
	.word	0x9ba97eb3,0xc9419809
	.word	0x232c74b5,0x29164975
	.word	0x7a33f99b,0x2208fab7
	.word	0xe53ad802,0xe9469ce2
	.word	0x833103e4,0xf191e60f
	.word	0xb3721599,0x63d625c4
	.word	0xda4eb244,0x3cb58e7c
	.word	0xc1397894,0x59272c85
	.word	0x0484cb7a,0x843434aa
	.word	0xc9512c34,0xdf02348c
	.word	0xdfcf2703,0xfb7bd709
	.word	0x6a49a3b4,0xfa4e02b5
	.word	0xfd8bec3e,0x29668ff5
	.word	0xaf4080f6,0x17410a83
	.word	0x07aa2446,0xce20c81b
	.word	0x2080ff32,0xfefb1a42
	.word	0x33275b0f,0x4b6d8dfc
	.word	0xccd67aac,0xe93f3813
	.word	0xf1629fcb,0x6c7af434
	.word	0x5abe2d47,0xc40d5b78
	.word	0x6a3bf36e,0x4319be9d
	.word	0x5807e446,0x8d1d431f
	.word	0xfc323bdf,0x9a061c27
	.word	0x4a1a7bfa,0xe0b14ffe
	.word	0xb004dc75,0x552f926d
	.word	0xff4c4763,0x4bf28dd0
	.word	0xcd8d8f7c,0xf848ca0e
	.word	0x08a8a96e,0x81b32788
	.word	0x39a8cd53,0x7a721e61
	.word	0x64e99845,0xde6f3765
	.word	0xeee84c5a,0xf5822516
	.word	0x953a16f5,0xba66fdbe
	.word	0x04d153af,0x0318dc8c
	.word	0x937708eb,0xfc5bec20
	.word	0x50e7f5a2,0x53d05f0a
	.word	0x40fbf134,0x0b71716d
	.word	0xf4737078,0x15cdfc60
	.word	0xaaa0d06e,0x981ae902
	.word	0x7de54ed2,0xbfabf0bc
	.word	0x728734cd,0x08fe1953
	.word	0x182048c5,0xf766294e
	.word	0x294215bc,0x16f556b7
	.word	0x4487179d,0xc0ada76f
	.word	0xc90fa274,0x8b689a19
	.word	0x493681ea,0x84c47b89
	.word	0x76b96340,0x51a73c80
	.word	0xc0e72ea5,0x1179f3da
	.word	0x1bf72137,0xa3ef5eef
	.word	0x51a9e1ed,0x7bcac70d
	.word	0x01a0990c,0xcdfae7a8
p1_local5_expect:
	.word	0xff000000,0x483566fc
	.word	0x46b12ca1,0x00000000
	.word	0xb211bf4f,0xdc46bc75
	.word	0x93fd2b9b,0xd764e7e2
	.word	0x09ba3b31,0xc4f59593
	.word	0xb6706d0a,0xe3908d25
	.word	0xd57c6dbf,0x8e8492e0
	.word	0x7a4d5796,0xbb341d16
	.word	0xf7ab05bf,0x9fba6cd6
	.word	0x01c9efa7,0x4c4eeb0f
	.word	0x7fa6474c,0x8ac0dc86
	.word	0x05f54859,0x7483ce88
	.word	0x85b61f85,0x8e6441f3
	.word	0x3c909b1d,0x2c6bf666
	.word	0x0280658a,0x3988a928
	.word	0x3f9e15ef,0x867a8b9d
	.word	0xa1e75bf0,0xc01029c1
	.word	0xcbb017b0,0xbd85f8ef
	.word	0x04b0ba75,0xcf1a8024
	.word	0x6e2114f1,0x9a6d2319
	.word	0x2bbcb7c7,0xbb3fc3b2
	.word	0xe25a3da5,0x9452ea00
	.word	0xd3a2af7e,0x471bb671
	.word	0x22b2d547,0x5d339a9c
	.word	0xa91a5da2,0xe4962890
	.word	0xaf62d00d,0x6c88464f
	.word	0xc1389554,0xac9bed71
	.word	0xa6e5807f,0xa344f935
	.word	0x89b69e17,0x9cf3486a
	.word	0xfb00de5f,0x455a924d
	.word	0xa55a63b4,0xe367090b
	.word	0xed10054c,0x00b6a493
	.word	0xdeb60524,0xb0dc3442
	.word	0x071f3f82,0xbaccb9b4
	.word	0xc0ce70e5,0x756b2089
	.word	0xfdd234d0,0xed7941cb
	.word	0x421d17c6,0xfa493d84
	.word	0xefd82c80,0xd98b4a84
	.word	0x974f8a4f,0x49eab3f0
	.word	0x23a12217,0x8c2fe7ab
	.word	0x2cfd5147,0xc9a68c2d
	.word	0x11d0409e,0x6ff84280
	.word	0x02eb1ba7,0x708f6148
	.word	0x3f661969,0x0663b95f
	.word	0xd29a2d08,0x1fccefb5
	.word	0x67645d95,0x893c9afd
	.word	0x7c2fdb69,0xb6f99d20
	.word	0xaa300271,0x27790abb
	.word	0xb5360338,0xf551eda1
	.word	0x0ea7546b,0x3a88ddfa
	.word	0xeacdc86c,0xccd9562a
	.word	0x8a664955,0xb2229944
	.word	0xa73fc3cc,0xf8f27d47
	.word	0x55d6ec93,0x9ff71ac6
	.word	0xe7571052,0xd8f892dc
	.word	0xf8c81772,0xc8fa3ddb
	.word	0x3f912a21,0x706456c1
	.word	0x151d571e,0x4ccc23be
	.word	0xf5957dfe,0x7f3e5f7f
	.word	0xef9f4ed1,0x75560112
	.word	0x87c50cde,0xf8d0f23f
	.word	0x36669d5d,0x6c76b0ce
	.word	0x6fe2c7cc,0x4309f0d2
	.word	0xe1f55342,0xcb687128
p1_local6_expect:
	.word	0x66d59baa,0x7cda5c8f
	.word	0x4fcbe1c6,0x3a357ef3
	.word	0x0d0bfc36,0x6d704078
	.word	0xff5a2196,0xe2a82c26
	.word	0xfe335de3,0x749b5326
	.word	0xac0f61cb,0xc62980b0
	.word	0x3c9b049e,0x75788135
	.word	0x0caf2410,0x64a38944
	.word	0x69b4d0e7,0x24bce8e3
	.word	0xdb01f762,0xb36a5f32
	.word	0xa10d6848,0x768d69c0
	.word	0xb1d14c15,0x2a3db353
	.word	0x848cf36c,0x62109519
	.word	0xaaf839ed,0x8fb44f2e
	.word	0xd6da25ad,0xbbb38ced
	.word	0x2705ba00,0xce1dea78
	.word	0xc8c0e925,0xfa53ead5
	.word	0x5ae51cb1,0x99cef680
	.word	0xe1f1fcf2,0x70561378
	.word	0x49f94827,0x939bca9f
	.word	0x48315445,0x2ac434aa
	.word	0x00030f59,0x0000e13e
	.word	0xd6d423bb,0xe1a96bcd
	.word	0xb36211dd,0x7300e403
	.word	0x18225500,0x45e23eea
	.word	0x3f5cac20,0xf5d0140b
	.word	0x4a2ddd4b,0x6c4569f9
	.word	0x323ec58f,0x486f7625
	.word	0x1dfa80b2,0xac0006c8
	.word	0x9f1d9827,0x7fac4125
	.word	0x5c3ec173,0x3ae8cddd
	.word	0x65ea78b8,0x1e0376f3
	.word	0xae7eed9a,0x8170ca0a
	.word	0xee0fff88,0xacbc50cd
	.word	0x286231b8,0x27a6eb65
	.word	0x926535bf,0xfc00a8dd
	.word	0xc8539719,0x4b9cca06
	.word	0x6babb2ac,0x80373d62
	.word	0x160d2b9e,0x94b823cf
	.word	0x63c41921,0xdf22b32e
	.word	0x5c930421,0x02065415
	.word	0x7af32d0d,0xc950bb9d
	.word	0xe3954d49,0xeb1ff3ee
	.word	0x6a368d2d,0xe627a47a
	.word	0x5f21bad0,0x2e8c3927
	.word	0xf03327ac,0x8450d1bb
	.word	0x914ae589,0x28c65aa0
	.word	0xa33c364d,0x94123ae5
	.word	0xc1d2c987,0x8cb46138
	.word	0x2f86713d,0xd469e2da
	.word	0x81b58177,0x4b19de8f
	.word	0x7ef755f3,0x151bea6b
	.word	0x376db809,0x89a86e7f
	.word	0x7a0ca33b,0x8d85627f
	.word	0x3dc26de5,0xb8b2b0ef
	.word	0x8bf09a0e,0x17c77401
	.word	0x52b0dad0,0xf3212229
	.word	0x33f50e8e,0xa70925f4
	.word	0x129c150c,0xd63582aa
	.word	0x39103dac,0x3277b003
	.word	0x11652027,0xa79846cb
	.word	0x077123fd,0xec11cbc7
	.word	0xc128c54a,0xcf8b3fb5
	.word	0xa6c410cc,0x0cb6fb2d
p2_init_registers:
	.word	0xa6ae89ff,0xbde5880a		! Init value for %l0
	.word	0x75663000,0x379fb61d		! Init value for %l1
	.word	0x120d2a00,0x03f46526		! Init value for %l2
	.word	0xb4f8a700,0x71ff9a60		! Init value for %l3
	.word	0xe49d9bff,0x8bffed76		! Init value for %l4
	.word	0xed4e8c00,0x32e95ab4		! Init value for %l5
	.word	0x83614aff,0xe7d392ee		! Init value for %l6
	.word	0xdba10f00,0x390120e7		! Init value for %l7
	.align	64
p2_init_freg:
	.word	0x64685f4b,0x7b238876		! Init value for %f0 
	.word	0xb3efeb7c,0x8115a924		! Init value for %f2 
	.word	0x35d8ee6c,0x4a04b5ea		! Init value for %f4 
	.word	0x95d070f1,0xb41f7767		! Init value for %f6 
	.word	0x9c7efa8b,0xaffdbcb8		! Init value for %f8 
	.word	0xe819b5d5,0x409e7894		! Init value for %f10
	.word	0xb6726aeb,0x5b4c8290		! Init value for %f12
	.word	0xacb202e2,0xf3ff9ba1		! Init value for %f14
	.word	0x990e4d26,0x893d05b5		! Init value for %f16
	.word	0xe082a653,0x95732f11		! Init value for %f18
	.word	0x263dbc5b,0x0f9001f8		! Init value for %f20
	.word	0x73ef9cca,0x356c9db1		! Init value for %f22
	.word	0x6ce9c22b,0x4db3aa32		! Init value for %f24
	.word	0x49fda2d3,0xe0c73091		! Init value for %f26
	.word	0xeaa89486,0x05bff6dc		! Init value for %f28
	.word	0x0cd58137,0x55b44316		! Init value for %f30
	.word	0x424814f4,0xf7b121df		! Init value for %f32
	.word	0xdf99e6e4,0xf5a22506		! Init value for %f34
	.word	0xfe55792b,0xe57fea8c		! Init value for %f36
	.word	0x8eb5c87d,0x55eab8cc		! Init value for %f38
	.word	0xd95bee06,0x61e7912a		! Init value for %f40
	.word	0x6e0a5465,0xefdc1e98		! Init value for %f42
	.word	0x7a89d37c,0xa619c874		! Init value for %f44
	.word	0xf75dcb32,0xaa6aabb1		! Init value for %f46
	.word	0x082c5776,0xdad74c0e
	.word	0x957d87e1,0xb708c5fa
	.word	0x978b0733,0x161123a2
	.word	0x7927f663,0x855174d9
	.word	0x6d13dc0d,0x9e6d59c3
	.word	0x6339017e,0x5adfb87d
	.word	0x2ac5d3d0,0x6cb761ce
	.word	0x45c97dfd,0xd511d168
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
	.word	0xffffffff,0xfffffeff
	.word	0xffffffff,0x00005efd
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000c800
	.word	0x00000000,0x00005efd
	.word	0x00000000,0x0000fe00
	.word	0x00000000,0x0000fe00
	.word	0xffffffff,0xff86c86e
p2_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x41e83800,0x00000000
	.word	0x64e85f4b,0x0f9001f8
	.word	0x00000000,0x448d0be9
	.word	0x0f9001f8,0x448d0be9
	.word	0x80000000,0x00000000
	.word	0x00000000,0xc1c00000
	.word	0x00000000,0x448d0be9
	.word	0x80000000,0x00000000
	.word	0x80000000,0x00000000
	.word	0x80000000,0x00000000
	.word	0xe3185f4b,0x64e85f4b
	.word	0x00000000,0xe4e85f4b
	.word	0x48d6ac53,0x80000000
	.word	0x00000000,0x448d0be9
	.word	0x424814f4,0xf7b121df
	.word	0xdf99e6e4,0xf5a22506
	.word	0xfe55792b,0xe57fea8c
	.word	0x8eb5c87d,0x55eab8cc
	.word	0xd95bee06,0x61e7912a
	.word	0x6e0a5465,0xefdc1e98
	.word	0x7a89d37c,0xa619c874
	.word	0xf75dcb32,0xaa6aabb1
p2_local0_expect:
	.word	0xff7e67d4,0x6ea9ee30
	.word	0x00000000,0x1ab0af8e
	.word	0xb60e9600,0xb61a58c7
	.word	0x92e00161,0x8f3833e2
	.word	0x041d6bcd,0xa9513d2b
	.word	0x4c8fac57,0x6743b5cd
	.word	0x76c05c89,0xc056cbd9
	.word	0xce122a78,0xba7fe471
	.word	0xcc21189d,0x6b8e4284
	.word	0xab2a9c18,0x8bfc2ffe
	.word	0xfd5e0d93,0x8e158ec5
	.word	0x63333af0,0xda3b741d
	.word	0xebac59f4,0x17e52ca8
	.word	0x2b9bc51b,0xcee23f0d
	.word	0x1696f298,0xe96e355a
	.word	0x7cdd90cd,0x472ef1d8
	.word	0x5b40e2c6,0x1e9767c2
	.word	0x4a1d1664,0xf8f89858
	.word	0x8f82bd06,0x0fd3336c
	.word	0x2e683d05,0xcb064a13
	.word	0xd800e072,0xc55cb225
	.word	0xd1767b92,0x6aab4f52
	.word	0xe83e319a,0x56f302bb
	.word	0x36a8d1b7,0x1bce09ff
	.word	0x02c22151,0x590139dd
	.word	0x49c0d1b4,0x8d4ed2ec
	.word	0xe525c132,0x832c5010
	.word	0x0ffd00b2,0xa10780d1
	.word	0x2584b120,0x614180e3
	.word	0xeceaf329,0x3a0ab75c
	.word	0x655a5221,0x134ba10b
	.word	0xff652a2c,0xd7ad5bd6
	.word	0x75c9df71,0xbb4fddb2
	.word	0x00000000,0xc60f75ff
	.word	0x5795ea57,0x407b3632
	.word	0x707e67d4,0x6ea9ee30
	.word	0x4961c0fa,0xfe0d57a6
	.word	0xd49167a8,0x1bf1fe47
	.word	0xd80735db,0xe3657fe1
	.word	0xfe454d8f,0xa1ff22e4
	.word	0xca4975eb,0xdf1718e5
	.word	0xb74ffb54,0x384473cf
	.word	0x2970d696,0x17b5b706
	.word	0x9a8bf965,0x3bc0d97f
	.word	0x0627ae09,0xdd686622
	.word	0x02433f68,0x8bdcda9a
	.word	0x05c3a0bb,0xc96867ea
	.word	0x709a7634,0xae94ed4a
	.word	0x46e393e4,0xeac0e0d3
	.word	0x390120e7,0x8c35f0a5
	.word	0xf9ae0884,0x1b48df16
	.word	0x8dcb7ca2,0x82db6a08
	.word	0x1a434ada,0x9aef305d
	.word	0x31eb7fb4,0x2fd2b5a6
	.word	0xa45bfbd3,0x27fd95da
	.word	0xdd2f1d1f,0xb7c15b87
	.word	0xc1f772b4,0xe427d49d
	.word	0x1384d15d,0xfafb18f5
	.word	0xda0564ed,0x7943796a
	.word	0xfd99fc80,0xc09ba2fb
	.word	0x45a5e8bc,0xa340551e
	.word	0x9edde1af,0xe3f2d8e0
	.word	0x091b0575,0xe6f758ca
	.word	0x7a406c7e,0xfd269739
p2_local1_expect:
	.word	0xfe000000,0xe5925073
	.word	0xa5da654e,0xa5c01cca
	.word	0x0f440e7e,0x9f1f3655
	.word	0x9d804886,0xb233a359
	.word	0x18071128,0x43532833
	.word	0x11c79e3c,0x209ff49a
	.word	0x1b54d4ad,0xa26089a6
	.word	0xdab78876,0x771e799e
	.word	0x65c26355,0x1f86bd6b
	.word	0x9e8ba08e,0x2b3aa1f3
	.word	0xce3902a9,0x7f9f294a
	.word	0x9e9dd758,0x349e5912
	.word	0x8600191b,0x41af9197
	.word	0x4fe7d178,0xa68c49a9
	.word	0xf877b217,0x8a18ce70
	.word	0xf9eb3eaf,0xce50c0b0
	.word	0x71c9030a,0x5a1da192
	.word	0x14e418f1,0x1ba5d064
	.word	0x9748752d,0x5d52446a
	.word	0xce204613,0xc5a7a2c5
	.word	0xe74c7e41,0x5d5b1646
	.word	0xa7866d8e,0x7ce2619e
	.word	0x9b4d7e3e,0xb18fb8f3
	.word	0x0f12077d,0xf0d963b2
	.word	0xf8a1f8de,0xaa5ca3a0
	.word	0xff4944e9,0x9ba2a4ff
	.word	0xdaf1b634,0xce5a0a1b
	.word	0xdaa3e570,0xb8520775
	.word	0x04a1467c,0x532a374a
	.word	0x1d80df8a,0x2b5c5570
	.word	0x2b243716,0x05419f56
	.word	0xee009ea6,0x9c79527c
	.word	0xa9f29d6c,0xb4ace454
	.word	0x6d989821,0x62a8f98b
	.word	0xfffeb81a,0xbac72200
	.word	0xa6482086,0x28a02b93
	.word	0x7ddb83ad,0x1ab0af8e
	.word	0x12b7bc65,0x1e826b81
	.word	0x818391c2,0xab6cc457
	.word	0x8c2dcf80,0x6e2015ed
	.word	0x882d8548,0x90b0b362
	.word	0x9e86f040,0xffffffef
	.word	0x77885a34,0xd1877375
	.word	0xcd21ff2e,0x5ef86b1d
	.word	0x97734ba6,0x0b3a2f93
	.word	0x4ab4ce8a,0x7912cf48
	.word	0x4e96572c,0xcfbc44b4
	.word	0x723d9724,0x37576538
	.word	0x051049e4,0xbd771df6
	.word	0x7dc4ea88,0x63548b57
	.word	0xd2d470d2,0xc11fe6d6
	.word	0xff1d4956,0xfca23d7b
	.word	0x2ebbef9f,0x9b3c6ba8
	.word	0x2149af03,0xcbc56675
	.word	0x9064ad68,0x79b34cbb
	.word	0x628e29cc,0x943fc819
	.word	0xca9ede0e,0x4de787f4
	.word	0x79b16c05,0xffffffff
	.word	0xcb4a80d9,0x4b1884f7
	.word	0x3adf207d,0x903d4bcb
	.word	0x490b4342,0x36d98a66
	.word	0xffffa938,0x5114acd5
	.word	0x0000006e,0x0000cc67
	.word	0x6d044704,0xf8ed0cc1
p2_local2_expect:
	.word	0x00005efd,0x00000000
	.word	0xffffffff,0xffffff33
	.word	0x5e0e24c5,0xb54c34ca
	.word	0x07f03069,0x200bcc5e
	.word	0x14ed8ac9,0x7e9d3751
	.word	0xc8697c80,0xfffffbf5
	.word	0x8e0f7d96,0x29249617
	.word	0x00000000,0xffffffff
	.word	0x31dc1e8e,0xaf9822b0
	.word	0x1d6d4093,0x21636f8b
	.word	0x5fe66426,0x9d8ee9da
	.word	0x573b0dcb,0x9d53071b
	.word	0xc5a528dd,0xeb7d1a02
	.word	0x00000000,0xfffffffa
	.word	0x9102eeb2,0x51db7063
	.word	0x3ce9b932,0x6bf5ddc2
	.word	0xe33869a9,0xc68e93f1
	.word	0x55279682,0x3dccb9f5
	.word	0xac388592,0x2d174a97
	.word	0x41d8d3e8,0xead316d2
	.word	0x41481b7e,0xbefcf0c3
	.word	0x5a2599d2,0x4e14d0d9
	.word	0xe496c720,0xbb034afd
	.word	0x20dfbf8e,0xffffcc94
	.word	0x8be1d371,0x96ed4f33
	.word	0xed9bdb22,0xfc8db7bb
	.word	0x399cfd18,0x89d328f2
	.word	0xff16b9ff,0x43994626
	.word	0x4ea47fb9,0xa337ddb4
	.word	0x43fa14f0,0xfffff52d
	.word	0x1b617115,0x0001b318
	.word	0x2211566b,0xc9da96af
	.word	0xa7d5007e,0xe63509d0
	.word	0x1963f72b,0x5c5a000f
	.word	0x4637761e,0xbf42e603
	.word	0xb4212ccc,0xd5065f48
	.word	0xf6f00ad4,0xcb4e7510
	.word	0x4dd0348a,0x17bfbed5
	.word	0x00000084,0x0a5a619e
	.word	0x51db7063,0x22848af2
	.word	0x3610e89d,0x0947e6ef
	.word	0x65dece6e,0xbd59d30b
	.word	0x98bd0beb,0x8ae727b0
	.word	0x45dd7519,0xb465493c
	.word	0xcb8fcaf5,0xea3d17f1
	.word	0x83922a0b,0xa32d9353
	.word	0xbbfc5100,0xaf846a4c
	.word	0x0674e43a,0xd09b5fc1
	.word	0x7ea21481,0x0b1ee6a0
	.word	0xd7c719f4,0x930c4edc
	.word	0xf727b97a,0x57ee6cb7
	.word	0xa7fb5c05,0x7277d760
	.word	0x97726b00,0x6936bf59
	.word	0xf343b679,0xe29494c2
	.word	0x7bd3942b,0x63dde8cb
	.word	0x6e2bc68d,0x021accfc
	.word	0x1f89361c,0xf182e5de
	.word	0x79695c48,0x32dc5dd0
	.word	0xc7273467,0xf29bff96
	.word	0xffffffff,0xffffff92
	.word	0x5c4500a8,0x249bff46
	.word	0x54eb360b,0xaae2d4db
	.word	0x1ed2db16,0x4adcca7b
	.word	0x7f02ac93,0xf41f5273
p2_local3_expect:
	.word	0x000032dc,0xc4560715
	.word	0x00000000,0x00000000
	.word	0x00000000,0xa174e808
	.word	0x9519c74b,0x3d64598c
	.word	0xaf401f04,0x5f339e15
	.word	0x8cfd205a,0x7e7bf6c5
	.word	0x50fbff16,0x5f97b394
	.word	0xb058e297,0x725c89d9
	.word	0x42e9d279,0xebe25987
	.word	0x992de0a9,0xf5061198
	.word	0x31a3451a,0x2ea98ed1
	.word	0x1cdd29bc,0xb9794c79
	.word	0xffff2674,0x94383fcf
	.word	0x3184477e,0x60e16ffa
	.word	0x129ddcd4,0x9b16615e
	.word	0x24755056,0xbb39d2f7
	.word	0x5cbafed0,0xd18273b4
	.word	0x7faa41c4,0x815a7c39
	.word	0xd915e508,0x3d417fc4
	.word	0x00000000,0x00000000
	.word	0xd5a4386b,0x88e9e0a1
	.word	0xd7427a42,0x61ad833e
	.word	0x80ed2929,0x5e718c41
	.word	0x0f7d4533,0x1ae92e6e
	.word	0xb68116f7,0x2429057c
	.word	0x8aa79cce,0xf5d4e7da
	.word	0x88afa2ff,0xffd41d70
	.word	0xba1ea2bc,0xa177d27f
	.word	0xcfb13c9d,0xbebbedd1
	.word	0xbe7d943b,0xe5a86755
	.word	0x5ea647ab,0xaaa41204
	.word	0x7df68d8f,0x1f4ece41
	.word	0x4d89b0f5,0x0c6ea1c2
	.word	0x1859c052,0x524c55f5
	.word	0x3d5b199b,0x636d3599
	.word	0x0a5af23d,0x51aa4420
	.word	0x00000000,0xffffffff
	.word	0x781c6541,0x4383c998
	.word	0x787cf05e,0x17ff73cb
	.word	0x95b2316e,0x291a7c94
	.word	0xb8f065ea,0x61062e07
	.word	0xdc0d8cd3,0x12ea854e
	.word	0xd132e581,0xa1835866
	.word	0x186fca20,0x4fe21ec9
	.word	0x2667b258,0x4d63bf0c
	.word	0x2b406102,0x9085f665
	.word	0x7b0d1060,0xd5477e2f
	.word	0xdaffa29d,0x41f10db2
	.word	0x05fb285a,0x330ebde3
	.word	0xd1265475,0xf8ab097b
	.word	0x09ea8b50,0xbea6982d
	.word	0x150c0268,0x8f3df7f3
	.word	0xc3a75d31,0x31195f39
	.word	0x5ec04504,0x5ad864b5
	.word	0xbf5cc1ef,0x0ba7f434
	.word	0x68c5d547,0xb1836113
	.word	0xeb7d105c,0x166a0b6e
	.word	0x9b5eac89,0xcedea44c
	.word	0x4fbb910c,0x9c15297d
	.word	0xa237b170,0xc4560715
	.word	0xeaba4551,0x07e0ffb6
	.word	0x1ba3182d,0x2d6f293a
	.word	0x4bd734ef,0x39541d69
	.word	0x788cfd55,0x0f9d3e38
p2_local4_expect:
	.word	0xceaf99b4,0x6d52136a
	.word	0xffffffff,0xf67e5922
	.word	0x0946d5b1,0xca551851
	.word	0xf9f5c68e,0x948eeb83
	.word	0x3c62ca74,0xa64e8375
	.word	0x619143c4,0xc4949e1f
	.word	0x8f94c3de,0xf8e8a7ea
	.word	0xc79c9d45,0x94db3a48
	.word	0xfc996888,0xf5197136
	.word	0xef2b2549,0x9a3bd635
	.word	0xcec454f4,0x1ae72a7c
	.word	0x3f510e4c,0x584911c2
	.word	0xca114999,0x9c728923
	.word	0x9b39c086,0x43a4e451
	.word	0xce4d80ea,0xa47cc557
	.word	0x49c8817d,0xb2921e29
	.word	0x08d38152,0x9aa89abe
	.word	0x68d06ed6,0xdccce676
	.word	0xfc8d49da,0x66a6018d
	.word	0x0a0d1951,0x424c9ba8
	.word	0x6cdba526,0xdbf251c8
	.word	0x4ec4304d,0x03262751
	.word	0x1035bd54,0x05f5e4c7
	.word	0xa67068c8,0x293f6076
	.word	0x24d1b791,0x1f409395
	.word	0xe6588029,0x3f95fa92
	.word	0xb9d925bd,0x1e522bea
	.word	0xed9fac4e,0xd171a8b9
	.word	0x76af32dd,0xdc0a2180
	.word	0x0099e51a,0x65edd242
	.word	0xfda3517a,0x6a77ce1f
	.word	0x231af9fa,0x17d066bc
	.word	0xc15733cb,0xb3d7fb33
	.word	0x7707a95d,0x81bf4877
	.word	0x607bf384,0x15923509
	.word	0x60e48974,0x9416c0e6
	.word	0xcc2b0da4,0xf2e9ad7c
	.word	0xdf07a3d8,0xd314ff8d
	.word	0xa2efa208,0xc0ba2534
	.word	0xb839a563,0xfc57a68e
	.word	0x129a5701,0xa0f64f62
	.word	0x14d00d66,0xee494b79
	.word	0x33db45bb,0xb3b9f19c
	.word	0x8032fbe5,0xeb9d6b82
	.word	0x65b515c8,0x889ab1c9
	.word	0x9354939d,0xb8398f72
	.word	0x3c475d43,0x46815927
	.word	0x3baca396,0x5d630074
	.word	0x2a502b16,0xfe4a2a76
	.word	0x890179b0,0xa3bbcbc6
	.word	0x36a347d2,0x4afec71b
	.word	0x2d40ac84,0x9fbc7dc1
	.word	0xe5bfdbff,0xbffffd77
	.word	0x709f11e1,0x786af81e
	.word	0x16910f26,0x50727f0b
	.word	0x8b2aa3db,0x3b909ef5
	.word	0x44624ab6,0x4e4a122e
	.word	0xc4bd321b,0xc7a3f371
	.word	0x812174d7,0x1baa8784
	.word	0x597fef0a,0x021d7e08
	.word	0x8608a830,0x58726fff
	.word	0x39c0ddf6,0x637873f6
	.word	0x366634e3,0xaf88a659
	.word	0x991cdd40,0x7a3ecdaf
p2_local5_expect:
	.word	0x375e539a,0xf951727c
	.word	0xfffffb92,0xc10b5002
	.word	0xf1e15c3b,0xe49d9bff
	.word	0xe0d694cc,0x77321b2c
	.word	0xa8f3f463,0x97adb46e
	.word	0x553cba09,0x77c67f95
	.word	0x04c0ace5,0x91c3cd8a
	.word	0x83470ddd,0xd2b879dc
	.word	0xfb8eee77,0xdca1a58c
	.word	0xb9b87587,0xb1916db2
	.word	0x9343f815,0xe659ad87
	.word	0x5be24463,0x52a9287e
	.word	0x2f4a795f,0xcb85223f
	.word	0xd09c5d91,0xa36b31f4
	.word	0x83982aa4,0x710ed21d
	.word	0x7a6230b7,0xba29bcf9
	.word	0x05795472,0x1bcc8a57
	.word	0x00ee85d4,0x0ec8f93b
	.word	0xa0360b40,0xc890186a
	.word	0x15c8f956,0xa00b3f8a
	.word	0xfa473ff6,0xde50a0bd
	.word	0x06b1601e,0x272a35fe
	.word	0x56489cef,0x012dc1c4
	.word	0xd64ef275,0x9e0541d5
	.word	0x71ff8de2,0x3e23a701
	.word	0x1329da16,0x7b1234bf
	.word	0x818bc0df,0x8198ac9a
	.word	0xa96b37b3,0xc8ef6aab
	.word	0xfc015bed,0x57c15590
	.word	0x1a3a4d3a,0x847ac0ee
	.word	0x4e7d070a,0x60094cf1
	.word	0x318afdcf,0x6a11f5e7
	.word	0xeab254d3,0xf704c628
	.word	0x3c2f97c4,0xe09a13a0
	.word	0x1cd06d32,0x539e7cba
	.word	0xbcb4005e,0x34a6dd4e
	.word	0xc41e286e,0x80a59458
	.word	0xdf154a0d,0xc62fe4d3
	.word	0xb671cf59,0x161f96d7
	.word	0x202e22ea,0xa4d05e7a
	.word	0x003e3486,0xdee6e188
	.word	0xbb5baa2b,0xf80a876f
	.word	0x7c999ea3,0xa97e2902
	.word	0xe3c2b8ae,0x81210fcd
	.word	0x7c8b8b0e,0xfcf77d86
	.word	0x8c97558c,0x4d460a74
	.word	0x10c0a75d,0xdb48218d
	.word	0x2ac767ca,0xcaee5365
	.word	0xf57cb98b,0x08c8859b
	.word	0x3b3fba16,0x69d94293
	.word	0xfb591633,0xf922b97a
	.word	0x63924e45,0x4136451f
	.word	0x860f7d6d,0x21ea0a2f
	.word	0x1126a15e,0xe93e1b1e
	.word	0x856484ef,0x13c0c3e2
	.word	0x08369434,0xb9f7e429
	.word	0x9ada0af5,0x784d69d5
	.word	0x6119916f,0x5738b2c4
	.word	0x078efd5d,0xfadb0d25
	.word	0x4a471107,0xddeb4d75
	.word	0x4543baa9,0x4aff6dce
	.word	0x467f5088,0xfebf3ca2
	.word	0x62f8dfb8,0x9175c630
	.word	0xd30c49cc,0x1be2644b
p2_local6_expect:
	.word	0xa938917f,0x8546c74d
	.word	0xa174e808,0xfc13a031
	.word	0xe1ed3611,0x42b44887
	.word	0x80884f1a,0x7171f3ec
	.word	0xba87bca2,0x0523a5aa
	.word	0x188af3e7,0x9e0188a2
	.word	0xe852dc71,0xc7eda62c
	.word	0xe458080c,0x1fd46bdf
	.word	0x99a8c298,0x1af18b9a
	.word	0x45d6f79f,0xa8c3a9a6
	.word	0x54b9d7e2,0xb24997e8
	.word	0x6f0e14ca,0x0ddafcc0
	.word	0xaa86ddcf,0x08503c77
	.word	0x9e502bf7,0xe833e1d5
	.word	0x573d7b2b,0x6aff6c85
	.word	0xfb2a39d9,0x36a33a63
	.word	0xd3d3b852,0xfb5c1b31
	.word	0x52333f89,0x8debf281
	.word	0x39279d05,0x5b88bca7
	.word	0x353d4cdd,0x5f9d0f5c
	.word	0x0eace972,0x39a156e2
	.word	0x904ef66c,0x214909f1
	.word	0xfcee5439,0xb7a4198f
	.word	0x3c1edb3b,0x5d02a2e3
	.word	0xc193eeb0,0x0868a35e
	.word	0x4367314c,0x37d967a4
	.word	0x32daf328,0x24241301
	.word	0x6d40e553,0xf336b072
	.word	0x19ae6390,0x0f47de0e
	.word	0x0fbdfc4d,0xbb0c0813
	.word	0xb9bbf7f6,0xec774439
	.word	0x1d22cf76,0x31317b1f
	.word	0x05a0fd31,0xa8362e80
	.word	0xc5bfb73d,0x960987af
	.word	0x582cff90,0x25a77e4b
	.word	0x98946f6d,0x990ff089
	.word	0x752263d3,0x8f866e99
	.word	0x7b498b97,0x15d7d346
	.word	0xf16aad70,0x22bd509f
	.word	0x18f358dc,0x7999394c
	.word	0x7b33bb1b,0xcf3c53eb
	.word	0x1f479611,0xf34eaede
	.word	0xc30eaf6b,0xbfa24c25
	.word	0x2db0c107,0x1acd43b6
	.word	0x24ea9b07,0xcfe924da
	.word	0x7eac92bd,0xffddca8c
	.word	0x143104a0,0x5396e913
	.word	0x4649e1c9,0xaa51a8ca
	.word	0x88953e2c,0x9635c61d
	.word	0xd6a09890,0x1757d09e
	.word	0xbb0fb704,0xc0db1535
	.word	0xf13978d3,0x9f4ac426
	.word	0x8f0968bb,0xf1724558
	.word	0xe13d72e2,0xcae4a745
	.word	0x0972820f,0x07ac14ff
	.word	0xf997a438,0xb312b8bd
	.word	0x1a51143e,0x32c01ee1
	.word	0x16179935,0x926b9d8b
	.word	0x33bf8983,0x714ff805
	.word	0x09b61aeb,0xe62fec10
	.word	0xfda3658d,0x866564bf
	.word	0xd67952cd,0x33d4c691
	.word	0x422e563d,0xececfc15
	.word	0x311d93f9,0xeb9570f9
p3_init_registers:
	.word	0x5dc2c700,0x24a95a62		! Init value for %l0
	.word	0xbd32db00,0x32e9ee8d		! Init value for %l1
	.word	0x0d71b100,0x1d010bbc		! Init value for %l2
	.word	0x306ad400,0x324ab889		! Init value for %l3
	.word	0xb8598f00,0x1bf4b9f4		! Init value for %l4
	.word	0x57cdf4ff,0xd27cda19		! Init value for %l5
	.word	0x568f59ff,0x852ee510		! Init value for %l6
	.word	0x53f66e00,0x79270aeb		! Init value for %l7
	.align	64
p3_init_freg:
	.word	0xffeb2f8f,0x752f01ee		! Init value for %f0 
	.word	0x98611fab,0x0b8d649d		! Init value for %f2 
	.word	0x6e9d30af,0x70eeda2e		! Init value for %f4 
	.word	0x7abe898e,0xe2085a5d		! Init value for %f6 
	.word	0x2ffe158b,0xafd2c5cd		! Init value for %f8 
	.word	0xd5ebf1dc,0x3a5046c4		! Init value for %f10
	.word	0x9b22777c,0x9b21d14e		! Init value for %f12
	.word	0x15149651,0xbc23a8ed		! Init value for %f14
	.word	0xac2a4a0d,0x2cec9eb1		! Init value for %f16
	.word	0x5b14d304,0x476149f6		! Init value for %f18
	.word	0x23aaba2e,0x270337c7		! Init value for %f20
	.word	0x260f4b6c,0x3921bd57		! Init value for %f22
	.word	0x1d5a24a4,0xbcd5a682		! Init value for %f24
	.word	0xc4d0888e,0xd65cf1ac		! Init value for %f26
	.word	0x84e65df9,0xb745e704		! Init value for %f28
	.word	0xb2e28351,0x6d93ff4b		! Init value for %f30
	.word	0x0deea80d,0x52ee07b6		! Init value for %f32
	.word	0x17d2b4eb,0x855e32c5		! Init value for %f34
	.word	0x4cf5a570,0x7324bd95		! Init value for %f36
	.word	0xef40d690,0x28821295		! Init value for %f38
	.word	0xb6acbf30,0x2bce87f5		! Init value for %f40
	.word	0x56736d7d,0x8fd6a9ea		! Init value for %f42
	.word	0xdbf43c3c,0xd1fa3481		! Init value for %f44
	.word	0xfc88c5c0,0x6dcf50cb		! Init value for %f46
	.word	0x33542449,0xbe4047de
	.word	0x78356b0d,0x268afcae
	.word	0xad742610,0x24a563bb
	.word	0x4de33610,0x8d72d1d6
	.word	0x914c6347,0x3639bc80
	.word	0x52c167ed,0x467dd47b
	.word	0x4ec1b038,0x77cbd0f7
	.word	0xf0025228,0x3e68ee65
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
	.word	0xf93502ef,0xf87018d7
	.word	0xf7e57fff,0x80000000
	.word	0x00000000,0x00000831
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000080
	.word	0xffffffff,0xefcaffff
	.word	0xffffffff,0xffffede3
	.word	0x00000000,0x72ee4000
p3_expected_fp_regs:
	.word	0xbcc90d83,0xcbfff420
	.word	0x00000001,0x3f800000
	.word	0xffffffff,0x32e28351
	.word	0x3cc90e83,0x2f0cc9c0
	.word	0x00000000,0x00000001
	.word	0x3f800000,0xed93ff4b
	.word	0x32e28351,0xc9a68388
	.word	0xc1e9a3af,0x95e00000
	.word	0x32e28351,0x6d93ff4b
	.word	0x00000000,0xffeb2f8f
	.word	0x45235b2f,0x2f0cc9c0
	.word	0x41c97141,0xa8800000
	.word	0x00000000,0x00000001
	.word	0x80000000,0x2f0cc9c0
	.word	0x32f28351,0xc9a68388
	.word	0x45135b2f,0x2f0cc9c0
	.word	0x0deea80d,0x52ee07b6
	.word	0x17d2b4eb,0x855e32c5
	.word	0x4cf5a570,0x7324bd95
	.word	0xef40d690,0x28821295
	.word	0xb6acbf30,0x2bce87f5
	.word	0x56736d7d,0x8fd6a9ea
	.word	0xdbf43c3c,0xd1fa3481
	.word	0xfc88c5c0,0x6dcf50cb
p3_local0_expect:
	.word	0x1e000000,0xeca1b220
	.word	0x006b1b36,0x00000000
	.word	0x6a65cf32,0x1e11cc94
	.word	0xf9137e2c,0x90424464
	.word	0x00000067,0x000000fd
	.word	0xd139a489,0xcb416a98
	.word	0x1aa4c26a,0x3eff27fc
	.word	0xf1a5b720,0x02e88cbc
	.word	0xdbfc08f0,0x337d74ee
	.word	0x9f1f9dd5,0x90739d27
	.word	0x8850e1e9,0x281c1e84
	.word	0x83d48000,0xbc6fac25
	.word	0x46ace8ed,0x30254b48
	.word	0x0055de92,0xe64caabc
	.word	0xc285698e,0x1e05c400
	.word	0x74ce1fee,0x35bcacda
	.word	0x74347eff,0x865a0a08
	.word	0x58c32631,0xc85fab1b
	.word	0x3756f4cb,0xb7d18c51
	.word	0xb83f79aa,0x4406c658
	.word	0x76b3365a,0xecca160c
	.word	0xf1128181,0xfff06c07
	.word	0x1a36efbd,0xd24ad711
	.word	0xd21068c4,0x49b4f0cd
	.word	0x00000000,0x62a42298
	.word	0x648473a4,0x4f85944d
	.word	0x06d32df3,0x738d183a
	.word	0xe69efbde,0x76edcad2
	.word	0xcb813e14,0x43e77be1
	.word	0xf883c567,0x757d1185
	.word	0x32955030,0xa8cd31b7
	.word	0x214dc65a,0x8f58e837
	.word	0xb12933f9,0x41d38ced
	.word	0x0166c383,0x6760874d
	.word	0xc1f40378,0xaf8e2b13
	.word	0x0000fd7d,0x0000ff00
	.word	0x8c878644,0x75b34ce4
	.word	0x31b03417,0x54f46033
	.word	0x297ec66b,0xc0af7dbb
	.word	0x74f1ec0e,0x5c821661
	.word	0xe7aa1a42,0x6e8c9e24
	.word	0xb2baece8,0xe38094dc
	.word	0x233e97f9,0x5fe191f6
	.word	0x2c6109f4,0xd7ec6122
	.word	0xa757a793,0xb5b542a3
	.word	0x489c696f,0x7daf8672
	.word	0x3c921dc0,0xe92bef80
	.word	0x9ecd9aa0,0x7c2d2895
	.word	0x12a06b4f,0xc1f3ff88
	.word	0x1783226b,0x176161f7
	.word	0x66d2fe33,0xd300b718
	.word	0x013f94d2,0x6e066a20
	.word	0x3825d380,0x8a86bcef
	.word	0x7c2c0ada,0xa07da629
	.word	0x278605af,0x737afc49
	.word	0x000000ff,0xffffffff
	.word	0x89b13d39,0xd53cff92
	.word	0x4847c83f,0x0123ce29
	.word	0xc8f5b198,0x87c77d9b
	.word	0x545843fb,0x1328034f
	.word	0x2fa4adbf,0xe70ff2ea
	.word	0x768d1280,0x0b7ac1b5
	.word	0x8d962ebd,0x87aab17e
	.word	0xff00b3bd,0x6917c904
p3_local1_expect:
	.word	0x00000000,0x00000000
	.word	0x1d003f59,0x0000fd7d
	.word	0xfc3a4a85,0x28702b62
	.word	0xe15028f5,0xc5af943b
	.word	0x0927ef90,0x6c0b594e
	.word	0xfd7d8000,0x00000800
	.word	0x08314062,0x68cef0df
	.word	0xe632b6ee,0x19754e56
	.word	0xd411ddf9,0x70aa5786
	.word	0x75402a15,0xe9983f32
	.word	0xe546b0de,0x91846dba
	.word	0x1fd09a06,0x2ac962c7
	.word	0x3a3686ba,0x7e0b4e86
	.word	0x96bb0e59,0x2a115068
	.word	0x3a2e52a3,0x3346c31b
	.word	0x428f78ca,0xd36419ec
	.word	0x59104cc2,0xc144b49e
	.word	0x0054e9d6,0xb3f691fe
	.word	0x44ab6005,0xae8b2207
	.word	0xa7108540,0x1d541982
	.word	0x140c2965,0x13ff1d0c
	.word	0x0000938e,0x76b3365a
	.word	0x8592471c,0xea356e43
	.word	0xef8b5fc6,0x7bd7182b
	.word	0xa75fab21,0xaaabcddf
	.word	0x66b1e1d9,0x830d462c
	.word	0x49792b1b,0x4e593acb
	.word	0xd9526402,0x7f755755
	.word	0x97edbd56,0x9abf5be6
	.word	0xdd186cb6,0x0c322416
	.word	0xdb2df7d5,0x2096465a
	.word	0xf3e8e6c8,0xd33964e3
	.word	0xb75076ce,0x5fb34d61
	.word	0xff003252,0x913ec946
	.word	0xb8db7d40,0x1efc5b48
	.word	0x18515aff,0x6b36b66a
	.word	0xf3d1d5de,0x1426f05a
	.word	0x100394f0,0x7030f2c8
	.word	0x821b2bca,0x6cda30a0
	.word	0x7806dfc7,0x828848bc
	.word	0x74d35cc5,0x6f00d71c
	.word	0x9fe43daa,0x97de0ca4
	.word	0xb563f654,0xf707c1ee
	.word	0xe66238e9,0xacd66129
	.word	0xf6e5fec9,0xa3777dfd
	.word	0xc91b25d4,0x91ce3abf
	.word	0x647e8b07,0xa44b9092
	.word	0x8b8521e3,0xc2c9c5e3
	.word	0x0f9bee19,0x0b394625
	.word	0xae74cc42,0x4733cd41
	.word	0xd343c871,0x38b8726a
	.word	0x2dda2b28,0xda6b5542
	.word	0xaf3f4017,0x6b8a79aa
	.word	0xace15e24,0xd552b2aa
	.word	0xa5a7ba09,0x36ad2539
	.word	0xa97452cb,0xebe1d594
	.word	0x0bd6495c,0xa79401ad
	.word	0xdd73c9d9,0x9203f615
	.word	0x6fe7aa5e,0x4dd77dff
	.word	0xede471f3,0x884a1357
	.word	0xf907ace6,0xff8734d6
	.word	0xea77cb0b,0x5fe37d16
	.word	0xff31159d,0x70adbf60
	.word	0x775df7ac,0xa89a815f
p3_local2_expect:
	.word	0x00c98000,0x0000ffcd
	.word	0x000000ff,0x0075fbc4
	.word	0x403da75c,0xa07136e0
	.word	0x9a923498,0x466347ba
	.word	0xc8d0b3ba,0x7c623729
	.word	0x1e001686,0x4b1f68ba
	.word	0xf5501bd0,0xcad6f1b6
	.word	0xc4c6ae0f,0x9b052585
	.word	0x56299d01,0xc067a87b
	.word	0x06f88fc8,0x8fa1f477
	.word	0x434d0f39,0x5f80cf35
	.word	0xb67be08f,0x7f35cf8f
	.word	0x6ec9aac0,0x9602952f
	.word	0xde50fbf9,0x6f4838ff
	.word	0x9bbf91c3,0x98023a05
	.word	0xa04af9aa,0x35fe1c6c
	.word	0x6a9f7af6,0xa58e88c8
	.word	0x9137d6ef,0x6367ab64
	.word	0xaa3530d7,0x9e04cdf9
	.word	0x3acda428,0x0af58e90
	.word	0xddc5f9e2,0x67eab1f9
	.word	0xa26cc3e8,0x56eff1a4
	.word	0xc186d1ad,0xb7c74efe
	.word	0xeb1359f4,0xf04017c3
	.word	0x16521172,0x541e77c9
	.word	0x06bff06b,0xff8fd04a
	.word	0xddd4d9c6,0xb40152c8
	.word	0xab732fec,0xf7881c37
	.word	0xe8775dd7,0x0f9f5f89
	.word	0xe7f7d6a9,0xe8299fab
	.word	0xdcb3f177,0x0296cb8e
	.word	0x3c641f94,0x57d33775
	.word	0x4c6cab1d,0x21d40387
	.word	0x2f3eea2c,0xea286c6a
	.word	0xa76df975,0xac584162
	.word	0x8936c76b,0x0c725f30
	.word	0xa5c27fea,0x5aa44f22
	.word	0x998a9087,0x636e5aab
	.word	0xb6327836,0xb42cf769
	.word	0xfa06e3ab,0x118815d0
	.word	0x62e7dc9d,0xa98579f0
	.word	0x35b14d89,0xb562a63d
	.word	0xb85c35ec,0x20ae06e0
	.word	0x00000015,0xf24836da
	.word	0x898566a9,0x6d9c1817
	.word	0x1ec900e9,0x5e1cd62e
	.word	0x3e42fbc4,0xa1c92b2a
	.word	0xdddefc96,0x1ad7854e
	.word	0x235b7832,0x84ad917d
	.word	0x00000000,0x00000d9c
	.word	0xccff7c79,0x9b846e9c
	.word	0x667de74a,0xdb5d64b5
	.word	0xa7b04912,0x0609d124
	.word	0x554d9bce,0x8c54573b
	.word	0x000c74ea,0x19c290f0
	.word	0x324612ff,0x49664fd4
	.word	0x1dfd8d1d,0xc279e24e
	.word	0xfffe0de8,0xf78974fa
	.word	0xeaf4f7c3,0xa8df6157
	.word	0x02c9df2d,0x09f93dc1
	.word	0x777bc038,0xc5e0005b
	.word	0x3cf5d6d9,0xebf0e330
	.word	0x6441057b,0x9d7293e4
	.word	0x435d47fe,0xa935ce6d
p3_local3_expect:
	.word	0x76b3365a,0x00000000
	.word	0xf87018d6,0x0000005c
	.word	0x81b07fa2,0x569c9b54
	.word	0xd094ff9f,0x2390eeb0
	.word	0x1a87ccdb,0x487ee5de
	.word	0x3ee46422,0xe1f49638
	.word	0x0c4d574e,0xe5e40858
	.word	0x831a4e54,0x2750f928
	.word	0x30fe5c80,0xe2a8eb53
	.word	0xeae33a24,0xaf2cd8ca
	.word	0xa06f3740,0x947b9c37
	.word	0x43429894,0x76d923f7
	.word	0x12cb0952,0x991efd44
	.word	0x89e08803,0x69b04492
	.word	0xd86f8598,0x345e35bd
	.word	0x00000800,0x6baae830
	.word	0x7a0d5b9e,0xa12da434
	.word	0xe5fe90aa,0x70449daa
	.word	0xe408ebbd,0x0c03538a
	.word	0xede3c468,0x89ffc421
	.word	0x61be0dd6,0x163cd6ef
	.word	0x1338cce1,0xd97994aa
	.word	0x5b28736b,0x2e017605
	.word	0x000000ff,0x00000066
	.word	0x2baebe4b,0xb34405ef
	.word	0xaedbfa9f,0xeca1b220
	.word	0x011589da,0x2f3eea2c
	.word	0x3304972c,0x46e26e5c
	.word	0xbcd9b534,0xc148567c
	.word	0x122e7552,0xdedb346e
	.word	0xc0e9062f,0x9f709a53
	.word	0x33768b42,0x8284a508
	.word	0xeea28620,0x15aac7c2
	.word	0xa87026f0,0xe63d0abc
	.word	0x99a5138e,0xc0f73d2c
	.word	0x000003cc,0x80dfd51d
	.word	0xd3d987f4,0xe7495b64
	.word	0xeb670b21,0xc697a759
	.word	0x734b7e46,0x92ca54ec
	.word	0xc478fc6c,0x4126d735
	.word	0x6e6f38ac,0xd6b1a3ab
	.word	0x0000ff00,0x3645c0c7
	.word	0x78bb32f3,0x9afce363
	.word	0x1a36efbd,0x1f86acbc
	.word	0xc52fe75b,0x2f991992
	.word	0x0d3006f4,0x4e1615cc
	.word	0x1d5dfb18,0x7b08e5c3
	.word	0xab052eed,0x5a4c95b0
	.word	0x9afd4c50,0xfdb15ab7
	.word	0x95c82b83,0xec304854
	.word	0x6bd59f72,0xd41b1344
	.word	0xa299aa79,0xff3e0c27
	.word	0xef001b36,0x0b38a662
	.word	0x20b7423f,0x4f588f50
	.word	0xaebb42b4,0x5efa1b36
	.word	0xe9972bab,0x859e033c
	.word	0xb0109746,0x9f01b887
	.word	0x721f3691,0x714771e0
	.word	0xa347e774,0x3df1e1d3
	.word	0x2f476e25,0x20fc4a21
	.word	0xc1872bc8,0x5957621c
	.word	0xa767b88d,0x06543d1e
	.word	0xb33c44bf,0xc57670a3
	.word	0x80fef984,0x00000000
p3_local4_expect:
	.word	0xbf829b52,0x17739cf4
	.word	0x6eb3806a,0xdc8589c8
	.word	0x36ef91f9,0xfabe570b
	.word	0x4ac6e5d0,0x29332765
	.word	0xcb79f03d,0x2eb9f49f
	.word	0x9706ed6d,0x5494e3cb
	.word	0x4309f936,0x43ad38b6
	.word	0xc553028e,0x128ee0a4
	.word	0xef36f76b,0x9c99c2e5
	.word	0x75aedd6e,0xb1d6f8b3
	.word	0x5f4b3108,0x2bf7a006
	.word	0x429fc18a,0x26fef070
	.word	0xeae1792c,0xcaa30891
	.word	0xb3d5dc0c,0x85a9f545
	.word	0x2360218b,0x98100e3c
	.word	0x1fbeafb8,0x39006f5b
	.word	0xd2835cfa,0x2c531878
	.word	0xdcd0676d,0xd4eaa70f
	.word	0x3417a1a9,0x0d0ee6ee
	.word	0xa9e70e80,0x35e9d09a
	.word	0x2a712eae,0xaaa041c5
	.word	0x5b65ede8,0xddf0cf7d
	.word	0xe26435e6,0x4bdce32d
	.word	0x1192383a,0x82cef1c2
	.word	0x977d8e48,0x21339bbc
	.word	0x7fcb5866,0x7a8a8e0b
	.word	0xbf72c041,0x725ba843
	.word	0x09479977,0x3dbe628e
	.word	0x753cf729,0xbf2f9840
	.word	0xde4e731e,0xdad1b904
	.word	0x89a6ec16,0xe5355f03
	.word	0xe3b9381a,0x3af8f985
	.word	0x9fc25b5f,0x15c58a78
	.word	0x0c5f092e,0x18685bb5
	.word	0xfa3f507c,0x920c9eb1
	.word	0x68885f75,0xe25d1f39
	.word	0x043f9374,0x58121c8f
	.word	0xda8714b6,0x1251a837
	.word	0x2f49f0a6,0x0421335e
	.word	0xcbc51dff,0xcf4fda23
	.word	0x13e35ca5,0x6339a4c4
	.word	0x26ce6c5f,0xcf37eb03
	.word	0x44bebdd1,0xfcf69c30
	.word	0x09db3874,0x2650f0e5
	.word	0xc9fbe2e3,0x7cf271db
	.word	0xbc1b60e8,0x9509d826
	.word	0x238637cc,0x58b8388f
	.word	0xef376aa8,0xd3b61f09
	.word	0x1963ff6e,0x96ef3d81
	.word	0x612eae66,0x25d2bc6a
	.word	0x0bef08f8,0x4730517e
	.word	0x00569c23,0x8b54d455
	.word	0x6ca7cdb7,0x4a666240
	.word	0x72dfdda2,0x9f928ece
	.word	0xd8abe4eb,0xfe180419
	.word	0x152e8210,0x816f4440
	.word	0xb05a7a50,0x67d44c6c
	.word	0xaf44e265,0xbefa25ee
	.word	0xfcfa0710,0x999bcceb
	.word	0xb5ba5fef,0x77d69bba
	.word	0x387fb5d1,0xebafeb67
	.word	0xf28a30c1,0xda31c422
	.word	0xa5d3c9d3,0xa80dbfdf
	.word	0x6bb07f5e,0x66f59fe1
p3_local5_expect:
	.word	0xd89d74c1,0xee3b3bc6
	.word	0x4308f544,0x0b908ac4
	.word	0x84059001,0xc4220549
	.word	0x4af1c150,0x0db2ea97
	.word	0x3811b07e,0x66906894
	.word	0xb407b6b4,0x8d663c0b
	.word	0x03146cf2,0xf78e972a
	.word	0xc9c9b669,0x2c3a897f
	.word	0xf27a83f9,0x6785bf91
	.word	0x4ebfac9a,0xb7c26433
	.word	0x00000ccd,0x00000000
	.word	0xc171153f,0xee038496
	.word	0xabc9a781,0x8fae4fbc
	.word	0x7bda1081,0xd2e0e3fc
	.word	0x9dee8b31,0x1762e543
	.word	0xe8bf1c92,0x2b55c725
	.word	0x91275aa8,0x928d9c29
	.word	0xac4371ac,0xe1ddee9d
	.word	0x12287a98,0x1c64a6a6
	.word	0xc8819f2c,0x399c7fd5
	.word	0x897c1166,0xde7d4783
	.word	0x771359f9,0x594c76fa
	.word	0x11c58706,0x40182fe6
	.word	0x19041741,0xb1aa3863
	.word	0x97345cc2,0x9d61da8c
	.word	0x43017ca9,0x406437ff
	.word	0x04b95b32,0x3f9f1eda
	.word	0x41339921,0xbf0fc60c
	.word	0x9b2a0ec1,0xa982ef6f
	.word	0xd4b7b1ee,0x54912486
	.word	0xcf0514c7,0xf2fbaecc
	.word	0x65cd6c37,0xc62ed892
	.word	0x2271771d,0xf356b927
	.word	0xb0c0d6c7,0x71988f08
	.word	0xd83e7f6b,0xb1d17d58
	.word	0x2cf62c92,0xd7411e34
	.word	0x9a43c4d3,0x796cee0e
	.word	0x0000ff00,0x3bb10b7b
	.word	0xc1ae8360,0xd00ae1dc
	.word	0x9043fed3,0x1ef5b7f1
	.word	0xc17edc0c,0x14e36896
	.word	0x8f3d985f,0x3b4b6e6e
	.word	0xbb51eca1,0xd6f6f2d7
	.word	0x78d851cb,0xf9953b67
	.word	0xdb3735ce,0xc18ca900
	.word	0x15c8dfea,0xf05bf0cf
	.word	0x94363e1a,0x97bff4e2
	.word	0x1ad2e59a,0xfa64b5bd
	.word	0x9ec35c0d,0xd914003a
	.word	0x51d6e7f2,0x5129e7b7
	.word	0x1ab8100f,0x1d9562e7
	.word	0x73ea62da,0x2f9e8000
	.word	0xd564f0a4,0x9aab0584
	.word	0x30acfbd0,0xf2e3f618
	.word	0xcbfdc5fe,0xb97701f7
	.word	0x154100af,0x4ea2bdbf
	.word	0x9ab75f47,0x6bef3108
	.word	0xad1d22c2,0x03dc5f6e
	.word	0x767c5f8f,0xf8b3b0eb
	.word	0x02d432a4,0x43defa92
	.word	0x04cce61c,0xcf4d55d6
	.word	0x2962d3e9,0x48ae5f56
	.word	0xf9622c89,0x4ac92d80
	.word	0x23f30801,0xac5a3254
p3_local6_expect:
	.word	0x6a308dd9,0xa49a58a3
	.word	0x3670811e,0x00000000
	.word	0xf1b4e966,0xe5204355
	.word	0x97746efa,0xfad77472
	.word	0xaa1070de,0xd15b3d03
	.word	0x57068917,0xa3982c90
	.word	0x6bb8f3c7,0x7b7a12d9
	.word	0x4999ce70,0x7f41e732
	.word	0xe907ab4a,0x135c7464
	.word	0x188824e6,0xd7bc5b93
	.word	0x2dab6fa7,0xb9028c77
	.word	0xcc6e77d1,0x25495998
	.word	0xbc8dcab2,0x28678157
	.word	0x9fef6a76,0x4d70c5e9
	.word	0x3de47d38,0xec7939a6
	.word	0xa4e57970,0xbc6ccd31
	.word	0xbfb6cd4d,0xf6841ca2
	.word	0x03dd2425,0x9710c9a0
	.word	0x238cb35e,0x14f824ad
	.word	0xc74cbec0,0xcd43603f
	.word	0xf48f9582,0xc5545b1b
	.word	0xefbd4d7e,0xa26fee95
	.word	0x193c1207,0xcd6f817e
	.word	0xe3f15274,0x967bf9f2
	.word	0x17f71a64,0x90d4a235
	.word	0x6303dc89,0xc9ed7a75
	.word	0x2efaad0c,0xa2deff17
	.word	0xf4738f88,0x80c4135f
	.word	0x74b0096d,0x88e3c662
	.word	0x3dcabb00,0xbf69c8c1
	.word	0xf06d77b4,0xce7043bf
	.word	0x18de0aee,0x9f669caa
	.word	0x83590cc5,0x010d127b
	.word	0x68720b35,0x21c4dab6
	.word	0xaa22a232,0xaf9cefef
	.word	0x3a687b04,0x3e7c0b45
	.word	0x5128d169,0xfb8e0e3c
	.word	0xfbd9c3e0,0x206b0f71
	.word	0xe5ba233c,0x56e1b7fc
	.word	0x2fd560e1,0x0f8b0f5c
	.word	0xf8e91307,0xf92402b4
	.word	0x57207607,0x961cd0de
	.word	0xaec53e59,0xbb0fed35
	.word	0x1c61c81c,0xcebda54f
	.word	0x6ad7fe02,0x06faf5cf
	.word	0xd6e9d809,0x0a34af76
	.word	0x915cd210,0x196701d0
	.word	0x97dedfda,0xcead61f7
	.word	0xf53e5184,0x58bf0d1d
	.word	0xda2620b6,0x454828a5
	.word	0xa8dfbbc9,0xfb78472d
	.word	0x31f7be75,0x617ab76b
	.word	0xd9f49527,0x8619859a
	.word	0xcaee011a,0x8149cc16
	.word	0xf8a03e83,0xc994c6db
	.word	0x128eb292,0xce16993e
	.word	0x22df019d,0xb25a8582
	.word	0x28b040b8,0x53b78cc3
	.word	0x6f5ee4c2,0x36530847
	.word	0x5bcab9ec,0x55646b6e
	.word	0x1242324c,0x78cc3be4
	.word	0xdfe0e699,0x57519ef0
	.word	0xee0fb540,0x71d986ba
	.word	0xea9c743d,0xa66081c9

expected_common:
	.word	0x12070c3e,0x07370b35,0x1e271906,0x1f091e12
	.word	0xffffffff,0xffffff81,0x220aff2d,0x001a270f
	.word	0x2f093213,0x28360a28,0x221f381d,0x0c070502
	.word	0x0425050c,0x28330b3e,0x16ff0000,0x0001080e
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
	.word	0x51a66245,0x005cbc5f,0x760287ab,0x7194ab49
	.word	0x4f11b5bf,0x947d02a2,0xe729698a,0x3fefeb2c
	.word	0x34285385,0xda0176ec,0xc0fc5436,0x228f43cf
	.word	0x94441d42,0x9056ee8a,0xa587394e,0xf1a7f7c6
	.word	0xc0e255a9,0x41e37dac,0xd230e7de,0xe0f55db6
	.word	0x8bed25bb,0x1b4459a3,0x4ea42c44,0xa8018b68
	.word	0xf1dc0e62,0x2661f391,0x9b4f2c19,0x2be00efd
	.word	0x056e0736,0x53ec6315,0x2756f179,0x145a3757
	.word	0x97d2d580,0xdb845697,0xc59ce959,0xba3c13dc
	.word	0x92981006,0x64ab841b,0x44d04b4e,0xf1889b13
	.word	0x4bb5bb98,0xa36411e8,0xbc432705,0xc42fbd0c
	.word	0xf8aa78cd,0x2fa873c0,0x8f375fdc,0x311b4189
	.word	0x054176fb,0xa2a783fb,0x4200c80d,0xbe329e4a
	.word	0xe47c3df6,0x588d1cdd,0x930503a8,0x1fd384d4
	.word	0x662528b5,0x88f902f2,0xb28f9382,0x5885c8d6
	.word	0x37b6f520,0xc58df0d5,0x2b9da88d,0x7e66137a
	.word	0xdfe0d8e9,0xe3b501cb,0x4d9ec5c2,0x5afd92d9
	.word	0xba7bf424,0xc2be7ed5,0x74c6f42f,0x1feb8e41
	.word	0x6407aaea,0x1d03f7e9,0x61054b5b,0x9d9042a8
	.word	0xe117f455,0xf1c7ba7e,0xad464ed6,0x57d2f58a
p0_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local1_begin:
p0_local1_start:
	.word	0x231007de,0x6f902ede,0x4bb76ead,0xf1f6afff
	.word	0x23e259ad,0x4dcd57c8,0x1c2df9ce,0x47dcea36
	.word	0xcdd1b3d9,0x4caf1c9e,0x0b3cc928,0x7f99ca6a
	.word	0x95d4790a,0x2d6c7d05,0xc296da9e,0xfa6a5820
	.word	0x9283bfd5,0xc256a6e8,0x1b689d26,0x08669b45
	.word	0xf276d9c5,0xd7397d89,0xec8f686a,0xbc7804f6
	.word	0xd0f60d68,0xa2638cbe,0x3c53b7c8,0xbcb7df59
	.word	0x0e5c6867,0x48be46ca,0xdb79687e,0xb793fb62
	.word	0x4926d769,0xcf8b51f5,0x6445e292,0x32d592e3
	.word	0x70ed4f48,0x8cc12faa,0x1287e9eb,0x5410dd55
	.word	0x10a21895,0x58bd2664,0x6bdd8d1b,0x7f04aa10
	.word	0xcd9b47dc,0x032a00e8,0x7237c0c5,0x62ba88ed
	.word	0x61992cd4,0x7bdd52bd,0x515ad1bc,0x3e054f9e
	.word	0xa08f82ec,0xe58a1f96,0x1a95040a,0x9275d3ac
	.word	0x5f17043e,0x9c079afd,0x133a660e,0x48c6327c
	.word	0xe277fc28,0xc1c0d1c4,0x94efe48e,0x308f2b5b
	.word	0xa11a7f0c,0x8d1a21e8,0x2c0fda36,0x58894928
	.word	0x3aa891c8,0xa31e9b23,0x28aaf4a8,0x301a085c
	.word	0x81b93b4e,0x13fd2166,0x35998320,0xf73f2eb9
	.word	0x6eab4c0c,0xe3c420f9,0xec42d6e7,0xa33fe043
p0_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local2_begin:
p0_local2_start:
	.word	0xc89b1113,0x1038ade9,0x7411d4f9,0x16a2c4b4
	.word	0x105700f1,0x64be68de,0x51992bf6,0x3259011a
	.word	0x80efedba,0x2a65b82e,0x77787d06,0xd9387072
	.word	0xeb89978e,0x8495449c,0x0a4536e7,0xb258935e
	.word	0xf4184310,0x4e17dc6a,0xa7b627b0,0x5c7f9b30
	.word	0xd95be3a8,0xcd9b639c,0xb2661938,0xbd961e53
	.word	0xba2eca4e,0xcde26abb,0x3073d42b,0x35bc2823
	.word	0xf66cb564,0xf5a73f95,0x543eaed6,0xe766f006
	.word	0x37db3a5b,0xf89dff71,0x23646f8e,0xb0060cec
	.word	0x045c922f,0x207bd395,0x05874d3f,0xa1649319
	.word	0xe122e749,0x23f7ac82,0x6d02fa02,0xef50322d
	.word	0xf6583fa4,0x09f59631,0x8f695675,0x8a67a9c1
	.word	0x6a5fce87,0x700727dc,0x4503c453,0xf2cea32c
	.word	0x96b615d1,0x32759fe9,0x3f0ecdc9,0xdf38e53e
	.word	0x3e7edcd7,0x1536dc46,0x1d887dc5,0x92971fbf
	.word	0x6fb3b0f5,0x87ca4343,0xc5528868,0x67948e5b
	.word	0x27d649b9,0xd7d4f002,0x6172b46c,0x81c8da69
	.word	0xfbc42b08,0x62e7060c,0xc4be09d1,0x5317a984
	.word	0x5cf8f40d,0x62e9feca,0x6dd63878,0x3c20a2e2
	.word	0xcf51c0ba,0x9da6b287,0xbe5a761f,0x7b4e2d15
p0_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local3_begin:
p0_local3_start:
	.word	0xa79c8f17,0x76223665,0xb4e8ca61,0x65c791cd
	.word	0x0969aa52,0x1cb6a6e3,0xa048f6fa,0xe07af6ad
	.word	0x01833ae1,0xa9db312b,0xfcb10966,0x37dcc4af
	.word	0xc65c821b,0x6d17ccc6,0xba627357,0x39bbc054
	.word	0x95c287f9,0x281873da,0x07498a0b,0xcec1054d
	.word	0x829bff3e,0xb3ec0b39,0x695cd411,0xaffd02aa
	.word	0x43ac58da,0xeccf9dd8,0x1e9a1edf,0x7d8fbb5c
	.word	0x96e633d9,0xb43d92bf,0x9f5291e3,0x57eed3e0
	.word	0x138a5aec,0x78a6cdb7,0xe7921d81,0xa520ff75
	.word	0xa39a8654,0x04e3a3f8,0xaca6ec54,0x50bf7d77
	.word	0xccec9797,0x2b89162f,0x04ff04f6,0xf5acf0f2
	.word	0xd89103cd,0xfd5d2941,0x07ec1a04,0x8b0f674d
	.word	0xc481d55b,0x24bf5f48,0x2d0d4c89,0xb3d0891c
	.word	0xb21c82cb,0xc70e2463,0x79b14677,0xa4fdb2ee
	.word	0xfdb8c54a,0xb2b67686,0x0295b4c8,0x0030e291
	.word	0xe4ad6de9,0x469c3a05,0x7ddc0073,0x82bd1afd
	.word	0xc72a7275,0xc259ff07,0xbbecd461,0x97646516
	.word	0x5bdec45d,0x74c3553b,0xe1146aaa,0x1c1d39cf
	.word	0xe2813aa9,0x4afa0ee4,0x3f61909c,0xa8318245
	.word	0x9991da22,0xe800fe17,0xbf7ec6b7,0xd1159cb9
p0_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local4_begin:
p0_local4_start:
	.word	0xd5343bd8,0x0bb5a74a,0x2304a442,0x49850e9f
	.word	0x719e0e3c,0x24883b0d,0x8a019f5e,0xc018e242
	.word	0x76c78f58,0xb21205a9,0x527ed100,0x0a51a2b5
	.word	0x6968fa0c,0x01f110d6,0x0c1d360d,0xed20c0ad
	.word	0x2647c419,0x85c24227,0xcf4b8b3f,0x52d51a49
	.word	0xf5a6fb89,0x6e95d74e,0x93f82611,0x433bca30
	.word	0xf81ee9d9,0x8582a3a9,0x670bd5b4,0xb16f2183
	.word	0x5cde60b9,0x129a8060,0x4aa5dece,0x630c3f0c
	.word	0x2581a785,0xaa6fe983,0x210277f9,0x7189b9df
	.word	0x2e280803,0xf5b34f4a,0x6cc62e1f,0x1d0dafde
	.word	0x27b0a454,0x3d765ab2,0x084582a6,0x934de2a8
	.word	0x8177b830,0xf55ece06,0xd72aa316,0x55aa3ae5
	.word	0x66f2eae5,0x6be55140,0x2be53d36,0xdac6de81
	.word	0xe64ff9cd,0x1f65f32e,0xa0228b06,0x55fdb4c5
	.word	0xbb130735,0xf2f632c2,0xd47b486d,0x0ed6e91b
	.word	0x827f5fb3,0x7bbf4c9b,0x30539013,0x915a1905
	.word	0xddd06463,0x5c1cb70f,0x344e7491,0xd03d332f
	.word	0xb342c128,0xd014bf1d,0x2bad4d49,0x0730de0a
	.word	0xfb148805,0x0ff748b3,0xafe4e5b5,0xf31e58f7
	.word	0x5c8b57a5,0xa866c879,0x6e58c01b,0x1b59d52a
p0_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local5_begin:
p0_local5_start:
	.word	0x93d8beea,0x6255eb16,0xeb8e3664,0x0b1a9739
	.word	0xc333df44,0x8b68c9fe,0xcdf8bf75,0x3d4bc905
	.word	0x35db9a3b,0x4d212225,0xd4d25312,0x32987166
	.word	0x65160601,0xf255e72f,0xea74e102,0xdf63cc2c
	.word	0x4427e039,0x77c2da2c,0xeab0c4bb,0x557865b0
	.word	0x7e24828e,0x07d87dc9,0xad3448b2,0x95a74b8d
	.word	0x90484356,0x1a600495,0x8c3d2553,0xc4e4544e
	.word	0x8063f4dd,0x82fcd0c9,0x391b7592,0x691109ec
	.word	0xb62c8d98,0xcab1a74a,0xd691d27e,0xa5aa3b52
	.word	0x6a5ba5a8,0x08728aaf,0x0760eeca,0xa4eab2c7
	.word	0x538bf88f,0x919f0a29,0xb9535818,0xbc77a516
	.word	0x7c0c0455,0x45db4f75,0xdbfd01b5,0xe21041b4
	.word	0x8af43cd9,0x79cd3fa1,0x18c9a898,0xa067fd44
	.word	0x869bb48f,0x39430a3b,0xe7a62890,0x00663ada
	.word	0xa490e9ff,0x49afc521,0x6f8dafdb,0x9e6da62d
	.word	0x6bdfba37,0x1597ed78,0x0129fc23,0x78c9783a
	.word	0x04856e13,0xee14ec44,0x304a38fe,0xc0271d13
	.word	0x123c8f3d,0x0a6c2399,0x040f669d,0xa1b72e38
	.word	0xaffb6631,0xcf86e6c4,0x897bd703,0xaa10b11f
	.word	0x56b6d66a,0x4c59a8c6,0x5970ba2b,0xc1359e85
p0_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local6_begin:
p0_local6_start:
	.word	0xe8e4870a,0x78e50fd5,0x24bc3ece,0x22934b23
	.word	0xe0b2dfed,0x93f5d6f8,0x7a41f100,0xe635861d
	.word	0x8cb123f6,0xca9f24b8,0xfa59a8f7,0x4e9a4401
	.word	0x781ecb88,0xbfdf64bb,0x42efc1c6,0x417c25a8
	.word	0x30638df0,0x18535633,0x564e5457,0x0c3453bc
	.word	0x87c5fad4,0x08395542,0x2311fc27,0xd9d305f5
	.word	0x62c1f21f,0x71b896ee,0x9f792312,0x1fa51e44
	.word	0xa92fbe89,0xd5e49be6,0x9ae80b54,0x9d697a01
	.word	0x5fcb7e4c,0xe3056103,0xe723428b,0x8c4149c7
	.word	0x58b16854,0x73251f14,0x8f841d6a,0x2e2ec598
	.word	0x111e44b6,0xcd35889f,0xebf6f2d5,0x2ef64be3
	.word	0xedd69843,0xa294290f,0x83af3078,0x82bd1c1c
	.word	0xd3461dc4,0xd140b027,0x749f5f7e,0x6b46ecaf
	.word	0xb79ef998,0xef5fa0ed,0xfb3ca44d,0xf3b50d0b
	.word	0x2438852b,0x80f8044c,0x7e8b322e,0xbadebd00
	.word	0x8eab7239,0xf7b25b48,0x1b192d3f,0x27786495
	.word	0x266c8689,0x0cc05a23,0x6521fe3c,0x0c46b18e
	.word	0x242d1767,0x288dc93f,0x2acad68a,0x0732bda6
	.word	0xe9e7c362,0x9c2431c2,0x811daa26,0x9d60f44e
	.word	0x68ed151a,0xc4630a56,0x9d3bbbe4,0x3c4f0d84
p0_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local0_begin:
p1_local0_start:
	.word	0x8959c203,0x0aee1713,0x1d5e798b,0x47a99314
	.word	0x003a05a5,0xbe21e7c6,0xe5b56b67,0x875ab956
	.word	0x47aba15c,0x463743f4,0x7468dc52,0x13eb047b
	.word	0xf210ac63,0x06721fbd,0x16b49228,0x8f294f05
	.word	0xfcbe3eaf,0xf49796cd,0x858f68ba,0x7f9f2b7e
	.word	0xcb231104,0x85a68f12,0x47942e95,0x38539d9e
	.word	0x829dbdab,0xb54e6e3b,0x6f1bc0a6,0xe49be709
	.word	0xe586543a,0xc23ed50b,0x56b6adda,0xcd20166d
	.word	0xeed51c69,0x2dc54464,0x4da88bbd,0xda72d344
	.word	0xebaec926,0x3e4494ac,0xed9ff6ff,0x72e2694d
	.word	0xef99361d,0x4f4f80c7,0x8bc2e89f,0xb0af316d
	.word	0x9e71f218,0xc8f94f9b,0x41fd62ca,0xcac2993b
	.word	0xdd9a3143,0xfe5210f7,0x86c41981,0x4f19b9c1
	.word	0xbe28d452,0xf663e243,0xca62ce39,0xafacc57b
	.word	0x22e6d698,0x35aad59a,0xc3cd6633,0xbce66cb0
	.word	0xd1e22701,0xf3af3dbd,0xc1bf4a14,0x6d272b9e
	.word	0x06a33ab8,0x594c2a38,0xf669aab1,0xfecb2741
	.word	0x30a458c7,0x14ee7874,0xf021fb94,0x8d7125d7
	.word	0x14d97c12,0xbf6eba44,0x8d37b799,0x8cec6a31
	.word	0x829d47c0,0x18c2c145,0x99243c07,0xaf3b860c
	.word	0xb52ea91a,0xa89a183a,0xadc82a7d,0xf765becf
	.word	0x4f4cada0,0x4510bce5,0xca97c993,0x79a04301
	.word	0x73deae6e,0x8c925b8a,0xba164e1b,0x539d10c2
	.word	0x2e4de62a,0xf4e70b90,0x314fb74b,0xda38c931
	.word	0xeea26d20,0x397724f1,0x683c8f27,0xae6e8862
	.word	0x57b3b903,0x9ed7371b,0xebbec764,0xd946921b
	.word	0xd51f45c3,0x4c068eba,0x450fb721,0x598e1e79
	.word	0x348b3723,0xf788e0dd,0x231d5e85,0xe95d97f4
	.word	0x02f738ba,0xc7ee8923,0x7518a725,0xf2818e88
	.word	0xc9c607ed,0xca7729bf,0xa574d4a0,0xa1d7f784
	.word	0x901e20c1,0x4c9ceb21,0xcae77d3a,0xe449bcce
	.word	0xf016bb84,0x531fca0d,0xe3628f19,0x2b70d4af
	.word	0xe02ab8e4,0xc76d0f95,0xbc353c5e,0x28496a99
	.word	0xaeec5e6a,0x6bd4cc49,0x581e978f,0xf686134f
	.word	0x6df14f5a,0x20ebc6b7,0x45ea5cd3,0x8e64cd71
	.word	0x21632c3a,0x4d604113,0x3f9663c3,0x1b80ff6c
p1_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local1_begin:
p1_local1_start:
	.word	0x7b838307,0x1c541d54,0x16232e78,0xdd9d1ad5
	.word	0xabb43520,0x45035597,0xcb08ced0,0x71a2ed44
	.word	0xd862855a,0xf5e16053,0x01df5020,0x10d5ec93
	.word	0x6ec5eaec,0x808a966f,0xeac7ed01,0xea5794d9
	.word	0x6e57a011,0x10268255,0x414f1a4a,0xec77ba8e
	.word	0xf2ebf95f,0xd5af118b,0xbe60cec2,0x0dd15780
	.word	0xa0f51c34,0xd843dd11,0x374b2155,0xd2dab07a
	.word	0x2a8e6024,0x217babc8,0x237cfaa7,0xff80296e
	.word	0x10b4d32f,0x566c70e1,0xc9e7c68e,0xacefaa84
	.word	0xa45252f6,0x3c6af93d,0x721bbede,0xa6f3e6b4
	.word	0x595830f1,0x3c6ecb08,0x9b25b80a,0xf51b9c89
	.word	0xc64acdcb,0xd6bcc555,0x3cf38ff2,0xfcaa3e6b
	.word	0x4c8d71e7,0x23b1c0fc,0x05e5c87c,0xb5a9dd62
	.word	0x1ba08590,0x41275f4a,0x72c8c0bd,0x5187c0a1
	.word	0x2dc253a5,0x76ed83b5,0x39a2062b,0xbe00a75e
	.word	0x20314dcf,0x48bff4e9,0xe3d80497,0xca0c3824
	.word	0xbdf0e0e0,0x2f4869f3,0xa4e95180,0x138b068f
	.word	0x93c1d795,0x4b54fcdf,0x09cf7cd9,0x278f0b20
	.word	0xff862a2a,0x2adf1a8d,0xe36897b4,0x5b84e42c
	.word	0x85ccfc7f,0xdae46246,0x44a73609,0x02f8f114
	.word	0xf52a368a,0x68db5906,0x29ff40dd,0xef88a97b
	.word	0x88e464b0,0xd18ca904,0xbca1031a,0x558dbe07
	.word	0xa0dad79a,0x64dcd75a,0xe1d5b220,0xffcbb893
	.word	0x5914efbb,0x7d07e1b6,0x488f2c43,0xf6e31d0d
	.word	0xe7f53892,0x0af408b7,0xd006898a,0x07b8ac41
	.word	0x00cbea0c,0xca1d7c43,0x03491d4a,0x4314f6eb
	.word	0x8b555ebe,0xac8e0453,0xd1e98eeb,0x72f5867f
	.word	0x2a7932bf,0xa66f07ea,0x9a2b5400,0xf84558af
	.word	0xfdc1ee6c,0x993e9ca2,0xf49ed119,0x54782b50
	.word	0xf325a249,0x79be02cd,0x1582667d,0xb6863ff8
	.word	0xa64c92be,0xa2af993a,0x2470ba12,0x166dd090
	.word	0xf62b7e4f,0x98d5e7b4,0xd5665b52,0x12b1e242
	.word	0x1b1aa25f,0xd8051148,0x95b4a9c4,0x4ebbcbe3
	.word	0x406100fa,0x11850002,0xad3378bd,0x789ea17b
	.word	0x71ad3223,0xba19e958,0xdf88bf57,0x14dba4a4
	.word	0x5ef4d9b0,0xa10542d0,0xf659fe2f,0x3b8ae75b
p1_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local2_begin:
p1_local2_start:
	.word	0xb05bcd4a,0xfceb5394,0xa7740429,0x9b253b0a
	.word	0x12c7bdf7,0x8053c586,0xf3b4da0f,0xe4ea69f0
	.word	0x50b62fe9,0xa0ca5417,0xb67df6c4,0xf22e7bcd
	.word	0xac5fd861,0xf855a2e2,0x340b2a44,0x536b6bd2
	.word	0x45fb5aaa,0x20058553,0xfbf5e7cb,0xffa46c85
	.word	0x7d09b114,0x2435e057,0x755a4689,0x09f4d491
	.word	0x02ecbf92,0x8b658bae,0x749d040f,0x6d352ec9
	.word	0xefecfbfc,0xd0a6f4e4,0x650c0170,0xa46b68f0
	.word	0xe6cc94de,0x28a670ed,0x4d0d5c20,0xca3ae0cc
	.word	0x98adacbe,0x6863acf7,0x6aa37e4b,0x2ee54f5b
	.word	0x17ade110,0xc256c9f3,0x8745bd05,0x85ca01d0
	.word	0x975026c8,0xf31ee922,0x4af33fcb,0x01d11693
	.word	0x4d405c55,0x78534db3,0x337633b3,0x807d5309
	.word	0xd8702a03,0x8d69645a,0xd81cc3a9,0x87e94a6c
	.word	0xb338009e,0x9c568279,0x526d207c,0x636abe85
	.word	0x5510ac1e,0x919fafdd,0x7ebb69da,0xc48a47d3
	.word	0x58955c90,0xb3612c25,0x02054f65,0x8273d416
	.word	0x0519da0f,0x9f0cb1b8,0x8f607e05,0x82b91af3
	.word	0xa49b2644,0x307abe47,0x397e0d96,0xd803dcc5
	.word	0x844f4c33,0x9d2e07fd,0x8a751532,0xb447501d
	.word	0x75884576,0x28bd60c7,0x9ece6b50,0x76b6ce85
	.word	0xd0ab24ad,0x51967ed9,0x0fc4b721,0xa6609b55
	.word	0x78334018,0x8a6ec247,0xa6e207c8,0xce43e962
	.word	0xb8062c0f,0x12b6bc69,0xdc677a10,0x2fdf5ee4
	.word	0xe9f22168,0xa0f47d23,0x6cdfb628,0x08cbbf59
	.word	0x56f218e5,0x3820edc7,0x3b54137e,0x5bb0848c
	.word	0x1cc89a39,0x73bb9145,0xa252c440,0x3d513b5e
	.word	0xe1644947,0xe9dc7f50,0xa452b5ae,0xa61e80bf
	.word	0x7e509e40,0xa92fbacf,0x9114beea,0xa26b2a3e
	.word	0xade1415a,0xc335a175,0x187ec223,0x97a79d4f
	.word	0xc9806a55,0x8675b39e,0x40c0929b,0x4564b6e4
	.word	0xff22c964,0x5a28b51b,0x0162c4aa,0xc7f3c0a8
	.word	0x4562c81d,0x900f124c,0x31ea2e84,0x49f2b6af
	.word	0x94ecbb3d,0x497fd808,0x5106de02,0xa169a1d1
	.word	0xb98ccd15,0x7b5792bd,0x51dc4832,0x97bbdefe
	.word	0xe460bcf9,0xdbd97916,0x645025ca,0x499901d6
p1_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local3_begin:
p1_local3_start:
	.word	0xb70bd97c,0x482c2ff3,0x8d277ba0,0x4cb60455
	.word	0x5c5b6598,0x684f1dd3,0xf96bc7cc,0x78a4be77
	.word	0x94792596,0xfd5c5697,0x77da7272,0x4d7bc975
	.word	0x47b2b411,0x8bc91ee8,0xf9e95fea,0x95878b05
	.word	0x21002f89,0xf22323ec,0x82f85f6b,0x3e3672e4
	.word	0x12cdf6cb,0xe3a9ce5e,0x743d13fa,0x7b8ce37a
	.word	0xf56eb4cb,0xcb454ac3,0x8808d42d,0x8564df54
	.word	0xad017548,0x17d7b7d9,0x5566504e,0xe5ea9438
	.word	0xe357b958,0x300f8880,0x9d1dabe5,0xcca2d7e6
	.word	0xb4aa181d,0xab55f908,0xc0b006d9,0x2014a9a8
	.word	0x9b9b2934,0x92712b23,0x3c9bee83,0x5a6b02a0
	.word	0xe262a6b4,0x10b19b1d,0x424bbe18,0x64721d99
	.word	0x768afeb9,0x16475353,0xd759023f,0x6250994f
	.word	0x777e747d,0x84e7c5d3,0x3d3359ba,0xff7c0cdc
	.word	0xb13ace27,0xac22818f,0xbeeee956,0xf12e6656
	.word	0x5c03e209,0xef730f6d,0x158b4c29,0xbb5adf32
	.word	0x4d7ad401,0x358325a1,0x3f7ebf3f,0xc081587c
	.word	0x0a514ce8,0x2e3bf293,0xeb4aaa8b,0x0431ee50
	.word	0x23314e0e,0x3948bade,0x9a4c786f,0x07581230
	.word	0x8465ebe8,0xd403e659,0x09201184,0x95ae28d5
	.word	0xfc25e511,0xc5bcf845,0xd1142827,0x75a7e00c
	.word	0x47e26751,0x337f1851,0x06dbd1ef,0xe4f1100f
	.word	0x5dc7d5e0,0x9e8fca23,0x6150eb82,0x0e48cd47
	.word	0x1e4a9b90,0xc437a01c,0xf9a7e04c,0x4b01609a
	.word	0x31dc1308,0xbd18c18d,0x9289aba1,0x985d2f1e
	.word	0x5a2caf1a,0x1198878f,0x2a82d190,0xc8a11567
	.word	0xb13ff60c,0xcac27480,0x81ecef9d,0x8bc71958
	.word	0x69d2dbc8,0x044ba963,0x87498146,0xcf208a32
	.word	0x7b50127d,0x30feb35d,0xdeb2e73a,0x41dcc991
	.word	0x92ba32ea,0x00b095fd,0x9fa550bf,0x8a7ec74b
	.word	0x55c02faf,0x8979b719,0x344ea732,0xb755607b
	.word	0xf3a18146,0x1002f250,0xa0cb353b,0x8bd1b6db
	.word	0x0df91b14,0x876312e8,0xb6266733,0xaf4a6897
	.word	0x853beb88,0x3f19744a,0x82eb6b62,0x149a1fb0
	.word	0x1d9d10c5,0xc614d624,0xf68e7f6f,0x7662595a
	.word	0xc1933870,0x88248530,0x49ba50e2,0xbcf77821
p1_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local4_begin:
p1_local4_start:
	.word	0x3f4c2d62,0xa011d178,0xa071fa34,0x9a742070
	.word	0xd60ebd4a,0xb8a442f9,0x723216d3,0x98b97634
	.word	0x0a7fdc8f,0x8a87e64f,0xb371f11e,0x8f0e4ebd
	.word	0x6cdd58c8,0x1304d032,0xe620102f,0x7e9110fd
	.word	0x1f570066,0x091620ae,0xd04c4b9e,0x253e6e1a
	.word	0x6fc1d7ad,0xd39e8431,0xd2906458,0x3ea679c2
	.word	0x9ad86ed2,0x5c9796c9,0xa07335bc,0xce6a07d6
	.word	0x9ba97eb3,0xc9419809,0x232c74b5,0x29164975
	.word	0x7a33f99b,0x2208fab7,0xe53ad802,0xe9469ce2
	.word	0x833103e4,0xf191e60f,0xb3721599,0x63d625c4
	.word	0xda4eb244,0x3cb58e7c,0xc1397894,0x59272c85
	.word	0x0484cb7a,0x843434aa,0xc9512c34,0xdf02348c
	.word	0xdfcf2703,0xfb7bd709,0x6a49a3b4,0xfa4e02b5
	.word	0xfd8bec3e,0x29668ff5,0xaf4080f6,0x17410a83
	.word	0x07aa2446,0xce20c81b,0x2080ff32,0xfefb1a42
	.word	0x33275b0f,0x4b6d8dfc,0xccd67aac,0xe93f3813
	.word	0xf1629fcb,0x6c7af434,0x5abe2d47,0xc40d5b78
	.word	0x6a3bf36e,0x4319be9d,0x5807e446,0x8d1d431f
	.word	0xfc323bdf,0x9a061c27,0x4a1a7bfa,0xe0b14ffe
	.word	0xb004dc75,0x552f926d,0xff4c4763,0x4bf28dd0
	.word	0xcd8d8f7c,0xf848ca0e,0x08a8a96e,0x81b32788
	.word	0x39a8cd53,0x7a721e61,0x64e99845,0xde6f3765
	.word	0xeee84c5a,0xf5822516,0x953a16f5,0xba66fdbe
	.word	0x04d153af,0x0318dc8c,0x937708eb,0xfc5bec20
	.word	0x50e7f5a2,0x53d05f0a,0x40fbf134,0x0b71716d
	.word	0xf4737078,0x15cdfc60,0xaaa0d06e,0x981ae902
	.word	0x7de54ed2,0xbfabf0bc,0x728734cd,0x61c71953
	.word	0x182048c5,0xf766294e,0x294215bc,0x16f556b7
	.word	0x4487179d,0xc0ada76f,0xc90fa274,0x8b689a19
	.word	0x493681ea,0x84c47b89,0x76b96340,0x51a73c80
	.word	0xc0e72ea5,0x1179f3da,0x1bf72137,0xa3ef5eef
	.word	0x51a9e1ed,0x7bcac70d,0x01a0990c,0xcdfae7a8
	.word	0x796177c9,0xefc66710,0x7e256920,0xe830baac
	.word	0x82323c47,0xf2a7d032,0x45f76272,0x3b9fd301
	.word	0x42674ad0,0x870ff9ee,0x26d5eaa7,0xd8cc4ec7
	.word	0xafe6beba,0x4559ce11,0xa01e4e7e,0x68795dd3
p1_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local5_begin:
p1_local5_start:
	.word	0xcdfc2b66,0x483566fc,0xaf102bb3,0x4b4e3d86
	.word	0xb211bf4f,0xdc46bc75,0x93fd2b9b,0xd764e7e2
	.word	0x09ba3b31,0xc4f59593,0xb6706d0a,0xe3908d25
	.word	0xd57c6dbf,0x8e8492e0,0x7a4d5796,0xbb341d16
	.word	0xf7ab05bf,0x9fba6cd6,0x01c9efa7,0x4c4eeb0f
	.word	0x7fa6474c,0x8ac0dc86,0x05f54859,0x7483ce88
	.word	0x85b61f85,0x8e6441f3,0x3c909b1d,0x2c6bf666
	.word	0x0280658a,0x3988a928,0x3f9e15ef,0x867a8b9d
	.word	0xa1e75bf0,0xc01029c1,0xcbb017b0,0xbd85f8ef
	.word	0x04b0ba75,0xcf1a8024,0x6e213dfe,0x9a6d2319
	.word	0x2bbcb7c7,0xbb3fc3b2,0xe25a3da5,0x9452ea00
	.word	0xd3a2af7e,0x471bb671,0x22b2d547,0x5d339a9c
	.word	0xa91a5da2,0xe4962890,0xaf62d00d,0x6c88464f
	.word	0xc1389554,0xac9bed71,0xa6e5807f,0xa344f935
	.word	0x89b69e17,0x9cf3486a,0xfb00de5f,0x455a924d
	.word	0xa55a63b4,0xe367090b,0xed10054c,0x00b6a493
	.word	0xdeb60524,0xb0dc3442,0x071f3f82,0xbaccb9b4
	.word	0xc0ce70e5,0x756b2089,0xfdd234d0,0xed7941cb
	.word	0x421d17c6,0xfa493d84,0xefd82c80,0xd98b4a84
	.word	0x974f8a4f,0x49eab3f0,0x23a12217,0x8c2fe7ab
	.word	0x2cfd5147,0xc9a68c2d,0x11d0409e,0x6ff84280
	.word	0x02eb1ba7,0x708f6148,0x3f661969,0x0663b95f
	.word	0xd29a2d08,0x1fccefb5,0x67645d95,0x893c9afd
	.word	0x7c2fdb69,0xb6f99d20,0xaa300271,0x27790abb
	.word	0xb5360338,0xf551eda1,0x0ea7546b,0x3a88ddfa
	.word	0xeacdc86c,0xccd9562a,0x8a664955,0xb2229944
	.word	0xa73fc3cc,0xf8f27d47,0x55d6ec93,0x9ff71ac6
	.word	0xe7571052,0xd8f892dc,0xf8c81772,0xc8fa3ddb
	.word	0x3f912a21,0x706456c1,0x151d571e,0x4ccc23be
	.word	0xf5957dfe,0x7f3e5f7f,0xef9f4ed1,0x75560112
	.word	0x87c50cde,0xf8d0f23f,0x36669d5d,0x6c76b0ce
	.word	0x6fe2c7cc,0x4309f0d2,0xe1f55342,0xcb687128
	.word	0xa8177ddb,0xa1e0c804,0x3519f10b,0x90885603
	.word	0xd72bc2e7,0x5224f1bb,0x3ad3ed98,0x4d598ef0
	.word	0x0323bc41,0x9d1b3768,0xcaae7427,0x10230b5f
	.word	0x548e13a7,0x5a87437e,0x3e8e6482,0xa74e2e8d
p1_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local6_begin:
p1_local6_start:
	.word	0x66d59baa,0x7cda5c8f,0x4fcbe1c6,0x3a357ef3
	.word	0x0d0bfc36,0x6d704078,0xff5a2196,0xe2a82c26
	.word	0xfe335de3,0x749b5326,0xac0f61cb,0xc62980b0
	.word	0x3c9b049e,0x75788135,0x0caf2410,0x64a38944
	.word	0x69b4d0e7,0x24bce8e3,0xdb01f762,0xb36a5f32
	.word	0xa10d6848,0x768d69c0,0xb1d14c15,0x2a3db353
	.word	0x848cf36c,0x62109519,0xaaf839ed,0x8fb44f2e
	.word	0xd6da25ad,0xbbb38ced,0x2705ba00,0xce1dea78
	.word	0xc8c0e925,0xfa53ead5,0x5ae51cb1,0x99cef680
	.word	0xe1f1fcf2,0x70561378,0x49f94827,0x939bca9f
	.word	0x48315445,0x2ac434aa,0x138433a3,0xb958e1bf
	.word	0xd6d423bb,0xe1a96bcd,0xb36211dd,0x7300e403
	.word	0x18225500,0x45e23eea,0x3f5cac20,0xf5d0140b
	.word	0x4a2ddd4b,0x6c4569f9,0x323ec58f,0x486f7625
	.word	0x1dfa80b2,0xac0006c8,0x9f1d9827,0x7fac4125
	.word	0x5c3ec173,0x3ae8cddd,0x65ea78b8,0x1e0376f3
	.word	0xae7eed9a,0x8170ca0a,0xee0fff88,0xacbc50cd
	.word	0x286231b8,0x27a6eb65,0x926535bf,0xfc00a8dd
	.word	0xc8539719,0x4b9cca06,0x6babb2ac,0x80373d62
	.word	0x160d2b9e,0x94b823cf,0x63c41921,0xdf22b32e
	.word	0x5c930421,0x02065415,0x7af32d0d,0xc950bb9d
	.word	0xe3954d49,0xeb1ff3ee,0x6a368d2d,0xe627a47a
	.word	0x5f21bad0,0x2e8c3927,0xf03327ac,0x8450d1bb
	.word	0x914ae589,0x28c65aa0,0xa33c364d,0x94123ae5
	.word	0xc1d2c987,0x8cb46138,0x2f86713d,0xd469e2da
	.word	0x81b58177,0x4b19de8f,0x7ef755f3,0x151bea6b
	.word	0x376db809,0x89a86e7f,0x7a0ca33b,0x8d85627f
	.word	0x3dc26de5,0xb8b2b0ef,0x8bf09a0e,0x17c77401
	.word	0x52b0dad0,0xf3212229,0x33f50e8e,0xa70925f4
	.word	0x129c150c,0xd63582aa,0x39103dac,0x3277b003
	.word	0x11652027,0xa79846cb,0x077123fd,0xec11cbc7
	.word	0xc128c54a,0xcf8b3fb5,0xa6c410cc,0x0cb6fb2d
	.word	0x163bc975,0x0795f718,0x933c33c1,0x663b1792
	.word	0x902cc931,0x109f15c1,0x07f567aa,0x82ec77f2
	.word	0x18c4c1f0,0x780695f4,0x06ca25eb,0xa5569959
	.word	0x9ba64c04,0x066f9af8,0xe8a72d08,0xc8f8c764
p1_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local0_begin:
p2_local0_start:
	.word	0x6fe39f6f,0x5fec12a9,0x6191a7da,0x580b62a2
	.word	0xb60e9600,0xb61a58c7,0x92e00c61,0x8f3833e2
	.word	0x041d6bcd,0xa9513d2b,0x4c8fac57,0x6743b5cd
	.word	0x76c05c89,0xc056cbd9,0xce122a78,0xba7fe471
	.word	0xcc21189d,0x6b8e4284,0xab2a9c18,0x8bfc2ffe
	.word	0xfd5e0d93,0x8e158ec5,0x63333af0,0xda3b741d
	.word	0xebac59f4,0x17e52ca8,0x2b9bc51b,0xcee23f0d
	.word	0x1696f298,0xe96e355a,0x7cdd90cd,0x472ef1d8
	.word	0x5b40e2c6,0x1e9767c2,0x4a1d1664,0xf8f89858
	.word	0x8f82bd06,0x0fd3336c,0x2e683d05,0xcb064a13
	.word	0xb6f3e072,0xc55cb225,0xd1767b92,0x6aab4f52
	.word	0xe83e319a,0x56f302bb,0x36a8d1b7,0x1bce09b2
	.word	0x02c22151,0x590139dd,0x49c0d1b4,0x8d4ed2ec
	.word	0xe525c132,0x832c5010,0x0ffd8403,0xa10780d1
	.word	0x2584b120,0x614180e3,0xeceaf329,0x3a0ab75c
	.word	0x655a5221,0x134ba10b,0xff652a2c,0xd7ad5bd6
	.word	0x75c9df71,0xbb4fddb2,0x5fb88728,0x26b88920
	.word	0x5795ea57,0x407b3632,0x707e67d4,0x6ea9ee30
	.word	0x4961c0fa,0xfe0d57a6,0xd49167a8,0x1bf1fe47
	.word	0xd80735db,0xe3657fe1,0xfe454d8f,0xa1ff22e4
	.word	0xca4975eb,0xdf1718e5,0xb74ffb54,0x384473cf
	.word	0x2970d696,0x17b5b706,0x9a8bf965,0x3bc0d97f
	.word	0x0627ae09,0xdd686622,0x02433f68,0x8bdcda9a
	.word	0x05c3a0bb,0xc96867ea,0x709a7634,0xae94ed4a
	.word	0x46e393e4,0xeac0e0d3,0x663f3095,0x8c35f0a5
	.word	0xf9ae0884,0x1b48df16,0x8dcb7ca2,0x82db6a08
	.word	0x1a434ada,0x9aef305d,0x31eb7fb4,0x2fd2b5a6
	.word	0xa45bfbd3,0x27fdccda,0xdd2f1d1f,0xb7c15b87
	.word	0xc1f772b4,0xe427d49d,0x1384d15d,0xfafb18f5
	.word	0xda0564ed,0x7943796a,0xfd99fc80,0xc09b8bfb
	.word	0x45a5e8bc,0xa340551e,0x9edde1af,0xe3f2d8e0
	.word	0x091b0575,0xe6f758ca,0x7a406c7e,0xfd269739
	.word	0xdca80676,0x199dae5d,0x5a7a38d8,0xfc4bdbe0
	.word	0xa6ce0ffd,0xd5e7e972,0x4fcfc0d3,0x60bafdf2
	.word	0x3d8fb9c0,0x04a7faba,0x006c72ba,0xb4815d5d
	.word	0xf6ed9daa,0x1e2e1224,0xcd68167a,0x593d8dd0
p2_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local1_begin:
p2_local1_start:
	.word	0x837ae20c,0x50a6603d,0x475c4c98,0xa5c01cca
	.word	0x0f440e7e,0x9f1f3655,0x9d804886,0xb233a359
	.word	0x18071128,0x43532833,0x11c79e3c,0x209ff49a
	.word	0x1b54d4ad,0xa26089a6,0xdab78876,0x771e799e
	.word	0x65c26355,0x1f86bd6b,0x9e8ba08e,0x2b3aa1f3
	.word	0xce3902a9,0x7f9f294a,0x9e9dd758,0x349e5912
	.word	0x8600191b,0x41af9197,0x4fe7d178,0xa68c49a9
	.word	0xf877b217,0x8a18ce70,0xf9eb3eaf,0xce50c0b0
	.word	0x71c9030a,0x5a1da192,0x14e418f1,0x1ba5d064
	.word	0x9748752d,0x5d52446a,0xce204613,0xc5a7a2c5
	.word	0xe74c7e41,0x5d5b1646,0xa7866d8e,0x7ce2e4de
	.word	0x9b4d7e3e,0xb18fb8f3,0x0f12077d,0xf0d963b2
	.word	0xf8a1f8de,0xaa5ca3a0,0xff4944e9,0x9ba2a44a
	.word	0xdaf1b634,0xce5a0a1b,0xdaa3e570,0xb8520775
	.word	0x04a1467c,0x532a374a,0x1d80df8a,0x2b5c5570
	.word	0x2b243716,0x05419f56,0xee009ea6,0x9c79527c
	.word	0xa9f29d6c,0xb4ace454,0x6d989821,0x62a8f98b
	.word	0x8ed6a192,0x10578bdc,0xa6482086,0x28a02b93
	.word	0x7ddb83ad,0x1ab0af8e,0x12b7bc65,0x1e826b81
	.word	0x818391c2,0xab6cc450,0x8c2dcf80,0x6e2015ed
	.word	0x882d8548,0x90b0b362,0x9e86f040,0x1df9c71f
	.word	0x77885a34,0xd1877375,0xcd21f72e,0x5ef86b1d
	.word	0x97734ba6,0x0b3a2f93,0x4ab4ce8a,0x7912cf48
	.word	0x4e96572c,0xcfbc44b4,0x723d9724,0x37576538
	.word	0x051049e4,0xbd771df6,0x7dc4ea88,0x63548b57
	.word	0xd2d470d2,0xc11fe6d6,0xb41d4956,0xfca23d7b
	.word	0x2ebbef9f,0x9b3c6ba8,0x2149af03,0xcbc56675
	.word	0x9064ad68,0x79b34cbb,0x628e29cc,0x943fc819
	.word	0xca9ede0e,0x4de787f4,0x79b16c05,0xee96c5f2
	.word	0xcb4a80d9,0x4b1884f7,0x3adf207d,0x903d4bcb
	.word	0x490b4342,0x36d98a66,0xd99cd4a4,0x5114acd5
	.word	0x39609825,0x782e15b9,0x6d044704,0xf8ed0cc1
	.word	0xb3d7b345,0x18940248,0x7a3c76dd,0x098ad4e6
	.word	0xbedf64a9,0xd22cbec1,0xa0297ddd,0xbdf3e65f
	.word	0x7999995a,0x9e98bfe8,0xc9d0a38d,0xc3672832
	.word	0x2d9fd83b,0xc484394b,0x70964f7f,0x69766226
p2_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local2_begin:
p2_local2_start:
	.word	0x6eb559c2,0x045d4189,0xf56784a2,0xd17fefff
	.word	0x5e0e24c5,0xb54c34ca,0x07f03069,0x200bcc5e
	.word	0x14ed8ac9,0x7e9d3751,0xc8697c80,0xb0b5acfb
	.word	0x8e0f7d96,0x29249617,0xb3268127,0x9d7e048e
	.word	0x31dc1e8e,0xaf9822b0,0x1d6d4093,0x21636f8b
	.word	0x5fe66426,0x9d8ee9da,0x573b0dcb,0x9d53071b
	.word	0xc5a528dd,0xeb7d1a02,0x47b31432,0x8dd899c3
	.word	0x9102eeb2,0x51db7063,0x3ce9b932,0x6bf5ddc2
	.word	0xe33869a9,0xc68e93f1,0x55279682,0x3dccb9f5
	.word	0xac388592,0x2d174a97,0x41d8d3e8,0xead316d2
	.word	0x41481b7e,0xbefcf0c3,0x5a2599d2,0x4e14d0d9
	.word	0xe496c720,0xbb034afd,0x20dfbf8e,0x44d4cc94
	.word	0x8be1d371,0x96ed4f33,0xed9bdb22,0xfc8db7bb
	.word	0x399cfd18,0x89d328f2,0xff16b9e5,0x43994626
	.word	0x4ea47fb9,0xa337ddb4,0x43fa14f0,0xa8df0b2f
	.word	0x5cddde6a,0xfc3deb64,0x2211566b,0xc99f96af
	.word	0xa7d510fd,0xe63509d0,0x1963f72b,0x5c5aebf5
	.word	0x4637761e,0xbf42e603,0xb4212ccc,0xd5065f48
	.word	0xf6f00ad4,0xcb4e7510,0x4dd0348a,0x17bfbed5
	.word	0x630da7ab,0xab862dac,0xef5108b1,0x22848af2
	.word	0x3610e89d,0x0947e6ef,0x65dece6e,0xbd59d30b
	.word	0x98bd0beb,0x8ae727b0,0x45dd7519,0xb465493c
	.word	0xcb8fcaf5,0xea3d17f1,0x83922a0b,0x5a259353
	.word	0xbbfc5100,0xaf846a4c,0x0674e43a,0xd09b5fc1
	.word	0x7ea21481,0x0b1ee6a0,0xd7c719f4,0x930c4edc
	.word	0xf727b97a,0x57ee6cb7,0xa7fb5c05,0x7277d760
	.word	0x97726b00,0x6936bf59,0xf343b679,0xe29494c2
	.word	0x7bd3942b,0x63dde8cb,0x6e2bc68d,0x021accfc
	.word	0x1f89361c,0xf182e5de,0x79695c48,0x32dc5dd0
	.word	0xc7273467,0xf29b9796,0xd4576aba,0xc3dcc286
	.word	0x5c4500a8,0x249b1e46,0x54eb360b,0xaae2d4db
	.word	0x1ed2db16,0x4adcca7b,0x7f02ac93,0xf41f5273
	.word	0x4b53b3a9,0x97185341,0x579e8ab6,0x0decc5e1
	.word	0x9d3873a0,0x7549323c,0xc68c2a77,0xf297be7b
	.word	0x129e60b6,0xa7df1fc6,0xf6e49ae9,0x77b6581b
	.word	0x3299d6af,0xf43935db,0x8b6186a2,0x6fb68af3
p2_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local3_begin:
p2_local3_start:
	.word	0xdec927b4,0x67494200,0x98067e8c,0x5a568f7e
	.word	0x16a1a017,0x4183553f,0x9519c74b,0x3d64598c
	.word	0xaf401f04,0x5f339e15,0x8cfd205a,0x7e7bf6c5
	.word	0x50fbff16,0x5f97b394,0xb058e297,0x725c89d9
	.word	0x42e9d279,0xebe25987,0x992de0a9,0xf5061198
	.word	0x31a3451a,0x2ea98ed1,0x1cdd29bc,0xb9794c79
	.word	0x4bb8c42f,0x94383fcf,0x3184477e,0x60e16ffa
	.word	0x129ddcd4,0x9b16615e,0x24755056,0xbb39d2f7
	.word	0x5cbafed0,0xd18273b4,0x7faa41c4,0x815a7c39
	.word	0xd915e503,0x3d417fc4,0xe94d88a8,0xd60f89df
	.word	0xd5a4386b,0x88e9e0a1,0xd7427a42,0x61ad833e
	.word	0x80ed2929,0x5e718c41,0x0f7d4533,0x1ae92e6e
	.word	0xb68116f7,0x2429057c,0x8aa79cce,0xf5d4e7da
	.word	0x88afa2ff,0x77d41d70,0xba1ea2bc,0xa177d27f
	.word	0xcfb13c9d,0xbebbedd1,0xbe7d943b,0xe5a86755
	.word	0x5ea647ab,0xaaa41204,0x7df68d8f,0x1f4ece41
	.word	0x4d89b0f5,0x0c6ea1c2,0x1859c052,0x524c55f5
	.word	0x3d5b199b,0x636d3599,0x1b617115,0x51aa4420
	.word	0x23a69b98,0xdb477e92,0x781c6541,0x4383c998
	.word	0x787cf05e,0x17b573cb,0x95b2316e,0x291a7c94
	.word	0xb8f065ea,0x61062e07,0xdc0d8cd3,0x12ea854e
	.word	0xd132e581,0xa1835866,0x186fca20,0x4fe21ec9
	.word	0x2667b258,0x4d63bf0c,0x2b406102,0x9085f665
	.word	0x7b0d1060,0xd5477e2f,0xdaffa29d,0x41f10db2
	.word	0x05fb285a,0x330ebde3,0xd1265475,0xf8ab097b
	.word	0x09ea8b7a,0xbea6982d,0x150c0268,0x8f3df7f3
	.word	0xc3a75d31,0x31195f39,0x5ec04504,0x5ad864b5
	.word	0xbf5cc1ef,0x0ba7f434,0x68c5d547,0xb1836113
	.word	0x5d502100,0x166a0b6e,0x9b5eac89,0xcedea44c
	.word	0x4fbb910c,0x9c15297d,0xa237b170,0xc4560715
	.word	0xeaba4551,0x07e065b6,0x1ba3182d,0x2d6f293a
	.word	0x4bd734ef,0x39541d69,0x788cfd55,0x0f9d3e38
	.word	0x896e5250,0xb65c15b2,0x8b46f17c,0x47ae4946
	.word	0xae8e0157,0x0301733a,0xba9fb09f,0x1c7017df
	.word	0x3995c158,0x97443738,0x1cbd79fe,0x81ea82c7
	.word	0x6de5b8da,0x02ca07dc,0xf3ea0c43,0x65ab5d28
p2_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local4_begin:
p2_local4_start:
	.word	0xceaf99b4,0x6d52136a,0xdb8e7850,0x45742be0
	.word	0x0946d5b1,0xca551851,0xf9f5c68e,0x948eeb83
	.word	0x3c62ca74,0xa64e8375,0x619143c4,0xc4949e1f
	.word	0x8f94c3de,0xf8e8a7ea,0xc79c9d45,0x94db3a48
	.word	0xfc996888,0xf5197136,0xef2b2549,0x9a3bd635
	.word	0xcec454f4,0x1ae72a7c,0x3f510e4c,0x584911c2
	.word	0xca114999,0x9c728923,0x9b39c086,0x43a4e451
	.word	0xce4d80ea,0xa47cc557,0x49c8817d,0xb2921e29
	.word	0x08d38152,0x9aa89abe,0x68d06ed6,0xdccce676
	.word	0xfc8d49da,0x66a6018d,0x0a0d1951,0x424c9ba8
	.word	0x6cdba526,0xdbf251c8,0x4ec4304d,0x03262751
	.word	0x1035bd54,0x05f5e4c7,0xa67068c8,0x293f6076
	.word	0x24d1b791,0x1f409395,0xe6588029,0x3f95fa92
	.word	0xb9d925bd,0x1e522bea,0xed9fac4e,0xd171a8b9
	.word	0x76af32dd,0xdc0a2180,0x0099e51a,0x65edd242
	.word	0xfda3517a,0x6a77ce1f,0x231af9fa,0x17d066bc
	.word	0xc15733cb,0xb3d7fb33,0x7707a95d,0x81bf4877
	.word	0x607bf384,0x15923509,0x60e48974,0x9416c0e6
	.word	0xcc2b0da4,0xf2e9ad7c,0xdf07a3d8,0xd314ff8d
	.word	0xa2efa208,0xc0ba2534,0xb839a563,0xfc57a68e
	.word	0x129a5701,0xa0f64f62,0x14d00d66,0xee494b79
	.word	0x33db45bb,0xb3b9f19c,0x8032fbe5,0xeb9d6b82
	.word	0x65b515c8,0x889ab1c9,0x9354939d,0xb8398f72
	.word	0x3c475d43,0x46815927,0x3baca396,0x5d630074
	.word	0x2a502b16,0xfe4a2a76,0x890179b0,0xa3bbcbc6
	.word	0x36a347d2,0x4afec71b,0x2d40ac84,0x9fbc7dc1
	.word	0x2f31dd3c,0x3b5a36ed,0x709f11e1,0x786af81e
	.word	0x16910f26,0x50727f0b,0x8b2aa3db,0x3b909ef5
	.word	0x44624ab6,0x4e4a122e,0xc4bd321b,0xc7a3f371
	.word	0x812174d7,0x1baa8784,0x597fef0a,0x021d7e08
	.word	0x8608a830,0x58726fff,0x39c0ddf6,0x637873f6
	.word	0x366634e3,0xaf88a659,0x991cdd40,0x7a3ecdaf
	.word	0x5509dda5,0xce573f3a,0x84d4ea6e,0x4ed24ade
	.word	0xac79dec3,0x99a582d3,0x5e6773cd,0xb85ad5d7
	.word	0xa8f37cd8,0x5ce19007,0x68d1f4c4,0xd0d107c4
	.word	0x392a6070,0xf6e6803b,0x8cbf8290,0x33e48a07
p2_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local5_begin:
p2_local5_start:
	.word	0x375e539a,0xf951727c,0xec0bfb92,0xc10b5002
	.word	0xf1e15c3b,0x03843a44,0xe0d694cc,0x77321b2c
	.word	0xa8f3f463,0x97adb46e,0x553cba09,0x77c67f95
	.word	0x04c0ace5,0x91c3cd8a,0x83470ddd,0xd2b879dc
	.word	0xfb8eee77,0xdca1a58c,0xb9b87587,0xb1916db2
	.word	0x9343f815,0xe659ad87,0x5be24463,0x52a9287e
	.word	0x2f4a795f,0xcb85223f,0xd09c5d91,0xa36b31f4
	.word	0x83982aa4,0x710ed21d,0x7a6230b7,0xba29bcf9
	.word	0x05795472,0x1bcc8a57,0x00ee85d4,0x0ec8f93b
	.word	0xa0360b40,0xc890186a,0x15c8f956,0xa00b3f8a
	.word	0xfa473ff6,0xde50a0bd,0x06b1601e,0x272a35fe
	.word	0x56489cef,0x012dc1c4,0xd64ef275,0x9e0541d5
	.word	0x71ff8de2,0x3e23a701,0x1329da16,0x7b1234bf
	.word	0x818bc0df,0x8198ac9a,0xa96b37b3,0xc8ef6aab
	.word	0xfc015bed,0x57c15590,0x1a3a4d3a,0x847ac0ee
	.word	0x4e7d070a,0x60094cf1,0x318afdcf,0x6a11f5e7
	.word	0xeab254d3,0xf704c628,0x3c2f97c4,0xe09a13a0
	.word	0x1cd06d32,0x539e7cba,0xbcb4005e,0x34a6dd4e
	.word	0xc41e286e,0x80a59458,0xdf154a0d,0xc62fe4d3
	.word	0xb671cf59,0x161f96d7,0x202e22ea,0xa4d05e7a
	.word	0x003e3486,0xdee6e188,0xbb5baa2b,0xf80a876f
	.word	0x7c999ea3,0xa97e2902,0xe3c2b8ae,0x81210fcd
	.word	0x7c8b8b0e,0xfcf77d86,0x8c97558c,0x4d460a74
	.word	0x10c0a75d,0xdb48218d,0x2ac767ca,0xcaee5365
	.word	0xf57cb98b,0x08c8859b,0x3b3fba16,0x69d94293
	.word	0xfb591633,0xf922b97a,0x63924e45,0x4136451f
	.word	0x860f7d6d,0x21ea0a2f,0x1126a15e,0xe93e1b1e
	.word	0x856484ef,0x13c0c3e2,0x08369434,0xb9f7e429
	.word	0x9ada0af5,0x784d69d5,0x6119916f,0x5738b2c4
	.word	0x078efd5d,0xfadb0d25,0x4a471107,0xddeb4d75
	.word	0x4543baa9,0x4aff6dce,0x467f5088,0xfebf3ca2
	.word	0x62f8dfb8,0x9175c630,0xd30c49cc,0x1be2644b
	.word	0x6cdfe33d,0xe882e977,0xa688dea2,0xee637fb1
	.word	0x54e5c2cd,0x9326e1e8,0x0f7bfd78,0xd76a569f
	.word	0x8b52064f,0xd6297407,0x072f5bb5,0x4feb28b2
	.word	0x7770fc4b,0xbefc0d5a,0x376ee2f0,0x7b6f4451
p2_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local6_begin:
p2_local6_start:
	.word	0xa938917f,0x8546c74d,0xa174e808,0xfc13a031
	.word	0xe1ed3611,0x42b44887,0x80884f1a,0x7171f3ec
	.word	0xba87bca2,0x0523a5aa,0x188af3e7,0x9e0188a2
	.word	0xe852dc71,0xc7eda62c,0xe458080c,0x1fd46bdf
	.word	0x99a8c298,0x1af18b9a,0x45d6f79f,0xa8c3a9a6
	.word	0x54b9d7e2,0xb24997e8,0x6f0e14ca,0x0ddafcc0
	.word	0xaa86ddcf,0x08503c77,0x9e502bf7,0xe833e1d5
	.word	0x573d7b2b,0x6aff6c85,0xfb2a39d9,0x36a33a63
	.word	0xd3d3b852,0xfb5c1b31,0x52333f89,0x8debf281
	.word	0x39279d05,0x5b88bca7,0x353d4cdd,0x5f9d0f5c
	.word	0x0eace972,0x39a156e2,0x904ef66c,0x214909f1
	.word	0xfcee5439,0xb7a4198f,0x3c1edb3b,0x5d02a2e3
	.word	0xc193eeb0,0x0868a35e,0x4367314c,0x37d967a4
	.word	0x32daf328,0x24241301,0x6d40e553,0xf336b072
	.word	0x19ae6390,0x0f47de0e,0x0fbdfc4d,0xbb0c0813
	.word	0xb9bbf7f6,0xec774439,0x1d22cf76,0x31317b1f
	.word	0x05a0fd31,0xa8362e80,0xc5bfb73d,0x960987af
	.word	0x582cff90,0x25a77e4b,0x98946f6d,0x990ff089
	.word	0x752263d3,0x8f866e99,0x7b498b97,0x15d7d346
	.word	0xf16aad70,0x22bd509f,0x18f358dc,0x7999394c
	.word	0x7b33bb1b,0xcf3c53eb,0x1f479611,0xf34eaede
	.word	0xc30eaf6b,0xbfa24c25,0x2db0c107,0x1acd43b6
	.word	0x24ea9b07,0xcfe924da,0x7eac92bd,0xffddca8c
	.word	0x143104a0,0x5396e913,0x4649e1c9,0xaa51a8ca
	.word	0x88953e2c,0x9635c61d,0xd6a09890,0x1757d09e
	.word	0xbb0fb704,0xc0db1535,0xf13978d3,0x9f4ac426
	.word	0x8f0968bb,0xf1724558,0xe13d72e2,0xcae4a745
	.word	0x0972820f,0x07ac14ff,0xf997a438,0xb312b8bd
	.word	0x1a51143e,0x32c01ee1,0x16179935,0x926b9d8b
	.word	0x33bf8983,0x714ff805,0x09b61aeb,0xe62fec10
	.word	0xfda3658d,0x866564bf,0xd67952cd,0x33d4c691
	.word	0x422e563d,0xececfc15,0x311d93f9,0xeb9570f9
	.word	0xd7cef3e3,0x09e1c7f9,0x1a50f95d,0x7c49538a
	.word	0xd2573bb0,0x5255c024,0x965ca832,0x10713b58
	.word	0x4a04e34b,0xd7ebc835,0x5c9737aa,0xa70b3226
	.word	0xfd237974,0x1f5a5cd2,0x7dfea3a2,0x9d7d5451
p2_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local0_begin:
p3_local0_start:
	.word	0xccf7290c,0xcf69c147,0xe4180dda,0xbda6a27b
	.word	0x6a65cf32,0x0411cc94,0xf9137e2c,0x90424464
	.word	0xa083ce0d,0x82a8dac8,0xd139a489,0xcb416a98
	.word	0x1aa4c26a,0x3e6d27fc,0xf1a5b720,0x02e88cbc
	.word	0xdbfc08f0,0x337d74ee,0x9f1f9dd5,0x90739d27
	.word	0x8850e1e9,0x281c1e84,0x83d48000,0x36baa0af
	.word	0x46ace8ed,0x30254b48,0x4655de92,0xe64caabc
	.word	0xc285698e,0x1e05c400,0x74ce1fee,0x35bcacda
	.word	0x74347eff,0x865a0a08,0x58c32631,0xc85fab1b
	.word	0x3756f4cb,0xb7d18c51,0xb83f2ac9,0x4406c658
	.word	0x35561378,0xecca160c,0xf1128181,0xfff06c07
	.word	0x9e1423e1,0xc6a7e49d,0xd21068c4,0x49b4f0cd
	.word	0xd4243fa0,0x62a42298,0x648473a4,0x4f85944d
	.word	0x06d32df3,0x738d183a,0xe69efbde,0x76edcad2
	.word	0xcb813e14,0x43e77be1,0xf883c567,0x757d1185
	.word	0x32955030,0xa8cd31b7,0x214dc65a,0x8f58e837
	.word	0xb12933f9,0x41d38ced,0x0166c383,0x6760874d
	.word	0xc1f40378,0xaf8e2b13,0x9b81c89a,0x4e12388d
	.word	0x8c878644,0x75b34ce4,0x31b03417,0x54f46033
	.word	0x297ec66b,0xc0af7dbb,0x74f1ec0e,0x5c821661
	.word	0xe7aa1a42,0x6e8c9e24,0xb2baece8,0xe38094dc
	.word	0x233e97f9,0x5fe191f6,0x2c6109f4,0xd7ec6122
	.word	0xa757a793,0xb5b542a3,0x489c696f,0x7daf8672
	.word	0x3c921dc0,0xe92bef80,0x9ecd9aa0,0x7c2d2895
	.word	0x12a06b4f,0xc1f3ff88,0x1783226b,0x176161f7
	.word	0x66d2fe33,0xd35cb718,0x013f94d2,0x6e066a20
	.word	0x3825d380,0x8a86bcef,0x7c2c0ada,0xa07da629
	.word	0x278605af,0x737afc49,0x860a93ab,0xeda767d2
	.word	0x89b13d39,0xd53cff92,0x4847c83f,0x0123ce29
	.word	0xc8f5b198,0x87c77d9b,0x545843fb,0x1328034f
	.word	0x2fa4adbf,0xe70ff2ea,0x768d1280,0x0b7ac1b5
	.word	0x8d962ebd,0x87aab17e,0x6c0eb3bd,0x6917c904
	.word	0x0f6887ac,0x29292baa,0x2b865216,0x44eafff4
	.word	0x01217527,0x5556d84e,0x7813fc9c,0x5e8a785a
	.word	0x0b77d306,0xad3e5588,0x9e47a016,0x888e2606
	.word	0xf9040baf,0xa15851ee,0xdb6877fc,0xcdd93776
p3_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local1_begin:
p3_local1_start:
	.word	0x291fa92c,0x49d9f51b,0x9ab367e0,0xf654389e
	.word	0xfc3a4a85,0x28702b62,0xe15028f5,0xc5af943b
	.word	0x0927ef90,0x6c0b594e,0x266c8478,0xd3c2533f
	.word	0x08314062,0x68cef0df,0xe632b6ee,0x19754e56
	.word	0xd411ddf9,0x70aa5786,0x75402a15,0xe9983f32
	.word	0xe546b0de,0x91846dba,0x1fd09a06,0x2ac962c7
	.word	0x3a3686ba,0x7e0b4e86,0x96bb0e59,0x2a115068
	.word	0x3a2e52a3,0x3346c31b,0x428f78ca,0xd36419ec
	.word	0x59104cc2,0xc144b49e,0x0054e9d6,0xc1be4a71
	.word	0x44ab6005,0xae8b2207,0xa7108540,0x1d541982
	.word	0x140c2965,0x13ff1d0c,0x0000938e,0x76b3365a
	.word	0x8592471c,0xea356e43,0xef8b5fc6,0x7bd7182b
	.word	0xa75fab21,0xaaabcddf,0x66b1e1d9,0x830d462c
	.word	0x49792b1b,0x4e593acb,0xd9526402,0x7f755755
	.word	0x97edbd56,0x9abf5be6,0xdd186cb6,0x0c322416
	.word	0xdb2df7d5,0x2096465a,0xf3e8e6c8,0xd33964e3
	.word	0xb75076ce,0x5fb34d61,0x1b963252,0x913ec946
	.word	0xb8db7d40,0x1efc5b48,0x18515aff,0x6b36b66a
	.word	0xf3d1d5de,0x1426f05a,0x100394f0,0x7030f2c8
	.word	0x821b2bca,0x6cda30a0,0x7806dfc7,0x828848bc
	.word	0x74d35cc5,0x6f13d71c,0x9fe43daa,0x97de0ca4
	.word	0xb563f654,0xf707c1ee,0xe66238e9,0xacd66129
	.word	0xf6e5fec9,0xa3777dfd,0xc91b25d4,0x91ce3abf
	.word	0x647e8b07,0xa44be492,0x8b8521e3,0xc2c9c5e3
	.word	0x2a022b4c,0x58b0b840,0xae74cc42,0x4733cd41
	.word	0xd343c871,0x38b8726a,0x2dda2b28,0xda6b5542
	.word	0xaf3f4017,0x6b8a79aa,0xace15e24,0xd552b2aa
	.word	0xa5a7ba09,0x36ad2539,0xa97452cb,0xebe1d594
	.word	0x0bd6495c,0xa79401ad,0xdd73c9d9,0x9203f615
	.word	0x6fe7aa5e,0x4dd77dc4,0xede471f3,0x884a1357
	.word	0xf907ace6,0xff8734d6,0xea77cb0b,0x5fe37d16
	.word	0x9c31159d,0x70adbf60,0x775df7ac,0xa89a815f
	.word	0x0365a74b,0x5e88a9f1,0x7cc473d4,0x6ee1bb07
	.word	0x276c805e,0xaf42ea54,0x50a8b95b,0x1d13ffc2
	.word	0xc94d8dde,0x908624d2,0xba6b0718,0xa710dadf
	.word	0x6619b511,0x3cbd6b78,0x519d8a4e,0x5df07d75
p3_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local2_begin:
p3_local2_start:
	.word	0xbfaac829,0xdf8f5527,0x636fc85b,0xa5408c6c
	.word	0x403da75c,0xa07190e0,0x9a923498,0x466347ba
	.word	0xc8d0b3ba,0x7c623729,0x1e006dd1,0x4b1f68ba
	.word	0xf5501bd0,0xcad6f1b6,0xc4c6ae0f,0x9b052585
	.word	0x56299d01,0xc067a87b,0x06f88fc8,0x8fa1f477
	.word	0x434d0f39,0x5f80cf35,0xb67be08f,0x7f35cf8f
	.word	0x6ec9aac0,0x9602952f,0xde50fbf9,0x6f4838ff
	.word	0x9bbf91c3,0x98023a05,0xa04af9aa,0x35fe1c6c
	.word	0x6a9f7af6,0xa58e88c8,0x9137d6ef,0x6367ab64
	.word	0xaa3530d7,0x9e04cdf9,0x3acda428,0x0af58e90
	.word	0xddc5f9e2,0x67eab1f9,0xa26cc3e8,0x56eff1a4
	.word	0xc186d1ad,0xb7c74efe,0xeb1359f4,0xf04017c3
	.word	0x16521172,0x541e77c9,0x06bff06b,0x678fd04a
	.word	0xddd4d9c6,0xb40152c8,0xab732fec,0xf7881c37
	.word	0xe8775dd7,0x0f9f5f89,0xe7f7d6a9,0xe8299fab
	.word	0xdcb3f177,0x0296cb8e,0x3c641f94,0x57d33775
	.word	0x4c6cab1d,0x21d40387,0x2f3eea2c,0xea286c6a
	.word	0xa76df975,0xac584162,0x8936c76b,0x0c725f30
	.word	0xa5c27fea,0x5aa44f22,0x998a9087,0x636e5aab
	.word	0xb6327836,0xb42cf769,0xfa06e3ab,0x118815d0
	.word	0x62e7dc9d,0xa98579f0,0x35b14d89,0xb562a63d
	.word	0xb85c35ec,0x20ae06e0,0x55aa3818,0xf24836da
	.word	0x898566a9,0x6d9c1817,0x1ec900e9,0x5e1cd62e
	.word	0x3e42ebbb,0xa1c92b2a,0xdddefc96,0x1ad7854e
	.word	0x235b7832,0x84ad917d,0x1317f1b8,0x7fa659ba
	.word	0xccff7c79,0x9b846e9c,0x667de74a,0xdb5d64b5
	.word	0xa7b04912,0x0609d124,0x554d9bce,0x8c54573b
	.word	0x1e2b74ea,0x19c290f0,0x324612ff,0x49664fd4
	.word	0x1dfd8d1d,0xc279e24e,0x214011ac,0xf78974fa
	.word	0xeaf4f7c3,0xa8df6157,0x02c9df2d,0x09f93dc1
	.word	0x777bc038,0xc5e0485b,0x3cf50739,0xebf0e330
	.word	0x6441057b,0x9d7293e4,0x435d47fe,0xa935ce6d
	.word	0xa13a2f4e,0x8cd20f7a,0x02b4ca6c,0x6491ce1e
	.word	0x15620716,0xc1a33a24,0xc788a6e2,0xee86feb3
	.word	0x472188f0,0x54e11675,0xd475b47d,0xd17a99f0
	.word	0x11e95443,0x590b9a3b,0xa9c46617,0xd423a5aa
p3_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local3_begin:
p3_local3_start:
	.word	0x811e8da9,0x987d9ef1,0x89e8bbe3,0x173258db
	.word	0x81b07fa2,0x569c9b54,0xd0942d9f,0x2390eeb0
	.word	0x1a87ccdb,0x487ee5de,0x3ee46422,0xe1f49638
	.word	0x0c4d574e,0xe5e40858,0x831a4e54,0x2750f928
	.word	0x30fe5c80,0xe2a8eb53,0xeae33a24,0xaf2cd8ca
	.word	0xa06f3740,0x947b9c37,0x43429894,0x76d923f7
	.word	0x12cb0952,0x991efd44,0x89e08803,0x69b04492
	.word	0xd86f8598,0x345e35bd,0xbada29b0,0x37168e89
	.word	0x7a0d5b9e,0xa12da434,0xe5fe90aa,0x70449daa
	.word	0xe408ebbd,0x0c03538a,0xede3c468,0x89ffc421
	.word	0x61be0dd6,0x163cd6ef,0x1338cce1,0xd97994aa
	.word	0x5b28736b,0x2e017605,0x2c87536d,0x58757e0c
	.word	0x2baebe4b,0xb34405ef,0xaedbfa9f,0xeca1b220
	.word	0x011589da,0x68f3200e,0x3304972c,0x46e26e5c
	.word	0xbcd9b534,0xc148567c,0x122e75cc,0xdedb346e
	.word	0xc0e9062f,0x9f709a53,0x33768b42,0x8284a508
	.word	0xeea28620,0x15aac7c2,0xa87026f0,0xe63d0abc
	.word	0x99a5138e,0xc0f73d2c,0x50b792fa,0x80dfd51d
	.word	0xd3d987f4,0xe7495b64,0xeb670b21,0xc697a759
	.word	0x734b7e46,0x92ca54ec,0xc478fc6c,0x4126d735
	.word	0x6e6f38ac,0xd6b1a3ab,0x3bb10b7b,0x3645c0c7
	.word	0x78bb32f3,0x9afce363,0x1a36efbd,0x1f86acbc
	.word	0xc52fe75b,0x2f991992,0x0d3006f4,0x4e1615cc
	.word	0x1d5dfb18,0x7b08e5c3,0xab052eed,0x5a4c95b0
	.word	0x9afd4c50,0xfdb15ab7,0x95c82b83,0xec304854
	.word	0x6bd59f72,0xd41b1344,0xa299aa79,0x96657001
	.word	0x52d31f21,0xc5b167f0,0x20b7423f,0x4f588f50
	.word	0xaebb42b4,0x5efa64db,0xe9972bab,0x859e033c
	.word	0xb0109746,0x9f01b887,0x721f3691,0x714771e0
	.word	0xa347e774,0x3df1e1d3,0x2f476e25,0x20fc4a21
	.word	0xc1872bc8,0x5957621c,0xa767b88d,0x06543d1e
	.word	0xb33c44bf,0xc57670a3,0x80fef984,0xbc6fb866
	.word	0x3d3c3ab7,0xd8b4b189,0x3667fea5,0xef211d2d
	.word	0x78b3751a,0xe68bf3ac,0x9ab39bf8,0x25ff0a1d
	.word	0x6815a104,0xaf9bbe51,0x64ae39c7,0xb61f1cf0
	.word	0xb3e7542b,0x8894fdfb,0x14a66bdc,0xdead2ae8
p3_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local4_begin:
p3_local4_start:
	.word	0xbf829b52,0x17739cf4,0x6eb3806a,0xdc8589c8
	.word	0x36ef91f9,0xfabe570b,0x4ac6e5d0,0x29332765
	.word	0xcb79f03d,0x2eb9f49f,0x9706ed6d,0x5494e3cb
	.word	0x4309f936,0x43ad38b6,0xc553028e,0x128ee0a4
	.word	0xef36f76b,0x9c99c2e5,0x75aedd6e,0xb1d6f8b3
	.word	0x5f4b3108,0x2bf7a006,0x429fc18a,0x26fef070
	.word	0xeae1792c,0xcaa30891,0xb3d5dc0c,0x85a9f545
	.word	0x2360218b,0x98100e3c,0x1fbeafb8,0x39006f5b
	.word	0xd2835cfa,0x2c531878,0xdcd0676d,0xd4eaa70f
	.word	0x3417a1a9,0x0d0ee6ee,0xa9e70e80,0x35e9d09a
	.word	0x2a712eae,0xaaa041c5,0x5b65ede8,0xddf0cf7d
	.word	0xe26435e6,0x4bdce32d,0x1192383a,0x82cef1c2
	.word	0x977d8e48,0x21339bbc,0x7fcb5866,0x7a8a8e0b
	.word	0xbf72c041,0x725ba843,0x09479977,0x3dbe628e
	.word	0x753cf729,0xbf2f9840,0xde4e731e,0xdad1b904
	.word	0x89a6ec16,0xe5355f03,0xe3b9381a,0x3af8f985
	.word	0x9fc25b5f,0x15c58a78,0x0c5f092e,0x18685bb5
	.word	0xfa3f507c,0x920c9eb1,0x68885f75,0xe25d1f39
	.word	0x043f9374,0x58121c8f,0xda8714b6,0x1251a837
	.word	0x2f49f0a6,0x0421335e,0xcbc51dff,0xcf4fda23
	.word	0x13e35ca5,0x6339a4c4,0x26ce6c5f,0xcf37eb03
	.word	0x44bebdd1,0xfcf69c30,0x09db3874,0x2650f0e5
	.word	0xc9fbe2e3,0x7cf271db,0xbc1b60e8,0x9509d826
	.word	0x238637cc,0x58b8388f,0xef376aa8,0xd3b61f09
	.word	0x1963ff6e,0x96ef3d81,0x612eae66,0x25d2bc6a
	.word	0x0bef08f8,0x4730517e,0x00569c23,0x8b54d455
	.word	0x6ca7cdb7,0x4a666240,0x72dfdda2,0x9f928ece
	.word	0xd8abe4eb,0xfe180419,0x152e8210,0x816f4440
	.word	0xb05a7a50,0x67d44c6c,0xaf44e265,0xbefa25ee
	.word	0xfcfa0710,0x999bcceb,0xb5ba5fef,0x77d69bba
	.word	0x387fb5d1,0xebafeb67,0xf28a30c1,0xda31c422
	.word	0xa5d3c9d3,0xa80dbfdf,0x6bb07f5e,0x66f59fe1
	.word	0x6c835de9,0xa00ee8b6,0xb2c0c359,0x84e8a709
	.word	0xea5b6815,0x23277e90,0xb7461d55,0x7c655df5
	.word	0x33be7c5f,0xaae136bc,0x73507f29,0xe76d2a31
	.word	0xb4b0d058,0xbdb61b76,0x2c1ffaf2,0x488b4768
p3_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local5_begin:
p3_local5_start:
	.word	0xd89d74c1,0xee3b3bc6,0x4308f544,0x0b908ac4
	.word	0x84059001,0xc4220549,0x4af1c150,0x0db2ea97
	.word	0x3811b07e,0x66906894,0xb407b6b4,0x8d663c0b
	.word	0x03146cf2,0xf78e972a,0xc9c9b669,0x2c3a897f
	.word	0xf27a83f9,0x6785bf91,0x4ebfac9a,0xb7c26433
	.word	0x0c578a45,0x2b0f918b,0xc171153f,0xee038496
	.word	0xabc9a781,0x8fae4fbc,0x7bda1081,0xd2e0e3fc
	.word	0x9dee8b31,0x1762e543,0xe8bf1c92,0x2b55c725
	.word	0x91275aa8,0x928d9c29,0xac4371ac,0xe1ddee9d
	.word	0x12287a98,0x1c64a6a6,0xc8819f2c,0x399c7fd5
	.word	0x897c1166,0xde7d4783,0x771359f9,0x594c76fa
	.word	0x11c58706,0x40182fe6,0x19041741,0xb1aa3863
	.word	0x97345cc2,0x9d61da8c,0x43017ca9,0x406437ff
	.word	0x04b95b32,0x3f9f1eda,0x41339921,0xbf0fc60c
	.word	0x9b2a0ec1,0xa982ef6f,0xd4b7b1ee,0x54912486
	.word	0xcf0514c7,0xf2fbaecc,0x65cd6c37,0xc62ed892
	.word	0x2271771d,0xf356b927,0xb0c0d6c7,0x71988f08
	.word	0xd83e7f6b,0xb1d17d58,0x2cf62c92,0xd7411e34
	.word	0x9a43c4d3,0x796cee0e,0x2f10c8ac,0xc57898b6
	.word	0xc1ae8360,0xd00ae1dc,0x9043fed3,0x1ef5b7f1
	.word	0xc17edc0c,0x14e36896,0x8f3d985f,0x3b4b6e6e
	.word	0xbb51eca1,0xd6f6f2d7,0x78d851cb,0xf9953b67
	.word	0xdb3735ce,0xc18ca900,0x15c8dfea,0xf05bf0cf
	.word	0x94363e1a,0x97bff4e2,0x1ad2e59a,0xfa64b5bd
	.word	0x9ec35c0d,0xd914003a,0x51d6e7f2,0x5129e7b7
	.word	0x1ab8100f,0x1d9562e7,0x73ea62da,0xffaef158
	.word	0xd564f0a4,0x9aab0584,0x30acfbd0,0xf2e3f618
	.word	0xcbfdc5fe,0xb97701f7,0x1541a2af,0x4ea2bdbf
	.word	0x9ab75f47,0x6bef3108,0xad1d22c2,0x03dc5f6e
	.word	0x767c5f8f,0xf8b3b0eb,0x02d432a4,0x43defa92
	.word	0x04cce61c,0xcf4d55d6,0x2962d3e9,0x48ae5f56
	.word	0xf9622c89,0x4ac92d80,0x23f30801,0xac5a3254
	.word	0xd09923f0,0x6c9f01ca,0x658cbea2,0xf5d7f69d
	.word	0x47b1d46a,0xb7df7d44,0x9666155a,0x15eedf39
	.word	0xfd6e8681,0x39308c20,0x666170a2,0x3ae50cde
	.word	0x663e651f,0x932505af,0x951fe0b3,0x2bc00d8d
p3_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local6_begin:
p3_local6_start:
	.word	0x6a308dd9,0xa49a58a3,0xc8a3b7dd,0x09b2d8ac
	.word	0xf1b4e966,0xe5204355,0x97746efa,0xfad77472
	.word	0xaa1070de,0xd15b3d03,0x57068917,0xa3982c90
	.word	0x6bb8f3c7,0x7b7a12d9,0x4999ce70,0x7f41e732
	.word	0xe907ab4a,0x135c7464,0x188824e6,0xd7bc5b93
	.word	0x2dab6fa7,0xb9028c77,0xcc6e77d1,0x25495998
	.word	0xbc8dcab2,0x28678157,0x9fef6a76,0x4d70c5e9
	.word	0x3de47d38,0xec7939a6,0xa4e57970,0xbc6ccd31
	.word	0xbfb6cd4d,0xf6841ca2,0x03dd2425,0x9710c9a0
	.word	0x238cb35e,0x14f824ad,0xc74cbec0,0xcd43603f
	.word	0xf48f9582,0xc5545b1b,0xbb024d7e,0xa26fee95
	.word	0x193c1207,0xcd6f817e,0xe3f15274,0x967bf9f2
	.word	0x17f71a64,0x90d4a235,0x6303dc89,0xc9ed7a75
	.word	0x2efaad0c,0xa2deff17,0xf4738f88,0x80c4135f
	.word	0x74b0096d,0x88e3c662,0x3dcabb00,0xbf69c8c1
	.word	0xf06d77b4,0xce7043bf,0x18de0aee,0x9f669caa
	.word	0x83590cc5,0x010d127b,0x68720b35,0x21c4dab6
	.word	0xaa22a232,0xaf9cefef,0x3a687b04,0x3e7c0b45
	.word	0x5128d169,0xfb8e0e3c,0xfbd9c3e0,0x206b0f71
	.word	0xe5ba233c,0x56e1b7fc,0x2fd560e1,0x0f8b0f5c
	.word	0xf8e91307,0xf92402b4,0x57207607,0x961cd0de
	.word	0xaec53e59,0xbb0fed35,0x1c61c81c,0xcebda54f
	.word	0x6ad7fe02,0x06faf5cf,0xd6e9d809,0x0a34af76
	.word	0x915cd210,0x196701d0,0x97dedfda,0xcead61f7
	.word	0xf53e5184,0x58bf0d1d,0xda2620b6,0x454828a5
	.word	0xa8dfbbc9,0xfb78472d,0x31f7be75,0x617ab76b
	.word	0xd9f49527,0x8619859a,0xcaee011a,0x8149cc16
	.word	0xf8a03e83,0xc994c6db,0x128eb292,0xce16993e
	.word	0x22df019d,0xb25a8582,0x28b040b8,0x53b78cc3
	.word	0x6f5ee4c2,0x36530847,0x5bcab9ec,0x55646b6e
	.word	0x1242324c,0x78cc3be4,0xdfe0e699,0x57519ef0
	.word	0xee0fb540,0x71d986ba,0xea9c743d,0xa66081c9
	.word	0xa07c9657,0xdcd9650d,0x32bba16c,0x85304511
	.word	0x7f76c057,0xc05426f5,0x4e075c4f,0x65c42acb
	.word	0x2d4ba9a4,0x2c06e81a,0x8e801b1d,0x871fdd41
	.word	0xfb95560d,0x6ec16aee,0x22471d28,0x6037b844
p3_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
share0_begin:
share0_start:
	.word	0x74e79c14,0x262c9f8e,0xcd17fc73,0x5246bfae
	.word	0x95bbdd02,0xabdda42c,0x0b82de87,0xb3d896c3
	.word	0xc60f75a3,0x9d656cf9,0x7fa81ee2,0x9bd38918
	.word	0x1b36e5d4,0x3670d255,0x47c9054b,0xae420a4b
	.word	0x7838c84a,0xc4642b0c,0xa3edb40c,0x44ede332
	.word	0x56afe7af,0x83493a3d,0xbbd94c79,0xdb797e09
	.word	0x457c2c68,0xa9663cd8,0xbfe0e6ab,0x56c40f6c
	.word	0x8a77f703,0xead82d30,0x9c0229a1,0x1e48186d
	.word	0xc7c9e3d3,0x4eb0c019,0x32ecb0bc,0x22430e15
	.word	0x4dd9e95f,0x9a53da25,0xd93b9d9a,0x16b84c5f
	.word	0xfd55efdc,0x2b0af2e5,0xb8b7f8d2,0x7a61caf6
	.word	0x8c1ddeb6,0x90f20520,0x855ef57f,0xa3af82fe
share0_end:
	.seg	"data"
	ALIGN_PAGE_8K
share1_begin:
share1_start:
	.word	0x649746d5,0x7fe0c689,0x2fce25b3,0x35761dd0
	.word	0xd1cc995a,0x42936478,0x853c764e,0x7ca1866f
	.word	0x647becc3,0x80f46d80,0x3a11a677,0xc32b36ed
	.word	0x472dbf0e,0x9a9fd348,0x0f9bee19,0x33b8f27b
	.word	0x6f71028f,0x70365f90,0x9455101f,0xd70920e5
	.word	0x294f054d,0x68e7e2ac,0x80d8d9ff,0x636dc5d1
	.word	0xbbc0b6c2,0x6589b4b1,0x0a5a619e,0xd0490d14
	.word	0x806b575c,0x6023d87c,0xb885e573,0x19e3e064
	.word	0x1c5bdb96,0xbbb147b2,0x6852cde1,0x50314e47
	.word	0x8c2cf873,0xf287dc30,0x401ff55d,0x8d5ee90b
	.word	0xea2d4cc9,0x2411a312,0x3a4721f6,0x5093f85b
	.word	0xd393dbcc,0x400b892c,0x51298a40,0xe68c2a9f
share1_end:
	.seg	"data"
	ALIGN_PAGE_8K
share2_begin:
share2_start:
	.word	0x74328ebb,0xaa5a4a85,0x8b9a9814,0xe5340074
	.word	0x0560a389,0x3d73205d,0x3126cb3c,0xeed87f2b
	.word	0x82009ce0,0xfb5dcc98,0xb68c44bc,0xd1404c8a
	.word	0x0264d90a,0x8765fdee,0x23e6663d,0x25e2febf
	.word	0xf5c44646,0xa89260b3,0x617182b0,0xc62a5ebb
	.word	0x1a609c87,0x2f6f84e1,0x3c5b31a7,0xd2268f62
	.word	0xab82d4aa,0xba15f9a5,0x370d28e7,0x0d2cf3fe
	.word	0xa9f83b36,0x9efe5d8e,0xdcd6c89e,0x6386028c
	.word	0x7bf54762,0x49f28929,0x132fedb9,0x58f8d284
	.word	0x8cedd15d,0xdfa98079,0x2c8a8d04,0xa2642653
	.word	0xd61ce7d5,0x50551ea9,0xb7a16ece,0x2d8f2419
	.word	0x810a9520,0xc5a01266,0xca56cbcf,0x7159af77
share2_end:
	.seg	"data"
	ALIGN_PAGE_8K
share3_begin:
share3_start:
	.word	0xf4763693,0x1c40ab3e,0xf3f640e6,0x94ca9adc
	.word	0xaf442052,0xdd128db1,0x50e9b36a,0x7d3752c0
	.word	0x7070204d,0x376b20fa,0x4bc00135,0x94c52a06
	.word	0x530284a5,0xb3f691fe,0xec81cec3,0xa7faf048
	.word	0x0d59b4c9,0x1c3dd8b9,0x5442f0c1,0xa904d01d
	.word	0xe0d8d112,0x020c630d,0xcd0dfe01,0x152869f1
	.word	0x26165f33,0x6b712ae3,0xa3cac625,0x3ad39e73
	.word	0x648b20ff,0x2e148b8e,0x1cb6a17c,0x31a97eb8
	.word	0xb01999f7,0x9be68695,0x4d650331,0x3ef03cfd
	.word	0x50d4d88e,0x5be09128,0xcdcc24fb,0xc08daedf
	.word	0x4f38d4c0,0x169d8f3d,0xd08506ee,0x4307a129
	.word	0x14e7ec1b,0xfda1e64f,0xd7b72015,0xcd9f9fdc
share3_end:
	.seg	"data"
	ALIGN_PAGE_8K
common_begin:
common_start:
	.word	0x12070c3e,0x07370b35,0x1e271906,0x1f091e12
	.word	0x39251e20,0x382f2a35,0x220a2b2d,0x001a270f
	.word	0x2f093213,0x28360a28,0x221f381d,0x0c070502
	.word	0x0425050c,0x28330b3e,0x160f3a08,0x0001080e
	.word	0xab6e7fe6,0xeb4bf8fc,0x3caa4e2a,0x404d8e85
	.word	0x0dc61690,0xa7a5140a,0xb0e74508,0xafd3c83c
	.word	0xc866c613,0x6172d657,0x4a35164f,0x2a58fbef
	.word	0x61619950,0x0b605635,0x50361784,0xfcb7d0b1
common_end:
	.seg	"data"
	ALIGN_PAGE_8K
unres0_begin:
unres0_start:
	.word	0x1f1cf2e7,0xcbdc61c5,0xd5b78895,0xa4685005
	.word	0x8758d8b7,0x59bac2f6,0x08adf262,0x7b5dd384
	.word	0xabf2ed78,0xdbe0a62d,0x537245c7,0xb3b6f9b1
	.word	0x9197a540,0xdb0e3cdc,0x11724fe5,0xc74e0f0e
	.word	0xd4859d2d,0x357b73b9,0xcf027a2b,0x7f7cab97
	.word	0x84f8f53a,0x4ac9a406,0x54998092,0x142f1f51
	.word	0xe6a70116,0x4168fde0,0xd3a59bed,0xc4d847d0
	.word	0xb24c1e21,0x9d95c856,0x087d4a36,0xceb28373
	.word	0xfceb6fa2,0xb39f8882,0x589a01a7,0x947128a5
	.word	0x8f3412b5,0x32da1be2,0xe7d5a579,0x24d8dfe7
	.word	0x21160e98,0xcd8d7b8d,0xa44c47df,0x28a9c272
	.word	0x8ccd6a3b,0xd8c8d4b4,0x2d6760d8,0x5508d42b
unres0_end:

