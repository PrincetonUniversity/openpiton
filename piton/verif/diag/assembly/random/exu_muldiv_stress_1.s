// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_muldiv_stress_1.s
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
   random seed:	961395263
   Jal exu_muldiv_stress.j:	
********************************************************************************/



! for divide by zero cases
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
rdpr	%tstate, %i1; \
rdpr	%tt, %i1; \
rdpr	%tpc, %i0; \
rdpr	%tnpc, %i1; \
done; \
nop;    

#include "enable_traps.h"
#include "boot.s"

!SIMS: -non_shared
!SIMS: +spis

.text
.global main

main:
		wr    %g0, 7, %fprs


! Register init code

	setx 0xf89d8cead2f886bd, %g1, %g0
	setx 0xf95616d70245565a, %g1, %g1
	setx 0x01c8f749a4eb69e3, %g1, %g2
	setx 0xa95262129037e3bf, %g1, %g3
	setx 0x6c9660255b921f3a, %g1, %g4
	setx 0xa41b2af1f438f86d, %g1, %g5
	setx 0x6e19fedb62aa1842, %g1, %g6
	setx 0x6cdddcb3852f5021, %g1, %g7
	setx 0xaf274f2e7de49a19, %g1, %r16
	setx 0xe5a936cdd9fc47f1, %g1, %r17
	setx 0x9c085cadd20c8e2d, %g1, %r18
	setx 0x5c2df89ee3a49678, %g1, %r19
	setx 0x5e2030f24a218d63, %g1, %r20
	setx 0x0bdd18fdc14a3d34, %g1, %r21
	setx 0x1b20a1b27a57657c, %g1, %r22
	setx 0xbca7ac49d20153d9, %g1, %r23
	setx 0xe193bf99f7ac7101, %g1, %r24
	setx 0xfc70205a290c5443, %g1, %r25
	setx 0x32b04de076f64453, %g1, %r26
	setx 0x9846f0daf8c9a188, %g1, %r27
	setx 0x7092ce51cbf43356, %g1, %r28
	setx 0xd6c2914b6c619e63, %g1, %r29
	setx 0xa1f44925ccb9fed1, %g1, %r30
	setx 0x7cb9c73d8eacc6b5, %g1, %r31
	save
	setx 0x87d9b3902cdf8f96, %g1, %r16
	setx 0x794ff5620e4a901c, %g1, %r17
	setx 0x58a173a6ef360301, %g1, %r18
	setx 0x027e04f3d7f83a8c, %g1, %r19
	setx 0x2b241471a297e1dd, %g1, %r20
	setx 0x0bf6125b1427ac02, %g1, %r21
	setx 0xb05f5e6e34d8ce50, %g1, %r22
	setx 0x22899a4c75014261, %g1, %r23
	setx 0xce9bb5ee92a0eb8c, %g1, %r24
	setx 0x9b4a48c0e809a63b, %g1, %r25
	setx 0x87f7ce6807ec1bdb, %g1, %r26
	setx 0x701d002adf0fbb2f, %g1, %r27
	setx 0x713f41666f09451c, %g1, %r28
	setx 0x4c7b4e8c826aff58, %g1, %r29
	setx 0x3903dd35beb4d542, %g1, %r30
	setx 0x4cc5ef9b849a0246, %g1, %r31
	restore
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	wr %r11,0x1fff,%y
	setx	t3_data64_start_0,%g3, %g1
	setx	t3_data32_start_0,%g3, %g2
	.word 0xa07a400d  ! 4: SDIV_R	sdiv 	%r9, %r13, %r16
	.word 0x93680015  ! 9: SDIVX_R	sdivx	%r0, %r21, %r9
	.word 0x8ef80012  ! 14: SDIVcc_R	sdivcc 	%r0, %r18, %r7
	.word 0x964aa001  ! 19: MULX_I	mulx 	%r10, 0x0001, %r11
	.word 0xb24c2001  ! 24: MULX_I	mulx 	%r16, 0x0001, %r25
	.word 0xb5242001  ! 29: MULScc_I	mulscc 	%r16, 0x0001, %r26
	.word 0xb67ee001  ! 34: SDIV_I	sdiv 	%r27, 0x0001, %r27
	.word 0xa8492001  ! 39: MULX_I	mulx 	%r4, 0x0001, %r20
	.word 0x8a7ca001  ! 44: SDIV_I	sdiv 	%r18, 0x0001, %r5
	.word 0x97698007  ! 49: SDIVX_R	sdivx	%r6, %r7, %r11
	.word 0x887b2001  ! 54: SDIV_I	sdiv 	%r12, 0x0001, %r4
	.word 0xb44ce001  ! 59: MULX_I	mulx 	%r19, 0x0001, %r26
	.word 0xbc6cc018  ! 64: UDIVX_R	udivx 	%r19, %r24, %r30
	.word 0xb0500011  ! 69: UMUL_R	umul 	%r0, %r17, %r24
	.word 0xb66b001e  ! 74: UDIVX_R	udivx 	%r12, %r30, %r27
	.word 0xa2ffc01b  ! 79: SDIVcc_R	sdivcc 	%r31, %r27, %r17
	.word 0xacf28012  ! 84: UDIVcc_R	udivcc 	%r10, %r18, %r22
	.word 0xb56ec019  ! 89: SDIVX_R	sdivx	%r27, %r25, %r26
	.word 0xa8d94017  ! 94: SMULcc_R	smulcc 	%r5, %r23, %r20
	.word 0x8183a001  ! 99: WRY_I	wr	%r14, 0x0001, %y
	.word 0xacdc001d  ! 104: SMULcc_R	smulcc 	%r16, %r29, %r22
	.word 0xdc5866b0  ! 109: LDX_I	ldx	[%r1 + 0x06b0], %r14
	.word 0x9ad12001  ! 114: UMULcc_I	umulcc 	%r4, 0x0001, %r13
	.word 0x9e6c0014  ! 119: UDIVX_R	udivx 	%r16, %r20, %r15
	.word 0x9a7e8006  ! 124: SDIV_R	sdiv 	%r26, %r6, %r13
	.word 0x924c8011  ! 129: MULX_R	mulx 	%r18, %r17, %r9
	.word 0xac54a001  ! 134: UMUL_I	umul 	%r18, 0x0001, %r22
	.word 0xbc4ee001  ! 139: MULX_I	mulx 	%r27, 0x0001, %r30
	.word 0xb44e2001  ! 144: MULX_I	mulx 	%r24, 0x0001, %r26
	.word 0x8e516001  ! 149: UMUL_I	umul 	%r5, 0x0001, %r7
	.word 0x867aa001  ! 154: SDIV_I	sdiv 	%r10, 0x0001, %r3
	.word 0xa468001b  ! 159: UDIVX_R	udivx 	%r0, %r27, %r18
	.word 0x86df8003  ! 164: SMULcc_R	smulcc 	%r30, %r3, %r3
	.word 0xbc4e4018  ! 169: MULX_R	mulx 	%r25, %r24, %r30
	.word 0xb6482001  ! 174: MULX_I	mulx 	%r0, 0x0001, %r27
	.word 0x96714010  ! 179: UDIV_R	udiv 	%r5, %r16, %r11
	.word 0x90682001  ! 184: UDIVX_I	udivx 	%r0, 0x0001, %r8
	.word 0x9a69a001  ! 189: UDIVX_I	udivx 	%r6, 0x0001, %r13
	.word 0xa47f2001  ! 194: SDIV_I	sdiv 	%r28, 0x0001, %r18
	.word 0xea5866d8  ! 199: LDX_I	ldx	[%r1 + 0x06d8], %r21
	.word 0xaf202001  ! 204: MULScc_I	mulscc 	%r0, 0x0001, %r23
	.word 0x966d8006  ! 209: UDIVX_R	udivx 	%r22, %r6, %r11
	.word 0x9c680000  ! 214: UDIVX_R	udivx 	%r0, %r0, %r14
	.word 0xa64fc01e  ! 219: MULX_R	mulx 	%r31, %r30, %r19
	.word 0xa677c00a  ! 224: UDIV_R	udiv 	%r31, %r10, %r19
	.word 0xbf6f8015  ! 229: SDIVX_R	sdivx	%r30, %r21, %r31
	.word 0xb2762001  ! 234: UDIV_I	udiv 	%r24, 0x0001, %r25
	.word 0x8e4f0017  ! 239: MULX_R	mulx 	%r28, %r23, %r7
	.word 0xa254a001  ! 244: UMUL_I	umul 	%r18, 0x0001, %r17
	.word 0x96502001  ! 249: UMUL_I	umul 	%r0, 0x0001, %r11
	.word 0xa76fe001  ! 254: SDIVX_I	sdivx	%r31, 0x0001, %r19
	.word 0xa268c00c  ! 259: UDIVX_R	udivx 	%r3, %r12, %r17
	.word 0x96f44017  ! 264: UDIVcc_R	udivcc 	%r17, %r23, %r11
	.word 0xa64c001e  ! 269: MULX_R	mulx 	%r16, %r30, %r19
	.word 0x8e6e8015  ! 274: UDIVX_R	udivx 	%r26, %r21, %r7
	.word 0x8185a001  ! 279: WRY_I	wr	%r22, 0x0001, %y
	.word 0x885d000d  ! 284: SMUL_R	smul 	%r20, %r13, %r4
	.word 0x986f0005  ! 289: UDIVX_R	udivx 	%r28, %r5, %r12
	.word 0x86590011  ! 294: SMUL_R	smul 	%r4, %r17, %r3
	.word 0x9c6a801d  ! 299: UDIVX_R	udivx 	%r10, %r29, %r14
	.word 0x9f6f2001  ! 304: SDIVX_I	sdivx	%r28, 0x0001, %r15
	.word 0xbe4d0016  ! 309: MULX_R	mulx 	%r20, %r22, %r31
	.word 0xb24e000a  ! 314: MULX_R	mulx 	%r24, %r10, %r25
	.word 0xba498014  ! 319: MULX_R	mulx 	%r6, %r20, %r29
	.word 0x8c49c00b  ! 324: MULX_R	mulx 	%r7, %r11, %r6
	.word 0xa67b000e  ! 329: SDIV_R	sdiv 	%r12, %r14, %r19
	.word 0xba49800b  ! 334: MULX_R	mulx 	%r6, %r11, %r29
	.word 0xa46b2001  ! 339: UDIVX_I	udivx 	%r12, 0x0001, %r18
	.word 0x8f6e6001  ! 344: SDIVX_I	sdivx	%r25, 0x0001, %r7
	.word 0xb64f8009  ! 349: MULX_R	mulx 	%r30, %r9, %r27
	.word 0x986e8003  ! 354: UDIVX_R	udivx 	%r26, %r3, %r12
	.word 0x81842001  ! 359: WRY_I	wr	%r16, 0x0001, %y
	.word 0x92fdc004  ! 364: SDIVcc_R	sdivcc 	%r23, %r4, %r9
	.word 0xb168e001  ! 369: SDIVX_I	sdivx	%r3, 0x0001, %r24
	.word 0xb04f6001  ! 374: MULX_I	mulx 	%r29, 0x0001, %r24
	.word 0xb04f8012  ! 379: MULX_R	mulx 	%r30, %r18, %r24
	.word 0xa2696001  ! 384: UDIVX_I	udivx 	%r5, 0x0001, %r17
	.word 0xb8f6800d  ! 389: UDIVcc_R	udivcc 	%r26, %r13, %r28
	.word 0xb96e001f  ! 394: SDIVX_R	sdivx	%r24, %r31, %r28
	.word 0xb2770010  ! 399: UDIV_R	udiv 	%r28, %r16, %r25
	.word 0xb1680010  ! 404: SDIVX_R	sdivx	%r0, %r16, %r24
	.word 0x9cfca001  ! 409: SDIVcc_I	sdivcc 	%r18, 0x0001, %r14
	.word 0x996ae001  ! 414: SDIVX_I	sdivx	%r11, 0x0001, %r12
	.word 0xa6d3c003  ! 419: UMULcc_R	umulcc 	%r15, %r3, %r19
	.word 0x9d6ac01f  ! 424: SDIVX_R	sdivx	%r11, %r31, %r14
	.word 0xb96ae001  ! 429: SDIVX_I	sdivx	%r11, 0x0001, %r28
	.word 0xb64ee001  ! 434: MULX_I	mulx 	%r27, 0x0001, %r27
	.word 0xbe6b801b  ! 439: UDIVX_R	udivx 	%r14, %r27, %r31
	.word 0x8850c017  ! 444: UMUL_R	umul 	%r3, %r23, %r4
	.word 0xb26ae001  ! 449: UDIVX_I	udivx 	%r11, 0x0001, %r25
	.word 0xaf6bc003  ! 454: SDIVX_R	sdivx	%r15, %r3, %r23
	.word 0xbe4ec010  ! 459: MULX_R	mulx 	%r27, %r16, %r31
	.word 0xba71c009  ! 464: UDIV_R	udiv 	%r7, %r9, %r29
	.word 0xb16d401f  ! 469: SDIVX_R	sdivx	%r21, %r31, %r24
	.word 0x9873c008  ! 474: UDIV_R	udiv 	%r15, %r8, %r12
	.word 0xa6f8000e  ! 479: SDIVcc_R	sdivcc 	%r0, %r14, %r19
	.word 0xa24d8006  ! 484: MULX_R	mulx 	%r22, %r6, %r17
	.word 0xaa48e001  ! 489: MULX_I	mulx 	%r3, 0x0001, %r21
	.word 0xaa682001  ! 494: UDIVX_I	udivx 	%r0, 0x0001, %r21
	.word 0xb44a2001  ! 499: MULX_I	mulx 	%r8, 0x0001, %r26
	.word 0xacd5e001  ! 504: UMULcc_I	umulcc 	%r23, 0x0001, %r22
	.word 0x81822001  ! 509: WRY_I	wr	%r8, 0x0001, %y
	.word 0x81876001  ! 514: WRY_I	wr	%r29, 0x0001, %y
	.word 0x996a6001  ! 519: SDIVX_I	sdivx	%r9, 0x0001, %r12
	.word 0xba4f2001  ! 524: MULX_I	mulx 	%r28, 0x0001, %r29
	.word 0x9e738019  ! 529: UDIV_R	udiv 	%r14, %r25, %r15
	.word 0xb4f4c01e  ! 534: UDIVcc_R	udivcc 	%r19, %r30, %r26
	.word 0xbe4d0019  ! 539: MULX_R	mulx 	%r20, %r25, %r31
	.word 0x8e6e8000  ! 544: UDIVX_R	udivx 	%r26, %r0, %r7
	.word 0xab228006  ! 549: MULScc_R	mulscc 	%r10, %r6, %r21
	.word 0x9e4f6001  ! 554: MULX_I	mulx 	%r29, 0x0001, %r15
	.word 0xbc502001  ! 559: UMUL_I	umul 	%r0, 0x0001, %r30
	.word 0xa0542001  ! 564: UMUL_I	umul 	%r16, 0x0001, %r16
	.word 0xf0586270  ! 569: LDX_I	ldx	[%r1 + 0x0270], %r24
	.word 0xb16ba001  ! 574: SDIVX_I	sdivx	%r14, 0x0001, %r24
	.word 0xf8586208  ! 579: LDX_I	ldx	[%r1 + 0x0208], %r28
	.word 0x864b4008  ! 584: MULX_R	mulx 	%r13, %r8, %r3
	.word 0xd4586130  ! 589: LDX_I	ldx	[%r1 + 0x0130], %r10
	.word 0x8f26e001  ! 594: MULScc_I	mulscc 	%r27, 0x0001, %r7
	.word 0x9c4f0006  ! 599: MULX_R	mulx 	%r28, %r6, %r14
	.word 0x9a762001  ! 604: UDIV_I	udiv 	%r24, 0x0001, %r13
	.word 0xad68e001  ! 609: SDIVX_I	sdivx	%r3, 0x0001, %r22
	.word 0xba5ac006  ! 614: SMUL_R	smul 	%r11, %r6, %r29
	.word 0xb46fc00b  ! 619: UDIVX_R	udivx 	%r31, %r11, %r26
	.word 0x8869c006  ! 624: UDIVX_R	udivx 	%r7, %r6, %r4
	.word 0x8aff800a  ! 629: SDIVcc_R	sdivcc 	%r30, %r10, %r5
	.word 0xb84f2001  ! 634: MULX_I	mulx 	%r28, 0x0001, %r28
	.word 0x924fe001  ! 639: MULX_I	mulx 	%r31, 0x0001, %r9
	.word 0x8b6c001f  ! 644: SDIVX_R	sdivx	%r16, %r31, %r5
	.word 0x8a4d0009  ! 649: MULX_R	mulx 	%r20, %r9, %r5
	.word 0x92fd4008  ! 654: SDIVcc_R	sdivcc 	%r21, %r8, %r9
	.word 0xba75c01b  ! 659: UDIV_R	udiv 	%r23, %r27, %r29
	.word 0xb856e001  ! 664: UMUL_I	umul 	%r27, 0x0001, %r28
	.word 0xb569c004  ! 669: SDIVX_R	sdivx	%r7, %r4, %r26
	.word 0xbe5ca001  ! 674: SMUL_I	smul 	%r18, 0x0001, %r31
	.word 0xb369c01d  ! 679: SDIVX_R	sdivx	%r7, %r29, %r25
	.word 0x926ce001  ! 684: UDIVX_I	udivx 	%r19, 0x0001, %r9
	.word 0xa4750016  ! 689: UDIV_R	udiv 	%r20, %r22, %r18
	.word 0x9ed6400d  ! 694: UMULcc_R	umulcc 	%r25, %r13, %r15
	.word 0xbf698000  ! 699: SDIVX_R	sdivx	%r6, %r0, %r31
	.word 0xba6cc006  ! 704: UDIVX_R	udivx 	%r19, %r6, %r29
	.word 0xb2482001  ! 709: MULX_I	mulx 	%r0, 0x0001, %r25
	.word 0xae748012  ! 714: UDIV_R	udiv 	%r18, %r18, %r23
	.word 0x9af0c003  ! 719: UDIVcc_R	udivcc 	%r3, %r3, %r13
	.word 0xb648e001  ! 724: MULX_I	mulx 	%r3, 0x0001, %r27
	.word 0x967c6001  ! 729: SDIV_I	sdiv 	%r17, 0x0001, %r11
	.word 0xb16a4012  ! 734: SDIVX_R	sdivx	%r9, %r18, %r24
	.word 0xb26ae001  ! 739: UDIVX_I	udivx 	%r11, 0x0001, %r25
	.word 0xa0530018  ! 744: UMUL_R	umul 	%r12, %r24, %r16
	.word 0xad6b4000  ! 749: SDIVX_R	sdivx	%r13, %r0, %r22
	.word 0x94482001  ! 754: MULX_I	mulx 	%r0, 0x0001, %r10
	.word 0xb05c6001  ! 759: SMUL_I	smul 	%r17, 0x0001, %r24
	.word 0xa569c007  ! 764: SDIVX_R	sdivx	%r7, %r7, %r18
	.word 0x864d2001  ! 769: MULX_I	mulx 	%r20, 0x0001, %r3
	.word 0xb76e8003  ! 774: SDIVX_R	sdivx	%r26, %r3, %r27
	.word 0x8183a001  ! 779: WRY_I	wr	%r14, 0x0001, %y
	.word 0x866c800d  ! 784: UDIVX_R	udivx 	%r18, %r13, %r3
	.word 0xaaf32001  ! 789: UDIVcc_I	udivcc 	%r12, 0x0001, %r21
	.word 0xa26c2001  ! 794: UDIVX_I	udivx 	%r16, 0x0001, %r17
	.word 0xaa7f801f  ! 799: SDIV_R	sdiv 	%r30, %r31, %r21
	.word 0x885fa001  ! 804: SMUL_I	smul 	%r30, 0x0001, %r4
	.word 0xb04ce001  ! 809: MULX_I	mulx 	%r19, 0x0001, %r24
	.word 0x8a698009  ! 814: UDIVX_R	udivx 	%r6, %r9, %r5
	.word 0xb2f5801a  ! 819: UDIVcc_R	udivcc 	%r22, %r26, %r25
	.word 0x8186e001  ! 824: WRY_I	wr	%r27, 0x0001, %y
	.word 0xbe4fa001  ! 829: MULX_I	mulx 	%r30, 0x0001, %r31
	.word 0xa052c007  ! 834: UMUL_R	umul 	%r11, %r7, %r16
	.word 0xba4f8009  ! 839: MULX_R	mulx 	%r30, %r9, %r29
	.word 0xb4480009  ! 844: MULX_R	mulx 	%r0, %r9, %r26
	.word 0xac4a2001  ! 849: MULX_I	mulx 	%r8, 0x0001, %r22
	.word 0xd8586798  ! 854: LDX_I	ldx	[%r1 + 0x0798], %r12
	.word 0xb2d96001  ! 859: SMULcc_I	smulcc 	%r5, 0x0001, %r25
	.word 0x986b6001  ! 864: UDIVX_I	udivx 	%r13, 0x0001, %r12
	.word 0x9a7ce001  ! 869: SDIV_I	sdiv 	%r19, 0x0001, %r13
	.word 0x9e6d401d  ! 874: UDIVX_R	udivx 	%r21, %r29, %r15
	.word 0xab6ee001  ! 879: SDIVX_I	sdivx	%r27, 0x0001, %r21
	.word 0x92d44019  ! 884: UMULcc_R	umulcc 	%r17, %r25, %r9
	.word 0xa87a400f  ! 889: SDIV_R	sdiv 	%r9, %r15, %r20
	.word 0xac6fa001  ! 894: UDIVX_I	udivx 	%r30, 0x0001, %r22
	.word 0xaef2c017  ! 899: UDIVcc_R	udivcc 	%r11, %r23, %r23
	.word 0xa0f54007  ! 904: UDIVcc_R	udivcc 	%r21, %r7, %r16
	.word 0x9ef80011  ! 909: SDIVcc_R	sdivcc 	%r0, %r17, %r15
	.word 0x8a5ac00f  ! 914: SMUL_R	smul 	%r11, %r15, %r5
	.word 0x944c6001  ! 919: MULX_I	mulx 	%r17, 0x0001, %r10
	.word 0xa36de001  ! 924: SDIVX_I	sdivx	%r23, 0x0001, %r17
	.word 0x86d6a001  ! 929: UMULcc_I	umulcc 	%r26, 0x0001, %r3
	.word 0x946e8004  ! 934: UDIVX_R	udivx 	%r26, %r4, %r10
	.word 0x8ed74008  ! 939: UMULcc_R	umulcc 	%r29, %r8, %r7
	.word 0x9e6a001b  ! 944: UDIVX_R	udivx 	%r8, %r27, %r15
	.word 0xb96f2001  ! 949: SDIVX_I	sdivx	%r28, 0x0001, %r28
	.word 0xaa76a001  ! 954: UDIV_I	udiv 	%r26, 0x0001, %r21
	.word 0x946dc017  ! 959: UDIVX_R	udivx 	%r23, %r23, %r10
	.word 0xad694007  ! 964: SDIVX_R	sdivx	%r5, %r7, %r22
	.word 0x964de001  ! 969: MULX_I	mulx 	%r23, 0x0001, %r11
	.word 0x9d6b0000  ! 974: SDIVX_R	sdivx	%r12, %r0, %r14
	.word 0x9c4b6001  ! 979: MULX_I	mulx 	%r13, 0x0001, %r14
	.word 0x81822001  ! 984: WRY_I	wr	%r8, 0x0001, %y
	.word 0x866f0000  ! 989: UDIVX_R	udivx 	%r28, %r0, %r3
	.word 0x88f4c01d  ! 994: UDIVcc_R	udivcc 	%r19, %r29, %r4
	.word 0xaf6c2001  ! 999: SDIVX_I	sdivx	%r16, 0x0001, %r23
	.word 0x9cdd2001  ! 1004: SMULcc_I	smulcc 	%r20, 0x0001, %r14
	.word 0xba566001  ! 1009: UMUL_I	umul 	%r25, 0x0001, %r29
	.word 0xdc586448  ! 1014: LDX_I	ldx	[%r1 + 0x0448], %r14
	.word 0xae4a4015  ! 1019: MULX_R	mulx 	%r9, %r21, %r23
	.word 0xa56c4000  ! 1024: SDIVX_R	sdivx	%r17, %r0, %r18
	.word 0xa24f801d  ! 1029: MULX_R	mulx 	%r30, %r29, %r17
	.word 0xb9272001  ! 1034: MULScc_I	mulscc 	%r28, 0x0001, %r28
	.word 0xda586300  ! 1039: LDX_I	ldx	[%r1 + 0x0300], %r13
	.word 0x926f4010  ! 1044: UDIVX_R	udivx 	%r29, %r16, %r9
	.word 0x996cc01b  ! 1049: SDIVX_R	sdivx	%r19, %r27, %r12
	.word 0xaf6bc01e  ! 1054: SDIVX_R	sdivx	%r15, %r30, %r23
	.word 0xaedba001  ! 1059: SMULcc_I	smulcc 	%r14, 0x0001, %r23
	.word 0x88db2001  ! 1064: SMULcc_I	smulcc 	%r12, 0x0001, %r4
	.word 0x8a4ce001  ! 1069: MULX_I	mulx 	%r19, 0x0001, %r5
	.word 0xaa7da001  ! 1074: SDIV_I	sdiv 	%r22, 0x0001, %r21
	.word 0xbb6d0003  ! 1079: SDIVX_R	sdivx	%r20, %r3, %r29
	.word 0x88fb401f  ! 1084: SDIVcc_R	sdivcc 	%r13, %r31, %r4
	.word 0xb04b0012  ! 1089: MULX_R	mulx 	%r12, %r18, %r24
	.word 0xa86e801e  ! 1094: UDIVX_R	udivx 	%r26, %r30, %r20
	.word 0x9868c01d  ! 1099: UDIVX_R	udivx 	%r3, %r29, %r12
	.word 0xaa6dc012  ! 1104: UDIVX_R	udivx 	%r23, %r18, %r21
	.word 0x9a546001  ! 1109: UMUL_I	umul 	%r17, 0x0001, %r13
	.word 0x8c58e001  ! 1114: SMUL_I	smul 	%r3, 0x0001, %r6
	.word 0xbe56a001  ! 1119: UMUL_I	umul 	%r26, 0x0001, %r31
	.word 0x8c5e000a  ! 1124: SMUL_R	smul 	%r24, %r10, %r6
	.word 0x904f8017  ! 1129: MULX_R	mulx 	%r30, %r23, %r8
	.word 0xa04f800f  ! 1134: MULX_R	mulx 	%r30, %r15, %r16
	.word 0x984e6001  ! 1139: MULX_I	mulx 	%r25, 0x0001, %r12
	.word 0xa96ca001  ! 1144: SDIVX_I	sdivx	%r18, 0x0001, %r20
	.word 0x9e516001  ! 1149: UMUL_I	umul 	%r5, 0x0001, %r15
	.word 0x944a6001  ! 1154: MULX_I	mulx 	%r9, 0x0001, %r10
	.word 0xba5ec007  ! 1159: SMUL_R	smul 	%r27, %r7, %r29
	.word 0x8a7a2001  ! 1164: SDIV_I	sdiv 	%r8, 0x0001, %r5
	.word 0xa96fc01f  ! 1169: SDIVX_R	sdivx	%r31, %r31, %r20
	.word 0x8185a001  ! 1174: WRY_I	wr	%r22, 0x0001, %y
	.word 0xa84b0000  ! 1179: MULX_R	mulx 	%r12, %r0, %r20
	.word 0xa658c01f  ! 1184: SMUL_R	smul 	%r3, %r31, %r19
	.word 0x8a48e001  ! 1189: MULX_I	mulx 	%r3, 0x0001, %r5
	.word 0xb4d42001  ! 1194: UMULcc_I	umulcc 	%r16, 0x0001, %r26
	.word 0x81862001  ! 1199: WRY_I	wr	%r24, 0x0001, %y
	.word 0x8c6f8013  ! 1204: UDIVX_R	udivx 	%r30, %r19, %r6
	.word 0x944f8000  ! 1209: MULX_R	mulx 	%r30, %r0, %r10
	.word 0xb3278007  ! 1214: MULScc_R	mulscc 	%r30, %r7, %r25
	.word 0x92f82001  ! 1219: SDIVcc_I	sdivcc 	%r0, 0x0001, %r9
	.word 0x896d001c  ! 1224: SDIVX_R	sdivx	%r20, %r28, %r4
	.word 0xa0fb400c  ! 1229: SDIVcc_R	sdivcc 	%r13, %r12, %r16
	.word 0xaef44015  ! 1234: UDIVcc_R	udivcc 	%r17, %r21, %r23
	.word 0xbc69800d  ! 1239: UDIVX_R	udivx 	%r6, %r13, %r30
	.word 0x886bc01e  ! 1244: UDIVX_R	udivx 	%r15, %r30, %r4
	.word 0xb26ee001  ! 1249: UDIVX_I	udivx 	%r27, 0x0001, %r25
	.word 0xbb6c6001  ! 1254: SDIVX_I	sdivx	%r17, 0x0001, %r29
	.word 0xa650e001  ! 1259: UMUL_I	umul 	%r3, 0x0001, %r19
	.word 0x8afc0008  ! 1264: SDIVcc_R	sdivcc 	%r16, %r8, %r5
	.word 0xa6698000  ! 1269: UDIVX_R	udivx 	%r6, %r0, %r19
	.word 0x9968e001  ! 1274: SDIVX_I	sdivx	%r3, 0x0001, %r12
	.word 0xbe6e8003  ! 1279: UDIVX_R	udivx 	%r26, %r3, %r31
	.word 0xaeffe001  ! 1284: SDIVcc_I	sdivcc 	%r31, 0x0001, %r23
	.word 0xb2482001  ! 1289: MULX_I	mulx 	%r0, 0x0001, %r25
	.word 0x964c2001  ! 1294: MULX_I	mulx 	%r16, 0x0001, %r11
	.word 0xe8586660  ! 1299: LDX_I	ldx	[%r1 + 0x0660], %r20
	.word 0xa4764016  ! 1304: UDIV_R	udiv 	%r25, %r22, %r18
	.word 0xb4f4a001  ! 1309: UDIVcc_I	udivcc 	%r18, 0x0001, %r26
	.word 0x8e51a001  ! 1314: UMUL_I	umul 	%r6, 0x0001, %r7
	.word 0x904e0010  ! 1319: MULX_R	mulx 	%r24, %r16, %r8
	.word 0x90f4e001  ! 1324: UDIVcc_I	udivcc 	%r19, 0x0001, %r8
	.word 0xa24fe001  ! 1329: MULX_I	mulx 	%r31, 0x0001, %r17
	.word 0x88de6001  ! 1334: SMULcc_I	smulcc 	%r25, 0x0001, %r4
	.word 0xbf6a8016  ! 1339: SDIVX_R	sdivx	%r10, %r22, %r31
	.word 0x8180e001  ! 1344: WRY_I	wr	%r3, 0x0001, %y
	.word 0xae4e8018  ! 1349: MULX_R	mulx 	%r26, %r24, %r23
	.word 0x92518016  ! 1354: UMUL_R	umul 	%r6, %r22, %r9
	.word 0xb84fe001  ! 1359: MULX_I	mulx 	%r31, 0x0001, %r28
	.word 0xbd6a400a  ! 1364: SDIVX_R	sdivx	%r9, %r10, %r30
	.word 0x92f62001  ! 1369: UDIVcc_I	udivcc 	%r24, 0x0001, %r9
	.word 0xa868c000  ! 1374: UDIVX_R	udivx 	%r3, %r0, %r20
	.word 0x96d82001  ! 1379: SMULcc_I	smulcc 	%r0, 0x0001, %r11
	.word 0xb84bc008  ! 1384: MULX_R	mulx 	%r15, %r8, %r28
	.word 0xa76c2001  ! 1389: SDIVX_I	sdivx	%r16, 0x0001, %r19
	.word 0x9e582001  ! 1394: SMUL_I	smul 	%r0, 0x0001, %r15
	.word 0x9e7c4004  ! 1399: SDIV_R	sdiv 	%r17, %r4, %r15
	.word 0x81812001  ! 1404: WRY_I	wr	%r4, 0x0001, %y
	.word 0x96716001  ! 1409: UDIV_I	udiv 	%r5, 0x0001, %r11
	.word 0xa64da001  ! 1414: MULX_I	mulx 	%r22, 0x0001, %r19
	.word 0xb7696001  ! 1419: SDIVX_I	sdivx	%r5, 0x0001, %r27
	.word 0xb8480013  ! 1424: MULX_R	mulx 	%r0, %r19, %r28
	.word 0xba4e6001  ! 1429: MULX_I	mulx 	%r25, 0x0001, %r29
	.word 0xa26f8003  ! 1434: UDIVX_R	udivx 	%r30, %r3, %r17
	.word 0xb8f0c014  ! 1439: UDIVcc_R	udivcc 	%r3, %r20, %r28
	.word 0xba6dc012  ! 1444: UDIVX_R	udivx 	%r23, %r18, %r29
	.word 0xb76ae001  ! 1449: SDIVX_I	sdivx	%r11, 0x0001, %r27
	.word 0xa06ac004  ! 1454: UDIVX_R	udivx 	%r11, %r4, %r16
	.word 0xbd6de001  ! 1459: SDIVX_I	sdivx	%r23, 0x0001, %r30
	.word 0x8673a001  ! 1464: UDIV_I	udiv 	%r14, 0x0001, %r3
	.word 0xbcf34000  ! 1469: UDIVcc_R	udivcc 	%r13, %r0, %r30
	.word 0xa66e8017  ! 1474: UDIVX_R	udivx 	%r26, %r23, %r19
	.word 0x92696001  ! 1479: UDIVX_I	udivx 	%r5, 0x0001, %r9
	.word 0xb6482001  ! 1484: MULX_I	mulx 	%r0, 0x0001, %r27
	.word 0x8c498004  ! 1489: MULX_R	mulx 	%r6, %r4, %r6
	.word 0x9d6d8007  ! 1494: SDIVX_R	sdivx	%r22, %r7, %r14
	.word 0xf0586378  ! 1499: LDX_I	ldx	[%r1 + 0x0378], %r24
	.word 0xbf6ba001  ! 1504: SDIVX_I	sdivx	%r14, 0x0001, %r31
	.word 0xb668c011  ! 1509: UDIVX_R	udivx 	%r3, %r17, %r27
	.word 0xa07f000e  ! 1514: SDIV_R	sdiv 	%r28, %r14, %r16
	.word 0xa0490011  ! 1519: MULX_R	mulx 	%r4, %r17, %r16
	.word 0x81822001  ! 1524: WRY_I	wr	%r8, 0x0001, %y
	.word 0x956ee001  ! 1529: SDIVX_I	sdivx	%r27, 0x0001, %r10
	.word 0x90df801e  ! 1534: SMULcc_R	smulcc 	%r30, %r30, %r8
	.word 0xbf6d8007  ! 1539: SDIVX_R	sdivx	%r22, %r7, %r31
	.word 0xb36a2001  ! 1544: SDIVX_I	sdivx	%r8, 0x0001, %r25
	.word 0xa46d0009  ! 1549: UDIVX_R	udivx 	%r20, %r9, %r18
	.word 0x8181a001  ! 1554: WRY_I	wr	%r6, 0x0001, %y
	.word 0x9b6ec009  ! 1559: SDIVX_R	sdivx	%r27, %r9, %r13
	.word 0xa86d4005  ! 1564: UDIVX_R	udivx 	%r21, %r5, %r20
	.word 0xa06a0014  ! 1569: UDIVX_R	udivx 	%r8, %r20, %r16
	.word 0x8cd6001a  ! 1574: UMULcc_R	umulcc 	%r24, %r26, %r6
	.word 0xac6c0013  ! 1579: UDIVX_R	udivx 	%r16, %r19, %r22
	.word 0x9a76401c  ! 1584: UDIV_R	udiv 	%r25, %r28, %r13
	.word 0xae6c4007  ! 1589: UDIVX_R	udivx 	%r17, %r7, %r23
	.word 0xac6e8005  ! 1594: UDIVX_R	udivx 	%r26, %r5, %r22
	.word 0x9a77a001  ! 1599: UDIV_I	udiv 	%r30, 0x0001, %r13
	.word 0xa168001e  ! 1604: SDIVX_R	sdivx	%r0, %r30, %r16
	.word 0x8183a001  ! 1609: WRY_I	wr	%r14, 0x0001, %y
	.word 0x9253a001  ! 1614: UMUL_I	umul 	%r14, 0x0001, %r9
	.word 0xac4aa001  ! 1619: MULX_I	mulx 	%r10, 0x0001, %r22
	.word 0xaad6401d  ! 1624: UMULcc_R	umulcc 	%r25, %r29, %r21
	.word 0xac79a001  ! 1629: SDIV_I	sdiv 	%r6, 0x0001, %r22
	.word 0x86d2a001  ! 1634: UMULcc_I	umulcc 	%r10, 0x0001, %r3
	.word 0x93236001  ! 1639: MULScc_I	mulscc 	%r13, 0x0001, %r9
	.word 0x92496001  ! 1644: MULX_I	mulx 	%r5, 0x0001, %r9
	.word 0xa04e6001  ! 1649: MULX_I	mulx 	%r25, 0x0001, %r16
	.word 0xa96b400a  ! 1654: SDIVX_R	sdivx	%r13, %r10, %r20
	.word 0x976c800c  ! 1659: SDIVX_R	sdivx	%r18, %r12, %r11
	.word 0xb76bc000  ! 1664: SDIVX_R	sdivx	%r15, %r0, %r27
	.word 0xea586138  ! 1669: LDX_I	ldx	[%r1 + 0x0138], %r21
	.word 0xe858a2a0  ! 1674: LDX_I	ldx	[%r2 + 0x02a0], %r20
	.word 0x8e492001  ! 1679: MULX_I	mulx 	%r4, 0x0001, %r7
	.word 0x81802001  ! 1684: WRY_I	wr	%r0, 0x0001, %y
	.word 0xbb6a6001  ! 1689: SDIVX_I	sdivx	%r9, 0x0001, %r29
	.word 0x884ec018  ! 1694: MULX_R	mulx 	%r27, %r24, %r4
	.word 0xb16b0000  ! 1699: SDIVX_R	sdivx	%r12, %r0, %r24
	.word 0x8a4c4016  ! 1704: MULX_R	mulx 	%r17, %r22, %r5
	.word 0xa87b0004  ! 1709: SDIV_R	sdiv 	%r12, %r4, %r20
	.word 0xbe72c01a  ! 1714: UDIV_R	udiv 	%r11, %r26, %r31
	.word 0x8c59801d  ! 1719: SMUL_R	smul 	%r6, %r29, %r6
	.word 0x8a4bc01f  ! 1724: MULX_R	mulx 	%r15, %r31, %r5
	.word 0xa87cc01f  ! 1729: SDIV_R	sdiv 	%r19, %r31, %r20
	.word 0xb873a001  ! 1734: UDIV_I	udiv 	%r14, 0x0001, %r28
	.word 0x906e400b  ! 1739: UDIVX_R	udivx 	%r25, %r11, %r8
	.word 0x9849a001  ! 1744: MULX_I	mulx 	%r6, 0x0001, %r12
	.word 0xb06d801c  ! 1749: UDIVX_R	udivx 	%r22, %r28, %r24
	.word 0xb8536001  ! 1754: UMUL_I	umul 	%r13, 0x0001, %r28
	.word 0x94d58012  ! 1759: UMULcc_R	umulcc 	%r22, %r18, %r10
	.word 0x887a4013  ! 1764: SDIV_R	sdiv 	%r9, %r19, %r4
	.word 0xac6d8010  ! 1769: UDIVX_R	udivx 	%r22, %r16, %r22
	.word 0x984a6001  ! 1774: MULX_I	mulx 	%r9, 0x0001, %r12
	.word 0xbc4f800d  ! 1779: MULX_R	mulx 	%r30, %r13, %r30
	.word 0x8e4fa001  ! 1784: MULX_I	mulx 	%r30, 0x0001, %r7
	.word 0xac48c018  ! 1789: MULX_R	mulx 	%r3, %r24, %r22
	.word 0xb0694007  ! 1794: UDIVX_R	udivx 	%r5, %r7, %r24
	.word 0x81876001  ! 1799: WRY_I	wr	%r29, 0x0001, %y
	.word 0x9725a001  ! 1804: MULScc_I	mulscc 	%r22, 0x0001, %r11
	.word 0x906dc01b  ! 1809: UDIVX_R	udivx 	%r23, %r27, %r8
	.word 0x8ef2a001  ! 1814: UDIVcc_I	udivcc 	%r10, 0x0001, %r7
	.word 0xa4f1c007  ! 1819: UDIVcc_R	udivcc 	%r7, %r7, %r18
	.word 0xaef0e001  ! 1824: UDIVcc_I	udivcc 	%r3, 0x0001, %r23
	.word 0x8649c00c  ! 1829: MULX_R	mulx 	%r7, %r12, %r3
	.word 0xa4714016  ! 1834: UDIV_R	udiv 	%r5, %r22, %r18
	.word 0x92532001  ! 1839: UMUL_I	umul 	%r12, 0x0001, %r9
	.word 0x98dfe001  ! 1844: SMULcc_I	smulcc 	%r31, 0x0001, %r12
	.word 0x9e5ae001  ! 1849: SMUL_I	smul 	%r11, 0x0001, %r15
	.word 0xa722e001  ! 1854: MULScc_I	mulscc 	%r11, 0x0001, %r19
	.word 0xa66f6001  ! 1859: UDIVX_I	udivx 	%r29, 0x0001, %r19
	.word 0x8c4d801d  ! 1864: MULX_R	mulx 	%r22, %r29, %r6
	.word 0xa06da001  ! 1869: UDIVX_I	udivx 	%r22, 0x0001, %r16
	.word 0x984c6001  ! 1874: MULX_I	mulx 	%r17, 0x0001, %r12
	.word 0xab6de001  ! 1879: SDIVX_I	sdivx	%r23, 0x0001, %r21
	.word 0xb66fc005  ! 1884: UDIVX_R	udivx 	%r31, %r5, %r27
	.word 0xb86b8009  ! 1889: UDIVX_R	udivx 	%r14, %r9, %r28
	.word 0x876f0008  ! 1894: SDIVX_R	sdivx	%r28, %r8, %r3
	.word 0xab234004  ! 1899: MULScc_R	mulscc 	%r13, %r4, %r21
	.word 0x8ed3a001  ! 1904: UMULcc_I	umulcc 	%r14, 0x0001, %r7
	.word 0xa05be001  ! 1909: SMUL_I	smul 	%r15, 0x0001, %r16
	.word 0x8e69000d  ! 1914: UDIVX_R	udivx 	%r4, %r13, %r7
	.word 0xa6f82001  ! 1919: SDIVcc_I	sdivcc 	%r0, 0x0001, %r19
	.word 0x9e552001  ! 1924: UMUL_I	umul 	%r20, 0x0001, %r15
	.word 0x8a4ce001  ! 1929: MULX_I	mulx 	%r19, 0x0001, %r5
	.word 0x9a4d8004  ! 1934: MULX_R	mulx 	%r22, %r4, %r13
	.word 0x87682001  ! 1939: SDIVX_I	sdivx	%r0, 0x0001, %r3
	.word 0xb85d800c  ! 1944: SMUL_R	smul 	%r22, %r12, %r28
	.word 0xaa4dc000  ! 1949: MULX_R	mulx 	%r23, %r0, %r21
	.word 0xac4cc016  ! 1954: MULX_R	mulx 	%r19, %r22, %r22
	.word 0xa84c0009  ! 1959: MULX_R	mulx 	%r16, %r9, %r20
	.word 0x98d0e001  ! 1964: UMULcc_I	umulcc 	%r3, 0x0001, %r12
	.word 0x8e4c2001  ! 1969: MULX_I	mulx 	%r16, 0x0001, %r7
	.word 0xa8ffc000  ! 1974: SDIVcc_R	sdivcc 	%r31, %r0, %r20
	.word 0xbd212001  ! 1979: MULScc_I	mulscc 	%r4, 0x0001, %r30
	.word 0x8af36001  ! 1984: UDIVcc_I	udivcc 	%r13, 0x0001, %r5
	.word 0xbc55e001  ! 1989: UMUL_I	umul 	%r23, 0x0001, %r30
	.word 0xb46fc00f  ! 1994: UDIVX_R	udivx 	%r31, %r15, %r26
	.word 0x8efe001e  ! 1999: SDIVcc_R	sdivcc 	%r24, %r30, %r7
	.word 0xf258a0c8  ! 2004: LDX_I	ldx	[%r2 + 0x00c8], %r25
	.word 0xaef66001  ! 2009: UDIVcc_I	udivcc 	%r25, 0x0001, %r23
	.word 0x9569e001  ! 2014: SDIVX_I	sdivx	%r7, 0x0001, %r10
	.word 0x8e4fe001  ! 2019: MULX_I	mulx 	%r31, 0x0001, %r7
	.word 0x896b800a  ! 2024: SDIVX_R	sdivx	%r14, %r10, %r4
	.word 0x884d2001  ! 2029: MULX_I	mulx 	%r20, 0x0001, %r4
	.word 0xa1214015  ! 2034: MULScc_R	mulscc 	%r5, %r21, %r16
	.word 0xb2482001  ! 2039: MULX_I	mulx 	%r0, 0x0001, %r25
	.word 0x9568000d  ! 2044: SDIVX_R	sdivx	%r0, %r13, %r10
	.word 0x8cd8e001  ! 2049: SMULcc_I	smulcc 	%r3, 0x0001, %r6
	.word 0x9e6cc01b  ! 2054: UDIVX_R	udivx 	%r19, %r27, %r15
	.word 0xab6ec009  ! 2059: SDIVX_R	sdivx	%r27, %r9, %r21
	.word 0x86d5801e  ! 2064: UMULcc_R	umulcc 	%r22, %r30, %r3
	.word 0x8185a001  ! 2069: WRY_I	wr	%r22, 0x0001, %y
	.word 0xb3682001  ! 2074: SDIVX_I	sdivx	%r0, 0x0001, %r25
	.word 0xbc494011  ! 2079: MULX_R	mulx 	%r5, %r17, %r30
	.word 0x9849e001  ! 2084: MULX_I	mulx 	%r7, 0x0001, %r12
	.word 0xd058a178  ! 2089: LDX_I	ldx	[%r2 + 0x0178], %r8
	.word 0x81802001  ! 2094: WRY_I	wr	%r0, 0x0001, %y
	.word 0xb36f800a  ! 2099: SDIVX_R	sdivx	%r30, %r10, %r25
	.word 0xa56ea001  ! 2104: SDIVX_I	sdivx	%r26, 0x0001, %r18
	.word 0xb4f2800b  ! 2109: UDIVcc_R	udivcc 	%r10, %r11, %r26
	.word 0x8a58e001  ! 2114: SMUL_I	smul 	%r3, 0x0001, %r5
	.word 0xa04ac010  ! 2119: MULX_R	mulx 	%r11, %r16, %r16
	.word 0x9c6f401e  ! 2124: UDIVX_R	udivx 	%r29, %r30, %r14
	.word 0xa7680000  ! 2129: SDIVX_R	sdivx	%r0, %r0, %r19
	.word 0xb8480018  ! 2134: MULX_R	mulx 	%r0, %r24, %r28
	.word 0x976cc00a  ! 2139: SDIVX_R	sdivx	%r19, %r10, %r11
	.word 0xb049a001  ! 2144: MULX_I	mulx 	%r6, 0x0001, %r24
	.word 0xb568e001  ! 2149: SDIVX_I	sdivx	%r3, 0x0001, %r26
	.word 0x936ae001  ! 2154: SDIVX_I	sdivx	%r11, 0x0001, %r9
	.word 0x904e6001  ! 2159: MULX_I	mulx 	%r25, 0x0001, %r8
	.word 0xb56b0015  ! 2164: SDIVX_R	sdivx	%r12, %r21, %r26
	.word 0x8cf3c011  ! 2169: UDIVcc_R	udivcc 	%r15, %r17, %r6
	.word 0xa0f9e001  ! 2174: SDIVcc_I	sdivcc 	%r7, 0x0001, %r16
	.word 0xbb6e4013  ! 2179: SDIVX_R	sdivx	%r25, %r19, %r29
	.word 0xa25e401b  ! 2184: SMUL_R	smul 	%r25, %r27, %r17
	.word 0xba69800b  ! 2189: UDIVX_R	udivx 	%r6, %r11, %r29
	.word 0xae4a8012  ! 2194: MULX_R	mulx 	%r10, %r18, %r23
	.word 0x92d5400d  ! 2199: UMULcc_R	umulcc 	%r21, %r13, %r9
	.word 0xb05c800c  ! 2204: SMUL_R	smul 	%r18, %r12, %r24
	.word 0xa26ee001  ! 2209: UDIVX_I	udivx 	%r27, 0x0001, %r17
	.word 0xba6ee001  ! 2214: UDIVX_I	udivx 	%r27, 0x0001, %r29
	.word 0xbc4d2001  ! 2219: MULX_I	mulx 	%r20, 0x0001, %r30
	.word 0x96d90016  ! 2224: SMULcc_R	smulcc 	%r4, %r22, %r11
	.word 0xb46b001b  ! 2229: UDIVX_R	udivx 	%r12, %r27, %r26
	.word 0xb8fbc01d  ! 2234: SDIVcc_R	sdivcc 	%r15, %r29, %r28
	.word 0x8effa001  ! 2239: SDIVcc_I	sdivcc 	%r30, 0x0001, %r7
	.word 0xa04b400b  ! 2244: MULX_R	mulx 	%r13, %r11, %r16
	.word 0x8adec01a  ! 2249: SMULcc_R	smulcc 	%r27, %r26, %r5
	.word 0x90752001  ! 2254: UDIV_I	udiv 	%r20, 0x0001, %r8
	.word 0x9ed6e001  ! 2259: UMULcc_I	umulcc 	%r27, 0x0001, %r15
	.word 0xb46dc000  ! 2264: UDIVX_R	udivx 	%r23, %r0, %r26
	.word 0x8edc0016  ! 2269: SMULcc_R	smulcc 	%r16, %r22, %r7
	.word 0xa36b001f  ! 2274: SDIVX_R	sdivx	%r12, %r31, %r17
	.word 0x886c0011  ! 2279: UDIVX_R	udivx 	%r16, %r17, %r4
	.word 0x81862001  ! 2284: WRY_I	wr	%r24, 0x0001, %y
	.word 0x8969e001  ! 2289: SDIVX_I	sdivx	%r7, 0x0001, %r4
	.word 0x86492001  ! 2294: MULX_I	mulx 	%r4, 0x0001, %r3
	.word 0x8182a001  ! 2299: WRY_I	wr	%r10, 0x0001, %y
	.word 0xb6492001  ! 2304: MULX_I	mulx 	%r4, 0x0001, %r27
	.word 0x8a49800e  ! 2309: MULX_R	mulx 	%r6, %r14, %r5
	.word 0x9a720010  ! 2314: UDIV_R	udiv 	%r8, %r16, %r13
	.word 0x8a6dc00d  ! 2319: UDIVX_R	udivx 	%r23, %r13, %r5
	.word 0x8183e001  ! 2324: WRY_I	wr	%r15, 0x0001, %y
	.word 0xa477c009  ! 2329: UDIV_R	udiv 	%r31, %r9, %r18
	.word 0x8e690019  ! 2334: UDIVX_R	udivx 	%r4, %r25, %r7
	.word 0xb87fc003  ! 2339: SDIV_R	sdiv 	%r31, %r3, %r28
	.word 0xd458a328  ! 2344: LDX_I	ldx	[%r2 + 0x0328], %r10
	.word 0xb85ca001  ! 2349: SMUL_I	smul 	%r18, 0x0001, %r28
	.word 0x86d42001  ! 2354: UMULcc_I	umulcc 	%r16, 0x0001, %r3
	.word 0xb4f7400d  ! 2359: UDIVcc_R	udivcc 	%r29, %r13, %r26
	.word 0xba4d2001  ! 2364: MULX_I	mulx 	%r20, 0x0001, %r29
	.word 0x8a6b4004  ! 2369: UDIVX_R	udivx 	%r13, %r4, %r5
	.word 0x927bc004  ! 2374: SDIV_R	sdiv 	%r15, %r4, %r9
	.word 0xb47f4000  ! 2379: SDIV_R	sdiv 	%r29, %r0, %r26
	.word 0xb27cc016  ! 2384: SDIV_R	sdiv 	%r19, %r22, %r25
	.word 0x9e4a400b  ! 2389: MULX_R	mulx 	%r9, %r11, %r15
	.word 0xb4f9e001  ! 2394: SDIVcc_I	sdivcc 	%r7, 0x0001, %r26
	.word 0x92fa0004  ! 2399: SDIVcc_R	sdivcc 	%r8, %r4, %r9
	.word 0xa84f4000  ! 2404: MULX_R	mulx 	%r29, %r0, %r20
	.word 0xae782001  ! 2409: SDIV_I	sdiv 	%r0, 0x0001, %r23
	.word 0xaed92001  ! 2414: SMULcc_I	smulcc 	%r4, 0x0001, %r23
	.word 0xbadba001  ! 2419: SMULcc_I	smulcc 	%r14, 0x0001, %r29
	.word 0xbf6d400e  ! 2424: SDIVX_R	sdivx	%r21, %r14, %r31
	.word 0x966a400f  ! 2429: UDIVX_R	udivx 	%r9, %r15, %r11
	.word 0xacd8001c  ! 2434: SMULcc_R	smulcc 	%r0, %r28, %r22
	.word 0xad6c800c  ! 2439: SDIVX_R	sdivx	%r18, %r12, %r22
	.word 0x8e4f6001  ! 2444: MULX_I	mulx 	%r29, 0x0001, %r7
	.word 0x81852001  ! 2449: WRY_I	wr	%r20, 0x0001, %y
	.word 0xa24b000e  ! 2454: MULX_R	mulx 	%r12, %r14, %r17
	.word 0xb169c006  ! 2459: SDIVX_R	sdivx	%r7, %r6, %r24
	.word 0xa6f56001  ! 2464: UDIVcc_I	udivcc 	%r21, 0x0001, %r19
	.word 0x964a400c  ! 2469: MULX_R	mulx 	%r9, %r12, %r11
	.word 0xb1268007  ! 2474: MULScc_R	mulscc 	%r26, %r7, %r24
	.word 0x9b240017  ! 2479: MULScc_R	mulscc 	%r16, %r23, %r13
	.word 0x9076400f  ! 2484: UDIV_R	udiv 	%r25, %r15, %r8
	.word 0xb326801e  ! 2489: MULScc_R	mulscc 	%r26, %r30, %r25
	.word 0x88fa0017  ! 2494: SDIVcc_R	sdivcc 	%r8, %r23, %r4
	.word 0xbe4a001f  ! 2499: MULX_R	mulx 	%r8, %r31, %r31
	.word 0xb4dd8005  ! 2504: SMULcc_R	smulcc 	%r22, %r5, %r26
	.word 0xa068c01d  ! 2509: UDIVX_R	udivx 	%r3, %r29, %r16
	.word 0x8a54400d  ! 2514: UMUL_R	umul 	%r17, %r13, %r5
	.word 0xb84d2001  ! 2519: MULX_I	mulx 	%r20, 0x0001, %r28
	.word 0x996d4010  ! 2524: SDIVX_R	sdivx	%r21, %r16, %r12
	.word 0x9a6e001f  ! 2529: UDIVX_R	udivx 	%r24, %r31, %r13
	.word 0xae49e001  ! 2534: MULX_I	mulx 	%r7, 0x0001, %r23
	.word 0x8181a001  ! 2539: WRY_I	wr	%r6, 0x0001, %y
	.word 0xbd276001  ! 2544: MULScc_I	mulscc 	%r29, 0x0001, %r30
	.word 0x8af4c01a  ! 2549: UDIVcc_R	udivcc 	%r19, %r26, %r5
	.word 0x8b6d4010  ! 2554: SDIVX_R	sdivx	%r21, %r16, %r5
	.word 0xa857a001  ! 2559: UMUL_I	umul 	%r30, 0x0001, %r20
	.word 0x866d4005  ! 2564: UDIVX_R	udivx 	%r21, %r5, %r3
	.word 0x8181a001  ! 2569: WRY_I	wr	%r6, 0x0001, %y
	.word 0xac7bc018  ! 2574: SDIV_R	sdiv 	%r15, %r24, %r22
	.word 0xb47e0017  ! 2579: SDIV_R	sdiv 	%r24, %r23, %r26
	.word 0xb24f4000  ! 2584: MULX_R	mulx 	%r29, %r0, %r25
	.word 0xa8748019  ! 2589: UDIV_R	udiv 	%r18, %r25, %r20
	.word 0x9a7aa001  ! 2594: SDIV_I	sdiv 	%r10, 0x0001, %r13
	.word 0x8185a001  ! 2599: WRY_I	wr	%r22, 0x0001, %y
	.word 0xad6b4007  ! 2604: SDIVX_R	sdivx	%r13, %r7, %r22
	.word 0xbc5dc011  ! 2609: SMUL_R	smul 	%r23, %r17, %r30
	.word 0x9926001a  ! 2614: MULScc_R	mulscc 	%r24, %r26, %r12
	.word 0xaf6be001  ! 2619: SDIVX_I	sdivx	%r15, 0x0001, %r23
	.word 0xa56ea001  ! 2624: SDIVX_I	sdivx	%r26, 0x0001, %r18
	.word 0x97694009  ! 2629: SDIVX_R	sdivx	%r5, %r9, %r11
	.word 0x8181e001  ! 2634: WRY_I	wr	%r7, 0x0001, %y
	.word 0xb64f6001  ! 2639: MULX_I	mulx 	%r29, 0x0001, %r27
	.word 0xa64a4009  ! 2644: MULX_R	mulx 	%r9, %r9, %r19
	.word 0xb66c0014  ! 2649: UDIVX_R	udivx 	%r16, %r20, %r27
	.word 0xa2f7e001  ! 2654: UDIVcc_I	udivcc 	%r31, 0x0001, %r17
	.word 0xad6f2001  ! 2659: SDIVX_I	sdivx	%r28, 0x0001, %r22
	.word 0x987dc01e  ! 2664: SDIV_R	sdiv 	%r23, %r30, %r12
	.word 0xa4d42001  ! 2669: UMULcc_I	umulcc 	%r16, 0x0001, %r18
	.word 0xbc4aa001  ! 2674: MULX_I	mulx 	%r10, 0x0001, %r30
	.word 0xa24b0016  ! 2679: MULX_R	mulx 	%r12, %r22, %r17
	.word 0xb86da001  ! 2684: UDIVX_I	udivx 	%r22, 0x0001, %r28
	.word 0x9af92001  ! 2689: SDIVcc_I	sdivcc 	%r4, 0x0001, %r13
	.word 0xa0482001  ! 2694: MULX_I	mulx 	%r0, 0x0001, %r16
	.word 0x86d46001  ! 2699: UMULcc_I	umulcc 	%r17, 0x0001, %r3
	.word 0xb8fd4019  ! 2704: SDIVcc_R	sdivcc 	%r21, %r25, %r28
	.word 0x9272001f  ! 2709: UDIV_R	udiv 	%r8, %r31, %r9
	.word 0xa16fc013  ! 2714: SDIVX_R	sdivx	%r31, %r19, %r16
	.word 0x924a8018  ! 2719: MULX_R	mulx 	%r10, %r24, %r9
	.word 0x98df8018  ! 2724: SMULcc_R	smulcc 	%r30, %r24, %r12
	.word 0x81802001  ! 2729: WRY_I	wr	%r0, 0x0001, %y
	.word 0xa2794006  ! 2734: SDIV_R	sdiv 	%r5, %r6, %r17
	.word 0xbc51401c  ! 2739: UMUL_R	umul 	%r5, %r28, %r30
	.word 0xa27a4018  ! 2744: SDIV_R	sdiv 	%r9, %r24, %r17
	.word 0xda586180  ! 2749: LDX_I	ldx	[%r1 + 0x0180], %r13
	.word 0x966cc00c  ! 2754: UDIVX_R	udivx 	%r19, %r12, %r11
	.word 0xb8fac016  ! 2759: SDIVcc_R	sdivcc 	%r11, %r22, %r28
	.word 0xb26b8006  ! 2764: UDIVX_R	udivx 	%r14, %r6, %r25
	.word 0xad69001e  ! 2769: SDIVX_R	sdivx	%r4, %r30, %r22
	.word 0xbafa8019  ! 2774: SDIVcc_R	sdivcc 	%r10, %r25, %r29
	.word 0x90494015  ! 2779: MULX_R	mulx 	%r5, %r21, %r8
	.word 0xb84b2001  ! 2784: MULX_I	mulx 	%r12, 0x0001, %r28
	.word 0xb2d80000  ! 2789: SMULcc_R	smulcc 	%r0, %r0, %r25
	.word 0xa4dfc009  ! 2794: SMULcc_R	smulcc 	%r31, %r9, %r18
	.word 0x8c6b6001  ! 2799: UDIVX_I	udivx 	%r13, 0x0001, %r6
	.word 0x8a5bc009  ! 2804: SMUL_R	smul 	%r15, %r9, %r5
	.word 0xb269c01d  ! 2809: UDIVX_R	udivx 	%r7, %r29, %r25
	.word 0x926f001d  ! 2814: UDIVX_R	udivx 	%r28, %r29, %r9
	.word 0xae4e2001  ! 2819: MULX_I	mulx 	%r24, 0x0001, %r23
	.word 0x9e570005  ! 2824: UMUL_R	umul 	%r28, %r5, %r15
	.word 0x9a4c000d  ! 2829: MULX_R	mulx 	%r16, %r13, %r13
	.word 0xb2d2c01e  ! 2834: UMULcc_R	umulcc 	%r11, %r30, %r25
	.word 0xec586230  ! 2839: LDX_I	ldx	[%r1 + 0x0230], %r22
	.word 0xbad58010  ! 2844: UMULcc_R	umulcc 	%r22, %r16, %r29
	.word 0x985ee001  ! 2849: SMUL_I	smul 	%r27, 0x0001, %r12
	.word 0xb2f28013  ! 2854: UDIVcc_R	udivcc 	%r10, %r19, %r25
	.word 0xd6586230  ! 2859: LDX_I	ldx	[%r1 + 0x0230], %r11
	.word 0x984da001  ! 2864: MULX_I	mulx 	%r22, 0x0001, %r12
	.word 0x8848e001  ! 2869: MULX_I	mulx 	%r3, 0x0001, %r4
	.word 0x9a690014  ! 2874: UDIVX_R	udivx 	%r4, %r20, %r13
	.word 0xbd26000b  ! 2879: MULScc_R	mulscc 	%r24, %r11, %r30
	.word 0x996b001a  ! 2884: SDIVX_R	sdivx	%r12, %r26, %r12
	.word 0x876ec00a  ! 2889: SDIVX_R	sdivx	%r27, %r10, %r3
	.word 0x9526e001  ! 2894: MULScc_I	mulscc 	%r27, 0x0001, %r10
	.word 0x896e4016  ! 2899: SDIVX_R	sdivx	%r25, %r22, %r4
	.word 0xb66f801c  ! 2904: UDIVX_R	udivx 	%r30, %r28, %r27
	.word 0x886e0018  ! 2909: UDIVX_R	udivx 	%r24, %r24, %r4
	.word 0x936d6001  ! 2914: SDIVX_I	sdivx	%r21, 0x0001, %r9
	.word 0xa24ec011  ! 2919: MULX_R	mulx 	%r27, %r17, %r17
	.word 0xb4fe801d  ! 2924: SDIVcc_R	sdivcc 	%r26, %r29, %r26
	.word 0x81842001  ! 2929: WRY_I	wr	%r16, 0x0001, %y
	.word 0xae4d6001  ! 2934: MULX_I	mulx 	%r21, 0x0001, %r23
	.word 0xb44f8000  ! 2939: MULX_R	mulx 	%r30, %r0, %r26
	.word 0x8a6ca001  ! 2944: UDIVX_I	udivx 	%r18, 0x0001, %r5
	.word 0xbc6ac01b  ! 2949: UDIVX_R	udivx 	%r11, %r27, %r30
	.word 0x936aa001  ! 2954: SDIVX_I	sdivx	%r10, 0x0001, %r9
	.word 0x8a782001  ! 2959: SDIV_I	sdiv 	%r0, 0x0001, %r5
	.word 0x88d0c00d  ! 2964: UMULcc_R	umulcc 	%r3, %r13, %r4
	.word 0x9c4d001e  ! 2969: MULX_R	mulx 	%r20, %r30, %r14
	.word 0x89680004  ! 2974: SDIVX_R	sdivx	%r0, %r4, %r4
	.word 0xb275800a  ! 2979: UDIV_R	udiv 	%r22, %r10, %r25
	.word 0xbc4d8000  ! 2984: MULX_R	mulx 	%r22, %r0, %r30
	.word 0x96714012  ! 2989: UDIV_R	udiv 	%r5, %r18, %r11
	.word 0x924bc007  ! 2994: MULX_R	mulx 	%r15, %r7, %r9
	.word 0x9e6dc01e  ! 2999: UDIVX_R	udivx 	%r23, %r30, %r15
	.word 0xb44c2001  ! 3004: MULX_I	mulx 	%r16, 0x0001, %r26
	.word 0xa44be001  ! 3009: MULX_I	mulx 	%r15, 0x0001, %r18
	.word 0xbcd12001  ! 3014: UMULcc_I	umulcc 	%r4, 0x0001, %r30
	.word 0x866ee001  ! 3019: UDIVX_I	udivx 	%r27, 0x0001, %r3
	.word 0x94f42001  ! 3024: UDIVcc_I	udivcc 	%r16, 0x0001, %r10
	.word 0xa6d42001  ! 3029: UMULcc_I	umulcc 	%r16, 0x0001, %r19
	.word 0xb4db0014  ! 3034: SMULcc_R	smulcc 	%r12, %r20, %r26
	.word 0x947ac01c  ! 3039: SDIV_R	sdiv 	%r11, %r28, %r10
	.word 0x8a6f000c  ! 3044: UDIVX_R	udivx 	%r28, %r12, %r5
	.word 0xba6b001d  ! 3049: UDIVX_R	udivx 	%r12, %r29, %r29
	.word 0x9efd2001  ! 3054: SDIVcc_I	sdivcc 	%r20, 0x0001, %r15
	.word 0xa96aa001  ! 3059: SDIVX_I	sdivx	%r10, 0x0001, %r20
	.word 0xba4cc009  ! 3064: MULX_R	mulx 	%r19, %r9, %r29
	.word 0xb04ea001  ! 3069: MULX_I	mulx 	%r26, 0x0001, %r24
	.word 0xb44ae001  ! 3074: MULX_I	mulx 	%r11, 0x0001, %r26
	.word 0x904b4015  ! 3079: MULX_R	mulx 	%r13, %r21, %r8
	.word 0xb6f2e001  ! 3084: UDIVcc_I	udivcc 	%r11, 0x0001, %r27
	.word 0x9e69a001  ! 3089: UDIVX_I	udivx 	%r6, 0x0001, %r15
	.word 0x86d9a001  ! 3094: SMULcc_I	smulcc 	%r6, 0x0001, %r3
	.word 0x987ea001  ! 3099: SDIV_I	sdiv 	%r26, 0x0001, %r12
	.word 0x8af3800b  ! 3104: UDIVcc_R	udivcc 	%r14, %r11, %r5
	.word 0xad6c801a  ! 3109: SDIVX_R	sdivx	%r18, %r26, %r22
	.word 0xb04d6001  ! 3114: MULX_I	mulx 	%r21, 0x0001, %r24
	.word 0x8cd36001  ! 3119: UMULcc_I	umulcc 	%r13, 0x0001, %r6
	.word 0xe2586540  ! 3124: LDX_I	ldx	[%r1 + 0x0540], %r17
	.word 0x94700006  ! 3129: UDIV_R	udiv 	%r0, %r6, %r10
	.word 0x9e6f2001  ! 3134: UDIVX_I	udivx 	%r28, 0x0001, %r15
	.word 0xb86d8005  ! 3139: UDIVX_R	udivx 	%r22, %r5, %r28
	.word 0xa76d4019  ! 3144: SDIVX_R	sdivx	%r21, %r25, %r19
	.word 0x8c576001  ! 3149: UMUL_I	umul 	%r29, 0x0001, %r6
	.word 0xa6490017  ! 3154: MULX_R	mulx 	%r4, %r23, %r19
	.word 0xa0ffa001  ! 3159: SDIVcc_I	sdivcc 	%r30, 0x0001, %r16
	.word 0x896b2001  ! 3164: SDIVX_I	sdivx	%r12, 0x0001, %r4
	.word 0xac4e0004  ! 3169: MULX_R	mulx 	%r24, %r4, %r22
	.word 0xb2742001  ! 3174: UDIV_I	udiv 	%r16, 0x0001, %r25
	.word 0x8f6ac010  ! 3179: SDIVX_R	sdivx	%r11, %r16, %r7
	.word 0x9d682001  ! 3184: SDIVX_I	sdivx	%r0, 0x0001, %r14
	.word 0x8c48000d  ! 3189: MULX_R	mulx 	%r0, %r13, %r6
	.word 0xaaf12001  ! 3194: UDIVcc_I	udivcc 	%r4, 0x0001, %r21
	.word 0xae7c6001  ! 3199: SDIV_I	sdiv 	%r17, 0x0001, %r23
	.word 0xab242001  ! 3204: MULScc_I	mulscc 	%r16, 0x0001, %r21
	.word 0xb25f4015  ! 3209: SMUL_R	smul 	%r29, %r21, %r25
	.word 0xa8552001  ! 3214: UMUL_I	umul 	%r20, 0x0001, %r20
	.word 0xd2586258  ! 3219: LDX_I	ldx	[%r1 + 0x0258], %r9
	.word 0xfa5862c8  ! 3224: LDX_I	ldx	[%r1 + 0x02c8], %r29
	.word 0xac480010  ! 3229: MULX_R	mulx 	%r0, %r16, %r22
	.word 0xa24ec01f  ! 3234: MULX_R	mulx 	%r27, %r31, %r17
	.word 0xa671a001  ! 3239: UDIV_I	udiv 	%r6, 0x0001, %r19
	.word 0xa56e2001  ! 3244: SDIVX_I	sdivx	%r24, 0x0001, %r18
	.word 0xacd0c010  ! 3249: UMULcc_R	umulcc 	%r3, %r16, %r22
	.word 0x90d4001c  ! 3254: UMULcc_R	umulcc 	%r16, %r28, %r8
	.word 0x9674e001  ! 3259: UDIV_I	udiv 	%r19, 0x0001, %r11
	.word 0xb2482001  ! 3264: MULX_I	mulx 	%r0, 0x0001, %r25
	.word 0xfc58a510  ! 3269: LDX_I	ldx	[%r2 + 0x0510], %r30
	.word 0x964a800a  ! 3274: MULX_R	mulx 	%r10, %r10, %r11
	.word 0xbe6c6001  ! 3279: UDIVX_I	udivx 	%r17, 0x0001, %r31
	.word 0xb84ce001  ! 3284: MULX_I	mulx 	%r19, 0x0001, %r28
	.word 0x8af32001  ! 3289: UDIVcc_I	udivcc 	%r12, 0x0001, %r5
	.word 0x99274012  ! 3294: MULScc_R	mulscc 	%r29, %r18, %r12
	.word 0x9c4a6001  ! 3299: MULX_I	mulx 	%r9, 0x0001, %r14
	.word 0xb653a001  ! 3304: UMUL_I	umul 	%r14, 0x0001, %r27
	.word 0x8f256001  ! 3309: MULScc_I	mulscc 	%r21, 0x0001, %r7
	.word 0x906b0012  ! 3314: UDIVX_R	udivx 	%r12, %r18, %r8
	.word 0xce5860c8  ! 3319: LDX_I	ldx	[%r1 + 0x00c8], %r7
	.word 0xaadb6001  ! 3324: SMULcc_I	smulcc 	%r13, 0x0001, %r21
	.word 0x9afe000f  ! 3329: SDIVcc_R	sdivcc 	%r24, %r15, %r13
	.word 0xbc48e001  ! 3334: MULX_I	mulx 	%r3, 0x0001, %r30
	.word 0x8d6c4005  ! 3339: SDIVX_R	sdivx	%r17, %r5, %r6
	.word 0x986da001  ! 3344: UDIVX_I	udivx 	%r22, 0x0001, %r12
	.word 0x886a2001  ! 3349: UDIVX_I	udivx 	%r8, 0x0001, %r4
	.word 0xa0790016  ! 3354: SDIV_R	sdiv 	%r4, %r22, %r16
	.word 0xb26bc01a  ! 3359: UDIVX_R	udivx 	%r15, %r26, %r25
	.word 0x8c4e0003  ! 3364: MULX_R	mulx 	%r24, %r3, %r6
	.word 0x985d000b  ! 3369: SMUL_R	smul 	%r20, %r11, %r12
	.word 0x9a7d6001  ! 3374: SDIV_I	sdiv 	%r21, 0x0001, %r13
	.word 0x9848c017  ! 3379: MULX_R	mulx 	%r3, %r23, %r12
	.word 0xbe68c017  ! 3384: UDIVX_R	udivx 	%r3, %r23, %r31
	.word 0xb0fb6001  ! 3389: SDIVcc_I	sdivcc 	%r13, 0x0001, %r24
	.word 0x86722001  ! 3394: UDIV_I	udiv 	%r8, 0x0001, %r3
	.word 0x904f8018  ! 3399: MULX_R	mulx 	%r30, %r24, %r8
	.word 0xb16dc009  ! 3404: SDIVX_R	sdivx	%r23, %r9, %r24
	.word 0xb06c8012  ! 3409: UDIVX_R	udivx 	%r18, %r18, %r24
	.word 0xb06e8007  ! 3414: UDIVX_R	udivx 	%r26, %r7, %r24
	.word 0x8c4dc00b  ! 3419: MULX_R	mulx 	%r23, %r11, %r6
	.word 0xa66a8011  ! 3424: UDIVX_R	udivx 	%r10, %r17, %r19
	.word 0xba6ba001  ! 3429: UDIVX_I	udivx 	%r14, 0x0001, %r29
	.word 0xa6fd6001  ! 3434: SDIVcc_I	sdivcc 	%r21, 0x0001, %r19
	.word 0x9468000d  ! 3439: UDIVX_R	udivx 	%r0, %r13, %r10
	.word 0x96fe4005  ! 3444: SDIVcc_R	sdivcc 	%r25, %r5, %r11
	.word 0x8e4f6001  ! 3449: MULX_I	mulx 	%r29, 0x0001, %r7
	.word 0x9c778010  ! 3454: UDIV_R	udiv 	%r30, %r16, %r14
	.word 0x8c4fc01a  ! 3459: MULX_R	mulx 	%r31, %r26, %r6
	.word 0xa2f9a001  ! 3464: SDIVcc_I	sdivcc 	%r6, 0x0001, %r17
	.word 0xba68000a  ! 3469: UDIVX_R	udivx 	%r0, %r10, %r29
	.word 0xbf682001  ! 3474: SDIVX_I	sdivx	%r0, 0x0001, %r31
	.word 0x866d4007  ! 3479: UDIVX_R	udivx 	%r21, %r7, %r3
	.word 0xb36e8016  ! 3484: SDIVX_R	sdivx	%r26, %r22, %r25
	.word 0x947fe001  ! 3489: SDIV_I	sdiv 	%r31, 0x0001, %r10
	.word 0x9f6e2001  ! 3494: SDIVX_I	sdivx	%r24, 0x0001, %r15
	.word 0xb1694016  ! 3499: SDIVX_R	sdivx	%r5, %r22, %r24
	.word 0xb65e8018  ! 3504: SMUL_R	smul 	%r26, %r24, %r27
	.word 0xd6586000  ! 3509: LDX_I	ldx	[%r1 + 0x0000], %r11
	.word 0xa8490010  ! 3514: MULX_R	mulx 	%r4, %r16, %r20
	.word 0xbf21800c  ! 3519: MULScc_R	mulscc 	%r6, %r12, %r31
	.word 0xa24f801c  ! 3524: MULX_R	mulx 	%r30, %r28, %r17
	.word 0x9e482001  ! 3529: MULX_I	mulx 	%r0, 0x0001, %r15
	.word 0x8f6fa001  ! 3534: SDIVX_I	sdivx	%r30, 0x0001, %r7
	.word 0x8a4f2001  ! 3539: MULX_I	mulx 	%r28, 0x0001, %r5
	.word 0xa96fc017  ! 3544: SDIVX_R	sdivx	%r31, %r23, %r20
	.word 0xa2496001  ! 3549: MULX_I	mulx 	%r5, 0x0001, %r17
	.word 0xa64dc007  ! 3554: MULX_R	mulx 	%r23, %r7, %r19
	.word 0xa65d4010  ! 3559: SMUL_R	smul 	%r21, %r16, %r19
	.word 0xba4fc005  ! 3564: MULX_R	mulx 	%r31, %r5, %r29
	.word 0x88f72001  ! 3569: UDIVcc_I	udivcc 	%r28, 0x0001, %r4
	.word 0x88f02001  ! 3574: UDIVcc_I	udivcc 	%r0, 0x0001, %r4
	.word 0x8e4e2001  ! 3579: MULX_I	mulx 	%r24, 0x0001, %r7
	.word 0xb84bc01e  ! 3584: MULX_R	mulx 	%r15, %r30, %r28
	.word 0xee58a4d8  ! 3589: LDX_I	ldx	[%r2 + 0x04d8], %r23
	.word 0x94710010  ! 3594: UDIV_R	udiv 	%r4, %r16, %r10
	.word 0xe85863f8  ! 3599: LDX_I	ldx	[%r1 + 0x03f8], %r20
	.word 0xab24801b  ! 3604: MULScc_R	mulscc 	%r18, %r27, %r21
	.word 0xb86ea001  ! 3609: UDIVX_I	udivx 	%r26, 0x0001, %r28
	.word 0xad6d6001  ! 3614: SDIVX_I	sdivx	%r21, 0x0001, %r22
	.word 0xa8f5401a  ! 3619: UDIVcc_R	udivcc 	%r21, %r26, %r20
	.word 0x9e48e001  ! 3624: MULX_I	mulx 	%r3, 0x0001, %r15
	.word 0x81822001  ! 3629: WRY_I	wr	%r8, 0x0001, %y
	.word 0xa04ae001  ! 3634: MULX_I	mulx 	%r11, 0x0001, %r16
	.word 0x8d236001  ! 3639: MULScc_I	mulscc 	%r13, 0x0001, %r6
	.word 0x86742001  ! 3644: UDIV_I	udiv 	%r16, 0x0001, %r3
	.word 0xbb68c017  ! 3649: SDIVX_R	sdivx	%r3, %r23, %r29
	.word 0x94f0e001  ! 3654: UDIVcc_I	udivcc 	%r3, 0x0001, %r10
	.word 0xb04e2001  ! 3659: MULX_I	mulx 	%r24, 0x0001, %r24
	.word 0x945f0011  ! 3664: SMUL_R	smul 	%r28, %r17, %r10
	.word 0xa2f9a001  ! 3669: SDIVcc_I	sdivcc 	%r6, 0x0001, %r17
	.word 0x876d0004  ! 3674: SDIVX_R	sdivx	%r20, %r4, %r3
	.word 0x81832001  ! 3679: WRY_I	wr	%r12, 0x0001, %y
	.word 0x9d6f001d  ! 3684: SDIVX_R	sdivx	%r28, %r29, %r14
	.word 0x976be001  ! 3689: SDIVX_I	sdivx	%r15, 0x0001, %r11
	.word 0xac6f4009  ! 3694: UDIVX_R	udivx 	%r29, %r9, %r22
	.word 0xae692001  ! 3699: UDIVX_I	udivx 	%r4, 0x0001, %r23
	.word 0x9c4ee001  ! 3704: MULX_I	mulx 	%r27, 0x0001, %r14
	.word 0xb24be001  ! 3709: MULX_I	mulx 	%r15, 0x0001, %r25
	.word 0x81842001  ! 3714: WRY_I	wr	%r16, 0x0001, %y
	.word 0x8af7e001  ! 3719: UDIVcc_I	udivcc 	%r31, 0x0001, %r5
	.word 0x98f10007  ! 3724: UDIVcc_R	udivcc 	%r4, %r7, %r12
	.word 0xbe6b0012  ! 3729: UDIVX_R	udivx 	%r12, %r18, %r31
	.word 0x9a4ba001  ! 3734: MULX_I	mulx 	%r14, 0x0001, %r13
	.word 0xf8586598  ! 3739: LDX_I	ldx	[%r1 + 0x0598], %r28
	.word 0xaf6fe001  ! 3744: SDIVX_I	sdivx	%r31, 0x0001, %r23
	.word 0x9af2a001  ! 3749: UDIVcc_I	udivcc 	%r10, 0x0001, %r13
	.word 0x92742001  ! 3754: UDIV_I	udiv 	%r16, 0x0001, %r9
	.word 0x924ca001  ! 3759: MULX_I	mulx 	%r18, 0x0001, %r9
	.word 0xb8702001  ! 3764: UDIV_I	udiv 	%r0, 0x0001, %r28
	.word 0x8c4b6001  ! 3769: MULX_I	mulx 	%r13, 0x0001, %r6
	.word 0x9f6da001  ! 3774: SDIVX_I	sdivx	%r22, 0x0001, %r15
	.word 0xb8f4e001  ! 3779: UDIVcc_I	udivcc 	%r19, 0x0001, %r28
	.word 0xab242001  ! 3784: MULScc_I	mulscc 	%r16, 0x0001, %r21
	.word 0xb4682001  ! 3789: UDIVX_I	udivx 	%r0, 0x0001, %r26
	.word 0x96d3c012  ! 3794: UMULcc_R	umulcc 	%r15, %r18, %r11
	.word 0x984a2001  ! 3799: MULX_I	mulx 	%r8, 0x0001, %r12
	.word 0xbc4d401d  ! 3804: MULX_R	mulx 	%r21, %r29, %r30
	.word 0x8e6e6001  ! 3809: UDIVX_I	udivx 	%r25, 0x0001, %r7
	.word 0x866f001d  ! 3814: UDIVX_R	udivx 	%r28, %r29, %r3
	.word 0xb849c017  ! 3819: MULX_R	mulx 	%r7, %r23, %r28
	.word 0x98f66001  ! 3824: UDIVcc_I	udivcc 	%r25, 0x0001, %r12
	.word 0xaad82001  ! 3829: SMULcc_I	smulcc 	%r0, 0x0001, %r21
	.word 0xce586008  ! 3834: LDX_I	ldx	[%r1 + 0x0008], %r7
	.word 0xb36a2001  ! 3839: SDIVX_I	sdivx	%r8, 0x0001, %r25
	.word 0xb2fac016  ! 3844: SDIVcc_R	sdivcc 	%r11, %r22, %r25
	.word 0x94fa401a  ! 3849: SDIVcc_R	sdivcc 	%r9, %r26, %r10
	.word 0x8c6f0000  ! 3854: UDIVX_R	udivx 	%r28, %r0, %r6
	.word 0xa0d6c01a  ! 3859: UMULcc_R	umulcc 	%r27, %r26, %r16
	.word 0xaa4e4017  ! 3864: MULX_R	mulx 	%r25, %r23, %r21
	.word 0xae57001d  ! 3869: UMUL_R	umul 	%r28, %r29, %r23
	.word 0xfc586318  ! 3874: LDX_I	ldx	[%r1 + 0x0318], %r30
	.word 0x9c57c00c  ! 3879: UMUL_R	umul 	%r31, %r12, %r14
	.word 0xbc49001f  ! 3884: MULX_R	mulx 	%r4, %r31, %r30
	.word 0xbc736001  ! 3889: UDIV_I	udiv 	%r13, 0x0001, %r30
	.word 0xaf6d000d  ! 3894: SDIVX_R	sdivx	%r20, %r13, %r23
	.word 0xfc586528  ! 3899: LDX_I	ldx	[%r1 + 0x0528], %r30
	.word 0xb048c00d  ! 3904: MULX_R	mulx 	%r3, %r13, %r24
	.word 0x9868c018  ! 3909: UDIVX_R	udivx 	%r3, %r24, %r12
	.word 0xbe6a8016  ! 3914: UDIVX_R	udivx 	%r10, %r22, %r31
	.word 0xa0fe000f  ! 3919: SDIVcc_R	sdivcc 	%r24, %r15, %r16
	.word 0x86f26001  ! 3924: UDIVcc_I	udivcc 	%r9, 0x0001, %r3
	.word 0xba79a001  ! 3929: SDIV_I	sdiv 	%r6, 0x0001, %r29
	.word 0x896ea001  ! 3934: SDIVX_I	sdivx	%r26, 0x0001, %r4
	.word 0xb25ec012  ! 3939: SMUL_R	smul 	%r27, %r18, %r25
	.word 0xd4586650  ! 3944: LDX_I	ldx	[%r1 + 0x0650], %r10
	.word 0xaf23001a  ! 3949: MULScc_R	mulscc 	%r12, %r26, %r23
	.word 0xbe72c00a  ! 3954: UDIV_R	udiv 	%r11, %r10, %r31
	.word 0x90480003  ! 3959: MULX_R	mulx 	%r0, %r3, %r8
	.word 0x94de6001  ! 3964: SMULcc_I	smulcc 	%r25, 0x0001, %r10
	.word 0x8c752001  ! 3969: UDIV_I	udiv 	%r20, 0x0001, %r6
	.word 0xad6de001  ! 3974: SDIVX_I	sdivx	%r23, 0x0001, %r22
	.word 0x976d001f  ! 3979: SDIVX_R	sdivx	%r20, %r31, %r11
	.word 0xb5218010  ! 3984: MULScc_R	mulscc 	%r6, %r16, %r26
	.word 0x8ed98017  ! 3989: SMULcc_R	smulcc 	%r6, %r23, %r7
	.word 0x9f6aa001  ! 3994: SDIVX_I	sdivx	%r10, 0x0001, %r15
.data
.align	256
t3_data64_start_0:
	.xword	0xa4e0d3cef3a18634
	.xword	0x71472cd3b8c3c645
	.xword	0x71dfe61a64b6eca3
	.xword	0x210c80032f6287a5
	.xword	0xe36be19a4965932d
	.xword	0x7f4ed98c38171f70
	.xword	0xc37b08661793a312
	.xword	0x8da688027f216e93
	.xword	0x58ce698ed4796f5c
	.xword	0xa043b3cc1bff9a76
	.xword	0x385600d4ac685cba
	.xword	0xef6e7d08337f3ff4
	.xword	0x15fd46df6861d93a
	.xword	0x6a6a4620c65f8ea6
	.xword	0xc7f9edae8aa4d997
	.xword	0xfc29eed1811dfdab
	.xword	0xe2741a19ecd4ea8b
	.xword	0x01f53ae53ba6c0a1
	.xword	0x942b058bd9accb98
	.xword	0xeb74d9550cfbe717
	.xword	0xb567e7f1cc169d4b
	.xword	0xe22b3cf25329ff98
	.xword	0xc88bc8e92a5fcfb4
	.xword	0xf730a2ebb8c20689
	.xword	0x5d9b2709180a96d6
	.xword	0xe0ccc5b21476dd8e
	.xword	0x6b469c4fa9fb4823
	.xword	0x1c3cd4b5524cf51d
	.xword	0xf09565f8b864c350
	.xword	0xfcf3058a7be02ec3
	.xword	0x2f42ec8f7e4f7235
	.xword	0x868fe49d49c7618a
	.xword	0x3b1298a87149b6a9
	.xword	0x0d53d591c6dd51b6
	.xword	0x3172b35920a77039
	.xword	0x870dd27c95341565
	.xword	0xab619c85f015d638
	.xword	0x7e6b24fa9f71d6d7
	.xword	0x63e37454da6cc0cd
	.xword	0x9a634bc01330bab5
	.xword	0x4f47534c7c2d710b
	.xword	0x64e718a639bb828e
	.xword	0x9ad08a4bfb79b8e1
	.xword	0x1f4a82df39f3c68e
	.xword	0xb395d6a7c6d500ad
	.xword	0x1232de47f03565c4
	.xword	0xc28e0e6f4fbac9a0
	.xword	0x2da1d479762d0c47
	.xword	0x973974450fcf9a40
	.xword	0xfad0e59b2c5c8d80
	.xword	0xa7d6d49ea364e7ff
	.xword	0x6f2c2512ccfc1264
	.xword	0xdc879210b9d0ab3a
	.xword	0x497388b23b7bff7d
	.xword	0x79ee06188644e98c
	.xword	0x27d3b2cf89acb117
	.xword	0x79931f4827e76e6a
	.xword	0x96b862cd5f7145a3
	.xword	0xdf3f38a696333cd2
	.xword	0x1a18adfcd0c582f1
	.xword	0x2f6a89a6288ba84e
	.xword	0xe0a47e7456455bf2
	.xword	0x4c8500072fd3c959
	.xword	0x6fffe89e87ecd284
	.xword	0xa6a3248595961ede
	.xword	0x4ddfe9788407c957
	.xword	0x58ba0e1b0273fc7b
	.xword	0x9d1f56b31ab903f8
	.xword	0x4b12fa563c86608a
	.xword	0x9f3504cb0d792621
	.xword	0xf210325ffb4870c0
	.xword	0x881244ab7ac0edc7
	.xword	0x23d542dad94c4602
	.xword	0xf425463ebf9e4b01
	.xword	0xca616d57fce9f448
	.xword	0x34492595754c60fa
	.xword	0x91a539017bda14ce
	.xword	0xe87c6dadafb22a93
	.xword	0xa3d34b40792fcf82
	.xword	0x540926cb6a86564d
	.xword	0x9da0c6beed684d8c
	.xword	0x82884ca0ce7eebb4
	.xword	0xcb6bf81dc60ca4e2
	.xword	0x39466576455a0ce6
	.xword	0x164c2621ef5f96b7
	.xword	0x7b21f28274567bc3
	.xword	0x624faf3c789f274f
	.xword	0x9ac50317404b4c07
	.xword	0xaef39e695869d3cd
	.xword	0x468b0cdd18223ad0
	.xword	0x7bc5dd1fdd60fe62
	.xword	0x33a6a963e7637b59
	.xword	0xcfa09830abbc387f
	.xword	0x37c39d4be039a756
	.xword	0xacdf560e83d85c54
	.xword	0x445fa688a39bc4d9
	.xword	0xd7e5b9eeaac1986f
	.xword	0x5e759742c55eed9a
	.xword	0x041b7d63c5dcb1c3
	.xword	0x2f0539287e5ec0c1
	.xword	0x02cec20612e94889
	.xword	0x50e6926ec5a85c9b
	.xword	0xea6b5e3bc1b7cbd4
	.xword	0x30fa0a2ec27141bd
	.xword	0x97624ff500827290
	.xword	0x42310a7361d13698
	.xword	0xa8fb17ba4a72d9e7
	.xword	0xe61f8692017ec75a
	.xword	0x3f7b92597b9a81f4
	.xword	0x604f777330005aac
	.xword	0x2f6befb666a2c9bb
	.xword	0xa6fc1ced349bff30
	.xword	0x7832b9f288b417d5
	.xword	0x5f52adf370e735d4
	.xword	0xdd5453519fac0b47
	.xword	0x90314c65a9892b94
	.xword	0x2537378cb2a1fdc9
	.xword	0x9c14774b0f5636a7
	.xword	0xff3dca0c41f582a3
	.xword	0xb60035acca284d0b
	.xword	0x367c492344a0b486
	.xword	0x171ba3e59796e215
	.xword	0xb0e59ebe428c52a9
	.xword	0x8616e9dd1c3b428a
	.xword	0x6293980cda313f28
	.xword	0x04de99e49f7b602b
	.xword	0x4ba39a7c81ec9ac5
	.xword	0xd34ffba3a8908681
	.xword	0xe206dd60b884e717
	.xword	0xc822688a71ef1b4a
	.xword	0x3a9b6b815f72f895
	.xword	0xafee5a73007027b8
	.xword	0xd92dc2b8839a8e11
	.xword	0x4cbc4c0abb74c11c
	.xword	0x4674ef3f3362462e
	.xword	0xad6e18dc2b2d85e4
	.xword	0x07c7a0f8d9f2bc9d
	.xword	0xbe643fda22aff1ca
	.xword	0x5f98ef4a8d276967
	.xword	0xb907c690a037ac7b
	.xword	0x90964655c42209c4
	.xword	0x003f9b8ed1ce7887
	.xword	0xc763c976ad439740
	.xword	0xb040af77a51b3d41
	.xword	0xa567ada50a4cbf36
	.xword	0x9543c661465e317f
	.xword	0xbce203010433c5e8
	.xword	0xe63959ffc2a9223d
	.xword	0x8ed840adadfdd7aa
	.xword	0x5530d34f3c190c9a
	.xword	0x1d10cef123247642
	.xword	0xa3aece93baf39433
	.xword	0xc853d12a6466197d
	.xword	0x4d46535df71f6c51
	.xword	0x26110b8cbb424f3e
	.xword	0xf089371d51b65651
	.xword	0x318f9706c69d33f6
	.xword	0x18811997355153fe
	.xword	0x447c0ff7493757eb
	.xword	0x1656816cb20ac93b
	.xword	0xb5d84489b7c5e647
	.xword	0xb4e3caae29309e54
	.xword	0x10dae21b74db0afe
	.xword	0x06f8e068a69f0a3a
	.xword	0x0d9d6f55fbda9055
	.xword	0x358aef5c23310657
	.xword	0x3256a2dc54aee0b7
	.xword	0x8a248f073133b85e
	.xword	0xd3de59903d7ad763
	.xword	0x3b88af2f11df7332
	.xword	0xcd85eb16673b2f1a
	.xword	0xae316c5abe3f67bc
	.xword	0x4d8fe2d95b794b43
	.xword	0x444dd4db6c242e0a
	.xword	0x08116d62ca47ee57
	.xword	0xbb921ecdf2dec69f
	.xword	0xddafb3dc3b455d2e
	.xword	0xf55b7d0d8d349f6c
	.xword	0x37d259273e7e0dda
	.xword	0xb522ce546736eb23
	.xword	0x401015b1eeacb3cf
	.xword	0x76f5b6cec39d0a19
	.xword	0x6fc22955b64af264
	.xword	0xbb71294f1d31476f
	.xword	0x6be858b07e6b0c9b
	.xword	0xefca302db517b286
	.xword	0x86f08663edb8b033
	.xword	0xcce36ceb011971c2
	.xword	0x434f0010d5ed8605
	.xword	0xa8aa31860920919c
	.xword	0x9ae4b15e07c9b5c2
	.xword	0x98d27df31fe8dedf
	.xword	0x9506cb35f096d184
	.xword	0xf956ad0d2220d239
	.xword	0xe715cc65e6ad571c
	.xword	0xbe180b61c2cef539
	.xword	0x93905ac0c248837d
	.xword	0xb0c3d8a34302fed5
	.xword	0xde98a9e8cabe2d08
	.xword	0x432b379a3521acb7
	.xword	0x2c8b05fcfe7c5b8a
	.xword	0x2b594c15f6e6ea4d
	.xword	0xc5ee693e3c50cf8d
	.xword	0x5af0416fe2b85332
	.xword	0xb6a3e4d65f09b409
	.xword	0xc1570fd4443bd1fe
	.xword	0x15db6d1dfd79df6b
	.xword	0x1449dbb24b3d06dc
	.xword	0xca519657fbd3dcbf
	.xword	0xc63337b3be38b37d
	.xword	0xfd5cf9998614e511
	.xword	0xc748dba510ed92cd
	.xword	0x45d4b31447aeeb23
	.xword	0xb22ab74a738e0564
	.xword	0xe51d49e5c12419b0
	.xword	0x908f2d94f9928b35
	.xword	0x3ef12ab6631a68fd
	.xword	0x9a2cdb5379605e21
	.xword	0x1842fe30547145d3
	.xword	0xed1d5da7fb3c38b3
	.xword	0x8f72ecfac00f91ed
	.xword	0x0b53d56dc26c14ae
	.xword	0x290d664219439bcf
	.xword	0xac68d128d9109ab9
	.xword	0x73fa1cc76703cfdd
	.xword	0xde2e9dc1f07145eb
	.xword	0x294eab306b2a0279
	.xword	0xaac8928b876e34bd
	.xword	0x6d36369aa20a490f
	.xword	0xcbdcdfd49744dd91
	.xword	0xd5a6e2d0f752e3ad
	.xword	0x8f77ca7619dfa7c2
	.xword	0xb3eda1ad8e5e6277
	.xword	0x58ad484a0969d04c
	.xword	0x3917ab7b666ad7b5
	.xword	0xe2de2bdd6bfd83b4
	.xword	0xfca07b0aa42dda01
	.xword	0x60dbe14647f1a62d
	.xword	0x774ff166af1bb5cd
	.xword	0xda138e83d67c2702
	.xword	0x78cdf2af7a6d3b1c
	.xword	0xde5e5843ab1ed1e7
	.xword	0xc8f92618a6716518
	.xword	0xf4e425038ac657e8
	.xword	0x3cb2d72c6c04aca8
	.xword	0x13653e3ab05f214c
	.xword	0x626c2ea9ebb253fd
	.xword	0x2c92bf61c9a5d788
	.xword	0x98dd0b64b28f97de
	.xword	0x5d07af1575c881d3
	.xword	0xbe86e7e81e21ea04
	.xword	0xa9fd160415cf6325
	.xword	0x023ab3755441c0e3
	.xword	0xac22cb75c9deb448
	.xword	0x6c07b40c7cb21d48
	.xword	0xfc99935c54d54516
	.xword	0x90018d8b6a744c63
	.xword	0xacbcb0bf695c73a1
	.xword	0xd47a0987e40d70b4
	.xword	0xbd8b106f523fb209
	.xword	0x29a5b5ab67b2fa89
	.xword	0x2cc4fd18e8a36189
	.xword	0xddcb7f343ca84cce
	.xword	0xd6e62fc200f690be
	.xword	0x09d0f639bbf15b14
	.xword	0x89f4f2c5ef458f95
	.xword	0xa99d15f2bc7a01b7
	.xword	0x1da55099d3f18744
	.xword	0xdbc92711d0cb35b3
	.xword	0x978767c741a90d86
	.xword	0xf96a5fd2b1e95023
	.xword	0xdeea919d8de2f2b5
	.xword	0x719d59ffc093cbad
	.xword	0x31922ea2785cbff2
	.xword	0x10374b30678108db
	.xword	0x9458ed4ac55f34e3
	.xword	0x8628ff4a60ed956d
	.xword	0x50325fa517dd5b85
	.xword	0xbd6bdfbc233d7db3
	.xword	0x21142e45705e937a
	.xword	0xa942f8e9cb739676
	.xword	0xf89c28afd6c49ce6
	.xword	0xe630059b89cc39f6
	.xword	0x0c9490941c9ba59b
	.xword	0x40d86994d2bf34d6
	.xword	0xee39060fd7dda9b7
	.xword	0x84c97b8ec8305006
	.xword	0x11ea523cd6ff4bc2
	.xword	0xba3858061a2e86d3
	.xword	0x3ca47e7eaf3e81df
	.xword	0x1ac29d82936b19f9
	.xword	0xa9aeceb4763d188c
	.xword	0x7bf45b456a0cbd2b
	.xword	0x447317321f19279d
	.xword	0x7418e3f130280537
	.xword	0xb541f1c9dcc72e81
	.xword	0x7f03f54542311bf5
	.xword	0x4fd450c535416490
	.xword	0x80e7fade455064d0
	.xword	0xc861bc1ac40cac55
	.xword	0x40b32b90c2af12e6
	.xword	0x61257b9f8af59323
	.xword	0xe1c996b5867c3bea
	.xword	0xe52316b6730290eb
	.xword	0x410666815ac0661a
	.xword	0xb035844de5576b6b
	.xword	0x18539f2a3287cbfc
	.xword	0x3cbb101fa382648d
	.xword	0xb179648643ba1733
	.xword	0xd64dbd293ec8f48e
	.xword	0x8774c5c277037b1e
	.xword	0x07d13cb42e7d6ea1
	.xword	0x51fd82399007781a
	.xword	0xb261718a1077219b
	.xword	0x72078e7e30bfe62b
	.xword	0x504aed99866a7e93
	.xword	0x42a3b754f37aaee2
	.xword	0x58c42c0cf48e24ef
	.xword	0x1fe9c4aac4c05202
	.xword	0xa7c778880d3774f1
	.xword	0x17d5a976addd2ab9
	.xword	0xc57c99bab9213de3
	.xword	0x4ca01c67076541cc
	.xword	0xabf5a8bb6caf41ac
	.xword	0xb55f29ca20314143
	.xword	0xeef7257fd66c62a2
	.xword	0x96a850202037e3ed
	.xword	0x9ece697cbac4eb4a
	.xword	0x4fcc9c538c94e4c1
	.xword	0xac29ea641547e0e6
	.xword	0xa7ae87e7b1e540b1
	.xword	0x8c890686fe854b23
	.xword	0xf97f082ed585a790
	.xword	0x46e958ac8dbe7458
	.xword	0x8c5cfdb643b6971b
	.xword	0xde4f6a6e31bfaffb
	.xword	0xca3b84362fb78cab
	.xword	0x791bbd798ad47b87
	.xword	0xe18763700cf06de7
	.xword	0xee1a94f605a0a058
	.xword	0x39c1d056e4f4fdd1
	.xword	0x77a1d81fd7c979bb
	.xword	0x2b1245808c6e0ecb
	.xword	0xc7eef2ceb9560d05
	.xword	0xef64a870ccb749de
	.xword	0xa067ce54bbb01908
	.xword	0x099dba2c8105f282
	.xword	0x58976b85056c22e3
	.xword	0x9f91372278bf574a
	.xword	0x70521a8e656dc7e4
	.xword	0x2d063ac55d10b520
	.xword	0x1f73827f2ce1b457
	.xword	0x6a888efae9d9a361
	.xword	0xd721dc43dab33e05
	.xword	0x14d071548f16e827
	.xword	0x20d13c9b857115ba
	.xword	0x841645b3afbb2113
	.xword	0x069e5c0c854cb633
	.xword	0x037a53003c7f0cd9
	.xword	0xfe5201cdf7c6006f
	.xword	0x057fa909d8ffc58a
	.xword	0x568b442ae3cda9e8
	.xword	0x9eedfe651bf3d04e
	.xword	0x62f32c00ab43407b
	.xword	0x6503ba706b059eea
	.xword	0xf566df2cd7d60892
	.xword	0x6679e6ee4c722b60
	.xword	0x4091c852bb3bbcf4
	.xword	0xcdc7deb3901ebfcd
	.xword	0x7a26158bf64ef45b
	.xword	0x9ae52a8d2307b3db
	.xword	0x6eafb5a0fff927f2
	.xword	0x75709b2ec3830ae1
	.xword	0x9110fb413c22e8fc
	.xword	0xe6eaccfac3fcff53
	.xword	0x340011835691fa3d
	.xword	0xca209d708319b155
	.xword	0x65de1d4bb78cbbaa
	.xword	0x457ae763b5943b56
	.xword	0x2748f8a2f29602bd
	.xword	0xa87c07defd97ded2
	.xword	0xecd1e0a263be0fda
	.xword	0x9bfd3912403fb1e5
	.xword	0xa101dabbb274349d
	.xword	0xf4c25bb5eb076d10
	.xword	0x2ffd3ee731885ddb
	.xword	0x58c934e6f8bdc00d
	.xword	0xdf707ec6a92ef37a
	.xword	0xad1b4ccd4c0c1f07
	.xword	0xfe8b6133795a8037
	.xword	0x33fb0aef2c153d33
	.xword	0x7f36ed35c9cd2f39
	.xword	0x5669052a78300810
	.xword	0x2574b5bc0f4ded85
	.xword	0xa6a069ea14a87dac
	.xword	0x1669579bd4792b77
	.xword	0x1b7b6e6a77bebbbc
	.xword	0x3f4265f3372f75f7
	.xword	0x02e0c6c030c83101
	.xword	0x29d7c8f834644d31
	.xword	0xcdd1416279910ee0
	.xword	0xe2ffe9d9d8149f81
	.xword	0x7e1da575e0da3e85
	.xword	0x97368ba9d261dd48
	.xword	0x1acafaa55db40889
	.xword	0x4dafc85195f9f43a
	.xword	0x5dc59f440a03c919
	.xword	0xc70d1dbc0915edab
	.xword	0x71a0a9dfd66e2641
	.xword	0xa896bd4c8e4cf2c0
	.xword	0x4039029ebf2ec9c9
	.xword	0x191a4815793916dd
	.xword	0xe9574a9552e5bbc9
	.xword	0xb1ccc6b5a1e676e3
	.xword	0xfd18d94851f4af93
	.xword	0xb045d6c91985180d
	.xword	0x8d2b3184ddd4eb9d
	.xword	0xe4838699ba127b01
	.xword	0x26839de8aa934fc6
	.xword	0xf1b7bcd88264919c
	.xword	0xc978f61d7edefd64
	.xword	0x4be5ca560a472492
	.xword	0x8dad40605afaac61
	.xword	0xd87515feb9a0f8b6
	.xword	0x1a92a71d599e2f51
	.xword	0x3d6ccf7a037ea7c6
	.xword	0x72aa504eea5da669
	.xword	0x271585080a492b5d
	.xword	0x5b922d034ed978e6
	.xword	0x84270fb3409fcfc8
	.xword	0x8f71480af6f880bd
	.xword	0x0126e4214f18a2f9
	.xword	0x2e6adf074bf67aa0
	.xword	0xf2500b118830a48d
	.xword	0xfa7f7c981a183cef
	.xword	0x18f3444767fa731b
	.xword	0x2f10eab2ffcf3bef
	.xword	0x196ae9ff36ae4f20
	.xword	0x4c2474b88d9538a1
	.xword	0xcc1841681cf64296
	.xword	0x4ce1bc6acecf335b
	.xword	0xfd13b825d22ca218
	.xword	0x27d103bff2eae0f0
	.xword	0x43cd25057b35fab1
	.xword	0x89f5273916714017
	.xword	0x022dfd387b7c8e73
	.xword	0x400dd3785dfb299a
	.xword	0xf215359263f33bda
	.xword	0x40f95f7782d64a4b
	.xword	0x3dbd3e5ee5f49e3e
	.xword	0x68388a5d788c6f5d
	.xword	0x1e86854602eed06f
	.xword	0x079253a9e4adadff
	.xword	0xa333d1154bb9365c
	.xword	0xe888fc0311283ec2
	.xword	0x9f47d85ab442f6e1
	.xword	0xa0671f7c1199735a
	.xword	0xdff03e30cd681e6b
	.xword	0x8b730142b962d613
	.xword	0xd970b8c4437b63ae
	.xword	0xb64a294fe0ddfb28
	.xword	0x38c72ab1c9a2d780
	.xword	0x389d7fed92a99a9f
	.xword	0x0d292cd3a19bee42
	.xword	0xd996c6b30f994732
	.xword	0x0df4837c9a1cbde6
	.xword	0x2a106306edc75d1d
	.xword	0x476df6ec249bcdf2
	.xword	0xa651123d5761b98a
	.xword	0x6379c840ab8f7acc
	.xword	0xeef244c7a8dfbef1
	.xword	0x77663028197f09e4
	.xword	0x19429b660ecf9c24
	.xword	0xe5f6c33620dfc13e
	.xword	0x793888802eee6ba8
	.xword	0x1347efa2906c4325
	.xword	0x0e301780670b1242
	.xword	0x89ea05360dced3d8
	.xword	0xd29fc95f1215c522
	.xword	0x540a9dca32144e8c
	.xword	0x59727657a58af83d
	.xword	0xefef1c43812d4df2
	.xword	0x62cf7a13382a2c7b
	.xword	0x3b4785e14964e950
	.xword	0x85ca32dffb75fe7e
	.xword	0x56c4594501e7d3c0
	.xword	0xaec5c3afed92ded8
	.xword	0x9eba63233ea0066b
	.xword	0x294542badf71aa1d
	.xword	0x3e2175acf1087564
	.xword	0x97fab29f72ab2817
	.xword	0x4285f0afd14ea611
	.xword	0x202aab0ffc2074db
	.xword	0xc0fd169509635d27
	.xword	0xb2a28f4e54dfd6df
	.xword	0x9ff67c3c62f3af0f
	.xword	0xab22452aa92bdbdf
	.xword	0x510cda54c2686b7b
	.xword	0x6a0dd952ec52caa1
	.xword	0x0c00a814c52b178c
	.xword	0xcb1aaca39027c8e3
	.xword	0xe344bbd3f2687370
	.xword	0x4c391dd5afa03df2
	.xword	0x0e449e783e444234
	.xword	0x5cf037cc5ae37fab
	.xword	0x91892dd0f2c3f435
	.xword	0x7d2de1dc5cf2bbd2
	.xword	0xc75978cfa4558b9c
	.xword	0x0118b8a164f7c8a5
	.xword	0x05305f8dfdcb4fb2
	.xword	0xb7b108a80def7a44
	.xword	0x7fff5998dd206239
.data
.align	256
t3_data32_start_0:
	.xword	0x000000003814825d
	.xword	0x000000009e2f1953
	.xword	0x00000000bbc4a293
	.xword	0x00000000441e8cbd
	.xword	0x000000004ec91fee
	.xword	0x000000005f189be6
	.xword	0x00000000b8f0280a
	.xword	0x0000000096279780
	.xword	0x000000002b6be004
	.xword	0x00000000e41e1e85
	.xword	0x0000000085280902
	.xword	0x00000000057c0721
	.xword	0x00000000dc1cd683
	.xword	0x00000000529bfe34
	.xword	0x00000000fece88ca
	.xword	0x000000005da9e1fe
	.xword	0x00000000c2e7b613
	.xword	0x00000000a85cf476
	.xword	0x000000007d0a0df0
	.xword	0x0000000077de5bf8
	.xword	0x00000000770ca17d
	.xword	0x00000000f1c71bc5
	.xword	0x00000000b675913b
	.xword	0x00000000a84369f7
	.xword	0x000000009f1efac6
	.xword	0x00000000dd21b0b9
	.xword	0x00000000e9215146
	.xword	0x000000009d6ee586
	.xword	0x00000000867dd687
	.xword	0x00000000fb0747c4
	.xword	0x000000006c82203d
	.xword	0x00000000684700fd
	.xword	0x00000000f96d831c
	.xword	0x00000000217712e2
	.xword	0x00000000c675f8c5
	.xword	0x0000000088ff8d37
	.xword	0x000000007dfb8bea
	.xword	0x0000000069994d44
	.xword	0x00000000775b9098
	.xword	0x000000008a79883a
	.xword	0x00000000a8b92115
	.xword	0x0000000057c2ff72
	.xword	0x000000009d9c10f2
	.xword	0x00000000acadafa7
	.xword	0x00000000c9120cce
	.xword	0x0000000073db6727
	.xword	0x0000000038209b80
	.xword	0x0000000087b7618c
	.xword	0x000000001bed3e13
	.xword	0x000000007416ce6f
	.xword	0x0000000081d93a4f
	.xword	0x00000000d396956d
	.xword	0x000000004dccb81c
	.xword	0x00000000af5bceee
	.xword	0x0000000091625b11
	.xword	0x000000004963cb56
	.xword	0x0000000017f00836
	.xword	0x00000000763989ef
	.xword	0x00000000ba533206
	.xword	0x00000000d2411415
	.xword	0x00000000fc3ee846
	.xword	0x0000000029491d78
	.xword	0x00000000c44515f2
	.xword	0x000000007bce2503
	.xword	0x000000007393e83e
	.xword	0x0000000082bc5127
	.xword	0x00000000cbe3f230
	.xword	0x000000007034528f
	.xword	0x00000000fe9645ff
	.xword	0x00000000ec83984b
	.xword	0x000000000a7e582c
	.xword	0x00000000f5365515
	.xword	0x000000003f8e4050
	.xword	0x00000000d49d5878
	.xword	0x000000007add76eb
	.xword	0x0000000039802641
	.xword	0x00000000bbcf0095
	.xword	0x00000000cab8e342
	.xword	0x00000000ce118dd3
	.xword	0x00000000872bbab8
	.xword	0x00000000b777a6b8
	.xword	0x00000000e199c69c
	.xword	0x000000003dbbc97e
	.xword	0x00000000367b1118
	.xword	0x000000009abbf545
	.xword	0x000000009e6687b4
	.xword	0x00000000b25d8d3f
	.xword	0x0000000047addcd6
	.xword	0x00000000d8a9249c
	.xword	0x00000000d5c4e563
	.xword	0x000000004366c727
	.xword	0x000000009023191a
	.xword	0x0000000037d5f0ee
	.xword	0x0000000059497ad9
	.xword	0x000000002e2291d9
	.xword	0x0000000089561bd3
	.xword	0x00000000bed12928
	.xword	0x00000000f98d90a8
	.xword	0x000000006b9ca383
	.xword	0x00000000ce4b0ed8
	.xword	0x00000000c91256f8
	.xword	0x000000009ca39250
	.xword	0x00000000ba5a7b24
	.xword	0x000000000b79b355
	.xword	0x00000000ac5990fe
	.xword	0x0000000059f73d49
	.xword	0x00000000a7126a01
	.xword	0x00000000aa4582ef
	.xword	0x0000000040e77c18
	.xword	0x00000000f4fb7f92
	.xword	0x000000002526ae3f
	.xword	0x0000000039c84d9f
	.xword	0x00000000d8cb5c13
	.xword	0x0000000021191a66
	.xword	0x00000000d1f8d4b2
	.xword	0x00000000d5f4bb79
	.xword	0x000000001d730b21
	.xword	0x00000000d201da6d
	.xword	0x00000000751f7808
	.xword	0x00000000b4a42165
	.xword	0x00000000229ab7ef
	.xword	0x0000000078dcd5a5
	.xword	0x000000005ac0a7d8
	.xword	0x000000002e676e9b
	.xword	0x0000000041a0cb28
	.xword	0x00000000c6a20f0e
	.xword	0x0000000076b2d6fc
	.xword	0x00000000c41078ff
	.xword	0x00000000b7fb22f6
	.xword	0x0000000086e927e2
	.xword	0x0000000076155968
	.xword	0x000000002a2abd34
	.xword	0x00000000a3d6e97a
	.xword	0x00000000b809d43d
	.xword	0x00000000c79c5065
	.xword	0x00000000f6bc3ac7
	.xword	0x0000000006db50f9
	.xword	0x000000003ee45e51
	.xword	0x00000000e483f6b9
	.xword	0x00000000fad0d56e
	.xword	0x000000004b5934a8
	.xword	0x00000000e3e74197
	.xword	0x00000000fc3f90c1
	.xword	0x000000006e7cb048
	.xword	0x000000000cb62602
	.xword	0x0000000033f1c1ce
	.xword	0x00000000e453f173
	.xword	0x00000000b909e968
	.xword	0x00000000a220059a
	.xword	0x000000004545fcba
	.xword	0x0000000087a93ae9
	.xword	0x0000000089c27cf6
	.xword	0x000000002629b4df
	.xword	0x00000000880b7f8a
	.xword	0x000000007432c711
	.xword	0x000000007bda5866
	.xword	0x000000001181d72e
	.xword	0x0000000000396120
	.xword	0x00000000b594078c
	.xword	0x0000000046bacb72
	.xword	0x00000000d97975f8
	.xword	0x000000004791d511
	.xword	0x00000000e4411575
	.xword	0x00000000666e9471
	.xword	0x0000000005f52fcd
	.xword	0x00000000e45f387d
	.xword	0x000000002e4174d7
	.xword	0x00000000813da467
	.xword	0x000000009a9b4b18
	.xword	0x0000000038425849
	.xword	0x00000000395eb527
	.xword	0x00000000f4bd31a3
	.xword	0x00000000c4e390dd
	.xword	0x0000000024c434be
	.xword	0x0000000031ebe354
	.xword	0x00000000f44b770e
	.xword	0x00000000cb8f1469
	.xword	0x00000000e67e7272
	.xword	0x0000000005ba2093
	.xword	0x00000000221a9b7f
	.xword	0x00000000fb1cb4d3
	.xword	0x0000000068f03f6d
	.xword	0x000000002b73ce17
	.xword	0x00000000942ae189
	.xword	0x00000000fd2e7ffd
	.xword	0x00000000e55df85b
	.xword	0x00000000333fab39
	.xword	0x00000000f718c6d7
	.xword	0x00000000b174df46
	.xword	0x00000000bc6a0f61
	.xword	0x0000000072756733
	.xword	0x0000000057165062
	.xword	0x00000000dcee7a93
	.xword	0x00000000388981d2
	.xword	0x0000000079b1ffbe
	.xword	0x000000006297469c
	.xword	0x000000001e178c30
	.xword	0x000000001a884353
	.xword	0x000000001dc1abf5
	.xword	0x0000000099e6e2cf
	.xword	0x00000000bc4b0488
	.xword	0x00000000c6f1851c
	.xword	0x000000004f5982c5
	.xword	0x000000004670591b
	.xword	0x00000000ac1a7514
	.xword	0x00000000133d3382
	.xword	0x00000000988c4edb
	.xword	0x0000000023bac98c
	.xword	0x000000009d08d7eb
	.xword	0x00000000b4b2d6fe
	.xword	0x0000000010f8d253
	.xword	0x00000000c8077b54
	.xword	0x000000004dfa5dc8
	.xword	0x00000000ec557b49
	.xword	0x0000000031e9157e
	.xword	0x0000000069f519f4
	.xword	0x000000000d80e083
	.xword	0x00000000c0623d56
	.xword	0x000000008f341bda
	.xword	0x000000006d444540
	.xword	0x000000002ef1c257
	.xword	0x0000000044b8fb4b
	.xword	0x000000000eb8ecb5
	.xword	0x000000007a0ff9a7
	.xword	0x000000001f3628c2
	.xword	0x000000000f218411
	.xword	0x000000006fabfea9
	.xword	0x000000005237be83
	.xword	0x000000001f358a50
	.xword	0x00000000885aba07
	.xword	0x0000000044a66943
	.xword	0x00000000df1d58df
	.xword	0x00000000f2637e53
	.xword	0x0000000077a58ae9
	.xword	0x00000000bdc66e3f
	.xword	0x00000000fb99405a
	.xword	0x0000000037ad9e6a
	.xword	0x000000003a06cbed
	.xword	0x00000000d23086a3
	.xword	0x00000000232d5203
	.xword	0x00000000e8675a25
	.xword	0x00000000ede0fd8b
	.xword	0x00000000c9964b37
	.xword	0x000000005249c425
	.xword	0x000000006ac4561c
	.xword	0x0000000089ffdb0e
	.xword	0x000000001c5010e3
	.xword	0x00000000375cdc45
	.xword	0x00000000ff0d918c
	.xword	0x0000000024b98a77
	.xword	0x000000004d84d686
	.xword	0x00000000aa577f2e
	.xword	0x00000000f3d72a6b
	.xword	0x0000000047a63c37
	.xword	0x00000000a17cae6a
	.xword	0x000000009a051430
	.xword	0x00000000f888e476
	.xword	0x00000000cae5366b
	.xword	0x00000000b14553f7
	.xword	0x000000005c475c5c
	.xword	0x000000001e8417b8
	.xword	0x00000000ed54ab2b
	.xword	0x00000000c0561bc1
	.xword	0x000000004a66502d
	.xword	0x00000000ae7e2735
	.xword	0x000000004bbe4f07
	.xword	0x000000001664e360
	.xword	0x00000000991cf633
	.xword	0x00000000a50d00bb
	.xword	0x000000001225b892
	.xword	0x000000002c99bdc0
	.xword	0x000000008f5efc1d
	.xword	0x0000000098a1d81d
	.xword	0x0000000064c5f91d
	.xword	0x000000007069f30b
	.xword	0x00000000914e4b86
	.xword	0x00000000fbe5cb5e
	.xword	0x0000000037f79146
	.xword	0x00000000d07ff3ee
	.xword	0x000000004b29f3fd
	.xword	0x00000000f72627bc
	.xword	0x00000000dc1449f4
	.xword	0x00000000ffe4f052
	.xword	0x00000000b737c8a4
	.xword	0x00000000b49cd29f
	.xword	0x000000001c0dc749
	.xword	0x000000002e40c9e1
	.xword	0x00000000c88ac593
	.xword	0x000000006523efba
	.xword	0x0000000081bea9b1
	.xword	0x000000005942c443
	.xword	0x000000003d77daf3
	.xword	0x00000000e78e448b
	.xword	0x000000008a9d8f31
	.xword	0x0000000077094f6b
	.xword	0x00000000a46de504
	.xword	0x00000000f055c5c1
	.xword	0x000000002eaf0754
	.xword	0x00000000abf9d3ab
	.xword	0x00000000621a7509
	.xword	0x000000003001631f
	.xword	0x00000000caf9f6bd
	.xword	0x00000000c4db48d4
	.xword	0x0000000034bf8340
	.xword	0x00000000b171f24a
	.xword	0x0000000016de33f3
	.xword	0x00000000b541e363
	.xword	0x000000001470397f
	.xword	0x00000000ae46cf8a
	.xword	0x00000000e2dc2361
	.xword	0x00000000900b567e
	.xword	0x0000000007ab7db7
	.xword	0x000000001fb296ed
	.xword	0x00000000cdde7168
	.xword	0x00000000ba4ebcea
	.xword	0x0000000048d183a8
	.xword	0x0000000055c6a55e
	.xword	0x00000000086aa4a8
	.xword	0x0000000027a619e1
	.xword	0x000000005f2062e7
	.xword	0x00000000a757e55e
	.xword	0x000000007e2801d2
	.xword	0x000000001ec3acb5
	.xword	0x000000004c8d3461
	.xword	0x000000007ee3d2d3
	.xword	0x000000003bcae7cb
	.xword	0x000000007f078075
	.xword	0x0000000067815aea
	.xword	0x00000000b4127c98
	.xword	0x000000005924c9e4
	.xword	0x00000000cf59ce73
	.xword	0x000000006ec87742
	.xword	0x000000002309083b
	.xword	0x000000006ffb898c
	.xword	0x00000000209a58f5
	.xword	0x000000005e724f13
	.xword	0x000000003eeb8e20
	.xword	0x00000000b4769318
	.xword	0x000000003200c0bf
	.xword	0x000000004db2d748
	.xword	0x0000000041e205ed
	.xword	0x00000000322d7a38
	.xword	0x0000000066e72b21
	.xword	0x00000000efedfbe2
	.xword	0x00000000e8caefb4
	.xword	0x000000006850dfb0
	.xword	0x0000000097087baa
	.xword	0x000000001ec87d3b
	.xword	0x00000000bc74ab6a
	.xword	0x00000000edfe42b9
	.xword	0x00000000b201d463
	.xword	0x00000000e8e56570
	.xword	0x000000001dcaaf8b
	.xword	0x00000000287a7280
	.xword	0x00000000bdac4469
	.xword	0x000000009fac78e1
	.xword	0x00000000af98851a
	.xword	0x00000000a1cf37f2
	.xword	0x00000000c3bf53f0
	.xword	0x00000000b6ae8039
	.xword	0x00000000b8b77fda
	.xword	0x0000000096ca6038
	.xword	0x0000000029324f15
	.xword	0x000000006fc55c43
	.xword	0x000000007d660a13
	.xword	0x00000000bd2ce5df
	.xword	0x0000000055e47e3e
	.xword	0x00000000dc028e73
	.xword	0x00000000c4e4c980
	.xword	0x000000003e1abb0e
	.xword	0x000000005f6b758a
	.xword	0x00000000ff312bd2
	.xword	0x0000000078747fcf
	.xword	0x0000000019f36194
	.xword	0x00000000f6ef82b5
	.xword	0x0000000009d87499
	.xword	0x0000000044417676
	.xword	0x00000000ce31d420
	.xword	0x0000000015384286
	.xword	0x00000000a1a0129c
	.xword	0x000000000ed0c7b0
	.xword	0x000000001a4e0c18
	.xword	0x0000000051fa1703
	.xword	0x000000007aa15566
	.xword	0x00000000a7a465cb
	.xword	0x00000000e98ce254
	.xword	0x000000009b2eceaa
	.xword	0x00000000bafbda4f
	.xword	0x000000003129cd59
	.xword	0x000000005636994e
	.xword	0x000000005daed06a
	.xword	0x00000000047837fb
	.xword	0x00000000f1002620
	.xword	0x00000000fae10f3f
	.xword	0x000000008c3313d7
	.xword	0x00000000b6f7f295
	.xword	0x0000000069edc7a7
	.xword	0x0000000017b7101b
	.xword	0x00000000ca1ee221
	.xword	0x0000000028f83025
	.xword	0x00000000d1ff2b33
	.xword	0x000000004d433e77
	.xword	0x000000008f64ec82
	.xword	0x00000000a0169745
	.xword	0x0000000062257068
	.xword	0x00000000ba1c90c3
	.xword	0x00000000cc513a83
	.xword	0x000000002ffbbfdd
	.xword	0x000000003b9842c4
	.xword	0x000000001de9ea85
	.xword	0x0000000070809404
	.xword	0x00000000247621ac
	.xword	0x000000001b078ff0
	.xword	0x0000000017848d4a
	.xword	0x00000000eca9a666
	.xword	0x0000000098388561
	.xword	0x00000000501febce
	.xword	0x00000000c30a2ba8
	.xword	0x0000000026a93a65
	.xword	0x0000000009680252
	.xword	0x00000000e04ee52d
	.xword	0x0000000078134a83
	.xword	0x00000000619ebb24
	.xword	0x000000005e7f98b6
	.xword	0x000000000da66691
	.xword	0x000000008fa292f0
	.xword	0x000000006ecf925e
	.xword	0x000000004682a7bd
	.xword	0x000000001aa759c3
	.xword	0x0000000062629000
	.xword	0x00000000e10f1a84
	.xword	0x000000001875928c
	.xword	0x00000000c6df1d40
	.xword	0x000000001267ffc0
	.xword	0x00000000604383f6
	.xword	0x00000000c63f7e72
	.xword	0x00000000568f2db4
	.xword	0x00000000056f9a57
	.xword	0x0000000017f87580
	.xword	0x0000000087023957
	.xword	0x0000000029902c35
	.xword	0x0000000093aaec15
	.xword	0x000000003bcc927d
	.xword	0x00000000121c7786
	.xword	0x000000004e005994
	.xword	0x000000004142dc11
	.xword	0x000000003acf5c81
	.xword	0x000000002404e028
	.xword	0x00000000a6d02a9f
	.xword	0x0000000004eec471
	.xword	0x00000000300891b3
	.xword	0x000000007e5eedc2
	.xword	0x00000000896e0b9f
	.xword	0x000000000f7257f0
	.xword	0x00000000bd705b33
	.xword	0x00000000dfd9abef
	.xword	0x00000000ea79ee87
	.xword	0x00000000c97dce88
	.xword	0x000000005553227d
	.xword	0x00000000624b3802
	.xword	0x00000000a5cd2f49
	.xword	0x000000003772ea70
	.xword	0x0000000014dc01b8
	.xword	0x00000000ac692d5e
	.xword	0x00000000f57e7579
	.xword	0x00000000b76a2c9d
	.xword	0x00000000c369bc30
	.xword	0x0000000055f0f618
	.xword	0x00000000b3451cca
	.xword	0x000000006520f984
	.xword	0x00000000558f37fa
	.xword	0x00000000e81394ea
	.xword	0x0000000054bafc86
	.xword	0x00000000335b7038
	.xword	0x000000006966d720
	.xword	0x0000000045e1d0e8
	.xword	0x0000000042c3427c
	.xword	0x00000000fa5f4614
	.xword	0x00000000a5eb8ec7
	.xword	0x000000003b03b200
	.xword	0x00000000acf859cf
	.xword	0x0000000090162b6b
	.xword	0x000000005ef518ec
	.xword	0x00000000a7aa2158
	.xword	0x000000008f2bfa72
	.xword	0x00000000640b9395
	.xword	0x000000003daf5e05
	.xword	0x000000004b6e77f0
	.xword	0x00000000343733cf
	.xword	0x00000000e574e7de
	.xword	0x00000000fd32326e
	.xword	0x000000000573bd14
	.xword	0x00000000f1960075
	.xword	0x000000005e9a8ed7
	.xword	0x00000000b63efff7
	.xword	0x00000000029c5117
	.xword	0x00000000ef51e465
	.xword	0x00000000132159c4
	.xword	0x000000005c01f270
	.xword	0x000000002de92f0b
	.xword	0x00000000bb6ff232
	.xword	0x000000005e62880f
	.xword	0x00000000c6041434
	.xword	0x0000000096a096af
	.xword	0x00000000ed733d9d
	.xword	0x00000000994a64cc
	.xword	0x000000008b1e289d
	.xword	0x0000000091a6964a
	.xword	0x000000006600daac
	.xword	0x0000000072483059
	.xword	0x00000000d94afcd1
	.xword	0x00000000bccbcbec
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	wr %r16,0x1fff,%y
	setx	t2_data64_start_0,%g3, %g1
	setx	t2_data32_start_0,%g3, %g2
	.word 0xb3694018  ! 3: SDIVX_R	sdivx	%r5, %r24, %r25
	.word 0x8a7aa001  ! 8: SDIV_I	sdiv 	%r10, 0x0001, %r5
	.word 0xaa7f4007  ! 13: SDIV_R	sdiv 	%r29, %r7, %r21
	.word 0xae720000  ! 18: UDIV_R	udiv 	%r8, %r0, %r23
	.word 0x9248e001  ! 23: MULX_I	mulx 	%r3, 0x0001, %r9
	.word 0x864a0019  ! 28: MULX_R	mulx 	%r8, %r25, %r3
	.word 0xa26da001  ! 33: UDIVX_I	udivx 	%r22, 0x0001, %r17
	.word 0xa26ba001  ! 38: UDIVX_I	udivx 	%r14, 0x0001, %r17
	.word 0x96722001  ! 43: UDIV_I	udiv 	%r8, 0x0001, %r11
	.word 0xa04aa001  ! 48: MULX_I	mulx 	%r10, 0x0001, %r16
	.word 0x865b8000  ! 53: SMUL_R	smul 	%r14, %r0, %r3
	.word 0xb0fb8014  ! 58: SDIVcc_R	sdivcc 	%r14, %r20, %r24
	.word 0xb5698013  ! 63: SDIVX_R	sdivx	%r6, %r19, %r26
	.word 0xb16b8005  ! 68: SDIVX_R	sdivx	%r14, %r5, %r24
	.word 0x9e4a6001  ! 73: MULX_I	mulx 	%r9, 0x0001, %r15
	.word 0x9e724005  ! 78: UDIV_R	udiv 	%r9, %r5, %r15
	.word 0xe658a148  ! 83: LDX_I	ldx	[%r2 + 0x0148], %r19
	.word 0xa84d8017  ! 88: MULX_R	mulx 	%r22, %r23, %r20
	.word 0xbe4f2001  ! 93: MULX_I	mulx 	%r28, 0x0001, %r31
	.word 0x964a2001  ! 98: MULX_I	mulx 	%r8, 0x0001, %r11
	.word 0xba4cc016  ! 103: MULX_R	mulx 	%r19, %r22, %r29
	.word 0x81846001  ! 108: WRY_I	wr	%r17, 0x0001, %y
	.word 0xb6d02001  ! 113: UMULcc_I	umulcc 	%r0, 0x0001, %r27
	.word 0x98d62001  ! 118: UMULcc_I	umulcc 	%r24, 0x0001, %r12
	.word 0xb9682001  ! 123: SDIVX_I	sdivx	%r0, 0x0001, %r28
	.word 0xbad1a001  ! 128: UMULcc_I	umulcc 	%r6, 0x0001, %r29
	.word 0xad6fa001  ! 133: SDIVX_I	sdivx	%r30, 0x0001, %r22
	.word 0xac6f6001  ! 138: UDIVX_I	udivx 	%r29, 0x0001, %r22
	.word 0xbd6ea001  ! 143: SDIVX_I	sdivx	%r26, 0x0001, %r30
	.word 0x8eff801d  ! 148: SDIVcc_R	sdivcc 	%r30, %r29, %r7
	.word 0xa44ca001  ! 153: MULX_I	mulx 	%r18, 0x0001, %r18
	.word 0x8a48e001  ! 158: MULX_I	mulx 	%r3, 0x0001, %r5
	.word 0x905a2001  ! 163: SMUL_I	smul 	%r8, 0x0001, %r8
	.word 0xad69e001  ! 168: SDIVX_I	sdivx	%r7, 0x0001, %r22
	.word 0xacddc00e  ! 173: SMULcc_R	smulcc 	%r23, %r14, %r22
	.word 0x896f8010  ! 178: SDIVX_R	sdivx	%r30, %r16, %r4
	.word 0x9e4ca001  ! 183: MULX_I	mulx 	%r18, 0x0001, %r15
	.word 0xbef48010  ! 188: UDIVcc_R	udivcc 	%r18, %r16, %r31
	.word 0xa6f10004  ! 193: UDIVcc_R	udivcc 	%r4, %r4, %r19
	.word 0xaaf7e001  ! 198: UDIVcc_I	udivcc 	%r31, 0x0001, %r21
	.word 0xbc69c017  ! 203: UDIVX_R	udivx 	%r7, %r23, %r30
	.word 0xb0f00007  ! 208: UDIVcc_R	udivcc 	%r0, %r7, %r24
	.word 0x98dee001  ! 213: SMULcc_I	smulcc 	%r27, 0x0001, %r12
	.word 0xba578006  ! 218: UMUL_R	umul 	%r30, %r6, %r29
	.word 0x9a77a001  ! 223: UDIV_I	udiv 	%r30, 0x0001, %r13
	.word 0x9857e001  ! 228: UMUL_I	umul 	%r31, 0x0001, %r12
	.word 0xe45864f8  ! 233: LDX_I	ldx	[%r1 + 0x04f8], %r18
	.word 0x8182e001  ! 238: WRY_I	wr	%r11, 0x0001, %y
	.word 0xad682001  ! 243: SDIVX_I	sdivx	%r0, 0x0001, %r22
	.word 0x9e7da001  ! 248: SDIV_I	sdiv 	%r22, 0x0001, %r15
	.word 0x9e4ce001  ! 253: MULX_I	mulx 	%r19, 0x0001, %r15
	.word 0x9e7b2001  ! 258: SDIV_I	sdiv 	%r12, 0x0001, %r15
	.word 0x904de001  ! 263: MULX_I	mulx 	%r23, 0x0001, %r8
	.word 0xf058a230  ! 268: LDX_I	ldx	[%r2 + 0x0230], %r24
	.word 0xbe6e001b  ! 273: UDIVX_R	udivx 	%r24, %r27, %r31
	.word 0xbb226001  ! 278: MULScc_I	mulscc 	%r9, 0x0001, %r29
	.word 0x996c8010  ! 283: SDIVX_R	sdivx	%r18, %r16, %r12
	.word 0xbe68001d  ! 288: UDIVX_R	udivx 	%r0, %r29, %r31
	.word 0x8d22e001  ! 293: MULScc_I	mulscc 	%r11, 0x0001, %r6
	.word 0x90ddc00a  ! 298: SMULcc_R	smulcc 	%r23, %r10, %r8
	.word 0x9cd5801d  ! 303: UMULcc_R	umulcc 	%r22, %r29, %r14
	.word 0x907f2001  ! 308: SDIV_I	sdiv 	%r28, 0x0001, %r8
	.word 0x884a0000  ! 313: MULX_R	mulx 	%r8, %r0, %r4
	.word 0x8650e001  ! 318: UMUL_I	umul 	%r3, 0x0001, %r3
	.word 0x8e6fa001  ! 323: UDIVX_I	udivx 	%r30, 0x0001, %r7
	.word 0xaa69000f  ! 328: UDIVX_R	udivx 	%r4, %r15, %r21
	.word 0xda58a568  ! 333: LDX_I	ldx	[%r2 + 0x0568], %r13
	.word 0x8187e001  ! 338: WRY_I	wr	%r31, 0x0001, %y
	.word 0x8f22e001  ! 343: MULScc_I	mulscc 	%r11, 0x0001, %r7
	.word 0xec586310  ! 348: LDX_I	ldx	[%r1 + 0x0310], %r22
	.word 0x88754012  ! 353: UDIV_R	udiv 	%r21, %r18, %r4
	.word 0xb66a2001  ! 358: UDIVX_I	udivx 	%r8, 0x0001, %r27
	.word 0xba790018  ! 363: SDIV_R	sdiv 	%r4, %r24, %r29
	.word 0xb2480019  ! 368: MULX_R	mulx 	%r0, %r25, %r25
	.word 0x8182a001  ! 373: WRY_I	wr	%r10, 0x0001, %y
	.word 0x9d6bc016  ! 378: SDIVX_R	sdivx	%r15, %r22, %r14
	.word 0xbe572001  ! 383: UMUL_I	umul 	%r28, 0x0001, %r31
	.word 0x8a7ea001  ! 388: SDIV_I	sdiv 	%r26, 0x0001, %r5
	.word 0xa96d000c  ! 393: SDIVX_R	sdivx	%r20, %r12, %r20
	.word 0x9e4a400a  ! 398: MULX_R	mulx 	%r9, %r10, %r15
	.word 0x985e6001  ! 403: SMUL_I	smul 	%r25, 0x0001, %r12
	.word 0x92d32001  ! 408: UMULcc_I	umulcc 	%r12, 0x0001, %r9
	.word 0xf458a548  ! 413: LDX_I	ldx	[%r2 + 0x0548], %r26
	.word 0x9275c01b  ! 418: UDIV_R	udiv 	%r23, %r27, %r9
	.word 0x896ec017  ! 423: SDIVX_R	sdivx	%r27, %r23, %r4
	.word 0x9e4b0004  ! 428: MULX_R	mulx 	%r12, %r4, %r15
	.word 0x9d6d0000  ! 433: SDIVX_R	sdivx	%r20, %r0, %r14
	.word 0xca58a410  ! 438: LDX_I	ldx	[%r2 + 0x0410], %r5
	.word 0xba6ee001  ! 443: UDIVX_I	udivx 	%r27, 0x0001, %r29
	.word 0x9648e001  ! 448: MULX_I	mulx 	%r3, 0x0001, %r11
	.word 0x9a4c8008  ! 453: MULX_R	mulx 	%r18, %r8, %r13
	.word 0x9c4ba001  ! 458: MULX_I	mulx 	%r14, 0x0001, %r14
	.word 0x9657400d  ! 463: UMUL_R	umul 	%r29, %r13, %r11
	.word 0xb07ea001  ! 468: SDIV_I	sdiv 	%r26, 0x0001, %r24
	.word 0xac4f8000  ! 473: MULX_R	mulx 	%r30, %r0, %r22
	.word 0x81836001  ! 478: WRY_I	wr	%r13, 0x0001, %y
	.word 0x946c6001  ! 483: UDIVX_I	udivx 	%r17, 0x0001, %r10
	.word 0x996f0016  ! 488: SDIVX_R	sdivx	%r28, %r22, %r12
	.word 0xa67e0005  ! 493: SDIV_R	sdiv 	%r24, %r5, %r19
	.word 0xa56b4010  ! 498: SDIVX_R	sdivx	%r13, %r16, %r18
	.word 0xb569401f  ! 503: SDIVX_R	sdivx	%r5, %r31, %r26
	.word 0x8921a001  ! 508: MULScc_I	mulscc 	%r6, 0x0001, %r4
	.word 0x876f8011  ! 513: SDIVX_R	sdivx	%r30, %r17, %r3
	.word 0xa071c000  ! 518: UDIV_R	udiv 	%r7, %r0, %r16
	.word 0xca586260  ! 523: LDX_I	ldx	[%r1 + 0x0260], %r5
	.word 0x96716001  ! 528: UDIV_I	udiv 	%r5, 0x0001, %r11
	.word 0xa86c2001  ! 533: UDIVX_I	udivx 	%r16, 0x0001, %r20
	.word 0xac4a8012  ! 538: MULX_R	mulx 	%r10, %r18, %r22
	.word 0xba48c006  ! 543: MULX_R	mulx 	%r3, %r6, %r29
	.word 0xa070e001  ! 548: UDIV_I	udiv 	%r3, 0x0001, %r16
	.word 0x9a4e6001  ! 553: MULX_I	mulx 	%r25, 0x0001, %r13
	.word 0xae71801d  ! 558: UDIV_R	udiv 	%r6, %r29, %r23
	.word 0x90f44017  ! 563: UDIVcc_R	udivcc 	%r17, %r23, %r8
	.word 0xb049a001  ! 568: MULX_I	mulx 	%r6, 0x0001, %r24
	.word 0xa24b2001  ! 573: MULX_I	mulx 	%r12, 0x0001, %r17
	.word 0xb96b2001  ! 578: SDIVX_I	sdivx	%r12, 0x0001, %r28
	.word 0xea58a320  ! 583: LDX_I	ldx	[%r2 + 0x0320], %r21
	.word 0x9525e001  ! 588: MULScc_I	mulscc 	%r23, 0x0001, %r10
	.word 0x946fe001  ! 593: UDIVX_I	udivx 	%r31, 0x0001, %r10
	.word 0x8a6f4000  ! 598: UDIVX_R	udivx 	%r29, %r0, %r5
	.word 0xba482001  ! 603: MULX_I	mulx 	%r0, 0x0001, %r29
	.word 0xba6bc00f  ! 608: UDIVX_R	udivx 	%r15, %r15, %r29
	.word 0xe4586238  ! 613: LDX_I	ldx	[%r1 + 0x0238], %r18
	.word 0xb16ae001  ! 618: SDIVX_I	sdivx	%r11, 0x0001, %r24
	.word 0x92f6e001  ! 623: UDIVcc_I	udivcc 	%r27, 0x0001, %r9
	.word 0xd858a318  ! 628: LDX_I	ldx	[%r2 + 0x0318], %r12
	.word 0x886a001f  ! 633: UDIVX_R	udivx 	%r8, %r31, %r4
	.word 0x8a4c6001  ! 638: MULX_I	mulx 	%r17, 0x0001, %r5
	.word 0xaa70e001  ! 643: UDIV_I	udiv 	%r3, 0x0001, %r21
	.word 0x9b6de001  ! 648: SDIVX_I	sdivx	%r23, 0x0001, %r13
	.word 0xa2f80000  ! 653: SDIVcc_R	sdivcc 	%r0, %r0, %r17
	.word 0xb65e000f  ! 658: SMUL_R	smul 	%r24, %r15, %r27
	.word 0xa2dcc014  ! 663: SMULcc_R	smulcc 	%r19, %r20, %r17
	.word 0xa3682001  ! 668: SDIVX_I	sdivx	%r0, 0x0001, %r17
	.word 0xa2540018  ! 673: UMUL_R	umul 	%r16, %r24, %r17
	.word 0x90752001  ! 678: UDIV_I	udiv 	%r20, 0x0001, %r8
	.word 0xb4d2a001  ! 683: UMULcc_I	umulcc 	%r10, 0x0001, %r26
	.word 0x8181e001  ! 688: WRY_I	wr	%r7, 0x0001, %y
	.word 0xa04de001  ! 693: MULX_I	mulx 	%r23, 0x0001, %r16
	.word 0xb2542001  ! 698: UMUL_I	umul 	%r16, 0x0001, %r25
	.word 0x976a6001  ! 703: SDIVX_I	sdivx	%r9, 0x0001, %r11
	.word 0x964fc000  ! 708: MULX_R	mulx 	%r31, %r0, %r11
	.word 0xa06b2001  ! 713: UDIVX_I	udivx 	%r12, 0x0001, %r16
	.word 0x9c6fc00c  ! 718: UDIVX_R	udivx 	%r31, %r12, %r14
	.word 0xb079000a  ! 723: SDIV_R	sdiv 	%r4, %r10, %r24
	.word 0xa368c00e  ! 728: SDIVX_R	sdivx	%r3, %r14, %r17
	.word 0xa849c019  ! 733: MULX_R	mulx 	%r7, %r25, %r20
	.word 0xa0fec00d  ! 738: SDIVcc_R	sdivcc 	%r27, %r13, %r16
	.word 0x81866001  ! 743: WRY_I	wr	%r25, 0x0001, %y
	.word 0xa36a0019  ! 748: SDIVX_R	sdivx	%r8, %r25, %r17
	.word 0xb04f4014  ! 753: MULX_R	mulx 	%r29, %r20, %r24
	.word 0xb86b4012  ! 758: UDIVX_R	udivx 	%r13, %r18, %r28
	.word 0x9a6b401e  ! 763: UDIVX_R	udivx 	%r13, %r30, %r13
	.word 0x964da001  ! 768: MULX_I	mulx 	%r22, 0x0001, %r11
	.word 0x8181e001  ! 773: WRY_I	wr	%r7, 0x0001, %y
	.word 0xa321a001  ! 778: MULScc_I	mulscc 	%r6, 0x0001, %r17
	.word 0xc6586798  ! 783: LDX_I	ldx	[%r1 + 0x0798], %r3
	.word 0xaa734016  ! 788: UDIV_R	udiv 	%r13, %r22, %r21
	.word 0xa26ec01f  ! 793: UDIVX_R	udivx 	%r27, %r31, %r17
	.word 0x94d4e001  ! 798: UMULcc_I	umulcc 	%r19, 0x0001, %r10
	.word 0x906d4004  ! 803: UDIVX_R	udivx 	%r21, %r4, %r8
	.word 0xb24be001  ! 808: MULX_I	mulx 	%r15, 0x0001, %r25
	.word 0xb8d3400f  ! 813: UMULcc_R	umulcc 	%r13, %r15, %r28
	.word 0x8180e001  ! 818: WRY_I	wr	%r3, 0x0001, %y
	.word 0x8ad36001  ! 823: UMULcc_I	umulcc 	%r13, 0x0001, %r5
	.word 0xa56d2001  ! 828: SDIVX_I	sdivx	%r20, 0x0001, %r18
	.word 0x94f4c01a  ! 833: UDIVcc_R	udivcc 	%r19, %r26, %r10
	.word 0xbb6ba001  ! 838: SDIVX_I	sdivx	%r14, 0x0001, %r29
	.word 0xbc4f8004  ! 843: MULX_R	mulx 	%r30, %r4, %r30
	.word 0xa671800d  ! 848: UDIV_R	udiv 	%r6, %r13, %r19
	.word 0x996e800d  ! 853: SDIVX_R	sdivx	%r26, %r13, %r12
	.word 0x8d6a4014  ! 858: SDIVX_R	sdivx	%r9, %r20, %r6
	.word 0xae7f0012  ! 863: SDIV_R	sdiv 	%r28, %r18, %r23
	.word 0xbf6c800d  ! 868: SDIVX_R	sdivx	%r18, %r13, %r31
	.word 0xba4d400d  ! 873: MULX_R	mulx 	%r21, %r13, %r29
	.word 0x8cd7400c  ! 878: UMULcc_R	umulcc 	%r29, %r12, %r6
	.word 0x9b27c015  ! 883: MULScc_R	mulscc 	%r31, %r21, %r13
	.word 0xba4c6001  ! 888: MULX_I	mulx 	%r17, 0x0001, %r29
	.word 0x8c4b2001  ! 893: MULX_I	mulx 	%r12, 0x0001, %r6
	.word 0xf2586510  ! 898: LDX_I	ldx	[%r1 + 0x0510], %r25
	.word 0xa8ddc004  ! 903: SMULcc_R	smulcc 	%r23, %r4, %r20
	.word 0xb2fc6001  ! 908: SDIVcc_I	sdivcc 	%r17, 0x0001, %r25
	.word 0xaa48001b  ! 913: MULX_R	mulx 	%r0, %r27, %r21
	.word 0x904c6001  ! 918: MULX_I	mulx 	%r17, 0x0001, %r8
	.word 0x91682001  ! 923: SDIVX_I	sdivx	%r0, 0x0001, %r8
	.word 0x886ac000  ! 928: UDIVX_R	udivx 	%r11, %r0, %r4
	.word 0xac680006  ! 933: UDIVX_R	udivx 	%r0, %r6, %r22
	.word 0x8186a001  ! 938: WRY_I	wr	%r26, 0x0001, %y
	.word 0x8e532001  ! 943: UMUL_I	umul 	%r12, 0x0001, %r7
	.word 0x905f6001  ! 948: SMUL_I	smul 	%r29, 0x0001, %r8
	.word 0xba494012  ! 953: MULX_R	mulx 	%r5, %r18, %r29
	.word 0xfa586720  ! 958: LDX_I	ldx	[%r1 + 0x0720], %r29
	.word 0x944b4013  ! 963: MULX_R	mulx 	%r13, %r19, %r10
	.word 0xa76ba001  ! 968: SDIVX_I	sdivx	%r14, 0x0001, %r19
	.word 0xa2dd6001  ! 973: SMULcc_I	smulcc 	%r21, 0x0001, %r17
	.word 0x8e4d2001  ! 978: MULX_I	mulx 	%r20, 0x0001, %r7
	.word 0x81832001  ! 983: WRY_I	wr	%r12, 0x0001, %y
	.word 0xa8496001  ! 988: MULX_I	mulx 	%r5, 0x0001, %r20
	.word 0xaaf02001  ! 993: UDIVcc_I	udivcc 	%r0, 0x0001, %r21
	.word 0x9e6a401c  ! 998: UDIVX_R	udivx 	%r9, %r28, %r15
	.word 0x886b8016  ! 1003: UDIVX_R	udivx 	%r14, %r22, %r4
	.word 0x9e4c001d  ! 1008: MULX_R	mulx 	%r16, %r29, %r15
	.word 0xdc586600  ! 1013: LDX_I	ldx	[%r1 + 0x0600], %r14
	.word 0xa84e2001  ! 1018: MULX_I	mulx 	%r24, 0x0001, %r20
	.word 0xa26ac00a  ! 1023: UDIVX_R	udivx 	%r11, %r10, %r17
	.word 0xb0fa6001  ! 1028: SDIVcc_I	sdivcc 	%r9, 0x0001, %r24
	.word 0x9276800e  ! 1033: UDIV_R	udiv 	%r26, %r14, %r9
	.word 0x9a4ba001  ! 1038: MULX_I	mulx 	%r14, 0x0001, %r13
	.word 0xae7a2001  ! 1043: SDIV_I	sdiv 	%r8, 0x0001, %r23
	.word 0x866ee001  ! 1048: UDIVX_I	udivx 	%r27, 0x0001, %r3
	.word 0x9cf16001  ! 1053: UDIVcc_I	udivcc 	%r5, 0x0001, %r14
	.word 0xb8570014  ! 1058: UMUL_R	umul 	%r28, %r20, %r28
	.word 0xb24c2001  ! 1063: MULX_I	mulx 	%r16, 0x0001, %r25
	.word 0xa96e801e  ! 1068: SDIVX_R	sdivx	%r26, %r30, %r20
	.word 0x9c48c00d  ! 1073: MULX_R	mulx 	%r3, %r13, %r14
	.word 0x916e6001  ! 1078: SDIVX_I	sdivx	%r25, 0x0001, %r8
	.word 0xb56ba001  ! 1083: SDIVX_I	sdivx	%r14, 0x0001, %r26
	.word 0x8186e001  ! 1088: WRY_I	wr	%r27, 0x0001, %y
	.word 0xb049c012  ! 1093: MULX_R	mulx 	%r7, %r18, %r24
	.word 0xb26c801d  ! 1098: UDIVX_R	udivx 	%r18, %r29, %r25
	.word 0x96778018  ! 1103: UDIV_R	udiv 	%r30, %r24, %r11
	.word 0x944cc018  ! 1108: MULX_R	mulx 	%r19, %r24, %r10
	.word 0x92fc4009  ! 1113: SDIVcc_R	sdivcc 	%r17, %r9, %r9
	.word 0x8e6ac012  ! 1118: UDIVX_R	udivx 	%r11, %r18, %r7
	.word 0xba4ee001  ! 1123: MULX_I	mulx 	%r27, 0x0001, %r29
	.word 0xaa548017  ! 1128: UMUL_R	umul 	%r18, %r23, %r21
	.word 0x964d2001  ! 1133: MULX_I	mulx 	%r20, 0x0001, %r11
	.word 0x8b6c001e  ! 1138: SDIVX_R	sdivx	%r16, %r30, %r5
	.word 0xb2502001  ! 1143: UMUL_I	umul 	%r0, 0x0001, %r25
	.word 0xaf6c8010  ! 1148: SDIVX_R	sdivx	%r18, %r16, %r23
	.word 0x91692001  ! 1153: SDIVX_I	sdivx	%r4, 0x0001, %r8
	.word 0xb36da001  ! 1158: SDIVX_I	sdivx	%r22, 0x0001, %r25
	.word 0x86734016  ! 1163: UDIV_R	udiv 	%r13, %r22, %r3
	.word 0xb8496001  ! 1168: MULX_I	mulx 	%r5, 0x0001, %r28
	.word 0xac590013  ! 1173: SMUL_R	smul 	%r4, %r19, %r22
	.word 0x944e6001  ! 1178: MULX_I	mulx 	%r25, 0x0001, %r10
	.word 0x8a4f400f  ! 1183: MULX_R	mulx 	%r29, %r15, %r5
	.word 0x90482001  ! 1188: MULX_I	mulx 	%r0, 0x0001, %r8
	.word 0xa44e6001  ! 1193: MULX_I	mulx 	%r25, 0x0001, %r18
	.word 0xb6d4e001  ! 1198: UMULcc_I	umulcc 	%r19, 0x0001, %r27
	.word 0xa649400a  ! 1203: MULX_R	mulx 	%r5, %r10, %r19
	.word 0xa6fd4004  ! 1208: SDIVcc_R	sdivcc 	%r21, %r4, %r19
	.word 0x8cf8000d  ! 1213: SDIVcc_R	sdivcc 	%r0, %r13, %r6
	.word 0xaa4c6001  ! 1218: MULX_I	mulx 	%r17, 0x0001, %r21
	.word 0xb36c6001  ! 1223: SDIVX_I	sdivx	%r17, 0x0001, %r25
	.word 0xa24dc00f  ! 1228: MULX_R	mulx 	%r23, %r15, %r17
	.word 0x904d6001  ! 1233: MULX_I	mulx 	%r21, 0x0001, %r8
	.word 0x9e6e401f  ! 1238: UDIVX_R	udivx 	%r25, %r31, %r15
	.word 0xd258a670  ! 1243: LDX_I	ldx	[%r2 + 0x0670], %r9
	.word 0xbc4a2001  ! 1248: MULX_I	mulx 	%r8, 0x0001, %r30
	.word 0x94dde001  ! 1253: SMULcc_I	smulcc 	%r23, 0x0001, %r10
	.word 0x896e6001  ! 1258: SDIVX_I	sdivx	%r25, 0x0001, %r4
	.word 0xb04f2001  ! 1263: MULX_I	mulx 	%r28, 0x0001, %r24
	.word 0x8187e001  ! 1268: WRY_I	wr	%r31, 0x0001, %y
	.word 0xb24de001  ! 1273: MULX_I	mulx 	%r23, 0x0001, %r25
	.word 0x9a6cc01d  ! 1278: UDIVX_R	udivx 	%r19, %r29, %r13
	.word 0x8b69401a  ! 1283: SDIVX_R	sdivx	%r5, %r26, %r5
	.word 0xa668e001  ! 1288: UDIVX_I	udivx 	%r3, 0x0001, %r19
	.word 0xa1256001  ! 1293: MULScc_I	mulscc 	%r21, 0x0001, %r16
	.word 0xa922401b  ! 1298: MULScc_R	mulscc 	%r9, %r27, %r20
	.word 0xaa6de001  ! 1303: UDIVX_I	udivx 	%r23, 0x0001, %r21
	.word 0xbe522001  ! 1308: UMUL_I	umul 	%r8, 0x0001, %r31
	.word 0xba718008  ! 1313: UDIV_R	udiv 	%r6, %r8, %r29
	.word 0x926f000c  ! 1318: UDIVX_R	udivx 	%r28, %r12, %r9
	.word 0x8e4c6001  ! 1323: MULX_I	mulx 	%r17, 0x0001, %r7
	.word 0x9c766001  ! 1328: UDIV_I	udiv 	%r25, 0x0001, %r14
	.word 0x8676c000  ! 1333: UDIV_R	udiv 	%r27, %r0, %r3
	.word 0x8c79a001  ! 1338: SDIV_I	sdiv 	%r6, 0x0001, %r6
	.word 0x81866001  ! 1343: WRY_I	wr	%r25, 0x0001, %y
	.word 0x8c59a001  ! 1348: SMUL_I	smul 	%r6, 0x0001, %r6
	.word 0xee586170  ! 1353: LDX_I	ldx	[%r1 + 0x0170], %r23
	.word 0x81846001  ! 1358: WRY_I	wr	%r17, 0x0001, %y
	.word 0xa4d60013  ! 1363: UMULcc_R	umulcc 	%r24, %r19, %r18
	.word 0x9e71c018  ! 1368: UDIV_R	udiv 	%r7, %r24, %r15
	.word 0x8a6d401d  ! 1373: UDIVX_R	udivx 	%r21, %r29, %r5
	.word 0x946f6001  ! 1378: UDIVX_I	udivx 	%r29, 0x0001, %r10
	.word 0xb269a001  ! 1383: UDIVX_I	udivx 	%r6, 0x0001, %r25
	.word 0xb56b000f  ! 1388: SDIVX_R	sdivx	%r12, %r15, %r26
	.word 0x884bc008  ! 1393: MULX_R	mulx 	%r15, %r8, %r4
	.word 0x96f6000d  ! 1398: UDIVcc_R	udivcc 	%r24, %r13, %r11
	.word 0x8e4f8006  ! 1403: MULX_R	mulx 	%r30, %r6, %r7
	.word 0xa2482001  ! 1408: MULX_I	mulx 	%r0, 0x0001, %r17
	.word 0xa64c6001  ! 1413: MULX_I	mulx 	%r17, 0x0001, %r19
	.word 0x9e4b801d  ! 1418: MULX_R	mulx 	%r14, %r29, %r15
	.word 0x89230006  ! 1423: MULScc_R	mulscc 	%r12, %r6, %r4
	.word 0x9ef8000d  ! 1428: SDIVcc_R	sdivcc 	%r0, %r13, %r15
	.word 0xa47fa001  ! 1433: SDIV_I	sdiv 	%r30, 0x0001, %r18
	.word 0xa66b0007  ! 1438: UDIVX_R	udivx 	%r12, %r7, %r19
	.word 0xa8d1a001  ! 1443: UMULcc_I	umulcc 	%r6, 0x0001, %r20
	.word 0x9ad24005  ! 1448: UMULcc_R	umulcc 	%r9, %r5, %r13
	.word 0x9254e001  ! 1453: UMUL_I	umul 	%r19, 0x0001, %r9
	.word 0xb66ee001  ! 1458: UDIVX_I	udivx 	%r27, 0x0001, %r27
	.word 0x946dc01c  ! 1463: UDIVX_R	udivx 	%r23, %r28, %r10
	.word 0xa6f9401b  ! 1468: SDIVcc_R	sdivcc 	%r5, %r27, %r19
	.word 0xb0fde001  ! 1473: SDIVcc_I	sdivcc 	%r23, 0x0001, %r24
	.word 0x976d0004  ! 1478: SDIVX_R	sdivx	%r20, %r4, %r11
	.word 0x8187e001  ! 1483: WRY_I	wr	%r31, 0x0001, %y
	.word 0xb36e8013  ! 1488: SDIVX_R	sdivx	%r26, %r19, %r25
	.word 0xb84ca001  ! 1493: MULX_I	mulx 	%r18, 0x0001, %r28
	.word 0xb04fc01e  ! 1498: MULX_R	mulx 	%r31, %r30, %r24
	.word 0xb47a800d  ! 1503: SDIV_R	sdiv 	%r10, %r13, %r26
	.word 0x90590011  ! 1508: SMUL_R	smul 	%r4, %r17, %r8
	.word 0xf65866c8  ! 1513: LDX_I	ldx	[%r1 + 0x06c8], %r27
	.word 0xbadca001  ! 1518: SMULcc_I	smulcc 	%r18, 0x0001, %r29
	.word 0x9e5cc000  ! 1523: SMUL_R	smul 	%r19, %r0, %r15
	.word 0x8f6e8017  ! 1528: SDIVX_R	sdivx	%r26, %r23, %r7
	.word 0xa24a4018  ! 1533: MULX_R	mulx 	%r9, %r24, %r17
	.word 0xaa4d0014  ! 1538: MULX_R	mulx 	%r20, %r20, %r21
	.word 0x8a480006  ! 1543: MULX_R	mulx 	%r0, %r6, %r5
	.word 0x86494003  ! 1548: MULX_R	mulx 	%r5, %r3, %r3
	.word 0xbd6c4000  ! 1553: SDIVX_R	sdivx	%r17, %r0, %r30
	.word 0x8efe2001  ! 1558: SDIVcc_I	sdivcc 	%r24, 0x0001, %r7
	.word 0xb67f6001  ! 1563: SDIV_I	sdiv 	%r29, 0x0001, %r27
	.word 0xa44d4000  ! 1568: MULX_R	mulx 	%r21, %r0, %r18
	.word 0x9e6d001c  ! 1573: UDIVX_R	udivx 	%r20, %r28, %r15
	.word 0x9f20000e  ! 1578: MULScc_R	mulscc 	%r0, %r14, %r15
	.word 0xba72e001  ! 1583: UDIV_I	udiv 	%r11, 0x0001, %r29
	.word 0xa768001f  ! 1588: SDIVX_R	sdivx	%r0, %r31, %r19
	.word 0x8672c010  ! 1593: UDIV_R	udiv 	%r11, %r16, %r3
	.word 0x8186a001  ! 1598: WRY_I	wr	%r26, 0x0001, %y
	.word 0xa6d42001  ! 1603: UMULcc_I	umulcc 	%r16, 0x0001, %r19
	.word 0xa56e0016  ! 1608: SDIVX_R	sdivx	%r24, %r22, %r18
	.word 0xbaf2a001  ! 1613: UDIVcc_I	udivcc 	%r10, 0x0001, %r29
	.word 0xbe4be001  ! 1618: MULX_I	mulx 	%r15, 0x0001, %r31
	.word 0x98fdc015  ! 1623: SDIVcc_R	sdivcc 	%r23, %r21, %r12
	.word 0xb126e001  ! 1628: MULScc_I	mulscc 	%r27, 0x0001, %r24
	.word 0x956c8013  ! 1633: SDIVX_R	sdivx	%r18, %r19, %r10
	.word 0xae5ca001  ! 1638: SMUL_I	smul 	%r18, 0x0001, %r23
	.word 0x8cd16001  ! 1643: UMULcc_I	umulcc 	%r5, 0x0001, %r6
	.word 0xa0682001  ! 1648: UDIVX_I	udivx 	%r0, 0x0001, %r16
	.word 0xa66ee001  ! 1653: UDIVX_I	udivx 	%r27, 0x0001, %r19
	.word 0x9b6fc007  ! 1658: SDIVX_R	sdivx	%r31, %r7, %r13
	.word 0xb07e2001  ! 1663: SDIV_I	sdiv 	%r24, 0x0001, %r24
	.word 0xaa700000  ! 1668: UDIV_R	udiv 	%r0, %r0, %r21
	.word 0xa86cc00f  ! 1673: UDIVX_R	udivx 	%r19, %r15, %r20
	.word 0x8ed9e001  ! 1678: SMULcc_I	smulcc 	%r7, 0x0001, %r7
	.word 0xb66d0015  ! 1683: UDIVX_R	udivx 	%r20, %r21, %r27
	.word 0xab6b6001  ! 1688: SDIVX_I	sdivx	%r13, 0x0001, %r21
	.word 0xac4b6001  ! 1693: MULX_I	mulx 	%r13, 0x0001, %r22
	.word 0x926d000b  ! 1698: UDIVX_R	udivx 	%r20, %r11, %r9
	.word 0xd45861e0  ! 1703: LDX_I	ldx	[%r1 + 0x01e0], %r10
	.word 0x8c6ac000  ! 1708: UDIVX_R	udivx 	%r11, %r0, %r6
	.word 0x9cf2a001  ! 1713: UDIVcc_I	udivcc 	%r10, 0x0001, %r14
	.word 0x976ac01e  ! 1718: SDIVX_R	sdivx	%r11, %r30, %r11
	.word 0x947fa001  ! 1723: SDIV_I	sdiv 	%r30, 0x0001, %r10
	.word 0xad6fc00b  ! 1728: SDIVX_R	sdivx	%r31, %r11, %r22
	.word 0x876f4000  ! 1733: SDIVX_R	sdivx	%r29, %r0, %r3
	.word 0x8d6fa001  ! 1738: SDIVX_I	sdivx	%r30, 0x0001, %r6
	.word 0xab6d6001  ! 1743: SDIVX_I	sdivx	%r21, 0x0001, %r21
	.word 0xd85865f8  ! 1748: LDX_I	ldx	[%r1 + 0x05f8], %r12
	.word 0xa04a0011  ! 1753: MULX_R	mulx 	%r8, %r17, %r16
	.word 0x92d6401c  ! 1758: UMULcc_R	umulcc 	%r25, %r28, %r9
	.word 0xac6e800d  ! 1763: UDIVX_R	udivx 	%r26, %r13, %r22
	.word 0xbedcc01c  ! 1768: SMULcc_R	smulcc 	%r19, %r28, %r31
	.word 0x8add800d  ! 1773: SMULcc_R	smulcc 	%r22, %r13, %r5
	.word 0xa84be001  ! 1778: MULX_I	mulx 	%r15, 0x0001, %r20
	.word 0xd458a460  ! 1783: LDX_I	ldx	[%r2 + 0x0460], %r10
	.word 0xbc730008  ! 1788: UDIV_R	udiv 	%r12, %r8, %r30
	.word 0xa64ce001  ! 1793: MULX_I	mulx 	%r19, 0x0001, %r19
	.word 0x946d0011  ! 1798: UDIVX_R	udivx 	%r20, %r17, %r10
	.word 0x924f2001  ! 1803: MULX_I	mulx 	%r28, 0x0001, %r9
	.word 0x8c5d4003  ! 1808: SMUL_R	smul 	%r21, %r3, %r6
	.word 0x886a4000  ! 1813: UDIVX_R	udivx 	%r9, %r0, %r4
	.word 0x8af40013  ! 1818: UDIVcc_R	udivcc 	%r16, %r19, %r5
	.word 0xaa6c6001  ! 1823: UDIVX_I	udivx 	%r17, 0x0001, %r21
	.word 0xaa4f4008  ! 1828: MULX_R	mulx 	%r29, %r8, %r21
	.word 0x8a4c800d  ! 1833: MULX_R	mulx 	%r18, %r13, %r5
	.word 0xa04ce001  ! 1838: MULX_I	mulx 	%r19, 0x0001, %r16
	.word 0xaefe0009  ! 1843: SDIVcc_R	sdivcc 	%r24, %r9, %r23
	.word 0x916b8014  ! 1848: SDIVX_R	sdivx	%r14, %r20, %r8
	.word 0xab21c009  ! 1853: MULScc_R	mulscc 	%r7, %r9, %r21
	.word 0xb6ff8003  ! 1858: SDIVcc_R	sdivcc 	%r30, %r3, %r27
	.word 0x8a4d001d  ! 1863: MULX_R	mulx 	%r20, %r29, %r5
	.word 0xa85b4004  ! 1868: SMUL_R	smul 	%r13, %r4, %r20
	.word 0x8186a001  ! 1873: WRY_I	wr	%r26, 0x0001, %y
	.word 0xa6590003  ! 1878: SMUL_R	smul 	%r4, %r3, %r19
	.word 0x9a6e8017  ! 1883: UDIVX_R	udivx 	%r26, %r23, %r13
	.word 0x8cdde001  ! 1888: SMULcc_I	smulcc 	%r23, 0x0001, %r6
	.word 0xb56b8005  ! 1893: SDIVX_R	sdivx	%r14, %r5, %r26
	.word 0x896f401e  ! 1898: SDIVX_R	sdivx	%r29, %r30, %r4
	.word 0x8f692001  ! 1903: SDIVX_I	sdivx	%r4, 0x0001, %r7
	.word 0xac53c004  ! 1908: UMUL_R	umul 	%r15, %r4, %r22
	.word 0xda586588  ! 1913: LDX_I	ldx	[%r1 + 0x0588], %r13
	.word 0x8a4c4007  ! 1918: MULX_R	mulx 	%r17, %r7, %r5
	.word 0xbf6bc018  ! 1923: SDIVX_R	sdivx	%r15, %r24, %r31
	.word 0xb36b0013  ! 1928: SDIVX_R	sdivx	%r12, %r19, %r25
	.word 0x8e542001  ! 1933: UMUL_I	umul 	%r16, 0x0001, %r7
	.word 0xa468c00b  ! 1938: UDIVX_R	udivx 	%r3, %r11, %r18
	.word 0x904ca001  ! 1943: MULX_I	mulx 	%r18, 0x0001, %r8
	.word 0xb8f5800a  ! 1948: UDIVcc_R	udivcc 	%r22, %r10, %r28
	.word 0x87680007  ! 1953: SDIVX_R	sdivx	%r0, %r7, %r3
	.word 0xaa4e6001  ! 1958: MULX_I	mulx 	%r25, 0x0001, %r21
	.word 0xa2598008  ! 1963: SMUL_R	smul 	%r6, %r8, %r17
	.word 0xa46c6001  ! 1968: UDIVX_I	udivx 	%r17, 0x0001, %r18
	.word 0xa2da0005  ! 1973: SMULcc_R	smulcc 	%r8, %r5, %r17
	.word 0x8c494000  ! 1978: MULX_R	mulx 	%r5, %r0, %r6
	.word 0x944bc00d  ! 1983: MULX_R	mulx 	%r15, %r13, %r10
	.word 0x936f000e  ! 1988: SDIVX_R	sdivx	%r28, %r14, %r9
	.word 0xaa720006  ! 1993: UDIV_R	udiv 	%r8, %r6, %r21
	.word 0x9325e001  ! 1998: MULScc_I	mulscc 	%r23, 0x0001, %r9
	.word 0xb26ec00b  ! 2003: UDIVX_R	udivx 	%r27, %r11, %r25
	.word 0xa64e2001  ! 2008: MULX_I	mulx 	%r24, 0x0001, %r19
	.word 0xbf692001  ! 2013: SDIVX_I	sdivx	%r4, 0x0001, %r31
	.word 0xa8d4400b  ! 2018: UMULcc_R	umulcc 	%r17, %r11, %r20
	.word 0x9a7c801f  ! 2023: SDIV_R	sdiv 	%r18, %r31, %r13
	.word 0x8e69a001  ! 2028: UDIVX_I	udivx 	%r6, 0x0001, %r7
	.word 0xbd6f2001  ! 2033: SDIVX_I	sdivx	%r28, 0x0001, %r30
	.word 0x9a4fa001  ! 2038: MULX_I	mulx 	%r30, 0x0001, %r13
	.word 0xbf27401f  ! 2043: MULScc_R	mulscc 	%r29, %r31, %r31
	.word 0xa16ec014  ! 2048: SDIVX_R	sdivx	%r27, %r20, %r16
	.word 0x8cdc2001  ! 2053: SMULcc_I	smulcc 	%r16, 0x0001, %r6
	.word 0x8efe401e  ! 2058: SDIVcc_R	sdivcc 	%r25, %r30, %r7
	.word 0xac4b6001  ! 2063: MULX_I	mulx 	%r13, 0x0001, %r22
	.word 0x967de001  ! 2068: SDIV_I	sdiv 	%r23, 0x0001, %r11
	.word 0xb56b8007  ! 2073: SDIVX_R	sdivx	%r14, %r7, %r26
	.word 0xa8696001  ! 2078: UDIVX_I	udivx 	%r5, 0x0001, %r20
	.word 0x9f6be001  ! 2083: SDIVX_I	sdivx	%r15, 0x0001, %r15
	.word 0x916b0014  ! 2088: SDIVX_R	sdivx	%r12, %r20, %r8
	.word 0xa0696001  ! 2093: UDIVX_I	udivx 	%r5, 0x0001, %r16
	.word 0xae492001  ! 2098: MULX_I	mulx 	%r4, 0x0001, %r23
	.word 0x886d6001  ! 2103: UDIVX_I	udivx 	%r21, 0x0001, %r4
	.word 0xba77401a  ! 2108: UDIV_R	udiv 	%r29, %r26, %r29
	.word 0x8721c01f  ! 2113: MULScc_R	mulscc 	%r7, %r31, %r3
	.word 0xbc5fe001  ! 2118: SMUL_I	smul 	%r31, 0x0001, %r30
	.word 0xacdf6001  ! 2123: SMULcc_I	smulcc 	%r29, 0x0001, %r22
	.word 0xbefce001  ! 2128: SDIVcc_I	sdivcc 	%r19, 0x0001, %r31
	.word 0xa36e801f  ! 2133: SDIVX_R	sdivx	%r26, %r31, %r17
	.word 0xb852c019  ! 2138: UMUL_R	umul 	%r11, %r25, %r28
	.word 0x8f6f000b  ! 2143: SDIVX_R	sdivx	%r28, %r11, %r7
	.word 0xf6586760  ! 2148: LDX_I	ldx	[%r1 + 0x0760], %r27
	.word 0x926a000e  ! 2153: UDIVX_R	udivx 	%r8, %r14, %r9
	.word 0xb6758007  ! 2158: UDIV_R	udiv 	%r22, %r7, %r27
	.word 0x984c401e  ! 2163: MULX_R	mulx 	%r17, %r30, %r12
	.word 0x896fc01d  ! 2168: SDIVX_R	sdivx	%r31, %r29, %r4
	.word 0x9c4e8012  ! 2173: MULX_R	mulx 	%r26, %r18, %r14
	.word 0x8b69a001  ! 2178: SDIVX_I	sdivx	%r6, 0x0001, %r5
	.word 0xbc6da001  ! 2183: UDIVX_I	udivx 	%r22, 0x0001, %r30
	.word 0x887d000e  ! 2188: SDIV_R	sdiv 	%r20, %r14, %r4
	.word 0xbc4b6001  ! 2193: MULX_I	mulx 	%r13, 0x0001, %r30
	.word 0x8187e001  ! 2198: WRY_I	wr	%r31, 0x0001, %y
	.word 0x984ca001  ! 2203: MULX_I	mulx 	%r18, 0x0001, %r12
	.word 0xa24ec005  ! 2208: MULX_R	mulx 	%r27, %r5, %r17
	.word 0x9968001f  ! 2213: SDIVX_R	sdivx	%r0, %r31, %r12
	.word 0x9a4d6001  ! 2218: MULX_I	mulx 	%r21, 0x0001, %r13
	.word 0xa47fc007  ! 2223: SDIV_R	sdiv 	%r31, %r7, %r18
	.word 0x9f692001  ! 2228: SDIVX_I	sdivx	%r4, 0x0001, %r15
	.word 0x9b6bc01c  ! 2233: SDIVX_R	sdivx	%r15, %r28, %r13
	.word 0xba4d6001  ! 2238: MULX_I	mulx 	%r21, 0x0001, %r29
	.word 0xaa4f6001  ! 2243: MULX_I	mulx 	%r29, 0x0001, %r21
	.word 0x86690000  ! 2248: UDIVX_R	udivx 	%r4, %r0, %r3
	.word 0xa04cc00d  ! 2253: MULX_R	mulx 	%r19, %r13, %r16
	.word 0x887ec008  ! 2258: SDIV_R	sdiv 	%r27, %r8, %r4
	.word 0x9b6fc01f  ! 2263: SDIVX_R	sdivx	%r31, %r31, %r13
	.word 0xa449c00a  ! 2268: MULX_R	mulx 	%r7, %r10, %r18
	.word 0xbef2801a  ! 2273: UDIVcc_R	udivcc 	%r10, %r26, %r31
	.word 0xa2d02001  ! 2278: UMULcc_I	umulcc 	%r0, 0x0001, %r17
	.word 0xbc5d6001  ! 2283: SMUL_I	smul 	%r21, 0x0001, %r30
	.word 0xb24f2001  ! 2288: MULX_I	mulx 	%r28, 0x0001, %r25
	.word 0xb64be001  ! 2293: MULX_I	mulx 	%r15, 0x0001, %r27
	.word 0x9e4e0015  ! 2298: MULX_R	mulx 	%r24, %r21, %r15
	.word 0x924c2001  ! 2303: MULX_I	mulx 	%r16, 0x0001, %r9
	.word 0xb24dc01a  ! 2308: MULX_R	mulx 	%r23, %r26, %r25
	.word 0xbcdc4014  ! 2313: SMULcc_R	smulcc 	%r17, %r20, %r30
	.word 0xd858a5b0  ! 2318: LDX_I	ldx	[%r2 + 0x05b0], %r12
	.word 0x8e6c8011  ! 2323: UDIVX_R	udivx 	%r18, %r17, %r7
	.word 0xb0716001  ! 2328: UDIV_I	udiv 	%r5, 0x0001, %r24
	.word 0xb873c004  ! 2333: UDIV_R	udiv 	%r15, %r4, %r28
	.word 0x9e4a401b  ! 2338: MULX_R	mulx 	%r9, %r27, %r15
	.word 0x94524000  ! 2343: UMUL_R	umul 	%r9, %r0, %r10
	.word 0xaf212001  ! 2348: MULScc_I	mulscc 	%r4, 0x0001, %r23
	.word 0xbed20007  ! 2353: UMULcc_R	umulcc 	%r8, %r7, %r31
	.word 0x8c4c2001  ! 2358: MULX_I	mulx 	%r16, 0x0001, %r6
	.word 0xbe79a001  ! 2363: SDIV_I	sdiv 	%r6, 0x0001, %r31
	.word 0x9327c01c  ! 2368: MULScc_R	mulscc 	%r31, %r28, %r9
	.word 0xbd6b6001  ! 2373: SDIVX_I	sdivx	%r13, 0x0001, %r30
	.word 0x8183a001  ! 2378: WRY_I	wr	%r14, 0x0001, %y
	.word 0x996ec011  ! 2383: SDIVX_R	sdivx	%r27, %r17, %r12
	.word 0xb668c006  ! 2388: UDIVX_R	udivx 	%r3, %r6, %r27
	.word 0xb2f1c01e  ! 2393: UDIVcc_R	udivcc 	%r7, %r30, %r25
	.word 0x98714000  ! 2398: UDIV_R	udiv 	%r5, %r0, %r12
	.word 0x886cc00f  ! 2403: UDIVX_R	udivx 	%r19, %r15, %r4
	.word 0x904ea001  ! 2408: MULX_I	mulx 	%r26, 0x0001, %r8
	.word 0xb44d4013  ! 2413: MULX_R	mulx 	%r21, %r19, %r26
	.word 0x9655800d  ! 2418: UMUL_R	umul 	%r22, %r13, %r11
	.word 0x9b6a6001  ! 2423: SDIVX_I	sdivx	%r9, 0x0001, %r13
	.word 0xa06e8013  ! 2428: UDIVX_R	udivx 	%r26, %r19, %r16
	.word 0x9c6b6001  ! 2433: UDIVX_I	udivx 	%r13, 0x0001, %r14
	.word 0xe25860d0  ! 2438: LDX_I	ldx	[%r1 + 0x00d0], %r17
	.word 0x924d0014  ! 2443: MULX_R	mulx 	%r20, %r20, %r9
	.word 0xa16b401d  ! 2448: SDIVX_R	sdivx	%r13, %r29, %r16
	.word 0x9e6ae001  ! 2453: UDIVX_I	udivx 	%r11, 0x0001, %r15
	.word 0xbc4f4003  ! 2458: MULX_R	mulx 	%r29, %r3, %r30
	.word 0xaa7e0009  ! 2463: SDIV_R	sdiv 	%r24, %r9, %r21
	.word 0x8c552001  ! 2468: UMUL_I	umul 	%r20, 0x0001, %r6
	.word 0x984ba001  ! 2473: MULX_I	mulx 	%r14, 0x0001, %r12
	.word 0xaf6ae001  ! 2478: SDIVX_I	sdivx	%r11, 0x0001, %r23
	.word 0x905da001  ! 2483: SMUL_I	smul 	%r22, 0x0001, %r8
	.word 0xc85863d0  ! 2488: LDX_I	ldx	[%r1 + 0x03d0], %r4
	.word 0xae480019  ! 2493: MULX_R	mulx 	%r0, %r25, %r23
	.word 0x9c758003  ! 2498: UDIV_R	udiv 	%r22, %r3, %r14
	.word 0xa850000b  ! 2503: UMUL_R	umul 	%r0, %r11, %r20
	.word 0xae4c800a  ! 2508: MULX_R	mulx 	%r18, %r10, %r23
	.word 0x976b4007  ! 2513: SDIVX_R	sdivx	%r13, %r7, %r11
	.word 0x866be001  ! 2518: UDIVX_I	udivx 	%r15, 0x0001, %r3
	.word 0xacfb001c  ! 2523: SDIVcc_R	sdivcc 	%r12, %r28, %r22
	.word 0x9f6ee001  ! 2528: SDIVX_I	sdivx	%r27, 0x0001, %r15
	.word 0x8af9a001  ! 2533: SDIVcc_I	sdivcc 	%r6, 0x0001, %r5
	.word 0x9077e001  ! 2538: UDIV_I	udiv 	%r31, 0x0001, %r8
	.word 0xb24de001  ! 2543: MULX_I	mulx 	%r23, 0x0001, %r25
	.word 0xa06b401c  ! 2548: UDIVX_R	udivx 	%r13, %r28, %r16
	.word 0x976c4009  ! 2553: SDIVX_R	sdivx	%r17, %r9, %r11
	.word 0xbafd8004  ! 2558: SDIVcc_R	sdivcc 	%r22, %r4, %r29
	.word 0xbc55801a  ! 2563: UMUL_R	umul 	%r22, %r26, %r30
	.word 0xa4d3c019  ! 2568: UMULcc_R	umulcc 	%r15, %r25, %r18
	.word 0xacfb4005  ! 2573: SDIVcc_R	sdivcc 	%r13, %r5, %r22
	.word 0xb96a6001  ! 2578: SDIVX_I	sdivx	%r9, 0x0001, %r28
	.word 0x947d8005  ! 2583: SDIV_R	sdiv 	%r22, %r5, %r10
	.word 0x8a6b401b  ! 2588: UDIVX_R	udivx 	%r13, %r27, %r5
	.word 0x92d9c010  ! 2593: SMULcc_R	smulcc 	%r7, %r16, %r9
	.word 0xa122400a  ! 2598: MULScc_R	mulscc 	%r9, %r10, %r16
	.word 0x904c8019  ! 2603: MULX_R	mulx 	%r18, %r25, %r8
	.word 0xae49a001  ! 2608: MULX_I	mulx 	%r6, 0x0001, %r23
	.word 0x86732001  ! 2613: UDIV_I	udiv 	%r12, 0x0001, %r3
	.word 0xbe6e401b  ! 2618: UDIVX_R	udivx 	%r25, %r27, %r31
	.word 0xae6d4003  ! 2623: UDIVX_R	udivx 	%r21, %r3, %r23
	.word 0xb16d001a  ! 2628: SDIVX_R	sdivx	%r20, %r26, %r24
	.word 0xae566001  ! 2633: UMUL_I	umul 	%r25, 0x0001, %r23
	.word 0xa36f4017  ! 2638: SDIVX_R	sdivx	%r29, %r23, %r17
	.word 0xbc6c2001  ! 2643: UDIVX_I	udivx 	%r16, 0x0001, %r30
	.word 0xa658c015  ! 2648: SMUL_R	smul 	%r3, %r21, %r19
	.word 0xaefe2001  ! 2653: SDIVcc_I	sdivcc 	%r24, 0x0001, %r23
	.word 0xa16b001a  ! 2658: SDIVX_R	sdivx	%r12, %r26, %r16
	.word 0x95232001  ! 2663: MULScc_I	mulscc 	%r12, 0x0001, %r10
	.word 0xb8f6a001  ! 2668: UDIVcc_I	udivcc 	%r26, 0x0001, %r28
	.word 0x926ac01d  ! 2673: UDIVX_R	udivx 	%r11, %r29, %r9
	.word 0x8c56801c  ! 2678: UMUL_R	umul 	%r26, %r28, %r6
	.word 0x9870e001  ! 2683: UDIV_I	udiv 	%r3, 0x0001, %r12
	.word 0xb877a001  ! 2688: UDIV_I	udiv 	%r30, 0x0001, %r28
	.word 0x9b202001  ! 2693: MULScc_I	mulscc 	%r0, 0x0001, %r13
	.word 0x904ba001  ! 2698: MULX_I	mulx 	%r14, 0x0001, %r8
	.word 0x9a51c017  ! 2703: UMUL_R	umul 	%r7, %r23, %r13
	.word 0x98fe400d  ! 2708: SDIVcc_R	sdivcc 	%r25, %r13, %r12
	.word 0x8d6b4009  ! 2713: SDIVX_R	sdivx	%r13, %r9, %r6
	.word 0x92770012  ! 2718: UDIV_R	udiv 	%r28, %r18, %r9
	.word 0x81812001  ! 2723: WRY_I	wr	%r4, 0x0001, %y
	.word 0x864e001a  ! 2728: MULX_R	mulx 	%r24, %r26, %r3
	.word 0x91212001  ! 2733: MULScc_I	mulscc 	%r4, 0x0001, %r8
	.word 0xaf6bc005  ! 2738: SDIVX_R	sdivx	%r15, %r5, %r23
	.word 0x94498018  ! 2743: MULX_R	mulx 	%r6, %r24, %r10
	.word 0x9a4f401f  ! 2748: MULX_R	mulx 	%r29, %r31, %r13
	.word 0x965b2001  ! 2753: SMUL_I	smul 	%r12, 0x0001, %r11
	.word 0x956c2001  ! 2758: SDIVX_I	sdivx	%r16, 0x0001, %r10
	.word 0x8b6a6001  ! 2763: SDIVX_I	sdivx	%r9, 0x0001, %r5
	.word 0xa76d6001  ! 2768: SDIVX_I	sdivx	%r21, 0x0001, %r19
	.word 0x9078e001  ! 2773: SDIV_I	sdiv 	%r3, 0x0001, %r8
	.word 0x924fa001  ! 2778: MULX_I	mulx 	%r30, 0x0001, %r9
	.word 0x92f44000  ! 2783: UDIVcc_R	udivcc 	%r17, %r0, %r9
	.word 0x956c801c  ! 2788: SDIVX_R	sdivx	%r18, %r28, %r10
	.word 0x9e79c019  ! 2793: SDIV_R	sdiv 	%r7, %r25, %r15
	.word 0xa26ec01c  ! 2798: UDIVX_R	udivx 	%r27, %r28, %r17
	.word 0xb87be001  ! 2803: SDIV_I	sdiv 	%r15, 0x0001, %r28
	.word 0x8180e001  ! 2808: WRY_I	wr	%r3, 0x0001, %y
	.word 0xac4b4000  ! 2813: MULX_R	mulx 	%r13, %r0, %r22
	.word 0x987d4000  ! 2818: SDIV_R	sdiv 	%r21, %r0, %r12
	.word 0xb67d4015  ! 2823: SDIV_R	sdiv 	%r21, %r21, %r27
	.word 0xa96a000f  ! 2828: SDIVX_R	sdivx	%r8, %r15, %r20
	.word 0xa727a001  ! 2833: MULScc_I	mulscc 	%r30, 0x0001, %r19
	.word 0xac764008  ! 2838: UDIV_R	udiv 	%r25, %r8, %r22
	.word 0xa96bc00b  ! 2843: SDIVX_R	sdivx	%r15, %r11, %r20
	.word 0xaf6e000d  ! 2848: SDIVX_R	sdivx	%r24, %r13, %r23
	.word 0x8180e001  ! 2853: WRY_I	wr	%r3, 0x0001, %y
	.word 0x966a6001  ! 2858: UDIVX_I	udivx 	%r9, 0x0001, %r11
	.word 0x8c49e001  ! 2863: MULX_I	mulx 	%r7, 0x0001, %r6
	.word 0x81812001  ! 2868: WRY_I	wr	%r4, 0x0001, %y
	.word 0xd2586540  ! 2873: LDX_I	ldx	[%r1 + 0x0540], %r9
	.word 0x9e4e400e  ! 2878: MULX_R	mulx 	%r25, %r14, %r15
	.word 0xb27f2001  ! 2883: SDIV_I	sdiv 	%r28, 0x0001, %r25
	.word 0xa871e001  ! 2888: UDIV_I	udiv 	%r7, 0x0001, %r20
	.word 0xa653c007  ! 2893: UMUL_R	umul 	%r15, %r7, %r19
	.word 0xb5680010  ! 2898: SDIVX_R	sdivx	%r0, %r16, %r26
	.word 0x965f2001  ! 2903: SMUL_I	smul 	%r28, 0x0001, %r11
	.word 0x81802001  ! 2908: WRY_I	wr	%r0, 0x0001, %y
	.word 0x9a4f6001  ! 2913: MULX_I	mulx 	%r29, 0x0001, %r13
	.word 0x946f6001  ! 2918: UDIVX_I	udivx 	%r29, 0x0001, %r10
	.word 0x9c4a400c  ! 2923: MULX_R	mulx 	%r9, %r12, %r14
	.word 0xa8d2e001  ! 2928: UMULcc_I	umulcc 	%r11, 0x0001, %r20
	.word 0xa26cc00c  ! 2933: UDIVX_R	udivx 	%r19, %r12, %r17
	.word 0xe4586498  ! 2938: LDX_I	ldx	[%r1 + 0x0498], %r18
	.word 0x8a6ec013  ! 2943: UDIVX_R	udivx 	%r27, %r19, %r5
	.word 0xaa6fc01f  ! 2948: UDIVX_R	udivx 	%r31, %r31, %r21
	.word 0x8e6ea001  ! 2953: UDIVX_I	udivx 	%r26, 0x0001, %r7
	.word 0x8871400e  ! 2958: UDIV_R	udiv 	%r5, %r14, %r4
	.word 0xa4d2000b  ! 2963: UMULcc_R	umulcc 	%r8, %r11, %r18
	.word 0x976b4016  ! 2968: SDIVX_R	sdivx	%r13, %r22, %r11
	.word 0xb8d02001  ! 2973: UMULcc_I	umulcc 	%r0, 0x0001, %r28
	.word 0xb669e001  ! 2978: UDIVX_I	udivx 	%r7, 0x0001, %r27
	.word 0x9369400f  ! 2983: SDIVX_R	sdivx	%r5, %r15, %r9
	.word 0xba682001  ! 2988: UDIVX_I	udivx 	%r0, 0x0001, %r29
	.word 0x8182e001  ! 2993: WRY_I	wr	%r11, 0x0001, %y
	.word 0xa84fe001  ! 2998: MULX_I	mulx 	%r31, 0x0001, %r20
	.word 0xa36a6001  ! 3003: SDIVX_I	sdivx	%r9, 0x0001, %r17
	.word 0xb64e0019  ! 3008: MULX_R	mulx 	%r24, %r25, %r27
	.word 0x8c4f6001  ! 3013: MULX_I	mulx 	%r29, 0x0001, %r6
	.word 0x92480014  ! 3018: MULX_R	mulx 	%r0, %r20, %r9
	.word 0x8e5a8018  ! 3023: SMUL_R	smul 	%r10, %r24, %r7
	.word 0x92d5c01a  ! 3028: UMULcc_R	umulcc 	%r23, %r26, %r9
	.word 0x996ac01e  ! 3033: SDIVX_R	sdivx	%r11, %r30, %r12
	.word 0xaf6fc010  ! 3038: SDIVX_R	sdivx	%r31, %r16, %r23
	.word 0xae4c4003  ! 3043: MULX_R	mulx 	%r17, %r3, %r23
	.word 0xb04d6001  ! 3048: MULX_I	mulx 	%r21, 0x0001, %r24
	.word 0x8182e001  ! 3053: WRY_I	wr	%r11, 0x0001, %y
	.word 0xb26b8015  ! 3058: UDIVX_R	udivx 	%r14, %r21, %r25
	.word 0xa924c000  ! 3063: MULScc_R	mulscc 	%r19, %r0, %r20
	.word 0x8f6e801d  ! 3068: SDIVX_R	sdivx	%r26, %r29, %r7
	.word 0x9452e001  ! 3073: UMUL_I	umul 	%r11, 0x0001, %r10
	.word 0xbf68e001  ! 3078: SDIVX_I	sdivx	%r3, 0x0001, %r31
	.word 0x81802001  ! 3083: WRY_I	wr	%r0, 0x0001, %y
	.word 0x924a4017  ! 3088: MULX_R	mulx 	%r9, %r23, %r9
	.word 0xb9252001  ! 3093: MULScc_I	mulscc 	%r20, 0x0001, %r28
	.word 0xe658a798  ! 3098: LDX_I	ldx	[%r2 + 0x0798], %r19
	.word 0xac4a8000  ! 3103: MULX_R	mulx 	%r10, %r0, %r22
	.word 0x9e490004  ! 3108: MULX_R	mulx 	%r4, %r4, %r15
	.word 0x8f248017  ! 3113: MULScc_R	mulscc 	%r18, %r23, %r7
	.word 0xe25866d0  ! 3118: LDX_I	ldx	[%r1 + 0x06d0], %r17
	.word 0xa27f6001  ! 3123: SDIV_I	sdiv 	%r29, 0x0001, %r17
	.word 0xb64e6001  ! 3128: MULX_I	mulx 	%r25, 0x0001, %r27
	.word 0xa46d6001  ! 3133: UDIVX_I	udivx 	%r21, 0x0001, %r18
	.word 0xb47fa001  ! 3138: SDIV_I	sdiv 	%r30, 0x0001, %r26
	.word 0x926a0007  ! 3143: UDIVX_R	udivx 	%r8, %r7, %r9
	.word 0xba4cc00a  ! 3148: MULX_R	mulx 	%r19, %r10, %r29
	.word 0x8ef22001  ! 3153: UDIVcc_I	udivcc 	%r8, 0x0001, %r7
	.word 0xbc49c014  ! 3158: MULX_R	mulx 	%r7, %r20, %r30
	.word 0xc8586668  ! 3163: LDX_I	ldx	[%r1 + 0x0668], %r4
	.word 0xa46cc01b  ! 3168: UDIVX_R	udivx 	%r19, %r27, %r18
	.word 0xbad54013  ! 3173: UMULcc_R	umulcc 	%r21, %r19, %r29
	.word 0xb3228007  ! 3178: MULScc_R	mulscc 	%r10, %r7, %r25
	.word 0x8ad3c00e  ! 3183: UMULcc_R	umulcc 	%r15, %r14, %r5
	.word 0x9cf6801f  ! 3188: UDIVcc_R	udivcc 	%r26, %r31, %r14
	.word 0xb16c4018  ! 3193: SDIVX_R	sdivx	%r17, %r24, %r24
	.word 0xb4492001  ! 3198: MULX_I	mulx 	%r4, 0x0001, %r26
	.word 0x9ad34013  ! 3203: UMULcc_R	umulcc 	%r13, %r19, %r13
	.word 0x936f8006  ! 3208: SDIVX_R	sdivx	%r30, %r6, %r9
	.word 0x8e482001  ! 3213: MULX_I	mulx 	%r0, 0x0001, %r7
	.word 0x924b0011  ! 3218: MULX_R	mulx 	%r12, %r17, %r9
	.word 0xbb6ba001  ! 3223: SDIVX_I	sdivx	%r14, 0x0001, %r29
	.word 0xb8dcc007  ! 3228: SMULcc_R	smulcc 	%r19, %r7, %r28
	.word 0x9d6e0016  ! 3233: SDIVX_R	sdivx	%r24, %r22, %r14
	.word 0x88f26001  ! 3238: UDIVcc_I	udivcc 	%r9, 0x0001, %r4
	.word 0xb16ac017  ! 3243: SDIVX_R	sdivx	%r11, %r23, %r24
	.word 0x8180e001  ! 3248: WRY_I	wr	%r3, 0x0001, %y
	.word 0x91690004  ! 3253: SDIVX_R	sdivx	%r4, %r4, %r8
	.word 0xf6586370  ! 3258: LDX_I	ldx	[%r1 + 0x0370], %r27
	.word 0x9e482001  ! 3263: MULX_I	mulx 	%r0, 0x0001, %r15
	.word 0xbc6b400a  ! 3268: UDIVX_R	udivx 	%r13, %r10, %r30
	.word 0xa66f400a  ! 3273: UDIVX_R	udivx 	%r29, %r10, %r19
	.word 0x8182e001  ! 3278: WRY_I	wr	%r11, 0x0001, %y
	.word 0x924e800e  ! 3283: MULX_R	mulx 	%r26, %r14, %r9
	.word 0xa25ac004  ! 3288: SMUL_R	smul 	%r11, %r4, %r17
	.word 0xbc554014  ! 3293: UMUL_R	umul 	%r21, %r20, %r30
	.word 0x9a6ac017  ! 3298: UDIVX_R	udivx 	%r11, %r23, %r13
	.word 0x8186a001  ! 3303: WRY_I	wr	%r26, 0x0001, %y
	.word 0x98d0c007  ! 3308: UMULcc_R	umulcc 	%r3, %r7, %r12
	.word 0x9456a001  ! 3313: UMUL_I	umul 	%r26, 0x0001, %r10
	.word 0x8e4a2001  ! 3318: MULX_I	mulx 	%r8, 0x0001, %r7
	.word 0xa523001a  ! 3323: MULScc_R	mulscc 	%r12, %r26, %r18
	.word 0x9e498014  ! 3328: MULX_R	mulx 	%r6, %r20, %r15
	.word 0xb84de001  ! 3333: MULX_I	mulx 	%r23, 0x0001, %r28
	.word 0xba6ac007  ! 3338: UDIVX_R	udivx 	%r11, %r7, %r29
	.word 0x976a8007  ! 3343: SDIVX_R	sdivx	%r10, %r7, %r11
	.word 0x886c8003  ! 3348: UDIVX_R	udivx 	%r18, %r3, %r4
	.word 0x9126a001  ! 3353: MULScc_I	mulscc 	%r26, 0x0001, %r8
	.word 0xa47ac01c  ! 3358: SDIV_R	sdiv 	%r11, %r28, %r18
	.word 0x866a2001  ! 3363: UDIVX_I	udivx 	%r8, 0x0001, %r3
	.word 0xa657a001  ! 3368: UMUL_I	umul 	%r30, 0x0001, %r19
	.word 0x9d6fa001  ! 3373: SDIVX_I	sdivx	%r30, 0x0001, %r14
	.word 0xfe586438  ! 3378: LDX_I	ldx	[%r1 + 0x0438], %r31
	.word 0x86d0e001  ! 3383: UMULcc_I	umulcc 	%r3, 0x0001, %r3
	.word 0xa06ea001  ! 3388: UDIVX_I	udivx 	%r26, 0x0001, %r16
	.word 0xb05f401d  ! 3393: SMUL_R	smul 	%r29, %r29, %r24
	.word 0xa84be001  ! 3398: MULX_I	mulx 	%r15, 0x0001, %r20
	.word 0x90fca001  ! 3403: SDIVcc_I	sdivcc 	%r18, 0x0001, %r8
	.word 0x8a4e6001  ! 3408: MULX_I	mulx 	%r25, 0x0001, %r5
	.word 0x864ee001  ! 3413: MULX_I	mulx 	%r27, 0x0001, %r3
	.word 0xb0f6a001  ! 3418: UDIVcc_I	udivcc 	%r26, 0x0001, %r24
	.word 0x896b0004  ! 3423: SDIVX_R	sdivx	%r12, %r4, %r4
	.word 0xbc4ca001  ! 3428: MULX_I	mulx 	%r18, 0x0001, %r30
	.word 0x8a522001  ! 3433: UMUL_I	umul 	%r8, 0x0001, %r5
	.word 0x98dde001  ! 3438: SMULcc_I	smulcc 	%r23, 0x0001, %r12
	.word 0xaf6ba001  ! 3443: SDIVX_I	sdivx	%r14, 0x0001, %r23
	.word 0xaaf9a001  ! 3448: SDIVcc_I	sdivcc 	%r6, 0x0001, %r21
	.word 0xa44a8007  ! 3453: MULX_R	mulx 	%r10, %r7, %r18
	.word 0x8180e001  ! 3458: WRY_I	wr	%r3, 0x0001, %y
	.word 0x86566001  ! 3463: UMUL_I	umul 	%r25, 0x0001, %r3
	.word 0x8a6fa001  ! 3468: UDIVX_I	udivx 	%r30, 0x0001, %r5
	.word 0x94492001  ! 3473: MULX_I	mulx 	%r4, 0x0001, %r10
	.word 0xbaf96001  ! 3478: SDIVcc_I	sdivcc 	%r5, 0x0001, %r29
	.word 0xb04f2001  ! 3483: MULX_I	mulx 	%r28, 0x0001, %r24
	.word 0x996d4009  ! 3488: SDIVX_R	sdivx	%r21, %r9, %r12
	.word 0xb36ae001  ! 3493: SDIVX_I	sdivx	%r11, 0x0001, %r25
	.word 0xaa68c019  ! 3498: UDIVX_R	udivx 	%r3, %r25, %r21
	.word 0xb46ec01b  ! 3503: UDIVX_R	udivx 	%r27, %r27, %r26
	.word 0x964f000c  ! 3508: MULX_R	mulx 	%r28, %r12, %r11
	.word 0x867b6001  ! 3513: SDIV_I	sdiv 	%r13, 0x0001, %r3
	.word 0x8f6b8019  ! 3518: SDIVX_R	sdivx	%r14, %r25, %r7
	.word 0xa76d4017  ! 3523: SDIVX_R	sdivx	%r21, %r23, %r19
	.word 0xbc5a401e  ! 3528: SMUL_R	smul 	%r9, %r30, %r30
	.word 0xa473001f  ! 3533: UDIV_R	udiv 	%r12, %r31, %r18
	.word 0xa2f7400d  ! 3538: UDIVcc_R	udivcc 	%r29, %r13, %r17
	.word 0x8185a001  ! 3543: WRY_I	wr	%r22, 0x0001, %y
	.word 0x926f2001  ! 3548: UDIVX_I	udivx 	%r28, 0x0001, %r9
	.word 0x92f28018  ! 3553: UDIVcc_R	udivcc 	%r10, %r24, %r9
	.word 0xa4f42001  ! 3558: UDIVcc_I	udivcc 	%r16, 0x0001, %r18
	.word 0x9b68001a  ! 3563: SDIVX_R	sdivx	%r0, %r26, %r13
	.word 0xde58a1f8  ! 3568: LDX_I	ldx	[%r2 + 0x01f8], %r15
	.word 0xb84f4018  ! 3573: MULX_R	mulx 	%r29, %r24, %r28
	.word 0xb86d2001  ! 3578: UDIVX_I	udivx 	%r20, 0x0001, %r28
	.word 0xb068000d  ! 3583: UDIVX_R	udivx 	%r0, %r13, %r24
	.word 0xae4c2001  ! 3588: MULX_I	mulx 	%r16, 0x0001, %r23
	.word 0x944e6001  ! 3593: MULX_I	mulx 	%r25, 0x0001, %r10
	.word 0xa8fb2001  ! 3598: SDIVcc_I	sdivcc 	%r12, 0x0001, %r20
	.word 0xa85f4005  ! 3603: SMUL_R	smul 	%r29, %r5, %r20
	.word 0x9e72a001  ! 3608: UDIV_I	udiv 	%r10, 0x0001, %r15
	.word 0xbb6e001b  ! 3613: SDIVX_R	sdivx	%r24, %r27, %r29
	.word 0x924be001  ! 3618: MULX_I	mulx 	%r15, 0x0001, %r9
	.word 0x8e79400f  ! 3623: SDIV_R	sdiv 	%r5, %r15, %r7
	.word 0xaa7bc01e  ! 3628: SDIV_R	sdiv 	%r15, %r30, %r21
	.word 0x90682001  ! 3633: UDIVX_I	udivx 	%r0, 0x0001, %r8
	.word 0x8b69c00a  ! 3638: SDIVX_R	sdivx	%r7, %r10, %r5
	.word 0xbc4c400a  ! 3643: MULX_R	mulx 	%r17, %r10, %r30
	.word 0x9d6a001c  ! 3648: SDIVX_R	sdivx	%r8, %r28, %r14
	.word 0xa8d38009  ! 3653: UMULcc_R	umulcc 	%r14, %r9, %r20
	.word 0xa6494005  ! 3658: MULX_R	mulx 	%r5, %r5, %r19
	.word 0xbb698000  ! 3663: SDIVX_R	sdivx	%r6, %r0, %r29
	.word 0xac6fe001  ! 3668: UDIVX_I	udivx 	%r31, 0x0001, %r22
	.word 0x926ac00a  ! 3673: UDIVX_R	udivx 	%r11, %r10, %r9
	.word 0xaa6c2001  ! 3678: UDIVX_I	udivx 	%r16, 0x0001, %r21
	.word 0xa8514017  ! 3683: UMUL_R	umul 	%r5, %r23, %r20
	.word 0x9a740007  ! 3688: UDIV_R	udiv 	%r16, %r7, %r13
	.word 0xb923400d  ! 3693: MULScc_R	mulscc 	%r13, %r13, %r28
	.word 0xa2d3401a  ! 3698: UMULcc_R	umulcc 	%r13, %r26, %r17
	.word 0xaa68000c  ! 3703: UDIVX_R	udivx 	%r0, %r12, %r21
	.word 0x8e6ee001  ! 3708: UDIVX_I	udivx 	%r27, 0x0001, %r7
	.word 0xa868e001  ! 3713: UDIVX_I	udivx 	%r3, 0x0001, %r20
	.word 0x9871c01b  ! 3718: UDIV_R	udiv 	%r7, %r27, %r12
	.word 0xa76f0018  ! 3723: SDIVX_R	sdivx	%r28, %r24, %r19
	.word 0x9c492001  ! 3728: MULX_I	mulx 	%r4, 0x0001, %r14
	.word 0xbe7be001  ! 3733: SDIV_I	sdiv 	%r15, 0x0001, %r31
	.word 0xb96c8018  ! 3738: SDIVX_R	sdivx	%r18, %r24, %r28
	.word 0xa4d70008  ! 3743: UMULcc_R	umulcc 	%r28, %r8, %r18
	.word 0xb96e0000  ! 3748: SDIVX_R	sdivx	%r24, %r0, %r28
	.word 0x90f02001  ! 3753: UDIVcc_I	udivcc 	%r0, 0x0001, %r8
	.word 0x92782001  ! 3758: SDIV_I	sdiv 	%r0, 0x0001, %r9
	.word 0x9e6dc00c  ! 3763: UDIVX_R	udivx 	%r23, %r12, %r15
	.word 0xb36b4018  ! 3768: SDIVX_R	sdivx	%r13, %r24, %r25
	.word 0xb76f8004  ! 3773: SDIVX_R	sdivx	%r30, %r4, %r27
	.word 0xb84a801a  ! 3778: MULX_R	mulx 	%r10, %r26, %r28
	.word 0xad6aa001  ! 3783: SDIVX_I	sdivx	%r10, 0x0001, %r22
	.word 0x967ac01c  ! 3788: SDIV_R	sdiv 	%r11, %r28, %r11
	.word 0xb324c013  ! 3793: MULScc_R	mulscc 	%r19, %r19, %r25
	.word 0xbb6f2001  ! 3798: SDIVX_I	sdivx	%r28, 0x0001, %r29
	.word 0x9d6d8011  ! 3803: SDIVX_R	sdivx	%r22, %r17, %r14
	.word 0x8c6c6001  ! 3808: UDIVX_I	udivx 	%r17, 0x0001, %r6
	.word 0xaf6ec006  ! 3813: SDIVX_R	sdivx	%r27, %r6, %r23
	.word 0x956d2001  ! 3818: SDIVX_I	sdivx	%r20, 0x0001, %r10
	.word 0xe858a038  ! 3823: LDX_I	ldx	[%r2 + 0x0038], %r20
	.word 0xbaf2c00d  ! 3828: UDIVcc_R	udivcc 	%r11, %r13, %r29
	.word 0x8efae001  ! 3833: SDIVcc_I	sdivcc 	%r11, 0x0001, %r7
	.word 0x936d8017  ! 3838: SDIVX_R	sdivx	%r22, %r23, %r9
	.word 0x8c4fc011  ! 3843: MULX_R	mulx 	%r31, %r17, %r6
	.word 0xb56f6001  ! 3848: SDIVX_I	sdivx	%r29, 0x0001, %r26
	.word 0xa36e4014  ! 3853: SDIVX_R	sdivx	%r25, %r20, %r17
	.word 0x864a401c  ! 3858: MULX_R	mulx 	%r9, %r28, %r3
	.word 0xb854a001  ! 3863: UMUL_I	umul 	%r18, 0x0001, %r28
	.word 0x9a7d400c  ! 3868: SDIV_R	sdiv 	%r21, %r12, %r13
	.word 0xbc52c01e  ! 3873: UMUL_R	umul 	%r11, %r30, %r30
	.word 0xb84da001  ! 3878: MULX_I	mulx 	%r22, 0x0001, %r28
	.word 0xa24a401c  ! 3883: MULX_R	mulx 	%r9, %r28, %r17
	.word 0xaa5c8012  ! 3888: SMUL_R	smul 	%r18, %r18, %r21
	.word 0xa6682001  ! 3893: UDIVX_I	udivx 	%r0, 0x0001, %r19
	.word 0xbc6e4009  ! 3898: UDIVX_R	udivx 	%r25, %r9, %r30
	.word 0xa4f78015  ! 3903: UDIVcc_R	udivcc 	%r30, %r21, %r18
	.word 0x9c792001  ! 3908: SDIV_I	sdiv 	%r4, 0x0001, %r14
	.word 0x8f6c0014  ! 3913: SDIVX_R	sdivx	%r16, %r20, %r7
	.word 0xa04e6001  ! 3918: MULX_I	mulx 	%r25, 0x0001, %r16
	.word 0xaa6d800b  ! 3923: UDIVX_R	udivx 	%r22, %r11, %r21
	.word 0xa96b8019  ! 3928: SDIVX_R	sdivx	%r14, %r25, %r20
	.word 0xb2f9401f  ! 3933: SDIVcc_R	sdivcc 	%r5, %r31, %r25
	.word 0x9c4de001  ! 3938: MULX_I	mulx 	%r23, 0x0001, %r14
	.word 0x94fe2001  ! 3943: SDIVcc_I	sdivcc 	%r24, 0x0001, %r10
	.word 0xbe714011  ! 3948: UDIV_R	udiv 	%r5, %r17, %r31
	.word 0xae4f2001  ! 3953: MULX_I	mulx 	%r28, 0x0001, %r23
	.word 0x8e5d001b  ! 3958: SMUL_R	smul 	%r20, %r27, %r7
	.word 0x8d6dc009  ! 3963: SDIVX_R	sdivx	%r23, %r9, %r6
	.word 0x8a682001  ! 3968: UDIVX_I	udivx 	%r0, 0x0001, %r5
	.word 0x90dfc009  ! 3973: SMULcc_R	smulcc 	%r31, %r9, %r8
	.word 0x96682001  ! 3978: UDIVX_I	udivx 	%r0, 0x0001, %r11
	.word 0xb4770000  ! 3983: UDIV_R	udiv 	%r28, %r0, %r26
	.word 0xaa6b001e  ! 3988: UDIVX_R	udivx 	%r12, %r30, %r21
	.word 0xb8f38012  ! 3993: UDIVcc_R	udivcc 	%r14, %r18, %r28
.data
.align	256
t2_data64_start_0:
	.xword	0xc444443d6851a959
	.xword	0x8e80b53bbca554d4
	.xword	0xfb0128f7b8e5f4fa
	.xword	0x5a24a603c69ff58b
	.xword	0xcc93ec3f5e437c21
	.xword	0xb116197e3d379e3f
	.xword	0x475e1733cf9786c6
	.xword	0x0b62f6946209b2ac
	.xword	0x97b9bbbe51ef0bb9
	.xword	0xaf882c877b2b67a3
	.xword	0xc8acc5af71916a91
	.xword	0x6e194eb7853220c8
	.xword	0xa308ec03055c8e58
	.xword	0x58a95f3e17ccf30e
	.xword	0x3f150646420bc6f9
	.xword	0xd25d20790f4398b2
	.xword	0xb3d44372002d0844
	.xword	0x5342580e43912f60
	.xword	0x1b0e4aba3cad0238
	.xword	0xb8f6459c254def23
	.xword	0x93968e63cbe29d84
	.xword	0x2ab36dd23c2289ef
	.xword	0xe4a3b167ecd6cc95
	.xword	0x5cd261e6af34839f
	.xword	0xfec5a9fd0469993a
	.xword	0x915bac1e3ebdd362
	.xword	0x0e1c2751e90669ff
	.xword	0xa8c63b047c86d15a
	.xword	0x8339f1f4a2b17d82
	.xword	0xf4c57d87ae5481f0
	.xword	0x055ed931313a14e8
	.xword	0xb452ca3615f6e6f4
	.xword	0xb3d87215159a3ad1
	.xword	0xde5f056f5a70e7f0
	.xword	0x80a6719ca7975e4f
	.xword	0x3289f5739885071a
	.xword	0x61569f86371a0c6a
	.xword	0x14e716b5ae5bfd77
	.xword	0x6ca87b9dd84f6330
	.xword	0x1ff8ecdbd9e9419d
	.xword	0x7f6aa2a2f967738f
	.xword	0xbd33ee38b7a0b1fd
	.xword	0xf90b611b72df5589
	.xword	0xd90ccd33aca9765e
	.xword	0x477bd13d8744ebcb
	.xword	0x268b74b24be00dd6
	.xword	0xd43816eae20a273e
	.xword	0x4dd88e4723f2b70d
	.xword	0x162a3d8bb5302c29
	.xword	0x5ef51a93218a8949
	.xword	0xbfea4df804de7f38
	.xword	0xd7bf2052a4e78d40
	.xword	0x27ea93a907df4edd
	.xword	0x31e896cd04e57c5d
	.xword	0x3693352dbdbcf294
	.xword	0x7da073ccd87b73e9
	.xword	0x3ed06ca9da6ce7af
	.xword	0xeb69d46946938029
	.xword	0x808243c276d7bbd6
	.xword	0x1be024f62403dfb5
	.xword	0xd39c1ea74fc70e99
	.xword	0x3b1869a156a08986
	.xword	0x591e4306b83506ae
	.xword	0xf76f29200809cc42
	.xword	0x5dae000ec3fa00f5
	.xword	0xc74f1ece4153f986
	.xword	0x58461bf5c3d48af6
	.xword	0x0204f4b964e9200e
	.xword	0x340c21bcb11189d8
	.xword	0x669e6e3c4a214a6b
	.xword	0x523c1605e19d00b3
	.xword	0x20c700d2ba830535
	.xword	0x4badd6e5852ca309
	.xword	0x6a42168e87a2ee4d
	.xword	0xd759d8598b2f1482
	.xword	0x6a965f4aa838b208
	.xword	0x23da9112118edc99
	.xword	0x2a7a01fa2d375bc0
	.xword	0xba611740e5d56abc
	.xword	0x48aeeda6185d5e7e
	.xword	0x1d9c52c7a468ae60
	.xword	0xac656352b3e2f791
	.xword	0xc57c9104a44bdfaa
	.xword	0x466d4fd2196c6ead
	.xword	0x8abc270d7836357c
	.xword	0x54640f7bd21a2db2
	.xword	0x69af5a8978192979
	.xword	0x87b165bc18c3f9aa
	.xword	0xe383bc41744749bd
	.xword	0x026e992615b4d636
	.xword	0xb04ef25084306dfb
	.xword	0x25f8d7e2f097bd85
	.xword	0xae64ce78d2327be3
	.xword	0x5a9c07b0c3f0b2b7
	.xword	0xab1503617305843e
	.xword	0x52024bed8a567d64
	.xword	0xeda2a44c29793ae9
	.xword	0x0fd87b423638b0d4
	.xword	0xd794edbbb0e0acbe
	.xword	0xeb452be1fbdcaf07
	.xword	0x6df87ebec67da6e7
	.xword	0x190ed84514177d81
	.xword	0x96b4f766692b3af0
	.xword	0xed53bfe2f5c7e18d
	.xword	0x887411e49682ddf5
	.xword	0x17cac88f8c9c6a4c
	.xword	0xfd50d59a09c80531
	.xword	0xd9f6890315a28496
	.xword	0x693e23f011756f00
	.xword	0x0abd14e1722af14c
	.xword	0x07b303e51e9e7a0c
	.xword	0x9146be12494237a2
	.xword	0x4a0de1a0a028ecac
	.xword	0x136ec9f7780d03a4
	.xword	0x5c7de8a52ec8e5d0
	.xword	0x466300fce16bcd0f
	.xword	0xd87b9cc7ccdaf553
	.xword	0x7a82358dd0e16ac6
	.xword	0x708bbacc6f48f83e
	.xword	0xcc6260f3ce1cf512
	.xword	0xefa53d2e0ca2b531
	.xword	0xc6c39b9cff18fd74
	.xword	0x993c233039b03944
	.xword	0xbcb81f2211bcae82
	.xword	0xbc8d318b2cde6bc6
	.xword	0xf0275f178c989b96
	.xword	0x6b9738d2b58312c1
	.xword	0x9f42321718d68965
	.xword	0xd8f5c5e22e13c986
	.xword	0x893d839498bda29b
	.xword	0x52ec7fac78ebeb6f
	.xword	0x5838d1b105c6f4c3
	.xword	0x251de90fb1232aa7
	.xword	0x04955d50d6f332be
	.xword	0xd355c38df3f7a7f4
	.xword	0xd5642c9f03568c2e
	.xword	0x660bb9109cd85c68
	.xword	0x3a8efe790fe66e02
	.xword	0x3ce166d0c1a5babe
	.xword	0x39e7311c5c96351b
	.xword	0xd62a394d963ca272
	.xword	0x76cda2974e23f7e9
	.xword	0xf3283f293e9f092d
	.xword	0xd78f79a9b9a819de
	.xword	0x343ba2438c44625d
	.xword	0x7ea0ed0906727f84
	.xword	0x6aa070899c065ac7
	.xword	0x00495ad6dded7ec5
	.xword	0x4d09f106e3d7e68c
	.xword	0x98cb0a1b8d5ae945
	.xword	0xcee72bb8b9755a25
	.xword	0xac85349b236e0e6f
	.xword	0xee2b0f2cc71bd16e
	.xword	0xdef4ca1c35254de2
	.xword	0x349d82073d1902e4
	.xword	0x0bc4ae70c013f336
	.xword	0x9aebc72326534e0f
	.xword	0x41d07ffcf4e3195a
	.xword	0x81c74a4aade5672a
	.xword	0xad94491e49b11049
	.xword	0xaf1817fe409eee0d
	.xword	0xb1cddc8e338b9076
	.xword	0x1c61df95e322366e
	.xword	0xb6d4da148aa055de
	.xword	0xb94990238870308a
	.xword	0xd206532217ed8132
	.xword	0x83345262f0ca51bf
	.xword	0x3be7acb640141565
	.xword	0x0da018fb4e622994
	.xword	0x412389e30ae3c6d7
	.xword	0xec80bff8052cf2e1
	.xword	0xbc09669e0a4edc0c
	.xword	0xf78a692890162348
	.xword	0x01f646297f84a62b
	.xword	0x7ff1e7ed496182f3
	.xword	0x87eb40149c0f000e
	.xword	0x3f2aa834a5034743
	.xword	0xb283c6462a2818a1
	.xword	0x7d35d2763e2ca246
	.xword	0x1e0bc817d7f0ce0d
	.xword	0x70d5acab599b8b50
	.xword	0xedc90f5b6a513ee6
	.xword	0x4edc8ab1f88dcaeb
	.xword	0x06a102914cbeb041
	.xword	0x99d54344d1583133
	.xword	0xc63a81b89b227181
	.xword	0xa6867eefae2f2257
	.xword	0xce65149fe3c1eef2
	.xword	0x786e37ec91c60003
	.xword	0x7dc8cbfc00efb6dc
	.xword	0x455c9e85c2b60267
	.xword	0x6fcbf03c12e91dd3
	.xword	0x71a5ae353ace150b
	.xword	0x11617b765c1d9680
	.xword	0x1da447574efa9877
	.xword	0xa43119fdafd0b006
	.xword	0x0da0e58427558e77
	.xword	0x6f1d3dc56d98977d
	.xword	0xa296297e6427591b
	.xword	0x1d714ddc0223c4f7
	.xword	0x9e1f4a9250ac78f3
	.xword	0xc76448a261345df7
	.xword	0x31ad0871113d5bb7
	.xword	0x5bf0217a6ccb184e
	.xword	0xf585e28f497a8e49
	.xword	0x849690f50036b6c1
	.xword	0x3507b7d63672d2ad
	.xword	0x4299088b383de197
	.xword	0xd02af27b8d620fd5
	.xword	0x1162d692d2fcb742
	.xword	0xe184e7e091301c9a
	.xword	0x16beeb1f62ddbcff
	.xword	0x5341566e43f32180
	.xword	0x8b3c3f308d0d1108
	.xword	0xea2c134026dee5ad
	.xword	0xa3ff001d504b75f5
	.xword	0x6b338233e7a14a4d
	.xword	0x3ca650be4183d448
	.xword	0xf369eef1f912aa97
	.xword	0xf0b0d7c802498465
	.xword	0x5766e528adedbd97
	.xword	0x6e7ec1c0399e6957
	.xword	0x3eb10ce517e5f785
	.xword	0xb38fcc29a9f17171
	.xword	0xb4f9b54cd2488766
	.xword	0x86dbf048541c88d2
	.xword	0x5c10c24eb56bb13d
	.xword	0x9b856fe5adb9872e
	.xword	0x99f9ba937609d79a
	.xword	0x60071c9433ea0e23
	.xword	0xccfcd0e088694ee2
	.xword	0xc3b6dcace5184222
	.xword	0x2bc25b5262f2f67f
	.xword	0x80d081004176ab16
	.xword	0xb4909834c1876c68
	.xword	0x3ac9f1d8e90173d5
	.xword	0x1fc0d209279652d3
	.xword	0xbe90953635fae4fe
	.xword	0x41e85f6c4c691c16
	.xword	0xc6518fa006977465
	.xword	0xeb398e60485a9f02
	.xword	0x393c3320d17c3e68
	.xword	0xd5dbf5e09c2b6a31
	.xword	0x5090f8ed861e4fa2
	.xword	0x66d2c9f20b23cb98
	.xword	0x1536cb2e4ee48ee2
	.xword	0xa207d54b5a1a4e76
	.xword	0x302b2cdc873473d8
	.xword	0x0ea77100cb52cabc
	.xword	0x9f9247db6737a803
	.xword	0x821c499fcfe06ed4
	.xword	0x96b260dce0dd212d
	.xword	0x588cc345e47d44c4
	.xword	0x0ed6be43548b3cb8
	.xword	0x7e0f9314d5f366c2
	.xword	0x82df1c04d6f4cffa
	.xword	0xec80345a9f11aa86
	.xword	0x5445ff04b2b98ed4
	.xword	0x0ef4b4bb3666d0f5
	.xword	0x8358c76d30411eb3
	.xword	0x96b95b89cc552ed1
	.xword	0x14220526bb994373
	.xword	0x127de442e255b837
	.xword	0x1c60c3f8544fcdbe
	.xword	0xb4df05dceb17ce9f
	.xword	0x88955caa90303b21
	.xword	0x564c646af7abdd16
	.xword	0x723ba04134fbca16
	.xword	0x858376319fb65bf7
	.xword	0xa884adc7fc5b4505
	.xword	0xd55aaf04d2aa9150
	.xword	0xcb7c7a1c0c3b4595
	.xword	0xa051398863cb5d78
	.xword	0x12a6c70c47f419e3
	.xword	0x05f3ba441e799174
	.xword	0x26656e660d2f161e
	.xword	0xfa0f9a9310ec8813
	.xword	0x998f8f632dfae092
	.xword	0x4991b15534061ec3
	.xword	0x63e790981ef532a7
	.xword	0x27116bb763829ee9
	.xword	0xbe4ebf9b5a8ffff1
	.xword	0x77f503791301f47d
	.xword	0xfc864644a0347637
	.xword	0x24aae914ee918dd7
	.xword	0x46e220191b5798a1
	.xword	0x92fbb6a3ff4f29fe
	.xword	0x9c59ec2044cc4e8c
	.xword	0x7cada01b5dc530ad
	.xword	0x3511faac8875195d
	.xword	0x9c18706501f7a15e
	.xword	0xfb143e87bdf1d1da
	.xword	0x549d3dfc63a6853e
	.xword	0x4dceb0e803a9a69f
	.xword	0x2f6cd2cabe29d652
	.xword	0x62d5f84deda22c53
	.xword	0x9dd6b5759f032bc1
	.xword	0x0f371a144c64da0d
	.xword	0xe6887c88091431cd
	.xword	0xc1c5fb9c12a3aa68
	.xword	0x8701e70d6467d80a
	.xword	0x6456d1cd110ae83c
	.xword	0x3f58c5b68b8a95b5
	.xword	0xe64842ef1744643b
	.xword	0xfdb715d5b23b6161
	.xword	0x50b142988552879f
	.xword	0x5f9bc4627a8865f5
	.xword	0x98df95476feea941
	.xword	0x51f95b6fea776103
	.xword	0x42b74e55c0e93b00
	.xword	0x89de3e18b6930d84
	.xword	0x9ed203f86af10fb7
	.xword	0xf02d01bc30dd305a
	.xword	0x2485c19e0d3daf18
	.xword	0x16db2f3bf342e224
	.xword	0xc1da16faa3ba7f14
	.xword	0x17a85fcc40baf778
	.xword	0x0e03b8e948c39ce6
	.xword	0xac2cfdc916402da3
	.xword	0xd47fe2996994e9f4
	.xword	0x6e3740200a725019
	.xword	0xe5e4efcff4d4dde3
	.xword	0x34628c53ce01c4e7
	.xword	0x8dd4270924374946
	.xword	0x94382f4c581d5052
	.xword	0xed2801d5bbf8292a
	.xword	0xb3748f850ea73038
	.xword	0x231025f10c2d3697
	.xword	0x77b6ce3c0bea810c
	.xword	0x72b21ec1d94e79da
	.xword	0xbbfd6c53a18f580b
	.xword	0x2af38716d1dee123
	.xword	0x9d777c4811560b44
	.xword	0xa8fb36fa8bbf579a
	.xword	0x853cfb04d288a53f
	.xword	0x910605e7b412ae82
	.xword	0x5074f13c7032b196
	.xword	0x8dedf1de64ff14aa
	.xword	0xf2a6d50c87584d3d
	.xword	0x91709e20547156b8
	.xword	0x7d38a387f535b642
	.xword	0x313912d83396fca7
	.xword	0xca5d42dfa1000898
	.xword	0x6a88b4f9233e8b76
	.xword	0x656ce84848715baa
	.xword	0x6f4913822404273d
	.xword	0x10af6db47571916b
	.xword	0xdf64d5eb2b024783
	.xword	0x0498e30988d53e4d
	.xword	0xb50160eb9c67d486
	.xword	0x14cb44f0292a08c8
	.xword	0x85061250603f95ad
	.xword	0x97e230f4cdc0bfc3
	.xword	0xbfa3bb1b2d32a1ad
	.xword	0x13e715d1f91276d5
	.xword	0x246935220331d9bf
	.xword	0x6ea7d7f91d531b0d
	.xword	0xe6d284ce70de2570
	.xword	0x44092c8d0194f80a
	.xword	0xf06ddc35e869a60d
	.xword	0x3e81b837c29fb485
	.xword	0x8500ac1572ac58b8
	.xword	0x8866c9aefac21d0e
	.xword	0xe378c768f219b060
	.xword	0x6eb104baaa4088ea
	.xword	0xed6a95fa9fb6622d
	.xword	0x20c72338d18923f6
	.xword	0x4998df0eeabcd017
	.xword	0x9a4d2aef2c20b64d
	.xword	0xd1b7746b2606b8f6
	.xword	0xbb8d051260e31a82
	.xword	0x717ed8987c66a0a2
	.xword	0x869f6fb0646fa74b
	.xword	0x8c7d458c2c3cff63
	.xword	0xf3797fd896dba533
	.xword	0x858679fc0a86cb13
	.xword	0xf6ba83f8b43e59f5
	.xword	0xec6b9e9c5a316ef9
	.xword	0xa7cd8ac8b68a15d7
	.xword	0x89bf183a4d468a36
	.xword	0x8a3b85f548c5f2a2
	.xword	0xf11ab4ca879ca261
	.xword	0xde93bdcb72adb857
	.xword	0x91422391702c89ee
	.xword	0xcce6f560ded8f11c
	.xword	0xcd19ab847c5a2a40
	.xword	0xf9172d6fbc9b0fb6
	.xword	0xe569d6f36c8f6788
	.xword	0x9ee6ba7bde773b7f
	.xword	0x9433d780f22274a6
	.xword	0x1bfb3a5ea8bec176
	.xword	0xd87f501c93d68294
	.xword	0x174c256b1245e0cf
	.xword	0x028910ca0b897dff
	.xword	0x86d69fa53c809566
	.xword	0x5f8a003f60a791e5
	.xword	0x2ee8ce655db0532a
	.xword	0x996f60b19e4af947
	.xword	0x681abf3f3d203622
	.xword	0xb2191815998ebdf0
	.xword	0x6f6828a69d35d224
	.xword	0xccf47a9cc968ac81
	.xword	0xadbf308aaa0a736a
	.xword	0x00f8e9b623a8d1d2
	.xword	0x5cc8662131126a19
	.xword	0xd8e9d074eb7ac029
	.xword	0x8c544e50c10372ab
	.xword	0x5d785e789e7977db
	.xword	0x044e850d73d7488e
	.xword	0x384fef14d09abc32
	.xword	0x4712e5fb00a8b393
	.xword	0x18b4142da96ba0e8
	.xword	0x573f40c6f6b1ff61
	.xword	0x260e1b92418d5f7c
	.xword	0x8ce75e151e84510f
	.xword	0xbb2b3e8c933db95d
	.xword	0x24ea60c834231b18
	.xword	0xf90ec4aa508fa997
	.xword	0xf1f18e703b811862
	.xword	0xc39133d8e55981e0
	.xword	0x8ce6bddbfa9533b0
	.xword	0xa11bff1aa63a183f
	.xword	0xcf2ea7e0eb28c94a
	.xword	0x28607243dd6735e2
	.xword	0x34861b234f8b0867
	.xword	0x0aabcc93d0f627c4
	.xword	0xdaa01142394e535b
	.xword	0x1143aa6598816cbd
	.xword	0xa1ef8132b96dca23
	.xword	0x6c7dbf02ace846e5
	.xword	0x3d5fc652612c9007
	.xword	0xfcffbee6067023c5
	.xword	0x4d31843d12bd4bc9
	.xword	0xbdf981e766e05cee
	.xword	0x3b568a3edb544dba
	.xword	0xc6ffa708577e0760
	.xword	0x421af05ffc2c3c60
	.xword	0x64a7c967f9269320
	.xword	0xb2e7a73f28d235bb
	.xword	0x0f4b37535a53c744
	.xword	0x9e5bd752892fd38d
	.xword	0x7a6959bf359f192f
	.xword	0xe9386be0ac9f3d54
	.xword	0xd4342b37dd3e4866
	.xword	0x8b5462cdaaa1f7b1
	.xword	0xb9deed23fd71b32d
	.xword	0x3b2d02f254c35e94
	.xword	0xdc4977511583ffbf
	.xword	0x7baba313ddd38390
	.xword	0xf595d0fb856247df
	.xword	0xb78ed16737d1a6c1
	.xword	0xcb850e304dd96740
	.xword	0x696156523dd3aba5
	.xword	0x6e14b8ae038d4032
	.xword	0xe042b2d93fcfed67
	.xword	0x5e43eba8a6faf2ae
	.xword	0x91147867cc08030a
	.xword	0x821c735c8803d0b8
	.xword	0xaedf553f8577bb18
	.xword	0x1c1fdae357e2e79d
	.xword	0x1a92ba97fef535eb
	.xword	0xd4f4f693127685b5
	.xword	0x3f930a2316e75458
	.xword	0x7c0a193744dc5ecc
	.xword	0xc26c30f3c7e840bf
	.xword	0x51dc25c7e20863bf
	.xword	0x0e42558048e0f47c
	.xword	0x608179cfaca29334
	.xword	0x9ffd7b136ea83960
	.xword	0xf5eb2bb83fd93a45
	.xword	0x69d9a7d9e37a1156
	.xword	0x163cb0e3fc22d3fe
	.xword	0x981c53faec8316f4
	.xword	0xe0998ff6152be470
	.xword	0x502e6157a12281ea
	.xword	0x0611026c2b2e512f
	.xword	0x363c0778ac28d5d0
	.xword	0xfea9ecdbd479b78f
	.xword	0xb5ae5f5b435e0a1d
	.xword	0xf1864d3424ab7940
	.xword	0x07477c006f114dea
	.xword	0xaab66a314f9f3765
	.xword	0x8b690d34a7745ef8
	.xword	0x111285603c198693
	.xword	0x7b1d63096c090157
	.xword	0xe34428486c56ca10
	.xword	0x8753f33927d5cc1e
	.xword	0xf5c5445443b85946
	.xword	0x3e76c01e26a5f624
	.xword	0xa97602fb0b611f32
	.xword	0x6cdb7b02be8686c4
	.xword	0xdee273e1d5eb8db9
	.xword	0xf78f4e50bceb5eb5
	.xword	0xa3bc06db22e8d62d
	.xword	0x482e2c1f35d8bcbf
	.xword	0x942a82ab35164c7b
	.xword	0x983a52328b20407e
	.xword	0xf57dc1b2d7a00b95
	.xword	0x2bdea1c2308580f3
	.xword	0xe04e393ad8a48f98
	.xword	0x205015849510bb02
	.xword	0x2fed661d76d8e245
	.xword	0xb970974e0747866c
	.xword	0x0f561f12487858cd
	.xword	0xfc2877a9c8f49739
	.xword	0xe07786b5f3c1a868
	.xword	0x55f0a60a249b7163
	.xword	0xcee3bd37c5900384
	.xword	0xc2704dd73357b288
	.xword	0xd7e901bebbf3e135
	.xword	0x08f2322a34d8f522
	.xword	0x6ccf978ee02af49d
.data
.align	256
t2_data32_start_0:
	.xword	0x000000009458536a
	.xword	0x0000000076ef62d8
	.xword	0x00000000e5722a8a
	.xword	0x000000005ac8b741
	.xword	0x00000000326837d3
	.xword	0x000000006ac96533
	.xword	0x00000000a3c175d0
	.xword	0x0000000066fc71e1
	.xword	0x000000006db7ba16
	.xword	0x00000000945bd68b
	.xword	0x00000000682485be
	.xword	0x00000000428d5a2f
	.xword	0x000000005d60ecda
	.xword	0x00000000972e69d8
	.xword	0x00000000c03d4af7
	.xword	0x00000000ba588727
	.xword	0x000000006265de56
	.xword	0x000000001dba1466
	.xword	0x00000000db9b2408
	.xword	0x0000000065f04ef8
	.xword	0x00000000d6876e30
	.xword	0x00000000018d002e
	.xword	0x0000000014370cd6
	.xword	0x000000004b4f64bc
	.xword	0x00000000f2084a07
	.xword	0x00000000da7c5e74
	.xword	0x00000000c9aa20dd
	.xword	0x00000000d74c4cce
	.xword	0x0000000096d2079d
	.xword	0x000000004198c49f
	.xword	0x0000000021de693d
	.xword	0x000000009140c625
	.xword	0x00000000a5f0e048
	.xword	0x0000000053b9f045
	.xword	0x000000001364e1ef
	.xword	0x00000000200db59c
	.xword	0x00000000ebd245e3
	.xword	0x0000000062865818
	.xword	0x00000000fb2a351f
	.xword	0x000000003b9b8bd3
	.xword	0x000000009c614316
	.xword	0x00000000d0b98095
	.xword	0x00000000b6ec0c51
	.xword	0x00000000048b9f1a
	.xword	0x00000000624d9d73
	.xword	0x00000000b5336689
	.xword	0x00000000757f30f5
	.xword	0x00000000e7bcf538
	.xword	0x000000003bed90f4
	.xword	0x000000003682ec01
	.xword	0x00000000de6a906a
	.xword	0x00000000eeadcde3
	.xword	0x0000000004a3472a
	.xword	0x0000000035dae0d5
	.xword	0x0000000004c713fa
	.xword	0x00000000ae5dbe57
	.xword	0x00000000d8bd2a1a
	.xword	0x000000006936e64b
	.xword	0x00000000fa632f59
	.xword	0x00000000ccfc6eff
	.xword	0x00000000d2d666d0
	.xword	0x00000000664ba03a
	.xword	0x000000000854a077
	.xword	0x00000000ac235b5b
	.xword	0x00000000c2564086
	.xword	0x00000000f131395f
	.xword	0x0000000026a59a7e
	.xword	0x0000000094fe7df2
	.xword	0x00000000325de7a6
	.xword	0x00000000286aac7e
	.xword	0x0000000059540195
	.xword	0x000000001af8cfae
	.xword	0x000000005a873030
	.xword	0x00000000eb6760dc
	.xword	0x00000000f65f57cc
	.xword	0x000000005c3b499a
	.xword	0x00000000d9faf2e9
	.xword	0x00000000d220fb59
	.xword	0x000000005034325f
	.xword	0x00000000ecd2438d
	.xword	0x0000000080ebec6b
	.xword	0x00000000b8952968
	.xword	0x00000000d508d11f
	.xword	0x0000000044da3bc6
	.xword	0x000000006b568909
	.xword	0x0000000081b3173f
	.xword	0x0000000051084995
	.xword	0x00000000d0a1bdc4
	.xword	0x000000009d34d494
	.xword	0x00000000b551b8d9
	.xword	0x000000001887b91d
	.xword	0x00000000f6cb1138
	.xword	0x00000000b96f58d6
	.xword	0x000000007bb5ba2e
	.xword	0x000000008dd4f522
	.xword	0x00000000a8d5680e
	.xword	0x0000000099fedaf5
	.xword	0x00000000550be50b
	.xword	0x00000000f3905ff4
	.xword	0x0000000080d0cc27
	.xword	0x00000000d4d8667d
	.xword	0x00000000a02b2f36
	.xword	0x000000007a33cb13
	.xword	0x00000000558b407e
	.xword	0x000000007750c451
	.xword	0x00000000ef34f7e1
	.xword	0x000000002da8c449
	.xword	0x00000000c0b0136d
	.xword	0x0000000008a8e415
	.xword	0x00000000c42865ee
	.xword	0x00000000b06f21c2
	.xword	0x00000000f44d2111
	.xword	0x000000007964d02f
	.xword	0x000000005a1700cc
	.xword	0x0000000001138336
	.xword	0x000000006c556b65
	.xword	0x000000007f757278
	.xword	0x000000009486b7e3
	.xword	0x000000009009a4f3
	.xword	0x000000006b70cbf7
	.xword	0x00000000948b0d5b
	.xword	0x00000000d1ccc9b7
	.xword	0x00000000e3d08bbe
	.xword	0x000000004fa622cf
	.xword	0x00000000779a87ba
	.xword	0x00000000ecf752d7
	.xword	0x000000003f661cad
	.xword	0x000000008dd7c9dc
	.xword	0x0000000050efce6d
	.xword	0x0000000009060ea8
	.xword	0x00000000c604a5c3
	.xword	0x00000000ff037448
	.xword	0x0000000086f1621a
	.xword	0x00000000e6824389
	.xword	0x0000000024fe2112
	.xword	0x000000002a786a9e
	.xword	0x000000002c4e8ffe
	.xword	0x00000000c1b64c51
	.xword	0x000000007db84c55
	.xword	0x00000000d9518fe6
	.xword	0x00000000810fe56f
	.xword	0x00000000ea0ec0f0
	.xword	0x00000000beac897f
	.xword	0x00000000d06ca657
	.xword	0x000000009ffc9e49
	.xword	0x00000000d3816d23
	.xword	0x000000006c5b407e
	.xword	0x00000000f731171e
	.xword	0x00000000dca0c8ac
	.xword	0x00000000d7c02f5a
	.xword	0x0000000040cc3096
	.xword	0x00000000e243aaf8
	.xword	0x0000000012929105
	.xword	0x00000000f9a3908b
	.xword	0x00000000bfc638ca
	.xword	0x0000000096747f5c
	.xword	0x00000000f3fb49c8
	.xword	0x00000000874c6a56
	.xword	0x0000000018c34f3a
	.xword	0x00000000c5288d62
	.xword	0x0000000092ae1d41
	.xword	0x0000000097eb34b0
	.xword	0x00000000a77b7e9a
	.xword	0x000000005bb0c75a
	.xword	0x0000000054b267c4
	.xword	0x00000000d1975ed1
	.xword	0x0000000028cee322
	.xword	0x000000002104f6fd
	.xword	0x00000000087e71ae
	.xword	0x00000000ba8edbc4
	.xword	0x0000000032105ed1
	.xword	0x00000000b12352a8
	.xword	0x000000007894b94e
	.xword	0x00000000ecd56ed6
	.xword	0x00000000a0d6f9e0
	.xword	0x0000000042a2615e
	.xword	0x000000005cc327e2
	.xword	0x00000000a4b17410
	.xword	0x0000000006ae1915
	.xword	0x00000000329b59a9
	.xword	0x00000000ae7286b5
	.xword	0x00000000293278b6
	.xword	0x00000000d6469e7d
	.xword	0x00000000e5c02ad1
	.xword	0x00000000f49d00ab
	.xword	0x00000000d3300c4e
	.xword	0x000000002447171d
	.xword	0x000000000c46af4f
	.xword	0x00000000debd15bb
	.xword	0x000000008267e4f1
	.xword	0x000000009f1af2ea
	.xword	0x0000000074cd7fbf
	.xword	0x00000000cb4123d1
	.xword	0x00000000bfb0d968
	.xword	0x00000000f4d3f112
	.xword	0x000000006b302d80
	.xword	0x0000000060af07a2
	.xword	0x000000005e38ddf0
	.xword	0x0000000092de8a6b
	.xword	0x00000000eb4bcd49
	.xword	0x0000000080623cf6
	.xword	0x00000000b4e62bec
	.xword	0x00000000848eaaa6
	.xword	0x000000004dc86700
	.xword	0x0000000036deb6b4
	.xword	0x00000000d0c74505
	.xword	0x000000000a099a9a
	.xword	0x00000000cb59293c
	.xword	0x00000000de46a04e
	.xword	0x00000000735629ad
	.xword	0x00000000af3752ff
	.xword	0x00000000f7775847
	.xword	0x0000000071a735c9
	.xword	0x000000000c2790b9
	.xword	0x000000004bb88717
	.xword	0x0000000065fed084
	.xword	0x00000000ff6afa78
	.xword	0x0000000012b4725f
	.xword	0x0000000069cd6173
	.xword	0x00000000fd5aa2d4
	.xword	0x00000000a81575f9
	.xword	0x00000000cee157db
	.xword	0x00000000f9f03164
	.xword	0x000000004a4d7f30
	.xword	0x000000005b44f565
	.xword	0x0000000007417ffc
	.xword	0x00000000fca2c05d
	.xword	0x00000000646065a2
	.xword	0x00000000a1c964b6
	.xword	0x000000007712fdc3
	.xword	0x00000000d9b07337
	.xword	0x00000000ebcc273b
	.xword	0x00000000a501c2b6
	.xword	0x0000000010fa137d
	.xword	0x00000000f89e793f
	.xword	0x00000000f88e19cc
	.xword	0x0000000090afeb19
	.xword	0x000000003f83f4fa
	.xword	0x00000000552cf2e8
	.xword	0x0000000039fb29b3
	.xword	0x0000000028e7775f
	.xword	0x00000000f93b7979
	.xword	0x00000000dca9480a
	.xword	0x00000000fec163f3
	.xword	0x000000001a031a96
	.xword	0x00000000f6652fe4
	.xword	0x00000000d74ac8d9
	.xword	0x000000008dee0b18
	.xword	0x0000000032d595dd
	.xword	0x00000000d131ff27
	.xword	0x00000000752d02d8
	.xword	0x00000000033d5bf5
	.xword	0x00000000fbf9c188
	.xword	0x000000004cb24fca
	.xword	0x000000003a894059
	.xword	0x0000000080e76be9
	.xword	0x000000003973a39a
	.xword	0x000000005f758f38
	.xword	0x00000000b58f8d3e
	.xword	0x00000000c272e66f
	.xword	0x00000000b6654f5f
	.xword	0x00000000f73eaa65
	.xword	0x000000009adcd8c0
	.xword	0x00000000d99def2d
	.xword	0x00000000762a35de
	.xword	0x00000000804a0175
	.xword	0x0000000022c81bb4
	.xword	0x000000009a53018e
	.xword	0x00000000e897d6c5
	.xword	0x0000000084f5e6b7
	.xword	0x00000000a64f8ab0
	.xword	0x000000009fbaebba
	.xword	0x00000000093f56c6
	.xword	0x00000000f7b48d35
	.xword	0x0000000050cd2882
	.xword	0x00000000962b3e4b
	.xword	0x00000000fca2c837
	.xword	0x000000007e194b57
	.xword	0x000000007713c865
	.xword	0x00000000993272a4
	.xword	0x00000000c5409eba
	.xword	0x00000000f7d0084c
	.xword	0x00000000e35cea14
	.xword	0x0000000098f39871
	.xword	0x00000000fed68934
	.xword	0x0000000048a17131
	.xword	0x00000000483d82a0
	.xword	0x000000006b97443b
	.xword	0x00000000556bf784
	.xword	0x00000000ecf5d12c
	.xword	0x00000000fd201ade
	.xword	0x000000006fb1f932
	.xword	0x000000000d2cc1e0
	.xword	0x000000009929a3e4
	.xword	0x00000000444dbc32
	.xword	0x00000000f5411c35
	.xword	0x00000000a6fbd8f5
	.xword	0x00000000aa843e03
	.xword	0x0000000000a74801
	.xword	0x000000002c88b911
	.xword	0x000000004b45119b
	.xword	0x00000000a4b2c886
	.xword	0x0000000063b5da1c
	.xword	0x000000003ea3f665
	.xword	0x00000000d496569b
	.xword	0x0000000003909965
	.xword	0x000000007e42fe4c
	.xword	0x00000000cb24b3dc
	.xword	0x000000004bc18598
	.xword	0x00000000e30ed9bc
	.xword	0x00000000a04a72c6
	.xword	0x00000000e9735307
	.xword	0x00000000c68e4577
	.xword	0x00000000e73ff704
	.xword	0x000000006dc42365
	.xword	0x0000000066f5c5a9
	.xword	0x0000000042023a7c
	.xword	0x00000000e3f1a454
	.xword	0x000000004df63d9f
	.xword	0x0000000010d1bfaf
	.xword	0x00000000c5fb1025
	.xword	0x0000000018bf5bb8
	.xword	0x00000000c6f189c7
	.xword	0x000000004fcc925c
	.xword	0x000000006c9b6a65
	.xword	0x0000000066f7e913
	.xword	0x0000000021950a08
	.xword	0x0000000094ba259f
	.xword	0x000000002723edd5
	.xword	0x00000000e09a27f5
	.xword	0x00000000811cb8d3
	.xword	0x000000005eeee8f4
	.xword	0x00000000b084d7c1
	.xword	0x00000000840e2858
	.xword	0x00000000bdb629c8
	.xword	0x00000000dd24479d
	.xword	0x000000008eb278d6
	.xword	0x000000002998b47b
	.xword	0x00000000ec441599
	.xword	0x000000006521c4b0
	.xword	0x000000006bd120b1
	.xword	0x0000000016464dd0
	.xword	0x0000000041e864f7
	.xword	0x00000000b725fdbc
	.xword	0x00000000758c9017
	.xword	0x00000000a2c030ae
	.xword	0x0000000076b7aecb
	.xword	0x00000000d9877935
	.xword	0x000000004a6fee07
	.xword	0x0000000064d9c547
	.xword	0x000000002ace01d8
	.xword	0x0000000073c7322f
	.xword	0x0000000084f5a32b
	.xword	0x00000000afc02c0e
	.xword	0x000000006c1a7a81
	.xword	0x00000000e0f1fa9d
	.xword	0x00000000bef92a37
	.xword	0x000000002cb8bba6
	.xword	0x000000008a0644ba
	.xword	0x00000000179ee29d
	.xword	0x0000000044350b25
	.xword	0x0000000024072eb3
	.xword	0x00000000dc60ec93
	.xword	0x0000000086aa888b
	.xword	0x000000003960832f
	.xword	0x000000004427ce9c
	.xword	0x000000003b399f52
	.xword	0x00000000c1252ad3
	.xword	0x0000000001c19bf7
	.xword	0x0000000053d3e2f1
	.xword	0x00000000029ee484
	.xword	0x000000002cd7bb6e
	.xword	0x00000000ef1bdf8d
	.xword	0x00000000df63568d
	.xword	0x000000007ca5a911
	.xword	0x000000006f094023
	.xword	0x0000000008910774
	.xword	0x0000000090f76819
	.xword	0x00000000f9a1f2be
	.xword	0x000000004707464c
	.xword	0x00000000be7abf6e
	.xword	0x0000000041f70dac
	.xword	0x00000000ae83100b
	.xword	0x00000000781dedef
	.xword	0x00000000a39a91cf
	.xword	0x00000000586d0ae6
	.xword	0x00000000f86b48a3
	.xword	0x00000000e32e654c
	.xword	0x0000000029e3c97f
	.xword	0x00000000cbacc167
	.xword	0x000000002bd7153d
	.xword	0x0000000083b3c384
	.xword	0x00000000ea1a176b
	.xword	0x0000000069eb8293
	.xword	0x000000000a1fcea0
	.xword	0x00000000711d1a5c
	.xword	0x0000000069214c57
	.xword	0x000000003598d581
	.xword	0x000000004253a55c
	.xword	0x0000000090c93c16
	.xword	0x0000000048c727bf
	.xword	0x00000000d4c568d3
	.xword	0x00000000fea99aaf
	.xword	0x00000000f78b9c7c
	.xword	0x00000000ca26302e
	.xword	0x00000000cbbe7923
	.xword	0x0000000083e587e3
	.xword	0x00000000120a9e1e
	.xword	0x000000004d51292b
	.xword	0x00000000923e6430
	.xword	0x0000000086ddfbef
	.xword	0x00000000e99e7b3b
	.xword	0x000000006d6640b9
	.xword	0x00000000d97dd017
	.xword	0x00000000c436300d
	.xword	0x000000004a38951b
	.xword	0x000000007f294480
	.xword	0x00000000024b7f5f
	.xword	0x00000000240739ac
	.xword	0x0000000009f3cf25
	.xword	0x000000000a9e7584
	.xword	0x00000000bbf2a372
	.xword	0x000000000f03e7dc
	.xword	0x00000000664890eb
	.xword	0x00000000729b5f40
	.xword	0x000000000e8959e8
	.xword	0x000000004f174bc2
	.xword	0x000000000c300bf7
	.xword	0x0000000040b04844
	.xword	0x0000000068181287
	.xword	0x0000000090845334
	.xword	0x00000000a1051f10
	.xword	0x00000000357ecd3f
	.xword	0x00000000decab78d
	.xword	0x00000000ccc46d25
	.xword	0x000000002bacdb8d
	.xword	0x00000000366753d1
	.xword	0x00000000dbe7bf65
	.xword	0x00000000888480a0
	.xword	0x00000000c29188b9
	.xword	0x0000000048697148
	.xword	0x00000000d77a1e79
	.xword	0x00000000640560c0
	.xword	0x00000000f4f516aa
	.xword	0x000000009ec00503
	.xword	0x00000000be1a7bf8
	.xword	0x000000000cc8af4e
	.xword	0x000000003f8e0325
	.xword	0x00000000ffc8bddd
	.xword	0x000000006aff57bc
	.xword	0x00000000470c065b
	.xword	0x00000000ad9eb5d4
	.xword	0x000000000fd6b3d2
	.xword	0x0000000038ea5698
	.xword	0x00000000cb9f5a3e
	.xword	0x0000000001b8b269
	.xword	0x00000000406851a0
	.xword	0x000000005373e546
	.xword	0x0000000077e59977
	.xword	0x00000000dcc2c780
	.xword	0x00000000373de267
	.xword	0x0000000015e627c6
	.xword	0x00000000c0d5d2ea
	.xword	0x000000003bfa4969
	.xword	0x00000000516708e8
	.xword	0x000000007541c1f2
	.xword	0x000000003f3e6f3d
	.xword	0x000000009074e07c
	.xword	0x00000000947d8bcc
	.xword	0x000000007848eaa8
	.xword	0x00000000e2d6b3f2
	.xword	0x00000000752868d8
	.xword	0x00000000324c0bf7
	.xword	0x000000001b9d1588
	.xword	0x00000000dd42317f
	.xword	0x00000000371e595a
	.xword	0x000000009662eac9
	.xword	0x000000001e032f36
	.xword	0x00000000810ce30e
	.xword	0x00000000a9bccbe6
	.xword	0x00000000c0c2bf56
	.xword	0x00000000f9decc06
	.xword	0x00000000f83d4dd1
	.xword	0x000000001a4640a9
	.xword	0x000000008b444889
	.xword	0x0000000018c74de5
	.xword	0x00000000ecfe264a
	.xword	0x0000000024807264
	.xword	0x0000000055eccc8f
	.xword	0x00000000f2375e5d
	.xword	0x00000000d456f2bb
	.xword	0x00000000b96106fd
	.xword	0x0000000077e1007f
	.xword	0x00000000b6747959
	.xword	0x0000000039b1c534
	.xword	0x00000000034a718b
	.xword	0x00000000424dd8bb
	.xword	0x00000000ebac45bb
	.xword	0x00000000df3e5e0e
	.xword	0x0000000014d21395
	.xword	0x000000005a5948c4
	.xword	0x00000000835fcc0c
	.xword	0x000000005bfae757
	.xword	0x000000007c4d0b3a
	.xword	0x00000000274b64d1
	.xword	0x000000008983d156
	.xword	0x00000000f445ab98
	.xword	0x000000009e1c83c9
	.xword	0x00000000fb849b81
	.xword	0x00000000973ca39a
	.xword	0x00000000118c912b
	.xword	0x00000000d5dc5488
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	wr %r4,0x1fff,%y
	setx	t1_data64_start_0,%g3, %g1
	setx	t1_data32_start_0,%g3, %g2
	.word 0x8e496001  ! 2: MULX_I	mulx 	%r5, 0x0001, %r7
	.word 0xbc6b2001  ! 7: UDIVX_I	udivx 	%r12, 0x0001, %r30
	.word 0x98d42001  ! 12: UMULcc_I	umulcc 	%r16, 0x0001, %r12
	.word 0x81842001  ! 17: WRY_I	wr	%r16, 0x0001, %y
	.word 0xaf260003  ! 22: MULScc_R	mulscc 	%r24, %r3, %r23
	.word 0xb868e001  ! 27: UDIVX_I	udivx 	%r3, 0x0001, %r28
	.word 0xb86b0014  ! 32: UDIVX_R	udivx 	%r12, %r20, %r28
	.word 0x90782001  ! 37: SDIV_I	sdiv 	%r0, 0x0001, %r8
	.word 0x8f69e001  ! 42: SDIVX_I	sdivx	%r7, 0x0001, %r7
	.word 0xbe5a800d  ! 47: SMUL_R	smul 	%r10, %r13, %r31
	.word 0xa2f2800c  ! 52: UDIVcc_R	udivcc 	%r10, %r12, %r17
	.word 0xc8586530  ! 57: LDX_I	ldx	[%r1 + 0x0530], %r4
	.word 0x86fda001  ! 62: SDIVcc_I	sdivcc 	%r22, 0x0001, %r3
	.word 0x9a6ea001  ! 67: UDIVX_I	udivx 	%r26, 0x0001, %r13
	.word 0x81826001  ! 72: WRY_I	wr	%r9, 0x0001, %y
	.word 0x9af3e001  ! 77: UDIVcc_I	udivcc 	%r15, 0x0001, %r13
	.word 0xa67a4019  ! 82: SDIV_R	sdiv 	%r9, %r25, %r19
	.word 0x9cda2001  ! 87: SMULcc_I	smulcc 	%r8, 0x0001, %r14
	.word 0x81836001  ! 92: WRY_I	wr	%r13, 0x0001, %y
	.word 0xa4494003  ! 97: MULX_R	mulx 	%r5, %r3, %r18
	.word 0x98d4a001  ! 102: UMULcc_I	umulcc 	%r18, 0x0001, %r12
	.word 0x9c7fc006  ! 107: SDIV_R	sdiv 	%r31, %r6, %r14
	.word 0xac55001e  ! 112: UMUL_R	umul 	%r20, %r30, %r22
	.word 0xa47ac009  ! 117: SDIV_R	sdiv 	%r11, %r9, %r18
	.word 0x926e8019  ! 122: UDIVX_R	udivx 	%r26, %r25, %r9
	.word 0xb96f4000  ! 127: SDIVX_R	sdivx	%r29, %r0, %r28
	.word 0xa66b8000  ! 132: UDIVX_R	udivx 	%r14, %r0, %r19
	.word 0xa6514007  ! 137: UMUL_R	umul 	%r5, %r7, %r19
	.word 0xb36c4019  ! 142: SDIVX_R	sdivx	%r17, %r25, %r25
	.word 0xa276e001  ! 147: UDIV_I	udiv 	%r27, 0x0001, %r17
	.word 0xbed5a001  ! 152: UMULcc_I	umulcc 	%r22, 0x0001, %r31
	.word 0xaaf0e001  ! 157: UDIVcc_I	udivcc 	%r3, 0x0001, %r21
	.word 0xb44dc013  ! 162: MULX_R	mulx 	%r23, %r19, %r26
	.word 0x9f260017  ! 167: MULScc_R	mulscc 	%r24, %r23, %r15
	.word 0xb2482001  ! 172: MULX_I	mulx 	%r0, 0x0001, %r25
	.word 0xab690006  ! 177: SDIVX_R	sdivx	%r4, %r6, %r21
	.word 0x9c6da001  ! 182: UDIVX_I	udivx 	%r22, 0x0001, %r14
	.word 0xb069001e  ! 187: UDIVX_R	udivx 	%r4, %r30, %r24
	.word 0x945ce001  ! 192: SMUL_I	smul 	%r19, 0x0001, %r10
	.word 0xa2fec016  ! 197: SDIVcc_R	sdivcc 	%r27, %r22, %r17
	.word 0x964a0009  ! 202: MULX_R	mulx 	%r8, %r9, %r11
	.word 0xa4d72001  ! 207: UMULcc_I	umulcc 	%r28, 0x0001, %r18
	.word 0xac4fe001  ! 212: MULX_I	mulx 	%r31, 0x0001, %r22
	.word 0x956c8006  ! 217: SDIVX_R	sdivx	%r18, %r6, %r10
	.word 0x904a2001  ! 222: MULX_I	mulx 	%r8, 0x0001, %r8
	.word 0x864b0003  ! 227: MULX_R	mulx 	%r12, %r3, %r3
	.word 0xa46e8009  ! 232: UDIVX_R	udivx 	%r26, %r9, %r18
	.word 0xa24c4016  ! 237: MULX_R	mulx 	%r17, %r22, %r17
	.word 0xb65d400c  ! 242: SMUL_R	smul 	%r21, %r12, %r27
	.word 0xb76ec011  ! 247: SDIVX_R	sdivx	%r27, %r17, %r27
	.word 0x88fce001  ! 252: SDIVcc_I	sdivcc 	%r19, 0x0001, %r4
	.word 0x924c2001  ! 257: MULX_I	mulx 	%r16, 0x0001, %r9
	.word 0xee5860c8  ! 262: LDX_I	ldx	[%r1 + 0x00c8], %r23
	.word 0xb06ec01b  ! 267: UDIVX_R	udivx 	%r27, %r27, %r24
	.word 0xb25c4008  ! 272: SMUL_R	smul 	%r17, %r8, %r25
	.word 0xa5256001  ! 277: MULScc_I	mulscc 	%r21, 0x0001, %r18
	.word 0x8afb0016  ! 282: SDIVcc_R	sdivcc 	%r12, %r22, %r5
	.word 0x987e400d  ! 287: SDIV_R	sdiv 	%r25, %r13, %r12
	.word 0x8a7de001  ! 292: SDIV_I	sdiv 	%r23, 0x0001, %r5
	.word 0x964c6001  ! 297: MULX_I	mulx 	%r17, 0x0001, %r11
	.word 0xbcf7c00b  ! 302: UDIVcc_R	udivcc 	%r31, %r11, %r30
	.word 0xbad9a001  ! 307: SMULcc_I	smulcc 	%r6, 0x0001, %r29
	.word 0x81826001  ! 312: WRY_I	wr	%r9, 0x0001, %y
	.word 0xe25866d0  ! 317: LDX_I	ldx	[%r1 + 0x06d0], %r17
	.word 0xb16a2001  ! 322: SDIVX_I	sdivx	%r8, 0x0001, %r24
	.word 0xac75a001  ! 327: UDIV_I	udiv 	%r22, 0x0001, %r22
	.word 0x9b6d6001  ! 332: SDIVX_I	sdivx	%r21, 0x0001, %r13
	.word 0x986a8019  ! 337: UDIVX_R	udivx 	%r10, %r25, %r12
	.word 0xa05c001f  ! 342: SMUL_R	smul 	%r16, %r31, %r16
	.word 0xad6a0008  ! 347: SDIVX_R	sdivx	%r8, %r8, %r22
	.word 0xb4f8c015  ! 352: SDIVcc_R	sdivcc 	%r3, %r21, %r26
	.word 0xbe6aa001  ! 357: UDIVX_I	udivx 	%r10, 0x0001, %r31
	.word 0xb86a4015  ! 362: UDIVX_R	udivx 	%r9, %r21, %r28
	.word 0x996c6001  ! 367: SDIVX_I	sdivx	%r17, 0x0001, %r12
	.word 0xa24c8011  ! 372: MULX_R	mulx 	%r18, %r17, %r17
	.word 0xaa49c01b  ! 377: MULX_R	mulx 	%r7, %r27, %r21
	.word 0x945f0010  ! 382: SMUL_R	smul 	%r28, %r16, %r10
	.word 0xb0498009  ! 387: MULX_R	mulx 	%r6, %r9, %r24
	.word 0xacf32001  ! 392: UDIVcc_I	udivcc 	%r12, 0x0001, %r22
	.word 0x8c4ba001  ! 397: MULX_I	mulx 	%r14, 0x0001, %r6
	.word 0xb44ea001  ! 402: MULX_I	mulx 	%r26, 0x0001, %r26
	.word 0x96f00011  ! 407: UDIVcc_R	udivcc 	%r0, %r17, %r11
	.word 0xb46ca001  ! 412: UDIVX_I	udivx 	%r18, 0x0001, %r26
	.word 0xa56b8015  ! 417: SDIVX_R	sdivx	%r14, %r21, %r18
	.word 0xa64d8009  ! 422: MULX_R	mulx 	%r22, %r9, %r19
	.word 0x936c400c  ! 427: SDIVX_R	sdivx	%r17, %r12, %r9
	.word 0xb86f8003  ! 432: UDIVX_R	udivx 	%r30, %r3, %r28
	.word 0x8a73a001  ! 437: UDIV_I	udiv 	%r14, 0x0001, %r5
	.word 0xad6e6001  ! 442: SDIVX_I	sdivx	%r25, 0x0001, %r22
	.word 0xa04ca001  ! 447: MULX_I	mulx 	%r18, 0x0001, %r16
	.word 0xbadcc00f  ! 452: SMULcc_R	smulcc 	%r19, %r15, %r29
	.word 0x91696001  ! 457: SDIVX_I	sdivx	%r5, 0x0001, %r8
	.word 0xb4f58012  ! 462: UDIVcc_R	udivcc 	%r22, %r18, %r26
	.word 0x81856001  ! 467: WRY_I	wr	%r21, 0x0001, %y
	.word 0x884e6001  ! 472: MULX_I	mulx 	%r25, 0x0001, %r4
	.word 0x876e401c  ! 477: SDIVX_R	sdivx	%r25, %r28, %r3
	.word 0xa527000b  ! 482: MULScc_R	mulscc 	%r28, %r11, %r18
	.word 0xb457c01b  ! 487: UMUL_R	umul 	%r31, %r27, %r26
	.word 0x945c8014  ! 492: SMUL_R	smul 	%r18, %r20, %r10
	.word 0xa24a4005  ! 497: MULX_R	mulx 	%r9, %r5, %r17
	.word 0x8c6ac00c  ! 502: UDIVX_R	udivx 	%r11, %r12, %r6
	.word 0xa26cc007  ! 507: UDIVX_R	udivx 	%r19, %r7, %r17
	.word 0x8187e001  ! 512: WRY_I	wr	%r31, 0x0001, %y
	.word 0xa64d000c  ! 517: MULX_R	mulx 	%r20, %r12, %r19
	.word 0x8a7b8004  ! 522: SDIV_R	sdiv 	%r14, %r4, %r5
	.word 0xa8490010  ! 527: MULX_R	mulx 	%r4, %r16, %r20
	.word 0xbcfb2001  ! 532: SDIVcc_I	sdivcc 	%r12, 0x0001, %r30
	.word 0x9a4fe001  ! 537: MULX_I	mulx 	%r31, 0x0001, %r13
	.word 0x9768e001  ! 542: SDIVX_I	sdivx	%r3, 0x0001, %r11
	.word 0xae4e8005  ! 547: MULX_R	mulx 	%r26, %r5, %r23
	.word 0xac6da001  ! 552: UDIVX_I	udivx 	%r22, 0x0001, %r22
	.word 0xb66e2001  ! 557: UDIVX_I	udivx 	%r24, 0x0001, %r27
	.word 0xaf6be001  ! 562: SDIVX_I	sdivx	%r15, 0x0001, %r23
	.word 0xaa4da001  ! 567: MULX_I	mulx 	%r22, 0x0001, %r21
	.word 0xa7694003  ! 572: SDIVX_R	sdivx	%r5, %r3, %r19
	.word 0xb06a6001  ! 577: UDIVX_I	udivx 	%r9, 0x0001, %r24
	.word 0xaa73a001  ! 582: UDIV_I	udiv 	%r14, 0x0001, %r21
	.word 0xb6f28003  ! 587: UDIVcc_R	udivcc 	%r10, %r3, %r27
	.word 0x9cfac004  ! 592: SDIVcc_R	sdivcc 	%r11, %r4, %r14
	.word 0x81862001  ! 597: WRY_I	wr	%r24, 0x0001, %y
	.word 0xb658001c  ! 602: SMUL_R	smul 	%r0, %r28, %r27
	.word 0x8f680015  ! 607: SDIVX_R	sdivx	%r0, %r21, %r7
	.word 0xa4522001  ! 612: UMUL_I	umul 	%r8, 0x0001, %r18
	.word 0xb5222001  ! 617: MULScc_I	mulscc 	%r8, 0x0001, %r26
	.word 0xa849400b  ! 622: MULX_R	mulx 	%r5, %r11, %r20
	.word 0x996c2001  ! 627: SDIVX_I	sdivx	%r16, 0x0001, %r12
	.word 0xf858a518  ! 632: LDX_I	ldx	[%r2 + 0x0518], %r28
	.word 0x926f401c  ! 637: UDIVX_R	udivx 	%r29, %r28, %r9
	.word 0xb6f8e001  ! 642: SDIVcc_I	sdivcc 	%r3, 0x0001, %r27
	.word 0xa06f4011  ! 647: UDIVX_R	udivx 	%r29, %r17, %r16
	.word 0xa878c00b  ! 652: SDIV_R	sdiv 	%r3, %r11, %r20
	.word 0xbafb800b  ! 657: SDIVcc_R	sdivcc 	%r14, %r11, %r29
	.word 0xbd6dc01f  ! 662: SDIVX_R	sdivx	%r23, %r31, %r30
	.word 0x81876001  ! 667: WRY_I	wr	%r29, 0x0001, %y
	.word 0x884b2001  ! 672: MULX_I	mulx 	%r12, 0x0001, %r4
	.word 0x8c49e001  ! 677: MULX_I	mulx 	%r7, 0x0001, %r6
	.word 0xb0f38016  ! 682: UDIVcc_R	udivcc 	%r14, %r22, %r24
	.word 0xbc6dc008  ! 687: UDIVX_R	udivx 	%r23, %r8, %r30
	.word 0xa2780000  ! 692: SDIV_R	sdiv 	%r0, %r0, %r17
	.word 0x8ed5e001  ! 697: UMULcc_I	umulcc 	%r23, 0x0001, %r7
	.word 0x8ed6c015  ! 702: UMULcc_R	umulcc 	%r27, %r21, %r7
	.word 0xa66e8016  ! 707: UDIVX_R	udivx 	%r26, %r22, %r19
	.word 0x924c801a  ! 712: MULX_R	mulx 	%r18, %r26, %r9
	.word 0xb7680016  ! 717: SDIVX_R	sdivx	%r0, %r22, %r27
	.word 0x956a801c  ! 722: SDIVX_R	sdivx	%r10, %r28, %r10
	.word 0x867f4007  ! 727: SDIV_R	sdiv 	%r29, %r7, %r3
	.word 0xbe4f000d  ! 732: MULX_R	mulx 	%r28, %r13, %r31
	.word 0x81872001  ! 737: WRY_I	wr	%r28, 0x0001, %y
	.word 0xa9680005  ! 742: SDIVX_R	sdivx	%r0, %r5, %r20
	.word 0xac4cc00c  ! 747: MULX_R	mulx 	%r19, %r12, %r22
	.word 0xf258a260  ! 752: LDX_I	ldx	[%r2 + 0x0260], %r25
	.word 0xa24be001  ! 757: MULX_I	mulx 	%r15, 0x0001, %r17
	.word 0xa0f40008  ! 762: UDIVcc_R	udivcc 	%r16, %r8, %r16
	.word 0xb44f2001  ! 767: MULX_I	mulx 	%r28, 0x0001, %r26
	.word 0x964be001  ! 772: MULX_I	mulx 	%r15, 0x0001, %r11
	.word 0x9c6a4011  ! 777: UDIVX_R	udivx 	%r9, %r17, %r14
	.word 0x866b0000  ! 782: UDIVX_R	udivx 	%r12, %r0, %r3
	.word 0x9048e001  ! 787: MULX_I	mulx 	%r3, 0x0001, %r8
	.word 0xf45867f0  ! 792: LDX_I	ldx	[%r1 + 0x07f0], %r26
	.word 0xbaf4401c  ! 797: UDIVcc_R	udivcc 	%r17, %r28, %r29
	.word 0xbed2c009  ! 802: UMULcc_R	umulcc 	%r11, %r9, %r31
	.word 0x9a6f4019  ! 807: UDIVX_R	udivx 	%r29, %r25, %r13
	.word 0x8f20c006  ! 812: MULScc_R	mulscc 	%r3, %r6, %r7
	.word 0x9e5be001  ! 817: SMUL_I	smul 	%r15, 0x0001, %r15
	.word 0x8d69800f  ! 822: SDIVX_R	sdivx	%r6, %r15, %r6
	.word 0xa06ec00c  ! 827: UDIVX_R	udivx 	%r27, %r12, %r16
	.word 0xbe7a8004  ! 832: SDIV_R	sdiv 	%r10, %r4, %r31
	.word 0xbf6f401d  ! 837: SDIVX_R	sdivx	%r29, %r29, %r31
	.word 0xac5d4000  ! 842: SMUL_R	smul 	%r21, %r0, %r22
	.word 0xf85863b0  ! 847: LDX_I	ldx	[%r1 + 0x03b0], %r28
	.word 0xaf6bc010  ! 852: SDIVX_R	sdivx	%r15, %r16, %r23
	.word 0xbd698016  ! 857: SDIVX_R	sdivx	%r6, %r22, %r30
	.word 0x8a49800c  ! 862: MULX_R	mulx 	%r6, %r12, %r5
	.word 0x8187a001  ! 867: WRY_I	wr	%r30, 0x0001, %y
	.word 0xa248e001  ! 872: MULX_I	mulx 	%r3, 0x0001, %r17
	.word 0xa36d000f  ! 877: SDIVX_R	sdivx	%r20, %r15, %r17
	.word 0xa84c800f  ! 882: MULX_R	mulx 	%r18, %r15, %r20
	.word 0x986a8016  ! 887: UDIVX_R	udivx 	%r10, %r22, %r12
	.word 0x90f6c013  ! 892: UDIVcc_R	udivcc 	%r27, %r19, %r8
	.word 0xb279c017  ! 897: SDIV_R	sdiv 	%r7, %r23, %r25
	.word 0xa96d800e  ! 902: SDIVX_R	sdivx	%r22, %r14, %r20
	.word 0x896aa001  ! 907: SDIVX_I	sdivx	%r10, 0x0001, %r4
	.word 0xa475a001  ! 912: UDIV_I	udiv 	%r22, 0x0001, %r18
	.word 0xbefda001  ! 917: SDIVcc_I	sdivcc 	%r22, 0x0001, %r31
	.word 0xa76f0013  ! 922: SDIVX_R	sdivx	%r28, %r19, %r19
	.word 0x964c4004  ! 927: MULX_R	mulx 	%r17, %r4, %r11
	.word 0x936a6001  ! 932: SDIVX_I	sdivx	%r9, 0x0001, %r9
	.word 0xb96ec018  ! 937: SDIVX_R	sdivx	%r27, %r24, %r28
	.word 0x904f2001  ! 942: MULX_I	mulx 	%r28, 0x0001, %r8
	.word 0xb249c004  ! 947: MULX_R	mulx 	%r7, %r4, %r25
	.word 0xaafde001  ! 952: SDIVcc_I	sdivcc 	%r23, 0x0001, %r21
	.word 0xba6b401b  ! 957: UDIVX_R	udivx 	%r13, %r27, %r29
	.word 0xaa4aa001  ! 962: MULX_I	mulx 	%r10, 0x0001, %r21
	.word 0x964f6001  ! 967: MULX_I	mulx 	%r29, 0x0001, %r11
	.word 0x9a4c6001  ! 972: MULX_I	mulx 	%r17, 0x0001, %r13
	.word 0x985ae001  ! 977: SMUL_I	smul 	%r11, 0x0001, %r12
	.word 0xa06c2001  ! 982: UDIVX_I	udivx 	%r16, 0x0001, %r16
	.word 0x9b6b0015  ! 987: SDIVX_R	sdivx	%r12, %r21, %r13
	.word 0xe6586338  ! 992: LDX_I	ldx	[%r1 + 0x0338], %r19
	.word 0xb85fe001  ! 997: SMUL_I	smul 	%r31, 0x0001, %r28
	.word 0xaefe2001  ! 1002: SDIVcc_I	sdivcc 	%r24, 0x0001, %r23
	.word 0x86d9801f  ! 1007: SMULcc_R	smulcc 	%r6, %r31, %r3
	.word 0x9c70c018  ! 1012: UDIV_R	udiv 	%r3, %r24, %r14
	.word 0x8cfe6001  ! 1017: SDIVcc_I	sdivcc 	%r25, 0x0001, %r6
	.word 0x947d4017  ! 1022: SDIV_R	sdiv 	%r21, %r23, %r10
	.word 0x8e4b0009  ! 1027: MULX_R	mulx 	%r12, %r9, %r7
	.word 0x8a5ae001  ! 1032: SMUL_I	smul 	%r11, 0x0001, %r5
	.word 0xbe7f0008  ! 1037: SDIV_R	sdiv 	%r28, %r8, %r31
	.word 0xbcdfa001  ! 1042: SMULcc_I	smulcc 	%r30, 0x0001, %r30
	.word 0xb3236001  ! 1047: MULScc_I	mulscc 	%r13, 0x0001, %r25
	.word 0x91260000  ! 1052: MULScc_R	mulscc 	%r24, %r0, %r8
	.word 0x8184a001  ! 1057: WRY_I	wr	%r18, 0x0001, %y
	.word 0x92d5001f  ! 1062: UMULcc_R	umulcc 	%r20, %r31, %r9
	.word 0xac72c01f  ! 1067: UDIV_R	udiv 	%r11, %r31, %r22
	.word 0x8186a001  ! 1072: WRY_I	wr	%r26, 0x0001, %y
	.word 0xab6fa001  ! 1077: SDIVX_I	sdivx	%r30, 0x0001, %r21
	.word 0x88f10000  ! 1082: UDIVcc_R	udivcc 	%r4, %r0, %r4
	.word 0xa4f1c00b  ! 1087: UDIVcc_R	udivcc 	%r7, %r11, %r18
	.word 0xa16f8009  ! 1092: SDIVX_R	sdivx	%r30, %r9, %r16
	.word 0xaf69c016  ! 1097: SDIVX_R	sdivx	%r7, %r22, %r23
	.word 0xb2de2001  ! 1102: SMULcc_I	smulcc 	%r24, 0x0001, %r25
	.word 0x8187e001  ! 1107: WRY_I	wr	%r31, 0x0001, %y
	.word 0x904e2001  ! 1112: MULX_I	mulx 	%r24, 0x0001, %r8
	.word 0xa849a001  ! 1117: MULX_I	mulx 	%r6, 0x0001, %r20
	.word 0xac4da001  ! 1122: MULX_I	mulx 	%r22, 0x0001, %r22
	.word 0xa04ca001  ! 1127: MULX_I	mulx 	%r18, 0x0001, %r16
	.word 0x966d6001  ! 1132: UDIVX_I	udivx 	%r21, 0x0001, %r11
	.word 0xa84a0004  ! 1137: MULX_R	mulx 	%r8, %r4, %r20
	.word 0xa45b2001  ! 1142: SMUL_I	smul 	%r12, 0x0001, %r18
	.word 0xb65d8019  ! 1147: SMUL_R	smul 	%r22, %r25, %r27
	.word 0x907f400b  ! 1152: SDIV_R	sdiv 	%r29, %r11, %r8
	.word 0xbc55c008  ! 1157: UMUL_R	umul 	%r23, %r8, %r30
	.word 0xa04c001a  ! 1162: MULX_R	mulx 	%r16, %r26, %r16
	.word 0xa24cc015  ! 1167: MULX_R	mulx 	%r19, %r21, %r17
	.word 0xb66f801f  ! 1172: UDIVX_R	udivx 	%r30, %r31, %r27
	.word 0x906ac013  ! 1177: UDIVX_R	udivx 	%r11, %r19, %r8
	.word 0x8e6ea001  ! 1182: UDIVX_I	udivx 	%r26, 0x0001, %r7
	.word 0xb84e001a  ! 1187: MULX_R	mulx 	%r24, %r26, %r28
	.word 0xae5c8012  ! 1192: SMUL_R	smul 	%r18, %r18, %r23
	.word 0xca586750  ! 1197: LDX_I	ldx	[%r1 + 0x0750], %r5
	.word 0xa44b800f  ! 1202: MULX_R	mulx 	%r14, %r15, %r18
	.word 0x94682001  ! 1207: UDIVX_I	udivx 	%r0, 0x0001, %r10
	.word 0xbc6fc011  ! 1212: UDIVX_R	udivx 	%r31, %r17, %r30
	.word 0xbb6ac00e  ! 1217: SDIVX_R	sdivx	%r11, %r14, %r29
	.word 0x984be001  ! 1222: MULX_I	mulx 	%r15, 0x0001, %r12
	.word 0xa2d7c008  ! 1227: UMULcc_R	umulcc 	%r31, %r8, %r17
	.word 0xa86a8012  ! 1232: UDIVX_R	udivx 	%r10, %r18, %r20
	.word 0x9adc4016  ! 1237: SMULcc_R	smulcc 	%r17, %r22, %r13
	.word 0x924d4010  ! 1242: MULX_R	mulx 	%r21, %r16, %r9
	.word 0xa8682001  ! 1247: UDIVX_I	udivx 	%r0, 0x0001, %r20
	.word 0xbe6ee001  ! 1252: UDIVX_I	udivx 	%r27, 0x0001, %r31
	.word 0x9a4e4013  ! 1257: MULX_R	mulx 	%r25, %r19, %r13
	.word 0xa8fd4017  ! 1262: SDIVcc_R	sdivcc 	%r21, %r23, %r20
	.word 0x92536001  ! 1267: UMUL_I	umul 	%r13, 0x0001, %r9
	.word 0x8d6ee001  ! 1272: SDIVX_I	sdivx	%r27, 0x0001, %r6
	.word 0x8184a001  ! 1277: WRY_I	wr	%r18, 0x0001, %y
	.word 0xac6d6001  ! 1282: UDIVX_I	udivx 	%r21, 0x0001, %r22
	.word 0x8869a001  ! 1287: UDIVX_I	udivx 	%r6, 0x0001, %r4
	.word 0x8c4ee001  ! 1292: MULX_I	mulx 	%r27, 0x0001, %r6
	.word 0x92db0017  ! 1297: SMULcc_R	smulcc 	%r12, %r23, %r9
	.word 0xbefe8019  ! 1302: SDIVcc_R	sdivcc 	%r26, %r25, %r31
	.word 0x916a0011  ! 1307: SDIVX_R	sdivx	%r8, %r17, %r8
	.word 0x81812001  ! 1312: WRY_I	wr	%r4, 0x0001, %y
	.word 0x866be001  ! 1317: UDIVX_I	udivx 	%r15, 0x0001, %r3
	.word 0x8c6ea001  ! 1322: UDIVX_I	udivx 	%r26, 0x0001, %r6
	.word 0x86482001  ! 1327: MULX_I	mulx 	%r0, 0x0001, %r3
	.word 0x8efae001  ! 1332: SDIVcc_I	sdivcc 	%r11, 0x0001, %r7
	.word 0x8185a001  ! 1337: WRY_I	wr	%r22, 0x0001, %y
	.word 0x8ed0000b  ! 1342: UMULcc_R	umulcc 	%r0, %r11, %r7
	.word 0x8a70c00e  ! 1347: UDIV_R	udiv 	%r3, %r14, %r5
	.word 0xaefe6001  ! 1352: SDIVcc_I	sdivcc 	%r25, 0x0001, %r23
	.word 0xba6bc00b  ! 1357: UDIVX_R	udivx 	%r15, %r11, %r29
	.word 0x9cd6c008  ! 1362: UMULcc_R	umulcc 	%r27, %r8, %r14
	.word 0xbd6b6001  ! 1367: SDIVX_I	sdivx	%r13, 0x0001, %r30
	.word 0xaa4dc007  ! 1372: MULX_R	mulx 	%r23, %r7, %r21
	.word 0x986b0009  ! 1377: UDIVX_R	udivx 	%r12, %r9, %r12
	.word 0xb0758005  ! 1382: UDIV_R	udiv 	%r22, %r5, %r24
	.word 0xa2fb801d  ! 1387: SDIVcc_R	sdivcc 	%r14, %r29, %r17
	.word 0x8c4ae001  ! 1392: MULX_I	mulx 	%r11, 0x0001, %r6
	.word 0xaef90009  ! 1397: SDIVcc_R	sdivcc 	%r4, %r9, %r23
	.word 0xbcdd6001  ! 1402: SMULcc_I	smulcc 	%r21, 0x0001, %r30
	.word 0xb16fc010  ! 1407: SDIVX_R	sdivx	%r31, %r16, %r24
	.word 0x876b4015  ! 1412: SDIVX_R	sdivx	%r13, %r21, %r3
	.word 0xc858a1b0  ! 1417: LDX_I	ldx	[%r2 + 0x01b0], %r4
	.word 0xaa49800d  ! 1422: MULX_R	mulx 	%r6, %r13, %r21
	.word 0xa84a0008  ! 1427: MULX_R	mulx 	%r8, %r8, %r20
	.word 0x946f0004  ! 1432: UDIVX_R	udivx 	%r28, %r4, %r10
	.word 0xaa6a2001  ! 1437: UDIVX_I	udivx 	%r8, 0x0001, %r21
	.word 0xa568e001  ! 1442: SDIVX_I	sdivx	%r3, 0x0001, %r18
	.word 0xbc7c6001  ! 1447: SDIV_I	sdiv 	%r17, 0x0001, %r30
	.word 0xbc682001  ! 1452: UDIVX_I	udivx 	%r0, 0x0001, %r30
	.word 0x81832001  ! 1457: WRY_I	wr	%r12, 0x0001, %y
	.word 0x904cc00e  ! 1462: MULX_R	mulx 	%r19, %r14, %r8
	.word 0xa8d7400a  ! 1467: UMULcc_R	umulcc 	%r29, %r10, %r20
	.word 0xb0f0c011  ! 1472: UDIVcc_R	udivcc 	%r3, %r17, %r24
	.word 0xbcf3400f  ! 1477: UDIVcc_R	udivcc 	%r13, %r15, %r30
	.word 0xb8550009  ! 1482: UMUL_R	umul 	%r20, %r9, %r28
	.word 0x876c0012  ! 1487: SDIVX_R	sdivx	%r16, %r18, %r3
	.word 0x94d4c01e  ! 1492: UMULcc_R	umulcc 	%r19, %r30, %r10
	.word 0xb0ff0006  ! 1497: SDIVcc_R	sdivcc 	%r28, %r6, %r24
	.word 0x9e514018  ! 1502: UMUL_R	umul 	%r5, %r24, %r15
	.word 0xaa4c2001  ! 1507: MULX_I	mulx 	%r16, 0x0001, %r21
	.word 0x8182a001  ! 1512: WRY_I	wr	%r10, 0x0001, %y
	.word 0x9b6a800b  ! 1517: SDIVX_R	sdivx	%r10, %r11, %r13
	.word 0xa76cc01e  ! 1522: SDIVX_R	sdivx	%r19, %r30, %r19
	.word 0x884e6001  ! 1527: MULX_I	mulx 	%r25, 0x0001, %r4
	.word 0xab6d6001  ! 1532: SDIVX_I	sdivx	%r21, 0x0001, %r21
	.word 0xb76f6001  ! 1537: SDIVX_I	sdivx	%r29, 0x0001, %r27
	.word 0x936ac01a  ! 1542: SDIVX_R	sdivx	%r11, %r26, %r9
	.word 0xa369800d  ! 1547: SDIVX_R	sdivx	%r6, %r13, %r17
	.word 0xb96ee001  ! 1552: SDIVX_I	sdivx	%r27, 0x0001, %r28
	.word 0x98498019  ! 1557: MULX_R	mulx 	%r6, %r25, %r12
	.word 0xa44fe001  ! 1562: MULX_I	mulx 	%r31, 0x0001, %r18
	.word 0xb16c0013  ! 1567: SDIVX_R	sdivx	%r16, %r19, %r24
	.word 0x8a5b801a  ! 1572: SMUL_R	smul 	%r14, %r26, %r5
	.word 0x886b4017  ! 1577: UDIVX_R	udivx 	%r13, %r23, %r4
	.word 0xae7b8013  ! 1582: SDIV_R	sdiv 	%r14, %r19, %r23
	.word 0x8e7b0017  ! 1587: SDIV_R	sdiv 	%r12, %r23, %r7
	.word 0xa1682001  ! 1592: SDIVX_I	sdivx	%r0, 0x0001, %r16
	.word 0x9ed92001  ! 1597: SMULcc_I	smulcc 	%r4, 0x0001, %r15
	.word 0x9d694000  ! 1602: SDIVX_R	sdivx	%r5, %r0, %r14
	.word 0xb04ea001  ! 1607: MULX_I	mulx 	%r26, 0x0001, %r24
	.word 0x8a4e400b  ! 1612: MULX_R	mulx 	%r25, %r11, %r5
	.word 0xb46e8006  ! 1617: UDIVX_R	udivx 	%r26, %r6, %r26
	.word 0x944da001  ! 1622: MULX_I	mulx 	%r22, 0x0001, %r10
	.word 0xb45ee001  ! 1627: SMUL_I	smul 	%r27, 0x0001, %r26
	.word 0xa44b4008  ! 1632: MULX_R	mulx 	%r13, %r8, %r18
	.word 0xe45862b0  ! 1637: LDX_I	ldx	[%r1 + 0x02b0], %r18
	.word 0xa16be001  ! 1642: SDIVX_I	sdivx	%r15, 0x0001, %r16
	.word 0x9c4a4010  ! 1647: MULX_R	mulx 	%r9, %r16, %r14
	.word 0xd058a058  ! 1652: LDX_I	ldx	[%r2 + 0x0058], %r8
	.word 0x904ca001  ! 1657: MULX_I	mulx 	%r18, 0x0001, %r8
	.word 0xbf6d6001  ! 1662: SDIVX_I	sdivx	%r21, 0x0001, %r31
	.word 0x926e801a  ! 1667: UDIVX_R	udivx 	%r26, %r26, %r9
	.word 0x9a6ec015  ! 1672: UDIVX_R	udivx 	%r27, %r21, %r13
	.word 0xd458a6b8  ! 1677: LDX_I	ldx	[%r2 + 0x06b8], %r10
	.word 0xba7e2001  ! 1682: SDIV_I	sdiv 	%r24, 0x0001, %r29
	.word 0xb8d0c007  ! 1687: UMULcc_R	umulcc 	%r3, %r7, %r28
	.word 0x9e6d0017  ! 1692: UDIVX_R	udivx 	%r20, %r23, %r15
	.word 0x9668e001  ! 1697: UDIVX_I	udivx 	%r3, 0x0001, %r11
	.word 0x946d8012  ! 1702: UDIVX_R	udivx 	%r22, %r18, %r10
	.word 0xae6a8019  ! 1707: UDIVX_R	udivx 	%r10, %r25, %r23
	.word 0x946d400d  ! 1712: UDIVX_R	udivx 	%r21, %r13, %r10
	.word 0xb44ee001  ! 1717: MULX_I	mulx 	%r27, 0x0001, %r26
	.word 0xb8fe0007  ! 1722: SDIVcc_R	sdivcc 	%r24, %r7, %r28
	.word 0xb0f82001  ! 1727: SDIVcc_I	sdivcc 	%r0, 0x0001, %r24
	.word 0xbe7a001a  ! 1732: SDIV_R	sdiv 	%r8, %r26, %r31
	.word 0xb2f8000f  ! 1737: SDIVcc_R	sdivcc 	%r0, %r15, %r25
	.word 0x876b0017  ! 1742: SDIVX_R	sdivx	%r12, %r23, %r3
	.word 0x8185e001  ! 1747: WRY_I	wr	%r23, 0x0001, %y
	.word 0xa26fe001  ! 1752: UDIVX_I	udivx 	%r31, 0x0001, %r17
	.word 0x8182a001  ! 1757: WRY_I	wr	%r10, 0x0001, %y
	.word 0xb855000d  ! 1762: UMUL_R	umul 	%r20, %r13, %r28
	.word 0x8a68001a  ! 1767: UDIVX_R	udivx 	%r0, %r26, %r5
	.word 0xb06a4013  ! 1772: UDIVX_R	udivx 	%r9, %r19, %r24
	.word 0x925c8005  ! 1777: SMUL_R	smul 	%r18, %r5, %r9
	.word 0x81816001  ! 1782: WRY_I	wr	%r5, 0x0001, %y
	.word 0xb56d0006  ! 1787: SDIVX_R	sdivx	%r20, %r6, %r26
	.word 0xa27f400a  ! 1792: SDIV_R	sdiv 	%r29, %r10, %r17
	.word 0xb76b4010  ! 1797: SDIVX_R	sdivx	%r13, %r16, %r27
	.word 0x95200004  ! 1802: MULScc_R	mulscc 	%r0, %r4, %r10
	.word 0x896e001d  ! 1807: SDIVX_R	sdivx	%r24, %r29, %r4
	.word 0xaa4c800a  ! 1812: MULX_R	mulx 	%r18, %r10, %r21
	.word 0xb6744003  ! 1817: UDIV_R	udiv 	%r17, %r3, %r27
	.word 0x8c6f0003  ! 1822: UDIVX_R	udivx 	%r28, %r3, %r6
	.word 0x9124c01f  ! 1827: MULScc_R	mulscc 	%r19, %r31, %r8
	.word 0xec58a738  ! 1832: LDX_I	ldx	[%r2 + 0x0738], %r22
	.word 0xb6f5e001  ! 1837: UDIVcc_I	udivcc 	%r23, 0x0001, %r27
	.word 0x9e4c0010  ! 1842: MULX_R	mulx 	%r16, %r16, %r15
	.word 0x9efe000e  ! 1847: SDIVcc_R	sdivcc 	%r24, %r14, %r15
	.word 0x944f0016  ! 1852: MULX_R	mulx 	%r28, %r22, %r10
	.word 0x8a4d8018  ! 1857: MULX_R	mulx 	%r22, %r24, %r5
	.word 0xb96fc018  ! 1862: SDIVX_R	sdivx	%r31, %r24, %r28
	.word 0x88562001  ! 1867: UMUL_I	umul 	%r24, 0x0001, %r4
	.word 0x8a6ac00f  ! 1872: UDIVX_R	udivx 	%r11, %r15, %r5
	.word 0xb24d401b  ! 1877: MULX_R	mulx 	%r21, %r27, %r25
	.word 0x8a4d2001  ! 1882: MULX_I	mulx 	%r20, 0x0001, %r5
	.word 0xb66a0000  ! 1887: UDIVX_R	udivx 	%r8, %r0, %r27
	.word 0xbb6c2001  ! 1892: SDIVX_I	sdivx	%r16, 0x0001, %r29
	.word 0xb6496001  ! 1897: MULX_I	mulx 	%r5, 0x0001, %r27
	.word 0x866d8015  ! 1902: UDIVX_R	udivx 	%r22, %r21, %r3
	.word 0x887c8006  ! 1907: SDIV_R	sdiv 	%r18, %r6, %r4
	.word 0x9af00015  ! 1912: UDIVcc_R	udivcc 	%r0, %r21, %r13
	.word 0xb2f1e001  ! 1917: UDIVcc_I	udivcc 	%r7, 0x0001, %r25
	.word 0x8a518010  ! 1922: UMUL_R	umul 	%r6, %r16, %r5
	.word 0xa4d18009  ! 1927: UMULcc_R	umulcc 	%r6, %r9, %r18
	.word 0xbe592001  ! 1932: SMUL_I	smul 	%r4, 0x0001, %r31
	.word 0xbc480010  ! 1937: MULX_R	mulx 	%r0, %r16, %r30
	.word 0xb46b001e  ! 1942: UDIVX_R	udivx 	%r12, %r30, %r26
	.word 0xbe492001  ! 1947: MULX_I	mulx 	%r4, 0x0001, %r31
	.word 0xac4b6001  ! 1952: MULX_I	mulx 	%r13, 0x0001, %r22
	.word 0x916d0008  ! 1957: SDIVX_R	sdivx	%r20, %r8, %r8
	.word 0xac50c015  ! 1962: UMUL_R	umul 	%r3, %r21, %r22
	.word 0x8c6f8004  ! 1967: UDIVX_R	udivx 	%r30, %r4, %r6
	.word 0x96796001  ! 1972: SDIV_I	sdiv 	%r5, 0x0001, %r11
	.word 0xa848c019  ! 1977: MULX_R	mulx 	%r3, %r25, %r20
	.word 0xb86d4007  ! 1982: UDIVX_R	udivx 	%r21, %r7, %r28
	.word 0xa06d8016  ! 1987: UDIVX_R	udivx 	%r22, %r22, %r16
	.word 0xbc4dc017  ! 1992: MULX_R	mulx 	%r23, %r23, %r30
	.word 0x936f6001  ! 1997: SDIVX_I	sdivx	%r29, 0x0001, %r9
	.word 0x964ee001  ! 2002: MULX_I	mulx 	%r27, 0x0001, %r11
	.word 0xa0d00004  ! 2007: UMULcc_R	umulcc 	%r0, %r4, %r16
	.word 0xaa5e0005  ! 2012: SMUL_R	smul 	%r24, %r5, %r21
	.word 0xa923801a  ! 2017: MULScc_R	mulscc 	%r14, %r26, %r20
	.word 0xd85861c0  ! 2022: LDX_I	ldx	[%r1 + 0x01c0], %r12
	.word 0x94482001  ! 2027: MULX_I	mulx 	%r0, 0x0001, %r10
	.word 0xa84ca001  ! 2032: MULX_I	mulx 	%r18, 0x0001, %r20
	.word 0x966d800b  ! 2037: UDIVX_R	udivx 	%r22, %r11, %r11
	.word 0xac4d6001  ! 2042: MULX_I	mulx 	%r21, 0x0001, %r22
	.word 0x9a6ea001  ! 2047: UDIVX_I	udivx 	%r26, 0x0001, %r13
	.word 0xb2492001  ! 2052: MULX_I	mulx 	%r4, 0x0001, %r25
	.word 0xb6fd801c  ! 2057: SDIVcc_R	sdivcc 	%r22, %r28, %r27
	.word 0xb64b8009  ! 2062: MULX_R	mulx 	%r14, %r9, %r27
	.word 0x9e6cc000  ! 2067: UDIVX_R	udivx 	%r19, %r0, %r15
	.word 0xb568001a  ! 2072: SDIVX_R	sdivx	%r0, %r26, %r26
	.word 0xbe4e8006  ! 2077: MULX_R	mulx 	%r26, %r6, %r31
	.word 0xba69800f  ! 2082: UDIVX_R	udivx 	%r6, %r15, %r29
	.word 0xa0694016  ! 2087: UDIVX_R	udivx 	%r5, %r22, %r16
	.word 0xba6c401c  ! 2092: UDIVX_R	udivx 	%r17, %r28, %r29
	.word 0xa85e8011  ! 2097: SMUL_R	smul 	%r26, %r17, %r20
	.word 0xb36aa001  ! 2102: SDIVX_I	sdivx	%r10, 0x0001, %r25
	.word 0xa8f6400f  ! 2107: UDIVcc_R	udivcc 	%r25, %r15, %r20
	.word 0xbafba001  ! 2112: SDIVcc_I	sdivcc 	%r14, 0x0001, %r29
	.word 0xc6586758  ! 2117: LDX_I	ldx	[%r1 + 0x0758], %r3
	.word 0x86f74003  ! 2122: UDIVcc_R	udivcc 	%r29, %r3, %r3
	.word 0x9cfee001  ! 2127: SDIVcc_I	sdivcc 	%r27, 0x0001, %r14
	.word 0x9adb8018  ! 2132: SMULcc_R	smulcc 	%r14, %r24, %r13
	.word 0x9454a001  ! 2137: UMUL_I	umul 	%r18, 0x0001, %r10
	.word 0x887d6001  ! 2142: SDIV_I	sdiv 	%r21, 0x0001, %r4
	.word 0xb64ac017  ! 2147: MULX_R	mulx 	%r11, %r23, %r27
	.word 0xad6ee001  ! 2152: SDIVX_I	sdivx	%r27, 0x0001, %r22
	.word 0x92f96001  ! 2157: SDIVcc_I	sdivcc 	%r5, 0x0001, %r9
	.word 0xa6534015  ! 2162: UMUL_R	umul 	%r13, %r21, %r19
	.word 0x86fc801c  ! 2167: SDIVcc_R	sdivcc 	%r18, %r28, %r3
	.word 0xb07dc007  ! 2172: SDIV_R	sdiv 	%r23, %r7, %r24
	.word 0xacff401a  ! 2177: SDIVcc_R	sdivcc 	%r29, %r26, %r22
	.word 0x81836001  ! 2182: WRY_I	wr	%r13, 0x0001, %y
	.word 0xaa4d2001  ! 2187: MULX_I	mulx 	%r20, 0x0001, %r21
	.word 0x896aa001  ! 2192: SDIVX_I	sdivx	%r10, 0x0001, %r4
	.word 0xae7ba001  ! 2197: SDIV_I	sdiv 	%r14, 0x0001, %r23
	.word 0xbcf3401b  ! 2202: UDIVcc_R	udivcc 	%r13, %r27, %r30
	.word 0xbcd98019  ! 2207: SMULcc_R	smulcc 	%r6, %r25, %r30
	.word 0x9cf4c015  ! 2212: UDIVcc_R	udivcc 	%r19, %r21, %r14
	.word 0xae70e001  ! 2217: UDIV_I	udiv 	%r3, 0x0001, %r23
	.word 0x8876c012  ! 2222: UDIV_R	udiv 	%r27, %r18, %r4
	.word 0xbad64005  ! 2227: UMULcc_R	umulcc 	%r25, %r5, %r29
	.word 0xa26a0007  ! 2232: UDIVX_R	udivx 	%r8, %r7, %r17
	.word 0x88f5e001  ! 2237: UDIVcc_I	udivcc 	%r23, 0x0001, %r4
	.word 0xac6c801c  ! 2242: UDIVX_R	udivx 	%r18, %r28, %r22
	.word 0x90d30013  ! 2247: UMULcc_R	umulcc 	%r12, %r19, %r8
	.word 0x956fe001  ! 2252: SDIVX_I	sdivx	%r31, 0x0001, %r10
	.word 0x8c4f801d  ! 2257: MULX_R	mulx 	%r30, %r29, %r6
	.word 0x86502001  ! 2262: UMUL_I	umul 	%r0, 0x0001, %r3
	.word 0x926aa001  ! 2267: UDIVX_I	udivx 	%r10, 0x0001, %r9
	.word 0xb64b801e  ! 2272: MULX_R	mulx 	%r14, %r30, %r27
	.word 0x8cf72001  ! 2277: UDIVcc_I	udivcc 	%r28, 0x0001, %r6
	.word 0xb2690010  ! 2282: UDIVX_R	udivx 	%r4, %r16, %r25
	.word 0xfc5861e8  ! 2287: LDX_I	ldx	[%r1 + 0x01e8], %r30
	.word 0xa26b4014  ! 2292: UDIVX_R	udivx 	%r13, %r20, %r17
	.word 0x9f6f801b  ! 2297: SDIVX_R	sdivx	%r30, %r27, %r15
	.word 0xa24e6001  ! 2302: MULX_I	mulx 	%r25, 0x0001, %r17
	.word 0x8af80005  ! 2307: SDIVcc_R	sdivcc 	%r0, %r5, %r5
	.word 0x9c512001  ! 2312: UMUL_I	umul 	%r4, 0x0001, %r14
	.word 0x996d800a  ! 2317: SDIVX_R	sdivx	%r22, %r10, %r12
	.word 0x936a6001  ! 2322: SDIVX_I	sdivx	%r9, 0x0001, %r9
	.word 0x81802001  ! 2327: WRY_I	wr	%r0, 0x0001, %y
	.word 0xba6a6001  ! 2332: UDIVX_I	udivx 	%r9, 0x0001, %r29
	.word 0x8ad4c00d  ! 2337: UMULcc_R	umulcc 	%r19, %r13, %r5
	.word 0xb3680007  ! 2342: SDIVX_R	sdivx	%r0, %r7, %r25
	.word 0xbe580006  ! 2347: SMUL_R	smul 	%r0, %r6, %r31
	.word 0x8b6ac013  ! 2352: SDIVX_R	sdivx	%r11, %r19, %r5
	.word 0xa849c00e  ! 2357: MULX_R	mulx 	%r7, %r14, %r20
	.word 0xb472e001  ! 2362: UDIV_I	udiv 	%r11, 0x0001, %r26
	.word 0xa5680010  ! 2367: SDIVX_R	sdivx	%r0, %r16, %r18
	.word 0x906ec012  ! 2372: UDIVX_R	udivx 	%r27, %r18, %r8
	.word 0xa0f0c010  ! 2377: UDIVcc_R	udivcc 	%r3, %r16, %r16
	.word 0xbd6f8007  ! 2382: SDIVX_R	sdivx	%r30, %r7, %r30
	.word 0xa322a001  ! 2387: MULScc_I	mulscc 	%r10, 0x0001, %r17
	.word 0xbf6c8015  ! 2392: SDIVX_R	sdivx	%r18, %r21, %r31
	.word 0xbe4f4016  ! 2397: MULX_R	mulx 	%r29, %r22, %r31
	.word 0x8e5b0013  ! 2402: SMUL_R	smul 	%r12, %r19, %r7
	.word 0xbf6ec000  ! 2407: SDIVX_R	sdivx	%r27, %r0, %r31
	.word 0x8cfd400e  ! 2412: SDIVcc_R	sdivcc 	%r21, %r14, %r6
	.word 0xb4690000  ! 2417: UDIVX_R	udivx 	%r4, %r0, %r26
	.word 0xba58c000  ! 2422: SMUL_R	smul 	%r3, %r0, %r29
	.word 0xb7690017  ! 2427: SDIVX_R	sdivx	%r4, %r23, %r27
	.word 0x9ed46001  ! 2432: UMULcc_I	umulcc 	%r17, 0x0001, %r15
	.word 0xa324000e  ! 2437: MULScc_R	mulscc 	%r16, %r14, %r17
	.word 0xbe696001  ! 2442: UDIVX_I	udivx 	%r5, 0x0001, %r31
	.word 0xb0da6001  ! 2447: SMULcc_I	smulcc 	%r9, 0x0001, %r24
	.word 0x8f6c4014  ! 2452: SDIVX_R	sdivx	%r17, %r20, %r7
	.word 0xbcda8013  ! 2457: SMULcc_R	smulcc 	%r10, %r19, %r30
	.word 0x984cc005  ! 2462: MULX_R	mulx 	%r19, %r5, %r12
	.word 0x936dc005  ! 2467: SDIVX_R	sdivx	%r23, %r5, %r9
	.word 0x92f7e001  ! 2472: UDIVcc_I	udivcc 	%r31, 0x0001, %r9
	.word 0x965dc012  ! 2477: SMUL_R	smul 	%r23, %r18, %r11
	.word 0x904b2001  ! 2482: MULX_I	mulx 	%r12, 0x0001, %r8
	.word 0x884f6001  ! 2487: MULX_I	mulx 	%r29, 0x0001, %r4
	.word 0xb64ae001  ! 2492: MULX_I	mulx 	%r11, 0x0001, %r27
	.word 0xa4da4007  ! 2497: SMULcc_R	smulcc 	%r9, %r7, %r18
	.word 0x9b6dc01f  ! 2502: SDIVX_R	sdivx	%r23, %r31, %r13
	.word 0x987f400d  ! 2507: SDIV_R	sdiv 	%r29, %r13, %r12
	.word 0xb86d8003  ! 2512: UDIVX_R	udivx 	%r22, %r3, %r28
	.word 0xbe6da001  ! 2517: UDIVX_I	udivx 	%r22, 0x0001, %r31
	.word 0x9d6a0000  ! 2522: SDIVX_R	sdivx	%r8, %r0, %r14
	.word 0xad6a2001  ! 2527: SDIVX_I	sdivx	%r8, 0x0001, %r22
	.word 0x81862001  ! 2532: WRY_I	wr	%r24, 0x0001, %y
	.word 0x8f6e8008  ! 2537: SDIVX_R	sdivx	%r26, %r8, %r7
	.word 0x926d4019  ! 2542: UDIVX_R	udivx 	%r21, %r25, %r9
	.word 0xaa4fc00a  ! 2547: MULX_R	mulx 	%r31, %r10, %r21
	.word 0xa84da001  ! 2552: MULX_I	mulx 	%r22, 0x0001, %r20
	.word 0x92498011  ! 2557: MULX_R	mulx 	%r6, %r17, %r9
	.word 0x8a4f2001  ! 2562: MULX_I	mulx 	%r28, 0x0001, %r5
	.word 0x9d6d800c  ! 2567: SDIVX_R	sdivx	%r22, %r12, %r14
	.word 0xa07f4015  ! 2572: SDIV_R	sdiv 	%r29, %r21, %r16
	.word 0xb04b8019  ! 2577: MULX_R	mulx 	%r14, %r25, %r24
	.word 0xb6f18014  ! 2582: UDIVcc_R	udivcc 	%r6, %r20, %r27
	.word 0x90f74000  ! 2587: UDIVcc_R	udivcc 	%r29, %r0, %r8
	.word 0xbd68c019  ! 2592: SDIVX_R	sdivx	%r3, %r25, %r30
	.word 0xba4c801d  ! 2597: MULX_R	mulx 	%r18, %r29, %r29
	.word 0xa569c005  ! 2602: SDIVX_R	sdivx	%r7, %r5, %r18
	.word 0x9e5d2001  ! 2607: SMUL_I	smul 	%r20, 0x0001, %r15
	.word 0xb069a001  ! 2612: UDIVX_I	udivx 	%r6, 0x0001, %r24
	.word 0x9668001e  ! 2617: UDIVX_R	udivx 	%r0, %r30, %r11
	.word 0xa04e4018  ! 2622: MULX_R	mulx 	%r25, %r24, %r16
	.word 0xb255e001  ! 2627: UMUL_I	umul 	%r23, 0x0001, %r25
	.word 0xbe696001  ! 2632: UDIVX_I	udivx 	%r5, 0x0001, %r31
	.word 0xa4d5c000  ! 2637: UMULcc_R	umulcc 	%r23, %r0, %r18
	.word 0xbcfaa001  ! 2642: SDIVcc_I	sdivcc 	%r10, 0x0001, %r30
	.word 0xaa4a2001  ! 2647: MULX_I	mulx 	%r8, 0x0001, %r21
	.word 0xb07b4016  ! 2652: SDIV_R	sdiv 	%r13, %r22, %r24
	.word 0xb27a6001  ! 2657: SDIV_I	sdiv 	%r9, 0x0001, %r25
	.word 0xbb6e8006  ! 2662: SDIVX_R	sdivx	%r26, %r6, %r29
	.word 0xba68001a  ! 2667: UDIVX_R	udivx 	%r0, %r26, %r29
	.word 0xb322400a  ! 2672: MULScc_R	mulscc 	%r9, %r10, %r25
	.word 0x94f0c01d  ! 2677: UDIVcc_R	udivcc 	%r3, %r29, %r10
	.word 0xb04da001  ! 2682: MULX_I	mulx 	%r22, 0x0001, %r24
	.word 0xa84c0014  ! 2687: MULX_R	mulx 	%r16, %r20, %r20
	.word 0xbe568009  ! 2692: UMUL_R	umul 	%r26, %r9, %r31
	.word 0xde58a258  ! 2697: LDX_I	ldx	[%r2 + 0x0258], %r15
	.word 0xa249a001  ! 2702: MULX_I	mulx 	%r6, 0x0001, %r17
	.word 0x8c4a6001  ! 2707: MULX_I	mulx 	%r9, 0x0001, %r6
	.word 0x92d80018  ! 2712: SMULcc_R	smulcc 	%r0, %r24, %r9
	.word 0xa26e6001  ! 2717: UDIVX_I	udivx 	%r25, 0x0001, %r17
	.word 0x9e4aa001  ! 2722: MULX_I	mulx 	%r10, 0x0001, %r15
	.word 0x9a49a001  ! 2727: MULX_I	mulx 	%r6, 0x0001, %r13
	.word 0x876d2001  ! 2732: SDIVX_I	sdivx	%r20, 0x0001, %r3
	.word 0xb4fb4018  ! 2737: SDIVcc_R	sdivcc 	%r13, %r24, %r26
	.word 0xaa4f4014  ! 2742: MULX_R	mulx 	%r29, %r20, %r21
	.word 0xaa6d0016  ! 2747: UDIVX_R	udivx 	%r20, %r22, %r21
	.word 0xac6a8018  ! 2752: UDIVX_R	udivx 	%r10, %r24, %r22
	.word 0x89258006  ! 2757: MULScc_R	mulscc 	%r22, %r6, %r4
	.word 0x907d001e  ! 2762: SDIV_R	sdiv 	%r20, %r30, %r8
	.word 0x884f400e  ! 2767: MULX_R	mulx 	%r29, %r14, %r4
	.word 0xae76a001  ! 2772: UDIV_I	udiv 	%r26, 0x0001, %r23
	.word 0xb76f4018  ! 2777: SDIVX_R	sdivx	%r29, %r24, %r27
	.word 0x9b6cc015  ! 2782: SDIVX_R	sdivx	%r19, %r21, %r13
	.word 0xf6586678  ! 2787: LDX_I	ldx	[%r1 + 0x0678], %r27
	.word 0xae542001  ! 2792: UMUL_I	umul 	%r16, 0x0001, %r23
	.word 0x9e764009  ! 2797: UDIV_R	udiv 	%r25, %r9, %r15
	.word 0xb04f2001  ! 2802: MULX_I	mulx 	%r28, 0x0001, %r24
	.word 0xb2578017  ! 2807: UMUL_R	umul 	%r30, %r23, %r25
	.word 0xa26b2001  ! 2812: UDIVX_I	udivx 	%r12, 0x0001, %r17
	.word 0xa6d50005  ! 2817: UMULcc_R	umulcc 	%r20, %r5, %r19
	.word 0xbcf70011  ! 2822: UDIVcc_R	udivcc 	%r28, %r17, %r30
	.word 0x9a6e8011  ! 2827: UDIVX_R	udivx 	%r26, %r17, %r13
	.word 0xb04a001c  ! 2832: MULX_R	mulx 	%r8, %r28, %r24
	.word 0xbc57401c  ! 2837: UMUL_R	umul 	%r29, %r28, %r30
	.word 0x8efc0018  ! 2842: SDIVcc_R	sdivcc 	%r16, %r24, %r7
	.word 0x8c6f4015  ! 2847: UDIVX_R	udivx 	%r29, %r21, %r6
	.word 0x9a6f2001  ! 2852: UDIVX_I	udivx 	%r28, 0x0001, %r13
	.word 0x936b6001  ! 2857: SDIVX_I	sdivx	%r13, 0x0001, %r9
	.word 0xb4dda001  ! 2862: SMULcc_I	smulcc 	%r22, 0x0001, %r26
	.word 0xb6f10011  ! 2867: UDIVcc_R	udivcc 	%r4, %r17, %r27
	.word 0x924c0016  ! 2872: MULX_R	mulx 	%r16, %r22, %r9
	.word 0x8a49e001  ! 2877: MULX_I	mulx 	%r7, 0x0001, %r5
	.word 0xb04de001  ! 2882: MULX_I	mulx 	%r23, 0x0001, %r24
	.word 0xbe6fc003  ! 2887: UDIVX_R	udivx 	%r31, %r3, %r31
	.word 0xa44e4016  ! 2892: MULX_R	mulx 	%r25, %r22, %r18
	.word 0x9a680008  ! 2897: UDIVX_R	udivx 	%r0, %r8, %r13
	.word 0xee58a008  ! 2902: LDX_I	ldx	[%r2 + 0x0008], %r23
	.word 0x866e0017  ! 2907: UDIVX_R	udivx 	%r24, %r23, %r3
	.word 0xa84c401e  ! 2912: MULX_R	mulx 	%r17, %r30, %r20
	.word 0xa56e0017  ! 2917: SDIVX_R	sdivx	%r24, %r23, %r18
	.word 0x876a4003  ! 2922: SDIVX_R	sdivx	%r9, %r3, %r3
	.word 0xa24f2001  ! 2927: MULX_I	mulx 	%r28, 0x0001, %r17
	.word 0x996e8010  ! 2932: SDIVX_R	sdivx	%r26, %r16, %r12
	.word 0x8185e001  ! 2937: WRY_I	wr	%r23, 0x0001, %y
	.word 0xa66dc014  ! 2942: UDIVX_R	udivx 	%r23, %r20, %r19
	.word 0xbf6c4000  ! 2947: SDIVX_R	sdivx	%r17, %r0, %r31
	.word 0xa46ac00d  ! 2952: UDIVX_R	udivx 	%r11, %r13, %r18
	.word 0xb0d52001  ! 2957: UMULcc_I	umulcc 	%r20, 0x0001, %r24
	.word 0x987e6001  ! 2962: SDIV_I	sdiv 	%r25, 0x0001, %r12
	.word 0xbc7da001  ! 2967: SDIV_I	sdiv 	%r22, 0x0001, %r30
	.word 0xa0fec00d  ! 2972: SDIVcc_R	sdivcc 	%r27, %r13, %r16
	.word 0x927e0014  ! 2977: SDIV_R	sdiv 	%r24, %r20, %r9
	.word 0xbd6a6001  ! 2982: SDIVX_I	sdivx	%r9, 0x0001, %r30
	.word 0x8ad7c00e  ! 2987: UMULcc_R	umulcc 	%r31, %r14, %r5
	.word 0xb46f8010  ! 2992: UDIVX_R	udivx 	%r30, %r16, %r26
	.word 0xae68c01b  ! 2997: UDIVX_R	udivx 	%r3, %r27, %r23
	.word 0x81856001  ! 3002: WRY_I	wr	%r21, 0x0001, %y
	.word 0xa46bc00f  ! 3007: UDIVX_R	udivx 	%r15, %r15, %r18
	.word 0x8186e001  ! 3012: WRY_I	wr	%r27, 0x0001, %y
	.word 0x904d6001  ! 3017: MULX_I	mulx 	%r21, 0x0001, %r8
	.word 0x96da2001  ! 3022: SMULcc_I	smulcc 	%r8, 0x0001, %r11
	.word 0xca5866d8  ! 3027: LDX_I	ldx	[%r1 + 0x06d8], %r5
	.word 0x946b8019  ! 3032: UDIVX_R	udivx 	%r14, %r25, %r10
	.word 0xbb6cc011  ! 3037: SDIVX_R	sdivx	%r19, %r17, %r29
	.word 0xbe4fe001  ! 3042: MULX_I	mulx 	%r31, 0x0001, %r31
	.word 0xa24dc000  ! 3047: MULX_R	mulx 	%r23, %r0, %r17
	.word 0x864ca001  ! 3052: MULX_I	mulx 	%r18, 0x0001, %r3
	.word 0x8ad0000b  ! 3057: UMULcc_R	umulcc 	%r0, %r11, %r5
	.word 0x88fba001  ! 3062: SDIVcc_I	sdivcc 	%r14, 0x0001, %r4
	.word 0x92df8019  ! 3067: SMULcc_R	smulcc 	%r30, %r25, %r9
	.word 0x8a7ba001  ! 3072: SDIV_I	sdiv 	%r14, 0x0001, %r5
	.word 0xa46f8019  ! 3077: UDIVX_R	udivx 	%r30, %r25, %r18
	.word 0x92f8c018  ! 3082: SDIVcc_R	sdivcc 	%r3, %r24, %r9
	.word 0x864cc01c  ! 3087: MULX_R	mulx 	%r19, %r28, %r3
	.word 0xf6586548  ! 3092: LDX_I	ldx	[%r1 + 0x0548], %r27
	.word 0xa6582001  ! 3097: SMUL_I	smul 	%r0, 0x0001, %r19
	.word 0x8a4c6001  ! 3102: MULX_I	mulx 	%r17, 0x0001, %r5
	.word 0x9cf0e001  ! 3107: UDIVcc_I	udivcc 	%r3, 0x0001, %r14
	.word 0x91694010  ! 3112: SDIVX_R	sdivx	%r5, %r16, %r8
	.word 0xa36a2001  ! 3117: SDIVX_I	sdivx	%r8, 0x0001, %r17
	.word 0xa8d22001  ! 3122: UMULcc_I	umulcc 	%r8, 0x0001, %r20
	.word 0x98f3e001  ! 3127: UDIVcc_I	udivcc 	%r15, 0x0001, %r12
	.word 0xf6586608  ! 3132: LDX_I	ldx	[%r1 + 0x0608], %r27
	.word 0xb06e4000  ! 3137: UDIVX_R	udivx 	%r25, %r0, %r24
	.word 0xb6dee001  ! 3142: SMULcc_I	smulcc 	%r27, 0x0001, %r27
	.word 0x8c72a001  ! 3147: UDIV_I	udiv 	%r10, 0x0001, %r6
	.word 0xa44e401a  ! 3152: MULX_R	mulx 	%r25, %r26, %r18
	.word 0xb84d800d  ! 3157: MULX_R	mulx 	%r22, %r13, %r28
	.word 0x8849001c  ! 3162: MULX_R	mulx 	%r4, %r28, %r4
	.word 0xb66e4003  ! 3167: UDIVX_R	udivx 	%r25, %r3, %r27
	.word 0x92572001  ! 3172: UMUL_I	umul 	%r28, 0x0001, %r9
	.word 0x9369a001  ! 3177: SDIVX_I	sdivx	%r6, 0x0001, %r9
	.word 0x9920e001  ! 3182: MULScc_I	mulscc 	%r3, 0x0001, %r12
	.word 0x8181e001  ! 3187: WRY_I	wr	%r7, 0x0001, %y
	.word 0xa853c007  ! 3192: UMUL_R	umul 	%r15, %r7, %r20
	.word 0xae536001  ! 3197: UMUL_I	umul 	%r13, 0x0001, %r23
	.word 0xb477c00c  ! 3202: UDIV_R	udiv 	%r31, %r12, %r26
	.word 0x8efb0013  ! 3207: SDIVcc_R	sdivcc 	%r12, %r19, %r7
	.word 0x92fda001  ! 3212: SDIVcc_I	sdivcc 	%r22, 0x0001, %r9
	.word 0xa2714007  ! 3217: UDIV_R	udiv 	%r5, %r7, %r17
	.word 0xa524e001  ! 3222: MULScc_I	mulscc 	%r19, 0x0001, %r18
	.word 0x884aa001  ! 3227: MULX_I	mulx 	%r10, 0x0001, %r4
	.word 0x96d72001  ! 3232: UMULcc_I	umulcc 	%r28, 0x0001, %r11
	.word 0xaa4d000d  ! 3237: MULX_R	mulx 	%r20, %r13, %r21
	.word 0x876d2001  ! 3242: SDIVX_I	sdivx	%r20, 0x0001, %r3
	.word 0xa8d1801d  ! 3247: UMULcc_R	umulcc 	%r6, %r29, %r20
	.word 0xb46ca001  ! 3252: UDIVX_I	udivx 	%r18, 0x0001, %r26
	.word 0xb6702001  ! 3257: UDIV_I	udiv 	%r0, 0x0001, %r27
	.word 0x8181a001  ! 3262: WRY_I	wr	%r6, 0x0001, %y
	.word 0x98548013  ! 3267: UMUL_R	umul 	%r18, %r19, %r12
	.word 0xee58a128  ! 3272: LDX_I	ldx	[%r2 + 0x0128], %r23
	.word 0x8b6c2001  ! 3277: SDIVX_I	sdivx	%r16, 0x0001, %r5
	.word 0xa0d96001  ! 3282: SMULcc_I	smulcc 	%r5, 0x0001, %r16
	.word 0x8649a001  ! 3287: MULX_I	mulx 	%r6, 0x0001, %r3
	.word 0x9a49a001  ! 3292: MULX_I	mulx 	%r6, 0x0001, %r13
	.word 0x924d6001  ! 3297: MULX_I	mulx 	%r21, 0x0001, %r9
	.word 0x88690000  ! 3302: UDIVX_R	udivx 	%r4, %r0, %r4
	.word 0xa76d8016  ! 3307: SDIVX_R	sdivx	%r22, %r22, %r19
	.word 0xee58a758  ! 3312: LDX_I	ldx	[%r2 + 0x0758], %r23
	.word 0xac4e6001  ! 3317: MULX_I	mulx 	%r25, 0x0001, %r22
	.word 0x81846001  ! 3322: WRY_I	wr	%r17, 0x0001, %y
	.word 0x8678c009  ! 3327: SDIV_R	sdiv 	%r3, %r9, %r3
	.word 0x9c6b0016  ! 3332: UDIVX_R	udivx 	%r12, %r22, %r14
	.word 0x8181a001  ! 3337: WRY_I	wr	%r6, 0x0001, %y
	.word 0x8d6d6001  ! 3342: SDIVX_I	sdivx	%r21, 0x0001, %r6
	.word 0xaa6e2001  ! 3347: UDIVX_I	udivx 	%r24, 0x0001, %r21
	.word 0xa27ba001  ! 3352: SDIV_I	sdiv 	%r14, 0x0001, %r17
	.word 0x876a4007  ! 3357: SDIVX_R	sdivx	%r9, %r7, %r3
	.word 0xae6d4006  ! 3362: UDIVX_R	udivx 	%r21, %r6, %r23
	.word 0xacd02001  ! 3367: UMULcc_I	umulcc 	%r0, 0x0001, %r22
	.word 0x94d4e001  ! 3372: UMULcc_I	umulcc 	%r19, 0x0001, %r10
	.word 0xbe4be001  ! 3377: MULX_I	mulx 	%r15, 0x0001, %r31
	.word 0x916cc000  ! 3382: SDIVX_R	sdivx	%r19, %r0, %r8
	.word 0xa24e2001  ! 3387: MULX_I	mulx 	%r24, 0x0001, %r17
	.word 0x96f02001  ! 3392: UDIVcc_I	udivcc 	%r0, 0x0001, %r11
	.word 0x8720e001  ! 3397: MULScc_I	mulscc 	%r3, 0x0001, %r3
	.word 0x9920001a  ! 3402: MULScc_R	mulscc 	%r0, %r26, %r12
	.word 0xbcfca001  ! 3407: SDIVcc_I	sdivcc 	%r18, 0x0001, %r30
	.word 0xa84f2001  ! 3412: MULX_I	mulx 	%r28, 0x0001, %r20
	.word 0x88482001  ! 3417: MULX_I	mulx 	%r0, 0x0001, %r4
	.word 0xb0f36001  ! 3422: UDIVcc_I	udivcc 	%r13, 0x0001, %r24
	.word 0xa16be001  ! 3427: SDIVX_I	sdivx	%r15, 0x0001, %r16
	.word 0xb06fc004  ! 3432: UDIVX_R	udivx 	%r31, %r4, %r24
	.word 0xa84d6001  ! 3437: MULX_I	mulx 	%r21, 0x0001, %r20
	.word 0xbb6e6001  ! 3442: SDIVX_I	sdivx	%r25, 0x0001, %r29
	.word 0x96d82001  ! 3447: SMULcc_I	smulcc 	%r0, 0x0001, %r11
	.word 0x9e4d401e  ! 3452: MULX_R	mulx 	%r21, %r30, %r15
	.word 0x8675a001  ! 3457: UDIV_I	udiv 	%r22, 0x0001, %r3
	.word 0xb055a001  ! 3462: UMUL_I	umul 	%r22, 0x0001, %r24
	.word 0xaaf3c00c  ! 3467: UDIVcc_R	udivcc 	%r15, %r12, %r21
	.word 0x9c4ee001  ! 3472: MULX_I	mulx 	%r27, 0x0001, %r14
	.word 0x9c4c4019  ! 3477: MULX_R	mulx 	%r17, %r25, %r14
	.word 0xb46d001e  ! 3482: UDIVX_R	udivx 	%r20, %r30, %r26
	.word 0x8efae001  ! 3487: SDIVcc_I	sdivcc 	%r11, 0x0001, %r7
	.word 0xb44d8009  ! 3492: MULX_R	mulx 	%r22, %r9, %r26
	.word 0x81856001  ! 3497: WRY_I	wr	%r21, 0x0001, %y
	.word 0x984ca001  ! 3502: MULX_I	mulx 	%r18, 0x0001, %r12
	.word 0x944ce001  ! 3507: MULX_I	mulx 	%r19, 0x0001, %r10
	.word 0x926c801c  ! 3512: UDIVX_R	udivx 	%r18, %r28, %r9
	.word 0x9a69c000  ! 3517: UDIVX_R	udivx 	%r7, %r0, %r13
	.word 0x9649c011  ! 3522: MULX_R	mulx 	%r7, %r17, %r11
	.word 0xac4ae001  ! 3527: MULX_I	mulx 	%r11, 0x0001, %r22
	.word 0xb76b800a  ! 3532: SDIVX_R	sdivx	%r14, %r10, %r27
	.word 0x9edee001  ! 3537: SMULcc_I	smulcc 	%r27, 0x0001, %r15
	.word 0xa477401e  ! 3542: UDIV_R	udiv 	%r29, %r30, %r18
	.word 0x906c6001  ! 3547: UDIVX_I	udivx 	%r17, 0x0001, %r8
	.word 0xa7202001  ! 3552: MULScc_I	mulscc 	%r0, 0x0001, %r19
	.word 0xa8750018  ! 3557: UDIV_R	udiv 	%r20, %r24, %r20
	.word 0x90df0010  ! 3562: SMULcc_R	smulcc 	%r28, %r16, %r8
	.word 0x9efd4019  ! 3567: SDIVcc_R	sdivcc 	%r21, %r25, %r15
	.word 0xbef6a001  ! 3572: UDIVcc_I	udivcc 	%r26, 0x0001, %r31
	.word 0x9cf76001  ! 3577: UDIVcc_I	udivcc 	%r29, 0x0001, %r14
	.word 0xa6d8000b  ! 3582: SMULcc_R	smulcc 	%r0, %r11, %r19
	.word 0xbc49e001  ! 3587: MULX_I	mulx 	%r7, 0x0001, %r30
	.word 0xa46f001b  ! 3592: UDIVX_R	udivx 	%r28, %r27, %r18
	.word 0xa86ee001  ! 3597: UDIVX_I	udivx 	%r27, 0x0001, %r20
	.word 0x88fe4006  ! 3602: SDIVcc_R	sdivcc 	%r25, %r6, %r4
	.word 0x8e6e2001  ! 3607: UDIVX_I	udivx 	%r24, 0x0001, %r7
	.word 0x8e4a2001  ! 3612: MULX_I	mulx 	%r8, 0x0001, %r7
	.word 0xf658a428  ! 3617: LDX_I	ldx	[%r2 + 0x0428], %r27
	.word 0xb06de001  ! 3622: UDIVX_I	udivx 	%r23, 0x0001, %r24
	.word 0xbd6d401e  ! 3627: SDIVX_R	sdivx	%r21, %r30, %r30
	.word 0x88d6e001  ! 3632: UMULcc_I	umulcc 	%r27, 0x0001, %r4
	.word 0xae5d2001  ! 3637: SMUL_I	smul 	%r20, 0x0001, %r23
	.word 0xb268c014  ! 3642: UDIVX_R	udivx 	%r3, %r20, %r25
	.word 0x9b6a4013  ! 3647: SDIVX_R	sdivx	%r9, %r19, %r13
	.word 0xb25c4015  ! 3652: SMUL_R	smul 	%r17, %r21, %r25
	.word 0xb66d8017  ! 3657: UDIVX_R	udivx 	%r22, %r23, %r27
	.word 0xb85a0011  ! 3662: SMUL_R	smul 	%r8, %r17, %r28
	.word 0xb06b4003  ! 3667: UDIVX_R	udivx 	%r13, %r3, %r24
	.word 0xee586728  ! 3672: LDX_I	ldx	[%r1 + 0x0728], %r23
	.word 0xaa4de001  ! 3677: MULX_I	mulx 	%r23, 0x0001, %r21
	.word 0xa2d9000b  ! 3682: SMULcc_R	smulcc 	%r4, %r11, %r17
	.word 0x885ec000  ! 3687: SMUL_R	smul 	%r27, %r0, %r4
	.word 0xaa68e001  ! 3692: UDIVX_I	udivx 	%r3, 0x0001, %r21
	.word 0xa76c001e  ! 3697: SDIVX_R	sdivx	%r16, %r30, %r19
	.word 0x984d001c  ! 3702: MULX_R	mulx 	%r20, %r28, %r12
	.word 0x956f0014  ! 3707: SDIVX_R	sdivx	%r28, %r20, %r10
	.word 0x9efba001  ! 3712: SDIVcc_I	sdivcc 	%r14, 0x0001, %r15
	.word 0x9c482001  ! 3717: MULX_I	mulx 	%r0, 0x0001, %r14
	.word 0xbcd6e001  ! 3722: UMULcc_I	umulcc 	%r27, 0x0001, %r30
	.word 0x8e68000d  ! 3727: UDIVX_R	udivx 	%r0, %r13, %r7
	.word 0x8a536001  ! 3732: UMUL_I	umul 	%r13, 0x0001, %r5
	.word 0x90576001  ! 3737: UMUL_I	umul 	%r29, 0x0001, %r8
	.word 0xaa6c2001  ! 3742: UDIVX_I	udivx 	%r16, 0x0001, %r21
	.word 0xb36ae001  ! 3747: SDIVX_I	sdivx	%r11, 0x0001, %r25
	.word 0xb076400c  ! 3752: UDIV_R	udiv 	%r25, %r12, %r24
	.word 0x944c2001  ! 3757: MULX_I	mulx 	%r16, 0x0001, %r10
	.word 0xbaf32001  ! 3762: UDIVcc_I	udivcc 	%r12, 0x0001, %r29
	.word 0xa2d8c01d  ! 3767: SMULcc_R	smulcc 	%r3, %r29, %r17
	.word 0xa868e001  ! 3772: UDIVX_I	udivx 	%r3, 0x0001, %r20
	.word 0x8effc01a  ! 3777: SDIVcc_R	sdivcc 	%r31, %r26, %r7
	.word 0xb849a001  ! 3782: MULX_I	mulx 	%r6, 0x0001, %r28
	.word 0x9d6c8011  ! 3787: SDIVX_R	sdivx	%r18, %r17, %r14
	.word 0x904de001  ! 3792: MULX_I	mulx 	%r23, 0x0001, %r8
	.word 0x8ed7e001  ! 3797: UMULcc_I	umulcc 	%r31, 0x0001, %r7
	.word 0xaedea001  ! 3802: SMULcc_I	smulcc 	%r26, 0x0001, %r23
	.word 0xa0d58010  ! 3807: UMULcc_R	umulcc 	%r22, %r16, %r16
	.word 0x86792001  ! 3812: SDIV_I	sdiv 	%r4, 0x0001, %r3
	.word 0xa56f000a  ! 3817: SDIVX_R	sdivx	%r28, %r10, %r18
	.word 0xe8586470  ! 3822: LDX_I	ldx	[%r1 + 0x0470], %r20
	.word 0x9072a001  ! 3827: UDIV_I	udiv 	%r10, 0x0001, %r8
	.word 0xb0d12001  ! 3832: UMULcc_I	umulcc 	%r4, 0x0001, %r24
	.word 0x94f48015  ! 3837: UDIVcc_R	udivcc 	%r18, %r21, %r10
	.word 0xb56dc00e  ! 3842: SDIVX_R	sdivx	%r23, %r14, %r26
	.word 0x8d6e400a  ! 3847: SDIVX_R	sdivx	%r25, %r10, %r6
	.word 0xb670001c  ! 3852: UDIV_R	udiv 	%r0, %r28, %r27
	.word 0xb24de001  ! 3857: MULX_I	mulx 	%r23, 0x0001, %r25
	.word 0x924b6001  ! 3862: MULX_I	mulx 	%r13, 0x0001, %r9
	.word 0xb2496001  ! 3867: MULX_I	mulx 	%r5, 0x0001, %r25
	.word 0xa25cc016  ! 3872: SMUL_R	smul 	%r19, %r22, %r17
	.word 0xaa698011  ! 3877: UDIVX_R	udivx 	%r6, %r17, %r21
	.word 0x9b6c0012  ! 3882: SDIVX_R	sdivx	%r16, %r18, %r13
	.word 0xba492001  ! 3887: MULX_I	mulx 	%r4, 0x0001, %r29
	.word 0xaa4da001  ! 3892: MULX_I	mulx 	%r22, 0x0001, %r21
	.word 0x99696001  ! 3897: SDIVX_I	sdivx	%r5, 0x0001, %r12
	.word 0x9cfa8000  ! 3902: SDIVcc_R	sdivcc 	%r10, %r0, %r14
	.word 0xacfde001  ! 3907: SDIVcc_I	sdivcc 	%r23, 0x0001, %r22
	.word 0xb4746001  ! 3912: UDIV_I	udiv 	%r17, 0x0001, %r26
	.word 0xb4f98013  ! 3917: SDIVcc_R	sdivcc 	%r6, %r19, %r26
	.word 0x9678c01c  ! 3922: SDIV_R	sdiv 	%r3, %r28, %r11
	.word 0xbc720000  ! 3927: UDIV_R	udiv 	%r8, %r0, %r30
	.word 0x8b68c01c  ! 3932: SDIVX_R	sdivx	%r3, %r28, %r5
	.word 0x8a4d8011  ! 3937: MULX_R	mulx 	%r22, %r17, %r5
	.word 0xb06a0011  ! 3942: UDIVX_R	udivx 	%r8, %r17, %r24
	.word 0xbe4fc010  ! 3947: MULX_R	mulx 	%r31, %r16, %r31
	.word 0x92f58018  ! 3952: UDIVcc_R	udivcc 	%r22, %r24, %r9
	.word 0x8184e001  ! 3957: WRY_I	wr	%r19, 0x0001, %y
	.word 0x8c6c6001  ! 3962: UDIVX_I	udivx 	%r17, 0x0001, %r6
	.word 0xbe4d4007  ! 3967: MULX_R	mulx 	%r21, %r7, %r31
	.word 0x86fa0014  ! 3972: SDIVcc_R	sdivcc 	%r8, %r20, %r3
	.word 0xb670c006  ! 3977: UDIV_R	udiv 	%r3, %r6, %r27
	.word 0x866de001  ! 3982: UDIVX_I	udivx 	%r23, 0x0001, %r3
	.word 0xb520001b  ! 3987: MULScc_R	mulscc 	%r0, %r27, %r26
	.word 0x886b4000  ! 3992: UDIVX_R	udivx 	%r13, %r0, %r4
.data
.align	256
t1_data64_start_0:
	.xword	0xf8e10a2bf0ef287f
	.xword	0x410d809088269a3e
	.xword	0xbb6b6b009776a172
	.xword	0x8c8b0f8fcbefcd41
	.xword	0xbd0c16c481a50a5e
	.xword	0x097c042c00db8671
	.xword	0x36ba766aa4119e21
	.xword	0x4be5b9492d1697fe
	.xword	0x32df49332b918d1d
	.xword	0x5d677ef9c81c98af
	.xword	0x9a428cfdd4307cfe
	.xword	0xd266241b8e3ad63e
	.xword	0x382d8bc7d3abbc55
	.xword	0xbe3f13cbad715e7b
	.xword	0x4c4a4bd9bc77e8b9
	.xword	0x7eb0e443bcd35af7
	.xword	0x48074a89b749c92c
	.xword	0x8ea55a065df41f51
	.xword	0xc21efef1d21cf27d
	.xword	0xe342ee1a9c5a6302
	.xword	0x87acb3029f7490ad
	.xword	0x8cce586151dfd248
	.xword	0xc1c4d7d23f9e86f4
	.xword	0xd0dac0f41cc7d5fa
	.xword	0xe68bc1fd2fa3db66
	.xword	0x2ecce823f395c5f8
	.xword	0xd69e2535aa989395
	.xword	0x0452d12e9ed2507b
	.xword	0x12b8ad420eb5cb12
	.xword	0x840700e293b283d1
	.xword	0xd94d4eca2ab63329
	.xword	0xae4e8ebc08fb6c0f
	.xword	0x60a5193383918224
	.xword	0x2454e8213a641a8b
	.xword	0xacd863188e96430d
	.xword	0x61760e986cac9e14
	.xword	0x4982a4f00fe96110
	.xword	0x422b59d6320135ef
	.xword	0xb2e74d55446b58bb
	.xword	0xb25a3082680d0e81
	.xword	0x7f57c0c2f5cbbc1f
	.xword	0xc0534c7faacb98bb
	.xword	0x24fbcd168b7ffec2
	.xword	0xb81a215572aa36a7
	.xword	0xa96c43e68b0ad39a
	.xword	0xc459511545a935d8
	.xword	0x78a247867b9f3de3
	.xword	0x0f46c28b3f837014
	.xword	0xf6ea3220c1ab50d6
	.xword	0x639f44293f212a5e
	.xword	0x7a06d4e5c8df25d6
	.xword	0x93a4cfef97843242
	.xword	0x940333cd7b57bbfe
	.xword	0x5416ddf239ba6538
	.xword	0x6a1b030aaf5c0b45
	.xword	0x62288c1667306710
	.xword	0x1b2eff6f55935b93
	.xword	0xe0614069ab445214
	.xword	0x280a315504feb83c
	.xword	0xc99a677c065c5a9b
	.xword	0x518e3f1f9993100a
	.xword	0xd00c9ef28de1d2cd
	.xword	0xc009cbadbec947d4
	.xword	0x647693c845b0deda
	.xword	0xe5ecf69b65ca985c
	.xword	0xd13a8f6bf3a7851d
	.xword	0x5ffcda581b72800f
	.xword	0xfbd59ff8cc226cbd
	.xword	0x038ba596e8c4d71d
	.xword	0xd74180e2edd91d61
	.xword	0x36c626566ede4a01
	.xword	0x20c960c58d357665
	.xword	0xc7afe3b704c7917d
	.xword	0xa20048fd7710da84
	.xword	0x9a38b0f781b469bb
	.xword	0xb23c58e8b065389c
	.xword	0x43f156164f858344
	.xword	0x8674172b1024f09b
	.xword	0xb5ded5f3b5210367
	.xword	0x4662d33dea0fb6e4
	.xword	0xebee56acd9002c5e
	.xword	0xbcf3f24d3fb668fa
	.xword	0x1982e36f5692fc30
	.xword	0x372b99c98f689463
	.xword	0x561f27cf1dffbabf
	.xword	0x7dec36c2130ffd8c
	.xword	0xccad1e145ab786e1
	.xword	0x73943e361391e722
	.xword	0x39c7e0fb3822f9be
	.xword	0x90f1656c4640eba9
	.xword	0x2fd414aad47be3ae
	.xword	0xe981a617164e1f5c
	.xword	0xad332c184f40d4c5
	.xword	0x87ae5c66839260c2
	.xword	0x173fad510fd538da
	.xword	0xafbf0dbe91d029fd
	.xword	0x39de058a3eb32805
	.xword	0x8c99574e6e25c8e9
	.xword	0xb8e691a946e987af
	.xword	0xc4b73792469ae7e0
	.xword	0x67192461f6314419
	.xword	0x50c97585d9cb9925
	.xword	0x0a807d226d528ca1
	.xword	0x39def683fb0ff68d
	.xword	0x58009930c3c6c8b1
	.xword	0x90933af3a7bb4581
	.xword	0xed2d178c14f5be74
	.xword	0xa058b3f3367ac398
	.xword	0x2d31f7dbcaca4d64
	.xword	0xa629c01843e452bc
	.xword	0x520068896aafbf79
	.xword	0x0b2e320e61e47b42
	.xword	0x50f7a70a4e11ef53
	.xword	0x9c230343b3b7c260
	.xword	0x83d91e4ab847d3f3
	.xword	0x58f394309e3ceacc
	.xword	0x20738ec524d2bfce
	.xword	0x67c2956e7a91b66c
	.xword	0x6b01c837a8764f08
	.xword	0xb6e6e7b8146099e1
	.xword	0xb9d3c3d8a5c538b5
	.xword	0x7adc687784825d05
	.xword	0x3f6e03bab7dfe531
	.xword	0x4966b510264e53a7
	.xword	0xcde7d8428a89be76
	.xword	0xd95bb5f5559c70b5
	.xword	0xb38fc83f4bf48a7e
	.xword	0x6c735534544770ff
	.xword	0x583ad15795f2ea44
	.xword	0x3c3a24c4bdfda6f1
	.xword	0x316aac1ffcb7750e
	.xword	0xe588383292a9a066
	.xword	0xcb0b92d4d7821db1
	.xword	0xabbd066900c6d711
	.xword	0x11d0c4e142173824
	.xword	0x2356c2a6a4dd62c8
	.xword	0x2ecee3b94901c14a
	.xword	0x55ddb378c454987c
	.xword	0x1fa7d459c2681c38
	.xword	0x6761ee968a580ad2
	.xword	0xde2a78e73ab1f3c0
	.xword	0x89fb802cd71144a5
	.xword	0xd3add487b3a67a84
	.xword	0x5efebf6ae9675944
	.xword	0xbc0db0fe47145ed0
	.xword	0xb122e8925c0a2fc0
	.xword	0x85d1336c311cc32b
	.xword	0x2fbe5e5021bc866f
	.xword	0x280a544544b913d6
	.xword	0xa4dd402c25d8c0b4
	.xword	0xae53b6fcb9e6db98
	.xword	0xce9ee0de5fac55b3
	.xword	0x49ac67fb611ddd81
	.xword	0xb2ae2bd187c9a052
	.xword	0x72920052364b8be4
	.xword	0xc707750781e774f1
	.xword	0xf03e3b9caa8a7e9e
	.xword	0xda2f709d29bddd2e
	.xword	0xd3e1d8f8d7ba0a7a
	.xword	0x7f2183c3e7d1b264
	.xword	0xf9f599a12f0e4c9e
	.xword	0x27dfff15f2a4becd
	.xword	0x9a4dc7102d91e33e
	.xword	0x1f5d6cfb5db1eec7
	.xword	0x498f80d1ea3a5e34
	.xword	0x8e20c05f19bd9703
	.xword	0xe2804c58badf265a
	.xword	0x3d04f8e9199f61d6
	.xword	0x0579743a3f2864a0
	.xword	0x5384b7056f5ecb63
	.xword	0xcd56822e0c27584a
	.xword	0xe8929d15f3558b54
	.xword	0xcde28a0659d8d7aa
	.xword	0x963206623971a19e
	.xword	0x46053cabc88960ce
	.xword	0x05b5fea1525255fd
	.xword	0xe017cf8b92105314
	.xword	0xd6f587b0536c2c75
	.xword	0x75ab4915870cd381
	.xword	0xc1f6b0f4d32fe8c5
	.xword	0x47d5171ae4c03616
	.xword	0x79c660f3c107af93
	.xword	0x51215345eb2f15f2
	.xword	0x2a1849c8dd7f5e7f
	.xword	0xc92e1c609ebcd6b0
	.xword	0x92e2f67beaffaea5
	.xword	0xe1b0b1c513885c57
	.xword	0x5898a1d7ab1c1c8c
	.xword	0x6c9b06bf28158754
	.xword	0x4e11d88872f9d2c6
	.xword	0xeb34486fdde3ef2a
	.xword	0x7bec448ac43a1ff4
	.xword	0x0660c42a1e298597
	.xword	0x2867ed1d11d30865
	.xword	0x3a54c16c83eacb18
	.xword	0x617e20a3780d011d
	.xword	0x676599d3828af90f
	.xword	0x32a4991130e9e876
	.xword	0x47249dcfbecb8667
	.xword	0xc0e037428d6a7b11
	.xword	0xc3e89370415682de
	.xword	0x22bd2a16add0b67d
	.xword	0x12676eb56bbb4dc2
	.xword	0x8f4dbf4940fc12cd
	.xword	0x521d8e10211e7cd1
	.xword	0xd6bd915a4cfa18a4
	.xword	0x83226d0a97c81d9a
	.xword	0x7497c5da870b119e
	.xword	0x78e2e6fc7961873d
	.xword	0x0240b27bb3dd2c68
	.xword	0x78d82fc1b4e689ea
	.xword	0x346db5d1d30945b8
	.xword	0x865a204b35f86aed
	.xword	0x04328957e049bbbd
	.xword	0x3426a0168f13dfa5
	.xword	0x59550dc30a009dda
	.xword	0x1e7af65fb13e46d5
	.xword	0x4b4aa67685ef9480
	.xword	0x0092229ab57905fb
	.xword	0xca3ab3e0672731b7
	.xword	0xb807244e2e9a6f62
	.xword	0xb37685d011eb5d05
	.xword	0x7c7c92ac9c65a92f
	.xword	0xca01725803e9ebaa
	.xword	0xa787b2658fc35c62
	.xword	0xa5b9c88ac6c070b5
	.xword	0x0ba5c87beb403495
	.xword	0x9df65bc0eac879ed
	.xword	0x54e1c75ff2550b58
	.xword	0x9307b316933cddeb
	.xword	0x42afeab24d0b33bc
	.xword	0x9886c226f7fae98e
	.xword	0xa45bea0a5dae5cd1
	.xword	0xe5df9578aba7270a
	.xword	0xee1f80dc8a804ae9
	.xword	0xaaef55307d92d39e
	.xword	0x9270ae1fab64fe13
	.xword	0xba12e726f6aec91e
	.xword	0x6ca54a072a3c2d7a
	.xword	0xab08bed56e7bf8b0
	.xword	0x7c5f56a1df5b9773
	.xword	0x3b016fbea2a9ea46
	.xword	0x9279b5f445380b9f
	.xword	0x367a5f84ea88ada5
	.xword	0x86fdebab67396d9b
	.xword	0xa94741f6c875fa6a
	.xword	0x93d8176c71d4109c
	.xword	0x744a44eaf5f25d23
	.xword	0x9fb86e29f61c28d8
	.xword	0x1fa431184127ab2d
	.xword	0xb9c007e8c806d9a5
	.xword	0x4ff0e6af68d0e731
	.xword	0xd5c9139095d75840
	.xword	0x54170aac98642e0b
	.xword	0xde66bea96a3fe344
	.xword	0x88b6a9aae2fada2a
	.xword	0x580a865cd1efd22b
	.xword	0xe6b8657cae5da9c3
	.xword	0x75126ddef9b4b940
	.xword	0x8701604699945495
	.xword	0xa93d525a5298affd
	.xword	0x59f35c30b2249984
	.xword	0xf54bfa4ee11e8423
	.xword	0xe049da935e9c855e
	.xword	0x78f494fa9212f447
	.xword	0xbff09a4d5db925f3
	.xword	0x150efd4fb36bcfa8
	.xword	0x2d8940b9824c5d1d
	.xword	0x43c173835064e72b
	.xword	0xc02d00ea365024d9
	.xword	0xe66005480f113549
	.xword	0x163b02d2e13a99f2
	.xword	0x1e2a32373d4976dd
	.xword	0x9810db35e928a96f
	.xword	0xecff9a95d92ac8cd
	.xword	0x2dbdd3fd0429a91f
	.xword	0x7792e632a50d1b53
	.xword	0xc0f6786edd696128
	.xword	0x7caa9a89e25585bb
	.xword	0x34ae233207f541c3
	.xword	0xe34218fc4ae23c01
	.xword	0xe368cc4167bda942
	.xword	0xfc9a98a9344d0222
	.xword	0x230369c48b8b6ffe
	.xword	0xa593133b67e8de30
	.xword	0x558ef7d242a8d6ce
	.xword	0xe7a634b123150e20
	.xword	0xc9058b39c9aea4af
	.xword	0x794e44f8803c30c8
	.xword	0x22bcffdfab23dc35
	.xword	0xd6a8e9fab3d2fd7b
	.xword	0xf0b07928d1421f4e
	.xword	0xc933e8c91df01fd8
	.xword	0x8564c51477abc0d3
	.xword	0x6efe70c751e06bd5
	.xword	0x3666db7f53a1b213
	.xword	0x608b673aa40a277b
	.xword	0x4458c63b596c464b
	.xword	0x51e5653f3c76fda8
	.xword	0x5dad3c1565953562
	.xword	0x08931814626b48c2
	.xword	0x17c039dbacf8042f
	.xword	0x96bcb0a89f94d648
	.xword	0x3388ea7fd8d502a4
	.xword	0x8cce89eaf3908583
	.xword	0x814b5270f1f9c0fd
	.xword	0xdd8d267911050047
	.xword	0x748949d0d254798f
	.xword	0x7729fb53be6593ca
	.xword	0xc142b9d84ccefa9e
	.xword	0xf9d19d89fb62d166
	.xword	0x1edd050b7e4b246b
	.xword	0xfc1934fe396a4afe
	.xword	0x42e0410217a4a587
	.xword	0x216f9e9044aa4f50
	.xword	0x81505af55ef00b47
	.xword	0xa756b74f1af79e72
	.xword	0xf92675463ecc38b5
	.xword	0xa704d701dba9b533
	.xword	0xb0c6ff0d6e68fd36
	.xword	0x7d5ed2217bcbfeec
	.xword	0x933c160fbbb86e71
	.xword	0x0232a004198efff3
	.xword	0x49d61067b815bbb8
	.xword	0xba76b320671772e7
	.xword	0x2af92495fbfc58de
	.xword	0x709771fc682fc125
	.xword	0xb738fdf52f53ed00
	.xword	0xf2b23614cac85b4f
	.xword	0x83da5f303bdfba56
	.xword	0x5fc0802e307fefa1
	.xword	0xa951211ed0e005b0
	.xword	0x73d31626ed943de3
	.xword	0xa90dfea2c9b4c032
	.xword	0xa9667e5befac3dcb
	.xword	0xe78b90c64f030222
	.xword	0xd0dde721bb458ab6
	.xword	0xb3e9c66d43f99902
	.xword	0x36319cae29ce4322
	.xword	0x3d2171fb5d842c76
	.xword	0xcf44a015ae1b9247
	.xword	0xe2e6033c2ba3e15e
	.xword	0xd5cd891ee6cb706f
	.xword	0x2f520d9c11b8d863
	.xword	0x952804a5abfe406c
	.xword	0xfa33c9af43d3da74
	.xword	0xdf093523cb0fbc55
	.xword	0x43b5ec8ee2ded8bc
	.xword	0xf410c75fa95f3911
	.xword	0xff4e4f2df8df1c38
	.xword	0x9a8443c2cf423d53
	.xword	0x293e11398a5a16c2
	.xword	0x0fa02c6f12f6ca53
	.xword	0x3013033b54879066
	.xword	0x3696332d1b4e58c0
	.xword	0x39c7f0b459d40ce0
	.xword	0xb0e4c2e4069d7f34
	.xword	0x3ee5aaffd266bee6
	.xword	0x261c89e9d71cf854
	.xword	0xbd2e417d5a1b256a
	.xword	0x29a8a3bdcd3f59c5
	.xword	0xc9b35c5d336193c5
	.xword	0x101d1cd9a37872c2
	.xword	0x5c10dca7302d74c8
	.xword	0xb179022123fa5ea7
	.xword	0x05b4d3f16efbcc98
	.xword	0xb321c4ec2eb1690d
	.xword	0xca47ec92f6a9d4e0
	.xword	0xb844cf6ab7af8aed
	.xword	0x924129a0fd2a227d
	.xword	0x28597ab77f43ba7a
	.xword	0x8b4871915ffe698e
	.xword	0x4d9c1d6623f33064
	.xword	0x452aff44dac56643
	.xword	0xfb8a8309d0cb6492
	.xword	0x7200463b7929af72
	.xword	0x5f47d48b2a7e625d
	.xword	0x3bcb5988e505f7b3
	.xword	0x4928c9cdb8955c98
	.xword	0x27d63d871ed980aa
	.xword	0xcd34b78390662c78
	.xword	0x4f73a093d7f05db4
	.xword	0x07dc4ad82ff0c8a7
	.xword	0xda8ac343acef8b84
	.xword	0x84567c7e2906a34b
	.xword	0xff9678a4d8b179d3
	.xword	0xb047abad1e18ac45
	.xword	0x11156c24a8130083
	.xword	0x37d40e279f2a1cec
	.xword	0x0061b504dcb93482
	.xword	0xd51e2c02d5e6c959
	.xword	0x405da8f1ba671ca4
	.xword	0x19c4458572dcbdc4
	.xword	0x3b27c605987bd897
	.xword	0xebf99ffc6093007c
	.xword	0xf4c434963a8b9c2a
	.xword	0x77e1957ce1ca05e1
	.xword	0xf31910f274bacb77
	.xword	0x1204c1d209fe2fff
	.xword	0x7c12b028ca11f288
	.xword	0x059ab72c4fc31df5
	.xword	0xadd9badc5c7d79aa
	.xword	0xa5a3440fc8b9d7c8
	.xword	0x79361f735de33f6b
	.xword	0x2bc9a43d5c4621ed
	.xword	0xf0abb74d2f9d8d9e
	.xword	0xc8036cc5df9a7b0e
	.xword	0xaf36d1b006b81648
	.xword	0xa2ddcca64fa0c042
	.xword	0xf5cfcae8aea5d948
	.xword	0xf3dba5d3f5101418
	.xword	0x887346b0368dc6f2
	.xword	0x9f587053d418b5bc
	.xword	0xc238f62100d31831
	.xword	0x2894d7087b4f07ba
	.xword	0x6020f451ad7bca5d
	.xword	0x5d31e7f65d3e1322
	.xword	0xf3c4336fd1df6e0e
	.xword	0x8c2d346fcf6c414a
	.xword	0xe32865a5b50ddebe
	.xword	0xb972650b703e2f08
	.xword	0x4fc43c009e2861a4
	.xword	0x3b5c981cc871303c
	.xword	0x191fc9f97660abbf
	.xword	0x1910f7be9db9c6e8
	.xword	0xd866ce3ee21649eb
	.xword	0x4d48949af7ca5f0e
	.xword	0x99057e8332c60643
	.xword	0x96ac8b3f889cc112
	.xword	0xf8deb3c4fabd7b52
	.xword	0xa1313a34f94dadc7
	.xword	0xf83b659c07ae4422
	.xword	0x3ffb03d9cffa7bf5
	.xword	0x891aead260f80d59
	.xword	0xc2a89b2cd180d3f2
	.xword	0x335f4308ac6ff97d
	.xword	0x1cda2b307975b9dc
	.xword	0xa404a81dc7b67ed0
	.xword	0x492bc4db1b7fc712
	.xword	0xf6c165ff21423f4b
	.xword	0x9ad5367416c81e12
	.xword	0x11b45cc1c6f45bb9
	.xword	0x3673a52524078623
	.xword	0x88b7490671f62aff
	.xword	0x819dbee0c2d4bce8
	.xword	0xeb0f57a3d34337e5
	.xword	0x547ddd7cd4cae23d
	.xword	0x1284e678dbd5a694
	.xword	0xd0ef2623310fe160
	.xword	0xb293d371e1b2da4d
	.xword	0x3b861a7a39f5c130
	.xword	0x670f2f76ddde19d2
	.xword	0x369d4ff80bd69628
	.xword	0x22772eab03f46625
	.xword	0xbd82193adb05fa4b
	.xword	0xa8759208c37212ec
	.xword	0xe99083a2a4e763b4
	.xword	0xf1584bdc25d482ba
	.xword	0xecad4160a0639ae1
	.xword	0xfa00268ea8e02c87
	.xword	0xd8c17b067ceb9f30
	.xword	0x0c71c5dff13d22ef
	.xword	0x25114b530cc3ca88
	.xword	0x67c71e137bea3875
	.xword	0x751cc5182b0bc7b8
	.xword	0xf9f495fe9a7e97f9
	.xword	0x685ffc757463dd61
	.xword	0xcc57bf97380a7ef2
	.xword	0x058ed5b959611106
	.xword	0xf4e7957e10a4c964
	.xword	0xd8e79ed816c8a17a
	.xword	0xa1e8a08d221624d2
	.xword	0xdcdea2481c52a07a
	.xword	0xc7069ac3babc12b3
	.xword	0x4189f8ab45dcaf67
	.xword	0x9041e25df33a1017
	.xword	0x37cb0f8241a26220
	.xword	0x23deacc87d7b2ac3
	.xword	0x877773772324f327
	.xword	0x4bc0d2a3bcd13812
	.xword	0x5ce2d503fe41cec1
	.xword	0x1e07a2d70a43537c
	.xword	0xd3699788eed6b06f
	.xword	0xaf6f3be5b6a1d938
	.xword	0xf9d6829bd508c5da
	.xword	0x2481f4be5b050a7f
	.xword	0x18245577d2ef47ab
	.xword	0xc2b09b3b052fbb5e
	.xword	0x634722f806c899d5
	.xword	0xd3aae949cc1efd91
	.xword	0x3ad9e3719d53b06f
	.xword	0x9094dcf7806198bf
	.xword	0xa4078285d43758d4
	.xword	0xb9cdb75b16cda658
	.xword	0xab5893a854ac24aa
	.xword	0x3a1ad3d07eb5b347
	.xword	0x7d7facd899ed319a
	.xword	0x3b392f0c8a52c3ec
	.xword	0x3948d8d39e8babb3
	.xword	0x71f0012289e27e36
	.xword	0x7f350568b0b3f3a7
	.xword	0x288b9fb933a218d2
	.xword	0x597a2ea3aebc35f9
	.xword	0xc0142a4c7c1545e8
	.xword	0xe8367388ce9d8766
	.xword	0xf5d013f1aaa4c52d
	.xword	0xc49aedc0026a8f4e
	.xword	0x0d6ca6a7509e74f7
	.xword	0x84fbc6e1dd74ae57
	.xword	0x9b65284129d22ae1
	.xword	0x8424326f4077e27c
	.xword	0x69ec99c47c7c2189
.data
.align	256
t1_data32_start_0:
	.xword	0x0000000001714d6a
	.xword	0x00000000ef54caf8
	.xword	0x00000000cdda4922
	.xword	0x00000000ca54c8c2
	.xword	0x00000000f3b80313
	.xword	0x000000003a0b9916
	.xword	0x000000006ad43c5f
	.xword	0x0000000088992910
	.xword	0x00000000b388f058
	.xword	0x000000006479361c
	.xword	0x00000000f8525005
	.xword	0x00000000d5a73186
	.xword	0x00000000f0608b9a
	.xword	0x00000000a7e0f843
	.xword	0x0000000021a45480
	.xword	0x00000000df469fb3
	.xword	0x000000006cdf8f2b
	.xword	0x000000001da30691
	.xword	0x000000005ba19f6c
	.xword	0x000000004fe2d6ef
	.xword	0x000000001e224e08
	.xword	0x00000000ef3dffb1
	.xword	0x00000000eb027413
	.xword	0x00000000c9be1932
	.xword	0x0000000095355d69
	.xword	0x000000007f43fdb4
	.xword	0x00000000aae27cc7
	.xword	0x00000000a86b2b29
	.xword	0x0000000009bd5bcc
	.xword	0x00000000db6dabb9
	.xword	0x00000000872b3e8b
	.xword	0x00000000a70443f6
	.xword	0x000000007f3b5e5e
	.xword	0x000000001f23d25a
	.xword	0x0000000004ec8e53
	.xword	0x000000009a30a394
	.xword	0x00000000a2e781c5
	.xword	0x00000000c0da18bf
	.xword	0x0000000050f349c8
	.xword	0x00000000604ac1e8
	.xword	0x00000000f228c7ad
	.xword	0x00000000ec1d09e3
	.xword	0x0000000009b76f19
	.xword	0x0000000077c04127
	.xword	0x000000001a370457
	.xword	0x0000000068d3ee60
	.xword	0x0000000040334c3e
	.xword	0x0000000033c75f8d
	.xword	0x00000000c1956fac
	.xword	0x0000000054b37e8f
	.xword	0x000000004419da40
	.xword	0x00000000b5f0b84e
	.xword	0x00000000aeda092a
	.xword	0x0000000001965cba
	.xword	0x000000000945096f
	.xword	0x00000000091003bd
	.xword	0x000000003bd35991
	.xword	0x0000000086bad5ec
	.xword	0x000000003037d9c8
	.xword	0x000000005d3d4f41
	.xword	0x000000009301e021
	.xword	0x0000000049a1c626
	.xword	0x000000005ea77c7e
	.xword	0x00000000c5bdbedd
	.xword	0x0000000032d8cdfc
	.xword	0x000000001832a9c4
	.xword	0x000000005d9fea0a
	.xword	0x000000000727cb22
	.xword	0x00000000f76a1e82
	.xword	0x000000008e74b3af
	.xword	0x00000000d6a1eeaa
	.xword	0x00000000ad12189c
	.xword	0x00000000abd0ed65
	.xword	0x000000006298444f
	.xword	0x000000006840e0fc
	.xword	0x000000001ec0351f
	.xword	0x00000000242bb326
	.xword	0x00000000e30d6f93
	.xword	0x00000000262b2b0e
	.xword	0x000000009149948d
	.xword	0x00000000bb468cf3
	.xword	0x00000000f88ffb10
	.xword	0x00000000165153c8
	.xword	0x00000000cd6564b5
	.xword	0x000000001b9224dc
	.xword	0x000000002f4ff1a3
	.xword	0x0000000078c63377
	.xword	0x000000001c89aa12
	.xword	0x00000000fc0eb120
	.xword	0x0000000097addcba
	.xword	0x0000000079c4a1d1
	.xword	0x00000000f137d517
	.xword	0x00000000f60a06b6
	.xword	0x00000000f728a718
	.xword	0x000000006b3786e5
	.xword	0x000000007f6d35a4
	.xword	0x00000000e3cc8de8
	.xword	0x00000000575b1e45
	.xword	0x0000000009355aa9
	.xword	0x000000007cfa963e
	.xword	0x00000000f51378a7
	.xword	0x00000000e9fc9a8e
	.xword	0x000000007e17a64b
	.xword	0x000000003a293487
	.xword	0x00000000f5e8890f
	.xword	0x00000000f9a42571
	.xword	0x00000000dae33750
	.xword	0x000000001d8e8b9b
	.xword	0x000000005fde6ac8
	.xword	0x00000000584640a6
	.xword	0x00000000009eee8a
	.xword	0x00000000e0df79c4
	.xword	0x00000000936da210
	.xword	0x00000000be70da55
	.xword	0x00000000bf20cd3e
	.xword	0x000000001c2dfd6b
	.xword	0x00000000646b0750
	.xword	0x00000000e31f0f14
	.xword	0x00000000ce38d8fa
	.xword	0x00000000d88030ed
	.xword	0x000000005e49a554
	.xword	0x00000000e87484c7
	.xword	0x000000004b7d9f97
	.xword	0x000000001d02d596
	.xword	0x00000000f40ef440
	.xword	0x0000000056f8fa27
	.xword	0x0000000013eab100
	.xword	0x000000005fc78e16
	.xword	0x00000000575890e2
	.xword	0x00000000e4a79c02
	.xword	0x00000000a50eed4f
	.xword	0x0000000012548401
	.xword	0x00000000d24274d9
	.xword	0x0000000082de2761
	.xword	0x000000009963f6d7
	.xword	0x00000000beaf791b
	.xword	0x0000000070b2bb20
	.xword	0x00000000fd045544
	.xword	0x000000007ed6d11b
	.xword	0x00000000e69cdaaf
	.xword	0x00000000d244aa87
	.xword	0x0000000082a649e3
	.xword	0x00000000fa5538fb
	.xword	0x00000000fa340d46
	.xword	0x000000006908922a
	.xword	0x00000000123d3927
	.xword	0x00000000aa7e7cd0
	.xword	0x00000000e56ed6e9
	.xword	0x0000000055feaca1
	.xword	0x00000000ee308b8b
	.xword	0x000000000448aaba
	.xword	0x00000000c3b49564
	.xword	0x0000000017499b88
	.xword	0x00000000bce0ede5
	.xword	0x0000000021547bae
	.xword	0x0000000080982826
	.xword	0x000000002dfbb417
	.xword	0x000000002055cf0b
	.xword	0x000000003dc93ea0
	.xword	0x000000006bda7816
	.xword	0x000000009d8d102c
	.xword	0x000000007bd9af26
	.xword	0x000000001ac0f71d
	.xword	0x0000000056628fee
	.xword	0x0000000017a80942
	.xword	0x00000000c89bfbb5
	.xword	0x0000000051dc6cd1
	.xword	0x000000002e811bc0
	.xword	0x000000003e24b223
	.xword	0x00000000286ebe1e
	.xword	0x000000000fa7c945
	.xword	0x00000000d9638059
	.xword	0x00000000338510cd
	.xword	0x000000005a09a065
	.xword	0x0000000051c01c62
	.xword	0x0000000012bf79a9
	.xword	0x00000000dfaa3e23
	.xword	0x00000000cee6e9b5
	.xword	0x0000000098f73476
	.xword	0x00000000481eb645
	.xword	0x00000000dccc2125
	.xword	0x00000000ceea5e4d
	.xword	0x0000000091dcb5a6
	.xword	0x000000006979b2b5
	.xword	0x0000000036656c04
	.xword	0x0000000041bbbd66
	.xword	0x00000000baae0079
	.xword	0x000000001494f494
	.xword	0x00000000c405f2c0
	.xword	0x00000000c3360fd3
	.xword	0x00000000363aa065
	.xword	0x000000002d136506
	.xword	0x00000000f26a0c1a
	.xword	0x00000000eefdfc0c
	.xword	0x0000000021efee32
	.xword	0x000000007810e933
	.xword	0x000000008e01442b
	.xword	0x00000000c0aabff2
	.xword	0x00000000f4a57e60
	.xword	0x000000009eb0e17f
	.xword	0x00000000df14c55e
	.xword	0x000000008fce64b8
	.xword	0x000000008ddf5d87
	.xword	0x000000008456a665
	.xword	0x0000000056219d02
	.xword	0x00000000336bd897
	.xword	0x0000000005ae243f
	.xword	0x000000003f303bd5
	.xword	0x000000008d175125
	.xword	0x000000008fad8226
	.xword	0x000000002fd980e0
	.xword	0x0000000053bc3e2f
	.xword	0x00000000a96096a1
	.xword	0x00000000848967fe
	.xword	0x00000000ee0b88d5
	.xword	0x00000000a7d1572c
	.xword	0x00000000eb7338c7
	.xword	0x0000000009ea1949
	.xword	0x00000000cfb8c799
	.xword	0x00000000369c8499
	.xword	0x00000000ee8c200d
	.xword	0x0000000054483f03
	.xword	0x00000000ea47a684
	.xword	0x00000000de5587fd
	.xword	0x00000000b0d51823
	.xword	0x00000000b0c18491
	.xword	0x0000000021f634ee
	.xword	0x000000007d7ac684
	.xword	0x00000000e125e4c5
	.xword	0x0000000081e3967d
	.xword	0x0000000073e26b46
	.xword	0x0000000060d5efd6
	.xword	0x000000000fe8fd30
	.xword	0x00000000264d98cc
	.xword	0x000000001539b141
	.xword	0x0000000005181f53
	.xword	0x000000001d9d4fe4
	.xword	0x000000007db1647c
	.xword	0x0000000089638344
	.xword	0x000000008fb05408
	.xword	0x000000005836c563
	.xword	0x00000000e25bcfe2
	.xword	0x00000000efd0f957
	.xword	0x00000000a3f4073c
	.xword	0x0000000084ef318e
	.xword	0x00000000fe12fdf1
	.xword	0x0000000006743ecb
	.xword	0x00000000aad0b4b9
	.xword	0x00000000ff219d7e
	.xword	0x0000000063254a98
	.xword	0x00000000f05a74c5
	.xword	0x000000009e5bb88c
	.xword	0x000000006cb9ff43
	.xword	0x000000001a74b3ee
	.xword	0x0000000090812eb4
	.xword	0x000000008d1343a6
	.xword	0x00000000ef4a6287
	.xword	0x00000000bb6c113a
	.xword	0x00000000f976f4fc
	.xword	0x000000005aa25593
	.xword	0x000000006f52ca87
	.xword	0x0000000040439797
	.xword	0x0000000048571e37
	.xword	0x00000000745401ef
	.xword	0x00000000ff2d08a2
	.xword	0x000000008a9ac114
	.xword	0x000000003f2ba7c4
	.xword	0x00000000cd06829f
	.xword	0x000000006b721dcf
	.xword	0x000000004b00731a
	.xword	0x0000000023e36db0
	.xword	0x000000000152cd9b
	.xword	0x000000007a2a18dc
	.xword	0x00000000cbd85128
	.xword	0x000000004e79148d
	.xword	0x00000000101e2ea8
	.xword	0x0000000053f0395b
	.xword	0x00000000c1b49a29
	.xword	0x00000000b71f587c
	.xword	0x00000000152bd973
	.xword	0x0000000007b6cfd3
	.xword	0x00000000c9974fc4
	.xword	0x000000002ceddd6a
	.xword	0x00000000c260b008
	.xword	0x00000000506ab257
	.xword	0x000000000836972d
	.xword	0x000000008daec00c
	.xword	0x00000000346c1436
	.xword	0x0000000024b43ace
	.xword	0x00000000cdfec120
	.xword	0x00000000260df4bc
	.xword	0x0000000043a68fa4
	.xword	0x000000009301dba4
	.xword	0x0000000093931ac8
	.xword	0x0000000042cd0fd1
	.xword	0x00000000d1f63d6f
	.xword	0x00000000ecc770b1
	.xword	0x00000000aa399651
	.xword	0x000000001615d981
	.xword	0x0000000052b1a16d
	.xword	0x00000000ad5d2c61
	.xword	0x0000000020f135c2
	.xword	0x00000000fafc72bb
	.xword	0x00000000225aef93
	.xword	0x00000000015f4adf
	.xword	0x0000000094d04a36
	.xword	0x000000008d975e3f
	.xword	0x000000002eabfb02
	.xword	0x0000000027562795
	.xword	0x000000007587947d
	.xword	0x00000000e9d8e786
	.xword	0x00000000bde988a4
	.xword	0x0000000040e7cb86
	.xword	0x00000000f84fa351
	.xword	0x00000000592c59ee
	.xword	0x00000000c2580aff
	.xword	0x0000000023edc077
	.xword	0x000000004835eb32
	.xword	0x0000000015ec0054
	.xword	0x000000006aacacb9
	.xword	0x000000002948ac2a
	.xword	0x000000009bef6c7a
	.xword	0x00000000afc57c39
	.xword	0x000000003e025ddb
	.xword	0x000000007145d0f9
	.xword	0x00000000914131bc
	.xword	0x000000004f4320fb
	.xword	0x0000000003f35cf7
	.xword	0x00000000ed0de0c7
	.xword	0x00000000ed963a2c
	.xword	0x00000000348e8edb
	.xword	0x00000000914fc08c
	.xword	0x00000000bddca60b
	.xword	0x000000000fb42a2d
	.xword	0x0000000083db2bb5
	.xword	0x0000000055a741cd
	.xword	0x00000000f16cf435
	.xword	0x00000000c6624222
	.xword	0x00000000de59a22f
	.xword	0x00000000c0b9c3ba
	.xword	0x0000000022791904
	.xword	0x0000000040be7ad6
	.xword	0x000000003979b84e
	.xword	0x00000000a0d9db90
	.xword	0x00000000efa3c031
	.xword	0x00000000403f03e6
	.xword	0x00000000367c2320
	.xword	0x000000004fd45e92
	.xword	0x00000000935cb4d2
	.xword	0x00000000c005f2d9
	.xword	0x00000000d440fcf6
	.xword	0x0000000045ff5f5e
	.xword	0x00000000d7f67ffd
	.xword	0x00000000581603ab
	.xword	0x000000003d5ae670
	.xword	0x0000000002738660
	.xword	0x000000001ecb7a71
	.xword	0x00000000e9d6deb8
	.xword	0x00000000b8e58f63
	.xword	0x00000000eacc944c
	.xword	0x00000000bbedd4f5
	.xword	0x0000000052b58f06
	.xword	0x00000000c103342c
	.xword	0x000000006bc1a4ff
	.xword	0x000000000ed969cf
	.xword	0x000000002dbc8fd3
	.xword	0x00000000c72ab5a3
	.xword	0x00000000c7d04767
	.xword	0x000000006c80a53a
	.xword	0x00000000fb5b5e8e
	.xword	0x00000000a9aff578
	.xword	0x00000000188e9c59
	.xword	0x000000004117c2e5
	.xword	0x00000000c0151085
	.xword	0x0000000048646bdd
	.xword	0x000000007cfe49c2
	.xword	0x000000007fb3c724
	.xword	0x000000001afffa22
	.xword	0x00000000058d3ca6
	.xword	0x00000000d0709cd9
	.xword	0x00000000ae9c1c1d
	.xword	0x00000000c9c3ff19
	.xword	0x0000000063ec3094
	.xword	0x00000000cab9ed1b
	.xword	0x000000008142d6a0
	.xword	0x00000000266aa541
	.xword	0x00000000677c16cb
	.xword	0x000000002536f394
	.xword	0x00000000b6cf22dc
	.xword	0x00000000e233b7bb
	.xword	0x00000000afa35a2e
	.xword	0x0000000017502e28
	.xword	0x0000000047bacc0b
	.xword	0x000000007b50d12d
	.xword	0x0000000064d7a171
	.xword	0x00000000d345ab61
	.xword	0x000000001883a6e0
	.xword	0x00000000a0160569
	.xword	0x0000000026c07257
	.xword	0x000000005acef9d3
	.xword	0x000000002e6a161f
	.xword	0x000000002a542e9c
	.xword	0x0000000015184ab8
	.xword	0x0000000068a6a6d6
	.xword	0x00000000ee1d9e96
	.xword	0x00000000e29a7baa
	.xword	0x00000000dff28a13
	.xword	0x000000006e238a7f
	.xword	0x000000002376bfca
	.xword	0x00000000de5d5c0e
	.xword	0x00000000b1d6a7b9
	.xword	0x00000000d46b79e8
	.xword	0x0000000095351c4a
	.xword	0x00000000e7c031da
	.xword	0x00000000be60b2b2
	.xword	0x00000000dd2570cd
	.xword	0x00000000c995b40d
	.xword	0x000000000e779a21
	.xword	0x0000000008fea567
	.xword	0x00000000d8922152
	.xword	0x0000000061023d32
	.xword	0x0000000035fa69ba
	.xword	0x0000000091f2d93b
	.xword	0x00000000ebabb6da
	.xword	0x00000000b53d73b8
	.xword	0x0000000041602067
	.xword	0x000000000a023004
	.xword	0x000000007dd032b5
	.xword	0x000000003ba63f7d
	.xword	0x00000000ed7bb768
	.xword	0x0000000049f9f51e
	.xword	0x00000000d74eb405
	.xword	0x0000000030b49e12
	.xword	0x0000000088d644d4
	.xword	0x00000000250774f2
	.xword	0x000000000cc0261b
	.xword	0x0000000064d79444
	.xword	0x00000000f859b83a
	.xword	0x00000000e13115cb
	.xword	0x00000000709b68eb
	.xword	0x00000000b3454867
	.xword	0x0000000041f4f71b
	.xword	0x000000002992c662
	.xword	0x0000000052a6b65c
	.xword	0x00000000aff2b53d
	.xword	0x000000006232bc83
	.xword	0x00000000150ec35f
	.xword	0x0000000041665da4
	.xword	0x000000004b68d268
	.xword	0x00000000c1bc43e7
	.xword	0x00000000c63591f5
	.xword	0x00000000457239f9
	.xword	0x000000008b5608c4
	.xword	0x000000004f3d6e33
	.xword	0x00000000dc3a7d98
	.xword	0x0000000089f0adf9
	.xword	0x0000000013644f4d
	.xword	0x000000002af7ddfb
	.xword	0x00000000a7594240
	.xword	0x00000000c113e0b7
	.xword	0x000000008ddc57d8
	.xword	0x000000005f7cbbd2
	.xword	0x00000000912691a6
	.xword	0x000000001ca9d55d
	.xword	0x00000000cdf813a9
	.xword	0x0000000078caedde
	.xword	0x000000008055b6c7
	.xword	0x00000000d4f390ae
	.xword	0x00000000f7980f83
	.xword	0x00000000deb994bf
	.xword	0x0000000099c1cfdf
	.xword	0x000000009b7ddd0c
	.xword	0x00000000442ea023
	.xword	0x0000000031c3c895
	.xword	0x00000000d3e5f074
	.xword	0x0000000081dd95e5
	.xword	0x00000000d9abd4b3
	.xword	0x000000006f712126
	.xword	0x00000000efeb7e2c
	.xword	0x000000001d75927e
	.xword	0x000000006e3687fe
	.xword	0x0000000075555b1c
	.xword	0x0000000016d5f8c4
	.xword	0x000000001ca0fb23
	.xword	0x0000000062487e91
	.xword	0x00000000b5d557ca
	.xword	0x00000000c21cc5ab
	.xword	0x000000009c2da8c7
	.xword	0x00000000fb5479f2
	.xword	0x00000000543a3e0b
	.xword	0x000000000cd11883
	.xword	0x000000004f15d8a3
	.xword	0x0000000049891772
	.xword	0x000000004b08da6d
	.xword	0x00000000db7ab015
	.xword	0x000000007d77d404
	.xword	0x00000000e34f14f6
	.xword	0x0000000050749c3d
	.xword	0x000000004a60c9a0
	.xword	0x0000000065fa44b7
	.xword	0x000000004026c6cf
	.xword	0x000000007e2acc04
	.xword	0x0000000011bb2310
	.xword	0x00000000bb98cefb
	.xword	0x0000000035c426e6
	.xword	0x000000005b99f30d
	.xword	0x00000000829272f5
	.xword	0x00000000585fe64d
	.xword	0x00000000d5a666ef
	.xword	0x00000000dade6196
	.xword	0x000000004aa7e10e
	.xword	0x00000000013645e5
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	wr %r27,0x1fff,%y
	setx	t0_data64_start_0,%g3, %g1
	setx	t0_data32_start_0,%g3, %g2
	.word 0x924c400d  ! 1: MULX_R	mulx 	%r17, %r13, %r9
	.word 0xbefdc011  ! 6: SDIVcc_R	sdivcc 	%r23, %r17, %r31
	.word 0xa76d4008  ! 11: SDIVX_R	sdivx	%r21, %r8, %r19
	.word 0x96596001  ! 16: SMUL_I	smul 	%r5, 0x0001, %r11
	.word 0x956c000a  ! 21: SDIVX_R	sdivx	%r16, %r10, %r10
	.word 0x916d000e  ! 26: SDIVX_R	sdivx	%r20, %r14, %r8
	.word 0x8cf68010  ! 31: UDIVcc_R	udivcc 	%r26, %r16, %r6
	.word 0xbb6b8016  ! 36: SDIVX_R	sdivx	%r14, %r22, %r29
	.word 0x904f4015  ! 41: MULX_R	mulx 	%r29, %r21, %r8
	.word 0xb6d6a001  ! 46: UMULcc_I	umulcc 	%r26, 0x0001, %r27
	.word 0x896ec011  ! 51: SDIVX_R	sdivx	%r27, %r17, %r4
	.word 0x884fc000  ! 56: MULX_R	mulx 	%r31, %r0, %r4
	.word 0x956f800a  ! 61: SDIVX_R	sdivx	%r30, %r10, %r10
	.word 0x94736001  ! 66: UDIV_I	udiv 	%r13, 0x0001, %r10
	.word 0x906d4000  ! 71: UDIVX_R	udivx 	%r21, %r0, %r8
	.word 0x8183e001  ! 76: WRY_I	wr	%r15, 0x0001, %y
	.word 0x996ec000  ! 81: SDIVX_R	sdivx	%r27, %r0, %r12
	.word 0xae6bc010  ! 86: UDIVX_R	udivx 	%r15, %r16, %r23
	.word 0xa86b801e  ! 91: UDIVX_R	udivx 	%r14, %r30, %r20
	.word 0x9b276001  ! 96: MULScc_I	mulscc 	%r29, 0x0001, %r13
	.word 0xbd6d2001  ! 101: SDIVX_I	sdivx	%r20, 0x0001, %r30
	.word 0x8180e001  ! 106: WRY_I	wr	%r3, 0x0001, %y
	.word 0xa7690015  ! 111: SDIVX_R	sdivx	%r4, %r21, %r19
	.word 0x9c6c400b  ! 116: UDIVX_R	udivx 	%r17, %r11, %r14
	.word 0xa2762001  ! 121: UDIV_I	udiv 	%r24, 0x0001, %r17
	.word 0x8c4e2001  ! 126: MULX_I	mulx 	%r24, 0x0001, %r6
	.word 0xa24de001  ! 131: MULX_I	mulx 	%r23, 0x0001, %r17
	.word 0x8a682001  ! 136: UDIVX_I	udivx 	%r0, 0x0001, %r5
	.word 0xb25f401b  ! 141: SMUL_R	smul 	%r29, %r27, %r25
	.word 0xb64c6001  ! 146: MULX_I	mulx 	%r17, 0x0001, %r27
	.word 0x866e8005  ! 151: UDIVX_R	udivx 	%r26, %r5, %r3
	.word 0x8b6d401e  ! 156: SDIVX_R	sdivx	%r21, %r30, %r5
	.word 0x9cd94005  ! 161: SMULcc_R	smulcc 	%r5, %r5, %r14
	.word 0xa64be001  ! 166: MULX_I	mulx 	%r15, 0x0001, %r19
	.word 0xb449001a  ! 171: MULX_R	mulx 	%r4, %r26, %r26
	.word 0xa6de2001  ! 176: SMULcc_I	smulcc 	%r24, 0x0001, %r19
	.word 0xa649a001  ! 181: MULX_I	mulx 	%r6, 0x0001, %r19
	.word 0x9a7c6001  ! 186: SDIV_I	sdiv 	%r17, 0x0001, %r13
	.word 0x9e6b0016  ! 191: UDIVX_R	udivx 	%r12, %r22, %r15
	.word 0xe45860d8  ! 196: LDX_I	ldx	[%r1 + 0x00d8], %r18
	.word 0x81802001  ! 201: WRY_I	wr	%r0, 0x0001, %y
	.word 0xb071e001  ! 206: UDIV_I	udiv 	%r7, 0x0001, %r24
	.word 0x95246001  ! 211: MULScc_I	mulscc 	%r17, 0x0001, %r10
	.word 0xa8db6001  ! 216: SMULcc_I	smulcc 	%r13, 0x0001, %r20
	.word 0x81872001  ! 221: WRY_I	wr	%r28, 0x0001, %y
	.word 0x8186e001  ! 226: WRY_I	wr	%r27, 0x0001, %y
	.word 0x8b24e001  ! 231: MULScc_I	mulscc 	%r19, 0x0001, %r5
	.word 0x996ae001  ! 236: SDIVX_I	sdivx	%r11, 0x0001, %r12
	.word 0xb84fe001  ! 241: MULX_I	mulx 	%r31, 0x0001, %r28
	.word 0x9d680006  ! 246: SDIVX_R	sdivx	%r0, %r6, %r14
	.word 0x81876001  ! 251: WRY_I	wr	%r29, 0x0001, %y
	.word 0xb06f001f  ! 256: UDIVX_R	udivx 	%r28, %r31, %r24
	.word 0xae6e4019  ! 261: UDIVX_R	udivx 	%r25, %r25, %r23
	.word 0x98692001  ! 266: UDIVX_I	udivx 	%r4, 0x0001, %r12
	.word 0xaf6a6001  ! 271: SDIVX_I	sdivx	%r9, 0x0001, %r23
	.word 0x9d21e001  ! 276: MULScc_I	mulscc 	%r7, 0x0001, %r14
	.word 0xa0f5801f  ! 281: UDIVcc_R	udivcc 	%r22, %r31, %r16
	.word 0xb16e4011  ! 286: SDIVX_R	sdivx	%r25, %r17, %r24
	.word 0xa325a001  ! 291: MULScc_I	mulscc 	%r22, 0x0001, %r17
	.word 0xb06ce001  ! 296: UDIVX_I	udivx 	%r19, 0x0001, %r24
	.word 0x95682001  ! 301: SDIVX_I	sdivx	%r0, 0x0001, %r10
	.word 0x88718011  ! 306: UDIV_R	udiv 	%r6, %r17, %r4
	.word 0xa855400c  ! 311: UMUL_R	umul 	%r21, %r12, %r20
	.word 0xa273401d  ! 316: UDIV_R	udiv 	%r13, %r29, %r17
	.word 0xa56c001b  ! 321: SDIVX_R	sdivx	%r16, %r27, %r18
	.word 0xa66ac00c  ! 326: UDIVX_R	udivx 	%r11, %r12, %r19
	.word 0x964b400b  ! 331: MULX_R	mulx 	%r13, %r11, %r11
	.word 0xae6ae001  ! 336: UDIVX_I	udivx 	%r11, 0x0001, %r23
	.word 0x8ed7c00e  ! 341: UMULcc_R	umulcc 	%r31, %r14, %r7
	.word 0x926cc010  ! 346: UDIVX_R	udivx 	%r19, %r16, %r9
	.word 0xbe7e8000  ! 351: SDIV_R	sdiv 	%r26, %r0, %r31
	.word 0x876a8013  ! 356: SDIVX_R	sdivx	%r10, %r19, %r3
	.word 0xf658a2c0  ! 361: LDX_I	ldx	[%r2 + 0x02c0], %r27
	.word 0xa26c401a  ! 366: UDIVX_R	udivx 	%r17, %r26, %r17
	.word 0xb06e2001  ! 371: UDIVX_I	udivx 	%r24, 0x0001, %r24
	.word 0xb26f0015  ! 376: UDIVX_R	udivx 	%r28, %r21, %r25
	.word 0x916e4014  ! 381: SDIVX_R	sdivx	%r25, %r20, %r8
	.word 0xe258a190  ! 386: LDX_I	ldx	[%r2 + 0x0190], %r17
	.word 0xf858a4d8  ! 391: LDX_I	ldx	[%r2 + 0x04d8], %r28
	.word 0xf85864e0  ! 396: LDX_I	ldx	[%r1 + 0x04e0], %r28
	.word 0x9c782001  ! 401: SDIV_I	sdiv 	%r0, 0x0001, %r14
	.word 0x90fac010  ! 406: SDIVcc_R	sdivcc 	%r11, %r16, %r8
	.word 0x866d6001  ! 411: UDIVX_I	udivx 	%r21, 0x0001, %r3
	.word 0xb44d2001  ! 416: MULX_I	mulx 	%r20, 0x0001, %r26
	.word 0x90f4001f  ! 421: UDIVcc_R	udivcc 	%r16, %r31, %r8
	.word 0xa8f78011  ! 426: UDIVcc_R	udivcc 	%r30, %r17, %r20
	.word 0x8edec01b  ! 431: SMULcc_R	smulcc 	%r27, %r27, %r7
	.word 0x9f6b400a  ! 436: SDIVX_R	sdivx	%r13, %r10, %r15
	.word 0x9649e001  ! 441: MULX_I	mulx 	%r7, 0x0001, %r11
	.word 0x88f4e001  ! 446: UDIVcc_I	udivcc 	%r19, 0x0001, %r4
	.word 0xb0792001  ! 451: SDIV_I	sdiv 	%r4, 0x0001, %r24
	.word 0xa725a001  ! 456: MULScc_I	mulscc 	%r22, 0x0001, %r19
	.word 0xaa540009  ! 461: UMUL_R	umul 	%r16, %r9, %r21
	.word 0x886d0013  ! 466: UDIVX_R	udivx 	%r20, %r19, %r4
	.word 0xb448e001  ! 471: MULX_I	mulx 	%r3, 0x0001, %r26
	.word 0x8855e001  ! 476: UMUL_I	umul 	%r23, 0x0001, %r4
	.word 0xa5272001  ! 481: MULScc_I	mulscc 	%r28, 0x0001, %r18
	.word 0xba6d401d  ! 486: UDIVX_R	udivx 	%r21, %r29, %r29
	.word 0xa24f4011  ! 491: MULX_R	mulx 	%r29, %r17, %r17
	.word 0xaf6f401a  ! 496: SDIVX_R	sdivx	%r29, %r26, %r23
	.word 0xb4496001  ! 501: MULX_I	mulx 	%r5, 0x0001, %r26
	.word 0xaa776001  ! 506: UDIV_I	udiv 	%r29, 0x0001, %r21
	.word 0xb527c018  ! 511: MULScc_R	mulscc 	%r31, %r24, %r26
	.word 0xb36c8017  ! 516: SDIVX_R	sdivx	%r18, %r23, %r25
	.word 0xbafc8015  ! 521: SDIVcc_R	sdivcc 	%r18, %r21, %r29
	.word 0x964a2001  ! 526: MULX_I	mulx 	%r8, 0x0001, %r11
	.word 0x9d6f0000  ! 531: SDIVX_R	sdivx	%r28, %r0, %r14
	.word 0xa16e401c  ! 536: SDIVX_R	sdivx	%r25, %r28, %r16
	.word 0xb8680004  ! 541: UDIVX_R	udivx 	%r0, %r4, %r28
	.word 0xa8db4018  ! 546: SMULcc_R	smulcc 	%r13, %r24, %r20
	.word 0xba4ee001  ! 551: MULX_I	mulx 	%r27, 0x0001, %r29
	.word 0x924b801f  ! 556: MULX_R	mulx 	%r14, %r31, %r9
	.word 0xb0ff2001  ! 561: SDIVcc_I	sdivcc 	%r28, 0x0001, %r24
	.word 0x9e76c01b  ! 566: UDIV_R	udiv 	%r27, %r27, %r15
	.word 0xb56cc00a  ! 571: SDIVX_R	sdivx	%r19, %r10, %r26
	.word 0xb068000f  ! 576: UDIVX_R	udivx 	%r0, %r15, %r24
	.word 0xbe68e001  ! 581: UDIVX_I	udivx 	%r3, 0x0001, %r31
	.word 0xaa4f2001  ! 586: MULX_I	mulx 	%r28, 0x0001, %r21
	.word 0x90fac00e  ! 591: SDIVcc_R	sdivcc 	%r11, %r14, %r8
	.word 0x94d20000  ! 596: UMULcc_R	umulcc 	%r8, %r0, %r10
	.word 0xb24f4004  ! 601: MULX_R	mulx 	%r29, %r4, %r25
	.word 0x884ac016  ! 606: MULX_R	mulx 	%r11, %r22, %r4
	.word 0x9c568005  ! 611: UMUL_R	umul 	%r26, %r5, %r14
	.word 0xbb6a801a  ! 616: SDIVX_R	sdivx	%r10, %r26, %r29
	.word 0xad238000  ! 621: MULScc_R	mulscc 	%r14, %r0, %r22
	.word 0xaed1800a  ! 626: UMULcc_R	umulcc 	%r6, %r10, %r23
	.word 0xb8db6001  ! 631: SMULcc_I	smulcc 	%r13, 0x0001, %r28
	.word 0x866ba001  ! 636: UDIVX_I	udivx 	%r14, 0x0001, %r3
	.word 0x8181e001  ! 641: WRY_I	wr	%r7, 0x0001, %y
	.word 0xae4a8006  ! 646: MULX_R	mulx 	%r10, %r6, %r23
	.word 0xb0fb4014  ! 651: SDIVcc_R	sdivcc 	%r13, %r20, %r24
	.word 0x8a4f6001  ! 656: MULX_I	mulx 	%r29, 0x0001, %r5
	.word 0x887a401a  ! 661: SDIV_R	sdiv 	%r9, %r26, %r4
	.word 0x886c800a  ! 666: UDIVX_R	udivx 	%r18, %r10, %r4
	.word 0xbc4d6001  ! 671: MULX_I	mulx 	%r21, 0x0001, %r30
	.word 0x9afe4007  ! 676: SDIVcc_R	sdivcc 	%r25, %r7, %r13
	.word 0xb25f6001  ! 681: SMUL_I	smul 	%r29, 0x0001, %r25
	.word 0x9a692001  ! 686: UDIVX_I	udivx 	%r4, 0x0001, %r13
	.word 0xa64b4013  ! 691: MULX_R	mulx 	%r13, %r19, %r19
	.word 0xb7226001  ! 696: MULScc_I	mulscc 	%r9, 0x0001, %r27
	.word 0xad278013  ! 701: MULScc_R	mulscc 	%r30, %r19, %r22
	.word 0xa2f7e001  ! 706: UDIVcc_I	udivcc 	%r31, 0x0001, %r17
	.word 0xb66e8006  ! 711: UDIVX_R	udivx 	%r26, %r6, %r27
	.word 0x887f6001  ! 716: SDIV_I	sdiv 	%r29, 0x0001, %r4
	.word 0xbc798004  ! 721: SDIV_R	sdiv 	%r6, %r4, %r30
	.word 0xa67d800c  ! 726: SDIV_R	sdiv 	%r22, %r12, %r19
	.word 0x904c6001  ! 731: MULX_I	mulx 	%r17, 0x0001, %r8
	.word 0xb04e4004  ! 736: MULX_R	mulx 	%r25, %r4, %r24
	.word 0x9469800f  ! 741: UDIVX_R	udivx 	%r6, %r15, %r10
	.word 0x876c0012  ! 746: SDIVX_R	sdivx	%r16, %r18, %r3
	.word 0xb2d80006  ! 751: SMULcc_R	smulcc 	%r0, %r6, %r25
	.word 0x964c8000  ! 756: MULX_R	mulx 	%r18, %r0, %r11
	.word 0xae4c8012  ! 761: MULX_R	mulx 	%r18, %r18, %r23
	.word 0xae6f001d  ! 766: UDIVX_R	udivx 	%r28, %r29, %r23
	.word 0x956a400f  ! 771: SDIVX_R	sdivx	%r9, %r15, %r10
	.word 0xa249c01e  ! 776: MULX_R	mulx 	%r7, %r30, %r17
	.word 0xac7e8015  ! 781: SDIV_R	sdiv 	%r26, %r21, %r22
	.word 0x896e401f  ! 786: SDIVX_R	sdivx	%r25, %r31, %r4
	.word 0xb46a001f  ! 791: UDIVX_R	udivx 	%r8, %r31, %r26
	.word 0x8677c00e  ! 796: UDIV_R	udiv 	%r31, %r14, %r3
	.word 0x8a702001  ! 801: UDIV_I	udiv 	%r0, 0x0001, %r5
	.word 0x996d2001  ! 806: SDIVX_I	sdivx	%r20, 0x0001, %r12
	.word 0x9af5801b  ! 811: UDIVcc_R	udivcc 	%r22, %r27, %r13
	.word 0xb86b801a  ! 816: UDIVX_R	udivx 	%r14, %r26, %r28
	.word 0xb5252001  ! 821: MULScc_I	mulscc 	%r20, 0x0001, %r26
	.word 0x81846001  ! 826: WRY_I	wr	%r17, 0x0001, %y
	.word 0xa6550000  ! 831: UMUL_R	umul 	%r20, %r0, %r19
	.word 0xb0596001  ! 836: SMUL_I	smul 	%r5, 0x0001, %r24
	.word 0x9e6e001e  ! 841: UDIVX_R	udivx 	%r24, %r30, %r15
	.word 0xb84f800d  ! 846: MULX_R	mulx 	%r30, %r13, %r28
	.word 0xb84fa001  ! 851: MULX_I	mulx 	%r30, 0x0001, %r28
	.word 0xb64f401e  ! 856: MULX_R	mulx 	%r29, %r30, %r27
	.word 0xb86fe001  ! 861: UDIVX_I	udivx 	%r31, 0x0001, %r28
	.word 0xb249000b  ! 866: MULX_R	mulx 	%r4, %r11, %r25
	.word 0xad6d6001  ! 871: SDIVX_I	sdivx	%r21, 0x0001, %r22
	.word 0x86f32001  ! 876: UDIVcc_I	udivcc 	%r12, 0x0001, %r3
	.word 0x916dc00b  ! 881: SDIVX_R	sdivx	%r23, %r11, %r8
	.word 0x9c498012  ! 886: MULX_R	mulx 	%r6, %r18, %r14
	.word 0xbc55a001  ! 891: UMUL_I	umul 	%r22, 0x0001, %r30
	.word 0x9f6e8005  ! 896: SDIVX_R	sdivx	%r26, %r5, %r15
	.word 0x966ba001  ! 901: UDIVX_I	udivx 	%r14, 0x0001, %r11
	.word 0xba7c8007  ! 906: SDIV_R	sdiv 	%r18, %r7, %r29
	.word 0x8e4be001  ! 911: MULX_I	mulx 	%r15, 0x0001, %r7
	.word 0xae6aa001  ! 916: UDIVX_I	udivx 	%r10, 0x0001, %r23
	.word 0xbe500004  ! 921: UMUL_R	umul 	%r0, %r4, %r31
	.word 0xaf680017  ! 926: SDIVX_R	sdivx	%r0, %r23, %r23
	.word 0xaf6a0019  ! 931: SDIVX_R	sdivx	%r8, %r25, %r23
	.word 0x936e400d  ! 936: SDIVX_R	sdivx	%r25, %r13, %r9
	.word 0x8e72400a  ! 941: UDIV_R	udiv 	%r9, %r10, %r7
	.word 0xbc7ac014  ! 946: SDIV_R	sdiv 	%r11, %r20, %r30
	.word 0xac4b800d  ! 951: MULX_R	mulx 	%r14, %r13, %r22
	.word 0xb8f2401e  ! 956: UDIVcc_R	udivcc 	%r9, %r30, %r28
	.word 0x88f4e001  ! 961: UDIVcc_I	udivcc 	%r19, 0x0001, %r4
	.word 0x9c710008  ! 966: UDIV_R	udiv 	%r4, %r8, %r14
	.word 0xb24ce001  ! 971: MULX_I	mulx 	%r19, 0x0001, %r25
	.word 0x81832001  ! 976: WRY_I	wr	%r12, 0x0001, %y
	.word 0x8cd72001  ! 981: UMULcc_I	umulcc 	%r28, 0x0001, %r6
	.word 0x925e4019  ! 986: SMUL_R	smul 	%r25, %r25, %r9
	.word 0xa66dc012  ! 991: UDIVX_R	udivx 	%r23, %r18, %r19
	.word 0xb26a6001  ! 996: UDIVX_I	udivx 	%r9, 0x0001, %r25
	.word 0xa16bc01e  ! 1001: SDIVX_R	sdivx	%r15, %r30, %r16
	.word 0x9cd2e001  ! 1006: UMULcc_I	umulcc 	%r11, 0x0001, %r14
	.word 0xb248e001  ! 1011: MULX_I	mulx 	%r3, 0x0001, %r25
	.word 0xb2f38013  ! 1016: UDIVcc_R	udivcc 	%r14, %r19, %r25
	.word 0x9a6a001d  ! 1021: UDIVX_R	udivx 	%r8, %r29, %r13
	.word 0x926ea001  ! 1026: UDIVX_I	udivx 	%r26, 0x0001, %r9
	.word 0xbefc401e  ! 1031: SDIVcc_R	sdivcc 	%r17, %r30, %r31
	.word 0x896e2001  ! 1036: SDIVX_I	sdivx	%r24, 0x0001, %r4
	.word 0xaaf58019  ! 1041: UDIVcc_R	udivcc 	%r22, %r25, %r21
	.word 0xad6b8004  ! 1046: SDIVX_R	sdivx	%r14, %r4, %r22
	.word 0x9e724018  ! 1051: UDIV_R	udiv 	%r9, %r24, %r15
	.word 0xb06ea001  ! 1056: UDIVX_I	udivx 	%r26, 0x0001, %r24
	.word 0xb7266001  ! 1061: MULScc_I	mulscc 	%r25, 0x0001, %r27
	.word 0xae7d800c  ! 1066: SDIV_R	sdiv 	%r22, %r12, %r23
	.word 0xb44ec00d  ! 1071: MULX_R	mulx 	%r27, %r13, %r26
	.word 0x904fe001  ! 1076: MULX_I	mulx 	%r31, 0x0001, %r8
	.word 0xba6fc00c  ! 1081: UDIVX_R	udivx 	%r31, %r12, %r29
	.word 0x9af50011  ! 1086: UDIVcc_R	udivcc 	%r20, %r17, %r13
	.word 0x8c6a801c  ! 1091: UDIVX_R	udivx 	%r10, %r28, %r6
	.word 0xa0d6c009  ! 1096: UMULcc_R	umulcc 	%r27, %r9, %r16
	.word 0xa849c00e  ! 1101: MULX_R	mulx 	%r7, %r14, %r20
	.word 0x927e6001  ! 1106: SDIV_I	sdiv 	%r25, 0x0001, %r9
	.word 0xda58a200  ! 1111: LDX_I	ldx	[%r2 + 0x0200], %r13
	.word 0xaa718004  ! 1116: UDIV_R	udiv 	%r6, %r4, %r21
	.word 0x8874c01b  ! 1121: UDIV_R	udiv 	%r19, %r27, %r4
	.word 0x946c0014  ! 1126: UDIVX_R	udivx 	%r16, %r20, %r10
	.word 0x9769c00a  ! 1131: SDIVX_R	sdivx	%r7, %r10, %r11
	.word 0xa06ac004  ! 1136: UDIVX_R	udivx 	%r11, %r4, %r16
	.word 0xb24a6001  ! 1141: MULX_I	mulx 	%r9, 0x0001, %r25
	.word 0x8d6e4005  ! 1146: SDIVX_R	sdivx	%r25, %r5, %r6
	.word 0x8180e001  ! 1151: WRY_I	wr	%r3, 0x0001, %y
	.word 0xd458a0a0  ! 1156: LDX_I	ldx	[%r2 + 0x00a0], %r10
	.word 0x8ad4a001  ! 1161: UMULcc_I	umulcc 	%r18, 0x0001, %r5
	.word 0x8924800a  ! 1166: MULScc_R	mulscc 	%r18, %r10, %r4
	.word 0xbe4be001  ! 1171: MULX_I	mulx 	%r15, 0x0001, %r31
	.word 0xb96d800e  ! 1176: SDIVX_R	sdivx	%r22, %r14, %r28
	.word 0x905f801e  ! 1181: SMUL_R	smul 	%r30, %r30, %r8
	.word 0x996c8013  ! 1186: SDIVX_R	sdivx	%r18, %r19, %r12
	.word 0xa0d18018  ! 1191: UMULcc_R	umulcc 	%r6, %r24, %r16
	.word 0x8a7a2001  ! 1196: SDIV_I	sdiv 	%r8, 0x0001, %r5
	.word 0xbc6cc00c  ! 1201: UDIVX_R	udivx 	%r19, %r12, %r30
	.word 0xa8722001  ! 1206: UDIV_I	udiv 	%r8, 0x0001, %r20
	.word 0xb96e8008  ! 1211: SDIVX_R	sdivx	%r26, %r8, %r28
	.word 0x9c6a8017  ! 1216: UDIVX_R	udivx 	%r10, %r23, %r14
	.word 0x8e702001  ! 1221: UDIV_I	udiv 	%r0, 0x0001, %r7
	.word 0x8186a001  ! 1226: WRY_I	wr	%r26, 0x0001, %y
	.word 0xac6ae001  ! 1231: UDIVX_I	udivx 	%r11, 0x0001, %r22
	.word 0x8d226001  ! 1236: MULScc_I	mulscc 	%r9, 0x0001, %r6
	.word 0xa07ec012  ! 1241: SDIV_R	sdiv 	%r27, %r18, %r16
	.word 0xc8586248  ! 1246: LDX_I	ldx	[%r1 + 0x0248], %r4
	.word 0xb06dc011  ! 1251: UDIVX_R	udivx 	%r23, %r17, %r24
	.word 0xaa6e6001  ! 1256: UDIVX_I	udivx 	%r25, 0x0001, %r21
	.word 0x8877c00b  ! 1261: UDIV_R	udiv 	%r31, %r11, %r4
	.word 0xa96dc00b  ! 1266: SDIVX_R	sdivx	%r23, %r11, %r20
	.word 0xbd268000  ! 1271: MULScc_R	mulscc 	%r26, %r0, %r30
	.word 0x88f6e001  ! 1276: UDIVcc_I	udivcc 	%r27, 0x0001, %r4
	.word 0x867de001  ! 1281: SDIV_I	sdiv 	%r23, 0x0001, %r3
	.word 0xee58a398  ! 1286: LDX_I	ldx	[%r2 + 0x0398], %r23
	.word 0x8a544006  ! 1291: UMUL_R	umul 	%r17, %r6, %r5
	.word 0xb64f6001  ! 1296: MULX_I	mulx 	%r29, 0x0001, %r27
	.word 0x8f6d4010  ! 1301: SDIVX_R	sdivx	%r21, %r16, %r7
	.word 0x956fc008  ! 1306: SDIVX_R	sdivx	%r31, %r8, %r10
	.word 0xbb692001  ! 1311: SDIVX_I	sdivx	%r4, 0x0001, %r29
	.word 0xb45f6001  ! 1316: SMUL_I	smul 	%r29, 0x0001, %r26
	.word 0x884ba001  ! 1321: MULX_I	mulx 	%r14, 0x0001, %r4
	.word 0xa6516001  ! 1326: UMUL_I	umul 	%r5, 0x0001, %r19
	.word 0xb64aa001  ! 1331: MULX_I	mulx 	%r10, 0x0001, %r27
	.word 0x86d3c00e  ! 1336: UMULcc_R	umulcc 	%r15, %r14, %r3
	.word 0x886a0005  ! 1341: UDIVX_R	udivx 	%r8, %r5, %r4
	.word 0x8cd56001  ! 1346: UMULcc_I	umulcc 	%r21, 0x0001, %r6
	.word 0xba6e0009  ! 1351: UDIVX_R	udivx 	%r24, %r9, %r29
	.word 0xb64c6001  ! 1356: MULX_I	mulx 	%r17, 0x0001, %r27
	.word 0xbc6ac01b  ! 1361: UDIVX_R	udivx 	%r11, %r27, %r30
	.word 0x86698014  ! 1366: UDIVX_R	udivx 	%r6, %r20, %r3
	.word 0x88fee001  ! 1371: SDIVcc_I	sdivcc 	%r27, 0x0001, %r4
	.word 0xa724a001  ! 1376: MULScc_I	mulscc 	%r18, 0x0001, %r19
	.word 0xbc4d0015  ! 1381: MULX_R	mulx 	%r20, %r21, %r30
	.word 0x867b6001  ! 1386: SDIV_I	sdiv 	%r13, 0x0001, %r3
	.word 0xaa6fe001  ! 1391: UDIVX_I	udivx 	%r31, 0x0001, %r21
	.word 0x8e6ec019  ! 1396: UDIVX_R	udivx 	%r27, %r25, %r7
	.word 0xacd92001  ! 1401: SMULcc_I	smulcc 	%r4, 0x0001, %r22
	.word 0xae6de001  ! 1406: UDIVX_I	udivx 	%r23, 0x0001, %r23
	.word 0x94680016  ! 1411: UDIVX_R	udivx 	%r0, %r22, %r10
	.word 0x896b2001  ! 1416: SDIVX_I	sdivx	%r12, 0x0001, %r4
	.word 0xb66e0008  ! 1421: UDIVX_R	udivx 	%r24, %r8, %r27
	.word 0xb47ee001  ! 1426: SDIV_I	sdiv 	%r27, 0x0001, %r26
	.word 0x9c512001  ! 1431: UMUL_I	umul 	%r4, 0x0001, %r14
	.word 0xb056400c  ! 1436: UMUL_R	umul 	%r25, %r12, %r24
	.word 0x9c692001  ! 1441: UDIVX_I	udivx 	%r4, 0x0001, %r14
	.word 0x90f9401a  ! 1446: SDIVcc_R	sdivcc 	%r5, %r26, %r8
	.word 0xb269c000  ! 1451: UDIVX_R	udivx 	%r7, %r0, %r25
	.word 0xb255e001  ! 1456: UMUL_I	umul 	%r23, 0x0001, %r25
	.word 0x8a4be001  ! 1461: MULX_I	mulx 	%r15, 0x0001, %r5
	.word 0xac79a001  ! 1466: SDIV_I	sdiv 	%r6, 0x0001, %r22
	.word 0xac6b4014  ! 1471: UDIVX_R	udivx 	%r13, %r20, %r22
	.word 0xaa6c0010  ! 1476: UDIVX_R	udivx 	%r16, %r16, %r21
	.word 0x86f2a001  ! 1481: UDIVcc_I	udivcc 	%r10, 0x0001, %r3
	.word 0x9a5d6001  ! 1486: SMUL_I	smul 	%r21, 0x0001, %r13
	.word 0xb8496001  ! 1491: MULX_I	mulx 	%r5, 0x0001, %r28
	.word 0xa84e2001  ! 1496: MULX_I	mulx 	%r24, 0x0001, %r20
	.word 0x924f4006  ! 1501: MULX_R	mulx 	%r29, %r6, %r9
	.word 0x95252001  ! 1506: MULScc_I	mulscc 	%r20, 0x0001, %r10
	.word 0x81822001  ! 1511: WRY_I	wr	%r8, 0x0001, %y
	.word 0x8c780009  ! 1516: SDIV_R	sdiv 	%r0, %r9, %r6
	.word 0x9d210005  ! 1521: MULScc_R	mulscc 	%r4, %r5, %r14
	.word 0xb56c2001  ! 1526: SDIVX_I	sdivx	%r16, 0x0001, %r26
	.word 0xaa4d400f  ! 1531: MULX_R	mulx 	%r21, %r15, %r21
	.word 0x884b2001  ! 1536: MULX_I	mulx 	%r12, 0x0001, %r4
	.word 0xbe6b4015  ! 1541: UDIVX_R	udivx 	%r13, %r21, %r31
	.word 0xb672e001  ! 1546: UDIV_I	udiv 	%r11, 0x0001, %r27
	.word 0x8f69c01e  ! 1551: SDIVX_R	sdivx	%r7, %r30, %r7
	.word 0x996b800d  ! 1556: SDIVX_R	sdivx	%r14, %r13, %r12
	.word 0x947be001  ! 1561: SDIV_I	sdiv 	%r15, 0x0001, %r10
	.word 0x8649401f  ! 1566: MULX_R	mulx 	%r5, %r31, %r3
	.word 0xaa4aa001  ! 1571: MULX_I	mulx 	%r10, 0x0001, %r21
	.word 0x964a8011  ! 1576: MULX_R	mulx 	%r10, %r17, %r11
	.word 0x8c4d6001  ! 1581: MULX_I	mulx 	%r21, 0x0001, %r6
	.word 0x86f2c007  ! 1586: UDIVcc_R	udivcc 	%r11, %r7, %r3
	.word 0xa8f16001  ! 1591: UDIVcc_I	udivcc 	%r5, 0x0001, %r20
	.word 0xb2fd8016  ! 1596: SDIVcc_R	sdivcc 	%r22, %r22, %r25
	.word 0x94fec00a  ! 1601: SDIVcc_R	sdivcc 	%r27, %r10, %r10
	.word 0x9edc2001  ! 1606: SMULcc_I	smulcc 	%r16, 0x0001, %r15
	.word 0xbc4f6001  ! 1611: MULX_I	mulx 	%r29, 0x0001, %r30
	.word 0x81856001  ! 1616: WRY_I	wr	%r21, 0x0001, %y
	.word 0x8efbe001  ! 1621: SDIVcc_I	sdivcc 	%r15, 0x0001, %r7
	.word 0xea58a4d8  ! 1626: LDX_I	ldx	[%r2 + 0x04d8], %r21
	.word 0x944dc016  ! 1631: MULX_R	mulx 	%r23, %r22, %r10
	.word 0xa47ba001  ! 1636: SDIV_I	sdiv 	%r14, 0x0001, %r18
	.word 0xb06c6001  ! 1641: UDIVX_I	udivx 	%r17, 0x0001, %r24
	.word 0x9a4c400f  ! 1646: MULX_R	mulx 	%r17, %r15, %r13
	.word 0x916ec01a  ! 1651: SDIVX_R	sdivx	%r27, %r26, %r8
	.word 0x88682001  ! 1656: UDIVX_I	udivx 	%r0, 0x0001, %r4
	.word 0xbc7b001d  ! 1661: SDIV_R	sdiv 	%r12, %r29, %r30
	.word 0xba6ec00a  ! 1666: UDIVX_R	udivx 	%r27, %r10, %r29
	.word 0x956f4018  ! 1671: SDIVX_R	sdivx	%r29, %r24, %r10
	.word 0x9469401d  ! 1676: UDIVX_R	udivx 	%r5, %r29, %r10
	.word 0x8d6d4010  ! 1681: SDIVX_R	sdivx	%r21, %r16, %r6
	.word 0xab6bc01c  ! 1686: SDIVX_R	sdivx	%r15, %r28, %r21
	.word 0x8b25c00e  ! 1691: MULScc_R	mulscc 	%r23, %r14, %r5
	.word 0xa6f4801b  ! 1696: UDIVcc_R	udivcc 	%r18, %r27, %r19
	.word 0xa44cc008  ! 1701: MULX_R	mulx 	%r19, %r8, %r18
	.word 0xb649a001  ! 1706: MULX_I	mulx 	%r6, 0x0001, %r27
	.word 0xab6ae001  ! 1711: SDIVX_I	sdivx	%r11, 0x0001, %r21
	.word 0x8a6c0014  ! 1716: UDIVX_R	udivx 	%r16, %r20, %r5
	.word 0xb6534018  ! 1721: UMUL_R	umul 	%r13, %r24, %r27
	.word 0x91692001  ! 1726: SDIVX_I	sdivx	%r4, 0x0001, %r8
	.word 0xa248e001  ! 1731: MULX_I	mulx 	%r3, 0x0001, %r17
	.word 0xa04b000c  ! 1736: MULX_R	mulx 	%r12, %r12, %r16
	.word 0xa84f400b  ! 1741: MULX_R	mulx 	%r29, %r11, %r20
	.word 0x984ea001  ! 1746: MULX_I	mulx 	%r26, 0x0001, %r12
	.word 0xa2fee001  ! 1751: SDIVcc_I	sdivcc 	%r27, 0x0001, %r17
	.word 0xac53e001  ! 1756: UMUL_I	umul 	%r15, 0x0001, %r22
	.word 0x94f98018  ! 1761: SDIVcc_R	sdivcc 	%r6, %r24, %r10
	.word 0x8184a001  ! 1766: WRY_I	wr	%r18, 0x0001, %y
	.word 0x926a2001  ! 1771: UDIVX_I	udivx 	%r8, 0x0001, %r9
	.word 0x81862001  ! 1776: WRY_I	wr	%r24, 0x0001, %y
	.word 0x94f46001  ! 1781: UDIVcc_I	udivcc 	%r17, 0x0001, %r10
	.word 0xbe5e001d  ! 1786: SMUL_R	smul 	%r24, %r29, %r31
	.word 0xb05ea001  ! 1791: SMUL_I	smul 	%r26, 0x0001, %r24
	.word 0x924ce001  ! 1796: MULX_I	mulx 	%r19, 0x0001, %r9
	.word 0xbe700013  ! 1801: UDIV_R	udiv 	%r0, %r19, %r31
	.word 0xb3222001  ! 1806: MULScc_I	mulscc 	%r8, 0x0001, %r25
	.word 0xb0d76001  ! 1811: UMULcc_I	umulcc 	%r29, 0x0001, %r24
	.word 0xa46e2001  ! 1816: UDIVX_I	udivx 	%r24, 0x0001, %r18
	.word 0x964f2001  ! 1821: MULX_I	mulx 	%r28, 0x0001, %r11
	.word 0xb4680017  ! 1826: UDIVX_R	udivx 	%r0, %r23, %r26
	.word 0xacdac01c  ! 1831: SMULcc_R	smulcc 	%r11, %r28, %r22
	.word 0x9e6a000d  ! 1836: UDIVX_R	udivx 	%r8, %r13, %r15
	.word 0x9f6ea001  ! 1841: SDIVX_I	sdivx	%r26, 0x0001, %r15
	.word 0x94d7401c  ! 1846: UMULcc_R	umulcc 	%r29, %r28, %r10
	.word 0xb048e001  ! 1851: MULX_I	mulx 	%r3, 0x0001, %r24
	.word 0xb248e001  ! 1856: MULX_I	mulx 	%r3, 0x0001, %r25
	.word 0xaa6c2001  ! 1861: UDIVX_I	udivx 	%r16, 0x0001, %r21
	.word 0xa24f2001  ! 1866: MULX_I	mulx 	%r28, 0x0001, %r17
	.word 0xa469a001  ! 1871: UDIVX_I	udivx 	%r6, 0x0001, %r18
	.word 0xa64b6001  ! 1876: MULX_I	mulx 	%r13, 0x0001, %r19
	.word 0x8181a001  ! 1881: WRY_I	wr	%r6, 0x0001, %y
	.word 0x946f6001  ! 1886: UDIVX_I	udivx 	%r29, 0x0001, %r10
	.word 0xb8f7c00b  ! 1891: UDIVcc_R	udivcc 	%r31, %r11, %r28
	.word 0xa04c000d  ! 1896: MULX_R	mulx 	%r16, %r13, %r16
	.word 0x9726001b  ! 1901: MULScc_R	mulscc 	%r24, %r27, %r11
	.word 0x8c6ca001  ! 1906: UDIVX_I	udivx 	%r18, 0x0001, %r6
	.word 0xa66c401f  ! 1911: UDIVX_R	udivx 	%r17, %r31, %r19
	.word 0xa0df4007  ! 1916: SMULcc_R	smulcc 	%r29, %r7, %r16
	.word 0xe65862c8  ! 1921: LDX_I	ldx	[%r1 + 0x02c8], %r19
	.word 0x8672c009  ! 1926: UDIV_R	udiv 	%r11, %r9, %r3
	.word 0x9727001f  ! 1931: MULScc_R	mulscc 	%r28, %r31, %r11
	.word 0xb468c008  ! 1936: UDIVX_R	udivx 	%r3, %r8, %r26
	.word 0xbc6a801e  ! 1941: UDIVX_R	udivx 	%r10, %r30, %r30
	.word 0x8e4ee001  ! 1946: MULX_I	mulx 	%r27, 0x0001, %r7
	.word 0xb56e401f  ! 1951: SDIVX_R	sdivx	%r25, %r31, %r26
	.word 0xa6ddc000  ! 1956: SMULcc_R	smulcc 	%r23, %r0, %r19
	.word 0x9b6b401e  ! 1961: SDIVX_R	sdivx	%r13, %r30, %r13
	.word 0xb6692001  ! 1966: UDIVX_I	udivx 	%r4, 0x0001, %r27
	.word 0xbe71c00e  ! 1971: UDIV_R	udiv 	%r7, %r14, %r31
	.word 0xb726e001  ! 1976: MULScc_I	mulscc 	%r27, 0x0001, %r27
	.word 0x9168c010  ! 1981: SDIVX_R	sdivx	%r3, %r16, %r8
	.word 0xa4d02001  ! 1986: UMULcc_I	umulcc 	%r0, 0x0001, %r18
	.word 0xae690003  ! 1991: UDIVX_R	udivx 	%r4, %r3, %r23
	.word 0xb4d82001  ! 1996: SMULcc_I	smulcc 	%r0, 0x0001, %r26
	.word 0xb8520013  ! 2001: UMUL_R	umul 	%r8, %r19, %r28
	.word 0xf258a4b0  ! 2006: LDX_I	ldx	[%r2 + 0x04b0], %r25
	.word 0xa96cc000  ! 2011: SDIVX_R	sdivx	%r19, %r0, %r20
	.word 0x885b401f  ! 2016: SMUL_R	smul 	%r13, %r31, %r4
	.word 0x984f0003  ! 2021: MULX_R	mulx 	%r28, %r3, %r12
	.word 0x976f800a  ! 2026: SDIVX_R	sdivx	%r30, %r10, %r11
	.word 0xa4496001  ! 2031: MULX_I	mulx 	%r5, 0x0001, %r18
	.word 0xa16f8017  ! 2036: SDIVX_R	sdivx	%r30, %r23, %r16
	.word 0xbb680005  ! 2041: SDIVX_R	sdivx	%r0, %r5, %r29
	.word 0xa05b000d  ! 2046: SMUL_R	smul 	%r12, %r13, %r16
	.word 0xbf27801d  ! 2051: MULScc_R	mulscc 	%r30, %r29, %r31
	.word 0xbc49401f  ! 2056: MULX_R	mulx 	%r5, %r31, %r30
	.word 0xa0dc4013  ! 2061: SMULcc_R	smulcc 	%r17, %r19, %r16
	.word 0xae49c017  ! 2066: MULX_R	mulx 	%r7, %r23, %r23
	.word 0x92682001  ! 2071: UDIVX_I	udivx 	%r0, 0x0001, %r9
	.word 0xac4fa001  ! 2076: MULX_I	mulx 	%r30, 0x0001, %r22
	.word 0xa84a6001  ! 2081: MULX_I	mulx 	%r9, 0x0001, %r20
	.word 0xb7692001  ! 2086: SDIVX_I	sdivx	%r4, 0x0001, %r27
	.word 0xb64c2001  ! 2091: MULX_I	mulx 	%r16, 0x0001, %r27
	.word 0xa455401b  ! 2096: UMUL_R	umul 	%r21, %r27, %r18
	.word 0x8f234013  ! 2101: MULScc_R	mulscc 	%r13, %r19, %r7
	.word 0x8b232001  ! 2106: MULScc_I	mulscc 	%r12, 0x0001, %r5
	.word 0xa3238011  ! 2111: MULScc_R	mulscc 	%r14, %r17, %r17
	.word 0x876de001  ! 2116: SDIVX_I	sdivx	%r23, 0x0001, %r3
	.word 0xa873a001  ! 2121: UDIV_I	udiv 	%r14, 0x0001, %r20
	.word 0xae6fe001  ! 2126: UDIVX_I	udivx 	%r31, 0x0001, %r23
	.word 0xa459400b  ! 2131: SMUL_R	smul 	%r5, %r11, %r18
	.word 0x88dfe001  ! 2136: SMULcc_I	smulcc 	%r31, 0x0001, %r4
	.word 0xd65863a8  ! 2141: LDX_I	ldx	[%r1 + 0x03a8], %r11
	.word 0x9e4e6001  ! 2146: MULX_I	mulx 	%r25, 0x0001, %r15
	.word 0x90f14009  ! 2151: UDIVcc_R	udivcc 	%r5, %r9, %r8
	.word 0x92696001  ! 2156: UDIVX_I	udivx 	%r5, 0x0001, %r9
	.word 0xa0f80017  ! 2161: SDIVcc_R	sdivcc 	%r0, %r23, %r16
	.word 0x9c4ce001  ! 2166: MULX_I	mulx 	%r19, 0x0001, %r14
	.word 0x9f6e2001  ! 2171: SDIVX_I	sdivx	%r24, 0x0001, %r15
	.word 0x8b6f0006  ! 2176: SDIVX_R	sdivx	%r28, %r6, %r5
	.word 0xfa5867c8  ! 2181: LDX_I	ldx	[%r1 + 0x07c8], %r29
	.word 0xb8d38014  ! 2186: UMULcc_R	umulcc 	%r14, %r20, %r28
	.word 0x8180e001  ! 2191: WRY_I	wr	%r3, 0x0001, %y
	.word 0xb85ae001  ! 2196: SMUL_I	smul 	%r11, 0x0001, %r28
	.word 0xae5da001  ! 2201: SMUL_I	smul 	%r22, 0x0001, %r23
	.word 0xa84c401e  ! 2206: MULX_R	mulx 	%r17, %r30, %r20
	.word 0xad692001  ! 2211: SDIVX_I	sdivx	%r4, 0x0001, %r22
	.word 0x81856001  ! 2216: WRY_I	wr	%r21, 0x0001, %y
	.word 0xa26f4014  ! 2221: UDIVX_R	udivx 	%r29, %r20, %r17
	.word 0xa44d6001  ! 2226: MULX_I	mulx 	%r21, 0x0001, %r18
	.word 0xaaf50011  ! 2231: UDIVcc_R	udivcc 	%r20, %r17, %r21
	.word 0xa04aa001  ! 2236: MULX_I	mulx 	%r10, 0x0001, %r16
	.word 0xb24e8008  ! 2241: MULX_R	mulx 	%r26, %r8, %r25
	.word 0xa448c00a  ! 2246: MULX_R	mulx 	%r3, %r10, %r18
	.word 0xb069c00a  ! 2251: UDIVX_R	udivx 	%r7, %r10, %r24
	.word 0xb86fc006  ! 2256: UDIVX_R	udivx 	%r31, %r6, %r28
	.word 0xbe6f6001  ! 2261: UDIVX_I	udivx 	%r29, 0x0001, %r31
	.word 0x8720000c  ! 2266: MULScc_R	mulscc 	%r0, %r12, %r3
	.word 0xbd6f0007  ! 2271: SDIVX_R	sdivx	%r28, %r7, %r30
	.word 0x9a516001  ! 2276: UMUL_I	umul 	%r5, 0x0001, %r13
	.word 0x88760006  ! 2281: UDIV_R	udiv 	%r24, %r6, %r4
	.word 0xbd6a4019  ! 2286: SDIVX_R	sdivx	%r9, %r25, %r30
	.word 0xbc48000e  ! 2291: MULX_R	mulx 	%r0, %r14, %r30
	.word 0x8cde2001  ! 2296: SMULcc_I	smulcc 	%r24, 0x0001, %r6
	.word 0x81802001  ! 2301: WRY_I	wr	%r0, 0x0001, %y
	.word 0x86682001  ! 2306: UDIVX_I	udivx 	%r0, 0x0001, %r3
	.word 0xb272e001  ! 2311: UDIV_I	udiv 	%r11, 0x0001, %r25
	.word 0x9c7be001  ! 2316: SDIV_I	sdiv 	%r15, 0x0001, %r14
	.word 0xaa4ec00c  ! 2321: MULX_R	mulx 	%r27, %r12, %r21
	.word 0xbe52400e  ! 2326: UMUL_R	umul 	%r9, %r14, %r31
	.word 0x9e4cc018  ! 2331: MULX_R	mulx 	%r19, %r24, %r15
	.word 0xb65be001  ! 2336: SMUL_I	smul 	%r15, 0x0001, %r27
	.word 0xa727e001  ! 2341: MULScc_I	mulscc 	%r31, 0x0001, %r19
	.word 0xa04a8011  ! 2346: MULX_R	mulx 	%r10, %r17, %r16
	.word 0x8c79c012  ! 2351: SDIV_R	sdiv 	%r7, %r18, %r6
	.word 0xa6796001  ! 2356: SDIV_I	sdiv 	%r5, 0x0001, %r19
	.word 0xa326c00c  ! 2361: MULScc_R	mulscc 	%r27, %r12, %r17
	.word 0xa04d8007  ! 2366: MULX_R	mulx 	%r22, %r7, %r16
	.word 0xca58a300  ! 2371: LDX_I	ldx	[%r2 + 0x0300], %r5
	.word 0xb3266001  ! 2376: MULScc_I	mulscc 	%r25, 0x0001, %r25
	.word 0xba700016  ! 2381: UDIV_R	udiv 	%r0, %r22, %r29
	.word 0xb4d8000e  ! 2386: SMULcc_R	smulcc 	%r0, %r14, %r26
	.word 0xbc7aa001  ! 2391: SDIV_I	sdiv 	%r10, 0x0001, %r30
	.word 0xb07f001e  ! 2396: SDIV_R	sdiv 	%r28, %r30, %r24
	.word 0xd2586090  ! 2401: LDX_I	ldx	[%r1 + 0x0090], %r9
	.word 0x9b22400b  ! 2406: MULScc_R	mulscc 	%r9, %r11, %r13
	.word 0x8a6dc01d  ! 2411: UDIVX_R	udivx 	%r23, %r29, %r5
	.word 0xa24f6001  ! 2416: MULX_I	mulx 	%r29, 0x0001, %r17
	.word 0xa86ac014  ! 2421: UDIVX_R	udivx 	%r11, %r20, %r20
	.word 0x92482001  ! 2426: MULX_I	mulx 	%r0, 0x0001, %r9
	.word 0x996b2001  ! 2431: SDIVX_I	sdivx	%r12, 0x0001, %r12
	.word 0xbeddc009  ! 2436: SMULcc_R	smulcc 	%r23, %r9, %r31
	.word 0x906ba001  ! 2441: UDIVX_I	udivx 	%r14, 0x0001, %r8
	.word 0x944ac012  ! 2446: MULX_R	mulx 	%r11, %r18, %r10
	.word 0x944bc000  ! 2451: MULX_R	mulx 	%r15, %r0, %r10
	.word 0xaf6ae001  ! 2456: SDIVX_I	sdivx	%r11, 0x0001, %r23
	.word 0x81802001  ! 2461: WRY_I	wr	%r0, 0x0001, %y
	.word 0x8e57a001  ! 2466: UMUL_I	umul 	%r30, 0x0001, %r7
	.word 0xd658a550  ! 2471: LDX_I	ldx	[%r2 + 0x0550], %r11
	.word 0xae4f4008  ! 2476: MULX_R	mulx 	%r29, %r8, %r23
	.word 0x8c5d2001  ! 2481: SMUL_I	smul 	%r20, 0x0001, %r6
	.word 0xb368c017  ! 2486: SDIVX_R	sdivx	%r3, %r23, %r25
	.word 0xab69001a  ! 2491: SDIVX_R	sdivx	%r4, %r26, %r21
	.word 0xbd6f6001  ! 2496: SDIVX_I	sdivx	%r29, 0x0001, %r30
	.word 0x8c6c401d  ! 2501: UDIVX_R	udivx 	%r17, %r29, %r6
	.word 0xa051e001  ! 2506: UMUL_I	umul 	%r7, 0x0001, %r16
	.word 0xa47cc000  ! 2511: SDIV_R	sdiv 	%r19, %r0, %r18
	.word 0x886d800f  ! 2516: UDIVX_R	udivx 	%r22, %r15, %r4
	.word 0x96482001  ! 2521: MULX_I	mulx 	%r0, 0x0001, %r11
	.word 0x996e4007  ! 2526: SDIVX_R	sdivx	%r25, %r7, %r12
	.word 0xa76e8014  ! 2531: SDIVX_R	sdivx	%r26, %r20, %r19
	.word 0xa04e800b  ! 2536: MULX_R	mulx 	%r26, %r11, %r16
	.word 0x984ba001  ! 2541: MULX_I	mulx 	%r14, 0x0001, %r12
	.word 0xa24e6001  ! 2546: MULX_I	mulx 	%r25, 0x0001, %r17
	.word 0x8c6b4012  ! 2551: UDIVX_R	udivx 	%r13, %r18, %r6
	.word 0xca58a190  ! 2556: LDX_I	ldx	[%r2 + 0x0190], %r5
	.word 0xb47c4008  ! 2561: SDIV_R	sdiv 	%r17, %r8, %r26
	.word 0x8184e001  ! 2566: WRY_I	wr	%r19, 0x0001, %y
	.word 0x9e4e800f  ! 2571: MULX_R	mulx 	%r26, %r15, %r15
	.word 0x8c68e001  ! 2576: UDIVX_I	udivx 	%r3, 0x0001, %r6
	.word 0xa26d801f  ! 2581: UDIVX_R	udivx 	%r22, %r31, %r17
	.word 0xa8f38005  ! 2586: UDIVcc_R	udivcc 	%r14, %r5, %r20
	.word 0x8e6f0000  ! 2591: UDIVX_R	udivx 	%r28, %r0, %r7
	.word 0x876d0013  ! 2596: SDIVX_R	sdivx	%r20, %r19, %r3
	.word 0xb0572001  ! 2601: UMUL_I	umul 	%r28, 0x0001, %r24
	.word 0x864a2001  ! 2606: MULX_I	mulx 	%r8, 0x0001, %r3
	.word 0xb0492001  ! 2611: MULX_I	mulx 	%r4, 0x0001, %r24
	.word 0xac6be001  ! 2616: UDIVX_I	udivx 	%r15, 0x0001, %r22
	.word 0xb96a001a  ! 2621: SDIVX_R	sdivx	%r8, %r26, %r28
	.word 0xae73c016  ! 2626: UDIV_R	udiv 	%r15, %r22, %r23
	.word 0xba480006  ! 2631: MULX_R	mulx 	%r0, %r6, %r29
	.word 0xbb6e2001  ! 2636: SDIVX_I	sdivx	%r24, 0x0001, %r29
	.word 0x88d3e001  ! 2641: UMULcc_I	umulcc 	%r15, 0x0001, %r4
	.word 0x904ec007  ! 2646: MULX_R	mulx 	%r27, %r7, %r8
	.word 0x9f696001  ! 2651: SDIVX_I	sdivx	%r5, 0x0001, %r15
	.word 0x8a7dc011  ! 2656: SDIV_R	sdiv 	%r23, %r17, %r5
	.word 0xa24b6001  ! 2661: MULX_I	mulx 	%r13, 0x0001, %r17
	.word 0xd8586138  ! 2666: LDX_I	ldx	[%r1 + 0x0138], %r12
	.word 0xaa482001  ! 2671: MULX_I	mulx 	%r0, 0x0001, %r21
	.word 0xaefb001d  ! 2676: SDIVcc_R	sdivcc 	%r12, %r29, %r23
	.word 0xa6f02001  ! 2681: UDIVcc_I	udivcc 	%r0, 0x0001, %r19
	.word 0x9069e001  ! 2686: UDIVX_I	udivx 	%r7, 0x0001, %r8
	.word 0x964d6001  ! 2691: MULX_I	mulx 	%r21, 0x0001, %r11
	.word 0x9f23800a  ! 2696: MULScc_R	mulscc 	%r14, %r10, %r15
	.word 0xa36f8000  ! 2701: SDIVX_R	sdivx	%r30, %r0, %r17
	.word 0xb6d1e001  ! 2706: UMULcc_I	umulcc 	%r7, 0x0001, %r27
	.word 0x8aff2001  ! 2711: SDIVcc_I	sdivcc 	%r28, 0x0001, %r5
	.word 0x8d6ac010  ! 2716: SDIVX_R	sdivx	%r11, %r16, %r6
	.word 0xa06c2001  ! 2721: UDIVX_I	udivx 	%r16, 0x0001, %r16
	.word 0xaef0c013  ! 2726: UDIVcc_R	udivcc 	%r3, %r19, %r23
	.word 0xb3274010  ! 2731: MULScc_R	mulscc 	%r29, %r16, %r25
	.word 0xa26ec009  ! 2736: UDIVX_R	udivx 	%r27, %r9, %r17
	.word 0xa56a401a  ! 2741: SDIVX_R	sdivx	%r9, %r26, %r18
	.word 0x9f680000  ! 2746: SDIVX_R	sdivx	%r0, %r0, %r15
	.word 0x984d6001  ! 2751: MULX_I	mulx 	%r21, 0x0001, %r12
	.word 0xac6b401a  ! 2756: UDIVX_R	udivx 	%r13, %r26, %r22
	.word 0xf8586460  ! 2761: LDX_I	ldx	[%r1 + 0x0460], %r28
	.word 0x876e2001  ! 2766: SDIVX_I	sdivx	%r24, 0x0001, %r3
	.word 0xbc4b6001  ! 2771: MULX_I	mulx 	%r13, 0x0001, %r30
	.word 0x96dec01a  ! 2776: SMULcc_R	smulcc 	%r27, %r26, %r11
	.word 0xb56e801e  ! 2781: SDIVX_R	sdivx	%r26, %r30, %r26
	.word 0xb65f6001  ! 2786: SMUL_I	smul 	%r29, 0x0001, %r27
	.word 0xf25866a0  ! 2791: LDX_I	ldx	[%r1 + 0x06a0], %r25
	.word 0xb6db4012  ! 2796: SMULcc_R	smulcc 	%r13, %r18, %r27
	.word 0xbe6be001  ! 2801: UDIVX_I	udivx 	%r15, 0x0001, %r31
	.word 0x9568001b  ! 2806: SDIVX_R	sdivx	%r0, %r27, %r10
	.word 0x885a400f  ! 2811: SMUL_R	smul 	%r9, %r15, %r4
	.word 0xacff8016  ! 2816: SDIVcc_R	sdivcc 	%r30, %r22, %r22
	.word 0xbe4d000b  ! 2821: MULX_R	mulx 	%r20, %r11, %r31
	.word 0x9849e001  ! 2826: MULX_I	mulx 	%r7, 0x0001, %r12
	.word 0x926e400d  ! 2831: UDIVX_R	udivx 	%r25, %r13, %r9
	.word 0x964c6001  ! 2836: MULX_I	mulx 	%r17, 0x0001, %r11
	.word 0xbb6c400c  ! 2841: SDIVX_R	sdivx	%r17, %r12, %r29
	.word 0x966e0012  ! 2846: UDIVX_R	udivx 	%r24, %r18, %r11
	.word 0xa6f48016  ! 2851: UDIVcc_R	udivcc 	%r18, %r22, %r19
	.word 0x944b4011  ! 2856: MULX_R	mulx 	%r13, %r17, %r10
	.word 0xb36c800f  ! 2861: SDIVX_R	sdivx	%r18, %r15, %r25
	.word 0xb46d8018  ! 2866: UDIVX_R	udivx 	%r22, %r24, %r26
	.word 0xba79a001  ! 2871: SDIV_I	sdiv 	%r6, 0x0001, %r29
	.word 0xb27c000b  ! 2876: SDIV_R	sdiv 	%r16, %r11, %r25
	.word 0x81856001  ! 2881: WRY_I	wr	%r21, 0x0001, %y
	.word 0x9e6a4017  ! 2886: UDIVX_R	udivx 	%r9, %r23, %r15
	.word 0x916f8000  ! 2891: SDIVX_R	sdivx	%r30, %r0, %r8
	.word 0xb2fae001  ! 2896: SDIVcc_I	sdivcc 	%r11, 0x0001, %r25
	.word 0xae4ec00e  ! 2901: MULX_R	mulx 	%r27, %r14, %r23
	.word 0xa46f2001  ! 2906: UDIVX_I	udivx 	%r28, 0x0001, %r18
	.word 0xb8766001  ! 2911: UDIV_I	udiv 	%r25, 0x0001, %r28
	.word 0x8a6a400e  ! 2916: UDIVX_R	udivx 	%r9, %r14, %r5
	.word 0x8e560013  ! 2921: UMUL_R	umul 	%r24, %r19, %r7
	.word 0xaaf58009  ! 2926: UDIVcc_R	udivcc 	%r22, %r9, %r21
	.word 0x956bc00b  ! 2931: SDIVX_R	sdivx	%r15, %r11, %r10
	.word 0xa4d1c00b  ! 2936: UMULcc_R	umulcc 	%r7, %r11, %r18
	.word 0x9d6ac012  ! 2941: SDIVX_R	sdivx	%r11, %r18, %r14
	.word 0xa6746001  ! 2946: UDIV_I	udiv 	%r17, 0x0001, %r19
	.word 0x9879401c  ! 2951: SDIV_R	sdiv 	%r5, %r28, %r12
	.word 0x9f696001  ! 2956: SDIVX_I	sdivx	%r5, 0x0001, %r15
	.word 0xac4c2001  ! 2961: MULX_I	mulx 	%r16, 0x0001, %r22
	.word 0x8d6e000a  ! 2966: SDIVX_R	sdivx	%r24, %r10, %r6
	.word 0x8e4e401f  ! 2971: MULX_R	mulx 	%r25, %r31, %r7
	.word 0x924f6001  ! 2976: MULX_I	mulx 	%r29, 0x0001, %r9
	.word 0x946b0015  ! 2981: UDIVX_R	udivx 	%r12, %r21, %r10
	.word 0xa66b400e  ! 2986: UDIVX_R	udivx 	%r13, %r14, %r19
	.word 0x9b6bc01d  ! 2991: SDIVX_R	sdivx	%r15, %r29, %r13
	.word 0x8adb2001  ! 2996: SMULcc_I	smulcc 	%r12, 0x0001, %r5
	.word 0x924b000e  ! 3001: MULX_R	mulx 	%r12, %r14, %r9
	.word 0xa86dc01a  ! 3006: UDIVX_R	udivx 	%r23, %r26, %r20
	.word 0x966c0000  ! 3011: UDIVX_R	udivx 	%r16, %r0, %r11
	.word 0xb676e001  ! 3016: UDIV_I	udiv 	%r27, 0x0001, %r27
	.word 0x8669801b  ! 3021: UDIVX_R	udivx 	%r6, %r27, %r3
	.word 0x8b6d801b  ! 3026: SDIVX_R	sdivx	%r22, %r27, %r5
	.word 0x9f69c009  ! 3031: SDIVX_R	sdivx	%r7, %r9, %r15
	.word 0xaf6fe001  ! 3036: SDIVX_I	sdivx	%r31, 0x0001, %r23
	.word 0xb0d72001  ! 3041: UMULcc_I	umulcc 	%r28, 0x0001, %r24
	.word 0x8e58e001  ! 3046: SMUL_I	smul 	%r3, 0x0001, %r7
	.word 0xb76fc00f  ! 3051: SDIVX_R	sdivx	%r31, %r15, %r27
	.word 0x907f0013  ! 3056: SDIV_R	sdiv 	%r28, %r19, %r8
	.word 0x984ee001  ! 3061: MULX_I	mulx 	%r27, 0x0001, %r12
	.word 0xba73a001  ! 3066: UDIV_I	udiv 	%r14, 0x0001, %r29
	.word 0xb16c8013  ! 3071: SDIVX_R	sdivx	%r18, %r19, %r24
	.word 0x94532001  ! 3076: UMUL_I	umul 	%r12, 0x0001, %r10
	.word 0xbd6c6001  ! 3081: SDIVX_I	sdivx	%r17, 0x0001, %r30
	.word 0xbc7f000e  ! 3086: SDIV_R	sdiv 	%r28, %r14, %r30
	.word 0xb649c01e  ! 3091: MULX_R	mulx 	%r7, %r30, %r27
	.word 0x996ac012  ! 3096: SDIVX_R	sdivx	%r11, %r18, %r12
	.word 0x8d6f8007  ! 3101: SDIVX_R	sdivx	%r30, %r7, %r6
	.word 0xa849e001  ! 3106: MULX_I	mulx 	%r7, 0x0001, %r20
	.word 0xbe5dc010  ! 3111: SMUL_R	smul 	%r23, %r16, %r31
	.word 0xbc6da001  ! 3116: UDIVX_I	udivx 	%r22, 0x0001, %r30
	.word 0x9925e001  ! 3121: MULScc_I	mulscc 	%r23, 0x0001, %r12
	.word 0x986ee001  ! 3126: UDIVX_I	udivx 	%r27, 0x0001, %r12
	.word 0xb67ea001  ! 3131: SDIV_I	sdiv 	%r26, 0x0001, %r27
	.word 0xbf6d6001  ! 3136: SDIVX_I	sdivx	%r21, 0x0001, %r31
	.word 0xad210004  ! 3141: MULScc_R	mulscc 	%r4, %r4, %r22
	.word 0xaedd401a  ! 3146: SMULcc_R	smulcc 	%r21, %r26, %r23
	.word 0xa86da001  ! 3151: UDIVX_I	udivx 	%r22, 0x0001, %r20
	.word 0xe6586248  ! 3156: LDX_I	ldx	[%r1 + 0x0248], %r19
	.word 0xaa6c2001  ! 3161: UDIVX_I	udivx 	%r16, 0x0001, %r21
	.word 0xa66ea001  ! 3166: UDIVX_I	udivx 	%r26, 0x0001, %r19
	.word 0x984d0018  ! 3171: MULX_R	mulx 	%r20, %r24, %r12
	.word 0x896f800e  ! 3176: SDIVX_R	sdivx	%r30, %r14, %r4
	.word 0xa64b2001  ! 3181: MULX_I	mulx 	%r12, 0x0001, %r19
	.word 0x88d9400f  ! 3186: SMULcc_R	smulcc 	%r5, %r15, %r4
	.word 0x964f401f  ! 3191: MULX_R	mulx 	%r29, %r31, %r11
	.word 0x926f2001  ! 3196: UDIVX_I	udivx 	%r28, 0x0001, %r9
	.word 0x964a0013  ! 3201: MULX_R	mulx 	%r8, %r19, %r11
	.word 0x8a4f401b  ! 3206: MULX_R	mulx 	%r29, %r27, %r5
	.word 0x98fb0017  ! 3211: SDIVcc_R	sdivcc 	%r12, %r23, %r12
	.word 0x8876a001  ! 3216: UDIV_I	udiv 	%r26, 0x0001, %r4
	.word 0x8f69c01f  ! 3221: SDIVX_R	sdivx	%r7, %r31, %r7
	.word 0xa6480010  ! 3226: MULX_R	mulx 	%r0, %r16, %r19
	.word 0xbcf2a001  ! 3231: UDIVcc_I	udivcc 	%r10, 0x0001, %r30
	.word 0xb049e001  ! 3236: MULX_I	mulx 	%r7, 0x0001, %r24
	.word 0x8d6ca001  ! 3241: SDIVX_I	sdivx	%r18, 0x0001, %r6
	.word 0xa469c009  ! 3246: UDIVX_R	udivx 	%r7, %r9, %r18
	.word 0xa4fec00a  ! 3251: SDIVcc_R	sdivcc 	%r27, %r10, %r18
	.word 0x884f0013  ! 3256: MULX_R	mulx 	%r28, %r19, %r4
	.word 0x896a400a  ! 3261: SDIVX_R	sdivx	%r9, %r10, %r4
	.word 0xaa482001  ! 3266: MULX_I	mulx 	%r0, 0x0001, %r21
	.word 0xaef96001  ! 3271: SDIVcc_I	sdivcc 	%r5, 0x0001, %r23
	.word 0x81842001  ! 3276: WRY_I	wr	%r16, 0x0001, %y
	.word 0x924ae001  ! 3281: MULX_I	mulx 	%r11, 0x0001, %r9
	.word 0x916a8005  ! 3286: SDIVX_R	sdivx	%r10, %r5, %r8
	.word 0x8cd8e001  ! 3291: SMULcc_I	smulcc 	%r3, 0x0001, %r6
	.word 0x896ac008  ! 3296: SDIVX_R	sdivx	%r11, %r8, %r4
	.word 0x94482001  ! 3301: MULX_I	mulx 	%r0, 0x0001, %r10
	.word 0x8a6de001  ! 3306: UDIVX_I	udivx 	%r23, 0x0001, %r5
	.word 0xae4c401d  ! 3311: MULX_R	mulx 	%r17, %r29, %r23
	.word 0xa84ee001  ! 3316: MULX_I	mulx 	%r27, 0x0001, %r20
	.word 0x9e7d001e  ! 3321: SDIV_R	sdiv 	%r20, %r30, %r15
	.word 0xae722001  ! 3326: UDIV_I	udiv 	%r8, 0x0001, %r23
	.word 0xda58a110  ! 3331: LDX_I	ldx	[%r2 + 0x0110], %r13
	.word 0x9a69c015  ! 3336: UDIVX_R	udivx 	%r7, %r21, %r13
	.word 0x98480000  ! 3341: MULX_R	mulx 	%r0, %r0, %r12
	.word 0xa27f0005  ! 3346: SDIV_R	sdiv 	%r28, %r5, %r17
	.word 0xbb68000d  ! 3351: SDIVX_R	sdivx	%r0, %r13, %r29
	.word 0x886bc005  ! 3356: UDIVX_R	udivx 	%r15, %r5, %r4
	.word 0x984b6001  ! 3361: MULX_I	mulx 	%r13, 0x0001, %r12
	.word 0xaf696001  ! 3366: SDIVX_I	sdivx	%r5, 0x0001, %r23
	.word 0x8e6e6001  ! 3371: UDIVX_I	udivx 	%r25, 0x0001, %r7
	.word 0x966b2001  ! 3376: UDIVX_I	udivx 	%r12, 0x0001, %r11
	.word 0xae756001  ! 3381: UDIV_I	udiv 	%r21, 0x0001, %r23
	.word 0xa24a401e  ! 3386: MULX_R	mulx 	%r9, %r30, %r17
	.word 0xa56f8003  ! 3391: SDIVX_R	sdivx	%r30, %r3, %r18
	.word 0xac4dc00a  ! 3396: MULX_R	mulx 	%r23, %r10, %r22
	.word 0x91694018  ! 3401: SDIVX_R	sdivx	%r5, %r24, %r8
	.word 0xac546001  ! 3406: UMUL_I	umul 	%r17, 0x0001, %r22
	.word 0x81812001  ! 3411: WRY_I	wr	%r4, 0x0001, %y
	.word 0xbb6a6001  ! 3416: SDIVX_I	sdivx	%r9, 0x0001, %r29
	.word 0xbcf2c00a  ! 3421: UDIVcc_R	udivcc 	%r11, %r10, %r30
	.word 0xb44f2001  ! 3426: MULX_I	mulx 	%r28, 0x0001, %r26
	.word 0x8cde8016  ! 3431: SMULcc_R	smulcc 	%r26, %r22, %r6
	.word 0xaa538016  ! 3436: UMUL_R	umul 	%r14, %r22, %r21
	.word 0x8849e001  ! 3441: MULX_I	mulx 	%r7, 0x0001, %r4
	.word 0x9c49a001  ! 3446: MULX_I	mulx 	%r6, 0x0001, %r14
	.word 0xb44e4019  ! 3451: MULX_R	mulx 	%r25, %r25, %r26
	.word 0xb6df8019  ! 3456: SMULcc_R	smulcc 	%r30, %r25, %r27
	.word 0xbc6a4003  ! 3461: UDIVX_R	udivx 	%r9, %r3, %r30
	.word 0xae5b0004  ! 3466: SMUL_R	smul 	%r12, %r4, %r23
	.word 0x9f27800f  ! 3471: MULScc_R	mulscc 	%r30, %r15, %r15
	.word 0x8f6e801b  ! 3476: SDIVX_R	sdivx	%r26, %r27, %r7
	.word 0xaa480010  ! 3481: MULX_R	mulx 	%r0, %r16, %r21
	.word 0xbc51a001  ! 3486: UMUL_I	umul 	%r6, 0x0001, %r30
	.word 0xbc6c6001  ! 3491: UDIVX_I	udivx 	%r17, 0x0001, %r30
	.word 0x90528000  ! 3496: UMUL_R	umul 	%r10, %r0, %r8
	.word 0x916c4008  ! 3501: SDIVX_R	sdivx	%r17, %r8, %r8
	.word 0xa8692001  ! 3506: UDIVX_I	udivx 	%r4, 0x0001, %r20
	.word 0x8186e001  ! 3511: WRY_I	wr	%r27, 0x0001, %y
	.word 0x926d0013  ! 3516: UDIVX_R	udivx 	%r20, %r19, %r9
	.word 0x8183e001  ! 3521: WRY_I	wr	%r15, 0x0001, %y
	.word 0xa8f24007  ! 3526: UDIVcc_R	udivcc 	%r9, %r7, %r20
	.word 0x9a6dc01d  ! 3531: UDIVX_R	udivx 	%r23, %r29, %r13
	.word 0xb050c01d  ! 3536: UMUL_R	umul 	%r3, %r29, %r24
	.word 0x924b8000  ! 3541: MULX_R	mulx 	%r14, %r0, %r9
	.word 0xa96d001e  ! 3546: SDIVX_R	sdivx	%r20, %r30, %r20
	.word 0x9b22401f  ! 3551: MULScc_R	mulscc 	%r9, %r31, %r13
	.word 0x885c6001  ! 3556: SMUL_I	smul 	%r17, 0x0001, %r4
	.word 0xb0df6001  ! 3561: SMULcc_I	smulcc 	%r29, 0x0001, %r24
	.word 0x876d2001  ! 3566: SDIVX_I	sdivx	%r20, 0x0001, %r3
	.word 0xb04ec006  ! 3571: MULX_R	mulx 	%r27, %r6, %r24
	.word 0xa4496001  ! 3576: MULX_I	mulx 	%r5, 0x0001, %r18
	.word 0x8d6f801b  ! 3581: SDIVX_R	sdivx	%r30, %r27, %r6
	.word 0xf858a548  ! 3586: LDX_I	ldx	[%r2 + 0x0548], %r28
	.word 0xb16b4003  ! 3591: SDIVX_R	sdivx	%r13, %r3, %r24
	.word 0x91264009  ! 3596: MULScc_R	mulscc 	%r25, %r9, %r8
	.word 0xac5e6001  ! 3601: SMUL_I	smul 	%r25, 0x0001, %r22
	.word 0xa2f9e001  ! 3606: SDIVcc_I	sdivcc 	%r7, 0x0001, %r17
	.word 0xf858a738  ! 3611: LDX_I	ldx	[%r2 + 0x0738], %r28
	.word 0xb769a001  ! 3616: SDIVX_I	sdivx	%r6, 0x0001, %r27
	.word 0x8a480015  ! 3621: MULX_R	mulx 	%r0, %r21, %r5
	.word 0xa44f0009  ! 3626: MULX_R	mulx 	%r28, %r9, %r18
	.word 0x9cf94010  ! 3631: SDIVcc_R	sdivcc 	%r5, %r16, %r14
	.word 0xaed5800e  ! 3636: UMULcc_R	umulcc 	%r22, %r14, %r23
	.word 0xa56f0017  ! 3641: SDIVX_R	sdivx	%r28, %r23, %r18
	.word 0xab6a8004  ! 3646: SDIVX_R	sdivx	%r10, %r4, %r21
	.word 0xbc4a000d  ! 3651: MULX_R	mulx 	%r8, %r13, %r30
	.word 0x8182e001  ! 3656: WRY_I	wr	%r11, 0x0001, %y
	.word 0xa16a401a  ! 3661: SDIVX_R	sdivx	%r9, %r26, %r16
	.word 0xbc5dc010  ! 3666: SMUL_R	smul 	%r23, %r16, %r30
	.word 0xae4ae001  ! 3671: MULX_I	mulx 	%r11, 0x0001, %r23
	.word 0x9e4d801d  ! 3676: MULX_R	mulx 	%r22, %r29, %r15
	.word 0xba680009  ! 3681: UDIVX_R	udivx 	%r0, %r9, %r29
	.word 0xb64fe001  ! 3686: MULX_I	mulx 	%r31, 0x0001, %r27
	.word 0xd658a1c0  ! 3691: LDX_I	ldx	[%r2 + 0x01c0], %r11
	.word 0x8c792001  ! 3696: SDIV_I	sdiv 	%r4, 0x0001, %r6
	.word 0x9efb8000  ! 3701: SDIVcc_R	sdivcc 	%r14, %r0, %r15
	.word 0xa768c004  ! 3706: SDIVX_R	sdivx	%r3, %r4, %r19
	.word 0xf2586168  ! 3711: LDX_I	ldx	[%r1 + 0x0168], %r25
	.word 0x9f698012  ! 3716: SDIVX_R	sdivx	%r6, %r18, %r15
	.word 0xab680012  ! 3721: SDIVX_R	sdivx	%r0, %r18, %r21
	.word 0xd85866a8  ! 3726: LDX_I	ldx	[%r1 + 0x06a8], %r12
	.word 0xbc70c01f  ! 3731: UDIV_R	udiv 	%r3, %r31, %r30
	.word 0xa36a0008  ! 3736: SDIVX_R	sdivx	%r8, %r8, %r17
	.word 0xa16e6001  ! 3741: SDIVX_I	sdivx	%r25, 0x0001, %r16
	.word 0xb2698011  ! 3746: UDIVX_R	udivx 	%r6, %r17, %r25
	.word 0xa04e000f  ! 3751: MULX_R	mulx 	%r24, %r15, %r16
	.word 0xaa6c4008  ! 3756: UDIVX_R	udivx 	%r17, %r8, %r21
	.word 0xb64ee001  ! 3761: MULX_I	mulx 	%r27, 0x0001, %r27
	.word 0xac7b0012  ! 3766: SDIV_R	sdiv 	%r12, %r18, %r22
	.word 0xcc58a488  ! 3771: LDX_I	ldx	[%r2 + 0x0488], %r6
	.word 0xad6c8013  ! 3776: SDIVX_R	sdivx	%r18, %r19, %r22
	.word 0x8e4fa001  ! 3781: MULX_I	mulx 	%r30, 0x0001, %r7
	.word 0x97256001  ! 3786: MULScc_I	mulscc 	%r21, 0x0001, %r11
	.word 0xa2592001  ! 3791: SMUL_I	smul 	%r4, 0x0001, %r17
	.word 0x916bc00c  ! 3796: SDIVX_R	sdivx	%r15, %r12, %r8
	.word 0xb6694018  ! 3801: UDIVX_R	udivx 	%r5, %r24, %r27
	.word 0xa04b2001  ! 3806: MULX_I	mulx 	%r12, 0x0001, %r16
	.word 0xa074c005  ! 3811: UDIV_R	udiv 	%r19, %r5, %r16
	.word 0x81832001  ! 3816: WRY_I	wr	%r12, 0x0001, %y
	.word 0xa9692001  ! 3821: SDIVX_I	sdivx	%r4, 0x0001, %r20
	.word 0xd858a1c0  ! 3826: LDX_I	ldx	[%r2 + 0x01c0], %r12
	.word 0x936a6001  ! 3831: SDIVX_I	sdivx	%r9, 0x0001, %r9
	.word 0xb16fc007  ! 3836: SDIVX_R	sdivx	%r31, %r7, %r24
	.word 0x88de2001  ! 3841: SMULcc_I	smulcc 	%r24, 0x0001, %r4
	.word 0xb96dc012  ! 3846: SDIVX_R	sdivx	%r23, %r18, %r28
	.word 0xa8f32001  ! 3851: UDIVcc_I	udivcc 	%r12, 0x0001, %r20
	.word 0xa96de001  ! 3856: SDIVX_I	sdivx	%r23, 0x0001, %r20
	.word 0x956c801d  ! 3861: SDIVX_R	sdivx	%r18, %r29, %r10
	.word 0xa56be001  ! 3866: SDIVX_I	sdivx	%r15, 0x0001, %r18
	.word 0x9249000b  ! 3871: MULX_R	mulx 	%r4, %r11, %r9
	.word 0x98dfc009  ! 3876: SMULcc_R	smulcc 	%r31, %r9, %r12
	.word 0xad23e001  ! 3881: MULScc_I	mulscc 	%r15, 0x0001, %r22
	.word 0x96714000  ! 3886: UDIV_R	udiv 	%r5, %r0, %r11
	.word 0xad6a401c  ! 3891: SDIVX_R	sdivx	%r9, %r28, %r22
	.word 0xbafca001  ! 3896: SDIVcc_I	sdivcc 	%r18, 0x0001, %r29
	.word 0xb86f6001  ! 3901: UDIVX_I	udivx 	%r29, 0x0001, %r28
	.word 0xa85ba001  ! 3906: SMUL_I	smul 	%r14, 0x0001, %r20
	.word 0x9d69001c  ! 3911: SDIVX_R	sdivx	%r4, %r28, %r14
	.word 0x8ef80012  ! 3916: SDIVcc_R	sdivcc 	%r0, %r18, %r7
	.word 0xa4694017  ! 3921: UDIVX_R	udivx 	%r5, %r23, %r18
	.word 0xaa53a001  ! 3926: UMUL_I	umul 	%r14, 0x0001, %r21
	.word 0x864b8006  ! 3931: MULX_R	mulx 	%r14, %r6, %r3
	.word 0xa649a001  ! 3936: MULX_I	mulx 	%r6, 0x0001, %r19
	.word 0xa07b401b  ! 3941: SDIV_R	sdiv 	%r13, %r27, %r16
	.word 0xacf9400e  ! 3946: SDIVcc_R	sdivcc 	%r5, %r14, %r22
	.word 0xaaf6800c  ! 3951: UDIVcc_R	udivcc 	%r26, %r12, %r21
	.word 0x9925401e  ! 3956: MULScc_R	mulscc 	%r21, %r30, %r12
	.word 0x94498000  ! 3961: MULX_R	mulx 	%r6, %r0, %r10
	.word 0xa6d76001  ! 3966: UMULcc_I	umulcc 	%r29, 0x0001, %r19
	.word 0x865c800d  ! 3971: SMUL_R	smul 	%r18, %r13, %r3
	.word 0x926e2001  ! 3976: UDIVX_I	udivx 	%r24, 0x0001, %r9
	.word 0xa06f001f  ! 3981: UDIVX_R	udivx 	%r28, %r31, %r16
	.word 0x9c692001  ! 3986: UDIVX_I	udivx 	%r4, 0x0001, %r14
	.word 0xb44aa001  ! 3991: MULX_I	mulx 	%r10, 0x0001, %r26
.data
.align	256
t0_data64_start_0:
	.xword	0xd4d8980c76545284
	.xword	0xec3f493a203e3624
	.xword	0xb8125ee0217edb03
	.xword	0xfd57c13e60a239d0
	.xword	0x2fa1ddbe4ac601e8
	.xword	0x57fd01a6e591b599
	.xword	0x117596d519785cc8
	.xword	0x82d59b56ead69d2b
	.xword	0xd27361ca05e2710e
	.xword	0x8df9dc7bfbd15663
	.xword	0x5a8691633f8dbd29
	.xword	0x0bec038f35769432
	.xword	0x09220b75e0cefbaf
	.xword	0x24200ba91902c2eb
	.xword	0x9b63569bb2f0f409
	.xword	0xcee560f10d32dfa3
	.xword	0x90613aaf476f9aa1
	.xword	0xc1fd104c0750507a
	.xword	0x0d541d5d719b41f7
	.xword	0xde1247c238fafbad
	.xword	0xf3e5f589f457ff9e
	.xword	0xaaaf2a47afe59664
	.xword	0x081784c5ab0afaec
	.xword	0xcd47f33fb5569b28
	.xword	0x97f087ac5ba4e3c5
	.xword	0x6abe82a477368048
	.xword	0x4b5357d4b7a74146
	.xword	0x4370de28003320db
	.xword	0x32430d2741e5bf43
	.xword	0x71108f7cf78aea0f
	.xword	0x9299f2cbfe81c7d0
	.xword	0x3d74ab8ae2503264
	.xword	0xbeb43023eaea4645
	.xword	0x6321375a5da1603f
	.xword	0x1cac691383cdd207
	.xword	0x96e84426d7c8c5fb
	.xword	0x086033c7c1802a8f
	.xword	0x672c0b7e0fc27589
	.xword	0x951b8d128a4fb391
	.xword	0x0391d00f5149f316
	.xword	0x982721d793edc324
	.xword	0xe85b57b099a7b0d6
	.xword	0xc9b6dfc10bd85353
	.xword	0xb8510a549ad48131
	.xword	0x14962cd41cc09b4d
	.xword	0xd5fb36e5a7d0a1d9
	.xword	0xaf5d681c0ae6c15c
	.xword	0xae8bf9282c0965e3
	.xword	0xd11d4abc2c88458c
	.xword	0x1a49ab9ab794c488
	.xword	0xf3e99b1d92c25438
	.xword	0x5a37293ee40b4299
	.xword	0xbb5a904f4926bd20
	.xword	0x47f2e4ae2a79e1ae
	.xword	0xcd97b6809ce2a74e
	.xword	0xcd9cd4ec2ba3e4b6
	.xword	0x6b8bce8e9f1fb26a
	.xword	0xdc113708d407649f
	.xword	0xf12b1e847bc5a307
	.xword	0xf9f67dda7f02c7e4
	.xword	0x074f4c0e1fa5d1c6
	.xword	0x4bae91d2af2a7803
	.xword	0x341d185780c1b4c8
	.xword	0xeab61df4b25673b1
	.xword	0x06c5b3209f8ad769
	.xword	0x9360a701315f3cdc
	.xword	0xf4f8c010068bec00
	.xword	0xc824f80c69b6ec01
	.xword	0xe329d84459aa2215
	.xword	0x34bba6eabe0d0562
	.xword	0x33244551d7e7a1f9
	.xword	0x32499cace28bdaef
	.xword	0xf4a8ffbda6276085
	.xword	0xfd5074fdf0ca87da
	.xword	0x06a9a6513207c5cc
	.xword	0x59206651889597b7
	.xword	0xf8fe1ec9c614889d
	.xword	0x303578ac3b332b87
	.xword	0xfda6389eab864c80
	.xword	0xcf4eb69d38d6d69b
	.xword	0xef4acc249a9f3153
	.xword	0x36aa806db04e4310
	.xword	0xb80a808d75f36d94
	.xword	0x84086c532a09bafd
	.xword	0x66c46f09ab6384e1
	.xword	0xc5057211ca3baa33
	.xword	0x7358a7197ad353db
	.xword	0x2a24617539e26799
	.xword	0x137ea1c518296a48
	.xword	0x36a77cab9092587a
	.xword	0xb2f6a8ae4ca0e7ff
	.xword	0xc5093656c1cc536e
	.xword	0x75a0ab878e0a18b9
	.xword	0x0d5bfb670d6f40ff
	.xword	0x179b418bb6bd320c
	.xword	0x1db13c80c4bb3ff8
	.xword	0x106d57cc888db1f4
	.xword	0x2de4dcd6b33eba38
	.xword	0x836fba1f63f5cd22
	.xword	0xaed49f77f5b1c412
	.xword	0xd083e87a8c9b7b53
	.xword	0x3c1ef4b2469823d2
	.xword	0x59b76491b82a0cf1
	.xword	0x1cc409b2d3d32030
	.xword	0x5d53a1106c6aa357
	.xword	0x58cd777d90c8a22c
	.xword	0x1a92b739cedaef03
	.xword	0x2c6825ff67f9a122
	.xword	0x4bc77e6022b864c5
	.xword	0x8181a6f6ad127a82
	.xword	0xfe330dafe7ca6040
	.xword	0x899c768ca5cd24c1
	.xword	0xf8fc6ce8b41cb192
	.xword	0xfae6117ad2a48503
	.xword	0xaf431a74a471de41
	.xword	0x53c3c78a04cda26e
	.xword	0xbec79e949fffb9b1
	.xword	0x3120e51b8338c0da
	.xword	0xb0988ebfa99f3106
	.xword	0xb79644a9dd1742ed
	.xword	0xa806f31086c5aae0
	.xword	0xdc54e8555f131761
	.xword	0x6496a8ce7b73e85f
	.xword	0x4dd604d30928f3bf
	.xword	0x07237cb4b5f66ae6
	.xword	0x2b83d929b77d643a
	.xword	0xb553b0756ae1e1f2
	.xword	0xb61dbe039916347c
	.xword	0x939963164b2727f0
	.xword	0x3bbebb16764e791c
	.xword	0x9e5cb0f7b12c64a1
	.xword	0x1f0f685e20c8384a
	.xword	0x576d23e962e0cdcd
	.xword	0x8cf531177b70c83d
	.xword	0x2bf5116679208346
	.xword	0x3899bbd1bb0a55d9
	.xword	0x4f3f102f8c02a3a0
	.xword	0xb0fa9a320e6a4660
	.xword	0x8183acd4c4007eef
	.xword	0xea6aa90f19cc6890
	.xword	0x2c5b6d1cd529d300
	.xword	0xbd9aef67cb009ac3
	.xword	0xd245af8e704ae8d3
	.xword	0x27bbea741e1136d9
	.xword	0x9c3b68f7dda9a6df
	.xword	0x659f7cb493039d55
	.xword	0x2e27fce57631cde8
	.xword	0x605186321009d438
	.xword	0x4c3a509e56e84673
	.xword	0x6cc49d1b769adfa1
	.xword	0xd4f6c7b0eea47365
	.xword	0x7f8eabeee54346e4
	.xword	0x77fd4229efb4fddc
	.xword	0x5acaddb483c15b2e
	.xword	0x60f1ace3b1ea98d0
	.xword	0xf09ce92a9c5fe5cd
	.xword	0xd8115ecde532f794
	.xword	0xd1a1b51f21b94d06
	.xword	0x84a3c267444b2018
	.xword	0x3ffe5492677bbfde
	.xword	0xc5ab6de3bdfa8ec9
	.xword	0x803ea67e8a2e8881
	.xword	0xf50cbe92c71f511b
	.xword	0xcdeec79680f4402c
	.xword	0xddec63eca24b0635
	.xword	0xaa37567d1fbd1da9
	.xword	0x4d9fb32dc3724077
	.xword	0x754de7756bcd0120
	.xword	0xb50c745816f8f422
	.xword	0xfa9b54c77463652f
	.xword	0x62b01ad3ef798a1f
	.xword	0xe9d9271d9809c2d0
	.xword	0x098383ccdda25d06
	.xword	0xe9ecf006427746ce
	.xword	0xdf632b3374a665f6
	.xword	0xd1a5e5de1c4c38a5
	.xword	0xf9f4b132dad2e17c
	.xword	0x5aead5f0eccbea65
	.xword	0xc87000fc7336f05b
	.xword	0x377f1c16039450de
	.xword	0xa539c395165512c7
	.xword	0xd0f95fc6a9a5c79e
	.xword	0x633052ebb2ed9ff7
	.xword	0x83719f7aac94a613
	.xword	0xc33e5396448721f2
	.xword	0x1500b0d0410f9ea1
	.xword	0x97a4edad65b13163
	.xword	0xa2b9e70c680fb72a
	.xword	0x628118782c535e70
	.xword	0x34f9fa2020e5cb18
	.xword	0xc96924233ba19d17
	.xword	0x432db3830815a3cb
	.xword	0x197e1df833e83970
	.xword	0xa469dc251b0084f0
	.xword	0xe57654b8ba70a29a
	.xword	0x2adae4ce2727a4ce
	.xword	0x364ec874fc5f79ed
	.xword	0x2bac57a7b802063f
	.xword	0x5a819477d8c56da9
	.xword	0xb4b8619599f4d091
	.xword	0x78dabb25d81dba39
	.xword	0x101e233a9deb6c5b
	.xword	0xe8b7301f7262a4d9
	.xword	0x6d4e8f9f37fbddaa
	.xword	0x2e18618077e6c73e
	.xword	0x449add399c9f9cd0
	.xword	0x7663334c2123ae02
	.xword	0x5fec2019fd0beb0d
	.xword	0xf8cea13c7be843a1
	.xword	0xdb48c14ba54dcc30
	.xword	0xe8ce47c54be297d7
	.xword	0x0c0d8fc707b4cb41
	.xword	0xa1aa1b5fb4ba28f2
	.xword	0xf8d199bcdb3c962b
	.xword	0x4d346034493b2861
	.xword	0x8cc9062cf7238136
	.xword	0xebf3704b20e0a502
	.xword	0x44c172b541c81ce6
	.xword	0x9f143f93ffdfef13
	.xword	0xa972dbbb48e2b3fb
	.xword	0x26aef805c7d2e095
	.xword	0x6c23c78817ea7a1f
	.xword	0xe29d5b291370fb03
	.xword	0x23308a1d92c6f2e4
	.xword	0x83818fd01fbbb22d
	.xword	0xa25e50166eb6cadb
	.xword	0x47d44c34ed9bcf5f
	.xword	0xf039fba454340d6b
	.xword	0xc1091131d958534c
	.xword	0x3cc22ec9a55dd29b
	.xword	0x98738cdd8dbf63e3
	.xword	0x5cdab47660965a0f
	.xword	0x1634dac84b2e80b1
	.xword	0xa4fbdc0e437644cc
	.xword	0x99d2f43cd1b86f99
	.xword	0xc9564bb7b7701ea1
	.xword	0x3b0480c06eb417fd
	.xword	0x0bb91af83ed27ca2
	.xword	0x9eb5c2d55e51da78
	.xword	0xb59a02aad0085b2d
	.xword	0x420849c38f34aab2
	.xword	0xdebac2cdeaf8026d
	.xword	0xfd2bb831a7818ce7
	.xword	0xeeb4c8258d355c6d
	.xword	0x4943e0d0d92a84dd
	.xword	0x4afa23fc315f5bdf
	.xword	0x98e3be50acdbe14e
	.xword	0x26a156b80ba60162
	.xword	0x5ccf9f9433130763
	.xword	0x1f33f7c14569fdce
	.xword	0x167fd5c1cd22e34d
	.xword	0x803c9bc9c782e844
	.xword	0xb198ec300e0c20a6
	.xword	0x26aa951784bcc9a6
	.xword	0x74bb7f310bf6c72c
	.xword	0x19166515396939ed
	.xword	0x757ed714e80ebf19
	.xword	0x6e18052f791bcb1c
	.xword	0x7148e19506b08f48
	.xword	0xcfbe605a3f9a7dcc
	.xword	0x1c5e138bb5a8899a
	.xword	0x576c02fff33cb29e
	.xword	0xe419be9f29918622
	.xword	0x081965cab4c6f805
	.xword	0xf600de8f1757f208
	.xword	0x287f299e82945482
	.xword	0x9aca34589d7c4bce
	.xword	0xe7719365247372bd
	.xword	0x6cc8db386e647816
	.xword	0x1e4be74d90ee882b
	.xword	0x097b2db38c4c7961
	.xword	0x0e8b50c91c667cab
	.xword	0x2fc1bd16132028b8
	.xword	0xa75d094d56da1735
	.xword	0x52783ab9db003076
	.xword	0x5e9d9b9d46d904c6
	.xword	0x072969caf5e3ddb3
	.xword	0x8bb7925edd935f45
	.xword	0x4ed92a3525d9c7c4
	.xword	0xd7795033ba0e4c3a
	.xword	0xb5f9a4237f60ff73
	.xword	0x5298213150aba47e
	.xword	0x43c43c5b9a150ee1
	.xword	0xfec43e06d7f14b0f
	.xword	0x25945b96e144fc44
	.xword	0x671847358b5d5fa5
	.xword	0xadd811f10eabb720
	.xword	0x89d4de81f6722b84
	.xword	0x4d3742467d431880
	.xword	0xbb736d41c1c8eb7a
	.xword	0x976f11d2d1704ddf
	.xword	0x0cbdcec9bfae270f
	.xword	0x0e1c9ea9c8a3dec9
	.xword	0xc59b7e9b1d17e7f1
	.xword	0x0f5c5d30dfc99c59
	.xword	0xd4de7692972f13e2
	.xword	0x996ba98cc0a98808
	.xword	0xd48147c88225b3ad
	.xword	0x072faa7d6749ca7f
	.xword	0x6b8575cbf686808c
	.xword	0x0b93d6314c7cf218
	.xword	0xa984a8916de07163
	.xword	0x119a7772620a9bf5
	.xword	0xe74580c638ec6101
	.xword	0x88427999174d0ce9
	.xword	0xb08f8871056d1529
	.xword	0x6701fcf8344842ff
	.xword	0x37892f2725e4f2e8
	.xword	0x847c82c080d51c34
	.xword	0xc392a46e97ba35c3
	.xword	0x220197bcbebcf921
	.xword	0x8c2a8ba952a2b892
	.xword	0xe1f0e0b8b7932d81
	.xword	0xdbfac969ef9637c5
	.xword	0x384fee5a925e4bb9
	.xword	0xa776a02311a7b6ee
	.xword	0xac7a524e22417e8a
	.xword	0xf1c4f2eb88bce913
	.xword	0xa60baf2a4dc05865
	.xword	0xf098d4716ef78129
	.xword	0xee5234eea5a71dc0
	.xword	0x2a9733b2435c3a2d
	.xword	0x5a898e746af18f1e
	.xword	0x1e4f8a6fa35ae177
	.xword	0xb74f0ba300547401
	.xword	0x2dccc4ca09d68abe
	.xword	0x2ce655e2f36588b4
	.xword	0xcb035e95ebe354ee
	.xword	0x1d53690feb3616b6
	.xword	0x29648f88d0f3bb1c
	.xword	0x95b24a09417e3dce
	.xword	0x6e914b1e60a0d28c
	.xword	0x93122cc5a1cf1840
	.xword	0xc6470c75b3d6f762
	.xword	0x2bb83e53a1c9e234
	.xword	0xc40381fa9c9f54fb
	.xword	0x0d874377a5728668
	.xword	0x12ae894dce42d54a
	.xword	0xba5cb35a77d2b037
	.xword	0x72ff26e07d8b1a87
	.xword	0xd32e907df9b4f69e
	.xword	0x151662f06b63b0db
	.xword	0xc9c7792c2b3964d0
	.xword	0x737d8b3a4933cb23
	.xword	0x2aed17466b1f36bd
	.xword	0x64f76ff5b495b0e4
	.xword	0x99dc2abbc1412ec1
	.xword	0x6a39ab66854b5d37
	.xword	0xa14d4d152d2e8140
	.xword	0xffdadc99c15b2e70
	.xword	0x133e564ddf089a4b
	.xword	0x3257ea8a031ca32e
	.xword	0x135f2844db7d0654
	.xword	0x0504c0fbe9ba3c68
	.xword	0x7599e72f03da4f8e
	.xword	0x39dbeb5ea3ff9c96
	.xword	0xa0f0ada7bcdc8b39
	.xword	0x04cd209980a406e2
	.xword	0xd41071bc447df962
	.xword	0xaa67b8d8626e546a
	.xword	0x863db0b7b288d142
	.xword	0x8537f37cc39ec6dc
	.xword	0xae6962dade587ada
	.xword	0xf3d709087d33bd61
	.xword	0x86dff036017824a7
	.xword	0xb84cf48f70fb84dc
	.xword	0x7507a0e5ff2e6a08
	.xword	0xd144b3c7442c34a9
	.xword	0xac4d89f23a4b584c
	.xword	0x213787f03cd3aab2
	.xword	0x758eb00f35d40b77
	.xword	0x69b8f92bdff0b5f3
	.xword	0x2d270ddb607ad1f7
	.xword	0x377c851bd01f4b63
	.xword	0xf910311f3965d7f0
	.xword	0x2fe9e31d8d1a536d
	.xword	0xaeb9306ffeba7cfe
	.xword	0x8f147c9224c7fb8f
	.xword	0xff6c79fa9bfc6c5b
	.xword	0x861350e0fc6de778
	.xword	0x1a25d67af4a6a035
	.xword	0x80f1b69202324442
	.xword	0x2cd37897ccdd99d8
	.xword	0xb1b463cd6ca55244
	.xword	0x6a7441eed03fcebc
	.xword	0x9a6846bf1c05e0fb
	.xword	0x0c80562ddb34bdb1
	.xword	0x1a40a2cb94d76218
	.xword	0x6ee6877fa0f758e6
	.xword	0x0bb930149228fa9f
	.xword	0xfb937d073c57611b
	.xword	0x7d2f7d2a8f2fd951
	.xword	0xfdf062c5af4f4c08
	.xword	0xca7cf39a7b97efd3
	.xword	0x191120098a1f8f43
	.xword	0x53f4d83a220751d0
	.xword	0x77187d18d9051943
	.xword	0x581cb8e3555f391e
	.xword	0x8c1188eb807f4a42
	.xword	0xcc2b451b1634199d
	.xword	0x883c241eeeef840f
	.xword	0xbdbef8ca65c02d6f
	.xword	0xff241427a03f7de2
	.xword	0x61fdff9be219a2b5
	.xword	0x9ea71eada6f9011e
	.xword	0x323f117f8a3ffa7f
	.xword	0xea2e0355b3cb294e
	.xword	0xfee9c6c5aa851159
	.xword	0xce1459bba97b77d2
	.xword	0xf2468a704efc75f4
	.xword	0xbf527d1f44ee49b4
	.xword	0xebd396195cd60eb1
	.xword	0xefb6a3f3cc2f6be6
	.xword	0xdd63f86c83858fbd
	.xword	0x9c45705119784010
	.xword	0x29313553133f5659
	.xword	0xedcec3f0be15ad3e
	.xword	0xbf7700d5340b7049
	.xword	0xacd0c7701d7f1b1c
	.xword	0x77ca12bac77ef987
	.xword	0x606d739b9babea5c
	.xword	0x6bda92dda523b1d9
	.xword	0x70d3def127065805
	.xword	0x442d4a8e5a2cf4d3
	.xword	0xea06852023f4083d
	.xword	0xa7a9ef94b1254012
	.xword	0x23b2fb9764e41ef1
	.xword	0xc6fac7bbd610737a
	.xword	0xa3e51646a9dbadd6
	.xword	0x58bd28162db133ed
	.xword	0xe1f528266528cdfc
	.xword	0xfe1f6974e86b03f8
	.xword	0x33be80e309ddecc8
	.xword	0x60295d21ff4049c1
	.xword	0x8e1a6f4553f7fbff
	.xword	0xa5d5032f2f7fe1bd
	.xword	0xccb53d2a5c60ff83
	.xword	0x3063fde7475b5f85
	.xword	0x7c4d3678d917665f
	.xword	0xd57e58dc99130d41
	.xword	0xe0fd81218a8f50ad
	.xword	0x370d9c9d551ac957
	.xword	0xbeedb1c05eb955a2
	.xword	0x3cc5aef29f77ed6c
	.xword	0x2ae2f44a092aaf99
	.xword	0xd68e5c93e2f881bd
	.xword	0x584c2f5a8de6cad8
	.xword	0x3f4fc55a6d4e7d97
	.xword	0xc2700666aeddbec4
	.xword	0xa5e2c949452238f7
	.xword	0x6eb7cb1e7bc73e17
	.xword	0xb30b633e9985b0c3
	.xword	0x24d5d2a4b16f03f4
	.xword	0xbb3a7b486e5f3f4c
	.xword	0xfa8f6390b81ab5e8
	.xword	0x78644a718a1b12bd
	.xword	0x0d8798aaa10fab9b
	.xword	0xef84735498f8eb5d
	.xword	0x0722d58f878d3991
	.xword	0x5247ff1003af9428
	.xword	0xe40e3278adc447f8
	.xword	0xc598b5ebe7c56d51
	.xword	0xab6a474d519a7e6c
	.xword	0xb565f58ed2a048e0
	.xword	0x064db8150331b6e8
	.xword	0x701d5908692d6d83
	.xword	0xf59d3d4259a296d6
	.xword	0xf73fd0a6a4edaacc
	.xword	0x43101409592b7013
	.xword	0xf4bb816dfbac0bbb
	.xword	0x732962e33571b2e4
	.xword	0x2b5e5bf93405c3f4
	.xword	0xa854fae56d987bc4
	.xword	0xf6e3f636d443e07e
	.xword	0x12e2685a44763b20
	.xword	0xf6b4b341c61b8653
	.xword	0x690eb08979b06d54
	.xword	0x25841239ab3059cc
	.xword	0xd08216499175e7d4
	.xword	0xea9fc52b3dbdf16d
	.xword	0x27d324468933a083
	.xword	0x189df7213a9991b9
	.xword	0xfc1e777d560fa385
	.xword	0x299f483205de8ca3
	.xword	0xa0a22f2113949be9
	.xword	0x1c1480096be24943
	.xword	0xf7bc3e72479b633d
	.xword	0x78b113cccd5db744
	.xword	0x5e6b6d3746290106
	.xword	0xbf28da2ac6a0ae6a
	.xword	0x52361c6da66b20f7
	.xword	0x5e806557b8021faa
	.xword	0x22dcfc8de4afba5d
	.xword	0x3f639871c53d783c
	.xword	0x5db6beda664e3318
	.xword	0x1674c0b9c6786584
	.xword	0x71db5ce8dad2844d
	.xword	0x87e80dac83cb1920
	.xword	0x89045cac39535bbe
	.xword	0x46e5f3903e8251c4
	.xword	0x8dcb229dd99a1411
	.xword	0x574765c0db3870e2
	.xword	0x0fc249b69a58c698
	.xword	0x688398bcd11cc0cf
	.xword	0x563c741f94344557
	.xword	0xd48de0f63e141049
	.xword	0x237eb9a2b024be98
	.xword	0xd2206f2daa70a790
	.xword	0xf654e4d2fa275cab
	.xword	0xb1ef0a048efdf010
	.xword	0xc7204f8c8289014d
	.xword	0x23ea482ebca265b4
.data
.align	256
t0_data32_start_0:
	.xword	0x00000000a125bddc
	.xword	0x00000000f521366e
	.xword	0x000000001300af2a
	.xword	0x0000000076395e47
	.xword	0x00000000a64416cc
	.xword	0x00000000dfe91a5d
	.xword	0x0000000047e003cb
	.xword	0x000000000227f282
	.xword	0x0000000035aacc6c
	.xword	0x00000000b71f17c5
	.xword	0x00000000786df45d
	.xword	0x0000000009672f9f
	.xword	0x00000000786f1834
	.xword	0x0000000098ff1f2a
	.xword	0x00000000ff55b36c
	.xword	0x00000000ce14ae78
	.xword	0x00000000d3a8ecea
	.xword	0x0000000054ba0b34
	.xword	0x00000000cc038f0d
	.xword	0x000000006d21eff1
	.xword	0x000000000eb30615
	.xword	0x000000005f0859bf
	.xword	0x00000000f957a982
	.xword	0x000000002adca16c
	.xword	0x000000000d41935f
	.xword	0x00000000c1a0def9
	.xword	0x0000000066787ee7
	.xword	0x00000000e048aa02
	.xword	0x00000000d1d176b6
	.xword	0x00000000fd04fb45
	.xword	0x00000000a3451f89
	.xword	0x00000000bed8bc00
	.xword	0x000000001970d8bb
	.xword	0x000000005c52819f
	.xword	0x000000008befb30a
	.xword	0x00000000baa02436
	.xword	0x00000000efd52b4d
	.xword	0x000000008287a284
	.xword	0x00000000262f5359
	.xword	0x00000000aa369c9b
	.xword	0x000000004617427b
	.xword	0x000000003d56cf17
	.xword	0x00000000cb71a576
	.xword	0x000000005b9f9ac5
	.xword	0x00000000dd483a82
	.xword	0x0000000019e655ec
	.xword	0x000000008697e788
	.xword	0x00000000502a6c1d
	.xword	0x000000007e3739e5
	.xword	0x000000002c5eef0e
	.xword	0x000000001810b11f
	.xword	0x000000008c892edc
	.xword	0x00000000520d8cf1
	.xword	0x00000000c5ad6bd8
	.xword	0x000000000573be02
	.xword	0x00000000719d111b
	.xword	0x00000000081b697d
	.xword	0x00000000b9eabe85
	.xword	0x0000000074c92658
	.xword	0x00000000b4364a9b
	.xword	0x000000006dad8269
	.xword	0x0000000053ed9fb3
	.xword	0x00000000c0a44dcf
	.xword	0x000000006901a6a8
	.xword	0x00000000e6f4fa67
	.xword	0x0000000009c3a149
	.xword	0x00000000c3e5ae5e
	.xword	0x000000009035dc0f
	.xword	0x0000000002971024
	.xword	0x0000000081b8cec9
	.xword	0x00000000bcf8ebfe
	.xword	0x000000001e319558
	.xword	0x0000000089670837
	.xword	0x00000000b15d4478
	.xword	0x000000002a782e58
	.xword	0x0000000041490f9d
	.xword	0x0000000002c1012a
	.xword	0x00000000f7f6ac3a
	.xword	0x00000000f8d2ea27
	.xword	0x000000009a020c72
	.xword	0x000000007539d873
	.xword	0x00000000469153c0
	.xword	0x00000000ed3ff297
	.xword	0x0000000033cc1ba4
	.xword	0x00000000a06bd898
	.xword	0x00000000dcf09807
	.xword	0x000000002498db8f
	.xword	0x000000006b083631
	.xword	0x00000000cd7de3bf
	.xword	0x00000000deb3b837
	.xword	0x00000000830f092c
	.xword	0x00000000c8db142f
	.xword	0x00000000479f18ed
	.xword	0x00000000430245eb
	.xword	0x000000005f2994cf
	.xword	0x00000000e06f76c8
	.xword	0x000000006b8cb4eb
	.xword	0x000000002fe130fe
	.xword	0x0000000026092a4a
	.xword	0x0000000055982a2a
	.xword	0x0000000085f39863
	.xword	0x000000003de75f94
	.xword	0x00000000a6dacb91
	.xword	0x000000003043cdd1
	.xword	0x0000000097d278a4
	.xword	0x00000000db2520cc
	.xword	0x00000000c78339d5
	.xword	0x00000000ee68ec8c
	.xword	0x000000002e7b4ace
	.xword	0x00000000e4959ef4
	.xword	0x00000000340baccf
	.xword	0x00000000ee64b01d
	.xword	0x00000000c899c70b
	.xword	0x00000000ecd39e81
	.xword	0x0000000056f512b2
	.xword	0x000000004c75a1c2
	.xword	0x0000000054438a1d
	.xword	0x00000000fe048abb
	.xword	0x0000000099d63bd6
	.xword	0x0000000062598d90
	.xword	0x000000009c17c3b9
	.xword	0x00000000ee6850f9
	.xword	0x000000009240d5a9
	.xword	0x00000000bd94cc1d
	.xword	0x000000003f565a9b
	.xword	0x0000000032b72f7e
	.xword	0x0000000006799d94
	.xword	0x000000006d2271c9
	.xword	0x00000000a67d15bf
	.xword	0x000000009094cc29
	.xword	0x000000003cb55bfe
	.xword	0x000000001a00a8fc
	.xword	0x00000000451f75dd
	.xword	0x00000000398a60a9
	.xword	0x000000006ec880ab
	.xword	0x00000000fa70726c
	.xword	0x000000004238fb76
	.xword	0x00000000641571ec
	.xword	0x00000000982b7252
	.xword	0x00000000e0e1b2f6
	.xword	0x000000006906ae19
	.xword	0x0000000007244b67
	.xword	0x00000000e6c34c82
	.xword	0x000000006c66aa1d
	.xword	0x000000000504b455
	.xword	0x00000000fbfdb179
	.xword	0x000000005b09b353
	.xword	0x0000000082fc2108
	.xword	0x00000000920f7054
	.xword	0x000000009ca80510
	.xword	0x00000000438c2126
	.xword	0x000000000a5dad99
	.xword	0x000000009d50ac37
	.xword	0x00000000db904ac8
	.xword	0x000000004ce16eb6
	.xword	0x000000001c0e6d44
	.xword	0x00000000bd43ffa1
	.xword	0x000000002c4313e8
	.xword	0x00000000984c79ef
	.xword	0x00000000b92c832f
	.xword	0x000000005fe0cc9a
	.xword	0x0000000060785def
	.xword	0x000000008734a468
	.xword	0x00000000866ba804
	.xword	0x00000000e8909a54
	.xword	0x000000006cf27666
	.xword	0x00000000d4b08ced
	.xword	0x00000000e4b92b14
	.xword	0x0000000028ffb546
	.xword	0x0000000099d0f037
	.xword	0x00000000d6c0d94f
	.xword	0x00000000616a2cd5
	.xword	0x00000000f483770c
	.xword	0x0000000078994086
	.xword	0x000000008d85b3a6
	.xword	0x000000005636d030
	.xword	0x0000000010fadbba
	.xword	0x000000007ccfa668
	.xword	0x00000000235e80f9
	.xword	0x00000000e05c528e
	.xword	0x00000000d83a3d93
	.xword	0x00000000b9a82d16
	.xword	0x00000000b17550dc
	.xword	0x0000000083bc4ac6
	.xword	0x00000000d75409b1
	.xword	0x000000003bded10c
	.xword	0x0000000034d5c4ac
	.xword	0x00000000e3b8ac01
	.xword	0x00000000fb336b4c
	.xword	0x000000007a5cfcd7
	.xword	0x0000000024bce6cb
	.xword	0x000000007f4a0d3f
	.xword	0x00000000095c1a8b
	.xword	0x0000000051b6cd87
	.xword	0x00000000bdd07149
	.xword	0x0000000049c08bdd
	.xword	0x000000006f3eb01d
	.xword	0x00000000f8973544
	.xword	0x00000000b3eade32
	.xword	0x0000000001fedd40
	.xword	0x0000000035c6f45d
	.xword	0x00000000b64c8090
	.xword	0x00000000e2d55f79
	.xword	0x0000000014b69135
	.xword	0x000000005175db07
	.xword	0x000000002cbb33a4
	.xword	0x00000000edf9c058
	.xword	0x00000000a29f634e
	.xword	0x0000000053a4df10
	.xword	0x0000000084a114e5
	.xword	0x00000000b57aeaca
	.xword	0x0000000016833e72
	.xword	0x0000000090407ad2
	.xword	0x000000002004f552
	.xword	0x00000000a27998e0
	.xword	0x000000002112f866
	.xword	0x00000000815263e5
	.xword	0x0000000070f7ad66
	.xword	0x00000000d3f19bee
	.xword	0x00000000af6d96a8
	.xword	0x00000000a734fba4
	.xword	0x00000000668bd108
	.xword	0x00000000aea4b657
	.xword	0x00000000b3ea18ef
	.xword	0x00000000f022e3f9
	.xword	0x00000000c5170e8b
	.xword	0x00000000f34eaf2e
	.xword	0x0000000046f0045c
	.xword	0x00000000a1533a1c
	.xword	0x00000000167d624a
	.xword	0x00000000729bdee3
	.xword	0x00000000962eade0
	.xword	0x000000000ee5ea13
	.xword	0x00000000879c52b2
	.xword	0x00000000d112d754
	.xword	0x0000000039ccb83c
	.xword	0x000000007ccfb945
	.xword	0x000000001859f7f2
	.xword	0x000000006da200d8
	.xword	0x000000001f6b34e0
	.xword	0x00000000907ad651
	.xword	0x00000000e26e8fde
	.xword	0x00000000ef493914
	.xword	0x00000000b7f2fae0
	.xword	0x00000000a8f4d998
	.xword	0x00000000ddd7cee1
	.xword	0x00000000fb975219
	.xword	0x0000000096376eff
	.xword	0x000000006d91158f
	.xword	0x000000008b4cc3a1
	.xword	0x00000000026effb5
	.xword	0x00000000e85aeecb
	.xword	0x0000000023fb6c9a
	.xword	0x00000000ddb1b6fd
	.xword	0x000000009f96534a
	.xword	0x0000000051f38b37
	.xword	0x00000000a90db278
	.xword	0x0000000097d79907
	.xword	0x000000000cb1de49
	.xword	0x0000000011c138b5
	.xword	0x00000000f5048932
	.xword	0x00000000195aa5b2
	.xword	0x00000000a58f5d5d
	.xword	0x000000004b0349ef
	.xword	0x000000000928281c
	.xword	0x00000000e3eb7320
	.xword	0x00000000582aa103
	.xword	0x000000001ba4f000
	.xword	0x00000000cca6b75f
	.xword	0x00000000e396dd82
	.xword	0x0000000068f92016
	.xword	0x00000000d3d55247
	.xword	0x00000000332d3d2b
	.xword	0x000000009e340a42
	.xword	0x00000000d925862f
	.xword	0x00000000f25d9e7f
	.xword	0x00000000ec9b2e21
	.xword	0x000000000d33e6ec
	.xword	0x00000000004ecd24
	.xword	0x00000000caf2ba63
	.xword	0x0000000007496cdf
	.xword	0x0000000089c8e751
	.xword	0x000000003206d55e
	.xword	0x00000000cc134a21
	.xword	0x000000005f458ac4
	.xword	0x00000000208aace7
	.xword	0x0000000067fc7015
	.xword	0x000000005fb96856
	.xword	0x000000006cc54c54
	.xword	0x0000000047ad4610
	.xword	0x0000000083e533fe
	.xword	0x00000000af61da59
	.xword	0x000000002ab0bf76
	.xword	0x00000000492aa0f2
	.xword	0x000000000d874785
	.xword	0x000000007f3c843e
	.xword	0x000000008caf03ac
	.xword	0x00000000a1e62561
	.xword	0x00000000cebdf6b1
	.xword	0x00000000da10ab1a
	.xword	0x000000002b3565ba
	.xword	0x0000000092e19bd0
	.xword	0x00000000bd815413
	.xword	0x000000002027caa0
	.xword	0x000000006b5647cb
	.xword	0x00000000eabda4f9
	.xword	0x000000007813caa3
	.xword	0x0000000047943226
	.xword	0x00000000d29f39d5
	.xword	0x0000000009ff6705
	.xword	0x0000000065e35b0a
	.xword	0x00000000746588f1
	.xword	0x00000000a1a0390d
	.xword	0x000000006a926bdd
	.xword	0x000000001853bd6b
	.xword	0x0000000009d8473b
	.xword	0x00000000f826e909
	.xword	0x00000000b5597e7a
	.xword	0x000000008126ffd0
	.xword	0x000000004a553fbc
	.xword	0x000000002070adab
	.xword	0x00000000da9c26e9
	.xword	0x0000000091bc077f
	.xword	0x00000000f6078e9e
	.xword	0x00000000d1aa30e0
	.xword	0x00000000df7f301f
	.xword	0x0000000056ab14ad
	.xword	0x00000000f10b497c
	.xword	0x0000000034009b01
	.xword	0x00000000d6eadb72
	.xword	0x00000000f76d4478
	.xword	0x00000000e5a4c327
	.xword	0x00000000088a866b
	.xword	0x00000000a532a138
	.xword	0x0000000015c40ab6
	.xword	0x0000000053570061
	.xword	0x0000000055ae4ed2
	.xword	0x000000007812272f
	.xword	0x0000000024f62a98
	.xword	0x0000000029761735
	.xword	0x00000000ab7f209d
	.xword	0x000000009230095c
	.xword	0x000000004ba8a3c5
	.xword	0x00000000fe61b1b7
	.xword	0x0000000044ea7fa8
	.xword	0x0000000025926af4
	.xword	0x000000007adbf2de
	.xword	0x00000000396c000c
	.xword	0x00000000502ec580
	.xword	0x00000000bee7172d
	.xword	0x00000000b2f4e6cf
	.xword	0x00000000dbe42b71
	.xword	0x000000003195c628
	.xword	0x00000000a29d0ee2
	.xword	0x000000001f2f40cf
	.xword	0x0000000003e2c6a4
	.xword	0x000000005429370d
	.xword	0x0000000028ff2238
	.xword	0x0000000067c4ce15
	.xword	0x000000009c460460
	.xword	0x00000000b04325c7
	.xword	0x00000000729acc1c
	.xword	0x000000006eb75531
	.xword	0x000000005484e223
	.xword	0x00000000f7ea9ce8
	.xword	0x000000005ecdd005
	.xword	0x000000008d5abcc4
	.xword	0x00000000622698ca
	.xword	0x00000000979e9f18
	.xword	0x00000000d0576439
	.xword	0x00000000b59a6815
	.xword	0x0000000009ef0cce
	.xword	0x00000000b5a79c44
	.xword	0x000000002a9ec383
	.xword	0x00000000325646aa
	.xword	0x00000000f7a4643a
	.xword	0x000000003a1de850
	.xword	0x000000008b5634bd
	.xword	0x0000000059a5bfd0
	.xword	0x00000000a8d9a56b
	.xword	0x000000004fd6aea6
	.xword	0x00000000c9d09059
	.xword	0x00000000cb109dd6
	.xword	0x0000000010b72368
	.xword	0x00000000c134845d
	.xword	0x0000000045075d4c
	.xword	0x00000000a858371d
	.xword	0x0000000030d6a298
	.xword	0x00000000fee0711b
	.xword	0x0000000042cc8938
	.xword	0x00000000fea51a3f
	.xword	0x00000000f762aaa6
	.xword	0x00000000e8ba8585
	.xword	0x00000000eb33d5ba
	.xword	0x0000000093f8cb3b
	.xword	0x00000000b42494c2
	.xword	0x00000000b33a661c
	.xword	0x00000000529ddd65
	.xword	0x000000001758e10a
	.xword	0x000000005543c2b1
	.xword	0x0000000078a36911
	.xword	0x00000000529d3b03
	.xword	0x0000000016ac5eee
	.xword	0x0000000000a8d2e3
	.xword	0x000000003accdd5f
	.xword	0x000000002e97aae4
	.xword	0x00000000e7b32212
	.xword	0x000000007b1274bd
	.xword	0x0000000045e8e8e2
	.xword	0x000000004f2169a2
	.xword	0x00000000e0ab35a2
	.xword	0x000000007e7d5921
	.xword	0x00000000242c85a6
	.xword	0x00000000da836b31
	.xword	0x00000000157c8704
	.xword	0x00000000c435704c
	.xword	0x0000000006b37776
	.xword	0x00000000c434d536
	.xword	0x00000000b855c200
	.xword	0x00000000ee1a65a9
	.xword	0x0000000071b49205
	.xword	0x000000002e1bdec2
	.xword	0x00000000f99ac480
	.xword	0x00000000f4d51232
	.xword	0x000000006c388e3d
	.xword	0x000000006104524f
	.xword	0x00000000a3556e76
	.xword	0x000000007e32246a
	.xword	0x00000000304baedd
	.xword	0x000000003c5d5d71
	.xword	0x000000008e3e024a
	.xword	0x000000009564f98f
	.xword	0x00000000ca2dbe24
	.xword	0x000000003e003123
	.xword	0x000000009d0a4d50
	.xword	0x000000000ee2e6a1
	.xword	0x00000000d0e67bee
	.xword	0x00000000ae70ff01
	.xword	0x00000000fbf8bff1
	.xword	0x00000000b7325c98
	.xword	0x00000000e297b582
	.xword	0x0000000067b9302c
	.xword	0x000000008a11635a
	.xword	0x0000000058842235
	.xword	0x0000000061a3fa97
	.xword	0x00000000db2311e7
	.xword	0x00000000d3606320
	.xword	0x00000000563ead27
	.xword	0x0000000021d0a50c
	.xword	0x000000002d303c7c
	.xword	0x000000004be3e753
	.xword	0x000000005c8c464a
	.xword	0x000000007874f5cd
	.xword	0x00000000cd0f147c
	.xword	0x00000000acbd3f3a
	.xword	0x0000000095f41edb
	.xword	0x000000000a02b641
	.xword	0x000000004e1aeb61
	.xword	0x0000000047e5d44b
	.xword	0x00000000256dbb11
	.xword	0x0000000002a332fd
	.xword	0x00000000c01cb852
	.xword	0x00000000c0badc80
	.xword	0x0000000084c507f0
	.xword	0x00000000aa9cd550
	.xword	0x00000000cf5ba86b
	.xword	0x00000000e72a2876
	.xword	0x0000000007d7996d
	.xword	0x00000000ae7154b6
	.xword	0x000000009e3b0704
	.xword	0x00000000d129b497
	.xword	0x0000000030760e7e
	.xword	0x0000000077e01ec2
	.xword	0x00000000a8cc0c0d
	.xword	0x00000000ab1f685e
	.xword	0x000000005dc318ee
	.xword	0x0000000058990302
	.xword	0x00000000cd84e30c
	.xword	0x000000009cb29638
	.xword	0x000000004fbe26c8
	.xword	0x000000005fc810a5
	.xword	0x00000000a4bd1e4d
	.xword	0x00000000fdd98f1d
	.xword	0x00000000a9229bef
	.xword	0x00000000017a18b3
	.xword	0x00000000951d1368
	.xword	0x00000000118208b5
	.xword	0x00000000ffaaa06c
	.xword	0x00000000372e9dde
	.xword	0x0000000061f6e285
	.xword	0x000000007e6dcdcc
	.xword	0x0000000000bcb9d7
	.xword	0x00000000f48dad2e
	.xword	0x000000007f39bff7
	.xword	0x00000000cb2d284e
	.xword	0x0000000001d483a8
	.xword	0x00000000b91949d3
	.xword	0x00000000ce262210
	.xword	0x00000000041b666e
	.xword	0x00000000a30f9b99
	.xword	0x00000000c5d53a78
	.xword	0x00000000d1d241d5
	.xword	0x0000000032a84256
	.xword	0x0000000025aea6c9
	.xword	0x000000006b4b26f3
	.xword	0x0000000033874f06
	.xword	0x00000000cc774d34
	.xword	0x000000007fa895c1
	.xword	0x0000000046f3f67b
	.xword	0x00000000435506fc
	.xword	0x0000000050ab7b60
	.xword	0x000000000b7fc7d6
.text

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 0, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 0, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 0, 16, 16)) -> intp(3, 1, 1)



.text
        ta      T_GOOD_TRAP


#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!# 	IJ_bind_thread_group("diag.j", 59, th0, 0x01);
!!# 	IJ_bind_thread_group("diag.j", 60, th1, 0x02);
!!# 	IJ_bind_thread_group("diag.j", 61, th2, 0x04);
!!# 	IJ_bind_thread_group("diag.j", 62, th3, 0x08);
!!# 	IJ_bind_thread_group("diag.j", 63, th_all, 0x0f);
!!# 
!!# 	IJ_set_rvar("diag.j", 68, wt_mulx_r, 	"{5}");     
!!# 	IJ_set_rvar("diag.j", 69, wt_divx_r, 	"{10}");
!!# 	IJ_set_rvar("diag.j", 70, wt_mul_r, 	"{5}");
!!# 	IJ_set_rvar("diag.j", 71, wt_div_r, 	"{5}");
!!# 
!!# 	IJ_set_rvar("diag.j", 73, wt_mulx_i, 	"{5}");     
!!# 	IJ_set_rvar("diag.j", 74, wt_divx_i, 	"{5}");
!!# 	IJ_set_rvar("diag.j", 75, wt_mul_i, 	"{4}");
!!# 	IJ_set_rvar("diag.j", 76, wt_div_i, 	"{4}");
!!# 	IJ_set_rvar("diag.j", 77, wt_ld, 		"{4}");
!!# 
!!# 	IJ_set_rvar("diag.j", 81, init_64,    "64'hrrrrrrrrrrrrrrrr");
!!# 	IJ_set_rvar("diag.j", 82, init_32,    "64'h00000000rrrrrrrr");
!!# 
!!# 	IJ_set_ropr_fld("diag.j", 86, ijdefault, Ft_Rs1, "{0:1, 3..31:29}");
!!# 	IJ_set_ropr_fld("diag.j", 87, ijdefault, Ft_Rs2, "{0:1, 3..31:29}");
!!# 	IJ_set_ropr_fld("diag.j", 88, ijdefault, Ft_Rd, "{3..31}");
!!# 
!!# 	IJ_set_ropr_fld("diag.j", 92, ld_immed, Ft_Simm13, "13'b0_0rrr_rrrr_r000");
!!# 	IJ_set_ropr_fld("diag.j", 93, ld_immed, Ft_Rs1, "{1,2}");
!!# 
!!# 	IJ_set_ropr_fld("diag.j", 95, wry_op, Ft_Rs1, "{0:1, 3..31:29}");
!!# 
!!# 	IJ_init_regs_by_setx ("diag.j", 101, th0, 2, 1, init_64); 
!!# 
!!# 	IJ_th_fork_group("diag.j", 103, th_all);	
!!# 
!!# 	// %%y is the Y register
!!# 	IJ_printf("diag.j", 106, th_all, "\twr %%r%od,0x1fff,%%y\n", wry_op, Ft_Rs1);
!!# 
!!# 	// %y specifier prints thid
!!# 	IJ_printf("diag.j", 109, th_all, "\tsetx\tt%y_data64_start_0,%%g3, %%g1\n");
!!# 	IJ_printf("diag.j", 110, th_all, "\tsetx\tt%y_data32_start_0,%%g3, %%g2\n");
!!# 
!!# 	return 0;
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 	int i;
!!# 
!!# 	IJ_printf ("diag.j", 121, th_all, ".data\n.align\t256\nt%y_data64_start_0:\n");
!!# 	for (i= 0; i < 512; i++)  
!!# 	{	
!!# 	     	IJ_printf ("diag.j", 124, th0, "\t.xword\t0x%016llrx\n", init_64);
!!#      		IJ_printf ("diag.j", 125, th1, "\t.xword\t0x%016llrx\n", init_64);
!!# 	     	IJ_printf ("diag.j", 126, th2, "\t.xword\t0x%016llrx\n", init_64);
!!# 	     	IJ_printf ("diag.j", 127, th3, "\t.xword\t0x%016llrx\n", init_64);
!!# 	}
!!# 
!!# 	IJ_printf ("diag.j", 131, th_all, ".data\n.align\t256\nt%y_data32_start_0:\n");
!!# 	for (i= 0; i < 512; i++) {
!!# 		IJ_printf ("diag.j", 133, th0, "\t.xword\t0x%016llrx\n", init_32);
!!# 		IJ_printf ("diag.j", 134, th1, "\t.xword\t0x%016llrx\n", init_32);
!!# 		IJ_printf ("diag.j", 135, th2, "\t.xword\t0x%016llrx\n", init_32);
!!# 		IJ_printf ("diag.j", 136, th3, "\t.xword\t0x%016llrx\n", init_32);
!!# 	}
!!# 
!!# 	IJ_printf ("diag.j", 139, th_all, ".text\n");
!!# 	IJ_th_join_group("diag.j", 140, th_all);
!!# 	IJ_th_start ("diag.j", 141,Seq_Start, NULL, 0);
!!# 
!!# 	return 0;
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type;
!!# 
!!# inst_type: op op op op op
!!# 	{
!!# 		IJ_generate ("diag.j", 169, th0, $2);
!!# 		IJ_generate ("diag.j", 170, th1, $3);
!!# 		IJ_generate ("diag.j", 171, th2, $4);
!!# 		IJ_generate ("diag.j", 172, th3, $5);
!!# 	};
!!# 
!!# op:		mulx_r 	%rvar 	 wt_mulx_r  |
!!# 		divx_r 	%rvar 	 wt_divx_r  |
!!# 		mul_r	%rvar	 wt_mul_r |
!!# 		div_r	%rvar	 wt_div_r |
!!# 		mulx_i 	%rvar 	 wt_mulx_i  |
!!# 		divx_i 	%rvar 	 wt_divx_i  |
!!# 		mul_i	%rvar	 wt_mul_i |
!!# 		div_i	%rvar	 wt_div_i |
!!# 		ld	%rvar    wt_ld;
!!# 
!!# mulx_r:		tMULX_R;
!!# 
!!# mulx_i:		tMULX_I;
!!# 
!!# divx_r:		tSDIVX_R | tUDIVX_R;
!!# 
!!# divx_i:		tSDIVX_I | tUDIVX_I;
!!# 
!!# mul_i:		tUMUL_I | tSMUL_I | tUMULcc_I | tSMULcc_I
!!# 		    | tMULScc_I;
!!# 
!!# mul_r:		tUMUL_R | tSMUL_R | tUMULcc_R | tSMULcc_R
!!# 		    | tMULScc_R ;
!!# 
!!# div_i:		tUDIV_I | tSDIV_I | tUDIVcc_I | tSDIVcc_I;
!!# 
!!# div_r:		tUDIV_R | tSDIV_R | tUDIVcc_R | tSDIVcc_R;
!!# 
!!# ld:		tLDX_I %ropr  ld_immed | 
!!# 		tWRY_I %ropr  wry_op;
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
