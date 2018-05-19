// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_12.s
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
/*
********************************************************************************
   random seed:	679687500
   Jal tlu_multi_mix_2_hwint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x889bc7b9fb3d8fba, %g1, %g0
	setx 0x5698e1b2af1c17e2, %g1, %g1
	setx 0xa3fee505875b5ab8, %g1, %g2
	setx 0xd18145241a3320f8, %g1, %g3
	setx 0x1fc034bd2bedac4f, %g1, %g4
	setx 0xfb5de5150b76ea73, %g1, %g5
	setx 0x9ab8eff5b7648f92, %g1, %g6
	setx 0xfc985cef450f8ea4, %g1, %g7
	setx 0x6eba57bea4ec9dab, %g1, %r16
	setx 0xa0e59f8ff6f47126, %g1, %r17
	setx 0xa95731c23b3b2900, %g1, %r18
	setx 0x05953ffcb3ce1aba, %g1, %r19
	setx 0xacaf4f7662ef8c7f, %g1, %r20
	setx 0x4891a8606d742222, %g1, %r21
	setx 0x5ef42886bddfa7e7, %g1, %r22
	setx 0x9ff38d93933b56b0, %g1, %r23
	setx 0x3d3bfb5a48df5ae1, %g1, %r24
	setx 0x676b99c672886bcd, %g1, %r25
	setx 0xca4d99143a0ef9f5, %g1, %r26
	setx 0xff9c6e943d3e8157, %g1, %r27
	setx 0xccd35a0cd9ef2b76, %g1, %r28
	setx 0xe1da7e4b86cdefae, %g1, %r29
	setx 0x675551ac481e35d5, %g1, %r30
	setx 0x072c8cac54043e97, %g1, %r31
	save
	setx 0x942af2718c56bc25, %g1, %r16
	setx 0x28333f062c87ff27, %g1, %r17
	setx 0x970d64819c170b3d, %g1, %r18
	setx 0xbd064bf6c00797cb, %g1, %r19
	setx 0xdbf53b89a4698dae, %g1, %r20
	setx 0x7402da1b0c44bf25, %g1, %r21
	setx 0xd577fe1d28a8d482, %g1, %r22
	setx 0x16459439f75b77cf, %g1, %r23
	setx 0x250a221f8d4eec1c, %g1, %r24
	setx 0x4405dffd5cbff107, %g1, %r25
	setx 0xdb41c0ea954d1013, %g1, %r26
	setx 0xc56c82251f0d99e7, %g1, %r27
	setx 0x8dd4eea2d1e4b33e, %g1, %r28
	setx 0x702a33f001798a8c, %g1, %r29
	setx 0x680f30e0375195b2, %g1, %r30
	setx 0xeafec904545d6b3d, %g1, %r31
	save
	setx 0x3634e5f998fb35c4, %g1, %r16
	setx 0xf779cd1a562e109a, %g1, %r17
	setx 0x6426284a60fd1327, %g1, %r18
	setx 0x1dbe6269af651ab5, %g1, %r19
	setx 0x7dfbe1ed6986c8e0, %g1, %r20
	setx 0x92bd40354c2568da, %g1, %r21
	setx 0xf56f940b87f45d59, %g1, %r22
	setx 0x84d0023f4038d76d, %g1, %r23
	setx 0xa04c4a9544fd11fb, %g1, %r24
	setx 0x491af1f0cc8c330d, %g1, %r25
	setx 0x0f417b0b188152da, %g1, %r26
	setx 0xa85078579c4ecaec, %g1, %r27
	setx 0x18ec3f03540a4683, %g1, %r28
	setx 0x9bd2cfc4b92c8e9d, %g1, %r29
	setx 0x3e4326ba22fe18c4, %g1, %r30
	setx 0xfa3fd58f2042ea54, %g1, %r31
	save
	setx 0xbdfbdb582cd5d827, %g1, %r16
	setx 0x88279c36b3fe27e0, %g1, %r17
	setx 0x256468259cd857d9, %g1, %r18
	setx 0xbd5f6e4c2f71b89d, %g1, %r19
	setx 0xc61037eb2989c50e, %g1, %r20
	setx 0x4a09c0972008c1dd, %g1, %r21
	setx 0xea157e1af027dd27, %g1, %r22
	setx 0x304d9a64132cabab, %g1, %r23
	setx 0x3fe2dfe1f3d82b4d, %g1, %r24
	setx 0x7789f507a91befda, %g1, %r25
	setx 0x3f67069fc1fe0652, %g1, %r26
	setx 0x1bbd34dc3630db00, %g1, %r27
	setx 0xd0baa983b126b3bf, %g1, %r28
	setx 0x9958f175bd05c9a4, %g1, %r29
	setx 0x77a845de5538bc43, %g1, %r30
	setx 0x447cb66a307d4124, %g1, %r31
	save
	setx 0x1a611c926b14f563, %g1, %r16
	setx 0x8f75b61840a3fdc7, %g1, %r17
	setx 0xe633b522491adaac, %g1, %r18
	setx 0x1b38c0354a7ebea8, %g1, %r19
	setx 0x2cfe2611d35f4cf4, %g1, %r20
	setx 0xffdff9231ebeaa54, %g1, %r21
	setx 0xe21575ea6d60afcb, %g1, %r22
	setx 0xbc871ada4eac2736, %g1, %r23
	setx 0x6ee8e6356a0fe1e9, %g1, %r24
	setx 0xfbb30d75bb076e27, %g1, %r25
	setx 0xa58be557de653f5a, %g1, %r26
	setx 0xdf449d696e657ebe, %g1, %r27
	setx 0x394af3dac41b40ab, %g1, %r28
	setx 0x02c817993725b1ad, %g1, %r29
	setx 0xa3ff5a55253ce278, %g1, %r30
	setx 0xf67a5a3474e4b972, %g1, %r31
	save
	setx 0x40e344df6250dae7, %g1, %r16
	setx 0x7f321aa1cb294a82, %g1, %r17
	setx 0xce25d1550268e169, %g1, %r18
	setx 0xf5a2b73dd2f6e947, %g1, %r19
	setx 0x79b365e124547605, %g1, %r20
	setx 0x38cf2cb3ccd3988a, %g1, %r21
	setx 0xcb76c799f941b78d, %g1, %r22
	setx 0xfe35ab664c113464, %g1, %r23
	setx 0xe19215e6559334fe, %g1, %r24
	setx 0x2e17c5d03fd572cb, %g1, %r25
	setx 0x4f160748d333e4a8, %g1, %r26
	setx 0x0d078779af2e88a0, %g1, %r27
	setx 0x5ccb52fa6a0879e7, %g1, %r28
	setx 0x57a1df442d418f16, %g1, %r29
	setx 0x367b7db6954a3141, %g1, %r30
	setx 0x63036204a3ce4cd7, %g1, %r31
	save
	setx 0xdda3a838c5e3ec6d, %g1, %r16
	setx 0x38e1e95ad7db9a1b, %g1, %r17
	setx 0xff258bc1f8333335, %g1, %r18
	setx 0x1bbfbcba540e5be0, %g1, %r19
	setx 0xd8b2594e8dfd174d, %g1, %r20
	setx 0x1ec95f0a0f7e8690, %g1, %r21
	setx 0x69b45e294bcd2ee2, %g1, %r22
	setx 0xa99cf7d917d449ce, %g1, %r23
	setx 0x699db2700f95a40b, %g1, %r24
	setx 0x9e246643feab3f65, %g1, %r25
	setx 0x690b9a5a71824b75, %g1, %r26
	setx 0x17c6e2f6386fe659, %g1, %r27
	setx 0xe45adaae9b5d75fa, %g1, %r28
	setx 0xe405ebc62f6b8a25, %g1, %r29
	setx 0x24e2dec03e40fe90, %g1, %r30
	setx 0x108e5d3fc673e3be, %g1, %r31
	save
	setx 0x4013f1ee2cfb280f, %g1, %r16
	setx 0xda159500eff7a7aa, %g1, %r17
	setx 0xb587e22c669aee3a, %g1, %r18
	setx 0x714ba146274a0f0f, %g1, %r19
	setx 0x1ba17638e7b179c1, %g1, %r20
	setx 0x60294808c15733f7, %g1, %r21
	setx 0x9c901a47fcb16641, %g1, %r22
	setx 0x76c6f393a2575f29, %g1, %r23
	setx 0x14b9ec016bd4c86b, %g1, %r24
	setx 0xe6aea20c6aa1aa69, %g1, %r25
	setx 0x8aa946ff17fb0bbc, %g1, %r26
	setx 0xe33ad16cfc12db0b, %g1, %r27
	setx 0x4cd3843809550bbb, %g1, %r28
	setx 0xfdd84d6bfc5e7651, %g1, %r29
	setx 0x98823129b028f7c2, %g1, %r30
	setx 0x985a468704643f52, %g1, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 4, %fprs
	setx	data_start_0, %r1, %g7
	ldd	[%g7+0], %f0
	ldd	[%g7+8], %f2
	ldd	[%g7+16], %f4
	ldd	[%g7+24], %f6
	ldd	[%g7+32], %f8
	ldd	[%g7+40], %f10
	ldd	[%g7+48], %f12
	ldd	[%g7+56], %f14
	ldd	[%g7+64], %f16
	ldd	[%g7+72], %f18
	ldd	[%g7+80], %f20
	ldd	[%g7+88], %f22
	ldd	[%g7+96], %f24
	ldd	[%g7+104], %f26
	ldd	[%g7+112], %f28
	ldd	[%g7+120], %f30
	ldd	[%g7+128], %f32
	ldd	[%g7+136], %f34
	ldd	[%g7+144], %f36
	ldd	[%g7+152], %f38
	ldd	[%g7+160], %f40
	ldd	[%g7+168], %f42
	ldd	[%g7+176], %f44
	ldd	[%g7+184], %f46
	ldd	[%g7+192], %f48
	ldd	[%g7+200], %f50
	ldd	[%g7+208], %f52
	ldd	[%g7+216], %f54
	ldd	[%g7+224], %f56
	ldd	[%g7+232], %f58
	ldd	[%g7+240], %f60
	ldd	[%g7+248], %f62
	setx	fsr_data, %r1, %g7
	stx	%fsr, [%g7]
	ldx	[%g7], %g4
	setx	%hi(0x0f000000), %g1, %g3
	or	%g4, %g3, %g4
	stx	%g4, [%g7]
	ldx	[%g7], %fsr
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	.word 0xb43ca05a  ! 2: XNOR_I	xnor 	%r18, 0x005a, %r26
	.word 0xb1e4a024  ! 3: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5a1ba  ! 5: SAVE_I	save	%r22, 0x0001, %r27
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 2c)
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4a037  ! 16: SAVE_I	save	%r18, 0x0001, %r31
	setx	0xa96a70a90000f859, %g1, %r10
	.word 0x819a8000  ! 17: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_4, %g1, %r22
	.word 0xbde4e172  ! 27: SAVE_I	save	%r19, 0x0001, %r30
	mov	0, %r12
	.word 0x8f930000  ! 31: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 19)
	.word 0xb1e4a0d2  ! 34: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb6ac4000  ! 38: ANDNcc_R	andncc 	%r17, %r0, %r27
	setx	0xdb04e4e00000fd0c, %g1, %r10
	.word 0x819a8000  ! 42: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e42082  ! 44: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 28)
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9518000  ! 47: RDPR_PSTATE	<illegal instruction>
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 13)
	.word 0xbb510000  ! 50: RDPR_TICK	<illegal instruction>
	.word 0xbf480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8794a14a  ! 58: WRPR_TT_I	wrpr	%r18, 0x014a, %tt
	.word 0x8795a1fd  ! 59: WRPR_TT_I	wrpr	%r22, 0x01fd, %tt
	.word 0xb5641800  ! 61: MOVcc_R	<illegal instruction>
	.word 0xb5641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0x8994e1ed  ! 69: WRPR_TICK_I	wrpr	%r19, 0x01ed, %tick
	.word 0xbf3c0000  ! 71: SRA_R	sra 	%r16, %r0, %r31
	.word 0xbd508000  ! 72: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e5a0d7  ! 73: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e521ae  ! 76: SAVE_I	save	%r20, 0x0001, %r27
	mov	0, %r12
	.word 0xa1930000  ! 77: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe4a103  ! 82: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 7)
	.word 0xbfe5a1e1  ! 87: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x6835c55b00007915, %g1, %r10
	.word 0x839a8000  ! 88: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e4e1a2  ! 92: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e52007  ! 93: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_1, %g1, %r22
	.word 0xbfe52023  ! 96: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3480000  ! 99: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8795e1b0  ! 103: WRPR_TT_I	wrpr	%r23, 0x01b0, %tt
	.word 0xbbe4e0fd  ! 105: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5207f  ! 111: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe4218a  ! 116: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe560ac  ! 118: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb624e194  ! 123: SUB_I	sub 	%r19, 0x0194, %r27
	.word 0xbde5e100  ! 124: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e56170  ! 125: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3510000  ! 127: RDPR_TICK	<illegal instruction>
	.word 0xb21c8000  ! 128: XOR_R	xor 	%r18, %r0, %r25
	.word 0xbde5a1d9  ! 130: SAVE_I	save	%r22, 0x0001, %r30
	mov	0, %r12
	.word 0x8f930000  ! 133: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e5a0b9  ! 137: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4e0d2  ! 139: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5214d  ! 140: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbb50c000  ! 141: RDPR_TT	<illegal instruction>
	.word 0xb7e46173  ! 142: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4e194  ! 143: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb4350000  ! 144: SUBC_R	orn 	%r20, %r0, %r26
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, a)
	.word 0x83956185  ! 148: WRPR_TNPC_I	wrpr	%r21, 0x0185, %tnpc
	.word 0xb7e5217b  ! 151: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e4e14f  ! 152: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e5a1cb  ! 155: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x65065da70000389d, %g1, %r10
	.word 0x819a8000  ! 157: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x91942048  ! 158: WRPR_PIL_I	wrpr	%r16, 0x0048, %pil
	.word 0xb3e56016  ! 159: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbf518000  ! 162: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e42096  ! 166: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4a048  ! 170: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4e059  ! 171: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e46005  ! 172: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf480000  ! 175: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbde4e109  ! 176: SAVE_I	save	%r19, 0x0001, %r30
	setx	0xaa2ef32100009c8c, %g1, %r10
	.word 0x819a8000  ! 177: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_6, %g1, %r18
	.word 0xb1480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbbe4a024  ! 183: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe4e0e4  ! 185: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbca54000  ! 186: SUBcc_R	subcc 	%r21, %r0, %r30
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 9)
	.word 0x8d9561d7  ! 190: WRPR_PSTATE_I	wrpr	%r21, 0x01d7, %pstate
	.word 0x8d956093  ! 191: WRPR_PSTATE_I	wrpr	%r21, 0x0093, %pstate
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 18)
	.word 0xbbe520de  ! 203: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5206e  ! 206: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde561e5  ! 207: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe46120  ! 212: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5e0c3  ! 214: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8d94214a  ! 216: WRPR_PSTATE_I	wrpr	%r16, 0x014a, %pstate
	.word 0xb7508000  ! 218: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e4e0c4  ! 220: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e420e2  ! 222: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e56142  ! 228: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5e067  ! 229: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e4a006  ! 235: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbe1d21ed  ! 236: XOR_I	xor 	%r20, 0x01ed, %r31
	.word 0xb01dc000  ! 239: XOR_R	xor 	%r23, %r0, %r24
	setx	0xf2cc51f000000cce, %g1, %r10
	.word 0x819a8000  ! 240: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195e181  ! 242: WRPR_TPC_I	wrpr	%r23, 0x0181, %tpc
	.word 0xbfe4e174  ! 243: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe560c1  ! 247: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e52151  ! 250: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 39)
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 26)
	.word 0x87942187  ! 257: WRPR_TT_I	wrpr	%r16, 0x0187, %tt
	.word 0xbf510000  ! 258: RDPR_TICK	<illegal instruction>
	.word 0xb5e4e1c7  ! 259: SAVE_I	save	%r19, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 261: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e521aa  ! 266: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe4a1bb  ! 274: SAVE_I	save	%r18, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 275: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde46170  ! 276: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_4, %g1, %r20
	mov	2, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e52102  ! 281: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4202a  ! 288: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5e14b  ! 289: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4e0f3  ! 291: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e5e105  ! 293: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e461ea  ! 295: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8995a085  ! 296: WRPR_TICK_I	wrpr	%r22, 0x0085, %tick
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, e)
	.word 0x87942041  ! 303: WRPR_TT_I	wrpr	%r16, 0x0041, %tt
	.word 0x8794a09a  ! 305: WRPR_TT_I	wrpr	%r18, 0x009a, %tt
	.word 0xbfe561f3  ! 308: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e561bb  ! 310: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x91942107  ! 313: WRPR_PIL_I	wrpr	%r16, 0x0107, %pil
	.word 0xbd51c000  ! 315: RDPR_TL	<illegal instruction>
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbcac20d1  ! 324: ANDNcc_I	andncc 	%r16, 0x00d1, %r30
	.word 0xb0bdc000  ! 325: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xb9e561f7  ! 327: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde52181  ! 328: SAVE_I	save	%r20, 0x0001, %r30
	mov	1, %r12
	.word 0x8f930000  ! 333: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe4a0a7  ! 335: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x91952021  ! 336: WRPR_PIL_I	wrpr	%r20, 0x0021, %pil
	mov	2, %r12
	.word 0xa1930000  ! 337: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x83942160  ! 338: WRPR_TNPC_I	wrpr	%r16, 0x0160, %tnpc
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 11)
	mov	2, %r12
	.word 0x8f930000  ! 342: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 3d)
	.word 0xba9da1f6  ! 347: XORcc_I	xorcc 	%r22, 0x01f6, %r29
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5e5e13f  ! 355: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4e0af  ! 357: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5480000  ! 366: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbbe5a086  ! 367: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbb504000  ! 368: RDPR_TNPC	<illegal instruction>
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 1a)
	setx	data_start_1, %g1, %r19
	.word 0x8795e107  ! 371: WRPR_TT_I	wrpr	%r23, 0x0107, %tt
	.word 0xb894c000  ! 372: ORcc_R	orcc 	%r19, %r0, %r28
	setx	0xc473e28e0000cf1b, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x5de9ae1d00005dd6, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe4a00a  ! 384: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e520e9  ! 389: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e560cc  ! 391: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb0c58000  ! 394: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xbd510000  ! 399: RDPR_TICK	<illegal instruction>
	.word 0xbde5a187  ! 400: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8d9521ab  ! 401: WRPR_PSTATE_I	wrpr	%r20, 0x01ab, %pstate
	.word 0xb49ce0eb  ! 402: XORcc_I	xorcc 	%r19, 0x00eb, %r26
	.word 0xb3480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb62c2100  ! 404: ANDN_I	andn 	%r16, 0x0100, %r27
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 21)
	mov	2, %r12
	.word 0x8f930000  ! 410: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbbe5e154  ! 415: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e420f9  ! 416: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e561c5  ! 418: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbc3c8000  ! 421: XNOR_R	xnor 	%r18, %r0, %r30
	.word 0xb7e5e067  ! 422: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5a1b3  ! 428: SAVE_I	save	%r22, 0x0001, %r26
	setx	data_start_3, %g1, %r16
	mov	0, %r12
	.word 0xa1930000  ! 430: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e5216f  ! 437: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7540000  ! 440: RDPR_GL	<illegal instruction>
	.word 0xb5518000  ! 450: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4604b  ! 452: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb8bda12c  ! 453: XNORcc_I	xnorcc 	%r22, 0x012c, %r28
	.word 0x91946139  ! 455: WRPR_PIL_I	wrpr	%r17, 0x0139, %pil
	.word 0xb9e42159  ! 457: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8795a167  ! 460: WRPR_TT_I	wrpr	%r22, 0x0167, %tt
	.word 0xb3510000  ! 461: RDPR_TICK	<illegal instruction>
	.word 0xbbe4613f  ! 464: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e5a09d  ! 465: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe56012  ! 467: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe5a09a  ! 469: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e5e1e9  ! 470: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e4201f  ! 474: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe560b1  ! 476: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e46137  ! 480: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 36)
	.word 0xb7540000  ! 487: RDPR_GL	<illegal instruction>
	.word 0xb7e421ce  ! 488: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbf7d4400  ! 490: MOVR_R	movre	%r21, %r0, %r31
	.word 0xbde560c8  ! 492: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5e0a6  ! 497: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5605e  ! 499: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8595e18c  ! 501: WRPR_TSTATE_I	wrpr	%r23, 0x018c, %tstate
	.word 0xbde46045  ! 505: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e521f4  ! 507: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 1f)
	.word 0x8794606b  ! 514: WRPR_TT_I	wrpr	%r17, 0x006b, %tt
	.word 0xbb480000  ! 515: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbde46161  ! 518: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb540000  ! 519: RDPR_GL	<illegal instruction>
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe5e1b5  ! 522: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x89946134  ! 523: WRPR_TICK_I	wrpr	%r17, 0x0134, %tick
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 24)
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 2)
	.word 0xb1e460bb  ! 528: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4a1a4  ! 529: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4e142  ! 530: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e56095  ! 531: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e4e1cd  ! 533: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb2bce19f  ! 536: XNORcc_I	xnorcc 	%r19, 0x019f, %r25
	.word 0xbfe56038  ! 538: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe56064  ! 540: SAVE_I	save	%r21, 0x0001, %r29
	mov	0, %r12
	.word 0x8f930000  ! 541: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e560e4  ! 543: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe5a180  ! 548: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4201a  ! 549: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7504000  ! 551: RDPR_TNPC	<illegal instruction>
	.word 0xb33df001  ! 555: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xbde420a9  ! 556: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe520f1  ! 557: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5e0ab  ! 558: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb2c5608c  ! 561: ADDCcc_I	addccc 	%r21, 0x008c, %r25
	.word 0xb7e42181  ! 563: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_1, %g1, %r19
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e4e01f  ! 569: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x89942173  ! 571: WRPR_TICK_I	wrpr	%r16, 0x0173, %tick
	.word 0xbfe4614c  ! 580: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe4a09b  ! 592: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde421ff  ! 598: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5a08f  ! 602: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e5e17b  ! 611: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8795606f  ! 615: WRPR_TT_I	wrpr	%r21, 0x006f, %tt
	.word 0xb9e4e100  ! 616: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x839460f2  ! 624: WRPR_TNPC_I	wrpr	%r17, 0x00f2, %tnpc
	.word 0xb3e46150  ! 625: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7504000  ! 627: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb5e46172  ! 628: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8994e0b3  ! 633: WRPR_TICK_I	wrpr	%r19, 0x00b3, %tick
	.word 0xb1e52106  ! 634: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e560bf  ! 636: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 21)
	.word 0xb3e4a05b  ! 641: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x78298c1000001e57, %g1, %r10
	.word 0x839a8000  ! 644: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e5e1e2  ! 645: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e521bf  ! 646: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e46196  ! 648: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbf510000  ! 650: RDPR_TICK	<illegal instruction>
	.word 0xb9e5a101  ! 656: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde56048  ! 659: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e56106  ! 660: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1540000  ! 663: RDPR_GL	<illegal instruction>
	.word 0xb9e5e10c  ! 664: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb13cf001  ! 665: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xb7e4a005  ! 667: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4a01e  ! 669: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4a008  ! 670: SAVE_I	save	%r18, 0x0001, %r24
	mov	0, %r12
	.word 0xa1930000  ! 671: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbaac8000  ! 674: ANDNcc_R	andncc 	%r18, %r0, %r29
	setx	data_start_0, %g1, %r18
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 39)
	setx	data_start_7, %g1, %r19
	mov	0, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e46015  ! 692: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe52021  ! 694: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe56145  ! 701: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde4e088  ! 703: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde421ed  ! 705: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd508000  ! 707: RDPR_TSTATE	<illegal instruction>
	.word 0xbb3cc000  ! 710: SRA_R	sra 	%r19, %r0, %r29
	.word 0xbfe421b8  ! 712: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x9195e1c8  ! 716: WRPR_PIL_I	wrpr	%r23, 0x01c8, %pil
	.word 0x83952144  ! 717: WRPR_TNPC_I	wrpr	%r20, 0x0144, %tnpc
	.word 0xb7e521d5  ! 718: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e46163  ! 719: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e521f1  ! 720: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e420c3  ! 721: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde4e164  ! 728: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb335d000  ! 730: SRLX_R	srlx	%r23, %r0, %r25
	.word 0xb1e5e1bd  ! 732: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e4e14e  ! 733: SAVE_I	save	%r19, 0x0001, %r27
	setx	data_start_5, %g1, %r20
	.word 0xb1e4a1d3  ! 737: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe56111  ! 738: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5e0ac  ! 739: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e5e165  ! 742: SAVE_I	save	%r23, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 743: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995e167  ! 744: WRPR_TICK_I	wrpr	%r23, 0x0167, %tick
	.word 0xb1e52172  ! 746: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb350c000  ! 748: RDPR_TT	<illegal instruction>
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, e)
	.word 0x899561d2  ! 752: WRPR_TICK_I	wrpr	%r21, 0x01d2, %tick
	setx	data_start_7, %g1, %r22
	.word 0xb7e4218a  ! 761: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde4e178  ! 765: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb8ad4000  ! 771: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xb5e4210f  ! 773: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x91946097  ! 777: WRPR_PIL_I	wrpr	%r17, 0x0097, %pil
	.word 0xb3e461d3  ! 778: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_5, %g1, %r19
	setx	0xbd7a708700006a1b, %g1, %r10
	.word 0x839a8000  ! 782: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5510000  ! 786: RDPR_TICK	<illegal instruction>
	.word 0xbde5210c  ! 787: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4e008  ! 789: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e42050  ! 793: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e52050  ! 795: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8794201f  ! 796: WRPR_TT_I	wrpr	%r16, 0x001f, %tt
	.word 0x859520fb  ! 797: WRPR_TSTATE_I	wrpr	%r20, 0x00fb, %tstate
	.word 0xbfe5e05e  ! 799: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9540000  ! 800: RDPR_GL	<illegal instruction>
	.word 0xb5500000  ! 808: RDPR_TPC	<illegal instruction>
	.word 0xb5e46185  ! 814: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8d94213f  ! 815: WRPR_PSTATE_I	wrpr	%r16, 0x013f, %pstate
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 19)
	.word 0xbde5a0d2  ! 817: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e561ab  ! 820: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e4609a  ! 825: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf51c000  ! 827: RDPR_TL	<illegal instruction>
	.word 0xb9520000  ! 828: RDPR_PIL	<illegal instruction>
	.word 0xb61c2178  ! 832: XOR_I	xor 	%r16, 0x0178, %r27
	.word 0xb5e4215c  ! 835: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e5a0b7  ! 836: SAVE_I	save	%r22, 0x0001, %r25
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb950c000  ! 840: RDPR_TT	<illegal instruction>
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 7)
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 2)
	setx	data_start_3, %g1, %r19
	.word 0xb1508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xbe0ce08b  ! 856: AND_I	and 	%r19, 0x008b, %r31
	.word 0xb9e4e17d  ! 858: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb77c4400  ! 859: MOVR_R	movre	%r17, %r0, %r27
	.word 0xb2358000  ! 860: ORN_R	orn 	%r22, %r0, %r25
	.word 0x8595a1c7  ! 861: WRPR_TSTATE_I	wrpr	%r22, 0x01c7, %tstate
	.word 0xb5510000  ! 863: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r19
	.word 0xb5e4e148  ! 872: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 31)
	.word 0xbe35c000  ! 881: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xb9e42174  ! 882: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 1d)
	.word 0x919460fc  ! 885: WRPR_PIL_I	wrpr	%r17, 0x00fc, %pil
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe4e188  ! 889: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 11)
	.word 0xbf2d9000  ! 899: SLLX_R	sllx	%r22, %r0, %r31
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 33)
	.word 0x87952068  ! 902: WRPR_TT_I	wrpr	%r20, 0x0068, %tt
	.word 0xbf504000  ! 904: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 905: RDPR_TNPC	<illegal instruction>
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, 9)
	.word 0xbc2d20a0  ! 910: ANDN_I	andn 	%r20, 0x00a0, %r30
	.word 0xb5510000  ! 911: RDPR_TICK	<illegal instruction>
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbb51c000  ! 916: RDPR_TL	<illegal instruction>
	.word 0xbf51c000  ! 918: RDPR_TL	<illegal instruction>
	.word 0xbf35c000  ! 920: SRL_R	srl 	%r23, %r0, %r31
	.word 0xb7e420a9  ! 922: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4a087  ! 923: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4a056  ! 925: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe421e2  ! 927: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4218f  ! 929: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e42080  ! 933: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e42058  ! 935: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8d94a15a  ! 938: WRPR_PSTATE_I	wrpr	%r18, 0x015a, %pstate
	.word 0xb7e4a089  ! 939: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe560d4  ! 940: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e421f1  ! 944: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e5e12e  ! 946: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_52), 16, 16)) -> intp(0, 0, 29)
hwintr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_53), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe5a1c8  ! 951: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb92d2001  ! 953: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xbf2dc000  ! 954: SLL_R	sll 	%r23, %r0, %r31
	.word 0xb3e5a186  ! 955: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbf510000  ! 957: RDPR_TICK	<illegal instruction>
	.word 0xb5e4e0a8  ! 960: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_54), 16, 16)) -> intp(0, 0, 25)
	.word 0xb37c2401  ! 963: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xb9e560bd  ! 973: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb835e03a  ! 974: SUBC_I	orn 	%r23, 0x003a, %r28
	.word 0xb7e4e083  ! 975: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e4e092  ! 976: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4a12e  ! 980: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5a0d6  ! 986: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe42172  ! 987: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb61d8000  ! 988: XOR_R	xor 	%r22, %r0, %r27
	.word 0xb3e4e032  ! 991: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde5a1d6  ! 993: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9518000  ! 995: RDPR_PSTATE	<illegal instruction>
hwintr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_55), 16, 16)) -> intp(0, 0, 0)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
	.word 0xb83c21bd  ! 2: XNOR_I	xnor 	%r16, 0x01bd, %r28
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 31)
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, d)
	.word 0xfc74a1fe  ! 11: STX_I	stx	%r30, [%r18 + 0x01fe]
	.word 0xfd3cc000  ! 13: STDF_R	std	%f30, [%r0, %r19]
	.word 0xb3508000  ! 15: RDPR_TSTATE	rdpr	%tstate, %r25
	setx	0xa4cf29540000ad15, %g1, %r10
	.word 0x819a8000  ! 17: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_5, %g1, %r18
	.word 0xfe34a084  ! 22: STH_I	sth	%r31, [%r18 + 0x0084]
	.word 0xfc3c8000  ! 25: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf0254000  ! 30: STW_R	stw	%r24, [%r21 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 31: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfc342082  ! 37: STH_I	sth	%r30, [%r16 + 0x0082]
	.word 0xbcac0000  ! 38: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xf23c60a2  ! 40: STD_I	std	%r25, [%r17 + 0x00a2]
	setx	0x3c7b77b0000d9d4, %g1, %r10
	.word 0x819a8000  ! 42: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 16)
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 33)
	.word 0xb3518000  ! 47: RDPR_PSTATE	rdpr	%pstate, %r25
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 3f)
	.word 0xbd510000  ! 50: RDPR_TICK	<illegal instruction>
	.word 0xbb480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x87946055  ! 58: WRPR_TT_I	wrpr	%r17, 0x0055, %tt
	.word 0x8794e06d  ! 59: WRPR_TT_I	wrpr	%r19, 0x006d, %tt
	.word 0xf425614c  ! 60: STW_I	stw	%r26, [%r21 + 0x014c]
	.word 0xbb641800  ! 61: MOVcc_R	<illegal instruction>
	.word 0xf034a0b5  ! 65: STH_I	sth	%r24, [%r18 + 0x00b5]
	.word 0xb5641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0xf234e1a2  ! 68: STH_I	sth	%r25, [%r19 + 0x01a2]
	.word 0x8995a1cc  ! 69: WRPR_TICK_I	wrpr	%r22, 0x01cc, %tick
	.word 0xf4750000  ! 70: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xbd3c4000  ! 71: SRA_R	sra 	%r17, %r0, %r30
	.word 0xbf508000  ! 72: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xf13d211e  ! 75: STDF_I	std	%f24, [0x011e, %r20]
	mov	1, %r12
	.word 0xa1930000  ! 77: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf4256191  ! 78: STW_I	stw	%r26, [%r21 + 0x0191]
	.word 0xf6754000  ! 79: STX_R	stx	%r27, [%r21 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 28)
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 19)
	setx	0x4db7c0720000f89b, %g1, %r10
	.word 0x839a8000  ! 88: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe2c60c0  ! 89: STB_I	stb	%r31, [%r17 + 0x00c0]
	.word 0xfd3cc000  ! 90: STDF_R	std	%f30, [%r0, %r19]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 28)
	setx	data_start_0, %g1, %r21
	.word 0xbd480000  ! 99: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfe350000  ! 102: STH_R	sth	%r31, [%r20 + %r0]
	.word 0x87952011  ! 103: WRPR_TT_I	wrpr	%r20, 0x0011, %tt
	.word 0xfa3cc000  ! 104: STD_R	std	%r29, [%r19 + %r0]
	.word 0xfa25617d  ! 108: STW_I	stw	%r29, [%r21 + 0x017d]
	.word 0xf835a1f2  ! 109: STH_I	sth	%r28, [%r22 + 0x01f2]
	.word 0xf73d2016  ! 110: STDF_I	std	%f27, [0x0016, %r20]
	.word 0xf475e0a4  ! 112: STX_I	stx	%r26, [%r23 + 0x00a4]
	.word 0xfe250000  ! 113: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf2258000  ! 114: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf2340000  ! 122: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb624e02c  ! 123: SUB_I	sub 	%r19, 0x002c, %r27
	.word 0xb9510000  ! 127: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb81c4000  ! 128: XOR_R	xor 	%r17, %r0, %r28
	mov	1, %r12
	.word 0x8f930000  ! 133: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6354000  ! 138: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xb350c000  ! 141: RDPR_TT	rdpr	%tt, %r25
	.word 0xb8348000  ! 144: SUBC_R	orn 	%r18, %r0, %r28
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, a)
	.word 0x83946061  ! 148: WRPR_TNPC_I	wrpr	%r17, 0x0061, %tnpc
	.word 0xfa3ce0da  ! 153: STD_I	std	%r29, [%r19 + 0x00da]
	.word 0xfc2c8000  ! 156: STB_R	stb	%r30, [%r18 + %r0]
	setx	0x94cd32af0000e8c5, %g1, %r10
	.word 0x819a8000  ! 157: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9194e151  ! 158: WRPR_PIL_I	wrpr	%r19, 0x0151, %pil
	.word 0xf63461e1  ! 160: STH_I	sth	%r27, [%r17 + 0x01e1]
	.word 0xb7518000  ! 162: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf0258000  ! 165: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf635a02d  ! 169: STH_I	sth	%r27, [%r22 + 0x002d]
	.word 0xf22c0000  ! 173: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xb5480000  ! 175: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x895ae74d000079c8, %g1, %r10
	.word 0x819a8000  ! 177: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf275a0c7  ! 180: STX_I	stx	%r25, [%r22 + 0x00c7]
	setx	data_start_0, %g1, %r22
	.word 0xbd480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbaa5c000  ! 186: SUBcc_R	subcc 	%r23, %r0, %r29
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 11)
	.word 0x8d95e0dd  ! 190: WRPR_PSTATE_I	wrpr	%r23, 0x00dd, %pstate
	.word 0x8d95a005  ! 191: WRPR_PSTATE_I	wrpr	%r22, 0x0005, %pstate
	.word 0xf03d60de  ! 192: STD_I	std	%r24, [%r21 + 0x00de]
	.word 0xfe75a109  ! 194: STX_I	stx	%r31, [%r22 + 0x0109]
	.word 0xfe344000  ! 197: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf82d6134  ! 199: STB_I	stb	%r28, [%r21 + 0x0134]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, c)
	.word 0xfc2d4000  ! 202: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfc2de14c  ! 204: STB_I	stb	%r30, [%r23 + 0x014c]
	.word 0xf82cc000  ! 205: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf424e019  ! 215: STW_I	stw	%r26, [%r19 + 0x0019]
	.word 0x8d94a17a  ! 216: WRPR_PSTATE_I	wrpr	%r18, 0x017a, %pstate
	.word 0xbd508000  ! 218: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfe74a02f  ! 221: STX_I	stx	%r31, [%r18 + 0x002f]
	.word 0xf53d8000  ! 223: STDF_R	std	%f26, [%r0, %r22]
	.word 0xf6744000  ! 224: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xfe758000  ! 226: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfa2561b9  ! 231: STW_I	stw	%r29, [%r21 + 0x01b9]
	.word 0xff3d0000  ! 232: STDF_R	std	%f31, [%r0, %r20]
	.word 0xb81d6164  ! 236: XOR_I	xor 	%r21, 0x0164, %r28
	.word 0xf8348000  ! 237: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xb81d8000  ! 239: XOR_R	xor 	%r22, %r0, %r28
	setx	0x6363215900006c84, %g1, %r10
	.word 0x819a8000  ! 240: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8194a16d  ! 242: WRPR_TPC_I	wrpr	%r18, 0x016d, %tpc
	.word 0xf67520c5  ! 246: STX_I	stx	%r27, [%r20 + 0x00c5]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 4)
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 20)
	.word 0x8795e034  ! 257: WRPR_TT_I	wrpr	%r23, 0x0034, %tt
	.word 0xb5510000  ! 258: RDPR_TICK	rdpr	%tick, %r26
	mov	0, %r12
	.word 0x8f930000  ! 261: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf225c000  ! 262: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xff3ce090  ! 265: STDF_I	std	%f31, [0x0090, %r19]
	.word 0xf034c000  ! 267: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfc34a104  ! 272: STH_I	sth	%r30, [%r18 + 0x0104]
	mov	0, %r12
	.word 0xa1930000  ! 275: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_1, %g1, %r19
	.word 0xf635a19d  ! 279: STH_I	sth	%r27, [%r22 + 0x019d]
	mov	2, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf42cc000  ! 282: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf23c2116  ! 286: STD_I	std	%r25, [%r16 + 0x0116]
	.word 0xf83461cd  ! 287: STH_I	sth	%r28, [%r17 + 0x01cd]
	.word 0x8995e07b  ! 296: WRPR_TICK_I	wrpr	%r23, 0x007b, %tick
	.word 0xf22d608e  ! 297: STB_I	stb	%r25, [%r21 + 0x008e]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf6248000  ! 301: STW_R	stw	%r27, [%r18 + %r0]
	.word 0x8794e0e0  ! 303: WRPR_TT_I	wrpr	%r19, 0x00e0, %tt
	.word 0xfa35c000  ! 304: STH_R	sth	%r29, [%r23 + %r0]
	.word 0x8795e0ad  ! 305: WRPR_TT_I	wrpr	%r23, 0x00ad, %tt
	.word 0xf82c0000  ! 312: STB_R	stb	%r28, [%r16 + %r0]
	.word 0x9195e16f  ! 313: WRPR_PIL_I	wrpr	%r23, 0x016f, %pil
	.word 0xb751c000  ! 315: RDPR_TL	rdpr	%tl, %r27
	.word 0xfd3c8000  ! 317: STDF_R	std	%f30, [%r0, %r18]
	.word 0xf8342088  ! 319: STH_I	sth	%r28, [%r16 + 0x0088]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 27)
	.word 0xff3c0000  ! 323: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb4ade1ca  ! 324: ANDNcc_I	andncc 	%r23, 0x01ca, %r26
	.word 0xb0bc8000  ! 325: XNORcc_R	xnorcc 	%r18, %r0, %r24
	.word 0xf22c8000  ! 326: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf8748000  ! 331: STX_R	stx	%r28, [%r18 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 333: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc250000  ! 334: STW_R	stw	%r30, [%r20 + %r0]
	.word 0x919561c9  ! 336: WRPR_PIL_I	wrpr	%r21, 0x01c9, %pil
	mov	1, %r12
	.word 0xa1930000  ! 337: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8394e071  ! 338: WRPR_TNPC_I	wrpr	%r19, 0x0071, %tnpc
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 2f)
	mov	2, %r12
	.word 0x8f930000  ! 342: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 34)
	.word 0xf42c8000  ! 345: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf6240000  ! 346: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xb69de1ce  ! 347: XORcc_I	xorcc 	%r23, 0x01ce, %r27
	.word 0xff3d60ff  ! 349: STDF_I	std	%f31, [0x00ff, %r21]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 11)
	.word 0xf02ca056  ! 351: STB_I	stb	%r24, [%r18 + 0x0056]
	.word 0xf875a06f  ! 352: STX_I	stx	%r28, [%r22 + 0x006f]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfa340000  ! 361: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf825a036  ! 362: STW_I	stw	%r28, [%r22 + 0x0036]
	.word 0xf22d61a5  ! 363: STB_I	stb	%r25, [%r21 + 0x01a5]
	.word 0xbb480000  ! 366: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7504000  ! 368: RDPR_TNPC	<illegal instruction>
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 5)
	setx	data_start_4, %g1, %r23
	.word 0x8794e187  ! 371: WRPR_TT_I	wrpr	%r19, 0x0187, %tt
	.word 0xb0948000  ! 372: ORcc_R	orcc 	%r18, %r0, %r24
	setx	0x650da84b000008dd, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb3c2176  ! 376: STDF_I	std	%f29, [0x0176, %r16]
	setx	0xb998902100001a52, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf43d615f  ! 380: STD_I	std	%r26, [%r21 + 0x015f]
	.word 0xf2344000  ! 383: STH_R	sth	%r25, [%r17 + %r0]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 19)
	.word 0xf02ce14c  ! 392: STB_I	stb	%r24, [%r19 + 0x014c]
	.word 0xb6c5c000  ! 394: ADDCcc_R	addccc 	%r23, %r0, %r27
	.word 0xff3c4000  ! 398: STDF_R	std	%f31, [%r0, %r17]
	.word 0xb1510000  ! 399: RDPR_TICK	rdpr	%tick, %r24
	.word 0x8d952043  ! 401: WRPR_PSTATE_I	wrpr	%r20, 0x0043, %pstate
	.word 0xb29da10e  ! 402: XORcc_I	xorcc 	%r22, 0x010e, %r25
	.word 0xbf480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb42c2031  ! 404: ANDN_I	andn 	%r16, 0x0031, %r26
	.word 0xf33ce14d  ! 405: STDF_I	std	%f25, [0x014d, %r19]
	.word 0xf83dc000  ! 406: STD_R	std	%r28, [%r23 + %r0]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 10)
	mov	0, %r12
	.word 0x8f930000  ! 410: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf42d4000  ! 411: STB_R	stb	%r26, [%r21 + %r0]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 2c)
	.word 0xbc3dc000  ! 421: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xf22d0000  ! 427: STB_R	stb	%r25, [%r20 + %r0]
	setx	data_start_5, %g1, %r19
	mov	1, %r12
	.word 0xa1930000  ! 430: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xff3c8000  ! 431: STDF_R	std	%f31, [%r0, %r18]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 1)
	.word 0xfb3da165  ! 436: STDF_I	std	%f29, [0x0165, %r22]
	.word 0xfc2ce044  ! 439: STB_I	stb	%r30, [%r19 + 0x0044]
	.word 0xb9540000  ! 440: RDPR_GL	rdpr	%-, %r28
	.word 0xff3d4000  ! 443: STDF_R	std	%f31, [%r0, %r21]
	.word 0xbd518000  ! 450: RDPR_PSTATE	<illegal instruction>
	.word 0xbebce083  ! 453: XNORcc_I	xnorcc 	%r19, 0x0083, %r31
	.word 0xfe3c0000  ! 454: STD_R	std	%r31, [%r16 + %r0]
	.word 0x9195a0cb  ! 455: WRPR_PIL_I	wrpr	%r22, 0x00cb, %pil
	.word 0xfa75209d  ! 458: STX_I	stx	%r29, [%r20 + 0x009d]
	.word 0x879460bd  ! 460: WRPR_TT_I	wrpr	%r17, 0x00bd, %tt
	.word 0xbf510000  ! 461: RDPR_TICK	rdpr	%tick, %r31
	.word 0xfc74616a  ! 468: STX_I	stx	%r30, [%r17 + 0x016a]
	.word 0xf13cc000  ! 472: STDF_R	std	%f24, [%r0, %r19]
	.word 0xfa3de0c3  ! 473: STD_I	std	%r29, [%r23 + 0x00c3]
	.word 0xf93d2055  ! 475: STDF_I	std	%f28, [0x0055, %r20]
	.word 0xfc25c000  ! 483: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf834209e  ! 484: STH_I	sth	%r28, [%r16 + 0x009e]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 35)
	.word 0xf6740000  ! 486: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xb9540000  ! 487: RDPR_GL	<illegal instruction>
	.word 0xfe742119  ! 489: STX_I	stx	%r31, [%r16 + 0x0119]
	.word 0xb17c8400  ! 490: MOVR_R	movre	%r18, %r0, %r24
	.word 0xfe250000  ! 494: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf8356042  ! 495: STH_I	sth	%r28, [%r21 + 0x0042]
	.word 0xf2746004  ! 500: STX_I	stx	%r25, [%r17 + 0x0004]
	.word 0x8594a009  ! 501: WRPR_TSTATE_I	wrpr	%r18, 0x0009, %tstate
	.word 0xf0354000  ! 503: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf42c0000  ! 504: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf8350000  ! 508: STH_R	sth	%r28, [%r20 + %r0]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf03ca199  ! 513: STD_I	std	%r24, [%r18 + 0x0199]
	.word 0x8795e150  ! 514: WRPR_TT_I	wrpr	%r23, 0x0150, %tt
	.word 0xb1480000  ! 515: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfb3d0000  ! 516: STDF_R	std	%f29, [%r0, %r20]
	.word 0xff3c4000  ! 517: STDF_R	std	%f31, [%r0, %r17]
	.word 0xb1540000  ! 519: RDPR_GL	<illegal instruction>
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 23)
	.word 0x8994a111  ! 523: WRPR_TICK_I	wrpr	%r18, 0x0111, %tick
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 21)
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 25)
	.word 0xf6742071  ! 527: STX_I	stx	%r27, [%r16 + 0x0071]
	.word 0xf8750000  ! 534: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xfe3d203a  ! 535: STD_I	std	%r31, [%r20 + 0x003a]
	.word 0xb6bda10c  ! 536: XNORcc_I	xnorcc 	%r22, 0x010c, %r27
	mov	0, %r12
	.word 0x8f930000  ! 541: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf53c4000  ! 544: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf83ce0dc  ! 546: STD_I	std	%r28, [%r19 + 0x00dc]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb7504000  ! 551: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf2340000  ! 552: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xbf3c3001  ! 555: SRAX_I	srax	%r16, 0x0001, %r31
	.word 0xbec520db  ! 561: ADDCcc_I	addccc 	%r20, 0x00db, %r31
	.word 0xff3dc000  ! 562: STDF_R	std	%f31, [%r0, %r23]
	.word 0xf2348000  ! 564: STH_R	sth	%r25, [%r18 + %r0]
	setx	data_start_6, %g1, %r17
	.word 0xfa3521a2  ! 566: STH_I	sth	%r29, [%r20 + 0x01a2]
	.word 0xf22de012  ! 567: STB_I	stb	%r25, [%r23 + 0x0012]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 7)
	.word 0x8995606d  ! 571: WRPR_TICK_I	wrpr	%r21, 0x006d, %tick
	.word 0xf02dc000  ! 572: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xfa2ce1eb  ! 573: STB_I	stb	%r29, [%r19 + 0x01eb]
	.word 0xf13d603c  ! 574: STDF_I	std	%f24, [0x003c, %r21]
	.word 0xf8750000  ! 577: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xf42dc000  ! 579: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xfc3d8000  ! 585: STD_R	std	%r30, [%r22 + %r0]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 34)
	.word 0xfc35e144  ! 589: STH_I	sth	%r30, [%r23 + 0x0144]
	.word 0xff3c8000  ! 591: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf834e1f4  ! 593: STH_I	sth	%r28, [%r19 + 0x01f4]
	.word 0xf4252059  ! 595: STW_I	stw	%r26, [%r20 + 0x0059]
	.word 0xfa24c000  ! 596: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfa748000  ! 597: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf63ca0a0  ! 599: STD_I	std	%r27, [%r18 + 0x00a0]
	.word 0xf424c000  ! 600: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf235a11f  ! 606: STH_I	sth	%r25, [%r22 + 0x011f]
	.word 0xf235c000  ! 607: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf2346175  ! 608: STH_I	sth	%r25, [%r17 + 0x0175]
	.word 0xf0250000  ! 609: STW_R	stw	%r24, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8795e135  ! 615: WRPR_TT_I	wrpr	%r23, 0x0135, %tt
	.word 0xf424c000  ! 618: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf42de1c6  ! 623: STB_I	stb	%r26, [%r23 + 0x01c6]
	.word 0x83942029  ! 624: WRPR_TNPC_I	wrpr	%r16, 0x0029, %tnpc
	.word 0xbf504000  ! 627: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf0252082  ! 629: STW_I	stw	%r24, [%r20 + 0x0082]
	.word 0xfe3521be  ! 631: STH_I	sth	%r31, [%r20 + 0x01be]
	.word 0xf8744000  ! 632: STX_R	stx	%r28, [%r17 + %r0]
	.word 0x8995609a  ! 633: WRPR_TICK_I	wrpr	%r21, 0x009a, %tick
	.word 0xf835e0b9  ! 635: STH_I	sth	%r28, [%r23 + 0x00b9]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 39)
	.word 0xf4358000  ! 643: STH_R	sth	%r26, [%r22 + %r0]
	setx	0xc9a49e300000ac51, %g1, %r10
	.word 0x839a8000  ! 644: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 37)
	.word 0xbd510000  ! 650: RDPR_TICK	rdpr	%tick, %r30
	.word 0xfa7521eb  ! 661: STX_I	stx	%r29, [%r20 + 0x01eb]
	.word 0xb1540000  ! 663: RDPR_GL	<illegal instruction>
	.word 0xb73c7001  ! 665: SRAX_I	srax	%r17, 0x0001, %r27
	mov	1, %r12
	.word 0xa1930000  ! 671: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6744000  ! 673: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xb4adc000  ! 674: ANDNcc_R	andncc 	%r23, %r0, %r26
	.word 0xf13d6106  ! 675: STDF_I	std	%f24, [0x0106, %r21]
	.word 0xfc24213d  ! 676: STW_I	stw	%r30, [%r16 + 0x013d]
	.word 0xfc2d4000  ! 677: STB_R	stb	%r30, [%r21 + %r0]
	setx	data_start_3, %g1, %r16
	.word 0xf2242077  ! 683: STW_I	stw	%r25, [%r16 + 0x0077]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 3d)
	setx	data_start_3, %g1, %r18
	.word 0xf22c2018  ! 686: STB_I	stb	%r25, [%r16 + 0x0018]
	.word 0xf93c215a  ! 687: STDF_I	std	%f28, [0x015a, %r16]
	mov	0, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf8748000  ! 699: STX_R	stx	%r28, [%r18 + %r0]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 4)
	.word 0xfa74a15a  ! 704: STX_I	stx	%r29, [%r18 + 0x015a]
	.word 0xf875e1ae  ! 706: STX_I	stx	%r28, [%r23 + 0x01ae]
	.word 0xb7508000  ! 707: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf93de16c  ! 708: STDF_I	std	%f28, [0x016c, %r23]
	.word 0xb53d4000  ! 710: SRA_R	sra 	%r21, %r0, %r26
	.word 0xfc34201b  ! 713: STH_I	sth	%r30, [%r16 + 0x001b]
	.word 0x9194e0ac  ! 716: WRPR_PIL_I	wrpr	%r19, 0x00ac, %pil
	.word 0x8395e198  ! 717: WRPR_TNPC_I	wrpr	%r23, 0x0198, %tnpc
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf625a0c7  ! 724: STW_I	stw	%r27, [%r22 + 0x00c7]
	.word 0xf82de1ee  ! 725: STB_I	stb	%r28, [%r23 + 0x01ee]
	.word 0xf4240000  ! 727: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb9341000  ! 730: SRLX_R	srlx	%r16, %r0, %r28
	setx	data_start_4, %g1, %r22
	mov	0, %r12
	.word 0x8f930000  ! 743: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x899561fb  ! 744: WRPR_TICK_I	wrpr	%r21, 0x01fb, %tick
	.word 0xbb50c000  ! 748: RDPR_TT	rdpr	%tt, %r29
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 10)
	.word 0xf43de10a  ! 751: STD_I	std	%r26, [%r23 + 0x010a]
	.word 0x8994e06b  ! 752: WRPR_TICK_I	wrpr	%r19, 0x006b, %tick
	.word 0xf83c8000  ! 753: STD_R	std	%r28, [%r18 + %r0]
	.word 0xff3d4000  ! 754: STDF_R	std	%f31, [%r0, %r21]
	setx	data_start_5, %g1, %r17
	.word 0xf2354000  ! 759: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf53ca03e  ! 760: STDF_I	std	%f26, [0x003e, %r18]
	.word 0xf02de145  ! 764: STB_I	stb	%r24, [%r23 + 0x0145]
	.word 0xf63cc000  ! 766: STD_R	std	%r27, [%r19 + %r0]
	.word 0xf22ca08c  ! 767: STB_I	stb	%r25, [%r18 + 0x008c]
	.word 0xf2350000  ! 768: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xb2ac4000  ! 771: ANDNcc_R	andncc 	%r17, %r0, %r25
	.word 0xf13d0000  ! 772: STDF_R	std	%f24, [%r0, %r20]
	.word 0x9194602c  ! 777: WRPR_PIL_I	wrpr	%r17, 0x002c, %pil
	setx	data_start_1, %g1, %r18
	setx	0x8826d3ca00007b1d, %g1, %r10
	.word 0x839a8000  ! 782: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf63c61f7  ! 783: STD_I	std	%r27, [%r17 + 0x01f7]
	.word 0xf23dc000  ! 785: STD_R	std	%r25, [%r23 + %r0]
	.word 0xbb510000  ! 786: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfe250000  ! 791: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xfe346154  ! 792: STH_I	sth	%r31, [%r17 + 0x0154]
	.word 0x8794a1ec  ! 796: WRPR_TT_I	wrpr	%r18, 0x01ec, %tt
	.word 0x85956078  ! 797: WRPR_TSTATE_I	wrpr	%r21, 0x0078, %tstate
	.word 0xb1540000  ! 800: RDPR_GL	rdpr	%-, %r24
	.word 0xf53c0000  ! 802: STDF_R	std	%f26, [%r0, %r16]
	.word 0xfc248000  ! 803: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf43c213b  ! 804: STD_I	std	%r26, [%r16 + 0x013b]
	.word 0xf93c6119  ! 807: STDF_I	std	%f28, [0x0119, %r17]
	.word 0xb1500000  ! 808: RDPR_TPC	<illegal instruction>
	.word 0xfa756067  ! 809: STX_I	stx	%r29, [%r21 + 0x0067]
	.word 0xf635c000  ! 810: STH_R	sth	%r27, [%r23 + %r0]
	.word 0x8d952171  ! 815: WRPR_PSTATE_I	wrpr	%r20, 0x0171, %pstate
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf02460e0  ! 822: STW_I	stw	%r24, [%r17 + 0x00e0]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 14)
	.word 0xf82c8000  ! 826: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xbb51c000  ! 827: RDPR_TL	rdpr	%tl, %r29
	.word 0xb7520000  ! 828: RDPR_PIL	<illegal instruction>
	.word 0xf13cc000  ! 829: STDF_R	std	%f24, [%r0, %r19]
	.word 0xb41d2199  ! 832: XOR_I	xor 	%r20, 0x0199, %r26
	.word 0xf634e1b2  ! 837: STH_I	sth	%r27, [%r19 + 0x01b2]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2346100  ! 839: STH_I	sth	%r25, [%r17 + 0x0100]
	.word 0xbb50c000  ! 840: RDPR_TT	rdpr	%tt, %r29
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 34)
	.word 0xf625a1b0  ! 843: STW_I	stw	%r27, [%r22 + 0x01b0]
	.word 0xf6340000  ! 844: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf13d8000  ! 849: STDF_R	std	%f24, [%r0, %r22]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 3)
	setx	data_start_1, %g1, %r21
	.word 0xf8248000  ! 853: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf83d0000  ! 854: STD_R	std	%r28, [%r20 + %r0]
	.word 0xb5508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xbe0c20de  ! 856: AND_I	and 	%r16, 0x00de, %r31
	.word 0xf22c6167  ! 857: STB_I	stb	%r25, [%r17 + 0x0167]
	.word 0xbf7dc400  ! 859: MOVR_R	movre	%r23, %r0, %r31
	.word 0xb834c000  ! 860: ORN_R	orn 	%r19, %r0, %r28
	.word 0x859421c5  ! 861: WRPR_TSTATE_I	wrpr	%r16, 0x01c5, %tstate
	.word 0xfc354000  ! 862: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xb3510000  ! 863: RDPR_TICK	rdpr	%tick, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r23
	.word 0xfa3c4000  ! 870: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf8344000  ! 871: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xff3dc000  ! 874: STDF_R	std	%f31, [%r0, %r23]
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf2752191  ! 876: STX_I	stx	%r25, [%r20 + 0x0191]
	.word 0xfc350000  ! 880: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xbc35c000  ! 881: SUBC_R	orn 	%r23, %r0, %r30
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 24)
	.word 0x91952032  ! 885: WRPR_PIL_I	wrpr	%r20, 0x0032, %pil
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, d)
	.word 0xf43c2011  ! 891: STD_I	std	%r26, [%r16 + 0x0011]
	.word 0xf82dc000  ! 892: STB_R	stb	%r28, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 13)
	.word 0xb32cd000  ! 899: SLLX_R	sllx	%r19, %r0, %r25
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 2a)
	.word 0x8795a0e2  ! 902: WRPR_TT_I	wrpr	%r22, 0x00e2, %tt
	.word 0xf0240000  ! 903: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xb3504000  ! 904: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xbf504000  ! 905: RDPR_TNPC	<illegal instruction>
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 4)
	.word 0xf2754000  ! 909: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xbe2ce014  ! 910: ANDN_I	andn 	%r19, 0x0014, %r31
	.word 0xb7510000  ! 911: RDPR_TICK	<illegal instruction>
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf22ce04f  ! 913: STB_I	stb	%r25, [%r19 + 0x004f]
	.word 0xb151c000  ! 916: RDPR_TL	<illegal instruction>
	.word 0xb751c000  ! 918: RDPR_TL	<illegal instruction>
	.word 0xf225e051  ! 919: STW_I	stw	%r25, [%r23 + 0x0051]
	.word 0xb134c000  ! 920: SRL_R	srl 	%r19, %r0, %r24
	.word 0xf424c000  ! 921: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf22c8000  ! 926: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf13d4000  ! 928: STDF_R	std	%f24, [%r0, %r21]
	.word 0xfe75608f  ! 931: STX_I	stx	%r31, [%r21 + 0x008f]
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 1b)
	.word 0x8d95e150  ! 938: WRPR_PSTATE_I	wrpr	%r23, 0x0150, %pstate
	.word 0xfe258000  ! 942: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf6340000  ! 943: STH_R	sth	%r27, [%r16 + %r0]
hwintr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_52), 16, 16)) -> intp(3, 0, 35)
hwintr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_53), 16, 16)) -> intp(3, 0, 36)
	.word 0xfc2de1c3  ! 952: STB_I	stb	%r30, [%r23 + 0x01c3]
	.word 0xb32da001  ! 953: SLL_I	sll 	%r22, 0x0001, %r25
	.word 0xb32c4000  ! 954: SLL_R	sll 	%r17, %r0, %r25
	.word 0xf8346151  ! 956: STH_I	sth	%r28, [%r17 + 0x0151]
	.word 0xb3510000  ! 957: RDPR_TICK	rdpr	%tick, %r25
hwintr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_54), 16, 16)) -> intp(3, 0, 8)
	.word 0xbd7c2401  ! 963: MOVR_I	movre	%r16, 0x1, %r30
	.word 0xf874a152  ! 965: STX_I	stx	%r28, [%r18 + 0x0152]
	.word 0xf22de012  ! 967: STB_I	stb	%r25, [%r23 + 0x0012]
	.word 0xf02d8000  ! 968: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf874a162  ! 969: STX_I	stx	%r28, [%r18 + 0x0162]
	.word 0xb2346040  ! 974: SUBC_I	orn 	%r17, 0x0040, %r25
	.word 0xf275e028  ! 979: STX_I	stx	%r25, [%r23 + 0x0028]
	.word 0xfc746002  ! 981: STX_I	stx	%r30, [%r17 + 0x0002]
	.word 0xf43dc000  ! 983: STD_R	std	%r26, [%r23 + %r0]
	.word 0xbc1d8000  ! 988: XOR_R	xor 	%r22, %r0, %r30
	.word 0xf82d8000  ! 990: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xbf518000  ! 995: RDPR_PSTATE	<illegal instruction>
hwintr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_55), 16, 16)) -> intp(3, 0, 1f)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
	.word 0xb03ca083  ! 2: XNOR_I	xnor 	%r18, 0x0083, %r24
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf215204a  ! 7: LDUH_I	lduh	[%r20 + 0x004a], %r25
	.word 0xfc5c4000  ! 8: LDX_R	ldx	[%r17 + %r0], %r30
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 20)
	.word 0xfe54c000  ! 14: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xb7508000  ! 15: RDPR_TSTATE	<illegal instruction>
	setx	0xb60f62940000fac3, %g1, %r10
	.word 0x819a8000  ! 17: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_3, %g1, %r17
	.word 0xf0040000  ! 20: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xf84560c0  ! 24: LDSW_I	ldsw	[%r21 + 0x00c0], %r28
	.word 0xf85ce029  ! 26: LDX_I	ldx	[%r19 + 0x0029], %r28
	.word 0xf85ca138  ! 28: LDX_I	ldx	[%r18 + 0x0138], %r28
	.word 0xfe458000  ! 29: LDSW_R	ldsw	[%r22 + %r0], %r31
	mov	1, %r12
	.word 0x8f930000  ! 31: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf51dc000  ! 35: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xf25c4000  ! 36: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xb2ad4000  ! 38: ANDNcc_R	andncc 	%r21, %r0, %r25
	setx	0x3045613f00007d1d, %g1, %r10
	.word 0x819a8000  ! 42: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 12)
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 21)
	.word 0xb9518000  ! 47: RDPR_PSTATE	<illegal instruction>
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 26)
	.word 0xbd510000  ! 50: RDPR_TICK	<illegal instruction>
	.word 0xbb480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf4452134  ! 52: LDSW_I	ldsw	[%r20 + 0x0134], %r26
	.word 0xf61420b6  ! 53: LDUH_I	lduh	[%r16 + 0x00b6], %r27
	.word 0xfe0d211a  ! 55: LDUB_I	ldub	[%r20 + 0x011a], %r31
	.word 0xfa44c000  ! 56: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xfe14600a  ! 57: LDUH_I	lduh	[%r17 + 0x000a], %r31
	.word 0x8795a01e  ! 58: WRPR_TT_I	wrpr	%r22, 0x001e, %tt
	.word 0x8794214f  ! 59: WRPR_TT_I	wrpr	%r16, 0x014f, %tt
	.word 0xb1641800  ! 61: MOVcc_R	<illegal instruction>
	.word 0xf2456158  ! 62: LDSW_I	ldsw	[%r21 + 0x0158], %r25
	.word 0xf71c0000  ! 63: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xb9641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0x8995e164  ! 69: WRPR_TICK_I	wrpr	%r23, 0x0164, %tick
	.word 0xb73c0000  ! 71: SRA_R	sra 	%r16, %r0, %r27
	.word 0xb5508000  ! 72: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xfe1c600a  ! 74: LDD_I	ldd	[%r17 + 0x000a], %r31
	mov	0, %r12
	.word 0xa1930000  ! 77: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf85ce1cf  ! 83: LDX_I	ldx	[%r19 + 0x01cf], %r28
	.word 0xf604213f  ! 84: LDUW_I	lduw	[%r16 + 0x013f], %r27
	.word 0xf20c4000  ! 85: LDUB_R	ldub	[%r17 + %r0], %r25
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 3c)
	setx	0x8864db5e00002ac6, %g1, %r10
	.word 0x839a8000  ! 88: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 0)
	setx	data_start_7, %g1, %r18
	.word 0xb1480000  ! 99: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf214209a  ! 100: LDUH_I	lduh	[%r16 + 0x009a], %r25
	.word 0xf91cc000  ! 101: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0x8794e1ef  ! 103: WRPR_TT_I	wrpr	%r19, 0x01ef, %tt
	.word 0xfe440000  ! 119: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xfa540000  ! 121: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xb02420e5  ! 123: SUB_I	sub 	%r16, 0x00e5, %r24
	.word 0xfe0de1df  ! 126: LDUB_I	ldub	[%r23 + 0x01df], %r31
	.word 0xb7510000  ! 127: RDPR_TICK	<illegal instruction>
	.word 0xbe1c4000  ! 128: XOR_R	xor 	%r17, %r0, %r31
	.word 0xfe1d4000  ! 131: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xfa1d4000  ! 132: LDD_R	ldd	[%r21 + %r0], %r29
	mov	2, %r12
	.word 0x8f930000  ! 133: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe1de121  ! 134: LDD_I	ldd	[%r23 + 0x0121], %r31
	mov	1, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb750c000  ! 141: RDPR_TT	<illegal instruction>
	.word 0xbc358000  ! 144: SUBC_R	orn 	%r22, %r0, %r30
	.word 0xf0150000  ! 145: LDUH_R	lduh	[%r20 + %r0], %r24
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 21)
	.word 0x839561af  ! 148: WRPR_TNPC_I	wrpr	%r21, 0x01af, %tnpc
	.word 0xf4148000  ! 149: LDUH_R	lduh	[%r18 + %r0], %r26
	setx	0x47bd03ad00002a85, %g1, %r10
	.word 0x819a8000  ! 157: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195205f  ! 158: WRPR_PIL_I	wrpr	%r20, 0x005f, %pil
	.word 0xf91dc000  ! 161: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xbf518000  ! 162: RDPR_PSTATE	<illegal instruction>
	.word 0xf405c000  ! 163: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xbf480000  ! 175: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0xa566b27d00008edd, %g1, %r10
	.word 0x819a8000  ! 177: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb1c217a  ! 178: LDDF_I	ldd	[%r16, 0x017a], %f29
	setx	data_start_7, %g1, %r23
	.word 0xb9480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbca48000  ! 186: SUBcc_R	subcc 	%r18, %r0, %r30
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf71d61d0  ! 189: LDDF_I	ldd	[%r21, 0x01d0], %f27
	.word 0x8d94211c  ! 190: WRPR_PSTATE_I	wrpr	%r16, 0x011c, %pstate
	.word 0x8d95e13c  ! 191: WRPR_PSTATE_I	wrpr	%r23, 0x013c, %pstate
	.word 0xf24460c1  ! 193: LDSW_I	ldsw	[%r17 + 0x00c1], %r25
	.word 0xf61d0000  ! 196: LDD_R	ldd	[%r20 + %r0], %r27
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfe0cc000  ! 201: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf454e055  ! 209: LDSH_I	ldsh	[%r19 + 0x0055], %r26
	.word 0xf0458000  ! 210: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf414a1de  ! 211: LDUH_I	lduh	[%r18 + 0x01de], %r26
	.word 0x8d94e1f4  ! 216: WRPR_PSTATE_I	wrpr	%r19, 0x01f4, %pstate
	.word 0xf05d0000  ! 217: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xbf508000  ! 218: RDPR_TSTATE	<illegal instruction>
	.word 0xf65c606c  ! 219: LDX_I	ldx	[%r17 + 0x006c], %r27
	.word 0xf81d4000  ! 233: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xfa454000  ! 234: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xbc1de14e  ! 236: XOR_I	xor 	%r23, 0x014e, %r30
	.word 0xf71d219c  ! 238: LDDF_I	ldd	[%r20, 0x019c], %f27
	.word 0xbe1c8000  ! 239: XOR_R	xor 	%r18, %r0, %r31
	setx	0x4ba388d00000389b, %g1, %r10
	.word 0x819a8000  ! 240: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8194213c  ! 242: WRPR_TPC_I	wrpr	%r16, 0x013c, %tpc
	.word 0xfe5c4000  ! 244: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xfe048000  ! 245: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xfa454000  ! 249: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xfe4ca0fe  ! 252: LDSB_I	ldsb	[%r18 + 0x00fe], %r31
	.word 0xf4050000  ! 253: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xfb1d8000  ! 254: LDDF_R	ldd	[%r22, %r0], %f29
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 2a)
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 10)
	.word 0x87956124  ! 257: WRPR_TT_I	wrpr	%r21, 0x0124, %tt
	.word 0xb1510000  ! 258: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 261: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf215a144  ! 263: LDUH_I	lduh	[%r22 + 0x0144], %r25
	.word 0xf855e0fa  ! 264: LDSH_I	ldsh	[%r23 + 0x00fa], %r28
	.word 0xf44c2160  ! 269: LDSB_I	ldsb	[%r16 + 0x0160], %r26
	.word 0xf44ce12e  ! 271: LDSB_I	ldsb	[%r19 + 0x012e], %r26
	mov	2, %r12
	.word 0xa1930000  ! 275: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_7, %g1, %r20
	mov	1, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8995e077  ! 296: WRPR_TICK_I	wrpr	%r23, 0x0077, %tick
	.word 0xf4558000  ! 299: LDSH_R	ldsh	[%r22 + %r0], %r26
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 2)
	.word 0x87942017  ! 303: WRPR_TT_I	wrpr	%r16, 0x0017, %tt
	.word 0x8795a12e  ! 305: WRPR_TT_I	wrpr	%r22, 0x012e, %tt
	.word 0xfc5c215d  ! 307: LDX_I	ldx	[%r16 + 0x015d], %r30
	.word 0xf40de1e2  ! 311: LDUB_I	ldub	[%r23 + 0x01e2], %r26
	.word 0x9194a195  ! 313: WRPR_PIL_I	wrpr	%r18, 0x0195, %pil
	.word 0xb151c000  ! 315: RDPR_TL	<illegal instruction>
	.word 0xf00c8000  ! 316: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf25de1a6  ! 318: LDX_I	ldx	[%r23 + 0x01a6], %r25
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 24)
	.word 0xfc454000  ! 322: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xbcac2030  ! 324: ANDNcc_I	andncc 	%r16, 0x0030, %r30
	.word 0xbcbdc000  ! 325: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xfa440000  ! 329: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf61c205a  ! 330: LDD_I	ldd	[%r16 + 0x005a], %r27
	.word 0xf25ce1ff  ! 332: LDX_I	ldx	[%r19 + 0x01ff], %r25
	mov	0, %r12
	.word 0x8f930000  ! 333: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9194a098  ! 336: WRPR_PIL_I	wrpr	%r18, 0x0098, %pil
	mov	1, %r12
	.word 0xa1930000  ! 337: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8394a02c  ! 338: WRPR_TNPC_I	wrpr	%r18, 0x002c, %tnpc
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 31)
	mov	2, %r12
	.word 0x8f930000  ! 342: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 21)
	.word 0xf24d0000  ! 344: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xb29d617f  ! 347: XORcc_I	xorcc 	%r21, 0x017f, %r25
	.word 0xfa1da14f  ! 348: LDD_I	ldd	[%r22 + 0x014f], %r29
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe55e070  ! 354: LDSH_I	ldsh	[%r23 + 0x0070], %r31
	.word 0xf614e0fb  ! 356: LDUH_I	lduh	[%r19 + 0x00fb], %r27
	.word 0xf4544000  ! 358: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf2548000  ! 359: LDSH_R	ldsh	[%r18 + %r0], %r25
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb3480000  ! 366: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb504000  ! 368: RDPR_TNPC	<illegal instruction>
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 35)
	setx	data_start_3, %g1, %r21
	.word 0x8795e1da  ! 371: WRPR_TT_I	wrpr	%r23, 0x01da, %tt
	.word 0xb2944000  ! 372: ORcc_R	orcc 	%r17, %r0, %r25
	setx	0x9dd5313e0000f8ca, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa054000  ! 374: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xf44c61a9  ! 377: LDSB_I	ldsb	[%r17 + 0x01a9], %r26
	.word 0xf61d4000  ! 378: LDD_R	ldd	[%r21 + %r0], %r27
	setx	0xd556840900008f97, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf015a09c  ! 385: LDUH_I	lduh	[%r22 + 0x009c], %r24
	.word 0xfc4c8000  ! 388: LDSB_R	ldsb	[%r18 + %r0], %r30
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 28)
	.word 0xbac58000  ! 394: ADDCcc_R	addccc 	%r22, %r0, %r29
	.word 0xf25de07c  ! 396: LDX_I	ldx	[%r23 + 0x007c], %r25
	.word 0xbb510000  ! 399: RDPR_TICK	<illegal instruction>
	.word 0x8d9521eb  ! 401: WRPR_PSTATE_I	wrpr	%r20, 0x01eb, %pstate
	.word 0xbc9c6059  ! 402: XORcc_I	xorcc 	%r17, 0x0059, %r30
	.word 0xb7480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb02d215d  ! 404: ANDN_I	andn 	%r20, 0x015d, %r24
	.word 0xf8448000  ! 407: LDSW_R	ldsw	[%r18 + %r0], %r28
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 2c)
	mov	0, %r12
	.word 0x8f930000  ! 410: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc4c8000  ! 413: LDSB_R	ldsb	[%r18 + %r0], %r30
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 39)
	.word 0xf855c000  ! 417: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xff1c8000  ! 419: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xbe3cc000  ! 421: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xf01c8000  ! 426: LDD_R	ldd	[%r18 + %r0], %r24
	setx	data_start_3, %g1, %r16
	mov	0, %r12
	.word 0xa1930000  ! 430: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 11)
	.word 0xf25d4000  ! 433: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf84de1a2  ! 434: LDSB_I	ldsb	[%r23 + 0x01a2], %r28
	.word 0xfe14c000  ! 438: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xbd540000  ! 440: RDPR_GL	<illegal instruction>
	.word 0xfa5d601b  ! 442: LDX_I	ldx	[%r21 + 0x001b], %r29
	.word 0xf25d0000  ! 445: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf404c000  ! 446: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xfc0521af  ! 447: LDUW_I	lduw	[%r20 + 0x01af], %r30
	.word 0xff1d21f3  ! 448: LDDF_I	ldd	[%r20, 0x01f3], %f31
	.word 0xf01cc000  ! 449: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xb7518000  ! 450: RDPR_PSTATE	<illegal instruction>
	.word 0xbebce081  ! 453: XNORcc_I	xnorcc 	%r19, 0x0081, %r31
	.word 0x9195206d  ! 455: WRPR_PIL_I	wrpr	%r20, 0x006d, %pil
	.word 0xfc4c0000  ! 456: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0x87946062  ! 460: WRPR_TT_I	wrpr	%r17, 0x0062, %tt
	.word 0xb1510000  ! 461: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf6142134  ! 462: LDUH_I	lduh	[%r16 + 0x0134], %r27
	.word 0xf41d0000  ! 466: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xfc0da0bc  ! 471: LDUB_I	ldub	[%r22 + 0x00bc], %r30
	.word 0xfc1d4000  ! 477: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xfe044000  ! 479: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xfc5c610e  ! 482: LDX_I	ldx	[%r17 + 0x010e], %r30
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, d)
	.word 0xb3540000  ! 487: RDPR_GL	<illegal instruction>
	.word 0xb77d8400  ! 490: MOVR_R	movre	%r22, %r0, %r27
	.word 0xf615a1ad  ! 496: LDUH_I	lduh	[%r22 + 0x01ad], %r27
	.word 0xfb1c6062  ! 498: LDDF_I	ldd	[%r17, 0x0062], %f29
	.word 0x85942043  ! 501: WRPR_TSTATE_I	wrpr	%r16, 0x0043, %tstate
	.word 0xfa154000  ! 502: LDUH_R	lduh	[%r21 + %r0], %r29
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 16)
	.word 0xf205a14e  ! 510: LDUW_I	lduw	[%r22 + 0x014e], %r25
	.word 0x879420ab  ! 514: WRPR_TT_I	wrpr	%r16, 0x00ab, %tt
	.word 0xbb480000  ! 515: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbf540000  ! 519: RDPR_GL	<illegal instruction>
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 18)
	.word 0xf8548000  ! 521: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0x89942021  ! 523: WRPR_TICK_I	wrpr	%r16, 0x0021, %tick
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 28)
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 1)
	.word 0xf80560fc  ! 532: LDUW_I	lduw	[%r21 + 0x00fc], %r28
	.word 0xb4bde1db  ! 536: XNORcc_I	xnorcc 	%r23, 0x01db, %r26
	mov	0, %r12
	.word 0x8f930000  ! 541: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6554000  ! 542: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xf24c20bd  ! 545: LDSB_I	ldsb	[%r16 + 0x00bd], %r25
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 29)
	.word 0xb1504000  ! 551: RDPR_TNPC	<illegal instruction>
	.word 0xf004e1c7  ! 554: LDUW_I	lduw	[%r19 + 0x01c7], %r24
	.word 0xb73c3001  ! 555: SRAX_I	srax	%r16, 0x0001, %r27
	.word 0xf8140000  ! 559: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xb6c5a196  ! 561: ADDCcc_I	addccc 	%r22, 0x0196, %r27
	setx	data_start_7, %g1, %r21
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 32)
	.word 0x8995e0e5  ! 571: WRPR_TICK_I	wrpr	%r23, 0x00e5, %tick
	.word 0xf6144000  ! 575: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xfa1460df  ! 576: LDUH_I	lduh	[%r17 + 0x00df], %r29
	.word 0xf644e155  ! 584: LDSW_I	ldsw	[%r19 + 0x0155], %r27
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 6)
	.word 0xf61da000  ! 590: LDD_I	ldd	[%r22 + 0x0000], %r27
	.word 0xf215c000  ! 605: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xfc050000  ! 610: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfc046023  ! 612: LDUW_I	lduw	[%r17 + 0x0023], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe1c21ce  ! 614: LDD_I	ldd	[%r16 + 0x01ce], %r31
	.word 0x8795209b  ! 615: WRPR_TT_I	wrpr	%r20, 0x009b, %tt
	.word 0xfa05e171  ! 619: LDUW_I	lduw	[%r23 + 0x0171], %r29
	.word 0xf85560f4  ! 620: LDSH_I	ldsh	[%r21 + 0x00f4], %r28
	.word 0xfc45a1c2  ! 622: LDSW_I	ldsw	[%r22 + 0x01c2], %r30
	.word 0x8394e07e  ! 624: WRPR_TNPC_I	wrpr	%r19, 0x007e, %tnpc
	.word 0xbf504000  ! 627: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf8558000  ! 630: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0x8994616e  ! 633: WRPR_TICK_I	wrpr	%r17, 0x016e, %tick
	.word 0xf0158000  ! 637: LDUH_R	lduh	[%r22 + %r0], %r24
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, f)
	.word 0xf04c0000  ! 639: LDSB_R	ldsb	[%r16 + %r0], %r24
	setx	0xf16b758700009e84, %g1, %r10
	.word 0x839a8000  ! 644: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe04c000  ! 647: LDUW_R	lduw	[%r19 + %r0], %r31
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 1)
	.word 0xb1510000  ! 650: RDPR_TICK	<illegal instruction>
	.word 0xf01de170  ! 657: LDD_I	ldd	[%r23 + 0x0170], %r24
	.word 0xf01d207d  ! 658: LDD_I	ldd	[%r20 + 0x007d], %r24
	.word 0xbf540000  ! 663: RDPR_GL	<illegal instruction>
	.word 0xb33df001  ! 665: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xf41d8000  ! 666: LDD_R	ldd	[%r22 + %r0], %r26
	mov	0, %r12
	.word 0xa1930000  ! 671: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb4acc000  ! 674: ANDNcc_R	andncc 	%r19, %r0, %r26
	setx	data_start_4, %g1, %r21
	.word 0xfa1d210c  ! 680: LDD_I	ldd	[%r20 + 0x010c], %r29
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 6)
	setx	data_start_4, %g1, %r19
	.word 0xfb1c21a6  ! 688: LDDF_I	ldd	[%r16, 0x01a6], %f29
	mov	2, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa052185  ! 693: LDUW_I	lduw	[%r20 + 0x0185], %r29
	.word 0xf91d60e1  ! 695: LDDF_I	ldd	[%r21, 0x00e1], %f28
	.word 0xf71d211a  ! 697: LDDF_I	ldd	[%r20, 0x011a], %f27
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 11)
	.word 0xf85ce1bc  ! 702: LDX_I	ldx	[%r19 + 0x01bc], %r28
	.word 0xb1508000  ! 707: RDPR_TSTATE	<illegal instruction>
	.word 0xf4550000  ! 709: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xbf3d4000  ! 710: SRA_R	sra 	%r21, %r0, %r31
	.word 0xfa1dc000  ! 711: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf6158000  ! 714: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0x9194e08b  ! 716: WRPR_PIL_I	wrpr	%r19, 0x008b, %pil
	.word 0x8394e10a  ! 717: WRPR_TNPC_I	wrpr	%r19, 0x010a, %tnpc
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfa4de18f  ! 723: LDSB_I	ldsb	[%r23 + 0x018f], %r29
	.word 0xfa1d8000  ! 726: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xf2058000  ! 729: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xbd355000  ! 730: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xf01dc000  ! 731: LDD_R	ldd	[%r23 + %r0], %r24
	setx	data_start_0, %g1, %r22
	.word 0xfe1dc000  ! 736: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xf2156044  ! 740: LDUH_I	lduh	[%r21 + 0x0044], %r25
	mov	1, %r12
	.word 0x8f930000  ! 743: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x89946056  ! 744: WRPR_TICK_I	wrpr	%r17, 0x0056, %tick
	.word 0xb750c000  ! 748: RDPR_TT	<illegal instruction>
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 1)
	.word 0xf64d8000  ! 750: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0x89952016  ! 752: WRPR_TICK_I	wrpr	%r20, 0x0016, %tick
	.word 0xfe4dc000  ! 756: LDSB_R	ldsb	[%r23 + %r0], %r31
	setx	data_start_0, %g1, %r21
	.word 0xbaadc000  ! 771: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xf214e047  ! 776: LDUH_I	lduh	[%r19 + 0x0047], %r25
	.word 0x9194613a  ! 777: WRPR_PIL_I	wrpr	%r17, 0x013a, %pil
	setx	data_start_3, %g1, %r21
	.word 0xfc4d6191  ! 780: LDSB_I	ldsb	[%r21 + 0x0191], %r30
	setx	0x20d0e6430000dcde, %g1, %r10
	.word 0x839a8000  ! 782: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4156149  ! 784: LDUH_I	lduh	[%r21 + 0x0149], %r26
	.word 0xbb510000  ! 786: RDPR_TICK	<illegal instruction>
	.word 0x87946142  ! 796: WRPR_TT_I	wrpr	%r17, 0x0142, %tt
	.word 0x8594611f  ! 797: WRPR_TSTATE_I	wrpr	%r17, 0x011f, %tstate
	.word 0xb1540000  ! 800: RDPR_GL	<illegal instruction>
	.word 0xf11c8000  ! 805: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xf405a179  ! 806: LDUW_I	lduw	[%r22 + 0x0179], %r26
	.word 0xbf500000  ! 808: RDPR_TPC	<illegal instruction>
	.word 0x8d95e176  ! 815: WRPR_PSTATE_I	wrpr	%r23, 0x0176, %pstate
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf44c6121  ! 821: LDSB_I	ldsb	[%r17 + 0x0121], %r26
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 27)
	.word 0xb951c000  ! 827: RDPR_TL	<illegal instruction>
	.word 0xbf520000  ! 828: RDPR_PIL	<illegal instruction>
	.word 0xf00ca0c9  ! 831: LDUB_I	ldub	[%r18 + 0x00c9], %r24
	.word 0xb21d21e8  ! 832: XOR_I	xor 	%r20, 0x01e8, %r25
	.word 0xfc44a1fe  ! 834: LDSW_I	ldsw	[%r18 + 0x01fe], %r30
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbb50c000  ! 840: RDPR_TT	<illegal instruction>
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 32)
	.word 0xfe5c8000  ! 842: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xfa054000  ! 846: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xf00cc000  ! 848: LDUB_R	ldub	[%r19 + %r0], %r24
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 1b)
	setx	data_start_0, %g1, %r22
	.word 0xbb508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xb80ca0e0  ! 856: AND_I	and 	%r18, 0x00e0, %r28
	.word 0xb57c0400  ! 859: MOVR_R	movre	%r16, %r0, %r26
	.word 0xb8340000  ! 860: ORN_R	orn 	%r16, %r0, %r28
	.word 0x8595a069  ! 861: WRPR_TSTATE_I	wrpr	%r22, 0x0069, %tstate
	.word 0xbf510000  ! 863: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf615a12d  ! 867: LDUH_I	lduh	[%r22 + 0x012d], %r27
	setx	data_start_6, %g1, %r17
	.word 0xfa04a11a  ! 869: LDUW_I	lduw	[%r18 + 0x011a], %r29
	.word 0xfe5421c0  ! 873: LDSH_I	ldsh	[%r16 + 0x01c0], %r31
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 37)
	.word 0xf445e136  ! 877: LDSW_I	ldsw	[%r23 + 0x0136], %r26
	.word 0xf05c4000  ! 879: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xba35c000  ! 881: SUBC_R	orn 	%r23, %r0, %r29
	.word 0xfc44e10a  ! 883: LDSW_I	ldsw	[%r19 + 0x010a], %r30
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 1a)
	.word 0x9195a14f  ! 885: WRPR_PIL_I	wrpr	%r22, 0x014f, %pil
	.word 0xfa0c606a  ! 887: LDUB_I	ldub	[%r17 + 0x006a], %r29
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfa4d8000  ! 893: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf045c000  ! 895: LDSW_R	ldsw	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf04de146  ! 898: LDSB_I	ldsb	[%r23 + 0x0146], %r24
	.word 0xb12d5000  ! 899: SLLX_R	sllx	%r21, %r0, %r24
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 31)
	.word 0x879420ca  ! 902: WRPR_TT_I	wrpr	%r16, 0x00ca, %tt
	.word 0xb1504000  ! 904: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 905: RDPR_TNPC	<illegal instruction>
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 23)
	.word 0xf40521a7  ! 908: LDUW_I	lduw	[%r20 + 0x01a7], %r26
	.word 0xb62de097  ! 910: ANDN_I	andn 	%r23, 0x0097, %r27
	.word 0xb9510000  ! 911: RDPR_TICK	<illegal instruction>
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 14)
	.word 0xb551c000  ! 916: RDPR_TL	<illegal instruction>
	.word 0xb951c000  ! 918: RDPR_TL	<illegal instruction>
	.word 0xb1348000  ! 920: SRL_R	srl 	%r18, %r0, %r24
	.word 0xf60d4000  ! 924: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xfd1c8000  ! 930: LDDF_R	ldd	[%r18, %r0], %f30
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfe4c8000  ! 936: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xf40420f9  ! 937: LDUW_I	lduw	[%r16 + 0x00f9], %r26
	.word 0x8d95e030  ! 938: WRPR_PSTATE_I	wrpr	%r23, 0x0030, %pstate
hwintr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_52), 16, 16)) -> intp(2, 0, 5)
hwintr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_53), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc5ca09f  ! 950: LDX_I	ldx	[%r18 + 0x009f], %r30
	.word 0xbd2c2001  ! 953: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xb52d0000  ! 954: SLL_R	sll 	%r20, %r0, %r26
	.word 0xb7510000  ! 957: RDPR_TICK	<illegal instruction>
	.word 0xfc544000  ! 959: LDSH_R	ldsh	[%r17 + %r0], %r30
hwintr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_54), 16, 16)) -> intp(2, 0, 8)
	.word 0xb77da401  ! 963: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xfa55c000  ! 966: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xfa4c6174  ! 970: LDSB_I	ldsb	[%r17 + 0x0174], %r29
	.word 0xb634e142  ! 974: SUBC_I	orn 	%r19, 0x0142, %r27
	.word 0xf04d4000  ! 977: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf64561eb  ! 984: LDSW_I	ldsw	[%r21 + 0x01eb], %r27
	.word 0xba1c0000  ! 988: XOR_R	xor 	%r16, %r0, %r29
	.word 0xfa058000  ! 992: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xf444e07d  ! 994: LDSW_I	ldsw	[%r19 + 0x007d], %r26
	.word 0xbb518000  ! 995: RDPR_PSTATE	<illegal instruction>
hwintr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_55), 16, 16)) -> intp(2, 0, 3c)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb5a00540  ! 1: FSQRTd	fsqrt	
	.word 0xb03da0bc  ! 2: XNOR_I	xnor 	%r22, 0x00bc, %r24
	.word 0xb1a84820  ! 4: FMOVE	fmovs	%fcc1, %f0, %f24
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 2b)
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 39)
	.word 0xb9a44920  ! 10: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb1a80820  ! 12: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbd508000  ! 15: RDPR_TSTATE	<illegal instruction>
	setx	0xd52f818d0000ae59, %g1, %r10
	.word 0x819a8000  ! 17: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa80c20  ! 18: FMOVRLZ	dis not found

	setx	data_start_0, %g1, %r20
	.word 0xb3a4c9c0  ! 21: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb1a4c840  ! 23: FADDd	faddd	%f50, %f0, %f24
	mov	2, %r12
	.word 0x8f930000  ! 31: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda5c940  ! 32: FMULd	fmuld	%f54, %f0, %f30
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 17)
	.word 0xb4ac4000  ! 38: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xb7a50860  ! 39: FADDq	dis not found

	.word 0xb1a54960  ! 41: FMULq	dis not found

	setx	0x2da65cd100004c05, %g1, %r10
	.word 0x819a8000  ! 42: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbdab8820  ! 43: FMOVPOS	fmovs	%fcc1, %f0, %f30
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 21)
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 19)
	.word 0xb5518000  ! 47: RDPR_PSTATE	<illegal instruction>
	.word 0xb1aa0820  ! 48: FMOVA	fmovs	%fcc1, %f0, %f24
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1510000  ! 50: RDPR_TICK	<illegal instruction>
	.word 0xb1480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbba94820  ! 54: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0x87956109  ! 58: WRPR_TT_I	wrpr	%r21, 0x0109, %tt
	.word 0x87956004  ! 59: WRPR_TT_I	wrpr	%r21, 0x0004, %tt
	.word 0xbb641800  ! 61: MOVcc_R	<illegal instruction>
	.word 0xbfa81820  ! 64: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb3641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0xb9aa4820  ! 67: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0x8995207a  ! 69: WRPR_TICK_I	wrpr	%r20, 0x007a, %tick
	.word 0xbb3dc000  ! 71: SRA_R	sra 	%r23, %r0, %r29
	.word 0xb3508000  ! 72: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 77: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a00560  ! 80: FSQRTq	fsqrt	
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 18)
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 20)
	setx	0xc8f87f7d00002edd, %g1, %r10
	.word 0x839a8000  ! 88: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7a5c820  ! 94: FADDs	fadds	%f23, %f0, %f27
	setx	data_start_6, %g1, %r18
	.word 0xb1a80820  ! 97: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb3a449a0  ! 98: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb3480000  ! 99: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x879460e4  ! 103: WRPR_TT_I	wrpr	%r17, 0x00e4, %tt
	.word 0xbba00540  ! 106: FSQRTd	fsqrt	
	.word 0xb9a98820  ! 107: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a88820  ! 115: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a81820  ! 117: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5a8c820  ! 120: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb625210f  ! 123: SUB_I	sub 	%r20, 0x010f, %r27
	.word 0xbb510000  ! 127: RDPR_TICK	<illegal instruction>
	.word 0xb61d4000  ! 128: XOR_R	xor 	%r21, %r0, %r27
	.word 0xb7a5c920  ! 129: FMULs	fmuls	%f23, %f0, %f27
	mov	2, %r12
	.word 0x8f930000  ! 133: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a90820  ! 135: FMOVLEU	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb50c000  ! 141: RDPR_TT	<illegal instruction>
	.word 0xbe354000  ! 144: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xbfa81c20  ! 146: FMOVRGEZ	dis not found

hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 24)
	.word 0x83946143  ! 148: WRPR_TNPC_I	wrpr	%r17, 0x0143, %tnpc
	.word 0xb5a00560  ! 150: FSQRTq	fsqrt	
	.word 0xb9a00540  ! 154: FSQRTd	fsqrt	
	setx	0xdedc947800008c1f, %g1, %r10
	.word 0x819a8000  ! 157: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9194e0b7  ! 158: WRPR_PIL_I	wrpr	%r19, 0x00b7, %pil
	.word 0xb5518000  ! 162: RDPR_PSTATE	<illegal instruction>
	.word 0xbba88820  ! 164: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbba98820  ! 167: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a448e0  ! 168: FSUBq	dis not found

	.word 0xb9a58920  ! 174: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb7480000  ! 175: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x5df740af00000b9b, %g1, %r10
	.word 0x819a8000  ! 177: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a00540  ! 179: FSQRTd	fsqrt	
	setx	data_start_7, %g1, %r23
	.word 0xbd480000  ! 182: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9a00540  ! 184: FSQRTd	fsqrt	
	.word 0xb0a40000  ! 186: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0xb1a48860  ! 187: FADDq	dis not found

hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 38)
	.word 0x8d942058  ! 190: WRPR_PSTATE_I	wrpr	%r16, 0x0058, %pstate
	.word 0x8d9420da  ! 191: WRPR_PSTATE_I	wrpr	%r16, 0x00da, %pstate
	.word 0xb3a90820  ! 195: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbbabc820  ! 198: FMOVVC	fmovs	%fcc1, %f0, %f29
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb7a489c0  ! 208: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb3a00520  ! 213: FSQRTs	fsqrt	
	.word 0x8d942038  ! 216: WRPR_PSTATE_I	wrpr	%r16, 0x0038, %pstate
	.word 0xbf508000  ! 218: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa81420  ! 225: FMOVRNZ	dis not found

	.word 0xb1ab8820  ! 227: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a40860  ! 230: FADDq	dis not found

	.word 0xb21ca1b1  ! 236: XOR_I	xor 	%r18, 0x01b1, %r25
	.word 0xb61c4000  ! 239: XOR_R	xor 	%r17, %r0, %r27
	setx	0x60444be100007882, %g1, %r10
	.word 0x819a8000  ! 240: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a81820  ! 241: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x81942026  ! 242: WRPR_TPC_I	wrpr	%r16, 0x0026, %tpc
	.word 0xb3a00020  ! 248: FMOVs	fmovs	%f0, %f25
	.word 0xb1a48940  ! 251: FMULd	fmuld	%f18, %f0, %f24
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 30)
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 3a)
	.word 0x8794216d  ! 257: WRPR_TT_I	wrpr	%r16, 0x016d, %tt
	.word 0xbd510000  ! 258: RDPR_TICK	<illegal instruction>
	.word 0xb5a54860  ! 260: FADDq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 261: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa00020  ! 268: FMOVs	fmovs	%f0, %f31
	.word 0xb9a44820  ! 270: FADDs	fadds	%f17, %f0, %f28
	.word 0xbda409c0  ! 273: FDIVd	fdivd	%f16, %f0, %f30
	mov	1, %r12
	.word 0xa1930000  ! 275: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfaa0820  ! 277: FMOVA	fmovs	%fcc1, %f0, %f31
	setx	data_start_3, %g1, %r23
	mov	0, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfaa0820  ! 283: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5a48920  ! 284: FMULs	fmuls	%f18, %f0, %f26
	.word 0xbfa589c0  ! 285: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xbda88820  ! 290: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbba408c0  ! 292: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xbba588e0  ! 294: FSUBq	dis not found

	.word 0x8994e01d  ! 296: WRPR_TICK_I	wrpr	%r19, 0x001d, %tick
	.word 0xb3a48940  ! 298: FMULd	fmuld	%f18, %f0, %f56
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 33)
	.word 0xb9a90820  ! 302: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0x8795a0c8  ! 303: WRPR_TT_I	wrpr	%r22, 0x00c8, %tt
	.word 0x879460bf  ! 305: WRPR_TT_I	wrpr	%r17, 0x00bf, %tt
	.word 0xb5a589e0  ! 306: FDIVq	dis not found

	.word 0xb5a548e0  ! 309: FSUBq	dis not found

	.word 0x91956097  ! 313: WRPR_PIL_I	wrpr	%r21, 0x0097, %pil
	.word 0xb9aac820  ! 314: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbb51c000  ! 315: RDPR_TL	<illegal instruction>
	.word 0xb7a5c920  ! 320: FMULs	fmuls	%f23, %f0, %f27
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbaad6130  ! 324: ANDNcc_I	andncc 	%r21, 0x0130, %r29
	.word 0xbabd8000  ! 325: XNORcc_R	xnorcc 	%r22, %r0, %r29
	mov	1, %r12
	.word 0x8f930000  ! 333: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9194e0ba  ! 336: WRPR_PIL_I	wrpr	%r19, 0x00ba, %pil
	mov	2, %r12
	.word 0xa1930000  ! 337: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8394e1ba  ! 338: WRPR_TNPC_I	wrpr	%r19, 0x01ba, %tnpc
	.word 0xb5a90820  ! 339: FMOVLEU	fmovs	%fcc1, %f0, %f26
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb9a40920  ! 341: FMULs	fmuls	%f16, %f0, %f28
	mov	0, %r12
	.word 0x8f930000  ! 342: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 38)
	.word 0xba9de0d3  ! 347: XORcc_I	xorcc 	%r23, 0x00d3, %r29
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 35)
	.word 0xbba58860  ! 353: FADDq	dis not found

hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a98820  ! 364: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a409c0  ! 365: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb7480000  ! 366: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1504000  ! 368: RDPR_TNPC	<illegal instruction>
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 30)
	setx	data_start_5, %g1, %r16
	.word 0x87946076  ! 371: WRPR_TT_I	wrpr	%r17, 0x0076, %tt
	.word 0xba94c000  ! 372: ORcc_R	orcc 	%r19, %r0, %r29
	setx	0xf79ac00600002e1f, %g1, %r10
	.word 0x819a8000  ! 373: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa98820  ! 375: FMOVNEG	fmovs	%fcc1, %f0, %f31
	setx	0x8cd2226400003f0b, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a5c960  ! 381: FMULq	dis not found

	.word 0xb1a509a0  ! 382: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xbba94820  ! 386: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00560  ! 387: FSQRTq	fsqrt	
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3a588e0  ! 393: FSUBq	dis not found

	.word 0xb8c40000  ! 394: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xbda4c9a0  ! 395: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xbba489e0  ! 397: FDIVq	dis not found

	.word 0xbd510000  ! 399: RDPR_TICK	<illegal instruction>
	.word 0x8d946062  ! 401: WRPR_PSTATE_I	wrpr	%r17, 0x0062, %pstate
	.word 0xb09d2007  ! 402: XORcc_I	xorcc 	%r20, 0x0007, %r24
	.word 0xb3480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xba2ca0f4  ! 404: ANDN_I	andn 	%r18, 0x00f4, %r29
	.word 0xb9ab0820  ! 408: FMOVGU	fmovs	%fcc1, %f0, %f28
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 2)
	mov	0, %r12
	.word 0x8f930000  ! 410: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfaa4820  ! 412: FMOVNE	fmovs	%fcc1, %f0, %f31
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 32)
	.word 0xbdaa8820  ! 420: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbe3c4000  ! 421: XNOR_R	xnor 	%r17, %r0, %r31
	.word 0xbdab0820  ! 423: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa81820  ! 424: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a00540  ! 425: FSQRTd	fsqrt	
	setx	data_start_0, %g1, %r17
	mov	2, %r12
	.word 0xa1930000  ! 430: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3a00560  ! 435: FSQRTq	fsqrt	
	.word 0xbd540000  ! 440: RDPR_GL	<illegal instruction>
	.word 0xb7ab0820  ! 441: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb9a81c20  ! 444: FMOVRGEZ	dis not found

	.word 0xb5518000  ! 450: RDPR_PSTATE	<illegal instruction>
	.word 0xbdab4820  ! 451: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb4bc60cb  ! 453: XNORcc_I	xnorcc 	%r17, 0x00cb, %r26
	.word 0x9194612f  ! 455: WRPR_PIL_I	wrpr	%r17, 0x012f, %pil
	.word 0xb5a00040  ! 459: FMOVd	fmovd	%f0, %f26
	.word 0x879461ee  ! 460: WRPR_TT_I	wrpr	%r17, 0x01ee, %tt
	.word 0xb1510000  ! 461: RDPR_TICK	<illegal instruction>
	.word 0xbda81420  ! 463: FMOVRNZ	dis not found

	.word 0xbfa4c8a0  ! 478: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xbda4c920  ! 481: FMULs	fmuls	%f19, %f0, %f30
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 31)
	.word 0xbf540000  ! 487: RDPR_GL	<illegal instruction>
	.word 0xbb7cc400  ! 490: MOVR_R	movre	%r19, %r0, %r29
	.word 0xbfa80820  ! 491: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7aa4820  ! 493: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x8595a12c  ! 501: WRPR_TSTATE_I	wrpr	%r22, 0x012c, %tstate
	.word 0xbda8c820  ! 506: FMOVL	fmovs	%fcc1, %f0, %f30
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbbaa4820  ! 511: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa0820  ! 512: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x8795a086  ! 514: WRPR_TT_I	wrpr	%r22, 0x0086, %tt
	.word 0xb3480000  ! 515: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7540000  ! 519: RDPR_GL	<illegal instruction>
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 39)
	.word 0x8995e0fb  ! 523: WRPR_TICK_I	wrpr	%r23, 0x00fb, %tick
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a80c20  ! 525: FMOVRLZ	dis not found

hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb0bd2165  ! 536: XNORcc_I	xnorcc 	%r20, 0x0165, %r24
	.word 0xb1a00540  ! 537: FSQRTd	fsqrt	
	.word 0xb5a58860  ! 539: FADDq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 541: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a94820  ! 547: FMOVCS	fmovs	%fcc1, %f0, %f28
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, e)
	.word 0xbd504000  ! 551: RDPR_TNPC	<illegal instruction>
	.word 0xbda40820  ! 553: FADDs	fadds	%f16, %f0, %f30
	.word 0xb33df001  ! 555: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xb5a588c0  ! 560: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xbac4e1ed  ! 561: ADDCcc_I	addccc 	%r19, 0x01ed, %r29
	setx	data_start_3, %g1, %r22
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a00540  ! 570: FSQRTd	fsqrt	
	.word 0x8995a02f  ! 571: WRPR_TICK_I	wrpr	%r22, 0x002f, %tick
	.word 0xb7a00520  ! 578: FSQRTs	fsqrt	
	.word 0xbfaac820  ! 581: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00520  ! 582: FSQRTs	fsqrt	
	.word 0xbba54820  ! 583: FADDs	fadds	%f21, %f0, %f29
	.word 0xb7a80c20  ! 586: FMOVRLZ	dis not found

hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa408c0  ! 588: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xbfab8820  ! 594: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbda588c0  ! 601: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb1a80420  ! 603: FMOVRZ	dis not found

	.word 0xb1a40840  ! 604: FADDd	faddd	%f16, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8795e091  ! 615: WRPR_TT_I	wrpr	%r23, 0x0091, %tt
	.word 0xbda81820  ! 617: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbfa81c20  ! 621: FMOVRGEZ	dis not found

	.word 0x8394217f  ! 624: WRPR_TNPC_I	wrpr	%r16, 0x017f, %tnpc
	.word 0xbba50820  ! 626: FADDs	fadds	%f20, %f0, %f29
	.word 0xbf504000  ! 627: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x8995a01c  ! 633: WRPR_TICK_I	wrpr	%r22, 0x001c, %tick
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9abc820  ! 640: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbba589a0  ! 642: FDIVs	fdivs	%f22, %f0, %f29
	setx	0x890d79000000e8d, %g1, %r10
	.word 0x839a8000  ! 644: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1510000  ! 650: RDPR_TICK	<illegal instruction>
	.word 0xbba98820  ! 651: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a508a0  ! 652: FSUBs	fsubs	%f20, %f0, %f27
	.word 0xbba409e0  ! 653: FDIVq	dis not found

	.word 0xb9a00040  ! 654: FMOVd	fmovd	%f0, %f28
	.word 0xb5aa4820  ! 655: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a48920  ! 662: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb1540000  ! 663: RDPR_GL	<illegal instruction>
	.word 0xb73d7001  ! 665: SRAX_I	srax	%r21, 0x0001, %r27
	.word 0xbfa00020  ! 668: FMOVs	fmovs	%f0, %f31
	mov	2, %r12
	.word 0xa1930000  ! 671: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a00520  ! 672: FSQRTs	fsqrt	
	.word 0xb6adc000  ! 674: ANDNcc_R	andncc 	%r23, %r0, %r27
	setx	data_start_6, %g1, %r23
	.word 0xbfa44860  ! 679: FADDq	dis not found

	.word 0xb9a80420  ! 681: FMOVRZ	dis not found

	.word 0xbda00560  ! 682: FSQRTq	fsqrt	
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 0)
	setx	data_start_7, %g1, %r16
	.word 0xbba80820  ! 689: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0x8f930000  ! 690: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a00560  ! 691: FSQRTq	fsqrt	
	.word 0xb7a80c20  ! 696: FMOVRLZ	dis not found

	.word 0xbfa00560  ! 698: FSQRTq	fsqrt	
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, e)
	.word 0xbd508000  ! 707: RDPR_TSTATE	<illegal instruction>
	.word 0xbb3c0000  ! 710: SRA_R	sra 	%r16, %r0, %r29
	.word 0xb9a509c0  ! 715: FDIVd	fdivd	%f20, %f0, %f28
	.word 0x9195e1c8  ! 716: WRPR_PIL_I	wrpr	%r23, 0x01c8, %pil
	.word 0x839521c3  ! 717: WRPR_TNPC_I	wrpr	%r20, 0x01c3, %tnpc
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbd341000  ! 730: SRLX_R	srlx	%r16, %r0, %r30
	.word 0xb7a84820  ! 734: FMOVE	fmovs	%fcc1, %f0, %f27
	setx	data_start_0, %g1, %r21
	.word 0xb5a4c9a0  ! 741: FDIVs	fdivs	%f19, %f0, %f26
	mov	2, %r12
	.word 0x8f930000  ! 743: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995a1c1  ! 744: WRPR_TICK_I	wrpr	%r22, 0x01c1, %tick
	.word 0xbba408c0  ! 745: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xbda58860  ! 747: FADDq	dis not found

	.word 0xbf50c000  ! 748: RDPR_TT	<illegal instruction>
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 1)
	.word 0x8994e166  ! 752: WRPR_TICK_I	wrpr	%r19, 0x0166, %tick
	.word 0xbfa5c860  ! 755: FADDq	dis not found

	.word 0xbda00560  ! 757: FSQRTq	fsqrt	
	setx	data_start_2, %g1, %r22
	.word 0xb3a44860  ! 762: FADDq	dis not found

	.word 0xbda44820  ! 763: FADDs	fadds	%f17, %f0, %f30
	.word 0xb9a54860  ! 769: FADDq	dis not found

	.word 0xbfa5c960  ! 770: FMULq	dis not found

	.word 0xb6ac4000  ! 771: ANDNcc_R	andncc 	%r17, %r0, %r27
	.word 0xbda54960  ! 774: FMULq	dis not found

	.word 0xb9a40920  ! 775: FMULs	fmuls	%f16, %f0, %f28
	.word 0x919521d7  ! 777: WRPR_PIL_I	wrpr	%r20, 0x01d7, %pil
	setx	data_start_3, %g1, %r17
	.word 0xb5a00040  ! 781: FMOVd	fmovd	%f0, %f26
	setx	0x58ba85b200004f85, %g1, %r10
	.word 0x839a8000  ! 782: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7510000  ! 786: RDPR_TICK	<illegal instruction>
	.word 0xb3a4c8e0  ! 788: FSUBq	dis not found

	.word 0xb5a00560  ! 790: FSQRTq	fsqrt	
	.word 0xb3a4c840  ! 794: FADDd	faddd	%f50, %f0, %f56
	.word 0x8794a023  ! 796: WRPR_TT_I	wrpr	%r18, 0x0023, %tt
	.word 0x8594e1f6  ! 797: WRPR_TSTATE_I	wrpr	%r19, 0x01f6, %tstate
	.word 0xbbabc820  ! 798: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb3540000  ! 800: RDPR_GL	<illegal instruction>
	.word 0xb7a00520  ! 801: FSQRTs	fsqrt	
	.word 0xb3500000  ! 808: RDPR_TPC	<illegal instruction>
	.word 0xb5a408c0  ! 811: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xbfa54960  ! 812: FMULq	dis not found

	.word 0xb1a4c9a0  ! 813: FDIVs	fdivs	%f19, %f0, %f24
	.word 0x8d956171  ! 815: WRPR_PSTATE_I	wrpr	%r21, 0x0171, %pstate
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 22)
	.word 0xb3a80420  ! 818: FMOVRZ	dis not found

	.word 0xb7a4c920  ! 819: FMULs	fmuls	%f19, %f0, %f27
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a5c8c0  ! 824: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb751c000  ! 827: RDPR_TL	<illegal instruction>
	.word 0xbd520000  ! 828: RDPR_PIL	<illegal instruction>
	.word 0xbda9c820  ! 830: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb41d2057  ! 832: XOR_I	xor 	%r20, 0x0057, %r26
	.word 0xbfa98820  ! 833: FMOVNEG	fmovs	%fcc1, %f0, %f31
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, e)
	.word 0xb750c000  ! 840: RDPR_TT	<illegal instruction>
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5a80820  ! 845: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbda48820  ! 847: FADDs	fadds	%f18, %f0, %f30
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 13)
	.word 0xbfa98820  ! 851: FMOVNEG	fmovs	%fcc1, %f0, %f31
	setx	data_start_5, %g1, %r17
	.word 0xb7508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xb40ce040  ! 856: AND_I	and 	%r19, 0x0040, %r26
	.word 0xb57d8400  ! 859: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb634c000  ! 860: ORN_R	orn 	%r19, %r0, %r27
	.word 0x8595e190  ! 861: WRPR_TSTATE_I	wrpr	%r23, 0x0190, %tstate
	.word 0xbd510000  ! 863: RDPR_TICK	<illegal instruction>
	.word 0xbda548c0  ! 864: FSUBd	fsubd	%f52, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81c20  ! 866: FMOVRGEZ	dis not found

	setx	data_start_0, %g1, %r19
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3aa8820  ! 878: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb8344000  ! 881: SUBC_R	orn 	%r17, %r0, %r28
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 6)
	.word 0x91942064  ! 885: WRPR_PIL_I	wrpr	%r16, 0x0064, %pil
	.word 0xb7a80c20  ! 886: FMOVRLZ	dis not found

hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a80820  ! 890: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb3a588a0  ! 894: FSUBs	fsubs	%f22, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb12dd000  ! 899: SLLX_R	sllx	%r23, %r0, %r24
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a80420  ! 901: FMOVRZ	dis not found

	.word 0x8795e131  ! 902: WRPR_TT_I	wrpr	%r23, 0x0131, %tt
	.word 0xb1504000  ! 904: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 905: RDPR_TNPC	<illegal instruction>
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5a44840  ! 907: FADDd	faddd	%f48, %f0, %f26
	.word 0xba2d20b9  ! 910: ANDN_I	andn 	%r20, 0x00b9, %r29
	.word 0xb9510000  ! 911: RDPR_TICK	<illegal instruction>
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a44860  ! 914: FADDq	dis not found

	.word 0xbda80c20  ! 915: FMOVRLZ	dis not found

	.word 0xb951c000  ! 916: RDPR_TL	<illegal instruction>
	.word 0xbba409e0  ! 917: FDIVq	dis not found

	.word 0xb151c000  ! 918: RDPR_TL	<illegal instruction>
	.word 0xb1344000  ! 920: SRL_R	srl 	%r17, %r0, %r24
	.word 0xb1a80c20  ! 932: FMOVRLZ	dis not found

hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 20)
	.word 0x8d942005  ! 938: WRPR_PSTATE_I	wrpr	%r16, 0x0005, %pstate
	.word 0xb9ab0820  ! 941: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbda4c8c0  ! 945: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb3a48840  ! 947: FADDd	faddd	%f18, %f0, %f56
hwintr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_52), 16, 16)) -> intp(1, 0, d)
hwintr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_53), 16, 16)) -> intp(1, 0, 11)
	.word 0xbb2da001  ! 953: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0xb72d0000  ! 954: SLL_R	sll 	%r20, %r0, %r27
	.word 0xb1510000  ! 957: RDPR_TICK	<illegal instruction>
	.word 0xb9a00020  ! 958: FMOVs	fmovs	%f0, %f28
	.word 0xb1a81c20  ! 961: FMOVRGEZ	dis not found

hwintr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_54), 16, 16)) -> intp(1, 0, 36)
	.word 0xbd7d6401  ! 963: MOVR_I	movre	%r21, 0x1, %r30
	.word 0xb3a548a0  ! 964: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xb3a48960  ! 971: FMULq	dis not found

	.word 0xbba4c9c0  ! 972: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xb4356166  ! 974: SUBC_I	orn 	%r21, 0x0166, %r26
	.word 0xbbab4820  ! 978: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa0820  ! 982: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbba489a0  ! 985: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xbc1dc000  ! 988: XOR_R	xor 	%r23, %r0, %r30
	.word 0xb3aa0820  ! 989: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbb518000  ! 995: RDPR_PSTATE	<illegal instruction>
hwintr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_55), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda449e0  ! 997: FDIVq	dis not found

	.word 0xb9a9c820  ! 998: FMOVVS	fmovs	%fcc1, %f0, %f28

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
fsr_data:

	.xword	0x0000000000000000
	.align 0x1000
	.data
data_start_0:

	.xword	0x27a6b820af112e3d
	.xword	0x3958c1a16e1c43a6
	.xword	0x590f334461fb0dc6
	.xword	0x675f715b1653134e
	.xword	0x2ef5afd89a4052db
	.xword	0x8996987af8230348
	.xword	0x8a2f4bc2fb807908
	.xword	0x6ed49400f9efa313
	.xword	0x9327b5e36b526d99
	.xword	0xba664e4eae3941e5
	.xword	0x37145a456511a4d9
	.xword	0x6bf1c5f4d3c66e88
	.xword	0x59dae380da297e1a
	.xword	0x7f5c3e23f9e8aa75
	.xword	0x64ce44bdfc7842d4
	.xword	0xa8202d44e0110669
	.xword	0x1f82749eb26fa21a
	.xword	0xdc074acd2bcd0b1d
	.xword	0x37ffd8821de6b062
	.xword	0x479a8f981912895b
	.xword	0x168438ad9996db3a
	.xword	0xf4852b4f003f6cce
	.xword	0x2b7b0b0c9a9e1c0f
	.xword	0x281000a857a9769a
	.xword	0xedcc8fe37411dfed
	.xword	0xb7e8ff47c1eb5965
	.xword	0xa60b309b66a61dfc
	.xword	0xf1202508726955ca
	.xword	0xeb999b2a112b4fc6
	.xword	0xd2abae717ec669eb
	.xword	0x6431771d1af37dce
	.xword	0x5e594e9cf44d308a
	.xword	0x5408d59e5dd0e793
	.xword	0xf8e0e030f9af9ef6
	.xword	0x912c8093ccb136fa
	.xword	0x7b134a95f8e99b65
	.xword	0x5286a7af896b47c5
	.xword	0x21a4f7ea11db0b8c
	.xword	0x5593d54e9367dc33
	.xword	0x9d2c1caa6bf0048d
	.xword	0xd1bfbb10aad94221
	.xword	0xca6e24551151cd94
	.xword	0x9bc1a0ef5293bad3
	.xword	0x42c05ee7c2733881
	.xword	0x9b60574a18ee935f
	.xword	0x5e77bce1ed616c84
	.xword	0x8a36663f83ff3714
	.xword	0xd3f69de766e36bd0
	.xword	0xf17bf024052f73ef
	.xword	0x5137ae14a78c763e
	.xword	0xb2a1cf03a3b7de62
	.xword	0x44a41da4f25a8cb6
	.xword	0x7eb98ebd73971a23
	.xword	0xd531add5ea1c450f
	.xword	0x3f0a923ee305c592
	.xword	0x9d3fa424a7d3b1e0
	.xword	0x37ae7728a091c5a3
	.xword	0x72853e83948fcb72
	.xword	0x9d46d404c79c1983
	.xword	0x1940a92f9220a917
	.xword	0xcd8fed12269d7c19
	.xword	0xf5dab6840d6d1d71
	.xword	0x6b6c1aae6c0a38aa
	.xword	0xd3576779fc53389f
	.xword	0x488de08f75867b11
	.xword	0x6bb848641c3bf83f
	.xword	0x35edda18024d9176
	.xword	0xf6e2b22813e048f4
	.xword	0x1fb1eea4ff7aeea6
	.xword	0xb98511e52cdbf6b5
	.xword	0x6062f385c6b32488
	.xword	0xaee616ba90affea5
	.xword	0x178cc1c4d8f71a02
	.xword	0xc0ad216340937347
	.xword	0x9188b9ff1218b9ac
	.xword	0xfeb725aa8a3e2180
	.xword	0xc41cb55e41ba7fcd
	.xword	0x37a5d128a747642d
	.xword	0xb9cc8a2a146d4ba0
	.xword	0x03e0937ba8d6fdd4
	.xword	0xf9cbbe0ba0a4dee1
	.xword	0x57e63ca65076ef96
	.xword	0x54cb9d2c27b0000a
	.xword	0x70146a6e877802c5
	.xword	0x054c2d3d96541075
	.xword	0x03b6cae2eb819178
	.xword	0xe3f0d7aa40bcad08
	.xword	0x0199d246534e8d05
	.xword	0xad6b61d6c3b4c998
	.xword	0xa98997490ca8d892
	.xword	0xe98778d0309030b0
	.xword	0xb50e30ea517f8766
	.xword	0x0a6514a4894c0974
	.xword	0x2c2e2e6b0cd54e0f
	.xword	0x963bc68213e52a71
	.xword	0x9eeac6d0d2a4c918
	.xword	0x33a14890fca723e3
	.xword	0xd590c0a5df531bd1
	.xword	0x44ef45ab2f9a4d3c
	.xword	0x98744af48da2b4de
	.xword	0x8aaefbc131882d17
	.xword	0xa5d37f91251f770c
	.xword	0x31ba46c4c7ab1ed3
	.xword	0x2e7601380aea75ad
	.xword	0x6c3126b617df077b
	.xword	0xb75690bfb34c4e14
	.xword	0xe279f8022ce8f48d
	.xword	0x170a29acf36a08e7
	.xword	0x5c9d3f12b0866873
	.xword	0xe0c30e4bba52a424
	.xword	0xe30148c5b429f9e5
	.xword	0xc1eafd52ec87a46b
	.xword	0xf874d196422a2170
	.xword	0xd6adf9ed392da17b
	.xword	0xe229a3228360626f
	.xword	0x164fa72305c67f11
	.xword	0x4978e5607c196821
	.xword	0x04ebe3ef137a0a1c
	.xword	0x0ef28f909a76ae74
	.xword	0x345ed176de66ab8a
	.xword	0x2d418cafb021061d
	.xword	0x86a583409bb9134a
	.xword	0x20938b525613de1d
	.xword	0x4a77e7955cd0922f
	.xword	0x75dcbf8b7da42142
	.xword	0xf9b7816f0e75a658
	.xword	0xc74756f6338ab015
	.xword	0x071439790e84c3f8
	.xword	0x656f2bb6b8cc15e8
	.xword	0xeed499258c8eb308
	.xword	0xc5f2c7a3d08c1e09
	.xword	0x77ae3b9abc6d3eea
	.xword	0x87a43da6dab70781
	.xword	0x2224dca6eb6ec33b
	.xword	0x29b073436a4e6349
	.xword	0x737d5cacf388ee5d
	.xword	0x3202048736ebc9be
	.xword	0x1e7a46d696a09cb0
	.xword	0x858070a469a62b7f
	.xword	0xa8e377d43249f585
	.xword	0x14305d10e7b5c603
	.xword	0x7ef71ce0578e8bb5
	.xword	0x13601af94109a705
	.xword	0x4d8a58e6f3b9beed
	.xword	0x865b7dddec45695c
	.xword	0xbf2ae6bd693a2371
	.xword	0x23c5b448eb6e1745
	.xword	0x055b8650de68736a
	.xword	0x2f9db42c5aa4e349
	.xword	0x5fe2597d66010d1f
	.xword	0x03926ad94272fbc3
	.xword	0xb748bc23b1ad2a23
	.xword	0x3509d19d954f01aa
	.xword	0xee675b8e883435b4
	.xword	0xa97d53a151e10b0d
	.xword	0x96f0c3c1bdb0be96
	.xword	0x12cc9628aea991f6
	.xword	0xb8c9ae6e00b3793c
	.xword	0x92ba43c4978e73ca
	.xword	0x273a577b4b5c6176
	.xword	0x098972230f82ffcb
	.xword	0x928151fbb2380ca2
	.xword	0xb73e279b5ff5c16a
	.xword	0xc2c0bdbc90409c2b
	.xword	0xb1eb40f0a4db2c6c
	.xword	0xc6ea5623cde6f1c0
	.xword	0xf3c40c33b1118409
	.xword	0x3c85f97cc3016930
	.xword	0x66bb997a3f3adcd9
	.xword	0x61fc4d705a7e70a2
	.xword	0xb79dca7a9dfd256a
	.xword	0x9e44c7236fe50025
	.xword	0x0b30f7510493b49a
	.xword	0x83af6e74721dff74
	.xword	0x81c8b6854d259f57
	.xword	0x6509917ba07369bc
	.xword	0x6d7871c05b419003
	.xword	0xca356a87e6b86ec4
	.xword	0x799a919af2df89e8
	.xword	0xb6219e73fa9824a1
	.xword	0x5e546e7bb9f5f4fe
	.xword	0x53bcd38ed2b63c4d
	.xword	0xf8e225474dd044e9
	.xword	0x67a5de54e42f4c2d
	.xword	0xa5172a492b17a574
	.xword	0xcda1267d607d9f59
	.xword	0x68595540043ec036
	.xword	0x7c1d759008c4ecd4
	.xword	0xadb45b6af1402fc5
	.xword	0xfc5456ad6d8b3130
	.xword	0x3048706a6210edef
	.xword	0x147bc854263044f9
	.xword	0x9c9ced3cb843ebcc
	.xword	0xfe5c2d895ec53833
	.xword	0x9226c24f8b63c930
	.xword	0xdaafb579d4793068
	.xword	0x5d8010e6cf6cbec7
	.xword	0xc9a9b5c65e9b7042
	.xword	0xac746290daf0021c
	.xword	0xcccf2008409adf6c
	.xword	0x3c180b3d1f1e55f8
	.xword	0x991d4d7d4d50279a
	.xword	0x0ef9046959b79601
	.xword	0xd5b3c5e5345566e0
	.xword	0x5dce8ec79bdf3985
	.xword	0x438949c8fbe94301
	.xword	0xbf8f2dbfb929eb9f
	.xword	0x1a081e99ee80f8e7
	.xword	0x98dedd5f24a4fdba
	.xword	0xcb9b8e3a2bc32eeb
	.xword	0x0adf042e3fca36d2
	.xword	0xe4ad54dda7cef37f
	.xword	0x9b0be7cd41be6b6c
	.xword	0x492fca355a3290af
	.xword	0x84066927a1185ac1
	.xword	0x7b43e98a6f62a6b9
	.xword	0x72aba76ee09ff7cb
	.xword	0xeaf6503f88712058
	.xword	0xd512dc0fc5cd6262
	.xword	0x2112427a7d471dd4
	.xword	0x202cbf5455f33c3e
	.xword	0xcb13fc3896addd52
	.xword	0x6ace568883978179
	.xword	0xe5cbab56fd52a66c
	.xword	0x1543b896c0b7c16b
	.xword	0x050933b5c75652e0
	.xword	0x533149d5fdebba78
	.xword	0xb9a306f79bcba689
	.xword	0xe84ddce96c8102b1
	.xword	0xea5f0e4511a302df
	.xword	0x18660598f811b122
	.xword	0x359937aec45ca94f
	.xword	0xda95e23f2637fee3
	.xword	0x6e8a9fee5b32a387
	.xword	0x6a0d9b0b24154f47
	.xword	0x6d17e2e82db00127
	.xword	0xaf7dfbff4f013579
	.xword	0x168ecc5bf67f9fa7
	.xword	0xddb629a98d9d6ae8
	.xword	0x997aed4dd0478a11
	.xword	0xabfcd1926130a868
	.xword	0xe3e4ff9f75762907
	.xword	0xbdc06c2cd29d1b0f
	.xword	0x2117aaef5b1eb535
	.xword	0xe3f03472c6db0345
	.xword	0x53a33fdc87bf215d
	.xword	0x74d99385e59ee7d2
	.xword	0xf08ccc9f0f821980
	.xword	0x31ef9341295939a0
	.xword	0xa4d09e3f93cbbe4a
	.xword	0xc1debdd1a24a960d
	.xword	0xb22cf8965cae5bb4
	.xword	0x119d1d346da48af6
	.xword	0xee2ae00830e21f1d
	.xword	0xbc85585732cbb725
	.xword	0xad71cd5b422f7755
	.align 0x2000
	.data
data_start_1:

	.xword	0x6c19405169e522cf
	.xword	0x72ecf93c8b7eaf15
	.xword	0x58f1891d1452a6fa
	.xword	0x2afca452a441a4fd
	.xword	0x41bc6ccedb4e6d99
	.xword	0x9da87c5b502304db
	.xword	0x8f8c9fec4da99b79
	.xword	0xcffc08b96e81b68d
	.xword	0x172810572659a991
	.xword	0x8e861bbee12ec2da
	.xword	0x1094bd1f540eb4e0
	.xword	0x346a5092c9d2f960
	.xword	0x249dc1eb916ac5af
	.xword	0xb3bd80bcbb645b41
	.xword	0x3ecaf84e0bc31fe2
	.xword	0x3b99a6c445d8e614
	.xword	0x529d85ff8420e5c2
	.xword	0x43d7f388acca07b9
	.xword	0xa63410c670b45216
	.xword	0x4fea097114e828a0
	.xword	0xf76a1232d3a787b8
	.xword	0xd9921c1b2fffb935
	.xword	0x4baa8a8e27eecaa6
	.xword	0x7575f6cb83dc3350
	.xword	0x0f03e10dbc2292f0
	.xword	0xc8e1085b908d5382
	.xword	0x40bf0b31ed98c772
	.xword	0x9e5690df78bfedc7
	.xword	0x37d818d378428538
	.xword	0xa9836384cfc74c6f
	.xword	0x00539a4b11521f61
	.xword	0xceb451e08c8f2c3d
	.xword	0xcf583fa4c3d2c66f
	.xword	0xd6877ba0d441a629
	.xword	0x5f0967fc430c3100
	.xword	0x767bfb0a1ef8685b
	.xword	0x787300f451bfb579
	.xword	0x657ae241409bbf47
	.xword	0x40b71d0659285763
	.xword	0xf42ab74ed43517ac
	.xword	0xf46fdefe5e1ee36c
	.xword	0x6944372254b4b9a2
	.xword	0x7a573ddce45ad0d3
	.xword	0x81df7bf70fdd0ce0
	.xword	0x4b0272ef1529eb1b
	.xword	0x122513b2091a3852
	.xword	0x9c330f0da4454f8d
	.xword	0x1681526814954df2
	.xword	0x6c451b15d51d44bf
	.xword	0xcd513815b8729c80
	.xword	0x2c337631b70013e9
	.xword	0xa05fe4510addd3c4
	.xword	0xfe10b22e5c9b2d27
	.xword	0x3a1da176ac692fb4
	.xword	0x7029134d1b8965bb
	.xword	0x004d2823a4bcd5db
	.xword	0x8acc45b17dc8bb16
	.xword	0xe0795385a567d6b6
	.xword	0x2d09de1e7cad171b
	.xword	0x9fa15d42d2cfa776
	.xword	0x2358edb0e8eb4f38
	.xword	0x72ed789ebdbb1f83
	.xword	0xabe5cf0f1a86f65a
	.xword	0x82a442d399b4a3f6
	.xword	0x4800b02d72dd163f
	.xword	0x9ae049628b71f004
	.xword	0x31bc451f37fef566
	.xword	0xa8e9f6c1daacc59a
	.xword	0xc93f22b085d6988c
	.xword	0xfcfeb99262ea3153
	.xword	0x6c2b7b52053d4f3a
	.xword	0xda87946bf84d6c27
	.xword	0xc61effaf027141ec
	.xword	0xae05bf8d8e9f344d
	.xword	0x81b8fdd0abca6b2b
	.xword	0x67524192c666e81f
	.xword	0x915a59ad05b5eb98
	.xword	0xb098e9b75d9b27d6
	.xword	0x4ad7e3af5530020c
	.xword	0xd902989b222752d3
	.xword	0x8e723da3f4093e72
	.xword	0xf202a74f52dd6a3e
	.xword	0x80c4299e95f1b757
	.xword	0x677450b537cb11cf
	.xword	0xc57d2ba0872ccb58
	.xword	0x001d0d4cfccf5dea
	.xword	0x34b33d51a35d3c64
	.xword	0xc4f9a80af5b514fc
	.xword	0x0378a12e535092a4
	.xword	0x552a274961c4d000
	.xword	0xf1a2dfba6d87ea27
	.xword	0x3d91bc9d0e24f335
	.xword	0x1f6ee586a59d6d2f
	.xword	0xf4b565dbf3514534
	.xword	0x45a5542b0d190d01
	.xword	0xfaeec9859a108ff0
	.xword	0x898015d3ca24368c
	.xword	0x3dbab223da183e22
	.xword	0x925e64e9eb88b484
	.xword	0xe4ae165f3269d959
	.xword	0x35024083c429b805
	.xword	0x791f80b1c88437e4
	.xword	0x3d2f50375e900ac9
	.xword	0x4043b9a66e3fbf34
	.xword	0x3f31c7a4ea7a9983
	.xword	0x7f0632373b41115b
	.xword	0x4823d3333d5277b4
	.xword	0xf43ba3cafb09db43
	.xword	0xad76f0b40f29be22
	.xword	0x69b6650e3c006593
	.xword	0x2a28297e20cd0968
	.xword	0x21a0bc7f61929a68
	.xword	0xceedcf2d4ca549aa
	.xword	0x80e4f66e5dcb642c
	.xword	0x906476e3feaed80e
	.xword	0xf881b9cb511ee3a6
	.xword	0xef1b69a4ef1547c3
	.xword	0x6cd95a2a5050dccc
	.xword	0xde8196b515d24c7a
	.xword	0x0d9ba825ef2fd1bd
	.xword	0x08976329c57f01e0
	.xword	0x5593c743d7964c55
	.xword	0x7ab7ac3182af018d
	.xword	0x802d801e0ac352a3
	.xword	0xa68833356157047b
	.xword	0x7ae81e426df7d291
	.xword	0xb02caf6d35b4b66e
	.xword	0xe4d44c65bfd6c642
	.xword	0xbeea48ab750273b1
	.xword	0xc43ecafcddc1617e
	.xword	0xc7a842385759aabf
	.xword	0x219fe9be932712ae
	.xword	0x38c1eeaf66e976cf
	.xword	0x60901dc92469e4cc
	.xword	0xe24afc07e0b30b4e
	.xword	0xb5c5e467bd83c89d
	.xword	0xad8eb7b3909ca0c1
	.xword	0x1de60d977fbc164c
	.xword	0xe6cc4bbd352c2bfc
	.xword	0x3f0c6e84a16bce71
	.xword	0xb5c8132724ef6ee9
	.xword	0x0a2f7cfd8574a53a
	.xword	0xfcb7b79add764d71
	.xword	0xbf21f3a532212f45
	.xword	0xc4bbabca0bc68bbd
	.xword	0x40ea2c2d8247a60d
	.xword	0xa53a48e177e88925
	.xword	0x58114751f863cdea
	.xword	0x8f2b94d262136533
	.xword	0xa151c4fd5236b590
	.xword	0x46197c551624a61d
	.xword	0x660fe89a05af392a
	.xword	0x97b206033d3b757b
	.xword	0x7f4cb98572e291c9
	.xword	0xfb478710313d44ba
	.xword	0x2952dcfbb6cf770a
	.xword	0xea4b372dae72b4d8
	.xword	0xd17693653c8b3caf
	.xword	0x61a3c340acb9ff40
	.xword	0x0c694e1e73a2fff0
	.xword	0x1ed57fd4889de098
	.xword	0x1c61191ff5365f24
	.xword	0xe49e720216379dbb
	.xword	0x6a6a09c8e112fa65
	.xword	0xcfe4178a8cf6d286
	.xword	0x6f62de041cc33352
	.xword	0x7421b70520611e08
	.xword	0x6b6a016736fafb8f
	.xword	0xfec3b55702e7092c
	.xword	0xa6fa61ebb0c3a67d
	.xword	0x9a2241c00aa1f2d1
	.xword	0xbdf24211b97702e5
	.xword	0x71319622d5921aa8
	.xword	0x72884b9787833e48
	.xword	0x090b3791280bd81e
	.xword	0x661fefa3d5583367
	.xword	0x2d93f6bf0087eec1
	.xword	0xa51f7e1ab875fa29
	.xword	0xdb661e8e2642dae3
	.xword	0x617bd5d441aa54aa
	.xword	0xc9b002dbfe7d7d70
	.xword	0x0a43989336364ddd
	.xword	0x48b95eeea658ef72
	.xword	0x80c5d5b1d54a0d33
	.xword	0xe0be598e871732f3
	.xword	0x49940486764ee953
	.xword	0x57e06e1c918e059d
	.xword	0x882d65a86aaed80a
	.xword	0x3fbeae1160c02b43
	.xword	0xf7b78bb6e868433c
	.xword	0x494908ebbe78ff19
	.xword	0xce4c30f6b2085548
	.xword	0xd2eda1db717e5732
	.xword	0x5325c505440d033a
	.xword	0x043637a6afbf277b
	.xword	0xf192f01f967c4fc3
	.xword	0xe7cc4defb6814139
	.xword	0x9aa88fb611a4f016
	.xword	0xbe59661657a69290
	.xword	0x968b628c15ca1b6a
	.xword	0xeebefcec199783c8
	.xword	0x22d72288fdfd6fe3
	.xword	0xcab73f85e2bbb218
	.xword	0xad0b23cf3ebdaae9
	.xword	0x78d30041603229f7
	.xword	0x83dbc7672d71f541
	.xword	0x304c66218e9498ba
	.xword	0x302bdd5dc92c74da
	.xword	0x34dfb184bb466768
	.xword	0xdde455ba4d07e4aa
	.xword	0x63e08e06b9d67f53
	.xword	0xfc548f2d2127578f
	.xword	0x51c3883e64bb3cec
	.xword	0xf5e2f16e801a00b5
	.xword	0x109fca62f9d4044d
	.xword	0x3894d9ded6d7f545
	.xword	0x0061ee673ba6eac4
	.xword	0x01b97071db5214fb
	.xword	0x0ad75e76c010f720
	.xword	0x4d34e4fc590b0e0d
	.xword	0x8de1e75fa8cd4c1d
	.xword	0x319c31198dd00ece
	.xword	0x0e8217a66d312fca
	.xword	0x38ebde0519e56cc3
	.xword	0x547fa79081450d3c
	.xword	0xfb26fa60cc41de6f
	.xword	0x20a3df0d0714c21a
	.xword	0xfd9d86c08857b9ea
	.xword	0x37e50bf2ede7358e
	.xword	0xf315976c7490892b
	.xword	0x69422ed6550b0676
	.xword	0x0f1ed9b6582dd4b4
	.xword	0xfa31086aeccbddcb
	.xword	0x9049ea2dbd79d561
	.xword	0x5f5cb6caab6666c8
	.xword	0x10e2693602ca9c5a
	.xword	0xdd9e95cd31930774
	.xword	0x42ec508709330e92
	.xword	0xbaa2506685174d38
	.xword	0x11741c8bad22f2b7
	.xword	0x75b1030c0830f749
	.xword	0x638f300fc8dcf562
	.xword	0xe05b467eebc4a50d
	.xword	0x91b9bca5d8aad569
	.xword	0xa8ac8a4ff55473d3
	.xword	0xeadeb20cd429e0e7
	.xword	0x46ebbbc727270757
	.xword	0x164a8a4de28b8390
	.xword	0xbd1716f72e14749b
	.xword	0x5402a82122a3dff6
	.xword	0x8eef093e68b5727f
	.xword	0xa70e1115956144d1
	.xword	0xb6e2537d8f7ce1d6
	.xword	0xc7f05551ebd7027f
	.xword	0x249668f769702b58
	.xword	0x8fe3a712065852ba
	.align 0x4000
	.data
data_start_2:

	.xword	0xc697707232fe4a99
	.xword	0x6522c209df2f3ed1
	.xword	0x885d2eb8557776d2
	.xword	0x507e7c6bb5c3879b
	.xword	0x761546e610a5308b
	.xword	0x618a80c63a94deb9
	.xword	0x057416973cf03943
	.xword	0x1351051fcd0b8f58
	.xword	0x726e28d09d8d943f
	.xword	0xe7f7ecd8e7b17b8a
	.xword	0x1ff4e5f31c404b3c
	.xword	0xf7bcd6cbc460f0e2
	.xword	0xed7ebca4a28b9ab8
	.xword	0x575ee395f656f891
	.xword	0xe6eaaec7778bf012
	.xword	0x31e8f7635f797e52
	.xword	0x1496985b4a6ce1ef
	.xword	0xad894f479db17b03
	.xword	0x128277be027df9f9
	.xword	0x2e306f864de80b8e
	.xword	0x141d1bc74dd4e965
	.xword	0xdd09a6ce87501282
	.xword	0xfb7e50af4ab5ec4e
	.xword	0xd24abda8bbbc23dd
	.xword	0x89f85728751a0330
	.xword	0x7be88a2e3f275c52
	.xword	0x7607db71f7585a52
	.xword	0xc1aed71ad10c115f
	.xword	0xdceef5ab286d9ef0
	.xword	0xb756325355bc5ee5
	.xword	0x721d76ab83785fe9
	.xword	0x6cd419d9b6ed8015
	.xword	0x3baee97017e491ea
	.xword	0x318b1ab8c32f839a
	.xword	0xaeec45f0c86e6cbd
	.xword	0x71dca281a34bcdc3
	.xword	0x7916c5ca900b3311
	.xword	0x313464a89a37a202
	.xword	0xa1fb30b1f283e718
	.xword	0x25f24de325b6e22c
	.xword	0x29717649d9a9b1b5
	.xword	0x28c107feed8cdd8c
	.xword	0x67047894a1e5ade5
	.xword	0x375a56dd2e9375f5
	.xword	0xbe6458768531892e
	.xword	0x27ca6dddfdf8fa06
	.xword	0x9060208e806a6bee
	.xword	0xf4c752739462890a
	.xword	0x116cef49797132a5
	.xword	0xc2b99e7f0e9cc68e
	.xword	0x542c682fdb2538c4
	.xword	0x81c63baa0b09327d
	.xword	0x66784cd188f43897
	.xword	0x857d2bead5eb53fe
	.xword	0xe75bc857b03d7474
	.xword	0xd3f19caaa8af9b11
	.xword	0xe26302405176974d
	.xword	0x56b547058ed45faf
	.xword	0x7e0c10488b65541d
	.xword	0x2f88d8ede540ce80
	.xword	0x6ee9aeb6e6c713fd
	.xword	0xb07acf0818b948f0
	.xword	0x353aa74a6faaa960
	.xword	0xce5e553c321d2c01
	.xword	0x6f21eec0c3021f62
	.xword	0xfed77ea7ff6ee100
	.xword	0x5cd27cbea930eed5
	.xword	0xd641f9fe44ab5239
	.xword	0x3b97a4a985d9d092
	.xword	0x525fb6103b3b855d
	.xword	0x9be8baa7203adb8e
	.xword	0x71afbfa34107963c
	.xword	0x7da237b5168961e8
	.xword	0x10c14491a94a8cce
	.xword	0x5d603dadcd9a96b3
	.xword	0xb5e8b1fda0d223a2
	.xword	0x951c282d160c6510
	.xword	0x4ba399f7dcc5b208
	.xword	0x76dc8f4c35faea74
	.xword	0x25f18d32acd586de
	.xword	0xb984e0a5e8f87d07
	.xword	0xd9332661f5fb9d0a
	.xword	0x037e586793af5a66
	.xword	0x601d74290b43a067
	.xword	0x0b4733c6c9cbbf4d
	.xword	0x4665302bf26d96b3
	.xword	0xb3c03d61a64f133b
	.xword	0xbfe759993333f69c
	.xword	0x95fc208e9ae0fc8e
	.xword	0x6f2ee3b90fe2f203
	.xword	0x0f8fea68c949d66b
	.xword	0x7b60558cbbbdcfa7
	.xword	0x510b46086f57db5e
	.xword	0x4dce1a6cbdc88fb4
	.xword	0x5462422a406f0453
	.xword	0x867fde396b45cf0c
	.xword	0x68d877b5c8a0f8f8
	.xword	0xd17ef5cb1dbbbf05
	.xword	0x1899e575bc7a7f28
	.xword	0x089675c2d5c3942d
	.xword	0x1527be37c589cc63
	.xword	0x986ebbddb2527dc4
	.xword	0x9424cc7772207be8
	.xword	0x5d0973337f044989
	.xword	0x9ea98e09826eae35
	.xword	0xfb0f152bd67ebd3e
	.xword	0x385156db1f2e1b0f
	.xword	0xe50bb6d19a5d6308
	.xword	0x3e7bb7fc2bfdcde4
	.xword	0xbb090d5f8e60d50a
	.xword	0xdcfad831cf630303
	.xword	0x03956f34b3451a77
	.xword	0x6f3ee71ab8a7be39
	.xword	0x73129006994746cd
	.xword	0xcef30d9839de0ff6
	.xword	0x354264ad485ae781
	.xword	0xd7c5dece67c5d99e
	.xword	0x12af95ea9f3ca4d8
	.xword	0x46a089ec06264d42
	.xword	0x8b80e12748ee2e21
	.xword	0xc9647933a9ce5c58
	.xword	0xc37be50edce36da3
	.xword	0x6ac2d3effc9f5ce3
	.xword	0x3ea9e71edcbe54c8
	.xword	0xbb37ba52b51e31ef
	.xword	0x89a20e772ce9de9f
	.xword	0x9434b80a5b09de6a
	.xword	0xdbcc4c3bc62695c9
	.xword	0x4aecc7c911f509f5
	.xword	0x8107bbd0a5781368
	.xword	0x95f7e120159c2dcf
	.xword	0x9926a30c0ed16c4f
	.xword	0x123f556441c97105
	.xword	0x54b0ad76f8205af6
	.xword	0x2ee70306faed7e17
	.xword	0x785312200b7a5947
	.xword	0x0e7a6b6fc6caaab6
	.xword	0x6f339f89e40e5ab7
	.xword	0xedf8b2d4a4e45a89
	.xword	0xe24fe9b05428c776
	.xword	0x6f982be283674bb3
	.xword	0x7a4165db541c069b
	.xword	0x3d4bdf2a80f31f21
	.xword	0xf74f9095b1e22b5c
	.xword	0xf058306d55b5f28c
	.xword	0x8ad363e1988b6abf
	.xword	0xefa2b05d594b1cc2
	.xword	0xd201e81c099ba99a
	.xword	0xf42f65e954ef04bb
	.xword	0xbfff919e60866b96
	.xword	0xaf7f7108f7633792
	.xword	0xa1ba59c8f93d850e
	.xword	0xbc5fb9cc6ee9e972
	.xword	0xf71a8ca6f690c8a9
	.xword	0xd068455363d3de4f
	.xword	0x431b25eceba112cb
	.xword	0xc0391259b2dc8cae
	.xword	0x6c04b2daae0a36ad
	.xword	0xd19d700049c2e46c
	.xword	0xebe92817e6cdc6fd
	.xword	0xc1bf431a9d73821a
	.xword	0x2ab0b6dba8269e07
	.xword	0x62dd264982c1db9d
	.xword	0xb123d44e341c24a1
	.xword	0xf44fd740edabdfb3
	.xword	0xa4810e3d72294a98
	.xword	0xb46cb5742bc28e4f
	.xword	0xb64ff9b7cdbe0ac7
	.xword	0xf765efd87190adf2
	.xword	0xeebd0dbb12e01ca7
	.xword	0xe5c215be1912d0f9
	.xword	0x405dcb557e1061ad
	.xword	0x07aa48ea6464aa39
	.xword	0xb4ee48c50d4f6a4b
	.xword	0x81dea1903aefaf10
	.xword	0x860d8f1263a181fd
	.xword	0x477eaff92bb254bd
	.xword	0x42fe2eadd4807d9f
	.xword	0xef9c34c984a000ab
	.xword	0xf25824f21202231e
	.xword	0x475f982244ec18a7
	.xword	0xeb5532b2ea26c37f
	.xword	0x690cf99275fb66be
	.xword	0x269776222a24f0be
	.xword	0x417c272c2a140724
	.xword	0xbf1a0cd64e2172cb
	.xword	0x331b1b156d94d427
	.xword	0x4e79210e770fcf06
	.xword	0x1a6d0cefd563ce58
	.xword	0xe93512df03a0f3ef
	.xword	0x72e9a4c1a61a783e
	.xword	0xef956191a2cf38a1
	.xword	0x598d53e8443ed267
	.xword	0x5ec6f4011b1be524
	.xword	0xd3962fcceef671bc
	.xword	0xa9f3ad6ab4eaafeb
	.xword	0x1e27ddd77e9a4b4f
	.xword	0x2e41377be7efac60
	.xword	0x0d9c4aceb2e29747
	.xword	0xada515edf3114878
	.xword	0x9b8c5bf1c82c76ff
	.xword	0xe8ce73c729e44a54
	.xword	0x5dd9c5efd8a46553
	.xword	0x11b83ec48d862e39
	.xword	0xd8a8bb335305a800
	.xword	0x1ef268f6b81f2b25
	.xword	0x14d56b864d7d893c
	.xword	0xf229a72a3f5504d5
	.xword	0xdb10e5e3ea43290b
	.xword	0x4ee1de630fe30563
	.xword	0xe95600d95c99878c
	.xword	0x5d83d92bf1f21616
	.xword	0x2242deeacbb11ab3
	.xword	0x601828785ae95294
	.xword	0xd02d38348cca9ad2
	.xword	0xdc02a637c708008f
	.xword	0x43c60358b6852134
	.xword	0x1404d7db5c9cb6be
	.xword	0x6cabcd291c4cfc50
	.xword	0x0dbee1b7bdae2ef4
	.xword	0xf68f9130c2547bcb
	.xword	0x1355346ee849ba22
	.xword	0x8e79dad65528db2c
	.xword	0xdc1ec4d97d0cbe86
	.xword	0xaeb2ddc2d2426683
	.xword	0x4de80fc97672b00c
	.xword	0xef87f9b53fae5f4b
	.xword	0xe22856110b5c8c7a
	.xword	0x710968ca123d34cc
	.xword	0x86f2b5330f4ececa
	.xword	0xda5ab993cb6a9083
	.xword	0x664c284f42e36079
	.xword	0xd917c42f7691ded7
	.xword	0x051119b83297a4ac
	.xword	0xf316f74cca96e2b2
	.xword	0x94d95e1dcb737b80
	.xword	0x5405cd1f5ce23647
	.xword	0xe4b092cdf93de4f3
	.xword	0xb33c46b1bfbedfc7
	.xword	0x1581a9f3d9eff779
	.xword	0xe36fd62a1fa60dde
	.xword	0x82b2bc2b31bd0bb4
	.xword	0x0f6446577f652bbc
	.xword	0x2b1e423a739c551e
	.xword	0x6b7df960da1f5ca0
	.xword	0xd117e9934217bcc8
	.xword	0x9dff8512b92d1f7c
	.xword	0x6268ed07595fd22c
	.xword	0x3f9847a4aaab4c82
	.xword	0xf475955310a50c67
	.xword	0x3c13f75997b9d515
	.xword	0x1bb9123ba3beaeee
	.xword	0x3a6c652d69aa182e
	.xword	0x4594ae9f09412d14
	.xword	0x825ae9dcb49dbfe8
	.xword	0x13c9776de968c181
	.align 0x8000
	.data
data_start_3:

	.xword	0x67d43e2f25950782
	.xword	0x9f4b094f3b4f80c9
	.xword	0xe052a1d1bc574b41
	.xword	0x9feaa1fcf81e63f5
	.xword	0x43a92118d068daad
	.xword	0x6417002a9897c5dc
	.xword	0xfb4c8596cd0a0ed2
	.xword	0xa44f192a25601906
	.xword	0x341725a530db956a
	.xword	0xafdb230f833d12ef
	.xword	0x67a24d447c8e72c7
	.xword	0xafbf4e481c7e2a28
	.xword	0x5b7e785f1db90d84
	.xword	0x4a02a74f0c67a22b
	.xword	0xe4c4c26731093d60
	.xword	0xec07bd9be8fc665d
	.xword	0xb3719b7a22a3c473
	.xword	0x6b603238397987ca
	.xword	0x0f6039368bb45717
	.xword	0xa2e86b526783524d
	.xword	0x550cee1cdae8b421
	.xword	0x84b82c96d1dde812
	.xword	0x71460fe33e44f3df
	.xword	0x42a5cae3b68c54f5
	.xword	0xb6bbf7ad2f7c58d6
	.xword	0xc2287ed0d8b192b7
	.xword	0x8dcbb4bf298d4bd2
	.xword	0xd9827c82bc81d775
	.xword	0x3464fb53ea79e34f
	.xword	0x4b910b4b8efa24a4
	.xword	0xccfa0142167b447d
	.xword	0xe4d9c468cc20338d
	.xword	0x5d3a88a3aae1870a
	.xword	0x189f1ab823656eaa
	.xword	0x482e1848990fe52f
	.xword	0x4d6d5e569831a106
	.xword	0x3c32989e34ed4a3f
	.xword	0x46bda2e52cb34d2b
	.xword	0x7540f4b877d74f7e
	.xword	0xb52c856894a304f2
	.xword	0x3282d5e9f3b0b695
	.xword	0xa0f08fbab72d8735
	.xword	0x45efe6ad773a5696
	.xword	0x5298b45b07ef1d23
	.xword	0xdeacf77dbefcfb9f
	.xword	0xa36b64b2009fab51
	.xword	0x0c648fc9504fa690
	.xword	0x25cef6c2bb5f00c8
	.xword	0x241021f861d017bc
	.xword	0x2a5a1978c20ea8e4
	.xword	0x095e52a4e2598d1c
	.xword	0x5bbb8450473136a6
	.xword	0xc783c4522f8f726c
	.xword	0xb4db0709d1d8fb1b
	.xword	0x44320182c5fabf57
	.xword	0x811b35cac8d5c222
	.xword	0xc35369cac1c5e608
	.xword	0xdbd21d732e531ee5
	.xword	0xc63f5cad95ef3bfc
	.xword	0xeaedff4ceaad230c
	.xword	0xf2e6683f791054d7
	.xword	0xa54239512abf84d3
	.xword	0xe6177fc7589a4fd3
	.xword	0xec2d195021fa1b04
	.xword	0x22746dbd80113b7e
	.xword	0x828d8cd8d14e0e42
	.xword	0xe9985605aa4e8a09
	.xword	0xd42b49eb067157af
	.xword	0xae0b94ed98df38b6
	.xword	0x69146c8167b02818
	.xword	0x8152e5728d9eea4c
	.xword	0x6643866d5ed6b602
	.xword	0x96ece6a15e023814
	.xword	0x264aaa347c957416
	.xword	0xe4731d4b877b31cf
	.xword	0x7c4528d607a90f6f
	.xword	0xf4783c08a9ead99e
	.xword	0xa9543453f4328baf
	.xword	0xe87c17144969ed84
	.xword	0xee774bf6179c5e6a
	.xword	0xa5ab61600b59e844
	.xword	0xfb0a4c94e6c00127
	.xword	0x65eef92332701b56
	.xword	0xb990ac2dbcfa70cc
	.xword	0x04694a8ff77da516
	.xword	0xf722d03050134d69
	.xword	0x444a954b36578fef
	.xword	0x9c1c4e51748333c6
	.xword	0x4017cee6c30e80d3
	.xword	0x0309bf16af189ae1
	.xword	0x82fb977995a60df0
	.xword	0x9f577acb1c415a54
	.xword	0x0efc0e7b100ccd33
	.xword	0x0a07725367096236
	.xword	0xcde2e7a68bd3cc18
	.xword	0x32becfef4033460d
	.xword	0xf8c2d0888e022ff5
	.xword	0x7db488ffcb20647e
	.xword	0x6eff68b994387b9d
	.xword	0x9c867027a781acae
	.xword	0x88a4f552f79fb268
	.xword	0xd68877ba35f382dc
	.xword	0x1725e5d00261d71a
	.xword	0x015a2671781d9c98
	.xword	0xcd026a09496f53ae
	.xword	0x8bbc8ba6f6d489e8
	.xword	0x73b92073be76a779
	.xword	0x83890d6c2b42a67d
	.xword	0xb00b441ee7fe4baf
	.xword	0x8d53fa87549de1d3
	.xword	0x38d806b9c82fe2df
	.xword	0x28b78e6dd0b9f8f5
	.xword	0xc2eb356a8889ee16
	.xword	0xe21add5178d22ed5
	.xword	0x02d5b0d6c77472fb
	.xword	0xa34d9ad9317b5c12
	.xword	0x4db0c1b56b3ecf9f
	.xword	0x183dfa68c20f8df9
	.xword	0xb3e75d5b061931ab
	.xword	0xce0d311b598b25bf
	.xword	0x739b95bada1005be
	.xword	0x29d3ae2b48cee146
	.xword	0x145e40986f3bce83
	.xword	0xddea7e1d5952801b
	.xword	0xf1b7726bdd473f8b
	.xword	0x8e5dda2d2e7eac8c
	.xword	0xf74859871419d99b
	.xword	0xf10303b456d19adc
	.xword	0x6645f08f098b407c
	.xword	0x3d8cccab640cc6e3
	.xword	0xba17b9e6da206d5d
	.xword	0x98608a94de6be267
	.xword	0x4b37422fc2524dc9
	.xword	0xe75c97735fa826e6
	.xword	0xe0bcbf014f562bbd
	.xword	0xbc4d4e4f98cc1491
	.xword	0x50c985e9cea393a0
	.xword	0x64c64d8c796a1ef4
	.xword	0x8990495f80fb9f6c
	.xword	0x0fc10251e2778dc3
	.xword	0xdfcde2964283aab8
	.xword	0x758048aced51be9c
	.xword	0x4dc43884070b6393
	.xword	0xa4cdf772fca06f14
	.xword	0x6b618129ffb43b08
	.xword	0x1983519f7462e467
	.xword	0xac3b4378fcde82f8
	.xword	0x7e1028bd095effa1
	.xword	0x879af6ba8fc00e31
	.xword	0x48166b1b100790cb
	.xword	0x282e13ac85932428
	.xword	0x8c90e4061680abd8
	.xword	0xcf8ee8cd7b961541
	.xword	0x455d815731f87413
	.xword	0x9f1dc356a5f6a81d
	.xword	0x6a60fdb7fb6120a9
	.xword	0xd3d9dc222cd45cfc
	.xword	0x04302f44798a532f
	.xword	0xc599eef7202bc319
	.xword	0x249f63bf3460ec35
	.xword	0x294ed0703243ce40
	.xword	0x3d2d836f04cd7843
	.xword	0xb56d34f31f68a206
	.xword	0x210a2faa4a46de99
	.xword	0x08b7155d71dd45eb
	.xword	0x6173333702449a8d
	.xword	0xc902e4a5457810c8
	.xword	0xbe6aea5efa1fceed
	.xword	0xc2a84498f3a4f52b
	.xword	0x7d5de239f5864bc5
	.xword	0xc6377b251378d647
	.xword	0x47e5ccacd18b915a
	.xword	0xba7293e4df6bea89
	.xword	0x19f066d2f797e2db
	.xword	0xb36a7a9e75e2a74e
	.xword	0x2d6af8f9c249006a
	.xword	0x39a03bb182aa6d70
	.xword	0xe1e0f23bcb2eda8c
	.xword	0x202033c9dc26a277
	.xword	0xba7f1afb49364a79
	.xword	0x3acc84a17893dca3
	.xword	0x4926ffbeacca62a4
	.xword	0x0bc692f537b7f14e
	.xword	0x6062a5e715f546d2
	.xword	0x4c77051aba89d332
	.xword	0x72a0fa9ed4f5c3cf
	.xword	0x4dccda70d4c2a2d6
	.xword	0x80c958d3fa1b0291
	.xword	0xd86356903a206cb9
	.xword	0xc967e036cc340fc0
	.xword	0xfde6b7dd05964df6
	.xword	0xec6b30e79e9ab642
	.xword	0x0f50aa8c81e4054e
	.xword	0xefb342752c959cba
	.xword	0x7b5b0ace85d8f964
	.xword	0x0719e789b0374dfd
	.xword	0xbd7b283cf45b3ef8
	.xword	0xec1e13a48edda52f
	.xword	0x44918f6b847f298e
	.xword	0x63f1e860a7c73029
	.xword	0x2bc21dd6be96b67b
	.xword	0xd301f11e6416233b
	.xword	0x97815f00335182fb
	.xword	0x646302267c83b587
	.xword	0x4c83207cc9457fa4
	.xword	0x87e63909e4d00908
	.xword	0x927384d4b30fde10
	.xword	0xc889775559ab7d46
	.xword	0xd9ae9bcfd9a0c7d1
	.xword	0x56b7b504b02a8ad3
	.xword	0xfd12df724bcae047
	.xword	0x15d24a3025439336
	.xword	0xde916e0afa2d06bf
	.xword	0xe201df57f94740bd
	.xword	0x053ed26ad23eb8e5
	.xword	0x86affde7f47a98d0
	.xword	0xef61de96b6c0da91
	.xword	0x74ae60e600f0ebfa
	.xword	0xde10c188a541f5b8
	.xword	0xca918d50addd8335
	.xword	0xf9794dccf4e2834c
	.xword	0x4a78685a9775133a
	.xword	0xe2fd0a0e2297a806
	.xword	0x7e23323ae6669035
	.xword	0x21ae218671853535
	.xword	0x2cc9c1db38536471
	.xword	0x19e133fadce575a8
	.xword	0xe646b068fac96d24
	.xword	0xdead6588d5af4049
	.xword	0x6debcc75fbf46633
	.xword	0x519f408967e6ee35
	.xword	0x27327ced06a56995
	.xword	0x7f1539800f06b4c6
	.xword	0xeb13d7e7cd32efb0
	.xword	0xdeb697264b0dfb1e
	.xword	0xf47ebc7ff103ffa7
	.xword	0x2274b8843b904134
	.xword	0xac0f7cc05662a53e
	.xword	0xadeaea340121dd44
	.xword	0xc9682e4800793991
	.xword	0x309bc07c9ea11031
	.xword	0xb6d399a3940186fd
	.xword	0xb8a3a7451aea68f1
	.xword	0x83a9dae1972c8146
	.xword	0xbab41efe1de461ea
	.xword	0xf50ba9c4315eee36
	.xword	0x59823bde98144d80
	.xword	0x2e3d06b2d26effb2
	.xword	0x9bfeb894ee7b8017
	.xword	0xbf521207ba1cd091
	.xword	0xc3e5ea0286ec326e
	.xword	0x625df4c930174791
	.xword	0x1f9b30428a6a9cbc
	.xword	0xdc3e67c74c4938d7
	.xword	0x520dda0ee3cff98d
	.xword	0xe22ea7ba5536b6a7
	.align 0x10000
	.data
data_start_4:

	.xword	0x568ea05e9da49a8e
	.xword	0xaad38533b236fbbb
	.xword	0xe5e709b934f076d5
	.xword	0x874e29ab4b8c301f
	.xword	0x4c15eb681db3ab26
	.xword	0x6bf2b583eafc4dfa
	.xword	0x619c30744eb15d6c
	.xword	0xab3d5fb537a3dae3
	.xword	0x3ca79e99b7dcaf6c
	.xword	0xfc2fbb3adca39d6e
	.xword	0x2f0fe8b457de3e5a
	.xword	0x2a45bc386b121116
	.xword	0x8725c169ba93daff
	.xword	0x1c3d60ec1e74424c
	.xword	0x545e0ee1ac50763e
	.xword	0x98ae350d2406b55a
	.xword	0xc82154eda4c6352f
	.xword	0x4e54d3bade964ade
	.xword	0xa8972d921777ef90
	.xword	0x2339e3786ca307f6
	.xword	0x52d99cb8a5aa2b1e
	.xword	0x794bac856debdaef
	.xword	0x724a4ff057b2a49c
	.xword	0xcb06ea3947ba60e7
	.xword	0xab9efa97a0973031
	.xword	0x305ec41d516804fa
	.xword	0x66e6a7960d2f270c
	.xword	0x7da2374f23bbeead
	.xword	0x6e56a83752eced80
	.xword	0xe3d8a6395648963b
	.xword	0x65634ee219e95bc2
	.xword	0x0c222741d4bb1cac
	.xword	0xc24118454daefca5
	.xword	0xa9449530db3dacb4
	.xword	0xa6458fd10674a365
	.xword	0x854172d7c8ed0cb5
	.xword	0x321dd446b9e09260
	.xword	0x43eaeff3d3d093fb
	.xword	0xd12c38e09ae6b023
	.xword	0x99e5c3ed089edb98
	.xword	0x9bc0fc41419d6fbe
	.xword	0xcde26b8e19fdd1f3
	.xword	0x1d89010d08d16cf9
	.xword	0x0c1ba90dc4637209
	.xword	0x23d78791d208397a
	.xword	0xa6a0eca32ebcb97d
	.xword	0x5378dfd2ae0e3e81
	.xword	0xfc0462182891f274
	.xword	0x65584c424aea0ecd
	.xword	0x458177fc29d9c76c
	.xword	0x8cd48ec7f38f2adf
	.xword	0xab1e4939da1d343f
	.xword	0x5676646b0afc3188
	.xword	0x50921a502033149e
	.xword	0x07af6dfb724b3194
	.xword	0xa195ca9577733be1
	.xword	0x7c66c18cbde4af88
	.xword	0x39934ee02ea6c2c4
	.xword	0xc30a595e678b50dd
	.xword	0x6b5fe4d5964b70ed
	.xword	0xdc26a332384ad29e
	.xword	0x59aff10f8f1bc73a
	.xword	0x9b9fe8925b79628e
	.xword	0x6a923075d0c2caac
	.xword	0x4ff85daa975c2ccf
	.xword	0xa5cb98810abfa551
	.xword	0x02784bd723d9f8ae
	.xword	0xba66a9c9429738de
	.xword	0x9f31316d9e6f46bf
	.xword	0xfbdcc79a44bac34c
	.xword	0xd29da9df0dd5a1b2
	.xword	0x8264a302b832a271
	.xword	0xe2bbaf36595eb911
	.xword	0x75b3fbd5582e4f04
	.xword	0x74a17ef01d09deed
	.xword	0x406daee315dd300f
	.xword	0x4ec2b5a7a4fb4f89
	.xword	0x69ccf18020191647
	.xword	0xe0f373b1bcbbbc7a
	.xword	0x378008821607ec97
	.xword	0x57047e3561fc9770
	.xword	0xeda0c6ed5cb105de
	.xword	0xf33552425973fe05
	.xword	0x31561ae3ecbbbce2
	.xword	0x38185960d8e6069d
	.xword	0x204f024b2c7f0774
	.xword	0x99e48baab4162051
	.xword	0xef9b93e6699be1a6
	.xword	0x6049fb4d0c4772d1
	.xword	0xc70038b8cdeb85fb
	.xword	0xe3a805050ee74a4b
	.xword	0x7581296804338659
	.xword	0x00bcf235100b3753
	.xword	0x525d625e0651fab4
	.xword	0xaaf965a41a5ba352
	.xword	0x049e11b0ef539aec
	.xword	0x2ae8f98732786de3
	.xword	0x2168509de05c1dda
	.xword	0x31322f922b2f3cde
	.xword	0xe51bcda9333fd587
	.xword	0xa44e674563c721c8
	.xword	0x3933f8cb0cbf28b9
	.xword	0x54b562e20973ddab
	.xword	0x4b2dccaab4e8baa8
	.xword	0x070051a6e942c546
	.xword	0x2cf3dcb21f47fb38
	.xword	0xae93048f410894d8
	.xword	0x609a0450e91d13dc
	.xword	0xccb87ec6e151c8ff
	.xword	0xf5e0e4c375428de9
	.xword	0x1091312166442178
	.xword	0x8f3087df13dd099a
	.xword	0x64aefb73b8f7afa6
	.xword	0xc63efded045075d7
	.xword	0x081e2774c10d2648
	.xword	0x8ac530640b54881e
	.xword	0xeb1367b893cb672a
	.xword	0xa2ed4e19cb69f8d6
	.xword	0xef3bbbf19b3ebd42
	.xword	0x1549f45ce3b27604
	.xword	0x21a9588f61588e20
	.xword	0x478446d993b83f00
	.xword	0xcd705fe38d27d2f1
	.xword	0x46a0b79395002013
	.xword	0x5ed6414e5b43d5f0
	.xword	0x92ab04cce781e9e1
	.xword	0x2c11845dd2923a7a
	.xword	0x9927cd34ba04dbe9
	.xword	0x7950b6c1aeb48332
	.xword	0x1b84b57c693dbd39
	.xword	0xb942d82382f19565
	.xword	0x0447f58e5382ed13
	.xword	0xf63988453c6333f6
	.xword	0x7f30ec14c44f8733
	.xword	0x1527890ef74eb43b
	.xword	0xcfe3501605a749e5
	.xword	0x8a9b9d7399a94481
	.xword	0x7ac5161920b2edc8
	.xword	0xf1aad632995c95bf
	.xword	0x3659392df5d7cd8f
	.xword	0xde73b9db67e10517
	.xword	0x2a7a1564982c5719
	.xword	0xe10293c082e12c0e
	.xword	0x579247435500a519
	.xword	0x802bdedb85bb9e93
	.xword	0x4e09f29ceefb10af
	.xword	0xbd974b541e1ea5ec
	.xword	0xa2840fb61ef28b03
	.xword	0x18fd7a05e27d7dc4
	.xword	0xa706d1552aa21c81
	.xword	0xe60a41ce3f83a138
	.xword	0xd92e38b231fc08be
	.xword	0xa508a62a07ece234
	.xword	0x997bd0a7339a0a4d
	.xword	0x2cdb9a30d1d1360a
	.xword	0xd817b05864291bd3
	.xword	0x4e2094594dc374e2
	.xword	0x576781f1cd54e235
	.xword	0x3073989df1a50dfb
	.xword	0x74a344102799974a
	.xword	0x7a2e6a33b393842d
	.xword	0xe4663646208f4a6e
	.xword	0x34a39ad9cce5a4f9
	.xword	0x0b77d8cb7e9a817f
	.xword	0x0aff16ef841d5d45
	.xword	0xa596ad0d07dcb035
	.xword	0x9761789f34e54ed6
	.xword	0x9906a4147ea504d0
	.xword	0x66dd818563289fe3
	.xword	0xb2ee62a7e554c989
	.xword	0xaa7c96c6483bcea7
	.xword	0xb02bc89d68a07bba
	.xword	0x6e03a3f7d4f2945e
	.xword	0x8dac2dfb54c6dc23
	.xword	0x3b66a66c0c7a7860
	.xword	0xb43d05d476cf5d3b
	.xword	0xce4e0390be41920a
	.xword	0xf4f8088319ca27a7
	.xword	0xabb8a014e3c686f7
	.xword	0xa7cf56a1f102cc6f
	.xword	0xd624d4d06787ebee
	.xword	0x87d22c5f8359172a
	.xword	0x458e543784679d72
	.xword	0x3276283b58185f0b
	.xword	0xa174de9a927bc0a8
	.xword	0x9e6ced4cd46e43b1
	.xword	0x3269f240e881d705
	.xword	0xc20d3fdd47302702
	.xword	0x264ce4c884244c19
	.xword	0x4710ee2e4a2b5186
	.xword	0x1f91ae4225112ec7
	.xword	0x5c9434666c874d80
	.xword	0xf19bbb2df8792442
	.xword	0xb13bf2a3e63ab3f3
	.xword	0x7213f9a3610fc2be
	.xword	0xc2cd725027394181
	.xword	0x4f8f62bcb1b7cd18
	.xword	0x706500121d9d27e1
	.xword	0x30c7cd412170025d
	.xword	0x09e6487f566b2925
	.xword	0xaf35255722e48ecc
	.xword	0x3f3cc3fd4828c133
	.xword	0x5721022bddf5a554
	.xword	0x37acef67e05f9195
	.xword	0xfca09b26b572f626
	.xword	0x47f1cd8b964c47bd
	.xword	0x90d9c2a4f8f49fbf
	.xword	0x7751bfecb1996028
	.xword	0x042c6ca49f4f4e8c
	.xword	0xe03b47fe397e51f8
	.xword	0x7c3a97b593885566
	.xword	0xb4d13d12018232e9
	.xword	0x5751cf9cd5309e8e
	.xword	0x0b0d62bdc6a3a03d
	.xword	0xf1684bdce9279cf1
	.xword	0x617f48e087070e6e
	.xword	0x41810070518ff45a
	.xword	0x80cc98f8e145db77
	.xword	0x7756697139124406
	.xword	0x13fe75f3e727a76c
	.xword	0xd476c50f90574ebe
	.xword	0xbb4adb17625f5a0c
	.xword	0x04dc9a64cc8a2ddc
	.xword	0x84b62f27fea4443e
	.xword	0x4f5b91989ee8083c
	.xword	0x23c2c9c7f5aaa7cf
	.xword	0x009ae811abec2762
	.xword	0x79960e9cc0022f81
	.xword	0x1c715f67547cfdb9
	.xword	0xcdf355fcd683fba3
	.xword	0x1189e2be75007f4a
	.xword	0xea00874eaad55491
	.xword	0xb2172d1db8017566
	.xword	0x4ea7098b2a8e0a6d
	.xword	0xa04d3289a980374f
	.xword	0xd214551438005b3c
	.xword	0x5a704c599e6aca5c
	.xword	0x5bf20e646b430b27
	.xword	0x3e3821b9d4050dd7
	.xword	0xc29a93e0a2a11d37
	.xword	0xa5a6aa3973591572
	.xword	0x81162309bb4198c4
	.xword	0x7ca351e9bc8f9801
	.xword	0xeb39739326033396
	.xword	0x1a18c26c34921b08
	.xword	0x4d96b8281b1344a0
	.xword	0xd1b658f68d157072
	.xword	0xb8933776ddca0ca6
	.xword	0xebccc3ee0ba2696e
	.xword	0xf6bef85ea98c142b
	.xword	0x3fa2e6e825f0dac1
	.xword	0x62d85de554020954
	.xword	0x9df2f51971627964
	.xword	0xae6007f50f723fe0
	.xword	0x8b31b161140afd62
	.xword	0xfd7bc55665bc209f
	.align 0x20000
	.data
data_start_5:

	.xword	0x990d11f562b224ef
	.xword	0xf6be8f98f5a6d552
	.xword	0x8ccb4945b34cf4f9
	.xword	0x41130f890910fee4
	.xword	0xaddc4e30962b99e4
	.xword	0x074415e3b79b0f62
	.xword	0x1c15cf7837804f2c
	.xword	0xb0e838909007b8a3
	.xword	0x583dab6910a46b69
	.xword	0x1e31975d4400fc8f
	.xword	0x99ba7572ab35e14e
	.xword	0xe27180be5614405d
	.xword	0xa72ac4c70dcf1222
	.xword	0x0d293549b0a56f80
	.xword	0x498dfab46b84858e
	.xword	0xf2a5621888dd3cdd
	.xword	0xd80fa578f43fb28c
	.xword	0x8883167ac5a23167
	.xword	0x70f260605470d7ff
	.xword	0x0b2246075900b4b9
	.xword	0x14a825b938a55dd5
	.xword	0xe15ad7ff1259a779
	.xword	0x0898c0a476d02ef9
	.xword	0x4025ca8b8be15bff
	.xword	0x21bc9d48ce6b3017
	.xword	0x0f025367eda46d82
	.xword	0xa60eded4a70c195a
	.xword	0xc15de613932172ce
	.xword	0xe07846835b187194
	.xword	0x7f1c2dbb645e36a4
	.xword	0xa92a6f4b00b9ca5f
	.xword	0xe428697fdad0eec0
	.xword	0xb5f6c300ccce1deb
	.xword	0x52f4235fb050f7bd
	.xword	0x578ab23cd44579b7
	.xword	0x5dbb89f57222f4c2
	.xword	0xa9c69ef5f4238870
	.xword	0xdc154821983bd700
	.xword	0x07feaac220d84a1e
	.xword	0x4d1a4a6d41c19b61
	.xword	0xaf7f1ee52150e22f
	.xword	0xf0f93046e5e57611
	.xword	0xaf435fa580d78654
	.xword	0xa74c6fe2d23d72d2
	.xword	0x2aa7b6b3f8be3142
	.xword	0x45acb2367c33d0e3
	.xword	0xcc35bdae55d06217
	.xword	0xd237093175759cdc
	.xword	0x6c24634980c4745c
	.xword	0xc0fb7aaf012ff1ac
	.xword	0x539680413870bde7
	.xword	0x3063260e4000f0de
	.xword	0x3e66cefe44c85eed
	.xword	0x823458e568a8cbcd
	.xword	0x6111c4eff7749455
	.xword	0x8b4dc50a1b1332af
	.xword	0xf9f92929434f88e8
	.xword	0x286f9bc2268ad65e
	.xword	0xa1f99f73f4286b9a
	.xword	0x5930d129d168e214
	.xword	0x5c42ed3550cb3450
	.xword	0xdfe2c5b176fffa84
	.xword	0xae71a38b316a9b0f
	.xword	0x644dbd5af85c65b4
	.xword	0xd72f92e482e2ae61
	.xword	0xb4a7dcc310963330
	.xword	0x510e986e2c2d6216
	.xword	0x24148ce5ed27f278
	.xword	0xc989fdfb9c38df3e
	.xword	0xc685dd92889d89b3
	.xword	0xcad2e4ff38bae054
	.xword	0x57c8c6f6daacd034
	.xword	0x0f80e65abff26522
	.xword	0xc4978f74c2c79cca
	.xword	0x3e1e791f50c7929a
	.xword	0xccf58c5b4ebeb7e3
	.xword	0x03afb9f33f4751c4
	.xword	0x78f060a46f83945e
	.xword	0x3ea8f6b8ed4b4612
	.xword	0x26351f5b54679322
	.xword	0x3a4d22ba459d492d
	.xword	0x1b312b6160e994bc
	.xword	0x9d56779d7c5ac6b4
	.xword	0xf9c57ff63e58c350
	.xword	0x7381afb144adb374
	.xword	0x320f48833de5f2b8
	.xword	0xc2ac5a4a60f1ce29
	.xword	0x5fa72eb19cf9303f
	.xword	0xc407eef606e0d661
	.xword	0xae957699e11c663c
	.xword	0xf084cd76fed820e6
	.xword	0xbf8ce885bf30a5e5
	.xword	0xc16a1ef0cadc195f
	.xword	0x14d4a4b4197c15a3
	.xword	0xe5172aa6c5083b6e
	.xword	0x1ecc3beecbdefc65
	.xword	0x8fc00731a870221a
	.xword	0x7a54034a939f2976
	.xword	0x664a95407c58e394
	.xword	0xc57c3d4c798a00ce
	.xword	0xb2d7146353f0bab5
	.xword	0x6602bd6a8095ce14
	.xword	0x0202e85c44c8f6b7
	.xword	0x7ea17b2c84b9a67e
	.xword	0xa0abd874108f7f19
	.xword	0x52557d9938ffe0cc
	.xword	0x0c2721b03dfab816
	.xword	0x3264b68a4a23eae8
	.xword	0x02b31f2ab5e85e6a
	.xword	0x717503a033953b90
	.xword	0x5f1bb415b0dd3ccc
	.xword	0x68b311f1b2e03f56
	.xword	0x5c25e28933ed1d2f
	.xword	0x732bf70bf823bc14
	.xword	0x60cf2b74925c47d9
	.xword	0x2ea1e5d124e8b613
	.xword	0xba31b622ab67f933
	.xword	0x64de8eb4f447f9b9
	.xword	0xbfa2f2c7d6057d86
	.xword	0x9ebd233ffe83a22d
	.xword	0xa057192a0eee85cd
	.xword	0x121b05d03f12e146
	.xword	0xd999adcdf324cf48
	.xword	0x8344f430768ae703
	.xword	0x369bb4a0e1a7e807
	.xword	0x4dc866880424baca
	.xword	0xbe9f3a673d78fb1c
	.xword	0xe96a616fe264ef84
	.xword	0x8f8e88586d96fd6f
	.xword	0x11854827f360bc97
	.xword	0x98a4e157648fe9ea
	.xword	0xb822dceb32d69824
	.xword	0xdbdcb4bd74963623
	.xword	0x6003d09851780c5b
	.xword	0xe2a15a8bc3215b81
	.xword	0xbb30e075798c3bab
	.xword	0xbe056cef520b7e30
	.xword	0x6163fff00d90fce5
	.xword	0x66710c62e7f42c33
	.xword	0x94803fcc378c3ee8
	.xword	0x1b08e78feca9f89a
	.xword	0x4d1e6b8480e00960
	.xword	0x66361917ce4eb9fc
	.xword	0xd886787db334aed0
	.xword	0x15e556e2ca1d1e66
	.xword	0x6a1bafa8050125c1
	.xword	0x19bb644be8e291c0
	.xword	0xaeaee84bf27565a4
	.xword	0xe78c7d42a51589d0
	.xword	0xbe4ce10117cbe0e5
	.xword	0x7293d288be7dcc20
	.xword	0x6ba58d2a851e1d75
	.xword	0xb8a1fb3c80a013be
	.xword	0x0833ec99b9fdcd36
	.xword	0x3edf168e4d7967fd
	.xword	0x0094334652671754
	.xword	0xb7eec56f8dee39c4
	.xword	0x0078a7aa565ba641
	.xword	0x40c3f60cb583b2dd
	.xword	0x83fedd0c932d37e2
	.xword	0x1dfeb046f0016b8f
	.xword	0x80ce87889e603de3
	.xword	0x2f2177b13851a192
	.xword	0x16eec739c88a4fc9
	.xword	0x0b0ddcbd558005ea
	.xword	0x2017dea35ee2f5d5
	.xword	0xea91b967a9331a02
	.xword	0x41f87b6695198810
	.xword	0x875b37e2d24bca95
	.xword	0x1cc2cf5dfd0e8419
	.xword	0x8d383ecc89566c82
	.xword	0xd18bf23d87b7566e
	.xword	0x4164f0fb12df6e9c
	.xword	0x64047537c219306b
	.xword	0xbd04e92e2f35e4dc
	.xword	0xde6abd03ab178b2c
	.xword	0x7aa2d589bb78e36c
	.xword	0xd401cfdc8b356bcd
	.xword	0xba7fcb30940372e9
	.xword	0x34e166b11c632acb
	.xword	0x8ba871c07b5757f5
	.xword	0x87fe0964d5479c7a
	.xword	0x985a023a0ebcbf35
	.xword	0xdef2bcd26a0de808
	.xword	0x3043de0f76d4842c
	.xword	0xd95bd5b4281ea821
	.xword	0x35a02b7a44656acd
	.xword	0xc24a909643d7e46e
	.xword	0xcb4e2cbe96c3e7fc
	.xword	0xa7d18d0120d91b12
	.xword	0x87e26592401f5954
	.xword	0x70d573c6dc5c3233
	.xword	0x615d4083c48bf3b1
	.xword	0x6adf2ba7f9aaa74a
	.xword	0x944af5036d44e22b
	.xword	0x4bb59ca9161b4d63
	.xword	0x43302e7f5b77969b
	.xword	0xdfbdf08740b995eb
	.xword	0xbe9f8d0c4cfe4a85
	.xword	0x696811b17072869b
	.xword	0x621f3bd1d3d407d1
	.xword	0x9acaaf2e03457816
	.xword	0x400ef159888f3ecb
	.xword	0x6e542045d16f78b0
	.xword	0xfb099d4ab9af3777
	.xword	0xf82b162ae3dc5115
	.xword	0x4a4015cc461dfd36
	.xword	0xab96eb91a21c6c61
	.xword	0x0387fd764d18ad0f
	.xword	0x1dcde5107b157eb9
	.xword	0x28a6204120a734ce
	.xword	0xa93e7804c8e76fad
	.xword	0xa37d3ecade83b916
	.xword	0x5369155560555a18
	.xword	0x8cbd2890bc57987e
	.xword	0x3d200c9c419d4f13
	.xword	0x399ca149564fba16
	.xword	0x6526e10bfc3ea2fa
	.xword	0x3664649e0aefd5df
	.xword	0x2d18a2d4b3a61087
	.xword	0x717373753d9d0960
	.xword	0x68a6d6b892c5f9ca
	.xword	0x3772924ef1ada7f6
	.xword	0x5cd04cfa38f58f47
	.xword	0x4f2b0a3ca575a5f6
	.xword	0xb75cdba78c8769f3
	.xword	0xad8e131b1a52809a
	.xword	0xd4710991199bca71
	.xword	0x46e3d104656e8764
	.xword	0xc5272313a9b111c5
	.xword	0x21b03298c040e094
	.xword	0x55af201e42879292
	.xword	0xb5258d118ac431c3
	.xword	0xabde8d6fd2e9b480
	.xword	0xd9e6a9367f45e426
	.xword	0xacdbb866a9ad84c9
	.xword	0xa24e58f12599169e
	.xword	0xf4da9bde414bf85d
	.xword	0x0d480a6614d241e1
	.xword	0x42d78d9baa706925
	.xword	0x5f601b5ea64f1138
	.xword	0xe878c28534a4afd9
	.xword	0x793cf958cac5200d
	.xword	0x06fd3382f0b54b17
	.xword	0xbb65eb164f4c983d
	.xword	0x59c7b40e2ecc58a8
	.xword	0xf05652ef5c392bde
	.xword	0xe8fff44b7fb7e01a
	.xword	0x4edf8ee3a46747be
	.xword	0xe0e8c6f1843ae902
	.xword	0xc911c66ea27bf983
	.xword	0x0e6bcc02d8ea6a15
	.xword	0xf99d1de5829a44bb
	.xword	0x8278eb906312f048
	.xword	0x16dc29c16a5c1c05
	.xword	0x25ba5f4717630c6d
	.align 0x40000
	.data
data_start_6:

	.xword	0x8a822253d46b610e
	.xword	0x6be4210c5cb11a2d
	.xword	0x447806a0837b82eb
	.xword	0xda3aa1c4b1f08991
	.xword	0x4a596aa35abd9cd3
	.xword	0xfa56c5e6b60c2934
	.xword	0x42209ac4d47acefe
	.xword	0xe3ae70d48adc7e2c
	.xword	0xc17845bcf532c82b
	.xword	0xc5b32890a4b7eb19
	.xword	0x7622657f550f6f75
	.xword	0x5244d6624428b293
	.xword	0xc160677d496df8ed
	.xword	0x581ca7b4a9a9c89d
	.xword	0x89773b1eae5166a6
	.xword	0x9e049cd45692cfc8
	.xword	0xe08da7105648d82e
	.xword	0x742797cbea488edf
	.xword	0x35e50cf48f5a228e
	.xword	0xffbc703aa1670c36
	.xword	0x7e49e8c59f6e80b5
	.xword	0x77eca8ee1c0965dc
	.xword	0x38f26429d25a3722
	.xword	0xa9307948fb234aec
	.xword	0x62306ea13d661098
	.xword	0x6b60666d5450aeb5
	.xword	0xb9efa2894dad5f1a
	.xword	0x7bcde5f6cfca0d40
	.xword	0x953229452b28d356
	.xword	0xf36765addd0700ed
	.xword	0x40ea8592813a0804
	.xword	0xfb51333e107ede69
	.xword	0xe8eb12b8dd8f187f
	.xword	0x93c04b0199ede137
	.xword	0x33c9ca3bd4d69716
	.xword	0x8e98b25ef2003501
	.xword	0x5fe22b8200148986
	.xword	0x84f4511b202a7936
	.xword	0x80425762a808bdb1
	.xword	0xa4e63f075588d4c1
	.xword	0x035043d2dd7d8d8b
	.xword	0xc6bf3db2db968544
	.xword	0xc29164fc5429d4b4
	.xword	0x8d521cf4ab184cdd
	.xword	0x6996afb8e8cfc550
	.xword	0xede2fb6f7fef0b6f
	.xword	0x082e27633ff60d93
	.xword	0x60c73baf80330a1b
	.xword	0x538b6a7bd2206c27
	.xword	0xa20f0ed13698d1de
	.xword	0xccef5af2001ba6d8
	.xword	0xbcd5e6d1ab31432c
	.xword	0x1f7810d64741d07f
	.xword	0x6c24e032702331a7
	.xword	0x12299d710af413c7
	.xword	0x81de842207e3aad2
	.xword	0x946bbe6c20168817
	.xword	0x4eabb208019434ad
	.xword	0x17b38f697d574546
	.xword	0xec96a7e46418e10c
	.xword	0x4d44ba004f8074eb
	.xword	0x94ae25ed3f503e40
	.xword	0xbda0313f15e1c676
	.xword	0xc4d50240ec8058a7
	.xword	0x1205f117a45a922e
	.xword	0xc36e713e298d5387
	.xword	0x7ce1c666253e9a13
	.xword	0xfc0d40bf45dd5cb5
	.xword	0x139949ebc9669008
	.xword	0x3ea321a51699ae0b
	.xword	0x7034a06e1f67be18
	.xword	0xa135db65f04e4438
	.xword	0xdab37d68946c69bd
	.xword	0xd2bc082fd5dd917a
	.xword	0xd70dd308b31d32fc
	.xword	0xc9741c25762c54ea
	.xword	0x663a0c3f0942753e
	.xword	0x1a44abda801f3b64
	.xword	0xa1f9803bd7b4e8e0
	.xword	0x60170e8d46468fc2
	.xword	0xa43375de66afe8b0
	.xword	0x55437962e17ff5dc
	.xword	0x39a9140b8d0d1f87
	.xword	0x2ceeaf4441e7d624
	.xword	0x91a957d21fd73889
	.xword	0xd2eece7f041f8223
	.xword	0x87fdd97c0fae896d
	.xword	0x4d0748be84a6b601
	.xword	0x9d5d122bc8383a39
	.xword	0x88b35f4a39ac6944
	.xword	0x82d2348faecdbee0
	.xword	0xb60ad2ab6a85ccde
	.xword	0x8dc57a126c38b41c
	.xword	0x854c7813e9e6c2d8
	.xword	0x941e500466d9ea63
	.xword	0x00ef9b8328fd11e9
	.xword	0x0f7678a14aaf4a0b
	.xword	0x884c6f10e4c859d8
	.xword	0xa93b5c759f83b5c8
	.xword	0xf8fc84fa1103710d
	.xword	0x7541dd0b995ea843
	.xword	0xfad54c4930e30b39
	.xword	0x761bc7b02711bb0e
	.xword	0x409202e395470cff
	.xword	0x2b2f5491bcbdccef
	.xword	0x124bcf2778d1aed7
	.xword	0x4183a89b9ed77a9c
	.xword	0xccee5adf1e4372e2
	.xword	0xe1d731b200809f16
	.xword	0xa6a065f685c11244
	.xword	0x75164a07d3f6b771
	.xword	0x4e538aaf5fc7bb8e
	.xword	0xc2db4762c98dc4fe
	.xword	0x94593dbeb7be3122
	.xword	0xf724dc1430f535b4
	.xword	0x16b2d12d3c5c2d8b
	.xword	0x9128e3b16ed9eb69
	.xword	0xa2c99addacaff3ed
	.xword	0x6a195d5245da245d
	.xword	0x29d2ad0f409dd38a
	.xword	0xf88c520fb94ca01f
	.xword	0x0234757e4101cab7
	.xword	0x4058576be6487619
	.xword	0x284a4fbcc545afb4
	.xword	0x022bad62e33a7e19
	.xword	0x402a9a3d0e15481f
	.xword	0xecd31878c233c650
	.xword	0x6b5c73aeb3806580
	.xword	0x5511badfdbb94f46
	.xword	0xb83669a794637556
	.xword	0x2771dcb66ce4966a
	.xword	0x54d21e1c5f212c9f
	.xword	0x781575f667bce64f
	.xword	0x90250cd8544349c7
	.xword	0x41d0e46c9a945053
	.xword	0xda15cdf3036d3d97
	.xword	0xce66469a9d0a416a
	.xword	0x0b4f1103168ea633
	.xword	0x9a420d1fb7c2e068
	.xword	0xc5e8c743aa4d90d9
	.xword	0x6cb3f86c680713c9
	.xword	0x1a800e092ba8f035
	.xword	0x712566032252799c
	.xword	0xb61a3b64f8a3ab4d
	.xword	0xfef968211c0c592f
	.xword	0x60c28c49e9c25365
	.xword	0x0c1fb64ced4cfd92
	.xword	0xd828076fe056c322
	.xword	0xc3f4aa9d75baa269
	.xword	0xd9305922f82873e1
	.xword	0x4c929c1a5c289755
	.xword	0x4d7a120dd89d6776
	.xword	0xf94b14703780b76a
	.xword	0xe50ee6b89226f0e1
	.xword	0xc1f6c61677d4c3a5
	.xword	0xe1471b8c6911f058
	.xword	0x71987b4a0626a565
	.xword	0x534e3d7710063ea0
	.xword	0x670f17c449933c20
	.xword	0xd86d79b0f28ee465
	.xword	0xaec3b94f35915779
	.xword	0x4ab2868fe758fcb2
	.xword	0xb6dc77d7cb62e2ca
	.xword	0x12bc4f72659c382f
	.xword	0x5780c0842e35fae7
	.xword	0x6ed4cf83173e0181
	.xword	0xd02c70737bed69a4
	.xword	0x7ec782137f03ed8a
	.xword	0xdc832ea6f613207e
	.xword	0xe2aca6fe48b8dc01
	.xword	0x37fdbe235c8890dd
	.xword	0xc7a0e0ca4a0082e5
	.xword	0x660f4db27fd3772e
	.xword	0x891e6e3f95794160
	.xword	0xae77219c3753bf7d
	.xword	0xf34b33156693fb13
	.xword	0x9cbec3fbc8255f87
	.xword	0xde3de0e7bf65d81c
	.xword	0x03799063684c5dd6
	.xword	0x49b522f79111c25f
	.xword	0xd4a8ab63505752f5
	.xword	0x9cfc8fc91224f101
	.xword	0xe1a42f606cf8a286
	.xword	0x0b0d7983a7a2e197
	.xword	0xb6f691d6d70300ee
	.xword	0x967ede6e07787951
	.xword	0x584849d97d49c048
	.xword	0x9228fcd44fa1a8c4
	.xword	0xddb882ea53cdbd64
	.xword	0xe0d0e2de70ec1c85
	.xword	0x852ff4192d928009
	.xword	0x9ac8d81140d90305
	.xword	0xeee9f425e3817a0d
	.xword	0x273a6cecef73df02
	.xword	0xc79f241acf4f7975
	.xword	0xe358c1f4e70912e7
	.xword	0xcbcd4700404801c6
	.xword	0x44c6157e3a524ed7
	.xword	0x03ae8fc920d7dcac
	.xword	0x4f28d7dd42337aff
	.xword	0x419593121a038012
	.xword	0xd5187b8c1124ede6
	.xword	0x3f988be7a708c604
	.xword	0x76ef438248fee786
	.xword	0xa74ab175a7def1c1
	.xword	0x5141c7589b9df429
	.xword	0xdb1473a6146bbd30
	.xword	0x16656f970196f3b0
	.xword	0xb78a47e2155464b0
	.xword	0xebe1dfffc50bbc9e
	.xword	0x13ff3afc64ce42e0
	.xword	0x9e566c09a1cbbaa3
	.xword	0x4234629a8a8b0e3e
	.xword	0xcd481b96b3b552be
	.xword	0x7e27212745719965
	.xword	0x700a2a63ebcc0092
	.xword	0x5dbcb19e5e99b0b5
	.xword	0xa1407fce6baa3cde
	.xword	0x6e8a35594a27c036
	.xword	0xf3e216b75bec2ca0
	.xword	0x1aea4f5ba300d2b8
	.xword	0x2bd799de1f1fdd70
	.xword	0x53e5ade952df6efe
	.xword	0x367554d8e6242414
	.xword	0x6dc1750246b5f924
	.xword	0x12a3f091a1628368
	.xword	0x3879bbb1247e5a83
	.xword	0x4aa7fe133b62b12f
	.xword	0x26e1736742eece1b
	.xword	0x156e16d4ea6bf448
	.xword	0xa096488cff86bff0
	.xword	0x192691738f16addd
	.xword	0xe5743060a852ac0a
	.xword	0x2280bbf00a22e1d7
	.xword	0x6309307a45fa548c
	.xword	0x0b987da1c61a0039
	.xword	0x44564370393dce3b
	.xword	0xe37a31ad0596e313
	.xword	0x1d969133b43ab249
	.xword	0x643a62ecf51bd521
	.xword	0xec20a5d3cc2ea0d9
	.xword	0xe7309dee48b15cba
	.xword	0xec5bd1b0c0ef1fcc
	.xword	0xc1412236eb6cad6d
	.xword	0x524b727a8ab4660f
	.xword	0xa346b4ca6f46c5f1
	.xword	0x7871425c7cd665b6
	.xword	0x7693dbf91d145ec5
	.xword	0xd68ac00a30cb0173
	.xword	0x9402fa3861cea526
	.xword	0xea6b7e1676723149
	.xword	0xddc7a41bf73e8606
	.xword	0x7885993952bdd7c6
	.xword	0xfa9a5549ed0e9e93
	.xword	0x2e59765225cff1de
	.xword	0xb35e74e6d1eab813
	.align 0x80000
	.data
data_start_7:

	.xword	0xa94c12e069eaf835
	.xword	0x64dc437d9c93628a
	.xword	0x51b119fd1d102d3d
	.xword	0xc8dd29bdb469ac20
	.xword	0x7b946da762ed237f
	.xword	0x4bc1fcb97b179fdf
	.xword	0xc32627d28d1018e6
	.xword	0x1279fe82c805203c
	.xword	0x77de5dba56b2eb76
	.xword	0x22caa376133b2ce9
	.xword	0x9626fb20986de692
	.xword	0x25a80ae656e19c25
	.xword	0xfb7cc9a1c4d154ca
	.xword	0x0356102e183b342b
	.xword	0x21678bd8faf4f5e7
	.xword	0x01afe270409442eb
	.xword	0x5dc306a00d78ed48
	.xword	0x40322996011dc4f1
	.xword	0xbf9802f4bdcbdec6
	.xword	0xc60c780d14ce0690
	.xword	0xbbdea1c12a5a28cc
	.xword	0x60aecc04b7a1707d
	.xword	0x6486610099e520ee
	.xword	0x5fffcb30ef070b2b
	.xword	0x6de05f3f46a13207
	.xword	0xab4ec4ed2b556b1f
	.xword	0x64128d72d60a1a4c
	.xword	0xba8f585cdbffde9a
	.xword	0xc45ea7d954adb8d5
	.xword	0x9c4c6ff1f2ce23e0
	.xword	0x039e120b65d195e2
	.xword	0x472c80387bbbbaf1
	.xword	0x75ade154a5c5b27e
	.xword	0xfde4cc94c76fa14f
	.xword	0xe45144cd6a1fd04d
	.xword	0x20510e9dfa795ef5
	.xword	0x69b1cb9fbd773a8e
	.xword	0x2cb5bf006e50ab46
	.xword	0xed46654d19ca4489
	.xword	0xe8effa235bb38fff
	.xword	0xe0117a3221f51524
	.xword	0x20ea8f88a1f991e1
	.xword	0xfcaf4ec25903ff02
	.xword	0x0f8a7ec33ec8b778
	.xword	0x8489d0e8d72bda21
	.xword	0x6c7ae9a3d09a608e
	.xword	0x7ce1237e9b381f97
	.xword	0x182b967e90148391
	.xword	0x3b7100e351661676
	.xword	0x5fe15dd117d0f645
	.xword	0xbf5f79bb3fabc8aa
	.xword	0x7020b72d94c60308
	.xword	0xb344e551eb0015bd
	.xword	0x0c252f97b3e7a95a
	.xword	0xfbffc0c20018b1db
	.xword	0x7f25d92e435cb716
	.xword	0xb2344ecd57869862
	.xword	0x3c462cb6516afa39
	.xword	0xa9b07d260bd4a3b2
	.xword	0x338942aee4117d68
	.xword	0x239c9d5807cd713f
	.xword	0x06082f242ff9e474
	.xword	0x78df9ea524556d11
	.xword	0x331af8d28e82243a
	.xword	0x4d7048f12d6d2267
	.xword	0x6a6e454fa0246193
	.xword	0xce27c202934085ba
	.xword	0x987c1350fa3fed5e
	.xword	0xaa3109ab27717fc7
	.xword	0x4adcee7c6204b515
	.xword	0x5a2965f1f431f94c
	.xword	0x46e4deb4cb395cef
	.xword	0x4e098147740ea5a9
	.xword	0x59fb379ef06a31f9
	.xword	0x7dad182c51b516a6
	.xword	0x67aef38eaf23c028
	.xword	0xcf04ae967980f239
	.xword	0xbc26a6ce688feb68
	.xword	0xc6a1e8c083f44104
	.xword	0xf9073be8d8202021
	.xword	0x25d65726f720f2d4
	.xword	0xf78f12f58eadf7a5
	.xword	0xf5dc028fd58fa750
	.xword	0x97f1a53702f77b4c
	.xword	0x7cc86c889b7c8bfd
	.xword	0x1ffe97433ebea70c
	.xword	0x7f4987ca9c724574
	.xword	0x9a98b6e639e062eb
	.xword	0xd246962562160f60
	.xword	0xc485dda07c33f62f
	.xword	0x0fda2e1b9e036e99
	.xword	0xeb29dc3dadb8e29a
	.xword	0x78af688ac7515d7d
	.xword	0xdc42307bbffd2075
	.xword	0x16b11a7ef7bad9b3
	.xword	0x48e234c69043981f
	.xword	0x496c4106a0bcf538
	.xword	0x352522dd766841f1
	.xword	0xdf2ff4d03b704b62
	.xword	0xb91b06b54bdc2f3c
	.xword	0x637cdcb8fd40e64d
	.xword	0x6a73584e7624de86
	.xword	0x7b8bdc90668f9cbc
	.xword	0x0b410420f21d7192
	.xword	0x10d9f31aeccf18f7
	.xword	0x595597b64d3144dd
	.xword	0x6a15b3a6f61a328e
	.xword	0x1bbfa2e83ef40506
	.xword	0xbf2b9cd6a1a6d201
	.xword	0x55346dd555e95d3e
	.xword	0x60ff18dc5c38efb9
	.xword	0xdaec24039fb8f1c9
	.xword	0x49bba4f5db09db77
	.xword	0x693e2f2f73eda908
	.xword	0x4694c1c5368a2bdb
	.xword	0x30d0deb3fbd5738c
	.xword	0xdca117e612dd34cf
	.xword	0x9a8bb9dff444a229
	.xword	0x0472dab668bfddeb
	.xword	0xd8aa4143be8af4b9
	.xword	0x89c6e5a61f9c14f2
	.xword	0x48c66e2517207ccc
	.xword	0x138dcb5ccf80c8d4
	.xword	0xf827cae5c6f0c167
	.xword	0x81d808a00c64c37f
	.xword	0x427850683f588837
	.xword	0x32f008d840a9e580
	.xword	0x5372e9329aef031e
	.xword	0x6adb1e3ca6bd945e
	.xword	0xdc6fa49b5652e864
	.xword	0x61036de54417206f
	.xword	0x76a676ed8a84e40b
	.xword	0x0345b37d42f17a40
	.xword	0x66b4f59ebf287b81
	.xword	0xd04101a45b80fce8
	.xword	0x153de6b6123455aa
	.xword	0x346f1a99e7eaa171
	.xword	0xa58c5c1c7d99f06b
	.xword	0x518dbecb2b22bcff
	.xword	0x7a35b452e70edd30
	.xword	0x3984561f8205b018
	.xword	0x3b0d7e7306dd8a3c
	.xword	0x99cdd8c197991516
	.xword	0xf957a1cb9a93b314
	.xword	0xab18caac80009f4d
	.xword	0xbf2d14d693baf9a0
	.xword	0x3c3d36928236971f
	.xword	0x9763cc81caeee3fd
	.xword	0x2d697cfd3c2fee5c
	.xword	0xb42d22f0eba64353
	.xword	0x7f75716017b46701
	.xword	0xc10fc564c69f9884
	.xword	0xf363d62468252da3
	.xword	0x96a8a1f81bfaee16
	.xword	0x2d7964238438bab4
	.xword	0x3506f8e97bf82f2d
	.xword	0x4791f2238b5d35be
	.xword	0xf94952ca6a24503f
	.xword	0xee71f0ec31bfa90d
	.xword	0x96867a59825225bc
	.xword	0x0c1e096be2d49ff6
	.xword	0xf1161435b805fd36
	.xword	0xc983b0a19df8b087
	.xword	0xcdbb2e07ed1ee256
	.xword	0x6892eb7aaeca45ca
	.xword	0xd77fdd6732ef2878
	.xword	0xc1c60c399e59b1d9
	.xword	0xf23293e571f42816
	.xword	0x093c5e474072f2e6
	.xword	0x84fbc784de94aa80
	.xword	0x2b3e5f13ba7b2d8a
	.xword	0x663c3dc20d1d23a5
	.xword	0xb3c5e96e456846ec
	.xword	0x3deda44c936a964c
	.xword	0x15db1999b0a00117
	.xword	0x59051e5139283cd0
	.xword	0x4fa802f1ed29cf06
	.xword	0xf6fc9abfb1db384a
	.xword	0x6373504cc4dde143
	.xword	0x805ae3d5624057c5
	.xword	0x69471a8453a1e03b
	.xword	0x774f361b38d97ddd
	.xword	0x074234f63ce4ab97
	.xword	0x3aae787b8d5ddbc5
	.xword	0xa166af496574d65d
	.xword	0xab23a95cd98987a2
	.xword	0xb685377abcd955a3
	.xword	0x0543863b7f582c82
	.xword	0x92ec2d43e9531c36
	.xword	0x7eb006845d96e12c
	.xword	0xeffa75580b33cc03
	.xword	0x0ce5c475ff1e2e62
	.xword	0x8cdb24bb680ad844
	.xword	0xea9eceeb623100da
	.xword	0x4192de78186c7062
	.xword	0x150a3a518731d5eb
	.xword	0x379d81c1ec93d04b
	.xword	0x5ebb58eb3d5cd030
	.xword	0x17c057312d843aca
	.xword	0xbe7cd97dac8349fc
	.xword	0x9ec8e06fef11752d
	.xword	0xbf0c47f941558242
	.xword	0x29856cd4f5cf6177
	.xword	0x411c38182e094b3e
	.xword	0xc9dc214cfc331aab
	.xword	0x9835b538f00557e9
	.xword	0x3f5be14bbb751e84
	.xword	0x8b7d8905b53afb32
	.xword	0xe985d9b21a7e9f0e
	.xword	0xc45e92c8d8a411bf
	.xword	0x3322a6153cad7b2a
	.xword	0xd0514be4eeab4f64
	.xword	0x57ee6e2e682de003
	.xword	0x29930990a1b93448
	.xword	0x4520bab636f11d57
	.xword	0x862085ba77e89afa
	.xword	0xcdbebe7f6c363cfe
	.xword	0x883d41f65ffacd4e
	.xword	0xf3598f43c3baafc0
	.xword	0x8a85297431befa4d
	.xword	0x52ca9028f4d99a7e
	.xword	0x7790f971c3cee875
	.xword	0x6eb7b84ae248c1c0
	.xword	0x795e8d17643de9da
	.xword	0xf7c7aaba5d8b2a76
	.xword	0xd28177d2d9c03e2c
	.xword	0xfd4e1bd03bd8cdd5
	.xword	0xfb43db4945b5b47b
	.xword	0xc5f457a75cd60f7d
	.xword	0xbc3667376d4a721c
	.xword	0x7b28353a33465d3f
	.xword	0x0b533ad8644bc530
	.xword	0xd1abac9af5fcd7ab
	.xword	0x924af617412c6889
	.xword	0x92995d277cfa4dba
	.xword	0x50625e852622ce16
	.xword	0x8fd9bbe433637e56
	.xword	0xdd9a34b556887e1b
	.xword	0xe4d6a41f365433d4
	.xword	0xf90a64358de72b11
	.xword	0xbf95a2ee02dc063b
	.xword	0x1d70c9c32c86e886
	.xword	0xdb641b2dc6e7e08d
	.xword	0xd6c547d4b3dd4650
	.xword	0x86ff7e389e91d6aa
	.xword	0x74607ceae04c3227
	.xword	0x6686fbb2194f6859
	.xword	0x8976bed6b31cb53e
	.xword	0x9331e6d6478ab0b9
	.xword	0x07b03a98a34c1769
	.xword	0x6c6bd458d469083a
	.xword	0x2318c75d45269a15
	.xword	0x11bbf28fdfe0d0a4
	.xword	0x6c32ecf204e4f435
	.xword	0x048b39435c3f6065
	.xword	0x8a453b17e8d53779



	.text
	ta	T_GOOD_TRAP

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i, j;
!!#   int loop_cnt = 0;
!!# 
!!# 
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_bind_thread_group("diag.j", 34, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 35, th_0,    0x1);
!!#   IJ_bind_thread_group("diag.j", 36, th_1,    0x2);
!!#   IJ_bind_thread_group("diag.j", 37, th_2,    0x4);
!!#   IJ_bind_thread_group("diag.j", 38, th_3,    0x8);
!!#   IJ_bind_thread_group("diag.j", 39, th_2_3,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 41,"{16}" );
!!#   IJ_set_rvar ("diag.j", 42, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 43, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 45, Rv_thrdint_param, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'brrrrr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!#   IJ_set_rvar ("diag.j", 53, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 56, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "6'brr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 62, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 63, Rv_ldst_var, "{16..23}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 65, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 66, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 67, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 68, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   IJ_set_rvar ("diag.j", 71, Rv_hpstate, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rr0r rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 72, Rop_hpstate_rs1, Ft_Rs1, "{10}");
!!#   IJ_set_rvar ("diag.j", 73, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 74, Rop_tl_rs1, Ft_Rs1, "{12}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 76, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 79, th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 80, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 81, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 83, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 85, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 86, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 87, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 88, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 89, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 90, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 91, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   IJ_th_fork("diag.j", 94,0x2, 0x4, 0x8, -1);;
!!# 
!!#      // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 98, th_2_3, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
!!#   }
!!# 
!!#   return 0;
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join("diag.j", 105,0xf);
!!#   IJ_th_start ("diag.j", 106,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 108, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 109, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 111, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 112, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 114, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!# 	    | inst_block inst_type
!!# ;
!!# 
!!# inst_type: 
!!# 	comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 152, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 156, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 160, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 164, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 168, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 172, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 176, th_all, $1);
!!# 	}
!!# ;
!!# 
!!# comm_inst:
!!# 	hw_intr
!!# 	| write_priv_asr
!!# 	| read_priv_asr
!!# 	| alu
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap %rvar  Rv_low_wt
!!# ;
!!# 
!!# set_va: mSET_VA
!!# 	{
!!# 	  IJ_printf ("diag.j", 191, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 197, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 201, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# ;
!!# 
!!# write_priv_asr:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 214, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 218, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_asr: 
!!# 	tRDPR_PSTATE
!!# 	| tRDHPR_HPSTATE
!!# 	| tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TT
!!# 	| tRDPR_TICK
!!# 	| tRDPR_TL
!!# 	| tRDPR_GL
!!# 	| tRDPR_PIL
!!# ;
!!# 
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R 
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I
!!# 	| tLDDF_I | tLDDF_R
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTD_R | tSTB_I | tSTH_I 
!!# 	| tSTW_I | tSTX_I | tSTD_I 
!!# 	| tSTDF_I | tSTDF_R
!!# ;
!!# 
!!# fp_all:	fp_arith | fmov
!!# ;
!!# 
!!# fp_arith:
!!# 	tFADDs | tFADDd | tFADDq | tFSUBs | tFSUBd | tFSUBq | tFMULs | tFMULd | 
!!# 	tFMULq | tFDIVs | tFDIVd | tFDIVq | tFSQRTs | tFSQRTd | tFSQRTq
!!# ;
!!# 
!!# fmov:	tFMOVs | tFMOVd | tFMOVRLEZ | tFMOVRLZ | tFMOVRNZ | tFMOVRGZ | 
!!# 	tFMOVRGEZ | tFMOVA  | tFMOVN   | tFMOVNE  | tFMOVE   | tFMOVG  | 
!!# 	tFMOVLE | tFMOVGE | tFMOVL   | tFMOVGU  | tFMOVLEU | tFMOVCC | 
!!# 	tFMOVCS | tFMOVPOS | tFMOVNEG | tFMOVVC | tFMOVVS  | tFMOVRZ
!!# ;
!!# 
!!# spill_trap:
!!# 	tSAVE_I
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 272, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 273, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 274, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 275, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 276, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 281, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 282, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 283, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
!!# 	};
!!# 
!!# alu:	tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I 
!!# 	| tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_I 
!!# 	| tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R 
!!# 	| tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I 
!!# 	| tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I 
!!# 	| tMOVR_R | tMOVR_I | tMOVcc_R | tMOVcc_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSRLX_R 
!!# 	| tSRLX_I | tSRAX_R | tSRAX_I | tSLL_R | tSLL_I | tSLLX_R | tSLLX_I
!!# ;
!!# 
!!# spu_rsrv_illgl: mSPU_ILLGL
!!# 	{
!!# 	  IJ_printf ("diag.j", 300, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 301, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 303, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 304, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINT
!!#         {
!!#           IJ_printf ("diag.j", 310, th_all, "hwintr_%y_%d:\n", loop_cnt);
!!#           IJ_printf ("diag.j", 311, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", loop_cnt, Rv_intr_vect);
!!#           loop_cnt++;
!!#         }
!!# ;
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
