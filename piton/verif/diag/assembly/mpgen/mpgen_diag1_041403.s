// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mpgen_diag1_041403.s
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
!	Seed = 414121005
!	CIAM can be on
!	4 Processors, 1000 lines each
!	mpgen   created on Oct 14, 2002 (10:12:19)
!	diag.s created on Apr 14, 2003 (12:10:05)
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
	ldd	[%g1+0x00],%f0		! %f0  = 0c93e933, %f1  = 4032ede6
	ldd	[%g1+0x08],%f2		! %f2  = ca5ea27d, %f3  = 454bcf7d
	ldd	[%g1+0x10],%f4		! %f4  = c1f2eeca, %f5  = 20534db2
	ldd	[%g1+0x18],%f6		! %f6  = 7197f1c6, %f7  = 90da9f95
	ldd	[%g1+0x20],%f8		! %f8  = 49f955fc, %f9  = b28a92dc
	ldd	[%g1+0x28],%f10		! %f10 = 038bdc18, %f11 = a3290154
	ldd	[%g1+0x30],%f12		! %f12 = 253461ae, %f13 = efa3f0d0
	ldd	[%g1+0x38],%f14		! %f14 = d2c263b4, %f15 = 7f069c76
	ldd	[%g1+0x40],%f16		! %f16 = 4d2c1099, %f17 = c61e4e34
	ldd	[%g1+0x48],%f18		! %f18 = 1ff7720f, %f19 = d934d788
	ldd	[%g1+0x50],%f20		! %f20 = 2346f85b, %f21 = 24dc609f
	ldd	[%g1+0x58],%f22		! %f22 = 4874d559, %f23 = 627d5242
	ldd	[%g1+0x60],%f24		! %f24 = 19e301bf, %f25 = bcdbd69e
	ldd	[%g1+0x68],%f26		! %f26 = fc3799d8, %f27 = 58c578d9
	ldd	[%g1+0x70],%f28		! %f28 = 9cc40ab5, %f29 = 0c6b6220
	ldd	[%g1+0x78],%f30		! %f30 = 412cec15, %f31 = 57d7f5f0
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l5 = cf2b1cff90d5b1d0, immed = 0000000a, %l7 = 7810310062f5c7c4
	sra	%l5,0x00a,%l7		! %l7 = ffffffffffe4356c
!	%l0 = 59722b000ff11fa5, immed = 000002d4, %y  = 00000000
	udivcc	%l0,0x2d4,%l3		! %l3 = 000000000005a30c, %ccr = 00
!	Mem[000000001100008c] = 4774e548, %l7 = ffffffffffe4356c
	lduwa	[%i2+0x08c]%asi,%l7	! %l7 = 000000004774e548
!	%l2 = 220c72005095e099, Mem[0000000011000008] = 88878ba1
	stha	%l2,[%i2+%o6]0x80	! Mem[0000000011000008] = e0998ba1
	ba	p0_b1			! Branch Taken, %ccr = 00, CWP = 0

p0_label_2:
!	%l7 = 000000004774e548, Mem[0000000030000008] = 7072eb5a1313872f
	stx	%l7,[%o0+0x008]		! Mem[0000000030000008] = 000000004774e548
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x001,%g2
p0_b1:
	membar	#Sync			! Added by membar checker (1)
!	%f12 = 253461ae efa3f0d0, %f12 = 253461ae efa3f0d0, %f14 = d2c263b4 7f069c76
	fsubd	%f12,%f12,%f14		! %f14 = 00000000 00000000
!	%l4 = e13664ffc60d4c51, immed = 00000ddc, %l1 = b0178200525d1e9b
	xnor	%l4,0xddc,%l1		! %l1 = 1ec99b0039f2be72
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003080000c] = 7881b801, %l0 = 59722b000ff11fa5
	ldstub	[%o1+0x00c],%l0		! Annulled
p0_b2:

p0_label_3:
	membar	#Sync			! Added by membar checker (2)
!	%l4 = e13664ffc60d4c51, Mem[0000000031800000] = c6855110
	stba	%l4,[%o3+0x000]%asi	! Mem[0000000031800000] = 51855110
!	%f0  = 0c93e933 4032ede6, %f16 = 4d2c1099 c61e4e34
	fnegd	%f0 ,%f16		! %f16 = 8c93e933 4032ede6
	set	p0_b3,%o7
	fbo	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	%l0 = 59722b000ff11fa5, Mem[0000000010000030] = ad928741d91b0c10
	stx	%l0,[%i0+0x030]		! Mem[0000000010000030] = 59722b000ff11fa5
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x003,%g2
p0_b3:
!	Registers modified during the branch to p0_far_3
!	%l4  = 00000000224b8aff
	membar	#Sync			! Added by membar checker (3)
!	%l3 = 000000000005a30c, Mem[0000000040000014] = 3533383e
	stw	%l3,[%o5+0x014]		! Mem[0000000040000014] = 0005a30c

p0_label_4:
	set	p0_b4,%o7
	fba,pt	%fcc2,p0_near_1_le	! Branch Taken, %fcc2 = 0
!	Mem[000000003080004c] = 7124f48b, %l2 = 220c72005095e099
	lduw	[%o1+0x04c],%l2		! %l2 = 000000007124f48b
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x004,%g2
p0_b4:
!	Registers modified during the branch to p0_near_1
!	%l0  = ffffffffdaa4f84e
!	%l1  = 000000000005aecc
!	%l3  = 000000007124f6fe
!	%l7  = 0000000000000059
	set	p0_b5,%o7
	fbge,a	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000110000a0] = 8d21ee1d6c3c6553, %l0 = ffffffffdaa4f84e
	ldx	[%i2+0x0a0],%l0		! %l0 = 8d21ee1d6c3c6553
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x005,%g2
p0_b5:
!	Registers modified during the branch to p0_far_2
!	%l7  = cf2b1cff90d5b59b
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_5:
!	Mem[0000000012800008] = c34331c2, %l7 = cf2b1cff90d5b59b
	ldswa	[%i5+%o6]0x80,%l7	! %l7 = ffffffffc34331c2
p0_b6:
	membar	#Sync			! Added by membar checker (4)
	set	p0_b7,%o7
	fbuge,pn %fcc1,p0_near_2_le	! Branch Taken, %fcc1 = 0
!	%l2 = 000000007124f48b, Mem[0000000010800008] = de0d6172ff47a121
	stxa	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = 000000007124f48b
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x007,%g2
p0_b7:
!	Registers modified during the branch to p0_near_2
!	%l2  = 00000000001598e2
	membar	#Sync			! Added by membar checker (5)
!	%l2 = 00000000001598e2, Mem[000000003000004c] = 12e56ada
	stwa	%l2,[%o0+0x04c]%asi	! Mem[000000003000004c] = 001598e2
!	Mem[0000000031000048] = b4ef4beb, %l2 = 00000000001598e2
	lduh	[%o2+0x048],%l2		! %l2 = 000000000000b4ef

p0_label_6:
!	Mem[0000000013000008] = 9d90c7f7 234f7968, %l4 = 224b8aff, %l5 = 90d5b1d0
	ldda	[%i6+%o6]0x80,%l4	! %l4 = 000000009d90c7f7 00000000234f7968
!	%l6 = 604dc5ffd1e5dbce, immed = 00000ced, %y  = 00000000
	udivcc	%l6,0xced,%l1		! %l1 = 0000000000103d1b, %ccr = 00
!	Mem[0000000030000040] = d22e4bf9 cad5e2d8, %l0 = 6c3c6553, %l1 = 00103d1b
	ldda	[%o0+0x040]%asi,%l0	! %l0 = 00000000d22e4bf9 00000000cad5e2d8
!	Branch On Register, %l1 = 00000000cad5e2d8
	brgz,a,pt %l1,p0_b8		! Branch Taken
!	Mem[0000000010000080] = 6f41edf1, %l2 = 000000000000b4ef
	ldub	[%i0+0x083],%l2		! %l2 = 00000000000000f1
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x008,%g2
p0_b8:

p0_label_7:
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030800040] = 2d4a93d5, %l4 = 000000009d90c7f7
	lduw	[%o1+0x040],%l4		! %l4 = 000000002d4a93d5
	fbul,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000010000000] = 82181650, %l2 = 00000000000000f1
	lduha	[%i0+%g0]0x80,%l2	! Annulled
p0_b9:
	membar	#Sync			! Added by membar checker (7)
!	%l5 = 00000000234f7968, Mem[0000000011000008] = e0998ba1
	stwa	%l5,[%i2+%o6]0x80	! Mem[0000000011000008] = 234f7968
!	%f2  = ca5ea27d 454bcf7d, %f12 = 253461ae efa3f0d0
	fcmpd	%fcc1,%f2 ,%f12		! %fcc1 = 1

p0_label_8:
!	Mem[0000000010000090] = 8426195e, %l6 = 604dc5ffd1e5dbce
	swapa	[%i0+0x090]%asi,%l6	! %l6 = 000000008426195e
!	%l6 = 000000008426195e, immed = 000000d7, %l2 = 00000000000000f1
	xnorcc	%l6,0x0d7,%l2		! %l2 = ffffffff7bd9e676, %ccr = 80
!	%l1 = 00000000cad5e2d8, Mem[0000000010800008] = 000000007124f48b
	stxa	%l1,[%i1+%o6]0x80	! Mem[0000000010800008] = 00000000cad5e2d8
!	Mem[000000003000004c] = 001598e2, %l3 = 000000007124f6fe
	lduba	[%o0+0x04c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000031800048] = 3bf53b21 224b8aff, %l4 = 2d4a93d5, %l5 = 234f7968
	ldda	[%o3+0x048]%asi,%l4	! %l4 = 000000003bf53b21 00000000224b8aff

p0_label_9:
!	%l0 = 00000000d22e4bf9, Mem[000000001000000e] = 1687c075
	stb	%l0,[%i0+0x00e]		! Mem[000000001000000c] = 1687f975
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800000] = 34ef4b3c, %l5 = 00000000224b8aff
	ldsha	[%i1+%g0]0x80,%l5	! Annulled
p0_b10:
	membar	#Sync			! Added by membar checker (8)
!	%l2 = ffffffff7bd9e676, %l6 = 000000008426195e, %y  = 00000000
	udivx	%l2,%l6,%l4		! %l4 = 00000001efecfb7f
!	%l3 = 0000000000000000, Mem[0000000031800048] = 3bf53b21
	stw	%l3,[%o3+0x048]		! Mem[0000000031800048] = 00000000

p0_label_10:
	fbue,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000030000008] = 000000004774e548, %l5 = 00000000224b8aff
	ldx	[%o0+0x008],%l5		! Annulled
p0_b11:
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030800049] = c035e4b6, %l6 = 000000008426195e
	ldstuba	[%o1+0x049]%asi,%l6	! %l6 = 0000000000000035
!	%f14 = 00000000 00000000, %f18 = 1ff7720f d934d788, %f0  = 0c93e933 4032ede6
	fmuld	%f14,%f18,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],1

p0_label_11:
	set	p0_b12,%o7
	fble,pt	%fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 1
!	%l0 = d22e4bf9, %l1 = cad5e2d8, Mem[0000000010000090] = d1e5dbce aa828b72
	std	%l0,[%i0+0x090]	! Mem[0000000010000090] = d22e4bf9 cad5e2d8
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x00c,%g2
p0_b12:
!	Registers modified during the branch to p0_near_2
!	%l3  = 00000000d22e4af4
!	%l6  = 00000000d22e4bf9
	membar	#Sync			! Added by membar checker (10)
!	%f3  = 454bcf7d, %f24 = 19e301bf bcdbd69e
	fitod	%f3 ,%f24		! %f24 = 41d152f3 df400000
!	Mem[0000000011800080] = 0d8ac0e4 01861380 979c8363 702787df
	prefetcha [%i3+0x080]%asi,20
	set	p0_b13,%o7
	fbo,a	p0_far_2_he	! Branch Taken, %fcc0 = 0

p0_label_12:
!	Mem[0000000030000040] = d22e4bf9, %l7 = ffffffffc34331c2
	swap	[%o0+0x040],%l7		! %l7 = 00000000d22e4bf9
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x00d,%g2
p0_b13:
!	Registers modified during the branch to p0_far_2
!	%l1  = fffffffffbfffa36
!	%l3  = ffffffff7bd9de54
!	%l4  = fffffffffbffefff
!	%l7  = 00000000d22e480a
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000130000e0] = cc0318f9 0b0239cb, %l4 = fbffefff, %l5 = 224b8aff
	ldda	[%i6+0x0e0]%asi,%l4	! %l4 = 00000000cc0318f9 000000000b0239cb
!	%l0 = 00000000d22e4bf9, immed = fffff5c1, %l6 = 00000000d22e4bf9
	subccc	%l0,-0xa3f,%l6		! %l6 = 00000000d22e5638, %ccr = 19
	set	p0_b14,%o7
	fbule,pn %fcc2,p0_near_0_he	! Branch Taken, %fcc2 = 0
!	Mem[000000003000004c] = 001598e2, %l1 = fffffffffbfffa36
	lduh	[%o0+0x04c],%l1		! %l1 = 0000000000000015
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x00e,%g2
p0_b14:
!	Registers modified during the branch to p0_near_0
!	%l5  = 00000000d22e4bec

p0_label_13:
	membar	#Sync			! Added by membar checker (12)
!	%l4 = 00000000cc0318f9, immed = 00000cbf, %l2 = ffffffff7bd9e676
	orncc	%l4,0xcbf,%l2		! %l2 = fffffffffffffbf9, %ccr = 88
	set	p0_b15,%o7
	fbuge,a	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	%l4 = 00000000cc0318f9, Mem[0000000010800000] = 34ef4b3c
	stha	%l4,[%i1+%g0]0x80	! Mem[0000000010800000] = 18f94b3c
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x00f,%g2
p0_b15:
!	Registers modified during the branch to p0_far_0
!	%l1  = 01a45c97d8000000
!	%l3  = 000000000000220b
!	%l5  = 00000fffffffffff
!	%l6  = 00000000cc0314f2
!	%l7  = e641f8a6882cf537
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000011800020] = 5ba84873 6efeb797 8e060c7f cc954210
	prefetch [%i3+0x020],1
!	%f16 = 8c93e933, %f9  = b28a92dc
	fmovs	%f16,%f9 		! %f9  = 8c93e933

p0_label_14:
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800088] = 0091cf4d, %l1 = 01a45c97d8000000
	ldsh	[%i1+0x088],%l1		! Annulled
p0_b16:
	membar	#Sync			! Added by membar checker (14)
!	%l5 = 00000fffffffffff, Mem[0000000030000008] = 000000004774e548
	stxa	%l5,[%o0+0x008]%asi	! Mem[0000000030000008] = 00000fffffffffff
	fbl,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000012800080] = de01f490 85344ecc f98c0576 a976418c
	prefetch [%i5+0x080],4	! Annulled
p0_b17:

p0_label_15:
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l2 = fffffffffffffbf9, Mem[0000000030000048] = f62556a8
	stw	%l2,[%o0+0x048]		! Annulled
p0_b18:
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000031000000] = 73277b10, %l3 = 000000000000220b
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000027
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = fffffbf9, %l3 = 00000027, Mem[0000000011800000] = dcd211b7 067b67f9
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000011800000] = fffffbf9 00000027
p0_b19:

p0_label_16:
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000100000e0] = 85556e80 9921d991 7fb41c34 442bbb3c
	prefetcha [%i0+0x0e0]%asi,2
!	%f18 = 1ff7720f d934d788, %f26 = fc3799d8 58c578d9
	fcmped	%fcc2,%f18,%f26		! %fcc2 = 2
!	Branch On Register, %l6 = 00000000cc0314f2
	brlz,pn	%l6,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010800000] = 18f94b3c, %l3 = 0000000000000027
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 0000000018f94b3c
p0_b20:
	membar	#Sync			! Added by membar checker (17)
!	%f0  = 00000000 00000000, %f16 = 8c93e933 4032ede6, %f2  = ca5ea27d 454bcf7d
	faddd	%f0 ,%f16,%f2 		! %f2  = 8c93e933 4032ede6

p0_label_17:
!	%l1 = 01a45c97d8000000, immed = fffff830, %y  = 00000000
	sdiv	%l1,-0x7d0,%l4		! %l4 = ffffffffffe45a1d
	bgu,a	p0_b21			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000011000060] = d3679ec7 fe839644 8b3802cf 0be9c617
	prefetch [%i2+0x060],0
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x015,%g2
p0_b21:
	membar	#Sync			! Added by membar checker (18)
!	%l3 = 0000000018f94b3c, %l7 = e641f8a6882cf537, %l5 = 00000fffffffffff
	srlx	%l3,%l7,%l5		! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010800008] = 00000000cad5e2d8
	stxa	%l5,[%i1+%o6]0x80	! Mem[0000000010800008] = 0000000000000000

p0_label_18:
!	%f24 = 41d152f3 df400000, %f10 = 038bdc18 a3290154
	fdtox	%f24,%f10		! %f10 = 00000000 454bcf7d
!	%l7 = e641f8a6882cf537, immed = fffffeba, %l0 = 00000000d22e4bf9
	orcc	%l7,-0x146,%l0		! %l0 = ffffffffffffffbf, %ccr = 88
!	Mem[0000000032000040] = ba91c68a c2a2c541 60739feb c1c67d6b
	prefetcha [%o4+0x040]%asi,16
!	%f24 = 41d152f3, %f2  = 8c93e933
	fabss	%f24,%f2 		! %f2  = 41d152f3
!	%f24 = 41d152f3 df400000, %f0  = 00000000 00000000, %f18 = 1ff7720f d934d788
	faddd	%f24,%f0 ,%f18		! %f18 = 41d152f3 df400000

p0_label_19:
!	%f23 = 627d5242, %f20 = 2346f85b
	fmovs	%f23,%f20		! %f20 = 627d5242
	set	p0_b22,%o7
	fba	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800000] = 18f94b3c fe491c0e 00000000 00000000
	prefetch [%i1+0x000],23
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x016,%g2
p0_b22:
!	Registers modified during the branch to p0_far_0
!	%l1  = 0000000000000000
!	%l3  = 0000000000000220
!	%l5  = 000000000000000f
!	%l6  = ffffffffffe45616
!	%l7  = e641f8a6882cf537
	membar	#Sync			! Added by membar checker (19)
!	Mem[00000000110000a0] = 8d21ee1d 6c3c6553 6c81ef7e b1eb2f18
	prefetcha [%i2+0x0a0]%asi,21
!	Mem[0000000031800000] = 51855110, %l1 = 0000000000000000
	ldsw	[%o3+0x000],%l1		! %l1 = 0000000051855110

p0_label_20:
!	%f14 = 00000000 00000000, %f26 = fc3799d8 58c578d9
	fmovd	%f14,%f26		! %f26 = 00000000 00000000
!	Mem[00000000110000e0] = 007d62b6 107aaea1
	flush	%i2+0x0e0
!	%l4 = ffffffffffe45a1d, Mem[000000001180000e] = 836d4975
	sth	%l4,[%i3+0x00e]		! Mem[000000001180000c] = 836d5a1d
!	%l4 = ffe45a1d, %l5 = 0000000f, Mem[00000000100000b0] = d58e1f34 8ac8367b
	std	%l4,[%i0+0x0b0]	! Mem[00000000100000b0] = ffe45a1d 0000000f
!	%l4 = ffffffffffe45a1d, %l6 = ffffffffffe45616, %l0 = ffffffffffffffbf
	xor	%l4,%l6,%l0		! %l0 = 0000000000000c0b

p0_label_21:
!	Mem[0000000011000060] = d3679ec7 fe839644 8b3802cf 0be9c617
	prefetcha [%i2+0x060]%asi,0
	set	p0_b23,%o7
	fbule,a,pt %fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000010800020] = cde4ac84 2f45537b 110eb19c da432f62
	prefetch [%i1+0x020],22
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x017,%g2
p0_b23:
!	Registers modified during the branch to p0_near_3
!	%l0  = cc83f14d1022969b
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000012800008] = c34331c2 1b86bb00, %l6 = ffe45616, %l7 = 882cf537
	ldda	[%i5+%o6]0x80,%l6	! %l6 = 00000000c34331c2 000000001b86bb00
!	%l3 = 0000000000000220, %l4 = ffffffffffe45a1d, %l7 = 000000001b86bb00
	tsubcc	%l3,%l4,%l7		! %l7 = 00000000001ba803, %ccr = 13

p0_label_22:
!	Mem[00000000108000b4] = 49fcfd86, %l7 = 00000000001ba803
	lduwa	[%i1+0x0b4]%asi,%l7	! %l7 = 0000000049fcfd86
!	Mem[0000000010800002] = 18f94b3c, %l2 = fffffffffffffbf9
	ldstuba	[%i1+0x002]%asi,%l2	! %l2 = 000000000000004b
!	Mem[00000000130000f4] = b535a9bf, %l5 = 000000000000000f
	lduw	[%i6+0x0f4],%l5		! %l5 = 00000000b535a9bf
	set	p0_b24,%o7
	fbo,a,pn %fcc1,p0_near_1_le	! Branch Taken, %fcc1 = 1
!	Mem[00000000110000a0] = 8d21ee1d 6c3c6553 6c81ef7e b1eb2f18
	prefetch [%i2+0x0a0],21
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x018,%g2
p0_b24:
!	Registers modified during the branch to p0_near_1
!	%l0  = ffffffffdaa4f84e
!	%l1  = 0000000000000ee8
!	%l3  = 000000000000023e
!	%l7  = 0000000000000059

p0_label_23:
	membar	#Sync			! Added by membar checker (21)
!	%l4 = ffffffffffe45a1d, immed = fffff97a, %l3 = 000000000000023e
	addcc	%l4,-0x686,%l3		! %l3 = ffffffffffe45397, %ccr = 99
!	%l7 = 0000000000000059, %l4 = ffffffffffe45a1d, %l0 = ffffffffdaa4f84e
	andn	%l7,%l4,%l0		! %l0 = 0000000000000040
	bneg	p0_b25			! Branch Taken, %ccr = 99, CWP = 0
!	%l4 = ffe45a1d, %l5 = b535a9bf, Mem[0000000011000028] = f69488f8 86e783bc
	std	%l4,[%i2+0x028]	! Mem[0000000011000028] = ffe45a1d b535a9bf
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x019,%g2
p0_b25:
	membar	#Sync			! Added by membar checker (22)
!	%l5 = 00000000b535a9bf, immed = fffffd16, %l5 = 00000000b535a9bf
	subc	%l5,-0x2ea,%l5		! %l5 = 00000000b535aca8

p0_label_24:
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	%l2 = 000000000000004b, Mem[0000000010800070] = c077e3cb
	stw	%l2,[%i1+0x070]		! Mem[0000000010800070] = 0000004b
p0_b26:
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000013000008] = 9d90c7f7234f7968, %l3 = ffffffffffe45397
	ldxa	[%i6+%o6]0x80,%l3	! %l3 = 9d90c7f7234f7968
!	Mem[00000000100000a0] = 9ae1d353 444bb0e6 2c7c39f4 57c016b3
	prefetch [%i0+0x0a0],0
!	Mem[0000000011800040] = 068c7990, %l1 = 0000000000000ee8
	ldsh	[%i3+0x040],%l1		! %l1 = 000000000000068c

p0_label_25:
!	%l6 = 00000000c34331c2, Mem[00000000108000e8] = 5252f3ef5095e099
	stxa	%l6,[%i1+0x0e8]%asi	! Mem[00000000108000e8] = 00000000c34331c2
!	%f6  = 7197f1c6, %f25 = df400000
	fabss	%f6 ,%f25		! %f25 = 7197f1c6
!	Mem[0000000010000008] = 5e1c047f, %l4 = ffffffffffe45a1d
	ldstuba	[%i0+%o6]0x80,%l4	! %l4 = 000000000000005e
!	Mem[0000000010800008] = 00000000, %l7 = 0000000000000059
	ldsha	[%i1+%o6]0x80,%l7	! %l7 = 0000000000000000
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 99

p0_label_26:
!	Mem[0000000011800054] = a58bd908, %l1 = 000000000000068c
	ldsh	[%i3+0x054],%l1		! Annulled
p0_b27:
	membar	#Sync			! Added by membar checker (24)
	fblg,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000010800008] = 00000000, %l0 = 0000000000000040
	ldswa	[%i1+%o6]0x80,%l0	! Annulled
p0_b28:
	membar	#Sync			! Added by membar checker (25)
	set	p0_b29,%o7
	fbul,a,pt %fcc1,p0_near_1_he	! Branch Taken, %fcc1 = 1
!	%l5 = 00000000b535aca8, Mem[00000000108000e9] = 00000000
	stb	%l5,[%i1+0x0e9]		! Mem[00000000108000e8] = 00a80000
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x01d,%g2
p0_b29:
!	Registers modified during the branch to p0_near_1
!	%l3  = fffffffffffff059

p0_label_27:
	membar	#Sync			! Added by membar checker (26)
!	%f16 = 8c93e933, %f22 = 4874d559
	fabss	%f16,%f22		! %f22 = 0c93e933
!	Branch On Register, %l6 = 00000000c34331c2
	brlez,a,pn %l6,p0_not_taken_0	! Branch Not Taken
!	%l2 = 000000000000004b, Mem[0000000030000048] = f62556a8
	stw	%l2,[%o0+0x048]		! Annulled
p0_b30:
	membar	#Sync			! Added by membar checker (27)
!	%l7 = 0000000000000000, %l6 = 00000000c34331c2, %l7 = 0000000000000000
	xnorcc	%l7,%l6,%l7		! %l7 = ffffffff3cbcce3d, %ccr = 80
!	Mem[0000000011000008] = 234f7968, %l5 = 00000000b535aca8
	ldsha	[%i2+%o6]0x80,%l5	! %l5 = 000000000000234f

p0_label_28:
!	%f18 = 41d152f3 df400000, %f10 = 00000000 454bcf7d
	fabsd	%f18,%f10		! %f10 = 41d152f3 df400000
!	Mem[0000000011800077] = efb9feaf, %l6 = 00000000c34331c2
	ldstuba	[%i3+0x077]%asi,%l6	! %l6 = 00000000000000af
	bgu,a	p0_b31			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[0000000010000008] = ff1c047f, %l3 = fffffffffffff059
	lduwa	[%i0+%o6]0x80,%l3	! %l3 = 00000000ff1c047f
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x01f,%g2
p0_b31:
!	call to call_3, CWP = 0
	call	p0_call_3_he

p0_label_29:
!	%l1 = 000000000000068c, Mem[0000000010000000] = 821816500a73f443
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010000000] = 000000000000068c
!	Registers modified during the branch to p0_call_3
!	%l0  = ffffffff3cbccffd
!	%l3  = a000000000000000
!	%l5  = 0000005dfffbda76
!	%l6  = ffffffff00e3fbcc
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000011000018] = 6ac0280a ba336194, %l4 = 0000005e, %l5 = fffbda76
	ldda	[%i2+0x018]%asi,%l4	! %l4 = 000000006ac0280a 00000000ba336194
!	%l7 = ffffffff3cbcce3d, immed = 00000f70, %l4 = 000000006ac0280a
	orncc	%l7,0xf70,%l4		! %l4 = fffffffffffffebf, %ccr = 88
	bgu	p0_b32			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010800008] = 00000000, %l4 = fffffffffffffebf
	ldsha	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x020,%g2
p0_b32:

p0_label_30:
	membar	#Sync			! Added by membar checker (29)
!	%l2 = 000000000000004b, Mem[0000000010800000] = 18f9ff3cfe491c0e
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000010800000] = 000000000000004b
	set	p0_b33,%o7
	fbule,pt %fcc1,p0_near_2_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000011000008] = 234f7968, %l3 = a000000000000000
	swapa	[%i2+%o6]0x80,%l3	! %l3 = 00000000234f7968
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x021,%g2
p0_b33:
!	Registers modified during the branch to p0_near_2
!	%l3  = ffffffff196d5590
!	%l6  = ffffffff196d5695
	membar	#Sync			! Added by membar checker (30)
!	%l6 = ffffffff196d5695, immed = 000000a1, %y  = 0000005d
	umul	%l6,0x0a1,%l7		! %l7 = 0000000ffdc373b5
	bvc	p0_b34			! Branch Taken, %ccr = 91, CWP = 0

p0_label_31:
!	Mem[000000001180004c] = f1512597, %l1 = 000000000000068c
	ldub	[%i3+0x04f],%l1		! %l1 = 0000000000000097
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x022,%g2
p0_b34:
	membar	#Sync			! Added by membar checker (31)
!	%l2 = 000000000000004b, %l2 = 000000000000004b, %l7 = 0000000ffdc373b5
	subccc	%l2,%l2,%l7		! %l7 = ffffffffffffffff, %ccr = 99
!	%l5 = 00000000ba336194, Mem[0000000010800038] = fff22123
	stba	%l5,[%i1+0x038]%asi	! Mem[0000000010800038] = 94f22123
!	Branch On Register, %l1 = 0000000000000097
	brnz,pt	%l1,p0_b35		! Branch Taken
!	Mem[0000000011000060] = d3679ec7, %l2 = 000000000000004b
	ldsh	[%i2+0x062],%l2		! %l2 = ffffffffffff9ec7
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x023,%g2
p0_b35:

p0_label_32:
	fblg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000000] = dcb23c09, %l1 = 0000000000000097
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000dcb23c09
p0_b36:
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010800060] = b7620b0c, %l0 = ffffffff3cbccffd
	ldub	[%i1+0x060],%l0		! %l0 = 00000000000000b7
!	Mem[0000000010000014] = 076aa311, %l2 = ffffffffffff9ec7
	ldub	[%i0+0x016],%l2		! %l2 = 00000000000000a3
	bvc,a	p0_b37			! Branch Taken, %ccr = 99, CWP = 0

p0_label_33:
!	Mem[0000000040000014] = 0005a30c, %l0 = 00000000000000b7
	lduw	[%o5+0x014],%l0		! %l0 = 000000000005a30c
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x025,%g2
p0_b37:
	membar	#Sync			! Added by membar checker (33)
	fbul,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],1
p0_b38:
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000040000010] = 2b1c2522, %l3 = ffffffff196d5590
	ldstuba	[%o5+0x010]%asi,%l3	! %l3 = 000000000000002b
	fbn,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 1

p0_label_34:
!	Mem[0000000010800008] = 00000000, %l1 = 00000000dcb23c09
	lduha	[%i1+%o6]0x80,%l1	! %l1 = 0000000000000000
p0_b39:
	bg	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[00000000118000e0] = 9aae4e52 d344aedc 87b74602 57be45cc
	prefetch [%i3+0x0e0],2
p0_b40:
	bl	p0_b41			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000011800020] = 5ba84873 6efeb797 8e060c7f cc954210
	prefetch [%i3+0x020],16
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x029,%g2
p0_b41:

p0_label_35:
	membar	#Sync			! Added by membar checker (35)
!	Mem[000000003080004c] = 7124f48b, %l5 = 00000000ba336194
	ldsb	[%o1+0x04f],%l5		! %l5 = ffffffffffffff8b
!	%l1 = 0000000000000000, %l3 = 000000000000002b, %y  = 0000000f
	udivcc	%l1,%l3,%l2		! %l2 = 00000000594d6535, %ccr = 00
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000011800000] = fffffbf9, %l2 = 00000000594d6535
	lduba	[%i3+%g0]0x80,%l2	! Annulled
p0_b42:
	membar	#Sync			! Added by membar checker (36)
!	%l7 = ffffffffffffffff, immed = ffffff43, %y  = 0000000f
	smulcc	%l7,-0x0bd,%l3		! %l3 = 00000000000000bd, %ccr = 00

p0_label_36:
!	Mem[00000000108000a8] = 00000000 000000ff, %l6 = ffffffff196d5695, %l2 = 00000000594d6535
	add	%i1,0xa8,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 2ae0ff0c18a11557
!	%l1 = 0000000000000000, immed = 00000002, %l4 = 0000000000000000
	sllx	%l1,0x002,%l4		! %l4 = 0000000000000000
!	%l2 = 2ae0ff0c18a11557, immed = 000002f9, %l2 = 2ae0ff0c18a11557
	xor	%l2,0x2f9,%l2		! %l2 = 2ae0ff0c18a117ae
	set	p0_b43,%o7
	fba	p0_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000012800000] = 78ffb457 cda72d0a c34331c2 1b86bb00
	prefetch [%i5+0x000],16
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x02b,%g2
p0_b43:
!	Registers modified during the branch to p0_far_3
!	%l1  = 00000000000003d9
!	%l2  = 00000000c0ffe4b6
!	%l5  = 0000000000000000

p0_label_37:
	membar	#Sync			! Added by membar checker (37)
!	Mem[000000001080002e] = da432f62, %l4 = 0000000000000000
	ldstuba	[%i1+0x02e]%asi,%l4	! %l4 = 000000000000002f
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],3
!	%l1 = 00000000000003d9, immed = 000006d0, %l7 = ffffffffffffffff
	orncc	%l1,0x6d0,%l7		! %l7 = fffffffffffffbff, %ccr = 88
!	Mem[0000000010800080] = 019d184e ef217f99 0091cf4d d17f8942
	prefetcha [%i1+0x080]%asi,23
!	%l2 = 00000000c0ffe4b6, immed = fffff22a, %y  = fffffff4
	udiv	%l2,-0xdd6,%l6		! %l6 = 00000000ffffffff

p0_label_38:
!	%l2 = 00000000c0ffe4b6, immed = fffff35a, %l6 = 00000000ffffffff
	orncc	%l2,-0xca6,%l6		! %l6 = 00000000c0ffecb7, %ccr = 08
	bne,a	p0_b44			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[00000000100000c0] = ae657699 6fc33bb7 5467df53 06c1dbad
	prefetch [%i0+0x0c0],20
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x02c,%g2
p0_b44:
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000008] = 00000000, %l2 = 00000000c0ffe4b6
	ldsba	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000000
p0_b45:

p0_label_39:
	membar	#Sync			! Added by membar checker (38)
!	%l2 = 0000000000000000, immed = 00000a5f, %y  = fffffff4
	sdivx	%l2,0xa5f,%l1		! %l1 = 0000000000000000
!	%l7 = fffffffffffffbff, %l2 = 0000000000000000, %l6 = 00000000c0ffecb7
	xnor	%l7,%l2,%l6		! %l6 = 0000000000000400
	ba,a	p0_b46			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000011000001] = 00000097, %l6 = 0000000000000400
	ldstub	[%i2+0x001],%l6		! Annulled
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x02e,%g2
p0_b46:
	membar	#Sync			! Added by membar checker (39)
!	%f23 = 627d5242, %f27 = 00000000
	fabss	%f23,%f27		! %f27 = 627d5242

p0_label_40:
	bleu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000001080006e] = 0c5bb192, %l0 = 000000000005a30c
	ldstub	[%i1+0x06e],%l0		! Annulled
p0_b47:
	fbl	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031800008] = 8ec04124, %l2 = 0000000000000000
	ldub	[%o3+0x00a],%l2		! %l2 = 0000000000000041
p0_b48:
	membar	#Sync			! Added by membar checker (40)
!	%f8  = 49f955fc, %f30 = 412cec15 57d7f5f0
	fitod	%f8 ,%f30		! %f30 = 41d27e55 7f000000

p0_label_41:
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000000] = 00000000, %l0 = 000000000005a30c
	swapa	[%i0+%g0]0x80,%l0	! Annulled
p0_b49:
	bl	p0_b50			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000010800008] = 0000000000000000, %l4 = 000000000000002f
	ldxa	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x032,%g2
p0_b50:
	membar	#Sync			! Added by membar checker (41)
!	%l0 = 000000000005a30c, %l3 = 00000000000000bd, %l3 = 00000000000000bd
	srax	%l0,%l3,%l3		! %l3 = 0000000000000000

p0_label_42:
!	%l3 = 0000000000000000, %l6 = 0000000000000400, %l2 = 0000000000000041
	and	%l3,%l6,%l2		! %l2 = 0000000000000000
	bne	p0_b51			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000011800088] = 979c8363 702787df, %l2 = 00000000, %l3 = 00000000
	ldd	[%i3+0x088],%l2		! %l2 = 00000000979c8363 00000000702787df
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x033,%g2
p0_b51:
	membar	#Sync			! Added by membar checker (42)
!	%l7 = fffffffffffffbff, %l7 = fffffffffffffbff, %l5 = 0000000000000000
	andncc	%l7,%l7,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%f8  = 49f955fc 8c93e933, %f10 = 41d152f3 df400000
	fcmpd	%fcc3,%f8 ,%f10		! %fcc3 = 2

p0_label_43:
!	%l1 = 0000000000000000, immed = 0000020b, %l3 = 00000000702787df
	sub	%l1,0x20b,%l3		! %l3 = fffffffffffffdf5
!	%l4 = 0000000000000000, %l3 = fffffffffffffdf5, %l7 = fffffffffffffbff
	srl	%l4,%l3,%l7		! %l7 = 0000000000000000
!	%f0  = 00000000 00000000, %f28 = 9cc40ab5 0c6b6220, %f24 = 41d152f3 7197f1c6
	fmuld	%f0 ,%f28,%f24		! %f24 = 80000000 00000000
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000010000040] = 93b2f29e, %l5 = 0000000000000000
	lduw	[%i0+0x040],%l5		! Annulled
p0_b52:

p0_label_44:
	membar	#Sync			! Added by membar checker (43)
!	%f10 = 41d152f3 df400000, %f24 = 80000000 00000000, %f2  = 41d152f3 4032ede6
	faddd	%f10,%f24,%f2 		! %f2  = 41d152f3 df400000
!	Mem[00000000108000a0] = 68523d35 b8e697db 2ae0ff0c 18a11557
	prefetch [%i1+0x0a0],2
!	%l1 = 0000000000000000, %l5 = 0000000000000000, %l0 = 000000000005a30c
	addc	%l1,%l5,%l0		! %l0 = 0000000000000000
!	Mem[0000000010000000] = 00000000, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000120000c8] = d187da00, %l6 = 0000000000000400
	ldsha	[%i4+0x0ca]%asi,%l6	! %l6 = ffffffffffffda00

p0_label_45:
!	%l4 = 0000000000000000, %l5 = 0000000000000000, %l0 = 0000000000000000
	sll	%l4,%l5,%l0		! %l0 = 0000000000000000
!	%l3 = fffffffffffffdf5, immed = 00000bfb, %l6 = ffffffffffffda00
	taddcc	%l3,0xbfb,%l6		! %l6 = 00000000000009f0, %ccr = 13
!	%l6 = 00000000000009f0, immed = fffff1ff, %y  = fffffff4
	umulcc	%l6,-0xe01,%l3		! %l3 = 000009efff74d610, %ccr = 08
!	Mem[0000000012000008] = e8389480, %l1 = 0000000000000000
	lduba	[%i4+%o6]0x80,%l1	! %l1 = 00000000000000e8
!	Mem[0000000010000060] = bfe56d24 432a06a6 229e256f 2f22d2bf
	prefetch [%i0+0x060],22

p0_label_46:
!	%l5 = 0000000000000000, immed = 00000002, %l5 = 0000000000000000
	sllx	%l5,0x002,%l5		! %l5 = 0000000000000000
	bpos,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000011800080] = 0d8ac0e4 01861380 979c8363 702787df
	prefetch [%i3+0x080],3	! Annulled
p0_b53:
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[00000000108000f8] = 2b451df4, %l2 = 00000000979c8363
	ldub	[%i1+0x0f8],%l2		! Annulled
p0_b54:

p0_label_47:
	membar	#Sync			! Added by membar checker (44)
!	%f15 = 00000000, %f25 = 00000000, %f1  = 00000000
	fmuls	%f15,%f25,%f1 		! %f1  = 00000000
	bgu,a	p0_b55			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000031000040] = 860adba7, %l4 = 0000000000000000
	ldsw	[%o2+0x040],%l4		! %l4 = ffffffff860adba7
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x037,%g2
p0_b55:
	membar	#Sync			! Added by membar checker (45)
!	%f30 = 41d27e55 7f000000, %f4  = c1f2eeca 20534db2
	fabsd	%f30,%f4 		! %f4  = 41d27e55 7f000000
	set	p0_b56,%o7
	fbl,a,pt %fcc1,p0_near_0_he	! Branch Taken, %fcc1 = 1

p0_label_48:
!	Mem[0000000011000000] = 00000097, %l1 = 00000000000000e8
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x038,%g2
p0_b56:
!	Registers modified during the branch to p0_near_0
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (46)
!	%f8  = 49f955fc 8c93e933, %f28 = 9cc40ab5 0c6b6220
	fnegd	%f8 ,%f28		! %f28 = c9f955fc 8c93e933
!	%l4 = 860adba7, %l5 = 00000000, Mem[0000000030000048] = f62556a8 001598e2
	stda	%l4,[%o0+0x048]%asi	! Mem[0000000030000048] = 860adba7 00000000
!	Mem[0000000011000000] = 00000097, %l2 = 00000000979c8363
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000097
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08

p0_label_49:
!	%l2 = 0000000000000097, Mem[0000000030000004] = a2e315b2
	stw	%l2,[%o0+0x004]		! Annulled
p0_b57:
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000011800008] = 64ffa3a1, %l0 = 0000000000000000
	lduha	[%i3+%o6]0x80,%l0	! %l0 = 00000000000064ff
!	%l5 = 0000000000000000
	setx	0xde5c40a4de5c40a4,%g7,%l5 ! %l5 = de5c40a4de5c40a4
!	Mem[0000000031000048] = b4ef4beb, %l3 = 000009efff74d610
	ldstuba	[%o2+0x048]%asi,%l3	! %l3 = 00000000000000b4
	fbul,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_50:
!	Mem[0000000010800000] = 00000000, %l4 = ffffffff860adba7
	lduba	[%i1+%g0]0x80,%l4	! Annulled
p0_b58:
	membar	#Sync			! Added by membar checker (48)
!	%f12 = 253461ae efa3f0d0, %f24 = 80000000 00000000, %f24 = 80000000 00000000
	faddd	%f12,%f24,%f24		! %f24 = 253461ae efa3f0d0
!	Branch On Register, %l7 = 0000000000000000
	brgz,a,pn %l7,p0_not_taken_0	! Branch Not Taken
!	%l3 = 00000000000000b4, Mem[0000000030000008] = 00000fff
	stw	%l3,[%o0+0x008]		! Annulled
p0_b59:
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,4

p0_label_51:
!	%l0 = 00000000000064ff, Mem[000000003000000a] = 00000fff
	sth	%l0,[%o0+0x00a]		! Mem[0000000030000008] = 000064ff
!	%l0 = 00000000000064ff, immed = fffff448, %l7 = 0000000000000000
	orcc	%l0,-0xbb8,%l7		! %l7 = fffffffffffff4ff, %ccr = 88
!	Mem[00000000110000e0] = 007d62b6 107aaea1 a04bb3c2 cb260a79
	prefetcha [%i2+0x0e0]%asi,1
!	%f8  = 49f955fc 8c93e933, %f28 = c9f955fc 8c93e933, %f4  = 41d27e55 7f000000
	faddd	%f8 ,%f28,%f4 		! %f4  = 00000000 00000000
!	Mem[0000000010800010] = e2fd139b, %l6 = 00000000000009f0
	lduba	[%i1+0x010]%asi,%l6	! %l6 = 00000000000000e2

p0_label_52:
!	%l1 = 0000000000000000, immed = 00000001, %l3 = 00000000000000b4
	sll	%l1,0x001,%l3		! %l3 = 0000000000000000
!	Mem[000000001180009c] = aeb1822a, %l1 = 0000000000000000
	swap	[%i3+0x09c],%l1		! %l1 = 00000000aeb1822a
!	%l0 = 00000000000064ff, Mem[0000000011000054] = 637b02c8
	stw	%l0,[%i2+0x054]		! Mem[0000000011000054] = 000064ff
	set	p0_b60,%o7
	fbo	p0_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010800028] = 110eb19c da43ff62, %l0 = 000064ff, %l1 = aeb1822a
	ldd	[%i1+0x028],%l0		! %l0 = 00000000110eb19c 00000000da43ff62
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x03c,%g2
p0_b60:
!	Registers modified during the branch to p0_far_2
!	%l7  = de5c40a4de5c44ef

p0_label_53:
	membar	#Sync			! Added by membar checker (50)
!	Mem[000000003200001c] = cab2b442, %l6 = 00000000000000e2
	ldswa	[%o4+0x01c]%asi,%g2	! %g2 = 00000000000000e2
!	%l1 = 00000000da43ff62, %l7 = de5c40a4de5c44ef, %y  = 000009ef
	umul	%l1,%l7,%l2		! %l2 = bd95a2ac9889747e
!	Mem[0000000011000000] = 0000009723fe5523, %l2 = bd95a2ac9889747e
	ldxa	[%i2+%g0]0x80,%l2	! %l2 = 0000009723fe5523
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000058] = fb3e213a, %l3 = 0000000000000000
	ldsb	[%o4+0x05a],%g2		! %g2 = fffffffffffffffb
p0_b61:

p0_label_54:
	membar	#Sync			! Added by membar checker (51)
!	%l3 = 0000000000000000, %l0 = 00000000110eb19c, %l1 = 00000000da43ff62
	subc	%l3,%l0,%l1		! %l1 = ffffffffeef14e64
!	%f31 = 7f000000, %f8  = 49f955fc
	fcmpes	%fcc1,%f31,%f8 		! %fcc1 = 2
!	%l6 = 00000000000000e2, Mem[0000000031800004] = 09bb6033
	stw	%l6,[%o3+0x004]		! Mem[0000000031800004] = 000000e2
!	Mem[00000000100000bc] = 5a8ffc7c, %l1 = ffffffffeef14e64
	lduwa	[%i0+0x0bc]%asi,%l1	! %l1 = 000000005a8ffc7c
!	%l5 = de5c40a4de5c40a4, %l6 = 00000000000000e2, %l0 = 00000000110eb19c
	taddcc	%l5,%l6,%l0		! %l0 = de5c40a4de5c4186, %ccr = 8a

p0_label_55:
!	Mem[0000000011000020] = 1600c608 b0113622 ffe45a1d b535a9bf
	prefetch [%i2+0x020],4
!	Mem[0000000032000040] = ba91c68a c2a2c541 60739feb c1c67d6b
	prefetcha [%o4+0x040]%asi,16
!	Mem[0000000011800040] = 068c7990 0c4aedcb 49bcaf22 f1512597
	prefetcha [%i3+0x040]%asi,16
!	Branch On Register, %l3 = 0000000000000000
	brgez,pt %l3,p0_b62		! Branch Taken
!	Mem[0000000010800060] = b7620b0c 99e21fa4 ed3a5b6a 0c5bb192
	prefetch [%i1+0x060],4
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x03e,%g2
p0_b62:

p0_label_56:
	membar	#Sync			! Added by membar checker (52)
!	%l1 = 000000005a8ffc7c, Mem[0000000031800042] = 00000220
	stb	%l1,[%o3+0x042]		! Mem[0000000031800040] = 00007c20
!	Mem[0000000030800048] = c0ffe4b6, %l2 = 0000009723fe5523
	ldswa	[%o1+0x048]%asi,%l2	! %l2 = ffffffffc0ffe4b6
!	%f27 = 627d5242, %f14 = 00000000 00000000
	fstod	%f27,%f14		! %f14 = 444faa48 40000000
!	%l1 = 000000005a8ffc7c, immed = fffffed4, %y  = bd95a2ac
	udivx	%l1,-0x12c,%l0		! %l0 = 0000000000000000
!	Mem[0000000011000000] = 00000097 23fe5523 00000000 0af1e8eb
	prefetcha [%i2+0x000]%asi,23

p0_label_57:
!	%f26 = 00000000, %f24 = 253461ae efa3f0d0
	fstox	%f26,%f24		! %f24 = 00000000 00000000
	bge	p0_b63			! Branch Taken, %ccr = 8a, CWP = 0
!	%l4 = ffffffff860adba7, Mem[0000000011800000] = fffffbf9
	stha	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = dba7fbf9
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x03f,%g2
p0_b63:
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010000000] = 00000000, %l1 = 000000005a8ffc7c
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010000008] = ff1c047f, %l3 = 0000000000000000
	ldswa	[%i0+%o6]0x80,%l3	! %l3 = ffffffffff1c047f

p0_label_58:
!	%l3 = ffffffffff1c047f, immed = 00000a1f, %y  = bd95a2ac
	smul	%l3,0xa1f,%l2		! %l2 = fffffff6fc918161
	bpos	p0_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000010800000] = 00000000 0000004b, %l6 = 000000e2, %l7 = de5c44ef
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000 000000000000004b
p0_b64:
	fbn,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 0000000000000000, Mem[0000000031800008] = 8ec041244765140a
	stx	%l6,[%o3+0x008]		! Annulled
p0_b65:

p0_label_59:
	membar	#Sync			! Added by membar checker (54)
!	%l3 = ffffffffff1c047f, Mem[000000003000004c] = 00000000
	stha	%l3,[%o0+0x04c]%asi	! Mem[000000003000004c] = 047f0000
!	%l3 = ffffffffff1c047f, immed = 0000082c, %y  = fffffff6
	sdivcc	%l3,0x82c,%l2		! %l2 = fffffffffee5f2ca, %ccr = 88
!	%l7 = 000000000000004b, immed = 00000d2a, %y  = fffffff6
	smulcc	%l7,0xd2a,%l4		! %l4 = 000000000003db4e, %ccr = 00
!	%f13 = efa3f0d0, %f15 = 40000000
	fcmps	%fcc3,%f13,%f15		! %fcc3 = 1
!	Mem[000000001080004c] = 14212304, %l0 = 0000000000000000
	lduw	[%i1+0x04c],%l0		! %l0 = 0000000014212304

p0_label_60:
!	%l7 = 000000000000004b, Mem[000000003100000a] = 97891d71
	sth	%l7,[%o2+0x00a]		! Mem[0000000031000008] = 9789004b
!	Mem[0000000011800088] = 979c8363 702787df, %l6 = 00000000, %l7 = 0000004b
	ldd	[%i3+0x088],%l6		! %l6 = 00000000979c8363 00000000702787df
!	%f10 = 41d152f3 df400000, %f26 = 00000000
	fdtoi	%f10,%f26		! %f26 = 454bcf7d
!	%l1 = 0000000000000000, immed = 000000e3, %y  = 00000000
	umulcc	%l1,0x0e3,%l6		! %l6 = 0000000000000000, %ccr = 44
!	Mem[0000000010800090] = ec6c858f, %l0 = 0000000014212304
	ldsh	[%i1+0x092],%l0		! %l0 = ffffffffffff858f

p0_label_61:
	bge	p0_b66			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[000000003100000c] = bc7f6a74, %l3 = ffffffffff1c047f
	ldsw	[%o2+0x00c],%l3		! %l3 = ffffffffbc7f6a74
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x042,%g2
p0_b66:
	membar	#Sync			! Added by membar checker (55)
!	%l1 = 0000000000000000, %l6 = 0000000000000000, %y  = 00000000
	smulcc	%l1,%l6,%l7		! %l7 = 0000000000000000, %ccr = 44
	bpos,a	p0_b67			! Branch Taken, %ccr = 44, CWP = 0
!	%l3 = ffffffffbc7f6a74, Mem[0000000010800008] = 00000000
	stha	%l3,[%i1+%o6]0x80	! Mem[0000000010800008] = 6a740000
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x043,%g2
p0_b67:

p0_label_62:
	bneg	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l2 = fffffffffee5f2ca, Mem[0000000013000038] = 8c27be33
	stw	%l2,[%i6+0x038]		! Mem[0000000013000038] = fee5f2ca
p0_b68:
	membar	#Sync			! Added by membar checker (56)
!	%l4 = 000000000003db4e, immed = fffffc04, %l3 = ffffffffbc7f6a74
	xnorcc	%l4,-0x3fc,%l3		! %l3 = 000000000003d8b5, %ccr = 00
!	Mem[0000000011000040] = c2fd3d0c 6b496d40 b3239b12 adce2f5c
	prefetcha [%i2+0x040]%asi,23
!	%f0  = 00000000, %f17 = 4032ede6
	fstoi	%f0 ,%f17		! %f17 = 00000000

p0_label_63:
!	%l0 = ffffffffffff858f, immed = 00000b53, %y  = 00000000
	umulcc	%l0,0xb53,%l1		! %l1 = 00000b52fa95725d, %ccr = 08
!	Mem[0000000030000000] = 72accfc5, %l5 = de5c40a4de5c40a4
	ldsw	[%o0+0x000],%l5		! %l5 = 0000000072accfc5
!	%l5 = 0000000072accfc5, %l0 = ffffffffffff858f, %y  = 00000b52
	udivx	%l5,%l0,%l4		! %l4 = 0000000000000000
	bleu	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l0 = ffffffffffff858f, Mem[0000000012000000] = 6e3818e5
	stba	%l0,[%i4+%g0]0x80	! Mem[0000000012000000] = 8f3818e5
p0_b69:

p0_label_64:
	membar	#Sync			! Added by membar checker (57)
!	Mem[0000000010000000] = 5a8ffc7c, %l0 = ffffffffffff858f
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 000000005a8ffc7c
!	Mem[0000000010000000] = 5a8ffc7c, %l1 = 00000b52fa95725d
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 000000000000005a
	ba	p0_b70			! Branch Taken, %ccr = 08, CWP = 0
!	%l3 = 000000000003d8b5, Mem[0000000011800068] = 75afb3cc
	sth	%l3,[%i3+0x068]		! Mem[0000000011800068] = d8b5b3cc
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x046,%g2
p0_b70:
	membar	#Sync			! Added by membar checker (58)
!	%l2 = fffffffffee5f2ca, immed = 00000015, %l7 = 0000000000000000
	sll	%l2,0x015,%l7		! %l7 = ffffdcbe59400000

p0_label_65:
	bgu	p0_b71			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000030800000] = 55cda803, %l5 = 0000000072accfc5
	ldsh	[%o1+0x000],%l5		! %l5 = 00000000000055cd
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x047,%g2
p0_b71:
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000010800060] = b7620b0c 99e21fa4 ed3a5b6a 0c5bb192
	prefetch [%i1+0x060],16
!	%f25 = 00000000, %f0  = 00000000, %f6  = 7197f1c6
	fsubs	%f25,%f0 ,%f6 		! %f6  = 00000000
!	%l0 = 000000005a8ffc7c, %l3 = 000000000003d8b5, %l6 = 0000000000000000
	or	%l0,%l3,%l6		! %l6 = 000000005a8ffcfd

p0_label_66:
	fbu,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001180005c] = d38547a5, %l6 = 000000005a8ffcfd
	ldsw	[%i3+0x05c],%l6		! %l6 = ffffffffd38547a5
p0_b72:
	membar	#Sync			! Added by membar checker (60)
!	%f26 = 454bcf7d 627d5242, %f10 = 41d152f3 df400000
	fcmpd	%fcc3,%f26,%f10		! %fcc3 = 2
	nop				! Delay added due to fcmp
	fbule,a,pn %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000010000000] = ff8ffc7c0000068c, %l2 = fffffffffee5f2ca
	ldxa	[%i0+%g0]0x80,%l2	! Annulled
p0_b73:

p0_label_67:
	membar	#Sync			! Added by membar checker (61)
!	Branch On Register, %l3 = 000000000003d8b5
	brgez,pn %l3,p0_b74		! Branch Taken
!	%l4 = 00000000, %l5 = 000055cd, Mem[00000000130000c8] = c14c24f1 6f7d2416
	std	%l4,[%i6+0x0c8]	! Mem[00000000130000c8] = 00000000 000055cd
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x04a,%g2
p0_b74:
	membar	#Sync			! Added by membar checker (62)
!	%l2 = fee5f2ca, %l3 = 0003d8b5, Mem[0000000011800048] = 49bcaf22 f1512597
	stda	%l2,[%i3+0x048]%asi	! Mem[0000000011800048] = fee5f2ca 0003d8b5
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000010800008] = 6a740000, %l2 = fffffffffee5f2ca
	ldsha	[%i1+%o6]0x80,%l2	! Annulled
p0_b75:

p0_label_68:
	membar	#Sync			! Added by membar checker (63)
!	Mem[00000000108000a0] = 68523d35 b8e697db 2ae0ff0c 18a11557
	prefetch [%i1+0x0a0],3
!	%l5 = 00000000000055cd, %l1 = 000000000000005a, %l6 = ffffffffd38547a5
	andcc	%l5,%l1,%l6		! %l6 = 0000000000000048, %ccr = 00
!	Mem[0000000011000008] = 00000000 0af1e8eb, %l0 = 5a8ffc7c, %l1 = 0000005a
	ldda	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000 000000000af1e8eb
!	Mem[0000000031800004] = 000000e2, %l2 = fffffffffee5f2ca
	ldstub	[%o3+0x004],%l2		! %l2 = 0000000000000000
!	%f30 = 41d27e55 7f000000, %f19 = df400000
	fdtoi	%f30,%f19		! %f19 = 49f955fc

p0_label_69:
!	%l1 = 000000000af1e8eb, %l3 = 000000000003d8b5, %l6 = 0000000000000048
	xnorcc	%l1,%l3,%l6		! %l6 = fffffffff50dcfa1, %ccr = 88
!	%l4 = 0000000000000000, Mem[00000000108000c4] = ed9f8ff8
	stwa	%l4,[%i1+0x0c4]%asi	! Mem[00000000108000c4] = 00000000
!	Mem[000000003080000d] = 7881b801, %l5 = 00000000000055cd
	ldstuba	[%o1+0x00d]%asi,%l5	! %l5 = 0000000000000081
!	Mem[00000000118000dc] = 76997615, %l1 = 000000000af1e8eb
	ldsb	[%i3+0x0de],%l1		! %l1 = 0000000000000076
!	Mem[0000000010800080] = 019d184e ef217f99 0091cf4d d17f8942
	prefetch [%i1+0x080],0

p0_label_70:
!	%l2 = 0000000000000000, %l4 = 0000000000000000, %l1 = 0000000000000076
	sll	%l2,%l4,%l1		! %l1 = 0000000000000000
!	Mem[0000000030800048] = c0ffe4b6, %l2 = 0000000000000000
	ldsb	[%o1+0x04a],%l2		! %l2 = ffffffffffffffe4
!	%f24 = 00000000 00000000, %f14 = 444faa48 40000000, %f30 = 41d27e55 7f000000
	fsubd	%f24,%f14,%f30		! %f30 = c44faa48 40000000
	set	p0_b76,%o7
	fbg,a,pt %fcc1,p0_near_3_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000011800000] = dba7fbf9, %l5 = 0000000000000081
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 000000000000dba7
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x04c,%g2
p0_b76:
!	Registers modified during the branch to p0_near_3
!	%l1  = 000000007fffffff
!	%l2  = ffffdcbe59400000
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000

p0_label_71:
	membar	#Sync			! Added by membar checker (64)
!	%f15 = 40000000, %f31 = 40000000, %f28 = c9f955fc
	fdivs	%f15,%f31,%f28		! %f28 = 3f800000
!	Branch On Register, %l6 = fffffffff50dcfa1
	brz,pn	%l6,p0_not_taken_0	! Branch Not Taken
!	Mem[00000000118000cc] = f572ebbf, %l1 = 000000007fffffff
	lduh	[%i3+0x0ce],%l1		! %l1 = 000000000000ebbf
p0_b77:
	membar	#Sync			! Added by membar checker (65)
!	%f15 = 40000000, %f0  = 00000000, %f12 = 253461ae
	fadds	%f15,%f0 ,%f12		! %f12 = 40000000
!	%l3 = 000000000003d8b5, %l1 = 000000000000ebbf, %l6 = fffffffff50dcfa1
	srlx	%l3,%l1,%l6		! %l6 = 0000000000000000

p0_label_72:
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000031000004] = 8d4103db, %l3 = 000000000003d8b5
	lduh	[%o2+0x006],%l3		! Annulled
p0_b78:
	membar	#Sync			! Added by membar checker (66)
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010800078] = eecda8b2 d55f3bee
	stda	%l4,[%i1+0x078]%asi	! Mem[0000000010800078] = 00000000 00000000
!	Branch On Register, %l7 = 0000000000000000
	brz,pn	%l7,p0_b79		! Branch Taken
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],4
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x04f,%g2
p0_b79:

p0_label_73:
	membar	#Sync			! Added by membar checker (67)
!	%l3 = 000000000003d8b5, immed = 00000013, %l3 = 000000000003d8b5
	tsubcc	%l3,0x013,%l3		! %l3 = 000000000003d8a2, %ccr = 02
!	%f0  = 00000000, %f28 = 3f800000
	fmovs	%f0 ,%f28		! %f28 = 00000000
	fbule,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],20	! Annulled
p0_b80:
	membar	#Sync			! Added by membar checker (68)
!	%l1 = 000000000000ebbf, %l1 = 000000000000ebbf, %l7 = 0000000000000000
	tsubcc	%l1,%l1,%l7		! %l7 = 0000000000000000, %ccr = 46

p0_label_74:
!	%f31 = 40000000, %f7  = 90da9f95, %f28 = 00000000
	fmuls	%f31,%f7 ,%f28		! %f28 = 915a9f95
!	Mem[0000000010000060] = bfe56d24 432a06a6 229e256f 2f22d2bf
	prefetcha [%i0+0x060]%asi,20
	fbule,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000031000048] = ffef4beb e8b7ee34
	std	%l6,[%o2+0x048]	! Annulled
p0_b81:
	membar	#Sync			! Added by membar checker (69)
!	Mem[00000000108000e0] = 78984796, %l6 = 0000000000000000
	ldsb	[%i1+0x0e3],%l6		! %l6 = ffffffffffffff96

p0_label_75:
!	call to call_1, CWP = 0
	call	p0_call_1_he
!	Mem[0000000013000008] = 9d90c7f7234f7968, %l6 = ffffffffffffff96
	ldxa	[%i6+%o6]0x80,%l6	! %l6 = 9d90c7f7234f7968
!	Registers modified during the branch to p0_call_1
!	%l0  = 000064ffffffffff
!	%l1  = ffffdcbe59400000
!	%l3  = fffffffffff6eb3f
!	%l5  = 0000000000000000
!	Mem[0000000030000044] = cad5e2d8, %l7 = 0000000000000000
	ldsw	[%o0+0x044],%l7		! %l7 = ffffffffcad5e2d8
	ba,a	p0_b82			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010000000] = ff8ffc7c, %l2 = ffffdcbe59400000
	ldsba	[%i0+%g0]0x80,%l2	! Annulled
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x052,%g2
p0_b82:

p0_label_76:
	membar	#Sync			! Added by membar checker (70)
!	%l1 = ffffdcbe59400000, Mem[0000000011000000] = 00000097
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000011000000] = 00000097
	set	p0_b83,%o7
	fble,a,pn %fcc0,p0_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000011000080] = 906a1c0a 823bd4ef f618fa05 4774e548
	prefetch [%i2+0x080],22
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x053,%g2
p0_b83:
!	Registers modified during the branch to p0_near_3
!	%l0  = 3b218feddc4ab880
	membar	#Sync			! Added by membar checker (71)
!	%l2 = ffffdcbe59400000, immed = 00000e8a, %l2 = ffffdcbe59400000
	orcc	%l2,0xe8a,%l2		! %l2 = ffffdcbe59400e8a, %ccr = 80
!	%l6 = 234f7968, %l7 = cad5e2d8, Mem[0000000030800008] = 08e615a5 78ffb801
	std	%l6,[%o1+0x008]	! Mem[0000000030800008] = 234f7968 cad5e2d8

p0_label_77:
!	Mem[0000000010800080] = 019d184e ef217f99
	flush	%i1+0x080
!	%l6 = 9d90c7f7234f7968, Mem[0000000010000008] = ff1c047f
	stba	%l6,[%i0+%o6]0x80	! Mem[0000000010000008] = 681c047f
	fbn,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000118000a4] = fd8017d7, %l1 = ffffdcbe59400000
	ldub	[%i3+0x0a4],%l1		! Annulled
p0_b84:
	membar	#Sync			! Added by membar checker (72)
!	%l5 = 0000000000000000, immed = fffff956, %y  = 00000000
	udivx	%l5,-0x6aa,%l6		! %l6 = 0000000000000000

p0_label_78:
!	Mem[00000000108000d0] = 4b9ff5ac, %l7 = ffffffffcad5e2d8
	ldswa	[%i1+0x0d0]%asi,%l7	! %l7 = 000000004b9ff5ac
	fbg,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = ffffdcbe59400e8a, Mem[0000000013000000] = 9a3e789a
	stba	%l2,[%i6+%g0]0x80	! Annulled
p0_b85:
	membar	#Sync			! Added by membar checker (73)
!	%l0 = 3b218feddc4ab880, immed = fffffac2, %y  = 00000000
	sdivx	%l0,-0x53e,%l1		! %l1 = fff4b85b940e712d
!	%l6 = 0000000000000000, immed = 00000016, %l0 = 3b218feddc4ab880
	srl	%l6,0x016,%l0		! %l0 = 0000000000000000

p0_label_79:
	fbul,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010000008] = 681c047f 1687f975
	stda	%l4,[%i0+%o6]0x80	! Annulled
p0_b86:
	membar	#Sync			! Added by membar checker (74)
!	Mem[0000000010800074] = b4adc27b, %l4 = 0000000000000000
	ldsb	[%i1+0x077],%l4		! %l4 = 000000000000007b
!	Mem[0000000030800040] = 2d4a93d5, %l4 = 000000000000007b
	lduw	[%o1+0x040],%l4		! %l4 = 000000002d4a93d5
!	Jump to jmpl_2, CWP = 0
	set	p0_jmpl_2_he,%g1
	jmpl	%g1,%g6

p0_label_80:
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],1
!	Registers modified during the branch to p0_jmpl_2
!	%l4  = fff4b85b940e7cf1
!	%l6  = 0000000000000000
!	%l0 = 0000000000000000, immed = fffffb4a, %l6 = 0000000000000000
	xor	%l0,-0x4b6,%l6		! %l6 = fffffffffffffb4a
!	%l7 = 000000004b9ff5ac, %l4 = fff4b85b940e7cf1, %y  = 00000000
	sdivcc	%l7,%l4,%l5		! %l5 = 0000000000000000, %ccr = 44
!	%l3 = fffffffffff6eb3f, Mem[0000000011000028] = ffe45a1db535a9bf
	stx	%l3,[%i2+0x028]		! Mem[0000000011000028] = fffffffffff6eb3f
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44

p0_label_81:
!	%l3 = fffffffffff6eb3f, Mem[0000000010000000] = ff8ffc7c
	stwa	%l3,[%i0+%g0]0x80	! Annulled
p0_b87:
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010800000] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000031000044] = df653564, %l5 = 0000000000000000
	ldswa	[%o2+0x044]%asi,%l5	! %l5 = ffffffffdf653564
!	Mem[000000003080000b] = 234f7968, %l1 = fff4b85b940e712d
	ldstuba	[%o1+0x00b]%asi,%l1	! %l1 = 0000000000000068
!	Branch On Register, %l4 = fff4b85b940e7cf1
	brgz,pt	%l4,p0_not_taken_0	! Branch Not Taken

p0_label_82:
!	%l4 = 940e7cf1, %l5 = df653564, Mem[00000000118000c0] = 27c0e163 c06ed513
	std	%l4,[%i3+0x0c0]	! Mem[00000000118000c0] = 940e7cf1 df653564
p0_b88:
	bge,a	p0_b89			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000031000004] = 8d4103db, %l2 = ffffdcbe59400e8a
	ldub	[%o2+0x005],%l2		! %l2 = 0000000000000041
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x059,%g2
p0_b89:
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000030000048] = 860adba7 047f0000, %l4 = 940e7cf1, %l5 = df653564
	ldda	[%o0+0x048]%asi,%l4	! %l4 = 00000000860adba7 00000000047f0000
!	Mem[0000000011800000] = dba7fbf9, %l4 = 00000000860adba7
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffdba7

p0_label_83:
!	%f30 = c44faa48 40000000, %f23 = 627d5242
	fdtos	%f30,%f23		! %f23 = e27d5242
	bvc	p0_b90			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[00000000110000c8] = 890ddaca, %l3 = fffffffffff6eb3f
	swap	[%i2+0x0c8],%l3		! %l3 = 00000000890ddaca
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x05a,%g2
p0_b90:
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000010800008] = 6a740000, %l6 = fffffffffffffb4a
	lduba	[%i1+%o6]0x80,%l6	! %l6 = 000000000000006a
!	%f28 = 915a9f95 8c93e933, %f28 = 915a9f95 8c93e933, %f16 = 8c93e933 00000000
	fdivd	%f28,%f28,%f16		! %f16 = 3ff00000 00000000

p0_label_84:
!	Mem[0000000031800000] = 51855110 ff0000e2, %l2 = 00000041, %l3 = 890ddaca
	ldd	[%o3+0x000],%l2		! %l2 = 0000000051855110 00000000ff0000e2
	bvs	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000013000008] = 9d90c7f7 234f7968, %l0 = 00000000, %l1 = 00000068
	ldda	[%i6+%o6]0x80,%l0	! %l0 = 000000009d90c7f7 00000000234f7968
p0_b91:
	membar	#Sync			! Added by membar checker (78)
!	%l2 = 0000000051855110, %l1 = 00000000234f7968, %l4 = ffffffffffffdba7
	orn	%l2,%l1,%l4		! %l4 = ffffffffddb5d797
!	%l5 = 00000000047f0000, %l7 = 000000004b9ff5ac, %l1 = 00000000234f7968
	andn	%l5,%l7,%l1		! %l1 = 0000000004600000

p0_label_85:
	set	p0_b92,%o7
	fbge,pt	%fcc0,p0_near_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000011800000] = dba7fbf9 00000027 64ffa3a1 836d5a1d
	prefetch [%i3+0x000],23
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x05c,%g2
p0_b92:
!	Registers modified during the branch to p0_near_1
!	%l3  = 000000005185411e
	membar	#Sync			! Added by membar checker (79)
!	Mem[00000000118000c0] = 940e7cf1 df653564 5cdb2478 f572ebbf
	prefetch [%i3+0x0c0],0
!	%l1 = 0000000004600000, Mem[000000001100002c] = fff6eb3f
	stw	%l1,[%i2+0x02c]		! Mem[000000001100002c] = 04600000
!	Mem[000000001180000c] = 836d5a1d, %l0 = 000000009d90c7f7
	ldsb	[%i3+0x00e],%l0		! %l0 = 000000000000005a

p0_label_86:
!	%l6 = 000000000000006a, %l3 = 000000005185411e, %y  = 00000000
	smulcc	%l6,%l3,%l7		! %l7 = 00000021c12cf66c, %ccr = 08
	bneg,a	p0_b93			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000011000000] = 00000097, %l1 = 0000000004600000
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000097
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x05d,%g2
p0_b93:
	membar	#Sync			! Added by membar checker (80)
!	%f10 = 41d152f3 df400000, %f30 = c44faa48 40000000
	fdtox	%f10,%f30		! %f30 = 00000000 454bcf7d
	bleu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 08

p0_label_87:
!	Mem[0000000032000040] = ba91c68a c2a2c541 60739feb c1c67d6b
	prefetch [%o4+0x040],16	! Annulled
p0_b94:
	membar	#Sync			! Added by membar checker (81)
!	%l6 = 000000000000006a, immed = 000000cf, %y  = 00000021
	udivx	%l6,0x0cf,%l0		! %l0 = 0000000000000000
!	%l3 = 000000005185411e, immed = ffffff6c, %l5 = 00000000047f0000
	add	%l3,-0x094,%l5		! %l5 = 000000005185408a
!	%l3 = 000000005185411e, %l1 = 0000000000000097, %l3 = 000000005185411e
	sub	%l3,%l1,%l3		! %l3 = 0000000051854087
!	Mem[00000000100000a0] = 9ae1d353 444bb0e6 2c7c39f4 57c016b3
	prefetcha [%i0+0x0a0]%asi,0

p0_label_88:
!	Mem[00000000110000b4] = fd10d4b0, %l2 = 0000000051855110
	ldsba	[%i2+0x0b6]%asi,%l2	! %l2 = ffffffffffffffd4
!	%f18 = 41d152f3 49f955fc, %f20 = 627d5242 24dc609f
	fcmpd	%fcc0,%f18,%f20		! %fcc0 = 1
!	%f24 = 00000000 00000000, %f14 = 444faa48 40000000, %f2  = 41d152f3 df400000
	fmuld	%f24,%f14,%f2 		! %f2  = 00000000 00000000
!	%l2 = ffffffffffffffd4, Mem[0000000010800064] = 99e21fa4
	stwa	%l2,[%i1+0x064]%asi	! Mem[0000000010800064] = ffffffd4
!	Branch On Register, %l2 = ffffffffffffffd4
	brgez,pn %l2,p0_not_taken_0	! Branch Not Taken

p0_label_89:
!	Mem[000000003200006c] = a921be58, %l7 = 00000021c12cf66c
	lduh	[%o4+0x06e],%g2		! %g2 = 000000000000a921
p0_b95:
	membar	#Sync			! Added by membar checker (82)
!	%l3 = 0000000051854087, %l7 = 00000021c12cf66c, %l0 = 0000000000000000
	orcc	%l3,%l7,%l0		! %l0 = 00000021d1adf6ef, %ccr = 08
!	Mem[0000000011800000] = dba7fbf900000027, %l6 = 000000000000006a
	ldxa	[%i3+%g0]0x80,%l6	! %l6 = dba7fbf900000027
!	%l3 = 0000000051854087, %l6 = dba7fbf900000027, %y  = 00000021
	smulcc	%l3,%l6,%l7		! %l7 = 0000000c6b4cd491, %ccr = 00
!	%l6 = dba7fbf900000027, Mem[0000000031000008] = 9789004bbc7f6a74
	stx	%l6,[%o2+0x008]		! Mem[0000000031000008] = dba7fbf900000027

p0_label_90:
	fbu,a,pt %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l6 = 00000027, %l7 = 6b4cd491, Mem[0000000010800008] = 6a740000 00000000
	stda	%l6,[%i1+%o6]0x80	! Annulled
p0_b96:
	membar	#Sync			! Added by membar checker (83)
!	Branch On Register, %l0 = 00000021d1adf6ef
	brgez,a,pt %l0,p0_b97		! Branch Taken
!	Mem[00000000128000c0] = cb3df48c 386fb43d e5afeddf 9658cb4c
	prefetch [%i5+0x0c0],3
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x061,%g2
p0_b97:
	membar	#Sync			! Added by membar checker (84)
!	%l6 = dba7fbf900000027, %l1 = 0000000000000097, %l5 = 000000005185408a
	xorcc	%l6,%l1,%l5		! %l5 = dba7fbf9000000b0, %ccr = 80

p0_label_91:
!	%l2 = ffffffffffffffd4, Mem[0000000010800008] = 6a740000
	stba	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = d4740000
!	%l4 = ddb5d797, %l5 = 000000b0, Mem[0000000030800040] = 2d4a93d5 e94bec17
	std	%l4,[%o1+0x040]	! Mem[0000000030800040] = ddb5d797 000000b0
!	%l5 = dba7fbf9000000b0, immed = fffff613, %y  = 0000000c
	udivx	%l5,-0x9ed,%l3		! %l3 = 0000000000000000
!	%l2 = ffffffffffffffd4, Mem[0000000031000040] = 860adba7
	stwa	%l2,[%o2+0x040]%asi	! Mem[0000000031000040] = ffffffd4
!	Mem[0000000011000080] = 906a1c0a 823bd4ef f618fa05 4774e548
	prefetcha [%i2+0x080]%asi,23

p0_label_92:
!	%l4 = ffffffffddb5d797, %l2 = ffffffffffffffd4, %l5 = dba7fbf9000000b0
	tsubcc	%l4,%l2,%l5		! %l5 = ffffffffddb5d7c3, %ccr = 9b
!	%l6 = dba7fbf900000027, immed = 0000001f, %l6 = dba7fbf900000027
	sra	%l6,0x01f,%l6		! %l6 = 0000000000000000
!	%f0  = 00000000 00000000, %f10 = 41d152f3 df400000
	fcmpd	%fcc3,%f0 ,%f10		! %fcc3 = 1
!	%l6 = 0000000000000000, %l1 = 0000000000000097, %l2 = ffffffffffffffd4
	sll	%l6,%l1,%l2		! %l2 = 0000000000000000
!	Mem[0000000011800008] = 64ffa3a1, %l3 = 0000000000000000
	swapa	[%i3+%o6]0x80,%l3	! %l3 = 0000000064ffa3a1

p0_label_93:
!	Branch On Register, %l0 = 00000021d1adf6ef
	brlz,a,pn %l0,p0_not_taken_0	! Branch Not Taken
!	%l6 = 0000000000000000, Mem[0000000010800000] = ff000000
	stha	%l6,[%i1+%g0]0x80	! Annulled
p0_b98:
	membar	#Sync			! Added by membar checker (85)
!	%f0  = 00000000 00000000, %f0  = 00000000 00000000
	fdtox	%f0 ,%f0 		! %f0  = 00000000 00000000
	fbn,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l5 = ffffffffddb5d7c3, Mem[0000000010800008] = d4740000
	stha	%l5,[%i1+%o6]0x80	! Annulled
p0_b99:

p0_label_94:
	membar	#Sync			! Added by membar checker (86)
!	Mem[0000000010800080] = 019d184e ef217f99 0091cf4d d17f8942
	prefetcha [%i1+0x080]%asi,23
!	%l7 = 0000000c6b4cd491, immed = fffffd80, %y  = 0000000c
	sdivx	%l7,-0x280,%l5		! %l5 = fffffffffb0847ab
	set	p0_b100,%o7
	fbo	p0_far_2_le	! Branch Taken, %fcc0 = 1
!	%l0 = d1adf6ef, %l1 = 00000097, Mem[0000000031000040] = ffffffd4 df653564
	std	%l0,[%o2+0x040]	! Mem[0000000031000040] = d1adf6ef 00000097
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x064,%g2
p0_b100:
!	Registers modified during the branch to p0_far_2
!	%l7  = fffffffffb0843e0
	fbug,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 1

p0_label_95:
!	Mem[00000000110000c0] = 0a325f01 7c0ec48b fff6eb3f 4e35edd1
	prefetch [%i2+0x0c0],1	! Annulled
p0_b101:
	membar	#Sync			! Added by membar checker (87)
!	Mem[0000000011800060] = c8bf1352 4d1d3af2 d8b5b3cc 410e7efd
	prefetcha [%i3+0x060]%asi,4
!	%l6 = 0000000000000000, %l2 = 0000000000000000, %l3 = 0000000064ffa3a1
	xorcc	%l6,%l2,%l3		! %l3 = 0000000000000000, %ccr = 44
!	%f24 = 00000000 00000000, %f14 = 444faa48 40000000, %f4  = 00000000 00000000
	faddd	%f24,%f14,%f4 		! %f4  = 444faa48 40000000
!	%l7 = fffffffffb0843e0, Mem[000000003000004e] = 047f0000
	stha	%l7,[%o0+0x04e]%asi	! Mem[000000003000004c] = 047f43e0

p0_label_96:
!	%l6 = 0000000000000000, immed = 00000c63, %l4 = ffffffffddb5d797
	addcc	%l6,0xc63,%l4		! %l4 = 0000000000000c63, %ccr = 00
!	Mem[0000000011000080] = 906a1c0a 823bd4ef f618fa05 4774e548
	prefetch [%i2+0x080],21
!	%f10 = 41d152f3 df400000, %f3  = 00000000
	fdtoi	%f10,%f3 		! %f3  = 454bcf7d
!	%f2  = 00000000, %f11 = df400000
	fcmpes	%fcc0,%f2 ,%f11		! %fcc0 = 2
!	%f0  = 00000000 00000000, %f5  = 40000000
	fdtos	%f0 ,%f5 		! %f5  = 00000000

p0_label_97:
	set	p0_b102,%o7
	fbge,a	p0_far_3_he	! Branch Taken, %fcc0 = 2
!	%l7 = fffffffffb0843e0, Mem[0000000011000078] = b5c701d5
	stb	%l7,[%i2+0x078]		! Mem[0000000011000078] = e0c701d5
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x066,%g2
p0_b102:
!	Registers modified during the branch to p0_far_3
!	%l1  = fffffffffffff6b9
!	%l2  = 00000000c0ffe400
!	%l5  = 0000000000000000
	bcs,a	p0_b103			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000031800048] = 00000000, %l4 = 0000000000000c63
	lduw	[%o3+0x048],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x067,%g2
p0_b103:
	membar	#Sync			! Added by membar checker (88)
!	Branch On Register, %l6 = 0000000000000000
	brz,pn	%l6,p0_b104		! Branch Taken

p0_label_98:
!	%l4 = 0000000000000000, Mem[0000000012800000] = 78ffb457cda72d0a
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000012800000] = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x068,%g2
p0_b104:
	bleu	p0_b105			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[0000000010800008] = d4740000, %l4 = 0000000000000000
	ldsba	[%i1+%o6]0x80,%l4	! %l4 = ffffffffffffffd4
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x069,%g2
p0_b105:
	ba,a	p0_b106			! Branch Taken, %ccr = 99, CWP = 0
!	 Annulled
	ldd	[%i1+0x020],%l0
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x06a,%g2
p0_b106:

p0_label_99:
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l3 = 0000000000000000, Mem[0000000011800000] = dba7fbf9
	stha	%l3,[%i3+%g0]0x80	! Mem[0000000011800000] = 0000fbf9
p0_b107:
	bcc,a	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[0000000010800000] = ff0000000000004b, %l7 = fffffffffb0843e0
	ldxa	[%i1+%g0]0x80,%l7	! Annulled
p0_b108:
	membar	#Sync			! Added by membar checker (89)
!	%l3 = 0000000000000000, immed = 00000169, %l5 = 0000000000000000
	and	%l3,0x169,%l5		! %l5 = 0000000000000000

p0_label_100:
!	Mem[0000000010800000] = ff000000 0000004b d4740000 00000000
	prefetcha [%i1+0x000]%asi,20
!	Mem[0000000030800001] = 55cda803, %l2 = 00000000c0ffe400
	ldstub	[%o1+0x001],%l2		! %l2 = 00000000000000cd
!	%l7 = fffffffffb0843e0, %l1 = fffffffffffff6b9, %l0 = 00000021d1adf6ef
	subc	%l7,%l1,%l0		! %l0 = fffffffffb084d26
!	Mem[000000003000000c] = ffffffff, %l3 = 0000000000000000
	lduw	[%o0+0x00c],%l3		! %l3 = 00000000ffffffff
	set	p0_b109,%o7
	fblg	p0_far_3_le	! Branch Taken, %fcc0 = 2

p0_label_101:
!	%l5 = 0000000000000000, Mem[0000000010800000] = ff000000
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x06d,%g2
p0_b109:
!	Registers modified during the branch to p0_far_3
!	%l4  = 00000000224b8aff
	be	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	Mem[00000000100000a0] = 9ae1d353444bb0e6, %l2 = 00000000000000cd
	ldx	[%i0+0x0a0],%l2		! %l2 = 9ae1d353444bb0e6
p0_b110:
	membar	#Sync			! Added by membar checker (90)
	nop

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba,a	p0_branch_failed
p0_not_taken_0_end:

!	Mem[0000000011000060] = d3679ec7 fe839644 8b3802cf 0be9c617
	prefetcha [%i2+0x060]%asi,4

p0_label_102:
!	Branch On Register, %l4 = 00000000224b8aff
	brnz,a,pn %l4,p0_b111		! Branch Taken
!	%l0 = fffffffffb084d26, Mem[0000000011800008] = 00000000
	stha	%l0,[%i3+%o6]0x80	! Mem[0000000011800008] = 4d260000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x06f,%g2
p0_b111:
	membar	#Sync			! Added by membar checker (91)
!	%l6 = 0000000000000000, immed = ffffff8d, %l6 = 0000000000000000
	andn	%l6,-0x073,%l6		! %l6 = 0000000000000000
!	Mem[0000000010000000] = ff8ffc7c, %l3 = 00000000ffffffff
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ff8ffc7c
!	%f24 = 00000000, %f12 = 40000000 efa3f0d0
	fstox	%f24,%f12		! %f12 = 00000000 00000000

p0_label_103:
	set	p0_b112,%o7
	fbg,a	p0_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000031000048] = ffef4beb e8b7ee34, %l6 = 00000000, %l7 = fb0843e0
	ldd	[%o2+0x048],%l6		! %l6 = 00000000ffef4beb 00000000e8b7ee34
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x070,%g2
p0_b112:
!	Registers modified during the branch to p0_far_2
!	%l7  = 000000000000044b
	bn,a	p0_not_taken_0		! Branch Not Taken, %ccr = 99
!	%l6 = 00000000ffef4beb, Mem[0000000011000008] = 00000000
	stwa	%l6,[%i2+%o6]0x80	! Annulled
p0_b113:
	membar	#Sync			! Added by membar checker (92)
!	%f17 = 00000000, %f16 = 3ff00000, %f3  = 454bcf7d
	fadds	%f17,%f16,%f3 		! %f3  = 3ff00000

p0_label_104:
!	%l7 = 000000000000044b, %l0 = fffffffffb084d26, %l7 = 000000000000044b
	orncc	%l7,%l0,%l7		! %l7 = 0000000004f7b6db, %ccr = 00
!	%l1 = fffffffffffff6b9, Mem[000000003200000c] = 5e0357b7
	stwa	%l1,[%o4+0x00c]%asi	! Mem[000000003200000c] = fffff6b9
!	Mem[0000000031800000] = 51855110ff0000e2, %l1 = fffffffffffff6b9
	ldxa	[%o3+0x000]%asi,%l1	! %l1 = 51855110ff0000e2
!	Branch On Register, %l7 = 0000000004f7b6db
	brnz,pn	%l7,p0_b114		! Branch Taken
!	Mem[0000000011000008] = 00000000, %l2 = 9ae1d353444bb0e6
	lduha	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x072,%g2
p0_b114:

p0_label_105:
	membar	#Sync			! Added by membar checker (93)
!	%l1 = 51855110ff0000e2, Mem[0000000011000000] = 0000009723fe5523
	stxa	%l1,[%i2+%g0]0x80	! Mem[0000000011000000] = 51855110ff0000e2
!	%f8  = 49f955fc 8c93e933, %f18 = 41d152f3 49f955fc
	fabsd	%f8 ,%f18		! %f18 = 49f955fc 8c93e933
!	Mem[0000000011000008] = 00000000, %l5 = 0000000000000000
	ldsba	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010800040] = dfd4eefa b9b2c28f 2aa9c3bc 14212304
	prefetch [%i1+0x040],20
!	%l0 = fffffffffb084d26, %l0 = fffffffffb084d26, %l4 = 00000000224b8aff
	subc	%l0,%l0,%l4		! %l4 = 0000000000000000

p0_label_106:
!	Jump to jmpl_1, CWP = 0
	set	p0_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[00000000100000c0] = ae657699 6fc33bb7 5467df53 06c1dbad
	prefetch [%i0+0x0c0],22
!	Registers modified during the branch to p0_jmpl_1
!	%l2  = ffffffffffffffef
!	%l6  = 0000000000000000
!	%l4 = 0000000000000000, %l5 = 0000000000000000, %l7 = 0000000004f7b6db
	xnor	%l4,%l5,%l7		! %l7 = ffffffffffffffff
!	%l3 = 00000000ff8ffc7c, %l7 = ffffffffffffffff, %y  = 00000000
	sdivx	%l3,%l7,%l7		! %l7 = ffffffff00700384
	fbn,a,pn %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 2

p0_label_107:
!	Mem[000000001100003c] = f20f9ef5, %l6 = 0000000000000000
	ldstub	[%i2+0x03c],%l6		! Annulled
p0_b115:
	membar	#Sync			! Added by membar checker (94)
!	Branch On Register, %l0 = fffffffffb084d26
	brnz,a,pn %l0,p0_b116		! Branch Taken
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000011800000] = 0000fbf9 00000027
	stda	%l4,[%i3+%g0]0x80	! Mem[0000000011800000] = 00000000 00000000
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x074,%g2
p0_b116:
	membar	#Sync			! Added by membar checker (95)
!	Mem[0000000011800080] = 0d8ac0e4 01861380 979c8363 702787df
	prefetch [%i3+0x080],23
!	%l0 = fffffffffb084d26, %l5 = 0000000000000000, %l6 = 0000000000000000
	srax	%l0,%l5,%l6		! %l6 = fffffffffb084d26

p0_label_108:
	set	p0_b117,%o7
	fbug,a	p0_far_0_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001100003c] = f20f9ef5, %l3 = 00000000ff8ffc7c
	lduh	[%i2+0x03e],%l3		! %l3 = 0000000000009ef5
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x075,%g2
p0_b117:
!	Registers modified during the branch to p0_far_0
!	%l0  = 0000000000000000
!	%l3  = fffffffffec21349
!	%l7  = ffffffffffffc0ff
	membar	#Sync			! Added by membar checker (96)
!	Mem[0000000011000078] = e0c701d56b140b18, %l2 = ffffffffffffffef
	ldxa	[%i2+0x078]%asi,%l2	! %l2 = e0c701d56b140b18
	fbule,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l3 = fffffffffec21349, Mem[0000000031000000] = 73277b108d4103db
	stx	%l3,[%o2+0x000]		! Annulled
p0_b118:

p0_label_109:
	set	p0_b119,%o7
	fba	p0_far_3_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000010800000] = 00000000, %l6 = fffffffffb084d26
	ldsba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x077,%g2
p0_b119:
!	Registers modified during the branch to p0_far_3
!	%l4  = 00000000224b8aff
	membar	#Sync			! Added by membar checker (97)
!	%l0 = 0000000000000000, immed = fffffa2e, %l2 = e0c701d56b140b18
	xnor	%l0,-0x5d2,%l2		! %l2 = 00000000000005d1
!	%f28 = 915a9f95, %f18 = 49f955fc 8c93e933
	fitod	%f28,%f18		! %f18 = c1dba958 1ac00000
	set	p0_b120,%o7
	fblg,a	p0_far_2_le	! Branch Taken, %fcc0 = 2

p0_label_110:
!	Mem[00000000108000d8] = f1817782 e84cda26, %l2 = 000005d1, %l3 = fec21349
	ldd	[%i1+0x0d8],%l2		! %l2 = 00000000f1817782 00000000e84cda26
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x078,%g2
p0_b120:
!	Registers modified during the branch to p0_far_2
!	%l7  = 000000000000044b
	membar	#Sync			! Added by membar checker (98)
!	%l4 = 00000000224b8aff, Mem[0000000031800044] = f3d9cedb
	stw	%l4,[%o3+0x044]		! Mem[0000000031800044] = 224b8aff
!	%l6 = 0000000000000000, immed = 00000016, %l4 = 00000000224b8aff
	sra	%l6,0x016,%l4		! %l4 = 0000000000000000
	set	p0_b121,%o7
	fbg,a,pt %fcc1,p0_near_1_he	! Branch Taken, %fcc1 = 2
!	%l6 = 0000000000000000, Mem[0000000011800008] = 4d260000836d5a1d
	stxa	%l6,[%i3+%o6]0x80	! Mem[0000000011800008] = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x079,%g2
p0_b121:
!	Registers modified during the branch to p0_near_1
!	%l3  = 00000000f1816790

p0_label_111:
	membar	#Sync			! Added by membar checker (99)
	fbul,a,pn %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000003200001c] = b2b4420d, %l4 = 0000000000000000
	ldsb	[%o4+0x01d],%g2		! Annulled
p0_b122:
	membar	#Sync			! Added by membar checker (100)
!	%f14 = 444faa48 40000000, %f28 = 915a9f95
	fdtos	%f14,%f28		! %f28 = 627d5242
!	%f13 = 00000000, %f13 = 00000000
	fcmpes	%fcc2,%f13,%f13		! %fcc2 = 0
!	%l5 = 0000000000000000, %l7 = 000000000000044b, %y  = 00000000
	sdivx	%l5,%l7,%l4		! %l4 = 0000000000000000

p0_label_112:
	fblg,pt	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l4 = 0000000000000000, Mem[0000000010800008] = d4740000
	stba	%l4,[%i1+%o6]0x80	! Mem[0000000010800008] = 00740000
p0_b123:
	set	p0_b124,%o7
	fbug	p0_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],16
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x07c,%g2
p0_b124:
!	Registers modified during the branch to p0_far_2
!	%l7  = 000000000000044b
	membar	#Sync			! Added by membar checker (101)
!	Mem[0000000010000000] = ffffffff, %l1 = 51855110ff0000e2
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_113:
!	%l3 = 00000000f1816790
	setx	0xba0b5339ba0b5339,%g7,%l3 ! %l3 = ba0b5339ba0b5339
!	Branch On Register, %l5 = 0000000000000000
	brz,a,pn %l5,p0_b125		! Branch Taken
!	Mem[0000000011000080] = 906a1c0a 823bd4ef f618fa05 4774e548
	prefetch [%i2+0x080],23
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x07d,%g2
p0_b125:
	membar	#Sync			! Added by membar checker (102)
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],23
!	Mem[0000000031000000] = 73277b10, %l0 = 0000000000000000
	ldsb	[%o2+0x002],%l0		! %l0 = 000000000000007b

p0_label_114:
	set	p0_b126,%o7
	fbne,a	p0_far_1_le	! Branch Taken, %fcc0 = 2
!	%l7 = 000000000000044b, Mem[0000000011800008] = 0000000000000000
	stxa	%l7,[%i3+%o6]0x80	! Mem[0000000011800008] = 000000000000044b
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x07e,%g2
p0_b126:
!	Registers modified during the branch to p0_far_1
!	%l1  = fffffffffffffedb
	membar	#Sync			! Added by membar checker (103)
!	%l6 = 0000000000000000, %l0 = 000000000000007b, %l4 = 0000000000000000
	sra	%l6,%l0,%l4		! %l4 = 0000000000000000
!	%l2 = 00000000f1817782, %l1 = fffffffffffffedb, %y  = 00000000
	udiv	%l2,%l1,%l2		! %l2 = 0000000000000000
!	Mem[0000000010800000] = 00000000 0000004b, %l0 = 0000007b, %l1 = fffffedb
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 000000000000004b

p0_label_115:
	be,a	p0_not_taken_0		! Branch Not Taken, %ccr = 02
!	 Annulled
	ldda	[%i1+%o6]0x80,%l2
p0_b127:
	membar	#Sync			! Added by membar checker (104)
!	%f24 = 00000000, %f29 = 8c93e933
	fnegs	%f24,%f29		! %f29 = 80000000
!	Mem[0000000010800060] = b7620b0c ffffffd4 ed3a5b6a 0c5bb192
	prefetcha [%i1+0x060]%asi,3
!	%l4 = 0000000000000000, Mem[0000000011800047] = 0c4aedcb
	stba	%l4,[%i3+0x047]%asi	! Mem[0000000011800044] = 0c4aed00

p0_label_116:
!	Mem[00000000100000c0] = ae657699 6fc33bb7 5467df53 06c1dbad
	prefetcha [%i0+0x0c0]%asi,20
	fbue,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000031800040] = fff6eb3f, %l3 = ba0b5339ba0b5339
	swap	[%o3+0x040],%l3		! %l3 = 00000000fff6eb3f
p0_b128:
	fbul,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	 Annulled
	ldda	[%i0+%o6]0x80,%l6
p0_b129:

p0_label_117:
	membar	#Sync			! Added by membar checker (105)
!	%l2 = 0000000000000000, Mem[00000000100000b0] = ffe45a1d0000000f
	stx	%l2,[%i0+0x0b0]		! Mem[00000000100000b0] = 0000000000000000
!	%l3 = 00000000fff6eb3f, Mem[0000000031000040] = d1adf6ef
	stha	%l3,[%o2+0x040]%asi	! Mem[0000000031000040] = eb3ff6ef
	set	p0_b130,%o7
	fbne,a	p0_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000003180000c] = 4765140a, %l4 = 0000000000000000
	ldsb	[%o3+0x00e],%l4		! %l4 = 0000000000000014
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x082,%g2
p0_b130:
!	Registers modified during the branch to p0_far_2
!	%l7  = 000000000000044b
	membar	#Sync			! Added by membar checker (106)
!	%l1 = 000000000000004b, Mem[0000000011800000] = 00000000
	stwa	%l1,[%i3+%g0]0x80	! Mem[0000000011800000] = 0000004b

p0_label_118:
!	Branch On Register, %l4 = 0000000000000014
	brgez,a,pt %l4,p0_b131		! Branch Taken
!	%l0 = 0000000000000000, Mem[0000000013000008] = 9d90c7f7
	stha	%l0,[%i6+%o6]0x80	! Mem[0000000013000008] = 0000c7f7
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x083,%g2
p0_b131:
	membar	#Sync			! Added by membar checker (107)
!	%f15 = 40000000, %f3  = 3ff00000
	fcmpes	%fcc2,%f15,%f3 		! %fcc2 = 2
!	%l3 = 00000000fff6eb3f, immed = fffffc4c, %y  = 00000000
	udivcc	%l3,-0x3b4,%l2		! %l2 = 0000000000000000, %ccr = 44
!	%f30 = 00000000, %f16 = 3ff00000
	fstoi	%f30,%f16		! %f16 = 00000000

p0_label_119:
!	%l5 = 0000000000000000, immed = 00000c9c, %l7 = 000000000000044b
	xorcc	%l5,0xc9c,%l7		! %l7 = 0000000000000c9c, %ccr = 00
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,22
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000010800000] = 00000000, %l1 = 000000000000004b
	lduha	[%i1+%g0]0x80,%l1	! Annulled
p0_b132:
	membar	#Sync			! Added by membar checker (108)
!	%l2 = 00000000, %l3 = fff6eb3f, Mem[0000000030000008] = 000064ff ffffffff
	stda	%l2,[%o0+0x008]%asi	! Mem[0000000030000008] = 00000000 fff6eb3f

p0_label_120:
!	%l5 = 0000000000000000, Mem[0000000032000058] = 670cfb3e213ac54e
	stx	%l5,[%o4+0x058]		! Mem[0000000032000058] = 0000000000000000
!	%l6 = 0000000000000000, immed = fffff61b, %y  = 00000000
	umul	%l6,-0x9e5,%l1		! %l1 = 0000000000000000
!	%l6 = 0000000000000000, %l0 = 0000000000000000, %l2 = 0000000000000000
	taddcc	%l6,%l0,%l2		! %l2 = 0000000000000000, %ccr = 44
	bcs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000010800008] = 00740000, %l1 = 0000000000000000
	lduwa	[%i1+%o6]0x80,%l1	! Annulled
p0_b133:

p0_label_121:
	membar	#Sync			! Added by membar checker (109)
!	Mem[0000000011800004] = 00000000, %l0 = 0000000000000000
	lduba	[%i3+0x007]%asi,%l0	! %l0 = 0000000000000000
	fbul,pt	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000003200006c] = 79d4a921, %l2 = 0000000000000000
	ldsh	[%o4+0x06c],%g2		! %g2 = 00000000000079d4
p0_b134:
	bgu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],2	! Annulled
p0_b135:

p0_label_122:
	membar	#Sync			! Added by membar checker (110)
!	Mem[0000000010000070] = 722626f3, %l4 = 0000000000000014
	lduwa	[%i0+0x070]%asi,%l4	! %l4 = 00000000722626f3
!	%f2  = 00000000 3ff00000, %f28 = 627d5242 80000000
	fnegd	%f2 ,%f28		! %f28 = 80000000 3ff00000
!	%l4 = 722626f3, %l5 = 00000000, Mem[0000000031800000] = 51855110 ff0000e2
	std	%l4,[%o3+0x000]	! Mem[0000000031800000] = 722626f3 00000000
	set	p0_b136,%o7
	fbne,a	p0_far_2_he	! Branch Taken, %fcc0 = 2
!	%l1 = 0000000000000000, Mem[00000000100000ac] = 57c016b3
	sth	%l1,[%i0+0x0ac]		! Mem[00000000100000ac] = 000016b3
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x088,%g2
p0_b136:
!	Registers modified during the branch to p0_far_2
!	%l1  = 0000000000000a37
!	%l3  = fffffffffffff7de
!	%l4  = 0000000000000000
!	%l7  = 00000000fff6e855

p0_label_123:
	membar	#Sync			! Added by membar checker (111)
!	Mem[00000000110000c0] = 0a325f017c0ec48b, %l1 = 0000000000000a37
	ldxa	[%i2+0x0c0]%asi,%l1	! %l1 = 0a325f017c0ec48b
!	Mem[0000000011800000] = 0000004b 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 000000000000004b 0000000000000000
!	Mem[00000000110000ff] = 80269fe2, %l6 = 0000000000000000
	ldstuba	[%i2+0x0ff]%asi,%l6	! %l6 = 00000000000000e2
!	%l5 = 0000000000000000, %l6 = 00000000000000e2, %l3 = fffffffffffff7de
	addc	%l5,%l6,%l3		! %l3 = 00000000000000e2
	be	p0_b137			! Branch Taken, %ccr = 44, CWP = 0

p0_label_124:
!	%l1 = 0a325f017c0ec48b, Mem[0000000031000044] = 00000097
	stw	%l1,[%o2+0x044]		! Mem[0000000031000044] = 7c0ec48b
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x089,%g2
p0_b137:
	bl	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l6 = 00000000000000e2, Mem[0000000011000008] = 000000000af1e8eb
	stxa	%l6,[%i2+%o6]0x80	! Mem[0000000011000008] = 00000000000000e2
p0_b138:
	membar	#Sync			! Added by membar checker (112)
	fbe,pt	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000012000008] = e8389480, %l2 = 0000000000000000
	ldsba	[%i4+%o6]0x80,%l2	! %l2 = ffffffffffffffe8
p0_b139:

p0_label_125:
	membar	#Sync			! Added by membar checker (113)
!	%l5 = 0000000000000000, %l1 = 0a325f017c0ec48b, %l3 = 00000000000000e2
	andncc	%l5,%l1,%l3		! %l3 = 0000000000000000, %ccr = 44
!	Mem[0000000011800008] = 00000000, %l1 = 0a325f017c0ec48b
	ldstuba	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000
!	Branch On Register, %l1 = 0000000000000000
	brgz,a,pt %l1,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010000020] = 7257e89cdb34a30d, %l5 = 0000000000000000
	ldx	[%i0+0x020],%l5		! Annulled
p0_b140:
	membar	#Sync			! Added by membar checker (114)
!	Mem[000000003080000c] = ff0000e2, %l7 = 00000000fff6e855
	lduh	[%o1+0x00e],%l7		! %l7 = 00000000000000e2

p0_label_126:
!	Mem[0000000011000078] = e0c701d5 6b140b18, %l4 = 0000004b, %l5 = 00000000
	ldd	[%i2+0x078],%l4		! %l4 = 00000000e0c701d5 000000006b140b18
!	%l7 = 00000000000000e2, immed = 0000001a, %l5 = 000000006b140b18
	sll	%l7,0x01a,%l5		! %l5 = 0000000388000000
	bgu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000031000044] = 7c0ec48b, %l1 = 0000000000000000
	ldsb	[%o2+0x044],%l1		! Annulled
p0_b141:
	membar	#Sync			! Added by membar checker (115)
!	%l3 = 0000000000000000, immed = fffff517, %l2 = ffffffffffffffe8
	xnor	%l3,-0xae9,%l2		! %l2 = 0000000000000ae8

p0_label_127:
!	Branch On Register, %l6 = 00000000000000e2
	brz,pt	%l6,p0_not_taken_0	! Branch Not Taken
!	Mem[0000000010000000] = ffffffff, %l7 = 00000000000000e2
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffff
p0_b142:
	membar	#Sync			! Added by membar checker (116)
	set	p0_b143,%o7
	fbuge,pt %fcc0,p0_near_0_he	! Branch Taken, %fcc0 = 2
!	%l3 = 0000000000000000, Mem[0000000010800000] = 00000000
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x08f,%g2
p0_b143:
!	Registers modified during the branch to p0_near_0
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (117)
!	Mem[00000000118000a0] = 01fdafdb fd8017d7, %l4 = e0c701d5, %l5 = 00000000
	ldda	[%i3+0x0a0]%asi,%l4	! %l4 = 0000000001fdafdb 00000000fd8017d7

p0_label_128:
!	%l3 = 0000000000000000, immed = fffff046, %l3 = 0000000000000000
	sub	%l3,-0xfba,%l3		! %l3 = 0000000000000fba
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000012800000] = 00000000 00000000 c34331c2 1b86bb00
	prefetch [%i5+0x000],22	! Annulled
p0_b144:
	membar	#Sync			! Added by membar checker (118)
!	%l5 = 00000000fd8017d7, %l1 = 0000000000000000, %l3 = 0000000000000fba
	or	%l5,%l1,%l3		! %l3 = 00000000fd8017d7
	nop

p0_label_129:
	bne	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000011000000] = 51855110, %l5 = 00000000fd8017d7
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 0000000051855110
p0_b145:
	membar	#Sync			! Added by membar checker (119)
	fbue,pn	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l6 = 00000000000000e2, Mem[0000000040000010] = ff1c2522
	stw	%l6,[%o5+0x010]		! Mem[0000000040000010] = 000000e2
p0_b146:
	set	p0_b147,%o7
	fblg,a	p0_far_3_le	! Branch Taken, %fcc0 = 2

p0_label_130:
!	Mem[0000000011800000] = 0000004b, %l0 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x093,%g2
p0_b147:
!	Registers modified during the branch to p0_far_3
!	%l4  = 00000000224b8aff
	membar	#Sync			! Added by membar checker (120)
!	Mem[0000000010000000] = ffffffff, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000013000008] = 0000c7f7, %l4 = 00000000224b8aff
	lduha	[%i6+%o6]0x80,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000000000ff, immed = fffffca4, %l3 = 00000000fd8017d7
	orn	%l0,-0x35c,%l3		! %l3 = 00000000000003ff
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 44

p0_label_131:
!	Mem[0000000010000080] = 6f41edf1 c48be4c0 69fd3147 ab56c0ab
	prefetch [%i0+0x080],20
p0_b148:
	membar	#Sync			! Added by membar checker (121)
!	%f30 = 00000000 454bcf7d, %f14 = 444faa48 40000000
	fxtod	%f30,%f14		! %f14 = 41d152f3 df400000
!	Mem[0000000030800044] = 000000b0, %l7 = ffffffffffffffff
	lduba	[%o1+0x044]%asi,%l7	! %l7 = 0000000000000000
	fbge,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000011000008] = 00000000, %l6 = 00000000000000e2
	ldsha	[%i2+%o6]0x80,%l6	! Annulled
p0_b149:

p0_label_132:
	membar	#Sync			! Added by membar checker (122)
!	%f9  = 8c93e933, %f30 = 00000000
	fabss	%f9 ,%f30		! %f30 = 0c93e933
!	%l3 = 00000000000003ff, immed = 000005ae, %l1 = 0000000000000000
	tsubcc	%l3,0x5ae,%l1		! %l1 = fffffffffffffe51, %ccr = 9b
	fbl,a,pt %fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],21	! Annulled
p0_b150:
	membar	#Sync			! Added by membar checker (123)
!	%l3 = 00000000000003ff, %l5 = 0000000051855110, %y  = 00000000
	sdivcc	%l3,%l5,%l5		! %l5 = 0000000000000000, %ccr = 44

p0_label_133:
!	%f30 = 0c93e933, %f2  = 00000000, %f12 = 00000000
	fadds	%f30,%f2 ,%f12		! %f12 = 0c93e933
	set	p0_b151,%o7
	fba,a,pt %fcc1,p0_near_1_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000011800008] = ff000000, %l0 = 00000000000000ff
	swapa	[%i3+%o6]0x80,%l0	! Annulled
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x097,%g2
p0_b151:
!	Registers modified during the branch to p0_near_1
!	%l3  = fffffffffffffaf6
	membar	#Sync			! Added by membar checker (124)
!	Mem[0000000011000020] = 1600c608 b0113622 ffffffff 04600000
	prefetcha [%i2+0x020]%asi,20
!	Mem[000000003180000c] = 4765140a, %l5 = 0000000000000000
	ldswa	[%o3+0x00c]%asi,%l5	! %l5 = 000000004765140a

p0_label_134:
!	%l6 = 000000e2, %l7 = 00000000, Mem[0000000030000040] = c34331c2 cad5e2d8
	stda	%l6,[%o0+0x040]%asi	! Mem[0000000030000040] = 000000e2 00000000
	ba	p0_b152			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000010000000] = ffffffff 0000068c, %l2 = 00000ae8, %l3 = fffffaf6
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffffffff 000000000000068c
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x098,%g2
p0_b152:
	fbu,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000011000008] = 00000000, %l3 = 000000000000068c
	lduha	[%i2+%o6]0x80,%l3	! Annulled
p0_b153:

p0_label_135:
	membar	#Sync			! Added by membar checker (125)
!	%f9  = 8c93e933, %f4  = 444faa48 00000000
	fstod	%f9 ,%f4 		! %f4  = b9927d26 60000000
!	%f14 = 41d152f3 df400000, %f10 = 41d152f3 df400000, %f8  = 49f955fc 8c93e933
	fdivd	%f14,%f10,%f8 		! %f8  = 3ff00000 00000000
!	%l3 = 000000000000068c, immed = fffff406, %y  = 00000000
	udivx	%l3,-0xbfa,%l4		! %l4 = 0000000000000000
	bvs,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000003080004c] = 7124f48b, %l5 = 000000004765140a
	ldsw	[%o1+0x04c],%l5		! Annulled
p0_b154:

p0_label_136:
	membar	#Sync			! Added by membar checker (126)
!	%f5  = 60000000, %f19 = 1ac00000, %f30 = 0c93e933 454bcf7d
	fsmuld	%f5 ,%f19,%f30		! %f30 = 3f680000 00000000
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000011000095] = bc4e6a9b, %l7 = 0000000000000000
	ldstub	[%i2+0x095],%l7		! %l7 = 000000000000004e
p0_b155:
	membar	#Sync			! Added by membar checker (127)
!	Mem[00000000108000a0] = 68523d35 b8e697db 2ae0ff0c 18a11557
	prefetcha [%i1+0x0a0]%asi,3
!	%l0 = 00000000000000ff, immed = 00000c1c, %y  = 00000000
	umul	%l0,0xc1c,%l0		! %l0 = 00000000000c0fe4

p0_label_137:
!	Mem[0000000030000040] = 000000e2, %l2 = 00000000ffffffff
	ldsba	[%o0+0x043]%asi,%l2	! %l2 = ffffffffffffffe2
	set	p0_b156,%o7
	fblg,a,pt %fcc0,p0_near_3_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000031800048] = 00000000, %l6 = 00000000000000e2
	swap	[%o3+0x048],%l6		! %l6 = 0000000000000000
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x09c,%g2
p0_b156:
!	Registers modified during the branch to p0_near_3
!	%l1  = 00000000000000f3
!	%l2  = 00000000000c1032
!	%l5  = 000000007aa5934c
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (128)
!	%l7 = 0000000000000000, immed = 000006d1, %l0 = 00000000000c0fe4
	andncc	%l7,0x6d1,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%l7 = 0000000000000000, %l6 = 0000000000000000, %l4 = 0000000000000000
	srl	%l7,%l6,%l4		! %l4 = 0000000000000000

p0_label_138:
	bgu,a	p0_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000118000c0] = 940e7cf1 df653564 5cdb2478 f572ebbf
	prefetch [%i3+0x0c0],2	! Annulled
p0_b157:
	membar	#Sync			! Added by membar checker (129)
!	%f12 = 0c93e933 00000000, %f12 = 0c93e933 00000000
	fcmpd	%fcc2,%f12,%f12		! %fcc2 = 0
	nop				! Delay added due to fcmp
	fble,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000010800008] = 00740000, %l3 = 000000000000068c
	swapa	[%i1+%o6]0x80,%l3	! Annulled
p0_b158:

p0_label_139:
	membar	#Sync			! Added by membar checker (130)
!	%l5 = 000000007aa5934c, immed = fffffbf7, %l2 = 00000000000c1032
	and	%l5,-0x409,%l2		! %l2 = 000000007aa59344
!	%l1 = 00000000000000f3, immed = 00000d61, %l0 = 0000000000000000
	subccc	%l1,0xd61,%l0		! %l0 = fffffffffffff392, %ccr = 99
	set	p0_b159,%o7
	fbule,pt %fcc3,p0_near_0_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000010000008] = 681c047f, %l4 = 0000000000000000
	lduha	[%i0+%o6]0x80,%l4	! %l4 = 000000000000681c
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x09f,%g2
p0_b159:
!	Registers modified during the branch to p0_near_0
!	%l3  = ffffffffffa80d37
	membar	#Sync			! Added by membar checker (131)
!	Mem[0000000040000013] = 000000e2, %l1 = 00000000000000f3
	ldstuba	[%o5+0x013]%asi,%l1	! %l1 = 00000000000000e2

p0_label_140:
!	%l3 = ffffffffffa80d37, immed = 000007a3, %y  = 00000000
	udiv	%l3,0x7a3,%l4		! %l4 = 0000000000217a2d
!	%l2 = 000000007aa59344, Mem[0000000010000000] = ffffffff0000068c
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010000000] = 000000007aa59344
!	Mem[0000000010800008] = 00740000, %l1 = 00000000000000e2
	ldsba	[%i1+%o6]0x80,%l1	! %l1 = 0000000000000000
!	%f28 = 80000000, %f15 = df400000
	fmovs	%f28,%f15		! %f15 = 80000000
!	%f26 = 454bcf7d 627d5242, %f0  = 00000000 00000000, %f16 = 00000000 00000000
	fmuld	%f26,%f0 ,%f16		! %f16 = 00000000 00000000

p0_label_141:
	nop
!	%l1 = 0000000000000000, immed = fffff356, %l4 = 0000000000217a2d
	addcc	%l1,-0xcaa,%l4		! %l4 = fffffffffffff356, %ccr = 88
!	%l1 = 0000000000000000, immed = fffff6f0, %y  = 00000000
	sdivx	%l1,-0x910,%l0		! %l0 = 0000000000000000
!	Mem[0000000010000040] = 93b2f29e 6db92e37 c8c506d8 6d9fe516
	prefetch [%i0+0x040],1
!	%f24 = 00000000, %f14 = 41d152f3
	fmovs	%f24,%f14		! %f14 = 00000000

p0_label_142:
	fbe	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000010800038] = 94f22123, %l7 = 0000000000000000
	ldub	[%i1+0x038],%l7		! %l7 = 0000000000000094
p0_b160:
	membar	#Sync			! Added by membar checker (132)
!	Mem[0000000030000000] = 72accfc5, %l1 = 0000000000000000
	ldsh	[%o0+0x000],%l1		! %l1 = 00000000000072ac
!	%l5 = 000000007aa5934c, Mem[0000000011000000] = fd8017d7
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000011000000] = 7aa5934c
	fbl,pn	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2

p0_label_143:
!	Mem[0000000011800000] = 0000004b, %l3 = ffffffffffa80d37
	lduha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
p0_b161:
	membar	#Sync			! Added by membar checker (133)
!	%l3 = 0000000000000000, immed = fffff5bd, %l2 = 000000007aa59344
	orcc	%l3,-0xa43,%l2		! %l2 = fffffffffffff5bd, %ccr = 88
	bvs	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011000000] = 7aa5934c, %l4 = fffffffffffff356
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 000000000000007a
p0_b162:
	membar	#Sync			! Added by membar checker (134)
!	Mem[0000000010000018] = 4be9c73e, %l0 = 0000000000000000
	lduha	[%i0+0x01a]%asi,%l0	! %l0 = 000000000000c73e

p0_label_144:
!	%l4 = 000000000000007a, Mem[0000000031000008] = dba7fbf9
	sth	%l4,[%o2+0x008]		! Mem[0000000031000008] = 007afbf9
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf fffff6b9
	prefetcha [%o4+0x000]%asi,22
	bge,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l6 = 00000000, %l7 = 00000094, Mem[0000000030800008] = 00000000 ff0000e2
	std	%l6,[%o1+0x008]	! Annulled
p0_b163:
	membar	#Sync			! Added by membar checker (135)
!	Mem[0000000032000040] = ba91c68a c2a2c541, %l4 = 0000007a, %l5 = 7aa5934c
	ldd	[%o4+0x040],%g2		! %l4 = 000000000000007a 000000007aa5934c

p0_label_145:
!	%l6 = 0000000000000000, %l7 = 0000000000000094, %l0 = 000000000000c73e
	xorcc	%l6,%l7,%l0		! %l0 = 0000000000000094, %ccr = 00
!	%l3 = 0000000000000000
	setx	0x7991bc2c7991bc2c,%g7,%l3 ! %l3 = 7991bc2c7991bc2c
!	%l5 = 000000007aa5934c, %l1 = 00000000000072ac, %l1 = 00000000000072ac
	sra	%l5,%l1,%l1		! %l1 = 000000000007aa59
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l0 = 0000000000000094, Mem[0000000011000008] = 00000000
	stba	%l0,[%i2+%o6]0x80	! Mem[0000000011000008] = 94000000
p0_b164:

p0_label_146:
	membar	#Sync			! Added by membar checker (136)
!	Mem[0000000010000000] = 00000000, %l0 = 0000000000000094
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f20 = 627d5242 24dc609f, %f16 = 00000000 00000000, %f10 = 41d152f3 df400000
	faddd	%f20,%f16,%f10		! %f10 = 627d5242 24dc609f
!	Mem[0000000010800008] = 00740000, %l6 = 0000000000000000
	lduwa	[%i1+%o6]0x80,%l6	! %l6 = 0000000000740000
!	Branch On Register, %l0 = 0000000000000000
	brz,pn	%l0,p0_b165		! Branch Taken
!	Mem[00000000118000f8] = 2d8ff1b5 5b88871b, %l4 = 0000007a, %l5 = 7aa5934c
	ldd	[%i3+0x0f8],%l4		! %l4 = 000000002d8ff1b5 000000005b88871b
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x0a5,%g2
p0_b165:

p0_label_147:
	membar	#Sync			! Added by membar checker (137)
!	%l6 = 0000000000740000, %l5 = 000000005b88871b, %l1 = 000000000007aa59
	srlx	%l6,%l5,%l1		! %l1 = 0000000000000000
!	Mem[0000000011800000] = 0000004b, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%f10 = 627d5242 24dc609f, %f20 = 627d5242 24dc609f
	fcmped	%fcc0,%f10,%f20		! %fcc0 = 0
	nop				! Delay added due to fcmp
	set	p0_b166,%o7
	fbe,pn	%fcc2,p0_near_2_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000010000040] = 93b2f29e, %l7 = 0000000000000094
	ldsh	[%i0+0x040],%l7		! %l7 = ffffffffffff93b2
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x0a6,%g2
p0_b166:
!	Registers modified during the branch to p0_near_2
!	%l2  = 0000000000000bef

p0_label_148:
	membar	#Sync			! Added by membar checker (138)
!	%l7 = ffffffffffff93b2, Mem[00000000118000c0] = 940e7cf1df653564
	stxa	%l7,[%i3+0x0c0]%asi	! Mem[00000000118000c0] = ffffffffffff93b2
	fbug	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031800004] = 00000000, %l7 = ffffffffffff93b2
	lduw	[%o3+0x004],%l7		! %l7 = 0000000000000000
p0_b167:
	membar	#Sync			! Added by membar checker (139)
!	Branch On Register, %l1 = 0000000000000000
	brgez,pn %l1,p0_b168		! Branch Taken
!	Mem[0000000011000000] = 7aa5934c, %l0 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000007aa5
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0a8,%g2
p0_b168:

p0_label_149:
	membar	#Sync			! Added by membar checker (140)
!	%f28 = 80000000 3ff00000, %f14 = 00000000 80000000
	fmovd	%f28,%f14		! %f14 = 80000000 3ff00000
!	%l3 = 7991bc2c7991bc2c, immed = 0000000e, %l3 = 7991bc2c7991bc2c
	sllx	%l3,0x00e,%l3		! %l3 = 6f0b1e646f0b0000
!	%f25 = 00000000, %f12 = 0c93e933, %f2  = 00000000
	fmuls	%f25,%f12,%f2 		! %f2  = 00000000
	bvc,a	p0_b169			! Branch Taken, %ccr = 00, CWP = 0
!	%l1 = 0000000000000000, Mem[0000000031800000] = 722626f3
	stw	%l1,[%o3+0x000]		! Mem[0000000031800000] = 00000000
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x0a9,%g2
p0_b169:

p0_label_150:
	membar	#Sync			! Added by membar checker (141)
!	%f12 = 0c93e933, %f23 = e27d5242
	fcmpes	%fcc1,%f12,%f23		! %fcc1 = 2
!	%f24 = 00000000 00000000, %f0  = 00000000
	fxtos	%f24,%f0 		! %f0  = 00000000
!	%l7 = 0000000000000000, %l3 = 6f0b1e646f0b0000, %y  = 00000000
	sdivcc	%l7,%l3,%l3		! %l3 = 0000000000000000, %ccr = 44
	fbn,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011800008] = ff000000, %l1 = 0000000000000000
	lduwa	[%i3+%o6]0x80,%l1	! %l1 = 00000000ff000000
p0_b170:

p0_label_151:
	fblg	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000008] = 681c047f, %l1 = 00000000ff000000
	lduwa	[%i0+%o6]0x80,%l1	! %l1 = 00000000681c047f
p0_b171:
	membar	#Sync			! Added by membar checker (142)
!	%l0 = 0000000000007aa5, immed = 00000c93, %l0 = 0000000000007aa5
	subccc	%l0,0xc93,%l0		! %l0 = 0000000000006e12, %ccr = 00
	fbn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010800008] = 00740000, %l1 = 00000000681c047f
	lduba	[%i1+%o6]0x80,%l1	! %l1 = 0000000000000000
p0_b172:

p0_label_152:
	membar	#Sync			! Added by membar checker (143)
!	%l4 = 000000002d8ff1b5, Mem[0000000031000004] = 8d4103db
	sth	%l4,[%o2+0x004]		! Mem[0000000031000004] = f1b503db
!	%l5 = 000000005b88871b, %l6 = 0000000000740000, %y  = 00000000
	sdivx	%l5,%l6,%l6		! %l6 = 00000000000000ca
!	Mem[000000001100002a] = ffffffff, %l3 = 0000000000000000
	ldstub	[%i2+0x02a],%l3		! %l3 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010800000] = 00000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000000
!	%l2 = 0000000000000bef, immed = 000009e0, %l0 = 0000000000006e12
	xorcc	%l2,0x9e0,%l0		! %l0 = 000000000000020f, %ccr = 00

p0_label_153:
!	%f10 = 627d5242, %f5  = 60000000
	fnegs	%f10,%f5 		! %f5  = e27d5242
	fble,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000031000044] = 7c0ec48b, %l4 = 000000002d8ff1b5
	ldsw	[%o2+0x044],%l4		! Annulled
p0_b173:
	membar	#Sync			! Added by membar checker (144)
!	%l4 = 000000002d8ff1b5, immed = 00000e82, %l7 = 0000000000000000
	xnor	%l4,0xe82,%l7		! %l7 = ffffffffd27000c8
!	%f8  = 3ff00000, %f4  = b9927d26
	fabss	%f8 ,%f4 		! %f4  = 3ff00000

p0_label_154:
!	%l2 = 0000000000000bef, %l6 = 00000000000000ca, %l1 = 0000000000000000
	addcc	%l2,%l6,%l1		! %l1 = 0000000000000cb9, %ccr = 00
	set	p0_b174,%o7
	fbge,a	p0_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001180000c] = 0000044b, %l6 = 00000000000000ca
	swap	[%i3+0x00c],%l6		! %l6 = 000000000000044b
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0ae,%g2
p0_b174:
!	Registers modified during the branch to p0_far_3
!	%l4  = 00000000224b8aff
	set	p0_b175,%o7
	fba	p0_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000010000008] = 681c047f, %l1 = 0000000000000cb9
	lduwa	[%i0+%o6]0x80,%l1	! %l1 = 00000000681c047f
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x0af,%g2
p0_b175:
!	Registers modified during the branch to p0_far_0
!	%l1  = 00002dc4438d8000
!	%l3  = 00000000000220b3
!	%l5  = 0000000000000000
!	%l6  = 00000000224b96ee
!	%l7  = e641f8a6882cf537

p0_label_155:
	set	p0_b176,%o7
	fble	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000118000c4] = ffff93b2, %l0 = 000000000000020f
	swap	[%i3+0x0c4],%l0		! %l0 = 00000000ffff93b2
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0b0,%g2
p0_b176:
!	Registers modified during the branch to p0_far_1
!	%l2  = ffffffff8d21ee1d
!	%l4  = ffffffffffffffff
!	%l5  = 00000000000220b3
	set	p0_b177,%o7
	fbo	p0_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000011000010] = d7435f9a, %l0 = 00000000ffff93b2
	ldub	[%i2+0x012],%l0		! %l0 = 000000000000005f
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x0b1,%g2
p0_b177:
!	Registers modified during the branch to p0_far_1
!	%l2  = ffffffff8d21ee1d
!	%l4  = ffffffffffffffff
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (145)
!	%f0  = 00000000 00000000, %f16 = 00000000 00000000, %f4  = 3ff00000 e27d5242
	faddd	%f0 ,%f16,%f4 		! %f4  = 00000000 00000000

p0_label_156:
!	Mem[0000000030800004] = 56ef1aa1, %l2 = ffffffff8d21ee1d
	ldsh	[%o1+0x004],%l2		! %l2 = 00000000000056ef
!	%f4  = 00000000, %f10 = 627d5242, %f10 = 627d5242
	fdivs	%f4 ,%f10,%f10		! %f10 = 00000000
!	%l7 = e641f8a6882cf537, immed = fffff272, %l3 = 00000000000220b3
	andcc	%l7,-0xd8e,%l3		! %l3 = e641f8a6882cf032, %ccr = 88
!	%f10 = 00000000 24dc609f, %f12 = 0c93e933 00000000
	fmovd	%f10,%f12		! %f12 = 00000000 24dc609f
!	%l6 = 00000000224b96ee, Mem[0000000010800000] = 00000000
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010800000] = 96ee0000

p0_label_157:
!	%l5 = 0000000000000000, Mem[0000000011000000] = 7aa5934c
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000011000000] = 00000000
	fbl	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000050] = b23d4e8d 2dda7a06, %l4 = ffffffff, %l5 = 00000000
	ldd	[%o4+0x050],%g2		! %l4 = ffffffffffffffff 0000000000000000
p0_b178:
	membar	#Sync			! Added by membar checker (146)
!	%l2 = 00000000000056ef, immed = 00000003, %l0 = 000000000000005f
	srax	%l2,0x003,%l0		! %l0 = 0000000000000add
!	%l0 = 0000000000000add, immed = 00000cc2, %l3 = e641f8a6882cf032
	orncc	%l0,0xcc2,%l3		! %l3 = fffffffffffffbfd, %ccr = 88

p0_label_158:
!	%f19 = 1ac00000, %f13 = 24dc609f
	fcmps	%fcc1,%f19,%f13		! %fcc1 = 1
	nop				! Delay added due to fcmp
	set	p0_b179,%o7
	fba,pn	%fcc3,p0_near_3_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000010000060] = bfe56d24 432a06a6 229e256f 2f22d2bf
	prefetch [%i0+0x060],2
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x0b3,%g2
p0_b179:
!	Registers modified during the branch to p0_near_3
!	%l0  = cc83f14d54f1184a
	membar	#Sync			! Added by membar checker (147)
!	%l1 = 00002dc4438d8000, Mem[0000000011000008] = 94000000
	stwa	%l1,[%i2+%o6]0x80	! Mem[0000000011000008] = 438d8000
!	Mem[00000000108000a0] = 68523d35, %l4 = ffffffffffffffff
	ldsw	[%i1+0x0a0],%l4		! %l4 = 0000000068523d35

p0_label_159:
!	%f9  = 00000000, %f5  = 00000000
	fitos	%f9 ,%f5 		! %f5  = 00000000
!	Mem[0000000010000008] = 681c047f, %l2 = 00000000000056ef
	ldsba	[%i0+%o6]0x80,%l2	! %l2 = 0000000000000068
!	Mem[000000003180004c] = 224b8aff, %l6 = 00000000224b96ee
	lduh	[%o3+0x04e],%l6		! %l6 = 0000000000008aff
!	Mem[0000000031800000] = 00000000, %l6 = 0000000000008aff
	swap	[%o3+0x000],%l6		! %l6 = 0000000000000000
!	Branch On Register, %l2 = 0000000000000068
	brlez,pt %l2,p0_not_taken_0	! Branch Not Taken

p0_label_160:
!	Mem[0000000010000080] = 6f41edf1 c48be4c0 69fd3147 ab56c0ab
	prefetch [%i0+0x080],1
p0_b180:
	membar	#Sync			! Added by membar checker (148)
!	%l3 = fffffffffffffbfd, immed = fffff39a, %l4 = 0000000068523d35
	andn	%l3,-0xc66,%l4		! %l4 = 0000000000000865
!	%l6 = 0000000000000000, Mem[00000000108000bc] = 5b660053
	stba	%l6,[%i1+0x0bc]%asi	! Mem[00000000108000bc] = 00660053
!	%f4  = 00000000, %f21 = 24dc609f
	fcmps	%fcc2,%f4 ,%f21		! %fcc2 = 1
!	Mem[0000000011000060] = d3679ec7 fe839644 8b3802cf 0be9c617
	prefetcha [%i2+0x060]%asi,16

p0_label_161:
!	Mem[0000000010800080] = 019d184e ef217f99 0091cf4d d17f8942
	prefetcha [%i1+0x080]%asi,22
!	%f1  = 00000000, %f20 = 627d5242, %f20 = 627d5242 24dc609f
	fsmuld	%f1 ,%f20,%f20		! %f20 = 00000000 00000000
!	%l5 = 0000000000000000, %l1 = 00002dc4438d8000, %y  = 00000000
	sdivcc	%l5,%l1,%l5		! %l5 = 0000000000000000, %ccr = 44
!	Mem[0000000010800020] = cde4ac84 2f45537b 110eb19c da43ff62
	prefetch [%i1+0x020],21
!	Mem[0000000010000040] = 93b2f29e 6db92e37 c8c506d8 6d9fe516
	prefetcha [%i0+0x040]%asi,3

p0_label_162:
!	Mem[0000000030800008] = 00000000ff0000e2, %l4 = 0000000000000865
	ldx	[%o1+0x008],%l4		! %l4 = 00000000ff0000e2
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetcha [%o4+0x060]%asi,1
!	%l4 = 00000000ff0000e2, %l0 = cc83f14d54f1184a, %l0 = cc83f14d54f1184a
	addc	%l4,%l0,%l0		! %l0 = cc83f14e53f1192c
!	Mem[0000000031000040] = be38db17 ddc4e6bc, %l6 = 0000000000000000, %l5 = 0000000000000000
	add	%o2,0x40,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = eb3ff6ef7c0ec48b
!	Mem[00000000100000a0] = 9ae1d353 444bb0e6 2c7c39f4 000016b3
	prefetch [%i0+0x0a0],3

p0_label_163:
	fbu,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000110000d8] = 92f0a117, %l6 = 0000000000000000
	swap	[%i2+0x0d8],%l6		! Annulled
p0_b181:
	fbn,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000008] = 681c047f, %l5 = eb3ff6ef7c0ec48b
	lduba	[%i0+%o6]0x80,%l5	! Annulled
p0_b182:
	set	p0_b183,%o7
	fbue	p0_far_2_le	! Branch Taken, %fcc0 = 0

p0_label_164:
!	Mem[0000000010800020] = cde4ac84, %l6 = 0000000000000000
	ldsh	[%i1+0x020],%l6		! %l6 = ffffffffffffcde4
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x0b7,%g2
p0_b183:
!	Registers modified during the branch to p0_far_2
!	%l7  = eb3ff6ef7c0ec0c0
	membar	#Sync			! Added by membar checker (149)
!	%l5 = eb3ff6ef7c0ec48b, immed = 0000041e, %l6 = ffffffffffffcde4
	orcc	%l5,0x41e,%l6		! %l6 = eb3ff6ef7c0ec49f, %ccr = 80
!	Mem[00000000118000c0] = ffffffff 0000020f
	flush	%i3+0x0c0
!	Mem[0000000010800000] = 96ee0000, %l1 = 00002dc4438d8000
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 0000000096ee0000
	fbge,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1

p0_label_165:
!	%l1 = 0000000096ee0000, Mem[0000000010800000] = 96ee0000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010800000] = 00ee0000
p0_b184:
	membar	#Sync			! Added by membar checker (150)
!	%l7 = eb3ff6ef7c0ec0c0, %l5 = eb3ff6ef7c0ec48b, %l3 = fffffffffffffbfd
	srax	%l7,%l5,%l3		! %l3 = fffd67feddef81d8
!	Mem[0000000031800040] = fffffbfd, %l2 = 0000000000000068
	lduh	[%o3+0x040],%l2		! %l2 = 000000000000ffff
!	%f31 = 00000000, %f23 = e27d5242, %f12 = 00000000 24dc609f
	nop
!	Branch On Register, %l4 = 00000000ff0000e2
	brlez,a,pt %l4,p0_not_taken_0	! Branch Not Taken

p0_label_166:
!	%l7 = eb3ff6ef7c0ec0c0, Mem[0000000013000000] = 9a3e789a
	stba	%l7,[%i6+%g0]0x80	! Annulled
p0_b185:
	membar	#Sync			! Added by membar checker (151)
	fbg,a,pn %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000011800008] = ff000000, %l4 = 00000000ff0000e2
	ldswa	[%i3+%o6]0x80,%l4	! Annulled
p0_b186:
	fbne	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000118000a0] = 01fdafdb fd8017d7 03a7885f af8d8dac
	prefetch [%i3+0x0a0],1
p0_b187:

p0_label_167:
	membar	#Sync			! Added by membar checker (152)
!	Mem[0000000030800008] = 01fdafdb fd8017d7, %l7 = eb3ff6ef7c0ec0c0, %l4 = 00000000ff0000e2
	add	%o1,0x08,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 00000000ff0000e2
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,22
!	%l1 = 0000000096ee0000, immed = fffff155, %y  = 00000000
	udivcc	%l1,-0xeab,%l1		! %l1 = 0000000000000000, %ccr = 44
	be,a	p0_b188			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000030000008] = 00000000, %l4 = 00000000ff0000e2
	ldsw	[%o0+0x008],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0bc,%g2
p0_b188:

p0_label_168:
	membar	#Sync			! Added by membar checker (153)
!	%l6 = eb3ff6ef7c0ec49f, %l7 = eb3ff6ef7c0ec0c0, %y  = 00000000
	sdivcc	%l6,%l7,%l0		! %l0 = 0000000000000001, %ccr = 00
!	Mem[0000000030800048] = c0ffe400 7124f48b, %l0 = 00000001, %l1 = 00000000
	ldda	[%o1+0x048]%asi,%l0	! %l0 = 00000000c0ffe400 000000007124f48b
!	%l6 = 7c0ec49f, %l7 = 7c0ec0c0, Mem[0000000031000000] = 73277b10 f1b503db
	std	%l6,[%o2+0x000]	! Mem[0000000031000000] = 7c0ec49f 7c0ec0c0
!	%l6 = eb3ff6ef7c0ec49f, %l7 = eb3ff6ef7c0ec0c0, %l2 = 000000000000ffff
	subc	%l6,%l7,%l2		! %l2 = 00000000000003df
!	%l3 = fffd67feddef81d8, immed = fffff18b, %l0 = 00000000c0ffe400
	sub	%l3,-0xe75,%l0		! %l0 = fffd67feddef904d

p0_label_169:
	bcc	p0_b189			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000011800008] = ff000000, %l6 = eb3ff6ef7c0ec49f
	ldstuba	[%i3+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x0bd,%g2
p0_b189:
	membar	#Sync			! Added by membar checker (154)
!	%f28 = 80000000, %f6  = 00000000 90da9f95
	fstod	%f28,%f6 		! %f6  = 80000000 00000000
!	%l5 = eb3ff6ef7c0ec48b, %l3 = fffd67feddef81d8, %l6 = 00000000000000ff
	sub	%l5,%l3,%l6		! %l6 = eb428ef09e1f42b3
!	Mem[0000000011800080] = 0d8ac0e4 01861380 979c8363 702787df
	prefetcha [%i3+0x080]%asi,21

p0_label_170:
!	Denormal Floating Point Operation Nullified
	nop
	set	p0_b190,%o7
	fblg,pn	%fcc2,p0_near_0_he	! Branch Taken, %fcc2 = 1
!	%l0 = fffd67feddef904d, Mem[0000000030800004] = 56ef1aa1
	stw	%l0,[%o1+0x004]		! Mem[0000000030800004] = ddef904d
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x0be,%g2
p0_b190:
!	Registers modified during the branch to p0_near_0
!	%l5  = fffd67feaccb64c6
	membar	#Sync			! Added by membar checker (155)
!	Mem[0000000011800000] = 0000004b00000000, %l2 = 00000000000003df
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = 0000004b00000000
!	Branch On Register, %l1 = 000000007124f48b
	brgz,pt	%l1,p0_b191		! Branch Taken

p0_label_171:
!	Mem[00000000118000b8] = 6335dc29, %l4 = 0000000000000000
	ldub	[%i3+0x0ba],%l4		! %l4 = 00000000000000dc
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0bf,%g2
p0_b191:
	membar	#Sync			! Added by membar checker (156)
!	%l7 = eb3ff6ef7c0ec0c0, immed = 00000cf5, %l7 = eb3ff6ef7c0ec0c0
	sub	%l7,0xcf5,%l7		! %l7 = eb3ff6ef7c0eb3cb
	bge	p0_b192			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000010000008] = 681c047f, %l1 = 000000007124f48b
	swapa	[%i0+%o6]0x80,%l1	! %l1 = 00000000681c047f
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0c0,%g2
p0_b192:
	membar	#Sync			! Added by membar checker (157)
!	Mem[0000000030800008] = 00000000ff0000e2, %l2 = 0000004b00000000
	ldxa	[%o1+0x008]%asi,%l2	! %l2 = 00000000ff0000e2

p0_label_172:
!	Mem[0000000030800000] = 55ffa803 ddef904d, %l2 = ff0000e2, %l3 = ddef81d8
	ldda	[%o1+0x000]%asi,%l2	! %l2 = 0000000055ffa803 00000000ddef904d
!	%l7 = eb3ff6ef7c0eb3cb, %l7 = eb3ff6ef7c0eb3cb, %l7 = eb3ff6ef7c0eb3cb
	srlx	%l7,%l7,%l7		! %l7 = 001d67feddef81d6
!	%l2 = 0000000055ffa803, immed = fffffaa6, %y  = 00000000
	sdivcc	%l2,-0x55a,%l5		! %l5 = ffffffffffefee21, %ccr = 88
!	%l6 = eb428ef09e1f42b3, immed = 00000e44, %y  = 00000000
	udivcc	%l6,0xe44,%l5		! %l5 = 00000000000b1589, %ccr = 00
	set	p0_b193,%o7
	fba	p0_far_2_le	! Branch Taken, %fcc0 = 0

p0_label_173:
!	Mem[0000000010000000] = 000000947aa59344, %l6 = eb428ef09e1f42b3
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 000000947aa59344
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0c1,%g2
p0_b193:
!	Registers modified during the branch to p0_far_2
!	%l7  = 00000000000b11c2
	membar	#Sync			! Added by membar checker (158)
!	%l4 = 00000000000000dc, immed = fffff499, %l6 = 000000947aa59344
	andn	%l4,-0xb67,%l6		! %l6 = 0000000000000044
!	%l5 = 00000000000b1589, immed = fffff82c, %y  = 00000000
	sdivcc	%l5,-0x7d4,%l1		! %l1 = fffffffffffffe96, %ccr = 88
!	Mem[0000000010000060] = bfe56d24 432a06a6 229e256f 2f22d2bf
	prefetch [%i0+0x060],2
!	%l0 = fffd67feddef904d, %l4 = 00000000000000dc, %y  = 00000000
	sdivx	%l0,%l4,%l1		! %l1 = fffffcfb571e2e0a

p0_label_174:
	bgu,a	p0_b194			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010800000] = 00ee00000000004b, %l5 = 00000000000b1589
	ldxa	[%i1+%g0]0x80,%l5	! %l5 = 00ee00000000004b
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p0_branch_failed
	mov	0x0c2,%g2
p0_b194:
	membar	#Sync			! Added by membar checker (159)
!	Mem[0000000032000028] = 91eefd1b, %l3 = 00000000ddef904d
	ldswa	[%o4+0x028]%asi,%g2	! %g2 = 00000000ddef904d
!	%l1 = fffffcfb571e2e0a, Mem[0000000010800008] = 00740000
	stha	%l1,[%i1+%o6]0x80	! Mem[0000000010800008] = 2e0a0000
!	%l6 = 00000044, %l7 = 000b11c2, Mem[0000000010800000] = 00ee0000 0000004b
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000044 000b11c2

p0_label_175:
	fbe,pt	%fcc2,p0_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000010800000] = 00000044, %l5 = 00ee00000000004b
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000044
p0_b195:
	membar	#Sync			! Added by membar checker (160)
	set	p0_b196,%o7
	fble,pn	%fcc1,p0_near_3_he	! Branch Taken, %fcc1 = 1
!	Mem[0000000012000060] = d05ed546 fbb59bc9, %l0 = ddef904d, %l1 = 571e2e0a
	ldd	[%i4+0x060],%l0		! %l0 = 00000000d05ed546 00000000fbb59bc9
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p0_branch_failed
	mov	0x0c4,%g2
p0_b196:
!	Registers modified during the branch to p0_near_3
!	%l1  = 0000000000107424
!	%l2  = 00000000d069e708
!	%l5  = 00000846b4428ec2
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (161)
!	%f14 = 80000000, %f9  = 00000000
	fcmps	%fcc1,%f14,%f9 		! %fcc1 = 0

p0_label_176:
!	Mem[0000000010000068] = 229e256f, %l4 = 00000000000000dc
	ldsba	[%i0+0x069]%asi,%l4	! %l4 = ffffffffffffff9e
!	Mem[0000000011800000] = 0000004b 00000000, %l6 = 00000044, %l7 = 00000000
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 000000000000004b 0000000000000000
!	%l2 = 00000000d069e708, Mem[0000000031000040] = eb3ff6ef7c0ec48b
	stxa	%l2,[%o2+0x040]%asi	! Mem[0000000031000040] = 00000000d069e708
!	%l0 = 00000000d05ed546, immed = 00000db2, %l0 = 00000000d05ed546
	orn	%l0,0xdb2,%l0		! %l0 = fffffffffffff74f
!	%f18 = c1dba958 1ac00000, %f24 = 00000000 00000000, %f24 = 00000000 00000000
	faddd	%f18,%f24,%f24		! %f24 = c1dba958 1ac00000

p0_label_177:
!	%l3 = 00000000ddef904d, immed = 0000000b, %l4 = ffffffffffffff9e
	sra	%l3,0x00b,%l4		! %l4 = fffffffffffbbdf2
!	%l0 = fffffffffffff74f, %l6 = 000000000000004b, %l5 = 00000846b4428ec2
	srlx	%l0,%l6,%l5		! %l5 = 001ffffffffffffe
	fbu,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l7 = 0000000000000000, Mem[0000000011800000] = 0000004b
	stwa	%l7,[%i3+%g0]0x80	! Annulled
p0_b197:
	membar	#Sync			! Added by membar checker (162)
!	%f2  = 00000000 3ff00000, %f22 = 0c93e933 e27d5242
	fxtod	%f2 ,%f22		! %f22 = 41cff800 00000000

p0_label_178:
	fbu,pt	%fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000011000008] = 438d8000, %l2 = 00000000d069e708
	lduha	[%i2+%o6]0x80,%l2	! %l2 = 000000000000438d
p0_b198:
	membar	#Sync			! Added by membar checker (163)
!	%l0 = fffff74f, %l1 = 00107424, Mem[0000000011000008] = 438d8000 000000e2
	stda	%l0,[%i2+%o6]0x80	! Mem[0000000011000008] = fffff74f 00107424
!	%l2 = 000000000000438d, %l7 = 0000000000000000, %l5 = 001ffffffffffffe
	xorcc	%l2,%l7,%l5		! %l5 = 000000000000438d, %ccr = 00
	fblg,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0

p0_label_179:
!	%l1 = 0000000000107424, Mem[0000000010800008] = 2e0a000000000000
	stxa	%l1,[%i1+%o6]0x80	! Annulled
p0_b199:
	membar	#Sync			! Added by membar checker (164)
!	%l7 = 0000000000000000, %l2 = 000000000000438d, %l7 = 0000000000000000
	orncc	%l7,%l2,%l7		! %l7 = ffffffffffffbc72, %ccr = 88
	bcc	p0_b200			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000031000000] = 7c0ec49f, %l6 = 000000000000004b
	lduw	[%o2+0x000],%l6		! %l6 = 000000007c0ec49f
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0c8,%g2
p0_b200:
!	Jump to jmpl_3, CWP = 0
	set	p0_jmpl_3_le,%g1
	jmpl	%g1,%g6

p0_label_180:
!	Mem[0000000031000040] = 00000000, %l1 = 0000000000107424
	ldsb	[%o2+0x043],%l1		! %l1 = 0000000000000000
!	Registers modified during the branch to p0_jmpl_3
!	%l0  = fffffffffffff76f
!	%l2  = 0000000000000000
!	%l3  = ffffffffffffecbf
!	%l4  = 000000007c0ec485
!	%l5  = 000000000000438d
	membar	#Sync			! Added by membar checker (165)
!	%l2 = 0000000000000000, Mem[0000000010800000] = 00000044
	stba	%l2,[%i1+%g0]0x80	! Mem[0000000010800000] = 00000044
!	Mem[0000000010800008] = 2e0a0000, %l7 = ffffffffffffbc72
	ldswa	[%i1+%o6]0x80,%l7	! %l7 = 000000002e0a0000
	fbul,pn	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000010000034] = 0ff11fa5, %l3 = ffffffffffffecbf
	lduh	[%i0+0x034],%l3		! %l3 = 0000000000000ff1
p0_b201:

p0_label_181:
	membar	#Sync			! Added by membar checker (166)
!	%l0 = fffffffffffff76f, %l6 = 000000007c0ec49f, %l4 = 000000007c0ec485
	addccc	%l0,%l6,%l4		! %l4 = 000000007c0ebc0e, %ccr = 11
!	%l0 = fffffffffffff76f, Mem[0000000010800000] = 00000044
	stha	%l0,[%i1+%g0]0x80	! Mem[0000000010800000] = f76f0044
	bn	p0_not_taken_0		! Branch Not Taken, %ccr = 11
!	Mem[0000000011800008] = ff000000000000ca, %l1 = 0000000000000000
	ldxa	[%i3+%o6]0x80,%l1	! %l1 = ff000000000000ca
p0_b202:
	membar	#Sync			! Added by membar checker (167)
!	Denormal Floating Point Operation Nullified
	nop

p0_label_182:
!	%l4 = 000000007c0ebc0e, %l2 = 0000000000000000, %y  = 00000000
	smulcc	%l4,%l2,%l1		! %l1 = 0000000000000000, %ccr = 44
	nop
	bvc	p0_b203			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000010800040] = dfd4eefa b9b2c28f 2aa9c3bc 14212304
	prefetch [%i1+0x040],2
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x0cb,%g2
p0_b203:
	membar	#Sync			! Added by membar checker (168)
!	Mem[0000000031800008] = 8ec04124, %l4 = 000000007c0ebc0e
	ldub	[%o3+0x009],%l4		! %l4 = 00000000000000c0

p0_label_183:
!	%l3 = 0000000000000ff1, %l3 = 0000000000000ff1, %y  = 00000000
	umulcc	%l3,%l3,%l5		! %l5 = 0000000000fe20e1, %ccr = 00
!	%l3 = 0000000000000ff1, %l0 = fffffffffffff76f, %l7 = 000000002e0a0000
	sllx	%l3,%l0,%l7		! %l7 = 07f8800000000000
!	Mem[00000000110000e0] = 007d62b6 107aaea1 a04bb3c2 cb260a79
	prefetcha [%i2+0x0e0]%asi,1
!	%l2 = 0000000000000000, %l7 = 07f8800000000000, %l7 = 07f8800000000000
	xorcc	%l2,%l7,%l7		! %l7 = 07f8800000000000, %ccr = 04
!	%f29 = 3ff00000, %f4  = 00000000, %f3  = 3ff00000
	fmuls	%f29,%f4 ,%f3 		! %f3  = 00000000

p0_label_184:
	bneg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 04
!	Mem[0000000011000008] = fffff74f, %l4 = 00000000000000c0
	lduwa	[%i2+%o6]0x80,%l4	! Annulled
p0_b204:
!	call to call_2, CWP = 0
	call	p0_call_2_le
!	Mem[0000000010000078] = 8fc18fc5, %l0 = fffffffffffff76f
	ldub	[%i0+0x07a],%l0		! %l0 = 000000000000008f
!	Registers modified during the branch to p0_call_2
!	%l0  = fffffffffffff82f
	membar	#Sync			! Added by membar checker (169)
!	%f16 = 00000000 00000000, %f12 = 00000000 24dc609f
	fxtod	%f16,%f12		! %f12 = 00000000 00000000

p0_label_185:
!	%l7 = 07f8800000000000, %l2 = 0000000000000000, %y  = 00000000
	mulx	%l7,%l2,%l7		! %l7 = 0000000000000000
	fbug,a,pt %fcc3,p0_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[00000000118000a4] = fd8017d7, %l7 = 0000000000000000
	lduw	[%i3+0x0a4],%l7		! Annulled
p0_b205:
	membar	#Sync			! Added by membar checker (170)
!	Mem[00000000108000a4] = b8e697db, %l2 = 0000000000000000
	lduw	[%i1+0x0a4],%l2		! %l2 = 00000000b8e697db
	ble,a	p0_b206			! Branch Taken, %ccr = 04, CWP = 0

p0_label_186:
!	Mem[0000000010800000] = f76f0044, %l0 = fffffffffffff82f
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = fffffffffffffff7
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p0_branch_failed
	mov	0x0ce,%g2
p0_b206:
	membar	#Sync			! Added by membar checker (171)
!	%l5 = 0000000000fe20e1, %l3 = 0000000000000ff1, %y  = 00000000
	udiv	%l5,%l3,%l3		! %l3 = 0000000000000ff1
!	Mem[0000000011000008] = fffff74f, %l6 = 7c0ec49f, %l2 = b8e697db
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 00000000fffff74f
!	%l3 = 0000000000000ff1, %l7 = 0000000000000000, %l3 = 0000000000000ff1
	or	%l3,%l7,%l3		! %l3 = 0000000000000ff1
	fbul,pn	%fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0

p0_label_187:
!	Mem[0000000031000048] = ffef4bebe8b7ee34, %l4 = 00000000000000c0
	ldx	[%o2+0x048],%l4		! %l4 = ffef4bebe8b7ee34
p0_b207:
	membar	#Sync			! Added by membar checker (172)
!	%l6 = 000000007c0ec49f, %l0 = fffffffffffffff7, %l1 = 0000000000000000
	srax	%l6,%l0,%l1		! %l1 = 0000000000000000
!	%l6 = 000000007c0ec49f, immed = 00000fa7, %y  = 00000000
	udivx	%l6,0xfa7,%l5		! %l5 = 000000000007ed02
!	%f2  = 00000000 00000000, %f30 = 3f680000 00000000
	fnegd	%f2 ,%f30		! %f30 = 80000000 00000000
!	%f30 = 80000000, %f12 = 00000000, %f6  = 80000000 00000000
	fsmuld	%f30,%f12,%f6 		! %f6  = 80000000 00000000

p0_label_188:
	bleu	p0_b208			! Branch Taken, %ccr = 04, CWP = 0
!	Mem[0000000010000038] = 3d381f00, %l5 = 000000000007ed02
	swap	[%i0+0x038],%l5		! %l5 = 000000003d381f00
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x0d0,%g2
p0_b208:
	membar	#Sync			! Added by membar checker (173)
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[0000000011800000] = 0000004b, %l7 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000032000000] = 01fc8c99, %l7 = 0000000000000000
	lduha	[%o4+0x002]%asi,%g2	! %g2 = 00000000000001fc

p0_label_189:
	fbug,a,pn %fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 000000007c0ec49f, Mem[0000000011000008] = fffff74f00107424
	stxa	%l6,[%i2+%o6]0x80	! Annulled
p0_b209:
	bcs	p0_not_taken_0		! Branch Not Taken, %ccr = 04
!	Mem[0000000011800008] = ff000000, %l3 = 0000000000000ff1
	swapa	[%i3+%o6]0x80,%l3	! %l3 = 00000000ff000000
p0_b210:
	membar	#Sync			! Added by membar checker (174)
!	%f20 = 00000000, %f6  = 80000000 00000000
	fstod	%f20,%f6 		! %f6  = 00000000 00000000

p0_label_190:
	bcc	p0_b211			! Branch Taken, %ccr = 04, CWP = 0
!	%l2 = 00000000fffff74f, Mem[0000000010800008] = 2e0a0000
	stba	%l2,[%i1+%o6]0x80	! Mem[0000000010800008] = 4f0a0000
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p0_branch_failed
	mov	0x0d3,%g2
p0_b211:
	fbne	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = fffffffffffffff7, Mem[0000000011000000] = 00000000
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000011000000] = fffffff7
p0_b212:
	membar	#Sync			! Added by membar checker (175)
!	%l1 = 0000000000000000, immed = fffffd96, %l7 = 0000000000000000
	orcc	%l1,-0x26a,%l7		! %l7 = fffffffffffffd96, %ccr = 88

p0_label_191:
!	Mem[0000000011800008] = 00000ff1, %l6 = 000000007c0ec49f
	ldswa	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000ff1
!	%f4  = 00000000 00000000, %f2  = 00000000 00000000
	fabsd	%f4 ,%f2 		! %f2  = 00000000 00000000
	bcc	p0_b213			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000010800060] = b7620b0c ffffffd4 ed3a5b6a 0c5bb192
	prefetch [%i1+0x060],22
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p0_branch_failed
	mov	0x0d5,%g2
p0_b213:
	membar	#Sync			! Added by membar checker (176)
!	Mem[00000000130000dc] = 9af95a67, %l0 = fffffffffffffff7
	lduba	[%i6+0x0dd]%asi,%l0	! %l0 = 00000000000000f9

p0_label_192:
!	%f2  = 00000000 00000000, %f22 = 41cff800 00000000, %f30 = 80000000 00000000
	faddd	%f2 ,%f22,%f30		! %f30 = 41cff800 00000000
!	Mem[000000001100007c] = 6b140b18, %l7 = fffffffffffffd96
	ldswa	[%i2+0x07c]%asi,%l7	! %l7 = 000000006b140b18
!	Mem[0000000010800070] = 80000000 00000000, %l0 = 00000000000000f9, %l5 = 000000003d381f00
	add	%i1,0x70,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 0000004bb4adc27b
!	Mem[00000000110000a0] = 8d21ee1d 6c3c6553 6c81ef7e b1eb2f18
	prefetcha [%i2+0x0a0]%asi,20
!	%l0 = 000000f9, %l1 = 00000000, Mem[0000000010000068] = 229e256f 2f22d2bf
	stda	%l0,[%i0+0x068]%asi	! Mem[0000000010000068] = 000000f9 00000000

p0_label_193:
!	%f20 = 00000000 00000000, %f5  = 00000000
	fxtos	%f20,%f5 		! %f5  = 00000000
!	call to call_1, CWP = 0
	call	p0_call_1_le
!	%l2 = 00000000fffff74f, Mem[0000000012000008] = e8389480
	stha	%l2,[%i4+%o6]0x80	! Mem[0000000012000008] = f74f9480
!	Registers modified during the branch to p0_call_1
!	%l6  = ffef4beb80a3e424
	bg,a	p0_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000011800040] = 068c7990, %l1 = 0000000000000000
	ldsw	[%i3+0x040],%l1		! Annulled
p0_b214:

p0_label_194:
	membar	#Sync			! Added by membar checker (177)
!	Mem[0000000040000010] = 000000ff0005a30c, %l7 = 000000006b140b18
	ldx	[%o5+0x010],%l7		! %l7 = 000000ff0005a30c
!	call to call_1, CWP = 0
	call	p0_call_1_he
!	%l0 = 00000000000000f9, Mem[00000000110000be] = f2a7028f
	stb	%l0,[%i2+0x0be]		! Mem[00000000110000bc] = f2a7f98f
!	Registers modified during the branch to p0_call_1
!	%l0  = 00000000fff6eb3f
!	%l1  = ffef4beb1748197b
!	%l3  = ffffffffbd727053
!	%l5  = 0000028ea5c8b0f5
!	%l5 = 0000028ea5c8b0f5, %l5 = 0000028ea5c8b0f5, %l2 = 00000000fffff74f
	xor	%l5,%l5,%l2		! %l2 = 0000000000000000
!	%l3 = ffffffffbd727053, %l1 = ffef4beb1748197b, %l6 = ffef4beb80a3e424
	srax	%l3,%l1,%l6		! %l6 = ffffffffffffffff

p0_label_195:
!	%l5 = 0000028ea5c8b0f5, immed = 00000169, %l7 = 000000ff0005a30c
	taddcc	%l5,0x169,%l7		! %l7 = 0000028ea5c8b25e, %ccr = 0a
!	%l0 = 00000000fff6eb3f
	setx	0x01b0126b01b0126b,%g7,%l0 ! %l0 = 01b0126b01b0126b
!	%l3 = ffffffffbd727053, immed = 0000003b, %l3 = ffffffffbd727053
	srax	%l3,0x03b,%l3		! %l3 = ffffffffffffffff
!	%l7 = 0000028ea5c8b25e, %l4 = ffef4bebe8b7ee34, %l2 = 0000000000000000
	and	%l7,%l4,%l2		! %l2 = 0000028aa080a214
!	%l7 = 0000028ea5c8b25e, immed = fffffc43, %l4 = ffef4bebe8b7ee34
	add	%l7,-0x3bd,%l4		! %l4 = 0000028ea5c8aea1

p0_label_196:
!	%l0 = 01b0126b01b0126b, immed = 000000b2, %y  = 0000028e
	sdivx	%l0,0x0b2,%l5		! %l5 = 00026d6826d74803
	fbg,a,pt %fcc1,p0_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000032000000] = 01fc8c99, %l1 = ffef4beb1748197b
	ldsh	[%o4+0x002],%g2		! Annulled
p0_b215:
	ba	p0_b216			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000010000008] = 7124f48b1687f975, %l1 = ffef4beb1748197b
	ldxa	[%i0+%o6]0x80,%l1	! %l1 = 7124f48b1687f975
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p0_branch_failed
	mov	0x0d8,%g2
p0_b216:

p0_label_197:
	membar	#Sync			! Added by membar checker (178)
!	Mem[0000000010800048] = 2aa9c3bc 14212304, %l4 = a5c8aea1, %l5 = 26d74803
	ldda	[%i1+0x048]%asi,%l4	! %l4 = 000000002aa9c3bc 0000000014212304
!	Mem[0000000032000034] = dabefe3e, %l6 = ffffffffffffffff
	ldsh	[%o4+0x036],%g2		! %g2 = ffffffffffffdabe
!	%l0 = 01b0126b, %l1 = 1687f975, Mem[0000000030000008] = 00000000 fff6eb3f
	std	%l0,[%o0+0x008]	! Mem[0000000030000008] = 01b0126b 1687f975
!	%l3 = ffffffffffffffff, immed = 00000c09, %l0 = 01b0126b01b0126b
	xorcc	%l3,0xc09,%l0		! %l0 = fffffffffffff3f6, %ccr = 88
	set	p0_b217,%o7
	fbue	p0_far_3_le	! Branch Taken, %fcc0 = 0

p0_label_198:
!	%l6 = ffffffffffffffff, Mem[00000000100000f0] = daa4f84e
	sth	%l6,[%i0+0x0f0]		! Mem[00000000100000f0] = fffff84e
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p0_branch_failed
	mov	0x0d9,%g2
p0_b217:
!	Registers modified during the branch to p0_far_3
!	%l4  = 00000000224b8aff
	membar	#Sync			! Added by membar checker (179)
!	%l0 = fffffffffffff3f6, %l3 = ffffffffffffffff, %y  = 0000028e
	sdivcc	%l0,%l3,%l5		! %l5 = ffffffff80000000, %ccr = 8a
!	%l7 = 0000028ea5c8b25e, %l5 = ffffffff80000000, %y  = 0000028e
	udivcc	%l7,%l5,%l0		! %l0 = 000000000000051d, %ccr = 00
!	Mem[00000000110000cc] = 4e35edd1, %l2 = 0000028aa080a214
	lduha	[%i2+0x0cc]%asi,%l2	! %l2 = 0000000000004e35
!	%l3 = ffffffffffffffff, %l5 = ffffffff80000000, %l5 = ffffffff80000000
	andncc	%l3,%l5,%l5		! %l5 = 000000007fffffff, %ccr = 00

p0_label_199:
	bgu,a	p0_b218			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],22
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p0_branch_failed
	mov	0x0da,%g2
p0_b218:
	membar	#Sync			! Added by membar checker (180)
!	%l3 = ffffffffffffffff, %l1 = 7124f48b1687f975, %l2 = 0000000000004e35
	sllx	%l3,%l1,%l2		! %l2 = ffe0000000000000
!	Mem[0000000011000008] = fffff74f, %l4 = 00000000224b8aff
	lduba	[%i2+%o6]0x80,%l4	! %l4 = 00000000000000ff
!	%f20 = 00000000 00000000, %f30 = 41cff800 00000000
	fmovd	%f20,%f30		! %f30 = 00000000 00000000

p0_label_200:
!	%f21 = 00000000, %f28 = 80000000 3ff00000
	fstox	%f21,%f28		! %f28 = 00000000 00000000
!	%f10 = 00000000 24dc609f, %f24 = c1dba958 1ac00000
	fxtod	%f10,%f24		! %f24 = 41c26e30 4f800000
	fbn,a	%fcc0,p0_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000011000008] = fffff74f, %l4 = 00000000000000ff
	ldsba	[%i2+%o6]0x80,%l4	! Annulled
p0_b219:
	membar	#Sync			! Added by membar checker (181)
!	Mem[00000000118000e8] = 87b74602, %l6 = ffffffffffffffff
	swapa	[%i3+0x0e8]%asi,%l6	! %l6 = 0000000087b74602

!	End of Random Code for Processor 0

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x000]		! Set processor 0 done flag

!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000000000051d
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 7124f48b1687f975
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffe0000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000007fffffff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000087b74602
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000028ea5c8b25e
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x0000028e,%g2
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
	cmp	%l0,%l1			! %f6  should be 00000000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 3ff00000 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 24dc609f
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
	cmp	%l0,%l1			! %f14 should be 80000000 3ff00000
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
	cmp	%l0,%l1			! %f18 should be c1dba958 1ac00000
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
	cmp	%l0,%l1			! %f22 should be 41cff800 00000000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 41c26e30 4f800000
	bne,a,pn	%xcc,p0_freg_fail
	or	%g0,0xf24,%g1
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 454bcf7d 627d5242
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
	ldx	[%g1+0x000],%g2		! Expect data = 000000947aa59344
	ldx	[%i0+0x000],%g3		! Observed data at 0000000010000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 7124f48b1687f975
	ldx	[%i0+0x008],%g3		! Observed data at 0000000010000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 59722b000ff11fa5
	ldx	[%i0+0x030],%g3		! Observed data at 0000000010000030
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x038],%g2		! Expect data = 0007ed0205f71d7c
	ldx	[%i0+0x038],%g3		! Observed data at 0000000010000038
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 000000f900000000
	ldx	[%i0+0x068],%g3		! Observed data at 0000000010000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x090],%g2		! Expect data = d22e4bf9cad5e2d8
	ldx	[%i0+0x090],%g3		! Observed data at 0000000010000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 2c7c39f4000016b3
	ldx	[%i0+0x0a8],%g3		! Observed data at 00000000100000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = 0000000000000000
	ldx	[%i0+0x0b0],%g3		! Observed data at 00000000100000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = fffff84e7c7392e2
	ldx	[%i0+0x0f0],%g3		! Observed data at 00000000100000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f0,%g4

	set	p0_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = f76f0044000b11c2
	ldx	[%i1+0x000],%g3		! Observed data at 0000000010800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 4f0a000000000000
	ldx	[%i1+0x008],%g3		! Observed data at 0000000010800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 110eb19cda43ff62
	ldx	[%i1+0x028],%g3		! Observed data at 0000000010800028
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x038],%g2		! Expect data = 94f221231922cff2
	ldx	[%i1+0x038],%g3		! Observed data at 0000000010800038
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x060],%g2		! Expect data = b7620b0cffffffd4
	ldx	[%i1+0x060],%g3		! Observed data at 0000000010800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 0000004bb4adc27b
	ldx	[%i1+0x070],%g3		! Observed data at 0000000010800070
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 0000000000000000
	ldx	[%i1+0x078],%g3		! Observed data at 0000000010800078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 086eec6000660053
	ldx	[%i1+0x0b8],%g3		! Observed data at 00000000108000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = fae9433100000000
	ldx	[%i1+0x0c0],%g3		! Observed data at 00000000108000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 00a80000a080a214
	ldx	[%i1+0x0e8],%g3		! Observed data at 00000000108000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = fffffff7ff0000e2
	ldx	[%i2+0x000],%g3		! Observed data at 0000000011000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fffff74f00107424
	ldx	[%i2+0x008],%g3		! Observed data at 0000000011000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = ee00c608b0113622
	ldx	[%i2+0x020],%g3		! Observed data at 0000000011000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x028],%g2		! Expect data = ffffffff04600000
	ldx	[%i2+0x028],%g3		! Observed data at 0000000011000028
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 4853a446000064ff
	ldx	[%i2+0x050],%g3		! Observed data at 0000000011000050
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x078],%g2		! Expect data = e0c701d56b140b18
	ldx	[%i2+0x078],%g3		! Observed data at 0000000011000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x090],%g2		! Expect data = cb3e7548bcff6a9b
	ldx	[%i2+0x090],%g3		! Observed data at 0000000011000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = c76fbd85f2a7f98f
	ldx	[%i2+0x0b8],%g3		! Observed data at 00000000110000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = fff6eb3f4e35edd1
	ldx	[%i2+0x0c8],%g3		! Observed data at 00000000110000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c8,%g4
	ldx	[%g1+0x0d0],%g2		! Expect data = 23047b442119ab1f
	ldx	[%i2+0x0d0],%g3		! Observed data at 00000000110000d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0d0,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = 0693273dff8661c9
	ldx	[%i2+0x0f0],%g3		! Observed data at 00000000110000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = bdd1ac9180269fff
	ldx	[%i2+0x0f8],%g3		! Observed data at 00000000110000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0f8,%g4

	set	p0_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000004b00000000
	ldx	[%i3+0x000],%g3		! Observed data at 0000000011800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 00000ff1000000ca
	ldx	[%i3+0x008],%g3		! Observed data at 0000000011800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x040],%g2		! Expect data = 068c79900c4aed00
	ldx	[%i3+0x040],%g3		! Observed data at 0000000011800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x048],%g2		! Expect data = fee5f2ca0003d8b5
	ldx	[%i3+0x048],%g3		! Observed data at 0000000011800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x068],%g2		! Expect data = d8b5b3cc410e7efd
	ldx	[%i3+0x068],%g3		! Observed data at 0000000011800068
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 429f02dcefb9feff
	ldx	[%i3+0x070],%g3		! Observed data at 0000000011800070
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x098],%g2		! Expect data = f848121400000000
	ldx	[%i3+0x098],%g3		! Observed data at 0000000011800098
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = ffffffff0000020f
	ldx	[%i3+0x0c0],%g3		! Observed data at 00000000118000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = ffffffff57be45cc
	ldx	[%i3+0x0e8],%g3		! Observed data at 00000000118000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0e8,%g4

	set	p0_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 8f3818e5d5a2b060
	ldx	[%i4+0x000],%g3		! Observed data at 0000000012000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = f74f94806cc1597a
	ldx	[%i4+0x008],%g3		! Observed data at 0000000012000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4

	set	p0_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000000000000000
	ldx	[%i5+0x000],%g3		! Observed data at 0000000012800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x000,%g4

	set	p0_local6_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 0000c7f7234f7968
	ldx	[%i6+0x008],%g3		! Observed data at 0000000013000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x038],%g2		! Expect data = fee5f2ca8b27284a
	ldx	[%i6+0x038],%g3		! Observed data at 0000000013000038
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x0c8],%g2		! Expect data = 00000000000055cd
	ldx	[%i6+0x0c8],%g3		! Observed data at 00000000130000c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p0_local_failed
	mov	0x0c8,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p0_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p0_memcheck_share0:
	ldx	[%g4+0x00],%g2	! Expected value = 72accfc5a2e315b2
	ldx	[%o0+0x00],%g3	! Read value at Mem[0000000030000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 01b0126b1687f975
	ldx	[%o0+0x08],%g3	! Read value at Mem[0000000030000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 000000e200000000
	ldx	[%o0+0x40],%g3	! Read value at Mem[0000000030000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 860adba7047f43e0
	ldx	[%o0+0x48],%g3	! Read value at Mem[0000000030000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p0_memcheck_share1:
	ldx	[%g4+0x00],%g2	! Expected value = 55ffa803ddef904d
	ldx	[%o1+0x00],%g3	! Read value at Mem[0000000030800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 00000000ff0000e2
	ldx	[%o1+0x08],%g3	! Read value at Mem[0000000030800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = ddb5d797000000b0
	ldx	[%o1+0x40],%g3	! Read value at Mem[0000000030800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = c0ffe47b7124f48b
	ldx	[%o1+0x48],%g3	! Read value at Mem[0000000030800048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p0_memcheck_share2:
	ldx	[%g4+0x00],%g2	! Expected value = 7c0ec49f7c0ec0c0
	ldx	[%o2+0x00],%g3	! Read value at Mem[0000000031000000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 007afbf900000027
	ldx	[%o2+0x08],%g3	! Read value at Mem[0000000031000008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = 00000000d069e708
	ldx	[%o2+0x40],%g3	! Read value at Mem[0000000031000040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = ffef4bebe8b7ee34
	ldx	[%o2+0x48],%g3	! Read value at Mem[0000000031000048]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x048,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p0_memcheck_share3:
	ldx	[%g4+0x00],%g2	! Expected value = 00008aff00000000
	ldx	[%o3+0x00],%g3	! Read value at Mem[0000000031800000]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x000,%g1
	ldx	[%g4+0x08],%g2	! Expected value = 8ec041244765140a
	ldx	[%o3+0x08],%g3	! Read value at Mem[0000000031800008]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x008,%g1
	ldx	[%g4+0x40],%g2	! Expected value = fffffbfd224b8aff
	ldx	[%o3+0x40],%g3	! Read value at Mem[0000000031800040]
	cmp	%g2,%g3
	bne,pn	%xcc,p0_failed
	add	%g6,0x040,%g1
	ldx	[%g4+0x48],%g2	! Expected value = 000000e2224b8aff
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
	sdiv	%l2,-0x165,%l3
	done

p0_trap1o:
	sdiv	%l2,-0x165,%l3
	done


p0_trap2e:
	xor	%l0,%l1,%l5
	done

p0_trap2o:
	xor	%l0,%l1,%l5
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
	ldx	[%g1+0x000],%l0	! %l0 = 59722b000ff11fa5
	ldx	[%g1+0x008],%l1	! %l1 = b0178200525d1e9b
	ldx	[%g1+0x010],%l2	! %l2 = 220c72005095e099
	ldx	[%g1+0x018],%l3	! %l3 = 76f2e000179c60a9
	ldx	[%g1+0x020],%l4	! %l4 = e13664ffc60d4c51
	ldx	[%g1+0x028],%l5	! %l5 = cf2b1cff90d5b1d0
	ldx	[%g1+0x030],%l6	! %l6 = 604dc5ffd1e5dbce
	ldx	[%g1+0x038],%l7	! %l7 = 7810310062f5c7c4

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
	ldd	[%g1+0x00],%f0		! %f0  = 8ffa50c9, %f1  = 97b16b5d
	ldd	[%g1+0x08],%f2		! %f2  = 0978db9c, %f3  = ec91adf4
	ldd	[%g1+0x10],%f4		! %f4  = a7cf71ad, %f5  = 05284518
	ldd	[%g1+0x18],%f6		! %f6  = 7b7d697e, %f7  = f8a2b748
	ldd	[%g1+0x20],%f8		! %f8  = 8a0106aa, %f9  = 58ec97f1
	ldd	[%g1+0x28],%f10		! %f10 = c463c699, %f11 = c32f3f4f
	ldd	[%g1+0x30],%f12		! %f12 = 67970789, %f13 = 722732c3
	ldd	[%g1+0x38],%f14		! %f14 = 97706a2c, %f15 = 17ce0f0c
	ldd	[%g1+0x40],%f16		! %f16 = 850e9908, %f17 = 6d482ee0
	ldd	[%g1+0x48],%f18		! %f18 = b9eddb85, %f19 = 17a25616
	ldd	[%g1+0x50],%f20		! %f20 = 06ab07d2, %f21 = 87560a05
	ldd	[%g1+0x58],%f22		! %f22 = bb9b461b, %f23 = de50e1a5
	ldd	[%g1+0x60],%f24		! %f24 = 8b1ae776, %f25 = 9432e52e
	ldd	[%g1+0x68],%f26		! %f26 = 74b839c0, %f27 = 2900bf4a
	ldd	[%g1+0x70],%f28		! %f28 = 69f233b4, %f29 = ef6093a8
	ldd	[%g1+0x78],%f30		! %f30 = 2f94aef4, %f31 = 4e2c7d55
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 1

p1_label_1:
!	Mem[00000000158000c0] = 262a05e5 c024f369 abb8632b 04107e2b
	prefetch [%i3+0x0c0],4
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[00000000150001a0] = a26cc956 3cac00df 80206391 ef53042c
	prefetch [%i2+0x1a0],2
p1_b1:
	membar	#Sync			! Added by membar checker (182)
!	%l0 = cafd7a0035bc26a8, %l2 = d99706ffaaa7bbd8, %l7 = 9e7b92ff972e88d2
	andn	%l0,%l2,%l7		! %l7 = 0268780015180420
!	%f5  = 05284518, %f16 = 850e9908, %f28 = 69f233b4
	fsubs	%f5 ,%f16,%f28		! %f28 = 059b6f10

p1_label_2:
	set	p1_b2,%o7
	fbge,a,pt %fcc2,p1_near_3_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000015000000] = bd703842, %l0 = cafd7a0035bc26a8
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 00000000bd703842
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x002,%g2
p1_b2:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000280
	membar	#Sync			! Added by membar checker (183)
!	Mem[0000000015800020] = 3f83ed4f 5fc29d80 81f8af23 e3fbc38e
	prefetch [%i3+0x020],20
!	Mem[0000000015800060] = 71908522 e057ea31 921a40bb d7db1079
	prefetcha [%i3+0x060]%asi,3
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,20

p1_label_3:
!	Mem[0000000014800000] = fbba5f73, %l4 = 265cf600641b73d0
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = fffffffffbba5f73
!	%f15 = 17ce0f0c, %f24 = 8b1ae776
	fnegs	%f15,%f24		! %f24 = 97ce0f0c
!	%l0 = 00000000bd703842, %l2 = 0000000000000280, %l5 = 11395aff932002b0
	tsubcc	%l0,%l2,%l5		! %l5 = 00000000bd7035c2, %ccr = 0a
!	Mem[00000000140000e0] = e85120df913403c8, %l1 = cb2846000a19f4cc
	ldxa	[%i0+0x0e0]%asi,%l1	! %l1 = e85120df913403c8
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_4:
!	Mem[0000000031800054] = 7468b768, %l5 = 00000000bd7035c2
	ldub	[%o3+0x055],%l5		! Annulled
p1_b3:
	membar	#Sync			! Added by membar checker (184)
!	%f30 = 2f94aef4, %f30 = 2f94aef4, %f29 = ef6093a8
	fdivs	%f30,%f30,%f29		! %f29 = 3f800000
	ba,a	p1_b4			! Branch Taken, %ccr = 0a, CWP = 0
!	Mem[0000000015800000] = b321afbc 77805240 216cf49d 03a1ddc6
	prefetch [%i3+0x000],1	! Annulled
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x004,%g2
p1_b4:
	membar	#Sync			! Added by membar checker (185)
!	Branch On Register, %l6 = a74addffc93e0449
	brnz,pt	%l6,p1_b5		! Branch Taken

p1_label_5:
!	Mem[0000000032000020] = b26a4ec5, %l4 = fffffffffbba5f73
	ldsb	[%o4+0x023],%g2		! %g2 = ffffffffffffffb2
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x005,%g2
p1_b5:
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[0000000015800008] = 216cf49d, %l1 = e85120df913403c8
	lduha	[%i3+%o6]0x80,%l1	! %l1 = 000000000000216c
p1_b6:
	membar	#Sync			! Added by membar checker (186)
!	%l5 = 00000000bd7035c2, immed = 0000001a, %l7 = 0268780015180420
	sll	%l5,0x01a,%l7		! %l7 = 02f5c0d708000000
!	%l3 = ded1ddffcbe5a6ea, %l2 = 0000000000000280, %l7 = 02f5c0d708000000
	xor	%l3,%l2,%l7		! %l7 = ded1ddffcbe5a46a

p1_label_6:
!	Mem[0000000014800120] = 5990874c 6a8afdbe
	flush	%i1+0x120
!	%f3  = ec91adf4, %f6  = 7b7d697e
	fmovs	%f3 ,%f6 		! %f6  = ec91adf4
!	%f10 = c463c699 c32f3f4f, %f28 = 059b6f10 3f800000
	fcmpd	%fcc0,%f10,%f28		! %fcc0 = 1
!	Mem[0000000015000120] = b581b50d fa9eb8e0 7b37fa95 36b3370a
	prefetcha [%i2+0x120]%asi,20
	bge	p1_b7			! Branch Taken, %ccr = 0a, CWP = 0

p1_label_7:
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],20
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x007,%g2
p1_b7:
	membar	#Sync			! Added by membar checker (187)
!	%l7 = ded1ddffcbe5a46a, Mem[000000003100001c] = 78eb39b0
	stwa	%l7,[%o2+0x01c]%asi	! Mem[000000003100001c] = cbe5a46a
	set	p1_b8,%o7
	fbuge,pn %fcc3,p1_near_1_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000015800008] = 216cf49d, %l1 = 000000000000216c
	lduha	[%i3+%o6]0x80,%l1	! %l1 = 000000000000216c
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x008,%g2
p1_b8:
!	Registers modified during the branch to p1_near_1
!	%l0  = fffffffffffff55d
!	%l1  = 210a0000001a0001
!	%l3  = 0000000000000000
!	%l4  = 212e2200896a6157
!	%l6  = 210a0000001a095c
	bleu	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_8:
!	Mem[0000000015000008] = be301196bed44891, %l1 = 210a0000001a0001
	ldxa	[%i2+%o6]0x80,%l1	! %l1 = be301196bed44891
p1_b9:
	membar	#Sync			! Added by membar checker (188)
!	%f14 = 97706a2c 17ce0f0c, %f14 = 97706a2c 17ce0f0c, %f0  = 8ffa50c9 97b16b5d
	fsubd	%f14,%f14,%f0 		! %f0  = 00000000 00000000
	bge	p1_b10			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000015000000] = bd703842, %l1 = be301196bed44891
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000bd
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x00a,%g2
p1_b10:
	membar	#Sync			! Added by membar checker (189)
!	%l0 = fffffffffffff55d, %l3 = 0000000000000000, %l1 = 00000000000000bd
	sra	%l0,%l3,%l1		! %l1 = fffffffffffff55d

p1_label_9:
	fbge,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l0 = fffff55d, %l1 = fffff55d, Mem[00000000160000d8] = 5ae609f7 18f4ac78
	std	%l0,[%i4+0x0d8]	! Annulled
p1_b11:
	set	p1_b12,%o7
	fbule	p1_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[00000000150000ac] = 2cde5317, %l5 = 00000000bd7035c2
	ldsw	[%i2+0x0ac],%l5		! %l5 = 000000002cde5317
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x00c,%g2
p1_b12:
!	Registers modified during the branch to p1_far_1
!	%l2  = 210a0000001a06e1
!	%l5  = ffffffffffffffd7
	membar	#Sync			! Added by membar checker (190)
!	Mem[0000000030000058] = 2582bfc5, %l4 = 212e2200896a6157
	swapa	[%o0+0x058]%asi,%l4	! %l4 = 000000002582bfc5

p1_label_10:
!	%l2 = 210a0000001a06e1, immed = fffffe1c, %l7 = ded1ddffcbe5a46a
	andncc	%l2,-0x1e4,%l7		! %l7 = 00000000000000e1, %ccr = 00
	set	p1_b13,%o7
	fbue,pn	%fcc3,p1_near_2_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000031000058] = 1c04d06b 702637af, %l2 = 001a06e1, %l3 = 00000000
	ldd	[%o2+0x058],%l2		! %l2 = 000000001c04d06b 00000000702637af
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x00d,%g2
p1_b13:
!	Registers modified during the branch to p1_near_2
!	%l2  = 0000085dfffea8f2
	membar	#Sync			! Added by membar checker (191)
!	%f29 = 3f800000, %f8  = 8a0106aa 58ec97f1
	fstox	%f29,%f8 		! %f8  = 00000000 00000001
!	%l5 = ffffffffffffffd7
	sethi	%hi(0xbb6a7000),%l5	! %l5 = 00000000bb6a7000

p1_label_11:
!	Mem[00000000158001b4] = 164a1802, %l4 = 000000002582bfc5
	ldswa	[%i3+0x1b4]%asi,%l4	! %l4 = 00000000164a1802
!	Mem[0000000015800128] = 6395c960, %l7 = 00000000000000e1
	ldsh	[%i3+0x128],%l7		! %l7 = 0000000000006395
!	%l3 = 00000000702637af, Mem[00000000150000f2] = f96f7b0f
	stba	%l3,[%i2+0x0f2]%asi	! Mem[00000000150000f0] = f96faf0f
!	%l3 = 00000000702637af, %l0 = fffffffffffff55d, %l0 = fffffffffffff55d
	addc	%l3,%l0,%l0		! %l0 = 0000000070262d0c
!	%l0 = 0000000070262d0c, immed = 00000cac, %y  = 0000085d
	smulcc	%l0,0xcac,%l6		! %l6 = 0000058d23c2d410, %ccr = 00

p1_label_12:
!	%l0 = 0000000070262d0c, %l5 = 00000000bb6a7000, %l0 = 0000000070262d0c
	subc	%l0,%l5,%l0		! %l0 = ffffffffb4bbbd0c
!	%l1 = fffffffffffff55d, immed = fffff3f5, %y  = 0000058d
	umul	%l1,-0xc0b,%l5		! %l5 = ffffe95200801901
!	Branch On Register, %l4 = 00000000164a1802
	brgz,a,pt %l4,p1_b14		! Branch Taken
!	Mem[00000000158001fd] = 13061ec3, %l4 = 00000000164a1802
	ldstub	[%i3+0x1fd],%l4		! %l4 = 0000000000000006
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x00e,%g2
p1_b14:
	membar	#Sync			! Added by membar checker (192)
!	%l2 = 0000085dfffea8f2, immed = 0000072e, %l4 = 0000000000000006
	sub	%l2,0x72e,%l4		! %l4 = 0000085dfffea1c4

p1_label_13:
!	Mem[0000000015800000] = b321afbc, %l0 = ffffffffb4bbbd0c
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000b321afbc
!	%l6 = 0000058d23c2d410, %l7 = 0000000000006395, %l4 = 0000085dfffea1c4
	xnorcc	%l6,%l7,%l4		! %l4 = fffffa72dc3d487a, %ccr = 88
	set	p1_b15,%o7
	fbne,a	p1_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000014800008] = 305d164e, %l7 = 0000000000006395
	ldsba	[%i1+%o6]0x80,%l7	! %l7 = 0000000000000030
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x00f,%g2
p1_b15:
!	Registers modified during the branch to p1_far_0
!	%l1  = 00000000ffffffff
!	%l2  = ffffffff8fd9c3ad
!	%l6  = ffffffff80000000
!	%l7  = 0000000000000061
!	call to call_1, CWP = 0
	call	p1_call_1_he

p1_label_14:
!	Mem[0000000014800000] = fbba5f73f81c6679, %l6 = ffffffff80000000
	ldxa	[%i1+%g0]0x80,%l6	! %l6 = fbba5f73f81c6679
!	Registers modified during the branch to p1_call_1
!	%l0  = fffffa72ac1b7fd5
!	%l1  = 0000000000000031
	bneg,a	p1_b16			! Branch Taken, %ccr = 0a, CWP = 0
!	%l2 = ffffffff8fd9c3ad, Mem[0000000014000008] = 6b07f53d
	stwa	%l2,[%i0+%o6]0x80	! Mem[0000000014000008] = 8fd9c3ad
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x010,%g2
p1_b16:
	membar	#Sync			! Added by membar checker (193)
!	Mem[0000000015800060] = 71908522, %l4 = fffffa72dc3d487a
	lduha	[%i3+0x062]%asi,%l4	! %l4 = 0000000000008522
!	%l5 = ffffe95200801901, immed = 000000dd, %l0 = fffffa72ac1b7fd5
	taddcc	%l5,0x0dd,%l0		! %l0 = ffffe952008019de, %ccr = 82

p1_label_15:
!	%f14 = 97706a2c, %f24 = 97ce0f0c, %f26 = 74b839c0
	fsubs	%f14,%f24,%f26		! %f26 = 172bb3ec
!	%l2 = ffffffff8fd9c3ad, Mem[0000000016800056] = 92025256
	sth	%l2,[%i5+0x056]		! Mem[0000000016800054] = 9202c3ad
	fbne,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000014000000] = 544bdf45, %l5 = ffffe95200801901
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000054
p1_b17:
	membar	#Sync			! Added by membar checker (194)
!	%f30 = 2f94aef4 4e2c7d55, %f0  = 00000000 00000000, %f0  = 00000000 00000000
	faddd	%f30,%f0 ,%f0 		! %f0  = 2f94aef4 4e2c7d55

p1_label_16:
!	%l4 = 0000000000008522, %l6 = fbba5f73f81c6679, %l7 = 0000000000000061
	addc	%l4,%l6,%l7		! %l7 = fbba5f73f81ceb9b
	bg	p1_not_taken_0		! Branch Not Taken, %ccr = 82
!	Mem[0000000015000000] = bd703842 deae7eea, %l2 = 8fd9c3ad, %l3 = 702637af
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 00000000bd703842 00000000deae7eea
p1_b18:
	membar	#Sync			! Added by membar checker (195)
!	%l2 = 00000000bd703842, immed = ffffff48, %l0 = ffffe952008019de
	addccc	%l2,-0x0b8,%l0		! %l0 = 00000000bd70378a, %ccr = 19
	ba,a	p1_b19			! Branch Taken, %ccr = 19, CWP = 0

p1_label_17:
!	%l0 = 00000000bd70378a, Mem[0000000030000014] = b8920682
	stw	%l0,[%o0+0x014]		! Annulled
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x013,%g2
p1_b19:
	membar	#Sync			! Added by membar checker (196)
!	Mem[0000000015000008] = be301196, %l2 = 00000000bd703842
	lduba	[%i2+%o6]0x80,%l2	! %l2 = 00000000000000be
!	%f16 = 850e9908, %f14 = 97706a2c
	fcmpes	%fcc3,%f16,%f14		! %fcc3 = 2
!	%l2 = 00000000000000be, Mem[0000000015000000] = bd703842
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000015000000] = 00be3842
	set	p1_b20,%o7
	fbuge,pt %fcc2,p1_near_0_he	! Branch Taken, %fcc2 = 0

p1_label_18:
!	Mem[0000000030000050] = 8e1e150c, %l6 = fbba5f73f81c6679
	ldsw	[%o0+0x050],%l6		! %l6 = ffffffff8e1e150c
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x014,%g2
p1_b20:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000000000000
!	%l1  = ffffff85aa509be4
!	%l3  = ffffffff21518115
!	%l4  = 0000000000008102
	membar	#Sync			! Added by membar checker (197)
!	%l7 = fbba5f73f81ceb9b, %l5 = 0000000000000054, %y  = ffffff85
	udiv	%l7,%l5,%l4		! %l4 = 00000000ffffffff
	set	p1_b21,%o7
	fbue,pt	%fcc2,p1_near_1_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000015000048] = 4fef92bb, %l7 = fbba5f73f81ceb9b
	swap	[%i2+0x048],%l7		! %l7 = 000000004fef92bb
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x015,%g2
p1_b21:
!	Registers modified during the branch to p1_near_1
!	%l0  = fffffffffffff763
!	%l1  = 000000008e0e1408
!	%l3  = 0000000000000000
!	%l4  = 00000000deae7eea
!	%l6  = 000000008e0e1d55
	membar	#Sync			! Added by membar checker (198)
!	Mem[0000000031000058] = 1c04d06b, %l1 = 000000008e0e1408
	lduh	[%o2+0x05a],%l1		! %l1 = 000000000000d06b

p1_label_19:
!	Mem[0000000015800068] = 921a40bb, %l3 = 0000000000000000
	ldsba	[%i3+0x06b]%asi,%l3	! %l3 = ffffffffffffffbb
!	Mem[0000000015000120] = b581b50d fa9eb8e0 7b37fa95 36b3370a
	prefetch [%i2+0x120],3
!	%l0 = fffffffffffff763, %l0 = fffffffffffff763, %l5 = 0000000000000054
	srl	%l0,%l0,%l5		! %l5 = 000000001ffffeec
	set	p1_b22,%o7
	fble,pn	%fcc0,p1_near_0_le	! Branch Taken, %fcc0 = 1
!	Mem[000000003080001f] = 621e21aa, %l3 = ffffffffffffffbb
	ldstub	[%o1+0x01f],%l3		! %l3 = 00000000000000aa
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x016,%g2
p1_b22:
!	Registers modified during the branch to p1_near_0
!	%l5  = 000000004fef9b49

p1_label_20:
	membar	#Sync			! Added by membar checker (199)
!	%l6 = 000000008e0e1d55, %l5 = 000000004fef9b49, %y  = ffffff85
	umul	%l6,%l5,%l4		! %l4 = 2c5b5065ab23d43d
!	%f20 = 06ab07d2 87560a05, %f20 = 06ab07d2 87560a05, %f2  = 0978db9c ec91adf4
	fdivd	%f20,%f20,%f2 		! %f2  = 3ff00000 00000000
!	Mem[0000000015000008] = be301196, %l7 = 000000004fef92bb
	swapa	[%i2+%o6]0x80,%l7	! %l7 = 00000000be301196
!	%l5 = 000000004fef9b49, immed = 00000ffc, %l7 = 00000000be301196
	andncc	%l5,0xffc,%l7		! %l7 = 000000004fef9001, %ccr = 00
	set	p1_b23,%o7
	fble	p1_far_1_le	! Branch Taken, %fcc0 = 1

p1_label_21:
!	%l7 = 000000004fef9001, Mem[0000000015800108] = b27a9c75e46774d1
	stx	%l7,[%i3+0x108]		! Mem[0000000015800108] = 000000004fef9001
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x017,%g2
p1_b23:
!	Registers modified during the branch to p1_far_1
!	%l1  = 00000000005de2aa
!	%l3  = 00000000000009ae
!	%l5  = 0000000000000000
!	%l6  = 0000000000000801
	membar	#Sync			! Added by membar checker (200)
!	%f6  = ec91adf4 f8a2b748, %f6  = ec91adf4 f8a2b748, %f18 = b9eddb85 17a25616
	faddd	%f6 ,%f6 ,%f18		! %f18 = eca1adf4 f8a2b748
!	call to call_1, CWP = 0
	call	p1_call_1_he
!	Mem[0000000015800140] = 4f73449f 4442675f cce7c68f 56aa273b
	prefetch [%i3+0x140],2
!	Registers modified during the branch to p1_call_1
!	%l0  = 2c5b5065ab23dd93
!	%l1  = 0000000000000031
!	Mem[0000000030800054] = 6f3c014b, %l3 = 00000000000009ae
	ldstuba	[%o1+0x054]%asi,%l3	! %l3 = 000000000000006f

p1_label_22:
	ble,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000015800040] = efdb6e3f, %l3 = 000000000000006f
	ldsw	[%i3+0x040],%l3		! Annulled
p1_b24:
	membar	#Sync			! Added by membar checker (201)
!	Mem[00000000150000c1] = 81c0b3c3, %l3 = 000000000000006f
	ldstuba	[%i2+0x0c1]%asi,%l3	! %l3 = 00000000000000c0
!	Mem[00000000150000a0] = 4c5cf67d, %l7 = 000000004fef9001
	swap	[%i2+0x0a0],%l7		! %l7 = 000000004c5cf67d
!	Mem[0000000015800060] = 71908522 e057ea31 921a40bb d7db1079
	prefetcha [%i3+0x060]%asi,3

p1_label_23:
	set	p1_b25,%o7
	fbg,pn	%fcc3,p1_near_2_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000014000117] = 3be9a81b, %l7 = 000000004c5cf67d
	ldstub	[%i0+0x117],%l7		! %l7 = 000000000000001b
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x019,%g2
p1_b25:
!	Registers modified during the branch to p1_near_2
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (202)
!	%l0 = 2c5b5065ab23dd93, %l6 = 0000000000000801, %y  = 00000000
	sdivcc	%l0,%l6,%l0		! %l0 = 00000000001561cf, %ccr = 00
!	%f8  = 00000000 00000001, %f16 = 850e9908 6d482ee0
	fxtod	%f8 ,%f16		! %f16 = 3ff00000 00000000
	bvc	p1_b26			! Branch Taken, %ccr = 00, CWP = 0

p1_label_24:
!	Mem[0000000014000008] = 8fd9c3ad, %l1 = 0000000000000031
	lduha	[%i0+%o6]0x80,%l1	! %l1 = 0000000000008fd9
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x01a,%g2
p1_b26:
	membar	#Sync			! Added by membar checker (203)
!	%l7 = 000000000000001b
	setx	0xa90b7e26a90b7e26,%g7,%l7 ! %l7 = a90b7e26a90b7e26
!	Mem[0000000015000008] = 4fef92bb, %l0 = 00000000001561cf
	ldstuba	[%i2+%o6]0x80,%l0	! %l0 = 000000000000004f
	ble,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l3 = 00000000000000c0, Mem[0000000030000058] = 896a6157ead8cdab
	stx	%l3,[%o0+0x058]		! Annulled
p1_b27:

p1_label_25:
	membar	#Sync			! Added by membar checker (204)
!	%l4 = 2c5b5065ab23d43d, Mem[0000000015000138] = b2b05435ff21b6e0
	stxa	%l4,[%i2+0x138]%asi	! Mem[0000000015000138] = 2c5b5065ab23d43d
!	%f10 = c463c699 c32f3f4f, %f28 = 059b6f10 3f800000
	fabsd	%f10,%f28		! %f28 = 4463c699 c32f3f4f
	nop
!	%l7 = a90b7e26a90b7e26, Mem[0000000031000052] = 4c227bd7
	stba	%l7,[%o2+0x052]%asi	! Mem[0000000031000050] = 4c2226d7
!	Mem[0000000015000160] = 93de5143 09d7df4a 1bb2c463 81bfef5c
	prefetcha [%i2+0x160]%asi,21

p1_label_26:
	fbul,a,pt %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[00000000158000f4] = 16e2dadd, %l3 = 00000000000000c0
	lduw	[%i3+0x0f4],%l3		! Annulled
p1_b28:
	membar	#Sync			! Added by membar checker (205)
!	%l1 = 0000000000008fd9, immed = 00000038, %l4 = 2c5b5065ab23d43d
	sllx	%l1,0x038,%l4		! %l4 = d900000000000000
!	%f8  = 00000000 00000001, %f26 = 172bb3ec
	fxtos	%f8 ,%f26		! %f26 = 3f800000
!	%l2 = 0000000000000000, %l1 = 0000000000008fd9, %l7 = a90b7e26a90b7e26
	sll	%l2,%l1,%l7		! %l7 = 0000000000000000

p1_label_27:
!	Mem[0000000030000050] = 8e1e150c e06cc8cf, %l2 = 00000000, %l3 = 000000c0
	ldda	[%o0+0x050]%asi,%l2	! %l2 = 000000008e1e150c 00000000e06cc8cf
!	%f29 = c32f3f4f, %f16 = 3ff00000
	fabss	%f29,%f16		! %f16 = 432f3f4f
	set	p1_b29,%o7
	fbne	p1_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],23
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x01d,%g2
p1_b29:
	membar	#Sync			! Added by membar checker (206)
!	%f1  = 4e2c7d55, %f8  = 00000000, %f5  = 05284518
	fadds	%f1 ,%f8 ,%f5 		! %f5  = 4e2c7d55

p1_label_28:
!	%l5 = 0000000000000000, immed = fffffe71, %l2 = 000000008e1e150c
	tsubcc	%l5,-0x18f,%l2		! %l2 = 000000000000018f, %ccr = 13
!	%l5 = 0000000000000000, immed = 00000219, %l7 = 0000000000000000
	xorcc	%l5,0x219,%l7		! %l7 = 0000000000000219, %ccr = 00
!	%l1 = 0000000000008fd9, %l2 = 000000000000018f, %l1 = 0000000000008fd9
	addccc	%l1,%l2,%l1		! %l1 = 0000000000009168, %ccr = 00
!	%l3 = 00000000e06cc8cf, immed = fffff709, %y  = 00000000
	umulcc	%l3,-0x8f7,%l3		! %l3 = e06cc0f310c3c847, %ccr = 80
	fbe,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2

p1_label_29:
!	Mem[0000000015000040] = a50ee9fc 9bf6a520 f81ceb9b a22363e7
	prefetch [%i2+0x040],20
p1_b30:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000040000019] = 1e37250f, %l5 = 0000000000000000
	ldstub	[%o5+0x019],%l5		! Annulled
p1_b31:
	membar	#Sync			! Added by membar checker (207)
!	%f8  = 00000000, %f4  = a7cf71ad 4e2c7d55
	fstod	%f8 ,%f4 		! %f4  = 00000000 00000000
!	%l2 = 000000000000018f, %l1 = 0000000000009168, %y  = e06cc0f3
	udivx	%l2,%l1,%l4		! %l4 = 0000000000000000

p1_label_30:
!	%f4  = 00000000 00000000, %f31 = 4e2c7d55
	fdtoi	%f4 ,%f31		! %f31 = 00000000
	set	p1_b32,%o7
	fbo,a,pt %fcc2,p1_near_1_le	! Branch Taken, %fcc2 = 0
!	%l2 = 000000000000018f, Mem[0000000031000018] = 5bdd4955cbe5a46a
	stx	%l2,[%o2+0x018]		! Mem[0000000031000018] = 000000000000018f
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x020,%g2
p1_b32:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000009168
!	%l2  = 000000007fffffff
!	%l7  = 0000000000000801
	membar	#Sync			! Added by membar checker (208)
!	%l3 = e06cc0f310c3c847, %l7 = 0000000000000801, %y  = e06cc0f3
	sdivx	%l3,%l7,%l6		! %l6 = fffc0e165b96a5a5
!	%l1 = 0000000000009168, immed = 00000c7d, %l0 = 0000000000009168
	sub	%l1,0xc7d,%l0		! %l0 = 00000000000084eb

p1_label_31:
	set	p1_b33,%o7
	fbg,pt	%fcc3,p1_near_1_he	! Branch Taken, %fcc3 = 2
!	Mem[0000000015000000] = 00be3842, %l0 = 00000000000084eb
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000be
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x021,%g2
p1_b33:
!	Registers modified during the branch to p1_near_1
!	%l0  = ffffffff80000822
!	%l1  = 1f900e044b1425a0
!	%l3  = 0000000000000000
!	%l4  = 1f933f0cef3c3706
!	%l6  = 1f900e044b142cfd
	membar	#Sync			! Added by membar checker (209)
!	%l6 = 1f900e044b142cfd
	sethi	%hi(0x889e1400),%l6	! %l6 = 00000000889e1400
	fbug	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = 0000000000000801, Mem[0000000015800008] = 216cf49d
	stwa	%l7,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000801
p1_b34:

p1_label_32:
	membar	#Sync			! Added by membar checker (210)
!	%l1 = 1f900e044b1425a0, immed = 00000006, %l3 = 0000000000000000
	sra	%l1,0x006,%l3		! %l3 = 00000000012c5096
!	%f30 = 2f94aef4, %f28 = 4463c699 c32f3f4f
	fitod	%f30,%f28		! %f28 = 41c7ca57 7a000000
!	%f29 = 7a000000, %f29 = 7a000000, %f13 = 722732c3
	fdivs	%f29,%f29,%f13		! %f13 = 3f800000
!	Branch On Register, %l3 = 00000000012c5096
	brnz,a,pt %l3,p1_b35		! Branch Taken
!	%l2 = 000000007fffffff, Mem[0000000015800000] = b321afbc
	stba	%l2,[%i3+%g0]0x80	! Mem[0000000015800000] = ff21afbc
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x023,%g2
p1_b35:

p1_label_33:
	membar	#Sync			! Added by membar checker (211)
!	Mem[0000000015800000] = ff21afbc 77805240 00000801 03a1ddc6
	prefetch [%i3+0x000],23
!	%l3 = 00000000012c5096, %l0 = ffffffff80000822, %l5 = 0000000000000000
	subccc	%l3,%l0,%l5		! %l5 = 00000000812c4874, %ccr = 1b
!	%f10 = c463c699 c32f3f4f, %f26 = 3f800000 2900bf4a
	fcmped	%fcc0,%f10,%f26		! %fcc0 = 1
!	%f18 = eca1adf4 f8a2b748, %f24 = 97ce0f0c 9432e52e
	fmovd	%f18,%f24		! %f24 = eca1adf4 f8a2b748
!	Mem[0000000031800059] = bc6c82bf, %l2 = 000000007fffffff
	ldstuba	[%o3+0x059]%asi,%l2	! %l2 = 000000000000006c

p1_label_34:
!	%l0 = ffffffff80000822, immed = 00000468, %l5 = 00000000812c4874
	addcc	%l0,0x468,%l5		! %l5 = ffffffff80000c8a, %ccr = 88
!	Branch On Register, %l4 = 1f933f0cef3c3706
	brz,pn	%l4,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014800000] = fbba5f73, %l0 = ffffffff80000822
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = fffffffffbba5f73
p1_b36:
	membar	#Sync			! Added by membar checker (212)
!	%f2  = 3ff00000 00000000, %f2  = 3ff00000 00000000, %f28 = 41c7ca57 7a000000
	faddd	%f2 ,%f2 ,%f28		! %f28 = 40000000 00000000
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1

p1_label_35:
!	Mem[0000000030800018] = 08685f2e, %l5 = ffffffff80000c8a
	ldsw	[%o1+0x018],%l5		! Annulled
p1_b37:
	membar	#Sync			! Added by membar checker (213)
!	%l1 = 1f900e044b1425a0, %l6 = 00000000889e1400, %y  = e06cc0f3
	umul	%l1,%l6,%l7		! %l7 = 28111049cbb08000
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000015000000] = 00be3842, %l4 = 1f933f0cef3c3706
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000be3842
p1_b38:
	set	p1_b39,%o7
	fbul,a	p1_far_2_le	! Branch Taken, %fcc0 = 1

p1_label_36:
!	Mem[0000000015000000] = ef3c3706, %l4 = 0000000000be3842
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000ef3c
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x027,%g2
p1_b39:
!	Registers modified during the branch to p1_far_2
!	%l0  = ffffffff7bba6bfd
!	%l2  = 00000000889e1640
!	%l4  = 000000002811115e
	membar	#Sync			! Added by membar checker (214)
	fbu,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l4 = 000000002811115e, Mem[0000000014000120] = 17a72703
	stw	%l4,[%i0+0x120]		! Mem[0000000014000120] = 2811115e
p1_b40:
	membar	#Sync			! Added by membar checker (215)
!	Mem[00000000148000e0] = e2a5fd59 c876dc4f 660d7b69 797803d6
	prefetcha [%i1+0x0e0]%asi,23
	fbe,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2

p1_label_37:
!	Mem[00000000140000c0] = 62b360c3 234923c9 8e0b15d9 d9ee7693
	prefetch [%i0+0x0c0],4
p1_b41:
	membar	#Sync			! Added by membar checker (216)
!	Mem[0000000014800008] = 305d164e8d8842a2, %l3 = 00000000012c5096
	ldxa	[%i1+%o6]0x80,%l3	! %l3 = 305d164e8d8842a2
	set	p1_b42,%o7
	fbule	p1_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000031800015] = 6da6eba8, %l4 = 000000002811115e
	ldstub	[%o3+0x015],%l4		! %l4 = 00000000000000a6
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x02a,%g2
p1_b42:
!	Registers modified during the branch to p1_far_2
!	%l0  = fffffffefbba7887
!	%l2  = 00000000889e1640
!	%l4  = 000000002811115e
	membar	#Sync			! Added by membar checker (217)
!	%l7 = 28111049cbb08000, Mem[0000000032000068] = 6a5f407e
	stwa	%l7,[%o4+0x068]%asi	! Mem[0000000032000068] = cbb08000

p1_label_38:
	fbuge,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000014000008] = 8fd9c3ad48036d8f, %l7 = 28111049cbb08000
	ldxa	[%i0+%o6]0x80,%l7	! Annulled
p1_b43:
	membar	#Sync			! Added by membar checker (218)
!	%f13 = 3f800000, %f14 = 97706a2c 17ce0f0c
	fstox	%f13,%f14		! %f14 = 00000000 00000001
!	%l1 = 1f900e044b1425a0, immed = 00000e38, %l4 = 000000002811115e
	andcc	%l1,0xe38,%l4		! %l4 = 0000000000000420, %ccr = 00
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_39:
!	Mem[0000000015000180] = 360e2322 263f6940 17b974fb fe96b574
	prefetch [%i2+0x180],20	! Annulled
p1_b44:
	membar	#Sync			! Added by membar checker (219)
	fbg,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l3 = 305d164e8d8842a2, Mem[0000000014800008] = 305d164e
	stba	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = a25d164e
p1_b45:
	membar	#Sync			! Added by membar checker (220)
!	Mem[0000000014800008] = a25d164e, %l2 = 00000000889e1640
	lduba	[%i1+%o6]0x80,%l2	! %l2 = 00000000000000a2
	set	p1_b46,%o7
	fblg,a	p1_far_1_le	! Branch Taken, %fcc0 = 1

p1_label_40:
!	Mem[0000000014800008] = a25d164e, %l0 = fffffffefbba7887
	ldstuba	[%i1+%o6]0x80,%l0	! %l0 = 00000000000000a2
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x02e,%g2
p1_b46:
!	Registers modified during the branch to p1_far_1
!	%l1  = 0000055cc0f5bb12
!	%l3  = 305d164e8d884ba6
!	%l5  = 000000003fffffff
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (221)
!	Mem[0000000031800051] = a8b2081d, %l5 = 000000003fffffff
	ldstub	[%o3+0x051],%l5		! %l5 = 00000000000000b2
!	Branch On Register, %l1 = 0000055cc0f5bb12
	brgez,a,pn %l1,p1_b47		! Branch Taken
!	Mem[0000000015800028] = 81f8af23e3fbc38e, %l0 = 00000000000000a2
	ldx	[%i3+0x028],%l0		! %l0 = 81f8af23e3fbc38e
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x02f,%g2
p1_b47:
	membar	#Sync			! Added by membar checker (222)
!	Mem[0000000031800050] = a8ff081d, %l3 = 305d164e8d884ba6
	ldstuba	[%o3+0x050]%asi,%l3	! %l3 = 00000000000000a8

p1_label_41:
!	Mem[00000000140000c0] = 62b360c3234923c9, %l4 = 0000000000000420
	ldx	[%i0+0x0c0],%l4		! %l4 = 62b360c3234923c9
!	%f14 = 00000000, %f11 = c32f3f4f
	fmovs	%f14,%f11		! %f11 = 00000000
!	Mem[0000000014000008] = 8fd9c3ad, %l5 = 00000000000000b2
	ldsha	[%i0+%o6]0x80,%l5	! %l5 = ffffffffffff8fd9
!	Mem[0000000032000060] = be38db17 ddc4e6bc cbb08000 79d4a921
	prefetcha [%o4+0x060]%asi,1
!	%l7 = 28111049cbb08000, immed = fffff7ef, %l7 = 28111049cbb08000
	tsubcc	%l7,-0x811,%l7		! %l7 = 28111049cbb08811, %ccr = 1b

p1_label_42:
!	Mem[000000003200001c] = b2b4420d, %l3 = 00000000000000a8
	ldsb	[%o4+0x01d],%g2		! %g2 = ffffffffffffffb2
!	%f5  = 00000000, %f5  = 00000000
	fcmpes	%fcc0,%f5 ,%f5 		! %fcc0 = 0
!	Mem[0000000014800120] = 5990874c 6a8afdbe 91388abb 5d219940
	prefetcha [%i1+0x120]%asi,23
!	Mem[0000000032000050] = b23d4e8d 2dda7a06, %l0 = e3fbc38e, %l1 = c0f5bb12
	ldda	[%o4+0x050]%asi,%g2	! %l0 = 81f8af23e3fbc38e 0000055cc0f5bb12
!	%f31 = 00000000, %f10 = c463c699 00000000
	fstox	%f31,%f10		! %f10 = 00000000 00000000

p1_label_43:
!	%f4  = 00000000 00000000, %f12 = 67970789 3f800000, %f18 = eca1adf4 f8a2b748
	fdivd	%f4 ,%f12,%f18		! %f18 = 00000000 00000000
!	Mem[0000000015800008] = 00000801, %l5 = ffffffffffff8fd9
	lduwa	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000801
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000050] = 8e1e150ce06cc8cf, %l0 = 81f8af23e3fbc38e
	ldx	[%o0+0x050],%l0		! %l0 = 8e1e150ce06cc8cf
p1_b48:
	membar	#Sync			! Added by membar checker (223)
!	%l2 = 000000a2, %l3 = 000000a8, Mem[0000000030000018] = d3fd4354 b04623af
	std	%l2,[%o0+0x018]	! Mem[0000000030000018] = 000000a2 000000a8

p1_label_44:
!	%f22 = bb9b461b, %f8  = 00000000 00000001
	fitod	%f22,%f8 		! %f8  = c1d1192e 79400000
!	%l4 = 62b360c3234923c9, %l0 = 8e1e150ce06cc8cf, %l7 = 28111049cbb08811
	orcc	%l4,%l0,%l7		! %l7 = eebf75cfe36debcf, %ccr = 88
!	%f19 = 00000000, %f4  = 00000000
	fstoi	%f19,%f4 		! %f4  = 00000000
!	%f8  = c1d1192e 79400000, %f12 = 67970789 3f800000
	fdtox	%f8 ,%f12		! %f12 = ffffffff bb9b461b
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_45:
!	%l0 = 8e1e150ce06cc8cf, Mem[0000000015000040] = a50ee9fc9bf6a520
	stx	%l0,[%i2+0x040]		! Annulled
p1_b49:
	membar	#Sync			! Added by membar checker (224)
!	%f11 = 00000000, %f16 = 432f3f4f
	fstoi	%f11,%f16		! %f16 = 00000000
!	Mem[0000000014800000] = fbba5f73, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000fb
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000020] = bbb8a12c 09ebbe55 0bacc5ef 65091a0a
	prefetch [%i2+0x020],2
p1_b50:

p1_label_46:
	membar	#Sync			! Added by membar checker (225)
!	Mem[0000000031000010] = bbb8a12c 09ebbe55, %l0 = 8e1e150ce06cc8cf, %l2 = 00000000000000a2
	add	%o2,0x10,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = 1f3d76649dda1af3
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 000000fb, %l7 = e36debcf, Mem[0000000030000010] = 8a14c5ae b8920682
	std	%l6,[%o0+0x010]	! Annulled
p1_b51:
	bl	p1_b52			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000014000180] = 736dc5d1, %l6 = 00000000000000fb
	ldsw	[%i0+0x180],%l6		! %l6 = 00000000736dc5d1
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x034,%g2
p1_b52:

p1_label_47:
	set	p1_b53,%o7
	fbge,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014800000] = ffba5f73 f81c6679 ff5d164e 8d8842a2
	prefetch [%i1+0x000],0
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x035,%g2
p1_b53:
!	Registers modified during the branch to p1_far_2
!	%l0  = 8e1e150ce06cd0d0
!	%l2  = 00000000736dc791
!	%l4  = 000000000000055c
	membar	#Sync			! Added by membar checker (226)
!	%f2  = 3ff00000 00000000, %f12 = ffffffff
	fdtos	%f2 ,%f12		! %f12 = 3f800000
!	Mem[000000003180005c] = 5b20d8f7, %l6 = 00000000736dc5d1
	ldswa	[%o3+0x05c]%asi,%l6	! %l6 = 000000005b20d8f7
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],23

p1_label_48:
!	Branch On Register, %l1 = 0000055cc0f5bb12
	brgez,pn %l1,p1_b54		! Branch Taken
!	Mem[0000000030800054] = ff3c014b, %l7 = eebf75cfe36debcf
	lduw	[%o1+0x054],%l7		! %l7 = 00000000ff3c014b
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x036,%g2
p1_b54:
	membar	#Sync			! Added by membar checker (227)
!	Mem[0000000014000120] = 2811115e 8c804956 f9b2d5b0 62b8de5d
	prefetch [%i0+0x120],22
!	Mem[0000000031000018] = 000000000000018f, %l5 = 0000000000000801
	ldx	[%o2+0x018],%l5		! %l5 = 000000000000018f
!	%l3 = 00000000000000a8
	sethi	%hi(0x50de9400),%l3	! %l3 = 0000000050de9400

p1_label_49:
!	%l1 = 0000055cc0f5bb12, Mem[000000003200002a] = fd1bd705
	stba	%l1,[%o4+0x02a]%asi	! Mem[0000000032000028] = 121bd705
!	%f2  = 3ff00000 00000000, %f20 = 06ab07d2 87560a05
	fcmpd	%fcc3,%f2 ,%f20		! %fcc3 = 2
!	Mem[0000000014000000] = ff4bdf45, %l7 = 00000000ff3c014b
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
	set	p1_b55,%o7
	fble,pn	%fcc0,p1_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000000] = ff4bdf45, %l5 = 000000000000018f
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 000000000000ff4b
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x037,%g2
p1_b55:
!	Registers modified during the branch to p1_near_3
!	%l5  = 00000000000c5ce8

p1_label_50:
!	call to call_1, CWP = 0
	call	p1_call_1_he
!	Mem[0000000031800010] = d5eff6ae, %l1 = 0000055cc0f5bb12
	ldsw	[%o3+0x010],%l1		! %l1 = ffffffffd5eff6ae
!	Registers modified during the branch to p1_call_1
!	%l0  = 0000000050de915c
!	%l1  = 0000000000000031
	membar	#Sync			! Added by membar checker (228)
!	%l7 = 00000000000000ff, %l5 = 00000000000c5ce8, %l3 = 0000000050de9400
	orn	%l7,%l5,%l3		! %l3 = fffffffffff3a3ff
	bg	p1_b56			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000003000005c] = ead8cdab, %l5 = 00000000000c5ce8
	ldsh	[%o0+0x05e],%l5		! %l5 = ffffffffffffcdab
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x038,%g2
p1_b56:

p1_label_51:
	membar	#Sync			! Added by membar checker (229)
!	%l2 = 00000000736dc791, %l2 = 00000000736dc791, %y  = 0000055c
	sdivx	%l2,%l2,%l0		! %l0 = 0000000000000001
!	%l5 = ffffffffffffcdab, %l0 = 0000000000000001, %l0 = 0000000000000001
	addc	%l5,%l0,%l0		! %l0 = ffffffffffffcdac
!	%f6  = ec91adf4, %f26 = 3f800000
	fmovs	%f6 ,%f26		! %f26 = ec91adf4
!	%f25 = f8a2b748, %f6  = ec91adf4 f8a2b748
	fstod	%f25,%f6 		! %f6  = c71456e9 00000000
	set	p1_b57,%o7
	fbule,a	p1_far_3_he	! Branch Taken, %fcc0 = 0

p1_label_52:
!	Mem[0000000014000000] = ff4bdf45, %l6 = 000000005b20d8f7
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x039,%g2
p1_b57:
!	Registers modified during the branch to p1_far_3
!	%l6  = ffffffffffffd101
	membar	#Sync			! Added by membar checker (230)
!	Mem[0000000032000008] = e83b01bf5e0357b7, %l4 = 000000000000055c
	ldxa	[%o4+0x008]%asi,%g2	! %g2 = e83b01bf5e0357b7
!	%l5 = ffffffffffffcdab, %l5 = ffffffffffffcdab, %y  = 0000055c
	udivcc	%l5,%l5,%l1		! %l1 = 000000000000055d, %ccr = 00
!	%l5 = ffffffffffffcdab, %l2 = 00000000736dc791, %l1 = 000000000000055d
	xnorcc	%l5,%l2,%l1		! %l1 = 00000000736df5c5, %ccr = 00
!	%f14 = 00000000, %f4  = 00000000, %f28 = 40000000
	fsubs	%f14,%f4 ,%f28		! %f28 = 00000000

p1_label_53:
!	%l6 = ffffd101, %l7 = 000000ff, Mem[0000000014800038] = bb3e8513 666fb983
	stda	%l6,[%i1+0x038]%asi	! Mem[0000000014800038] = ffffd101 000000ff
	bl,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000032000060] = be38db17 ddc4e6bc cbb08000 79d4a921
	prefetch [%o4+0x060],20	! Annulled
p1_b58:
	membar	#Sync			! Added by membar checker (231)
!	%l4 = 000000000000055c, immed = 00000000, %l1 = 00000000736df5c5
	srax	%l4,0x000,%l1		! %l1 = 000000000000055c
!	Mem[00000000150000f8] = 05731fa70a654394, %l5 = ffffffffffffcdab
	ldxa	[%i2+0x0f8]%asi,%l5	! %l5 = 05731fa70a654394

p1_label_54:
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000030800010] = 7daa35b8, %l2 = 00000000736dc791
	ldsh	[%o1+0x012],%l2		! %l2 = 00000000000035b8
p1_b59:
	set	p1_b60,%o7
	fble	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l5 = 05731fa70a654394, Mem[0000000014000008] = 8fd9c3ad
	stwa	%l5,[%i0+%o6]0x80	! Mem[0000000014000008] = 0a654394
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x03c,%g2
p1_b60:
!	Registers modified during the branch to p1_far_2
!	%l0  = 05731fa70a651140
!	%l2  = ffffffffffffd341
!	%l4  = 000000000000055c
	membar	#Sync			! Added by membar checker (232)
!	%l5 = 05731fa70a654394, immed = 00000012, %l4 = 000000000000055c
	sll	%l5,0x012,%l4		! %l4 = 7e9c29950e500000

p1_label_55:
	bgu,a	p1_b61			! Branch Taken, %ccr = 88, CWP = 0
!	%l6 = ffffd101, %l7 = 000000ff, Mem[0000000031800050] = ffff081d 7468b768
	std	%l6,[%o3+0x050]	! Mem[0000000031800050] = ffffd101 000000ff
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x03d,%g2
p1_b61:
	membar	#Sync			! Added by membar checker (233)
!	%l3 = fffffffffff3a3ff, immed = fffff344, %y  = 0000055c
	udivx	%l3,-0xcbc,%l5		! %l5 = 0000000000000000
!	%f4  = 00000000 00000000, %f4  = 00000000 00000000, %f24 = eca1adf4 f8a2b748
	faddd	%f4 ,%f4 ,%f24		! %f24 = 00000000 00000000
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_56:
!	Mem[0000000030000010] = 8a14c5ae, %l4 = 7e9c29950e500000
	ldsw	[%o0+0x010],%l4		! %l4 = ffffffff8a14c5ae
p1_b62:
	membar	#Sync			! Added by membar checker (234)
!	%l1 = 000000000000055c, Mem[0000000014800000] = ffba5f73
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000014800000] = 055c5f73
!	%f20 = 06ab07d2, %f14 = 00000000, %f10 = 00000000 00000000
	fsmuld	%f20,%f14,%f10		! %f10 = 00000000 00000000
	bvs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l6 = ffffffffffffd101, Mem[0000000031000014] = 9dda1af3
	stb	%l6,[%o2+0x014]		! Annulled
p1_b63:

p1_label_57:
	membar	#Sync			! Added by membar checker (235)
!	Mem[0000000014800008] = ff5d164e, %l7 = 00000000000000ff
	ldstuba	[%i1+%o6]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000031000018] = ff5d164e 000000ff, %l7 = 00000000000000ff, %l6 = ffffffffffffd101
	add	%o2,0x18,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 000000000000018f
!	%l5 = 0000000000000000, immed = 00000321, %y  = 0000055c
	smulcc	%l5,0x321,%l5		! %l5 = 0000000000000000, %ccr = 44
	set	p1_b64,%o7
	fble,a	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[000000003200000c] = 57b7c5e7, %l4 = ffffffff8a14c5ae
	ldsh	[%o4+0x00e],%g2		! %g2 = 00000000000057b7
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x040,%g2
p1_b64:

p1_label_58:
	membar	#Sync			! Added by membar checker (236)
!	%l2 = ffffd341, %l3 = fff3a3ff, Mem[0000000032000048] = 60739feb c1c67d6b
	stda	%l2,[%o4+0x048]%asi	! Mem[0000000032000048] = ffffd341 fff3a3ff
!	Branch On Register, %l7 = 00000000000000ff
	brnz,pt	%l7,p1_b65		! Branch Taken
!	Mem[0000000030000054] = e06cc8cf, %l1 = 000000000000055c
	ldsb	[%o0+0x056],%l1		! %l1 = ffffffffffffffc8
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x041,%g2
p1_b65:
	set	p1_b66,%o7
	fbe	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	%l2 = ffffffffffffd341, Mem[0000000015000008] = ffef92bb
	stwa	%l2,[%i2+%o6]0x80	! Mem[0000000015000008] = ffffd341
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x042,%g2
p1_b66:
!	Registers modified during the branch to p1_far_1
!	%l2  = ffffffffffffff14
!	%l5  = ffffffffffffffaf

p1_label_59:
	membar	#Sync			! Added by membar checker (237)
!	%l6 = 000000000000018f, immed = 00000413, %y  = 00000000
	umul	%l6,0x413,%l6		! %l6 = 000000000006599d
!	%l4 = ffffffff8a14c5ae
	sethi	%hi(0x5a1dd800),%l4	! %l4 = 000000005a1dd800
!	%l4 = 000000005a1dd800, %l1 = ffffffffffffffc8, %y  = 00000000
	sdiv	%l4,%l1,%l6		! %l6 = fffffffffe6409dc
!	Mem[0000000015000020] = bbb8a12c 09ebbe55 0bacc5ef 65091a0a
	prefetch [%i2+0x020],4
!	%l3 = fffffffffff3a3ff, %l5 = ffffffffffffffaf, %l0 = 05731fa70a651140
	taddcc	%l3,%l5,%l0		! %l0 = fffffffffff3a3ae, %ccr = 9b

p1_label_60:
!	Mem[0000000031000019] = 00000000, %l0 = fffffffffff3a3ae
	ldstuba	[%o2+0x019]%asi,%l0	! %l0 = 0000000000000000
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[0000000030800057] = ff3c014b, %l1 = ffffffffffffffc8
	ldstub	[%o1+0x057],%l1		! Annulled
p1_b67:
	membar	#Sync			! Added by membar checker (238)
!	Mem[00000000150000c0] = 81ffb3c3 44244e65 52dc35b7 64ac5427
	prefetch [%i2+0x0c0],21
!	Mem[0000000015800008] = 00000801, %l1 = ffffffffffffffc8
	ldsha	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000

p1_label_61:
!	Mem[0000000031800058] = bcff82bf5b20d8f7, %l6 = fffffffffe6409dc
	ldxa	[%o3+0x058]%asi,%l6	! %l6 = bcff82bf5b20d8f7
!	%f23 = de50e1a5, %f2  = 3ff00000 00000000
	fitod	%f23,%f2 		! %f2  = c1c0d78f 2d800000
	bvc,a	p1_not_taken_0		! Branch Not Taken, %ccr = 9b
!	%l5 = ffffffffffffffaf, Mem[0000000030800054] = ff3c014b
	stb	%l5,[%o1+0x054]		! Annulled
p1_b68:
	membar	#Sync			! Added by membar checker (239)
!	%f30 = 2f94aef4 00000000, %f2  = c1c0d78f 2d800000
	fcmped	%fcc0,%f30,%f2 		! %fcc0 = 2

p1_label_62:
!	%f24 = 00000000 00000000, %f6  = c71456e9 00000000, %f0  = 2f94aef4 4e2c7d55
	fdivd	%f24,%f6 ,%f0 		! %f0  = 80000000 00000000
!	%l0 = 0000000000000000, %l3 = fffffffffff3a3ff, %l7 = 00000000000000ff
	add	%l0,%l3,%l7		! %l7 = fffffffffff3a3ff
!	Mem[0000000014000118] = e04ff8b6, %l4 = 000000005a1dd800
	ldsh	[%i0+0x11a],%l4		! %l4 = fffffffffffff8b6
!	Mem[0000000015800014] = 4cf7cf5e, %l4 = fffffffffffff8b6
	ldswa	[%i3+0x014]%asi,%l4	! %l4 = 000000004cf7cf5e
	fbue,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2

p1_label_63:
!	%l1 = 0000000000000000, Mem[0000000031000010] = 1f3d76649dda1af3
	stx	%l1,[%o2+0x010]		! Annulled
p1_b69:
	membar	#Sync			! Added by membar checker (240)
!	%l1 = 0000000000000000
	setx	0x71c5778e71c5778e,%g7,%l1 ! %l1 = 71c5778e71c5778e
!	%l1 = 71c5778e71c5778e, Mem[00000000148001b4] = f603ceaf
	stha	%l1,[%i1+0x1b4]%asi	! Mem[00000000148001b4] = 778eceaf
!	%l1 = 71c5778e71c5778e, Mem[0000000031800050] = ffffd101000000ff
	stx	%l1,[%o3+0x050]		! Mem[0000000031800050] = 71c5778e71c5778e
!	Mem[0000000030800058] = 4a1b44ba, %l2 = ffffffffffffff14
	ldsb	[%o1+0x05a],%l2		! %l2 = 0000000000000044

p1_label_64:
!	Mem[00000000158001e0] = 5bd1fde3 a2053cb9 2c15bd25 0d976602
	prefetcha [%i3+0x1e0]%asi,1
!	%f12 = 3f800000, %f12 = 3f800000 bb9b461b
	fstox	%f12,%f12		! %f12 = 00000000 00000001
!	%l1 = 71c5778e71c5778e
	sethi	%hi(0x27147400),%l1	! %l1 = 0000000027147400
!	%f16 = 00000000 00000000, %f28 = 00000000 00000000
	fxtod	%f16,%f28		! %f28 = 00000000 00000000
!	Mem[0000000030800010] = 7daa35b8, %l5 = ffffffffffffffaf
	swapa	[%o1+0x010]%asi,%l5	! %l5 = 000000007daa35b8

p1_label_65:
!	%l1 = 0000000027147400, immed = 00000c00, %l0 = 0000000000000000
	xorcc	%l1,0xc00,%l0		! %l0 = 0000000027147800, %ccr = 00
	fblg,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000014000000] = ff4bdf45, %l1 = 0000000027147400
	ldsha	[%i0+%g0]0x80,%l1	! Annulled
p1_b70:
	membar	#Sync			! Added by membar checker (241)
!	%l3 = fffffffffff3a3ff, %l7 = fffffffffff3a3ff, %l2 = 0000000000000044
	xnorcc	%l3,%l7,%l2		! %l2 = ffffffffffffffff, %ccr = 88
!	%f2  = c1c0d78f, %f26 = ec91adf4
	fcmpes	%fcc2,%f2 ,%f26		! %fcc2 = 2

p1_label_66:
!	%l1 = 0000000027147400, Mem[0000000014000000] = ff4bdf4573e57553
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000014000000] = 0000000027147400
	fbue,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000014800000] = 055c5f73, %l5 = 000000007daa35b8
	lduba	[%i1+%g0]0x80,%l5	! Annulled
p1_b71:
	membar	#Sync			! Added by membar checker (242)
!	%l1 = 0000000027147400, %l4 = 000000004cf7cf5e, %y  = 00000000
	umulcc	%l1,%l4,%l4		! %l4 = 0bbfe6d3cf4e9800, %ccr = 08
	nop

p1_label_67:
!	%l2 = ffffffffffffffff, %l4 = 0bbfe6d3cf4e9800, %l2 = ffffffffffffffff
	orncc	%l2,%l4,%l2		! %l2 = ffffffffffffffff, %ccr = 88
!	%f24 = 00000000, %f25 = 00000000
	fstoi	%f24,%f25		! %f25 = 00000000
!	%f0  = 80000000, %f0  = 80000000
	fcmps	%fcc0,%f0 ,%f0 		! %fcc0 = 0
!	%l4 = 0bbfe6d3cf4e9800, Mem[0000000014800000] = 055c5f73
	stba	%l4,[%i1+0x000]%asi	! Mem[0000000014800000] = 005c5f73
	set	p1_b72,%o7
	fbug,a,pt %fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 2

p1_label_68:
!	Mem[00000000158001e0] = 5bd1fde3 a2053cb9 2c15bd25 0d976602
	prefetch [%i3+0x1e0],16
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x048,%g2
p1_b72:
!	Registers modified during the branch to p1_near_0
!	%l5  = fffffffffff3aa0d
	membar	#Sync			! Added by membar checker (243)
	set	p1_b73,%o7
	fbuge,a,pn %fcc0,p1_near_3_le	! Branch Taken, %fcc0 = 0
!	%l7 = fffffffffff3a3ff, Mem[0000000014800008] = ff5d164e8d8842a2
	stxa	%l7,[%i1+%o6]0x80	! Mem[0000000014800008] = fffffffffff3a3ff
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x049,%g2
p1_b73:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000686
	membar	#Sync			! Added by membar checker (244)
!	Mem[0000000015800078] = 00000000 00053cb9, %l1 = 0000000027147400, %l4 = 0bbfe6d3cf4e9800
	add	%i3,0x78,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = f4c9122f06890894
	bcc	p1_b74			! Branch Taken, %ccr = 00, CWP = 0

p1_label_69:
!	%l4 = f4c9122f06890894, Mem[0000000014000008] = 0a654394
	stba	%l4,[%i0+%o6]0x80	! Mem[0000000014000008] = 94654394
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x04a,%g2
p1_b74:
	membar	#Sync			! Added by membar checker (245)
!	Mem[00000000168001a0] = 3e9a3d4e e69adf12 7f674dfb cac48b5f
	prefetcha [%i5+0x1a0]%asi,23
!	%l5 = fffffffffff3aa0d, %l6 = bcff82bf5b20d8f7, %l5 = fffffffffff3aa0d
	subc	%l5,%l6,%l5		! %l5 = 43007d40a4d2d116
!	Mem[00000000150001d8] = 3b65ea7f e612d8d9, %l2 = 00000686, %l3 = fff3a3ff
	ldda	[%i2+0x1d8]%asi,%l2	! %l2 = 000000003b65ea7f 00000000e612d8d9
	bcc,a	p1_b75			! Branch Taken, %ccr = 00, CWP = 0

p1_label_70:
!	Mem[0000000015800010] = 65e48e23 4cf7cf5e, %l2 = 3b65ea7f, %l3 = e612d8d9
	ldd	[%i3+0x010],%l2		! %l2 = 0000000065e48e23 000000004cf7cf5e
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x04b,%g2
p1_b75:
	set	p1_b76,%o7
	fbue,a	p1_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000080] = ca8b9d81 345e33e1 665abc56 5a6c55cf
	prefetch [%i0+0x080],22
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x04c,%g2
p1_b76:
	membar	#Sync			! Added by membar checker (246)
!	%l0 = 0000000027147800, immed = fffffa44, %y  = 0bbfe6d3
	mulx	%l0,-0x5bc,%l3		! %l3 = ffffff1fe69fe000
!	%l3 = ffffff1fe69fe000, %l0 = 0000000027147800, %y  = 0bbfe6d3
	umul	%l3,%l0,%l4		! %l4 = 2334cbb871000000

p1_label_71:
!	Mem[0000000015800000] = ff21afbc, %l3 = ffffff1fe69fe000
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffffff
	set	p1_b77,%o7
	fbuge,a,pn %fcc3,p1_near_1_le	! Branch Taken, %fcc3 = 2
!	%l5 = 43007d40a4d2d116, Mem[0000000014000000] = 00000000
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000014000000] = d1160000
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x04d,%g2
p1_b77:
!	Registers modified during the branch to p1_near_1
!	%l0  = 2334cbb898147400
!	%l2  = ffffffff80000000
!	%l7  = e0344e77cc20d8f7
	membar	#Sync			! Added by membar checker (247)
!	%l5 = 43007d40a4d2d116, %l4 = 2334cbb871000000, %l5 = 43007d40a4d2d116
	addcc	%l5,%l4,%l5		! %l5 = 663548f915d2d116, %ccr = 01
!	Branch On Register, %l4 = 2334cbb871000000
	brlez,pn %l4,p1_not_taken_0	! Branch Not Taken

p1_label_72:
!	Mem[0000000015800008] = 00000801, %l1 = 0000000027147400
	ldsba	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000
p1_b78:
	membar	#Sync			! Added by membar checker (248)
!	%f27 = 2900bf4a, %f17 = 00000000
	fcmps	%fcc3,%f27,%f17		! %fcc3 = 2
!	%l7 = e0344e77cc20d8f7, immed = fffff8b0, %l6 = bcff82bf5b20d8f7
	addcc	%l7,-0x750,%l6		! %l6 = e0344e77cc20d1a7, %ccr = 99
!	Mem[0000000014000090] = 162b93fa, %l4 = 2334cbb871000000
	ldstuba	[%i0+0x090]%asi,%l4	! %l4 = 0000000000000016
!	%l0 = 2334cbb898147400, %l7 = e0344e77cc20d8f7, %y  = 2334cbb8
	sdivcc	%l0,%l7,%l6		! %l6 = ffffffff80000000, %ccr = 8a

p1_label_73:
!	Mem[0000000014800174] = 25226837, %l0 = 2334cbb898147400
	ldub	[%i1+0x174],%l0		! %l0 = 0000000000000025
!	%f4  = 00000000 00000000, %f24 = 00000000 00000000
	fxtod	%f4 ,%f24		! %f24 = 00000000 00000000
!	%l0 = 0000000000000025, %l0 = 0000000000000025, %l1 = 0000000000000000
	sll	%l0,%l0,%l1		! %l1 = 00000000000004a0
!	%l2 = ffffffff80000000, Mem[0000000032000070] = be58e266
	stw	%l2,[%o4+0x070]		! Mem[0000000032000070] = 80000000
!	%l7 = e0344e77cc20d8f7, %l4 = 0000000000000016, %l1 = 00000000000004a0
	orcc	%l7,%l4,%l1		! %l1 = e0344e77cc20d8f7, %ccr = 88

p1_label_74:
!	%f4  = 00000000 00000000, %f0  = 80000000 00000000
	fnegd	%f4 ,%f0 		! %f0  = 80000000 00000000
	bcs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l4 = 0000000000000016, Mem[0000000014800008] = ffffffff
	stba	%l4,[%i1+%o6]0x80	! Annulled
p1_b79:
	bpos,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l5 = 663548f915d2d116, Mem[0000000032000008] = e83b01bf5e0357b7
	stx	%l5,[%o4+0x008]		! Annulled
p1_b80:

p1_label_75:
	bge,a	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[00000000148001b7] = 778eceaf, %l2 = ffffffff80000000
	ldstub	[%i1+0x1b7],%l2		! Annulled
p1_b81:
	bvs	p1_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000031000010] = 1f3d7664, %l6 = ffffffff80000000
	lduh	[%o2+0x012],%l6		! %l6 = 0000000000007664
p1_b82:
	fbn,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_76:
!	Mem[0000000030000010] = 8a14c5ae, %l5 = 663548f915d2d116
	ldsb	[%o0+0x013],%l5		! Annulled
p1_b83:
	membar	#Sync			! Added by membar checker (249)
	set	p1_b84,%o7
	fble,a,pt %fcc0,p1_near_3_he	! Branch Taken, %fcc0 = 0
!	%l1 = e0344e77cc20d8f7, Mem[000000003080005d] = a303e431
	stb	%l1,[%o1+0x05d]		! Mem[000000003080005c] = a3f7e431
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x054,%g2
p1_b84:
!	Registers modified during the branch to p1_near_3
!	%l5  = 0000000000000010
	membar	#Sync			! Added by membar checker (250)
!	Branch On Register, %l0 = 0000000000000025
	brgez,pt %l0,p1_b85		! Branch Taken
!	Mem[0000000017000008] = dfafdef9, %l7 = e0344e77cc20d8f7
	ldsba	[%i6+%o6]0x80,%l7	! %l7 = ffffffffffffffdf
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x055,%g2
p1_b85:

p1_label_77:
	membar	#Sync			! Added by membar checker (251)
!	Branch On Register, %l5 = 0000000000000010
	brlz,pn	%l5,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000015000000] = ef3c3706, %l0 = 0000000000000025
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = ffffffffef3c3706
p1_b86:
	membar	#Sync			! Added by membar checker (252)
!	%l5 = 0000000000000010, Mem[0000000015000008] = ffffd341
	stha	%l5,[%i2+%o6]0x80	! Mem[0000000015000008] = 0010d341
!	Mem[0000000014800124] = 6a8afdbe, %l1 = e0344e77cc20d8f7
	lduw	[%i1+0x124],%l1		! %l1 = 000000006a8afdbe
!	%l5 = 0000000000000010, immed = 0000068b, %y  = 2334cbb8
	sdivcc	%l5,0x68b,%l1		! %l1 = 000000007fffffff, %ccr = 02

p1_label_78:
!	%f10 = 00000000, %f22 = bb9b461b de50e1a5
	fstox	%f10,%f22		! %f22 = 00000000 00000000
!	%l2 = ffffffff80000000, %l3 = ffffffffffffffff, %l5 = 0000000000000010
	xorcc	%l2,%l3,%l5		! %l5 = 000000007fffffff, %ccr = 00
!	%f30 = 2f94aef4, %f6  = c71456e9 00000000
	fitod	%f30,%f6 		! %f6  = 41c7ca57 7a000000
!	Mem[0000000014000000] = d1160000, %l0 = ffffffffef3c3706
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000d1160000
!	%l6 = 0000000000007664, immed = fffff527, %y  = 2334cbb8
	umulcc	%l6,-0xad9,%l2		! %l2 = 00007663fafbbd3c, %ccr = 08

p1_label_79:
	set	p1_b87,%o7
	fbuge,pt %fcc0,p1_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000008] = 94654394, %l6 = 0000000000007664
	ldsha	[%i0+%o6]0x80,%l6	! %l6 = ffffffffffff9465
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x057,%g2
p1_b87:
!	Registers modified during the branch to p1_near_3
!	%l5  = 0022baf24c3e67dc
	set	p1_b88,%o7
	fbuge	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	%l7 = ffffffffffffffdf, Mem[0000000014800008] = ffffffff
	stwa	%l7,[%i1+%o6]0x80	! Mem[0000000014800008] = ffffffdf
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x058,%g2
p1_b88:
!	Registers modified during the branch to p1_far_3
!	%l6  = 0022baf24c3e6b32
	membar	#Sync			! Added by membar checker (253)
!	%f3  = 2d800000, %f6  = 41c7ca57, %f26 = ec91adf4
	fmuls	%f3 ,%f6 ,%f26		! %f26 = 2fc7ca57

p1_label_80:
!	%l0 = 00000000d1160000, %l1 = 000000007fffffff, %l4 = 0000000000000016
	xor	%l0,%l1,%l4		! %l4 = 00000000aee9ffff
!	Mem[0000000031800014] = 6dffeba8, %l6 = 0022baf24c3e6b32
	lduw	[%o3+0x014],%l6		! %l6 = 000000006dffeba8
!	%l6 = 000000006dffeba8, %l0 = 00000000d1160000, %l0 = 00000000d1160000
	xnorcc	%l6,%l0,%l0		! %l0 = ffffffff43161457, %ccr = 80
!	%l0 = ffffffff43161457, %l3 = ffffffffffffffff, %l5 = 0022baf24c3e67dc
	xor	%l0,%l3,%l5		! %l5 = 00000000bce9eba8
!	Mem[00000000140001e0] = a4e8e376 8649026b, %l0 = 43161457, %l1 = 7fffffff
	ldda	[%i0+0x1e0]%asi,%l0	! %l0 = 00000000a4e8e376 000000008649026b

p1_label_81:
!	Mem[0000000014000120] = a4e8e376 8649026b, %l2 = 00007663fafbbd3c, %l6 = 000000006dffeba8
	add	%i0,0x120,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 2811115e8c804956
!	%l6 = 2811115e8c804956, immed = fffff76e, %l0 = 00000000a4e8e376
	tsubcc	%l6,-0x892,%l0		! %l0 = 2811115e8c8051e8, %ccr = 1b
!	Mem[0000000014800180] = f984f22b aa09fb6c
	flush	%i1+0x180
!	%f22 = 00000000 00000000, %f0  = 80000000 00000000
	fdtox	%f22,%f0 		! %f0  = 00000000 00000000
	fbu	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_82:
!	%l4 = aee9ffff, %l5 = bce9eba8, Mem[0000000015800190] = e594e3d6 f3f5fc84
	std	%l4,[%i3+0x190]	! Mem[0000000015800190] = aee9ffff bce9eba8
p1_b89:
	membar	#Sync			! Added by membar checker (254)
!	Mem[0000000014800000] = 005c5f73, %l2 = 00007663fafbbd3c
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 00000000005c5f73
!	Branch On Register, %l1 = 000000008649026b
	brnz,pt	%l1,p1_b90		! Branch Taken
!	Mem[0000000014000160] = 2573fab1 183ea354 728c70b8 b8eb68a7
	prefetch [%i0+0x160],22
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x05a,%g2
p1_b90:
	set	p1_b91,%o7
	fbule,a	p1_far_3_le	! Branch Taken, %fcc0 = 0

p1_label_83:
!	%l2 = 00000000005c5f73, Mem[0000000014800000] = 005c5f73
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000014800000] = 005c5f73
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x05b,%g2
p1_b91:
	membar	#Sync			! Added by membar checker (255)
!	%l1 = 000000008649026b, %l3 = ffffffffffffffff, %l7 = ffffffffffffffdf
	xorcc	%l1,%l3,%l7		! %l7 = ffffffff79b6fd94, %ccr = 80
!	%f10 = 00000000, %f16 = 00000000
	fitos	%f10,%f16		! %f16 = 00000000
!	%f4  = 00000000 00000000, %f30 = 2f94aef4 00000000
	fxtod	%f4 ,%f30		! %f30 = 00000000 00000000
!	Mem[0000000014000008] = 94654394 48036d8f, %l2 = 005c5f73, %l3 = ffffffff
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 0000000094654394 0000000048036d8f

p1_label_84:
!	%l0 = 2811115e8c8051e8, immed = 00000693, %l7 = ffffffff79b6fd94
	andn	%l0,0x693,%l7		! %l7 = 2811115e8c805168
!	%f14 = 00000000, %f22 = 00000000, %f16 = 00000000 00000000
	fsmuld	%f14,%f22,%f16		! %f16 = 00000000 00000000
!	%f4  = 00000000 00000000, %f22 = 00000000 00000000
	fmovd	%f4 ,%f22		! %f22 = 00000000 00000000
!	%f0  = 00000000 00000000, %f30 = 00000000 00000000
	fnegd	%f0 ,%f30		! %f30 = 80000000 00000000
!	%l2 = 0000000094654394, immed = 00000723, %l4 = 00000000aee9ffff
	taddcc	%l2,0x723,%l4		! %l4 = 0000000094654ab7, %ccr = 0a

p1_label_85:
	fbl,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000014800170] = d94f607f, %l4 = 0000000094654ab7
	lduh	[%i1+0x172],%l4		! %l4 = 000000000000607f
p1_b92:
	membar	#Sync			! Added by membar checker (256)
!	Mem[0000000032000060] = be38db17 ddc4e6bc cbb08000 79d4a921
	prefetcha [%o4+0x060]%asi,23
!	Mem[0000000014800050] = e5bacf70, %l0 = 2811115e8c8051e8
	lduwa	[%i1+0x050]%asi,%l0	! %l0 = 00000000e5bacf70
	set	p1_b93,%o7
	fbge,pn	%fcc3,p1_near_3_le	! Branch Taken, %fcc3 = 2

p1_label_86:
!	Mem[0000000031800054] = 71c5778e, %l4 = 000000000000607f
	ldstub	[%o3+0x054],%l4		! %l4 = 0000000000000071
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x05d,%g2
p1_b93:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000284
	membar	#Sync			! Added by membar checker (257)
!	%l3 = 0000000048036d8f, immed = 0000002b, %l2 = 0000000000000284
	srax	%l3,0x02b,%l2		! %l2 = 0000000000000000
!	%l5 = 00000000bce9eba8, %l4 = 0000000000000071, %y  = 00007663
	smulcc	%l5,%l4,%l6		! %l6 = ffffffe263410528, %ccr = 80
	nop
!	Mem[00000000148001af] = 1e808f73, %l1 = 000000008649026b
	ldstub	[%i1+0x1af],%l1		! %l1 = 0000000000000073

p1_label_87:
!	%f24 = 00000000 00000000, %f6  = 41c7ca57 7a000000, %f22 = 00000000 00000000
	fsubd	%f24,%f6 ,%f22		! %f22 = c1c7ca57 7a000000
	set	p1_b94,%o7
	fbue	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000000] = ef3c3706, %l7 = 2811115e8c805168
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ef3c3706
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x05e,%g2
p1_b94:
!	Registers modified during the branch to p1_far_1
!	%l2  = ffffffe2634102ad
!	%l5  = fffffffffffffff1
	membar	#Sync			! Added by membar checker (258)
!	Branch On Register, %l0 = 00000000e5bacf70
	brlez,pn %l0,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000015000000] = ef3c3706deae7eea, %l2 = ffffffe2634102ad
	ldxa	[%i2+%g0]0x80,%l2	! %l2 = ef3c3706deae7eea
p1_b95:

p1_label_88:
	set	p1_b96,%o7
	fbule,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003200005c] = 213ac54e, %l3 = 0000000048036d8f
	lduw	[%o4+0x05c],%g2		! %g2 = 0000000048036d8f
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x060,%g2
p1_b96:
!	Registers modified during the branch to p1_far_2
!	%l0  = 00000000e5bacf61
!	%l2  = ffffffe263410768
!	%l4  = 00000000ffffffff
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000014800008] = ffffffdf, %l6 = ffffffe263410528
	ldsba	[%i1+%o6]0x80,%l6	! %l6 = ffffffffffffffff
p1_b97:
	membar	#Sync			! Added by membar checker (259)
!	%f31 = 00000000, %f20 = 06ab07d2
	fmovs	%f31,%f20		! %f20 = 00000000

p1_label_89:
!	%f22 = c1c7ca57, %f29 = 00000000, %f14 = 00000000
	fadds	%f22,%f29,%f14		! %f14 = c1c7ca57
	set	p1_b98,%o7
	fbue,a,pt %fcc0,p1_near_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015800008] = 00000801, %l1 = 0000000000000073
	ldsha	[%i3+%o6]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x062,%g2
p1_b98:
!	Registers modified during the branch to p1_near_2
!	%l2  = 0000085dffff827e
	bl,a	p1_b99			! Branch Taken, %ccr = 08, CWP = 0
!	%l7 = 00000000ef3c3706, Mem[0000000031800015] = 6dffeba8
	stb	%l7,[%o3+0x015]		! Mem[0000000031800014] = 6d06eba8
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x063,%g2
p1_b99:

p1_label_90:
	membar	#Sync			! Added by membar checker (260)
!	Mem[0000000014800008] = ffffffdf, %l4 = 00000000ffffffff
	lduba	[%i1+%o6]0x80,%l4	! %l4 = 00000000000000ff
	bvs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000014800129] = 91388abb, %l2 = 0000085dffff827e
	ldstub	[%i1+0x129],%l2		! Annulled
p1_b100:
	bl	p1_b101			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],22
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x065,%g2
p1_b101:

p1_label_91:
	membar	#Sync			! Added by membar checker (261)
!	%f11 = 00000000, %f8  = c1d1192e 79400000
	fitod	%f11,%f8 		! %f8  = 00000000 00000000
!	Mem[00000000148000c0] = 4c018785 03fdccf1 e7fbacae 6edd3fc4
	prefetcha [%i1+0x0c0]%asi,0
!	Mem[00000000150001f0] = c5c431f04988814c, %l7 = 00000000ef3c3706
	ldx	[%i2+0x1f0],%l7		! %l7 = c5c431f04988814c
!	%f16 = 00000000 00000000, %f12 = 00000000
	fxtos	%f16,%f12		! %f12 = 00000000
!	Mem[0000000032000060] = be38db17 ddc4e6bc cbb08000 79d4a921
	prefetcha [%o4+0x060]%asi,16

p1_label_92:
!	%f28 = 00000000, %f9  = 00000000, %f1  = 00000000
	fsubs	%f28,%f9 ,%f1 		! %f1  = 00000000
!	Mem[0000000014000000] = d1160000, %l7 = c5c431f04988814c
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = ffffffffd1160000
!	%l3 = 0000000048036d8f, immed = 000005a0, %y  = 0000085d
	sdivcc	%l3,0x5a0,%l5		! %l5 = 000000007fffffff, %ccr = 02
!	Mem[0000000015800000] = ff21afbc, %l2 = 0000085dffff827e
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff21afbc
!	%l7 = ffffffffd1160000, Mem[0000000015800067] = e057ea31
	stb	%l7,[%i3+0x067]		! Mem[0000000015800064] = e057ea00

p1_label_93:
!	Mem[0000000015000098] = bfb57f47, %l7 = ffffffffd1160000
	lduha	[%i2+0x098]%asi,%l7	! %l7 = 000000000000bfb5
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000015000160] = 93de5143 09d7df4a 1bb2c463 81bfef5c
	prefetch [%i2+0x160],21
p1_b102:
	membar	#Sync			! Added by membar checker (262)
!	Mem[0000000015000160] = 93de5143 09d7df4a 1bb2c463 81bfef5c
	prefetch [%i2+0x160],16
!	%l4 = 00000000000000ff, Mem[0000000015800000] = ffff827e
	stwa	%l4,[%i3+%g0]0x80	! Mem[0000000015800000] = 000000ff

p1_label_94:
	fbe,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l4 = 00000000000000ff, Mem[0000000016000000] = 39c3287f
	stha	%l4,[%i4+%g0]0x80	! Mem[0000000016000000] = 00ff287f
p1_b103:
	bvc	p1_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000014000000] = d1160000, %l6 = ffffffffffffffff
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 00000000d1160000
p1_b104:
	membar	#Sync			! Added by membar checker (263)
!	%l6 = 00000000d1160000, Mem[000000001500015f] = 6175d771
	stba	%l6,[%i2+0x15f]%asi	! Mem[000000001500015c] = 6175d700

p1_label_95:
	fbe,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l7 = 000000000000bfb5, Mem[0000000014000000] = ffffffff
	stba	%l7,[%i0+%g0]0x80	! Annulled
p1_b105:
	set	p1_b106,%o7
	fbe,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l3 = 0000000048036d8f, Mem[0000000014800000] = 005c5f73
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000014800000] = 6d8f5f73
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x06a,%g2
p1_b106:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0000000165bacf60
!	%l2  = 00000000d1160240
!	%l4  = 000000000000085d
	membar	#Sync			! Added by membar checker (264)
!	Mem[0000000014000000] = ffffffff, %l6 = 00000000d1160000
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffff

p1_label_96:
!	%f30 = 80000000 00000000, %f16 = 00000000 00000000, %f30 = 80000000 00000000
	fmuld	%f30,%f16,%f30		! %f30 = 80000000 00000000
!	%l7 = 000000000000bfb5
	setx	0x71815dd671815dd6,%g7,%l7 ! %l7 = 71815dd671815dd6
	bvc	p1_b107			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000017000164] = afe11338, %l7 = 71815dd671815dd6
	ldsw	[%i6+0x164],%l7		! %l7 = ffffffffafe11338
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x06b,%g2
p1_b107:
	membar	#Sync			! Added by membar checker (265)
!	Mem[0000000014800120] = 5990874c6a8afdbe, %l0 = 0000000165bacf60
	ldx	[%i1+0x120],%l0		! %l0 = 5990874c6a8afdbe

p1_label_97:
	nop
	set	p1_b108,%o7
	fbo	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000017000000] = 8e8921a0, %l5 = 000000007fffffff
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 000000008e8921a0
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x06c,%g2
p1_b108:
!	Registers modified during the branch to p1_far_0
!	%l1  = 00000000ffffffff
!	%l2  = ffffffffb7fc998d
!	%l6  = 000000007fffffff
!	%l7  = 0000000000000061
	membar	#Sync			! Added by membar checker (266)
!	Mem[00000000150000e0] = 1d1a8682 bd034160 ce8924a9 87ffc3d0
	prefetcha [%i2+0x0e0]%asi,20
!	%f10 = 00000000, %f14 = c1c7ca57
	fstoi	%f10,%f14		! %f14 = 00000000

p1_label_98:
!	Mem[0000000015800020] = 3f83ed4f 5fc29d80 81f8af23 e3fbc38e
	prefetcha [%i3+0x020]%asi,20
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001600019c] = 6dce5b62, %l1 = 00000000ffffffff
	ldsh	[%i4+0x19c],%l1		! Annulled
p1_b109:
	membar	#Sync			! Added by membar checker (267)
!	Mem[0000000031000014] = 9dda1af3, %l0 = 5990874c6a8afdbe
	ldsha	[%o2+0x014]%asi,%l0	! %l0 = ffffffffffff9dda
!	%l1 = 00000000ffffffff
	sethi	%hi(0x00f43400),%l1	! %l1 = 0000000000f43400

p1_label_99:
!	%l1 = 0000000000f43400, immed = fffff2de, %l2 = ffffffffb7fc998d
	and	%l1,-0xd22,%l2		! %l2 = 0000000000f43000
!	Mem[0000000015000040] = a50ee9fc 9bf6a520 f81ceb9b a22363e7
	prefetch [%i2+0x040],23
!	%l6 = 000000007fffffff, %l5 = 000000008e8921a0, %l3 = 0000000048036d8f
	addc	%l6,%l5,%l3		! %l3 = 000000010e89219f
!	Mem[0000000032000060] = be38db17 ddc4e6bc cbb08000 79d4a921
	prefetcha [%o4+0x060]%asi,22
!	Mem[00000000140000c8] = 8e0b15d9, %l4 = 000000000000085d
	lduwa	[%i0+0x0c8]%asi,%l4	! %l4 = 000000008e0b15d9

p1_label_100:
	set	p1_b110,%o7
	fbue,a	p1_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000031800010] = d5eff6ae6d06eba8, %l1 = 0000000000f43400
	ldx	[%o3+0x010],%l1		! %l1 = d5eff6ae6d06eba8
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x06e,%g2
p1_b110:
	membar	#Sync			! Added by membar checker (268)
!	%l7 = 0000000000000061, immed = 00000bbc, %l5 = 000000008e8921a0
	or	%l7,0xbbc,%l5		! %l5 = 0000000000000bfd
	fbn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000000] = ef3c3706, %l6 = 000000007fffffff
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffef3c
p1_b111:

p1_label_101:
	membar	#Sync			! Added by membar checker (269)
!	Mem[0000000015800100] = b52ee19e 683e3b63 00000000 4fef9001
	prefetcha [%i3+0x100]%asi,23

	ba,a	p1_not_taken_0_end
p1_not_taken_0:
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba,a	p1_branch_failed
p1_not_taken_0_end:

!	%f31 = 00000000, %f17 = 00000000
	fmovs	%f31,%f17		! %f17 = 00000000
	set	p1_b112,%o7
	fbuge,a,pn %fcc0,p1_near_2_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003100001c] = 0000018f, %l4 = 000000008e0b15d9
	ldsb	[%o2+0x01d],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x070,%g2
p1_b112:
!	Registers modified during the branch to p1_near_2
!	%l2  = 0000000000000656
	membar	#Sync			! Added by membar checker (270)
	fbn,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_102:
!	Mem[0000000031800010] = d5eff6ae6d06eba8, %l2 = 0000000000000656
	ldx	[%o3+0x010],%l2		! %l2 = d5eff6ae6d06eba8
p1_b113:
	bneg,a	p1_b114			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000014000008] = 94654394, %l0 = ffffffffffff9dda
	ldswa	[%i0+%o6]0x80,%l0	! %l0 = ffffffff94654394
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x072,%g2
p1_b114:
	membar	#Sync			! Added by membar checker (271)
!	Mem[0000000014800000] = 6d8f5f73, %l6 = ffffffffffffef3c
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 000000006d8f5f73
!	%f25 = 00000000, %f7  = 7a000000
	fitos	%f25,%f7 		! %f7  = 00000000

p1_label_103:
!	%l7 = 0000000000000061, Mem[0000000015800082] = ac554bb8
	stb	%l7,[%i3+0x082]		! Mem[0000000015800080] = ac5561b8
!	%f5  = 00000000, %f23 = 7a000000
	fcmpes	%fcc1,%f5 ,%f23		! %fcc1 = 1
!	%f20 = 00000000, %f11 = 00000000
	fitos	%f20,%f11		! %f11 = 00000000
!	%l2 = d5eff6ae6d06eba8, %l3 = 000000010e89219f, %l7 = 0000000000000061
	taddcc	%l2,%l3,%l7		! %l7 = d5eff6af7b900d47, %ccr = 82
!	%l1 = d5eff6ae6d06eba8, immed = fffff380, %y  = 0000085d
	udivcc	%l1,-0xc80,%l6		! %l6 = 000000000000085d, %ccr = 00

p1_label_104:
!	%l1 = d5eff6ae6d06eba8, Mem[00000000158001dc] = 1d07594f
	stwa	%l1,[%i3+0x1dc]%asi	! Mem[00000000158001dc] = 6d06eba8
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000060] = be38db17 ddc4e6bc cbb08000 79d4a921
	prefetch [%o4+0x060],0	! Annulled
p1_b115:
	ba,a	p1_b116			! Branch Taken, %ccr = 00, CWP = 0
!	%l2 = 6d06eba8, %l3 = 0e89219f, Mem[0000000015800000] = 000000ff 77805240
	stda	%l2,[%i3+%g0]0x80	! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x074,%g2
p1_b116:

p1_label_105:
	membar	#Sync			! Added by membar checker (272)
!	%l4 = 0000000000000000, immed = 00000bb8, %l7 = d5eff6af7b900d47
	orcc	%l4,0xbb8,%l7		! %l7 = 0000000000000bb8, %ccr = 00
!	%l2 = d5eff6ae6d06eba8, immed = fffff3db, %l3 = 000000010e89219f
	and	%l2,-0xc25,%l3		! %l3 = d5eff6ae6d06e388
	bl	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000015800000] = 000000ff, %l7 = 0000000000000bb8
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
p1_b117:
	membar	#Sync			! Added by membar checker (273)
!	Mem[0000000014800008] = ffffffdf fff3a3ff, %l6 = 0000085d, %l7 = 00000000
	ldda	[%i1+%o6]0x80,%l6	! %l6 = 00000000ffffffdf 00000000fff3a3ff

p1_label_106:
!	%f8  = 00000000, %f2  = c1c0d78f, %f25 = 00000000
	fdivs	%f8 ,%f2 ,%f25		! %f25 = 80000000
!	Mem[0000000014800000] = 6d8f5f73f81c6679, %l2 = d5eff6ae6d06eba8
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 6d8f5f73f81c6679
!	%l4 = 0000000000000000, Mem[00000000148000a4] = 1c574d5b
	stb	%l4,[%i1+0x0a4]		! Mem[00000000148000a4] = 00574d5b
!	Mem[0000000014800060] = d31bad5c 7c1f1872 3114e89b d1fb468d
	prefetch [%i1+0x060],23
!	%l3 = d5eff6ae6d06e388, %l0 = ffffffff94654394, %l0 = ffffffff94654394
	addc	%l3,%l0,%l0		! %l0 = d5eff6ae016c271c

p1_label_107:
	fbu,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l1 = d5eff6ae6d06eba8, Mem[00000000140000d8] = 08b1f8bd
	stb	%l1,[%i0+0x0d8]		! Annulled
p1_b118:
	fbul	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000000] = ffffffff, %l7 = 00000000fff3a3ff
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 000000000000ffff
p1_b119:
	membar	#Sync			! Added by membar checker (274)
!	Mem[0000000030800018] = 08685f2e, %l2 = 6d8f5f73f81c6679
	ldsb	[%o1+0x01b],%l2		! %l2 = 000000000000002e

p1_label_108:
!	Branch On Register, %l4 = 0000000000000000
	brnz,pt	%l4,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014800020] = 439973e2 2204756c f1e657a5 68602106
	prefetch [%i1+0x020],0
p1_b120:
	fbg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800058] = 4a1b44ba, %l1 = d5eff6ae6d06eba8
	ldsw	[%o1+0x058],%l1		! %l1 = 000000004a1b44ba
p1_b121:
	membar	#Sync			! Added by membar checker (275)
!	%f8  = 00000000 00000000, %f18 = 00000000
	fxtos	%f8 ,%f18		! %f18 = 00000000

p1_label_109:
	fblg,a,pt %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001580010c] = 4fef9001, %l4 = 0000000000000000
	ldsh	[%i3+0x10e],%l4		! Annulled
p1_b122:
	membar	#Sync			! Added by membar checker (276)
!	%l4 = 00000000, %l5 = 00000bfd, Mem[0000000014000000] = ffffffff 27147400
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000014000000] = 00000000 00000bfd
!	%l1 = 000000004a1b44ba, %l6 = 00000000ffffffdf, %l2 = 000000000000002e
	orncc	%l1,%l6,%l2		! %l2 = ffffffff4a1b44ba, %ccr = 80
!	Mem[0000000014000198] = 07c27fc3d5a6fc96, %l6 = 00000000ffffffdf
	ldxa	[%i0+0x198]%asi,%l6	! %l6 = 07c27fc3d5a6fc96

p1_label_110:
!	%f6  = 41c7ca57 00000000, %f2  = c1c0d78f 2d800000
	fcmpd	%fcc2,%f6 ,%f2 		! %fcc2 = 2
!	%l1 = 000000004a1b44ba, Mem[0000000015800008] = 00000801
	stha	%l1,[%i3+%o6]0x80	! Mem[0000000015800008] = 44ba0801
	fbul,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000015800140] = 4f73449f, %l7 = 000000000000ffff
	ldsb	[%i3+0x141],%l7		! %l7 = 0000000000000073
p1_b123:
	membar	#Sync			! Added by membar checker (277)
!	%l5 = 0000000000000bfd, immed = fffff140, %l0 = d5eff6ae016c271c
	addcc	%l5,-0xec0,%l0		! %l0 = fffffffffffffd3d, %ccr = 88

p1_label_111:
!	%l0 = fffffffffffffd3d, immed = 00000930, %l1 = 000000004a1b44ba
	xnor	%l0,0x930,%l1		! %l1 = 0000000000000bf2
!	Mem[0000000015800008] = 44ba0801, %l5 = 0000000000000bfd
	lduwa	[%i3+%o6]0x80,%l5	! %l5 = 0000000044ba0801
!	%l5 = 0000000044ba0801, immed = fffff092, %l1 = 0000000000000bf2
	taddcc	%l5,-0xf6e,%l1		! %l1 = 0000000044b9f893, %ccr = 13
!	%f8  = 00000000 00000000, %f8  = 00000000 00000000
	fcmpd	%fcc2,%f8 ,%f8 		! %fcc2 = 0
!	Mem[0000000014000020] = 9333f9e2 b83168e4 de20ea7e 4b8ce116
	prefetch [%i0+0x020],0

p1_label_112:
	fbu,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000015800008] = 44ba080103a1ddc6, %l5 = 0000000044ba0801
	ldxa	[%i3+%o6]0x80,%l5	! %l5 = 44ba080103a1ddc6
p1_b124:
	membar	#Sync			! Added by membar checker (278)
!	Mem[00000000158000e7] = 8d246079, %l5 = 44ba080103a1ddc6
	ldstub	[%i3+0x0e7],%l5		! %l5 = 0000000000000079
	set	p1_b125,%o7
	fba,a,pn %fcc0,p1_near_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000015000008] = 0010d341, %l0 = fffffffffffffd3d
	swapa	[%i2+%o6]0x80,%l0	! Annulled
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x07d,%g2
p1_b125:
!	Registers modified during the branch to p1_near_1
!	%l0  = 00000000b5e4b367
!	%l1  = 0200094190a01c16
!	%l3  = 0000000000000000
!	%l4  = d5eff6ae6d06e14a
!	%l6  = 0200094190a0154b

p1_label_113:
	membar	#Sync			! Added by membar checker (279)
!	%l6 = 0200094190a0154b
	setx	0xd7a9aed4d7a9aed4,%g7,%l6 ! %l6 = d7a9aed4d7a9aed4
!	Mem[000000003180001c] = f925b7d6, %l5 = 0000000000000079
	lduwa	[%o3+0x01c]%asi,%l5	! %l5 = 00000000f925b7d6
!	Mem[00000000140001e8] = 17295807eedc5f34, %l3 = 0000000000000000
	ldxa	[%i0+0x1e8]%asi,%l3	! %l3 = 17295807eedc5f34
!	Mem[0000000031800014] = 6d06eba8, %l7 = 0000000000000073
	ldswa	[%o3+0x014]%asi,%l7	! %l7 = 000000006d06eba8
!	Branch On Register, %l6 = d7a9aed4d7a9aed4
	brlz,a,pn %l6,p1_b126		! Branch Taken

p1_label_114:
!	Mem[0000000032000068] = cbb0800079d4a921, %l2 = ffffffff4a1b44ba
	ldx	[%o4+0x068],%g2		! %g2 = cbb0800079d4a921
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x07e,%g2
p1_b126:
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000015800008] = 44ba0801, %l7 = 000000006d06eba8
	ldstuba	[%i3+%o6]0x80,%l7	! Annulled
p1_b127:
	membar	#Sync			! Added by membar checker (280)
	fbu,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000017000008] = dfafdef9, %l2 = ffffffff4a1b44ba
	lduwa	[%i6+%o6]0x80,%l2	! %l2 = 00000000dfafdef9
p1_b128:

p1_label_115:
	membar	#Sync			! Added by membar checker (281)
!	Mem[0000000015000068] = 2523e4b6, %l1 = 90a01c16, %l2 = dfafdef9
	add	%i2,0x68,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 000000002523e4b6
!	Mem[0000000031000058] = 1c04d06b 702637af, %l2 = 2523e4b6, %l3 = eedc5f34
	ldd	[%o2+0x058],%l2		! %l2 = 000000001c04d06b 00000000702637af
	bvc	p1_b129			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000015800000] = 000000ff, %l3 = 00000000702637af
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x081,%g2
p1_b129:
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08

p1_label_116:
!	Mem[000000001500007c] = d09e3a5a, %l7 = 000000006d06eba8
	ldsb	[%i2+0x07d],%l7		! Annulled
p1_b130:
	membar	#Sync			! Added by membar checker (282)
!	%l6 = d7a9aed4d7a9aed4, Mem[0000000014800008] = ffffffdffff3a3ff
	stxa	%l6,[%i1+%o6]0x80	! Mem[0000000014800008] = d7a9aed4d7a9aed4
!	%l6 = d7a9aed4d7a9aed4, immed = 000002df, %l3 = 00000000000000ff
	subc	%l6,0x2df,%l3		! %l3 = d7a9aed4d7a9abf5
!	%l7 = 000000006d06eba8, Mem[0000000014000008] = 9465439448036d8f
	stxa	%l7,[%i0+%o6]0x80	! Mem[0000000014000008] = 000000006d06eba8
	set	p1_b131,%o7
	fbuge,a	p1_far_0_he	! Branch Taken, %fcc0 = 0

p1_label_117:
!	Mem[0000000015800000] = 000000ff, %l6 = d7a9aed4d7a9aed4
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x083,%g2
p1_b131:
!	Registers modified during the branch to p1_far_0
!	%l6  = 0000000000000000
!	%l7  = 000005e852fecf58
	membar	#Sync			! Added by membar checker (283)
!	%l2 = 000000001c04d06b, immed = 00000cdb, %l4 = d5eff6ae6d06e14a
	sub	%l2,0xcdb,%l4		! %l4 = 000000001c04c390
!	%l1 = 0200094190a01c16, %l2 = 000000001c04d06b, %y  = 000005e8
	mulx	%l1,%l2,%l3		! %l3 = 2e60e97c62159d32
!	%l5 = 00000000f925b7d6, immed = 00000eed, %y  = 000005e8
	sdiv	%l5,0xeed,%l6		! %l6 = 00000000655dceab
	set	p1_b132,%o7
	fbug,a,pn %fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 2

p1_label_118:
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],4
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x084,%g2
p1_b132:
!	Registers modified during the branch to p1_near_0
!	%l5  = 000005e852fec6aa
	membar	#Sync			! Added by membar checker (284)
!	%l4 = 000000001c04c390, %l2 = 000000001c04d06b, %l1 = 0200094190a01c16
	sll	%l4,%l2,%l1		! %l1 = 000000e0261c8000
!	Mem[0000000015800000] = 000000ff, %l7 = 000005e852fecf58
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000015800008] = 44ba0801, %l1 = 000000e0261c8000
	swapa	[%i3+%o6]0x80,%l1	! %l1 = 0000000044ba0801
!	Mem[0000000014000000] = 00000000, %l2 = 000000001c04d06b
	ldsba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000

p1_label_119:
!	Mem[0000000015000008] = 0010d341bed44891, %l7 = 0000000000000000
	ldxa	[%i2+%o6]0x80,%l7	! %l7 = 0010d341bed44891
	fbug,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91ee121b d7059b63
	prefetch [%o4+0x020],22	! Annulled
p1_b133:
	membar	#Sync			! Added by membar checker (285)
!	Mem[0000000015000138] = 2c5b5065 ab23d43d, %l0 = b5e4b367, %l1 = 44ba0801
	ldd	[%i2+0x138],%l0		! %l0 = 000000002c5b5065 00000000ab23d43d
!	Mem[0000000015800110] = 64d0db84, %l7 = 0010d341bed44891
	swap	[%i3+0x110],%l7		! %l7 = 0000000064d0db84

p1_label_120:
!	Mem[0000000014800000] = 6d8f5f73f81c6679, %l7 = 0000000064d0db84
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 6d8f5f73f81c6679
	set	p1_b134,%o7
	fbe,a	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l5 = 000005e852fec6aa, Mem[0000000015000008] = 0010d341bed44891
	stxa	%l5,[%i2+%o6]0x80	! Mem[0000000015000008] = 000005e852fec6aa
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x086,%g2
p1_b134:
!	Registers modified during the branch to p1_far_2
!	%l0  = 000005e87f5a170f
!	%l2  = 00000000655dcceb
!	%l4  = 00000000000005e8
	membar	#Sync			! Added by membar checker (286)
!	Mem[00000000140000b4] = 0b773d20, %l0 = 000005e87f5a170f
	lduwa	[%i0+0x0b4]%asi,%l0	! %l0 = 000000000b773d20
!	Mem[0000000014000038] = 00000001 00000001, %l4 = 00000000000005e8, %l7 = 6d8f5f73f81c6679
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = d69ef7877d970b52

p1_label_121:
	bg,a	p1_b135			! Branch Taken, %ccr = 00, CWP = 0
!	%l0 = 000000000b773d20, Mem[00000000150000a0] = 4fef90010b34c740
	stx	%l0,[%i2+0x0a0]		! Mem[00000000150000a0] = 000000000b773d20
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x087,%g2
p1_b135:
	membar	#Sync			! Added by membar checker (287)
!	%l0 = 000000000b773d20, immed = 000009bd, %y  = 000005e8
	umulcc	%l0,0x9bd,%l3		! %l3 = 0000006fa82e40a0, %ccr = 08
!	%l5 = 000005e852fec6aa
	setx	0xf47bf390f47bf390,%g7,%l5 ! %l5 = f47bf390f47bf390
!	%l1 = 00000000ab23d43d
	setx	0x41cde42d41cde42d,%g7,%l1 ! %l1 = 41cde42d41cde42d

p1_label_122:
!	Mem[0000000015000008] = 000005e8, %l7 = d69ef7877d970b52
	swapa	[%i2+%o6]0x80,%l7	! %l7 = 00000000000005e8
!	%l7 = 00000000000005e8, immed = fffffb43, %y  = 0000006f
	udivx	%l7,-0x4bd,%l3		! %l3 = 0000000000000000
!	Mem[0000000030800010] = ffffffaf42c526d2, %l3 = 0000000000000000
	ldx	[%o1+0x010],%l3		! %l3 = ffffffaf42c526d2
	bg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[000000003000001f] = 000000a8, %l1 = 41cde42d41cde42d
	ldstub	[%o0+0x01f],%l1		! Annulled
p1_b136:

p1_label_123:
	set	p1_b137,%o7
	fbe,a	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	%l2 = 00000000655dcceb, Mem[0000000014000000] = 00000000
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000014000000] = eb000000
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x089,%g2
p1_b137:
!	Registers modified during the branch to p1_far_1
!	%l2  = 00000000655dcc30
!	%l5  = ffffffffffffffe9
	membar	#Sync			! Added by membar checker (288)
	set	p1_b138,%o7
	fbe,a,pn %fcc0,p1_near_2_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003100001c] = 0000018f, %l5 = ffffffffffffffe9
	swap	[%o2+0x01c],%l5		! %l5 = 000000000000018f
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x08a,%g2
p1_b138:
!	Registers modified during the branch to p1_near_2
!	%l2  = 0000000000000bdd
	membar	#Sync			! Added by membar checker (289)
!	%l2 = 0000000000000bdd, Mem[000000003200000e] = 57b7c5e7
	stha	%l2,[%o4+0x00e]%asi	! Mem[000000003200000c] = 0bddc5e7

p1_label_124:
!	%l3 = ffffffaf42c526d2, immed = fffffb80, %y  = 0000006f
	smul	%l3,-0x480,%l3		! %l3 = fffffed388d14f00
!	%l7 = 00000000000005e8, Mem[0000000014800008] = d7a9aed4
	stwa	%l7,[%i1+%o6]0x80	! Mem[0000000014800008] = 000005e8
!	%l0 = 000000000b773d20, immed = fffffa97, %l1 = 41cde42d41cde42d
	andncc	%l0,-0x569,%l1		! %l1 = 0000000000000520, %ccr = 00
	set	p1_b139,%o7
	fbe,a,pn %fcc2,p1_near_1_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4, %l0 = 0b773d20, %l1 = 00000520
	ldd	[%o4+0x020],%g2		! %l0 = 000000000b773d20 0000000000000520
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x08b,%g2
p1_b139:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000b08
!	%l2  = 000000003a1c92b7
!	%l7  = 00000000655dd493

p1_label_125:
	membar	#Sync			! Added by membar checker (290)
!	Mem[000000003200002c] = d7059b63, %l1 = 0000000000000520
	ldsw	[%o4+0x02c],%g2		! %g2 = 0000000000000520
	set	p1_b140,%o7
	fbge	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000014000060] = 63664166 3169095f b8c8d859 25989854
	prefetch [%i0+0x060],23
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x08c,%g2
p1_b140:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0000000000000c97
!	%l2  = 00000000655dcceb
!	%l4  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (291)
	nop
!	%l0 = 0000000000000c97, immed = 00000b19, %l5 = 000000000000018f
	and	%l0,0xb19,%l5		! %l5 = 0000000000000811

p1_label_126:
!	%f18 = 00000000, %f30 = 80000000, %f9  = 00000000
	fmuls	%f18,%f30,%f9 		! %f9  = 80000000
!	Mem[0000000014800120] = 5990874c 6a8afdbe 91388abb 5d219940
	prefetcha [%i1+0x120]%asi,16
!	Mem[0000000030000014] = b8920682, %l1 = 0000000000000520
	ldub	[%o0+0x015],%l1		! %l1 = 0000000000000092
!	%l4 = 00000000ffffffff, Mem[0000000014000008] = 00000000
	stwa	%l4,[%i0+%o6]0x80	! Mem[0000000014000008] = ffffffff
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0

p1_label_127:
!	Mem[0000000014800008] = 000005e8, %l4 = 00000000ffffffff
	ldsha	[%i1+%o6]0x80,%l4	! Annulled
p1_b141:
	membar	#Sync			! Added by membar checker (292)
!	Mem[0000000014000008] = ffffffff, %l7 = 00000000655dd493
	ldsba	[%i0+%o6]0x80,%l7	! %l7 = ffffffffffffffff
	set	p1_b142,%o7
	fbuge,pn %fcc2,p1_near_1_le	! Branch Taken, %fcc2 = 0
!	%l7 = ffffffffffffffff, Mem[0000000015800000] = 000000ff
	stba	%l7,[%i3+%g0]0x80	! Mem[0000000015800000] = ff0000ff
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x08e,%g2
p1_b142:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000100000091
!	%l2  = 000000003a0900cf
!	%l7  = 00000001655dceaa
	membar	#Sync			! Added by membar checker (293)
!	Mem[00000000140001b8] = 97e77bb96d3f5acf, %l0 = 0000000100000091
	ldx	[%i0+0x1b8],%l0		! %l0 = 97e77bb96d3f5acf

p1_label_128:
	fbu,pt	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014800008] = 000005e8, %l1 = 0000000000000092
	swapa	[%i1+%o6]0x80,%l1	! %l1 = 00000000000005e8
p1_b143:
	bne	p1_b144			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000003180005c] = 5b20d8f7, %l3 = fffffed388d14f00
	lduh	[%o3+0x05e],%l3		! %l3 = 000000000000d8f7
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x090,%g2
p1_b144:
	membar	#Sync			! Added by membar checker (294)
!	Mem[0000000014000008] = ffffffff, %l0 = 97e77bb96d3f5acf
	lduwa	[%i0+%o6]0x80,%l0	! %l0 = 00000000ffffffff

p1_label_129:
	set	p1_b145,%o7
	fba	p1_far_2_le	! Branch Taken, %fcc0 = 0
!	%l4 = 00000000ffffffff, Mem[0000000015800000] = ff0000ff
	stha	%l4,[%i3+%g0]0x80	! Mem[0000000015800000] = ffff00ff
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x091,%g2
p1_b145:
!	Registers modified during the branch to p1_far_2
!	%l0  = 0000000100000810
!	%l2  = 00000000655dcceb
!	%l4  = 00000000ffffffff
	membar	#Sync			! Added by membar checker (295)
!	%l4 = 00000000ffffffff, %l7 = 00000001655dceaa, %y  = fffffed3
	umulcc	%l4,%l7,%l4		! %l4 = 655dcea99aa23156, %ccr = 08
	bne,a	p1_b146			! Branch Taken, %ccr = 08, CWP = 0
!	%l3 = 000000000000d8f7, Mem[0000000032000078] = 57fa95466cb174b6
	stx	%l3,[%o4+0x078]		! Mem[0000000032000078] = 000000000000d8f7
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x092,%g2
p1_b146:

p1_label_130:
	bpos	p1_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[00000000140000a0] = 41ef8359 dc7145b9 8ceac181 9be803d1
	prefetch [%i0+0x0a0],2
p1_b147:
	membar	#Sync			! Added by membar checker (296)
!	%l6 = 00000000655dceab, %l5 = 0000000000000811, %l1 = 00000000000005e8
	srl	%l6,%l5,%l1		! %l1 = 00000000000032ae
	fbul,a,pt %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[0000000014000060] = 63664166 3169095f b8c8d859 25989854
	prefetch [%i0+0x060],2	! Annulled
p1_b148:

p1_label_131:
	membar	#Sync			! Added by membar checker (297)
!	%f16 = 00000000, %f18 = 00000000
	fcmps	%fcc3,%f16,%f18		! %fcc3 = 0
	nop				! Delay added due to fcmp
	set	p1_b149,%o7
	fbule,a,pn %fcc0,p1_near_2_he	! Branch Taken, %fcc0 = 0
!	Mem[00000000150001e0] = 5c15709d 3654e40f ef7d8cb4 d33d2ac5
	prefetch [%i2+0x1e0],22
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x095,%g2
p1_b149:
!	Registers modified during the branch to p1_near_2
!	%l2  = 0000000000437e3e
	membar	#Sync			! Added by membar checker (298)
!	Mem[0000000015000140] = 09fa6b2b 934f9e7e 12ba0439 f1aeb320
	prefetch [%i2+0x140],2
	set	p1_b150,%o7
	fbo,a	p1_far_3_le	! Branch Taken, %fcc0 = 0

p1_label_132:
!	Mem[0000000014000000] = eb000000, %l1 = 00000000000032ae
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = ffffffffeb000000
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x096,%g2
p1_b150:
	membar	#Sync			! Added by membar checker (299)
!	%l6 = 00000000655dceab, immed = 00000db3, %l2 = 0000000000437e3e
	subc	%l6,0xdb3,%l2		! %l2 = 00000000655dc0f8
!	%l7 = 00000001655dceaa, %l4 = 655dcea99aa23156, %l0 = 0000000100000810
	srl	%l7,%l4,%l0		! %l0 = 0000000000000195
!	%l0 = 0000000000000195, Mem[0000000014000008] = ffffffff
	stba	%l0,[%i0+%o6]0x80	! Mem[0000000014000008] = 95ffffff
!	%l6 = 00000000655dceab, Mem[0000000030000010] = 8a14c5ae
	stw	%l6,[%o0+0x010]		! Mem[0000000030000010] = 655dceab

p1_label_133:
!	%f3  = 2d800000, %f3  = 2d800000
	fnegs	%f3 ,%f3 		! %f3  = ad800000
!	%l4 = 655dcea99aa23156, %l1 = ffffffffeb000000, %l2 = 00000000655dc0f8
	taddcc	%l4,%l1,%l2		! %l2 = 655dcea985a23156, %ccr = 1b
!	%l3 = 000000000000d8f7, Mem[0000000014800008] = 00000092d7a9aed4
	stxa	%l3,[%i1+%o6]0x80	! Mem[0000000014800008] = 000000000000d8f7
!	Mem[000000001580004c] = a2b95ec9, %l6 = 00000000655dceab
	swap	[%i3+0x04c],%l6		! %l6 = 00000000a2b95ec9
!	Mem[00000000158001c0] = 2716cbca 5bb164c3 f7684f5b 05dd5894
	prefetch [%i3+0x1c0],22

p1_label_134:
	nop
!	Mem[0000000015000120] = b581b50d fa9eb8e0 7b37fa95 36b3370a
	prefetcha [%i2+0x120]%asi,3
!	%f31 = 00000000, %f14 = 00000000
	fabss	%f31,%f14		! %f14 = 00000000
!	Mem[0000000014800008] = 000000000000d8f7, %l7 = 00000001655dceaa
	ldxa	[%i1+%o6]0x80,%l7	! %l7 = 000000000000d8f7
!	%l0 = 00000195, %l1 = eb000000, Mem[0000000017000038] = 40eb7c89 405f7744
	std	%l0,[%i6+0x038]	! Mem[0000000017000038] = 00000195 eb000000

p1_label_135:
!	Mem[00000000150001e0] = 5c15709d 3654e40f ef7d8cb4 d33d2ac5
	prefetch [%i2+0x1e0],1
!	%f12 = 00000000, %f20 = 00000000
	fnegs	%f12,%f20		! %f20 = 80000000
!	%l6 = 00000000a2b95ec9, Mem[0000000015800008] = 261c800003a1ddc6
	stxa	%l6,[%i3+%o6]0x80	! Mem[0000000015800008] = 00000000a2b95ec9
!	%f6  = 41c7ca57 00000000, %f2  = c1c0d78f ad800000
	fcmpd	%fcc1,%f6 ,%f2 		! %fcc1 = 2
!	%l5 = 0000000000000811, immed = 000008b8, %y  = 00000000
	sdiv	%l5,0x8b8,%l7		! %l7 = 0000000000000000

p1_label_136:
!	%l7 = 0000000000000000, Mem[0000000015800000] = ffff00ff
	stwa	%l7,[%i3+%g0]0x80	! Mem[0000000015800000] = 00000000
	ble,a	p1_not_taken_0		! Branch Not Taken, %ccr = 1b
!	%l3 = 000000000000d8f7, Mem[0000000015800000] = 0000000077805240
	stxa	%l3,[%i3+%g0]0x80	! Annulled
p1_b151:
	membar	#Sync			! Added by membar checker (300)
!	%l2 = 85a23156, %l3 = 0000d8f7, Mem[0000000031000018] = 00ff0000 ffffffe9
	std	%l2,[%o2+0x018]	! Mem[0000000031000018] = 85a23156 0000d8f7
!	%f12 = 00000000, %f21 = 87560a05, %f29 = 00000000
	fdivs	%f12,%f21,%f29		! %f29 = 80000000

p1_label_137:
!	%f18 = 00000000 00000000, %f18 = 00000000 00000000, %f22 = c1c7ca57 7a000000
	faddd	%f18,%f18,%f22		! %f22 = 00000000 00000000
!	Jump to jmpl_2, CWP = 0
	set	p1_jmpl_2_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000015800100] = b52ee19e, %l4 = 655dcea99aa23156
	ldsw	[%i3+0x100],%l4		! %l4 = ffffffffb52ee19e
!	Registers modified during the branch to p1_jmpl_2
!	%l4  = 000000004ad11218
	set	p1_b152,%o7
	fbg,pt	%fcc1,p1_near_3_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000014000000] = eb000000, %l7 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffeb00
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x098,%g2
p1_b152:
!	Registers modified during the branch to p1_near_3
!	%l5  = 0000000000161373

p1_label_138:
	membar	#Sync			! Added by membar checker (301)
!	%l6 = 00000000a2b95ec9, %l7 = ffffffffffffeb00, %l1 = ffffffffeb000000
	sll	%l6,%l7,%l1		! %l1 = 00000000a2b95ec9
!	%f16 = 00000000 00000000, %f31 = 00000000
	fxtos	%f16,%f31		! %f31 = 00000000
!	%l7 = ffffffffffffeb00, Mem[0000000015800020] = 3f83ed4f5fc29d80
	stxa	%l7,[%i3+0x020]%asi	! Mem[0000000015800020] = ffffffffffffeb00
	bge,a	p1_b153			! Branch Taken, %ccr = 1b, CWP = 0
!	Mem[00000000158001f8] = a08e6f3c13ff1ec3, %l4 = 000000004ad11218
	ldx	[%i3+0x1f8],%l4		! %l4 = a08e6f3c13ff1ec3
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x099,%g2
p1_b153:

p1_label_139:
	membar	#Sync			! Added by membar checker (302)
!	Mem[0000000016000000] = 00ff287f, %l0 = 0000000000000195
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000161373, Mem[00000000158001d8] = 1b217a376d06eba8
	stx	%l5,[%i3+0x1d8]		! Mem[00000000158001d8] = 0000000000161373
!	%l3 = 000000000000d8f7, Mem[0000000015000008] = 7d970b52
	stba	%l3,[%i2+%o6]0x80	! Mem[0000000015000008] = f7970b52
!	Mem[0000000015000178] = eb1df9cb, %l3 = 000000000000d8f7
	ldsba	[%i2+0x17b]%asi,%l3	! %l3 = ffffffffffffffcb
!	%l4 = 13ff1ec3, %l5 = 00161373, Mem[0000000017000168] = 90bb29ab 49c8d40c
	std	%l4,[%i6+0x168]	! Mem[0000000017000168] = 13ff1ec3 00161373

p1_label_140:
!	Mem[0000000030000018] = 000000a2, %l5 = 0000000000161373
	ldsw	[%o0+0x018],%l5		! %l5 = 00000000000000a2
!	%f6  = 41c7ca57 00000000, %f10 = 00000000
	fdtoi	%f6 ,%f10		! %f10 = 2f94ae00
!	%l5 = 00000000000000a2, %l4 = a08e6f3c13ff1ec3, %l2 = 655dcea985a23156
	xor	%l5,%l4,%l2		! %l2 = a08e6f3c13ff1e61
!	%f16 = 00000000, %f2  = c1c0d78f
	fitos	%f16,%f2 		! %f2  = 00000000
!	Mem[0000000030000058] = 896a6157, %l4 = a08e6f3c13ff1ec3
	ldsb	[%o0+0x058],%l4		! %l4 = ffffffffffffff89

p1_label_141:
	ba	p1_b154			! Branch Taken, %ccr = 1b, CWP = 0
!	%l7 = ffffffffffffeb00, Mem[0000000015000008] = f7970b52
	stwa	%l7,[%i2+%o6]0x80	! Mem[0000000015000008] = ffffeb00
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x09a,%g2
p1_b154:
	membar	#Sync			! Added by membar checker (303)
	set	p1_b155,%o7
	fbue,pn	%fcc2,p1_near_0_le	! Branch Taken, %fcc2 = 0
!	Mem[0000000014800189] = c165038f, %l1 = 00000000a2b95ec9
	ldstub	[%i1+0x189],%l1		! %l1 = 0000000000000065
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x09b,%g2
p1_b155:
!	Registers modified during the branch to p1_near_0
!	%l5  = ffffffffffffe2f2
	membar	#Sync			! Added by membar checker (304)
!	Mem[0000000014800060] = d31bad5c 7c1f1872 3114e89b d1fb468d
	prefetch [%i1+0x060],3

p1_label_142:
	bgu	p1_not_taken_0		! Branch Not Taken, %ccr = 1b
!	Mem[0000000015000070] = 6eec1fbb, %l7 = ffffffffffffeb00
	ldub	[%i2+0x072],%l7		! %l7 = 000000000000001f
p1_b156:
	membar	#Sync			! Added by membar checker (305)
!	%l3 = ffffffffffffffcb, %l1 = 0000000000000065, %l6 = 00000000a2b95ec9
	sra	%l3,%l1,%l6		! %l6 = fffffffffffffffe
	set	p1_b157,%o7
	fba,a,pn %fcc1,p1_near_1_he	! Branch Taken, %fcc1 = 2
!	%l3 = ffffffffffffffcb, Mem[0000000015000008] = ffffeb00
	stwa	%l3,[%i2+%o6]0x80	! Annulled
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x09d,%g2
p1_b157:
!	Registers modified during the branch to p1_near_1
!	%l0  = 5f7190c3ec00e9bc
!	%l1  = 0000000000000034
!	%l3  = 0000000000000000
!	%l4  = 00000000000000cb
!	%l6  = 0000000000000969

p1_label_143:
	be	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000014000008] = 95ffffff, %l4 = 00000000000000cb
	lduha	[%i0+%o6]0x80,%l4	! %l4 = 00000000000095ff
p1_b158:
	membar	#Sync			! Added by membar checker (306)
!	Mem[0000000014800004] = f81c6679, %l5 = ffffffffffffe2f2
	ldsw	[%i1+0x004],%l5		! %l5 = fffffffff81c6679
!	Mem[000000003100005c] = 702637af, %l3 = 0000000000000000
	ldsw	[%o2+0x05c],%l3		! %l3 = 00000000702637af
!	Mem[0000000030000018] = 000000a2 000000a8, %l4 = 000095ff, %l5 = f81c6679
	ldda	[%o0+0x018]%asi,%l4	! %l4 = 00000000000000a2 00000000000000a8

p1_label_144:
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000015800170] = b35efcc7 e080c83a, %l2 = 13ff1e61, %l3 = 702637af
	ldd	[%i3+0x170],%l2		! %l2 = 00000000b35efcc7 00000000e080c83a
!	Registers modified during the branch to p1_jmpl_0
!	%l1  = 00001411cde7827f
!	%l2  = a08e6f3c13ff1ee3
!	%l3  = 00000000000000e1
!	%l6  = ffffff19f61dae9d
!	%l7  = 0000000193dfc501
!	Mem[0000000017000000] = 8e8921a0, %l0 = 5f7190c3ec00e9bc
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = ffffffff8e8921a0
!	%f2  = 00000000 ad800000, %f20 = 80000000 87560a05
	fabsd	%f2 ,%f20		! %f20 = 00000000 ad800000
!	%f2  = 00000000 ad800000, %f26 = 2fc7ca57 2900bf4a
	fnegd	%f2 ,%f26		! %f26 = 80000000 ad800000

p1_label_145:
!	Mem[0000000031800058] = b35efcc7 e080c83a, %l5 = 00000000000000a8, %l5 = 00000000000000a8
	add	%o3,0x58,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = bcff82bf5b20d8f7
	bgu,a	p1_b159			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[000000001480010b] = 5b09f42d, %l7 = 0000000193dfc501
	ldstub	[%i1+0x10b],%l7		! %l7 = 000000000000002d
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x09f,%g2
p1_b159:
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000030000014] = b8920682, %l2 = a08e6f3c13ff1ee3
	swap	[%o0+0x014],%l2		! Annulled
p1_b160:

p1_label_146:
	membar	#Sync			! Added by membar checker (307)
!	%l0 = ffffffff8e8921a0, immed = 00000652, %y  = ffffff19
	mulx	%l0,0x652,%l5		! %l5 = fffffd32deb68540
!	%f19 = 00000000, %f27 = ad800000, %f25 = 80000000
	fdivs	%f19,%f27,%f25		! %f25 = 80000000
!	Mem[0000000015800000] = 00000000, %l0 = ffffffff8e8921a0
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f24 = 00000000 80000000, %f6  = 41c7ca57 00000000
	fnegd	%f24,%f6 		! %f6  = 80000000 80000000
!	%l5 = fffffd32deb68540, %l5 = fffffd32deb68540, %y  = ffffff19
	sdivx	%l5,%l5,%l2		! %l2 = 0000000000000001

p1_label_147:
!	Mem[000000001500000c] = 52fec6aa, %l4 = 00000000000000a2
	ldsw	[%i2+0x00c],%l4		! %l4 = 0000000052fec6aa
!	%f9  = 80000000, %f6  = 80000000, %f18 = 00000000
	fadds	%f9 ,%f6 ,%f18		! %f18 = 80000000
!	Mem[0000000015000000] = ef3c3706deae7eea, %l3 = 00000000000000e1
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = ef3c3706deae7eea
	fbul,pn	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000015000000] = ef3c3706, %l7 = 000000000000002d
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ef3c3706
p1_b161:

p1_label_148:
	membar	#Sync			! Added by membar checker (308)
!	%f29 = 80000000, %f7  = 80000000, %f3  = ad800000
	fmuls	%f29,%f7 ,%f3 		! %f3  = 00000000
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	%l7 = 00000000ef3c3706, Mem[0000000014000000] = eb000000
	stba	%l7,[%i0+%g0]0x80	! Mem[0000000014000000] = 06000000
p1_b162:
	membar	#Sync			! Added by membar checker (309)
!	Mem[0000000030000050] = ad800000 00000001, %l2 = 0000000000000001, %l7 = 00000000ef3c3706
	add	%o0,0x50,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 8e1e150ce06cc8cf
!	%f2  = 00000000 00000000, %f10 = 2f94ae00 00000000, %f0  = 00000000 00000000
	fdivd	%f2 ,%f10,%f0 		! %f0  = 00000000 00000000

p1_label_149:
!	Mem[000000003080005d] = a3f7e431, %l6 = ffffff19f61dae9d
	ldstub	[%o1+0x05d],%l6		! %l6 = 00000000000000f7
	bcs	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	%l2 = 00000001, %l3 = deae7eea, Mem[0000000030800010] = ffffffaf 42c526d2
	std	%l2,[%o1+0x010]	! Mem[0000000030800010] = 00000001 deae7eea
p1_b163:
	bneg,a	p1_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[00000000150000d8] = d8d17150, %l0 = 0000000000000000
	ldsb	[%i2+0x0db],%l0		! Annulled
p1_b164:

p1_label_150:
	membar	#Sync			! Added by membar checker (310)
!	Mem[0000000014000000] = 06000000, %l7 = 8e1e150ce06cc8cf
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000600
!	%l3 = ef3c3706deae7eea, Mem[0000000031000058] = 1c04d06b702637af
	stx	%l3,[%o2+0x058]		! Mem[0000000031000058] = ef3c3706deae7eea
!	%l6 = 00000000000000f7, immed = fffff028, %l2 = 0000000000000001
	xnorcc	%l6,-0xfd8,%l2		! %l2 = 0000000000000f20, %ccr = 00
!	Mem[0000000031800010] = d5eff6ae, %l1 = 00001411cde7827f
	lduh	[%o3+0x010],%l1		! %l1 = 000000000000d5ef
!	%l5 = fffffd32deb68540, immed = 00000f66, %l2 = 0000000000000f20
	andncc	%l5,0xf66,%l2		! %l2 = fffffd32deb68000, %ccr = 88

p1_label_151:
!	Mem[0000000031000014] = 9dda1af3, %l6 = 00000000000000f7
	ldswa	[%o2+0x014]%asi,%l6	! %l6 = ffffffff9dda1af3
	fbul,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000014000008] = 95ffffff, %l1 = 000000000000d5ef
	lduba	[%i0+%o6]0x80,%l1	! Annulled
p1_b165:
	membar	#Sync			! Added by membar checker (311)
!	Mem[00000000160001a8] = aeb66374, %l5 = fffffd32deb68540
	ldsb	[%i4+0x1a9],%l5		! %l5 = ffffffffffffffb6
!	%l7 = 0000000000000600, %l4 = 0000000052fec6aa, %l1 = 000000000000d5ef
	andn	%l7,%l4,%l1		! %l1 = 0000000000000000

p1_label_152:
!	%f1  = 00000000, %f7  = 80000000
	fitos	%f1 ,%f7 		! %f7  = 00000000
!	%f0  = 00000000 00000000, %f4  = 00000000 00000000
	fdtox	%f0 ,%f4 		! %f4  = 00000000 00000000
!	%l1 = 0000000000000000, %l7 = 0000000000000600, %l0 = 0000000000000000
	srlx	%l1,%l7,%l0		! %l0 = 0000000000000000
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000150001b4] = c33381d3, %l1 = 0000000000000000
	lduw	[%i2+0x1b4],%l1		! Annulled
p1_b166:

p1_label_153:
	membar	#Sync			! Added by membar checker (312)
!	Mem[0000000031800017] = 6d06eba8, %l4 = 0000000052fec6aa
	ldstuba	[%o3+0x017]%asi,%l4	! %l4 = 00000000000000a8
!	%l6 = ffffffff9dda1af3, %l7 = 0000000000000600, %l6 = ffffffff9dda1af3
	xor	%l6,%l7,%l6		! %l6 = ffffffff9dda1cf3
	set	p1_b167,%o7
	fbge,pn	%fcc2,p1_near_3_he	! Branch Taken, %fcc2 = 0
!	%l1 = 0000000000000000, Mem[0000000015000008] = ffffeb00
	stba	%l1,[%i2+%o6]0x80	! Mem[0000000015000008] = 00ffeb00
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x0a7,%g2
p1_b167:
!	Registers modified during the branch to p1_near_3
!	%l5  = 0022baf24c311736
	membar	#Sync			! Added by membar checker (313)
!	Mem[0000000015000008] = 00ffeb00, %l1 = 0000000000000000
	lduba	[%i2+%o6]0x80,%l1	! %l1 = 0000000000000000

p1_label_154:
!	%f10 = 2f94ae00 00000000, %f10 = 2f94ae00 00000000
	fcmpd	%fcc3,%f10,%f10		! %fcc3 = 0
!	%l2 = fffffd32deb68000
	sethi	%hi(0xa74e5000),%l2	! %l2 = 00000000a74e5000
	set	p1_b168,%o7
	fble,pn	%fcc0,p1_near_0_le	! Branch Taken, %fcc0 = 0
!	%l7 = 0000000000000600, Mem[0000000015000008] = 00ffeb00
	stba	%l7,[%i2+%o6]0x80	! Mem[0000000015000008] = 00ffeb00
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x0a8,%g2
p1_b168:
!	Registers modified during the branch to p1_near_0
!	%l5  = 0000000000000ff2
	membar	#Sync			! Added by membar checker (314)
	fbule,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2

p1_label_155:
!	Mem[0000000015000008] = 00ffeb00, %l6 = ffffffff9dda1cf3
	lduha	[%i2+%o6]0x80,%l6	! Annulled
p1_b169:
	fbg,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 0000000000000000, Mem[0000000015000000] = 0000002d
	stwa	%l0,[%i2+%g0]0x80	! Annulled
p1_b170:
	membar	#Sync			! Added by membar checker (315)
!	%f2  = 00000000 00000000, %f10 = 2f94ae00
	fxtos	%f2 ,%f10		! %f10 = 00000000
!	%l2 = 00000000a74e5000, Mem[0000000030000050] = 8e1e150c
	stwa	%l2,[%o0+0x050]%asi	! Mem[0000000030000050] = a74e5000

p1_label_156:
	fbul,a,pn %fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030800054] = ff3c014b, %l7 = 0000000000000600
	lduw	[%o1+0x054],%l7		! Annulled
p1_b171:
	fbu,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91ee121b d7059b63
	prefetch [%o4+0x020],2	! Annulled
p1_b172:
	membar	#Sync			! Added by membar checker (316)
!	Mem[0000000014000000] = 06000000 00000bfd
	flush	%i0+0x000

p1_label_157:
!	%f0  = 00000000, %f16 = 00000000
	fitos	%f0 ,%f16		! %f16 = 00000000
!	Branch On Register, %l1 = 0000000000000000
	brlez,pt %l1,p1_b173		! Branch Taken
!	Mem[0000000015800160] = 5ca37a2d cb10ffc4 feeb7a5b cc8a746a
	prefetch [%i3+0x160],21
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x0ad,%g2
p1_b173:
	membar	#Sync			! Added by membar checker (317)
	fbul,pn	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000150001a0] = a26cc956 3cac00df 80206391 ef53042c
	prefetch [%i2+0x1a0],20
p1_b174:

p1_label_158:
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000030] = 4a9fa039b105dabe, %l0 = 0000000000000000
	ldx	[%o4+0x030],%g2		! %g2 = 4a9fa039b105dabe
p1_b175:
	membar	#Sync			! Added by membar checker (318)
!	Mem[00000000150000cc] = 64ac5427, %l3 = ef3c3706deae7eea
	lduw	[%i2+0x0cc],%l3		! %l3 = 0000000064ac5427
!	%l5 = 0000000000000ff2, %l7 = 0000000000000600, %l4 = 00000000000000a8
	subccc	%l5,%l7,%l4		! %l4 = 00000000000009f2, %ccr = 00
	be,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_159:
!	 Annulled
	ldd	[%i2+0x178],%l2
p1_b176:
	membar	#Sync			! Added by membar checker (319)
	set	p1_b177,%o7
	fbge,a,pn %fcc1,p1_near_1_he	! Branch Taken, %fcc1 = 2
!	%l3 = 0000000064ac5427, Mem[0000000014000000] = 0600000000000bfd
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000014000000] = 0000000064ac5427
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x0b1,%g2
p1_b177:
!	Registers modified during the branch to p1_near_1
!	%l0  = ffffffff58b1a7dd
!	%l1  = ffffffff995208d0
!	%l3  = 0000000000000000
!	%l4  = ffffffff9b53abd8
!	%l6  = ffffffff9952018d
	membar	#Sync			! Added by membar checker (320)
	set	p1_b178,%o7
	fbe,a,pt %fcc3,p1_near_3_le	! Branch Taken, %fcc3 = 0
!	%l2 = 00000000a74e5000, Mem[0000000016800008] = 408b8720
	stba	%l2,[%i5+%o6]0x80	! Mem[0000000016800008] = 008b8720
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x0b2,%g2
p1_b178:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000000

p1_label_160:
	membar	#Sync			! Added by membar checker (321)
!	%f18 = 80000000 00000000, %f10 = 00000000 00000000, %f18 = 80000000 00000000
	faddd	%f18,%f10,%f18		! %f18 = 00000000 00000000
!	Mem[0000000030800014] = deae7eea, %l6 = ffffffff9952018d
	lduwa	[%o1+0x014]%asi,%l6	! %l6 = 00000000deae7eea
	fbu,pt	%fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91ee121b d7059b63
	prefetch [%o4+0x020],21
p1_b179:
	membar	#Sync			! Added by membar checker (322)
!	%f9  = 80000000, %f24 = 00000000
	fcmps	%fcc0,%f9 ,%f24		! %fcc0 = 0

p1_label_161:
!	%l3 = 0000000000000000, immed = fffffd1a, %l6 = 00000000deae7eea
	and	%l3,-0x2e6,%l6		! %l6 = 0000000000000000
!	%l1 = ffffffff995208d0, %l1 = ffffffff995208d0, %l0 = ffffffff58b1a7dd
	andncc	%l1,%l1,%l0		! %l0 = 0000000000000000, %ccr = 44
!	%l0 = 0000000000000000
	setx	0x4839495548394955,%g7,%l0 ! %l0 = 4839495548394955
!	Mem[00000000148000c0] = 4c018785 03fdccf1
	flush	%i1+0x0c0
!	%l5 = 0000000000000ff2, immed = 0000001e, %l6 = 0000000000000000
	sllx	%l5,0x01e,%l6		! %l6 = 000003fc80000000

p1_label_162:
!	%l3 = 0000000000000000, immed = 00000989, %l7 = 0000000000000600
	subccc	%l3,0x989,%l7		! %l7 = fffffffffffff677, %ccr = 99
	set	p1_b180,%o7
	fbge,pt	%fcc3,p1_near_0_he	! Branch Taken, %fcc3 = 0
!	Mem[0000000040000018] = 1e37250f, %l3 = 0000000000000000
	lduw	[%o5+0x018],%l3		! %l3 = 000000001e37250f
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x0b4,%g2
p1_b180:
!	Registers modified during the branch to p1_near_0
!	%l0  = 0000000000000000
!	%l1  = ffffff7680000000
!	%l3  = ffffffffe1c8daf0
!	%l4  = ffffffff9b53a250
	membar	#Sync			! Added by membar checker (323)
!	%l5 = 0000000000000ff2, Mem[000000003200001c] = cab2b442
	stw	%l5,[%o4+0x01c]		! Mem[000000003200001c] = 00000ff2
!	Branch On Register, %l3 = ffffffffe1c8daf0
	brz,a,pn %l3,p1_not_taken_0	! Branch Not Taken

p1_label_163:
!	Mem[0000000015800000] = 8e8921a077805240, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l2	! Annulled
p1_b181:
	membar	#Sync			! Added by membar checker (324)
!	%f0  = 00000000 00000000, %f0  = 00000000 00000000
	fcmpd	%fcc3,%f0 ,%f0 		! %fcc3 = 0
!	%l2 = 0000000000000000, immed = fffffdfb, %l5 = 0000000000000ff2
	andn	%l2,-0x205,%l5		! %l5 = 0000000000000000
!	%f24 = 00000000 80000000, %f16 = 00000000 00000000
	fmovd	%f24,%f16		! %f16 = 00000000 80000000
!	%f12 = 00000000 00000001, %f16 = 00000000 80000000
	fabsd	%f12,%f16		! %f16 = 00000000 00000001

p1_label_164:
!	Mem[0000000015000000] = 0000002d deae7eea, %l0 = 00000000, %l1 = 80000000
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 000000000000002d 00000000deae7eea
!	%l5 = 0000000000000000, immed = 00000be6, %l3 = ffffffffe1c8daf0
	addccc	%l5,0xbe6,%l3		! %l3 = 0000000000000be6, %ccr = 00
!	%f17 = 00000001, %f6  = 80000000
	fmovs	%f17,%f6 		! %f6  = 00000001
!	%f0  = 00000000 00000000, %f0  = 00000000 00000000
	fxtod	%f0 ,%f0 		! %f0  = 00000000 00000000
!	%f2  = 00000000 00000000, %f2  = 00000000 00000000
	fcmpd	%fcc0,%f2 ,%f2 		! %fcc0 = 0

p1_label_165:
	nop				! Delay added due to fcmp
	set	p1_b182,%o7
	fbne,pt	%fcc1,p1_near_1_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000014800100] = 05ea772a fb73fbfe 5b09f4ff 7136271a
	prefetch [%i1+0x100],23
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x0b6,%g2
p1_b182:
!	Registers modified during the branch to p1_near_1
!	%l0  = fffffffffffff7dd
!	%l1  = 000003fc80000000
!	%l3  = 0000000000000001
!	%l4  = fffffffffffff434
!	%l6  = 000003fc8000095d
	membar	#Sync			! Added by membar checker (325)
!	%f17 = 00000001, %f1  = 00000000
	fnegs	%f17,%f1 		! %f1  = 80000001
!	%f5  = 00000000, %f18 = 00000000
	fmovs	%f5 ,%f18		! %f18 = 00000000
!	Mem[0000000015800020] = ffffffff ffffeb00 81f8af23 e3fbc38e
	prefetch [%i3+0x020],21

p1_label_166:
	fbne,pt	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000015000008] = 00ffeb00, %l0 = fffffffffffff7dd
	ldsha	[%i2+%o6]0x80,%l0	! %l0 = 00000000000000ff
p1_b183:
	membar	#Sync			! Added by membar checker (326)
!	%l0 = 00000000000000ff, immed = 00000018, %l5 = 0000000000000000
	sll	%l0,0x018,%l5		! %l5 = 00000000ff000000
!	%l0 = 00000000000000ff, Mem[0000000014000008] = 95ffffff6d06eba8
	stxa	%l0,[%i0+%o6]0x80	! Mem[0000000014000008] = 00000000000000ff
!	%l1 = 000003fc80000000, Mem[0000000014000114] = 3be9a8ff
	stba	%l1,[%i0+0x114]%asi	! Mem[0000000014000114] = 00e9a8ff

p1_label_167:
!	Mem[0000000014000000] = 00000000, %l4 = fffffffffffff434
	lduba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
	set	p1_b184,%o7
	fble,pn	%fcc2,p1_near_1_he	! Branch Taken, %fcc2 = 0
!	%l7 = fffffffffffff677, Mem[0000000032000058] = 670cfb3e213ac54e
	stx	%l7,[%o4+0x058]		! Mem[0000000032000058] = fffffffffffff677
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x0b8,%g2
p1_b184:
!	Registers modified during the branch to p1_near_1
!	%l0  = fffffffffffff7dd
!	%l1  = 000003fc8000095c
!	%l3  = 0000000000000001
!	%l4  = ffffffffffffff01
!	%l6  = 000003fc80000001
	membar	#Sync			! Added by membar checker (327)
!	Mem[00000000148001c0] = d3927625 561cbeb0 48898f5c df861d73
	prefetcha [%i1+0x1c0]%asi,1
!	Mem[0000000015000040] = a50ee9fc 9bf6a520 f81ceb9b a22363e7
	prefetcha [%i2+0x040]%asi,3

p1_label_168:
	set	p1_b185,%o7
	fbne,a,pn %fcc1,p1_near_3_le	! Branch Taken, %fcc1 = 2
!	%l0 = fffffffffffff7dd, Mem[0000000014000000] = 0000000064ac5427
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000014000000] = fffffffffffff7dd
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x0b9,%g2
p1_b185:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000000
	bgu,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	%l2 = 00000000, %l3 = 00000001, Mem[0000000015000000] = 0000002d deae7eea
	stda	%l2,[%i2+%g0]0x80	! Annulled
p1_b186:
	membar	#Sync			! Added by membar checker (328)
!	Mem[0000000015800008] = 00000000, %l3 = 0000000000000001
	ldstuba	[%i3+%o6]0x80,%l3	! %l3 = 0000000000000000

p1_label_169:
!	%l6 = 000003fc80000001
	setx	0xcc9cc85bcc9cc85b,%g7,%l6 ! %l6 = cc9cc85bcc9cc85b
	fbne,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000014800008] = 00000000, %l4 = ffffffffffffff01
	ldstuba	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
p1_b187:
	membar	#Sync			! Added by membar checker (329)
!	%l5 = 00000000ff000000, %l3 = 0000000000000000, %l0 = fffffffffffff7dd
	subc	%l5,%l3,%l0		! %l0 = 00000000ff000000
	bne,a	p1_not_taken_0		! Branch Not Taken, %ccr = 44

p1_label_170:
!	%l7 = fffffffffffff677, Mem[0000000014800094] = 6c870c4c
	stw	%l7,[%i1+0x094]		! Annulled
p1_b188:
	membar	#Sync			! Added by membar checker (330)
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000032000008] = e83b01bf 5e030bdd
	stda	%l4,[%o4+0x008]%asi	! Mem[0000000032000008] = 00000000 ff000000
!	Mem[0000000015000014] = 3b5b7023, %l2 = 0000000000000000
	ldsw	[%i2+0x014],%l2		! %l2 = 000000003b5b7023
!	%f5  = 00000000, %f28 = 00000000
	fcmps	%fcc3,%f5 ,%f28		! %fcc3 = 0
!	Mem[0000000015000180] = 360e2322 263f6940
	flush	%i2+0x180

p1_label_171:
!	%l1 = 000003fc8000095c, immed = 0000000f, %l3 = 0000000000000000
	srlx	%l1,0x00f,%l3		! %l3 = 0000000007f90000
!	Mem[0000000014800000] = 6d8f5f73 f81c6679, %l0 = ff000000, %l1 = 8000095c
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 000000006d8f5f73 00000000f81c6679
!	%f24 = 00000000, %f17 = 00000001
	fnegs	%f24,%f17		! %f17 = 80000000
!	%l1 = 00000000f81c6679, %l4 = 0000000000000000, %l6 = cc9cc85bcc9cc85b
	sub	%l1,%l4,%l6		! %l6 = 00000000f81c6679
	set	p1_b189,%o7
	fbuge,pn %fcc1,p1_near_2_he	! Branch Taken, %fcc1 = 2

p1_label_172:
!	Mem[0000000031000018] = 85a23156, %l2 = 000000003b5b7023
	ldsh	[%o2+0x01a],%l2		! %l2 = 0000000000003156
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x0bd,%g2
p1_b189:
!	Registers modified during the branch to p1_near_2
!	%l2  = 00000855a2000000
	membar	#Sync			! Added by membar checker (331)
!	%f2  = 00000000 00000000, %f2  = 00000000 00000000
	fcmped	%fcc3,%f2 ,%f2 		! %fcc3 = 0
!	Mem[0000000014800008] = ff000000, %l2 = 00000855a2000000
	lduba	[%i1+%o6]0x80,%l2	! %l2 = 00000000000000ff
	set	p1_b190,%o7
	fbug,pt	%fcc1,p1_near_3_le	! Branch Taken, %fcc1 = 2
!	%l5 = 00000000ff000000, Mem[000000001480001c] = b9863556
	sth	%l5,[%i1+0x01c]		! Mem[000000001480001c] = 00003556
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x0be,%g2
p1_b190:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000086

p1_label_173:
	membar	#Sync			! Added by membar checker (332)
!	%l1 = 00000000f81c6679, immed = 00000915, %l7 = fffffffffffff677
	xnor	%l1,0x915,%l7		! %l7 = ffffffff07e39093
!	Mem[00000000158001e0] = 5bd1fde3 a2053cb9 2c15bd25 0d976602
	prefetcha [%i3+0x1e0]%asi,0
!	%l5 = 00000000ff000000, immed = 000004de, %l0 = 000000006d8f5f73
	add	%l5,0x4de,%l0		! %l0 = 00000000ff0004de
!	%l1 = 00000000f81c6679, Mem[0000000014800087] = 07cd0d1d
	stba	%l1,[%i1+0x087]%asi	! Mem[0000000014800084] = 07cd0d79
!	%f30 = 80000000 00000000, %f12 = 00000000 00000001
	fnegd	%f30,%f12		! %f12 = 00000000 00000000

p1_label_174:
!	Denormal Floating Point Operation Nullified
	nop
!	%f25 = 80000000, %f27 = ad800000, %f18 = 00000000
	fdivs	%f25,%f27,%f18		! %f18 = 00000000
!	%f11 = 00000000, %f20 = 00000000 ad800000
	fitod	%f11,%f20		! %f20 = 00000000 00000000
!	%f12 = 00000000, %f5  = 00000000, %f27 = ad800000
	fsubs	%f12,%f5 ,%f27		! %f27 = 00000000
!	Mem[0000000016800080] = 4f30dffd 3dde0dbe 4f2a3d37 1f6ed7f0
	prefetcha [%i5+0x080]%asi,0

p1_label_175:
!	%l2 = 0000000000000086, %l5 = 00000000ff000000, %l3 = 0000000007f90000
	orncc	%l2,%l5,%l3		! %l3 = ffffffff00ffffff, %ccr = 80
!	%l0 = ff0004de, %l1 = f81c6679, Mem[0000000031800050] = 71c5778e ffc5778e
	std	%l0,[%o3+0x050]	! Mem[0000000031800050] = ff0004de f81c6679
!	%f14 = 00000000, %f26 = 80000000
	fabss	%f14,%f26		! %f26 = 00000000
!	%l0 = 00000000ff0004de, %l7 = ffffffff07e39093, %l7 = ffffffff07e39093
	xorcc	%l0,%l7,%l7		! %l7 = fffffffff8e3944d, %ccr = 88
!	Mem[0000000015800060] = 71908522 e057ea00 921a40bb d7db1079
	prefetch [%i3+0x060],1

p1_label_176:
!	%l3 = ffffffff00ffffff, %l2 = 0000000000000086, %l2 = 0000000000000086
	xorcc	%l3,%l2,%l2		! %l2 = ffffffff00ffff79, %ccr = 80
!	Branch On Register, %l6 = 00000000f81c6679
	brlz,pn	%l6,p1_not_taken_0	! Branch Not Taken
!	Mem[0000000014800000] = 6d8f5f73, %l5 = 00000000ff000000
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 000000006d8f5f73
p1_b191:
	membar	#Sync			! Added by membar checker (333)
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l0 = 00000000ff0004de
	sub	%l4,%l4,%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000014800000] = 6d8f5f73
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000014800000] = 00000000

p1_label_177:
!	%f2  = 00000000, %f8  = 00000000 80000000
	fitod	%f2 ,%f8 		! %f8  = 00000000 00000000
	fble,pt	%fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[00000000140001c0] = 33d3315c 03000ab4 320c241d 48f1469d
	prefetch [%i0+0x1c0],20
p1_b192:
	membar	#Sync			! Added by membar checker (334)
!	%f20 = 00000000 00000000, %f8  = 00000000 00000000
	fcmpd	%fcc0,%f20,%f8 		! %fcc0 = 0
!	call to call_0, CWP = 0
	call	p1_call_0_le

p1_label_178:
!	%l2 = 00ffff79, %l3 = 00ffffff, Mem[0000000014000008] = 00000000 000000ff
	stda	%l2,[%i0+%o6]0x80	! Mem[0000000014000008] = 00ffff79 00ffffff
!	Registers modified during the branch to p1_call_0
!	%l0  = 0000000000000000
!	%l3 = ffffffff00ffffff, %l6 = 00000000f81c6679, %l5 = 000000006d8f5f73
	taddcc	%l3,%l6,%l5		! %l5 = fffffffff91c6678, %ccr = 8a
	set	p1_b193,%o7
	fbue	p1_far_1_he	! Branch Taken, %fcc0 = 0
!	%l4 = 0000000000000000, Mem[0000000015800158] = 09eb1af77a77d8bb
	stx	%l4,[%i3+0x158]		! Mem[0000000015800158] = 0000000000000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x0c1,%g2
p1_b193:
!	Registers modified during the branch to p1_far_1
!	%l2  = 00000000f81c63fe
!	%l5  = ffffffffffffff81
	set	p1_b194,%o7
	fbe,a	p1_far_1_le	! Branch Taken, %fcc0 = 0

p1_label_179:
!	Mem[0000000015000000] = 0000002d deae7eea, %l6 = f81c6679, %l7 = f8e3944d
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 000000000000002d 00000000deae7eea
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x0c2,%g2
p1_b194:
!	Registers modified during the branch to p1_far_1
!	%l1  = 00000009b2a88481
!	%l3  = ffffffff00fff6fb
!	%l5  = 000000003fffffff
!	%l6  = 0000000000000029
	set	p1_b195,%o7
	fbuge	p1_far_3_he	! Branch Taken, %fcc0 = 0
!	%l3 = ffffffff00fff6fb, Mem[0000000016800080] = 4f30dffd
	sth	%l3,[%i5+0x080]		! Mem[0000000016800080] = f6fbdffd
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p1_branch_failed
	mov	0x0c3,%g2
p1_b195:
!	Registers modified during the branch to p1_far_3
!	%l6  = 0000000040000355
	bge	p1_b196			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000015000008] = 00ffeb00, %l1 = 00000009b2a88481
	ldswa	[%i2+%o6]0x80,%l1	! %l1 = 0000000000ffeb00
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x0c4,%g2
p1_b196:

p1_label_180:
	membar	#Sync			! Added by membar checker (335)
!	%f2  = 00000000, %f18 = 00000000 00000000
	fitod	%f2 ,%f18		! %f18 = 00000000 00000000
	bg,a	p1_b197			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000015000128] = 7b37fa95 36b3370a, %l4 = 00000000, %l5 = 3fffffff
	ldd	[%i2+0x128],%l4		! %l4 = 000000007b37fa95 0000000036b3370a
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p1_branch_failed
	mov	0x0c5,%g2
p1_b197:
	membar	#Sync			! Added by membar checker (336)
!	Mem[00000000150001c0] = 00000000 36b3370a, %l5 = 0000000036b3370a, %l6 = 0000000040000355
	add	%i2,0x1c0,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 17db2647661cd93c
!	%l4 = 7b37fa95, %l5 = 36b3370a, Mem[00000000160001a8] = aeb66374 21f130c9
	std	%l4,[%i4+0x1a8]	! Mem[00000000160001a8] = 7b37fa95 36b3370a

p1_label_181:
!	%f21 = 00000000, %f8  = 00000000
	fcmps	%fcc3,%f21,%f8 		! %fcc3 = 0
!	Mem[0000000014000030] = ca1c3065, %l2 = 00000000f81c63fe
	ldsb	[%i0+0x033],%l2		! %l2 = 0000000000000065
	fbne,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000056] = e06cc8cf, %l7 = 00000000deae7eea
	ldstub	[%o0+0x056],%l7		! Annulled
p1_b198:
	membar	#Sync			! Added by membar checker (337)
!	%l1 = 0000000000ffeb00, immed = 00000034, %l2 = 0000000000000065
	srax	%l1,0x034,%l2		! %l2 = 0000000000000000

p1_label_182:
!	%l7 = 00000000deae7eea, immed = 00000617, %y  = 00000009
	umulcc	%l7,0x617,%l2		! %l2 = 0000054c18a6e306, %ccr = 00
!	%l6 = 17db2647661cd93c, Mem[0000000014000008] = 00ffff79
	stha	%l6,[%i0+%o6]0x80	! Mem[0000000014000008] = d93cff79
!	Mem[0000000031000050] = 4c2226d7, %l7 = 00000000deae7eea
	ldsw	[%o2+0x050],%l7		! %l7 = 000000004c2226d7
!	Mem[0000000016000000] = 00ff287f8f801a54, %l6 = 17db2647661cd93c
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = 00ff287f8f801a54
!	Jump to jmpl_1, CWP = 0
	set	p1_jmpl_1_he,%g1
	jmpl	%g1,%g6

p1_label_183:
!	Mem[00000000158000c0] = 262a05e5 c024f369 abb8632b 04107e2b
	prefetch [%i3+0x0c0],0
!	Registers modified during the branch to p1_jmpl_1
!	%l0  = 0000000081f8af23
!	%l1  = 0000000000139e4a
!	%l3  = 0000054c18a6f28b
!	%l4  = 00000000000000a2
	bvs,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000003080005c] = a3ffe431, %l1 = 0000000000139e4a
	lduh	[%o1+0x05e],%l1		! Annulled
p1_b199:
	bg	p1_b200			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000015800000] = 8e8921a0, %l7 = 000000004c2226d7
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000000000008e
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p1_branch_failed
	mov	0x0c8,%g2
p1_b200:

p1_label_184:
	membar	#Sync			! Added by membar checker (338)
!	%l2 = 0000054c18a6e306, immed = fffff76d, %l0 = 0000000081f8af23
	orn	%l2,-0x893,%l0		! %l0 = 0000054c18a6eb96
	fbu,a,pt %fcc1,p1_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000015800000] = ff8921a077805240, %l7 = 000000000000008e
	ldxa	[%i3+%g0]0x80,%l7	! Annulled
p1_b201:
	membar	#Sync			! Added by membar checker (339)
	fbul,a,pn %fcc3,p1_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000015000000] = 0000002d, %l5 = 0000000036b3370a
	ldsha	[%i2+%g0]0x80,%l5	! Annulled
p1_b202:

p1_label_185:
	membar	#Sync			! Added by membar checker (340)
!	%l4 = 00000000000000a2, immed = 00000533, %y  = 0000054c
	sdivx	%l4,0x533,%l0		! %l0 = 0000000000000000
!	%l6 = 00ff287f8f801a54, %l3 = 0000054c18a6f28b, %y  = 0000054c
	udivcc	%l6,%l3,%l2		! %l2 = 0000000000003707, %ccr = 00
!	Mem[00000000148001e8] = 54021528, %l6 = 00ff287f8f801a54
	lduh	[%i1+0x1ea],%l6		! %l6 = 0000000000001528
!	%l2 = 0000000000003707, immed = 00000032, %l2 = 0000000000003707
	srax	%l2,0x032,%l2		! %l2 = 0000000000000000
	bn	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_186:
!	Mem[0000000014000008] = d93cff79, %l3 = 0000054c18a6f28b
	lduha	[%i0+%o6]0x80,%l3	! %l3 = 000000000000d93c
p1_b203:
	membar	#Sync			! Added by membar checker (341)
	fbul,a,pn %fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000032000018] = efcb548a, %l6 = 0000000000001528
	ldsh	[%o4+0x018],%g2		! Annulled
p1_b204:
	membar	#Sync			! Added by membar checker (342)
	fbg,pn	%fcc2,p1_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[00000000140000fc] = 6388a1e4, %l0 = 0000000000000000
	ldsw	[%i0+0x0fc],%l0		! %l0 = 000000006388a1e4
p1_b205:

p1_label_187:
	fbul,a	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000140001a0] = fe516877 d08e1bf7 81d630fc ca31da59
	prefetch [%i0+0x1a0],20	! Annulled
p1_b206:
	membar	#Sync			! Added by membar checker (343)
!	Mem[000000003080005c] = a3ffe431, %l3 = 000000000000d93c
	ldswa	[%o1+0x05c]%asi,%l3	! %l3 = ffffffffa3ffe431
!	Mem[0000000015800170] = b35efcc7e080c83a, %l1 = 0000000000139e4a
	ldx	[%i3+0x170],%l1		! %l1 = b35efcc7e080c83a
	bn,a	p1_not_taken_0		! Branch Not Taken, %ccr = 00

p1_label_188:
!	Mem[0000000031000054] = 6150e66d, %l6 = 0000000000001528
	ldsh	[%o2+0x056],%l6		! Annulled
p1_b207:
	membar	#Sync			! Added by membar checker (344)
!	%l0 = 000000006388a1e4, %l6 = 0000000000001528, %y  = 0000054c
	smul	%l0,%l6,%l7		! %l7 = 00000839c2a0ffa0
!	%l1 = b35efcc7e080c83a, %l5 = 0000000036b3370a, %l1 = b35efcc7e080c83a
	subc	%l1,%l5,%l1		! %l1 = b35efcc7a9cd9130
!	Mem[0000000015000008] = 00ffeb00, %l0 = 000000006388a1e4
	ldstuba	[%i2+%o6]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 000000a2, %l5 = 36b3370a, Mem[0000000032000050] = b23d4e8d 2dda7a06
	stda	%l4,[%o4+0x050]%asi	! Mem[0000000032000050] = 000000a2 36b3370a

p1_label_189:
!	Mem[000000001500012c] = 36b3370a, %l0 = 0000000000000000
	lduh	[%i2+0x12c],%l0		! %l0 = 00000000000036b3
!	Mem[000000003180001f] = f925b7d6, %l3 = ffffffffa3ffe431
	ldstub	[%o3+0x01f],%l3		! %l3 = 00000000000000d6
!	%l7 = 00000839c2a0ffa0, %l3 = 00000000000000d6, %y  = 00000839
	udivx	%l7,%l3,%l0		! %l0 = 00000009d70a528a
!	%l0 = 00000009d70a528a, %l2 = 0000000000000000, %l2 = 0000000000000000
	addc	%l0,%l2,%l2		! %l2 = 00000009d70a528a
!	%l2 = 00000009d70a528a, Mem[00000000158001e8] = 2c15bd25
	stw	%l2,[%i3+0x1e8]		! Mem[00000000158001e8] = d70a528a

p1_label_190:
!	%l0 = 00000009d70a528a, immed = 00000805, %y  = 00000839
	udiv	%l0,0x805,%l7		! %l7 = 00000000ffffffff
!	%l4 = 00000000000000a2, immed = fffffc5d, %y  = 00000839
	umul	%l4,-0x3a3,%l7		! %l7 = 000000a1fffdb2da
!	%l2 = 00000009d70a528a, Mem[0000000015800008] = ff000000
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000015800008] = 528a0000
!	%l5 = 0000000036b3370a, immed = 00000575, %l7 = 000000a1fffdb2da
	addcc	%l5,0x575,%l7		! %l7 = 0000000036b33c7f, %ccr = 00
!	Mem[0000000015000148] = 12ba0439, %l7 = 0000000036b33c7f
	ldsw	[%i2+0x148],%l7		! %l7 = 0000000012ba0439

p1_label_191:
!	Mem[0000000015800078] = f4c9122f06890894, %l5 = 0000000036b3370a
	ldxa	[%i3+0x078]%asi,%l5	! %l5 = f4c9122f06890894
	set	p1_b208,%o7
	fbuge,pn %fcc2,p1_near_2_he	! Branch Taken, %fcc2 = 0
!	Mem[0000000015000000] = 0000002d deae7eea ffffeb00 52fec6aa
	prefetch [%i2+0x000],3
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x0d0,%g2
p1_b208:
!	Registers modified during the branch to p1_near_2
!	%l2  = 00000036ae95c658
	membar	#Sync			! Added by membar checker (345)
	set	p1_b209,%o7
	fbe,pt	%fcc3,p1_near_0_le	! Branch Taken, %fcc3 = 0
!	%l0 = 00000009d70a528a, Mem[0000000015800008] = 528a0000
	stha	%l0,[%i3+%o6]0x80	! Mem[0000000015800008] = 528a0000
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x0d1,%g2
p1_b209:
!	Registers modified during the branch to p1_near_0
!	%l5  = 0000000012ba0dcb

p1_label_192:
	fblg	%fcc0,p1_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000015000140] = 09fa6b2b 934f9e7e 12ba0439 f1aeb320
	prefetch [%i2+0x140],16
p1_b210:
	membar	#Sync			! Added by membar checker (346)
!	Mem[0000000032000068] = cbb08000, %l7 = 0000000012ba0439
	ldswa	[%o4+0x068]%asi,%g2	! %g2 = 0000000012ba0439
!	%l3 = 00000000000000d6, immed = 0000022b, %y  = 00000036
	smulcc	%l3,0x22b,%l0		! %l0 = 000000000001cff2, %ccr = 00
!	Mem[000000001480015a] = b5f243a4, %l5 = 0000000012ba0dcb
	ldstub	[%i1+0x15a],%l5		! %l5 = 0000000000000043

p1_label_193:
!	%f8  = 00000000 00000000, %f24 = 00000000
	fdtos	%f8 ,%f24		! %f24 = 00000000
	set	p1_b211,%o7
	fbuge,pn %fcc2,p1_near_1_he	! Branch Taken, %fcc2 = 0
!	%l2 = 00000036ae95c658, Mem[00000000140001d8] = d2b3e7032aa2efd2
	stx	%l2,[%i0+0x1d8]		! Mem[00000000140001d8] = 00000036ae95c658
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p1_branch_failed
	mov	0x0d3,%g2
p1_b211:
!	Registers modified during the branch to p1_near_1
!	%l0  = ffffffc9516a3185
!	%l1  = 0000000000001528
!	%l3  = 0000000000000000
!	%l4  = fffffffffffe30db
!	%l6  = 0000000000001c75
	membar	#Sync			! Added by membar checker (347)
!	%l1 = 0000000000001528, immed = 00000fde, %y  = 00000000
	umulcc	%l1,0xfde,%l6		! %l6 = 00000000014fb0b0, %ccr = 00
!	%f10 = 00000000 00000000, %f23 = 00000000
	fxtos	%f10,%f23		! %f23 = 00000000

p1_label_194:
!	Mem[00000000140000e0] = e85120df 913403c8 43ae6dde d810544d
	prefetcha [%i0+0x0e0]%asi,22
!	%l6 = 00000000014fb0b0, %l2 = 00000036ae95c658, %l6 = 00000000014fb0b0
	andcc	%l6,%l2,%l6		! %l6 = 0000000000058010, %ccr = 00
!	%l4 = fffffffffffe30db, %l5 = 0000000000000043, %l5 = 0000000000000043
	sllx	%l4,%l5,%l5		! %l5 = fffffffffff186d8
!	%f12 = 00000000 00000000, %f9  = 00000000
	fdtos	%f12,%f9 		! %f9  = 00000000
	set	p1_b212,%o7
	fble,pn	%fcc0,p1_near_3_le	! Branch Taken, %fcc0 = 0

p1_label_195:
!	%l4 = fffffffffffe30db, Mem[0000000031800054] = f81c6679
	stw	%l4,[%o3+0x054]		! Mem[0000000031800054] = fffe30db
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p1_branch_failed
	mov	0x0d4,%g2
p1_b212:
!	Registers modified during the branch to p1_near_3
!	%l2  = 0000000000000600
	set	p1_b213,%o7
	fba,a	p1_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000000] = a19e01fc 8c995a0d 00000000 ff000000
	prefetch [%o4+0x000],3	! Annulled
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p1_branch_failed
	mov	0x0d5,%g2
p1_b213:
!	Registers modified during the branch to p1_far_0
!	%l1  = 0000000000607ddb
!	%l2  = fffffffffffff402
!	%l6  = 0000000000000000
!	%l7  = 0000000000000061
	membar	#Sync			! Added by membar checker (348)
!	%f10 = 00000000, %f13 = 00000000, %f24 = 00000000
	fadds	%f10,%f13,%f24		! %f24 = 00000000
!	%f7  = 00000000, %f13 = 00000000, %f2  = 00000000
	fadds	%f7 ,%f13,%f2 		! %f2  = 00000000

p1_label_196:
!	%l7 = 0000000000000061, Mem[00000000150001cc] = 19be2848
	stwa	%l7,[%i2+0x1cc]%asi	! Mem[00000000150001cc] = 00000061
!	%l7 = 0000000000000061, immed = 000007b6, %l2 = fffffffffffff402
	orncc	%l7,0x7b6,%l2		! %l2 = fffffffffffff869, %ccr = 88
!	Mem[000000003100001c] = 0000d8f7, %l5 = fffffffffff186d8
	ldsw	[%o2+0x01c],%l5		! %l5 = 000000000000d8f7
!	%l6 = 0000000000000000, Mem[000000001580008d] = 65adfcd3
	stb	%l6,[%i3+0x08d]		! Mem[000000001580008c] = 6500fcd3
!	%l5 = 000000000000d8f7, Mem[0000000015800000] = ff8921a0
	stba	%l5,[%i3+%g0]0x80	! Mem[0000000015800000] = f78921a0

p1_label_197:
!	Mem[0000000014000000] = ffffffff, %l5 = 000000000000d8f7
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Branch On Register, %l1 = 0000000000607ddb
	brgez,a,pn %l1,p1_b214		! Branch Taken
!	Mem[0000000015800008] = 528a0000, %l4 = fffffffffffe30db
	ldstuba	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000052
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p1_branch_failed
	mov	0x0d6,%g2
p1_b214:
	membar	#Sync			! Added by membar checker (349)
	set	p1_b215,%o7
	fbuge,a,pn %fcc1,p1_near_1_he	! Branch Taken, %fcc1 = 2
!	Mem[0000000015800000] = f78921a0, %l4 = 0000000000000052
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000f789
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p1_branch_failed
	mov	0x0d7,%g2
p1_b215:
!	Registers modified during the branch to p1_near_1
!	%l0  = 0000000000000fb4
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l4  = 00000036ae95ce7a
!	%l6  = 000000000000095d

p1_label_198:
	membar	#Sync			! Added by membar checker (350)
!	%l0 = 0000000000000fb4, immed = 00000000, %l3 = 0000000000000000
	sra	%l0,0x000,%l3		! %l3 = 0000000000000fb4
!	%l0 = 0000000000000fb4, %l1 = 0000000000000000, %l7 = 0000000000000061
	xor	%l0,%l1,%l7		! %l7 = 0000000000000fb4
!	%f26 = 00000000 00000000, %f0  = 00000000 80000001
	fdtox	%f26,%f0 		! %f0  = 00000000 00000000
!	%l3 = 0000000000000fb4, immed = 00000870, %l3 = 0000000000000fb4
	xnor	%l3,0x870,%l3		! %l3 = fffffffffffff83b
!	%l3 = fffffffffffff83b, %l3 = fffffffffffff83b, %l5 = ffffffffffffffff
	srl	%l3,%l3,%l5		! %l5 = 000000000000001f

p1_label_199:
!	%l1 = 0000000000000000, Mem[0000000031800016] = 6d06ebff
	sth	%l1,[%o3+0x016]		! Mem[0000000031800014] = 6d060000
!	%l7 = 0000000000000fb4, immed = fffff144, %l7 = 0000000000000fb4
	andcc	%l7,-0xebc,%l7		! %l7 = 0000000000000104, %ccr = 00
!	%f12 = 00000000, %f10 = 00000000, %f17 = 80000000
	fsubs	%f12,%f10,%f17		! %f17 = 00000000
!	%f0  = 00000000 00000000, %f20 = 00000000 00000000, %f12 = 00000000 00000000
	fsubd	%f0 ,%f20,%f12		! %f12 = 00000000 00000000
!	Jump to jmpl_0, CWP = 0
	set	p1_jmpl_0_he,%g1
	jmpl	%g1,%g6

p1_label_200:
!	Mem[0000000031800050] = ff0004de, %l0 = 0000000000000fb4
	swap	[%o3+0x050],%l0		! %l0 = 00000000ff0004de
!	Registers modified during the branch to p1_jmpl_0
!	%l0  = 0000000000000000
!	%l2  = 000000005b20d8f7
!	Mem[0000000015000122] = b581b50d, %l4 = 00000036ae95ce7a
	ldstuba	[%i2+0x122]%asi,%l4	! %l4 = 00000000000000b5
!	%l5 = 000000000000001f, %l3 = fffffffffffff83b, %l5 = 000000000000001f
	sub	%l5,%l3,%l5		! %l5 = 00000000000007e4
	bg	p1_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000014000000] = ffffffff, %l2 = 000000005b20d8f7
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
	nop
p1_b216:
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
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p1_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne,a,pn %xcc,p1_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be fffffffffffff83b
	bne,a,pn %xcc,p1_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000b5
	bne,a,pn %xcc,p1_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000007e4
	bne,a,pn %xcc,p1_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000095d
	bne,a,pn %xcc,p1_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000104
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
	cmp	%l0,%l1			! %f4  should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000001 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 00000000
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
	cmp	%l0,%l1			! %f12 should be 00000000 00000000
	bne,a,pn	%xcc,p1_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000001
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
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
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
	cmp	%l0,%l1			! %f28 should be 00000000 80000000
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
	ldx	[%g1+0x000],%g2		! Expect data = fffffffffffff7dd
	ldx	[%i0+0x000],%g3		! Observed data at 0000000014000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = d93cff7900ffffff
	ldx	[%i0+0x008],%g3		! Observed data at 0000000014000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x090],%g2		! Expect data = ff2b93fa49a224aa
	ldx	[%i0+0x090],%g3		! Observed data at 0000000014000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x110],%g2		! Expect data = 26faa4db00e9a8ff
	ldx	[%i0+0x110],%g3		! Observed data at 0000000014000110
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 2811115e8c804956
	ldx	[%i0+0x120],%g3		! Observed data at 0000000014000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = fffffffffffff83b
	ldx	[%i0+0x1d0],%g3		! Observed data at 00000000140001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = 00000036ae95c658
	ldx	[%i0+0x1d8],%g3		! Observed data at 00000000140001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d8,%g4

	set	p1_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000f81c6679
	ldx	[%i1+0x000],%g3		! Observed data at 0000000014800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff0000000000d8f7
	ldx	[%i1+0x008],%g3		! Observed data at 0000000014800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 171a054300003556
	ldx	[%i1+0x018],%g3		! Observed data at 0000000014800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x038],%g2		! Expect data = ffffd101000000ff
	ldx	[%i1+0x038],%g3		! Observed data at 0000000014800038
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x080],%g2		! Expect data = f0d4381e07cd0d79
	ldx	[%i1+0x080],%g3		! Observed data at 0000000014800080
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = dec6f1f400574d5b
	ldx	[%i1+0x0a0],%g3		! Observed data at 00000000148000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0e8],%g2		! Expect data = 660d7b6979780380
	ldx	[%i1+0x0e8],%g3		! Observed data at 00000000148000e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e8,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 5b09f4ff7136271a
	ldx	[%i1+0x108],%g3		! Observed data at 0000000014800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x158],%g2		! Expect data = b5f2ffa436ee2f7e
	ldx	[%i1+0x158],%g3		! Observed data at 0000000014800158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x188],%g2		! Expect data = c1ff038f0124d538
	ldx	[%i1+0x188],%g3		! Observed data at 0000000014800188
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x188,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 31143fd71e808fff
	ldx	[%i1+0x1a8],%g3		! Observed data at 00000000148001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = fc929d2d778eceaf
	ldx	[%i1+0x1b0],%g3		! Observed data at 00000000148001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1b0,%g4

	set	p1_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000002ddeae7eea
	ldx	[%i2+0x000],%g3		! Observed data at 0000000015000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffffeb0052fec6aa
	ldx	[%i2+0x008],%g3		! Observed data at 0000000015000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x048],%g2		! Expect data = f81ceb9ba22363e7
	ldx	[%i2+0x048],%g3		! Observed data at 0000000015000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 000000000b773d20
	ldx	[%i2+0x0a0],%g3		! Observed data at 00000000150000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = 0a3d83caf81c6679
	ldx	[%i2+0x0b0],%g3		! Observed data at 00000000150000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 81ffb3c344244e65
	ldx	[%i2+0x0c0],%g3		! Observed data at 00000000150000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = f96faf0fd31ded48
	ldx	[%i2+0x0f0],%g3		! Observed data at 00000000150000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x120],%g2		! Expect data = b581ff0dfa9eb8e0
	ldx	[%i2+0x120],%g3		! Observed data at 0000000015000120
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x138],%g2		! Expect data = 2c5b5065ab23d43d
	ldx	[%i2+0x138],%g3		! Observed data at 0000000015000138
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x158],%g2		! Expect data = d27627676175d700
	ldx	[%i2+0x158],%g3		! Observed data at 0000000015000158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 00000000000005e8
	ldx	[%i2+0x198],%g3		! Observed data at 0000000015000198
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1c8],%g2		! Expect data = 22c3fab900000061
	ldx	[%i2+0x1c8],%g3		! Observed data at 00000000150001c8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1c8,%g4

	set	p1_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = f78921a077805240
	ldx	[%i3+0x000],%g3		! Observed data at 0000000015800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff8a0000a2b95ec9
	ldx	[%i3+0x008],%g3		! Observed data at 0000000015800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = ffffffffffffeb00
	ldx	[%i3+0x020],%g3		! Observed data at 0000000015800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 6ef6e19c655dceab
	ldx	[%i3+0x048],%g3		! Observed data at 0000000015800048
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x060],%g2		! Expect data = 71908522e057ea00
	ldx	[%i3+0x060],%g3		! Observed data at 0000000015800060
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x060,%g4
	ldx	[%g1+0x080],%g2		! Expect data = ac5561b895b97e8c
	ldx	[%i3+0x080],%g3		! Observed data at 0000000015800080
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x088],%g2		! Expect data = b30dc03c6500fcd3
	ldx	[%i3+0x088],%g3		! Observed data at 0000000015800088
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x088,%g4
	ldx	[%g1+0x0e0],%g2		! Expect data = 0ccef4428d2460ff
	ldx	[%i3+0x0e0],%g3		! Observed data at 00000000158000e0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0e0,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 000000004fef9001
	ldx	[%i3+0x108],%g3		! Observed data at 0000000015800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x110],%g2		! Expect data = bed44891127e5786
	ldx	[%i3+0x110],%g3		! Observed data at 0000000015800110
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x158],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x158],%g3		! Observed data at 0000000015800158
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x190],%g2		! Expect data = aee9ffffbce9eba8
	ldx	[%i3+0x190],%g3		! Observed data at 0000000015800190
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x190,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = 0000000000161373
	ldx	[%i3+0x1d8],%g3		! Observed data at 00000000158001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1d8,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = d70a528a0d976602
	ldx	[%i3+0x1e8],%g3		! Observed data at 00000000158001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = a08e6f3c13ff1ec3
	ldx	[%i3+0x1f8],%g3		! Observed data at 00000000158001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1f8,%g4

	set	p1_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00ff287f8f801a54
	ldx	[%i4+0x000],%g3		! Observed data at 0000000016000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 7b37fa9536b3370a
	ldx	[%i4+0x1a8],%g3		! Observed data at 00000000160001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x1a8,%g4

	set	p1_local5_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = 008b8720158bda23
	ldx	[%i5+0x008],%g3		! Observed data at 0000000016800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x050],%g2		! Expect data = dc84b8eb9202c3ad
	ldx	[%i5+0x050],%g3		! Observed data at 0000000016800050
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x080],%g2		! Expect data = f6fbdffd3dde0dbe
	ldx	[%i5+0x080],%g3		! Observed data at 0000000016800080
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x080,%g4

	set	p1_local6_expect,%g1
	ldx	[%g1+0x038],%g2		! Expect data = 00000195eb000000
	ldx	[%i6+0x038],%g3		! Observed data at 0000000017000038
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x038,%g4
	ldx	[%g1+0x0a0],%g2		! Expect data = 0000055c9409a767
	ldx	[%i6+0x0a0],%g3		! Observed data at 00000000170000a0
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x0a0,%g4
	ldx	[%g1+0x168],%g2		! Expect data = 13ff1ec300161373
	ldx	[%i6+0x168],%g3		! Observed data at 0000000017000168
	cmp	%g2,%g3
	bne,a,pn %xcc,p1_local_failed
	mov	0x168,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p1_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p1_memcheck_share0:
	ldx	[%g4+0x10],%g2	! Expected value = 655dceabb8920682
	ldx	[%o0+0x10],%g3	! Read value at Mem[0000000030000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 000000a2000000a8
	ldx	[%o0+0x18],%g3	! Read value at Mem[0000000030000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = a74e5000e06cc8cf
	ldx	[%o0+0x50],%g3	! Read value at Mem[0000000030000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 896a6157ead834ab
	ldx	[%o0+0x58],%g3	! Read value at Mem[0000000030000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p1_memcheck_share1:
	ldx	[%g4+0x10],%g2	! Expected value = 00000001deae7eea
	ldx	[%o1+0x10],%g3	! Read value at Mem[0000000030800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 08685f2e621e21ff
	ldx	[%o1+0x18],%g3	! Read value at Mem[0000000030800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = f96e8ca9ff3c014b
	ldx	[%o1+0x50],%g3	! Read value at Mem[0000000030800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = 4a1b44baa3ffe431
	ldx	[%o1+0x58],%g3	! Read value at Mem[0000000030800058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p1_memcheck_share2:
	ldx	[%g4+0x10],%g2	! Expected value = 1f3d76649dda1af3
	ldx	[%o2+0x10],%g3	! Read value at Mem[0000000031000010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 85a231560000d8f7
	ldx	[%o2+0x18],%g3	! Read value at Mem[0000000031000018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 4c2226d76150e66d
	ldx	[%o2+0x50],%g3	! Read value at Mem[0000000031000050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = ef3c3706deae7eea
	ldx	[%o2+0x58],%g3	! Read value at Mem[0000000031000058]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x058,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p1_memcheck_share3:
	ldx	[%g4+0x10],%g2	! Expected value = d5eff6ae6d060000
	ldx	[%o3+0x10],%g3	! Read value at Mem[0000000031800010]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x010,%g1
	ldx	[%g4+0x18],%g2	! Expected value = 793e9015f925b7ff
	ldx	[%o3+0x18],%g3	! Read value at Mem[0000000031800018]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x018,%g1
	ldx	[%g4+0x50],%g2	! Expected value = 00000fb4fffe30db
	ldx	[%o3+0x50],%g3	! Read value at Mem[0000000031800050]
	cmp	%g2,%g3
	bne,pn	%xcc,p1_failed
	add	%g6,0x050,%g1
	ldx	[%g4+0x58],%g2	! Expected value = bcff82bf5b20d8f7
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
	xnor	%l3,%l2,%l3
	std	%l2,[%i3+0x0e0]		! Mem[00000000158000e0]
	prefetch [%i0+0x100],23
	taddcc	%l7,%l0,%l7
	prefetch [%i0+0x140],0
	sub	%l0,%l5,%l1
	prefetch [%i1+0x080],20
	done

p1_trap1o:
	xnor	%l3,%l2,%l3
	std	%l2,[%o3+0x0e0]		! Mem[00000000158000e0]
	prefetch [%o0+0x100],23
	taddcc	%l7,%l0,%l7
	prefetch [%o0+0x140],0
	sub	%l0,%l5,%l1
	prefetch [%o1+0x080],20
	done


p1_trap2e:
	lduh	[%o3+0x016],%l7		! Mem[0000000031800016]
	nop
	subc	%l2,0x939,%l4
	done

p1_trap2o:
	lduh	[%i3+0x016],%l7		! Mem[0000000031800016]
	nop
	subc	%l2,0x939,%l4
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
	ldx	[%g1+0x000],%l0	! %l0 = cafd7a0035bc26a8
	ldx	[%g1+0x008],%l1	! %l1 = cb2846000a19f4cc
	ldx	[%g1+0x010],%l2	! %l2 = d99706ffaaa7bbd8
	ldx	[%g1+0x018],%l3	! %l3 = ded1ddffcbe5a6ea
	ldx	[%g1+0x020],%l4	! %l4 = 265cf600641b73d0
	ldx	[%g1+0x028],%l5	! %l5 = 11395aff932002b0
	ldx	[%g1+0x030],%l6	! %l6 = a74addffc93e0449
	ldx	[%g1+0x038],%l7	! %l7 = 9e7b92ff972e88d2

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
	ldd	[%g1+0x00],%f0		! %f0  = ef01edbb, %f1  = 30d4038a
	ldd	[%g1+0x08],%f2		! %f2  = 4013b1ca, %f3  = 223783f8
	ldd	[%g1+0x10],%f4		! %f4  = 04282168, %f5  = de57d2f0
	ldd	[%g1+0x18],%f6		! %f6  = 622f7d1d, %f7  = e03ac0a3
	ldd	[%g1+0x20],%f8		! %f8  = 69106f89, %f9  = 03fbd1e0
	ldd	[%g1+0x28],%f10		! %f10 = 4c1e8a6d, %f11 = fd0a5b6a
	ldd	[%g1+0x30],%f12		! %f12 = 2a374903, %f13 = 256b5292
	ldd	[%g1+0x38],%f14		! %f14 = 5192069c, %f15 = 3f9dd491
	ldd	[%g1+0x40],%f16		! %f16 = a5a4c94e, %f17 = 0e94a1ff
	ldd	[%g1+0x48],%f18		! %f18 = 7fadbf3d, %f19 = 550e7a41
	ldd	[%g1+0x50],%f20		! %f20 = 5878877f, %f21 = 562bf026
	ldd	[%g1+0x58],%f22		! %f22 = 91a8be66, %f23 = 70c7b6c3
	ldd	[%g1+0x60],%f24		! %f24 = a4b5a397, %f25 = e8db4386
	ldd	[%g1+0x68],%f26		! %f26 = b012f8e3, %f27 = 7f144dad
	ldd	[%g1+0x70],%f28		! %f28 = 6e615ce8, %f29 = e5eb3868
	ldd	[%g1+0x78],%f30		! %f30 = c1e2ff27, %f31 = cc09f51c
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 2

p2_label_1:
	membar	#Sync			! Added by membar checker (351)
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,23
!	Branch On Register, %l2 = 76d306002eb8a056
	brgz,pn	%l2,p2_b1		! Branch Taken
!	Mem[00000000180001e0] = 7c078985 02579924 07515f44 34dd5015
	prefetch [%i0+0x1e0],0
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x001,%g2
p2_b1:
	fbu	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000018800080] = dcc5fb8e 94a47574 f913afdc 438f32f5
	prefetch [%i1+0x080],22
p2_b2:

p2_label_2:
	membar	#Sync			! Added by membar checker (352)
!	%l5 = 8adf3e000e99831a, %l6 = 51200cffb524ed96, %y  = 00000000
	udivx	%l5,%l6,%l6		! %l6 = 0000000000000001
	set	p2_b3,%o7
	fbue,a	p2_far_0_he	! Branch Taken, %fcc0 = 0
!	%l5 = 8adf3e000e99831a, Mem[00000000198000f2] = 34018293
	sth	%l5,[%i3+0x0f2]		! Mem[00000000198000f0] = 3401831a
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x003,%g2
p2_b3:
!	Registers modified during the branch to p2_far_0
!	%l0  = 000000001be3c36c
!	%l1  = 00000000d5a48de1
	membar	#Sync			! Added by membar checker (353)
!	Mem[0000000018000008] = c5dd81ef, %l3 = 8aea7eff931ec9f6
	ldswa	[%i0+%o6]0x80,%l3	! %l3 = ffffffffc5dd81ef
!	%f26 = b012f8e3, %f26 = b012f8e3, %f23 = 70c7b6c3
	fdivs	%f26,%f26,%f23		! %f23 = 3f800000

p2_label_3:
!	%l7 = 00d98b00088ad4c9, Mem[0000000030800028] = 0655b0560a925557
	stx	%l7,[%o1+0x028]		! Mem[0000000030800028] = 00d98b00088ad4c9
	set	p2_b4,%o7
	fbuge,a	p2_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],0
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x004,%g2
p2_b4:
!	Registers modified during the branch to p2_far_3
!	%l0  = fde0000000000000
!	%l1  = ffffffbfd7ca678c
!	%l2  = ffffffffffffffbc
!	%l5  = 0013febd314003ac
	membar	#Sync			! Added by membar checker (354)
!	Mem[0000000030800064] = c2f78862, %l3 = ffffffffc5dd81ef
	lduha	[%o1+0x066]%asi,%l3	! %l3 = 0000000000008862
	bcc,a	p2_b5			! Branch Taken, %ccr = 44, CWP = 0

p2_label_4:
!	Mem[0000000019800168] = dc083b3c, %l5 = 0013febd314003ac
	ldub	[%i3+0x16b],%l5		! %l5 = 000000000000003c
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x005,%g2
p2_b5:
	membar	#Sync			! Added by membar checker (355)
!	Mem[00000000198000bc] = 6b4d9661, %l6 = 0000000000000001
	ldsba	[%i3+0x0bf]%asi,%l6	! %l6 = 0000000000000061
!	%f2  = 4013b1ca 223783f8, %f2  = 4013b1ca 223783f8, %f0  = ef01edbb 30d4038a
	fdivd	%f2 ,%f2 ,%f0 		! %f0  = 3ff00000 00000000
!	%l6 = 0000000000000061, immed = fffffdaf, %l2 = ffffffffffffffbc
	or	%l6,-0x251,%l2		! %l2 = fffffffffffffdef
!	Branch On Register, %l5 = 000000000000003c
	brz,pt	%l5,p2_not_taken_0	! Branch Not Taken

p2_label_5:
!	Mem[0000000018000000] = f503f203, %l0 = fde0000000000000
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000f503f203
p2_b6:
	membar	#Sync			! Added by membar checker (356)
!	Mem[000000001800017c] = 26bdee2c, %l6 = 0000000000000061
	lduwa	[%i0+0x17c]%asi,%l6	! %l6 = 0000000026bdee2c
	fbl,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000018800008] = ff30e219, %l7 = 00d98b00088ad4c9
	swapa	[%i1+%o6]0x80,%l7	! %l7 = 00000000ff30e219
p2_b7:
	membar	#Sync			! Added by membar checker (357)
!	Mem[0000000031000060] = 1377a110, %l0 = 00000000f503f203
	lduha	[%o2+0x062]%asi,%l0	! %l0 = 000000000000a110

p2_label_6:
!	Mem[0000000018000178] = c5c93ea0, %l6 = 0000000026bdee2c
	ldub	[%i0+0x179],%l6		! %l6 = 00000000000000c9
!	%l6 = 00000000000000c9, Mem[000000003200004a] = 9febc1c6
	stha	%l6,[%o4+0x04a]%asi	! Mem[0000000032000048] = 00c9c1c6
!	%f0  = 3ff00000, %f20 = 5878877f
	fabss	%f0 ,%f20		! %f20 = 3ff00000
!	%l2 = fffffffffffffdef, Mem[0000000018000000] = f503f203
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000018000000] = fdeff203
!	%l1 = ffffffbfd7ca678c, immed = 00000110, %l5 = 000000000000003c
	andncc	%l1,0x110,%l5		! %l5 = ffffffbfd7ca668c, %ccr = 88

p2_label_7:
!	%l3 = 0000000000008862, Mem[0000000031800020] = 1be3c36cd5a48de1
	stxa	%l3,[%o3+0x020]%asi	! Mem[0000000031800020] = 0000000000008862
!	Mem[0000000031800060] = ca85b69d37336455, %l4 = a05ef9ff9ecd164e
	ldx	[%o3+0x060],%l4		! %l4 = ca85b69d37336455
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l5 = ffffffbfd7ca668c, Mem[0000000019800182] = 57f26636
	stb	%l5,[%i3+0x182]		! Mem[0000000019800180] = 57f28c36
p2_b8:
	membar	#Sync			! Added by membar checker (358)
!	Mem[0000000019800100] = 4a7d36f1 ea195fb9 e8f3fc78 80a057d0
	prefetch [%i3+0x100],23

p2_label_8:
	fbl,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l0 = 0000a110, %l1 = d7ca678c, Mem[0000000018000000] = fdeff203 8565a7f9
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000018000000] = 0000a110 d7ca678c
p2_b9:
	membar	#Sync			! Added by membar checker (359)
!	%l7 = 00000000ff30e219, %l2 = fffffffffffffdef, %y  = 00000000
	sdivx	%l7,%l2,%l1		! %l1 = ffffffffff848145
!	Mem[0000000018000140] = f97a080a 9eb1bb53 1e9e1c71 3a1b9a42
	prefetcha [%i0+0x140]%asi,4
!	%l7 = 00000000ff30e219, immed = 00000624, %l4 = ca85b69d37336455
	orncc	%l7,0x624,%l4		! %l4 = fffffffffffffbdb, %ccr = 88

p2_label_9:
!	%l2 = fffffffffffffdef, Mem[0000000018000104] = 952160b5
	stw	%l2,[%i0+0x104]		! Mem[0000000018000104] = fffffdef
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000019000008] = 7ca5e401, %l5 = ffffffbfd7ca668c
	lduba	[%i2+%o6]0x80,%l5	! %l5 = 000000000000007c
p2_b10:
	membar	#Sync			! Added by membar checker (360)
!	Mem[0000000030800024] = a5c486fb, %l7 = 00000000ff30e219
	ldub	[%o1+0x026],%l7		! %l7 = 0000000000000086
	fbne	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_10:
!	Mem[0000000030800060] = d3cf4e8d, %l1 = ffffffffff848145
	ldsw	[%o1+0x060],%l1		! %l1 = ffffffffd3cf4e8d
p2_b11:
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018000120] = bb1de25c 8e90d29a 8dcb9aaa d21c6b14
	prefetch [%i0+0x120],20
p2_b12:
	membar	#Sync			! Added by membar checker (361)
!	Mem[000000001880004c] = 468dbe1e, %l6 = 00000000000000c9
	lduba	[%i1+0x04d]%asi,%l6	! %l6 = 000000000000008d
!	%f22 = 91a8be66 3f800000, %f24 = a4b5a397 e8db4386
	fmovd	%f22,%f24		! %f24 = 91a8be66 3f800000

p2_label_11:
!	Branch On Register, %l6 = 000000000000008d
	brz,pt	%l6,p2_not_taken_0	! Branch Not Taken
!	%l7 = 0000000000000086, Mem[0000000018800000] = 6923dadf
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000018800000] = 0086dadf
p2_b13:
	membar	#Sync			! Added by membar checker (362)
!	Mem[0000000019800120] = 8c8f256e d1eeae90 0bfcd43a 8319f0b9
	prefetch [%i3+0x120],16
!	%l1 = ffffffffd3cf4e8d, immed = 00000538, %l2 = fffffffffffffdef
	sub	%l1,0x538,%l2		! %l2 = ffffffffd3cf4955
	set	p2_b14,%o7
	fbe,pt	%fcc1,p2_near_3_le	! Branch Taken, %fcc1 = 0

p2_label_12:
!	Mem[00000000180001b4] = 9cf9217b, %l0 = 000000000000a110
	ldstub	[%i0+0x1b4],%l0		! %l0 = 000000000000009c
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x00e,%g2
p2_b14:
!	Registers modified during the branch to p2_near_3
!	%l0  = ffffffffd3cf4f29
!	%l1  = 000000000000006d
	fbne,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000000] = 3e4f5b03eb10ecd6, %l4 = fffffffffffffbdb
	ldxa	[%i2+%g0]0x80,%l4	! Annulled
p2_b15:
	fbl,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l4 = fffffffffffffbdb, Mem[0000000019000000] = 3e4f5b03eb10ecd6
	stxa	%l4,[%i2+%g0]0x80	! Annulled
p2_b16:

p2_label_13:
	membar	#Sync			! Added by membar checker (363)
!	Mem[0000000018000000] = 0000a110 d7ca678c c5dd81ef 612c7852
	prefetch [%i0+0x000],23
!	%l3 = 0000000000008862, Mem[0000000019000030] = 53652ae7
	sth	%l3,[%i2+0x030]		! Mem[0000000019000030] = 88622ae7
!	Branch On Register, %l0 = ffffffffd3cf4f29
	brgz,a,pn %l0,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019800080] = 8cf77ec1 5b9cfb46 81e03d38 b998b492
	prefetch [%i3+0x080],21	! Annulled
p2_b17:
	bgu,a	p2_b18			! Branch Taken, %ccr = 88, CWP = 0

p2_label_14:
!	Mem[0000000018000000] = 0000a110, %l1 = 000000000000006d
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 000000000000a110
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x012,%g2
p2_b18:
	membar	#Sync			! Added by membar checker (364)
!	%l6 = 000000000000008d, Mem[000000001a0001aa] = 45dc2caf
	stha	%l6,[%i4+0x1aa]%asi	! Mem[000000001a0001a8] = 45dc008d
!	Mem[000000003100006c] = 5c268775, %l4 = fffffffffffffbdb
	lduba	[%o2+0x06e]%asi,%l4	! %l4 = 0000000000000087
!	%l0 = ffffffffd3cf4f29, immed = fffffb21, %l7 = 0000000000000086
	xorcc	%l0,-0x4df,%l7		! %l7 = 000000002c30b408, %ccr = 00
!	%l7 = 000000002c30b408, %l6 = 000000000000008d, %y  = 00000000
	umul	%l7,%l6,%l2		! %l2 = 0000001856d32868

p2_label_15:
	set	p2_b19,%o7
	fbue,a	p2_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000019000000] = 3e4f5b03, %l3 = 0000000000008862
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000003e4f
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x013,%g2
p2_b19:
!	Registers modified during the branch to p2_far_1
!	%l2  = ffffffffd3cf4e9c
!	%l3  = 0000000000000030
	set	p2_b20,%o7
	fbo,a	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000019800000] = 9cd1e0d7 556ba9b6, %l6 = 0000008d, %l7 = 2c30b408
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 000000009cd1e0d7 00000000556ba9b6
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x014,%g2
p2_b20:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000000
!	%l5  = ffffffffc32b16cf
!	%l7  = ffffffffd3cf4c43
	fbne,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_16:
!	Mem[0000000032000038] = fe3e661aa263dc09, %l5 = ffffffffc32b16cf
	ldx	[%o4+0x038],%g2		! Annulled
p2_b21:
	membar	#Sync			! Added by membar checker (365)
!	%l2 = ffffffffd3cf4e9c, %l7 = ffffffffd3cf4c43, %l3 = 0000000000000030
	orncc	%l2,%l7,%l3		! %l3 = ffffffffffffffbc, %ccr = 88
	set	p2_b22,%o7
	fble	p2_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000078] = c92fb26a, %l2 = ffffffffd3cf4e9c
	ldsb	[%i0+0x078],%l2		! %l2 = ffffffffffffffc9
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x016,%g2
p2_b22:
!	Registers modified during the branch to p2_far_2
!	%l1  = b653e6eb9a60ac97
!	%l2  = ffffffffd3cf5162
!	%l4  = 0000000000000000
!	%l5  = 000001d5f3f7a2f8
	membar	#Sync			! Added by membar checker (366)
!	Mem[00000000198000c0] = 17359f00 8dc4129f e2d4804e 89a253d6
	prefetch [%i3+0x0c0],16

p2_label_17:
!	Mem[000000003000006c] = a0c0bef1, %l7 = ffffffffd3cf4c43
	ldub	[%o0+0x06c],%l7		! %l7 = 00000000000000a0
!	Mem[0000000030800068] = 17359f00 000000a0, %l5 = 000001d5f3f7a2f8, %l2 = ffffffffd3cf5162
	add	%o1,0x68,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 4b49a3d9e36f3aa2
!	%f20 = 3ff00000 562bf026, %f26 = b012f8e3 7f144dad
	fcmpd	%fcc0,%f20,%f26		! %fcc0 = 2
!	%l1 = b653e6eb9a60ac97, Mem[000000001900001c] = 7b1270ab
	stwa	%l1,[%i2+0x01c]%asi	! Mem[000000001900001c] = 9a60ac97
!	Mem[000000001a800000] = a33a7877 5a67ea60, %l0 = d3cf4f29, %l1 = 9a60ac97
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000a33a7877 000000005a67ea60

p2_label_18:
	set	p2_b23,%o7
	fbne	p2_far_1_he	! Branch Taken, %fcc0 = 2
!	Mem[0000000030800068] = 4b49a3d9, %l2 = 4b49a3d9e36f3aa2
	ldsb	[%o1+0x06a],%l2		! %l2 = ffffffffffffffa3
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x017,%g2
p2_b23:
!	Registers modified during the branch to p2_far_1
!	%l2  = 00000000066897a0
!	%l3  = 0000000000000040
	membar	#Sync			! Added by membar checker (367)
!	%f3  = 223783f8, %f3  = 223783f8, %f17 = 0e94a1ff
	fadds	%f3 ,%f3 ,%f17		! %f17 = 22b783f8
!	%f0  = 3ff00000 00000000, %f30 = c1e2ff27 cc09f51c, %f10 = 4c1e8a6d fd0a5b6a
	faddd	%f0 ,%f30,%f10		! %f10 = c1e2ff27 cbe9f51c
!	%l6 = 000000009cd1e0d7, immed = 00000032, %l0 = 00000000a33a7877
	srlx	%l6,0x032,%l0		! %l0 = 0000000000000000

p2_label_19:
!	%f2  = 4013b1ca 223783f8, %f2  = 4013b1ca 223783f8
	fcmpd	%fcc0,%f2 ,%f2 		! %fcc0 = 0
!	%l2 = 00000000066897a0, Mem[0000000030000028] = 35bef57766ca6d10
	stx	%l2,[%o0+0x028]		! Mem[0000000030000028] = 00000000066897a0
!	Mem[0000000019800008] = 0bb0a8b6 d1d7d224, %l0 = 00000000, %l1 = 5a67ea60
	ldda	[%i3+%o6]0x80,%l0	! %l0 = 000000000bb0a8b6 00000000d1d7d224
!	%f20 = 3ff00000 562bf026, %f20 = 3ff00000 562bf026, %f26 = b012f8e3 7f144dad
	faddd	%f20,%f20,%f26		! %f26 = 40000000 562bf026
!	Mem[0000000018800000] = 0086dadf30a25f6a, %l7 = 00000000000000a0
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 0086dadf30a25f6a

p2_label_20:
	set	p2_b24,%o7
	fbuge,a,pn %fcc3,p2_near_0_le	! Branch Taken, %fcc3 = 0
!	Mem[0000000018000000] = 0000006d, %l1 = 00000000d1d7d224
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 000000000000006d
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x018,%g2
p2_b24:
!	Registers modified during the branch to p2_near_0
!	%l1  = fffffffffffffce9
!	%l4  = 0000000023010b7e
!	%l6  = 000000000000006d
	membar	#Sync			! Added by membar checker (368)
!	Mem[0000000030000020] = 00000000 7f144dad, %l1 = fffffffffffffce9, %l2 = 00000000066897a0
	add	%o0,0x20,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = cef4eba74b4926af
!	Mem[00000000180001c8] = 31cb81717e16b5f5, %l5 = 000001d5f3f7a2f8
	ldxa	[%i0+0x1c8]%asi,%l5	! %l5 = 31cb81717e16b5f5
!	%l7 = 0086dadf30a25f6a, %l7 = 0086dadf30a25f6a, %l4 = 0000000023010b7e
	srax	%l7,%l7,%l4		! %l4 = 00000000000021b6

p2_label_21:
!	Mem[0000000019800198] = 5167cd91 71d964e4, %l4 = 000021b6, %l5 = 7e16b5f5
	ldd	[%i3+0x198],%l4		! %l4 = 000000005167cd91 0000000071d964e4
!	Mem[0000000019000008] = 7ca5e401, %l6 = 000000000000006d
	lduba	[%i2+%o6]0x80,%l6	! %l6 = 000000000000007c
!	Mem[0000000031000060] = 1377a110, %l7 = 0086dadf30a25f6a
	lduba	[%o2+0x062]%asi,%l7	! %l7 = 00000000000000a1
!	Mem[000000003180006c] = bcee6bbf, %l0 = 000000000bb0a8b6
	ldsh	[%o3+0x06c],%l0		! %l0 = ffffffffffffbcee
!	Mem[0000000018800080] = dcc5fb8e 94a47574 f913afdc 438f32f5
	prefetcha [%i1+0x080]%asi,2

p2_label_22:
!	%l0 = ffffffffffffbcee, Mem[000000003200003e] = dc09ba91
	stb	%l0,[%o4+0x03e]		! Mem[000000003200003c] = ee09ba91
	bgu,a	p2_b25			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000019000008] = 7ca5e401 a3beee84, %l2 = 4b4926af, %l3 = 00000040
	ldda	[%i2+%o6]0x80,%l2	! %l2 = 000000007ca5e401 00000000a3beee84
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x019,%g2
p2_b25:
	membar	#Sync			! Added by membar checker (369)
!	Mem[0000000019800000] = 9cd1e0d7, %l3 = 00000000a3beee84
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffff9c
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_23:
!	%l6 = 0000007c, %l7 = 000000a1, Mem[0000000018800000] = 0086dadf 30a25f6a
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000018800000] = 0000007c 000000a1
p2_b26:
	membar	#Sync			! Added by membar checker (370)
!	%l5 = 0000000071d964e4, %l5 = 0000000071d964e4, %l0 = ffffffffffffbcee
	andcc	%l5,%l5,%l0		! %l0 = 0000000071d964e4, %ccr = 00
!	%l2 = 000000007ca5e401, %l2 = 000000007ca5e401, %l5 = 0000000071d964e4
	add	%l2,%l2,%l5		! %l5 = 00000000f94bc802
!	%l1 = fffffffffffffce9, %l3 = ffffffffffffff9c, %l5 = 00000000f94bc802
	andn	%l1,%l3,%l5		! %l5 = 0000000000000061
!	Jump to jmpl_0, CWP = 0
	set	p2_jmpl_0_le,%g1
	jmpl	%g1,%g6

p2_label_24:
!	%l7 = 00000000000000a1, Mem[0000000019000008] = 7ca5e401a3beee84
	stxa	%l7,[%i2+%o6]0x80	! Mem[0000000019000008] = 00000000000000a1
!	Registers modified during the branch to p2_jmpl_0
!	%l0  = 0000000000000000
!	%l6  = 000000007ca5e39d
!	%l7  = ffffffffffffffee
	set	p2_b27,%o7
	fbge,a	p2_far_1_le	! Branch Taken, %fcc0 = 0
!	%l2 = 000000007ca5e401, Mem[000000003200005e] = c54ebe38
	stb	%l2,[%o4+0x05e]		! Mem[000000003200005c] = 014ebe38
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x01b,%g2
p2_b27:
!	Registers modified during the branch to p2_far_1
!	%l2  = 0000000000000000
!	%l4  = fffffffffffff20f
	fbl,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000188001e0] = f4edca67 462e471c a12049f6 5678857a
	prefetch [%i1+0x1e0],22	! Annulled
p2_b28:

p2_label_25:
	membar	#Sync			! Added by membar checker (371)
!	Mem[0000000019800000] = 9cd1e0d7 556ba9b6 0bb0a8b6 d1d7d224
	prefetcha [%i3+0x000]%asi,1
!	Mem[000000001980001c] = 549a723f, %l1 = fffffffffffffce9
	swapa	[%i3+0x01c]%asi,%l1	! %l1 = 00000000549a723f
	bl	p2_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[0000000019800000] = 9cd1e0d7, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 000000000000009c
p2_b29:
	membar	#Sync			! Added by membar checker (372)
!	%l2 = 000000000000009c, %l4 = fffffffffffff20f, %y  = 000001d5
	udivx	%l2,%l4,%l7		! %l7 = 0000000000000000

p2_label_26:
!	%f14 = 5192069c 3f9dd491, %f4  = 04282168 de57d2f0
	fnegd	%f14,%f4 		! %f4  = d192069c 3f9dd491
!	%l4 = fffffffffffff20f, %l4 = fffffffffffff20f, %y  = 000001d5
	smulcc	%l4,%l4,%l5		! %l5 = 0000000000c25ce1, %ccr = 00
!	%l6 = 000000007ca5e39d, %l5 = 0000000000c25ce1, %l0 = 0000000000000000
	srl	%l6,%l5,%l0		! %l0 = 000000003e52f1ce
!	%l7 = 0000000000000000, immed = 0000064b, %l3 = ffffffffffffff9c
	taddcc	%l7,0x64b,%l3		! %l3 = 000000000000064b, %ccr = 02
	bge,a	p2_not_taken_0		! Branch Not Taken, %ccr = 02

p2_label_27:
!	Mem[0000000019000160] = fb999896, %l6 = 000000007ca5e39d
	ldub	[%i2+0x162],%l6		! Annulled
p2_b30:
	membar	#Sync			! Added by membar checker (373)
!	%f0  = 3ff00000 00000000, %f0  = 3ff00000 00000000
	fdtox	%f0 ,%f0 		! %f0  = 00000000 00000001
!	Mem[0000000030800028] = 00d98b00, %l4 = fffff20f, %l0 = 3e52f1ce
	add	%o1,0x28,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000000d98b00
!	%l1 = 00000000549a723f, Mem[000000001800013e] = 272d17d9
	stha	%l1,[%i0+0x13e]%asi	! Mem[000000001800013c] = 272d723f
!	Mem[0000000019800100] = 4a7d36f1 ea195fb9 e8f3fc78 80a057d0
	prefetcha [%i3+0x100]%asi,4

p2_label_28:
	set	p2_b31,%o7
	fbo,pn	%fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000180000ac] = 1fc95824, %l6 = 000000007ca5e39d
	ldstub	[%i0+0x0ac],%l6		! %l6 = 000000000000001f
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x01f,%g2
p2_b31:
!	Registers modified during the branch to p2_near_3
!	%l0  = 000000005573fd3f
!	%l1  = 000000000000006d
	membar	#Sync			! Added by membar checker (374)
	set	p2_b32,%o7
	fbuge,a,pn %fcc1,p2_near_2_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000019800160] = 3480a23f cc21cb28 dc083b3c 55794f86
	prefetch [%i3+0x160],4
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x020,%g2
p2_b32:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000000000000
!	%l4  = 0000000000000000
	membar	#Sync			! Added by membar checker (375)
!	Branch On Register, %l6 = 000000000000001f
	brnz,pn	%l6,p2_b33		! Branch Taken

p2_label_29:
!	%l2 = 0000009c, %l3 = 00000000, Mem[00000000180000b0] = da37c7a6 79322b26
	std	%l2,[%i0+0x0b0]	! Mem[00000000180000b0] = 0000009c 00000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x021,%g2
p2_b33:
!	Jump to jmpl_1, CWP = 0
	set	p2_jmpl_1_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000019800000] = 9cd1e0d7556ba9b6, %l0 = 000000005573fd3f
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = 9cd1e0d7556ba9b6
!	Registers modified during the branch to p2_jmpl_1
!	%l2  = 0000000000000000
	membar	#Sync			! Added by membar checker (376)
!	%l4 = 0000000000000000, immed = 00000072, %l5 = 0000000000c25ce1
	subccc	%l4,0x072,%l5		! %l5 = ffffffffffffff8e, %ccr = 99
	set	p2_b34,%o7
	fbue,a,pt %fcc2,p2_near_0_he	! Branch Taken, %fcc2 = 0

p2_label_30:
!	Mem[00000000190001c0] = cf9e547c 0151f930 fb6a4a66 32060b1e
	prefetch [%i2+0x1c0],4
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x022,%g2
p2_b34:
!	Registers modified during the branch to p2_near_0
!	%l3  = a443ba05473279bc
!	%l7  = 0000000000007a0b
	membar	#Sync			! Added by membar checker (377)
!	%l0 = 9cd1e0d7556ba9b6, immed = fffff4f6, %y  = 00000000
	mulx	%l0,-0xb0a,%l4		! %l4 = db23f6eb09808ce4
!	%l0 = 9cd1e0d7556ba9b6
	sethi	%hi(0xdce12800),%l0	! %l0 = 00000000dce12800
!	%l5 = ffffffffffffff8e, %l7 = 0000000000007a0b, %l3 = a443ba05473279bc
	subccc	%l5,%l7,%l3		! %l3 = ffffffffffff8582, %ccr = 88
!	%l5 = ffffffffffffff8e, immed = 00000bef, %l5 = ffffffffffffff8e
	andcc	%l5,0xbef,%l5		! %l5 = 0000000000000b8e, %ccr = 00

p2_label_31:
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 00000000dce12800, Mem[000000001900016a] = c0a4f943
	stb	%l0,[%i2+0x16a]		! Mem[0000000019000168] = c0a40043
p2_b35:
	membar	#Sync			! Added by membar checker (378)
!	%l1 = 000000000000006d, immed = 00000c5d, %y  = 00000000
	udivcc	%l1,0xc5d,%l1		! %l1 = 0000000000000000, %ccr = 44
!	Mem[0000000018000000] = 0000006dd7ca678c, %l5 = 0000000000000b8e
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 0000006dd7ca678c
!	Mem[000000003000002c] = 066897a0, %l6 = 000000000000001f
	lduwa	[%o0+0x02c]%asi,%l6	! %l6 = 00000000066897a0

p2_label_32:
!	%l3 = ffffffffffff8582, Mem[0000000032000050] = b23d4e8d
	stwa	%l3,[%o4+0x050]%asi	! Mem[0000000032000050] = ffff8582
!	Mem[0000000018000023] = e9fb28ae, %l4 = db23f6eb09808ce4
	ldstuba	[%i0+0x023]%asi,%l4	! %l4 = 00000000000000ae
!	Mem[0000000018000008] = c5dd81ef, %l6 = 00000000066897a0
	swapa	[%i0+%o6]0x80,%l6	! %l6 = 00000000c5dd81ef
!	%l3 = ffffffffffff8582, %l7 = 0000000000007a0b, %y  = 00000000
	mulx	%l3,%l7,%l5		! %l5 = ffffffffc59ab096
!	Mem[0000000019000134] = 8f5cce5d, %l4 = 00000000000000ae
	ldsba	[%i2+0x137]%asi,%l4	! %l4 = 000000000000005d

p2_label_33:
!	Mem[000000001b000134] = f46d95fe, %l3 = ffffffffffff8582
	lduba	[%i6+0x134]%asi,%l3	! %l3 = 00000000000000f4
!	%l2 = 0000000000000000, %l7 = 0000000000007a0b, %y  = 00000000
	udiv	%l2,%l7,%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000018800000] = 0000007c000000a1
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000018800000] = 0000000000000000
!	%f26 = 40000000, %f31 = cc09f51c
	fstoi	%f26,%f31		! %f31 = 00000002
!	%l3 = 00000000000000f4
	sethi	%hi(0xd86c5000),%l3	! %l3 = 00000000d86c5000

p2_label_34:
!	%l7 = 0000000000007a0b, %l0 = 0000000000000000, %l5 = ffffffffc59ab096
	xor	%l7,%l0,%l5		! %l5 = 0000000000007a0b
	set	p2_b36,%o7
	fbue	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018800000] = 00000000, %l3 = 00000000d86c5000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x024,%g2
p2_b36:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000000
!	%l5  = fffffffffffffecb
!	%l7  = fffffffffffffd1a
	membar	#Sync			! Added by membar checker (379)
	set	p2_b37,%o7
	fbuge,pt %fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 0
!	%l4 = 0000000000000000, Mem[000000001a800024] = b075d6e7
	stw	%l4,[%i5+0x024]		! Mem[000000001a800024] = 00000000
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x025,%g2
p2_b37:
!	Registers modified during the branch to p2_near_1
!	%l1  = 00000000c5dd81d5
!	%l6  = 00000000c5dd830a

p2_label_35:
	set	p2_b38,%o7
	fbge,a	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000030800020] = 3909d397, %l0 = 0000000000000000
	lduh	[%o1+0x022],%l0		! %l0 = 000000000000d397
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x026,%g2
p2_b38:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000000
!	%l5  = fffffffffd7720f7
!	%l7  = 000000000000d0b1
	ble	p2_b39			! Branch Taken, %ccr = 19, CWP = 0
!	Mem[0000000019000000] = 3e4f5b03, %l7 = 000000000000d0b1
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000003e4f
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x027,%g2
p2_b39:
	membar	#Sync			! Added by membar checker (380)
!	%l1 = 00000000c5dd81d5, Mem[0000000032000048] = 607300c9
	stha	%l1,[%o4+0x048]%asi	! Mem[0000000032000048] = 81d500c9

p2_label_36:
!	Mem[0000000032000028] = 91eefd1bd7059b63, %l4 = 0000000000000000
	ldxa	[%o4+0x028]%asi,%g2	! %g2 = 91eefd1bd7059b63
!	Mem[0000000019800000] = 9cd1e0d7, %l3 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 000000009cd1e0d7
!	%l4 = 00000000, %l5 = fd7720f7, Mem[000000001a800000] = a33a7877 5a67ea60
	stda	%l4,[%i5+%g0]0x80	! Mem[000000001a800000] = 00000000 fd7720f7
	set	p2_b40,%o7
	fbule,a,pn %fcc0,p2_near_1_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000019800008] = 0bb0a8b6, %l4 = 0000000000000000
	swapa	[%i3+%o6]0x80,%l4	! %l4 = 000000000bb0a8b6
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x028,%g2
p2_b40:

p2_label_37:
	set	p2_b41,%o7
	fbue,a	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018800000] = ff000000, %l0 = 000000000000d397
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x029,%g2
p2_b41:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000002
!	%l5  = fffffffffd7d8d9e
!	%l7  = 00000000fefffd1a
	membar	#Sync			! Added by membar checker (381)
	set	p2_b42,%o7
	fbuge,pt %fcc1,p2_near_0_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000018000000] = 0000006d, %l4 = 0000000000000002
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 000000000000006d
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x02a,%g2
p2_b42:
!	Registers modified during the branch to p2_near_0
!	%l1  = 000000009cd1dd80
!	%l4  = 0000000000000000
!	%l6  = 00000000c5dd81b8
	membar	#Sync			! Added by membar checker (382)
	set	p2_b43,%o7
	fbge,pn	%fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 0

p2_label_38:
!	Mem[00000000188001c0] = 998f3d3b 8747035a c507f232 19acb96f
	prefetch [%i1+0x1c0],23
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x02b,%g2
p2_b43:
!	Registers modified during the branch to p2_near_1
!	%l3  = ffffffffff7d8d9e
!	%l5  = 0000000000000000
!	%l6  = 000000009c518d80
!	%l7  = 000000009cd1dd80
	membar	#Sync			! Added by membar checker (383)
	fbul,pt	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 0
!	Mem[0000000019000000] = 3e4f5b03, %l3 = ffffffffff7d8d9e
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = 000000003e4f5b03
p2_b44:
	membar	#Sync			! Added by membar checker (384)
!	%f9  = 03fbd1e0, %f9  = 03fbd1e0, %f18 = 7fadbf3d
	fsubs	%f9 ,%f9 ,%f18		! %f18 = 00000000
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],1

p2_label_39:
!	%l0 = 00000000ff000000, %l7 = 000000009cd1dd80, %l1 = 000000009cd1dd80
	subc	%l0,%l7,%l1		! %l1 = 00000000622e2280
	set	p2_b45,%o7
	fble,pn	%fcc1,p2_near_2_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000019800060] = fad3c95f 6115b4bf fcb95087 b092dfa6
	prefetch [%i3+0x060],23
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x02d,%g2
p2_b45:
!	Registers modified during the branch to p2_near_2
!	%l3  = 000000009cd1dd80
!	%l5  = 000000000000eba7
!	%l7  = ffffffffc5dc9500
	membar	#Sync			! Added by membar checker (385)
!	%l7 = ffffffffc5dc9500, immed = fffffe2a, %y  = 00000000
	sdiv	%l7,-0x1d6,%l6		! %l6 = ffffffffff943a83
!	%f2  = 4013b1ca 223783f8, %f20 = 3ff00000 562bf026, %f20 = 3ff00000 562bf026
	fsubd	%f2 ,%f20,%f20		! %f20 = 400f6394 19590fdd

p2_label_40:
!	%l7 = ffffffffc5dc9500, %l5 = 000000000000eba7, %l2 = 0000000000000000
	addccc	%l7,%l5,%l2		! %l2 = ffffffffc5dd80a8, %ccr = 88
!	Branch On Register, %l3 = 000000009cd1dd80
	brlz,a,pn %l3,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],20	! Annulled
p2_b46:
	membar	#Sync			! Added by membar checker (386)
!	%f28 = 6e615ce8, %f13 = 256b5292, %f16 = a5a4c94e 22b783f8
	fsmuld	%f28,%f13,%f16		! %f16 = 4289e51f 28298a00
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_le,%g1
	jmpl	%g1,%g6

p2_label_41:
!	Mem[000000003000002c] = 06688d9e, %l7 = ffffffffc5dc9500
	lduh	[%o0+0x02e],%l7		! %l7 = 0000000000008d9e
!	Registers modified during the branch to p2_jmpl_3
!	%l5  = 000000000008d9e0
!	%l6  = 000000000000f5c4
!	Mem[00000000188001c0] = 998f3d3b 8747035a c507f232 19acb96f
	prefetch [%i1+0x1c0],21
	fblg,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[00000000188000c0] = d85d4eae 0cdbaf62 0240b95a 11a41a27
	prefetch [%i1+0x0c0],0
p2_b47:
	membar	#Sync			! Added by membar checker (387)
!	Mem[0000000019000008] = 00000000, %l3 = 000000009cd1dd80
	ldsba	[%i2+%o6]0x80,%l3	! %l3 = 0000000000000000

p2_label_42:
!	Mem[0000000019800000] = 9cd1e0d7556ba9b6, %l2 = ffffffffc5dd80a8
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = 9cd1e0d7556ba9b6
!	Branch On Register, %l5 = 000000000008d9e0
	brnz,pn	%l5,p2_b48		! Branch Taken
!	Mem[0000000018000094] = 8bbf8fb0, %l7 = 0000000000008d9e
	swap	[%i0+0x094],%l7		! %l7 = 000000008bbf8fb0
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x030,%g2
p2_b48:
	membar	#Sync			! Added by membar checker (388)
	fbn,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000018800008] = 088ad4c9, %l7 = 000000008bbf8fb0
	lduba	[%i1+%o6]0x80,%l7	! Annulled
p2_b49:

p2_label_43:
	membar	#Sync			! Added by membar checker (389)
!	Mem[00000000188000c0] = d85d4eae 0cdbaf62 0240b95a 11a41a27
	prefetch [%i1+0x0c0],2
!	%l5 = 000000000008d9e0, %l7 = 000000008bbf8fb0, %l5 = 000000000008d9e0
	tsubcc	%l5,%l7,%l5		! %l5 = ffffffff74494a30, %ccr = 91
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	Mem[000000001b000008] = d4a1330b 764b770c, %l2 = 556ba9b6, %l3 = 00000000
	ldda	[%i6+%o6]0x80,%l2	! %l2 = 00000000d4a1330b 00000000764b770c
!	Registers modified during the branch to p2_jmpl_3
!	%l5  = 000022efe3ec0000
!	%l6  = ffffffff7449544e
!	Mem[0000000031800060] = ca85b69d, %l4 = 0000000000000000
	lduba	[%o3+0x060]%asi,%l4	! %l4 = 00000000000000ca

p2_label_44:
!	Mem[0000000030000068] = 89ee30da, %l5 = 000022efe3ec0000
	swapa	[%o0+0x068]%asi,%l5	! %l5 = 0000000089ee30da
!	%l1 = 00000000622e2280, immed = 00000015, %l4 = 00000000000000ca
	sra	%l1,0x015,%l4		! %l4 = 0000000000000311
!	%l7 = 000000008bbf8fb0, immed = fffff0cd, %l7 = 000000008bbf8fb0
	tsubcc	%l7,-0xf33,%l7		! %l7 = 000000008bbf9ee3, %ccr = 1b
!	%l6 = ffffffff7449544e, Mem[0000000019000008] = 00000000
	stba	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = 4e000000
!	%f6  = 622f7d1d, %f28 = 6e615ce8
	fmovs	%f6 ,%f28		! %f28 = 622f7d1d

p2_label_45:
!	Mem[0000000018800120] = 8bcac8af 23a48c8b 0581e726 bd8379ed
	prefetcha [%i1+0x120]%asi,16
!	Branch On Register, %l2 = 00000000d4a1330b
	brgez,a,pt %l2,p2_b50		! Branch Taken
!	%l0 = 00000000ff000000, Mem[0000000018800008] = 088ad4c9
	stha	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = 0000d4c9
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x032,%g2
p2_b50:
	set	p2_b51,%o7
	fbo,a	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],22
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x033,%g2
p2_b51:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000001
!	%l5  = fffffffffea264e8
!	%l7  = 00000000fefffd1a

p2_label_46:
	set	p2_b52,%o7
	fbule,a	p2_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018800008] = 0000d4c9, %l6 = ffffffff7449544e
	ldsba	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x034,%g2
p2_b52:
!	Registers modified during the branch to p2_far_2
!	%l1  = b653e6eb9a60ac97
!	%l2  = 00000000ff000238
!	%l4  = 0000000000800000
!	%l5  = 00000235c8000000
	membar	#Sync			! Added by membar checker (390)
!	Mem[0000000031000024] = 2a122426, %l0 = 00000000ff000000
	lduba	[%o2+0x026]%asi,%l0	! %l0 = 0000000000000024
!	%l2 = ff000238, %l3 = 764b770c, Mem[0000000030800020] = 3909d397 a5c486fb
	std	%l2,[%o1+0x020]	! Mem[0000000030800020] = ff000238 764b770c
!	Mem[00000000180000a0] = fe5df803 b203f292 171f81bd ffc95824
	prefetch [%i0+0x0a0],4

p2_label_47:
	bne	p2_b53			! Branch Taken, %ccr = 1b, CWP = 0
!	Mem[0000000018800008] = 0000d4c9, %l1 = b653e6eb9a60ac97
	lduba	[%i1+%o6]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x035,%g2
p2_b53:
	membar	#Sync			! Added by membar checker (391)
!	%l5 = 00000235c8000000, Mem[0000000030800020] = ff000238764b770c
	stx	%l5,[%o1+0x020]		! Mem[0000000030800020] = 00000235c8000000
!	Mem[00000000190000c0] = c801bb20 9133b517 dbc79447 c23272fa
	prefetcha [%i2+0x0c0]%asi,23
	fblg,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0

p2_label_48:
!	%l2 = 00000000ff000238, Mem[0000000031800020] = 00000000
	sth	%l2,[%o3+0x020]		! Mem[0000000031800020] = 02380000
p2_b54:
	membar	#Sync			! Added by membar checker (392)
!	%l0 = 0000000000000024, Mem[0000000019000008] = 4e000000
	stba	%l0,[%i2+%o6]0x80	! Mem[0000000019000008] = 24000000
!	Mem[0000000018800008] = 0000d4c9, %l5 = 00000235c8000000
	ldswa	[%i1+%o6]0x80,%l5	! %l5 = 000000000000d4c9
!	Branch On Register, %l2 = 00000000ff000238
	brnz,pn	%l2,p2_b55		! Branch Taken
!	Mem[000000001900018c] = c5cceee2, %l6 = 0000000000000000
	swap	[%i2+0x18c],%l6		! %l6 = 00000000c5cceee2
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x037,%g2
p2_b55:

p2_label_49:
	membar	#Sync			! Added by membar checker (393)
!	Mem[000000003080006c] = e36f3aa2, %l6 = 00000000c5cceee2
	lduba	[%o1+0x06c]%asi,%l6	! %l6 = 00000000000000e3
	ba	p2_b56			! Branch Taken, %ccr = 1b, CWP = 0
!	Mem[000000003200000c] = b7c5e7c3, %l3 = 00000000764b770c
	ldsb	[%o4+0x00f],%g2		! %g2 = ffffffffffffffb7
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x038,%g2
p2_b56:
	fbn	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000003200006c] = 79d4a921, %l3 = 00000000764b770c
	lduh	[%o4+0x06c],%g2		! %g2 = 00000000000079d4
p2_b57:

p2_label_50:
	membar	#Sync			! Added by membar checker (394)
	set	p2_b58,%o7
	fble,pn	%fcc0,p2_near_3_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000019800090] = 84fc8b63, %l7 = 00000000fefffd1a
	ldsb	[%i3+0x092],%l7		! %l7 = ffffffffffffff8b
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x03a,%g2
p2_b58:
!	Registers modified during the branch to p2_near_3
!	%l0  = 0000000000000025
!	%l1  = 000000000000006d
	membar	#Sync			! Added by membar checker (395)
	fbl,pt	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	%l2 = 00000000ff000238, Mem[0000000030000068] = e3ec0000a0c0bef1
	stx	%l2,[%o0+0x068]		! Mem[0000000030000068] = 00000000ff000238
p2_b59:
	bge,a	p2_b60			! Branch Taken, %ccr = 1b, CWP = 0

p2_label_51:
!	Mem[00000000180001a0] = cf395b80 4e527958 6b4eb153 a4d8d8d0
	prefetch [%i0+0x1a0],3
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x03c,%g2
p2_b60:
	membar	#Sync			! Added by membar checker (396)
!	%f26 = 40000000, %f16 = 4289e51f
	fcmpes	%fcc3,%f26,%f16		! %fcc3 = 1
!	Mem[0000000019800160] = 3480a23f cc21cb28 dc083b3c 55794f86
	prefetcha [%i3+0x160]%asi,0
	bne	p2_b61			! Branch Taken, %ccr = 1b, CWP = 0
!	Mem[000000003180002c] = b09fad63, %l7 = ffffffffffffff8b
	ldsh	[%o3+0x02c],%l7		! %l7 = ffffffffffffb09f
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x03d,%g2
p2_b61:

p2_label_52:
	membar	#Sync			! Added by membar checker (397)
!	Mem[0000000018800050] = 7d0ec921, %l0 = 0000000000000025
	ldsw	[%i1+0x050],%l0		! %l0 = 000000007d0ec921
	fbne,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[00000000188001e0] = f4edca67 462e471c a12049f6 5678857a
	prefetch [%i1+0x1e0],23	! Annulled
p2_b62:
	membar	#Sync			! Added by membar checker (398)
!	Mem[0000000018800008] = 0000d4c9, %l4 = 0000000000800000
	ldswa	[%i1+%o6]0x80,%l4	! %l4 = 000000000000d4c9
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 1b

p2_label_53:
!	Mem[0000000019800180] = 57f28c36, %l7 = ffffffffffffb09f
	lduw	[%i3+0x180],%l7		! %l7 = 0000000057f28c36
p2_b63:
	membar	#Sync			! Added by membar checker (399)
!	Mem[000000001900000c] = 000000a1, %l5 = 000000000000d4c9
	ldub	[%i2+0x00c],%l5		! %l5 = 0000000000000000
!	%l4 = 000000000000d4c9, immed = fffff134, %l7 = 0000000057f28c36
	andncc	%l4,-0xecc,%l7		! %l7 = 00000000000004c9, %ccr = 00
!	Mem[0000000019800008] = 00000000, %l4 = 000000000000d4c9
	lduba	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
	set	p2_b64,%o7
	fbge,a	p2_far_3_le	! Branch Taken, %fcc0 = 0

p2_label_54:
!	Mem[0000000018800008] = 0000d4c9, %l6 = 00000000000000e3
	lduba	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000000
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x040,%g2
p2_b64:
!	Registers modified during the branch to p2_far_3
!	%l0  = fde0000000000000
!	%l1  = ffffffdec8127648
!	%l2  = ffffffffffffffbc
!	%l5  = 0000000000000000
	set	p2_b65,%o7
	fbe	p2_far_2_le	! Branch Taken, %fcc0 = 0
!	%l3 = 00000000764b770c, Mem[0000000019000000] = 3e4f5b03eb10ecd6
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000019000000] = 00000000764b770c
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x041,%g2
p2_b65:
!	Registers modified during the branch to p2_far_2
!	%l1  = b653e6eb9a60ac97
!	%l2  = fde0000000000239
!	%l4  = 0000000000000000
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (400)
!	Mem[000000003080006b] = 4b49a3d9, %l2 = fde0000000000239
	ldstuba	[%o1+0x06b]%asi,%l2	! %l2 = 00000000000000d9
!	%f26 = 40000000, %f5  = 3f9dd491, %f5  = 3f9dd491
	fsubs	%f26,%f5 ,%f5 		! %f5  = 3f4456de

p2_label_55:
!	%f6  = 622f7d1d, %f0  = 00000000
	fabss	%f6 ,%f0 		! %f0  = 622f7d1d
!	%l4 = 0000000000000000, %l3 = 00000000764b770c, %l4 = 0000000000000000
	addc	%l4,%l3,%l4		! %l4 = 00000000764b770c
	fbne,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000018800080] = dcc5fb8e 94a47574 f913afdc 438f32f5
	prefetch [%i1+0x080],20	! Annulled
p2_b66:
	membar	#Sync			! Added by membar checker (401)
	set	p2_b67,%o7
	fbne,pt	%fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 1

p2_label_56:
!	Mem[0000000030000068] = 00000000, %l4 = 00000000764b770c
	lduh	[%o0+0x068],%l4		! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x043,%g2
p2_b67:
!	Registers modified during the branch to p2_near_2
!	%l3  = 00000000000004c9
!	%l5  = 000000000000eba7
!	%l7  = b653e6eb9a60ac97
	membar	#Sync			! Added by membar checker (402)
	fbug,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l5 = 000000000000eba7, Mem[0000000018000008] = 066897a0
	stwa	%l5,[%i0+%o6]0x80	! Annulled
p2_b68:
	membar	#Sync			! Added by membar checker (403)
!	%f25 = 3f800000, %f5  = 3f4456de
	fstoi	%f25,%f5 		! %f5  = 00000001
!	%l7 = b653e6eb9a60ac97, immed = fffff352, %l3 = 00000000000004c9
	addcc	%l7,-0xcae,%l3		! %l3 = b653e6eb9a609fe9, %ccr = 99

p2_label_57:
	fbul	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000031800064] = 37336455, %l6 = 0000000000000000
	ldub	[%o3+0x065],%l6		! %l6 = 0000000000000033
p2_b69:
	membar	#Sync			! Added by membar checker (404)
	set	p2_b70,%o7
	fbo,a,pt %fcc1,p2_near_3_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000019800008] = 00000000, %l7 = b653e6eb9a60ac97
	ldswa	[%i3+%o6]0x80,%l7	! %l7 = 0000000000000000
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x046,%g2
p2_b70:
!	Registers modified during the branch to p2_near_3
!	%l0  = 0000000000000000
!	%l1  = b653e6eb9a609f01
!	%l6  = 0000000000000000
!	%l7  = 00000000ff000238
	membar	#Sync			! Added by membar checker (405)
!	Mem[0000000018000190] = de2439b7, %l3 = b653e6eb9a609fe9
	lduw	[%i0+0x190],%l3		! %l3 = 00000000de2439b7

p2_label_58:
	fbug,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001800005c] = f37d304e, %l2 = 00000000000000d9
	lduw	[%i0+0x05c],%l2		! Annulled
p2_b71:
	membar	#Sync			! Added by membar checker (406)
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],2
!	Mem[0000000019000140] = 466db59e, %l2 = 00000000000000d9
	swapa	[%i2+0x140]%asi,%l2	! %l2 = 00000000466db59e
!	Mem[000000001900012c] = 82f4799c, %l2 = 00000000466db59e
	ldsh	[%i2+0x12e],%l2		! %l2 = 000000000000799c

p2_label_59:
!	call to call_2, CWP = 0
	call	p2_call_2_he
!	Mem[0000000019800020] = 90bdb77a 2d73498a 321f9fb9 699cc94c
	prefetch [%i3+0x020],21
!	Registers modified during the branch to p2_call_2
!	%l3  = b653e6eb9a61189d
!	%l7  = 00000000000007f8
	bpos,a	p2_not_taken_0		! Branch Not Taken, %ccr = 8a
!	Mem[0000000031800028] = ccc12a82, %l4 = 0000000000000000
	lduh	[%o3+0x028],%l4		! Annulled
p2_b72:
	bg	p2_b73			! Branch Taken, %ccr = 8a, CWP = 0

p2_label_60:
!	Mem[0000000032000040] = ba91c68a c2a2c541 81d500c9 c1c67d6b
	prefetch [%o4+0x040],0
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x049,%g2
p2_b73:
	membar	#Sync			! Added by membar checker (407)
!	Branch On Register, %l3 = b653e6eb9a61189d
	brgez,pt %l3,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019000000] = 00000000, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
p2_b74:
	membar	#Sync			! Added by membar checker (408)
!	%l1 = b653e6eb9a609f01
	sethi	%hi(0xcf234000),%l1	! %l1 = 00000000cf234000
!	%f6  = 622f7d1d, %f6  = 622f7d1d, %f13 = 256b5292
	fadds	%f6 ,%f6 ,%f13		! %f13 = 62af7d1d

p2_label_61:
	bne,a	p2_b75			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000018000000] = 00000002, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000002
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x04b,%g2
p2_b75:
	membar	#Sync			! Added by membar checker (409)
!	%f19 = 550e7a41, %f23 = 3f800000
	fnegs	%f19,%f23		! %f23 = d50e7a41
!	Mem[000000003200000c] = 5e0357b7, %l7 = 00000000000007f8
	lduw	[%o4+0x00c],%g2		! %g2 = 00000000000007f8
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_62:
!	%l5 = 000000000000eba7, Mem[0000000018800000] = 0000d397
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000018800000] = 0000eba7
p2_b76:
	membar	#Sync			! Added by membar checker (410)
!	%l4 = 0000000000000002, %l5 = 000000000000eba7, %y  = 00000000
	umulcc	%l4,%l5,%l5		! %l5 = 000000000001d74e, %ccr = 00
	fbul	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019800000] = 9cd1e0d7, %l2 = 000000000000799c
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 000000009cd1e0d7
p2_b77:
	membar	#Sync			! Added by membar checker (411)
!	%l0 = 0000000000000000, immed = 00000bf1, %l3 = b653e6eb9a61189d
	addcc	%l0,0xbf1,%l3		! %l3 = 0000000000000bf1, %ccr = 00

p2_label_63:
!	Jump to jmpl_0, CWP = 0
	set	p2_jmpl_0_le,%g1
	jmpl	%g1,%g6
!	Mem[0000000018000060] = 4b9e9cd3 2881aed8 b9566bc0 455c7b23
	prefetch [%i0+0x060],0
!	Registers modified during the branch to p2_jmpl_0
!	%l0  = 0000000000000000
!	%l6  = 000000009cd1ecc8
!	%l7  = fffffffffffffb2a
!	Mem[00000000198001f0] = 4cfa0a684c39acf3, %l0 = 0000000000000000
	ldxa	[%i3+0x1f0]%asi,%l0	! %l0 = 4cfa0a684c39acf3
	bgu,a	p2_b78			! Branch Taken, %ccr = 0a, CWP = 0
!	%l6 = 000000009cd1ecc8, Mem[000000001b0001b0] = e333749dabce20c3
	stx	%l6,[%i6+0x1b0]		! Mem[000000001b0001b0] = 000000009cd1ecc8
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x04e,%g2
p2_b78:

p2_label_64:
	membar	#Sync			! Added by membar checker (412)
!	%l7 = fffffffffffffb2a, %l1 = 00000000cf234000, %y  = 00000000
	udiv	%l7,%l1,%l3		! %l3 = 0000000000000001
!	%l5 = 000000000001d74e, %l0 = 4cfa0a684c39acf3, %l0 = 4cfa0a684c39acf3
	addc	%l5,%l0,%l0		! %l0 = 4cfa0a684c3b8441
!	%l2 = 000000009cd1e0d7, immed = fffff67e, %y  = 00000000
	umulcc	%l2,-0x982,%l4		! %l4 = 9cd1db03fc8443d2, %ccr = 88
!	Mem[0000000019000000] = 00000000, %l1 = 00000000cf234000
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l7 = fffffffffffffb2a, immed = 00000d58, %y  = 9cd1db03
	smul	%l7,0xd58,%l1		! %l1 = ffffffffffbf7870

p2_label_65:
!	Mem[00000000198001d8] = c5590c07, %l2 = 000000009cd1e0d7
	ldsba	[%i3+0x1db]%asi,%l2	! %l2 = 0000000000000007
!	Branch On Register, %l7 = fffffffffffffb2a
	brnz,a,pt %l7,p2_b79		! Branch Taken
!	Mem[0000000031800028] = ccc12a82, %l2 = 0000000000000007
	lduw	[%o3+0x028],%l2		! %l2 = 00000000ccc12a82
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x04f,%g2
p2_b79:
	membar	#Sync			! Added by membar checker (413)
!	%f4  = d192069c 00000001, %f4  = d192069c 00000001
	fcmpd	%fcc1,%f4 ,%f4 		! %fcc1 = 0
!	Branch On Register, %l1 = ffffffffffbf7870
	brlez,a,pn %l1,p2_b80		! Branch Taken

p2_label_66:
!	Mem[00000000180001d4] = 06f5ed41, %l6 = 000000009cd1ecc8
	swap	[%i0+0x1d4],%l6		! %l6 = 0000000006f5ed41
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x050,%g2
p2_b80:
	membar	#Sync			! Added by membar checker (414)
!	%f21 = 19590fdd, %f18 = 00000000, %f7  = e03ac0a3
	fadds	%f21,%f18,%f7 		! %f7  = 19590fdd
!	Mem[00000000188001a0] = 18969c85 0eed1ad9 e78b51bc d6793461
	prefetch [%i1+0x1a0],20
	bvs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],1	! Annulled
p2_b81:

p2_label_67:
	membar	#Sync			! Added by membar checker (415)
!	Mem[0000000018000000] = 00000000 d7ca678c, %l4 = fc8443d2, %l5 = 0001d74e
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000d7ca678c
!	%l7 = fffffffffffffb2a, %l4 = 0000000000000000, %l4 = 0000000000000000
	tsubcc	%l7,%l4,%l4		! %l4 = fffffffffffffb2a, %ccr = 8a
!	%f14 = 5192069c, %f2  = 4013b1ca 223783f8
	fstod	%f14,%f2 		! %f2  = 423240d3 80000000
!	Mem[0000000018000000] = 00000000, %l4 = fffffffffffffb2a
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
	bge	p2_b82			! Branch Taken, %ccr = 8a, CWP = 0

p2_label_68:
!	Mem[000000003000006c] = ff000238, %l2 = 00000000ccc12a82
	swap	[%o0+0x06c],%l2		! %l2 = 00000000ff000238
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x052,%g2
p2_b82:
	membar	#Sync			! Added by membar checker (416)
!	Mem[0000000031800064] = 37336455, %l0 = 4cfa0a684c3b8441
	ldsba	[%o3+0x067]%asi,%l0	! %l0 = 0000000000000055
!	Mem[0000000032000040] = ba91c68a c2a2c541 81d500c9 c1c67d6b
	prefetcha [%o4+0x040]%asi,4
	set	p2_b83,%o7
	fbge,a,pn %fcc0,p2_near_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000030000028] = 00000000, %l3 = 0000000000000001
	ldsb	[%o0+0x02a],%l3		! %l3 = 0000000000000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x053,%g2
p2_b83:
!	Registers modified during the branch to p2_near_3
!	%l0  = 000000000047c890
!	%l1  = ffffffffffffff18
!	%l6  = 0000000000000000
!	%l7  = 00000000ccc12a82

p2_label_69:
	membar	#Sync			! Added by membar checker (417)
!	%f4  = d192069c 00000001, %f6  = 622f7d1d 19590fdd
	fcmped	%fcc2,%f4 ,%f6 		! %fcc2 = 1
!	%l5 = 00000000d7ca678c, Mem[00000000188000ae] = 62aa07f2
	stba	%l5,[%i1+0x0ae]%asi	! Mem[00000000188000ac] = 62aa8cf2
!	Mem[0000000019000000] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, %l0 = 000000000047c890, %l0 = 000000000047c890
	addc	%l6,%l0,%l0		! %l0 = 000000000047c891
!	Mem[0000000031000020] = 2c9bf8712a122426, %l7 = 00000000ccc12a82
	ldxa	[%o2+0x020]%asi,%l7	! %l7 = 2c9bf8712a122426

p2_label_70:
!	%l5 = 00000000d7ca678c, immed = 000009a5, %l6 = 0000000000000000
	addcc	%l5,0x9a5,%l6		! %l6 = 00000000d7ca7131, %ccr = 08
!	Mem[0000000018000140] = f97a080a 9eb1bb53 1e9e1c71 3a1b9a42
	prefetcha [%i0+0x140]%asi,21
!	Branch On Register, %l7 = 2c9bf8712a122426
	brz,a,pn %l7,p2_not_taken_0	! Branch Not Taken
!	%l4 = 0000000000000000, Mem[0000000019000008] = 24000000000000a1
	stxa	%l4,[%i2+%o6]0x80	! Annulled
p2_b84:
	membar	#Sync			! Added by membar checker (418)
!	Mem[0000000018000000] = fffffb2a d7ca678c 066897a0 612c7852
	prefetch [%i0+0x000],4

p2_label_71:
!	Mem[0000000032000040] = ba91c68a c2a2c541 81d500c9 c1c67d6b
	prefetcha [%o4+0x040]%asi,2
	fbn,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000019000008] = 24000000 000000a1, %l6 = d7ca7131, %l7 = 2a122426
	ldda	[%i2+%o6]0x80,%l6	! %l6 = 0000000024000000 00000000000000a1
p2_b85:
	membar	#Sync			! Added by membar checker (419)
!	%l6 = 0000000024000000
	sethi	%hi(0x60732000),%l6	! %l6 = 0000000060732000
!	Mem[0000000018000118] = 47ce2b92 e70873be, %l2 = ff000238, %l3 = 00000000
	ldd	[%i0+0x118],%l2		! %l2 = 0000000047ce2b92 00000000e70873be

p2_label_72:
!	%f4  = d192069c, %f28 = 622f7d1d
	fmovs	%f4 ,%f28		! %f28 = d192069c
!	%f10 = c1e2ff27 cbe9f51c, %f10 = c1e2ff27 cbe9f51c, %f6  = 622f7d1d 19590fdd
	fdivd	%f10,%f10,%f6 		! %f6  = 3ff00000 00000000
!	%l1 = ffffffffffffff18, immed = fffff2ec, %l6 = 0000000060732000
	taddcc	%l1,-0xd14,%l6		! %l6 = fffffffffffff204, %ccr = 99
!	Mem[00000000180000c0] = d29b449c 558696f9 8ad980eb 4a7469ee
	prefetcha [%i0+0x0c0]%asi,4
!	%l6 = fffff204, %l7 = 000000a1, Mem[0000000019800008] = 00000000 d1d7d224
	stda	%l6,[%i3+%o6]0x80	! Mem[0000000019800008] = fffff204 000000a1

p2_label_73:
!	%f12 = 2a374903 62af7d1d, %f12 = 2a374903 62af7d1d, %f30 = c1e2ff27 00000002
	faddd	%f12,%f12,%f30		! %f30 = 2a474903 62af7d1d
!	Mem[0000000019000000] = 00000000, %l5 = 00000000d7ca678c
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000019800180] = 57f28c36 3ac9898c 17c8ad1b 19255183
	prefetch [%i3+0x180],0
!	%f18 = 00000000, %f22 = 91a8be66, %f22 = 91a8be66
	fadds	%f18,%f22,%f22		! %f22 = 91a8be66
!	Mem[0000000019000000] = 00000000 764b770c, %l0 = 0047c891, %l1 = ffffff18
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000764b770c

p2_label_74:
!	%l2 = 47ce2b92, %l3 = e70873be, Mem[00000000180001e8] = 07515f44 34dd5015
	stda	%l2,[%i0+0x1e8]%asi	! Mem[00000000180001e8] = 47ce2b92 e70873be
!	%l1 = 00000000764b770c, immed = 00000013, %l1 = 00000000764b770c
	srlx	%l1,0x013,%l1		! %l1 = 0000000000000ec9
!	Mem[0000000032000044] = c54181d5, %l2 = 0000000047ce2b92
	ldsba	[%o4+0x046]%asi,%g2	! %g2 = ffffffffffffffc5
!	%f6  = 3ff00000 00000000, %f20 = 400f6394
	fdtoi	%f6 ,%f20		! %f20 = 00000001
!	Mem[0000000018000000] = fffffb2a, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ffff

p2_label_75:
	fbg,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[0000000030000024] = 4b4926af, %l3 = 00000000e70873be
	ldstub	[%o0+0x024],%l3		! Annulled
p2_b86:
	membar	#Sync			! Added by membar checker (420)
!	%l2 = 0000000047ce2b92, immed = fffff691, %l3 = 00000000e70873be
	taddcc	%l2,-0x96f,%l3		! %l3 = 0000000047ce2223, %ccr = 13
!	%f4  = d192069c 00000001, %f28 = d192069c e5eb3868, %f2  = 423240d3 80000000
	fsubd	%f4 ,%f28,%f2 		! %f2  = 504cbd67 0ce00000
!	Branch On Register, %l7 = 00000000000000a1
	brgez,a,pt %l7,p2_b87		! Branch Taken

p2_label_76:
!	Mem[0000000032000068] = 6a5f407e, %l2 = 0000000047ce2b92
	lduw	[%o4+0x068],%g2		! %g2 = 0000000047ce2b92
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x057,%g2
p2_b87:
	membar	#Sync			! Added by membar checker (421)
!	%f18 = 00000000, %f28 = d192069c, %f4  = d192069c
	fdivs	%f18,%f28,%f4 		! %f4  = 80000000
	fbl	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetch [%o4+0x060],2
p2_b88:
	membar	#Sync			! Added by membar checker (422)
!	%f3  = 0ce00000, %f21 = 19590fdd
	fcmps	%fcc2,%f3 ,%f21		! %fcc2 = 1

p2_label_77:
!	%l6 = fffffffffffff204, Mem[0000000018800008] = 0000d4c9
	stw	%l6,[%i1+0x008]		! Mem[0000000018800008] = fffff204
!	Mem[0000000018800018] = 00000001 00000001, %l5 = 0000000000000000, %l3 = 0000000047ce2223
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 1752e1539fc451d4
!	Mem[0000000019000120] = 41b1232e b87e91b2 bdab68ac 82f4799c
	prefetcha [%i2+0x120]%asi,0
	set	p2_b89,%o7
	fbo,pt	%fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000019800008] = fffff204, %l6 = fffffffffffff204
	swapa	[%i3+%o6]0x80,%l6	! %l6 = 00000000fffff204
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x059,%g2
p2_b89:
!	Registers modified during the branch to p2_near_0
!	%l3  = a443ba05473279bc
!	%l7  = 0000000000007a0b

p2_label_78:
	set	p2_b90,%o7
	fbue	p2_far_1_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003100002c] = 63e2f35c, %l0 = 0000000000000000
	lduw	[%o2+0x02c],%l0		! %l0 = 0000000063e2f35c
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x05a,%g2
p2_b90:
!	Registers modified during the branch to p2_far_1
!	%l2  = 0000000020c08240
!	%l4  = 00000000000077ea
	membar	#Sync			! Added by membar checker (423)
	set	p2_b91,%o7
	fbo,a,pn %fcc2,p2_near_0_le	! Branch Taken, %fcc2 = 1
!	%l7 = 0000000000007a0b, Mem[0000000019800008] = fffff204
	stha	%l7,[%i3+%o6]0x80	! Mem[0000000019800008] = 7a0bf204
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x05b,%g2
p2_b91:
!	Registers modified during the branch to p2_near_0
!	%l1  = a443ba0547327665
!	%l4  = 0000000000000008
!	%l6  = 0000000000007923
	fblg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_79:
!	Mem[0000000018000008] = 066897a0, %l1 = a443ba0547327665
	lduwa	[%i0+%o6]0x80,%l1	! Annulled
p2_b92:
	membar	#Sync			! Added by membar checker (424)
!	%l7 = 0000000000007a0b, %l6 = 0000000000007923, %l0 = 0000000063e2f35c
	xnorcc	%l7,%l6,%l0		! %l0 = fffffffffffffcd7, %ccr = 88
!	%f8  = 69106f89 03fbd1e0, %f6  = 3ff00000 00000000, %f14 = 5192069c 3f9dd491
	fmuld	%f8 ,%f6 ,%f14		! %f14 = 69106f89 03fbd1e0
	set	p2_b93,%o7
	fbue,a,pn %fcc0,p2_near_1_le	! Branch Taken, %fcc0 = 0
!	Mem[000000003200000c] = 5e0357b7, %l3 = a443ba05473279bc
	ldsb	[%o4+0x00c],%g2		! %g2 = 000000000000005e
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x05d,%g2
p2_b93:
!	Registers modified during the branch to p2_near_1
!	%l3  = fffffffffffffcd7
!	%l5  = ffffffffffffe6b8
!	%l6  = 0000014887740886
!	%l7  = 0000014887740a8e

p2_label_80:
	membar	#Sync			! Added by membar checker (425)
!	%f14 = 69106f89 03fbd1e0, %f8  = 69106f89 03fbd1e0, %f14 = 69106f89 03fbd1e0
	fsubd	%f14,%f8 ,%f14		! %f14 = 00000000 00000000
!	Mem[0000000032000000] = a19e01fc, %l0 = fffffffffffffcd7
	ldsw	[%o4+0x000],%g2		! %g2 = fffffffffffffcd7
!	%l0 = fffffcd7, %l1 = 47327665, Mem[0000000032000030] = 4a9fa039 b105dabe
	std	%l0,[%o4+0x030]	! Mem[0000000032000030] = fffffcd7 47327665
!	%l6 = 0000014887740886, %l4 = 0000000000000008, %l6 = 0000014887740886
	or	%l6,%l4,%l6		! %l6 = 000001488774088e
	ble	p2_b94			! Branch Taken, %ccr = 88, CWP = 0

p2_label_81:
!	Mem[0000000018000040] = 2a99e207 b8b77797 5bdc2aaa 02566658
	prefetch [%i0+0x040],2
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x05e,%g2
p2_b94:
	membar	#Sync			! Added by membar checker (426)
!	%l1 = a443ba0547327665, immed = 0000002f, %l2 = 0000000020c08240
	srlx	%l1,0x02f,%l2		! %l2 = 0000000000014887
!	Branch On Register, %l3 = fffffffffffffcd7
	brgez,a,pn %l3,p2_not_taken_0	! Branch Not Taken
!	Mem[00000000198001d4] = d3c7acca, %l5 = ffffffffffffe6b8
	ldsw	[%i3+0x1d4],%l5		! Annulled
p2_b95:
	fbne,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_82:
!	Mem[0000000018000008] = 066897a0, %l5 = ffffffffffffe6b8
	ldswa	[%i0+%o6]0x80,%l5	! Annulled
p2_b96:
	membar	#Sync			! Added by membar checker (427)
!	Branch On Register, %l0 = fffffffffffffcd7
	brlz,pn	%l0,p2_b97		! Branch Taken
!	%l4 = 0000000000000008, Mem[000000003200003e] = ee09ba91
	sth	%l4,[%o4+0x03e]		! Mem[000000003200003c] = 0008ba91
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x061,%g2
p2_b97:
	membar	#Sync			! Added by membar checker (428)
!	%l3 = fffffffffffffcd7, immed = 00000002, %l6 = 000001488774088e
	sll	%l3,0x002,%l6		! %l6 = fffffffffffff35c
!	%l1 = a443ba0547327665, immed = 0000003e, %l0 = fffffffffffffcd7
	srax	%l1,0x03e,%l0		! %l0 = fffffffffffffffe

p2_label_83:
	fbl,pn	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[0000000019000168] = c0a40043a038dd7f, %l3 = fffffffffffffcd7
	ldx	[%i2+0x168],%l3		! %l3 = c0a40043a038dd7f
p2_b98:
	membar	#Sync			! Added by membar checker (429)
!	Denormal Floating Point Operation Nullified
	nop
!	Mem[0000000019000160] = fb999896 60a5e19d c0a40043 a038dd7f
	prefetcha [%i2+0x160]%asi,22
!	Branch On Register, %l2 = 0000000000014887
	brgz,a,pn %l2,p2_b99		! Branch Taken

p2_label_84:
!	Mem[0000000019000000] = 00000000, %l0 = fffffffffffffffe
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x063,%g2
p2_b99:
	membar	#Sync			! Added by membar checker (430)
	fbul,pt	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[00000000188001bc] = a8085b2a, %l7 = 0000014887740a8e
	ldub	[%i1+0x1bd],%l7		! %l7 = 0000000000000008
p2_b100:
	membar	#Sync			! Added by membar checker (431)
!	%l5 = ffffffffffffe6b8, %l2 = 0000000000014887, %y  = 00000000
	sdiv	%l5,%l2,%l1		! %l1 = 000000000000c77b
	set	p2_b101,%o7
	fblg,a,pt %fcc2,p2_near_3_he	! Branch Taken, %fcc2 = 1

p2_label_85:
!	Mem[0000000019000000] = 00000000, %l1 = 000000000000c77b
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x065,%g2
p2_b101:
!	Registers modified during the branch to p2_near_3
!	%l0  = ffffffffffff8940
!	%l1  = c0a40043a038dc97
!	%l6  = 0000000000000000
!	%l7  = 00000000ccc12a82
	ble	p2_not_taken_0		! Branch Not Taken, %ccr = 8a
!	%l7 = 00000000ccc12a82, Mem[0000000032000020] = 0d6df8b2
	sth	%l7,[%o4+0x020]		! Mem[0000000032000020] = 2a82f8b2
p2_b102:
	membar	#Sync			! Added by membar checker (432)
!	%l1 = c0a40043a038dc97, immed = 00000fa4, %l2 = 0000000000014887
	orcc	%l1,0xfa4,%l2		! %l2 = c0a40043a038dfb7, %ccr = 88
!	%l2 = c0a40043a038dfb7, immed = fffff2c3, %y  = ffffffff
	udiv	%l2,-0xd3d,%l5		! %l5 = 00000000ffffffff

p2_label_86:
	bpos	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000019800020] = 90bdb77a, %l1 = c0a40043a038dc97
	ldsw	[%i3+0x020],%l1		! %l1 = ffffffff90bdb77a
p2_b103:
	membar	#Sync			! Added by membar checker (433)
!	Mem[00000000198000c0] = 17359f00, %l4 = 0000000000000008
	lduwa	[%i3+0x0c0]%asi,%l4	! %l4 = 0000000017359f00
!	%l6 = 00000000, %l7 = ccc12a82, Mem[0000000031000020] = 2c9bf871 2a122426
	std	%l6,[%o2+0x020]	! Mem[0000000031000020] = 00000000 ccc12a82
!	Mem[0000000031000020] = 00000000, %l1 = ffffffff90bdb77a
	lduh	[%o2+0x022],%l1		! %l1 = 0000000000000000

p2_label_87:
!	%l7 = 00000000ccc12a82, immed = fffffe62, %l6 = 0000000000000000
	xnorcc	%l7,-0x19e,%l6		! %l6 = 00000000ccc12b1f, %ccr = 08
!	Mem[000000001800015c] = 8ef33ff1, %l2 = c0a40043a038dfb7
	ldsb	[%i0+0x15d],%l2		! %l2 = fffffffffffffff3
!	%l2 = fffffffffffffff3, Mem[0000000031800020] = 0238000000008862
	stx	%l2,[%o3+0x020]		! Mem[0000000031800020] = fffffffffffffff3
!	%l5 = 00000000ffffffff
	sethi	%hi(0xdb268400),%l5	! %l5 = 00000000db268400
!	%l1 = 0000000000000000, immed = fffff2f8, %y  = ffffffff
	umulcc	%l1,-0xd08,%l5		! %l5 = 0000000000000000, %ccr = 44

p2_label_88:
!	%f18 = 00000000, %f10 = c1e2ff27, %f11 = cbe9f51c
	fadds	%f18,%f10,%f11		! %f11 = c1e2ff27
!	Mem[0000000031800020] = ffffffff, %l7 = 00000000ccc12a82
	swapa	[%o3+0x020]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000031000028] = 6a764cec, %l7 = 00000000ffffffff
	lduw	[%o2+0x028],%l7		! %l7 = 000000006a764cec
	bleu,a	p2_b104			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000018000008] = 066897a0, %l0 = ffffffffffff8940
	swapa	[%i0+%o6]0x80,%l0	! %l0 = 00000000066897a0
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x068,%g2
p2_b104:

p2_label_89:
	membar	#Sync			! Added by membar checker (434)
!	%l2 = fffffffffffffff3, %l3 = c0a40043a038dd7f, %l0 = 00000000066897a0
	andcc	%l2,%l3,%l0		! %l0 = c0a40043a038dd73, %ccr = 88
!	%l7 = 000000006a764cec, immed = fffff0ed, %y  = 00000000
	udivcc	%l7,-0xf13,%l5		! %l5 = 0000000000000000, %ccr = 44
!	Mem[0000000018000140] = f97a080a 9eb1bb53 1e9e1c71 3a1b9a42
	prefetch [%i0+0x140],3
!	%f24 = 91a8be66 3f800000, %f24 = 91a8be66 3f800000, %f6  = 3ff00000 00000000
	faddd	%f24,%f24,%f6 		! %f6  = 91b8be66 3f800000
!	Mem[0000000019800000] = 0000799c, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 000000000000799c

p2_label_90:
!	Mem[0000000018800008] = fffff204 cafec578, %l0 = a038dd73, %l1 = 0000799c
	ldda	[%i1+%o6]0x80,%l0	! %l0 = 00000000fffff204 00000000cafec578
!	Mem[0000000032000060] = be38db17 ddc4e6bc 6a5f407e 79d4a921
	prefetcha [%o4+0x060]%asi,1
	set	p2_b105,%o7
	fbuge,a	p2_far_0_he	! Branch Taken, %fcc0 = 0
!	%l2 = fffffffffffffff3, Mem[0000000018000000] = fffffb2a
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000018000000] = f3fffb2a
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x069,%g2
p2_b105:
!	Registers modified during the branch to p2_far_0
!	%l0  = 00000000ccc12a82
!	%l1  = 00000000fffffff3
	ble	p2_b106			! Branch Taken, %ccr = 44, CWP = 0

p2_label_91:
!	%l6 = 00000000ccc12b1f, Mem[0000000019800000] = 0000799c
	stwa	%l6,[%i3+%g0]0x80	! Mem[0000000019800000] = ccc12b1f
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x06a,%g2
p2_b106:
	membar	#Sync			! Added by membar checker (435)
!	Mem[0000000019800040] = 92f8d681 06e6b733 79801213 cf4341e1
	prefetch [%i3+0x040],20
!	Mem[0000000031000064] = 6de4fca8, %l1 = 00000000fffffff3
	lduh	[%o2+0x064],%l1		! %l1 = 0000000000006de4
!	Mem[000000003100006d] = 5c268775, %l2 = fffffffffffffff3
	ldstuba	[%o2+0x06d]%asi,%l2	! %l2 = 0000000000000026
!	%l4 = 0000000017359f00, immed = ffffff57, %l6 = 00000000ccc12b1f
	subccc	%l4,-0x0a9,%l6		! %l6 = 0000000017359fa9, %ccr = 11

p2_label_92:
!	%l5 = 0000000000000000, %l1 = 0000000000006de4, %l3 = c0a40043a038dd7f
	xnor	%l5,%l1,%l3		! %l3 = ffffffffffff921b
!	%l0 = 00000000ccc12a82, Mem[0000000018000128] = 8dcb9aaad21c6b14
	stxa	%l0,[%i0+0x128]%asi	! Mem[0000000018000128] = 00000000ccc12a82
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001b000020] = d2bcff08 bcbf350c 8084c8ec 549a5559
	prefetch [%i6+0x020],22
p2_b107:
	membar	#Sync			! Added by membar checker (436)
!	%l3 = ffffffffffff921b, immed = fffff5ed, %l0 = 00000000ccc12a82
	andcc	%l3,-0xa13,%l0		! %l0 = ffffffffffff9009, %ccr = 88

p2_label_93:
	fbul	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000019000100] = 26b97a0b 7cc256cf 4e44490e f77d887f
	prefetch [%i2+0x100],20
p2_b108:
	membar	#Sync			! Added by membar checker (437)
!	%l4 = 0000000017359f00, immed = fffffaac, %l1 = 0000000000006de4
	orcc	%l4,-0x554,%l1		! %l1 = ffffffffffffffac, %ccr = 88
!	%l6 = 0000000017359fa9, immed = 0000012b, %y  = 00000000
	smul	%l6,0x12b,%l7		! %l7 = 0000001b1ba17a63
!	%l2 = 0000000000000026, %l4 = 0000000017359f00, %y  = 0000001b
	udivx	%l2,%l4,%l6		! %l6 = 0000000000000000

p2_label_94:
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000003080002a] = 00d98b00, %l0 = ffffffffffff9009
	ldstub	[%o1+0x02a],%l0		! %l0 = 000000000000008b
p2_b109:
	membar	#Sync			! Added by membar checker (438)
!	Mem[0000000030800020] = 00000235c8000000, %l5 = 0000000000000000
	ldxa	[%o1+0x020]%asi,%l5	! %l5 = 00000235c8000000
!	Mem[0000000019000030] = 88622ae7, %l6 = 0000000000000000
	ldsba	[%i2+0x030]%asi,%l6	! %l6 = ffffffffffffff88
!	%l2 = 0000000000000026, %l0 = 000000000000008b, %l0 = 000000000000008b
	orcc	%l2,%l0,%l0		! %l0 = 00000000000000af, %ccr = 00

p2_label_95:
!	%l5 = 00000235c8000000, immed = 00000bcf, %y  = 0000001b
	udiv	%l5,0xbcf,%l3		! %l3 = 00000000025a45f2
!	%l4 = 0000000017359f00, Mem[0000000031000060] = 1377a1106de4fca8
	stxa	%l4,[%o2+0x060]%asi	! Mem[0000000031000060] = 0000000017359f00
!	%l1 = ffffffffffffffac, %l4 = 0000000017359f00, %y  = 0000001b
	udiv	%l1,%l4,%l0		! %l0 = 0000000000000134
!	Mem[0000000019800140] = 3c6a8cd8 9f98283e 8c4cb2e9 396513ef
	prefetcha [%i3+0x140]%asi,1
	bgu	p2_b110			! Branch Taken, %ccr = 00, CWP = 0

p2_label_96:
!	Mem[000000001800009e] = dd01933d, %l7 = 0000001b1ba17a63
	ldstub	[%i0+0x09e],%l7		! %l7 = 0000000000000093
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x06e,%g2
p2_b110:
	membar	#Sync			! Added by membar checker (439)
!	%l1 = ffffffffffffffac, immed = fffff60a, %y  = 0000001b
	udivx	%l1,-0x9f6,%l5		! %l5 = 0000000000000001
	ba,a	p2_b111			! Branch Taken, %ccr = 00, CWP = 0
!	%l1 = ffffffffffffffac, Mem[0000000018000008] = ffff8940
	stba	%l1,[%i0+%o6]0x80	! Annulled
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x06f,%g2
p2_b111:
	membar	#Sync			! Added by membar checker (440)
!	%l4 = 0000000017359f00, %l7 = 0000000000000093, %y  = 0000001b
	umulcc	%l4,%l7,%l1		! %l1 = 0000000d53ca4d00, %ccr = 00

p2_label_97:
!	Mem[00000000190001a0] = 59157360 b189ccd6 7f68946d 7a151b3d
	prefetcha [%i2+0x1a0]%asi,1
!	%l1 = 0000000d53ca4d00, Mem[0000000019000008] = 24000000
	stha	%l1,[%i2+%o6]0x80	! Mem[0000000019000008] = 4d000000
!	Mem[00000000198001a0] = 807cdc85 83525de9 550f9e0d d18bc7fe
	prefetcha [%i3+0x1a0]%asi,2
!	Mem[0000000018800008] = fffff204, %l2 = 0000000000000026
	swapa	[%i1+%o6]0x80,%l2	! %l2 = 00000000fffff204
!	%l1 = 0000000d53ca4d00, %l2 = 00000000fffff204, %l5 = 0000000000000001
	orncc	%l1,%l2,%l5		! %l5 = ffffffff53ca4dfb, %ccr = 80

p2_label_98:
!	Mem[0000000018000000] = f3fffb2a, %l4 = 0000000017359f00
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = fffffffffffffff3
!	Mem[00000000198000e0] = 05de3417 a403b61b
	flush	%i3+0x0e0
!	Mem[00000000188001e8] = a12049f65678857a, %l6 = ffffffffffffff88
	ldx	[%i1+0x1e8],%l6		! %l6 = a12049f65678857a
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 80
!	Mem[0000000019000000] = 00000000, %l1 = 0000000d53ca4d00
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
p2_b112:

p2_label_99:
	membar	#Sync			! Added by membar checker (441)
!	Branch On Register, %l1 = 0000000000000000
	brgez,a,pt %l1,p2_b113		! Branch Taken
!	%l1 = 0000000000000000, Mem[00000000190001f0] = a2d19095
	stb	%l1,[%i2+0x1f0]		! Mem[00000000190001f0] = 00d19095
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x071,%g2
p2_b113:
	membar	#Sync			! Added by membar checker (442)
!	Mem[0000000018800120] = 8bcac8af 23a48c8b 0581e726 bd8379ed
	prefetch [%i1+0x120],2
!	Mem[000000001a000008] = a724b54e, %l7 = 0000000000000093
	lduba	[%i4+%o6]0x80,%l7	! %l7 = 00000000000000a7
	fbul,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_100:
!	Mem[0000000030800028] = 00d9ff00, %l7 = 00000000000000a7
	lduw	[%o1+0x028],%l7		! Annulled
p2_b114:
	membar	#Sync			! Added by membar checker (443)
!	%l0 = 0000000000000134, Mem[0000000031800020] = ccc12a82fffffff3
	stx	%l0,[%o3+0x020]		! Mem[0000000031800020] = 0000000000000134
!	%f10 = c1e2ff27 c1e2ff27, %f22 = 91a8be66 d50e7a41
	fcmped	%fcc3,%f10,%f22		! %fcc3 = 1
!	%l2 = 00000000fffff204, Mem[0000000019800168] = dc083b3c
	stwa	%l2,[%i3+0x168]%asi	! Mem[0000000019800168] = fffff204
	set	p2_b115,%o7
	fbule	p2_far_1_he	! Branch Taken, %fcc0 = 0

p2_label_101:
!	Mem[0000000030800028] = 00d9ff00 088ad4c9, %l0 = 00000134, %l1 = 00000000
	ldd	[%o1+0x028],%l0		! %l0 = 0000000000d9ff00 00000000088ad4c9
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x073,%g2
p2_b115:
!	Registers modified during the branch to p2_far_1
!	%l2  = 5edfb609aa617986
!	%l3  = ffffffff51800809
	membar	#Sync			! Added by membar checker (444)
	set	p2_b116,%o7
	fbuge,a,pt %fcc1,p2_near_3_le	! Branch Taken, %fcc1 = 0
!	Mem[0000000032000040] = ba91c68a c2a2c541 81d500c9 c1c67d6b
	prefetch [%o4+0x040],3
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x074,%g2
p2_b116:
!	Registers modified during the branch to p2_near_3
!	%l0  = 000000000964d3ca
!	%l1  = 0000000000000017
	membar	#Sync			! Added by membar checker (445)
!	Mem[00000000180000e0] = 97a6e6a5 f2831804 e2f0c3f9 ac0df7b1
	prefetch [%i0+0x0e0],22

	ba,a	p2_not_taken_0_end
p2_not_taken_0:
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba,a	p2_branch_failed
p2_not_taken_0_end:

!	%f15 = 00000000, %f2  = 504cbd67, %f25 = 3f800000
	fsubs	%f15,%f2 ,%f25		! %f25 = d04cbd67

p2_label_102:
!	Mem[0000000018000160] = cd4e6673 5d494c13 5d4f71f6 e2ea5e84
	prefetcha [%i0+0x160]%asi,22
!	%l4 = fffffffffffffff3, %l1 = 0000000000000017, %l1 = 0000000000000017
	sll	%l4,%l1,%l1		! %l1 = fffffffff9800000
	bg,a	p2_not_taken_0		! Branch Not Taken, %ccr = 19
!	 Annulled
	ldd	[%i0+0x1c8],%l0
p2_b117:
	membar	#Sync			! Added by membar checker (446)
!	%l0 = 000000000964d3ca, %l3 = ffffffff51800809, %y  = 0000000d
	smulcc	%l0,%l3,%l2		! %l2 = 02fd99b84a29c21a, %ccr = 00

p2_label_103:
	set	p2_b118,%o7
	fbge	p2_far_3_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000019000140] = 000000d9 db0449f9 1761e56b 16962be6
	prefetch [%i2+0x140],2
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x076,%g2
p2_b118:
!	Registers modified during the branch to p2_far_3
!	%l3  = fffffffff98000a7
!	%l6  = 0000000002fd99bf
	bpos	p2_b119			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000024] = 6a4ec5f4, %l0 = 000000000964d3ca
	ldsw	[%o4+0x024],%g2		! %g2 = 000000000964d3ca
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x077,%g2
p2_b119:
	set	p2_b120,%o7
	fbule	p2_far_0_le	! Branch Taken, %fcc0 = 0

p2_label_104:
!	Mem[0000000018800040] = 3903bf40 7e091a2f c317fa57 468dbe1e
	prefetch [%i1+0x040],22
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x078,%g2
p2_b120:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000003
!	%l5  = ffffffff80000000
!	%l7  = 000000000964d0e4
	set	p2_b121,%o7
	fbue	p2_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[00000000198001e8] = f0349c2e, %l2 = 02fd99b84a29c21a
	lduh	[%i3+0x1e8],%l2		! %l2 = 000000000000f034
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x079,%g2
p2_b121:
!	Registers modified during the branch to p2_far_3
!	%l0  = fde0000000000000
!	%l1  = ffffffff3b37be58
!	%l2  = ffffffffffffffbc
!	%l5  = 0024dc0126cd9b36
	membar	#Sync			! Added by membar checker (447)
!	%l4 = 0000000000000003, immed = fffffa0f, %l0 = fde0000000000000
	subccc	%l4,-0x5f1,%l0		! %l0 = 00000000000005f4, %ccr = 11
	ba	p2_b122			! Branch Taken, %ccr = 11, CWP = 0

p2_label_105:
!	Mem[000000001880010d] = a30e1f7f, %l6 = 0000000002fd99bf
	ldstub	[%i1+0x10d],%l6		! %l6 = 000000000000000e
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x07a,%g2
p2_b122:
	set	p2_b123,%o7
	fbule	p2_far_0_le	! Branch Taken, %fcc0 = 0
!	Mem[0000000018800008] = 00000026, %l4 = 0000000000000003
	lduha	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x07b,%g2
p2_b123:
!	Registers modified during the branch to p2_far_0
!	%l4  = 0000000000000003
!	%l5  = ffffffff80000000
!	%l7  = 000000000000030e
	membar	#Sync			! Added by membar checker (448)
!	%l5 = ffffffff80000000, %l4 = 0000000000000003, %l1 = ffffffff3b37be58
	sub	%l5,%l4,%l1		! %l1 = ffffffff7ffffffd
!	Denormal Floating Point Operation Nullified
	nop

p2_label_106:
!	%l6 = 000000000000000e, immed = 00000a3c, %l0 = 00000000000005f4
	sub	%l6,0xa3c,%l0		! %l0 = fffffffffffff5d2
	fbl,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l2 = ffffffffffffffbc, Mem[0000000018000000] = f3fffb2ad7ca678c
	stxa	%l2,[%i0+%g0]0x80	! Annulled
p2_b124:
	membar	#Sync			! Added by membar checker (449)
!	%l4 = 0000000000000003, %l3 = fffffffff98000a7, %l2 = ffffffffffffffbc
	subccc	%l4,%l3,%l2		! %l2 = 00000000067fff5b, %ccr = 11
!	%f18 = 00000000 550e7a41, %f22 = 91a8be66 d50e7a41
	fmovd	%f18,%f22		! %f22 = 00000000 550e7a41

p2_label_107:
!	%l3 = fffffffff98000a7, immed = 0000000d, %l2 = 00000000067fff5b
	srl	%l3,0x00d,%l2		! %l2 = 000000000007cc00
	set	p2_b125,%o7
	fba,a,pt %fcc3,p2_near_1_he	! Branch Taken, %fcc3 = 1
!	%l5 = ffffffff80000000, Mem[0000000031800020] = 00000000
	sth	%l5,[%o3+0x020]		! Annulled
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x07d,%g2
p2_b125:
	bg,a	p2_b126			! Branch Taken, %ccr = 11, CWP = 0
!	Mem[00000000198001a0] = 807cdc85 83525de9 550f9e0d d18bc7fe
	prefetch [%i3+0x1a0],23
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x07e,%g2
p2_b126:

p2_label_108:
	fblg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l1 = ffffffff7ffffffd, Mem[0000000031800068] = 078fdb4f
	sth	%l1,[%o3+0x068]		! Mem[0000000031800068] = fffddb4f
p2_b127:
	membar	#Sync			! Added by membar checker (450)
	set	p2_b128,%o7
	fble,a,pn %fcc1,p2_near_1_he	! Branch Taken, %fcc1 = 0
!	Mem[0000000019800000] = ccc12b1f 556ba9b6, %l2 = 0007cc00, %l3 = f98000a7
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ccc12b1f 00000000556ba9b6
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x080,%g2
p2_b128:
	membar	#Sync			! Added by membar checker (451)
!	%l6 = 000000000000000e, immed = 00000ead, %l0 = fffffffffffff5d2
	xnorcc	%l6,0xead,%l0		! %l0 = fffffffffffff15c, %ccr = 88

p2_label_109:
!	%l6 = 000000000000000e, immed = 00000a99, %l4 = 0000000000000003
	add	%l6,0xa99,%l4		! %l4 = 0000000000000aa7
	fbg,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[000000001a800124] = 256ad830, %l2 = 00000000ccc12b1f
	ldsb	[%i5+0x125],%l2		! %l2 = 000000000000006a
p2_b129:
	membar	#Sync			! Added by membar checker (452)
!	%f7  = 3f800000, %f2  = 504cbd67
	fstoi	%f7 ,%f2 		! %f2  = 00000001
!	%l4 = 0000000000000aa7, %l2 = 000000000000006a, %l2 = 000000000000006a
	sub	%l4,%l2,%l2		! %l2 = 0000000000000a3d

p2_label_110:
!	Mem[000000003180006c] = bcee6bbf, %l2 = 00000a3d, %l1 = 7ffffffd
	add	%o3,0x6c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000bcee6bbf
!	%f16 = 4289e51f, %f24 = 91a8be66
	fcmps	%fcc1,%f16,%f24		! %fcc1 = 2
!	Mem[0000000030800028] = 00d9ff00, %l0 = fffffffffffff15c
	ldstub	[%o1+0x028],%l0		! %l0 = 0000000000000000
!	%l5 = ffffffff80000000, immed = 00000309, %l7 = 000000000000030e
	orn	%l5,0x309,%l7		! %l7 = fffffffffffffcf6
!	%f14 = 00000000 00000000, %f6  = 91b8be66
	fdtoi	%f14,%f6 		! %f6  = 00000000

p2_label_111:
!	Mem[0000000031800028] = ccc12a82, %l7 = fffffffffffffcf6
	swapa	[%o3+0x028]%asi,%l7	! %l7 = 00000000ccc12a82
!	%l4 = 0000000000000aa7, immed = fffff311, %l4 = 0000000000000aa7
	and	%l4,-0xcef,%l4		! %l4 = 0000000000000201
!	Mem[0000000018800008] = 00000026, %l6 = 000000000000000e
	ldsha	[%i1+%o6]0x80,%l6	! %l6 = 0000000000000000
	set	p2_b130,%o7
	fbue,a	p2_far_1_he	! Branch Taken, %fcc0 = 0
!	Mem[000000003080006a] = 4b49a3ff, %l2 = 0000000000000a3d
	ldstub	[%o1+0x06a],%l2		! %l2 = 00000000000000a3
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x082,%g2
p2_b130:
!	Registers modified during the branch to p2_far_1
!	%l2  = 0000000000000000
!	%l3  = ffffffff80000000

p2_label_112:
	membar	#Sync			! Added by membar checker (453)
!	%l1 = 00000000bcee6bbf, immed = fffffefb, %l4 = 0000000000000201
	tsubcc	%l1,-0x105,%l4		! %l4 = 00000000bcee6cc4, %ccr = 1b
	bl,a	p2_not_taken_0		! Branch Not Taken, %ccr = 1b
!	Mem[0000000018800120] = 8bcac8af 23a48c8b 0581e726 bd8379ed
	prefetch [%i1+0x120],4	! Annulled
p2_b131:
	membar	#Sync			! Added by membar checker (454)
!	%f14 = 00000000, %f14 = 00000000
	fitos	%f14,%f14		! %f14 = 00000000
!	%l3 = ffffffff80000000, immed = 00000e1c, %y  = 02fd99b8
	umulcc	%l3,0xe1c,%l0		! %l0 = 0000070e00000000, %ccr = 04

p2_label_113:
!	%l5 = ffffffff80000000
	sethi	%hi(0x59855c00),%l5	! %l5 = 0000000059855c00
!	%l1 = 00000000bcee6bbf, %l7 = 00000000ccc12a82, %y  = 0000070e
	smul	%l1,%l7,%l3		! %l3 = 0d6cf6b97dbf0cfe
	bvc,a	p2_b132			! Branch Taken, %ccr = 04, CWP = 0
!	Mem[0000000018800060] = c0b72982 5c7cbc3b 7277bfc1 6256ddda
	prefetch [%i1+0x060],3
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x084,%g2
p2_b132:
	membar	#Sync			! Added by membar checker (455)
!	Branch On Register, %l6 = 0000000000000000
	brgz,pt	%l6,p2_not_taken_0	! Branch Not Taken

p2_label_114:
!	%l7 = 00000000ccc12a82, Mem[00000000190001a8] = 7f68946d7a151b3d
	stx	%l7,[%i2+0x1a8]		! Mem[00000000190001a8] = 00000000ccc12a82
p2_b133:
	membar	#Sync			! Added by membar checker (456)
!	Mem[0000000030800028] = ffd9ff00, %l1 = 00000000bcee6bbf
	lduwa	[%o1+0x028]%asi,%l1	! %l1 = 00000000ffd9ff00
!	Mem[0000000018800090] = 00000001 00000001, %l5 = 0000000059855c00, %l5 = 0000000059855c00
	add	%i1,0x90,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 293ea8881c0ca7d1
	set	p2_b134,%o7
	fble,pt	%fcc3,p2_near_2_le	! Branch Taken, %fcc3 = 1
!	Mem[0000000032000010] = c5e7c3c5, %l0 = 0000070e00000000
	ldsw	[%o4+0x010],%g2		! %g2 = 0000070e00000000
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x086,%g2
p2_b134:
!	Registers modified during the branch to p2_near_2
!	%l3  = 00000000702f4646
!	%l5  = 000000000000eba7
!	%l7  = 00000000ffd9ff00

p2_label_115:
	membar	#Sync			! Added by membar checker (457)
!	Branch On Register, %l0 = 0000070e00000000
	brnz,pn	%l0,p2_b135		! Branch Taken
!	Mem[0000000019800008] = 7a0bf204, %l0 = 0000070e00000000
	lduha	[%i3+%o6]0x80,%l0	! %l0 = 0000000000007a0b
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x087,%g2
p2_b135:
	fbg,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l0 = 00007a0b, %l1 = ffd9ff00, Mem[00000000190001a8] = 00000000 ccc12a82
	std	%l0,[%i2+0x1a8]	! Annulled
p2_b136:
	membar	#Sync			! Added by membar checker (458)
!	Mem[000000001a8000f8] = ac3f9ab3, %l6 = 0000000000000000
	lduba	[%i5+0x0fa]%asi,%l6	! %l6 = 000000000000009a

p2_label_116:
	bcs	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000019800000] = ccc12b1f, %l1 = 00000000ffd9ff00
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ccc12b1f
p2_b137:
	membar	#Sync			! Added by membar checker (459)
!	%l5 = 000000000000eba7, immed = 00000851, %y  = 0d6cf6b9
	udivx	%l5,0x851,%l5		! %l5 = 000000000000001c
!	Mem[000000001800008c] = 593e20a2, %l7 = 00000000ffd9ff00
	ldsba	[%i0+0x08f]%asi,%l7	! %l7 = ffffffffffffffa2
	set	p2_b138,%o7
	fbe	p2_far_0_he	! Branch Taken, %fcc0 = 0

p2_label_117:
!	Mem[0000000019800008] = 7a0bf204, %l4 = 00000000bcee6cc4
	ldswa	[%i3+%o6]0x80,%l4	! %l4 = 000000007a0bf204
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x08a,%g2
p2_b138:
!	Registers modified during the branch to p2_far_0
!	%l0  = 0000000000000000
!	%l1  = 0000000000000134
	membar	#Sync			! Added by membar checker (460)
	fble,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000019000000] = 00000000764b770c, %l4 = 000000007a0bf204
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = 00000000764b770c
p2_b139:
	membar	#Sync			! Added by membar checker (461)
!	Mem[000000001b000000] = de2c784d 60fbfc23 d4a1330b 764b770c
	prefetcha [%i6+0x000]%asi,21
!	%f16 = 4289e51f 28298a00, %f14 = 00000000 00000000, %f0  = 622f7d1d 00000001
	fmuld	%f16,%f14,%f0 		! %f0  = 00000000 00000000

p2_label_118:
!	Mem[00000000198001cc] = c346daa3, %l7 = ffffffffffffffa2
	lduha	[%i3+0x1ce]%asi,%l7	! %l7 = 000000000000daa3
!	Mem[0000000030000064] = ad4f8aee, %l4 = 00000000764b770c
	ldsh	[%o0+0x066],%l4		! %l4 = ffffffffffff8aee
	bcs,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	Mem[0000000019000000] = 00000000, %l3 = 00000000702f4646
	swapa	[%i2+%g0]0x80,%l3	! Annulled
p2_b140:
	set	p2_b141,%o7
	fbuge	p2_far_0_he	! Branch Taken, %fcc0 = 0

p2_label_119:
!	%l2 = 0000000000000000, Mem[0000000031800063] = ca85b69d
	stb	%l2,[%o3+0x063]		! Mem[0000000031800060] = ca85b600
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x08d,%g2
p2_b141:
!	Registers modified during the branch to p2_far_0
!	%l0  = 0000000000000000
!	%l1  = 0000000000000134
	membar	#Sync			! Added by membar checker (462)
	fbu,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001900009f] = a35cadb8, %l7 = 000000000000daa3
	ldstub	[%i2+0x09f],%l7		! Annulled
p2_b142:
	membar	#Sync			! Added by membar checker (463)
!	%f0  = 00000000 00000000, %f20 = 00000001 19590fdd
	fxtod	%f0 ,%f20		! %f20 = 00000000 00000000
	set	p2_b143,%o7
	fbuge,pt %fcc0,p2_near_3_he	! Branch Taken, %fcc0 = 0

p2_label_120:
!	%l2 = 0000000000000000, Mem[0000000031000060] = 0000000017359f00
	stx	%l2,[%o2+0x060]		! Mem[0000000031000060] = 0000000000000000
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x08f,%g2
p2_b143:
!	Registers modified during the branch to p2_near_3
!	%l0  = fffffffff3529c78
!	%l1  = 00000000702f455e
!	%l6  = 0000000000000000
!	%l7  = 00000000ccc12a82
	membar	#Sync			! Added by membar checker (464)
!	Mem[0000000019800000] = ccc12b1f, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000cc
	set	p2_b144,%o7
	fbue,a	p2_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000018000008] = ffff8940, %l5 = 000000000000001c
	ldswa	[%i0+%o6]0x80,%l5	! %l5 = ffffffffffff8940
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x090,%g2
p2_b144:
!	Registers modified during the branch to p2_far_2
!	%l5  = 0000003a953ef178
	membar	#Sync			! Added by membar checker (465)
!	%f11 = c1e2ff27, %f7  = 3f800000, %f28 = d192069c
	fdivs	%f11,%f7 ,%f28		! %f28 = c1e2ff27

p2_label_121:
	ba,a	p2_b145			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000019000000] = 00000000, %l5 = 0000003a953ef178
	ldsha	[%i2+%g0]0x80,%l5	! Annulled
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x091,%g2
p2_b145:
	membar	#Sync			! Added by membar checker (466)
!	Mem[000000001900012c] = 82f4799c, %l4 = ffff8aee, %l4 = ffff8aee
	add	%i2,0x12c,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 0000000082f4799c
!	Denormal Floating Point Operation Nullified
	nop
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0

p2_label_122:
!	Mem[0000000031800060] = ca85b600, %l0 = fffffffff3529c78
	ldsw	[%o3+0x060],%l0		! %l0 = ffffffffca85b600
p2_b146:
	membar	#Sync			! Added by membar checker (467)
!	Mem[00000000190000a0] = a5c7bc6a 698117c0 9717e1e1 ba8ea3b2
	prefetch [%i2+0x0a0],4
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[0000000030000060] = bb9a418b, %l2 = 0000000000000000
	ldstub	[%o0+0x060],%l2		! Annulled
p2_b147:
	membar	#Sync			! Added by membar checker (468)
!	%l7 = 00000000ccc12a82, Mem[0000000030800066] = c2f78862
	stba	%l7,[%o1+0x066]%asi	! Mem[0000000030800064] = c2f78262

p2_label_123:
!	%f6  = 00000000, %f10 = c1e2ff27
	fmovs	%f6 ,%f10		! %f10 = 00000000
!	%l1 = 00000000702f455e, immed = fffff208, %l4 = 0000000082f4799c
	add	%l1,-0xdf8,%l4		! %l4 = 00000000702f3766
!	%l2 = 00000000, %l3 = 702f4646, Mem[0000000031800028] = fffffcf6 b09fad63
	std	%l2,[%o3+0x028]	! Mem[0000000031800028] = 00000000 702f4646
!	%l7 = 00000000ccc12a82, Mem[0000000018000050] = 5e8cd5d2
	sth	%l7,[%i0+0x050]		! Mem[0000000018000050] = 2a82d5d2
!	Denormal Floating Point Operation Nullified
	nop

p2_label_124:
!	Mem[0000000032000020] = 2a82f8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,1
!	%l3 = 00000000702f4646, Mem[0000000030000069] = 00000000
	stba	%l3,[%o0+0x069]%asi	! Mem[0000000030000068] = 00460000
!	%l6 = 000000cc, %l7 = ccc12a82, Mem[00000000190000f8] = 2ac423ae d0042995
	std	%l6,[%i2+0x0f8]	! Mem[00000000190000f8] = 000000cc ccc12a82
!	Mem[0000000018800180] = ab637efe, %l3 = 00000000702f4646
	ldsb	[%i1+0x180],%l3		! %l3 = ffffffffffffffab
!	%l3 = ffffffffffffffab, Mem[0000000018800000] = 0000eba7
	stwa	%l3,[%i1+%g0]0x80	! Mem[0000000018800000] = ffffffab

p2_label_125:
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 08
!	%l0 = ca85b600, %l1 = 702f455e, Mem[0000000031800028] = 00000000 702f4646
	std	%l0,[%o3+0x028]	! Annulled
p2_b148:
	membar	#Sync			! Added by membar checker (469)
!	%l4 = 00000000702f3766
	setx	0xb4075fd0b4075fd0,%g7,%l4 ! %l4 = b4075fd0b4075fd0
!	Mem[00000000198001c0] = a354fe3d 831cf82e 47037d46 c346daa3
	prefetcha [%i3+0x1c0]%asi,20
!	%l5 = 0000003a953ef178, %l2 = 0000000000000000, %l4 = b4075fd0b4075fd0
	srax	%l5,%l2,%l4		! %l4 = 0000003a953ef178

p2_label_126:
!	Mem[0000000030800028] = ffd9ff00, %l3 = ffffffffffffffab
	ldsba	[%o1+0x028]%asi,%l3	! %l3 = ffffffffffffffff
!	%l1 = 00000000702f455e, Mem[0000000018800000] = ffffffab00000000
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000018800000] = 00000000702f455e
!	%l0 = ffffffffca85b600, %l3 = ffffffffffffffff, %l1 = 00000000702f455e
	andncc	%l0,%l3,%l1		! %l1 = 0000000000000000, %ccr = 44
!	%f30 = 2a474903 62af7d1d, %f8  = 69106f89 03fbd1e0
	fcmpd	%fcc0,%f30,%f8 		! %fcc0 = 1
!	%l6 = 00000000000000cc, immed = fffffc7c, %l3 = ffffffffffffffff
	sub	%l6,-0x384,%l3		! %l3 = 0000000000000450

p2_label_127:
!	Mem[0000000018000000] = f3fffb2a, %l7 = 00000000ccc12a82
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 000000000000f3ff
!	%f10 = 00000000 c1e2ff27, %f0  = 00000000 00000000
	fnegd	%f10,%f0 		! %f0  = 80000000 c1e2ff27
!	Mem[0000000018000008] = ffff8940, %l0 = ffffffffca85b600
	ldswa	[%i0+%o6]0x80,%l0	! %l0 = ffffffffffff8940
!	Mem[000000003080006c] = e36f3aa2, %l0 = ffffffffffff8940
	ldstub	[%o1+0x06c],%l0		! %l0 = 00000000000000e3
!	Mem[0000000019800008] = 7a0bf204, %l2 = 0000000000000000
	swapa	[%i3+%o6]0x80,%l2	! %l2 = 000000007a0bf204

p2_label_128:
!	Mem[0000000018800008] = 00000026, %l2 = 000000007a0bf204
	lduwa	[%i1+%o6]0x80,%l2	! %l2 = 0000000000000026
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],3
!	%l2 = 0000000000000026, immed = fffff3e3, %l7 = 000000000000f3ff
	orncc	%l2,-0xc1d,%l7		! %l7 = 0000000000000c3e, %ccr = 00
!	%l2 = 00000026, %l3 = 00000450, Mem[0000000019800000] = ffc12b1f 556ba9b6
	stda	%l2,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000026 00000450
!	%l7 = 0000000000000c3e, immed = fffffe4c, %l7 = 0000000000000c3e
	addcc	%l7,-0x1b4,%l7		! %l7 = 0000000000000a8a, %ccr = 11

p2_label_129:
!	%l1 = 0000000000000000, immed = ffffff15, %l7 = 0000000000000a8a
	addcc	%l1,-0x0eb,%l7		! %l7 = ffffffffffffff15, %ccr = 88
!	Mem[000000003100002c] = 63e2f35c, %l4 = 0000003a953ef178
	ldub	[%o2+0x02c],%l4		! %l4 = 0000000000000063
	set	p2_b149,%o7
	fbule,a	p2_far_3_le	! Branch Taken, %fcc0 = 1
!	Mem[00000000198000b0] = 4a55c264, %l5 = 0000003a953ef178
	lduh	[%i3+0x0b2],%l5		! %l5 = 000000000000c264
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x095,%g2
p2_b149:
!	Registers modified during the branch to p2_far_3
!	%l0  = fde0000000000000
!	%l1  = ffffffffffffc3b4
!	%l2  = ffffffffffffffbc
!	%l5  = 000000000000001b
	set	p2_b150,%o7
	fbl,a	p2_far_2_le	! Branch Taken, %fcc0 = 1

p2_label_130:
!	Mem[0000000019000008] = 4d000000, %l5 = 000000000000001b
	swapa	[%i2+%o6]0x80,%l5	! %l5 = 000000004d000000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x096,%g2
p2_b150:
!	Registers modified during the branch to p2_far_2
!	%l1  = b653e6eb9a60ac97
!	%l2  = fde0000000000239
!	%l4  = 0000000031800000
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (470)
!	%l6 = 000000cc, %l7 = ffffff15, Mem[0000000018000008] = ffff8940 612c7852
	stda	%l6,[%i0+%o6]0x80	! Mem[0000000018000008] = 000000cc ffffff15
	bneg,a	p2_b151			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000030000020] = ce00eba74b4926af, %l5 = 0000000000000000
	ldx	[%o0+0x020],%l5		! %l5 = ce00eba74b4926af
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x097,%g2
p2_b151:
	fbug	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1

p2_label_131:
!	Mem[0000000019800140] = 3c6a8cd8 9f98283e 8c4cb2e9 396513ef
	prefetch [%i3+0x140],4
p2_b152:
	membar	#Sync			! Added by membar checker (471)
!	Mem[000000003100002e] = 63e2f35c, %l3 = 0000000000000450
	ldstuba	[%o2+0x02e]%asi,%l3	! %l3 = 00000000000000f3
!	%l1 = b653e6eb9a60ac97, %l4 = 0000000031800000, %l4 = 0000000031800000
	taddcc	%l1,%l4,%l4		! %l4 = b653e6ebcbe0ac97, %ccr = 8a
	bcc	p2_b153			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000018800008] = 00000026, %l4 = b653e6ebcbe0ac97
	swapa	[%i1+%o6]0x80,%l4	! %l4 = 0000000000000026
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x099,%g2
p2_b153:

p2_label_132:
	membar	#Sync			! Added by membar checker (472)
!	Mem[0000000019000000] = 00000000, %l2 = fde0000000000239
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l0 = fde0000000000000, Mem[000000003080002e] = 088ad4c9
	stha	%l0,[%o1+0x02e]%asi	! Mem[000000003080002c] = 088a0000
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800140] = c86bc5a1 f2a2904c 5c3a925c bdbd9578
	prefetch [%i1+0x140],20	! Annulled
p2_b154:
	membar	#Sync			! Added by membar checker (473)
!	%l6 = 00000000000000cc, %l1 = b653e6eb9a60ac97, %l6 = 00000000000000cc
	orn	%l6,%l1,%l6		! %l6 = 49ac1914659f53ec

p2_label_133:
	set	p2_b155,%o7
	fba,a	p2_far_0_he	! Branch Taken, %fcc0 = 1
!	 Annulled
	ldda	[%i2+%o6]0x80,%l6
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x09b,%g2
p2_b155:
!	Registers modified during the branch to p2_far_0
!	%l0  = 0000000000000000
!	%l1  = 0000000000000134
	membar	#Sync			! Added by membar checker (474)
!	%l6 = 49ac1914659f53ec, immed = 00000524, %l5 = ce00eba74b4926af
	xnor	%l6,0x524,%l5		! %l5 = b653e6eb9a60a937
	bleu	p2_not_taken_0		! Branch Not Taken, %ccr = 8a
!	%l5 = b653e6eb9a60a937, Mem[000000001900010a] = 4e44490e
	stb	%l5,[%i2+0x10a]		! Mem[0000000019000108] = 4e44370e
p2_b156:

p2_label_134:
	membar	#Sync			! Added by membar checker (475)
!	Mem[0000000019000064] = dad9462f, %l2 = 0000000000000000
	lduba	[%i2+0x066]%asi,%l2	! %l2 = 0000000000000046
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800000] = 00000000, %l4 = 0000000000000026
	ldsba	[%i1+%g0]0x80,%l4	! Annulled
p2_b157:
	membar	#Sync			! Added by membar checker (476)
!	%l0 = 00000000, %l1 = 00000134, Mem[000000001a000008] = a724b54e cb5f6730
	stda	%l0,[%i4+%o6]0x80	! Mem[000000001a000008] = 00000000 00000134
!	%l2 = 0000000000000046, immed = 00000099, %y  = 00000000
	umul	%l2,0x099,%l0		! %l0 = 00000000000029d6

p2_label_135:
!	call to call_0, CWP = 0
	call	p2_call_0_le
!	%l7 = ffffffffffffff15, Mem[000000003100002c] = 63e2ff5c
	stw	%l7,[%o2+0x02c]		! Mem[000000003100002c] = ffffff15
!	Registers modified during the branch to p2_call_0
!	%l2  = 0000000000000000
!	%l5  = 0000000000000054
!	%l6  = 0000000059157360
!	%l7  = 00000000b189ccd6
!	%l4 = 0000000000000026, Mem[0000000040000038] = 3914353c
	stw	%l4,[%o5+0x038]		! Mem[0000000040000038] = 00000026
!	Mem[00000000198001e0] = 372aeadb 96f8866f f0349c2e d0e87279
	prefetch [%i3+0x1e0],23
!	%l6 = 0000000059157360, %l2 = 0000000000000000, %l6 = 0000000059157360
	addcc	%l6,%l2,%l6		! %l6 = 0000000059157360, %ccr = 00

p2_label_136:
	nop
!	%l0 = 00000000000029d6, %l1 = 0000000000000134, %l2 = 0000000000000000
	tsubcc	%l0,%l1,%l2		! %l2 = 00000000000028a2, %ccr = 02
	ba	p2_b158			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[00000000198000c0] = 17359f00 8dc4129f e2d4804e 89a253d6
	prefetch [%i3+0x0c0],3
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x09e,%g2
p2_b158:
	membar	#Sync			! Added by membar checker (477)
!	Mem[0000000019000120] = 41b1232e b87e91b2 bdab68ac 82f4799c
	prefetch [%i2+0x120],22

p2_label_137:
	fbg,a,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019800000] = 00000026, %l0 = 00000000000029d6
	lduba	[%i3+%g0]0x80,%l0	! Annulled
p2_b159:
	membar	#Sync			! Added by membar checker (478)
!	Mem[000000003080006c] = ff6f3aa2, %l5 = 0000000000000054
	lduha	[%o1+0x06c]%asi,%l5	! %l5 = 000000000000ff6f
	fbn,pt	%fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[0000000019000040] = a7572b58 c876b87c 0b5f357c 55f2a711
	prefetch [%i2+0x040],2
p2_b160:

p2_label_138:
	membar	#Sync			! Added by membar checker (479)
!	%l7 = 00000000b189ccd6, %l4 = 0000000000000026, %l0 = 00000000000029d6
	andn	%l7,%l4,%l0		! %l0 = 00000000b189ccd0
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 02
!	Mem[0000000018800060] = c0b72982 5c7cbc3b 7277bfc1 6256ddda
	prefetch [%i1+0x060],2	! Annulled
p2_b161:
	membar	#Sync			! Added by membar checker (480)
!	%l4 = 0000000000000026, %l6 = 0000000059157360, %l3 = 00000000000000f3
	srlx	%l4,%l6,%l3		! %l3 = 0000000000000000
!	Branch On Register, %l6 = 0000000059157360
	brlz,pt	%l6,p2_not_taken_0	! Branch Not Taken

p2_label_139:
!	Mem[0000000018800008] = cbe0ac97, %l2 = 00000000000028a2
	swapa	[%i1+%o6]0x80,%l2	! %l2 = 00000000cbe0ac97
p2_b162:
	bl,a	p2_b163			! Branch Taken, %ccr = 02, CWP = 0
!	Mem[000000001880017d] = cc3d9f78, %l5 = 000000000000ff6f
	ldstub	[%i1+0x17d],%l5		! %l5 = 000000000000003d
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0a3,%g2
p2_b163:
	membar	#Sync			! Added by membar checker (481)
!	Mem[0000000030800020] = 00000235c8000000, %l3 = 0000000000000000
	ldx	[%o1+0x020],%l3		! %l3 = 00000235c8000000
	set	p2_b164,%o7
	fbne,a,pt %fcc1,p2_near_0_he	! Branch Taken, %fcc1 = 2

p2_label_140:
!	%l6 = 0000000059157360, Mem[0000000019000000] = 00000000
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000019000000] = 59157360
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0a4,%g2
p2_b164:
!	Registers modified during the branch to p2_near_0
!	%l3  = a443ba05473279bc
!	%l7  = 0000000000007a0b
	membar	#Sync			! Added by membar checker (482)
!	%l7 = 0000000000007a0b, %l1 = 0000000000000134, %l1 = 0000000000000134
	and	%l7,%l1,%l1		! %l1 = 0000000000000000
!	Mem[0000000019800008] = 00000000 000000a1, %l0 = b189ccd0, %l1 = 00000000
	ldda	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000 00000000000000a1
!	%l4 = 00000026, %l5 = 0000003d, Mem[0000000030000028] = 00000000 0668fcd7
	stda	%l4,[%o0+0x028]%asi	! Mem[0000000030000028] = 00000026 0000003d
!	%l4 = 0000000000000026, immed = 000006be, %l6 = 0000000059157360
	tsubcc	%l4,0x6be,%l6		! %l6 = fffffffffffff968, %ccr = 9b

p2_label_141:
	bvs,a	p2_b165			! Branch Taken, %ccr = 9b, CWP = 0
!	Mem[0000000018800000] = 00000000702f455e, %l5 = 000000000000003d
	ldxa	[%i1+%g0]0x80,%l5	! %l5 = 00000000702f455e
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x0a5,%g2
p2_b165:
	membar	#Sync			! Added by membar checker (483)
!	Mem[0000000032000010] = c5e7c3c5, %l5 = 00000000702f455e
	ldswa	[%o4+0x010]%asi,%g2	! %g2 = 00000000702f455e
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000048] = 81d500c9c1c67d6b, %l0 = 0000000000000000
	ldx	[%o4+0x048],%g2		! %g2 = 81d500c9c1c67d6b
p2_b166:

p2_label_142:
	fbuge	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001b000000] = de2c784d, %l5 = 00000000702f455e
	ldswa	[%i6+%g0]0x80,%l5	! %l5 = ffffffffde2c784d
p2_b167:
	membar	#Sync			! Added by membar checker (484)
!	%l0 = 0000000000000000, Mem[0000000019000188] = 7f66e37a00000000
	stx	%l0,[%i2+0x188]		! Mem[0000000019000188] = 0000000000000000
!	%l2 = 00000000cbe0ac97, Mem[0000000019000078] = 720af28901d100a4
	stxa	%l2,[%i2+0x078]%asi	! Mem[0000000019000078] = 00000000cbe0ac97
!	%l2 = 00000000cbe0ac97, Mem[0000000018000008] = 000000cc
	stba	%l2,[%i0+%o6]0x80	! Mem[0000000018000008] = 970000cc

p2_label_143:
!	%l3 = a443ba05473279bc, Mem[0000000019800027] = 2d73498a
	stb	%l3,[%i3+0x027]		! Mem[0000000019800024] = 2d7349bc
	fbg	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019000000] = 59157360, %l5 = ffffffffde2c784d
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000059
p2_b168:
	membar	#Sync			! Added by membar checker (485)
!	%f23 = 550e7a41, %f28 = c1e2ff27
	fnegs	%f23,%f28		! %f28 = d50e7a41
!	%f9  = 03fbd1e0, %f24 = 91a8be66 d04cbd67
	fstod	%f9 ,%f24		! %f24 = 387f7a3c 00000000

p2_label_144:
!	%l3 = a443ba05473279bc, immed = 0000068d, %y  = 00000000
	udivx	%l3,0x68d,%l5		! %l5 = 0019135863b9a824
!	call to call_0, CWP = 0
	call	p2_call_0_he
!	%l0 = 0000000000000000, Mem[0000000019000110] = b267983d
	stw	%l0,[%i2+0x110]		! Mem[0000000019000110] = 00000000
!	Registers modified during the branch to p2_call_0
!	%l0  = ffe6eca79c4657db
!	%l1  = fffffffffffffe7e
!	%l4  = 000000004b4926af
!	%l6  = 0000000000000000
!	%l7  = 0000000043202894
	set	p2_b169,%o7
	fble	p2_far_0_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001880013c] = c3e508d4, %l5 = 0019135863b9a824
	swap	[%i1+0x13c],%l5		! %l5 = 00000000c3e508d4
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x0a9,%g2
p2_b169:
!	Registers modified during the branch to p2_far_0
!	%l0  = 0000000000000000
!	%l1  = 0000000000000134

p2_label_145:
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018800000] = 00000000 702f455e, %l6 = 00000000, %l7 = 43202894
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000 00000000702f455e
p2_b170:
	membar	#Sync			! Added by membar checker (486)
	fbe,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000018800008] = 000028a2cafec578, %l7 = 00000000702f455e
	ldxa	[%i1+%o6]0x80,%l7	! Annulled
p2_b171:
	membar	#Sync			! Added by membar checker (487)
!	%l1 = 0000000000000134
	setx	0xcb1a5e82cb1a5e82,%g7,%l1 ! %l1 = cb1a5e82cb1a5e82

p2_label_146:
	bge	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000018800008] = 000028a2 cafec578, %l4 = 4b4926af, %l5 = c3e508d4
	ldda	[%i1+%o6]0x80,%l4	! %l4 = 00000000000028a2 00000000cafec578
p2_b172:
	membar	#Sync			! Added by membar checker (488)
!	%f7  = 3f800000, %f11 = c1e2ff27
	fstoi	%f7 ,%f11		! %f11 = 00000001
!	%l6 = 0000000000000000, %l7 = 00000000702f455e, %y  = 00000000
	udivcc	%l6,%l7,%l4		! %l4 = 0000000000000000, %ccr = 44
!	Mem[0000000018800014] = e9e58218, %l1 = cb1a5e82cb1a5e82
	lduwa	[%i1+0x014]%asi,%l1	! %l1 = 00000000e9e58218

p2_label_147:
!	%l2 = 00000000cbe0ac97, Mem[0000000019800008] = 00000000000000a1
	stxa	%l2,[%i3+%o6]0x80	! Mem[0000000019800008] = 00000000cbe0ac97
!	Mem[0000000018000090] = 28069580, %l6 = 0000000000000000
	ldsb	[%i0+0x091],%l6		! %l6 = 0000000000000006
	set	p2_b173,%o7
	fba,a	p2_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000018000060] = 4b9e9cd3 2881aed8 b9566bc0 455c7b23
	prefetch [%i0+0x060],1	! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0ad,%g2
p2_b173:
!	Registers modified during the branch to p2_far_3
!	%l3  = 000000015a14c776
!	%l6  = 0000000000000000
	membar	#Sync			! Added by membar checker (489)
!	%l7 = 00000000702f455e, %l5 = 00000000cafec578, %y  = 00000000
	umul	%l7,%l5,%l5		! %l5 = 58f4f22bf5cdda10

p2_label_148:
!	Mem[0000000030800064] = c2f78262, %l1 = 00000000e9e58218
	lduh	[%o1+0x066],%l1		! %l1 = 0000000000008262
!	Mem[0000000031000064] = 00000000, %l2 = 00000000cbe0ac97
	ldsba	[%o2+0x066]%asi,%l2	! %l2 = 0000000000000000
	bvc,a	p2_b174			! Branch Taken, %ccr = 44, CWP = 0
!	%l4 = 00000000, %l5 = f5cdda10, Mem[0000000031800028] = 00000000 702f4646
	std	%l4,[%o3+0x028]	! Mem[0000000031800028] = 00000000 f5cdda10
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0ae,%g2
p2_b174:
	ble	p2_b175			! Branch Taken, %ccr = 44, CWP = 0

p2_label_149:
!	Mem[0000000018800008] = 000028a2, %l2 = 0000000000000000
	ldswa	[%i1+%o6]0x80,%l2	! %l2 = 00000000000028a2
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x0af,%g2
p2_b175:
	membar	#Sync			! Added by membar checker (490)
!	%l5 = 58f4f22bf5cdda10, immed = 00000010, %l5 = 58f4f22bf5cdda10
	sllx	%l5,0x010,%l5		! %l5 = f22bf5cdda100000
!	Branch On Register, %l1 = 0000000000008262
	brz,pt	%l1,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000019800000] = 00000026, %l7 = 00000000702f455e
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
p2_b176:
	bn	p2_not_taken_0		! Branch Not Taken, %ccr = 44

p2_label_150:
!	Mem[0000000019800020] = 90bdb77a 2d7349bc 321f9fb9 699cc94c
	prefetch [%i3+0x020],0
p2_b177:
	membar	#Sync			! Added by membar checker (491)
!	%f30 = 2a474903, %f4  = 80000000 00000001
	fstod	%f30,%f4 		! %f4  = 3d48e920 60000000
!	Mem[0000000019000080] = 8aa602e6 e3109f1b b11d2ce1 b0e70b4a
	prefetcha [%i2+0x080]%asi,2
	set	p2_b178,%o7
	fbule,a	p2_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001980015c] = b45096cc, %l2 = 00000000000028a2
	ldsw	[%i3+0x15c],%l2		! %l2 = ffffffffb45096cc
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x0b2,%g2
p2_b178:
!	Registers modified during the branch to p2_far_1
!	%l2  = 0000000000000000
!	%l4  = 0000000000000de1

p2_label_151:
	set	p2_b179,%o7
	fblg	p2_far_2_le	! Branch Taken, %fcc0 = 1
!	Mem[00000000198001e0] = 372aeadb 96f8866f f0349c2e d0e87279
	prefetch [%i3+0x1e0],22
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0b3,%g2
p2_b179:
!	Registers modified during the branch to p2_far_2
!	%l1  = b653e6eb9a60ac97
!	%l2  = 0000000000000239
!	%l4  = 00000006f0800000
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (492)
	fbe,pn	%fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	Mem[00000000188001a0] = 18969c85, %l1 = b653e6eb9a60ac97
	lduw	[%i1+0x1a0],%l1		! %l1 = 0000000018969c85
p2_b180:
	bne,a	p2_not_taken_0		! Branch Not Taken, %ccr = 44

p2_label_152:
!	%l6 = 0000000000000000, Mem[0000000019800000] = ff00002600000450
	stxa	%l6,[%i3+%g0]0x80	! Annulled
p2_b181:
	membar	#Sync			! Added by membar checker (493)
!	%f9  = 03fbd1e0, %f6  = 00000000 3f800000
	fitod	%f9 ,%f6 		! %f6  = 418fde8f 00000000
	bcc	p2_b182			! Branch Taken, %ccr = 44, CWP = 0
!	%l6 = 0000000000000000, Mem[0000000019000000] = 59157360
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000019000000] = 00157360
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x0b6,%g2
p2_b182:
	membar	#Sync			! Added by membar checker (494)
	fbg,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1

p2_label_153:
!	%l1 = 0000000018969c85, Mem[00000000180001d6] = 9cd1ecc8
	sth	%l1,[%i0+0x1d6]		! Mem[00000000180001d4] = 9cd19c85
p2_b183:
	membar	#Sync			! Added by membar checker (495)
!	%l1 = 0000000018969c85, Mem[0000000031800022] = 00000000
	stba	%l1,[%o3+0x022]%asi	! Mem[0000000031800020] = 00008500
!	%l7 = 0000000000000000, Mem[0000000018800018] = 1752e153
	stwa	%l7,[%i1+0x018]%asi	! Mem[0000000018800018] = 00000000
!	%f18 = 00000000, %f8  = 69106f89
	fcmps	%fcc1,%f18,%f8 		! %fcc1 = 1
!	Mem[000000001a000074] = 2f5f7a94, %l7 = 0000000000000000
	ldub	[%i4+0x077],%l7		! %l7 = 0000000000000094

p2_label_154:
!	%f6  = 418fde8f 00000000, %f4  = 3d48e920 60000000
	fdtox	%f6 ,%f4 		! %f4  = 00000000 03fbd1e0
!	Mem[0000000019000160] = fb999896 60a5e19d c0a40043 a038dd7f
	prefetch [%i2+0x160],16
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019800008] = 00000000, %l4 = 00000006f0800000
	lduba	[%i3+%o6]0x80,%l4	! Annulled
p2_b184:
	membar	#Sync			! Added by membar checker (496)
!	%l4 = 00000006f0800000, Mem[0000000018000000] = f3fffb2a
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000018000000] = f0800000

p2_label_155:
	bleu,a	p2_b185			! Branch Taken, %ccr = 44, CWP = 0
!	%l3 = 000000015a14c776, Mem[0000000019000000] = 00157360
	stha	%l3,[%i2+%g0]0x80	! Mem[0000000019000000] = c7767360
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x0b9,%g2
p2_b185:
	membar	#Sync			! Added by membar checker (497)
!	Mem[0000000019800008] = 00000000 cbe0ac97, %l2 = 00000239, %l3 = 5a14c776
	ldda	[%i3+%o6]0x80,%l2	! %l2 = 0000000000000000 00000000cbe0ac97
!	%l4 = 00000006f0800000, %l1 = 0000000018969c85, %y  = 00000000
	sdivx	%l4,%l1,%l4		! %l4 = 0000000000000048
!	Mem[0000000031000068] = 00000000 cbe0ac97, %l2 = 0000000000000000, %l1 = 0000000018969c85
	add	%o2,0x68,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 3eff193d5cff8775

p2_label_156:
!	%l6 = 0000000000000000, %l4 = 0000000000000048, %l3 = 00000000cbe0ac97
	xnorcc	%l6,%l4,%l3		! %l3 = ffffffffffffffb7, %ccr = 88
	nop
	fbuge,pn %fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000030800064] = c2f78262, %l1 = 3eff193d5cff8775
	lduw	[%o1+0x064],%l1		! %l1 = 00000000c2f78262
p2_b186:
	membar	#Sync			! Added by membar checker (498)
!	Branch On Register, %l2 = 0000000000000000
	brlz,pt	%l2,p2_not_taken_0	! Branch Not Taken

p2_label_157:
!	%l2 = 00000000, %l3 = ffffffb7, Mem[0000000019800008] = 00000000 cbe0ac97
	stda	%l2,[%i3+%o6]0x80	! Mem[0000000019800008] = 00000000 ffffffb7
p2_b187:
	membar	#Sync			! Added by membar checker (499)
!	Mem[000000001a800020] = 65567ff2 00000000, %l0 = 00000000, %l1 = c2f78262
	ldd	[%i5+0x020],%l0		! %l0 = 0000000065567ff2 0000000000000000
!	%l6 = 00000000, %l7 = 00000094, Mem[0000000018800000] = 00000000 702f455e
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000018800000] = 00000000 00000094
	fbg,a,pn %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001a800008] = 7c10684a, %l1 = 0000000000000000
	ldswa	[%i5+%o6]0x80,%l1	! Annulled
p2_b188:

p2_label_158:
	membar	#Sync			! Added by membar checker (500)
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetcha [%o4+0x000]%asi,20
	set	p2_b189,%o7
	fblg,a,pn %fcc0,p2_near_2_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000019000000] = c7767360, %l4 = 0000000000000048
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000c7
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x0bd,%g2
p2_b189:
!	Registers modified during the branch to p2_near_2
!	%l3  = 0000000000000053
!	%l5  = 000000000000eba7
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (501)
!	Branch On Register, %l7 = 0000000000000000
	brnz,a,pt %l7,p2_not_taken_0	! Branch Not Taken
!	Mem[0000000032000020] = 2a82f8b2, %l6 = 0000000000000000
	ldsw	[%o4+0x020],%g2		! Annulled
p2_b190:

p2_label_159:
	membar	#Sync			! Added by membar checker (502)
!	Mem[000000001880010c] = a3ff1f7f, %l2 = 0000000000000000
	ldswa	[%i1+0x10c]%asi,%l2	! %l2 = ffffffffa3ff1f7f
!	Mem[00000000198000c0] = 17359f00 8dc4129f e2d4804e 89a253d6
	prefetcha [%i3+0x0c0]%asi,22
!	%f25 = 00000000, %f2  = 00000001
	fitos	%f25,%f2 		! %f2  = 00000000
!	%l7 = 0000000000000000, %l0 = 0000000065567ff2, %y  = 00000000
	udivcc	%l7,%l0,%l1		! %l1 = 0000000000000000, %ccr = 44
	ba,a	p2_b191			! Branch Taken, %ccr = 44, CWP = 0

p2_label_160:
!	%l1 = 0000000000000000, Mem[0000000018000000] = f0800000
	stba	%l1,[%i0+%g0]0x80	! Annulled
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x0bf,%g2
p2_b191:
	membar	#Sync			! Added by membar checker (503)
!	%f14 = 00000000 00000000, %f24 = 387f7a3c
	fxtos	%f14,%f24		! %f24 = 00000000
!	Mem[0000000018000074] = a97a5930, %l7 = 0000000000000000
	swapa	[%i0+0x074]%asi,%l7	! %l7 = 00000000a97a5930
!	%l2 = ffffffffa3ff1f7f
	sethi	%hi(0x7c3a9400),%l2	! %l2 = 000000007c3a9400
	bgu	p2_not_taken_0		! Branch Not Taken, %ccr = 44

p2_label_161:
!	Mem[0000000018000008] = 970000ccffffff15, %l7 = 00000000a97a5930
	ldxa	[%i0+%o6]0x80,%l7	! %l7 = 970000ccffffff15
p2_b192:
	membar	#Sync			! Added by membar checker (504)
!	Mem[0000000031800064] = 37336455, %l6 = 0000000000000000
	swapa	[%o3+0x064]%asi,%l6	! %l6 = 0000000037336455
!	%l4 = 00000000000000c7, %l3 = 0000000000000053, %y  = 00000000
	sdivx	%l4,%l3,%l7		! %l7 = 0000000000000002
	fbge,a,pn %fcc2,p2_branch_failed	! Branch Not Taken, %fcc2 = 1
!	%l5 = 000000000000eba7, Mem[0000000018000008] = 970000cc
	stwa	%l5,[%i0+%o6]0x80	! Annulled
p2_b193:

p2_label_162:
	membar	#Sync			! Added by membar checker (505)
!	Denormal Floating Point Operation Nullified
	nop
!	%l3 = 0000000000000053, Mem[0000000018000000] = f0800000
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000018000000] = 53800000
	fbge,pn	%fcc3,p2_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l3 = 0000000000000053, Mem[00000000180000c4] = 558696f9
	stw	%l3,[%i0+0x0c4]		! Mem[00000000180000c4] = 00000053
p2_b194:
	membar	#Sync			! Added by membar checker (506)
!	%l5 = 000000000000eba7, Mem[000000001800012a] = 00000000
	stha	%l5,[%i0+0x12a]%asi	! Mem[0000000018000128] = 0000eba7

p2_label_163:
	bpos	p2_b195			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[00000000198001e8] = f0349c2e, %l3 = 0000000000000053
	lduw	[%i3+0x1e8],%l3		! %l3 = 00000000f0349c2e
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0c3,%g2
p2_b195:
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l2 = 7c3a9400, %l3 = f0349c2e, Mem[0000000018800008] = 000028a2 cafec578
	stda	%l2,[%i1+%o6]0x80	! Mem[0000000018800008] = 7c3a9400 f0349c2e
p2_b196:
	membar	#Sync			! Added by membar checker (507)
!	%l5 = 000000000000eba7, immed = fffffc1b, %l2 = 000000007c3a9400
	subc	%l5,-0x3e5,%l2		! %l2 = 000000000000ef8c

p2_label_164:
!	Mem[00000000190000c8] = dbc79447, %l1 = 0000000000000000
	ldsh	[%i2+0x0ca],%l1		! %l1 = ffffffffffff9447
	set	p2_b197,%o7
	fba,pn	%fcc2,p2_near_1_le	! Branch Taken, %fcc2 = 1
!	Mem[0000000018800008] = 7c3a9400 f0349c2e, %l2 = 0000ef8c, %l3 = f0349c2e
	ldda	[%i1+%o6]0x80,%l2	! %l2 = 000000007c3a9400 00000000f0349c2e
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x0c5,%g2
p2_b197:
!	Registers modified during the branch to p2_near_1
!	%l1  = ffffffffc8cd874f
!	%l6  = ffffffffc8cc9ba8
	membar	#Sync			! Added by membar checker (508)
	fbug,a,pn %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	Mem[0000000018000008] = 970000cc, %l6 = ffffffffc8cc9ba8
	swapa	[%i0+%o6]0x80,%l6	! Annulled
p2_b198:

p2_label_165:
	membar	#Sync			! Added by membar checker (509)
!	Mem[0000000019800000] = ff000026, %l0 = 0000000065567ff2
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Branch On Register, %l3 = 00000000f0349c2e
	brgz,a,pn %l3,p2_b199		! Branch Taken
!	Mem[0000000019000000] = ff767360 764b770c, %l6 = c8cc9ba8, %l7 = 00000002
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff767360 00000000764b770c
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0c7,%g2
p2_b199:
	membar	#Sync			! Added by membar checker (510)
!	%l0 = ffffffffffffffff, immed = fffff383, %l4 = 00000000000000c7
	or	%l0,-0xc7d,%l4		! %l4 = ffffffffffffffff
!	Jump to jmpl_3, CWP = 0
	set	p2_jmpl_3_he,%g1
	jmpl	%g1,%g6

p2_label_166:
!	Mem[0000000030000029] = 00000026, %l3 = 00000000f0349c2e
	ldstub	[%o0+0x029],%l3		! %l3 = 0000000000000000
!	Registers modified during the branch to p2_jmpl_3
!	%l1  = 0000000000000000
!	%l3  = 000001feece6c000
!	Mem[00000000198000a8] = 0a2f031f46c23210, %l0 = ffffffffffffffff
	ldxa	[%i3+0x0a8]%asi,%l0	! %l0 = 0a2f031f46c23210
!	Mem[000000003080002c] = 088a0000, %l5 = 000000000000eba7
	swapa	[%o1+0x02c]%asi,%l5	! %l5 = 00000000088a0000
!	%f20 = 00000000 00000000, %f28 = d50e7a41 e5eb3868, %f6  = 418fde8f 00000000
	fdivd	%f20,%f28,%f6 		! %f6  = 80000000 00000000
!	%l4 = ffffffffffffffff, immed = 00000802, %l7 = 00000000764b770c
	subccc	%l4,0x802,%l7		! %l7 = fffffffffffff7fd, %ccr = 88

p2_label_167:
!	%l2 = 000000007c3a9400, Mem[00000000190001b4] = 57fb4973
	sth	%l2,[%i2+0x1b4]		! Mem[00000000190001b4] = 94004973
!	%f20 = 00000000, %f19 = 550e7a41
	fcmpes	%fcc1,%f20,%f19		! %fcc1 = 1
!	Branch On Register, %l4 = ffffffffffffffff
	brgez,a,pt %l4,p2_not_taken_0	! Branch Not Taken
!	%l3 = 000001feece6c000, Mem[0000000018000008] = 970000ccffffff15
	stxa	%l3,[%i0+%o6]0x80	! Annulled
p2_b200:
	membar	#Sync			! Added by membar checker (511)
!	%l3 = 000001feece6c000, Mem[00000000188000b8] = f1475c0f57767213
	stxa	%l3,[%i1+0x0b8]%asi	! Mem[00000000188000b8] = 000001feece6c000

p2_label_168:
	ble	p2_b201			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[00000000180000c0] = d29b449c 00000053 8ad980eb 4a7469ee
	prefetch [%i0+0x0c0],3
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x0c9,%g2
p2_b201:
	set	p2_b202,%o7
	fbul	p2_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001900007c] = cbe0ac97, %l5 = 00000000088a0000
	lduw	[%i2+0x07c],%l5		! %l5 = 00000000cbe0ac97
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x0ca,%g2
p2_b202:
!	Registers modified during the branch to p2_far_1
!	%l2  = 0a2f020102003210
!	%l4  = fffffffffffffa1c
	membar	#Sync			! Added by membar checker (512)
!	Mem[000000001a8001cc] = b4548c41, %l6 = 00000000ff767360
	ldsb	[%i5+0x1cf],%l6		! %l6 = 0000000000000041

p2_label_169:
!	Mem[0000000031000020] = 00000000, %l4 = fffffffffffffa1c
	ldswa	[%o2+0x020]%asi,%l4	! %l4 = 0000000000000000
!	%f24 = 00000000 00000000, %f13 = 62af7d1d
	fdtos	%f24,%f13		! %f13 = 00000000
	set	p2_b203,%o7
	fbule,pn %fcc1,p2_near_3_le	! Branch Taken, %fcc1 = 1
!	Mem[0000000018800008] = 7c3a9400 f0349c2e, %l2 = 02003210, %l3 = ece6c000
	ldda	[%i1+%o6]0x80,%l2	! %l2 = 000000007c3a9400 00000000f0349c2e
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x0cb,%g2
p2_b203:
!	Registers modified during the branch to p2_near_3
!	%l0  = 0a2f031f46c23210
!	%l1  = 0000000000000000
	membar	#Sync			! Added by membar checker (513)
!	%l7 = fffffffffffff7fd, immed = 000002a3, %l2 = 000000007c3a9400
	tsubcc	%l7,0x2a3,%l2		! %l2 = fffffffffffff55a, %ccr = 8a

p2_label_170:
!	%l7 = fffffffffffff7fd, %l2 = fffffffffffff55a, %y  = 00000000
	sdivx	%l7,%l2,%l6		! %l6 = 0000000000000000
	set	p2_b204,%o7
	fblg	p2_far_3_he	! Branch Taken, %fcc0 = 1
!	%l6 = 0000000000000000, Mem[0000000019000008] = 0000001b000000a1
	stxa	%l6,[%i2+%o6]0x80	! Mem[0000000019000008] = 0000000000000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x0cc,%g2
p2_b204:
!	Registers modified during the branch to p2_far_3
!	%l3  = fffffffffffff7fd
!	%l6  = 0000000000000000
	ble	p2_b205			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[0000000031000024] = ccc12a82, %l6 = 0000000000000000
	lduh	[%o2+0x026],%l6		! %l6 = 0000000000002a82
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x0cd,%g2
p2_b205:

p2_label_171:
	membar	#Sync			! Added by membar checker (514)
!	Mem[00000000180001f9] = 6315e0f8, %l2 = fffffffffffff55a
	ldstub	[%i0+0x1f9],%l2		! %l2 = 0000000000000015
	fbuge,pt %fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000019000000] = ff767360, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff767360
p2_b206:
	membar	#Sync			! Added by membar checker (515)
!	Mem[000000001980016c] = 55794f86, %l4 = 00000000ff767360
	ldub	[%i3+0x16e],%l4		! %l4 = 000000000000004f
	bge,a	p2_b207			! Branch Taken, %ccr = 44, CWP = 0

p2_label_172:
!	Mem[000000003000006c] = ccc12a82, %l4 = 000000000000004f
	lduw	[%o0+0x06c],%l4		! %l4 = 00000000ccc12a82
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x0cf,%g2
p2_b207:
	membar	#Sync			! Added by membar checker (516)
!	%l1 = 0000000000000000, immed = fffff689, %l6 = 0000000000002a82
	orcc	%l1,-0x977,%l6		! %l6 = fffffffffffff689, %ccr = 88
!	Mem[00000000198000a0] = 6d969adb e2da142d 0a2f031f 46c23210
	prefetch [%i3+0x0a0],23
!	Mem[0000000018800140] = c86bc5a1, %l1 = 0000000000000000
	swap	[%i1+0x140],%l1		! %l1 = 00000000c86bc5a1
	ble,a	p2_b208			! Branch Taken, %ccr = 88, CWP = 0

p2_label_173:
!	%l5 = 00000000cbe0ac97, Mem[0000000018800008] = 7c3a9400
	stha	%l5,[%i1+%o6]0x80	! Mem[0000000018800008] = ac979400
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0d0,%g2
p2_b208:
	membar	#Sync			! Added by membar checker (517)
!	Mem[00000000180001e0] = 7c07898502579924, %l2 = 0000000000000015
	ldx	[%i0+0x1e0],%l2		! %l2 = 7c07898502579924
!	Branch On Register, %l0 = 0a2f031f46c23210
	brgez,pt %l0,p2_b209		! Branch Taken
!	Mem[0000000018000008] = 970000cc, %l7 = fffffffffffff7fd
	ldsha	[%i0+%o6]0x80,%l7	! %l7 = ffffffffffff9700
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x0d1,%g2
p2_b209:
	membar	#Sync			! Added by membar checker (518)
!	%f30 = 2a474903 62af7d1d, %f26 = 40000000 562bf026
	fcmped	%fcc0,%f30,%f26		! %fcc0 = 1

p2_label_174:
!	%l0 = 0a2f031f46c23210, %l1 = 00000000c86bc5a1, %y  = 00000000
	umulcc	%l0,%l1,%l5		! %l5 = 376580e75d57cc10, %ccr = 00
!	%l0 = 0a2f031f46c23210, %l0 = 0a2f031f46c23210, %l4 = 00000000ccc12a82
	taddcc	%l0,%l0,%l4		! %l4 = 145e063e8d846420, %ccr = 0a
	bleu,a	p2_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[000000001800000c] = ffffff15, %l6 = fffffffffffff689
	lduh	[%i0+0x00e],%l6		! Annulled
p2_b210:
	membar	#Sync			! Added by membar checker (519)
!	%l6 = fffffffffffff689, %l5 = 376580e75d57cc10, %l1 = 00000000c86bc5a1
	orcc	%l6,%l5,%l1		! %l1 = fffffffffffffe99, %ccr = 88

p2_label_175:
!	%l5 = 376580e75d57cc10, immed = 00000017, %l1 = fffffffffffffe99
	sll	%l5,0x017,%l1		! %l1 = 73aeabe608000000
!	%l6 = fffffffffffff689, Mem[000000003080002c] = 0000eba7
	stha	%l6,[%o1+0x02c]%asi	! Mem[000000003080002c] = f689eba7
	bge	p2_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001a000010] = f31087a44797f105, %l1 = 73aeabe608000000
	ldx	[%i4+0x010],%l1		! %l1 = f31087a44797f105
p2_b211:
	membar	#Sync			! Added by membar checker (520)
!	%l3 = fffffffffffff7fd, %l4 = 145e063e8d846420, %y  = 376580e7
	umul	%l3,%l4,%l3		! %l3 = 8d845fb23451d3a0

p2_label_176:
	bne	p2_b212			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[0000000019000008] = 00000000, %l4 = 145e063e8d846420
	ldswa	[%i2+%o6]0x80,%l4	! %l4 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0d4,%g2
p2_b212:
	set	p2_b213,%o7
	fbl	p2_far_2_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001a0000f0] = 7b1834e8 88488428, %l0 = 46c23210, %l1 = 4797f105
	ldd	[%i4+0x0f0],%l0		! %l0 = 000000007b1834e8 0000000088488428
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x0d5,%g2
p2_b213:
!	Registers modified during the branch to p2_far_2
!	%l5  = fffffdc72b2383e8
	membar	#Sync			! Added by membar checker (521)
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetcha [%o4+0x000]%asi,3

p2_label_177:
!	Branch On Register, %l6 = fffffffffffff689
	brlez,a,pn %l6,p2_b214		! Branch Taken
!	%l2 = 7c07898502579924, Mem[0000000019800008] = 00000000
	stha	%l2,[%i3+%o6]0x80	! Mem[0000000019800008] = 99240000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0d6,%g2
p2_b214:
	membar	#Sync			! Added by membar checker (522)
!	%l0 = 000000007b1834e8, Mem[0000000031800066] = 00000000
	stb	%l0,[%o3+0x066]		! Mem[0000000031800064] = 0000e800
	set	p2_b215,%o7
	fbl,a	p2_far_1_le	! Branch Taken, %fcc0 = 1
!	%l0 = 000000007b1834e8, Mem[0000000031800020] = 0000850000000134
	stx	%l0,[%o3+0x020]		! Mem[0000000031800020] = 000000007b1834e8
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x0d7,%g2
p2_b215:
!	Registers modified during the branch to p2_far_1
!	%l2  = 000000004b082448
!	%l4  = ffffffffffff9ae1

p2_label_178:
	bvs	p2_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000019000000] = 00000000764b770c, %l1 = 0000000088488428
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = 00000000764b770c
p2_b216:
	membar	#Sync			! Added by membar checker (523)
	set	p2_b217,%o7
	fblg,a,pt %fcc0,p2_near_3_he	! Branch Taken, %fcc0 = 1
!	%l1 = 00000000764b770c, Mem[0000000019800000] = ff000026
	stba	%l1,[%i3+%g0]0x80	! Mem[0000000019800000] = 0c000026
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x0d9,%g2
p2_b217:
!	Registers modified during the branch to p2_near_3
!	%l0  = 0000000006169800
!	%l1  = 8d845fb23451d2b8
!	%l6  = 0000000000460000
!	%l7  = 00000000ccc12a82
	membar	#Sync			! Added by membar checker (524)
!	%l2 = 000000004b082448, immed = 0000048a, %l7 = 00000000ccc12a82
	xnor	%l2,0x48a,%l7		! %l7 = ffffffffb4f7df3d

p2_label_179:
!	%l0 = 0000000006169800, Mem[0000000019000008] = 00000000
	stba	%l0,[%i2+%o6]0x80	! Mem[0000000019000008] = 00000000
!	%l1 = 8d845fb23451d2b8, Mem[0000000019000008] = 00000000
	stha	%l1,[%i2+%o6]0x80	! Mem[0000000019000008] = d2b80000
!	%l5 = fffffdc72b2383e8, %l3 = 8d845fb23451d3a0, %y  = 00000000
	udiv	%l5,%l3,%l1		! %l1 = 0000000000000000
!	%l6 = 0000000000460000
	sethi	%hi(0x1eb08000),%l6	! %l6 = 000000001eb08000
	bneg	p2_not_taken_0		! Branch Not Taken, %ccr = 80

p2_label_180:
!	Mem[0000000019800000] = 0c000026, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 000000000000000c
p2_b218:
	membar	#Sync			! Added by membar checker (525)
!	Branch On Register, %l6 = 000000001eb08000
	brnz,pt	%l6,p2_b219		! Branch Taken
!	%l3 = 8d845fb23451d3a0, Mem[000000001a000008] = 00000000
	stha	%l3,[%i4+%o6]0x80	! Mem[000000001a000008] = d3a00000
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0db,%g2
p2_b219:
	fbge	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000030800060] = d3cf4e8d, %l5 = fffffdc72b2383e8
	ldsb	[%o1+0x062],%l5		! %l5 = 000000000000004e
p2_b220:

p2_label_181:
	membar	#Sync			! Added by membar checker (526)
!	%l3 = 8d845fb23451d3a0, %l7 = ffffffffb4f7df3d, %l5 = 000000000000004e
	addcc	%l3,%l7,%l5		! %l5 = 8d845fb1e949b2dd, %ccr = 98
	nop
!	%l5 = 8d845fb1e949b2dd, %l4 = ffffffffffff9ae1, %l4 = ffffffffffff9ae1
	or	%l5,%l4,%l4		! %l4 = ffffffffffffbafd
!	Mem[0000000031000024] = ccc12a82, %l4 = ffffffffffffbafd
	lduha	[%o2+0x024]%asi,%l4	! %l4 = 000000000000ccc1
!	%l6 = 000000001eb08000, %l3 = 8d845fb23451d3a0, %l6 = 000000001eb08000
	taddcc	%l6,%l3,%l6		! %l6 = 8d845fb2530253a0, %ccr = 80

p2_label_182:
	set	p2_b221,%o7
	fbule,a,pt %fcc0,p2_near_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000018800008] = ac979400, %l2 = 000000004b082448
	ldsba	[%i1+%o6]0x80,%l2	! %l2 = ffffffffffffffac
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0dd,%g2
p2_b221:
!	Registers modified during the branch to p2_near_3
!	%l0  = 00000459c0a64e88
!	%l1  = 8d845fb23451d2b8
!	%l6  = 0000000000460000
!	%l7  = 00000000ccc12a82
	membar	#Sync			! Added by membar checker (527)
!	Mem[0000000018800008] = ac979400, %l7 = 00000000ccc12a82
	ldsha	[%i1+%o6]0x80,%l7	! %l7 = ffffffffffffac97
!	%f25 = 00000000, %f6  = 80000000, %f4  = 00000000 03fbd1e0
	nop
!	%l0 = 00000459c0a64e88, immed = 000009a9, %y  = 00000459
	smulcc	%l0,0x9a9,%l4		! %l4 = fffffd9c068c9fc8, %ccr = 80

p2_label_183:
!	Branch On Register, %l5 = 8d845fb1e949b2dd
	brlez,pn %l5,p2_b222		! Branch Taken
!	%l0 = c0a64e88, %l1 = 3451d2b8, Mem[0000000018800008] = ac979400 f0349c2e
	stda	%l0,[%i1+%o6]0x80	! Mem[0000000018800008] = c0a64e88 3451d2b8
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0de,%g2
p2_b222:
	membar	#Sync			! Added by membar checker (528)
	set	p2_b223,%o7
	fblg,pt	%fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 1
!	%l3 = 8d845fb23451d3a0, Mem[0000000019800120] = 8c8f256ed1eeae90
	stx	%l3,[%i3+0x120]		! Mem[0000000019800120] = 8d845fb23451d3a0
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p2_branch_failed
	mov	0x0df,%g2
p2_b223:
	membar	#Sync			! Added by membar checker (529)
!	%l0 = 00000459c0a64e88
	setx	0xd4e4d10dd4e4d10d,%g7,%l0 ! %l0 = d4e4d10dd4e4d10d

p2_label_184:
!	%l3 = 8d845fb23451d3a0, Mem[0000000019800000] = 0c000026
	stba	%l3,[%i3+%g0]0x80	! Mem[0000000019800000] = a0000026
!	%l1 = 8d845fb23451d2b8
	setx	0xe240fafde240fafd,%g7,%l1 ! %l1 = e240fafde240fafd
	set	p2_b224,%o7
	fbne,pn	%fcc0,p2_near_1_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001800013c] = 272d723f, %l5 = 8d845fb1e949b2dd
	ldsb	[%i0+0x13d],%l5		! %l5 = 000000000000002d
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p2_branch_failed
	mov	0x0e0,%g2
p2_b224:
	membar	#Sync			! Added by membar checker (530)
!	Mem[0000000018800000] = 0000000000000094, %l0 = d4e4d10dd4e4d10d
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000094

p2_label_185:
!	%l5 = 000000000000002d, immed = fffffc79, %l6 = 0000000000460000
	andncc	%l5,-0x387,%l6		! %l6 = 0000000000000004, %ccr = 00
!	%l5 = 000000000000002d, Mem[0000000018800000] = 00000000
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000018800000] = 0000002d
!	%l2 = ffffffffffffffac, %l0 = 0000000000000094, %l7 = ffffffffffffac97
	xnorcc	%l2,%l0,%l7		! %l7 = 00000000000000c7, %ccr = 00
!	%l3 = 8d845fb23451d3a0, immed = fffff98a, %l6 = 0000000000000004
	andncc	%l3,-0x676,%l6		! %l6 = 0000000000000220, %ccr = 00
!	Jump to jmpl_0, CWP = 0
	set	p2_jmpl_0_le,%g1
	jmpl	%g1,%g6

p2_label_186:
!	Mem[0000000018000000] = 53800000, %l7 = 00000000000000c7
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000053
!	Registers modified during the branch to p2_jmpl_0
!	%l0  = 000000000000002d
!	%l6  = 8d845fb23451d34c
!	%l7  = fffffffffffffbbe
!	Mem[0000000018800008] = c0a64e88, %l5 = 000000000000002d
	ldstuba	[%i1+%o6]0x80,%l5	! %l5 = 00000000000000c0
	fbue	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000031000068] = 3eff193d, %l0 = 000000000000002d
	ldsb	[%o2+0x06b],%l0		! %l0 = 000000000000003d
p2_b225:
	membar	#Sync			! Added by membar checker (531)
!	Mem[0000000030000068] = 00460000, %l3 = 8d845fb23451d3a0
	ldsw	[%o0+0x068],%l3		! %l3 = 0000000000460000

p2_label_187:
!	Mem[0000000030800024] = c8000000, %l4 = fffffd9c068c9fc8
	ldswa	[%o1+0x024]%asi,%l4	! %l4 = ffffffffc8000000
!	%f16 = 4289e51f 28298a00, %f30 = 2a474903 62af7d1d
	fcmped	%fcc3,%f16,%f30		! %fcc3 = 2
!	%f28 = d50e7a41 e5eb3868, %f28 = d50e7a41 e5eb3868, %f30 = 2a474903 62af7d1d
	fsubd	%f28,%f28,%f30		! %f30 = 00000000 00000000
!	%l3 = 0000000000460000, %l0 = 000000000000003d, %l3 = 0000000000460000
	xorcc	%l3,%l0,%l3		! %l3 = 000000000046003d, %ccr = 00
!	Mem[0000000019800128] = 0bfcd43a, %l7 = fffffffffffffbbe
	swap	[%i3+0x128],%l7		! %l7 = 000000000bfcd43a

p2_label_188:
	fbuge,a,pt %fcc1,p2_branch_failed	! Branch Not Taken, %fcc1 = 1
!	%l3 = 000000000046003d, Mem[000000001980018f] = 19255183
	stb	%l3,[%i3+0x18f]		! Annulled
p2_b226:
	membar	#Sync			! Added by membar checker (532)
!	%f12 = 2a374903 00000000, %f12 = 2a374903 00000000, %f24 = 00000000 00000000
	fdivd	%f12,%f12,%f24		! %f24 = 3ff00000 00000000
!	%l2 = ffffffffffffffac, %l4 = ffffffffc8000000, %l5 = 00000000000000c0
	sub	%l2,%l4,%l5		! %l5 = 0000000037ffffac
!	Mem[0000000018000008] = 970000cc, %l6 = 8d845fb23451d34c
	ldsha	[%i0+%o6]0x80,%l6	! %l6 = ffffffffffff9700

p2_label_189:
	fbue,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l0 = 0000003d, %l1 = e240fafd, Mem[0000000019800000] = a0000026 00000450
	stda	%l0,[%i3+%g0]0x80	! Annulled
p2_b227:
	membar	#Sync			! Added by membar checker (533)
!	%l2 = ffffffffffffffac, Mem[0000000032000014] = 3a10c403
	stw	%l2,[%o4+0x014]		! Mem[0000000032000014] = ffffffac
!	%l4 = ffffffffc8000000, %l4 = ffffffffc8000000, %y  = fffffd9c
	sdiv	%l4,%l4,%l7		! %l7 = 0000000000000aea
!	%l6 = ffffffffffff9700, %l0 = 000000000000003d, %l4 = ffffffffc8000000
	xor	%l6,%l0,%l4		! %l4 = ffffffffffff973d

p2_label_190:
	set	p2_b228,%o7
	fba,pt	%fcc0,p2_near_0_le	! Branch Taken, %fcc0 = 1
!	Mem[0000000018000000] = 53800000, %l6 = ffffffffffff9700
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000053
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x0e4,%g2
p2_b228:
!	Registers modified during the branch to p2_near_0
!	%l1  = 000000000045fce6
!	%l4  = ffffffffd265cd85
!	%l6  = 1dbf05021dbf6dc0
	membar	#Sync			! Added by membar checker (534)
!	Mem[0000000030800024] = c8000000, %l2 = ffffffffffffffac
	lduba	[%o1+0x025]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030000028] = 00ff0026, %l6 = 1dbf05021dbf6dc0
	ldsh	[%o0+0x02a],%l6		! %l6 = 0000000000000026
!	%l6 = 0000000000000026, %l2 = 0000000000000000, %y  = fffffd9c
	smul	%l6,%l2,%l6		! %l6 = 0000000000000000

p2_label_191:
	fbn,a	%fcc0,p2_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001b000008] = d4a1330b, %l1 = 000000000045fce6
	ldsba	[%i6+%o6]0x80,%l1	! Annulled
p2_b229:
	membar	#Sync			! Added by membar checker (535)
!	%l5 = 0000000037ffffac, immed = 00000dcd, %l5 = 0000000037ffffac
	orncc	%l5,0xdcd,%l5		! %l5 = ffffffffffffffbe, %ccr = 88
!	%l1 = 000000000045fce6, immed = fffffbc8, %l2 = 0000000000000000
	andncc	%l1,-0x438,%l2		! %l2 = 0000000000000426, %ccr = 00
!	Mem[000000003180002f] = f5cdda10, %l3 = 000000000046003d
	ldstuba	[%o3+0x02f]%asi,%l3	! %l3 = 0000000000000010

p2_label_192:
!	%f23 = 550e7a41, %f14 = 00000000, %f0  = 80000000
	fadds	%f23,%f14,%f0 		! %f0  = 550e7a41
	bge	p2_b230			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000003200001c] = b4422a82, %l2 = 0000000000000426
	ldsb	[%o4+0x01e],%g2		! %g2 = ffffffffffffffb4
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p2_branch_failed
	mov	0x0e6,%g2
p2_b230:
	membar	#Sync			! Added by membar checker (536)
!	%l5 = ffffffffffffffbe, %l1 = 000000000045fce6, %l6 = 0000000000000000
	srax	%l5,%l1,%l6		! %l6 = ffffffffffffffff
!	Mem[000000001900001c] = 9a60ac97, %l0 = 000000000000003d
	ldstuba	[%i2+0x01c]%asi,%l0	! %l0 = 000000000000009a

p2_label_193:
	set	p2_b231,%o7
	fbul	p2_far_2_le	! Branch Taken, %fcc0 = 1
!	%l1 = 000000000045fce6, Mem[0000000032000078] = 57fa95466cb174b6
	stx	%l1,[%o4+0x078]		! Mem[0000000032000078] = 000000000045fce6
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p2_branch_failed
	mov	0x0e7,%g2
p2_b231:
!	Registers modified during the branch to p2_far_2
!	%l1  = b653e6eb9a60ac97
!	%l2  = 00000000000002d3
!	%l4  = ffe932e6c2800000
!	%l5  = 00000000000155b0
	membar	#Sync			! Added by membar checker (537)
!	Mem[0000000018800008] = ffa64e88 3451d2b8, %l0 = 0000009a, %l1 = 9a60ac97
	ldda	[%i1+%o6]0x80,%l0	! %l0 = 00000000ffa64e88 000000003451d2b8
!	%f4  = 00000000 03fbd1e0, %f14 = 00000000 00000000
	fabsd	%f4 ,%f14		! %f14 = 00000000 03fbd1e0
!	%f26 = 40000000, %f3  = 0ce00000
	fstoi	%f26,%f3 		! %f3  = 00000002

p2_label_194:
!	%f26 = 40000000 562bf026, %f4  = 00000000 03fbd1e0
	fmovd	%f26,%f4 		! %f4  = 40000000 562bf026
!	%f26 = 40000000, %f1  = c1e2ff27
	fstoi	%f26,%f1 		! %f1  = 00000002
!	%l6 = ffffffffffffffff, Mem[0000000031800060] = ca85b6000000e800
	stxa	%l6,[%o3+0x060]%asi	! Mem[0000000031800060] = ffffffffffffffff
!	%f6  = 80000000, %f13 = 00000000, %f15 = 03fbd1e0
	fmuls	%f6 ,%f13,%f15		! %f15 = 80000000
!	%f24 = 3ff00000 00000000, %f5  = 562bf026
	fdtos	%f24,%f5 		! %f5  = 3f800000

p2_label_195:
!	%l3 = 0000000000000010, %l4 = ffe932e6c2800000, %y  = 00000000
	sdivx	%l3,%l4,%l3		! %l3 = 0000000000000000
!	Mem[00000000190001a8] = 00000000, %l6 = ffffffffffffffff
	ldub	[%i2+0x1ab],%l6		! %l6 = 0000000000000000
!	%l4 = ffe932e6c2800000
	sethi	%hi(0x391d2000),%l4	! %l4 = 00000000391d2000
!	%l7 = 0000000000000aea, immed = 00000365, %l5 = 00000000000155b0
	xnor	%l7,0x365,%l5		! %l5 = fffffffffffff670
!	Branch On Register, %l1 = 000000003451d2b8
	brgz,pn	%l1,p2_b232		! Branch Taken

p2_label_196:
!	Mem[0000000018800000] = 0000002d, %l5 = fffffffffffff670
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x0e8,%g2
p2_b232:
	membar	#Sync			! Added by membar checker (538)
!	Mem[0000000018800180] = ab637efe 92c6b8b8 c8609430 358d9056
	prefetcha [%i1+0x180]%asi,16
!	%l7 = 0000000000000aea, immed = 0000003d, %l1 = 000000003451d2b8
	srax	%l7,0x03d,%l1		! %l1 = 0000000000000000
!	Branch On Register, %l5 = 0000000000000000
	brgez,a,pn %l5,p2_b233		! Branch Taken
!	Mem[0000000019800008] = 99240000 ffffffb7, %l0 = ffa64e88, %l1 = 00000000
	ldda	[%i3+%o6]0x80,%l0	! %l0 = 0000000099240000 00000000ffffffb7
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x0e9,%g2
p2_b233:

p2_label_197:
	bne	p2_b234			! Branch Taken, %ccr = 00, CWP = 0
!	%l4 = 00000000391d2000, Mem[0000000019800000] = a0000026
	stba	%l4,[%i3+%g0]0x80	! Mem[0000000019800000] = 00000026
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p2_branch_failed
	mov	0x0ea,%g2
p2_b234:
	membar	#Sync			! Added by membar checker (539)
!	%l0 = 0000000099240000, immed = ffffff15, %y  = 00000000
	sdivcc	%l0,-0x0eb,%l3		! %l3 = ffffffffff592caa, %ccr = 88
!	%l2 = 00000000000002d3, immed = fffff30b, %y  = 00000000
	umul	%l2,-0xcf5,%l7		! %l7 = 000002d2ffdb6811
!	Mem[00000000190000c0] = c801bb20 9133b517 dbc79447 c23272fa
	prefetcha [%i2+0x0c0]%asi,2

p2_label_198:
!	%l2 = 00000000000002d3, Mem[000000001800015a] = db42c362
	stha	%l2,[%i0+0x15a]%asi	! Mem[0000000018000158] = db4202d3
!	%l6 = 0000000000000000, immed = 00000415, %l5 = 0000000000000000
	andn	%l6,0x415,%l5		! %l5 = 0000000000000000
!	%l2 = 00000000000002d3, %l5 = 0000000000000000, %l5 = 0000000000000000
	xor	%l2,%l5,%l5		! %l5 = 00000000000002d3
!	%f0  = 550e7a41 00000002, %f4  = 40000000 3f800000
	fnegd	%f0 ,%f4 		! %f4  = d50e7a41 00000002
	set	p2_b235,%o7
	fbl,a,pn %fcc2,p2_near_1_he	! Branch Taken, %fcc2 = 1

p2_label_199:
!	%l1 = 00000000ffffffb7, Mem[000000001980010c] = 80a057d0
	stw	%l1,[%i3+0x10c]		! Mem[000000001980010c] = ffffffb7
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p2_branch_failed
	mov	0x0eb,%g2
p2_b235:
	membar	#Sync			! Added by membar checker (540)
	set	p2_b236,%o7
	fbul,a,pn %fcc0,p2_near_3_he	! Branch Taken, %fcc0 = 1
!	Mem[0000000018000100] = bab6d37a fffffdef 134038f6 0e0dca90
	prefetch [%i0+0x100],21
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x0ec,%g2
p2_b236:
!	Registers modified during the branch to p2_near_3
!	%l0  = 000000021f2f43a8
!	%l1  = ffffffffff592bc2
!	%l6  = 0000000000460000
!	%l7  = 00000000ccc12a82
	membar	#Sync			! Added by membar checker (541)
!	%f21 = 00000000, %f8  = 69106f89, %f29 = e5eb3868
	fadds	%f21,%f8 ,%f29		! %f29 = 69106f89
!	Branch On Register, %l3 = ffffffffff592caa
	brz,a,pt %l3,p2_not_taken_0	! Branch Not Taken

p2_label_200:
!	Mem[0000000019000008] = d2b80000, %l1 = ffffffffff592bc2
	ldswa	[%i2+%o6]0x80,%l1	! Annulled
p2_b237:
	bvs	p2_b238			! Branch Taken, %ccr = 8a, CWP = 0
!	Mem[0000000019000008] = d2b80000, %l1 = ffffffffff592bc2
	swapa	[%i2+%o6]0x80,%l1	! %l1 = 00000000d2b80000
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p2_branch_failed
	mov	0x0ee,%g2
p2_b238:
	bgu,a	p2_b239			! Branch Taken, %ccr = 8a, CWP = 0
!	%l5 = 00000000000002d3, Mem[000000003180002c] = f5cddaff
	stw	%l5,[%o3+0x02c]		! Mem[000000003180002c] = 000002d3
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p2_branch_failed
	mov	0x0ef,%g2
	nop
p2_b239:
	nop

!	End of Random Code for Processor 2

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x008]		! Set processor 2 done flag

!	Check Registers

p2_check_registers:
	set	p2_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000021f2f43a8
	bne,a,pn %xcc,p2_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000d2b80000
	bne,a,pn %xcc,p2_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000002d3
	bne,a,pn %xcc,p2_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffff592caa
	bne,a,pn %xcc,p2_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000391d2000
	bne,a,pn %xcc,p2_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000002d3
	bne,a,pn %xcc,p2_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000460000
	bne,a,pn %xcc,p2_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000ccc12a82
	bne,a,pn %xcc,p2_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000002,%g2
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
	cmp	%l0,%l1			! %f0  should be 550e7a41 00000002
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000002
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be d50e7a41 00000002
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 80000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf06,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000001
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 2a374903 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 80000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 4289e51f 28298a00
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 550e7a41
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 550e7a41
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
	cmp	%l0,%l1			! %f26 should be 40000000 562bf026
	bne,a,pn	%xcc,p2_freg_fail
	or	%g0,0xf26,%g1
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be d50e7a41 69106f89
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
	ldx	[%g1+0x000],%g2		! Expect data = 53800000d7ca678c
	ldx	[%i0+0x000],%g3		! Observed data at 0000000018000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 970000ccffffff15
	ldx	[%i0+0x008],%g3		! Observed data at 0000000018000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = e9fb28ffc49bff17
	ldx	[%i0+0x020],%g3		! Observed data at 0000000018000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 2a82d5d2c4607c6f
	ldx	[%i0+0x050],%g3		! Observed data at 0000000018000050
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x070],%g2		! Expect data = f5652d9100000000
	ldx	[%i0+0x070],%g3		! Observed data at 0000000018000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x090],%g2		! Expect data = 2806958000008d9e
	ldx	[%i0+0x090],%g3		! Observed data at 0000000018000090
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x090,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 7b8145d8dd01ff3d
	ldx	[%i0+0x098],%g3		! Observed data at 0000000018000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 171f81bdffc95824
	ldx	[%i0+0x0a8],%g3		! Observed data at 00000000180000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0b0],%g2		! Expect data = 0000009c00000000
	ldx	[%i0+0x0b0],%g3		! Observed data at 00000000180000b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0b0,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = d29b449c00000053
	ldx	[%i0+0x0c0],%g3		! Observed data at 00000000180000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = df53165d8d910062
	ldx	[%i0+0x0f8],%g3		! Observed data at 00000000180000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f8,%g4
	ldx	[%g1+0x100],%g2		! Expect data = bab6d37afffffdef
	ldx	[%i0+0x100],%g3		! Observed data at 0000000018000100
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 0000eba7ccc12a82
	ldx	[%i0+0x128],%g3		! Observed data at 0000000018000128
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x138],%g2		! Expect data = 30d9fe73272d723f
	ldx	[%i0+0x138],%g3		! Observed data at 0000000018000138
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x158],%g2		! Expect data = db4202d38ef33ff1
	ldx	[%i0+0x158],%g3		! Observed data at 0000000018000158
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = f395d9eefff9217b
	ldx	[%i0+0x1b0],%g3		! Observed data at 00000000180001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = c16fc32b9cd19c85
	ldx	[%i0+0x1d0],%g3		! Observed data at 00000000180001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 47ce2b92e70873be
	ldx	[%i0+0x1e8],%g3		! Observed data at 00000000180001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 63ffe0f84cf457f6
	ldx	[%i0+0x1f8],%g3		! Observed data at 00000000180001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f8,%g4

	set	p2_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000002d00000094
	ldx	[%i1+0x000],%g3		! Observed data at 0000000018800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ffa64e883451d2b8
	ldx	[%i1+0x008],%g3		! Observed data at 0000000018800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 000000009fc451d4
	ldx	[%i1+0x018],%g3		! Observed data at 0000000018800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 6252b48a62aa8cf2
	ldx	[%i1+0x0a8],%g3		! Observed data at 00000000188000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 000001feece6c000
	ldx	[%i1+0x0b8],%g3		! Observed data at 00000000188000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 207261daa3ff1f7f
	ldx	[%i1+0x108],%g3		! Observed data at 0000000018800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x138],%g2		! Expect data = 382c498e63b9a824
	ldx	[%i1+0x138],%g3		! Observed data at 0000000018800138
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x138,%g4
	ldx	[%g1+0x140],%g2		! Expect data = 00000000f2a2904c
	ldx	[%i1+0x140],%g3		! Observed data at 0000000018800140
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x178],%g2		! Expect data = a2836f9accff9f78
	ldx	[%i1+0x178],%g3		! Observed data at 0000000018800178
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x178,%g4

	set	p2_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000764b770c
	ldx	[%i2+0x000],%g3		! Observed data at 0000000019000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = ff592bc200000000
	ldx	[%i2+0x008],%g3		! Observed data at 0000000019000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 1313b648ff60ac97
	ldx	[%i2+0x018],%g3		! Observed data at 0000000019000018
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x030],%g2		! Expect data = 88622ae7b19e7430
	ldx	[%i2+0x030],%g3		! Observed data at 0000000019000030
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x078],%g2		! Expect data = 00000000cbe0ac97
	ldx	[%i2+0x078],%g3		! Observed data at 0000000019000078
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x078,%g4
	ldx	[%g1+0x0f8],%g2		! Expect data = 000000ccccc12a82
	ldx	[%i2+0x0f8],%g3		! Observed data at 00000000190000f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f8,%g4
	ldx	[%g1+0x108],%g2		! Expect data = 4e44370ef77d887f
	ldx	[%i2+0x108],%g3		! Observed data at 0000000019000108
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x110],%g2		! Expect data = 0000000054c0e4fa
	ldx	[%i2+0x110],%g3		! Observed data at 0000000019000110
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x140],%g2		! Expect data = 000000d9db0449f9
	ldx	[%i2+0x140],%g3		! Observed data at 0000000019000140
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x168],%g2		! Expect data = c0a40043a038dd7f
	ldx	[%i2+0x168],%g3		! Observed data at 0000000019000168
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x188],%g2		! Expect data = 0000000000000000
	ldx	[%i2+0x188],%g3		! Observed data at 0000000019000188
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x188,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 00000000ccc12a82
	ldx	[%i2+0x1a8],%g3		! Observed data at 00000000190001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a8,%g4
	ldx	[%g1+0x1b0],%g2		! Expect data = 7e2e18b294004973
	ldx	[%i2+0x1b0],%g3		! Observed data at 00000000190001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b0,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 00d1909570fc9aa2
	ldx	[%i2+0x1f0],%g3		! Observed data at 00000000190001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1f0,%g4

	set	p2_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000002600000450
	ldx	[%i3+0x000],%g3		! Observed data at 0000000019800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 99240000ffffffb7
	ldx	[%i3+0x008],%g3		! Observed data at 0000000019800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x018],%g2		! Expect data = 5eff6c91fffffce9
	ldx	[%i3+0x018],%g3		! Observed data at 0000000019800018
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x018,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 90bdb77a2d7349bc
	ldx	[%i3+0x020],%g3		! Observed data at 0000000019800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x0f0],%g2		! Expect data = 3401831a4da26889
	ldx	[%i3+0x0f0],%g3		! Observed data at 00000000198000f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x0f0,%g4
	ldx	[%g1+0x108],%g2		! Expect data = e8f3fc78ffffffb7
	ldx	[%i3+0x108],%g3		! Observed data at 0000000019800108
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x108,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 8d845fb23451d3a0
	ldx	[%i3+0x120],%g3		! Observed data at 0000000019800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = fffffbbe8319f0b9
	ldx	[%i3+0x128],%g3		! Observed data at 0000000019800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x168],%g2		! Expect data = fffff20455794f86
	ldx	[%i3+0x168],%g3		! Observed data at 0000000019800168
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x180],%g2		! Expect data = 57f28c363ac9898c
	ldx	[%i3+0x180],%g3		! Observed data at 0000000019800180
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x180,%g4

	set	p2_local4_expect,%g1
	ldx	[%g1+0x008],%g2		! Expect data = d3a0000000000134
	ldx	[%i4+0x008],%g3		! Observed data at 000000001a000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x1a8],%g2		! Expect data = 45dc008d10323873
	ldx	[%i4+0x1a8],%g3		! Observed data at 000000001a0001a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1a8,%g4

	set	p2_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 00000000fd7720f7
	ldx	[%i5+0x000],%g3		! Observed data at 000000001a800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 65567ff200000000
	ldx	[%i5+0x020],%g3		! Observed data at 000000001a800020
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x020,%g4

	set	p2_local6_expect,%g1
	ldx	[%g1+0x1b0],%g2		! Expect data = 000000009cd1ecc8
	ldx	[%i6+0x1b0],%g3		! Observed data at 000000001b0001b0
	cmp	%g2,%g3
	bne,a,pn %xcc,p2_local_failed
	mov	0x1b0,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p2_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p2_memcheck_share0:
	ldx	[%g4+0x20],%g2	! Expected value = ced3eba74b4926af
	ldx	[%o0+0x20],%g3	! Read value at Mem[0000000030000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 00ff00260000003d
	ldx	[%o0+0x28],%g3	! Read value at Mem[0000000030000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = bb9a418bad4f8aee
	ldx	[%o0+0x60],%g3	! Read value at Mem[0000000030000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 00460000ccc12a82
	ldx	[%o0+0x68],%g3	! Read value at Mem[0000000030000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p2_memcheck_share1:
	ldx	[%g4+0x20],%g2	! Expected value = 00000235c8000000
	ldx	[%o1+0x20],%g3	! Read value at Mem[0000000030800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = ffd9ff00f689eba7
	ldx	[%o1+0x28],%g3	! Read value at Mem[0000000030800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = d3cf4e8dc2f78262
	ldx	[%o1+0x60],%g3	! Read value at Mem[0000000030800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 4b49ffffff6f3aa2
	ldx	[%o1+0x68],%g3	! Read value at Mem[0000000030800068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p2_memcheck_share2:
	ldx	[%g4+0x20],%g2	! Expected value = 00000000ccc12a82
	ldx	[%o2+0x20],%g3	! Read value at Mem[0000000031000020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 6a764cecffffff15
	ldx	[%o2+0x28],%g3	! Read value at Mem[0000000031000028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = 0000000000000000
	ldx	[%o2+0x60],%g3	! Read value at Mem[0000000031000060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = 3eff193d5cff8775
	ldx	[%o2+0x68],%g3	! Read value at Mem[0000000031000068]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x068,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p2_memcheck_share3:
	ldx	[%g4+0x20],%g2	! Expected value = 000000007b1834e8
	ldx	[%o3+0x20],%g3	! Read value at Mem[0000000031800020]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x020,%g1
	ldx	[%g4+0x28],%g2	! Expected value = 00000000000002d3
	ldx	[%o3+0x28],%g3	! Read value at Mem[0000000031800028]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x028,%g1
	ldx	[%g4+0x60],%g2	! Expected value = ffffffffffffffff
	ldx	[%o3+0x60],%g3	! Read value at Mem[0000000031800060]
	cmp	%g2,%g3
	bne,pn	%xcc,p2_failed
	add	%g6,0x060,%g1
	ldx	[%g4+0x68],%g2	! Expected value = fffddb4fbcee6bbf
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
	prefetch [%i0+0x0a0],0
	done

p2_trap1o:
	prefetch [%o0+0x0a0],0
	done


p2_trap2e:
	subc	%l7,%l5,%l2
	done

p2_trap2o:
	subc	%l7,%l5,%l2
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
	ldx	[%g1+0x000],%l0	! %l0 = 07a3afffa71cea20
	ldx	[%g1+0x008],%l1	! %l1 = 80fe860063b774c9
	ldx	[%g1+0x010],%l2	! %l2 = 76d306002eb8a056
	ldx	[%g1+0x018],%l3	! %l3 = 8aea7eff931ec9f6
	ldx	[%g1+0x020],%l4	! %l4 = a05ef9ff9ecd164e
	ldx	[%g1+0x028],%l5	! %l5 = 8adf3e000e99831a
	ldx	[%g1+0x030],%l6	! %l6 = 51200cffb524ed96
	ldx	[%g1+0x038],%l7	! %l7 = 00d98b00088ad4c9

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
	ldd	[%g1+0x00],%f0		! %f0  = fc0e1613, %f1  = 5a9c6e6a
	ldd	[%g1+0x08],%f2		! %f2  = e13d489d, %f3  = bcb43de1
	ldd	[%g1+0x10],%f4		! %f4  = 8e4417c5, %f5  = d004dc94
	ldd	[%g1+0x18],%f6		! %f6  = 0a22e7d0, %f7  = 1356c605
	ldd	[%g1+0x20],%f8		! %f8  = 837b45cd, %f9  = dc4ef9db
	ldd	[%g1+0x28],%f10		! %f10 = 12d93726, %f11 = 808daef4
	ldd	[%g1+0x30],%f12		! %f12 = 9eac6238, %f13 = c5652672
	ldd	[%g1+0x38],%f14		! %f14 = fc93335f, %f15 = f1f8acd1
	ldd	[%g1+0x40],%f16		! %f16 = 1645f46d, %f17 = 4a4963ed
	ldd	[%g1+0x48],%f18		! %f18 = 162de21c, %f19 = 77df3fe0
	ldd	[%g1+0x50],%f20		! %f20 = 8482c11c, %f21 = 45aff05d
	ldd	[%g1+0x58],%f22		! %f22 = 48647a44, %f23 = 474cecdb
	ldd	[%g1+0x60],%f24		! %f24 = 99e70288, %f25 = bb5042cc
	ldd	[%g1+0x68],%f26		! %f26 = 44a8b7f2, %f27 = da38583a
	ldd	[%g1+0x70],%f28		! %f28 = 29977c25, %f29 = ee1c8376
	ldd	[%g1+0x78],%f30		! %f30 = 6dac8d99, %f31 = ccb10c97
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 3

p3_label_1:
	membar	#Sync			! Added by membar checker (542)
!	%f2  = e13d489d, %f18 = 162de21c
	fcmpes	%fcc3,%f2 ,%f18		! %fcc3 = 1
!	%l4 = defc69003bfb3e36, immed = fffff818, %l2 = 51950affa6cb0dae
	tsubcc	%l4,-0x7e8,%l2		! %l2 = defc69003bfb461e, %ccr = 93
!	%l3 = f358ee003ce55bdf, immed = fffff69c, %l0 = 597d32ffcc8aed6c
	xnorcc	%l3,-0x964,%l0		! %l0 = f358ee003ce552bc, %ccr = 80
!	Branch On Register, %l0 = f358ee003ce552bc
	brlz,pn	%l0,p3_b1		! Branch Taken
!	%l6 = edb267ffff451fd6, Mem[000000001c8001fc] = 40f60802
	stw	%l6,[%i1+0x1fc]		! Mem[000000001c8001fc] = ff451fd6
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x001,%g2
p3_b1:

p3_label_2:
	membar	#Sync			! Added by membar checker (543)
!	Mem[0000000031800034] = a2347a89, %l1 = de501337, %l6 = ff451fd6
	add	%o3,0x34,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 00000000a2347a89
!	Mem[000000001c000100] = 8e484f03 60240fa9 61cb2873 fb9c6f47
	prefetch [%i0+0x100],20
!	%l2 = defc69003bfb461e, Mem[000000001d000008] = 2187cd03
	stba	%l2,[%i2+%o6]0x80	! Mem[000000001d000008] = 1e87cd03
!	%l7 = ea1e2e00700d8f29, Mem[0000000032000066] = e6bc6a5f
	sth	%l7,[%o4+0x066]		! Mem[0000000032000064] = 8f296a5f
!	Mem[000000001d8001c0] = e475ff3e, %l0 = 3ce552bc, %l4 = 3bfb3e36
	add	%i3,0x1c0,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000e475ff3e

p3_label_3:
!	%l7 = ea1e2e00700d8f29, immed = 00000018, %l4 = 00000000e475ff3e
	srl	%l7,0x018,%l4		! %l4 = 0000000000000070
	fbne	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l7 = ea1e2e00700d8f29, Mem[000000001c800008] = 7af6480f
	stha	%l7,[%i1+%o6]0x80	! Mem[000000001c800008] = 8f29480f
p3_b2:
	membar	#Sync			! Added by membar checker (544)
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],3
!	%l6 = a2347a89, %l7 = 700d8f29, Mem[0000000031800030] = 120f683a a2347a89
	std	%l6,[%o3+0x030]	! Mem[0000000031800030] = a2347a89 700d8f29

p3_label_4:
	fbug,a,pn %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000001c0001d8] = b4cfeedb, %l3 = f358ee003ce55bdf
	ldstub	[%i0+0x1d8],%l3		! Annulled
p3_b3:
	membar	#Sync			! Added by membar checker (545)
!	%f18 = 162de21c, %f20 = 8482c11c
	fcmps	%fcc1,%f18,%f20		! %fcc1 = 2
!	%l1 = edb1b6ffde501337, Mem[000000003000003b] = 25c1078b
	stba	%l1,[%o0+0x03b]%asi	! Mem[0000000030000038] = 25c10737
!	Mem[000000001d800008] = 9f54be6b, %l1 = edb1b6ffde501337
	lduba	[%i3+%o6]0x80,%l1	! %l1 = 000000000000009f

p3_label_5:
!	%l1 = 000000000000009f, %l0 = f358ee003ce552bc, %l3 = f358ee003ce55bdf
	andn	%l1,%l0,%l3		! %l3 = 0000000000000003
!	Mem[000000001c8001b0] = 9daedaf2, %l3 = 0000000000000003
	ldsha	[%i1+0x1b0]%asi,%l3	! %l3 = ffffffffffff9dae
!	%f20 = 8482c11c 45aff05d, %f20 = 8482c11c 45aff05d, %f2  = e13d489d bcb43de1
	faddd	%f20,%f20,%f2 		! %f2  = 8492c11c 45aff05d
!	Mem[000000001d000120] = 63d28fc4 f4b9ab72 6684d210 97631181
	prefetch [%i2+0x120],16
!	%f8  = 837b45cd dc4ef9db, %f22 = 48647a44 474cecdb
	fmovd	%f8 ,%f22		! %f22 = 837b45cd dc4ef9db

p3_label_6:
!	%l6 = 00000000a2347a89, %l1 = 000000000000009f, %y  = 00000000
	udiv	%l6,%l1,%l2		! %l2 = 0000000001052905
!	Mem[0000000030000070] = 110b0488, %l5 = 52a6a8ffec01e703
	ldsba	[%o0+0x071]%asi,%l5	! %l5 = 000000000000000b
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,0
!	%l1 = 000000000000009f, Mem[000000003200001c] = cab2b442
	sth	%l1,[%o4+0x01c]		! Mem[000000003200001c] = 009fb442
!	Jump to jmpl_3, CWP = 0
	set	p3_jmpl_3_le,%g1
	jmpl	%g1,%g6

p3_label_7:
!	Mem[000000001c800138] = 499a788a, %l1 = 000000000000009f
	ldsw	[%i1+0x138],%l1		! %l1 = 00000000499a788a
!	Registers modified during the branch to p3_jmpl_3
!	%l1  = 0000000000000000
!	%l2  = ffffffffffffffff
!	%l6  = 0ca711ffc31aa5c0
!	%l6 = 0ca711ffc31aa5c0, immed = fffffff5, %l4 = 0000000000000070
	add	%l6,-0x00b,%l4		! %l4 = 0ca711ffc31aa5b5
	fblg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d0001d0] = 5407137436382c29, %l1 = 0000000000000000
	ldx	[%i2+0x1d0],%l1		! Annulled
p3_b4:
	membar	#Sync			! Added by membar checker (546)
!	Branch On Register, %l5 = 000000000000000b
	brlez,pt %l5,p3_not_taken_0	! Branch Not Taken

p3_label_8:
!	Mem[000000001d000040] = 0bc73431 cfa46e45 7da6c24f 58b7fc2e
	prefetch [%i2+0x040],3
p3_b5:
	membar	#Sync			! Added by membar checker (547)
	set	p3_b6,%o7
	fba,pn	%fcc2,p3_near_0_he	! Branch Taken, %fcc2 = 0
!	%l2 = ffffffffffffffff, Mem[000000001c800008] = 8f29480f
	stwa	%l2,[%i1+%o6]0x80	! Mem[000000001c800008] = ffffffff
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x006,%g2
p3_b6:
!	Registers modified during the branch to p3_near_0
!	%l0  = 0000000000000000
!	%l2  = 0000000000000000
!	%l3  = 0ca711ffc31aadc3
!	%l4  = c31a9b661712c740
!	%l5  = 0000000000000000
!	%l7  = 0000000000000000
	ba	p3_b7			! Branch Taken, %ccr = 08, CWP = 0
!	Mem[0000000032000000] = a19e01fc 8c995a0d e83b01bf 5e0357b7
	prefetch [%o4+0x000],16
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x007,%g2
p3_b7:

p3_label_9:
	membar	#Sync			! Added by membar checker (548)
	set	p3_b8,%o7
	fble,pt	%fcc2,p3_near_1_he	! Branch Taken, %fcc2 = 0
!	Mem[000000001c000000] = 89925175, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000089
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x008,%g2
p3_b8:
!	Registers modified during the branch to p3_near_1
!	%l0  = 0000000000000000
!	%l3  = 018e77b2d32d35f4
!	%l5  = fffffffffffff495
!	%l6  = 0000000000000359
	fbug,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	%l6 = 0000000000000359, Mem[000000001c800070] = c6eb2b8c
	stw	%l6,[%i1+0x070]		! Annulled
p3_b9:
	set	p3_b10,%o7
	fbge,a	p3_far_3_le	! Branch Taken, %fcc0 = 0

p3_label_10:
!	Mem[000000003100007c] = ac7e6aa8, %l7 = 0000000000000000
	lduh	[%o2+0x07e],%l7		! %l7 = 0000000000006aa8
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x00a,%g2
p3_b10:
!	Registers modified during the branch to p3_far_3
!	%l1  = c31a9b661712c895
	membar	#Sync			! Added by membar checker (549)
!	Mem[000000001d000000] = 00000000 00006aa8, %l3 = 018e77b2d32d35f4, %l7 = 0000000000006aa8
	casxa	[%i2]0x80,%l3,%l7	! %l7 = c19f56ad697d08d3
!	Mem[0000000031000034] = 47d7eace, %l6 = 0000000000000359
	ldsb	[%o2+0x034],%l6		! %l6 = 0000000000000047
!	Mem[0000000030000030] = f3b5cf0c, %l1 = c31a9b661712c895
	swapa	[%o0+0x030]%asi,%l1	! %l1 = 00000000f3b5cf0c
	set	p3_b11,%o7
	fbe,a	p3_far_3_le	! Branch Taken, %fcc0 = 0

p3_label_11:
!	%l4 = 1712c740, %l5 = fffff495, Mem[000000001d000008] = 1e87cd03 a9e3793b
	stda	%l4,[%i2+%o6]0x80	! Mem[000000001d000008] = 1712c740 fffff495
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x00b,%g2
p3_b11:
!	Registers modified during the branch to p3_far_3
!	%l1  = c31a9b661712c895
	ba	p3_b12			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[000000001d000008] = 1712c740, %l5 = fffffffffffff495
	lduha	[%i2+%o6]0x80,%l5	! %l5 = 0000000000001712
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x00c,%g2
p3_b12:
	membar	#Sync			! Added by membar checker (550)
!	%l1 = c31a9b661712c895, immed = fffff236, %y  = 00000000
	mulx	%l1,-0xdca,%l6		! %l6 = b31d3245d6fe296e
!	%l1 = c31a9b661712c895, %l4 = c31a9b661712c740, %l4 = c31a9b661712c740
	xor	%l1,%l4,%l4		! %l4 = 0000000000000fd5

p3_label_12:
!	%l1 = c31a9b661712c895, %l1 = c31a9b661712c895, %y  = 00000000
	smulcc	%l1,%l1,%l7		! %l7 = 0214616b981d26b9, %ccr = 08
!	%l4 = 0000000000000fd5, %l4 = 0000000000000fd5, %l6 = b31d3245d6fe296e
	andcc	%l4,%l4,%l6		! %l6 = 0000000000000fd5, %ccr = 00
!	Mem[000000001c000000] = 89925175, %l5 = 0000000000001712
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 0000000089925175
!	Mem[000000001d000000] = c19f56ad, %l2 = 0000000000000089
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000c1
	set	p3_b13,%o7
	fbuge,a	p3_far_0_le	! Branch Taken, %fcc0 = 0

p3_label_13:
!	Mem[000000001d800000] = d4eae157, %l2 = 00000000000000c1
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffd4
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x00d,%g2
p3_b13:
!	Registers modified during the branch to p3_far_0
!	%l2  = ffffffff766dafdf
!	%l4  = 960be272ac7e6aa8
	membar	#Sync			! Added by membar checker (551)
!	Mem[0000000030000038] = 25c10737, %l0 = 0000000000000000
	lduw	[%o0+0x038],%l0		! %l0 = 0000000025c10737
!	%l1 = c31a9b661712c895
	sethi	%hi(0xd867e400),%l1	! %l1 = 00000000d867e400
!	%l3 = 018e77b2d32d35f4, %l6 = 0000000000000fd5, %y  = 0214616b
	udivcc	%l3,%l6,%l5		! %l5 = 00000000ffffffff, %ccr = 0a
!	%l1 = 00000000d867e400, Mem[000000001d800008] = 9f54be6b
	stha	%l1,[%i3+%o6]0x80	! Mem[000000001d800008] = e400be6b

p3_label_14:
!	%l5 = 00000000ffffffff, Mem[0000000030800074] = df99dc3c
	stw	%l5,[%o1+0x074]		! Mem[0000000030800074] = ffffffff
!	Mem[0000000030000074] = 5e3fbbdb, %l5 = 00000000ffffffff
	ldswa	[%o0+0x074]%asi,%l5	! %l5 = 000000005e3fbbdb
!	call to call_1, CWP = 0
	call	p3_call_1_he
!	Mem[000000001d000040] = 0bc73431 cfa46e45 7da6c24f 58b7fc2e
	prefetch [%i2+0x040],23
!	Registers modified during the branch to p3_call_1
!	%l1  = 960be272ac7e6800
!	%l3  = 0000000002146181
!	%l7  = 0000000025c1170c
!	Mem[000000001c800120] = 42b6c316 d443d222 263b24e2 fdd9f7e0
	prefetch [%i1+0x120],2

p3_label_15:
!	%l1 = 960be272ac7e6800, immed = 0000008b, %l4 = 960be272ac7e6aa8
	xnorcc	%l1,0x08b,%l4		! %l4 = 69f41d8d53819774, %ccr = 00
	fbn,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 0
!	Mem[0000000030800078] = 50d429cc, %l4 = 69f41d8d53819774
	swap	[%o1+0x078],%l4		! Annulled
p3_b14:
	membar	#Sync			! Added by membar checker (552)
!	%l4 = 69f41d8d53819774, %l3 = 0000000002146181, %y  = 0214616b
	sdiv	%l4,%l3,%l6		! %l6 = 000000007fffffff
!	%l5 = 000000005e3fbbdb
	setx	0xcd6f06dccd6f06dc,%g7,%l5 ! %l5 = cd6f06dccd6f06dc

p3_label_16:
	fbu,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[000000001c800060] = 72e764b1 e2f6bf7e dee2bc02 4c68407d
	prefetch [%i1+0x060],0	! Annulled
p3_b15:
	membar	#Sync			! Added by membar checker (553)
!	%f2  = 8492c11c 45aff05d, %f12 = 9eac6238 c5652672
	fcmpd	%fcc2,%f2 ,%f12		! %fcc2 = 2
!	%l7 = 0000000025c1170c, %l1 = 960be272ac7e6800, %y  = 0214616b
	udiv	%l7,%l1,%l4		! %l4 = 0000000003161cb2
!	%l2 = ffffffff766dafdf, %l2 = ffffffff766dafdf, %l2 = ffffffff766dafdf
	addcc	%l2,%l2,%l2		! %l2 = fffffffeecdb5fbe, %ccr = 9a

p3_label_17:
!	%f20 = 8482c11c 45aff05d, %f20 = 8482c11c 45aff05d, %f16 = 1645f46d 4a4963ed
	faddd	%f20,%f20,%f16		! %f16 = 8492c11c 45aff05d
!	Mem[000000001d000190] = 1645f46d 4a4963ed, %l0 = 0000000025c10737, %l0 = 0000000025c10737
	add	%i2,0x190,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 04a4368a60093fe1
!	%f3  = 45aff05d, %f5  = d004dc94, %f12 = 9eac6238 c5652672
	fsmuld	%f3 ,%f5 ,%f12		! %f12 = c2c6d3e2 0eb87100
!	Mem[000000001e800040] = b3110cb3, %l0 = 04a4368a60093fe1
	ldsw	[%i5+0x040],%l0		! %l0 = ffffffffb3110cb3
	fbg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_18:
!	Mem[000000003200001c] = 009fb442, %l4 = 0000000003161cb2
	ldsw	[%o4+0x01c],%g2		! %g2 = 0000000003161cb2
p3_b16:
	membar	#Sync			! Added by membar checker (554)
!	%l6 = 000000007fffffff, immed = fffff650, %l1 = 960be272ac7e6800
	xorcc	%l6,-0x9b0,%l1		! %l1 = ffffffff800009af, %ccr = 88
!	%l0 = ffffffffb3110cb3, immed = 0000001c, %l4 = 0000000003161cb2
	srax	%l0,0x01c,%l4		! %l4 = fffffffffffffffb
	set	p3_b17,%o7
	fbe	p3_far_2_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001d800100] = d78793eaced6e202, %l5 = cd6f06dccd6f06dc
	ldx	[%i3+0x100],%l5		! %l5 = d78793eaced6e202
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x011,%g2
p3_b17:

p3_label_19:
	membar	#Sync			! Added by membar checker (555)
	set	p3_b18,%o7
	fba,a,pn %fcc0,p3_near_2_le	! Branch Taken, %fcc0 = 0
!	%l3 = 0000000002146181, Mem[000000001c000000] = 000017129d70574a
	stxa	%l3,[%i0+%g0]0x80	! Annulled
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x012,%g2
p3_b18:
!	Registers modified during the branch to p3_near_2
!	%l6  = 00000000000009af
	membar	#Sync			! Added by membar checker (556)
!	Mem[0000000030000078] = c2914f14, %l7 = 0000000025c1170c
	swap	[%o0+0x078],%l7		! %l7 = 00000000c2914f14
!	%l5 = d78793eaced6e202, immed = fffff571, %y  = 0214616b
	umul	%l5,-0xa8f,%l7		! %l7 = ced6d97a1123ace2
	set	p3_b19,%o7
	fbe,a	p3_far_1_le	! Branch Taken, %fcc0 = 0

p3_label_20:
!	Mem[000000001d000008] = 1712c740, %l1 = ffffffff800009af
	lduwa	[%i2+%o6]0x80,%l1	! %l1 = 000000001712c740
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x013,%g2
p3_b19:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = 000000019324a041
!	%l5  = 000000007fffffff
	membar	#Sync			! Added by membar checker (557)
!	%l4 = fffffffffffffffb, Mem[000000001d8001d0] = b82c50dabd2aed58
	stxa	%l4,[%i3+0x1d0]%asi	! Mem[000000001d8001d0] = fffffffffffffffb
!	Branch On Register, %l4 = fffffffffffffffb
	brnz,a,pt %l4,p3_b20		! Branch Taken
!	Mem[0000000032000064] = 296a5f40, %l2 = fffffffeecdb5fbe
	ldsb	[%o4+0x067],%g2		! %g2 = 0000000000000029
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x014,%g2
p3_b20:
	membar	#Sync			! Added by membar checker (558)
!	%l2 = fffffffeecdb5fbe, immed = fffff652, %y  = 000004d7
	sdivcc	%l2,-0x9ae,%l6		! %l6 = ffffffff80000000, %ccr = 8a

p3_label_21:
!	Mem[0000000030000078] = 25c1170c, %l7 = 1123ace2, %l5 = 7fffffff
	add	%o0,0x78,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 0000000025c1170c
!	call to call_3, CWP = 0
	call	p3_call_3_he
!	Mem[000000001c800008] = ffffffff, %l4 = fffffffffffffffb
	lduwa	[%i1+%o6]0x80,%l4	! %l4 = 00000000ffffffff
!	%l3 = 0000000002146181, Mem[000000001c000000] = 00001712
	stwa	%l3,[%i0+%g0]0x80	! Mem[000000001c000000] = 02146181
!	%f28 = 29977c25 ee1c8376, %f28 = 29977c25 ee1c8376, %f2  = 8492c11c 45aff05d
	faddd	%f28,%f28,%f2 		! %f2  = 29a77c25 ee1c8376

p3_label_22:
!	%l2 = fffffffeecdb5fbe, %l5 = 0000000025c1170c, %l6 = ffffffff80000000
	xnorcc	%l2,%l5,%l6		! %l6 = 0000000136e5b74d, %ccr = 00
!	Branch On Register, %l3 = 0000000002146181
	brz,pt	%l3,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d0000b8] = 46d9099e, %l6 = 0000000136e5b74d
	lduh	[%i2+0x0b8],%l6		! %l6 = 00000000000046d9
p3_b21:
	membar	#Sync			! Added by membar checker (559)
!	Mem[000000001c000008] = c37e33b5, %l3 = 0000000002146181
	lduba	[%i0+%o6]0x80,%l3	! %l3 = 00000000000000c3
!	Mem[000000001f000100] = 23093300 f9477b09 adee7181 814cfca7
	prefetch [%i6+0x100],4

p3_label_23:
	fbe,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001d000140] = 6aba4242 109841a1 99131a40 309580d3
	prefetch [%i2+0x140],0	! Annulled
p3_b22:
	membar	#Sync			! Added by membar checker (560)
	fbl,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l4 = ffffffff, %l5 = 25c1170c, Mem[000000001c800008] = ffffffff 5ad1afca
	stda	%l4,[%i1+%o6]0x80	! Annulled
p3_b23:
	membar	#Sync			! Added by membar checker (561)
!	Mem[000000001d8000c0] = 548c7792 b68bf45b 63356cd7 81192341
	prefetcha [%i3+0x0c0]%asi,1

p3_label_24:
!	%l0 = 0000000000007fb1, Mem[000000001d000055] = ca04be11
	stb	%l0,[%i2+0x055]		! Mem[000000001d000054] = cab1be11
!	Mem[0000000031800074] = 155ad737, %l7 = ced6d97a1123ace2
	swapa	[%o3+0x074]%asi,%l7	! %l7 = 00000000155ad737
!	%l5 = 0000000025c1170c, %l3 = 00000000000000c3, %l4 = 00000000ffffffff
	taddcc	%l5,%l3,%l4		! %l4 = 0000000025c117cf, %ccr = 02
	set	p3_b24,%o7
	fbe	p3_far_1_le	! Branch Taken, %fcc0 = 0
!	%l1 = 000000019324a041, Mem[000000001c000000] = 02146181
	stba	%l1,[%i0+%g0]0x80	! Mem[000000001c000000] = 41146181
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x018,%g2
p3_b24:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = 000000009324a042
!	%l5  = ffffffff80000000

p3_label_25:
	membar	#Sync			! Added by membar checker (562)
!	%l7 = 00000000155ad737, %l0 = 0000000000007fb1, %l0 = 0000000000007fb1
	addc	%l7,%l0,%l0		! %l0 = 00000000155b56e9
	ba	p3_b25			! Branch Taken, %ccr = 09, CWP = 0
!	Mem[000000001c800148] = 6dec1026, %l6 = 00000000000046d9
	lduh	[%i1+0x148],%l6		! %l6 = 0000000000006dec
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x019,%g2
p3_b25:
	membar	#Sync			! Added by membar checker (563)
!	%f14 = fc93335f f1f8acd1, %f14 = fc93335f f1f8acd1, %f16 = 8492c11c 45aff05d
	fdivd	%f14,%f14,%f16		! %f16 = 3ff00000 00000000
!	%l5 = ffffffff80000000, immed = 00000fd2, %y  = ffffdc93
	smul	%l5,0xfd2,%l2		! %l2 = fffff81700000000

p3_label_26:
!	%l7 = 00000000155ad737
	sethi	%hi(0x3b495c00),%l7	! %l7 = 000000003b495c00
!	%l2 = fffff81700000000, %l1 = 000000009324a042, %l4 = 0000000025c117cf
	andn	%l2,%l1,%l4		! %l4 = fffff81700000000
	set	p3_b26,%o7
	fbue,a	p3_far_3_le	! Branch Taken, %fcc0 = 0
!	%l6 = 00006dec, %l7 = 3b495c00, Mem[000000001c800158] = 6999483a 877acd25
	std	%l6,[%i1+0x158]	! Mem[000000001c800158] = 00006dec 3b495c00
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x01a,%g2
p3_b26:
!	Registers modified during the branch to p3_far_3
!	%l1  = fffff81700000155
	membar	#Sync			! Added by membar checker (564)
!	%l3 = 00000000000000c3, %l6 = 0000000000006dec, %y  = fffff817
	sdivx	%l3,%l6,%l0		! %l0 = 0000000000000000

p3_label_27:
	set	p3_b27,%o7
	fba,a	p3_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d8001e0] = 07e7afa1 ca7034e8 37913a1c 0cd8721f
	prefetch [%i3+0x1e0],20	! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x01b,%g2
p3_b27:
!	Registers modified during the branch to p3_far_2
!	%l5  = 0000000000000000
!	%l7  = 000000001712c895
	membar	#Sync			! Added by membar checker (565)
!	%f1  = 5a9c6e6a, %f17 = 00000000, %f26 = 44a8b7f2
	fmuls	%f1 ,%f17,%f26		! %f26 = 00000000
!	%l6 = 00006dec, %l7 = 1712c895, Mem[000000001c800178] = 946170c4 2c97d503
	std	%l6,[%i1+0x178]	! Mem[000000001c800178] = 00006dec 1712c895
	set	p3_b28,%o7
	fbge,a,pn %fcc0,p3_near_1_he	! Branch Taken, %fcc0 = 0

p3_label_28:
!	Mem[000000001f000008] = 56fafcd18b9d150b, %l7 = 000000001712c895
	ldxa	[%i6+%o6]0x80,%l7	! %l7 = 56fafcd18b9d150b
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x01c,%g2
p3_b28:
!	Registers modified during the branch to p3_near_1
!	%l0  = 0000000000000101
!	%l3  = 018e77b2d32d35f4
!	%l5  = 56fafcd18b9d09a0
!	%l6  = 000000000000045a
	membar	#Sync			! Added by membar checker (566)
!	Branch On Register, %l7 = 56fafcd18b9d150b
	brlez,pn %l7,p3_not_taken_0	! Branch Not Taken
!	%l4 = fffff81700000000, Mem[000000001d8000aa] = 7099ae95
	sth	%l4,[%i3+0x0aa]		! Mem[000000001d8000a8] = 70990000
p3_b29:
	membar	#Sync			! Added by membar checker (567)
!	Mem[000000001c000020] = d5ce3bb4 a8e850d5 6c31e6ce a7c2c635
	prefetcha [%i0+0x020]%asi,22
!	Mem[000000001d000180] = 7c4b5bf6 835f34dc 20098839 bdcdfdca
	prefetcha [%i2+0x180]%asi,1

p3_label_29:
!	%l5 = 56fafcd18b9d09a0, immed = 000007b4, %l5 = 56fafcd18b9d09a0
	subc	%l5,0x7b4,%l5		! %l5 = 56fafcd18b9d01ec
!	Jump to jmpl_1, CWP = 0
	set	p3_jmpl_1_he,%g1
	jmpl	%g1,%g6
!	Mem[000000001c800000] = 647dd5e4, %l2 = fffff81700000000
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000064
!	Registers modified during the branch to p3_jmpl_1
!	%l1  = fffffffffffff339
!	%l5  = 0000000000000000
!	%l0 = 0000000000000101, immed = 00000b2d, %y  = fffff817
	smulcc	%l0,0xb2d,%l0		! %l0 = 00000000000b382d, %ccr = 00
!	%l2 = 0000000000000064, %l6 = 000000000000045a, %l4 = fffff81700000000
	sub	%l2,%l6,%l4		! %l4 = fffffffffffffc0a

p3_label_30:
!	%l5 = 0000000000000000, immed = 0000007d, %l7 = 56fafcd18b9d150b
	add	%l5,0x07d,%l7		! %l7 = 000000000000007d
!	%l7 = 000000000000007d, %l5 = 0000000000000000, %y  = 00000000
	umul	%l7,%l5,%l0		! %l0 = 0000000000000000
!	Mem[000000001d800108] = c7e14860, %l6 = 000000000000045a
	ldsba	[%i3+0x10b]%asi,%l6	! %l6 = 0000000000000060
	ba,a	p3_b30			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000031000030] = e072451c47d7eace, %l6 = 0000000000000060
	ldx	[%o2+0x030],%l6		! Annulled
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x01e,%g2
p3_b30:

p3_label_31:
	membar	#Sync			! Added by membar checker (568)
!	%l6 = 0000000000000060, %l4 = fffffffffffffc0a, %l3 = 018e77b2d32d35f4
	sra	%l6,%l4,%l3		! %l3 = 0000000000000000
	fbu,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[000000001d0000c4] = 6906afb2, %l4 = fffffffffffffc0a
	ldsb	[%i2+0x0c7],%l4		! %l4 = ffffffffffffffb2
p3_b31:
	membar	#Sync			! Added by membar checker (569)
!	%f2  = 29a77c25, %f26 = 00000000, %f26 = 00000000
	fmuls	%f2 ,%f26,%f26		! %f26 = 00000000
	set	p3_b32,%o7
	fbule	p3_far_2_le	! Branch Taken, %fcc0 = 0

p3_label_32:
!	Mem[000000001d000008] = 1712c740, %l7 = 000000000000007d
	ldswa	[%i2+%o6]0x80,%l7	! %l7 = 000000001712c740
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x020,%g2
p3_b32:
	membar	#Sync			! Added by membar checker (570)
!	%l6 = 00000060, %l7 = 1712c740, Mem[000000001d8001f8] = 1b1f80a9 57a53d96
	std	%l6,[%i3+0x1f8]	! Mem[000000001d8001f8] = 00000060 1712c740
	set	p3_b33,%o7
	fbule,a	p3_far_0_he	! Branch Taken, %fcc0 = 0
!	%l0 = 0000000000000000, Mem[000000001d000084] = d417d4c0
	stb	%l0,[%i2+0x084]		! Mem[000000001d000084] = 0017d4c0
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x021,%g2
p3_b33:
!	Registers modified during the branch to p3_far_0
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l4  = 0000000000000064
	membar	#Sync			! Added by membar checker (571)
!	Mem[000000001c000118] = 00000000 00000001, %l5 = 0000000000000000, %l7 = 000000001712c740
	add	%i0,0x118,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 7ab47e4778171fe6

p3_label_33:
!	%l6 = 0000000000000060, %l5 = 0000000000000000, %l1 = 0000000000000000
	srax	%l6,%l5,%l1		! %l1 = 0000000000000060
!	%l0 = 0000000000000000, %l7 = 7ab47e4778171fe6, %y  = 00000000
	udiv	%l0,%l7,%l7		! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[000000001c000000] = 41146181
	stba	%l7,[%i0+%g0]0x80	! Mem[000000001c000000] = 00146181
!	%l2 = 0000000000000064, Mem[0000000030000038] = 25c10737514084bb
	stx	%l2,[%o0+0x038]		! Mem[0000000030000038] = 0000000000000064
!	Mem[000000003180003c] = f430e0e7, %l1 = 0000000000000060
	ldstub	[%o3+0x03c],%l1		! %l1 = 00000000000000f4

p3_label_34:
	set	p3_b34,%o7
	fble	p3_far_3_le	! Branch Taken, %fcc0 = 0
!	%l3 = 0000000000000000, Mem[000000001c800008] = ffffffff
	stba	%l3,[%i1+%o6]0x80	! Mem[000000001c800008] = 00ffffff
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x022,%g2
p3_b34:
!	Registers modified during the branch to p3_far_3
!	%l1  = 00000000000001b9
	membar	#Sync			! Added by membar checker (572)
!	%l1 = 00000000000001b9, Mem[0000000031800038] = 52bc9990
	stw	%l1,[%o3+0x038]		! Mem[0000000031800038] = 000001b9
	set	p3_b35,%o7
	fbe,a	p3_far_2_he	! Branch Taken, %fcc0 = 0
!	Mem[000000001d000008] = 1712c740, %l3 = 0000000000000000
	ldsha	[%i2+%o6]0x80,%l3	! %l3 = 0000000000001712
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x023,%g2
p3_b35:
!	Registers modified during the branch to p3_far_2
!	%l5  = 0000000000000000
!	%l7  = 000000001712c895

p3_label_35:
	membar	#Sync			! Added by membar checker (573)
!	Mem[000000001d000158] = cf4fceea, %l1 = 00000000000001b9
	ldsb	[%i2+0x15a],%l1		! %l1 = ffffffffffffffce
	fbge,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000030800078] = 50d429cc, %l5 = 0000000000000000
	lduh	[%o1+0x07a],%l5		! %l5 = 00000000000029cc
p3_b36:
	membar	#Sync			! Added by membar checker (574)
!	Mem[000000003000003c] = 00000064, %l1 = ffffffffffffffce
	lduha	[%o0+0x03e]%asi,%l1	! %l1 = 0000000000000064
!	Mem[0000000032000060] = be38db17 ddc48f29 6a5f407e 79d4a921
	prefetcha [%o4+0x060]%asi,16

p3_label_36:
!	Mem[0000000030000074] = 5e3fbbdb, %l5 = 00000000000029cc
	ldsh	[%o0+0x076],%l5		! %l5 = ffffffffffffbbdb
!	%f18 = 162de21c 77df3fe0, %f16 = 3ff00000 00000000, %f24 = 99e70288 bb5042cc
	fdivd	%f18,%f16,%f24		! %f24 = 162de21c 77df3fe0
	set	p3_b37,%o7
	fbuge,pt %fcc1,p3_near_0_le	! Branch Taken, %fcc1 = 2
!	%l5 = ffffffffffffbbdb, Mem[000000001f000000] = f4e1665c
	stha	%l5,[%i6+%g0]0x80	! Mem[000000001f000000] = bbdb665c
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x025,%g2
p3_b37:
!	Registers modified during the branch to p3_near_0
!	%l3  = 0000000000001776
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (575)
!	Mem[0000000031000070] = d5bb165c 74ffd6c2, %l2 = 00000064, %l3 = 00001776
	ldd	[%o2+0x070],%l2		! %l2 = 00000000d5bb165c 0000000074ffd6c2

p3_label_37:
!	%l0 = 0000000000000000, %l2 = 00000000d5bb165c, %l6 = 0000000000000060
	orcc	%l0,%l2,%l6		! %l6 = 00000000d5bb165c, %ccr = 08
	set	p3_b38,%o7
	fbo,a,pn %fcc2,p3_near_2_he	! Branch Taken, %fcc2 = 2
!	Mem[000000001c800128] = 263b24e2, %l3 = 0000000074ffd6c2
	ldsw	[%i1+0x128],%l3		! %l3 = 00000000263b24e2
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x026,%g2
p3_b38:
!	Registers modified during the branch to p3_near_2
!	%l1  = 0000000000000000
!	%l5  = 0000000000001c0b
!	%l6  = ffffffff2a44e9a3
	membar	#Sync			! Added by membar checker (576)
	set	p3_b39,%o7
	fblg,pn	%fcc1,p3_near_2_he	! Branch Taken, %fcc1 = 2
!	Mem[000000001d800060] = 0893fd65 2bb95de2 24c98188 aba2bfd5
	prefetch [%i3+0x060],16
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x027,%g2
p3_b39:
!	Registers modified during the branch to p3_near_2
!	%l1  = 0000000000000000
!	%l5  = 0000000000001c0b
!	%l6  = ffffffff2a44e9a3

p3_label_38:
	membar	#Sync			! Added by membar checker (577)
!	%l4 = 0000000000000064, %l6 = ffffffff2a44e9a3, %l6 = ffffffff2a44e9a3
	add	%l4,%l6,%l6		! %l6 = ffffffff2a44ea07
!	%l2 = 00000000d5bb165c, immed = 00000373, %l5 = 0000000000001c0b
	sub	%l2,0x373,%l5		! %l5 = 00000000d5bb12e9
	set	p3_b40,%o7
	fbug,pn	%fcc1,p3_near_2_he	! Branch Taken, %fcc1 = 2
!	%l3 = 00000000263b24e2, Mem[000000003000007c] = 78f433a5
	stw	%l3,[%o0+0x07c]		! Mem[000000003000007c] = 263b24e2
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x028,%g2
p3_b40:
!	Registers modified during the branch to p3_near_2
!	%l1  = 0000000000000000
!	%l5  = 0000000000001c0b
!	%l6  = ffffffff2a44e9a3
	bl,a	p3_b41			! Branch Taken, %ccr = 08, CWP = 0

p3_label_39:
!	%l0 = 00000000, %l1 = 00000000, Mem[000000001d000000] = c19f56ad 697d08d3
	stda	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = 00000000 00000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x029,%g2
p3_b41:
	membar	#Sync			! Added by membar checker (578)
!	Mem[000000001c000008] = c37e33b5, %l7 = 000000001712c895
	lduwa	[%i0+%o6]0x80,%l7	! %l7 = 00000000c37e33b5
!	Mem[000000001c000080] = 92456920 c460058d 8fc46e9e 0dd8d8d1
	prefetcha [%i0+0x080]%asi,22
!	Mem[0000000031000038] = 00641a8e, %l5 = 0000000000001c0b
	swapa	[%o2+0x038]%asi,%l5	! %l5 = 0000000000641a8e
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_40:
!	%l4 = 0000000000000064, Mem[000000001d000000] = 00000000
	stwa	%l4,[%i2+%g0]0x80	! Annulled
p3_b42:
	membar	#Sync			! Added by membar checker (579)
!	Branch On Register, %l4 = 0000000000000064
	brgz,a,pn %l4,p3_b43		! Branch Taken
!	Mem[0000000031800070] = bfc0f5bd, %l2 = 00000000d5bb165c
	ldsw	[%o3+0x070],%l2		! %l2 = ffffffffbfc0f5bd
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x02b,%g2
p3_b43:
	membar	#Sync			! Added by membar checker (580)
!	Mem[0000000032000040] = ba91c68a c2a2c541 60739feb c1c67d6b
	prefetch [%o4+0x040],21
	set	p3_b44,%o7
	fble,a	p3_far_2_le	! Branch Taken, %fcc0 = 0

p3_label_41:
!	Mem[000000001d000008] = 1712c740, %l2 = ffffffffbfc0f5bd
	lduba	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000017
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x02c,%g2
p3_b44:
	membar	#Sync			! Added by membar checker (581)
!	%l7 = 00000000c37e33b5, %l2 = 0000000000000017, %l6 = ffffffff2a44e9a3
	addc	%l7,%l2,%l6		! %l6 = 00000000c37e33cc
!	%l2 = 0000000000000017, immed = 00000024, %l1 = 0000000000000000
	srax	%l2,0x024,%l1		! %l1 = 0000000000000000
!	Mem[000000004000003e] = 1e0f0f08, %l5 = 0000000000641a8e
	ldstuba	[%o5+0x03e]%asi,%l5	! %l5 = 000000000000000f
!	%l6 = 00000000c37e33cc, %l6 = 00000000c37e33cc, %y  = 00000000
	udiv	%l6,%l6,%l0		! %l0 = 0000000000000001

p3_label_42:
	fbul,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c0000e0] = 88945364 eef05518 751f845f 12005ca3
	prefetch [%i0+0x0e0],22
p3_b45:
	membar	#Sync			! Added by membar checker (582)
!	Mem[000000001d800008] = e400be6b, %l7 = 00000000c37e33b5
	lduba	[%i3+%o6]0x80,%l7	! %l7 = 00000000000000e4
!	Mem[000000001e800154] = 1970b083, %l3 = 00000000263b24e2
	ldsw	[%i5+0x154],%l3		! %l3 = 000000001970b083
!	Mem[000000001d000000] = 00000000, %l6 = 00000000c37e33cc
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000

p3_label_43:
!	%f16 = 3ff00000 00000000, %f8  = 837b45cd
	fdtoi	%f16,%f8 		! %f8  = 00000001
!	%l3 = 000000001970b083, immed = 0000002d, %l3 = 000000001970b083
	sllx	%l3,0x02d,%l3		! %l3 = 1610600000000000
!	%l3 = 1610600000000000, Mem[000000001d800178] = 9d0b0c3353ba65d9
	stx	%l3,[%i3+0x178]		! Mem[000000001d800178] = 1610600000000000
!	%l7 = 00000000000000e4, immed = 00000037, %l4 = 0000000000000064
	srlx	%l7,0x037,%l4		! %l4 = 0000000000000000
!	%f13 = 0eb87100, %f17 = 00000000, %f17 = 00000000
	fadds	%f13,%f17,%f17		! %f17 = 0eb87100

p3_label_44:
!	%l1 = 0000000000000000, %l4 = 0000000000000000, %l0 = 0000000000000001
	srax	%l1,%l4,%l0		! %l0 = 0000000000000000
!	%l3 = 1610600000000000, immed = fffffcc3, %l3 = 1610600000000000
	taddcc	%l3,-0x33d,%l3		! %l3 = 16105ffffffffcc3, %ccr = 1a
!	Mem[000000001d000178] = 8d714bca, %l5 = 000000000000000f
	ldsw	[%i2+0x178],%l5		! %l5 = ffffffff8d714bca
!	%l6 = 0000000000000000, immed = fffff256, %y  = 00000000
	sdiv	%l6,-0xdaa,%l3		! %l3 = 0000000000000000
!	%l1 = 0000000000000000, immed = 0000000d, %l3 = 0000000000000000
	sllx	%l1,0x00d,%l3		! %l3 = 0000000000000000

p3_label_45:
!	%l0 = 0000000000000000, Mem[000000001d800008] = e400be6b
	stba	%l0,[%i3+%o6]0x80	! Mem[000000001d800008] = 0000be6b
	set	p3_b46,%o7
	fba,a	p3_far_0_he	! Branch Taken, %fcc0 = 0
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],4	! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x02e,%g2
p3_b46:
!	Registers modified during the branch to p3_far_0
!	%l1  = 0000000000000000
!	%l3  = 0000000000000000
!	%l4  = 0000000000000017
	membar	#Sync			! Added by membar checker (583)
!	Branch On Register, %l2 = 0000000000000017
	brlz,a,pt %l2,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d0000a0] = 58d48484 9dcd222c 14093715 7640ea3c
	prefetch [%i2+0x0a0],23	! Annulled
p3_b47:

p3_label_46:
	membar	#Sync			! Added by membar checker (584)
	set	p3_b48,%o7
	fba,a,pt %fcc0,p3_near_0_le	! Branch Taken, %fcc0 = 0
!	%l6 = 0000000000000000, Mem[0000000031000079] = 960be272
	stb	%l6,[%o2+0x079]		! Annulled
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x030,%g2
p3_b48:
!	Registers modified during the branch to p3_near_0
!	%l3  = 0000000000000017
!	%l5  = 0000000000000000
	membar	#Sync			! Added by membar checker (585)
!	%l6 = 0000000000000000, immed = 0000007e, %y  = 00000000
	sdiv	%l6,0x07e,%l3		! %l3 = 0000000000000000
!	%f2  = 29a77c25, %f26 = 00000000, %f27 = da38583a
	fmuls	%f2 ,%f26,%f27		! %f27 = 00000000
!	%l1 = 0000000000000000, immed = fffff297, %y  = 00000000
	umulcc	%l1,-0xd69,%l4		! %l4 = 0000000000000000, %ccr = 44

p3_label_47:
	bge,a	p3_b49			! Branch Taken, %ccr = 44, CWP = 0
!	%l2 = 0000000000000017, Mem[000000001d000010] = ace63958
	sth	%l2,[%i2+0x010]		! Mem[000000001d000010] = 00173958
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x031,%g2
p3_b49:
	membar	#Sync			! Added by membar checker (586)
!	Mem[000000001f0001ec] = 21df0551, %l4 = 0000000000000000
	ldsb	[%i6+0x1ee],%l4		! %l4 = 0000000000000005
	set	p3_b50,%o7
	fbue,a	p3_far_3_le	! Branch Taken, %fcc0 = 0
!	Mem[000000001c800070] = c6eb2b8c6e055d57, %l1 = 0000000000000000
	ldx	[%i1+0x070],%l1		! %l1 = c6eb2b8c6e055d57
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x032,%g2
p3_b50:
!	Registers modified during the branch to p3_far_3
!	%l1  = 000000000000015a

p3_label_48:
	membar	#Sync			! Added by membar checker (587)
!	%l0 = 00000000, %l1 = 0000015a, Mem[0000000032000000] = a19e01fc 8c995a0d
	stda	%l0,[%o4+0x000]%asi	! Mem[0000000032000000] = 00000000 0000015a
!	Mem[000000001c000140] = e23c050b 384e8ca6 085f080a 88ad8fce
	prefetcha [%i0+0x140]%asi,4
!	%l0 = 0000000000000000, Mem[000000001c000000] = 00146181
	stwa	%l0,[%i0+%g0]0x80	! Mem[000000001c000000] = 00000000
!	%f12 = c2c6d3e2, %f5  = d004dc94
	fmovs	%f12,%f5 		! %f5  = c2c6d3e2
	fbul,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0

p3_label_49:
!	Mem[000000001d000008] = 1712c740, %l7 = 00000000000000e4
	swapa	[%i2+%o6]0x80,%l7	! Annulled
p3_b51:
	membar	#Sync			! Added by membar checker (588)
!	%l2 = 0000000000000017, %l4 = 0000000000000005, %l2 = 0000000000000017
	xorcc	%l2,%l4,%l2		! %l2 = 0000000000000012, %ccr = 00
!	%l6 = 0000000000000000, Mem[000000001d000008] = 1712c740
	stba	%l6,[%i2+%o6]0x80	! Mem[000000001d000008] = 0012c740
!	Mem[000000001c800160] = 7f66aa3f cb12c091 9e83f601 a8281992
	prefetch [%i1+0x160],22
!	%l6 = 0000000000000000, %l7 = 00000000000000e4, %l4 = 0000000000000005
	orncc	%l6,%l7,%l4		! %l4 = ffffffffffffff1b, %ccr = 88

p3_label_50:
!	%l6 = 0000000000000000, immed = 00000578, %y  = 00000000
	umulcc	%l6,0x578,%l6		! %l6 = 0000000000000000, %ccr = 44
!	%l3 = 0000000000000000, immed = fffff37f, %y  = 00000000
	udivcc	%l3,-0xc81,%l1		! %l1 = 0000000000000000, %ccr = 44
	fblg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c800008] = 00ffffff, %l5 = 0000000000000000
	lduwa	[%i1+%o6]0x80,%l5	! Annulled
p3_b52:
	membar	#Sync			! Added by membar checker (589)
!	%l3 = 0000000000000000, immed = 00000e34, %l7 = 00000000000000e4
	andncc	%l3,0xe34,%l7		! %l7 = 0000000000000000, %ccr = 44

p3_label_51:
	fbg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001c0000a0] = c9c4ab9a 75779cf6 0d015704 5c82b607
	prefetch [%i0+0x0a0],22
p3_b53:
	bvs	p3_not_taken_0		! Branch Not Taken, %ccr = 44
!	Mem[000000001d8000a8] = 70990000, %l7 = 0000000000000000
	lduh	[%i3+0x0a8],%l7		! %l7 = 0000000000007099
p3_b54:
	membar	#Sync			! Added by membar checker (590)
!	Mem[0000000030800030] = db610d77, %l0 = 0000000000000000
	ldub	[%o1+0x031],%l0		! %l0 = 0000000000000061

p3_label_52:
!	Mem[000000001d800000] = d4eae157, %l5 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 000000000000d4ea
	fbn,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	%l7 = 0000000000007099, Mem[000000001c800008] = 00ffffff5ad1afca
	stxa	%l7,[%i1+%o6]0x80	! Annulled
p3_b55:
	membar	#Sync			! Added by membar checker (591)
!	Branch On Register, %l7 = 0000000000007099
	brlez,a,pt %l7,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c000060] = 832cc409 12666149 082f8dee b9511342
	prefetch [%i0+0x060],16	! Annulled
p3_b56:

p3_label_53:
	membar	#Sync			! Added by membar checker (592)
!	%f12 = c2c6d3e2, %f22 = 837b45cd
	fnegs	%f12,%f22		! %f22 = 42c6d3e2
!	%l4 = ffffffffffffff1b, Mem[0000000031000072] = d5bb165c
	stha	%l4,[%o2+0x072]%asi	! Mem[0000000031000070] = d5bbff1b
	fbne	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 0
!	Mem[000000001d000008] = 0012c740, %l2 = 0000000000000012
	lduba	[%i2+%o6]0x80,%l2	! %l2 = 0000000000000000
p3_b57:
	membar	#Sync			! Added by membar checker (593)
!	%l6 = 0000000000000000, immed = fffff448, %l0 = 0000000000000061
	xorcc	%l6,-0xbb8,%l0		! %l0 = fffffffffffff448, %ccr = 88

p3_label_54:
!	Mem[000000001e800020] = fd5af3db cd74b994 653c680c 29a1edd6
	prefetch [%i5+0x020],23
!	%l1 = 0000000000000000, immed = 000005db, %y  = 00000000
	mulx	%l1,0x5db,%l7		! %l7 = 0000000000000000
!	%f18 = 162de21c 77df3fe0, %f26 = 00000000 00000000, %f2  = 29a77c25 ee1c8376
	fsubd	%f18,%f26,%f2 		! %f2  = 162de21c 77df3fe0
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d000000] = ff000000, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000ff
p3_b58:

p3_label_55:
	membar	#Sync			! Added by membar checker (594)
!	Mem[000000001e8000f8] = 1209fd1a, %l6 = 0000000000000000
	lduwa	[%i5+0x0f8]%asi,%l6	! %l6 = 000000001209fd1a
!	%l6 = 000000001209fd1a, Mem[0000000031800074] = 1123ace2
	stwa	%l6,[%o3+0x074]%asi	! Mem[0000000031800074] = 1209fd1a
!	Mem[000000001c8001a0] = 690f6bc8 d79ec369 2076a39c 18ce2d88
	prefetch [%i1+0x1a0],16
!	%l1 = 0000000000000000, %l2 = 00000000000000ff, %l4 = ffffffffffffff1b
	tsubcc	%l1,%l2,%l4		! %l4 = ffffffffffffff01, %ccr = 9b
	set	p3_b59,%o7
	fbe	p3_far_2_le	! Branch Taken, %fcc0 = 0

p3_label_56:
!	Mem[0000000031800030] = a2347a89 700d8f29, %l6 = 1209fd1a, %l7 = 00000000
	ldd	[%o3+0x030],%l6		! %l6 = 00000000a2347a89 00000000700d8f29
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x03b,%g2
p3_b59:
	membar	#Sync			! Added by membar checker (595)
!	%l6 = 00000000a2347a89, Mem[0000000032000053] = 8d2dda7a
	stba	%l6,[%o4+0x053]%asi	! Mem[0000000032000050] = 892dda7a
!	Mem[0000000032000000] = 00000000 0000015a e83b01bf 5e0357b7
	prefetcha [%o4+0x000]%asi,22
!	Mem[000000003080007c] = b67b6d01, %l1 = 0000000000000000
	ldstuba	[%o1+0x07c]%asi,%l1	! %l1 = 00000000000000b6
	bcs	p3_b60			! Branch Taken, %ccr = 9b, CWP = 0

p3_label_57:
!	Mem[000000001d800000] = d4eae157, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 00000000d4eae157
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x03c,%g2
p3_b60:
	membar	#Sync			! Added by membar checker (596)
!	Branch On Register, %l4 = ffffffffffffff01
	brz,a,pt %l4,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c000140] = e23c050b 384e8ca6 085f080a 88ad8fce
	prefetch [%i0+0x140],22	! Annulled
p3_b61:
	membar	#Sync			! Added by membar checker (597)
!	%l3 = 0000000000000000, immed = fffffe59, %y  = 00000000
	sdiv	%l3,-0x1a7,%l3		! %l3 = 0000000000000000
!	%l0 = fffffffffffff448
	sethi	%hi(0x689b3c00),%l0	! %l0 = 00000000689b3c00

p3_label_58:
!	Mem[000000001c800000] = 647dd5e4 bcf63250, %l0 = 689b3c00, %l1 = 000000b6
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000647dd5e4 00000000bcf63250
!	%f31 = ccb10c97, %f14 = fc93335f f1f8acd1
	fstox	%f31,%f14		! %f14 = ffffffff fa779b48
!	%l7 = 00000000700d8f29, %l5 = 000000000000d4ea, %y  = 00000000
	smul	%l7,%l5,%l6		! %l6 = 00005d31a6f2cf7a
!	%f6  = 0a22e7d0, %f7  = 1356c605
	fmovs	%f6 ,%f7 		! %f7  = 0a22e7d0
!	%f8  = 00000001 dc4ef9db, %f16 = 3ff00000 0eb87100
	fabsd	%f8 ,%f16		! %f16 = 00000001 dc4ef9db

p3_label_59:
!	%f14 = ffffffff fa779b48, %f20 = 8482c11c 45aff05d
	fxtod	%f14,%f20		! %f20 = c1962192 e0000000
!	Mem[000000001d8000bc] = 2ce3a60d, %l1 = 00000000bcf63250
	lduwa	[%i3+0x0bc]%asi,%l1	! %l1 = 000000002ce3a60d
!	%l6 = 00005d31a6f2cf7a, %l5 = 000000000000d4ea, %l4 = ffffffffffffff01
	xor	%l6,%l5,%l4		! %l4 = 00005d31a6f21b90
!	%l0 = 00000000647dd5e4, immed = fffff6bc, %y  = 00005d31
	udiv	%l0,-0x944,%l0		! %l0 = 0000000000005d31
	bg	p3_b62			! Branch Taken, %ccr = 9b, CWP = 0

p3_label_60:
!	%l6 = 00005d31a6f2cf7a, Mem[000000001d000000] = ff000000
	stwa	%l6,[%i2+%g0]0x80	! Mem[000000001d000000] = a6f2cf7a
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x03e,%g2
p3_b62:
	membar	#Sync			! Added by membar checker (598)
!	%l5 = 000000000000d4ea, %l6 = 00005d31a6f2cf7a, %l3 = 0000000000000000
	tsubcc	%l5,%l6,%l3		! %l3 = ffffa2ce590e0570, %ccr = 93
!	%f31 = ccb10c97, %f9  = dc4ef9db
	fstoi	%f31,%f9 		! %f9  = fa779b48
!	%l6 = 00005d31a6f2cf7a, Mem[000000001d000008] = 0012c740
	stha	%l6,[%i2+%o6]0x80	! Mem[000000001d000008] = cf7ac740
!	Mem[0000000032000004] = 0000015a, %l3 = ffffa2ce590e0570
	ldsh	[%o4+0x004],%g2		! %g2 = 0000000000000000

p3_label_61:
!	Mem[000000001d000020] = 68c4deb2 5b60243e 86142e0f c863c13d
	prefetch [%i2+0x020],4
	bl,a	p3_b63			! Branch Taken, %ccr = 93, CWP = 0
!	%l4 = a6f21b90, %l5 = 0000d4ea, Mem[000000001d000010] = 00173958 6ee04b9a
	std	%l4,[%i2+0x010]	! Mem[000000001d000010] = a6f21b90 0000d4ea
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x03f,%g2
p3_b63:
!	call to call_3, CWP = 0
	call	p3_call_3_he
!	%l0 = 0000000000005d31, Mem[000000001c000000] = 00000000
	stwa	%l0,[%i0+%g0]0x80	! Mem[000000001c000000] = 00005d31

p3_label_62:
	membar	#Sync			! Added by membar checker (599)
!	%f2  = 162de21c 77df3fe0, %f2  = 162de21c 77df3fe0, %f12 = c2c6d3e2 0eb87100
	fdivd	%f2 ,%f2 ,%f12		! %f12 = 3ff00000 00000000
!	%l1 = 000000002ce3a60d, %l0 = 0000000000005d31, %l0 = 0000000000005d31
	addc	%l1,%l0,%l0		! %l0 = 000000002ce4033f
!	%l3 = ffffa2ce590e0570, immed = 00000606, %y  = 00005d31
	udiv	%l3,0x606,%l7		! %l7 = 00000000ffffffff
!	%l7 = 00000000ffffffff, Mem[0000000030800078] = 50d429ccff7b6d01
	stx	%l7,[%o1+0x078]		! Mem[0000000030800078] = 00000000ffffffff
	bneg,a	p3_not_taken_0		! Branch Not Taken, %ccr = 93

p3_label_63:
!	Mem[0000000031000071] = d5bbff1b, %l7 = 00000000ffffffff
	ldstub	[%o2+0x071],%l7		! Annulled
p3_b64:
	membar	#Sync			! Added by membar checker (600)
!	Mem[000000001d800060] = 0893fd65 2bb95de2 24c98188 aba2bfd5
	prefetch [%i3+0x060],3
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 93
!	%l3 = ffffa2ce590e0570, Mem[000000004000003e] = 1e0fff08
	sth	%l3,[%o5+0x03e]		! Annulled
p3_b65:
	membar	#Sync			! Added by membar checker (601)
!	%f14 = ffffffff fa779b48, %f0  = fc0e1613 5a9c6e6a, %f2  = 162de21c 77df3fe0
	fdivd	%f14,%f0 ,%f2 		! %f2  = ffffffff fa779b48

p3_label_64:
!	Mem[000000001c800129] = 263b24e2, %l1 = 000000002ce3a60d
	ldstub	[%i1+0x129],%l1		! %l1 = 000000000000003b
!	Mem[000000001d800008] = 0000be6b, %l0 = 000000002ce4033f
	ldsba	[%i3+%o6]0x80,%l0	! %l0 = 0000000000000000
	set	p3_b66,%o7
	fbe,a	p3_far_3_he	! Branch Taken, %fcc0 = 0
!	%l2 = 00000000d4eae157, Mem[000000001c800008] = 00ffffff
	stw	%l2,[%i1+0x008]		! Mem[000000001c800008] = d4eae157
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x042,%g2
p3_b66:
!	Registers modified during the branch to p3_far_3
!	%l0  = 000000000000d4eb
!	%l1  = 000000000000d4af
!	%l4  = ffffffffffffffea
!	%l5  = ffffa2ce590d3fbe
!	%l6  = 00005d327bddb0d1
	membar	#Sync			! Added by membar checker (602)
!	%f31 = ccb10c97, %f22 = 42c6d3e2 dc4ef9db
	fstox	%f31,%f22		! %f22 = ffffffff fa779b48

p3_label_65:
!	%l5 = ffffa2ce590d3fbe, immed = fffff5fa, %l5 = ffffa2ce590d3fbe
	or	%l5,-0xa06,%l5		! %l5 = fffffffffffffffe
!	%f2  = ffffffff fa779b48, %f30 = 6dac8d99 ccb10c97
	fcmped	%fcc0,%f2 ,%f30		! %fcc0 = 3
!	Mem[000000001c800088] = bf2e6398, %l2 = 00000000d4eae157
	ldsba	[%i1+0x088]%asi,%l2	! %l2 = ffffffffffffffbf
!	%l7 = 00000000ffffffff, %l7 = 00000000ffffffff, %l7 = 00000000ffffffff
	addc	%l7,%l7,%l7		! %l7 = 00000001ffffffff
	ble,a	p3_b67			! Branch Taken, %ccr = 03, CWP = 0

p3_label_66:
!	Mem[000000001d8001c0] = e475ff3e 75ec989a 641575b3 ce4ebaa9
	prefetch [%i3+0x1c0],23
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x043,%g2
p3_b67:
	membar	#Sync			! Added by membar checker (603)
!	%l3 = ffffa2ce590e0570
	setx	0xbbcc5d54bbcc5d54,%g7,%l3 ! %l3 = bbcc5d54bbcc5d54
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 03
!	Mem[0000000031000070] = d5bbff1b74ffd6c2, %l7 = 00000001ffffffff
	ldx	[%o2+0x070],%l7		! %l7 = d5bbff1b74ffd6c2
p3_b68:
	bgu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 03

p3_label_67:
!	%l2 = ffffffbf, %l3 = bbcc5d54, Mem[000000001c800198] = 5c4ac988 917cf6da
	std	%l2,[%i1+0x198]	! Annulled
p3_b69:
	membar	#Sync			! Added by membar checker (604)
	fbu,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000003180003c] = ff30e0e7, %l1 = 000000000000d4af
	swap	[%o3+0x03c],%l1		! Annulled
p3_b70:
	membar	#Sync			! Added by membar checker (605)
!	%l1 = 000000000000d4af, immed = 00000019, %l6 = 00005d327bddb0d1
	sllx	%l1,0x019,%l6		! %l6 = 000001a95e000000
	set	p3_b71,%o7
	fbul	p3_far_3_he	! Branch Taken, %fcc0 = 3

p3_label_68:
!	Mem[000000001c800124] = d443d222, %l0 = 000000000000d4eb
	swap	[%i1+0x124],%l0		! %l0 = 00000000d443d222
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x047,%g2
p3_b71:
!	Registers modified during the branch to p3_far_3
!	%l0  = 00000000d443d221
!	%l1  = 00000000d442fd71
!	%l4  = ffffffffffffffea
!	%l5  = fffffe56a1fff0c4
!	%l6  = 000001a95dffffbf
	membar	#Sync			! Added by membar checker (606)
!	Mem[000000001d000060] = 049692b7 74941adc c2c9a78d c7464681
	prefetch [%i2+0x060],22
!	%f20 = c1962192 e0000000, %f12 = 3ff00000 00000000
	fdtox	%f20,%f12		! %f12 = ffffffff fa779b48
!	%l3 = bbcc5d54bbcc5d54
	setx	0x7dd450707dd45070,%g7,%l3 ! %l3 = 7dd450707dd45070
!	%l7 = d5bbff1b74ffd6c2, %l0 = 00000000d443d221, %y  = 00005d31
	smul	%l7,%l0,%l4		! %l4 = ec030614cfebd302

p3_label_69:
!	%l2 = ffffffffffffffbf, Mem[000000001c00011f] = 78171fe6
	stb	%l2,[%i0+0x11f]		! Mem[000000001c00011c] = 78171fbf
	bl	p3_b72			! Branch Taken, %ccr = 13, CWP = 0
!	%l3 = 7dd450707dd45070, Mem[000000001d000198] = b21779c4e1ea7102
	stx	%l3,[%i2+0x198]		! Mem[000000001d000198] = 7dd450707dd45070
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x048,%g2
p3_b72:
	membar	#Sync			! Added by membar checker (607)
!	Mem[0000000030000038] = 00000000, %l4 = ec030614cfebd302
	ldsba	[%o0+0x039]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000032000034] = b105dabe, %l4 = 0000000000000000
	lduba	[%o4+0x034]%asi,%g2	! %g2 = 00000000000000b1

p3_label_70:
!	Mem[000000003100003c] = 25578689, %l7 = d5bbff1b74ffd6c2
	ldsba	[%o2+0x03d]%asi,%l7	! %l7 = 0000000000000057
!	%f31 = ccb10c97, %f4  = 8e4417c5
	fstoi	%f31,%f4 		! %f4  = fa779b48
!	%l2 = ffffffffffffffbf, %l2 = ffffffffffffffbf, %l2 = ffffffffffffffbf
	srax	%l2,%l2,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030800038] = b83e0288 0058c159, %l0 = d443d221, %l1 = d442fd71
	ldd	[%o1+0x038],%l0		! %l0 = 00000000b83e0288 000000000058c159
!	%l0 = 00000000b83e0288, immed = fffff4a1, %l1 = 000000000058c159
	orn	%l0,-0xb5f,%l1		! %l1 = 00000000b83e0bde

p3_label_71:
!	%l3 = 7dd450707dd45070, %l7 = 0000000000000057, %y  = ec030614
	sdiv	%l3,%l7,%l3		! %l3 = ffffffff80000000
!	%l1 = 00000000b83e0bde, immed = 00000922, %l5 = fffffe56a1fff0c4
	subccc	%l1,0x922,%l5		! %l5 = 00000000b83e02bb, %ccr = 08
!	%f22 = ffffffff, %f15 = fa779b48
	fitos	%f22,%f15		! %f15 = bf800000
!	Mem[000000001d00004c] = 58b7fc2e, %l4 = 0000000000000000
	ldsh	[%i2+0x04c],%l4		! %l4 = 00000000000058b7
	bvs	p3_not_taken_0		! Branch Not Taken, %ccr = 08

p3_label_72:
!	Mem[000000004000003c] = 1e0fff08, %l3 = ffffffff80000000
	ldsw	[%o5+0x03c],%l3		! %l3 = 000000001e0fff08
p3_b73:
	membar	#Sync			! Added by membar checker (608)
!	%l3 = 000000001e0fff08, Mem[000000001c000008] = c37e33b5
	stha	%l3,[%i0+%o6]0x80	! Mem[000000001c000008] = ff0833b5
!	Mem[0000000030800074] = ffffffff, %l5 = 00000000b83e02bb
	ldsba	[%o1+0x074]%asi,%l5	! %l5 = ffffffffffffffff
!	Branch On Register, %l0 = 00000000b83e0288
	brz,pn	%l0,p3_not_taken_0	! Branch Not Taken
!	%l0 = b83e0288, %l1 = b83e0bde, Mem[000000001d000000] = a6f2cf7a 00000000
	stda	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = b83e0288 b83e0bde
p3_b74:

p3_label_73:
	bcc	p3_b75			! Branch Taken, %ccr = 08, CWP = 0
!	%l0 = b83e0288, %l1 = b83e0bde, Mem[000000001e800000] = 062f9737 dbdef00d
	stda	%l0,[%i5+%g0]0x80	! Mem[000000001e800000] = b83e0288 b83e0bde
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x04b,%g2
p3_b75:
	membar	#Sync			! Added by membar checker (609)
!	%l7 = 0000000000000057, immed = 0000004e, %l0 = 00000000b83e0288
	andn	%l7,0x04e,%l0		! %l0 = 0000000000000011
!	%l2 = ffffffff, %l3 = 1e0fff08, Mem[000000001d800000] = 000000ff 300d4a89
	stda	%l2,[%i3+%g0]0x80	! Mem[000000001d800000] = ffffffff 1e0fff08
!	%l6 = 000001a95dffffbf, immed = fffff2cd, %l0 = 0000000000000011
	taddcc	%l6,-0xd33,%l0		! %l0 = 000001a95dfff28c, %ccr = 13

p3_label_74:
	fbg,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001d8000e0] = 0fc8a6d0 f51f6f12 f218c2d0 7792ff18
	prefetch [%i3+0x0e0],22	! Annulled
p3_b76:
	membar	#Sync			! Added by membar checker (610)
	fbe,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[000000001c000000] = 00005d31, %l5 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
p3_b77:
	membar	#Sync			! Added by membar checker (611)
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetcha [%o4+0x020]%asi,23

p3_label_75:
!	%f23 = fa779b48, %f16 = 00000001 dc4ef9db
	fstod	%f23,%f16		! %f16 = c74ef369 00000000
!	Mem[000000001d00009c] = 6f33d9a0, %l1 = b83e0bde, %l3 = 1e0fff08
	add	%i2,0x9c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 000000006f33d9a0
	bg	p3_not_taken_0		! Branch Not Taken, %ccr = 13
!	%l4 = 00000000000058b7, Mem[0000000032000060] = be38db17ddc48f29
	stx	%l4,[%o4+0x060]		! Mem[0000000032000060] = 00000000000058b7
p3_b78:
	membar	#Sync			! Added by membar checker (612)
!	%l2 = ffffffffffffffff, immed = 00000df7, %y  = ec030614
	udivx	%l2,0xdf7,%l1		! %l1 = 001254ed7413c390

p3_label_76:
	fbl,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	%l3 = 000000006f33d9a0, Mem[000000003080007e] = ffffffff
	stb	%l3,[%o1+0x07e]		! Annulled
p3_b79:
	membar	#Sync			! Added by membar checker (613)
!	%f18 = 162de21c 77df3fe0, %f18 = 162de21c 77df3fe0
	fmovd	%f18,%f18		! %f18 = 162de21c 77df3fe0
!	%f26 = 00000000, %f6  = 0a22e7d0
	fcmpes	%fcc0,%f26,%f6 		! %fcc0 = 1
!	%l5 = 0000000000000000, immed = 00000001, %l1 = 001254ed7413c390
	sra	%l5,0x001,%l1		! %l1 = 0000000000000000

p3_label_77:
!	%l4 = 00000000000058b7, immed = 00000eea, %l3 = 000000006f33d9a0
	or	%l4,0xeea,%l3		! %l3 = 0000000000005eff
!	Mem[000000001c000050] = 694e6211, %l6 = 000001a95dffffbf
	lduha	[%i0+0x052]%asi,%l6	! %l6 = 0000000000006211
!	%f1  = 5a9c6e6a, %f17 = 00000000, %f22 = ffffffff
	fadds	%f1 ,%f17,%f22		! %f22 = 5a9c6e6a
	fbn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l4 = 00000000000058b7, Mem[000000001f000008] = 56fafcd1
	stba	%l4,[%i6+%o6]0x80	! Mem[000000001f000008] = b7fafcd1
p3_b80:

p3_label_78:
	membar	#Sync			! Added by membar checker (614)
!	%l0 = 5dfff28c, %l1 = 00000000, Mem[000000001d800160] = 83305260 b5585627
	std	%l0,[%i3+0x160]	! Mem[000000001d800160] = 5dfff28c 00000000
	nop
	bvc	p3_not_taken_0		! Branch Not Taken, %ccr = 13
!	Mem[0000000032000048] = 60739feb, %l3 = 0000000000005eff
	ldsw	[%o4+0x048],%g2		! %g2 = 0000000000005eff
p3_b81:
	membar	#Sync			! Added by membar checker (615)
!	%f12 = ffffffff fa779b48, %f22 = 5a9c6e6a fa779b48, %f18 = 162de21c 77df3fe0
	fdivd	%f12,%f22,%f18		! %f18 = ffffffff fa779b48

p3_label_79:
	set	p3_b82,%o7
	fba	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	%l5 = 0000000000000000, Mem[000000001c800115] = 38212a64
	stb	%l5,[%i1+0x115]		! Mem[000000001c800114] = 38002a64
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x052,%g2
p3_b82:
	membar	#Sync			! Added by membar checker (616)
!	Mem[000000001d000000] = b83e0288 b83e0bde cf7ac740 fffff495
	prefetcha [%i2+0x000]%asi,1
!	%f17 = 00000000, %f26 = 00000000
	fitos	%f17,%f26		! %f26 = 00000000
!	%l6 = 00006211, %l7 = 00000057, Mem[000000001c000000] = ff005d31 9d70574a
	stda	%l6,[%i0+%g0]0x80	! Mem[000000001c000000] = 00006211 00000057

p3_label_80:
!	%l2 = ffffffffffffffff, immed = 00000fa8, %l5 = 0000000000000000
	xnorcc	%l2,0xfa8,%l5		! %l5 = 0000000000000fa8, %ccr = 00
!	Mem[0000000032000000] = 00000000 0000015a e83b01bf 5e0357b7
	prefetcha [%o4+0x000]%asi,4
!	%l4 = 00000000000058b7, immed = 00000003, %l7 = 0000000000000057
	add	%l4,0x003,%l7		! %l7 = 00000000000058ba
!	%l0 = 000001a95dfff28c, immed = 00000855, %l7 = 00000000000058ba
	addccc	%l0,0x855,%l7		! %l7 = 000001a95dfffae1, %ccr = 00
	bcc,a	p3_b83			! Branch Taken, %ccr = 00, CWP = 0

p3_label_81:
!	Mem[000000003000007c] = 263b24e2, %l6 = 0000000000006211
	ldub	[%o0+0x07f],%l6		! %l6 = 00000000000000e2
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x053,%g2
p3_b83:
	membar	#Sync			! Added by membar checker (617)
	fbuge,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800020] = 79fafba8 7092e917 202fc52c d610755e
	prefetch [%i3+0x020],23
p3_b84:
	bvs	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001c000008] = ff0833b5, %l4 = 00000000000058b7
	ldswa	[%i0+%o6]0x80,%l4	! %l4 = ffffffffff0833b5
p3_b85:

p3_label_82:
	membar	#Sync			! Added by membar checker (618)
!	Branch On Register, %l1 = 0000000000000000
	brlz,a,pn %l1,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d0000c0] = 8614bf1d, %l1 = 0000000000000000
	lduh	[%i2+0x0c2],%l1		! Annulled
p3_b86:
	membar	#Sync			! Added by membar checker (619)
!	Branch On Register, %l5 = 0000000000000fa8
	brgez,a,pn %l5,p3_b87		! Branch Taken
!	Mem[000000001c800008] = d4eae157, %l4 = ffffffffff0833b5
	ldsha	[%i1+%o6]0x80,%l4	! %l4 = ffffffffffffd4ea
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x057,%g2
p3_b87:
	membar	#Sync			! Added by membar checker (620)
!	Mem[0000000032000028] = 91eefd1b, %l6 = 00000000000000e2
	ldsw	[%o4+0x028],%g2		! %g2 = 00000000000000e2

p3_label_83:
!	%f17 = 00000000, %f12 = ffffffff
	fstoi	%f17,%f12		! %f12 = 00000000
!	call to call_2, CWP = 0
	call	p3_call_2_he
!	%l7 = 000001a95dfffae1, Mem[000000001c000000] = 0000621100000057
	stxa	%l7,[%i0+%g0]0x80	! Mem[000000001c000000] = 000001a95dfffae1
!	Registers modified during the branch to p3_call_2
!	%l2  = c193114afbd32163
!	%l5  = fffffe56a20008c3
!	%l6  = ea75000000000000
!	Mem[000000001d800060] = 0893fd65 2bb95de2 24c98188 aba2bfd5
	prefetch [%i3+0x060],1
!	%l5 = fffffe56a20008c3, %l7 = 000001a95dfffae1, %l3 = 0000000000005eff
	sra	%l5,%l7,%l3		! %l3 = ffffffffd1000461

p3_label_84:
!	Branch On Register, %l1 = 0000000000000000
	brnz,pt	%l1,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001c000008] = ff0833b5, %l3 = ffffffffd1000461
	ldsha	[%i0+%o6]0x80,%l3	! %l3 = ffffffffffffff08
p3_b88:
	fbg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001e800158] = dcc665354cb4a801, %l1 = 0000000000000000
	ldx	[%i5+0x158],%l1		! %l1 = dcc665354cb4a801
p3_b89:
	fbug,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_85:
!	Mem[000000001c000008] = ff0833b5, %l5 = fffffe56a20008c3
	ldstuba	[%i0+%o6]0x80,%l5	! Annulled
p3_b90:
	set	p3_b91,%o7
	fbul	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001c800068] = dee2bc02 4c68407d, %l2 = fbd32163, %l3 = ffffff08
	ldd	[%i1+0x068],%l2		! %l2 = 00000000dee2bc02 000000004c68407d
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x05b,%g2
p3_b91:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = ffffffffa11d43fd
!	%l5  = 000000007fffffff
	membar	#Sync			! Added by membar checker (621)
!	%l0 = 00007fb1, %l1 = a11d43fd, Mem[000000001d000048] = 7da6c24f 58b7fc2e
	stda	%l0,[%i2+0x048]%asi	! Mem[000000001d000048] = 00007fb1 a11d43fd
!	%f23 = fa779b48, %f17 = 00000000, %f6  = 0a22e7d0
	fadds	%f23,%f17,%f6 		! %f6  = fa779b48

p3_label_86:
!	%l2 = 00000000dee2bc02, immed = fffff0c2, %l5 = 000000007fffffff
	and	%l2,-0xf3e,%l5		! %l5 = 00000000dee2b002
!	%l1 = ffffffffa11d43fd, Mem[000000001d800008] = 0000be6b
	stba	%l1,[%i3+%o6]0x80	! Mem[000000001d800008] = fd00be6b
!	Branch On Register, %l4 = ffffffffffffd4ea
	brlz,a,pt %l4,p3_b92		! Branch Taken
!	%l5 = 00000000dee2b002, Mem[0000000031800074] = 1209fd1a
	stw	%l5,[%o3+0x074]		! Mem[0000000031800074] = dee2b002
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x05c,%g2
p3_b92:
	membar	#Sync			! Added by membar checker (622)
!	Mem[000000001c000160] = 06b90f2a 5e591375 02278c73 6afc1af3
	prefetcha [%i0+0x160]%asi,21

p3_label_87:
!	Mem[000000001d800000] = ffffffff, %l5 = 00000000dee2b002
	ldsba	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffffff
	fbge,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1
!	Mem[0000000030000030] = 1712c895, %l3 = 000000004c68407d
	ldstub	[%o0+0x030],%l3		! %l3 = 0000000000000017
p3_b93:
	fbuge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[0000000032000024] = f491eefd, %l5 = ffffffffffffffff
	ldub	[%o4+0x027],%g2		! %g2 = 00000000000000f4
p3_b94:

p3_label_88:
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[000000001d8001fc] = 1712c740, %l4 = ffffffffffffd4ea
	ldsb	[%i3+0x1fe],%l4		! Annulled
p3_b95:
	membar	#Sync			! Added by membar checker (623)
!	%f4  = fa779b48, %f12 = 00000000, %f13 = fa779b48
	fsubs	%f4 ,%f12,%f13		! %f13 = fa779b48
	bgu	p3_not_taken_0		! Branch Not Taken, %ccr = 9b
!	Mem[000000001c8000e0] = 6ee85e55 7101aa92 5ad8b5ca 88d852b6
	prefetch [%i1+0x0e0],1
p3_b96:

p3_label_89:
	fbue	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	%l7 = 000001a95dfffae1, Mem[0000000031000076] = 74ffd6c2
	stb	%l7,[%o2+0x076]		! Mem[0000000031000074] = 74ffe1c2
p3_b97:
	membar	#Sync			! Added by membar checker (624)
!	%l5 = ffffffffffffffff, immed = 0000032d, %l3 = 0000000000000017
	andncc	%l5,0x32d,%l3		! %l3 = fffffffffffffcd2, %ccr = 88
!	Mem[0000000030800073] = 13e8880c, %l1 = ffffffffa11d43fd
	ldstuba	[%o1+0x073]%asi,%l1	! %l1 = 000000000000000c
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88

p3_label_90:
!	Mem[000000001c000064] = 12666149, %l1 = 000000000000000c
	ldub	[%i0+0x065],%l1		! Annulled
p3_b98:
	membar	#Sync			! Added by membar checker (625)
!	Mem[000000001c000160] = 06b90f2a 5e591375 02278c73 6afc1af3
	prefetch [%i0+0x160],4
!	%l2 = 00000000dee2bc02, immed = fffff618, %y  = 00000000
	umul	%l2,-0x9e8,%l7		! %l7 = dee2b36209e98c30
	fbue	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001d800008] = fd00be6b, %l5 = ffffffffffffffff
	ldstuba	[%i3+%o6]0x80,%l5	! %l5 = 00000000000000fd
p3_b99:

p3_label_91:
	membar	#Sync			! Added by membar checker (626)
!	%l0 = 0000000000007fb1, Mem[000000001c8001d9] = 9c3aea30
	stb	%l0,[%i1+0x1d9]		! Mem[000000001c8001d8] = 9cb1ea30
!	Mem[000000001c00002c] = a7c2c635, %l4 = ffffffffffffd4ea
	swap	[%i0+0x02c],%l4		! %l4 = 00000000a7c2c635
!	Mem[000000001c000000] = 000001a9 5dfffae1, %l6 = 00000000, %l7 = 09e98c30
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000000001a9 000000005dfffae1
!	%l1 = 000000000000000c, immed = 00000f16, %y  = dee2b362
	udivx	%l1,0xf16,%l2		! %l2 = 0000000000000000
	fbuge,a,pt %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1

p3_label_92:
!	Mem[000000001d000044] = cfa46e45, %l5 = 00000000000000fd
	ldsb	[%i2+0x045],%l5		! Annulled
p3_b100:
	membar	#Sync			! Added by membar checker (627)
!	%l5 = 00000000000000fd, Mem[0000000031000079] = 960be272
	stba	%l5,[%o2+0x079]%asi	! Mem[0000000031000078] = 96fde272
	fbn,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800070] = c6eb2b8c, %l1 = 000000000000000c
	swap	[%i1+0x070],%l1		! Annulled
p3_b101:
	membar	#Sync			! Added by membar checker (628)
!	Mem[000000001c800020] = d1eb1091 33fc2e3e c7b5d74e 9a8fbe2c
	prefetcha [%i1+0x020]%asi,2

p3_label_93:
!	%l3 = fffffffffffffcd2
	setx	0x9ee92d849ee92d84,%g7,%l3 ! %l3 = 9ee92d849ee92d84
!	%l4 = a7c2c635, %l5 = 000000fd, Mem[000000001e800000] = b83e0288 b83e0bde
	stda	%l4,[%i5+%g0]0x80	! Mem[000000001e800000] = a7c2c635 000000fd
!	%l5 = 00000000000000fd, immed = 0000034f, %l1 = 000000000000000c
	xnor	%l5,0x34f,%l1		! %l1 = fffffffffffffc4d
	set	p3_b102,%o7
	fba	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001c000008] = ff0833b5, %l5 = 00000000000000fd
	ldstuba	[%i0+%o6]0x80,%l5	! %l5 = 00000000000000ff
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x066,%g2
p3_b102:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = 000000007fffffff
!	%l5  = 000000007fffffff

p3_label_94:
	membar	#Sync			! Added by membar checker (629)
!	Mem[000000001f00011c] = 96ea9676, %l4 = 00000000a7c2c635
	ldsha	[%i6+0x11e]%asi,%l4	! %l4 = ffffffffffff9676
	set	p3_b103,%o7
	fba,a	p3_far_1_le	! Branch Taken, %fcc0 = 1
!	%l3 = 9ee92d849ee92d84, Mem[000000001d000000] = b83e0288b83e0bde
	stxa	%l3,[%i2+%g0]0x80	! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x067,%g2
p3_b103:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = ffffffff80000000
!	%l5  = ffffffff80000000
	membar	#Sync			! Added by membar checker (630)
!	%l5 = ffffffff80000000, immed = fffffccf, %l1 = ffffffff80000000
	andn	%l5,-0x331,%l1		! %l1 = 0000000000000000
	set	p3_b104,%o7
	fblg,a	p3_far_1_le	! Branch Taken, %fcc0 = 1

p3_label_95:
!	Mem[000000001d800008] = ff00be6b, %l7 = 000000005dfffae1
	ldswa	[%i3+%o6]0x80,%l7	! %l7 = ffffffffff00be6b
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x068,%g2
p3_b104:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = 000000007fffffff
!	%l5  = 000000007fffffff
	membar	#Sync			! Added by membar checker (631)
	fbn,pt	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000001d800134] = 4b89c244, %l1 = 000000007fffffff
	ldub	[%i3+0x135],%l1		! %l1 = 0000000000000089
p3_b105:
	membar	#Sync			! Added by membar checker (632)
!	%l2 = 0000000000000000, Mem[000000001c0001e8] = 95344360e5c2c9a0
	stx	%l2,[%i0+0x1e8]		! Mem[000000001c0001e8] = 0000000000000000
	fbn,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_96:
!	%l2 = 0000000000000000, Mem[000000001d800008] = ff00be6bfd8618d5
	stxa	%l2,[%i3+%o6]0x80	! Mem[000000001d800008] = 0000000000000000
p3_b106:
	bgu	p3_b107			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d800160] = 5dfff28c 00000000 ca1d7734 5d9337aa
	prefetch [%i3+0x160],20
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x06b,%g2
p3_b107:
	membar	#Sync			! Added by membar checker (633)
!	%l0 = 0000000000007fb1, Mem[000000001d800100] = d78793ea
	stw	%l0,[%i3+0x100]		! Mem[000000001d800100] = 00007fb1
	fbn,pn	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 1

p3_label_97:
!	%l6 = 00000000000001a9, Mem[0000000030800034] = 5f3f9652
	sth	%l6,[%o1+0x034]		! Mem[0000000030800034] = 01a99652
p3_b108:
	membar	#Sync			! Added by membar checker (634)
!	Mem[0000000031800070] = 00000001 00000001, %l3 = 9ee92d849ee92d84, %l0 = 0000000000007fb1
	add	%o3,0x70,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = bfc0f5bddee2b002
!	Mem[000000001e8000b0] = 6236d432, %l4 = ffffffffffff9676
	ldsh	[%i5+0x0b2],%l4		! %l4 = ffffffffffffd432
!	%l6 = 00000000000001a9, %l3 = 9ee92d849ee92d84, %y  = 000000d4
	udivx	%l6,%l3,%l6		! %l6 = 0000000000000000
!	%f20 = c1962192 e0000000, %f30 = 6dac8d99
	fdtoi	%f20,%f30		! %f30 = fa779b48

p3_label_98:
!	%l2 = 0000000000000000, %l0 = bfc0f5bddee2b002, %l0 = bfc0f5bddee2b002
	addc	%l2,%l0,%l0		! %l0 = bfc0f5bddee2b002
!	%f2  = ffffffff, %f14 = ffffffff
	fnegs	%f2 ,%f14		! %f14 = 7fffffff
!	%f26 = 00000000 00000000, %f26 = 00000000 00000000, %f20 = c1962192 e0000000
	faddd	%f26,%f26,%f20		! %f20 = 00000000 00000000
	bg,a	p3_b109			! Branch Taken, %ccr = 00, CWP = 0
!	%l4 = ffffffffffffd432, Mem[000000001d00009c] = 6f33d9a0
	stw	%l4,[%i2+0x09c]		! Mem[000000001d00009c] = ffffd432
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x06d,%g2
p3_b109:

p3_label_99:
	bgu	p3_b110			! Branch Taken, %ccr = 00, CWP = 0
!	%l4 = ffffd432, %l5 = 7fffffff, Mem[000000001f000008] = b7fafcd1 8b9d150b
	stda	%l4,[%i6+%o6]0x80	! Mem[000000001f000008] = ffffd432 7fffffff
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x06e,%g2
p3_b110:
	bvc	p3_b111			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d800110] = d0f837a0, %l1 = 0000000000000089
	ldub	[%i3+0x111],%l1		! %l1 = 00000000000000f8
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x06f,%g2
p3_b111:
	membar	#Sync			! Added by membar checker (635)
	set	p3_b112,%o7
	fbne,a,pt %fcc0,p3_near_3_le	! Branch Taken, %fcc0 = 1

p3_label_100:
!	Mem[000000001c000000] = 000001a9, %l3 = 9ee92d849ee92d84
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x070,%g2
p3_b112:
!	Registers modified during the branch to p3_near_3
!	%l2  = fffffffffffff125
!	%l6  = 00000000000001f0
	membar	#Sync			! Added by membar checker (636)
!	%l6 = 00000000000001f0, immed = fffff607, %l0 = bfc0f5bddee2b002
	addccc	%l6,-0x9f9,%l0		! %l0 = fffffffffffff7f7, %ccr = 88
!	%l3 = 0000000000000000, %l6 = 00000000000001f0, %l4 = ffffffffffffd432
	or	%l3,%l6,%l4		! %l4 = 00000000000001f0
!	%l5 = 000000007fffffff, %l0 = fffffffffffff7f7, %l0 = fffffffffffff7f7
	addc	%l5,%l0,%l0		! %l0 = 000000007ffff7f6
!	%l6 = 00000000000001f0, %l7 = ffffffffff00be6b, %l5 = 000000007fffffff
	addcc	%l6,%l7,%l5		! %l5 = ffffffffff00c05b, %ccr = 88

p3_label_101:
!	%l6 = 00000000000001f0, %l1 = 00000000000000f8, %l6 = 00000000000001f0
	xnorcc	%l6,%l1,%l6		! %l6 = fffffffffffffef7, %ccr = 88

	ba,a	p3_not_taken_0_end
p3_not_taken_0:
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba,a	p3_branch_failed
p3_not_taken_0_end:

	set	p3_b113,%o7
	fba,a	p3_far_2_le	! Branch Taken, %fcc0 = 1
!	%l7 = ffffffffff00be6b, Mem[0000000032000050] = b23d4e89
	sth	%l7,[%o4+0x050]		! Annulled
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x071,%g2
p3_b113:
	membar	#Sync			! Added by membar checker (637)
!	%l2 = fffff125, %l3 = 00000000, Mem[0000000032000058] = 670cfb3e 213ac54e
	stda	%l2,[%o4+0x058]%asi	! Mem[0000000032000058] = fffff125 00000000
!	%l3 = 0000000000000000
	setx	0xde444557de444557,%g7,%l3 ! %l3 = de444557de444557

p3_label_102:
!	%f10 = 12d93726, %f27 = 00000000
	fcmps	%fcc3,%f10,%f27		! %fcc3 = 2
!	%f15 = bf800000, %f12 = 00000000
	fnegs	%f15,%f12		! %f12 = 3f800000
	set	p3_b114,%o7
	fbul	p3_far_1_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d000000] = b83e0288, %l7 = ffffffffff00be6b
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000b83e0288
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x072,%g2
p3_b114:
!	Registers modified during the branch to p3_far_1
!	%l3  = 00000000b83e0088
!	%l5  = 00000000b83e0378
!	%l6  = 0000004a47d17338
	membar	#Sync			! Added by membar checker (638)
!	Mem[000000001d000040] = 0bc73431 cfa46e45 00007fb1 a11d43fd
	prefetch [%i2+0x040],22

p3_label_103:
!	Mem[000000001c0001d8] = b4cfeedb, %l5 = 00000000b83e0378
	ldsha	[%i0+0x1d8]%asi,%l5	! %l5 = ffffffffffffb4cf
!	%l6 = 0000004a47d17338
	setx	0x8dc77bc58dc77bc5,%g7,%l6 ! %l6 = 8dc77bc58dc77bc5
!	Mem[000000001d800008] = 00000000, %l3 = 00000000b83e0088
	ldsha	[%i3+%o6]0x80,%l3	! %l3 = 0000000000000000
	set	p3_b115,%o7
	fba	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001d0001c0] = 39c63a2a, %l2 = fffffffffffff125
	ldsw	[%i2+0x1c0],%l2		! %l2 = 0000000039c63a2a
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x073,%g2
p3_b115:
!	Registers modified during the branch to p3_far_3
!	%l0  = 000000007fffacc5
!	%l1  = 000000007fffabcd
!	%l4  = ffffffffffffffea
!	%l5  = 7238843a72388b01
!	%l6  = 8dc77bc5c78db5ef

p3_label_104:
	membar	#Sync			! Added by membar checker (639)
!	Mem[000000003080007c] = ffffffff, %l1 = 000000007fffabcd
	ldsha	[%o1+0x07c]%asi,%l1	! %l1 = ffffffffffffffff
	set	p3_b116,%o7
	fbge,pn	%fcc1,p3_near_2_le	! Branch Taken, %fcc1 = 2
!	Mem[000000001d000000] = ff00be6b, %l7 = 00000000b83e0288
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff00be6b
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x074,%g2
p3_b116:
!	Registers modified during the branch to p3_near_2
!	%l6  = 8dc77bc5c78db5ef
	membar	#Sync			! Added by membar checker (640)
	set	p3_b117,%o7
	fba,a,pn %fcc2,p3_near_2_le	! Branch Taken, %fcc2 = 2
!	Mem[000000001c000060] = 832cc409 12666149 082f8dee b9511342
	prefetch [%i0+0x060],4	! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x075,%g2
p3_b117:
!	Registers modified during the branch to p3_near_2
!	%l6  = 8dc77bc5c78db5ef

p3_label_105:
	membar	#Sync			! Added by membar checker (641)
!	Mem[000000001d800008] = 00000000, %l4 = ffffffffffffffea
	ldswa	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001c0001a0] = 4cd6c8b0 6d615c62 016a347d de195276
	prefetch [%i0+0x1a0],4	! Annulled
p3_b118:
	fbue	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000003080003c] = 0058c159, %l1 = ffffffffffffffff
	ldsh	[%o1+0x03e],%l1		! %l1 = ffffffffffffc159
p3_b119:

p3_label_106:
	set	p3_b120,%o7
	fbo	p3_far_0_le	! Branch Taken, %fcc0 = 1
!	Mem[000000001c000020] = d5ce3bb4 a8e850d5 6c31e6ce ffffd4ea
	prefetch [%i0+0x020],23
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x078,%g2
p3_b120:
!	Registers modified during the branch to p3_far_0
!	%l2  = 8dc77bc58dc774fe
!	%l4  = 96fde27235f46aa8
	membar	#Sync			! Added by membar checker (642)
!	%f25 = 77df3fe0, %f20 = 00000000
	fnegs	%f25,%f20		! %f20 = f7df3fe0
	set	p3_b121,%o7
	fble,a	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	%l2 = 8dc77bc58dc774fe, Mem[000000001c800170] = 80875a1be2c4a297
	stx	%l2,[%i1+0x170]		! Mem[000000001c800170] = 8dc77bc58dc774fe
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x079,%g2
p3_b121:
!	Registers modified during the branch to p3_far_0
!	%l1  = 0000000011ac095a
!	%l3  = 00000000000c19ae
!	%l4  = 0000000000011b8e

p3_label_107:
	membar	#Sync			! Added by membar checker (643)
!	%f17 = 00000000, %f4  = fa779b48
	fcmps	%fcc3,%f17,%f4 		! %fcc3 = 2
!	Mem[000000001c8001dc] = 2fbea3c7, %l5 = 7238843a72388b01
	lduh	[%i1+0x1de],%l5		! %l5 = 000000000000a3c7
!	Jump to jmpl_3, CWP = 0
	set	p3_jmpl_3_le,%g1
	jmpl	%g1,%g6
!	%l1 = 0000000011ac095a, Mem[000000001e800000] = a7c2c635
	stha	%l1,[%i5+%g0]0x80	! Mem[000000001e800000] = 095ac635
!	Registers modified during the branch to p3_jmpl_3
!	%l1  = 0000000000000000
!	%l2  = 0000000000000003
!	%l6  = ffffffff80005bb9
!	%f11 = 808daef4, %f5  = c2c6d3e2
	fnegs	%f11,%f5 		! %f5  = 008daef4

p3_label_108:
!	Mem[0000000032000000] = 00000000 0000015a e83b01bf 5e0357b7
	prefetcha [%o4+0x000]%asi,20
!	Branch On Register, %l2 = 0000000000000003
	brnz,a,pn %l2,p3_b122		! Branch Taken
!	Mem[000000003100003e] = 25578689, %l3 = 00000000000c19ae
	ldstub	[%o2+0x03e],%l3		! %l3 = 0000000000000086
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x07a,%g2
p3_b122:
	membar	#Sync			! Added by membar checker (644)
!	Mem[000000001c000008] = ff0833b5 e37995fa, %l2 = 00000003, %l3 = 00000086
	ldda	[%i0+%o6]0x80,%l2	! %l2 = 00000000ff0833b5 00000000e37995fa
	fbge	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1

p3_label_109:
!	Mem[000000001e00014c] = e1f60695, %l5 = 000000000000a3c7
	lduh	[%i4+0x14e],%l5		! %l5 = 0000000000000695
p3_b123:
	membar	#Sync			! Added by membar checker (645)
!	Mem[000000003100003c] = 2557ff89, %l7 = 00000000ff00be6b
	lduba	[%o2+0x03d]%asi,%l7	! %l7 = 0000000000000057
!	Mem[000000001f000008] = ffffd432, %l6 = ffffffff80005bb9
	ldswa	[%i6+%o6]0x80,%l6	! %l6 = ffffffffffffd432
!	Mem[000000001c000008] = ff0833b5, %l4 = 0000000000011b8e
	lduha	[%i0+%o6]0x80,%l4	! %l4 = 000000000000ff08
	fbl,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2

p3_label_110:
!	%l4 = 000000000000ff08, Mem[000000001d800000] = ffffffff
	stba	%l4,[%i3+%g0]0x80	! Annulled
p3_b124:
	bleu	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l4 = 000000000000ff08, Mem[000000001d800140] = 052c14bf
	stw	%l4,[%i3+0x140]		! Mem[000000001d800140] = 0000ff08
p3_b125:
	membar	#Sync			! Added by membar checker (646)
	fbn,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	%l5 = 0000000000000695, Mem[000000001c000008] = ff0833b5
	stha	%l5,[%i0+%o6]0x80	! Annulled
p3_b126:

p3_label_111:
	set	p3_b127,%o7
	fbo,a	p3_far_1_he	! Branch Taken, %fcc0 = 1
!	%l4 = 000000000000ff08, Mem[0000000032000074] = 2e44b2cd
	stw	%l4,[%o4+0x074]		! Mem[0000000032000074] = 0000ff08
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x07f,%g2
p3_b127:
!	Registers modified during the branch to p3_far_1
!	%l3  = 0000000000000040
!	%l5  = 000000000000ff5f
!	%l6  = fffffffffff50c80
	membar	#Sync			! Added by membar checker (647)
!	%f26 = 00000000 00000000, %f10 = 12d93726 808daef4, %f2  = ffffffff fa779b48
	faddd	%f26,%f10,%f2 		! %f2  = 12d93726 808daef4
!	%f18 = ffffffff fa779b48, %f6  = fa779b48 0a22e7d0
	fxtod	%f18,%f6 		! %f6  = c1962192 e0000000
!	Mem[000000001d000040] = 0bc73431 cfa46e45 00007fb1 a11d43fd
	prefetch [%i2+0x040],4

p3_label_112:
	fbn,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800000] = 647dd5e4, %l4 = 000000000000ff08
	lduba	[%i1+%g0]0x80,%l4	! Annulled
p3_b128:
	membar	#Sync			! Added by membar checker (648)
!	Branch On Register, %l6 = fffffffffff50c80
	brlez,a,pn %l6,p3_b129		! Branch Taken
!	Mem[000000001d000008] = cf7ac740, %l1 = 0000000000000000
	ldsba	[%i2+%o6]0x80,%l1	! %l1 = ffffffffffffffcf
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x081,%g2
p3_b129:
	membar	#Sync			! Added by membar checker (649)
!	%l5 = 000000000000ff5f, immed = fffffb82, %l2 = 00000000ff0833b5
	orn	%l5,-0x47e,%l2		! %l2 = 000000000000ff7f

p3_label_113:
!	%f10 = 12d93726 808daef4, %f4  = fa779b48 008daef4
	fmovd	%f10,%f4 		! %f4  = 12d93726 808daef4
!	Mem[000000001c800090] = dfbed2a9, %l0 = 000000007fffacc5
	ldsha	[%i1+0x092]%asi,%l0	! %l0 = ffffffffffffd2a9
!	%l6 = fffffffffff50c80, immed = 000005d6, %l2 = 000000000000ff7f
	add	%l6,0x5d6,%l2		! %l2 = fffffffffff51256
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 1
!	Mem[000000001c800140] = ae832a4a, %l7 = 0000000000000057
	ldub	[%i1+0x142],%l7		! %l7 = 000000000000002a
p3_b130:

p3_label_114:
	membar	#Sync			! Added by membar checker (650)
!	%f9  = fa779b48, %f20 = f7df3fe0, %f20 = f7df3fe0
	fadds	%f9 ,%f20,%f20		! %f20 = fa7e9547
!	Mem[000000001c000000] = ff0001a9, %l6 = fffffffffff50c80
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff0001a9
	set	p3_b131,%o7
	fbne	p3_far_0_he	! Branch Taken, %fcc0 = 1
!	%l1 = ffffffffffffffcf, Mem[0000000031000070] = d5bbff1b74ffe1c2
	stx	%l1,[%o2+0x070]		! Mem[0000000031000070] = ffffffffffffffcf
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x083,%g2
p3_b131:
!	Registers modified during the branch to p3_far_0
!	%l1  = 00000000ffffffff
!	%l3  = 0018336d48397a1f
!	%l4  = 00000000007ffa89
	set	p3_b132,%o7
	fbul	p3_far_2_le	! Branch Taken, %fcc0 = 1

p3_label_115:
!	Mem[000000001d000008] = cf7ac740, %l3 = 0018336d48397a1f
	lduha	[%i2+%o6]0x80,%l3	! %l3 = 000000000000cf7a
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x084,%g2
p3_b132:
	membar	#Sync			! Added by membar checker (651)
!	%l7 = 000000000000002a, Mem[000000001c00005b] = 6434b31e
	stba	%l7,[%i0+0x05b]%asi	! Mem[000000001c000058] = 6434b32a
!	%f21 = 00000000, %f12 = 3f800000, %f17 = 00000000
	fadds	%f21,%f12,%f17		! %f17 = 3f800000
	fbe,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000001c800120] = 42b6c316 0000d4eb 26ff24e2 fdd9f7e0
	prefetch [%i1+0x120],0
p3_b133:

p3_label_116:
	bpos,a	p3_not_taken_0		! Branch Not Taken, %ccr = 0a
!	Mem[0000000032000000] = 00000000 0000015a e83b01bf 5e0357b7
	prefetch [%o4+0x000],16	! Annulled
p3_b134:
	membar	#Sync			! Added by membar checker (652)
!	%l0 = ffffffffffffd2a9, immed = 00000006, %l1 = 00000000ffffffff
	srax	%l0,0x006,%l1		! %l1 = ffffffffffffff4a
!	%f0  = fc0e1613 5a9c6e6a, %f16 = c74ef369 3f800000
	fcmped	%fcc0,%f0 ,%f16		! %fcc0 = 1
	nop				! Delay added due to fcmp
	set	p3_b135,%o7
	fbne,a,pn %fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 2

p3_label_117:
!	%l4 = 00000000007ffa89, Mem[000000001d800008] = 00000000
	stwa	%l4,[%i3+%o6]0x80	! Mem[000000001d800008] = 007ffa89
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x087,%g2
p3_b135:
!	Registers modified during the branch to p3_near_2
!	%l1  = 0000000000000000
!	%l5  = 0000000000001c0b
!	%l6  = 00000000000aeda9
	membar	#Sync			! Added by membar checker (653)
!	Mem[000000001c800000] = 647dd5e4 bcf63250, %l2 = fff51256, %l3 = 0000cf7a
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000647dd5e4 00000000bcf63250
	set	p3_b136,%o7
	fba,pt	%fcc2,p3_near_1_he	! Branch Taken, %fcc2 = 2
!	%l7 = 000000000000002a, Mem[000000001c800000] = 647dd5e4
	stwa	%l7,[%i1+%g0]0x80	! Mem[000000001c800000] = 0000002a
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x088,%g2
p3_b136:
!	Registers modified during the branch to p3_near_1
!	%l0  = 0000000000000000
!	%l3  = 018e77b2d32d35f4
!	%l5  = fffffffffffff4bf
!	%l6  = 0000000000000359
	membar	#Sync			! Added by membar checker (654)
!	%f12 = 3f800000, %f6  = c1962192
	fcmpes	%fcc3,%f12,%f6 		! %fcc3 = 2

p3_label_118:
	nop				! Delay added due to fcmp
	set	p3_b137,%o7
	fba,a,pn %fcc3,p3_near_3_he	! Branch Taken, %fcc3 = 2
!	Mem[000000001d000108] = a8918f6d, %l0 = 0000000000000000
	ldsw	[%i2+0x108],%l0		! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x089,%g2
p3_b137:
!	Registers modified during the branch to p3_near_3
!	%l5  = fffffffd2fc00000
	membar	#Sync			! Added by membar checker (655)
!	%f26 = 00000000 00000000, %f24 = 162de21c
	fxtos	%f26,%f24		! %f24 = 00000000
!	Branch On Register, %l4 = 00000000007ffa89
	brgez,pt %l4,p3_b138		! Branch Taken
!	Mem[000000001c800180] = fc00db09 f69245ee aa4887b4 7298f280
	prefetch [%i1+0x180],1
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x08a,%g2
p3_b138:

p3_label_119:
	membar	#Sync			! Added by membar checker (656)
!	Mem[0000000030000070] = 110b0488 5e3fbbdb, %l4 = 007ffa89, %l5 = 2fc00000
	ldda	[%o0+0x070]%asi,%l4	! %l4 = 00000000110b0488 000000005e3fbbdb
	set	p3_b139,%o7
	fbne	p3_far_3_he	! Branch Taken, %fcc0 = 1
!	Mem[000000001c0001c0] = bda2b4d4 3aa3259b 4cbdcd80 6a9131db
	prefetch [%i0+0x1c0],22
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x08b,%g2
p3_b139:
!	Registers modified during the branch to p3_far_3
!	%l0  = 000000005e3fbbdb
!	%l1  = 000000005e3fbbdb
!	%l4  = ffffffffffffffea
!	%l5  = fffffffffffff39d
!	%l6  = 00000000647dd93d
	membar	#Sync			! Added by membar checker (657)
!	Mem[000000001d8001c0] = e475ff3e 75ec989a 641575b3 ce4ebaa9
	prefetch [%i3+0x1c0],16
	set	p3_b140,%o7
	fbne,a,pt %fcc1,p3_near_2_le	! Branch Taken, %fcc1 = 2

p3_label_120:
!	Mem[000000001d000008] = cf7ac740, %l2 = 00000000647dd5e4
	swapa	[%i2+%o6]0x80,%l2	! %l2 = 00000000cf7ac740
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x08c,%g2
p3_b140:
!	Registers modified during the branch to p3_near_2
!	%l6  = 00000000443d9919
	ble,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l5 = fffffffffffff39d, Mem[000000001d000000] = ff00be6b
	stwa	%l5,[%i2+%g0]0x80	! Annulled
p3_b141:
	membar	#Sync			! Added by membar checker (658)
!	%f18 = ffffffff, %f26 = 00000000, %f29 = ee1c8376
	fmuls	%f18,%f26,%f29		! %f29 = ffffffff
!	Mem[0000000030000078] = 25c1170c, %l6 = 00000000443d9919
	ldsh	[%o0+0x07a],%l6		! %l6 = 000000000000170c

p3_label_121:
!	%f30 = fa779b48, %f13 = fa779b48
	fmovs	%f30,%f13		! %f13 = fa779b48
!	%l0 = 000000005e3fbbdb, %l2 = 00000000cf7ac740, %l5 = fffffffffffff39d
	sra	%l0,%l2,%l5		! %l5 = 000000005e3fbbdb
!	%l3 = 018e77b2d32d35f4, %l3 = 018e77b2d32d35f4, %l1 = 000000005e3fbbdb
	addccc	%l3,%l3,%l1		! %l1 = 031cef65a65a6be8, %ccr = 09
!	%f16 = c74ef369 3f800000, %f12 = 3f800000 fa779b48
	fmovd	%f16,%f12		! %f12 = c74ef369 3f800000
!	%l4 = ffffffffffffffea, Mem[000000001f000012] = 5a6c1344
	stb	%l4,[%i6+0x012]		! Mem[000000001f000010] = 5a6cea44

p3_label_122:
!	Mem[000000001d800060] = 0893fd65 2bb95de2 24c98188 aba2bfd5
	prefetch [%i3+0x060],1
!	%l0 = 000000005e3fbbdb, immed = 0000028d, %l3 = 018e77b2d32d35f4
	xnor	%l0,0x28d,%l3		! %l3 = ffffffffa1c046a9
!	%f15 = bf800000, %f0  = fc0e1613
	fstoi	%f15,%f0 		! %f0  = ffffffff
!	%l1 = 031cef65a65a6be8, %l7 = 000000000000002a, %y  = ffffffff
	udivcc	%l1,%l7,%l0		! %l0 = 00000000ffffffff, %ccr = 0a
!	%f25 = 77df3fe0, %f13 = 3f800000
	fcmpes	%fcc0,%f25,%f13		! %fcc0 = 2

p3_label_123:
!	Mem[000000001d800008] = 00000000, %l4 = ffffffffffffffea
	lduwa	[%i3+%o6]0x80,%l4	! %l4 = 0000000000000000
!	%l5 = 000000005e3fbbdb, %l6 = 000000000000170c, %y  = ffffffff
	mulx	%l5,%l6,%l0		! %l0 = 0000087c24dd7b44
	set	p3_b142,%o7
	fbo	p3_far_2_he	! Branch Taken, %fcc0 = 2
!	%l7 = 000000000000002a, Mem[0000000031800038] = 000001b9
	stw	%l7,[%o3+0x038]		! Mem[0000000031800038] = 0000002a
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x08e,%g2
p3_b142:
!	Registers modified during the branch to p3_far_2
!	%l5  = 000010f849baf688
!	%l7  = 00000000ff12c895
	membar	#Sync			! Added by membar checker (659)
!	Branch On Register, %l3 = ffffffffa1c046a9
	brz,pn	%l3,p3_not_taken_0	! Branch Not Taken

p3_label_124:
!	%l7 = 00000000ff12c895, Mem[000000001d000000] = ff00be6bb83e0bde
	stxa	%l7,[%i2+%g0]0x80	! Mem[000000001d000000] = 00000000ff12c895
p3_b143:
	ble	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d800000] = ffffffff, %l2 = 00000000cf7ac740
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffff
p3_b144:
	bg	p3_b145			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001e800000] = 095ac635, %l1 = 031cef65a65a6be8
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = 00000000095ac635
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x091,%g2
p3_b145:

p3_label_125:
	membar	#Sync			! Added by membar checker (660)
!	%l5 = 000010f849baf688, %l7 = 00000000ff12c895, %l1 = 00000000095ac635
	xnor	%l5,%l7,%l1		! %l1 = ffffef074957c1e2
	set	p3_b146,%o7
	fbge,pt	%fcc3,p3_near_1_le	! Branch Taken, %fcc3 = 2
!	Mem[000000001c800000] = 0000002a, %l7 = 00000000ff12c895
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 000000000000002a
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x092,%g2
p3_b146:
!	Registers modified during the branch to p3_near_1
!	%l3  = 0000000000000076
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (661)
!	%l1 = ffffef074957c1e2, immed = 00000023, %l0 = 0000087c24dd7b44
	srlx	%l1,0x023,%l0		! %l0 = 000000001ffffde0
	ble,a	p3_b147			! Branch Taken, %ccr = 44, CWP = 0

p3_label_126:
!	Mem[000000001c800000] = ff12c895 bcf63250, %l6 = 0000170c, %l7 = 00000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff12c895 00000000bcf63250
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x093,%g2
p3_b147:
	ba	p3_b148			! Branch Taken, %ccr = 44, CWP = 0
!	Mem[000000001d800008] = 00000000, %l3 = 0000000000000076
	lduha	[%i3+%o6]0x80,%l3	! %l3 = 0000000000000000
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x094,%g2
p3_b148:
	set	p3_b149,%o7
	fba,a	p3_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001c000160] = 06b90f2a 5e591375 02278c73 6afc1af3
	prefetch [%i0+0x160],21	! Annulled
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x095,%g2
p3_b149:
!	Registers modified during the branch to p3_far_0
!	%l2  = ffffef07b6450977
!	%l4  = 96fde27235f46aa8

p3_label_127:
	membar	#Sync			! Added by membar checker (662)
!	%l6 = 00000000ff12c895, immed = fffff369, %l4 = 96fde27235f46aa8
	add	%l6,-0xc97,%l4		! %l4 = 00000000ff12bbfe
	fble,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001d000058] = eb9150ab51313b7f, %l7 = 00000000bcf63250
	ldx	[%i2+0x058],%l7		! Annulled
p3_b150:
	membar	#Sync			! Added by membar checker (663)
!	Mem[000000004000003c] = 1e0fff08, %l0 = 000000001ffffde0
	lduha	[%o5+0x03e]%asi,%l0	! %l0 = 000000000000ff08
!	%f24 = 00000000 77df3fe0, %f28 = 29977c25 ffffffff
	fnegd	%f24,%f28		! %f28 = 80000000 77df3fe0

p3_label_128:
!	Mem[000000001d800008] = 00000000, %l6 = 00000000ff12c895
	ldsba	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000000
	set	p3_b151,%o7
	fbug,a,pt %fcc1,p3_near_2_le	! Branch Taken, %fcc1 = 2
!	Mem[000000001c800000] = ff12c895 bcf63250, %l2 = b6450977, %l3 = 00000000
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff12c895 00000000bcf63250
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x097,%g2
p3_b151:
!	Registers modified during the branch to p3_near_2
!	%l6  = 0000000000000000
	set	p3_b152,%o7
	fblg	p3_far_0_he	! Branch Taken, %fcc0 = 2
!	%l4 = 00000000ff12bbfe, Mem[0000000031000030] = e072451c
	stw	%l4,[%o2+0x030]		! Mem[0000000031000030] = ff12bbfe
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x098,%g2
p3_b152:
!	Registers modified during the branch to p3_far_0
!	%l1  = 00000000ffffffff
!	%l3  = 0000000000000018
!	%l4  = 00000000ff12c895

p3_label_129:
	membar	#Sync			! Added by membar checker (664)
!	Mem[000000001c800080] = 0ac86910 9b269f5a bf2e6398 84dc2002
	prefetcha [%i1+0x080]%asi,2
!	Denormal Floating Point Operation Nullified
	nop
!	%f27 = 00000000, %f6  = c1962192, %f3  = 808daef4
	fmuls	%f27,%f6 ,%f3 		! %f3  = 80000000
!	%l5 = 000010f849baf688, Mem[0000000032000018] = efcb548a009fb442
	stx	%l5,[%o4+0x018]		! Mem[0000000032000018] = 000010f849baf688
!	%l5 = 000010f849baf688, Mem[000000001d000000] = 00000000
	stwa	%l5,[%i2+%g0]0x80	! Mem[000000001d000000] = 49baf688

p3_label_130:
!	%f11 = 808daef4, %f18 = ffffffff, %f14 = 7fffffff bf800000
	fsmuld	%f11,%f18,%f14		! %f14 = ffffffff e0000000
!	%f12 = c74ef369 3f800000, %f6  = c1962192 e0000000
	fabsd	%f12,%f6 		! %f6  = 474ef369 3f800000
!	Mem[000000003100003c] = 2557ff89, %l4 = ff12c895, %l2 = ff12c895
	add	%o2,0x3c,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 000000002557ff89
!	Mem[000000001c000180] = ee7a5787, %l0 = 000000000000ff08
	lduba	[%i0+0x180]%asi,%l0	! %l0 = 00000000000000ee
!	%l5 = 000010f849baf688, Mem[000000001c000000] = fff50c80
	stwa	%l5,[%i0+%g0]0x80	! Mem[000000001c000000] = 49baf688

p3_label_131:
!	%l4 = 00000000ff12c895, %l3 = 0000000000000018, %l0 = 00000000000000ee
	srl	%l4,%l3,%l0		! %l0 = 00000000000000ff
	bgu,a	p3_b153			! Branch Taken, %ccr = 0a, CWP = 0
!	%l0 = 000000ff, %l1 = ffffffff, Mem[0000000031800030] = a2347a89 700d8f29
	std	%l0,[%o3+0x030]	! Mem[0000000031800030] = 000000ff ffffffff
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x099,%g2
p3_b153:
	membar	#Sync			! Added by membar checker (665)
!	Mem[000000001c800160] = 7f66aa3f cb12c091 9e83f601 a8281992
	prefetch [%i1+0x160],3
!	Mem[000000001c0000a0] = c9c4ab9a 75779cf6 0d015704 5c82b607
	prefetch [%i0+0x0a0],16

p3_label_132:
	fbule,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 2
!	Mem[000000001d0001c0] = 39c63a2a 3e00648b d6e00cca 2e6498ac
	prefetch [%i2+0x1c0],0	! Annulled
p3_b154:
	membar	#Sync			! Added by membar checker (666)
!	%l0 = 00000000000000ff, %l4 = 00000000ff12c895, %l0 = 00000000000000ff
	subccc	%l0,%l4,%l0		! %l0 = ffffffff00ed386a, %ccr = 91
	bge,a	p3_b155			! Branch Taken, %ccr = 91, CWP = 0
!	%l1 = 00000000ffffffff, Mem[000000001c000000] = 49baf688
	stba	%l1,[%i0+%g0]0x80	! Mem[000000001c000000] = ffbaf688
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x09b,%g2
p3_b155:

p3_label_133:
	membar	#Sync			! Added by membar checker (667)
	fbe,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001c800008] = d4eae157, %l3 = 0000000000000018
	lduwa	[%i1+%o6]0x80,%l3	! Annulled
p3_b156:
	membar	#Sync			! Added by membar checker (668)
!	Mem[0000000030000074] = 5e3fbbdb, %l0 = ffffffff00ed386a
	lduha	[%o0+0x074]%asi,%l0	! %l0 = 0000000000005e3f
	set	p3_b157,%o7
	fbge,pn	%fcc3,p3_near_2_he	! Branch Taken, %fcc3 = 2
!	Mem[000000001d000008] = 647dd5e4, %l7 = 00000000bcf63250
	ldsba	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000064
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x09d,%g2
p3_b157:
!	Registers modified during the branch to p3_near_2
!	%l1  = 0000000000000000
!	%l5  = 0000000000001c0b
!	%l6  = ffffffffdaa80076

p3_label_134:
	membar	#Sync			! Added by membar checker (669)
	fbul,pt	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000001d000008] = 647dd5e4fffff495, %l5 = 0000000000001c0b
	ldxa	[%i2+%o6]0x80,%l5	! %l5 = 647dd5e4fffff495
p3_b158:
	membar	#Sync			! Added by membar checker (670)
!	Mem[000000001c800000] = ff12c895, %l3 = 0000000000000018
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffff12
!	%f14 = ffffffff, %f31 = ccb10c97
	fcmps	%fcc3,%f14,%f31		! %fcc3 = 3
!	%l4 = 00000000ff12c895, immed = fffff993, %y  = ffffffff
	udiv	%l4,-0x66d,%l7		! %l7 = 00000000ffffffff

p3_label_135:
!	Branch On Register, %l3 = ffffffffffffff12
	brlez,pt %l3,p3_b159		! Branch Taken
!	Mem[0000000030800038] = b83e0288 0058c159, %l0 = 00005e3f, %l1 = 00000000
	ldd	[%o1+0x038],%l0		! %l0 = 00000000b83e0288 000000000058c159
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x09f,%g2
p3_b159:
	membar	#Sync			! Added by membar checker (671)
!	Mem[000000001c000008] = ff0833b5, %l5 = 647dd5e4fffff495
	swapa	[%i0+%o6]0x80,%l5	! %l5 = 00000000ff0833b5
!	Mem[000000001c80000c] = 5ad1afca, %l3 = ffffffffffffff12
	lduw	[%i1+0x00c],%l3		! %l3 = 000000005ad1afca
!	%f26 = 00000000, %f9  = fa779b48
	fcmpes	%fcc1,%f26,%f9 		! %fcc1 = 2

p3_label_136:
!	%l2 = 000000002557ff89, %l1 = 000000000058c159, %l1 = 000000000058c159
	or	%l2,%l1,%l1		! %l1 = 00000000255fffd9
	bpos,a	p3_b160			! Branch Taken, %ccr = 91, CWP = 0
!	Mem[000000001c000000] = ffbaf688 5dfffae1, %l2 = 2557ff89, %l3 = 5ad1afca
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffbaf688 000000005dfffae1
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x0a0,%g2
p3_b160:
	membar	#Sync			! Added by membar checker (672)
!	Mem[0000000030800034] = 01a99652, %l6 = ffffffffdaa80076
	swap	[%o1+0x034],%l6		! %l6 = 0000000001a99652
!	Branch On Register, %l7 = 00000000ffffffff
	brgz,pt	%l7,p3_b161		! Branch Taken

p3_label_137:
!	Mem[000000001c000008] = fffff495, %l6 = 0000000001a99652
	ldstuba	[%i0+%o6]0x80,%l6	! %l6 = 00000000000000ff
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x0a1,%g2
p3_b161:
	membar	#Sync			! Added by membar checker (673)
!	%l1 = 00000000255fffd9, %l5 = 00000000ff0833b5, %l2 = 00000000ffbaf688
	addccc	%l1,%l5,%l2		! %l2 = 000000012468338f, %ccr = 01
!	Mem[000000001d80006c] = aba2bfd5, %l1 = 00000000255fffd9
	ldswa	[%i3+0x06c]%asi,%l1	! %l1 = ffffffffaba2bfd5
!	Mem[000000001c000000] = ffbaf688, %l6 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
	fbg,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 3

p3_label_138:
!	%l0 = 00000000b83e0288, Mem[000000001c000068] = 082f8deeb9511342
	stx	%l0,[%i0+0x068]		! Annulled
p3_b162:
	membar	#Sync			! Added by membar checker (674)
!	%l6 = 00000000000000ff, Mem[000000001c8001bc] = 95f77ac5
	sth	%l6,[%i1+0x1bc]		! Mem[000000001c8001bc] = 00ff7ac5
!	%l4 = 00000000ff12c895
	setx	0xe27e2e4be27e2e4b,%g7,%l4 ! %l4 = e27e2e4be27e2e4b
!	Mem[0000000031000034] = 479deace, %l7 = 00000000ffffffff
	ldub	[%o2+0x035],%l7		! %l7 = 000000000000009d
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 91eefd1b d7059b63
	prefetch [%o4+0x020],21

p3_label_139:
!	%f14 = ffffffff, %f30 = fa779b48, %f22 = 5a9c6e6a
	fmuls	%f14,%f30,%f22		! %f22 = ffffffff
!	Mem[000000001d800000] = ffffffff1e0fff08, %l6 = 00000000000000ff
	ldxa	[%i3+%g0]0x80,%l6	! %l6 = ffffffff1e0fff08
	ble	p3_not_taken_0		! Branch Not Taken, %ccr = 01
!	Mem[000000001d800008] = 00000000, %l5 = 00000000ff0833b5
	swapa	[%i3+%o6]0x80,%l5	! %l5 = 0000000000000000
p3_b163:
	membar	#Sync			! Added by membar checker (675)
!	Mem[000000001d000000] = 49baf688, %l6 = ffffffff1e0fff08
	lduwa	[%i2+%g0]0x80,%l6	! %l6 = 0000000049baf688

p3_label_140:
!	%l2 = 000000012468338f, %l5 = 0000000000000000, %l4 = e27e2e4be27e2e4b
	sub	%l2,%l5,%l4		! %l4 = 000000012468338f
!	%l7 = 000000000000009d, Mem[000000001d0001f0] = 264ceef88461cd3f
	stxa	%l7,[%i2+0x1f0]%asi	! Mem[000000001d0001f0] = 000000000000009d
!	%l6 = 0000000049baf688, %l4 = 000000012468338f, %l5 = 0000000000000000
	addcc	%l6,%l4,%l5		! %l5 = 000000016e232a17, %ccr = 00
!	%f26 = 00000000 00000000, %f15 = e0000000
	fxtos	%f26,%f15		! %f15 = 00000000
!	Mem[000000004000003c] = 1e0fff08, %l0 = 00000000b83e0288
	lduh	[%o5+0x03e],%l0		! %l0 = 000000000000ff08

p3_label_141:
!	%l5 = 000000016e232a17, immed = 000005a0, %l6 = 0000000049baf688
	tsubcc	%l5,0x5a0,%l6		! %l6 = 000000016e232477, %ccr = 02
!	%f15 = 00000000, %f12 = c74ef369 3f800000
	fstod	%f15,%f12		! %f12 = 00000000 00000000
!	Branch On Register, %l0 = 000000000000ff08
	brgz,a,pn %l0,p3_b164		! Branch Taken
!	Mem[000000001d0001c0] = 39c63a2a 3e00648b, %l6 = 6e232477, %l7 = 0000009d
	ldd	[%i2+0x1c0],%l6		! %l6 = 0000000039c63a2a 000000003e00648b
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x0a4,%g2
p3_b164:
	set	p3_b165,%o7
	fbuge	p3_far_3_le	! Branch Taken, %fcc0 = 2

p3_label_142:
!	Mem[000000001d000000] = 49baf688 ff12c895 647dd5e4 fffff495
	prefetch [%i2+0x000],16
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x0a5,%g2
p3_b165:
!	Registers modified during the branch to p3_far_3
!	%l1  = 00000001246834e4
	membar	#Sync			! Added by membar checker (676)
!	%f13 = 00000000, %f26 = 00000000
	fitos	%f13,%f26		! %f26 = 00000000
!	%l0 = 000000000000ff08, %l5 = 000000016e232a17, %y  = ffffffff
	udivx	%l0,%l5,%l7		! %l7 = 0000000000000000
!	Mem[000000001c000000] = ffbaf688 5dfffae1 fffff495 e37995fa
	prefetch [%i0+0x000],23
!	%l5 = 000000016e232a17, %l3 = 000000005dfffae1, %l7 = 0000000000000000
	tsubcc	%l5,%l3,%l7		! %l7 = 0000000110232f36, %ccr = 02

p3_label_143:
	bl,a	p3_b166			! Branch Taken, %ccr = 02, CWP = 0
!	%l2 = 000000012468338f, Mem[000000001d0001ec] = 5538125d
	stw	%l2,[%i2+0x1ec]		! Mem[000000001d0001ec] = 2468338f
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x0a6,%g2
p3_b166:
	membar	#Sync			! Added by membar checker (677)
	fbul,pn	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c000008] = fffff495, %l4 = 000000012468338f
	ldswa	[%i0+%o6]0x80,%l4	! %l4 = fffffffffffff495
p3_b167:
	membar	#Sync			! Added by membar checker (678)
!	Mem[000000004000003c] = 1e0fff08, %l7 = 0000000110232f36
	ldswa	[%o5+0x03c]%asi,%l7	! %l7 = 000000001e0fff08

p3_label_144:
!	%l5 = 000000016e232a17, Mem[000000001e000000] = 5ccf996c4e453ef0
	stxa	%l5,[%i4+%g0]0x80	! Mem[000000001e000000] = 000000016e232a17
	fbu,pt	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 2
!	Mem[000000001d000000] = 49baf688, %l2 = 000000012468338f
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 0000000049baf688
p3_b168:
	membar	#Sync			! Added by membar checker (679)
!	%f13 = 00000000, %f16 = c74ef369
	fabss	%f13,%f16		! %f16 = 00000000
!	Mem[000000001e8000c0] = 92651071 4a3d7118 8cfc62be cf52b7f7
	prefetcha [%i5+0x0c0]%asi,16

p3_label_145:
!	Mem[000000001c800034] = b46bcfae, %l6 = 0000000039c63a2a
	ldsh	[%i1+0x036],%l6		! %l6 = ffffffffffffcfae
!	Branch On Register, %l7 = 000000001e0fff08
	brlz,a,pt %l7,p3_not_taken_0	! Branch Not Taken
!	%l3 = 000000005dfffae1, Mem[000000003200003c] = a263dc09
	stw	%l3,[%o4+0x03c]		! Annulled
p3_b169:
	membar	#Sync			! Added by membar checker (680)
!	Mem[0000000030000074] = 5e3fbbdb, %l3 = 000000005dfffae1
	lduh	[%o0+0x076],%l3		! %l3 = 000000000000bbdb
!	Mem[000000001d0000a0] = 58d48484 9dcd222c 14093715 7640ea3c
	prefetch [%i2+0x0a0],20

p3_label_146:
!	Mem[000000001d000075] = 4c711857, %l6 = ffffffffffffcfae
	ldstub	[%i2+0x075],%l6		! %l6 = 0000000000000071
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 02
!	%l1 = 00000001246834e4, Mem[000000001c800118] = 82d3393e
	stw	%l1,[%i1+0x118]		! Annulled
p3_b170:
	fbu	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c000140] = e23c050b 384e8ca6 085f080a 88ad8fce
	prefetch [%i0+0x140],22
p3_b171:

p3_label_147:
	membar	#Sync			! Added by membar checker (681)
!	%l0 = 000000000000ff08, immed = fffffa3c, %y  = ffffffff
	sdivcc	%l0,-0x5c4,%l3		! %l3 = 00000000002c6681, %ccr = 00
	bleu	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[0000000031800038] = 0000002a, %l4 = fffffffffffff495
	ldsw	[%o3+0x038],%l4		! %l4 = 000000000000002a
p3_b172:
	bcc	p3_b173			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001c000008] = fffff495e37995fa, %l0 = 000000000000ff08
	ldxa	[%i0+%o6]0x80,%l0	! %l0 = fffff495e37995fa
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x0ad,%g2
p3_b173:

p3_label_148:
	membar	#Sync			! Added by membar checker (682)
	set	p3_b174,%o7
	fbg,a,pt %fcc0,p3_near_0_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001d000008] = 647dd5e4, %l7 = 000000001e0fff08
	lduba	[%i2+%o6]0x80,%l7	! %l7 = 0000000000000064
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x0ae,%g2
p3_b174:
!	Registers modified during the branch to p3_near_0
!	%l3  = 0000000049e75d09
!	%l5  = fffffffffffd9944
	membar	#Sync			! Added by membar checker (683)
!	%l2 = 0000000049baf688, Mem[0000000030800070] = 13e888ffffffffff
	stxa	%l2,[%o1+0x070]%asi	! Mem[0000000030800070] = 0000000049baf688
!	%f16 = 00000000, %f9  = fa779b48, %f23 = fa779b48
	fdivs	%f16,%f9 ,%f23		! %f23 = 80000000
	bneg	p3_b175			! Branch Taken, %ccr = 88, CWP = 0

p3_label_149:
!	Mem[000000001d800000] = ffffffff, %l7 = 0000000000000064
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0af,%g2
p3_b175:
	membar	#Sync			! Added by membar checker (684)
!	Mem[000000001c000000] = ffbaf688, %l7 = 00000000000000ff
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffff
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d800008] = ff0833b5, %l4 = 000000000000002a
	ldsba	[%i3+%o6]0x80,%l4	! Annulled
p3_b176:
	membar	#Sync			! Added by membar checker (685)
!	%l4 = 000000000000002a, Mem[000000001d800008] = ff0833b50000002a
	stxa	%l4,[%i3+%o6]0x80	! Mem[000000001d800008] = 000000000000002a

p3_label_150:
	be,a	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[0000000031800034] = ffffffff, %l1 = 00000001246834e4
	ldsw	[%o3+0x034],%l1		! Annulled
p3_b177:
	membar	#Sync			! Added by membar checker (686)
!	%l5 = fffffffffffd9944, Mem[0000000031800030] = 000000ffffffffff
	stxa	%l5,[%o3+0x030]%asi	! Mem[0000000031800030] = fffffffffffd9944
	set	p3_b178,%o7
	fbne	p3_far_1_le	! Branch Taken, %fcc0 = 2
!	%l6 = 0000000000000071, Mem[000000001c800000] = ff12c895
	stba	%l6,[%i1+%g0]0x80	! Mem[000000001c800000] = 7112c895
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x0b2,%g2
p3_b178:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = ffffffffb7946891
!	%l5  = 00000000014f5f19

p3_label_151:
	membar	#Sync			! Added by membar checker (687)
!	%l7 = ffffffffffffffff, %l5 = 00000000014f5f19, %l4 = 000000000000002a
	orcc	%l7,%l5,%l4		! %l4 = ffffffffffffffff, %ccr = 88
!	%l7 = ffffffffffffffff, immed = 00000e46, %l5 = 00000000014f5f19
	orncc	%l7,0xe46,%l5		! %l5 = ffffffffffffffff, %ccr = 88
!	Mem[000000001d800140] = 0000ff08 13fd2cd2 6965fcaf eebf6ea1
	prefetcha [%i3+0x140]%asi,2
!	%f12 = 00000000, %f13 = 00000000
	fcmps	%fcc1,%f12,%f13		! %fcc1 = 0
!	%l0 = 0000000000007fb1, %l1 = ffffffffb7946891, %l3 = 0000000049e75d09
	subc	%l0,%l1,%l3		! %l3 = 00000000486c1720

p3_label_152:
!	%l0 = 0000000000007fb1, Mem[0000000032000044] = c2a2c541
	stha	%l0,[%o4+0x044]%asi	! Mem[0000000032000044] = 7fb1c541
	fbe,a,pn %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[000000001d800008] = 00000000, %l1 = ffffffffb7946891
	ldstuba	[%i3+%o6]0x80,%l1	! Annulled
p3_b179:
	membar	#Sync			! Added by membar checker (688)
!	Mem[000000001d800000] = ffffffff 1e0fff08, %l0 = 00007fb1, %l1 = b7946891
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffffffff 000000001e0fff08
	fbg,pn	%fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0

p3_label_153:
!	%l7 = ffffffffffffffff, Mem[000000001d0001c0] = 39c63a2a
	stw	%l7,[%i2+0x1c0]		! Mem[000000001d0001c0] = ffffffff
p3_b180:
	bgu	p3_b181			! Branch Taken, %ccr = 88, CWP = 0
!	Mem[000000001c00006c] = b9511342, %l4 = ffffffffffffffff
	swap	[%i0+0x06c],%l4		! %l4 = 00000000b9511342
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x0b5,%g2
p3_b181:
	membar	#Sync			! Added by membar checker (689)
!	%f18 = ffffffff fa779b48, %f14 = ffffffff 00000000
	fmovd	%f18,%f14		! %f14 = ffffffff fa779b48
!	Mem[000000001d800184] = 45902f32, %l4 = 00000000b9511342
	lduha	[%i3+0x186]%asi,%l4	! %l4 = 0000000000002f32

p3_label_154:
!	%l6 = 00000071, %l7 = ffffffff, Mem[0000000030000030] = ff12c895 8664a71a
	std	%l6,[%o0+0x030]	! Mem[0000000030000030] = 00000071 ffffffff
!	%l5 = ffffffffffffffff, Mem[000000001e0001be] = 5b1bf7c6
	stha	%l5,[%i4+0x1be]%asi	! Mem[000000001e0001bc] = 5b1bffff
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	Mem[000000001d0001e0] = e7087101 7f2f4406 fbc2c967 2468338f
	prefetch [%i2+0x1e0],0
p3_b182:
	membar	#Sync			! Added by membar checker (690)
!	%l5 = ffffffffffffffff, immed = 000003f5, %y  = 00000000
	mulx	%l5,0x3f5,%l3		! %l3 = fffffffffffffc0b

p3_label_155:
!	Mem[000000001c00002c] = ffffd4ea, %l1 = 000000001e0fff08
	ldsh	[%i0+0x02c],%l1		! %l1 = ffffffffffffffff
!	Mem[000000001d8001c8] = 641575b3 ce4ebaa9, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i3+0x1c8]%asi,%l0	! %l0 = 00000000641575b3 00000000ce4ebaa9
!	%l4 = 0000000000002f32, Mem[0000000030800070] = 0000000049baf688
	stx	%l4,[%o1+0x070]		! Mem[0000000030800070] = 0000000000002f32
!	Mem[0000000032000078] = 57fa95466cb174b6, %l3 = fffffffffffffc0b
	ldxa	[%o4+0x078]%asi,%g2	! %g2 = 57fa95466cb174b6
!	%l4 = 0000000000002f32, Mem[0000000032000040] = ba91c68a7fb1c541
	stxa	%l4,[%o4+0x040]%asi	! Mem[0000000032000040] = 0000000000002f32

p3_label_156:
!	%l7 = ffffffffffffffff, %l4 = 0000000000002f32, %l6 = 0000000000000071
	xor	%l7,%l4,%l6		! %l6 = ffffffffffffd0cd
!	Mem[000000001c8000d8] = 5ec69d1b, %l2 = 0000000049baf688
	ldsba	[%i1+0x0da]%asi,%l2	! %l2 = ffffffffffffff9d
!	Branch On Register, %l2 = ffffffffffffff9d
	brz,pt	%l2,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d000008] = 647dd5e4, %l5 = ffffffffffffffff
	ldsba	[%i2+%o6]0x80,%l5	! %l5 = 0000000000000064
p3_b183:
	membar	#Sync			! Added by membar checker (691)
!	Mem[000000001e8000d8] = e09ab0cab67217a7, %l0 = 00000000641575b3
	ldxa	[%i5+0x0d8]%asi,%l0	! %l0 = e09ab0cab67217a7

p3_label_157:
	fbl,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000031000074] = ffffffcf, %l6 = ffffffffffffd0cd
	ldsh	[%o2+0x076],%l6		! Annulled
p3_b184:
	membar	#Sync			! Added by membar checker (692)
!	Mem[000000001d0000e8] = 5aa68401 be1747ff, %l0 = b67217a7, %l1 = ce4ebaa9
	ldd	[%i2+0x0e8],%l0		! %l0 = 000000005aa68401 00000000be1747ff
	bge	p3_not_taken_0		! Branch Not Taken, %ccr = 88
!	%l5 = 0000000000000064, Mem[000000001d800008] = 00000000
	stwa	%l5,[%i3+%o6]0x80	! Mem[000000001d800008] = 00000064
p3_b185:

p3_label_158:
	membar	#Sync			! Added by membar checker (693)
!	%f20 = fa7e9547, %f6  = 474ef369
	fmovs	%f20,%f6 		! %f6  = fa7e9547
!	%l6 = ffffffffffffd0cd, immed = fffff1a6, %l1 = 00000000be1747ff
	xorcc	%l6,-0xe5a,%l1		! %l1 = 000000000000216b, %ccr = 00
!	Mem[000000001d800140] = 0000ff08 13fd2cd2 6965fcaf eebf6ea1
	prefetcha [%i3+0x140]%asi,23
	bne	p3_b186			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001d800008] = 00000064 0000002a, %l6 = ffffd0cd, %l7 = ffffffff
	ldda	[%i3+%o6]0x80,%l6	! %l6 = 0000000000000064 000000000000002a
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x0ba,%g2
p3_b186:

p3_label_159:
	membar	#Sync			! Added by membar checker (694)
!	Denormal Floating Point Operation Nullified
	nop
!	%l2 = ffffffffffffff9d, immed = fffff794, %l3 = fffffffffffffc0b
	addcc	%l2,-0x86c,%l3		! %l3 = fffffffffffff731, %ccr = 99
	bneg,a	p3_b187			! Branch Taken, %ccr = 99, CWP = 0
!	Mem[000000001c800000] = 7112c895, %l7 = 000000000000002a
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 000000007112c895
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x0bb,%g2
p3_b187:
	membar	#Sync			! Added by membar checker (695)
!	Mem[000000001c000080] = 92456920 c460058d 8fc46e9e 0dd8d8d1
	prefetcha [%i0+0x080]%asi,0

p3_label_160:
!	Mem[000000001d000000] = 49baf688, %l3 = fffffffffffff731
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000049
!	Mem[000000001d000000] = ffbaf688 ff12c895, %l4 = 00002f32, %l5 = 00000064
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ffbaf688 00000000ff12c895
	fbe	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000031000034] = 479deace, %l4 = 00000000ffbaf688
	ldsw	[%o2+0x034],%l4		! %l4 = 00000000479deace
p3_b188:
	membar	#Sync			! Added by membar checker (696)
	set	p3_b189,%o7
	fbg,pn	%fcc0,p3_near_0_he	! Branch Taken, %fcc0 = 2

p3_label_161:
!	%l5 = 00000000ff12c895, Mem[000000001c000000] = ffbaf688
	stba	%l5,[%i0+%g0]0x80	! Mem[000000001c000000] = 95baf688
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x0bd,%g2
p3_b189:
!	Registers modified during the branch to p3_near_0
!	%l2  = 000000000000216b
!	%l3  = 00000000000021b4
!	%l4  = 00000063fffab1cc
!	%l7  = 0000000000000000
	membar	#Sync			! Added by membar checker (697)
	set	p3_b190,%o7
	fbug,a,pt %fcc0,p3_near_3_he	! Branch Taken, %fcc0 = 2
!	Mem[000000001c800000] = 0000002a, %l0 = 000000005aa68401
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 000000000000002a
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x0be,%g2
p3_b190:
!	Registers modified during the branch to p3_near_3
!	%l5  = 003fc4b225400000
	membar	#Sync			! Added by membar checker (698)
!	%l5 = 003fc4b225400000, immed = fffff34f, %l6 = 0000000000000064
	xnorcc	%l5,-0xcb1,%l6		! %l6 = 003fc4b225400cb0, %ccr = 00
!	%f17 = 3f800000, %f24 = 00000000
	fstoi	%f17,%f24		! %f24 = 00000001

p3_label_162:
!	Mem[000000001d000108] = a8918f6d, %l5 = 003fc4b225400000
	lduba	[%i2+0x109]%asi,%l5	! %l5 = 0000000000000091
	fbl	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[0000000031800078] = 7ba5fd7a, %l7 = 0000000000000000
	ldstub	[%o3+0x078],%l7		! %l7 = 000000000000007b
p3_b191:
	membar	#Sync			! Added by membar checker (699)
!	%l0 = 000000000000002a, Mem[0000000032000028] = 91eefd1bd7059b63
	stxa	%l0,[%o4+0x028]%asi	! Mem[0000000032000028] = 000000000000002a
!	%l2 = 000000000000216b, Mem[000000001c000098] = e32302159b946b9d
	stxa	%l2,[%i0+0x098]%asi	! Mem[000000001c000098] = 000000000000216b

p3_label_163:
!	Mem[000000001c000160] = 06b90f2a 5e591375 02278c73 6afc1af3
	prefetcha [%i0+0x160]%asi,23
!	Mem[000000001c800000] = 0000002a, %l4 = 00000063fffab1cc
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 000000000000002a
!	Mem[000000001c800008] = d4eae157, %l5 = 0000000000000091
	ldswa	[%i1+%o6]0x80,%l5	! %l5 = ffffffffd4eae157
!	Branch On Register, %l7 = 000000000000007b
	brgez,pt %l7,p3_b192		! Branch Taken
!	Mem[000000001d000000] = ffbaf688, %l7 = 000000000000007b
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 000000000000ffba
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x0c0,%g2
p3_b192:

p3_label_164:
	set	p3_b193,%o7
	fbuge,a	p3_far_0_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001c000140] = e23c050b 384e8ca6 085f080a 88ad8fce
	prefetch [%i0+0x140],20
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x0c1,%g2
p3_b193:
!	Registers modified during the branch to p3_far_0
!	%l2  = 000000002b151eaa
!	%l4  = 96fde27235f46aa8
	membar	#Sync			! Added by membar checker (700)
!	%l6 = 003fc4b225400cb0, Mem[000000001c800010] = b1c724d2d3eb4b1d
	stx	%l6,[%i1+0x010]		! Mem[000000001c800010] = 003fc4b225400cb0
!	Mem[000000001c000080] = 92456920 c460058d 8fc46e9e 0dd8d8d1
	prefetch [%i0+0x080],2
!	Mem[000000001d800008] = 00000000, %l7 = 000000000000ffba
	lduba	[%i3+%o6]0x80,%l7	! %l7 = 0000000000000000

p3_label_165:
	ba	p3_b194			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000001e800008] = e783b9cc, %l1 = 000000000000216b
	ldsha	[%i5+%o6]0x80,%l1	! %l1 = ffffffffffffe783
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0c2,%g2
p3_b194:
	membar	#Sync			! Added by membar checker (701)
!	%l5 = ffffffffd4eae157, %l0 = 000000000000002a, %l3 = 00000000000021b4
	orn	%l5,%l0,%l3		! %l3 = ffffffffffffffd7
	set	p3_b195,%o7
	fbg,a	p3_far_0_le	! Branch Taken, %fcc0 = 2
!	%l4 = 96fde27235f46aa8, Mem[000000001d000008] = 647dd5e4
	stha	%l4,[%i2+%o6]0x80	! Mem[000000001d000008] = 6aa8d5e4
!	The following code should not be executed
	nop
	nop
	fbo	p0_not_taken_0
	fmuld	%f24,%f24,%f26
	fblg	p0_not_taken_0
	ba	p3_branch_failed
	mov	0x0c3,%g2
p3_b195:
!	Registers modified during the branch to p3_far_0
!	%l2  = 96fde2723ff57ea8
!	%l4  = 96fde27235f46aa8

p3_label_166:
	fbule,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l2 = 3ff57ea8, %l3 = ffffffd7, Mem[000000001d800008] = 00000000 00000000
	stda	%l2,[%i3+%o6]0x80	! Annulled
p3_b196:
	membar	#Sync			! Added by membar checker (702)
!	%f6  = fa7e9547, %f4  = 12d93726
	fabss	%f6 ,%f4 		! %f4  = 7a7e9547
!	%l4 = 96fde27235f46aa8, %l7 = 0000000000000000, %l6 = 003fc4b225400cb0
	orncc	%l4,%l7,%l6		! %l6 = ffffffffffffffff, %ccr = 88
!	%l4 = 96fde27235f46aa8, immed = 00000369, %l3 = ffffffffffffffd7
	sub	%l4,0x369,%l3		! %l3 = 96fde27235f4673f

p3_label_167:
	bvc,a	p3_b197			! Branch Taken, %ccr = 88, CWP = 0
!	%l1 = ffffffffffffe783, Mem[000000001c800000] = fffab1cc
	stha	%l1,[%i1+%g0]0x80	! Mem[000000001c800000] = e783b1cc
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x0c5,%g2
p3_b197:
	membar	#Sync			! Added by membar checker (703)
!	%l5 = ffffffffd4eae157, Mem[0000000030000070] = 110b0488
	stba	%l5,[%o0+0x070]%asi	! Mem[0000000030000070] = 570b0488
	fbule	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l0 = 0000002a, %l1 = ffffe783, Mem[000000001d000000] = ffbaf688 ff12c895
	stda	%l0,[%i2+%g0]0x80	! Mem[000000001d000000] = 0000002a ffffe783
p3_b198:

p3_label_168:
	membar	#Sync			! Added by membar checker (704)
!	%f13 = 00000000, %f19 = fa779b48
	fitos	%f13,%f19		! %f19 = 00000000
!	Mem[0000000032000020] = 0d6df8b2 6a4ec5f4 00000000 0000002a
	prefetch [%o4+0x020],0
!	%l0 = 000000000000002a, Mem[000000001c000020] = d5ce3bb4
	stwa	%l0,[%i0+0x020]%asi	! Mem[000000001c000020] = 0000002a
!	Mem[000000001e8001c0] = 3b05a297 b8f601d1 1a4b2e80 12ef3ff0
	prefetch [%i5+0x1c0],16
!	%f13 = 00000000, %f8  = 00000001
	fitos	%f13,%f8 		! %f8  = 00000000

p3_label_169:
!	%l4 = 96fde27235f46aa8, Mem[0000000031000078] = 96fde27235f46aa8
	stx	%l4,[%o2+0x078]		! Mem[0000000031000078] = 96fde27235f46aa8
!	Branch On Register, %l1 = ffffffffffffe783
	brgz,a,pn %l1,p3_not_taken_0	! Branch Not Taken
!	Mem[0000000031000030] = ff12bbfe479deace, %l5 = ffffffffd4eae157
	ldx	[%o2+0x030],%l5		! Annulled
p3_b199:
	membar	#Sync			! Added by membar checker (705)
	set	p3_b200,%o7
	fbu,a,pt %fcc3,p3_near_1_le	! Branch Taken, %fcc3 = 3
!	Mem[000000001d000120] = 63d28fc4 f4b9ab72 6684d210 97631181
	prefetch [%i2+0x120],23
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x0c8,%g2
p3_b200:
!	Registers modified during the branch to p3_near_1
!	%l3  = 0000000000000076
!	%l7  = ffffffffd3bc3a35

p3_label_170:
	membar	#Sync			! Added by membar checker (706)
!	Mem[0000000031800070] = bf64f5bd, %l0 = 000000000000002a
	lduh	[%o3+0x072],%l0		! %l0 = 000000000000f5bd
!	Mem[0000000030000070] = 570b04885e3fbbdb, %l0 = 000000000000f5bd
	ldxa	[%o0+0x070]%asi,%l0	! %l0 = 570b04885e3fbbdb
!	Mem[0000000031000073] = ffffffff, %l5 = ffffffffd4eae157
	ldstuba	[%o2+0x073]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[000000001c000118] = 7ab47e47 78171fbf, %l4 = 35f46aa8, %l5 = 000000ff
	ldd	[%i0+0x118],%l4		! %l4 = 000000007ab47e47 0000000078171fbf
!	%l3 = 0000000000000076, %l6 = ffffffffffffffff, %l7 = ffffffffd3bc3a35
	subccc	%l3,%l6,%l7		! %l7 = 0000000000000077, %ccr = 11

p3_label_171:
	set	p3_b201,%o7
	fbge	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[0000000032000040] = 00000000 00002f32 60739feb c1c67d6b
	prefetch [%o4+0x040],3
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x0c9,%g2
p3_b201:
	membar	#Sync			! Added by membar checker (707)
!	Mem[0000000030800070] = 00000000, %l5 = 0000000078171fbf
	ldsba	[%o1+0x071]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001c800080] = 0ac86910 9b269f5a bf2e6398 84dc2002
	prefetcha [%i1+0x080]%asi,21
!	Mem[000000001d000118] = 0ac86910 9b269f5a, %l7 = 0000000000000077, %l1 = ffffffffffffe783
	add	%i2,0x118,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 9f2ade2a35e77fb1

p3_label_172:
!	Denormal Floating Point Operation Nullified
	nop
	set	p3_b202,%o7
	fba	p3_far_2_le	! Branch Taken, %fcc0 = 2
!	Mem[000000001c800000] = e783b1cc, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000e7
!	The following code should not be executed
	stwa	%l6,[%o2+0x00c]%asi
	fabss	%f13,%f9
	lduha	[%o5+0x014]%asi,%l4
	udivx	%l0,0xe41,%l0
	fadds	%f13,%f6,%f30
	nop
	fdtoi	%f0,%f30
	ba	p3_branch_failed
	mov	0x0ca,%g2
p3_b202:
	membar	#Sync			! Added by membar checker (708)
!	%l0 = 570b04885e3fbbdb, Mem[000000001c000008] = fffff495
	stha	%l0,[%i0+%o6]0x80	! Mem[000000001c000008] = bbdbf495
	set	p3_b203,%o7
	fbug,a	p3_far_1_he	! Branch Taken, %fcc0 = 2

p3_label_173:
!	%l2 = 96fde2723ff57ea8, Mem[0000000031000030] = ff12bbfe479deace
	stx	%l2,[%o2+0x030]		! Mem[0000000031000030] = 96fde2723ff57ea8
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x0cb,%g2
p3_b203:
!	Registers modified during the branch to p3_far_1
!	%l3  = 0000000000000040
!	%l5  = 000000007ab47e30
!	%l6  = ffffffffffffffc0
	membar	#Sync			! Added by membar checker (709)
!	Branch On Register, %l7 = 0000000000000077
	brz,pt	%l7,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d800000] = ffffffff1e0fff08, %l4 = 000000007ab47e47
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = ffffffff1e0fff08
p3_b204:
	membar	#Sync			! Added by membar checker (710)
!	%l4 = ffffffff1e0fff08, Mem[000000001c800037] = b46bcfae
	stb	%l4,[%i1+0x037]		! Mem[000000001c800034] = b46bcf08
!	Mem[0000000031000078] = 96fde272, %l7 = 0000000000000077
	ldsh	[%o2+0x078],%l7		! %l7 = ffffffffffff96fd

p3_label_174:
!	%l7 = ffffffffffff96fd, %l0 = 570b04885e3fbbdb, %l3 = 0000000000000040
	orn	%l7,%l0,%l3		! %l3 = ffffffffffffd6fd
	fble,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001d80012c] = cd47725f, %l6 = ffffffffffffffc0
	lduh	[%i3+0x12c],%l6		! %l6 = 000000000000cd47
p3_b205:
	membar	#Sync			! Added by membar checker (711)
	nop
	set	p3_b206,%o7
	fbuge	p3_far_2_he	! Branch Taken, %fcc0 = 2

p3_label_175:
!	Mem[000000001d0000d0] = 69157756 e790ac6c, %l6 = 0000cd47, %l7 = ffff96fd
	ldd	[%i2+0x0d0],%l6		! %l6 = 0000000069157756 00000000e790ac6c
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x0ce,%g2
p3_b206:
!	Registers modified during the branch to p3_far_2
!	%l5  = ae160910bc7f77b6
!	%l7  = 0000000000000071
	membar	#Sync			! Added by membar checker (712)
!	%l6 = 0000000069157756, %l0 = 570b04885e3fbbdb, %y  = ffffffff
	umul	%l6,%l0,%l5		! %l5 = 26b00b3685b2e892
!	Mem[000000001d800080] = 87f51489 4c172432 fadf5f04 9b8c73aa
	prefetcha [%i3+0x080]%asi,0
!	%f23 = 80000000, %f9  = fa779b48, %f2  = 12d93726
	fsubs	%f23,%f9 ,%f2 		! %f2  = 7a779b48
!	%l0 = 570b04885e3fbbdb, immed = fffffc4a, %l6 = 0000000069157756
	subccc	%l0,-0x3b6,%l6		! %l6 = 570b04885e3fbf91, %ccr = 11

p3_label_176:
!	%l5 = 26b00b3685b2e892, %l0 = 570b04885e3fbbdb, %l2 = 96fde2723ff57ea8
	subc	%l5,%l0,%l2		! %l2 = cfa506ae27732cb6
	fbue,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l0 = 570b04885e3fbbdb, Mem[000000001e800008] = e783b9cc39e63626
	stxa	%l0,[%i5+%o6]0x80	! Mem[000000001e800008] = 570b04885e3fbbdb
p3_b207:
	membar	#Sync			! Added by membar checker (713)
!	%l2 = cfa506ae27732cb6, %l6 = 570b04885e3fbf91, %y  = 26b00b36
	smul	%l2,%l6,%l1		! %l1 = 0e861d481b621d16
!	%l3 = ffffffffffffd6fd, Mem[000000001c800158] = 00006dec
	stwa	%l3,[%i1+0x158]%asi	! Mem[000000001c800158] = ffffd6fd

p3_label_177:
	fbu,pt	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	%l2 = cfa506ae27732cb6, Mem[000000003000003a] = 00000000
	stb	%l2,[%o0+0x03a]		! Mem[0000000030000038] = 0000b600
p3_b208:
	membar	#Sync			! Added by membar checker (714)
!	%l2 = cfa506ae27732cb6, immed = fffff4bf, %y  = 0e861d48
	umul	%l2,-0xb41,%l0		! %l0 = 27732afa08d5d3ca
!	%l0 = 27732afa08d5d3ca, %l2 = cfa506ae27732cb6, %l0 = 27732afa08d5d3ca
	sub	%l0,%l2,%l0		! %l0 = 57ce244be162a714
!	%l0 = 57ce244be162a714, immed = 0000009b, %l7 = 0000000000000071
	xnor	%l0,0x09b,%l7		! %l7 = a831dbb41e9d5870

p3_label_178:
!	Mem[000000001c0000c0] = 5dfff28c 9b843fee 974897ac 1e95db52
	prefetch [%i0+0x0c0],0
	fblg,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	%l7 = a831dbb41e9d5870, Mem[000000001c000008] = bbdbf495
	stwa	%l7,[%i0+%o6]0x80	! Annulled
p3_b209:
	membar	#Sync			! Added by membar checker (715)
!	Mem[000000001d000100] = ee05a315 c762e76f a8918f6d 1fded6b0
	prefetch [%i2+0x100],23
	bl,a	p3_not_taken_0		! Branch Not Taken, %ccr = 11

p3_label_179:
!	%l6 = 570b04885e3fbf91, Mem[000000001c000000] = 95baf688
	stwa	%l6,[%i0+%g0]0x80	! Annulled
p3_b210:
	membar	#Sync			! Added by membar checker (716)
!	Mem[000000001c0000c0] = 5dfff28c 9b843fee 974897ac 1e95db52
	prefetch [%i0+0x0c0],23
!	Mem[000000001d8000c0] = 548c7792 b68bf45b
	flush	%i3+0x0c0
	bvc	p3_b211			! Branch Taken, %ccr = 11, CWP = 0
!	%l3 = ffffffffffffd6fd, Mem[000000001f000008] = ffffd432
	stba	%l3,[%i6+%o6]0x80	! Mem[000000001f000008] = fdffd432
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x0d3,%g2
p3_b211:

p3_label_180:
	membar	#Sync			! Added by membar checker (717)
!	Mem[000000001c800070] = c6eb2b8c, %l3 = ffffffffffffd6fd
	lduh	[%i1+0x070],%l3		! %l3 = 000000000000c6eb
	set	p3_b212,%o7
	fba,a,pt %fcc2,p3_near_0_he	! Branch Taken, %fcc2 = 2
!	 Annulled
	ldd	[%o0+0x038],%l2
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x0d4,%g2
p3_b212:
!	Registers modified during the branch to p3_near_0
!	%l2  = 0e861d481b621d16
!	%l3  = 0e861d481b62e401
!	%l4  = 5e3fba90e82b239b
!	%l7  = 0000000000000002
	membar	#Sync			! Added by membar checker (718)
!	%l3 = 0e861d481b62e401, immed = 00000395, %y  = 5e3fba90
	sdiv	%l3,0x395,%l5		! %l5 = 000000007fffffff
!	%f12 = 00000000, %f20 = fa7e9547 00000000
	fstod	%f12,%f20		! %f20 = 00000000 00000000

p3_label_181:
	fblg,a,pt %fcc1,p3_branch_failed	! Branch Not Taken, %fcc1 = 0
!	Mem[000000001d000000] = 0000002a, %l2 = 0e861d481b621d16
	ldsba	[%i2+%g0]0x80,%l2	! Annulled
p3_b213:
	membar	#Sync			! Added by membar checker (719)
!	Mem[000000001d8001a0] = 1deddaa7 6113c94f 5430bb0e b1c967b5
	prefetcha [%i3+0x1a0]%asi,23
!	Mem[000000001d000000] = 0000002a, %l2 = 0e861d481b621d16
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l3 = 0e861d481b62e401, immed = fffff4da, %l5 = 000000007fffffff
	andncc	%l3,-0xb26,%l5		! %l5 = 0000000000000001, %ccr = 00

p3_label_182:
!	Branch On Register, %l2 = 0000000000000000
	brz,a,pn %l2,p3_b214		! Branch Taken
!	Mem[000000001d8000a0] = 9f3982ab 420bd448 70990000 aaf50f69
	prefetch [%i3+0x0a0],21
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x0d6,%g2
p3_b214:
	membar	#Sync			! Added by membar checker (720)
!	Mem[000000001d0001c0] = ffffffff 3e00648b d6e00cca 2e6498ac
	prefetch [%i2+0x1c0],21
	fble,pt	%fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 3
!	Mem[000000001c800000] = ff83b1cc, %l6 = 570b04885e3fbf91
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
p3_b215:

p3_label_183:
	membar	#Sync			! Added by membar checker (721)
!	%f30 = fa779b48, %f20 = 00000000 00000000
	fitod	%f30,%f20		! %f20 = c1962192 e0000000
!	%f22 = ffffffff, %f3  = 80000000
	fitos	%f22,%f3 		! %f3  = bf800000
	fbu,a,pt %fcc2,p3_branch_failed	! Branch Not Taken, %fcc2 = 2
!	Mem[0000000030800074] = 00002f32, %l0 = 57ce244be162a714
	ldsw	[%o1+0x074],%l0		! Annulled
p3_b216:
	membar	#Sync			! Added by membar checker (722)
!	%l5 = 0000000000000001, Mem[000000001d000008] = 6aa8d5e4
	stwa	%l5,[%i2+%o6]0x80	! Mem[000000001d000008] = 00000001

p3_label_184:
!	Mem[0000000031800030] = ffffffff, %l6 = 00000000000000ff
	lduwa	[%o3+0x030]%asi,%l6	! %l6 = 00000000ffffffff
!	Mem[000000001c800160] = 7f66aa3f cb12c091 9e83f601 a8281992
	prefetcha [%i1+0x160]%asi,16
!	%f27 = 00000000, %f11 = 808daef4, %f6  = fa7e9547
	fdivs	%f27,%f11,%f6 		! %f6  = 80000000
!	%l6 = 00000000ffffffff, Mem[000000003080007e] = ffffffff
	sth	%l6,[%o1+0x07e]		! Mem[000000003080007c] = ffffffff
!	Branch On Register, %l6 = 00000000ffffffff
	brlz,pt	%l6,p3_not_taken_0	! Branch Not Taken

p3_label_185:
!	%l5 = 0000000000000001, Mem[000000001d800000] = ffffffff
	stha	%l5,[%i3+%g0]0x80	! Mem[000000001d800000] = 0001ffff
p3_b217:
	membar	#Sync			! Added by membar checker (723)
!	Mem[000000001c800000] = ff83b1cc, %l4 = 5e3fba90e82b239b
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff83b1cc
!	%l3 = 0e861d481b62e401, Mem[000000001d000008] = 00000001
	stha	%l3,[%i2+%o6]0x80	! Mem[000000001d000008] = e4010001
!	%l0 = 57ce244be162a714, %l0 = 57ce244be162a714, %l2 = 0000000000000000
	addc	%l0,%l0,%l2		! %l2 = af9c4897c2c54e28
!	%l4 = 00000000ff83b1cc, Mem[000000001e800110] = 938c3954f025b0ab
	stxa	%l4,[%i5+0x110]%asi	! Mem[000000001e800110] = 00000000ff83b1cc

p3_label_186:
!	Mem[000000004000003c] = 1e0fff08, %l4 = 00000000ff83b1cc
	lduba	[%o5+0x03e]%asi,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, immed = 0000000c, %l5 = 0000000000000001
	sll	%l4,0x00c,%l5		! %l5 = 00000000000ff000
!	Branch On Register, %l2 = af9c4897c2c54e28
	brgez,a,pt %l2,p3_not_taken_0	! Branch Not Taken
!	Mem[000000001d000008] = e4010001, %l0 = 57ce244be162a714
	ldsba	[%i2+%o6]0x80,%l0	! Annulled
p3_b218:
	membar	#Sync			! Added by membar checker (724)
!	Mem[000000001d000168] = 45d80e71, %l7 = 0000000000000002
	swapa	[%i2+0x168]%asi,%l7	! %l7 = 0000000045d80e71

p3_label_187:
	bcs	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d800000] = 0001ffff 1e0fff08, %l2 = c2c54e28, %l3 = 1b62e401
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 000000000001ffff 000000001e0fff08
p3_b219:
	fbul	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c800000] = e82b239b, %l1 = 0e861d481b621d16
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffffe82b
p3_b220:
	membar	#Sync			! Added by membar checker (725)
!	%f22 = ffffffff 80000000, %f20 = c1962192 e0000000
	fcmped	%fcc2,%f22,%f20		! %fcc2 = 3

p3_label_188:
!	%l4 = 00000000000000ff, Mem[000000001c000000] = 95baf688
	stwa	%l4,[%i0+%g0]0x80	! Mem[000000001c000000] = 000000ff
	bcc,a	p3_b221			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[0000000032000008] = e83b01bf 5e0357b7, %l0 = e162a714, %l1 = ffffe82b
	ldd	[%o4+0x008],%g2		! %l0 = 57ce244be162a714 ffffffffffffe82b
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x0dd,%g2
p3_b221:
	membar	#Sync			! Added by membar checker (726)
	fbule,a,pn %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 2
!	Mem[000000001c000100] = 8e484f03 60240fa9 61cb2873 fb9c6f47
	prefetch [%i0+0x100],0	! Annulled
p3_b222:

p3_label_189:
	membar	#Sync			! Added by membar checker (727)
!	%f7  = 3f800000, %f22 = ffffffff 80000000
	fstox	%f7 ,%f22		! %f22 = 00000000 00000001
	ba	p3_b223			! Branch Taken, %ccr = 00, CWP = 0
!	Mem[000000003180003c] = ff30e0e7, %l3 = 000000001e0fff08
	lduh	[%o3+0x03e],%l3		! %l3 = 000000000000e0e7
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x0df,%g2
p3_b223:
	membar	#Sync			! Added by membar checker (728)
!	%l0 = 57ce244be162a714, immed = 00000c16, %y  = 5e3fba90
	sdivx	%l0,0xc16,%l3		! %l3 = 000743dbf315217b
!	%f4  = 7a7e9547 808daef4, %f0  = ffffffff 5a9c6e6a
	fcmpd	%fcc0,%f4 ,%f0 		! %fcc0 = 3

p3_label_190:
!	%f20 = c1962192, %f13 = 00000000
	fcmps	%fcc1,%f20,%f13		! %fcc1 = 1
	nop				! Delay added due to fcmp
	fbo,a,pn %fcc3,p3_branch_failed	! Branch Not Taken, %fcc3 = 3
!	%l2 = 000000000001ffff, Mem[000000001c800000] = e82b239bbcf63250
	stxa	%l2,[%i1+%g0]0x80	! Annulled
p3_b224:
	be	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	Mem[000000001d800068] = 24c98188, %l2 = 000000000001ffff
	ldsh	[%i3+0x068],%l2		! %l2 = 00000000000024c9
p3_b225:

p3_label_191:
	membar	#Sync			! Added by membar checker (729)
!	Mem[000000001c800140] = ae832a4a 9d39ba15 6dec1026 b5a8a17e
	prefetcha [%i1+0x140]%asi,23
!	%l6 = 00000000ffffffff, immed = fffff57f, %y  = 5e3fba90
	umulcc	%l6,-0xa81,%l1		! %l1 = fffff57e00000a81, %ccr = 80
!	%l0 = 57ce244be162a714, immed = 000001bc, %y  = fffff57e
	udiv	%l0,0x1bc,%l2		! %l2 = 00000000ffffffff
!	Mem[000000001c800000] = e82b239b, %l0 = 57ce244be162a714
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 00000000e82b239b
	set	p3_b226,%o7
	fbu	p3_far_2_he	! Branch Taken, %fcc0 = 3

p3_label_192:
!	Mem[000000001d000008] = e4010001, %l7 = 0000000045d80e71
	lduba	[%i2+%o6]0x80,%l7	! %l7 = 00000000000000e4
!	The following code should not be executed
	fnegd	%f22,%f30
	fdtoq	%f30,%f4
	bgu,a	p0_not_taken_0
	udiv	%l0,0x980,%l0
	std	%l6,[%i3+0x038]
	fdtos	%f14,%f18
	ba	p3_branch_failed
	mov	0x0e2,%g2
p3_b226:
!	Registers modified during the branch to p3_far_2
!	%l5  = 00000001d0564736
!	%l7  = 0000000000000071
	set	p3_b227,%o7
	fbne	p3_far_2_he	! Branch Taken, %fcc0 = 3
!	Mem[0000000031800074] = dee2b002, %l4 = 00000000000000ff
	ldsb	[%o3+0x074],%l4		! %l4 = ffffffffffffffde
!	The following code should not be executed
	fbg,a	p0_not_taken_0
	nop
	fmovs	%f9,%f2
	nop
	ba	p3_branch_failed
	mov	0x0e3,%g2
p3_b227:
!	Registers modified during the branch to p3_far_2
!	%l5  = 00000001d0564736
!	%l7  = 0000000000000071
	membar	#Sync			! Added by membar checker (730)
!	%f30 = fa779b48 ccb10c97, %f14 = ffffffff fa779b48, %f20 = c1962192 e0000000
	fdivd	%f30,%f14,%f20		! %f20 = ffffffff fa779b48
!	Mem[000000001d800104] = ced6e202, %l7 = 0000000000000071
	ldsw	[%i3+0x104],%l7		! %l7 = ffffffffced6e202

p3_label_193:
!	Mem[000000001d800148] = 6965fcaf eebf6ea1, %l6 = ffffffff, %l7 = ced6e202
	ldd	[%i3+0x148],%l6		! %l6 = 000000006965fcaf 00000000eebf6ea1
!	%l2 = 00000000ffffffff, immed = fffff9cb, %l7 = 00000000eebf6ea1
	taddcc	%l2,-0x635,%l7		! %l7 = 00000000fffff9ca, %ccr = 1b
!	Mem[000000003080007d] = ffffffff, %l0 = 00000000e82b239b
	ldstuba	[%o1+0x07d]%asi,%l0	! %l0 = 00000000000000ff
!	%l6 = 000000006965fcaf, %l2 = 00000000ffffffff, %l3 = 000743dbf315217b
	orncc	%l6,%l2,%l3		! %l3 = ffffffff6965fcaf, %ccr = 80
!	%f27 = 00000000, %f11 = 808daef4
	fabss	%f27,%f11		! %f11 = 00000000

p3_label_194:
	fblg	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001c000008] = bbdbf495, %l5 = 00000001d0564736
	lduwa	[%i0+%o6]0x80,%l5	! %l5 = 00000000bbdbf495
p3_b228:
	fbo,a	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	%l0 = 00000000000000ff, Mem[000000001d000008] = e4010001
	stha	%l0,[%i2+%o6]0x80	! Annulled
p3_b229:
	membar	#Sync			! Added by membar checker (731)
!	Branch On Register, %l3 = ffffffff6965fcaf
	brz,pn	%l3,p3_not_taken_0	! Branch Not Taken

p3_label_195:
!	Mem[000000003000007c] = 263b24e2, %l0 = 00000000000000ff
	ldsb	[%o0+0x07f],%l0		! %l0 = ffffffffffffffe2
p3_b230:
	membar	#Sync			! Added by membar checker (732)
!	Mem[000000001c800088] = bf2e639884dc2002, %l3 = ffffffff6965fcaf
	ldxa	[%i1+0x088]%asi,%l3	! %l3 = bf2e639884dc2002
	fbo,a,pt %fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
!	Mem[000000001c800000] = e82b239b, %l5 = 00000000bbdbf495
	ldsha	[%i1+%g0]0x80,%l5	! Annulled
p3_b231:
	membar	#Sync			! Added by membar checker (733)
!	Mem[000000001c000100] = 8e484f03 60240fa9 61cb2873 fb9c6f47
	prefetch [%i0+0x100],21

p3_label_196:
!	%f26 = 00000000 00000000, %f8  = 00000000
	fdtoi	%f26,%f8 		! %f8  = 00000000
!	%l6 = 000000006965fcaf, immed = fffff805, %y  = fffff57e
	sdivx	%l6,-0x7fb,%l6		! %l6 = fffffffffff2cb00
!	%l5 = 00000000bbdbf495, immed = 00000033, %l0 = ffffffffffffffe2
	srax	%l5,0x033,%l0		! %l0 = 0000000000000000
	bpos	p3_b232			! Branch Taken, %ccr = 80, CWP = 0
!	Mem[000000001c000008] = bbdbf495, %l4 = ffffffffffffffde
	lduha	[%i0+%o6]0x80,%l4	! %l4 = 000000000000bbdb
!	The following code should not be executed
	lduha	[%i5+0x006]%asi,%l6
	stxa	%l4,[%i1+0x0e0]%asi
	fstox	%f12,%f24
	nop
	stha	%l4,[%i4+0x068]%asi
	nop
	lduh	[%i1+0x0b2],%l4
	setx	p0_not_taken_0,%g7,%g1 ; jmpl	%g1,%g0
	ba	p3_branch_failed
	mov	0x0e8,%g2
p3_b232:

p3_label_197:
	membar	#Sync			! Added by membar checker (734)
!	Mem[000000001c8000fc] = a608c348, %l6 = fffffffffff2cb00
	lduba	[%i1+0x0fe]%asi,%l6	! %l6 = 00000000000000c3
	set	p3_b233,%o7
	fbue	p3_far_1_le	! Branch Taken, %fcc0 = 3
!	%l2 = 00000000ffffffff, Mem[0000000030000036] = ffffffff
	sth	%l2,[%o0+0x036]		! Mem[0000000030000034] = ffffffff
!	The following code should not be executed
	nop
	lduha	[%o1+0x048]%asi,%l4
	nop
	bg	p0_not_taken_0
	ldsha	[%i1+0x06c]%asi,%l6
	ba	p3_branch_failed
	mov	0x0e9,%g2
p3_b233:
!	Registers modified during the branch to p3_far_1
!	%l0  = 0000000000007fb1
!	%l1  = ffffffff80000000
!	%l5  = 000000007fffffff
	membar	#Sync			! Added by membar checker (735)
!	Mem[0000000031800079] = ffa5fd7a, %l4 = 000000000000bbdb
	ldstuba	[%o3+0x079]%asi,%l4	! %l4 = 00000000000000a5
!	Branch On Register, %l1 = ffffffff80000000
	brlez,pn %l1,p3_b234		! Branch Taken

p3_label_198:
!	Mem[000000001c000008] = bbdbf495, %l1 = ffffffff80000000
	ldswa	[%i0+%o6]0x80,%l1	! %l1 = ffffffffbbdbf495
!	The following code should not be executed
	fstoi	%f16,%f26
	lduha	[%o0+0x006]%asi,%l4
	ldsba	[%i0+0x019]%asi,%l3
	lduha	[%i1+0x0bc]%asi,%l0
	ba	p3_branch_failed
	mov	0x0ea,%g2
p3_b234:
	membar	#Sync			! Added by membar checker (736)
!	Mem[000000001d8001c0] = e475ff3e, %l2 = 00000000ffffffff
	lduwa	[%i3+0x1c0]%asi,%l2	! %l2 = 00000000e475ff3e
!	%f5  = 808daef4, %f28 = 80000000 77df3fe0
	fstod	%f5 ,%f28		! %f28 = b811b5de 80000000
!	%l3 = bf2e639884dc2002, immed = 00000006, %l2 = 00000000e475ff3e
	srax	%l3,0x006,%l2		! %l2 = fefcb98e62137080
!	%l1 = ffffffffbbdbf495, Mem[000000001d0000ba] = 46d9099e
	stb	%l1,[%i2+0x0ba]		! Mem[000000001d0000b8] = 46d9959e

p3_label_199:
	set	p3_b235,%o7
	fbue,a,pt %fcc2,p3_near_3_le	! Branch Taken, %fcc2 = 3
!	Mem[0000000030000034] = ffffffff, %l0 = 0000000000007fb1
	swap	[%o0+0x034],%l0		! %l0 = 00000000ffffffff
!	The following code should not be executed
	nop
	fbuge	p0_not_taken_0
	nop
	addc	%l0,%l0,%l0
	bne	p0_not_taken_0
	fqtod	%f20,%f16
	ldda	[%o1+0x008]%asi,%l0
	ba	p3_branch_failed
	mov	0x0eb,%g2
p3_b235:
!	Registers modified during the branch to p3_near_3
!	%l2  = fffffffffffff127
!	%l6  = ffffffff77b7e92a
	membar	#Sync			! Added by membar checker (737)
!	%l7 = 00000000fffff9ca, immed = fffffb10, %l7 = 00000000fffff9ca
	andncc	%l7,-0x4f0,%l7		! %l7 = 00000000000000ca, %ccr = 00
!	%l1 = ffffffffbbdbf495, %l6 = ffffffff77b7e92a, %l4 = 00000000000000a5
	sll	%l1,%l6,%l4		! %l4 = fffffeef6fd25400
!	%l7 = 00000000000000ca, Mem[000000001c000048] = f8d0fb52806f9739
	stxa	%l7,[%i0+0x048]%asi	! Mem[000000001c000048] = 00000000000000ca

p3_label_200:
	bleu,a	p3_not_taken_0		! Branch Not Taken, %ccr = 00
!	%l6 = ffffffff77b7e92a, Mem[0000000030800036] = daa80076
	sth	%l6,[%o1+0x036]		! Annulled
p3_b236:
	membar	#Sync			! Added by membar checker (738)
!	%l3 = bf2e639884dc2002, %l0 = 00000000ffffffff, %l0 = 00000000ffffffff
	addc	%l3,%l0,%l0		! %l0 = bf2e639984dc2001
!	%l1 = ffffffffbbdbf495, immed = 00000db5, %l4 = fffffeef6fd25400
	taddcc	%l1,0xdb5,%l4		! %l4 = ffffffffbbdc024a, %ccr = 8a
	fble	%fcc0,p3_branch_failed	! Branch Not Taken, %fcc0 = 3
	nop
p3_b237:
	nop

	membar	#Sync			! Force all stores to complete

!	End of Random Code for Processor 3

	mov	2,%g2
	set	done_flags,%g1
	st	%g2,[%g1+0x00c]		! Set processor 3 done flag

!	Check Registers

p3_check_registers:
	set	p3_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be bf2e639984dc2001
	bne,a,pn %xcc,p3_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffbbdbf495
	bne,a,pn %xcc,p3_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be fffffffffffff127
	bne,a,pn %xcc,p3_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be bf2e639884dc2002
	bne,a,pn %xcc,p3_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffbbdc024a
	bne,a,pn %xcc,p3_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000007fffffff
	bne,a,pn %xcc,p3_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ffffffff77b7e92a
	bne,a,pn %xcc,p3_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000ca
	bne,a,pn %xcc,p3_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000061,%g2
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
	cmp	%l0,%l1			! %f0  should be ffffffff 5a9c6e6a
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf00,%g1
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 7a779b48 bf800000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf02,%g1
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 7a7e9547 808daef4
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf04,%g1
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 80000000 3f800000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf06,%g1
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 fa779b48
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf08,%g1
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 12d93726 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf10,%g1
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf12,%g1
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ffffffff fa779b48
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf14,%g1
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 3f800000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf16,%g1
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ffffffff 00000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf18,%g1
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ffffffff fa779b48
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf20,%g1
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000001
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf22,%g1
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000001 77df3fe0
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
	cmp	%l0,%l1			! %f28 should be b811b5de 80000000
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf28,%g1
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be fa779b48 ccb10c97
	bne,a,pn	%xcc,p3_freg_fail
	or	%g0,0xf30,%g1

!	Check Local Memory

	set	p3_local0_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 000000ff5dfffae1
	ldx	[%i0+0x000],%g3		! Observed data at 000000001c000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = bbdbf495e37995fa
	ldx	[%i0+0x008],%g3		! Observed data at 000000001c000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x020],%g2		! Expect data = 0000002aa8e850d5
	ldx	[%i0+0x020],%g3		! Observed data at 000000001c000020
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x020,%g4
	ldx	[%g1+0x028],%g2		! Expect data = 6c31e6ceffffd4ea
	ldx	[%i0+0x028],%g3		! Observed data at 000000001c000028
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x028,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 00000000000000ca
	ldx	[%i0+0x048],%g3		! Observed data at 000000001c000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x058],%g2		! Expect data = 6434b32aa85efd98
	ldx	[%i0+0x058],%g3		! Observed data at 000000001c000058
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x058,%g4
	ldx	[%g1+0x068],%g2		! Expect data = 082f8deeffffffff
	ldx	[%i0+0x068],%g3		! Observed data at 000000001c000068
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x068,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 000000000000216b
	ldx	[%i0+0x098],%g3		! Observed data at 000000001c000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0c0],%g2		! Expect data = 5dfff28c9b843fee
	ldx	[%i0+0x0c0],%g3		! Observed data at 000000001c0000c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0c0,%g4
	ldx	[%g1+0x118],%g2		! Expect data = 7ab47e4778171fbf
	ldx	[%i0+0x118],%g3		! Observed data at 000000001c000118
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x118,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = 0000000000000000
	ldx	[%i0+0x1e8],%g3		! Observed data at 000000001c0001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e8,%g4

	set	p3_local1_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = e82b239bbcf63250
	ldx	[%i1+0x000],%g3		! Observed data at 000000001c800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = d4eae1575ad1afca
	ldx	[%i1+0x008],%g3		! Observed data at 000000001c800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 003fc4b225400cb0
	ldx	[%i1+0x010],%g3		! Observed data at 000000001c800010
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x030],%g2		! Expect data = f8a5b583b46bcf08
	ldx	[%i1+0x030],%g3		! Observed data at 000000001c800030
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x030,%g4
	ldx	[%g1+0x110],%g2		! Expect data = d621974a38002a64
	ldx	[%i1+0x110],%g3		! Observed data at 000000001c800110
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x110,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 42b6c3160000d4eb
	ldx	[%i1+0x120],%g3		! Observed data at 000000001c800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x128],%g2		! Expect data = 26ff24e2fdd9f7e0
	ldx	[%i1+0x128],%g3		! Observed data at 000000001c800128
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x128,%g4
	ldx	[%g1+0x158],%g2		! Expect data = ffffd6fd3b495c00
	ldx	[%i1+0x158],%g3		! Observed data at 000000001c800158
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x158,%g4
	ldx	[%g1+0x170],%g2		! Expect data = 8dc77bc58dc774fe
	ldx	[%i1+0x170],%g3		! Observed data at 000000001c800170
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x170,%g4
	ldx	[%g1+0x178],%g2		! Expect data = 00006dec1712c895
	ldx	[%i1+0x178],%g3		! Observed data at 000000001c800178
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x178,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = 7f689b0700ff7ac5
	ldx	[%i1+0x1b8],%g3		! Observed data at 000000001c8001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b8,%g4
	ldx	[%g1+0x1d8],%g2		! Expect data = 9cb1ea302fbea3c7
	ldx	[%i1+0x1d8],%g3		! Observed data at 000000001c8001d8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1d8,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = f4224b0eff451fd6
	ldx	[%i1+0x1f8],%g3		! Observed data at 000000001c8001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f8,%g4

	set	p3_local2_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0000002affffe783
	ldx	[%i2+0x000],%g3		! Observed data at 000000001d000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = e4010001fffff495
	ldx	[%i2+0x008],%g3		! Observed data at 000000001d000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = a6f21b900000d4ea
	ldx	[%i2+0x010],%g3		! Observed data at 000000001d000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x048],%g2		! Expect data = 00007fb1a11d43fd
	ldx	[%i2+0x048],%g3		! Observed data at 000000001d000048
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x048,%g4
	ldx	[%g1+0x050],%g2		! Expect data = 2526bc35cab1be11
	ldx	[%i2+0x050],%g3		! Observed data at 000000001d000050
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x050,%g4
	ldx	[%g1+0x070],%g2		! Expect data = 0363086b4cff1857
	ldx	[%i2+0x070],%g3		! Observed data at 000000001d000070
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x070,%g4
	ldx	[%g1+0x080],%g2		! Expect data = ad11bc720017d4c0
	ldx	[%i2+0x080],%g3		! Observed data at 000000001d000080
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x080,%g4
	ldx	[%g1+0x098],%g2		! Expect data = 9ce5b1cdffffd432
	ldx	[%i2+0x098],%g3		! Observed data at 000000001d000098
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x098,%g4
	ldx	[%g1+0x0b8],%g2		! Expect data = 46d9959e1789d402
	ldx	[%i2+0x0b8],%g3		! Observed data at 000000001d0000b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0b8,%g4
	ldx	[%g1+0x168],%g2		! Expect data = 000000025493fc09
	ldx	[%i2+0x168],%g3		! Observed data at 000000001d000168
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x168,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 7dd450707dd45070
	ldx	[%i2+0x198],%g3		! Observed data at 000000001d000198
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1c0],%g2		! Expect data = ffffffff3e00648b
	ldx	[%i2+0x1c0],%g3		! Observed data at 000000001d0001c0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1c0,%g4
	ldx	[%g1+0x1e8],%g2		! Expect data = fbc2c9672468338f
	ldx	[%i2+0x1e8],%g3		! Observed data at 000000001d0001e8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1e8,%g4
	ldx	[%g1+0x1f0],%g2		! Expect data = 000000000000009d
	ldx	[%i2+0x1f0],%g3		! Observed data at 000000001d0001f0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f0,%g4

	set	p3_local3_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 0001ffff1e0fff08
	ldx	[%i3+0x000],%g3		! Observed data at 000000001d800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 0000000000000000
	ldx	[%i3+0x008],%g3		! Observed data at 000000001d800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x040],%g2		! Expect data = fefcb98e62137080
	ldx	[%i3+0x040],%g3		! Observed data at 000000001d800040
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x040,%g4
	ldx	[%g1+0x0a8],%g2		! Expect data = 70990000aaf50f69
	ldx	[%i3+0x0a8],%g3		! Observed data at 000000001d8000a8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x0a8,%g4
	ldx	[%g1+0x100],%g2		! Expect data = 00007fb1ced6e202
	ldx	[%i3+0x100],%g3		! Observed data at 000000001d800100
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x100,%g4
	ldx	[%g1+0x120],%g2		! Expect data = 955899312c92648b
	ldx	[%i3+0x120],%g3		! Observed data at 000000001d800120
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x120,%g4
	ldx	[%g1+0x140],%g2		! Expect data = 0000ff0813fd2cd2
	ldx	[%i3+0x140],%g3		! Observed data at 000000001d800140
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x140,%g4
	ldx	[%g1+0x160],%g2		! Expect data = 5dfff28c00000000
	ldx	[%i3+0x160],%g3		! Observed data at 000000001d800160
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x160,%g4
	ldx	[%g1+0x178],%g2		! Expect data = 1610600000000000
	ldx	[%i3+0x178],%g3		! Observed data at 000000001d800178
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x178,%g4
	ldx	[%g1+0x198],%g2		! Expect data = 0000045a8b9d150b
	ldx	[%i3+0x198],%g3		! Observed data at 000000001d800198
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x198,%g4
	ldx	[%g1+0x1d0],%g2		! Expect data = fffffffffffffffb
	ldx	[%i3+0x1d0],%g3		! Observed data at 000000001d8001d0
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1d0,%g4
	ldx	[%g1+0x1f8],%g2		! Expect data = 000000601712c740
	ldx	[%i3+0x1f8],%g3		! Observed data at 000000001d8001f8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1f8,%g4

	set	p3_local4_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 000000016e232a17
	ldx	[%i4+0x000],%g3		! Observed data at 000000001e000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x1b8],%g2		! Expect data = 150dfc9d5b1bffff
	ldx	[%i4+0x1b8],%g3		! Observed data at 000000001e0001b8
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x1b8,%g4

	set	p3_local5_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = 095ac635000000fd
	ldx	[%i5+0x000],%g3		! Observed data at 000000001e800000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = 570b04885e3fbbdb
	ldx	[%i5+0x008],%g3		! Observed data at 000000001e800008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x110],%g2		! Expect data = 00000000ff83b1cc
	ldx	[%i5+0x110],%g3		! Observed data at 000000001e800110
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x110,%g4

	set	p3_local6_expect,%g1
	ldx	[%g1+0x000],%g2		! Expect data = bbdb665c43c68b1b
	ldx	[%i6+0x000],%g3		! Observed data at 000000001f000000
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x000,%g4
	ldx	[%g1+0x008],%g2		! Expect data = fdffd4327fffffff
	ldx	[%i6+0x008],%g3		! Observed data at 000000001f000008
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x008,%g4
	ldx	[%g1+0x010],%g2		! Expect data = 5a6cea4455e89ac0
	ldx	[%i6+0x010],%g3		! Observed data at 000000001f000010
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x010,%g4
	ldx	[%g1+0x178],%g2		! Expect data = 7047a998c3f5a060
	ldx	[%i6+0x178],%g3		! Observed data at 000000001f000178
	cmp	%g2,%g3
	bne,a,pn %xcc,p3_local_failed
	mov	0x178,%g4


!	Check Shared Memory

	set	share0_expect,%g4
	set	p3_share_mask,%g5
	set	0x30000000,%g6	! Physical Addr of Share 0
p3_memcheck_share0:
	ldx	[%g4+0x30],%g2	! Expected value = 0000007100007fb1
	ldx	[%o0+0x30],%g3	! Read value at Mem[0000000030000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = 0000b60000000064
	ldx	[%o0+0x38],%g3	! Read value at Mem[0000000030000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 570b04885e3fbbdb
	ldx	[%o0+0x70],%g3	! Read value at Mem[0000000030000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 25c1170c263b24e2
	ldx	[%o0+0x78],%g3	! Read value at Mem[0000000030000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share1_expect,%g4
	set	0x30800000,%g6	! Physical Addr of Share 1
p3_memcheck_share1:
	ldx	[%g4+0x30],%g2	! Expected value = db610d77daa80076
	ldx	[%o1+0x30],%g3	! Read value at Mem[0000000030800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = b83e02880058c159
	ldx	[%o1+0x38],%g3	! Read value at Mem[0000000030800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = 0000000000002f32
	ldx	[%o1+0x70],%g3	! Read value at Mem[0000000030800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 00000000ffffffff
	ldx	[%o1+0x78],%g3	! Read value at Mem[0000000030800078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share2_expect,%g4
	set	0x31000000,%g6	! Physical Addr of Share 2
p3_memcheck_share2:
	ldx	[%g4+0x30],%g2	! Expected value = 96fde2723ff57ea8
	ldx	[%o2+0x30],%g3	! Read value at Mem[0000000031000030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = ffde1c0b2557ff89
	ldx	[%o2+0x38],%g3	! Read value at Mem[0000000031000038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = ffffffffffffffcf
	ldx	[%o2+0x70],%g3	! Read value at Mem[0000000031000070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = 96fde27235f46aa8
	ldx	[%o2+0x78],%g3	! Read value at Mem[0000000031000078]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x078,%g1

	set	share3_expect,%g4
	set	0x31800000,%g6	! Physical Addr of Share 3
p3_memcheck_share3:
	ldx	[%g4+0x30],%g2	! Expected value = fffffffffffd9944
	ldx	[%o3+0x30],%g3	! Read value at Mem[0000000031800030]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x030,%g1
	ldx	[%g4+0x38],%g2	! Expected value = a714002aff30e0e7
	ldx	[%o3+0x38],%g3	! Read value at Mem[0000000031800038]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x038,%g1
	ldx	[%g4+0x70],%g2	! Expected value = bf91f5bddee2b002
	ldx	[%o3+0x70],%g3	! Read value at Mem[0000000031800070]
	cmp	%g2,%g3
	bne,pn	%xcc,p3_failed
	add	%g6,0x070,%g1
	ldx	[%g4+0x78],%g2	! Expected value = fffffd7a3c5b386e
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
	lduh	[%o3+0x032],%l7		! Mem[0000000031800032]
	sdivcc	%l7,-0xf1e,%l5
	stw	%l1,[%o0+0x030]		! Mem[0000000030000030]
	srl	%l0,0x002,%l4
	prefetch [%i0+0x1a0],22
	sth	%l1,[%o3+0x034]		! Mem[0000000031800034]
	ldx	[%i0+0x1a0],%l7		! Mem[000000001c0001a0]
	done

p3_trap1o:
	lduh	[%i3+0x032],%l7		! Mem[0000000031800032]
	sdivcc	%l7,-0xf1e,%l5
	stw	%l1,[%i0+0x030]		! Mem[0000000030000030]
	srl	%l0,0x002,%l4
	prefetch [%o0+0x1a0],22
	sth	%l1,[%i3+0x034]		! Mem[0000000031800034]
	ldx	[%o0+0x1a0],%l7		! Mem[000000001c0001a0]
	done


p3_trap2e:
	andcc	%l4,-0x40c,%l1
	ldd	[%i2+0x000],%l0		! Mem[000000001d000000]
	prefetch [%i6+0x060],2
	prefetch [%i0+0x120],4
	sll	%l0,%l7,%l6
	orcc	%l7,0x450,%l4
	xnor	%l1,%l2,%l2
	done

p3_trap2o:
	andcc	%l4,-0x40c,%l1
	ldd	[%o2+0x000],%l0		! Mem[000000001d000000]
	prefetch [%o6+0x060],2
	prefetch [%o0+0x120],4
	sll	%l0,%l7,%l6
	orcc	%l7,0x450,%l4
	xnor	%l1,%l2,%l2
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
	ldx	[%g1+0x000],%l0	! %l0 = 597d32ffcc8aed6c
	ldx	[%g1+0x008],%l1	! %l1 = edb1b6ffde501337
	ldx	[%g1+0x010],%l2	! %l2 = 51950affa6cb0dae
	ldx	[%g1+0x018],%l3	! %l3 = f358ee003ce55bdf
	ldx	[%g1+0x020],%l4	! %l4 = defc69003bfb3e36
	ldx	[%g1+0x028],%l5	! %l5 = 52a6a8ffec01e703
	ldx	[%g1+0x030],%l6	! %l6 = edb267ffff451fd6
	ldx	[%g1+0x038],%l7	! %l7 = ea1e2e00700d8f29

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
	jmpl	%o7,%g0
	sdiv	%l2,-0x165,%l3
p0_near_0_lo:
	jmpl	%o7,%g0
	sdiv	%l2,-0x165,%l3
p0_near_0_he:
	jmpl	%o7,%g0
	xor	%l0,%l1,%l5
p0_near_0_ho:
	jmpl	%o7,%g0
	xor	%l0,%l1,%l5
p1_near_0_le:
	prefetch [%i3+0x100],1
	jmpl	%o7,%g0
	xor	%l7,0x9f2,%l5
p1_near_0_lo:
	prefetch [%o3+0x100],1
	jmpl	%o7,%g0
	xor	%l7,0x9f2,%l5
p1_near_0_he:
	smulcc	%l6,0x113,%l1
	and	%l7,%l4,%l4
	bne	far3_b2b_h
	sdivx	%l2,-0x83f,%l0
	andn	%l2,%l6,%l6
	orn	%l6,0x82f,%l6
	jmpl	%o7,%g0
	orcc	%l7,0x763,%l2
p1_near_0_ho:
	smulcc	%l6,0x113,%l1
	and	%l7,%l4,%l4
	bne	far3_b2b_h
	sdivx	%l2,-0x83f,%l0
	andn	%l2,%l6,%l6
	orn	%l6,0x82f,%l6
	jmpl	%o7,%g0
	orcc	%l7,0x763,%l2
p2_near_0_le:
	xorcc	%l4,%l1,%l6
	subc	%l3,0x357,%l1
	jmpl	%o7,%g0
	sdiv	%l4,0xd66,%l4
p2_near_0_lo:
	xorcc	%l4,%l1,%l6
	subc	%l3,0x357,%l1
	jmpl	%o7,%g0
	sdiv	%l4,0xd66,%l4
p2_near_0_he:
	prefetch [%i3+0x000],2
	ldx	[%i3+0x190],%l3		! Mem[0000000019800190]
	jmpl	%o7,%g0
	ldsh	[%i2+0x102],%l7		! Mem[0000000019000102]
p2_near_0_ho:
	prefetch [%o3+0x000],2
	ldx	[%o3+0x190],%l3		! Mem[0000000019800190]
	jmpl	%o7,%g0
	ldsh	[%o2+0x102],%l7		! Mem[0000000019000102]
p3_near_0_le:
	addccc	%l3,%l2,%l3
	jmpl	%o7,%g0
	sdivcc	%l0,0xbe1,%l5
p3_near_0_lo:
	addccc	%l3,%l2,%l3
	jmpl	%o7,%g0
	sdivcc	%l0,0xbe1,%l5
p3_near_0_he:
	stb	%l6,[%o3+0x071]		! Mem[0000000031800071]
	srax	%l6,0x03d,%l7
	umul	%l6,-0xd95,%l4
	orcc	%l1,%l1,%l2
	bleu	near3_b2b_h
	sth	%l0,[%o3+0x038]		! Mem[0000000031800038]
	jmpl	%o7,%g0
	addccc	%l2,%l3,%l3
p3_near_0_ho:
	stb	%l6,[%i3+0x071]		! Mem[0000000031800071]
	srax	%l6,0x03d,%l7
	umul	%l6,-0xd95,%l4
	orcc	%l1,%l1,%l2
	bleu	near3_b2b_h
	sth	%l0,[%i3+0x038]		! Mem[0000000031800038]
	jmpl	%o7,%g0
	addccc	%l2,%l3,%l3
near0_b2b_h:
	sdivx	%l7,-0x07d,%l4
	subccc	%l7,%l1,%l5
	orcc	%l2,-0x76e,%l1
	xorcc	%l0,%l4,%l2
	sdiv	%l4,-0x3fd,%l5
	tsubcc	%l7,0xe68,%l7
	jmpl	%o7,%g0
	sdiv	%l0,0x3f0,%l0
near0_b2b_l:
	mulx	%l2,%l2,%l7
	orcc	%l6,%l6,%l0
	andn	%l7,-0xc1f,%l5
	smul	%l0,%l3,%l1
	addcc	%l5,%l3,%l6
	nop
	jmpl	%o7,%g0
	addccc	%l0,%l5,%l6
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	andn	%l3,0x592,%l0
	orncc	%l0,-0xcc9,%l1
	ldub	[%i0+0x030],%l7		! Mem[0000000010000030]
	ldsw	[%i0+0x0f0],%l0		! Mem[00000000100000f0]
	jmpl	%o7,%g0
	xnorcc	%l2,-0x276,%l3
p0_near_1_lo:
	andn	%l3,0x592,%l0
	orncc	%l0,-0xcc9,%l1
	ldub	[%o0+0x030],%l7		! Mem[0000000010000030]
	ldsw	[%o0+0x0f0],%l0		! Mem[00000000100000f0]
	jmpl	%o7,%g0
	xnorcc	%l2,-0x276,%l3
p0_near_1_he:
	ldsw	[%o1+0x044],%l3		! Mem[0000000030800044]
	jmpl	%o7,%g0
	sub	%l2,0xff2,%l3
p0_near_1_ho:
	ldsw	[%i1+0x044],%l3		! Mem[0000000030800044]
	jmpl	%o7,%g0
	sub	%l2,0xff2,%l3
p1_near_1_le:
	addccc	%l1,%l4,%l0
	taddcc	%l6,%l4,%l7
	prefetch [%i0+0x120],23
	prefetch [%i2+0x020],4
	jmpl	%o7,%g0
	sdivcc	%l2,-0x52e,%l2
p1_near_1_lo:
	addccc	%l1,%l4,%l0
	taddcc	%l6,%l4,%l7
	prefetch [%o0+0x120],23
	prefetch [%o2+0x020],4
	jmpl	%o7,%g0
	sdivcc	%l2,-0x52e,%l2
p1_near_1_he:
	xnor	%l0,%l3,%l4
	mulx	%l0,%l2,%l0
	andncc	%l6,%l3,%l1
	xnor	%l2,0x822,%l0
	xnor	%l1,-0x95e,%l6
	prefetch [%i1+0x040],2
	jmpl	%o7,%g0
	udivx	%l4,-0xf41,%l3
p1_near_1_ho:
	xnor	%l0,%l3,%l4
	mulx	%l0,%l2,%l0
	andncc	%l6,%l3,%l1
	xnor	%l2,0x822,%l0
	xnor	%l1,-0x95e,%l6
	prefetch [%o1+0x040],2
	jmpl	%o7,%g0
	udivx	%l4,-0xf41,%l3
p2_near_1_le:
	bge	far3_b2b_l
	xnorcc	%l6,%l7,%l6
	srlx	%l1,%l0,%l7
	or	%l5,%l0,%l3
	mulx	%l3,%l4,%l5
	sth	%l3,[%o0+0x02e]		! Mem[000000003000002e]
	jmpl	%o7,%g0
	and	%l7,%l3,%l6
p2_near_1_lo:
	bge	far3_b2b_l
	xnorcc	%l6,%l7,%l6
	srlx	%l1,%l0,%l7
	or	%l5,%l0,%l3
	mulx	%l3,%l4,%l5
	sth	%l3,[%i0+0x02e]		! Mem[000000003000002e]
	jmpl	%o7,%g0
	and	%l7,%l3,%l6
p2_near_1_he:
	jmpl	%o7,%g0
	stb	%l5,[%o0+0x021]		! Mem[0000000030000021]
p2_near_1_ho:
	jmpl	%o7,%g0
	stb	%l5,[%i0+0x021]		! Mem[0000000030000021]
p3_near_1_le:
	prefetch [%i3+0x1e0],3
	ldx	[%o0+0x070],%l7		! Mem[0000000030000070]
	sdivcc	%l2,-0x23e,%l7
	prefetch [%i5+0x080],2
	prefetch [%i3+0x0e0],4
	jmpl	%o7,%g0
	ldsb	[%i2+0x0ac],%l3		! Mem[000000001d0000ac]
p3_near_1_lo:
	prefetch [%o3+0x1e0],3
	ldx	[%i0+0x070],%l7		! Mem[0000000030000070]
	sdivcc	%l2,-0x23e,%l7
	prefetch [%o5+0x080],2
	prefetch [%o3+0x0e0],4
	jmpl	%o7,%g0
	ldsb	[%o2+0x0ac],%l3		! Mem[000000001d0000ac]
p3_near_1_he:
	sub	%l7,0xb6b,%l5
	ldx	[%i3+0x118],%l3		! Mem[000000001d800118]
	prefetch [%i3+0x000],4
	and	%l7,0x305,%l0
	jmpl	%o7,%g0
	addccc	%l0,0x359,%l6
p3_near_1_ho:
	sub	%l7,0xb6b,%l5
	ldx	[%o3+0x118],%l3		! Mem[000000001d800118]
	prefetch [%o3+0x000],4
	and	%l7,0x305,%l0
	jmpl	%o7,%g0
	addccc	%l0,0x359,%l6
near1_b2b_h:
	andn	%l1,-0xc74,%l5
	udiv	%l5,-0x449,%l1
	sdiv	%l1,-0xe73,%l0
	orcc	%l0,-0x3e2,%l3
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	mulx	%l4,%l3,%l3
	subc	%l6,%l5,%l6
	xnor	%l6,%l6,%l5
	umulcc	%l5,-0x3ee,%l7
	jmpl	%o7,%g0
	or	%l1,%l1,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	xnor	%l5,0x75e,%l2
	jmpl	%o7,%g0
	udivcc	%l6,0x9b8,%l2
p0_near_2_lo:
	xnor	%l5,0x75e,%l2
	jmpl	%o7,%g0
	udivcc	%l6,0x9b8,%l2
p0_near_2_he:
	subc	%l0,%l3,%l6
	jmpl	%o7,%g0
	addcc	%l6,-0x105,%l3
p0_near_2_ho:
	subc	%l0,%l3,%l6
	jmpl	%o7,%g0
	addcc	%l6,-0x105,%l3
p1_near_2_le:
	orcc	%l5,-0xe27,%l2
	jmpl	%o7,%g0
	sub	%l7,-0x5f5,%l2
p1_near_2_lo:
	orcc	%l5,-0xe27,%l2
	jmpl	%o7,%g0
	sub	%l7,-0x5f5,%l2
p1_near_2_he:
	jmpl	%o7,%g0
	umulcc	%l5,0x85e,%l2
p1_near_2_ho:
	jmpl	%o7,%g0
	umulcc	%l5,0x85e,%l2
p2_near_2_le:
	andncc	%l2,-0xa61,%l5
	lduh	[%o0+0x022],%l5		! Mem[0000000030000022]
	xor	%l7,%l4,%l3
	jmpl	%o7,%g0
	tsubcc	%l1,%l6,%l7
p2_near_2_lo:
	andncc	%l2,-0xa61,%l5
	lduh	[%i0+0x022],%l5		! Mem[0000000030000022]
	xor	%l7,%l4,%l3
	jmpl	%o7,%g0
	tsubcc	%l1,%l6,%l7
p2_near_2_he:
	srl	%l6,%l3,%l4
	jmpl	%o7,%g0
	sllx	%l4,0x00e,%l3
p2_near_2_ho:
	srl	%l6,%l3,%l4
	jmpl	%o7,%g0
	sllx	%l4,0x00e,%l3
p3_near_2_le:
	jmpl	%o7,%g0
	andcc	%l1,%l6,%l6
p3_near_2_lo:
	jmpl	%o7,%g0
	andcc	%l1,%l6,%l6
p3_near_2_he:
	prefetch [%i3+0x1a0],21
	prefetch [%i0+0x040],20
	ldsh	[%i6+0x1d2],%l5		! Mem[000000001f0001d2]
	sdiv	%l1,-0x9e5,%l1
	jmpl	%o7,%g0
	xnor	%l1,%l2,%l6
p3_near_2_ho:
	prefetch [%o3+0x1a0],21
	prefetch [%o0+0x040],20
	ldsh	[%o6+0x1d2],%l5		! Mem[000000001f0001d2]
	sdiv	%l1,-0x9e5,%l1
	jmpl	%o7,%g0
	xnor	%l1,%l2,%l6
near2_b2b_h:
	jmpl	%o7,%g0
	subccc	%l7,%l1,%l1
near2_b2b_l:
	jmpl	%o7,%g0
	udivcc	%l0,-0x0c1,%l7
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	and	%l3,%l2,%l0
	addccc	%l7,%l6,%l0
	addc	%l0,%l0,%l0
	stw	%l3,[%o3+0x040]		! Mem[0000000031800040]
	jmpl	%o7,%g0
	prefetch [%i2+0x0e0],21
p0_near_3_lo:
	and	%l3,%l2,%l0
	addccc	%l7,%l6,%l0
	addc	%l0,%l0,%l0
	stw	%l3,[%i3+0x040]		! Mem[0000000031800040]
	jmpl	%o7,%g0
	prefetch [%o2+0x0e0],21
p0_near_3_he:
	add	%l7,%l0,%l2
	sll	%l4,0x008,%l7
	mulx	%l0,0xa2b,%l5
	ldub	[%o0+0x008],%l7		! Mem[0000000030000008]
	sdivcc	%l0,0xcaa,%l1
	prefetch [%i2+0x000],3
	jmpl	%o7,%g0
	prefetch [%i1+0x0e0],20
p0_near_3_ho:
	add	%l7,%l0,%l2
	sll	%l4,0x008,%l7
	mulx	%l0,0xa2b,%l5
	ldub	[%i0+0x008],%l7		! Mem[0000000030000008]
	sdivcc	%l0,0xcaa,%l1
	prefetch [%o2+0x000],3
	jmpl	%o7,%g0
	prefetch [%o1+0x0e0],20
p1_near_3_le:
	jmpl	%o7,%g0
	andncc	%l2,-0x687,%l2
p1_near_3_lo:
	jmpl	%o7,%g0
	andncc	%l2,-0x687,%l2
p1_near_3_he:
	jmpl	%o7,%g0
	udivx	%l6,0x75f,%l5
p1_near_3_ho:
	jmpl	%o7,%g0
	udivx	%l6,0x75f,%l5
p2_near_3_le:
	addc	%l1,%l0,%l0
	prefetch [%i1+0x140],4
	jmpl	%o7,%g0
	ldsb	[%o2+0x064],%l1		! Mem[0000000031000064]
p2_near_3_lo:
	addc	%l1,%l0,%l0
	prefetch [%o1+0x140],4
	jmpl	%o7,%g0
	ldsb	[%i2+0x064],%l1		! Mem[0000000031000064]
p2_near_3_he:
	smulcc	%l7,-0xed8,%l0
	prefetch [%i1+0x080],22
	tsubcc	%l3,0x0e8,%l1
	prefetch [%i1+0x1c0],21
	jmpl	%o7,%g0
	ldd	[%o0+0x068],%l6		! Mem[0000000030000068]
p2_near_3_ho:
	smulcc	%l7,-0xed8,%l0
	prefetch [%o1+0x080],22
	tsubcc	%l3,0x0e8,%l1
	prefetch [%o1+0x1c0],21
	jmpl	%o7,%g0
	ldd	[%i0+0x068],%l6		! Mem[0000000030000068]
p3_near_3_le:
	stx	%l2,[%i3+0x040]		! Mem[000000001d800040]
	or	%l3,-0xedb,%l2
	jmpl	%o7,%g0
	add	%l1,%l1,%l6
p3_near_3_lo:
	stx	%l2,[%o3+0x040]		! Mem[000000001d800040]
	or	%l3,-0xedb,%l2
	jmpl	%o7,%g0
	add	%l1,%l1,%l6
p3_near_3_he:
	prefetch [%i0+0x180],0
	stx	%l7,[%i3+0x008]		! Mem[000000001d800008]
	jmpl	%o7,%g0
	sll	%l5,0x016,%l5
p3_near_3_ho:
	prefetch [%o0+0x180],0
	stx	%l7,[%o3+0x008]		! Mem[000000001d800008]
	jmpl	%o7,%g0
	sll	%l5,0x016,%l5
near3_b2b_h:
	umulcc	%l3,-0x19f,%l5
	subccc	%l5,%l0,%l5
	smul	%l1,-0x7d7,%l5
	orncc	%l6,%l0,%l3
	jmpl	%o7,%g0
	mulx	%l5,-0xe95,%l0
near3_b2b_l:
	xnor	%l2,%l1,%l2
	smul	%l0,%l4,%l5
	subc	%l6,-0x1c0,%l1
	umul	%l0,0x454,%l4
	jmpl	%o7,%g0
	andn	%l0,0x2f3,%l3
user_near3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far0_start:
p0_far_0_le:
	ldx	[%i0+0x050],%l7		! Mem[0000000010000050]
	sll	%l5,%l2,%l1
	addc	%l2,%l4,%l6
	srlx	%l2,%l3,%l5
	stb	%l6,[%i2+0x020]		! Mem[0000000011000020]
	srl	%l7,%l6,%l3
	jmpl	%o7,%g0
	prefetch [%i0+0x020],4
p0_far_0_lo:
	ldx	[%o0+0x050],%l7		! Mem[0000000010000050]
	sll	%l5,%l2,%l1
	addc	%l2,%l4,%l6
	srlx	%l2,%l3,%l5
	stb	%l6,[%o2+0x020]		! Mem[0000000011000020]
	srl	%l7,%l6,%l3
	jmpl	%o7,%g0
	prefetch [%o0+0x020],4
p0_far_0_he:
	ldsh	[%o1+0x048],%l7		! Mem[0000000030800048]
	sra	%l6,%l1,%l3
	prefetch [%i3+0x0e0],21
	sra	%l5,0x019,%l0
	std	%l0,[%o1+0x008]		! Mem[0000000030800008]
	prefetch [%i1+0x020],20
	jmpl	%o7,%g0
	prefetch [%i1+0x0e0],16
p0_far_0_ho:
	ldsh	[%i1+0x048],%l7		! Mem[0000000030800048]
	sra	%l6,%l1,%l3
	prefetch [%o3+0x0e0],21
	sra	%l5,0x019,%l0
	std	%l0,[%i1+0x008]		! Mem[0000000030800008]
	prefetch [%o1+0x020],20
	jmpl	%o7,%g0
	prefetch [%o1+0x0e0],16
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p1_far_0_le:
	prefetch [%i2+0x1c0],22
	xnor	%l3,0xbfd,%l2
	ldub	[%o0+0x05a],%l7		! Mem[000000003000005a]
	udivcc	%l0,0x0d8,%l1
	sdiv	%l3,0x411,%l6
	jmpl	%o7,%g0
	prefetch [%i3+0x1c0],23
p1_far_0_lo:
	prefetch [%o2+0x1c0],22
	xnor	%l3,0xbfd,%l2
	ldub	[%i0+0x05a],%l7		! Mem[000000003000005a]
	udivcc	%l0,0x0d8,%l1
	sdiv	%l3,0x411,%l6
	jmpl	%o7,%g0
	prefetch [%o3+0x1c0],23
p1_far_0_he:
	and	%l4,%l6,%l6
	jmpl	%o7,%g0
	smulcc	%l7,0xddf,%l7
p1_far_0_ho:
	and	%l4,%l6,%l6
	jmpl	%o7,%g0
	smulcc	%l7,0xddf,%l7
p1_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p2_far_0_le:
	srl	%l3,0x01e,%l4
	add	%l0,-0x2e6,%l7
	jmpl	%o7,%g0
	sdiv	%l5,-0x065,%l5
p2_far_0_lo:
	srl	%l3,0x01e,%l4
	add	%l0,-0x2e6,%l7
	jmpl	%o7,%g0
	sdiv	%l5,-0x065,%l5
p2_far_0_he:
	jmpl	%o7,%g0
	ldd	[%o3+0x020],%l0		! Mem[0000000031800020]
p2_far_0_ho:
	jmpl	%o7,%g0
	ldd	[%i3+0x020],%l0		! Mem[0000000031800020]
p2_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
p3_far_0_le:
	orn	%l4,%l5,%l2
	jmpl	%o7,%g0
	ldx	[%o2+0x078],%l4		! Mem[0000000031000078]
p3_far_0_lo:
	orn	%l4,%l5,%l2
	jmpl	%o7,%g0
	ldx	[%i2+0x078],%l4		! Mem[0000000031000078]
p3_far_0_he:
	udivx	%l0,0xa94,%l3
	udivcc	%l2,0x438,%l1
	jmpl	%o7,%g0
	srl	%l2,%l6,%l4
p3_far_0_ho:
	udivx	%l0,0xa94,%l3
	udivcc	%l2,0x438,%l1
	jmpl	%o7,%g0
	srl	%l2,%l6,%l4
p3_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	srax	%l3,%l3,%l3
	addcc	%l4,%l2,%l6
	sdiv	%l4,0x58e,%l2
	nop
	jmpl	%o7,%g0
	andncc	%l5,%l5,%l5
far0_b2b_l:
	smulcc	%l1,%l5,%l5
	addcc	%l5,0xd9d,%l7
	or	%l6,%l3,%l0
	and	%l0,-0xd9f,%l5
	jmpl	%o7,%g0
	umul	%l0,-0xb7e,%l2
user_far0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far1_start:
p0_far_1_le:
	prefetch [%i5+0x080],21
	jmpl	%o7,%g0
	or	%l7,-0x167,%l1
p0_far_1_lo:
	prefetch [%o5+0x080],21
	jmpl	%o7,%g0
	or	%l7,-0x167,%l1
p0_far_1_he:
	orcc	%l4,-0x0ce,%l4
	ldsw	[%i2+0x0a0],%l2		! Mem[00000000110000a0]
	jmpl	%o7,%g0
	subccc	%l3,%l5,%l5
p0_far_1_ho:
	orcc	%l4,-0x0ce,%l4
	ldsw	[%o2+0x0a0],%l2		! Mem[00000000110000a0]
	jmpl	%o7,%g0
	subccc	%l3,%l5,%l5
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p1_far_1_le:
	andncc	%l6,-0x8aa,%l6
	udiv	%l7,-0x3c5,%l1
	srlx	%l5,0x022,%l5
	xorcc	%l3,0x904,%l3
	jmpl	%o7,%g0
	umul	%l3,0x9b3,%l1
p1_far_1_lo:
	andncc	%l6,-0x8aa,%l6
	udiv	%l7,-0x3c5,%l1
	srlx	%l5,0x022,%l5
	xorcc	%l3,0x904,%l3
	jmpl	%o7,%g0
	umul	%l3,0x9b3,%l1
p1_far_1_he:
	orcc	%l4,-0x07f,%l5
	tsubcc	%l5,-0x3ff,%l2
	sth	%l2,[%i1+0x0ee]		! Mem[00000000148000ee]
	prefetch [%i1+0x180],20
	sub	%l1,-0x033,%l2
	add	%l6,-0x27b,%l2
	jmpl	%o7,%g0
	prefetch [%i3+0x1e0],0
p1_far_1_ho:
	orcc	%l4,-0x07f,%l5
	tsubcc	%l5,-0x3ff,%l2
	sth	%l2,[%o1+0x0ee]		! Mem[00000000148000ee]
	prefetch [%o1+0x180],20
	sub	%l1,-0x033,%l2
	add	%l6,-0x27b,%l2
	jmpl	%o7,%g0
	prefetch [%o3+0x1e0],0
p1_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p2_far_1_le:
	prefetch [%i2+0x0a0],3
	andncc	%l0,%l3,%l2
	xnor	%l7,-0xde2,%l4
	prefetch [%i1+0x1e0],20
	prefetch [%i2+0x0c0],2
	prefetch [%i1+0x080],23
	jmpl	%o7,%g0
	prefetch [%i1+0x000],1
p2_far_1_lo:
	prefetch [%o2+0x0a0],3
	andncc	%l0,%l3,%l2
	xnor	%l7,-0xde2,%l4
	prefetch [%o1+0x1e0],20
	prefetch [%o2+0x0c0],2
	prefetch [%o1+0x080],23
	jmpl	%o7,%g0
	prefetch [%o1+0x000],1
p2_far_1_he:
	andn	%l5,%l3,%l3
	jmpl	%o7,%g0
	subccc	%l0,%l6,%l2
p2_far_1_ho:
	andn	%l5,%l3,%l3
	jmpl	%o7,%g0
	subccc	%l0,%l6,%l2
p2_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
p3_far_1_le:
	sdiv	%l3,-0x08b,%l5
	smulcc	%l6,%l5,%l1
	subccc	%l5,%l2,%l1
	lduh	[%i2+0x11e],%l0		! Mem[000000001d00011e]
	jmpl	%o7,%g0
	stb	%l6,[%i6+0x17c]		! Mem[000000001f00017c]
p3_far_1_lo:
	sdiv	%l3,-0x08b,%l5
	smulcc	%l6,%l5,%l1
	subccc	%l5,%l2,%l1
	lduh	[%o2+0x11e],%l0		! Mem[000000001d00011e]
	jmpl	%o7,%g0
	stb	%l6,[%o6+0x17c]		! Mem[000000001f00017c]
p3_far_1_he:
	prefetch [%i2+0x0c0],4
	xorcc	%l4,%l7,%l5
	smul	%l4,0x30b,%l3
	andn	%l7,0x737,%l3
	jmpl	%o7,%g0
	smulcc	%l6,%l3,%l6
p3_far_1_ho:
	prefetch [%o2+0x0c0],4
	xorcc	%l4,%l7,%l5
	smul	%l4,0x30b,%l3
	andn	%l7,0x737,%l3
	jmpl	%o7,%g0
	smulcc	%l6,%l3,%l6
p3_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	sllx	%l3,%l7,%l2
	addccc	%l7,0xbad,%l3
	jmpl	%o7,%g0
	addc	%l7,%l5,%l5
far1_b2b_l:
	srax	%l4,0x00c,%l2
	sllx	%l3,0x030,%l2
	jmpl	%o7,%g0
	srax	%l3,%l7,%l6
user_far1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far2_start:
p0_far_2_le:
	xnor	%l5,-0x44c,%l7
	jmpl	%o7,%g0
	prefetch [%i1+0x0e0],23
p0_far_2_lo:
	xnor	%l5,-0x44c,%l7
	jmpl	%o7,%g0
	prefetch [%o1+0x0e0],23
p0_far_2_he:
	addcc	%l3,-0x2ea,%l7
	prefetch [%i2+0x020],2
	sdiv	%l6,0xa61,%l3
	orcc	%l2,%l6,%l4
	sub	%l2,0x822,%l3
	jmpl	%o7,%g0
	subc	%l4,-0xa37,%l1
p0_far_2_ho:
	addcc	%l3,-0x2ea,%l7
	prefetch [%o2+0x020],2
	sdiv	%l6,0xa61,%l3
	orcc	%l2,%l6,%l4
	sub	%l2,0x822,%l3
	jmpl	%o7,%g0
	subc	%l4,-0xa37,%l1
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p1_far_2_le:
	prefetch [%i1+0x1a0],23
	xnorcc	%l6,-0x241,%l2
	stx	%l1,[%i2+0x198]		! Mem[0000000015000198]
	prefetch [%i2+0x100],22
	addc	%l5,%l0,%l0
	jmpl	%o7,%g0
	udiv	%l5,-0x6e9,%l4
p1_far_2_lo:
	prefetch [%o1+0x1a0],23
	xnorcc	%l6,-0x241,%l2
	stx	%l1,[%o2+0x198]		! Mem[0000000015000198]
	prefetch [%o2+0x100],22
	addc	%l5,%l0,%l0
	jmpl	%o7,%g0
	udiv	%l5,-0x6e9,%l4
p1_far_2_he:
	jmpl	%o7,%g0
	prefetch [%i0+0x0c0],3
p1_far_2_ho:
	jmpl	%o7,%g0
	prefetch [%o0+0x0c0],3
p1_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p2_far_2_le:
	ldx	[%i0+0x018],%l1		! Mem[0000000018000018]
	prefetch [%i1+0x080],20
	prefetch [%i2+0x080],23
	subc	%l0,-0x239,%l2
	sll	%l4,%l1,%l4
	jmpl	%o7,%g0
	umul	%l0,0x238,%l5
p2_far_2_lo:
	ldx	[%o0+0x018],%l1		! Mem[0000000018000018]
	prefetch [%o1+0x080],20
	prefetch [%o2+0x080],23
	subc	%l0,-0x239,%l2
	sll	%l4,%l1,%l4
	jmpl	%o7,%g0
	umul	%l0,0x238,%l5
p2_far_2_he:
	prefetch [%i4+0x1c0],1
	prefetch [%i3+0x140],21
	jmpl	%o7,%g0
	smulcc	%l0,-0x49f,%l5
p2_far_2_ho:
	prefetch [%o4+0x1c0],1
	prefetch [%o3+0x140],21
	jmpl	%o7,%g0
	smulcc	%l0,-0x49f,%l5
p2_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
p3_far_2_le:
	jmpl	%o7,%g0
	prefetch [%i0+0x1e0],22
p3_far_2_lo:
	jmpl	%o7,%g0
	prefetch [%o0+0x1e0],22
p3_far_2_he:
	prefetch [%i2+0x080],2
	udiv	%l0,0x618,%l7
	addcc	%l0,%l0,%l5
	sth	%l4,[%o2+0x038]		! Mem[0000000031000038]
	jmpl	%o7,%g0
	lduw	[%o0+0x030],%l7		! Mem[0000000030000030]
p3_far_2_ho:
	prefetch [%o2+0x080],2
	udiv	%l0,0x618,%l7
	addcc	%l0,%l0,%l5
	sth	%l4,[%i2+0x038]		! Mem[0000000031000038]
	jmpl	%o7,%g0
	lduw	[%i0+0x030],%l7		! Mem[0000000030000030]
p3_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	srl	%l0,%l0,%l0
	taddcc	%l0,-0xebd,%l0
	andncc	%l7,%l7,%l6
	smul	%l5,0xe75,%l5
	and	%l0,%l5,%l2
	jmpl	%o7,%g0
	xnor	%l5,0x0eb,%l7
far2_b2b_l:
	mulx	%l2,0xa47,%l6
	udivx	%l1,0x851,%l2
	umulcc	%l5,%l0,%l3
	andcc	%l4,%l0,%l3
	xor	%l5,%l7,%l7
	jmpl	%o7,%g0
	or	%l6,%l3,%l1
user_far2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_far3_start:
p0_far_3_le:
	sth	%l5,[%i2+0x0d0]		! Mem[00000000110000d0]
	stw	%l2,[%i1+0x0ec]		! Mem[00000000108000ec]
	jmpl	%o7,%g0
	ldsw	[%o3+0x04c],%l4		! Mem[000000003180004c]
p0_far_3_lo:
	sth	%l5,[%o2+0x0d0]		! Mem[00000000110000d0]
	stw	%l2,[%o1+0x0ec]		! Mem[00000000108000ec]
	jmpl	%o7,%g0
	ldsw	[%i3+0x04c],%l4		! Mem[000000003180004c]
p0_far_3_he:
	smul	%l5,%l6,%l2
	prefetch [%i3+0x0e0],2
	addccc	%l3,0x31c,%l5
	xnorcc	%l3,0xd11,%l1
	lduw	[%o1+0x048],%l2		! Mem[0000000030800048]
	subccc	%l5,%l4,%l1
	jmpl	%o7,%g0
	srlx	%l5,0x01b,%l5
p0_far_3_ho:
	smul	%l5,%l6,%l2
	prefetch [%o3+0x0e0],2
	addccc	%l3,0x31c,%l5
	xnorcc	%l3,0xd11,%l1
	lduw	[%i1+0x048],%l2		! Mem[0000000030800048]
	subccc	%l5,%l4,%l1
	jmpl	%o7,%g0
	srlx	%l5,0x01b,%l5
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p1_far_3_le:
	prefetch [%i3+0x1c0],2
	jmpl	%o7,%g0
	prefetch [%i3+0x1c0],3
p1_far_3_lo:
	prefetch [%o3+0x1c0],2
	jmpl	%o7,%g0
	prefetch [%o3+0x1c0],3
p1_far_3_he:
	ldsb	[%i3+0x1c2],%l6		! Mem[00000000158001c2]
	jmpl	%o7,%g0
	addccc	%l5,0x356,%l6
p1_far_3_ho:
	ldsb	[%o3+0x1c2],%l6		! Mem[00000000158001c2]
	jmpl	%o7,%g0
	addccc	%l5,0x356,%l6
p1_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p2_far_3_le:
	addc	%l1,%l0,%l0
	ldsb	[%i1+0x066],%l2		! Mem[0000000018800066]
	mulx	%l2,%l0,%l1
	prefetch [%i1+0x0e0],0
	prefetch [%i2+0x1a0],1
	udivx	%l5,0x6f2,%l5
	jmpl	%o7,%g0
	sllx	%l2,0x033,%l0
p2_far_3_lo:
	addc	%l1,%l0,%l0
	ldsb	[%o1+0x066],%l2		! Mem[0000000018800066]
	mulx	%l2,%l0,%l1
	prefetch [%o1+0x0e0],0
	prefetch [%o2+0x1a0],1
	udivx	%l5,0x6f2,%l5
	jmpl	%o7,%g0
	sllx	%l2,0x033,%l0
p2_far_3_he:
	udivcc	%l7,-0x296,%l6
	jmpl	%o7,%g0
	addc	%l1,%l7,%l3
p2_far_3_ho:
	udivcc	%l7,-0x296,%l6
	jmpl	%o7,%g0
	addc	%l1,%l7,%l3
p2_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
p3_far_3_le:
	prefetch [%i3+0x0c0],21
	addcc	%l4,0x155,%l1
	jmpl	%o7,%g0
	sth	%l7,[%i3+0x126]		! Mem[000000001d800126]
p3_far_3_lo:
	prefetch [%o3+0x0c0],21
	addcc	%l4,0x155,%l1
	jmpl	%o7,%g0
	sth	%l7,[%o3+0x126]		! Mem[000000001d800126]
p3_far_3_he:
	addc	%l5,%l0,%l0
	subccc	%l0,%l1,%l1
	xnor	%l6,0xf3b,%l5
	stb	%l5,[%o2+0x035]		! Mem[0000000031000035]
	taddcc	%l6,%l2,%l6
	ldsb	[%i1+0x1da],%l4		! Mem[000000001c8001da]
	jmpl	%o7,%g0
	prefetch [%i1+0x120],4
p3_far_3_ho:
	addc	%l5,%l0,%l0
	subccc	%l0,%l1,%l1
	xnor	%l6,0xf3b,%l5
	stb	%l5,[%i2+0x035]		! Mem[0000000031000035]
	taddcc	%l6,%l2,%l6
	ldsb	[%o1+0x1da],%l4		! Mem[000000001c8001da]
	jmpl	%o7,%g0
	prefetch [%o1+0x120],4
p3_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	jmpl	%o7,%g0
	xnorcc	%l0,%l3,%l3
far3_b2b_l:
	jmpl	%o7,%g0
	addccc	%l6,%l5,%l1
user_far3_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	sllx	%l3,%l1,%l4
	andncc	%l2,%l6,%l2
	stb	%l0,[%o0+0x001]		! Mem[0000000030000001]
	sdiv	%l5,0xd74,%l1
	lduh	[%i3+0x0a2],%l2		! Mem[00000000118000a2]
	stb	%l1,[%i2+0x04c]		! Mem[000000001100004c]
	jmpl	%g6+8,%g0
	sth	%l0,[%o0+0x002]		! Mem[0000000030000002]
p0_call_0_le:
	addc	%l7,%l1,%l6
	ldsb	[%i3+0x0b7],%l0		! Mem[00000000118000b7]
	prefetch [%i2+0x060],23
	andn	%l5,%l3,%l4
	add	%l1,%l1,%l2
	addc	%l3,%l0,%l0
	retl
	stw	%l6,[%i1+0x04c]		! Mem[000000001080004c]
p0_jmpl_0_lo:
	sllx	%l3,%l1,%l4
	andncc	%l2,%l6,%l2
	stb	%l0,[%i0+0x001]		! Mem[0000000030000001]
	sdiv	%l5,0xd74,%l1
	lduh	[%o3+0x0a2],%l2		! Mem[00000000118000a2]
	stb	%l1,[%o2+0x04c]		! Mem[000000001100004c]
	jmpl	%g6+8,%g0
	sth	%l0,[%i0+0x002]		! Mem[0000000030000002]
p0_call_0_lo:
	addc	%l7,%l1,%l6
	ldsb	[%o3+0x0b7],%l0		! Mem[00000000118000b7]
	prefetch [%o2+0x060],23
	andn	%l5,%l3,%l4
	add	%l1,%l1,%l2
	addc	%l3,%l0,%l0
	retl
	stw	%l6,[%o1+0x04c]		! Mem[000000001080004c]
p0_jmpl_0_he:
	sll	%l2,0x001,%l2
	std	%l2,[%o0+0x040]		! Mem[0000000030000040]
	std	%l0,[%i2+0x0a0]		! Mem[00000000110000a0]
	ldub	[%i0+0x0c8],%l2		! Mem[00000000100000c8]
	sdiv	%l4,0x332,%l2
	stx	%l4,[%o3+0x000]		! Mem[0000000031800000]
	jmpl	%g6+8,%g0
	udivcc	%l7,-0x342,%l4
p0_call_0_he:
	retl
	prefetch [%i4+0x080],1
p0_jmpl_0_ho:
	sll	%l2,0x001,%l2
	std	%l2,[%i0+0x040]		! Mem[0000000030000040]
	std	%l0,[%o2+0x0a0]		! Mem[00000000110000a0]
	ldub	[%o0+0x0c8],%l2		! Mem[00000000100000c8]
	sdiv	%l4,0x332,%l2
	stx	%l4,[%i3+0x000]		! Mem[0000000031800000]
	jmpl	%g6+8,%g0
	udivcc	%l7,-0x342,%l4
p0_call_0_ho:
	retl
	prefetch [%o4+0x080],1
p1_jmpl_0_le:
	addc	%l2,%l3,%l7
	xorcc	%l0,-0x8a1,%l2
	stb	%l1,[%o0+0x05e]		! Mem[000000003000005e]
	ldub	[%i0+0x02e],%l3		! Mem[000000001400002e]
	srlx	%l2,0x013,%l1
	jmpl	%g6+8,%g0
	smul	%l2,-0xb81,%l6
p1_call_0_le:
	srax	%l0,0x031,%l0
	retl
	stw	%l1,[%i2+0x0b4]		! Mem[00000000150000b4]
p1_jmpl_0_lo:
	addc	%l2,%l3,%l7
	xorcc	%l0,-0x8a1,%l2
	stb	%l1,[%i0+0x05e]		! Mem[000000003000005e]
	ldub	[%o0+0x02e],%l3		! Mem[000000001400002e]
	srlx	%l2,0x013,%l1
	jmpl	%g6+8,%g0
	smul	%l2,-0xb81,%l6
p1_call_0_lo:
	srax	%l0,0x031,%l0
	retl
	stw	%l1,[%o2+0x0b4]		! Mem[00000000150000b4]
p1_jmpl_0_he:
	andcc	%l4,%l1,%l0
	ldsw	[%o3+0x05c],%l2		! Mem[000000003180005c]
	jmpl	%g6+8,%g0
	stx	%l3,[%i0+0x1d0]		! Mem[00000000140001d0]
p1_call_0_he:
	prefetch [%i1+0x1e0],23
	sdivx	%l2,0xe89,%l5
	xor	%l1,%l3,%l4
	retl
	prefetch [%i6+0x1e0],4
p1_jmpl_0_ho:
	andcc	%l4,%l1,%l0
	ldsw	[%i3+0x05c],%l2		! Mem[000000003180005c]
	jmpl	%g6+8,%g0
	stx	%l3,[%o0+0x1d0]		! Mem[00000000140001d0]
p1_call_0_ho:
	prefetch [%o1+0x1e0],23
	sdivx	%l2,0xe89,%l5
	xor	%l1,%l3,%l4
	retl
	prefetch [%o6+0x1e0],4
p2_jmpl_0_le:
	prefetch [%i1+0x0c0],1
	orncc	%l0,0x4d5,%l7
	sra	%l5,%l3,%l0
	jmpl	%g6+8,%g0
	taddcc	%l3,%l2,%l6
p2_call_0_le:
	ldub	[%o0+0x02b],%l2		! Mem[000000003000002b]
	prefetch [%i3+0x120],16
	ldd	[%i2+0x1a0],%l6		! Mem[00000000190001a0]
	retl
	ldsb	[%i3+0x09f],%l5		! Mem[000000001980009f]
p2_jmpl_0_lo:
	prefetch [%o1+0x0c0],1
	orncc	%l0,0x4d5,%l7
	sra	%l5,%l3,%l0
	jmpl	%g6+8,%g0
	taddcc	%l3,%l2,%l6
p2_call_0_lo:
	ldub	[%i0+0x02b],%l2		! Mem[000000003000002b]
	prefetch [%o3+0x120],16
	ldd	[%o2+0x1a0],%l6		! Mem[00000000190001a0]
	retl
	ldsb	[%o3+0x09f],%l5		! Mem[000000001980009f]
p2_jmpl_0_he:
	ldd	[%o1+0x060],%l4		! Mem[0000000030800060]
	xnor	%l2,0xb32,%l5
	jmpl	%g6+8,%g0
	prefetch [%i3+0x120],20
p2_call_0_he:
	andcc	%l3,%l2,%l7
	xorcc	%l1,-0x121,%l1
	srax	%l2,%l6,%l6
	xnor	%l5,%l0,%l0
	ldsw	[%o0+0x024],%l4		! Mem[0000000030000024]
	retl
	prefetch [%i3+0x060],2
p2_jmpl_0_ho:
	ldd	[%i1+0x060],%l4		! Mem[0000000030800060]
	xnor	%l2,0xb32,%l5
	jmpl	%g6+8,%g0
	prefetch [%o3+0x120],20
p2_call_0_ho:
	andcc	%l3,%l2,%l7
	xorcc	%l1,-0x121,%l1
	srax	%l2,%l6,%l6
	xnor	%l5,%l0,%l0
	ldsw	[%i0+0x024],%l4		! Mem[0000000030000024]
	retl
	prefetch [%o3+0x060],2
p3_jmpl_0_le:
	umulcc	%l0,-0x9ab,%l0
	orcc	%l7,0x8dc,%l3
	sdiv	%l0,-0x5f0,%l3
	jmpl	%g6+8,%g0
	std	%l4,[%o2+0x038]		! Mem[0000000031000038]
p3_call_0_le:
	or	%l5,0xca3,%l2
	retl
	umulcc	%l6,%l7,%l1
p3_jmpl_0_lo:
	umulcc	%l0,-0x9ab,%l0
	orcc	%l7,0x8dc,%l3
	sdiv	%l0,-0x5f0,%l3
	jmpl	%g6+8,%g0
	std	%l4,[%i2+0x038]		! Mem[0000000031000038]
p3_call_0_lo:
	or	%l5,0xca3,%l2
	retl
	umulcc	%l6,%l7,%l1
p3_jmpl_0_he:
	orcc	%l0,%l4,%l6
	xnorcc	%l4,0x4a9,%l7
	umul	%l6,%l2,%l6
	add	%l2,-0xca3,%l3
	ldsb	[%o3+0x035],%l2		! Mem[0000000031800035]
	jmpl	%g6+8,%g0
	ldx	[%o0+0x070],%l7		! Mem[0000000030000070]
p3_call_0_he:
	retl
	xnor	%l1,0x154,%l7
p3_jmpl_0_ho:
	orcc	%l0,%l4,%l6
	xnorcc	%l4,0x4a9,%l7
	umul	%l6,%l2,%l6
	add	%l2,-0xca3,%l3
	ldsb	[%i3+0x035],%l2		! Mem[0000000031800035]
	jmpl	%g6+8,%g0
	ldx	[%i0+0x070],%l7		! Mem[0000000030000070]
p3_call_0_ho:
	retl
	xnor	%l1,0x154,%l7
user_jump0_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	taddcc	%l5,0x2f5,%l6
	nop
	ldsb	[%o2+0x043],%l2		! Mem[0000000031000043]
	jmpl	%g6+8,%g0
	xor	%l2,%l2,%l6
p0_call_1_le:
	retl
	andncc	%l4,%l7,%l6
p0_jmpl_1_lo:
	taddcc	%l5,0x2f5,%l6
	nop
	ldsb	[%i2+0x043],%l2		! Mem[0000000031000043]
	jmpl	%g6+8,%g0
	xor	%l2,%l2,%l6
p0_call_1_lo:
	retl
	andncc	%l4,%l7,%l6
p0_jmpl_1_he:
	udivcc	%l6,0xe3f,%l5
	xnorcc	%l3,-0x576,%l7
	smulcc	%l2,0x263,%l2
	jmpl	%g6+8,%g0
	prefetch [%i4+0x0a0],22
p0_call_1_he:
	xor	%l4,%l2,%l1
	andncc	%l3,%l5,%l3
	smulcc	%l5,%l2,%l5
	ldx	[%o0+0x008],%l0		! Mem[0000000030000008]
	addcc	%l0,%l2,%l3
	sdivcc	%l1,-0x9d4,%l3
	retl
	stb	%l1,[%o1+0x04b]		! Mem[000000003080004b]
p0_jmpl_1_ho:
	udivcc	%l6,0xe3f,%l5
	xnorcc	%l3,-0x576,%l7
	smulcc	%l2,0x263,%l2
	jmpl	%g6+8,%g0
	prefetch [%o4+0x0a0],22
p0_call_1_ho:
	xor	%l4,%l2,%l1
	andncc	%l3,%l5,%l3
	smulcc	%l5,%l2,%l5
	ldx	[%i0+0x008],%l0		! Mem[0000000030000008]
	addcc	%l0,%l2,%l3
	sdivcc	%l1,-0x9d4,%l3
	retl
	stb	%l1,[%i1+0x04b]		! Mem[000000003080004b]
p1_jmpl_1_le:
	udivx	%l4,-0x627,%l1
	ldsw	[%o1+0x050],%l7		! Mem[0000000030800050]
	and	%l2,%l6,%l2
	subccc	%l1,%l0,%l1
	ldsw	[%o3+0x010],%l3		! Mem[0000000031800010]
	prefetch [%i3+0x140],23
	jmpl	%g6+8,%g0
	prefetch [%i3+0x1e0],1
p1_call_1_le:
	umulcc	%l6,0xb70,%l2
	prefetch [%i3+0x180],23
	retl
	andn	%l1,%l0,%l5
p1_jmpl_1_lo:
	udivx	%l4,-0x627,%l1
	ldsw	[%i1+0x050],%l7		! Mem[0000000030800050]
	and	%l2,%l6,%l2
	subccc	%l1,%l0,%l1
	ldsw	[%i3+0x010],%l3		! Mem[0000000031800010]
	prefetch [%o3+0x140],23
	jmpl	%g6+8,%g0
	prefetch [%o3+0x1e0],1
p1_call_1_lo:
	umulcc	%l6,0xb70,%l2
	prefetch [%o3+0x180],23
	retl
	andn	%l1,%l0,%l5
p1_jmpl_1_he:
	prefetch [%i2+0x080],22
	ldd	[%i3+0x028],%l0		! Mem[0000000015800028]
	ldub	[%i0+0x041],%l4		! Mem[0000000014000041]
	prefetch [%i6+0x160],0
	udivx	%l0,0x6a0,%l1
	prefetch [%i2+0x080],2
	jmpl	%g6+8,%g0
	addccc	%l2,0xf85,%l3
p1_call_1_he:
	xor	%l4,%l3,%l0
	stw	%l4,[%i6+0x0a0]		! Mem[00000000170000a0]
	retl
	ldsb	[%o1+0x05f],%l1		! Mem[000000003080005f]
p1_jmpl_1_ho:
	prefetch [%o2+0x080],22
	ldd	[%o3+0x028],%l0		! Mem[0000000015800028]
	ldub	[%o0+0x041],%l4		! Mem[0000000014000041]
	prefetch [%o6+0x160],0
	udivx	%l0,0x6a0,%l1
	prefetch [%o2+0x080],2
	jmpl	%g6+8,%g0
	addccc	%l2,0xf85,%l3
p1_call_1_ho:
	xor	%l4,%l3,%l0
	stw	%l4,[%o6+0x0a0]		! Mem[00000000170000a0]
	retl
	ldsb	[%i1+0x05f],%l1		! Mem[000000003080005f]
p2_jmpl_1_le:
	prefetch [%i3+0x080],22
	jmpl	%g6+8,%g0
	sll	%l4,0x000,%l2
p2_call_1_le:
	retl
	orn	%l1,%l0,%l5
p2_jmpl_1_lo:
	prefetch [%o3+0x080],22
	jmpl	%g6+8,%g0
	sll	%l4,0x000,%l2
p2_call_1_lo:
	retl
	orn	%l1,%l0,%l5
p2_jmpl_1_he:
	prefetch [%i1+0x100],22
	addc	%l6,%l4,%l1
	sub	%l1,%l6,%l3
	swap	[%i1+0x1e4],%l5		! Mem[00000000188001e4]
	ldub	[%i0+0x040],%l5		! Mem[0000000018000040]
	srl	%l3,0x018,%l7
	jmpl	%g6+8,%g0
	ldsw	[%o3+0x06c],%l1		! Mem[000000003180006c]
p2_call_1_he:
	sllx	%l5,0x035,%l6
	mulx	%l3,%l5,%l1
	prefetch [%i0+0x160],4
	ldsw	[%i3+0x1d4],%l4		! Mem[00000000198001d4]
	lduh	[%i2+0x09c],%l5		! Mem[000000001900009c]
	retl
	sdiv	%l1,-0x412,%l2
p2_jmpl_1_ho:
	prefetch [%o1+0x100],22
	addc	%l6,%l4,%l1
	sub	%l1,%l6,%l3
	swap	[%o1+0x1e4],%l5		! Mem[00000000188001e4]
	ldub	[%o0+0x040],%l5		! Mem[0000000018000040]
	srl	%l3,0x018,%l7
	jmpl	%g6+8,%g0
	ldsw	[%i3+0x06c],%l1		! Mem[000000003180006c]
p2_call_1_ho:
	sllx	%l5,0x035,%l6
	mulx	%l3,%l5,%l1
	prefetch [%o0+0x160],4
	ldsw	[%o3+0x1d4],%l4		! Mem[00000000198001d4]
	lduh	[%o2+0x09c],%l5		! Mem[000000001900009c]
	retl
	sdiv	%l1,-0x412,%l2
p3_jmpl_1_le:
	prefetch [%i1+0x080],16
	smul	%l0,%l5,%l4
	jmpl	%g6+8,%g0
	xorcc	%l6,%l5,%l6
p3_call_1_le:
	retl
	taddcc	%l5,-0xa7b,%l5
p3_jmpl_1_lo:
	prefetch [%o1+0x080],16
	smul	%l0,%l5,%l4
	jmpl	%g6+8,%g0
	xorcc	%l6,%l5,%l6
p3_call_1_lo:
	retl
	taddcc	%l5,-0xa7b,%l5
p3_jmpl_1_he:
	orn	%l0,%l3,%l1
	xnor	%l2,0xca2,%l1
	prefetch [%i2+0x0c0],4
	srl	%l4,%l2,%l5
	sth	%l3,[%o2+0x07c]		! Mem[000000003100007c]
	jmpl	%g6+8,%g0
	std	%l6,[%i3+0x198]		! Mem[000000001d800198]
p3_call_1_he:
	udivcc	%l0,-0xade,%l3
	andcc	%l4,-0x2ff,%l1
	prefetch [%i3+0x100],3
	xor	%l4,%l6,%l7
	retl
	addc	%l6,%l0,%l7
p3_jmpl_1_ho:
	orn	%l0,%l3,%l1
	xnor	%l2,0xca2,%l1
	prefetch [%o2+0x0c0],4
	srl	%l4,%l2,%l5
	sth	%l3,[%i2+0x07c]		! Mem[000000003100007c]
	jmpl	%g6+8,%g0
	std	%l6,[%o3+0x198]		! Mem[000000001d800198]
p3_call_1_ho:
	udivcc	%l0,-0xade,%l3
	andcc	%l4,-0x2ff,%l1
	prefetch [%o3+0x100],3
	xor	%l4,%l6,%l7
	retl
	addc	%l6,%l0,%l7
user_jump1_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	sub	%l1,%l4,%l0
	stw	%l1,[%o0+0x048]		! Mem[0000000030000048]
	xnorcc	%l3,0xeef,%l7
	ldsw	[%o5+0x010],%l2		! Mem[0000000040000010]
	ldsw	[%o0+0x004],%l2		! Mem[0000000030000004]
	mulx	%l3,0xb83,%l2
	jmpl	%g6+8,%g0
	orcc	%l5,-0x1c7,%l0
p0_call_2_le:
	xor	%l1,-0x7d1,%l0
	retl
	prefetch [%i5+0x0c0],4
p0_jmpl_2_lo:
	sub	%l1,%l4,%l0
	stw	%l1,[%i0+0x048]		! Mem[0000000030000048]
	xnorcc	%l3,0xeef,%l7
	ldsw	[%i5+0x010],%l2		! Mem[0000000040000010]
	ldsw	[%i0+0x004],%l2		! Mem[0000000030000004]
	mulx	%l3,0xb83,%l2
	jmpl	%g6+8,%g0
	orcc	%l5,-0x1c7,%l0
p0_call_2_lo:
	xor	%l1,-0x7d1,%l0
	retl
	prefetch [%o5+0x0c0],4
p0_jmpl_2_he:
	add	%l1,0xbc4,%l4
	prefetch [%i3+0x020],1
	prefetch [%i1+0x080],21
	jmpl	%g6+8,%g0
	umul	%l5,%l7,%l6
p0_call_2_he:
	retl
	smul	%l1,%l1,%l7
p0_jmpl_2_ho:
	add	%l1,0xbc4,%l4
	prefetch [%o3+0x020],1
	prefetch [%o1+0x080],21
	jmpl	%g6+8,%g0
	umul	%l5,%l7,%l6
p0_call_2_ho:
	retl
	smul	%l1,%l1,%l7
p1_jmpl_2_le:
	prefetch [%i1+0x140],4
	jmpl	%g6+8,%g0
	xor	%l4,-0xc7a,%l4
p1_call_2_le:
	swap	[%i1+0x098],%l7		! Mem[0000000014800098]
	subc	%l6,%l7,%l1
	srlx	%l1,%l7,%l3
	addcc	%l4,0x41b,%l4
	prefetch [%i2+0x0e0],16
	retl
	tsubcc	%l2,%l1,%l6
p1_jmpl_2_lo:
	prefetch [%o1+0x140],4
	jmpl	%g6+8,%g0
	xor	%l4,-0xc7a,%l4
p1_call_2_lo:
	swap	[%o1+0x098],%l7		! Mem[0000000014800098]
	subc	%l6,%l7,%l1
	srlx	%l1,%l7,%l3
	addcc	%l4,0x41b,%l4
	prefetch [%o2+0x0e0],16
	retl
	tsubcc	%l2,%l1,%l6
p1_jmpl_2_he:
	sra	%l2,%l5,%l7
	sra	%l0,0x000,%l6
	subccc	%l6,%l5,%l2
	prefetch [%i0+0x040],1
	xorcc	%l5,%l4,%l6
	jmpl	%g6+8,%g0
	ldub	[%o2+0x015],%l1		! Mem[0000000031000015]
p1_call_2_he:
	std	%l2,[%o1+0x050]		! Mem[0000000030800050]
	xnor	%l1,%l7,%l4
	retl
	prefetch [%i0+0x100],20
p1_jmpl_2_ho:
	sra	%l2,%l5,%l7
	sra	%l0,0x000,%l6
	subccc	%l6,%l5,%l2
	prefetch [%o0+0x040],1
	xorcc	%l5,%l4,%l6
	jmpl	%g6+8,%g0
	ldub	[%i2+0x015],%l1		! Mem[0000000031000015]
p1_call_2_ho:
	std	%l2,[%i1+0x050]		! Mem[0000000030800050]
	xnor	%l1,%l7,%l4
	retl
	prefetch [%o0+0x100],20
p2_jmpl_2_le:
	ldub	[%o1+0x06b],%l2		! Mem[000000003080006b]
	stw	%l4,[%o1+0x028]		! Mem[0000000030800028]
	jmpl	%g6+8,%g0
	prefetch [%i3+0x020],4
p2_call_2_le:
	sdivx	%l6,-0x94c,%l0
	prefetch [%i2+0x040],1
	subccc	%l1,%l5,%l1
	ldsw	[%o3+0x024],%l4		! Mem[0000000031800024]
	retl
	prefetch [%i2+0x0a0],2
p2_jmpl_2_lo:
	ldub	[%i1+0x06b],%l2		! Mem[000000003080006b]
	stw	%l4,[%i1+0x028]		! Mem[0000000030800028]
	jmpl	%g6+8,%g0
	prefetch [%o3+0x020],4
p2_call_2_lo:
	sdivx	%l6,-0x94c,%l0
	prefetch [%o2+0x040],1
	subccc	%l1,%l5,%l1
	ldsw	[%i3+0x024],%l4		! Mem[0000000031800024]
	retl
	prefetch [%o2+0x0a0],2
p2_jmpl_2_he:
	jmpl	%g6+8,%g0
	umul	%l0,-0x2e6,%l3
p2_call_2_he:
	srax	%l7,0x015,%l7
	retl
	taddcc	%l2,%l1,%l3
p2_jmpl_2_ho:
	jmpl	%g6+8,%g0
	umul	%l0,-0x2e6,%l3
p2_call_2_ho:
	srax	%l7,0x015,%l7
	retl
	taddcc	%l2,%l1,%l3
p3_jmpl_2_le:
	xnorcc	%l7,0xb5f,%l1
	ldsb	[%o2+0x074],%l0		! Mem[0000000031000074]
	addc	%l6,%l0,%l0
	xor	%l2,-0x24a,%l6
	jmpl	%g6+8,%g0
	umul	%l0,%l1,%l6
p3_call_2_le:
	xorcc	%l7,%l1,%l6
	retl
	addccc	%l3,0x721,%l3
p3_jmpl_2_lo:
	xnorcc	%l7,0xb5f,%l1
	ldsb	[%i2+0x074],%l0		! Mem[0000000031000074]
	addc	%l6,%l0,%l0
	xor	%l2,-0x24a,%l6
	jmpl	%g6+8,%g0
	umul	%l0,%l1,%l6
p3_call_2_lo:
	xorcc	%l7,%l1,%l6
	retl
	addccc	%l3,0x721,%l3
p3_jmpl_2_he:
	srax	%l1,%l5,%l3
	addcc	%l5,%l6,%l5
	xor	%l3,%l5,%l1
	subccc	%l0,-0x306,%l7
	jmpl	%g6+8,%g0
	prefetch [%i1+0x140],1
p3_call_2_he:
	stw	%l0,[%i0+0x0c0]		! Mem[000000001c0000c0]
	xor	%l7,-0xdde,%l5
	prefetch [%i2+0x000],22
	prefetch [%i2+0x1e0],0
	sllx	%l4,0x02f,%l6
	prefetch [%i6+0x1c0],4
	retl
	mulx	%l7,%l5,%l2
p3_jmpl_2_ho:
	srax	%l1,%l5,%l3
	addcc	%l5,%l6,%l5
	xor	%l3,%l5,%l1
	subccc	%l0,-0x306,%l7
	jmpl	%g6+8,%g0
	prefetch [%o1+0x140],1
p3_call_2_ho:
	stw	%l0,[%o0+0x0c0]		! Mem[000000001c0000c0]
	xor	%l7,-0xdde,%l5
	prefetch [%o2+0x000],22
	prefetch [%o2+0x1e0],0
	sllx	%l4,0x02f,%l6
	prefetch [%o6+0x1c0],4
	retl
	mulx	%l7,%l5,%l2
user_jump2_end:
	.seg	"text"
	ALIGN_PAGE_8K
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	or	%l0,0x46a,%l0
	addccc	%l2,%l2,%l5
	orn	%l1,%l7,%l5
	tsubcc	%l0,0xab0,%l3
	subc	%l6,0x01a,%l4
	jmpl	%g6+8,%g0
	ldsh	[%o0+0x044],%l2		! Mem[0000000030000044]
p0_call_3_le:
	ldstub	[%o5+0x014],%l1		! Mem[0000000040000014]
	prefetch [%i3+0x020],4
	ldsb	[%o1+0x04f],%l6		! Mem[000000003080004f]
	retl
	udivcc	%l2,0x45a,%l1
p0_jmpl_3_lo:
	or	%l0,0x46a,%l0
	addccc	%l2,%l2,%l5
	orn	%l1,%l7,%l5
	tsubcc	%l0,0xab0,%l3
	subc	%l6,0x01a,%l4
	jmpl	%g6+8,%g0
	ldsh	[%i0+0x044],%l2		! Mem[0000000030000044]
p0_call_3_lo:
	ldstub	[%i5+0x014],%l1		! Mem[0000000040000014]
	prefetch [%o3+0x020],4
	ldsb	[%i1+0x04f],%l6		! Mem[000000003080004f]
	retl
	udivcc	%l2,0x45a,%l1
p0_jmpl_3_he:
	udiv	%l2,-0x742,%l0
	jmpl	%g6+8,%g0
	udiv	%l3,-0xb59,%l4
p0_call_3_he:
	sub	%l2,%l3,%l6
	stb	%l7,[%i2+0x0f3]		! Mem[00000000110000f3]
	prefetch [%i2+0x0c0],3
	prefetch [%i0+0x020],16
	or	%l7,0x9e1,%l0
	sllx	%l7,%l0,%l3
	retl
	umulcc	%l4,-0xb4b,%l5
p0_jmpl_3_ho:
	udiv	%l2,-0x742,%l0
	jmpl	%g6+8,%g0
	udiv	%l3,-0xb59,%l4
p0_call_3_ho:
	sub	%l2,%l3,%l6
	stb	%l7,[%o2+0x0f3]		! Mem[00000000110000f3]
	prefetch [%o2+0x0c0],3
	prefetch [%o0+0x020],16
	or	%l7,0x9e1,%l0
	sllx	%l7,%l0,%l3
	retl
	umulcc	%l4,-0xb4b,%l5
p1_jmpl_3_le:
	add	%l0,-0x280,%l6
	srlx	%l4,0x017,%l2
	tsubcc	%l3,-0xd70,%l0
	swap	[%i2+0x1dc],%l6		! Mem[00000000150001dc]
	prefetch [%i0+0x080],22
	ldx	[%o3+0x018],%l1		! Mem[0000000031800018]
	jmpl	%g6+8,%g0
	and	%l1,-0x471,%l1
p1_call_3_le:
	prefetch [%i2+0x160],0
	prefetch [%i2+0x160],4
	retl
	subccc	%l2,-0x45d,%l0
p1_jmpl_3_lo:
	add	%l0,-0x280,%l6
	srlx	%l4,0x017,%l2
	tsubcc	%l3,-0xd70,%l0
	swap	[%o2+0x1dc],%l6		! Mem[00000000150001dc]
	prefetch [%o0+0x080],22
	ldx	[%i3+0x018],%l1		! Mem[0000000031800018]
	jmpl	%g6+8,%g0
	and	%l1,-0x471,%l1
p1_call_3_lo:
	prefetch [%o2+0x160],0
	prefetch [%o2+0x160],4
	retl
	subccc	%l2,-0x45d,%l0
p1_jmpl_3_he:
	tsubcc	%l4,0x174,%l5
	prefetch [%i1+0x120],22
	srlx	%l2,0x00d,%l1
	smulcc	%l6,-0x766,%l6
	jmpl	%g6+8,%g0
	orn	%l0,-0x6c5,%l3
p1_call_3_he:
	orcc	%l3,0x30f,%l2
	smul	%l1,%l5,%l5
	subccc	%l1,%l1,%l0
	taddcc	%l7,%l3,%l0
	xor	%l1,0x0cb,%l0
	retl
	prefetch [%i3+0x100],23
p1_jmpl_3_ho:
	tsubcc	%l4,0x174,%l5
	prefetch [%o1+0x120],22
	srlx	%l2,0x00d,%l1
	smulcc	%l6,-0x766,%l6
	jmpl	%g6+8,%g0
	orn	%l0,-0x6c5,%l3
p1_call_3_ho:
	orcc	%l3,0x30f,%l2
	smul	%l1,%l5,%l5
	subccc	%l1,%l1,%l0
	taddcc	%l7,%l3,%l0
	xor	%l1,0x0cb,%l0
	retl
	prefetch [%o3+0x100],23
p2_jmpl_3_le:
	addccc	%l5,0xa1d,%l6
	jmpl	%g6+8,%g0
	sll	%l7,%l6,%l5
p2_call_3_le:
	prefetch [%i3+0x0c0],2
	prefetch [%i3+0x180],22
	and	%l5,0x4fa,%l5
	sllx	%l4,0x026,%l3
	retl
	prefetch [%i3+0x140],20
p2_jmpl_3_lo:
	addccc	%l5,0xa1d,%l6
	jmpl	%g6+8,%g0
	sll	%l7,%l6,%l5
p2_call_3_lo:
	prefetch [%o3+0x0c0],2
	prefetch [%o3+0x180],22
	and	%l5,0x4fa,%l5
	sllx	%l4,0x026,%l3
	retl
	prefetch [%o3+0x140],20
p2_jmpl_3_he:
	stb	%l2,[%i0+0x0fe]		! Mem[00000000180000fe]
	ldub	[%o5+0x03a],%l1		! Mem[000000004000003a]
	jmpl	%g6+8,%g0
	sll	%l6,0x009,%l3
p2_call_3_he:
	prefetch [%i0+0x100],20
	xnorcc	%l5,0xdbe,%l3
	sub	%l2,0xd51,%l1
	addccc	%l6,%l6,%l3
	orn	%l6,-0xda8,%l5
	retl
	sll	%l0,0x01c,%l6
p2_jmpl_3_ho:
	stb	%l2,[%o0+0x0fe]		! Mem[00000000180000fe]
	ldub	[%i5+0x03a],%l1		! Mem[000000004000003a]
	jmpl	%g6+8,%g0
	sll	%l6,0x009,%l3
p2_call_3_ho:
	prefetch [%o0+0x100],20
	xnorcc	%l5,0xdbe,%l3
	sub	%l2,0xd51,%l1
	addccc	%l6,%l6,%l3
	orn	%l6,-0xda8,%l5
	retl
	sll	%l0,0x01c,%l6
p3_jmpl_3_le:
	xnorcc	%l0,0x883,%l6
	subc	%l2,%l2,%l1
	sra	%l3,0x012,%l2
	jmpl	%g6+8,%g0
	prefetch [%i2+0x180],20
p3_call_3_le:
	lduh	[%o1+0x07c],%l5		! Mem[000000003080007c]
	orn	%l3,-0x997,%l0
	swap	[%i0+0x1cc],%l7		! Mem[000000001c0001cc]
	udivx	%l4,0x085,%l3
	std	%l2,[%i2+0x0a8]		! Mem[000000001d0000a8]
	stb	%l4,[%o2+0x078]		! Mem[0000000031000078]
	retl
	ldd	[%o0+0x030],%l2		! Mem[0000000030000030]
p3_jmpl_3_lo:
	xnorcc	%l0,0x883,%l6
	subc	%l2,%l2,%l1
	sra	%l3,0x012,%l2
	jmpl	%g6+8,%g0
	prefetch [%o2+0x180],20
p3_call_3_lo:
	lduh	[%i1+0x07c],%l5		! Mem[000000003080007c]
	orn	%l3,-0x997,%l0
	swap	[%o0+0x1cc],%l7		! Mem[000000001c0001cc]
	udivx	%l4,0x085,%l3
	std	%l2,[%o2+0x0a8]		! Mem[000000001d0000a8]
	stb	%l4,[%i2+0x078]		! Mem[0000000031000078]
	retl
	ldd	[%i0+0x030],%l2		! Mem[0000000030000030]
p3_jmpl_3_he:
	ldsb	[%o3+0x03e],%l7		! Mem[000000003180003e]
	or	%l2,%l5,%l2
	ldsh	[%o1+0x078],%l5		! Mem[0000000030800078]
	xorcc	%l4,0x041,%l5
	udiv	%l6,0xd09,%l5
	prefetch [%i1+0x1e0],4
	jmpl	%g6+8,%g0
	stw	%l0,[%i1+0x110]		! Mem[000000001c800110]
p3_call_3_he:
	retl
	prefetch [%i0+0x0e0],22
p3_jmpl_3_ho:
	ldsb	[%i3+0x03e],%l7		! Mem[000000003180003e]
	or	%l2,%l5,%l2
	ldsh	[%i1+0x078],%l5		! Mem[0000000030800078]
	xorcc	%l4,0x041,%l5
	udiv	%l6,0xd09,%l5
	prefetch [%o1+0x1e0],4
	jmpl	%g6+8,%g0
	stw	%l0,[%o1+0x110]		! Mem[000000001c800110]
p3_call_3_ho:
	retl
	prefetch [%o0+0x0e0],22
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
	.word	0x59722b00,0x0ff11fa5		! Init value for %l0
	.word	0xb0178200,0x525d1e9b		! Init value for %l1
	.word	0x220c7200,0x5095e099		! Init value for %l2
	.word	0x76f2e000,0x179c60a9		! Init value for %l3
	.word	0xe13664ff,0xc60d4c51		! Init value for %l4
	.word	0xcf2b1cff,0x90d5b1d0		! Init value for %l5
	.word	0x604dc5ff,0xd1e5dbce		! Init value for %l6
	.word	0x78103100,0x62f5c7c4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x0c93e933,0x4032ede6		! Init value for %f0 
	.word	0xca5ea27d,0x454bcf7d		! Init value for %f2 
	.word	0xc1f2eeca,0x20534db2		! Init value for %f4 
	.word	0x7197f1c6,0x90da9f95		! Init value for %f6 
	.word	0x49f955fc,0xb28a92dc		! Init value for %f8 
	.word	0x038bdc18,0xa3290154		! Init value for %f10
	.word	0x253461ae,0xefa3f0d0		! Init value for %f12
	.word	0xd2c263b4,0x7f069c76		! Init value for %f14
	.word	0x4d2c1099,0xc61e4e34		! Init value for %f16
	.word	0x1ff7720f,0xd934d788		! Init value for %f18
	.word	0x2346f85b,0x24dc609f		! Init value for %f20
	.word	0x4874d559,0x627d5242		! Init value for %f22
	.word	0x19e301bf,0xbcdbd69e		! Init value for %f24
	.word	0xfc3799d8,0x58c578d9		! Init value for %f26
	.word	0x9cc40ab5,0x0c6b6220		! Init value for %f28
	.word	0x412cec15,0x57d7f5f0		! Init value for %f30
	.word	0x7a6256d3,0x20adb685		! Init value for %f32
	.word	0xb4189bf5,0xd9416c1c		! Init value for %f34
	.word	0x32c4c3e7,0xeb185c91		! Init value for %f36
	.word	0x01130dd0,0x0bbc48d6		! Init value for %f38
	.word	0xd07f4cd2,0x8ed757c7		! Init value for %f40
	.word	0x0238daa7,0xc3243c70		! Init value for %f42
	.word	0x2e9db4aa,0x3b3377c5		! Init value for %f44
	.word	0xc3bc2387,0xab10fcae		! Init value for %f46
	.word	0xbb720af9,0x923ae51e
	.word	0x94c46a21,0x021b2b7f
	.word	0x8aab77d6,0xe1f05b2a
	.word	0xbda1a424,0x017809f5
	.word	0xdaacb115,0x7b714d80
	.word	0x7ff8e8fd,0xd231e019
	.word	0x4b4476e1,0xbbf66507
	.word	0x15069db4,0x7d7e44a3
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
	.word	0x00000000,0x0000051d
	.word	0x7124f48b,0x1687f975
	.word	0xffe00000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x7fffffff
	.word	0x00000000,0x87b74602
	.word	0x0000028e,0xa5c8b25e
p0_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x3ff00000,0x00000000
	.word	0x00000000,0x24dc609f
	.word	0x00000000,0x00000000
	.word	0x80000000,0x3ff00000
	.word	0x00000000,0x00000000
	.word	0xc1dba958,0x1ac00000
	.word	0x00000000,0x00000000
	.word	0x41cff800,0x00000000
	.word	0x41c26e30,0x4f800000
	.word	0x454bcf7d,0x627d5242
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x7a6256d3,0x20adb685
	.word	0xb4189bf5,0xd9416c1c
	.word	0x32c4c3e7,0xeb185c91
	.word	0x01130dd0,0x0bbc48d6
	.word	0xd07f4cd2,0x8ed757c7
	.word	0x0238daa7,0xc3243c70
	.word	0x2e9db4aa,0x3b3377c5
	.word	0xc3bc2387,0xab10fcae
p0_local0_expect:
	.word	0x00000094,0x7aa59344
	.word	0x7124f48b,0x1687f975
	.word	0x1c23b2e9,0x076aa311
	.word	0x4be9c73e,0x39274474
	.word	0x7257e89c,0xdb34a30d
	.word	0xafbb5f8e,0x89364878
	.word	0x59722b00,0x0ff11fa5
	.word	0x0007ed02,0x05f71d7c
	.word	0x93b2f29e,0x6db92e37
	.word	0xc8c506d8,0x6d9fe516
	.word	0xe641f8a6,0x882cf537
	.word	0x3da4c82b,0xc22ed48a
	.word	0xbfe56d24,0x432a06a6
	.word	0x000000f9,0x00000000
	.word	0x722626f3,0x68fb2936
	.word	0x8fc18fc5,0x49ea0f43
	.word	0x6f41edf1,0xc48be4c0
	.word	0x69fd3147,0xab56c0ab
	.word	0xd22e4bf9,0xcad5e2d8
	.word	0xc6bd670f,0xd16af110
	.word	0x9ae1d353,0x444bb0e6
	.word	0x2c7c39f4,0x000016b3
	.word	0x00000000,0x00000000
	.word	0x5f81405c,0x5a8ffc7c
	.word	0xae657699,0x6fc33bb7
	.word	0x5467df53,0x06c1dbad
	.word	0x6ae940e6,0x2a3eba1a
	.word	0xa569e45b,0x7919f1a8
	.word	0x85556e80,0x9921d991
	.word	0x7fb41c34,0x442bbb3c
	.word	0xfffff84e,0x7c7392e2
	.word	0x7571c235,0xc9b9da17
p0_local1_expect:
	.word	0xf76f0044,0x000b11c2
	.word	0x4f0a0000,0x00000000
	.word	0xe2fd139b,0xe9fc832d
	.word	0xca2ebfc6,0x348c3d66
	.word	0xcde4ac84,0x2f45537b
	.word	0x110eb19c,0xda43ff62
	.word	0x16389d2e,0xa3458194
	.word	0x94f22123,0x1922cff2
	.word	0xdfd4eefa,0xb9b2c28f
	.word	0x2aa9c3bc,0x14212304
	.word	0xcf5a3acb,0x513fc84f
	.word	0xbdf358a7,0xd24621d8
	.word	0xb7620b0c,0xffffffd4
	.word	0xed3a5b6a,0x0c5bb192
	.word	0x0000004b,0xb4adc27b
	.word	0x00000000,0x00000000
	.word	0x019d184e,0xef217f99
	.word	0x0091cf4d,0xd17f8942
	.word	0xec6c858f,0x53f874ea
	.word	0xa02f2d46,0x51628fa1
	.word	0x68523d35,0xb8e697db
	.word	0x2ae0ff0c,0x18a11557
	.word	0x9df93034,0x49fcfd86
	.word	0x086eec60,0x00660053
	.word	0xfae94331,0x00000000
	.word	0x69008f89,0xbf5ba7b6
	.word	0x4b9ff5ac,0x4d29e7ee
	.word	0xf1817782,0xe84cda26
	.word	0x78984796,0x567d5ed6
	.word	0x00a80000,0xa080a214
	.word	0xd6562660,0xb7114aca
	.word	0x2b451df4,0xa2573a4e
p0_local2_expect:
	.word	0xfffffff7,0xff0000e2
	.word	0xfffff74f,0x00107424
	.word	0xd7435f9a,0x8de7f5e1
	.word	0x6ac0280a,0xba336194
	.word	0xee00c608,0xb0113622
	.word	0xffffffff,0x04600000
	.word	0x4264705c,0xaf2b7298
	.word	0x136236a4,0xf20f9ef5
	.word	0xc2fd3d0c,0x6b496d40
	.word	0xb3239b12,0xadce2f5c
	.word	0x4853a446,0x000064ff
	.word	0x5048be44,0x04ba19d0
	.word	0xd3679ec7,0xfe839644
	.word	0x8b3802cf,0x0be9c617
	.word	0x826e3e27,0x1532a43c
	.word	0xe0c701d5,0x6b140b18
	.word	0x906a1c0a,0x823bd4ef
	.word	0xf618fa05,0x4774e548
	.word	0xcb3e7548,0xbcff6a9b
	.word	0xbdb549ed,0x3da9f7d9
	.word	0x8d21ee1d,0x6c3c6553
	.word	0x6c81ef7e,0xb1eb2f18
	.word	0xc98429d9,0xfd10d4b0
	.word	0xc76fbd85,0xf2a7f98f
	.word	0x0a325f01,0x7c0ec48b
	.word	0xfff6eb3f,0x4e35edd1
	.word	0x23047b44,0x2119ab1f
	.word	0x92f0a117,0x518a3645
	.word	0x007d62b6,0x107aaea1
	.word	0xa04bb3c2,0xcb260a79
	.word	0x0693273d,0xff8661c9
	.word	0xbdd1ac91,0x80269fff
p0_local3_expect:
	.word	0x0000004b,0x00000000
	.word	0x00000ff1,0x000000ca
	.word	0xf67e2697,0x3e798816
	.word	0x0ca7c9ed,0x3d763e24
	.word	0x5ba84873,0x6efeb797
	.word	0x8e060c7f,0xcc954210
	.word	0x95efc999,0xf248e05f
	.word	0x830b8032,0x137fcc9d
	.word	0x068c7990,0x0c4aed00
	.word	0xfee5f2ca,0x0003d8b5
	.word	0x9d87fed5,0xa58bd908
	.word	0x64046849,0xd38547a5
	.word	0xc8bf1352,0x4d1d3af2
	.word	0xd8b5b3cc,0x410e7efd
	.word	0x429f02dc,0xefb9feff
	.word	0xfbb6a35f,0x34da0c97
	.word	0x0d8ac0e4,0x01861380
	.word	0x979c8363,0x702787df
	.word	0x3747aaa5,0x5634e69a
	.word	0xf8481214,0x00000000
	.word	0x01fdafdb,0xfd8017d7
	.word	0x03a7885f,0xaf8d8dac
	.word	0x3a3fea32,0x79550ca9
	.word	0x6335dc29,0xe45e1740
	.word	0xffffffff,0x0000020f
	.word	0x5cdb2478,0xf572ebbf
	.word	0x0564279a,0xe25830ab
	.word	0xad52d2b9,0x76997615
	.word	0x9aae4e52,0xd344aedc
	.word	0xffffffff,0x57be45cc
	.word	0x3c580825,0xad0eebc5
	.word	0x2d8ff1b5,0x5b88871b
p0_local4_expect:
	.word	0x8f3818e5,0xd5a2b060
	.word	0xf74f9480,0x6cc1597a
	.word	0x0cee2259,0x3aeb57ca
	.word	0x3621fa5b,0x4fbd28e8
	.word	0x44eedc8c,0x446e425e
	.word	0x309e90cd,0x59bf9f82
	.word	0x6597bd9f,0xafc1ac80
	.word	0x0e305e4c,0x693416ed
	.word	0xb6f712a9,0x0914994f
	.word	0x60e58b8d,0x3fe9ee25
	.word	0x2191d6cf,0xdc9c2979
	.word	0x3e1fa7ae,0xc13cd357
	.word	0xd05ed546,0xfbb59bc9
	.word	0x84c2847f,0x5c85eb66
	.word	0x9a41b793,0x78603693
	.word	0xe099f762,0x2c5b0db2
	.word	0x272eba6e,0xbb2f2075
	.word	0xba232d4b,0x2fab66a1
	.word	0xff763de9,0x1f5de5e5
	.word	0xb91a311c,0xa31aae33
	.word	0xc5488412,0x99f6dcf6
	.word	0x51cc5568,0x69d757f0
	.word	0x2b286622,0x13df58fc
	.word	0x70e9ce24,0x02787890
	.word	0x50ba56af,0x4f68eb2d
	.word	0xd187da00,0x653cce96
	.word	0x49190ec9,0x2888a601
	.word	0xd2bf9f18,0x0dac58c8
	.word	0x08e09491,0x4a4c6d5d
	.word	0x56c4df3a,0xc2dab135
	.word	0x74c2c671,0x1891c4e1
	.word	0x9b75cddf,0x39c90007
p0_local5_expect:
	.word	0x00000000,0x00000000
	.word	0xc34331c2,0x1b86bb00
	.word	0xb1066d3b,0x9e2bd552
	.word	0x1991a1d6,0x510bb3ff
	.word	0x166041f9,0x098199e1
	.word	0x34e88c09,0xa48fb430
	.word	0x0fd31368,0x3bd2caef
	.word	0xb35f1523,0xe99da6d6
	.word	0x5f2d8fca,0xd4577a91
	.word	0xc20de320,0x95ee48f9
	.word	0xf7b51e74,0x12bcf6b0
	.word	0x22749a65,0x631be372
	.word	0xda671c2b,0x80b81f12
	.word	0x3353ed69,0x9652eecf
	.word	0xcee7b834,0x7f6df479
	.word	0xf602a515,0xd8a6ceb2
	.word	0xde01f490,0x85344ecc
	.word	0xf98c0576,0xa976418c
	.word	0x322ced90,0x0bf4fd34
	.word	0x5da7274b,0xc06f38f4
	.word	0xb83e14f9,0xddf48f0b
	.word	0xa55a3a69,0x95d45574
	.word	0x34f7fe38,0xb0eaee55
	.word	0xee9d341d,0x4632f34d
	.word	0xcb3df48c,0x386fb43d
	.word	0xe5afeddf,0x9658cb4c
	.word	0xf85b34a6,0x6180b665
	.word	0x90ec2047,0x0b341b08
	.word	0xa1c55840,0x50f39403
	.word	0xbe196b4d,0xec579567
	.word	0x4a3c6645,0x95ef3033
	.word	0xbca4ede4,0x0ca9d16f
p0_local6_expect:
	.word	0x9a3e789a,0x11a852d2
	.word	0x0000c7f7,0x234f7968
	.word	0x498ae99f,0x30552d2f
	.word	0x66694b68,0xd381ff86
	.word	0x75a1a44b,0x06963f72
	.word	0x838654a2,0x23cb089f
	.word	0x7c8b8215,0xccb2dc0a
	.word	0xfee5f2ca,0x8b27284a
	.word	0x4ade7de6,0xb51637e6
	.word	0x46700bfb,0xfbaf2afb
	.word	0x761c14bc,0xe679f3a0
	.word	0x31172de2,0x7b2c736d
	.word	0xaf956b91,0x6e3e9987
	.word	0x3ee25038,0xa074af1a
	.word	0xfe2ac838,0xf1961167
	.word	0xd61880be,0x387bf558
	.word	0x70381caf,0x58ccf082
	.word	0xa1a21f0d,0x76b29c85
	.word	0x96d0df87,0x9665214e
	.word	0xef61182c,0xb6da8dd8
	.word	0xb9b9749a,0xe3349a70
	.word	0x8733a905,0x3a1fb7bf
	.word	0xea75582f,0x16c19309
	.word	0x20028bb9,0xe7df63b2
	.word	0x32637f60,0x42e6a452
	.word	0x00000000,0x000055cd
	.word	0x85c864fd,0x85b0a482
	.word	0x2233d37f,0x9af95a67
	.word	0xcc0318f9,0x0b0239cb
	.word	0xe8c58fe2,0x588f829c
	.word	0x4f830c92,0xb535a9bf
	.word	0xef4f2786,0x32dc0913
share0_expect:
	.word	0x72accfc5,0xa2e315b2
	.word	0x01b0126b,0x1687f975
	.word	0x655dceab,0xb8920682
	.word	0x000000a2,0x000000a8
	.word	0xced3eba7,0x4b4926af
	.word	0x00ff0026,0x0000003d
	.word	0x00000071,0x00007fb1
	.word	0x0000b600,0x00000064
	.word	0x000000e2,0x00000000
	.word	0x860adba7,0x047f43e0
	.word	0xa74e5000,0xe06cc8cf
	.word	0x896a6157,0xead834ab
	.word	0xbb9a418b,0xad4f8aee
	.word	0x00460000,0xccc12a82
	.word	0x570b0488,0x5e3fbbdb
	.word	0x25c1170c,0x263b24e2
share1_expect:
	.word	0x55ffa803,0xddef904d
	.word	0x00000000,0xff0000e2
	.word	0x00000001,0xdeae7eea
	.word	0x08685f2e,0x621e21ff
	.word	0x00000235,0xc8000000
	.word	0xffd9ff00,0xf689eba7
	.word	0xdb610d77,0xdaa80076
	.word	0xb83e0288,0x0058c159
	.word	0xddb5d797,0x000000b0
	.word	0xc0ffe47b,0x7124f48b
	.word	0xf96e8ca9,0xff3c014b
	.word	0x4a1b44ba,0xa3ffe431
	.word	0xd3cf4e8d,0xc2f78262
	.word	0x4b49ffff,0xff6f3aa2
	.word	0x00000000,0x00002f32
	.word	0x00000000,0xffffffff
share2_expect:
	.word	0x7c0ec49f,0x7c0ec0c0
	.word	0x007afbf9,0x00000027
	.word	0x1f3d7664,0x9dda1af3
	.word	0x85a23156,0x0000d8f7
	.word	0x00000000,0xccc12a82
	.word	0x6a764cec,0xffffff15
	.word	0x96fde272,0x3ff57ea8
	.word	0xffde1c0b,0x2557ff89
	.word	0x00000000,0xd069e708
	.word	0xffef4beb,0xe8b7ee34
	.word	0x4c2226d7,0x6150e66d
	.word	0xef3c3706,0xdeae7eea
	.word	0x00000000,0x00000000
	.word	0x3eff193d,0x5cff8775
	.word	0xffffffff,0xffffffcf
	.word	0x96fde272,0x35f46aa8
share3_expect:
	.word	0x00008aff,0x00000000
	.word	0x8ec04124,0x4765140a
	.word	0xd5eff6ae,0x6d060000
	.word	0x793e9015,0xf925b7ff
	.word	0x00000000,0x7b1834e8
	.word	0x00000000,0x000002d3
	.word	0xffffffff,0xfffd9944
	.word	0xa714002a,0xff30e0e7
	.word	0xfffffbfd,0x224b8aff
	.word	0x000000e2,0x224b8aff
	.word	0x00000fb4,0xfffe30db
	.word	0xbcff82bf,0x5b20d8f7
	.word	0xffffffff,0xffffffff
	.word	0xfffddb4f,0xbcee6bbf
	.word	0xbf91f5bd,0xdee2b002
	.word	0xfffffd7a,0x3c5b386e
share4_expect:
p1_init_registers:
	.word	0xcafd7a00,0x35bc26a8		! Init value for %l0
	.word	0xcb284600,0x0a19f4cc		! Init value for %l1
	.word	0xd99706ff,0xaaa7bbd8		! Init value for %l2
	.word	0xded1ddff,0xcbe5a6ea		! Init value for %l3
	.word	0x265cf600,0x641b73d0		! Init value for %l4
	.word	0x11395aff,0x932002b0		! Init value for %l5
	.word	0xa74addff,0xc93e0449		! Init value for %l6
	.word	0x9e7b92ff,0x972e88d2		! Init value for %l7
	.align	64
p1_init_freg:
	.word	0x8ffa50c9,0x97b16b5d		! Init value for %f0 
	.word	0x0978db9c,0xec91adf4		! Init value for %f2 
	.word	0xa7cf71ad,0x05284518		! Init value for %f4 
	.word	0x7b7d697e,0xf8a2b748		! Init value for %f6 
	.word	0x8a0106aa,0x58ec97f1		! Init value for %f8 
	.word	0xc463c699,0xc32f3f4f		! Init value for %f10
	.word	0x67970789,0x722732c3		! Init value for %f12
	.word	0x97706a2c,0x17ce0f0c		! Init value for %f14
	.word	0x850e9908,0x6d482ee0		! Init value for %f16
	.word	0xb9eddb85,0x17a25616		! Init value for %f18
	.word	0x06ab07d2,0x87560a05		! Init value for %f20
	.word	0xbb9b461b,0xde50e1a5		! Init value for %f22
	.word	0x8b1ae776,0x9432e52e		! Init value for %f24
	.word	0x74b839c0,0x2900bf4a		! Init value for %f26
	.word	0x69f233b4,0xef6093a8		! Init value for %f28
	.word	0x2f94aef4,0x4e2c7d55		! Init value for %f30
	.word	0xb0535e9d,0x11abf780		! Init value for %f32
	.word	0x101e358a,0xcb5641d5		! Init value for %f34
	.word	0x8975bee4,0xa3e7832e		! Init value for %f36
	.word	0x66cdd668,0x1a69eb85		! Init value for %f38
	.word	0xf22ad089,0x3ad332ee		! Init value for %f40
	.word	0x552366f1,0x799afcb3		! Init value for %f42
	.word	0x51faeec6,0x120d20c5		! Init value for %f44
	.word	0x6279942f,0x92b30cb6		! Init value for %f46
	.word	0xd517fa90,0xa8b44e6f
	.word	0x8701e46c,0xd986d0d8
	.word	0x178ecc9f,0x6f2ee110
	.word	0xbf1c89d9,0x480fd3c5
	.word	0xd5ef15c9,0xbe78710b
	.word	0x06fe1c2d,0xcf62dbff
	.word	0x20b73eda,0x9c81afae
	.word	0x2938227e,0x53b77436
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0xfffff83b
	.word	0x00000000,0x000000b5
	.word	0x00000000,0x000007e4
	.word	0x00000000,0x0000095d
	.word	0x00000000,0x00000104
p1_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000001,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000001
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x80000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x80000000
	.word	0x80000000,0x00000000
	.word	0xb0535e9d,0x11abf780
	.word	0x101e358a,0xcb5641d5
	.word	0x8975bee4,0xa3e7832e
	.word	0x66cdd668,0x1a69eb85
	.word	0xf22ad089,0x3ad332ee
	.word	0x552366f1,0x799afcb3
	.word	0x51faeec6,0x120d20c5
	.word	0x6279942f,0x92b30cb6
p1_local0_expect:
	.word	0xffffffff,0xfffff7dd
	.word	0xd93cff79,0x00ffffff
	.word	0x7560328e,0xe0f65b43
	.word	0xf6cb064c,0x32261c87
	.word	0x9333f9e2,0xb83168e4
	.word	0xde20ea7e,0x4b8ce116
	.word	0xca1c3065,0xe4e4247b
	.word	0xd69ef787,0x7d970b52
	.word	0xffa25253,0x3ccb6fe3
	.word	0xd5ca436f,0x60d119aa
	.word	0x5b687f24,0x02e87eac
	.word	0x9f1425d8,0x1065edb5
	.word	0x63664166,0x3169095f
	.word	0xb8c8d859,0x25989854
	.word	0xeb941e0b,0x7098f96a
	.word	0x1b8cd9fd,0xda67cca0
	.word	0xca8b9d81,0x345e33e1
	.word	0x665abc56,0x5a6c55cf
	.word	0xff2b93fa,0x49a224aa
	.word	0xe04226ae,0xb321164d
	.word	0x41ef8359,0xdc7145b9
	.word	0x8ceac181,0x9be803d1
	.word	0xda24497d,0x0b773d20
	.word	0x3bbe3ad7,0xd3fc940c
	.word	0x62b360c3,0x234923c9
	.word	0x8e0b15d9,0xd9ee7693
	.word	0xb68b6c13,0xbfc65be6
	.word	0x08b1f8bd,0x98e75817
	.word	0xe85120df,0x913403c8
	.word	0x43ae6dde,0xd810544d
	.word	0xd4e5b9f4,0xe750a697
	.word	0xc0153e6d,0x6388a1e4
	.word	0x00bd58f0,0xd8f30caa
	.word	0xb74a1fe6,0x8d95f2bd
	.word	0x26faa4db,0x00e9a8ff
	.word	0xe04ff8b6,0xb06ecdae
	.word	0x2811115e,0x8c804956
	.word	0xf9b2d5b0,0x62b8de5d
	.word	0x536fcc71,0x8bf996b0
	.word	0x22726377,0xd358b82f
	.word	0x27a0eca2,0x249c0612
	.word	0xea201b58,0x0d855c81
	.word	0x648f6ef3,0xb7c70cec
	.word	0x859d85ef,0xcd9d955f
	.word	0x2573fab1,0x183ea354
	.word	0x728c70b8,0xb8eb68a7
	.word	0x85839886,0x58e7a348
	.word	0xaae363cc,0xd8405f05
	.word	0x736dc5d1,0xe9f4ecb6
	.word	0x04829727,0x29e9465d
	.word	0x7cda76d4,0xebe80bc3
	.word	0x07c27fc3,0xd5a6fc96
	.word	0xfe516877,0xd08e1bf7
	.word	0x81d630fc,0xca31da59
	.word	0x18f943b5,0x5838cedf
	.word	0x97e77bb9,0x6d3f5acf
	.word	0x33d3315c,0x03000ab4
	.word	0x320c241d,0x48f1469d
	.word	0xffffffff,0xfffff83b
	.word	0x00000036,0xae95c658
	.word	0xa4e8e376,0x8649026b
	.word	0x17295807,0xeedc5f34
	.word	0x3ac9d386,0xab3cc41e
	.word	0x43271079,0xc4b4a6a9
p1_local1_expect:
	.word	0x00000000,0xf81c6679
	.word	0xff000000,0x0000d8f7
	.word	0x73166b37,0xdb4bffa6
	.word	0x171a0543,0x00003556
	.word	0x439973e2,0x2204756c
	.word	0xf1e657a5,0x68602106
	.word	0xd093bad5,0x93d852ca
	.word	0xffffd101,0x000000ff
	.word	0xfa419f91,0x607b3b77
	.word	0x2595c773,0xa00b05e8
	.word	0xe5bacf70,0xc1c4f545
	.word	0xc3e83527,0x326119ee
	.word	0xd31bad5c,0x7c1f1872
	.word	0x3114e89b,0xd1fb468d
	.word	0x755eea1e,0x73174cde
	.word	0x7ef737cc,0x9713a7d7
	.word	0xf0d4381e,0x07cd0d79
	.word	0xcd09abc7,0x330ae01c
	.word	0xf6b2dcb4,0x6c870c4c
	.word	0x06002f5d,0x4c3acce4
	.word	0xdec6f1f4,0x00574d5b
	.word	0x7c782d30,0xc462c560
	.word	0x60693441,0x02793bdf
	.word	0xc41866a1,0x083b866a
	.word	0x4c018785,0x03fdccf1
	.word	0xe7fbacae,0x6edd3fc4
	.word	0xe194006e,0xb573be3e
	.word	0xb17de4aa,0xb1e7b565
	.word	0xe2a5fd59,0xc876dc4f
	.word	0x660d7b69,0x79780380
	.word	0x431b99ee,0x116c05f7
	.word	0x2be97cad,0x4e7f6a2f
	.word	0x05ea772a,0xfb73fbfe
	.word	0x5b09f4ff,0x7136271a
	.word	0x4a3e0e53,0x9c73d4c7
	.word	0x1962985b,0x4fab821d
	.word	0x5990874c,0x6a8afdbe
	.word	0x91388abb,0x5d219940
	.word	0x66c757ac,0x7b5e37d9
	.word	0xcf920dda,0xad9a3ceb
	.word	0x7d51f328,0x2231cfdc
	.word	0x824d76ec,0x2ad4a4f1
	.word	0xf9459e2f,0x6149df7e
	.word	0xb5f2ffa4,0x36ee2f7e
	.word	0xa6467607,0xa5a85746
	.word	0xc390d992,0xcef1c54c
	.word	0xd94f607f,0x25226837
	.word	0x14b3c6ee,0x5434935d
	.word	0xf984f22b,0xaa09fb6c
	.word	0xc1ff038f,0x0124d538
	.word	0x1b3367b5,0x4571a648
	.word	0xff421011,0x4904e0ea
	.word	0x5da77a03,0x579a59ba
	.word	0x31143fd7,0x1e808fff
	.word	0xfc929d2d,0x778eceaf
	.word	0x61df5c0c,0x264d3eb2
	.word	0xd3927625,0x561cbeb0
	.word	0x48898f5c,0xdf861d73
	.word	0xff0aa8be,0x0efa8a4b
	.word	0x339b5043,0xb64707c7
	.word	0x93278e66,0x8cfd3d5c
	.word	0x54021528,0x043b3cb4
	.word	0xd5c2573a,0x818f8851
	.word	0xa7e20c90,0xdb23215e
p1_local2_expect:
	.word	0x0000002d,0xdeae7eea
	.word	0xffffeb00,0x52fec6aa
	.word	0x72cd1a1a,0x3b5b7023
	.word	0x05459d52,0x31af5da3
	.word	0xbbb8a12c,0x09ebbe55
	.word	0x0bacc5ef,0x65091a0a
	.word	0x65b6b16d,0xc533996f
	.word	0x4c53091e,0x720c33d2
	.word	0xa50ee9fc,0x9bf6a520
	.word	0xf81ceb9b,0xa22363e7
	.word	0x6ec8a04d,0x4ad5bad2
	.word	0x02908595,0xda7e0dd7
	.word	0xa3823ed5,0x3ba15cf6
	.word	0x2523e4b6,0x6e1d7b6d
	.word	0x6eec1fbb,0x0caf5aa0
	.word	0xff47cfea,0xd09e3a5a
	.word	0x22150c90,0x0375b5ba
	.word	0x2592b5eb,0x27b526e0
	.word	0x2d7c050c,0x60a15b18
	.word	0xbfb57f47,0x96946343
	.word	0x00000000,0x0b773d20
	.word	0x93682179,0x2cde5317
	.word	0x0a3d83ca,0xf81c6679
	.word	0xf1882d8a,0xd29ecdbb
	.word	0x81ffb3c3,0x44244e65
	.word	0x52dc35b7,0x64ac5427
	.word	0xcc1b9997,0x8ac49b45
	.word	0xd8d17150,0xd3f95fdb
	.word	0x1d1a8682,0xbd034160
	.word	0xce8924a9,0x87ffc3d0
	.word	0xf96faf0f,0xd31ded48
	.word	0x05731fa7,0x0a654394
	.word	0xd98ca7b9,0x67407138
	.word	0xe553b23f,0xb131ce13
	.word	0x4a088240,0x08c1c815
	.word	0x70dc87e2,0x5a6eadfd
	.word	0xb581ff0d,0xfa9eb8e0
	.word	0x7b37fa95,0x36b3370a
	.word	0x79844baf,0x6ea1307d
	.word	0x2c5b5065,0xab23d43d
	.word	0x09fa6b2b,0x934f9e7e
	.word	0x12ba0439,0xf1aeb320
	.word	0x5c1e9feb,0x1db64be9
	.word	0xd2762767,0x6175d700
	.word	0x93de5143,0x09d7df4a
	.word	0x1bb2c463,0x81bfef5c
	.word	0x075e7fa6,0xb0823d09
	.word	0xeb1df9cb,0xe32f9bea
	.word	0x360e2322,0x263f6940
	.word	0x17b974fb,0xfe96b574
	.word	0x8dc40697,0x59980cb3
	.word	0x00000000,0x000005e8
	.word	0xa26cc956,0x3cac00df
	.word	0x80206391,0xef53042c
	.word	0xc2f0bbb6,0xc33381d3
	.word	0x937de4de,0xabcbc318
	.word	0x17db2647,0x661cd93c
	.word	0x22c3fab9,0x00000061
	.word	0x8178d80e,0xf0fced0e
	.word	0x3b65ea7f,0xe612d8d9
	.word	0x5c15709d,0x3654e40f
	.word	0xef7d8cb4,0xd33d2ac5
	.word	0xc5c431f0,0x4988814c
	.word	0x7f78c2b7,0x34e5f810
p1_local3_expect:
	.word	0xf78921a0,0x77805240
	.word	0xff8a0000,0xa2b95ec9
	.word	0x65e48e23,0x4cf7cf5e
	.word	0x0e58df55,0xcd740f38
	.word	0xffffffff,0xffffeb00
	.word	0x81f8af23,0xe3fbc38e
	.word	0x9b5431bf,0x6af41543
	.word	0x7bb8823e,0xf33d7634
	.word	0xefdb6e3f,0x1798be71
	.word	0x6ef6e19c,0x655dceab
	.word	0x885b0b0c,0xd15fb121
	.word	0x4ccde0be,0xa9b0b634
	.word	0x71908522,0xe057ea00
	.word	0x921a40bb,0xd7db1079
	.word	0x6d596eda,0xa32cfe70
	.word	0xf4c9122f,0x06890894
	.word	0xac5561b8,0x95b97e8c
	.word	0xb30dc03c,0x6500fcd3
	.word	0x062b2d5c,0x8cc7d12b
	.word	0x9f69d88e,0x3d247e67
	.word	0x04a4e914,0x2c838356
	.word	0x8e7e6819,0xd2a7bb69
	.word	0x7075c90c,0x2f4d650c
	.word	0x097821dd,0x987036ea
	.word	0x262a05e5,0xc024f369
	.word	0xabb8632b,0x04107e2b
	.word	0x38a8c8b1,0xeeef9fa1
	.word	0x945a7195,0x413bf550
	.word	0x0ccef442,0x8d2460ff
	.word	0xcecfcab5,0x7f4b8eee
	.word	0x7300d39c,0x16e2dadd
	.word	0xe94535bb,0xd626cb6f
	.word	0xb52ee19e,0x683e3b63
	.word	0x00000000,0x4fef9001
	.word	0xbed44891,0x127e5786
	.word	0x0c8aa67b,0xd0c0f183
	.word	0x85b060bc,0x3a6fd6f8
	.word	0x6395c960,0xde5c6ed3
	.word	0x6055bf22,0xcdc08376
	.word	0x48ffdf37,0x9076dd1e
	.word	0x4f73449f,0x4442675f
	.word	0xcce7c68f,0x56aa273b
	.word	0x65ba8162,0x8003e52d
	.word	0x00000000,0x00000000
	.word	0x5ca37a2d,0xcb10ffc4
	.word	0xfeeb7a5b,0xcc8a746a
	.word	0xb35efcc7,0xe080c83a
	.word	0x3e328ae6,0xdb8fb174
	.word	0x19d6889a,0x0bbaf0ba
	.word	0x241c8b23,0x8732b53d
	.word	0xaee9ffff,0xbce9eba8
	.word	0xfc93715b,0x372a9340
	.word	0xa2419193,0x5ec40c56
	.word	0xcf41389c,0x0bdadd2b
	.word	0x271afb00,0x164a1802
	.word	0x4a03b39f,0xb623b94c
	.word	0x2716cbca,0x5bb164c3
	.word	0xf7684f5b,0x05dd5894
	.word	0x7ecb9e6b,0x5c341afe
	.word	0x00000000,0x00161373
	.word	0x5bd1fde3,0xa2053cb9
	.word	0xd70a528a,0x0d976602
	.word	0x14f03e0b,0xfc68ae2c
	.word	0xa08e6f3c,0x13ff1ec3
p1_local4_expect:
	.word	0x00ff287f,0x8f801a54
	.word	0x352e92e8,0x46020c0c
	.word	0xe7d05380,0x347b227a
	.word	0x0fb4b2a9,0x7bf27d43
	.word	0x9791cc8e,0x552ee38b
	.word	0x83f5e3a1,0xe5e1ac38
	.word	0x52733393,0x20f05e36
	.word	0x25b2cb5e,0xb20c40b5
	.word	0x3eaad9c1,0x2941df98
	.word	0x2fc93732,0x265b2d1c
	.word	0x1ed0dc90,0x98886a0b
	.word	0xf253715f,0x555aa706
	.word	0x1659a00a,0x8fe62140
	.word	0x31ddc4ff,0xe164d4f8
	.word	0x7f5e439e,0x33c49dc1
	.word	0xce1e6569,0x8dd62ef9
	.word	0xfcd43f81,0x43e08373
	.word	0x90b4b8b7,0xd82a4926
	.word	0xa5387b26,0x62b9a040
	.word	0x9275f61f,0x975f3513
	.word	0x1f300eb8,0x314f5db6
	.word	0xf1b92c6c,0xd89a60ca
	.word	0xf01d475d,0x334d6466
	.word	0xd3f12582,0x6d894a50
	.word	0xae76a472,0xedb18cb7
	.word	0xb98f2753,0x581f3f10
	.word	0x7d74d00f,0x8787867e
	.word	0x5ae609f7,0x18f4ac78
	.word	0x073c8665,0xd83d2066
	.word	0x98021ffd,0x63186c7c
	.word	0x13dc209c,0xea551941
	.word	0xc4e04b62,0xece66b02
	.word	0x74bb3455,0x88306cbd
	.word	0xfe2da696,0xc7a75221
	.word	0xba8627fe,0x49b28354
	.word	0xffa7c4f1,0x66920a44
	.word	0x79fe7ffb,0x2fef12a7
	.word	0x32c22f1b,0x29d58772
	.word	0xdb200b06,0xff479375
	.word	0x10af5a65,0x9c162ddd
	.word	0x0736d770,0xf19610c2
	.word	0x9fd2e7c8,0x6396a6ec
	.word	0xe44f37c2,0x775bba1b
	.word	0xba540c2d,0x221c6cc9
	.word	0x858f7e49,0x571fec80
	.word	0x6756fdf4,0xcadcb11b
	.word	0xd75de686,0xb9d66bc3
	.word	0x1ec50fc8,0x3f3ae365
	.word	0x898954da,0x4f480640
	.word	0xc5ba5daa,0xeaa76828
	.word	0xc25079ed,0xf8a8c620
	.word	0x14680ae2,0x6dce5b62
	.word	0xec75b1fa,0x07135410
	.word	0x7b37fa95,0x36b3370a
	.word	0x615e635d,0xa0a5e005
	.word	0x0e85a4ec,0xd56ad0de
	.word	0x26b25731,0xf2a03ca9
	.word	0x87d97e0b,0x851118e8
	.word	0x94ca13d5,0x8fd5a592
	.word	0xb1d24151,0xd271a9e4
	.word	0x9306ea36,0x08870e3b
	.word	0x7121c220,0x06b5be25
	.word	0x13990691,0x7d310303
	.word	0x29b8feb5,0xcf2f0de4
p1_local5_expect:
	.word	0xdbf460e0,0xecce6f62
	.word	0x008b8720,0x158bda23
	.word	0xa9bc9c92,0x9bfe9b2d
	.word	0x77ec4aa9,0x6cefd96f
	.word	0xf5695b46,0x5dfb2189
	.word	0xd7fa7ecf,0xfb707e44
	.word	0x59644b99,0x3d96745d
	.word	0xa2377868,0xb1a2f5d4
	.word	0x003852b0,0x19272993
	.word	0xfd38cb80,0x1a6fd7c5
	.word	0xdc84b8eb,0x9202c3ad
	.word	0x30e29104,0x73d0c753
	.word	0x403202d0,0x19176391
	.word	0xa7104bcb,0x18ac1a7f
	.word	0x126659fc,0xb3b1a3f2
	.word	0x732d1c9e,0xe0edb80d
	.word	0xf6fbdffd,0x3dde0dbe
	.word	0x4f2a3d37,0x1f6ed7f0
	.word	0x14fed917,0xf74d37d7
	.word	0x58ca4c4c,0x99996046
	.word	0x50ab8447,0x1521c2bb
	.word	0x11eb028c,0x90d0c0f7
	.word	0x870d47d6,0x0839a8cc
	.word	0x794d7091,0xe50929e3
	.word	0xdfbc437a,0x507ee06c
	.word	0x40dc4566,0x1eebc0f3
	.word	0xac621ce3,0xa9cdc038
	.word	0xc3893c95,0x5c278aeb
	.word	0x16932435,0xc5d2a1ef
	.word	0x2151eee0,0xc77a83e9
	.word	0x500343f1,0x32d59a4c
	.word	0x2add9b4f,0xb7371a50
	.word	0x59eae2f1,0xc1e920da
	.word	0x84c6019a,0xfe4e7674
	.word	0x4f34d298,0x0cfc7c8d
	.word	0xb2251e0b,0x96d570ea
	.word	0xcace2bff,0x196cf322
	.word	0x9df895e0,0xfe17a9b6
	.word	0x9db1d982,0x3befce13
	.word	0x0be59632,0x57b3b0fb
	.word	0x64fc5181,0xccbc145b
	.word	0xa15bf1a3,0x392e51f8
	.word	0x730c285c,0x9f1f7e09
	.word	0xa59e8a9e,0x4f48a089
	.word	0xa6c1b00d,0x36c4db7c
	.word	0xa3ef8457,0x3ef696df
	.word	0xecf0ac35,0x52ae7e0b
	.word	0x7d2e19f6,0x2ec1e3cb
	.word	0x6326065b,0xc0e8fc92
	.word	0xae2d6f55,0x69a99e1b
	.word	0xf2410ff0,0xfa0b389a
	.word	0xa682d578,0xf23a3cab
	.word	0x3e9a3d4e,0xe69adf12
	.word	0x7f674dfb,0xcac48b5f
	.word	0x96911be4,0x0d281638
	.word	0xa01ba5d0,0xdd836992
	.word	0x72067909,0x44b5ce4b
	.word	0x8d99916f,0x9bcaa110
	.word	0x89b9886a,0xfd9650ee
	.word	0x0281f0ad,0x1db992c7
	.word	0x28e7f6e2,0xfc4b9982
	.word	0xae76edcb,0xb0bd26cd
	.word	0xc4ad23ec,0x79f293ea
	.word	0x1b421b68,0xe86c5068
p1_local6_expect:
	.word	0x8e8921a0,0xef367cd0
	.word	0xdfafdef9,0x59990a90
	.word	0x4cb056eb,0x81ee1946
	.word	0xcb80b9b8,0xa5e6d7f4
	.word	0x390758e8,0x105ac077
	.word	0xe74a3f58,0x089d5ec3
	.word	0xbba9048a,0x55ab7e40
	.word	0x00000195,0xeb000000
	.word	0xaf620f5c,0xc1829a19
	.word	0xfbdf2355,0x1de71dfa
	.word	0xca0edb68,0xf22cfb58
	.word	0x7409576e,0x00fc1f9b
	.word	0x8aeccc43,0x3009176a
	.word	0x51776df7,0x0545235f
	.word	0xc8eb697a,0xb2a7a795
	.word	0x5a7b66c9,0x45e0adac
	.word	0x2528e7ae,0x5276645b
	.word	0xebba8a2f,0xae37f603
	.word	0x75762636,0xde2c58b8
	.word	0xa5fad508,0x3e83513b
	.word	0x0000055c,0x9409a767
	.word	0x6a7823b2,0x36cb5cdf
	.word	0xd7ea8027,0x784b17ef
	.word	0x3d5b83cd,0xb871ce15
	.word	0xd0f45041,0x6ed09f5e
	.word	0xa90485a6,0x2b602708
	.word	0x08f12d9d,0xa9f900a1
	.word	0x142b95b3,0xdfeaf031
	.word	0xd52c93a1,0x1c452e96
	.word	0xbf204020,0x5e36537f
	.word	0xa1493929,0xf5d161f7
	.word	0x4c63a989,0x2f11a9f2
	.word	0xdec1a6dd,0xcd21b1dc
	.word	0x215fd892,0x7e7fb320
	.word	0x26d73be5,0x541e51f4
	.word	0x8cb7cb3d,0x299093f1
	.word	0x0f4b273f,0x741745b1
	.word	0xcfe34d3c,0xf42f1926
	.word	0xa1b0b6de,0xde092b9c
	.word	0x9695f809,0xcfbab1f3
	.word	0x6a184e7e,0x632845eb
	.word	0xde05f113,0xb01c29bf
	.word	0xb10e68ed,0x27bbd2b1
	.word	0xec4ba57a,0x8e83c0a9
	.word	0xbf4c2b6a,0xafe11338
	.word	0x13ff1ec3,0x00161373
	.word	0xc79627db,0x1cc86cb1
	.word	0x995f4436,0xa427f44b
	.word	0x4e652f73,0xfca438c5
	.word	0x0ce88462,0xa8214e9f
	.word	0x68523878,0x0e942e99
	.word	0x4bac87f3,0x19e0974b
	.word	0xdc98281d,0x72caf143
	.word	0xa342ea21,0xedee48f1
	.word	0xf931d377,0xa8781e41
	.word	0x870de107,0x275a2c82
	.word	0xc299c8a3,0x34cb6742
	.word	0x75ee194b,0x8f6c8894
	.word	0xa3ebc092,0xced134f6
	.word	0xba691e70,0xa2dd3b82
	.word	0x157d6e45,0xd663bf15
	.word	0x84b28135,0xf0dc21e3
	.word	0x2edee209,0x6476a0fa
	.word	0x0ddb8811,0x0102854c
p2_init_registers:
	.word	0x07a3afff,0xa71cea20		! Init value for %l0
	.word	0x80fe8600,0x63b774c9		! Init value for %l1
	.word	0x76d30600,0x2eb8a056		! Init value for %l2
	.word	0x8aea7eff,0x931ec9f6		! Init value for %l3
	.word	0xa05ef9ff,0x9ecd164e		! Init value for %l4
	.word	0x8adf3e00,0x0e99831a		! Init value for %l5
	.word	0x51200cff,0xb524ed96		! Init value for %l6
	.word	0x00d98b00,0x088ad4c9		! Init value for %l7
	.align	64
p2_init_freg:
	.word	0xef01edbb,0x30d4038a		! Init value for %f0 
	.word	0x4013b1ca,0x223783f8		! Init value for %f2 
	.word	0x04282168,0xde57d2f0		! Init value for %f4 
	.word	0x622f7d1d,0xe03ac0a3		! Init value for %f6 
	.word	0x69106f89,0x03fbd1e0		! Init value for %f8 
	.word	0x4c1e8a6d,0xfd0a5b6a		! Init value for %f10
	.word	0x2a374903,0x256b5292		! Init value for %f12
	.word	0x5192069c,0x3f9dd491		! Init value for %f14
	.word	0xa5a4c94e,0x0e94a1ff		! Init value for %f16
	.word	0x7fadbf3d,0x550e7a41		! Init value for %f18
	.word	0x5878877f,0x562bf026		! Init value for %f20
	.word	0x91a8be66,0x70c7b6c3		! Init value for %f22
	.word	0xa4b5a397,0xe8db4386		! Init value for %f24
	.word	0xb012f8e3,0x7f144dad		! Init value for %f26
	.word	0x6e615ce8,0xe5eb3868		! Init value for %f28
	.word	0xc1e2ff27,0xcc09f51c		! Init value for %f30
	.word	0x149e6f74,0xdb1e476d		! Init value for %f32
	.word	0x3103f512,0x020dbf56		! Init value for %f34
	.word	0xf6a9431f,0x8429a7ae		! Init value for %f36
	.word	0x8a1d3c65,0x86ae9676		! Init value for %f38
	.word	0xa37a43b4,0xefc74702		! Init value for %f40
	.word	0x8b4a724d,0xa91acd7e		! Init value for %f42
	.word	0x340077ce,0x85a50b1a		! Init value for %f44
	.word	0x75c03be0,0x39b91ecb		! Init value for %f46
	.word	0x21441072,0xb78bda26
	.word	0x9bb58047,0xfbe58eb6
	.word	0x64825099,0x301389cc
	.word	0xff4986b5,0x24647f7b
	.word	0x2c97209f,0x7cb4a641
	.word	0xf98d5e6c,0x33e11881
	.word	0x741f29e6,0x43b66dd0
	.word	0xdb243193,0x81f7999a
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
	.word	0x00000002,0x1f2f43a8
	.word	0x00000000,0xd2b80000
	.word	0x00000000,0x000002d3
	.word	0xffffffff,0xff592caa
	.word	0x00000000,0x391d2000
	.word	0x00000000,0x000002d3
	.word	0x00000000,0x00460000
	.word	0x00000000,0xccc12a82
p2_expected_fp_regs:
	.word	0x550e7a41,0x00000002
	.word	0x00000000,0x00000002
	.word	0xd50e7a41,0x00000002
	.word	0x80000000,0x00000000
	.word	0x69106f89,0x03fbd1e0
	.word	0x00000000,0x00000001
	.word	0x2a374903,0x00000000
	.word	0x00000000,0x80000000
	.word	0x4289e51f,0x28298a00
	.word	0x00000000,0x550e7a41
	.word	0x00000000,0x00000000
	.word	0x00000000,0x550e7a41
	.word	0x3ff00000,0x00000000
	.word	0x40000000,0x562bf026
	.word	0xd50e7a41,0x69106f89
	.word	0x00000000,0x00000000
	.word	0x149e6f74,0xdb1e476d
	.word	0x3103f512,0x020dbf56
	.word	0xf6a9431f,0x8429a7ae
	.word	0x8a1d3c65,0x86ae9676
	.word	0xa37a43b4,0xefc74702
	.word	0x8b4a724d,0xa91acd7e
	.word	0x340077ce,0x85a50b1a
	.word	0x75c03be0,0x39b91ecb
p2_local0_expect:
	.word	0x53800000,0xd7ca678c
	.word	0x970000cc,0xffffff15
	.word	0x02f5b81a,0x5d4a8326
	.word	0xb653e6eb,0x9a60ac97
	.word	0xe9fb28ff,0xc49bff17
	.word	0xa68ea273,0x191ed82f
	.word	0x055e3d7f,0x42df04ed
	.word	0x1d4e1745,0xc9b45404
	.word	0x2a99e207,0xb8b77797
	.word	0x5bdc2aaa,0x02566658
	.word	0x2a82d5d2,0xc4607c6f
	.word	0x3f080ce7,0xf37d304e
	.word	0x4b9e9cd3,0x2881aed8
	.word	0xb9566bc0,0x455c7b23
	.word	0xf5652d91,0x00000000
	.word	0xc92fb26a,0xab0b563f
	.word	0x4d7c6d92,0xdf207008
	.word	0xabc504a0,0x593e20a2
	.word	0x28069580,0x00008d9e
	.word	0x7b8145d8,0xdd01ff3d
	.word	0xfe5df803,0xb203f292
	.word	0x171f81bd,0xffc95824
	.word	0x0000009c,0x00000000
	.word	0x922ff209,0x2e2002c1
	.word	0xd29b449c,0x00000053
	.word	0x8ad980eb,0x4a7469ee
	.word	0x46ea3d2c,0x8d24a9f2
	.word	0x3807aefc,0x83ee20d1
	.word	0x97a6e6a5,0xf2831804
	.word	0xe2f0c3f9,0xac0df7b1
	.word	0xd5b9bf7c,0xf9bb6e2f
	.word	0xdf53165d,0x8d910062
	.word	0xbab6d37a,0xfffffdef
	.word	0x134038f6,0x0e0dca90
	.word	0xfafedac2,0xed96b247
	.word	0x47ce2b92,0xe70873be
	.word	0xbb1de25c,0x8e90d29a
	.word	0x0000eba7,0xccc12a82
	.word	0xccba7d03,0x3a10d52d
	.word	0x30d9fe73,0x272d723f
	.word	0xf97a080a,0x9eb1bb53
	.word	0x1e9e1c71,0x3a1b9a42
	.word	0x24ef6cc7,0x24580e92
	.word	0xdb4202d3,0x8ef33ff1
	.word	0xcd4e6673,0x5d494c13
	.word	0x5d4f71f6,0xe2ea5e84
	.word	0xb126e80a,0x863d6a99
	.word	0xc5c93ea0,0x26bdee2c
	.word	0x61162040,0x6c82aeaa
	.word	0x7a9702c3,0xa587c5c5
	.word	0xde2439b7,0xf214c4c4
	.word	0xd718a3e8,0xd34fd098
	.word	0xcf395b80,0x4e527958
	.word	0x6b4eb153,0xa4d8d8d0
	.word	0xf395d9ee,0xfff9217b
	.word	0xdfb192fc,0x9138e239
	.word	0x2cb47c47,0x18574d0e
	.word	0x31cb8171,0x7e16b5f5
	.word	0xc16fc32b,0x9cd19c85
	.word	0x949063ce,0x2e61fa4e
	.word	0x7c078985,0x02579924
	.word	0x47ce2b92,0xe70873be
	.word	0x5e8fb31e,0xe1f21061
	.word	0x63ffe0f8,0x4cf457f6
p2_local1_expect:
	.word	0x0000002d,0x00000094
	.word	0xffa64e88,0x3451d2b8
	.word	0xa1653c58,0xe9e58218
	.word	0x00000000,0x9fc451d4
	.word	0x527ac74d,0x0d9062b0
	.word	0xd3d7fe2d,0xcdd45b84
	.word	0x435ee656,0x390eb945
	.word	0x33703760,0xe5a2650e
	.word	0x3903bf40,0x7e091a2f
	.word	0xc317fa57,0x468dbe1e
	.word	0x7d0ec921,0xb6e51215
	.word	0xb6e3205c,0x8eda810c
	.word	0xc0b72982,0x5c7cbc3b
	.word	0x7277bfc1,0x6256ddda
	.word	0xb0d9d745,0x44dfafa7
	.word	0x078cfe3a,0xcaffd025
	.word	0xdcc5fb8e,0x94a47574
	.word	0xf913afdc,0x438f32f5
	.word	0x293ea888,0x1c0ca7d1
	.word	0x059d5bd4,0xc503568f
	.word	0x8b5b4e59,0xd708bc45
	.word	0x6252b48a,0x62aa8cf2
	.word	0x2f7342be,0x71b74df4
	.word	0x000001fe,0xece6c000
	.word	0xd85d4eae,0x0cdbaf62
	.word	0x0240b95a,0x11a41a27
	.word	0x9b4c90c2,0xdeea1a48
	.word	0x4a0f60d5,0x3da032ac
	.word	0x8faaaea1,0xcfe8b348
	.word	0xff04a1f0,0x8f49905a
	.word	0x4eb5f814,0xa93d3006
	.word	0x96d44f08,0x48388ba0
	.word	0xcca52682,0x843ff160
	.word	0x207261da,0xa3ff1f7f
	.word	0xc3387e9f,0xa6806bf2
	.word	0xe0dd6dde,0x76b84622
	.word	0x8bcac8af,0x23a48c8b
	.word	0x0581e726,0xbd8379ed
	.word	0xd1587875,0xb2a64dfe
	.word	0x382c498e,0x63b9a824
	.word	0x00000000,0xf2a2904c
	.word	0x5c3a925c,0xbdbd9578
	.word	0x10ac8c33,0x14605350
	.word	0x8c2b9529,0xe01f6732
	.word	0xe6eb447d,0x015ac2f8
	.word	0xa03ff4e3,0x3d2d9e7e
	.word	0xf372229a,0x68e65dd6
	.word	0xa2836f9a,0xccff9f78
	.word	0xab637efe,0x92c6b8b8
	.word	0xc8609430,0x358d9056
	.word	0x54dd19bb,0x873521b6
	.word	0xf29e1c38,0x9e6305be
	.word	0x18969c85,0x0eed1ad9
	.word	0xe78b51bc,0xd6793461
	.word	0xa57c63d3,0x32a6571e
	.word	0xed305381,0xa8085b2a
	.word	0x998f3d3b,0x8747035a
	.word	0xc507f232,0x19acb96f
	.word	0x5e8e9436,0x27b73193
	.word	0x98bb0e2d,0xfedae0a5
	.word	0xf4edca67,0x462e471c
	.word	0xa12049f6,0x5678857a
	.word	0x2fee5d15,0x8887a517
	.word	0x5d83f3cf,0x86d01616
p2_local2_expect:
	.word	0x00000000,0x764b770c
	.word	0xff592bc2,0x00000000
	.word	0x4f7db04b,0xb0f981a7
	.word	0x1313b648,0xff60ac97
	.word	0xa9b9298a,0xb0c4ad13
	.word	0x4bb1dd65,0x06b579aa
	.word	0x88622ae7,0xb19e7430
	.word	0x58bd6c03,0x3cde91e1
	.word	0xa7572b58,0xc876b87c
	.word	0x0b5f357c,0x55f2a711
	.word	0xa4390cf7,0xafdfe7c0
	.word	0x969b5fc4,0xd7a757cf
	.word	0x38e74213,0xdad9462f
	.word	0x9dc71e70,0xa66af9d2
	.word	0x54b9b39b,0xb470c58e
	.word	0x00000000,0xcbe0ac97
	.word	0x8aa602e6,0xe3109f1b
	.word	0xb11d2ce1,0xb0e70b4a
	.word	0x262b5b85,0x6ac0bf58
	.word	0x174bfc55,0xa35cadb8
	.word	0xa5c7bc6a,0x698117c0
	.word	0x9717e1e1,0xba8ea3b2
	.word	0x1aa95735,0x1c10e05a
	.word	0x764f854f,0xb0307900
	.word	0xc801bb20,0x9133b517
	.word	0xdbc79447,0xc23272fa
	.word	0xace4094b,0x94b343b6
	.word	0x4468299a,0xde7b2269
	.word	0xbb1e7e76,0x9a5a74bf
	.word	0x26e37b1c,0x7dd71f94
	.word	0xd57d1191,0xee09a730
	.word	0x000000cc,0xccc12a82
	.word	0x26b97a0b,0x7cc256cf
	.word	0x4e44370e,0xf77d887f
	.word	0x00000000,0x54c0e4fa
	.word	0x6703a4a3,0x48252f7c
	.word	0x41b1232e,0xb87e91b2
	.word	0xbdab68ac,0x82f4799c
	.word	0xec31b935,0x8f5cce5d
	.word	0x698c49bc,0x61681d31
	.word	0x000000d9,0xdb0449f9
	.word	0x1761e56b,0x16962be6
	.word	0x7aa00b2d,0x668efcdf
	.word	0x9b3b1364,0x8d9b3acb
	.word	0xfb999896,0x60a5e19d
	.word	0xc0a40043,0xa038dd7f
	.word	0x0a3ed4e5,0x163fa65c
	.word	0x1f44d18e,0xb9d52288
	.word	0xc1b085af,0xf9a493d9
	.word	0x00000000,0x00000000
	.word	0xe1c89cc0,0x789ef2f8
	.word	0x7275a23d,0x76d89f77
	.word	0x59157360,0xb189ccd6
	.word	0x00000000,0xccc12a82
	.word	0x7e2e18b2,0x94004973
	.word	0x91d050c7,0xa6a0e8ad
	.word	0xcf9e547c,0x0151f930
	.word	0xfb6a4a66,0x32060b1e
	.word	0xb5381874,0xf3f1d4eb
	.word	0x16f5fe9a,0x096e6544
	.word	0x6678e9d6,0xc84d18fe
	.word	0xcf973870,0x03601b55
	.word	0x00d19095,0x70fc9aa2
	.word	0x094bbba3,0x4641b473
p2_local3_expect:
	.word	0x00000026,0x00000450
	.word	0x99240000,0xffffffb7
	.word	0xa91bea2a,0xd3aabadb
	.word	0x5eff6c91,0xfffffce9
	.word	0x90bdb77a,0x2d7349bc
	.word	0x321f9fb9,0x699cc94c
	.word	0xb84ef927,0x985958aa
	.word	0x2aadd4fe,0xff272449
	.word	0x92f8d681,0x06e6b733
	.word	0x79801213,0xcf4341e1
	.word	0x988eb786,0x8b20eb02
	.word	0x49a9889b,0x798e26de
	.word	0xfad3c95f,0x6115b4bf
	.word	0xfcb95087,0xb092dfa6
	.word	0xbd606f7a,0x7a831f78
	.word	0x8a0ddf0e,0xadd8a54e
	.word	0x8cf77ec1,0x5b9cfb46
	.word	0x81e03d38,0xb998b492
	.word	0x84fc8b63,0x8d3d3ef5
	.word	0xbb502496,0xaee23754
	.word	0x6d969adb,0xe2da142d
	.word	0x0a2f031f,0x46c23210
	.word	0x4a55c264,0xa3658391
	.word	0x49610909,0x6b4d9661
	.word	0x17359f00,0x8dc4129f
	.word	0xe2d4804e,0x89a253d6
	.word	0x45fa55c6,0x602e626f
	.word	0x656e5e3e,0x2409cef2
	.word	0x05de3417,0xa403b61b
	.word	0x1817ff33,0x3edcb1cf
	.word	0x3401831a,0x4da26889
	.word	0x57d410e0,0x4d726767
	.word	0x4a7d36f1,0xea195fb9
	.word	0xe8f3fc78,0xffffffb7
	.word	0x5412687b,0x7f76f2bb
	.word	0x6d7e06a3,0x04efc2b3
	.word	0x8d845fb2,0x3451d3a0
	.word	0xfffffbbe,0x8319f0b9
	.word	0xafb20ee0,0xea85400a
	.word	0x53bea9ed,0xc0588e40
	.word	0x3c6a8cd8,0x9f98283e
	.word	0x8c4cb2e9,0x396513ef
	.word	0xbc26720e,0x98d6b0bd
	.word	0x6f483478,0xb45096cc
	.word	0x3480a23f,0xcc21cb28
	.word	0xfffff204,0x55794f86
	.word	0x94568c43,0xcb1803fc
	.word	0xcd206463,0xd758d92f
	.word	0x57f28c36,0x3ac9898c
	.word	0x17c8ad1b,0x19255183
	.word	0xa443ba05,0x473279bc
	.word	0x5167cd91,0x71d964e4
	.word	0x807cdc85,0x83525de9
	.word	0x550f9e0d,0xd18bc7fe
	.word	0xb0ee7621,0x6d3de8a1
	.word	0xb854cd38,0x9635a5df
	.word	0xa354fe3d,0x831cf82e
	.word	0x47037d46,0xc346daa3
	.word	0xc6016892,0xd3c7acca
	.word	0xc5590c07,0x44f17174
	.word	0x372aeadb,0x96f8866f
	.word	0xf0349c2e,0xd0e87279
	.word	0x4cfa0a68,0x4c39acf3
	.word	0x72e9b9eb,0x8221920f
p2_local4_expect:
	.word	0x3938465e,0x19e68f42
	.word	0xd3a00000,0x00000134
	.word	0xf31087a4,0x4797f105
	.word	0x5ce152a9,0x3787cc38
	.word	0x3d8ab097,0xedca2dec
	.word	0x8f5a0cd5,0x6cc24ab4
	.word	0x0c66a721,0x87cac5de
	.word	0x858a48fa,0x1e09adf5
	.word	0x9976682a,0x0d9d383c
	.word	0x9f9e6d9c,0x15e42a79
	.word	0xd0276127,0x4197c9ec
	.word	0xd3c21b18,0x2afff0b4
	.word	0x487773ec,0x5c3c7255
	.word	0xb2649a07,0x852f535e
	.word	0xe89033f1,0x2f5f7a94
	.word	0x1a945829,0x57e5c023
	.word	0x29090cc1,0x345c4a8c
	.word	0x2f97d16c,0x7b2f6bfe
	.word	0xd52239e4,0xbf342584
	.word	0xd687e54f,0x6f713a8b
	.word	0x96fb615a,0x462e3f5c
	.word	0x1b06bd2a,0x9a66dc49
	.word	0xd85e22f7,0x2c6087c6
	.word	0x1bcdc187,0xbe18c674
	.word	0x8d81fb28,0x2dd28d67
	.word	0x7d0294a5,0x848c8829
	.word	0x421c0b70,0x5c3f2445
	.word	0x5ebd31a6,0x0f0923da
	.word	0x9e1323b1,0xdbb07a21
	.word	0x02798050,0x749581f6
	.word	0x7b1834e8,0x88488428
	.word	0x61994305,0x7baab638
	.word	0xb80a6e7c,0x250a0643
	.word	0xd8b0efc5,0xdf137eab
	.word	0x077d5dd9,0x365fad54
	.word	0xd274c4a1,0xcef81380
	.word	0x3f9564c4,0x4b74714e
	.word	0x7dcf798c,0x26f8423c
	.word	0x1037f061,0x142cf024
	.word	0x5bf271a0,0xe644bd35
	.word	0xe2b73efc,0x25cc39bd
	.word	0x98db7ea4,0xb52c4a96
	.word	0x6bf30959,0x950846fd
	.word	0x72781b78,0x506edc2d
	.word	0x42983aa0,0xaa254330
	.word	0x7b568f41,0x9513fac1
	.word	0x48d44dd0,0x6cffdfc9
	.word	0x0720b441,0x5392bc0c
	.word	0xd51f81d6,0x8ceed85e
	.word	0xb4163f32,0x2c09a078
	.word	0x6fe9eafe,0x32a45da6
	.word	0x83e2d273,0x342e98d2
	.word	0x56cadd8f,0xe040c260
	.word	0x45dc008d,0x10323873
	.word	0x0a010526,0xefa34090
	.word	0xe6b7213b,0x9e74d085
	.word	0x5d486347,0x3c4b052c
	.word	0x2fc42fd8,0x7b3569c5
	.word	0xcae60439,0x3994050d
	.word	0x7db9ae9e,0x07bcaa60
	.word	0x57f21342,0xc426c5de
	.word	0xf6071e81,0x9a9fa352
	.word	0x003a450e,0xd922d10f
	.word	0x90cb2a7f,0x80ab829a
p2_local5_expect:
	.word	0x00000000,0xfd7720f7
	.word	0x7c10684a,0xa3dfeee6
	.word	0xee3000b0,0xb17ae231
	.word	0x0a5c9c12,0xd65888bc
	.word	0x65567ff2,0x00000000
	.word	0x9d546ccc,0xdcaaacdb
	.word	0x4869c83b,0x14695923
	.word	0x74b7dade,0x5deae461
	.word	0xcba1db44,0xe2849005
	.word	0x90d2abc6,0xd95da553
	.word	0xc8af43de,0x7b4bcd45
	.word	0x6ea54455,0x2e0def65
	.word	0x782f0c3c,0x7bdda43b
	.word	0xf41c0ae5,0x6fb366e3
	.word	0xd66c8f20,0x4d0e96fc
	.word	0xc68a2ac5,0x52b67c93
	.word	0x16fc7edf,0xb1f52d78
	.word	0xd286c963,0x739bb91c
	.word	0xb14e970f,0xc6c6d9f2
	.word	0x1b5aea02,0xc9f557cc
	.word	0x19125e04,0x0c53a7e8
	.word	0xd67851bd,0x5fae618a
	.word	0xf469f812,0x311dd49b
	.word	0x81106a24,0x66d36a41
	.word	0x31f43a87,0x73aeddc8
	.word	0x417605a5,0xa755ab0c
	.word	0x945cab25,0x0f29eab9
	.word	0xc475c776,0xa6755707
	.word	0x7724e2cd,0x6602f7e3
	.word	0x544d0c9a,0x90b14408
	.word	0x86cb0854,0x1f24dae4
	.word	0xac3f9ab3,0x2bad9bdb
	.word	0xbf998f5f,0xd59d6dc5
	.word	0xd66b1948,0x1fb91298
	.word	0x23f02ff0,0x713dc1f6
	.word	0xed279438,0x515afea0
	.word	0x288cdeec,0x256ad830
	.word	0x7db77932,0x5441e2d3
	.word	0x964ddc5d,0x8330e19f
	.word	0x73cf4c5d,0xe8b11daa
	.word	0xa0358ffe,0x7eb1c960
	.word	0x081a21e2,0x983da695
	.word	0xae59c4cb,0x835896b9
	.word	0x33b74c88,0xd0c51528
	.word	0xc6b9ed5d,0x38b3f45a
	.word	0xa941a0d2,0x5da10076
	.word	0x08b8a426,0xafd422bf
	.word	0xc82c5a0f,0x088ca780
	.word	0xc0bedaf9,0x5e282535
	.word	0xb58de959,0x737ec62e
	.word	0x4eceacd5,0x3b185ca7
	.word	0xa3dd8380,0x956cf671
	.word	0x2efcf6c9,0x201ad0ad
	.word	0x7882f639,0x22362c6a
	.word	0xcbc91038,0xaba8f663
	.word	0x1dbfc232,0x3bd34d56
	.word	0xe1908263,0x97984fc7
	.word	0x1b771ef5,0xb4548c41
	.word	0x74f9c01c,0xe00de7c7
	.word	0xc90a6ad9,0x25f4227b
	.word	0x75abcf03,0x3e5799bd
	.word	0xf3eb416c,0x95f6875c
	.word	0x05c38470,0x27ae470c
	.word	0xd657c8a2,0x4c922ace
p2_local6_expect:
	.word	0xde2c784d,0x60fbfc23
	.word	0xd4a1330b,0x764b770c
	.word	0xe117b9ed,0xcc085045
	.word	0xa1005d0b,0x350e34e8
	.word	0xd2bcff08,0xbcbf350c
	.word	0x8084c8ec,0x549a5559
	.word	0x19065fe8,0x83cd03df
	.word	0xd41b3228,0x85785fb0
	.word	0xed47f5e3,0xfac4a7b8
	.word	0x301d7358,0xa990b3b7
	.word	0x74ac2f78,0x99f2698c
	.word	0x8514109c,0x6d144032
	.word	0xc524c81a,0xdc74be59
	.word	0xe3532107,0xcaa3bc23
	.word	0x94f77ad7,0x67354b39
	.word	0x799c940f,0xbeed67d5
	.word	0x3827681d,0xfa9d6062
	.word	0xbe73bf71,0x89511ffb
	.word	0xa26a7f75,0x42e73fad
	.word	0x0be32ffb,0x9ae2ccd5
	.word	0xdf1fecfe,0x72ee34bc
	.word	0x0f6e5260,0xabaf21b4
	.word	0x6e54e2c1,0x393b4937
	.word	0x36135157,0x2dc69d63
	.word	0xc1626d39,0xe98cf3aa
	.word	0xd6d0defe,0x20391bb4
	.word	0xf2e154ac,0x15bb6164
	.word	0x8e26d961,0x400d245d
	.word	0x13251ea8,0x7b9c41c4
	.word	0x62518958,0x5d5d9101
	.word	0x00c13825,0x6e8ed8ea
	.word	0xd5b62665,0x6c8a4592
	.word	0x517ec0b3,0x1f7a5149
	.word	0xcbc04902,0x52caa6c5
	.word	0xeaf7d5ff,0x19a10fb6
	.word	0x1246fec3,0x951995df
	.word	0xbb934bcd,0xc1ba1c75
	.word	0x439b7bbb,0x09667a3f
	.word	0xa132e08e,0xf46d95fe
	.word	0x721a07d7,0xbf15c1d2
	.word	0xdfac4d0c,0x05a6c75b
	.word	0x0799d5b9,0x3ccf015d
	.word	0xc55decaa,0x2d0aab39
	.word	0x961e2807,0xfc5c8d79
	.word	0x9bb8905c,0x8aee337b
	.word	0x62873784,0xbf28c3b9
	.word	0x8ca95ac4,0xb07a7d46
	.word	0x26bbe987,0xb9e31485
	.word	0x91cba074,0xb4b566a2
	.word	0xaab510a1,0x8eff60a6
	.word	0x4eb8a692,0x6631b6d8
	.word	0x548ede19,0x23dd63cf
	.word	0x8c20a100,0xfec2678d
	.word	0xfc0d78a4,0xd7d8b598
	.word	0x00000000,0x9cd1ecc8
	.word	0x49d150f7,0x7aeadeb8
	.word	0xe5ef9b29,0xb5c6ce58
	.word	0x234e9f19,0xc5ba4c35
	.word	0xaadc519f,0x1e7c1245
	.word	0x6ca06cdf,0x7802cc2d
	.word	0xedc0a1be,0x97a658c5
	.word	0xb89ecd21,0xc133d9cb
	.word	0x9cf9021b,0xd173f683
	.word	0x02e871b7,0x96cf439d
p3_init_registers:
	.word	0x597d32ff,0xcc8aed6c		! Init value for %l0
	.word	0xedb1b6ff,0xde501337		! Init value for %l1
	.word	0x51950aff,0xa6cb0dae		! Init value for %l2
	.word	0xf358ee00,0x3ce55bdf		! Init value for %l3
	.word	0xdefc6900,0x3bfb3e36		! Init value for %l4
	.word	0x52a6a8ff,0xec01e703		! Init value for %l5
	.word	0xedb267ff,0xff451fd6		! Init value for %l6
	.word	0xea1e2e00,0x700d8f29		! Init value for %l7
	.align	64
p3_init_freg:
	.word	0xfc0e1613,0x5a9c6e6a		! Init value for %f0 
	.word	0xe13d489d,0xbcb43de1		! Init value for %f2 
	.word	0x8e4417c5,0xd004dc94		! Init value for %f4 
	.word	0x0a22e7d0,0x1356c605		! Init value for %f6 
	.word	0x837b45cd,0xdc4ef9db		! Init value for %f8 
	.word	0x12d93726,0x808daef4		! Init value for %f10
	.word	0x9eac6238,0xc5652672		! Init value for %f12
	.word	0xfc93335f,0xf1f8acd1		! Init value for %f14
	.word	0x1645f46d,0x4a4963ed		! Init value for %f16
	.word	0x162de21c,0x77df3fe0		! Init value for %f18
	.word	0x8482c11c,0x45aff05d		! Init value for %f20
	.word	0x48647a44,0x474cecdb		! Init value for %f22
	.word	0x99e70288,0xbb5042cc		! Init value for %f24
	.word	0x44a8b7f2,0xda38583a		! Init value for %f26
	.word	0x29977c25,0xee1c8376		! Init value for %f28
	.word	0x6dac8d99,0xccb10c97		! Init value for %f30
	.word	0x257790c3,0xb3232db0		! Init value for %f32
	.word	0x8af81cb3,0xe45c25c1		! Init value for %f34
	.word	0x187ba364,0x6f18697b		! Init value for %f36
	.word	0xcd2908a0,0xdae9a8fb		! Init value for %f38
	.word	0x9ea5282c,0x32842797		! Init value for %f40
	.word	0x6c1eac27,0x15f07f6a		! Init value for %f42
	.word	0x9a48bf5e,0x404b6491		! Init value for %f44
	.word	0xfdc21688,0xc547a21d		! Init value for %f46
	.word	0xdd7cf36d,0x0bc3aa6a
	.word	0xe9bebf7d,0xd5a74b90
	.word	0x756aee6a,0x610fa5ab
	.word	0x7da31542,0x7fce9d34
	.word	0x7f71914d,0xb24d990e
	.word	0x83a2179d,0x6b16be81
	.word	0x87a9d238,0x585691b3
	.word	0x972b171a,0x64b790ab
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
	.word	0xbf2e6399,0x84dc2001
	.word	0xffffffff,0xbbdbf495
	.word	0xffffffff,0xfffff127
	.word	0xbf2e6398,0x84dc2002
	.word	0xffffffff,0xbbdc024a
	.word	0x00000000,0x7fffffff
	.word	0xffffffff,0x77b7e92a
	.word	0x00000000,0x000000ca
p3_expected_fp_regs:
	.word	0xffffffff,0x5a9c6e6a
	.word	0x7a779b48,0xbf800000
	.word	0x7a7e9547,0x808daef4
	.word	0x80000000,0x3f800000
	.word	0x00000000,0xfa779b48
	.word	0x12d93726,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xfa779b48
	.word	0x00000000,0x3f800000
	.word	0xffffffff,0x00000000
	.word	0xffffffff,0xfa779b48
	.word	0x00000000,0x00000001
	.word	0x00000001,0x77df3fe0
	.word	0x00000000,0x00000000
	.word	0xb811b5de,0x80000000
	.word	0xfa779b48,0xccb10c97
	.word	0x257790c3,0xb3232db0
	.word	0x8af81cb3,0xe45c25c1
	.word	0x187ba364,0x6f18697b
	.word	0xcd2908a0,0xdae9a8fb
	.word	0x9ea5282c,0x32842797
	.word	0x6c1eac27,0x15f07f6a
	.word	0x9a48bf5e,0x404b6491
	.word	0xfdc21688,0xc547a21d
p3_local0_expect:
	.word	0x000000ff,0x5dfffae1
	.word	0xbbdbf495,0xe37995fa
	.word	0xf68d268d,0x4210562c
	.word	0x6a226ef4,0x45144c4c
	.word	0x0000002a,0xa8e850d5
	.word	0x6c31e6ce,0xffffd4ea
	.word	0x74693f90,0xdab45b7c
	.word	0x61b5e874,0x3a5ae648
	.word	0xed6d7ab0,0xaa038b98
	.word	0x00000000,0x000000ca
	.word	0x694e6211,0xf8291b4b
	.word	0x6434b32a,0xa85efd98
	.word	0x832cc409,0x12666149
	.word	0x082f8dee,0xffffffff
	.word	0x1496b7b6,0xf13a1f46
	.word	0xc3147738,0x41accad4
	.word	0x92456920,0xc460058d
	.word	0x8fc46e9e,0x0dd8d8d1
	.word	0x1a670d2b,0xc1cfc395
	.word	0x00000000,0x0000216b
	.word	0xc9c4ab9a,0x75779cf6
	.word	0x0d015704,0x5c82b607
	.word	0x6c7656f7,0x967dde05
	.word	0xc3ddeefb,0x80e73918
	.word	0x5dfff28c,0x9b843fee
	.word	0x974897ac,0x1e95db52
	.word	0xf6d1a9bd,0x926221c1
	.word	0x78d61014,0x3190bfb0
	.word	0x88945364,0xeef05518
	.word	0x751f845f,0x12005ca3
	.word	0x2ac2e64d,0x58522e46
	.word	0x4f9828a1,0x17682d24
	.word	0x8e484f03,0x60240fa9
	.word	0x61cb2873,0xfb9c6f47
	.word	0xa1feeaa3,0x2f9b4aa2
	.word	0x7ab47e47,0x78171fbf
	.word	0xc9b661d9,0x09861814
	.word	0xbf0f01be,0x838fcfcf
	.word	0x9617049f,0x4a503873
	.word	0x0d1275f3,0x5abeebe6
	.word	0xe23c050b,0x384e8ca6
	.word	0x085f080a,0x88ad8fce
	.word	0x371ccf16,0x83079565
	.word	0x2e07d582,0xfd232be8
	.word	0x06b90f2a,0x5e591375
	.word	0x02278c73,0x6afc1af3
	.word	0x812048da,0x2059afd2
	.word	0xc7bc5f5e,0xa503ed44
	.word	0xee7a5787,0x784fe107
	.word	0xb936deb8,0x40b5947f
	.word	0x0317cd25,0x2536ff8b
	.word	0x325c7a50,0x8faf8b64
	.word	0x4cd6c8b0,0x6d615c62
	.word	0x016a347d,0xde195276
	.word	0xe5d7081b,0x102d1505
	.word	0x67dcf0a1,0x8f6b81c3
	.word	0xbda2b4d4,0x3aa3259b
	.word	0x4cbdcd80,0x6a9131db
	.word	0xc50ea2df,0x938a74ee
	.word	0xb4cfeedb,0x27513329
	.word	0xe0eee9ab,0xfe8a8def
	.word	0x00000000,0x00000000
	.word	0x8ad0422f,0x32558ff5
	.word	0xe0eae1ee,0xd3651499
p3_local1_expect:
	.word	0xe82b239b,0xbcf63250
	.word	0xd4eae157,0x5ad1afca
	.word	0x003fc4b2,0x25400cb0
	.word	0xb34ef50a,0x96b99fb9
	.word	0xd1eb1091,0x33fc2e3e
	.word	0xc7b5d74e,0x9a8fbe2c
	.word	0xf8a5b583,0xb46bcf08
	.word	0x0c8f3b5b,0x3abaa314
	.word	0x544443bc,0x08b1c423
	.word	0x47977150,0xc7317e59
	.word	0x748a8a46,0x9554e750
	.word	0x37750b1c,0x0f1b8906
	.word	0x72e764b1,0xe2f6bf7e
	.word	0xdee2bc02,0x4c68407d
	.word	0xc6eb2b8c,0x6e055d57
	.word	0xa884f433,0x4f4a4ec6
	.word	0x0ac86910,0x9b269f5a
	.word	0xbf2e6398,0x84dc2002
	.word	0xdfbed2a9,0x9d50f60f
	.word	0xd82cbc5b,0x38ddd4d2
	.word	0x87cec67a,0x32d3828d
	.word	0xf19fd45a,0xbcf07b42
	.word	0x475e4616,0x876540ee
	.word	0x9e31f345,0x1e73ee58
	.word	0x702a111f,0x1df77235
	.word	0x6fcb2e25,0xf6907615
	.word	0x158f8b0a,0xf7a74c73
	.word	0x5ec69d1b,0xbc91f572
	.word	0x6ee85e55,0x7101aa92
	.word	0x5ad8b5ca,0x88d852b6
	.word	0x61af39ae,0xd5383249
	.word	0xab5d953a,0xa608c348
	.word	0xfc6485d3,0x70922dd0
	.word	0x3ab081b5,0x3c413d46
	.word	0xd621974a,0x38002a64
	.word	0x82d3393e,0x938e691b
	.word	0x42b6c316,0x0000d4eb
	.word	0x26ff24e2,0xfdd9f7e0
	.word	0x5ad52d5e,0x5d602384
	.word	0x499a788a,0xf9a9e851
	.word	0xae832a4a,0x9d39ba15
	.word	0x6dec1026,0xb5a8a17e
	.word	0x5f39b0f4,0x5539b6b6
	.word	0xffffd6fd,0x3b495c00
	.word	0x7f66aa3f,0xcb12c091
	.word	0x9e83f601,0xa8281992
	.word	0x8dc77bc5,0x8dc774fe
	.word	0x00006dec,0x1712c895
	.word	0xfc00db09,0xf69245ee
	.word	0xaa4887b4,0x7298f280
	.word	0x9c44616f,0x6fa2737b
	.word	0x5c4ac988,0x917cf6da
	.word	0x690f6bc8,0xd79ec369
	.word	0x2076a39c,0x18ce2d88
	.word	0x9daedaf2,0xab9369dd
	.word	0x7f689b07,0x00ff7ac5
	.word	0x0ff2fa78,0xe90e0940
	.word	0xeee3033f,0xa75897f5
	.word	0xf1085a17,0x29819818
	.word	0x9cb1ea30,0x2fbea3c7
	.word	0x4e8aaa7d,0xc7b5cca2
	.word	0x82ab2e0c,0x00dbb1b1
	.word	0xeea5f72a,0xa7ac6415
	.word	0xf4224b0e,0xff451fd6
p3_local2_expect:
	.word	0x0000002a,0xffffe783
	.word	0xe4010001,0xfffff495
	.word	0xa6f21b90,0x0000d4ea
	.word	0xfca31666,0x1d60fde2
	.word	0x68c4deb2,0x5b60243e
	.word	0x86142e0f,0xc863c13d
	.word	0xa082e7de,0x52f7472c
	.word	0x25db12cc,0xb414c673
	.word	0x0bc73431,0xcfa46e45
	.word	0x00007fb1,0xa11d43fd
	.word	0x2526bc35,0xcab1be11
	.word	0xeb9150ab,0x51313b7f
	.word	0x049692b7,0x74941adc
	.word	0xc2c9a78d,0xc7464681
	.word	0x0363086b,0x4cff1857
	.word	0x6f0f415b,0x85526090
	.word	0xad11bc72,0x0017d4c0
	.word	0xccd9d356,0x861c3049
	.word	0x5d1312f8,0x3df67667
	.word	0x9ce5b1cd,0xffffd432
	.word	0x58d48484,0x9dcd222c
	.word	0x14093715,0x7640ea3c
	.word	0x4934ee5a,0xf53c34f7
	.word	0x46d9959e,0x1789d402
	.word	0x8614bf1d,0x6906afb2
	.word	0x982463d1,0xd8aba25f
	.word	0x69157756,0xe790ac6c
	.word	0xc57008cc,0xce2e8748
	.word	0x813c3ee9,0xdb7fd2e1
	.word	0x5aa68401,0xbe1747ff
	.word	0x230706f1,0x9109beb1
	.word	0x95d3829e,0x0b819860
	.word	0xee05a315,0xc762e76f
	.word	0xa8918f6d,0x1fded6b0
	.word	0xffe8a8b4,0x617c6587
	.word	0x9f2ade2a,0x35e77fb1
	.word	0x63d28fc4,0xf4b9ab72
	.word	0x6684d210,0x97631181
	.word	0x4e88fca9,0xf93fb350
	.word	0x24a6a9a5,0x4a4ea6a3
	.word	0x6aba4242,0x109841a1
	.word	0x99131a40,0x309580d3
	.word	0x76acb1ef,0xc7b471d4
	.word	0xcf4fceea,0x5764080c
	.word	0x34a68e58,0xea4f9b13
	.word	0x00000002,0x5493fc09
	.word	0xe7103786,0xcea8bf21
	.word	0x8d714bca,0x41d1df46
	.word	0x7c4b5bf6,0x835f34dc
	.word	0x20098839,0xbdcdfdca
	.word	0x04a4368a,0x60093fe1
	.word	0x7dd45070,0x7dd45070
	.word	0x37ea410d,0xbcc2cbe4
	.word	0x62a075aa,0x03066858
	.word	0x8feae567,0x1722ba1c
	.word	0xd984c4be,0x75922ddd
	.word	0xffffffff,0x3e00648b
	.word	0xd6e00cca,0x2e6498ac
	.word	0x54071374,0x36382c29
	.word	0x596fc19b,0xd77c6975
	.word	0xe7087101,0x7f2f4406
	.word	0xfbc2c967,0x2468338f
	.word	0x00000000,0x0000009d
	.word	0x41b7b11c,0x9d09f94a
p3_local3_expect:
	.word	0x0001ffff,0x1e0fff08
	.word	0x00000000,0x00000000
	.word	0x0443e3a3,0xcdfc0ab8
	.word	0x0103418a,0xef367d87
	.word	0x79fafba8,0x7092e917
	.word	0x202fc52c,0xd610755e
	.word	0x9ec489ae,0xf4403e7a
	.word	0x335c58fa,0x31622110
	.word	0xfefcb98e,0x62137080
	.word	0x4b7b634f,0x9f2b8304
	.word	0x9d048646,0xa6436490
	.word	0xc22dc70b,0xea13fa7c
	.word	0x0893fd65,0x2bb95de2
	.word	0x24c98188,0xaba2bfd5
	.word	0x8497979e,0x70422c00
	.word	0x1a260573,0x44a91c6a
	.word	0x87f51489,0x4c172432
	.word	0xfadf5f04,0x9b8c73aa
	.word	0x9b30d454,0x1059153b
	.word	0x3fdbe012,0xbdea7cf2
	.word	0x9f3982ab,0x420bd448
	.word	0x70990000,0xaaf50f69
	.word	0xed87da2c,0x7aceb04b
	.word	0x98bd1219,0x2ce3a60d
	.word	0x548c7792,0xb68bf45b
	.word	0x63356cd7,0x81192341
	.word	0xd9476740,0xc7c48a2a
	.word	0x0ffb2354,0x83e0968a
	.word	0x0fc8a6d0,0xf51f6f12
	.word	0xf218c2d0,0x7792ff18
	.word	0x9fe1bf44,0x417131fd
	.word	0x0396aa19,0x1869e300
	.word	0x00007fb1,0xced6e202
	.word	0xc7e14860,0x1be98b8c
	.word	0xd0f837a0,0xc4bc0eb4
	.word	0x018e77b2,0xd32d35f4
	.word	0x95589931,0x2c92648b
	.word	0x20f6d9a2,0xcd47725f
	.word	0xba404225,0x4b89c244
	.word	0xef3569e6,0xe6d9a68a
	.word	0x0000ff08,0x13fd2cd2
	.word	0x6965fcaf,0xeebf6ea1
	.word	0x43b850b5,0xd27bce45
	.word	0x97339633,0xb0b4c12b
	.word	0x5dfff28c,0x00000000
	.word	0xca1d7734,0x5d9337aa
	.word	0xdc76c1e2,0x5830ab58
	.word	0x16106000,0x00000000
	.word	0xbbd6f64e,0x45902f32
	.word	0xdfa88f8b,0x7381368d
	.word	0x4e5df9a8,0xd8d29ce8
	.word	0x0000045a,0x8b9d150b
	.word	0x1deddaa7,0x6113c94f
	.word	0x5430bb0e,0xb1c967b5
	.word	0x2193fee8,0xb2ff85b8
	.word	0xe46610af,0x3c9c0bad
	.word	0xe475ff3e,0x75ec989a
	.word	0x641575b3,0xce4ebaa9
	.word	0xffffffff,0xfffffffb
	.word	0x829273c5,0x16258cd3
	.word	0x07e7afa1,0xca7034e8
	.word	0x37913a1c,0x0cd8721f
	.word	0xb4cdf0ea,0x69cd941f
	.word	0x00000060,0x1712c740
p3_local4_expect:
	.word	0x00000001,0x6e232a17
	.word	0x67e54638,0xde3a8f1c
	.word	0x0600548c,0xcb0a6b59
	.word	0x19da01cd,0x9853b59e
	.word	0x7bc1cbcf,0xd596105d
	.word	0x41f9d763,0x9a3cb16f
	.word	0xb8df5993,0x4fe07f66
	.word	0xb727617a,0x7f507064
	.word	0x8507838c,0xd1fd2427
	.word	0x8b23b1cf,0x4efc7758
	.word	0xee219537,0x345e6c6c
	.word	0x8e0ef25e,0x9370c512
	.word	0xf9453e90,0xb06b2718
	.word	0xa08c492b,0xb86f8740
	.word	0xfac33015,0x9e0ed7fb
	.word	0xe782b4e2,0xb4514f16
	.word	0x4e141a15,0x4b2fb1b4
	.word	0xb407e800,0x2e35203f
	.word	0x187e84bd,0x3fb9c07b
	.word	0x92c09516,0x3228f388
	.word	0x10e26e9c,0x1db52ada
	.word	0x74f2fbe7,0x68a78266
	.word	0x30981341,0x946b29ac
	.word	0x0cf80be1,0x999d8e72
	.word	0x87185480,0x3df1601a
	.word	0xca3c1192,0x11fbb2b8
	.word	0xd4f8b4a5,0x64aa974b
	.word	0x3ef94f41,0xa822b841
	.word	0x334377d4,0x06582345
	.word	0x08a64396,0x531d1f38
	.word	0xbf9c534c,0x3315e21a
	.word	0xb9920947,0x8e805104
	.word	0x4cfc8df3,0x18824a67
	.word	0x922e70d8,0xd9f22576
	.word	0x1caf3e73,0x9df913f8
	.word	0x35209995,0xb90e4f31
	.word	0x10b95175,0x87b8f5c6
	.word	0x3e090081,0xf2ae6ae2
	.word	0x465b0883,0x4c88a71c
	.word	0x46a621ca,0xc3ad2091
	.word	0xb219797f,0x12594f43
	.word	0x3c516638,0xe1f60695
	.word	0x26bf3bfb,0xa680493f
	.word	0x5121be28,0x7c59cf3a
	.word	0xd555c9a7,0xb6f47ca9
	.word	0xdbb5989f,0x54422616
	.word	0xe0cc49c8,0x229382ec
	.word	0xb4374bd3,0x27df3c10
	.word	0x72c48d15,0x862d3d0a
	.word	0x98c26b6d,0x013e7b98
	.word	0xf526c7ae,0xd63dc5f8
	.word	0xcd48b4c8,0x7e751153
	.word	0x8e3d0173,0xe0490077
	.word	0x8ac603e8,0x398528d4
	.word	0xcb4eeda0,0x19f5b143
	.word	0x150dfc9d,0x5b1bffff
	.word	0xab560686,0x5fadb8e0
	.word	0xc737b850,0xb33a523b
	.word	0xd3b148d0,0x53872d34
	.word	0xfd960f87,0x1bfc2c27
	.word	0x606ef584,0x3accb0ad
	.word	0xedd8050d,0xd2237bbd
	.word	0x6c69a782,0xea393561
	.word	0x07c10633,0xb985bb92
p3_local5_expect:
	.word	0x095ac635,0x000000fd
	.word	0x570b0488,0x5e3fbbdb
	.word	0x5049303c,0x42e85f95
	.word	0xf29d31a3,0x1dc666de
	.word	0xfd5af3db,0xcd74b994
	.word	0x653c680c,0x29a1edd6
	.word	0xd8e740b1,0x47839aae
	.word	0x187e54de,0x70ad45fd
	.word	0xb3110cb3,0xd99507fd
	.word	0xf72f9413,0x8ec38a3c
	.word	0xb5ce315f,0xc1e5e5d3
	.word	0x1705618d,0xf8ba2529
	.word	0xaec650dc,0x63cf7f71
	.word	0x21ec818e,0xf7d22ed7
	.word	0x897c95fe,0x1f6101e3
	.word	0x81cbbdc5,0xa42d8ad2
	.word	0xad280c8b,0xdfab52d8
	.word	0xa3e7cc53,0x4b58cdce
	.word	0x6e90d3e5,0x227aeaf4
	.word	0x45682ef2,0xa09c9bbc
	.word	0xe6719c1b,0x55f01c36
	.word	0xb6c1ef55,0xc3bfcdc9
	.word	0x6236d432,0x7f430710
	.word	0x0d3207ee,0xb19e0cb1
	.word	0x92651071,0x4a3d7118
	.word	0x8cfc62be,0xcf52b7f7
	.word	0x2e6016a7,0xabe6e2b6
	.word	0xe09ab0ca,0xb67217a7
	.word	0x3d21dda0,0x5469378f
	.word	0x2145e1eb,0x70f8c068
	.word	0x2b95a1e6,0xe32ba535
	.word	0x1209fd1a,0xfa70a70d
	.word	0xdf58aed0,0x28306171
	.word	0x3b9f324b,0x51416831
	.word	0x00000000,0xff83b1cc
	.word	0xaffbefda,0x2a578a84
	.word	0x00139450,0xfc3a024f
	.word	0xd02996ec,0x2cd760f8
	.word	0x6e6b8f30,0xbba2d2c6
	.word	0x68df5c34,0x0cdc7577
	.word	0x29688659,0x7a5a9b12
	.word	0x00227670,0xf9a6a837
	.word	0x0e256b0c,0x1970b083
	.word	0xdcc66535,0x4cb4a801
	.word	0x982ee63b,0x6da92d60
	.word	0xf4372c68,0x42c2f8da
	.word	0xea2df6a7,0x0228cf04
	.word	0x77f3deb4,0x896f68e0
	.word	0xe3106503,0x884a7953
	.word	0x820f36b6,0xb178a038
	.word	0xebd29a6d,0xb124efc9
	.word	0x5a084863,0x03e75868
	.word	0x17e029fa,0x7a2527e6
	.word	0x02027382,0x1ae918bc
	.word	0xaac0d8e0,0x81edc444
	.word	0x364dbc1b,0xef456cc3
	.word	0x3b05a297,0xb8f601d1
	.word	0x1a4b2e80,0x12ef3ff0
	.word	0xd10fb326,0xdd584251
	.word	0x3932c903,0x573caaa8
	.word	0xa4beec82,0x9260b8e0
	.word	0x9ea01b8e,0x9377f3ed
	.word	0x99caf85c,0x4272fa23
	.word	0x16c8f296,0xd10dfb15
p3_local6_expect:
	.word	0xbbdb665c,0x43c68b1b
	.word	0xfdffd432,0x7fffffff
	.word	0x5a6cea44,0x55e89ac0
	.word	0xe2ccc095,0x08aaa524
	.word	0xddd43816,0x1a105a3c
	.word	0x8b4f5ba1,0xa9dc57b3
	.word	0x7239a87c,0x6fa05bd5
	.word	0x437c25bd,0xcfade360
	.word	0x13ad84f2,0x2122f076
	.word	0xc34e34c6,0x9ab7a5ba
	.word	0x7d03241d,0x895cff51
	.word	0x91402bc3,0xcb0c03cb
	.word	0x96775a5a,0xeef9a23e
	.word	0x2cb02091,0x03dbd77a
	.word	0x88212487,0x3173e6e0
	.word	0x01931bda,0x912a851e
	.word	0x7ac69b7b,0xdb8850ef
	.word	0xd8a57796,0xcdfd90cb
	.word	0xd0088084,0x3c1de966
	.word	0xca60c6d1,0x17fc1b60
	.word	0x801521d9,0x6ac11388
	.word	0xd3b0e0af,0x9f99ce78
	.word	0x332cfef1,0x628e8b3b
	.word	0xccbba3b8,0x8a403db8
	.word	0x614863ee,0xae7f89d4
	.word	0xbf273191,0x3e84edb7
	.word	0x03130e1b,0xfe95d7bc
	.word	0x905ab00f,0x1f7ddd38
	.word	0x1d9588db,0xfc8d9553
	.word	0x49c581e2,0x62753f82
	.word	0xc86d7a43,0x61ef13a0
	.word	0x10979317,0x5c93572e
	.word	0x23093300,0xf9477b09
	.word	0xadee7181,0x814cfca7
	.word	0xba5ea95e,0xa7283be8
	.word	0xa5273721,0x96ea9676
	.word	0x767c9361,0xe182c1a7
	.word	0x2a284fb4,0x143c7cd8
	.word	0x4d9c8067,0x6b18bdf2
	.word	0xdf8e5750,0x4efab903
	.word	0x943e3202,0x96bb0163
	.word	0x4710b18c,0x56ffc51f
	.word	0x38fe13ce,0x8f73f039
	.word	0xf2eaac29,0x9ba247ac
	.word	0x3a1faa79,0xc9987a6e
	.word	0xd075239d,0xd9ddeea5
	.word	0x70702b7e,0xd9d09d22
	.word	0x7047a998,0xc3f5a060
	.word	0xfe03de51,0x4cfbbc1e
	.word	0x0feecc8d,0xee741468
	.word	0x342d2b25,0x34d7434b
	.word	0x7a5fb551,0x078667f9
	.word	0xd717fdcb,0x08c47ed7
	.word	0x33f5fa2e,0x4f90cc0c
	.word	0xab20dc74,0x7b4cfa7b
	.word	0x0237e193,0xb6b5d066
	.word	0xe3d7aa9e,0x26e6e4a1
	.word	0x4c3d4de2,0x6ae04268
	.word	0x615c1c0b,0xe3ecf116
	.word	0xc2e013cb,0x0d7d3ca6
	.word	0xcdb07f76,0xe8c2dc5e
	.word	0xcd550c9a,0x21df0551
	.word	0xd335ebb8,0x69d6c5fa
	.word	0x333a1128,0xe88d3f8f

expected_common:
	.word	0x2a3c1218,0x020b0b3c,0x1d07382f,0x191c3308
	.word	0x000000ff,0x0005a30c,0x1e37250f,0x111c240d
	.word	0x180a1a2d,0x2131140d,0x190b0f3a,0x24311807
	.word	0x0b092e14,0x2a2b0904,0x00000026,0x1e0fff08
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
	.word	0x82181650,0x0a73f443,0x5e1c047f,0x1687c075
	.word	0x1c23b2e9,0x076aa311,0x4be9c73e,0x39274474
	.word	0x7257e89c,0xdb34a30d,0xafbb5f8e,0x89364878
	.word	0xad928741,0xd91b0c10,0x3d381f00,0x05f71d7c
	.word	0x93b2f29e,0x6db92e37,0xc8c506d8,0x6d9fe516
	.word	0xe641f8a6,0x882cf537,0x3da4c82b,0xc22ed48a
	.word	0xbfe56d24,0x432a06a6,0x229e256f,0x2f22d2bf
	.word	0x722626f3,0x68fb2936,0x8fc18fc5,0x49ea0f43
	.word	0x6f41edf1,0xc48be4c0,0x69fd3147,0xab56c0ab
	.word	0x8426195e,0xaa828b72,0xc6bd670f,0xd16af110
	.word	0x9ae1d353,0x444bb0e6,0x2c7c39f4,0x57c016b3
	.word	0xd58e1f34,0x8ac8367b,0x5f81405c,0x5a8ffc7c
	.word	0xae657699,0x6fc33bb7,0x5467df53,0x06c1dbad
	.word	0x6ae940e6,0x2a3eba1a,0xa569e45b,0x7919f1a8
	.word	0x85556e80,0x9921d991,0x7fb41c34,0x442bbb3c
	.word	0xdaa4f84e,0x7c7392e2,0x7571c235,0xc9b9da17
	.word	0x5e556f8f,0xc7e7712d,0xe1a8c7e1,0x2ef70cee
	.word	0xc16533ce,0xa2340178,0xda6eb135,0x0949a496
	.word	0x34425542,0x51cafbce,0xc5b5b86f,0xa2b065d7
	.word	0xdb5c50ff,0x6c445f43,0x1cbc4ffa,0xdc44dbf7
p0_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local1_begin:
p0_local1_start:
	.word	0x34ef4b3c,0xfe491c0e,0xde0d6172,0xff47a121
	.word	0xe2fd139b,0xe9fc832d,0xca2ebfc6,0x348c3d66
	.word	0xcde4ac84,0x2f45537b,0x110eb19c,0xda432f62
	.word	0x16389d2e,0xa3458194,0xfff22123,0x1922cff2
	.word	0xdfd4eefa,0xb9b2c28f,0x2aa9c3bc,0x14212304
	.word	0xcf5a3acb,0x513fc84f,0xbdf358a7,0xd24621d8
	.word	0xb7620b0c,0x99e21fa4,0xed3a5b6a,0x0c5bb192
	.word	0xc077e3cb,0xb4adc27b,0xeecda8b2,0xd55f3bee
	.word	0x019d184e,0xef217f99,0x0091cf4d,0xd17f8942
	.word	0xec6c858f,0x53f874ea,0xa02f2d46,0x51628fa1
	.word	0x68523d35,0xb8e697db,0x2ae0ff0c,0x18a11557
	.word	0x9df93034,0x49fcfd86,0x086eec60,0x5b660053
	.word	0xfae94331,0xed9f8ff8,0x69008f89,0xbf5ba7b6
	.word	0x4b9ff5ac,0x4d29e7ee,0xf1817782,0xe84cda26
	.word	0x78984796,0x567d5ed6,0x5252f3ef,0xf5dc5dba
	.word	0xd6562660,0xb7114aca,0x2b451df4,0xa2573a4e
	.word	0x3e64c5dc,0xcb023f6e,0xfae7f13f,0x0f400d83
	.word	0x786693b5,0xd18daaf2,0x422a6373,0x9c638447
	.word	0x33ca9d73,0x9862ca40,0x24254abd,0xcd7ba507
	.word	0x17c21469,0xb6a377eb,0x863a09f0,0x34a703cc
p0_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local2_begin:
p0_local2_start:
	.word	0xdcb23c09,0x23fe5523,0x88878ba1,0x0af1e8eb
	.word	0xd7435f9a,0x8de7f5e1,0x6ac0280a,0xba336194
	.word	0x5a00c608,0xb0113622,0xf69488f8,0x86e783bc
	.word	0x4264705c,0xaf2b7298,0x136236a4,0xf20f9ef5
	.word	0xc2fd3d0c,0x6b496d40,0xb3239b12,0xadce2f5c
	.word	0x4853a446,0x637b02c8,0x5048be44,0x04ba19d0
	.word	0xd3679ec7,0xfe839644,0x8b3802cf,0x0be9c617
	.word	0x826e3e27,0x1532a43c,0xb5c701d5,0x6b140b18
	.word	0x906a1c0a,0x823bd4ef,0xf618fa05,0x4774e548
	.word	0xcb3e7548,0xbc4e6a9b,0xbdb549ed,0x3da9f7d9
	.word	0x8d21ee1d,0x6c3c6553,0x6c81ef7e,0xb1eb2f18
	.word	0xc98429d9,0xfd10d4b0,0xc76fbd85,0xf2a7028f
	.word	0x0a325f01,0x7c0ec48b,0x890ddaca,0x4e35edd1
	.word	0xb89a7b44,0x2119ab1f,0x92f0a117,0x518a3645
	.word	0x007d62b6,0x107aaea1,0xa04bb3c2,0xcb260a79
	.word	0x0693274d,0xff8661c9,0xbdd1ac91,0x80269fe2
	.word	0xf3ddd486,0x023c518a,0x8ff62e37,0xa766e4f3
	.word	0x0a67f4a9,0x9a402877,0xfda3b52e,0x0a2757f2
	.word	0x37cb39b4,0x139805c4,0x495b4929,0x7673a10d
	.word	0xe3db8e16,0x202b1bd5,0xd777cc3b,0x71c04853
p0_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local3_begin:
p0_local3_start:
	.word	0xdcd211b7,0x067b67f9,0x64ffa3a1,0x836d4975
	.word	0xf67e2697,0x3e798816,0x0ca7c9ed,0x3d763e24
	.word	0x5ba84873,0x6efeb797,0x8e060c7f,0xcc954210
	.word	0x95efc999,0xf248e05f,0x830b8032,0x137fcc9d
	.word	0x068c7990,0x0c4aedcb,0x49bcaf22,0xf1512597
	.word	0x9d87fed5,0xa58bd908,0x64046849,0xd38547a5
	.word	0xc8bf1352,0x4d1d3af2,0x75afb3cc,0x410e7efd
	.word	0x429f02dc,0xefb9feaf,0xfbb6a35f,0x34da0c97
	.word	0x0d8ac0e4,0x01861380,0x979c8363,0x702787df
	.word	0x3747aaa5,0x5634e69a,0xf8481214,0xaeb1822a
	.word	0x01fdafdb,0xfd8017d7,0x03a7885f,0xaf8d8dac
	.word	0x3a3fea32,0x79550ca9,0x6335dc29,0xe45e1740
	.word	0x27c0e163,0xc06ed513,0x5cdb2478,0xf572ebbf
	.word	0x0564279a,0xe25830ab,0xad52d2b9,0x76997615
	.word	0x9aae4e52,0xd344aedc,0x87b74602,0x57be45cc
	.word	0x3c580825,0xad0eebc5,0x2d8ff1b5,0x5b88871b
	.word	0x41e713bb,0x53a21608,0xdff8664a,0x4a6ef09f
	.word	0x6ea3ab41,0xee20eeb0,0x0d8d04b5,0x40a8aab2
	.word	0x9d886834,0xdbc5875b,0x91425642,0x1285664f
	.word	0x19748a22,0x5a8f489e,0x9b941b45,0x57a6263f
p0_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local4_begin:
p0_local4_start:
	.word	0x6e3818e5,0xd5a2b060,0xe8389480,0x6cc1597a
	.word	0x0cee2259,0x3aeb57ca,0x3621fa5b,0x4fbd28e8
	.word	0x44eedc8c,0x446e425e,0x309e90cd,0x59bf9f82
	.word	0x6597bd9f,0xafc1ac80,0x0e305e4c,0x693416ed
	.word	0xb6f712a9,0x0914994f,0x60e58b8d,0x3fe9ee25
	.word	0x2191d6cf,0xdc9c2979,0x3e1fa7ae,0xc13cd357
	.word	0xd05ed546,0xfbb59bc9,0x84c2847f,0x5c85eb66
	.word	0x9a41b793,0x78603693,0xe099f762,0x2c5b0db2
	.word	0x272eba6e,0xbb2f2075,0xba232d4b,0x2fab66a1
	.word	0xff763de9,0x1f5de5e5,0xb91a311c,0xa31aae33
	.word	0xc5488412,0x99f6dcf6,0x51cc5568,0x69d757f0
	.word	0x2b286622,0x13df58fc,0x70e9ce24,0x02787890
	.word	0x50ba56af,0x4f68eb2d,0xd187da00,0x653cce96
	.word	0x49190ec9,0x2888a601,0xd2bf9f18,0x0dac58c8
	.word	0x08e09491,0x4a4c6d5d,0x56c4df3a,0xc2dab135
	.word	0x74c2c671,0x1891c4e1,0x9b75cddf,0x39c90007
	.word	0x9c2cafee,0x1f546333,0x6487efe3,0xc9bd034d
	.word	0x18bf7c09,0x48e3ad54,0xbe6635c0,0x81ba1728
	.word	0xda3b7add,0x178e1372,0x006dcc6d,0x0c7f7457
	.word	0xf1e6fe26,0x4483046c,0x7dcb6c47,0x6b562c0c
p0_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local5_begin:
p0_local5_start:
	.word	0x78ffb457,0xcda72d0a,0xc34331c2,0x1b86bb00
	.word	0xb1066d3b,0x9e2bd552,0x1991a1d6,0x510bb3ff
	.word	0x166041f9,0x098199e1,0x34e88c09,0xa48fb430
	.word	0x0fd31368,0x3bd2caef,0xb35f1523,0xe99da6d6
	.word	0x5f2d8fca,0xd4577a91,0xc20de320,0x95ee48f9
	.word	0xf7b51e74,0x12bcf6b0,0x22749a65,0x631be372
	.word	0xda671c2b,0x80b81f12,0x3353ed69,0x9652eecf
	.word	0xcee7b834,0x7f6df479,0xf602a515,0xd8a6ceb2
	.word	0xde01f490,0x85344ecc,0xf98c0576,0xa976418c
	.word	0x322ced90,0x0bf4fd34,0x5da7274b,0xc06f38f4
	.word	0xb83e14f9,0xddf48f0b,0xa55a3a69,0x95d45574
	.word	0x34f7fe38,0xb0eaee55,0xee9d341d,0x4632f34d
	.word	0xcb3df48c,0x386fb43d,0xe5afeddf,0x9658cb4c
	.word	0xf85b34a6,0x6180b665,0x90ec2047,0x0b341b08
	.word	0xa1c55840,0x50f39403,0xbe196b4d,0xec579567
	.word	0x4a3c6645,0x95ef3033,0xbca4ede4,0x0ca9d16f
	.word	0xdda16e13,0xa4cdb4ce,0xb844f7f2,0xdede1c9b
	.word	0x6ff2b439,0xecaee11a,0xd7f143f6,0x0e47b88d
	.word	0xf8a9f806,0x6ee0fc92,0x02beaa41,0xad883f82
	.word	0xa49e9c9e,0x63686972,0x466410fb,0x9464457b
p0_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p0_local6_begin:
p0_local6_start:
	.word	0x9a3e789a,0x11a852d2,0x9d90c7f7,0x234f7968
	.word	0x498ae99f,0x30552d2f,0x66694b68,0xd381ff86
	.word	0x75a1a44b,0x06963f72,0x838654a2,0x23cb089f
	.word	0x7c8b8215,0xccb2dc0a,0x8c27be33,0x8b27284a
	.word	0x4ade7de6,0xb51637e6,0x46700bfb,0xfbaf2afb
	.word	0x761c14bc,0xe679f3a0,0x31172de2,0x7b2c736d
	.word	0xaf956b91,0x6e3e9987,0x3ee25038,0xa074af1a
	.word	0xfe2ac838,0xf1961167,0xd61880be,0x387bf558
	.word	0x70381caf,0x58ccf082,0xa1a21f0d,0x76b29c85
	.word	0x96d0df87,0x9665214e,0xef61182c,0xb6da8dd8
	.word	0xb9b9749a,0xe3349a70,0x8733a905,0x3a1fb7bf
	.word	0xea75582f,0x16c19309,0x20028bb9,0xe7df63b2
	.word	0x32637f60,0x42e6a452,0xc14c24f1,0x6f7d2416
	.word	0x85c864fd,0x85b0a482,0x2233d37f,0x9af95a67
	.word	0xcc0318f9,0x0b0239cb,0xe8c58fe2,0x588f829c
	.word	0x4f830c92,0xb535a9bf,0xef4f2786,0x32dc0913
	.word	0xd0b1a2bf,0xf3e077a5,0xee1ca765,0x793eb26d
	.word	0xecbffeaf,0xe88fe517,0xa156c0e9,0x7d660bf8
	.word	0xa18d2184,0xf07f0de3,0x8a8cb673,0xeaa5634c
	.word	0x786586f5,0xfcde7f37,0x4e2f243d,0x0fc5545e
p0_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local0_begin:
p1_local0_start:
	.word	0x544bdf45,0x73e57553,0x6b07f53d,0x48036d8f
	.word	0x7560328e,0xe0f65b43,0xf6cb064c,0x32261c87
	.word	0x9333f9e2,0xb83168e4,0xde20ea7e,0x4b8ce116
	.word	0xca1c3065,0xe4e4247b,0xd69ef787,0x7d970b52
	.word	0xffa25253,0x3ccb6fe3,0xd5ca436f,0x60d119aa
	.word	0x5b687f24,0x02e87eac,0x9f1425d8,0x1065edb5
	.word	0x63664166,0x3169095f,0xb8c8d859,0x25989854
	.word	0xeb941e0b,0x7098f96a,0x1b8cd9fd,0xda67cca0
	.word	0xca8b9d81,0x345e33e1,0x665abc56,0x5a6c55cf
	.word	0x162b93fa,0x49a224aa,0xe04226ae,0xb321164d
	.word	0x41ef8359,0xdc7145b9,0x8ceac181,0x9be803d1
	.word	0xda24497d,0x0b773d20,0x3bbe3ad7,0xd3fc940c
	.word	0x62b360c3,0x234923c9,0x8e0b15d9,0xd9ee7693
	.word	0xb68b6c13,0xbfc65be6,0x08b1f8bd,0x98e75817
	.word	0xe85120df,0x913403c8,0x43ae6dde,0xd810544d
	.word	0xd4e5b9f4,0xe750a697,0xc0153e6d,0x6388a1e4
	.word	0x00bd58f0,0xd8f30caa,0xb74a1fe6,0x8d95f2bd
	.word	0x26faa4db,0x3be9a81b,0xe04ff8b6,0xb06ecdae
	.word	0x17a72703,0x8c804956,0xf9b2d5b0,0x62b8de5d
	.word	0x536fcc71,0x8bf996b0,0x22726377,0xd358b82f
	.word	0x27a0eca2,0x249c0612,0xea201b58,0x0d855c81
	.word	0x648f6ef3,0xb7c70cec,0x859d85ef,0xcd9d955f
	.word	0x2573fab1,0x183ea354,0x728c70b8,0xb8eb68a7
	.word	0x85839886,0x58e7a348,0xaae363cc,0xd8405f05
	.word	0x736dc5d1,0xe9f4ecb6,0x04829727,0x29e9465d
	.word	0x7cda76d4,0xebe80bc3,0x07c27fc3,0xd5a6fc96
	.word	0xfe516877,0xd08e1bf7,0x81d630fc,0xca31da59
	.word	0x18f943b5,0x5838cedf,0x97e77bb9,0x6d3f5acf
	.word	0x33d3315c,0x03000ab4,0x320c241d,0x48f1469d
	.word	0x47f1e8fa,0xff13cc55,0xd2b3e703,0x2aa2efd2
	.word	0xa4e8e376,0x8649026b,0x17295807,0xeedc5f34
	.word	0x3ac9d386,0xab3cc41e,0x43271079,0xc4b4a6a9
	.word	0xd8bc957c,0xc73f720e,0x06c20b03,0x776713bf
	.word	0x076efa22,0xb2751c18,0x184ed0fa,0x5fcc1d1b
	.word	0xc27ffafb,0x54ccbf23,0xf31abac5,0xfebfb681
	.word	0xab2d5b2e,0x40dbb3ea,0x9e65ea8b,0x8cbd5168
p1_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local1_begin:
p1_local1_start:
	.word	0xfbba5f73,0xf81c6679,0x305d164e,0x8d8842a2
	.word	0x73166b37,0xdb4bffa6,0x171a0543,0xb9863556
	.word	0x439973e2,0x2204756c,0xf1e657a5,0x68602106
	.word	0xd093bad5,0x93d852ca,0xbb3e8513,0x666fb983
	.word	0xfa419f91,0x607b3b77,0x2595c773,0xa00b05e8
	.word	0xe5bacf70,0xc1c4f545,0xc3e83527,0x326119ee
	.word	0xd31bad5c,0x7c1f1872,0x3114e89b,0xd1fb468d
	.word	0x755eea1e,0x73174cde,0x7ef737cc,0x9713a7d7
	.word	0xf0d4381e,0x07cd0d1d,0xcd09abc7,0x330ae01c
	.word	0xf6b2dcb4,0x6c870c4c,0x06002f5d,0x4c3acce4
	.word	0xdec6f1f4,0x1c574d5b,0x7c782d30,0xc462c560
	.word	0x60693441,0x02793bdf,0xc41866a1,0x083b866a
	.word	0x4c018785,0x03fdccf1,0xe7fbacae,0x6edd3fc4
	.word	0xe194006e,0xb573be3e,0xb17de4aa,0xb1e7b565
	.word	0xe2a5fd59,0xc876dc4f,0x660d7b69,0x79788cd7
	.word	0x431b99ee,0x116c05f7,0x2be97cad,0x4e7f6a2f
	.word	0x05ea772a,0xfb73fbfe,0x5b09f42d,0x7136271a
	.word	0x4a3e0e53,0x9c73d4c7,0x1962985b,0x4fab821d
	.word	0x5990874c,0x6a8afdbe,0x91388abb,0x5d219940
	.word	0x66c757ac,0x7b5e37d9,0xcf920dda,0xad9a3ceb
	.word	0x7d51f328,0x2231cfdc,0x824d76ec,0x2ad4a4f1
	.word	0xf9459e2f,0x6149df7e,0xb5f243a4,0x36ee2f7e
	.word	0xa6467607,0xa5a85746,0xc390d992,0xcef1c54c
	.word	0xd94f607f,0x25226837,0x14b3c6ee,0x5434935d
	.word	0xf984f22b,0xaa09fb6c,0xc165038f,0x0124d538
	.word	0x1b3367b5,0x4571a648,0xff421011,0x4904e0ea
	.word	0x5da77a03,0x579a59ba,0x31143fd7,0x1e808f73
	.word	0xfc929d2d,0xf603ceaf,0x61df5c0c,0x264d3eb2
	.word	0xd3927625,0x561cbeb0,0x48898f5c,0xdf861d73
	.word	0xff0aa8be,0x0efa8a4b,0x339b5043,0xb64707c7
	.word	0x93278e66,0x8cfd3d5c,0x54021528,0x043b3cb4
	.word	0xd5c2573a,0x818f8851,0xa7e20c90,0xdb23215e
	.word	0x94c6434c,0x5ee16de8,0x1df80651,0x375c9382
	.word	0xdcf32cbd,0x63317f1e,0xac147a6c,0x2b8ebad6
	.word	0x38880f79,0x66e422f6,0xcb88b569,0x9f033c78
	.word	0xcc460770,0x313d5982,0x84171dea,0x23cdcd22
p1_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local2_begin:
p1_local2_start:
	.word	0xbd703842,0xdeae7eea,0xbe301196,0xbed44891
	.word	0x72cd1a1a,0x3b5b7023,0x05459d52,0x31af5da3
	.word	0xbbb8a12c,0x09ebbe55,0x0bacc5ef,0x65091a0a
	.word	0x65b6b16d,0xc533996f,0x4c53091e,0x720c33d2
	.word	0xa50ee9fc,0x9bf6a520,0x4fef92bb,0xa22363e7
	.word	0x6ec8a04d,0x4ad5bad2,0x02908595,0xda7e0dd7
	.word	0xa3823ed5,0x3ba15cf6,0x2523e4b6,0x6e1d7b6d
	.word	0x6eec1fbb,0x0caf5aa0,0xff47cfea,0xd09e3a5a
	.word	0x22150c90,0x0375b5ba,0x2592b5eb,0x27b526e0
	.word	0x2d7c050c,0x60a15b18,0xbfb57f47,0x96946343
	.word	0x4c5cf67d,0x0b34c740,0x93682179,0x2cde5317
	.word	0x0a3d83ca,0x78f2db6e,0xf1882d8a,0xd29ecdbb
	.word	0x81c0b3c3,0x44244e65,0x52dc35b7,0x64ac5427
	.word	0xcc1b9997,0x8ac49b45,0xd8d17150,0xd3f95fdb
	.word	0x1d1a8682,0xbd034160,0xce8924a9,0x87ffc3d0
	.word	0xf96f7b0f,0xd31ded48,0x05731fa7,0x0a654394
	.word	0xd98ca7b9,0x67407138,0xe553b23f,0xb131ce13
	.word	0x4a088240,0x08c1c815,0x70dc87e2,0x5a6eadfd
	.word	0xb581b50d,0xfa9eb8e0,0x7b37fa95,0x36b3370a
	.word	0x79844baf,0x6ea1307d,0xb2b05435,0xff21b6e0
	.word	0x09fa6b2b,0x934f9e7e,0x12ba0439,0xf1aeb320
	.word	0x5c1e9feb,0x1db64be9,0xd2762767,0x6175d771
	.word	0x93de5143,0x09d7df4a,0x1bb2c463,0x81bfef5c
	.word	0x075e7fa6,0xb0823d09,0xeb1df9cb,0xe32f9bea
	.word	0x360e2322,0x263f6940,0x17b974fb,0xfe96b574
	.word	0x8dc40697,0x59980cb3,0xe41a8843,0x6a3f5df2
	.word	0xa26cc956,0x3cac00df,0x80206391,0xef53042c
	.word	0xc2f0bbb6,0xc33381d3,0x937de4de,0xabcbc318
	.word	0x17db2647,0x661cd93c,0x22c3fab9,0x19be2848
	.word	0x8178d80e,0xf0fced0e,0x3b65ea7f,0xe612d8d9
	.word	0x5c15709d,0x3654e40f,0xef7d8cb4,0xd33d2ac5
	.word	0xc5c431f0,0x4988814c,0x7f78c2b7,0x34e5f810
	.word	0x9571b7c0,0x74378446,0xd061e9b1,0x91d495a4
	.word	0x3d8aaf63,0x600e4285,0xf043853d,0xbed12b97
	.word	0x98584815,0x9ea7d294,0x4e6f17c5,0x04b61515
	.word	0xdc1dcbee,0xe4b289f0,0x66f2cb82,0x3136904f
p1_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local3_begin:
p1_local3_start:
	.word	0xb321afbc,0x77805240,0x216cf49d,0x03a1ddc6
	.word	0x65e48e23,0x4cf7cf5e,0x0e58df55,0xcd740f38
	.word	0x3f83ed4f,0x5fc29d80,0x81f8af23,0xe3fbc38e
	.word	0x9b5431bf,0x6af41543,0x7bb8823e,0xf33d7634
	.word	0xefdb6e3f,0x1798be71,0x6ef6e19c,0xa2b95ec9
	.word	0x885b0b0c,0xd15fb121,0x4ccde0be,0xa9b0b634
	.word	0x71908522,0xe057ea31,0x921a40bb,0xd7db1079
	.word	0x6d596eda,0xa32cfe70,0xf4c9122f,0x06890894
	.word	0xac554bb8,0x95b97e8c,0xb30dc03c,0x65adfcd3
	.word	0x062b2d5c,0x8cc7d12b,0x9f69d88e,0x3d247e67
	.word	0x04a4e914,0x2c838356,0x8e7e6819,0xd2a7bb69
	.word	0x7075c90c,0x2f4d650c,0x097821dd,0x987036ea
	.word	0x262a05e5,0xc024f369,0xabb8632b,0x04107e2b
	.word	0x38a8c8b1,0xeeef9fa1,0x945a7195,0x413bf550
	.word	0x0ccef442,0x8d246079,0xcecfcab5,0x7f4b8eee
	.word	0x7300d39c,0x16e2dadd,0xe94535bb,0xd626cb6f
	.word	0xb52ee19e,0x683e3b63,0xb27a9c75,0xe46774d1
	.word	0x64d0db84,0x127e5786,0x0c8aa67b,0xd0c0f183
	.word	0x85b060bc,0x3a6fd6f8,0x6395c960,0xde5c6ed3
	.word	0x6055bf22,0xcdc08376,0x48ffdf37,0x9076dd1e
	.word	0x4f73449f,0x4442675f,0xcce7c68f,0x56aa273b
	.word	0x65ba8162,0x8003e52d,0x09eb1af7,0x7a77d8bb
	.word	0x5ca37a2d,0xcb10ffc4,0xfeeb7a5b,0xcc8a746a
	.word	0xb35efcc7,0xe080c83a,0x3e328ae6,0xdb8fb174
	.word	0x19d6889a,0x0bbaf0ba,0x241c8b23,0x8732b53d
	.word	0xe594e3d6,0xf3f5fc84,0xfc93715b,0x372a9340
	.word	0xa2419193,0x5ec40c56,0xcf41389c,0x0bdadd2b
	.word	0x271afb00,0x164a1802,0x4a03b39f,0xb623b94c
	.word	0x2716cbca,0x5bb164c3,0xf7684f5b,0x05dd5894
	.word	0x7ecb9e6b,0x5c341afe,0x1b217a37,0x1d07594f
	.word	0x5bd1fde3,0xa2053cb9,0x2c15bd25,0x0d976602
	.word	0x14f03e0b,0xfc68ae2c,0xa08e6f3c,0x13061ec3
	.word	0x4fed3abc,0xcdf59094,0xcb942add,0xeffd87fb
	.word	0x1dfa9fdb,0x47b64950,0x9b23635c,0x7cae9dae
	.word	0x31040f35,0xa2be78ef,0x5cac250e,0xd90c162f
	.word	0x9b51181b,0x50889c95,0x87e64e91,0xfacf0d20
p1_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local4_begin:
p1_local4_start:
	.word	0x39c3287f,0x8f801a54,0x352e92e8,0x46020c0c
	.word	0xe7d05380,0x347b227a,0x0fb4b2a9,0x7bf27d43
	.word	0x9791cc8e,0x552ee38b,0x83f5e3a1,0xe5e1ac38
	.word	0x52733393,0x20f05e36,0x25b2cb5e,0xb20c40b5
	.word	0x3eaad9c1,0x2941df98,0x2fc93732,0x265b2d1c
	.word	0x1ed0dc90,0x98886a0b,0xf253715f,0x555aa706
	.word	0x1659a00a,0x8fe62140,0x31ddc4ff,0xe164d4f8
	.word	0x7f5e439e,0x33c49dc1,0xce1e6569,0x8dd62ef9
	.word	0xfcd43f81,0x43e08373,0x90b4b8b7,0xd82a4926
	.word	0xa5387b26,0x62b9a040,0x9275f61f,0x975f3513
	.word	0x1f300eb8,0x314f5db6,0xf1b92c6c,0xd89a60ca
	.word	0xf01d475d,0x334d6466,0xd3f12582,0x6d894a50
	.word	0xae76a472,0xedb18cb7,0xb98f2753,0x581f3f10
	.word	0x7d74d00f,0x8787867e,0x5ae609f7,0x18f4ac78
	.word	0x073c8665,0xd83d2066,0x98021ffd,0x63186c7c
	.word	0x13dc209c,0xea551941,0xc4e04b62,0xece66b02
	.word	0x74bb3455,0x88306cbd,0xfe2da696,0xc7a75221
	.word	0xba8627fe,0x49b28354,0xffa7c4f1,0x66920a44
	.word	0x79fe7ffb,0x2fef12a7,0x32c22f1b,0x29d58772
	.word	0xdb200b06,0xff479375,0x10af5a65,0x9c162ddd
	.word	0x0736d770,0xf19610c2,0x9fd2e7c8,0x6396a6ec
	.word	0xe44f37c2,0x775bba1b,0xba540c2d,0x221c6cc9
	.word	0x858f7e49,0x571fec80,0x6756fdf4,0xcadcb11b
	.word	0xd75de686,0xb9d66bc3,0x1ec50fc8,0x3f3ae365
	.word	0x898954da,0x4f480640,0xc5ba5daa,0xeaa76828
	.word	0xc25079ed,0xf8a8c620,0x14680ae2,0x6dce5b62
	.word	0xec75b1fa,0x07135410,0xaeb66374,0x21f130c9
	.word	0x615e635d,0xa0a5e005,0x0e85a4ec,0xd56ad0de
	.word	0x26b25731,0xf2a03ca9,0x87d97e0b,0x851118e8
	.word	0x94ca13d5,0x8fd5a592,0xb1d24151,0xd271a9e4
	.word	0x9306ea36,0x08870e3b,0x7121c220,0x06b5be25
	.word	0x13990691,0x7d310303,0x29b8feb5,0xcf2f0de4
	.word	0x82621939,0x1116183a,0xbc94b86c,0xe3830097
	.word	0x4840d695,0xc406a280,0xc5a67bef,0xbeb222c2
	.word	0x9c6855d1,0xf09f75de,0xad8f4d15,0x39edda9c
	.word	0x2124464c,0x4da316ee,0xb646d795,0xb55ab80a
p1_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local5_begin:
p1_local5_start:
	.word	0xdbf460e0,0xecce6f62,0x408b8720,0x158bda23
	.word	0xa9bc9c92,0x9bfe9b2d,0x77ec4aa9,0x6cefd96f
	.word	0xf5695b46,0x5dfb2189,0xd7fa7ecf,0xfb707e44
	.word	0x59644b99,0x3d96745d,0xa2377868,0xb1a2f5d4
	.word	0x003852b0,0x19272993,0xfd38cb80,0x1a6fd7c5
	.word	0xdc84b8eb,0x92025256,0x30e29104,0x73d0c753
	.word	0x403202d0,0x19176391,0xa7104bcb,0x18ac1a7f
	.word	0x126659fc,0xb3b1a3f2,0x732d1c9e,0xe0edb80d
	.word	0x4f30dffd,0x3dde0dbe,0x4f2a3d37,0x1f6ed7f0
	.word	0x14fed917,0xf74d37d7,0x58ca4c4c,0x99996046
	.word	0x50ab8447,0x1521c2bb,0x11eb028c,0x90d0c0f7
	.word	0x870d47d6,0x0839a8cc,0x794d7091,0xe50929e3
	.word	0xdfbc437a,0x507ee06c,0x40dc4566,0x1eebc0f3
	.word	0xac621ce3,0xa9cdc038,0xc3893c95,0x5c278aeb
	.word	0x16932435,0xc5d2a1ef,0x2151eee0,0xc77a83e9
	.word	0x500343f1,0x32d59a4c,0x2add9b4f,0xb7371a50
	.word	0x59eae2f1,0xc1e920da,0x84c6019a,0xfe4e7674
	.word	0x4f34d298,0x0cfc7c8d,0xb2251e0b,0x96d570ea
	.word	0xcace2bff,0x196cf322,0x9df895e0,0xfe17a9b6
	.word	0x9db1d982,0x3befce13,0x0be59632,0x57b3b0fb
	.word	0x64fc5181,0xccbc145b,0xa15bf1a3,0x392e51f8
	.word	0x730c285c,0x9f1f7e09,0xa59e8a9e,0x4f48a089
	.word	0xa6c1b00d,0x36c4db7c,0xa3ef8457,0x3ef696df
	.word	0xecf0ac35,0x52ae7e0b,0x7d2e19f6,0x2ec1e3cb
	.word	0x6326065b,0xc0e8fc92,0xae2d6f55,0x69a99e1b
	.word	0xf2410ff0,0xfa0b389a,0xa682d578,0xf23a3cab
	.word	0x3e9a3d4e,0xe69adf12,0x7f674dfb,0xcac48b5f
	.word	0x96911be4,0x0d281638,0xa01ba5d0,0xdd836992
	.word	0x72067909,0x44b5ce4b,0x8d99916f,0x9bcaa110
	.word	0x89b9886a,0xfd9650ee,0x0281f0ad,0x1db992c7
	.word	0x28e7f6e2,0xfc4b9982,0xae76edcb,0xb0bd26cd
	.word	0xc4ad23ec,0x79f293ea,0x1b421b68,0xe86c5068
	.word	0x4634b782,0x3c160865,0x6b8705d9,0x41e49c17
	.word	0xcd864344,0x82697520,0xfb4af566,0xbcb17338
	.word	0x3b0351b4,0x8111fe38,0x2b55f744,0x6374d6fb
	.word	0x63fd10e6,0x6fc5d52e,0x13fb4cd8,0xb754f8ea
p1_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p1_local6_begin:
p1_local6_start:
	.word	0x8e8921a0,0xef367cd0,0xdfafdef9,0x59990a90
	.word	0x4cb056eb,0x81ee1946,0xcb80b9b8,0xa5e6d7f4
	.word	0x390758e8,0x105ac077,0xe74a3f58,0x089d5ec3
	.word	0xbba9048a,0x55ab7e40,0x40eb7c89,0x405f7744
	.word	0xaf620f5c,0xc1829a19,0xfbdf2355,0x1de71dfa
	.word	0xca0edb68,0xf22cfb58,0x7409576e,0x00fc1f9b
	.word	0x8aeccc43,0x3009176a,0x51776df7,0x0545235f
	.word	0xc8eb697a,0xb2a7a795,0x5a7b66c9,0x45e0adac
	.word	0x2528e7ae,0x5276645b,0xebba8a2f,0xae37f603
	.word	0x75762636,0xde2c58b8,0xa5fad508,0x3e83513b
	.word	0x57866285,0x9409a767,0x6a7823b2,0x36cb5cdf
	.word	0xd7ea8027,0x784b17ef,0x3d5b83cd,0xb871ce15
	.word	0xd0f45041,0x6ed09f5e,0xa90485a6,0x2b602708
	.word	0x08f12d9d,0xa9f900a1,0x142b95b3,0xdfeaf031
	.word	0xd52c93a1,0x1c452e96,0xbf204020,0x5e36537f
	.word	0xa1493929,0xf5d161f7,0x4c63a989,0x2f11a9f2
	.word	0xdec1a6dd,0xcd21b1dc,0x215fd892,0x7e7fb320
	.word	0x26d73be5,0x541e51f4,0x8cb7cb3d,0x299093f1
	.word	0x0f4b273f,0x741745b1,0xcfe34d3c,0xf42f1926
	.word	0xa1b0b6de,0xde092b9c,0x9695f809,0xcfbab1f3
	.word	0x6a184e7e,0x632845eb,0xde05f113,0xb01c29bf
	.word	0xb10e68ed,0x27bbd2b1,0xec4ba57a,0x8e83c0a9
	.word	0xbf4c2b6a,0xafe11338,0x90bb29ab,0x49c8d40c
	.word	0xc79627db,0x1cc86cb1,0x995f4436,0xa427f44b
	.word	0x4e652f73,0xfca438c5,0x0ce88462,0xa8214e9f
	.word	0x68523878,0x0e942e99,0x4bac87f3,0x19e0974b
	.word	0xdc98281d,0x72caf143,0xa342ea21,0xedee48f1
	.word	0xf931d377,0xa8781e41,0x870de107,0x275a2c82
	.word	0xc299c8a3,0x34cb6742,0x75ee194b,0x8f6c8894
	.word	0xa3ebc092,0xced134f6,0xba691e70,0xa2dd3b82
	.word	0x157d6e45,0xd663bf15,0x84b28135,0xf0dc21e3
	.word	0x2edee209,0x6476a0fa,0x0ddb8811,0x0102854c
	.word	0xb2ae751d,0x9d7fbf09,0xc8d5b92b,0x7ef92e66
	.word	0xecd63398,0xa5afa224,0x2566c6c9,0x3f3cb936
	.word	0xd4452253,0x02d2fe48,0x2d72c4a3,0x48934269
	.word	0x8a67b46c,0x59f61b84,0xe8c58f70,0x9a33eb3f
p1_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local0_begin:
p2_local0_start:
	.word	0xf503f203,0x8565a7f9,0xc5dd81ef,0x612c7852
	.word	0x02f5b81a,0x5d4a8326,0xb653e6eb,0x9a60ac97
	.word	0xe9fb28ae,0xc49bff17,0xa68ea273,0x191ed82f
	.word	0x055e3d7f,0x42df04ed,0x1d4e1745,0xc9b45404
	.word	0x2a99e207,0xb8b77797,0x5bdc2aaa,0x02566658
	.word	0x5e8cd5d2,0xc4607c6f,0x3f080ce7,0xf37d304e
	.word	0x4b9e9cd3,0x2881aed8,0xb9566bc0,0x455c7b23
	.word	0xf5652d91,0xa97a5930,0xc92fb26a,0xab0b563f
	.word	0x4d7c6d92,0xdf207008,0xabc504a0,0x593e20a2
	.word	0x28069580,0x8bbf8fb0,0x7b8145d8,0xdd01933d
	.word	0xfe5df803,0xb203f292,0x171f81bd,0x1fc95824
	.word	0xda37c7a6,0x79322b26,0x922ff209,0x2e2002c1
	.word	0xd29b449c,0x558696f9,0x8ad980eb,0x4a7469ee
	.word	0x46ea3d2c,0x8d24a9f2,0x3807aefc,0x83ee20d1
	.word	0x97a6e6a5,0xf2831804,0xe2f0c3f9,0xac0df7b1
	.word	0xd5b9bf7c,0xf9bb6e2f,0xdf53165d,0x8d919662
	.word	0xbab6d37a,0x952160b5,0x134038f6,0x0e0dca90
	.word	0xfafedac2,0xed96b247,0x47ce2b92,0xe70873be
	.word	0xbb1de25c,0x8e90d29a,0x8dcb9aaa,0xd21c6b14
	.word	0xccba7d03,0x3a10d52d,0x30d9fe73,0x272d17d9
	.word	0xf97a080a,0x9eb1bb53,0x1e9e1c71,0x3a1b9a42
	.word	0x24ef6cc7,0x24580e92,0xdb42c362,0x8ef33ff1
	.word	0xcd4e6673,0x5d494c13,0x5d4f71f6,0xe2ea5e84
	.word	0xb126e80a,0x863d6a99,0xc5c93ea0,0x26bdee2c
	.word	0x61162040,0x6c82aeaa,0x7a9702c3,0xa587c5c5
	.word	0xde2439b7,0xf214c4c4,0xd718a3e8,0xd34fd098
	.word	0xcf395b80,0x4e527958,0x6b4eb153,0xa4d8d8d0
	.word	0xf395d9ee,0x9cf9217b,0xdfb192fc,0x9138e239
	.word	0x2cb47c47,0x18574d0e,0x31cb8171,0x7e16b5f5
	.word	0xc16fc32b,0x06f5ed41,0x949063ce,0x2e61fa4e
	.word	0x7c078985,0x02579924,0x07515f44,0x34dd5015
	.word	0x5e8fb31e,0xe1f21061,0x6315e0f8,0x4cf457f6
	.word	0x6eab301d,0xe405e1e5,0x6f829149,0x9f76e579
	.word	0x8b42b151,0x446944df,0xac48c659,0xbb9dfcf9
	.word	0x9321f464,0x54b87a45,0xd2fc8124,0xac8ef610
	.word	0x3f7ca085,0xa7f492b5,0x1612bca3,0x16168e44
p2_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local1_begin:
p2_local1_start:
	.word	0x6923dadf,0x30a25f6a,0xff30e219,0xcafec578
	.word	0xa1653c58,0xe9e58218,0x1752e153,0x9fc451d4
	.word	0x527ac74d,0x0d9062b0,0xd3d7fe2d,0xcdd45b84
	.word	0x435ee656,0x390eb945,0x33703760,0xe5a2650e
	.word	0x3903bf40,0x7e091a2f,0xc317fa57,0x468dbe1e
	.word	0x7d0ec921,0xb6e51215,0xb6e3205c,0x8eda810c
	.word	0xc0b72982,0x5c7cbc3b,0x7277bfc1,0x6256ddda
	.word	0xb0d9d745,0x44dfafa7,0x078cfe3a,0xcaffd025
	.word	0xdcc5fb8e,0x94a47574,0xf913afdc,0x438f32f5
	.word	0x293ea888,0x1c0ca7d1,0x059d5bd4,0xc503568f
	.word	0x8b5b4e59,0xd708bc45,0x6252b48a,0x62aa07f2
	.word	0x2f7342be,0x71b74df4,0xf1475c0f,0x57767213
	.word	0xd85d4eae,0x0cdbaf62,0x0240b95a,0x11a41a27
	.word	0x9b4c90c2,0xdeea1a48,0x4a0f60d5,0x3da032ac
	.word	0x8faaaea1,0xcfe8b348,0xff04a1f0,0x8f49905a
	.word	0x4eb5f814,0xa93d3006,0x96d44f08,0x48388ba0
	.word	0xcca52682,0x843ff160,0x207261da,0xa30e1f7f
	.word	0xc3387e9f,0xa6806bf2,0xe0dd6dde,0x76b84622
	.word	0x8bcac8af,0x23a48c8b,0x0581e726,0xbd8379ed
	.word	0xd1587875,0xb2a64dfe,0x382c498e,0xc3e508d4
	.word	0xc86bc5a1,0xf2a2904c,0x5c3a925c,0xbdbd9578
	.word	0x10ac8c33,0x14605350,0x8c2b9529,0xe01f6732
	.word	0xe6eb447d,0x015ac2f8,0xa03ff4e3,0x3d2d9e7e
	.word	0xf372229a,0x68e65dd6,0xa2836f9a,0xcc3d9f78
	.word	0xab637efe,0x92c6b8b8,0xc8609430,0x358d9056
	.word	0x54dd19bb,0x873521b6,0xf29e1c38,0x9e6305be
	.word	0x18969c85,0x0eed1ad9,0xe78b51bc,0xd6793461
	.word	0xa57c63d3,0x32a6571e,0xed305381,0xa8085b2a
	.word	0x998f3d3b,0x8747035a,0xc507f232,0x19acb96f
	.word	0x5e8e9436,0x27b73193,0x98bb0e2d,0xfedae0a5
	.word	0xf4edca67,0x462e471c,0xa12049f6,0x5678857a
	.word	0x2fee5d15,0x8887a517,0x5d83f3cf,0x86d01616
	.word	0x30ef74dc,0x8806e4ca,0x208d0854,0x93398306
	.word	0xf3da9da0,0x347b2c20,0x9655be3c,0xeb8b5a26
	.word	0xaeca28da,0xc15d6128,0xe4542c19,0x5695caaf
	.word	0x903896ad,0x634a8c55,0x8b9876f8,0x6dbb08d2
p2_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local2_begin:
p2_local2_start:
	.word	0x3e4f5b03,0xeb10ecd6,0x7ca5e401,0xa3beee84
	.word	0x4f7db04b,0xb0f981a7,0x1313b648,0x7b1270ab
	.word	0xa9b9298a,0xb0c4ad13,0x4bb1dd65,0x06b579aa
	.word	0x53652ae7,0xb19e7430,0x58bd6c03,0x3cde91e1
	.word	0xa7572b58,0xc876b87c,0x0b5f357c,0x55f2a711
	.word	0xa4390cf7,0xafdfe7c0,0x969b5fc4,0xd7a757cf
	.word	0x38e74213,0xdad9462f,0x9dc71e70,0xa66af9d2
	.word	0x54b9b39b,0xb470c58e,0x720af289,0x01d100a4
	.word	0x8aa602e6,0xe3109f1b,0xb11d2ce1,0xb0e70b4a
	.word	0x262b5b85,0x6ac0bf58,0x174bfc55,0xa35cadb8
	.word	0xa5c7bc6a,0x698117c0,0x9717e1e1,0xba8ea3b2
	.word	0x1aa95735,0x1c10e05a,0x764f854f,0xb0307900
	.word	0xc801bb20,0x9133b517,0xdbc79447,0xc23272fa
	.word	0xace4094b,0x94b343b6,0x4468299a,0xde7b2269
	.word	0xbb1e7e76,0x9a5a74bf,0x26e37b1c,0x7dd71f94
	.word	0xd57d1191,0xee09a730,0x2ac423ae,0xd0042995
	.word	0x26b97a0b,0x7cc256cf,0x4e44490e,0xf77d887f
	.word	0xb267983d,0x54c0e4fa,0x6703a4a3,0x48252f7c
	.word	0x41b1232e,0xb87e91b2,0xbdab68ac,0x82f4799c
	.word	0xec31b935,0x8f5cce5d,0x698c49bc,0x61681d31
	.word	0x466db59e,0xdb0449f9,0x1761e56b,0x16962be6
	.word	0x7aa00b2d,0x668efcdf,0x9b3b1364,0x8d9b3acb
	.word	0xfb999896,0x60a5e19d,0xc0a4f943,0xa038dd7f
	.word	0x0a3ed4e5,0x163fa65c,0x1f44d18e,0xb9d52288
	.word	0xc1b085af,0xf9a493d9,0x7f66e37a,0xc5cceee2
	.word	0xe1c89cc0,0x789ef2f8,0x7275a23d,0x76d89f77
	.word	0x59157360,0xb189ccd6,0x7f68946d,0x7a151b3d
	.word	0x7e2e18b2,0x57fb4973,0x91d050c7,0xa6a0e8ad
	.word	0xcf9e547c,0x0151f930,0xfb6a4a66,0x32060b1e
	.word	0xb5381874,0xf3f1d4eb,0x16f5fe9a,0x096e6544
	.word	0x6678e9d6,0xc84d18fe,0xcf973870,0x03601b55
	.word	0xa2d19095,0x70fc9aa2,0x094bbba3,0x4641b473
	.word	0xe3a251c2,0x1a1424ba,0x2abe6d1f,0xaf1b729b
	.word	0x24c6da66,0x9f627898,0xc1b096d5,0xf9c36263
	.word	0x8e78a58a,0x6618636e,0x2ff29963,0x2083fa63
	.word	0x3de7c7a1,0x5592f1e2,0x382caf11,0xc4b87aae
p2_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local3_begin:
p2_local3_start:
	.word	0x9cd1e0d7,0x556ba9b6,0x0bb0a8b6,0xd1d7d224
	.word	0xa91bea2a,0xd3aabadb,0x5eff6c91,0x549a723f
	.word	0x90bdb77a,0x2d73498a,0x321f9fb9,0x699cc94c
	.word	0xb84ef927,0x985958aa,0x2aadd4fe,0xff272449
	.word	0x92f8d681,0x06e6b733,0x79801213,0xcf4341e1
	.word	0x988eb786,0x8b20eb02,0x49a9889b,0x798e26de
	.word	0xfad3c95f,0x6115b4bf,0xfcb95087,0xb092dfa6
	.word	0xbd606f7a,0x7a831f78,0x8a0ddf0e,0xadd8a54e
	.word	0x8cf77ec1,0x5b9cfb46,0x81e03d38,0xb998b492
	.word	0x84fc8b63,0x8d3d3ef5,0xbb502496,0xaee23754
	.word	0x6d969adb,0xe2da142d,0x0a2f031f,0x46c23210
	.word	0x4a55c264,0xa3658391,0x49610909,0x6b4d9661
	.word	0x17359f00,0x8dc4129f,0xe2d4804e,0x89a253d6
	.word	0x45fa55c6,0x602e626f,0x656e5e3e,0x2409cef2
	.word	0x05de3417,0xa403b61b,0x1817ff33,0x3edcb1cf
	.word	0x34018293,0x4da26889,0x57d410e0,0x4d726767
	.word	0x4a7d36f1,0xea195fb9,0xe8f3fc78,0x80a057d0
	.word	0x5412687b,0x7f76f2bb,0x6d7e06a3,0x04efc2b3
	.word	0x8c8f256e,0xd1eeae90,0x0bfcd43a,0x8319f0b9
	.word	0xafb20ee0,0xea85400a,0x53bea9ed,0xc0588e40
	.word	0x3c6a8cd8,0x9f98283e,0x8c4cb2e9,0x396513ef
	.word	0xbc26720e,0x98d6b0bd,0x6f483478,0xb45096cc
	.word	0x3480a23f,0xcc21cb28,0xdc083b3c,0x55794f86
	.word	0x94568c43,0xcb1803fc,0xcd206463,0xd758d92f
	.word	0x57f26636,0x3ac9898c,0x17c8ad1b,0x19255183
	.word	0xa443ba05,0x473279bc,0x5167cd91,0x71d964e4
	.word	0x807cdc85,0x83525de9,0x550f9e0d,0xd18bc7fe
	.word	0xb0ee7621,0x6d3de8a1,0xb854cd38,0x9635a5df
	.word	0xa354fe3d,0x831cf82e,0x47037d46,0xc346daa3
	.word	0xc6016892,0xd3c7acca,0xc5590c07,0x44f17174
	.word	0x372aeadb,0x96f8866f,0xf0349c2e,0xd0e87279
	.word	0x4cfa0a68,0x4c39acf3,0x72e9b9eb,0x8221920f
	.word	0x681102d0,0x43ea32a9,0xc6aa33e8,0x9ffaddee
	.word	0xf3a16c20,0x0e870ef1,0x2a057665,0x66346146
	.word	0x5e4e6b7f,0x2988a914,0x48d079f2,0x11f41c74
	.word	0x435c018f,0x9e83f7ad,0x42fdbc4a,0xd0a5a4f3
p2_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local4_begin:
p2_local4_start:
	.word	0x3938465e,0x19e68f42,0xa724b54e,0xcb5f6730
	.word	0xf31087a4,0x4797f105,0x5ce152a9,0x3787cc38
	.word	0x3d8ab097,0xedca2dec,0x8f5a0cd5,0x6cc24ab4
	.word	0x0c66a721,0x87cac5de,0x858a48fa,0x1e09adf5
	.word	0x9976682a,0x0d9d383c,0x9f9e6d9c,0x15e42a79
	.word	0xd0276127,0x4197c9ec,0xd3c21b18,0x2afff0b4
	.word	0x487773ec,0x5c3c7255,0xb2649a07,0x852f535e
	.word	0xe89033f1,0x2f5f7a94,0x1a945829,0x57e5c023
	.word	0x29090cc1,0x345c4a8c,0x2f97d16c,0x7b2f6bfe
	.word	0xd52239e4,0xbf342584,0xd687e54f,0x6f713a8b
	.word	0x96fb615a,0x462e3f5c,0x1b06bd2a,0x9a66dc49
	.word	0xd85e22f7,0x2c6087c6,0x1bcdc187,0xbe18c674
	.word	0x8d81fb28,0x2dd28d67,0x7d0294a5,0x848c8829
	.word	0x421c0b70,0x5c3f2445,0x5ebd31a6,0x0f0923da
	.word	0x9e1323b1,0xdbb07a21,0x02798050,0x749581f6
	.word	0x7b1834e8,0x88488428,0x61994305,0x7baab638
	.word	0xb80a6e7c,0x250a0643,0xd8b0efc5,0xdf137eab
	.word	0x077d5dd9,0x365fad54,0xd274c4a1,0xcef81380
	.word	0x3f9564c4,0x4b74714e,0x7dcf798c,0x26f8423c
	.word	0x1037f061,0x142cf024,0x5bf271a0,0xe644bd35
	.word	0xe2b73efc,0x25cc39bd,0x98db7ea4,0xb52c4a96
	.word	0x6bf30959,0x950846fd,0x72781b78,0x506edc2d
	.word	0x42983aa0,0xaa254330,0x7b568f41,0x9513fac1
	.word	0x48d44dd0,0x6cffdfc9,0x0720b441,0x5392bc0c
	.word	0xd51f81d6,0x8ceed85e,0xb4163f32,0x2c09a078
	.word	0x6fe9eafe,0x32a45da6,0x83e2d273,0x342e98d2
	.word	0x56cadd8f,0xe040c260,0x45dc2caf,0x10323873
	.word	0x0a010526,0xefa34090,0xe6b7213b,0x9e74d085
	.word	0x5d486347,0x3c4b052c,0x2fc42fd8,0x7b3569c5
	.word	0xcae60439,0x3994050d,0x7db9ae9e,0x07bcaa60
	.word	0x57f21342,0xc426c5de,0xf6071e81,0x9a9fa352
	.word	0x003a450e,0xd922d10f,0x90cb2a7f,0x80ab829a
	.word	0x63612643,0xbd7c1a09,0x8e761ce0,0x488b607a
	.word	0xded4d75d,0x2544e217,0x82c058e0,0xf40b6ff3
	.word	0xc3a5c531,0xf9705183,0xe99ee15e,0xb81e2f37
	.word	0x83fe18cd,0x3e490dcd,0x0139123f,0x561f86b1
p2_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local5_begin:
p2_local5_start:
	.word	0xa33a7877,0x5a67ea60,0x7c10684a,0xa3dfeee6
	.word	0xee3000b0,0xb17ae231,0x0a5c9c12,0xd65888bc
	.word	0x65567ff2,0xb075d6e7,0x9d546ccc,0xdcaaacdb
	.word	0x4869c83b,0x14695923,0x74b7dade,0x5deae461
	.word	0xcba1db44,0xe2849005,0x90d2abc6,0xd95da553
	.word	0xc8af43de,0x7b4bcd45,0x6ea54455,0x2e0def65
	.word	0x782f0c3c,0x7bdda43b,0xf41c0ae5,0x6fb366e3
	.word	0xd66c8f20,0x4d0e96fc,0xc68a2ac5,0x52b67c93
	.word	0x16fc7edf,0xb1f52d78,0xd286c963,0x739bb91c
	.word	0xb14e970f,0xc6c6d9f2,0x1b5aea02,0xc9f557cc
	.word	0x19125e04,0x0c53a7e8,0xd67851bd,0x5fae618a
	.word	0xf469f812,0x311dd49b,0x81106a24,0x66d36a41
	.word	0x31f43a87,0x73aeddc8,0x417605a5,0xa755ab0c
	.word	0x945cab25,0x0f29eab9,0xc475c776,0xa6755707
	.word	0x7724e2cd,0x6602f7e3,0x544d0c9a,0x90b14408
	.word	0x86cb0854,0x1f24dae4,0xac3f9ab3,0x2bad9bdb
	.word	0xbf998f5f,0xd59d6dc5,0xd66b1948,0x1fb91298
	.word	0x23f02ff0,0x713dc1f6,0xed279438,0x515afea0
	.word	0x288cdeec,0x256ad830,0x7db77932,0x5441e2d3
	.word	0x964ddc5d,0x8330e19f,0x73cf4c5d,0xe8b11daa
	.word	0xa0358ffe,0x7eb1c960,0x081a21e2,0x983da695
	.word	0xae59c4cb,0x835896b9,0x33b74c88,0xd0c51528
	.word	0xc6b9ed5d,0x38b3f45a,0xa941a0d2,0x5da10076
	.word	0x08b8a426,0xafd422bf,0xc82c5a0f,0x088ca780
	.word	0xc0bedaf9,0x5e282535,0xb58de959,0x737ec62e
	.word	0x4eceacd5,0x3b185ca7,0xa3dd8380,0x956cf671
	.word	0x2efcf6c9,0x201ad0ad,0x7882f639,0x22362c6a
	.word	0xcbc91038,0xaba8f663,0x1dbfc232,0x3bd34d56
	.word	0xe1908263,0x97984fc7,0x1b771ef5,0xb4548c41
	.word	0x74f9c01c,0xe00de7c7,0xc90a6ad9,0x25f4227b
	.word	0x75abcf03,0x3e5799bd,0xf3eb416c,0x95f6875c
	.word	0x05c38470,0x27ae470c,0xd657c8a2,0x4c922ace
	.word	0x29e4c85c,0x81473fad,0xf49e18b1,0x0a397ddd
	.word	0x13b40194,0xde482851,0x55440151,0x45951e54
	.word	0x14f5e36b,0x02d23d26,0x42e9850e,0x8999aad6
	.word	0x416d8b81,0x0fe9e732,0xdda0c3a3,0x6c12fbc2
p2_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p2_local6_begin:
p2_local6_start:
	.word	0xde2c784d,0x60fbfc23,0xd4a1330b,0x764b770c
	.word	0xe117b9ed,0xcc085045,0xa1005d0b,0x350e34e8
	.word	0xd2bcff08,0xbcbf350c,0x8084c8ec,0x549a5559
	.word	0x19065fe8,0x83cd03df,0xd41b3228,0x85785fb0
	.word	0xed47f5e3,0xfac4a7b8,0x301d7358,0xa990b3b7
	.word	0x74ac2f78,0x99f2698c,0x8514109c,0x6d144032
	.word	0xc524c81a,0xdc74be59,0xe3532107,0xcaa3bc23
	.word	0x94f77ad7,0x67354b39,0x799c940f,0xbeed67d5
	.word	0x3827681d,0xfa9d6062,0xbe73bf71,0x89511ffb
	.word	0xa26a7f75,0x42e73fad,0x0be32ffb,0x9ae2ccd5
	.word	0xdf1fecfe,0x72ee34bc,0x0f6e5260,0xabaf21b4
	.word	0x6e54e2c1,0x393b4937,0x36135157,0x2dc69d63
	.word	0xc1626d39,0xe98cf3aa,0xd6d0defe,0x20391bb4
	.word	0xf2e154ac,0x15bb6164,0x8e26d961,0x400d245d
	.word	0x13251ea8,0x7b9c41c4,0x62518958,0x5d5d9101
	.word	0x00c13825,0x6e8ed8ea,0xd5b62665,0x6c8a4592
	.word	0x517ec0b3,0x1f7a5149,0xcbc04902,0x52caa6c5
	.word	0xeaf7d5ff,0x19a10fb6,0x1246fec3,0x951995df
	.word	0xbb934bcd,0xc1ba1c75,0x439b7bbb,0x09667a3f
	.word	0xa132e08e,0xf46d95fe,0x721a07d7,0xbf15c1d2
	.word	0xdfac4d0c,0x05a6c75b,0x0799d5b9,0x3ccf015d
	.word	0xc55decaa,0x2d0aab39,0x961e2807,0xfc5c8d79
	.word	0x9bb8905c,0x8aee337b,0x62873784,0xbf28c3b9
	.word	0x8ca95ac4,0xb07a7d46,0x26bbe987,0xb9e31485
	.word	0x91cba074,0xb4b566a2,0xaab510a1,0x8eff60a6
	.word	0x4eb8a692,0x6631b6d8,0x548ede19,0x23dd63cf
	.word	0x8c20a100,0xfec2678d,0xfc0d78a4,0xd7d8b598
	.word	0xe333749d,0xabce20c3,0x49d150f7,0x7aeadeb8
	.word	0xe5ef9b29,0xb5c6ce58,0x234e9f19,0xc5ba4c35
	.word	0xaadc519f,0x1e7c1245,0x6ca06cdf,0x7802cc2d
	.word	0xedc0a1be,0x97a658c5,0xb89ecd21,0xc133d9cb
	.word	0x9cf9021b,0xd173f683,0x02e871b7,0x96cf439d
	.word	0xfe0485dd,0x9ec9735c,0xa378c1d8,0xf50c4f3d
	.word	0x107e7b2e,0x04902c80,0xaa8e95f3,0xcb3ab122
	.word	0xca3a378c,0x3ba3f048,0xe453f386,0xca2531d6
	.word	0x4f7c08a2,0xee7c3ea8,0x92b5abcc,0x55c8f865
p2_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local0_begin:
p3_local0_start:
	.word	0x89925175,0x9d70574a,0xc37e33b5,0xe37995fa
	.word	0xf68d268d,0x4210562c,0x6a226ef4,0x45144c4c
	.word	0xd5ce3bb4,0xa8e850d5,0x6c31e6ce,0xa7c2c635
	.word	0x74693f90,0xdab45b7c,0x61b5e874,0x3a5ae648
	.word	0xed6d7ab0,0xaa038b98,0xf8d0fb52,0x806f9739
	.word	0x694e6211,0xf8291b4b,0x6434b31e,0xa85efd98
	.word	0x832cc409,0x12666149,0x082f8dee,0xb9511342
	.word	0x1496b7b6,0xf13a1f46,0xc3147738,0x41accad4
	.word	0x92456920,0xc460058d,0x8fc46e9e,0x0dd8d8d1
	.word	0x1a670d2b,0xc1cfc395,0xe3230215,0x9b946b9d
	.word	0xc9c4ab9a,0x75779cf6,0x0d015704,0x5c82b607
	.word	0x6c7656f7,0x967dde05,0xc3ddeefb,0x80e73918
	.word	0xe4ec5825,0x9b843fee,0x974897ac,0x1e95db52
	.word	0xf6d1a9bd,0x926221c1,0x78d61014,0x3190bfb0
	.word	0x88945364,0xeef05518,0x751f845f,0x12005ca3
	.word	0x2ac2e64d,0x58522e46,0x4f9828a1,0x17682d24
	.word	0x8e484f03,0x60240fa9,0x61cb2873,0xfb9c6f47
	.word	0xa1feeaa3,0x2f9b4aa2,0x7ab47e47,0x78171fe6
	.word	0xc9b661d9,0x09861814,0xbf0f01be,0x838fcfcf
	.word	0x9617049f,0x4a503873,0x0d1275f3,0x5abeebe6
	.word	0xe23c050b,0x384e8ca6,0x085f080a,0x88ad8fce
	.word	0x371ccf16,0x83079565,0x2e07d582,0xfd232be8
	.word	0x06b90f2a,0x5e591375,0x02278c73,0x6afc1af3
	.word	0x812048da,0x2059afd2,0xc7bc5f5e,0xa503ed44
	.word	0xee7a5787,0x784fe107,0xb936deb8,0x40b5947f
	.word	0x0317cd25,0x2536ff8b,0x325c7a50,0x8faf8b64
	.word	0x4cd6c8b0,0x6d615c62,0x016a347d,0xde195276
	.word	0xe5d7081b,0x102d1505,0x67dcf0a1,0x8f6b81c3
	.word	0xbda2b4d4,0x3aa3259b,0x4cbdcd80,0x6a9131db
	.word	0xc50ea2df,0x938a74ee,0xb4cfeedb,0x27513329
	.word	0xe0eee9ab,0xfe8a8def,0x95344360,0xe5c2c9a0
	.word	0x8ad0422f,0x32558ff5,0xe0eae1ee,0xd3651499
	.word	0x590e76fb,0x1f3cdf38,0x159d96fa,0x5493969f
	.word	0x53532324,0x499b5a28,0x22d9cb74,0x533fe815
	.word	0xc53124b3,0x312dd5fc,0x9acda2dc,0x436c4502
	.word	0x0a54721b,0xd53435c3,0x2dce84f5,0x73bc3ff2
p3_local0_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local1_begin:
p3_local1_start:
	.word	0x647dd5e4,0xbcf63250,0x7af6480f,0x5ad1afca
	.word	0xb1c724d2,0xd3eb4b1d,0xb34ef50a,0x96b99fb9
	.word	0xd1eb1091,0x33fc2e3e,0xc7b5d74e,0x9a8fbe2c
	.word	0xf8a5b583,0xb46bcfae,0x0c8f3b5b,0x3abaa314
	.word	0x544443bc,0x08b1c423,0x47977150,0xc7317e59
	.word	0x748a8a46,0x9554e750,0x37750b1c,0x0f1b8906
	.word	0x72e764b1,0xe2f6bf7e,0xdee2bc02,0x4c68407d
	.word	0xc6eb2b8c,0x6e055d57,0xa884f433,0x4f4a4ec6
	.word	0x0ac86910,0x9b269f5a,0xbf2e6398,0x84dc2002
	.word	0xdfbed2a9,0x9d50f60f,0xd82cbc5b,0x38ddd4d2
	.word	0x87cec67a,0x32d3828d,0xf19fd45a,0xbcf07b42
	.word	0x475e4616,0x876540ee,0x9e31f345,0x1e73ee58
	.word	0x702a111f,0x1df77235,0x6fcb2e25,0xf6907615
	.word	0x158f8b0a,0xf7a74c73,0x5ec69d1b,0xbc91f572
	.word	0x6ee85e55,0x7101aa92,0x5ad8b5ca,0x88d852b6
	.word	0x61af39ae,0xd5383249,0xab5d953a,0xa608c348
	.word	0xfc6485d3,0x70922dd0,0x3ab081b5,0x3c413d46
	.word	0xd621974a,0x38212a64,0x82d3393e,0x938e691b
	.word	0x42b6c316,0xd443d222,0x263b24e2,0xfdd9f7e0
	.word	0x5ad52d5e,0x5d602384,0x499a788a,0xf9a9e851
	.word	0xae832a4a,0x9d39ba15,0x6dec1026,0xb5a8a17e
	.word	0x5f39b0f4,0x5539b6b6,0x6999483a,0x877acd25
	.word	0x7f66aa3f,0xcb12c091,0x9e83f601,0xa8281992
	.word	0x80875a1b,0xe2c4a297,0x946170c4,0x2c97d503
	.word	0xfc00db09,0xf69245ee,0xaa4887b4,0x7298f280
	.word	0x9c44616f,0x6fa2737b,0x5c4ac988,0x917cf6da
	.word	0x690f6bc8,0xd79ec369,0x2076a39c,0x18ce2d88
	.word	0x9daedaf2,0xab9369dd,0x7f689b07,0x95f77ac5
	.word	0x0ff2fa78,0xe90e0940,0xeee3033f,0xa75897f5
	.word	0xf1085a17,0x29819818,0x9c3aea30,0x2fbea3c7
	.word	0x4e8aaa7d,0xc7b5cca2,0x82ab2e0c,0x00dbb1b1
	.word	0xeea5f72a,0xa7ac6415,0xf4224b0e,0x40f60802
	.word	0xd0c431e9,0x384ee0c3,0x208a2dc0,0xb7536f8c
	.word	0x34929fc2,0xac99991b,0xb75f6c1f,0x87eb3cb7
	.word	0x0b5229ee,0xed8d068c,0x2e5db8c6,0x4ce29148
	.word	0x7542a2d9,0x64ae61c9,0x9b821754,0xbcdb9dff
p3_local1_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local2_begin:
p3_local2_start:
	.word	0xc19f56ad,0x697d08d3,0x2187cd03,0xa9e3793b
	.word	0xace63958,0x6ee04b9a,0xfca31666,0x1d60fde2
	.word	0x68c4deb2,0x5b60243e,0x86142e0f,0xc863c13d
	.word	0xa082e7de,0x52f7472c,0x25db12cc,0xb414c673
	.word	0x0bc73431,0xcfa46e45,0x7da6c24f,0x58b7fc2e
	.word	0x2526bc35,0xca04be11,0xeb9150ab,0x51313b7f
	.word	0x049692b7,0x74941adc,0xc2c9a78d,0xc7464681
	.word	0x0363086b,0x4c711857,0x6f0f415b,0x85526090
	.word	0xad11bc72,0xd417d4c0,0xccd9d356,0x861c3049
	.word	0x5d1312f8,0x3df67667,0x9ce5b1cd,0x6f33d9a0
	.word	0x58d48484,0x9dcd222c,0x14093715,0x7640ea3c
	.word	0x4934ee5a,0xf53c34f7,0x46d9099e,0x1789d402
	.word	0x8614bf1d,0x6906afb2,0x982463d1,0xd8aba25f
	.word	0x69157756,0xe790ac6c,0xc57008cc,0xce2e8748
	.word	0x813c3ee9,0xdb7fd2e1,0x5aa68401,0xbe1747ff
	.word	0x230706f1,0x9109beb1,0x95d3829e,0x0b819860
	.word	0xee05a315,0xc762e76f,0xa8918f6d,0x1fded6b0
	.word	0xffe8a8b4,0x617c6587,0x9f2ade2a,0x35e77fb1
	.word	0x63d28fc4,0xf4b9ab72,0x6684d210,0x97631181
	.word	0x4e88fca9,0xf93fb350,0x24a6a9a5,0x4a4ea6a3
	.word	0x6aba4242,0x109841a1,0x99131a40,0x309580d3
	.word	0x76acb1ef,0xc7b471d4,0xcf4fceea,0x5764080c
	.word	0x34a68e58,0xea4f9b13,0x45d80e71,0x5493fc09
	.word	0xe7103786,0xcea8bf21,0x8d714bca,0x41d1df46
	.word	0x7c4b5bf6,0x835f34dc,0x20098839,0xbdcdfdca
	.word	0x04a4368a,0x60093fe1,0xb21779c4,0xe1ea7102
	.word	0x37ea410d,0xbcc2cbe4,0x62a075aa,0x03066858
	.word	0x8feae567,0x1722ba1c,0xd984c4be,0x75922ddd
	.word	0x39c63a2a,0x3e00648b,0xd6e00cca,0x2e6498ac
	.word	0x54071374,0x36382c29,0x596fc19b,0xd77c6975
	.word	0xe7087101,0x7f2f4406,0xfbc2c967,0x5538125d
	.word	0x264ceef8,0x8461cd3f,0x41b7b11c,0x9d09f94a
	.word	0xe0693e06,0xaf880341,0xb04d7d25,0x9fdfef8a
	.word	0x76d68882,0x7946e95d,0x05eb26f5,0x30df2414
	.word	0x630c4da8,0x09af1fcd,0x8f20ae0f,0xa4b05c10
	.word	0x6d6dd861,0xaaad7896,0x49689855,0x616454d2
p3_local2_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local3_begin:
p3_local3_start:
	.word	0xd4eae157,0x300d4a89,0x9f54be6b,0xfd8618d5
	.word	0x0443e3a3,0xcdfc0ab8,0x0103418a,0xef367d87
	.word	0x79fafba8,0x7092e917,0x202fc52c,0xd610755e
	.word	0x9ec489ae,0xf4403e7a,0x335c58fa,0x31622110
	.word	0x6452155a,0x903062b2,0x4b7b634f,0x9f2b8304
	.word	0x9d048646,0xa6436490,0xc22dc70b,0xea13fa7c
	.word	0x0893fd65,0x2bb95de2,0x24c98188,0xaba2bfd5
	.word	0x8497979e,0x70422c00,0x1a260573,0x44a91c6a
	.word	0x87f51489,0x4c172432,0xfadf5f04,0x9b8c73aa
	.word	0x9b30d454,0x1059153b,0x3fdbe012,0xbdea7cf2
	.word	0x9f3982ab,0x420bd448,0x7099ae95,0xaaf50f69
	.word	0xed87da2c,0x7aceb04b,0x98bd1219,0x2ce3a60d
	.word	0x548c7792,0xb68bf45b,0x63356cd7,0x81192341
	.word	0xd9476740,0xc7c48a2a,0x0ffb2354,0x83e0968a
	.word	0x0fc8a6d0,0xf51f6f12,0xf218c2d0,0x7792ff18
	.word	0x9fe1bf44,0x417131fd,0x0396aa19,0x1869e300
	.word	0xd78793ea,0xced6e202,0xc7e14860,0x1be98b8c
	.word	0xd0f837a0,0xc4bc0eb4,0x018e77b2,0xd32d35f4
	.word	0x95589931,0x2c92b088,0x20f6d9a2,0xcd47725f
	.word	0xba404225,0x4b89c244,0xef3569e6,0xe6d9a68a
	.word	0x052c14bf,0x13fd2cd2,0x6965fcaf,0xeebf6ea1
	.word	0x43b850b5,0xd27bce45,0x97339633,0xb0b4c12b
	.word	0x83305260,0xb5585627,0xca1d7734,0x5d9337aa
	.word	0xdc76c1e2,0x5830ab58,0x9d0b0c33,0x53ba65d9
	.word	0xbbd6f64e,0x45902f32,0xdfa88f8b,0x7381368d
	.word	0x4e5df9a8,0xd8d29ce8,0x0f834f6c,0xe139c301
	.word	0x1deddaa7,0x6113c94f,0x5430bb0e,0xb1c967b5
	.word	0x2193fee8,0xb2ff85b8,0xe46610af,0x3c9c0bad
	.word	0xe475ff3e,0x75ec989a,0x641575b3,0xce4ebaa9
	.word	0xb82c50da,0xbd2aed58,0x829273c5,0x16258cd3
	.word	0x07e7afa1,0xca7034e8,0x37913a1c,0x0cd8721f
	.word	0xb4cdf0ea,0x69cd941f,0x1b1f80a9,0x57a53d96
	.word	0x0b840118,0xb9312901,0x8b6f0fe2,0xbae570e4
	.word	0x56680b30,0xc81aa3c6,0xd5b2c896,0xe5d05649
	.word	0x5c05e1da,0x4fcd7f8d,0xe68c300c,0x34834371
	.word	0x88fc02f7,0x6fae6f82,0x5c229b5d,0x4b820c67
p3_local3_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local4_begin:
p3_local4_start:
	.word	0x5ccf996c,0x4e453ef0,0x67e54638,0xde3a8f1c
	.word	0x0600548c,0xcb0a6b59,0x19da01cd,0x9853b59e
	.word	0x7bc1cbcf,0xd596105d,0x41f9d763,0x9a3cb16f
	.word	0xb8df5993,0x4fe07f66,0xb727617a,0x7f507064
	.word	0x8507838c,0xd1fd2427,0x8b23b1cf,0x4efc7758
	.word	0xee219537,0x345e6c6c,0x8e0ef25e,0x9370c512
	.word	0xf9453e90,0xb06b2718,0xa08c492b,0xb86f8740
	.word	0xfac33015,0x9e0ed7fb,0xe782b4e2,0xb4514f16
	.word	0x4e141a15,0x4b2fb1b4,0xb407e800,0x2e35203f
	.word	0x187e84bd,0x3fb9c07b,0x92c09516,0x3228f388
	.word	0x10e26e9c,0x1db52ada,0x74f2fbe7,0x68a78266
	.word	0x30981341,0x946b29ac,0x0cf80be1,0x999d8e72
	.word	0x87185480,0x3df1601a,0xca3c1192,0x11fbb2b8
	.word	0xd4f8b4a5,0x64aa974b,0x3ef94f41,0xa822b841
	.word	0x334377d4,0x06582345,0x08a64396,0x531d1f38
	.word	0xbf9c534c,0x3315e21a,0xb9920947,0x8e805104
	.word	0x4cfc8df3,0x18824a67,0x922e70d8,0xd9f22576
	.word	0x1caf3e73,0x9df913f8,0x35209995,0xb90e4f31
	.word	0x10b95175,0x87b8f5c6,0x3e090081,0xf2ae6ae2
	.word	0x465b0883,0x4c88a71c,0x46a621ca,0xc3ad2091
	.word	0xb219797f,0x12594f43,0x3c516638,0xe1f60695
	.word	0x26bf3bfb,0xa680493f,0x5121be28,0x7c59cf3a
	.word	0xd555c9a7,0xb6f47ca9,0xdbb5989f,0x54422616
	.word	0xe0cc49c8,0x229382ec,0xb4374bd3,0x27df3c10
	.word	0x72c48d15,0x862d3d0a,0x98c26b6d,0x013e7b98
	.word	0xf526c7ae,0xd63dc5f8,0xcd48b4c8,0x7e751153
	.word	0x8e3d0173,0xe0490077,0x8ac603e8,0x398528d4
	.word	0xcb4eeda0,0x19f5b143,0x150dfc9d,0x5b1bf7c6
	.word	0xab560686,0x5fadb8e0,0xc737b850,0xb33a523b
	.word	0xd3b148d0,0x53872d34,0xfd960f87,0x1bfc2c27
	.word	0x606ef584,0x3accb0ad,0xedd8050d,0xd2237bbd
	.word	0x6c69a782,0xea393561,0x07c10633,0xb985bb92
	.word	0x9ada68c8,0xe2afd4b2,0xf1380d73,0x4ac1918f
	.word	0xd063fed8,0xc16500c8,0x1af38c0f,0x58f4becd
	.word	0x97655d68,0xd3ca1173,0x57d95cb8,0x87161c81
	.word	0x93bc528c,0x9e58afbb,0xd9579237,0x266dc3df
p3_local4_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local5_begin:
p3_local5_start:
	.word	0x062f9737,0xdbdef00d,0xe783b9cc,0x39e63626
	.word	0x5049303c,0x42e85f95,0xf29d31a3,0x1dc666de
	.word	0xfd5af3db,0xcd74b994,0x653c680c,0x29a1edd6
	.word	0xd8e740b1,0x47839aae,0x187e54de,0x70ad45fd
	.word	0xb3110cb3,0xd99507fd,0xf72f9413,0x8ec38a3c
	.word	0xb5ce315f,0xc1e5e5d3,0x1705618d,0xf8ba2529
	.word	0xaec650dc,0x63cf7f71,0x21ec818e,0xf7d22ed7
	.word	0x897c95fe,0x1f6101e3,0x81cbbdc5,0xa42d8ad2
	.word	0xad280c8b,0xdfab52d8,0xa3e7cc53,0x4b58cdce
	.word	0x6e90d3e5,0x227aeaf4,0x45682ef2,0xa09c9bbc
	.word	0xe6719c1b,0x55f01c36,0xb6c1ef55,0xc3bfcdc9
	.word	0x6236d432,0x7f430710,0x0d3207ee,0xb19e0cb1
	.word	0x92651071,0x4a3d7118,0x8cfc62be,0xcf52b7f7
	.word	0x2e6016a7,0xabe6e2b6,0xe09ab0ca,0xb67217a7
	.word	0x3d21dda0,0x5469378f,0x2145e1eb,0x70f8c068
	.word	0x2b95a1e6,0xe32ba535,0x1209fd1a,0xfa70a70d
	.word	0xdf58aed0,0x28306171,0x3b9f324b,0x51416831
	.word	0x938c3954,0xf025b0ab,0xaffbefda,0x2a578a84
	.word	0x00139450,0xfc3a024f,0xd02996ec,0x2cd760f8
	.word	0x6e6b8f30,0xbba2d2c6,0x68df5c34,0x0cdc7577
	.word	0x29688659,0x7a5a9b12,0x00227670,0xf9a6a837
	.word	0x0e256b0c,0x1970b083,0xdcc66535,0x4cb4a801
	.word	0x982ee63b,0x6da92d60,0xf4372c68,0x42c2f8da
	.word	0xea2df6a7,0x0228cf04,0x77f3deb4,0x896f68e0
	.word	0xe3106503,0x884a7953,0x820f36b6,0xb178a038
	.word	0xebd29a6d,0xb124efc9,0x5a084863,0x03e75868
	.word	0x17e029fa,0x7a2527e6,0x02027382,0x1ae918bc
	.word	0xaac0d8e0,0x81edc444,0x364dbc1b,0xef456cc3
	.word	0x3b05a297,0xb8f601d1,0x1a4b2e80,0x12ef3ff0
	.word	0xd10fb326,0xdd584251,0x3932c903,0x573caaa8
	.word	0xa4beec82,0x9260b8e0,0x9ea01b8e,0x9377f3ed
	.word	0x99caf85c,0x4272fa23,0x16c8f296,0xd10dfb15
	.word	0xf06b912a,0x8faececa,0x9d9b3328,0xb96c8660
	.word	0x653ecf0e,0xaad8c30f,0x326e54ba,0x2d124b67
	.word	0xe8bed117,0x1cef2796,0x6f0563de,0xc068efff
	.word	0x7d935e3a,0x940eb4f5,0xfdeaddfd,0x587f9632
p3_local5_end:
	.seg	"data"
	ALIGN_PAGE_8K
p3_local6_begin:
p3_local6_start:
	.word	0xf4e1665c,0x43c68b1b,0x56fafcd1,0x8b9d150b
	.word	0x5a6c1344,0x55e89ac0,0xe2ccc095,0x08aaa524
	.word	0xddd43816,0x1a105a3c,0x8b4f5ba1,0xa9dc57b3
	.word	0x7239a87c,0x6fa05bd5,0x437c25bd,0xcfade360
	.word	0x13ad84f2,0x2122f076,0xc34e34c6,0x9ab7a5ba
	.word	0x7d03241d,0x895cff51,0x91402bc3,0xcb0c03cb
	.word	0x96775a5a,0xeef9a23e,0x2cb02091,0x03dbd77a
	.word	0x88212487,0x3173e6e0,0x01931bda,0x912a851e
	.word	0x7ac69b7b,0xdb8850ef,0xd8a57796,0xcdfd90cb
	.word	0xd0088084,0x3c1de966,0xca60c6d1,0x17fc1b60
	.word	0x801521d9,0x6ac11388,0xd3b0e0af,0x9f99ce78
	.word	0x332cfef1,0x628e8b3b,0xccbba3b8,0x8a403db8
	.word	0x614863ee,0xae7f89d4,0xbf273191,0x3e84edb7
	.word	0x03130e1b,0xfe95d7bc,0x905ab00f,0x1f7ddd38
	.word	0x1d9588db,0xfc8d9553,0x49c581e2,0x62753f82
	.word	0xc86d7a43,0x61ef13a0,0x10979317,0x5c93572e
	.word	0x23093300,0xf9477b09,0xadee7181,0x814cfca7
	.word	0xba5ea95e,0xa7283be8,0xa5273721,0x96ea9676
	.word	0x767c9361,0xe182c1a7,0x2a284fb4,0x143c7cd8
	.word	0x4d9c8067,0x6b18bdf2,0xdf8e5750,0x4efab903
	.word	0x943e3202,0x96bb0163,0x4710b18c,0x56ffc51f
	.word	0x38fe13ce,0x8f73f039,0xf2eaac29,0x9ba247ac
	.word	0x3a1faa79,0xc9987a6e,0xd075239d,0xd9ddeea5
	.word	0x70702b7e,0xd9d09d22,0x7047a998,0x6ff5a060
	.word	0xfe03de51,0x4cfbbc1e,0x0feecc8d,0xee741468
	.word	0x342d2b25,0x34d7434b,0x7a5fb551,0x078667f9
	.word	0xd717fdcb,0x08c47ed7,0x33f5fa2e,0x4f90cc0c
	.word	0xab20dc74,0x7b4cfa7b,0x0237e193,0xb6b5d066
	.word	0xe3d7aa9e,0x26e6e4a1,0x4c3d4de2,0x6ae04268
	.word	0x615c1c0b,0xe3ecf116,0xc2e013cb,0x0d7d3ca6
	.word	0xcdb07f76,0xe8c2dc5e,0xcd550c9a,0x21df0551
	.word	0xd335ebb8,0x69d6c5fa,0x333a1128,0xe88d3f8f
	.word	0x33dd6186,0x6ffb1dc5,0xeff490f6,0xdb36c08f
	.word	0x7aa51faf,0x5e4e9ec2,0xd3fe24bb,0xa69b288c
	.word	0xef2126a3,0xa41a0ac2,0x1b9b1f7a,0x72c3744c
	.word	0x1eac921d,0x7ae2e5a6,0x78b3f996,0xd8f4c642
p3_local6_end:
	.seg	"data"
	ALIGN_PAGE_8K
share0_begin:
share0_start:
	.word	0x72accfc5,0xa2e315b2,0x7072eb5a,0x1313872f
	.word	0x8a14c5ae,0xb8920682,0xd3fd4354,0xb04623af
	.word	0xcef4eba7,0x4b4926af,0x35bef577,0x66ca6d10
	.word	0xf3b5cf0c,0x8664a71a,0x25c1078b,0x514084bb
	.word	0xd22e4bf9,0xcad5e2d8,0xf62556a8,0x12e56ada
	.word	0x8e1e150c,0xe06cc8cf,0x2582bfc5,0xead8cdab
	.word	0xbb9a418b,0xad4f8aee,0x89ee30da,0xa0c0bef1
	.word	0x110b0488,0x5e3fbbdb,0xc2914f14,0x78f433a5
	.word	0xf2233cf5,0x38d9756b,0xf81ee26e,0x0aee77cf
	.word	0x31b2dc99,0xbd7b4ea6,0x9d41311a,0x96f47587
	.word	0xa9b21315,0x8f98661f,0xaf11dc0b,0x1a5ccba3
	.word	0xc9ea8bed,0x7272e7a3,0xbee60ee2,0xb641b9bf
share0_end:
	.seg	"data"
	ALIGN_PAGE_8K
share1_begin:
share1_start:
	.word	0x55cda803,0x56ef1aa1,0x08e615a5,0x7881b801
	.word	0x7daa35b8,0x42c526d2,0x08685f2e,0x621e21aa
	.word	0x3909d397,0xa5c486fb,0x0655b056,0x0a925557
	.word	0xdb610d77,0x5f3f9652,0xb83e0288,0x0058c159
	.word	0x2d4a93d5,0xe94bec17,0xc035e4b6,0x7124f48b
	.word	0xf96e8ca9,0x6f3c014b,0x4a1b44ba,0xa303e431
	.word	0xd3cf4e8d,0xc2f78862,0x4b49a3d9,0xe36f3aa2
	.word	0x13e8880c,0xdf99dc3c,0x50d429cc,0xb67b6d01
	.word	0x2f5e954d,0x270ba7e2,0x92782126,0x1963cab8
	.word	0xae358703,0xbdc135b4,0xd7d6bc71,0x98d5bb9b
	.word	0x8c86d0a4,0x1e76b335,0x4b8d1d86,0x6f383bf8
	.word	0xd33bc5e3,0xa27bf756,0x63287b41,0x64ec655d
share1_end:
	.seg	"data"
	ALIGN_PAGE_8K
share2_begin:
share2_start:
	.word	0x73277b10,0x8d4103db,0x97891d71,0xbc7f6a74
	.word	0x1f3d7664,0x9dda1af3,0x5bdd4955,0x78eb39b0
	.word	0x2c9bf871,0x2a122426,0x6a764cec,0x63e2f35c
	.word	0xe072451c,0x47d7eace,0x69891a8e,0x25578689
	.word	0x860adba7,0xdf653564,0xb4ef4beb,0xe8b7ee34
	.word	0x4c227bd7,0x6150e66d,0x1c04d06b,0x702637af
	.word	0x1377a110,0x6de4fca8,0x3eff193d,0x5c268775
	.word	0xd5bb165c,0x74ffd6c2,0x960be272,0xac7e6aa8
	.word	0xee830f20,0x3db249aa,0x54457971,0x606d6ee6
	.word	0xbc268a61,0xd46f4453,0x655a6175,0xb12fdd19
	.word	0x34849369,0x54f12c29,0x591f9168,0x988dd202
	.word	0xe513af3d,0x48a07910,0x4b1b040d,0x409c106d
share2_end:
	.seg	"data"
	ALIGN_PAGE_8K
share3_begin:
share3_start:
	.word	0xc6855110,0x09bb6033,0x8ec04124,0x4765140a
	.word	0xd5eff6ae,0x6da6eba8,0x793e9015,0xf925b7d6
	.word	0x1be3c36c,0xd5a48de1,0xccc12a82,0xb09fad63
	.word	0x120f683a,0xa2347a89,0xea279990,0xf430e0e7
	.word	0xf2ad039e,0xf3d9cedb,0x3bf53b21,0x224b8aff
	.word	0xa8b2081d,0x7468b768,0xbc6c82bf,0x5b20d8f7
	.word	0xca85b69d,0x37336455,0x078fdb4f,0xbcee6bbf
	.word	0xbfe3f5bd,0x155ad737,0x7ba5fd7a,0x3c5b386e
	.word	0xcae3b94d,0xe2593534,0x044e4c99,0x21dc9f93
	.word	0xdc515c14,0x7e5a8c4e,0x0017aed5,0x225b36e3
	.word	0x5b61d976,0xf387298d,0xf9b365ae,0x39fd72a9
	.word	0xcd3c4547,0x95b8304a,0x8c30e5e7,0xab5b79a2
share3_end:
	.seg	"data"
	ALIGN_PAGE_8K
common_begin:
common_start:
	.word	0x2a3c1218,0x020b0b3c,0x1d07382f,0x191c3308
	.word	0x2b1c2522,0x3533383e,0x1e37250f,0x111c240d
	.word	0x180a1a2d,0x2131140d,0x190b0f3a,0x24311807
	.word	0x0b092e14,0x2a2b0904,0x3914353c,0x1e0f0f08
	.word	0x8d323a6e,0x669bccd3,0xc62c5091,0x708d54a3
	.word	0x45ad8a2d,0xfbda99af,0xa4c2ae18,0x31319560
	.word	0x358c60bf,0xc2947ded,0x5df8b4dc,0xa7700679
	.word	0xb90f8c91,0x08da3e57,0xca44f77b,0x08b5630d
common_end:
	.seg	"data"
	ALIGN_PAGE_8K
unres0_begin:
unres0_start:
	.word	0xa19e01fc,0x8c995a0d,0xe83b01bf,0x5e0357b7
	.word	0xc5e7c3c5,0x3a10c403,0xefcb548a,0xcab2b442
	.word	0x0d6df8b2,0x6a4ec5f4,0x91eefd1b,0xd7059b63
	.word	0x4a9fa039,0xb105dabe,0xfe3e661a,0xa263dc09
	.word	0xba91c68a,0xc2a2c541,0x60739feb,0xc1c67d6b
	.word	0xb23d4e8d,0x2dda7a06,0x670cfb3e,0x213ac54e
	.word	0xbe38db17,0xddc4e6bc,0x6a5f407e,0x79d4a921
	.word	0xbe58e266,0x2e44b2cd,0x57fa9546,0x6cb174b6
	.word	0x7033e471,0xc1eec1b2,0xcc8915c6,0x682e9968
	.word	0x1fc36566,0x7edd4855,0x01aeaf2a,0x2d23e0cd
	.word	0xdab98882,0xa645dd77,0xdea67992,0x0992ef61
	.word	0x4c53e634,0xccc29cbb,0x376ae853,0x7cfa313a
unres0_end:

