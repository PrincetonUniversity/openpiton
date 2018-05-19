// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_9.s
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
   random seed:	131500244
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

	setx 0x90ea1d651522daba, %g1, %g0
	setx 0x55359a7eb0a7e612, %g1, %g1
	setx 0xa7bfa105c48bed14, %g1, %g2
	setx 0xa941c744427e0494, %g1, %g3
	setx 0xe41e4319104b2737, %g1, %g4
	setx 0xdfc879b567c9c9f7, %g1, %g5
	setx 0x5445304db25e0dda, %g1, %g6
	setx 0xc6d918c3201633b4, %g1, %g7
	setx 0xebef7962c727ae73, %g1, %r16
	setx 0xc038121f9e042b9a, %g1, %r17
	setx 0xbd9c67d2c29d037c, %g1, %r18
	setx 0x0ff2bc882d79de2e, %g1, %r19
	setx 0xe088fd4e1d0f1663, %g1, %r20
	setx 0x950bfe708f16404e, %g1, %r21
	setx 0x4240cf528c20b47f, %g1, %r22
	setx 0xf3a40df39c928b20, %g1, %r23
	setx 0x54566b7a0353fb61, %g1, %r24
	setx 0x8f60d7c668534871, %g1, %r25
	setx 0x3a88e1203a1e5fb5, %g1, %r26
	setx 0x5004b3000a4207a7, %g1, %r27
	setx 0x7ae7cd2455886c66, %g1, %r28
	setx 0x3fcf463f91124fa2, %g1, %r29
	setx 0x07ccaba8a8c093d9, %g1, %r30
	setx 0x20fdb63cbb06a543, %g1, %r31
	save
	setx 0x3e2f3cf1c5c27205, %g1, %r16
	setx 0xf5f81a9e56fa4307, %g1, %r17
	setx 0xdc1696f5e6a26355, %g1, %r18
	setx 0x435cd1ced00e6ae3, %g1, %r19
	setx 0x0a4c9da533a279ba, %g1, %r20
	setx 0x6bf45af355cf952d, %g1, %r21
	setx 0x8940f3e56af65872, %g1, %r22
	setx 0x7c2ab82d267fd343, %g1, %r23
	setx 0xec8e1983f11c288c, %g1, %r24
	setx 0x0b0e03f51a4e9b5f, %g1, %r25
	setx 0x0854fb82639192e3, %g1, %r26
	setx 0x9ccbc78557dcb187, %g1, %r27
	setx 0x7ee157fa744f99ca, %g1, %r28
	setx 0x5fde10b06b1f62e0, %g1, %r29
	setx 0x0ffb8e1c017b3b9a, %g1, %r30
	setx 0x8583aaecb00a4fbd, %g1, %r31
	save
	setx 0xe770c78dbb8f154c, %g1, %r16
	setx 0xc110519a1062b236, %g1, %r17
	setx 0x8592f5eade899707, %g1, %r18
	setx 0x26e94bad8ca8b26d, %g1, %r19
	setx 0xe7ee5301b04be388, %g1, %r20
	setx 0xe72f4c99ce63446a, %g1, %r21
	setx 0x7787b19f6f3088e9, %g1, %r22
	setx 0x35d2fa8b7f98edcd, %g1, %r23
	setx 0x40de3c2123153067, %g1, %r24
	setx 0xf1a966a81de92751, %g1, %r25
	setx 0x4197cd4784acd282, %g1, %r26
	setx 0xcfd8fb77abe91a94, %g1, %r27
	setx 0xa74032ab26733623, %g1, %r28
	setx 0x5d86f7c4e1a5f741, %g1, %r29
	setx 0x9535011a23e230dc, %g1, %r30
	setx 0x1da88d7f43189de0, %g1, %r31
	save
	setx 0xb32f12e863c4d7b7, %g1, %r16
	setx 0xe474c7f285408514, %g1, %r17
	setx 0xa4b3955129bd2761, %g1, %r18
	setx 0xf5c11de07036a825, %g1, %r19
	setx 0x7087b3f7dabbdeca, %g1, %r20
	setx 0x97382b93c2f15e81, %g1, %r21
	setx 0x06184452758f331b, %g1, %r22
	setx 0xa3c6c9b8b24ba967, %g1, %r23
	setx 0x020527e9e311a0c9, %g1, %r24
	setx 0x18fadd3bea7b268e, %g1, %r25
	setx 0x2fae50cf47a7056e, %g1, %r26
	setx 0x925d36a88be8d460, %g1, %r27
	setx 0xd462fe5b802fca43, %g1, %r28
	setx 0x0f56987597ba65ec, %g1, %r29
	setx 0xa6d6dbea9ee8cf87, %g1, %r30
	setx 0x55db883aa39aa5bc, %g1, %r31
	save
	setx 0x2073135e5ead215b, %g1, %r16
	setx 0x496bada0d32f9143, %g1, %r17
	setx 0x56144d8aa0932ba0, %g1, %r18
	setx 0xb8963905c6263010, %g1, %r19
	setx 0xb794ac45058053d4, %g1, %r20
	setx 0xc8a77eebc10850f0, %g1, %r21
	setx 0x1910a6ea201d32a7, %g1, %r22
	setx 0xcd80e60a37c6a332, %g1, %r23
	setx 0x3f80f2dda5fda789, %g1, %r24
	setx 0xfda9be81ed7f9807, %g1, %r25
	setx 0x444bd47b554bc0ae, %g1, %r26
	setx 0x5fb9b3093e549712, %g1, %r27
	setx 0xdb3757c252ffb9e7, %g1, %r28
	setx 0x45f706a53811a049, %g1, %r29
	setx 0x2a869d59fe367b40, %g1, %r30
	setx 0x72f852ac61bfb45a, %g1, %r31
	save
	setx 0x4198994bae22ec37, %g1, %r16
	setx 0x17d24ad53ec925a2, %g1, %r17
	setx 0x1825aed973bfa519, %g1, %r18
	setx 0x55fa4515c38c14bb, %g1, %r19
	setx 0x7282010547b90da5, %g1, %r20
	setx 0x289705cb0a2a8b5a, %g1, %r21
	setx 0x7842ed712e858f2d, %g1, %r22
	setx 0xa67794d2a2c337d0, %g1, %r23
	setx 0xa424af9eb16a217e, %g1, %r24
	setx 0x8bdedb94bb308483, %g1, %r25
	setx 0xc7392154d2742b94, %g1, %r26
	setx 0xb1dd1f09829b4b60, %g1, %r27
	setx 0x74102f3a1b7756f3, %g1, %r28
	setx 0x95cce1c4c5b26e4a, %g1, %r29
	setx 0x2b5a4f26e7a35539, %g1, %r30
	setx 0x4e774c58b88b0c47, %g1, %r31
	save
	setx 0xc242a7c4ceea8295, %g1, %r16
	setx 0x763106cabdb877af, %g1, %r17
	setx 0xf30924d1d5d45e11, %g1, %r18
	setx 0x8ba29972cccf2578, %g1, %r19
	setx 0x7e91ba86e7f27119, %g1, %r20
	setx 0x32dff392559e1a44, %g1, %r21
	setx 0xec15a4012a89bf0e, %g1, %r22
	setx 0x8dd688218408fa8a, %g1, %r23
	setx 0x686bab5cb30d6ee7, %g1, %r24
	setx 0x9e39a533449f87d5, %g1, %r25
	setx 0xcaf2b75e16db43b9, %g1, %r26
	setx 0xfc9f235e9ba4e6e5, %g1, %r27
	setx 0xd8752136fbbecd86, %g1, %r28
	setx 0x214cb50e90a10801, %g1, %r29
	setx 0xb1b824800c1c2c8c, %g1, %r30
	setx 0x2ce5ceb3906409ea, %g1, %r31
	save
	setx 0xb36c8816d270d7eb, %g1, %r16
	setx 0x9b45d4587528e8ee, %g1, %r17
	setx 0x02d0848869e215c2, %g1, %r18
	setx 0xa01d5d8e6530655f, %g1, %r19
	setx 0x3cc4a92c50730465, %g1, %r20
	setx 0x6a22ec409e52302b, %g1, %r21
	setx 0xbb874307ac902b9d, %g1, %r22
	setx 0x8c06fd17626f01e5, %g1, %r23
	setx 0xfaa797213e25ef77, %g1, %r24
	setx 0xbcfcaca446be9d79, %g1, %r25
	setx 0xeed5fbf3055c1c5c, %g1, %r26
	setx 0x3047d0d888818b43, %g1, %r27
	setx 0x59995638b4a6f347, %g1, %r28
	setx 0x53a8f3abaf86de25, %g1, %r29
	setx 0x0da95259f0204182, %g1, %r30
	setx 0x5e33435bafa6b1aa, %g1, %r31
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
	.word 0xb3e460f5  ! 1: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb045e173  ! 2: ADDC_I	addc 	%r23, 0x0173, %r24
	.word 0xbd356001  ! 3: SRL_I	srl 	%r21, 0x0001, %r30
	.word 0xbfe461fc  ! 4: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e52152  ! 5: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe4e181  ! 9: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5218b  ! 19: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5e093  ! 20: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde461a3  ! 22: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe4e026  ! 26: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e4a194  ! 28: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde560c6  ! 30: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5520000  ! 33: RDPR_PIL	<illegal instruction>
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 25)
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 1)
	.word 0xbf51c000  ! 42: RDPR_TL	<illegal instruction>
	.word 0xb1e42107  ! 46: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8194e154  ! 50: WRPR_TPC_I	wrpr	%r19, 0x0154, %tpc
	.word 0xb1e5a164  ! 55: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5a160  ! 58: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e42050  ! 59: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8d95a012  ! 60: WRPR_PSTATE_I	wrpr	%r22, 0x0012, %pstate
	.word 0x8594211c  ! 61: WRPR_TSTATE_I	wrpr	%r16, 0x011c, %tstate
	.word 0xb3e5a05d  ! 62: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5a16d  ! 65: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb6442018  ! 68: ADDC_I	addc 	%r16, 0x0018, %r27
	.word 0xbfe4a187  ! 70: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5a079  ! 71: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x839461f4  ! 77: WRPR_TNPC_I	wrpr	%r17, 0x01f4, %tnpc
	setx	data_start_7, %g1, %r19
	.word 0xb5e5e0ba  ! 86: SAVE_I	save	%r23, 0x0001, %r26
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb7e52161  ! 91: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x839561e8  ! 94: WRPR_TNPC_I	wrpr	%r21, 0x01e8, %tnpc
	.word 0xb7500000  ! 96: RDPR_TPC	<illegal instruction>
	.word 0xbfe561d2  ! 99: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb52d2001  ! 101: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xbde520ea  ! 102: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e42192  ! 103: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 0)
	.word 0xbb50c000  ! 106: RDPR_TT	<illegal instruction>
	.word 0xbfe561a4  ! 108: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5e17b  ! 109: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8795a11b  ! 114: WRPR_TT_I	wrpr	%r22, 0x011b, %tt
	.word 0xb1e5e1b0  ! 116: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb92cc000  ! 117: SLL_R	sll 	%r19, %r0, %r28
	.word 0xbde42068  ! 119: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe560f1  ! 124: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb951c000  ! 125: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 127: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e5e0b6  ! 128: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5a1f3  ! 132: SAVE_I	save	%r22, 0x0001, %r26
	setx	data_start_4, %g1, %r16
	.word 0xb9508000  ! 135: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e521ba  ! 136: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe561bf  ! 137: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1347001  ! 139: SRLX_I	srlx	%r17, 0x0001, %r24
	.word 0xb7e4611e  ! 142: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4a0a9  ! 143: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e461d7  ! 144: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e421af  ! 146: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde4e156  ! 148: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb351c000  ! 151: RDPR_TL	<illegal instruction>
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 31)
	.word 0x8d9560f6  ! 153: WRPR_PSTATE_I	wrpr	%r21, 0x00f6, %pstate
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbb3cc000  ! 155: SRA_R	sra 	%r19, %r0, %r29
	.word 0xbfe4e1b8  ! 157: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb21d8000  ! 162: XOR_R	xor 	%r22, %r0, %r25
	.word 0xbde4a052  ! 164: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe46002  ! 169: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e5e0bc  ! 177: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e460bc  ! 181: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbc246080  ! 183: SUB_I	sub 	%r17, 0x0080, %r30
	.word 0xb77da401  ! 186: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xbbe5a192  ! 189: SAVE_I	save	%r22, 0x0001, %r29
	setx	data_start_7, %g1, %r21
	setx	data_start_4, %g1, %r17
	.word 0xbbe4e0da  ! 200: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf540000  ! 202: RDPR_GL	<illegal instruction>
	.word 0xb9e4e089  ! 207: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5e095  ! 212: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb01ce1ea  ! 218: XOR_I	xor 	%r19, 0x01ea, %r24
	.word 0xbb2c3001  ! 221: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xb9e4e084  ! 223: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x899561e2  ! 224: WRPR_TICK_I	wrpr	%r21, 0x01e2, %tick
	.word 0xbfe420c2  ! 228: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x83946063  ! 230: WRPR_TNPC_I	wrpr	%r17, 0x0063, %tnpc
	.word 0xbfe5218a  ! 231: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe4617c  ! 232: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3520000  ! 236: RDPR_PIL	<illegal instruction>
	.word 0xb5e5a1b9  ! 240: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8194e1c2  ! 242: WRPR_TPC_I	wrpr	%r19, 0x01c2, %tpc
	.word 0xb9e4606a  ! 243: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe461f9  ! 244: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e56104  ! 247: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5606a  ! 252: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_0, %g1, %r22
	.word 0xbbe4e034  ! 255: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3504000  ! 259: RDPR_TNPC	<illegal instruction>
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 2a)
	.word 0x919461c9  ! 261: WRPR_PIL_I	wrpr	%r17, 0x01c9, %pil
	.word 0x8995a06c  ! 263: WRPR_TICK_I	wrpr	%r22, 0x006c, %tick
	.word 0xb5e5a05d  ! 264: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e46072  ! 266: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8995a193  ! 269: WRPR_TICK_I	wrpr	%r22, 0x0193, %tick
	.word 0xb5e5a0e3  ! 272: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e46042  ! 273: SAVE_I	save	%r17, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 275: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e5216e  ! 276: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e520da  ! 281: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe460ca  ! 284: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e521ce  ! 287: SAVE_I	save	%r20, 0x0001, %r27
	mov	1, %r12
	.word 0xa1930000  ! 289: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e42085  ! 291: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e4a195  ! 292: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4216a  ! 296: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb934e001  ! 297: SRL_I	srl 	%r19, 0x0001, %r28
	.word 0xbf2c1000  ! 301: SLLX_R	sllx	%r16, %r0, %r31
	.word 0x8395a0f2  ! 303: WRPR_TNPC_I	wrpr	%r22, 0x00f2, %tnpc
	.word 0xbbe5202b  ! 306: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 39)
	.word 0xb614210f  ! 310: OR_I	or 	%r16, 0x010f, %r27
	setx	0xe85040330000b84a, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e52052  ! 322: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb751c000  ! 324: RDPR_TL	<illegal instruction>
	setx	data_start_2, %g1, %r18
	.word 0xb60c6097  ! 327: AND_I	and 	%r17, 0x0097, %r27
	.word 0x8594e1a0  ! 328: WRPR_TSTATE_I	wrpr	%r19, 0x01a0, %tstate
	.word 0xbfe4e112  ! 333: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 14)
	setx	0x723a24c600000cc8, %g1, %r10
	.word 0x839a8000  ! 335: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e4e0e4  ! 342: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4e0ce  ! 344: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe4e007  ! 356: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e421b7  ! 358: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x93a96fa400000cc5, %g1, %r10
	.word 0x819a8000  ! 366: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 31)
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 39)
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde421e9  ! 377: SAVE_I	save	%r16, 0x0001, %r30
	setx	data_start_2, %g1, %r23
	.word 0xbabdc000  ! 380: XNORcc_R	xnorcc 	%r23, %r0, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5e1a2  ! 385: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e42027  ! 387: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_5, %g1, %r16
	.word 0xbd7da401  ! 394: MOVR_I	movre	%r22, 0x1, %r30
	.word 0x8395206e  ! 397: WRPR_TNPC_I	wrpr	%r20, 0x006e, %tnpc
	.word 0xb1e5a046  ! 399: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e460a3  ! 401: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9508000  ! 402: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4212d  ! 406: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x969f916300008900, %g1, %r10
	.word 0x819a8000  ! 408: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e4e0d7  ! 410: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb89ce0cd  ! 420: XORcc_I	xorcc 	%r19, 0x00cd, %r28
	.word 0xb9e4e098  ! 423: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e5e11a  ! 426: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8795a065  ! 427: WRPR_TT_I	wrpr	%r22, 0x0065, %tt
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 0)
	setx	0xe54a220a00006f98, %g1, %r10
	.word 0x819a8000  ! 434: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e4e1ab  ! 441: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_5, %g1, %r17
	.word 0xbde5205f  ! 446: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbf518000  ! 447: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e42121  ! 449: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e4e1fe  ! 451: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 23)
	.word 0x8994a10f  ! 456: WRPR_TICK_I	wrpr	%r18, 0x010f, %tick
	.word 0xbf2ce001  ! 457: SLL_I	sll 	%r19, 0x0001, %r31
	.word 0xb3e4216c  ! 459: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e421ac  ! 464: SAVE_I	save	%r16, 0x0001, %r24
	setx	0xd858f780000fed2, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e52123  ! 471: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe5600b  ! 472: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e42163  ! 473: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e561b5  ! 474: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5a12e  ! 476: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5e067  ! 481: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe5a070  ! 483: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde42053  ! 484: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde420f4  ! 485: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbead0000  ! 488: ANDNcc_R	andncc 	%r20, %r0, %r31
	.word 0x879520b9  ! 489: WRPR_TT_I	wrpr	%r20, 0x00b9, %tt
	.word 0xb1e46194  ! 491: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8794e0e5  ! 492: WRPR_TT_I	wrpr	%r19, 0x00e5, %tt
	.word 0xbfe520c6  ! 493: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x899420f1  ! 495: WRPR_TICK_I	wrpr	%r16, 0x00f1, %tick
	.word 0xb1e56162  ! 499: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbb508000  ! 501: RDPR_TSTATE	<illegal instruction>
	setx	0xb1c076470000aa43, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd7de401  ! 503: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xb1510000  ! 505: RDPR_TICK	<illegal instruction>
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 1d)
	setx	0xde6d6bf50000985a, %g1, %r10
	.word 0x839a8000  ! 514: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e5a04a  ! 515: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e561a2  ! 518: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9508000  ! 523: RDPR_TSTATE	<illegal instruction>
	.word 0xb3510000  ! 527: RDPR_TICK	<illegal instruction>
	.word 0xb751c000  ! 532: RDPR_TL	<illegal instruction>
	.word 0xbb508000  ! 533: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4e110  ! 534: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8594a1f5  ! 540: WRPR_TSTATE_I	wrpr	%r18, 0x01f5, %tstate
	.word 0xb5e460df  ! 541: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe46192  ! 542: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4a0c0  ! 546: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e520e9  ! 548: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe521b7  ! 549: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9540000  ! 552: RDPR_GL	<illegal instruction>
	.word 0xbfe4a192  ! 557: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe461ec  ! 558: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e4215b  ! 561: SAVE_I	save	%r16, 0x0001, %r25
	setx	data_start_4, %g1, %r21
	.word 0xb1e4e06f  ! 564: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5603b  ! 565: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbc2da13d  ! 566: ANDN_I	andn 	%r22, 0x013d, %r30
	.word 0xb7e521f9  ! 570: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e52027  ! 572: SAVE_I	save	%r20, 0x0001, %r24
	mov	0, %r12
	.word 0x8f930000  ! 577: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe460d4  ! 578: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5a14f  ! 579: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbf540000  ! 581: RDPR_GL	<illegal instruction>
	.word 0xb7e5a0ff  ! 582: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe5a030  ! 584: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e46042  ! 588: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e5203d  ! 590: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_3, %g1, %r16
	.word 0xbf51c000  ! 592: RDPR_TL	<illegal instruction>
	.word 0xbf3ce001  ! 594: SRA_I	sra 	%r19, 0x0001, %r31
	.word 0xbbe46029  ! 595: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x6b45748200002ed5, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb951c000  ! 598: RDPR_TL	<illegal instruction>
	.word 0x8595a10a  ! 600: WRPR_TSTATE_I	wrpr	%r22, 0x010a, %tstate
	.word 0xb0340000  ! 606: SUBC_R	orn 	%r16, %r0, %r24
	.word 0xb9e520b8  ! 609: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e5e0ec  ! 610: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4a081  ! 614: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe4614b  ! 616: SAVE_I	save	%r17, 0x0001, %r29
	mov	0, %r12
	.word 0xa1930000  ! 623: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbaa4619a  ! 626: SUBcc_I	subcc 	%r17, 0x019a, %r29
	.word 0x8594a0d3  ! 628: WRPR_TSTATE_I	wrpr	%r18, 0x00d3, %tstate
	.word 0xbbe4e114  ! 630: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e4a01d  ! 631: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8394e1e5  ! 632: WRPR_TNPC_I	wrpr	%r19, 0x01e5, %tnpc
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e461eb  ! 637: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe4a019  ! 640: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1355000  ! 653: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xb7508000  ! 656: RDPR_TSTATE	<illegal instruction>
	.word 0x919420f7  ! 659: WRPR_PIL_I	wrpr	%r16, 0x00f7, %pil
	.word 0xbd518000  ! 661: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5a06d  ! 663: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e4e008  ! 666: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e56000  ! 668: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e5a0fc  ! 671: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8994e189  ! 672: WRPR_TICK_I	wrpr	%r19, 0x0189, %tick
	setx	data_start_0, %g1, %r22
	.word 0xb3508000  ! 676: RDPR_TSTATE	<illegal instruction>
	.word 0xbb540000  ! 677: RDPR_GL	<illegal instruction>
	setx	data_start_2, %g1, %r20
	.word 0xbb480000  ! 684: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbfe420de  ! 687: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbf500000  ! 690: RDPR_TPC	<illegal instruction>
	.word 0xb5e420b3  ! 691: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5a177  ! 697: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e421e8  ! 703: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e46009  ! 705: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8595e1c0  ! 707: WRPR_TSTATE_I	wrpr	%r23, 0x01c0, %tstate
	mov	2, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 22)
	setx	0x2b0206fe00006b92, %g1, %r10
	.word 0x839a8000  ! 713: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb72c1000  ! 715: SLLX_R	sllx	%r16, %r0, %r27
	.word 0xb5e5214b  ! 716: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5e142  ! 717: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb685e1c8  ! 719: ADDcc_I	addcc 	%r23, 0x01c8, %r27
	.word 0xbbe4e011  ! 720: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbc2d8000  ! 721: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xb5e460f9  ! 722: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbd518000  ! 726: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4e1be  ! 729: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e460b1  ! 730: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x9195e0d8  ! 731: WRPR_PIL_I	wrpr	%r23, 0x00d8, %pil
	.word 0xb3508000  ! 733: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 734: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbf480000  ! 742: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbfe5e16f  ! 743: SAVE_I	save	%r23, 0x0001, %r31
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 25)
	.word 0xbf508000  ! 745: RDPR_TSTATE	<illegal instruction>
	.word 0xbde52171  ! 748: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde5604b  ! 760: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0xb885c000  ! 762: ADDcc_R	addcc 	%r23, %r0, %r28
	.word 0xb1e5a1f3  ! 763: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8d95a0c3  ! 769: WRPR_PSTATE_I	wrpr	%r22, 0x00c3, %pstate
	.word 0xb9e56035  ! 770: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe42158  ! 771: SAVE_I	save	%r16, 0x0001, %r29
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb93ce001  ! 779: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0xb9e56024  ! 780: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e52079  ! 781: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e46081  ! 782: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde560ab  ! 784: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e46078  ! 794: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4614e  ! 796: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e5e1d6  ! 797: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 38)
	.word 0x8994a173  ! 803: WRPR_TICK_I	wrpr	%r18, 0x0173, %tick
	.word 0xb3e4203b  ! 807: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 21)
	.word 0x89942151  ! 814: WRPR_TICK_I	wrpr	%r16, 0x0151, %tick
	.word 0xb3e42039  ! 816: SAVE_I	save	%r16, 0x0001, %r25
	mov	2, %r12
	.word 0x8f930000  ! 817: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 18)
	.word 0xbb518000  ! 823: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e56110  ! 832: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe46173  ! 833: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8195e095  ! 834: WRPR_TPC_I	wrpr	%r23, 0x0095, %tpc
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde4a0dd  ! 836: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1520000  ! 840: RDPR_PIL	<illegal instruction>
	.word 0xb5341000  ! 841: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xbbe4206a  ! 842: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb72d8000  ! 847: SLL_R	sll 	%r22, %r0, %r27
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde4202c  ! 850: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4a14a  ! 853: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x9194213e  ! 854: WRPR_PIL_I	wrpr	%r16, 0x013e, %pil
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3b)
	.word 0x9195a086  ! 862: WRPR_PIL_I	wrpr	%r22, 0x0086, %pil
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 26)
	.word 0xbd480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfe5a1dd  ! 876: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4a01a  ! 877: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e520ef  ! 881: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5e0da  ! 882: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4208d  ! 884: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe4211f  ! 885: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e5a1ab  ! 890: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbe1c20cc  ! 891: XOR_I	xor 	%r16, 0x00cc, %r31
	.word 0xb634c000  ! 893: SUBC_R	orn 	%r19, %r0, %r27
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e4e06c  ! 899: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e4e12a  ! 901: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1480000  ! 905: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0xb97654480000184a, %g1, %r10
	.word 0x819a8000  ! 906: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	2, %r12
	.word 0xa1930000  ! 910: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb950c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0xbbe5208d  ! 914: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e4a1c7  ! 915: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e420b9  ! 917: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbe34e1ad  ! 918: ORN_I	orn 	%r19, 0x01ad, %r31
	.word 0xb73cc000  ! 920: SRA_R	sra 	%r19, %r0, %r27
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 3c)
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe4a024  ! 927: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb57c4400  ! 928: MOVR_R	movre	%r17, %r0, %r26
	.word 0x8194a16b  ! 930: WRPR_TPC_I	wrpr	%r18, 0x016b, %tpc
	.word 0xb1e4e03e  ! 933: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e46129  ! 934: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5217f  ! 938: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb53c4000  ! 939: SRA_R	sra 	%r17, %r0, %r26
	.word 0xb5e42056  ! 942: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbde4e1e7  ! 944: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e5a072  ! 950: SAVE_I	save	%r22, 0x0001, %r24
	setx	0xbc3a548400002fc4, %g1, %r10
	.word 0x819a8000  ! 951: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde5a0bb  ! 952: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4a0d9  ! 953: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e460a8  ! 956: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 32)
	.word 0x9195e0b5  ! 958: WRPR_PIL_I	wrpr	%r23, 0x00b5, %pil
	.word 0xbfe4a161  ! 964: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5a167  ! 967: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb8050000  ! 969: ADD_R	add 	%r20, %r0, %r28
	.word 0xb7e5a115  ! 970: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e5a046  ! 973: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3643801  ! 974: MOVcc_I	<illegal instruction>
	.word 0xb1e4609a  ! 977: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb234c000  ! 981: ORN_R	orn 	%r19, %r0, %r25
	.word 0xb72d5000  ! 983: SLLX_R	sllx	%r21, %r0, %r27
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 5)
	.word 0xbde421f8  ! 985: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde56146  ! 986: SAVE_I	save	%r21, 0x0001, %r30
	mov	2, %r12
	.word 0xa1930000  ! 988: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	1, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e46142  ! 992: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 18)
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
	.word 0xb645600c  ! 2: ADDC_I	addc 	%r21, 0x000c, %r27
	.word 0xbd35a001  ! 3: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xf6350000  ! 11: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xfe35c000  ! 14: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xfa34211f  ! 16: STH_I	sth	%r29, [%r16 + 0x011f]
	.word 0xf63d2042  ! 17: STD_I	std	%r27, [%r20 + 0x0042]
	.word 0xfc744000  ! 21: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xf474a06f  ! 24: STX_I	stx	%r26, [%r18 + 0x006f]
	.word 0xfa248000  ! 27: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf2246029  ! 31: STW_I	stw	%r25, [%r17 + 0x0029]
	.word 0xfc2cc000  ! 32: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb7520000  ! 33: RDPR_PIL	rdpr	%pil, %r27
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, d)
	.word 0xfc3d4000  ! 36: STD_R	std	%r30, [%r21 + %r0]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 19)
	.word 0xbd51c000  ! 42: RDPR_TL	<illegal instruction>
	.word 0xf83c8000  ! 47: STD_R	std	%r28, [%r18 + %r0]
	.word 0xfe240000  ! 48: STW_R	stw	%r31, [%r16 + %r0]
	.word 0x8194a09a  ! 50: WRPR_TPC_I	wrpr	%r18, 0x009a, %tpc
	.word 0xf624a179  ! 51: STW_I	stw	%r27, [%r18 + 0x0179]
	.word 0xf675a16f  ! 52: STX_I	stx	%r27, [%r22 + 0x016f]
	.word 0xf0754000  ! 53: STX_R	stx	%r24, [%r21 + %r0]
	.word 0x8d942043  ! 60: WRPR_PSTATE_I	wrpr	%r16, 0x0043, %pstate
	.word 0x859461fc  ! 61: WRPR_TSTATE_I	wrpr	%r17, 0x01fc, %tstate
	.word 0xf73d4000  ! 64: STDF_R	std	%f27, [%r0, %r21]
	.word 0xf73de1c3  ! 67: STDF_I	std	%f27, [0x01c3, %r23]
	.word 0xb844e16e  ! 68: ADDC_I	addc 	%r19, 0x016e, %r28
	.word 0xf93d210a  ! 73: STDF_I	std	%f28, [0x010a, %r20]
	.word 0xf33c2024  ! 76: STDF_I	std	%f25, [0x0024, %r16]
	.word 0x8394e0b4  ! 77: WRPR_TNPC_I	wrpr	%r19, 0x00b4, %tnpc
	.word 0xf42da1e2  ! 78: STB_I	stb	%r26, [%r22 + 0x01e2]
	.word 0xfe3c0000  ! 80: STD_R	std	%r31, [%r16 + %r0]
	setx	data_start_5, %g1, %r23
	.word 0xfa2d0000  ! 84: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfc2c8000  ! 88: STB_R	stb	%r30, [%r18 + %r0]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 10)
	.word 0xf53d8000  ! 92: STDF_R	std	%f26, [%r0, %r22]
	.word 0x8394a0b1  ! 94: WRPR_TNPC_I	wrpr	%r18, 0x00b1, %tnpc
	.word 0xf2348000  ! 95: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xb1500000  ! 96: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfe354000  ! 98: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf435c000  ! 100: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xb12d2001  ! 101: SLL_I	sll 	%r20, 0x0001, %r24
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 20)
	.word 0xb550c000  ! 106: RDPR_TT	<illegal instruction>
	.word 0xfe248000  ! 110: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfc34c000  ! 112: STH_R	sth	%r30, [%r19 + %r0]
	.word 0x8794e037  ! 114: WRPR_TT_I	wrpr	%r19, 0x0037, %tt
	.word 0xf22561ea  ! 115: STW_I	stw	%r25, [%r21 + 0x01ea]
	.word 0xb32dc000  ! 117: SLL_R	sll 	%r23, %r0, %r25
	.word 0xf22d8000  ! 118: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xfa758000  ! 122: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xbb51c000  ! 125: RDPR_TL	rdpr	%tl, %r29
	mov	1, %r12
	.word 0xa1930000  ! 127: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf73d4000  ! 130: STDF_R	std	%f27, [%r0, %r21]
	setx	data_start_5, %g1, %r16
	.word 0xb1508000  ! 135: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb3343001  ! 139: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xf43c60f6  ! 149: STD_I	std	%r26, [%r17 + 0x00f6]
	.word 0xbb51c000  ! 151: RDPR_TL	<illegal instruction>
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 10)
	.word 0x8d95e0c0  ! 153: WRPR_PSTATE_I	wrpr	%r23, 0x00c0, %pstate
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 27)
	.word 0xbd3d8000  ! 155: SRA_R	sra 	%r22, %r0, %r30
	.word 0xf53cc000  ! 156: STDF_R	std	%f26, [%r0, %r19]
	.word 0xf82da1b8  ! 158: STB_I	stb	%r28, [%r22 + 0x01b8]
	.word 0xf53c213a  ! 159: STDF_I	std	%f26, [0x013a, %r16]
	.word 0xb61d4000  ! 162: XOR_R	xor 	%r21, %r0, %r27
	.word 0xf23d8000  ! 167: STD_R	std	%r25, [%r22 + %r0]
	.word 0xfc35c000  ! 172: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf23dc000  ! 173: STD_R	std	%r25, [%r23 + %r0]
	.word 0xfc74e0cc  ! 176: STX_I	stx	%r30, [%r19 + 0x00cc]
	.word 0xf274606b  ! 178: STX_I	stx	%r25, [%r17 + 0x006b]
	.word 0xf22d4000  ! 182: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xb225e11f  ! 183: SUB_I	sub 	%r23, 0x011f, %r25
	.word 0xf83ca0cf  ! 185: STD_I	std	%r28, [%r18 + 0x00cf]
	.word 0xb77de401  ! 186: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xf82c4000  ! 190: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfa34c000  ! 191: STH_R	sth	%r29, [%r19 + %r0]
	setx	data_start_0, %g1, %r17
	.word 0xf13ca056  ! 193: STDF_I	std	%f24, [0x0056, %r18]
	.word 0xf8254000  ! 194: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfa748000  ! 196: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf474c000  ! 197: STX_R	stx	%r26, [%r19 + %r0]
	setx	data_start_4, %g1, %r18
	.word 0xf82520a8  ! 201: STW_I	stw	%r28, [%r20 + 0x00a8]
	.word 0xbd540000  ! 202: RDPR_GL	rdpr	%-, %r30
	.word 0xf0758000  ! 203: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf2258000  ! 204: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xbc1c21da  ! 218: XOR_I	xor 	%r16, 0x01da, %r30
	.word 0xf035a113  ! 219: STH_I	sth	%r24, [%r22 + 0x0113]
	.word 0xbd2df001  ! 221: SLLX_I	sllx	%r23, 0x0001, %r30
	.word 0x8994a17f  ! 224: WRPR_TICK_I	wrpr	%r18, 0x017f, %tick
	.word 0xff3d8000  ! 226: STDF_R	std	%f31, [%r0, %r22]
	.word 0x8395e16e  ! 230: WRPR_TNPC_I	wrpr	%r23, 0x016e, %tnpc
	.word 0xb3520000  ! 236: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfe34a14f  ! 237: STH_I	sth	%r31, [%r18 + 0x014f]
	.word 0xf63ca048  ! 241: STD_I	std	%r27, [%r18 + 0x0048]
	.word 0x819520f8  ! 242: WRPR_TPC_I	wrpr	%r20, 0x00f8, %tpc
	.word 0xfe348000  ! 250: STH_R	sth	%r31, [%r18 + %r0]
	setx	data_start_0, %g1, %r16
	.word 0xf2750000  ! 257: STX_R	stx	%r25, [%r20 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb1504000  ! 259: RDPR_TNPC	rdpr	%tnpc, %r24
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 1e)
	.word 0x9194615e  ! 261: WRPR_PIL_I	wrpr	%r17, 0x015e, %pil
	.word 0x8994605c  ! 263: WRPR_TICK_I	wrpr	%r17, 0x005c, %tick
	.word 0xf025e0c5  ! 265: STW_I	stw	%r24, [%r23 + 0x00c5]
	.word 0xf234a0f5  ! 267: STH_I	sth	%r25, [%r18 + 0x00f5]
	.word 0xf025211e  ! 268: STW_I	stw	%r24, [%r20 + 0x011e]
	.word 0x8994a18d  ! 269: WRPR_TICK_I	wrpr	%r18, 0x018d, %tick
	.word 0xf03d0000  ! 274: STD_R	std	%r24, [%r20 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 275: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf2248000  ! 280: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf224c000  ! 288: STW_R	stw	%r25, [%r19 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 289: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf93d20a5  ! 290: STDF_I	std	%f28, [0x00a5, %r20]
	.word 0xb135e001  ! 297: SRL_I	srl 	%r23, 0x0001, %r24
	.word 0xbf2cd000  ! 301: SLLX_R	sllx	%r19, %r0, %r31
	.word 0x8394a16b  ! 303: WRPR_TNPC_I	wrpr	%r18, 0x016b, %tnpc
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 3d)
	.word 0xbe14a122  ! 310: OR_I	or 	%r18, 0x0122, %r31
	setx	0x43dc28f80000ec05, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa3c4000  ! 316: STD_R	std	%r29, [%r17 + %r0]
	.word 0xfa75a0db  ! 317: STX_I	stx	%r29, [%r22 + 0x00db]
	.word 0xf02c2013  ! 319: STB_I	stb	%r24, [%r16 + 0x0013]
	.word 0xf73ca120  ! 323: STDF_I	std	%f27, [0x0120, %r18]
	.word 0xb551c000  ! 324: RDPR_TL	rdpr	%tl, %r26
	setx	data_start_2, %g1, %r22
	.word 0xf02460a4  ! 326: STW_I	stw	%r24, [%r17 + 0x00a4]
	.word 0xbc0ce1e9  ! 327: AND_I	and 	%r19, 0x01e9, %r30
	.word 0x8595e007  ! 328: WRPR_TSTATE_I	wrpr	%r23, 0x0007, %tstate
	.word 0xff3c60c5  ! 330: STDF_I	std	%f31, [0x00c5, %r17]
	.word 0xfa74a0a3  ! 332: STX_I	stx	%r29, [%r18 + 0x00a3]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 9)
	setx	0xab1034780000af99, %g1, %r10
	.word 0x839a8000  ! 335: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfb3ce0fb  ! 341: STDF_I	std	%f29, [0x00fb, %r19]
	.word 0xf73d21ee  ! 351: STDF_I	std	%f27, [0x01ee, %r20]
	.word 0xf025c000  ! 352: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf4348000  ! 354: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xfe342053  ! 355: STH_I	sth	%r31, [%r16 + 0x0053]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x8bb55d500001cd8, %g1, %r10
	.word 0x819a8000  ! 366: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, a)
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, b)
	.word 0xfc746086  ! 369: STX_I	stx	%r30, [%r17 + 0x0086]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 7)
	.word 0xff3de1fd  ! 378: STDF_I	std	%f31, [0x01fd, %r23]
	setx	data_start_0, %g1, %r23
	.word 0xb2bd0000  ! 380: XNORcc_R	xnorcc 	%r20, %r0, %r25
	.word 0xf4254000  ! 382: STW_R	stw	%r26, [%r21 + %r0]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2560fa  ! 386: STW_I	stw	%r30, [%r21 + 0x00fa]
	.word 0xf63c0000  ! 388: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf03d0000  ! 389: STD_R	std	%r24, [%r20 + %r0]
	.word 0xff3d6037  ! 390: STDF_I	std	%f31, [0x0037, %r21]
	.word 0xfe2561b2  ! 392: STW_I	stw	%r31, [%r21 + 0x01b2]
	setx	data_start_2, %g1, %r18
	.word 0xb37d2401  ! 394: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xf93d8000  ! 395: STDF_R	std	%f28, [%r0, %r22]
	.word 0x8395608d  ! 397: WRPR_TNPC_I	wrpr	%r21, 0x008d, %tnpc
	.word 0xf93c61aa  ! 398: STDF_I	std	%f28, [0x01aa, %r17]
	.word 0xbd508000  ! 402: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfe24602a  ! 404: STW_I	stw	%r31, [%r17 + 0x002a]
	setx	0xacf5e57500001f4d, %g1, %r10
	.word 0x819a8000  ! 408: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb3dc000  ! 411: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf63ce197  ! 412: STD_I	std	%r27, [%r19 + 0x0197]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfd3c61af  ! 416: STDF_I	std	%f30, [0x01af, %r17]
	.word 0xfa74c000  ! 417: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfe34e105  ! 418: STH_I	sth	%r31, [%r19 + 0x0105]
	.word 0xbe9c60ca  ! 420: XORcc_I	xorcc 	%r17, 0x00ca, %r31
	.word 0xfe2ca002  ! 421: STB_I	stb	%r31, [%r18 + 0x0002]
	.word 0xf13da061  ! 424: STDF_I	std	%f24, [0x0061, %r22]
	.word 0xf42d20d4  ! 425: STB_I	stb	%r26, [%r20 + 0x00d4]
	.word 0x879460ed  ! 427: WRPR_TT_I	wrpr	%r17, 0x00ed, %tt
	.word 0xfa34a194  ! 429: STH_I	sth	%r29, [%r18 + 0x0194]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 24)
	.word 0xf93c8000  ! 431: STDF_R	std	%f28, [%r0, %r18]
	setx	0x4f8d0ac70000395d, %g1, %r10
	.word 0x819a8000  ! 434: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc2ca066  ! 437: STB_I	stb	%r30, [%r18 + 0x0066]
	.word 0xf23dc000  ! 439: STD_R	std	%r25, [%r23 + %r0]
	setx	data_start_0, %g1, %r21
	.word 0xf83ce0ca  ! 444: STD_I	std	%r28, [%r19 + 0x00ca]
	.word 0xb9518000  ! 447: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf8240000  ! 448: STW_R	stw	%r28, [%r16 + %r0]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 20)
	.word 0xf434c000  ! 455: STH_R	sth	%r26, [%r19 + %r0]
	.word 0x8995a0c1  ! 456: WRPR_TICK_I	wrpr	%r22, 0x00c1, %tick
	.word 0xbd2ce001  ! 457: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xfa74c000  ! 458: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfe3de0bf  ! 461: STD_I	std	%r31, [%r23 + 0x00bf]
	.word 0xfa340000  ! 466: STH_R	sth	%r29, [%r16 + %r0]
	setx	0x323bf10600000ed2, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa3dc000  ! 475: STD_R	std	%r29, [%r23 + %r0]
	.word 0xf6754000  ! 478: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfc748000  ! 479: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf0344000  ! 482: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xfa344000  ! 486: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xbcac0000  ! 488: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0x8795e0fc  ! 489: WRPR_TT_I	wrpr	%r23, 0x00fc, %tt
	.word 0x8795a0ea  ! 492: WRPR_TT_I	wrpr	%r22, 0x00ea, %tt
	.word 0x8994a1fe  ! 495: WRPR_TICK_I	wrpr	%r18, 0x01fe, %tick
	.word 0xbf508000  ! 501: RDPR_TSTATE	rdpr	%tstate, %r31
	setx	0x1167af0900009cd6, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb97ca401  ! 503: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xf2756008  ! 504: STX_I	stx	%r25, [%r21 + 0x0008]
	.word 0xbd510000  ! 505: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf83d0000  ! 506: STD_R	std	%r28, [%r20 + %r0]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf73d4000  ! 510: STDF_R	std	%f27, [%r0, %r21]
	setx	0x586c19e20000bc05, %g1, %r10
	.word 0x839a8000  ! 514: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf73d8000  ! 516: STDF_R	std	%f27, [%r0, %r22]
	.word 0xf93c2116  ! 519: STDF_I	std	%f28, [0x0116, %r16]
	.word 0xfe7521b2  ! 520: STX_I	stx	%r31, [%r20 + 0x01b2]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, a)
	.word 0xb7508000  ! 523: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xbf510000  ! 527: RDPR_TICK	<illegal instruction>
	.word 0xf2756072  ! 530: STX_I	stx	%r25, [%r21 + 0x0072]
	.word 0xbb51c000  ! 532: RDPR_TL	<illegal instruction>
	.word 0xbb508000  ! 533: RDPR_TSTATE	<illegal instruction>
	.word 0xf73c0000  ! 538: STDF_R	std	%f27, [%r0, %r16]
	.word 0x8595e0f8  ! 540: WRPR_TSTATE_I	wrpr	%r23, 0x00f8, %tstate
	.word 0xf82d61e4  ! 543: STB_I	stb	%r28, [%r21 + 0x01e4]
	.word 0xf42d2083  ! 550: STB_I	stb	%r26, [%r20 + 0x0083]
	.word 0xff3c8000  ! 551: STDF_R	std	%f31, [%r0, %r18]
	.word 0xb3540000  ! 552: RDPR_GL	rdpr	%-, %r25
	.word 0xf13ca087  ! 553: STDF_I	std	%f24, [0x0087, %r18]
	.word 0xf93c0000  ! 556: STDF_R	std	%f28, [%r0, %r16]
	.word 0xfb3da150  ! 559: STDF_I	std	%f29, [0x0150, %r22]
	.word 0xfe358000  ! 560: STH_R	sth	%r31, [%r22 + %r0]
	setx	data_start_1, %g1, %r18
	.word 0xb82d6166  ! 566: ANDN_I	andn 	%r21, 0x0166, %r28
	.word 0xfc3ce185  ! 571: STD_I	std	%r30, [%r19 + 0x0185]
	.word 0xf73ca1ca  ! 573: STDF_I	std	%f27, [0x01ca, %r18]
	.word 0xfc2ca02b  ! 574: STB_I	stb	%r30, [%r18 + 0x002b]
	mov	1, %r12
	.word 0x8f930000  ! 577: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd540000  ! 581: RDPR_GL	rdpr	%-, %r30
	.word 0xfc358000  ! 583: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf0340000  ! 587: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xfb3c0000  ! 589: STDF_R	std	%f29, [%r0, %r16]
	setx	data_start_5, %g1, %r19
	.word 0xbb51c000  ! 592: RDPR_TL	<illegal instruction>
	.word 0xb53c2001  ! 594: SRA_I	sra 	%r16, 0x0001, %r26
	setx	0x8923d5fb0000cd1e, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb751c000  ! 598: RDPR_TL	rdpr	%tl, %r27
	.word 0x8595a194  ! 600: WRPR_TSTATE_I	wrpr	%r22, 0x0194, %tstate
	.word 0xf824a0bd  ! 604: STW_I	stw	%r28, [%r18 + 0x00bd]
	.word 0xb035c000  ! 606: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xf0352027  ! 607: STH_I	sth	%r24, [%r20 + 0x0027]
	.word 0xfe242037  ! 611: STW_I	stw	%r31, [%r16 + 0x0037]
	.word 0xf82ca055  ! 615: STB_I	stb	%r28, [%r18 + 0x0055]
	.word 0xf63da09a  ! 619: STD_I	std	%r27, [%r22 + 0x009a]
	.word 0xf8242114  ! 622: STW_I	stw	%r28, [%r16 + 0x0114]
	mov	2, %r12
	.word 0xa1930000  ! 623: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb6a521ba  ! 626: SUBcc_I	subcc 	%r20, 0x01ba, %r27
	.word 0x8595a117  ! 628: WRPR_TSTATE_I	wrpr	%r22, 0x0117, %tstate
	.word 0x8394608c  ! 632: WRPR_TNPC_I	wrpr	%r17, 0x008c, %tnpc
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfa34e0c5  ! 636: STH_I	sth	%r29, [%r19 + 0x00c5]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfc740000  ! 641: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xfe2d2063  ! 643: STB_I	stb	%r31, [%r20 + 0x0063]
	.word 0xfc3c60bc  ! 644: STD_I	std	%r30, [%r17 + 0x00bc]
	.word 0xf23c60b4  ! 648: STD_I	std	%r25, [%r17 + 0x00b4]
	.word 0xb9341000  ! 653: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xb1508000  ! 656: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf43c207c  ! 658: STD_I	std	%r26, [%r16 + 0x007c]
	.word 0x9194e15f  ! 659: WRPR_PIL_I	wrpr	%r19, 0x015f, %pil
	.word 0xb5518000  ! 661: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xf074e0a6  ! 667: STX_I	stx	%r24, [%r19 + 0x00a6]
	.word 0xf0344000  ! 670: STH_R	sth	%r24, [%r17 + %r0]
	.word 0x8995a0e9  ! 672: WRPR_TICK_I	wrpr	%r22, 0x00e9, %tick
	.word 0xf63d6156  ! 673: STD_I	std	%r27, [%r21 + 0x0156]
	setx	data_start_0, %g1, %r19
	.word 0xb5508000  ! 676: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb3540000  ! 677: RDPR_GL	<illegal instruction>
	.word 0xfa2c8000  ! 680: STB_R	stb	%r29, [%r18 + %r0]
	setx	data_start_7, %g1, %r17
	.word 0xb9480000  ! 684: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbd500000  ! 690: RDPR_TPC	<illegal instruction>
	.word 0xf0252148  ! 692: STW_I	stw	%r24, [%r20 + 0x0148]
	.word 0xf93d6059  ! 696: STDF_I	std	%f28, [0x0059, %r21]
	.word 0xf13d21fe  ! 698: STDF_I	std	%f24, [0x01fe, %r20]
	.word 0xfc2da1fb  ! 700: STB_I	stb	%r30, [%r22 + 0x01fb]
	.word 0x8595e15c  ! 707: WRPR_TSTATE_I	wrpr	%r23, 0x015c, %tstate
	mov	2, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 26)
	setx	0xa8a8e0dc00008c0d, %g1, %r10
	.word 0x839a8000  ! 713: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb72dd000  ! 715: SLLX_R	sllx	%r23, %r0, %r27
	.word 0xba85e0e3  ! 719: ADDcc_I	addcc 	%r23, 0x00e3, %r29
	.word 0xbe2dc000  ! 721: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xf8744000  ! 723: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xb5518000  ! 726: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0x9194214e  ! 731: WRPR_PIL_I	wrpr	%r16, 0x014e, %pil
	.word 0xfc35c000  ! 732: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xbf508000  ! 733: RDPR_TSTATE	rdpr	%tstate, %r31
	mov	1, %r12
	.word 0xa1930000  ! 734: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa356132  ! 737: STH_I	sth	%r29, [%r21 + 0x0132]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 16)
	.word 0xbf480000  ! 742: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 22)
	.word 0xb1508000  ! 745: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf53d4000  ! 749: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf43d202f  ! 750: STD_I	std	%r26, [%r20 + 0x002f]
	.word 0xf53c8000  ! 755: STDF_R	std	%f26, [%r0, %r18]
	.word 0xfe74a1f6  ! 758: STX_I	stx	%r31, [%r18 + 0x01f6]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb3500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0xbc85c000  ! 762: ADDcc_R	addcc 	%r23, %r0, %r30
	.word 0xf23d605f  ! 764: STD_I	std	%r25, [%r21 + 0x005f]
	.word 0xf43ce124  ! 766: STD_I	std	%r26, [%r19 + 0x0124]
	.word 0x8d94a0d3  ! 769: WRPR_PSTATE_I	wrpr	%r18, 0x00d3, %pstate
	.word 0xfe754000  ! 772: STX_R	stx	%r31, [%r21 + %r0]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfc75205b  ! 775: STX_I	stx	%r30, [%r20 + 0x005b]
	.word 0xfc758000  ! 776: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf274a0f7  ! 778: STX_I	stx	%r25, [%r18 + 0x00f7]
	.word 0xbb3d6001  ! 779: SRA_I	sra 	%r21, 0x0001, %r29
	.word 0xf23c6062  ! 786: STD_I	std	%r25, [%r17 + 0x0062]
	.word 0xf635605c  ! 789: STH_I	sth	%r27, [%r21 + 0x005c]
	.word 0xf42c216c  ! 790: STB_I	stb	%r26, [%r16 + 0x016c]
	.word 0xf23dc000  ! 795: STD_R	std	%r25, [%r23 + %r0]
	.word 0xfe35a06d  ! 799: STH_I	sth	%r31, [%r22 + 0x006d]
	.word 0xfa748000  ! 800: STX_R	stx	%r29, [%r18 + %r0]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 14)
	.word 0x8995a05d  ! 803: WRPR_TICK_I	wrpr	%r22, 0x005d, %tick
	.word 0xf02d209f  ! 804: STB_I	stb	%r24, [%r20 + 0x009f]
	.word 0xfc354000  ! 808: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf23c4000  ! 810: STD_R	std	%r25, [%r17 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 4)
	.word 0xf6248000  ! 812: STW_R	stw	%r27, [%r18 + %r0]
	.word 0x8995a179  ! 814: WRPR_TICK_I	wrpr	%r22, 0x0179, %tick
	.word 0xf4254000  ! 815: STW_R	stw	%r26, [%r21 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 817: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb1518000  ! 823: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfa34a198  ! 827: STH_I	sth	%r29, [%r18 + 0x0198]
	.word 0xf33dc000  ! 829: STDF_R	std	%f25, [%r0, %r23]
	.word 0x81942028  ! 834: WRPR_TPC_I	wrpr	%r16, 0x0028, %tpc
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 38)
	.word 0xfe35e003  ! 837: STH_I	sth	%r31, [%r23 + 0x0003]
	.word 0xf33d4000  ! 838: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf13dc000  ! 839: STDF_R	std	%f24, [%r0, %r23]
	.word 0xb3520000  ! 840: RDPR_PIL	rdpr	%pil, %r25
	.word 0xbb359000  ! 841: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xfe24c000  ! 845: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xb92c8000  ! 847: SLL_R	sll 	%r18, %r0, %r28
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 3)
	.word 0xfd3d2002  ! 851: STDF_I	std	%f30, [0x0002, %r20]
	.word 0x9195e1af  ! 854: WRPR_PIL_I	wrpr	%r23, 0x01af, %pil
	.word 0xf62cc000  ! 855: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfe75e1af  ! 857: STX_I	stx	%r31, [%r23 + 0x01af]
	.word 0xf234216e  ! 858: STH_I	sth	%r25, [%r16 + 0x016e]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 1e)
	.word 0x91946037  ! 862: WRPR_PIL_I	wrpr	%r17, 0x0037, %pil
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, f)
	.word 0xb7480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf235a146  ! 868: STH_I	sth	%r25, [%r22 + 0x0146]
	.word 0xf024c000  ! 869: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xfc3ca1d4  ! 870: STD_I	std	%r30, [%r18 + 0x01d4]
	.word 0xf4254000  ! 872: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfc754000  ! 875: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfe240000  ! 888: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xbc1ce18c  ! 891: XOR_I	xor 	%r19, 0x018c, %r30
	.word 0xb2348000  ! 893: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xfc3c4000  ! 894: STD_R	std	%r30, [%r17 + %r0]
	.word 0xf73d4000  ! 895: STDF_R	std	%f27, [%r0, %r21]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf13dc000  ! 900: STDF_R	std	%f24, [%r0, %r23]
	.word 0xfb3dc000  ! 904: STDF_R	std	%f29, [%r0, %r23]
	.word 0xbd480000  ! 905: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x1baeafd00000e9c4, %g1, %r10
	.word 0x819a8000  ! 906: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf82da00c  ! 907: STB_I	stb	%r28, [%r22 + 0x000c]
	mov	1, %r12
	.word 0xa1930000  ! 910: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb550c000  ! 911: RDPR_TT	rdpr	%tt, %r26
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 23)
	.word 0xb435a1ea  ! 918: ORN_I	orn 	%r22, 0x01ea, %r26
	.word 0xb73d4000  ! 920: SRA_R	sra 	%r21, %r0, %r27
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 27)
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 21)
	.word 0xb17c0400  ! 928: MOVR_R	movre	%r16, %r0, %r24
	.word 0x8195e0a4  ! 930: WRPR_TPC_I	wrpr	%r23, 0x00a4, %tpc
	.word 0xf83d8000  ! 932: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf0358000  ! 936: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf62de153  ! 937: STB_I	stb	%r27, [%r23 + 0x0153]
	.word 0xb13c8000  ! 939: SRA_R	sra 	%r18, %r0, %r24
	.word 0xf13cc000  ! 941: STDF_R	std	%f24, [%r0, %r19]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 2f)
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 3e)
	setx	0x4069ee7600005d94, %g1, %r10
	.word 0x819a8000  ! 951: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf6742029  ! 954: STX_I	stx	%r27, [%r16 + 0x0029]
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 8)
	.word 0x9195e040  ! 958: WRPR_PIL_I	wrpr	%r23, 0x0040, %pil
	.word 0xfa754000  ! 959: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf024c000  ! 966: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb4054000  ! 969: ADD_R	add 	%r21, %r0, %r26
	.word 0xbb643801  ! 974: MOVcc_I	<illegal instruction>
	.word 0xf93d2186  ! 976: STDF_I	std	%f28, [0x0186, %r20]
	.word 0xb2340000  ! 981: ORN_R	orn 	%r16, %r0, %r25
	.word 0xb72d5000  ! 983: SLLX_R	sllx	%r21, %r0, %r27
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 20)
	.word 0xfd3de020  ! 987: STDF_I	std	%f30, [0x0020, %r23]
	mov	0, %r12
	.word 0xa1930000  ! 988: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	1, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 20)
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
	.word 0xbc44e0f4  ! 2: ADDC_I	addc 	%r19, 0x00f4, %r30
	.word 0xb935e001  ! 3: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0xf65c6057  ! 7: LDX_I	ldx	[%r17 + 0x0057], %r27
	.word 0xf814a152  ! 12: LDUH_I	lduh	[%r18 + 0x0152], %r28
	.word 0xf61d4000  ! 15: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xfa5de03c  ! 18: LDX_I	ldx	[%r23 + 0x003c], %r29
	.word 0xfc4d8000  ! 23: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xf845e0e4  ! 25: LDSW_I	ldsw	[%r23 + 0x00e4], %r28
	.word 0xfe1ca10b  ! 29: LDD_I	ldd	[%r18 + 0x010b], %r31
	.word 0xbb520000  ! 33: RDPR_PIL	<illegal instruction>
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfc1d8000  ! 37: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xfe04c000  ! 38: LDUW_R	lduw	[%r19 + %r0], %r31
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 15)
	.word 0xfc4dc000  ! 40: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xbf51c000  ! 42: RDPR_TL	<illegal instruction>
	.word 0xfe0cc000  ! 44: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf6142141  ! 45: LDUH_I	lduh	[%r16 + 0x0141], %r27
	.word 0x819521f0  ! 50: WRPR_TPC_I	wrpr	%r20, 0x01f0, %tpc
	.word 0xfe14e0d1  ! 54: LDUH_I	lduh	[%r19 + 0x00d1], %r31
	.word 0x8d95e0d7  ! 60: WRPR_PSTATE_I	wrpr	%r23, 0x00d7, %pstate
	.word 0x8594609b  ! 61: WRPR_TSTATE_I	wrpr	%r17, 0x009b, %tstate
	.word 0xb6446049  ! 68: ADDC_I	addc 	%r17, 0x0049, %r27
	.word 0xf84de09f  ! 69: LDSB_I	ldsb	[%r23 + 0x009f], %r28
	.word 0xf4150000  ! 72: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xf4044000  ! 75: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0x8395e10f  ! 77: WRPR_TNPC_I	wrpr	%r23, 0x010f, %tnpc
	setx	data_start_5, %g1, %r19
	.word 0xf21ca0cc  ! 82: LDD_I	ldd	[%r18 + 0x00cc], %r25
	.word 0xf91d8000  ! 87: LDDF_R	ldd	[%r22, %r0], %f28
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 33)
	.word 0xf65ca182  ! 93: LDX_I	ldx	[%r18 + 0x0182], %r27
	.word 0x8394a106  ! 94: WRPR_TNPC_I	wrpr	%r18, 0x0106, %tnpc
	.word 0xb7500000  ! 96: RDPR_TPC	<illegal instruction>
	.word 0xfe054000  ! 97: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xbb2ca001  ! 101: SLL_I	sll 	%r18, 0x0001, %r29
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 14)
	.word 0xb550c000  ! 106: RDPR_TT	<illegal instruction>
	.word 0xfe540000  ! 113: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0x8795601c  ! 114: WRPR_TT_I	wrpr	%r21, 0x001c, %tt
	.word 0xbd2d8000  ! 117: SLL_R	sll 	%r22, %r0, %r30
	.word 0xf8148000  ! 121: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xbb51c000  ! 125: RDPR_TL	<illegal instruction>
	.word 0xf91dc000  ! 126: LDDF_R	ldd	[%r23, %r0], %f28
	mov	0, %r12
	.word 0xa1930000  ! 127: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_3, %g1, %r21
	.word 0xb5508000  ! 135: RDPR_TSTATE	<illegal instruction>
	.word 0xb534f001  ! 139: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xf91ca12b  ! 141: LDDF_I	ldd	[%r18, 0x012b], %f28
	.word 0xf20da06c  ! 145: LDUB_I	ldub	[%r22 + 0x006c], %r25
	.word 0xf84420c9  ! 147: LDSW_I	ldsw	[%r16 + 0x00c9], %r28
	.word 0xf6140000  ! 150: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xb951c000  ! 151: RDPR_TL	<illegal instruction>
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 3)
	.word 0x8d95e0d9  ! 153: WRPR_PSTATE_I	wrpr	%r23, 0x00d9, %pstate
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 16)
	.word 0xb13c0000  ! 155: SRA_R	sra 	%r16, %r0, %r24
	.word 0xf8140000  ! 161: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xbe1c8000  ! 162: XOR_R	xor 	%r18, %r0, %r31
	.word 0xfe04e144  ! 163: LDUW_I	lduw	[%r19 + 0x0144], %r31
	.word 0xf00421a4  ! 168: LDUW_I	lduw	[%r16 + 0x01a4], %r24
	.word 0xf81d219f  ! 170: LDD_I	ldd	[%r20 + 0x019f], %r28
	.word 0xf005e08e  ! 171: LDUW_I	lduw	[%r23 + 0x008e], %r24
	.word 0xf4540000  ! 180: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xb424a07d  ! 183: SUB_I	sub 	%r18, 0x007d, %r26
	.word 0xf8454000  ! 184: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xb77da401  ! 186: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xf8140000  ! 187: LDUH_R	lduh	[%r16 + %r0], %r28
	setx	data_start_7, %g1, %r17
	.word 0xf6554000  ! 195: LDSH_R	ldsh	[%r21 + %r0], %r27
	setx	data_start_4, %g1, %r17
	.word 0xb5540000  ! 202: RDPR_GL	<illegal instruction>
	.word 0xfc4d21ce  ! 208: LDSB_I	ldsb	[%r20 + 0x01ce], %r30
	.word 0xfe4cc000  ! 209: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf844a087  ! 211: LDSW_I	ldsw	[%r18 + 0x0087], %r28
	.word 0xf455e12b  ! 214: LDSH_I	ldsh	[%r23 + 0x012b], %r26
	.word 0xfe55a1df  ! 217: LDSH_I	ldsh	[%r22 + 0x01df], %r31
	.word 0xbe1ca11b  ! 218: XOR_I	xor 	%r18, 0x011b, %r31
	.word 0xbf2c7001  ! 221: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0x8995e1b3  ! 224: WRPR_TICK_I	wrpr	%r23, 0x01b3, %tick
	.word 0xfe450000  ! 227: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0x8395a0d4  ! 230: WRPR_TNPC_I	wrpr	%r22, 0x00d4, %tnpc
	.word 0xfa148000  ! 235: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xb9520000  ! 236: RDPR_PIL	<illegal instruction>
	.word 0xfe1d2045  ! 239: LDD_I	ldd	[%r20 + 0x0045], %r31
	.word 0x81952023  ! 242: WRPR_TPC_I	wrpr	%r20, 0x0023, %tpc
	.word 0xf655a164  ! 245: LDSH_I	ldsh	[%r22 + 0x0164], %r27
	.word 0xfe040000  ! 246: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xf044e013  ! 249: LDSW_I	ldsw	[%r19 + 0x0013], %r24
	setx	data_start_1, %g1, %r17
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 8)
	.word 0xb3504000  ! 259: RDPR_TNPC	<illegal instruction>
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 36)
	.word 0x91956018  ! 261: WRPR_PIL_I	wrpr	%r21, 0x0018, %pil
	.word 0x8995e0fc  ! 263: WRPR_TICK_I	wrpr	%r23, 0x00fc, %tick
	.word 0x8995605d  ! 269: WRPR_TICK_I	wrpr	%r21, 0x005d, %tick
	mov	0, %r12
	.word 0x8f930000  ! 275: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6456135  ! 278: LDSW_I	ldsw	[%r21 + 0x0135], %r27
	.word 0xfc450000  ! 279: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfa04e0bb  ! 285: LDUW_I	lduw	[%r19 + 0x00bb], %r29
	mov	2, %r12
	.word 0xa1930000  ! 289: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa1d4000  ! 295: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xb9356001  ! 297: SRL_I	srl 	%r21, 0x0001, %r28
	.word 0xfc05c000  ! 298: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf4540000  ! 300: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xb92c5000  ! 301: SLLX_R	sllx	%r17, %r0, %r28
	.word 0x8395a191  ! 303: WRPR_TNPC_I	wrpr	%r22, 0x0191, %tnpc
	.word 0xfa5d4000  ! 305: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf64d6037  ! 307: LDSB_I	ldsb	[%r21 + 0x0037], %r27
	.word 0xf004601f  ! 308: LDUW_I	lduw	[%r17 + 0x001f], %r24
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 23)
	.word 0xba15206d  ! 310: OR_I	or 	%r20, 0x006d, %r29
	setx	0x38fad39b00000aca, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf245618a  ! 313: LDSW_I	ldsw	[%r21 + 0x018a], %r25
	.word 0xf605c000  ! 320: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xbb51c000  ! 324: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r22
	.word 0xb80c6047  ! 327: AND_I	and 	%r17, 0x0047, %r28
	.word 0x8594e142  ! 328: WRPR_TSTATE_I	wrpr	%r19, 0x0142, %tstate
	.word 0xf60ca182  ! 329: LDUB_I	ldub	[%r18 + 0x0182], %r27
	.word 0xf51c8000  ! 331: LDDF_R	ldd	[%r18, %r0], %f26
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 1e)
	setx	0x9560f2c10000485f, %g1, %r10
	.word 0x839a8000  ! 335: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf0148000  ! 336: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf84da188  ! 340: LDSB_I	ldsb	[%r22 + 0x0188], %r28
	.word 0xfd1d60e7  ! 343: LDDF_I	ldd	[%r21, 0x00e7], %f30
	.word 0xfa5c8000  ! 346: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf01420ab  ! 347: LDUH_I	lduh	[%r16 + 0x00ab], %r24
	.word 0xfa050000  ! 353: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf4140000  ! 357: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xf71c8000  ! 359: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xfc54e15d  ! 361: LDSH_I	ldsh	[%r19 + 0x015d], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0xc5fad89000003d81, %g1, %r10
	.word 0x819a8000  ! 366: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 30)
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf80ce1b2  ! 371: LDUB_I	ldub	[%r19 + 0x01b2], %r28
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf8548000  ! 373: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xff1c8000  ! 374: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xfc4d6051  ! 375: LDSB_I	ldsb	[%r21 + 0x0051], %r30
	setx	data_start_1, %g1, %r18
	.word 0xb6bcc000  ! 380: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xf015211c  ! 381: LDUH_I	lduh	[%r20 + 0x011c], %r24
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45dc000  ! 391: LDX_R	ldx	[%r23 + %r0], %r26
	setx	data_start_5, %g1, %r21
	.word 0xbf7ca401  ! 394: MOVR_I	movre	%r18, 0x1, %r31
	.word 0xfe040000  ! 396: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0x839421c3  ! 397: WRPR_TNPC_I	wrpr	%r16, 0x01c3, %tnpc
	.word 0xf21d6012  ! 400: LDD_I	ldd	[%r21 + 0x0012], %r25
	.word 0xb1508000  ! 402: RDPR_TSTATE	<illegal instruction>
	.word 0xfa158000  ! 405: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf2040000  ! 407: LDUW_R	lduw	[%r16 + %r0], %r25
	setx	0x892ecb480000df04, %g1, %r10
	.word 0x819a8000  ! 408: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa45e140  ! 414: LDSW_I	ldsw	[%r23 + 0x0140], %r29
	.word 0xf6548000  ! 415: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xfe1561dd  ! 419: LDUH_I	lduh	[%r21 + 0x01dd], %r31
	.word 0xb29ce07e  ! 420: XORcc_I	xorcc 	%r19, 0x007e, %r25
	.word 0x87946093  ! 427: WRPR_TT_I	wrpr	%r17, 0x0093, %tt
	.word 0xf4040000  ! 428: LDUW_R	lduw	[%r16 + %r0], %r26
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 31)
	.word 0xfa5d4000  ! 433: LDX_R	ldx	[%r21 + %r0], %r29
	setx	0x229a0eeb0000fc40, %g1, %r10
	.word 0x819a8000  ! 434: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc4c6023  ! 435: LDSB_I	ldsb	[%r17 + 0x0023], %r30
	.word 0xf31d4000  ! 436: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf60de1a9  ! 438: LDUB_I	ldub	[%r23 + 0x01a9], %r27
	setx	data_start_4, %g1, %r16
	.word 0xf85c0000  ! 445: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xb1518000  ! 447: RDPR_PSTATE	<illegal instruction>
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 24)
	.word 0xf6052021  ! 454: LDUW_I	lduw	[%r20 + 0x0021], %r27
	.word 0x8995a059  ! 456: WRPR_TICK_I	wrpr	%r22, 0x0059, %tick
	.word 0xbb2de001  ! 457: SLL_I	sll 	%r23, 0x0001, %r29
	.word 0xf44c0000  ! 462: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xf0444000  ! 463: LDSW_R	ldsw	[%r17 + %r0], %r24
	setx	0x82a2afc600009b89, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf20c0000  ! 470: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xfc1dc000  ! 477: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf854c000  ! 487: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xb8ac8000  ! 488: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0x8794a13f  ! 489: WRPR_TT_I	wrpr	%r18, 0x013f, %tt
	.word 0x87946072  ! 492: WRPR_TT_I	wrpr	%r17, 0x0072, %tt
	.word 0xf24d8000  ! 494: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0x8994e1f8  ! 495: WRPR_TICK_I	wrpr	%r19, 0x01f8, %tick
	.word 0xf00c602a  ! 500: LDUB_I	ldub	[%r17 + 0x002a], %r24
	.word 0xbd508000  ! 501: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	0x6ec483700000dfd7, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb37d6401  ! 503: MOVR_I	movre	%r21, 0x1, %r25
	.word 0xbf510000  ! 505: RDPR_TICK	<illegal instruction>
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfe452154  ! 509: LDSW_I	ldsw	[%r20 + 0x0154], %r31
	.word 0xfa55c000  ! 512: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf255a15d  ! 513: LDSH_I	ldsh	[%r22 + 0x015d], %r25
	setx	0xf6ccc53100008b58, %g1, %r10
	.word 0x839a8000  ! 514: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe158000  ! 522: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xb1508000  ! 523: RDPR_TSTATE	<illegal instruction>
	.word 0xfe0dc000  ! 524: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xf01dc000  ! 525: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xb5510000  ! 527: RDPR_TICK	<illegal instruction>
	.word 0xfc4dc000  ! 528: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xfa0dc000  ! 529: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xf214a034  ! 531: LDUH_I	lduh	[%r18 + 0x0034], %r25
	.word 0xb551c000  ! 532: RDPR_TL	<illegal instruction>
	.word 0xbd508000  ! 533: RDPR_TSTATE	<illegal instruction>
	.word 0xf05461d9  ! 537: LDSH_I	ldsh	[%r17 + 0x01d9], %r24
	.word 0xfc058000  ! 539: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0x85956047  ! 540: WRPR_TSTATE_I	wrpr	%r21, 0x0047, %tstate
	.word 0xf20560dd  ! 544: LDUW_I	lduw	[%r21 + 0x00dd], %r25
	.word 0xbf540000  ! 552: RDPR_GL	<illegal instruction>
	.word 0xfc4dc000  ! 562: LDSB_R	ldsb	[%r23 + %r0], %r30
	setx	data_start_1, %g1, %r17
	.word 0xbe2da1fd  ! 566: ANDN_I	andn 	%r22, 0x01fd, %r31
	.word 0xfe0d0000  ! 569: LDUB_R	ldub	[%r20 + %r0], %r31
	mov	2, %r12
	.word 0x8f930000  ! 577: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1540000  ! 581: RDPR_GL	<illegal instruction>
	.word 0xf6154000  ! 586: LDUH_R	lduh	[%r21 + %r0], %r27
	setx	data_start_4, %g1, %r21
	.word 0xbb51c000  ! 592: RDPR_TL	<illegal instruction>
	.word 0xb93d2001  ! 594: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xfc5c8000  ! 596: LDX_R	ldx	[%r18 + %r0], %r30
	setx	0xe624c94500006f02, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf51c000  ! 598: RDPR_TL	<illegal instruction>
	.word 0x85946007  ! 600: WRPR_TSTATE_I	wrpr	%r17, 0x0007, %tstate
	.word 0xfa1dc000  ! 601: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf214e0ac  ! 602: LDUH_I	lduh	[%r19 + 0x00ac], %r25
	.word 0xbe340000  ! 606: SUBC_R	orn 	%r16, %r0, %r31
	.word 0xfe1de007  ! 608: LDD_I	ldd	[%r23 + 0x0007], %r31
	.word 0xf45c8000  ! 618: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xff1ce149  ! 620: LDDF_I	ldd	[%r19, 0x0149], %f31
	.word 0xf80de172  ! 621: LDUB_I	ldub	[%r23 + 0x0172], %r28
	mov	2, %r12
	.word 0xa1930000  ! 623: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf04d8000  ! 624: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf6448000  ! 625: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xb4a4a00d  ! 626: SUBcc_I	subcc 	%r18, 0x000d, %r26
	.word 0x8595a068  ! 628: WRPR_TSTATE_I	wrpr	%r22, 0x0068, %tstate
	.word 0x83952102  ! 632: WRPR_TNPC_I	wrpr	%r20, 0x0102, %tnpc
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf45ca0ff  ! 635: LDX_I	ldx	[%r18 + 0x00ff], %r26
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfc1c20ad  ! 639: LDD_I	ldd	[%r16 + 0x00ad], %r30
	.word 0xfa0d4000  ! 642: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xfc54a011  ! 645: LDSH_I	ldsh	[%r18 + 0x0011], %r30
	.word 0xfe4c20d8  ! 647: LDSB_I	ldsb	[%r16 + 0x00d8], %r31
	.word 0xfa45a1e0  ! 649: LDSW_I	ldsw	[%r22 + 0x01e0], %r29
	.word 0xfe4c613f  ! 650: LDSB_I	ldsb	[%r17 + 0x013f], %r31
	.word 0xf4050000  ! 651: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xbb35d000  ! 653: SRLX_R	srlx	%r23, %r0, %r29
	.word 0xfd1ca0b8  ! 654: LDDF_I	ldd	[%r18, 0x00b8], %f30
	.word 0xf85cc000  ! 655: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xb9508000  ! 656: RDPR_TSTATE	<illegal instruction>
	.word 0xfc4dc000  ! 657: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0x9195a09c  ! 659: WRPR_PIL_I	wrpr	%r22, 0x009c, %pil
	.word 0xf40d0000  ! 660: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb5518000  ! 661: RDPR_PSTATE	<illegal instruction>
	.word 0xfe1d20f2  ! 662: LDD_I	ldd	[%r20 + 0x00f2], %r31
	.word 0x89942119  ! 672: WRPR_TICK_I	wrpr	%r16, 0x0119, %tick
	setx	data_start_0, %g1, %r19
	.word 0xb5508000  ! 676: RDPR_TSTATE	<illegal instruction>
	.word 0xb3540000  ! 677: RDPR_GL	<illegal instruction>
	.word 0xf804c000  ! 678: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xfe1461bc  ! 679: LDUH_I	lduh	[%r17 + 0x01bc], %r31
	.word 0xfe1c4000  ! 681: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xf80c8000  ! 682: LDUB_R	ldub	[%r18 + %r0], %r28
	setx	data_start_6, %g1, %r16
	.word 0xb5480000  ! 684: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf40c8000  ! 685: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xfa4ce03f  ! 688: LDSB_I	ldsb	[%r19 + 0x003f], %r29
	.word 0xb9500000  ! 690: RDPR_TPC	<illegal instruction>
	.word 0xf51da018  ! 693: LDDF_I	ldd	[%r22, 0x0018], %f26
	.word 0xf45dc000  ! 694: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf01d20a0  ! 695: LDD_I	ldd	[%r20 + 0x00a0], %r24
	.word 0xf40d0000  ! 702: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xf41521a2  ! 704: LDUH_I	lduh	[%r20 + 0x01a2], %r26
	.word 0x8594e04c  ! 707: WRPR_TSTATE_I	wrpr	%r19, 0x004c, %tstate
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe45e1f1  ! 709: LDSW_I	ldsw	[%r23 + 0x01f1], %r31
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 21)
	setx	0x35101c0600002d1c, %g1, %r10
	.word 0x839a8000  ! 713: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb12c1000  ! 715: SLLX_R	sllx	%r16, %r0, %r24
	.word 0xba8560d7  ! 719: ADDcc_I	addcc 	%r21, 0x00d7, %r29
	.word 0xbe2dc000  ! 721: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xf0146042  ! 724: LDUH_I	lduh	[%r17 + 0x0042], %r24
	.word 0xf6544000  ! 725: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xb5518000  ! 726: RDPR_PSTATE	<illegal instruction>
	.word 0xf64c8000  ! 727: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0x9195a00d  ! 731: WRPR_PIL_I	wrpr	%r22, 0x000d, %pil
	.word 0xbd508000  ! 733: RDPR_TSTATE	rdpr	%tstate, %r30
	mov	0, %r12
	.word 0xa1930000  ! 734: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf71d8000  ! 736: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xf4040000  ! 738: LDUW_R	lduw	[%r16 + %r0], %r26
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 13)
	.word 0xbb480000  ! 742: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 17)
	.word 0xb9508000  ! 745: RDPR_TSTATE	<illegal instruction>
	.word 0xfb1c0000  ! 747: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xf64d4000  ! 752: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf60ce1ec  ! 753: LDUB_I	ldub	[%r19 + 0x01ec], %r27
	.word 0xf6448000  ! 754: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf655e09e  ! 757: LDSH_I	ldsh	[%r23 + 0x009e], %r27
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 10)
	.word 0xb5500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0xbe844000  ! 762: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xf805e070  ! 765: LDUW_I	lduw	[%r23 + 0x0070], %r28
	.word 0xf60560ed  ! 767: LDUW_I	lduw	[%r21 + 0x00ed], %r27
	.word 0xf01cc000  ! 768: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0x8d95e0ad  ! 769: WRPR_PSTATE_I	wrpr	%r23, 0x00ad, %pstate
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa14a04a  ! 774: LDUH_I	lduh	[%r18 + 0x004a], %r29
	.word 0xb13ce001  ! 779: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xf41d20a7  ! 787: LDD_I	ldd	[%r20 + 0x00a7], %r26
	.word 0xf84c0000  ! 792: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xf84c8000  ! 793: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xf61c8000  ! 798: LDD_R	ldd	[%r18 + %r0], %r27
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 21)
	.word 0x89942027  ! 803: WRPR_TICK_I	wrpr	%r16, 0x0027, %tick
	.word 0xfc15c000  ! 806: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xf615c000  ! 809: LDUH_R	lduh	[%r23 + %r0], %r27
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf45da0b3  ! 813: LDX_I	ldx	[%r22 + 0x00b3], %r26
	.word 0x899420f5  ! 814: WRPR_TICK_I	wrpr	%r16, 0x00f5, %tick
	mov	2, %r12
	.word 0x8f930000  ! 817: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc048000  ! 818: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xf2058000  ! 820: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfa044000  ! 821: LDUW_R	lduw	[%r17 + %r0], %r29
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbb518000  ! 823: RDPR_PSTATE	<illegal instruction>
	.word 0xf71c4000  ! 831: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0x8194e0e3  ! 834: WRPR_TPC_I	wrpr	%r19, 0x00e3, %tpc
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 12)
	.word 0xb9520000  ! 840: RDPR_PIL	<illegal instruction>
	.word 0xb1355000  ! 841: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xb12c8000  ! 847: SLL_R	sll 	%r18, %r0, %r24
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, e)
	.word 0x9195e1bd  ! 854: WRPR_PIL_I	wrpr	%r23, 0x01bd, %pil
	.word 0xfa4c4000  ! 856: LDSB_R	ldsb	[%r17 + %r0], %r29
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1f)
	.word 0x9194e1d2  ! 862: WRPR_PIL_I	wrpr	%r19, 0x01d2, %pil
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 18)
	.word 0xb1480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf254a074  ! 865: LDSH_I	ldsh	[%r18 + 0x0074], %r25
	.word 0xfe05a01f  ! 866: LDUW_I	lduw	[%r22 + 0x001f], %r31
	.word 0xf41c60be  ! 874: LDD_I	ldd	[%r17 + 0x00be], %r26
	.word 0xf80ca0ce  ! 880: LDUB_I	ldub	[%r18 + 0x00ce], %r28
	.word 0xf00dc000  ! 883: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xf05d0000  ! 886: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xb61ca143  ! 891: XOR_I	xor 	%r18, 0x0143, %r27
	.word 0xf844c000  ! 892: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xba340000  ! 893: SUBC_R	orn 	%r16, %r0, %r29
	.word 0xfc142144  ! 896: LDUH_I	lduh	[%r16 + 0x0144], %r30
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 19)
	.word 0xbf480000  ! 905: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0xb38ee1120000d9c8, %g1, %r10
	.word 0x819a8000  ! 906: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf24c8000  ! 908: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xfa5d4000  ! 909: LDX_R	ldx	[%r21 + %r0], %r29
	mov	1, %r12
	.word 0xa1930000  ! 910: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd50c000  ! 911: RDPR_TT	<illegal instruction>
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 18)
	.word 0xb634e111  ! 918: ORN_I	orn 	%r19, 0x0111, %r27
	.word 0xfe5ce1d1  ! 919: LDX_I	ldx	[%r19 + 0x01d1], %r31
	.word 0xbf3d4000  ! 920: SRA_R	sra 	%r21, %r0, %r31
	.word 0xf6440000  ! 923: LDSW_R	ldsw	[%r16 + %r0], %r27
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 14)
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 39)
	.word 0xb57d0400  ! 928: MOVR_R	movre	%r20, %r0, %r26
	.word 0xf04d8000  ! 929: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0x819520d1  ! 930: WRPR_TPC_I	wrpr	%r20, 0x00d1, %tpc
	.word 0xbf3c4000  ! 939: SRA_R	sra 	%r17, %r0, %r31
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, c)
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfe45a08d  ! 949: LDSW_I	ldsw	[%r22 + 0x008d], %r31
	setx	0xba68381200003fc3, %g1, %r10
	.word 0x819a8000  ! 951: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 22)
	.word 0x919560af  ! 958: WRPR_PIL_I	wrpr	%r21, 0x00af, %pil
	.word 0xf8158000  ! 960: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xf81c6139  ! 963: LDD_I	ldd	[%r17 + 0x0139], %r28
	.word 0xfa444000  ! 965: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xfb1da090  ! 968: LDDF_I	ldd	[%r22, 0x0090], %f29
	.word 0xb205c000  ! 969: ADD_R	add 	%r23, %r0, %r25
	.word 0xf81c0000  ! 971: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xbb643801  ! 974: MOVcc_I	<illegal instruction>
	.word 0xfa156090  ! 975: LDUH_I	lduh	[%r21 + 0x0090], %r29
	.word 0xfe1c601d  ! 978: LDD_I	ldd	[%r17 + 0x001d], %r31
	.word 0xb6358000  ! 981: ORN_R	orn 	%r22, %r0, %r27
	.word 0xf00d4000  ! 982: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xbf2d9000  ! 983: SLLX_R	sllx	%r22, %r0, %r31
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 6)
	mov	2, %r12
	.word 0xa1930000  ! 988: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf41ca1c2  ! 989: LDD_I	ldd	[%r18 + 0x01c2], %r26
	.word 0xfe5c2037  ! 990: LDX_I	ldx	[%r16 + 0x0037], %r31
	mov	1, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe05a048  ! 995: LDUW_I	lduw	[%r22 + 0x0048], %r31
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, f)
	.word 0xfc448000  ! 997: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xfa558000  ! 998: LDSH_R	ldsh	[%r22 + %r0], %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb645e1b1  ! 2: ADDC_I	addc 	%r23, 0x01b1, %r27
	.word 0xb7346001  ! 3: SRL_I	srl 	%r17, 0x0001, %r27
	.word 0xb3a48960  ! 6: FMULq	dis not found

	.word 0xb3a81c20  ! 8: FMOVRGEZ	dis not found

	.word 0xbfa00040  ! 10: FMOVd	fmovd	%f0, %f62
	.word 0xb5a508e0  ! 13: FSUBq	dis not found

	.word 0xb5520000  ! 33: RDPR_PIL	<illegal instruction>
	.word 0xb9ab8820  ! 34: FMOVPOS	fmovs	%fcc1, %f0, %f28
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 30)
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a54940  ! 41: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb951c000  ! 42: RDPR_TL	<illegal instruction>
	.word 0xbfa509a0  ! 43: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xb7a81820  ! 49: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0x819460cf  ! 50: WRPR_TPC_I	wrpr	%r17, 0x00cf, %tpc
	.word 0xb9a9c820  ! 56: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a4c820  ! 57: FADDs	fadds	%f19, %f0, %f25
	.word 0x8d95a004  ! 60: WRPR_PSTATE_I	wrpr	%r22, 0x0004, %pstate
	.word 0x8595a05f  ! 61: WRPR_TSTATE_I	wrpr	%r22, 0x005f, %tstate
	.word 0xb1a488e0  ! 63: FSUBq	dis not found

	.word 0xb7ab8820  ! 66: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb844e1e8  ! 68: ADDC_I	addc 	%r19, 0x01e8, %r28
	.word 0xb7a80820  ! 74: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0x8394202e  ! 77: WRPR_TNPC_I	wrpr	%r16, 0x002e, %tnpc
	.word 0xbfa80820  ! 79: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	setx	data_start_0, %g1, %r20
	.word 0xb5a5c960  ! 83: FMULq	dis not found

	.word 0xb7a90820  ! 85: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda509a0  ! 89: FDIVs	fdivs	%f20, %f0, %f30
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 25)
	.word 0x83956189  ! 94: WRPR_TNPC_I	wrpr	%r21, 0x0189, %tnpc
	.word 0xb3500000  ! 96: RDPR_TPC	<illegal instruction>
	.word 0xb92ce001  ! 101: SLL_I	sll 	%r19, 0x0001, %r28
	.word 0xbba00040  ! 104: FMOVd	fmovd	%f0, %f60
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 3)
	.word 0xb350c000  ! 106: RDPR_TT	<illegal instruction>
	.word 0xb1a80820  ! 107: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbba81c20  ! 111: FMOVRGEZ	dis not found

	.word 0x87952001  ! 114: WRPR_TT_I	wrpr	%r20, 0x0001, %tt
	.word 0xbf2d8000  ! 117: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb7a50840  ! 120: FADDd	faddd	%f20, %f0, %f58
	.word 0xb1a448a0  ! 123: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbd51c000  ! 125: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 127: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5aa0820  ! 129: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c820  ! 131: FADDs	fadds	%f23, %f0, %f31
	.word 0xbba5c9a0  ! 133: FDIVs	fdivs	%f23, %f0, %f29
	setx	data_start_0, %g1, %r17
	.word 0xb7508000  ! 135: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a50860  ! 138: FADDq	dis not found

	.word 0xbf353001  ! 139: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xb5a58860  ! 140: FADDq	dis not found

	.word 0xb951c000  ! 151: RDPR_TL	<illegal instruction>
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 32)
	.word 0x8d94a164  ! 153: WRPR_PSTATE_I	wrpr	%r18, 0x0164, %pstate
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 1)
	.word 0xbd3d8000  ! 155: SRA_R	sra 	%r22, %r0, %r30
	.word 0xbfa00540  ! 160: FSQRTd	fsqrt	
	.word 0xbe1dc000  ! 162: XOR_R	xor 	%r23, %r0, %r31
	.word 0xb5a84820  ! 165: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa81420  ! 166: FMOVRNZ	dis not found

	.word 0xb3ab8820  ! 174: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a449a0  ! 175: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb3a81420  ! 179: FMOVRNZ	dis not found

	.word 0xba25a0f5  ! 183: SUB_I	sub 	%r22, 0x00f5, %r29
	.word 0xb17c2401  ! 186: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xbda40820  ! 188: FADDs	fadds	%f16, %f0, %f30
	setx	data_start_2, %g1, %r23
	setx	data_start_2, %g1, %r17
	.word 0xb5a00040  ! 199: FMOVd	fmovd	%f0, %f26
	.word 0xbb540000  ! 202: RDPR_GL	<illegal instruction>
	.word 0xb5a00520  ! 205: FSQRTs	fsqrt	
	.word 0xb5a54820  ! 206: FADDs	fadds	%f21, %f0, %f26
	.word 0xb7a5c860  ! 210: FADDq	dis not found

	.word 0xb7a4c8e0  ! 213: FSUBq	dis not found

	.word 0xb3a80820  ! 215: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb3a81820  ! 216: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb41d207f  ! 218: XOR_I	xor 	%r20, 0x007f, %r26
	.word 0xb9a84820  ! 220: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb92d7001  ! 221: SLLX_I	sllx	%r21, 0x0001, %r28
	.word 0xb7a5c9c0  ! 222: FDIVd	fdivd	%f54, %f0, %f58
	.word 0x89946099  ! 224: WRPR_TICK_I	wrpr	%r17, 0x0099, %tick
	.word 0xbda81420  ! 225: FMOVRNZ	dis not found

	.word 0xb7a00560  ! 229: FSQRTq	fsqrt	
	.word 0x8394e1a6  ! 230: WRPR_TNPC_I	wrpr	%r19, 0x01a6, %tnpc
	.word 0xb7a94820  ! 233: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbda40940  ! 234: FMULd	fmuld	%f16, %f0, %f30
	.word 0xbd520000  ! 236: RDPR_PIL	<illegal instruction>
	.word 0xb9ab8820  ! 238: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0x8194a0c4  ! 242: WRPR_TPC_I	wrpr	%r18, 0x00c4, %tpc
	.word 0xb5a549a0  ! 248: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb7a488c0  ! 251: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xbbabc820  ! 253: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	data_start_1, %g1, %r17
	.word 0xbba4c8c0  ! 256: FSUBd	fsubd	%f50, %f0, %f60
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 5)
	.word 0xbb504000  ! 259: RDPR_TNPC	<illegal instruction>
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 32)
	.word 0x9195a078  ! 261: WRPR_PIL_I	wrpr	%r22, 0x0078, %pil
	.word 0xb5a84820  ! 262: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x8995a0fe  ! 263: WRPR_TICK_I	wrpr	%r22, 0x00fe, %tick
	.word 0x8995e0e5  ! 269: WRPR_TICK_I	wrpr	%r23, 0x00e5, %tick
	.word 0xbda40860  ! 270: FADDq	dis not found

	.word 0xbda00520  ! 271: FSQRTs	fsqrt	
	mov	2, %r12
	.word 0x8f930000  ! 275: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a98820  ! 277: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a90820  ! 282: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb9a80820  ! 283: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00560  ! 286: FSQRTq	fsqrt	
	mov	0, %r12
	.word 0xa1930000  ! 289: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a80420  ! 293: FMOVRZ	dis not found

	.word 0xb9a5c920  ! 294: FMULs	fmuls	%f23, %f0, %f28
	.word 0xbd34e001  ! 297: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xbfa44960  ! 299: FMULq	dis not found

	.word 0xbb2d9000  ! 301: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xb7a4c9a0  ! 302: FDIVs	fdivs	%f19, %f0, %f27
	.word 0x8395210e  ! 303: WRPR_TNPC_I	wrpr	%r20, 0x010e, %tnpc
	.word 0xb3a00040  ! 304: FMOVd	fmovd	%f0, %f56
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 28)
	.word 0xbe152093  ! 310: OR_I	or 	%r20, 0x0093, %r31
	.word 0xbda5c9e0  ! 311: FDIVq	dis not found

	setx	0xb67322ee0000d90c, %g1, %r10
	.word 0x839a8000  ! 312: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a409e0  ! 314: FDIVq	dis not found

	.word 0xb9a81820  ! 315: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3a9c820  ! 318: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbfab8820  ! 321: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbf51c000  ! 324: RDPR_TL	<illegal instruction>
	setx	data_start_4, %g1, %r18
	.word 0xb20c6123  ! 327: AND_I	and 	%r17, 0x0123, %r25
	.word 0x859560e9  ! 328: WRPR_TSTATE_I	wrpr	%r21, 0x00e9, %tstate
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 2)
	setx	0xa620c9ff00009a9c, %g1, %r10
	.word 0x839a8000  ! 335: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7aac820  ! 337: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a448a0  ! 338: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb9a81c20  ! 339: FMOVRGEZ	dis not found

	.word 0xbba5c8a0  ! 345: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb1a80420  ! 348: FMOVRZ	dis not found

	.word 0xb1a94820  ! 349: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00520  ! 350: FSQRTs	fsqrt	
	.word 0xb9a88820  ! 360: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbba9c820  ! 362: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a98820  ! 363: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a448a0  ! 364: FSUBs	fsubs	%f17, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1e9704bd0000f90d, %g1, %r10
	.word 0x819a8000  ! 366: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, c)
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3a48860  ! 370: FADDq	dis not found

hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 26)
	.word 0xb9a90820  ! 376: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	data_start_3, %g1, %r19
	.word 0xbabc4000  ! 380: XNORcc_R	xnorcc 	%r17, %r0, %r29
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r19
	.word 0xbb7de401  ! 394: MOVR_I	movre	%r23, 0x1, %r29
	.word 0x8394a0ae  ! 397: WRPR_TNPC_I	wrpr	%r18, 0x00ae, %tnpc
	.word 0xb5508000  ! 402: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a549e0  ! 403: FDIVq	dis not found

	setx	0x74bbe9790000dc5d, %g1, %r10
	.word 0x819a8000  ! 408: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a5c820  ! 409: FADDs	fadds	%f23, %f0, %f24
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 29)
	.word 0xba9d601d  ! 420: XORcc_I	xorcc 	%r21, 0x001d, %r29
	.word 0xbfab8820  ! 422: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0x8794a1bc  ! 427: WRPR_TT_I	wrpr	%r18, 0x01bc, %tt
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9ab8820  ! 432: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	0xc85513c00009f0d, %g1, %r10
	.word 0x819a8000  ! 434: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a80820  ! 440: FMOVN	fmovs	%fcc1, %f0, %f27
	setx	data_start_4, %g1, %r16
	.word 0xbba00560  ! 443: FSQRTq	fsqrt	
	.word 0xb3518000  ! 447: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a50860  ! 450: FADDq	dis not found

	.word 0xb5a84820  ! 452: FMOVE	fmovs	%fcc1, %f0, %f26
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 28)
	.word 0x8994a11a  ! 456: WRPR_TICK_I	wrpr	%r18, 0x011a, %tick
	.word 0xbf2d6001  ! 457: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xbba80820  ! 460: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb5aa0820  ! 465: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbba50920  ! 467: FMULs	fmuls	%f20, %f0, %f29
	setx	0x7ca7afd500005e5f, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a40860  ! 469: FADDq	dis not found

	.word 0xbbaa0820  ! 480: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbcadc000  ! 488: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0x87952137  ! 489: WRPR_TT_I	wrpr	%r20, 0x0137, %tt
	.word 0xbba50920  ! 490: FMULs	fmuls	%f20, %f0, %f29
	.word 0x879461d9  ! 492: WRPR_TT_I	wrpr	%r17, 0x01d9, %tt
	.word 0x89956123  ! 495: WRPR_TICK_I	wrpr	%r21, 0x0123, %tick
	.word 0xb5a508a0  ! 496: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xb9a9c820  ! 497: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a81c20  ! 498: FMOVRGEZ	dis not found

	.word 0xb1508000  ! 501: RDPR_TSTATE	<illegal instruction>
	setx	0xc5e2ff000000a9d6, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb17d6401  ! 503: MOVR_I	movre	%r21, 0x1, %r24
	.word 0xb1510000  ! 505: RDPR_TICK	<illegal instruction>
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 17)
	.word 0xbba44960  ! 508: FMULq	dis not found

	.word 0xbfa00560  ! 511: FSQRTq	fsqrt	
	setx	0xf686591c0000da08, %g1, %r10
	.word 0x839a8000  ! 514: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a58820  ! 517: FADDs	fadds	%f22, %f0, %f26
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1508000  ! 523: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a549a0  ! 526: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xb3510000  ! 527: RDPR_TICK	<illegal instruction>
	.word 0xb951c000  ! 532: RDPR_TL	<illegal instruction>
	.word 0xbb508000  ! 533: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a54820  ! 535: FADDs	fadds	%f21, %f0, %f25
	.word 0xbba80420  ! 536: FMOVRZ	dis not found

	.word 0x85956014  ! 540: WRPR_TSTATE_I	wrpr	%r21, 0x0014, %tstate
	.word 0xbba00020  ! 545: FMOVs	fmovs	%f0, %f29
	.word 0xb1a48920  ! 547: FMULs	fmuls	%f18, %f0, %f24
	.word 0xbd540000  ! 552: RDPR_GL	<illegal instruction>
	.word 0xbba00540  ! 554: FSQRTd	fsqrt	
	.word 0xbfa00540  ! 555: FSQRTd	fsqrt	
	setx	data_start_3, %g1, %r22
	.word 0xb82d2074  ! 566: ANDN_I	andn 	%r20, 0x0074, %r28
	.word 0xb3a80820  ! 567: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a40840  ! 568: FADDd	faddd	%f16, %f0, %f24
	.word 0xb1a508c0  ! 575: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xbba549a0  ! 576: FDIVs	fdivs	%f21, %f0, %f29
	mov	1, %r12
	.word 0x8f930000  ! 577: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a4c860  ! 580: FADDq	dis not found

	.word 0xb9540000  ! 581: RDPR_GL	<illegal instruction>
	.word 0xb3a80420  ! 585: FMOVRZ	dis not found

	setx	data_start_6, %g1, %r19
	.word 0xbf51c000  ! 592: RDPR_TL	<illegal instruction>
	.word 0xb9a9c820  ! 593: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb33c2001  ! 594: SRA_I	sra 	%r16, 0x0001, %r25
	setx	0x33f2e0d000002d5b, %g1, %r10
	.word 0x819a8000  ! 597: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb751c000  ! 598: RDPR_TL	<illegal instruction>
	.word 0xbfaa8820  ! 599: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x85946144  ! 600: WRPR_TSTATE_I	wrpr	%r17, 0x0144, %tstate
	.word 0xbdab8820  ! 603: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb3aa4820  ! 605: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbc354000  ! 606: SUBC_R	orn 	%r21, %r0, %r30
	.word 0xbba5c8a0  ! 612: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb7aa0820  ! 613: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba94820  ! 617: FMOVCS	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0xa1930000  ! 623: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb2a5a0b4  ! 626: SUBcc_I	subcc 	%r22, 0x00b4, %r25
	.word 0xb5a00540  ! 627: FSQRTd	fsqrt	
	.word 0x8594a057  ! 628: WRPR_TSTATE_I	wrpr	%r18, 0x0057, %tstate
	.word 0xbfa81820  ! 629: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0x83942057  ! 632: WRPR_TNPC_I	wrpr	%r16, 0x0057, %tnpc
	.word 0xb5a50920  ! 633: FMULs	fmuls	%f20, %f0, %f26
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 1b)
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1a80420  ! 646: FMOVRZ	dis not found

	.word 0xbfa5c8e0  ! 652: FSUBq	dis not found

	.word 0xb5341000  ! 653: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xbf508000  ! 656: RDPR_TSTATE	<illegal instruction>
	.word 0x91952028  ! 659: WRPR_PIL_I	wrpr	%r20, 0x0028, %pil
	.word 0xb5518000  ! 661: RDPR_PSTATE	<illegal instruction>
	.word 0xbba00560  ! 664: FSQRTq	fsqrt	
	.word 0xb7a81c20  ! 665: FMOVRGEZ	dis not found

	.word 0xbda81820  ! 669: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x8995a077  ! 672: WRPR_TICK_I	wrpr	%r22, 0x0077, %tick
	.word 0xbda448e0  ! 674: FSUBq	dis not found

	setx	data_start_6, %g1, %r17
	.word 0xb9508000  ! 676: RDPR_TSTATE	<illegal instruction>
	.word 0xb9540000  ! 677: RDPR_GL	<illegal instruction>
	setx	data_start_2, %g1, %r23
	.word 0xbb480000  ! 684: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7a80420  ! 686: FMOVRZ	dis not found

	.word 0xb1a8c820  ! 689: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb5500000  ! 690: RDPR_TPC	<illegal instruction>
	.word 0xb7a48960  ! 699: FMULq	dis not found

	.word 0xbda9c820  ! 701: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00520  ! 706: FSQRTs	fsqrt	
	.word 0x8594e1f5  ! 707: WRPR_TSTATE_I	wrpr	%r19, 0x01f5, %tstate
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3a4c8a0  ! 711: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbbaa4820  ! 712: FMOVNE	fmovs	%fcc1, %f0, %f29
	setx	0x9e1ade990000bb9d, %g1, %r10
	.word 0x839a8000  ! 713: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a81c20  ! 714: FMOVRGEZ	dis not found

	.word 0xb32dd000  ! 715: SLLX_R	sllx	%r23, %r0, %r25
	.word 0xb3a508a0  ! 718: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xbc856138  ! 719: ADDcc_I	addcc 	%r21, 0x0138, %r30
	.word 0xbc2c8000  ! 721: ANDN_R	andn 	%r18, %r0, %r30
	.word 0xb1518000  ! 726: RDPR_PSTATE	<illegal instruction>
	.word 0xbba44960  ! 728: FMULq	dis not found

	.word 0x9194e0c5  ! 731: WRPR_PIL_I	wrpr	%r19, 0x00c5, %pil
	.word 0xbf508000  ! 733: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 734: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9aa8820  ! 735: FMOVG	fmovs	%fcc1, %f0, %f28
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, f)
	.word 0xb7a80c20  ! 740: FMOVRLZ	dis not found

	.word 0xb5a80820  ! 741: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1480000  ! 742: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbf508000  ! 745: RDPR_TSTATE	<illegal instruction>
	.word 0xbdaac820  ! 746: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbdaa4820  ! 751: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a5c960  ! 756: FMULq	dis not found

hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbd500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0xb8840000  ! 762: ADDcc_R	addcc 	%r16, %r0, %r28
	.word 0x8d9521bc  ! 769: WRPR_PSTATE_I	wrpr	%r20, 0x01bc, %pstate
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfa00040  ! 777: FMOVd	fmovd	%f0, %f62
	.word 0xbd3d2001  ! 779: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xbda80820  ! 783: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb3a98820  ! 785: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00520  ! 788: FSQRTs	fsqrt	
	.word 0xb3a4c940  ! 791: FMULd	fmuld	%f50, %f0, %f56
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbda508a0  ! 802: FSUBs	fsubs	%f20, %f0, %f30
	.word 0x8994a054  ! 803: WRPR_TICK_I	wrpr	%r18, 0x0054, %tick
	.word 0xb3a80420  ! 805: FMOVRZ	dis not found

hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 5)
	.word 0x8995a1f8  ! 814: WRPR_TICK_I	wrpr	%r22, 0x01f8, %tick
	mov	2, %r12
	.word 0x8f930000  ! 817: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5aa0820  ! 819: FMOVA	fmovs	%fcc1, %f0, %f26
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, f)
	.word 0xb5518000  ! 823: RDPR_PSTATE	<illegal instruction>
	.word 0xbba50960  ! 824: FMULq	dis not found

	.word 0xb3a5c9a0  ! 825: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xbfa81420  ! 826: FMOVRNZ	dis not found

	.word 0xb9a84820  ! 828: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80c20  ! 830: FMOVRLZ	dis not found

	.word 0x8194611d  ! 834: WRPR_TPC_I	wrpr	%r17, 0x011d, %tpc
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7520000  ! 840: RDPR_PIL	<illegal instruction>
	.word 0xb1349000  ! 841: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xbdaa8820  ! 843: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb7ab0820  ! 844: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb1a44940  ! 846: FMULd	fmuld	%f48, %f0, %f24
	.word 0xbd2d8000  ! 847: SLL_R	sll 	%r22, %r0, %r30
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa90820  ! 849: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a508c0  ! 852: FSUBd	fsubd	%f20, %f0, %f58
	.word 0x9194e067  ! 854: WRPR_PIL_I	wrpr	%r19, 0x0067, %pil
	.word 0xbbaa4820  ! 859: FMOVNE	fmovs	%fcc1, %f0, %f29
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb7a488c0  ! 861: FSUBd	fsubd	%f18, %f0, %f58
	.word 0x9195a17e  ! 862: WRPR_PIL_I	wrpr	%r22, 0x017e, %pil
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb3480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfa4c940  ! 867: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb5a00520  ! 871: FSQRTs	fsqrt	
	.word 0xbfa81820  ! 873: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb5a5c9a0  ! 878: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb3a00540  ! 879: FSQRTd	fsqrt	
	.word 0xbba4c920  ! 887: FMULs	fmuls	%f19, %f0, %f29
	.word 0xb3a8c820  ! 889: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb01ca1b9  ! 891: XOR_I	xor 	%r18, 0x01b9, %r24
	.word 0xbe35c000  ! 893: SUBC_R	orn 	%r23, %r0, %r31
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a80820  ! 898: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb5a90820  ! 902: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a81c20  ! 903: FMOVRGEZ	dis not found

	.word 0xb5480000  ! 905: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0xb4174abc0000c89c, %g1, %r10
	.word 0x819a8000  ! 906: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0xa1930000  ! 910: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb150c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0xb3a4c960  ! 912: FMULq	dis not found

	.word 0xb7a80820  ! 913: FMOVN	fmovs	%fcc1, %f0, %f27
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 32)
	.word 0xbc34e1c0  ! 918: ORN_I	orn 	%r19, 0x01c0, %r30
	.word 0xb33d0000  ! 920: SRA_R	sra 	%r20, %r0, %r25
	.word 0xbfa81820  ! 921: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbba54840  ! 922: FADDd	faddd	%f52, %f0, %f60
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 3d)
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa508e0  ! 926: FSUBq	dis not found

	.word 0xb57c0400  ! 928: MOVR_R	movre	%r16, %r0, %r26
	.word 0x8194a08d  ! 930: WRPR_TPC_I	wrpr	%r18, 0x008d, %tpc
	.word 0xbba5c8c0  ! 931: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb1a548e0  ! 935: FSUBq	dis not found

	.word 0xb93d8000  ! 939: SRA_R	sra 	%r22, %r0, %r28
	.word 0xbba58860  ! 940: FADDq	dis not found

hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, c)
	.word 0xb7a80c20  ! 945: FMOVRLZ	dis not found

	.word 0xb3aa8820  ! 946: FMOVG	fmovs	%fcc1, %f0, %f25
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda489c0  ! 948: FDIVd	fdivd	%f18, %f0, %f30
	setx	0xb83bb3cf0000db5c, %g1, %r10
	.word 0x819a8000  ! 951: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba80420  ! 955: FMOVRZ	dis not found

hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 2c)
	.word 0x91946076  ! 958: WRPR_PIL_I	wrpr	%r17, 0x0076, %pil
	.word 0xb9a54940  ! 961: FMULd	fmuld	%f52, %f0, %f28
	.word 0xb1abc820  ! 962: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xba048000  ! 969: ADD_R	add 	%r18, %r0, %r29
	.word 0xb1a488e0  ! 972: FSUBq	dis not found

	.word 0xbf643801  ! 974: MOVcc_I	<illegal instruction>
	.word 0xb3a8c820  ! 979: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7aac820  ! 980: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb234c000  ! 981: ORN_R	orn 	%r19, %r0, %r25
	.word 0xbb2d5000  ! 983: SLLX_R	sllx	%r21, %r0, %r29
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 1)
	mov	0, %r12
	.word 0xa1930000  ! 988: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	2, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9aa0820  ! 993: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba548c0  ! 994: FSUBd	fsubd	%f52, %f0, %f60
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 33)

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

	.xword	0x62b0dfe079db3611
	.xword	0x1fe94d098e498aca
	.xword	0x17c9350ec9f79751
	.xword	0x0e6ab90ca9e55ce0
	.xword	0x2834f475915896d1
	.xword	0x034dc054482932c9
	.xword	0x6d0862f972625ffe
	.xword	0x3a88b7ed9893216e
	.xword	0xe6febe886a6512e6
	.xword	0x419a9edfd63449d2
	.xword	0x152d83e0828e8a3b
	.xword	0x42ad668eb39a5194
	.xword	0x3290ea02923cb068
	.xword	0x8394d34ceab72853
	.xword	0x16dd2887dba985b9
	.xword	0xbe52c76ad9ddef7d
	.xword	0x3d34f8810690d739
	.xword	0xd86283949c0d30c4
	.xword	0x812b7e04eb7bc9d2
	.xword	0xa5b246633df67209
	.xword	0x1a99328dc53e46b0
	.xword	0x6b1b3bf8fbe85369
	.xword	0x0a2b865abfea9eda
	.xword	0xd230b53db608a939
	.xword	0x65ed0d6eb6b62262
	.xword	0xe202496c4fecf24f
	.xword	0x03939cb10f66ab72
	.xword	0x1f984e1323634236
	.xword	0x88742cd8620e384b
	.xword	0x059774ec74c08b76
	.xword	0xf3e0b533aa6bbd39
	.xword	0x30d8f9a32b5d8855
	.xword	0x0f2ecfcfff5b27a8
	.xword	0xfeaabb741a94786e
	.xword	0x7acbbe5e489f230e
	.xword	0xea23114d61d747b7
	.xword	0x3ec8a379ff3e5db6
	.xword	0x3b282fe86b20e3fe
	.xword	0x07e11106706832eb
	.xword	0x2330963cd7d2bd92
	.xword	0x2b6feeb71dedea76
	.xword	0x75deceddc489b5d5
	.xword	0xdc635bbb65471661
	.xword	0x9af8cf3a85cd9d0c
	.xword	0x1a97b89e45e2f7e7
	.xword	0x2979fdaa29ca3ee5
	.xword	0x408779f41096b525
	.xword	0xe7c925f536545364
	.xword	0xcb91ca33a8b18513
	.xword	0xc6b9b46b6bd03d5d
	.xword	0x3e101fba8b8017cf
	.xword	0x67d045c93eb83814
	.xword	0xa351dd5f79933278
	.xword	0x21fb365ba9d14aa4
	.xword	0xa7a25400a06a09e3
	.xword	0xb192d11028ed309a
	.xword	0x1e59017b8040f642
	.xword	0xaa167610725efd66
	.xword	0x17b7679116be125f
	.xword	0x3ff663e99404da47
	.xword	0xf56fb9ae3ebd9b8a
	.xword	0xd012c43ca7f0a3c0
	.xword	0x195abec869acb4cb
	.xword	0xec1854e7380a20b6
	.xword	0x3d50030c9ae65f9b
	.xword	0x96816dafd499b10b
	.xword	0x50a9f1c2c857b215
	.xword	0x0121a80897c87029
	.xword	0xa6c14dc64d2e1c5e
	.xword	0x5a5dce058c051f07
	.xword	0x2a2a00cb83bb7dc1
	.xword	0x017420d04c354517
	.xword	0x923becc40ddfcfbe
	.xword	0xc935afc8140e21d0
	.xword	0xfdc75aacf8e90402
	.xword	0x327c6999696f31d9
	.xword	0x1f9e0d5133b2f254
	.xword	0x64cadcfe06ff512d
	.xword	0xecba4910bba5c6fa
	.xword	0x8c996703d841050b
	.xword	0xe40cf63bd5fe554c
	.xword	0x1aa8a20a47b02fc4
	.xword	0xa63b70f2ce64b83d
	.xword	0xb3d8e278ad29901d
	.xword	0xc244798a38669040
	.xword	0x73133eb30389a640
	.xword	0xec6acf3f32693c41
	.xword	0xa01a3af23cc57c42
	.xword	0x29a78698647cec6a
	.xword	0xb1b7f4ae833c1335
	.xword	0xbdffdf6975a74149
	.xword	0x8149c5caa3f58a4c
	.xword	0xfe51f486f50098e8
	.xword	0xc4948cbeb961a8ad
	.xword	0x90b69c66ba11f1a8
	.xword	0xfd1b612dfae2866a
	.xword	0x16e8692c1171466c
	.xword	0xf256b4ca7118d1d6
	.xword	0x640a2cd088c8d648
	.xword	0x17309bcbe145ed4b
	.xword	0x2e8086ca61f74301
	.xword	0xeb42fbc0117fcf20
	.xword	0x792711dc80a25d77
	.xword	0x1ac6b25d7aaebb95
	.xword	0x5acb0b7f80f39c68
	.xword	0x90f1bb3482ef0c06
	.xword	0xed67ebb92a5bb28b
	.xword	0xf4aa16e10057e308
	.xword	0xfd782f0885d28e23
	.xword	0x836ba3c0c7128665
	.xword	0x633adac254639f43
	.xword	0x5dd0eb631adc1a64
	.xword	0x629e1b0298cbb3b9
	.xword	0x5fdb03f826032d6b
	.xword	0x355e4b12b9f39253
	.xword	0xb72a12bf8a872454
	.xword	0x33cab4b5f84da5bd
	.xword	0xedb9588a45d928b3
	.xword	0x9585f5f622568be4
	.xword	0x53d9e509536c2b37
	.xword	0x6deaefd62e1482cf
	.xword	0xd4a8869f69b85a6d
	.xword	0x5f74192c16b400ad
	.xword	0xe926335f2e5d537c
	.xword	0x2635a9680ae5c06c
	.xword	0xd5341602fec350be
	.xword	0x9606a4f76d0f8169
	.xword	0xc657a0f81c6a5c76
	.xword	0xbf2393f683d731a9
	.xword	0x85f157155ba7869f
	.xword	0xa7795c0f8eecdd1e
	.xword	0x0e647b3f0ed907b8
	.xword	0x8ad12a52c507a789
	.xword	0x2f34ba7dbb5b1ae4
	.xword	0x7a774666c81541fc
	.xword	0x707b21e18990b7f0
	.xword	0xec80c31b047f8dd1
	.xword	0x903494c6f517347a
	.xword	0x15962c0e192e63bd
	.xword	0x9abcc0cee15c54cf
	.xword	0xf6ef03e747defb89
	.xword	0xb4e98b2c5138b1ad
	.xword	0x2605840f6dd689a2
	.xword	0x5ec6877227d84218
	.xword	0xf88aaa14aa89777f
	.xword	0xb27079c055ad4a89
	.xword	0x426b98aceb76b68f
	.xword	0x956a5918956ec9dd
	.xword	0x1e2e1cf986ee79dd
	.xword	0xd752b68a40b859ed
	.xword	0x1a47e1854376f808
	.xword	0xede05925ff9b5105
	.xword	0x93704370930af479
	.xword	0x5020321c06859992
	.xword	0xc6fbb3d8b2e03e21
	.xword	0xd360115da803420b
	.xword	0x4167c31535580063
	.xword	0xc76ee593af3acf43
	.xword	0xf1021821d6fd4f7a
	.xword	0x3d8f56c213df0f88
	.xword	0x5a69481930d5f1b9
	.xword	0xa43ca0dd4382b162
	.xword	0x63ea6218abb6a49a
	.xword	0x6f6373663a73166c
	.xword	0xe544944cf0f839a6
	.xword	0x71aa9de3a05cdde2
	.xword	0xed7e07ef2151ab5b
	.xword	0xdc3f05e74da05162
	.xword	0x717ba3ef60c21416
	.xword	0xd6bf75e069941553
	.xword	0x9b81d8344a715e94
	.xword	0x75c81bf34317bca4
	.xword	0xca8a14e37dd944cd
	.xword	0xe71b938054dd535c
	.xword	0x1b69f7daee2ad37d
	.xword	0x391a5744cf01cb26
	.xword	0xf2b656feeeaf91ea
	.xword	0xd8a3cda7921c7a69
	.xword	0x7b12fc95a2236042
	.xword	0x67a06c48bcd281a0
	.xword	0x1235afbd71647bef
	.xword	0x4c1c537347fa5674
	.xword	0x8d55cc54adb31afb
	.xword	0xda47b79b905b9e30
	.xword	0xfac29d2eec16e64c
	.xword	0xc15b8a13ecc0cd81
	.xword	0x1bdbbff372da49aa
	.xword	0x3b20f2ae958f4ddd
	.xword	0xa995992f2f3244b5
	.xword	0x816bccc0253db54d
	.xword	0x8613f7d14bfe0944
	.xword	0x50e4fbe93990cb41
	.xword	0x3e850c94fa2e1692
	.xword	0x47d1e0406ee5bd3c
	.xword	0x5dbe5222dc53a0b9
	.xword	0x09b66661c7a2faa4
	.xword	0x13bf7a6e48c7f5cb
	.xword	0xa730d4a8d8ab7ed5
	.xword	0xa0a84d349562b6e0
	.xword	0x9175642d2e955adb
	.xword	0x33f29d2b78d55440
	.xword	0xd4eebce58a2c5d04
	.xword	0x467f8a7af427e0bf
	.xword	0xd893073a999a33a2
	.xword	0x2b9d6bb031d99724
	.xword	0x2a6fcd18a6172278
	.xword	0x5700fa7d0728eb68
	.xword	0xbba7484981d89d7e
	.xword	0x49cbb0111429d1c5
	.xword	0x8b240505ca6ed0a0
	.xword	0x1a4232fff1c8c8b1
	.xword	0x0bf37e3825a5c4a1
	.xword	0xbec8e8df0adc71e3
	.xword	0xf725ee9580f7de77
	.xword	0xbff29faf32261c1a
	.xword	0x902442b2a5a23d9b
	.xword	0x41fb9dd2bd20c0c2
	.xword	0x6ed2e8491f13bed3
	.xword	0x9ac7760d9a458520
	.xword	0x9e10b0dd30fcf5fb
	.xword	0x703d5a3f1ef3202d
	.xword	0x373ec942dde3c295
	.xword	0xa1618da2983b03a7
	.xword	0x1e3ea1076d2d9158
	.xword	0x7b9b573b53e72672
	.xword	0x0d79a8a27f934e7c
	.xword	0x35f3d094fe6d9762
	.xword	0xb4190860f0f4246a
	.xword	0x9d7fa61c71c3ca11
	.xword	0xd676d19afb8656ac
	.xword	0x0f65406a3ea6ed63
	.xword	0x1a0844e502f08970
	.xword	0x5d610f6141f1969c
	.xword	0xe5b05a63219eff2d
	.xword	0xc7cf7645006e3221
	.xword	0x74b7bb91639acf3f
	.xword	0xf4b0116459000162
	.xword	0xfd73a22afe86b14f
	.xword	0x2c9a5eefa20ba507
	.xword	0x4b8ccbd69dee316f
	.xword	0x32a24ac7e97f3813
	.xword	0xbead3c747594beb3
	.xword	0xfc391eb732620529
	.xword	0x793d770be5537b3b
	.xword	0x4308b541205576d0
	.xword	0xe3f956adf5e8fc4d
	.xword	0x01e4059201ad5df8
	.xword	0xa7091783f0d08e0b
	.xword	0xc134fb0c99c37e13
	.xword	0x7870b0433db5eb99
	.xword	0x49edf55a43289bbd
	.xword	0x1374fad02d501909
	.xword	0xe6c55e95d1800aae
	.xword	0xfefa57afefbbb0e4
	.xword	0xe89576f595e6ff7c
	.xword	0x410e5857cc77c236
	.align 0x2000
	.data
data_start_1:

	.xword	0x0b6750ed85faebe1
	.xword	0xfd3f7c3675bae42c
	.xword	0xc6eea84823158bbe
	.xword	0x366c3e244c5a3431
	.xword	0x58e143636d149b19
	.xword	0x51bed5839c1443ad
	.xword	0x665656d1b560a9f7
	.xword	0xe5f640f47012c0d5
	.xword	0xfa0d3f01f855827e
	.xword	0x4936b18a12f325c1
	.xword	0x856d9326b86d73b1
	.xword	0xe1365293cb02a5b3
	.xword	0xa615e0c829ee89dd
	.xword	0xe223edad20ce4bbd
	.xword	0x5d1c3a37ff06b2a5
	.xword	0x009f28721e793216
	.xword	0xb8e859f3c1ac10c4
	.xword	0x36f77b02cb8c5074
	.xword	0xc4dd93bb770d8b2f
	.xword	0xd30f2db8244caaf9
	.xword	0x3e96d642cf9bd8ba
	.xword	0x2ee3e864113cb1fc
	.xword	0xf25bb8338ccdd50e
	.xword	0x406fc0e8b7d11311
	.xword	0x9a3fb8c6fdb9e71e
	.xword	0xb4aac5c52600b614
	.xword	0x23ae5de264c86078
	.xword	0xdbef431ff16dc23d
	.xword	0xf68ee40663e8863e
	.xword	0x8236021b4c577a44
	.xword	0x3a9f1b994d6fca10
	.xword	0x431c36dbcbfbeca2
	.xword	0xf265d75d943301ae
	.xword	0x8c0d1aab067dc243
	.xword	0xffef448f814486d4
	.xword	0xe287f2f4e18c44ef
	.xword	0x7a33a54b0db3f741
	.xword	0x350e32549bc3a0c1
	.xword	0x2597bee063a528f3
	.xword	0x5961a5c478284255
	.xword	0xacf6de8031248360
	.xword	0x19a342f6a77356bb
	.xword	0xb8c2d710a0d06de5
	.xword	0x84502c2904a1ceff
	.xword	0x25eb63424b534bd7
	.xword	0x46a248f6deecf368
	.xword	0xcfc609e66ba80820
	.xword	0xb2565caa4393af62
	.xword	0x85ac1a3c1b641c6f
	.xword	0x8f0f09775c0f6ca8
	.xword	0xb7279bf3afcac557
	.xword	0x98ea90aad5ede87a
	.xword	0x7ae02d29a6e3a841
	.xword	0x460335c46a84afb6
	.xword	0xa28d931d3a6ba14f
	.xword	0x10b4f8c5f328ced0
	.xword	0x9ad104791212a759
	.xword	0x252e1661f3f081b4
	.xword	0x6a17833ad3ef1a47
	.xword	0x95c2ec524856c714
	.xword	0xa4252cf5d3b135a7
	.xword	0x9ca07f07fa7070ef
	.xword	0x9ec5398167b0265e
	.xword	0x63a06bdde616ca42
	.xword	0x0baa41d619bd833f
	.xword	0xc8ce038e36a7d72a
	.xword	0x59f974ac7936ce0c
	.xword	0x873eac3ee614fdaf
	.xword	0x292bb613a8d0dca2
	.xword	0x3fcc3cb727c68d02
	.xword	0x0e144f99b9202deb
	.xword	0xd00bd4d2eb02428c
	.xword	0x850d068b9b58ac86
	.xword	0xd0b3dd6d4cba79fa
	.xword	0xc3f26230611f25ac
	.xword	0x217b0af6afc0fd07
	.xword	0x6a46c49a7942663a
	.xword	0x9d76fb6720668c4f
	.xword	0x044b245f597dd330
	.xword	0x415daa41eec584f5
	.xword	0xdc1959989a16be77
	.xword	0x15221a5aa77518ab
	.xword	0x29feb57957a6a6a8
	.xword	0xcbc25e1f2cf041d2
	.xword	0xa7e2055f27fce528
	.xword	0xa0729dc749ebae4b
	.xword	0xda6dc8bfb95a8012
	.xword	0xb9b3110f6d0f690a
	.xword	0x554cc38e508308f3
	.xword	0xdb3cc46d79fac3ff
	.xword	0x5b6ff44c5e0bc3a0
	.xword	0x91bc2db8833cd9d2
	.xword	0x1c7b77651cecd770
	.xword	0xea3aee36d86720a8
	.xword	0x1f86a9526bdcf340
	.xword	0x71bc4c95064076b8
	.xword	0x2def6802049d59d3
	.xword	0x4f59a9f16f2d95a1
	.xword	0xf2d2c82e0b2a924b
	.xword	0x4c9c4cebf81a7b60
	.xword	0x3d8f8d6bfe654249
	.xword	0x5cb48d31dbc58bb4
	.xword	0x1053cbf7b9a120a4
	.xword	0x671fc7efa370344e
	.xword	0x8154edd933237aa4
	.xword	0x3228775f1368a8a5
	.xword	0xff41451bf39b3cf9
	.xword	0xf18820519e5e9ddc
	.xword	0xf5cc149bf93b72c1
	.xword	0x32a0122a2c18746c
	.xword	0xea421448dc978543
	.xword	0x27466953b661a13f
	.xword	0xc22d37efc61ff8fc
	.xword	0x2c900ba26c18c0ff
	.xword	0x0786c4a4a1a3745e
	.xword	0x69b18fb222a33ab7
	.xword	0xdf05c99e8abb009c
	.xword	0xc50d02878704671c
	.xword	0x9e9d66d90da7b672
	.xword	0x493d265aa77e94b0
	.xword	0x20d4607b011537de
	.xword	0x33f531a7a2451d82
	.xword	0xc67896d8c2071563
	.xword	0x4f548e0ea457832c
	.xword	0x78df2465452c04c2
	.xword	0x7a4def0152bb8131
	.xword	0x4945903d8211522c
	.xword	0x63d6613300390f29
	.xword	0xcf7241d5c2b35a9d
	.xword	0xb738647e91c1bf17
	.xword	0x59319bf96b9d4a07
	.xword	0x30c15d8a0fe1c061
	.xword	0x1095660d07bc1c52
	.xword	0x1243d98500e95162
	.xword	0x57db07b78e485bb9
	.xword	0x05f62810806ced82
	.xword	0x49849b386d1731e7
	.xword	0xeabd8c1ec899589e
	.xword	0x005fd0731eca055b
	.xword	0x7fd55999ad15fbc0
	.xword	0xbe075af7e256d11e
	.xword	0x37db0f97cf1ddb45
	.xword	0x67e02c2f421d12b1
	.xword	0x71ae1a0fa1c4a16c
	.xword	0x2e03b11189c7dbd8
	.xword	0x8e24814c4bade8e9
	.xword	0x6eebf2f7aad5a1b1
	.xword	0xb282f6217b9aa1b2
	.xword	0xf51b341631374ca5
	.xword	0xa08304896e841071
	.xword	0xf0ea9c1a4774a451
	.xword	0xc1d806f5ff648111
	.xword	0x0ee53611e83e9735
	.xword	0xb719074dfb06a8d2
	.xword	0x57329f1a33c10d87
	.xword	0xfb6ac889405f783c
	.xword	0x8290aad97b6c8889
	.xword	0x89e6875e51fd123a
	.xword	0xa7c937c738b636d7
	.xword	0xda241435ea8a04e9
	.xword	0x08aaf260737ce652
	.xword	0xbeeac2bb164c9282
	.xword	0xde80362518eb1b48
	.xword	0x0c67d59574ebe453
	.xword	0x2f64777804782edc
	.xword	0x6d3debcaad412f00
	.xword	0xb638773c7f30a52c
	.xword	0x99ce489b6373bff4
	.xword	0xebc59eda2c35d257
	.xword	0x5f0e0830d895de99
	.xword	0x6826e5ce561747fa
	.xword	0x27c298f8c7f1332e
	.xword	0xc33badfd4f05259c
	.xword	0xaa8837530f4c75f3
	.xword	0xe5f7a43f3af7ce00
	.xword	0x78da485353962b95
	.xword	0x1dbb9954d945c3e9
	.xword	0xfc547eed4b2b34a1
	.xword	0x1b133a56eadcba94
	.xword	0xf6b9b7df52d08a9c
	.xword	0x3d2fcc7d921c3f2e
	.xword	0x0a374b2bb863dcb3
	.xword	0x08b127cb3678ba45
	.xword	0x82552c3adefa22f9
	.xword	0x2d7b5ab6352b3f43
	.xword	0x9e7d15602337e2e2
	.xword	0x5198a75bb4c66df4
	.xword	0x83ca87bb0ece9f7d
	.xword	0x7993f3ce9d6fd89e
	.xword	0x355951159752e1b7
	.xword	0x1dd1197a3f337fbb
	.xword	0xc188600e9dd76c1b
	.xword	0x41ddc1dc9e6b5159
	.xword	0x89349d8498416356
	.xword	0xd6218d6d6944917f
	.xword	0xf15e09c6207eaab4
	.xword	0x414a5be7abc89671
	.xword	0xbeb7a0c625ff64c0
	.xword	0x100364fbeeafe6ea
	.xword	0xb1f70a814424ad96
	.xword	0xb8c4f4a211249953
	.xword	0x6cdd7a9bb2524393
	.xword	0xc1910ed7fbb084c1
	.xword	0x3843299e4530fe32
	.xword	0xcb82dc4e6e6dcc08
	.xword	0x2b166fc457efc88a
	.xword	0x6ccc704cf8acb18c
	.xword	0x3b69ab14e2ba79bf
	.xword	0x3377c1cde2910c34
	.xword	0x947f9c5fcd6a10f9
	.xword	0x859ae2cd5b5dad43
	.xword	0xdffe5ca739539729
	.xword	0x3521e15dd70aa2ea
	.xword	0x37ad9c41a9e35d82
	.xword	0x3e8a981ca9c219c8
	.xword	0x4bf5d162030327ba
	.xword	0x0ea9e1a63bf0e7eb
	.xword	0xfc3a3cadf18df41b
	.xword	0xa2b27776189d4f08
	.xword	0xb26e46369d187001
	.xword	0x04cc24b68bdd6615
	.xword	0xe62baec6c62521ad
	.xword	0x2ab58103cc500d50
	.xword	0xe7b851090cc1a25b
	.xword	0x94a4419650e4dc50
	.xword	0x73c85a5c889a525d
	.xword	0x19ecb56fdded199d
	.xword	0x766dc8dde47031ce
	.xword	0x2651e4da697958e2
	.xword	0x2b3e65558c329573
	.xword	0x82dfd2fce44750d0
	.xword	0x22b8ab0465867d4b
	.xword	0x99b01651f18c1f22
	.xword	0x5245d374ba7b7cc2
	.xword	0xe57531de7ee426f6
	.xword	0x80f728103079079b
	.xword	0xb443f3d2d0da702e
	.xword	0x0a9c7e02d7391e98
	.xword	0x370b7f22a627a213
	.xword	0xc0fc437de2196d39
	.xword	0x38fdecde5bc34d6c
	.xword	0x3286178667e90d92
	.xword	0x5b821af106b60490
	.xword	0xc42f8c2b00d5f912
	.xword	0x4c45fc1a2c0286f4
	.xword	0x15b10c3ff2c95477
	.xword	0xc6f470e0f850417d
	.xword	0x9fb8c3736d218162
	.xword	0x898f6062fa6cb845
	.xword	0x758e6591d2a24961
	.xword	0x16b39a0311d838ff
	.xword	0x2bbd852cd7a47cb3
	.xword	0x8be68a4f2b9c5d67
	.xword	0x878144153e375d1c
	.xword	0x4544dcf7ac294353
	.xword	0xea3e2941c50d011a
	.align 0x4000
	.data
data_start_2:

	.xword	0x7c7bc39e97ea7de7
	.xword	0x91afad0d5e09786d
	.xword	0xd5e30f615d5667ae
	.xword	0xd04efca90573a22b
	.xword	0x46ddf73ba3d62568
	.xword	0x3dea1c069314270a
	.xword	0x310d657ec00de319
	.xword	0x0d2d87b90cd20881
	.xword	0xed361c4c3521bfba
	.xword	0xd67f2b7fa4796eab
	.xword	0x1fa753ead406be9b
	.xword	0x4b86728ec2b93579
	.xword	0x933de5538166997f
	.xword	0xdf494c773f07d56c
	.xword	0xfe3b63ac2c8cfa47
	.xword	0x08e633b41e28b0ce
	.xword	0x6c5e77fbd9578214
	.xword	0xdf0ca4bfb7936e3a
	.xword	0x5fe40bb0febdfa24
	.xword	0xe087eb31922220f9
	.xword	0xf7b3ac272dde5236
	.xword	0xf15480efbb320c06
	.xword	0xa39dd06f6bdab047
	.xword	0xae80cc7b1829f5cb
	.xword	0x0e05e6ee5997ba65
	.xword	0x62edc1a211a26e2e
	.xword	0x93e041ffe0ce0b35
	.xword	0xca9db2d26aa165ae
	.xword	0x63eec6af513997f6
	.xword	0xcef04bfcfc3b4e89
	.xword	0x37b8f0403c625144
	.xword	0x4131e8fadf19d1e2
	.xword	0xf2fee921c1e001e6
	.xword	0x4fa59c6abcbec137
	.xword	0xaec1871f1e73d870
	.xword	0x8a26c7d36c9ec389
	.xword	0x7936a50b48b6e685
	.xword	0xe33c8d4134e7353d
	.xword	0xca6981e80297b4ba
	.xword	0x7e25b3bc73aaed56
	.xword	0xdb45e19805f2b311
	.xword	0x41e37bd142ea6de3
	.xword	0x98a830167dc3fa11
	.xword	0xe61ce8c8a2d5b77a
	.xword	0xa229305d1874699c
	.xword	0xa4ee4c8774dec510
	.xword	0x673c2ae531cb1ec1
	.xword	0x38ad22d2aa2e2488
	.xword	0xb3a00cacca646469
	.xword	0x78070871b3027d5d
	.xword	0x113cb0329693bfee
	.xword	0x05ad55f56bf6f88e
	.xword	0xaa871182dd47c492
	.xword	0xfd4a0f271a2acc9e
	.xword	0x25f6fe352d90dcf5
	.xword	0xa169ebb3592e2c9a
	.xword	0x63dacbafacdb911c
	.xword	0x4d9c5542aab6ad69
	.xword	0x21fd5a3916fb468b
	.xword	0x1c2d9d72a34285c6
	.xword	0xe612b0cba4e539d0
	.xword	0x65b517de7decab35
	.xword	0x2ff85a2460b6880d
	.xword	0x1a6948693182ddd3
	.xword	0x8c2edf64f45ee155
	.xword	0x1fcda775fa42d5f4
	.xword	0x0b92842ea34dd1c9
	.xword	0xaef717bc36bbfabc
	.xword	0xe4e0b61691de7664
	.xword	0x02f778b4069d9ee5
	.xword	0x07cf64acd2691ad2
	.xword	0x598e58a7e47b8964
	.xword	0xeea302aa3064259d
	.xword	0x38b1176a38c3c1ad
	.xword	0x526622e9b21cb1c2
	.xword	0x258eb30469e0a875
	.xword	0xaf84683bbae28596
	.xword	0xb797681f75fff118
	.xword	0xbd9dc115c2574ba0
	.xword	0xd7ab4429456859a6
	.xword	0x61789a159a3ca80f
	.xword	0x5b257791d18430ee
	.xword	0x008abfa1688a27d0
	.xword	0x447dba5bb312e984
	.xword	0x96b23174016dfb98
	.xword	0xa89ed8a62380f1a6
	.xword	0xb520f779993c98c3
	.xword	0x60dc9aa111564a7a
	.xword	0xf03ac31f1e72f84e
	.xword	0x33036c2d79a9ac27
	.xword	0xdf9966ea0a952f75
	.xword	0x46d1608fe4307a3f
	.xword	0xcd507439e78d3e8b
	.xword	0xcd8da30d4b0bfc08
	.xword	0xd6cb656295ccf2da
	.xword	0xb9c7cf1d9189eaeb
	.xword	0x5f87c254c7ff9d77
	.xword	0x452972d87bb08d4b
	.xword	0x5627ed408b532232
	.xword	0x0769b48881ed9bbc
	.xword	0x56dcd89287e360e7
	.xword	0x58aaa1c9a06afa8c
	.xword	0x1606b5c9240ef940
	.xword	0xe02d94532696f3f1
	.xword	0xe382a39d6d30a238
	.xword	0xc94bb69ee77a7241
	.xword	0xdc533b0fb5d01ce3
	.xword	0x9b140aad4bd7e9f8
	.xword	0x44962e8fae02110c
	.xword	0xb1fcd7cb37b23ed9
	.xword	0xe8962d9133a66d05
	.xword	0xfaf2479b20c5f666
	.xword	0x4719dc2f542b6acb
	.xword	0x29f68fb983a276c4
	.xword	0x242889d4087331c8
	.xword	0x01db2563327f315a
	.xword	0xdbc62bd9c15396b3
	.xword	0xd54f19dce798e4df
	.xword	0x1d7ace76d10a3ef1
	.xword	0xac6cdb9af19d5a8d
	.xword	0x84bd352c0787270e
	.xword	0x1afc4ee5052a6c41
	.xword	0x8155743a14ace9ca
	.xword	0x8adc1aa24fe2087c
	.xword	0x8268bcac4c4686b6
	.xword	0x0c19b5bf6db42c71
	.xword	0xe5efbe77d70b38f8
	.xword	0xfcb9d3ee27e835a3
	.xword	0x0cbe17ff1e46718f
	.xword	0xb504b2822e00a1a0
	.xword	0xcb652dca34bf814b
	.xword	0xf94371d3c73299b3
	.xword	0xdf3a6b02fd8b4e2a
	.xword	0x1207de9be29354c1
	.xword	0x32667e7de94d8dfd
	.xword	0x293a76fc5cf3f278
	.xword	0x107bb0c4b7cd8663
	.xword	0x59b9691894e4e693
	.xword	0xf4631eb095fc1701
	.xword	0x91c2575a05431f86
	.xword	0x35381d62c66f9dc7
	.xword	0x1ca9dc2c86ea7ffb
	.xword	0xdd25fc5bef48565a
	.xword	0x0df13a41d0f08853
	.xword	0xac9492ccf34fe8e9
	.xword	0xa52d5e4c14099372
	.xword	0x83c938e23f8e142b
	.xword	0x7dc375bff191e1cf
	.xword	0x455a51c2c1c9b541
	.xword	0x55364a7d1fe00860
	.xword	0x34b1762d02e2418c
	.xword	0x98c4f0a50c35e31b
	.xword	0xd6db3af90849de72
	.xword	0x4056750017fcbc22
	.xword	0xa8d5467d507922f3
	.xword	0xf1585b1ad7458222
	.xword	0x96edaa4cdc6c3ac6
	.xword	0xf470d8b89e40ee96
	.xword	0x4ecf068c27e56d5a
	.xword	0x19d08f320a31bb99
	.xword	0xc57ac94bbace173f
	.xword	0xddd86ce0821eba77
	.xword	0x19a0a8edc1227dee
	.xword	0xa4027dc25694fa41
	.xword	0xb1e167c8c2cbb854
	.xword	0x19b57fdf25ed4e79
	.xword	0x5977ff5ea5024b82
	.xword	0x3d6c7913c61de80f
	.xword	0xb063fb29d34141b5
	.xword	0xe91326a6628f52c5
	.xword	0x6caa2d84ca1e76af
	.xword	0xcea1b82d25d78a00
	.xword	0x4fd253ac917e04db
	.xword	0x3a6b1187a3b07fcb
	.xword	0xeb181da88d47653e
	.xword	0xdba8eb73d7e7883b
	.xword	0x9668090ab2efb8d1
	.xword	0xe15f124951338325
	.xword	0x9a7163de30e82ed9
	.xword	0x6f1bac416c2712f3
	.xword	0x706c7844cd2a609c
	.xword	0x291cad4e708041e1
	.xword	0xd6ee4759c158dc51
	.xword	0xd49b26a1dd402ceb
	.xword	0xca1e76d55c8f07bf
	.xword	0xc007349e75ff7a0a
	.xword	0xb7c80f7a5e98b937
	.xword	0xbd07542e48a558bb
	.xword	0xf3ef908ad822384e
	.xword	0x4337445edb059582
	.xword	0xa47a61e0605b6c3c
	.xword	0x217c10be87250a57
	.xword	0xcc0242b94002312b
	.xword	0x22672cda6543b9c6
	.xword	0x90a0e0775eff02dc
	.xword	0x7bca28ef4fe016b7
	.xword	0x7d0d48bd147aa79e
	.xword	0xabc10dd1ca12d8c5
	.xword	0x8d1e1074841b1b83
	.xword	0x3e36e599beb9b9d4
	.xword	0x3a2a4a58c6181530
	.xword	0xf53ab0d695ce3bdf
	.xword	0x4b467347e6df0bdf
	.xword	0xaeba0423e9757a7c
	.xword	0x522c345a0d2379fb
	.xword	0x20c1b2d112be9d14
	.xword	0x88d68309f28f78df
	.xword	0xc2baa5b3cb217ba4
	.xword	0x99dc4ccb7e112547
	.xword	0xd71ec3302bfbc80d
	.xword	0xcf936a7395125e10
	.xword	0xcde34152025a2ef1
	.xword	0x295a1a0ae01a19f8
	.xword	0x8df2c75a66c0bb81
	.xword	0x91bf66bf6ce90743
	.xword	0x4f3efc9fecf74b4f
	.xword	0xf4e4098d4a589e58
	.xword	0xcb95b967dda4ec9e
	.xword	0xf387c8d28668ec77
	.xword	0x0042f6d8a42e84ec
	.xword	0xdbd465ac283c55ca
	.xword	0x2c6a0d2b7715de5b
	.xword	0xf92ae06c63c986ec
	.xword	0x1ee73dcfa87eb29e
	.xword	0x589a68090cb572ac
	.xword	0x055ca217efe10324
	.xword	0xb0a8328c401b47b7
	.xword	0x52961ec626675d1a
	.xword	0x1442ef9ac0728b64
	.xword	0xbdd0018d95f1602e
	.xword	0x5bf3e02a53d087a3
	.xword	0x00c4c1359e4586d8
	.xword	0xfdd4e1f1f6a2680b
	.xword	0xc0ec0889dcf015ae
	.xword	0xda5d84dade59fad8
	.xword	0x3cc34493ba11875e
	.xword	0xbee1d0ef8dfc83cb
	.xword	0x0de9423308fce8d9
	.xword	0x188092534a8c126b
	.xword	0x555ac7d0a60d8bf4
	.xword	0x5a4b0ea0b21e2faa
	.xword	0x6f6cac55fb717fcc
	.xword	0x11598187548773ff
	.xword	0x3328e35d8e5866d3
	.xword	0x4d7b7d99917b15d7
	.xword	0xbcf4073fe01cd9f9
	.xword	0x88b5ffdab8c82b6a
	.xword	0xa4d502ab2d84433c
	.xword	0x589468cf87f34cd0
	.xword	0x161085c2ba3037ea
	.xword	0xea8905e0e931e958
	.xword	0x26ec428bf2bafda8
	.xword	0xe02b01de0f10de84
	.xword	0x5065994737543f84
	.xword	0xcae8192cfd00abea
	.xword	0x8ff33b4f673c6c73
	.align 0x8000
	.data
data_start_3:

	.xword	0x8a5b645dcdb68309
	.xword	0x290d222fd6b077d2
	.xword	0xc983e951de31902a
	.xword	0xd6a7f2a72b69e098
	.xword	0xb1186ee00a6da0cc
	.xword	0xc8b17a85585afc5d
	.xword	0x8b06649741551302
	.xword	0x8b2c175fd3721721
	.xword	0x57817629a03bd721
	.xword	0x988c480ce313b269
	.xword	0x372adde057aa285d
	.xword	0xc6946b167759f1e8
	.xword	0x28cef5aed6fcae6a
	.xword	0x10e9ce528e76fbee
	.xword	0x3797eba9c653324e
	.xword	0x76df980746149f8b
	.xword	0xbde034d0683aea13
	.xword	0xc1d499d0c68918f4
	.xword	0x1077241b640894d0
	.xword	0x601bbdf738eef8f7
	.xword	0xcfc85f47aeb3ea2c
	.xword	0x9fa44947623cd7c5
	.xword	0x883fef46c16dd433
	.xword	0x38d467008c77a582
	.xword	0xc9160e4ede8fce23
	.xword	0xe6429a1e25961759
	.xword	0x5410baa838bed7e1
	.xword	0x77b307722bc293aa
	.xword	0xd04c932757549713
	.xword	0x7037946f5a82c071
	.xword	0xc6abe2656f09f85a
	.xword	0x90521474e341c507
	.xword	0x5f2ed13b86c31f56
	.xword	0xcccf60ee5f96c111
	.xword	0x77f4da67e1ff2d2b
	.xword	0x4cad2c4bc93e856c
	.xword	0x804427ba46129a99
	.xword	0x72b697749ac4fcad
	.xword	0xd9e78a0fd7e6bd46
	.xword	0xfe09c7505ff0f50a
	.xword	0xadd6286829cd5c67
	.xword	0xf2f8997a30df067a
	.xword	0x443c774eeffc78d7
	.xword	0x51bad8212457ad77
	.xword	0x0c0948183f4dc75e
	.xword	0x96208d98fb33f43a
	.xword	0xd4131d359f478f45
	.xword	0xa82db6a2ce00ffe1
	.xword	0x66ea7749bc618196
	.xword	0x8e43bc7fd770138b
	.xword	0x7a6a82b563e920cf
	.xword	0x65becf52fce37b9d
	.xword	0x09f41cc1b8bd186c
	.xword	0xe93f36663670d420
	.xword	0xbc01dd64b6783a1c
	.xword	0x0f22c8486a5ed53c
	.xword	0xb2bc5a505ee27e38
	.xword	0x8c0b7774d00ce15a
	.xword	0x1c57026e1cd2b03c
	.xword	0x4dd9bac95dd23eb7
	.xword	0x4a707bf6801fc1c3
	.xword	0x262f341abed377b6
	.xword	0x6f8ce1aab64cfcbc
	.xword	0x89f5031bcaa2517d
	.xword	0x807507d9057a8b90
	.xword	0x48a8e8bcb1515ee0
	.xword	0x43e9cfabc8bc5327
	.xword	0xa477c5398cc509bf
	.xword	0x792af127cedb317b
	.xword	0xdfb1b2b8dd2cef2c
	.xword	0xe999c7a5d56fd63a
	.xword	0x2c00d2d03f35916e
	.xword	0x811753296fb2ea4d
	.xword	0x74ed38577cb0497b
	.xword	0x209ba22980631b6e
	.xword	0xec17002d90f65f08
	.xword	0xbe8334b6c678b748
	.xword	0x21786165ee26d41e
	.xword	0x78656a1156313390
	.xword	0x4959e28c5e4b54ca
	.xword	0x56f653d7da8daa83
	.xword	0xc08e77f2e9abc69b
	.xword	0xd672f4b82d48a82e
	.xword	0x6129a45bce74ef53
	.xword	0x73c7684ca4c20fcc
	.xword	0xd3a278b28e685cc6
	.xword	0x047d0e240e08d4f4
	.xword	0x74a46a308a209047
	.xword	0x573f5c5318bdfca6
	.xword	0xcf95fbf9f19df62c
	.xword	0xad4b627fe548888a
	.xword	0x202c53406afd1611
	.xword	0xf1dc9ef708e54707
	.xword	0x192015edc11c0a3e
	.xword	0x408f16fedac65853
	.xword	0x7bd75af28cd06775
	.xword	0xcbdbf769949b33f8
	.xword	0xe4c5102bac2016d0
	.xword	0xb959f52780aa0aa7
	.xword	0x6f2a4bd790a688c6
	.xword	0x82a31976149f5b28
	.xword	0x8ebd2d5f9cdb6bb5
	.xword	0x05b3a2f4412f97b1
	.xword	0x0f3c6c17438138ee
	.xword	0x23be61518328744d
	.xword	0x199f70376607ae42
	.xword	0x03746a16e7f7be6c
	.xword	0xbfc6e59224781010
	.xword	0x4e6e8a5c5a902ffa
	.xword	0x70ca1f611a15565c
	.xword	0x889253ed6d00c4b2
	.xword	0x9a2e8d323699abf4
	.xword	0x98cc71cfbf0ab499
	.xword	0x928b76509c688d85
	.xword	0x01673252f3806967
	.xword	0xadd4bcdb39f14d13
	.xword	0x62ca3ba1b455e41b
	.xword	0x12d166816a496461
	.xword	0xbdf7f126a8398b7e
	.xword	0x966bdc296dc0f74d
	.xword	0x87910d2a6f7a9177
	.xword	0x27584489fcbbc3d2
	.xword	0x1e6fa7490978044b
	.xword	0xfcd7ed0cb5c3e791
	.xword	0xb43d140f88f8872f
	.xword	0x690d2fafdd9d99e7
	.xword	0x3b9074b2438d8816
	.xword	0xa0fdfbab7b646652
	.xword	0xb97a22c4237eca7b
	.xword	0x494d1d35cbb5293b
	.xword	0x1ecbb4d37b08087f
	.xword	0xdd4978d9c0c7cb00
	.xword	0x77255eb36200398b
	.xword	0x037cc9b05c776740
	.xword	0x0fab5b332cb3a7c4
	.xword	0x5c77782fbd2e00ef
	.xword	0x8255e99afeddd6f9
	.xword	0x109268d495707fdb
	.xword	0xf80024a72d6d18f9
	.xword	0xc22b8bbbffd871be
	.xword	0xa516ad01426468f5
	.xword	0x81557b7392396f5d
	.xword	0x311b7b81c8e96aa0
	.xword	0xd02dd434cacdd980
	.xword	0xcb5fa3ff25528dec
	.xword	0xe9ec2a6d47b4f9a7
	.xword	0x7888bbe6ad806fe8
	.xword	0x86ba7d48932a67bc
	.xword	0x0c5c3c181662d11b
	.xword	0xd17e4d861ad9d27c
	.xword	0xd0a0a70d86e23598
	.xword	0x87f9e2b770c55c1b
	.xword	0x17b9e738ecdcbc2c
	.xword	0xef8f0635d61a802d
	.xword	0x180e2d8e9a09ef4d
	.xword	0x897c2aa3a71002a3
	.xword	0x090137249d34f550
	.xword	0x011361fad3aabc54
	.xword	0xe24ae50138085f99
	.xword	0xcddca03bc79869ef
	.xword	0x8a0e14022762805d
	.xword	0x1b4492d3391474b9
	.xword	0x77d629ba29e91a44
	.xword	0x0d681358c9f6dcc7
	.xword	0x83288c53ee64ddcd
	.xword	0xf8a5deb301d03a19
	.xword	0xf52fb0f02104cd04
	.xword	0xe206219b995ba02b
	.xword	0x74173cdb47abe54a
	.xword	0x4a863d2675ad7491
	.xword	0xdec9f475253dfba7
	.xword	0xab44474b2e55c43d
	.xword	0x461976390737fce8
	.xword	0x8f6f3d1612017271
	.xword	0x27262540a9d6137b
	.xword	0xb831725dc890e401
	.xword	0x47b99f7debac0bcb
	.xword	0x842e3c209bcd6532
	.xword	0xdbb0fbc06b7f57d1
	.xword	0x56aa535eaae70f77
	.xword	0x07bb5b06c9096bf2
	.xword	0xf449d03dabd0f77a
	.xword	0x6e7eba1118fdbf84
	.xword	0x530f3dff7c227d88
	.xword	0x2acf48d9ecfb3c73
	.xword	0x1077d02b54ab23e1
	.xword	0xfa14a415728ced53
	.xword	0x8e7a9a5a37c72758
	.xword	0x8f8d1c310fc07dbe
	.xword	0x196adf4748a15306
	.xword	0xc67c93c669830bf6
	.xword	0x7898e3b255056e17
	.xword	0x2483cbdced52c5d6
	.xword	0x9811b1a76050083d
	.xword	0xb4dd05e0d1e5f99d
	.xword	0xe82d2b321b875874
	.xword	0x710edab1a8d7dbe6
	.xword	0x701318674f104d26
	.xword	0x37800400c947699e
	.xword	0x5aad2845c08a74e2
	.xword	0xf5e156a64d8a70e8
	.xword	0xbb74838d2889daa5
	.xword	0x6b48b9dc5c68000c
	.xword	0x2a6c4654d8469a4f
	.xword	0xff83f0f7d7b14366
	.xword	0xbfdb7cf458a19a4d
	.xword	0x277a082a19871bfb
	.xword	0xfc8a36324baaf8e3
	.xword	0x038877382fd3693f
	.xword	0x49438112f8cc058b
	.xword	0xf2dd0f2054c113b8
	.xword	0x7205a619df70e8a0
	.xword	0x3bf5f2986978a358
	.xword	0x62048e3d24324916
	.xword	0x1e82a6e782f025a5
	.xword	0x0267ce1045ec9033
	.xword	0x5410f036f0d21a2b
	.xword	0xb791666c40abb41e
	.xword	0x42852a8236c94947
	.xword	0xbaa289ab1d4ea359
	.xword	0xefbaf40273dc3e8d
	.xword	0x9fa0172729a8d968
	.xword	0x4b7ce936d881d10d
	.xword	0x9d240b2ac38283de
	.xword	0xe4f89c401e9db4fc
	.xword	0x20166c143f7c4c35
	.xword	0xaceeb6a01a2fdcd8
	.xword	0xe0fc9d3e7c2c132a
	.xword	0x0d52e39abaf1cf96
	.xword	0x5601ac5217404201
	.xword	0x674f1fbebee488b9
	.xword	0xdad66eb746dcea15
	.xword	0x5cc1e832394d6df4
	.xword	0x08eb5744df95658c
	.xword	0x0682ee4860cde1c1
	.xword	0x0413968d6c6b64df
	.xword	0xe602dfb93069f185
	.xword	0x823941d9672642d9
	.xword	0xc7d37d20be4a1bce
	.xword	0x2a98c123dc474c00
	.xword	0xac21692ae822983e
	.xword	0x244f5d43121c647b
	.xword	0x74f18dd01f58f3e0
	.xword	0x38dca2c099a12ee6
	.xword	0x8942d2ccb3f6855c
	.xword	0xa5d19cfc96bd89e9
	.xword	0x35a9cffc10820c49
	.xword	0xd1a3a49bf3dba139
	.xword	0x5554b3459870dbed
	.xword	0xfcb1d489d08535ee
	.xword	0xb65f9f5a4be20ac6
	.xword	0x3e9589c883ab9e8e
	.xword	0x69c124ee49443c2c
	.xword	0xc8eaf45a3c3a7a9e
	.xword	0x31fd17dc30c7c7cb
	.xword	0x4d3954f7c8460cc9
	.align 0x10000
	.data
data_start_4:

	.xword	0x19fc6136bfb9a546
	.xword	0xb37f9411d301f369
	.xword	0x48b34462b57f84d4
	.xword	0xfd4dd5c786cbe847
	.xword	0xb1530efe4930b6f9
	.xword	0xc7ad52ea611fa4b7
	.xword	0x3246d46231ee08ce
	.xword	0x5be0720724af0d9b
	.xword	0x1710f2e51035b5ed
	.xword	0xbc1f5b2703c71b07
	.xword	0xa2f8611ce88cdefa
	.xword	0x624c6ab72899cd6e
	.xword	0x67bc2ba41bf6e990
	.xword	0x152745ed90c3c6cf
	.xword	0x0edbe041c0d59e98
	.xword	0x1e489e6e8bb39faa
	.xword	0x03edaaece8cd7a6a
	.xword	0xb93b0fb0c076992a
	.xword	0xffe9298d662350ef
	.xword	0xdbeb5e00ff1cd338
	.xword	0xa41b149d75e8c466
	.xword	0xcc3d87c9932de96e
	.xword	0xef80ba51bba668fb
	.xword	0xd9ad8a0e3b15f14a
	.xword	0x8f288c368831597c
	.xword	0xb554d5e8e9a012be
	.xword	0xca3f86e4f23e551e
	.xword	0x52bed36d7126a38f
	.xword	0x6924cf24d519f030
	.xword	0x44e37c01ac051f87
	.xword	0xf5c3ce2b0fe17aad
	.xword	0xcba477517d835cda
	.xword	0xea9235be93df42a8
	.xword	0xcaccf35f2262c92d
	.xword	0x14ac6a6bf69a8ae4
	.xword	0xa4005c5d7a73ddb7
	.xword	0xf5932a82a05074e2
	.xword	0x3a48a3cdbc06a7c4
	.xword	0xf4f16f717813a839
	.xword	0xceaea1dccf261120
	.xword	0x1fa1f759ef7c9d8d
	.xword	0x017d7db3cdd9d599
	.xword	0x4b1d5bea5380cb44
	.xword	0xa2ac404bed752c67
	.xword	0x1cbd3358dd179763
	.xword	0xed127e91428b9ecc
	.xword	0xe6b8997985b2180a
	.xword	0x2f5c3f5a15437a43
	.xword	0x24bbf23dc8431275
	.xword	0xed5bc365b259dc41
	.xword	0x39fa19c1ce7fbf82
	.xword	0x2128807742ccfe41
	.xword	0xe648cbfaa617af99
	.xword	0xbc30ac1023b060d4
	.xword	0x766e25fa28e18a5d
	.xword	0xa6ea83a853a99b10
	.xword	0x2d7aab33536e9f4b
	.xword	0xc3bc9035dae5eccf
	.xword	0xc81fe67f5a54a0f8
	.xword	0x9f5f26b0ab48914e
	.xword	0x9e1f5b63714af11c
	.xword	0x72be051dcdab672d
	.xword	0x31b91f58c376f194
	.xword	0xd41d74f4c55ba4a0
	.xword	0x6cf08586d0a99981
	.xword	0xbdda0e6188f5dc3d
	.xword	0xf219fa6655f0ae9a
	.xword	0x0837bd272732fd6a
	.xword	0x6f4be56e48fc48ca
	.xword	0x87288d4156889d50
	.xword	0x47ed42be74277d83
	.xword	0xdd3cdef5e858cd3d
	.xword	0x93bfe15ff2b9f5ce
	.xword	0x2bbfb7bd2efea22a
	.xword	0x9e5d9ced6a4af61b
	.xword	0xf352e00687768e5c
	.xword	0x49cf3fabd1e0893e
	.xword	0xec33553a999b78e5
	.xword	0xed6ea62a425edfa9
	.xword	0xdbbc4bb5fd0ef258
	.xword	0x4128355c748052dd
	.xword	0xe9ddcbe3f5bbda2b
	.xword	0x22d459a7bbae784d
	.xword	0x9bd77a0c8a3763bf
	.xword	0xc3d510e5025fecfa
	.xword	0xd7c4cb520add0593
	.xword	0xc659423114431b60
	.xword	0x8123ae31fcaf9436
	.xword	0x1e4fe6de37cdf141
	.xword	0x5d383ea3a51b6616
	.xword	0x3a42215871b3c98d
	.xword	0x1809845f9a5a69e4
	.xword	0x3b4ee4861f5e6899
	.xword	0x8cc9bfca459a365a
	.xword	0x351accf582ccd1f9
	.xword	0x9d54c9b010dda42b
	.xword	0x1cc59c6df5c9906f
	.xword	0x7a37584c2ce2fcc1
	.xword	0x94d49479713faf8f
	.xword	0x134b5a6a52d0fec8
	.xword	0x324c9f3ccab15256
	.xword	0x24326f9494e51a94
	.xword	0x53099a13dc0cc307
	.xword	0x80dce205c50bce22
	.xword	0x51a1cbae4b5eceb6
	.xword	0xed3544c9b8ea73c7
	.xword	0xd6d3163593a928a0
	.xword	0x7f43878bf725bc45
	.xword	0xcef6631af7a4fc6b
	.xword	0x837173662d45303c
	.xword	0x90a9fe4a0fefd97a
	.xword	0x3da40b0eabe557b8
	.xword	0xbe44329309edeb44
	.xword	0x41f4201456ed1f70
	.xword	0x2e182e8ecfc2c7a7
	.xword	0x863323b72c31be61
	.xword	0x8968bc4169266498
	.xword	0xc7d68d8f9c585282
	.xword	0xcee5396b632fe716
	.xword	0x6c974409149040c3
	.xword	0x5968b208339af8d8
	.xword	0x771b1254e039711a
	.xword	0x18e819bc90c21eda
	.xword	0x00c1a165961f3742
	.xword	0x5bd9a14ddd840ebe
	.xword	0x551331106ee590c4
	.xword	0xb004edcb98e3cfe8
	.xword	0xbac8af05de3c7ec0
	.xword	0x89c2bc7bf2e00209
	.xword	0xb1574ad718d569ef
	.xword	0xbbecbfa210943628
	.xword	0xbc8bc4b4321cd211
	.xword	0xaa2c6ac916a9c396
	.xword	0x8a1cb680af00f5d9
	.xword	0x60e05c411be02576
	.xword	0x283da098ebc5ab71
	.xword	0xa73bbb93a5748e89
	.xword	0x93aef3c217e5f87b
	.xword	0x8a5699c53c0199fe
	.xword	0x44e6369027fd21df
	.xword	0xc3c7dbf24f50a823
	.xword	0x8d3e556254108c6d
	.xword	0xf8ccd8f3292ddebd
	.xword	0x4c886efdeb849248
	.xword	0x19f76856cfdfbb77
	.xword	0x13c630dd1d539ed3
	.xword	0xe7c070f7fb55d63b
	.xword	0x48f41864db72a9a1
	.xword	0xa623f9e4fffcfe4e
	.xword	0xb800c3038ab087ed
	.xword	0xdfb26c03a66661db
	.xword	0xc81382947447b5f3
	.xword	0x1d482deca56a0bf8
	.xword	0xceb4f7ba0ad614eb
	.xword	0x36a8d1b56a66e788
	.xword	0xf1df981555f3a4f5
	.xword	0x34d6fbc6bb2515f8
	.xword	0xd926ad969a45560e
	.xword	0x2cc57112c0a78b70
	.xword	0x1fcdae3be8cd0781
	.xword	0x7a4db27cc87d4a6e
	.xword	0xbacf0c64e614763f
	.xword	0x7c2e48fd7951227e
	.xword	0xe5cc33492950f65d
	.xword	0x7ee9e76948369bab
	.xword	0xf09d7f382b760d5a
	.xword	0xca9f57cb589ebe85
	.xword	0x52f78672c81d3d42
	.xword	0xc6c19db114aecb15
	.xword	0xbac1e0ef95600e7f
	.xword	0x66ce42e38e6acdb9
	.xword	0xe7df057902794b35
	.xword	0x79e55f07cdbddfea
	.xword	0x1fe3082428481adc
	.xword	0xd06763e56967fab3
	.xword	0x824cb06b5944f231
	.xword	0x7b049322c5ca1dff
	.xword	0xabf5bc21c39aceae
	.xword	0xf837a7c3d467b2c2
	.xword	0x63257deb29adf1b3
	.xword	0xf364bd946c6562fc
	.xword	0x60a64878d8fb13ab
	.xword	0xc01d71cce3e3a04a
	.xword	0xab039ae32b3f4987
	.xword	0x9763dab0deee7ddf
	.xword	0x4982b4e9187c1643
	.xword	0xb450d074f4ed377e
	.xword	0x1ed641f7b09f206e
	.xword	0x5972be07a0e1110a
	.xword	0x786d81ff595dd303
	.xword	0x9f034c423ae31418
	.xword	0xcc10610c2a274f25
	.xword	0x5cb0bc68fc0f0355
	.xword	0xdb0f3dd1a47d6c6a
	.xword	0x2bf53d743382085d
	.xword	0x63b12ec28ef50162
	.xword	0x4b5ffb865784f9ef
	.xword	0x902274420ad2c378
	.xword	0x0ec3f8650b4d3ae2
	.xword	0x2d7f868bd596100f
	.xword	0x402a2fbb0a80ce7a
	.xword	0x64704f14d6fc6add
	.xword	0x2cded9bcc7bdcedc
	.xword	0x417c449e7e836501
	.xword	0x2f7144e9cbe9dc71
	.xword	0x84cd7a6b4dc0d1d5
	.xword	0x9bca54ebb097a8d8
	.xword	0x30cee889cc9b880b
	.xword	0xe8ea1eb3d042dca4
	.xword	0xe9600fe38261329d
	.xword	0x3b4a572e59bf2ffe
	.xword	0xde86878f6072b009
	.xword	0x383fc1b8ce89e11b
	.xword	0xc065f5b02d335b10
	.xword	0x75ab6360db0edccc
	.xword	0x17ada8f6a0f4d34c
	.xword	0xfa0a2c95164dd9de
	.xword	0x73a700f2a0232365
	.xword	0xf4e283f4d2238022
	.xword	0x60bcda5db0b5569d
	.xword	0xd2cb05e02e6bc181
	.xword	0xa7dc4dc43781ae6a
	.xword	0x72ec0400e9f0b8fa
	.xword	0x228678984d4fabab
	.xword	0x19c5b3c13d5209d6
	.xword	0x0257725787e11474
	.xword	0xc810baa781dd2e16
	.xword	0x6fe549efbdf9666c
	.xword	0x846cc064f43c2ff4
	.xword	0xcf53b16f36edbe06
	.xword	0xeb75d28091b19b98
	.xword	0x8e34a6c7e8b938b7
	.xword	0x7269f5b51a917d42
	.xword	0xe77e6d90be0ae281
	.xword	0x737323b31dedb531
	.xword	0x2451220024efe2e7
	.xword	0xe4656cdedeab1ffe
	.xword	0x5d71c7e2cb8849ed
	.xword	0xe6ee2e712889da12
	.xword	0x0766e933ccea1339
	.xword	0xb00de3351b462adb
	.xword	0x0c4450748eb6ae70
	.xword	0xb0f773792bbf9a0c
	.xword	0xfd51f46421e3c293
	.xword	0x087feccdd2236b97
	.xword	0x2e09d1089cbdabc3
	.xword	0xc5e129ed5759242e
	.xword	0x0fd18671742eb9b4
	.xword	0x9cbb9185e082a0b5
	.xword	0x81b0b69b4334d852
	.xword	0x416bcca8812d50a0
	.xword	0x74253d540f0138c0
	.xword	0x09a90ffa802e4e42
	.xword	0xa7c4f6c22a6e54fe
	.xword	0x0f09c2f23cc0e01a
	.xword	0xcbc60732ed5ec187
	.align 0x20000
	.data
data_start_5:

	.xword	0xbabb8460377d38f1
	.xword	0x70ff3f055dc11244
	.xword	0x7126c1bdc56a2bc8
	.xword	0x2fdf6b3956e222cc
	.xword	0x583973e147b29e2a
	.xword	0xbb91034ea587e87b
	.xword	0x7fbed6697a52ebbf
	.xword	0x11592ca86896876e
	.xword	0xd301cfddbcc88e91
	.xword	0x3c78b829d9b10590
	.xword	0x875ca7b496168708
	.xword	0x77fe2b470092b666
	.xword	0x2b7d1cbc71390254
	.xword	0x2fd6f3183675a3cf
	.xword	0xef14c231d01ff1bd
	.xword	0x33cc702d3bde689b
	.xword	0x33c5e70a19fe652e
	.xword	0x7469916eda30265d
	.xword	0x78c8d917f6f9db32
	.xword	0x76b41dd5debbf820
	.xword	0x6ed5efa821e07812
	.xword	0xe3dbe9041ac81f8d
	.xword	0xeed0509cae9dd438
	.xword	0x920d58dac9a3c95b
	.xword	0x49fec9d85aa1ff4b
	.xword	0x5b20969f4e09df9d
	.xword	0x3c00337d5a092381
	.xword	0x1a90395f7e61f20d
	.xword	0x93a05ffc336af0e5
	.xword	0xf9fe1273677dcb77
	.xword	0x034b452c0bfd231b
	.xword	0x19eba9db365e5712
	.xword	0x85512bdcd3c53d1e
	.xword	0xa214a08765c7ea72
	.xword	0x300a7a3f7df6af70
	.xword	0x69899a8396621cb8
	.xword	0x41183d6b4255f69f
	.xword	0xd185f547542820b8
	.xword	0x6a8d4860da091c4b
	.xword	0x15bfcfe7113a81fd
	.xword	0x6b90f42c3ceec2cb
	.xword	0x6138ae113f864352
	.xword	0x65b0254dc56fe318
	.xword	0xf6c004f100eab134
	.xword	0x3c504d5e1e627a0e
	.xword	0xaa804d5172a29e39
	.xword	0xdc3819c547b6c86f
	.xword	0x1db986ce76bdd401
	.xword	0xf308dce9d52be3b4
	.xword	0x3ea9a6ee7c2a54d2
	.xword	0x6fa69a6fbff978e2
	.xword	0x35558786f241e577
	.xword	0x832e68b21770f5ab
	.xword	0x8c72739db1a0e898
	.xword	0x53451b015acec98c
	.xword	0xe22166bfe0e71728
	.xword	0x5fe6fc9df86a3683
	.xword	0x39b07896049cb182
	.xword	0xd6ef4b9af6242005
	.xword	0xf1eb468571ee3c79
	.xword	0x968a1233441e50d5
	.xword	0xb7a0a806d7607ff7
	.xword	0xb43e186dd6c546ec
	.xword	0x44493c56f2fe9df6
	.xword	0xe4478d9b324dea62
	.xword	0x1e7c42955ae479a4
	.xword	0x56616b9d9bcbc4d4
	.xword	0x03234b658c3a6100
	.xword	0xea4c943b130e657f
	.xword	0x864d8ba6a7a5c8a4
	.xword	0x81e93dfc0c9d2d35
	.xword	0x2e7c5c7715cf4b28
	.xword	0x73f3a55229624682
	.xword	0x64930bed71cfd880
	.xword	0x23ff45a3ff4aa536
	.xword	0x0b70d5eadc905fb7
	.xword	0x3ebca2334590e950
	.xword	0x06ffb482a11eab04
	.xword	0x872e0f72ecbbe51a
	.xword	0x83ef107032eb7136
	.xword	0xc5229c5bc3d76ec6
	.xword	0x7f418fa7952ae74b
	.xword	0x4381c51700979430
	.xword	0x0a0cb4f49b161d3a
	.xword	0xe517f27cabe125de
	.xword	0x8a31d3dbd405f72e
	.xword	0x95f682b69895e3bd
	.xword	0x5885775d71a4ed08
	.xword	0xdbf4a785f0bff790
	.xword	0x3eb69dca5c22a090
	.xword	0xaee9229182610eb8
	.xword	0x8a7b30d3ea694c28
	.xword	0xbc17def2a7abef25
	.xword	0x3259e1ed56246ae3
	.xword	0x298f069e62b20c91
	.xword	0x9cc247458935d5fc
	.xword	0xb1c4e9ea29cb656a
	.xword	0x072c304dd7c9408d
	.xword	0x98e2cd3ce49dc39f
	.xword	0x1c49bdcc31d4e51f
	.xword	0x900e7936cdb0bd1a
	.xword	0x6779fbe275ad2e09
	.xword	0xfb688af151db0b0e
	.xword	0x43f52302c70f8f86
	.xword	0x6019758c712c5594
	.xword	0xd80475982f6ae462
	.xword	0x17c7939b20ba42bd
	.xword	0x1c55134e2b2f4094
	.xword	0x7e473a48f0bfc70b
	.xword	0x7889226c6cdc194a
	.xword	0xe410cd1892b75c15
	.xword	0x2a403905d2faab9c
	.xword	0x6fbb80e470cf241e
	.xword	0xe5b6e022fd8ee8d0
	.xword	0x9f01f3aa2ad26a26
	.xword	0x09d8e21874fe3f68
	.xword	0x5a01de25cd2babd4
	.xword	0x9f3f558d13927c82
	.xword	0x2161c8295c1b24ff
	.xword	0xdb1c627fce7d89ec
	.xword	0xc515bff8f8882f5d
	.xword	0x3e79d421c3c93383
	.xword	0xa75d6812eaf4d877
	.xword	0xe3bf8008c3e46f05
	.xword	0x6521bd6f506cf38a
	.xword	0xa630314b66788d99
	.xword	0xe280804ee9ed0191
	.xword	0x88b7a4c4195d5cae
	.xword	0x3a1ef8e12ce0fdd8
	.xword	0x1146969853f4cf5f
	.xword	0x9fdecc5850fc2d67
	.xword	0x33543ecc0fb1ef5a
	.xword	0x2dc6f3977cc2afec
	.xword	0x29996253b0cbe4b0
	.xword	0x85f78b28224d863b
	.xword	0x0f465bfff8f82f97
	.xword	0xb3e08e3f33fdb90e
	.xword	0x65ebcbebd3d27a4c
	.xword	0x2121e74168635be7
	.xword	0xe7f906109c7fd237
	.xword	0xb8934b9fe2547c8d
	.xword	0x5ce408e9b7bba3cb
	.xword	0x05081c03df012f28
	.xword	0x9b53265849091cf9
	.xword	0x480df74abc90ef7f
	.xword	0x5c3696385880fecc
	.xword	0xa48b433b02f65c26
	.xword	0x6a70eca4b672486c
	.xword	0xb22abda3913b4dcc
	.xword	0x1182c3c5f86fdf80
	.xword	0x9cce273280d1fe8a
	.xword	0x586e0e005a14cd69
	.xword	0x749c7e5bea468364
	.xword	0x45df2cc3bfe279b8
	.xword	0x1d468d1e19db1dfc
	.xword	0xade196bdde91b7c5
	.xword	0x7516ed7488a6365c
	.xword	0x128ffc9a7e3b8df1
	.xword	0x64ddd358d31e3536
	.xword	0xa31938d56af858fe
	.xword	0x8b79fdc66ced3755
	.xword	0xc9935c46dba3496c
	.xword	0xe4f5ae278d511fec
	.xword	0x0d74be3276755239
	.xword	0x4a84fc48b7e8f3a9
	.xword	0x90ececf8ec35c072
	.xword	0xecd9bdc6f10289ab
	.xword	0x2cdc197850cb0a4f
	.xword	0x2750a65d2a6ab3c2
	.xword	0xfdeb04a1cef79615
	.xword	0xe0863251649ed6d6
	.xword	0x53b2a3a731bfbcc9
	.xword	0xabf79fb33d05c56e
	.xword	0xaf0d741e591d88dc
	.xword	0x4e19cc5ad19283e5
	.xword	0xf49c4a714931e37d
	.xword	0x7601a44c09ccd4ce
	.xword	0xf4f98ed530906202
	.xword	0xe9ed1ac73a163bc4
	.xword	0x35b2c13fb7188063
	.xword	0xf0861ddab66e3f88
	.xword	0x3b6ac5ab0961c62c
	.xword	0x73719e1525a4ead0
	.xword	0xeea862c420975ac9
	.xword	0xc67b0b6c042a8e3d
	.xword	0xb0dce4dd5655d00b
	.xword	0x6ca4791c8b42d3d5
	.xword	0xc6386ddc8e37b4ba
	.xword	0xd33d371a49da2c01
	.xword	0x9cac106adeab8624
	.xword	0xe3bae7abb727e1bc
	.xword	0x4c7f6e00531d5719
	.xword	0x9405f48a4a997ee9
	.xword	0xbc60ace6576c7522
	.xword	0xf8c7beea732f7fcc
	.xword	0x35e99f49febb1bce
	.xword	0x8aaf307a05ab6614
	.xword	0xa913045a99687843
	.xword	0x8a2ec8d75bad98e1
	.xword	0x4566af03eaf5ab0a
	.xword	0xcf330e2f7585c987
	.xword	0xe11219e10382bddb
	.xword	0x0733998338545663
	.xword	0xbc23f72b06c72403
	.xword	0xc493950cae3031e1
	.xword	0xb04d3051672bfc9f
	.xword	0x5041d321c8a4619d
	.xword	0x832fff1e144da746
	.xword	0xfe449ba907cd8727
	.xword	0x1ffdf4413894df18
	.xword	0x7f0f960e2ed6e72b
	.xword	0xb4c908066f6f8be9
	.xword	0x5d49373882e3d6b6
	.xword	0xe69014d965880c9d
	.xword	0xe651850e130eb3b3
	.xword	0xd79f1178b9c31f85
	.xword	0x4786ca6549952fea
	.xword	0x311cab14acee3f89
	.xword	0xebd42376c8367a02
	.xword	0x054739ad94ba9c90
	.xword	0xe78bd6c4be28d3f2
	.xword	0x0c5d27d8a6a7e8b3
	.xword	0xe2bbff0529d12c7a
	.xword	0x7f182d8f506555ae
	.xword	0x1f0d4e624f60e76b
	.xword	0x20ee4ce452bf670b
	.xword	0xe244687537c36a80
	.xword	0xaf0576c431232d2a
	.xword	0xb54d7ad6348afd52
	.xword	0x1d76c32a95c8de53
	.xword	0x9ed1657c0131fef6
	.xword	0x88c0cf0bbcf4cd17
	.xword	0x91ec9e57faef022a
	.xword	0xc6487085c771af5d
	.xword	0xe4545e5cd27b95b4
	.xword	0xed0d3d035dfa5bc5
	.xword	0xb8f0b5bcc004be9c
	.xword	0xea6860f2dffa764e
	.xword	0x08cf8921f3162d27
	.xword	0xae07fb2793fa121c
	.xword	0xd342d97e92a4d122
	.xword	0x010a9032df90c631
	.xword	0xc770ce71cdb2111a
	.xword	0x9cad757602f928b5
	.xword	0x0d361f0ae9852e01
	.xword	0x651fd407d662cf7d
	.xword	0x5a07e0566effe35c
	.xword	0xc79179897f25f451
	.xword	0x05e62c6899dcf5e5
	.xword	0x8894d69ae23ce38f
	.xword	0xb40296e24ebe1805
	.xword	0xfe28aa5e91ae3444
	.xword	0x4a520ea767118c42
	.xword	0xd65b3babdfafc7d6
	.xword	0x2b36ae971af01006
	.xword	0x8244a51905521f26
	.align 0x40000
	.data
data_start_6:

	.xword	0x244bd77aa6846837
	.xword	0x26feec9ac531f095
	.xword	0x9a3b33f56135fb3b
	.xword	0x0887953ceb02f180
	.xword	0x3bc8d1c5c82cb9e9
	.xword	0x9ebf14aff45fe901
	.xword	0x4003a3f7c2123d82
	.xword	0xeffea488d64f5059
	.xword	0xfdb9ceec8328d453
	.xword	0x53c199a0f58951a9
	.xword	0xb98cd8b720717eaf
	.xword	0x0ed393366764bec8
	.xword	0xcac5415871d3156a
	.xword	0x3c8592140336e284
	.xword	0x06850f8066c0f527
	.xword	0x8b79d6f0bec1c1f5
	.xword	0xbf497fd721e04eb5
	.xword	0xe777e016d1c4409f
	.xword	0x85356559bc9347c5
	.xword	0x49730e50ba8884b1
	.xword	0x1cd4bbee1dfb8586
	.xword	0x9c3cbd7c0ab192a8
	.xword	0x028e8900444e7b9a
	.xword	0x590923d377dd918b
	.xword	0xf8c6d25cc1a673ee
	.xword	0x8a30739608abb246
	.xword	0x56ad836915dd81e5
	.xword	0x9b642c6eacc4e870
	.xword	0xa0df3c51f8ac8aea
	.xword	0xa20d26e03d807a48
	.xword	0xcc6eed91e751e4e4
	.xword	0xa0e6ab7112a3e401
	.xword	0xacbc9dc5b4b87eae
	.xword	0x98ab44c688df7c6c
	.xword	0xad514a614931338a
	.xword	0x331dc91128b9d5e5
	.xword	0xcb0e085a9b43ea38
	.xword	0xa0f4167a1e844f05
	.xword	0x09ef7d2422913263
	.xword	0x9d8df295902ec80b
	.xword	0x58197d6bbe5c81d2
	.xword	0x526ce8cad524bcf9
	.xword	0x3aa4c54acd812222
	.xword	0xcf23ce5b4cbe1042
	.xword	0x0bb467861c0b3b89
	.xword	0x5ef49e1f9cec80f5
	.xword	0xd030bcbee28e62c7
	.xword	0x1b8429429a842ff4
	.xword	0x0c3200448387bf60
	.xword	0xaf28087c79643eb5
	.xword	0x2efa9dcc4ae15968
	.xword	0xfa9cc21b7898b913
	.xword	0x85fd81733c63bcf7
	.xword	0x11c5f837c10d636f
	.xword	0xb6cd38b7c1b98717
	.xword	0x69450bd521f0e016
	.xword	0xedddb116b6293144
	.xword	0xaeed2fb9f6d3fed0
	.xword	0x4a1517aed662320b
	.xword	0x41bf119e76992513
	.xword	0xed81e165e9dc096f
	.xword	0xa37fbc3aa8488ee6
	.xword	0x1f4f5dc0667ba283
	.xword	0xb729e7244ab54de9
	.xword	0x5c8167399e65c71e
	.xword	0x3a362430aecd0aa8
	.xword	0xe9f65cbc8ee57d4b
	.xword	0x9efbd785ae0631c0
	.xword	0xd881a9d3f38e1f4e
	.xword	0xc4c0dfec4f11dd73
	.xword	0x45c3842371926f46
	.xword	0x7c23dbb2a9e8498f
	.xword	0x93749e96f22141df
	.xword	0x5218f19f2bd10125
	.xword	0xbfe72c2fedb755b8
	.xword	0xe258ac7d4fab25cf
	.xword	0x35a4cc92a7764800
	.xword	0x53900b5134bebef8
	.xword	0xc3457550b75c9309
	.xword	0x496c1eff8a862df2
	.xword	0x75fec7ec9dbd2960
	.xword	0x14ffd2e5c648ee8a
	.xword	0x09c9bc8f061fda86
	.xword	0x6c002d26f2482d64
	.xword	0x69ec105f2ca2d6ec
	.xword	0x9bfe077173fb1996
	.xword	0x70ca1e0eb5e9f688
	.xword	0x1bd89ade2eb473e0
	.xword	0x2f76b4c36cc0257b
	.xword	0x90c0b1202beeabf0
	.xword	0x99bcc9feaadfa9e1
	.xword	0xf1d84d934c9a17bb
	.xword	0x034517d0d9660985
	.xword	0x5fddb98e55546395
	.xword	0x94e2e3f7105714a9
	.xword	0x9358f8f241281410
	.xword	0x483eea77066ded6c
	.xword	0x819a6a3bfc4a5736
	.xword	0x03c6800a97420a7c
	.xword	0x1a15e70f6d952424
	.xword	0x2cbe86fc0e543d93
	.xword	0x8e13a85bae9d37fd
	.xword	0x3879a419813b2e63
	.xword	0xb0745d20444951c8
	.xword	0x15aaa61daf720794
	.xword	0xc55f1336caccb319
	.xword	0xb859a28fdabde77f
	.xword	0x34fcdddd922cf2bd
	.xword	0x04ff59a884e22192
	.xword	0x6b90ff03df59e24f
	.xword	0x2daae4d5aba83877
	.xword	0x56768e57996dedef
	.xword	0xebb9515fba95085c
	.xword	0x74be9a9ffcf617d2
	.xword	0x50148bb2e2ef972e
	.xword	0x638ad876de603ff0
	.xword	0xae6c4d53112bd229
	.xword	0x30613be33f0168ba
	.xword	0x7bcfb476edea68a2
	.xword	0x4edca612905aacc6
	.xword	0xcedf47f4a87655f4
	.xword	0x35b20f09b8dac35b
	.xword	0xe87e81dd01aee635
	.xword	0x8bc157a166ed5b89
	.xword	0x74cd5a5ef615c651
	.xword	0x9bc4c04f49e02a36
	.xword	0xfa165c4f8ca2a13f
	.xword	0x2dfeedfa508e77b3
	.xword	0x5b5cf6a7673e1061
	.xword	0x36303f3c2ab257f8
	.xword	0x43677da675f64985
	.xword	0x8a5f393d62ea93a7
	.xword	0x64d21deccec35984
	.xword	0x970cf556f6762b80
	.xword	0x63ab598b7b7af092
	.xword	0x50f5462f26acac1a
	.xword	0xbfaeeb760cee8226
	.xword	0x3915bddc6d11490f
	.xword	0x43d147320923e51b
	.xword	0x9fea6a34ecb1783b
	.xword	0xefdb353c47858dbb
	.xword	0x06905a6714e2b1d7
	.xword	0xe5341af2594a37d6
	.xword	0xb7dc0cebaee0c947
	.xword	0xb647fae3243c5bf8
	.xword	0xa92eaf27c7e43979
	.xword	0xcf075c8c4b36a369
	.xword	0x74835b555bc5de65
	.xword	0x9e068437bc5d9ba0
	.xword	0x4c0a9a88cc668995
	.xword	0xb8447a89dcab55f7
	.xword	0xca86f331480b6ef9
	.xword	0x8a58f1dcf43194be
	.xword	0x383800fb7668f796
	.xword	0xdeece2050902ddd9
	.xword	0x273e8272a1f12205
	.xword	0xfa8823367cf1da69
	.xword	0xe76ba111b9404f86
	.xword	0x74c742ccf167ec86
	.xword	0x7a8b7a98dcab0ab1
	.xword	0x076b482e6c3a76bd
	.xword	0xe29606341ec020d8
	.xword	0xdf567f227572ffd5
	.xword	0xab041bfb7e2ef35c
	.xword	0x722500c817d677fc
	.xword	0x02fbab74ad07a3d9
	.xword	0x3156d1537c856f21
	.xword	0xa78b28b317cb886e
	.xword	0x467c014badddf95a
	.xword	0x6ccee62a2780708f
	.xword	0x080f577877ec8a6f
	.xword	0x1df4dfeb67f7ca69
	.xword	0xf62e82e31a3a91a4
	.xword	0xb1d343278365fd4e
	.xword	0x36364b72f21b708e
	.xword	0x7af426b29f2e9c4d
	.xword	0x75691f23340b5165
	.xword	0xbea4851ae0e35e59
	.xword	0x5f23c9c20f98aeae
	.xword	0xac2be09b4ef95d58
	.xword	0xb7b52974c20a9361
	.xword	0xfb6a5ee1169f0b4f
	.xword	0x0a73083ba405e473
	.xword	0x4c1dd98b3de36274
	.xword	0xb49564e7ab023fa2
	.xword	0x5672a8f798b763f7
	.xword	0x3dbf637383787185
	.xword	0xd7894031d8717e89
	.xword	0x1b47483c14d0bc66
	.xword	0xbcdce3a307b0bdc3
	.xword	0xf4de421ad5d29672
	.xword	0x1f7dce3e94956bf9
	.xword	0x4117e76d0471ac88
	.xword	0x36e1e2dc695c4de8
	.xword	0x509ab33a3ae78cdc
	.xword	0x645fe0960d74bd4d
	.xword	0xc299c1a5b9afeb39
	.xword	0xffeafe1986efec6d
	.xword	0xd7dd5ecda1c28f99
	.xword	0x97c651042f6887d6
	.xword	0xf0ed0b2ab97ddf8d
	.xword	0xbaac7ec09824ca6f
	.xword	0xab719854fceb74a2
	.xword	0xe4b04446343e82fb
	.xword	0x8ae7e1dd8f62c560
	.xword	0x3cc46fd920587e23
	.xword	0xd1579a1eb048cc82
	.xword	0xd2f02518ab62a55e
	.xword	0xdf3c3c0b61c33484
	.xword	0x4ccfe0be7c8d7886
	.xword	0xbe201b55c38da7e9
	.xword	0xe1bbfb90af3c0a85
	.xword	0x112325ce5d5a86f8
	.xword	0x3c03812fd57478b8
	.xword	0x0b54adeec0a05bfc
	.xword	0x00c19007d3d1a38e
	.xword	0x3036f0f8941411a4
	.xword	0x1e96b7a91781eadb
	.xword	0xbbadaa262fd3ff4a
	.xword	0x7095c30a007e504e
	.xword	0x748edb27f75b6075
	.xword	0x6be799a7199d3be2
	.xword	0x2195ec6e8913d795
	.xword	0xb91605861c89c3ee
	.xword	0x0a669e6db94f89aa
	.xword	0xdabeb65b2028c424
	.xword	0x2a3e5c5382a50930
	.xword	0x5728adaa5ec0f3c8
	.xword	0xdeae1c914930ddd2
	.xword	0x771c8c4ce0fa67cc
	.xword	0xdf6d1362cad3dd14
	.xword	0x53f574b5f65c0eb4
	.xword	0x2fdb6055527a2b4f
	.xword	0x526a607f6123e613
	.xword	0x21a0aaf347a84f6b
	.xword	0xadcd697c469cd404
	.xword	0xbe191fb09946203c
	.xword	0xf82f14571bd9c0cd
	.xword	0x0a77077ccf2d498a
	.xword	0x03671ab0912ea213
	.xword	0xdab2a5ced3157de8
	.xword	0x0c3d5459dd88fcc1
	.xword	0x8aaac8cc5315cc6f
	.xword	0xf05102adfbc841fb
	.xword	0x3d154617eba6c51d
	.xword	0x28dec94832b579dd
	.xword	0x0aee514bc75102f9
	.xword	0x0ec3201a5d60c746
	.xword	0x0fb7226899275884
	.xword	0xc4044d4e85824cad
	.xword	0x5902f71a5d6de5ab
	.xword	0x0ff4a2c2ad63c2b5
	.xword	0xa24707c83e7b7ffe
	.xword	0x89020025a3b8d105
	.xword	0x071ad86a76e6172f
	.xword	0xbd23c86c6e72b4de
	.align 0x80000
	.data
data_start_7:

	.xword	0x32ebe5fa8aa1f081
	.xword	0x1a3a1dbbf9d7ad02
	.xword	0x5eb180254988014a
	.xword	0x9764ad31c77b4a8f
	.xword	0x9c504ff2316e40c2
	.xword	0x5684420a6461a6cf
	.xword	0xbcd2e8c0e9b1321d
	.xword	0x608f334d8409c346
	.xword	0xad7fb7e51f1f1321
	.xword	0xf67590913b2e0540
	.xword	0xaf8b7cb3f2104eb3
	.xword	0x1812037d9199057b
	.xword	0xa1a5e82a0709c546
	.xword	0xea6254666d4d312c
	.xword	0xa5156afa9e301ce6
	.xword	0x729a280eebb7aded
	.xword	0xae8cd1841f14d806
	.xword	0x6c05b5eee41d7d31
	.xword	0x22ca28adf575a0ee
	.xword	0xf185bc4a2b215b8b
	.xword	0x959df83cba9ed113
	.xword	0x41685c0440d10a83
	.xword	0xd0251e009ec16680
	.xword	0x89c2dc167e3a450d
	.xword	0x6c286f90354a169a
	.xword	0xb5fbe7e95664c454
	.xword	0x27efd269062bf3f4
	.xword	0xad8b834078c793b5
	.xword	0x3cf5e45c1fe0775a
	.xword	0x3fdfe880dc5584ab
	.xword	0x9cab8a73399e5533
	.xword	0x268ab3890a3b94bf
	.xword	0xe06c2a029366d624
	.xword	0x807c63f0754e95e2
	.xword	0xb4ee42411bb98a71
	.xword	0xeea131dd688c0b80
	.xword	0xff277b7f5c22b81a
	.xword	0x794546b81fa20d25
	.xword	0x89b4bcfca501a30e
	.xword	0xa08904e8095298b7
	.xword	0x93a8604d7f4de899
	.xword	0x103fd3352c02b2e5
	.xword	0xe33c3e272281bb76
	.xword	0x9044b1e0292de4fa
	.xword	0x76f2ca915065d2e5
	.xword	0x8f53bdcf542e4fa7
	.xword	0x82c2865ad9f3e5e8
	.xword	0xf9536114497aa63d
	.xword	0x4b6d3e5afd92954e
	.xword	0x400993f35b79bdd0
	.xword	0x4ed64770ca237c99
	.xword	0x55f146df1d9f179e
	.xword	0x9e78064e6669f99f
	.xword	0xa88d140a95037e91
	.xword	0xb2c06b8349cb2652
	.xword	0xaa097d6104a94ba5
	.xword	0xc827035be1aa0332
	.xword	0xab8d0555de1255fc
	.xword	0xb2c68475f3dc7fe9
	.xword	0x3eb5efd789da1cbe
	.xword	0xad0369c6b5c1e307
	.xword	0x2757d8a2680c652e
	.xword	0x6db4070164eff5b2
	.xword	0x06228d8282e575b5
	.xword	0xee11891ea9931ed6
	.xword	0xf51ecc7e9bc2ea74
	.xword	0xc27c6a68a4041033
	.xword	0x7af974880b06b2f8
	.xword	0x047e0309ba7ffbf1
	.xword	0xa51aa6b2964bb142
	.xword	0x5c394f753fe70913
	.xword	0x46a8307f3e9de043
	.xword	0x65fc361e95f0c3ee
	.xword	0xe1be2e5080b5ab26
	.xword	0x2c95b78f696b2217
	.xword	0x3f317bb06cbffb0d
	.xword	0xd303ce65a920c1a4
	.xword	0xe099a6a061a4210b
	.xword	0xc19e57eff353b159
	.xword	0x63c8788e1005fbe1
	.xword	0x89eff5088d3f76b2
	.xword	0x98d5d97213bb348c
	.xword	0xaa7de7dab2b4ab89
	.xword	0xb7ad81d2071ade80
	.xword	0x2d671bb041f36828
	.xword	0xacf740187e57b4c1
	.xword	0x5a769c92ceb438d8
	.xword	0xfd433061a2814e35
	.xword	0x415c210f7e7ed8e0
	.xword	0x085fca7b9ac75fb4
	.xword	0x27ec5c5870072aa9
	.xword	0x98a607ab88fbe404
	.xword	0x2f479aaa279931d8
	.xword	0xea176842827d2bc3
	.xword	0xb503c6f5d3833848
	.xword	0x31634ce4f343af17
	.xword	0xe741796b4cb4a795
	.xword	0x6a68e551326590a2
	.xword	0xd381903e0e9a0cf5
	.xword	0xe0a5dc2f64df7f31
	.xword	0x8b5e69fab8517417
	.xword	0x36adb1165cc81f03
	.xword	0x3f8f38ce9aa170fc
	.xword	0x370d799dc5aeacf1
	.xword	0x6729216039863d02
	.xword	0x719b70696cd77420
	.xword	0x36e4332076dd9ec9
	.xword	0xaee076bef05830ae
	.xword	0x40861c18b922acc8
	.xword	0x2b405d20dcb86862
	.xword	0xd0bb06da970d4313
	.xword	0xfe2ba2d20b898cb9
	.xword	0x95195e26c064861a
	.xword	0x436a27905aab99aa
	.xword	0x9b79474ede12461d
	.xword	0x53197c95eb84a8ee
	.xword	0x4b1e725c2e709709
	.xword	0xbc85cd9f028f8869
	.xword	0x7a7f0805bd3ccb27
	.xword	0x391ae83b06ddc020
	.xword	0x058d52d9a545bdbb
	.xword	0xd0d7e4632c74a618
	.xword	0xa5db00a60c76ca73
	.xword	0xe487fc734cb8e5bd
	.xword	0x6b9adaee0fec7877
	.xword	0x0f957e0f913ba345
	.xword	0xdee9677ae0ba3756
	.xword	0x37340acd1168141c
	.xword	0xc684b690ca7a6b8c
	.xword	0x64e7c42120ae384b
	.xword	0x4fedf1d4ccb5d9df
	.xword	0x27f64db09760871f
	.xword	0xbc68a660c5d61520
	.xword	0x89bcf576d319af8a
	.xword	0xbd40b53084378eea
	.xword	0x9d6dd34bf822b874
	.xword	0x14a03d6108a0105b
	.xword	0x0faba4957727010f
	.xword	0xcfacd321462f4df0
	.xword	0xd278dd6e1c150c5d
	.xword	0x3b84bb6898ef5170
	.xword	0xc36bb08ecde1715a
	.xword	0xce9e2f7188b5de91
	.xword	0x1b7dee5860d35857
	.xword	0x4609a3dfec6b5d67
	.xword	0x9ef84c7add031ac8
	.xword	0x627ebd672839dfec
	.xword	0x62c65b9f7dee68d8
	.xword	0x66413a313f26ca16
	.xword	0x9656f597e82a432c
	.xword	0x61a1fed8b820bf89
	.xword	0xb5f2bae2c5c2b244
	.xword	0x030df396ef5c1223
	.xword	0xd12ae89d485eaa2d
	.xword	0xbcd21e4d330357c0
	.xword	0x5aa2ce302de36107
	.xword	0xdbed68b07de4a2f5
	.xword	0x69770b704b8c019c
	.xword	0x27601de0ff099573
	.xword	0x9e471ce4a2b8a4f2
	.xword	0x5ac3766b43453e1c
	.xword	0x4103ab652fff0341
	.xword	0x7b4c0813187caaee
	.xword	0xa126536e0a0194eb
	.xword	0xebc0f840265c2ad9
	.xword	0xd697aaf588be3948
	.xword	0xa8c70677ad31ebaa
	.xword	0x2c2f1d1512552116
	.xword	0x7c1d7a71731fca5b
	.xword	0x6ed2fdd7d4b4f9be
	.xword	0xf1c7e602b4f0fcfa
	.xword	0x6926ad83d25e2bac
	.xword	0x90c3233d844ee89d
	.xword	0x99ffe7659cd0c38e
	.xword	0xf0e6df538433ba92
	.xword	0xd119eaa026d26770
	.xword	0xc7ebd3334733a1ae
	.xword	0x688867bae25276c9
	.xword	0xa9b92c7652614f40
	.xword	0x37793964bd678ca8
	.xword	0x965a742d7c26590b
	.xword	0x719bdc094206fc68
	.xword	0x41067b21d6614ea2
	.xword	0x8971265789310cb6
	.xword	0x161db7d8e48fda13
	.xword	0x700972f1243af589
	.xword	0x49f1e97c107991c7
	.xword	0x787bd08364c30311
	.xword	0x64a9ef7e802bbc0b
	.xword	0xd2e622f756422f59
	.xword	0xf180e181854dc0c5
	.xword	0xbd2240806496a512
	.xword	0x9d75344e195c567b
	.xword	0xea9edf43a9208a12
	.xword	0xd584f64702d43b7a
	.xword	0x25f069608fb63dfc
	.xword	0xa3a6122caa3e3f33
	.xword	0xf9a4d2452828e1b2
	.xword	0x155a81bb2fc28eac
	.xword	0x97ef96af8ad1ffa6
	.xword	0x02a8d59cc21263be
	.xword	0x08d1a3b9a1961e4b
	.xword	0xe08029b523386b07
	.xword	0xc56af2177cd77254
	.xword	0x351a674100d6125a
	.xword	0xf259cdc131ac81c8
	.xword	0x87892b3bf631f8ad
	.xword	0xf64a64c99629b2e2
	.xword	0xd00a67bc0ed1c177
	.xword	0x6f89508c8f653782
	.xword	0xef7fd580506754ab
	.xword	0xea668ee4363630f9
	.xword	0x69e04b4f91449090
	.xword	0x3c8e4239033cbd22
	.xword	0x484628c60deea5e6
	.xword	0x5a88717085bebb6b
	.xword	0xc6708ae19d6089da
	.xword	0xa2171cb4cb63ac4c
	.xword	0xee59f03230e47b33
	.xword	0xbe487a70d7d5e994
	.xword	0xe1b61f8e9757502f
	.xword	0xd999dcb6215cae9e
	.xword	0x5e9005bf3a104cd6
	.xword	0x8cea0ae67f95b17a
	.xword	0x92255d27cc8e2a50
	.xword	0x738f13bce8fe338d
	.xword	0x3278a0a0c82e3bf2
	.xword	0x6637c82918f57271
	.xword	0xafef56d2e99691f0
	.xword	0xdceade1f968aacca
	.xword	0x022bfdb63b13a92e
	.xword	0x66ce02322a818628
	.xword	0xf28ab1a413414289
	.xword	0xe430662d713ccc87
	.xword	0x142b537bb1d65035
	.xword	0xa48a5d13431a276c
	.xword	0x76eb116ab8643a87
	.xword	0x8e0ac82c79e01698
	.xword	0xe3b0b8aa25cb6a33
	.xword	0x688360a383d484e9
	.xword	0x7a97c11b91ee4346
	.xword	0xbfd25fd905027362
	.xword	0x64b52a5c0f77a09e
	.xword	0xbb100db937ce5ad7
	.xword	0x8744872b4a4cf0c4
	.xword	0x5ceed7b96348f2ed
	.xword	0x5195691ac5747ed7
	.xword	0x721f6a8ba40b2ffe
	.xword	0xf13aa68d81607c15
	.xword	0xd4dc5ccc08fd1f1c
	.xword	0xd908f028f2b70522
	.xword	0x63cab27a1808fb9b
	.xword	0xb5ba74de9c24f70d
	.xword	0x0d10ddd2d4d7af0e
	.xword	0x37fee36ef692010d
	.xword	0xcbba1544d64b9da9



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
