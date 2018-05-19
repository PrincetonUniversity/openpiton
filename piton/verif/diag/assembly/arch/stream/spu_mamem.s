// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: spu_mamem.s
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
!! File:	spu_mamem.s
!! Description:
!! -----------
!!
!!
!! This diag includes tests for load/store between main memory and 
!! Modular Memory 
!!
!! $Change$

#define MAIN_PAGE_HV_ALSO
#include "spu_diag.h"
#include "boot.s"

	.text
	.global main
main:
	nop
        ta      T_CHANGE_HPRIV
        nop

	wr	%g0, SPU_ASI, %asi  ! set up the asi register to contain SPU asi

! First test when the main memory address is L2$ line aligned

Case_0_0:
! set the PA of DATA_SRC to %l5 using %l0 and %l1 as temp regs
	setpa	(DATA_SRC, %l0, %l1, %l5)  
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi
	ldxa	[%g0+REG_MPA_ADDR] %asi, %l7
	cmp	%l5, %l7
	bne,pn	%xcc, diag_fail
	nop
! set the PA of DATA_DEST to %l6 using %l0 and %l1 as temp regs
	setpa	(DATA_DEST, %l0, %l1, %l6)  
	stxa	%g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set 0 to the REG_MA_ADDR for MAMEM offset

	add	%g0, 1, %i3  ! %i3 contains number of xwords to load/store
 next_size:
	sub	%i3, 1,  %i0	! #of xwords to load to MAMEM minus 1
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load %i0 + 1 xwords to MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	stxa	%l6, [%g0+REG_MPA_ADDR] %asi ! set DATA_DEST to MPA
	or	%i0, 0x40, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out %i0 + 1 xwords of MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	set	DATA_SRC, %i0 
	set	DATA_DEST, %i1
	add	%g0, %i3, %i2
	! check the results from MAMEM against the orignal data

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_0:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_0
	nop
	add	%i3, 21, %i3
	cmp	%i3, 64
	ble,a	next_size
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi  ! set DATA_SRC to MPA

Case_1_0:
! Now test when the source main memory address is across L2$ line

	set	DATA_SRC, %l0
	add	%g0, 5678, %l1
	sub	%l0, 8, %l0
	stx	%l1, [%l0]  	! populate DATA_SRC-8 with some random data
! set the PA of DATA_SRC to %l5 using %l0 and %l1 as temp regs
	setpa	(DATA_SRC, %l0, %l1, %l5)  
	sub	%l5, 8, %l5
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi
! set the PA of DATA_DEST to %l6 using %l0 and %l1 as temp regs
	setpa	(DATA_DEST, %l0, %l1, %l6)  
	stxa	%g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set 0 to the REG_MA_ADDR for MAMEM offset

	add	%g0, 1, %i3  ! %i3 contains number of xwords to load/store
 next_size1:
	sub	%i3, 1,  %i0	! #of xwords to load to MAMEM minus 1
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load %i0 + 1 xwords to MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	stxa	%l6, [%g0+REG_MPA_ADDR] %asi ! set DATA_DEST to MPA
	or	%i0, 0x40, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out %i0 + 1 xwords of MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	set	DATA_SRC, %i0 
	sub	%i0, 8, %i0
	set	DATA_DEST, %i1
	add	%g0, %i3, %i2
	! check the results from MAMEM against the orignal data

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_1:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_1
	nop
	add	%i3, 21, %i3
	cmp	%i3, 64
	ble,a	next_size1
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi  ! set DATA_SRC to MPA

! Now test when the dest main memory address is across L2$ line

! set the PA of DATA_SRC to %l5 using %l0 and %l1 as temp regs
	setpa	(DATA_SRC, %l0, %l1, %l5)  
	sub	%l5, 8, %l5
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi
! set the PA of DATA_DEST to %l6 using %l0 and %l1 as temp regs
	setpa	(DATA_DEST, %l0, %l1, %l6)  
	sub	%l6, 8, %l6	! push the dest addr 8 bytes back
	stxa	%g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set 0 to the REG_MA_ADDR for MAMEM offset

	add	%g0, 1, %i3  ! %i3 contains number of xwords to load/store
 next_size2:
	sub	%i3, 1,  %i0	! #of xwords to load to MAMEM minus 1
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load %i0 + 1 xwords to MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	stxa	%l6, [%g0+REG_MPA_ADDR] %asi ! set DATA_DEST to MPA
	or	%i0, 0x40, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out %i0 + 1 xwords of MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	set	DATA_SRC, %i0 
	sub	%i0, 8, %i0
	set	DATA_DEST, %i1
	sub	%i1, 8, %i1
	add	%g0, %i3, %i2
	! check the results from MAMEM against the orignal data

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_2:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_2
	nop
	add	%i3, 21, %i3
	cmp	%i3, 64
	ble,a	next_size2
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi  ! set DATA_SRC to MPA

Case_1_1:
! Now try some nonzero odd offsets into the MA_MEM

! set the PA of DATA_SRC to %l5 using %l0 and %l1 as temp regs
	setpa	(DATA_SRC, %l0, %l1, %l5)  
	sub	%l5, 8, %l5
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi
! set the PA of DATA_DEST to %l6 using %l0 and %l1 as temp regs
	setpa	(DATA_DEST, %l0, %l1, %l6)  
	sub	%l6, 16, %l6	! push the dest addr 16 bytes back
	add	%g0, 49, %o0	! %o0 has the offset in MAMEM
	stxa	%o0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set REG_MA_ADDR for MAMEM offset

	add	%g0, 10, %i3  ! %i3 contains number of xwords to load/store
	sub	%i3, 1,  %i0	! #of xwords to load to MAMEM minus 1
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load %i0 + 1 xwords to MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	stxa	%l6, [%g0+REG_MPA_ADDR] %asi ! set DATA_DEST to MPA
	or	%i0, 0x40, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out %i0 + 1 xwords of MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	set	DATA_SRC, %i0 
	sub	%i0, 8, %i0
	set	DATA_DEST, %i1
	sub	%i1, 16, %i1
	add	%g0, %i3, %i2
	! check the results from MAMEM against the orignal data

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_3:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_3
	nop
! Now try to store out from the beginning of the MA_MEM
	stxa	%g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! now set 0 to REG_MA_ADDR for MAMEM offset
	add	%g0, 63,  %i0	! #of xwords to store out minus 1
	or	%i0, 0x40, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out %i0 + 1 xwords of MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	set	DATA_SRC, %i0 
	sub	%i0, 8, %i0
	set	DATA_DEST, %i1
	sub	%i1, 16, %i1
	sllx    %o0, 3, %o0     ! convert word offset to byte offset
	add	%i1, %o0, %i1  	! skip the dont-care data at the beginning
	add	%g0, %i3, %i2
	! check the results from MAMEM against the orignal data

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_4:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_4
	nop

! Finally test when the main memory address is L2$ line aligned, but with
! nonzero offset into the MA_MEM

Case_0_1:
! set the PA of DATA_SRC to %l5 using %l0 and %l1 as temp regs
	setpa	(DATA_SRC, %l0, %l1, %l5)  
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi
	ldxa	[%g0+REG_MPA_ADDR] %asi, %l7
	cmp	%l5, %l7
	bne,pn	%xcc, diag_fail
	nop
! set the PA of DATA_DEST to %l6 using %l0 and %l1 as temp regs
	setpa	(DATA_DEST, %l0, %l1, %l6)  
	add	%g0, 23, %g1
	stxa	%g1, [%g0+REG_MA_ADDR_ADDR] %asi   ! set 0 to the REG_MA_ADDR for MAMEM offset

	add	%g0, 1, %i3  ! %i3 contains number of xwords to load/store
 next_size3:
	sub	%i3, 1,  %i0	! #of xwords to load to MAMEM minus 1
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load %i0 + 1 xwords to MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	stxa	%l6, [%g0+REG_MPA_ADDR] %asi ! set DATA_DEST to MPA
	or	%i0, 0x40, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out %i0 + 1 xwords of MAMEM
	ldxa	[%g0+MASync_ADDR] %asi, %l7
	cmp	%l7, %g0
	bne,pn	%xcc, diag_fail
	nop
	set	DATA_SRC, %i0 
	set	DATA_DEST, %i1
	add	%g0, %i3, %i2
	! check the results from MAMEM against the orignal data

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_5:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_5
	nop
	add	%i3, 21, %i3
	cmp	%i3, 64
	ble,a	next_size3
	stxa	%l5, [%g0+REG_MPA_ADDR] %asi  ! set DATA_SRC to MPA

diag_pass:
        set     0xc001dea1,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */

diag_fail:
        set     0xdeadcafe,     %l7
        ta T_BAD_TRAP
        nop
	.data
.align 64
DATA_START:
	.word	0xdeadbeef
 ! algin to the L2 cache line size
.align  128
DATA_SRC:
	.xword 0xeae0b53068451945
	.xword 0xe3b1dc89d28a5486
	.xword 0x5141cd351681c1e9
	.xword 0x7b29828795036f01
	.xword 0xc3cdf64969e387ac
	.xword 0x3877b784a7ff3c5b
	.xword 0x06ef6a2bf8a1c33c
	.xword 0x4497120856797cf0
	.xword 0x7982c85b026f59c6
	.xword 0x745f9b054e2f6a8e
	.xword 0x1e68a5388870a077
	.xword 0x9c5145072fdd319f
	.xword 0x26b876499aad743f
	.xword 0xec3222a98177588d
	.xword 0xaf456fda052689d7
	.xword 0x02b5104a5288b961
	.xword 0x861b27cb53a13a05
	.xword 0xeb74c5012a43f1ad
	.xword 0x10a111a36aad4e1e
	.xword 0x7dda7ecd86616cac
	.xword 0x5e7127eb5a9c90cc
	.xword 0x0946be1027d16ba7
	.xword 0x38df56b93e5c2711
	.xword 0x0545c43e28dbb099
	.xword 0x88f47b8ad89bf58b
	.xword 0xb300c9d1c5bcaf16
	.xword 0xc6790e55a5b095f9
	.xword 0x8ab81f80676a6768
	.xword 0xa7d8c7dc7460a0fd
	.xword 0xb421aeafce294ffa
	.xword 0xed69d94483965023
	.xword 0x164a8d28c13bf0f9
	.xword 0xa83788e81afabc21
	.xword 0x2a51980be07e1637
	.xword 0x9e19486999103b60
	.xword 0x473c4a03b666bb53
	.xword 0x97dc9809c6b5a4bb
	.xword 0xa38640baf2fa1617
	.xword 0x3bd94b39ae547a86
	.xword 0x8e1f258e6ce76320
	.xword 0x2cad026f489841d1
	.xword 0x1b91ed84aba458c4
	.xword 0x2253ee3d99ad89ec
	.xword 0xa04ba47cfe12642f
	.xword 0x98a22f9faceb682e
	.xword 0x2da737a68b5814cf
	.xword 0x0a82699491b26bf2
	.xword 0xf7c6f334115b59f2
	.xword 0xea9357efaf784ee2
	.xword 0x159ba751bbef76ac
	.xword 0x19077f6e98a7e577
	.xword 0xae04a8516393cffe
	.xword 0x49474b0bd87113bf
	.xword 0x0bf31e29b0cef933
	.xword 0x01072a92f71cca61
	.xword 0xa32e5720dc03a28d
	.xword 0xcb88867347354fde
	.xword 0x1efe11c6af534e21
	.xword 0x2fd59cd9ac135a19
	.xword 0xaedaf225dafceeff
	.xword 0x8d359bfae464bc19
	.xword 0xea949636c2e3d695
	.xword 0x67178db07149ac0c
	.xword 0x8a5ffd967fcd9454
	.xword 0xe687e848b0f1e58e
	.xword 0x7738387996abab93
	.xword 0x842dd89a72732c2b
	.xword 0x402691debe3043b4
	.xword 0x580a99592c26f222
	.xword 0x18a6a9042d3b3684
	.xword 0x75066bac1e75276b
	.xword 0x2eae2e1c3d9f20e7
	.xword 0xd2fc04fd56ce74fb
	.xword 0x5b27363f749459b4
	.xword 0x83ac861089f86846
	.xword 0x19275aa22729f2dd
	.xword 0x83134f56adf25305
	.xword 0xee1d1707436328d3
	.xword 0x33324682b2e1e339
	.xword 0x52d01b7638b1e428
	.xword 0x23e4615c93e2b76f
	.xword 0x01a8852c62653175
	.xword 0xe1cd89d694847344
	.xword 0xcd7c32d4aeacd37d
	.xword 0x395c2f5c0277182b
	.xword 0xbc60a7f4e3415392
	.xword 0x45421970649da66d
	.xword 0xb6f333a9d7d23437
	.xword 0x380f4f750dbb4a71
	.xword 0x45704e972c522a06
	.xword 0x9ff329ca816f9a3d
	.xword 0x5c0e641a70537ed4
	.xword 0xc754e01ab27aa73c
	.xword 0x5e9f7ac0cf250312
	.xword 0x3e3628f19189e841
	.xword 0x3bc06ffb34823176
	.xword 0xcc67be93a85b3fcb
	.xword 0xb113bb1275af68d9
	.xword 0x64c0dd091613a28a
	.xword 0x8f70eb5975056062
	.xword 0xdb080d7b737b2222
	.xword 0xbed155a1f07d39e4
	.xword 0x5a4cd2c538a8602e
	.xword 0x1155a4f1d900d684
	.xword 0xfd570b43bdc1ad87
	.xword 0xe2474275b659519f
	.xword 0x9fca1befee1a59c5
	.xword 0x74b3c8b6e4cfc5ea
	.xword 0x81e738ae1456f705
	.xword 0xe46ff60bf432c0da
	.xword 0xbbbb5de69fab95ec
	.xword 0xd732d24f4e350845
	.xword 0xa43acf5381f33dec
	.xword 0x7950fbd3a2409648
	.xword 0x3695301b6c9025c5
	.xword 0x6dab4f96a122ef6b
	.xword 0x712a881f22f8704f
	.xword 0x61e360b3f1a63703
	.xword 0x873aca93bdcb7175
	.xword 0xd21b731a3a7ca5d7
	.xword 0x3deeb1d0bc87bf84
	.xword 0x09aeed82cc1a4706
	.xword 0xb7f2046856ba94a5
	.xword 0xa3ab769e28731f27
	.xword 0x65c4977b940544a8
	.xword 0x35a2318e0d5221b2
	.xword 0x7d68a24844ddcb02
	.xword 0x9cebcd98125f989d
	.xword 0xc76a370640bbb518
	.xword 0xc0f15d179433e24a
	.xword 0x52a4f4f411b2ecbe
	.xword 0xdfb727b3e43da99f
	.xword 0xa8ea47aef59226f9
	.xword 0x7405ebd14810fc76
	.xword 0xedfbc7c261b2fb0c
	.xword 0xf962434d9c26e438
	.xword 0x3d729083cd05e5b2
	.xword 0xb8c91f66b46b64c4
	.xword 0x0c659f1cbbc4bca7
	.xword 0x0d238ff942720594
	.xword 0x062e8ee7f5da566d
	.xword 0x4ed349f2ec074922
	.xword 0x21cd46ff8cb66a4c
	.xword 0xa5dca0ffc757b688
	.xword 0xac606d133b30ec99
	.xword 0x2949e885fa4b5966
	.xword 0xf631b17d9a906b3b
	.xword 0xebaf6fd73b3edc07
	.xword 0xc032489246fb2e6a
	.xword 0x4f768da548319fc6
	.xword 0x98b5253b03d321ba
	.xword 0x5d096eb2991277ae
	.xword 0xfcf9c8c429f8c958
	.xword 0xf0609bc9004ae960
	.xword 0x5af3bbf496f1c792
	.xword 0xb60e6af124431839
	.xword 0x50e8055d28b3b69c
	.xword 0xd8f3cfdfab96beb3
	.xword 0xb83b30f4c69c5a90
	.xword 0x648d3fab2e55da0b
	.align 2048
DATA_DEST:
	.xword 0x1234567890abcdef
	.align 2048
	.section .bss
BSS_DATA:
	.word	0x12345678
