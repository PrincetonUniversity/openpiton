// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mpgen_diag5_042103.s
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
!	Seed = 410192520
!	CIAM can be on
!	4 Processors, 1000 lines each
!	mpgen   created on Oct 14, 2002 (10:12:19)
!	diag.s created on Apr 10, 2003 (19:25:20)
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
	ldd	[%g1+0x00],%f0		! %f0  = d0ad2e9d, %f1  = 3ff59ba0
	ldd	[%g1+0x08],%f2		! %f2  = a0c94b69, %f3  = 1551e8f9
	ldd	[%g1+0x10],%f4		! %f4  = 72cec9f9, %f5  = c92a1b68
	ldd	[%g1+0x18],%f6		! %f6  = 72b6f658, %f7  = 40f28255
	ldd	[%g1+0x20],%f8		! %f8  = 235102fa, %f9  = c84f0ef5
	ldd	[%g1+0x28],%f10		! %f10 = 8d4e2cf4, %f11 = a6a356ba
	ldd	[%g1+0x30],%f12		! %f12 = 3d0b4d9a, %f13 = e185878f
	ldd	[%g1+0x38],%f14		! %f14 = 7fc20bdb, %f15 = 181e451b
	ldd	[%g1+0x40],%f16		! %f16 = 0a94bcc5, %f17 = 42783361
	ldd	[%g1+0x48],%f18		! %f18 = 006d1af2, %f19 = c3306ec9
	ldd	[%g1+0x50],%f20		! %f20 = 35a2eb9e, %f21 = ac9a84bc
	ldd	[%g1+0x58],%f22		! %f22 = 522d03e5, %f23 = a33e7f9c
	ldd	[%g1+0x60],%f24		! %f24 = 3266facd, %f25 = 403a59ac
	ldd	[%g1+0x68],%f26		! %f26 = fe924147, %f27 = b8481758
	ldd	[%g1+0x70],%f28		! %f28 = 61d8eec7, %f29 = fcb7588c
	ldd	[%g1+0x78],%f30		! %f30 = 7c91042c, %f31 = 5610245a
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
	bpos,a	p0_b1			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000010000000] = 69716a72, %l2 = b74f46ff9ca37224
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 0000000069716a72
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x001,%g2
p0_b1:
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000011000000] = 5accc5bf, %l6 = df8f8dffbcbccfd7
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 000000000000005a
!	Mem[0000000010800024] = ad90be39, %l0 = 293c8f002f1ff740
	ldswa	[%i1+0x024]%asi,%l0	! %l0 = ffffffffad90be39
!	%l0 = ffffffffad90be39, immed = 00000e5e, %l5 = de5177ff90eb0195
	sub	%l0,0xe5e,%l5		! %l5 = ffffffffad90afdb

p0_label_2:
!	%l7 = ce653d001cd3b70c, Mem[0000000010000008] = b18cadd7032e56c6
	stxa	%l7,[%i0+%o6]0x80	! Mem[0000000010000008] = ce653d001cd3b70c
!	%l0 = ffffffffad90be39
	sethi	%hi(0x44949400),%l0	! %l0 = 0000000044949400
	set	p0_b2,%o7
	fba	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800020] = 39d163a7 cc7ef476 dcf43600 a6f07569
	prefetch [%i3+0x020],20
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x002,%g2
p0_b2:
!	Registers modified during the branch to p0_far_0
!	%l0  = 48166300adeb0bbb
!	%l1  = 00172f144306dcc6
!	%l3  = ffffffffffe464dd
!	%l7  = 0000000000000053
	membar	#Sync			! Added by membar checker (2)
!	%f17 = 42783361, %f17 = 42783361, %f15 = 181e451b
	fsubs	%f17,%f17,%f15		! %f15 = 00000000

p0_label_3:
!	Mem[0000000030000041] = 1cdcab8f, %l0 = 48166300adeb0bbb
	ldstuba	[%o0+0x041]%asi,%l0	! %l0 = 00000000000000dc
!	%l6 = 000000000000005a, immed = fffffa82, %y  = 00000000
	smulcc	%l6,-0x57e,%l4		! %l4 = fffffffffffe11b4, %ccr = 88
!	Mem[0000000010000000] = 69716a72, %l7 = 0000000000000053
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000006971
!	%l6 = 000000000000005a, immed = 00000012, %l5 = ffffffffad90afdb
	sll	%l6,0x012,%l5		! %l5 = 0000000001680000
!	Mem[0000000031800048] = c1fe7073, %l0 = 00000000000000dc
	lduh	[%o3+0x04a],%l0		! %l0 = 0000000000007073

p0_label_4:
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 69716a72, %l3 = ffe464dd, Mem[0000000012800008] = f52b6061 9da42afb
	stda	%l2,[%i5+%o6]0x80	! Mem[0000000012800008] = 69716a72 ffe464dd
p0_b3:
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800008] = de9c35ff, %l7 = 0000000000006971
	ldsba	[%i1+%o6]0x80,%l7	! %l7 = ffffffffffffffde
p0_b4:
	membar	#Sync			! Added by membar checker (3)
!	%l6 = 000000000000005a, %l1 = 00172f144306dcc6, %y  = ffffffff
	mulx	%l6,%l1,%l5		! %l5 = 08268d1f90699d9c

p0_label_5:
!	%l3 = ffffffffffe464dd, immed = 0000085d, %l2 = 0000000069716a72
	xorcc	%l3,0x85d,%l2		! %l2 = ffffffffffe46c80, %ccr = 88
!	Mem[0000000030800008] = 67b34320 024b4bbf, %l0 = 00007073, %l1 = 4306dcc6
	ldda	[%o1+0x008]%asi,%l0	! %l0 = 0000000067b34320 00000000024b4bbf
!	%f0  = d0ad2e9d 3ff59ba0, %f0  = d0ad2e9d 3ff59ba0, %f12 = 3d0b4d9a e185878f
	fsubd	%f0 ,%f0 ,%f12		! %f12 = 00000000 00000000
!	%l7 = ffffffffffffffde, immed = 000006e4, %l7 = ffffffffffffffde
	andn	%l7,0x6e4,%l7		! %l7 = fffffffffffff91a
!	Mem[0000000011000000] = 5accc5bf, %l4 = fffffffffffe11b4
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 000000000000005a

p0_label_6:
!	Mem[00000000118000e0] = faafacd7dab5d1e7, %l5 = 08268d1f90699d9c
	ldxa	[%i3+0x0e0]%asi,%l5	! %l5 = faafacd7dab5d1e7
!	Branch On Register, %l6 = 000000000000005a
	brlez,pn %l6,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010000000] = 69716a72, %l1 = 00000000024b4bbf
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000006971
p0_b5:
	membar	#Sync			! Added by membar checker (4)
!	%l1 = 0000000000006971, immed = fffff540, %l0 = 0000000067b34320
	taddcc	%l1,-0xac0,%l0		! %l0 = 0000000000005eb1, %ccr = 13
!	%l4 = 000000000000005a, %l4 = 000000000000005a, %l1 = 0000000000006971
	sll	%l4,%l4,%l1		! %l1 = 0000000168000000

p0_label_7:
!	call to call_2, CWP = 0
	call	p0_call_2_he
!	Mem[000000003000004c] = a3d74807, %l3 = ffffffffffe464dd
	ldstub	[%o0+0x04c],%l3		! %l3 = 00000000000000a3
!	Registers modified during the branch to p0_call_2
!	%l6  = 00000000003c4ab3
!	%l7  = fffffffe98005eb1
	set	p0_b6,%o7
	fbuge	p0_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800000] = b8a70592, %l5 = faafacd7dab5d1e7
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000b8a70592
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x006,%g2
p0_b6:
!	Registers modified during the branch to p0_far_0
!	%l0  = ffab370a951d5fc3
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,16

p0_label_8:
!	%f1  = 3ff59ba0, %f15 = 00000000, %f7  = 40f28255
	fsubs	%f1 ,%f15,%f7 		! %f7  = 3ff59ba0
!	Mem[0000000011800078] = e8d1f9c7, %l5 = 00000000b8a70592
	ldsha	[%i3+0x07a]%asi,%l5	! %l5 = fffffffffffff9c7
!	Branch On Register, %l7 = fffffffe98005eb1
	brlez,pn %l7,p0_b7		! Branch Taken
!	Mem[0000000010800040] = 2a6e5c1f65e32feb, %l2 = ffffffffffe46c80
	ldx	[%i1+0x040],%l2		! %l2 = 2a6e5c1f65e32feb
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x007,%g2
p0_b7:
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010800000] = dab5d1e7, %l1 = 0000000168000000
	ldswa	[%i1+%g0]0x80,%l1	! %l1 = ffffffffdab5d1e7

p0_label_9:
!	Mem[0000000010800060] = a815f184 65c4e7c7 c7bf98d9 c0499f93
	prefetch [%i1+0x060],3
	fbug,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l0 = ffab370a951d5fc3, Mem[000000001180009e] = 50476582
	sth	%l0,[%i3+0x09e]		! Annulled
p0_b8:
	membar	#Sync			! Added by membar checker (7)
!	%l5 = fffffffffffff9c7, immed = 0000001d, %l6 = 00000000003c4ab3
	srl	%l5,0x01d,%l6		! %l6 = 0000000000000007
!	Mem[0000000030800044] = 114e8651, %l2 = 2a6e5c1f65e32feb
	ldsw	[%o1+0x044],%l2		! %l2 = 00000000114e8651

p0_label_10:
!	Mem[0000000011800040] = e9485e13 96e16506 60d41cfc 7d3ead0e
	prefetch [%i3+0x040],2
!	%l1 = ffffffffdab5d1e7, %l7 = fffffffe98005eb1, %l3 = 00000000000000a3
	and	%l1,%l7,%l3		! %l3 = fffffffe980050a1
	fbne,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000014] = a121acca, %l7 = fffffffe98005eb1
	lduh	[%o4+0x014],%g2		! Annulled
p0_b9:
	membar	#Sync			! Added by membar checker (8)
!	%l2 = 00000000114e8651, Mem[0000000010800000] = dab5d1e75702403a
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000000114e8651

p0_label_11:
	nop
!	%l7 = fffffffe98005eb1, %l7 = fffffffe98005eb1, %l7 = fffffffe98005eb1
	andcc	%l7,%l7,%l7		! %l7 = fffffffe98005eb1, %ccr = 88
!	%l6 = 0000000000000007, immed = 00000015, %l5 = fffffffffffff9c7
	srl	%l6,0x015,%l5		! %l5 = 0000000000000000
!	%f0  = d0ad2e9d 3ff59ba0, %f8  = 235102fa c84f0ef5
	fcmped	%fcc0,%f0 ,%f8 		! %fcc0 = 1
!	%l7 = fffffffe98005eb1, immed = 000001b0, %l0 = ffab370a951d5fc3
	and	%l7,0x1b0,%l0		! %l0 = 00000000000000b0

p0_label_12:
!	%l3 = fffffffe980050a1, %l7 = fffffffe98005eb1, %l1 = ffffffffdab5d1e7
	addcc	%l3,%l7,%l1		! %l1 = fffffffd3000af52, %ccr = 93
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 93
!	Mem[00000000110000a0] = c5be1aaa a5a1ddb3 6aa84371 45f231ef
	prefetch [%i2+0x0a0],4
p0_b10:
	bne	p0_b11			! Branch Taken, %ccr = 93, CWP = 0
!	%l6 = 00000007, %l7 = 98005eb1, Mem[0000000010000008] = ce653d00 1cd3b70c
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000010000008] = 00000007 98005eb1
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x00b,%g2
p0_b11:

p0_label_13:
!	call to call_2, CWP = 0
	call	p0_call_2_le
!	Mem[0000000011800008] = b794d2b4, %l2 = 00000000114e8651
	ldsba	[%i3+%o6]0x80,%l2	! %l2 = ffffffffffffffb7
!	Registers modified during the branch to p0_call_2
!	%l3  = 0000000000000093
!	%l7  = 0000000000003de0
	set	p0_b12,%o7
	fblg,a	p0_far_0_he	! Branch Taken, %fcc0 = 1
!	%l6 = 0000000000000007, Mem[0000000011000000] = 5accc5bf471204d7
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000011000000] = 0000000000000007
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x00c,%g2
p0_b12:
!	Registers modified during the branch to p0_far_0
!	%l0  = 000000000001b120
	set	p0_b13,%o7
	fba	p0_far_0_he	! Branch Taken, %fcc0 = 1

p0_label_14:
!	Mem[0000000011000020] = c52d121e 9cdee2a4 dd88fc08 661e60cb
	prefetch [%i2+0x020],4
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x00d,%g2
p0_b13:
!	Registers modified during the branch to p0_far_0
!	%l0  = 000000000001b120
	membar	#Sync			! Added by membar checker (9)
!	%l3 = 0000000000000093, immed = fffff2f3, %y  = 00000000
	udivx	%l3,-0xd0d,%l0		! %l0 = 0000000000000000
	set	p0_b14,%o7
	fbe,pn	%fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 0
!	%l3 = 0000000000000093, Mem[0000000030800040] = 224bbb69
	stb	%l3,[%o1+0x040]		! Mem[0000000030800040] = 934bbb69
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x00e,%g2
p0_b14:
!	Registers modified during the branch to p0_near_1
!	%l0  = 0000000000000001
!	%l3  = 0000000000000300
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (10)
!	%l4 = 0000000000000000, immed = 00000ed4, %l2 = ffffffffffffffb7
	xor	%l4,0xed4,%l2		! %l2 = 0000000000000ed4

p0_label_15:
!	Mem[00000000110000a0] = c5be1aaa a5a1ddb3 6aa84371 45f231ef
	prefetch [%i2+0x0a0],0
!	%l1 = fffffffd3000af52, Mem[0000000010000000] = 69716a728ddd9efc
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = fffffffd3000af52
!	Mem[0000000030800004] = ad90afdb, %l2 = 0000000000000ed4
	ldsb	[%o1+0x007],%l2		! %l2 = ffffffffffffffdb
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 93
!	Mem[0000000030800040] = 934bbb69, %l1 = fffffffd3000af52
	ldub	[%o1+0x040],%l1		! Annulled
p0_b15:

p0_label_16:
	membar	#Sync			! Added by membar checker (11)
!	%l0 = 0000000000000001, %l4 = 0000000000000000, %l7 = 0000000000003de0
	srax	%l0,%l4,%l7		! %l7 = 0000000000000001
!	%l2 = ffffffffffffffdb, %l3 = 0000000000000300, %y  = 00000000
	udivx	%l2,%l3,%l4		! %l4 = 0055555555555555
!	%l0 = 0000000000000001, immed = 000002c9, %l3 = 0000000000000300
	andn	%l0,0x2c9,%l3		! %l3 = 0000000000000000
	bvc,a	p0_not_taken_0		! Branch Not Taken, %ccr = 93
!	Mem[0000000030800004] = ad90afdb, %l2 = ffffffffffffffdb
	lduh	[%o1+0x006],%l2		! Annulled
p0_b16:

p0_label_17:
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000011800080] = c09f6831 57b3ce81
	flush	%i3+0x080
!	%f0  = d0ad2e9d 3ff59ba0, %f18 = 006d1af2 c3306ec9
	fcmpd	%fcc3,%f0 ,%f18		! %fcc3 = 1
!	%l5 = 0000000000000000, Mem[00000000108000d0] = cf0febda
	stba	%l5,[%i1+0x0d0]%asi	! Mem[00000000108000d0] = 000febda
!	Mem[00000000108000c0] = 37002b6e 1650a75d 1ea758a0 52ba4f23
	prefetch [%i1+0x0c0],16
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 93

p0_label_18:
!	Mem[0000000010000008] = 0000000798005eb1, %l7 = 0000000000000001
	ldxa	[%i0+%o6]0x80,%l7	! %l7 = 0000000798005eb1
p0_b17:
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000108000ec] = cd9bfd59, %l2 = ffffffffffffffdb
	ldsba	[%i1+0x0ed]%asi,%l2	! %l2 = ffffffffffffff9b
	set	p0_b18,%o7
	fbo,a,pt %fcc1,p0_near_2_le	! Branch Taken, %fcc1 = 0
!	%l1 = fffffffd3000af52, Mem[0000000031800040] = dd7edd86030dd456
	stx	%l1,[%o3+0x040]		! Mem[0000000031800040] = fffffffd3000af52
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x012,%g2
p0_b18:
!	Registers modified during the branch to p0_near_2
!	%l3  = 0000000000000001
!	%l6  = 0000000004c002f5
	bvs,a	p0_b19			! Branch Taken, %ccr = 93, CWP = 0

p0_label_19:
!	%l2 = ffffffffffffff9b, Mem[0000000010800000] = 00000000114e8651
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000010800000] = ffffffffffffff9b
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x013,%g2
p0_b19:
	membar	#Sync			! Added by membar checker (14)
!	Branch On Register, %l3 = 0000000000000001
	brlz,pn	%l3,p0_not_taken_0	! Branch Not Taken
!	%l4 = 55555555, %l5 = 00000000, Mem[00000000118000a0] = 4e22dc20 a18f8697
	std	%l4,[%i3+0x0a0]	! Mem[00000000118000a0] = 55555555 00000000
p0_b20:
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030000004] = 3000af52, %l2 = ffffffffffffff9b
	lduh	[%o0+0x006],%l2		! %l2 = 000000000000af52
!	%f20 = 35a2eb9e, %f31 = 5610245a
	fnegs	%f20,%f31		! %f31 = b5a2eb9e

p0_label_20:
	ba	p0_b21			! Branch Taken, %ccr = 93, CWP = 0
!	Mem[0000000010800060] = a815f184 65c4e7c7 c7bf98d9 c0499f93
	prefetch [%i1+0x060],2
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x015,%g2
p0_b21:
	membar	#Sync			! Added by membar checker (16)
!	%l0 = 0000000000000001, %l0 = 0000000000000001, %l3 = 0000000000000001
	andncc	%l0,%l0,%l3		! %l3 = 0000000000000000, %ccr = 44
!	%l1 = fffffffd3000af52
	sethi	%hi(0x29688800),%l1	! %l1 = 0000000029688800
	set	p0_b22,%o7
	fbne,a,pn %fcc0,p0_near_2_le	! Branch Taken, %fcc0 = 1

p0_label_21:
!	Mem[000000003200000c] = 2d367bd5, %l6 = 0000000004c002f5
	lduw	[%o4+0x00c],%g2		! %g2 = 0000000004c002f5
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x016,%g2
p0_b22:
!	Registers modified during the branch to p0_near_2
!	%l3  = 0000000000000001
!	%l6  = 0000000004c002f5
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000032000050] = 03bec3bc 11a1e99d, %l2 = 0000af52, %l3 = 00000001
	ldd	[%o4+0x050],%g2		! %l2 = 000000000000af52 0000000000000001
!	%f26 = fe924147 b8481758, %f28 = 61d8eec7 fcb7588c
	fnegd	%f26,%f28		! %f28 = 7e924147 b8481758
	nop
!	%l3 = 0000000000000001, %l7 = 0000000798005eb1, %l1 = 0000000029688800
	tsubcc	%l3,%l7,%l1		! %l1 = fffffff867ffa150, %ccr = 93

p0_label_22:
!	%l6 = 0000000004c002f5, %l7 = 0000000798005eb1, %l7 = 0000000798005eb1
	sra	%l6,%l7,%l7		! %l7 = 0000000000000260
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = 55555555, %l5 = 00000000, Mem[0000000011800000] = 520032a2 3543ea88
	stda	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = 55555555 00000000
p0_b23:
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetcha [%o4+0x020]%asi,23
	set	p0_b24,%o7
	fbl	p0_far_3_le	! Branch Taken, %fcc0 = 1

p0_label_23:
!	Mem[0000000010800000] = ffffffff, %l1 = fffffff867ffa150
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x018,%g2
p0_b24:
!	Registers modified during the branch to p0_far_3
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (19)
	fbn,pn	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000010800000] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
p0_b25:
	membar	#Sync			! Added by membar checker (20)
!	%l2 = 000000000000af52, %l4 = 0055555555555555, %l6 = 0000000004c002f5
	addcc	%l2,%l4,%l6		! %l6 = 00555555555604a7, %ccr = 00
!	%l0 = 0000000000000001, Mem[0000000011000078] = 378361c5bec3383f
	stx	%l0,[%i2+0x078]		! Mem[0000000011000078] = 0000000000000001

p0_label_24:
!	%f8  = 235102fa c84f0ef5, %f24 = 3266facd 403a59ac
	fmovd	%f8 ,%f24		! %f24 = 235102fa c84f0ef5
!	%l1 = 00000000ffffffff, immed = 000002c1, %y  = 00000000
	udiv	%l1,0x2c1,%l0		! %l0 = 00000000005cf578
	set	p0_b26,%o7
	fba	p0_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000011800030] = 7d5c81c1, %l6 = 00555555555604a7
	lduw	[%i3+0x030],%l6		! %l6 = 000000007d5c81c1
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x01a,%g2
p0_b26:
!	Registers modified during the branch to p0_far_1
!	%l0  = 005555557d5dd5d5
!	%l1  = 0000000000004d82
!	%l3  = 69b83a2982bdc505
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	%l6 = 000000007d5c81c1, %l1 = 0000000000004d82, %y  = 00000000
	smul	%l6,%l1,%l1		! %l1 = 000025f47c00f102

p0_label_25:
!	%f0  = d0ad2e9d, %f15 = 00000000, %f31 = b5a2eb9e
	fadds	%f0 ,%f15,%f31		! %f31 = d0ad2e9d
!	Mem[0000000011000070] = 9ab613a4, %l5 = 0000000000000000
	ldsb	[%i2+0x070],%l5		! %l5 = ffffffffffffff9a
!	Mem[000000003180004c] = b4cf6148, %l6 = 000000007d5c81c1
	ldsha	[%o3+0x04c]%asi,%l6	! %l6 = ffffffffffffb4cf
	set	p0_b27,%o7
	fbne	p0_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],20
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x01b,%g2
p0_b27:
!	Registers modified during the branch to p0_far_3
!	%l7  = 00000000000025f4

p0_label_26:
	fbuge	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000011000000] = 0000000000000007, %l7 = 00000000000025f4
	ldxa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000007
p0_b28:
	membar	#Sync			! Added by membar checker (22)
!	%f6  = 72b6f658 3ff59ba0, %f28 = 7e924147 b8481758
	fmovd	%f6 ,%f28		! %f28 = 72b6f658 3ff59ba0
	set	p0_b29,%o7
	fblg,a,pt %fcc0,p0_near_3_le	! Branch Taken, %fcc0 = 1
!	%l6 = ffffffffffffb4cf, Mem[0000000030800002] = 77b3408b
	stb	%l6,[%o1+0x002]		! Mem[0000000030800000] = 77b3cf8b
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x01d,%g2
p0_b29:
!	Registers modified during the branch to p0_near_3
!	%l2  = fffffffffffffce5

p0_label_27:
	membar	#Sync			! Added by membar checker (23)
!	Mem[00000000108000e0] = 4cd4ff5e a4bc2004 6a181252 cd9bfd59
	prefetcha [%i1+0x0e0]%asi,4
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[00000000100000fc] = 66317e28, %l0 = 005555557d5dd5d5
	lduh	[%i0+0x0fe],%l0		! %l0 = 0000000000007e28
p0_b30:
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000011800094] = 4194d77e, %l3 = 69b83a2982bdc505
	lduwa	[%i3+0x094]%asi,%l3	! %l3 = 000000004194d77e
!	%f18 = 006d1af2 c3306ec9, %f22 = 522d03e5 a33e7f9c
	fcmpd	%fcc2,%f18,%f22		! %fcc2 = 1

p0_label_28:
	nop				! Delay added due to fcmp
	set	p0_b31,%o7
	fble,pn	%fcc0,p0_near_3_le	! Branch Taken, %fcc0 = 1
!	%l5 = ffffffffffffff9a, Mem[0000000011000000] = 00000000
	stha	%l5,[%i2+%g0]0x80	! Mem[0000000011000000] = ff9a0000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x01f,%g2
p0_b31:
!	Registers modified during the branch to p0_near_3
!	%l2  = fffffffffffffce5
	membar	#Sync			! Added by membar checker (25)
!	%l5 = ffffffffffffff9a, immed = fffff552, %l2 = fffffffffffffce5
	tsubcc	%l5,-0xaae,%l2		! %l2 = 0000000000000a48, %ccr = 02
	fbg,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000120000b4] = 6d862033, %l5 = ffffffffffffff9a
	ldsb	[%i4+0x0b6],%l5		! Annulled
p0_b32:

p0_label_29:
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010800000] = ffffffff ffffff9b de9c35ff 5e66eeda
	prefetch [%i1+0x000],21
!	%l7 = 0000000000000007, %l4 = 0000000000000000, %l6 = ffffffffffffb4cf
	taddcc	%l7,%l4,%l6		! %l6 = 0000000000000007, %ccr = 02
!	%l7 = 0000000000000007, immed = 00000965, %l2 = 0000000000000a48
	or	%l7,0x965,%l2		! %l2 = 0000000000000967
	fbge	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001080004c] = bbfa77e6, %l4 = 0000000000000000
	ldsb	[%i1+0x04f],%l4		! %l4 = ffffffffffffffe6
p0_b33:

p0_label_30:
	membar	#Sync			! Added by membar checker (27)
!	Mem[00000000108000e6] = a4bc2004, %l7 = 0000000000000007
	ldstub	[%i1+0x0e6],%l7		! %l7 = 0000000000000020
	set	p0_b34,%o7
	fblg,a	p0_far_1_he	! Branch Taken, %fcc0 = 1
!	%l2 = 00000967, %l3 = 4194d77e, Mem[0000000031000040] = 13bbfdd9 c04a7505
	std	%l2,[%o2+0x040]	! Mem[0000000031000040] = 00000967 4194d77e
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x022,%g2
p0_b34:
!	Registers modified during the branch to p0_far_1
!	%l1  = fffffffffffffffa
!	%l4  = fffffffffb1aebef
!	%l7  = acbc0d1615a58130
	bleu	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000032000050] = 03bec3bc, %l2 = 0000000000000967
	ldsw	[%o4+0x050],%g2		! %g2 = 0000000000000967
p0_b35:

p0_label_31:
	membar	#Sync			! Added by membar checker (28)
!	%l6 = 0000000000000007, immed = 00000002, %l2 = 0000000000000967
	srl	%l6,0x002,%l2		! %l2 = 0000000000000001
!	%f24 = 235102fa, %f12 = 00000000, %f3  = 1551e8f9
	fsubs	%f24,%f12,%f3 		! %f3  = 235102fa
!	Mem[000000003200004c] = 1df58c8b, %l5 = ffffffffffffff9a
	lduwa	[%o4+0x04c]%asi,%g2	! %g2 = ffffffffffffff9a
!	Jump to jmpl_0, CWP = 0
	set	p0_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000030800000] = 77b3cf8b ad90afdb, %l6 = 00000007, %l7 = 15a58130
	ldd	[%o1+0x000],%l6		! %l6 = 0000000077b3cf8b 00000000ad90afdb
!	Registers modified during the branch to p0_jmpl_0
!	%l0  = 00000000c1fe3de0
!	%l1  = 00000000000000ed
!	%l4  = 00000000ffffffff
!	%l5  = 000000004110c36e
!	%l6  = 0000000032c68cd5

p0_label_32:
!	%f11 = a6a356ba, %f12 = 00000000
	fmovs	%f11,%f12		! %f12 = a6a356ba
!	%l7 = 00000000ad90afdb, immed = fffffdec, %l6 = 0000000032c68cd5
	subccc	%l7,-0x214,%l6		! %l6 = 00000000ad90b1ef, %ccr = 19
!	%l3 = 000000004194d77e, immed = fffffd6c, %l7 = 00000000ad90afdb
	andcc	%l3,-0x294,%l7		! %l7 = 000000004194d56c, %ccr = 00
!	%l0 = 00000000c1fe3de0
	setx	0x9a6999829a699982,%g7,%l0 ! %l0 = 9a6999829a699982
!	Branch On Register, %l4 = 00000000ffffffff
	brlez,pt %l4,p0_not_taken_0	! Branch Not Taken

p0_label_33:
!	Mem[0000000031800008] = d7be0d90, %l3 = 000000004194d77e
	ldsh	[%o3+0x00a],%l3		! %l3 = 0000000000000d90
p0_b36:
	set	p0_b37,%o7
	fbl,a	p0_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000011800008] = b794d2b44285daf6, %l4 = 00000000ffffffff
	ldxa	[%i3+%o6]0x80,%l4	! %l4 = b794d2b44285daf6
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x025,%g2
p0_b37:
!	Registers modified during the branch to p0_far_0
!	%l0  = 9a6999829a699895
!	%l1  = 0000000000000000
!	%l3  = 0000000000000036
!	%l7  = 00000000000000ff
	membar	#Sync			! Added by membar checker (29)
!	Mem[000000003000000c] = 87e64d82, %l4 = b794d2b44285daf6
	swap	[%o0+0x00c],%l4		! %l4 = 0000000087e64d82
!	Mem[0000000011000000] = ff9a0000, %l5 = 000000004110c36e
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 000000000000ff9a

p0_label_34:
!	%l6 = 00000000ad90b1ef, Mem[0000000010800020] = adbe31f2
	stwa	%l6,[%i1+0x020]%asi	! Mem[0000000010800020] = ad90b1ef
	set	p0_b38,%o7
	fbne,a	p0_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000010800000] = ffffffff, %l5 = 000000000000ff9a
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x026,%g2
p0_b38:
!	Registers modified during the branch to p0_far_0
!	%l0  = 9a6999829a699895
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l7  = 00000000000000ff
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000011800000] = 55555555 00000000 b794d2b4 4285daf6
	prefetch [%i3+0x000],21
	set	p0_b39,%o7
	fbl,pt	%fcc2,p0_near_2_le	! Branch Taken, %fcc2 = 1

p0_label_35:
!	Mem[0000000011800008] = b794d2b4, %l6 = 00000000ad90b1ef
	lduwa	[%i3+%o6]0x80,%l6	! %l6 = 00000000b794d2b4
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x027,%g2
p0_b39:
!	Registers modified during the branch to p0_near_2
!	%l3  = 9a6999829a699896
!	%l6  = 0000000000000007
	membar	#Sync			! Added by membar checker (31)
!	%l2 = 0000000000000001, Mem[000000003200006d] = 15231abf
	stb	%l2,[%o4+0x06d]		! Mem[000000003200006c] = 01231abf
!	%l2 = 0000000000000001, immed = 00000b11, %l3 = 9a6999829a699896
	xnor	%l2,0xb11,%l3		! %l3 = fffffffffffff4ef
!	%l3 = fffffffffffff4ef, immed = 00000b0e, %l2 = 0000000000000001
	orn	%l3,0xb0e,%l2		! %l2 = fffffffffffff4ff
!	%l5 = ffffffffffffffff, immed = 000005a6, %l6 = 0000000000000007
	addcc	%l5,0x5a6,%l6		! %l6 = 00000000000005a5, %ccr = 11

p0_label_36:
!	Branch On Register, %l2 = fffffffffffff4ff
	brz,pn	%l2,p0_not_taken_0	! Branch Not Taken
!	%l3 = fffffffffffff4ef, Mem[0000000010000060] = dfe3a4e781626933
	stx	%l3,[%i0+0x060]		! Mem[0000000010000060] = fffffffffffff4ef
p0_b40:
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000011800040] = e9485e13 96e16506 60d41cfc 7d3ead0e
	prefetch [%i3+0x040],20
!	%l4 = 0000000087e64d82, %l2 = fffffffffffff4ff, %y  = ffffffce
	sdivx	%l4,%l2,%l3		! %l3 = fffffffffff3a65f
!	%l2 = fffffffffffff4ff, immed = fffffe4b, %y  = ffffffce
	sdiv	%l2,-0x1b5,%l7		! %l7 = 000000001cb46e28

p0_label_37:
!	%f10 = 8d4e2cf4 a6a356ba, %f22 = 522d03e5 a33e7f9c
	fcmpd	%fcc0,%f10,%f22		! %fcc0 = 1
!	%l5 = ffffffffffffffff, immed = 000001a6, %y  = ffffffce
	smul	%l5,0x1a6,%l5		! %l5 = fffffffffffffe5a
!	Mem[0000000011000008] = 4d844e87, %l4 = 0000000087e64d82
	lduha	[%i2+%o6]0x80,%l4	! %l4 = 0000000000004d84
!	%l0 = 9a6999829a699895
	sethi	%hi(0xfdb23800),%l0	! %l0 = 00000000fdb23800
!	Branch On Register, %l4 = 0000000000004d84
	brnz,a,pn %l4,p0_b41		! Branch Taken

p0_label_38:
!	%l3 = fffffffffff3a65f, Mem[000000003000004c] = ffd74807
	stw	%l3,[%o0+0x04c]		! Mem[000000003000004c] = fff3a65f
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x029,%g2
p0_b41:
	membar	#Sync			! Added by membar checker (33)
!	%l5 = fffffffffffffe5a, %l6 = 00000000000005a5, %l3 = fffffffffff3a65f
	srl	%l5,%l6,%l3		! %l3 = 0000000007fffff2
	bl	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000011000008] = 4d844e87, %l6 = 00000000000005a5
	lduha	[%i2+%o6]0x80,%l6	! %l6 = 0000000000004d84
p0_b42:
	set	p0_b43,%o7
	fble	p0_far_1_le	! Branch Taken, %fcc0 = 1

p0_label_39:
!	Mem[0000000011800080] = c09f6831 57b3ce81 0edfb572 9434a731
	prefetch [%i3+0x080],20
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x02b,%g2
p0_b43:
!	Registers modified during the branch to p0_far_1
!	%l0  = 0000000000004d84
!	%l1  = ffffffffffffdaf6
!	%l3  = 69b83a2982bdc505
!	%l4  = ffffffffffffffe5
	membar	#Sync			! Added by membar checker (34)
!	%f23 = a33e7f9c, %f13 = 00000000, %f10 = 8d4e2cf4
	fadds	%f23,%f13,%f10		! %f10 = a33e7f9c
!	%f28 = 72b6f658 3ff59ba0, %f28 = 72b6f658 3ff59ba0, %f4  = 72cec9f9 c92a1b68
	fdivd	%f28,%f28,%f4 		! %f4  = 3ff00000 00000000
!	%l5 = fffffffffffffe5a, %l0 = 0000000000004d84, %l0 = 0000000000004d84
	addc	%l5,%l0,%l0		! %l0 = 0000000000004bdf
!	%l6 = 0000000000004d84, %l6 = 0000000000004d84, %l1 = ffffffffffffdaf6
	orcc	%l6,%l6,%l1		! %l1 = 0000000000004d84, %ccr = 00

p0_label_40:
	set	p0_b44,%o7
	fble,a,pn %fcc2,p0_near_2_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000011800030] = 7d5c81c1, %l1 = 0000000000004d84
	lduh	[%i3+0x030],%l1		! %l1 = 0000000000007d5c
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x02c,%g2
p0_b44:
!	Registers modified during the branch to p0_near_2
!	%l0  = fffffffffffffe3f
!	%l3  = 00000000167c6c41
	membar	#Sync			! Added by membar checker (35)
!	%l0 = fffffffffffffe3f, %l5 = fffffffffffffe5a, %y  = ffffffff
	mulx	%l0,%l5,%l3		! %l3 = 000000000002e426
!	%l1 = 0000000000007d5c, Mem[00000000100000dc] = 969b7658
	stha	%l1,[%i0+0x0dc]%asi	! Mem[00000000100000dc] = 7d5c7658
!	Mem[0000000011000074] = 1ffd134a, %l2 = fffff4ff, %l7 = 1cb46e28
	add	%i2,0x74,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 000000001ffd134a

p0_label_41:
!	%l6 = 0000000000004d84, %l1 = 0000000000007d5c, %l1 = 0000000000007d5c
	tsubcc	%l6,%l1,%l1		! %l1 = ffffffffffffd028, %ccr = 99
	bvc	p0_b45			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000011800060] = c7fd7d24 1095ec30 b0c1b065 39a016ef
	prefetch [%i3+0x060],22
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x02d,%g2
p0_b45:
	membar	#Sync			! Added by membar checker (36)
!	%l2 = fffffffffffff4ff, immed = fffffd82, %l6 = 0000000000004d84
	andcc	%l2,-0x27e,%l6		! %l6 = fffffffffffff482, %ccr = 88
!	Mem[0000000010800060] = a815f18465c4e7c7, %l6 = fffffffffffff482
	ldx	[%i1+0x060],%l6		! %l6 = a815f18465c4e7c7

p0_label_42:
!	%l1 = ffffffffffffd028, %l0 = fffffffffffffe3f, %l5 = fffffffffffffe5a
	addccc	%l1,%l0,%l5		! %l5 = ffffffffffffce67, %ccr = 99
!	Mem[0000000031000040] = 000009674194d77e, %l1 = ffffffffffffd028
	ldxa	[%o2+0x040]%asi,%l1	! %l1 = 000009674194d77e
!	%l0 = fffffffffffffe3f, %l1 = 000009674194d77e, %y  = ffffffff
	sdiv	%l0,%l1,%l5		! %l5 = 0000000000000000
!	%f4  = 3ff00000 00000000, %f18 = 006d1af2 c3306ec9
	fdtox	%f4 ,%f18		! %f18 = 00000000 00000001
!	Mem[000000001280001c] = 0a7dacbf, %l3 = 000000000002e426
	ldsb	[%i5+0x01e],%l3		! %l3 = ffffffffffffffac

p0_label_43:
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	%l4 = ffffffffffffffe5, Mem[0000000032000020] = 5d456367
	sth	%l4,[%o4+0x020]		! Annulled
p0_b46:
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetch [%o4+0x000],16
p0_b47:
	membar	#Sync			! Added by membar checker (37)
!	%l3 = ffffffffffffffac, %l0 = fffffffffffffe3f, %y  = ffffffff
	sdivx	%l3,%l0,%l4		! %l4 = 0000000000000000

p0_label_44:
!	%l0 = fffffe3f, %l1 = 4194d77e, Mem[0000000032000050] = 03bec3bc 11a1e99d
	stda	%l0,[%o4+0x050]%asi	! Mem[0000000032000050] = fffffe3f 4194d77e
!	%f12 = a6a356ba 00000000, %f12 = a6a356ba 00000000, %f28 = 72b6f658 3ff59ba0
	fdivd	%f12,%f12,%f28		! %f28 = 3ff00000 00000000
!	Mem[0000000010800010] = 2a5f7956 52720c4d, %l6 = 65c4e7c7, %l7 = 1ffd134a
	ldda	[%i1+0x010]%asi,%l6	! %l6 = 000000002a5f7956 0000000052720c4d
	ble	p0_b48			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000011000000] = ff9a0000, %l0 = fffffffffffffe3f
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x030,%g2
p0_b48:

p0_label_45:
	membar	#Sync			! Added by membar checker (38)
!	Branch On Register, %l4 = 0000000000000000
	brgez,pt %l4,p0_b49		! Branch Taken
!	Mem[0000000010000060] = ffffffff fffff4ef 883c0420 168156ea
	prefetch [%i0+0x060],4
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x031,%g2
p0_b49:
	bgu	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[0000000010800090] = 000000ff3db22d38, %l0 = 00000000000000ff
	ldx	[%i1+0x090],%l0		! %l0 = 000000ff3db22d38
p0_b50:
!	Jump to jmpl_1, CWP = 0
	set	p0_jmpl_1_le,%g1
	jmpl	%g1,%g6

p0_label_46:
!	Mem[0000000010000008] = 00000007, %l3 = ffffffffffffffac
	ldstuba	[%i0+%o6]0x80,%l3	! %l3 = 0000000000000000
!	Registers modified during the branch to p0_jmpl_1
!	%l0  = 0000000000000000
!	%l1  = 000000ff3db23bc0
!	%l7  = 0000000000000340
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000011000070] = 9ab613a4, %l5 = 0000000000000000
	lduwa	[%i2+0x070]%asi,%l5	! %l5 = 000000009ab613a4
!	%l3 = 0000000000000000, %l1 = 000000ff3db23bc0, %y  = ffffffff
	smulcc	%l3,%l1,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%l7 = 0000000000000340, immed = fffff104, %y  = 00000000
	smulcc	%l7,-0xefc,%l2		! %l2 = ffffffffffcf4d00, %ccr = 88
!	Jump to jmpl_3, CWP = 0
	set	p0_jmpl_3_he,%g1
	jmpl	%g1,%g6

p0_label_47:
!	%l0 = 0000000000000000, Mem[0000000010000048] = 81277cb7
	stw	%l0,[%i0+0x048]		! Mem[0000000010000048] = 00000000
!	Registers modified during the branch to p0_jmpl_3
!	%l4  = 0000000000000053
!	%l6  = 00000000c1fe3de0
!	%l7  = 00000000b4cf6148
	ble	p0_b51			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[00000000100000e0] = eccad8bf 4434fd7c 417eaf0b 2d44cc48
	prefetch [%i0+0x0e0],0
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x033,%g2
p0_b51:
	membar	#Sync			! Added by membar checker (40)
!	%l4 = 0000000000000053, %l1 = 000000ff3db23bc0, %l3 = 0000000000000000
	andcc	%l4,%l1,%l3		! %l3 = 0000000000000040, %ccr = 00
!	%l7 = 00000000b4cf6148, %l1 = 000000ff3db23bc0, %l7 = 00000000b4cf6148
	addcc	%l7,%l1,%l7		! %l7 = 000000fff2819d08, %ccr = 08

p0_label_48:
!	%l0 = 0000000000000000, immed = 00000d32, %l1 = 000000ff3db23bc0
	andcc	%l0,0xd32,%l1		! %l1 = 0000000000000000, %ccr = 44
	fbg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = ffffffffffcf4d00, Mem[0000000011000000] = ff9a0000
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000011000000] = 4d000000
p0_b52:
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000030000040] = 1cffab8f 879eb436, %l0 = 00000000, %l1 = 00000000
	ldda	[%o0+0x040]%asi,%l0	! %l0 = 000000001cffab8f 00000000879eb436
!	Mem[0000000011800008] = b794d2b4 4285daf6, %l2 = ffcf4d00, %l3 = 00000040
	ldd	[%i3+0x008],%l2		! %l2 = 00000000b794d2b4 000000004285daf6

p0_label_49:
!	%f8  = 235102fa, %f28 = 3ff00000
	fmovs	%f8 ,%f28		! %f28 = 235102fa
	fbue,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000031800044] = 3000af52, %l1 = 00000000879eb436
	ldsw	[%o3+0x044],%l1		! Annulled
p0_b53:
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000031800000] = ee07703d, %l1 = 00000000879eb436
	ldub	[%o3+0x000],%l1		! %l1 = 00000000000000ee
!	%l7 = 000000fff2819d08, immed = fffff290, %l6 = 00000000c1fe3de0
	andn	%l7,-0xd70,%l6		! %l6 = 0000000000000d08

p0_label_50:
!	%l0 = 000000001cffab8f, %l6 = 0000000000000d08, %l0 = 000000001cffab8f
	srl	%l0,%l6,%l0		! %l0 = 00000000001cffab
!	%f7  = 3ff59ba0, %f20 = 35a2eb9e ac9a84bc
	fitod	%f7 ,%f20		! %f20 = 41cffacd d0000000
!	%l3 = 000000004285daf6, immed = 00000578, %l6 = 0000000000000d08
	xor	%l3,0x578,%l6		! %l6 = 000000004285df8e
!	%l5 = 000000009ab613a4, %l7 = 000000fff2819d08, %l6 = 000000004285df8e
	tsubcc	%l5,%l7,%l6		! %l6 = ffffff00a834769c, %ccr = 99
!	%l0 = 00000000001cffab, immed = 00000536, %l4 = 0000000000000053
	addccc	%l0,0x536,%l4		! %l4 = 00000000001d04e2, %ccr = 00

p0_label_51:
!	Mem[0000000011800020] = 39d163a7 cc7ef476 dcf43600 a6f07569
	prefetcha [%i3+0x020]%asi,21
	ble,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[00000000110000a0] = 1cb46e28 a5a1ddb3 6aa84371 45f231ef
	prefetch [%i2+0x0a0],1	! Annulled
p0_b54:
	membar	#Sync			! Added by membar checker (43)
!	%l4 = 00000000001d04e2, %l4 = 00000000001d04e2, %y  = ffffffff
	udivx	%l4,%l4,%l2		! %l2 = 0000000000000001
!	Mem[0000000032000010] = 9c30bc65a121acca, %l2 = 0000000000000001
	ldxa	[%o4+0x010]%asi,%g2	! %g2 = 9c30bc65a121acca

p0_label_52:
!	%l7 = 000000fff2819d08, %l0 = 00000000001cffab, %y  = ffffffff
	smulcc	%l7,%l0,%l6		! %l6 = fffe78b344dedc58, %ccr = 80
!	%l0 = 00000000001cffab, Mem[00000000118000fa] = 853feb31
	stba	%l0,[%i3+0x0fa]%asi	! Mem[00000000118000f8] = 853fab31
!	%l2 = 0000000000000001, Mem[0000000010000008] = ff00000798005eb1
	stxa	%l2,[%i0+%o6]0x80	! Mem[0000000010000008] = 0000000000000001
!	Mem[00000000100000e8] = 417eaf0b, %l1 = 00000000000000ee
	swapa	[%i0+0x0e8]%asi,%l1	! %l1 = 00000000417eaf0b
!	Mem[0000000011000008] = 4d844e87, %l4 = 00000000001d04e2
	ldstuba	[%i2+%o6]0x80,%l4	! %l4 = 000000000000004d

p0_label_53:
!	%l3 = 000000004285daf6, %l1 = 00000000417eaf0b, %l3 = 000000004285daf6
	andcc	%l3,%l1,%l3		! %l3 = 0000000040048a02, %ccr = 00
!	Branch On Register, %l4 = 000000000000004d
	brgz,pn	%l4,p0_b55		! Branch Taken
!	Mem[0000000030800048] = dc93b24178fb9bfa, %l0 = 00000000001cffab
	ldx	[%o1+0x048],%l0		! %l0 = dc93b24178fb9bfa
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x037,%g2
p0_b55:
	membar	#Sync			! Added by membar checker (44)
!	%f24 = 235102fa c84f0ef5, %f8  = 235102fa c84f0ef5, %f4  = 3ff00000 00000000
	fdivd	%f24,%f8 ,%f4 		! %f4  = 3ff00000 00000000
!	%l0 = dc93b24178fb9bfa, Mem[0000000010800000] = ffffffff
	stha	%l0,[%i1+%g0]0x80	! Mem[0000000010800000] = 9bfaffff

p0_label_54:
!	%f16 = 0a94bcc5 42783361, %f26 = fe924147 b8481758
	fmovd	%f16,%f26		! %f26 = 0a94bcc5 42783361
!	Mem[0000000030800044] = 114e8651, %l2 = 0000000000000001
	lduwa	[%o1+0x044]%asi,%l2	! %l2 = 00000000114e8651
!	%l6 = fffe78b344dedc58, immed = 00000677, %y  = fffe78b3
	sdivcc	%l6,0x677,%l2		! %l2 = ffffffff80000000, %ccr = 8a
	set	p0_b56,%o7
	fbule,pn %fcc3,p0_near_0_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000010800000] = 9bfaffff, %l1 = 00000000417eaf0b
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 000000000000009b
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x038,%g2
p0_b56:
!	Registers modified during the branch to p0_near_0
!	%l3  = ffffffff6549ecdb
!	%l4  = 00000000daba9da6
!	%l7  = 0000000000000000

p0_label_55:
	membar	#Sync			! Added by membar checker (45)
!	%l2 = ffffffff80000000, %l0 = dc93b24178fb9bfa, %l2 = ffffffff80000000
	tsubcc	%l2,%l0,%l2		! %l2 = 236c4dbe07046406, %ccr = 02
	bleu	p0_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000010800000] = 9bfaffff, %l2 = 236c4dbe07046406
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000000000009b
p0_b57:
	membar	#Sync			! Added by membar checker (46)
!	%l0 = dc93b24178fb9bfa, Mem[0000000010800008] = de9c35ff5e66eeda
	stxa	%l0,[%i1+%o6]0x80	! Mem[0000000010800008] = dc93b24178fb9bfa
!	%l6 = fffe78b344dedc58, Mem[0000000011000008] = ff844e87
	stha	%l6,[%i2+%o6]0x80	! Mem[0000000011000008] = dc584e87

p0_label_56:
!	%l2 = 000000000000009b, %l6 = fffe78b344dedc58, %y  = fffe78b3
	udiv	%l2,%l6,%l6		! %l6 = 00000000ffffffff
!	Mem[0000000011800008] = b794d2b4, %l3 = ffffffff6549ecdb
	ldstuba	[%i3+%o6]0x80,%l3	! %l3 = 00000000000000b7
!	%l6 = 00000000ffffffff, immed = 0000001a, %l5 = 000000009ab613a4
	sra	%l6,0x01a,%l5		! %l5 = ffffffffffffffff
!	%l5 = ffffffffffffffff, Mem[00000000118000a3] = 55555555
	stb	%l5,[%i3+0x0a3]		! Mem[00000000118000a0] = 555555ff
	set	p0_b58,%o7
	fble,a,pn %fcc3,p0_near_1_le	! Branch Taken, %fcc3 = 1

p0_label_57:
!	Mem[0000000010000008] = 00000000, %l3 = 00000000000000b7
	swapa	[%i0+%o6]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x03a,%g2
p0_b58:
!	Registers modified during the branch to p0_near_1
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (47)
	fbue,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000030800040] = 934bbb69, %l4 = 00000000daba9da6
	ldub	[%o1+0x042],%l4		! Annulled
p0_b59:
	membar	#Sync			! Added by membar checker (48)
!	%l3 = 0000000000000000, immed = 000002c5, %l4 = 00000000daba9da6
	xor	%l3,0x2c5,%l4		! %l4 = 00000000000002c5
!	%f4  = 3ff00000 00000000, %f0  = d0ad2e9d 3ff59ba0
	fdtox	%f4 ,%f0 		! %f0  = 00000000 00000001

p0_label_58:
!	%l6 = 00000000ffffffff, %l7 = 0000000000000000, %l2 = 000000000000009b
	srax	%l6,%l7,%l2		! %l2 = 00000000ffffffff
!	%l3 = 0000000000000000, Mem[0000000032000028] = 41534fa0894af11e
	stxa	%l3,[%o4+0x028]%asi	! Mem[0000000032000028] = 0000000000000000
	fbe,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003080000c] = 024b4bbf, %l2 = 00000000ffffffff
	ldsh	[%o1+0x00c],%l2		! Annulled
p0_b60:
	membar	#Sync			! Added by membar checker (49)
	nop

p0_label_59:
!	Mem[0000000031800044] = 3000af52, %l5 = ffffffffffffffff
	lduw	[%o3+0x044],%l5		! %l5 = 000000003000af52
!	%l6 = 00000000ffffffff, %l4 = 00000000000002c5, %l1 = 0000000000000000
	addcc	%l6,%l4,%l1		! %l1 = 00000001000002c4, %ccr = 01
!	%l0 = dc93b24178fb9bfa, Mem[0000000031000008] = 06d73620ffffffe6
	stx	%l0,[%o2+0x008]		! Mem[0000000031000008] = dc93b24178fb9bfa
!	Mem[0000000010800000] = fffaffff, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000000002c5, %l4 = 00000000000002c5, %l0 = dc93b24178fb9bfa
	srlx	%l4,%l4,%l0		! %l0 = 0000000000000016

p0_label_60:
!	%f4  = 3ff00000 00000000, %f11 = a6a356ba
	fdtoi	%f4 ,%f11		! %f11 = 00000001
!	%f29 = 00000000, %f8  = 235102fa, %f17 = 42783361
	fsubs	%f29,%f8 ,%f17		! %f17 = a35102fa
!	Branch On Register, %l6 = 00000000ffffffff
	brnz,a,pn %l6,p0_b61		! Branch Taken
!	Mem[0000000011000088] = e792e7a6, %l7 = 0000000000000000
	ldsw	[%i2+0x088],%l7		! %l7 = ffffffffe792e7a6
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x03d,%g2
p0_b61:
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000030000008] = 57077d11 4285daf6, %l0 = 00000016, %l1 = 000002c4
	ldd	[%o0+0x008],%l0		! %l0 = 0000000057077d11 000000004285daf6

p0_label_61:
!	%f16 = 0a94bcc5, %f29 = 00000000, %f17 = a35102fa
	fmuls	%f16,%f29,%f17		! %f17 = 00000000
!	%l2 = 00000000ffffffff, Mem[0000000031000008] = dc93b241
	stw	%l2,[%o2+0x008]		! Mem[0000000031000008] = ffffffff
	fbue,pn	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000003100004c] = e470b4f1, %l3 = 00000000000000ff
	swap	[%o2+0x04c],%l3		! %l3 = 00000000e470b4f1
p0_b62:
	membar	#Sync			! Added by membar checker (51)
!	%l5 = 000000003000af52, %l2 = 00000000ffffffff, %l1 = 000000004285daf6
	xorcc	%l5,%l2,%l1		! %l1 = 00000000cfff50ad, %ccr = 08

p0_label_62:
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d901231a
	prefetcha [%o4+0x060]%asi,3
!	Mem[0000000031000044] = 4194d77e, %l0 = 0000000057077d11
	lduh	[%o2+0x046],%l0		! %l0 = 000000000000d77e
!	%f16 = 0a94bcc5, %f13 = 00000000, %f6  = 72b6f658
	fsubs	%f16,%f13,%f6 		! %f6  = 0a94bcc5
!	%l3 = 00000000e470b4f1, %l5 = 000000003000af52, %y  = fffe78b3
	udivcc	%l3,%l5,%l3		! %l3 = 00000000ffffffff, %ccr = 0a
	fbu,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1

p0_label_63:
!	Mem[00000000100000d8] = 45e0d7b5, %l4 = 00000000000002c5
	swap	[%i0+0x0d8],%l4		! Annulled
p0_b63:
	membar	#Sync			! Added by membar checker (52)
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000011800070] = 40f9edac c43faac7
	stda	%l2,[%i3+0x070]%asi	! Mem[0000000011800070] = ffffffff ffffffff
!	Mem[0000000031800040] = fffffffd, %l6 = 00000000ffffffff
	lduw	[%o3+0x040],%l6		! %l6 = 00000000fffffffd
	fbuge,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	 Annulled
	ldd	[%i0+0x050],%l4
p0_b64:

p0_label_64:
!	call to call_3, CWP = 0
	call	p0_call_3_he
!	Mem[0000000010800008] = dc93b241 78fb9bfa, %l4 = 000002c5, %l5 = 3000af52
	ldda	[%i1+%o6]0x80,%l4	! %l4 = 00000000dc93b241 0000000078fb9bfa
!	Registers modified during the branch to p0_call_3
!	%l4  = 000000003c7dcdfd
!	%l6  = 0000000000000003
!	%l7  = 00000000b83cfa8b
	membar	#Sync			! Added by membar checker (53)
!	%l1 = 00000000cfff50ad, %l5 = 0000000078fb9bfa, %l7 = 00000000b83cfa8b
	srlx	%l1,%l5,%l7		! %l7 = 0000000000000000
!	Mem[0000000010800040] = 2a6e5c1f 65e32feb 70d731fd bbfa77e6
	prefetcha [%i1+0x040]%asi,20
!	Mem[0000000032000050] = fffffe3f 4194d77e, %l6 = 00000003, %l7 = 00000000
	ldda	[%o4+0x050]%asi,%g2	! %l6 = 0000000000000003 0000000000000000

p0_label_65:
!	%f1  = 00000001, %f4  = 3ff00000
	fnegs	%f1 ,%f4 		! %f4  = 80000001
!	%l0 = 000000000000d77e
	setx	0xb8d7c61eb8d7c61e,%g7,%l0 ! %l0 = b8d7c61eb8d7c61e
	fbe	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l0 = b8d7c61eb8d7c61e, Mem[00000000110000a0] = 1cb46e28a5a1ddb3
	stx	%l0,[%i2+0x0a0]		! Mem[00000000110000a0] = b8d7c61eb8d7c61e
p0_b65:
	membar	#Sync			! Added by membar checker (54)
!	%l6 = 00000003, %l7 = 00000000, Mem[0000000011000000] = 4d000000 00000007
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000011000000] = 00000003 00000000

p0_label_66:
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000010800000] = fffaffffffffff9b, %l6 = 0000000000000003
	ldxa	[%i1+%g0]0x80,%l6	! %l6 = fffaffffffffff9b
!	Registers modified during the branch to p0_jmpl_2
!	%l1  = 00000000000004bd
!	%l5  = 000000003c7ddaad
!	%l6  = 00000000ffffffff
!	Mem[00000000100000a4] = 35493e54, %l1 = 00000000000004bd
	swapa	[%i0+0x0a4]%asi,%l1	! %l1 = 0000000035493e54
!	%l2 = 00000000ffffffff, %l1 = 0000000035493e54, %l6 = 00000000ffffffff
	andn	%l2,%l1,%l6		! %l6 = 00000000cab6c1ab
	bl,a	p0_not_taken_0		! Branch Not Taken, %ccr = 0a

p0_label_67:
!	Mem[0000000011800040] = e9485e13 96e16506 60d41cfc 7d3ead0e
	prefetch [%i3+0x040],1	! Annulled
p0_b66:
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010800000] = fffaffff, %l0 = b8d7c61eb8d7c61e
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = fffffffffffaffff
!	%l6 = 00000000cab6c1ab
	sethi	%hi(0xcef49400),%l6	! %l6 = 00000000cef49400
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,16
	ba,a	p0_b67			! Branch Taken, %ccr = 0a, CWP = 0

p0_label_68:
!	Mem[00000000100000c0] = c14e0e3d0c46d85a, %l0 = fffffffffffaffff
	ldx	[%i0+0x0c0],%l0		! Annulled
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x043,%g2
p0_b67:
	fbge,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	 Annulled
	ldda	[%i4+%g0]0x80,%l6
p0_b68:
	membar	#Sync			! Added by membar checker (56)
!	%f25 = c84f0ef5, %f21 = d0000000, %f28 = 235102fa
	fdivs	%f25,%f21,%f28		! %f28 = 37cf0ef5
!	Mem[0000000030000001] = 0001b120, %l5 = 000000003c7ddaad
	ldstub	[%o0+0x001],%l5		! %l5 = 0000000000000001

p0_label_69:
!	%l0 = fffaffff, %l1 = 35493e54, Mem[0000000010000008] = 000000b7 00000001
	stda	%l0,[%i0+%o6]0x80	! Mem[0000000010000008] = fffaffff 35493e54
!	%l4 = 000000003c7dcdfd, %l6 = 00000000cef49400, %l5 = 0000000000000001
	subc	%l4,%l6,%l5		! %l5 = ffffffff6d8939fd
	bvs	p0_b69			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000011800020] = 39d163a7, %l4 = 000000003c7dcdfd
	ldsw	[%i3+0x020],%l4		! %l4 = 0000000039d163a7
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x045,%g2
p0_b69:
	membar	#Sync			! Added by membar checker (57)
!	%l2 = 00000000ffffffff, immed = 00000007, %l6 = 00000000cef49400
	srax	%l2,0x007,%l6		! %l6 = 0000000001ffffff

p0_label_70:
!	Mem[0000000011800010] = 95e5cfe88f348ca3, %l6 = 0000000001ffffff
	ldx	[%i3+0x010],%l6		! %l6 = 95e5cfe88f348ca3
	fbe,pn	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000003080000c] = 024b4bbf, %l7 = 0000000000000000
	ldsb	[%o1+0x00e],%l7		! %l7 = 000000000000004b
p0_b70:
	membar	#Sync			! Added by membar checker (58)
!	%f20 = 41cffacd d0000000, %f4  = 80000001 00000000
	fdtox	%f20,%f4 		! %f4  = 00000000 3ff59ba0
!	%l0 = fffaffff, %l1 = 35493e54, Mem[0000000031800040] = fffffffd 3000af52
	stda	%l0,[%o3+0x040]%asi	! Mem[0000000031800040] = fffaffff 35493e54

p0_label_71:
!	Mem[0000000011000070] = 9ab613a4 1ffd134a, %l2 = ffffffff, %l3 = ffffffff
	ldd	[%i2+0x070],%l2		! %l2 = 000000009ab613a4 000000001ffd134a
	ble,a	p0_not_taken_0		! Branch Not Taken, %ccr = 0a
!	%l6 = 8f348ca3, %l7 = 0000004b, Mem[0000000010800000] = fffaffff ffffff9b
	stda	%l6,[%i1+%g0]0x80	! Annulled
p0_b71:
	membar	#Sync			! Added by membar checker (59)
!	%f24 = 235102fa, %f12 = a6a356ba
	fmovs	%f24,%f12		! %f12 = 235102fa
	set	p0_b72,%o7
	fbo,pt	%fcc0,p0_near_2_le	! Branch Taken, %fcc0 = 1

p0_label_72:
!	Mem[0000000030800044] = 114e8651, %l7 = 000000000000004b
	ldsb	[%o1+0x045],%l7		! %l7 = 000000000000004e
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x048,%g2
p0_b72:
!	Registers modified during the branch to p0_near_2
!	%l3  = 000000009271c602
!	%l6  = 0000000000000002
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000010000020] = 8c44b3c8 b0a815f7 c9d3804d 92bd6cae
	prefetch [%i0+0x020],20
	bge,a	p0_b73			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000010000020] = 8c44b3c8 b0a815f7 c9d3804d 92bd6cae
	prefetch [%i0+0x020],4
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x049,%g2
p0_b73:
!	Jump to jmpl_3, CWP = 0
	set	p0_jmpl_3_le,%g1
	jmpl	%g1,%g6

p0_label_73:
!	Mem[0000000011800000] = 55555555, %l0 = fffffffffffaffff
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000055
!	Registers modified during the branch to p0_jmpl_3
!	%l0  = fffffffffffffb6c
!	%l4  = 0000004dfffcd6c0
!	%l7  = ffffffffffffffb3
	membar	#Sync			! Added by membar checker (61)
!	%f16 = 0a94bcc5 00000000, %f10 = a33e7f9c 00000001
	fmovd	%f16,%f10		! %f10 = 0a94bcc5 00000000
!	Mem[0000000010800028] = 08c02fd507632b3e, %l0 = fffffffffffffb6c
	ldx	[%i1+0x028],%l0		! %l0 = 08c02fd507632b3e
!	%l4 = 0000004dfffcd6c0, immed = 0000030b, %l2 = 000000009ab613a4
	andcc	%l4,0x30b,%l2		! %l2 = 0000000000000200, %ccr = 00
!	Mem[00000000108000f4] = c9095129, %l6 = 0000000000000002
	ldsba	[%i1+0x0f4]%asi,%l6	! %l6 = ffffffffffffffc9

p0_label_74:
	fbg,pt	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000031800000] = ee07703d, %l5 = ffffffff6d8939fd
	ldsw	[%o3+0x000],%l5		! %l5 = ffffffffee07703d
p0_b74:
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000010000008] = fffaffff, %l5 = ffffffffee07703d
	ldstuba	[%i0+%o6]0x80,%l5	! %l5 = 00000000000000ff
!	%l6 = ffffffffffffffc9, %l7 = ffffffffffffffb3, %y  = 0000004d
	udiv	%l6,%l7,%l1		! %l1 = 000000000000004e
	fbu,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1

p0_label_75:
!	Mem[0000000010800000] = fffaffff ffffff9b dc93b241 78fb9bfa
	prefetch [%i1+0x000],20
p0_b75:
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000011800000] = 55555555 00000000 ff94d2b4 4285daf6
	prefetch [%i3+0x000],21
!	Mem[00000000110000a0] = b8d7c61e b8d7c61e 6aa84371 45f231ef
	prefetcha [%i2+0x0a0]%asi,1
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	 Annulled
	ldd	[%i3+0x038],%l6
p0_b76:

p0_label_76:
	membar	#Sync			! Added by membar checker (64)
!	%l3 = 000000009271c602, %l7 = ffffffffffffffb3, %l0 = 08c02fd507632b3e
	xnor	%l3,%l7,%l0		! %l0 = 000000009271c64e
!	%f22 = 522d03e5, %f0  = 00000000 00000001
	fstox	%f22,%f0 		! %f0  = 0000002b 40f94000
!	Branch On Register, %l2 = 0000000000000200
	brlz,a,pt %l2,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010000038] = f5a8f03f, %l4 = 0000004dfffcd6c0
	swap	[%i0+0x038],%l4		! Annulled
p0_b77:
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000031800048] = c1fe3de0, %l5 = 00000000000000ff
	lduwa	[%o3+0x048]%asi,%l5	! %l5 = 00000000c1fe3de0

p0_label_77:
!	%l3 = 000000009271c602, %l4 = 0000004dfffcd6c0, %l0 = 000000009271c64e
	addccc	%l3,%l4,%l0		! %l0 = 0000004e926e9cc2, %ccr = 09
!	Mem[0000000011800068] = b0c1b065, %l6 = ffffffffffffffc9
	ldstub	[%i3+0x068],%l6		! %l6 = 00000000000000b0
	nop
!	%l2 = 0000000000000200, Mem[0000000010800008] = dc93b241
	stba	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = 0093b241
!	%l5 = 00000000c1fe3de0
	sethi	%hi(0xbdb0f000),%l5	! %l5 = 00000000bdb0f000

p0_label_78:
	ble,a	p0_b78			! Branch Taken, %ccr = 09, CWP = 0
!	Mem[000000003100004c] = ffffffff, %l2 = 0000000000000200
	ldsw	[%o2+0x04c],%l2		! %l2 = ffffffffffffffff
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x04e,%g2
p0_b78:
	membar	#Sync			! Added by membar checker (66)
!	%f20 = 41cffacd d0000000, %f4  = 00000000 3ff59ba0
	fdtox	%f20,%f4 		! %f4  = 00000000 3ff59ba0
!	Mem[0000000010000002] = fffffffd, %l5 = 00000000bdb0f000
	ldstub	[%i0+0x002],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030800008] = 67b34320, %l2 = ffffffffffffffff
	ldub	[%o1+0x00b],%l2		! %l2 = 0000000000000020

p0_label_79:
	fbu,pn	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000011000080] = 56953e07 25888530 e792e7a6 7ca83cc4
	prefetch [%i2+0x080],2
p0_b79:
	bcc	p0_not_taken_0		! Branch Not Taken, %ccr = 09
!	Mem[0000000011000020] = c52d121e 9cdee2a4 dd88fc08 661e60cb
	prefetch [%i2+0x020],1
p0_b80:
	membar	#Sync			! Added by membar checker (67)
!	%l4 = 0000004dfffcd6c0, immed = fffff873, %y  = 0000004d
	sdivx	%l4,-0x78d,%l2		! %l2 = fffffffff5ab81d0

p0_label_80:
!	Jump to jmpl_3, CWP = 0
	set	p0_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	%l5 = 00000000000000ff, Mem[00000000118000f8] = 853fab31ce30cd8d
	stx	%l5,[%i3+0x0f8]		! Mem[00000000118000f8] = 00000000000000ff
!	Registers modified during the branch to p0_jmpl_3
!	%l0  = 0000000000000000
!	%l4  = fffff55300031ee0
!	%l7  = 00000000000000fc
!	%l0 = 0000000000000000, %l6 = 00000000000000b0, %l1 = 000000000000004e
	orncc	%l0,%l6,%l1		! %l1 = ffffffffffffff4f, %ccr = 88
!	%l2 = fffffffff5ab81d0, Mem[0000000032000008] = af60c67b2d367bd5
	stxa	%l2,[%o4+0x008]%asi	! Mem[0000000032000008] = fffffffff5ab81d0
	set	p0_b81,%o7
	fbl,a	p0_far_2_le	! Branch Taken, %fcc0 = 1

p0_label_81:
!	%l5 = 00000000000000ff, Mem[0000000011800000] = 5555555500000000
	stxa	%l5,[%i3+%g0]0x80	! Mem[0000000011800000] = 00000000000000ff
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x051,%g2
p0_b81:
!	Registers modified during the branch to p0_far_2
!	%l1  = fffffffffffe95b4
!	%l3  = fffff5530a5760cf
!	%l5  = 0000000000000913
	membar	#Sync			! Added by membar checker (68)
!	%l5 = 0000000000000913, immed = 0000001f, %l0 = 0000000000000000
	sllx	%l5,0x01f,%l0		! %l0 = 0000048980000000
!	%f22 = 522d03e5, %f18 = 00000000 00000001
	fstox	%f22,%f18		! %f18 = 0000002b 40f94000
!	%l7 = 00000000000000fc, %l1 = fffffffffffe95b4, %l2 = fffffffff5ab81d0
	sll	%l7,%l1,%l2		! %l2 = 000000000fc00000
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_82:
!	Mem[0000000010000000] = fffffffd3000af52, %l5 = 0000000000000913
	ldxa	[%i0+%g0]0x80,%l5	! Annulled
p0_b82:
	membar	#Sync			! Added by membar checker (69)
!	%l7 = 00000000000000fc
	setx	0xf3754b9cf3754b9c,%g7,%l7 ! %l7 = f3754b9cf3754b9c
!	%l2 = 000000000fc00000, %l7 = f3754b9cf3754b9c, %y  = ffffffff
	udiv	%l2,%l7,%l6		! %l6 = 00000000ffffffff
!	%l1 = fffffffffffe95b4, %l5 = 0000000000000913, %y  = ffffffff
	udivx	%l1,%l5,%l5		! %l5 = 001c36383403f777
!	Jump to jmpl_3, CWP = 0
	set	p0_jmpl_3_he,%g1
	jmpl	%g1,%g6

p0_label_83:
!	Mem[0000000011000008] = dc584e87, %l7 = f3754b9cf3754b9c
	lduwa	[%i2+%o6]0x80,%l7	! %l7 = 00000000dc584e87
!	Registers modified during the branch to p0_jmpl_3
!	%l4  = 00000000000000ff
!	%l6  = 00000000c1fe3de0
!	%l7  = 00000000b4cf6148
!	Mem[0000000011000000] = 00000003 00000000 dc584e87 c868254e
	prefetcha [%i2+0x000]%asi,21
!	%l1 = fffffffffffe95b4, %l7 = 00000000b4cf6148, %y  = ffffffff
	sdivx	%l1,%l7,%l7		! %l7 = 0000000000000000
!	%l5 = 001c36383403f777, %l2 = 000000000fc00000, %l2 = 000000000fc00000
	addc	%l5,%l2,%l2		! %l2 = 001c363843c3f777
	fbge,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_84:
!	Mem[0000000011000020] = c52d121e 9cdee2a4 dd88fc08 661e60cb
	prefetch [%i2+0x020],20	! Annulled
p0_b83:
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000010800090] = 0000004e, %l7 = 0000000000000000
	lduba	[%i1+0x090]%asi,%l7	! %l7 = 0000000000000000
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l0 = 0000048980000000, Mem[0000000031000008] = ffffffff
	stw	%l0,[%o2+0x008]		! Mem[0000000031000008] = 80000000
p0_b84:
	membar	#Sync			! Added by membar checker (71)
!	%l5 = 001c36383403f777, Mem[0000000031000000] = 65fb397f57d318f3
	stxa	%l5,[%o2+0x000]%asi	! Mem[0000000031000000] = 001c36383403f777

p0_label_85:
	set	p0_b85,%o7
	fba,a	p0_far_2_he	! Branch Taken, %fcc0 = 1
!	%l6 = 00000000c1fe3de0, Mem[00000000108000e4] = a4bcff04
	sth	%l6,[%i1+0x0e4]		! Annulled
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x055,%g2
p0_b85:
!	Registers modified during the branch to p0_far_2
!	%l2  = 001c3ebcf5abfff7
!	%l3  = 0000000000000077
!	%l6  = 000000000000007d
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (72)
!	%f24 = 235102fa, %f18 = 0000002b 40f94000
	fstod	%f24,%f18		! %f18 = 3c6a205f 40000000
!	%f10 = 0a94bcc5, %f26 = 0a94bcc5, %f31 = d0ad2e9d
	fdivs	%f10,%f26,%f31		! %f31 = 3f800000
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_86:
!	Mem[0000000011000008] = dc584e87, %l3 = 0000000000000077
	lduba	[%i2+%o6]0x80,%l3	! %l3 = 00000000000000dc
p0_b86:
	membar	#Sync			! Added by membar checker (73)
!	%f14 = 7fc20bdb, %f6  = 0a94bcc5
	fnegs	%f14,%f6 		! %f6  = ffc20bdb
!	Mem[000000003080000c] = 024b4bbf, %l6 = 000000000000007d
	ldsb	[%o1+0x00f],%l6		! %l6 = ffffffffffffffbf
!	Mem[00000000108000a0] = 65ef1ecd 92547def 2b314f1e 04cc417a
	prefetcha [%i1+0x0a0]%asi,23
!	Branch On Register, %l3 = 00000000000000dc
	brlez,a,pt %l3,p0_not_taken_0	! Branch Not Taken

p0_label_87:
!	Mem[000000001180003c] = 9ab613a4, %l3 = 00000000000000dc
	ldsw	[%i3+0x03c],%l3		! Annulled
p0_b87:
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000011000000] = 00000003 00000000, %l6 = ffffffbf, %l7 = 00000000
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000003 0000000000000000
!	Registers modified during the branch to p0_jmpl_2
!	%l3  = fffffffffffffa25
!	%l4  = 001c36383403f777
!	%l5  = 0000000000000001
!	%l7  = 0000000000000065
	membar	#Sync			! Added by membar checker (74)
!	Mem[0000000010800078] = b7e7e084, %l4 = 001c36383403f777
	ldsw	[%i1+0x078],%l4		! %l4 = ffffffffb7e7e084
!	%l1 = fffffffffffe95b4, immed = fffff99f, %l5 = 0000000000000001
	orncc	%l1,-0x661,%l5		! %l5 = fffffffffffe97f4, %ccr = 88

p0_label_88:
!	Mem[0000000032000020] = 5d456367 46314fb7 00000000 00000000
	prefetcha [%o4+0x020]%asi,16
!	Mem[00000000118000c0] = e1748a1b ce4fa829 49012a74 604c775f
	prefetch [%i3+0x0c0],2
!	Mem[0000000010800030] = 68a2a3fb, %l5 = fffffffffffe97f4
	ldsh	[%i1+0x032],%l5		! %l5 = ffffffffffffa3fb
!	Mem[000000003000000c] = 4285daf6, %l4 = ffffffffb7e7e084
	lduw	[%o0+0x00c],%l4		! %l4 = 000000004285daf6
!	%f26 = 0a94bcc5 42783361, %f10 = 0a94bcc5 00000000
	fabsd	%f26,%f10		! %f10 = 0a94bcc5 42783361

p0_label_89:
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetcha [%o4+0x040]%asi,0
!	%l5 = ffffffffffffa3fb, immed = 00000020, %l3 = fffffffffffffa25
	srlx	%l5,0x020,%l3		! %l3 = 00000000ffffffff
!	Mem[0000000010000000] = fffffffd 3000af52 fffaffff 35493e54
	prefetch [%i0+0x000],4
	set	p0_b88,%o7
	fbne,a,pn %fcc0,p0_near_2_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000011000008] = dc584e87 c868254e, %l0 = 80000000, %l1 = fffe95b4
	ldda	[%i2+%o6]0x80,%l0	! %l0 = 00000000dc584e87 00000000c868254e
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x058,%g2
p0_b88:
!	Registers modified during the branch to p0_near_2
!	%l0  = 0000000042857ef1
!	%l3  = bda7e56e1ce68b31

p0_label_90:
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000011000048] = 14edc444522d21db, %l1 = 00000000c868254e
	ldxa	[%i2+0x048]%asi,%l1	! %l1 = 14edc444522d21db
	bvc	p0_b89			! Branch Taken, %ccr = 11, CWP = 0
!	Mem[0000000010800000] = fffaffff ffffff9b 0093b241 78fb9bfa
	prefetch [%i1+0x000],21
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x059,%g2
p0_b89:
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000011000080] = 56953e07 25888530 e792e7a6 7ca83cc4
	prefetcha [%i2+0x080]%asi,1
!	%l6 = 0000000000000003, immed = 000009c3, %l3 = bda7e56e1ce68b31
	orncc	%l6,0x9c3,%l3		! %l3 = fffffffffffff63f, %ccr = 88

p0_label_91:
!	Mem[0000000030800042] = 934bbb69, %l7 = 0000000000000065
	ldstub	[%o1+0x042],%l7		! %l7 = 00000000000000bb
!	Mem[0000000040000010] = 39290b36320b0a3f, %l7 = 00000000000000bb
	ldxa	[%o5+0x010]%asi,%l7	! %l7 = 39290b36320b0a3f
!	Mem[0000000011800068] = ffc1b065, %l3 = fffffffffffff63f
	ldsba	[%i3+0x06a]%asi,%l3	! %l3 = ffffffffffffffb0
!	%f10 = 0a94bcc5, %f6  = ffc20bdb, %f3  = 235102fa
	fdivs	%f10,%f6 ,%f3 		! %f3  = ffc20bdb
!	%l6 = 0000000000000003, %l0 = 0000000042857ef1, %l0 = 0000000042857ef1
	addc	%l6,%l0,%l0		! %l0 = 0000000042857ef4

p0_label_92:
!	Mem[0000000011800008] = ff94d2b4, %l2 = 001c3ebcf5abfff7
	lduha	[%i3+%o6]0x80,%l2	! %l2 = 000000000000ff94
!	Mem[0000000031000044] = 4194d77e, %l2 = 000000000000ff94
	lduw	[%o2+0x044],%l2		! %l2 = 000000004194d77e
	ba,a	p0_b90			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000031000042] = 00000967, %l2 = 000000004194d77e
	ldstub	[%o2+0x042],%l2		! Annulled
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x05a,%g2
p0_b90:
	ba,a	p0_b91			! Branch Taken, %ccr = 88, CWP = 0

p0_label_93:
!	Mem[0000000010800008] = 0093b241, %l1 = 14edc444522d21db
	lduwa	[%i1+%o6]0x80,%l1	! Annulled
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x05b,%g2
p0_b91:
	membar	#Sync			! Added by membar checker (77)
!	Branch On Register, %l6 = 0000000000000003
	brnz,pt	%l6,p0_b92		! Branch Taken
!	Mem[0000000031800048] = c1fe3de0b4cf6148, %l4 = 000000004285daf6
	ldx	[%o3+0x048],%l4		! %l4 = c1fe3de0b4cf6148
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x05c,%g2
p0_b92:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l3 = ffffffffffffffb0, Mem[0000000010000000] = fffffffd
	stha	%l3,[%i0+%g0]0x80	! Mem[0000000010000000] = ffb0fffd
p0_b93:

p0_label_94:
	fbn,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003000004c] = fff3a65f, %l0 = 0000000042857ef4
	ldub	[%o0+0x04e],%l0		! Annulled
p0_b94:
	membar	#Sync			! Added by membar checker (78)
!	%l1 = 14edc444522d21db, %l0 = 0000000042857ef4, %l6 = 0000000000000003
	subccc	%l1,%l0,%l6		! %l6 = 14edc4440fa7a2e7, %ccr = 00
	bge,a	p0_b95			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000031800000] = ee07703d, %l1 = 14edc444522d21db
	swap	[%o3+0x000],%l1		! %l1 = 00000000ee07703d
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x05f,%g2
p0_b95:

p0_label_95:
	membar	#Sync			! Added by membar checker (79)
	set	p0_b96,%o7
	fba,pn	%fcc1,p0_near_2_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000011800000] = 00000000, %l3 = ffffffffffffffb0
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x060,%g2
p0_b96:
!	Registers modified during the branch to p0_near_2
!	%l3  = 000000004285daf9
!	%l6  = 0000000001905851
	membar	#Sync			! Added by membar checker (80)
!	%l5 = ffffffffffffa3fb, immed = 00000f8a, %l6 = 0000000001905851
	andncc	%l5,0xf8a,%l6		! %l6 = ffffffffffffa071, %ccr = 88
!	%l5 = ffffffffffffa3fb, Mem[0000000011000008] = dc584e87c868254e
	stxa	%l5,[%i2+%o6]0x80	! Mem[0000000011000008] = ffffffffffffa3fb
!	Mem[000000003100004c] = ffffffff, %l6 = ffffffffffffa071
	ldsba	[%o2+0x04d]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_96:
!	Mem[0000000011000000] = 00000003, %l5 = ffffffffffffa3fb
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l6 = ffffffffffffffff, %l1 = 00000000ee07703d, %l5 = 0000000000000000
	add	%l6,%l1,%l5		! %l5 = 00000000ee07703c
!	%l3 = 000000004285daf9, %l0 = 0000000042857ef4, %l0 = 0000000042857ef4
	tsubcc	%l3,%l0,%l0		! %l0 = 0000000000005c05, %ccr = 02
!	%l4 = c1fe3de0b4cf6148, Mem[0000000010800078] = b7e7e084b15b6e1a
	stxa	%l4,[%i1+0x078]%asi	! Mem[0000000010800078] = c1fe3de0b4cf6148
!	Mem[0000000030000044] = 879eb436, %l5 = 00000000ee07703c
	ldsba	[%o0+0x044]%asi,%l5	! %l5 = ffffffffffffff87

p0_label_97:
	set	p0_b97,%o7
	fbule	p0_far_1_le	! Branch Taken, %fcc0 = 1
!	%l3 = 000000004285daf9, Mem[0000000030800002] = 77b3cf8b
	sth	%l3,[%o1+0x002]		! Mem[0000000030800000] = 77b3daf9
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x061,%g2
p0_b97:
!	Registers modified during the branch to p0_far_1
!	%l0  = ffffffffffffffff
!	%l1  = ffffffffffffdaf6
!	%l3  = 69b83a2982bdc505
!	%l4  = ffffffffffffffff
!	call to call_1, CWP = 0
	call	p0_call_1_he
!	Mem[0000000010000008] = fffaffff, %l4 = ffffffffffffffff
	lduwa	[%i0+%o6]0x80,%l4	! %l4 = 00000000fffaffff
!	Registers modified during the branch to p0_call_1
!	%l4  = 53057b8a0a000000
	membar	#Sync			! Added by membar checker (81)
!	%f22 = 522d03e5 a33e7f9c, %f22 = 522d03e5 a33e7f9c, %f30 = 7c91042c 3f800000
	fdivd	%f22,%f22,%f30		! %f30 = 3ff00000 00000000

p0_label_98:
!	%l3 = 69b83a2982bdc505, %l1 = ffffffffffffdaf6, %l6 = ffffffffffffffff
	andcc	%l3,%l1,%l6		! %l6 = 69b83a2982bdc004, %ccr = 08
!	Mem[0000000032000034] = 3a1e3068, %l6 = 69b83a2982bdc004
	ldsh	[%o4+0x034],%g2		! %g2 = 0000000000003a1e
!	%l1 = ffffffffffffdaf6, %l3 = 69b83a2982bdc505, %y  = ffffffff
	udiv	%l1,%l3,%l1		! %l1 = 00000000ffffffff
	fbuge	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 000000004194d77e, Mem[0000000010000020] = 8c44b3c8b0a815f7
	stx	%l2,[%i0+0x020]		! Mem[0000000010000020] = 000000004194d77e
p0_b98:

p0_label_99:
	bl,a	p0_b99			! Branch Taken, %ccr = 08, CWP = 0
!	%l5 = ffffffffffffff87, Mem[0000000031800044] = 35493e54
	stw	%l5,[%o3+0x044]		! Mem[0000000031800044] = ffffff87
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x063,%g2
p0_b99:
	membar	#Sync			! Added by membar checker (82)
!	%f2  = a0c94b69 ffc20bdb, %f2  = a0c94b69 ffc20bdb, %f20 = 41cffacd d0000000
	fsubd	%f2 ,%f2 ,%f20		! %f20 = 00000000 00000000
!	%f2  = a0c94b69, %f30 = 3ff00000 00000000
	fstod	%f2 ,%f30		! %f30 = bc19296d 20000000
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_100:
!	%l2 = 000000004194d77e, Mem[00000000108000f8] = 82663350e0c74b7e
	stx	%l2,[%i1+0x0f8]		! Annulled
p0_b100:
	membar	#Sync			! Added by membar checker (83)
!	%f2  = a0c94b69 ffc20bdb, %f8  = 235102fa c84f0ef5
	fnegd	%f2 ,%f8 		! %f8  = 20c94b69 ffc20bdb
	fbg,a,pt %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[00000000118000a0] = 555555ff 00000000 57a0c86b acb4bc6c
	prefetch [%i3+0x0a0],20	! Annulled
p0_b101:
	membar	#Sync			! Added by membar checker (84)
!	%f29 = 00000000, %f2  = a0c94b69
	fabss	%f29,%f2 		! %f2  = 00000000

p0_label_101:
!	Mem[0000000011800008] = ff94d2b4, %l2 = 000000004194d77e
	swapa	[%i3+%o6]0x80,%l2	! %l2 = 00000000ff94d2b4

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba,a	p0_branch_failed
p0_not_taken_0_end:

!	%l2 = 00000000ff94d2b4, Mem[0000000012000000] = 9b36a58753e5dbda
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000012000000] = 00000000ff94d2b4
!	%f25 = c84f0ef5, %f15 = 00000000, %f8  = 20c94b69
	fadds	%f25,%f15,%f8 		! %f8  = c84f0ef5
!	Mem[0000000032000054] = d77e9ece, %l1 = 00000000ffffffff
	ldsha	[%o4+0x056]%asi,%g2	! %g2 = ffffffffffffd77e
!	%f18 = 3c6a205f 40000000, %f18 = 3c6a205f 40000000
	fmovd	%f18,%f18		! %f18 = 3c6a205f 40000000

p0_label_102:
!	%l1 = 00000000ffffffff, immed = fffffeb9, %l4 = 53057b8a0a000000
	sub	%l1,-0x147,%l4		! %l4 = 0000000100000146
	bne,a	p0_b102			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[00000000110000dc] = f3e1ea58, %l5 = ffffffffffffff87
	lduh	[%i2+0x0de],%l5		! %l5 = 000000000000ea58
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x066,%g2
p0_b102:
	membar	#Sync			! Added by membar checker (85)
!	%l3 = 69b83a2982bdc505, immed = fffffcf1, %y  = ffffffff
	sdivcc	%l3,-0x30f,%l3		! %l3 = 000000000028f3fa, %ccr = 00
!	%f15 = 00000000, %f17 = 00000000, %f16 = 0a94bcc5
	fsubs	%f15,%f17,%f16		! %f16 = 00000000

p0_label_103:
!	%l7 = 39290b36320b0a3f, Mem[0000000031800000] = 522d21db0a986dbb
	stx	%l7,[%o3+0x000]		! Mem[0000000031800000] = 39290b36320b0a3f
	set	p0_b103,%o7
	fbge,pt	%fcc1,p0_near_3_he	! Branch Taken, %fcc1 = 0
!	Mem[00000000118000e0] = faafacd7 dab5d1e7 fb10d895 854fd999
	prefetch [%i3+0x0e0],23
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x067,%g2
p0_b103:
!	Registers modified during the branch to p0_near_3
!	%l1  = 00000000006b2d4c
!	%l5  = fffffffffffffeba
	membar	#Sync			! Added by membar checker (86)
!	Mem[0000000010800000] = fffaffff, %l3 = 000000000028f3fa
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = fffffffffffffffa
	set	p0_b104,%o7
	fbl	p0_far_3_le	! Branch Taken, %fcc0 = 1

p0_label_104:
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 ffffffff f5ab81d0
	prefetch [%o4+0x000],16
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x068,%g2
p0_b104:
!	Registers modified during the branch to p0_far_3
!	%l7  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (87)
!	%l2 = 00000000ff94d2b4, immed = 00000af1, %l5 = fffffffffffffeba
	xnorcc	%l2,0xaf1,%l5		! %l5 = ffffffff006b27ba, %ccr = 80
!	%l2 = 00000000ff94d2b4, immed = fffff66a, %l7 = 00000000ffffffff
	addcc	%l2,-0x996,%l7		! %l7 = 00000000ff94c91e, %ccr = 19
	set	p0_b105,%o7
	fba	p0_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000011000000] = 00000003, %l2 = 00000000ff94d2b4
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000003
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x069,%g2
p0_b105:
!	Registers modified during the branch to p0_far_0
!	%l0  = ffffffffff94d2b2
!	%l1  = ffffffffffffdd88
!	%l3  = ffffffffffffffff
!	%l7  = 0000000000000041

p0_label_105:
	set	p0_b106,%o7
	fbo	p0_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000011800020] = 39d163a7 cc7ef476 dcf43600 a6f07569
	prefetch [%i3+0x020],3
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x06a,%g2
p0_b106:
!	Registers modified during the branch to p0_far_3
!	%l7  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (88)
!	%l0 = ffffffffff94d2b2, %l7 = 00000000ffffffff, %l0 = ffffffffff94d2b2
	or	%l0,%l7,%l0		! %l0 = ffffffffffffffff
!	Branch On Register, %l0 = ffffffffffffffff
	brnz,pn	%l0,p0_b107		! Branch Taken
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],4
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x06b,%g2
p0_b107:

p0_label_106:
	membar	#Sync			! Added by membar checker (89)
!	Mem[00000000118000a0] = 555555ff 00000000 57a0c86b acb4bc6c
	prefetcha [%i3+0x0a0]%asi,16
!	%l3 = ffffffffffffffff, %l3 = ffffffffffffffff, %y  = ffffffff
	mulx	%l3,%l3,%l0		! %l0 = 0000000000000001
!	%l6 = 69b83a2982bdc004, %l4 = 0000000100000146, %y  = ffffffff
	mulx	%l6,%l4,%l7		! %l7 = 2357d0e07da28518
!	Mem[0000000010000008] = fffaffff, %l5 = ffffffff006b27ba
	lduwa	[%i0+%o6]0x80,%l5	! %l5 = 00000000fffaffff
	fbug,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_107:
!	Mem[0000000032000020] = 5d456367 46314fb7 00000000 00000000
	prefetch [%o4+0x020],4
p0_b108:
	membar	#Sync			! Added by membar checker (90)
	set	p0_b109,%o7
	fbul,a,pt %fcc0,p0_near_1_he	! Branch Taken, %fcc0 = 1
!	%l4 = 00000146, %l5 = fffaffff, Mem[0000000013000008] = 012adb85 5630c35d
	stda	%l4,[%i6+%o6]0x80	! Mem[0000000013000008] = 00000146 fffaffff
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x06d,%g2
p0_b109:
!	Registers modified during the branch to p0_near_1
!	%l0  = 0000000000000002
!	%l3  = 0000000000000fff
!	%l4  = 0000000000000000
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010000000] = ffb0fffd3000af52, %l3 = 0000000000000fff
	ldxa	[%i0+%g0]0x80,%l3	! Annulled
p0_b110:

p0_label_108:
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 19
!	%l2 = 00000003, %l3 = 00000fff, Mem[0000000031800040] = fffaffff ffffff87
	std	%l2,[%o3+0x040]	! Annulled
p0_b111:
	membar	#Sync			! Added by membar checker (91)
!	Mem[0000000031800048] = 00000003 00000fff, %l2 = 0000000000000003, %l7 = 2357d0e07da28518
	add	%o3,0x48,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = c1fe3de0b4cf6148
!	%l0 = 0000000000000002, %l3 = 0000000000000fff, %l1 = ffffffffffffdd88
	andn	%l0,%l3,%l1		! %l1 = 0000000000000000
!	%l6 = 69b83a2982bdc004
	setx	0xb75911b9b75911b9,%g7,%l6 ! %l6 = b75911b9b75911b9

p0_label_109:
	bl	p0_b112			! Branch Taken, %ccr = 19, CWP = 0
!	Mem[00000000118000c0] = e1748a1b ce4fa829 49012a74 604c775f
	prefetch [%i3+0x0c0],23
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x070,%g2
p0_b112:
	membar	#Sync			! Added by membar checker (92)
!	%l6 = b75911b9, %l7 = b4cf6148, Mem[0000000010000000] = ffb0fffd 3000af52
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010000000] = b75911b9 b4cf6148
!	Mem[0000000011800008] = 4194d77e, %l6 = b75911b9b75911b9
	lduba	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000041
!	%f8  = c84f0ef5 ffc20bdb, %f4  = 00000000 3ff59ba0
	fabsd	%f8 ,%f4 		! %f4  = 484f0ef5 ffc20bdb

p0_label_110:
!	%f14 = 7fc20bdb 00000000, %f26 = 0a94bcc5 42783361
	fmovd	%f14,%f26		! %f26 = 7fc20bdb 00000000
!	%l4 = 0000000000000000, immed = fffff4ca, %l0 = 0000000000000002
	xorcc	%l4,-0xb36,%l0		! %l0 = fffffffffffff4ca, %ccr = 88
!	%f9  = ffc20bdb, %f8  = c84f0ef5, %f31 = 20000000
	fmuls	%f9 ,%f8 ,%f31		! %f31 = ffc20bdb
!	%l4 = 0000000000000000, immed = 00000700, %y  = ffffffff
	sdivcc	%l4,0x700,%l0		! %l0 = ffffffffffdb6db7, %ccr = 88
!	%l7 = c1fe3de0b4cf6148, immed = 0000008e, %l7 = c1fe3de0b4cf6148
	orcc	%l7,0x08e,%l7		! %l7 = c1fe3de0b4cf61ce, %ccr = 88

p0_label_111:
	fbug,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001180008c] = 9434a731, %l3 = 0000000000000fff
	lduh	[%i3+0x08e],%l3		! Annulled
p0_b113:
	membar	#Sync			! Added by membar checker (93)
	set	p0_b114,%o7
	fbne,a,pn %fcc2,p0_near_1_he	! Branch Taken, %fcc2 = 1
!	Mem[0000000010800000] = fffaffff, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = fffffffffffaffff
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x072,%g2
p0_b114:
!	Registers modified during the branch to p0_near_1
!	%l0  = ffffffffffdb6db7
!	%l3  = 0000000000000000
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (94)
!	%f8  = c84f0ef5, %f8  = c84f0ef5
	fcmps	%fcc3,%f8 ,%f8 		! %fcc3 = 0

p0_label_112:
!	%l6 = 0000000000000041, %l3 = 0000000000000000, %l2 = 0000000000000003
	add	%l6,%l3,%l2		! %l2 = 0000000000000041
	set	p0_b115,%o7
	fblg,a	p0_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000010800020] = ad90b1ef, %l7 = c1fe3de0b4cf61ce
	ldsw	[%i1+0x020],%l7		! %l7 = ffffffffad90b1ef
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x073,%g2
p0_b115:
!	Registers modified during the branch to p0_far_1
!	%l0  = 0000000000000041
!	%l1  = ffffffffffffdaf6
!	%l3  = 69b83a2982bdc505
!	%l4  = 000000007ffd7fff
	membar	#Sync			! Added by membar checker (95)
!	Mem[00000000110000b4] = 86bc6f67, %l6 = 0000000000000041
	lduha	[%i2+0x0b6]%asi,%l6	! %l6 = 0000000000006f67
!	%l1 = ffffffffffffdaf6, %l5 = 00000000fffaffff, %y  = ffffffff
	sdivcc	%l1,%l5,%l6		! %l6 = 0000000000000000, %ccr = 44

p0_label_113:
	set	p0_b116,%o7
	fbo,a,pt %fcc0,p0_near_2_he	! Branch Taken, %fcc0 = 1
!	%l6 = 0000000000000000, Mem[0000000010000064] = fffff4ef
	sth	%l6,[%i0+0x064]		! Mem[0000000010000064] = 0000f4ef
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x074,%g2
p0_b116:
!	Registers modified during the branch to p0_near_2
!	%l0  = 000000017ff87ffe
!	%l3  = 0000000000001081
	membar	#Sync			! Added by membar checker (96)
!	Mem[00000000100000d0] = 2f2d8861, %l6 = 0000000000000000
	ldsh	[%i0+0x0d2],%l6		! %l6 = ffffffffffff8861
	fbu,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000010000008] = fffaffff35493e54, %l5 = 00000000fffaffff
	ldxa	[%i0+%o6]0x80,%l5	! Annulled
p0_b117:

p0_label_114:
	membar	#Sync			! Added by membar checker (97)
!	%l6 = ffffffffffff8861, %l5 = 00000000fffaffff, %l7 = ffffffffad90b1ef
	addcc	%l6,%l5,%l7		! %l7 = 00000000fffa8860, %ccr = 19
!	%l2 = 0000000000000041, Mem[0000000010800008] = 0093b2ff
	stwa	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = 00000041
	fbge,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	 Annulled
	ldda	[%i1+%o6]0x80,%l6
p0_b118:
	membar	#Sync			! Added by membar checker (98)
!	%l6 = ffff8861, %l7 = fffa8860, Mem[0000000040000010] = 39290b36 320b0a3f
	std	%l6,[%o5+0x010]	! Mem[0000000040000010] = ffff8861 fffa8860

p0_label_115:
!	%f26 = 7fc20bdb 00000000, %f20 = 00000000 00000000, %f14 = 7fc20bdb 00000000
	faddd	%f26,%f20,%f14		! %f14 = 7fc20bdb 00000000
	bgu	p0_not_taken_0		! Branch Not Taken, %ccr = 19
!	%l3 = 0000000000001081, Mem[0000000011800000] = 00000000
	stha	%l3,[%i3+%g0]0x80	! Mem[0000000011800000] = 10810000
p0_b119:
	bgu	p0_not_taken_0		! Branch Not Taken, %ccr = 19
!	Mem[0000000010000040] = a82a238c dd3d3fc4 00000000 0aa2584c
	prefetch [%i0+0x040],3
p0_b120:

p0_label_116:
	membar	#Sync			! Added by membar checker (99)
	set	p0_b121,%o7
	fblg,pn	%fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000020] = 5d456367, %l1 = ffffffffffffdaf6
	lduw	[%o4+0x020],%g2		! %g2 = ffffffffffffdaf6
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x079,%g2
p0_b121:
!	Registers modified during the branch to p0_near_3
!	%l1  = 000000207e187f7e
!	%l5  = 3ffb0011400c8002
	membar	#Sync			! Added by membar checker (100)
!	Mem[00000000110000a0] = ad90b1ef b8d7c61e 6aa84371 45f231ef
	prefetch [%i2+0x0a0],20
!	Branch On Register, %l3 = 0000000000001081
	brgz,pn	%l3,p0_b122		! Branch Taken
!	%l4 = 000000007ffd7fff, Mem[0000000010800000] = fffaffffffffff9b
	stxa	%l4,[%i1+%g0]0x80	! Mem[0000000010800000] = 000000007ffd7fff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x07a,%g2
p0_b122:

p0_label_117:
	membar	#Sync			! Added by membar checker (101)
!	%l7 = 00000000fffa8860, %l0 = 000000017ff87ffe, %l0 = 000000017ff87ffe
	addc	%l7,%l0,%l0		! %l0 = 000000027ff3085e
!	%l5 = 3ffb0011400c8002, %l4 = 000000007ffd7fff, %l3 = 0000000000001081
	orcc	%l5,%l4,%l3		! %l3 = 3ffb00117ffdffff, %ccr = 00
!	Mem[0000000010000080] = 53884cd6 fa161430 de534ff3 03f265d6
	prefetcha [%i0+0x080]%asi,23
!	%f0  = 0000002b 40f94000, %f24 = 235102fa c84f0ef5
	fnegd	%f0 ,%f24		! %f24 = 8000002b 40f94000
!	%l6 = ffff8861, %l7 = fffa8860, Mem[0000000031800040] = fffaffff ffffff87
	stda	%l6,[%o3+0x040]%asi	! Mem[0000000031800040] = ffff8861 fffa8860

p0_label_118:
!	Mem[0000000031000008] = 80000000, %l6 = ffffffffffff8861
	swap	[%o2+0x008],%l6		! %l6 = 0000000080000000
!	%l3 = 3ffb00117ffdffff, %l6 = 0000000080000000, %l4 = 000000007ffd7fff
	andcc	%l3,%l6,%l4		! %l4 = 0000000000000000, %ccr = 44
!	%l2 = 0000000000000041, immed = 0000088d, %y  = 3ffb0011
	umulcc	%l2,0x88d,%l0		! %l0 = 0000000000022bcd, %ccr = 00
	fbe,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l3 = 3ffb00117ffdffff, Mem[000000001180000c] = 4285daf6
	sth	%l3,[%i3+0x00c]		! Annulled
p0_b123:

p0_label_119:
	membar	#Sync			! Added by membar checker (102)
!	Mem[0000000030000008] = 5707ff11 4285daf6, %l2 = 00000041, %l3 = 7ffdffff
	ldd	[%o0+0x008],%l2		! %l2 = 000000005707ff11 000000004285daf6
!	%l5 = 3ffb0011400c8002, %l2 = 000000005707ff11, %l5 = 3ffb0011400c8002
	and	%l5,%l2,%l5		! %l5 = 0000000040048000
	fbn,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000011000000] = 00000003, %l7 = 00000000fffa8860
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000003
p0_b124:
	membar	#Sync			! Added by membar checker (103)
	set	p0_b125,%o7
	fbule,a,pn %fcc3,p0_near_3_he	! Branch Taken, %fcc3 = 0

p0_label_120:
!	Mem[00000000108000cc] = 52ba4f23, %l0 = 0000000000022bcd
	ldub	[%i1+0x0cf],%l0		! %l0 = 0000000000000023
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x07d,%g2
p0_b125:
!	Registers modified during the branch to p0_near_3
!	%l1  = 0000000be617df53
!	%l5  = 0000000000000000
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000010800054] = d913359f, %l2 = 000000005707ff11
	ldsh	[%i1+0x056],%l2		! Annulled
p0_b126:
	membar	#Sync			! Added by membar checker (104)
!	%f19 = 40000000, %f14 = 7fc20bdb 00000000
	fstox	%f19,%f14		! %f14 = 00000000 00000002
!	Mem[00000000118000c0] = e1748a1b ce4fa829 49012a74 604c775f
	prefetcha [%i3+0x0c0]%asi,4

p0_label_121:
	fbug,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	 Annulled
	ldd	[%o4+0x020],%g2
p0_b127:
	membar	#Sync			! Added by membar checker (105)
!	Mem[0000000010800060] = a815f184 65c4e7c7 c7bf98d9 c0499f93
	prefetch [%i1+0x060],16
!	Mem[0000000031000008] = ffff886178fb9bfa, %l1 = 0000000be617df53
	ldx	[%o2+0x008],%l1		! %l1 = ffff886178fb9bfa
!	%l4 = 0000000000000000, immed = fffffdc9, %l0 = 0000000000000023
	or	%l4,-0x237,%l0		! %l0 = fffffffffffffdc9

p0_label_122:
!	%f4  = 484f0ef5 ffc20bdb, %f28 = 37cf0ef5 00000000
	fnegd	%f4 ,%f28		! %f28 = c84f0ef5 ffc20bdb
!	%l4 = 0000000000000000, immed = fffff2f4, %l7 = 0000000000000003
	xor	%l4,-0xd0c,%l7		! %l7 = fffffffffffff2f4
!	%l1 = ffff886178fb9bfa, immed = 0000038b, %y  = 00000000
	udivcc	%l1,0x38b,%l0		! %l0 = 00000000002225b6, %ccr = 00
!	%l1 = ffff886178fb9bfa, Mem[0000000011000008] = ffffffff
	stwa	%l1,[%i2+%o6]0x80	! Mem[0000000011000008] = 78fb9bfa
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_123:
!	Mem[0000000011800008] = 4194d77e, %l7 = fffffffffffff2f4
	lduwa	[%i3+%o6]0x80,%l7	! %l7 = 000000004194d77e
p0_b128:
	membar	#Sync			! Added by membar checker (106)
!	%f29 = ffc20bdb, %f6  = ffc20bdb, %f30 = bc19296d
	fmuls	%f29,%f6 ,%f30		! %f30 = ffc20bdb
!	Mem[0000000030800008] = 67b34320, %l6 = 0000000080000000
	ldswa	[%o1+0x008]%asi,%l6	! %l6 = 0000000067b34320
!	%l2 = 000000005707ff11, immed = fffffc1c, %l0 = 00000000002225b6
	add	%l2,-0x3e4,%l0		! %l0 = 000000005707fb2d
	set	p0_b129,%o7
	fba,a	p0_far_3_le	! Branch Taken, %fcc0 = 1

p0_label_124:
!	 Annulled
	ldda	[%i0+%o6]0x80,%l4
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x081,%g2
p0_b129:
!	Registers modified during the branch to p0_far_3
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (107)
!	%l2 = 000000005707ff11
	setx	0x69a5cf4269a5cf42,%g7,%l2 ! %l2 = 69a5cf4269a5cf42
!	Branch On Register, %l1 = ffff886178fb9bfa
	brnz,a,pn %l1,p0_b130		! Branch Taken
!	%l0 = 000000005707fb2d, Mem[0000000011000008] = 78fb9bfa
	stba	%l0,[%i2+%o6]0x80	! Mem[0000000011000008] = 2dfb9bfa
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x082,%g2
p0_b130:
	set	p0_b131,%o7
	fbne,a	p0_far_1_le	! Branch Taken, %fcc0 = 1

p0_label_125:
!	%l1 = ffff886178fb9bfa, Mem[0000000010800000] = 00000000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010800000] = fa000000
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x083,%g2
p0_b131:
!	Registers modified during the branch to p0_far_1
!	%l0  = 0000000067b34320
!	%l1  = ffffffffffffdaf6
!	%l3  = 69b83a2982bdc505
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (108)
!	%f6  = ffc20bdb, %f3  = ffc20bdb
	fnegs	%f6 ,%f3 		! %f3  = 7fc20bdb
!	Mem[0000000011800008] = 4194d77e, %l3 = 69b83a2982bdc505
	ldsba	[%i3+%o6]0x80,%l3	! %l3 = 0000000000000041
!	%l5 = 0000000000000000, immed = 00000e1b, %l5 = 0000000000000000
	sub	%l5,0xe1b,%l5		! %l5 = fffffffffffff1e5
!	Mem[0000000011000060] = f6f7fe90 1aae8224 af1b7190 ef2ea8d6
	prefetcha [%i2+0x060]%asi,4

p0_label_126:
!	%f28 = c84f0ef5 ffc20bdb, %f20 = 00000000 00000000, %f4  = 484f0ef5 ffc20bdb
	fsubd	%f28,%f20,%f4 		! %f4  = c84f0ef5 ffc20bdb
	bpos	p0_b132			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000010800020] = ad90b1ef ad90be39 08c02fd5 07632b3e
	prefetch [%i1+0x020],0
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x084,%g2
p0_b132:
	set	p0_b133,%o7
	fbule,a	p0_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000010800013] = 2a5f7956, %l1 = ffffffffffffdaf6
	ldstub	[%i1+0x013],%l1		! %l1 = 0000000000000056
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x085,%g2
p0_b133:
!	Registers modified during the branch to p0_far_3
!	%l7  = 0000000000000000

p0_label_127:
	membar	#Sync			! Added by membar checker (109)
!	Mem[00000000118000bc] = 9f2b2443, %l4 = 0000000000000000
	swap	[%i3+0x0bc],%l4		! %l4 = 000000009f2b2443
!	Mem[0000000010800000] = fa000000, %l1 = 0000000000000056
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000fa
!	Jump to jmpl_0, CWP = 0
	set	p0_jmpl_0_he,%g1
	jmpl	%g1,%g6
!	Mem[0000000010800094] = 3db22d38, %l5 = fffffffffffff1e5
	swap	[%i1+0x094],%l5		! %l5 = 000000003db22d38
!	Registers modified during the branch to p0_jmpl_0
!	%l0  = 00000000c1fe3de0
!	%l1  = 00000000000000ff
!	%l4  = 0000000000000000
!	%l5  = 0000000000000041
!	%l6  = 0000000032c68000
	fbg,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1

p0_label_128:
!	Mem[0000000011800048] = 60d41cfc, %l1 = 00000000000000ff
	ldub	[%i3+0x04b],%l1		! Annulled
p0_b134:
	membar	#Sync			! Added by membar checker (110)
!	%l7 = 0000000000000000, %l6 = 0000000032c68000, %l3 = 0000000000000041
	andn	%l7,%l6,%l3		! %l3 = 0000000000000000
	nop
!	%l1 = 00000000000000ff, %l4 = 0000000000000000, %l7 = 0000000000000000
	xnorcc	%l1,%l4,%l7		! %l7 = ffffffffffffff00, %ccr = 88
	nop

p0_label_129:
!	Jump to jmpl_1, CWP = 0
	set	p0_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	%l4 = 0000000000000000, Mem[0000000013000008] = 00000146fffaffff
	stxa	%l4,[%i6+%o6]0x80	! Mem[0000000013000008] = 0000000000000000
!	Registers modified during the branch to p0_jmpl_1
!	%l0  = 0000000000000000
!	%l1  = 00000000c1fe4c68
!	%l7  = 0000000000000460
!	%l1 = 00000000c1fe4c68, Mem[0000000031800048] = c1fe3de0b4cf6148
	stx	%l1,[%o3+0x048]		! Mem[0000000031800048] = 00000000c1fe4c68
!	%l0 = 0000000000000000, immed = fffffde1, %l0 = 0000000000000000
	taddcc	%l0,-0x21f,%l0		! %l0 = fffffffffffffde1, %ccr = 8a
!	Mem[0000000040000014] = fffa8860, %l4 = 0000000000000000
	lduw	[%o5+0x014],%l4		! %l4 = 00000000fffa8860

p0_label_130:
!	%l7 = 0000000000000460, %l7 = 0000000000000460, %l7 = 0000000000000460
	xorcc	%l7,%l7,%l7		! %l7 = 0000000000000000, %ccr = 44
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000110000a0] = ad90b1ef b8d7c61e 6aa84371 45f231ef
	prefetch [%i2+0x0a0],3	! Annulled
p0_b135:
	membar	#Sync			! Added by membar checker (111)
!	%f10 = 0a94bcc5 42783361, %f18 = 3c6a205f 40000000
	fmovd	%f10,%f18		! %f18 = 0a94bcc5 42783361
	set	p0_b136,%o7
	fble,pn	%fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 0

p0_label_131:
!	%l3 = 0000000000000000, Mem[0000000010800000] = ff000000
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000000
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x088,%g2
p0_b136:
!	Registers modified during the branch to p0_near_2
!	%l0  = 00000000fffa88a1
!	%l3  = 0000000000047fc1
	membar	#Sync			! Added by membar checker (112)
!	Mem[0000000011000000] = fffa8860, %l7 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	%f11 = 42783361, %f20 = 00000000 00000000
	fstod	%f11,%f20		! %f20 = 404f066c 20000000
	set	p0_b137,%o7
	fbul,pn	%fcc0,p0_near_0_he	! Branch Taken, %fcc0 = 1
!	%l5 = 0000000000000041, Mem[0000000010800000] = 00000000
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000041
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x089,%g2
p0_b137:
!	Registers modified during the branch to p0_near_0
!	%l0  = fffffffffffe1470
!	%l1  = 0000000000000000
!	%l2  = 0000000000000078
!	%l7  = 00000000604c775f

p0_label_132:
	membar	#Sync			! Added by membar checker (113)
!	Mem[0000000010000000] = b75911b9, %l7 = 00000000604c775f
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000b7
!	%l2 = 0000000000000078, Mem[0000000030800004] = 006b27ba
	stb	%l2,[%o1+0x004]		! Mem[0000000030800004] = 786b27ba
!	Mem[0000000011800060] = c7fd7d24 1095ec30 ffc1b065 39a016ef
	prefetcha [%i3+0x060]%asi,22
!	Mem[0000000011000080] = 56953e07 25888530 e792e7a6 7ca83cc4
	prefetcha [%i2+0x080]%asi,3
	fbue	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_133:
!	Mem[0000000030000041] = 1cffab8f, %l3 = 0000000000047fc1
	ldstub	[%o0+0x041],%l3		! %l3 = 00000000000000ff
p0_b138:
	membar	#Sync			! Added by membar checker (114)
!	%l7 = 00000000000000b7, %l3 = 00000000000000ff, %l5 = 0000000000000041
	xor	%l7,%l3,%l5		! %l5 = 0000000000000048
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000011800000] = 10810000, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 0000000010810000
p0_b139:
	membar	#Sync			! Added by membar checker (115)
	fbe,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_134:
!	%l4 = 00000000fffa8860, Mem[0000000011800008] = 4194d77e4285daf6
	stxa	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = 00000000fffa8860
p0_b140:
	membar	#Sync			! Added by membar checker (116)
!	%f18 = 0a94bcc5 42783361, %f30 = ffc20bdb ffc20bdb
	fmovd	%f18,%f30		! %f30 = 0a94bcc5 42783361
!	%l2 = 00000078, %l3 = 000000ff, Mem[0000000031800048] = 00000000 c1fe4c68
	stda	%l2,[%o3+0x048]%asi	! Mem[0000000031800048] = 00000078 000000ff
!	%l1 = 0000000010810000, %l7 = 00000000000000b7, %y  = ffffffff
	umulcc	%l1,%l7,%l4		! %l4 = 0000000bcc370000, %ccr = 08
!	%l6 = 0000000032c68000, %l5 = 0000000000000048, %l3 = 00000000000000ff
	sll	%l6,%l5,%l3		! %l3 = 00000032c6800000

p0_label_135:
!	Mem[0000000031800048] = 00000078 000000ff, %l4 = cc370000, %l5 = 00000048
	ldda	[%o3+0x048]%asi,%l4	! %l4 = 0000000000000078 00000000000000ff
!	%l4 = 0000000000000078, %l4 = 0000000000000078, %l3 = 00000032c6800000
	sub	%l4,%l4,%l3		! %l3 = 0000000000000000
!	Mem[0000000030800044] = 114e8651, %l2 = 0000000000000078
	lduha	[%o1+0x044]%asi,%l2	! %l2 = 000000000000114e
!	Denormal Floating Point Operation Nullified
	nop
!	Denormal Floating Point Operation Nullified
	nop

p0_label_136:
	nop
!	Mem[0000000010000000] = ff5911b9b4cf6148, %l7 = 00000000000000b7
	ldxa	[%i0+%g0]0x80,%l7	! %l7 = ff5911b9b4cf6148
	fbu,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l3 = 0000000000000000, Mem[0000000010800008] = 00000041
	stwa	%l3,[%i1+%o6]0x80	! Annulled
p0_b141:
	membar	#Sync			! Added by membar checker (117)
!	Mem[0000000011800016] = 8f348ca3, %l3 = 0000000000000000
	ldstub	[%i3+0x016],%l3		! %l3 = 000000000000008c

p0_label_137:
	bne,a	p0_b142			! Branch Taken, %ccr = 08, CWP = 0
!	%l3 = 000000000000008c, Mem[0000000011800008] = 00000000fffa8860
	stxa	%l3,[%i3+%o6]0x80	! Mem[0000000011800008] = 000000000000008c
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x08e,%g2
p0_b142:
	membar	#Sync			! Added by membar checker (118)
!	%l5 = 00000000000000ff, immed = fffff161, %l4 = 0000000000000078
	sub	%l5,-0xe9f,%l4		! %l4 = 0000000000000f9e
!	%l4 = 0000000000000f9e, %l4 = 0000000000000f9e, %y  = 0000000b
	udivcc	%l4,%l4,%l2		! %l2 = 0000000000b4506d, %ccr = 00
!	Mem[0000000010800020] = ad90b1ef ad90be39 08c02fd5 07632b3e
	prefetcha [%i1+0x020]%asi,2

p0_label_138:
	fbge	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003200002c] = 00000000, %l1 = 0000000010810000
	ldsh	[%o4+0x02c],%g2		! %g2 = 0000000000000000
p0_b143:
	membar	#Sync			! Added by membar checker (119)
!	%f16 = 00000000 00000000, %f29 = ffc20bdb
	fdtoi	%f16,%f29		! %f29 = 00000000
!	Mem[0000000012000018] = 06a073b8, %l6 = 0000000032c68000
	lduwa	[%i4+0x018]%asi,%l6	! %l6 = 0000000006a073b8
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00

p0_label_139:
!	Mem[0000000011800008] = 00000000, %l0 = fffffffffffe1470
	swapa	[%i3+%o6]0x80,%l0	! Annulled
p0_b144:
	membar	#Sync			! Added by membar checker (120)
!	Mem[0000000031800048] = 00000078000000ff, %l5 = 00000000000000ff
	ldx	[%o3+0x048],%l5		! %l5 = 00000078000000ff
!	%f29 = 00000000, %f21 = 20000000
	fcmps	%fcc3,%f29,%f21		! %fcc3 = 1
!	Mem[00000000118000c0] = e1748a1b, %l2 = 0000000000b4506d
	swapa	[%i3+0x0c0]%asi,%l2	! %l2 = 00000000e1748a1b
!	%l5 = 00000078000000ff, %l5 = 00000078000000ff, %l0 = fffffffffffe1470
	add	%l5,%l5,%l0		! %l0 = 000000f0000001fe

p0_label_140:
!	%l7 = ff5911b9b4cf6148, %l0 = 000000f0000001fe, %l6 = 0000000006a073b8
	tsubcc	%l7,%l0,%l6		! %l6 = ff5910c9b4cf5f4a, %ccr = 8a
!	%f10 = 0a94bcc5 42783361, %f16 = 00000000 00000000, %f8  = c84f0ef5 ffc20bdb
	faddd	%f10,%f16,%f8 		! %f8  = 0a94bcc5 42783361
!	%l3 = 000000000000008c, immed = 000001e8, %l6 = ff5910c9b4cf5f4a
	andn	%l3,0x1e8,%l6		! %l6 = 0000000000000004
!	%f4  = c84f0ef5 ffc20bdb, %f10 = 0a94bcc5 42783361
	fabsd	%f4 ,%f10		! %f10 = 484f0ef5 ffc20bdb
	bne	p0_b145			! Branch Taken, %ccr = 8a, CWP = 0

p0_label_141:
!	Mem[0000000011000048] = 14edc444522d21db, %l7 = ff5911b9b4cf6148
	ldx	[%i2+0x048],%l7		! %l7 = 14edc444522d21db
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x091,%g2
p0_b145:
	membar	#Sync			! Added by membar checker (121)
	fbg,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010800008] = 00000041, %l4 = 0000000000000f9e
	ldstuba	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
p0_b146:
	membar	#Sync			! Added by membar checker (122)
!	Mem[0000000010000004] = b4cf6148, %l5 = 00000078000000ff
	lduha	[%i0+0x004]%asi,%l5	! %l5 = 000000000000b4cf
!	%l3 = 000000000000008c, %l6 = 0000000000000004, %l5 = 000000000000b4cf
	orn	%l3,%l6,%l5		! %l5 = ffffffffffffffff

p0_label_142:
	bleu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000032000054] = d77e9ece, %l4 = 0000000000000000
	ldub	[%o4+0x056],%g2		! Annulled
p0_b147:
	membar	#Sync			! Added by membar checker (123)
!	%l1 = 0000000010810000, immed = 00000a2c, %l6 = 0000000000000004
	add	%l1,0xa2c,%l6		! %l6 = 0000000010810a2c
!	Mem[0000000031800000] = 39290b36, %l6 = 0000000010810a2c
	ldsb	[%o3+0x001],%l6		! %l6 = 0000000000000029
!	%l2 = 00000000e1748a1b, Mem[0000000010000008] = fffaffff35493e54
	stxa	%l2,[%i0+%o6]0x80	! Mem[0000000010000008] = 00000000e1748a1b

p0_label_143:
!	%l4 = 0000000000000000, %l1 = 0000000010810000, %y  = 0000000b
	sdivcc	%l4,%l1,%l5		! %l5 = 00000000000000aa, %ccr = 00
!	Branch On Register, %l3 = 000000000000008c
	brlez,a,pt %l3,p0_not_taken_0	! Branch Not Taken
!	 Annulled
	ldd	[%i1+0x0f0],%l4
p0_b148:
	membar	#Sync			! Added by membar checker (124)
!	%l2 = 00000000e1748a1b, %l1 = 0000000010810000, %l0 = 000000f0000001fe
	xorcc	%l2,%l1,%l0		! %l0 = 00000000f1f58a1b, %ccr = 08
!	%f4  = c84f0ef5 ffc20bdb, %f22 = 522d03e5 a33e7f9c
	fabsd	%f4 ,%f22		! %f22 = 484f0ef5 ffc20bdb

p0_label_144:
	set	p0_b149,%o7
	fbuge,a,pt %fcc1,p0_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[000000003100000c] = 78fb9bfa, %l6 = 0000000000000029
	ldsb	[%o2+0x00f],%l6		! %l6 = fffffffffffffffa
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x095,%g2
p0_b149:
!	Registers modified during the branch to p0_near_0
!	%l3  = ffffffffffffff55
!	%l4  = 0000000000000136
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (125)
!	%l2 = e1748a1b, %l3 = ffffff55, Mem[0000000011800000] = 10810000 000000ff
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000011800000] = e1748a1b ffffff55
	bne	p0_b150			! Branch Taken, %ccr = 88, CWP = 0
!	%l3 = ffffffffffffff55, Mem[0000000010800008] = ff000041
	stba	%l3,[%i1+%o6]0x80	! Mem[0000000010800008] = 55000041
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x096,%g2
p0_b150:

p0_label_145:
	membar	#Sync			! Added by membar checker (126)
!	Denormal Floating Point Operation Nullified
	nop
!	%l4 = 0000000000000136, %l0 = 00000000f1f58a1b, %l0 = 00000000f1f58a1b
	addc	%l4,%l0,%l0		! %l0 = 00000000f1f58b51
	ble,a	p0_b151			! Branch Taken, %ccr = 88, CWP = 0
!	%l4 = 00000136, %l5 = 000000aa, Mem[0000000010000000] = ff5911b9 b4cf6148
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010000000] = 00000136 000000aa
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x097,%g2
p0_b151:
	membar	#Sync			! Added by membar checker (127)
!	%l0 = f1f58b51, %l1 = 10810000, Mem[0000000011000008] = 2dfb9bfa ffffa3fb
	stda	%l0,[%i2+%o6]0x80	! Mem[0000000011000008] = f1f58b51 10810000

p0_label_146:
!	Branch On Register, %l3 = ffffffffffffff55
	brlz,a,pt %l3,p0_b152		! Branch Taken
!	Mem[0000000013000008] = 00000000, %l0 = 00000000f1f58b51
	ldsba	[%i6+%o6]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x098,%g2
p0_b152:
	membar	#Sync			! Added by membar checker (128)
!	Branch On Register, %l1 = 0000000010810000
	brlez,pt %l1,p0_not_taken_0	! Branch Not Taken
!	%l7 = 0000000000000000, Mem[0000000010800008] = 5500004178fb9bfa
	stxa	%l7,[%i1+%o6]0x80	! Mem[0000000010800008] = 0000000000000000
p0_b153:
	membar	#Sync			! Added by membar checker (129)
!	%f19 = 42783361, %f29 = 00000000, %f28 = c84f0ef5
	fsubs	%f19,%f29,%f28		! %f28 = 42783361

p0_label_147:
!	Mem[0000000013000008] = 00000000, %l5 = 00000000000000aa
	lduha	[%i6+%o6]0x80,%l5	! %l5 = 0000000000000000
!	%l6 = fffffffffffffffa, %l1 = 0000000010810000, %l7 = 0000000000000000
	addcc	%l6,%l1,%l7		! %l7 = 000000001080fffa, %ccr = 11
!	Mem[0000000030800040] = 934bff69 114e8651, %l4 = 00000136, %l5 = 00000000
	ldd	[%o1+0x040],%l4		! %l4 = 00000000934bff69 00000000114e8651
!	%l1 = 0000000010810000, Mem[000000003200003c] = 3ec07eee
	stw	%l1,[%o4+0x03c]		! Mem[000000003200003c] = 10810000
!	Mem[0000000031000008] = ffff8861, %l6 = fffffffffffffffa
	ldsb	[%o2+0x00a],%l6		! %l6 = ffffffffffffff88

p0_label_148:
!	Branch On Register, %l3 = ffffffffffffff55
	brlez,a,pn %l3,p0_b154		! Branch Taken
!	Mem[0000000011800050] = 5d978c5f, %l3 = ffffffffffffff55
	ldsb	[%i3+0x053],%l3		! %l3 = 000000000000005f
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x09a,%g2
p0_b154:
	membar	#Sync			! Added by membar checker (130)
!	%l4 = 00000000934bff69, immed = 00000987, %l3 = 000000000000005f
	taddcc	%l4,0x987,%l3		! %l3 = 00000000934c08f0, %ccr = 0a
!	%l7 = 000000001080fffa, %l0 = 0000000000000000, %l4 = 00000000934bff69
	srl	%l7,%l0,%l4		! %l4 = 000000001080fffa
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_149:
!	%l5 = 00000000114e8651, Mem[0000000030800008] = 67b34320
	stw	%l5,[%o1+0x008]		! Annulled
p0_b155:
	membar	#Sync			! Added by membar checker (131)
!	%f2  = 00000000, %f2  = 00000000, %f19 = 42783361
	fmuls	%f2 ,%f2 ,%f19		! %f19 = 00000000
!	%l6 = ffffffffffffff88, %l4 = 000000001080fffa, %l1 = 0000000010810000
	add	%l6,%l4,%l1		! %l1 = 000000001080ff82
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetcha [%o4+0x040]%asi,16
!	Mem[0000000030000004] = 3000af52, %l1 = 000000001080ff82
	swap	[%o0+0x004],%l1		! %l1 = 000000003000af52

p0_label_150:
!	%f2  = 00000000, %f2  = 00000000
	fstoi	%f2 ,%f2 		! %f2  = 00000000
!	%l4 = 1080fffa, %l5 = 114e8651, Mem[0000000031800048] = 00000078 000000ff
	std	%l4,[%o3+0x048]	! Mem[0000000031800048] = 1080fffa 114e8651
!	%l1 = 000000003000af52, immed = fffff4ab, %l0 = 0000000000000000
	addcc	%l1,-0xb55,%l0		! %l0 = 000000003000a3fd, %ccr = 11
!	%l2 = e1748a1b, %l3 = 934c08f0, Mem[0000000031800040] = ffff8861 fffa8860
	stda	%l2,[%o3+0x040]%asi	! Mem[0000000031800040] = e1748a1b 934c08f0
!	%l7 = 000000001080fffa, %l0 = 000000003000a3fd, %l5 = 00000000114e8651
	xnor	%l7,%l0,%l5		! %l5 = ffffffffdf7fa3f8

p0_label_151:
!	%f4  = c84f0ef5 ffc20bdb, %f4  = c84f0ef5 ffc20bdb, %f10 = 484f0ef5 ffc20bdb
	fdivd	%f4 ,%f4 ,%f10		! %f10 = 3ff00000 00000000
!	%l3 = 00000000934c08f0, immed = fffffad7, %y  = 0000000b
	udiv	%l3,-0x529,%l1		! %l1 = 000000000000000b
!	%l5 = ffffffffdf7fa3f8, immed = 00000937, %l5 = ffffffffdf7fa3f8
	subccc	%l5,0x937,%l5		! %l5 = ffffffffdf7f9ac0, %ccr = 88
!	%l2 = 00000000e1748a1b, %l2 = 00000000e1748a1b, %l6 = ffffffffffffff88
	orcc	%l2,%l2,%l6		! %l6 = 00000000e1748a1b, %ccr = 08
!	%f4  = c84f0ef5, %f20 = 404f066c
	fabss	%f4 ,%f20		! %f20 = 484f0ef5

p0_label_152:
!	Mem[0000000010000008] = 00000000, %l5 = ffffffffdf7f9ac0
	swapa	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000
!	%l2 = e1748a1b, %l3 = 934c08f0, Mem[0000000011800000] = e1748a1b ffffff55
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000011800000] = e1748a1b 934c08f0
	fbe,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000011800080] = c09f6831 57b3ce81 0edfb572 9434a731
	prefetch [%i3+0x080],16	! Annulled
p0_b156:
	membar	#Sync			! Added by membar checker (132)
!	Mem[0000000011800008] = 00000000, %l0 = 000000003000a3fd
	ldsha	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000

p0_label_153:
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000010800000] = 00000041, %l3 = 00000000934c08f0
	lduha	[%i1+%g0]0x80,%l3	! Annulled
p0_b157:
	membar	#Sync			! Added by membar checker (133)
!	%l3 = 00000000934c08f0, %l2 = 00000000e1748a1b, %l5 = 0000000000000000
	andncc	%l3,%l2,%l5		! %l5 = 00000000120800e0, %ccr = 00
!	%l0 = 0000000000000000, immed = 00000cfc, %l2 = 00000000e1748a1b
	tsubcc	%l0,0xcfc,%l2		! %l2 = fffffffffffff304, %ccr = 99
!	%l0 = 0000000000000000, Mem[0000000010800000] = 00000041
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000041

p0_label_154:
!	%l0 = 00000000, %l1 = 0000000b, Mem[0000000010000000] = 00000136 000000aa
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010000000] = 00000000 0000000b
!	Mem[0000000011000074] = 1ffd134a, %l7 = 000000001080fffa
	ldsb	[%i2+0x076],%l7		! %l7 = 0000000000000013
!	%l4 = 1080fffa, %l5 = 120800e0, Mem[0000000010000030] = edd9b0b4 ba887bed
	stda	%l4,[%i0+0x030]%asi	! Mem[0000000010000030] = 1080fffa 120800e0
!	%l4 = 1080fffa, %l5 = 120800e0, Mem[0000000010800000] = 00000041 7ffd7fff
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010800000] = 1080fffa 120800e0
	set	p0_b158,%o7
	fble,pn	%fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 1

p0_label_155:
!	%l3 = 00000000934c08f0, Mem[0000000010000000] = 00000000
	stwa	%l3,[%i0+%g0]0x80	! Mem[0000000010000000] = 934c08f0
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x09e,%g2
p0_b158:
!	Registers modified during the branch to p0_near_1
!	%l0  = 000000000000000d
!	%l3  = 0000000000000000
!	%l4  = 000000000000000c
	membar	#Sync			! Added by membar checker (134)
	set	p0_b159,%o7
	fbo,a,pn %fcc3,p0_near_1_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000011800060] = c7fd7d24, %l5 = 00000000120800e0
	ldsw	[%i3+0x060],%l5		! %l5 = ffffffffc7fd7d24
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x09f,%g2
p0_b159:
!	Registers modified during the branch to p0_near_1
!	%l1  = 0000000000000000
	bne,a	p0_b160			! Branch Taken, %ccr = 99, CWP = 0
!	%l6 = 00000000e1748a1b, Mem[0000000010800008] = 00000000
	stba	%l6,[%i1+%o6]0x80	! Mem[0000000010800008] = 1b000000
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0a0,%g2
p0_b160:

p0_label_156:
	membar	#Sync			! Added by membar checker (135)
!	Mem[0000000012000008] = 41b64570, %l1 = 0000000000000000
	lduba	[%i4+%o6]0x80,%l1	! %l1 = 0000000000000041
	bl	p0_b161			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000010000000] = 934c08f0, %l5 = ffffffffc7fd7d24
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000093
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x0a1,%g2
p0_b161:
	membar	#Sync			! Added by membar checker (136)
!	Mem[0000000031800008] = d7be0d90, %l5 = 0000000000000093
	lduwa	[%o3+0x008]%asi,%l5	! %l5 = 00000000d7be0d90
!	%l3 = 0000000000000000, immed = 00000c95, %l0 = 000000000000000d
	xnorcc	%l3,0xc95,%l0		! %l0 = fffffffffffff36a, %ccr = 88

p0_label_157:
	set	p0_b162,%o7
	fbule	p0_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[000000003100000c] = 78fb9bfa, %l0 = fffffffffffff36a
	ldsh	[%o2+0x00e],%l0		! %l0 = ffffffffffff9bfa
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0a2,%g2
p0_b162:
!	Registers modified during the branch to p0_far_2
!	%l2  = ffffffffffffffff
!	%l3  = 000000000000000c
!	%l6  = 00000000000000ff
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (137)
!	Mem[0000000030800048] = dc93b241, %l3 = 000000000000000c
	lduh	[%o1+0x048],%l3		! %l3 = 000000000000dc93
!	%f26 = 7fc20bdb, %f26 = 7fc20bdb
	fcmpes	%fcc0,%f26,%f26		! %fcc0 = 3
!	%f9  = 42783361, %f16 = 00000000, %f1  = 40f94000
	fadds	%f9 ,%f16,%f1 		! %f1  = 42783361

p0_label_158:
!	%l0 = ffffffffffff9bfa, immed = 0000001b, %l6 = 00000000000000ff
	sllx	%l0,0x01b,%l6		! %l6 = fffffcdfd0000000
	set	p0_b163,%o7
	fbne,a,pt %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 3
!	Mem[0000000011000000] = fffa8860, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000fffa8860
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x0a3,%g2
p0_b163:
!	Registers modified during the branch to p0_near_0
!	%l3  = ffffffff2841f26f
!	%l4  = 00000000d7beea23
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (138)
!	%f1  = 42783361, %f2  = 00000000
	fabss	%f1 ,%f2 		! %f2  = 42783361
!	%f14 = 00000000, %f19 = 00000000
	fitos	%f14,%f19		! %f19 = 00000000

p0_label_159:
	fbge,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000011000000] = 0000000000000000, %l0 = ffffffffffff9bfa
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
p0_b164:
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[000000003000004c] = fff3a65f, %l1 = 0000000000000041
	ldsw	[%o0+0x04c],%l1		! %l1 = fffffffffff3a65f
p0_b165:
	membar	#Sync			! Added by membar checker (139)
!	Branch On Register, %l1 = fffffffffff3a65f
	brlz,a,pt %l1,p0_b166		! Branch Taken

p0_label_160:
!	Mem[0000000010000000] = 934c08f0, %l3 = ffffffff2841f26f
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000093
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0a6,%g2
p0_b166:
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000011800018] = eae7050d, %l7 = 0000000000000000
	ldsh	[%i3+0x01a],%l7		! Annulled
p0_b167:
	membar	#Sync			! Added by membar checker (140)
	fbne,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000030000048] = f53a95b3fff3a65f, %l2 = ffffffffffffffff
	ldx	[%o0+0x048],%l2		! %l2 = f53a95b3fff3a65f
p0_b168:

p0_label_161:
	membar	#Sync			! Added by membar checker (141)
!	%l7 = 0000000000000000, %l1 = fffffffffff3a65f, %l4 = 00000000d7beea23
	orn	%l7,%l1,%l4		! %l4 = 00000000000c59a0
!	%l6 = d0000000, %l7 = 00000000, Mem[00000000100000c0] = c14e0e3d 0c46d85a
	stda	%l6,[%i0+0x0c0]%asi	! Mem[00000000100000c0] = d0000000 00000000
	set	p0_b169,%o7
	fba,a	p0_far_2_le	! Branch Taken, %fcc0 = 3
!	%l4 = 000c59a0, %l5 = d7be0d90, Mem[0000000010000000] = 934c08f0 0000000b
	stda	%l4,[%i0+%g0]0x80	! Annulled
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x0a9,%g2
p0_b169:
!	Registers modified during the branch to p0_far_2
!	%l1  = ffffffffe6b88a74
!	%l3  = 0ac56a4c00000000
!	%l5  = 0000000000000913
	membar	#Sync			! Added by membar checker (142)
!	%f28 = 42783361, %f4  = c84f0ef5 ffc20bdb
	fitod	%f28,%f4 		! %f4  = 41d09e0c d8400000

p0_label_162:
!	%l5 = 0000000000000913, immed = 0000001a, %l6 = fffffcdfd0000000
	srl	%l5,0x01a,%l6		! %l6 = 0000000000000000
	bl	p0_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000011800000] = e1748a1b 934c08f0 00000000 0000008c
	prefetch [%i3+0x000],21
p0_b170:
	membar	#Sync			! Added by membar checker (143)
!	%l5 = 0000000000000913, immed = 00000736, %l2 = f53a95b3fff3a65f
	xor	%l5,0x736,%l2		! %l2 = 0000000000000e25
	set	p0_b171,%o7
	fbul,a,pn %fcc3,p0_near_3_he	! Branch Taken, %fcc3 = 1

p0_label_163:
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 ffffffff f5ab81d0
	prefetch [%o4+0x000],0
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0ab,%g2
p0_b171:
!	Registers modified during the branch to p0_near_3
!	%l1  = 0000000000000000
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (144)
!	%l4 = 00000000000c59a0, %l2 = 0000000000000e25, %y  = 00000000
	smulcc	%l4,%l2,%l7		! %l7 = 00000000aeafb420, %ccr = 08
	set	p0_b172,%o7
	fbuge,a,pt %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 3
!	Mem[0000000011800000] = e1748a1b, %l7 = 00000000aeafb420
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000e1748a1b
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x0ac,%g2
p0_b172:
!	Registers modified during the branch to p0_near_0
!	%l3  = ffffffffffffffff
!	%l4  = 0ac56a4c00000000
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (145)
!	%f30 = 0a94bcc5 42783361, %f8  = 0a94bcc5 42783361
	fabsd	%f30,%f8 		! %f8  = 0a94bcc5 42783361

p0_label_164:
!	%l2 = 0000000000000e25, immed = fffff6ec, %y  = 00000000
	umul	%l2,-0x914,%l1		! %l1 = 00000e24ff7f981c
!	Branch On Register, %l7 = 0000000000000000
	brnz,pt	%l7,p0_not_taken_0	! Branch Not Taken
!	Mem[00000000118000bc] = 00000000, %l3 = ffffffffffffffff
	ldsw	[%i3+0x0bc],%l3		! %l3 = 0000000000000000
p0_b173:
	membar	#Sync			! Added by membar checker (146)
!	Branch On Register, %l5 = 0000000000000000
	brlez,pn %l5,p0_b174		! Branch Taken
!	Mem[000000001180000a] = 00000000, %l1 = 00000e24ff7f981c
	ldstub	[%i3+0x00a],%l1		! %l1 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0ae,%g2
p0_b174:

p0_label_165:
	membar	#Sync			! Added by membar checker (147)
!	%l5 = 0000000000000000, %l4 = 0ac56a4c00000000, %y  = 00000e24
	smulcc	%l5,%l4,%l5		! %l5 = 0000000000000000, %ccr = 44
!	Mem[0000000011000000] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
	fbe,a,pt %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	 Annulled
	ldda	[%i3+%o6]0x80,%l0
p0_b175:
	membar	#Sync			! Added by membar checker (148)
!	Mem[0000000011000038] = df00c0ae, %l7 = 0000000000000000
	lduba	[%i2+0x039]%asi,%l7	! %l7 = 0000000000000000

p0_label_166:
!	%l2 = 0000000000000e25, immed = 00000afe, %y  = 00000000
	udivx	%l2,0xafe,%l0		! %l0 = 0000000000000001
!	%f1  = 42783361, %f8  = 0a94bcc5 42783361
	fitod	%f1 ,%f8 		! %f8  = 41d09e0c d8400000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010000008] = df7f9ac0 e1748a1b
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000010000008] = 00000000 00000000
!	%l2 = 0000000000000e25, Mem[0000000010000000] = 934c08f0
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010000000] = 00000e25
!	%l1 = 0000000000000000, immed = 00000562, %l0 = 0000000000000001
	subccc	%l1,0x562,%l0		! %l0 = fffffffffffffa9e, %ccr = 99

p0_label_167:
!	Branch On Register, %l7 = 0000000000000000
	brlez,pn %l7,p0_b176		! Branch Taken
!	Mem[0000000010800008] = 1b000000, %l0 = fffffffffffffa9e
	lduwa	[%i1+%o6]0x80,%l0	! %l0 = 000000001b000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0b0,%g2
p0_b176:
	membar	#Sync			! Added by membar checker (149)
!	Mem[0000000011000020] = c52d121e 9cdee2a4 dd88fc08 661e60cb
	prefetcha [%i2+0x020]%asi,16
	set	p0_b177,%o7
	fbne,a	p0_far_2_le	! Branch Taken, %fcc0 = 3
!	Mem[0000000010800008] = 1b000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o6]0x80,%l5	! %l5 = 000000000000001b
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0b1,%g2
p0_b177:
!	Registers modified during the branch to p0_far_2
!	%l1  = 0000000000000000
!	%l3  = f53a95b3fffff1da
!	%l5  = 000000001b000913

p0_label_168:
	set	p0_b178,%o7
	fbu,a	p0_far_3_he	! Branch Taken, %fcc0 = 3
!	%l2 = 0000000000000e25, Mem[0000000011800064] = 1095ec30
	stw	%l2,[%i3+0x064]		! Mem[0000000011800064] = 00000e25
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0b2,%g2
p0_b178:
!	Registers modified during the branch to p0_far_3
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (150)
!	Mem[00000000118000fc] = 000000ff, %l4 = 0ac56a4c00000000
	ldsh	[%i3+0x0fc],%l4		! %l4 = 0000000000000000
!	%l6 = 0000000000000000, %l7 = 0000000000000000, %l3 = f53a95b3fffff1da
	srl	%l6,%l7,%l3		! %l3 = 0000000000000000
!	%l3 = 0000000000000000, %l4 = 0000000000000000, %l6 = 0000000000000000
	andncc	%l3,%l4,%l6		! %l6 = 0000000000000000, %ccr = 44

p0_label_169:
	fble	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3
!	%l1 = 0000000000000000, Mem[0000000010800054] = d913359f
	stw	%l1,[%i1+0x054]		! Mem[0000000010800054] = 00000000
p0_b179:
	membar	#Sync			! Added by membar checker (151)
!	%f4  = 41d09e0c d8400000, %f0  = 0000002b 42783361
	fdtox	%f4 ,%f0 		! %f0  = 00000000 42783361
!	%f17 = 00000000, %f6  = ffc20bdb 3ff59ba0
	fstox	%f17,%f6 		! %f6  = 00000000 00000000
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3

p0_label_170:
!	Mem[0000000011000098] = 7506de4b, %l5 = 0000000000000000
	ldsh	[%i2+0x098],%l5		! Annulled
p0_b180:
	membar	#Sync			! Added by membar checker (152)
!	Mem[00000000108000c0] = 37002b6e 1650a75d 1ea758a0 52ba4f23
	prefetch [%i1+0x0c0],0
	set	p0_b181,%o7
	fbu,a,pt %fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 3
!	Mem[0000000011800000] = aeafb420934c08f0, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = aeafb420934c08f0
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0b5,%g2
p0_b181:
!	Registers modified during the branch to p0_near_3
!	%l1  = 0000017de7000000
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (153)
!	Mem[0000000011800028] = dcf43600a6f07569, %l1 = 0000017de7000000
	ldxa	[%i3+0x028]%asi,%l1	! %l1 = dcf43600a6f07569

p0_label_171:
!	%l4 = 0000000000000000, Mem[0000000011800008] = 0000ff000000008c
	stxa	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = 0000000000000000
	bne,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	 Annulled
	ldd	[%i3+0x0b0],%l0
p0_b182:
	membar	#Sync			! Added by membar checker (154)
!	%f4  = 41d09e0c d8400000, %f28 = 42783361 00000000, %f28 = 42783361 00000000
	faddd	%f4 ,%f28,%f28		! %f28 = 42783788 83361000
!	%l6 = 0000000000000000, %l7 = 0000000000000000, %l1 = dcf43600a6f07569
	subc	%l6,%l7,%l1		! %l1 = 0000000000000000

p0_label_172:
!	Mem[0000000031800048] = 1080fffa, %l0 = 000000001b000000
	ldsh	[%o3+0x048],%l0		! %l0 = 0000000000001080
	bne	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010800000] = 1080fffa 120800e0
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000000 00000000
p0_b183:
	bge,a	p0_b184			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[00000000100000a0] = 84fd2903 000004bd c376e82b cb5d8158
	prefetch [%i0+0x0a0],20
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0b8,%g2
p0_b184:

p0_label_173:
	membar	#Sync			! Added by membar checker (155)
	fbg,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000010800060] = a815f184, %l4 = 0000000000000000
	lduh	[%i1+0x062],%l4		! Annulled
p0_b185:
!	call to call_0, CWP = 0
	call	p0_call_0_le
!	%l2 = 0000000000000e25, Mem[0000000011800008] = 00000000
	stwa	%l2,[%i3+%o6]0x80	! Mem[0000000011800008] = 00000e25
!	Registers modified during the branch to p0_call_0
!	%l2  = 000000000000003a
	membar	#Sync			! Added by membar checker (156)
!	Mem[0000000011000008] = f1f58b51, %l2 = 000000000000003a
	lduba	[%i2+%o6]0x80,%l2	! %l2 = 00000000000000f1

p0_label_174:
!	Mem[0000000032000020] = 5d456367 46314fb7 00000000 00000000
	prefetcha [%o4+0x020]%asi,1
	fblg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000011800020] = 39d163a7 cc7ef476 dcf43600 a6f07569
	prefetch [%i3+0x020],20	! Annulled
p0_b186:
	membar	#Sync			! Added by membar checker (157)
!	%l0 = 0000000000001080, Mem[000000003080000c] = 024b4bbf
	stwa	%l0,[%o1+0x00c]%asi	! Mem[000000003080000c] = 00001080
!	Mem[0000000010800044] = 65e32feb, %l7 = 0000000000000000
	ldsb	[%i1+0x045],%l7		! %l7 = ffffffffffffffe3

p0_label_175:
	set	p0_b187,%o7
	fba,a,pt %fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 3
!	%l7 = ffffffffffffffe3, Mem[0000000010000016] = 7681715c
	stb	%l7,[%i0+0x016]		! Annulled
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x0bb,%g2
p0_b187:
!	Registers modified during the branch to p0_near_3
!	%l1  = 00000000000f8880
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (158)
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000011800008] = 00000e25 00000000
	stda	%l4,[%i3+%o6]0x80	! Mem[0000000011800008] = 00000000 00000000
!	Mem[0000000030800000] = 00000000 00000000, %l5 = 0000000000000000, %l3 = 0000000000000000
	casxa	[%o1]0x80,%l5,%l3	! %l3 = 77b3daf9786b27ba
!	%f10 = 3ff00000 00000000, %f22 = 484f0ef5
	fdtos	%f10,%f22		! %f22 = 3f800000

p0_label_176:
!	%f13 = 00000000, %f4  = 41d09e0c
	fmovs	%f13,%f4 		! %f4  = 00000000
!	%l4 = 0000000000000000, immed = 00000019, %l6 = 0000000000000000
	srl	%l4,0x019,%l6		! %l6 = 0000000000000000
!	%l5 = 0000000000000000, immed = fffff109, %y  = 00000000
	umulcc	%l5,-0xef7,%l7		! %l7 = 0000000000000000, %ccr = 44
!	%f18 = 0a94bcc5, %f30 = 0a94bcc5, %f12 = 235102fa
	fdivs	%f18,%f30,%f12		! %f12 = 3f800000
!	%l0 = 00001080, %l1 = 000f8880, Mem[0000000010000008] = 00000000 00000000
	stda	%l0,[%i0+%o6]0x80	! Mem[0000000010000008] = 00001080 000f8880

p0_label_177:
!	%l2 = 00000000000000f1, %l2 = 00000000000000f1, %l2 = 00000000000000f1
	add	%l2,%l2,%l2		! %l2 = 00000000000001e2
!	%l4 = 0000000000000000, immed = fffff0bd, %l5 = 0000000000000000
	sub	%l4,-0xf43,%l5		! %l5 = 0000000000000f43
!	%l7 = 0000000000000000
	setx	0xa17578b6a17578b6,%g7,%l7 ! %l7 = a17578b6a17578b6
	set	p0_b188,%o7
	fbne,a	p0_far_1_le	! Branch Taken, %fcc0 = 3
!	Mem[0000000010800000] = 0000000000000000, %l3 = 77b3daf9786b27ba
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0bc,%g2
p0_b188:
!	Registers modified during the branch to p0_far_1
!	%l0  = 0000000000000000
!	%l1  = ffffffffffffdaf6
!	%l3  = 69b83a2982bdc505
!	%l4  = 0000000000000f43

p0_label_178:
	bneg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000010000008] = 00001080, %l4 = 0000000000000f43
	ldstuba	[%i0+%o6]0x80,%l4	! Annulled
p0_b189:
	membar	#Sync			! Added by membar checker (159)
!	Mem[0000000030000000] = 00ffb120, %l5 = 0000000000000f43
	lduh	[%o0+0x000],%l5		! %l5 = 00000000000000ff
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l7 = a17578b6a17578b6, Mem[0000000011000000] = 00000000
	stba	%l7,[%i2+%g0]0x80	! Annulled
p0_b190:

p0_label_179:
	membar	#Sync			! Added by membar checker (160)
!	%f13 = 00000000, %f25 = 40f94000, %f31 = 42783361
	fdivs	%f13,%f25,%f31		! %f31 = 00000000
	set	p0_b191,%o7
	fbule,a,pn %fcc0,p0_near_0_le	! Branch Taken, %fcc0 = 3
!	Mem[000000003200002c] = 000000a4, %l7 = a17578b6a17578b6
	ldsb	[%o4+0x02d],%g2		! %g2 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0bf,%g2
p0_b191:
!	Registers modified during the branch to p0_near_0
!	%l3  = fffffffffffffff6
!	%l4  = 69b83a2982bdc604
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (161)
!	Mem[000000003080004c] = 78fb9bfa, %l5 = 00000000000000ff
	lduw	[%o1+0x04c],%l5		! %l5 = 0000000078fb9bfa
!	%l0 = 0000000000000000, Mem[00000000100000fc] = 66317e28
	stwa	%l0,[%i0+0x0fc]%asi	! Mem[00000000100000fc] = 00000000

p0_label_180:
!	%l2 = 00000000000001e2, %l6 = 0000000000000000, %l4 = 69b83a2982bdc604
	and	%l2,%l6,%l4		! %l4 = 0000000000000000
!	%l3 = fffffffffffffff6, immed = 0000016c, %y  = 00000000
	sdiv	%l3,0x16c,%l5		! %l5 = 0000000000b40b40
!	%f16 = 00000000 00000000, %f20 = 484f0ef5 20000000
	fdtox	%f16,%f20		! %f20 = 00000000 00000000
!	%l0 = 0000000000000000, immed = fffff027, %l7 = 0000000000000000
	xor	%l0,-0xfd9,%l7		! %l7 = fffffffffffff027
	fble,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3

p0_label_181:
!	Mem[0000000011000000] = 00000000, %l1 = ffffffffffffdaf6
	lduba	[%i2+%g0]0x80,%l1	! Annulled
p0_b192:
	membar	#Sync			! Added by membar checker (162)
!	%f25 = 40f94000, %f12 = 3f800000, %f5  = d8400000
	fdivs	%f25,%f12,%f5 		! %f5  = 40f94000
	bne	p0_b193			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000030000008] = 5707ff11 4285daf6, %l2 = 000001e2, %l3 = fffffff6
	ldd	[%o0+0x008],%l2		! %l2 = 000000005707ff11 000000004285daf6
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x0c1,%g2
p0_b193:
	membar	#Sync			! Added by membar checker (163)
	set	p0_b194,%o7
	fble,pt	%fcc3,p0_near_1_he	! Branch Taken, %fcc3 = 1

p0_label_182:
!	Mem[00000000100000e0] = eccad8bf 4434fd7c 000000ee 2d44cc48
	prefetch [%i0+0x0e0],23
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0c2,%g2
p0_b194:
!	Registers modified during the branch to p0_near_1
!	%l0  = ffffffffffa9fa13
!	%l3  = 0000000000000fff
!	%l4  = ffffffffffa9fa13
	membar	#Sync			! Added by membar checker (164)
!	%l6 = 0000000000000000, immed = fffffb09, %l4 = ffffffffffa9fa13
	xor	%l6,-0x4f7,%l4		! %l4 = fffffffffffffb09
!	%l6 = 0000000000000000, immed = 00000442, %l7 = fffffffffffff027
	xnorcc	%l6,0x442,%l7		! %l7 = fffffffffffffbbd, %ccr = 88
	bpos	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[00000000108000c0] = 37002b6e 1650a75d 1ea758a0 52ba4f23
	prefetch [%i1+0x0c0],16
p0_b195:

p0_label_183:
	bg	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[00000000118000d4] = eae6a8e3, %l0 = ffffffffffa9fa13
	ldsw	[%i3+0x0d4],%l0		! %l0 = ffffffffeae6a8e3
p0_b196:
	membar	#Sync			! Added by membar checker (165)
!	%l3 = 0000000000000fff, Mem[0000000031000040] = 000009674194d77e
	stx	%l3,[%o2+0x040]		! Mem[0000000031000040] = 0000000000000fff
!	Mem[0000000032000048] = 8e1c8c7e, %l1 = ffffffffffffdaf6
	lduha	[%o4+0x048]%asi,%g2	! %g2 = 0000000000008e1c
	set	p0_b197,%o7
	fbne,a	p0_far_2_he	! Branch Taken, %fcc0 = 3

p0_label_184:
!	%l3 = 0000000000000fff, Mem[0000000010800000] = 0000000000000000
	stxa	%l3,[%i1+%g0]0x80	! Mem[0000000010800000] = 0000000000000fff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0c5,%g2
p0_b197:
!	Registers modified during the branch to p0_far_2
!	%l2  = fffffffffffffbe3
!	%l3  = fffffffffffffb00
!	%l6  = 00000000000000ff
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (166)
!	Mem[0000000010800040] = 2a6e5c1f 65e32feb 70d731fd bbfa77e6
	prefetch [%i1+0x040],0
!	Mem[0000000010000000] = 00000e25, %l2 = fffffffffffffbe3
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000e25
!	Mem[0000000010800020] = ad90b1ef ad90be39 08c02fd5 07632b3e
	prefetcha [%i1+0x020]%asi,4
	fbu,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1

p0_label_185:
!	%l0 = ffffffffeae6a8e3, Mem[0000000032000048] = 8e1c8c7e1df58c8b
	stx	%l0,[%o4+0x048]		! Annulled
p0_b198:
	membar	#Sync			! Added by membar checker (167)
!	%f10 = 3ff00000 00000000, %f6  = 00000000 00000000
	fdtox	%f10,%f6 		! %f6  = 00000000 00000001
!	Mem[0000000011800040] = e9485e13, %l7 = 0000000000000000
	ldsw	[%i3+0x040],%l7		! %l7 = ffffffffe9485e13
!	%f2  = 42783361 7fc20bdb, %f12 = 3f800000 00000000, %f12 = 3f800000 00000000
	faddd	%f2 ,%f12,%f12		! %f12 = 42783361 7fc20bfb
!	%l7 = ffffffffe9485e13, Mem[0000000010000000] = 00000e25
	stba	%l7,[%i0+%g0]0x80	! Mem[0000000010000000] = 13000e25

p0_label_186:
	bvc	p0_b199			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000032000054] = 94d77e9e, %l6 = 00000000000000ff
	ldub	[%o4+0x055],%g2		! %g2 = 0000000000000094
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0c7,%g2
p0_b199:
	membar	#Sync			! Added by membar checker (168)
!	%f9  = d8400000, %f0  = 00000000, %f19 = 00000000
	fsubs	%f9 ,%f0 ,%f19		! %f19 = d8400000
!	Mem[0000000010000008] = 00001080, %l2 = 0000000000000e25
	ldsha	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000
!	%f14 = 00000000, %f14 = 00000000, %f30 = 0a94bcc5
	fmuls	%f14,%f14,%f30		! %f30 = 00000000

p0_label_187:
!	%l5 = 0000000000b40b40, %l3 = fffffffffffffb00, %y  = 00000000
	umul	%l5,%l3,%l1		! %l1 = 00b40b3c7bc7c000
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001180001c] = 3e04b9cc, %l5 = 0000000000b40b40
	ldub	[%i3+0x01e],%l5		! %l5 = 00000000000000b9
p0_b200:
	membar	#Sync			! Added by membar checker (169)
!	Mem[0000000010800008] = ff000000, %l4 = fffffffffffffb09
	lduha	[%i1+%o6]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010000080] = 53884cd6 fa161430
	flush	%i0+0x080

p0_label_188:
!	%l2 = 00000000, %l3 = fffffb00, Mem[0000000011000058] = ca677cb6 5e6608ee
	stda	%l2,[%i2+0x058]%asi	! Mem[0000000011000058] = 00000000 fffffb00
	bg	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l1 = 00b40b3c7bc7c000, Mem[0000000031800048] = 1080fffa
	stw	%l1,[%o3+0x048]		! Mem[0000000031800048] = 7bc7c000
p0_b201:
	membar	#Sync			! Added by membar checker (170)
!	%l1 = 00b40b3c7bc7c000, Mem[000000003100000c] = 78fb9bfa
	stwa	%l1,[%o2+0x00c]%asi	! Mem[000000003100000c] = 7bc7c000
!	%f24 = 8000002b 40f94000, %f16 = 00000000 00000000
	fnegd	%f24,%f16		! %f16 = 0000002b 40f94000

p0_label_189:
!	%l2 = 0000000000000000, %l6 = 00000000000000ff, %l0 = ffffffffeae6a8e3
	addcc	%l2,%l6,%l0		! %l0 = 00000000000000ff, %ccr = 00
!	Mem[00000000118000a0] = 555555ff 00000000, %l4 = 0000ff00, %l5 = 000000b9
	ldd	[%i3+0x0a0],%l4		! %l4 = 00000000555555ff 0000000000000000
!	%l2 = 0000000000000000, %l0 = 00000000000000ff, %l5 = 0000000000000000
	addcc	%l2,%l0,%l5		! %l5 = 00000000000000ff, %ccr = 00
!	Mem[0000000031000045] = 00000fff, %l7 = ffffffffe9485e13
	ldstuba	[%o2+0x045]%asi,%l7	! %l7 = 0000000000000000
!	%f30 = 00000000 00000000, %f7  = 00000001
	fdtoi	%f30,%f7 		! %f7  = 00000000

p0_label_190:
	fblg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000011800020] = 39d163a7, %l3 = fffffffffffffb00
	ldsb	[%i3+0x020],%l3		! Annulled
p0_b202:
	set	p0_b203,%o7
	fbu,a	p0_far_1_le	! Branch Taken, %fcc0 = 3
!	Mem[0000000032000020] = 5d456367 46314fb7 00000000 00000000
	prefetch [%o4+0x020],22
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p0_branch_failed
	mov	0x0cb,%g2
p0_b203:
!	Registers modified during the branch to p0_far_1
!	%l0  = 00000000555555ff
!	%l1  = ffffffffffffdaf6
!	%l3  = 69b83a2982bdc505
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (171)
!	Mem[0000000010800000] = 00000000, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_191:
	set	p0_b204,%o7
	fbl,pt	%fcc3,p0_near_2_le	! Branch Taken, %fcc3 = 1
!	Mem[000000003200006c] = 231abf0b, %l4 = 0000000000000000
	ldsh	[%o4+0x06e],%g2		! %g2 = 000000000000231a
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p0_branch_failed
	mov	0x0cc,%g2
p0_b204:
!	Registers modified during the branch to p0_near_2
!	%l3  = 0000000055555500
!	%l6  = 0000000000000000
	bpos	p0_b205			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000128000e0] = 6283e35c 74e43ec0 803fb59c fd1ab76e
	prefetch [%i5+0x0e0],20
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p0_branch_failed
	mov	0x0cd,%g2
p0_b205:
	membar	#Sync			! Added by membar checker (172)
!	Mem[0000000030800004] = 786b27ba, %l5 = 00000000000000ff
	ldsw	[%o1+0x004],%l5		! %l5 = 00000000786b27ba

p0_label_192:
!	%l1 = ffffffffffffdaf6, immed = 00000b7d, %l1 = ffffffffffffdaf6
	or	%l1,0xb7d,%l1		! %l1 = ffffffffffffdbff
!	%l1 = ffffffffffffdbff
	sethi	%hi(0x60ef6800),%l1	! %l1 = 0000000060ef6800
	bne	p0_b206			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000110000c4] = ba8cc8e8, %l4 = 0000000000000000
	ldsw	[%i2+0x0c4],%l4		! %l4 = ffffffffba8cc8e8
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p0_branch_failed
	mov	0x0ce,%g2
p0_b206:
!	call to call_1, CWP = 0
	call	p0_call_1_he

p0_label_193:
!	%l1 = 0000000060ef6800, Mem[0000000010800000] = 0000000000000fff
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000010800000] = 0000000060ef6800
!	Registers modified during the branch to p0_call_1
!	%l4  = 00aaaaaa00000000
	fbl,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 3
!	%l4 = 00aaaaaa00000000, Mem[0000000011000000] = 00000000
	stba	%l4,[%i2+%g0]0x80	! Annulled
p0_b207:
	membar	#Sync			! Added by membar checker (173)
!	Denormal Floating Point Operation Nullified
	nop
!	%l7 = 0000000000000000, %l0 = 00000000555555ff, %y  = 00b40b3c
	mulx	%l7,%l0,%l4		! %l4 = 0000000000000000

p0_label_194:
!	Mem[0000000030000000] = 00ffb120, %l6 = 0000000000000000
	ldub	[%o0+0x000],%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[000000003180004a] = 7bc7c000
	stba	%l6,[%o3+0x04a]%asi	! Mem[0000000031800048] = 7bc70000
!	%f8  = 41d09e0c d8400000, %f18 = 0a94bcc5 d8400000
	fdtox	%f8 ,%f18		! %f18 = 00000000 42783361
!	Mem[0000000010800008] = ff000000, %l5 = 00000000786b27ba
	lduha	[%i1+%o6]0x80,%l5	! %l5 = 000000000000ff00
!	%l0 = 00000000555555ff, immed = fffff875, %l1 = 0000000060ef6800
	orcc	%l0,-0x78b,%l1		! %l1 = fffffffffffffdff, %ccr = 88

p0_label_195:
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000031000004] = 3403f777, %l7 = 0000000000000000
	lduw	[%o2+0x004],%l7		! Annulled
p0_b208:
	membar	#Sync			! Added by membar checker (174)
!	%l7 = 0000000000000000, %l0 = 00000000555555ff, %l0 = 00000000555555ff
	sra	%l7,%l0,%l0		! %l0 = 0000000000000000
	fbue,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	 Annulled
	ldd	[%i1+0x048],%l4
p0_b209:

p0_label_196:
	membar	#Sync			! Added by membar checker (175)
!	%l1 = fffffffffffffdff, %l1 = fffffffffffffdff, %l2 = 0000000000000000
	addcc	%l1,%l1,%l2		! %l2 = fffffffffffffbfe, %ccr = 99
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[0000000032000058] = 74fd27ff, %l6 = 0000000000000000
	ldsb	[%o4+0x05b],%g2		! Annulled
p0_b210:
	membar	#Sync			! Added by membar checker (176)
!	%f14 = 00000000 00000002, %f28 = 42783788
	fxtos	%f14,%f28		! %f28 = 40000000
!	%l3 = 0000000055555500, Mem[0000000031000000] = 001c36383403f777
	stx	%l3,[%o2+0x000]		! Mem[0000000031000000] = 0000000055555500

p0_label_197:
	bgu	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[00000000100000f8] = 1144898d, %l5 = 000000000000ff00
	lduh	[%i0+0x0fa],%l5		! %l5 = 000000000000898d
p0_b211:
	membar	#Sync			! Added by membar checker (177)
!	%f4  = 00000000 40f94000, %f6  = 00000000 00000000
	fmovd	%f4 ,%f6 		! %f6  = 00000000 40f94000
!	%l4 = 0000000000000000, Mem[0000000011000000] = 00000000
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000011000000] = 00000000
!	Mem[000000003180000c] = 6ad840af, %l3 = 0000000055555500
	ldsba	[%o3+0x00f]%asi,%l3	! %l3 = ffffffffffffffaf

p0_label_198:
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[0000000011000008] = f1f58b51, %l4 = 0000000000000000
	swapa	[%i2+%o6]0x80,%l4	! Annulled
p0_b212:
	membar	#Sync			! Added by membar checker (178)
!	Mem[0000000010800040] = 2a6e5c1f 65e32feb 70d731fd bbfa77e6
	prefetch [%i1+0x040],4
!	%l1 = fffffffffffffdff, Mem[0000000010000000] = 13000e250000000b
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = fffffffffffffdff
	set	p0_b213,%o7
	fbule	p0_far_1_le	! Branch Taken, %fcc0 = 3

p0_label_199:
!	%l0 = 0000000000000000, Mem[00000000100000a5] = 000004bd
	stb	%l0,[%i0+0x0a5]		! Mem[00000000100000a4] = 000004bd
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p0_branch_failed
	mov	0x0d5,%g2
p0_b213:
!	Registers modified during the branch to p0_far_1
!	%l0  = 0000000000000000
!	%l1  = ffffffffffffdaf6
!	%l3  = 69b83a2982bdc505
!	%l4  = 000000000000898d
	membar	#Sync			! Added by membar checker (179)
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030800000] = 77b3daf9 786b27ba
	stda	%l6,[%o1+0x000]%asi	! Mem[0000000030800000] = 00000000 00000000
	bl,a	p0_b214			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000010800000] = 00000000, %l4 = 000000000000898d
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p0_branch_failed
	mov	0x0d6,%g2
p0_b214:
	membar	#Sync			! Added by membar checker (180)
!	Mem[0000000010000008] = 00001080 000f8880, %l2 = fffffbfe, %l3 = 82bdc505
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 0000000000001080 00000000000f8880

p0_label_200:
!	%l0 = 0000000000000000, %l6 = 0000000000000000, %l6 = 0000000000000000
	orcc	%l0,%l6,%l6		! %l6 = 0000000000000000, %ccr = 44
!	%f18 = 00000000, %f9  = d8400000, %f19 = 42783361
	fmuls	%f18,%f9 ,%f19		! %f19 = 80000000
!	%l3 = 00000000000f8880, Mem[0000000030800006] = 00000000
	sth	%l3,[%o1+0x006]		! Mem[0000000030800004] = 00008880
!	%l0 = 0000000000000000, %l3 = 00000000000f8880, %l0 = 0000000000000000
	addcc	%l0,%l3,%l0		! %l0 = 00000000000f8880, %ccr = 00
!	Mem[00000000108000e0] = 4cd4ff5e a4bcff04 6a181252 cd9bfd59
	prefetch [%i1+0x0e0],1

!	End of Random Code for Processor 0

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x000]		! Set processor 0 done flag

!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000000f8880
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffffffdaf6
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000001080
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000f8880
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000000000898d
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00b40b3c,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 42783361
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 42783361 7fc20bdb
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 40f94000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 40f94000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 41d09e0c d8400000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 3ff00000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 42783361 7fc20bfb
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000002
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 0000002b 40f94000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 80000000
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
	cmp	%l0,%l1			! %f22 should be 3f800000 ffc20bdb
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 8000002b 40f94000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 7fc20bdb 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 40000000 83361000
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
	ldx	[%g1+0x000],%g2		! Expect data = fffffffffffffdff
	ldx	[%i0+0x000],%g3		! Observed data at 0000000010000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 00001080000f8880
	ldx	[%i0+0x008],%g3		! Observed data at 0000000010000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 000000004194d77e
	ldx	[%i0+0x020],%g3		! Observed data at 0000000010000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 1080fffa120800e0
	ldx	[%i0+0x030],%g3		! Observed data at 0000000010000030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 000000000aa2584c
	ldx	[%i0+0x048],%g3		! Observed data at 0000000010000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x058],%g2		! Expect data = ffba3c25739d53dd
	ldx	[%i0+0x058],%g3		! Observed data at 0000000010000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x060],%g2		! Expect data = ffffffff0000f4ef
	ldx	[%i0+0x060],%g3		! Observed data at 0000000010000060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 84fd2903000004bd
	ldx	[%i0+0x0a0],%g3		! Observed data at 00000000100000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = d000000000000000
	ldx	[%i0+0x0c0],%g3		! Observed data at 00000000100000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 2f2d886145f6a47f
	ldx	[%i0+0x0d0],%g3		! Observed data at 00000000100000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 45e0d7b57d5c7658
	ldx	[%i0+0x0d8],%g3		! Observed data at 00000000100000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 000000ee2d44cc48
	ldx	[%i0+0x0e8],%g3		! Observed data at 00000000100000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 1144898d00000000
	ldx	[%i0+0x0f8],%g3		! Observed data at 00000000100000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000060ef6800
	ldx	[%i1+0x000],%g3		! Observed data at 0000000010800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff00000000000000
	ldx	[%i1+0x008],%g3		! Observed data at 0000000010800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 2a5f79ff52720c4d
	ldx	[%i1+0x010],%g3		! Observed data at 0000000010800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x020],%g2		! Expect data = ad90b1efad90be39
	ldx	[%i1+0x020],%g3		! Observed data at 0000000010800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 0c0aa23f00000000
	ldx	[%i1+0x050],%g3		! Observed data at 0000000010800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x078],%g2		! Expect data = c1fe3de0b4cf6148
	ldx	[%i1+0x078],%g3		! Observed data at 0000000010800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 00000000fffff1e5
	ldx	[%i1+0x090],%g3		! Observed data at 0000000010800090
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 000febdaa063e835
	ldx	[%i1+0x0d0],%g3		! Observed data at 00000000108000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 4cd4ff5ea4bcff04
	ldx	[%i1+0x0e0],%g3		! Observed data at 00000000108000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e0,%g4

	set	p0_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000000000000
	ldx	[%i2+0x000],%g3		! Observed data at 0000000011000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = f1f58b5110810000
	ldx	[%i2+0x008],%g3		! Observed data at 0000000011000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 4fd489d541e506ff
	ldx	[%i2+0x010],%g3		! Observed data at 0000000011000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 00000000fffffb00
	ldx	[%i2+0x058],%g3		! Observed data at 0000000011000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x068],%g2		! Expect data = af1b7190002ea8d6
	ldx	[%i2+0x068],%g3		! Observed data at 0000000011000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 0000000000000001
	ldx	[%i2+0x078],%g3		! Observed data at 0000000011000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 00000000b8d7c61e
	ldx	[%i2+0x0a0],%g3		! Observed data at 00000000110000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 32c60000c120dd72
	ldx	[%i2+0x0e8],%g3		! Observed data at 00000000110000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = aeafb420934c08f0
	ldx	[%i3+0x000],%g3		! Observed data at 0000000011800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x008],%g3		! Observed data at 0000000011800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 95e5cfe88f34ffa3
	ldx	[%i3+0x010],%g3		! Observed data at 0000000011800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 7d5c81c1a87d426c
	ldx	[%i3+0x030],%g3		! Observed data at 0000000011800030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x038],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x038],%g3		! Observed data at 0000000011800038
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x060],%g3		! Observed data at 0000000011800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x068],%g2		! Expect data = ffc1b06539a016ef
	ldx	[%i3+0x068],%g3		! Observed data at 0000000011800068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x070],%g2		! Expect data = ffffffffffffffff
	ldx	[%i3+0x070],%g3		! Observed data at 0000000011800070
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 555555ff00000000
	ldx	[%i3+0x0a0],%g3		! Observed data at 00000000118000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = f426cc8b00000000
	ldx	[%i3+0x0b8],%g3		! Observed data at 00000000118000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 00b4506dce4fa829
	ldx	[%i3+0x0c0],%g3		! Observed data at 00000000118000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 00000000000000ff
	ldx	[%i3+0x0f8],%g3		! Observed data at 00000000118000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000ff94d2b4
	ldx	[%i4+0x000],%g3		! Observed data at 0000000012000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4

	set	p0_local5_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 69716a72ffe464dd
	ldx	[%i5+0x008],%g3		! Observed data at 0000000012800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4

	set	p0_local6_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000000000
	ldx	[%i6+0x008],%g3		! Observed data at 0000000013000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p0_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p0_memcheck_share0:
	ldx	[%g4+0x00],%g2	! Expected value = 00ffb1201080ff82
	ldx	[%o0+0x00],%g3	! Read value at Mem[0000000030000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 5707ff114285daf6
	ldx	[%o0+0x08],%g3	! Read value at Mem[0000000030000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 1cffab8f879eb436
	ldx	[%o0+0x40],%g3	! Read value at Mem[0000000030000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = f53a95b3fff3a65f
	ldx	[%o0+0x48],%g3	! Read value at Mem[0000000030000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p0_memcheck_share1:
	ldx	[%g4+0x00],%g2	! Expected value = 0000000000008880
	ldx	[%o1+0x00],%g3	! Read value at Mem[0000000030800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 67b3432000001080
	ldx	[%o1+0x08],%g3	! Read value at Mem[0000000030800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 934bff69114e8651
	ldx	[%o1+0x40],%g3	! Read value at Mem[0000000030800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = dc93b24178fb9bfa
	ldx	[%o1+0x48],%g3	! Read value at Mem[0000000030800048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p0_memcheck_share2:
	ldx	[%g4+0x00],%g2	! Expected value = 0000000055555500
	ldx	[%o2+0x00],%g3	! Read value at Mem[0000000031000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = ffff88617bc7c000
	ldx	[%o2+0x08],%g3	! Read value at Mem[0000000031000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 0000000000ff0fff
	ldx	[%o2+0x40],%g3	! Read value at Mem[0000000031000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = ffffffffffffffff
	ldx	[%o2+0x48],%g3	! Read value at Mem[0000000031000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p0_memcheck_share3:
	ldx	[%g4+0x00],%g2	! Expected value = 39290b36320b0a3f
	ldx	[%o3+0x00],%g3	! Read value at Mem[0000000031800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = d7be0d906ad840af
	ldx	[%o3+0x08],%g3	! Read value at Mem[0000000031800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = e1748a1b934c08f0
	ldx	[%o3+0x40],%g3	! Read value at Mem[0000000031800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 7bc70000114e8651
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
	addccc	%l3,%l5,%l4
	prefetch [%i0+0x0a0],21
	udivx	%l5,-0x720,%l7
	stb	%l1,[%i0+0x0d5]		! Mem[00000000100000d5]
	orncc	%l1,%l5,%l3
	done

p0_trap1o:
	addccc	%l3,%l5,%l4
	prefetch [%o0+0x0a0],21
	udivx	%l5,-0x720,%l7
	stb	%l1,[%o0+0x0d5]		! Mem[00000000100000d5]
	orncc	%l1,%l5,%l3
	done


p0_trap2e:
	ldub	[%o2+0x00c],%l2		! Mem[000000003100000c]
	prefetch [%i3+0x0e0],16
	andncc	%l4,-0x94c,%l1
	smul	%l5,-0x790,%l0
	ldsw	[%i3+0x0cc],%l7		! Mem[00000000118000cc]
	ldx	[%i0+0x0b0],%l5		! Mem[00000000100000b0]
	done

p0_trap2o:
	ldub	[%i2+0x00c],%l2		! Mem[000000003100000c]
	prefetch [%o3+0x0e0],16
	andncc	%l4,-0x94c,%l1
	smul	%l5,-0x790,%l0
	ldsw	[%o3+0x0cc],%l7		! Mem[00000000118000cc]
	ldx	[%o0+0x0b0],%l5		! Mem[00000000100000b0]
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
	ldx	[%g1+0x000],%l0	! %l0 = 293c8f002f1ff740
	ldx	[%g1+0x008],%l1	! %l1 = b7e99cff96a98845
	ldx	[%g1+0x010],%l2	! %l2 = b74f46ff9ca37224
	ldx	[%g1+0x018],%l3	! %l3 = c0a5d7fff9193750
	ldx	[%g1+0x020],%l4	! %l4 = 36b54100254deb01
	ldx	[%g1+0x028],%l5	! %l5 = de5177ff90eb0195
	ldx	[%g1+0x030],%l6	! %l6 = df8f8dffbcbccfd7
	ldx	[%g1+0x038],%l7	! %l7 = ce653d001cd3b70c

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
	ldd	[%g1+0x00],%f0		! %f0  = 97ded231, %f1  = f54e6e94
	ldd	[%g1+0x08],%f2		! %f2  = be63e46c, %f3  = 5281b70e
	ldd	[%g1+0x10],%f4		! %f4  = 063f7733, %f5  = 210bbf05
	ldd	[%g1+0x18],%f6		! %f6  = 563195c4, %f7  = 57a97321
	ldd	[%g1+0x20],%f8		! %f8  = 534d69fd, %f9  = db9dbfe1
	ldd	[%g1+0x28],%f10		! %f10 = 4d7da985, %f11 = 8b572294
	ldd	[%g1+0x30],%f12		! %f12 = 51a5a97a, %f13 = a4c33ff7
	ldd	[%g1+0x38],%f14		! %f14 = 30b3876d, %f15 = 95a3ac27
	ldd	[%g1+0x40],%f16		! %f16 = 049faad1, %f17 = fa3d44f0
	ldd	[%g1+0x48],%f18		! %f18 = 7ecaf98a, %f19 = 8e42958f
	ldd	[%g1+0x50],%f20		! %f20 = bdecf989, %f21 = 2527715b
	ldd	[%g1+0x58],%f22		! %f22 = 71fa8ce8, %f23 = 5fcb2b57
	ldd	[%g1+0x60],%f24		! %f24 = d1c7aa5f, %f25 = 22584f61
	ldd	[%g1+0x68],%f26		! %f26 = edf4e569, %f27 = 80033039
	ldd	[%g1+0x70],%f28		! %f28 = ee0654aa, %f29 = 2c43579c
	ldd	[%g1+0x78],%f30		! %f30 = c7464a5f, %f31 = 61a139d5
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 1

p1_label_1:
!	%l3 = 936ce0ffd5460001, immed = 00000122, %l1 = 742263ffd107f247
	addcc	%l3,0x122,%l1		! %l1 = 936ce0ffd5460123, %ccr = 88
!	Mem[0000000015000080] = 21673448 9acd82a5
	flush	%i2+0x080
!	%l6 = 80f81d00746a98dd, %l3 = 936ce0ffd5460001, %l1 = 936ce0ffd5460123
	addccc	%l6,%l3,%l1		! %l1 = 1464fe0049b098de, %ccr = 31
!	%f14 = 30b3876d 95a3ac27, %f30 = c7464a5f 61a139d5
	fcmped	%fcc1,%f14,%f30		! %fcc1 = 2
	nop				! Delay added due to fcmp
	fble,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2

p1_label_2:
!	Mem[0000000015000060] = 6ef78fe2 07efa77b 1e83ebd0 eb3198ee
	prefetch [%i2+0x060],21	! Annulled
p1_b1:
	membar	#Sync			! Added by membar checker (181)
!	%f20 = bdecf989, %f20 = bdecf989, %f14 = 30b3876d
	fsubs	%f20,%f20,%f14		! %f14 = 00000000
!	Branch On Register, %l5 = bfbeb8ff8ad8a7de
	brnz,a,pn %l5,p1_b2		! Branch Taken
!	Mem[0000000014000134] = c74eff0c, %l4 = f94a54ffeb2931cb
	ldsb	[%i0+0x137],%l4		! %l4 = 000000000000000c
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x002,%g2
p1_b2:
	membar	#Sync			! Added by membar checker (182)
!	%l1 = 1464fe0049b098de, immed = 00000611, %l1 = 1464fe0049b098de
	xnorcc	%l1,0x611,%l1		! %l1 = eb9b01ffb64f6130, %ccr = 88

p1_label_3:
!	%l6 = 80f81d00746a98dd, immed = 000009ae, %y  = 00000000
	smul	%l6,0x9ae,%l2		! %l2 = 00000466dfd3ab36
	fbl,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	 Annulled
	ldda	[%i1+%g0]0x80,%l4
p1_b3:
	membar	#Sync			! Added by membar checker (183)
!	Mem[0000000015000000] = bdc5e552, %l3 = 936ce0ffd5460001
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000bdc5e552
!	Mem[000000003200003c] = 7eee7325, %l1 = eb9b01ffb64f6130
	lduha	[%o4+0x03e]%asi,%g2	! %g2 = 0000000000007eee

p1_label_4:
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000014800000] = 221d1a30, %l4 = 000000000000000c
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 00000000221d1a30
p1_b4:
	membar	#Sync			! Added by membar checker (184)
!	%l7 = ed5737ffbeb48d62, Mem[0000000040000018] = 1e2214142c192415
	stxa	%l7,[%o5+0x018]%asi	! Mem[0000000040000018] = ed5737ffbeb48d62
!	Mem[0000000016800000] = 5a194ee6, %l4 = 00000000221d1a30
	ldsba	[%i5+%g0]0x80,%l4	! %l4 = 000000000000005a
!	%l7 = ed5737ffbeb48d62, immed = fffffb5a, %y  = 00000466
	udiv	%l7,-0x4a6,%l6		! %l6 = 0000000000000466

p1_label_5:
!	%l0 = 5d02f5003c7f1718, immed = fffffb85, %l5 = bfbeb8ff8ad8a7de
	or	%l0,-0x47b,%l5		! %l5 = ffffffffffffff9d
	fbne,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000054] = 5ae4ce67, %l2 = 00000466dfd3ab36
	lduh	[%o0+0x054],%l2		! %l2 = 0000000000005ae4
p1_b5:
	membar	#Sync			! Added by membar checker (185)
!	%l1 = eb9b01ffb64f6130, immed = fffff50f, %y  = 00000466
	udivx	%l1,-0xaf1,%l1		! %l1 = 0000000000000000
!	%f6  = 563195c4 57a97321, %f26 = edf4e569 80033039
	fcmpd	%fcc3,%f6 ,%f26		! %fcc3 = 2

p1_label_6:
!	Mem[0000000015800120] = 78a44c5b dcf42d71 5b445cc6 cb082f18
	prefetcha [%i3+0x120]%asi,2
	ba,a	p1_b6			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000015800000] = 2f757a3d, %l0 = 5d02f5003c7f1718
	ldstuba	[%i3+%g0]0x80,%l0	! Annulled
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x006,%g2
p1_b6:
	membar	#Sync			! Added by membar checker (186)
!	%f1  = f54e6e94, %f0  = 97ded231
	fabss	%f1 ,%f0 		! %f0  = 754e6e94
!	%l4 = 000000000000005a, immed = fffffdd5, %l0 = 5d02f5003c7f1718
	orncc	%l4,-0x22b,%l0		! %l0 = 000000000000027a, %ccr = 00

p1_label_7:
!	Branch On Register, %l1 = 0000000000000000
	brgz,pn	%l1,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000016800008] = b80ec8b5, %l7 = ed5737ffbeb48d62
	lduha	[%i5+%o6]0x80,%l7	! %l7 = 000000000000b80e
p1_b7:
	bgu	p1_b8			! Branch Taken, %ccr = 00, CWP = 0
!	%l5 = ffffffffffffff9d, Mem[000000004000001e] = beb48d62
	sth	%l5,[%o5+0x01e]		! Mem[000000004000001c] = beb4ff9d
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x008,%g2
p1_b8:
	membar	#Sync			! Added by membar checker (187)
!	%l2 = 00005ae4, %l3 = bdc5e552, Mem[0000000030800058] = 546a4338 2124fba4
	stda	%l2,[%o1+0x058]%asi	! Mem[0000000030800058] = 00005ae4 bdc5e552

p1_label_8:
!	Mem[0000000030000058] = 9f9c316fbc1da8ed, %l4 = 000000000000005a
	ldx	[%o0+0x058],%l4		! %l4 = 9f9c316fbc1da8ed
!	%l4 = 9f9c316fbc1da8ed, Mem[0000000030800010] = 197004aa
	stha	%l4,[%o1+0x010]%asi	! Mem[0000000030800010] = a8ed04aa
!	Mem[0000000015000164] = edf12a0d, %l4 = 9f9c316fbc1da8ed
	lduha	[%i2+0x166]%asi,%l4	! %l4 = 0000000000002a0d
	set	p1_b9,%o7
	fbuge	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800190] = 98481c4cbcba419c, %l2 = 0000000000005ae4
	ldx	[%i3+0x190],%l2		! %l2 = 98481c4cbcba419c
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x009,%g2
p1_b9:
!	Registers modified during the branch to p1_far_1
!	%l0  = 0000000000000766
!	%l1  = 00000000027a0000
!	%l3  = 000000004c8d2a40

p1_label_9:
	fbug	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 0000000000000766, Mem[0000000014000044] = a9f3103c
	stw	%l0,[%i0+0x044]		! Mem[0000000014000044] = 00000766
p1_b10:
	membar	#Sync			! Added by membar checker (188)
!	Mem[0000000015800000] = 2f757a3d, %l2 = 98481c4cbcba419c
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 000000000000002f
!	%f28 = ee0654aa, %f14 = 00000000 95a3ac27
	fitod	%f28,%f14		! %f14 = c1b1f9ab 56000000
	fbul,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_10:
!	%l7 = 000000000000b80e, Mem[0000000014000174] = 634d6019
	sth	%l7,[%i0+0x174]		! Mem[0000000014000174] = b80e6019
p1_b11:
	membar	#Sync			! Added by membar checker (189)
!	%l1 = 00000000027a0000, Mem[0000000014800000] = 221d1a30
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000014800000] = 027a0000
!	Mem[000000003180005c] = 78f9c0f6, %l7 = 000000000000b80e
	lduw	[%o3+0x05c],%l7		! %l7 = 0000000078f9c0f6
	fbu,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[00000000158001c0] = 6a76a948 e81fe9e7 e3861dc5 1ce62c58
	prefetch [%i3+0x1c0],16	! Annulled
p1_b12:

p1_label_11:
	membar	#Sync			! Added by membar checker (190)
!	Mem[0000000017000080] = df8e4b9d 50ed477b 919b9664 5a971a4d
	prefetcha [%i6+0x080]%asi,16
!	Mem[0000000014800150] = 7d615c28, %l0 = 0000000000000766
	ldswa	[%i1+0x150]%asi,%l0	! %l0 = 000000007d615c28
!	Mem[0000000015000000] = d5460001, %l4 = 0000000000002a0d
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000d5460001
!	%l4 = 00000000d5460001, %l2 = 000000000000002f, %l6 = 0000000000000466
	srl	%l4,%l2,%l6		! %l6 = 000000000001aa8c
!	%l1 = 00000000027a0000, immed = fffff961, %l6 = 000000000001aa8c
	xor	%l1,-0x69f,%l6		! %l6 = fffffffffd85f961

p1_label_12:
!	Mem[00000000148000a0] = b46e9004 42799b84 4505bc42 f0247578
	prefetcha [%i1+0x0a0]%asi,23
	set	p1_b13,%o7
	fbue	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[000000003180001c] = 14f57e15, %l4 = 00000000d5460001
	lduh	[%o3+0x01e],%l4		! %l4 = 0000000000007e15
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x00d,%g2
p1_b13:
!	Registers modified during the branch to p1_far_0
!	%l4  = ffffffffe7400000
!	%l6  = 8500000000000000
	membar	#Sync			! Added by membar checker (191)
!	%l6 = 8500000000000000, immed = 00000cf0, %l0 = 000000007d615c28
	or	%l6,0xcf0,%l0		! %l0 = 8500000000000cf0
!	call to call_3, CWP = 0
	call	p1_call_3_le

p1_label_13:
!	%l1 = 00000000027a0000, Mem[0000000015000000] = 00002a0d
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000015000000] = 00002a0d
!	Registers modified during the branch to p1_call_3
!	%l0  = 7b000000e097b892
!	%l1  = 000000004c8d2a11
!	%l3  = 00000000ffffffff
!	%l7  = ffffffffd393691b
	set	p1_b14,%o7
	fbuge,a,pt %fcc0,p1_near_2_le	! Branch Taken, %fcc0 = 0
!	%l2 = 000000000000002f, Mem[0000000015800000] = ff757a3d
	stha	%l2,[%i3+%g0]0x80	! Mem[0000000015800000] = 002f7a3d
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x00e,%g2
p1_b14:
!	Registers modified during the branch to p1_near_2
!	%l0  = 1109dceac14e3344
!	%l1  = 84fffffffffff6d7
!	%l3  = 1ca1dbc78685843c
!	%l4  = 00000000000007df
!	%l5  = fffffffce8000000
	bge,a	p1_b15			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[00000000150000c0] = 4da252ff 88100109 155b66f4 ceefe2e0
	prefetch [%i2+0x0c0],22
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x00f,%g2
p1_b15:

p1_label_14:
	membar	#Sync			! Added by membar checker (192)
!	%l5 = fffffffce8000000, immed = 0000003d, %l7 = ffffffffd393691b
	srlx	%l5,0x03d,%l7		! %l7 = 0000000000000007
!	%l4 = 00000000000007df, %l3 = 1ca1dbc78685843c, %l7 = 0000000000000007
	andncc	%l4,%l3,%l7		! %l7 = 00000000000003c3, %ccr = 00
!	Mem[0000000015800080] = 995cfb18 97128665 52f26b9f 5338b498
	prefetch [%i3+0x080],22
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,22
!	%l0 = 1109dceac14e3344, immed = 00000557, %y  = 00000466
	smul	%l0,0x557,%l6		! %l6 = fffffeb13893c01c

p1_label_15:
	set	p1_b16,%o7
	fble	p1_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000158001ac] = a4bfe089, %l0 = 1109dceac14e3344
	ldsb	[%i3+0x1ad],%l0		! %l0 = ffffffffffffffbf
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x010,%g2
p1_b16:
!	Registers modified during the branch to p1_far_0
!	%l4  = ff3a000000000000
!	%l6  = f7e0000000000000
	membar	#Sync			! Added by membar checker (193)
!	Mem[0000000014800000] = 027a0000, %l2 = 000000000000002f
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000002
	set	p1_b17,%o7
	fbuge,a,pt %fcc0,p1_near_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800164] = 8cc8e975, %l4 = ff3a000000000000
	lduh	[%i1+0x164],%l4		! %l4 = 0000000000008cc8
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x011,%g2
p1_b17:
!	Registers modified during the branch to p1_near_2
!	%l6  = 00000000eadecc76
!	%l7  = 00000000e9ff5445

p1_label_16:
	membar	#Sync			! Added by membar checker (194)
!	Mem[0000000015000120] = 2a5d7aa1 aef3a49b
	flush	%i2+0x120
!	%l6 = 00000000eadecc76, immed = fffffdd8, %y  = fffffeb1
	smulcc	%l6,-0x228,%l2		! %l2 = 0000002d8f972190, %ccr = 08
!	%f14 = c1b1f9ab 56000000, %f16 = 049faad1 fa3d44f0
	fdtox	%f14,%f16		! %f16 = ffffffff ee0654aa
!	Mem[0000000032000030] = a4943b333a1e3068, %l6 = 00000000eadecc76
	ldxa	[%o4+0x030]%asi,%g2	! %g2 = a4943b333a1e3068
	set	p1_b18,%o7
	fbe,pt	%fcc2,p1_near_1_he	! Branch Taken, %fcc2 = 0

p1_label_17:
!	Mem[0000000031800018] = b208c56a, %l0 = ffffffffffffffbf
	ldsh	[%o3+0x01a],%l0		! %l0 = ffffffffffffc56a
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x012,%g2
p1_b18:
!	Registers modified during the branch to p1_near_1
!	%l0  = ffffffff1600a45b
!	%l3  = ffffffffffffffff
!	%l4  = 00000000e1b5cc76
!	%l5  = fffffffff6d70000
	bgu	p1_b19			! Branch Taken, %ccr = 80, CWP = 0
!	%l3 = ffffffffffffffff, Mem[0000000015000008] = 095490ed5cf672b3
	stxa	%l3,[%i2+%o6]0x80	! Mem[0000000015000008] = ffffffffffffffff
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x013,%g2
p1_b19:
	membar	#Sync			! Added by membar checker (195)
!	%l2 = 0000002d8f972190, Mem[000000001580004f] = e1d6ae1a
	stba	%l2,[%i3+0x04f]%asi	! Mem[000000001580004c] = e1d6ae90
!	%l7 = 00000000e9ff5445, %l0 = ffffffff1600a45b, %l0 = ffffffff1600a45b
	addc	%l7,%l0,%l0		! %l0 = fffffffffffff8a0

p1_label_18:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000014] = 02090562, %l7 = 00000000e9ff5445
	lduw	[%o0+0x014],%l7		! Annulled
p1_b20:
	membar	#Sync			! Added by membar checker (196)
!	%l3 = ffffffffffffffff, %l4 = 00000000e1b5cc76, %l0 = fffffffffffff8a0
	xnorcc	%l3,%l4,%l0		! %l0 = 00000000e1b5cc76, %ccr = 08
	set	p1_b21,%o7
	fba,pt	%fcc2,p1_near_0_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000015000100] = fd9940f4 f0a72e7a 4d5beba3 a49b83c9
	prefetch [%i2+0x100],23
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x015,%g2
p1_b21:
!	Registers modified during the branch to p1_near_0
!	%l0  = 00000000000075ea
!	%l1  = 0000000000005b1f

p1_label_19:
	fbug,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = ffffffffffffffff, Mem[0000000014000164] = 53fa9e8f
	stw	%l3,[%i0+0x164]		! Annulled
p1_b22:
	membar	#Sync			! Added by membar checker (197)
!	Branch On Register, %l0 = 00000000000075ea
	brgz,a,pt %l0,p1_b23		! Branch Taken
!	Mem[00000000160000a0] = 41b69871, %l3 = ffffffffffffffff
	ldsw	[%i4+0x0a0],%l3		! %l3 = 0000000041b69871
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x017,%g2
p1_b23:
	membar	#Sync			! Added by membar checker (198)
	nop

p1_label_20:
!	Mem[0000000031000010] = f802c030 1e6edb0b, %l6 = eadecc76, %l7 = e9ff5445
	ldd	[%o2+0x010],%l6		! %l6 = 00000000f802c030 000000001e6edb0b
	set	p1_b24,%o7
	fbge,a	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	%l4 = e1b5cc76, %l5 = f6d70000, Mem[00000000148000e0] = d674861f 264f9f67
	std	%l4,[%i1+0x0e0]	! Mem[00000000148000e0] = e1b5cc76 f6d70000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x018,%g2
p1_b24:
!	Registers modified during the branch to p1_far_0
!	%l0  = 0000004799790000
!	%l1  = ffffffb85d5e0000
!	%l2  = 00000000ffffffff
!	%l3  = 000000006afd07a0
	membar	#Sync			! Added by membar checker (199)
!	%l2 = 00000000ffffffff, %l7 = 000000001e6edb0b, %l4 = 00000000e1b5cc76
	orcc	%l2,%l7,%l4		! %l4 = 00000000ffffffff, %ccr = 08
!	Mem[0000000015800198] = 8ab5bc82c777e88c, %l6 = 00000000f802c030
	ldx	[%i3+0x198],%l6		! %l6 = 8ab5bc82c777e88c

p1_label_21:
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,23
!	%l1 = ffffffb85d5e0000, Mem[0000000014000000] = 2bfe5911
	stha	%l1,[%i0+%g0]0x80	! Mem[0000000014000000] = 00005911
!	Mem[00000000168001e0] = 7ed90c86 de344037 0e06b1e2 f1ba56b9
	prefetcha [%i5+0x1e0]%asi,21
!	%l7 = 000000001e6edb0b, immed = 0000057a, %y  = ffffffb8
	udiv	%l7,0x57a,%l3		! %l3 = 00000000ffffffff
	ba,a	p1_b25			! Branch Taken, %ccr = 08, CWP = 0

p1_label_22:
!	%l3 = 00000000ffffffff, Mem[00000000158000b4] = 8891822a
	stw	%l3,[%i3+0x0b4]		! Annulled
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x019,%g2
p1_b25:
	bge	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000015000008] = ffffffff, %l2 = 00000000ffffffff
	ldsba	[%i2+%o6]0x80,%l2	! %l2 = ffffffffffffffff
p1_b26:
	membar	#Sync			! Added by membar checker (200)
	fble,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l6 = 8ab5bc82c777e88c, Mem[0000000031000050] = 360ca8e2
	sth	%l6,[%o2+0x050]		! Annulled
p1_b27:

p1_label_23:
	membar	#Sync			! Added by membar checker (201)
!	Mem[0000000015800000] = 002f7a3d, %l6 = 8ab5bc82c777e88c
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000002f
!	Mem[0000000015800008] = 283fe896, %l0 = 0000004799790000
	ldswa	[%i3+%o6]0x80,%l0	! %l0 = 00000000283fe896
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000170000dc] = e8b23150, %l7 = 000000001e6edb0b
	ldsw	[%i6+0x0dc],%l7		! %l7 = ffffffffe8b23150
p1_b28:
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_24:
!	Mem[000000001580002c] = 1ff25189, %l2 = ffffffffffffffff
	ldsw	[%i3+0x02c],%l2		! Annulled
p1_b29:
	membar	#Sync			! Added by membar checker (202)
!	%l3 = 00000000ffffffff, %l5 = fffffffff6d70000, %l3 = 00000000ffffffff
	subc	%l3,%l5,%l3		! %l3 = 000000010928ffff
!	%f4  = 063f7733 210bbf05, %f4  = 063f7733 210bbf05, %f8  = 534d69fd db9dbfe1
	fsubd	%f4 ,%f4 ,%f8 		! %f8  = 00000000 00000000
	set	p1_b30,%o7
	fblg,pn	%fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 2
!	Mem[00000000140000f8] = e3417349, %l3 = 000000010928ffff
	ldsw	[%i0+0x0f8],%l3		! %l3 = ffffffffe3417349
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x01e,%g2
p1_b30:
!	Registers modified during the branch to p1_near_2
!	%l6  = 00000000eadecc76
!	%l7  = 00000000e9ff5445

p1_label_25:
	membar	#Sync			! Added by membar checker (203)
!	%l2 = ffffffffffffffff, immed = 0000040e, %l5 = fffffffff6d70000
	xor	%l2,0x40e,%l5		! %l5 = fffffffffffffbf1
!	%l3 = ffffffffe3417349, immed = fffff543, %y  = ffffffb8
	smulcc	%l3,-0xabd,%l5		! %l5 = 00000134aa2d091b, %ccr = 08
!	%f8  = 00000000, %f18 = 7ecaf98a, %f28 = ee0654aa
	fdivs	%f8 ,%f18,%f28		! %f28 = 00000000
!	%l6 = 00000000eadecc76, immed = fffff233, %l2 = ffffffffffffffff
	andcc	%l6,-0xdcd,%l2		! %l2 = 00000000eadec032, %ccr = 08
!	Mem[000000003000001c] = 6bd14271, %l4 = 00000000ffffffff
	swapa	[%o0+0x01c]%asi,%l4	! %l4 = 000000006bd14271

p1_label_26:
!	%l7 = 00000000e9ff5445, immed = 00000018, %l2 = 00000000eadec032
	srlx	%l7,0x018,%l2		! %l2 = 00000000000000e9
!	%f14 = c1b1f9ab 56000000, %f19 = 8e42958f
	fdtoi	%f14,%f19		! %f19 = ee0654aa
!	%l6 = 00000000eadecc76, immed = 0000003f, %l2 = 00000000000000e9
	andcc	%l6,0x03f,%l2		! %l2 = 0000000000000036, %ccr = 00
!	%f14 = c1b1f9ab 56000000, %f27 = 80033039
	fdtoi	%f14,%f27		! %f27 = ee0654aa
!	%l7 = 00000000e9ff5445, %l0 = 00000000283fe896, %l5 = 00000134aa2d091b
	sll	%l7,%l0,%l5		! %l5 = 003a7fd511400000

p1_label_27:
!	Mem[0000000014000190] = ffffffff 000000fd, %l4 = 000000006bd14271, %l7 = 00000000e9ff5445
	add	%i0,0x190,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 7eccf737d6955bc3
!	Mem[00000000148001c0] = 05859e65 22e682ad 5581b859 a4c085a8
	prefetch [%i1+0x1c0],1
!	%f28 = 00000000 2c43579c, %f28 = 00000000 2c43579c
	fabsd	%f28,%f28		! %f28 = 00000000 2c43579c
!	%f25 = 22584f61, %f8  = 00000000
	fcmpes	%fcc2,%f25,%f8 		! %fcc2 = 2
!	Mem[0000000030800050] = eadecc76, %l0 = 00000000283fe896
	swapa	[%o1+0x050]%asi,%l0	! %l0 = 00000000eadecc76

p1_label_28:
!	Mem[00000000148001fc] = 47396a05, %l0 = 00000000eadecc76
	lduw	[%i1+0x1fc],%l0		! %l0 = 0000000047396a05
!	%l7 = 7eccf737d6955bc3, immed = fffff17d, %l7 = 7eccf737d6955bc3
	xor	%l7,-0xe83,%l7		! %l7 = 813308c8296aaabe
!	%l2 = 0000000000000036, %l3 = ffffffffe3417349, %l1 = ffffffb85d5e0000
	srax	%l2,%l3,%l1		! %l1 = 0000000000000000
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[00000000158001b0] = c1997c02, %l5 = 003a7fd511400000
	ldsh	[%i3+0x1b2],%l5		! %l5 = 0000000000007c02
!	Registers modified during the branch to p1_jmpl_0
!	%l4  = 360ca8e1ed3e9d42
!	%l5  = ffffffffffffff79
!	%l6  = 360ca8e209fd29f9

p1_label_29:
!	Mem[00000000148001e0] = 8e735e1b 63ea3d1d 1bf2071e 65d02aa2
	prefetch [%i1+0x1e0],2
!	%l1 = 0000000000000000, immed = 0000012d, %l5 = ffffffffffffff79
	xor	%l1,0x12d,%l5		! %l5 = 000000000000012d
!	Mem[0000000014000038] = 168580e8 16a4513a, %l0 = 47396a05, %l1 = 00000000
	ldd	[%i0+0x038],%l0		! %l0 = 00000000168580e8 0000000016a4513a
!	%l5 = 000000000000012d
	sethi	%hi(0xad4e8400),%l5	! %l5 = 00000000ad4e8400
!	%f20 = bdecf989, %f12 = 51a5a97a
	fnegs	%f20,%f12		! %f12 = 3decf989

p1_label_30:
!	%f15 = 56000000, %f17 = ee0654aa, %f0  = 754e6e94 f54e6e94
	fsmuld	%f15,%f17,%f0 		! %f0  = c890ca95 40000000
!	Mem[00000000140000c0] = ab852ebd db5de8cd a86e50d8 cd3b098e
	prefetch [%i0+0x0c0],23
!	%l6 = 360ca8e209fd29f9, immed = 00000514, %l1 = 0000000016a4513a
	andn	%l6,0x514,%l1		! %l1 = 360ca8e209fd28e9
!	%f26 = edf4e569, %f17 = ee0654aa
	fcmps	%fcc1,%f26,%f17		! %fcc1 = 2
!	Mem[0000000030000050] = ab852ebd db5de8cd, %l7 = 813308c8296aaabe, %l3 = ffffffffe3417349
	add	%o0,0x50,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = 4cf6a7115ae4ce67

p1_label_31:
!	%f16 = ffffffff ee0654aa, %f8  = 00000000 00000000, %f22 = 71fa8ce8 5fcb2b57
	fmuld	%f16,%f8 ,%f22		! %f22 = ffffffff ee0654aa
	set	p1_b31,%o7
	fblg,a,pn %fcc3,p1_near_2_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000014000000] = 00005911, %l3 = 4cf6a7115ae4ce67
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x01f,%g2
p1_b31:
!	Registers modified during the branch to p1_near_2
!	%l6  = 00000000283fe896
!	%l7  = 00000000e9ff5445
	membar	#Sync			! Added by membar checker (204)
!	%l3 = 0000000000000000, %l6 = 00000000283fe896, %l5 = 00000000ad4e8400
	or	%l3,%l6,%l5		! %l5 = 00000000283fe896
!	%l3 = 0000000000000000, Mem[00000000158000dc] = ee915817
	stwa	%l3,[%i3+0x0dc]%asi	! Mem[00000000158000dc] = 00000000

p1_label_32:
	bg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000015000000] = 00002a0d, %l7 = 00000000e9ff5445
	ldsba	[%i2+%g0]0x80,%l7	! Annulled
p1_b32:
	membar	#Sync			! Added by membar checker (205)
!	%l2 = 00000036, %l3 = 00000000, Mem[0000000015000118] = b8d0176a 3f5b6853
	std	%l2,[%i2+0x118]	! Mem[0000000015000118] = 00000036 00000000
!	%l5 = 00000000283fe896, %l1 = 360ca8e209fd28e9, %l6 = 00000000283fe896
	andn	%l5,%l1,%l6		! %l6 = 000000002002c016
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetcha [%o4+0x020]%asi,0

p1_label_33:
	nop
!	Mem[0000000031000018] = dad84bcb ffffc56a, %l0 = 168580e8, %l1 = 09fd28e9
	ldd	[%o2+0x018],%l0		! %l0 = 00000000dad84bcb 00000000ffffc56a
!	Mem[00000000148000c0] = 8aa3d8c9 a8985701 130a9830 0c55dbbe
	prefetch [%i1+0x0c0],3
	set	p1_b33,%o7
	fbne,a,pn %fcc1,p1_near_1_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000014000008] = 30ca03f5, %l1 = 00000000ffffc56a
	ldsha	[%i0+%o6]0x80,%l1	! %l1 = 00000000000030ca
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x021,%g2
p1_b33:
!	Registers modified during the branch to p1_near_1
!	%l2  = 00000000000030ca
!	%l3  = 00000000000030ca
!	%l5  = 00000000800030ca
!	%l7  = ffffffffd7c01769

p1_label_34:
	membar	#Sync			! Added by membar checker (206)
!	%f16 = ffffffff, %f31 = 61a139d5
	fitos	%f16,%f31		! %f31 = bf800000
!	%l0 = 00000000dad84bcb, %l1 = 00000000000030ca, %l5 = 00000000800030ca
	subc	%l0,%l1,%l5		! %l5 = 00000000dad81b01
!	Mem[0000000040000018] = ed5737ff, %l5 = 00000000dad81b01
	ldstuba	[%o5+0x018]%asi,%l5	! %l5 = 00000000000000ed
!	%f8  = 00000000 00000000, %f28 = 00000000 2c43579c
	fdtox	%f8 ,%f28		! %f28 = 00000000 00000000
!	%f8  = 00000000 00000000, %f22 = ffffffff ee0654aa
	fdtox	%f8 ,%f22		! %f22 = 00000000 00000000

p1_label_35:
!	Mem[0000000014000160] = ef1bea1d 53fa9e8f 69e34e4e 4b893b4e
	prefetch [%i0+0x160],4
!	%l5 = 00000000000000ed, immed = ffffff5d, %y  = 11717032
	sdiv	%l5,-0x0a3,%l0		! %l0 = ffffffff80000000
!	%l2 = 00000000000030ca, immed = 000000f5, %l0 = ffffffff80000000
	xorcc	%l2,0x0f5,%l0		! %l0 = 000000000000303f, %ccr = 00
!	%f28 = 00000000 00000000, %f8  = 00000000
	fxtos	%f28,%f8 		! %f8  = 00000000
!	%l0 = 000000000000303f, Mem[0000000015800008] = 283fe896
	stwa	%l0,[%i3+%o6]0x80	! Mem[0000000015800008] = 0000303f

p1_label_36:
!	Mem[0000000030000058] = 9f9c316fbc1da8ed, %l2 = 00000000000030ca
	ldx	[%o0+0x058],%l2		! %l2 = 9f9c316fbc1da8ed
!	%l2 = 9f9c316fbc1da8ed, %l2 = 9f9c316fbc1da8ed, %y  = 11717032
	smul	%l2,%l2,%l6		! %l6 = 120041b1cd29eb69
!	%f8  = 00000000 00000000, %f0  = c890ca95 40000000, %f18 = 7ecaf98a ee0654aa
	fmuld	%f8 ,%f0 ,%f18		! %f18 = 80000000 00000000
!	%f4  = 063f7733 210bbf05, %f30 = c7464a5f bf800000
	fabsd	%f4 ,%f30		! %f30 = 063f7733 210bbf05
!	%l0 = 000000000000303f, Mem[0000000014000000] = 000059119046a007
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000014000000] = 000000000000303f

p1_label_37:
	set	p1_b34,%o7
	fbe,a	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000016000000] = 07ea04d4 b9fa1427, %l2 = bc1da8ed, %l3 = 000030ca
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000007ea04d4 00000000b9fa1427
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x022,%g2
p1_b34:
!	Registers modified during the branch to p1_far_1
!	%l0  = 120041b1cd29eb6f
!	%l1  = 00000000303f0000
!	%l3  = 00000000ffffffff
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000014800160] = 0196f7078cc8e975, %l2 = 0000000007ea04d4
	ldx	[%i1+0x160],%l2		! %l2 = 0196f7078cc8e975
p1_b35:
	set	p1_b36,%o7
	fbuge,a	p1_far_3_he	! Branch Taken, %fcc0 = 0

p1_label_38:
!	Mem[0000000015800000] = 002f7a3d, %l3 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x024,%g2
p1_b36:
	membar	#Sync			! Added by membar checker (207)
!	%l4 = 360ca8e1ed3e9d42, %l2 = 0196f7078cc8e975, %y  = 120041b1
	umul	%l4,%l2,%l4		! %l4 = 82786f455e4ef12a
	set	p1_b37,%o7
	fbe,a	p1_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000150001c0] = 9c8d3c51 7308b43f f5564892 54b4ab09
	prefetch [%i2+0x1c0],20
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x025,%g2
p1_b37:
!	Registers modified during the branch to p1_far_1
!	%l0  = 120041b1cd29f62e
!	%l1  = 00000000000008c9
!	%l7  = ffffffffcfc0ffff
	membar	#Sync			! Added by membar checker (208)
!	Mem[00000000158001e8] = 00000000 0008b43f, %l3 = 0000000000000000, %l2 = 0196f7078cc8e975
	add	%i3,0x1e8,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 9ddafabca972ebb6

p1_label_39:
!	%l0 = 120041b1cd29f62e, %l2 = 9ddafabca972ebb6, %l2 = 9ddafabca972ebb6
	add	%l0,%l2,%l2		! %l2 = afdb3c6e769ce1e4
!	Mem[0000000032000054] = 11a1e99d, %l3 = 0000000000000000
	lduha	[%o4+0x054]%asi,%g2	! %g2 = 00000000000011a1
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800018] = c927fffe, %l3 = 0000000000000000
	swap	[%o1+0x018],%l3		! %l3 = 00000000c927fffe
p1_b38:
	membar	#Sync			! Added by membar checker (209)
	fbn,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2

p1_label_40:
!	Mem[0000000015800120] = 78a44c5b dcf42d71 5b445cc6 cb082f18
	prefetch [%i3+0x120],16
p1_b39:
	membar	#Sync			! Added by membar checker (210)
	set	p1_b40,%o7
	fbge,a,pt %fcc2,p1_near_0_le	! Branch Taken, %fcc2 = 2
!	%l3 = 00000000c927fffe, Mem[000000003100001e] = ffffc56a
	sth	%l3,[%o2+0x01e]		! Mem[000000003100001c] = fffffffe
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x028,%g2
p1_b40:
!	Registers modified during the branch to p1_near_0
!	%l0  = 00000000000075ea
!	%l1  = 0000015fb678dced
	membar	#Sync			! Added by membar checker (211)
!	Mem[00000000150000a0] = d7c352eb 5c906c5c 15bb6b7d e0975bc1
	prefetcha [%i2+0x0a0]%asi,16
	set	p1_b41,%o7
	fba,pn	%fcc3,p1_near_3_le	! Branch Taken, %fcc3 = 2

p1_label_41:
!	Mem[0000000015800008] = 0000303f, %l2 = afdb3c6e769ce1e4
	ldswa	[%i3+%o6]0x80,%l2	! %l2 = 000000000000303f
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x029,%g2
p1_b41:
!	Registers modified during the branch to p1_near_3
!	%l3  = 120041b1cd29e929
	membar	#Sync			! Added by membar checker (212)
!	Mem[0000000031800014] = 41b69871, %l4 = 82786f455e4ef12a
	swap	[%o3+0x014],%l4		! %l4 = 0000000041b69871
!	%l7 = ffffffffcfc0ffff, %l4 = 0000000041b69871, %l6 = 120041b1cd29eb69
	srlx	%l7,%l4,%l6		! %l6 = 0000000000007fff
!	Mem[0000000016800008] = b80ec8b5, %l3 = 120041b1cd29e929
	ldsha	[%i5+%o6]0x80,%l3	! %l3 = ffffffffffffb80e
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_42:
!	%l6 = 0000000000007fff, Mem[0000000015000008] = ffffffffffffffff
	stxa	%l6,[%i2+%o6]0x80	! Annulled
p1_b42:
	membar	#Sync			! Added by membar checker (213)
!	%f31 = 210bbf05, %f12 = 3decf989 a4c33ff7
	fstod	%f31,%f12		! %f12 = 3c2177e0 a0000000
!	Mem[0000000015800008] = 0000303f, %l6 = 0000000000007fff
	lduba	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000
!	%l7 = ffffffffcfc0ffff, Mem[000000001400013a] = f993339a
	sth	%l7,[%i0+0x13a]		! Mem[0000000014000138] = f993ffff
!	%l7 = ffffffffcfc0ffff, %l2 = 000000000000303f, %y  = 0000082e
	smul	%l7,%l2,%l6		! %l6 = fffff6e8507ecfc1

p1_label_43:
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,2
	nop
!	%f0  = c890ca95 40000000, %f10 = 4d7da985 8b572294
	fcmped	%fcc3,%f0 ,%f10		! %fcc3 = 1
!	%f12 = 3c2177e0 a0000000, %f12 = 3c2177e0
	fdtos	%f12,%f12		! %f12 = 210bbf05
	bvs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_44:
!	Mem[0000000014800040] = aab37307 1ea53b82 516559c4 c2f3bc9a
	prefetch [%i1+0x040],4	! Annulled
p1_b43:
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = 000000000000303f, Mem[0000000014000008] = 30ca03f5
	stwa	%l2,[%i0+%o6]0x80	! Mem[0000000014000008] = 0000303f
p1_b44:
	membar	#Sync			! Added by membar checker (214)
!	%f16 = ffffffff ee0654aa, %f24 = d1c7aa5f 22584f61
	fxtod	%f16,%f24		! %f24 = c1b1f9ab 56000000
!	%l4 = 0000000041b69871, immed = fffffe8e, %l3 = ffffffffffffb80e
	andn	%l4,-0x172,%l3		! %l3 = 0000000000000071

p1_label_45:
!	%f25 = 56000000, %f7  = 57a97321
	fcmpes	%fcc0,%f25,%f7 		! %fcc0 = 1
	nop				! Delay added due to fcmp
	set	p1_b45,%o7
	fbul,pn	%fcc0,p1_near_1_he	! Branch Taken, %fcc0 = 1
!	%l3 = 0000000000000071, Mem[0000000015800000] = ff2f7a3d
	stha	%l3,[%i3+%g0]0x80	! Mem[0000000015800000] = 00717a3d
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x02d,%g2
p1_b45:
!	Registers modified during the branch to p1_near_1
!	%l0  = 00000000303f0fe1
!	%l3  = 0000000000000000
!	%l4  = 015fad612d6bcfc1
!	%l5  = 015fb678dced0000
	membar	#Sync			! Added by membar checker (215)
	set	p1_b46,%o7
	fbo,a,pt %fcc0,p1_near_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000015000150] = ab83a0a65553291c, %l3 = 0000000000000000
	ldx	[%i2+0x150],%l3		! %l3 = ab83a0a65553291c
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x02e,%g2
p1_b46:
!	Registers modified during the branch to p1_near_3
!	%l4  = 00000000ffffffff

p1_label_46:
	membar	#Sync			! Added by membar checker (216)
	set	p1_b47,%o7
	fbule,pt %fcc0,p1_near_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000030000058] = 9f9c316f, %l2 = 000000000000303f
	lduh	[%o0+0x05a],%l2		! %l2 = 000000000000316f
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x02f,%g2
p1_b47:
!	Registers modified during the branch to p1_near_2
!	%l0  = 0917b57d31ba23c1
!	%l1  = fffff6e8507ec698
!	%l3  = 6a5f8fb8a93a7120
!	%l4  = 0000000000003920
!	%l5  = 6e76800000000000
	membar	#Sync			! Added by membar checker (217)
!	%l5 = 6e76800000000000, Mem[0000000014000000] = 00000000
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000014000000] = 00000000
!	%l0 = 0917b57d31ba23c1, %l0 = 0917b57d31ba23c1, %y  = fffff6e8
	mulx	%l0,%l0,%l0		! %l0 = ceac9d81db725781
	bg,a	p1_b48			! Branch Taken, %ccr = 00, CWP = 0

p1_label_47:
!	%l7 = ffffffffcfc0ffff, Mem[00000000140001ff] = b118b7bd
	stb	%l7,[%i0+0x1ff]		! Mem[00000000140001fc] = b118b7ff
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x030,%g2
p1_b48:
	membar	#Sync			! Added by membar checker (218)
!	Mem[0000000032000000] = 8f1e74911f47a2f8, %l2 = 000000000000316f
	ldx	[%o4+0x000],%g2		! %g2 = 8f1e74911f47a2f8
!	Mem[0000000015800000] = 00717a3d, %l6 = fffff6e8507ecfc1
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000071
!	Mem[0000000014000080] = c2c77b52 1bfab1b7 cf831b28 72a21a89
	prefetch [%i0+0x080],3
!	%l7 = ffffffffcfc0ffff, Mem[0000000030000018] = f404a466
	sth	%l7,[%o0+0x018]		! Mem[0000000030000018] = ffffa466

p1_label_48:
!	%f8  = 00000000 00000000, %f0  = c890ca95
	fdtoi	%f8 ,%f0 		! %f0  = 00000000
!	Mem[0000000015800120] = 78a44c5b dcf42d71 5b445cc6 cb082f18
	prefetch [%i3+0x120],3
!	Mem[0000000016800000] = 5a194ee6, %l1 = fffff6e8507ec698
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = 000000005a194ee6
!	Mem[0000000015800070] = 2d4e2d3efd6932c2, %l1 = 000000005a194ee6
	ldxa	[%i3+0x070]%asi,%l1	! %l1 = 2d4e2d3efd6932c2
!	%f16 = ffffffff ee0654aa, %f12 = 210bbf05 a0000000
	fabsd	%f16,%f12		! %f12 = 7fffffff ee0654aa

p1_label_49:
!	%f22 = 00000000 00000000, %f20 = bdecf989 2527715b
	fxtod	%f22,%f20		! %f20 = 00000000 00000000
!	%l3 = 6a5f8fb8a93a7120, %l4 = 0000000000003920, %l0 = ceac9d81db725781
	xor	%l3,%l4,%l0		! %l0 = 6a5f8fb8a93a4800
!	%l2 = 000000000000316f, %l3 = 6a5f8fb8a93a7120, %y  = fffff6e8
	umulcc	%l2,%l3,%l3		! %l3 = 000020ad8ffe2ce0, %ccr = 08
!	%l5 = 6e76800000000000, immed = fffffa24, %l4 = 0000000000003920
	xor	%l5,-0x5dc,%l4		! %l4 = 91897ffffffffa24
!	%l1 = 2d4e2d3efd6932c2, %l2 = 000000000000316f, %l4 = 91897ffffffffa24
	srlx	%l1,%l2,%l4		! %l4 = 0000000000005a9c

p1_label_50:
	set	p1_b49,%o7
	fblg,a	p1_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[00000000148001e0] = 8e735e1b 63ea3d1d 1bf2071e 65d02aa2
	prefetch [%i1+0x1e0],2
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x031,%g2
p1_b49:
	membar	#Sync			! Added by membar checker (219)
!	Mem[00000000150000b8] = f3e5469c, %l6 = 00000071, %l2 = 0000316f
	add	%i2,0xb8,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 00000000f3e5469c
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000008] = ffffffff, %l7 = ffffffffcfc0ffff
	ldswa	[%i2+%o6]0x80,%l7	! Annulled
p1_b50:

p1_label_51:
	membar	#Sync			! Added by membar checker (220)
!	Mem[0000000014000000] = 00000000, %l4 = 0000000000005a9c
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
	fbul,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetch [%o4+0x020],23
p1_b51:
	membar	#Sync			! Added by membar checker (221)
!	Branch On Register, %l6 = 0000000000000071
	brz,pn	%l6,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000015800000] = 00717a3d c4cb3c4d, %l2 = f3e5469c, %l3 = 8ffe2ce0
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 0000000000717a3d 00000000c4cb3c4d
p1_b52:

p1_label_52:
	membar	#Sync			! Added by membar checker (222)
!	%l6 = 0000000000000071, Mem[0000000030000018] = ffffa466
	stha	%l6,[%o0+0x018]%asi	! Mem[0000000030000018] = 0071a466
	fbuge,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014800000] = 027a0000d4694b0b, %l1 = 2d4e2d3efd6932c2
	ldxa	[%i1+%g0]0x80,%l1	! Annulled
p1_b53:
	membar	#Sync			! Added by membar checker (223)
!	Mem[00000000140000f8] = e34173498ffa4c18, %l1 = 2d4e2d3efd6932c2
	ldx	[%i0+0x0f8],%l1		! %l1 = e34173498ffa4c18
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08

p1_label_53:
!	Mem[0000000030800054] = e9ff5445, %l7 = ffffffffcfc0ffff
	lduw	[%o1+0x054],%l7		! Annulled
p1_b54:
	membar	#Sync			! Added by membar checker (224)
!	Mem[0000000014000018] = b70c4dbf, %l3 = 00000000c4cb3c4d
	lduwa	[%i0+0x018]%asi,%l3	! %l3 = 00000000b70c4dbf
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l4 = 0000000000000000, Mem[0000000015000000] = 00002a0d
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000015000000] = 00000000
p1_b55:
	bneg,a	p1_b56			! Branch Taken, %ccr = 08, CWP = 0

p1_label_54:
!	Mem[0000000031800019] = b208c56a, %l2 = 0000000000717a3d
	ldstub	[%o3+0x019],%l2		! %l2 = 0000000000000008
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x038,%g2
p1_b56:
	membar	#Sync			! Added by membar checker (225)
!	Mem[0000000014000008] = 0000303f, %l1 = e34173498ffa4c18
	lduba	[%i0+%o6]0x80,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, %l5 = 6e76800000000000, %l0 = 6a5f8fb8a93a4800
	taddcc	%l1,%l5,%l0		! %l0 = 6e76800000000000, %ccr = 04
!	%f25 = 56000000, %f15 = 56000000
	fcmps	%fcc2,%f25,%f15		! %fcc2 = 0
!	%l2 = 0000000000000008, %l2 = 0000000000000008, %l5 = 6e76800000000000
	and	%l2,%l2,%l5		! %l5 = 0000000000000008

p1_label_55:
!	Mem[0000000014000000] = 00000000 0000303f, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000 000000000000303f
	set	p1_b57,%o7
	fble,a	p1_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetch [%o4+0x000],4
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x039,%g2
p1_b57:
!	Registers modified during the branch to p1_far_1
!	%l0  = 0000000000000377
!	%l1  = 0000000000000000
!	%l3  = 00000000ffffffff
	ble,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031800010] = 2deec7085e4ef12a, %l2 = 0000000000000008
	ldx	[%o3+0x010],%l2		! Annulled
p1_b58:

p1_label_56:
	membar	#Sync			! Added by membar checker (226)
!	Mem[0000000015000000] = 00000000, %l4 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l6 = 00000071, %l7 = cfc0ffff, Mem[0000000015000008] = ffffffff ffffffff
	stda	%l6,[%i2+%o6]0x80	! Mem[0000000015000008] = 00000071 cfc0ffff
!	%l0 = 0000000000000377, %l0 = 0000000000000377, %l5 = 0000000000000008
	xorcc	%l0,%l0,%l5		! %l5 = 0000000000000000, %ccr = 44
!	Mem[0000000015000044] = 486df32f, %l1 = 00000000, %l4 = 00000000
	add	%i2,0x44,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000486df32f
	nop

p1_label_57:
!	Mem[0000000014000100] = b6ca26eb 3a4db76d 49dc16fb 1fb15864
	prefetch [%i0+0x100],21
	bne	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l5 = 0000000000000000, Mem[0000000015000008] = 00000071
	stba	%l5,[%i2+%o6]0x80	! Mem[0000000015000008] = 00000071
p1_b59:
	membar	#Sync			! Added by membar checker (227)
	set	p1_b60,%o7
	fbge,pt	%fcc2,p1_near_3_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000015800190] = 98481c4c bcba419c, %l4 = 486df32f, %l5 = 00000000
	ldd	[%i3+0x190],%l4		! %l4 = 0000000098481c4c 00000000bcba419c
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x03c,%g2
p1_b60:
!	Registers modified during the branch to p1_near_3
!	%l4  = 00000000ffffffff

p1_label_58:
	membar	#Sync			! Added by membar checker (228)
!	Mem[0000000030800058] = 00005ae4, %l6 = 0000000000000071
	ldsba	[%o1+0x05a]%asi,%l6	! %l6 = 000000000000005a
!	Mem[0000000015000120] = 2a5d7aa1 aef3a49b c85af542 060158c3
	prefetch [%i2+0x120],16
	fbule,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000031000050] = 360ca8e2, %l1 = 0000000000000000
	ldsw	[%o2+0x050],%l1		! Annulled
p1_b61:
	membar	#Sync			! Added by membar checker (229)
!	Mem[00000000140001c0] = 746627ee d55c0fa0 fff93f09 7688b7f3
	prefetch [%i0+0x1c0],16

p1_label_59:
	set	p1_b62,%o7
	fbule,a	p1_far_3_he	! Branch Taken, %fcc0 = 1
!	%l7 = ffffffffcfc0ffff, Mem[0000000014000000] = 000000000000303f
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000014000000] = ffffffffcfc0ffff
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x03e,%g2
p1_b62:
	membar	#Sync			! Added by membar checker (230)
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,22
	fbge,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l1 = 0000000000000000, Mem[0000000015000008] = 00000071
	stha	%l1,[%i2+%o6]0x80	! Mem[0000000015000008] = 00000071
p1_b63:

p1_label_60:
	fbe	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000158001d8] = 28c2fee43f0f9683, %l1 = 0000000000000000
	ldx	[%i3+0x1d8],%l1		! %l1 = 28c2fee43f0f9683
p1_b64:
	fbge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015800008] = 0000303f, %l2 = 0000000000000008
	swapa	[%i3+%o6]0x80,%l2	! %l2 = 000000000000303f
p1_b65:
	membar	#Sync			! Added by membar checker (231)
!	%f22 = 00000000 00000000, %f4  = 063f7733
	fdtos	%f22,%f4 		! %f4  = 00000000

p1_label_61:
!	Mem[0000000030800054] = e9ff5445, %l3 = 00000000ffffffff
	lduh	[%o1+0x054],%l3		! %l3 = 000000000000e9ff
!	Mem[0000000031000052] = 360ca8e2, %l0 = 0000000000000377
	ldstub	[%o2+0x052],%l0		! %l0 = 00000000000000a8
!	%f16 = ffffffff ee0654aa, %f20 = 00000000 00000000, %f2  = be63e46c 5281b70e
	fdivd	%f16,%f20,%f2 		! %f2  = ffffffff ee0654aa
!	Mem[0000000030000058] = 9f9c316f, %l2 = 000000000000303f
	swap	[%o0+0x058],%l2		! %l2 = 000000009f9c316f
!	Mem[0000000014800000] = 027a0000, %l5 = 00000000bcba419c
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000002

p1_label_62:
!	Mem[0000000014800000] = 027a0000, %l7 = ffffffffcfc0ffff
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000002
!	%f23 = 00000000, %f8  = 00000000, %f27 = ee0654aa
	fsubs	%f23,%f8 ,%f27		! %f27 = 00000000
!	%f22 = 00000000, %f8  = 00000000
	fitos	%f22,%f8 		! %f8  = 00000000
!	Mem[000000001480017f] = 80f34d21, %l6 = 000000000000005a
	ldstub	[%i1+0x17f],%l6		! %l6 = 0000000000000021
!	Mem[0000000031000054] = 09fd29f9, %l7 = 00000002, %l6 = 00000021
	add	%o2,0x54,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000009fd29f9

p1_label_63:
!	%l6 = 0000000009fd29f9, immed = 0000001e, %l4 = 00000000ffffffff
	sll	%l6,0x01e,%l4		! %l4 = 027f4a7e40000000
	set	p1_b66,%o7
	fblg,a	p1_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[00000000150001ff] = 3602b7ab, %l0 = 00000000000000a8
	ldstub	[%i2+0x1ff],%l0		! %l0 = 00000000000000ab
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x042,%g2
p1_b66:
!	Registers modified during the branch to p1_far_2
!	%l1  = 00000001fffff2a0
!	%l2  = fffffffffffffb2c
!	%l4  = 00000001fffff29e
!	%l6  = ffffffffffeaa6c5
	membar	#Sync			! Added by membar checker (232)
!	%l4 = 00000001fffff29e, immed = fffff9ec, %y  = 00000001
	sdivx	%l4,-0x614,%l2		! %l2 = ffffffffffabc377
!	%f22 = 00000000 00000000, %f28 = 00000000 00000000
	fdtox	%f22,%f28		! %f28 = 00000000 00000000

p1_label_64:
!	%l2 = ffffffffffabc377, immed = fffff972, %l3 = 000000000000e9ff
	addcc	%l2,-0x68e,%l3		! %l3 = ffffffffffabbce9, %ccr = 99
!	%l0 = 00000000000000ab, immed = 000009d9, %y  = 00000001
	smul	%l0,0x9d9,%l1		! %l1 = 00000000000693f3
!	%l5 = 0000000000000002, Mem[0000000015800128] = 5b445cc6cb082f18
	stxa	%l5,[%i3+0x128]%asi	! Mem[0000000015800128] = 0000000000000002
!	Mem[0000000031000058] = d88bfbac4baa4539, %l5 = 0000000000000002
	ldxa	[%o2+0x058]%asi,%l5	! %l5 = d88bfbac4baa4539
!	%l4 = 00000001fffff29e, %l5 = d88bfbac4baa4539, %y  = 00000000
	udiv	%l4,%l5,%l4		! %l4 = 0000000000000003

p1_label_65:
!	Mem[0000000030000050] = 00000001 00000001, %l2 = ffffffffffabc377, %l3 = ffffffffffabbce9
	add	%o0,0x50,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 4cf6a7115ae4ce67
	set	p1_b67,%o7
	fbo,a,pt %fcc0,p1_near_0_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000031800014] = 5e4ef12a, %l7 = 0000000000000002
	ldsh	[%o3+0x014],%l7		! %l7 = 0000000000005e4e
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x043,%g2
p1_b67:
!	Registers modified during the branch to p1_near_0
!	%l0  = 000000004c91a433
!	%l1  = 000000004c91a2b1
!	%l2  = 0000000000000f5b
!	%l4  = 00000000001c4ff2
!	%l5  = 0000000000000000
!	%l6  = 0000000000000027
	membar	#Sync			! Added by membar checker (233)
!	Mem[0000000015000008] = 00000071, %l3 = 4cf6a7115ae4ce67
	ldsha	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000000
	bg	p1_b68			! Branch Taken, %ccr = 00, CWP = 0

p1_label_66:
!	Mem[0000000015800160] = 70b1f18f, %l0 = 000000004c91a433
	ldsb	[%i3+0x161],%l0		! %l0 = ffffffffffffffb1
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x044,%g2
p1_b68:
	membar	#Sync			! Added by membar checker (234)
!	%l4 = 00000000001c4ff2, %l3 = 0000000000000000, %l1 = 000000004c91a2b1
	andn	%l4,%l3,%l1		! %l1 = 00000000001c4ff2
!	Mem[0000000031000010] = f802c030, %l6 = 0000000000000027
	ldsba	[%o2+0x010]%asi,%l6	! %l6 = fffffffffffffff8
!	%l2 = 0000000000000f5b, %l7 = 0000000000005e4e, %l2 = 0000000000000f5b
	sll	%l2,%l7,%l2		! %l2 = 0000000003d6c000
!	Mem[0000000015000054] = a4953edb, %l0 = ffffffffffffffb1
	swapa	[%i2+0x054]%asi,%l0	! %l0 = 00000000a4953edb

p1_label_67:
!	%f18 = 80000000 00000000, %f18 = 80000000 00000000, %f12 = 7fffffff ee0654aa
	faddd	%f18,%f18,%f12		! %f12 = 80000000 00000000
	bvc,a	p1_b69			! Branch Taken, %ccr = 00, CWP = 0
!	%l0 = 00000000a4953edb, Mem[000000003180001e] = 14f57e15
	sth	%l0,[%o3+0x01e]		! Mem[000000003180001c] = 14f53edb
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x045,%g2
p1_b69:
	membar	#Sync			! Added by membar checker (235)
!	%l0 = a4953edb, %l1 = 001c4ff2, Mem[0000000015000000] = 00000000 5ce6e472
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000015000000] = a4953edb 001c4ff2
!	Denormal Floating Point Operation Nullified
	nop

p1_label_68:
!	%l4 = 001c4ff2, %l5 = 00000000, Mem[0000000014800008] = 2cbd9c8b d402eada
	stda	%l4,[%i1+%o6]0x80	! Mem[0000000014800008] = 001c4ff2 00000000
	set	p1_b70,%o7
	fbl,a,pt %fcc3,p1_near_2_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000015800008] = 00000008, %l7 = 0000000000005e4e
	ldsba	[%i3+%o6]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x046,%g2
p1_b70:
!	Registers modified during the branch to p1_near_2
!	%l0  = 69cf8f8ad25ccf59
!	%l1  = fffffffffffff6cf
!	%l3  = 1f9a1884f6bf8b89
!	%l4  = 0000000003d6c7b1
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (236)
!	%f6  = 563195c4 57a97321, %f10 = 4d7da985 8b572294
	fmovd	%f6 ,%f10		! %f10 = 563195c4 57a97321
!	Mem[0000000030800056] = e9ff5445, %l1 = fffffffffffff6cf
	ldstuba	[%o1+0x056]%asi,%l1	! %l1 = 0000000000000054

p1_label_69:
!	%l6 = fffffffffffffff8, %l3 = 1f9a1884f6bf8b89, %l3 = 1f9a1884f6bf8b89
	subc	%l6,%l3,%l3		! %l3 = e065e77b0940746f
!	Mem[0000000031800018] = b2ffc56a, %l2 = 0000000003d6c000
	ldsba	[%o3+0x018]%asi,%l2	! %l2 = ffffffffffffffb2
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %l2 = ffffffffffffffb2
	tsubcc	%l7,%l7,%l2		! %l2 = 0000000000000000, %ccr = 44
	set	p1_b71,%o7
	fblg,a	p1_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[00000000150001c0] = 9c8d3c51 7308b43f f5564892 54b4ab09
	prefetch [%i2+0x1c0],21
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x047,%g2
p1_b71:
!	Registers modified during the branch to p1_far_1
!	%l0  = 69cf8f8ad25cda18
!	%l1  = 0000000000000824
!	%l7  = ffffffffffffffab

p1_label_70:
	fbuge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l3 = e065e77b0940746f, Mem[0000000031800010] = 2deec7085e4ef12a
	stx	%l3,[%o3+0x010]		! Mem[0000000031800010] = e065e77b0940746f
p1_b72:
	bge	p1_b73			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000030000054] = 5ae4ce67, %l4 = 0000000003d6c7b1
	ldsw	[%o0+0x054],%l4		! %l4 = 000000005ae4ce67
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x049,%g2
p1_b73:
	membar	#Sync			! Added by membar checker (237)
	fbue,pn	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2

p1_label_71:
!	Mem[0000000030800011] = a8ed04aa, %l6 = fffffffffffffff8
	ldstub	[%o1+0x011],%l6		! %l6 = 00000000000000ed
p1_b74:
	membar	#Sync			! Added by membar checker (238)
!	Mem[0000000015000120] = 2a5d7aa1 aef3a49b c85af542 060158c3
	prefetch [%i2+0x120],20
!	%f22 = 00000000 00000000, %f24 = c1b1f9ab 56000000, %f30 = 063f7733 210bbf05
	fsubd	%f22,%f24,%f30		! %f30 = 41b1f9ab 56000000
	set	p1_b75,%o7
	fbo,pt	%fcc2,p1_near_0_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000015800000] = 00717a3d, %l6 = 00000000000000ed
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000071
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x04b,%g2
p1_b75:
!	Registers modified during the branch to p1_near_0
!	%l0  = 00000000000075ea
!	%l1  = 0000000000000000

p1_label_72:
	membar	#Sync			! Added by membar checker (239)
!	%l3 = e065e77b0940746f, Mem[00000000158000d6] = 2e443ba6
	stba	%l3,[%i3+0x0d6]%asi	! Mem[00000000158000d4] = 2e446fa6
!	%l2 = 0000000000000000, Mem[0000000014800078] = 103465d9
	stwa	%l2,[%i1+0x078]%asi	! Mem[0000000014800078] = 00000000
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000068] = c83f5640d915231a, %l6 = 0000000000000071
	ldx	[%o4+0x068],%g2		! %g2 = c83f5640d915231a
p1_b76:
	membar	#Sync			! Added by membar checker (240)
!	Mem[0000000015800160] = 70b1f18f 8c080b19 efc20621 a142442c
	prefetcha [%i3+0x160]%asi,1

p1_label_73:
!	%f10 = 563195c4 57a97321, %f16 = ffffffff ee0654aa
	fcmpd	%fcc1,%f10,%f16		! %fcc1 = 3
!	Mem[0000000014000044] = 00000766, %l3 = e065e77b0940746f
	ldsw	[%i0+0x044],%l3		! %l3 = 0000000000000766
	fbe,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000014000180] = 0279de89 542084cd f7713b66 2115086c
	prefetch [%i0+0x180],1	! Annulled
p1_b77:
	membar	#Sync			! Added by membar checker (241)
!	%l2 = 0000000000000000, immed = fffff126, %l1 = 0000000000000000
	andn	%l2,-0xeda,%l1		! %l1 = 0000000000000000

p1_label_74:
	set	p1_b78,%o7
	fbo,pt	%fcc0,p1_near_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000014800000] = 027a0000, %l7 = ffffffffffffffab
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000027a0000
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x04e,%g2
p1_b78:
!	Registers modified during the branch to p1_near_1
!	%l2  = 0000000000000766
!	%l3  = 0000000000000766
!	%l5  = 0000000000000766
!	%l7  = fffffffffffff899
	membar	#Sync			! Added by membar checker (242)
!	%f20 = 00000000 00000000, %f25 = 56000000
	fdtos	%f20,%f25		! %f25 = 00000000
!	%l0 = 00000000000075ea, immed = 00000509, %l6 = 0000000000000071
	sub	%l0,0x509,%l6		! %l6 = 00000000000070e1
!	Mem[0000000016000008] = a50ef2c4, %l3 = 0000000000000766
	lduba	[%i4+%o6]0x80,%l3	! %l3 = 00000000000000a5

p1_label_75:
	bneg	p1_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000014800000] = ffffffab d4694b0b, %l4 = 5ae4ce67, %l5 = 00000766
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffffffab 00000000d4694b0b
p1_b79:
	ba,a	p1_b80			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[0000000015800000] = 00717a3d, %l0 = 00000000000075ea
	lduwa	[%i3+%g0]0x80,%l0	! Annulled
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x050,%g2
p1_b80:
	membar	#Sync			! Added by membar checker (243)
!	%f18 = 80000000, %f12 = 80000000
	fstoi	%f18,%f12		! %f12 = 00000000

p1_label_76:
!	%f24 = c1b1f9ab 00000000, %f10 = 563195c4 57a97321
	fdtox	%f24,%f10		! %f10 = ffffffff ee065500
!	%f20 = 00000000 00000000, %f28 = 00000000 00000000
	fxtod	%f20,%f28		! %f28 = 00000000 00000000
	bl	p1_b81			! Branch Taken, %ccr = 02, CWP = 0
!	%l4 = ffffffab, %l5 = d4694b0b, Mem[0000000015000000] = a4953edb 001c4ff2
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000015000000] = ffffffab d4694b0b
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x051,%g2
p1_b81:
	membar	#Sync			! Added by membar checker (244)
!	%l5 = 00000000d4694b0b, immed = 0000002a, %l0 = 00000000000075ea
	sllx	%l5,0x02a,%l0		! %l0 = a52c2c0000000000

p1_label_77:
!	%l2 = 0000000000000766, immed = 00000019, %l6 = 00000000000070e1
	srlx	%l2,0x019,%l6		! %l6 = 0000000000000000
	set	p1_b82,%o7
	fble,a,pn %fcc0,p1_near_1_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000014800008] = 001c4ff2, %l6 = 0000000000000000
	ldsha	[%i1+%o6]0x80,%l6	! %l6 = 000000000000001c
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x052,%g2
p1_b82:
!	Registers modified during the branch to p1_near_1
!	%l2  = 00000000000000a5
!	%l3  = 00000000000000a5
!	%l5  = 00000000000000a5
!	%l7  = ffffffff2b96b451
	membar	#Sync			! Added by membar checker (245)
!	%l0 = a52c2c0000000000, %l0 = a52c2c0000000000, %l0 = a52c2c0000000000
	srax	%l0,%l0,%l0		! %l0 = a52c2c0000000000
!	%f18 = 80000000 00000000, %f16 = ffffffff
	fdtos	%f18,%f16		! %f16 = 80000000

p1_label_78:
!	%f23 = 00000000, %f10 = ffffffff
	fmovs	%f23,%f10		! %f10 = 00000000
!	%l2 = 00000000000000a5, immed = fffff686, %l1 = 0000000000000000
	and	%l2,-0x97a,%l1		! %l1 = 0000000000000084
!	Mem[0000000030800050] = 283fe896e9ffff45, %l3 = 00000000000000a5
	ldx	[%o1+0x050],%l3		! %l3 = 283fe896e9ffff45
	ble,a	p1_b83			! Branch Taken, %ccr = 02, CWP = 0
!	%l2 = 000000a5, %l3 = e9ffff45, Mem[0000000031000010] = f802c030 1e6edb0b
	std	%l2,[%o2+0x010]	! Mem[0000000031000010] = 000000a5 e9ffff45
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x053,%g2
p1_b83:

p1_label_79:
	membar	#Sync			! Added by membar checker (246)
!	%f14 = c1b1f9ab 56000000, %f24 = c1b1f9ab
	fdtoi	%f14,%f24		! %f24 = ee0654aa
!	%f18 = 80000000 00000000, %f18 = 80000000 00000000, %f8  = 00000000 00000000
	fsubd	%f18,%f18,%f8 		! %f8  = 00000000 00000000
!	Branch On Register, %l6 = 000000000000001c
	brnz,pt	%l6,p1_b84		! Branch Taken
!	Mem[0000000014000008] = 0000303f, %l2 = 00000000000000a5
	ldsha	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x054,%g2
p1_b84:
	membar	#Sync			! Added by membar checker (247)
!	%l0 = a52c2c0000000000, immed = 00000d64, %l5 = 00000000000000a5
	subc	%l0,0xd64,%l5		! %l5 = a52c2bfffffff29c

p1_label_80:
!	%f4  = 00000000, %f18 = 80000000, %f17 = ee0654aa
	fmuls	%f4 ,%f18,%f17		! %f17 = 80000000
!	%f18 = 80000000 00000000, %f0  = 00000000 40000000
	fdtox	%f18,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000031000058] = d88bfbac 4baa4539, %l0 = 00000000, %l1 = 00000084
	ldd	[%o2+0x058],%l0		! %l0 = 00000000d88bfbac 000000004baa4539
!	%l2 = 0000000000000000, Mem[000000001500009c] = 85d6f6e9
	stw	%l2,[%i2+0x09c]		! Mem[000000001500009c] = 00000000
!	%l2 = 0000000000000000, immed = fffff6c0, %l2 = 0000000000000000
	xor	%l2,-0x940,%l2		! %l2 = fffffffffffff6c0

p1_label_81:
!	%f4  = 00000000 210bbf05, %f18 = 80000000 00000000
	fabsd	%f4 ,%f18		! %f18 = 00000000 210bbf05
!	%f21 = 00000000, %f14 = c1b1f9ab, %f28 = 00000000 00000000
	fsmuld	%f21,%f14,%f28		! %f28 = 80000000 00000000
!	%l4 = 00000000ffffffab, %l0 = 00000000d88bfbac, %l0 = 00000000d88bfbac
	orcc	%l4,%l0,%l0		! %l0 = 00000000ffffffaf, %ccr = 08
!	call to call_0, CWP = 0
	call	p1_call_0_he
!	Mem[0000000030800018] = 00000000, %l1 = 000000004baa4539
	ldub	[%o1+0x01a],%l1		! %l1 = 0000000000000000
!	Registers modified during the branch to p1_call_0
!	%l7  = 0000000000000b60

p1_label_82:
!	Mem[00000000150000e0] = e2b2675a 25766667 cbae3685 4c91a2b1
	prefetch [%i2+0x0e0],4
	fblg,a,pt %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l3 = 283fe896e9ffff45, Mem[0000000014000008] = 0000303f
	stha	%l3,[%i0+%o6]0x80	! Annulled
p1_b85:
	membar	#Sync			! Added by membar checker (248)
!	Mem[0000000031800018] = b2ffc56a, %l5 = a52c2bfffffff29c
	lduw	[%o3+0x018],%l5		! %l5 = 00000000b2ffc56a
!	%l2 = fffffffffffff6c0, immed = 00000662, %l6 = 000000000000001c
	tsubcc	%l2,0x662,%l6		! %l6 = fffffffffffff05e, %ccr = 8a

p1_label_83:
	set	p1_b86,%o7
	fbl	p1_far_0_he	! Branch Taken, %fcc0 = 1
!	%l6 = fffffffffffff05e, Mem[0000000014800124] = f8d69cef
	stw	%l6,[%i1+0x124]		! Mem[0000000014800124] = fffff05e
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x056,%g2
p1_b86:
!	Registers modified during the branch to p1_far_0
!	%l4  = 002cbff15a800000
!	%l6  = f5e0000000000000
	membar	#Sync			! Added by membar checker (249)
	fbe,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014000160] = ef1bea1d, %l4 = 002cbff15a800000
	lduw	[%i0+0x160],%l4		! %l4 = 00000000ef1bea1d
p1_b87:
	membar	#Sync			! Added by membar checker (250)
!	Mem[0000000031800058] = 00000001 00000001, %l0 = 00000000ffffffaf, %l1 = 0000000000000000
	add	%o3,0x58,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 2b37be4178f9c0f6

p1_label_84:
!	Mem[0000000015000000] = ffffffab, %l5 = 00000000b2ffc56a
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 00000000ffffffab
	set	p1_b88,%o7
	fbne,pn	%fcc3,p1_near_2_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000015800000] = 00717a3d, %l4 = 00000000ef1bea1d
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000717a3d
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x058,%g2
p1_b88:
!	Registers modified during the branch to p1_near_2
!	%l0  = ffffff5e000019a1
!	%l1  = f5dffffffffff6d7
!	%l3  = 0000fd1fffd7f470
!	%l4  = fffffffffffffe70
!	%l5  = 00000000ffffffab
	membar	#Sync			! Added by membar checker (251)
!	%f14 = c1b1f9ab 56000000, %f12 = 00000000 00000000
	fdtox	%f14,%f12		! %f12 = ffffffff ee0654aa
!	%f20 = 00000000, %f9  = 00000000
	fstoi	%f20,%f9 		! %f9  = 00000000

p1_label_85:
!	Mem[000000003100005c] = 4baa4539, %l2 = fffffffffffff6c0
	ldsha	[%o2+0x05c]%asi,%l2	! %l2 = 0000000000004baa
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],20
!	%l2 = 00004baa, %l3 = ffd7f470, Mem[0000000016000000] = 07ea04d4 b9fa1427
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000016000000] = 00004baa ffd7f470
	set	p1_b89,%o7
	fbo,a,pn %fcc3,p1_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[00000000148001a8] = 59f55304, %l6 = f5e0000000000000
	ldub	[%i1+0x1ab],%l6		! %l6 = 0000000000000004
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x059,%g2
p1_b89:
!	Registers modified during the branch to p1_near_3
!	%l3  = 0000000000000000

p1_label_86:
	membar	#Sync			! Added by membar checker (252)
!	%f0  = 00000000 00000000, %f20 = 00000000 00000000
	fnegd	%f0 ,%f20		! %f20 = 80000000 00000000
!	Mem[0000000015800000] = ef1bea1d, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ef1bea1d
!	%l4 = fffffffffffffe70, Mem[0000000014800008] = 001c4ff2
	stba	%l4,[%i1+%o6]0x80	! Mem[0000000014800008] = 701c4ff2
	nop
!	Mem[0000000015800020] = f46e630d, %l2 = 0000000000004baa
	lduh	[%i3+0x020],%l2		! %l2 = 000000000000f46e

p1_label_87:
!	%l5 = 00000000ffffffab, immed = 00000011, %l3 = 00000000ef1bea1d
	srl	%l5,0x011,%l3		! %l3 = 0000000000007fff
	set	p1_b90,%o7
	fbo,a	p1_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000014000008] = 0000303f, %l3 = 0000000000007fff
	lduwa	[%i0+%o6]0x80,%l3	! %l3 = 000000000000303f
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x05a,%g2
p1_b90:
!	Registers modified during the branch to p1_far_2
!	%l1  = fffff8fb00023870
!	%l2  = fffffd960000cd32
!	%l4  = fffff8fa000238c5
!	%l6  = 00000000783d05c1
	fbuge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001580012c] = 00000002, %l6 = 00000000783d05c1
	ldsb	[%i3+0x12d],%l6		! %l6 = 0000000000000000
p1_b91:

p1_label_88:
	membar	#Sync			! Added by membar checker (253)
!	%l0 = ffffff5e000019a1, %l1 = fffff8fb00023870, %l2 = fffffd960000cd32
	subc	%l0,%l1,%l2		! %l2 = 00000662fffde130
!	%l4 = fffff8fa000238c5, %l7 = 0000000000000b60, %y  = fffff8fa
	sdivx	%l4,%l7,%l4		! %l4 = ffffffff61ef1f24
!	Mem[00000000158000f0] = 6e3bfad0, %l6 = 0000000000000000
	ldsh	[%i3+0x0f2],%l6		! %l6 = fffffffffffffad0
!	%l2 = fffde130, %l3 = 0000303f, Mem[0000000014000130] = cc699881 c74eff0c
	std	%l2,[%i0+0x130]	! Mem[0000000014000130] = fffde130 0000303f
	fbn,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 3

p1_label_89:
!	%l4 = ffffffff61ef1f24, Mem[0000000014000144] = 532b64c8
	stw	%l4,[%i0+0x144]		! Annulled
p1_b92:
	ble,a	p1_not_taken_0		! Branch Not Taken, %ccr = 81
!	%l2 = fffde130, %l3 = 0000303f, Mem[0000000014800000] = ffffffab d4694b0b
	stda	%l2,[%i1+%g0]0x80	! Annulled
p1_b93:
	membar	#Sync			! Added by membar checker (254)
!	Mem[0000000016000000] = 00004baa, %l0 = ffffff5e000019a1
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000004baa
!	Mem[0000000014000068] = b8a2d46b, %l4 = ffffffff61ef1f24
	ldstub	[%i0+0x068],%l4		! %l4 = 00000000000000b8

p1_label_90:
	bcs,a	p1_b94			! Branch Taken, %ccr = 81, CWP = 0
!	Mem[0000000014000000] = ffffffffcfc0ffff, %l7 = 0000000000000b60
	ldxa	[%i0+%g0]0x80,%l7	! %l7 = ffffffffcfc0ffff
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x05e,%g2
p1_b94:
	membar	#Sync			! Added by membar checker (255)
!	%l2 = 00000662fffde130, Mem[0000000015800008] = 00000008
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000015800008] = e1300008
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000000] = ffffffabd4694b0b, %l6 = fffffffffffffad0
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = ffffffabd4694b0b
p1_b95:

p1_label_91:
	bleu,a	p1_b96			! Branch Taken, %ccr = 81, CWP = 0
!	%l7 = ffffffffcfc0ffff, Mem[0000000030000056] = 5ae4ce67
	sth	%l7,[%o0+0x056]		! Mem[0000000030000054] = 5ae4ffff
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x060,%g2
p1_b96:
	membar	#Sync			! Added by membar checker (256)
!	Branch On Register, %l3 = 000000000000303f
	brnz,pt	%l3,p1_b97		! Branch Taken
!	Mem[0000000015800008] = e1300008, %l6 = ffffffabd4694b0b
	ldstuba	[%i3+%o6]0x80,%l6	! %l6 = 00000000000000e1
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x061,%g2
p1_b97:
	membar	#Sync			! Added by membar checker (257)
!	%l5 = 00000000ffffffab, Mem[0000000015800000] = 00000000
	stba	%l5,[%i3+%g0]0x80	! Mem[0000000015800000] = ab000000

p1_label_92:
	fbge,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 3
!	%l5 = 00000000ffffffab, Mem[00000000140000f8] = e34173498ffa4c18
	stx	%l5,[%i0+0x0f8]		! Annulled
p1_b98:
	membar	#Sync			! Added by membar checker (258)
!	Branch On Register, %l2 = 00000662fffde130
	brz,a,pn %l2,p1_not_taken_0	! Branch Not Taken
!	Mem[00000000158000a0] = 14086a23 27026214 abb67908 57978915
	prefetch [%i3+0x0a0],3	! Annulled
p1_b99:
	membar	#Sync			! Added by membar checker (259)
!	%l3 = 000000000000303f, immed = ffffff7f, %y  = fffff8fa
	udivx	%l3,-0x081,%l2		! %l2 = 0000000000000000

p1_label_93:
!	%f0  = 00000000, %f22 = 00000000, %f27 = 00000000
	fmuls	%f0 ,%f22,%f27		! %f27 = 00000000
	bg	p1_b100			! Branch Taken, %ccr = 81, CWP = 0
!	%l3 = 000000000000303f, Mem[0000000014000000] = ffffffff
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000014000000] = 3fffffff
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x064,%g2
p1_b100:
	membar	#Sync			! Added by membar checker (260)
!	%l6 = 00000000000000e1, immed = fffff9f3, %l0 = 0000000000004baa
	or	%l6,-0x60d,%l0		! %l0 = fffffffffffff9f3
!	%l5 = 00000000ffffffab, Mem[0000000015800000] = ab000000c4cb3c4d
	stxa	%l5,[%i3+%g0]0x80	! Mem[0000000015800000] = 00000000ffffffab

p1_label_94:
!	%l1 = fffff8fb00023870, immed = fffffd3e, %y  = fffff8fa
	smulcc	%l1,-0x2c2,%l5		! %l5 = fffffffff9e05b20, %ccr = 88
!	Branch On Register, %l0 = fffffffffffff9f3
	brlez,a,pt %l0,p1_b101		! Branch Taken
!	Mem[0000000014000000] = 3fffffff, %l5 = fffffffff9e05b20
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 000000000000003f
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x065,%g2
p1_b101:
	membar	#Sync			! Added by membar checker (261)
!	Mem[0000000014800050] = 12e3c72f, %l1 = fffff8fb00023870
	ldsb	[%i1+0x051],%l1		! %l1 = ffffffffffffffe3
!	%f25 = 00000000, %f22 = 00000000
	fcmps	%fcc1,%f25,%f22		! %fcc1 = 0

p1_label_95:
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetch [%o4+0x000],22
	fbge,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000008] = 00000071, %l1 = ffffffffffffffe3
	ldstuba	[%i2+%o6]0x80,%l1	! Annulled
p1_b102:
	membar	#Sync			! Added by membar checker (262)
!	%l2 = 0000000000000000, %l3 = 000000000000303f, %y  = ffffffff
	mulx	%l2,%l3,%l6		! %l6 = 0000000000000000
	set	p1_b103,%o7
	fbne,pn	%fcc0,p1_near_0_he	! Branch Taken, %fcc0 = 1

p1_label_96:
!	Mem[0000000014000160] = ef1bea1d 53fa9e8f 69e34e4e 4b893b4e
	prefetch [%i0+0x160],20
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x067,%g2
p1_b103:
!	Registers modified during the branch to p1_near_0
!	%l0  = 000000004c91a433
!	%l1  = 000000004c91a2b1
!	%l2  = 00000000000008a4
!	%l4  = 00000000ffffffff
!	%l5  = 0000000000000000
!	%l6  = 0000000000000027
	membar	#Sync			! Added by membar checker (263)
!	%f23 = 00000000, %f18 = 00000000
	fstoi	%f23,%f18		! %f18 = 00000000
!	%f6  = 563195c4, %f19 = 210bbf05
	fcmpes	%fcc1,%f6 ,%f19		! %fcc1 = 2
!	Mem[0000000015800080] = 995cfb18 97128665 52f26b9f 5338b498
	prefetch [%i3+0x080],0
	bvs,a	p1_b104			! Branch Taken, %ccr = 0a, CWP = 0

p1_label_97:
!	Mem[0000000014800008] = 701c4ff2, %l3 = 000000000000303f
	ldswa	[%i1+%o6]0x80,%l3	! %l3 = 00000000701c4ff2
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x068,%g2
p1_b104:
!	call to call_0, CWP = 0
	call	p1_call_0_le
!	Mem[0000000015000000] = ffffffab, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffffab
!	Registers modified during the branch to p1_call_0
!	%l2  = 00000000303f0028
!	%l3  = fffffffffffff9b2
!	%l4  = 00000000dcf42d71
!	%l7  = fffffecfd2cd03d0
	membar	#Sync			! Added by membar checker (264)
!	%l7 = fffffecfd2cd03d0, immed = fffffc54, %l0 = 000000004c91a433
	subc	%l7,-0x3ac,%l0		! %l0 = fffffecfd2cd077c
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 8a

p1_label_98:
!	Mem[0000000015000180] = 81444acc 61f5cb7e 9aa91399 90eb632b
	prefetch [%i2+0x180],2
p1_b105:
	membar	#Sync			! Added by membar checker (265)
!	%f0  = 00000000 00000000, %f8  = 00000000 00000000
	fxtod	%f0 ,%f8 		! %f8  = 00000000 00000000
!	%l0 = fffffecfd2cd077c, immed = fffff873, %l5 = ffffffffffffffab
	and	%l0,-0x78d,%l5		! %l5 = fffffecfd2cd0070
!	Branch On Register, %l2 = 00000000303f0028
	brgez,a,pt %l2,p1_b106		! Branch Taken
!	Mem[0000000015000000] = ffffffab, %l1 = 000000004c91a2b1
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffffffab
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x06a,%g2
p1_b106:

p1_label_99:
	membar	#Sync			! Added by membar checker (266)
!	Mem[0000000031000050] = 360cffe209fd29f9, %l7 = fffffecfd2cd03d0
	ldx	[%o2+0x050],%l7		! %l7 = 360cffe209fd29f9
!	Mem[0000000015000168] = 9a65edfe 6505b94d, %l6 = 00000027, %l7 = 09fd29f9
	ldd	[%i2+0x168],%l6		! %l6 = 000000009a65edfe 000000006505b94d
!	%l0 = fffffecfd2cd077c, Mem[0000000014000080] = c2c77b52
	stwa	%l0,[%i0+0x080]%asi	! Mem[0000000014000080] = d2cd077c
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000030800018] = 00000000, %l4 = 00000000dcf42d71
	swap	[%o1+0x018],%l4		! Annulled
p1_b107:

p1_label_100:
	membar	#Sync			! Added by membar checker (267)
!	Branch On Register, %l7 = 000000006505b94d
	brgz,a,pt %l7,p1_b108		! Branch Taken
!	Mem[0000000015800000] = 00000000, %l2 = 00000000303f0028
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x06c,%g2
p1_b108:
	membar	#Sync			! Added by membar checker (268)
	set	p1_b109,%o7
	fbge,a,pn %fcc1,p1_near_0_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000031800054] = d0636e50, %l0 = fffffecfd2cd077c
	lduh	[%o3+0x054],%l0		! %l0 = 000000000000d063
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x06d,%g2
p1_b109:
!	Registers modified during the branch to p1_near_0
!	%l0  = 00000000000075ea
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (269)
!	%l5 = fffffecfd2cd0070, immed = fffff114, %y  = ffffffff
	sdiv	%l5,-0xeec,%l3		! %l3 = 0000000000030770

p1_label_101:
	set	p1_b110,%o7
	fbne,pn	%fcc3,p1_near_3_he	! Branch Taken, %fcc3 = 1
!	%l7 = 000000006505b94d, Mem[0000000015000000] = ffffffab
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000015000000] = 4dffffab
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x06e,%g2
p1_b110:
!	Registers modified during the branch to p1_near_3
!	%l4  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (270)
!	Mem[0000000030800010] = a8ff04aa 6017df28, %l0 = 000075ea, %l1 = 00000000
	ldd	[%o1+0x010],%l0		! %l0 = 00000000a8ff04aa 000000006017df28

	ba,a	p1_not_taken_0_end
p1_not_taken_0:
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba,a	p1_branch_failed
p1_not_taken_0_end:

	fbge,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000014000000] = 3fffffff, %l1 = 000000006017df28
	lduha	[%i0+%g0]0x80,%l1	! Annulled
p1_b111:

p1_label_102:
	membar	#Sync			! Added by membar checker (271)
!	%l0 = 00000000a8ff04aa, %l6 = 000000009a65edfe, %l4 = 00000000ffffffff
	subccc	%l0,%l6,%l4		! %l4 = 000000000e9916ac, %ccr = 00
	set	p1_b112,%o7
	fbug,a,pt %fcc1,p1_near_0_le	! Branch Taken, %fcc1 = 2
!	Mem[00000000158000c4] = 8a508cf5, %l4 = 000000000e9916ac
	lduh	[%i3+0x0c6],%l4		! %l4 = 0000000000008cf5
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x070,%g2
p1_b112:
!	Registers modified during the branch to p1_near_0
!	%l0  = 00000000000075ea
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (272)
!	%f0  = 00000000, %f15 = 56000000, %f11 = ee065500
	fsubs	%f0 ,%f15,%f11		! %f11 = d6000000
!	%l3 = 0000000000030770, %l5 = fffffecfd2cd0070, %l6 = 000000009a65edfe
	addcc	%l3,%l5,%l6		! %l6 = fffffecfd2d007e0, %ccr = 88

p1_label_103:
!	Mem[0000000014000008] = 0000303f, %l5 = fffffecfd2cd0070
	ldstuba	[%i0+%o6]0x80,%l5	! %l5 = 0000000000000000
!	%f28 = 80000000 00000000, %f26 = edf4e569 00000000, %f26 = edf4e569 00000000
	fdivd	%f28,%f26,%f26		! %f26 = 00000000 00000000
!	%l3 = 0000000000030770, immed = fffffde8, %l0 = 00000000000075ea
	orn	%l3,-0x218,%l0		! %l0 = 0000000000030777
	fbn,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000031000058] = d88bfbac, %l7 = 000000006505b94d
	ldsw	[%o2+0x058],%l7		! Annulled
p1_b113:

p1_label_104:
	bne	p1_b114			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000031000054] = 09fd29f9, %l1 = 0000000000000000
	ldsb	[%o2+0x057],%l1		! %l1 = fffffffffffffff9
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x072,%g2
p1_b114:
	membar	#Sync			! Added by membar checker (273)
!	%f18 = 00000000 210bbf05, %f6  = 563195c4 57a97321
	fxtod	%f18,%f6 		! %f6  = 41c085df 82800000
!	%l3 = 0000000000030770, %l4 = 0000000000008cf5, %l2 = 0000000000000000
	addcc	%l3,%l4,%l2		! %l2 = 0000000000039465, %ccr = 00
	bgu	p1_b115			! Branch Taken, %ccr = 00, CWP = 0

p1_label_105:
!	%l0 = 0000000000030777, Mem[0000000030800058] = 00005ae4
	stb	%l0,[%o1+0x058]		! Mem[0000000030800058] = 77005ae4
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x073,%g2
p1_b115:
	membar	#Sync			! Added by membar checker (274)
!	%f6  = 41c085df 82800000, %f30 = 41b1f9ab 56000000, %f22 = 00000000 00000000
	fsubd	%f6 ,%f30,%f22		! %f22 = 41ae2427 5e000000
!	%l0 = 00030777, %l1 = fffffff9, Mem[0000000014000000] = 3fffffff cfc0ffff
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000014000000] = 00030777 fffffff9
!	%l5 = 0000000000000000, %l2 = 0000000000039465, %l7 = 000000006505b94d
	srax	%l5,%l2,%l7		! %l7 = 0000000000000000
!	%l3 = 0000000000030770, %l2 = 0000000000039465, %y  = ffffffff
	udivx	%l3,%l2,%l2		! %l2 = 0000000000000000

p1_label_106:
!	%f5  = 210bbf05, %f2  = ffffffff
	fabss	%f5 ,%f2 		! %f2  = 210bbf05
!	Mem[0000000040000018] = ff5737ff beb4ff9d, %l2 = 00000000, %l3 = 00030770
	ldd	[%o5+0x018],%l2		! %l2 = 00000000ff5737ff 00000000beb4ff9d
!	Mem[000000001700014c] = e66442e2, %l3 = 00000000beb4ff9d
	lduba	[%i6+0x14f]%asi,%l3	! %l3 = 00000000000000e2
!	Mem[0000000014800028] = 625b73e0, %l6 = fffffecfd2d007e0
	lduha	[%i1+0x028]%asi,%l6	! %l6 = 000000000000625b
!	%l5 = 0000000000000000, Mem[0000000015800008] = ff300008
	stba	%l5,[%i3+%o6]0x80	! Mem[0000000015800008] = 00300008

p1_label_107:
!	%l7 = 0000000000000000, %l6 = 000000000000625b, %y  = ffffffff
	udivcc	%l7,%l6,%l1		! %l1 = 00000000ffffffff, %ccr = 0a
!	Mem[00000000148001a0] = 948f5dc1 da88b06d 59f55304 2ccb5eed
	prefetcha [%i1+0x1a0]%asi,1
!	%l4 = 0000000000008cf5
	sethi	%hi(0x741f6c00),%l4	! %l4 = 00000000741f6c00
!	%l0 = 0000000000030777, immed = 0000000d, %l2 = 00000000ff5737ff
	sll	%l0,0x00d,%l2		! %l2 = 0000000060eee000
	bcc	p1_b116			! Branch Taken, %ccr = 0a, CWP = 0

p1_label_108:
!	Mem[0000000015800000] = 00000000, %l0 = 0000000000030777
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x074,%g2
p1_b116:
	membar	#Sync			! Added by membar checker (275)
!	%l2 = 0000000060eee000
	sethi	%hi(0xaab5cc00),%l2	! %l2 = 00000000aab5cc00
	bvc	p1_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[0000000015800008] = 00300008, %l2 = 00000000aab5cc00
	lduba	[%i3+%o6]0x80,%l2	! %l2 = 0000000000000000
p1_b117:
	membar	#Sync			! Added by membar checker (276)
!	%l7 = 0000000000000000, immed = 00000d18, %l0 = 0000000000000000
	orcc	%l7,0xd18,%l0		! %l0 = 0000000000000d18, %ccr = 00

p1_label_109:
	bl	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[00000000150000bf] = 99867807, %l3 = 00000000000000e2
	ldstub	[%i2+0x0bf],%l3		! %l3 = 0000000000000007
p1_b118:
	membar	#Sync			! Added by membar checker (277)
!	%l3 = 0000000000000007, immed = fffff92f, %y  = ffffffff
	udiv	%l3,-0x6d1,%l5		! %l5 = 00000000ffffffff
!	%l4 = 00000000741f6c00, immed = 00000226, %l0 = 0000000000000d18
	or	%l4,0x226,%l0		! %l0 = 00000000741f6e26
	set	p1_b119,%o7
	fba,pn	%fcc1,p1_near_3_he	! Branch Taken, %fcc1 = 2

p1_label_110:
!	Mem[0000000014800000] = ffffffab, %l5 = 00000000ffffffff
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ffffffab
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x077,%g2
p1_b119:
!	Registers modified during the branch to p1_near_3
!	%l4  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (278)
!	Mem[0000000015800008] = 00300008, %l1 = 00000000ffffffff
	ldsba	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, %l1 = 0000000000000000, %l7 = 0000000000000000
	addccc	%l1,%l1,%l7		! %l7 = 0000000000000000, %ccr = 44
	bcs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l7 = 0000000000000000, Mem[0000000014800008] = 701c4ff2
	stwa	%l7,[%i1+%o6]0x80	! Annulled
p1_b120:

p1_label_111:
	membar	#Sync			! Added by membar checker (279)
!	%l4 = 00000000ffffffff, %l1 = 0000000000000000, %l6 = 000000000000625b
	sra	%l4,%l1,%l6		! %l6 = ffffffffffffffff
	set	p1_b121,%o7
	fbul	p1_far_2_he	! Branch Taken, %fcc0 = 1
!	%l0 = 00000000741f6e26, Mem[0000000015000008] = 00000071
	stba	%l0,[%i2+%o6]0x80	! Mem[0000000015000008] = 26000071
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x079,%g2
p1_b121:
	membar	#Sync			! Added by membar checker (280)
!	Mem[0000000015800004] = ffffffab, %l7 = 0000000000000000
	ldsw	[%i3+0x004],%l7		! %l7 = ffffffffffffffab
!	%l4 = 00000000ffffffff, Mem[0000000032000038] = b226fbb33ec07eee
	stx	%l4,[%o4+0x038]		! Mem[0000000032000038] = 00000000ffffffff

p1_label_112:
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000150000ac] = e0975bc1, %l5 = 00000000ffffffab
	ldsw	[%i2+0x0ac],%l5		! Annulled
p1_b122:
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000031800014] = 0940746f, %l3 = 0000000000000007
	lduw	[%o3+0x014],%l3		! %l3 = 000000000940746f
p1_b123:
	membar	#Sync			! Added by membar checker (281)
!	%f24 = ee0654aa, %f21 = 00000000
	fmovs	%f24,%f21		! %f21 = ee0654aa

p1_label_113:
!	%f0  = 00000000, %f27 = 00000000
	fstoi	%f0 ,%f27		! %f27 = 00000000
	set	p1_b124,%o7
	fbul,pn	%fcc0,p1_near_0_le	! Branch Taken, %fcc0 = 1
!	%l2 = 0000000000000000, Mem[0000000014000008] = ff00303f52aa9b1c
	stxa	%l2,[%i0+%o6]0x80	! Mem[0000000014000008] = 0000000000000000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x07c,%g2
p1_b124:
!	Registers modified during the branch to p1_near_0
!	%l0  = 00000000000075ea
!	%l1  = 0000000000000000
!	%l3  = 00000000000075be
	membar	#Sync			! Added by membar checker (282)
!	Mem[0000000015800048] = 74daeda8e1d6ae90, %l1 = 0000000000000000
	ldx	[%i3+0x048],%l1		! %l1 = 74daeda8e1d6ae90
!	%l1 = 74daeda8e1d6ae90, immed = 00000019, %l2 = 0000000000000000
	srl	%l1,0x019,%l2		! %l2 = 0000000000000070

p1_label_114:
	set	p1_b125,%o7
	fbug,pn	%fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000031000054] = 09fd29f9, %l1 = 74daeda8e1d6ae90
	swap	[%o2+0x054],%l1		! %l1 = 0000000009fd29f9
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x07d,%g2
p1_b125:
!	Registers modified during the branch to p1_near_2
!	%l6  = 00000000283fe896
!	%l7  = 00000000e9ffff45
	membar	#Sync			! Added by membar checker (283)
!	%f12 = ffffffff ee0654aa, %f24 = ee0654aa 00000000, %f12 = ffffffff ee0654aa
	fmuld	%f12,%f24,%f12		! %f12 = ffffffff ee0654aa
!	%l1 = 0000000009fd29f9, Mem[0000000015000198] = ec65b5d6c2cca23b
	stx	%l1,[%i2+0x198]		! Mem[0000000015000198] = 0000000009fd29f9
!	%l2 = 0000000000000070, %l3 = 00000000000075be, %l0 = 00000000000075ea
	srlx	%l2,%l3,%l0		! %l0 = 0000000000000000

p1_label_115:
!	%l6 = 00000000283fe896, %l2 = 0000000000000070, %l1 = 0000000009fd29f9
	tsubcc	%l6,%l2,%l1		! %l1 = 00000000283fe826, %ccr = 02
	set	p1_b126,%o7
	fbl	p1_far_1_he	! Branch Taken, %fcc0 = 1
!	%l6 = 283fe896, %l7 = e9ffff45, Mem[0000000014800000] = ffffffab d4694b0b
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000014800000] = 283fe896 e9ffff45
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x07e,%g2
p1_b126:
!	Registers modified during the branch to p1_far_1
!	%l0  = 00000000283febd6
!	%l1  = 0000000000000000
!	%l3  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (284)
!	%f28 = 80000000 00000000, %f6  = 41c085df 82800000
	fmovd	%f28,%f6 		! %f6  = 80000000 00000000
!	%f9  = 00000000, %f23 = 5e000000
	fitos	%f9 ,%f23		! %f23 = 00000000

p1_label_116:
!	Mem[00000000150000e0] = e2b2675a 25766667 cbae3685 4c91a2b1
	prefetch [%i2+0x0e0],1
!	Branch On Register, %l4 = 00000000ffffffff
	brnz,a,pt %l4,p1_b127		! Branch Taken
!	Mem[0000000014800174] = 07f3f6da, %l7 = 00000000e9ffff45
	lduw	[%i1+0x174],%l7		! %l7 = 0000000007f3f6da
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x07f,%g2
p1_b127:
	membar	#Sync			! Added by membar checker (285)
	fbe,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetch [%o4+0x020],16	! Annulled
p1_b128:

p1_label_117:
	membar	#Sync			! Added by membar checker (286)
	fbu,a,pt %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l5 = 00000000ffffffab, Mem[0000000030000057] = 5ae4ffff
	stb	%l5,[%o0+0x057]		! Annulled
p1_b129:
	membar	#Sync			! Added by membar checker (287)
!	Mem[000000001400018c] = 2115086c, %l1 = 0000000000000000
	lduh	[%i0+0x18c],%l1		! %l1 = 0000000000002115
!	%l7 = 0000000007f3f6da, %l0 = 00000000283febd6, %l2 = 0000000000000070
	xnorcc	%l7,%l0,%l2		! %l2 = ffffffffd033e2f3, %ccr = 88
!	Mem[0000000015000060] = 6ef78fe2 07efa77b
	flush	%i2+0x060

p1_label_118:
!	%f22 = 41ae2427 00000000, %f0  = 00000000
	fdtoi	%f22,%f0 		! %f0  = 0f121380
	set	p1_b130,%o7
	fblg,a,pt %fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000031000018] = dad84bcb, %l5 = 00000000ffffffab
	ldsw	[%o2+0x018],%l5		! %l5 = ffffffffdad84bcb
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x082,%g2
p1_b130:
!	Registers modified during the branch to p1_near_2
!	%l6  = 00000000283fe896
!	%l7  = 00000000e9ffff45
	membar	#Sync			! Added by membar checker (288)
!	%l3 = 00000000ffffffff, Mem[0000000015800000] = ff000000ffffffab
	stxa	%l3,[%i3+%g0]0x80	! Mem[0000000015800000] = 00000000ffffffff
!	%f16 = 80000000 80000000, %f16 = 80000000 80000000
	fabsd	%f16,%f16		! %f16 = 00000000 80000000

p1_label_119:
!	%l1 = 0000000000002115, Mem[0000000014800000] = 283fe896e9ffff45
	stxa	%l1,[%i1+0x000]%asi	! Mem[0000000014800000] = 0000000000002115
!	Branch On Register, %l5 = ffffffffdad84bcb
	brlz,pn	%l5,p1_b131		! Branch Taken
!	Mem[0000000031000050] = 360cffe2 e1d6ae90, %l2 = d033e2f3, %l3 = ffffffff
	ldd	[%o2+0x050],%l2		! %l2 = 00000000360cffe2 00000000e1d6ae90
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x083,%g2
p1_b131:
	ble	p1_b132			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000014800050] = 12e3c72f, %l1 = 0000000000002115
	ldsw	[%i1+0x050],%l1		! %l1 = 0000000012e3c72f
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x084,%g2
p1_b132:

p1_label_120:
	membar	#Sync			! Added by membar checker (289)
!	%l6 = 00000000283fe896, %l0 = 00000000283febd6, %y  = ffffffff
	udivcc	%l6,%l0,%l3		! %l3 = 00000000ffffffff, %ccr = 0a
!	%l1 = 0000000012e3c72f, Mem[0000000031800014] = 0940746f
	sth	%l1,[%o3+0x014]		! Mem[0000000031800014] = c72f746f
!	%f0  = 0f121380 00000000, %f8  = 00000000 00000000
	fabsd	%f0 ,%f8 		! %f8  = 0f121380 00000000
!	%f2  = 210bbf05 ee0654aa, %f26 = 00000000 00000000, %f30 = 41b1f9ab 56000000
	fmuld	%f2 ,%f26,%f30		! %f30 = 00000000 00000000
!	%l2 = 00000000360cffe2, Mem[000000003000005d] = bc1da8ed
	stb	%l2,[%o0+0x05d]		! Mem[000000003000005c] = bce2a8ed

p1_label_121:
	bge,a	p1_b133			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000014800180] = 6c227dbd 07de27e1 edd2d38d 97f11f4d
	prefetch [%i1+0x180],22
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x085,%g2
p1_b133:
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000080] = 21673448 9acd82a5 1c391fa5 04431e90
	prefetch [%i2+0x080],4
p1_b134:
	membar	#Sync			! Added by membar checker (290)
!	Mem[0000000015800000] = 00000000 ffffffff 00300008 7b473112
	prefetch [%i3+0x000],16

p1_label_122:
!	Mem[0000000015800008] = 00300008, %l2 = 00000000360cffe2
	lduha	[%i3+%o6]0x80,%l2	! %l2 = 0000000000000030
!	Mem[0000000014800008] = 701c4ff2, %l0 = 00000000283febd6
	lduha	[%i1+%o6]0x80,%l0	! %l0 = 000000000000701c
	fbn,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l7 = 00000000e9ffff45, Mem[0000000014000000] = 00030777fffffff9
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000014000000] = 00000000e9ffff45
p1_b135:
	membar	#Sync			! Added by membar checker (291)
!	%l1 = 0000000012e3c72f, immed = 000001f3, %l3 = 00000000ffffffff
	subc	%l1,0x1f3,%l3		! %l3 = 0000000012e3c53c

p1_label_123:
!	Mem[0000000031800050] = e22ade79 d0636e50, %l2 = 00000030, %l3 = 12e3c53c
	ldd	[%o3+0x050],%l2		! %l2 = 00000000e22ade79 00000000d0636e50
!	Mem[000000003100001b] = dad84bcb, %l2 = 00000000e22ade79
	ldstuba	[%o2+0x01b]%asi,%l2	! %l2 = 00000000000000cb
	bvc,a	p1_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[00000000148000b0] = d9d5e177, %l3 = 00000000d0636e50
	ldub	[%i1+0x0b1],%l3		! Annulled
p1_b136:
	membar	#Sync			! Added by membar checker (292)
!	%l5 = ffffffffdad84bcb, immed = 0000002e, %l7 = 00000000e9ffff45
	sllx	%l5,0x02e,%l7		! %l7 = 12f2c00000000000

p1_label_124:
	bcs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 0a
!	%l5 = ffffffffdad84bcb, Mem[0000000014000008] = 00000000
	stwa	%l5,[%i0+%o6]0x80	! Annulled
p1_b137:
	membar	#Sync			! Added by membar checker (293)
!	%l0 = 000000000000701c, %l5 = ffffffffdad84bcb, %l1 = 0000000012e3c72f
	sra	%l0,%l5,%l1		! %l1 = 000000000000000e
!	%l4 = 00000000ffffffff, %l1 = 000000000000000e, %l0 = 000000000000701c
	andn	%l4,%l1,%l0		! %l0 = 00000000fffffff1
!	Mem[00000000148000e0] = 00000000 00000377
	flush	%i1+0x0e0

p1_label_125:
	fbug,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015800008] = 00300008, %l2 = 00000000000000cb
	lduha	[%i3+%o6]0x80,%l2	! Annulled
p1_b138:
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 0a
!	%l6 = 00000000283fe896, Mem[00000000168000e5] = d002fc0d
	stb	%l6,[%i5+0x0e5]		! Mem[00000000168000e4] = d096fc0d
p1_b139:
	membar	#Sync			! Added by membar checker (294)
	fbg,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1

p1_label_126:
!	Mem[0000000015000008] = 26000071, %l7 = 12f2c00000000000
	lduba	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000026
p1_b140:
	membar	#Sync			! Added by membar checker (295)
!	%l0 = 00000000fffffff1, %l0 = 00000000fffffff1, %y  = ffffffff
	udivcc	%l0,%l0,%l5		! %l5 = 00000000ffffffff, %ccr = 0a
	nop
!	%f1  = 00000000, %f6  = 80000000 00000000
	fstox	%f1 ,%f6 		! %f6  = 00000000 00000000
!	%l3 = 00000000d0636e50, immed = 000004a9, %y  = ffffffff
	sdiv	%l3,0x4a9,%l0		! %l0 = fffffffffff5c884

p1_label_127:
	fbule,a,pn %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	%l3 = 00000000d0636e50, Mem[0000000017000008] = 3cafd8a2
	stha	%l3,[%i6+%o6]0x80	! Annulled
p1_b141:
	membar	#Sync			! Added by membar checker (296)
!	%l4 = 00000000ffffffff, Mem[0000000015800160] = 70b1f18f8c080b19
	stxa	%l4,[%i3+0x160]%asi	! Mem[0000000015800160] = 00000000ffffffff
!	%l1 = 000000000000000e, %l0 = fffffffffff5c884, %l0 = fffffffffff5c884
	addc	%l1,%l0,%l0		! %l0 = fffffffffff5c892
!	Mem[0000000030800010] = a8ff04aa, %l1 = 000000000000000e
	ldstub	[%o1+0x010],%l1		! %l1 = 00000000000000a8

p1_label_128:
!	Mem[0000000014800070] = f28f6ab3, %l5 = 00000000ffffffff
	ldsha	[%i1+0x072]%asi,%l5	! %l5 = 0000000000006ab3
!	%l7 = 0000000000000026, %l3 = 00000000d0636e50, %l5 = 0000000000006ab3
	tsubcc	%l7,%l3,%l5		! %l5 = ffffffff2f9c91d6, %ccr = 93
!	Mem[0000000031000018] = dad84bff, %l1 = 00000000000000a8
	swapa	[%o2+0x018]%asi,%l1	! %l1 = 00000000dad84bff
!	%l5 = ffffffff2f9c91d6, %l1 = 00000000dad84bff, %l5 = ffffffff2f9c91d6
	andncc	%l5,%l1,%l5		! %l5 = ffffffff25049000, %ccr = 80
!	Mem[0000000031000014] = e9ffff45, %l0 = fffffffffff5c892
	lduw	[%o2+0x014],%l0		! %l0 = 00000000e9ffff45

p1_label_129:
	fbge,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000148001e0] = 8e735e1b 63ea3d1d 1bf2071e 65d02aa2
	prefetch [%i1+0x1e0],1	! Annulled
p1_b142:
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000014800098] = ff14cb752e4e80e8, %l1 = 00000000dad84bff
	ldx	[%i1+0x098],%l1		! %l1 = ff14cb752e4e80e8
p1_b143:
	membar	#Sync			! Added by membar checker (297)
!	%l6 = 00000000283fe896, Mem[00000000168000eb] = fa3d57b0
	stba	%l6,[%i5+0x0eb]%asi	! Mem[00000000168000e8] = fa3d5796

p1_label_130:
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000015000000] = 4dffffab d4694b0b, %l2 = 000000cb, %l3 = d0636e50
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 000000004dffffab 00000000d4694b0b
p1_b144:
	membar	#Sync			! Added by membar checker (298)
!	%l2 = 000000004dffffab, immed = fffff747, %l6 = 00000000283fe896
	xorcc	%l2,-0x8b9,%l6		! %l6 = ffffffffb20008ec, %ccr = 88
!	Mem[0000000014800008] = 701c4ff2 00000000, %l4 = ffffffff, %l5 = 25049000
	ldda	[%i1+%o6]0x80,%l4	! %l4 = 00000000701c4ff2 0000000000000000
!	%l4 = 00000000701c4ff2, immed = fffff516, %l6 = ffffffffb20008ec
	orncc	%l4,-0xaea,%l6		! %l6 = 00000000701c4ffb, %ccr = 00

p1_label_131:
	bvc,a	p1_b145			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000015800140] = 18ea91bf, %l3 = 00000000d4694b0b
	swap	[%i3+0x140],%l3		! %l3 = 0000000018ea91bf
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x091,%g2
p1_b145:
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000014000000] = 00000000, %l6 = 00000000701c4ffb
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
p1_b146:
	membar	#Sync			! Added by membar checker (299)
!	%l6 = 00000000, %l7 = 00000026, Mem[0000000032000078] = ebde9552 17df7ad6
	std	%l6,[%o4+0x078]	! Mem[0000000032000078] = 00000000 00000026

p1_label_132:
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014000180] = 0279de89 542084cd f7713b66 2115086c
	prefetch [%i0+0x180],23	! Annulled
p1_b147:
	ba	p1_b148			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],3
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x094,%g2
p1_b148:
	membar	#Sync			! Added by membar checker (300)
!	%l1 = ff14cb752e4e80e8, %l4 = 00000000701c4ff2, %y  = ffffffff
	smulcc	%l1,%l4,%l5		! %l5 = 14477771995d7350, %ccr = 08

p1_label_133:
	bgu,a	p1_b149			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000014800150] = 7d615c28, %l2 = 000000004dffffab
	ldsh	[%i1+0x152],%l2		! %l2 = 0000000000005c28
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p1_branch_failed
	mov	0x095,%g2
p1_b149:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l3 = 0000000018ea91bf, Mem[0000000015800000] = 00000000
	stba	%l3,[%i3+%g0]0x80	! Annulled
p1_b150:
	membar	#Sync			! Added by membar checker (301)
	fbn,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1

p1_label_134:
!	Mem[0000000014800000] = 00000000, %l0 = 00000000e9ffff45
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
p1_b151:
	membar	#Sync			! Added by membar checker (302)
!	Mem[000000003080005c] = bdc5e552, %l7 = 0000000000000026
	ldub	[%o1+0x05f],%l7		! %l7 = 0000000000000052
	fbul,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000014000160] = ef1bea1d 53fa9e8f 69e34e4e 4b893b4e
	prefetch [%i0+0x160],23
p1_b152:
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08

p1_label_135:
!	%l6 = 0000000000000000, Mem[00000000150000d4] = 6089a92c
	stw	%l6,[%i2+0x0d4]		! Annulled
p1_b153:
	membar	#Sync			! Added by membar checker (303)
	set	p1_b154,%o7
	fbule,a,pt %fcc2,p1_near_0_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000014000120] = 395e6662 831086a3 b5fc62ff 6e1761aa
	prefetch [%i0+0x120],2
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x09a,%g2
p1_b154:
!	Registers modified during the branch to p1_near_0
!	%l0  = 000000004c91a433
!	%l1  = 000000004c91a2b1
!	%l2  = 0000000000000eb1
!	%l4  = 00000000ffffffff
!	%l5  = 0000000000000000
!	%l6  = 0000000000000027
	membar	#Sync			! Added by membar checker (304)
!	%l5 = 0000000000000000, Mem[0000000015800008] = 003000087b473112
	stxa	%l5,[%i3+%o6]0x80	! Mem[0000000015800008] = 0000000000000000
!	%l4 = 00000000ffffffff, %l0 = 000000004c91a433, %l4 = 00000000ffffffff
	andn	%l4,%l0,%l4		! %l4 = 00000000b36e5bcc

p1_label_136:
!	%f26 = 00000000 00000000, %f5  = 210bbf05
	fxtos	%f26,%f5 		! %f5  = 00000000
!	Mem[00000000158000e8] = 47f2c8a1, %l0 = 000000004c91a433
	ldsb	[%i3+0x0e9],%l0		! %l0 = fffffffffffffff2
!	%f20 = 80000000 ee0654aa, %f8  = 0f121380 00000000
	fabsd	%f20,%f8 		! %f8  = 00000000 ee0654aa
	fbge,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014800000] = 00000000 00002115, %l0 = fffffff2, %l1 = 4c91a2b1
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000002115
p1_b155:

p1_label_137:
	membar	#Sync			! Added by membar checker (305)
!	Mem[0000000015000000] = 4dffffab, %l4 = 00000000b36e5bcc
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000000000004d
!	%f1  = 00000000, %f22 = 41ae2427 00000000
	fstod	%f1 ,%f22		! %f22 = 00000000 00000000
!	Mem[0000000030000010] = 0c19b02e, %l2 = 0000000000000eb1
	swap	[%o0+0x010],%l2		! %l2 = 000000000c19b02e
	set	p1_b156,%o7
	fbe,pn	%fcc2,p1_near_1_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000014800008] = 701c4ff2, %l5 = 0000000000000000
	ldstuba	[%i1+%o6]0x80,%l5	! %l5 = 0000000000000070
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x09c,%g2
p1_b156:
!	Registers modified during the branch to p1_near_1
!	%l0  = fffffffffffff04c
!	%l3  = 0000000000000000
!	%l4  = 0000000021150027
!	%l5  = 0000000021150000

p1_label_138:
	membar	#Sync			! Added by membar checker (306)
!	%l5 = 0000000021150000, %l0 = fffffffffffff04c, %y  = 14477771
	sdivcc	%l5,%l0,%l1		! %l1 = ffffffff80000000, %ccr = 8a
!	Mem[00000000158000c0] = 15ebe2cc 8a508cf5 7fe18ac9 3bfa145a
	prefetch [%i3+0x0c0],23
!	%f30 = 00000000, %f13 = ee0654aa
	fabss	%f30,%f13		! %f13 = 00000000
!	%l2 = 0c19b02e, %l3 = 00000000, Mem[0000000014800008] = ff1c4ff2 00000000
	stda	%l2,[%i1+%o6]0x80	! Mem[0000000014800008] = 0c19b02e 00000000
	fbge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1

p1_label_139:
!	Mem[0000000016000158] = 733df7f4c1f5ca26, %l3 = 0000000000000000
	ldx	[%i4+0x158],%l3		! %l3 = 733df7f4c1f5ca26
p1_b157:
	bge,a	p1_b158			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000014000160] = ef1bea1d 53fa9e8f 69e34e4e 4b893b4e
	prefetch [%i0+0x160],20
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x09e,%g2
p1_b158:
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000008] = 26000071, %l6 = 0000000000000027
	ldsba	[%i2+%o6]0x80,%l6	! %l6 = 0000000000000026
p1_b159:

p1_label_140:
	membar	#Sync			! Added by membar checker (307)
!	%l7 = 0000000000000052, Mem[0000000031800018] = b2ffc56a
	stw	%l7,[%o3+0x018]		! Mem[0000000031800018] = 00000052
	fbug,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[00000000148001ec] = 65d02aa2, %l3 = 733df7f4c1f5ca26
	lduh	[%i1+0x1ec],%l3		! Annulled
p1_b160:
	membar	#Sync			! Added by membar checker (308)
!	Mem[0000000014000008] = 00000000, %l6 = 0000000000000026
	lduwa	[%i0+%o6]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000014800008] = 0c19b02e, %l5 = 0000000021150000
	ldsba	[%i1+%o6]0x80,%l5	! %l5 = 000000000000000c

p1_label_141:
!	%l4 = 0000000021150027, %l6 = 0000000000000000, %l3 = 733df7f4c1f5ca26
	andcc	%l4,%l6,%l3		! %l3 = 0000000000000000, %ccr = 44
	set	p1_b161,%o7
	fbl,pt	%fcc3,p1_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000014000158] = cd8ed7e0, %l1 = ffffffff80000000
	ldsw	[%i0+0x158],%l1		! %l1 = ffffffffcd8ed7e0
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0a1,%g2
p1_b161:
!	Registers modified during the branch to p1_near_3
!	%l3  = 0000000000000000
	membar	#Sync			! Added by membar checker (309)
!	Mem[0000000032000020] = 63674631, %l4 = 0000000021150027
	lduba	[%o4+0x022]%asi,%g2	! %g2 = 0000000000000063
!	%f31 = 00000000, %f18 = 00000000 210bbf05
	fstox	%f31,%f18		! %f18 = 00000000 00000000

p1_label_142:
!	%l2 = 000000000c19b02e, %l7 = 0000000000000052, %l4 = 0000000021150027
	or	%l2,%l7,%l4		! %l4 = 000000000c19b07e
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l0 = fffffffffffff04c, Mem[0000000016000000] = 00004baa
	stba	%l0,[%i4+%g0]0x80	! Annulled
p1_b162:
	membar	#Sync			! Added by membar checker (310)
!	Mem[0000000015000000] = ffffffab, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffffab
	bpos,a	p1_b163			! Branch Taken, %ccr = 44, CWP = 0

p1_label_143:
!	%l6 = ffffffffffffffab, Mem[0000000016000190] = 6a15e25d
	stw	%l6,[%i4+0x190]		! Mem[0000000016000190] = ffffffab
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0a3,%g2
p1_b163:
	membar	#Sync			! Added by membar checker (311)
!	Mem[0000000014000008] = 00000000, %l0 = fffffffffffff04c
	lduba	[%i0+%o6]0x80,%l0	! %l0 = 0000000000000000
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014000160] = ef1bea1d 53fa9e8f 69e34e4e 4b893b4e
	prefetch [%i0+0x160],2	! Annulled
p1_b164:
	membar	#Sync			! Added by membar checker (312)
!	%l3 = 0000000000000000, %l1 = ffffffffcd8ed7e0, %l0 = 0000000000000000
	subc	%l3,%l1,%l0		! %l0 = 0000000032712820

p1_label_144:
!	%l1 = ffffffffcd8ed7e0, immed = 0000000c, %l7 = 0000000000000052
	srl	%l1,0x00c,%l7		! %l7 = 00000000000cd8ed
!	%f23 = 00000000, %f27 = 00000000
	fnegs	%f23,%f27		! %f27 = 80000000
	bgu,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000148000b0] = d9d5e177, %l3 = 0000000000000000
	lduh	[%i1+0x0b2],%l3		! Annulled
p1_b165:
	membar	#Sync			! Added by membar checker (313)
!	Mem[0000000015800060] = a554a944 41469f2d 8e9de251 24c6e480
	prefetcha [%i3+0x060]%asi,3

p1_label_145:
!	Mem[0000000015000040] = d9fa63b5 486df32f 76fe9a5d e5462962
	prefetcha [%i2+0x040]%asi,22
	be	p1_b166			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[00000000148000e0] = 00000000 00000377 0c80db72 6238bc36
	prefetch [%i1+0x0e0],16
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0a6,%g2
p1_b166:
	fbue,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 000000000c19b02e, Mem[0000000015000108] = 4d5beba3a49b83c9
	stx	%l2,[%i2+0x108]		! Annulled
p1_b167:

p1_label_146:
	membar	#Sync			! Added by membar checker (314)
!	Mem[0000000014000188] = f7713b66, %l7 = 00000000000cd8ed
	lduha	[%i0+0x18a]%asi,%l7	! %l7 = 0000000000003b66
!	Mem[0000000016800020] = 70ed594b ae8feb97 056f04e2 ab0dc710
	prefetcha [%i5+0x020]%asi,20
!	%l2 = 000000000c19b02e, immed = 00000fd7, %y  = 14477771
	sdivcc	%l2,0xfd7,%l6		! %l6 = 000000007fffffff, %ccr = 02
!	Branch On Register, %l5 = 000000000000000c
	brgez,pn %l5,p1_b168		! Branch Taken
!	Mem[0000000030800018] = 000000007568b7b5, %l4 = 000000000c19b07e
	ldx	[%o1+0x018],%l4		! %l4 = 000000007568b7b5
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0a8,%g2
p1_b168:

p1_label_147:
	membar	#Sync			! Added by membar checker (315)
!	Mem[0000000014800044] = 1ea53b82, %l4 = 000000007568b7b5
	ldsha	[%i1+0x044]%asi,%l4	! %l4 = 0000000000001ea5
!	%f14 = c1b1f9ab 56000000, %f4  = 00000000 00000000
	fmovd	%f14,%f4 		! %f4  = c1b1f9ab 56000000
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,0
!	Mem[000000003000005c] = bce2a8ed, %l0 = 0000000032712820
	swap	[%o0+0x05c],%l0		! %l0 = 00000000bce2a8ed
!	%l2 = 0c19b02e, %l3 = 00000000, Mem[0000000015800000] = 00000000 ffffffff
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000015800000] = 0c19b02e 00000000

p1_label_148:
!	Mem[0000000030000058] = 0000303f, %l1 = ffffffffcd8ed7e0
	ldswa	[%o0+0x058]%asi,%l1	! %l1 = 000000000000303f
!	%f10 = 00000000, %f14 = c1b1f9ab
	fitos	%f10,%f14		! %f14 = 00000000
!	%f25 = 00000000, %f31 = 00000000, %f1  = 00000000
	fsubs	%f25,%f31,%f1 		! %f1  = 00000000
!	Mem[0000000031000010] = 000000a5, %l4 = 0000000000001ea5
	lduh	[%o2+0x012],%l4		! %l4 = 00000000000000a5
!	%l7 = 0000000000003b66, Mem[0000000016800063] = 813fa88a
	stba	%l7,[%i5+0x063]%asi	! Mem[0000000016800060] = 813fa866

p1_label_149:
!	Denormal Floating Point Operation Nullified
	nop
!	%l2 = 0c19b02e, %l3 = 00000000, Mem[0000000015000128] = c85af542 060158c3
	stda	%l2,[%i2+0x128]%asi	! Mem[0000000015000128] = 0c19b02e 00000000
!	%f12 = ffffffff 00000000, %f8  = 00000000 ee0654aa
	fabsd	%f12,%f8 		! %f8  = 7fffffff 00000000
!	Mem[0000000015800000] = 0c19b02e 00000000, %l4 = 000000a5, %l5 = 0000000c
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 000000000c19b02e 0000000000000000
!	%l7 = 0000000000003b66, %l3 = 0000000000000000, %l4 = 000000000c19b02e
	xnorcc	%l7,%l3,%l4		! %l4 = ffffffffffffc499, %ccr = 88

p1_label_150:
!	%f12 = ffffffff, %f16 = 00000000
	fitos	%f12,%f16		! %f16 = bf800000
!	Mem[0000000015000118] = 00000036, %l7 = 0000000000003b66
	ldswa	[%i2+0x118]%asi,%l7	! %l7 = 0000000000000036
!	%l7 = 0000000000000036, %l0 = 00000000bce2a8ed, %y  = 14477771
	umul	%l7,%l0,%l4		! %l4 = 00000027d7cfa1fe
!	%f16 = bf800000 80000000, %f13 = 00000000
	fdtos	%f16,%f13		! %f13 = bc000004
	set	p1_b169,%o7
	fbule,a	p1_far_3_le	! Branch Taken, %fcc0 = 1

p1_label_151:
!	Mem[0000000015000000] = ffffffab, %l7 = 0000000000000036
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0a9,%g2
p1_b169:
!	Registers modified during the branch to p1_far_3
!	%l3  = 00000000ffff04aa
!	%l5  = 00000075b1db9f6c
	membar	#Sync			! Added by membar checker (316)
!	%l1 = 000000000000303f, Mem[0000000015800008] = 00000000
	stwa	%l1,[%i3+%o6]0x80	! Mem[0000000015800008] = 0000303f
!	call to call_1, CWP = 0
	call	p1_call_1_le
!	Mem[0000000014000098] = 72ffe235, %l2 = 000000000c19b02e
	ldsh	[%i0+0x09a],%l2		! %l2 = ffffffffffffe235
!	Registers modified during the branch to p1_call_1
!	%l0  = ffffffffffffd20a
!	%l2 = ffffffffffffe235, Mem[0000000014000000] = 00000000
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000014000000] = 35000000

p1_label_152:
!	%f0  = 0f121380 00000000, %f0  = 0f121380 00000000, %f0  = 0f121380 00000000
	fdivd	%f0 ,%f0 ,%f0 		! %f0  = 3ff00000 00000000
!	Branch On Register, %l4 = 00000027d7cfa1fe
	brgez,pn %l4,p1_b170		! Branch Taken
!	%l5 = 00000075b1db9f6c, Mem[0000000015000000] = ffffffabd4694b0b
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000015000000] = 00000075b1db9f6c
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0aa,%g2
p1_b170:
	set	p1_b171,%o7
	fbule	p1_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[00000000150000d8] = b71a325f, %l7 = 00000000000000ff
	ldub	[%i2+0x0d8],%l7		! %l7 = 00000000000000b7
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p1_branch_failed
	mov	0x0ab,%g2
p1_b171:
!	Registers modified during the branch to p1_far_3
!	%l3  = 00000000ffff04aa
!	%l5  = fffffffffede3782

p1_label_153:
	membar	#Sync			! Added by membar checker (317)
	fbe,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l3 = 00000000ffff04aa, Mem[0000000014800008] = 0c19b02e
	stba	%l3,[%i1+%o6]0x80	! Annulled
p1_b172:
	ble,a	p1_b173			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000014800000] = 00000000, %l5 = fffffffffede3782
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0ad,%g2
p1_b173:
	membar	#Sync			! Added by membar checker (318)
!	%l7 = 00000000000000b7, %l4 = 00000027d7cfa1fe, %l0 = ffffffffffffd20a
	xnor	%l7,%l4,%l0		! %l0 = ffffffd828305eb6

p1_label_154:
!	%l0 = ffffffd828305eb6, immed = 0000003b, %l4 = 00000027d7cfa1fe
	sllx	%l0,0x03b,%l4		! %l4 = b000000000000000
!	%l2 = ffffffffffffe235, %l2 = ffffffffffffe235, %l6 = 000000007fffffff
	xorcc	%l2,%l2,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Mem[0000000014000008] = 0000000000000000, %l2 = ffffffffffffe235
	ldxa	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000000
	bneg	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l7 = 00000000000000b7, Mem[00000000140001ec] = fd5d0c11
	stw	%l7,[%i0+0x1ec]		! Mem[00000000140001ec] = 000000b7
p1_b174:

p1_label_155:
	membar	#Sync			! Added by membar checker (319)
!	%l2 = 0000000000000000, %l3 = 00000000ffff04aa, %y  = ffffffff
	umulcc	%l2,%l3,%l1		! %l1 = 0000000000000000, %ccr = 44
!	%f12 = ffffffff, %f24 = ee0654aa, %f28 = 80000000 00000000
	fsmuld	%f12,%f24,%f28		! %f28 = ffffffff e0000000
	bpos,a	p1_b175			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000031800058] = 2b37be41, %l1 = 0000000000000000
	ldsh	[%o3+0x05a],%l1		! %l1 = ffffffffffffbe41
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x0af,%g2
p1_b175:
	membar	#Sync			! Added by membar checker (320)
	set	p1_b176,%o7
	fblg,a,pt %fcc1,p1_near_1_le	! Branch Taken, %fcc1 = 2

p1_label_156:
!	Mem[0000000031000018] = 000000a8, %l7 = 00000000000000b7
	ldsw	[%o2+0x018],%l7		! %l7 = 00000000000000a8
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0b0,%g2
p1_b176:
!	Registers modified during the branch to p1_near_1
!	%l2  = ffffffff0000baeb
!	%l3  = 00000000fffec2eb
!	%l5  = ffffffff0000baeb
!	%l7  = ffffffff0000fb55
	membar	#Sync			! Added by membar checker (321)
!	%l7 = ffffffff0000fb55, immed = fffffd2a, %l7 = ffffffff0000fb55
	subccc	%l7,-0x2d6,%l7		! %l7 = ffffffff0000fe2a, %ccr = 91
!	%l4 = b000000000000000, immed = fffff9d6, %l1 = ffffffffffffbe41
	addcc	%l4,-0x62a,%l1		! %l1 = affffffffffff9d6, %ccr = 98
!	Mem[00000000140001c0] = 746627ee d55c0fa0 fff93f09 7688b7f3
	prefetch [%i0+0x1c0],23
!	%l1 = affffffffffff9d6, Mem[0000000014000008] = 0000000000000000
	stxa	%l1,[%i0+%o6]0x80	! Mem[0000000014000008] = affffffffffff9d6

p1_label_157:
!	%l0 = ffffffd828305eb6, Mem[0000000015800000] = 0c19b02e
	stba	%l0,[%i3+%g0]0x80	! Mem[0000000015800000] = b619b02e
	bpos,a	p1_not_taken_0		! Branch Not Taken, %ccr = 98
!	%l1 = affffffffffff9d6, Mem[0000000015800000] = b619b02e
	stwa	%l1,[%i3+%g0]0x80	! Annulled
p1_b177:
	membar	#Sync			! Added by membar checker (322)
!	%l6 = 0000000000000000, %l2 = ffffffff0000baeb, %y  = 00000000
	umulcc	%l6,%l2,%l0		! %l0 = 0000000000000000, %ccr = 44
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1

p1_label_158:
!	%l3 = 00000000fffec2eb, Mem[0000000014800058] = b5efab72
	stb	%l3,[%i1+0x058]		! Annulled
p1_b178:
	membar	#Sync			! Added by membar checker (323)
!	%f30 = 00000000, %f20 = 80000000
	fcmpes	%fcc3,%f30,%f20		! %fcc3 = 0
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,21
!	Mem[0000000015000000] = 00000075, %l7 = ffffffff0000fe2a
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000075
!	Branch On Register, %l5 = ffffffff0000baeb
	brlez,pt %l5,p1_b179		! Branch Taken

p1_label_159:
!	Mem[0000000014000180] = 0279de89, %l7 = 0000000000000075
	swap	[%i0+0x180],%l7		! %l7 = 000000000279de89
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0b3,%g2
p1_b179:
	membar	#Sync			! Added by membar checker (324)
!	%l2 = ffffffff0000baeb, %l2 = ffffffff0000baeb, %l4 = b000000000000000
	and	%l2,%l2,%l4		! %l4 = ffffffff0000baeb
!	%l1 = affffffffffff9d6, immed = 000006da, %y  = 00000000
	umulcc	%l1,0x6da,%l1		! %l1 = 000006d9ffd5c43c, %ccr = 08
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[00000000158001f0] = 23a52f6f5a6af5f8, %l1 = 000006d9ffd5c43c
	ldx	[%i3+0x1f0],%l1		! %l1 = 23a52f6f5a6af5f8
p1_b180:

p1_label_160:
	membar	#Sync			! Added by membar checker (325)
!	%f27 = 80000000, %f23 = 00000000, %f7  = 00000000
	fadds	%f27,%f23,%f7 		! %f7  = 00000000
!	Mem[00000000170000ec] = fdfaab1d, %l7 = 000000000279de89
	lduba	[%i6+0x0ed]%asi,%l7	! %l7 = 00000000000000fa
!	Mem[0000000015000023] = 2d51639f, %l3 = 00000000fffec2eb
	ldstuba	[%i2+0x023]%asi,%l3	! %l3 = 000000000000009f
!	Mem[0000000031000010] = 000000a5 e9ffff45, %l0 = 00000000, %l1 = 5a6af5f8
	ldd	[%o2+0x010],%l0		! %l0 = 00000000000000a5 00000000e9ffff45
!	Mem[00000000150001d4] = 247713b7, %l6 = 00000000, %l6 = 00000000
	add	%i2,0x1d4,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000247713b7

p1_label_161:
!	Mem[0000000017000120] = d997d99d 36d2ab7f a5ef406c c95dfdb2
	prefetch [%i6+0x120],2
	nop
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 0000baeb, %l3 = 0000009f, Mem[0000000015000120] = 2a5d7aa1 aef3a49b
	std	%l2,[%i2+0x120]	! Mem[0000000015000120] = 0000baeb 0000009f
p1_b181:
	membar	#Sync			! Added by membar checker (326)
	fbul,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0

p1_label_162:
!	Mem[0000000014000008] = afffffff, %l0 = 00000000000000a5
	ldsba	[%i0+%o6]0x80,%l0	! Annulled
p1_b182:
	membar	#Sync			! Added by membar checker (327)
!	%f23 = 00000000, %f7  = 00000000
	fnegs	%f23,%f7 		! %f7  = 80000000
!	%l1 = 00000000e9ffff45, %l2 = ffffffff0000baeb, %l3 = 000000000000009f
	add	%l1,%l2,%l3		! %l3 = ffffffffea00ba30
!	Mem[00000000148001e0] = 8e735e1b 63ea3d1d 1bf2071e 65d02aa2
	prefetch [%i1+0x1e0],23
!	%f28 = ffffffff, %f31 = 00000000
	fitos	%f28,%f31		! %f31 = bf800000

p1_label_163:
	set	p1_b183,%o7
	fba,pn	%fcc3,p1_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000015800000] = b619b02e, %l3 = ffffffffea00ba30
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000b619b02e
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0b7,%g2
p1_b183:
!	Registers modified during the branch to p1_near_2
!	%l6  = 00000000283fe896
!	%l7  = 00000000e9ffff45
	membar	#Sync			! Added by membar checker (328)
!	%l5 = ffffffff0000baeb, immed = 00000193, %l0 = 00000000000000a5
	orcc	%l5,0x193,%l0		! %l0 = ffffffff0000bbfb, %ccr = 80
!	%l1 = 00000000e9ffff45, %l3 = 00000000b619b02e, %l1 = 00000000e9ffff45
	or	%l1,%l3,%l1		! %l1 = 00000000ffffff6f
!	%l0 = ffffffff0000bbfb, immed = fffff751, %l7 = 00000000e9ffff45
	andcc	%l0,-0x8af,%l7		! %l7 = ffffffff0000b351, %ccr = 80

p1_label_164:
	fbn,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l7 = ffffffff0000b351, Mem[000000003200001f] = da5d4563
	stb	%l7,[%o4+0x01f]		! Mem[000000003200001c] = 515d4563
p1_b184:
	membar	#Sync			! Added by membar checker (329)
!	%l4 = ffffffff0000baeb, immed = fffff272, %l1 = 00000000ffffff6f
	xor	%l4,-0xd8e,%l1		! %l1 = 00000000ffff4899
!	%l2 = ffffffff0000baeb, Mem[00000000150001d8] = b3bf3920c73a2f28
	stx	%l2,[%i2+0x1d8]		! Mem[00000000150001d8] = ffffffff0000baeb
!	%l6 = 00000000283fe896, Mem[0000000014800000] = 00000000
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000014800000] = 283fe896

p1_label_165:
!	%f12 = ffffffff, %f26 = 00000000, %f4  = c1b1f9ab 56000000
	fsmuld	%f12,%f26,%f4 		! %f4  = ffffffff e0000000
!	Mem[00000000148000ee] = 6238bc36, %l7 = ffffffff0000b351
	ldstuba	[%i1+0x0ee]%asi,%l7	! %l7 = 00000000000000bc
	bge,a	p1_b185			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000015000000] = 00000075, %l5 = ffffffff0000baeb
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0b9,%g2
p1_b185:
	membar	#Sync			! Added by membar checker (330)
!	%l1 = 00000000ffff4899, %l0 = ffffffff0000bbfb, %l0 = ffffffff0000bbfb
	addc	%l1,%l0,%l0		! %l0 = 0000000000000494

p1_label_166:
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,21
	set	p1_b186,%o7
	fbule,a	p1_far_1_he	! Branch Taken, %fcc0 = 1
!	%l2 = ffffffff0000baeb, Mem[0000000014000000] = 35000000
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000014000000] = 0000baeb
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0ba,%g2
p1_b186:
!	Registers modified during the branch to p1_far_1
!	%l0  = 00000000283febd6
!	%l1  = 0000000004940000
!	%l3  = 000000007725eaea
	ba	p1_b187			! Branch Taken, %ccr = 00, CWP = 0
!	%l4 = ffffffff0000baeb, Mem[0000000014000000] = 0000baebe9ffff45
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000014000000] = ffffffff0000baeb
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0bb,%g2
p1_b187:

p1_label_167:
	membar	#Sync			! Added by membar checker (331)
!	Denormal Floating Point Operation Nullified
	nop
!	%f22 = 00000000 00000000, %f16 = bf800000 80000000, %f2  = 210bbf05 ee0654aa
	faddd	%f22,%f16,%f2 		! %f2  = bf800000 80000000
	bg	p1_b188			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000060] = d7521c0a 5b600007, %l0 = 283febd6, %l1 = 04940000
	ldd	[%o4+0x060],%g2		! %l0 = 00000000283febd6 0000000004940000
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x0bc,%g2
p1_b188:
	membar	#Sync			! Added by membar checker (332)
	set	p1_b189,%o7
	fbul,a,pn %fcc0,p1_near_3_he	! Branch Taken, %fcc0 = 1

p1_label_168:
!	Mem[0000000014000028] = d7c0364e, %l3 = 000000007725eaea
	lduh	[%i0+0x028],%l3		! %l3 = 000000000000d7c0
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0bd,%g2
p1_b189:
!	Registers modified during the branch to p1_near_3
!	%l4  = 00000000e26bfaf1
	membar	#Sync			! Added by membar checker (333)
!	Branch On Register, %l5 = 0000000000000000
	brnz,a,pt %l5,p1_not_taken_0	! Branch Not Taken
!	%l7 = 00000000000000bc, Mem[0000000016800008] = b80ec8b5f514018f
	stxa	%l7,[%i5+%o6]0x80	! Annulled
p1_b190:
	membar	#Sync			! Added by membar checker (334)
!	Mem[0000000031000058] = d88bfbac, %l3 = 000000000000d7c0
	ldswa	[%o2+0x058]%asi,%l3	! %l3 = ffffffffd88bfbac
!	%l3 = ffffffffd88bfbac, immed = 00000760, %l4 = 00000000e26bfaf1
	subc	%l3,0x760,%l4		! %l4 = ffffffffd88bf44c

p1_label_169:
!	%f31 = bf800000, %f28 = ffffffff e0000000
	fstox	%f31,%f28		! %f28 = ffffffff ffffffff
!	%l4 = ffffffffd88bf44c
	setx	0x178f0ccd178f0ccd,%g7,%l4 ! %l4 = 178f0ccd178f0ccd
!	%f30 = 00000000, %f25 = 00000000, %f8  = 7fffffff
	fadds	%f30,%f25,%f8 		! %f8  = 00000000
	set	p1_b191,%o7
	fbne,a	p1_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000015000008] = 26000071, %l3 = ffffffffd88bfbac
	ldstuba	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000026
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0bf,%g2
p1_b191:

p1_label_170:
	membar	#Sync			! Added by membar checker (335)
!	Branch On Register, %l5 = 0000000000000000
	brgz,a,pn %l5,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014800008] = 0c19b02e, %l0 = 00000000283febd6
	lduwa	[%i1+%o6]0x80,%l0	! Annulled
p1_b192:
	membar	#Sync			! Added by membar checker (336)
!	Mem[000000003100001c] = 04aa0000, %l5 = 0000000000000000
	ldsw	[%o2+0x01c],%l5		! %l5 = 0000000004aa0000
!	Branch On Register, %l2 = ffffffff0000baeb
	brgz,a,pt %l2,p1_not_taken_0	! Branch Not Taken
!	%l4 = 178f0ccd, %l5 = 04aa0000, Mem[0000000014800000] = 283fe896 00002115
	stda	%l4,[%i1+%g0]0x80	! Annulled
p1_b193:

p1_label_171:
	membar	#Sync			! Added by membar checker (337)
!	Mem[000000001500018c] = 90eb632b, %l3 = 0000000000000026
	lduwa	[%i2+0x18c]%asi,%l3	! %l3 = 0000000090eb632b
!	Jump to jmpl_3, CWP = 0
	set	p1_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	Mem[00000000148000a0] = b46e9004 42799b84 4505bc42 f0247578
	prefetch [%i1+0x0a0],4
!	Registers modified during the branch to p1_jmpl_3
!	%l0  = 000000000493ff44
!	%l3  = 0000000000000001
	fbuge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014000074] = 125415d6, %l0 = 000000000493ff44
	ldsb	[%i0+0x077],%l0		! %l0 = ffffffffffffffd6
p1_b194:

p1_label_172:
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000000] = ff000075, %l3 = 0000000000000001
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff
p1_b195:
	fbug	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000008] = ff000071, %l1 = 0000000004940000
	ldsba	[%i2+%o6]0x80,%l1	! %l1 = ffffffffffffffff
p1_b196:
	membar	#Sync			! Added by membar checker (338)
!	Mem[000000003100001c] = 04aa0000, %l2 = ffffffff0000baeb
	lduba	[%o2+0x01f]%asi,%l2	! %l2 = 0000000000000000

p1_label_173:
!	Mem[0000000030800054] = e9ffff45, %l3 = 00000000000000ff
	swapa	[%o1+0x054]%asi,%l3	! %l3 = 00000000e9ffff45
!	Branch On Register, %l5 = 0000000004aa0000
	brnz,a,pn %l5,p1_b197		! Branch Taken
!	Mem[0000000032000074] = 1113430c, %l6 = 00000000283fe896
	ldsb	[%o4+0x074],%g2		! %g2 = 0000000000000011
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0c5,%g2
p1_b197:
	membar	#Sync			! Added by membar checker (339)
!	Branch On Register, %l4 = 178f0ccd178f0ccd
	brnz,pn	%l4,p1_b198		! Branch Taken
!	Mem[00000000150001ec] = 8c5a2f5e, %l7 = 00000000000000bc
	swap	[%i2+0x1ec],%l7		! %l7 = 000000008c5a2f5e
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0c6,%g2
p1_b198:

p1_label_174:
	membar	#Sync			! Added by membar checker (340)
!	Mem[0000000030800054] = 000000ff, %l1 = ffffffffffffffff
	lduw	[%o1+0x054],%l1		! %l1 = 00000000000000ff
	set	p1_b199,%o7
	fbuge,pt %fcc1,p1_near_1_le	! Branch Taken, %fcc1 = 2
!	%l4 = 178f0ccd, %l5 = 04aa0000, Mem[0000000015000000] = ff000075 b1db9f6c
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000015000000] = 178f0ccd 04aa0000
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p1_branch_failed
	mov	0x0c7,%g2
p1_b199:
!	Registers modified during the branch to p1_near_1
!	%l2  = 00000000e9ffffba
!	%l3  = 00000000ea000044
!	%l5  = 0000000169ffffba
!	%l7  = ffffffff12aa00ba
	membar	#Sync			! Added by membar checker (341)
!	Mem[0000000030000014] = 02090562, %l3 = 00000000ea000044
	lduba	[%o0+0x016]%asi,%l3	! %l3 = 0000000000000005
!	Mem[0000000015800020] = f46e630d 47c32dc9 3b01fa7a 1ff25189
	prefetcha [%i3+0x020]%asi,0

p1_label_175:
	fblg,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000030000054] = 5ae4ffff, %l1 = 00000000000000ff
	swap	[%o0+0x054],%l1		! %l1 = 000000005ae4ffff
p1_b200:
	membar	#Sync			! Added by membar checker (342)
!	%l7 = ffffffff12aa00ba, immed = fffffc33, %l1 = 000000005ae4ffff
	sub	%l7,-0x3cd,%l1		! %l1 = ffffffff12aa0487
	fbu,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000000] = 178f0ccd04aa0000, %l6 = 00000000283fe896
	ldxa	[%i2+%g0]0x80,%l6	! Annulled
p1_b201:

p1_label_176:
	membar	#Sync			! Added by membar checker (343)
!	%l3 = 0000000000000005, Mem[0000000014000000] = ffffffff
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000014000000] = 05ffffff
!	Mem[0000000015000000] = 178f0ccd, %l3 = 0000000000000005
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000017
!	%l1 = ffffffff12aa0487, %l3 = 0000000000000017, %l1 = ffffffff12aa0487
	xorcc	%l1,%l3,%l1		! %l1 = ffffffff12aa0490, %ccr = 80
	fbge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000194] = 0cedc4d0, %l7 = ffffffff12aa00ba
	ldsh	[%i2+0x196],%l7		! %l7 = ffffffffffffc4d0
p1_b202:

p1_label_177:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015800008] = 0000303f, %l5 = 0000000169ffffba
	swapa	[%i3+%o6]0x80,%l5	! Annulled
p1_b203:
	bge	p1_b204			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000014800000] = 283fe896, %l6 = 00000000283fe896
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 00000000283fe896
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0cc,%g2
p1_b204:
	membar	#Sync			! Added by membar checker (344)
!	%l3 = 0000000000000017, Mem[0000000031800054] = d0636e50
	sth	%l3,[%o3+0x054]		! Mem[0000000031800054] = 00176e50

p1_label_178:
!	%l7 = ffffffffffffc4d0, %l1 = ffffffff12aa0490, %y  = 000006d9
	umul	%l7,%l1,%l1		! %l1 = 12aa003f5111f500
!	%f22 = 00000000, %f8  = 00000000, %f21 = ee0654aa
	fmuls	%f22,%f8 ,%f21		! %f21 = 00000000
!	Mem[0000000014000008] = afffffff, %l3 = 0000000000000017
	ldstuba	[%i0+0x008]%asi,%l3	! %l3 = 00000000000000af
!	Mem[0000000014800000] = 283fe896, %l4 = 178f0ccd178f0ccd
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000283fe896
!	%f2  = bf800000 80000000, %f10 = 00000000 d6000000
	fmovd	%f2 ,%f10		! %f10 = bf800000 80000000

p1_label_179:
!	Branch On Register, %l2 = 00000000e9ffffba
	brgez,a,pn %l2,p1_b205		! Branch Taken
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],23
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0cd,%g2
p1_b205:
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	%l2 = 00000000e9ffffba, Mem[0000000014000118] = fbc5300d74f86733
	stx	%l2,[%i0+0x118]		! Mem[0000000014000118] = 00000000e9ffffba
p1_b206:
	set	p1_b207,%o7
	fbule,a	p1_far_0_le	! Branch Taken, %fcc0 = 1

p1_label_180:
!	Mem[0000000015000000] = ff8f0ccd, %l3 = 00000000000000af
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff8f0ccd
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0cf,%g2
p1_b207:
!	Registers modified during the branch to p1_far_0
!	%l0  = fffffcc476022326
!	%l1  = 0000033cf3fddc94
!	%l2  = 000000000000033c
!	%l3  = 00000000c72f746f
	membar	#Sync			! Added by membar checker (345)
!	%l5 = 0000000169ffffba, %l6 = 00000000283fe896, %y  = 0000033c
	smulcc	%l5,%l6,%l7		! %l7 = 10aa76431a8666fc, %ccr = 00
!	Mem[0000000030800011] = ffff04aa, %l7 = 10aa76431a8666fc
	ldstuba	[%o1+0x011]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[000000003000005c] = 32712820, %l0 = fffffcc476022326
	swapa	[%o0+0x05c]%asi,%l0	! %l0 = 0000000032712820
!	Mem[0000000014800000] = 178f0ccd, %l0 = 0000000032712820
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000017

p1_label_181:
!	%f0  = 3ff00000 00000000, %f20 = 80000000 00000000, %f8  = 00000000 00000000
	faddd	%f0 ,%f20,%f8 		! %f8  = 3ff00000 00000000
!	Mem[00000000148001d8] = 744e3802, %l4 = 00000000283fe896
	ldsw	[%i1+0x1d8],%l4		! %l4 = 00000000744e3802
!	%l3 = 00000000c72f746f, Mem[0000000031800010] = e065e77b
	stw	%l3,[%o3+0x010]		! Mem[0000000031800010] = c72f746f
	set	p1_b208,%o7
	fbule	p1_far_1_le	! Branch Taken, %fcc0 = 1
!	%l4 = 00000000744e3802, Mem[0000000030800018] = 00000000
	stw	%l4,[%o1+0x018]		! Mem[0000000030800018] = 744e3802
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p1_branch_failed
	mov	0x0d0,%g2
p1_b208:
!	Registers modified during the branch to p1_far_1
!	%l0  = 0000000000000ad6
!	%l1  = 0000000169fff79e
!	%l7  = fffffcc36dfffffb

p1_label_182:
	membar	#Sync			! Added by membar checker (346)
!	%l5 = 0000000169ffffba, %l5 = 0000000169ffffba, %l4 = 00000000744e3802
	tsubcc	%l5,%l5,%l4		! %l4 = 0000000000000000, %ccr = 46
!	%l2 = 0000033c, %l3 = c72f746f, Mem[0000000014000080] = d2cd077c 1bfab1b7
	std	%l2,[%i0+0x080]	! Mem[0000000014000080] = 0000033c c72f746f
	set	p1_b209,%o7
	fbge,a,pn %fcc1,p1_near_3_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000015000008] = ff000071cfc0ffff, %l3 = 00000000c72f746f
	ldxa	[%i2+%o6]0x80,%l3	! %l3 = ff000071cfc0ffff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0d1,%g2
p1_b209:
!	Registers modified during the branch to p1_near_3
!	%l3  = 00000000283fe810
	membar	#Sync			! Added by membar checker (347)
!	%f8  = 3ff00000 00000000, %f10 = bf800000 80000000
	fcmped	%fcc2,%f8 ,%f10		! %fcc2 = 2

p1_label_183:
!	%l1 = 0000000169fff79e, %l4 = 0000000000000000, %l0 = 0000000000000ad6
	addc	%l1,%l4,%l0		! %l0 = 0000000169fff79e
!	%l2 = 000000000000033c, %l6 = 00000000283fe896, %l6 = 00000000283fe896
	xnorcc	%l2,%l6,%l6		! %l6 = ffffffffd7c01455, %ccr = 88
!	%l3 = 00000000283fe810, %l5 = 0000000169ffffba, %y  = 00000000
	sdivcc	%l3,%l5,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%l1 = 0000000169fff79e, Mem[000000003100001e] = 04aa0000
	sth	%l1,[%o2+0x01e]		! Mem[000000003100001c] = 04aaf79e
	fbug	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1

p1_label_184:
!	%l1 = 0000000169fff79e, Mem[0000000032000014] = a121acca
	sth	%l1,[%o4+0x014]		! Mem[0000000032000014] = f79eacca
p1_b210:
	ble	p1_b211			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000014800140] = 72ee7b79 4c697066 2c8809f8 87534db2
	prefetch [%i1+0x140],4
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x0d3,%g2
p1_b211:
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000015000000] = 000000af, %l0 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l0	! Annulled
p1_b212:

p1_label_185:
	membar	#Sync			! Added by membar checker (348)
!	%f2  = bf800000 80000000, %f20 = 80000000 00000000
	fcmped	%fcc2,%f2 ,%f20		! %fcc2 = 1
!	Mem[0000000015800008] = 0000303f, %l2 = 000000000000033c
	ldswa	[%i3+%o6]0x80,%l2	! %l2 = 000000000000303f
!	%l4 = 0000000000000000, Mem[0000000014000008] = ffffffff
	stha	%l4,[%i0+%o6]0x80	! Mem[0000000014000008] = 0000ffff
!	%l5 = 0000000169ffffba, immed = 0000003b, %l2 = 000000000000303f
	sllx	%l5,0x03b,%l2		! %l2 = d000000000000000
	set	p1_b213,%o7
	fbl,pn	%fcc2,p1_near_1_he	! Branch Taken, %fcc2 = 1

p1_label_186:
!	%l7 = fffffcc36dfffffb, Mem[0000000032000021] = 45636746
	stb	%l7,[%o4+0x021]		! Mem[0000000032000020] = fb636746
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0d5,%g2
p1_b213:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000033c92000fe5
!	%l3  = 0000000000000000
!	%l4  = 000169ffcf5e1455
!	%l5  = 000169fff79e0000
	membar	#Sync			! Added by membar checker (349)
!	%f10 = bf800000 80000000, %f30 = 00000000 bf800000
	fmovd	%f10,%f30		! %f30 = bf800000 80000000
!	%l4 = 000169ffcf5e1455, immed = 000001e0, %y  = 00000000
	mulx	%l4,0x1e0,%l4		! %l4 = 02a6bfa4d0661f60
!	Mem[0000000015800034] = b752d905, %l5 = 000169fff79e0000
	swapa	[%i3+0x034]%asi,%l5	! %l5 = 00000000b752d905
!	%l4 = 02a6bfa4d0661f60, immed = fffff9fb, %y  = 00000000
	smulcc	%l4,-0x605,%l6		! %l6 = 0000011e89452320, %ccr = 08

p1_label_187:
!	Mem[0000000014000180] = 00000075 542084cd f7713b66 2115086c
	prefetch [%i0+0x180],16
	bl	p1_b214			! Branch Taken, %ccr = 08, CWP = 0
!	%l0 = 0000033c92000fe5, Mem[0000000016000000] = 00004baa
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000016000000] = 92000fe5
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p1_branch_failed
	mov	0x0d6,%g2
p1_b214:
	membar	#Sync			! Added by membar checker (350)
	fbn,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000003080005b] = 77005ae4, %l1 = 0000000169fff79e
	ldstub	[%o1+0x05b],%l1		! Annulled
p1_b215:

p1_label_188:
	membar	#Sync			! Added by membar checker (351)
!	%l5 = 00000000b752d905, immed = 00000028, %l7 = fffffcc36dfffffb
	srax	%l5,0x028,%l7		! %l7 = 0000000000000000
!	%l2 = d000000000000000, %l6 = 0000011e89452320, %y  = 0000011e
	sdiv	%l2,%l6,%l1		! %l1 = fffffffffffffd98
!	%l6 = 0000011e89452320, Mem[0000000031800010] = c72f746f
	stha	%l6,[%o3+0x010]%asi	! Mem[0000000031800010] = 2320746f
!	Mem[0000000015000008] = ff000071, %l3 = 0000000000000000
	lduha	[%i2+%o6]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[00000000140001c0] = 746627ee d55c0fa0 fff93f09 7688b7f3
	prefetch [%i0+0x1c0],21

p1_label_189:
!	Mem[0000000016800118] = a9ceb672 6d54ec3e, %l6 = 89452320, %l7 = 00000000
	ldda	[%i5+0x118]%asi,%l6	! %l6 = 00000000a9ceb672 000000006d54ec3e
!	%f15 = 56000000, %f2  = bf800000
	fmovs	%f15,%f2 		! %f2  = 56000000
!	%l2 = d000000000000000, %l0 = 0000033c92000fe5, %l0 = 0000033c92000fe5
	addc	%l2,%l0,%l0		! %l0 = d000033c92000fe5
!	Mem[00000000150000c0] = 4da252ff 88100109 155b66f4 ceefe2e0
	prefetcha [%i2+0x0c0]%asi,3
	bg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08

p1_label_190:
!	%l0 = d000033c92000fe5, Mem[0000000030000050] = 4cf6a711000000ff
	stx	%l0,[%o0+0x050]		! Annulled
p1_b216:
	membar	#Sync			! Added by membar checker (352)
!	Branch On Register, %l7 = 000000006d54ec3e
	brnz,a,pt %l7,p1_b217		! Branch Taken
!	Mem[0000000030000058] = 0000303f, %l5 = 00000000b752d905
	lduw	[%o0+0x058],%l5		! %l5 = 000000000000303f
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0d9,%g2
p1_b217:
	membar	#Sync			! Added by membar checker (353)
	set	p1_b218,%o7
	fbul,pn	%fcc0,p1_near_0_le	! Branch Taken, %fcc0 = 1
!	%l2 = d000000000000000, Mem[0000000015000000] = 000000af
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000015000000] = 00000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0da,%g2
p1_b218:
!	Registers modified during the branch to p1_near_0
!	%l0  = 00000000000075ea
!	%l1  = 000001a000000000

p1_label_191:
	membar	#Sync			! Added by membar checker (354)
!	%l2 = d000000000000000, Mem[00000000140001b0] = 06a41dc8
	sth	%l2,[%i0+0x1b0]		! Mem[00000000140001b0] = 00001dc8
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],23
!	%l5 = 000000000000303f, %l2 = d000000000000000, %y  = 0000011e
	smul	%l5,%l2,%l5		! %l5 = 0000000000000000
	fbuge	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000008] = ff000071, %l3 = 000000000000ff00
	lduwa	[%i2+%o6]0x80,%l3	! %l3 = 00000000ff000071
p1_b219:

p1_label_192:
	membar	#Sync			! Added by membar checker (355)
!	%f15 = 56000000, %f8  = 3ff00000 00000000
	fstod	%f15,%f8 		! %f8  = 42c00000 00000000
!	%l5 = 0000000000000000, %l6 = 00000000a9ceb672, %y  = 00000000
	sdiv	%l5,%l6,%l5		! %l5 = 0000000000000000
!	%l4 = 02a6bfa4d0661f60, immed = fffffdae, %y  = 00000000
	smul	%l4,-0x252,%l0		! %l0 = 0000006e730b3340
	bgu	p1_b220			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000014800000] = ff8f0ccd, %l2 = d000000000000000
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = ffffffffff8f0ccd
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0dc,%g2
p1_b220:

p1_label_193:
	membar	#Sync			! Added by membar checker (356)
!	%f0  = 3ff00000 00000000, %f18 = 00000000 00000000
	fmovd	%f0 ,%f18		! %f18 = 3ff00000 00000000
!	%l2 = ffffffffff8f0ccd, immed = 0000048e, %y  = 0000006e
	smul	%l2,0x48e,%l3		! %l3 = fffffffdfd8c4db6
!	%f16 = bf800000 80000000, %f2  = 56000000 80000000
	fcmpd	%fcc1,%f16,%f2 		! %fcc1 = 1
!	%l1 = 000001a000000000, immed = fffff755, %y  = fffffffd
	sdiv	%l1,-0x8ab,%l7		! %l7 = 0000000000589a21
!	%l7 = 0000000000589a21, %l0 = 0000006e730b3340, %l7 = 0000000000589a21
	add	%l7,%l0,%l7		! %l7 = 0000006e7363cd61

p1_label_194:
!	Branch On Register, %l3 = fffffffdfd8c4db6
	brgez,a,pt %l3,p1_not_taken_0	! Branch Not Taken
!	%l2 = ffffffffff8f0ccd, Mem[0000000014000178] = 4cb28d3f6f5d0c92
	stx	%l2,[%i0+0x178]		! Annulled
p1_b221:
	membar	#Sync			! Added by membar checker (357)
!	Branch On Register, %l1 = 000001a000000000
	brgz,a,pn %l1,p1_b222		! Branch Taken
!	Mem[0000000030800010] = ffff04aa 6017df28, %l2 = ff8f0ccd, %l3 = fd8c4db6
	ldd	[%o1+0x010],%l2		! %l2 = 00000000ffff04aa 000000006017df28
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0de,%g2
p1_b222:
	membar	#Sync			! Added by membar checker (358)
!	Mem[00000000148000cc] = 0c55dbbe, %l2 = 00000000ffff04aa
	lduwa	[%i1+0x0cc]%asi,%l2	! %l2 = 000000000c55dbbe

p1_label_195:
	fbge,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 000000000c55dbbe, Mem[0000000032000073] = 3e111343
	stb	%l2,[%o4+0x073]		! Annulled
p1_b223:
	membar	#Sync			! Added by membar checker (359)
!	%l4 = 02a6bfa4d0661f60, %l2 = 000000000c55dbbe, %y  = fffffffd
	smulcc	%l4,%l2,%l0		! %l0 = fdb4d284f3826940, %ccr = 88
!	%l1 = 000001a000000000, immed = fffffc4d, %l5 = 0000000000000000
	xorcc	%l1,-0x3b3,%l5		! %l5 = fffffe5ffffffc4d, %ccr = 88
!	Mem[0000000014000008] = 0000ffff, %l4 = 02a6bfa4d0661f60
	lduwa	[%i0+%o6]0x80,%l4	! %l4 = 000000000000ffff

p1_label_196:
!	%f28 = ffffffff ffffffff, %f12 = ffffffff bc000004
	fcmpd	%fcc0,%f28,%f12		! %fcc0 = 3
!	%l3 = 000000006017df28, %l3 = 000000006017df28, %l3 = 000000006017df28
	xorcc	%l3,%l3,%l3		! %l3 = 0000000000000000, %ccr = 44
!	Mem[0000000015000038] = c2eb20b1, %l5 = fffffe5ffffffc4d
	ldswa	[%i2+0x038]%asi,%l5	! %l5 = ffffffffc2eb20b1
!	%l3 = 0000000000000000, Mem[0000000014800008] = 0c19b02e
	stba	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = 0019b02e
!	Mem[0000000032000010] = 9c30bc65, %l5 = ffffffffc2eb20b1
	lduwa	[%o4+0x010]%asi,%g2	! %g2 = ffffffffc2eb20b1

p1_label_197:
!	%l6 = 00000000a9ceb672, %l2 = 000000000c55dbbe, %l0 = fdb4d284f3826940
	sra	%l6,%l2,%l0		! %l0 = fffffffffffffffe
!	%f30 = bf800000, %f6  = 00000000 80000000
	fitod	%f30,%f6 		! %f6  = c1d02000 00000000
	fbe,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[0000000014800008] = 0019b02e, %l5 = ffffffffc2eb20b1
	ldsha	[%i1+%o6]0x80,%l5	! Annulled
p1_b224:
	membar	#Sync			! Added by membar checker (360)
!	%f8  = 42c00000, %f10 = bf800000 80000000
	fstox	%f8 ,%f10		! %f10 = 00000000 00000060

p1_label_198:
!	%l7 = 0000006e7363cd61, %l5 = ffffffffc2eb20b1, %l6 = 00000000a9ceb672
	srl	%l7,%l5,%l6		! %l6 = 00000000000039b1
!	Mem[0000000031800014] = ff8f0ccd, %l1 = 000001a000000000
	lduw	[%o3+0x014],%l1		! %l1 = 00000000ff8f0ccd
!	%f8  = 42c00000, %f1  = 00000000
	fcmpes	%fcc3,%f8 ,%f1 		! %fcc3 = 2
!	%l6 = 00000000000039b1, %l4 = 000000000000ffff, %l0 = fffffffffffffffe
	srlx	%l6,%l4,%l0		! %l0 = 0000000000000000
!	%l6 = 00000000000039b1, immed = 00000021, %l1 = 00000000ff8f0ccd
	sllx	%l6,0x021,%l1		! %l1 = 0000736200000000

p1_label_199:
!	Mem[000000001400014c] = 0a585e3e, %l3 = 0000000000000000
	ldsh	[%i0+0x14e],%l3		! %l3 = 0000000000005e3e
	bpos	p1_b225			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000030000057] = 000000ff, %l7 = 0000006e7363cd61
	ldstub	[%o0+0x057],%l7		! %l7 = 00000000000000ff
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x0e1,%g2
p1_b225:
	membar	#Sync			! Added by membar checker (361)
	set	p1_b226,%o7
	fba,pn	%fcc3,p1_near_3_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000031000050] = 360cffe2, %l6 = 00000000000039b1
	ldsh	[%o2+0x050],%l6		! %l6 = 000000000000360c
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p1_branch_failed
	mov	0x0e2,%g2
p1_b226:
!	Registers modified during the branch to p1_near_3
!	%l4  = 00000000ffffffff

p1_label_200:
	membar	#Sync			! Added by membar checker (362)
!	%l6 = 000000000000360c, immed = fffffa64, %y  = fdb4d284
	sdiv	%l6,-0x59c,%l7		! %l7 = 000000007fffffff
!	%f16 = bf800000 80000000, %f12 = ffffffff bc000004
	fmovd	%f16,%f12		! %f12 = bf800000 80000000
!	Mem[0000000015800008] = 0000303f, %l7 = 000000007fffffff
	ldstuba	[%i3+%o6]0x80,%l7	! %l7 = 0000000000000000
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000015800184] = 0698161c, %l4 = 00000000ffffffff
	ldsh	[%i3+0x186],%l4		! Annulled
	nop
p1_b227:
	nop

!	End of Random Code for Processor 1

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x004]		! Set processor 1 done flag

!	Check Registers

p1_check_registers:
	set	p1_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000736200000000
	bne,a,pn %xcc,p1_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000c55dbbe
	bne,a,pn %xcc,p1_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000005e3e
	bne,a,pn %xcc,p1_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000ffffffff
	bne,a,pn %xcc,p1_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffc2eb20b1
	bne,a,pn %xcc,p1_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000360c
	bne,a,pn %xcc,p1_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xfdb4d284,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p1_failed
	mov	0x111,%g1

!	Check Floating Point Registers

p1_check_fp_registers:
	set	p1_temp,%g1
	set	p1_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 3ff00000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 56000000 80000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffffffff e0000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be c1d02000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 42c00000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000060
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be bf800000 80000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 56000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be bf800000 80000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 3ff00000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 80000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ee0654aa 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 80000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ffffffff ffffffff
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be bf800000 80000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p1_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 05ffffff0000baeb
	ldx	[%i0+0x000],%g3		! Observed data at 0000000014000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000fffffffff9d6
	ldx	[%i0+0x008],%g3		! Observed data at 0000000014000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 74fc4be100000766
	ldx	[%i0+0x040],%g3		! Observed data at 0000000014000040
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x068],%g2		! Expect data = ffa2d46b8ed0595a
	ldx	[%i0+0x068],%g3		! Observed data at 0000000014000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x080],%g2		! Expect data = 0000033cc72f746f
	ldx	[%i0+0x080],%g3		! Observed data at 0000000014000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = ffffe694557314d4
	ldx	[%i0+0x0e0],%g3		! Observed data at 00000000140000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 00000000e9ffffba
	ldx	[%i0+0x118],%g3		! Observed data at 0000000014000118
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x130],%g2		! Expect data = fffde1300000303f
	ldx	[%i0+0x130],%g3		! Observed data at 0000000014000130
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x138],%g2		! Expect data = f993ffffa52cc4b1
	ldx	[%i0+0x138],%g3		! Observed data at 0000000014000138
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x170],%g2		! Expect data = ab910fd3b80e6019
	ldx	[%i0+0x170],%g3		! Observed data at 0000000014000170
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x180],%g2		! Expect data = 00000075542084cd
	ldx	[%i0+0x180],%g3		! Observed data at 0000000014000180
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 00001dc8e2eb3c42
	ldx	[%i0+0x1b0],%g3		! Observed data at 00000000140001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 3be2c333000000b7
	ldx	[%i0+0x1e8],%g3		! Observed data at 00000000140001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 73ea7928b118b7ff
	ldx	[%i0+0x1f8],%g3		! Observed data at 00000000140001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff8f0ccd00002115
	ldx	[%i1+0x000],%g3		! Observed data at 0000000014800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0019b02e00000000
	ldx	[%i1+0x008],%g3		! Observed data at 0000000014800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 00000000b97656d3
	ldx	[%i1+0x078],%g3		! Observed data at 0000000014800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 0000000000000377
	ldx	[%i1+0x0e0],%g3		! Observed data at 00000000148000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 0c80db726238ff36
	ldx	[%i1+0x0e8],%g3		! Observed data at 00000000148000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x120],%g2		! Expect data = aa15cfdbfffff05e
	ldx	[%i1+0x120],%g3		! Observed data at 0000000014800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = cac59051ebe24c57
	ldx	[%i1+0x128],%g3		! Observed data at 0000000014800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x178],%g2		! Expect data = cdeb2f6480f34dff
	ldx	[%i1+0x178],%g3		! Observed data at 0000000014800178
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x178,%g4

	set	p1_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000004aa0000
	ldx	[%i2+0x000],%g3		! Observed data at 0000000015000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff000071cfc0ffff
	ldx	[%i2+0x008],%g3		! Observed data at 0000000015000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 2d5163ffd1e0a594
	ldx	[%i2+0x020],%g3		! Observed data at 0000000015000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x050],%g2		! Expect data = c32f7057ffffffb1
	ldx	[%i2+0x050],%g3		! Observed data at 0000000015000050
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 62b2c43b00000000
	ldx	[%i2+0x098],%g3		! Observed data at 0000000015000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = f3e5469c998678ff
	ldx	[%i2+0x0b8],%g3		! Observed data at 00000000150000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 0000003600000000
	ldx	[%i2+0x118],%g3		! Observed data at 0000000015000118
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 0000baeb0000009f
	ldx	[%i2+0x120],%g3		! Observed data at 0000000015000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 0c19b02e00000000
	ldx	[%i2+0x128],%g3		! Observed data at 0000000015000128
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x130],%g2		! Expect data = dcd26da817cd215e
	ldx	[%i2+0x130],%g3		! Observed data at 0000000015000130
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x130,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 0000000009fd29f9
	ldx	[%i2+0x198],%g3		! Observed data at 0000000015000198
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = ffffffff0000baeb
	ldx	[%i2+0x1d8],%g3		! Observed data at 00000000150001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d8,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = e3c7264c000000bc
	ldx	[%i2+0x1e8],%g3		! Observed data at 00000000150001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = cc9eed723602b7ff
	ldx	[%i2+0x1f8],%g3		! Observed data at 00000000150001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ea00ba3000000000
	ldx	[%i3+0x000],%g3		! Observed data at 0000000015800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff00303f00000000
	ldx	[%i3+0x008],%g3		! Observed data at 0000000015800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x030],%g2		! Expect data = ad6657eff79e0000
	ldx	[%i3+0x030],%g3		! Observed data at 0000000015800030
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 74daeda8e1d6ae90
	ldx	[%i3+0x048],%g3		! Observed data at 0000000015800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = d679ee4f2e446fa6
	ldx	[%i3+0x0d0],%g3		! Observed data at 00000000158000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = f8ff28ac00000000
	ldx	[%i3+0x0d8],%g3		! Observed data at 00000000158000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 78a44c5bffffffff
	ldx	[%i3+0x120],%g3		! Observed data at 0000000015800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 0000000000000002
	ldx	[%i3+0x128],%g3		! Observed data at 0000000015800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x140],%g2		! Expect data = d4694b0bbc59245c
	ldx	[%i3+0x140],%g3		! Observed data at 0000000015800140
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x160],%g2		! Expect data = 00000000ffffffff
	ldx	[%i3+0x160],%g3		! Observed data at 0000000015800160
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x160,%g4

	set	p1_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 92000fe5ffd7f470
	ldx	[%i4+0x000],%g3		! Observed data at 0000000016000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x190],%g2		! Expect data = ffffffab69c1a062
	ldx	[%i4+0x190],%g3		! Observed data at 0000000016000190
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x190,%g4

	set	p1_local5_expect,%g1
	ldx	[%g1+0x060],%g2		! Expect data = 813fa866da30bf88
	ldx	[%i5+0x060],%g3		! Observed data at 0000000016800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = b935cda5d096fc0d
	ldx	[%i5+0x0e0],%g3		! Observed data at 00000000168000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = fa3d579682d29e0a
	ldx	[%i5+0x0e8],%g3		! Observed data at 00000000168000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e8,%g4

	set	p1_local6_expect,%g1
	ldx	[%g1+0x080],%g2		! Expect data = 0000000050ed477b
	ldx	[%i6+0x080],%g3		! Observed data at 0000000017000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x080,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p1_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p1_memcheck_share0:
	ldx	[%g4+0x10],%g2	! Expected value = 00000eb102090562
	ldx	[%o0+0x10],%g3	! Read value at Mem[0000000030000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 0071a466ffffffff
	ldx	[%o0+0x18],%g3	! Read value at Mem[0000000030000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 4cf6a711000000ff
	ldx	[%o0+0x50],%g3	! Read value at Mem[0000000030000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 0000303f76022326
	ldx	[%o0+0x58],%g3	! Read value at Mem[0000000030000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p1_memcheck_share1:
	ldx	[%g4+0x10],%g2	! Expected value = ffff04aa6017df28
	ldx	[%o1+0x10],%g3	! Read value at Mem[0000000030800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 744e38027568b7b5
	ldx	[%o1+0x18],%g3	! Read value at Mem[0000000030800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 283fe896000000ff
	ldx	[%o1+0x50],%g3	! Read value at Mem[0000000030800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 77005ae4bdc5e552
	ldx	[%o1+0x58],%g3	! Read value at Mem[0000000030800058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p1_memcheck_share2:
	ldx	[%g4+0x10],%g2	! Expected value = 000000a5e9ffff45
	ldx	[%o2+0x10],%g3	! Read value at Mem[0000000031000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 000000a800000000
	ldx	[%o2+0x18],%g3	! Read value at Mem[0000000031000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 360cffe2e1d6ae90
	ldx	[%o2+0x50],%g3	! Read value at Mem[0000000031000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = d88bfbac4baa4539
	ldx	[%o2+0x58],%g3	! Read value at Mem[0000000031000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p1_memcheck_share3:
	ldx	[%g4+0x10],%g2	! Expected value = 2320746fff8f0ccd
	ldx	[%o3+0x10],%g3	! Read value at Mem[0000000031800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 0000005214f53edb
	ldx	[%o3+0x18],%g3	! Read value at Mem[0000000031800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = e22ade7900176e50
	ldx	[%o3+0x50],%g3	! Read value at Mem[0000000031800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 2b37be4178f9c0f6
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
	prefetch [%i0+0x120],2
	xnorcc	%l5,%l4,%l7
	ldd	[%o3+0x010],%l6		! Mem[0000000031800010]
	subc	%l6,-0xb79,%l7
	done

p1_trap1o:
	prefetch [%o0+0x120],2
	xnorcc	%l5,%l4,%l7
	ldd	[%i3+0x010],%l6		! Mem[0000000031800010]
	subc	%l6,-0xb79,%l7
	done


p1_trap2e:
	lduh	[%i0+0x11e],%l0		! Mem[000000001400011e]
	done

p1_trap2o:
	lduh	[%o0+0x11e],%l0		! Mem[000000001400011e]
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
	ldx	[%g1+0x000],%l0	! %l0 = 5d02f5003c7f1718
	ldx	[%g1+0x008],%l1	! %l1 = 742263ffd107f247
	ldx	[%g1+0x010],%l2	! %l2 = 7c60f0007acce717
	ldx	[%g1+0x018],%l3	! %l3 = 936ce0ffd5460001
	ldx	[%g1+0x020],%l4	! %l4 = f94a54ffeb2931cb
	ldx	[%g1+0x028],%l5	! %l5 = bfbeb8ff8ad8a7de
	ldx	[%g1+0x030],%l6	! %l6 = 80f81d00746a98dd
	ldx	[%g1+0x038],%l7	! %l7 = ed5737ffbeb48d62

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
	ldd	[%g1+0x00],%f0		! %f0  = 3ade65f7, %f1  = 3f7819eb
	ldd	[%g1+0x08],%f2		! %f2  = ad176057, %f3  = 4bed7399
	ldd	[%g1+0x10],%f4		! %f4  = 3a35430b, %f5  = 6d62d6b3
	ldd	[%g1+0x18],%f6		! %f6  = 49ee9cbc, %f7  = 2a255f76
	ldd	[%g1+0x20],%f8		! %f8  = ba158c73, %f9  = f8c7b132
	ldd	[%g1+0x28],%f10		! %f10 = 1738ec2b, %f11 = 119e54a1
	ldd	[%g1+0x30],%f12		! %f12 = 24b31ad1, %f13 = 6b100c18
	ldd	[%g1+0x38],%f14		! %f14 = 804f6119, %f15 = f5461a4d
	ldd	[%g1+0x40],%f16		! %f16 = 12b4ebf0, %f17 = b58f40cf
	ldd	[%g1+0x48],%f18		! %f18 = bc1aa725, %f19 = 6171270d
	ldd	[%g1+0x50],%f20		! %f20 = abe66954, %f21 = 76b35bab
	ldd	[%g1+0x58],%f22		! %f22 = 7db270e1, %f23 = e87bdd5d
	ldd	[%g1+0x60],%f24		! %f24 = 78b91746, %f25 = 2eb7ab97
	ldd	[%g1+0x68],%f26		! %f26 = 8eff5fc7, %f27 = 76c03cb8
	ldd	[%g1+0x70],%f28		! %f28 = a2fc6987, %f29 = b01a8f4f
	ldd	[%g1+0x78],%f30		! %f30 = dacf9ab3, %f31 = cb78da30
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 2

p2_label_1:
	membar	#Sync			! Added by membar checker (363)
!	Mem[0000000019000000] = 5f6b98fa, %l0 = bb7beaffc30bb067
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000005f6b
!	%l3 = 58c83afff46acc1d, Mem[0000000019800000] = 39512dec
	stha	%l3,[%i3+%g0]0x80	! Mem[0000000019800000] = cc1d2dec
!	%l0 = 0000000000005f6b, Mem[000000003180002b] = e1adb88c
	stba	%l0,[%o3+0x02b]%asi	! Mem[0000000031800028] = e1adb86b
!	Mem[0000000031800064] = c49a8633, %l0 = 0000000000005f6b
	swap	[%o3+0x064],%l0		! %l0 = 00000000c49a8633
!	Mem[00000000188000a0] = bac9f82a 123c5052 ac5a91d7 66a80ad7
	prefetch [%i1+0x0a0],22

p2_label_2:
!	%l4 = 3cfb14007b2c990c
	setx	0x1157a7601157a760,%g7,%l4 ! %l4 = 1157a7601157a760
!	%f17 = b58f40cf, %f24 = 78b91746 2eb7ab97
	fitod	%f17,%f24		! %f24 = c1d29c2f cc400000
!	%l1 = 51c51e0009a04f78, immed = fffff62f, %l6 = 323d7d0044a3f638
	xorcc	%l1,-0x9d1,%l6		! %l6 = ae3ae1fff65fb957, %ccr = 88
	set	p2_b1,%o7
	fbe,a	p2_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800028] = e1adb86b, %l1 = 51c51e0009a04f78
	swap	[%o3+0x028],%l1		! %l1 = 00000000e1adb86b
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x001,%g2
p2_b1:
!	Registers modified during the branch to p2_far_3
!	%l1  = 00624d4319800000

p2_label_3:
	membar	#Sync			! Added by membar checker (364)
!	%l6 = ae3ae1fff65fb957, Mem[000000003180006c] = 8407e3f3
	stwa	%l6,[%o3+0x06c]%asi	! Mem[000000003180006c] = f65fb957
!	Branch On Register, %l1 = 00624d4319800000
	brz,a,pn %l1,p2_not_taken_0	! Branch Not Taken
!	%l4 = 1157a7601157a760, Mem[00000000188000ae] = 66a80ad7
	sth	%l4,[%i1+0x0ae]		! Annulled
p2_b2:
	membar	#Sync			! Added by membar checker (365)
!	Mem[0000000030000064] = ecff8891, %l6 = ae3ae1fff65fb957
	ldsb	[%o0+0x065],%l6		! %l6 = ffffffffffffffff
	fbl,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_4:
!	Mem[0000000019000000] = 5f6b98fa996bd987, %l1 = 00624d4319800000
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = 5f6b98fa996bd987
p2_b3:
	membar	#Sync			! Added by membar checker (366)
!	%l3 = 58c83afff46acc1d, %l6 = ffffffffffffffff, %y  = 00000000
	umulcc	%l3,%l6,%l7		! %l7 = f46acc1c0b9533e3, %ccr = 80
!	%l7 = f46acc1c0b9533e3, immed = fffff52f, %l3 = 58c83afff46acc1d
	sub	%l7,-0xad1,%l3		! %l3 = f46acc1c0b953eb4
!	Mem[000000001a800000] = c2de5721, %l7 = f46acc1c0b9533e3
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = ffffffffffffc2de
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 80

p2_label_5:
!	%l0 = 00000000c49a8633, Mem[0000000031800021] = f89719fb
	stb	%l0,[%o3+0x021]		! Mem[0000000031800020] = f83319fb
p2_b4:
	set	p2_b5,%o7
	fbge,a	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003080006c] = e44feeef, %l1 = 5f6b98fa996bd987
	lduw	[%o1+0x06c],%l1		! %l1 = 00000000e44feeef
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x005,%g2
p2_b5:
!	Registers modified during the branch to p2_far_0
!	%l0  = 1157a76011579b0e
!	%l1  = eea8589feea864f1
	membar	#Sync			! Added by membar checker (367)
!	%f18 = bc1aa725 6171270d, %f18 = bc1aa725 6171270d, %f14 = 804f6119 f5461a4d
	fdivd	%f18,%f18,%f14		! %f14 = 3ff00000 00000000
	set	p2_b6,%o7
	fbo,a	p2_far_1_he	! Branch Taken, %fcc0 = 0

p2_label_6:
!	Mem[000000003180006d] = f65fb957, %l2 = a69eeeffc8f6bcb2
	ldstub	[%o3+0x06d],%l2		! %l2 = 000000000000005f
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x006,%g2
p2_b6:
!	Registers modified during the branch to p2_far_1
!	%l0  = 000000000000004a
!	%l2  = 000000000d10adac
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (368)
!	%l1 = eea8589feea864f1
	sethi	%hi(0xfab0e800),%l1	! %l1 = 00000000fab0e800
!	Mem[0000000018800060] = 149b0dbe e51425a3 0bb1ef7a 7d410468
	prefetch [%i1+0x060],20
!	%l7 = ffffffffffffc2de, Mem[000000003080002b] = 3511a25d
	stb	%l7,[%o1+0x02b]		! Mem[0000000030800028] = 3511a2de
!	%l0 = 000000000000004a, Mem[000000001b000000] = 049ce354
	stha	%l0,[%i6+%g0]0x80	! Mem[000000001b000000] = 004ae354

p2_label_7:
	fbul	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l5 = 0000000000000000, Mem[0000000018800000] = 4eb43d9a
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000018800000] = 00b43d9a
p2_b7:
	membar	#Sync			! Added by membar checker (369)
!	%f4  = 3a35430b, %f8  = ba158c73, %f21 = 76b35bab
	fadds	%f4 ,%f8 ,%f21		! %f21 = 38fdb4c0
!	Mem[0000000019800000] = cc1d2dec, %l4 = 1157a7601157a760
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000cc1d2dec
!	%f0  = 3ade65f7 3f7819eb, %f14 = 3ff00000 00000000, %f12 = 24b31ad1 6b100c18
	fmuld	%f0 ,%f14,%f12		! %f12 = 3ade65f7 3f7819eb

p2_label_8:
	set	p2_b8,%o7
	fbule,a,pt %fcc2,p2_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000019800008] = c0a63eb5, %l3 = f46acc1c0b953eb4
	swapa	[%i3+%o6]0x80,%l3	! %l3 = 00000000c0a63eb5
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x008,%g2
p2_b8:
!	Registers modified during the branch to p2_near_2
!	%l3  = 00000000f2a04000
!	%l4  = 0000000007ffffff
	membar	#Sync			! Added by membar checker (370)
!	Mem[000000001800006c] = a83ca97d, %l3 = 00000000f2a04000
	ldsw	[%i0+0x06c],%l3		! %l3 = ffffffffa83ca97d
	fblg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = ffffffffa83ca97d, Mem[0000000018000178] = 2f837e80
	stb	%l3,[%i0+0x178]		! Mem[0000000018000178] = 7d837e80
p2_b9:

p2_label_9:
	membar	#Sync			! Added by membar checker (371)
!	%l0 = 000000000000004a, immed = fffffe5e, %y  = f46acc1c
	sdiv	%l0,-0x1a2,%l0		! %l0 = 000000007fffffff
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l6 = ffffffff, %l7 = ffffc2de, Mem[0000000030000020] = 0d10adac e6acc0e6
	std	%l6,[%o0+0x020]	! Mem[0000000030000020] = ffffffff ffffc2de
p2_b10:
	membar	#Sync			! Added by membar checker (372)
!	Branch On Register, %l5 = 0000000000000000
	brgez,pt %l5,p2_b11		! Branch Taken
!	%l2 = 000000000d10adac, Mem[0000000019800008] = 0b953eb478167f12
	stxa	%l2,[%i3+%o6]0x80	! Mem[0000000019800008] = 000000000d10adac
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x00b,%g2
p2_b11:

p2_label_10:
	membar	#Sync			! Added by membar checker (373)
!	%l2 = 000000000d10adac, %l4 = 0000000007ffffff, %l6 = ffffffffffffffff
	srlx	%l2,%l4,%l6		! %l6 = 0000000000000000
!	%f3  = 4bed7399, %f12 = 3ade65f7 3f7819eb
	fstox	%f3 ,%f12		! %f12 = 00000000 01dae732
!	%l5 = 0000000000000000, %l3 = ffffffffa83ca97d, %l1 = 00000000fab0e800
	srl	%l5,%l3,%l1		! %l1 = 0000000000000000
	ba	p2_b12			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000019000000] = 5f6b98fa, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = 000000005f6b98fa
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x00c,%g2
p2_b12:

p2_label_11:
	be	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000018000000] = 40a584ca, %l7 = ffffffffffffc2de
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 0000000040a584ca
p2_b13:
	membar	#Sync			! Added by membar checker (374)
	fbn,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[000000001980008c] = ea4b8880, %l6 = 0000000000000000
	ldsb	[%i3+0x08d],%l6		! %l6 = 000000000000004b
p2_b14:
	membar	#Sync			! Added by membar checker (375)
!	Mem[0000000030800068] = ae1db2bb, %l6 = 000000000000004b
	lduh	[%o1+0x06a],%l6		! %l6 = 000000000000b2bb

p2_label_12:
!	%l5 = 000000005f6b98fa, %l3 = ffffffffa83ca97d, %l3 = ffffffffa83ca97d
	srl	%l5,%l3,%l3		! %l3 = 0000000000000002
!	%f2  = ad176057, %f11 = 119e54a1
	fcmpes	%fcc1,%f2 ,%f11		! %fcc1 = 1
	nop				! Delay added due to fcmp
	fbuge,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[000000001a800008] = 3a2a28c8, %l3 = 0000000000000002
	ldswa	[%i5+%o6]0x80,%l3	! Annulled
p2_b15:
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_he,%g1
	jmpl	%g1,%g6

p2_label_13:
!	Mem[0000000032000014] = a121acca, %l7 = 0000000040a584ca
	ldsw	[%o4+0x014],%g2		! %g2 = 0000000040a584ca
!	Registers modified during the branch to p2_jmpl_3
!	%l1  = 0000000040a57866
!	%l5  = 00000000001c781a
	membar	#Sync			! Added by membar checker (376)
!	%l1 = 0000000040a57866, Mem[0000000019800008] = 00000000
	stba	%l1,[%i3+%o6]0x80	! Mem[0000000019800008] = 66000000
!	%l3 = 0000000000000002, Mem[00000000190001d8] = 1185a2f71d5a8575
	stx	%l3,[%i2+0x1d8]		! Mem[00000000190001d8] = 0000000000000002
!	Mem[0000000019800000] = cc1d2dec, %l4 = 0000000007ffffff
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000cc1d2dec
	bpos,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08

p2_label_14:
!	Mem[0000000019800158] = 63eaf823de164d2b, %l2 = 000000000d10adac
	ldx	[%i3+0x158],%l2		! Annulled
p2_b16:
	membar	#Sync			! Added by membar checker (377)
!	%f13 = 01dae732, %f10 = 1738ec2b 119e54a1
	fitod	%f13,%f10		! %f10 = 417dae73 20000000
!	Branch On Register, %l6 = 000000000000b2bb
	brgz,a,pt %l6,p2_b17		! Branch Taken
!	%l0 = 7fffffff, %l1 = 40a57866, Mem[0000000018000008] = a9f3b873 05045298
	stda	%l0,[%i0+%o6]0x80	! Mem[0000000018000008] = 7fffffff 40a57866
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x011,%g2
p2_b17:
	fblg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_15:
!	Mem[0000000019000008] = 4069d2c7, %l5 = 00000000001c781a
	lduba	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000040
p2_b18:
	membar	#Sync			! Added by membar checker (378)
!	Mem[000000001880012c] = 2044a997, %l7 = 0000000040a584ca
	lduba	[%i1+0x12f]%asi,%l7	! %l7 = 0000000000000097
!	%f23 = e87bdd5d, %f11 = 20000000
	fmovs	%f23,%f11		! %f11 = e87bdd5d
!	Mem[000000001a000008] = e4f11003, %l7 = 0000000000000097
	ldswa	[%i4+%o6]0x80,%l7	! %l7 = ffffffffe4f11003
!	Mem[0000000030000020] = ffffffff ffffc2de, %l4 = cc1d2dec, %l5 = 00000040
	ldda	[%o0+0x020]%asi,%l4	! %l4 = 00000000ffffffff 00000000ffffc2de

p2_label_16:
	bneg	p2_b19			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000018000040] = ff7224ff 244c4a73 68c7b3d6 f8505c98
	prefetch [%i0+0x040],23
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x013,%g2
p2_b19:
	membar	#Sync			! Added by membar checker (379)
!	%l0 = 000000007fffffff, %l6 = 000000000000b2bb, %l6 = 000000000000b2bb
	srax	%l0,%l6,%l6		! %l6 = 0000000000000000
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l7 = ffffffffe4f11003, Mem[0000000019800008] = 66000000
	stwa	%l7,[%i3+%o6]0x80	! Mem[0000000019800008] = e4f11003
p2_b20:

p2_label_17:
	membar	#Sync			! Added by membar checker (380)
!	Branch On Register, %l3 = 0000000000000002
	brlez,pn %l3,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000018800008] = 7f4ece34, %l3 = 0000000000000002
	ldstuba	[%i1+%o6]0x80,%l3	! %l3 = 000000000000007f
p2_b21:
	membar	#Sync			! Added by membar checker (381)
!	%l2 = 000000000d10adac, Mem[000000001900008a] = 407ecfed
	sth	%l2,[%i2+0x08a]		! Mem[0000000019000088] = 407eadac
!	%l0 = 000000007fffffff, Mem[0000000018000157] = 6d400b55
	stb	%l0,[%i0+0x157]		! Mem[0000000018000154] = 6d400bff
!	Mem[0000000019800108] = 676218c7, %l1 = 40a57866, %l5 = ffffc2de
	add	%i3,0x108,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 00000000676218c7

p2_label_18:
!	Mem[0000000018800008] = ff4ece34, %l6 = 0000000000000000
	ldstuba	[%i1+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000019000160] = e9ce56ab f367e88f b87fe39e 06b55d78
	prefetch [%i2+0x160],3
!	%f2  = ad176057, %f11 = e87bdd5d, %f16 = 12b4ebf0 b58f40cf
	fsmuld	%f2 ,%f11,%f16		! %f16 = 42c29dcb 4ec35360
!	%f20 = abe66954, %f4  = 3a35430b
	fmovs	%f20,%f4 		! %f4  = abe66954
!	Mem[000000003000002c] = 16ad0125, %l5 = 676218c7, %l2 = 0d10adac
	add	%o0,0x2c,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 0000000016ad0125

p2_label_19:
!	%l0 = 000000007fffffff, %l4 = 00000000ffffffff, %l4 = 00000000ffffffff
	orncc	%l0,%l4,%l4		! %l4 = ffffffff7fffffff, %ccr = 80
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetcha [%o4+0x040]%asi,21
!	%l7 = ffffffffe4f11003, Mem[0000000019800000] = 07ffffff
	stwa	%l7,[%i3+%g0]0x80	! Mem[0000000019800000] = e4f11003
!	%l4 = ffffffff7fffffff, Mem[000000001b0000a0] = d1f34e0cda381c1c
	stx	%l4,[%i6+0x0a0]		! Mem[000000001b0000a0] = ffffffff7fffffff
!	Branch On Register, %l6 = 00000000000000ff
	brgez,pn %l6,p2_b22		! Branch Taken

p2_label_20:
!	Mem[0000000019800000] = e4f11003, %l3 = 000000000000007f
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffe4f1
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x016,%g2
p2_b22:
	membar	#Sync			! Added by membar checker (382)
!	%f26 = 8eff5fc7 76c03cb8, %f8  = ba158c73 f8c7b132
	fnegd	%f26,%f8 		! %f8  = 0eff5fc7 76c03cb8
!	Mem[0000000030000028] = 3ce13520, %l0 = 7fffffff, %l6 = 000000ff
	add	%o0,0x28,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 000000003ce13520
!	%l2 = 0000000016ad0125, %l5 = 00000000676218c7, %l7 = ffffffffe4f11003
	orcc	%l2,%l5,%l7		! %l7 = 0000000077ef19e7, %ccr = 00
!	%l7 = 0000000077ef19e7, Mem[0000000019000008] = 4069d2c7
	stwa	%l7,[%i2+%o6]0x80	! Mem[0000000019000008] = 77ef19e7

p2_label_21:
!	%f31 = cb78da30, %f31 = cb78da30, %f19 = 6171270d
	fadds	%f31,%f31,%f19		! %f19 = cbf8da30
	set	p2_b23,%o7
	fbe	p2_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000000] = 40a584ca, %l6 = 000000003ce13520
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000040
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x017,%g2
p2_b23:
!	Registers modified during the branch to p2_far_3
!	%l0  = 000000004ddea900
!	%l1  = 000000007098fc4a
!	%l3  = ffffffff80000000
!	%l5  = 0000000000106da9
!	%l7  = 000000007098fc8a
	membar	#Sync			! Added by membar checker (383)
!	%l4 = ffffffff7fffffff, %l0 = 000000004ddea900, %l4 = ffffffff7fffffff
	xor	%l4,%l0,%l4		! %l4 = ffffffff322156ff
!	%l4 = ffffffff322156ff, immed = 00000b95, %l3 = ffffffff80000000
	andcc	%l4,0xb95,%l3		! %l3 = 0000000000000295, %ccr = 00

p2_label_22:
!	%l4 = ffffffff322156ff, immed = 0000031f, %l5 = 0000000000106da9
	orncc	%l4,0x31f,%l5		! %l5 = fffffffffffffeff, %ccr = 88
	set	p2_b24,%o7
	fble,a,pt %fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 0
!	%l3 = 0000000000000295, Mem[0000000018800044] = d58a9384
	stw	%l3,[%i1+0x044]		! Mem[0000000018800044] = 00000295
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x018,%g2
p2_b24:
!	Registers modified during the branch to p2_near_3
!	%l1  = 0000000000000295
!	%l2  = 000000004dac0af0
!	%l3  = 00000000438045bf
!	%l4  = ffffffff80000000
	membar	#Sync			! Added by membar checker (384)
!	Mem[00000000198001c0] = c3b61786 633038e3 fdc79bc4 d5b57c27
	prefetcha [%i3+0x1c0]%asi,23
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_23:
!	%l2 = 4dac0af0, %l3 = 438045bf, Mem[000000001a8000d8] = 5f51a551 cf78bc18
	std	%l2,[%i5+0x0d8]	! Mem[000000001a8000d8] = 4dac0af0 438045bf
p2_b25:
	membar	#Sync			! Added by membar checker (385)
	fblg,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l3 = 00000000438045bf, Mem[0000000018800170] = 689fe224
	stw	%l3,[%i1+0x170]		! Annulled
p2_b26:
	membar	#Sync			! Added by membar checker (386)
!	Mem[0000000019000060] = 8534eac9 d9c8f52a ba43ded6 a819706a
	prefetch [%i2+0x060],3
!	%l2 = 4dac0af0, %l3 = 438045bf, Mem[0000000018800050] = dd404c66 eb391a84
	std	%l2,[%i1+0x050]	! Mem[0000000018800050] = 4dac0af0 438045bf

p2_label_24:
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,3
!	Mem[0000000019000000] = 5f6b98fa, %l4 = ffffffff80000000
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = 000000005f6b98fa
	set	p2_b27,%o7
	fbe	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetch [%o4+0x020],1
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x01b,%g2
p2_b27:
!	Registers modified during the branch to p2_far_0
!	%l0  = 000000005f6b8ca8
!	%l1  = 000000005f6b8ce8
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_25:
!	Mem[0000000018000008] = 7fffffff, %l6 = 0000000000000040
	ldsba	[%i0+%o6]0x80,%l6	! %l6 = 000000000000007f
p2_b28:
	fbu,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003100002c] = 8ef0c9b4, %l3 = 00000000438045bf
	ldub	[%o2+0x02c],%l3		! Annulled
p2_b29:
	membar	#Sync			! Added by membar checker (387)
!	Mem[000000001b000040] = ff4aea30 f4823450 c9338571 db7988c5
	prefetch [%i6+0x040],22
!	%l7 = 000000007098fc8a, immed = fffff530, %l4 = 000000005f6b98fa
	xor	%l7,-0xad0,%l4		! %l4 = ffffffff8f6709ba

p2_label_26:
	set	p2_b30,%o7
	fbe	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003080002c] = 7d4fabbf, %l2 = 000000004dac0af0
	ldub	[%o1+0x02f],%l2		! %l2 = 00000000000000bf
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x01e,%g2
p2_b30:
!	Registers modified during the branch to p2_far_0
!	%l0  = ffffffff8f66fd68
!	%l1  = ffffffff8f66fd17
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001800018e] = ffe17e61, %l7 = 000000007098fc8a
	ldstub	[%i0+0x18e],%l7		! Annulled
p2_b31:
	membar	#Sync			! Added by membar checker (388)
!	Mem[0000000018000008] = 7fffffff40a57866, %l5 = fffffffffffffeff
	ldxa	[%i0+%o6]0x80,%l5	! %l5 = 7fffffff40a57866

p2_label_27:
!	%l2 = 00000000000000bf, Mem[0000000018000160] = ea2b960c38a14934
	stx	%l2,[%i0+0x160]		! Mem[0000000018000160] = 00000000000000bf
!	Mem[0000000019000100] = 39f6fd06 44006b3a 1ad25ab7 cf134840
	prefetch [%i2+0x100],0
!	Mem[000000003200007c] = 17df7ad6, %l1 = ffffffff8f66fd17
	ldsh	[%o4+0x07c],%g2		! %g2 = 00000000000017df
!	%l1 = ffffffff8f66fd17, immed = fffff952, %y  = f46acc1c
	smul	%l1,-0x6ae,%l1		! %l1 = 000002f01e11705e
!	Branch On Register, %l3 = 00000000438045bf
	brlz,a,pt %l3,p2_not_taken_0	! Branch Not Taken

p2_label_28:
!	Mem[0000000030800024] = 5f4a6421, %l5 = 7fffffff40a57866
	ldsh	[%o1+0x026],%l5		! Annulled
p2_b32:
	set	p2_b33,%o7
	fbge	p2_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000080] = ec8ed47f 8d4d677f e3d1aca1 cad8ac5b
	prefetch [%i0+0x080],1
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x021,%g2
p2_b33:
!	Registers modified during the branch to p2_far_1
!	%l0  = 000000000000004a
!	%l2  = 00000000ffffffff
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (389)
!	Mem[0000000019000080] = 39be3e8b 5344661d 407eadac b487ac94
	prefetcha [%i2+0x080]%asi,1
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88

p2_label_29:
!	Mem[0000000019800140] = 43c17585 ecd8a81f 1cd1fd77 5b802c5a
	prefetch [%i3+0x140],0	! Annulled
p2_b34:
	membar	#Sync			! Added by membar checker (390)
!	%f14 = 3ff00000 00000000, %f10 = 417dae73 e87bdd5d, %f18 = bc1aa725 cbf8da30
	fsubd	%f14,%f10,%f18		! %f18 = c17dae73 d87bdd5d
!	%l7 = 000000007098fc8a, immed = fffff4ae, %l7 = 000000007098fc8a
	addcc	%l7,-0xb52,%l7		! %l7 = 000000007098f138, %ccr = 11
!	%l2 = 00000000ffffffff, Mem[0000000032000000] = 8f1e74911f47a2f8
	stx	%l2,[%o4+0x000]		! Mem[0000000032000000] = 00000000ffffffff
!	%f16 = 42c29dcb, %f20 = abe66954 38fdb4c0
	fstod	%f16,%f20		! %f20 = 405853b9 60000000

p2_label_30:
!	%l5 = 0000000000000000, immed = fffffee6, %y  = 000002f0
	smul	%l5,-0x11a,%l5		! %l5 = 0000000000000000
	set	p2_b35,%o7
	fbne,a,pn %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000031000067] = d1d23371, %l4 = ffffffff8f6709ba
	ldstub	[%o2+0x067],%l4		! %l4 = 0000000000000071
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p2_branch_failed
	mov	0x023,%g2
p2_b35:
!	Registers modified during the branch to p2_near_0
!	%l0  = 000000000000005f
!	%l5  = 0000000100000071
	membar	#Sync			! Added by membar checker (391)
!	%l6 = 000000000000007f, immed = 000002ae, %y  = 00000000
	umul	%l6,0x2ae,%l1		! %l1 = 0000000000015452
	bne	p2_b36			! Branch Taken, %ccr = 11, CWP = 0

p2_label_31:
!	Mem[0000000018800008] = ff4ece34, %l7 = 000000007098f138
	lduba	[%i1+%o6]0x80,%l7	! %l7 = 00000000000000ff
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x024,%g2
p2_b36:
	membar	#Sync			! Added by membar checker (392)
!	Mem[00000000180000c0] = ba7aae94 5f759b5b bde25dd8 b5cd329b
	prefetch [%i0+0x0c0],3
!	%l1 = 0000000000015452
	setx	0xadb3fd65adb3fd65,%g7,%l1 ! %l1 = adb3fd65adb3fd65
!	%l5 = 0000000100000071, %l4 = 0000000000000071, %l6 = 000000000000007f
	xnor	%l5,%l4,%l6		! %l6 = fffffffeffffffff
!	call to call_3, CWP = 0
	call	p2_call_3_le

p2_label_32:
!	%l2 = 00000000ffffffff, Mem[0000000018800050] = 4dac0af0
	stb	%l2,[%i1+0x050]		! Mem[0000000018800050] = ffac0af0
!	Registers modified during the branch to p2_call_3
!	%l0  = 0000000000000000
	set	p2_b37,%o7
	fbue,a,pt %fcc2,p2_near_0_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],23
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x025,%g2
p2_b37:
!	Registers modified during the branch to p2_near_0
!	%l0  = 00000000000000ff
!	%l5  = 0000000100000071
	membar	#Sync			! Added by membar checker (393)
!	%f20 = 405853b9 60000000, %f14 = 3ff00000
	fdtos	%f20,%f14		! %f14 = 42c29dcb
!	%f7  = 2a255f76, %f17 = 4ec35360, %f24 = c1d29c2f cc400000
	fsmuld	%f7 ,%f17,%f24		! %f24 = 3f2f8b64 b6439000

p2_label_33:
!	%l4 = 0000000000000071, immed = 00000c08, %y  = 00000000
	smulcc	%l4,0xc08,%l6		! %l6 = 0000000000054f88, %ccr = 00
!	%l1 = adb3fd65adb3fd65, Mem[0000000019800000] = e4f11003
	stwa	%l1,[%i3+%g0]0x80	! Mem[0000000019800000] = adb3fd65
!	Mem[0000000030000028] = 3ce13520 16ad0125, %l0 = 000000ff, %l1 = adb3fd65
	ldda	[%o0+0x028]%asi,%l0	! %l0 = 000000003ce13520 0000000016ad0125
!	%l4 = 0000000000000071, immed = fffff037, %y  = 00000000
	umul	%l4,-0xfc9,%l1		! %l1 = 00000070fff90847
!	Mem[0000000018800000] = 00b43d9a, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000

p2_label_34:
!	%f22 = 7db270e1, %f11 = e87bdd5d
	fnegs	%f22,%f11		! %f11 = fdb270e1
!	%l2 = 00000000ffffffff, %l2 = 00000000ffffffff, %y  = 00000070
	udivcc	%l2,%l2,%l1		! %l1 = 0000000000000071, %ccr = 00
!	%l7 = 0000000000000000, %l3 = 00000000438045bf, %l7 = 0000000000000000
	andncc	%l7,%l3,%l7		! %l7 = 0000000000000000, %ccr = 44
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l3 = 00000000438045bf, Mem[0000000018000000] = 40a584ca280fa0e9
	stxa	%l3,[%i0+%g0]0x80	! Annulled
p2_b38:

p2_label_35:
	membar	#Sync			! Added by membar checker (394)
!	%f24 = 3f2f8b64 b6439000, %f24 = 3f2f8b64 b6439000
	fcmped	%fcc2,%f24,%f24		! %fcc2 = 0
	nop				! Delay added due to fcmp
	fbug,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000074] = 1113430c, %l6 = 0000000000054f88
	ldub	[%o4+0x074],%g2		! Annulled
p2_b39:
	membar	#Sync			! Added by membar checker (395)
!	%l1 = 0000000000000071, immed = 00000f3f, %l4 = 0000000000000071
	taddcc	%l1,0xf3f,%l4		! %l4 = 0000000000000fb0, %ccr = 02
	set	p2_b40,%o7
	fble,pt	%fcc0,p2_near_2_le	! Branch Taken, %fcc0 = 0

p2_label_36:
!	Mem[0000000019000008] = 77ef19e7, %l5 = 0000000100000071
	swapa	[%i2+%o6]0x80,%l5	! %l5 = 0000000077ef19e7
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x028,%g2
p2_b40:
	set	p2_b41,%o7
	fble	p2_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000018800160] = 882d9fa5 cce5b133 350fc7b7 daa57687
	prefetch [%i1+0x160],4
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x029,%g2
p2_b41:
!	Registers modified during the branch to p2_far_3
!	%l1  = 0000003ce1352000
	ba,a	p2_b42			! Branch Taken, %ccr = 02, CWP = 0
!	%l2 = 00000000ffffffff, Mem[0000000018800010] = 44425035
	stb	%l2,[%i1+0x010]		! Annulled
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x02a,%g2
p2_b42:

p2_label_37:
	membar	#Sync			! Added by membar checker (396)
!	%l6 = 0000000000054f88, Mem[0000000031000069] = 00000000
	stb	%l6,[%o2+0x069]		! Mem[0000000031000068] = 00880000
!	%l1 = 0000003ce1352000, immed = 00000e3a, %l2 = 00000000ffffffff
	or	%l1,0xe3a,%l2		! %l2 = 0000003ce1352e3a
!	%l4 = 0000000000000fb0, %l7 = 0000000000000000, %l7 = 0000000000000000
	orncc	%l4,%l7,%l7		! %l7 = ffffffffffffffff, %ccr = 88
!	%f8  = 0eff5fc7 76c03cb8, %f26 = 8eff5fc7 76c03cb8, %f14 = 42c29dcb 00000000
	fsubd	%f8 ,%f26,%f14		! %f14 = 0f0f5fc7 76c03cb8
!	Branch On Register, %l7 = ffffffffffffffff
	brgz,a,pn %l7,p2_not_taken_0	! Branch Not Taken

p2_label_38:
!	Mem[000000001880005c] = 63d8b725, %l4 = 0000000000000fb0
	lduh	[%i1+0x05c],%l4		! Annulled
p2_b43:
	membar	#Sync			! Added by membar checker (397)
!	Mem[0000000031000028] = 3bb42b1d 8ef0c9b4, %l6 = 00054f88, %l7 = ffffffff
	ldd	[%o2+0x028],%l6		! %l6 = 000000003bb42b1d 000000008ef0c9b4
!	%l7 = 000000008ef0c9b4, immed = fffff574, %y  = 00000070
	udivx	%l7,-0xa8c,%l3		! %l3 = 0000000000000000
!	Mem[000000001900016a] = b87fe39e, %l0 = 000000003ce13520
	ldstuba	[%i2+0x16a]%asi,%l0	! %l0 = 00000000000000e3
!	Mem[0000000031800028] = b87fe39e 000000e3, %l3 = 0000000000000000, %l7 = 000000008ef0c9b4
	add	%o3,0x28,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 00000000001c781a

p2_label_39:
	set	p2_b44,%o7
	fbge,a	p2_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000190000c8] = 4c03c398, %l6 = 000000003bb42b1d
	ldub	[%i2+0x0c8],%l6		! %l6 = 000000000000004c
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x02c,%g2
p2_b44:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000f9fe5914
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l6  = 000000000d1f7f14
	membar	#Sync			! Added by membar checker (398)
!	%f25 = b6439000, %f20 = 405853b9
	fmovs	%f25,%f20		! %f20 = b6439000
!	%f12 = 00000000, %f30 = dacf9ab3, %f6  = 49ee9cbc
	fdivs	%f12,%f30,%f6 		! %f6  = 80000000
!	%l5 = 0000000077ef19e7, Mem[000000003000002a] = 3ce13520
	sth	%l5,[%o0+0x02a]		! Mem[0000000030000028] = 3ce119e7

p2_label_40:
	bne	p2_b45			! Branch Taken, %ccr = 00, CWP = 0
!	%l2 = 0000003ce1352e3a, Mem[0000000018800008] = ff4ece34
	stha	%l2,[%i1+%o6]0x80	! Mem[0000000018800008] = 2e3ace34
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x02d,%g2
p2_b45:
	membar	#Sync			! Added by membar checker (399)
!	%f30 = dacf9ab3, %f5  = 6d62d6b3, %f16 = 42c29dcb 4ec35360
	fsmuld	%f30,%f5 ,%f16		! %f16 = c916fe95 d019a520
!	%l1 = 0000000000000000, %l4 = 0000000000000fb0, %y  = 00000070
	sdiv	%l1,%l4,%l3		! %l3 = 000000000723b27c
!	%l4 = 0000000000000fb0, immed = 000004e0, %l5 = 0000000077ef19e7
	add	%l4,0x4e0,%l5		! %l5 = 0000000000001490

p2_label_41:
!	%f20 = b6439000 60000000, %f10 = 417dae73 fdb270e1
	fcmpd	%fcc2,%f20,%f10		! %fcc2 = 1
!	Mem[0000000019000164] = f367e88f, %l2 = 0000003ce1352e3a
	lduwa	[%i2+0x164]%asi,%l2	! %l2 = 00000000f367e88f
!	Mem[0000000019800178] = 151ce28c89da4349, %l2 = 00000000f367e88f
	ldx	[%i3+0x178],%l2		! %l2 = 151ce28c89da4349
!	Mem[00000000180001d2] = a6a4310b, %l6 = 000000000d1f7f14
	ldstuba	[%i0+0x1d2]%asi,%l6	! %l6 = 0000000000000031
!	%f1  = 3f7819eb, %f6  = 80000000 2a255f76
	fstod	%f1 ,%f6 		! %f6  = 3fef033d 60000000

p2_label_42:
!	%l4 = 0000000000000fb0, immed = 00000d03, %l4 = 0000000000000fb0
	or	%l4,0xd03,%l4		! %l4 = 0000000000000fb3
!	%f10 = 417dae73 fdb270e1, %f28 = a2fc6987 b01a8f4f
	fmovd	%f10,%f28		! %f28 = 417dae73 fdb270e1
!	%f27 = 76c03cb8, %f9  = 76c03cb8, %f17 = d019a520
	fadds	%f27,%f9 ,%f17		! %f17 = 77403cb8
!	%l5 = 0000000000001490, Mem[0000000018800008] = 2e3ace34f4fe6bb0
	stxa	%l5,[%i1+%o6]0x80	! Mem[0000000018800008] = 0000000000001490
!	%f18 = c17dae73 d87bdd5d, %f10 = 417dae73 fdb270e1
	fabsd	%f18,%f10		! %f10 = 417dae73 d87bdd5d

p2_label_43:
!	%l1 = 0000000000000000, Mem[0000000019000040] = 091638b8f0339922
	stx	%l1,[%i2+0x040]		! Mem[0000000019000040] = 0000000000000000
!	%f26 = 8eff5fc7 76c03cb8, %f26 = 8eff5fc7 76c03cb8
	fmovd	%f26,%f26		! %f26 = 8eff5fc7 76c03cb8
!	Mem[00000000190000a8] = 62771c93 6e7b92fa, %l4 = 00000fb3, %l5 = 00001490
	ldda	[%i2+0x0a8]%asi,%l4	! %l4 = 0000000062771c93 000000006e7b92fa
!	%l0 = 00000000f9fe5914, Mem[0000000031000020] = 69287eb5
	stw	%l0,[%o2+0x020]		! Mem[0000000031000020] = f9fe5914
!	%f19 = d87bdd5d, %f21 = 60000000
	fnegs	%f19,%f21		! %f21 = 587bdd5d

p2_label_44:
!	%l6 = 0000000000000031, immed = fffff3a1, %y  = 00000070
	sdivx	%l6,-0xc5f,%l7		! %l7 = 0000000000000000
	set	p2_b46,%o7
	fbule,pt %fcc3,p2_near_3_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000019000008] = 00000071, %l3 = 000000000723b27c
	lduwa	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000071
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x02e,%g2
p2_b46:
!	Registers modified during the branch to p2_near_3
!	%l0  = 000000006e7b932b
!	%l1  = 0000000000000b5e
!	%l4  = fffffffffffff291
!	%l5  = 000000000b96de45
	membar	#Sync			! Added by membar checker (400)
!	%l7 = 0000000000000000, Mem[0000000031800060] = 5e0cbb4c00005f6b
	stx	%l7,[%o3+0x060]		! Mem[0000000031800060] = 0000000000000000
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00

p2_label_45:
!	%l4 = fffffffffffff291, Mem[0000000018000008] = 7fffffff
	stwa	%l4,[%i0+%o6]0x80	! Annulled
p2_b47:
	membar	#Sync			! Added by membar checker (401)
!	Mem[0000000032000074] = 430cebde, %l4 = fffffffffffff291
	ldsb	[%o4+0x076],%g2		! %g2 = 0000000000000043
!	%l7 = 0000000000000000, %l5 = 000000000b96de45, %l3 = 0000000000000071
	xor	%l7,%l5,%l3		! %l3 = 000000000b96de45
!	%l5 = 000000000b96de45, immed = fffff8af, %l7 = 0000000000000000
	xnorcc	%l5,-0x751,%l7		! %l7 = 000000000b96d915, %ccr = 00
	fblg,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_46:
!	%l7 = 000000000b96d915, Mem[0000000019000000] = 5f6b98fa
	stha	%l7,[%i2+%g0]0x80	! Annulled
p2_b48:
	membar	#Sync			! Added by membar checker (402)
!	Mem[0000000031000064] = d1d233ff, %l0 = 000000006e7b932b
	swapa	[%o2+0x064]%asi,%l0	! %l0 = 00000000d1d233ff
!	%l1 = 0000000000000b5e, %l1 = 0000000000000b5e, %y  = 00000070
	umul	%l1,%l1,%l3		! %l3 = 0000000000813684
!	Mem[0000000030800068] = 6e7b932b 00000043, %l4 = fffffffffffff291, %l1 = 0000000000000b5e
	add	%o1,0x68,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = ae1db2bbe44feeef
!	Mem[00000000190001a0] = e8fc1460 d5b97f9d
	flush	%i2+0x1a0

p2_label_47:
!	%f30 = dacf9ab3 cb78da30, %f8  = 0eff5fc7 76c03cb8
	fcmped	%fcc3,%f30,%f8 		! %fcc3 = 1
!	%l1 = ae1db2bbe44feeef, immed = 00000c24, %y  = 00000000
	sdivcc	%l1,0xc24,%l7		! %l7 = 000000000012ce3e, %ccr = 00
!	Branch On Register, %l2 = 151ce28c89da4349
	brgz,pt	%l2,p2_b49		! Branch Taken
!	Mem[0000000018000008] = 7fffffff, %l1 = ae1db2bbe44feeef
	ldstuba	[%i0+%o6]0x80,%l1	! %l1 = 000000000000007f
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x031,%g2
p2_b49:
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_48:
!	%l4 = fffff291, %l5 = 0b96de45, Mem[0000000031800068] = f6411d2e f6ffb957
	std	%l4,[%o3+0x068]	! Annulled
p2_b50:
	membar	#Sync			! Added by membar checker (403)
!	Mem[000000001a800168] = 62fa1f59d96c141e, %l4 = fffffffffffff291
	ldxa	[%i5+0x168]%asi,%l4	! %l4 = 62fa1f59d96c141e
!	%f31 = cb78da30, %f12 = 00000000
	fstoi	%f31,%f12		! %f12 = ff0725d0
!	Mem[000000003000006c] = d55d1034, %l7 = 000000000012ce3e
	swap	[%o0+0x06c],%l7		! %l7 = 00000000d55d1034
!	%f27 = 76c03cb8, %f15 = 76c03cb8, %f9  = 76c03cb8
	fadds	%f27,%f15,%f9 		! %f9  = 77403cb8

p2_label_49:
!	%l3 = 0000000000813684, Mem[0000000030800024] = ff4a6421
	stw	%l3,[%o1+0x024]		! Mem[0000000030800024] = 00813684
!	Mem[0000000018000138] = 4a420b3e, %l7 = 00000000d55d1034
	swap	[%i0+0x138],%l7		! %l7 = 000000004a420b3e
!	%l1 = 000000000000007f, immed = 00000012, %l3 = 0000000000813684
	srlx	%l1,0x012,%l3		! %l3 = 0000000000000000
!	%l0 = 00000000d1d233ff, Mem[0000000018800008] = 0000000000001490
	stxa	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = 00000000d1d233ff
!	%l1 = 000000000000007f, immed = 0000000f, %l5 = 000000000b96de45
	sra	%l1,0x00f,%l5		! %l5 = 0000000000000000

p2_label_50:
	set	p2_b51,%o7
	fbuge	p2_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000030800024] = 00813684, %l7 = 000000004a420b3e
	ldsh	[%o1+0x024],%l7		! %l7 = 0000000000000081
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x033,%g2
p2_b51:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000f9fe5914
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (404)
!	Mem[0000000019800000] = adb3fd65, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ad
	bgu	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000019800184] = 59645cde, %l0 = 00000000f9fe5914
	ldsh	[%i3+0x186],%l0		! %l0 = 0000000000005cde
p2_b52:

p2_label_51:
	membar	#Sync			! Added by membar checker (405)
!	Mem[0000000018800008] = 00000000, %l7 = 0000000000000081
	ldstuba	[%i1+%o6]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000ad, immed = 00000e27, %l2 = 151ce28c89da4349
	xnor	%l3,0xe27,%l2		! %l2 = fffffffffffff175
	fbne,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l5 = 0000000000000000, Mem[0000000031000068] = 00880000
	stw	%l5,[%o2+0x068]		! Annulled
p2_b53:
	membar	#Sync			! Added by membar checker (406)
!	Mem[0000000031800024] = 82714212, %l7 = 0000000000000000
	swapa	[%o3+0x024]%asi,%l7	! %l7 = 0000000082714212

p2_label_52:
!	%l5 = 0000000000000000, Mem[00000000190000ac] = 6e7b92fa
	stwa	%l5,[%i2+0x0ac]%asi	! Mem[00000000190000ac] = 00000000
	bpos	p2_b54			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000031000024] = 467ee2e9, %l7 = 0000000082714212
	ldsb	[%o2+0x024],%l7		! %l7 = 0000000000000046
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x036,%g2
p2_b54:
	membar	#Sync			! Added by membar checker (407)
!	%l1 = 0000000000000000, immed = 00000ba4, %l2 = fffffffffffff175
	andn	%l1,0xba4,%l2		! %l2 = 0000000000000000
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_53:
!	 Annulled
	ldda	[%i0+%o6]0x80,%l0
p2_b55:
	membar	#Sync			! Added by membar checker (408)
!	%f24 = 3f2f8b64 b6439000, %f26 = 8eff5fc7 76c03cb8
	fnegd	%f24,%f26		! %f26 = bf2f8b64 b6439000
!	Mem[0000000018800000] = ffb43d9a, %l3 = 00000000000000ad
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 000000000000ffb4
!	%l2 = 0000000000000000, immed = fffff1eb, %l0 = 0000000000005cde
	addcc	%l2,-0xe15,%l0		! %l0 = fffffffffffff1eb, %ccr = 88
!	Mem[0000000019000180] = 6635c914 c9b72f67 faeacf2e eac6d4e7
	prefetcha [%i2+0x180]%asi,21

p2_label_54:
!	%f11 = d87bdd5d, %f18 = c17dae73 d87bdd5d
	fitod	%f11,%f18		! %f18 = c1c3c211 51800000
	bgu,a	p2_b56			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000003180002c] = 001c781a, %l3 = 000000000000ffb4
	swap	[%o3+0x02c],%l3		! %l3 = 00000000001c781a
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x038,%g2
p2_b56:
	membar	#Sync			! Added by membar checker (409)
!	%f22 = 7db270e1 e87bdd5d, %f4  = abe66954 6d62d6b3
	fcmpd	%fcc1,%f22,%f4 		! %fcc1 = 2
!	Mem[00000000190001a4] = d5b97f9d, %l5 = 0000000000000000
	ldsha	[%i2+0x1a6]%asi,%l5	! %l5 = 0000000000007f9d

p2_label_55:
!	%l4 = 62fa1f59d96c141e, immed = 00000002, %l6 = 0000000000000000
	srl	%l4,0x002,%l6		! %l6 = 00000000365b0507
	fbue,a,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[00000000180000e0] = eb5f1456 2cae1869 d14b4840 b075773b
	prefetch [%i0+0x0e0],2	! Annulled
p2_b57:
	membar	#Sync			! Added by membar checker (410)
!	Mem[0000000019800140] = 43c17585, %l6 = 00000000365b0507
	ldsb	[%i3+0x141],%l6		! %l6 = ffffffffffffffc1
!	%l1 = 0000000000000000, immed = 0000088b, %l6 = ffffffffffffffc1
	addccc	%l1,0x88b,%l6		! %l6 = 000000000000088b, %ccr = 00

p2_label_56:
!	%f16 = c916fe95, %f19 = 51800000, %f0  = 3ade65f7
	fdivs	%f16,%f19,%f0 		! %f0  = b716fe95
	fbu,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[00000000180000d8] = d849c52b, %l3 = 00000000001c781a
	ldub	[%i0+0x0d8],%l3		! %l3 = 00000000000000d8
p2_b58:
	membar	#Sync			! Added by membar checker (411)
!	Mem[0000000018000020] = 2a175555 e5f0b448 14f8824d 4e55b2fd
	prefetch [%i0+0x020],4
!	Branch On Register, %l0 = fffffffffffff1eb
	brgz,pn	%l0,p2_not_taken_0	! Branch Not Taken

p2_label_57:
!	Mem[0000000031800064] = 00000000, %l2 = 0000000000000000
	lduw	[%o3+0x064],%l2		! %l2 = 0000000000000000
p2_b59:
	membar	#Sync			! Added by membar checker (412)
!	Mem[000000001a800180] = 3accf0ca6206a09d, %l5 = 0000000000007f9d
	ldx	[%i5+0x180],%l5		! %l5 = 3accf0ca6206a09d
!	%f19 = 51800000, %f19 = 51800000
	fcmps	%fcc0,%f19,%f19		! %fcc0 = 0
!	Mem[0000000018000000] = 40a584ca, %l4 = 62fa1f59d96c141e
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = 00000000000040a5
	bvc,a	p2_b60			! Branch Taken, %ccr = 00, CWP = 0

p2_label_58:
!	Mem[0000000031000027] = 467ee2e9, %l1 = 0000000000000000
	ldstub	[%o2+0x027],%l1		! %l1 = 00000000000000e9
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x03c,%g2
p2_b60:
	membar	#Sync			! Added by membar checker (413)
!	Mem[0000000031000068] = 00880000, %l4 = 00000000000040a5
	swap	[%o2+0x068],%l4		! %l4 = 0000000000880000
	set	p2_b61,%o7
	fbe	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	%l5 = 3accf0ca6206a09d, Mem[0000000032000055] = a1e99d9e
	stb	%l5,[%o4+0x055]		! Mem[0000000032000054] = 9de99d9e
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x03d,%g2
p2_b61:
!	Registers modified during the branch to p2_far_0
!	%l0  = 000000000087f3ae
!	%l1  = 000000000087fb25
	membar	#Sync			! Added by membar checker (414)
!	Branch On Register, %l2 = 0000000000000000
	brgez,a,pn %l2,p2_b62		! Branch Taken

p2_label_59:
!	Mem[0000000018800160] = 882d9fa5 cce5b133 350fc7b7 daa57687
	prefetch [%i1+0x160],22
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x03e,%g2
p2_b62:
	membar	#Sync			! Added by membar checker (415)
!	Mem[0000000019800000] = adb3fd65 3841e43c, %l2 = 00000000, %l3 = 000000d8
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000adb3fd65 000000003841e43c
	set	p2_b63,%o7
	fbuge,a	p2_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031000061] = c72172d5, %l0 = 000000000087f3ae
	ldstub	[%o2+0x061],%l0		! %l0 = 0000000000000021
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x03f,%g2
p2_b63:
!	Registers modified during the branch to p2_far_3
!	%l0  = 000000004ddea900
!	%l1  = 000000007098fc4a
!	%l3  = 0000000000000000
!	%l5  = 000958067b5f81ed
!	%l7  = 00000000709904d5
	membar	#Sync			! Added by membar checker (416)
!	%l0 = 000000004ddea900
	sethi	%hi(0xaa874c00),%l0	! %l0 = 00000000aa874c00

p2_label_60:
!	Mem[0000000019800100] = 3e00b6bd d176d4d6 676218c7 a5a393ea
	prefetcha [%i3+0x100]%asi,16
!	%l6 = 0000088b, %l7 = 709904d5, Mem[0000000032000070] = bf0be83e 1113430c
	stda	%l6,[%o4+0x070]%asi	! Mem[0000000032000070] = 0000088b 709904d5
!	Mem[0000000019000000] = 5f6b98fa, %l0 = 00000000aa874c00
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = 000000000000005f
	fbne,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000188000e0] = 4e193340 c224a8ef 110034bb cab288de
	prefetch [%i1+0x0e0],16	! Annulled
p2_b64:

p2_label_61:
	membar	#Sync			! Added by membar checker (417)
!	%f16 = c916fe95 77403cb8, %f18 = c1c3c211 51800000
	fabsd	%f16,%f18		! %f18 = 4916fe95 77403cb8
	ble	p2_b65			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[0000000019000008] = 00000071, %l6 = 000000000000088b
	ldstuba	[%i2+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x041,%g2
p2_b65:
	membar	#Sync			! Added by membar checker (418)
!	%f30 = dacf9ab3 cb78da30, %f30 = dacf9ab3 cb78da30, %f18 = 4916fe95 77403cb8
	faddd	%f30,%f30,%f18		! %f18 = dadf9ab3 cb78da30
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 02

p2_label_62:
!	Mem[0000000019800100] = 3e00b6bd d176d4d6 676218c7 a5a393ea
	prefetch [%i3+0x100],20	! Annulled
p2_b66:
	membar	#Sync			! Added by membar checker (419)
!	%f0  = b716fe95, %f16 = c916fe95, %f6  = 3fef033d
	fdivs	%f0 ,%f16,%f6 		! %f6  = 2d800000
!	%l5 = 000958067b5f81ed, %l1 = 000000007098fc4a, %l3 = 0000000000000000
	srl	%l5,%l1,%l3		! %l3 = 00000000001ed7e0
!	Mem[0000000031000060] = c7ff72d5, %l3 = 00000000001ed7e0
	swap	[%o2+0x060],%l3		! %l3 = 00000000c7ff72d5
!	Mem[00000000180000a0] = aea3b7df 2a77410a
	flush	%i0+0x0a0

p2_label_63:
!	Mem[0000000019800040] = 31885bf3 0e5258ef bad22a6a 26f21087
	prefetch [%i3+0x040],3
	set	p2_b67,%o7
	fble,pt	%fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000019800008] = e4f11003, %l7 = 00000000709904d5
	ldswa	[%i3+%o6]0x80,%l7	! %l7 = ffffffffe4f11003
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p2_branch_failed
	mov	0x043,%g2
p2_b67:
!	Registers modified during the branch to p2_near_3
!	%l1  = 00000000c7ff72d5
!	%l2  = 000000004dac0af0
!	%l3  = 00000000438045bf
!	%l4  = 00000000000ae8e2
	ble,a	p2_b68			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000019800008] = e4f11003, %l7 = ffffffffe4f11003
	lduwa	[%i3+%o6]0x80,%l7	! %l7 = 00000000e4f11003
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p2_branch_failed
	mov	0x044,%g2
p2_b68:

p2_label_64:
	membar	#Sync			! Added by membar checker (420)
	set	p2_b69,%o7
	fbo,pn	%fcc2,p2_near_2_he	! Branch Taken, %fcc2 = 1
!	%l6 = 0000000000000000, Mem[0000000019000008] = ff000071c6ccff22
	stxa	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x045,%g2
p2_b69:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000082537005
!	%l4  = 0000000000000000
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019800174] = 359ecab7, %l3 = 0000000082537005
	ldstub	[%i3+0x174],%l3		! %l3 = 0000000000000035
p2_b70:
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_65:
!	Mem[0000000032000010] = 9c30bc65a121acca, %l2 = 000000004dac0af0
	ldx	[%o4+0x010],%g2		! %g2 = 9c30bc65a121acca
p2_b71:
	bge	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l3 = 0000000000000035, Mem[000000001a800000] = c2de5721
	stha	%l3,[%i5+%g0]0x80	! Mem[000000001a800000] = 00355721
p2_b72:
	membar	#Sync			! Added by membar checker (421)
!	Mem[0000000031800064] = 00000000, %l4 = 0000000000000000
	ldsha	[%o3+0x066]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000018800120] = b363bf5a a88e58ed 1ed0a674 2044a997
	prefetcha [%i1+0x120]%asi,21

p2_label_66:
!	%l6 = 0000000000000000, immed = 00000987, %y  = 00000000
	udivcc	%l6,0x987,%l6		! %l6 = 0000000000000000, %ccr = 44
!	%l2 = 000000004dac0af0, Mem[0000000018000008] = ffffffff
	stba	%l2,[%i0+%o6]0x80	! Mem[0000000018000008] = f0ffffff
!	%l6 = 0000000000000000, immed = fffff66a, %y  = 00000000
	sdivcc	%l6,-0x996,%l3		! %l3 = 0000000000000000, %ccr = 44
!	%l5 = 000958067b5f81ed, Mem[0000000019800008] = e4f11003
	stba	%l5,[%i3+%o6]0x80	! Mem[0000000019800008] = edf11003
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l7 = 00000000e4f11003
	add	%l4,%l4,%l7		! %l7 = 0000000000000000

p2_label_67:
!	Mem[0000000018000040] = ff7224ff 244c4a73 68c7b3d6 f8505c98
	prefetcha [%i0+0x040]%asi,0
	set	p2_b73,%o7
	fblg,pn	%fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000018000008] = f0ffffff, %l6 = 0000000000000000
	ldsha	[%i0+%o6]0x80,%l6	! %l6 = fffffffffffff0ff
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x049,%g2
p2_b73:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 000958067b5f7488
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (422)
	set	p2_b74,%o7
	fbo,pn	%fcc0,p2_near_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000000] = 40a584ca, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l4	! %l4 = 0000000040a584ca
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p2_branch_failed
	mov	0x04a,%g2
p2_b74:
!	Registers modified during the branch to p2_near_0
!	%l1  = 000958067b5f7488

p2_label_68:
	ble,a	p2_b75			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000018000008] = f0ffffff, %l0 = 0000000000000000
	lduba	[%i0+%o6]0x80,%l0	! %l0 = 00000000000000f0
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x04b,%g2
p2_b75:
	membar	#Sync			! Added by membar checker (423)
	fbug,pn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000008] = 0000000000000000, %l7 = 0000000000000000
	ldxa	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000000
p2_b76:
	membar	#Sync			! Added by membar checker (424)
!	%l5 = 0000000000000000, immed = fffff26f, %l6 = fffffffffffff0ff
	andcc	%l5,-0xd91,%l6		! %l6 = 0000000000000000, %ccr = 44

p2_label_69:
!	Mem[0000000031000024] = 467ee2ff, %l0 = 00000000000000f0
	ldsha	[%o2+0x026]%asi,%l0	! %l0 = ffffffffffffe2ff
!	%l7 = 0000000000000000, %l4 = 0000000040a584ca, %l4 = 0000000040a584ca
	addcc	%l7,%l4,%l4		! %l4 = 0000000040a584ca, %ccr = 00
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[00000000190001e8] = c286f368, %l0 = ffffffffffffe2ff
	lduw	[%i2+0x1e8],%l0		! %l0 = 00000000c286f368
p2_b77:
	membar	#Sync			! Added by membar checker (425)
!	Mem[00000000188001fc] = a1ce6591, %l6 = 0000000000000000
	swapa	[%i1+0x1fc]%asi,%l6	! %l6 = 00000000a1ce6591

p2_label_70:
!	%l5 = 0000000000000000, %l1 = 000958067b5f7488, %l4 = 0000000040a584ca
	orcc	%l5,%l1,%l4		! %l4 = 000958067b5f7488, %ccr = 00
!	%l2 = 0000000000000000, Mem[0000000019800000] = adb3fd653841e43c
	stxa	%l2,[%i3+%g0]0x80	! Mem[0000000019800000] = 0000000000000000
!	%l2 = 0000000000000000, Mem[000000003080002a] = 3511a2de
	stba	%l2,[%o1+0x02a]%asi	! Mem[0000000030800028] = 351100de
!	Mem[000000001a800060] = c6ea6346 ca9f2c16 a55c1641 b314d75e
	prefetcha [%i5+0x060]%asi,22
!	%l2 = 0000000000000000, immed = fffff8f3, %l5 = 0000000000000000
	orcc	%l2,-0x70d,%l5		! %l5 = fffffffffffff8f3, %ccr = 88

p2_label_71:
!	%l1 = 000958067b5f7488, immed = fffff561, %l2 = 0000000000000000
	tsubcc	%l1,-0xa9f,%l2		! %l2 = 000958067b5f7f27, %ccr = 13
!	%l3 = 000958067b5f7488, Mem[0000000019000008] = 00000000
	stba	%l3,[%i2+%o6]0x80	! Mem[0000000019000008] = 88000000
	fbne	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 000958067b5f7488, Mem[0000000019000000] = 5f6b98fa
	stha	%l4,[%i2+%g0]0x80	! Mem[0000000019000000] = 748898fa
p2_b78:
	membar	#Sync			! Added by membar checker (426)
!	Mem[0000000030800068] = ae1db2bb e44feeef, %l0 = c286f368, %l1 = 7b5f7488
	ldda	[%o1+0x068]%asi,%l0	! %l0 = 00000000ae1db2bb 00000000e44feeef

p2_label_72:
!	%f26 = bf2f8b64 b6439000, %f24 = 3f2f8b64 b6439000, %f14 = 0f0f5fc7 76c03cb8
	fsubd	%f26,%f24,%f14		! %f14 = bf3f8b64 b6439000
!	%f16 = c916fe95, %f16 = c916fe95
	fabss	%f16,%f16		! %f16 = 4916fe95
!	Mem[0000000018000008] = f0ffffff, %l4 = 000958067b5f7488
	ldsba	[%i0+%o6]0x80,%l4	! %l4 = fffffffffffffff0
	set	p2_b79,%o7
	fbule,a	p2_far_2_he	! Branch Taken, %fcc0 = 0
!	%l1 = 00000000e44feeef, Mem[00000000188000f6] = afc323a2
	sth	%l1,[%i1+0x0f6]		! Mem[00000000188000f4] = afc3eeef
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x04f,%g2
p2_b79:
!	Registers modified during the branch to p2_far_2
!	%l1  = 0000000000000000
!	%l3  = ffffffffffc06a05
!	%l5  = 0000000000000000
!	%l6  = 00000000ae1db2bb
!	%l7  = 000040a5001c781a

p2_label_73:
	membar	#Sync			! Added by membar checker (427)
!	%l4 = fffffffffffffff0, %l6 = 00000000ae1db2bb, %l5 = 0000000000000000
	and	%l4,%l6,%l5		! %l5 = 00000000ae1db2b0
	fbge,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000019800008] = edf11003, %l6 = 00000000ae1db2bb
	lduwa	[%i3+%o6]0x80,%l6	! %l6 = 00000000edf11003
p2_b80:
	membar	#Sync			! Added by membar checker (428)
!	Mem[0000000030000068] = 778a6660, %l4 = fffffffffffffff0
	ldub	[%o0+0x069],%l4		! %l4 = 000000000000008a
!	Mem[0000000030000064] = ecff8891, %l2 = 000958067b5f7f27
	lduh	[%o0+0x066],%l2		! %l2 = 0000000000008891

p2_label_74:
!	%l1 = 0000000000000000, immed = 00000436, %l2 = 0000000000008891
	addcc	%l1,0x436,%l2		! %l2 = 0000000000000436, %ccr = 00
	bg,a	p2_b81			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000000] = 00000000 ffffffff af60c67b 2d367bd5
	prefetch [%o4+0x000],0
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x051,%g2
p2_b81:
	membar	#Sync			! Added by membar checker (429)
!	%l5 = 00000000ae1db2b0, Mem[0000000019800008] = edf11003
	stha	%l5,[%i3+%o6]0x80	! Mem[0000000019800008] = b2b01003
!	Mem[0000000018000134] = fa884537, %l0 = 00000000ae1db2bb
	lduw	[%i0+0x134],%l0		! %l0 = 00000000fa884537

p2_label_75:
!	Mem[0000000018000120] = f9a5389b 9f045b12 29893107 c01b2883
	prefetcha [%i0+0x120]%asi,3
!	%f26 = bf2f8b64, %f1  = 3f7819eb, %f17 = 77403cb8
	fadds	%f26,%f1 ,%f17		! %f17 = 3e911d0e
!	%l0 = 00000000fa884537
	setx	0x8ccc76818ccc7681,%g7,%l0 ! %l0 = 8ccc76818ccc7681
	fbn,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000080] = 39be3e8b 5344661d 407eadac b487ac94
	prefetch [%i2+0x080],3	! Annulled
p2_b82:

p2_label_76:
	membar	#Sync			! Added by membar checker (430)
!	%l7 = 000040a5001c781a, immed = 00000f7a, %y  = 00000000
	sdiv	%l7,0xf7a,%l3		! %l3 = 00000000000001d6
	set	p2_b83,%o7
	fbo,a,pn %fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000019800073] = 410e618a, %l1 = 0000000000000000
	ldstub	[%i3+0x073],%l1		! %l1 = 000000000000008a
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x053,%g2
p2_b83:
!	Registers modified during the branch to p2_near_0
!	%l0  = 0000008043f2a19e
!	%l2  = 001a75feea51084e
!	%l3  = 00000000ae1da54b
!	%l5  = fffd96b0b0a767ec
	membar	#Sync			! Added by membar checker (431)
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],21
	bneg	p2_b84			! Branch Taken, %ccr = 88, CWP = 0

p2_label_77:
!	Mem[0000000032000000] = 00000000 ffffffff af60c67b 2d367bd5
	prefetch [%o4+0x000],0
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x054,%g2
p2_b84:
	membar	#Sync			! Added by membar checker (432)
!	%l2 = 001a75feea51084e, immed = fffffdfc, %y  = fffd96b0
	mulx	%l2,-0x204,%l0		! %l0 = caaa2a2fb4ab42c8
!	Mem[0000000018800000] = ffb43d9a, %l6 = 00000000edf11003
	ldsba	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	%l7 = 000040a5001c781a, immed = fffff60a, %l3 = 00000000ae1da54b
	sub	%l7,-0x9f6,%l3		! %l3 = 000040a5001c8210
	set	p2_b85,%o7
	fbe,a	p2_far_3_he	! Branch Taken, %fcc0 = 0

p2_label_78:
!	%l5 = fffd96b0b0a767ec, Mem[0000000018000008] = f0ffffff
	stba	%l5,[%i0+%o6]0x80	! Mem[0000000018000008] = ecffffff
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x055,%g2
p2_b85:
!	Registers modified during the branch to p2_far_3
!	%l1  = da55a16400000000
	membar	#Sync			! Added by membar checker (433)
!	Branch On Register, %l1 = da55a16400000000
	brlez,a,pt %l1,p2_b86		! Branch Taken
!	Mem[0000000031000020] = f9fe5914, %l2 = 001a75feea51084e
	ldsb	[%o2+0x021],%l2		! %l2 = fffffffffffffffe
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x056,%g2
p2_b86:
	membar	#Sync			! Added by membar checker (434)
!	%l6 = ffffffffffffffff, immed = 0000063a, %y  = fffd96b0
	smul	%l6,0x63a,%l0		! %l0 = fffffffffffff9c6
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 88

p2_label_79:
!	Mem[00000000190001ac] = cc461e0a, %l5 = fffd96b0b0a767ec
	lduh	[%i2+0x1ae],%l5		! %l5 = 0000000000001e0a
p2_b87:
	membar	#Sync			! Added by membar checker (435)
!	%l6 = ffffffffffffffff, %l4 = 000000000000008a, %l7 = 000040a5001c781a
	or	%l6,%l4,%l7		! %l7 = ffffffffffffffff
	set	p2_b88,%o7
	fbule	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000070] = 33a5d8ce, %l1 = da55a16400000000
	lduw	[%i0+0x070],%l1		! %l1 = 0000000033a5d8ce
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x058,%g2
p2_b88:
!	Registers modified during the branch to p2_far_0
!	%l0  = fffffffffffff438
!	%l1  = 0000000000000bc7
	membar	#Sync			! Added by membar checker (436)
!	%l2 = fffffffffffffffe, %l3 = 000040a5001c8210, %l2 = fffffffffffffffe
	srl	%l2,%l3,%l2		! %l2 = 000000000000ffff

p2_label_80:
!	Mem[0000000018000008] = ecffffff, %l7 = ffffffffffffffff
	swapa	[%i0+%o6]0x80,%l7	! %l7 = 00000000ecffffff
	set	p2_b89,%o7
	fbuge	p2_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000000] = 40a584ca, %l2 = 000000000000ffff
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 00000000000040a5
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p2_branch_failed
	mov	0x059,%g2
p2_b89:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000f9fe5914
!	%l1  = ffffffffffffffff
!	%l3  = 0000000000000007
!	%l6  = ffffffffffe22127
	membar	#Sync			! Added by membar checker (437)
!	%f28 = 417dae73 fdb270e1, %f10 = 417dae73 d87bdd5d, %f4  = abe66954 6d62d6b3
	faddd	%f28,%f10,%f4 		! %f4  = 418dae73 eb17271f
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_81:
!	Mem[0000000019000008] = 88000000, %l4 = 000000000000008a
	ldsba	[%i2+%o6]0x80,%l4	! %l4 = ffffffffffffff88
p2_b90:
	ble	p2_b91			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000032000014] = a121acca, %l2 = 00000000000040a5
	ldsh	[%o4+0x014],%g2		! %g2 = ffffffffffffa121
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x05b,%g2
p2_b91:
	membar	#Sync			! Added by membar checker (438)
!	%f29 = fdb270e1, %f25 = b6439000
	fabss	%f29,%f25		! %f25 = 7db270e1
!	%l6 = ffe22127, %l7 = ecffffff, Mem[0000000019800180] = cb2b2fe3 59645cde
	stda	%l6,[%i3+0x180]%asi	! Mem[0000000019800180] = ffe22127 ecffffff

p2_label_82:
!	%f14 = bf3f8b64, %f14 = bf3f8b64 b6439000
	fitod	%f14,%f14		! %f14 = c1d0301d 27000000
!	%l7 = 00000000ecffffff, immed = 00000019, %l6 = ffffffffffe22127
	sra	%l7,0x019,%l6		! %l6 = fffffffffffffff6
!	%f28 = 417dae73 fdb270e1, %f28 = 417dae73 fdb270e1, %f6  = 2d800000 60000000
	fdivd	%f28,%f28,%f6 		! %f6  = 3ff00000 00000000
!	%l4 = ffffffffffffff88, %l3 = 0000000000000007, %y  = ffffffff
	udivcc	%l4,%l3,%l4		! %l4 = 00000000ffffffff, %ccr = 0a
!	%f7  = 00000000, %f27 = b6439000
	fstoi	%f7 ,%f27		! %f27 = 00000000

p2_label_83:
!	%f26 = bf2f8b64 00000000, %f14 = c1d0301d 27000000
	fcmped	%fcc0,%f26,%f14		! %fcc0 = 2
!	%l4 = 00000000ffffffff, immed = fffff939, %l1 = ffffffffffffffff
	or	%l4,-0x6c7,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000018800138] = bd5d3527 f9156235, %l0 = f9fe5914, %l1 = ffffffff
	ldda	[%i1+0x138]%asi,%l0	! %l0 = 00000000bd5d3527 00000000f9156235
!	%l3 = 0000000000000007, %l0 = 00000000bd5d3527, %l2 = 00000000000040a5
	orncc	%l3,%l0,%l2		! %l2 = ffffffff42a2cadf, %ccr = 80
!	Branch On Register, %l6 = fffffffffffffff6
	brlz,a,pn %l6,p2_b92		! Branch Taken

p2_label_84:
!	Mem[00000000180000cc] = b5cd329b, %l2 = ffffffff42a2cadf
	lduh	[%i0+0x0ce],%l2		! %l2 = 000000000000329b
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x05c,%g2
p2_b92:
	membar	#Sync			! Added by membar checker (439)
!	%l1 = 00000000f9156235, %l2 = 000000000000329b, %l5 = 0000000000001e0a
	xorcc	%l1,%l2,%l5		! %l5 = 00000000f91550ae, %ccr = 08
!	%f12 = ff0725d0 01dae732, %f6  = 3ff00000 00000000, %f2  = ad176057 4bed7399
	fmuld	%f12,%f6 ,%f2 		! %f2  = ff0725d0 01dae732
	set	p2_b93,%o7
	fblg	p2_far_3_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000018000008] = ffffffff, %l6 = fffffffffffffff6
	ldswa	[%i0+%o6]0x80,%l6	! %l6 = ffffffffffffffff
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p2_branch_failed
	mov	0x05d,%g2
p2_b93:
!	Registers modified during the branch to p2_far_3
!	%l1  = 5eae9a9380000000

p2_label_85:
	membar	#Sync			! Added by membar checker (440)
!	%l2 = 000000000000329b, immed = fffff990, %l3 = 0000000000000007
	addccc	%l2,-0x670,%l3		! %l3 = 0000000000002c2b, %ccr = 11
!	%l2 = 000000000000329b, immed = fffffcc4, %y  = ffffffff
	sdiv	%l2,-0x33c,%l6		! %l6 = 00000000004f2646
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018000194] = 5ed0a434, %l7 = 00000000ecffffff
	ldsw	[%i0+0x194],%l7		! %l7 = 000000005ed0a434
p2_b94:
	membar	#Sync			! Added by membar checker (441)
!	%f7  = 00000000, %f3  = 01dae732
	fmovs	%f7 ,%f3 		! %f3  = 00000000

p2_label_86:
!	Mem[0000000019800008] = b2b01003, %l6 = 00000000004f2646
	ldsha	[%i3+%o6]0x80,%l6	! %l6 = ffffffffffffb2b0
!	%l0 = 00000000bd5d3527, %l5 = 00000000f91550ae, %l2 = 000000000000329b
	sll	%l0,%l5,%l2		! %l2 = 00002f574d49c000
!	%l6 = ffffffffffffb2b0, immed = 00000031, %l2 = 00002f574d49c000
	srlx	%l6,0x031,%l2		! %l2 = 0000000000007fff
	fbuge,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],16
p2_b95:

p2_label_87:
	membar	#Sync			! Added by membar checker (442)
!	Mem[0000000019800008] = b2b010030d10adac, %l1 = 5eae9a9380000000
	ldxa	[%i3+%o6]0x80,%l1	! %l1 = b2b010030d10adac
!	%l3 = 0000000000002c2b, %l6 = ffffffffffffb2b0, %l3 = 0000000000002c2b
	xorcc	%l3,%l6,%l3		! %l3 = ffffffffffff9e9b, %ccr = 88
!	Mem[0000000019800000] = 00000000, %l7 = 000000005ed0a434
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Branch On Register, %l1 = b2b010030d10adac
	brnz,a,pt %l1,p2_b96		! Branch Taken
!	Mem[0000000018800008] = ff000000, %l3 = ffffffffffff9e9b
	ldstuba	[%i1+%o6]0x80,%l3	! %l3 = 00000000000000ff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x060,%g2
p2_b96:

p2_label_88:
	membar	#Sync			! Added by membar checker (443)
!	Mem[0000000019800040] = 31885bf3 0e5258ef bad22a6a 26f21087
	prefetch [%i3+0x040],1
!	%l1 = b2b010030d10adac, %l3 = 00000000000000ff, %l5 = 00000000f91550ae
	orncc	%l1,%l3,%l5		! %l5 = ffffffffffffffac, %ccr = 88
!	%f30 = dacf9ab3 cb78da30, %f18 = dadf9ab3 cb78da30, %f24 = 3f2f8b64 7db270e1
	faddd	%f30,%f18,%f24		! %f24 = dae7b406 d89aa3a4
	bleu	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],23
p2_b97:

p2_label_89:
	bneg,a	p2_b98			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000031000068] = 000040a5, %l2 = 0000000000007fff
	ldsh	[%o2+0x068],%l2		! %l2 = 0000000000000000
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p2_branch_failed
	mov	0x062,%g2
p2_b98:
	membar	#Sync			! Added by membar checker (444)
!	%f3  = 00000000, %f12 = ff0725d0, %f29 = fdb270e1
	fdivs	%f3 ,%f12,%f29		! %f29 = 80000000
!	Mem[0000000032000004] = ffffffff, %l0 = 00000000bd5d3527
	lduh	[%o4+0x004],%g2		! %g2 = 000000000000ffff
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 88

p2_label_90:
!	Mem[0000000018800000] = ffb43d9a, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
p2_b99:
	membar	#Sync			! Added by membar checker (445)
!	Mem[0000000031800060] = 00000000, %l1 = b2b010030d10adac
	swap	[%o3+0x060],%l1		! %l1 = 0000000000000000
!	%l0 = bd5d3527, %l1 = 00000000, Mem[0000000019800098] = db42c161 25d5a3f3
	stda	%l0,[%i3+0x098]%asi	! Mem[0000000019800098] = bd5d3527 00000000
	bne	p2_b100			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000018800000] = ffb43d9a 9c8a35db ff000000 d1d233ff
	prefetch [%i1+0x000],20
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x064,%g2
p2_b100:

p2_label_91:
	membar	#Sync			! Added by membar checker (446)
!	Mem[0000000018000068] = f8a9105e a83ca97d, %l0 = bd5d3527, %l1 = 00000000
	ldda	[%i0+0x068]%asi,%l0	! %l0 = 00000000f8a9105e 00000000a83ca97d
!	%l3 = 00000000000000ff, %l1 = 00000000a83ca97d, %l1 = 00000000a83ca97d
	xorcc	%l3,%l1,%l1		! %l1 = 00000000a83ca982, %ccr = 08
	bgu,a	p2_b101			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000032000064] = 0007c83f, %l1 = 00000000a83ca982
	ldub	[%o4+0x066],%g2		! %g2 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x065,%g2
p2_b101:
	membar	#Sync			! Added by membar checker (447)
!	%l7 = 00000000000000ff, immed = 00000035, %l1 = 00000000a83ca982
	srlx	%l7,0x035,%l1		! %l1 = 0000000000000000

p2_label_92:
!	Mem[0000000030800028] = 351100de7d4fabbf, %l4 = 00000000ffffffff
	ldx	[%o1+0x028],%l4		! %l4 = 351100de7d4fabbf
!	%l4 = 7d4fabbf, %l5 = ffffffac, Mem[0000000031000060] = 001ed7e0 6e7b932b
	std	%l4,[%o2+0x060]	! Mem[0000000031000060] = 7d4fabbf ffffffac
!	%l4 = 351100de7d4fabbf, Mem[00000000198001f0] = d5b3acde1c0119f0
	stx	%l4,[%i3+0x1f0]		! Mem[00000000198001f0] = 351100de7d4fabbf
	bg	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000032000000] = 00000000 ffffffff af60c67b 2d367bd5
	prefetch [%o4+0x000],4
p2_b102:

p2_label_93:
	membar	#Sync			! Added by membar checker (448)
!	%l4 = 351100de7d4fabbf, immed = 00000016, %l6 = ffffffffffffb2b0
	srl	%l4,0x016,%l6		! %l6 = 00000000000001f5
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019800140] = 43c17585 ecd8a81f 1cd1fd77 5b802c5a
	prefetch [%i3+0x140],22
p2_b103:
	membar	#Sync			! Added by membar checker (449)
!	%l0 = 00000000f8a9105e, immed = 0000027a, %y  = ffffffff
	mulx	%l0,0x27a,%l7		! %l7 = 00000267d2b288cc
!	%l6 = 00000000000001f5, immed = 00000671, %l7 = 00000267d2b288cc
	orncc	%l6,0x671,%l7		! %l7 = fffffffffffff9ff, %ccr = 88

p2_label_94:
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,21
	fbul,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldd	[%o0+0x060],%l0
p2_b104:
	membar	#Sync			! Added by membar checker (450)
!	%l6 = 00000000000001f5, immed = 00000a85, %l5 = ffffffffffffffac
	orncc	%l6,0xa85,%l5		! %l5 = fffffffffffff5ff, %ccr = 88
	bcc,a	p2_b105			! Branch Taken, %ccr = 88, CWP = 0

p2_label_95:
!	Mem[000000001a800100] = 549a6fa5 242aa348 ef95fcb0 a35784e9
	prefetch [%i5+0x100],22
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x069,%g2
p2_b105:
	membar	#Sync			! Added by membar checker (451)
	fbl,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001b0000a0] = ffffffff 7fffffff 9f210e6a 60de0eee
	prefetch [%i6+0x0a0],4	! Annulled
p2_b106:
	membar	#Sync			! Added by membar checker (452)
!	%l3 = 00000000000000ff, immed = 00000a4b, %y  = ffffffff
	udivx	%l3,0xa4b,%l6		! %l6 = 0000000000000000
!	%l0 = 00000000f8a9105e, %l3 = 00000000000000ff, %l3 = 00000000000000ff
	taddcc	%l0,%l3,%l3		! %l3 = 00000000f8a9115d, %ccr = 0a

p2_label_96:
!	%l4 = 351100de7d4fabbf, Mem[00000000188001d0] = e6f6f5637f31e53f
	stxa	%l4,[%i1+0x1d0]%asi	! Mem[00000000188001d0] = 351100de7d4fabbf
	bneg,a	p2_b107			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000018000040] = ff7224ff 244c4a73 68c7b3d6 f8505c98
	prefetch [%i0+0x040],2
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x06b,%g2
p2_b107:
	membar	#Sync			! Added by membar checker (453)
	fbg,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000019800008] = b2b01003, %l4 = 351100de7d4fabbf
	lduba	[%i3+%o6]0x80,%l4	! Annulled
p2_b108:

p2_label_97:
	membar	#Sync			! Added by membar checker (454)
!	Mem[0000000018800008] = ff000000, %l4 = 351100de7d4fabbf
	lduwa	[%i1+%o6]0x80,%l4	! %l4 = 00000000ff000000
!	%l7 = fffffffffffff9ff, immed = 00000031, %y  = ffffffff
	umulcc	%l7,0x031,%l7		! %l7 = 00000030fffed9cf, %ccr = 08
!	%f6  = 3ff00000 00000000, %f25 = d89aa3a4
	fdtoi	%f6 ,%f25		! %f25 = 00000001
	be	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l2 = 00000000, %l3 = f8a9115d, Mem[0000000018000008] = ffffffff 40a57866
	stda	%l2,[%i0+%o6]0x80	! Mem[0000000018000008] = 00000000 f8a9115d
p2_b109:

p2_label_98:
	membar	#Sync			! Added by membar checker (455)
!	Mem[000000001980019c] = 6fdfef87, %l5 = fffffffffffff5ff
	ldsw	[%i3+0x19c],%l5		! %l5 = 000000006fdfef87
!	%l6 = 0000000000000000, Mem[0000000018000008] = 00000000
	stba	%l6,[%i0+%o6]0x80	! Mem[0000000018000008] = 00000000
!	%l7 = 00000030fffed9cf, Mem[0000000018800008] = ff000000
	stba	%l7,[%i1+%o6]0x80	! Mem[0000000018800008] = cf000000
	set	p2_b110,%o7
	fbne,a,pt %fcc1,p2_near_3_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000019800000] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x06e,%g2
p2_b110:
!	Registers modified during the branch to p2_near_3
!	%l1  = 00000000f8a9115d
!	%l2  = 000000004dac0af0
!	%l3  = 00000000438045bf
!	%l4  = 000000000303c4b5

p2_label_99:
	membar	#Sync			! Added by membar checker (456)
	fbl,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000031800024] = 00000000, %l1 = 00000000f8a9115d
	lduh	[%o3+0x026],%l1		! %l1 = 0000000000000000
p2_b111:
	membar	#Sync			! Added by membar checker (457)
!	%f14 = c1d0301d 27000000, %f24 = dae7b406 00000001
	fcmpd	%fcc2,%f14,%f24		! %fcc2 = 2
!	Mem[00000000188001c8] = 4837981c, %l2 = 000000004dac0af0
	ldsb	[%i1+0x1c8],%l2		! %l2 = 0000000000000048
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_100:
!	Mem[0000000019800008] = b2b01003, %l2 = 0000000000000048
	ldstuba	[%i3+%o6]0x80,%l2	! Annulled
p2_b112:
	set	p2_b113,%o7
	fbuge	p2_far_3_he	! Branch Taken, %fcc0 = 2
!	Mem[00000000190000e8] = bce068fee09f1da9, %l4 = 000000000303c4b5
	ldx	[%i2+0x0e8],%l4		! %l4 = bce068fee09f1da9
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p2_branch_failed
	mov	0x071,%g2
p2_b113:
!	Registers modified during the branch to p2_far_3
!	%l1  = 00000000f8a9105e
	membar	#Sync			! Added by membar checker (458)
!	Mem[0000000018000000] = 40a584ca 280fa0e9, %l4 = e09f1da9, %l5 = 6fdfef87
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 0000000040a584ca 00000000280fa0e9
!	%l6 = 0000000000000000, %l5 = 00000000280fa0e9, %l3 = 00000000438045bf
	andncc	%l6,%l5,%l3		! %l3 = 0000000000000000, %ccr = 44

p2_label_101:
!	Mem[00000000188001f8] = e01b49a700000000, %l1 = 00000000f8a9105e
	ldxa	[%i1+0x1f8]%asi,%l1	! %l1 = e01b49a700000000

	ba,a	p2_not_taken_0_end
p2_not_taken_0:
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba,a	p2_branch_failed
p2_not_taken_0_end:

!	%f12 = ff0725d0, %f20 = b6439000 587bdd5d
	fitod	%f12,%f20		! %f20 = c16f1b46 00000000
!	%l0 = 00000000f8a9105e, immed = 000001b3, %l1 = e01b49a700000000
	xorcc	%l0,0x1b3,%l1		! %l1 = 00000000f8a911ed, %ccr = 08
!	Mem[0000000030800028] = 351100de, %l7 = 00000030fffed9cf
	swapa	[%o1+0x028]%asi,%l7	! %l7 = 00000000351100de
	fbe,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1

p2_label_102:
!	Mem[0000000018000000] = 40a584ca, %l1 = 00000000f8a911ed
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 00000000000040a5
p2_b114:
	membar	#Sync			! Added by membar checker (459)
!	%l4 = 0000000040a584ca
	setx	0xf2b7aa15f2b7aa15,%g7,%l4 ! %l4 = f2b7aa15f2b7aa15
	bge,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000019000008] = 88000000, %l2 = 0000000000000048
	ldsha	[%i2+%o6]0x80,%l2	! Annulled
p2_b115:
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 08

p2_label_103:
!	Mem[00000000198000d0] = 2e8d7a45 b4edf92b, %l6 = 00000000, %l7 = 351100de
	ldd	[%i3+0x0d0],%l6		! %l6 = 000000002e8d7a45 00000000b4edf92b
p2_b116:
	set	p2_b117,%o7
	fbg,a	p2_far_3_le	! Branch Taken, %fcc0 = 2
!	%l1 = 00000000000040a5, Mem[00000000180001af] = 4186de0b
	stb	%l1,[%i0+0x1af]		! Mem[00000000180001ac] = 4186dea5
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x075,%g2
p2_b117:
!	Registers modified during the branch to p2_far_3
!	%l0  = 000000004ddea900
!	%l1  = 000000007098fc4a
!	%l3  = 000000000482726f
!	%l5  = 0000000000065db2
!	%l7  = 000000009f26768f
	membar	#Sync			! Added by membar checker (460)
	set	p2_b118,%o7
	fbg,a,pt %fcc0,p2_near_2_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000018800000] = ffb43d9a9c8a35db, %l2 = 0000000000000048
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = ffb43d9a9c8a35db
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x076,%g2
p2_b118:
!	Registers modified during the branch to p2_near_2
!	%l3  = 000000006010c800
!	%l4  = 0000000000000000

p2_label_104:
	membar	#Sync			! Added by membar checker (461)
!	Mem[0000000019000000] = 748898fa, %l2 = ffb43d9a9c8a35db
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000074
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800040] = f9a725ef 00000295 751bcdf6 5f9c6962
	prefetch [%i1+0x040],1	! Annulled
p2_b119:
	membar	#Sync			! Added by membar checker (462)
!	Mem[000000003200007c] = df7ad600, %l6 = 000000002e8d7a45
	ldub	[%o4+0x07d],%g2		! %g2 = 00000000000000df
!	%f6  = 3ff00000 00000000, %f6  = 3ff00000 00000000, %f6  = 3ff00000 00000000
	fmuld	%f6 ,%f6 ,%f6 		! %f6  = 3ff00000 00000000

p2_label_105:
!	%l5 = 0000000000065db2, %l0 = 000000004ddea900, %y  = 00000030
	smul	%l5,%l0,%l5		! %l5 = 0001efb7fe368200
	set	p2_b120,%o7
	fbug,a	p2_far_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031000060] = 7d4fabbf ffffffac, %l2 = 00000074, %l3 = 6010c800
	ldd	[%o2+0x060],%l2		! %l2 = 000000007d4fabbf 00000000ffffffac
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x078,%g2
p2_b120:
!	Registers modified during the branch to p2_far_1
!	%l0  = 000000004dde9e56
!	%l2  = fffffffffffff194
!	%l5  = fffffffffffcc161
!	%l7  = fffffffffffff556
	membar	#Sync			! Added by membar checker (463)
!	Mem[0000000019800030] = 00000000 ffffffac, %l3 = 00000000ffffffac, %l3 = 00000000ffffffac
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 78e58235b3afa77b
	set	p2_b121,%o7
	fbg,pn	%fcc0,p2_near_2_le	! Branch Taken, %fcc0 = 2

p2_label_106:
!	Mem[0000000018000120] = f9a5389b 9f045b12 29893107 c01b2883
	prefetch [%i0+0x120],3
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x079,%g2
p2_b121:
	membar	#Sync			! Added by membar checker (464)
!	%f20 = c16f1b46 00000000, %f2  = ff0725d0 00000000
	fdtox	%f20,%f2 		! %f2  = ffffffff ff0725d0
!	%f6  = 3ff00000, %f22 = 7db270e1
	fnegs	%f6 ,%f22		! %f22 = bff00000
	fbg,a,pt %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000031000060] = 7d4fabbfffffffac, %l7 = fffffffffffff556
	ldx	[%o2+0x060],%l7		! Annulled
p2_b122:

p2_label_107:
	membar	#Sync			! Added by membar checker (465)
!	%f28 = 417dae73, %f28 = 417dae73, %f8  = 0eff5fc7
	fdivs	%f28,%f28,%f8 		! %f8  = 3f800000
!	%l1 = 000000007098fc4a, %l5 = fffffffffffcc161, %l7 = fffffffffffff556
	addcc	%l1,%l5,%l7		! %l7 = 000000007095bdab, %ccr = 11
!	Mem[0000000031000064] = ffffffac, %l3 = 78e58235b3afa77b
	ldsw	[%o2+0x064],%l3		! %l3 = ffffffffffffffac
!	%f6  = 3ff00000 00000000, %f2  = ffffffff
	fdtos	%f6 ,%f2 		! %f2  = 3f800000
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 11

p2_label_108:
!	Mem[0000000018800000] = ffb43d9a9c8a35db, %l0 = 000000004dde9e56
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = ffb43d9a9c8a35db
p2_b123:
	membar	#Sync			! Added by membar checker (466)
	fbue,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l1 = 000000007098fc4a, Mem[0000000019800000] = 00000000
	stwa	%l1,[%i3+%g0]0x80	! Mem[0000000019800000] = 7098fc4a
p2_b124:
	membar	#Sync			! Added by membar checker (467)
!	%l5 = fffffffffffcc161, %l7 = 000000007095bdab, %l6 = 000000002e8d7a45
	sllx	%l5,%l7,%l6		! %l6 = e60b080000000000
!	Mem[0000000019000194] = 413fdb22, %l7 = 000000007095bdab
	ldub	[%i2+0x196],%l7		! %l7 = 00000000000000db

p2_label_109:
	fbge,a,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[00000000188001a0] = 5602b2b6 c6b163e6 12f91c8d cc5b5f93
	prefetch [%i1+0x1a0],1	! Annulled
p2_b125:
	membar	#Sync			! Added by membar checker (468)
!	Branch On Register, %l0 = ffb43d9a9c8a35db
	brgz,pt	%l0,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],0
p2_b126:
	membar	#Sync			! Added by membar checker (469)
	fbl,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_110:
!	Mem[0000000018000000] = 40a584ca, %l3 = ffffffffffffffac
	lduba	[%i0+%g0]0x80,%l3	! Annulled
p2_b127:
	membar	#Sync			! Added by membar checker (470)
!	Mem[0000000032000000] = 00000000 ffffffff af60c67b 2d367bd5
	prefetch [%o4+0x000],2
!	%l3 = ffffffffffffffac, %l4 = 0000000000000000, %l5 = fffffffffffcc161
	or	%l3,%l4,%l5		! %l5 = ffffffffffffffac
	bge,a	p2_b128			! Branch Taken, %ccr = 11, CWP = 0
!	Mem[0000000032000014] = 21acca43, %l0 = ffb43d9a9c8a35db
	ldsb	[%o4+0x015],%g2		! %g2 = 0000000000000021
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x080,%g2
p2_b128:

p2_label_111:
	membar	#Sync			! Added by membar checker (471)
	set	p2_b129,%o7
	fbul,pn	%fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000031800064] = 00000000, %l1 = 000000007098fc4a
	ldsw	[%o3+0x064],%l1		! %l1 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x081,%g2
p2_b129:
!	Registers modified during the branch to p2_near_3
!	%l1  = ffffffffffffffac
!	%l2  = 000000004dac0af0
!	%l3  = 00000000438045bf
!	%l4  = 0000000000101418
	membar	#Sync			! Added by membar checker (472)
!	%l1 = ffffffffffffffac, Mem[0000000040000038] = 02192505
	sth	%l1,[%o5+0x038]		! Mem[0000000040000038] = ffac2505
	fbule,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019000008] = 88000000, %l2 = 000000004dac0af0
	ldsba	[%i2+%o6]0x80,%l2	! Annulled
p2_b130:

p2_label_112:
	membar	#Sync			! Added by membar checker (473)
!	Mem[0000000018000008] = 00000000, %l3 = 00000000438045bf
	ldswa	[%i0+%o6]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000019800080] = d0e36021 bc93e4f5 3c46e8d5 ea4b8880
	prefetcha [%i3+0x080]%asi,3
!	%f18 = dadf9ab3, %f4  = 418dae73 eb17271f
	fitod	%f18,%f4 		! %f4  = c1c29032 a6800000
!	%l1 = ffffffffffffffac, Mem[0000000030800064] = 7098fc4a
	stw	%l1,[%o1+0x064]		! Mem[0000000030800064] = ffffffac
!	%f30 = dacf9ab3 cb78da30, %f30 = dacf9ab3 cb78da30, %f10 = 417dae73 d87bdd5d
	fsubd	%f30,%f30,%f10		! %f10 = 00000000 00000000

p2_label_113:
!	%f22 = bff00000, %f24 = dae7b406
	fnegs	%f22,%f24		! %f24 = 3ff00000
!	Mem[00000000180001bc] = eaa9dbfe, %l0 = ffb43d9a9c8a35db
	ldsb	[%i0+0x1bd],%l0		! %l0 = ffffffffffffffa9
!	Mem[0000000019800008] = b2b01003, %l4 = 0000000000101418
	lduha	[%i3+%o6]0x80,%l4	! %l4 = 000000000000b2b0
!	%l6 = e60b080000000000, Mem[0000000032000004] = ffffffff
	stha	%l6,[%o4+0x004]%asi	! Mem[0000000032000004] = 0000ffff
!	%l6 = e60b080000000000, %l3 = 0000000000000000, %l4 = 000000000000b2b0
	orn	%l6,%l3,%l4		! %l4 = ffffffffffffffff

p2_label_114:
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019000020] = 1036c189 8b5ea2a4 f3e962e6 58e92af2
	prefetch [%i2+0x020],16
p2_b131:
	membar	#Sync			! Added by membar checker (474)
!	%f2  = 3f800000, %f7  = 00000000, %f1  = 3f7819eb
	fsubs	%f2 ,%f7 ,%f1 		! %f1  = 3f800000
!	Mem[00000000180000e0] = eb5f1456 2cae1869 d14b4840 b075773b
	prefetcha [%i0+0x0e0]%asi,4
	ble,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00

p2_label_115:
!	%l2 = 000000004dac0af0, Mem[0000000030800060] = 4ddea900ffffffac
	stx	%l2,[%o1+0x060]		! Annulled
p2_b132:
	membar	#Sync			! Added by membar checker (475)
!	Mem[000000003100002c] = 8ef0c9b4, %l7 = 00000000000000db
	swapa	[%o2+0x02c]%asi,%l7	! %l7 = 000000008ef0c9b4
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i0+%g0]0x80,%l0
p2_b133:
	membar	#Sync			! Added by membar checker (476)
!	Mem[0000000031000060] = 7d4fabbf, %l5 = ffffffffffffffac
	lduha	[%o2+0x062]%asi,%l5	! %l5 = 000000000000abbf

p2_label_116:
!	Mem[0000000030800028] = fffed9cf 7d4fabbf, %l4 = ffffffff, %l5 = 0000abbf
	ldda	[%o1+0x028]%asi,%l4	! %l4 = 00000000fffed9cf 000000007d4fabbf
!	%l0 = ffffffffffffffa9, Mem[0000000018000008] = 00000000
	stba	%l0,[%i0+%o6]0x80	! Mem[0000000018000008] = a9000000
!	Branch On Register, %l6 = e60b080000000000
	brlz,pn	%l6,p2_b134		! Branch Taken
!	%l1 = ffffffffffffffac, Mem[0000000030000028] = 3ce119e716ad0125
	stx	%l1,[%o0+0x028]		! Mem[0000000030000028] = ffffffffffffffac
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x086,%g2
p2_b134:
	membar	#Sync			! Added by membar checker (477)
!	Mem[0000000031000060] = 7d4fabbf ffffffac, %l0 = ffffffa9, %l1 = ffffffac
	ldd	[%o2+0x060],%l0		! %l0 = 000000007d4fabbf 00000000ffffffac

p2_label_117:
!	Mem[0000000019000008] = 88000000, %l4 = 00000000fffed9cf
	lduwa	[%i2+%o6]0x80,%l4	! %l4 = 0000000088000000
	bpos,a	p2_b135			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000031800020] = f83319fb 00000000, %l0 = 7d4fabbf, %l1 = ffffffac
	ldd	[%o3+0x020],%l0		! %l0 = 00000000f83319fb 0000000000000000
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x087,%g2
p2_b135:
	membar	#Sync			! Added by membar checker (478)
	nop
	bge,a	p2_b136			! Branch Taken, %ccr = 00, CWP = 0

p2_label_118:
!	Mem[0000000032000048] = 8e1c8c7e 1df58c8b, %l2 = 4dac0af0, %l3 = 00000000
	ldd	[%o4+0x048],%g2		! %l2 = 000000004dac0af0 0000000000000000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x088,%g2
p2_b136:
	membar	#Sync			! Added by membar checker (479)
!	%f20 = c16f1b46 00000000, %f2  = 3f800000 ff0725d0
	fdtox	%f20,%f2 		! %f2  = ffffffff ff0725d0
!	%l1 = 0000000000000000, immed = fffffb4f, %l4 = 0000000088000000
	andcc	%l1,-0x4b1,%l4		! %l4 = 0000000000000000, %ccr = 44
!	%l4 = 0000000000000000, Mem[0000000030000028] = ffffffffffffffac
	stxa	%l4,[%o0+0x028]%asi	! Mem[0000000030000028] = 0000000000000000
!	Mem[0000000018000000] = 40a584ca280fa0e9, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 40a584ca280fa0e9

p2_label_119:
	set	p2_b137,%o7
	fbg,a,pn %fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 2
!	%l3 = 40a584ca280fa0e9, Mem[0000000018800008] = cf000000
	stha	%l3,[%i1+%o6]0x80	! Mem[0000000018800008] = a0e90000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x089,%g2
p2_b137:
!	Registers modified during the branch to p2_near_0
!	%l1  = 1407d07480000000
	membar	#Sync			! Added by membar checker (480)
!	%f18 = dadf9ab3 cb78da30, %f2  = ffffffff ff0725d0, %f18 = dadf9ab3 cb78da30
	fdivd	%f18,%f2 ,%f18		! %f18 = ffffffff ff0725d0
!	Mem[0000000019000000] = ff8898fa, %l3 = 40a584ca280fa0e9
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffff88
!	Mem[0000000019800080] = d0e36021 bc93e4f5 3c46e8d5 ea4b8880
	prefetcha [%i3+0x080]%asi,16

p2_label_120:
	bg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	 Annulled
	ldda	[%i2+%g0]0x80,%l4
p2_b138:
	membar	#Sync			! Added by membar checker (481)
!	Mem[0000000019800000] = 7098fc4a 00000000 b2b01003 0d10adac
	prefetch [%i3+0x000],0
	fbe,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l7 = 000000008ef0c9b4, Mem[0000000019800000] = 7098fc4a
	stba	%l7,[%i3+%g0]0x80	! Mem[0000000019800000] = b498fc4a
p2_b139:

p2_label_121:
	membar	#Sync			! Added by membar checker (482)
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetcha [%o4+0x040]%asi,23
!	Mem[0000000019000190] = 2a301625, %l2 = 4dac0af0, %l0 = f83319fb
	add	%i2,0x190,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 000000002a301625
!	%f3  = ff0725d0, %f7  = 00000000
	fmovs	%f3 ,%f7 		! %f7  = ff0725d0
!	%l0 = 000000002a301625, %l1 = 1407d07480000000, %l1 = 1407d07480000000
	andn	%l0,%l1,%l1		! %l1 = 000000002a301625
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_122:
!	Mem[00000000198000a8] = ef7dd038, %l1 = 000000002a301625
	ldsh	[%i3+0x0aa],%l1		! Annulled
p2_b140:
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000030800068] = ae1db2bbe44feeef, %l4 = 0000000000000000
	ldx	[%o1+0x068],%l4		! Annulled
p2_b141:
	bg	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000198001a1] = 4dac0af0, %l7 = 000000008ef0c9b4
	ldstub	[%i3+0x1a1],%l7		! %l7 = 00000000000000ac
p2_b142:

p2_label_123:
	set	p2_b143,%o7
	fblg,a	p2_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000018800008] = a0e90000, %l0 = 000000002a301625
	lduba	[%i1+%o6]0x80,%l0	! %l0 = 00000000000000a0
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x08f,%g2
p2_b143:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000f9fe5914
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l6  = 00000000000e9f1d
	membar	#Sync			! Added by membar checker (483)
!	Mem[0000000018800060] = 149b0dbe e51425a3 0bb1ef7a 7d410468
	prefetch [%i1+0x060],20
!	Mem[00000000188001c0] = 636d21a9 41f0a181 4837981c b0066eb8
	prefetch [%i1+0x1c0],16
!	Mem[0000000019000198] = 977d1770, %l6 = 00000000000e9f1d
	ldsha	[%i2+0x19a]%asi,%l6	! %l6 = 0000000000001770

p2_label_124:
!	%l0 = 00000000f9fe5914, immed = 000004bf, %l5 = 000000007d4fabbf
	taddcc	%l0,0x4bf,%l5		! %l5 = 00000000f9fe5dd3, %ccr = 0a
	ba,a	p2_b144			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000030000060] = 24c53171ecff8891, %l0 = 00000000f9fe5914
	ldx	[%o0+0x060],%l0		! Annulled
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x090,%g2
p2_b144:
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l7 = 00000000000000ac, Mem[0000000018000150] = 3072693d6d400bff
	stx	%l7,[%i0+0x150]		! Annulled
p2_b145:

p2_label_125:
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000030800024] = 00813684, %l2 = 000000004dac0af0
	ldsw	[%o1+0x024],%l2		! %l2 = 0000000000813684
p2_b146:
	membar	#Sync			! Added by membar checker (484)
!	Mem[0000000018000018] = 1b475bf0 35127347, %l4 = 00000000, %l5 = f9fe5dd3
	ldd	[%i0+0x018],%l4		! %l4 = 000000001b475bf0 0000000035127347
!	%l4 = 1b475bf0, %l5 = 35127347, Mem[0000000031000028] = 3bb42b1d 000000db
	std	%l4,[%o2+0x028]	! Mem[0000000031000028] = 1b475bf0 35127347
	fbe,pt	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1

p2_label_126:
!	Mem[0000000019000008] = 88000000, %l7 = 00000000000000ac
	ldswa	[%i2+%o6]0x80,%l7	! %l7 = ffffffff88000000
p2_b147:
	membar	#Sync			! Added by membar checker (485)
!	%l6 = 0000000000001770, Mem[0000000031000060] = 7d4fabbf
	stw	%l6,[%o2+0x060]		! Mem[0000000031000060] = 00001770
!	Mem[0000000030000060] = 24c53171ecff8891, %l4 = 000000001b475bf0
	ldx	[%o0+0x060],%l4		! %l4 = 24c53171ecff8891
!	%f24 = 3ff00000, %f8  = 3f800000 77403cb8
	fstod	%f24,%f8 		! %f8  = 3ffe0000 00000000
!	Mem[0000000018000000] = 40a584ca, %l7 = ffffffff88000000
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = 0000000040a584ca

p2_label_127:
!	Mem[000000001a800140] = b007dbbb a4e99375 e4832016 c65d3acd
	prefetch [%i5+0x140],1
!	Mem[0000000031800024] = 00000000, %l7 = 0000000040a584ca
	ldsw	[%o3+0x024],%l7		! %l7 = 0000000000000000
!	%l5 = 0000000035127347, Mem[000000001a000006] = 59423edf
	stha	%l5,[%i4+0x006]%asi	! Mem[000000001a000004] = 59427347
!	Mem[0000000018800178] = fb0ac406 394e27b9, %l0 = f9fe5914, %l1 = 00000000
	ldd	[%i1+0x178],%l0		! %l0 = 00000000fb0ac406 00000000394e27b9
	set	p2_b148,%o7
	fblg,a	p2_far_3_le	! Branch Taken, %fcc0 = 2

p2_label_128:
!	%l5 = 0000000035127347, Mem[0000000019000000] = ff8898fa996bd987
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000019000000] = 0000000035127347
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x094,%g2
p2_b148:
!	Registers modified during the branch to p2_far_3
!	%l0  = 000000004ddea900
!	%l1  = 00000000ffffffac
!	%l3  = 0000000000000000
!	%l5  = 0000000000086efd
!	%l7  = 000000010000171c
	membar	#Sync			! Added by membar checker (486)
!	Mem[0000000018000008] = a9000000, %l1 = 00000000ffffffac
	lduba	[%i0+%o6]0x80,%l1	! %l1 = 00000000000000a9
!	%l2 = 0000000000813684, Mem[0000000019000000] = 00000000
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000019000000] = 00813684
	ble,a	p2_not_taken_0		! Branch Not Taken, %ccr = 01
!	Mem[0000000019000008] = 88000000, %l0 = 000000004ddea900
	swapa	[%i2+%o6]0x80,%l0	! Annulled
p2_b149:

p2_label_129:
	be	p2_not_taken_0		! Branch Not Taken, %ccr = 01
!	Mem[00000000190000a4] = cb8564c7, %l2 = 0000000000813684
	ldub	[%i2+0x0a6],%l2		! %l2 = 0000000000000064
p2_b150:
	membar	#Sync			! Added by membar checker (487)
!	Mem[0000000019000140] = 566c71fd 8b9b3c64 34857b8e 702d922c
	prefetch [%i2+0x140],0
!	Mem[0000000019000188] = faeacf2e, %l5 = 0000000000086efd
	lduha	[%i2+0x18a]%asi,%l5	! %l5 = 000000000000cf2e
!	Branch On Register, %l7 = 000000010000171c
	brgz,pn	%l7,p2_b151		! Branch Taken

p2_label_130:
!	Mem[00000000190001a8] = 3520299e, %l5 = 000000000000cf2e
	swap	[%i2+0x1a8],%l5		! %l5 = 000000003520299e
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x097,%g2
p2_b151:
	membar	#Sync			! Added by membar checker (488)
!	Mem[0000000018000000] = 40a584ca 280fa0e9
	flush	%i0+0x000
!	%f26 = bf2f8b64, %f14 = c1d0301d
	fcmpes	%fcc2,%f26,%f14		! %fcc2 = 2
!	Branch On Register, %l2 = 0000000000000064
	brlez,pn %l2,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000031000060] = 00001770ffffffac, %l7 = 000000010000171c
	ldx	[%o2+0x060],%l7		! %l7 = 00001770ffffffac
p2_b152:

p2_label_131:
	membar	#Sync			! Added by membar checker (489)
!	%f14 = c1d0301d 27000000, %f28 = 417dae73 80000000, %f28 = 417dae73 80000000
	fsubd	%f14,%f28,%f28		! %f28 = c1d0a6d6 f5000000
	ba,a	p2_b153			! Branch Taken, %ccr = 01, CWP = 0
!	%l6 = 0000000000001770, Mem[0000000031000061] = 00001770
	stb	%l6,[%o2+0x061]		! Annulled
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x099,%g2
p2_b153:
	membar	#Sync			! Added by membar checker (490)
!	Mem[00000000198001f8] = a3c4b1e2, %l0 = 000000004ddea900
	ldsw	[%i3+0x1f8],%l0		! %l0 = ffffffffa3c4b1e2
!	Mem[00000000190000a0] = 317ec128 cb8564c7 62771c93 00000000
	prefetcha [%i2+0x0a0]%asi,4

p2_label_132:
!	%l1 = 00000000000000a9, immed = fffff5cf, %y  = 00000000
	umul	%l1,-0xa31,%l4		! %l4 = 000000a8fff945a7
!	%l5 = 000000003520299e, %l3 = 0000000000000000, %l7 = 00001770ffffffac
	add	%l5,%l3,%l7		! %l7 = 000000003520299e
!	Mem[0000000030000068] = 778a6660, %l3 = 0000000000000000
	ldstub	[%o0+0x068],%l3		! %l3 = 0000000000000077
	fbe	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000031000060] = 00001770, %l0 = ffffffffa3c4b1e2
	ldsb	[%o2+0x060],%l0		! %l0 = 0000000000000000
p2_b154:

p2_label_133:
	membar	#Sync			! Added by membar checker (491)
	set	p2_b155,%o7
	fbo,a,pt %fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 2
!	%l3 = 0000000000000077, Mem[0000000030800028] = fffed9cf
	stw	%l3,[%o1+0x028]		! Mem[0000000030800028] = 00000077
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x09b,%g2
p2_b155:
!	Registers modified during the branch to p2_near_3
!	%l1  = 0000000000000077
!	%l2  = 000000004dff0af0
!	%l3  = 00000000438045bf
!	%l4  = 000000000a8d307c
	membar	#Sync			! Added by membar checker (492)
!	%l4 = 000000000a8d307c, Mem[000000001900017a] = bf0081d5
	stb	%l4,[%i2+0x17a]		! Mem[0000000019000178] = bf007cd5
!	call to call_1, CWP = 0
	call	p2_call_1_he
!	Mem[0000000030000024] = ffffc2de, %l0 = 0000000000000000
	ldsb	[%o0+0x025],%l0		! %l0 = ffffffffffffffff
!	Registers modified during the branch to p2_call_1
!	%l0  = ffffffffc4924925
!	%l1  = 0000000000000000
!	%l2  = 0000000000000000
!	%l4  = 000000001f59c917
!	%l7  = ffffffffffffffff

p2_label_134:
	bneg	p2_b156			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000019000000] = 00813684, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x09c,%g2
p2_b156:
	membar	#Sync			! Added by membar checker (493)
!	%f20 = c16f1b46 00000000, %f7  = ff0725d0
	fdtoi	%f20,%f7 		! %f7  = ff0725d0
!	%l7 = ffffffffffffffff, Mem[0000000031000020] = f9fe5914467ee2ff
	stxa	%l7,[%o2+0x020]%asi	! Mem[0000000031000020] = ffffffffffffffff
!	Mem[0000000030800024] = 00813684, %l5 = 000000003520299e
	swap	[%o1+0x024],%l5		! %l5 = 0000000000813684

p2_label_135:
!	%l0 = ffffffffc4924925, %l3 = 00000000438045bf, %y  = 000000a8
	mulx	%l0,%l3,%l2		! %l2 = f0548218585b8b9b
!	Mem[00000000188000c0] = e7100231 9dc2c90f 4667df67 4fde7c50
	prefetcha [%i1+0x0c0]%asi,3
!	%l7 = ffffffffffffffff, immed = fffffbf8, %l2 = f0548218585b8b9b
	taddcc	%l7,-0x408,%l2		! %l2 = fffffffffffffbf7, %ccr = 9b
!	%f19 = ff0725d0, %f10 = 00000000, %f12 = ff0725d0
	fadds	%f19,%f10,%f12		! %f12 = ff0725d0
!	%l6 = 0000000000001770, immed = fffff412, %l2 = fffffffffffffbf7
	addcc	%l6,-0xbee,%l2		! %l2 = 0000000000000b82, %ccr = 11

p2_label_136:
!	%l2 = 00000b82, %l3 = 438045bf, Mem[0000000031800028] = 00000000 0000ffb4
	stda	%l2,[%o3+0x028]%asi	! Mem[0000000031800028] = 00000b82 438045bf
	bcc,a	p2_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000019800198] = e22eb756, %l4 = 000000001f59c917
	ldsb	[%i3+0x19a],%l4		! Annulled
p2_b157:
	membar	#Sync			! Added by membar checker (494)
!	%l5 = 0000000000813684, Mem[0000000018800000] = ffb43d9a
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000018800000] = 36843d9a
	bn,a	p2_not_taken_0		! Branch Not Taken, %ccr = 11

p2_label_137:
!	Mem[0000000018000008] = a9000000f8a9115d, %l5 = 0000000000813684
	ldxa	[%i0+%o6]0x80,%l5	! Annulled
p2_b158:
	membar	#Sync			! Added by membar checker (495)
!	%l2 = 0000000000000b82, Mem[000000003100006c] = 001c781a
	stw	%l2,[%o2+0x06c]		! Mem[000000003100006c] = 00000b82
!	%l2 = 0000000000000b82, immed = 000005cb, %l5 = 0000000000813684
	orn	%l2,0x5cb,%l5		! %l5 = fffffffffffffbb6
!	%l7 = ffffffffffffffff, immed = fffff0cf, %l5 = fffffffffffffbb6
	orncc	%l7,-0xf31,%l5		! %l5 = ffffffffffffffff, %ccr = 88
	bvc	p2_b159			! Branch Taken, %ccr = 88, CWP = 0

p2_label_138:
!	%l6 = 0000000000001770, Mem[0000000030800020] = 731daa693520299e
	stx	%l6,[%o1+0x020]		! Mem[0000000030800020] = 0000000000001770
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x09f,%g2
p2_b159:
	set	p2_b160,%o7
	fblg,a	p2_far_3_he	! Branch Taken, %fcc0 = 2
!	Mem[00000000188001c0] = 636d21a9 41f0a181 4837981c b0066eb8
	prefetch [%i1+0x1c0],2
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0a0,%g2
p2_b160:
!	Registers modified during the branch to p2_far_3
!	%l1  = ffffc49249250000
	membar	#Sync			! Added by membar checker (496)
!	%l3 = 00000000438045bf, %l7 = ffffffffffffffff, %y  = 000000a8
	udivx	%l3,%l7,%l2		! %l2 = 0000000000000000
!	%l6 = 0000000000001770, %l2 = 0000000000000000, %l6 = 0000000000001770
	addccc	%l6,%l2,%l6		! %l6 = 0000000000001770, %ccr = 00

p2_label_139:
	set	p2_b161,%o7
	fblg	p2_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000018000008] = a9000000, %l5 = ffffffffffffffff
	ldstuba	[%i0+%o6]0x80,%l5	! %l5 = 00000000000000a9
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0a1,%g2
p2_b161:
!	Registers modified during the branch to p2_far_3
!	%l0  = 000000004ddea900
!	%l1  = 00000000ffffffac
!	%l3  = 000000000fa5a2db
!	%l5  = 0000000000000000
!	%l7  = 000000010000171c
	membar	#Sync			! Added by membar checker (497)
	fbe,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l7 = 000000010000171c, Mem[0000000040000038] = ffac2505
	stw	%l7,[%o5+0x038]		! Annulled
p2_b162:
	membar	#Sync			! Added by membar checker (498)
!	Mem[0000000030000064] = ecff8891, %l3 = 0fa5a2db, %l1 = ffffffac
	add	%o0,0x64,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000ecff8891

p2_label_140:
!	%f8  = 3ffe0000 00000000, %f11 = 00000000
	fdtos	%f8 ,%f11		! %f11 = 3ff00000
!	%f12 = ff0725d0, %f4  = c1c29032 a6800000
	fstod	%f12,%f4 		! %f4  = c7e0e4ba 00000000
!	%l7 = 000000010000171c, %l1 = 00000000ecff8891, %l5 = 0000000000000000
	subccc	%l7,%l1,%l5		! %l5 = 0000000013008e8a, %ccr = 01
!	%f4  = c7e0e4ba 00000000, %f16 = 4916fe95 3e911d0e
	fmovd	%f4 ,%f16		! %f16 = c7e0e4ba 00000000
!	%l6 = 0000000000001770, immed = fffff1f0, %y  = 000000a8
	smul	%l6,-0xe10,%l3		! %l3 = fffffffffeb66900

p2_label_141:
	fbul,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000019000008] = 88000000, %l3 = fffffffffeb66900
	swapa	[%i2+%o6]0x80,%l3	! %l3 = 0000000088000000
p2_b163:
	membar	#Sync			! Added by membar checker (499)
!	Mem[00000000188001e8] = b12e394a, %l1 = 00000000ecff8891
	ldstuba	[%i1+0x1e8]%asi,%l1	! %l1 = 00000000000000b1
!	%f24 = 3ff00000 00000001, %f18 = ffffffff ff0725d0, %f20 = c16f1b46 00000000
	fdivd	%f24,%f18,%f20		! %f20 = ffffffff ff0725d0
!	Mem[000000001a800090] = d0405bd0, %l1 = 00000000000000b1
	ldsb	[%i5+0x092],%l1		! %l1 = 000000000000005b

p2_label_142:
!	%l0 = 000000004ddea900, immed = 00000383, %y  = ffffffff
	smul	%l0,0x383,%l5		! %l5 = 0000011174eb7b00
!	%l6 = 0000000000001770, %l3 = 0000000088000000, %l2 = 0000000000000000
	orncc	%l6,%l3,%l2		! %l2 = ffffffff77ffffff, %ccr = 80
!	%l6 = 0000000000001770, immed = fffffaa8, %y  = 00000111
	udivcc	%l6,-0x558,%l7		! %l7 = 0000000000000111, %ccr = 00
	fble,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000019000000] = ff813684, %l4 = 000000001f59c917
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff813684
p2_b164:

p2_label_143:
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001b000000] = 004ae354, %l1 = 000000000000005b
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 000000000000004a
p2_b165:
	membar	#Sync			! Added by membar checker (500)
!	Mem[0000000031000068] = 000040a5 00000b82, %l0 = 4ddea900, %l1 = 0000004a
	ldda	[%o2+0x068]%asi,%l0	! %l0 = 00000000000040a5 0000000000000b82
!	Mem[0000000019800100] = 3e00b6bd d176d4d6 676218c7 a5a393ea
	prefetch [%i3+0x100],16
!	Mem[0000000019000040] = 00000000 00000000 90e91103 3243f6ab
	prefetcha [%i2+0x040]%asi,21

p2_label_144:
!	Mem[0000000019800008] = b2b01003, %l0 = 00000000000040a5
	lduwa	[%i3+%o6]0x80,%l0	! %l0 = 00000000b2b01003
!	%f16 = c7e0e4ba 00000000, %f4  = c7e0e4ba 00000000, %f14 = c1d0301d 27000000
	fsubd	%f16,%f4 ,%f14		! %f14 = 00000000 00000000
	set	p2_b166,%o7
	fblg,a,pn %fcc1,p2_near_2_le	! Branch Taken, %fcc1 = 2
!	Mem[00000000190000cc] = 4ca97ce8, %l1 = 0000000000000b82
	ldub	[%i2+0x0ce],%l1		! %l1 = 000000000000007c
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x0a6,%g2
p2_b166:
	membar	#Sync			! Added by membar checker (501)
!	%f10 = 00000000, %f8  = 3ffe0000
	fcmps	%fcc1,%f10,%f8 		! %fcc1 = 1

p2_label_145:
!	Branch On Register, %l2 = ffffffff77ffffff
	brgz,pt	%l2,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019800100] = 3e00b6bd, %l6 = 0000000000001770
	swap	[%i3+0x100],%l6		! %l6 = 000000003e00b6bd
p2_b167:
	membar	#Sync			! Added by membar checker (502)
!	%l4 = 00000000ff813684, immed = fffff067, %l1 = 000000000000007c
	and	%l4,-0xf99,%l1		! %l1 = 00000000ff813004
!	Mem[0000000031000024] = ffffffff, %l7 = 0000000000000111
	ldsw	[%o2+0x024],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030800028] = 00000077, %l0 = 00000000b2b01003
	ldsb	[%o1+0x02a],%l0		! %l0 = 0000000000000000

p2_label_146:
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,20
!	%l1 = 00000000ff813004, %l5 = 0000011174eb7b00, %l4 = 00000000ff813684
	orncc	%l1,%l5,%l4		! %l4 = fffffeeeff95b4ff, %ccr = 88
!	Mem[000000001b000180] = 9aeb448c 56350a61, %l0 = 00000000, %l1 = ff813004
	ldda	[%i6+0x180]%asi,%l0	! %l0 = 000000009aeb448c 0000000056350a61
	set	p2_b168,%o7
	fbo,a,pt %fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 1
!	%l0 = 000000009aeb448c, Mem[0000000018000008] = ff000000
	stha	%l0,[%i0+%o6]0x80	! Mem[0000000018000008] = 448c0000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0a8,%g2
p2_b168:

p2_label_147:
	membar	#Sync			! Added by membar checker (503)
!	Mem[00000000190000a0] = 317ec128 cb8564c7 62771c93 00000000
	prefetcha [%i2+0x0a0]%asi,0
!	Mem[0000000030000068] = ff8a6660 0012ce3e, %l6 = 3e00b6bd, %l7 = ffffffff
	ldda	[%o0+0x068]%asi,%l6	! %l6 = 00000000ff8a6660 000000000012ce3e
	set	p2_b169,%o7
	fbug,a	p2_far_1_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000031800020] = f83319fb, %l0 = 000000009aeb448c
	swap	[%o3+0x020],%l0		! %l0 = 00000000f83319fb
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x0a9,%g2
p2_b169:
!	Registers modified during the branch to p2_far_1
!	%l0  = 000000000000004a
!	%l2  = 00000000ffffffff
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (504)
!	Mem[0000000030800068] = ae1db2bb e44feeef, %l0 = 0000004a, %l1 = 56350a61
	ldda	[%o1+0x068]%asi,%l0	! %l0 = 00000000ae1db2bb 00000000e44feeef

p2_label_148:
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019800000] = b498fc4a, %l0 = 00000000ae1db2bb
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = ffffffffb498fc4a
p2_b170:
	membar	#Sync			! Added by membar checker (505)
!	Mem[0000000031000060] = ae1db2bb e44feeef, %l2 = 00000000ffffffff, %l2 = 00000000ffffffff
	add	%o2,0x60,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 00001770ffffffac
!	%l3 = 0000000088000000, %l1 = 00000000e44feeef, %l2 = 00001770ffffffac
	tsubcc	%l3,%l1,%l2		! %l2 = ffffffffa3b01111, %ccr = 9b
!	Mem[0000000019800000] = b498fc4a, %l5 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 000000000000b498

p2_label_149:
	bpos,a	p2_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000019000180] = 6635c914 c9b72f67 faeacf2e eac6d4e7
	prefetch [%i2+0x180],1	! Annulled
p2_b171:
	membar	#Sync			! Added by membar checker (506)
!	%l5 = 000000000000b498, %l6 = 00000000ff8a6660, %l2 = ffffffffa3b01111
	sra	%l5,%l6,%l2		! %l2 = 000000000000b498
!	Mem[0000000019000000] = ff813684, %l7 = 000000000012ce3e
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffffff813684
!	%l3 = 0000000088000000, Mem[0000000018000000] = 40a584ca280fa0e9
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000018000000] = 0000000088000000

p2_label_150:
!	%l0 = ffffffffb498fc4a, Mem[0000000031000024] = ffffffff
	stw	%l0,[%o2+0x024]		! Mem[0000000031000024] = b498fc4a
!	%l4 = fffffeeeff95b4ff, immed = fffff3e7, %y  = 00000111
	smul	%l4,-0xc19,%l0		! %l0 = 0000000505e55f19
	fbue,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018800000] = 36843d9a, %l5 = 000000000000b498
	lduba	[%i1+%g0]0x80,%l5	! Annulled
p2_b172:
	membar	#Sync			! Added by membar checker (507)
!	%l3 = 0000000088000000, immed = 000005e8, %y  = 00000005
	sdiv	%l3,0x5e8,%l2		! %l2 = 0000000000efbefb

p2_label_151:
!	%l6 = 00000000ff8a6660
	sethi	%hi(0xd8de1000),%l6	! %l6 = 00000000d8de1000
	set	p2_b173,%o7
	fbuge,a,pn %fcc2,p2_near_2_le	! Branch Taken, %fcc2 = 2
!	Mem[0000000018000008] = 448c0000, %l4 = fffffeeeff95b4ff
	lduba	[%i0+%o6]0x80,%l4	! %l4 = 0000000000000044
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p2_branch_failed
	mov	0x0ad,%g2
p2_b173:
	membar	#Sync			! Added by membar checker (508)
!	%f24 = 3ff00000, %f1  = 3f800000, %f14 = 00000000
	fadds	%f24,%f1 ,%f14		! %f14 = 40380000
!	%l3 = 0000000088000000, %l6 = 00000000d8de1000, %l4 = 0000000000000044
	sll	%l3,%l6,%l4		! %l4 = 0000000088000000

p2_label_152:
!	Mem[0000000018800000] = 36843d9a, %l6 = 00000000d8de1000
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 0000000036843d9a
	ble,a	p2_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000030800069] = ae1db2bb, %l4 = 0000000088000000
	ldstub	[%o1+0x069],%l4		! Annulled
p2_b174:
	membar	#Sync			! Added by membar checker (509)
!	%l4 = 0000000088000000, %l7 = ffffffffff813684, %l4 = 0000000088000000
	xnorcc	%l4,%l7,%l4		! %l4 = 00000000887ec97b, %ccr = 08
!	%l6 = 0000000036843d9a, %l4 = 00000000887ec97b, %l1 = 00000000e44feeef
	add	%l6,%l4,%l1		! %l1 = 00000000bf030715

p2_label_153:
!	%l2 = 0000000000efbefb, immed = fffff970, %y  = 00000005
	smul	%l2,-0x690,%l0		! %l0 = fffffff9daaab0d0
	set	p2_b175,%o7
	fbge,pn	%fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000019800008] = b2b01003, %l6 = 0000000036843d9a
	ldsba	[%i3+%o6]0x80,%l6	! %l6 = ffffffffffffffb2
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0af,%g2
p2_b175:
!	Registers modified during the branch to p2_near_1
!	%l2  = fffffffffa8ae28b
!	%l4  = 0000000088000000
!	%l6  = ffffffffffffffff
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (510)
!	%l2 = fffffffffa8ae28b
	setx	0xa6a36f3aa6a36f3a,%g7,%l2 ! %l2 = a6a36f3aa6a36f3a
!	%l1 = 00000000bf030715, %l2 = a6a36f3aa6a36f3a, %l7 = 0000000000000000
	or	%l1,%l2,%l7		! %l7 = a6a36f3abfa36f3f

p2_label_154:
!	Mem[0000000030000068] = ff8a66600012ce3e, %l7 = a6a36f3abfa36f3f
	ldxa	[%o0+0x068]%asi,%l7	! %l7 = ff8a66600012ce3e
	bvs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	 Annulled
	ldd	[%o0+0x020],%l6
p2_b176:
	membar	#Sync			! Added by membar checker (511)
	set	p2_b177,%o7
	fble,pt	%fcc1,p2_near_1_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000019800090] = cfa4919b ffe91607, %l0 = daaab0d0, %l1 = bf030715
	ldd	[%i3+0x090],%l0		! %l0 = 00000000cfa4919b 00000000ffe91607
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p2_branch_failed
	mov	0x0b1,%g2
p2_b177:
!	Registers modified during the branch to p2_near_1
!	%l1  = fffffffffffff843
!	%l4  = 595c90c5595c9032

p2_label_155:
	membar	#Sync			! Added by membar checker (512)
!	%l4 = 595c90c5595c9032, Mem[0000000030000021] = ffffffff
	stb	%l4,[%o0+0x021]		! Mem[0000000030000020] = ff32ffff
	set	p2_b178,%o7
	fbuge,pt %fcc0,p2_near_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],16
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p2_branch_failed
	mov	0x0b2,%g2
p2_b178:
	be	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000019000000] = ff813684, %l6 = ffffffffffffffff
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffff81
p2_b179:

p2_label_156:
	membar	#Sync			! Added by membar checker (513)
	nop
!	%l1 = fffffffffffff843, %l5 = 000000000000b498, %l4 = 595c90c5595c9032
	xnor	%l1,%l5,%l4		! %l4 = 000000000000b324
!	Mem[00000000190000b0] = 73641e30 b204ff57, %l4 = 0000b324, %l5 = 0000b498
	ldda	[%i2+0x0b0]%asi,%l4	! %l4 = 0000000073641e30 00000000b204ff57
!	%l4 = 0000000073641e30, Mem[0000000019800008] = b2b01003
	stwa	%l4,[%i3+%o6]0x80	! Mem[0000000019800008] = 73641e30
!	%l2 = a6a36f3aa6a36f3a, immed = 0000003b, %l5 = 00000000b204ff57
	sllx	%l2,0x03b,%l5		! %l5 = d000000000000000

p2_label_157:
!	Mem[00000000180000dc] = 6dfaa08e, %l5 = d000000000000000
	lduwa	[%i0+0x0dc]%asi,%l5	! %l5 = 000000006dfaa08e
!	Mem[0000000019800008] = 73641e30, %l1 = fffffffffffff843
	ldstuba	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000073
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,21
!	Mem[0000000031000020] = ffffffff, %l6 = ffffffffffffff81
	swap	[%o2+0x020],%l6		! %l6 = 00000000ffffffff
	ble	p2_b180			! Branch Taken, %ccr = 88, CWP = 0

p2_label_158:
!	Mem[0000000018000000] = 00000000, %l2 = a6a36f3aa6a36f3a
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0b4,%g2
p2_b180:
	membar	#Sync			! Added by membar checker (514)
	set	p2_b181,%o7
	fbule,a,pt %fcc3,p2_near_1_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000018000008] = 448c0000, %l0 = 00000000cfa4919b
	ldswa	[%i0+%o6]0x80,%l0	! %l0 = 00000000448c0000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0b5,%g2
p2_b181:
!	Registers modified during the branch to p2_near_1
!	%l2  = fffffffffffffffd
!	%l4  = 0000000000000000
!	%l6  = 0000000000000000
!	%l7  = 0000000088000000
	membar	#Sync			! Added by membar checker (515)
!	Mem[00000000190001c0] = 6712a02c 32341161 ef776270 8dc6e7c5
	prefetcha [%i2+0x1c0]%asi,1
!	call to call_3, CWP = 0
	call	p2_call_3_le

p2_label_159:
!	Mem[0000000019000008] = feb6690000000000, %l2 = fffffffffffffffd
	ldxa	[%i2+%o6]0x80,%l2	! %l2 = feb6690000000000
!	Registers modified during the branch to p2_call_3
!	%l0  = 0000000000000000
!	%f26 = bf2f8b64 00000000, %f6  = 3ff00000 ff0725d0
	fcmped	%fcc1,%f26,%f6 		! %fcc1 = 1
!	%l7 = 0000000088000000, immed = 00000443, %l5 = 000000006dfaa08e
	xnorcc	%l7,0x443,%l5		! %l5 = ffffffff77fffbbc, %ccr = 80
!	%f31 = cb78da30, %f16 = c7e0e4ba
	fstoi	%f31,%f16		! %f16 = ff0725d0
!	Mem[0000000019000140] = 566c71fd 8b9b3c64 34857b8e 702d922c
	prefetch [%i2+0x140],23

p2_label_160:
!	Mem[0000000031800060] = 0d10adac 00000000, %l4 = 00000000, %l5 = 77fffbbc
	ldda	[%o3+0x060]%asi,%l4	! %l4 = 000000000d10adac 0000000000000000
	set	p2_b182,%o7
	fbo	p2_far_2_he	! Branch Taken, %fcc0 = 2
!	%l0 = 00000000, %l1 = 00000073, Mem[0000000018800008] = a0e90000 d1d233ff
	stda	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = 00000000 00000073
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x0b6,%g2
p2_b182:
!	Registers modified during the branch to p2_far_2
!	%l1  = 0000000000000000
!	%l3  = 00000000028e6cd3
!	%l5  = 0000000088000000
!	%l6  = 0000000088000000
!	%l7  = 000040a500000b82
	membar	#Sync			! Added by membar checker (516)
!	%l6 = 0000000088000000, immed = 00000e73, %l6 = 0000000088000000
	addcc	%l6,0xe73,%l6		! %l6 = 0000000088000e73, %ccr = 08
!	Mem[0000000031000028] = 1b475bf0, %l0 = 0000000000000000
	lduw	[%o2+0x028],%l0		! %l0 = 000000001b475bf0

p2_label_161:
!	%f14 = 40380000 00000000, %f5  = 00000000
	fdtos	%f14,%f5 		! %f5  = 41c00000
	fbul,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019000160] = e9ce56ab f367e88f b87fff9e 06b55d78
	prefetch [%i2+0x160],4
p2_b183:
	membar	#Sync			! Added by membar checker (517)
!	%l2 = feb6690000000000, immed = 0000096e, %y  = fffffff9
	mulx	%l2,0x96e,%l4		! %l4 = dc121e0000000000
!	%l4 = dc121e0000000000, Mem[0000000018800084] = d035d9cd
	stw	%l4,[%i1+0x084]		! Mem[0000000018800084] = 00000000

p2_label_162:
	set	p2_b184,%o7
	fbg	p2_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],1
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0b8,%g2
p2_b184:
!	Registers modified during the branch to p2_far_2
!	%l2  = dc121e0000000000
!	%l7  = 000000001b475fff
	membar	#Sync			! Added by membar checker (518)
	fble,pn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019800000] = b498fc4a, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000b498fc4a
p2_b185:
	membar	#Sync			! Added by membar checker (519)
!	%l3 = 00000000028e6cd3, Mem[0000000019800008] = ff641e30
	stha	%l3,[%i3+%o6]0x80	! Mem[0000000019800008] = 6cd31e30

p2_label_163:
!	Mem[0000000030000060] = 24c53171, %l3 = 00000000028e6cd3
	ldstub	[%o0+0x060],%l3		! %l3 = 0000000000000024
!	%l1 = 00000000b498fc4a, immed = fffff096, %y  = fffffff9
	sdivx	%l1,-0xf6a,%l3		! %l3 = fffffffffff44899
	set	p2_b186,%o7
	fbo,pn	%fcc0,p2_near_3_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000019000008] = feb66900, %l1 = 00000000b498fc4a
	swapa	[%i2+%o6]0x80,%l1	! %l1 = 00000000feb66900
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x0ba,%g2
p2_b186:
!	Registers modified during the branch to p2_near_3
!	%l0  = 0000000110000e73
!	%l1  = 000000001b475fff
!	%l4  = 00000000880000d3
!	%l5  = ffffffffff4964b9
	bg	p2_b187			! Branch Taken, %ccr = 00, CWP = 0

p2_label_164:
!	Mem[0000000019000000] = ff813684, %l3 = fffffffffff44899
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p2_branch_failed
	mov	0x0bb,%g2
p2_b187:
	membar	#Sync			! Added by membar checker (520)
!	Mem[000000003100006c] = 00000b82, %l4 = 00000000880000d3
	lduha	[%o2+0x06e]%asi,%l4	! %l4 = 0000000000000b82
!	Mem[0000000018800100] = 8f0ab4c5 1cc57be9 02b7c38e 5ce6ca81
	prefetch [%i1+0x100],20
!	%l6 = 0000000088000e73, immed = 0000004d, %l3 = ffffffffffffffff
	addcc	%l6,0x04d,%l3		! %l3 = 0000000088000ec0, %ccr = 08
!	Mem[0000000032000000] = 00000000 0000ffff af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,16

p2_label_165:
!	%l2 = dc121e0000000000
	sethi	%hi(0x054c8400),%l2	! %l2 = 00000000054c8400
	set	p2_b188,%o7
	fba	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000019800110] = 2b4f34fe fd2a5db3, %l4 = 00000b82, %l5 = ff4964b9
	ldd	[%i3+0x110],%l4		! %l4 = 000000002b4f34fe 00000000fd2a5db3
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0bc,%g2
p2_b188:
!	Registers modified during the branch to p2_far_0
!	%l0  = 000000002b4f28ac
!	%l1  = 00000000a34f26df
	membar	#Sync			! Added by membar checker (521)
!	%l5 = 00000000fd2a5db3, immed = fffff69c, %y  = fffffff9
	sdivcc	%l5,-0x964,%l3		! %l3 = 0000000000a3de85, %ccr = 00
	set	p2_b189,%o7
	fbg,pn	%fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 2

p2_label_166:
!	Mem[0000000019000008] = b498fc4a, %l1 = 00000000a34f26df
	lduba	[%i2+%o6]0x80,%l1	! %l1 = 00000000000000b4
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0bd,%g2
p2_b189:
!	Registers modified during the branch to p2_near_1
!	%l1  = 0000000088000843
!	%l4  = fffffffffab37b08
	membar	#Sync			! Added by membar checker (522)
!	%l0 = 000000002b4f28ac, %l6 = 0000000088000e73, %y  = fffffff9
	udivcc	%l0,%l6,%l5		! %l5 = 00000000ffffffff, %ccr = 0a
!	%f8  = 3ffe0000 00000000, %f28 = c1d0a6d6 f5000000, %f28 = c1d0a6d6 f5000000
	fsubd	%f8 ,%f28,%f28		! %f28 = 41d0a6d6 f5780000
	bvs,a	p2_b190			! Branch Taken, %ccr = 0a, CWP = 0
!	%l2 = 00000000054c8400, Mem[0000000019000008] = b498fc4a00000000
	stxa	%l2,[%i2+%o6]0x80	! Mem[0000000019000008] = 00000000054c8400
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0be,%g2
p2_b190:

p2_label_167:
	membar	#Sync			! Added by membar checker (523)
!	Mem[0000000019000156] = 3ea152f8, %l7 = 000000001b475fff
	ldstuba	[%i2+0x156]%asi,%l7	! %l7 = 0000000000000052
	set	p2_b191,%o7
	fbo,pt	%fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000019000008] = 00000000054c8400, %l4 = fffffffffab37b08
	ldxa	[%i2+%o6]0x80,%l4	! %l4 = 00000000054c8400
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0bf,%g2
p2_b191:
!	Registers modified during the branch to p2_near_0
!	%l1  = 0051ef4280000000
	bg	p2_b192			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000019800008] = 6cd31e30, %l4 = 00000000054c8400
	swapa	[%i3+%o6]0x80,%l4	! %l4 = 000000006cd31e30
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0c0,%g2
p2_b192:

p2_label_168:
	membar	#Sync			! Added by membar checker (524)
	set	p2_b193,%o7
	fbug,a,pt %fcc0,p2_near_0_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000018800080] = 6b4fb96f 00000000 33450b7c 80e482d2
	prefetch [%i1+0x080],4
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p2_branch_failed
	mov	0x0c1,%g2
p2_b193:
!	Registers modified during the branch to p2_near_0
!	%l1  = 0051ef4280000000
	membar	#Sync			! Added by membar checker (525)
	fbug,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000019000008] = 00000000, %l0 = 000000002b4f28ac
	lduwa	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000
p2_b194:
	membar	#Sync			! Added by membar checker (526)
!	%l5 = 00000000ffffffff, immed = 0000002b, %l5 = 00000000ffffffff
	srax	%l5,0x02b,%l5		! %l5 = 0000000000000000

p2_label_169:
!	%l0 = 0000000000000000, immed = 00000442, %l3 = 0000000000a3de85
	orncc	%l0,0x442,%l3		! %l3 = fffffffffffffbbd, %ccr = 88
!	%l2 = 00000000054c8400
	setx	0x5aaec3f85aaec3f8,%g7,%l2 ! %l2 = 5aaec3f85aaec3f8
!	%l5 = 0000000000000000
	setx	0x475d17d3475d17d3,%g7,%l5 ! %l5 = 475d17d3475d17d3
!	Mem[0000000018800110] = 9741cf90, %l4 = 000000006cd31e30
	swapa	[%i1+0x110]%asi,%l4	! %l4 = 000000009741cf90
	fble	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_170:
!	%l2 = 5aaec3f8, %l3 = fffffbbd, Mem[00000000198001b0] = ffde8050 b6463874
	std	%l2,[%i3+0x1b0]	! Mem[00000000198001b0] = 5aaec3f8 fffffbbd
p2_b195:
	membar	#Sync			! Added by membar checker (527)
!	%l1 = 0051ef4280000000, %l2 = 5aaec3f85aaec3f8, %l0 = 0000000000000000
	orncc	%l1,%l2,%l0		! %l0 = a551ff47a5513c07, %ccr = 88
!	Mem[0000000019800120] = 778d16bb, %l4 = 000000009741cf90
	lduwa	[%i3+0x120]%asi,%l4	! %l4 = 00000000778d16bb
!	%f18 = ffffffff, %f5  = 41c00000
	fitos	%f18,%f5 		! %f5  = bf800000
!	%f6  = 3ff00000 ff0725d0, %f12 = ff0725d0 01dae732
	fmovd	%f6 ,%f12		! %f12 = 3ff00000 ff0725d0

p2_label_171:
	fbue,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l2 = 5aaec3f85aaec3f8, Mem[0000000032000046] = 5d528e1c
	sth	%l2,[%o4+0x046]		! Mem[0000000032000044] = c3f88e1c
p2_b196:
	membar	#Sync			! Added by membar checker (528)
!	Branch On Register, %l7 = 0000000000000052
	brgz,a,pn %l7,p2_b197		! Branch Taken
!	Mem[000000001b000000] = 004ae354, %l7 = 0000000000000052
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = 00000000004ae354
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0c5,%g2
p2_b197:
	membar	#Sync			! Added by membar checker (529)
!	%l0 = a551ff47a5513c07, %l5 = 475d17d3475d17d3, %y  = fffffff9
	sdivcc	%l0,%l5,%l1		! %l1 = ffffffffffffffea, %ccr = 88

p2_label_172:
!	Mem[0000000018000008] = 448c0000 f8a9115d, %l2 = 5aaec3f8, %l3 = fffffbbd
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 00000000448c0000 00000000f8a9115d
!	Mem[0000000019800048] = bad22a6a 26f21087, %l4 = 778d16bb, %l5 = 475d17d3
	ldda	[%i3+0x048]%asi,%l4	! %l4 = 00000000bad22a6a 0000000026f21087
!	%l7 = 00000000004ae354, Mem[000000003180002a] = 00000b82
	stb	%l7,[%o3+0x02a]		! Mem[0000000031800028] = 00005482
!	Mem[0000000031000064] = ffffffac, %l4 = 00000000bad22a6a
	ldsha	[%o2+0x064]%asi,%l4	! %l4 = ffffffffffffffff
!	%f26 = bf2f8b64 00000000, %f10 = 00000000 3ff00000
	fmovd	%f26,%f10		! %f10 = bf2f8b64 00000000

p2_label_173:
!	Mem[0000000019800000] = 00000000, %l5 = 0000000026f21087
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000031800024] = 00000000, %l4 = ffffffffffffffff
	swapa	[%o3+0x024]%asi,%l4	! %l4 = 0000000000000000
!	%f2  = ffffffff ff0725d0, %f6  = 3ff00000 ff0725d0, %f22 = bff00000 e87bdd5d
	fmuld	%f2 ,%f6 ,%f22		! %f22 = ffffffff ff0725d0
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000018000040] = ff7224ff 244c4a73 68c7b3d6 f8505c98
	prefetch [%i0+0x040],4	! Annulled
p2_b198:

p2_label_174:
	membar	#Sync			! Added by membar checker (530)
!	%l2 = 00000000448c0000, %l4 = 0000000000000000, %l1 = ffffffffffffffea
	addc	%l2,%l4,%l1		! %l1 = 00000000448c0000
!	%f8  = 3ffe0000, %f9  = 00000000, %f24 = 3ff00000
	fsubs	%f8 ,%f9 ,%f24		! %f24 = 3ffe0000
	set	p2_b199,%o7
	fbo,a,pt %fcc3,p2_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000018000000] = ff000000 88000000 448c0000 f8a9115d
	prefetch [%i0+0x000],22
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0c7,%g2
p2_b199:
!	Registers modified during the branch to p2_near_3
!	%l1  = 00000000f8a9115d
!	%l2  = 000000004dff0af0
!	%l3  = 00000000438045bf
!	%l4  = ffffffffff93c172
	membar	#Sync			! Added by membar checker (531)
!	%f28 = 41d0a6d6 f5780000, %f2  = ffffffff ff0725d0
	fmovd	%f28,%f2 		! %f2  = 41d0a6d6 f5780000

p2_label_175:
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[00000000188001e0] = f77c67d2 24550e10 ff2e394a 55aca8f2
	prefetch [%i1+0x1e0],3	! Annulled
p2_b200:
	bn,a	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000018000060] = b640d2d3d9e23a0d, %l4 = ffffffffff93c172
	ldx	[%i0+0x060],%l4		! Annulled
p2_b201:
	membar	#Sync			! Added by membar checker (532)
!	%l4 = ff93c172, %l5 = 00000000, Mem[0000000018000018] = 1b475bf0 35127347
	stda	%l4,[%i0+0x018]%asi	! Mem[0000000018000018] = ff93c172 00000000

p2_label_176:
!	Branch On Register, %l7 = 00000000004ae354
	brnz,pt	%l7,p2_b202		! Branch Taken
!	%l7 = 00000000004ae354, Mem[0000000019800008] = 054c8400
	stba	%l7,[%i3+%o6]0x80	! Mem[0000000019800008] = 544c8400
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0ca,%g2
p2_b202:
	set	p2_b203,%o7
	fblg	p2_far_0_le	! Branch Taken, %fcc0 = 2
!	%l2 = 4dff0af0, %l3 = 438045bf, Mem[0000000018800008] = 00000000 00000073
	stda	%l2,[%i1+%o6]0x80	! Mem[0000000018800008] = 4dff0af0 438045bf
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p2_branch_failed
	mov	0x0cb,%g2
p2_b203:
!	Registers modified during the branch to p2_far_0
!	%l0  = ffffffffff93b520
!	%l1  = ffffffff7793bb53
	membar	#Sync			! Added by membar checker (533)
!	%f22 = ffffffff, %f21 = ff0725d0, %f12 = 3ff00000
	fdivs	%f22,%f21,%f12		! %f12 = ffffffff

p2_label_177:
!	%l0 = ffffffffff93b520
	sethi	%hi(0x5a6db000),%l0	! %l0 = 000000005a6db000
!	Mem[0000000018000024] = e5f0b448, %l1 = ffffffff7793bb53
	ldswa	[%i0+0x024]%asi,%l1	! %l1 = ffffffffe5f0b448
!	Branch On Register, %l6 = 0000000088000e73
	brnz,pt	%l6,p2_b204		! Branch Taken
!	Mem[0000000018800008] = 4dff0af0 438045bf, %l0 = 5a6db000, %l1 = e5f0b448
	ldda	[%i1+%o6]0x80,%l0	! %l0 = 000000004dff0af0 00000000438045bf
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0cc,%g2
p2_b204:
	membar	#Sync			! Added by membar checker (534)
!	%l0 = 000000004dff0af0, immed = 00000ba7, %y  = fffffff9
	smul	%l0,0xba7,%l2		! %l2 = 0000038cd6d87290

p2_label_178:
!	%l4 = ffffffffff93c172, Mem[0000000031800069] = f6411d2e
	stba	%l4,[%o3+0x069]%asi	! Mem[0000000031800068] = f6721d2e
!	%l2 = 0000038cd6d87290
	sethi	%hi(0x81497000),%l2	! %l2 = 0000000081497000
!	Mem[000000003080006c] = e44feeef, %l6 = 0000000088000e73
	ldsw	[%o1+0x06c],%l6		! %l6 = ffffffffe44feeef
!	%f14 = 40380000 00000000, %f4  = c7e0e4ba bf800000
	fdtox	%f14,%f4 		! %f4  = 00000000 00000018
!	Mem[0000000031000064] = ffffffac, %l0 = 000000004dff0af0
	swap	[%o2+0x064],%l0		! %l0 = 00000000ffffffac

p2_label_179:
!	%f31 = cb78da30, %f28 = 41d0a6d6 f5780000
	fitod	%f31,%f28		! %f28 = c1ca4392 e8000000
!	%l1 = 00000000438045bf, %l6 = ffffffffe44feeef, %l1 = 00000000438045bf
	orncc	%l1,%l6,%l1		! %l1 = 000000005bb055bf, %ccr = 00
!	Mem[0000000030000020] = ff32ffff, %l2 = 0000000081497000
	ldsha	[%o0+0x020]%asi,%l2	! %l2 = ffffffffffffff32
!	%f26 = bf2f8b64 00000000, %f14 = 40380000 00000000, %f22 = ffffffff ff0725d0
	fsubd	%f26,%f14,%f22		! %f22 = c038000f c5b20000
!	Mem[0000000019000000] = ff813684, %l3 = 00000000438045bf
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 000000000000ff81

p2_label_180:
!	Mem[0000000032000068] = c83f5640 d915231a, %l2 = ffffff32, %l3 = 0000ff81
	ldda	[%o4+0x068]%asi,%g2	! %l2 = ffffffffffffff32 000000000000ff81
!	Mem[0000000019000008] = 00000000054c8400, %l7 = 00000000004ae354
	ldxa	[%i2+%o6]0x80,%l7	! %l7 = 00000000054c8400
!	Mem[0000000018000040] = ff7224ff 244c4a73 68c7b3d6 f8505c98
	prefetcha [%i0+0x040]%asi,4
!	%f28 = c1ca4392 e8000000, %f20 = ffffffff ff0725d0
	fnegd	%f28,%f20		! %f20 = 41ca4392 e8000000
!	%f10 = bf2f8b64, %f26 = bf2f8b64
	fabss	%f10,%f26		! %f26 = 3f2f8b64

p2_label_181:
!	%l5 = 0000000000000000, immed = fffff970, %l3 = 000000000000ff81
	andncc	%l5,-0x690,%l3		! %l3 = 0000000000000000, %ccr = 44
	fble,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l6 = e44feeef, %l7 = 054c8400, Mem[0000000031000028] = 1b475bf0 35127347
	std	%l6,[%o2+0x028]	! Annulled
p2_b205:
	membar	#Sync			! Added by membar checker (535)
	fble,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000031000024] = b498fc4a, %l3 = 0000000000000000
	ldsh	[%o2+0x026],%l3		! %l3 = fffffffffffffc4a
p2_b206:

p2_label_182:
	membar	#Sync			! Added by membar checker (536)
!	Branch On Register, %l3 = fffffffffffffc4a
	brlz,pn	%l3,p2_b207		! Branch Taken
!	%l0 = 00000000ffffffac, Mem[0000000018800000] = d8de1000
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000018800000] = ffffffac
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0cf,%g2
p2_b207:
	bl,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000190001e0] = f7c944fa 297be9f6 c286f368 8e5c8555
	prefetch [%i2+0x1e0],4	! Annulled
p2_b208:
	membar	#Sync			! Added by membar checker (537)
!	%l0 = 00000000ffffffac, %l6 = ffffffffe44feeef, %y  = 0000038c
	smulcc	%l0,%l6,%l0		! %l0 = 0000000915c59994, %ccr = 00

p2_label_183:
	set	p2_b209,%o7
	fbne,pn	%fcc0,p2_near_0_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001b0001c0] = 9b675b58 2f06be9d 1a7a9c6f 860810f5
	prefetch [%i6+0x1c0],23
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x0d1,%g2
p2_b209:
!	Registers modified during the branch to p2_near_0
!	%l0  = 000bb50b32f7956e
!	%l2  = 04b9cd1ed1273c00
!	%l3  = fffffffffffff29b
!	%l5  = ff07c3aa0af00000
	membar	#Sync			! Added by membar checker (538)
!	Mem[0000000019000000] = ff813684 35127347 00000000 054c8400
	prefetcha [%i2+0x000]%asi,22
!	%l5 = ff07c3aa0af00000, Mem[0000000030800069] = ae1db2bb
	stb	%l5,[%o1+0x069]		! Mem[0000000030800068] = ae00b2bb
!	Mem[0000000018000008] = 448c0000, %l4 = ffffffffff93c172
	ldsba	[%i0+%o6]0x80,%l4	! %l4 = 0000000000000044

p2_label_184:
!	%f12 = ffffffff ff0725d0, %f22 = c038000f c5b20000
	fmovd	%f12,%f22		! %f22 = ffffffff ff0725d0
!	%l6 = ffffffffe44feeef, immed = fffff391, %l4 = 0000000000000044
	subc	%l6,-0xc6f,%l4		! %l4 = ffffffffe44ffb5e
!	%f8  = 3ffe0000, %f14 = 40380000, %f23 = ff0725d0
	fadds	%f8 ,%f14,%f23		! %f23 = 409b8000
!	%l0 = 000bb50b32f7956e, %l0 = 000bb50b32f7956e, %y  = ff07c3aa
	sdiv	%l0,%l0,%l5		! %l5 = fffffffffb212685
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 80

p2_label_185:
!	Mem[0000000019800008] = 544c8400, %l0 = 000bb50b32f7956e
	ldsha	[%i3+%o6]0x80,%l0	! Annulled
p2_b210:
	membar	#Sync			! Added by membar checker (539)
!	Mem[0000000018800008] = 4dff0af0, %l7 = 00000000054c8400
	ldswa	[%i1+%o6]0x80,%l7	! %l7 = 000000004dff0af0
!	Mem[0000000018000008] = 448c0000, %l1 = 000000005bb055bf
	ldsba	[%i0+%o6]0x80,%l1	! %l1 = 0000000000000044
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[00000000198000ec] = 4f813720, %l1 = 0000000000000044
	ldsh	[%i3+0x0ee],%l1		! %l1 = 0000000000003720
p2_b211:

p2_label_186:
	membar	#Sync			! Added by membar checker (540)
!	Mem[0000000030000020] = ff32ffff, %l1 = 0000000000003720
	ldsha	[%o0+0x022]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030800020] = 00000000, %l0 = 000bb50b32f7956e
	lduw	[%o1+0x020],%l0		! %l0 = 0000000000000000
!	%f12 = ffffffff, %f28 = c1ca4392
	fcmps	%fcc3,%f12,%f28		! %fcc3 = 3
	nop				! Delay added due to fcmp
	fbg,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000018800000] = ffffffac 9c8a35db
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000018800000] = 00000000 ffffffff
p2_b212:

p2_label_187:
	membar	#Sync			! Added by membar checker (541)
!	Mem[0000000019800140] = 43c17585 ecd8a81f
	flush	%i3+0x140
!	Mem[0000000030800068] = ae00b2bbe44feeef, %l0 = 0000000000000000
	ldx	[%o1+0x068],%l0		! %l0 = ae00b2bbe44feeef
!	Mem[00000000198001c8] = fdc79bc4, %l6 = ffffffffe44feeef
	ldsh	[%i3+0x1c8],%l6		! %l6 = fffffffffffffdc7
!	Mem[0000000018000008] = 448c0000, %l3 = fffffffffffff29b
	lduwa	[%i0+%o6]0x80,%l3	! %l3 = 00000000448c0000
!	Mem[00000000188001e0] = f77c67d2 24550e10 ff2e394a 55aca8f2
	prefetch [%i1+0x1e0],0

p2_label_188:
!	Branch On Register, %l1 = ffffffffffffffff
	brgez,a,pt %l1,p2_not_taken_0	! Branch Not Taken
!	Mem[000000001b0000e0] = 448dcd28 bafee9ad 595c6309 e48ce54a
	prefetch [%i6+0x0e0],16	! Annulled
p2_b213:
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000019000040] = 00000000 00000000 90e91103 3243f6ab
	prefetch [%i2+0x040],21	! Annulled
p2_b214:
	membar	#Sync			! Added by membar checker (542)
!	%l0 = ae00b2bbe44feeef, immed = fffff512, %y  = ff07c3aa
	mulx	%l0,-0xaee,%l2		! %l2 = 345e7e669e5a87ce

p2_label_189:
!	%l7 = 000000004dff0af0, Mem[0000000018000198] = ff9c3a32d5069287
	stxa	%l7,[%i0+0x198]%asi	! Mem[0000000018000198] = 000000004dff0af0
!	%f14 = 40380000 00000000, %f8  = 3ffe0000 00000000
	fmovd	%f14,%f8 		! %f8  = 40380000 00000000
!	%l6 = fffffffffffffdc7, Mem[0000000019000008] = 00000000
	stba	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = c7000000
!	Mem[000000001b000008] = 4353e2e528de81c9, %l5 = fffffffffb212685
	ldxa	[%i6+%o6]0x80,%l5	! %l5 = 4353e2e528de81c9
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],2

p2_label_190:
!	Mem[0000000032000040] = 73250d1d 4839c3f8 8e1c8c7e 1df58c8b
	prefetcha [%o4+0x040]%asi,23
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetch [%o4+0x020],4
!	%f23 = 409b8000, %f20 = 41ca4392 e8000000
	fitod	%f23,%f20		! %f20 = 41d026e0 00000000
!	%f3  = f5780000, %f27 = 00000000
	fcmps	%fcc2,%f3 ,%f27		! %fcc2 = 1
!	Mem[0000000030000068] = ff8a6660, %l3 = 00000000448c0000
	lduh	[%o0+0x06a],%l3		! %l3 = 0000000000006660

p2_label_191:
	fbu,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l3 = 0000000000006660, Mem[0000000018000120] = f9a5389b
	sth	%l3,[%i0+0x120]		! Mem[0000000018000120] = 6660389b
p2_b215:
	membar	#Sync			! Added by membar checker (543)
	fbug,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000001a800000] = 00355721 29d1b203, %l4 = e44ffb5e, %l5 = 28de81c9
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000355721 0000000029d1b203
p2_b216:
	membar	#Sync			! Added by membar checker (544)
!	%l6 = fffffffffffffdc7, %l7 = 000000004dff0af0, %y  = ff07c3aa
	umulcc	%l6,%l7,%l4		! %l4 = 4dff0a42a420b090, %ccr = 08

p2_label_192:
!	%f4  = 00000000 00000018, %f16 = ff0725d0 00000000
	fxtod	%f4 ,%f16		! %f16 = 40380000 00000000
!	%f21 = 00000000, %f21 = 00000000
	fitos	%f21,%f21		! %f21 = 00000000
!	%f4  = 00000000 00000018, %f9  = 00000000
	fxtos	%f4 ,%f9 		! %f9  = 41c00000
!	Mem[0000000031000060] = 000017704dff0af0, %l1 = ffffffffffffffff
	ldxa	[%o2+0x060]%asi,%l1	! %l1 = 000017704dff0af0
!	Mem[0000000030800064] = ffffffac, %l5 = 0000000029d1b203
	ldsb	[%o1+0x064],%l5		! %l5 = ffffffffffffffff

p2_label_193:
!	Mem[0000000018000008] = 448c0000, %l5 = ffffffffffffffff
	lduha	[%i0+%o6]0x80,%l5	! %l5 = 000000000000448c
!	%l0 = ae00b2bbe44feeef, Mem[0000000019800008] = 544c84000d10adac
	stxa	%l0,[%i3+%o6]0x80	! Mem[0000000019800008] = ae00b2bbe44feeef
!	Mem[0000000030800020] = 0000000000001770, %l5 = 000000000000448c
	ldx	[%o1+0x020],%l5		! %l5 = 0000000000001770
!	%f18 = ffffffff ff0725d0, %f28 = c1ca4392 e8000000
	fnegd	%f18,%f28		! %f28 = 7fffffff ff0725d0
!	Mem[0000000031000020] = ffffff81, %l0 = ae00b2bbe44feeef
	ldswa	[%o2+0x020]%asi,%l0	! %l0 = ffffffffffffff81

p2_label_194:
	set	p2_b217,%o7
	fbo,a	p2_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001a0001e4] = 2280ccc4, %l2 = 345e7e669e5a87ce
	ldsb	[%i4+0x1e6],%l2		! %l2 = ffffffffffffffcc
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0d9,%g2
p2_b217:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000f9fe5914
!	%l1  = ffffffffffffffff
!	%l3  = 0000000000000002
!	%l6  = 000000007fffffff
	membar	#Sync			! Added by membar checker (545)
!	%f28 = 7fffffff, %f11 = 00000000, %f15 = 00000000
	fmuls	%f28,%f11,%f15		! %f15 = 7fffffff
!	%l1 = ffffffffffffffff, %l3 = 0000000000000002, %l3 = 0000000000000002
	srax	%l1,%l3,%l3		! %l3 = ffffffffffffffff
!	%l3 = ffffffffffffffff, %l7 = 000000004dff0af0, %y  = 4dff0a42
	smul	%l3,%l7,%l6		! %l6 = ffffffffb200f510

p2_label_195:
	bpos	p2_b218			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[0000000019000008] = c7000000054c8400, %l0 = 00000000f9fe5914
	ldxa	[%i2+%o6]0x80,%l0	! %l0 = c7000000054c8400
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0da,%g2
p2_b218:
	membar	#Sync			! Added by membar checker (546)
!	%f28 = 7fffffff, %f18 = ffffffff, %f26 = 3f2f8b64 00000000
	fsmuld	%f28,%f18,%f26		! %f26 = ffffffff e0000000
!	%l6 = ffffffffb200f510, Mem[0000000018000000] = ff000000
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000018000000] = 10000000
!	Mem[000000001800010c] = 860b81a2, %l1 = ffffffffffffffff
	ldsb	[%i0+0x10d],%l1		! %l1 = 000000000000000b

p2_label_196:
!	%l0 = c7000000054c8400, immed = fffff5fa, %y  = ffffffff
	sdivcc	%l0,-0xa06,%l1		! %l1 = 00000000001902f1, %ccr = 00
	set	p2_b219,%o7
	fbge,a,pn %fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000018800162] = 882d9fa5, %l7 = 000000004dff0af0
	ldstub	[%i1+0x162],%l7		! %l7 = 000000000000009f
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p2_branch_failed
	mov	0x0db,%g2
p2_b219:
!	Registers modified during the branch to p2_near_1
!	%l2  = ffffffffffff4910
!	%l4  = 0000000000190596
!	%l6  = ffffffffffffffff
!	%l7  = 000fffffffffffff
	membar	#Sync			! Added by membar checker (547)
!	%f21 = 00000000, %f31 = cb78da30, %f24 = 3ffe0000
	fdivs	%f21,%f31,%f24		! %f24 = 80000000
	fbule,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 2

p2_label_197:
!	%l1 = 00000000001902f1, Mem[0000000032000020] = 5d456367
	sth	%l1,[%o4+0x020]		! Annulled
p2_b220:
	membar	#Sync			! Added by membar checker (548)
!	Mem[0000000019800000] = 00000000, %l5 = 0000000000001770
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
	set	p2_b221,%o7
	fbule,a,pn %fcc1,p2_near_1_he	! Branch Taken, %fcc1 = 1
!	%l3 = ffffffffffffffff, Mem[0000000018800008] = 4dff0af0
	stha	%l3,[%i1+%o6]0x80	! Mem[0000000018800008] = ffff0af0
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p2_branch_failed
	mov	0x0dd,%g2
p2_b221:
!	Registers modified during the branch to p2_near_1
!	%l1  = fffffffffffff843
!	%l4  = 000000000000b618
	membar	#Sync			! Added by membar checker (549)
!	Mem[0000000019800004] = 00000000, %l4 = 000000000000b618
	ldsh	[%i3+0x006],%l4		! %l4 = 0000000000000000

p2_label_198:
!	%l5 = 0000000000000000, immed = 0000001b, %l0 = c7000000054c8400
	sllx	%l5,0x01b,%l0		! %l0 = 0000000000000000
!	%l1 = fffffffffffff843, %l2 = ffffffffffff4910, %l7 = 000fffffffffffff
	srlx	%l1,%l2,%l7		! %l7 = 0000ffffffffffff
!	%l5 = 0000000000000000, immed = 0000018c, %l0 = 0000000000000000
	addccc	%l5,0x18c,%l0		! %l0 = 000000000000018c, %ccr = 00
!	Mem[000000003180006c] = f6ffb957, %l5 = 0000000000000000
	swap	[%o3+0x06c],%l5		! %l5 = 00000000f6ffb957
!	%f24 = 80000000, %f30 = dacf9ab3
	fcmpes	%fcc0,%f24,%f30		! %fcc0 = 2

p2_label_199:
!	%l4 = 0000000000000000, immed = fffff397, %l7 = 0000ffffffffffff
	orncc	%l4,-0xc69,%l7		! %l7 = 0000000000000c68, %ccr = 00
!	%f24 = 80000000 00000001, %f24 = 80000000 00000001
	fmovd	%f24,%f24		! %f24 = 80000000 00000001
!	%f20 = 41d026e0 00000000, %f6  = 3ff00000
	fdtos	%f20,%f6 		! %f6  = 4e813700
!	%l4 = 0000000000000000, Mem[00000000190000e4] = 394d8822
	stba	%l4,[%i2+0x0e4]%asi	! Mem[00000000190000e4] = 004d8822
!	%f16 = 40380000 00000000, %f8  = 40380000 41c00000, %f10 = bf2f8b64 00000000
	faddd	%f16,%f8 ,%f10		! %f10 = 40480000 20e00000

p2_label_200:
!	%f18 = ffffffff, %f23 = 409b8000
	fcmpes	%fcc2,%f18,%f23		! %fcc2 = 3
!	%l5 = 00000000f6ffb957, immed = 000009ab, %y  = ffffffff
	smulcc	%l5,0x9ab,%l4		! %l4 = ffffffa8fa54dc1d, %ccr = 88
!	%l5 = 00000000f6ffb957, immed = 0000033d, %l6 = ffffffffffffffff
	and	%l5,0x33d,%l6		! %l6 = 0000000000000115
!	%f9  = 41c00000, %f14 = 40380000 7fffffff
	fstox	%f9 ,%f14		! %f14 = 00000000 00000018
	bl,a	p2_b222			! Branch Taken, %ccr = 88, CWP = 0
	nop
	ba	p2_branch_failed
	mov	0x0de,%g2
	nop
p2_b222:
	nop

	membar	#Sync			! Force all stores to complete

!	End of Random Code for Processor 2

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x008]		! Set processor 2 done flag

!	Check Registers

p2_check_registers:
	set	p2_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000000000018c
	bne,a,pn %xcc,p2_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be fffffffffffff843
	bne,a,pn %xcc,p2_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffffffff4910
	bne,a,pn %xcc,p2_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffffffffff
	bne,a,pn %xcc,p2_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffa8fa54dc1d
	bne,a,pn %xcc,p2_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000f6ffb957
	bne,a,pn %xcc,p2_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000115
	bne,a,pn %xcc,p2_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000c68
	bne,a,pn %xcc,p2_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xffffffa8,%g2
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
	cmp	%l0,%l1			! %f0  should be b716fe95 3f800000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 41d0a6d6 f5780000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 00000018
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 4e813700 ff0725d0
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 40380000 41c00000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 40480000 20e00000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ffffffff ff0725d0
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000018
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 40380000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ffffffff ff0725d0
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 41d026e0 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ffffffff 409b8000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 80000000 00000001
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffffffff e0000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 7fffffff ff0725d0
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf28,%g1

!	Check Local Memory

	set	p2_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 1000000088000000
	ldx	[%i0+0x000],%g3		! Observed data at 0000000018000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 448c0000f8a9115d
	ldx	[%i0+0x008],%g3		! Observed data at 0000000018000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = ff93c17200000000
	ldx	[%i0+0x018],%g3		! Observed data at 0000000018000018
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 6660389b9f045b12
	ldx	[%i0+0x120],%g3		! Observed data at 0000000018000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x138],%g2		! Expect data = d55d1034ce174669
	ldx	[%i0+0x138],%g3		! Observed data at 0000000018000138
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x150],%g2		! Expect data = 3072693d6d400bff
	ldx	[%i0+0x150],%g3		! Observed data at 0000000018000150
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x160],%g2		! Expect data = 00000000000000bf
	ldx	[%i0+0x160],%g3		! Observed data at 0000000018000160
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x178],%g2		! Expect data = 7d837e80424be712
	ldx	[%i0+0x178],%g3		! Observed data at 0000000018000178
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x178,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 000000004dff0af0
	ldx	[%i0+0x198],%g3		! Observed data at 0000000018000198
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 0436f4b24186dea5
	ldx	[%i0+0x1a8],%g3		! Observed data at 00000000180001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = a6a4ff0bd986d262
	ldx	[%i0+0x1d0],%g3		! Observed data at 00000000180001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1d0,%g4

	set	p2_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000ffffffff
	ldx	[%i1+0x000],%g3		! Observed data at 0000000018800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffff0af0438045bf
	ldx	[%i1+0x008],%g3		! Observed data at 0000000018800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x040],%g2		! Expect data = f9a725ef00000295
	ldx	[%i1+0x040],%g3		! Observed data at 0000000018800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x050],%g2		! Expect data = ffac0af0438045bf
	ldx	[%i1+0x050],%g3		! Observed data at 0000000018800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x080],%g2		! Expect data = 6b4fb96f00000000
	ldx	[%i1+0x080],%g3		! Observed data at 0000000018800080
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = a72c4279afc3eeef
	ldx	[%i1+0x0f0],%g3		! Observed data at 00000000188000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x110],%g2		! Expect data = 6cd31e30cdb913ea
	ldx	[%i1+0x110],%g3		! Observed data at 0000000018800110
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x160],%g2		! Expect data = 882dffa5cce5b133
	ldx	[%i1+0x160],%g3		! Observed data at 0000000018800160
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = 351100de7d4fabbf
	ldx	[%i1+0x1d0],%g3		! Observed data at 00000000188001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = ff2e394a55aca8f2
	ldx	[%i1+0x1e8],%g3		! Observed data at 00000000188001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = e01b49a700000000
	ldx	[%i1+0x1f8],%g3		! Observed data at 00000000188001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f8,%g4

	set	p2_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = ff81368435127347
	ldx	[%i2+0x000],%g3		! Observed data at 0000000019000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = c7000000054c8400
	ldx	[%i2+0x008],%g3		! Observed data at 0000000019000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 0000000000000000
	ldx	[%i2+0x040],%g3		! Observed data at 0000000019000040
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x088],%g2		! Expect data = 407eadacb487ac94
	ldx	[%i2+0x088],%g3		! Observed data at 0000000019000088
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 62771c9300000000
	ldx	[%i2+0x0a8],%g3		! Observed data at 00000000190000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 5f98617a004d8822
	ldx	[%i2+0x0e0],%g3		! Observed data at 00000000190000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x150],%g2		! Expect data = cc61e89c3ea1fff8
	ldx	[%i2+0x150],%g3		! Observed data at 0000000019000150
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x168],%g2		! Expect data = b87fff9e06b55d78
	ldx	[%i2+0x168],%g3		! Observed data at 0000000019000168
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x178],%g2		! Expect data = bf007cd5c3bb1045
	ldx	[%i2+0x178],%g3		! Observed data at 0000000019000178
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x178,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 0000cf2ecc461e0a
	ldx	[%i2+0x1a8],%g3		! Observed data at 00000000190001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = 0000000000000002
	ldx	[%i2+0x1d8],%g3		! Observed data at 00000000190001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1d8,%g4

	set	p2_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x000],%g3		! Observed data at 0000000019800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ae00b2bbe44feeef
	ldx	[%i3+0x008],%g3		! Observed data at 0000000019800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 410e61ff330c0fcd
	ldx	[%i3+0x070],%g3		! Observed data at 0000000019800070
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x098],%g2		! Expect data = bd5d352700000000
	ldx	[%i3+0x098],%g3		! Observed data at 0000000019800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x100],%g2		! Expect data = 00001770d176d4d6
	ldx	[%i3+0x100],%g3		! Observed data at 0000000019800100
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x170],%g2		! Expect data = bae11355ff9ecab7
	ldx	[%i3+0x170],%g3		! Observed data at 0000000019800170
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x180],%g2		! Expect data = ffe22127ecffffff
	ldx	[%i3+0x180],%g3		! Observed data at 0000000019800180
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = 4dff0af0438045bf
	ldx	[%i3+0x1a0],%g3		! Observed data at 00000000198001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 5aaec3f8fffffbbd
	ldx	[%i3+0x1b0],%g3		! Observed data at 00000000198001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 351100de7d4fabbf
	ldx	[%i3+0x1f0],%g3		! Observed data at 00000000198001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f0,%g4

	set	p2_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = d65f262959427347
	ldx	[%i4+0x000],%g3		! Observed data at 000000001a000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4

	set	p2_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0035572129d1b203
	ldx	[%i5+0x000],%g3		! Observed data at 000000001a800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 4dac0af0438045bf
	ldx	[%i5+0x0d8],%g3		! Observed data at 000000001a8000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0d8,%g4

	set	p2_local6_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 004ae354715ae4d8
	ldx	[%i6+0x000],%g3		! Observed data at 000000001b000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = ffffffff7fffffff
	ldx	[%i6+0x0a0],%g3		! Observed data at 000000001b0000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a0,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p2_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p2_memcheck_share0:
	ldx	[%g4+0x20],%g2	! Expected value = ff32ffffffffc2de
	ldx	[%o0+0x20],%g3	! Read value at Mem[0000000030000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 0000000000000000
	ldx	[%o0+0x28],%g3	! Read value at Mem[0000000030000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = ffc53171ecff8891
	ldx	[%o0+0x60],%g3	! Read value at Mem[0000000030000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = ff8a66600012ce3e
	ldx	[%o0+0x68],%g3	! Read value at Mem[0000000030000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p2_memcheck_share1:
	ldx	[%g4+0x20],%g2	! Expected value = 0000000000001770
	ldx	[%o1+0x20],%g3	! Read value at Mem[0000000030800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 000000777d4fabbf
	ldx	[%o1+0x28],%g3	! Read value at Mem[0000000030800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 4ddea900ffffffac
	ldx	[%o1+0x60],%g3	! Read value at Mem[0000000030800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = ae00b2bbe44feeef
	ldx	[%o1+0x68],%g3	! Read value at Mem[0000000030800068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p2_memcheck_share2:
	ldx	[%g4+0x20],%g2	! Expected value = ffffff81b498fc4a
	ldx	[%o2+0x20],%g3	! Read value at Mem[0000000031000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 1b475bf035127347
	ldx	[%o2+0x28],%g3	! Read value at Mem[0000000031000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 000017704dff0af0
	ldx	[%o2+0x60],%g3	! Read value at Mem[0000000031000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 000040a500000b82
	ldx	[%o2+0x68],%g3	! Read value at Mem[0000000031000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p2_memcheck_share3:
	ldx	[%g4+0x20],%g2	! Expected value = 9aeb448cffffffff
	ldx	[%o3+0x20],%g3	! Read value at Mem[0000000031800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 00005482438045bf
	ldx	[%o3+0x28],%g3	! Read value at Mem[0000000031800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 0d10adac00000000
	ldx	[%o3+0x60],%g3	! Read value at Mem[0000000031800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = f6721d2e00000000
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
	sdivcc	%l0,-0xf2f,%l1
	xnorcc	%l2,%l6,%l1
	smulcc	%l4,%l0,%l3
	done

p2_trap1o:
	sdivcc	%l0,-0xf2f,%l1
	xnorcc	%l2,%l6,%l1
	smulcc	%l4,%l0,%l3
	done


p2_trap2e:
	andn	%l5,-0x02a,%l5
	prefetch [%i1+0x1c0],16
	xnorcc	%l1,-0x27a,%l5
	done

p2_trap2o:
	andn	%l5,-0x02a,%l5
	prefetch [%o1+0x1c0],16
	xnorcc	%l1,-0x27a,%l5
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
	ldx	[%g1+0x000],%l0	! %l0 = bb7beaffc30bb067
	ldx	[%g1+0x008],%l1	! %l1 = 51c51e0009a04f78
	ldx	[%g1+0x010],%l2	! %l2 = a69eeeffc8f6bcb2
	ldx	[%g1+0x018],%l3	! %l3 = 58c83afff46acc1d
	ldx	[%g1+0x020],%l4	! %l4 = 3cfb14007b2c990c
	ldx	[%g1+0x028],%l5	! %l5 = f53801003e5551e5
	ldx	[%g1+0x030],%l6	! %l6 = 323d7d0044a3f638
	ldx	[%g1+0x038],%l7	! %l7 = f69be1fff406fbe7

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
	ldd	[%g1+0x00],%f0		! %f0  = 10472730, %f1  = c6b76ccd
	ldd	[%g1+0x08],%f2		! %f2  = 1e5feb1f, %f3  = fe49fc2e
	ldd	[%g1+0x10],%f4		! %f4  = 9d08d82d, %f5  = 578c59a0
	ldd	[%g1+0x18],%f6		! %f6  = 1a432906, %f7  = e6ed9167
	ldd	[%g1+0x20],%f8		! %f8  = baa1fac4, %f9  = 54fc1218
	ldd	[%g1+0x28],%f10		! %f10 = d28708f6, %f11 = 16a02220
	ldd	[%g1+0x30],%f12		! %f12 = 336c419b, %f13 = f201e277
	ldd	[%g1+0x38],%f14		! %f14 = 32d6549d, %f15 = 4e523906
	ldd	[%g1+0x40],%f16		! %f16 = 0dd7cf05, %f17 = c9898510
	ldd	[%g1+0x48],%f18		! %f18 = 3ef475ba, %f19 = c347b018
	ldd	[%g1+0x50],%f20		! %f20 = 260f97f1, %f21 = 82a1c504
	ldd	[%g1+0x58],%f22		! %f22 = 625c8c02, %f23 = 502056f8
	ldd	[%g1+0x60],%f24		! %f24 = 98ed48bd, %f25 = 47df5d2c
	ldd	[%g1+0x68],%f26		! %f26 = 7b965607, %f27 = cf641e78
	ldd	[%g1+0x70],%f28		! %f28 = 3758a714, %f29 = 441fa8d9
	ldd	[%g1+0x78],%f30		! %f30 = 4efeccd3, %f31 = 0738aebe
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 3

p3_label_1:
	membar	#Sync			! Added by membar checker (550)
!	%l2 = b44dedffd755e680, %l4 = 6e2dd1ffbffa428c, %l0 = 9f0660007689ebcd
	sllx	%l2,%l4,%l0		! %l0 = dedffd755e680000
!	%l5 = 0a2ff1fffad0497b
	sethi	%hi(0x52648c00),%l5	! %l5 = 0000000052648c00
!	%l7 = 534f5e0068148672, %l2 = b44dedffd755e680, %l6 = b6d1d5ffe1f86259
	xorcc	%l7,%l2,%l6		! %l6 = e702b3ffbf4160f2, %ccr = 88
!	Mem[000000001d800160] = 60ba55f5 3c04281e f5d7f703 3daa8c89
	prefetcha [%i3+0x160]%asi,3
!	%l4 = 6e2dd1ffbffa428c, Mem[0000000030000034] = a333a6dd
	stwa	%l4,[%o0+0x034]%asi	! Mem[0000000030000034] = bffa428c

p3_label_2:
!	Mem[0000000032000010] = bc65a121, %l0 = dedffd755e680000
	ldsha	[%o4+0x012]%asi,%g2	! %g2 = ffffffffffffbc65
!	Mem[000000003080007c] = 7d99a2de, %l4 = 6e2dd1ffbffa428c
	ldsba	[%o1+0x07e]%asi,%l4	! %l4 = ffffffffffffffa2
!	Mem[000000001d8000d8] = 02b96658 b2af50cc, %l0 = 5e680000, %l1 = 750732e0
	ldd	[%i3+0x0d8],%l0		! %l0 = 0000000002b96658 00000000b2af50cc
!	Branch On Register, %l4 = ffffffffffffffa2
	brgez,a,pt %l4,p3_not_taken_0	! Branch Not Taken
!	%l4 = ffffffffffffffa2, Mem[000000001e000008] = 29675ac5
	stwa	%l4,[%i4+%o6]0x80	! Annulled
p3_b1:

p3_label_3:
	set	p3_b2,%o7
	fbue,a	p3_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetch [%o4+0x020],0
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x002,%g2
p3_b2:
!	Registers modified during the branch to p3_far_3
!	%l4  = 18fd4c00f211d83e
!	%l5  = e702b3ffbf41770d
!	%l6  = e702b3ffbf416c6a
!	%l7  = 000000000000004e
	membar	#Sync			! Added by membar checker (551)
!	%f14 = 32d6549d 4e523906, %f26 = 7b965607 cf641e78
	fmovd	%f14,%f26		! %f26 = 32d6549d 4e523906
!	%l4 = 18fd4c00f211d83e, immed = fffff87c, %y  = 00000000
	sdivx	%l4,-0x784,%l6		! %l6 = fffcaccce7ec9086
!	%l3 = 16b343004d62c637, %l5 = e702b3ffbf41770d, %y  = 00000000
	sdiv	%l3,%l5,%l2		! %l2 = ffffffffffffffff

p3_label_4:
	fbne,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d000040] = 20e90910 31d0aad2 f5d32dc0 08e346aa
	prefetch [%i2+0x040],3	! Annulled
p3_b3:
	fbne	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031000034] = fe855d0b, %l2 = ffffffffffffffff
	lduh	[%o2+0x034],%l2		! %l2 = 000000000000fe85
p3_b4:
	membar	#Sync			! Added by membar checker (552)
!	Mem[000000001c800000] = 024b339c, %l4 = 18fd4c00f211d83e
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 00000000024b339c

p3_label_5:
!	%l1 = 00000000b2af50cc, immed = 00000242, %l3 = 16b343004d62c637
	sub	%l1,0x242,%l3		! %l3 = 00000000b2af4e8a
	fbne,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001c000120] = d8b09060 3fdf5798 02896272 754dab85
	prefetch [%i0+0x120],2
p3_b5:
	membar	#Sync			! Added by membar checker (553)
!	%l0 = 0000000002b96658, immed = 00000021, %l4 = 00000000024b339c
	srax	%l0,0x021,%l4		! %l4 = 0000000000000000
!	%l2 = 000000000000fe85, immed = 00000dca, %l5 = e702b3ffbf41770d
	xnor	%l2,0xdca,%l5		! %l5 = ffffffffffff0cb0

p3_label_6:
!	Mem[000000001c800008] = 23f97298, %l3 = 00000000b2af4e8a
	ldstuba	[%i1+%o6]0x80,%l3	! %l3 = 0000000000000023
!	Mem[000000001e80008c] = 05efd2ac, %l6 = fffcaccce7ec9086
	ldsb	[%i5+0x08e],%l6		! %l6 = ffffffffffffffd2
	fbn,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001d800068] = e4d6a865, %l3 = 0000000000000023
	ldsh	[%i3+0x06a],%l3		! %l3 = ffffffffffffa865
p3_b6:
	membar	#Sync			! Added by membar checker (554)
!	%f25 = 47df5d2c, %f17 = c9898510
	fabss	%f25,%f17		! %f17 = 47df5d2c

p3_label_7:
!	%f16 = 0dd7cf05, %f30 = 4efeccd3
	fcmpes	%fcc1,%f16,%f30		! %fcc1 = 1
	nop
!	%l5 = ffffffffffff0cb0, %l4 = 0000000000000000, %l7 = 000000000000004e
	addcc	%l5,%l4,%l7		! %l7 = ffffffffffff0cb0, %ccr = 88
!	%l0 = 0000000002b96658, immed = fffffb7e, %l5 = ffffffffffff0cb0
	xnorcc	%l0,-0x482,%l5		! %l5 = 0000000002b962d9, %ccr = 00
	set	p3_b7,%o7
	fbge,a	p3_far_3_le	! Branch Taken, %fcc0 = 0

p3_label_8:
!	Mem[000000001d8000d8] = 02b96658, %l0 = 0000000002b96658
	ldsw	[%i3+0x0d8],%l0		! %l0 = 0000000002b96658
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p3_branch_failed
	mov	0x007,%g2
p3_b7:
!	Registers modified during the branch to p3_far_3
!	%l1  = fffffffffffffff7
!	%l4  = fffff0be0002b598
!	%l7  = ffffffffffffffd4
	set	p3_b8,%o7
	fbge	p3_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d800008] = 6b7c78a7, %l4 = fffff0be0002b598
	ldsha	[%i3+%o6]0x80,%l4	! %l4 = 0000000000006b7c
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x008,%g2
p3_b8:
!	Registers modified during the branch to p3_far_1
!	%l1  = 0000000002b962d1
!	%l3  = ffffffdcd1bc5390
	membar	#Sync			! Added by membar checker (555)
!	%l4 = 0000000000006b7c, Mem[0000000030800034] = 6b75b14f
	stw	%l4,[%o1+0x034]		! Mem[0000000030800034] = 00006b7c
!	%f6  = 1a432906 e6ed9167, %f6  = 1a432906 e6ed9167
	fabsd	%f6 ,%f6 		! %f6  = 1a432906 e6ed9167

p3_label_9:
!	%l1 = 0000000002b962d1, immed = 00000b64, %l0 = 0000000002b96658
	sub	%l1,0xb64,%l0		! %l0 = 0000000002b9576d
	fblg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 0000000002b9576d, Mem[000000001d000000] = 32f55c6a45a6d2cc
	stxa	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = 0000000002b9576d
p3_b9:
	membar	#Sync			! Added by membar checker (556)
	set	p3_b10,%o7
	fba,pt	%fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001c00010c] = b12b8a94, %l3 = ffffffdcd1bc5390
	ldsw	[%i0+0x10c],%l3		! %l3 = ffffffffb12b8a94
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x00a,%g2
p3_b10:

p3_label_10:
	membar	#Sync			! Added by membar checker (557)
!	%l5 = 0000000002b962d9, %l5 = 0000000002b962d9, %l6 = ffffffffffffffd2
	xorcc	%l5,%l5,%l6		! %l6 = 0000000000000000, %ccr = 44
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001c000008] = db4f11ba645fbaa2, %l4 = 0000000000006b7c
	ldxa	[%i0+%o6]0x80,%l4	! %l4 = db4f11ba645fbaa2
p3_b11:
	membar	#Sync			! Added by membar checker (558)
!	%f25 = 47df5d2c, %f6  = 1a432906
	fnegs	%f25,%f6 		! %f6  = c7df5d2c
	bcc,a	p3_b12			! Branch Taken, %ccr = 44, CWP = 0

p3_label_11:
!	%l2 = 000000000000fe85, Mem[000000001c000000] = a96c1898
	stwa	%l2,[%i0+%g0]0x80	! Mem[000000001c000000] = 0000fe85
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x00c,%g2
p3_b12:
	membar	#Sync			! Added by membar checker (559)
!	%f10 = d28708f6, %f18 = 3ef475ba c347b018
	fstox	%f10,%f18		! %f18 = ffffffbc 7b850000
!	%f1  = c6b76ccd, %f0  = 10472730
	fcmpes	%fcc0,%f1 ,%f0 		! %fcc0 = 1
	nop				! Delay added due to fcmp
	set	p3_b13,%o7
	fba,pt	%fcc0,p3_near_2_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d8000a0] = 67da795b ff121bcb 25d65e10 39a24863
	prefetch [%i3+0x0a0],16
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x00d,%g2
p3_b13:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000ffffffff
!	%l4  = ffffffffffff0ba2

p3_label_12:
	membar	#Sync			! Added by membar checker (560)
!	%f24 = 98ed48bd 47df5d2c, %f18 = ffffffbc 7b850000, %f28 = 3758a714 441fa8d9
	fmuld	%f24,%f18,%f28		! %f28 = ffffffbc 7b850000
!	%l4 = ffffffffffff0ba2, %l6 = 0000000000000000, %l3 = ffffffffb12b8a94
	sll	%l4,%l6,%l3		! %l3 = ffffffffffff0ba2
!	Jump to jmpl_2, CWP = 0
	set	p3_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001c8001e0] = a34fe759 a4cc5655 2e90681b e451047d
	prefetch [%i1+0x1e0],22
!	Registers modified during the branch to p3_jmpl_2
!	%l3  = fffffffffffff772
!	%f12 = 336c419b f201e277, %f10 = d28708f6 16a02220
	fabsd	%f12,%f10		! %f10 = 336c419b f201e277

p3_label_13:
!	Mem[000000001d8000d0] = 3beeef6834060fde, %l3 = fffffffffffff772
	ldxa	[%i3+0x0d0]%asi,%l3	! %l3 = 3beeef6834060fde
	fbg,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l6 = 0000000000000000, Mem[000000001c8000be] = d58f1022
	stb	%l6,[%i1+0x0be]		! Mem[000000001c8000bc] = d58f0022
p3_b14:
	membar	#Sync			! Added by membar checker (561)
!	Branch On Register, %l6 = 0000000000000000
	brlez,a,pn %l6,p3_b15		! Branch Taken
!	Mem[000000001c000008] = db4f11ba, %l3 = 3beeef6834060fde
	ldswa	[%i0+%o6]0x80,%l3	! %l3 = ffffffffdb4f11ba
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x00f,%g2
p3_b15:

p3_label_14:
	membar	#Sync			! Added by membar checker (562)
!	Mem[000000001c80019f] = 4f4449cc, %l2 = 000000000000fe85
	ldstuba	[%i1+0x19f]%asi,%l2	! %l2 = 00000000000000cc
	fbue,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c000000] = 0000fe85, %l4 = ffffffffffff0ba2
	lduwa	[%i0+%g0]0x80,%l4	! %l4 = 000000000000fe85
p3_b16:
	membar	#Sync			! Added by membar checker (563)
!	%f25 = 47df5d2c, %f6  = c7df5d2c, %f6  = c7df5d2c
	fsubs	%f25,%f6 ,%f6 		! %f6  = 485f5d2c
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 99

p3_label_15:
!	Mem[000000001d800140] = 04a4c000, %l1 = 00000000ffffffff
	lduh	[%i3+0x140],%l1		! Annulled
p3_b17:
	membar	#Sync			! Added by membar checker (564)
!	Branch On Register, %l3 = ffffffffdb4f11ba
	brnz,pn	%l3,p3_b18		! Branch Taken
!	Mem[000000001d000000] = 00000000, %l4 = 000000000000fe85
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x012,%g2
p3_b18:
	membar	#Sync			! Added by membar checker (565)
!	%l4 = 0000000000000000, Mem[000000003100007c] = caa5f8f9
	stw	%l4,[%o2+0x07c]		! Mem[000000003100007c] = 00000000
	set	p3_b19,%o7
	fbl,a	p3_far_1_le	! Branch Taken, %fcc0 = 1

p3_label_16:
!	Mem[000000001d800120] = 641bb732 574e1559 15f2df8c 69f6b478
	prefetch [%i3+0x120],20
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p3_branch_failed
	mov	0x013,%g2
p3_b19:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 0000000000000000
!	%l4  = 00000000000000d9
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (566)
!	Mem[0000000031000038] = 00006b7c 02b962ff, %l0 = ffffffe7, %l1 = ffffffff
	ldda	[%o2+0x038]%asi,%l0	! %l0 = 0000000000006b7c 0000000002b962ff
!	%l5 = 0000000000000000, %l7 = ffffffffffffffd4, %l3 = 0000000000000000
	andncc	%l5,%l7,%l3		! %l3 = 0000000000000000, %ccr = 44
!	Mem[000000001d000008] = b4da1e8e, %l0 = 0000000000006b7c
	ldsha	[%i2+%o6]0x80,%l0	! %l0 = ffffffffffffb4da
!	%f30 = 4efeccd3 0738aebe, %f30 = 4efeccd3 0738aebe, %f28 = ffffffbc 7b850000
	fsubd	%f30,%f30,%f28		! %f28 = 00000000 00000000

p3_label_17:
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c000008] = db4f11ba, %l0 = ffffffffffffb4da
	ldsha	[%i0+%o6]0x80,%l0	! %l0 = ffffffffffffdb4f
p3_b20:
	membar	#Sync			! Added by membar checker (567)
!	%f10 = 336c419b f201e277, %f20 = 260f97f1 82a1c504
	fmovd	%f10,%f20		! %f20 = 336c419b f201e277
	set	p3_b21,%o7
	fbo	p3_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000031000034] = fe855d0b, %l4 = 00000000000000d9
	ldsh	[%o2+0x036],%l4		! %l4 = 0000000000005d0b
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x015,%g2
p3_b21:
!	Registers modified during the branch to p3_far_3
!	%l1  = fffffffffffffef7
!	%l4  = 0000000000000000
!	%l7  = 0000000000000000

p3_label_18:
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001c0000a0] = 15cb2b61 c3ca8390, %l4 = 00000000, %l5 = 00000000
	ldd	[%i0+0x0a0],%l4		! %l4 = 0000000015cb2b61 00000000c3ca8390
p3_b22:
	membar	#Sync			! Added by membar checker (568)
!	%f14 = 32d6549d, %f22 = 625c8c02
	fcmpes	%fcc2,%f14,%f22		! %fcc2 = 1
!	%l4 = 0000000015cb2b61, immed = 00000ea2, %y  = 00000000
	sdiv	%l4,0xea2,%l6		! %l6 = 0000000000017d47
!	%l1 = fffffffffffffef7, %l7 = 0000000000000000, %l4 = 0000000015cb2b61
	sll	%l1,%l7,%l4		! %l4 = fffffffffffffef7

p3_label_19:
!	%f18 = ffffffbc 7b850000, %f16 = 0dd7cf05 47df5d2c, %f24 = 98ed48bd 47df5d2c
	fdivd	%f18,%f16,%f24		! %f24 = ffffffbc 7b850000
!	%f28 = 00000000 00000000, %f30 = 4efeccd3 0738aebe, %f28 = 00000000 00000000
	fsubd	%f28,%f30,%f28		! %f28 = cefeccd3 0738aebe
!	Mem[000000001d000100] = d79dfb1d 036ee0d9 66e88d69 679cc26d
	prefetch [%i2+0x100],3
!	Mem[000000001c800000] = 024b339c, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = 000000000000024b
	set	p3_b23,%o7
	fbo,a	p3_far_3_he	! Branch Taken, %fcc0 = 1

p3_label_20:
!	Mem[000000001d0001e0] = a3473351 3ed87c74 60f9433e 99481672
	prefetch [%i2+0x1e0],20
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x017,%g2
p3_b23:
!	Registers modified during the branch to p3_far_3
!	%l4  = 000000000001926a
!	%l5  = 0000000000019362
!	%l6  = 00000000000188bf
!	%l7  = 000000000000004e
	membar	#Sync			! Added by membar checker (569)
!	%l7 = 000000000000004e, immed = fffff04c, %y  = 00000000
	sdivx	%l7,-0xfb4,%l3		! %l3 = 0000000000000000
	fbug,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	 Annulled
	ldd	[%i3+0x100],%l4
p3_b24:
	membar	#Sync			! Added by membar checker (570)
!	Mem[000000001c800000] = 024b339c, %l4 = 000000000001926a
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000002

p3_label_21:
	set	p3_b25,%o7
	fble,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d800000] = e6c1d0ffe96ab8e1, %l1 = fffffffffffffef7
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = e6c1d0ffe96ab8e1
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x019,%g2
p3_b25:
!	Registers modified during the branch to p3_far_0
!	%l2  = fffffffffffff9e5
!	%l4  = 2000000000000000
!	%l6  = 00000000000188bf
!	%l7  = 000000007462e5c8
	membar	#Sync			! Added by membar checker (571)
!	%l6 = 00000000000188bf
	sethi	%hi(0x27dee800),%l6	! %l6 = 0000000027dee800
!	%f0  = 10472730 c6b76ccd, %f0  = 10472730 c6b76ccd, %f28 = cefeccd3 0738aebe
	fsubd	%f0 ,%f0 ,%f28		! %f28 = 00000000 00000000
!	%f23 = 502056f8, %f20 = 336c419b f201e277
	fstox	%f23,%f20		! %f20 = 00000002 815be000

p3_label_22:
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c00012a] = 02896272, %l5 = 0000000000019362
	ldstub	[%i0+0x12a],%l5		! Annulled
p3_b26:
	membar	#Sync			! Added by membar checker (572)
!	%l6 = 0000000027dee800, %l3 = 0000000000000000, %l7 = 000000007462e5c8
	tsubcc	%l6,%l3,%l7		! %l7 = 0000000027dee800, %ccr = 00
!	%l6 = 0000000027dee800, immed = 0000002f, %l3 = 0000000000000000
	sllx	%l6,0x02f,%l3		! %l3 = 7400000000000000
!	Mem[000000001d0001e0] = a3473351 3ed87c74 60f9433e 99481672
	prefetcha [%i2+0x1e0]%asi,2

p3_label_23:
!	%l5 = 0000000000019362, %l7 = 0000000027dee800, %l0 = ffffffffffffdb4f
	taddcc	%l5,%l7,%l0		! %l0 = 0000000027e07b62, %ccr = 02
	fbl,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001c800000] = 024b339ce94dc075, %l5 = 0000000000019362
	ldxa	[%i1+%g0]0x80,%l5	! Annulled
p3_b27:
	membar	#Sync			! Added by membar checker (573)
!	%f8  = baa1fac4 54fc1218, %f6  = 485f5d2c e6ed9167
	fcmped	%fcc0,%f8 ,%f6 		! %fcc0 = 1
!	Branch On Register, %l2 = fffffffffffff9e5
	brz,pt	%l2,p3_not_taken_0	! Branch Not Taken

p3_label_24:
!	Mem[0000000030000078] = ac9762c91c8219b2, %l0 = 0000000027e07b62
	ldx	[%o0+0x078],%l0		! %l0 = ac9762c91c8219b2
p3_b28:
	membar	#Sync			! Added by membar checker (574)
!	Mem[000000001c8000b8] = c00e3c8b, %l0 = ac9762c91c8219b2
	swap	[%i1+0x0b8],%l0		! %l0 = 00000000c00e3c8b
!	Mem[000000003200000c] = 7bd59c30, %l2 = fffffffffffff9e5
	lduh	[%o4+0x00e],%g2		! %g2 = 0000000000007bd5
!	Branch On Register, %l6 = 0000000027dee800
	brgez,pn %l6,p3_b29		! Branch Taken
!	Mem[000000001d000000] = 00000000, %l2 = fffffffffffff9e5
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x01d,%g2
p3_b29:

p3_label_25:
	membar	#Sync			! Added by membar checker (575)
	fbge,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800008] = 6b7c78a7, %l7 = 0000000027dee800
	ldsba	[%i3+%o6]0x80,%l7	! Annulled
p3_b30:
	membar	#Sync			! Added by membar checker (576)
!	%l5 = 0000000000019362, %l7 = 0000000027dee800, %l0 = 00000000c00e3c8b
	sra	%l5,%l7,%l0		! %l0 = 0000000000019362
	fbu,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	%l7 = 0000000027dee800, Mem[000000001d000008] = b4da1e8e
	stwa	%l7,[%i2+%o6]0x80	! Mem[000000001d000008] = 27dee800
p3_b31:

p3_label_26:
	membar	#Sync			! Added by membar checker (577)
!	%l7 = 0000000027dee800, %l7 = 0000000027dee800, %l1 = e6c1d0ffe96ab8e1
	and	%l7,%l7,%l1		! %l1 = 0000000027dee800
!	Mem[000000001c800020] = c7df62b8 d07b2ff3 aeab5dce 470dd645
	prefetch [%i1+0x020],4
!	%l2 = 0000000000000000, %l4 = 2000000000000000, %l0 = 0000000000019362
	orncc	%l2,%l4,%l0		! %l0 = dfffffffffffffff, %ccr = 88
	ba,a	p3_b32			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d800000] = e6c1d0ffe96ab8e1, %l1 = 0000000027dee800
	ldxa	[%i3+%g0]0x80,%l1	! Annulled
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x020,%g2
p3_b32:

p3_label_27:
	membar	#Sync			! Added by membar checker (578)
!	%f17 = 47df5d2c, %f16 = 0dd7cf05 47df5d2c
	fitod	%f17,%f16		! %f16 = 41d1f7d7 4b000000
!	Mem[000000001c8001dc] = 4e1580b8, %l7 = 0000000027dee800
	lduba	[%i1+0x1df]%asi,%l7	! %l7 = 00000000000000b8
!	Mem[000000001d800020] = a650cdfe 9cb0c86a 9994c1f9 e85bb661
	prefetch [%i3+0x020],2
	bvc	p3_b33			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d000060] = f7fd0ad9 77437177 b64b36de fed8af8b
	prefetch [%i2+0x060],3
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x021,%g2
p3_b33:

p3_label_28:
	membar	#Sync			! Added by membar checker (579)
	set	p3_b34,%o7
	fba,pt	%fcc0,p3_near_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d8000c0] = 78865005 cda6880f 9b90ad59 f6baa210
	prefetch [%i3+0x0c0],22
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x022,%g2
p3_b34:
!	Registers modified during the branch to p3_near_3
!	%l2  = dfffffffffffffff
!	%l3  = 740000000000008d
!	%l5  = dfffffffffffffff
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (580)
!	Mem[0000000032000064] = 5b600007, %l2 = dfffffffffffffff
	ldswa	[%o4+0x064]%asi,%g2	! %g2 = dfffffffffffffff
!	Mem[000000003080003c] = a19977c9, %l7 = 00000000000000b8
	ldsw	[%o1+0x03c],%l7		! %l7 = ffffffffa19977c9
!	%l0 = dfffffffffffffff, %l4 = 2000000000000000, %l4 = 2000000000000000
	addc	%l0,%l4,%l4		! %l4 = ffffffffffffffff

p3_label_29:
!	%f28 = 00000000 00000000, %f26 = 32d6549d 4e523906, %f22 = 625c8c02 502056f8
	fsubd	%f28,%f26,%f22		! %f22 = b2d6549d 4e523906
	bg,a	p3_b35			! Branch Taken, %ccr = 00, CWP = 0
!	%l2 = dfffffffffffffff, Mem[000000001c800008] = fff97298
	stha	%l2,[%i1+%o6]0x80	! Mem[000000001c800008] = ffff7298
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x023,%g2
p3_b35:
	set	p3_b36,%o7
	fbo	p3_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001f000068] = 9da5adce 84e2b187, %l4 = ffffffff, %l5 = ffffffff
	ldd	[%i6+0x068],%l4		! %l4 = 000000009da5adce 0000000084e2b187
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x024,%g2
p3_b36:
!	Registers modified during the branch to p3_far_0
!	%l2  = 0000000060fd5cbf
!	%l3  = 0000000000000002
!	%l4  = dfffffffffffffff

p3_label_30:
	membar	#Sync			! Added by membar checker (581)
!	%f16 = 41d1f7d7 4b000000, %f14 = 32d6549d 4e523906
	fdtox	%f16,%f14		! %f14 = 00000000 47df5d2c
!	Mem[000000001c8000a0] = 793434e0 9a75debf ffc8c618 a117c5ab
	prefetch [%i1+0x0a0],16
	bneg	p3_b37			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d800184] = 5ba1cfc1, %l1 = 0000000027dee800
	ldsb	[%i3+0x185],%l1		! %l1 = ffffffffffffffa1
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x025,%g2
p3_b37:
	membar	#Sync			! Added by membar checker (582)
!	%l2 = 0000000060fd5cbf, immed = 00000031, %l1 = ffffffffffffffa1
	srlx	%l2,0x031,%l1		! %l1 = 0000000000000000

p3_label_31:
!	Mem[000000003080003c] = a19977c9, %l6 = 0000000000000000
	ldsha	[%o1+0x03c]%asi,%l6	! %l6 = ffffffffffffa199
	set	p3_b38,%o7
	fbo,pn	%fcc1,p3_near_3_le	! Branch Taken, %fcc1 = 1
!	Mem[000000001d800000] = e6c1d0ff, %l2 = 0000000060fd5cbf
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffe6
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x026,%g2
p3_b38:
!	Registers modified during the branch to p3_near_3
!	%l0  = 0000000084e2b187
!	%l4  = e000000000005e66
	ba,a	p3_b39			! Branch Taken, %ccr = 90, CWP = 0
!	Mem[0000000030000034] = bffa428c, %l7 = ffffffffa19977c9
	ldsw	[%o0+0x034],%l7		! Annulled
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x027,%g2
p3_b39:

p3_label_32:
	membar	#Sync			! Added by membar checker (583)
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetcha [%o4+0x020]%asi,0
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003080003c] = a19977c9, %l6 = ffffffffffffa199
	swap	[%o1+0x03c],%l6		! %l6 = 00000000a19977c9
p3_b40:
	membar	#Sync			! Added by membar checker (584)
!	%f1  = c6b76ccd, %f23 = 4e523906
	fcmpes	%fcc3,%f1 ,%f23		! %fcc3 = 1
!	%f22 = b2d6549d 4e523906, %f18 = ffffffbc 7b850000, %f24 = ffffffbc 7b850000
	fdivd	%f22,%f18,%f24		! %f24 = ffffffbc 7b850000

p3_label_33:
!	%l6 = 00000000a19977c9, immed = fffff0e1, %l3 = 0000000000000002
	subccc	%l6,-0xf1f,%l3		! %l3 = 00000000a19986e8, %ccr = 19
!	%l7 = ffffffffa19977c9, Mem[0000000031800038] = 68ce143b
	sth	%l7,[%o3+0x038]		! Mem[0000000031800038] = 77c9143b
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l6 = a19977c9, %l7 = a19977c9, Mem[000000001c000000] = 0000fe85 bac72d84
	stda	%l6,[%i0+%g0]0x80	! Mem[000000001c000000] = a19977c9 a19977c9
p3_b41:
	membar	#Sync			! Added by membar checker (585)
!	%f28 = 00000000 00000000, %f4  = 9d08d82d 578c59a0, %f16 = 41d1f7d7 4b000000
	fdivd	%f28,%f4 ,%f16		! %f16 = 80000000 00000000

p3_label_34:
!	%f14 = 00000000 47df5d2c, %f22 = b2d6549d 4e523906
	fmovd	%f14,%f22		! %f22 = 00000000 47df5d2c
!	Mem[000000001c000040] = f8058409 47a0f7ea a7f02197 8f6342de
	prefetch [%i0+0x040],4
	fbge,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[000000001d800008] = 6b7c78a7, %l3 = 00000000a19986e8
	ldstuba	[%i3+%o6]0x80,%l3	! %l3 = 000000000000006b
p3_b42:
	membar	#Sync			! Added by membar checker (586)
!	Mem[0000000030000030] = 6528a9f5, %l4 = e000000000005e66
	swap	[%o0+0x030],%l4		! %l4 = 000000006528a9f5

p3_label_35:
!	call to call_1, CWP = 0
	call	p3_call_1_he
!	Mem[000000001d000160] = 9d357ee1 294bc33c 8af41495 cfc57e71
	prefetch [%i2+0x160],2
!	Registers modified during the branch to p3_call_1
!	%l0  = 000000000014a020
!	%l1  = fffffffffff58fa3
!	%l2  = 0000000000149945
!	%l3  = 00194a2a7d400000
!	%l7  = 000000000014aca5
	fbuge,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[000000001d800000] = e6c1d0ff, %l6 = 00000000a19977c9
	lduba	[%i3+%g0]0x80,%l6	! Annulled
p3_b43:
	membar	#Sync			! Added by membar checker (587)
!	%l7 = 000000000014aca5, Mem[000000003080003c] = ffffa199
	stwa	%l7,[%o1+0x03c]%asi	! Mem[000000003080003c] = 0014aca5

p3_label_36:
!	Branch On Register, %l6 = 00000000a19977c9
	brgez,a,pt %l6,p3_b44		! Branch Taken
!	Mem[000000001d800000] = e6c1d0ff, %l5 = 0000000084e2b187
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = ffffffffe6c1d0ff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x02c,%g2
p3_b44:
	membar	#Sync			! Added by membar checker (588)
!	Mem[000000001d800128] = 15f2df8c, %l6 = 00000000a19977c9
	lduw	[%i3+0x128],%l6		! %l6 = 0000000015f2df8c
!	Mem[000000001d000058] = 50936daa f72a472b, %l4 = 6528a9f5, %l5 = e6c1d0ff
	ldd	[%i2+0x058],%l4		! %l4 = 0000000050936daa 00000000f72a472b
!	%l3 = 00194a2a7d400000, %l4 = 0000000050936daa, %y  = 00000000
	umul	%l3,%l4,%l7		! %l7 = 276c21676c800000

p3_label_37:
	set	p3_b45,%o7
	fbne,a,pt %fcc3,p3_near_0_he	! Branch Taken, %fcc3 = 1
!	Mem[000000001d0001c0] = 429b4f91 bebfee30 f9b375ad b016f26c
	prefetch [%i2+0x1c0],16
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x02d,%g2
p3_b45:
!	Registers modified during the branch to p3_near_0
!	%l0  = 00000000ffffffff
	fbue,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = 50936daa, %l5 = f72a472b, Mem[0000000032000060] = d7521c0a 5b600007
	std	%l4,[%o4+0x060]	! Annulled
p3_b46:
	membar	#Sync			! Added by membar checker (589)
!	%l3 = 00194a2a7d400000, %l2 = 0000000000149945, %l3 = 00194a2a7d400000
	xnorcc	%l3,%l2,%l3		! %l3 = ffe6b5d582ab66ba, %ccr = 88

p3_label_38:
!	%f4  = 9d08d82d 578c59a0, %f14 = 00000000 47df5d2c
	fabsd	%f4 ,%f14		! %f14 = 1d08d82d 578c59a0
!	%l0 = 00000000ffffffff, immed = fffff507, %l7 = 276c21676c800000
	andn	%l0,-0xaf9,%l7		! %l7 = 0000000000000af8
!	Mem[000000001d000000] = 0000000002b9576d, %l0 = 00000000ffffffff
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 0000000002b9576d
!	%l7 = 0000000000000af8, immed = fffff878, %l3 = ffe6b5d582ab66ba
	subc	%l7,-0x788,%l3		! %l3 = 0000000000001280
!	%f22 = 00000000, %f28 = 00000000 00000000
	fstox	%f22,%f28		! %f28 = 00000000 00000000

p3_label_39:
!	%f22 = 00000000, %f5  = 578c59a0, %f9  = 54fc1218
	fsubs	%f22,%f5 ,%f9 		! %f9  = d78c59a0
!	%l1 = fffffffffff58fa3, immed = fffff143, %l0 = 0000000002b9576d
	xorcc	%l1,-0xebd,%l0		! %l0 = 00000000000a7ee0, %ccr = 00
!	%l3 = 0000000000001280, %l3 = 0000000000001280, %l3 = 0000000000001280
	orn	%l3,%l3,%l3		! %l3 = ffffffffffffffff
!	%l2 = 0000000000149945, Mem[0000000032000014] = a121acca
	stwa	%l2,[%o4+0x014]%asi	! Mem[0000000032000014] = 00149945
!	%l6 = 0000000015f2df8c, %l3 = ffffffffffffffff, %y  = 276c2167
	smulcc	%l6,%l3,%l5		! %l5 = ffffffffea0d2074, %ccr = 88

p3_label_40:
!	Mem[000000001c800000] = 024b339c, %l2 = 0000000000149945
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000002
!	%l4 = 0000000050936daa
	setx	0x7682b1367682b136,%g7,%l4 ! %l4 = 7682b1367682b136
	bl	p3_b47			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001d0001a4] = 0d544c3f, %l2 = 0000000000000002
	lduw	[%i2+0x1a4],%l2		! %l2 = 000000000d544c3f
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x02f,%g2
p3_b47:
	membar	#Sync			! Added by membar checker (590)
!	%l7 = 0000000000000af8, immed = fffff6f2, %y  = ffffffff
	sdiv	%l7,-0x90e,%l4		! %l4 = 00000000001c45cb

p3_label_41:
!	%f2  = 1e5feb1f, %f22 = 00000000, %f24 = ffffffbc
	fmuls	%f2 ,%f22,%f24		! %f24 = 00000000
!	%l2 = 000000000d544c3f, immed = fffff794, %l3 = ffffffffffffffff
	subc	%l2,-0x86c,%l3		! %l3 = 000000000d5454ab
!	%l5 = ffffffffea0d2074, %l5 = ffffffffea0d2074, %l6 = 0000000015f2df8c
	add	%l5,%l5,%l6		! %l6 = ffffffffd41a40e8
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l1 = fffffffffff58fa3, Mem[000000001d80018c] = 44fcbdae
	sth	%l1,[%i3+0x18c]		! Annulled
p3_b48:

p3_label_42:
	membar	#Sync			! Added by membar checker (591)
!	%l0 = 00000000000a7ee0, immed = 00000fec, %l4 = 00000000001c45cb
	addccc	%l0,0xfec,%l4		! %l4 = 00000000000a8ecc, %ccr = 00
!	Mem[000000001d800060] = 61bbb40a 43497fa6 e4d6a865 789a3e7f
	prefetch [%i3+0x060],4
!	Mem[000000001d000040] = 20e90910 31d0aad2 f5d32dc0 08e346aa
	prefetcha [%i2+0x040]%asi,23
	set	p3_b49,%o7
	fblg,a,pn %fcc3,p3_near_3_le	! Branch Taken, %fcc3 = 1
!	%l5 = ffffffffea0d2074, Mem[0000000031000074] = daf97d69
	stb	%l5,[%o2+0x074]		! Mem[0000000031000074] = 74f97d69
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x031,%g2
p3_b49:
!	Registers modified during the branch to p3_near_3
!	%l0  = ffffffffea0d2074
!	%l4  = 000000002bf03df8

p3_label_43:
	membar	#Sync			! Added by membar checker (592)
!	%l7 = 0000000000000af8, %l2 = 000000000d544c3f, %l0 = ffffffffea0d2074
	and	%l7,%l2,%l0		! %l0 = 0000000000000838
!	Mem[000000001d0001cc] = b016f26c, %l6 = ffffffffd41a40e8
	ldstuba	[%i2+0x1cc]%asi,%l6	! %l6 = 00000000000000b0
!	%l5 = ffffffffea0d2074, immed = 0000001b, %l2 = 000000000d544c3f
	sllx	%l5,0x01b,%l2		! %l2 = ff506903a0000000
!	%f9  = d78c59a0, %f1  = c6b76ccd
	fmovs	%f9 ,%f1 		! %f1  = d78c59a0
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 11

p3_label_44:
!	Mem[000000001c80003b] = 27f832ae, %l2 = ff506903a0000000
	ldstub	[%i1+0x03b],%l2		! Annulled
p3_b50:
	membar	#Sync			! Added by membar checker (593)
!	Mem[000000001d800008] = ff7c78a7, %l6 = 00000000000000b0
	lduha	[%i3+%o6]0x80,%l6	! %l6 = 000000000000ff7c
!	%l7 = 0000000000000af8, %l0 = 0000000000000838, %y  = ffffffff
	smulcc	%l7,%l0,%l6		! %l6 = 00000000005a2640, %ccr = 00
	bne,a	p3_b51			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000048] = 8e1c8c7e, %l7 = 0000000000000af8
	ldsb	[%o4+0x048],%g2		! %g2 = ffffffffffffff8e
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x033,%g2
p3_b51:

p3_label_45:
	membar	#Sync			! Added by membar checker (594)
!	Mem[000000001d000008] = 27dee800, %l0 = 0000000000000838
	ldsba	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000027
!	%l2 = ff506903a0000000, Mem[0000000031800030] = 783e45e3
	stwa	%l2,[%o3+0x030]%asi	! Mem[0000000031800030] = a0000000
!	%l5 = ffffffffea0d2074, immed = ffffffe8, %l6 = 00000000005a2640
	and	%l5,-0x018,%l6		! %l6 = ffffffffea0d2060
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[000000001c80002c] = 470dd645, %l5 = ea0d2074, %l4 = 2bf03df8
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000470dd645

p3_label_46:
!	Mem[000000001c000008] = db4f11ba, %l2 = ff506903a0000000
	ldsha	[%i0+%o6]0x80,%l2	! %l2 = ffffffffffffdb4f
!	Mem[000000001c800008] = ffff7298, %l1 = fffffffffff58fa3
	ldstuba	[%i1+%o6]0x80,%l1	! %l1 = 00000000000000ff
!	%f10 = 336c419b f201e277, %f0  = 10472730 d78c59a0
	fcmped	%fcc3,%f10,%f0 		! %fcc3 = 2
!	%l7 = 0000000000000af8, %l4 = 00000000470dd645, %l1 = 00000000000000ff
	addcc	%l7,%l4,%l1		! %l1 = 00000000470de13d, %ccr = 00
!	Mem[000000001d800000] = e6c1d0ff, %l5 = ffffffffea0d2074
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000e6c1d0ff

p3_label_47:
!	%f17 = 00000000, %f26 = 32d6549d, %f20 = 00000002 815be000
	nop
!	%f24 = 00000000, %f7  = e6ed9167, %f17 = 00000000
	fdivs	%f24,%f7 ,%f17		! %f17 = 80000000
!	%l2 = ffffffffffffdb4f, %l7 = 0000000000000af8, %l6 = ffffffffea0d2060
	and	%l2,%l7,%l6		! %l6 = 0000000000000a48
!	Mem[0000000031800030] = 00000000 000000cd, %l1 = 00000000470de13d, %l6 = 0000000000000a48
	add	%o3,0x30,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = a0000000e5645d4e
!	%l6 = a0000000e5645d4e, immed = fffff486, %l0 = 0000000000000027
	subccc	%l6,-0xb7a,%l0		! %l0 = a0000000e56468c8, %ccr = 99

p3_label_48:
!	Mem[0000000032000068] = c83f5640 d915231a, %l2 = ffffdb4f, %l3 = 0d5454ab
	ldda	[%o4+0x068]%asi,%g2	! %l2 = ffffffffffffdb4f 000000000d5454ab
!	%l0 = a0000000e56468c8, Mem[000000004000003c] = 1a273f08
	stwa	%l0,[%o5+0x03c]%asi	! Mem[000000004000003c] = e56468c8
!	Mem[000000001c80000c] = edc304d3, %l4 = 00000000470dd645
	ldub	[%i1+0x00f],%l4		! %l4 = 00000000000000d3
	set	p3_b52,%o7
	fbo,a,pn %fcc2,p3_near_2_le	! Branch Taken, %fcc2 = 1
!	Mem[000000001c000008] = db4f11ba, %l3 = 000000000d5454ab
	ldstuba	[%i0+%o6]0x80,%l3	! %l3 = 00000000000000db
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x034,%g2
p3_b52:
!	Registers modified during the branch to p3_near_2
!	%l2  = 0000000000000066
!	%l3  = 000000007462e5c8

p3_label_49:
	set	p3_b53,%o7
	fbul,a	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c800140] = 903e9098c9ccac99, %l6 = a0000000e5645d4e
	ldx	[%i1+0x140],%l6		! %l6 = 903e9098c9ccac99
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x035,%g2
p3_b53:
!	Registers modified during the branch to p3_far_3
!	%l4  = 6fc16f67713edc71
!	%l5  = 903e9098c9ccc2b3
!	%l6  = 903e9098c9ccb810
!	%l7  = 000000000000004e
	bleu,a	p3_b54			! Branch Taken, %ccr = 99, CWP = 0
!	%l1 = 00000000470de13d, Mem[000000001d800008] = ff7c78a7
	stwa	%l1,[%i3+%o6]0x80	! Mem[000000001d800008] = 470de13d
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x036,%g2
p3_b54:
	membar	#Sync			! Added by membar checker (595)
!	%l6 = 903e9098c9ccb810, %l7 = 000000000000004e, %l0 = a0000000e56468c8
	subccc	%l6,%l7,%l0		! %l0 = 903e9098c9ccb7c1, %ccr = 88

p3_label_50:
!	call to call_2, CWP = 0
	call	p3_call_2_he
!	Mem[000000001d000000] = 00000000, %l5 = 903e9098c9ccc2b3
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Registers modified during the branch to p3_call_2
!	%l1  = 00000000746004c0
!	%l3  = 00000000ffffffff
!	%l6  = ffffffef7c6014e0
!	%l7  = fffffffffffe085a
!	%l3 = 00000000ffffffff, %l0 = 903e9098c9ccb7c1, %y  = ffffffff
	udiv	%l3,%l0,%l1		! %l1 = 00000000ffffffff
!	%f6  = 485f5d2c e6ed9167, %f6  = 485f5d2c e6ed9167
	fmovd	%f6 ,%f6 		! %f6  = 485f5d2c e6ed9167
	set	p3_b55,%o7
	fbl	p3_far_1_le	! Branch Taken, %fcc0 = 1

p3_label_51:
!	%l0 = 903e9098c9ccb7c1, Mem[000000003180007c] = 04706b00
	sth	%l0,[%o3+0x07c]		! Mem[000000003180007c] = b7c16b00
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x037,%g2
p3_b55:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 005272ac31c178e3
!	%l4  = 00000000000000ff
!	%l5  = 0000000000000000
!	call to call_1, CWP = 0
	call	p3_call_1_he
!	Mem[000000001c800008] = ffff7298, %l6 = ffffffef7c6014e0
	lduba	[%i1+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	Registers modified during the branch to p3_call_1
!	%l0  = ffffffffffdf3100
!	%l1  = 0000000000000000
!	%l2  = ffffffffffdf2a25
!	%l3  = 000000003fc00000
!	%l7  = ffffffffffdf3f96
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[000000001c000138] = a257f0f988bd8e74, %l4 = 00000000000000ff
	ldx	[%i0+0x138],%l4		! Annulled
p3_b56:

p3_label_52:
	membar	#Sync			! Added by membar checker (596)
	fble,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001d800008] = 470de13d f0d6e278, %l2 = ffdf2a25, %l3 = 3fc00000
	ldda	[%i3+%o6]0x80,%l2	! %l2 = 00000000470de13d 00000000f0d6e278
p3_b57:
	membar	#Sync			! Added by membar checker (597)
	fbn,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l6 = 00000000000000ff, Mem[0000000031800032] = a0000000
	sth	%l6,[%o3+0x032]		! Annulled
p3_b58:
	membar	#Sync			! Added by membar checker (598)
!	%f27 = 4e523906, %f6  = 485f5d2c e6ed9167
	fstox	%f27,%f6 		! %f6  = 00000000 348e4180

p3_label_53:
!	%f4  = 9d08d82d 578c59a0, %f14 = 1d08d82d 578c59a0
	fabsd	%f4 ,%f14		! %f14 = 1d08d82d 578c59a0
	bcc,a	p3_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[000000003080003c] = 0014aca5, %l7 = ffffffffffdf3f96
	ldsh	[%o1+0x03c],%l7		! Annulled
p3_b59:
	membar	#Sync			! Added by membar checker (599)
!	Mem[000000001c000100] = 496cfc2a 997e4785 6088da26 b12b8a94
	prefetch [%i0+0x100],22
!	Mem[000000001c800000] = ff4b339c, %l0 = ffffffffffdf3100
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 000000000000ff4b

p3_label_54:
!	%l1 = 0000000000000000, %l3 = 00000000f0d6e278, %y  = ffffffff
	smul	%l1,%l3,%l7		! %l7 = 0000000000000000
!	Mem[000000001c8000a0] = 793434e0 9a75debf ffc8c618 a117c5ab
	prefetcha [%i1+0x0a0]%asi,0
	set	p3_b60,%o7
	fbne	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c0000a0] = 15cb2b61, %l5 = 0000000000000000
	lduh	[%i0+0x0a0],%l5		! %l5 = 00000000000015cb
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x03c,%g2
p3_b60:
!	Registers modified during the branch to p3_far_3
!	%l4  = ffffffffffffe8e6
!	%l5  = 0000000000001719
!	%l6  = 0000000000000c76
!	%l7  = 000000000000004e
	membar	#Sync			! Added by membar checker (600)
!	Mem[000000001d000000] = 00000000, %l3 = 00000000f0d6e278
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000

p3_label_55:
!	%l6 = 0000000000000c76, immed = fffff742, %l3 = 0000000000000000
	andncc	%l6,-0x8be,%l3		! %l3 = 0000000000000834, %ccr = 00
!	%l0 = 000000000000ff4b, %l4 = ffffffffffffe8e6, %l1 = 0000000000000000
	add	%l0,%l4,%l1		! %l1 = 000000000000e831
!	Mem[0000000031000078] = fba92fe7 00000000, %l2 = 470de13d, %l3 = 00000834
	ldd	[%o2+0x078],%l2		! %l2 = 00000000fba92fe7 0000000000000000
!	%l5 = 0000000000001719, %l5 = 0000000000001719, %l2 = 00000000fba92fe7
	orncc	%l5,%l5,%l2		! %l2 = ffffffffffffffff, %ccr = 88
!	call to call_3, CWP = 0
	call	p3_call_3_he

p3_label_56:
!	%l2 = ffffffffffffffff, Mem[000000001d000000] = 0000000002b9576d
	stxa	%l2,[%i2+%g0]0x80	! Mem[000000001d000000] = ffffffffffffffff
!	Registers modified during the branch to p3_call_3
!	%l1  = 000000000000085f
!	%l7  = 0000000000479fc1
	bgu,a	p3_b61			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000003080007c] = 7d99a2de, %l2 = ffffffffffffffff
	ldsb	[%o1+0x07f],%l2		! %l2 = ffffffffffffffde
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x03d,%g2
p3_b61:
	bgu,a	p3_b62			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d0001c0] = 429b4f91 bebfee30 f9b375ad ff16f26c
	prefetch [%i2+0x1c0],3
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x03e,%g2
p3_b62:

p3_label_57:
	membar	#Sync			! Added by membar checker (601)
!	%l7 = 0000000000479fc1, %l1 = 000000000000085f, %y  = 00000000
	smul	%l7,%l1,%l3		! %l3 = 000000025792509f
!	%l4 = ffffffffffffe8e6, Mem[0000000030800032] = 7462e5c8
	stha	%l4,[%o1+0x032]%asi	! Mem[0000000030800030] = 7462e8e6
!	Mem[000000001c800174] = 3850faab, %l2 = ffffffffffffffde
	ldstub	[%i1+0x174],%l2		! %l2 = 0000000000000038
!	Mem[0000000031000072] = fd5048ae, %l2 = 0000000000000038
	ldstub	[%o2+0x072],%l2		! %l2 = 0000000000000048
	fbue,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_58:
!	%l1 = 000000000000085f, Mem[000000001c000008] = ff4f11ba
	stha	%l1,[%i0+%o6]0x80	! Annulled
p3_b63:
	membar	#Sync			! Added by membar checker (602)
!	%l3 = 000000025792509f, immed = 0000001d, %l1 = 000000000000085f
	sllx	%l3,0x01d,%l1		! %l1 = 4af24a13e0000000
!	Mem[0000000031000034] = fe855d0b, %l3 = 5792509f, %l7 = 00479fc1
	add	%o2,0x34,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000fe855d0b
!	Mem[000000001c800120] = 0882d825 49982bef b652709c 65c7a76c
	prefetch [%i1+0x120],20
!	Mem[000000001c8000e0] = 2dd3e595 dd397735 674729cf eb1af436
	prefetch [%i1+0x0e0],22

p3_label_59:
!	%f12 = 336c419b, %f8  = baa1fac4
	fcmpes	%fcc2,%f12,%f8 		! %fcc2 = 2
!	Mem[000000001c0000b9] = c40b943d, %l6 = 0000000000000c76
	ldstuba	[%i0+0x0b9]%asi,%l6	! %l6 = 000000000000000b
!	Mem[000000001c0000e0] = 34f4f8af 956d3025 0d0fb5c9 75bf7e96
	prefetcha [%i0+0x0e0]%asi,20
!	%l4 = ffffffffffffe8e6, immed = fffff451, %y  = 00000002
	sdivcc	%l4,-0xbaf,%l6		! %l6 = ffffffffffbe4450, %ccr = 88
	fbule,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2

p3_label_60:
!	%l4 = ffffffffffffe8e6, Mem[000000001c8001c2] = ebbc101d
	stb	%l4,[%i1+0x1c2]		! Annulled
p3_b64:
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l6 = ffffffffffbe4450, Mem[000000001d000008] = 27dee800
	stba	%l6,[%i2+%o6]0x80	! Mem[000000001d000008] = 50dee800
p3_b65:
	membar	#Sync			! Added by membar checker (603)
!	Mem[000000001c8000fc] = 6082c398, %l2 = 0000000000000048
	swap	[%i1+0x0fc],%l2		! %l2 = 000000006082c398
!	Mem[000000003000003c] = 68b2a857, %l6 = ffffffffffbe4450
	lduwa	[%o0+0x03c]%asi,%l6	! %l6 = 0000000068b2a857

p3_label_61:
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c000008] = ff4f11ba, %l2 = 000000006082c398
	lduwa	[%i0+%o6]0x80,%l2	! %l2 = 00000000ff4f11ba
p3_b66:
	membar	#Sync			! Added by membar checker (604)
!	%l4 = ffffffffffffe8e6, %l6 = 0000000068b2a857, %l1 = 4af24a13e0000000
	andcc	%l4,%l6,%l1		! %l1 = 0000000068b2a846, %ccr = 00
	set	p3_b67,%o7
	fbule,a	p3_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d000008] = 50dee800, %l3 = 000000025792509f
	ldstuba	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000050
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x043,%g2
p3_b67:
!	Registers modified during the branch to p3_far_1
!	%l1  = ffffffff974d40a0
!	%l3  = fffffffff31f2172

p3_label_62:
	membar	#Sync			! Added by membar checker (605)
!	%l4 = ffffffffffffe8e6, %l6 = 0000000068b2a857, %y  = ffffffff
	smul	%l4,%l6,%l2		! %l2 = fffff68d50bb162a
!	Mem[000000001c0001a0] = 38ad7304 7b152270
	flush	%i0+0x1a0
!	%f12 = 336c419b f201e277, %f2  = 1e5feb1f fe49fc2e
	fcmped	%fcc2,%f12,%f2 		! %fcc2 = 2
!	%l4 = ffffffffffffe8e6, immed = 00000646, %l7 = 00000000fe855d0b
	orncc	%l4,0x646,%l7		! %l7 = fffffffffffff9ff, %ccr = 88
!	Branch On Register, %l4 = ffffffffffffe8e6
	brlz,a,pt %l4,p3_b68		! Branch Taken

p3_label_63:
!	%l2 = fffff68d50bb162a, Mem[000000003000003c] = 68b2a857
	stw	%l2,[%o0+0x03c]		! Mem[000000003000003c] = 50bb162a
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x044,%g2
p3_b68:
	membar	#Sync			! Added by membar checker (606)
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],3
	set	p3_b69,%o7
	fblg,pt	%fcc2,p3_near_0_he	! Branch Taken, %fcc2 = 2
!	%l2 = fffff68d50bb162a, Mem[000000001d00004c] = 08e346aa
	stw	%l2,[%i2+0x04c]		! Mem[000000001d00004c] = 50bb162a
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x045,%g2
p3_b69:
!	Registers modified during the branch to p3_near_0
!	%l0  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (607)
!	Mem[000000001c800060] = 444024da 15ba2b2b 10757125 902e96f2
	prefetcha [%i1+0x060]%asi,16

p3_label_64:
!	%f8  = baa1fac4 d78c59a0, %f0  = 10472730 d78c59a0
	fnegd	%f8 ,%f0 		! %f0  = 3aa1fac4 d78c59a0
	fbug	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800000] = ea0d2074e96ab8e1, %l7 = fffffffffffff9ff
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = ea0d2074e96ab8e1
p3_b70:
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 50bb162a, %l3 = f31f2172, Mem[000000001c800000] = ff4b339c e94dc075
	stda	%l2,[%i1+%g0]0x80	! Mem[000000001c800000] = 50bb162a f31f2172
p3_b71:

p3_label_65:
	membar	#Sync			! Added by membar checker (608)
!	%f28 = 00000000 00000000, %f12 = 336c419b f201e277, %f12 = 336c419b f201e277
	fdivd	%f28,%f12,%f12		! %f12 = 00000000 00000000
	set	p3_b72,%o7
	fblg,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	%l4 = ffffe8e6, %l5 = 00001719, Mem[000000001c000008] = ff4f11ba 645fbaa2
	stda	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = ffffe8e6 00001719
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x048,%g2
p3_b72:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 00bcdd535db1cc4a
!	%l4  = 00000000000000ff
!	%l5  = 0000000000000000
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001f000014] = a62f38e5, %l1 = ffffffff974d40a0
	ldsh	[%i6+0x016],%l1		! %l1 = 00000000000038e5
p3_b73:

p3_label_66:
	membar	#Sync			! Added by membar checker (609)
!	%l1 = 00000000000038e5, immed = 000009bb, %l4 = 00000000000000ff
	andn	%l1,0x9bb,%l4		! %l4 = 0000000000003044
!	%f18 = ffffffbc 7b850000, %f18 = ffffffbc 7b850000
	fxtod	%f18,%f18		! %f18 = c250e11e c0000000
	bgu	p3_b74			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[000000001c000000] = a19977c9, %l1 = 00000000000038e5
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 000000000000a199
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x04a,%g2
p3_b74:
	membar	#Sync			! Added by membar checker (610)
!	%l6 = 0000000068b2a857, immed = fffffb3e, %l0 = ffffffffffffffe7
	sub	%l6,-0x4c2,%l0		! %l0 = 0000000068b2ad19

p3_label_67:
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetcha [%o4+0x060]%asi,21
	fbue,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d000008] = ffdee8005d1e7f23, %l0 = 0000000068b2ad19
	ldxa	[%i2+%o6]0x80,%l0	! %l0 = ffdee8005d1e7f23
p3_b75:
	membar	#Sync			! Added by membar checker (611)
!	%l2 = fffff68d50bb162a, Mem[000000001e800000] = 6d8aed1f
	stwa	%l2,[%i5+%g0]0x80	! Mem[000000001e800000] = 50bb162a
!	Mem[000000001d0000c0] = 3bc9ab91 8d5c4222 d6d4742b c317ab58
	prefetcha [%i2+0x0c0]%asi,22

p3_label_68:
!	Branch On Register, %l2 = fffff68d50bb162a
	brlez,pn %l2,p3_b76		! Branch Taken
!	Mem[000000001c0001ac] = 6078e511, %l7 = ea0d2074e96ab8e1
	ldstub	[%i0+0x1ac],%l7		! %l7 = 0000000000000060
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x04c,%g2
p3_b76:
	bneg,a	p3_b77			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[000000003080007c] = 7d99a2de, %l1 = 000000000000a199
	lduh	[%o1+0x07c],%l1		! %l1 = 0000000000007d99
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x04d,%g2
p3_b77:
	membar	#Sync			! Added by membar checker (612)
!	%f8  = baa1fac4 d78c59a0, %f24 = 00000000 7b850000
	fabsd	%f8 ,%f24		! %f24 = 3aa1fac4 d78c59a0

p3_label_69:
!	%l5 = 0000000000000000, immed = 000000dc, %l0 = ffdee8005d1e7f23
	orn	%l5,0x0dc,%l0		! %l0 = ffffffffffffff23
!	%f8  = baa1fac4 d78c59a0, %f12 = 00000000 00000000, %f0  = 3aa1fac4 d78c59a0
	fmuld	%f8 ,%f12,%f0 		! %f0  = 80000000 00000000
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c000100] = 496cfc2a 997e4785 6088da26 b12b8a94
	prefetch [%i0+0x100],3	! Annulled
p3_b78:
	membar	#Sync			! Added by membar checker (613)
!	%l2 = fffff68d50bb162a, immed = 0000091f, %y  = fffff68d
	sdivx	%l2,0x91f,%l5		! %l5 = fffffffef6d33d30

p3_label_70:
	fbu,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c80004c] = 98003416, %l3 = 00bcdd535db1cc4a
	lduw	[%i1+0x04c],%l3		! Annulled
p3_b79:
	bg	p3_b80			! Branch Taken, %ccr = 0a, CWP = 0
!	%l5 = fffffffef6d33d30, Mem[000000001d000000] = ffffffffffffffff
	stxa	%l5,[%i2+%g0]0x80	! Mem[000000001d000000] = fffffffef6d33d30
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x050,%g2
p3_b80:
	membar	#Sync			! Added by membar checker (614)
!	%f28 = 00000000 00000000, %f4  = 9d08d82d 578c59a0, %f10 = 336c419b f201e277
	faddd	%f28,%f4 ,%f10		! %f10 = 9d08d82d 578c59a0

p3_label_71:
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d000000] = fffffffe, %l3 = 00bcdd535db1cc4a
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffffff
p3_b81:
	membar	#Sync			! Added by membar checker (615)
!	%f14 = 1d08d82d 578c59a0, %f28 = 00000000 00000000, %f2  = 1e5feb1f fe49fc2e
	fmuld	%f14,%f28,%f2 		! %f2  = 00000000 00000000
!	%l7 = 0000000000000060, %l6 = 0000000068b2a857, %l4 = 0000000000003044
	orn	%l7,%l6,%l4		! %l4 = ffffffff974d57e8
!	%l3 = ffffffffffffffff, immed = 00000c31, %y  = fffff68d
	smul	%l3,0xc31,%l4		! %l4 = fffffffffffff3cf

p3_label_72:
!	Mem[000000003180003c] = 9f17960c, %l1 = 0000000000007d99
	swapa	[%o3+0x03c]%asi,%l1	! %l1 = 000000009f17960c
	bvc	p3_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[000000001d000000] = fffffffe, %l6 = 0000000068b2a857
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff
p3_b82:
	membar	#Sync			! Added by membar checker (616)
!	Mem[000000001c800000] = 50bb162a, %l0 = ffffffffffffff23
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000050
	set	p3_b83,%o7
	fbl,a	p3_far_0_le	! Branch Taken, %fcc0 = 1

p3_label_73:
!	Mem[000000001c000000] = a19977c9, %l5 = fffffffef6d33d30
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffa199
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x053,%g2
p3_b83:
!	Registers modified during the branch to p3_far_0
!	%l2  = 0000000060fd5cbf
!	%l3  = 0000000000000009
!	%l4  = ffffffffffffffbf
	set	p3_b84,%o7
	fbule	p3_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000031800070] = 00efd10d7add54fd, %l5 = ffffffffffffa199
	ldx	[%o3+0x070],%l5		! %l5 = 00efd10d7add54fd
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x054,%g2
p3_b84:
	membar	#Sync			! Added by membar checker (617)
!	%l4 = ffffffffffffffbf, %l1 = 000000009f17960c, %y  = ffffffff
	sdivx	%l4,%l1,%l5		! %l5 = 0000000000000000
!	Branch On Register, %l5 = 0000000000000000
	brnz,a,pn %l5,p3_not_taken_0	! Branch Not Taken

p3_label_74:
!	Mem[000000001d800140] = 04a4c000, %l1 = 000000009f17960c
	ldsw	[%i3+0x140],%l1		! Annulled
p3_b85:
	membar	#Sync			! Added by membar checker (618)
	fbu,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001f000000] = 93b05806, %l1 = 000000009f17960c
	ldsha	[%i6+%g0]0x80,%l1	! Annulled
p3_b86:
	membar	#Sync			! Added by membar checker (619)
!	%f18 = c250e11e c0000000, %f30 = 4efeccd3 0738aebe
	fcmped	%fcc1,%f18,%f30		! %fcc1 = 1
!	%l0 = 0000000000000050, immed = 000001f4, %y  = ffffffff
	udiv	%l0,0x1f4,%l5		! %l5 = 00000000ffffffff

p3_label_75:
!	%l2 = 0000000060fd5cbf, Mem[000000003080007a] = 3af0c160
	stha	%l2,[%o1+0x07a]%asi	! Mem[0000000030800078] = 3af05cbf
!	%f28 = 00000000, %f25 = d78c59a0, %f15 = 578c59a0
	fadds	%f28,%f25,%f15		! %f15 = d78c59a0
!	%l5 = 00000000ffffffff, immed = 00000828, %y  = ffffffff
	udivx	%l5,0x828,%l1		! %l1 = 00000000001f6310
!	Mem[000000003180003c] = 00007d99, %l0 = 0000000000000050
	lduba	[%o3+0x03c]%asi,%l0	! %l0 = 0000000000000000
!	%f16 = 80000000, %f25 = d78c59a0, %f3  = 00000000
	fadds	%f16,%f25,%f3 		! %f3  = d78c59a0

p3_label_76:
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c000008] = ffffe8e6, %l0 = 0000000000000000
	ldstuba	[%i0+%o6]0x80,%l0	! %l0 = 00000000000000ff
p3_b87:
	bcc	p3_b88			! Branch Taken, %ccr = 88, CWP = 0
!	%l7 = 0000000000000060, Mem[000000001c800008] = ffff7298
	stwa	%l7,[%i1+%o6]0x80	! Mem[000000001c800008] = 00000060
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x058,%g2
p3_b88:
	membar	#Sync			! Added by membar checker (620)
	fbe,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2

p3_label_77:
!	Mem[000000001d800000] = ea0d2074, %l1 = 00000000001f6310
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000ea0d
p3_b89:
	membar	#Sync			! Added by membar checker (621)
	set	p3_b90,%o7
	fbo,a,pt %fcc3,p3_near_2_le	! Branch Taken, %fcc3 = 2
!	Mem[000000001c000020] = 6d708468 5d56a15f c9e45d52 bd2870a4
	prefetch [%i0+0x020],20
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x05a,%g2
p3_b90:
!	Registers modified during the branch to p3_near_2
!	%l2  = 0000000000000066
!	%l3  = 000000007462e8e6
	fbu,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800008] = 470de13d, %l7 = 0000000000000060
	ldsba	[%i3+%o6]0x80,%l7	! Annulled
p3_b91:

p3_label_78:
!	call to call_1, CWP = 0
	call	p3_call_1_he
!	Mem[000000001d800080] = c13e2309 5d708013 099a4b68 647f7bea
	prefetch [%i3+0x080],0
!	Registers modified during the branch to p3_call_1
!	%l0  = ffffffffffdf3100
!	%l1  = 0000000000000000
!	%l2  = ffffffffffdf2a25
!	%l3  = ffffffffefc00000
!	%l7  = ffffffffffdf3f96
	membar	#Sync			! Added by membar checker (622)
!	%l1 = 0000000000000000, immed = 0000074e, %l1 = 0000000000000000
	addccc	%l1,0x74e,%l1		! %l1 = 000000000000074f, %ccr = 00
!	%l1 = 000000000000074f, immed = 00000d07, %l0 = ffffffffffdf3100
	orncc	%l1,0xd07,%l0		! %l0 = fffffffffffff7ff, %ccr = 88
!	%l1 = 000000000000074f, %l3 = ffffffffefc00000, %l7 = ffffffffffdf3f96
	xorcc	%l1,%l3,%l7		! %l7 = ffffffffefc0074f, %ccr = 88

p3_label_79:
!	%f12 = 00000000 00000000, %f26 = 32d6549d 4e523906, %f18 = c250e11e c0000000
	fdivd	%f12,%f26,%f18		! %f18 = 00000000 00000000
	set	p3_b92,%o7
	fbl,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001d800000] = ea0d2074, %l7 = ffffffffefc0074f
	lduwa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ea0d2074
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x05c,%g2
p3_b92:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 00bcdd535db1cc5b
!	%l4  = 00000000000000ff
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (623)
	set	p3_b93,%o7
	fble,a,pt %fcc0,p3_near_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c8001c0] = ebbc101d 75c35ee5 60e7e39a ab3b85e0
	prefetch [%i1+0x1c0],22
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x05d,%g2
p3_b93:
!	Registers modified during the branch to p3_near_3
!	%l2  = fffffffffffffff7
!	%l3  = 00bcdd535db1cce8
!	%l5  = fffffffffffffff7
!	%l6  = 0000000000000000

p3_label_80:
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 0a
!	%l0 = ffffffffffffffe7, Mem[000000001c800000] = 50bb162a
	stwa	%l0,[%i1+%g0]0x80	! Mem[000000001c800000] = ffffffe7
p3_b94:
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c000000] = a19977c9, %l5 = fffffffffffffff7
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000a19977c9
p3_b95:
	membar	#Sync			! Added by membar checker (624)
	fbg,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_81:
!	Mem[000000001c800008] = 00000060 edc304d3, %l6 = 00000000, %l7 = ea0d2074
	ldda	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000060 00000000edc304d3
p3_b96:
	membar	#Sync			! Added by membar checker (625)
!	Mem[000000001c800008] = 00000060, %l4 = 00000000000000ff
	ldswa	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000060
!	Mem[000000001c800180] = 3d4aaa24 bd7e2bfc 3d46c57d 3489c69a
	prefetcha [%i1+0x180]%asi,4
!	%l5 = 00000000a19977c9, Mem[000000001c800050] = 232ccb172b7b0f42
	stxa	%l5,[%i1+0x050]%asi	! Mem[000000001c800050] = 00000000a19977c9
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_82:
!	Mem[000000001d0000a0] = 3faf6c9d eea2e91c c0df7230 8124397d
	prefetch [%i2+0x0a0],21	! Annulled
p3_b97:
	membar	#Sync			! Added by membar checker (626)
!	Branch On Register, %l2 = fffffffffffffff7
	brgz,a,pt %l2,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d000000] = fffffffe f6d33d30 ffdee800 5d1e7f23
	prefetch [%i2+0x000],20	! Annulled
p3_b98:
	membar	#Sync			! Added by membar checker (627)
!	%l4 = 00000060, %l5 = a19977c9, Mem[000000001d0000f0] = 0d3022a4 1f51f7cd
	stda	%l4,[%i2+0x0f0]%asi	! Mem[000000001d0000f0] = 00000060 a19977c9
!	%l0 = ffffffffffffffe7, %l4 = 0000000000000060, %y  = ffffffff
	sdiv	%l0,%l4,%l0		! %l0 = 0000000000000000

p3_label_83:
	set	p3_b99,%o7
	fble	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	%l6 = 0000000000000060, Mem[000000001e800000] = 50bb162a
	stwa	%l6,[%i5+%g0]0x80	! Mem[000000001e800000] = 00000060
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x063,%g2
p3_b99:
!	Registers modified during the branch to p3_far_3
!	%l4  = ffffffffffffeecb
!	%l5  = 000000000000167b
!	%l6  = 0000000000000bd8
!	%l7  = 000000000000004e
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[000000001c800000] = ffffffe7, %l5 = 000000000000167b
	lduba	[%i1+%g0]0x80,%l5	! Annulled
p3_b100:
	membar	#Sync			! Added by membar checker (628)
!	Mem[000000001c800060] = 444024da 15ba2b2b 10757125 902e96f2
	prefetcha [%i1+0x060]%asi,16

p3_label_84:
!	%l4 = ffffffffffffeecb, %l0 = 0000000000000000, %y  = ffffffff
	umulcc	%l4,%l0,%l6		! %l6 = 0000000000000000, %ccr = 44
!	%l4 = ffffeecb, %l5 = 0000167b, Mem[000000001c000000] = fffffff7 a19977c9
	stda	%l4,[%i0+%g0]0x80	! Mem[000000001c000000] = ffffeecb 0000167b
!	Branch On Register, %l1 = 000000000000074f
	brgz,a,pn %l1,p3_b101		! Branch Taken
!	Mem[000000001c800060] = 444024da 15ba2b2b 10757125 902e96f2
	prefetch [%i1+0x060],4
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x065,%g2
p3_b101:
	membar	#Sync			! Added by membar checker (629)
!	%l4 = ffffffffffffeecb, immed = 00000de2, %l2 = fffffffffffffff7
	addcc	%l4,0xde2,%l2		! %l2 = fffffffffffffcad, %ccr = 88

p3_label_85:
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800034] = 82f90e05, %l5 = 000000000000167b
	ldstub	[%i1+0x034],%l5		! %l5 = 0000000000000082
p3_b102:
	membar	#Sync			! Added by membar checker (630)
!	%l0 = 0000000000000000, %l5 = 0000000000000082, %l6 = 0000000000000000
	andn	%l0,%l5,%l6		! %l6 = 0000000000000000
!	Mem[000000001c800120] = 0882d825 49982bef b652709c 65c7a76c
	prefetcha [%i1+0x120]%asi,4
!	Mem[000000003000003f] = 50bb162a, %l3 = 00bcdd535db1cce8
	ldstub	[%o0+0x03f],%l3		! %l3 = 000000000000002a

p3_label_86:
!	%l2 = fffffffffffffcad, %l4 = ffffffffffffeecb, %l2 = fffffffffffffcad
	add	%l2,%l4,%l2		! %l2 = ffffffffffffeb78
	set	p3_b103,%o7
	fbne,a,pn %fcc2,p3_near_2_le	! Branch Taken, %fcc2 = 2
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetch [%o4+0x000],23
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x067,%g2
p3_b103:
!	Registers modified during the branch to p3_near_2
!	%l2  = 0000000000000066
!	%l3  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (631)
!	Mem[000000001d000100] = d79dfb1d 036ee0d9 66e88d69 679cc26d
	prefetch [%i2+0x100],0
	fble,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2

p3_label_87:
!	Mem[000000001c000078] = 3700ed1e, %l0 = 0000000000000000
	ldsw	[%i0+0x078],%l0		! %l0 = 000000003700ed1e
p3_b104:
	membar	#Sync			! Added by membar checker (632)
!	%f18 = 00000000 00000000, %f6  = 00000000 348e4180
	fabsd	%f18,%f6 		! %f6  = 00000000 00000000
	set	p3_b105,%o7
	fbule,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	%l3 = 000000007462e8e6, Mem[000000001c000000] = ffffeecb0000167b
	stxa	%l3,[%i0+%g0]0x80	! Mem[000000001c000000] = 000000007462e8e6
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x069,%g2
p3_b105:
!	Registers modified during the branch to p3_far_0
!	%l2  = fffffffffffff7cf
!	%l4  = 9800000000000000
!	%l6  = 000000007462e8e6
!	%l7  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (633)
!	%f15 = d78c59a0, %f4  = 9d08d82d 578c59a0
	fitod	%f15,%f4 		! %f4  = c1c439d3 30000000

p3_label_88:
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001f00009c] = 24d69528, %l5 = 0000000000000082
	lduh	[%i6+0x09c],%l5		! Annulled
p3_b106:
	membar	#Sync			! Added by membar checker (634)
!	%l3 = 000000007462e8e6, immed = 00000001, %l4 = 9800000000000000
	srax	%l3,0x001,%l4		! %l4 = 000000003a317473
!	Mem[000000001c000100] = 496cfc2a 997e4785 6088da26 b12b8a94
	prefetcha [%i0+0x100]%asi,23
	bcc,a	p3_b107			! Branch Taken, %ccr = 88, CWP = 0

p3_label_89:
!	Mem[000000001c000080] = 5039dcc4 e1d6ed8b b7dbc035 489bd429
	prefetch [%i0+0x080],22
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x06b,%g2
p3_b107:
!	Jump to jmpl_3, CWP = 0
	set	p3_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001d800084] = 5d708013, %l0 = 000000003700ed1e
	lduh	[%i3+0x084],%l0		! %l0 = 0000000000005d70
!	Registers modified during the branch to p3_jmpl_3
!	%l2  = 0000000000005d74
	membar	#Sync			! Added by membar checker (635)
!	Branch On Register, %l6 = 000000007462e8e6
	brgez,a,pt %l6,p3_b108		! Branch Taken
!	%l5 = 0000000000000082, Mem[000000001c800008] = 00000060
	stha	%l5,[%i1+%o6]0x80	! Mem[000000001c800008] = 00820060
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x06c,%g2
p3_b108:

p3_label_90:
	bvs	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000030000078] = ffffffff, %l1 = 000000000000074f
	ldsh	[%o0+0x07a],%l1		! %l1 = ffffffffffffffff
p3_b109:
	membar	#Sync			! Added by membar checker (636)
	fbug,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d000008] = ffdee800, %l6 = 000000007462e8e6
	ldsba	[%i2+%o6]0x80,%l6	! %l6 = ffffffffffffffff
p3_b110:
	fbge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_91:
!	Mem[000000001c800040] = 3271bb97 e64e7bfc a7efb010 98003416
	prefetch [%i1+0x040],4	! Annulled
p3_b111:
	membar	#Sync			! Added by membar checker (637)
	fbue,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[000000001d000008] = ffdee800, %l6 = ffffffffffffffff
	ldsba	[%i2+%o6]0x80,%l6	! %l6 = ffffffffffffffff
p3_b112:
	membar	#Sync			! Added by membar checker (638)
!	%l6 = ffffffff, %l7 = 7462e8e6, Mem[000000001c800000] = ffffffe7 f31f2172
	stda	%l6,[%i1+%g0]0x80	! Mem[000000001c800000] = ffffffff 7462e8e6
!	%l0 = 0000000000005d70, Mem[000000001d800015] = a7134640
	stb	%l0,[%i3+0x015]		! Mem[000000001d800014] = a7704640

p3_label_92:
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c80006c] = 902e96f2, %l0 = 0000000000005d70
	lduw	[%i1+0x06c],%l0		! Annulled
p3_b113:
	membar	#Sync			! Added by membar checker (639)
!	Mem[000000003000007c] = ffffffbf, %l0 = 0000000000005d70
	ldsha	[%o0+0x07c]%asi,%l0	! %l0 = ffffffffffffffff
!	Branch On Register, %l4 = 000000003a317473
	brlz,a,pt %l4,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001e800008] = c32886cf, %l7 = 000000007462e8e6
	ldsba	[%i5+%o6]0x80,%l7	! Annulled
p3_b114:

p3_label_93:
	membar	#Sync			! Added by membar checker (640)
!	%l6 = ffffffffffffffff, %l2 = 0000000000005d74, %y  = 00000000
	smulcc	%l6,%l2,%l3		! %l3 = ffffffffffffa28c, %ccr = 88
!	%l6 = ffffffffffffffff, immed = 0000001a, %l1 = ffffffffffffffff
	sll	%l6,0x01a,%l1		! %l1 = fffffffffc000000
!	%l0 = ffffffffffffffff, immed = fffff553, %l3 = ffffffffffffa28c
	subc	%l0,-0xaad,%l3		! %l3 = 0000000000000aac
!	%l3 = 0000000000000aac, %l1 = fffffffffc000000, %l1 = fffffffffc000000
	sll	%l3,%l1,%l1		! %l1 = 0000000000000aac
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_94:
!	%l5 = 0000000000000082, Mem[000000001d000000] = fffffffe
	stba	%l5,[%i2+%g0]0x80	! Annulled
p3_b115:
	membar	#Sync			! Added by membar checker (641)
!	%l1 = 0000000000000aac, immed = fffffb87, %l5 = 0000000000000082
	subc	%l1,-0x479,%l5		! %l5 = 0000000000000f25
	set	p3_b116,%o7
	fblg	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001e00015c] = cb94254e, %l5 = 0000000000000f25
	ldsw	[%i4+0x15c],%l5		! %l5 = ffffffffcb94254e
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x074,%g2
p3_b116:
!	Registers modified during the branch to p3_far_2
!	%l0  = fff97284a9a00000
!	%l4  = ffffffffcb94254d
!	%l6  = 7462e29ac6b7cff0
	membar	#Sync			! Added by membar checker (642)
!	Mem[000000001c800008] = 00820060edc304d3, %l3 = 0000000000000aac
	ldxa	[%i1+%o6]0x80,%l3	! %l3 = 00820060edc304d3

p3_label_95:
	fbug,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d000008] = ffdee800, %l1 = 0000000000000aac
	lduha	[%i2+%o6]0x80,%l1	! Annulled
p3_b117:
	membar	#Sync			! Added by membar checker (643)
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],23
	fbg,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l4 = ffffffffcb94254d, Mem[000000004000003c] = e56468c8
	stw	%l4,[%o5+0x03c]		! Annulled
p3_b118:

p3_label_96:
	membar	#Sync			! Added by membar checker (644)
!	%l7 = 000000007462e8e6, %l3 = 00820060edc304d3, %l7 = 000000007462e8e6
	subc	%l7,%l3,%l7		! %l7 = ff7dff9f869fe413
!	%f30 = 4efeccd3, %f5  = 30000000
	fstoi	%f30,%f5 		! %f5  = 7f666980
!	Mem[000000001d0001c0] = 429b4f91 bebfee30 f9b375ad ff16f26c
	prefetch [%i2+0x1c0],22
!	%l5 = ffffffffcb94254e, %l0 = fff97284a9a00000, %l0 = fff97284a9a00000
	xnorcc	%l5,%l0,%l0		! %l0 = fff972849dcbdab1, %ccr = 88
!	%f7  = 00000000, %f4  = c1c439d3
	fcmpes	%fcc3,%f7 ,%f4 		! %fcc3 = 2

p3_label_97:
!	Branch On Register, %l2 = 0000000000005d74
	brz,a,pn %l2,p3_not_taken_0	! Branch Not Taken
!	%l5 = ffffffffcb94254e, Mem[000000001c800052] = 00000000
	stb	%l5,[%i1+0x052]		! Annulled
p3_b119:
	membar	#Sync			! Added by membar checker (645)
!	Branch On Register, %l6 = 7462e29ac6b7cff0
	brz,pt	%l6,p3_not_taken_0	! Branch Not Taken
!	%l7 = ff7dff9f869fe413, Mem[000000001d800000] = ea0d2074
	stwa	%l7,[%i3+%g0]0x80	! Mem[000000001d800000] = 869fe413
p3_b120:
	membar	#Sync			! Added by membar checker (646)
!	%f24 = 3aa1fac4 d78c59a0, %f8  = baa1fac4 d78c59a0
	fcmped	%fcc1,%f24,%f8 		! %fcc1 = 2

p3_label_98:
!	Mem[000000001c000008] = ffffe8e6, %l7 = ff7dff9f869fe413
	ldsba	[%i0+%o6]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[000000001c800000] = ffffffff 7462e8e6, %l4 = cb94254d, %l5 = cb94254e
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffffffff 000000007462e8e6
!	Mem[000000001d000020] = bf133298, %l0 = fff972849dcbdab1
	ldsha	[%i2+0x020]%asi,%l0	! %l0 = ffffffffffffbf13
!	%l4 = 00000000ffffffff, %l3 = 00820060edc304d3, %l4 = 00000000ffffffff
	andn	%l4,%l3,%l4		! %l4 = 00000000123cfb2c
	bge,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_99:
!	%l6 = 7462e29ac6b7cff0, Mem[0000000030800078] = 3af05cbf7d99a2de
	stx	%l6,[%o1+0x078]		! Annulled
p3_b121:
	membar	#Sync			! Added by membar checker (647)
	set	p3_b122,%o7
	fbug,pn	%fcc1,p3_near_0_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000030000030] = 00005e66, %l6 = 7462e29ac6b7cff0
	ldsh	[%o0+0x030],%l6		! %l6 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p3_branch_failed
	mov	0x07a,%g2
p3_b122:
!	Registers modified during the branch to p3_near_0
!	%l1  = 00000000ffffffff
!	%l3  = 00000000000004f2
!	%l7  = fffffffffffffb0d
	membar	#Sync			! Added by membar checker (648)
!	%l7 = fffffffffffffb0d, immed = 00000d89, %y  = 7462e29a
	udiv	%l7,0xd89,%l1		! %l1 = 00000000ffffffff
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_100:
!	Mem[000000001c00019c] = 04b6b6fe, %l3 = 00000000000004f2
	lduh	[%i0+0x19e],%l3		! %l3 = 000000000000b6fe
p3_b123:
	membar	#Sync			! Added by membar checker (649)
!	Mem[0000000031000038] = 00006b7c, %l0 = ffffffffffffbf13
	ldsb	[%o2+0x038],%l0		! %l0 = 0000000000000000
	set	p3_b124,%o7
	fblg,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001d0001f8] = 16b79262, %l6 = 0000000000000000
	lduh	[%i2+0x1f8],%l6		! %l6 = 00000000000016b7
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x07c,%g2
p3_b124:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 00000000000d748d
!	%l4  = 00000000000000ff
!	%l5  = 0000000000000000
	bpos	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_101:
!	Mem[000000001c000160] = 448a03c4 d7ac6693 229ac0a7 130374f0
	prefetch [%i0+0x160],2
p3_b125:
	membar	#Sync			! Added by membar checker (650)
!	Mem[0000000030800078] = ffffbf13, %l4 = 00000000000000ff
	ldub	[%o1+0x07b],%l4		! %l4 = 0000000000000013

	ba,a	p3_not_taken_0_end
p3_not_taken_0:
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba,a	p3_branch_failed
p3_not_taken_0_end:

	set	p3_b126,%o7
	fblg	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000003000007c] = ffffffbf, %l2 = 0000000000005d74
	lduh	[%o0+0x07c],%l2		! %l2 = 000000000000ffff
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x07e,%g2
p3_b126:
!	Registers modified during the branch to p3_far_3
!	%l4  = ffffffff00002cd2
!	%l5  = 0000000000002cd2
!	%l6  = 000000000000222f
!	%l7  = 000000000000004e
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 11

p3_label_102:
!	Mem[000000001c800178] = ad3405d6, %l4 = ffffffff00002cd2
	lduh	[%i1+0x178],%l4		! %l4 = 000000000000ad34
p3_b127:
	membar	#Sync			! Added by membar checker (651)
!	Mem[000000001c000160] = 448a03c4, %l4 = 000000000000ad34
	ldub	[%i0+0x161],%l4		! %l4 = 000000000000008a
	fbl,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001c000008] = ffffe8e6, %l2 = 000000000000ffff
	ldsha	[%i0+%o6]0x80,%l2	! Annulled
p3_b128:
	membar	#Sync			! Added by membar checker (652)
!	Mem[000000001c00016c] = 130374f0, %l7 = 000000000000004e
	lduh	[%i0+0x16e],%l7		! %l7 = 00000000000074f0

p3_label_103:
!	%l7 = 00000000000074f0, %l4 = 000000000000008a, %l6 = 000000000000222f
	sll	%l7,%l4,%l6		! %l6 = 0000000001d3c000
!	Mem[000000001d000000] = fffffffe, %l6 = 0000000001d3c000
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 000000000000ffff
	set	p3_b129,%o7
	fbg,a,pn %fcc2,p3_near_2_he	! Branch Taken, %fcc2 = 2
!	Mem[0000000030800030] = 7462e8e600006b7c, %l0 = ffffffffffffffe7
	ldx	[%o1+0x030],%l0		! %l0 = 7462e8e600006b7c
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x081,%g2
p3_b129:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000ffffffff
!	%l4  = ffffffffffff0ad8
	ble,a	p3_b130			! Branch Taken, %ccr = 88, CWP = 0

p3_label_104:
!	%l3 = 00000000000d748d, Mem[0000000031800038] = 77c9143b00007d99
	stx	%l3,[%o3+0x038]		! Mem[0000000031800038] = 00000000000d748d
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x082,%g2
p3_b130:
	membar	#Sync			! Added by membar checker (653)
!	%l4 = ffffffffffff0ad8, immed = fffff14c, %l1 = 00000000ffffffff
	taddcc	%l4,-0xeb4,%l1		! %l1 = fffffffffffefc24, %ccr = 99
	set	p3_b131,%o7
	fbl,a	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001d800158] = 4144a457, %l4 = ffffffffffff0ad8
	ldsb	[%i3+0x15b],%l4		! %l4 = 0000000000000057
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x083,%g2
p3_b131:
!	Registers modified during the branch to p3_far_2
!	%l0  = 000000259a400000
!	%l4  = 0000000000012cd2
!	%l6  = 000074eff9ad2580
!	Jump to jmpl_0, CWP = 0
	set	p3_jmpl_0_le,%g1
	jmpl	%g1,%g6

p3_label_105:
!	Mem[000000001d000100] = d79dfb1d 036ee0d9 66e88d69 679cc26d
	prefetch [%i2+0x100],2
!	Registers modified during the branch to p3_jmpl_0
!	%l5  = 000000000000007e
	bneg,a	p3_b132			! Branch Taken, %ccr = 08, CWP = 0
!	%l6 = 000074eff9ad2580, Mem[000000001c000180] = 44a5301a
	stb	%l6,[%i0+0x180]		! Mem[000000001c000180] = 80a5301a
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x084,%g2
p3_b132:
	membar	#Sync			! Added by membar checker (654)
!	Mem[000000001d000073] = 2699437a, %l0 = 000000259a400000
	ldstuba	[%i2+0x073]%asi,%l0	! %l0 = 000000000000007a
!	%l3 = 00000000000d748d, Mem[000000001c000164] = d7ac6693
	stwa	%l3,[%i0+0x164]%asi	! Mem[000000001c000164] = 000d748d

p3_label_106:
!	%f8  = baa1fac4, %f1  = 00000000
	fnegs	%f8 ,%f1 		! %f1  = 3aa1fac4
!	Mem[000000001d000000] = fffffffe, %l3 = 00000000000d748d
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffffff
	set	p3_b133,%o7
	fbo,a,pt %fcc3,p3_near_1_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000030800070] = 442116c2, %l4 = 0000000000012cd2
	swap	[%o1+0x070],%l4		! %l4 = 00000000442116c2
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x085,%g2
p3_b133:
!	Registers modified during the branch to p3_near_1
!	%l3  = 00003a77ffff8b10
!	%l6  = 000000007fffffff
	membar	#Sync			! Added by membar checker (655)
	fbu,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_107:
!	%l2 = 000000000000ffff, Mem[000000001f000008] = c7308cf6
	stwa	%l2,[%i6+%o6]0x80	! Annulled
p3_b134:
	membar	#Sync			! Added by membar checker (656)
!	%l1 = fffffffffffefc24, %l6 = 000000007fffffff, %l2 = 000000000000ffff
	xor	%l1,%l6,%l2		! %l2 = ffffffff800103db
	fbule,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001c800008] = 00820060, %l3 = 00003a77ffff8b10
	swapa	[%i1+%o6]0x80,%l3	! %l3 = 0000000000820060
p3_b135:
	fbg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_108:
!	Mem[000000001d800000] = 869fe413, %l2 = ffffffff800103db
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffff86
p3_b136:
	membar	#Sync			! Added by membar checker (657)
!	%l1 = fffffffffffefc24, immed = fffffce3, %y  = 00003a77
	udivcc	%l1,-0x31d,%l0		! %l0 = 0000000000003a78, %ccr = 00
!	%f19 = 00000000, %f25 = d78c59a0, %f11 = 578c59a0
	fadds	%f19,%f25,%f11		! %f11 = d78c59a0
	set	p3_b137,%o7
	fba,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	%l7 = 00000000000074f0, Mem[000000001c0001b2] = adb0546e
	sth	%l7,[%i0+0x1b2]		! Annulled
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x089,%g2
p3_b137:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 0000000000324333
!	%l4  = 00000000000000ff
!	%l5  = 0000000000000000

p3_label_109:
	set	p3_b138,%o7
	fble	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetch [%o4+0x020],3
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x08a,%g2
p3_b138:
!	Registers modified during the branch to p3_far_2
!	%l0  = 000fffffffe00000
!	%l4  = 000000007fffffff
!	%l6  = 000074eff9ad2580
	membar	#Sync			! Added by membar checker (658)
!	%f29 = 00000000, %f28 = 00000000, %f18 = 00000000 00000000
	fsmuld	%f29,%f28,%f18		! %f18 = 00000000 00000000
!	%l6 = 000074eff9ad2580, %l5 = 0000000000000000, %l6 = 000074eff9ad2580
	andn	%l6,%l5,%l6		! %l6 = 000074eff9ad2580
!	%l4 = 000000007fffffff, %l6 = 000074eff9ad2580, %l0 = 000fffffffe00000
	orncc	%l4,%l6,%l0		! %l0 = ffff8b107fffffff, %ccr = 80

p3_label_110:
!	%l1 = fffffffffffefc24, %l5 = 0000000000000000, %l7 = 00000000000074f0
	addc	%l1,%l5,%l7		! %l7 = fffffffffffefc24
	set	p3_b139,%o7
	fbl,a	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	%l4 = 000000007fffffff, Mem[000000001d800008] = 470de13df0d6e278
	stxa	%l4,[%i3+%o6]0x80	! Mem[000000001d800008] = 000000007fffffff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x08b,%g2
p3_b139:
!	Registers modified during the branch to p3_far_2
!	%l0  = 9dff35a4b0000000
!	%l4  = 000074eff9ad2580
!	%l6  = fffeee4c0e0d6da0
	set	p3_b140,%o7
	fbo	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetch [%o4+0x000],0
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x08c,%g2
p3_b140:
!	Registers modified during the branch to p3_far_2
!	%l0  = c981c1adb4000000
!	%l4  = fffeee4c0e0d6da0
!	%l6  = fffeee4c0e0d6da0

p3_label_111:
	membar	#Sync			! Added by membar checker (659)
!	%f10 = 9d08d82d, %f2  = 00000000 d78c59a0
	fstod	%f10,%f2 		! %f2  = bba11b05 a0000000
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[000000001d000000] = fffffffe, %l4 = fffeee4c0e0d6da0
	ldstuba	[%i2+%g0]0x80,%l4	! Annulled
p3_b141:
	membar	#Sync			! Added by membar checker (660)
!	%l6 = fffeee4c0e0d6da0, %l7 = fffffffffffefc24, %y  = fffeee4c
	smulcc	%l6,%l7,%l0		! %l0 = fffff1bc568cea80, %ccr = 80
!	%l7 = fffffffffffefc24
	sethi	%hi(0x1a671000),%l7	! %l7 = 000000001a671000

p3_label_112:
	set	p3_b142,%o7
	fblg,pn	%fcc1,p3_near_3_le	! Branch Taken, %fcc1 = 2
!	Mem[0000000030800030] = 7462e8e6, %l0 = fffff1bc568cea80
	lduw	[%o1+0x030],%l0		! %l0 = 000000007462e8e6
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x08e,%g2
p3_b142:
!	Registers modified during the branch to p3_near_3
!	%l0  = 0000000000000000
!	%l4  = 000111b466557b46
	membar	#Sync			! Added by membar checker (661)
!	%l5 = 0000000000000000, %l0 = 0000000000000000, %l3 = 0000000000324333
	andncc	%l5,%l0,%l3		! %l3 = 0000000000000000, %ccr = 44
!	%l7 = 000000001a671000, immed = fffff277, %l7 = 000000001a671000
	sub	%l7,-0xd89,%l7		! %l7 = 000000001a671d89
!	%l6 = fffeee4c0e0d6da0
	sethi	%hi(0x1dd87400),%l6	! %l6 = 000000001dd87400

p3_label_113:
!	%l6 = 000000001dd87400, immed = 00000a85, %y  = fffff1bc
	sdivcc	%l6,0xa85,%l6		! %l6 = ffffffff80000000, %ccr = 8a
	set	p3_b143,%o7
	fbo,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d000000] = fffffffef6d33d30, %l1 = fffffffffffefc24
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = fffffffef6d33d30
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x08f,%g2
p3_b143:
!	Registers modified during the branch to p3_far_0
!	%l2  = fffffffffffffdf4
!	%l4  = 9800000000000000
!	%l6  = ffffffff80000000
!	%l7  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (662)
	set	p3_b144,%o7
	fbul,a,pt %fcc0,p3_near_2_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d000170] = eaade06402418f9d, %l4 = 9800000000000000
	ldx	[%i2+0x170],%l4		! %l4 = eaade06402418f9d
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x090,%g2
p3_b144:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000ffffffff
!	%l4  = 00000000000008d3

p3_label_114:
	membar	#Sync			! Added by membar checker (663)
!	%l3 = 0000000000000000, immed = 00000a15, %l3 = 0000000000000000
	addccc	%l3,0xa15,%l3		! %l3 = 0000000000000a15, %ccr = 00
!	Mem[000000001c000049] = a7f02197, %l3 = 0000000000000a15
	ldstuba	[%i0+0x049]%asi,%l3	! %l3 = 00000000000000f0
!	Mem[000000001d000190] = e913f39e, %l0 = 0000000000000000
	ldsba	[%i2+0x190]%asi,%l0	! %l0 = ffffffffffffffe9
	set	p3_b145,%o7
	fble,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	%l5 = 0000000000000000, Mem[000000001d0001ec] = 99481672
	stw	%l5,[%i2+0x1ec]		! Mem[000000001d0001ec] = 00000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x091,%g2
p3_b145:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 0000000000000006
!	%l4  = 00000000000000ff
!	%l5  = 0000000000000000

p3_label_115:
	membar	#Sync			! Added by membar checker (664)
!	%l0 = ffffffffffffffe7, Mem[000000001c0000a2] = 15cb2b61
	stba	%l0,[%i0+0x0a2]%asi	! Mem[000000001c0000a0] = 15cbe761
!	%l0 = ffffffffffffffe7, immed = fffffa63, %y  = fffff1bc
	udiv	%l0,-0x59d,%l4		! %l4 = 00000000fffff759
!	%l6 = ffffffff80000000, Mem[0000000030000074] = 5219bcf9
	stwa	%l6,[%o0+0x074]%asi	! Mem[0000000030000074] = 80000000
!	%l6 = ffffffff80000000, %l4 = 00000000fffff759, %l7 = 000000007462e8e6
	and	%l6,%l4,%l7		! %l7 = 0000000080000000
!	Mem[000000001d800140] = 04a4c000 db0de9ce dc32b0fc 393399ac
	prefetcha [%i3+0x140]%asi,21

p3_label_116:
!	Mem[000000001c000000] = 00000000, %l3 = 0000000000000006
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000001d0000c4] = 8d5c4222, %l0 = ffffffffffffffe7
	lduw	[%i2+0x0c4],%l0		! %l0 = 000000008d5c4222
!	Mem[0000000032000078] = 955217df, %l3 = 0000000000000000
	ldsha	[%o4+0x07a]%asi,%g2	! %g2 = ffffffffffff9552
!	%l1 = 00000000ffffffff, %l6 = ffffffff80000000, %l0 = 000000008d5c4222
	xorcc	%l1,%l6,%l0		! %l0 = ffffffff7fffffff, %ccr = 80
!	%l4 = fffff759, %l5 = 00000000, Mem[0000000032000038] = b226fbb3 3ec07eee
	stda	%l4,[%o4+0x038]%asi	! Mem[0000000032000038] = fffff759 00000000

p3_label_117:
!	Denormal Floating Point Operation Nullified
	nop
	set	p3_b146,%o7
	fbl,a,pn %fcc0,p3_near_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c000000] = ff000000, %l7 = 0000000080000000
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x092,%g2
p3_b146:
!	Registers modified during the branch to p3_near_3
!	%l2  = ffffffff7fffffff
!	%l3  = 000000000000008d
!	%l5  = 0000000080000000
!	%l6  = ffffffffffffffff
	membar	#Sync			! Added by membar checker (665)
!	Mem[000000001f0000a0] = 1eec2f5d 45fb1fdb 7e478f50 24d90094
	prefetcha [%i6+0x0a0]%asi,16
	ble,a	p3_b147			! Branch Taken, %ccr = 08, CWP = 0

p3_label_118:
!	Mem[000000001c800000] = ffffffff, %l4 = 00000000fffff759
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	The following code should not be executed
	nop
	nop
	nop
	fxtos	%f24,%f15
	lduwa	[%o3+0x000]%asi,%l0
	nop
	fble,a	p0_not_taken_0
	nop
	ba	p3_branch_failed
	mov	0x093,%g2
p3_b147:
	membar	#Sync			! Added by membar checker (666)
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %l7 = 00000000000000ff
	andn	%l7,%l7,%l7		! %l7 = 0000000000000000
!	Mem[0000000031800034] = e5645d4e, %l2 = ffffffff7fffffff
	lduw	[%o3+0x034],%l2		! %l2 = 00000000e5645d4e
!	%f6  = 00000000 00000000, %f14 = 1d08d82d d78c59a0
	fmovd	%f6 ,%f14		! %f14 = 00000000 00000000
	set	p3_b148,%o7
	fbge,pn	%fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 2

p3_label_119:
!	Mem[000000001d0001e0] = a3473351 3ed87c74 60f9433e 00000000
	prefetch [%i2+0x1e0],0
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x094,%g2
p3_b148:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000ffffffff
!	%l4  = ffffffff1a9ba869
	membar	#Sync			! Added by membar checker (667)
!	Mem[000000001c000074] = fb6c382c, %l3 = 000000000000008d
	swapa	[%i0+0x074]%asi,%l3	! %l3 = 00000000fb6c382c
!	%l4 = 1a9ba869, %l5 = 80000000, Mem[000000001d800068] = e4d6a865 789a3e7f
	stda	%l4,[%i3+0x068]%asi	! Mem[000000001d800068] = 1a9ba869 80000000
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[000000003080007c] = ffffffff, %l4 = ffffffff1a9ba869
	ldsh	[%o1+0x07e],%l4		! %l4 = ffffffffffffffff
p3_b149:

p3_label_120:
	membar	#Sync			! Added by membar checker (668)
!	Branch On Register, %l3 = 00000000fb6c382c
	brnz,a,pt %l3,p3_b150		! Branch Taken
!	Mem[000000001d800008] = 00000000, %l4 = ffffffffffffffff
	lduha	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x096,%g2
p3_b150:
	membar	#Sync			! Added by membar checker (669)
!	%l3 = 00000000fb6c382c
	sethi	%hi(0x96b7dc00),%l3	! %l3 = 0000000096b7dc00
!	%f15 = 00000000, %f31 = 0738aebe, %f2  = bba11b05
	fdivs	%f15,%f31,%f2 		! %f2  = 00000000
	set	p3_b151,%o7
	fbo,a	p3_far_0_he	! Branch Taken, %fcc0 = 1

p3_label_121:
!	Mem[0000000031800030] = a0000000 e5645d4e, %l6 = ffffffff, %l7 = 00000000
	ldd	[%o3+0x030],%l6		! %l6 = 00000000a0000000 00000000e5645d4e
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x097,%g2
p3_b151:
!	Registers modified during the branch to p3_far_0
!	%l2  = ffffffffffffffff
!	%l4  = 9800000000000000
!	%l6  = 0000000136b7dc00
!	%l7  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (670)
!	Mem[000000001d8001c4] = 8e3884ab, %l6 = 0000000136b7dc00
	ldswa	[%i3+0x1c4]%asi,%l6	! %l6 = ffffffff8e3884ab
!	Mem[0000000032000060] = d7521c0a 5b600007 c83f5640 d915231a
	prefetch [%o4+0x060],21
!	%f28 = 00000000, %f15 = 00000000, %f14 = 00000000
	fsubs	%f28,%f15,%f14		! %f14 = 00000000
	fbu,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_122:
!	Mem[000000001d800008] = 00000000, %l7 = 000000007462e8e6
	lduwa	[%i3+%o6]0x80,%l7	! Annulled
p3_b152:
	membar	#Sync			! Added by membar checker (671)
!	%l6 = ffffffff8e3884ab, immed = 00000017, %l3 = 0000000096b7dc00
	sra	%l6,0x017,%l3		! %l3 = ffffffffffffff1c
!	%f12 = 00000000 00000000, %f24 = 3aa1fac4 d78c59a0, %f26 = 32d6549d 4e523906
	fsubd	%f12,%f24,%f26		! %f26 = baa1fac4 d78c59a0
	set	p3_b153,%o7
	fbne	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	%l0 = ffffffff7fffffff, Mem[000000001d0000d8] = 54fad359
	sth	%l0,[%i2+0x0d8]		! Mem[000000001d0000d8] = ffffd359
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x099,%g2
p3_b153:
!	Registers modified during the branch to p3_far_3
!	%l4  = 000000008e389ac6
!	%l5  = ffffffff8e389ac6
!	%l6  = ffffffff8e389023
!	%l7  = 000000000000004e

p3_label_123:
	membar	#Sync			! Added by membar checker (672)
!	%l6 = ffffffff8e389023, immed = fffffb9c, %l0 = ffffffff7fffffff
	tsubcc	%l6,-0x464,%l0		! %l0 = ffffffff8e389487, %ccr = 9b
!	%l0 = ffffffff8e389487, immed = 0000000e, %l6 = ffffffff8e389023
	sll	%l0,0x00e,%l6		! %l6 = ffffe38e2521c000
!	%l1 = 00000000ffffffff, %l2 = ffffffffffffffff, %y  = fffff1bc
	sdiv	%l1,%l2,%l4		! %l4 = 000000007fffffff
!	%l7 = 000000000000004e, %l6 = ffffe38e2521c000, %y  = fffff1bc
	smulcc	%l7,%l6,%l7		! %l7 = 0000000b50488000, %ccr = 00
	nop

p3_label_124:
!	%f22 = 00000000 47df5d2c, %f18 = 00000000 00000000
	fabsd	%f22,%f18		! %f18 = 00000000 47df5d2c
!	Mem[000000001d800008] = 00000000, %l0 = ffffffff8e389487
	swapa	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000
!	%f31 = 0738aebe, %f18 = 00000000 47df5d2c
	fstod	%f31,%f18		! %f18 = 38e715d7 c0000000
!	%l0 = 00000000, %l1 = ffffffff, Mem[000000001c0001b0] = adb0546e 35c6633c
	std	%l0,[%i0+0x1b0]	! Mem[000000001c0001b0] = 00000000 ffffffff
!	%f30 = 4efeccd3, %f24 = 3aa1fac4
	fstoi	%f30,%f24		! %f24 = 7f666980

p3_label_125:
!	Denormal Floating Point Operation Nullified
	nop
!	%f12 = 00000000 00000000, %f21 = 815be000
	fdtoi	%f12,%f21		! %f21 = 00000000
	set	p3_b154,%o7
	fblg,pt	%fcc1,p3_near_1_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001c800000] = fffff759, %l3 = ffffffffffffff1c
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 000000000000ffff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x09a,%g2
p3_b154:
!	Registers modified during the branch to p3_near_1
!	%l3  = 028d27792c918000
!	%l6  = 000000000822b873
	membar	#Sync			! Added by membar checker (673)
!	%l0 = 0000000000000000, Mem[000000001c800008] = ffff8b10
	stwa	%l0,[%i1+%o6]0x80	! Mem[000000001c800008] = 00000000

p3_label_126:
!	%f16 = 80000000 80000000, %f10 = 9d08d82d d78c59a0
	fmovd	%f16,%f10		! %f10 = 80000000 80000000
!	%l2 = ffffffffffffffff, %l6 = 000000000822b873, %l2 = ffffffffffffffff
	orn	%l2,%l6,%l2		! %l2 = ffffffffffffffff
	fbule,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000030000034] = 085f428c, %l3 = 028d27792c918000
	lduw	[%o0+0x034],%l3		! Annulled
p3_b155:
	membar	#Sync			! Added by membar checker (674)
	set	p3_b156,%o7
	fbne,pn	%fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 1

p3_label_127:
!	Mem[000000001d80007c] = 00000082, %l0 = 0000000000000000
	ldsw	[%i3+0x07c],%l0		! %l0 = 0000000000000082
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x09c,%g2
p3_b156:
	membar	#Sync			! Added by membar checker (675)
!	%l2 = ffffffffffffffff, immed = fffffcc3, %l7 = 0000000b50488000
	addcc	%l2,-0x33d,%l7		! %l7 = fffffffffffffcc2, %ccr = 99
!	%l1 = 00000000ffffffff
	sethi	%hi(0x2554f000),%l1	! %l1 = 000000002554f000
!	Mem[000000001d800008] = 8e3894877fffffff, %l1 = 000000002554f000
	ldxa	[%i3+%o6]0x80,%l1	! %l1 = 8e3894877fffffff
	set	p3_b157,%o7
	fbul	p3_far_2_he	! Branch Taken, %fcc0 = 1

p3_label_128:
!	%l4 = 7fffffff, %l5 = 8e389ac6, Mem[000000001c000008] = ffffe8e6 00001719
	stda	%l4,[%i0+%o6]0x80	! Mem[000000001c000008] = 7fffffff 8e389ac6
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x09d,%g2
p3_b157:
	membar	#Sync			! Added by membar checker (676)
!	%f13 = 00000000, %f22 = 00000000, %f1  = 3aa1fac4
	fadds	%f13,%f22,%f1 		! %f1  = 00000000
!	%l0 = 0000000000000082, %l6 = 000000000822b873, %l1 = 8e3894877fffffff
	srax	%l0,%l6,%l1		! %l1 = 0000000000000000
	fbge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = 000000007fffffff, Mem[000000001d800008] = 8e389487
	stha	%l4,[%i3+%o6]0x80	! Annulled
p3_b158:

p3_label_129:
	membar	#Sync			! Added by membar checker (677)
!	Mem[000000001c0000c0] = f14d0e03 462a1cdc aea6546d 2c7d5bd8
	prefetcha [%i0+0x0c0]%asi,3
!	%l5 = ffffffff8e389ac6, %l3 = 028d27792c918000, %l3 = 028d27792c918000
	subc	%l5,%l3,%l3		! %l3 = fd72d88661a71ac5
	set	p3_b159,%o7
	fbo,a,pn %fcc0,p3_near_2_le	! Branch Taken, %fcc0 = 1
!	%l0 = 0000000000000082, Mem[000000001d000000] = fffffffe
	stba	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = 82fffffe
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x09f,%g2
p3_b159:
!	Registers modified during the branch to p3_near_2
!	%l2  = 0000000000000066
!	%l3  = 000000007462e8e6
	fbg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_130:
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetch [%o4+0x020],2
p3_b160:
	membar	#Sync			! Added by membar checker (678)
!	%l6 = 000000000822b873, %l5 = ffffffff8e389ac6, %l7 = fffffffffffffcc2
	srl	%l6,%l5,%l7		! %l7 = 0000000000208ae1
	fbue,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c0001c0] = 8026b00b c30a1fe9 39ade916 7a31abe6
	prefetch [%i0+0x1c0],20	! Annulled
p3_b161:
	membar	#Sync			! Added by membar checker (679)
!	%f8  = baa1fac4 d78c59a0, %f12 = 00000000 00000000
	fmovd	%f8 ,%f12		! %f12 = baa1fac4 d78c59a0

p3_label_131:
!	Branch On Register, %l5 = ffffffff8e389ac6
	brlz,a,pt %l5,p3_b162		! Branch Taken
!	Mem[000000001c000008] = 7fffffff 8e389ac6, %l0 = 00000082, %l1 = 00000000
	ldda	[%i0+%o6]0x80,%l0	! %l0 = 000000007fffffff 000000008e389ac6
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0a2,%g2
p3_b162:
	membar	#Sync			! Added by membar checker (680)
!	Mem[0000000030000038] = 8dfdebcb, %l2 = 0000000000000066
	ldswa	[%o0+0x038]%asi,%l2	! %l2 = ffffffff8dfdebcb
!	%l1 = 000000008e389ac6, %l0 = 000000007fffffff, %l0 = 000000007fffffff
	addc	%l1,%l0,%l0		! %l0 = 000000010e389ac6
!	%f8  = baa1fac4 d78c59a0, %f30 = 4efeccd3 0738aebe
	fcmped	%fcc3,%f8 ,%f30		! %fcc3 = 1

p3_label_132:
!	%l2 = ffffffff8dfdebcb, Mem[0000000031800078] = 81ea5029b7c16b00
	stxa	%l2,[%o3+0x078]%asi	! Mem[0000000031800078] = ffffffff8dfdebcb
!	%l7 = 0000000000208ae1, immed = 00000234, %y  = 028d2779
	smulcc	%l7,0x234,%l1		! %l1 = 0000000047b1f7b4, %ccr = 00
	set	p3_b163,%o7
	fblg,pt	%fcc0,p3_near_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000003100003c] = 8e389ac6, %l6 = 000000000822b873
	lduw	[%o2+0x03c],%l6		! %l6 = 000000008e389ac6
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0a3,%g2
p3_b163:
	membar	#Sync			! Added by membar checker (681)
!	Mem[000000001c800148] = 96ae29e7, %l2 = ffffffff8dfdebcb
	lduwa	[%i1+0x148]%asi,%l2	! %l2 = 0000000096ae29e7

p3_label_133:
	bpos	p3_b164			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001f0000e4] = 042c998e, %l2 = 0000000096ae29e7
	ldub	[%i6+0x0e4],%l2		! %l2 = 0000000000000004
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x0a4,%g2
p3_b164:
	membar	#Sync			! Added by membar checker (682)
!	Mem[0000000030800030] = 7462e8e6, %l5 = ffffffff8e389ac6
	ldswa	[%o1+0x030]%asi,%l5	! %l5 = 000000007462e8e6
	set	p3_b165,%o7
	fbo,pn	%fcc3,p3_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[000000001d800000] = 869fe413 e96ab8e1, %l0 = 0e389ac6, %l1 = 47b1f7b4
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000869fe413 00000000e96ab8e1
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0a5,%g2
p3_b165:
!	Registers modified during the branch to p3_near_3
!	%l0  = 000000007462e8e6
!	%l4  = fffffffff867494d

p3_label_134:
	membar	#Sync			! Added by membar checker (683)
!	%l3 = 000000007462e8e6, %l4 = fffffffff867494d, %l2 = 0000000000000004
	srax	%l3,%l4,%l2		! %l2 = 000000000003a317
	set	p3_b166,%o7
	fba,a	p3_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d0000a0] = 3faf6c9d eea2e91c c0df7230 8124397d
	prefetch [%i2+0x0a0],2	! Annulled
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0a6,%g2
p3_b166:
!	Registers modified during the branch to p3_far_1
!	%l1  = ffffffff62f7aff8
!	%l3  = fffffa20faac55c4
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetch [%o4+0x000],2	! Annulled
p3_b167:

p3_label_135:
	membar	#Sync			! Added by membar checker (684)
!	%f16 = 80000000, %f9  = d78c59a0, %f28 = 00000000
	fdivs	%f16,%f9 ,%f28		! %f28 = 00000000
!	%f5  = 7f666980, %f4  = c1c439d3
	fcmpes	%fcc1,%f5 ,%f4 		! %fcc1 = 2
!	Mem[000000001c800180] = 3d4aaa24 bd7e2bfc 3d46c57d 3489c69a
	prefetch [%i1+0x180],3
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = fffffffff867494d, Mem[000000001d000000] = 82fffffef6d33d30
	stxa	%l4,[%i2+%g0]0x80	! Annulled
p3_b168:

p3_label_136:
	membar	#Sync			! Added by membar checker (685)
!	%l3 = fffffa20faac55c4, %l4 = fffffffff867494d, %l0 = 000000007462e8e6
	sll	%l3,%l4,%l0		! %l0 = ff441f558ab88000
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000030800030] = 7462e8e600006b7c, %l4 = fffffffff867494d
	ldx	[%o1+0x030],%l4		! Annulled
p3_b169:
	bcc	p3_b170			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[000000001d000000] = 82fffffe, %l2 = 000000000003a317
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 0000000082fffffe
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0aa,%g2
p3_b170:

p3_label_137:
	set	p3_b171,%o7
	fblg,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	%l3 = fffffa20faac55c4, Mem[000000001c000000] = ff000000
	stba	%l3,[%i0+%g0]0x80	! Mem[000000001c000000] = c4000000
!	The following code should not be executed
	nop
	nop
	nop
	lduba	[%o0+0x008]%asi,%l4
	nop
	ldd	[%i1+0x048],%l4
	fstod	%f16,%f6
	ba	p3_branch_failed
	mov	0x0ab,%g2
p3_b171:
!	Registers modified during the branch to p3_far_0
!	%l2  = fffffffffffffffc
!	%l4  = 9800000000000000
!	%l6  = fffffa2188e4f08a
!	%l7  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (686)
!	%f24 = 7f666980 d78c59a0, %f18 = 38e715d7 c0000000
	fcmped	%fcc1,%f24,%f18		! %fcc1 = 2
!	%l6 = fffffa2188e4f08a, immed = fffff347, %y  = fffffa20
	umul	%l6,-0xcb9,%l1		! %l1 = 88e4e9bc5747b446
!	%l0 = ff441f558ab88000, Mem[0000000031800033] = a0000000
	stba	%l0,[%o3+0x033]%asi	! Mem[0000000031800030] = a0000000

p3_label_138:
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetch [%o4+0x040],20
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l7 = 000000007462e8e6, Mem[000000001d80017d] = 28962688
	stb	%l7,[%i3+0x17d]		! Annulled
p3_b172:
	membar	#Sync			! Added by membar checker (687)
!	Mem[0000000032000040] = 73250d1d 48395d52 8e1c8c7e 1df58c8b
	prefetcha [%o4+0x040]%asi,23
!	%f0  = 80000000 00000000, %f18 = 38e715d7 c0000000, %f14 = 00000000 00000000
	fmuld	%f0 ,%f18,%f14		! %f14 = 80000000 00000000

p3_label_139:
!	Mem[000000001f0000d8] = 0529f965, %l7 = 000000007462e8e6
	lduw	[%i6+0x0d8],%l7		! %l7 = 000000000529f965
!	%l3 = fffffa20faac55c4, immed = fffff55f, %y  = 88e4e9bc
	udivx	%l3,-0xaa1,%l6		! %l6 = 0000000000000000
!	%l3 = fffffa20faac55c4, immed = fffff005, %l3 = fffffa20faac55c4
	subccc	%l3,-0xffb,%l3		! %l3 = fffffa20faac65bf, %ccr = 99
	fbul,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	 Annulled
	ldda	[%i0+%g0]0x80,%l2
p3_b173:

p3_label_140:
	membar	#Sync			! Added by membar checker (688)
!	%l0 = ff441f558ab88000, Mem[0000000030000038] = 8dfdebcb50bb16ff
	stxa	%l0,[%o0+0x038]%asi	! Mem[0000000030000038] = ff441f558ab88000
	ble	p3_b174			! Branch Taken, %ccr = 99, CWP = 0
!	%l1 = 88e4e9bc5747b446, Mem[000000001c800008] = 00000000
	stha	%l1,[%i1+%o6]0x80	! Mem[000000001c800008] = b4460000
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x0ae,%g2
p3_b174:
	membar	#Sync			! Added by membar checker (689)
!	%l7 = 000000000529f965, Mem[000000001c0001fc] = 98fec8f4
	stwa	%l7,[%i0+0x1fc]%asi	! Mem[000000001c0001fc] = 0529f965
!	%l5 = 000000007462e8e6, immed = 000005ec, %y  = 88e4e9bc
	umulcc	%l5,0x5ec,%l7		! %l7 = 000002b139bb3208, %ccr = 00

p3_label_141:
!	%l2 = fffffffffffffffc, Mem[000000001d0000c4] = 8d5c4222
	stw	%l2,[%i2+0x0c4]		! Mem[000000001d0000c4] = fffffffc
	set	p3_b175,%o7
	fble,a,pn %fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 1
!	%l4 = 9800000000000000, Mem[000000001f000064] = 422249c5
	stb	%l4,[%i6+0x064]		! Mem[000000001f000064] = 002249c5
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x0af,%g2
p3_b175:
!	Registers modified during the branch to p3_near_2
!	%l1  = 00000000e3c570ce
!	%l4  = 0000000000000adb
	membar	#Sync			! Added by membar checker (690)
!	%l1 = 00000000e3c570ce, immed = 0000031a, %y  = 000002b1
	udiv	%l1,0x31a,%l3		! %l3 = 00000000de6ed68c
	fbu,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_142:
!	Mem[000000001c800000] = fffff759, %l6 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l6	! Annulled
p3_b176:
	membar	#Sync			! Added by membar checker (691)
!	Mem[000000001c000160] = 448a03c4 000d748d, %l6 = 00000000, %l7 = 39bb3208
	ldda	[%i0+0x160]%asi,%l6	! %l6 = 00000000448a03c4 00000000000d748d
!	%l6 = 00000000448a03c4, %l6 = 00000000448a03c4, %l4 = 0000000000000adb
	xnor	%l6,%l6,%l4		! %l4 = ffffffffffffffff
!	%f4  = c1c439d3 7f666980, %f4  = c1c439d3 7f666980
	fcmped	%fcc3,%f4 ,%f4 		! %fcc3 = 0
!	%f17 = 80000000, %f23 = 47df5d2c, %f0  = 80000000
	fsubs	%f17,%f23,%f0 		! %f0  = c7df5d2c

p3_label_143:
!	%l3 = 00000000de6ed68c, immed = 0000067a, %l2 = fffffffffffffffc
	andcc	%l3,0x67a,%l2		! %l2 = 0000000000000608, %ccr = 00
!	%l0 = ff441f558ab88000, Mem[000000001d000008] = ffdee800
	stwa	%l0,[%i2+%o6]0x80	! Mem[000000001d000008] = 8ab88000
	fbug	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800000] = fffff759 7462e8e6, %l6 = 448a03c4, %l7 = 000d748d
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000fffff759 000000007462e8e6
p3_b177:
	membar	#Sync			! Added by membar checker (692)
!	Mem[000000001d8001a0] = 2000fc82 6fea4ca5 be9eb79f 60f4a234
	prefetch [%i3+0x1a0],20

p3_label_144:
	bneg	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000003200003c] = 00000000, %l0 = ff441f558ab88000
	lduw	[%o4+0x03c],%g2		! %g2 = ff441f558ab88000
p3_b178:
	membar	#Sync			! Added by membar checker (693)
!	%l3 = 00000000de6ed68c, Mem[000000001c8000d8] = f08c052f
	stw	%l3,[%i1+0x0d8]		! Mem[000000001c8000d8] = de6ed68c
	bpos	p3_b179			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d000000] = 82fffffe, %l6 = 00000000fffff759
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 00000000000082ff
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x0b3,%g2
p3_b179:

p3_label_145:
	membar	#Sync			! Added by membar checker (694)
!	%l3 = 00000000de6ed68c, %l6 = 00000000000082ff, %l4 = ffffffffffffffff
	addccc	%l3,%l6,%l4		! %l4 = 00000000de6f598b, %ccr = 08
!	%l2 = 0000000000000608, immed = 000000da, %y  = 000002b1
	udivx	%l2,0x0da,%l3		! %l3 = 0000000000000007
!	%f21 = 00000000, %f6  = 00000000
	fmovs	%f21,%f6 		! %f6  = 00000000
!	%f0  = c7df5d2c, %f14 = 80000000
	fnegs	%f0 ,%f14		! %f14 = 47df5d2c
!	Mem[0000000032000030] = 943b333a, %l6 = 00000000000082ff
	lduba	[%o4+0x031]%asi,%g2	! %g2 = 0000000000000094

p3_label_146:
!	Mem[0000000031800038] = 00000000, %l5 = 000000007462e8e6
	swapa	[%o3+0x038]%asi,%l5	! %l5 = 0000000000000000
!	%l3 = 0000000000000007, %l3 = 0000000000000007, %l0 = ff441f558ab88000
	sra	%l3,%l3,%l0		! %l0 = 0000000000000000
!	%l1 = 00000000e3c570ce, %l2 = 0000000000000608, %y  = 000002b1
	smulcc	%l1,%l2,%l5		! %l5 = ffffff55bed05a70, %ccr = 88
	fbu,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001d000008] = 8ab88000, %l7 = 000000007462e8e6
	lduha	[%i2+%o6]0x80,%l7	! Annulled
p3_b180:

p3_label_147:
	membar	#Sync			! Added by membar checker (695)
!	Mem[000000001c800000] = fffff759, %l6 = 00000000000082ff
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 000000000000ffff
	nop
!	%l4 = 00000000de6f598b, immed = 00000980, %l4 = 00000000de6f598b
	or	%l4,0x980,%l4		! %l4 = 00000000de6f598b
!	Mem[000000001c000020] = 6d708468 5d56a15f c9e45d52 bd2870a4
	prefetch [%i0+0x020],23
!	Branch On Register, %l1 = 00000000e3c570ce
	brgz,pn	%l1,p3_b181		! Branch Taken

p3_label_148:
!	Mem[000000001d000154] = 44de3746, %l6 = 000000000000ffff
	swap	[%i2+0x154],%l6		! %l6 = 0000000044de3746
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0b5,%g2
p3_b181:
	set	p3_b182,%o7
	fbul	p3_far_3_le	! Branch Taken, %fcc0 = 1
!	%l1 = 00000000e3c570ce, Mem[000000001c0001a0] = 38ad73047b152270
	stx	%l1,[%i0+0x1a0]		! Mem[000000001c0001a0] = 00000000e3c570ce
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0b6,%g2
p3_b182:
!	Registers modified during the branch to p3_far_3
!	%l1  = fffffffffffffef7
!	%l4  = 44de333799669488
!	%l7  = 0000000000000000
!	Jump to jmpl_0, CWP = 0
	set	p3_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000030000075] = 80000000, %l2 = 0000000000000608
	ldstub	[%o0+0x075],%l2		! %l2 = 0000000000000000
!	Registers modified during the branch to p3_jmpl_0
!	%l5  = 000000000000007e

p3_label_149:
	membar	#Sync			! Added by membar checker (696)
!	%l0 = 0000000000000000, immed = 0000003d, %l5 = 000000000000007e
	sllx	%l0,0x03d,%l5		! %l5 = 0000000000000000
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800008] = b4460000, %l6 = 0000000044de3746
	ldstuba	[%i1+%o6]0x80,%l6	! %l6 = 00000000000000b4
p3_b183:
	membar	#Sync			! Added by membar checker (697)
!	%l1 = fffffffffffffef7, immed = 0000000d, %l7 = 0000000000000000
	srl	%l1,0x00d,%l7		! %l7 = 000000000007ffff
	bleu	p3_not_taken_0		! Branch Not Taken, %ccr = 08

p3_label_150:
!	Mem[000000001d000080] = cb240995 f553e531 15057074 6f524e7e
	prefetch [%i2+0x080],16
p3_b184:
	membar	#Sync			! Added by membar checker (698)
!	%l2 = 0000000000000000, %l0 = 0000000000000000, %l4 = 44de333799669488
	addcc	%l2,%l0,%l4		! %l4 = 0000000000000000, %ccr = 44
	fbe,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800018] = 4c1e063c, %l7 = 000000000007ffff
	ldsw	[%i1+0x018],%l7		! Annulled
p3_b185:
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_151:
!	Mem[000000001c000020] = 6d708468 5d56a15f c9e45d52 bd2870a4
	prefetch [%i0+0x020],23	! Annulled
p3_b186:
	membar	#Sync			! Added by membar checker (699)
	fbn,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000031000038] = 7fffffff, %l4 = 0000000000000000
	ldsw	[%o2+0x038],%l4		! Annulled
p3_b187:
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001c00018d] = 5fe54f90, %l1 = fffffffffffffef7
	ldstub	[%i0+0x18d],%l1		! %l1 = 00000000000000e5
p3_b188:

p3_label_152:
	membar	#Sync			! Added by membar checker (700)
!	%f12 = baa1fac4 d78c59a0, %f14 = 47df5d2c 00000000
	fcmped	%fcc2,%f12,%f14		! %fcc2 = 1
!	%l5 = 0000000000000000, Mem[0000000030000078] = ffffffffffffffbf
	stx	%l5,[%o0+0x078]		! Mem[0000000030000078] = 0000000000000000
!	Mem[0000000030800078] = ffffbf13, %l6 = 000000b4, %l0 = 00000000
	add	%o1,0x78,%g1
	casa	[%g1]0x80,%l6,%l0	! %l0 = 00000000ffffbf13
	fbuge,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l4 = 0000000000000000, Mem[000000001c800000] = fffff759
	stha	%l4,[%i1+%g0]0x80	! Mem[000000001c800000] = 0000f759
p3_b189:

p3_label_153:
	bcc	p3_b190			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000031800030] = a0000000e5645d4e, %l7 = 000000000007ffff
	ldx	[%o3+0x030],%l7		! %l7 = a0000000e5645d4e
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0be,%g2
p3_b190:
	membar	#Sync			! Added by membar checker (701)
!	%l1 = 00000000000000e5
	setx	0x0de30ce00de30ce0,%g7,%l1 ! %l1 = 0de30ce00de30ce0
!	%l3 = 0000000000000007, Mem[000000001d0000d8] = ffffd359b393d073
	stxa	%l3,[%i2+0x0d8]%asi	! Mem[000000001d0000d8] = 0000000000000007
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_154:
!	%l6 = 000000b4, %l7 = e5645d4e, Mem[0000000031800070] = 00efd10d 7add54fd
	std	%l6,[%o3+0x070]	! Mem[0000000031800070] = 000000b4 e5645d4e
p3_b191:
	membar	#Sync			! Added by membar checker (702)
!	%l1 = 0de30ce00de30ce0, %l1 = 0de30ce00de30ce0, %l7 = a0000000e5645d4e
	xorcc	%l1,%l1,%l7		! %l7 = 0000000000000000, %ccr = 44
!	%f28 = 00000000 00000000, %f24 = 7f666980 d78c59a0, %f14 = 47df5d2c 00000000
	faddd	%f28,%f24,%f14		! %f14 = 7f666980 d78c59a0
!	Mem[000000001e800140] = a1ff007b 326e1966 0669abe5 9660cdb5
	prefetch [%i5+0x140],2
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_155:
!	Mem[000000001c000000] = c4000000, %l6 = 00000000000000b4
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffc4000000
p3_b192:
	membar	#Sync			! Added by membar checker (703)
	set	p3_b193,%o7
	fbule,pn %fcc2,p3_near_0_le	! Branch Taken, %fcc2 = 1
!	Mem[000000001d8001b8] = 7f9fb1f0ff6e1334, %l7 = 0000000000000000
	ldx	[%i3+0x1b8],%l7		! %l7 = 7f9fb1f0ff6e1334
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0c1,%g2
p3_b193:
!	Registers modified during the branch to p3_near_0
!	%l1  = 00000000ffffffff
!	%l3  = 80604e0f0091e839
!	%l7  = 80604e0f3b6e17c6
	membar	#Sync			! Added by membar checker (704)
!	%f19 = c0000000, %f9  = d78c59a0
	fabss	%f19,%f9 		! %f9  = 40000000
!	%l6 = ffffffffc4000000, immed = fffff980, %y  = 44de3337
	mulx	%l6,-0x680,%l1		! %l1 = 0000018600000000

p3_label_156:
!	Mem[000000001d800080] = c13e2309 5d708013 099a4b68 647f7bea
	prefetch [%i3+0x080],0
!	%l6 = ffffffffc4000000, %l4 = 0000000000000000, %l1 = 0000018600000000
	xnorcc	%l6,%l4,%l1		! %l1 = 000000003bffffff, %ccr = 00
!	Mem[0000000030000038] = ff441f55, %l1 = 000000003bffffff
	swapa	[%o0+0x038]%asi,%l1	! %l1 = 00000000ff441f55
!	Mem[000000001e800180] = 301f3376 4cd5d7d6 8afbb789 3d95a64c
	prefetcha [%i5+0x180]%asi,21
!	Mem[000000003180003c] = 000d748d, %l2 = 0000000000000000
	ldub	[%o3+0x03c],%l2		! %l2 = 0000000000000000

p3_label_157:
!	%l3 = 80604e0f0091e839, immed = fffff977, %l5 = 0000000000000000
	andn	%l3,-0x689,%l5		! %l5 = 0000000000000008
!	Mem[000000001c0001d0] = 8ce37d4e, %l5 = 0000000000000008
	ldsba	[%i0+0x1d3]%asi,%l5	! %l5 = 000000000000004e
!	Mem[000000001c800008] = ff460000 edc304d3, %l0 = ffffbf13, %l1 = ff441f55
	ldda	[%i1+%o6]0x80,%l0	! %l0 = 00000000ff460000 00000000edc304d3
!	%l4 = 0000000000000000, %l7 = 80604e0f3b6e17c6, %l7 = 80604e0f3b6e17c6
	add	%l4,%l7,%l7		! %l7 = 80604e0f3b6e17c6
	set	p3_b194,%o7
	fblg,a	p3_far_1_he	! Branch Taken, %fcc0 = 1

p3_label_158:
!	Mem[000000001d800008] = 8e389487 7fffffff, %l4 = 00000000, %l5 = 0000004e
	ldda	[%i3+%o6]0x80,%l4	! %l4 = 000000008e389487 000000007fffffff
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0c2,%g2
p3_b194:
!	Registers modified during the branch to p3_far_1
!	%l1  = ffffffff6dc304d3
!	%l3  = 0000000962040000
	set	p3_b195,%o7
	fblg,a	p3_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001d000008] = 8ab88000, %l5 = 000000007fffffff
	ldsha	[%i2+%o6]0x80,%l5	! %l5 = ffffffffffff8ab8
!	The following code should not be executed
	fbne,a	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0c3,%g2
p3_b195:
!	Registers modified during the branch to p3_far_0
!	%l2  = 0000000060fd5cbf
!	%l3  = fffffffffffffff6
!	%l4  = 7f9fb1f0c491e839
	membar	#Sync			! Added by membar checker (705)
!	Branch On Register, %l2 = 0000000060fd5cbf
	brlz,pn	%l2,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c000014] = 71c26e88, %l3 = fffffffffffffff6
	ldsb	[%i0+0x017],%l3		! %l3 = ffffffffffffff88
p3_b196:

p3_label_159:
	membar	#Sync			! Added by membar checker (706)
!	%l2 = 0000000060fd5cbf, Mem[000000001d800020] = a650cdfe9cb0c86a
	stx	%l2,[%i3+0x020]		! Mem[000000001d800020] = 0000000060fd5cbf
!	%l4 = 7f9fb1f0c491e839, immed = 00000e82, %l7 = 80604e0f3b6e17c6
	orn	%l4,0xe82,%l7		! %l7 = fffffffffffff97d
!	%l5 = ffffffffffff8ab8, Mem[0000000030800038] = 391c9b880014aca5
	stx	%l5,[%o1+0x038]		! Mem[0000000030800038] = ffffffffffff8ab8
	bcs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001d800008] = 8e389487, %l2 = 0000000060fd5cbf
	swapa	[%i3+%o6]0x80,%l2	! Annulled
p3_b197:

p3_label_160:
	membar	#Sync			! Added by membar checker (707)
!	%f10 = 80000000 80000000, %f6  = 00000000 00000000
	fnegd	%f10,%f6 		! %f6  = 00000000 80000000
!	%l4 = 7f9fb1f0c491e839, %l2 = 0000000060fd5cbf, %l6 = ffffffffc4000000
	orcc	%l4,%l2,%l6		! %l6 = 7f9fb1f0e4fdfcbf, %ccr = 08
!	Mem[000000001c000000] = c4000000, %l6 = 7f9fb1f0e4fdfcbf
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000c4
	set	p3_b198,%o7
	fble,a	p3_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001c8001fc] = 67299b2a, %l4 = 7f9fb1f0c491e839
	ldsw	[%i1+0x1fc],%l4		! %l4 = 0000000067299b2a
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0c6,%g2
p3_b198:
!	Registers modified during the branch to p3_far_3
!	%l1  = ffffffffffffffff
!	%l4  = 000000c3fff474b0
!	%l7  = ffffffffffffffff

p3_label_161:
	membar	#Sync			! Added by membar checker (708)
!	Mem[0000000032000000] = 8f1e7491 1f47a2f8 af60c67b 2d367bd5
	prefetcha [%o4+0x000]%asi,23
!	%f4  = c1c439d3 7f666980, %f4  = c1c439d3 7f666980, %f28 = 00000000 00000000
	faddd	%f4 ,%f4 ,%f28		! %f28 = c1d439d3 7f666980
!	%l4 = 000000c3fff474b0, Mem[000000001c8001e8] = 2e90681b
	stwa	%l4,[%i1+0x1e8]%asi	! Mem[000000001c8001e8] = fff474b0
	set	p3_b199,%o7
	fbge,a,pt %fcc1,p3_near_0_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001c800000] = 0000f759, %l2 = 0000000060fd5cbf
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0c7,%g2
p3_b199:
!	Registers modified during the branch to p3_near_0
!	%l0  = 000000001c140e53

p3_label_162:
	membar	#Sync			! Added by membar checker (709)
!	%l5 = ffffffffffff8ab8, %l4 = 000000c3fff474b0, %l5 = ffffffffffff8ab8
	andncc	%l5,%l4,%l5		! %l5 = ffffff3c000b8a08, %ccr = 80
	fbue,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000031000070] = fd50ffae, %l6 = 00000000000000c4
	ldub	[%o2+0x073],%l6		! Annulled
p3_b200:
	membar	#Sync			! Added by membar checker (710)
!	Branch On Register, %l3 = ffffffffffffff88
	brlz,pn	%l3,p3_b201		! Branch Taken
!	Mem[000000001d000000] = 82fffffe, %l5 = ffffff3c000b8a08
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffff82ff
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0c9,%g2
p3_b201:

p3_label_163:
	membar	#Sync			! Added by membar checker (711)
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetcha [%o4+0x020]%asi,22
!	%l5 = ffffffffffff82ff, %l3 = ffffffffffffff88, %l3 = ffffffffffffff88
	xor	%l5,%l3,%l3		! %l3 = 0000000000007d77
!	Mem[0000000030000030] = 00005e66, %l2 = 0000000000000000
	ldstuba	[%o0+0x030]%asi,%l2	! %l2 = 0000000000000000
!	%l5 = ffffffffffff82ff, immed = fffff6b2, %l4 = 000000c3fff474b0
	andcc	%l5,-0x94e,%l4		! %l4 = ffffffffffff82b2, %ccr = 88
!	%f1  = 00000000, %f31 = 0738aebe, %f31 = 0738aebe
	fmuls	%f1 ,%f31,%f31		! %f31 = 00000000

p3_label_164:
!	Mem[000000001d000188] = 49986f3c, %l5 = ffffffffffff82ff
	ldsha	[%i2+0x18a]%asi,%l5	! %l5 = 0000000000006f3c
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l0 = 000000001c140e53, Mem[000000001e800080] = f7922077e595c0e4
	stx	%l0,[%i5+0x080]		! Mem[000000001e800080] = 000000001c140e53
p3_b202:
	membar	#Sync			! Added by membar checker (712)
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[000000003100007e] = 8e389ac6, %l7 = ffffffffffffffff
	ldstub	[%o2+0x07e],%l7		! %l7 = 000000000000009a

p3_label_165:
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	 Annulled
	ldda	[%i0+%o6]0x80,%l4
p3_b203:
	membar	#Sync			! Added by membar checker (713)
!	%f14 = 7f666980 d78c59a0, %f26 = baa1fac4 d78c59a0
	fnegd	%f14,%f26		! %f26 = ff666980 d78c59a0
!	%l5 = 0000000000006f3c, Mem[000000001c800008] = ff460000edc304d3
	stxa	%l5,[%i1+%o6]0x80	! Mem[000000001c800008] = 0000000000006f3c
!	%l5 = 0000000000006f3c, %l0 = 000000001c140e53, %l0 = 000000001c140e53
	and	%l5,%l0,%l0		! %l0 = 0000000000000e10

p3_label_166:
	bge	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d000000] = 82fffffef6d33d30, %l7 = 000000000000009a
	ldxa	[%i2+%g0]0x80,%l7	! %l7 = 82fffffef6d33d30
p3_b204:
	membar	#Sync			! Added by membar checker (714)
!	%l3 = 0000000000007d77, %l2 = 0000000000000000, %l7 = 82fffffef6d33d30
	andn	%l3,%l2,%l7		! %l7 = 0000000000007d77
!	%f5  = 7f666980, %f28 = c1d439d3 7f666980
	fitod	%f5 ,%f28		! %f28 = 41dfd99a 60000000
!	%l7 = 0000000000007d77, %l4 = ffffffffffff82b2, %l2 = 0000000000000000
	srax	%l7,%l4,%l2		! %l2 = 0000000000000000

p3_label_167:
!	Mem[000000001d000020] = bf133298 15b32b9b 37bfd6eb aa854afc
	prefetch [%i2+0x020],21
	fbuge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800120] = 641bb732 574e1559 15f2df8c 69f6b478
	prefetch [%i3+0x120],4	! Annulled
p3_b205:
	membar	#Sync			! Added by membar checker (715)
	fbu,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[000000001e0000ec] = 7ba8d58d, %l7 = 0000000000007d77
	lduw	[%i4+0x0ec],%l7		! Annulled
p3_b206:

p3_label_168:
	membar	#Sync			! Added by membar checker (716)
!	%l6 = 00000000000000c4, %l6 = 00000000000000c4, %y  = 000000c3
	umulcc	%l6,%l6,%l0		! %l0 = 0000000000009610, %ccr = 00
!	%f19 = c0000000, %f0  = c7df5d2c
	fstoi	%f19,%f0 		! %f0  = fffffffe
!	Mem[000000001c00003c] = 499664ba, %l3 = 0000000000007d77
	lduh	[%i0+0x03c],%l3		! %l3 = 0000000000004996
!	%f5  = 7f666980, %f10 = 80000000
	fabss	%f5 ,%f10		! %f10 = 7f666980
!	%l6 = 000000c4, %l7 = 00007d77, Mem[000000001d000000] = 82fffffe f6d33d30
	stda	%l6,[%i2+%g0]0x80	! Mem[000000001d000000] = 000000c4 00007d77

p3_label_169:
!	Mem[000000001d800000] = 869fe413, %l7 = 0000000000007d77
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000869fe413
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d000008] = 8ab88000, %l2 = 0000000000000000
	lduha	[%i2+%o6]0x80,%l2	! Annulled
p3_b207:
	membar	#Sync			! Added by membar checker (717)
!	%l6 = 00000000000000c4, immed = 00000a19, %l0 = 0000000000009610
	or	%l6,0xa19,%l0		! %l0 = 0000000000000add
	bpos	p3_b208			! Branch Taken, %ccr = 00, CWP = 0

p3_label_170:
!	Mem[0000000031800078] = ffffffff, %l5 = 0000000000006f3c
	lduw	[%o3+0x078],%l5		! %l5 = 00000000ffffffff
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0d0,%g2
p3_b208:
	membar	#Sync			! Added by membar checker (718)
!	Mem[000000001c8001a0] = f7b261bc, %l5 = 00000000ffffffff
	ldsba	[%i1+0x1a2]%asi,%l5	! %l5 = 0000000000000061
!	%l5 = 0000000000000061, %l3 = 0000000000004996, %l7 = 00000000869fe413
	andn	%l5,%l3,%l7		! %l7 = 0000000000000061
	set	p3_b209,%o7
	fbul,a	p3_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d800008] = 8e389487, %l2 = 0000000000000000
	ldsha	[%i3+%o6]0x80,%l2	! %l2 = ffffffffffff8e38
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x0d1,%g2
p3_b209:
!	Registers modified during the branch to p3_far_1
!	%l1  = 0000000000000061
!	%l3  = ffffffffff73b5fe

p3_label_171:
	membar	#Sync			! Added by membar checker (719)
!	%l0 = 0000000000000add, %l3 = ffffffffff73b5fe, %l5 = 0000000000000061
	addcc	%l0,%l3,%l5		! %l5 = ffffffffff73c0db, %ccr = 88
!	%l0 = 0000000000000add, %l4 = ffffffffffff82b2, %y  = ffffffff
	smulcc	%l0,%l4,%l5		! %l5 = fffffffffaaec7aa, %ccr = 88
	bn	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l0 = 0000000000000add, Mem[0000000031800078] = ffffffff
	stw	%l0,[%o3+0x078]		! Mem[0000000031800078] = 00000add
p3_b210:
	membar	#Sync			! Added by membar checker (720)
!	%l7 = 0000000000000061, %l2 = ffffffffffff8e38, %l5 = fffffffffaaec7aa
	taddcc	%l7,%l2,%l5		! %l5 = ffffffffffff8e99, %ccr = 8a

p3_label_172:
!	Mem[000000001c800000] = 0000f759, %l1 = 0000000000000061
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%f19 = c0000000, %f13 = d78c59a0
	fstoi	%f19,%f13		! %f13 = fffffffe
	ba	p3_b211			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[000000001d8001e0] = 3dbc9441 712dd350 2ae7ed2c fd140209
	prefetch [%i3+0x1e0],4
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0d3,%g2
p3_b211:
	membar	#Sync			! Added by membar checker (721)
!	%l4 = ffffffffffff82b2, %l2 = ffffffffffff8e38, %l4 = ffffffffffff82b2
	andn	%l4,%l2,%l4		! %l4 = 0000000000000082

p3_label_173:
	set	p3_b212,%o7
	fblg,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	%l3 = ffffffffff73b5fe, Mem[000000001d800000] = 00007d77e96ab8e1
	stxa	%l3,[%i3+%g0]0x80	! Mem[000000001d800000] = ffffffffff73b5fe
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0d4,%g2
p3_b212:
!	Registers modified during the branch to p3_far_1
!	%l0  = ffffffffffffffe7
!	%l3  = 0000000000000000
!	%l4  = 00000000000000c6
!	%l5  = 0000000000000000
	fbug,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c000000] = ff000000, %l6 = 00000000000000c4
	ldsha	[%i0+%g0]0x80,%l6	! Annulled
p3_b213:
	membar	#Sync			! Added by membar checker (722)
!	Mem[000000001c0001f0] = 98acc13b 746541bb, %l2 = ffff8e38, %l3 = 00000000
	ldda	[%i0+0x1f0]%asi,%l2	! %l2 = 0000000098acc13b 00000000746541bb

p3_label_174:
!	%l7 = 0000000000000061, %l4 = 00000000000000c6, %l0 = ffffffffffffffe7
	tsubcc	%l7,%l4,%l0		! %l0 = ffffffffffffff9b, %ccr = 9b
!	Mem[0000000031000038] = 7fffffff, %l7 = 0000000000000061
	ldswa	[%o2+0x038]%asi,%l7	! %l7 = 000000007fffffff
!	%f11 = 80000000, %f7  = 80000000
	fcmpes	%fcc1,%f11,%f7 		! %fcc1 = 0
!	%l0 = ffffffffffffff9b, immed = fffff0db, %l1 = 0000000000000000
	orncc	%l0,-0xf25,%l1		! %l1 = ffffffffffffffbf, %ccr = 88
	bl	p3_b214			! Branch Taken, %ccr = 88, CWP = 0

p3_label_175:
!	Mem[000000003000003c] = 8ab88000, %l4 = 00000000000000c6
	ldsb	[%o0+0x03d],%l4		! %l4 = ffffffffffffffb8
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x0d6,%g2
p3_b214:
	membar	#Sync			! Added by membar checker (723)
!	%f25 = d78c59a0, %f26 = ff666980 d78c59a0
	fstox	%f25,%f26		! %f26 = fffee74c c0000000
	set	p3_b215,%o7
	fbge,pt	%fcc1,p3_near_2_le	! Branch Taken, %fcc1 = 0
!	Mem[000000001d000008] = 8ab88000, %l1 = ffffffffffffffbf
	lduba	[%i2+%o6]0x80,%l1	! %l1 = 000000000000008a
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0d7,%g2
p3_b215:
!	Registers modified during the branch to p3_near_2
!	%l2  = 0000000000000066
!	%l3  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (724)
!	Mem[000000001c0000d0] = 1ae686b9, %l1 = 000000000000008a
	swap	[%i0+0x0d0],%l1		! %l1 = 000000001ae686b9

p3_label_176:
	fbu,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000032000064] = 0007c83f, %l2 = 0000000000000066
	lduh	[%o4+0x066],%g2		! %g2 = 0000000000000007
p3_b216:
	membar	#Sync			! Added by membar checker (725)
!	%l7 = 000000007fffffff, %l5 = 0000000000000000, %l0 = ffffffffffffff9b
	andcc	%l7,%l5,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%f28 = 41dfd99a 60000000, %f18 = 38e715d7 c0000000
	fdtox	%f28,%f18		! %f18 = 00000000 7f666980
!	%l7 = 000000007fffffff, immed = fffff9f0, %y  = ffffffff
	sdiv	%l7,-0x610,%l5		! %l5 = 0000000000151d07

p3_label_177:
!	Mem[000000001c0001cc] = 7a31abe6, %l4 = ffffffffffffffb8
	ldsha	[%i0+0x1cc]%asi,%l4	! %l4 = 0000000000007a31
!	%l1 = 000000001ae686b9, Mem[000000001c000008] = 7fffffff
	stwa	%l1,[%i0+%o6]0x80	! Mem[000000001c000008] = 1ae686b9
	bne	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001e800000] = 00000060 afcc64a4, %l4 = 00007a31, %l5 = 00151d07
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000060 00000000afcc64a4
p3_b217:
	membar	#Sync			! Added by membar checker (726)
!	%l1 = 000000001ae686b9
	sethi	%hi(0x3372f000),%l1	! %l1 = 000000003372f000

p3_label_178:
!	%l2 = 0000000000000066, immed = 00000008, %l7 = 000000007fffffff
	srl	%l2,0x008,%l7		! %l7 = 0000000000000000
!	%l5 = 00000000afcc64a4, %l6 = 00000000000000c4, %y  = ffffffff
	sdivx	%l5,%l6,%l5		! %l5 = 0000000000e59d3f
!	Mem[000000001c000000] = ff000000, %l6 = 00000000000000c4
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000031800034] = e5645d4e, %l3 = 000000007462e8e6
	ldstub	[%o3+0x034],%l3		! %l3 = 00000000000000e5
	set	p3_b218,%o7
	fbule,a	p3_far_1_he	! Branch Taken, %fcc0 = 1

p3_label_179:
!	Mem[000000001c800000] = 0000f759, %l6 = 00000000000000ff
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	stwa	%l6,[%o3+0x044]%asi
	ldd	[%i3+0x0c8],%l6
	fxtos	%f4,%f0
	fabss	%f6,%f27
	ba	p3_branch_failed
	mov	0x0da,%g2
p3_b218:
!	Registers modified during the branch to p3_far_1
!	%l1  = ffffffffcc6892c0
!	%l3  = 0000000000000000
	membar	#Sync			! Added by membar checker (727)
!	Mem[000000001d8001e0] = 3dbc9441 712dd350 2ae7ed2c fd140209
	prefetch [%i3+0x1e0],2
!	%l6 = 0000000000000000, immed = fffff899, %y  = 00000000
	smul	%l6,-0x767,%l5		! %l5 = 0000000000000000
!	Mem[000000001d0000b8] = 8ec113b6, %l2 = 0000000000000066
	ldswa	[%i2+0x0b8]%asi,%l2	! %l2 = ffffffff8ec113b6
	fbu,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_180:
!	Mem[0000000030000074] = 80ff0000, %l7 = 0000000000000000
	swap	[%o0+0x074],%l7		! %l7 = 0000000080ff0000
p3_b219:
	membar	#Sync			! Added by membar checker (728)
!	%l6 = 0000000000000000, Mem[000000001c000000] = ff000000
	stha	%l6,[%i0+%g0]0x80	! Mem[000000001c000000] = 00000000
!	%l1 = ffffffffcc6892c0, %l3 = 0000000000000000, %l6 = 0000000000000000
	andncc	%l1,%l3,%l6		! %l6 = ffffffffcc6892c0, %ccr = 88
!	call to call_3, CWP = 0
	call	p3_call_3_le
!	Mem[000000001d8000e0] = 5f50d589 65a629b4 4d171e01 9257343f
	prefetch [%i3+0x0e0],2
!	Registers modified during the branch to p3_call_3
!	%l0  = 0000000000000000

p3_label_181:
!	Mem[000000001d000008] = 8ab88000, %l2 = ffffffff8ec113b6
	lduba	[%i2+%o6]0x80,%l2	! %l2 = 000000000000008a
!	%l6 = ffffffffcc6892c0, %l6 = ffffffffcc6892c0, %l3 = 0000000000000000
	addcc	%l6,%l6,%l3		! %l3 = ffffffff98d12580, %ccr = 99
!	%l6 = ffffffffcc6892c0, Mem[000000001d0000b8] = 8ec113b6
	stwa	%l6,[%i2+0x0b8]%asi	! Mem[000000001d0000b8] = cc6892c0
!	%l4 = 0000000000000060, %l3 = ffffffff98d12580, %l2 = 000000000000008a
	subccc	%l4,%l3,%l2		! %l2 = 00000000672edadf, %ccr = 11
!	%l1 = ffffffffcc6892c0, %l1 = ffffffffcc6892c0, %y  = 00000000
	mulx	%l1,%l1,%l4		! %l4 = 0a65af19901f9000

p3_label_182:
	fbu,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = 0a65af19901f9000, Mem[0000000031000070] = fd50ffae74f97d69
	stx	%l4,[%o2+0x070]		! Annulled
p3_b220:
	membar	#Sync			! Added by membar checker (729)
!	Mem[000000001c0001b8] = 22b873df, %l3 = ffffffff98d12580
	lduh	[%i0+0x1ba],%l3		! %l3 = 00000000000073df
!	%f2  = 00000000, %f0  = fffffffe
	fitos	%f2 ,%f0 		! %f0  = 00000000
!	%l3 = 00000000000073df, %l5 = 0000000000000000, %l4 = 0a65af19901f9000
	andcc	%l3,%l5,%l4		! %l4 = 0000000000000000, %ccr = 44

p3_label_183:
!	Mem[000000001c800000] = 0000f759, %l7 = 0000000080ff0000
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = 000000000000f759
!	%f28 = 41dfd99a 60000000, %f22 = 00000000 47df5d2c
	fdtox	%f28,%f22		! %f22 = 00000000 7f666980
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[000000001d000008] = 8ab88000, %l4 = 0000000000000000
	ldsha	[%i2+%o6]0x80,%l4	! %l4 = ffffffffffff8ab8
!	Mem[000000001d0000b0] = 158f97a9, %l1 = ffffffffcc6892c0
	ldub	[%i2+0x0b1],%l1		! %l1 = 000000000000008f

p3_label_184:
!	%f3  = a0000000, %f22 = 00000000
	fcmpes	%fcc2,%f3 ,%f22		! %fcc2 = 1
!	%f28 = 41dfd99a 60000000, %f6  = 00000000 80000000
	fdtox	%f28,%f6 		! %f6  = 00000000 7f666980
!	%f8  = baa1fac4 40000000, %f24 = 7f666980 d78c59a0
	fmovd	%f8 ,%f24		! %f24 = baa1fac4 40000000
	be	p3_b221			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000031800078] = 00000add 8dfdebcb, %l2 = 672edadf, %l3 = 000073df
	ldd	[%o3+0x078],%l2		! %l2 = 0000000000000add 000000008dfdebcb
!	The following code should not be executed
	stwa	%l0,[%i2+0x018]%asi
	orn	%l0,0x270,%l0
	andn	%l0,%l0,%l0
	ba	p3_branch_failed
	mov	0x0dd,%g2
p3_b221:

p3_label_185:
	set	p3_b222,%o7
	fblg,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000031800038] = 7462e8e6000d748d, %l4 = ffffffffffff8ab8
	ldx	[%o3+0x038],%l4		! %l4 = 7462e8e6000d748d
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x0de,%g2
p3_b222:
!	Registers modified during the branch to p3_far_0
!	%l2  = fffffffffffff1cf
!	%l4  = 9800000000000000
!	%l6  = 000000005a667e8b
!	%l7  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (730)
!	Mem[0000000030800070] = 00012cd2 6e6c8994, %l6 = 5a667e8b, %l7 = 7462e8e6
	ldda	[%o1+0x070]%asi,%l6	! %l6 = 0000000000012cd2 000000006e6c8994
	bne,a	p3_b223			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000003100003c] = 8e389aff, %l5 = 0000000000000000
	swap	[%o2+0x03c],%l5		! %l5 = 000000008e389aff
!	The following code should not be executed
	orn	%l0,%l0,%l0
	sth	%l6,[%o2+0x042]
	nop
	sdiv	%l0,0xfdb,%l0
	fdivs	%f17,%f28,%f22
	nop
	ba	p3_branch_failed
	mov	0x0df,%g2
p3_b223:

p3_label_186:
	membar	#Sync			! Added by membar checker (731)
!	Branch On Register, %l1 = 000000000000008f
	brlez,pn %l1,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c8000ec] = eb1af436, %l1 = 000000000000008f
	ldsh	[%i1+0x0ec],%l1		! %l1 = ffffffffffffeb1a
p3_b224:
	membar	#Sync			! Added by membar checker (732)
!	Mem[000000003180007c] = 8dfdebcb, %l6 = 0000000000012cd2
	lduwa	[%o3+0x07c]%asi,%l6	! %l6 = 000000008dfdebcb
!	%f5  = 7f666980, %f14 = 7f666980
	fnegs	%f5 ,%f14		! %f14 = ff666980
!	%f21 = 00000000, %f1  = 00000000
	fitos	%f21,%f1 		! %f1  = 00000000

p3_label_187:
!	%l0 = 0000000000000000, Mem[000000001d800018] = 4117c319cdd29f89
	stx	%l0,[%i3+0x018]		! Mem[000000001d800018] = 0000000000000000
!	%l5 = 000000008e389aff, Mem[000000001d000008] = 8ab880005d1e7f23
	stxa	%l5,[%i2+%o6]0x80	! Mem[000000001d000008] = 000000008e389aff
!	Mem[000000001c000180] = 80a5301a 16c45ffd 00004c94 5fff4f90
	prefetch [%i0+0x180],4
!	%l0 = 0000000000000000, immed = fffff1b0, %y  = 00000000
	smulcc	%l0,-0xe50,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Mem[0000000030000074] = 00000000, %l1 = ffffffffffffeb1a
	lduw	[%o0+0x074],%l1		! %l1 = 0000000000000000

p3_label_188:
!	Mem[000000003200003c] = 00000000, %l7 = 000000006e6c8994
	lduh	[%o4+0x03c],%g2		! %g2 = 0000000000000000
!	Mem[000000001c0001c0] = 8026b00b c30a1fe9 39ade916 7a31abe6
	prefetcha [%i0+0x1c0]%asi,1
!	%f0  = 00000000 00000000, %f0  = 00000000
	fxtos	%f0 ,%f0 		! %f0  = 00000000
	fbn,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l4 = 9800000000000000, Mem[0000000030800078] = ffffbf13ffffffff
	stx	%l4,[%o1+0x078]		! Mem[0000000030800078] = 9800000000000000
p3_b225:

p3_label_189:
	membar	#Sync			! Added by membar checker (733)
!	Mem[000000001d800000] = ffffffff, %l4 = 9800000000000000
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000032000030] = a4943b333a1e3068
	stx	%l1,[%o4+0x030]		! Mem[0000000032000030] = 0000000000000000
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001d800000] = ffffffff, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l6	! Annulled
p3_b226:
	fbuge,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_190:
!	Mem[0000000030800078] = 9800000000000000, %l3 = 000000008dfdebcb
	ldx	[%o1+0x078],%l3		! Annulled
p3_b227:
	membar	#Sync			! Added by membar checker (734)
!	Mem[000000001d800008] = 8e389487, %l4 = 00000000000000ff
	ldswa	[%i3+%o6]0x80,%l4	! %l4 = ffffffff8e389487
!	Mem[0000000032000020] = 5d456367 46314fb7 41534fa0 894af11e
	prefetcha [%o4+0x020]%asi,22
!	Mem[000000001d000000] = 000000c4, %l3 = 000000008dfdebcb
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000c4
!	%f0  = 00000000, %f6  = 00000000 7f666980
	fstox	%f0 ,%f6 		! %f6  = 00000000 00000000

p3_label_191:
!	%f24 = baa1fac4 40000000, %f18 = 00000000
	fdtos	%f24,%f18		! %f18 = 950fd622
!	%l5 = 000000008e389aff, %l0 = 0000000000000000, %l0 = 0000000000000000
	addc	%l5,%l0,%l0		! %l0 = 000000008e389aff
!	Mem[000000001d800094] = 20fb8ed5, %l1 = 0000000000000000
	lduh	[%i3+0x096],%l1		! %l1 = 0000000000008ed5
!	%l4 = ffffffff8e389487, Mem[000000001d800000] = ffffffff
	stha	%l4,[%i3+%g0]0x80	! Mem[000000001d800000] = 9487ffff
!	%l0 = 000000008e389aff
	sethi	%hi(0xeda33c00),%l0	! %l0 = 00000000eda33c00

p3_label_192:
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d000138] = 1fd011d8, %l4 = ffffffff8e389487
	ldsw	[%i2+0x138],%l4		! Annulled
p3_b228:
	membar	#Sync			! Added by membar checker (735)
!	%l1 = 0000000000008ed5, %l0 = 00000000eda33c00, %y  = 00000000
	smul	%l1,%l0,%l7		! %l7 = fffff5c14418ec00
!	%f12 = baa1fac4, %f21 = 00000000, %f10 = 7f666980
	fmuls	%f12,%f21,%f10		! %f10 = 80000000
!	Branch On Register, %l5 = 000000008e389aff
	brgz,a,pn %l5,p3_b229		! Branch Taken

p3_label_193:
!	Mem[000000001d000000] = 000000c4 00007d77 00000000 8e389aff
	prefetch [%i2+0x000],23
!	The following code should not be executed
	lduw	[%o0+0x000],%l0
	ble	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0e5,%g2
p3_b229:
	membar	#Sync			! Added by membar checker (736)
!	Mem[000000001c000008] = 1ae686b9 8e389ac6, %l0 = eda33c00, %l1 = 00008ed5
	ldda	[%i0+%o6]0x80,%l0	! %l0 = 000000001ae686b9 000000008e389ac6
!	%l7 = fffff5c14418ec00, immed = 0000002a, %l0 = 000000001ae686b9
	srax	%l7,0x02a,%l0		! %l0 = fffffffffffffffd
!	%l7 = fffff5c14418ec00, immed = fffff861, %y  = fffff5c1
	sdiv	%l7,-0x79f,%l1		! %l1 = 000000007fffffff
!	%l0 = fffffffffffffffd, Mem[0000000031800074] = e5645d4e
	stwa	%l0,[%o3+0x074]%asi	! Mem[0000000031800074] = fffffffd

p3_label_194:
!	Mem[000000001c800008] = 00000000, %l3 = 00000000000000c4
	lduha	[%i1+%o6]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000003080007a] = 98000000, %l3 = 0000000000000000
	ldstub	[%o1+0x07a],%l3		! %l3 = 0000000000000000
!	%f24 = baa1fac4, %f19 = 7f666980
	fnegs	%f24,%f19		! %f19 = 3aa1fac4
!	Mem[000000001d000020] = bf133298 15b32b9b 37bfd6eb aa854afc
	prefetch [%i2+0x020],23
!	%f6  = 00000000, %f28 = 41dfd99a
	fnegs	%f6 ,%f28		! %f28 = 80000000

p3_label_195:
!	%l4 = ffffffff8e389487, Mem[000000001d80018a] = 5342623c
	sth	%l4,[%i3+0x18a]		! Mem[000000001d800188] = 53429487
	bvs,a	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001f000008] = c7308cf6, %l3 = 0000000000000000
	ldsba	[%i6+%o6]0x80,%l3	! Annulled
p3_b230:
	membar	#Sync			! Added by membar checker (737)
!	Mem[000000001d000008] = 00000000, %l2 = fffffffffffff1cf
	ldsha	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000000
	fbue,pt	%fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 1

p3_label_196:
!	%l1 = 000000007fffffff, Mem[000000001c000008] = 1ae686b9
	stha	%l1,[%i0+%o6]0x80	! Mem[000000001c000008] = ffff86b9
p3_b231:
	set	p3_b232,%o7
	fbule	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	%l5 = 000000008e389aff, Mem[000000001d000000] = 000000c4
	stha	%l5,[%i2+%g0]0x80	! Mem[000000001d000000] = 9aff00c4
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0e8,%g2
p3_b232:
!	Registers modified during the branch to p3_far_0
!	%l2  = ffffffffffffffff
!	%l4  = 9800000000000000
!	%l6  = 0000000000000000
!	%l7  = 000000007462e8e6
	membar	#Sync			! Added by membar checker (738)
!	%f0  = 00000000 00000000, %f20 = 00000002 00000000
	fdtox	%f0 ,%f20		! %f20 = 00000000 00000000
!	Mem[000000001c8001a0] = f7b261bc da5a4513 ed7b28ef ee2b875d
	prefetch [%i1+0x1a0],0

p3_label_197:
!	%f5  = 7f666980, %f6  = 00000000
	fabss	%f5 ,%f6 		! %f6  = 7f666980
	fbue	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800000] = 9487ffff, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = ffffffff9487ffff
p3_b233:
	fbge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800000] = 9487ffff, %l1 = 000000007fffffff
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 000000009487ffff
p3_b234:

p3_label_198:
	set	p3_b235,%o7
	fba,a	p3_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c800008] = 00000000, %l5 = 000000008e389aff
	lduba	[%i1+%o6]0x80,%l5	! Annulled
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0eb,%g2
p3_b235:
!	Registers modified during the branch to p3_far_1
!	%l1  = ffffffffe5409aff
!	%l3  = 00000000000026be
	membar	#Sync			! Added by membar checker (739)
!	%l4 = 9800000000000000, immed = fffffee0, %y  = 00000000
	umulcc	%l4,-0x120,%l3		! %l3 = 0000000000000000, %ccr = 44
	set	p3_b236,%o7
	fbl,a	p3_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001c000008] = ffff86b9, %l6 = 0000000000000000
	ldstuba	[%i0+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	The following code should not be executed
	nop
	bleu,a	p0_not_taken_0
	fqtod	%f12,%f8
	umul	%l0,%l0,%l0
	lduh	[%o2+0x008],%l2
	fble,a	p0_not_taken_0
	nop
	fxtoq	%f8,%f8
	ba	p3_branch_failed
	mov	0x0ec,%g2
p3_b236:
!	Registers modified during the branch to p3_far_3
!	%l1  = fffffffffffffef7
!	%l4  = 000000fefff0fb14
!	%l7  = 0000000000000000

p3_label_199:
	membar	#Sync			! Added by membar checker (740)
!	Mem[000000001c000000] = 00000000 7462e8e6 ffff86b9 8e389ac6
	prefetcha [%i0+0x000]%asi,21
!	call to call_1, CWP = 0
	call	p3_call_1_le
!	Mem[000000001c8001e4] = a4cc5655, %l7 = 0000000000000000
	ldub	[%i1+0x1e4],%l7		! %l7 = 00000000000000a4
!	Registers modified during the branch to p3_call_1
!	%l6  = 000000fefff0ecc7
!	Mem[000000001d800060] = 61bbb40a 43497fa6 1a9ba869 80000000
	prefetcha [%i3+0x060]%asi,22
!	%l5 = 000000008e389aff, immed = 00000027, %l1 = fffffffffffffef7
	sllx	%l5,0x027,%l1		! %l1 = 1c4d7f8000000000

p3_label_200:
!	%l6 = 000000fefff0ecc7, Mem[000000001d800000] = 9487ffff
	stba	%l6,[%i3+%g0]0x80	! Mem[000000001d800000] = c787ffff
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l6 = fff0ecc7, %l7 = 000000a4, Mem[0000000030800030] = 7462e8e6 00006b7c
	std	%l6,[%o1+0x030]	! Mem[0000000030800030] = fff0ecc7 000000a4
p3_b237:
	membar	#Sync			! Added by membar checker (741)
!	%l3 = 0000000000000000, %l4 = 000000fefff0fb14, %l5 = 000000008e389aff
	andn	%l3,%l4,%l5		! %l5 = 0000000000000000
!	%f20 = 00000000 00000000, %f16 = 80000000 80000000
	fdtox	%f20,%f16		! %f16 = 00000000 00000000

!	End of Random Code for Processor 3

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x00c]		! Set processor 3 done flag

!	Check Registers

p3_check_registers:
	set	p3_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be fffffffffffffffd
	bne,a,pn %xcc,p3_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 1c4d7f8000000000
	bne,a,pn %xcc,p3_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffffffffffff
	bne,a,pn %xcc,p3_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000fefff0fb14
	bne,a,pn %xcc,p3_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p3_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000fefff0ecc7
	bne,a,pn %xcc,p3_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000a4
	bne,a,pn %xcc,p3_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x000000fe,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 a0000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be c1c439d3 7f666980
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 7f666980 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be baa1fac4 40000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 80000000 80000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be baa1fac4 fffffffe
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ff666980 d78c59a0
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
	cmp	%l0,%l1			! %f18 should be 950fd622 3aa1fac4
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 7f666980
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be baa1fac4 40000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be fffee74c c0000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 80000000 60000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 4efeccd3 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p3_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 000000007462e8e6
	ldx	[%i0+0x000],%g3		! Observed data at 000000001c000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffffffff00000000
	ldx	[%i0+0x008],%g3		! Observed data at 000000001c000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x048],%g2		! Expect data = a7ff21978f6342de
	ldx	[%i0+0x048],%g3		! Observed data at 000000001c000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 0e7276930000008d
	ldx	[%i0+0x070],%g3		! Observed data at 000000001c000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 15cbe761c3ca8390
	ldx	[%i0+0x0a0],%g3		! Observed data at 000000001c0000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = c4ff943d18f1dd99
	ldx	[%i0+0x0b8],%g3		! Observed data at 000000001c0000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 0000008a4573d6af
	ldx	[%i0+0x0d0],%g3		! Observed data at 000000001c0000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x160],%g2		! Expect data = 448a03c4000d748d
	ldx	[%i0+0x160],%g3		! Observed data at 000000001c000160
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x180],%g2		! Expect data = 80a5301a16c45ffd
	ldx	[%i0+0x180],%g3		! Observed data at 000000001c000180
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x180,%g4
	ldx	[%g1+0x188],%g2		! Expect data = 00004c945fff4f90
	ldx	[%i0+0x188],%g3		! Observed data at 000000001c000188
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x188,%g4
	ldx	[%g1+0x1a0],%g2		! Expect data = 00000000e3c570ce
	ldx	[%i0+0x1a0],%g3		! Observed data at 000000001c0001a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a0,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 81398ccbff78e511
	ldx	[%i0+0x1a8],%g3		! Observed data at 000000001c0001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 00000000ffffffff
	ldx	[%i0+0x1b0],%g3		! Observed data at 000000001c0001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = ffffffff8e389ac6
	ldx	[%i0+0x1e8],%g3		! Observed data at 000000001c0001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = b3cb95aa0529f965
	ldx	[%i0+0x1f8],%g3		! Observed data at 000000001c0001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f8,%g4

	set	p3_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000f7597462e8e6
	ldx	[%i1+0x000],%g3		! Observed data at 000000001c800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000006f3c
	ldx	[%i1+0x008],%g3		! Observed data at 000000001c800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 9ffcec60fff90e05
	ldx	[%i1+0x030],%g3		! Observed data at 000000001c800030
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 00000000a19977c9
	ldx	[%i1+0x050],%g3		! Observed data at 000000001c800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 1c8219b2d58f0022
	ldx	[%i1+0x0b8],%g3		! Observed data at 000000001c8000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = de6ed68c6f7bcb1e
	ldx	[%i1+0x0d8],%g3		! Observed data at 000000001c8000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 70108d7200000048
	ldx	[%i1+0x0f8],%g3		! Observed data at 000000001c8000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0f8,%g4
	ldx	[%g1+0x170],%g2		! Expect data = 03dfd2e6ff50faab
	ldx	[%i1+0x170],%g3		! Observed data at 000000001c800170
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x198],%g2		! Expect data = a9215c0a4f4449ff
	ldx	[%i1+0x198],%g3		! Observed data at 000000001c800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = fff474b0e451047d
	ldx	[%i1+0x1e8],%g3		! Observed data at 000000001c8001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e8,%g4

	set	p3_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 9aff00c400007d77
	ldx	[%i2+0x000],%g3		! Observed data at 000000001d000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 000000008e389aff
	ldx	[%i2+0x008],%g3		! Observed data at 000000001d000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x048],%g2		! Expect data = f5d32dc050bb162a
	ldx	[%i2+0x048],%g3		! Observed data at 000000001d000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 269943ff087eed38
	ldx	[%i2+0x070],%g3		! Observed data at 000000001d000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = cc6892c0fecfe45f
	ldx	[%i2+0x0b8],%g3		! Observed data at 000000001d0000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 3bc9ab91fffffffc
	ldx	[%i2+0x0c0],%g3		! Observed data at 000000001d0000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0d8],%g2		! Expect data = 0000000000000007
	ldx	[%i2+0x0d8],%g3		! Observed data at 000000001d0000d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0d8,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = 00000060a19977c9
	ldx	[%i2+0x0f0],%g3		! Observed data at 000000001d0000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x150],%g2		! Expect data = c7bac3410000ffff
	ldx	[%i2+0x150],%g3		! Observed data at 000000001d000150
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x150,%g4
	ldx	[%g1+0x1c8],%g2		! Expect data = f9b375adff16f26c
	ldx	[%i2+0x1c8],%g3		! Observed data at 000000001d0001c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1c8,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 60f9433e00000000
	ldx	[%i2+0x1e8],%g3		! Observed data at 000000001d0001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e8,%g4

	set	p3_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = c787ffffff73b5fe
	ldx	[%i3+0x000],%g3		! Observed data at 000000001d800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 8e3894877fffffff
	ldx	[%i3+0x008],%g3		! Observed data at 000000001d800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = c0242d7da7704640
	ldx	[%i3+0x010],%g3		! Observed data at 000000001d800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x018],%g3		! Observed data at 000000001d800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 0000000060fd5cbf
	ldx	[%i3+0x020],%g3		! Observed data at 000000001d800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 1a9ba86980000000
	ldx	[%i3+0x068],%g3		! Observed data at 000000001d800068
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 3a31747300000082
	ldx	[%i3+0x078],%g3		! Observed data at 000000001d800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x188],%g2		! Expect data = 5342948744fcbdae
	ldx	[%i3+0x188],%g3		! Observed data at 000000001d800188
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x188,%g4

	set	p3_local4_expect,%g1

!	Processor 3, local 4 is clean


	set	p3_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000060afcc64a4
	ldx	[%i5+0x000],%g3		! Observed data at 000000001e800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x080],%g2		! Expect data = 000000001c140e53
	ldx	[%i5+0x080],%g3		! Observed data at 000000001e800080
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x080,%g4

	set	p3_local6_expect,%g1
	ldx	[%g1+0x060],%g2		! Expect data = e794fdd1002249c5
	ldx	[%i6+0x060],%g3		! Observed data at 000000001f000060
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x060,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p3_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p3_memcheck_share0:
	ldx	[%g4+0x30],%g2	! Expected value = ff005e66085f428c
	ldx	[%o0+0x30],%g3	! Read value at Mem[0000000030000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 3bffffff8ab88000
	ldx	[%o0+0x38],%g3	! Read value at Mem[0000000030000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = fe0b495300000000
	ldx	[%o0+0x70],%g3	! Read value at Mem[0000000030000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 7f9fb1f0c491e839
	ldx	[%o0+0x78],%g3	! Read value at Mem[0000000030000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p3_memcheck_share1:
	ldx	[%g4+0x30],%g2	! Expected value = fff0ecc7000000a4
	ldx	[%o1+0x30],%g3	! Read value at Mem[0000000030800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = ffffffffffff8ab8
	ldx	[%o1+0x38],%g3	! Read value at Mem[0000000030800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 00012cd26e6c8994
	ldx	[%o1+0x70],%g3	! Read value at Mem[0000000030800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 9800ff0000000000
	ldx	[%o1+0x78],%g3	! Read value at Mem[0000000030800078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p3_memcheck_share2:
	ldx	[%g4+0x30],%g2	! Expected value = 6d144a37fe855d0b
	ldx	[%o2+0x30],%g3	! Read value at Mem[0000000031000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 7fffffff00000000
	ldx	[%o2+0x38],%g3	! Read value at Mem[0000000031000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = fd50ffae74f97d69
	ldx	[%o2+0x70],%g3	! Read value at Mem[0000000031000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 7fffffff8e38ffc6
	ldx	[%o2+0x78],%g3	! Read value at Mem[0000000031000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p3_memcheck_share3:
	ldx	[%g4+0x30],%g2	! Expected value = a0000000ff645d4e
	ldx	[%o3+0x30],%g3	! Read value at Mem[0000000031800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 7462e8e6000d748d
	ldx	[%o3+0x38],%g3	! Read value at Mem[0000000031800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 000000b4fffffffd
	ldx	[%o3+0x70],%g3	! Read value at Mem[0000000031800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 00000add8dfdebcb
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
	umulcc	%l3,0xde5,%l4
	and	%l0,%l5,%l5
	sth	%l3,[%o3+0x070]		! Mem[0000000031800070]
	xnor	%l0,%l4,%l3
	done

p3_trap1o:
	umulcc	%l3,0xde5,%l4
	and	%l0,%l5,%l5
	sth	%l3,[%i3+0x070]		! Mem[0000000031800070]
	xnor	%l0,%l4,%l3
	done


p3_trap2e:
	prefetch [%i0+0x120],0
	orcc	%l0,-0xe4c,%l5
	xorcc	%l1,-0x23b,%l2
	stx	%l3,[%i0+0x160]		! Mem[000000001c000160]
	sll	%l5,%l6,%l2
	done

p3_trap2o:
	prefetch [%o0+0x120],0
	orcc	%l0,-0xe4c,%l5
	xorcc	%l1,-0x23b,%l2
	stx	%l3,[%o0+0x160]		! Mem[000000001c000160]
	sll	%l5,%l6,%l2
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
	ldx	[%g1+0x000],%l0	! %l0 = 9f0660007689ebcd
	ldx	[%g1+0x008],%l1	! %l1 = 2c0cef00750732e0
	ldx	[%g1+0x010],%l2	! %l2 = b44dedffd755e680
	ldx	[%g1+0x018],%l3	! %l3 = 16b343004d62c637
	ldx	[%g1+0x020],%l4	! %l4 = 6e2dd1ffbffa428c
	ldx	[%g1+0x028],%l5	! %l5 = 0a2ff1fffad0497b
	ldx	[%g1+0x030],%l6	! %l6 = b6d1d5ffe1f86259
	ldx	[%g1+0x038],%l7	! %l7 = 534f5e0068148672

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
	addccc	%l3,%l5,%l4
	prefetch [%i0+0x0a0],21
	udivx	%l5,-0x720,%l7
	stb	%l1,[%i0+0x0d5]		! Mem[00000000100000d5]
	jmpl	%o7,%g0
	orncc	%l1,%l5,%l3
p0_near_0_lo:
	addccc	%l3,%l5,%l4
	prefetch [%o0+0x0a0],21
	udivx	%l5,-0x720,%l7
	stb	%l1,[%o0+0x0d5]		! Mem[00000000100000d5]
	jmpl	%o7,%g0
	orncc	%l1,%l5,%l3
p0_near_0_he:
	ldub	[%o2+0x00c],%l2		! Mem[000000003100000c]
	prefetch [%i3+0x0e0],16
	bge	near0_b2b_h
	andncc	%l4,%l4,%l1
	smul	%l5,-0x790,%l0
	jmpl	%o7,%g0
	ldsw	[%i3+0x0cc],%l7		! Mem[00000000118000cc]
p0_near_0_ho:
	ldub	[%i2+0x00c],%l2		! Mem[000000003100000c]
	prefetch [%o3+0x0e0],16
	bge	near0_b2b_h
	andncc	%l4,%l4,%l1
	smul	%l5,-0x790,%l0
	jmpl	%o7,%g0
	ldsw	[%o3+0x0cc],%l7		! Mem[00000000118000cc]
p1_near_0_le:
	srlx	%l2,0x017,%l1
	be	near0_b2b_l
	ldsh	[%i3+0x1e6],%l0		! Mem[00000000158001e6]
	jmpl	%o7,%g0
	prefetch [%i3+0x040],3
p1_near_0_lo:
	srlx	%l2,0x017,%l1
	be	near0_b2b_l
	ldsh	[%o3+0x1e6],%l0		! Mem[00000000158001e6]
	jmpl	%o7,%g0
	prefetch [%o3+0x040],3
p1_near_0_he:
	ldsw	[%i2+0x0ec],%l1		! Mem[00000000150000ec]
	subccc	%l0,-0xeb1,%l2
	udivcc	%l6,0x90a,%l4
	ldub	[%i1+0x186],%l6		! Mem[0000000014800186]
	add	%l1,0x182,%l0
	jmpl	%o7,%g0
	srax	%l6,%l2,%l5
p1_near_0_ho:
	ldsw	[%o2+0x0ec],%l1		! Mem[00000000150000ec]
	subccc	%l0,-0xeb1,%l2
	udivcc	%l6,0x90a,%l4
	ldub	[%o1+0x186],%l6		! Mem[0000000014800186]
	add	%l1,0x182,%l0
	jmpl	%o7,%g0
	srax	%l6,%l2,%l5
p2_near_0_le:
	bcc	far1_b2b_l
	xnor	%l4,0x58d,%l0
	prefetch [%i1+0x1e0],4
	ldstub	[%o1+0x024],%l0		! Mem[0000000030800024]
	jmpl	%o7,%g0
	addc	%l4,%l2,%l5
p2_near_0_lo:
	bcc	far1_b2b_l
	xnor	%l4,0x58d,%l0
	prefetch [%o1+0x1e0],4
	ldstub	[%i1+0x024],%l0		! Mem[0000000030800024]
	jmpl	%o7,%g0
	addc	%l4,%l2,%l5
p2_near_0_he:
	prefetch [%i0+0x1c0],23
	jmpl	%o7,%g0
	sll	%l3,%l5,%l1
p2_near_0_ho:
	prefetch [%o0+0x1c0],23
	jmpl	%o7,%g0
	sll	%l3,%l5,%l1
p3_near_0_le:
	prefetch [%i2+0x0a0],0
	xor	%l7,-0x4f3,%l3
	udivcc	%l4,0xaab,%l1
	xnorcc	%l6,%l3,%l7
	std	%l0,[%o1+0x078]		! Mem[0000000030800078]
	jmpl	%o7,%g0
	prefetch [%i1+0x040],23
p3_near_0_lo:
	prefetch [%o2+0x0a0],0
	xor	%l7,-0x4f3,%l3
	udivcc	%l4,0xaab,%l1
	xnorcc	%l6,%l3,%l7
	std	%l0,[%i1+0x078]		! Mem[0000000030800078]
	jmpl	%o7,%g0
	prefetch [%o1+0x040],23
p3_near_0_he:
	ldsb	[%o1+0x073],%l0		! Mem[0000000030800073]
	jmpl	%o7,%g0
	udivcc	%l7,0x6fb,%l0
p3_near_0_ho:
	ldsb	[%i1+0x073],%l0		! Mem[0000000030800073]
	jmpl	%o7,%g0
	udivcc	%l7,0x6fb,%l0
near0_b2b_h:
	jmpl	%o7,%g0
	umulcc	%l5,0x93e,%l0
near0_b2b_l:
	jmpl	%o7,%g0
	xnor	%l0,%l7,%l3
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	sdivx	%l7,-0x25a,%l1
	prefetch [%i2+0x000],2
	jmpl	%o7,%g0
	prefetch [%i0+0x0c0],4
p0_near_1_lo:
	sdivx	%l7,-0x25a,%l1
	prefetch [%o2+0x000],2
	jmpl	%o7,%g0
	prefetch [%o0+0x0c0],4
p0_near_1_he:
	sdivx	%l2,-0x103,%l4
	srl	%l1,0x014,%l3
	jmpl	%o7,%g0
	addc	%l4,%l0,%l0
p0_near_1_ho:
	sdivx	%l2,-0x103,%l4
	srl	%l1,0x014,%l3
	jmpl	%o7,%g0
	addc	%l4,%l0,%l0
p1_near_1_le:
	xnor	%l3,%l5,%l7
	stb	%l4,[%i2+0x135]		! Mem[0000000015000135]
	sdiv	%l6,-0x559,%l5
	xor	%l1,%l3,%l2
	subc	%l2,%l5,%l5
	jmpl	%o7,%g0
	taddcc	%l1,%l3,%l3
p1_near_1_lo:
	xnor	%l3,%l5,%l7
	stb	%l4,[%o2+0x135]		! Mem[0000000015000135]
	sdiv	%l6,-0x559,%l5
	xor	%l1,%l3,%l2
	subc	%l2,%l5,%l5
	jmpl	%o7,%g0
	taddcc	%l1,%l3,%l3
p1_near_1_he:
	sll	%l1,0x010,%l5
	stw	%l4,[%i6+0x080]		! Mem[0000000017000080]
	stw	%l0,[%o2+0x01c]		! Mem[000000003100001c]
	sra	%l0,0x014,%l3
	sll	%l0,%l2,%l0
	xnorcc	%l7,0xfe1,%l0
	jmpl	%o7,%g0
	addc	%l6,%l5,%l4
p1_near_1_ho:
	sll	%l1,0x010,%l5
	stw	%l4,[%o6+0x080]		! Mem[0000000017000080]
	stw	%l0,[%i2+0x01c]		! Mem[000000003100001c]
	sra	%l0,0x014,%l3
	sll	%l0,%l2,%l0
	xnorcc	%l7,0xfe1,%l0
	jmpl	%o7,%g0
	addc	%l6,%l5,%l4
p2_near_1_le:
	xnorcc	%l1,0x767,%l4
	srax	%l6,0x035,%l6
	andn	%l3,%l4,%l4
	prefetch [%i0+0x0c0],2
	srlx	%l3,%l2,%l7
	jmpl	%o7,%g0
	sdivx	%l1,-0x023,%l2
p2_near_1_lo:
	xnorcc	%l1,0x767,%l4
	srax	%l6,0x035,%l6
	andn	%l3,%l4,%l4
	prefetch [%o0+0x0c0],2
	srlx	%l3,%l2,%l7
	jmpl	%o7,%g0
	sdivx	%l1,-0x023,%l2
p2_near_1_he:
	xnor	%l2,0x0f7,%l4
	jmpl	%o7,%g0
	andncc	%l6,0x7bc,%l1
p2_near_1_ho:
	xnor	%l2,0x0f7,%l4
	jmpl	%o7,%g0
	andncc	%l6,0x7bc,%l1
p3_near_1_le:
	prefetch [%i1+0x060],2
	std	%l4,[%o2+0x038]		! Mem[0000000031000038]
	jmpl	%o7,%g0
	prefetch [%i1+0x040],3
p3_near_1_lo:
	prefetch [%o1+0x060],2
	std	%l4,[%i2+0x038]		! Mem[0000000031000038]
	jmpl	%o7,%g0
	prefetch [%o1+0x040],3
p3_near_1_he:
	prefetch [%i1+0x160],22
	sdivcc	%l7,0x164,%l6
	jmpl	%o7,%g0
	umul	%l6,%l7,%l3
p3_near_1_ho:
	prefetch [%o1+0x160],22
	sdivcc	%l7,0x164,%l6
	jmpl	%o7,%g0
	umul	%l6,%l7,%l3
near1_b2b_h:
	sdiv	%l3,-0x9e3,%l0
	orncc	%l5,0x986,%l4
	mulx	%l2,-0xc68,%l3
	udiv	%l0,0xea1,%l2
	andcc	%l6,%l2,%l4
	orcc	%l6,-0x6cc,%l2
	jmpl	%o7,%g0
	udiv	%l2,-0xf97,%l6
near1_b2b_l:
	mulx	%l0,%l6,%l6
	orncc	%l7,-0x468,%l1
	addcc	%l4,%l4,%l6
	xorcc	%l3,0xb2e,%l6
	andncc	%l4,0x91e,%l0
	smul	%l1,%l6,%l4
	jmpl	%o7,%g0
	umulcc	%l6,0x712,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	stw	%l7,[%i1+0x090]		! Mem[0000000010800090]
	sub	%l0,%l5,%l3
	stx	%l2,[%i3+0x038]		! Mem[0000000011800038]
	jmpl	%o7,%g0
	srl	%l7,0x005,%l6
p0_near_2_lo:
	stw	%l7,[%o1+0x090]		! Mem[0000000010800090]
	sub	%l0,%l5,%l3
	stx	%l2,[%o3+0x038]		! Mem[0000000011800038]
	jmpl	%o7,%g0
	srl	%l7,0x005,%l6
p0_near_2_he:
	stb	%l7,[%i2+0x06c]		! Mem[000000001100006c]
	mulx	%l0,%l0,%l3
	stb	%l2,[%i3+0x036]		! Mem[0000000011800036]
	and	%l0,0x8fc,%l0
	stw	%l7,[%i2+0x0a0]		! Mem[00000000110000a0]
	jmpl	%o7,%g0
	addccc	%l4,%l5,%l0
p0_near_2_ho:
	stb	%l7,[%o2+0x06c]		! Mem[000000001100006c]
	mulx	%l0,%l0,%l3
	stb	%l2,[%o3+0x036]		! Mem[0000000011800036]
	and	%l0,0x8fc,%l0
	stw	%l7,[%o2+0x0a0]		! Mem[00000000110000a0]
	jmpl	%o7,%g0
	addccc	%l4,%l5,%l0
p1_near_2_le:
	mulx	%l0,%l0,%l0
	lduh	[%i1+0x118],%l4		! Mem[0000000014800118]
	addcc	%l6,-0x929,%l1
	addccc	%l2,0x7b0,%l4
	mulx	%l4,%l0,%l3
	jmpl	%o7,%g0
	sll	%l5,%l7,%l5
p1_near_2_lo:
	mulx	%l0,%l0,%l0
	lduh	[%o1+0x118],%l4		! Mem[0000000014800118]
	addcc	%l6,-0x929,%l1
	addccc	%l2,0x7b0,%l4
	mulx	%l4,%l0,%l3
	jmpl	%o7,%g0
	sll	%l5,%l7,%l5
p1_near_2_he:
	lduw	[%i2+0x110],%l6		! Mem[0000000015000110]
	orcc	%l5,%l5,%l6
	ldd	[%o1+0x050],%l6		! Mem[0000000030800050]
	prefetch [%i1+0x1e0],23
	prefetch [%i1+0x0c0],3
	jmpl	%o7,%g0
	stb	%l2,[%i1+0x12c]		! Mem[000000001480012c]
p1_near_2_ho:
	lduw	[%o2+0x110],%l6		! Mem[0000000015000110]
	orcc	%l5,%l5,%l6
	ldd	[%i1+0x050],%l6		! Mem[0000000030800050]
	prefetch [%o1+0x1e0],23
	prefetch [%o1+0x0c0],3
	jmpl	%o7,%g0
	stb	%l2,[%o1+0x12c]		! Mem[000000001480012c]
p2_near_2_le:
	jmpl	%o7,%g0
	prefetch [%i1+0x040],3
p2_near_2_lo:
	jmpl	%o7,%g0
	prefetch [%o1+0x040],3
p2_near_2_he:
	andncc	%l1,%l2,%l3
	jmpl	%o7,%g0
	srlx	%l7,0x025,%l4
p2_near_2_ho:
	andncc	%l1,%l2,%l3
	jmpl	%o7,%g0
	srlx	%l7,0x025,%l4
p3_near_2_le:
	ldsw	[%o1+0x030],%l3		! Mem[0000000030800030]
	ldsb	[%i0+0x11c],%l2		! Mem[000000001c00011c]
	jmpl	%o7,%g0
	prefetch [%i3+0x1c0],0
p3_near_2_lo:
	ldsw	[%i1+0x030],%l3		! Mem[0000000030800030]
	ldsb	[%o0+0x11c],%l2		! Mem[000000001c00011c]
	jmpl	%o7,%g0
	prefetch [%o3+0x1c0],0
p3_near_2_he:
	prefetch [%i3+0x0c0],21
	sth	%l6,[%i0+0x188]		! Mem[000000001c000188]
	udiv	%l0,0x307,%l1
	jmpl	%o7,%g0
	xorcc	%l2,-0xad9,%l4
p3_near_2_ho:
	prefetch [%o3+0x0c0],21
	sth	%l6,[%o0+0x188]		! Mem[000000001c000188]
	udiv	%l0,0x307,%l1
	jmpl	%o7,%g0
	xorcc	%l2,-0xad9,%l4
near2_b2b_h:
	taddcc	%l6,0xf37,%l1
	sllx	%l3,%l4,%l2
	xnorcc	%l1,0x751,%l1
	xnorcc	%l0,%l6,%l2
	orncc	%l6,0x04c,%l4
	jmpl	%o7,%g0
	orn	%l7,0xb18,%l0
near2_b2b_l:
	smulcc	%l5,0x26b,%l2
	umulcc	%l7,0xa0f,%l3
	udivx	%l3,0x7d7,%l0
	andncc	%l4,-0xb5a,%l1
	xor	%l2,%l3,%l5
	jmpl	%o7,%g0
	orcc	%l7,%l5,%l2
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	prefetch [%i1+0x040],3
	prefetch [%i1+0x020],0
	jmpl	%o7,%g0
	xnor	%l5,-0x380,%l2
p0_near_3_lo:
	prefetch [%o1+0x040],3
	prefetch [%o1+0x020],0
	jmpl	%o7,%g0
	xnor	%l5,-0x380,%l2
p0_near_3_he:
	smul	%l0,%l2,%l1
	prefetch [%i0+0x060],3
	sth	%l5,[%i2+0x0ea]		! Mem[00000000110000ea]
	prefetch [%i2+0x080],21
	jmpl	%o7,%g0
	smulcc	%l0,%l4,%l5
p0_near_3_ho:
	smul	%l0,%l2,%l1
	prefetch [%o0+0x060],3
	sth	%l5,[%o2+0x0ea]		! Mem[00000000110000ea]
	prefetch [%o2+0x080],21
	jmpl	%o7,%g0
	smulcc	%l0,%l4,%l5
p1_near_3_le:
	prefetch [%i3+0x1a0],22
	nop
	jmpl	%o7,%g0
	and	%l6,-0x2c7,%l3
p1_near_3_lo:
	prefetch [%o3+0x1a0],22
	nop
	jmpl	%o7,%g0
	and	%l6,-0x2c7,%l3
p1_near_3_he:
	jmpl	%o7,%g0
	udiv	%l3,0x7be,%l4
p1_near_3_ho:
	jmpl	%o7,%g0
	udiv	%l3,0x7be,%l4
p2_near_3_le:
	sdiv	%l2,0xfec,%l4
	srlx	%l3,0x000,%l1
	addccc	%l7,%l7,%l3
	prefetch [%i0+0x1a0],0
	jmpl	%o7,%g0
	ldd	[%i3+0x1a0],%l2		! Mem[00000000198001a0]
p2_near_3_lo:
	sdiv	%l2,0xfec,%l4
	srlx	%l3,0x000,%l1
	addccc	%l7,%l7,%l3
	prefetch [%o0+0x1a0],0
	jmpl	%o7,%g0
	ldd	[%o3+0x1a0],%l2		! Mem[00000000198001a0]
p2_near_3_he:
	subc	%l6,0xda0,%l4
	orcc	%l7,0xb5e,%l1
	add	%l5,%l6,%l0
	prefetch [%i3+0x100],20
	jmpl	%o7,%g0
	sdiv	%l1,0x9aa,%l5
p2_near_3_ho:
	subc	%l6,0xda0,%l4
	orcc	%l7,0xb5e,%l1
	add	%l5,%l6,%l0
	prefetch [%o3+0x100],20
	jmpl	%o7,%g0
	sdiv	%l1,0x9aa,%l5
p3_near_3_le:
	subccc	%l0,%l6,%l4
	srax	%l4,%l0,%l0
	jmpl	%o7,%g0
	sll	%l5,0x000,%l0
p3_near_3_lo:
	subccc	%l0,%l6,%l4
	srax	%l4,%l0,%l0
	jmpl	%o7,%g0
	sll	%l5,0x000,%l0
p3_near_3_he:
	add	%l2,%l4,%l2
	sub	%l3,-0x08d,%l3
	addccc	%l7,%l2,%l6
	orcc	%l7,%l0,%l2
	udivcc	%l0,-0x0d7,%l6
	sra	%l4,0x016,%l6
	jmpl	%o7,%g0
	xor	%l2,%l6,%l5
p3_near_3_ho:
	add	%l2,%l4,%l2
	sub	%l3,-0x08d,%l3
	addccc	%l7,%l2,%l6
	orcc	%l7,%l0,%l2
	udivcc	%l0,-0x0d7,%l6
	sra	%l4,0x016,%l6
	jmpl	%o7,%g0
	xor	%l2,%l6,%l5
near3_b2b_h:
	sdivcc	%l6,0x0b9,%l7
	sub	%l3,%l3,%l7
	xorcc	%l6,%l4,%l0
	andn	%l4,-0x478,%l4
	andncc	%l4,%l6,%l1
	sllx	%l3,0x018,%l7
	jmpl	%o7,%g0
	smulcc	%l6,-0x051,%l2
near3_b2b_l:
	sub	%l6,-0x8a4,%l3
	addcc	%l7,%l1,%l4
	srlx	%l1,%l4,%l3
	mulx	%l6,-0x5a5,%l6
	sdiv	%l4,-0xb81,%l7
	andn	%l7,-0xc8b,%l7
	jmpl	%o7,%g0
	andncc	%l3,-0x1ee,%l2
user_near3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far0_start:
p0_far_0_le:
	prefetch [%i1+0x0e0],0
	sra	%l3,0x006,%l3
	subc	%l0,%l1,%l0
	sdivx	%l1,-0x31c,%l1
	ldstub	[%i1+0x00b],%l7		! Mem[000000001080000b]
	prefetch [%i3+0x0c0],16
	jmpl	%o7,%g0
	stw	%l5,[%o1+0x004]		! Mem[0000000030800004]
p0_far_0_lo:
	prefetch [%o1+0x0e0],0
	sra	%l3,0x006,%l3
	subc	%l0,%l1,%l0
	sdivx	%l1,-0x31c,%l1
	ldstub	[%o1+0x00b],%l7		! Mem[000000001080000b]
	prefetch [%o3+0x0c0],16
	jmpl	%o7,%g0
	stw	%l5,[%i1+0x004]		! Mem[0000000030800004]
p0_far_0_he:
	std	%l0,[%o0+0x000]		! Mem[0000000030000000]
	lduw	[%i5+0x038],%l0		! Mem[0000000012800038]
	sth	%l7,[%o3+0x04a]		! Mem[000000003180004a]
	jmpl	%o7,%g0
	mulx	%l6,%l7,%l0
p0_far_0_ho:
	std	%l0,[%i0+0x000]		! Mem[0000000030000000]
	lduw	[%o5+0x038],%l0		! Mem[0000000012800038]
	sth	%l7,[%i3+0x04a]		! Mem[000000003180004a]
	jmpl	%o7,%g0
	mulx	%l6,%l7,%l0
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p1_far_0_le:
	orn	%l7,%l3,%l1
	smul	%l5,0x7d2,%l1
	prefetch [%i2+0x060],22
	subc	%l5,%l1,%l0
	udivcc	%l1,-0xafb,%l2
	prefetch [%i3+0x140],0
	jmpl	%o7,%g0
	swap	[%o3+0x014],%l3		! Mem[0000000031800014]
p1_far_0_lo:
	orn	%l7,%l3,%l1
	smul	%l5,0x7d2,%l1
	prefetch [%o2+0x060],22
	subc	%l5,%l1,%l0
	udivcc	%l1,-0xafb,%l2
	prefetch [%o3+0x140],0
	jmpl	%o7,%g0
	swap	[%i3+0x014],%l3		! Mem[0000000031800014]
p1_far_0_he:
	prefetch [%i3+0x020],2
	sll	%l5,0x016,%l4
	prefetch [%i2+0x160],2
	jmpl	%o7,%g0
	sllx	%l0,0x035,%l6
p1_far_0_ho:
	prefetch [%o3+0x020],2
	sll	%l5,0x016,%l4
	prefetch [%o2+0x160],2
	jmpl	%o7,%g0
	sllx	%l0,0x035,%l6
p1_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p2_far_0_le:
	prefetch [%i0+0x0c0],1
	srax	%l2,0x002,%l0
	nop
	prefetch [%i3+0x060],16
	add	%l4,-0xc52,%l0
	jmpl	%o7,%g0
	xorcc	%l6,%l0,%l1
p2_far_0_lo:
	prefetch [%o0+0x0c0],1
	srax	%l2,0x002,%l0
	nop
	prefetch [%o3+0x060],16
	add	%l4,-0xc52,%l0
	jmpl	%o7,%g0
	xorcc	%l6,%l0,%l1
p2_far_0_he:
	sra	%l6,0x00a,%l1
	prefetch [%i1+0x060],20
	xnorcc	%l1,-0x499,%l3
	srlx	%l7,0x01d,%l3
	sdivcc	%l5,0x892,%l6
	lduw	[%i1+0x150],%l0		! Mem[0000000018800150]
	jmpl	%o7,%g0
	prefetch [%i1+0x0e0],4
p2_far_0_ho:
	sra	%l6,0x00a,%l1
	prefetch [%o1+0x060],20
	xnorcc	%l1,-0x499,%l3
	srlx	%l7,0x01d,%l3
	sdivcc	%l5,0x892,%l6
	lduw	[%o1+0x150],%l0		! Mem[0000000018800150]
	jmpl	%o7,%g0
	prefetch [%o1+0x0e0],4
p2_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p3_far_0_le:
	orncc	%l2,%l7,%l4
	stx	%l4,[%o0+0x078]		! Mem[0000000030000078]
	lduw	[%i2+0x1bc],%l2		! Mem[000000001d0001bc]
	jmpl	%o7,%g0
	srax	%l1,0x01c,%l3
p3_far_0_lo:
	orncc	%l2,%l7,%l4
	stx	%l4,[%i0+0x078]		! Mem[0000000030000078]
	lduw	[%o2+0x1bc],%l2		! Mem[000000001d0001bc]
	jmpl	%o7,%g0
	srax	%l1,0x01c,%l3
p3_far_0_he:
	add	%l6,%l3,%l6
	prefetch [%i1+0x180],21
	orcc	%l1,-0xe3c,%l2
	ldsw	[%o1+0x030],%l7		! Mem[0000000030800030]
	jmpl	%o7,%g0
	sllx	%l7,0x03a,%l4
p3_far_0_ho:
	add	%l6,%l3,%l6
	prefetch [%o1+0x180],21
	orcc	%l1,-0xe3c,%l2
	ldsw	[%i1+0x030],%l7		! Mem[0000000030800030]
	jmpl	%o7,%g0
	sllx	%l7,0x03a,%l4
p3_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	addccc	%l4,%l1,%l0
	srlx	%l0,0x024,%l0
	jmpl	%o7,%g0
	mulx	%l6,%l0,%l6
far0_b2b_l:
	udivcc	%l0,-0x120,%l2
	nop
	jmpl	%o7,%g0
	mulx	%l5,%l0,%l6
user_far0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far1_start:
p0_far_1_le:
	ldx	[%i2+0x018],%l3		! Mem[0000000011000018]
	or	%l6,%l4,%l0
	ldsh	[%o0+0x00e],%l1		! Mem[000000003000000e]
	prefetch [%i1+0x0e0],2
	srax	%l5,%l0,%l4
	prefetch [%i3+0x000],4
	jmpl	%o7,%g0
	prefetch [%i2+0x0a0],3
p0_far_1_lo:
	ldx	[%o2+0x018],%l3		! Mem[0000000011000018]
	or	%l6,%l4,%l0
	ldsh	[%i0+0x00e],%l1		! Mem[000000003000000e]
	prefetch [%o1+0x0e0],2
	srax	%l5,%l0,%l4
	prefetch [%o3+0x000],4
	jmpl	%o7,%g0
	prefetch [%o2+0x0a0],3
p0_far_1_he:
	stw	%l4,[%o2+0x00c]		! Mem[000000003100000c]
	smulcc	%l1,%l5,%l4
	ldsb	[%o1+0x04f],%l1		! Mem[000000003080004f]
	ldx	[%i0+0x0b0],%l7		! Mem[00000000100000b0]
	jmpl	%o7,%g0
	sdiv	%l6,0xa37,%l4
p0_far_1_ho:
	stw	%l4,[%i2+0x00c]		! Mem[000000003100000c]
	smulcc	%l1,%l5,%l4
	ldsb	[%i1+0x04f],%l1		! Mem[000000003080004f]
	ldx	[%o0+0x0b0],%l7		! Mem[00000000100000b0]
	jmpl	%o7,%g0
	sdiv	%l6,0xa37,%l4
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p1_far_1_le:
	subccc	%l0,-0xabf,%l0
	prefetch [%i3+0x020],21
	umulcc	%l7,0x9b5,%l7
	orncc	%l5,%l1,%l7
	jmpl	%o7,%g0
	xorcc	%l5,0x824,%l1
p1_far_1_lo:
	subccc	%l0,-0xabf,%l0
	prefetch [%o3+0x020],21
	umulcc	%l7,0x9b5,%l7
	orncc	%l5,%l1,%l7
	jmpl	%o7,%g0
	xorcc	%l5,0x824,%l1
p1_far_1_he:
	sll	%l0,0x010,%l1
	udiv	%l3,0xeb8,%l3
	jmpl	%o7,%g0
	orncc	%l6,-0x347,%l0
p1_far_1_ho:
	sll	%l0,0x010,%l1
	udiv	%l3,0xeb8,%l3
	jmpl	%o7,%g0
	orncc	%l6,-0x347,%l0
p1_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p2_far_1_le:
	addcc	%l4,-0xaaa,%l7
	addc	%l7,%l0,%l0
	ldx	[%o1+0x028],%l2		! Mem[0000000030800028]
	smulcc	%l3,%l4,%l5
	taddcc	%l7,-0x3c2,%l2
	mulx	%l7,-0x6d8,%l5
	jmpl	%o7,%g0
	sdivx	%l6,-0xe59,%l5
p2_far_1_lo:
	addcc	%l4,-0xaaa,%l7
	addc	%l7,%l0,%l0
	ldx	[%i1+0x028],%l2		! Mem[0000000030800028]
	smulcc	%l3,%l4,%l5
	taddcc	%l7,-0x3c2,%l2
	mulx	%l7,-0x6d8,%l5
	jmpl	%o7,%g0
	sdivx	%l6,-0xe59,%l5
p2_far_1_he:
	lduw	[%o0+0x020],%l2		! Mem[0000000030000020]
	ldsb	[%i1+0x1eb],%l0		! Mem[00000000188001eb]
	jmpl	%o7,%g0
	subc	%l5,%l5,%l5
p2_far_1_ho:
	lduw	[%i0+0x020],%l2		! Mem[0000000030000020]
	ldsb	[%o1+0x1eb],%l0		! Mem[00000000188001eb]
	jmpl	%o7,%g0
	subc	%l5,%l5,%l5
p2_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p3_far_1_le:
	ldsb	[%i2+0x195],%l0		! Mem[000000001d000195]
	sdivx	%l0,0x98c,%l5
	udivx	%l4,0x15b,%l3
	ldsb	[%o2+0x076],%l4		! Mem[0000000031000076]
	jmpl	%o7,%g0
	ldstub	[%o2+0x03f],%l4		! Mem[000000003100003f]
p3_far_1_lo:
	ldsb	[%o2+0x195],%l0		! Mem[000000001d000195]
	sdivx	%l0,0x98c,%l5
	udivx	%l4,0x15b,%l3
	ldsb	[%i2+0x076],%l4		! Mem[0000000031000076]
	jmpl	%o7,%g0
	ldstub	[%i2+0x03f],%l4		! Mem[000000003100003f]
p3_far_1_he:
	srax	%l5,0x013,%l3
	prefetch [%i1+0x180],4
	smulcc	%l0,-0xcea,%l3
	jmpl	%o7,%g0
	xnorcc	%l5,%l1,%l1
p3_far_1_ho:
	srax	%l5,0x013,%l3
	prefetch [%o1+0x180],4
	smulcc	%l0,-0xcea,%l3
	jmpl	%o7,%g0
	xnorcc	%l5,%l1,%l1
p3_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	nop
	sll	%l5,0x006,%l3
	addccc	%l1,-0xb8b,%l2
	xor	%l3,%l7,%l5
	sdivcc	%l1,-0x042,%l4
	jmpl	%o7,%g0
	or	%l6,0x906,%l4
far1_b2b_l:
	xnorcc	%l1,%l2,%l2
	mulx	%l6,%l4,%l0
	addcc	%l5,-0xd65,%l3
	sra	%l1,%l1,%l5
	umul	%l6,%l7,%l2
	jmpl	%o7,%g0
	smulcc	%l2,%l7,%l5
user_far1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far2_start:
p0_far_2_le:
	smul	%l1,0x20c,%l1
	xnor	%l2,%l4,%l3
	jmpl	%o7,%g0
	xnor	%l0,-0x914,%l5
p0_far_2_lo:
	smul	%l1,0x20c,%l1
	xnor	%l2,%l4,%l3
	jmpl	%o7,%g0
	xnor	%l0,-0x914,%l5
p0_far_2_he:
	udivcc	%l2,0x16c,%l7
	orncc	%l5,%l3,%l6
	orn	%l6,-0xae4,%l2
	lduh	[%i3+0x0a4],%l7		! Mem[00000000118000a4]
	andcc	%l4,%l6,%l3
	jmpl	%o7,%g0
	ldstub	[%o0+0x00a],%l6		! Mem[000000003000000a]
p0_far_2_ho:
	udivcc	%l2,0x16c,%l7
	orncc	%l5,%l3,%l6
	orn	%l6,-0xae4,%l2
	lduh	[%o3+0x0a4],%l7		! Mem[00000000118000a4]
	andcc	%l4,%l6,%l3
	jmpl	%o7,%g0
	ldstub	[%i0+0x00a],%l6		! Mem[000000003000000a]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p1_far_2_le:
	umul	%l5,-0x6b1,%l4
	mulx	%l5,-0x26a,%l2
	sdivcc	%l1,-0xef2,%l6
	andcc	%l6,%l6,%l6
	jmpl	%o7,%g0
	addccc	%l4,%l5,%l1
p1_far_2_lo:
	umul	%l5,-0x6b1,%l4
	mulx	%l5,-0x26a,%l2
	sdivcc	%l1,-0xef2,%l6
	andcc	%l6,%l6,%l6
	jmpl	%o7,%g0
	addccc	%l4,%l5,%l1
p1_far_2_he:
	jmpl	%o7,%g0
	prefetch [%i3+0x040],3
p1_far_2_ho:
	jmpl	%o7,%g0
	prefetch [%o3+0x040],3
p1_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p2_far_2_le:
	or	%l0,0xddf,%l7
	jmpl	%o7,%g0
	and	%l4,-0xe95,%l2
p2_far_2_lo:
	or	%l0,0xddf,%l7
	jmpl	%o7,%g0
	and	%l4,-0xe95,%l2
p2_far_2_he:
	prefetch [%i1+0x020],22
	xorcc	%l7,%l0,%l6
	srl	%l0,%l4,%l1
	andncc	%l7,0x221,%l5
	ldx	[%o2+0x068],%l7		! Mem[0000000031000068]
	sdivcc	%l0,-0x2bd,%l3
	jmpl	%o7,%g0
	srax	%l6,%l4,%l1
p2_far_2_ho:
	prefetch [%o1+0x020],22
	xorcc	%l7,%l0,%l6
	srl	%l0,%l4,%l1
	andncc	%l7,0x221,%l5
	ldx	[%i2+0x068],%l7		! Mem[0000000031000068]
	sdivcc	%l0,-0x2bd,%l3
	jmpl	%o7,%g0
	srax	%l6,%l4,%l1
p2_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p3_far_2_le:
	addccc	%l5,%l6,%l4
	umulcc	%l7,-0xdd8,%l6
	jmpl	%o7,%g0
	sllx	%l4,0x015,%l0
p3_far_2_lo:
	addccc	%l5,%l6,%l4
	umulcc	%l7,-0xdd8,%l6
	jmpl	%o7,%g0
	sllx	%l4,0x015,%l0
p3_far_2_he:
	std	%l4,[%o2+0x078]		! Mem[0000000031000078]
	jmpl	%o7,%g0
	prefetch [%i3+0x020],22
p3_far_2_ho:
	std	%l4,[%i2+0x078]		! Mem[0000000031000078]
	jmpl	%o7,%g0
	prefetch [%o3+0x020],22
p3_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	addc	%l5,%l5,%l3
	jmpl	%o7,%g0
	subc	%l6,0x2f4,%l0
far2_b2b_l:
	srlx	%l5,0x02c,%l6
	jmpl	%o7,%g0
	srlx	%l7,0x015,%l3
user_far2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	udiv	%l4,-0x0c6,%l7
p0_far_3_lo:
	jmpl	%o7,%g0
	udiv	%l4,-0x0c6,%l7
p0_far_3_he:
	udivcc	%l7,0x6c7,%l5
	jmpl	%o7,%g0
	std	%l6,[%i3+0x060]		! Mem[0000000011800060]
p0_far_3_ho:
	udivcc	%l7,0x6c7,%l5
	jmpl	%o7,%g0
	std	%l6,[%o3+0x060]		! Mem[0000000011800060]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p1_far_3_le:
	prefetch [%i3+0x0e0],16
	lduw	[%o1+0x010],%l3		! Mem[0000000030800010]
	smul	%l2,0x9ba,%l5
	sth	%l3,[%o2+0x01c]		! Mem[000000003100001c]
	jmpl	%o7,%g0
	prefetch [%i3+0x060],3
p1_far_3_lo:
	prefetch [%o3+0x0e0],16
	lduw	[%i1+0x010],%l3		! Mem[0000000030800010]
	smul	%l2,0x9ba,%l5
	sth	%l3,[%i2+0x01c]		! Mem[000000003100001c]
	jmpl	%o7,%g0
	prefetch [%o3+0x060],3
p1_far_3_he:
	stx	%l0,[%i1+0x0e0]		! Mem[00000000148000e0]
	jmpl	%o7,%g0
	sth	%l4,[%i0+0x0e0]		! Mem[00000000140000e0]
p1_far_3_ho:
	stx	%l0,[%o1+0x0e0]		! Mem[00000000148000e0]
	jmpl	%o7,%g0
	sth	%l4,[%o0+0x0e0]		! Mem[00000000140000e0]
p1_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p2_far_3_le:
	udivx	%l5,0x64b,%l5
	andn	%l2,%l4,%l3
	prefetch [%i2+0x0c0],4
	prefetch [%i2+0x080],3
	sdivcc	%l7,0xacd,%l3
	ldd	[%o1+0x060],%l0		! Mem[0000000030800060]
	jmpl	%o7,%g0
	taddcc	%l1,%l6,%l7
p2_far_3_lo:
	udivx	%l5,0x64b,%l5
	andn	%l2,%l4,%l3
	prefetch [%o2+0x0c0],4
	prefetch [%o2+0x080],3
	sdivcc	%l7,0xacd,%l3
	ldd	[%i1+0x060],%l0		! Mem[0000000030800060]
	jmpl	%o7,%g0
	taddcc	%l1,%l6,%l7
p2_far_3_he:
	jmpl	%o7,%g0
	sll	%l0,%l6,%l1
p2_far_3_ho:
	jmpl	%o7,%g0
	sll	%l0,%l6,%l1
p2_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p3_far_3_le:
	smul	%l0,%l7,%l1
	sra	%l3,0x009,%l7
	orncc	%l7,0x108,%l1
	nop
	nop
	jmpl	%o7,%g0
	umulcc	%l6,-0xf14,%l4
p3_far_3_lo:
	smul	%l0,%l7,%l1
	sra	%l3,0x009,%l7
	orncc	%l7,0x108,%l1
	nop
	nop
	jmpl	%o7,%g0
	umulcc	%l6,-0xf14,%l4
p3_far_3_he:
	subccc	%l6,-0xb78,%l6
	ldub	[%o3+0x037],%l7		! Mem[0000000031800037]
	add	%l2,-0xf93,%l4
	add	%l6,0xaa3,%l5
	xnor	%l5,%l1,%l4
	jmpl	%o7,%g0
	stx	%l5,[%i0+0x1e8]		! Mem[000000001c0001e8]
p3_far_3_ho:
	subccc	%l6,-0xb78,%l6
	ldub	[%i3+0x037],%l7		! Mem[0000000031800037]
	add	%l2,-0xf93,%l4
	add	%l6,0xaa3,%l5
	xnor	%l5,%l1,%l4
	jmpl	%o7,%g0
	stx	%l5,[%o0+0x1e8]		! Mem[000000001c0001e8]
p3_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	or	%l3,%l5,%l3
	udivx	%l1,-0x1f9,%l1
	add	%l7,0x3c7,%l2
	jmpl	%o7,%g0
	andn	%l4,%l3,%l6
far3_b2b_l:
	srl	%l2,0x012,%l2
	addcc	%l5,0x85e,%l2
	xnor	%l0,%l4,%l6
	jmpl	%o7,%g0
	xnorcc	%l2,%l7,%l5
user_far3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	lduh	[%i2+0x0a2],%l0		! Mem[00000000110000a2]
	std	%l0,[%o3+0x048]		! Mem[0000000031800048]
	ldsh	[%i0+0x0ac],%l5		! Mem[00000000100000ac]
	andncc	%l2,%l5,%l6
	add	%l7,-0x897,%l5
	sub	%l5,-0x8de,%l0
	jmpl	%g6+8,%g0
	andncc	%l0,0xee5,%l1
p0_call_0_le:
	prefetch [%i3+0x040],23
	retl
	ldsb	[%o0+0x049],%l2		! Mem[0000000030000049]
p0_jmpl_0_lo:
	lduh	[%o2+0x0a2],%l0		! Mem[00000000110000a2]
	std	%l0,[%i3+0x048]		! Mem[0000000031800048]
	ldsh	[%o0+0x0ac],%l5		! Mem[00000000100000ac]
	andncc	%l2,%l5,%l6
	add	%l7,-0x897,%l5
	sub	%l5,-0x8de,%l0
	jmpl	%g6+8,%g0
	andncc	%l0,0xee5,%l1
p0_call_0_lo:
	prefetch [%o3+0x040],23
	retl
	ldsb	[%i0+0x049],%l2		! Mem[0000000030000049]
p0_jmpl_0_he:
	and	%l4,%l3,%l5
	lduw	[%o3+0x048],%l0		! Mem[0000000031800048]
	ldsw	[%i2+0x0e8],%l6		! Mem[00000000110000e8]
	ldstub	[%i2+0x017],%l1		! Mem[0000000011000017]
	jmpl	%g6+8,%g0
	udiv	%l0,-0x566,%l4
p0_call_0_he:
	retl
	ldstub	[%i2+0x01b],%l1		! Mem[000000001100001b]
p0_jmpl_0_ho:
	and	%l4,%l3,%l5
	lduw	[%i3+0x048],%l0		! Mem[0000000031800048]
	ldsw	[%o2+0x0e8],%l6		! Mem[00000000110000e8]
	ldstub	[%o2+0x017],%l1		! Mem[0000000011000017]
	jmpl	%g6+8,%g0
	udiv	%l0,-0x566,%l4
p0_call_0_ho:
	retl
	ldstub	[%o2+0x01b],%l1		! Mem[000000001100001b]
p1_jmpl_0_le:
	umul	%l7,%l4,%l6
	orn	%l4,0x086,%l5
	stb	%l5,[%o3+0x053]		! Mem[0000000031800053]
	ldx	[%o2+0x050],%l6		! Mem[0000000031000050]
	jmpl	%g6+8,%g0
	add	%l3,%l6,%l4
p1_call_0_le:
	tsubcc	%l5,0x5f9,%l3
	subc	%l6,%l7,%l2
	lduh	[%i2+0x0da],%l7		! Mem[00000000150000da]
	add	%l4,-0xc3d,%l7
	swap	[%i3+0x124],%l4		! Mem[0000000015800124]
	retl
	mulx	%l2,%l3,%l7
p1_jmpl_0_lo:
	umul	%l7,%l4,%l6
	orn	%l4,0x086,%l5
	stb	%l5,[%i3+0x053]		! Mem[0000000031800053]
	ldx	[%i2+0x050],%l6		! Mem[0000000031000050]
	jmpl	%g6+8,%g0
	add	%l3,%l6,%l4
p1_call_0_lo:
	tsubcc	%l5,0x5f9,%l3
	subc	%l6,%l7,%l2
	lduh	[%o2+0x0da],%l7		! Mem[00000000150000da]
	add	%l4,-0xc3d,%l7
	swap	[%o3+0x124],%l4		! Mem[0000000015800124]
	retl
	mulx	%l2,%l3,%l7
p1_jmpl_0_he:
	sth	%l6,[%i3+0x0fc]		! Mem[00000000158000fc]
	xor	%l3,-0xed5,%l6
	add	%l3,-0x962,%l5
	stx	%l3,[%i1+0x168]		! Mem[0000000014800168]
	srax	%l3,%l0,%l0
	sra	%l7,0x01f,%l7
	jmpl	%g6+8,%g0
	udivx	%l4,0xcef,%l7
p1_call_0_he:
	subccc	%l6,-0xb44,%l7
	retl
	prefetch [%i1+0x140],21
p1_jmpl_0_ho:
	sth	%l6,[%o3+0x0fc]		! Mem[00000000158000fc]
	xor	%l3,-0xed5,%l6
	add	%l3,-0x962,%l5
	stx	%l3,[%o1+0x168]		! Mem[0000000014800168]
	srax	%l3,%l0,%l0
	sra	%l7,0x01f,%l7
	jmpl	%g6+8,%g0
	udivx	%l4,0xcef,%l7
p1_call_0_ho:
	subccc	%l6,-0xb44,%l7
	retl
	prefetch [%o1+0x140],21
p2_jmpl_0_le:
	prefetch [%i2+0x020],23
	smul	%l2,%l2,%l5
	and	%l5,%l6,%l0
	jmpl	%g6+8,%g0
	subc	%l5,%l6,%l3
p2_call_0_le:
	prefetch [%i3+0x0c0],23
	xor	%l0,%l7,%l3
	ldx	[%i2+0x0e8],%l7		! Mem[00000000190000e8]
	ldx	[%o3+0x068],%l5		! Mem[0000000031800068]
	prefetch [%i2+0x180],21
	and	%l1,%l6,%l4
	retl
	ldstub	[%i1+0x0b8],%l3		! Mem[00000000188000b8]
p2_jmpl_0_lo:
	prefetch [%o2+0x020],23
	smul	%l2,%l2,%l5
	and	%l5,%l6,%l0
	jmpl	%g6+8,%g0
	subc	%l5,%l6,%l3
p2_call_0_lo:
	prefetch [%o3+0x0c0],23
	xor	%l0,%l7,%l3
	ldx	[%o2+0x0e8],%l7		! Mem[00000000190000e8]
	ldx	[%i3+0x068],%l5		! Mem[0000000031800068]
	prefetch [%o2+0x180],21
	and	%l1,%l6,%l4
	retl
	ldstub	[%o1+0x0b8],%l3		! Mem[00000000188000b8]
p2_jmpl_0_he:
	addc	%l2,%l0,%l0
	prefetch [%i1+0x180],1
	sdiv	%l7,-0xe67,%l1
	sdiv	%l7,0x032,%l4
	jmpl	%g6+8,%g0
	srax	%l2,%l5,%l3
p2_call_0_he:
	sll	%l3,0x00e,%l3
	orcc	%l0,0x306,%l7
	ldx	[%i3+0x1b8],%l6		! Mem[00000000198001b8]
	retl
	ldsb	[%i2+0x040],%l3		! Mem[0000000019000040]
p2_jmpl_0_ho:
	addc	%l2,%l0,%l0
	prefetch [%o1+0x180],1
	sdiv	%l7,-0xe67,%l1
	sdiv	%l7,0x032,%l4
	jmpl	%g6+8,%g0
	srax	%l2,%l5,%l3
p2_call_0_ho:
	sll	%l3,0x00e,%l3
	orcc	%l0,0x306,%l7
	ldx	[%o3+0x1b8],%l6		! Mem[00000000198001b8]
	retl
	ldsb	[%o2+0x040],%l3		! Mem[0000000019000040]
p3_jmpl_0_le:
	nop
	jmpl	%g6+8,%g0
	ldub	[%i2+0x16e],%l5		! Mem[000000001d00016e]
p3_call_0_le:
	andncc	%l1,%l6,%l1
	ldsh	[%i2+0x040],%l0		! Mem[000000001d000040]
	retl
	sdivx	%l5,-0x5f1,%l4
p3_jmpl_0_lo:
	nop
	jmpl	%g6+8,%g0
	ldub	[%o2+0x16e],%l5		! Mem[000000001d00016e]
p3_call_0_lo:
	andncc	%l1,%l6,%l1
	ldsh	[%o2+0x040],%l0		! Mem[000000001d000040]
	retl
	sdivx	%l5,-0x5f1,%l4
p3_jmpl_0_he:
	smul	%l2,0x153,%l1
	orn	%l6,%l3,%l6
	jmpl	%g6+8,%g0
	sth	%l6,[%i1+0x050]		! Mem[000000001c800050]
p3_call_0_he:
	udivx	%l7,-0x59c,%l5
	or	%l1,-0xbdb,%l2
	prefetch [%i1+0x140],22
	retl
	prefetch [%i0+0x080],16
p3_jmpl_0_ho:
	smul	%l2,0x153,%l1
	orn	%l6,%l3,%l6
	jmpl	%g6+8,%g0
	sth	%l6,[%o1+0x050]		! Mem[000000001c800050]
p3_call_0_ho:
	udivx	%l7,-0x59c,%l5
	or	%l1,-0xbdb,%l2
	prefetch [%o1+0x140],22
	retl
	prefetch [%o0+0x080],16
user_jump0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	taddcc	%l0,0xe88,%l1
	andn	%l1,-0x767,%l7
	srlx	%l1,%l0,%l0
	jmpl	%g6+8,%g0
	prefetch [%i3+0x080],0
p0_call_1_le:
	prefetch [%i5+0x0a0],1
	retl
	nop
p0_jmpl_1_lo:
	taddcc	%l0,0xe88,%l1
	andn	%l1,-0x767,%l7
	srlx	%l1,%l0,%l0
	jmpl	%g6+8,%g0
	prefetch [%o3+0x080],0
p0_call_1_lo:
	prefetch [%o5+0x0a0],1
	retl
	nop
p0_jmpl_1_he:
	ldub	[%i3+0x041],%l4		! Mem[0000000011800041]
	orcc	%l5,%l7,%l2
	xorcc	%l7,%l5,%l1
	jmpl	%g6+8,%g0
	sth	%l3,[%i1+0x096]		! Mem[0000000010800096]
p0_call_1_he:
	prefetch [%i3+0x0a0],4
	orcc	%l2,-0xde3,%l4
	retl
	sllx	%l3,0x019,%l4
p0_jmpl_1_ho:
	ldub	[%o3+0x041],%l4		! Mem[0000000011800041]
	orcc	%l5,%l7,%l2
	xorcc	%l7,%l5,%l1
	jmpl	%g6+8,%g0
	sth	%l3,[%o1+0x096]		! Mem[0000000010800096]
p0_call_1_ho:
	prefetch [%o3+0x0a0],4
	orcc	%l2,-0xde3,%l4
	retl
	sllx	%l3,0x019,%l4
p1_jmpl_1_le:
	ldsw	[%o0+0x01c],%l3		! Mem[000000003000001c]
	addccc	%l6,-0xe18,%l2
	sra	%l1,%l7,%l2
	jmpl	%g6+8,%g0
	andcc	%l0,%l7,%l7
p1_call_1_le:
	nop
	xorcc	%l2,%l1,%l0
	retl
	prefetch [%i3+0x060],20
p1_jmpl_1_lo:
	ldsw	[%i0+0x01c],%l3		! Mem[000000003000001c]
	addccc	%l6,-0xe18,%l2
	sra	%l1,%l7,%l2
	jmpl	%g6+8,%g0
	andcc	%l0,%l7,%l7
p1_call_1_lo:
	nop
	xorcc	%l2,%l1,%l0
	retl
	prefetch [%o3+0x060],20
p1_jmpl_1_he:
	prefetch [%i5+0x1e0],20
	andcc	%l7,%l1,%l4
	jmpl	%g6+8,%g0
	prefetch [%i3+0x1c0],22
p1_call_1_he:
	retl
	prefetch [%i3+0x080],22
p1_jmpl_1_ho:
	prefetch [%o5+0x1e0],20
	andcc	%l7,%l1,%l4
	jmpl	%g6+8,%g0
	prefetch [%o3+0x1c0],22
p1_call_1_ho:
	retl
	prefetch [%o3+0x080],22
p2_jmpl_1_le:
	smul	%l5,-0x12f,%l3
	andcc	%l1,%l5,%l3
	stw	%l3,[%o0+0x068]		! Mem[0000000030000068]
	add	%l4,%l5,%l1
	jmpl	%g6+8,%g0
	andcc	%l7,0x524,%l5
p2_call_1_le:
	ldstub	[%o0+0x067],%l1		! Mem[0000000030000067]
	ldsw	[%i2+0x054],%l5		! Mem[0000000019000054]
	prefetch [%i1+0x080],16
	retl
	or	%l2,%l6,%l6
p2_jmpl_1_lo:
	smul	%l5,-0x12f,%l3
	andcc	%l1,%l5,%l3
	stw	%l3,[%i0+0x068]		! Mem[0000000030000068]
	add	%l4,%l5,%l1
	jmpl	%g6+8,%g0
	andcc	%l7,0x524,%l5
p2_call_1_lo:
	ldstub	[%i0+0x067],%l1		! Mem[0000000030000067]
	ldsw	[%o2+0x054],%l5		! Mem[0000000019000054]
	prefetch [%o1+0x080],16
	retl
	or	%l2,%l6,%l6
p2_jmpl_1_he:
	sth	%l0,[%i0+0x142]		! Mem[0000000018000142]
	umul	%l6,%l4,%l2
	jmpl	%g6+8,%g0
	ldsw	[%o2+0x028],%l5		! Mem[0000000031000028]
p2_call_1_he:
	udivcc	%l0,0x564,%l4
	udivx	%l1,-0x66b,%l2
	orncc	%l3,0x1de,%l1
	addccc	%l2,%l0,%l7
	sdivcc	%l0,-0x2d8,%l0
	retl
	mulx	%l2,%l3,%l1
p2_jmpl_1_ho:
	sth	%l0,[%o0+0x142]		! Mem[0000000018000142]
	umul	%l6,%l4,%l2
	jmpl	%g6+8,%g0
	ldsw	[%i2+0x028],%l5		! Mem[0000000031000028]
p2_call_1_ho:
	udivcc	%l0,0x564,%l4
	udivx	%l1,-0x66b,%l2
	orncc	%l3,0x1de,%l1
	addccc	%l2,%l0,%l7
	sdivcc	%l0,-0x2d8,%l0
	retl
	mulx	%l2,%l3,%l1
p3_jmpl_1_le:
	lduw	[%i2+0x0d0],%l0		! Mem[000000001d0000d0]
	srax	%l4,0x02d,%l5
	sll	%l3,%l4,%l4
	stw	%l6,[%i3+0x0f0]		! Mem[000000001d8000f0]
	orncc	%l0,-0x6af,%l1
	jmpl	%g6+8,%g0
	sllx	%l7,%l2,%l1
p3_call_1_le:
	add	%l4,-0xe4d,%l6
	retl
	std	%l2,[%i0+0x008]		! Mem[000000001c000008]
p3_jmpl_1_lo:
	lduw	[%o2+0x0d0],%l0		! Mem[000000001d0000d0]
	srax	%l4,0x02d,%l5
	sll	%l3,%l4,%l4
	stw	%l6,[%o3+0x0f0]		! Mem[000000001d8000f0]
	orncc	%l0,-0x6af,%l1
	jmpl	%g6+8,%g0
	sllx	%l7,%l2,%l1
p3_call_1_lo:
	add	%l4,-0xe4d,%l6
	retl
	std	%l2,[%o0+0x008]		! Mem[000000001c000008]
p3_jmpl_1_he:
	add	%l5,0x87f,%l1
	sdivx	%l7,0x8f3,%l1
	umul	%l1,-0x36c,%l2
	andcc	%l7,-0x502,%l6
	jmpl	%g6+8,%g0
	ldd	[%o2+0x078],%l4		! Mem[0000000031000078]
p3_call_1_he:
	sllx	%l3,%l0,%l0
	sdivcc	%l6,0x7d1,%l7
	orcc	%l3,-0x8a9,%l3
	sllx	%l4,0x016,%l3
	andncc	%l7,0xe9f,%l0
	sdivx	%l6,-0xf7b,%l1
	retl
	addccc	%l0,-0x6db,%l2
p3_jmpl_1_ho:
	add	%l5,0x87f,%l1
	sdivx	%l7,0x8f3,%l1
	umul	%l1,-0x36c,%l2
	andcc	%l7,-0x502,%l6
	jmpl	%g6+8,%g0
	ldd	[%i2+0x078],%l4		! Mem[0000000031000078]
p3_call_1_ho:
	sllx	%l3,%l0,%l0
	sdivcc	%l6,0x7d1,%l7
	orcc	%l3,-0x8a9,%l3
	sllx	%l4,0x016,%l3
	andncc	%l7,0xe9f,%l0
	sdivx	%l6,-0xf7b,%l1
	retl
	addccc	%l0,-0x6db,%l2
user_jump1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	subccc	%l4,-0xcb0,%l5
	std	%l2,[%o2+0x048]		! Mem[0000000031000048]
	andncc	%l4,-0x6c0,%l1
	orcc	%l5,%l4,%l6
	jmpl	%g6+8,%g0
	taddcc	%l7,%l2,%l6
p0_call_2_le:
	prefetch [%i3+0x080],20
	smul	%l4,%l0,%l7
	prefetch [%i3+0x0a0],22
	retl
	ldub	[%o1+0x049],%l3		! Mem[0000000030800049]
p0_jmpl_2_lo:
	subccc	%l4,-0xcb0,%l5
	std	%l2,[%i2+0x048]		! Mem[0000000031000048]
	andncc	%l4,-0x6c0,%l1
	orcc	%l5,%l4,%l6
	jmpl	%g6+8,%g0
	taddcc	%l7,%l2,%l6
p0_call_2_lo:
	prefetch [%o3+0x080],20
	smul	%l4,%l0,%l7
	prefetch [%o3+0x0a0],22
	retl
	ldub	[%i1+0x049],%l3		! Mem[0000000030800049]
p0_jmpl_2_he:
	ldx	[%o2+0x000],%l4		! Mem[0000000031000000]
	srlx	%l2,%l1,%l5
	xnor	%l4,-0x724,%l3
	prefetch [%i3+0x080],3
	prefetch [%i2+0x0a0],23
	ldub	[%i3+0x09e],%l7		! Mem[000000001180009e]
	jmpl	%g6+8,%g0
	addccc	%l5,-0x5dc,%l3
p0_call_2_he:
	smulcc	%l4,0xbb5,%l6
	sll	%l1,0x002,%l6
	umul	%l0,%l3,%l6
	retl
	tsubcc	%l0,%l1,%l7
p0_jmpl_2_ho:
	ldx	[%i2+0x000],%l4		! Mem[0000000031000000]
	srlx	%l2,%l1,%l5
	xnor	%l4,-0x724,%l3
	prefetch [%o3+0x080],3
	prefetch [%o2+0x0a0],23
	ldub	[%o3+0x09e],%l7		! Mem[000000001180009e]
	jmpl	%g6+8,%g0
	addccc	%l5,-0x5dc,%l3
p0_call_2_ho:
	smulcc	%l4,0xbb5,%l6
	sll	%l1,0x002,%l6
	umul	%l0,%l3,%l6
	retl
	tsubcc	%l0,%l1,%l7
p1_jmpl_2_le:
	ldsh	[%i0+0x02a],%l2		! Mem[000000001400002a]
	addc	%l0,%l0,%l0
	prefetch [%i0+0x1c0],23
	jmpl	%g6+8,%g0
	orcc	%l0,0x2cb,%l5
p1_call_2_le:
	xor	%l2,-0xa4f,%l1
	prefetch [%i2+0x060],16
	udivx	%l1,0x444,%l3
	retl
	tsubcc	%l4,%l3,%l5
p1_jmpl_2_lo:
	ldsh	[%o0+0x02a],%l2		! Mem[000000001400002a]
	addc	%l0,%l0,%l0
	prefetch [%o0+0x1c0],23
	jmpl	%g6+8,%g0
	orcc	%l0,0x2cb,%l5
p1_call_2_lo:
	xor	%l2,-0xa4f,%l1
	prefetch [%o2+0x060],16
	udivx	%l1,0x444,%l3
	retl
	tsubcc	%l4,%l3,%l5
p1_jmpl_2_he:
	sdivcc	%l0,0x651,%l1
	sdivx	%l4,-0x3ea,%l7
	jmpl	%g6+8,%g0
	srax	%l0,0x02e,%l4
p1_call_2_he:
	prefetch [%i1+0x1c0],1
	tsubcc	%l0,-0x1eb,%l3
	andn	%l7,%l4,%l3
	retl
	srl	%l2,0x016,%l7
p1_jmpl_2_ho:
	sdivcc	%l0,0x651,%l1
	sdivx	%l4,-0x3ea,%l7
	jmpl	%g6+8,%g0
	srax	%l0,0x02e,%l4
p1_call_2_ho:
	prefetch [%o1+0x1c0],1
	tsubcc	%l0,-0x1eb,%l3
	andn	%l7,%l4,%l3
	retl
	srl	%l2,0x016,%l7
p2_jmpl_2_le:
	addccc	%l3,-0x409,%l7
	sll	%l6,0x00a,%l1
	prefetch [%i3+0x0c0],2
	mulx	%l2,%l7,%l6
	jmpl	%g6+8,%g0
	addc	%l2,%l3,%l2
p2_call_2_le:
	nop
	ldsh	[%i3+0x190],%l4		! Mem[0000000019800190]
	retl
	ldx	[%i0+0x0e0],%l0		! Mem[00000000180000e0]
p2_jmpl_2_lo:
	addccc	%l3,-0x409,%l7
	sll	%l6,0x00a,%l1
	prefetch [%o3+0x0c0],2
	mulx	%l2,%l7,%l6
	jmpl	%g6+8,%g0
	addc	%l2,%l3,%l2
p2_call_2_lo:
	nop
	ldsh	[%o3+0x190],%l4		! Mem[0000000019800190]
	retl
	ldx	[%o0+0x0e0],%l0		! Mem[00000000180000e0]
p2_jmpl_2_he:
	andcc	%l3,0xc26,%l3
	ldx	[%i0+0x1c8],%l3		! Mem[00000000180001c8]
	srl	%l4,0x009,%l5
	jmpl	%g6+8,%g0
	orncc	%l7,%l4,%l4
p2_call_2_he:
	subccc	%l3,-0xf8b,%l1
	retl
	swap	[%i2+0x11c],%l7		! Mem[000000001900011c]
p2_jmpl_2_ho:
	andcc	%l3,0xc26,%l3
	ldx	[%o0+0x1c8],%l3		! Mem[00000000180001c8]
	srl	%l4,0x009,%l5
	jmpl	%g6+8,%g0
	orncc	%l7,%l4,%l4
p2_call_2_ho:
	subccc	%l3,-0xf8b,%l1
	retl
	swap	[%o2+0x11c],%l7		! Mem[000000001900011c]
p3_jmpl_2_le:
	jmpl	%g6+8,%g0
	addccc	%l7,-0x862,%l3
p3_call_2_le:
	srlx	%l5,%l6,%l7
	udivcc	%l5,0x7d5,%l2
	xnorcc	%l4,%l4,%l0
	prefetch [%i3+0x1c0],1
	ldsw	[%i1+0x180],%l5		! Mem[000000001c800180]
	swap	[%o1+0x07c],%l1		! Mem[000000003080007c]
	retl
	sth	%l4,[%o0+0x038]		! Mem[0000000030000038]
p3_jmpl_2_lo:
	jmpl	%g6+8,%g0
	addccc	%l7,-0x862,%l3
p3_call_2_lo:
	srlx	%l5,%l6,%l7
	udivcc	%l5,0x7d5,%l2
	xnorcc	%l4,%l4,%l0
	prefetch [%o3+0x1c0],1
	ldsw	[%o1+0x180],%l5		! Mem[000000001c800180]
	swap	[%i1+0x07c],%l1		! Mem[000000003080007c]
	retl
	sth	%l4,[%i0+0x038]		! Mem[0000000030000038]
p3_jmpl_2_he:
	prefetch [%i2+0x020],0
	std	%l2,[%i1+0x090]		! Mem[000000001c800090]
	prefetch [%i2+0x0c0],1
	ldd	[%o1+0x030],%l4		! Mem[0000000030800030]
	jmpl	%g6+8,%g0
	andn	%l2,%l0,%l6
p3_call_2_he:
	smul	%l6,%l7,%l6
	smul	%l7,-0x675,%l7
	and	%l6,%l3,%l1
	retl
	udiv	%l7,-0x4e5,%l3
p3_jmpl_2_ho:
	prefetch [%o2+0x020],0
	std	%l2,[%o1+0x090]		! Mem[000000001c800090]
	prefetch [%o2+0x0c0],1
	ldd	[%i1+0x030],%l4		! Mem[0000000030800030]
	jmpl	%g6+8,%g0
	andn	%l2,%l0,%l6
p3_call_2_ho:
	smul	%l6,%l7,%l6
	smul	%l7,-0x675,%l7
	and	%l6,%l3,%l1
	retl
	udiv	%l7,-0x4e5,%l3
user_jump2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	srax	%l5,0x015,%l0
	umul	%l7,-0xa60,%l4
	jmpl	%g6+8,%g0
	xnor	%l7,%l6,%l7
p0_call_3_le:
	retl
	lduh	[%i0+0x018],%l2		! Mem[0000000010000018]
p0_jmpl_3_lo:
	srax	%l5,0x015,%l0
	umul	%l7,-0xa60,%l4
	jmpl	%g6+8,%g0
	xnor	%l7,%l6,%l7
p0_call_3_lo:
	retl
	lduh	[%o0+0x018],%l2		! Mem[0000000010000018]
p0_jmpl_3_he:
	ldd	[%o3+0x048],%l6		! Mem[0000000031800048]
	subc	%l0,-0x541,%l4
	jmpl	%g6+8,%g0
	ldstub	[%i0+0x058],%l4		! Mem[0000000010000058]
p0_call_3_he:
	lduw	[%i2+0x0f0],%l7		! Mem[00000000110000f0]
	srl	%l5,%l4,%l4
	retl
	smul	%l6,%l3,%l6
p0_jmpl_3_ho:
	ldd	[%i3+0x048],%l6		! Mem[0000000031800048]
	subc	%l0,-0x541,%l4
	jmpl	%g6+8,%g0
	ldstub	[%o0+0x058],%l4		! Mem[0000000010000058]
p0_call_3_ho:
	lduw	[%o2+0x0f0],%l7		! Mem[00000000110000f0]
	srl	%l5,%l4,%l4
	retl
	smul	%l6,%l3,%l6
p1_jmpl_3_le:
	prefetch [%i3+0x140],0
	sra	%l5,0x01a,%l3
	udiv	%l5,0x9a2,%l0
	jmpl	%g6+8,%g0
	sub	%l1,%l7,%l0
p1_call_3_le:
	udiv	%l7,0x504,%l0
	prefetch [%i3+0x000],0
	sub	%l3,%l2,%l1
	subccc	%l0,%l6,%l0
	sub	%l1,%l7,%l7
	retl
	udivcc	%l6,0x390,%l3
p1_jmpl_3_lo:
	prefetch [%o3+0x140],0
	sra	%l5,0x01a,%l3
	udiv	%l5,0x9a2,%l0
	jmpl	%g6+8,%g0
	sub	%l1,%l7,%l0
p1_call_3_lo:
	udiv	%l7,0x504,%l0
	prefetch [%o3+0x000],0
	sub	%l3,%l2,%l1
	subccc	%l0,%l6,%l0
	sub	%l1,%l7,%l7
	retl
	udivcc	%l6,0x390,%l3
p1_jmpl_3_he:
	prefetch [%i1+0x080],2
	mulx	%l1,0x27d,%l6
	jmpl	%g6+8,%g0
	ldsw	[%o1+0x01c],%l1		! Mem[000000003080001c]
p1_call_3_he:
	stw	%l2,[%i2+0x14c]		! Mem[000000001500014c]
	sth	%l3,[%i1+0x188]		! Mem[0000000014800188]
	srlx	%l0,0x016,%l6
	sdivx	%l7,-0xd0a,%l5
	addccc	%l7,%l2,%l3
	retl
	prefetch [%i1+0x160],20
p1_jmpl_3_ho:
	prefetch [%o1+0x080],2
	mulx	%l1,0x27d,%l6
	jmpl	%g6+8,%g0
	ldsw	[%i1+0x01c],%l1		! Mem[000000003080001c]
p1_call_3_ho:
	stw	%l2,[%o2+0x14c]		! Mem[000000001500014c]
	sth	%l3,[%o1+0x188]		! Mem[0000000014800188]
	srlx	%l0,0x016,%l6
	sdivx	%l7,-0xd0a,%l5
	addccc	%l7,%l2,%l3
	retl
	prefetch [%o1+0x160],20
p2_jmpl_3_le:
	umulcc	%l5,-0xfcd,%l6
	jmpl	%g6+8,%g0
	xnorcc	%l6,%l4,%l2
p2_call_3_le:
	retl
	udivx	%l5,-0xa24,%l0
p2_jmpl_3_lo:
	umulcc	%l5,-0xfcd,%l6
	jmpl	%g6+8,%g0
	xnorcc	%l6,%l4,%l2
p2_call_3_lo:
	retl
	udivx	%l5,-0xa24,%l0
p2_jmpl_3_he:
	sdivx	%l0,0x47f,%l5
	stx	%l5,[%o2+0x068]		! Mem[0000000031000068]
	subc	%l7,0xc64,%l1
	jmpl	%g6+8,%g0
	stx	%l5,[%o3+0x028]		! Mem[0000000031800028]
p2_call_3_he:
	xnorcc	%l1,%l6,%l1
	ldsw	[%o3+0x024],%l3		! Mem[0000000031800024]
	retl
	prefetch [%i0+0x1e0],16
p2_jmpl_3_ho:
	sdivx	%l0,0x47f,%l5
	stx	%l5,[%i2+0x068]		! Mem[0000000031000068]
	subc	%l7,0xc64,%l1
	jmpl	%g6+8,%g0
	stx	%l5,[%i3+0x028]		! Mem[0000000031800028]
p2_call_3_ho:
	xnorcc	%l1,%l6,%l1
	ldsw	[%i3+0x024],%l3		! Mem[0000000031800024]
	retl
	prefetch [%o0+0x1e0],16
p3_jmpl_3_le:
	std	%l4,[%i3+0x078]		! Mem[000000001d800078]
	jmpl	%g6+8,%g0
	orncc	%l0,-0x955,%l2
p3_call_3_le:
	udivx	%l3,-0x1cf,%l0
	retl
	prefetch [%i3+0x140],20
p3_jmpl_3_lo:
	std	%l4,[%o3+0x078]		! Mem[000000001d800078]
	jmpl	%g6+8,%g0
	orncc	%l0,-0x955,%l2
p3_call_3_lo:
	udivx	%l3,-0x1cf,%l0
	retl
	prefetch [%o3+0x140],20
p3_jmpl_3_he:
	subccc	%l6,0xf77,%l5
	sub	%l2,%l0,%l3
	jmpl	%g6+8,%g0
	ldstub	[%o1+0x07c],%l1		! Mem[000000003080007c]
p3_call_3_he:
	sdivcc	%l2,0x393,%l7
	smulcc	%l2,-0x85f,%l1
	sth	%l1,[%o0+0x034]		! Mem[0000000030000034]
	retl
	prefetch [%i1+0x0c0],4
p3_jmpl_3_ho:
	subccc	%l6,0xf77,%l5
	sub	%l2,%l0,%l3
	jmpl	%g6+8,%g0
	ldstub	[%i1+0x07c],%l1		! Mem[000000003080007c]
p3_call_3_ho:
	sdivcc	%l2,0x393,%l7
	smulcc	%l2,-0x85f,%l1
	sth	%l1,[%i0+0x034]		! Mem[0000000030000034]
	retl
	prefetch [%o1+0x0c0],4
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
	.word	0x293c8f00,0x2f1ff740		! Init value for %l0
	.word	0xb7e99cff,0x96a98845		! Init value for %l1
	.word	0xb74f46ff,0x9ca37224		! Init value for %l2
	.word	0xc0a5d7ff,0xf9193750		! Init value for %l3
	.word	0x36b54100,0x254deb01		! Init value for %l4
	.word	0xde5177ff,0x90eb0195		! Init value for %l5
	.word	0xdf8f8dff,0xbcbccfd7		! Init value for %l6
	.word	0xce653d00,0x1cd3b70c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xd0ad2e9d,0x3ff59ba0		! Init value for %f0 
	.word	0xa0c94b69,0x1551e8f9		! Init value for %f2 
	.word	0x72cec9f9,0xc92a1b68		! Init value for %f4 
	.word	0x72b6f658,0x40f28255		! Init value for %f6 
	.word	0x235102fa,0xc84f0ef5		! Init value for %f8 
	.word	0x8d4e2cf4,0xa6a356ba		! Init value for %f10
	.word	0x3d0b4d9a,0xe185878f		! Init value for %f12
	.word	0x7fc20bdb,0x181e451b		! Init value for %f14
	.word	0x0a94bcc5,0x42783361		! Init value for %f16
	.word	0x006d1af2,0xc3306ec9		! Init value for %f18
	.word	0x35a2eb9e,0xac9a84bc		! Init value for %f20
	.word	0x522d03e5,0xa33e7f9c		! Init value for %f22
	.word	0x3266facd,0x403a59ac		! Init value for %f24
	.word	0xfe924147,0xb8481758		! Init value for %f26
	.word	0x61d8eec7,0xfcb7588c		! Init value for %f28
	.word	0x7c91042c,0x5610245a		! Init value for %f30
	.word	0xe7eee5a2,0x0f4f2920		! Init value for %f32
	.word	0xa57eb456,0x75e2b980		! Init value for %f34
	.word	0x44351ada,0xbdf996aa		! Init value for %f36
	.word	0x3fbad1ed,0x85441c3f		! Init value for %f38
	.word	0x5b29e578,0x106344bc		! Init value for %f40
	.word	0xd459cfd1,0x9f382ee0		! Init value for %f42
	.word	0x00166f9b,0x3508311a		! Init value for %f44
	.word	0xe203c613,0x35987bb8		! Init value for %f46
	.word	0xd720ccb0,0x635f662a
	.word	0xee3a6781,0x896627fa
	.word	0x52395286,0x9cc6d99b
	.word	0x003344ab,0xc63ef10e
	.word	0x4ebefac5,0x2cf0c5e2
	.word	0xebfc1b7e,0x721069af
	.word	0x6cb53aef,0x4220de00
	.word	0x1e10639e,0x82bda038
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
	.word	0x00000000,0x000f8880
	.word	0xffffffff,0xffffdaf6
	.word	0x00000000,0x00001080
	.word	0x00000000,0x000f8880
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000898d
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x00000000,0x42783361
	.word	0x42783361,0x7fc20bdb
	.word	0x00000000,0x40f94000
	.word	0x00000000,0x40f94000
	.word	0x41d09e0c,0xd8400000
	.word	0x3ff00000,0x00000000
	.word	0x42783361,0x7fc20bfb
	.word	0x00000000,0x00000002
	.word	0x0000002b,0x40f94000
	.word	0x00000000,0x80000000
	.word	0x00000000,0x00000000
	.word	0x3f800000,0xffc20bdb
	.word	0x8000002b,0x40f94000
	.word	0x7fc20bdb,0x00000000
	.word	0x40000000,0x83361000
	.word	0x00000000,0x00000000
	.word	0xe7eee5a2,0x0f4f2920
	.word	0xa57eb456,0x75e2b980
	.word	0x44351ada,0xbdf996aa
	.word	0x3fbad1ed,0x85441c3f
	.word	0x5b29e578,0x106344bc
	.word	0xd459cfd1,0x9f382ee0
	.word	0x00166f9b,0x3508311a
	.word	0xe203c613,0x35987bb8
p0_local0_expect:
	.word	0xffffffff,0xfffffdff
	.word	0x00001080,0x000f8880
	.word	0x53603e31,0x7681715c
	.word	0xd54991f9,0x4297efad
	.word	0x00000000,0x4194d77e
	.word	0xc9d3804d,0x92bd6cae
	.word	0x1080fffa,0x120800e0
	.word	0xf5a8f03f,0xa69cf491
	.word	0xa82a238c,0xdd3d3fc4
	.word	0x00000000,0x0aa2584c
	.word	0xf37d8132,0x650f6bfa
	.word	0xffba3c25,0x739d53dd
	.word	0xffffffff,0x0000f4ef
	.word	0x883c0420,0x168156ea
	.word	0xc7aff753,0x2cb11c76
	.word	0x8c328861,0x49ca7764
	.word	0x53884cd6,0xfa161430
	.word	0xde534ff3,0x03f265d6
	.word	0xa8b4cb04,0x9cd17c71
	.word	0x1bb15978,0xd3254276
	.word	0x84fd2903,0x000004bd
	.word	0xc376e82b,0xcb5d8158
	.word	0xacbc0d16,0x15a58130
	.word	0x34dc35d7,0xfc6f0e44
	.word	0xd0000000,0x00000000
	.word	0xe71dbe31,0xd4960275
	.word	0x2f2d8861,0x45f6a47f
	.word	0x45e0d7b5,0x7d5c7658
	.word	0xeccad8bf,0x4434fd7c
	.word	0x000000ee,0x2d44cc48
	.word	0x8fc13d84,0x3b4f1d39
	.word	0x1144898d,0x00000000
p0_local1_expect:
	.word	0x00000000,0x60ef6800
	.word	0xff000000,0x00000000
	.word	0x2a5f79ff,0x52720c4d
	.word	0xf749576f,0x2a88a344
	.word	0xad90b1ef,0xad90be39
	.word	0x08c02fd5,0x07632b3e
	.word	0x68a2a3fb,0x76827014
	.word	0xef303575,0x896aadd3
	.word	0x2a6e5c1f,0x65e32feb
	.word	0x70d731fd,0xbbfa77e6
	.word	0x0c0aa23f,0x00000000
	.word	0x5fffd378,0x0ed8c0fd
	.word	0xa815f184,0x65c4e7c7
	.word	0xc7bf98d9,0xc0499f93
	.word	0x525a5cbd,0x9f8cdc7c
	.word	0xc1fe3de0,0xb4cf6148
	.word	0x023d51dd,0x79447e35
	.word	0x9cf03e2b,0xd7ea426e
	.word	0x00000000,0xfffff1e5
	.word	0xef810c31,0x60a788d1
	.word	0x65ef1ecd,0x92547def
	.word	0x2b314f1e,0x04cc417a
	.word	0xe936b709,0x2294a60e
	.word	0x4bff3d66,0x9707ce10
	.word	0x37002b6e,0x1650a75d
	.word	0x1ea758a0,0x52ba4f23
	.word	0x000febda,0xa063e835
	.word	0xd69ea451,0x9a3e7001
	.word	0x4cd4ff5e,0xa4bcff04
	.word	0x6a181252,0xcd9bfd59
	.word	0x74eab275,0xc9095129
	.word	0x82663350,0xe0c74b7e
p0_local2_expect:
	.word	0x00000000,0x00000000
	.word	0xf1f58b51,0x10810000
	.word	0x4fd489d5,0x41e506ff
	.word	0x69b83a29,0x82bdc505
	.word	0xc52d121e,0x9cdee2a4
	.word	0xdd88fc08,0x661e60cb
	.word	0x296dee45,0x3ffa1678
	.word	0xdf00c0ae,0x44fe3393
	.word	0x1fc0f412,0xf7473fcc
	.word	0x14edc444,0x522d21db
	.word	0xc10abedd,0xda35c580
	.word	0x00000000,0xfffffb00
	.word	0xf6f7fe90,0x1aae8224
	.word	0xaf1b7190,0x002ea8d6
	.word	0x9ab613a4,0x1ffd134a
	.word	0x00000000,0x00000001
	.word	0x56953e07,0x25888530
	.word	0xe792e7a6,0x7ca83cc4
	.word	0x42d2c873,0x072fbd2a
	.word	0x7506de4b,0x0acda0fd
	.word	0x00000000,0xb8d7c61e
	.word	0x6aa84371,0x45f231ef
	.word	0x0ced8258,0x86bc6f67
	.word	0xac8a2096,0x61de6d74
	.word	0x401229b1,0xba8cc8e8
	.word	0xa9efde10,0xc242dc3b
	.word	0xdec30c52,0x7869ad2d
	.word	0x2e58437d,0xf3e1ea58
	.word	0xb0d9ad0c,0x0badda62
	.word	0x32c60000,0xc120dd72
	.word	0xb83cfa8b,0x1a14efca
	.word	0x4a0f3f5f,0x0e4d3dbf
p0_local3_expect:
	.word	0xaeafb420,0x934c08f0
	.word	0x00000000,0x00000000
	.word	0x95e5cfe8,0x8f34ffa3
	.word	0xeae7050d,0x3e04b9cc
	.word	0x39d163a7,0xcc7ef476
	.word	0xdcf43600,0xa6f07569
	.word	0x7d5c81c1,0xa87d426c
	.word	0x00000000,0x00000000
	.word	0xe9485e13,0x96e16506
	.word	0x60d41cfc,0x7d3ead0e
	.word	0x5d978c5f,0xeca9dd69
	.word	0xd539f6ad,0x68b45486
	.word	0x00000000,0x00000000
	.word	0xffc1b065,0x39a016ef
	.word	0xffffffff,0xffffffff
	.word	0xe8d1f9c7,0x580476f0
	.word	0xc09f6831,0x57b3ce81
	.word	0x0edfb572,0x9434a731
	.word	0x00c5fc01,0x4194d77e
	.word	0xeebe99cf,0x50476582
	.word	0x555555ff,0x00000000
	.word	0x57a0c86b,0xacb4bc6c
	.word	0xe407e562,0x6f4b4df4
	.word	0xf426cc8b,0x00000000
	.word	0x00b4506d,0xce4fa829
	.word	0x49012a74,0x604c775f
	.word	0x02d80334,0xeae6a8e3
	.word	0x96319ea1,0x3452a1f7
	.word	0xfaafacd7,0xdab5d1e7
	.word	0xfb10d895,0x854fd999
	.word	0xe6c31dc6,0xab5a0be0
	.word	0x00000000,0x000000ff
p0_local4_expect:
	.word	0x00000000,0xff94d2b4
	.word	0x41b64570,0x1454aef0
	.word	0xd4013916,0xeeac4b27
	.word	0x06a073b8,0xae7e1e98
	.word	0x2147052d,0x890ceff1
	.word	0xa9446a12,0x2faeb0b9
	.word	0x18e7e097,0x7da4f969
	.word	0x973cae1c,0xb7c2dd95
	.word	0x49120aac,0x40110eff
	.word	0x9d4e1e28,0xf44e8160
	.word	0x04dbddc3,0x59527295
	.word	0x14487306,0x63a6a46b
	.word	0xdbb15c0d,0x607aa555
	.word	0xd50c65c7,0xa9fdd7f8
	.word	0x383cdac7,0x02909e47
	.word	0xe3bcf0d8,0x7b69fc27
	.word	0x3ef1bd6c,0x5d3fa8a1
	.word	0x1b5a0935,0x2d5e3af3
	.word	0xe3292daa,0x08ad1dd4
	.word	0xdef9e937,0x6f00cfa4
	.word	0x410f3cdb,0xeab93d44
	.word	0xc1fab7a8,0x04a24021
	.word	0x92f464ff,0x6d862033
	.word	0xc75f7005,0x309e5a1c
	.word	0x84425520,0xc7b9dbe7
	.word	0x55893c00,0xe8d197ce
	.word	0xa5ee2c63,0x79e0881a
	.word	0x89a23b61,0x3b90863f
	.word	0x7a0b8c38,0xe08832ff
	.word	0xc357d500,0xcd84988f
	.word	0xba2c3048,0xca8933b7
	.word	0xf8f807bc,0x7787fd20
p0_local5_expect:
	.word	0x8eb31891,0x8b8aa832
	.word	0x69716a72,0xffe464dd
	.word	0xb296de42,0x6b41017f
	.word	0x8e1cf394,0x0a7dacbf
	.word	0x617503a2,0x863f4c8c
	.word	0xcdd0087e,0x6bae4ac2
	.word	0x3cb0257e,0xe914b955
	.word	0x5e2995ec,0xd5627f57
	.word	0x787a8adc,0xe3cde66f
	.word	0x5d27cb89,0xc9aba3a2
	.word	0xa25764c1,0x223b664e
	.word	0x9e886ae0,0xb8808082
	.word	0x76ea67ec,0x6dac7445
	.word	0x83fb510a,0x0c2a2f32
	.word	0xfc5f9520,0x6f93fec4
	.word	0xebc15a7c,0xcdfea74a
	.word	0xf6452de5,0x66af3b35
	.word	0xf058c805,0x1780651a
	.word	0xc694f97a,0x6b00cdfb
	.word	0xeb1536f6,0x5d50fbfd
	.word	0xa63796ac,0xc716f10e
	.word	0x4da75e69,0x9c78c93f
	.word	0xac464e47,0x4e0d9b55
	.word	0x17c34f1f,0x95fec07b
	.word	0x7155325a,0x86f0ff72
	.word	0x0aa2d3c8,0x3076a985
	.word	0xc3eb27f5,0x85c163dd
	.word	0xea71b65e,0x0a065d8e
	.word	0x6283e35c,0x74e43ec0
	.word	0x803fb59c,0xfd1ab76e
	.word	0x344a5983,0x002b6466
	.word	0xe7bc5643,0xef1bb3e6
p0_local6_expect:
	.word	0x966046d2,0x71d6065c
	.word	0x00000000,0x00000000
	.word	0xf47495c2,0x52e3c2a6
	.word	0x834c8f94,0x025f1d4a
	.word	0x054f9ad1,0x03e11535
	.word	0x2e81322a,0x50951ed1
	.word	0xa429d746,0x27fae430
	.word	0x642bfe79,0x2a50bf87
	.word	0xdf104eb0,0xdb3a36c5
	.word	0x72da1ac5,0x0d75f150
	.word	0x2c2549fc,0xf0618667
	.word	0xa45761aa,0x4fe22840
	.word	0x6044a21c,0xdef66429
	.word	0x757ad678,0x111c4534
	.word	0x8e749411,0x9817cd69
	.word	0x426d8e9c,0xf76e89d5
	.word	0xc2b81794,0x455c4f21
	.word	0x9881f89d,0xbb90a741
	.word	0x10115707,0x4205d88a
	.word	0x787eb43a,0x75b3650d
	.word	0x4e606420,0x3b88463d
	.word	0x408e7710,0xc0b1ecf8
	.word	0xae5a94f6,0x28ca0f6c
	.word	0x3a1c2991,0xe362207e
	.word	0xdc6f59fd,0xbf621860
	.word	0x664c0691,0x6185d234
	.word	0xb3a638ea,0x220059eb
	.word	0x2ae08b6a,0xa09cf13b
	.word	0xe80fe02f,0x194e9743
	.word	0x1c80614a,0x25e912a1
	.word	0x325ab7bc,0xb9d5fe33
	.word	0x02e869f0,0xc19bb354
share0_expect:
	.word	0x00ffb120,0x1080ff82
	.word	0x5707ff11,0x4285daf6
	.word	0x00000eb1,0x02090562
	.word	0x0071a466,0xffffffff
	.word	0xff32ffff,0xffffc2de
	.word	0x00000000,0x00000000
	.word	0xff005e66,0x085f428c
	.word	0x3bffffff,0x8ab88000
	.word	0x1cffab8f,0x879eb436
	.word	0xf53a95b3,0xfff3a65f
	.word	0x4cf6a711,0x000000ff
	.word	0x0000303f,0x76022326
	.word	0xffc53171,0xecff8891
	.word	0xff8a6660,0x0012ce3e
	.word	0xfe0b4953,0x00000000
	.word	0x7f9fb1f0,0xc491e839
share1_expect:
	.word	0x00000000,0x00008880
	.word	0x67b34320,0x00001080
	.word	0xffff04aa,0x6017df28
	.word	0x744e3802,0x7568b7b5
	.word	0x00000000,0x00001770
	.word	0x00000077,0x7d4fabbf
	.word	0xfff0ecc7,0x000000a4
	.word	0xffffffff,0xffff8ab8
	.word	0x934bff69,0x114e8651
	.word	0xdc93b241,0x78fb9bfa
	.word	0x283fe896,0x000000ff
	.word	0x77005ae4,0xbdc5e552
	.word	0x4ddea900,0xffffffac
	.word	0xae00b2bb,0xe44feeef
	.word	0x00012cd2,0x6e6c8994
	.word	0x9800ff00,0x00000000
share2_expect:
	.word	0x00000000,0x55555500
	.word	0xffff8861,0x7bc7c000
	.word	0x000000a5,0xe9ffff45
	.word	0x000000a8,0x00000000
	.word	0xffffff81,0xb498fc4a
	.word	0x1b475bf0,0x35127347
	.word	0x6d144a37,0xfe855d0b
	.word	0x7fffffff,0x00000000
	.word	0x00000000,0x00ff0fff
	.word	0xffffffff,0xffffffff
	.word	0x360cffe2,0xe1d6ae90
	.word	0xd88bfbac,0x4baa4539
	.word	0x00001770,0x4dff0af0
	.word	0x000040a5,0x00000b82
	.word	0xfd50ffae,0x74f97d69
	.word	0x7fffffff,0x8e38ffc6
share3_expect:
	.word	0x39290b36,0x320b0a3f
	.word	0xd7be0d90,0x6ad840af
	.word	0x2320746f,0xff8f0ccd
	.word	0x00000052,0x14f53edb
	.word	0x9aeb448c,0xffffffff
	.word	0x00005482,0x438045bf
	.word	0xa0000000,0xff645d4e
	.word	0x7462e8e6,0x000d748d
	.word	0xe1748a1b,0x934c08f0
	.word	0x7bc70000,0x114e8651
	.word	0xe22ade79,0x00176e50
	.word	0x2b37be41,0x78f9c0f6
	.word	0x0d10adac,0x00000000
	.word	0xf6721d2e,0x00000000
	.word	0x000000b4,0xfffffffd
	.word	0x00000add,0x8dfdebcb
share4_expect:
p1_init_registers:
	.word	0x5d02f500,0x3c7f1718		! Init value for %l0
	.word	0x742263ff,0xd107f247		! Init value for %l1
	.word	0x7c60f000,0x7acce717		! Init value for %l2
	.word	0x936ce0ff,0xd5460001		! Init value for %l3
	.word	0xf94a54ff,0xeb2931cb		! Init value for %l4
	.word	0xbfbeb8ff,0x8ad8a7de		! Init value for %l5
	.word	0x80f81d00,0x746a98dd		! Init value for %l6
	.word	0xed5737ff,0xbeb48d62		! Init value for %l7
	.align	64
p1_init_freg:
	.word	0x97ded231,0xf54e6e94		! Init value for %f0 
	.word	0xbe63e46c,0x5281b70e		! Init value for %f2 
	.word	0x063f7733,0x210bbf05		! Init value for %f4 
	.word	0x563195c4,0x57a97321		! Init value for %f6 
	.word	0x534d69fd,0xdb9dbfe1		! Init value for %f8 
	.word	0x4d7da985,0x8b572294		! Init value for %f10
	.word	0x51a5a97a,0xa4c33ff7		! Init value for %f12
	.word	0x30b3876d,0x95a3ac27		! Init value for %f14
	.word	0x049faad1,0xfa3d44f0		! Init value for %f16
	.word	0x7ecaf98a,0x8e42958f		! Init value for %f18
	.word	0xbdecf989,0x2527715b		! Init value for %f20
	.word	0x71fa8ce8,0x5fcb2b57		! Init value for %f22
	.word	0xd1c7aa5f,0x22584f61		! Init value for %f24
	.word	0xedf4e569,0x80033039		! Init value for %f26
	.word	0xee0654aa,0x2c43579c		! Init value for %f28
	.word	0xc7464a5f,0x61a139d5		! Init value for %f30
	.word	0x4c431600,0xe1ebddad		! Init value for %f32
	.word	0xe6294e44,0x60281648		! Init value for %f34
	.word	0x6fed0991,0xead4853b		! Init value for %f36
	.word	0x7bc805e0,0xe8b5fd3e		! Init value for %f38
	.word	0x4e94f16b,0x71f81844		! Init value for %f40
	.word	0x6bd0da55,0x4118fdd7		! Init value for %f42
	.word	0xf2ad35ae,0x16c55036		! Init value for %f44
	.word	0x2b0e7ed8,0xf8fc05be		! Init value for %f46
	.word	0x98ec4bd0,0xe24f28c2
	.word	0x3e7f1bc8,0x0b6fa842
	.word	0xdb70438e,0xe45e88b2
	.word	0xbd42d950,0xac19630d
	.word	0xf38f9d10,0x0e19012f
	.word	0xb6364fb0,0x136abc24
	.word	0x3ceb4efa,0xa4e66f2c
	.word	0x105aa5e5,0xbf73e60a
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
	.word	0x00000000,0x00000000
	.word	0x00007362,0x00000000
	.word	0x00000000,0x0c55dbbe
	.word	0x00000000,0x00005e3e
	.word	0x00000000,0xffffffff
	.word	0xffffffff,0xc2eb20b1
	.word	0x00000000,0x0000360c
	.word	0x00000000,0x00000000
p1_expected_fp_regs:
	.word	0x3ff00000,0x00000000
	.word	0x56000000,0x80000000
	.word	0xffffffff,0xe0000000
	.word	0xc1d02000,0x00000000
	.word	0x42c00000,0x00000000
	.word	0x00000000,0x00000060
	.word	0xbf800000,0x80000000
	.word	0x00000000,0x56000000
	.word	0xbf800000,0x80000000
	.word	0x3ff00000,0x00000000
	.word	0x80000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xee0654aa,0x00000000
	.word	0x00000000,0x80000000
	.word	0xffffffff,0xffffffff
	.word	0xbf800000,0x80000000
	.word	0x4c431600,0xe1ebddad
	.word	0xe6294e44,0x60281648
	.word	0x6fed0991,0xead4853b
	.word	0x7bc805e0,0xe8b5fd3e
	.word	0x4e94f16b,0x71f81844
	.word	0x6bd0da55,0x4118fdd7
	.word	0xf2ad35ae,0x16c55036
	.word	0x2b0e7ed8,0xf8fc05be
p1_local0_expect:
	.word	0x05ffffff,0x0000baeb
	.word	0x0000ffff,0xfffff9d6
	.word	0x1dc0e45b,0x4d9c4145
	.word	0xb70c4dbf,0x026256cf
	.word	0x1e6bfad9,0x2d991a4e
	.word	0xd7c0364e,0x80c55cc3
	.word	0xc2fd4b9d,0xaaa923b9
	.word	0x168580e8,0x16a4513a
	.word	0x74fc4be1,0x00000766
	.word	0xb3b5217e,0x2ee9b4b6
	.word	0xa1aab09f,0x42d32b5e
	.word	0xba459adc,0x21fe9acd
	.word	0xcaaecc80,0x9b7fd978
	.word	0xffa2d46b,0x8ed0595a
	.word	0x46bc5d52,0x125415d6
	.word	0x920445e0,0xce4f8193
	.word	0x0000033c,0xc72f746f
	.word	0xcf831b28,0x72a21a89
	.word	0x97a765c9,0x32b75d27
	.word	0x72ffe235,0x612c80da
	.word	0x97910a70,0xf77cb344
	.word	0xb77a10ce,0x79f22923
	.word	0xb9ef3af1,0xbb010aba
	.word	0x9a4190ca,0x8e7a3952
	.word	0xab852ebd,0xdb5de8cd
	.word	0xa86e50d8,0xcd3b098e
	.word	0xfbc7f07e,0x95072c47
	.word	0x18553429,0xbb575f88
	.word	0xffffe694,0x557314d4
	.word	0xfb2c83ab,0x793f8262
	.word	0x8fc95951,0xababc3ee
	.word	0xe3417349,0x8ffa4c18
	.word	0xb6ca26eb,0x3a4db76d
	.word	0x49dc16fb,0x1fb15864
	.word	0xd5dd3b10,0xbe6d708c
	.word	0x00000000,0xe9ffffba
	.word	0x395e6662,0x831086a3
	.word	0xb5fc62ff,0x6e1761aa
	.word	0xfffde130,0x0000303f
	.word	0xf993ffff,0xa52cc4b1
	.word	0xe9051289,0x532b64c8
	.word	0xef8063b9,0x0a585e3e
	.word	0x4d40f6d8,0xc30a98a3
	.word	0xcd8ed7e0,0x40f94ec6
	.word	0xef1bea1d,0x53fa9e8f
	.word	0x69e34e4e,0x4b893b4e
	.word	0xab910fd3,0xb80e6019
	.word	0x4cb28d3f,0x6f5d0c92
	.word	0x00000075,0x542084cd
	.word	0xf7713b66,0x2115086c
	.word	0x7eccf737,0xd6955bc3
	.word	0x72fa15e5,0xd64ccc99
	.word	0xb08cf012,0xb6bb4220
	.word	0xd2620222,0xd4e6472f
	.word	0x00001dc8,0xe2eb3c42
	.word	0xf4bd3934,0x26c21450
	.word	0x746627ee,0xd55c0fa0
	.word	0xfff93f09,0x7688b7f3
	.word	0x2eb4e19c,0xaf4ad437
	.word	0x48679ee0,0x24502405
	.word	0x752a2799,0xf37019d3
	.word	0x3be2c333,0x000000b7
	.word	0x889b1dcc,0x1bd9a1a3
	.word	0x73ea7928,0xb118b7ff
p1_local1_expect:
	.word	0xff8f0ccd,0x00002115
	.word	0x0019b02e,0x00000000
	.word	0x49299f76,0x3c084c49
	.word	0x9d480e62,0x77a72489
	.word	0x44c47a53,0x7fea7517
	.word	0x625b73e0,0xf65ba442
	.word	0x7617217b,0x3be472ec
	.word	0x96ea33f8,0x414972ba
	.word	0xaab37307,0x1ea53b82
	.word	0x516559c4,0xc2f3bc9a
	.word	0x12e3c72f,0x0b74fd31
	.word	0xb5efab72,0x9eb828ed
	.word	0x067e0df7,0x479e508c
	.word	0xd920cf6c,0x725d6783
	.word	0xf28f6ab3,0xceeccd4b
	.word	0x00000000,0xb97656d3
	.word	0x36e564aa,0xe86e5e53
	.word	0x8e2ed013,0xcd064ee9
	.word	0x51b66550,0x77ed7433
	.word	0xff14cb75,0x2e4e80e8
	.word	0xb46e9004,0x42799b84
	.word	0x4505bc42,0xf0247578
	.word	0xd9d5e177,0xbb5f82e0
	.word	0x4ff7dc88,0x81679930
	.word	0x8aa3d8c9,0xa8985701
	.word	0x130a9830,0x0c55dbbe
	.word	0x04d6f765,0xa2f2b963
	.word	0xdfb41632,0xd3875a67
	.word	0x00000000,0x00000377
	.word	0x0c80db72,0x6238ff36
	.word	0xc42c50c2,0xe2553979
	.word	0xa04ece0a,0x1e18eedd
	.word	0x5c98548d,0x3119c990
	.word	0x4c16ce69,0xb7f5629f
	.word	0xb23f0660,0x91b1d329
	.word	0xe1030cee,0x3d5d81ea
	.word	0xaa15cfdb,0xfffff05e
	.word	0xcac59051,0xebe24c57
	.word	0x9f00629c,0xf35af5fe
	.word	0x2e218f7b,0x41c4bd79
	.word	0x72ee7b79,0x4c697066
	.word	0x2c8809f8,0x87534db2
	.word	0x7d615c28,0xd762116b
	.word	0x44b70c2c,0xba52c3e3
	.word	0x0196f707,0x8cc8e975
	.word	0x3d253db8,0xf4c9614b
	.word	0x3f78665e,0x07f3f6da
	.word	0xcdeb2f64,0x80f34dff
	.word	0x6c227dbd,0x07de27e1
	.word	0xedd2d38d,0x97f11f4d
	.word	0x0897e6ce,0x79f3852b
	.word	0xa3be866e,0xc8fac922
	.word	0x948f5dc1,0xda88b06d
	.word	0x59f55304,0x2ccb5eed
	.word	0xd67cdc02,0xc94d817b
	.word	0xe72af33b,0x285338e5
	.word	0x05859e65,0x22e682ad
	.word	0x5581b859,0xa4c085a8
	.word	0xe463f633,0x016d6382
	.word	0x744e3802,0x29140997
	.word	0x8e735e1b,0x63ea3d1d
	.word	0x1bf2071e,0x65d02aa2
	.word	0xe57ff152,0x309d3827
	.word	0x916dfb9b,0x47396a05
p1_local2_expect:
	.word	0x00000000,0x04aa0000
	.word	0xff000071,0xcfc0ffff
	.word	0x0695260e,0xd66142c2
	.word	0x80962479,0x34a336b4
	.word	0x2d5163ff,0xd1e0a594
	.word	0xb1d9589d,0x0fc0097d
	.word	0x473ad515,0x31158d1d
	.word	0xc2eb20b1,0xef24fe90
	.word	0xd9fa63b5,0x486df32f
	.word	0x76fe9a5d,0xe5462962
	.word	0xc32f7057,0xffffffb1
	.word	0x5837a4ff,0xc0f072c5
	.word	0x6ef78fe2,0x07efa77b
	.word	0x1e83ebd0,0xeb3198ee
	.word	0x8d899bdd,0x8f0a5d35
	.word	0x5f8c370e,0x2914ba93
	.word	0x21673448,0x9acd82a5
	.word	0x1c391fa5,0x04431e90
	.word	0x85a0fe0c,0xfe02328d
	.word	0x62b2c43b,0x00000000
	.word	0xd7c352eb,0x5c906c5c
	.word	0x15bb6b7d,0xe0975bc1
	.word	0xc3209536,0x5163d449
	.word	0xf3e5469c,0x998678ff
	.word	0x4da252ff,0x88100109
	.word	0x155b66f4,0xceefe2e0
	.word	0x943517e5,0x6089a92c
	.word	0xb71a325f,0xedb5681e
	.word	0xe2b2675a,0x25766667
	.word	0xcbae3685,0x4c91a2b1
	.word	0xaf22d93f,0x145d3320
	.word	0x094654b7,0xd15c3e20
	.word	0xfd9940f4,0xf0a72e7a
	.word	0x4d5beba3,0xa49b83c9
	.word	0x153057a8,0xcbcb2569
	.word	0x00000036,0x00000000
	.word	0x0000baeb,0x0000009f
	.word	0x0c19b02e,0x00000000
	.word	0xdcd26da8,0x17cd215e
	.word	0x8a4b5e8b,0x25d39116
	.word	0xf61c8408,0x5c250248
	.word	0xee785a8b,0x745c9b14
	.word	0xab83a0a6,0x5553291c
	.word	0xfe4049a4,0x8b97f8d5
	.word	0x3f308989,0xedf12a0d
	.word	0x9a65edfe,0x6505b94d
	.word	0x651783f3,0xcb8052c5
	.word	0xd346ef0a,0x871e8b5f
	.word	0x81444acc,0x61f5cb7e
	.word	0x9aa91399,0x90eb632b
	.word	0x1f119a30,0x0cedc4d0
	.word	0x00000000,0x09fd29f9
	.word	0x4ad19997,0x415f5aab
	.word	0xbe632a18,0xa8ed8e9b
	.word	0x1c3696e4,0x238f448a
	.word	0xa1987e7c,0x2b84cc40
	.word	0x9c8d3c51,0x7308b43f
	.word	0xf5564892,0x54b4ab09
	.word	0x4a70a172,0x247713b7
	.word	0xffffffff,0x0000baeb
	.word	0x0c04a9fa,0xfcdd5bec
	.word	0xe3c7264c,0x000000bc
	.word	0x54959267,0x0ceca6fe
	.word	0xcc9eed72,0x3602b7ff
p1_local3_expect:
	.word	0xea00ba30,0x00000000
	.word	0xff00303f,0x00000000
	.word	0x21564330,0x69532e71
	.word	0xd05912bc,0x732a6be7
	.word	0xf46e630d,0x47c32dc9
	.word	0x3b01fa7a,0x1ff25189
	.word	0xad6657ef,0xf79e0000
	.word	0x1995eae6,0xebed3d04
	.word	0x59a77efc,0xb2b57b73
	.word	0x74daeda8,0xe1d6ae90
	.word	0x87ec7aee,0xbf4989c9
	.word	0xc93a9f86,0xadcbd481
	.word	0xa554a944,0x41469f2d
	.word	0x8e9de251,0x24c6e480
	.word	0x2d4e2d3e,0xfd6932c2
	.word	0x087a26f7,0x15bf85e7
	.word	0x995cfb18,0x97128665
	.word	0x52f26b9f,0x5338b498
	.word	0xddd4a42b,0x7174e818
	.word	0x8c9dca92,0x6ebf1265
	.word	0x14086a23,0x27026214
	.word	0xabb67908,0x57978915
	.word	0x9e5ede7b,0x8891822a
	.word	0x94f5189d,0x550f5005
	.word	0x15ebe2cc,0x8a508cf5
	.word	0x7fe18ac9,0x3bfa145a
	.word	0xd679ee4f,0x2e446fa6
	.word	0xf8ff28ac,0x00000000
	.word	0xac514b3d,0xbb791264
	.word	0x47f2c8a1,0xc61d280c
	.word	0x6e3bfad0,0xfcb946ae
	.word	0xdcb46049,0x164422e3
	.word	0x356c975d,0x41963961
	.word	0x105daba6,0x1b1cf51b
	.word	0x2ad37b0e,0x81bc7db7
	.word	0x276498cd,0xc0895629
	.word	0x78a44c5b,0xffffffff
	.word	0x00000000,0x00000002
	.word	0x7b595134,0x8b03c004
	.word	0xaf509439,0x14c5d0d3
	.word	0xd4694b0b,0xbc59245c
	.word	0x39e1fa50,0x4329d83c
	.word	0xa7f5067a,0x592a00d8
	.word	0xaab3bc42,0xb599cb92
	.word	0x00000000,0xffffffff
	.word	0xefc20621,0xa142442c
	.word	0x71a67b97,0x87a14c53
	.word	0x2102ee17,0x5b1d62a6
	.word	0x60c377da,0x0698161c
	.word	0x65a0dfdb,0x15d0f308
	.word	0x98481c4c,0xbcba419c
	.word	0x8ab5bc82,0xc777e88c
	.word	0x2289c7f2,0x0217cc46
	.word	0x98468377,0xa4bfe089
	.word	0xc1997c02,0xfc50c09f
	.word	0x4f42d882,0xea6471d0
	.word	0x6a76a948,0xe81fe9e7
	.word	0xe3861dc5,0x1ce62c58
	.word	0x9bed5110,0x2e8f9ebf
	.word	0x28c2fee4,0x3f0f9683
	.word	0x68115cb1,0x519375ea
	.word	0x9ddafabc,0xa972ebb6
	.word	0x23a52f6f,0x5a6af5f8
	.word	0x5a95985b,0x81ebd40d
p1_local4_expect:
	.word	0x92000fe5,0xffd7f470
	.word	0xa50ef2c4,0xda6e2d0a
	.word	0xb8e83534,0x3cddecc6
	.word	0x47e9db95,0xbe620fef
	.word	0x49d14ef2,0x2a484dae
	.word	0xd19c06ec,0xfb35f7cd
	.word	0x49e42e3a,0x7501f88c
	.word	0xbbdc692d,0x873c9e39
	.word	0x72d1c68e,0x6632669b
	.word	0x031bc25f,0x42003506
	.word	0x7abc9a0f,0x6a0895ac
	.word	0xc7b8ec35,0xe1864b4b
	.word	0x462e7a74,0xca00e7f6
	.word	0x2604931f,0x4ea19dfb
	.word	0xce1e1dc8,0x0f69d0af
	.word	0x34c869a1,0x4e5b4bb6
	.word	0x00e920c8,0x6465d461
	.word	0x5851e237,0x0a24b1fb
	.word	0xdd207bd3,0xdd01758b
	.word	0x9834a543,0x6701c08f
	.word	0x41b69871,0xc66b3438
	.word	0xa409e148,0x4dd72989
	.word	0xa3b9e5fb,0xa8ca07a5
	.word	0x42a02740,0x2cfe2b2b
	.word	0xdb5a65ad,0x4354aeb0
	.word	0xfa73b253,0xc7aec78b
	.word	0xb08cc153,0x0e95d74e
	.word	0x4be126cd,0xdd16bf6f
	.word	0x09b0e4e3,0x297b66ce
	.word	0x1cfbb6fb,0xb7a6379c
	.word	0x143efa70,0xba5e4233
	.word	0x93237abe,0x17d2f8d9
	.word	0xf4dac36b,0x226601f0
	.word	0x1336d555,0x5d87f1a5
	.word	0xb425ce31,0xd6ea909f
	.word	0xe669bbb2,0xc69d1b3d
	.word	0x059002b6,0x46d21461
	.word	0xd5ffbc44,0x639c48c8
	.word	0x00a86140,0x6428dfc5
	.word	0x285e175b,0x55d4d649
	.word	0x7aa94d28,0x97837ca5
	.word	0x55213194,0x9ecf7d86
	.word	0x02f0565f,0x0f04ac65
	.word	0x733df7f4,0xc1f5ca26
	.word	0xd2f19dae,0x7d0df47b
	.word	0xdb5bcc86,0xeb3642c7
	.word	0xf797a6c0,0x1d692764
	.word	0x193e1d6b,0xe58588e1
	.word	0xf5584987,0xe30b4871
	.word	0xc004a072,0x59c9ec41
	.word	0xffffffab,0x69c1a062
	.word	0x9845d509,0x0963f53b
	.word	0xa490e1b0,0xf12199aa
	.word	0x357254fa,0xbe5946bc
	.word	0xe3e9c37d,0x725aeed5
	.word	0x1a20512e,0x25cd78dd
	.word	0xecd8e67e,0x609ef190
	.word	0x58992e46,0x9620d3e1
	.word	0xe523e238,0x34f3eb74
	.word	0x03d1696b,0x45283079
	.word	0x5dc5da85,0x71bb66d2
	.word	0x4ac6e2b4,0x16d5029a
	.word	0x006740ef,0x01e8ab3a
	.word	0xaa0519c7,0x829ceb12
p1_local5_expect:
	.word	0x5a194ee6,0x03d09b55
	.word	0xb80ec8b5,0xf514018f
	.word	0x8532cab9,0x4a1ee16f
	.word	0xa5a7f932,0x19be8400
	.word	0x70ed594b,0xae8feb97
	.word	0x056f04e2,0xab0dc710
	.word	0x18b6a9e2,0xe332f5cf
	.word	0xcaa1e322,0x4876c94e
	.word	0xfecbd1e4,0x4a18d6b4
	.word	0x56f59259,0xdf41c1c7
	.word	0x994e0ec6,0xc079f636
	.word	0x3ec97e5e,0xa2b2ee10
	.word	0x813fa866,0xda30bf88
	.word	0xdcb1edd9,0x16c4517d
	.word	0x90d09423,0x51f987c4
	.word	0xcafb3d0e,0xd086ffce
	.word	0xe0eca615,0x46a8ecac
	.word	0xf3769346,0xb3050000
	.word	0xeb467889,0x1f4eb3a5
	.word	0xc85d31ae,0xc37add30
	.word	0x61a7461d,0xc18f1ca4
	.word	0xce656570,0x700a59b2
	.word	0x161babce,0x6d9b5afa
	.word	0x1b091c09,0xf8d640ce
	.word	0x0f408deb,0x942c62ed
	.word	0xa124574d,0x6f3a661f
	.word	0xd67129a4,0x41908c3d
	.word	0x42d7fd7a,0x46f6b20a
	.word	0xb935cda5,0xd096fc0d
	.word	0xfa3d5796,0x82d29e0a
	.word	0x4047e4f6,0x7c694d5a
	.word	0x7831680c,0x331ad79d
	.word	0xc9e51d43,0x8c3a5f8a
	.word	0x3a513e58,0xec2528a7
	.word	0xd130880d,0x9afbdcef
	.word	0xa9ceb672,0x6d54ec3e
	.word	0x46b9f588,0xabc5554d
	.word	0xad4f234b,0x4b428176
	.word	0x93d924fb,0x51513040
	.word	0xcb5d7c18,0x8bd85120
	.word	0x3f81fe48,0xed93d7ec
	.word	0xdbb15033,0x2e122b5d
	.word	0x4ccd7a77,0x3b447f08
	.word	0xbb29b0e5,0xbda49221
	.word	0xab5b1b32,0x7878cfc5
	.word	0x504af5a6,0x6075d13f
	.word	0x4bcb1b2b,0xe1540c09
	.word	0x51d7c5fe,0x2823465f
	.word	0xe6ff5053,0xcd5d0547
	.word	0x635d429e,0x0acae807
	.word	0x22aeb5d0,0x47332c3f
	.word	0x3116d215,0xf4dd3a03
	.word	0xefcf0d6f,0xa13aff26
	.word	0xa8513704,0x168086b6
	.word	0x106274c5,0xc8affcd3
	.word	0xedd14569,0xbe1bf32a
	.word	0x4682e1de,0xd3db5443
	.word	0x21c53d75,0x588d54f3
	.word	0x68fdf159,0x149864fa
	.word	0xce8119b3,0xf02b0a57
	.word	0x7ed90c86,0xde344037
	.word	0x0e06b1e2,0xf1ba56b9
	.word	0xec7ebecd,0x47e3fdcb
	.word	0x6a17eaa0,0x9c4b98d4
p1_local6_expect:
	.word	0xc6de64e6,0x7a72757b
	.word	0x3cafd8a2,0xa7238620
	.word	0xda09e781,0x427a9f0a
	.word	0x1df6d9d8,0xaceb81d6
	.word	0x811e85be,0x6a152728
	.word	0x9d828f1a,0xb4f754a9
	.word	0x3c1a748f,0xb35e215f
	.word	0xf36a62ea,0xab8902ed
	.word	0xa8a6252a,0xb600ed0c
	.word	0x149eecf7,0xbb2a0128
	.word	0x3cc395a7,0x9303bdcc
	.word	0x86e27774,0xe3e0425e
	.word	0x6a88c14f,0x7b99d5f3
	.word	0x2cf0cb09,0xd4fe62d2
	.word	0x2188f851,0xba57bb87
	.word	0x5b48e8e4,0x87d92a0b
	.word	0x00000000,0x50ed477b
	.word	0x919b9664,0x5a971a4d
	.word	0xe0957235,0x2dc19e2b
	.word	0x1432861c,0x9ec8e5fc
	.word	0x4e096db1,0xa460f176
	.word	0xdbe1b88c,0xebc50352
	.word	0x490e6cb9,0xa82f2658
	.word	0xd2e3118d,0xae47f92b
	.word	0x65940bdb,0x35ab6ca0
	.word	0x842732c9,0x6640834a
	.word	0x1eb17ba7,0xcdf65988
	.word	0xbfe46760,0xe8b23150
	.word	0xec3e3ff4,0x0a9fae4b
	.word	0x1f28944e,0xfdfaab1d
	.word	0x59cb1036,0x1a0224a4
	.word	0x0b3ab058,0x27bb766e
	.word	0x0174f856,0x4e960fb2
	.word	0x1f39b99c,0xf93dd47e
	.word	0x6e6999d3,0xacda7ea7
	.word	0x257f894b,0xff699744
	.word	0xd997d99d,0x36d2ab7f
	.word	0xa5ef406c,0xc95dfdb2
	.word	0x959dd5d1,0xbad9d225
	.word	0x3b3b2ac6,0xc6ecaa3d
	.word	0x7ba673e2,0xdb95db1b
	.word	0x68c0074d,0xe66442e2
	.word	0x409fd821,0x0fed8af3
	.word	0xc86a2d81,0x611eeaac
	.word	0x9dc5ca66,0xde6cac2a
	.word	0x8dba8408,0x6bfa5b14
	.word	0xc9150493,0x2a245a83
	.word	0x2d621acd,0x8bc700d5
	.word	0x2b61fb91,0xa2ad9b2e
	.word	0xfd9984ca,0xba06765e
	.word	0x827e4bda,0x2451a458
	.word	0x8149e6c8,0xdabf25b9
	.word	0x3707b06f,0xb3a98660
	.word	0x6bba88e0,0x4e223551
	.word	0xe56e226d,0xfcbaa66c
	.word	0x5f0248b5,0x0d38686b
	.word	0x68a5f331,0x5a8318a4
	.word	0x6464bbca,0xfee10267
	.word	0x6589e893,0x99c9165f
	.word	0x4f403003,0xb8ff2e09
	.word	0x36fbd31c,0x4c9bec2a
	.word	0x385e3e1d,0xe114c64f
	.word	0xbe13e730,0xbcf8b4c6
	.word	0x1ba9ff5c,0x00f08dac
p2_init_registers:
	.word	0xbb7beaff,0xc30bb067		! Init value for %l0
	.word	0x51c51e00,0x09a04f78		! Init value for %l1
	.word	0xa69eeeff,0xc8f6bcb2		! Init value for %l2
	.word	0x58c83aff,0xf46acc1d		! Init value for %l3
	.word	0x3cfb1400,0x7b2c990c		! Init value for %l4
	.word	0xf5380100,0x3e5551e5		! Init value for %l5
	.word	0x323d7d00,0x44a3f638		! Init value for %l6
	.word	0xf69be1ff,0xf406fbe7		! Init value for %l7
	.align	64
p2_init_freg:
	.word	0x3ade65f7,0x3f7819eb		! Init value for %f0 
	.word	0xad176057,0x4bed7399		! Init value for %f2 
	.word	0x3a35430b,0x6d62d6b3		! Init value for %f4 
	.word	0x49ee9cbc,0x2a255f76		! Init value for %f6 
	.word	0xba158c73,0xf8c7b132		! Init value for %f8 
	.word	0x1738ec2b,0x119e54a1		! Init value for %f10
	.word	0x24b31ad1,0x6b100c18		! Init value for %f12
	.word	0x804f6119,0xf5461a4d		! Init value for %f14
	.word	0x12b4ebf0,0xb58f40cf		! Init value for %f16
	.word	0xbc1aa725,0x6171270d		! Init value for %f18
	.word	0xabe66954,0x76b35bab		! Init value for %f20
	.word	0x7db270e1,0xe87bdd5d		! Init value for %f22
	.word	0x78b91746,0x2eb7ab97		! Init value for %f24
	.word	0x8eff5fc7,0x76c03cb8		! Init value for %f26
	.word	0xa2fc6987,0xb01a8f4f		! Init value for %f28
	.word	0xdacf9ab3,0xcb78da30		! Init value for %f30
	.word	0x69a28594,0x1ad175ab		! Init value for %f32
	.word	0x0b6f18c8,0xa9a0822a		! Init value for %f34
	.word	0x6db2fdb8,0x8453c0cc		! Init value for %f36
	.word	0x53ec7497,0x52c5e88e		! Init value for %f38
	.word	0x757a0d5a,0xb5aa2770		! Init value for %f40
	.word	0x0185c31f,0x80bf4ab9		! Init value for %f42
	.word	0xc3398c78,0xc6337566		! Init value for %f44
	.word	0x9c927505,0xa144e6cf		! Init value for %f46
	.word	0xc1ac8035,0xff4d1b74
	.word	0xf52a2d12,0x9ef01e19
	.word	0x75df5754,0xa365aac5
	.word	0x365a66f0,0x0e7b81ca
	.word	0xe1a91279,0x5b59296b
	.word	0x1b1c15a2,0x005a40be
	.word	0xb7bb41ad,0x4c669e46
	.word	0x4669341a,0xd433b72d
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
	.word	0x00000000,0x0000018c
	.word	0xffffffff,0xfffff843
	.word	0xffffffff,0xffff4910
	.word	0xffffffff,0xffffffff
	.word	0xffffffa8,0xfa54dc1d
	.word	0x00000000,0xf6ffb957
	.word	0x00000000,0x00000115
	.word	0x00000000,0x00000c68
p2_expected_fp_regs:
	.word	0xb716fe95,0x3f800000
	.word	0x41d0a6d6,0xf5780000
	.word	0x00000000,0x00000018
	.word	0x4e813700,0xff0725d0
	.word	0x40380000,0x41c00000
	.word	0x40480000,0x20e00000
	.word	0xffffffff,0xff0725d0
	.word	0x00000000,0x00000018
	.word	0x40380000,0x00000000
	.word	0xffffffff,0xff0725d0
	.word	0x41d026e0,0x00000000
	.word	0xffffffff,0x409b8000
	.word	0x80000000,0x00000001
	.word	0xffffffff,0xe0000000
	.word	0x7fffffff,0xff0725d0
	.word	0xdacf9ab3,0xcb78da30
	.word	0x69a28594,0x1ad175ab
	.word	0x0b6f18c8,0xa9a0822a
	.word	0x6db2fdb8,0x8453c0cc
	.word	0x53ec7497,0x52c5e88e
	.word	0x757a0d5a,0xb5aa2770
	.word	0x0185c31f,0x80bf4ab9
	.word	0xc3398c78,0xc6337566
	.word	0x9c927505,0xa144e6cf
p2_local0_expect:
	.word	0x10000000,0x88000000
	.word	0x448c0000,0xf8a9115d
	.word	0x8f780170,0xf2081e22
	.word	0xff93c172,0x00000000
	.word	0x2a175555,0xe5f0b448
	.word	0x14f8824d,0x4e55b2fd
	.word	0x59d3de12,0xb71410e2
	.word	0x87663674,0x2da9ec5b
	.word	0xff7224ff,0x244c4a73
	.word	0x68c7b3d6,0xf8505c98
	.word	0x83aa2ac3,0xf44d871a
	.word	0x34e151c6,0x831df67f
	.word	0xb640d2d3,0xd9e23a0d
	.word	0xf8a9105e,0xa83ca97d
	.word	0x33a5d8ce,0xa2bb1c5e
	.word	0x43735cce,0xe05eb0e2
	.word	0xec8ed47f,0x8d4d677f
	.word	0xe3d1aca1,0xcad8ac5b
	.word	0xf40c5472,0x7ed8ddb8
	.word	0x1ae3ba97,0x1d6fe7f3
	.word	0xaea3b7df,0x2a77410a
	.word	0x833d3d2b,0xf69ae1ee
	.word	0x4ee28287,0x3a54859d
	.word	0xeece9c87,0xc64d2da2
	.word	0xba7aae94,0x5f759b5b
	.word	0xbde25dd8,0xb5cd329b
	.word	0x7d99bc0c,0xe97a3a02
	.word	0xd849c52b,0x6dfaa08e
	.word	0xeb5f1456,0x2cae1869
	.word	0xd14b4840,0xb075773b
	.word	0x19a8ddc4,0xe2f5079c
	.word	0xe4663897,0xd6b1b091
	.word	0x6431937f,0x6e23a922
	.word	0xb2fede03,0x860b81a2
	.word	0x84b4d130,0x63509993
	.word	0x4084b43a,0x5a44c687
	.word	0x6660389b,0x9f045b12
	.word	0x29893107,0xc01b2883
	.word	0x153bc086,0xfa884537
	.word	0xd55d1034,0xce174669
	.word	0x10871b55,0xbf1f9cd5
	.word	0x4ae167e8,0xe1271348
	.word	0x3072693d,0x6d400bff
	.word	0x0953a23d,0xd5fbad48
	.word	0x00000000,0x000000bf
	.word	0x136e4ca7,0x03471c1f
	.word	0x398018f6,0xe9786c2b
	.word	0x7d837e80,0x424be712
	.word	0x9b1550a0,0x3f1cc60e
	.word	0x823f5bff,0xffe17e61
	.word	0xf405ef31,0x5ed0a434
	.word	0x00000000,0x4dff0af0
	.word	0xb21da656,0x595a0332
	.word	0x0436f4b2,0x4186dea5
	.word	0x81743008,0x9693489d
	.word	0xa01d400a,0xeaa9dbfe
	.word	0xec032277,0xd46ff873
	.word	0x5fd6ae82,0xf0c6fdd3
	.word	0xa6a4ff0b,0xd986d262
	.word	0x224ec7a3,0xadb7b15c
	.word	0xcd772425,0x70933036
	.word	0xabb4c4bf,0x27f2b2a1
	.word	0xddcee017,0xf6edd9d0
	.word	0x5e5d8c8e,0xb31190ec
p2_local1_expect:
	.word	0x00000000,0xffffffff
	.word	0xffff0af0,0x438045bf
	.word	0x44425035,0xa99ed21c
	.word	0x1757cf7c,0xd5e17e71
	.word	0x9728c8a6,0x03cc0c9a
	.word	0x90843549,0xad1d06ee
	.word	0x735630d9,0x0464f303
	.word	0xc628972d,0x3d5c042c
	.word	0xf9a725ef,0x00000295
	.word	0x751bcdf6,0x5f9c6962
	.word	0xffac0af0,0x438045bf
	.word	0xe1901cd7,0x63d8b725
	.word	0x149b0dbe,0xe51425a3
	.word	0x0bb1ef7a,0x7d410468
	.word	0xa4148510,0x2a684f3b
	.word	0x9d95735b,0xd2e9b0a4
	.word	0x6b4fb96f,0x00000000
	.word	0x33450b7c,0x80e482d2
	.word	0x5de3888d,0x169ba2c6
	.word	0xbc8e77ac,0x0db92a22
	.word	0xbac9f82a,0x123c5052
	.word	0xac5a91d7,0x66a80ad7
	.word	0x51a746a6,0x725eee44
	.word	0x0ebc6c3a,0xd47c844b
	.word	0xe7100231,0x9dc2c90f
	.word	0x4667df67,0x4fde7c50
	.word	0x53e3a338,0xbc655f99
	.word	0x397d12e1,0x0248894f
	.word	0x4e193340,0xc224a8ef
	.word	0x110034bb,0xcab288de
	.word	0xa72c4279,0xafc3eeef
	.word	0xf66ed6eb,0xd9db731d
	.word	0x8f0ab4c5,0x1cc57be9
	.word	0x02b7c38e,0x5ce6ca81
	.word	0x6cd31e30,0xcdb913ea
	.word	0x280bfdf5,0xcf407e5d
	.word	0xb363bf5a,0xa88e58ed
	.word	0x1ed0a674,0x2044a997
	.word	0xe1c9486e,0xdf2dc6c1
	.word	0xbd5d3527,0xf9156235
	.word	0x7e19bcaa,0xf56a1899
	.word	0x38621c38,0xd95c4d9e
	.word	0xf9fe5914,0xa34e8d1b
	.word	0xb0231742,0x2175debf
	.word	0x882dffa5,0xcce5b133
	.word	0x350fc7b7,0xdaa57687
	.word	0x689fe224,0xa9eb95be
	.word	0xfb0ac406,0x394e27b9
	.word	0xc3ddb912,0xdfef27e9
	.word	0x976de30d,0x3c403033
	.word	0x16c08030,0x3916a7ab
	.word	0x3a7d70a7,0x4ae4af90
	.word	0x5602b2b6,0xc6b163e6
	.word	0x12f91c8d,0xcc5b5f93
	.word	0xde818ed5,0xc25b1e1e
	.word	0xbe1cd6c5,0xd665fa4b
	.word	0x636d21a9,0x41f0a181
	.word	0x4837981c,0xb0066eb8
	.word	0x351100de,0x7d4fabbf
	.word	0x4f4fffed,0x98bdbf97
	.word	0xf77c67d2,0x24550e10
	.word	0xff2e394a,0x55aca8f2
	.word	0x4a6c6135,0xeb2ff1fa
	.word	0xe01b49a7,0x00000000
p2_local2_expect:
	.word	0xff813684,0x35127347
	.word	0xc7000000,0x054c8400
	.word	0xa2719302,0x60f13cd5
	.word	0xbd11bbb1,0xeb44ef72
	.word	0x1036c189,0x8b5ea2a4
	.word	0xf3e962e6,0x58e92af2
	.word	0xdc5ccb26,0x13b47655
	.word	0xceea3172,0x9108c59d
	.word	0x00000000,0x00000000
	.word	0x90e91103,0x3243f6ab
	.word	0x085a1026,0x8b003874
	.word	0xc908becd,0xfe36e01c
	.word	0x8534eac9,0xd9c8f52a
	.word	0xba43ded6,0xa819706a
	.word	0xd7336e09,0x93eea149
	.word	0xa259ffa5,0x99070ae7
	.word	0x39be3e8b,0x5344661d
	.word	0x407eadac,0xb487ac94
	.word	0x331a5aa9,0xacae5c8c
	.word	0x34c5efaf,0xb53215cc
	.word	0x317ec128,0xcb8564c7
	.word	0x62771c93,0x00000000
	.word	0x73641e30,0xb204ff57
	.word	0xbbf77129,0x607a9bb2
	.word	0x4c38f7a7,0x6e548ce3
	.word	0x4c03c398,0x4ca97ce8
	.word	0x8fda765f,0x293fd5b7
	.word	0x6db3c43c,0xeb9cb1e6
	.word	0x5f98617a,0x004d8822
	.word	0xbce068fe,0xe09f1da9
	.word	0x3076741f,0xd721ad83
	.word	0x24ac539e,0x7a09a8dd
	.word	0x39f6fd06,0x44006b3a
	.word	0x1ad25ab7,0xcf134840
	.word	0xe1bf3237,0x3d9c7d05
	.word	0xc2185d5b,0xaa240778
	.word	0x45727e79,0xb75685c3
	.word	0x1257e5d7,0x28b67486
	.word	0x4c34d0cd,0x9c5e475f
	.word	0xfee68d20,0xb3572311
	.word	0x566c71fd,0x8b9b3c64
	.word	0x34857b8e,0x702d922c
	.word	0xcc61e89c,0x3ea1fff8
	.word	0x129a753d,0x3228e6ad
	.word	0xe9ce56ab,0xf367e88f
	.word	0xb87fff9e,0x06b55d78
	.word	0xcb2d6f1f,0x85a72db7
	.word	0xbf007cd5,0xc3bb1045
	.word	0x6635c914,0xc9b72f67
	.word	0xfaeacf2e,0xeac6d4e7
	.word	0x2a301625,0x413fdb22
	.word	0x977d1770,0x02f58a39
	.word	0xe8fc1460,0xd5b97f9d
	.word	0x0000cf2e,0xcc461e0a
	.word	0xe4140bce,0xeb045bdd
	.word	0x8ea14e8a,0x2c412255
	.word	0x6712a02c,0x32341161
	.word	0xef776270,0x8dc6e7c5
	.word	0x18363a09,0x36502758
	.word	0x00000000,0x00000002
	.word	0xf7c944fa,0x297be9f6
	.word	0xc286f368,0x8e5c8555
	.word	0x753896c1,0x88da5539
	.word	0x0c033735,0xde0c58cb
p2_local3_expect:
	.word	0x00000000,0x00000000
	.word	0xae00b2bb,0xe44feeef
	.word	0x9b4bd569,0x6425acf8
	.word	0xa5a43e9b,0x20bdbcf8
	.word	0x1c2d7c5f,0x1b0bfced
	.word	0xa67c708e,0xc53d245e
	.word	0x78e58235,0xb3afa77b
	.word	0xe03f5007,0xbc7c45cc
	.word	0x31885bf3,0x0e5258ef
	.word	0xbad22a6a,0x26f21087
	.word	0x388682cb,0x25b76174
	.word	0xcb1c978c,0xa480061c
	.word	0xc2b7f19a,0xc7c30493
	.word	0xafc61a4d,0x6889c658
	.word	0x410e61ff,0x330c0fcd
	.word	0x453dec1a,0x9857d104
	.word	0xd0e36021,0xbc93e4f5
	.word	0x3c46e8d5,0xea4b8880
	.word	0xcfa4919b,0xffe91607
	.word	0xbd5d3527,0x00000000
	.word	0x2e62b78e,0x307751c4
	.word	0xef7dd038,0xea0360dd
	.word	0xd48375ef,0x8b58c573
	.word	0xc0fe92e3,0x9a97ed56
	.word	0x54e2dacb,0xabff5fb1
	.word	0x131cd588,0x1e6d3b40
	.word	0x2e8d7a45,0xb4edf92b
	.word	0x89faeacc,0xd27f6d02
	.word	0xfa0a6fa5,0x10f9e7f5
	.word	0xabfc9342,0x4f813720
	.word	0xf6f791bd,0xbc95741b
	.word	0x6beb5feb,0xed9c7a85
	.word	0x00001770,0xd176d4d6
	.word	0x676218c7,0xa5a393ea
	.word	0x2b4f34fe,0xfd2a5db3
	.word	0x215dc1b4,0xc18b90c4
	.word	0x778d16bb,0x94e2d536
	.word	0xcf74638c,0x66f3c7cf
	.word	0x88766c2a,0xaa65d269
	.word	0x7644c31b,0xec6216ab
	.word	0x43c17585,0xecd8a81f
	.word	0x1cd1fd77,0x5b802c5a
	.word	0x55a8047e,0xc3107400
	.word	0x63eaf823,0xde164d2b
	.word	0x77fba65e,0x8fb78a3c
	.word	0x7079c658,0xdf1484f3
	.word	0xbae11355,0xff9ecab7
	.word	0x151ce28c,0x89da4349
	.word	0xffe22127,0xecffffff
	.word	0x35e687d1,0x7cc763d1
	.word	0x6f0241e6,0x54ef4902
	.word	0xe22eb756,0x6fdfef87
	.word	0x4dff0af0,0x438045bf
	.word	0x2854cd4e,0x574ff5eb
	.word	0x5aaec3f8,0xfffffbbd
	.word	0x2877d285,0x0c88e84d
	.word	0xc3b61786,0x633038e3
	.word	0xfdc79bc4,0xd5b57c27
	.word	0xe47f59e6,0x90345213
	.word	0x7f5375f8,0xe8d67c51
	.word	0x183a875e,0x9f408410
	.word	0x6de5d524,0x822d0170
	.word	0x351100de,0x7d4fabbf
	.word	0xa3c4b1e2,0xc38f258b
p2_local4_expect:
	.word	0xd65f2629,0x59427347
	.word	0xe4f11003,0xc8526db8
	.word	0x6f1c8691,0x52229c06
	.word	0xc5bde767,0xf1ca1611
	.word	0x427a1168,0x6f0c9b72
	.word	0x1470215d,0xcf60df60
	.word	0xef3870c7,0x40602c9e
	.word	0x556600ee,0x5a4cb811
	.word	0xa3aedeb8,0x6e1fff65
	.word	0x050d39d8,0x56553f45
	.word	0xffcc3e6a,0x60df6952
	.word	0x07467ce3,0x34248656
	.word	0x8f724124,0xdf546bf8
	.word	0x2840f2cc,0x1401675c
	.word	0x53f74029,0x9c34bcfd
	.word	0xf27a2d24,0x061618ce
	.word	0x364a76df,0x79df80b8
	.word	0x0a904e12,0xd0d6e200
	.word	0xcef62b49,0x22f2e78d
	.word	0xc23bf695,0x8b805078
	.word	0xbadff6cc,0xed324e7b
	.word	0x184877c8,0xf0bd780c
	.word	0xb53009f2,0x4dfc1a08
	.word	0x17613977,0x7c6a0d53
	.word	0xad2b9c6b,0x585b0dae
	.word	0xd98de309,0x28c8fe59
	.word	0x67e4eae1,0x5fc6843f
	.word	0x57f1f769,0xb9f50011
	.word	0x97f3d2c7,0xdaccfa0e
	.word	0x0199ba44,0xacef60a1
	.word	0x68364383,0xfaf246ed
	.word	0xac019c21,0x1bd6a232
	.word	0xfd3bb0cc,0x7cba9549
	.word	0xb826db2f,0xba1fef28
	.word	0xdca26ca8,0xf380f8a8
	.word	0x570c0b5f,0x33ce4407
	.word	0xc965fce5,0xb39d3497
	.word	0x76eee010,0xa29fbf61
	.word	0xfbb35bc2,0x36e1360f
	.word	0xde50430f,0x238a8a6f
	.word	0xd9031261,0xf33301b0
	.word	0xdbb436ba,0x65ad5782
	.word	0xd18122c1,0x78c10e74
	.word	0x2fd1a2e3,0xe063c2e7
	.word	0xf2285011,0xe4e0a0f2
	.word	0xd30cce57,0x0c8e5376
	.word	0x19e49882,0xa1d5477d
	.word	0x36a7bcc6,0xd049e64c
	.word	0xea741925,0xc7c601f8
	.word	0x9c2b1375,0xc9be3ec2
	.word	0xf61c8fa4,0xb867f9d7
	.word	0x0f124bf1,0xa0c66cf0
	.word	0x0f8e601d,0x3bd58ac5
	.word	0x0dae7f76,0x6272868d
	.word	0x53a87380,0xee5d51e9
	.word	0x3c069b37,0xd4920ded
	.word	0xccfd1571,0x3da590db
	.word	0xb9ad4400,0x54be293d
	.word	0x8210e2f3,0x703d840c
	.word	0x1da82ef3,0xee2c8a08
	.word	0x97f1561f,0x2280ccc4
	.word	0x634b2908,0x91a0318d
	.word	0xba1e101c,0xf40cc14e
	.word	0x0b45f2ab,0x488731af
p2_local5_expect:
	.word	0x00355721,0x29d1b203
	.word	0x3a2a28c8,0x9fc2cbe7
	.word	0x089cc8f5,0xc70f7a20
	.word	0xe0746110,0x7b4e45b8
	.word	0x6aa37435,0x58bde1c4
	.word	0xbe38a2ce,0x1aec3785
	.word	0xc5389307,0x721509fd
	.word	0xad7dc64f,0x9f2f4b4e
	.word	0x8365bb56,0xb6ecd872
	.word	0xa1bac433,0x6b41379a
	.word	0xf854cd4d,0xae063631
	.word	0x69112d63,0x5d56c5ac
	.word	0xc6ea6346,0xca9f2c16
	.word	0xa55c1641,0xb314d75e
	.word	0xd92ab5ef,0x6b488d7a
	.word	0x69e67587,0xe6c9a0ae
	.word	0x76df815a,0x29cea15c
	.word	0xd8e0347a,0xeaabc0b6
	.word	0xd0405bd0,0x9ec74264
	.word	0xe985e870,0xc8c0bc8c
	.word	0xb903ab20,0xb0e9d04a
	.word	0x7f81807d,0x75a3eca9
	.word	0x3c2c1da3,0xc4145a2a
	.word	0x89dd95ec,0x7682c928
	.word	0x7894c31a,0xc219ce14
	.word	0xc4b0cf3a,0x42b9e69c
	.word	0x22e9e9b1,0x5b2092de
	.word	0x4dac0af0,0x438045bf
	.word	0x9c1e782c,0xc6a985b3
	.word	0xa04c748b,0x3ad4fc36
	.word	0xc0eed2a0,0xc1dacc39
	.word	0xec311079,0x4845c792
	.word	0x549a6fa5,0x242aa348
	.word	0xef95fcb0,0xa35784e9
	.word	0x8069b1e4,0x9be7bba3
	.word	0xa175e211,0x54d935e7
	.word	0x81126e5d,0x63eaf267
	.word	0x83651516,0xe2fafad7
	.word	0x71d3501d,0x827d3982
	.word	0x4967b511,0x31c8fc0a
	.word	0xb007dbbb,0xa4e99375
	.word	0xe4832016,0xc65d3acd
	.word	0x3b23ef86,0x4f66f890
	.word	0x0cd9720b,0xc7cf02b5
	.word	0x7274b4b1,0xab49c111
	.word	0x62fa1f59,0xd96c141e
	.word	0xa7109b78,0xd2e5ae2d
	.word	0xecb976f6,0xe2e6e45f
	.word	0x3accf0ca,0x6206a09d
	.word	0x08639613,0xf2fd62bc
	.word	0x1f35745b,0x77595930
	.word	0x44019f64,0xb8f3f3f0
	.word	0xbb30f021,0xac55fa9d
	.word	0x508a0aaa,0x90549d91
	.word	0xfbb3743d,0x6b7abe8c
	.word	0x1b75feb6,0xa4cd60c4
	.word	0x0a790160,0xfb429c02
	.word	0xe65a8c8d,0x171d094c
	.word	0xcad8ab8a,0x1886354f
	.word	0x70679582,0xd71c34c4
	.word	0xe7ae3061,0x84ed1fbe
	.word	0x9da5a4dd,0x21a2fc6d
	.word	0xe868ee8d,0xe96485ad
	.word	0xcc3e6305,0x60abe825
p2_local6_expect:
	.word	0x004ae354,0x715ae4d8
	.word	0x4353e2e5,0x28de81c9
	.word	0x017373e0,0x8b271c7e
	.word	0x204f1a78,0x78ba0546
	.word	0x8fc51343,0x6c1920a4
	.word	0x11f3c673,0x4f9dbe1b
	.word	0x0a89008b,0xa86e17e4
	.word	0xbdf1b91b,0x99efc9f5
	.word	0xff4aea30,0xf4823450
	.word	0xc9338571,0xdb7988c5
	.word	0xb5ad2112,0x74328874
	.word	0x008f14a5,0x0cdd0484
	.word	0x7800e8be,0x66fa9569
	.word	0x848ddbbb,0xa6394892
	.word	0x1a31934e,0xfc9644f7
	.word	0x14cc3500,0x00812838
	.word	0x59085a1a,0xeb654386
	.word	0x6db1b381,0xfb5660dd
	.word	0x9737732e,0x4e5e6dff
	.word	0x05392c8c,0xde8e25fb
	.word	0xffffffff,0x7fffffff
	.word	0x9f210e6a,0x60de0eee
	.word	0x5dc1e0e5,0x15b73461
	.word	0x56ff34d1,0xee25a0d5
	.word	0xfe5cd341,0x78401b17
	.word	0xf409eca6,0xdd903db6
	.word	0xea4dc286,0xdd2880a7
	.word	0x2c018c19,0xa8e7b7fe
	.word	0x448dcd28,0xbafee9ad
	.word	0x595c6309,0xe48ce54a
	.word	0xb3988640,0xc1aed453
	.word	0xb3b3df44,0x8f53957d
	.word	0x3b87ef04,0x4d17ea07
	.word	0x7e049668,0xd5a098df
	.word	0x845aa753,0x30afcee2
	.word	0xb107a549,0x1b48fb12
	.word	0x9a77d83a,0x79292d83
	.word	0x89cdf07a,0x2dfc6931
	.word	0x14838438,0x36c3af0b
	.word	0x8e94616d,0x4b477d61
	.word	0x0ba29edc,0x3d849a3b
	.word	0xe3a76407,0x3edfac14
	.word	0x2bdc2821,0xcef09647
	.word	0xa6488676,0xd125c55c
	.word	0x9e458b98,0xb1e29354
	.word	0x7d2fb72d,0x2ce655ec
	.word	0x1fb49faa,0x6ee88b22
	.word	0x0de5e200,0xc137dce8
	.word	0x9aeb448c,0x56350a61
	.word	0xc47363be,0xc4ffa9ae
	.word	0x910b192b,0x5e396fc9
	.word	0x6c5c770e,0xb1b3abf2
	.word	0x0d4a0405,0x479a16b8
	.word	0xefafa70b,0xfa97ef97
	.word	0xef6a223b,0x1fdff96c
	.word	0x6588999d,0x44d275d8
	.word	0x9b675b58,0x2f06be9d
	.word	0x1a7a9c6f,0x860810f5
	.word	0x6ae8fb20,0x4619c8bc
	.word	0xff308b24,0x0d4c3d94
	.word	0xad1ebbf4,0xd8636c5b
	.word	0x0f128d70,0x8ce90a35
	.word	0x933790ac,0x4182e487
	.word	0xd479e8b6,0xc23d1d32
p3_init_registers:
	.word	0x9f066000,0x7689ebcd		! Init value for %l0
	.word	0x2c0cef00,0x750732e0		! Init value for %l1
	.word	0xb44dedff,0xd755e680		! Init value for %l2
	.word	0x16b34300,0x4d62c637		! Init value for %l3
	.word	0x6e2dd1ff,0xbffa428c		! Init value for %l4
	.word	0x0a2ff1ff,0xfad0497b		! Init value for %l5
	.word	0xb6d1d5ff,0xe1f86259		! Init value for %l6
	.word	0x534f5e00,0x68148672		! Init value for %l7
	.align	64
p3_init_freg:
	.word	0x10472730,0xc6b76ccd		! Init value for %f0 
	.word	0x1e5feb1f,0xfe49fc2e		! Init value for %f2 
	.word	0x9d08d82d,0x578c59a0		! Init value for %f4 
	.word	0x1a432906,0xe6ed9167		! Init value for %f6 
	.word	0xbaa1fac4,0x54fc1218		! Init value for %f8 
	.word	0xd28708f6,0x16a02220		! Init value for %f10
	.word	0x336c419b,0xf201e277		! Init value for %f12
	.word	0x32d6549d,0x4e523906		! Init value for %f14
	.word	0x0dd7cf05,0xc9898510		! Init value for %f16
	.word	0x3ef475ba,0xc347b018		! Init value for %f18
	.word	0x260f97f1,0x82a1c504		! Init value for %f20
	.word	0x625c8c02,0x502056f8		! Init value for %f22
	.word	0x98ed48bd,0x47df5d2c		! Init value for %f24
	.word	0x7b965607,0xcf641e78		! Init value for %f26
	.word	0x3758a714,0x441fa8d9		! Init value for %f28
	.word	0x4efeccd3,0x0738aebe		! Init value for %f30
	.word	0x9d70d232,0x4a41925c		! Init value for %f32
	.word	0x2c8178ad,0xb8b0c0f4		! Init value for %f34
	.word	0xb8eb7ccd,0x1ad0fef7		! Init value for %f36
	.word	0xabafdc84,0x0c231616		! Init value for %f38
	.word	0x2904951f,0xa4cd7bd6		! Init value for %f40
	.word	0x62378ff0,0x59056a4a		! Init value for %f42
	.word	0xdd81a97d,0x31431835		! Init value for %f44
	.word	0x0bc41182,0x6dd290e8		! Init value for %f46
	.word	0xa7f7a802,0x0f93cba1
	.word	0xadb707d9,0xf77a3d6f
	.word	0x1f533d2f,0x4aaf9ff7
	.word	0x58f99895,0x41e126f5
	.word	0x77b440d0,0x31135f5b
	.word	0x43484a99,0x1770fb44
	.word	0x8306c848,0x76fc56a6
	.word	0x78f67cad,0xb0fa5b7f
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
	.word	0xffffffff,0xfffffffd
	.word	0x1c4d7f80,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x000000fe,0xfff0fb14
	.word	0x00000000,0x00000000
	.word	0x000000fe,0xfff0ecc7
	.word	0x00000000,0x000000a4
p3_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0x00000000,0xa0000000
	.word	0xc1c439d3,0x7f666980
	.word	0x7f666980,0x00000000
	.word	0xbaa1fac4,0x40000000
	.word	0x80000000,0x80000000
	.word	0xbaa1fac4,0xfffffffe
	.word	0xff666980,0xd78c59a0
	.word	0x00000000,0x00000000
	.word	0x950fd622,0x3aa1fac4
	.word	0x00000000,0x00000000
	.word	0x00000000,0x7f666980
	.word	0xbaa1fac4,0x40000000
	.word	0xfffee74c,0xc0000000
	.word	0x80000000,0x60000000
	.word	0x4efeccd3,0x00000000
	.word	0x9d70d232,0x4a41925c
	.word	0x2c8178ad,0xb8b0c0f4
	.word	0xb8eb7ccd,0x1ad0fef7
	.word	0xabafdc84,0x0c231616
	.word	0x2904951f,0xa4cd7bd6
	.word	0x62378ff0,0x59056a4a
	.word	0xdd81a97d,0x31431835
	.word	0x0bc41182,0x6dd290e8
p3_local0_expect:
	.word	0x00000000,0x7462e8e6
	.word	0xffffffff,0x00000000
	.word	0x74a0dbb7,0x71c26e88
	.word	0x0897f0ac,0x45cbcc04
	.word	0x6d708468,0x5d56a15f
	.word	0xc9e45d52,0xbd2870a4
	.word	0xd8b31636,0x4ac0fd87
	.word	0x68f1cf4a,0x499664ba
	.word	0xf8058409,0x47a0f7ea
	.word	0xa7ff2197,0x8f6342de
	.word	0xc9f4776a,0x4ee1fe0a
	.word	0xa69e7083,0x7d9bd8d6
	.word	0x38edcace,0xe0679704
	.word	0x17937b0a,0x08bce31e
	.word	0x0e727693,0x0000008d
	.word	0x3700ed1e,0x72c5e9bf
	.word	0x5039dcc4,0xe1d6ed8b
	.word	0xb7dbc035,0x489bd429
	.word	0x2eb5874f,0xfc831e15
	.word	0x9783f462,0x2be334fe
	.word	0x15cbe761,0xc3ca8390
	.word	0x0e1b7a6a,0x7b6c20ab
	.word	0x0e717753,0xda4a5c1a
	.word	0xc4ff943d,0x18f1dd99
	.word	0xf14d0e03,0x462a1cdc
	.word	0xaea6546d,0x2c7d5bd8
	.word	0x0000008a,0x4573d6af
	.word	0xa6f3ba19,0x8c006c8b
	.word	0x34f4f8af,0x956d3025
	.word	0x0d0fb5c9,0x75bf7e96
	.word	0xccf33927,0xc999c98d
	.word	0x39bd8489,0x2cac0bc5
	.word	0x496cfc2a,0x997e4785
	.word	0x6088da26,0xb12b8a94
	.word	0xf51740ea,0xdc59253a
	.word	0x5624d490,0x662363fd
	.word	0xd8b09060,0x3fdf5798
	.word	0x02896272,0x754dab85
	.word	0x36eb88de,0xa9dc2cdd
	.word	0xa257f0f9,0x88bd8e74
	.word	0x252e35a3,0x468265fb
	.word	0xb63db9b6,0x2ed10209
	.word	0xaba65c52,0xf6637c04
	.word	0x26c1ff89,0xbd5df601
	.word	0x448a03c4,0x000d748d
	.word	0x229ac0a7,0x130374f0
	.word	0xd698ad6c,0xfabad7cd
	.word	0x1cf040f0,0xcabdef89
	.word	0x80a5301a,0x16c45ffd
	.word	0x00004c94,0x5fff4f90
	.word	0x62e5186b,0x7decdea9
	.word	0xa38a0956,0x04b6b6fe
	.word	0x00000000,0xe3c570ce
	.word	0x81398ccb,0xff78e511
	.word	0x00000000,0xffffffff
	.word	0x22b873df,0x3af62891
	.word	0x8026b00b,0xc30a1fe9
	.word	0x39ade916,0x7a31abe6
	.word	0x8ce37d4e,0x36ac25d5
	.word	0xa335e79b,0x8b97911e
	.word	0x062e7326,0xdcf3c3eb
	.word	0xffffffff,0x8e389ac6
	.word	0x98acc13b,0x746541bb
	.word	0xb3cb95aa,0x0529f965
p3_local1_expect:
	.word	0x0000f759,0x7462e8e6
	.word	0x00000000,0x00006f3c
	.word	0x76ac1deb,0xaa75628b
	.word	0x4c1e063c,0xa56ece86
	.word	0xc7df62b8,0xd07b2ff3
	.word	0xaeab5dce,0x470dd645
	.word	0x9ffcec60,0xfff90e05
	.word	0x27f832ae,0x3f5186c0
	.word	0x3271bb97,0xe64e7bfc
	.word	0xa7efb010,0x98003416
	.word	0x00000000,0xa19977c9
	.word	0x74924e2a,0x51be3e56
	.word	0x444024da,0x15ba2b2b
	.word	0x10757125,0x902e96f2
	.word	0x82e90d51,0x6d7367d0
	.word	0x075a5971,0x5d4cb109
	.word	0xe2c729a5,0xf92d99b8
	.word	0x9c06a7d4,0x154b8471
	.word	0xc2c3150f,0x75bd7720
	.word	0x44ea373c,0x9473761c
	.word	0x793434e0,0x9a75debf
	.word	0xffc8c618,0xa117c5ab
	.word	0x3cda5b49,0x2d313dc9
	.word	0x1c8219b2,0xd58f0022
	.word	0xdf221418,0xa9411c46
	.word	0xce461708,0xcc6dbb78
	.word	0x68151f2b,0x88ce2b51
	.word	0xde6ed68c,0x6f7bcb1e
	.word	0x2dd3e595,0xdd397735
	.word	0x674729cf,0xeb1af436
	.word	0x466ee3dc,0x892df032
	.word	0x70108d72,0x00000048
	.word	0xbb3858ef,0x922641d6
	.word	0x59b8d636,0x9c035eaf
	.word	0x3499a6c7,0x7cfd2889
	.word	0x4a544e0d,0x36fd7866
	.word	0x0882d825,0x49982bef
	.word	0xb652709c,0x65c7a76c
	.word	0x8a954045,0x1e571061
	.word	0x3813d353,0xa68efd41
	.word	0x903e9098,0xc9ccac99
	.word	0x96ae29e7,0xd990c14f
	.word	0x1b152748,0xdd092105
	.word	0xbc902ee1,0x9bef3df8
	.word	0x656aa146,0x445e405b
	.word	0x032a91ae,0x8b509e7c
	.word	0x03dfd2e6,0xff50faab
	.word	0xad3405d6,0xa9d33c1b
	.word	0x3d4aaa24,0xbd7e2bfc
	.word	0x3d46c57d,0x3489c69a
	.word	0xf227f605,0x11f45a1b
	.word	0xa9215c0a,0x4f4449ff
	.word	0xf7b261bc,0xda5a4513
	.word	0xed7b28ef,0xee2b875d
	.word	0x524f886c,0x6da7556e
	.word	0xa1d44355,0x659910b1
	.word	0xebbc101d,0x75c35ee5
	.word	0x60e7e39a,0xab3b85e0
	.word	0x41cd989e,0x197b6d25
	.word	0x7b96038f,0x4e1580b8
	.word	0xa34fe759,0xa4cc5655
	.word	0xfff474b0,0xe451047d
	.word	0x691b4f5b,0x243ca4cb
	.word	0x08c8b294,0x67299b2a
p3_local2_expect:
	.word	0x9aff00c4,0x00007d77
	.word	0x00000000,0x8e389aff
	.word	0x06939ca7,0x7582f0d4
	.word	0x52dcec9a,0x07316382
	.word	0xbf133298,0x15b32b9b
	.word	0x37bfd6eb,0xaa854afc
	.word	0xdd10b183,0xa65f00b7
	.word	0x94a76003,0x8e767d88
	.word	0x20e90910,0x31d0aad2
	.word	0xf5d32dc0,0x50bb162a
	.word	0x2cd192de,0x2f5c1d1f
	.word	0x50936daa,0xf72a472b
	.word	0xf7fd0ad9,0x77437177
	.word	0xb64b36de,0xfed8af8b
	.word	0x269943ff,0x087eed38
	.word	0x998b78e3,0xdc9e774b
	.word	0xcb240995,0xf553e531
	.word	0x15057074,0x6f524e7e
	.word	0xc9b7e3d9,0xaa44a74b
	.word	0x848d40be,0x58addd26
	.word	0x3faf6c9d,0xeea2e91c
	.word	0xc0df7230,0x8124397d
	.word	0x158f97a9,0x33127448
	.word	0xcc6892c0,0xfecfe45f
	.word	0x3bc9ab91,0xfffffffc
	.word	0xd6d4742b,0xc317ab58
	.word	0x02ac4dbd,0x9e38fe08
	.word	0x00000000,0x00000007
	.word	0x1a5d392c,0x7317afd2
	.word	0x6a8f0e97,0x4af07807
	.word	0x00000060,0xa19977c9
	.word	0x1898c042,0xd8525747
	.word	0xd79dfb1d,0x036ee0d9
	.word	0x66e88d69,0x679cc26d
	.word	0xb69b5154,0x241cf501
	.word	0x3bd0c0c4,0xb4dd8b04
	.word	0x1097afc5,0x7509a0ec
	.word	0x19a44965,0x191504bd
	.word	0x0a0bbda2,0xe8fd0f45
	.word	0x1fd011d8,0x00738cb9
	.word	0xf4762ab5,0x063e5f7e
	.word	0xbdc93f44,0x118ad064
	.word	0xc7bac341,0x0000ffff
	.word	0x1412ea7a,0x624b8755
	.word	0x9d357ee1,0x294bc33c
	.word	0x8af41495,0xcfc57e71
	.word	0xeaade064,0x02418f9d
	.word	0xce637702,0xe8639932
	.word	0x05caaf28,0x5412e2f5
	.word	0x49986f3c,0x2520d345
	.word	0xe913f39e,0x79e72923
	.word	0x4ff6def6,0x22a82cf8
	.word	0x0f3081db,0x0d544c3f
	.word	0x180b63ae,0x89f2bea8
	.word	0x702f9dc6,0xec56714f
	.word	0x07222d9b,0x60fd5cbf
	.word	0x429b4f91,0xbebfee30
	.word	0xf9b375ad,0xff16f26c
	.word	0xc1eeec01,0x4b5c49e4
	.word	0x4f66a168,0xbf0d2daf
	.word	0xa3473351,0x3ed87c74
	.word	0x60f9433e,0x00000000
	.word	0xaa6b4ce2,0x70aa384c
	.word	0x16b79262,0x5ed77601
p3_local3_expect:
	.word	0xc787ffff,0xff73b5fe
	.word	0x8e389487,0x7fffffff
	.word	0xc0242d7d,0xa7704640
	.word	0x00000000,0x00000000
	.word	0x00000000,0x60fd5cbf
	.word	0x9994c1f9,0xe85bb661
	.word	0xab7262fd,0xa56ad279
	.word	0x28f000b9,0x300fbf73
	.word	0x19d3984c,0xcb449785
	.word	0xadbc90c2,0xe0cfd55c
	.word	0xd41b0359,0x3eb24944
	.word	0x11f72eec,0x49e2fefe
	.word	0x61bbb40a,0x43497fa6
	.word	0x1a9ba869,0x80000000
	.word	0x1c273295,0x468b9ee2
	.word	0x3a317473,0x00000082
	.word	0xc13e2309,0x5d708013
	.word	0x099a4b68,0x647f7bea
	.word	0x0451596c,0x20fb8ed5
	.word	0x87beaedc,0x5a1f0082
	.word	0x67da795b,0xff121bcb
	.word	0x25d65e10,0x39a24863
	.word	0x5f68b8a3,0xac385bb3
	.word	0xe5fcc3da,0x65fa21f5
	.word	0x78865005,0xcda6880f
	.word	0x9b90ad59,0xf6baa210
	.word	0x3beeef68,0x34060fde
	.word	0x02b96658,0xb2af50cc
	.word	0x5f50d589,0x65a629b4
	.word	0x4d171e01,0x9257343f
	.word	0xf26c0bfc,0xa4c4189a
	.word	0xcba9a7ed,0x7934fc99
	.word	0xce086b99,0xc0e6fd00
	.word	0xba3614a2,0x22f83a37
	.word	0xce64f4d5,0x2bd252ef
	.word	0x01b3e7b6,0xbf184621
	.word	0x641bb732,0x574e1559
	.word	0x15f2df8c,0x69f6b478
	.word	0xba9829cc,0xe6d3137e
	.word	0x9dbfbb23,0xe151c56b
	.word	0x04a4c000,0xdb0de9ce
	.word	0xdc32b0fc,0x393399ac
	.word	0xb39a1e7b,0x7bd0b95f
	.word	0x4144a457,0xaf1c8050
	.word	0x60ba55f5,0x3c04281e
	.word	0xf5d7f703,0x3daa8c89
	.word	0x3daedae9,0x4cd99908
	.word	0x7130f69f,0x28962688
	.word	0x56cd331f,0x5ba1cfc1
	.word	0x53429487,0x44fcbdae
	.word	0x9b74a189,0x333b29e8
	.word	0x9c6c3b2e,0xac35162b
	.word	0x2000fc82,0x6fea4ca5
	.word	0xbe9eb79f,0x60f4a234
	.word	0x5c3a6216,0x1678b2d5
	.word	0x7f9fb1f0,0xff6e1334
	.word	0x28583a94,0x8e3884ab
	.word	0xe55c1602,0x2f67f007
	.word	0xa713a887,0x1f1ab0ad
	.word	0xe5b322a8,0xe4f640d8
	.word	0x3dbc9441,0x712dd350
	.word	0x2ae7ed2c,0xfd140209
	.word	0x89c72a81,0xf3ac2957
	.word	0x6672f83d,0x31f08b00
p3_local4_expect:
	.word	0x2eead780,0x0c80fb42
	.word	0x29675ac5,0x5da6582e
	.word	0xeb7320d9,0x5f1fb4c1
	.word	0xce4408f3,0x3c12f90b
	.word	0x417f0657,0x32ef8975
	.word	0x93822440,0xa32da1a5
	.word	0xf61f685d,0x7c980f72
	.word	0x33e7ff87,0x2a6a366c
	.word	0x5b52af5e,0x5b5c75ca
	.word	0x1e3a3457,0x1526a6d0
	.word	0x7fe28974,0xe2f511d1
	.word	0xe2cf9c0c,0xd5bd19bc
	.word	0x148e5d78,0xda8475e7
	.word	0xed6a3bcf,0x71c29199
	.word	0x66cd82e9,0x67061e87
	.word	0xc9672e5e,0x5f30e818
	.word	0x9adeec81,0xe721b220
	.word	0x64de64ba,0x6fee3c29
	.word	0x86a40c63,0x8afcd036
	.word	0xf4519e98,0x82167a12
	.word	0xec1707a3,0x9659fee9
	.word	0xb6e9a006,0xd04c3fff
	.word	0x15a5630e,0xe641057f
	.word	0xec0e363a,0x2af40d88
	.word	0xd95fb919,0x3a7203b5
	.word	0xea9f9f7a,0x9b296e82
	.word	0xc7909d99,0xc19f592c
	.word	0x5a70d02a,0x6fb3bd82
	.word	0x8ce81338,0x7523af40
	.word	0x94825a2d,0x7ba8d58d
	.word	0x3edd6ee6,0xa77d95a7
	.word	0x76cf9404,0xf764d1fd
	.word	0xf611c2f9,0xb8eeeab1
	.word	0xe871b950,0xe38df070
	.word	0xd4713b8c,0x415edc9b
	.word	0x6557057a,0xf3c75324
	.word	0xb8602728,0xb5238f90
	.word	0x97deb244,0x74419791
	.word	0x421768ca,0x04e5286b
	.word	0xa0a7da29,0xde17796b
	.word	0x744a8d9a,0x97cbdf35
	.word	0xe3bedef1,0x9afe4ad5
	.word	0x05ee6701,0x933ca134
	.word	0xa1e02d8e,0xcb94254e
	.word	0xfe8db89d,0x43e1806c
	.word	0x4c43aadc,0xed6d232c
	.word	0x51c324f7,0xf9fa00d4
	.word	0x6fdf4780,0xe5b07a82
	.word	0x7f94f4bc,0xf4ffdc85
	.word	0x329838dc,0x9c056eab
	.word	0x4d5f15cb,0x8e04e1b8
	.word	0x0d67bff8,0xa124956f
	.word	0x0cff2485,0xd3fd7997
	.word	0xace00d1a,0xd68939a7
	.word	0x3380091b,0xb8bb02f1
	.word	0x019ba1fa,0x9fd80a75
	.word	0x37e3960a,0x8c2a7944
	.word	0x28211f95,0x4c380563
	.word	0xed230d2f,0xa306f079
	.word	0x9d971b42,0x8906881d
	.word	0xa2adcac5,0xa26cbd88
	.word	0xbf5a65b8,0x2875e930
	.word	0x50c9a28a,0x34956c6e
	.word	0x052869d4,0x24f8529b
p3_local5_expect:
	.word	0x00000060,0xafcc64a4
	.word	0xc32886cf,0x7d8a8315
	.word	0x970117c2,0x1c415e46
	.word	0x20e57f57,0x220e29eb
	.word	0xc7690b98,0xc31a0b3b
	.word	0x383a7782,0x82143d64
	.word	0xf7cd550c,0x68645871
	.word	0xa42a30b7,0x1268799e
	.word	0x922736ac,0xb931ad8a
	.word	0xd0594e69,0x153dcdda
	.word	0x01260d4e,0x1d309d90
	.word	0x83a91e24,0xfdaa5d22
	.word	0x10e70c4f,0xdd117ead
	.word	0x9279c069,0x574b41be
	.word	0x0dbc47c5,0x6abd5176
	.word	0x7e8a25bc,0x50c7c332
	.word	0x00000000,0x1c140e53
	.word	0xa8ed853c,0x05efd2ac
	.word	0x4d2fa21f,0xda430d0f
	.word	0x0d43e199,0x892186a0
	.word	0x3497c84f,0x3767e69a
	.word	0x9316499f,0x675d350d
	.word	0xc85571c8,0x4e470e40
	.word	0x47451ff8,0xdf3d786d
	.word	0xce482aaf,0x738e866f
	.word	0xb923ca50,0x12330915
	.word	0x78a1ce79,0xefe204f3
	.word	0xc9b568d6,0x2cc8a65a
	.word	0x08727a21,0x02f419fd
	.word	0xe2a96eae,0xac74d465
	.word	0xb6f1528e,0x198cfbdb
	.word	0x61399fd8,0xedef35b5
	.word	0xe5438bd9,0xc2ce1e72
	.word	0x4f5d87e0,0x7db3d01a
	.word	0x795ce9eb,0x2d55cc2b
	.word	0xee164a41,0x1587f186
	.word	0x3ce3b57b,0xa5570e62
	.word	0xe725770e,0xb8e5cb3f
	.word	0x7220f5ed,0x09cf3902
	.word	0xe5fd69a2,0x163ae10c
	.word	0xa1ff007b,0x326e1966
	.word	0x0669abe5,0x9660cdb5
	.word	0x440bd70d,0xec4d5cb2
	.word	0x53c3d8c7,0x8012bf50
	.word	0x5346763c,0x1429984b
	.word	0x93f0083a,0x0429be66
	.word	0xf4a0b985,0xd2da546c
	.word	0xf335e8bf,0x198a15a3
	.word	0x301f3376,0x4cd5d7d6
	.word	0x8afbb789,0x3d95a64c
	.word	0xaeb96d0d,0x378866a5
	.word	0x4082f8b6,0xa15a51f6
	.word	0xfa0a0649,0xda2d417c
	.word	0xe1168b0b,0x989a952b
	.word	0xf955a7ea,0x1ebec5d8
	.word	0xa9e4f110,0x43f6b5c4
	.word	0xa68353e5,0x9a639242
	.word	0xb33d4786,0x894ec3c5
	.word	0x10c6fb4c,0x66fe4e47
	.word	0x50785561,0x4c8a03b5
	.word	0x14c0e6fe,0x9604d88d
	.word	0x7b05c4b4,0x0385fcfa
	.word	0x742b0130,0x7ad82468
	.word	0x4fcf990e,0x5a273a06
p3_local6_expect:
	.word	0x93b05806,0x0beaf141
	.word	0xc7308cf6,0xd37c7600
	.word	0xde7a51f2,0xa62f38e5
	.word	0xcfdbb605,0xf7cfbcbd
	.word	0x793273eb,0x765cfa0e
	.word	0x64405d23,0x0a3b903e
	.word	0x8f87f81b,0x3a894813
	.word	0xd3ea7d12,0x84822c9c
	.word	0x4f97dfe2,0x1f1870e5
	.word	0x06108544,0xab31b87b
	.word	0x215dceee,0x6eefaac9
	.word	0x0b092afa,0x96d91477
	.word	0xe794fdd1,0x002249c5
	.word	0x9da5adce,0x84e2b187
	.word	0x29f94729,0x41599212
	.word	0x65751473,0xb195d513
	.word	0xcf8a8bab,0x1cfd050e
	.word	0xae52383f,0x7bda2666
	.word	0x8cd1b429,0xdbc25d00
	.word	0x49c2b8b6,0x24d69528
	.word	0x1eec2f5d,0x45fb1fdb
	.word	0x7e478f50,0x24d90094
	.word	0x2affd83c,0x3e7fb2b4
	.word	0xe0067934,0x0788fb25
	.word	0xb659e761,0x475461f0
	.word	0x91c12f3c,0x27c21ecd
	.word	0xff9f7846,0xa0dba748
	.word	0x0529f965,0x346ffa24
	.word	0xf52b84fe,0x042c998e
	.word	0xdb4ac302,0x8ed56368
	.word	0x15fb1769,0xe6ff038f
	.word	0xf088e705,0x8171d17e
	.word	0x67c45268,0x96773006
	.word	0x877152e4,0x81183cca
	.word	0x892b8180,0x57399f48
	.word	0x25a50263,0xbe1acfa9
	.word	0x4a1d23cc,0x37d278f1
	.word	0x87aa43fa,0x796c434e
	.word	0xd70f3616,0x15fe8dc2
	.word	0x4b76a191,0x86763f81
	.word	0x5356f2ce,0x1c5c3b9e
	.word	0xf219b15a,0x1dcc3a9d
	.word	0x26f718da,0x87234f01
	.word	0x88c17a72,0xfc9190e0
	.word	0xef0fa641,0xc613158d
	.word	0x3e20874a,0x3319c520
	.word	0x1ab3bc98,0x03a5defc
	.word	0x94d6ea42,0x5048fa83
	.word	0x921fed85,0x80608962
	.word	0x59a93ee9,0x0717ce9b
	.word	0x65e3e905,0x2de27682
	.word	0xf5f01ee6,0x96783836
	.word	0xe452a2b3,0x2bbe8d43
	.word	0x882bf79f,0x9e93b21e
	.word	0xbb6aaae5,0xc633a7c1
	.word	0x71340799,0x02b38f57
	.word	0x25b4d166,0x270eaede
	.word	0x71e7e41a,0x11174b14
	.word	0x7c0af995,0xf2e8a417
	.word	0xc6c498b8,0xd16995a3
	.word	0x214efa10,0x59c1d588
	.word	0xf7b4a16a,0x9d0ac047
	.word	0xae7e68e2,0x19e7f297
	.word	0x31a3784d,0x9e31cab9

expected_common:
	.word	0x272a0430,0x3e2a0e05,0x3831001b,0x0d19263e
	.word	0xffff8861,0xfffa8860,0xff5737ff,0xbeb4ff9d
	.word	0x2d280b1f,0x0f061e39,0x352b0024,0x1a38373f
	.word	0x261e0a0f,0x063a0a3a,0xffac2505,0xe56468c8
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
	.word	0x69716a72,0x8ddd9efc,0xb18cadd7,0x032e56c6
	.word	0x53603e31,0x7681715c,0xd54991f9,0x4297efad
	.word	0x8c44b3c8,0xb0a815f7,0xc9d3804d,0x92bd6cae
	.word	0xedd9b0b4,0xba887bed,0xf5a8f03f,0xa69cf491
	.word	0xa82a238c,0xdd3d3fc4,0x81277cb7,0x0aa2584c
	.word	0xf37d8132,0x650f6bfa,0x53ba3c25,0x739d53dd
	.word	0xdfe3a4e7,0x81626933,0x883c0420,0x168156ea
	.word	0xc7aff753,0x2cb11c76,0x8c328861,0x49ca7764
	.word	0x53884cd6,0xfa161430,0xde534ff3,0x03f265d6
	.word	0xa8b4cb04,0x9cd17c71,0x1bb15978,0xd3254276
	.word	0x84fd2903,0x35493e54,0xc376e82b,0xcb5d8158
	.word	0xacbc0d16,0x15a58130,0x34dc35d7,0xfc6f0e44
	.word	0xc14e0e3d,0x0c46d85a,0xe71dbe31,0xd4960275
	.word	0x2f2d8861,0x45faa47f,0x45e0d7b5,0x969b7658
	.word	0xeccad8bf,0x4434fd7c,0x417eaf0b,0x2d44cc48
	.word	0x8fc13d84,0x3b4f1d39,0x1144898d,0x66317e28
	.word	0x0ae098fe,0x30132c0b,0x21a11d03,0x4f4420cf
	.word	0x46673259,0x261c5663,0x489c9ffe,0x19345b0f
	.word	0xd4055f7d,0x04501562,0xfaf32ba5,0x80520ac3
	.word	0xc65ffa30,0x34b1eb7c,0xa2f41f27,0xaa09e823
p0_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local1_begin:
p0_local1_start:
	.word	0xb8a70592,0x5702403a,0xde9c3553,0x5e66eeda
	.word	0x2a5f7956,0x52720c4d,0xf749576f,0x2a88a344
	.word	0xadbe31f2,0xad90be39,0x08c02fd5,0x07632b3e
	.word	0x68a2a3fb,0x76827014,0xef303575,0x896aadd3
	.word	0x2a6e5c1f,0x65e32feb,0x70d731fd,0xbbfa77e6
	.word	0x0c0aa23f,0xd913359f,0x5fffd378,0x0ed8c0fd
	.word	0xa815f184,0x65c4e7c7,0xc7bf98d9,0xc0499f93
	.word	0x525a5cbd,0x9f8cdc7c,0xb7e7e084,0xb15b6e1a
	.word	0x023d51dd,0x79447e35,0x9cf03e2b,0xd7ea426e
	.word	0x14c1d9ce,0x3db22d38,0xef810c31,0x60a788d1
	.word	0x65ef1ecd,0x92547def,0x2b314f1e,0x04cc417a
	.word	0xe936b709,0x2294a60e,0x4bff3d66,0x9707ce10
	.word	0x37002b6e,0x1650a75d,0x1ea758a0,0x52ba4f23
	.word	0xcf0febda,0xa063e835,0xd69ea451,0x9a3e7001
	.word	0x4cd4ff5e,0xa4bc2004,0x6a181252,0xcd9bfd59
	.word	0x74eab275,0xc9095129,0x82663350,0xe0c74b7e
	.word	0xbb64cfbf,0xad2cdd34,0x742a7b5c,0x4cb74121
	.word	0x38e93354,0x9c676cf6,0x4ba4f1b1,0xc8936ff7
	.word	0x5f7faa48,0x28c1233c,0x59bca81f,0x4887fa17
	.word	0x998e3330,0x08510d0f,0x20f0aee1,0x30f2991c
p0_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local2_begin:
p0_local2_start:
	.word	0x5accc5bf,0x471204d7,0x4d844e87,0xc868254e
	.word	0x4fd489d5,0x41e506ed,0x69b83a29,0x82bdc505
	.word	0xc52d121e,0x9cdee2a4,0xdd88fc08,0x661e60cb
	.word	0x296dee45,0x3ffa1678,0xdf00c0ae,0x44fe3393
	.word	0x1fc0f412,0xf7473fcc,0x14edc444,0x522d21db
	.word	0xc10abedd,0xda35c580,0xca677cb6,0x5e6608ee
	.word	0xf6f7fe90,0x1aae8224,0xaf1b7190,0xaa2ea8d6
	.word	0x9ab613a4,0x1ffd134a,0x378361c5,0xbec3383f
	.word	0x56953e07,0x25888530,0xe792e7a6,0x7ca83cc4
	.word	0x42d2c873,0x072fbd2a,0x7506de4b,0x0acda0fd
	.word	0xc5be1aaa,0xa5a1ddb3,0x6aa84371,0x45f231ef
	.word	0x0ced8258,0x86bc6f67,0xac8a2096,0x61de6d74
	.word	0x401229b1,0xba8cc8e8,0xa9efde10,0xc242dc3b
	.word	0xdec30c52,0x7869ad2d,0x2e58437d,0xf3e1ea58
	.word	0xb0d9ad0c,0x0badda62,0x32c68cd5,0xc120dd72
	.word	0xb83cfa8b,0x1a14efca,0x4a0f3f5f,0x0e4d3dbf
	.word	0x9c3220c0,0x7a7ac903,0xd4b461d4,0x9616dc72
	.word	0xc482e4ca,0x154a471c,0x42842b6e,0x81f35be9
	.word	0x9ac43b2c,0xb175d183,0x52839a44,0xa516973c
	.word	0x1f6bfcce,0x615c738c,0x6c968d3e,0x7de92caf
p0_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local3_begin:
p0_local3_start:
	.word	0x520032a2,0x3543ea88,0xb794d2b4,0x4285daf6
	.word	0x95e5cfe8,0x8f348ca3,0xeae7050d,0x3e04b9cc
	.word	0x39d163a7,0xcc7ef476,0xdcf43600,0xa6f07569
	.word	0x7d5c81c1,0xa87dcd6c,0x15961bf1,0x3b1d14d1
	.word	0xe9485e13,0x96e16506,0x60d41cfc,0x7d3ead0e
	.word	0x5d978c5f,0xeca9dd69,0xd539f6ad,0x68b45486
	.word	0xc7fd7d24,0x1095ec30,0xb0c1b065,0x39a016ef
	.word	0x40f9edac,0xc43faac7,0xe8d1f9c7,0x580476f0
	.word	0xc09f6831,0x57b3ce81,0x0edfb572,0x9434a731
	.word	0x00c5fc01,0x4194d77e,0xeebe99cf,0x50476582
	.word	0x4e22dc20,0xa18f8697,0x57a0c86b,0xacb4bc6c
	.word	0xe407e562,0x6f4b4df4,0xf426cc8b,0x9f2b2443
	.word	0xe1748a1b,0xce4fa829,0x49012a74,0x604c775f
	.word	0x02d80334,0xeae6a8e3,0x96319ea1,0x3452a1f7
	.word	0xfaafacd7,0xdab5d1e7,0xfb10d895,0x854fd999
	.word	0xe6c31dc6,0xab5a0be0,0x853feb31,0xce30cd8d
	.word	0x252af15a,0xc064d3fb,0x373f70d8,0x44ae6497
	.word	0x80bba3d5,0xc1527edd,0x1030d4a6,0xed4e87f9
	.word	0x1433fd8c,0x44f645ff,0x4512a577,0x09a2efc5
	.word	0x0163a266,0x8279da14,0x19fd2d5b,0x4ac359c3
p0_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local4_begin:
p0_local4_start:
	.word	0x9b36a587,0x53e5dbda,0x41b64570,0x1454aef0
	.word	0xd4013916,0xeeac4b27,0x06a073b8,0xae7e1e98
	.word	0x2147052d,0x890ceff1,0xa9446a12,0x2faeb0b9
	.word	0x18e7e097,0x7da4f969,0x973cae1c,0xb7c2dd95
	.word	0x49120aac,0x40110eff,0x9d4e1e28,0xf44e8160
	.word	0x04dbddc3,0x59527295,0x14487306,0x63a6a46b
	.word	0xdbb15c0d,0x607aa555,0xd50c65c7,0xa9fdd7f8
	.word	0x383cdac7,0x02909e47,0xe3bcf0d8,0x7b69fc27
	.word	0x3ef1bd6c,0x5d3fa8a1,0x1b5a0935,0x2d5e3af3
	.word	0xe3292daa,0x08ad1dd4,0xdef9e937,0x6f00cfa4
	.word	0x410f3cdb,0xeab93d44,0xc1fab7a8,0x04a24021
	.word	0x92f464ff,0x6d862033,0xc75f7005,0x309e5a1c
	.word	0x84425520,0xc7b9dbe7,0x55893c00,0xe8d197ce
	.word	0xa5ee2c63,0x79e0881a,0x89a23b61,0x3b90863f
	.word	0x7a0b8c38,0xe08832ff,0xc357d500,0xcd84988f
	.word	0xba2c3048,0xca8933b7,0xf8f807bc,0x7787fd20
	.word	0x7d9b3837,0x2ceba6a3,0x6510b4ab,0x2d6fadd1
	.word	0xeb88adee,0x23fb0944,0xbfa9cb14,0x34ae4ac8
	.word	0xaa03dc1a,0x36019db1,0xd5883ce2,0x1fc44fb7
	.word	0x1af0f088,0x45f1748d,0xe6004bd0,0xb03319d8
p0_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local5_begin:
p0_local5_start:
	.word	0x8eb31891,0x8b8aa832,0xf52b6061,0x9da42afb
	.word	0xb296de42,0x6b41017f,0x8e1cf394,0x0a7dacbf
	.word	0x617503a2,0x863f4c8c,0xcdd0087e,0x6bae4ac2
	.word	0x3cb0257e,0xe914b955,0x5e2995ec,0xd5627f57
	.word	0x787a8adc,0xe3cde66f,0x5d27cb89,0xc9aba3a2
	.word	0xa25764c1,0x223b664e,0x9e886ae0,0xb8808082
	.word	0x76ea67ec,0x6dac7445,0x83fb510a,0x0c2a2f32
	.word	0xfc5f9520,0x6f93fec4,0xebc15a7c,0xcdfea74a
	.word	0xf6452de5,0x66af3b35,0xf058c805,0x1780651a
	.word	0xc694f97a,0x6b00cdfb,0xeb1536f6,0x5d50fbfd
	.word	0xa63796ac,0xc716f10e,0x4da75e69,0x9c78c93f
	.word	0xac464e47,0x4e0d9b55,0x17c34f1f,0x95fec07b
	.word	0x7155325a,0x86f0ff72,0x0aa2d3c8,0x3076a985
	.word	0xc3eb27f5,0x85c163dd,0xea71b65e,0x0a065d8e
	.word	0x6283e35c,0x74e43ec0,0x803fb59c,0xfd1ab76e
	.word	0x344a5983,0x002b6466,0xe7bc5643,0xef1bb3e6
	.word	0x915215ce,0x12f1a676,0x17ec38f7,0x45d437b9
	.word	0xee70acb5,0xaf4b87da,0x5e5082bb,0xe5dc472a
	.word	0x8ef8b309,0xcb424827,0x7ad573d1,0x63fa9654
	.word	0xd6d5edcb,0xdcc057bd,0x24ea4671,0x94989e42
p0_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local6_begin:
p0_local6_start:
	.word	0x966046d2,0x71d6065c,0x012adb85,0x5630c35d
	.word	0xf47495c2,0x52e3c2a6,0x834c8f94,0x025f1d4a
	.word	0x054f9ad1,0x03e11535,0x2e81322a,0x50951ed1
	.word	0xa429d746,0x27fae430,0x642bfe79,0x2a50bf87
	.word	0xdf104eb0,0xdb3a36c5,0x72da1ac5,0x0d75f150
	.word	0x2c2549fc,0xf0618667,0xa45761aa,0x4fe22840
	.word	0x6044a21c,0xdef66429,0x757ad678,0x111c4534
	.word	0x8e749411,0x9817cd69,0x426d8e9c,0xf76e89d5
	.word	0xc2b81794,0x455c4f21,0x9881f89d,0xbb90a741
	.word	0x10115707,0x4205d88a,0x787eb43a,0x75b3650d
	.word	0x4e606420,0x3b88463d,0x408e7710,0xc0b1ecf8
	.word	0xae5a94f6,0x28ca0f6c,0x3a1c2991,0xe362207e
	.word	0xdc6f59fd,0xbf621860,0x664c0691,0x6185d234
	.word	0xb3a638ea,0x220059eb,0x2ae08b6a,0xa09cf13b
	.word	0xe80fe02f,0x194e9743,0x1c80614a,0x25e912a1
	.word	0x325ab7bc,0xb9d5fe33,0x02e869f0,0xc19bb354
	.word	0x5078f352,0x2c6e33b8,0x0a32e23f,0x776f546e
	.word	0x0352c16f,0x33dc61dd,0x8a66fdeb,0x441c0bdf
	.word	0x9f945f82,0xf62fb640,0xdcbf4dc6,0xb8d6628e
	.word	0x75328d35,0xb69dc16c,0xb7a4dfe1,0xe0f407a5
p0_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local0_begin:
p1_local0_start:
	.word	0x2bfe5911,0x9046a007,0x30ca03f5,0x52aa9b1c
	.word	0x1dc0e45b,0x4d9c4145,0xb70c4dbf,0x026256cf
	.word	0x1e6bfad9,0x2d991a4e,0xd7c0364e,0x80c55cc3
	.word	0xc2fd4b9d,0xaaa923b9,0x168580e8,0x16a4513a
	.word	0x74fc4be1,0xa9f3103c,0xb3b5217e,0x2ee9b4b6
	.word	0xa1aab09f,0x42d32b5e,0xba459adc,0x21fe9acd
	.word	0xcaaecc80,0x9b7fd978,0xb8a2d46b,0x8ed0595a
	.word	0x46bc5d52,0x125415d6,0x920445e0,0xce4f8193
	.word	0xc2c77b52,0x1bfab1b7,0xcf831b28,0x72a21a89
	.word	0x97a765c9,0x32b75d27,0x72ffe235,0x612c80da
	.word	0x97910a70,0xf77cb344,0xb77a10ce,0x79f22923
	.word	0xb9ef3af1,0xbb010aba,0x9a4190ca,0x8e7a3952
	.word	0xab852ebd,0xdb5de8cd,0xa86e50d8,0xcd3b098e
	.word	0xfbc7f07e,0x95072c47,0x18553429,0xbb575f88
	.word	0x4bf4e694,0x557314d4,0xfb2c83ab,0x793f8262
	.word	0x8fc95951,0xababc3ee,0xe3417349,0x8ffa4c18
	.word	0xb6ca26eb,0x3a4db76d,0x49dc16fb,0x1fb15864
	.word	0xd5dd3b10,0xbe6d708c,0xfbc5300d,0x74f86733
	.word	0x395e6662,0x831086a3,0xb5fc62ff,0x6e1761aa
	.word	0xcc699881,0xc74eff0c,0xf993339a,0xa52cc4b1
	.word	0xe9051289,0x532b64c8,0xef8063b9,0x0a585e3e
	.word	0x4d40f6d8,0xc30a98a3,0xcd8ed7e0,0x40f94ec6
	.word	0xef1bea1d,0x53fa9e8f,0x69e34e4e,0x4b893b4e
	.word	0xab910fd3,0x634d6019,0x4cb28d3f,0x6f5d0c92
	.word	0x0279de89,0x542084cd,0xf7713b66,0x2115086c
	.word	0x7eccf737,0xd6955bc3,0x72fa15e5,0xd64ccc99
	.word	0xb08cf012,0xb6bb4220,0xd2620222,0xd4e6472f
	.word	0x06a41dc8,0xe2eb3c42,0xf4bd3934,0x26c21450
	.word	0x746627ee,0xd55c0fa0,0xfff93f09,0x7688b7f3
	.word	0x2eb4e19c,0xaf4ad437,0x48679ee0,0x24502405
	.word	0x752a2799,0xf37019d3,0x3be2c333,0xfd5d0c11
	.word	0x889b1dcc,0x1bd9a1a3,0x73ea7928,0xb118b7bd
	.word	0xa7e96d66,0xc5185ffc,0x65e4f78f,0xc19f4439
	.word	0xfad706b4,0xff29f468,0xc23abd5e,0x4886f894
	.word	0xbc06506e,0xe90c4114,0x97c9e5e9,0x5571fdc5
	.word	0xdaa0cc8e,0x988c3085,0xe4800fff,0xf9274f03
p1_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local1_begin:
p1_local1_start:
	.word	0x221d1a30,0xd4694b0b,0x2cbd9c8b,0xd402eada
	.word	0x49299f76,0x3c084c49,0x9d480e62,0x77a72489
	.word	0x44c47a53,0x7fea7517,0x625b73e0,0xf65ba442
	.word	0x7617217b,0x3be472ec,0x96ea33f8,0x414972ba
	.word	0xaab37307,0x1ea53b82,0x516559c4,0xc2f3bc9a
	.word	0x12e3c72f,0x0b74fd31,0xb5efab72,0x9eb828ed
	.word	0x067e0df7,0x479e508c,0xd920cf6c,0x725d6783
	.word	0xf28f6ab3,0xceeccd4b,0x103465d9,0xb97656d3
	.word	0x36e564aa,0xe86e5e53,0x8e2ed013,0xcd064ee9
	.word	0x51b66550,0x77ed7433,0xff14cb75,0x2e4e80e8
	.word	0xb46e9004,0x42799b84,0x4505bc42,0xf0247578
	.word	0xd9d5e177,0xbb5f82e0,0x4ff7dc88,0x81679930
	.word	0x8aa3d8c9,0xa8985701,0x130a9830,0x0c55dbbe
	.word	0x04d6f765,0xa2f2b963,0xdfb41632,0xd3875a67
	.word	0xd674861f,0x264f9f67,0x0c80db72,0x6238bc36
	.word	0xc42c50c2,0xe2553979,0xa04ece0a,0x1e18eedd
	.word	0x5c98548d,0x3119c990,0x4c16ce69,0xb7f5629f
	.word	0xb23f0660,0x91b1d329,0xe1030cee,0x3d5d81ea
	.word	0xaa15cfdb,0xf8d69cef,0xcac59051,0x9ae24c57
	.word	0x9f00629c,0xf35af5fe,0x2e218f7b,0x41c4bd79
	.word	0x72ee7b79,0x4c697066,0x2c8809f8,0x87534db2
	.word	0x7d615c28,0xd762116b,0x44b70c2c,0xba52c3e3
	.word	0x0196f707,0x8cc8e975,0x3d253db8,0xf4c9614b
	.word	0x3f78665e,0x07f3f6da,0xcdeb2f64,0x80f34d21
	.word	0x6c227dbd,0x07de27e1,0xedd2d38d,0x97f11f4d
	.word	0x0897e6ce,0x79f3852b,0xa3be866e,0xc8fac922
	.word	0x948f5dc1,0xda88b06d,0x59f55304,0x2ccb5eed
	.word	0xd67cdc02,0xc94d817b,0xe72af33b,0x285338e5
	.word	0x05859e65,0x22e682ad,0x5581b859,0xa4c085a8
	.word	0xe463f633,0x016d6382,0x744e3802,0x29140997
	.word	0x8e735e1b,0x63ea3d1d,0x1bf2071e,0x65d02aa2
	.word	0xe57ff152,0x309d3827,0x916dfb9b,0x47396a05
	.word	0x0bb20888,0x224128aa,0xac8fd78a,0x43c82e15
	.word	0x10e0813a,0xb7c8b75e,0x9b9d0805,0x8487c3d8
	.word	0x64eaeae7,0x292f6688,0x02f8632f,0x3ee3f7d0
	.word	0xa935819f,0xceadddad,0x409275e0,0x17ac4f84
p1_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local2_begin:
p1_local2_start:
	.word	0xbdc5e552,0x5ce6e472,0x095490ed,0x5cf672b3
	.word	0x0695260e,0xd66142c2,0x80962479,0x34a336b4
	.word	0x2d51639f,0xd1e0a594,0xb1d9589d,0x0fc0097d
	.word	0x473ad515,0x31158d1d,0xc2eb20b1,0xef24fe90
	.word	0xd9fa63b5,0x486df32f,0x76fe9a5d,0xe5462962
	.word	0xc32f7057,0xa4953edb,0x5837a4ff,0xc0f072c5
	.word	0x6ef78fe2,0x07efa77b,0x1e83ebd0,0xeb3198ee
	.word	0x8d899bdd,0x8f0a5d35,0x5f8c370e,0x2914ba93
	.word	0x21673448,0x9acd82a5,0x1c391fa5,0x04431e90
	.word	0x85a0fe0c,0xfe02328d,0x62b2c43b,0x85d6f6e9
	.word	0xd7c352eb,0x5c906c5c,0x15bb6b7d,0xe0975bc1
	.word	0xc3209536,0x5163d449,0xf3e5469c,0x99867807
	.word	0x4da252ff,0x88100109,0x155b66f4,0xceefe2e0
	.word	0x943517e5,0x6089a92c,0xb71a325f,0xedb5681e
	.word	0xe2b2675a,0x25766667,0xcbae3685,0x4c91a2b1
	.word	0xaf22d93f,0x145d3320,0x094654b7,0xd15c3e20
	.word	0xfd9940f4,0xf0a72e7a,0x4d5beba3,0xa49b83c9
	.word	0x153057a8,0xcbcb2569,0xb8d0176a,0x3f5b6853
	.word	0x2a5d7aa1,0xaef3a49b,0xc85af542,0x060158c3
	.word	0xdcd26da8,0x1745215e,0x8a4b5e8b,0x25d39116
	.word	0xf61c8408,0x5c250248,0xee785a8b,0x745c9b14
	.word	0xab83a0a6,0x5553291c,0xfe4049a4,0x8b97f8d5
	.word	0x3f308989,0xedf12a0d,0x9a65edfe,0x6505b94d
	.word	0x651783f3,0xcb8052c5,0xd346ef0a,0x871e8b5f
	.word	0x81444acc,0x61f5cb7e,0x9aa91399,0x90eb632b
	.word	0x1f119a30,0x0cedc4d0,0xec65b5d6,0xc2cca23b
	.word	0x4ad19997,0x415f5aab,0xbe632a18,0xa8ed8e9b
	.word	0x1c3696e4,0x238f448a,0xa1987e7c,0x2b84cc40
	.word	0x9c8d3c51,0x7308b43f,0xf5564892,0x54b4ab09
	.word	0x4a70a172,0x247713b7,0xb3bf3920,0xc73a2f28
	.word	0x0c04a9fa,0xfcdd5bec,0xe3c7264c,0x8c5a2f5e
	.word	0x54959267,0x0ceca6fe,0xcc9eed72,0x3602b7ab
	.word	0x1391d10f,0xeb531060,0xbe7d4232,0x7e91fab8
	.word	0xfb4db0b3,0xb61708e4,0x7b9961e9,0x6cf6902c
	.word	0x7e24cb09,0x65fd59e1,0xf4c848a1,0x7754d8b6
	.word	0xa15a72e7,0x5bf3327f,0x1776eff3,0x9f390730
p1_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local3_begin:
p1_local3_start:
	.word	0x2f757a3d,0xc4cb3c4d,0x283fe896,0x7b473112
	.word	0x21564330,0x69532e71,0xd05912bc,0x732a6be7
	.word	0xf46e630d,0x47c32dc9,0x3b01fa7a,0x1ff25189
	.word	0xad6657ef,0xb752d905,0x1995eae6,0xebed3d04
	.word	0x59a77efc,0xb2b57b73,0x74daeda8,0xe1d6ae1a
	.word	0x87ec7aee,0xbf4989c9,0xc93a9f86,0xadcbd481
	.word	0xa554a944,0x41469f2d,0x8e9de251,0x24c6e480
	.word	0x2d4e2d3e,0xfd6932c2,0x087a26f7,0x15bf85e7
	.word	0x995cfb18,0x97128665,0x52f26b9f,0x5338b498
	.word	0xddd4a42b,0x7174e818,0x8c9dca92,0x6ebf1265
	.word	0x14086a23,0x27026214,0xabb67908,0x57978915
	.word	0x9e5ede7b,0x8891822a,0x94f5189d,0x550f5005
	.word	0x15ebe2cc,0x8a508cf5,0x7fe18ac9,0x3bfa145a
	.word	0xd679ee4f,0x2e443ba6,0xf8ff28ac,0xee915817
	.word	0xac514b3d,0xbb791264,0x47f2c8a1,0xc61d280c
	.word	0x6e3bfad0,0xfcb946ae,0xdcb46049,0x164422e3
	.word	0x356c975d,0x41963961,0x105daba6,0x1b1cf51b
	.word	0x2ad37b0e,0x81bc7db7,0x276498cd,0xc0895629
	.word	0x78a44c5b,0xdcf42d71,0x5b445cc6,0xcb082f18
	.word	0x7b595134,0x8b03c004,0xaf509439,0x14c5d0d3
	.word	0x18ea91bf,0xbc59245c,0x39e1fa50,0x4329d83c
	.word	0xa7f5067a,0x592a00d8,0xaab3bc42,0xb599cb92
	.word	0x70b1f18f,0x8c080b19,0xefc20621,0xa142442c
	.word	0x71a67b97,0x87a14c53,0x2102ee17,0x5b1d62a6
	.word	0x60c377da,0x0698161c,0x65a0dfdb,0x15d0f308
	.word	0x98481c4c,0xbcba419c,0x8ab5bc82,0xc777e88c
	.word	0x2289c7f2,0x0217cc46,0x98468377,0xa4bfe089
	.word	0xc1997c02,0xfc50c09f,0x4f42d882,0xea6471d0
	.word	0x6a76a948,0xe81fe9e7,0xe3861dc5,0x1ce62c58
	.word	0x9bed5110,0x2e8f9ebf,0x28c2fee4,0x3f0f9683
	.word	0x68115cb1,0x519375ea,0x9ddafabc,0xa972ebb6
	.word	0x23a52f6f,0x5a6af5f8,0x5a95985b,0x81ebd40d
	.word	0xa00ba011,0x1bb2a2fd,0x03b97d67,0x569aacef
	.word	0x8978058c,0xd0f97413,0x97237690,0x38b156c5
	.word	0x5658bfd3,0x693737b2,0x01d9f0d8,0xc2448315
	.word	0x970f4c6c,0x83e898c7,0x2042fff7,0x625a1303
p1_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local4_begin:
p1_local4_start:
	.word	0x07ea04d4,0xb9fa1427,0xa50ef2c4,0xda6e2d0a
	.word	0xb8e83534,0x3cddecc6,0x47e9db95,0xbe620fef
	.word	0x49d14ef2,0x2a484dae,0xd19c06ec,0xfb35f7cd
	.word	0x49e42e3a,0x7501f88c,0xbbdc692d,0x873c9e39
	.word	0x72d1c68e,0x6632669b,0x031bc25f,0x42003506
	.word	0x7abc9a0f,0x6a0895ac,0xc7b8ec35,0xe1864b4b
	.word	0x462e7a74,0xca00e7f6,0x2604931f,0x4ea19dfb
	.word	0xce1e1dc8,0x0f69d0af,0x34c869a1,0x4e5b4bb6
	.word	0x00e920c8,0x6465d461,0x5851e237,0x0a24b1fb
	.word	0xdd207bd3,0xdd01758b,0x9834a543,0x6701c08f
	.word	0x41b69871,0xc66b3438,0xa409e148,0x4dd72989
	.word	0xa3b9e5fb,0xa8ca07a5,0x42a02740,0x2cfe2b2b
	.word	0xdb5a65ad,0x4354aeb0,0xfa73b253,0xc7aec78b
	.word	0xb08cc153,0x0e95d74e,0x4be126cd,0xdd16bf6f
	.word	0x09b0e4e3,0x297b66ce,0x1cfbb6fb,0xb7a6379c
	.word	0x143efa70,0xba5e4233,0x93237abe,0x17d2f8d9
	.word	0xf4dac36b,0x226601f0,0x1336d555,0x5d87f1a5
	.word	0xb425ce31,0xd6ea909f,0xe669bbb2,0xc69d1b3d
	.word	0x059002b6,0x46d21461,0xd5ffbc44,0x639c48c8
	.word	0x00a86140,0x6428dfc5,0x285e175b,0x55d4d649
	.word	0x7aa94d28,0x97837ca5,0x55213194,0x9ecf7d86
	.word	0x02f0565f,0x0f04ac65,0x733df7f4,0xc1f5ca26
	.word	0xd2f19dae,0x7d0df47b,0xdb5bcc86,0xeb3642c7
	.word	0xf797a6c0,0x1d692764,0x193e1d6b,0xe58588e1
	.word	0xf5584987,0xe30b4871,0xc004a072,0x59c9ec41
	.word	0x6a15e25d,0x69c1a062,0x9845d509,0x0963f53b
	.word	0xa490e1b0,0xf12199aa,0x357254fa,0xbe5946bc
	.word	0xe3e9c37d,0x725aeed5,0x1a20512e,0x25cd78dd
	.word	0xecd8e67e,0x609ef190,0x58992e46,0x9620d3e1
	.word	0xe523e238,0x34f3eb74,0x03d1696b,0x45283079
	.word	0x5dc5da85,0x71bb66d2,0x4ac6e2b4,0x16d5029a
	.word	0x006740ef,0x01e8ab3a,0xaa0519c7,0x829ceb12
	.word	0x7cc58f88,0x1e07f64c,0x3386e5f5,0x63ed52aa
	.word	0x0b003d2f,0x04e28736,0xf6eeb9bc,0x87e3b1f8
	.word	0xed1c47a3,0x9ef762a3,0xe8b424d4,0xbffdcadb
	.word	0xfdc9364c,0x445f59a0,0x669445d9,0x0d4006cc
p1_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local5_begin:
p1_local5_start:
	.word	0x5a194ee6,0x03d09b55,0xb80ec8b5,0xf514018f
	.word	0x8532cab9,0x4a1ee16f,0xa5a7f932,0x19be8400
	.word	0x70ed594b,0xae8feb97,0x056f04e2,0xab0dc710
	.word	0x18b6a9e2,0xe332f5cf,0xcaa1e322,0x4876c94e
	.word	0xfecbd1e4,0x4a18d6b4,0x56f59259,0xdf41c1c7
	.word	0x994e0ec6,0xc079f636,0x3ec97e5e,0xa2b2ee10
	.word	0x813fa88a,0xda30bf88,0xdcb1edd9,0x16c4517d
	.word	0x90d09423,0x51f987c4,0xcafb3d0e,0xd086ffce
	.word	0xe0eca615,0x46a8ecac,0xf3769346,0xb3050000
	.word	0xeb467889,0x1f4eb3a5,0xc85d31ae,0xc37add30
	.word	0x61a7461d,0xc18f1ca4,0xce656570,0x700a59b2
	.word	0x161babce,0x6d9b5afa,0x1b091c09,0xf8d640ce
	.word	0x0f408deb,0x942c62ed,0xa124574d,0x6f3a661f
	.word	0xd67129a4,0x41908c3d,0x42d7fd7a,0x46f6b20a
	.word	0xb935cda5,0xd002fc0d,0xfa3d57b0,0x82d29e0a
	.word	0x4047e4f6,0x7c694d5a,0x7831680c,0x331ad79d
	.word	0xc9e51d43,0x8c3a5f8a,0x3a513e58,0xec2528a7
	.word	0xd130880d,0x9afbdcef,0xa9ceb672,0x6d54ec3e
	.word	0x46b9f588,0xabc5554d,0xad4f234b,0x4b428176
	.word	0x93d924fb,0x51513040,0xcb5d7c18,0x8bd85120
	.word	0x3f81fe48,0xed93d7ec,0xdbb15033,0x2e122b5d
	.word	0x4ccd7a77,0x3b447f08,0xbb29b0e5,0xbda49221
	.word	0xab5b1b32,0x7878cfc5,0x504af5a6,0x6075d13f
	.word	0x4bcb1b2b,0xe1540c09,0x51d7c5fe,0x2823465f
	.word	0xe6ff5053,0xcd5d0547,0x635d429e,0x0acae807
	.word	0x22aeb5d0,0x47332c3f,0x3116d215,0xf4dd3a03
	.word	0xefcf0d6f,0xa13aff26,0xa8513704,0x168086b6
	.word	0x106274c5,0xc8affcd3,0xedd14569,0xbe1bf32a
	.word	0x4682e1de,0xd3db5443,0x21c53d75,0x588d54f3
	.word	0x68fdf159,0x149864fa,0xce8119b3,0xf02b0a57
	.word	0x7ed90c86,0xde344037,0x0e06b1e2,0xf1ba56b9
	.word	0xec7ebecd,0x47e3fdcb,0x6a17eaa0,0x9c4b98d4
	.word	0x7e22d6c3,0xed8cccd1,0x074a32b3,0x32177a1a
	.word	0x91658598,0xb06921c1,0x1022d94d,0x9dea6cc3
	.word	0x0a675a25,0xb95fd24b,0x1d4b661f,0xfe0663d9
	.word	0x6692c928,0xa5b91a8f,0xa3bf1cfd,0x26d259c4
p1_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local6_begin:
p1_local6_start:
	.word	0xc6de64e6,0x7a72757b,0x3cafd8a2,0xa7238620
	.word	0xda09e781,0x427a9f0a,0x1df6d9d8,0xaceb81d6
	.word	0x811e85be,0x6a152728,0x9d828f1a,0xb4f754a9
	.word	0x3c1a748f,0xb35e215f,0xf36a62ea,0xab8902ed
	.word	0xa8a6252a,0xb600ed0c,0x149eecf7,0xbb2a0128
	.word	0x3cc395a7,0x9303bdcc,0x86e27774,0xe3e0425e
	.word	0x6a88c14f,0x7b99d5f3,0x2cf0cb09,0xd4fe62d2
	.word	0x2188f851,0xba57bb87,0x5b48e8e4,0x87d92a0b
	.word	0xdf8e4b9d,0x50ed477b,0x919b9664,0x5a971a4d
	.word	0xe0957235,0x2dc19e2b,0x1432861c,0x9ec8e5fc
	.word	0x4e096db1,0xa460f176,0xdbe1b88c,0xebc50352
	.word	0x490e6cb9,0xa82f2658,0xd2e3118d,0xae47f92b
	.word	0x65940bdb,0x35ab6ca0,0x842732c9,0x6640834a
	.word	0x1eb17ba7,0xcdf65988,0xbfe46760,0xe8b23150
	.word	0xec3e3ff4,0x0a9fae4b,0x1f28944e,0xfdfaab1d
	.word	0x59cb1036,0x1a0224a4,0x0b3ab058,0x27bb766e
	.word	0x0174f856,0x4e960fb2,0x1f39b99c,0xf93dd47e
	.word	0x6e6999d3,0xacda7ea7,0x257f894b,0xff699744
	.word	0xd997d99d,0x36d2ab7f,0xa5ef406c,0xc95dfdb2
	.word	0x959dd5d1,0xbad9d225,0x3b3b2ac6,0xc6ecaa3d
	.word	0x7ba673e2,0xdb95db1b,0x68c0074d,0xe66442e2
	.word	0x409fd821,0x0fed8af3,0xc86a2d81,0x611eeaac
	.word	0x9dc5ca66,0xde6cac2a,0x8dba8408,0x6bfa5b14
	.word	0xc9150493,0x2a245a83,0x2d621acd,0x8bc700d5
	.word	0x2b61fb91,0xa2ad9b2e,0xfd9984ca,0xba06765e
	.word	0x827e4bda,0x2451a458,0x8149e6c8,0xdabf25b9
	.word	0x3707b06f,0xb3a98660,0x6bba88e0,0x4e223551
	.word	0xe56e226d,0xfcbaa66c,0x5f0248b5,0x0d38686b
	.word	0x68a5f331,0x5a8318a4,0x6464bbca,0xfee10267
	.word	0x6589e893,0x99c9165f,0x4f403003,0xb8ff2e09
	.word	0x36fbd31c,0x4c9bec2a,0x385e3e1d,0xe114c64f
	.word	0xbe13e730,0xbcf8b4c6,0x1ba9ff5c,0x00f08dac
	.word	0xc90ad953,0xcb5d6f7a,0x8dc320f1,0x4c8fbf29
	.word	0x69da8845,0x71f0b37e,0x338605a5,0xae881762
	.word	0x4a1f2da8,0xd9883623,0x83e2cb74,0x94b49a34
	.word	0x7a5a2c56,0xb5957d1f,0xfca5597f,0xf8bfcb95
p1_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local0_begin:
p2_local0_start:
	.word	0x40a584ca,0x280fa0e9,0xa9f3b873,0x05045298
	.word	0x8f780170,0xf2081e22,0x1b475bf0,0x35127347
	.word	0x2a175555,0xe5f0b448,0x14f8824d,0x4e55b2fd
	.word	0x59d3de12,0xb71410e2,0x87663674,0x2da9ec5b
	.word	0xff7224ff,0x244c4a73,0x68c7b3d6,0xf8505c98
	.word	0x83aa2ac3,0xf44d871a,0x34e151c6,0x831df67f
	.word	0xb640d2d3,0xd9e23a0d,0xf8a9105e,0xa83ca97d
	.word	0x33a5d8ce,0xa2bb1c5e,0x43735cce,0xe05eb0e2
	.word	0xec8ed47f,0x8d4d677f,0xe3d1aca1,0xcad8ac5b
	.word	0xf40c5472,0x7ed8ddb8,0x1ae3ba97,0x1d6fe7f3
	.word	0xaea3b7df,0x2a77410a,0x833d3d2b,0xf69ae1ee
	.word	0x4ee28287,0x3a54859d,0xeece9c87,0xc64d2da2
	.word	0xba7aae94,0x5f759b5b,0xbde25dd8,0xb5cd329b
	.word	0x7d99bc0c,0xe97a3a02,0xd849c52b,0x6dfaa08e
	.word	0xeb5f1456,0x2cae1869,0xd14b4840,0xb075773b
	.word	0x19a8ddc4,0xe2f5079c,0xe4663897,0xd6b1b091
	.word	0x6431937f,0x6e23a922,0xb2fede03,0x860b81a2
	.word	0x84b4d130,0x63509993,0x4084b43a,0x5a44c687
	.word	0xf9a5389b,0x9f045b12,0x29893107,0xc01b2883
	.word	0x153bc086,0xfa884537,0x4a420b3e,0xce174669
	.word	0x10871b55,0xbf1f9cd5,0x4ae167e8,0xe1271348
	.word	0x3072693d,0x6d400b55,0x0953a23d,0xd5fbad48
	.word	0xea2b960c,0x38a14934,0x136e4ca7,0x03471c1f
	.word	0x398018f6,0xe9786c2b,0x2f837e80,0x424be712
	.word	0x9b1550a0,0x3f1cc60e,0x823f5bff,0xffe17e61
	.word	0xf405ef31,0x5ed0a434,0xff9c3a32,0xd5069287
	.word	0xb21da656,0x595a0332,0x0436f4b2,0x4186de0b
	.word	0x81743008,0x9693489d,0xa01d400a,0xeaa9dbfe
	.word	0xec032277,0xd46ff873,0x5fd6ae82,0xf0c6fdd3
	.word	0xa6a4310b,0xd986d262,0x224ec7a3,0xadb7b15c
	.word	0xcd772425,0x70933036,0xabb4c4bf,0x27f2b2a1
	.word	0xddcee017,0xf6edd9d0,0x5e5d8c8e,0xb31190ec
	.word	0x51db20d8,0xc1ba2d99,0x50408803,0xdb6624f3
	.word	0xe628728e,0x7d3bf19b,0xed697e32,0xc1f35c5d
	.word	0x19068f8c,0xf6547363,0x3cc7627c,0x5adf5c9d
	.word	0x6554dafa,0xc47f80a7,0xd63de33f,0x05a9058c
p2_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local1_begin:
p2_local1_start:
	.word	0x4eb43d9a,0x9c8a35db,0x7f4ece34,0xf4fe6bb0
	.word	0x44425035,0xa99ed21c,0x1757cf7c,0xd5e17e71
	.word	0x9728c8a6,0x03cc0c9a,0x90843549,0xad1d06ee
	.word	0x735630d9,0x0464f303,0xc628972d,0x3d5c042c
	.word	0xf9a725ef,0xd58a9384,0x751bcdf6,0x5f9c6962
	.word	0xdd404c66,0xeb391a84,0xe1901cd7,0x63d8b725
	.word	0x149b0dbe,0xe51425a3,0x0bb1ef7a,0x7d410468
	.word	0xa4148510,0x2a684f3b,0x9d95735b,0xd2e9b0a4
	.word	0x6b4fb96f,0xd035d9cd,0x33450b7c,0x80e482d2
	.word	0x5de3888d,0x169ba2c6,0xbc8e77ac,0x0db92a22
	.word	0xbac9f82a,0x123c5052,0xac5a91d7,0x66a80ad7
	.word	0x51a746a6,0x725eee44,0x0ebc6c3a,0xd47c844b
	.word	0xe7100231,0x9dc2c90f,0x4667df67,0x4fde7c50
	.word	0x53e3a338,0xbc655f99,0x397d12e1,0x0248894f
	.word	0x4e193340,0xc224a8ef,0x110034bb,0xcab288de
	.word	0xa72c4279,0xafc323a2,0xf66ed6eb,0xd9db731d
	.word	0x8f0ab4c5,0x1cc57be9,0x02b7c38e,0x5ce6ca81
	.word	0x9741cf90,0xcdb913ea,0x280bfdf5,0xcf407e5d
	.word	0xb363bf5a,0xa88e58ed,0x1ed0a674,0x2044a997
	.word	0xe1c9486e,0xdf2dc6c1,0xbd5d3527,0xf9156235
	.word	0x7e19bcaa,0xf56a1899,0x38621c38,0xd95c4d9e
	.word	0xf9fe5914,0xa34e8d1b,0xb0231742,0x2175debf
	.word	0x882d9fa5,0xcce5b133,0x350fc7b7,0xdaa57687
	.word	0x689fe224,0xa9eb95be,0xfb0ac406,0x394e27b9
	.word	0xc3ddb912,0xdfef27e9,0x976de30d,0x3c403033
	.word	0x16c08030,0x3916a7ab,0x3a7d70a7,0x4ae4af90
	.word	0x5602b2b6,0xc6b163e6,0x12f91c8d,0xcc5b5f93
	.word	0xde818ed5,0xc25b1e1e,0xbe1cd6c5,0xd665fa4b
	.word	0x636d21a9,0x41f0a181,0x4837981c,0xb0066eb8
	.word	0xe6f6f563,0x7f31e53f,0x4f4fffed,0x98bdbf97
	.word	0xf77c67d2,0x24550e10,0xb12e394a,0x55aca8f2
	.word	0x4a6c6135,0xeb2ff1fa,0xe01b49a7,0xa1ce6591
	.word	0x904217eb,0xffe79dc1,0xb0582568,0xbb1c8e17
	.word	0x3a461a65,0x8edfc589,0xf6d63c51,0x0ab8a6f3
	.word	0xd745e4a6,0x57dfb15d,0xca4712cd,0x14820c96
	.word	0x53bb66f7,0x41817841,0xdc7c58d9,0x25db414f
p2_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local2_begin:
p2_local2_start:
	.word	0x5f6b98fa,0x996bd987,0x4069d2c7,0xc6ccff22
	.word	0xa2719302,0x60f13cd5,0xbd11bbb1,0xeb44ef72
	.word	0x1036c189,0x8b5ea2a4,0xf3e962e6,0x58e92af2
	.word	0xdc5ccb26,0x13b47655,0xceea3172,0x9108c59d
	.word	0x091638b8,0xf0339922,0x90e91103,0x3243f6ab
	.word	0x085a1026,0x8b003874,0xc908becd,0xfe36e01c
	.word	0x8534eac9,0xd9c8f52a,0xba43ded6,0xa819706a
	.word	0xd7336e09,0x93eea149,0xa259ffa5,0x99070ae7
	.word	0x39be3e8b,0x5344661d,0x407ecfed,0xb487ac94
	.word	0x331a5aa9,0xacae5c8c,0x34c5efaf,0xb53215cc
	.word	0x317ec128,0xcb8564c7,0x62771c93,0x6e7b92fa
	.word	0x73641e30,0xb204ff57,0xbbf77129,0x607a9bb2
	.word	0x4c38f7a7,0x6e548ce3,0x4c03c398,0x4ca97ce8
	.word	0x8fda765f,0x293fd5b7,0x6db3c43c,0xeb9cb1e6
	.word	0x5f98617a,0x394d8822,0xbce068fe,0xe09f1da9
	.word	0x3076741f,0xd721ad83,0x24ac539e,0x7a09a8dd
	.word	0x39f6fd06,0x44006b3a,0x1ad25ab7,0xcf134840
	.word	0xe1bf3237,0x3d9c7d05,0xc2185d5b,0xaa240778
	.word	0x45727e79,0xb75685c3,0x1257e5d7,0x28b67486
	.word	0x4c34d0cd,0x9c5e475f,0xfee68d20,0xb3572311
	.word	0x566c71fd,0x8b9b3c64,0x34857b8e,0x702d922c
	.word	0xcc61e89c,0x3ea152f8,0x129a753d,0x3228e6ad
	.word	0xe9ce56ab,0xf367e88f,0xb87fe39e,0x06b55d78
	.word	0xcb2d6f1f,0x85a72db7,0xbf0081d5,0xc3bb1045
	.word	0x6635c914,0xc9b72f67,0xfaeacf2e,0xeac6d4e7
	.word	0x2a301625,0x413fdb22,0x977d1770,0x02f58a39
	.word	0xe8fc1460,0xd5b97f9d,0x3520299e,0xcc461e0a
	.word	0xe4140bce,0xeb045bdd,0x8ea14e8a,0x2c412255
	.word	0x6712a02c,0x32341161,0xef776270,0x8dc6e7c5
	.word	0x18363a09,0x36502758,0x1185a2f7,0x1d5a8575
	.word	0xf7c944fa,0x297be9f6,0xc286f368,0x8e5c8555
	.word	0x753896c1,0x88da5539,0x0c033735,0xde0c58cb
	.word	0x141598f2,0xed813732,0x9cd45b25,0xb215d031
	.word	0x70539b5d,0x83ff0e82,0xb0112121,0xe430f70b
	.word	0xc00ea8ab,0x39b1486b,0x4251f063,0x59c28380
	.word	0xf2532f1e,0x5422f792,0x43b51b8e,0x1a3669fb
p2_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local3_begin:
p2_local3_start:
	.word	0x39512dec,0x3841e43c,0xc0a63eb5,0x78167f12
	.word	0x9b4bd569,0x6425acf8,0xa5a43e9b,0x20bdbcf8
	.word	0x1c2d7c5f,0x1b0bfced,0xa67c708e,0xc53d245e
	.word	0x78e58235,0xb3afa77b,0xe03f5007,0xbc7c45cc
	.word	0x31885bf3,0x0e5258ef,0xbad22a6a,0x26f21087
	.word	0x388682cb,0x25b76174,0xcb1c978c,0xa480061c
	.word	0xc2b7f19a,0xc7c30493,0xafc61a4d,0x6889c658
	.word	0x410e618a,0x330c0fcd,0x453dec1a,0x9857d104
	.word	0xd0e36021,0xbc93e4f5,0x3c46e8d5,0xea4b8880
	.word	0xcfa4919b,0xffe91607,0xdb42c161,0x25d5a3f3
	.word	0x2e62b78e,0x307751c4,0xef7dd038,0xea0360dd
	.word	0xd48375ef,0x8b58c573,0xc0fe92e3,0x9a97ed56
	.word	0x54e2dacb,0xabff5fb1,0x131cd588,0x1e6d3b40
	.word	0x2e8d7a45,0xb4edf92b,0x89faeacc,0xd27f6d02
	.word	0xfa0a6fa5,0x10f9e7f5,0xabfc9342,0x4f813720
	.word	0xf6f791bd,0xbc95741b,0x6beb5feb,0xed9c7a85
	.word	0x3e00b6bd,0xd176d4d6,0x676218c7,0xa5a393ea
	.word	0x2b4f34fe,0xfd2a5db3,0x215dc1b4,0xc18b90c4
	.word	0x778d16bb,0x94e2d536,0xcf74638c,0x66f3c7cf
	.word	0x88766c2a,0xaa65d269,0x7644c31b,0xec6216ab
	.word	0x43c17585,0xecd8a81f,0x1cd1fd77,0x5b802c5a
	.word	0x55a8047e,0xc3107400,0x63eaf823,0xde164d2b
	.word	0x77fba65e,0x8fb78a3c,0x7079c658,0xdf1484f3
	.word	0xbae11355,0x359ecab7,0x151ce28c,0x89da4349
	.word	0xcb2b2fe3,0x59645cde,0x35e687d1,0x7cc763d1
	.word	0x6f0241e6,0x54ef4902,0xe22eb756,0x6fdfef87
	.word	0x4dac0af0,0x438045bf,0x2854cd4e,0x574ff5eb
	.word	0xffde8050,0xb6463874,0x2877d285,0x0c88e84d
	.word	0xc3b61786,0x633038e3,0xfdc79bc4,0xd5b57c27
	.word	0xe47f59e6,0x90345213,0x7f5375f8,0xe8d67c51
	.word	0x183a875e,0x9f408410,0x6de5d524,0x822d0170
	.word	0xd5b3acde,0x1c0119f0,0xa3c4b1e2,0xc38f258b
	.word	0x267272f1,0xddd0cb5b,0x3af9ce17,0xb891dd81
	.word	0x65309348,0x50e51802,0xc98d2739,0x2c700b31
	.word	0x4607bfd6,0x83a33f9d,0x5d508a7d,0xf8e73b94
	.word	0x4aa3805e,0x6b0a0052,0x1c5c4d07,0x48ab1f2c
p2_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local4_begin:
p2_local4_start:
	.word	0xd65f2629,0x59423edf,0xe4f11003,0xc8526db8
	.word	0x6f1c8691,0x52229c06,0xc5bde767,0xf1ca1611
	.word	0x427a1168,0x6f0c9b72,0x1470215d,0xcf60df60
	.word	0xef3870c7,0x40602c9e,0x556600ee,0x5a4cb811
	.word	0xa3aedeb8,0x6e1fff65,0x050d39d8,0x56553f45
	.word	0xffcc3e6a,0x60df6952,0x07467ce3,0x34248656
	.word	0x8f724124,0xdf546bf8,0x2840f2cc,0x1401675c
	.word	0x53f74029,0x9c34bcfd,0xf27a2d24,0x061618ce
	.word	0x364a76df,0x79df80b8,0x0a904e12,0xd0d6e200
	.word	0xcef62b49,0x22f2e78d,0xc23bf695,0x8b805078
	.word	0xbadff6cc,0xed324e7b,0x184877c8,0xf0bd780c
	.word	0xb53009f2,0x4dfc1a08,0x17613977,0x7c6a0d53
	.word	0xad2b9c6b,0x585b0dae,0xd98de309,0x28c8fe59
	.word	0x67e4eae1,0x5fc6843f,0x57f1f769,0xb9f50011
	.word	0x97f3d2c7,0xdaccfa0e,0x0199ba44,0xacef60a1
	.word	0x68364383,0xfaf246ed,0xac019c21,0x1bd6a232
	.word	0xfd3bb0cc,0x7cba9549,0xb826db2f,0xba1fef28
	.word	0xdca26ca8,0xf380f8a8,0x570c0b5f,0x33ce4407
	.word	0xc965fce5,0xb39d3497,0x76eee010,0xa29fbf61
	.word	0xfbb35bc2,0x36e1360f,0xde50430f,0x238a8a6f
	.word	0xd9031261,0xf33301b0,0xdbb436ba,0x65ad5782
	.word	0xd18122c1,0x78c10e74,0x2fd1a2e3,0xe063c2e7
	.word	0xf2285011,0xe4e0a0f2,0xd30cce57,0x0c8e5376
	.word	0x19e49882,0xa1d5477d,0x36a7bcc6,0xd049e64c
	.word	0xea741925,0xc7c601f8,0x9c2b1375,0xc9be3ec2
	.word	0xf61c8fa4,0xb867f9d7,0x0f124bf1,0xa0c66cf0
	.word	0x0f8e601d,0x3bd58ac5,0x0dae7f76,0x6272868d
	.word	0x53a87380,0xee5d51e9,0x3c069b37,0xd4920ded
	.word	0xccfd1571,0x3da590db,0xb9ad4400,0x54be293d
	.word	0x8210e2f3,0x703d840c,0x1da82ef3,0xee2c8a08
	.word	0x97f1561f,0x2280ccc4,0x634b2908,0x91a0318d
	.word	0xba1e101c,0xf40cc14e,0x0b45f2ab,0x488731af
	.word	0x1d621a5b,0x3573dfaf,0x53e7dbb5,0x58ec1747
	.word	0xe8a0c374,0x78760f46,0x7f962e17,0xf94bf1b1
	.word	0xd8c3d154,0x6e35a406,0x544d54cb,0xd411534d
	.word	0x379aa4c1,0x8deefa75,0xe80eae0d,0xb8513da2
p2_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local5_begin:
p2_local5_start:
	.word	0xc2de5721,0x29d1b203,0x3a2a28c8,0x9fc2cbe7
	.word	0x089cc8f5,0xc70f7a20,0xe0746110,0x7b4e45b8
	.word	0x6aa37435,0x58bde1c4,0xbe38a2ce,0x1aec3785
	.word	0xc5389307,0x721509fd,0xad7dc64f,0x9f2f4b4e
	.word	0x8365bb56,0xb6ecd872,0xa1bac433,0x6b41379a
	.word	0xf854cd4d,0xae063631,0x69112d63,0x5d56c5ac
	.word	0xc6ea6346,0xca9f2c16,0xa55c1641,0xb314d75e
	.word	0xd92ab5ef,0x6b488d7a,0x69e67587,0xe6c9a0ae
	.word	0x76df815a,0x29cea15c,0xd8e0347a,0xeaabc0b6
	.word	0xd0405bd0,0x9ec74264,0xe985e870,0xc8c0bc8c
	.word	0xb903ab20,0xb0e9d04a,0x7f81807d,0x75a3eca9
	.word	0x3c2c1da3,0xc4145a2a,0x89dd95ec,0x7682c928
	.word	0x7894c31a,0xc219ce14,0xc4b0cf3a,0x42b9e69c
	.word	0x22e9e9b1,0x5b2092de,0x5f51a551,0xcf78bc18
	.word	0x9c1e782c,0xc6a985b3,0xa04c748b,0x3ad4fc36
	.word	0xc0eed2a0,0xc1dacc39,0xec311079,0x4845c792
	.word	0x549a6fa5,0x242aa348,0xef95fcb0,0xa35784e9
	.word	0x8069b1e4,0x9be7bba3,0xa175e211,0x54d935e7
	.word	0x81126e5d,0x63eaf267,0x83651516,0xe2fafad7
	.word	0x71d3501d,0x827d3982,0x4967b511,0x31c8fc0a
	.word	0xb007dbbb,0xa4e99375,0xe4832016,0xc65d3acd
	.word	0x3b23ef86,0x4f66f890,0x0cd9720b,0xc7cf02b5
	.word	0x7274b4b1,0xab49c111,0x62fa1f59,0xd96c141e
	.word	0xa7109b78,0xd2e5ae2d,0xecb976f6,0xe2e6e45f
	.word	0x3accf0ca,0x6206a09d,0x08639613,0xf2fd62bc
	.word	0x1f35745b,0x77595930,0x44019f64,0xb8f3f3f0
	.word	0xbb30f021,0xac55fa9d,0x508a0aaa,0x90549d91
	.word	0xfbb3743d,0x6b7abe8c,0x1b75feb6,0xa4cd60c4
	.word	0x0a790160,0xfb429c02,0xe65a8c8d,0x171d094c
	.word	0xcad8ab8a,0x1886354f,0x70679582,0xd71c34c4
	.word	0xe7ae3061,0x84ed1fbe,0x9da5a4dd,0x21a2fc6d
	.word	0xe868ee8d,0xe96485ad,0xcc3e6305,0x60abe825
	.word	0xcd57278a,0x9dbee4db,0x4a0b4482,0x8ba12c7c
	.word	0x64e2ef2b,0xd24b7363,0xd85357da,0xc80aa22f
	.word	0x1daf5543,0x2599ec21,0x0c0f85b1,0x627edd38
	.word	0x5793bd8e,0x8567991b,0xf3a00bef,0xa6d66004
p2_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local6_begin:
p2_local6_start:
	.word	0x049ce354,0x715ae4d8,0x4353e2e5,0x28de81c9
	.word	0x017373e0,0x8b271c7e,0x204f1a78,0x78ba0546
	.word	0x8fc51343,0x6c1920a4,0x11f3c673,0x4f9dbe1b
	.word	0x0a89008b,0xa86e17e4,0xbdf1b91b,0x99efc9f5
	.word	0xff4aea30,0xf4823450,0xc9338571,0xdb7988c5
	.word	0xb5ad2112,0x74328874,0x008f14a5,0x0cdd0484
	.word	0x7800e8be,0x66fa9569,0x848ddbbb,0xa6394892
	.word	0x1a31934e,0xfc9644f7,0x14cc3500,0x00812838
	.word	0x59085a1a,0xeb654386,0x6db1b381,0xfb5660dd
	.word	0x9737732e,0x4e5e6dff,0x05392c8c,0xde8e25fb
	.word	0xd1f34e0c,0xda381c1c,0x9f210e6a,0x60de0eee
	.word	0x5dc1e0e5,0x15b73461,0x56ff34d1,0xee25a0d5
	.word	0xfe5cd341,0x78401b17,0xf409eca6,0xdd903db6
	.word	0xea4dc286,0xdd2880a7,0x2c018c19,0xa8e7b7fe
	.word	0x448dcd28,0xbafee9ad,0x595c6309,0xe48ce54a
	.word	0xb3988640,0xc1aed453,0xb3b3df44,0x8f53957d
	.word	0x3b87ef04,0x4d17ea07,0x7e049668,0xd5a098df
	.word	0x845aa753,0x30afcee2,0xb107a549,0x1b48fb12
	.word	0x9a77d83a,0x79292d83,0x89cdf07a,0x2dfc6931
	.word	0x14838438,0x36c3af0b,0x8e94616d,0x4b477d61
	.word	0x0ba29edc,0x3d849a3b,0xe3a76407,0x3edfac14
	.word	0x2bdc2821,0xcef09647,0xa6488676,0xd125c55c
	.word	0x9e458b98,0xb1e29354,0x7d2fb72d,0x2ce655ec
	.word	0x1fb49faa,0x6ee88b22,0x0de5e200,0xc137dce8
	.word	0x9aeb448c,0x56350a61,0xc47363be,0xc4ffa9ae
	.word	0x910b192b,0x5e396fc9,0x6c5c770e,0xb1b3abf2
	.word	0x0d4a0405,0x479a16b8,0xefafa70b,0xfa97ef97
	.word	0xef6a223b,0x1fdff96c,0x6588999d,0x44d275d8
	.word	0x9b675b58,0x2f06be9d,0x1a7a9c6f,0x860810f5
	.word	0x6ae8fb20,0x4619c8bc,0xff308b24,0x0d4c3d94
	.word	0xad1ebbf4,0xd8636c5b,0x0f128d70,0x8ce90a35
	.word	0x933790ac,0x4182e487,0xd479e8b6,0xc23d1d32
	.word	0xf630c00f,0xf8e29898,0xe293bcc1,0x1e7f1c47
	.word	0xe696d7f7,0x9ce58b2f,0xc679999e,0x34fda560
	.word	0xea05e9b5,0x7d0ae3b0,0x5e1a38b0,0xc5d05558
	.word	0x62142c35,0x471b69ba,0xc2224711,0x8022dcbe
p2_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local0_begin:
p3_local0_start:
	.word	0xa96c1898,0xbac72d84,0xdb4f11ba,0x645fbaa2
	.word	0x74a0dbb7,0x71c26e88,0x0897f0ac,0x45cbcc04
	.word	0x6d708468,0x5d56a15f,0xc9e45d52,0xbd2870a4
	.word	0xd8b31636,0x4ac0fd87,0x68f1cf4a,0x499664ba
	.word	0xf8058409,0x47a0f7ea,0xa7f02197,0x8f6342de
	.word	0xc9f4776a,0x4ee1fe0a,0xa69e7083,0x7d9bd8d6
	.word	0x38edcace,0xe0679704,0x17937b0a,0x08bce31e
	.word	0x0e727693,0xfb6c382c,0x3700ed1e,0x72c5e9bf
	.word	0x5039dcc4,0xe1d6ed8b,0xb7dbc035,0x489bd429
	.word	0x2eb5874f,0xfc831e15,0x9783f462,0x2be334fe
	.word	0x15cb2b61,0xc3ca8390,0x0e1b7a6a,0x7b6c20ab
	.word	0x0e717753,0xda4a5c1a,0xc40b943d,0x18f1dd99
	.word	0xf14d0e03,0x462a1cdc,0xaea6546d,0x2c7d5bd8
	.word	0x1ae686b9,0x4573d6af,0xa6f3ba19,0x8c006c8b
	.word	0x34f4f8af,0x956d3025,0x0d0fb5c9,0x75bf7e96
	.word	0xccf33927,0xc999c98d,0x39bd8489,0x2cac0bc5
	.word	0x496cfc2a,0x997e4785,0x6088da26,0xb12b8a94
	.word	0xf51740ea,0xdc59253a,0x5624d490,0x662363fd
	.word	0xd8b09060,0x3fdf5798,0x02896272,0x754dab85
	.word	0x36eb88de,0xa9dc2cdd,0xa257f0f9,0x88bd8e74
	.word	0x252e35a3,0x468265fb,0xb63db9b6,0x2ed10209
	.word	0xaba65c52,0xf6637c04,0x26c1ff89,0xbd5df601
	.word	0x448a03c4,0xd7ac6693,0x229ac0a7,0x130374f0
	.word	0xd698ad6c,0xfabad7cd,0x1cf040f0,0xcabdef89
	.word	0x44a5301a,0x16c45ffd,0x7fe34c94,0x5fe54f90
	.word	0x62e5186b,0x7decdea9,0xa38a0956,0x04b6b6fe
	.word	0x38ad7304,0x7b152270,0x81398ccb,0x6078e511
	.word	0xadb0546e,0x35c6633c,0x22b873df,0x3af62891
	.word	0x8026b00b,0xc30a1fe9,0x39ade916,0x7a31abe6
	.word	0x8ce37d4e,0x36ac25d5,0xa335e79b,0x8b97911e
	.word	0x062e7326,0xdcf3c3eb,0xbcd759ef,0xc23ece88
	.word	0x98acc13b,0x746541bb,0xb3cb95aa,0x98fec8f4
	.word	0x8789757e,0x2c8c0f91,0x2a454e8b,0xf58cf62d
	.word	0x8efece62,0x9dfe3154,0x34d34a9b,0x0018ccc2
	.word	0xdc65f8b6,0x5bc79816,0x3bf5a69a,0x073c0e84
	.word	0xd904d5c3,0x93acbd55,0xe900cbfe,0x33931435
p3_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local1_begin:
p3_local1_start:
	.word	0x024b339c,0xe94dc075,0x23f97298,0xedc304d3
	.word	0x76ac1deb,0xaa75628b,0x4c1e063c,0xa56ece86
	.word	0xc7df62b8,0xd07b2ff3,0xaeab5dce,0x470dd645
	.word	0x9ffcec60,0x82f90e05,0x27f832ae,0x3f5186c0
	.word	0x3271bb97,0xe64e7bfc,0xa7efb010,0x98003416
	.word	0x232ccb17,0x2b7b0f42,0x74924e2a,0x51be3e56
	.word	0x444024da,0x15ba2b2b,0x10757125,0x902e96f2
	.word	0x82e90d51,0x6d7367d0,0x075a5971,0x5d4cb109
	.word	0xe2c729a5,0xf92d99b8,0x9c06a7d4,0x154b8471
	.word	0xc2c3150f,0x75bd7720,0x44ea373c,0x9473761c
	.word	0x793434e0,0x9a75debf,0xffc8c618,0xa117c5ab
	.word	0x3cda5b49,0x2d313dc9,0xc00e3c8b,0xd58f1022
	.word	0xdf221418,0xa9411c46,0xce461708,0xcc6dbb78
	.word	0x68151f2b,0x88ce2b51,0xf08c052f,0x6f7bcb1e
	.word	0x2dd3e595,0xdd397735,0x674729cf,0xeb1af436
	.word	0x466ee3dc,0x892df032,0x70108d72,0x6082c398
	.word	0xbb3858ef,0x922641d6,0x59b8d636,0x9c035eaf
	.word	0x3499a6c7,0x7cfd2889,0x4a544e0d,0x36fd7866
	.word	0x0882d825,0x49982bef,0xb652709c,0x65c7a76c
	.word	0x8a954045,0x1e571061,0x3813d353,0xa68efd41
	.word	0x903e9098,0xc9ccac99,0x96ae29e7,0xd990c14f
	.word	0x1b152748,0xdd092105,0xbc902ee1,0x9bef3df8
	.word	0x656aa146,0x445e405b,0x032a91ae,0x8b509e7c
	.word	0x03dfd2e6,0x3850faab,0xad3405d6,0xa9d33c1b
	.word	0x3d4aaa24,0xbd7e2bfc,0x3d46c57d,0x3489c69a
	.word	0xf227f605,0x11f45a1b,0xa9215c0a,0x4f4449cc
	.word	0xf7b261bc,0xda5a4513,0xed7b28ef,0xee2b875d
	.word	0x524f886c,0x6da7556e,0xa1d44355,0x659910b1
	.word	0xebbc101d,0x75c35ee5,0x60e7e39a,0xab3b85e0
	.word	0x41cd989e,0x197b6d25,0x7b96038f,0x4e1580b8
	.word	0xa34fe759,0xa4cc5655,0x2e90681b,0xe451047d
	.word	0x691b4f5b,0x243ca4cb,0x08c8b294,0x67299b2a
	.word	0x6cc3976a,0x00619f9c,0xabac053f,0x4acf8d78
	.word	0xfd814406,0xa68d5d82,0xa390b4a1,0x7d341b92
	.word	0xcfd932f7,0x0640f75d,0x3f591277,0x720a3ce2
	.word	0xdf633720,0x394e098f,0x7916524a,0x935c045b
p3_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local2_begin:
p3_local2_start:
	.word	0x32f55c6a,0x45a6d2cc,0xb4da1e8e,0x5d1e7f23
	.word	0x06939ca7,0x7582f0d4,0x52dcec9a,0x07316382
	.word	0xbf133298,0x15b32b9b,0x37bfd6eb,0xaa854afc
	.word	0xdd10b183,0xa65f00b7,0x94a76003,0x8e767d88
	.word	0x20e90910,0x31d0aad2,0xf5d32dc0,0x08e346aa
	.word	0x2cd192de,0x2f5c1d1f,0x50936daa,0xf72a472b
	.word	0xf7fd0ad9,0x77437177,0xb64b36de,0xfed8af8b
	.word	0x2699437a,0x087eed38,0x998b78e3,0xdc9e774b
	.word	0xcb240995,0xf553e531,0x15057074,0x6f524e7e
	.word	0xc9b7e3d9,0xaa44a74b,0x848d40be,0x58addd26
	.word	0x3faf6c9d,0xeea2e91c,0xc0df7230,0x8124397d
	.word	0x158f97a9,0x33127448,0x8ec113b6,0xfecfe45f
	.word	0x3bc9ab91,0x8d5c4222,0xd6d4742b,0xc317ab58
	.word	0x02ac4dbd,0x9e38fe08,0x54fad359,0xb393d073
	.word	0x1a5d392c,0x7317afd2,0x6a8f0e97,0x4af07807
	.word	0x0d3022a4,0x1f51f7cd,0x1898c042,0xd8525747
	.word	0xd79dfb1d,0x036ee0d9,0x66e88d69,0x679cc26d
	.word	0xb69b5154,0x241cf501,0x3bd0c0c4,0xb4dd8b04
	.word	0x1097afc5,0x7509a0ec,0x19a44965,0x191504bd
	.word	0x0a0bbda2,0xe8fd0f45,0x1fd011d8,0x00738cb9
	.word	0xf4762ab5,0x063e5f7e,0xbdc93f44,0x118ad064
	.word	0xc7bac341,0x44de3746,0x1412ea7a,0x624b8755
	.word	0x9d357ee1,0x294bc33c,0x8af41495,0xcfc57e71
	.word	0xeaade064,0x02418f9d,0xce637702,0xe8639932
	.word	0x05caaf28,0x5412e2f5,0x49986f3c,0x2520d345
	.word	0xe913f39e,0x79e72923,0x4ff6def6,0x22a82cf8
	.word	0x0f3081db,0x0d544c3f,0x180b63ae,0x89f2bea8
	.word	0x702f9dc6,0xec56714f,0x07222d9b,0x60fd5cbf
	.word	0x429b4f91,0xbebfee30,0xf9b375ad,0xb016f26c
	.word	0xc1eeec01,0x4b5c49e4,0x4f66a168,0xbf0d2daf
	.word	0xa3473351,0x3ed87c74,0x60f9433e,0x99481672
	.word	0xaa6b4ce2,0x70aa384c,0x16b79262,0x5ed77601
	.word	0xc2d4272a,0xb6523b0b,0xaaf0cde1,0x1d615bcb
	.word	0x82852590,0xf7ea8668,0x6ff557d2,0x664d2268
	.word	0x66437dc3,0x6ba6a4dc,0x3d407206,0xc39eb375
	.word	0x10e6f855,0xd3061f05,0x83a2fe08,0x46ce64b4
p3_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local3_begin:
p3_local3_start:
	.word	0xe6c1d0ff,0xe96ab8e1,0x6b7c78a7,0xf0d6e278
	.word	0xc0242d7d,0xa7134640,0x4117c319,0xcdd29f89
	.word	0xa650cdfe,0x9cb0c86a,0x9994c1f9,0xe85bb661
	.word	0xab7262fd,0xa56ad279,0x28f000b9,0x300fbf73
	.word	0x19d3984c,0xcb449785,0xadbc90c2,0xe0cfd55c
	.word	0xd41b0359,0x3eb24944,0x11f72eec,0x49e2fefe
	.word	0x61bbb40a,0x43497fa6,0xe4d6a865,0x789a3e7f
	.word	0x1c273295,0x468b9ee2,0x65887873,0xd0c94686
	.word	0xc13e2309,0x5d708013,0x099a4b68,0x647f7bea
	.word	0x0451596c,0x20fb8ed5,0x87beaedc,0x5a1f0082
	.word	0x67da795b,0xff121bcb,0x25d65e10,0x39a24863
	.word	0x5f68b8a3,0xac385bb3,0xe5fcc3da,0x65fa21f5
	.word	0x78865005,0xcda6880f,0x9b90ad59,0xf6baa210
	.word	0x3beeef68,0x34060fde,0x02b96658,0xb2af50cc
	.word	0x5f50d589,0x65a629b4,0x4d171e01,0x9257343f
	.word	0xf26c0bfc,0xa4c4189a,0xcba9a7ed,0x7934fc99
	.word	0xce086b99,0xc0e6fd00,0xba3614a2,0x22f83a37
	.word	0xce64f4d5,0x2bd252ef,0x01b3e7b6,0xbf184621
	.word	0x641bb732,0x574e1559,0x15f2df8c,0x69f6b478
	.word	0xba9829cc,0xe6d3137e,0x9dbfbb23,0xe151c56b
	.word	0x04a4c000,0xdb0de9ce,0xdc32b0fc,0x393399ac
	.word	0xb39a1e7b,0x7bd0b95f,0x4144a457,0xaf1c8050
	.word	0x60ba55f5,0x3c04281e,0xf5d7f703,0x3daa8c89
	.word	0x3daedae9,0x4cd99908,0x7130f69f,0x28962688
	.word	0x56cd331f,0x5ba1cfc1,0x5342623c,0x44fcbdae
	.word	0x9b74a189,0x333b29e8,0x9c6c3b2e,0xac35162b
	.word	0x2000fc82,0x6fea4ca5,0xbe9eb79f,0x60f4a234
	.word	0x5c3a6216,0x1678b2d5,0x7f9fb1f0,0xff6e1334
	.word	0x28583a94,0x8e3884ab,0xe55c1602,0x2f67f007
	.word	0xa713a887,0x1f1ab0ad,0xe5b322a8,0xe4f640d8
	.word	0x3dbc9441,0x712dd350,0x2ae7ed2c,0xfd140209
	.word	0x89c72a81,0xf3ac2957,0x6672f83d,0x31f08b00
	.word	0x1d0192d8,0x15a2ab1c,0x48e8abc3,0x3ea0e2a0
	.word	0xd1e61234,0x79461d44,0xb39979e3,0x19adadd1
	.word	0x63082c31,0xd4cc1fe0,0x74f268eb,0x3fdbf17e
	.word	0x955d4f19,0xbe6ddc7f,0xf8ad83e4,0x29cfc2f4
p3_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local4_begin:
p3_local4_start:
	.word	0x2eead780,0x0c80fb42,0x29675ac5,0x5da6582e
	.word	0xeb7320d9,0x5f1fb4c1,0xce4408f3,0x3c12f90b
	.word	0x417f0657,0x32ef8975,0x93822440,0xa32da1a5
	.word	0xf61f685d,0x7c980f72,0x33e7ff87,0x2a6a366c
	.word	0x5b52af5e,0x5b5c75ca,0x1e3a3457,0x1526a6d0
	.word	0x7fe28974,0xe2f511d1,0xe2cf9c0c,0xd5bd19bc
	.word	0x148e5d78,0xda8475e7,0xed6a3bcf,0x71c29199
	.word	0x66cd82e9,0x67061e87,0xc9672e5e,0x5f30e818
	.word	0x9adeec81,0xe721b220,0x64de64ba,0x6fee3c29
	.word	0x86a40c63,0x8afcd036,0xf4519e98,0x82167a12
	.word	0xec1707a3,0x9659fee9,0xb6e9a006,0xd04c3fff
	.word	0x15a5630e,0xe641057f,0xec0e363a,0x2af40d88
	.word	0xd95fb919,0x3a7203b5,0xea9f9f7a,0x9b296e82
	.word	0xc7909d99,0xc19f592c,0x5a70d02a,0x6fb3bd82
	.word	0x8ce81338,0x7523af40,0x94825a2d,0x7ba8d58d
	.word	0x3edd6ee6,0xa77d95a7,0x76cf9404,0xf764d1fd
	.word	0xf611c2f9,0xb8eeeab1,0xe871b950,0xe38df070
	.word	0xd4713b8c,0x415edc9b,0x6557057a,0xf3c75324
	.word	0xb8602728,0xb5238f90,0x97deb244,0x74419791
	.word	0x421768ca,0x04e5286b,0xa0a7da29,0xde17796b
	.word	0x744a8d9a,0x97cbdf35,0xe3bedef1,0x9afe4ad5
	.word	0x05ee6701,0x933ca134,0xa1e02d8e,0xcb94254e
	.word	0xfe8db89d,0x43e1806c,0x4c43aadc,0xed6d232c
	.word	0x51c324f7,0xf9fa00d4,0x6fdf4780,0xe5b07a82
	.word	0x7f94f4bc,0xf4ffdc85,0x329838dc,0x9c056eab
	.word	0x4d5f15cb,0x8e04e1b8,0x0d67bff8,0xa124956f
	.word	0x0cff2485,0xd3fd7997,0xace00d1a,0xd68939a7
	.word	0x3380091b,0xb8bb02f1,0x019ba1fa,0x9fd80a75
	.word	0x37e3960a,0x8c2a7944,0x28211f95,0x4c380563
	.word	0xed230d2f,0xa306f079,0x9d971b42,0x8906881d
	.word	0xa2adcac5,0xa26cbd88,0xbf5a65b8,0x2875e930
	.word	0x50c9a28a,0x34956c6e,0x052869d4,0x24f8529b
	.word	0x9c824bd3,0x1773b7b5,0x115bdcd7,0x046e0529
	.word	0x9cdeb49e,0x4992ed12,0x5869d119,0x83feb8e7
	.word	0xe17a2c90,0xdf388882,0x103c42dd,0xa96b9a9b
	.word	0x4bcc5164,0xeb2f52b8,0x9127b06f,0x5cf94645
p3_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local5_begin:
p3_local5_start:
	.word	0x6d8aed1f,0xafcc64a4,0xc32886cf,0x7d8a8315
	.word	0x970117c2,0x1c415e46,0x20e57f57,0x220e29eb
	.word	0xc7690b98,0xc31a0b3b,0x383a7782,0x82143d64
	.word	0xf7cd550c,0x68645871,0xa42a30b7,0x1268799e
	.word	0x922736ac,0xb931ad8a,0xd0594e69,0x153dcdda
	.word	0x01260d4e,0x1d309d90,0x83a91e24,0xfdaa5d22
	.word	0x10e70c4f,0xdd117ead,0x9279c069,0x574b41be
	.word	0x0dbc47c5,0x6abd5176,0x7e8a25bc,0x50c7c332
	.word	0xf7922077,0xe595c0e4,0xa8ed853c,0x05efd2ac
	.word	0x4d2fa21f,0xda430d0f,0x0d43e199,0x892186a0
	.word	0x3497c84f,0x3767e69a,0x9316499f,0x675d350d
	.word	0xc85571c8,0x4e470e40,0x47451ff8,0xdf3d786d
	.word	0xce482aaf,0x738e866f,0xb923ca50,0x12330915
	.word	0x78a1ce79,0xefe204f3,0xc9b568d6,0x2cc8a65a
	.word	0x08727a21,0x02f419fd,0xe2a96eae,0xac74d465
	.word	0xb6f1528e,0x198cfbdb,0x61399fd8,0xedef35b5
	.word	0xe5438bd9,0xc2ce1e72,0x4f5d87e0,0x7db3d01a
	.word	0x795ce9eb,0x2d55cc2b,0xee164a41,0x1587f186
	.word	0x3ce3b57b,0xa5570e62,0xe725770e,0xb8e5cb3f
	.word	0x7220f5ed,0x09cf3902,0xe5fd69a2,0x163ae10c
	.word	0xa1ff007b,0x326e1966,0x0669abe5,0x9660cdb5
	.word	0x440bd70d,0xec4d5cb2,0x53c3d8c7,0x8012bf50
	.word	0x5346763c,0x1429984b,0x93f0083a,0x0429be66
	.word	0xf4a0b985,0xd2da546c,0xf335e8bf,0x198a15a3
	.word	0x301f3376,0x4cd5d7d6,0x8afbb789,0x3d95a64c
	.word	0xaeb96d0d,0x378866a5,0x4082f8b6,0xa15a51f6
	.word	0xfa0a0649,0xda2d417c,0xe1168b0b,0x989a952b
	.word	0xf955a7ea,0x1ebec5d8,0xa9e4f110,0x43f6b5c4
	.word	0xa68353e5,0x9a639242,0xb33d4786,0x894ec3c5
	.word	0x10c6fb4c,0x66fe4e47,0x50785561,0x4c8a03b5
	.word	0x14c0e6fe,0x9604d88d,0x7b05c4b4,0x0385fcfa
	.word	0x742b0130,0x7ad82468,0x4fcf990e,0x5a273a06
	.word	0x607437fc,0x12db71b9,0xcc068310,0x901b9c7e
	.word	0x30dfdff0,0x6508c04f,0x698b14d4,0x2e266f54
	.word	0x99bf6d1e,0x73014560,0xc961ed56,0x6f6367d1
	.word	0x04b4eab7,0x60547864,0x0f683cb5,0xd511ede8
p3_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local6_begin:
p3_local6_start:
	.word	0x93b05806,0x0beaf141,0xc7308cf6,0xd37c7600
	.word	0xde7a51f2,0xa62f38e5,0xcfdbb605,0xf7cfbcbd
	.word	0x793273eb,0x765cfa0e,0x64405d23,0x0a3b903e
	.word	0x8f87f81b,0x3a894813,0xd3ea7d12,0x84822c9c
	.word	0x4f97dfe2,0x1f1870e5,0x06108544,0xab31b87b
	.word	0x215dceee,0x6eefaac9,0x0b092afa,0x96d91477
	.word	0xe794fdd1,0x422249c5,0x9da5adce,0x84e2b187
	.word	0x29f94729,0x41599212,0x65751473,0xb195d513
	.word	0xcf8a8bab,0x1cfd050e,0xae52383f,0x7bda2666
	.word	0x8cd1b429,0xdbc25d00,0x49c2b8b6,0x24d69528
	.word	0x1eec2f5d,0x45fb1fdb,0x7e478f50,0x24d90094
	.word	0x2affd83c,0x3e7fb2b4,0xe0067934,0x0788fb25
	.word	0xb659e761,0x475461f0,0x91c12f3c,0x27c21ecd
	.word	0xff9f7846,0xa0dba748,0x0529f965,0x346ffa24
	.word	0xf52b84fe,0x042c998e,0xdb4ac302,0x8ed56368
	.word	0x15fb1769,0xe6ff038f,0xf088e705,0x8171d17e
	.word	0x67c45268,0x96773006,0x877152e4,0x81183cca
	.word	0x892b8180,0x57399f48,0x25a50263,0xbe1acfa9
	.word	0x4a1d23cc,0x37d278f1,0x87aa43fa,0x796c434e
	.word	0xd70f3616,0x15fe8dc2,0x4b76a191,0x86763f81
	.word	0x5356f2ce,0x1c5c3b9e,0xf219b15a,0x1dcc3a9d
	.word	0x26f718da,0x87234f01,0x88c17a72,0xfc9190e0
	.word	0xef0fa641,0xc613158d,0x3e20874a,0x3319c520
	.word	0x1ab3bc98,0x03a5defc,0x94d6ea42,0x5048fa83
	.word	0x921fed85,0x80608962,0x59a93ee9,0x0717ce9b
	.word	0x65e3e905,0x2de27682,0xf5f01ee6,0x96783836
	.word	0xe452a2b3,0x2bbe8d43,0x882bf79f,0x9e93b21e
	.word	0xbb6aaae5,0xc633a7c1,0x71340799,0x02b38f57
	.word	0x25b4d166,0x270eaede,0x71e7e41a,0x11174b14
	.word	0x7c0af995,0xf2e8a417,0xc6c498b8,0xd16995a3
	.word	0x214efa10,0x59c1d588,0xf7b4a16a,0x9d0ac047
	.word	0xae7e68e2,0x19e7f297,0x31a3784d,0x9e31cab9
	.word	0x732af0a4,0x2f85ae24,0x3630f8a4,0xaefdab03
	.word	0x9e3d89b4,0xbbed21fd,0x695c9dc9,0xac14cacd
	.word	0x84181fc7,0x481f8fc2,0x9da1dd0a,0x262fd5b9
	.word	0x5f46145d,0x6ebb7867,0x1a4737e6,0x113aa4c4
p3_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
share0_begin:
share0_start:
	.word	0xfdd36e48,0x3333dc64,0x57077d11,0x87e64d82
	.word	0x0c19b02e,0x02090562,0xf404a466,0x6bd14271
	.word	0x0d10adac,0xe6acc0e6,0x3ce13520,0x16ad0125
	.word	0x6528a9f5,0xa333a6dd,0x8dfdebcb,0x68b2a857
	.word	0x1cdcab8f,0x879eb436,0xf53a95b3,0xa3d74807
	.word	0x4cf6a711,0x5ae4ce67,0x9f9c316f,0xbc1da8ed
	.word	0x24c53171,0xecff8891,0x778a6660,0xd55d1034
	.word	0xfe0b4953,0x5219bcf9,0xac9762c9,0x1c8219b2
	.word	0xae5bf151,0xc429b520,0x741a7fcc,0x45f5c209
	.word	0x74076136,0x50b81108,0x2f035738,0xc72b2a47
	.word	0x09716ca4,0xa21166fd,0xae77191e,0xaa78386f
	.word	0x76259813,0xffbb7c8e,0xf626bc45,0xd1c49365
share0_end:
	.seg	"data"
	ALIGN_PAGE_8K
share1_begin:
share1_start:
	.word	0x77b3408b,0xcb239338,0x67b34320,0x024b4bbf
	.word	0x197004aa,0x6017df28,0xc927fffe,0x7568b7b5
	.word	0x731daa69,0x5f4a6421,0x3511a25d,0x7d4fabbf
	.word	0x7462e5c8,0x6b75b14f,0x391c9b88,0xa19977c9
	.word	0x224bbb69,0x114e8651,0xdc93b241,0x78fb9bfa
	.word	0xeadecc76,0xe9ff5445,0x546a4338,0x2124fba4
	.word	0x4ddea900,0x7098fc4a,0xae1db2bb,0xe44feeef
	.word	0x442116c2,0x6e6c8994,0x3af0c160,0x7d99a2de
	.word	0xe097905c,0x54dba9cb,0x71a40168,0x0e9f0228
	.word	0x44a0323b,0xf085ed9f,0xc3b92b46,0x32897bb2
	.word	0xa75f37f0,0xbf47a878,0x0fc87fe6,0x7027480a
	.word	0x265020dd,0x22f07994,0x9e9352cb,0x53b13af9
share1_end:
	.seg	"data"
	ALIGN_PAGE_8K
share2_begin:
share2_start:
	.word	0x65fb397f,0x57d318f3,0x06d73620,0x8c22a00c
	.word	0xf802c030,0x1e6edb0b,0xdad84bcb,0xd3e6d829
	.word	0x69287eb5,0x467ee2e9,0x3bb42b1d,0x8ef0c9b4
	.word	0x6d144a37,0xfe855d0b,0x5df0b5a6,0xa42fee60
	.word	0x13bbfdd9,0xc04a7505,0xc469f861,0xe470b4f1
	.word	0x360ca8e2,0x09fd29f9,0xd88bfbac,0x4baa4539
	.word	0xc72172d5,0xd1d23371,0xfbb0585b,0x70563773
	.word	0xfd5048ae,0xdaf97d69,0xfba92fe7,0xcaa5f8f9
	.word	0x4373407e,0xe1ac45ef,0xac572bd9,0x5febe045
	.word	0xcc0aeee8,0xb6edee87,0x3e6a93ab,0xc8a986b9
	.word	0xaf117fca,0x7e93fe8a,0xb4fff799,0xf8e61eea
	.word	0x6b395a0c,0xca46a819,0x82fd0997,0x2c4ab6df
share2_end:
	.seg	"data"
	ALIGN_PAGE_8K
share3_begin:
share3_start:
	.word	0xee07703d,0x0a986dbb,0xd7be0d90,0x6ad840af
	.word	0x2deec708,0x6afd07a0,0xb208c56a,0x14f57e15
	.word	0xf89719fb,0x82714212,0xe1adb88c,0xc94bf068
	.word	0x783e45e3,0xe5645d4e,0x68ce143b,0x9f17960c
	.word	0xdd7edd86,0x030dd456,0xc1fe7073,0xb4cf6148
	.word	0xe22adeed,0xd0636e50,0x2b37be41,0x78f9c0f6
	.word	0x5e0cbb4c,0xc49a8633,0xf6411d2e,0x8407e3f3
	.word	0x00efd10d,0x7add54fd,0x81ea5029,0x04706b00
	.word	0x80df7258,0x965cf9dc,0xb66cd626,0x1c4bf126
	.word	0xdb9c14e6,0x5513dc5d,0x3eb68aa7,0x0295e66c
	.word	0x218fc647,0x2950eac2,0xd0a526ea,0xe7cf42b7
	.word	0x9a7cc18b,0xb0c5852f,0x26f6c883,0x7af490f8
share3_end:
	.seg	"data"
	ALIGN_PAGE_8K
common_begin:
common_start:
	.word	0x272a0430,0x3e2a0e05,0x3831001b,0x0d19263e
	.word	0x39290b36,0x320b0a3f,0x1e221414,0x2c192415
	.word	0x2d280b1f,0x0f061e39,0x352b0024,0x1a38373f
	.word	0x261e0a0f,0x063a0a3a,0x02192505,0x1a273f08
	.word	0xc8bb229d,0x91d8934d,0xcda77cd5,0xa978f412
	.word	0xb3d69280,0xa3949cec,0xf4f09965,0x56fe3cb9
	.word	0x4b1eaaaf,0xec5ab1ad,0x10bf0748,0x7cc13d31
	.word	0x21e4b775,0x40879175,0xc89cf7ce,0xea16aa34
common_end:
	.seg	"data"
	ALIGN_PAGE_8K
unres0_begin:
unres0_start:
	.word	0x8f1e7491,0x1f47a2f8,0xaf60c67b,0x2d367bd5
	.word	0x9c30bc65,0xa121acca,0x4305f62b,0x3af9b5da
	.word	0x5d456367,0x46314fb7,0x41534fa0,0x894af11e
	.word	0xa4943b33,0x3a1e3068,0xb226fbb3,0x3ec07eee
	.word	0x73250d1d,0x48395d52,0x8e1c8c7e,0x1df58c8b
	.word	0x03bec3bc,0x11a1e99d,0x9ece4774,0xfd27ffb1
	.word	0xd7521c0a,0x5b600007,0xc83f5640,0xd915231a
	.word	0xbf0be83e,0x1113430c,0xebde9552,0x17df7ad6
	.word	0xb8d979a1,0x3f9d60f0,0x3e4026d4,0xf61159b2
	.word	0x72332532,0x455e439c,0x619eee58,0xdf74f224
	.word	0x6a8e0b51,0xe778cf81,0x21b93296,0xb3e1f56c
	.word	0x4620c532,0xc36114e4,0xd998876f,0x073d4ced
unres0_end:

