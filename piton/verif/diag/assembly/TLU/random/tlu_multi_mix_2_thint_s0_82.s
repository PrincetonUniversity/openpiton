// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_82.s
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
   random seed:	803677713
   Jal tlu_multi_mix_2_thint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
        rdpr    %tpc, %g1; \
        rdpr    %tnpc, %g2; \
        rdpr    %tstate, %g3; \
        rdpr    %gl, %g4; \
        rdpr    %tl, %g5; \
        rdhpr   %htstate, %g6; \
        nop; \
        done

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x2dddff4c5a5d68da, %g1, %g0
	setx 0x71d4fc5249b751c8, %g1, %g1
	setx 0xbedb29d88231a8b8, %g1, %g2
	setx 0x6c223624fcf78c8e, %g1, %g3
	setx 0xfb9d6d9cb455a3b9, %g1, %g4
	setx 0x106eb573a126dac4, %g1, %g5
	setx 0x9cea5e5b3e609da3, %g1, %g6
	setx 0x2fea86412a872270, %g1, %g7
	setx 0x3931778d0cdfdf8d, %g1, %r16
	setx 0x09b32f23ffc714b8, %g1, %r17
	setx 0xa5c4c213028a0a5b, %g1, %r18
	setx 0xe74cb54b8928836d, %g1, %r19
	setx 0x0b7805fc048be18a, %g1, %r20
	setx 0xc7df327f56ef4486, %g1, %r21
	setx 0x61d67c215e1395e7, %g1, %r22
	setx 0x109bd7476b2d570e, %g1, %r23
	setx 0x1ede006de53f2366, %g1, %r24
	setx 0x29ed87e2a1cfe30b, %g1, %r25
	setx 0xc4b931124fc0bc83, %g1, %r26
	setx 0x687f317955feb2c3, %g1, %r27
	setx 0x4763f8f9c3264533, %g1, %r28
	setx 0x41c2506cc02e03a2, %g1, %r29
	setx 0x52c00a2a9b9acbe6, %g1, %r30
	setx 0x3f4a3c6ec022e901, %g1, %r31
	save
	setx 0x9dd7218bf63ed6d5, %g1, %r16
	setx 0x892e27780d512366, %g1, %r17
	setx 0xdb1242d086fa8c21, %g1, %r18
	setx 0xdc5ba5e045d2bb43, %g1, %r19
	setx 0xe6405f03028ada02, %g1, %r20
	setx 0x205622566746bdee, %g1, %r21
	setx 0x27f494fe7e92b4ce, %g1, %r22
	setx 0x9fa1044124a8abb2, %g1, %r23
	setx 0x369bd5e3303776f0, %g1, %r24
	setx 0x7c51a13814205721, %g1, %r25
	setx 0xedcf12e6783fb4f1, %g1, %r26
	setx 0x9e578b969a8b2241, %g1, %r27
	setx 0xbe9992d683235a70, %g1, %r28
	setx 0x6c1ab6ec1732fa46, %g1, %r29
	setx 0x65125b1e5ec1aedd, %g1, %r30
	setx 0xbf27cd137947f185, %g1, %r31
	save
	setx 0x97d81da188b485ca, %g1, %r16
	setx 0x2c8ba4327a261c86, %g1, %r17
	setx 0x6b25d766de36eeec, %g1, %r18
	setx 0x2242b57c9f23e08a, %g1, %r19
	setx 0x31bad67704f5114b, %g1, %r20
	setx 0x925d95952eaeba24, %g1, %r21
	setx 0x9c164f90508013c2, %g1, %r22
	setx 0x9ae77c56fe27eb25, %g1, %r23
	setx 0xbd9427a132d5004b, %g1, %r24
	setx 0x4a48ab8a46345aa1, %g1, %r25
	setx 0x01a0c5825221c6e3, %g1, %r26
	setx 0x0b7b49a6a3fd36ec, %g1, %r27
	setx 0xcb6ea2667a0c8e84, %g1, %r28
	setx 0xbdb50b74d5901c06, %g1, %r29
	setx 0x156597ac197a0fdd, %g1, %r30
	setx 0xe47304b69ca30d0a, %g1, %r31
	save
	setx 0x7d265b48922f27ac, %g1, %r16
	setx 0xbbf76362cd555561, %g1, %r17
	setx 0xadf1030e67d43431, %g1, %r18
	setx 0xd75f397378f2e802, %g1, %r19
	setx 0xd7259ef90c8292ed, %g1, %r20
	setx 0xfd26ef1e6eb44cad, %g1, %r21
	setx 0x9017a9aeef51969d, %g1, %r22
	setx 0xf0fbacdf7470104e, %g1, %r23
	setx 0xff7c312da8d6278f, %g1, %r24
	setx 0xaa6195de2860c5dd, %g1, %r25
	setx 0xda0298cdc5491f3c, %g1, %r26
	setx 0x77e25a3c8627cc2e, %g1, %r27
	setx 0x74185d4d08a2d03d, %g1, %r28
	setx 0x254c0984f74ba9d6, %g1, %r29
	setx 0x182cbe07652a3d2c, %g1, %r30
	setx 0xcf94942401297142, %g1, %r31
	save
	setx 0x244e5c0cefe90229, %g1, %r16
	setx 0xf389e6b1d877387b, %g1, %r17
	setx 0x591a92c68b834fdb, %g1, %r18
	setx 0xc30c4bc0454243d5, %g1, %r19
	setx 0xe0fb50d55ffa16c0, %g1, %r20
	setx 0x6e56866da208d18a, %g1, %r21
	setx 0x69343fa16f56d8b0, %g1, %r22
	setx 0x4bf7e9397b30ffee, %g1, %r23
	setx 0x49626d6e4b369530, %g1, %r24
	setx 0x673a8320e9a1c3d6, %g1, %r25
	setx 0x16647a50a427ff2d, %g1, %r26
	setx 0xeeb36bd8779062b7, %g1, %r27
	setx 0xae8a89350a65ba04, %g1, %r28
	setx 0x6512d76871766d80, %g1, %r29
	setx 0xc1eb89a9424121fb, %g1, %r30
	setx 0x57db5cfb6ad74376, %g1, %r31
	save
	setx 0xa18d9fa27cfdfdad, %g1, %r16
	setx 0x2bdb968db5ad0b08, %g1, %r17
	setx 0x59567f13aff12304, %g1, %r18
	setx 0x4205ab5e8243c688, %g1, %r19
	setx 0xc4652eebc28ae60e, %g1, %r20
	setx 0xfae35893dc658b00, %g1, %r21
	setx 0x0a048aa75cc248a2, %g1, %r22
	setx 0x83e198ee016daf59, %g1, %r23
	setx 0x250550b070185072, %g1, %r24
	setx 0x0c07fccbf972880f, %g1, %r25
	setx 0xcc57db6c2f3b54ab, %g1, %r26
	setx 0xbd1a3f336c97168a, %g1, %r27
	setx 0xef6d4df7be3454cc, %g1, %r28
	setx 0x96138ab960438a58, %g1, %r29
	setx 0x3e5bfb47e3bf5720, %g1, %r30
	setx 0xe370b3c2bd0733ac, %g1, %r31
	save
	setx 0xe043f1d1c6433eb4, %g1, %r16
	setx 0x62013efdce7012cf, %g1, %r17
	setx 0x4430cd048f1e04bd, %g1, %r18
	setx 0xbf110eab1bc045d9, %g1, %r19
	setx 0x3c0849005a0dd1ef, %g1, %r20
	setx 0x71af3480c6a60c80, %g1, %r21
	setx 0x2c506ca7b47f2886, %g1, %r22
	setx 0x5d1967b4c46638bc, %g1, %r23
	setx 0x3f756b5715179359, %g1, %r24
	setx 0x0d654766c29875fc, %g1, %r25
	setx 0x61d1e48be30cbf8f, %g1, %r26
	setx 0x9519082bdf3b8367, %g1, %r27
	setx 0xbc06068d533390e3, %g1, %r28
	setx 0xa21c73f099f8eb68, %g1, %r29
	setx 0x8b565c1bb78a138f, %g1, %r30
	setx 0xa9d6407ca11ad5df, %g1, %r31
	save
	setx 0xedacb150ef1cc5df, %g1, %r16
	setx 0x3f1aa68ad8265a86, %g1, %r17
	setx 0x0fd9e00e14cf39bb, %g1, %r18
	setx 0xa4820c72b7e7bd2d, %g1, %r19
	setx 0xee1a35117a052d9b, %g1, %r20
	setx 0x1a6a489326f7f3c7, %g1, %r21
	setx 0x2df2e0138b35f9ee, %g1, %r22
	setx 0x94d07ee6c4bace15, %g1, %r23
	setx 0xc7dc55bad81f985b, %g1, %r24
	setx 0xdef8487d14790478, %g1, %r25
	setx 0x7e9b7a457fec7ac8, %g1, %r26
	setx 0x15cfc66092434a60, %g1, %r27
	setx 0xfb22d7e0ec55d9bb, %g1, %r28
	setx 0xa0764e387a67f723, %g1, %r29
	setx 0x02add82f911ae623, %g1, %r30
	setx 0x682784277927da98, %g1, %r31
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
	.word 0xbc44c000  ! 1: ADDC_R	addc 	%r19, %r0, %r30
	.word 0xbde4a1f8  ! 7: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb12de001  ! 8: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xb3e46167  ! 10: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e4605c  ! 11: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe5211e  ! 24: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe5209d  ! 25: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5e1a4  ! 27: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x819421ca  ! 29: WRPR_TPC_I	wrpr	%r16, 0x01ca, %tpc
	.word 0xb5e5e107  ! 35: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e4a1ce  ! 36: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb6144000  ! 40: OR_R	or 	%r17, %r0, %r27
	.word 0xbfe5e1f6  ! 41: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3e5a1ce  ! 49: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5a057  ! 51: SAVE_I	save	%r22, 0x0001, %r28
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e114  ! 54: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e5a1cd  ! 55: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3518000  ! 56: RDPR_PSTATE	<illegal instruction>
	.word 0xbde560bc  ! 57: SAVE_I	save	%r21, 0x0001, %r30
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9de090  ! 62: XORcc_I	xorcc 	%r23, 0x0090, %r29
	.word 0xbfe420a0  ! 64: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e520f4  ! 68: SAVE_I	save	%r20, 0x0001, %r25
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 70: RDPR_TT	<illegal instruction>
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52069  ! 74: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394608d  ! 78: WRPR_TNPC_I	wrpr	%r17, 0x008d, %tnpc
	.word 0xbd540000  ! 80: RDPR_GL	<illegal instruction>
	.word 0x899460dc  ! 82: WRPR_TICK_I	wrpr	%r17, 0x00dc, %tick
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1a3  ! 85: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe52148  ! 87: SAVE_I	save	%r20, 0x0001, %r31
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83942035  ! 90: WRPR_TNPC_I	wrpr	%r16, 0x0035, %tnpc
	.word 0xb0a40000  ! 92: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0xbde4217f  ! 95: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde4e1c5  ! 102: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4a074  ! 106: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe5a144  ! 109: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e56044  ! 112: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e4a1ae  ! 114: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e14e  ! 116: SAVE_I	save	%r23, 0x0001, %r28
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395e116  ! 128: WRPR_TNPC_I	wrpr	%r23, 0x0116, %tnpc
	mov	2, %r12
	.word 0xa1930000  ! 129: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795a112  ! 131: WRPR_TT_I	wrpr	%r22, 0x0112, %tt
	.word 0x8395a1a2  ! 133: WRPR_TNPC_I	wrpr	%r22, 0x01a2, %tnpc
	.word 0xb5e56100  ! 135: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb32df001  ! 136: SLLX_I	sllx	%r23, 0x0001, %r25
	.word 0xba35e059  ! 139: SUBC_I	orn 	%r23, 0x0059, %r29
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0a9  ! 144: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e460fb  ! 145: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe4e15d  ! 147: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_1, %g1, %r18
	.word 0xb7e52040  ! 150: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5e1b2  ! 152: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e52066  ! 155: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c0000  ! 158: XOR_R	xor 	%r16, %r0, %r26
	.word 0xbbe56007  ! 159: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x819561fc  ! 163: WRPR_TPC_I	wrpr	%r21, 0x01fc, %tpc
	.word 0xb1e42034  ! 164: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5e113  ! 165: SAVE_I	save	%r23, 0x0001, %r31
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabd8000  ! 170: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xb1e5e06e  ! 172: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e4a1f2  ! 174: SAVE_I	save	%r18, 0x0001, %r28
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 182: RDPR_TICK	<illegal instruction>
	.word 0xb7e561c5  ! 183: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8194e09a  ! 189: WRPR_TPC_I	wrpr	%r19, 0x009a, %tpc
	.word 0x899561fe  ! 190: WRPR_TICK_I	wrpr	%r21, 0x01fe, %tick
	.word 0xb9e56087  ! 191: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_4, %g1, %r23
	.word 0xb9e5a161  ! 196: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e4a0fc  ! 197: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb8b46084  ! 198: SUBCcc_I	orncc 	%r17, 0x0084, %r28
	setx	data_start_3, %g1, %r17
	.word 0xbe052186  ! 200: ADD_I	add 	%r20, 0x0186, %r31
	.word 0x8394e127  ! 202: WRPR_TNPC_I	wrpr	%r19, 0x0127, %tnpc
	.word 0xb1e5e194  ! 203: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e56050  ! 205: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5e174  ! 206: SAVE_I	save	%r23, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 209: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8994a11c  ! 213: WRPR_TICK_I	wrpr	%r18, 0x011c, %tick
	.word 0xb3e5e022  ! 215: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8394a0fe  ! 216: WRPR_TNPC_I	wrpr	%r18, 0x00fe, %tnpc
	setx	data_start_5, %g1, %r19
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 220: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7518000  ! 222: RDPR_PSTATE	<illegal instruction>
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 230: RDPR_TL	<illegal instruction>
	.word 0xbc25a0e9  ! 232: SUB_I	sub 	%r22, 0x00e9, %r30
	.word 0xbb500000  ! 237: RDPR_TPC	<illegal instruction>
	.word 0xb9e4e12c  ! 238: SAVE_I	save	%r19, 0x0001, %r28
	setx	0xbe5565d0000cbc9, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e5a111  ! 240: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e4e158  ! 241: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8194205c  ! 251: WRPR_TPC_I	wrpr	%r16, 0x005c, %tpc
	.word 0xb9540000  ! 254: RDPR_GL	<illegal instruction>
	.word 0xb3e5213c  ! 260: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x89952169  ! 261: WRPR_TICK_I	wrpr	%r20, 0x0169, %tick
	.word 0xbbe560c5  ! 262: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8d94604c  ! 267: WRPR_PSTATE_I	wrpr	%r17, 0x004c, %pstate
	.word 0xbbe4a0ca  ! 270: SAVE_I	save	%r18, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 271: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe5e1ea  ! 275: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe4218c  ! 276: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5510000  ! 279: RDPR_TICK	<illegal instruction>
	.word 0xbde5204f  ! 280: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb6b5218c  ! 281: SUBCcc_I	orncc 	%r20, 0x018c, %r27
	.word 0xb5e5e19d  ! 284: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x91956095  ! 286: WRPR_PIL_I	wrpr	%r21, 0x0095, %pil
	.word 0xbd500000  ! 289: RDPR_TPC	<illegal instruction>
	.word 0xbbe4e191  ! 291: SAVE_I	save	%r19, 0x0001, %r29
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 297: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 299: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb0a40000  ! 303: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0xbe244000  ! 304: SUB_R	sub 	%r17, %r0, %r31
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 308: RDPR_TPC	<illegal instruction>
	.word 0x8794a197  ! 311: WRPR_TT_I	wrpr	%r18, 0x0197, %tt
	.word 0xb7e5200b  ! 313: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x839461d6  ! 315: WRPR_TNPC_I	wrpr	%r17, 0x01d6, %tnpc
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560d5  ! 320: SAVE_I	save	%r21, 0x0001, %r24
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e421cf  ! 322: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e5e1b3  ! 323: SAVE_I	save	%r23, 0x0001, %r26
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a158  ! 326: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe4e00e  ! 329: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb0bd605e  ! 330: XNORcc_I	xnorcc 	%r21, 0x005e, %r24
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4201a  ! 332: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8d952085  ! 336: WRPR_PSTATE_I	wrpr	%r20, 0x0085, %pstate
	.word 0xbbe4a166  ! 338: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5e14e  ! 340: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9510000  ! 342: RDPR_TICK	<illegal instruction>
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560d9  ! 347: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8795e0a8  ! 348: WRPR_TT_I	wrpr	%r23, 0x00a8, %tt
	.word 0xbde52073  ! 349: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e4a004  ! 353: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e5a03d  ! 354: SAVE_I	save	%r22, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 355: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e4e06f  ! 356: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x85956073  ! 361: WRPR_TSTATE_I	wrpr	%r21, 0x0073, %tstate
	setx	data_start_5, %g1, %r19
	.word 0xb9e56197  ! 364: SAVE_I	save	%r21, 0x0001, %r28
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e420a8  ! 371: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e5a142  ! 376: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4e057  ! 378: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5e09f  ! 379: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46041  ! 383: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe5a0ff  ! 384: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8195a02b  ! 385: WRPR_TPC_I	wrpr	%r22, 0x002b, %tpc
	.word 0xb1480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9e42138  ! 388: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4201a  ! 394: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb69c4000  ! 407: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xb7e520e9  ! 410: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb02521b5  ! 411: SUB_I	sub 	%r20, 0x01b5, %r24
	setx	0x9021347c0000eac5, %g1, %r10
	.word 0x839a8000  ! 412: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 417: RDPR_TICK	<illegal instruction>
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a03b  ! 429: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8794e155  ! 435: WRPR_TT_I	wrpr	%r19, 0x0155, %tt
	.word 0x8594e098  ! 436: WRPR_TSTATE_I	wrpr	%r19, 0x0098, %tstate
	.word 0xbbe4e16c  ! 437: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1500000  ! 440: RDPR_TPC	<illegal instruction>
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42014  ! 443: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde520d3  ! 445: SAVE_I	save	%r20, 0x0001, %r30
	setx	0xcbc585010000cb4b, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e5e166  ! 447: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb2156182  ! 449: OR_I	or 	%r21, 0x0182, %r25
	.word 0xb9e5215c  ! 450: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x800de42c0000dd4c, %g1, %r10
	.word 0x819a8000  ! 453: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe560a0  ! 457: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbb480000  ! 460: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xba05219c  ! 461: ADD_I	add 	%r20, 0x019c, %r29
	.word 0xb9e5216d  ! 471: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4a140  ! 475: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb495612f  ! 476: ORcc_I	orcc 	%r21, 0x012f, %r26
	.word 0xb7e4203a  ! 478: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e421ba  ! 479: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5606c  ! 480: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e5a1f8  ! 481: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde421a2  ! 483: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5a15a  ! 485: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x81946152  ! 487: WRPR_TPC_I	wrpr	%r17, 0x0152, %tpc
	setx	0x6bf22bb300008bc4, %g1, %r10
	.word 0x839a8000  ! 493: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795a187  ! 495: WRPR_TT_I	wrpr	%r22, 0x0187, %tt
	.word 0xbde421c0  ! 501: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9510000  ! 503: RDPR_TICK	<illegal instruction>
	.word 0xb1e5e1d3  ! 504: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb0b50000  ! 505: ORNcc_R	orncc 	%r20, %r0, %r24
	.word 0xbf7c6401  ! 513: MOVR_I	movre	%r17, 0x1, %r31
	.word 0xb7e521ca  ! 514: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb0840000  ! 518: ADDcc_R	addcc 	%r16, %r0, %r24
	.word 0xbb500000  ! 519: RDPR_TPC	<illegal instruction>
	.word 0xb3e4e029  ! 521: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_1, %g1, %r21
	.word 0xbde5a126  ! 525: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e5a159  ! 526: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe5a104  ! 527: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e0e7  ! 532: SAVE_I	save	%r19, 0x0001, %r28
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e12d  ! 536: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e4e0bc  ! 542: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4e018  ! 544: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb37c8400  ! 546: MOVR_R	movre	%r18, %r0, %r25
	.word 0x81956019  ! 547: WRPR_TPC_I	wrpr	%r21, 0x0019, %tpc
	setx	0xbb8453ac00000e87, %g1, %r10
	.word 0x819a8000  ! 551: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb504000  ! 553: RDPR_TNPC	<illegal instruction>
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56182  ! 556: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5540000  ! 557: RDPR_GL	<illegal instruction>
	.word 0x91952043  ! 558: WRPR_PIL_I	wrpr	%r20, 0x0043, %pil
	.word 0xb3e56083  ! 559: SAVE_I	save	%r21, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 561: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e421df  ! 563: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb225c000  ! 565: SUB_R	sub 	%r23, %r0, %r25
	.word 0xb48dc000  ! 568: ANDcc_R	andcc 	%r23, %r0, %r26
	.word 0xb9e42088  ! 569: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe56024  ! 570: SAVE_I	save	%r21, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0d3  ! 576: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb2958000  ! 581: ORcc_R	orcc 	%r22, %r0, %r25
	.word 0xbbe46111  ! 583: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5e15b  ! 586: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e4607d  ! 587: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e5e072  ! 588: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e4a1d6  ! 589: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_5, %g1, %r16
	.word 0xb1342001  ! 591: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xb5e461b2  ! 592: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8594a020  ! 593: WRPR_TSTATE_I	wrpr	%r18, 0x0020, %tstate
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 600: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1518000  ! 603: RDPR_PSTATE	<illegal instruction>
	.word 0xb750c000  ! 606: RDPR_TT	<illegal instruction>
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94e0a6  ! 611: WRPR_PSTATE_I	wrpr	%r19, 0x00a6, %pstate
	.word 0xb7641800  ! 612: MOVcc_R	<illegal instruction>
	setx	0x1b4966360000dacf, %g1, %r10
	.word 0x819a8000  ! 617: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb0854000  ! 618: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xb7e5a0b4  ! 619: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0x91946186  ! 624: WRPR_PIL_I	wrpr	%r17, 0x0186, %pil
	.word 0xb7e461c1  ! 625: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e520d9  ! 626: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4200f  ! 628: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbc140000  ! 629: OR_R	or 	%r16, %r0, %r30
	.word 0xb1e420bd  ! 632: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e0fd  ! 636: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e461ce  ! 639: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e56072  ! 640: SAVE_I	save	%r21, 0x0001, %r28
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 647: RDPR_GL	<illegal instruction>
	.word 0xbf51c000  ! 654: RDPR_TL	<illegal instruction>
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43dc000  ! 662: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xb0b4e1da  ! 663: SUBCcc_I	orncc 	%r19, 0x01da, %r24
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4254000  ! 679: SUB_R	sub 	%r21, %r0, %r26
	.word 0xbde52124  ! 680: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5a1c6  ! 682: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4207f  ! 684: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde4e10f  ! 686: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e46033  ! 689: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbf480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe420b7  ! 696: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5504000  ! 697: RDPR_TNPC	<illegal instruction>
	.word 0xbde421ec  ! 699: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb4448000  ! 701: ADDC_R	addc 	%r18, %r0, %r26
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	.word 0xbbe4e19a  ! 713: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb2b48000  ! 717: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xb01d0000  ! 718: XOR_R	xor 	%r20, %r0, %r24
	.word 0xb335e001  ! 722: SRL_I	srl 	%r23, 0x0001, %r25
	.word 0xbde5e014  ! 727: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe42135  ! 728: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb695e030  ! 729: ORcc_I	orcc 	%r23, 0x0030, %r27
	.word 0xbfe4a123  ! 730: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e46046  ! 734: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb8a5603a  ! 735: SUBcc_I	subcc 	%r21, 0x003a, %r28
	.word 0xbbe4a08f  ! 737: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0xbfe4214b  ! 748: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5a1de  ! 749: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3346001  ! 753: SRL_I	srl 	%r17, 0x0001, %r25
	.word 0xbfe4e0a8  ! 755: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xba340000  ! 756: SUBC_R	orn 	%r16, %r0, %r29
	.word 0xb12dc000  ! 761: SLL_R	sll 	%r23, %r0, %r24
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2c8000  ! 769: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xb1e4e1c7  ! 770: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e46197  ! 772: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1510000  ! 775: RDPR_TICK	<illegal instruction>
	.word 0xb9e5a068  ! 777: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4e0cc  ! 779: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb12cd000  ! 781: SLLX_R	sllx	%r19, %r0, %r24
	.word 0x8395e005  ! 782: WRPR_TNPC_I	wrpr	%r23, 0x0005, %tnpc
	.word 0xb7e4e107  ! 785: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb150c000  ! 788: RDPR_TT	<illegal instruction>
	.word 0xb7e56013  ! 789: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8595a0aa  ! 790: WRPR_TSTATE_I	wrpr	%r22, 0x00aa, %tstate
	.word 0xbd50c000  ! 791: RDPR_TT	<illegal instruction>
	.word 0xb3e461bb  ! 792: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbd510000  ! 795: RDPR_TICK	<illegal instruction>
	.word 0x8394a169  ! 799: WRPR_TNPC_I	wrpr	%r18, 0x0169, %tnpc
	.word 0xb1e4a15c  ! 802: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x9194a159  ! 803: WRPR_PIL_I	wrpr	%r18, 0x0159, %pil
	.word 0xbbe46149  ! 804: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8394217b  ! 805: WRPR_TNPC_I	wrpr	%r16, 0x017b, %tnpc
	.word 0xb9508000  ! 809: RDPR_TSTATE	<illegal instruction>
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560de  ! 811: SAVE_I	save	%r21, 0x0001, %r24
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395a044  ! 813: WRPR_TNPC_I	wrpr	%r22, 0x0044, %tnpc
	.word 0xbde4a14d  ! 814: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_3, %g1, %r22
	.word 0xbbe421eb  ! 818: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbb3c1000  ! 822: SRAX_R	srax	%r16, %r0, %r29
	.word 0x89942069  ! 824: WRPR_TICK_I	wrpr	%r16, 0x0069, %tick
	setx	data_start_4, %g1, %r16
	.word 0xb9e4205e  ! 833: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde560ce  ! 834: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e42195  ! 835: SAVE_I	save	%r16, 0x0001, %r25
	mov	1, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4607d  ! 839: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8194e16c  ! 840: WRPR_TPC_I	wrpr	%r19, 0x016c, %tpc
	.word 0xbab54000  ! 842: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xb1e52097  ! 844: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb750c000  ! 846: RDPR_TT	<illegal instruction>
	.word 0x8d94e1d6  ! 849: WRPR_PSTATE_I	wrpr	%r19, 0x01d6, %pstate
	.word 0xb3e4e0bb  ! 851: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1504000  ! 852: RDPR_TNPC	<illegal instruction>
	.word 0xb3e52139  ! 854: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb29d20f4  ! 856: XORcc_I	xorcc 	%r20, 0x00f4, %r25
	.word 0xb0c521cf  ! 857: ADDCcc_I	addccc 	%r20, 0x01cf, %r24
	.word 0xbfe56181  ! 858: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e520e8  ! 860: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1ca  ! 865: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42131  ! 870: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbe2d0000  ! 871: ANDN_R	andn 	%r20, %r0, %r31
	.word 0xb17d0400  ! 873: MOVR_R	movre	%r20, %r0, %r24
	.word 0xb9e5a062  ! 875: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4a110  ! 876: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe521d3  ! 877: SAVE_I	save	%r20, 0x0001, %r31
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	setx	0xbed46b6e0000aa89, %g1, %r10
	.word 0x839a8000  ! 883: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e520ac  ! 884: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 888: RDPR_TL	<illegal instruction>
	.word 0xb614c000  ! 889: OR_R	or 	%r19, %r0, %r27
	setx	0x2654859e0000cd03, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde5e03f  ! 894: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e46190  ! 897: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e4e1be  ! 900: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8994a18d  ! 901: WRPR_TICK_I	wrpr	%r18, 0x018d, %tick
	.word 0xb9510000  ! 902: RDPR_TICK	<illegal instruction>
	.word 0x8194609c  ! 906: WRPR_TPC_I	wrpr	%r17, 0x009c, %tpc
	.word 0xbc9d8000  ! 907: XORcc_R	xorcc 	%r22, %r0, %r30
	.word 0xbf510000  ! 910: RDPR_TICK	<illegal instruction>
	.word 0xb150c000  ! 912: RDPR_TT	<illegal instruction>
	setx	0x33dfb8c30000e912, %g1, %r10
	.word 0x819a8000  ! 914: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a002  ! 918: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5e182  ! 919: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e420d6  ! 923: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e420b2  ! 925: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e420e0  ! 926: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe4a1cf  ! 928: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4204d  ! 930: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb480000  ! 931: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb1e420bf  ! 933: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 938: MOVcc_R	<illegal instruction>
	.word 0xbbe42071  ! 939: SAVE_I	save	%r16, 0x0001, %r29
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42071  ! 941: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x859421f3  ! 943: WRPR_TSTATE_I	wrpr	%r16, 0x01f3, %tstate
	.word 0xbfe4a19e  ! 944: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe56125  ! 949: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde46097  ! 950: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e461ca  ! 953: SAVE_I	save	%r17, 0x0001, %r28
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	setx	0x1a3dd19800008dde, %g1, %r10
	.word 0x839a8000  ! 961: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb6942022  ! 962: ORcc_I	orcc 	%r16, 0x0022, %r27
	.word 0xb9e4a123  ! 967: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x24fa637c00001f87, %g1, %r10
	.word 0x819a8000  ! 971: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879560aa  ! 972: WRPR_TT_I	wrpr	%r21, 0x00aa, %tt
	.word 0xb1e4e139  ! 975: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x83952073  ! 980: WRPR_TNPC_I	wrpr	%r20, 0x0073, %tnpc
	.word 0xbfe4615c  ! 981: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb68ca164  ! 983: ANDcc_I	andcc 	%r18, 0x0164, %r27
	.word 0xbd508000  ! 984: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5a0a6  ! 987: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde461b4  ! 992: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5a1f9  ! 993: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1480000  ! 994: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
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
	.word 0xb4448000  ! 1: ADDC_R	addc 	%r18, %r0, %r26
	.word 0xf63c61ab  ! 3: STD_I	std	%r27, [%r17 + 0x01ab]
	.word 0xbd2de001  ! 8: SLL_I	sll 	%r23, 0x0001, %r30
	.word 0xf03da06b  ! 13: STD_I	std	%r24, [%r22 + 0x006b]
	.word 0xfe342100  ! 18: STH_I	sth	%r31, [%r16 + 0x0100]
	.word 0xf63c215c  ! 20: STD_I	std	%r27, [%r16 + 0x015c]
	.word 0x8194e0fe  ! 29: WRPR_TPC_I	wrpr	%r19, 0x00fe, %tpc
	.word 0xf425e132  ! 30: STW_I	stw	%r26, [%r23 + 0x0132]
	.word 0xfa3d8000  ! 38: STD_R	std	%r29, [%r22 + %r0]
	.word 0xba150000  ! 40: OR_R	or 	%r20, %r0, %r29
	.word 0xfa2ca067  ! 42: STB_I	stb	%r29, [%r18 + 0x0067]
	.word 0xf42c4000  ! 45: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xbd480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 56: RDPR_PSTATE	<illegal instruction>
	.word 0xfd3cc000  ! 58: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf2740000  ! 59: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfc2c2019  ! 60: STB_I	stb	%r30, [%r16 + 0x0019]
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89c60e1  ! 62: XORcc_I	xorcc 	%r17, 0x00e1, %r28
	.word 0xfe7461cf  ! 63: STX_I	stx	%r31, [%r17 + 0x01cf]
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 70: RDPR_TT	<illegal instruction>
	.word 0xf075e029  ! 71: STX_I	stx	%r24, [%r23 + 0x0029]
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa754000  ! 73: STX_R	stx	%r29, [%r21 + %r0]
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395e12b  ! 78: WRPR_TNPC_I	wrpr	%r23, 0x012b, %tnpc
	.word 0xf42460a7  ! 79: STW_I	stw	%r26, [%r17 + 0x00a7]
	.word 0xb1540000  ! 80: RDPR_GL	rdpr	%-, %r24
	.word 0x89942005  ! 82: WRPR_TICK_I	wrpr	%r16, 0x0005, %tick
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839420ea  ! 90: WRPR_TNPC_I	wrpr	%r16, 0x00ea, %tnpc
	.word 0xf0248000  ! 91: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xbaa58000  ! 92: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xf6758000  ! 97: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf73ca1f9  ! 110: STDF_I	std	%f27, [0x01f9, %r18]
	.word 0xf13d8000  ! 113: STDF_R	std	%f24, [%r0, %r22]
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22dc000  ! 122: STB_R	stb	%r25, [%r23 + %r0]
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc340000  ! 126: STH_R	sth	%r30, [%r16 + %r0]
	.word 0x83946157  ! 128: WRPR_TNPC_I	wrpr	%r17, 0x0157, %tnpc
	mov	0, %r12
	.word 0xa1930000  ! 129: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf13d213b  ! 130: STDF_I	std	%f24, [0x013b, %r20]
	.word 0x8794200a  ! 131: WRPR_TT_I	wrpr	%r16, 0x000a, %tt
	.word 0x8395e02d  ! 133: WRPR_TNPC_I	wrpr	%r23, 0x002d, %tnpc
	.word 0xf42c8000  ! 134: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xb92d7001  ! 136: SLLX_I	sllx	%r21, 0x0001, %r28
	.word 0xf424201e  ! 137: STW_I	stw	%r26, [%r16 + 0x001e]
	.word 0xb234a146  ! 139: SUBC_I	orn 	%r18, 0x0146, %r25
	.word 0xfa35a052  ! 142: STH_I	sth	%r29, [%r22 + 0x0052]
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe752039  ! 146: STX_I	stx	%r31, [%r20 + 0x0039]
	setx	data_start_3, %g1, %r19
	.word 0xf83c8000  ! 149: STD_R	std	%r28, [%r18 + %r0]
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d8000  ! 158: XOR_R	xor 	%r22, %r0, %r24
	.word 0xf474205f  ! 161: STX_I	stx	%r26, [%r16 + 0x005f]
	.word 0xf6250000  ! 162: STW_R	stw	%r27, [%r20 + %r0]
	.word 0x819520e3  ! 163: WRPR_TPC_I	wrpr	%r20, 0x00e3, %tpc
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6240000  ! 168: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xbabd4000  ! 170: XNORcc_R	xnorcc 	%r21, %r0, %r29
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 182: RDPR_TICK	rdpr	%tick, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x819420c1  ! 189: WRPR_TPC_I	wrpr	%r16, 0x00c1, %tpc
	.word 0x8994206c  ! 190: WRPR_TICK_I	wrpr	%r16, 0x006c, %tick
	.word 0xfd3c4000  ! 192: STDF_R	std	%f30, [%r0, %r17]
	setx	data_start_4, %g1, %r16
	.word 0xbcb4e1bf  ! 198: SUBCcc_I	orncc 	%r19, 0x01bf, %r30
	setx	data_start_4, %g1, %r18
	.word 0xbc05e0ac  ! 200: ADD_I	add 	%r23, 0x00ac, %r30
	.word 0xff3da175  ! 201: STDF_I	std	%f31, [0x0175, %r22]
	.word 0x8395e019  ! 202: WRPR_TNPC_I	wrpr	%r23, 0x0019, %tnpc
	.word 0xf27560cc  ! 204: STX_I	stx	%r25, [%r21 + 0x00cc]
	.word 0xf2340000  ! 207: STH_R	sth	%r25, [%r16 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 209: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8248000  ! 210: STW_R	stw	%r28, [%r18 + %r0]
	.word 0x89952149  ! 213: WRPR_TICK_I	wrpr	%r20, 0x0149, %tick
	.word 0x8395a149  ! 216: WRPR_TNPC_I	wrpr	%r22, 0x0149, %tnpc
	.word 0xf23da128  ! 217: STD_I	std	%r25, [%r22 + 0x0128]
	setx	data_start_3, %g1, %r16
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 220: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb5518000  ! 222: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xf224a0d8  ! 224: STW_I	stw	%r25, [%r18 + 0x00d8]
	.word 0xf82cc000  ! 225: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xfa2c4000  ! 227: STB_R	stb	%r29, [%r17 + %r0]
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23c0000  ! 229: STD_R	std	%r25, [%r16 + %r0]
	.word 0xb151c000  ! 230: RDPR_TL	<illegal instruction>
	.word 0xb4246180  ! 232: SUB_I	sub 	%r17, 0x0180, %r26
	.word 0xfa3d6049  ! 234: STD_I	std	%r29, [%r21 + 0x0049]
	.word 0xb7500000  ! 237: RDPR_TPC	<illegal instruction>
	setx	0x8e44fff60000bb9d, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf03ce07a  ! 246: STD_I	std	%r24, [%r19 + 0x007a]
	.word 0xf0354000  ! 250: STH_R	sth	%r24, [%r21 + %r0]
	.word 0x8194610b  ! 251: WRPR_TPC_I	wrpr	%r17, 0x010b, %tpc
	.word 0xb5540000  ! 254: RDPR_GL	rdpr	%-, %r26
	.word 0xfc748000  ! 255: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf63d8000  ! 258: STD_R	std	%r27, [%r22 + %r0]
	.word 0x8995a0f5  ! 261: WRPR_TICK_I	wrpr	%r22, 0x00f5, %tick
	.word 0xf224a1a8  ! 263: STW_I	stw	%r25, [%r18 + 0x01a8]
	.word 0xfa74c000  ! 264: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xf42d8000  ! 266: STB_R	stb	%r26, [%r22 + %r0]
	.word 0x8d95a145  ! 267: WRPR_PSTATE_I	wrpr	%r22, 0x0145, %pstate
	.word 0xfe2c21d3  ! 269: STB_I	stb	%r31, [%r16 + 0x01d3]
	mov	0, %r12
	.word 0x8f930000  ! 271: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe3c2004  ! 272: STD_I	std	%r31, [%r16 + 0x0004]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7510000  ! 279: RDPR_TICK	rdpr	%tick, %r27
	.word 0xbab46053  ! 281: SUBCcc_I	orncc 	%r17, 0x0053, %r29
	.word 0xfc7420e5  ! 282: STX_I	stx	%r30, [%r16 + 0x00e5]
	.word 0x9195e0b5  ! 286: WRPR_PIL_I	wrpr	%r23, 0x00b5, %pil
	.word 0xb1500000  ! 289: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf13d0000  ! 290: STDF_R	std	%f24, [%r0, %r20]
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 297: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 299: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbea4c000  ! 303: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xb6244000  ! 304: SUB_R	sub 	%r17, %r0, %r27
	mov	0x22f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 308: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf63d21b4  ! 309: STD_I	std	%r27, [%r20 + 0x01b4]
	.word 0xfe750000  ! 310: STX_R	stx	%r31, [%r20 + %r0]
	.word 0x8794e188  ! 311: WRPR_TT_I	wrpr	%r19, 0x0188, %tt
	.word 0x83956092  ! 315: WRPR_TNPC_I	wrpr	%r21, 0x0092, %tnpc
	.word 0xf73de0f6  ! 316: STDF_I	std	%f27, [0x00f6, %r23]
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d8000  ! 328: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xb4bca083  ! 330: XNORcc_I	xnorcc 	%r18, 0x0083, %r26
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0f1  ! 336: WRPR_PSTATE_I	wrpr	%r18, 0x00f1, %pstate
	.word 0xfa2c60be  ! 339: STB_I	stb	%r29, [%r17 + 0x00be]
	.word 0xbb510000  ! 342: RDPR_TICK	rdpr	%tick, %r29
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe256160  ! 346: STW_I	stw	%r31, [%r21 + 0x0160]
	.word 0x8794e1f6  ! 348: WRPR_TT_I	wrpr	%r19, 0x01f6, %tt
	.word 0xfc25c000  ! 351: STW_R	stw	%r30, [%r23 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 355: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf824a06a  ! 358: STW_I	stw	%r28, [%r18 + 0x006a]
	.word 0x8594a05d  ! 361: WRPR_TSTATE_I	wrpr	%r18, 0x005d, %tstate
	setx	data_start_6, %g1, %r21
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234a0aa  ! 372: STH_I	sth	%r25, [%r18 + 0x00aa]
	.word 0xfc242160  ! 373: STW_I	stw	%r30, [%r16 + 0x0160]
	.word 0xfb3d8000  ! 374: STDF_R	std	%f29, [%r0, %r22]
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a068  ! 385: WRPR_TPC_I	wrpr	%r22, 0x0068, %tpc
	.word 0xbf480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2754000  ! 390: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf625c000  ! 391: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf62cc000  ! 396: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfe2d8000  ! 401: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xfa2dc000  ! 402: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf434a02b  ! 406: STH_I	sth	%r26, [%r18 + 0x002b]
	.word 0xb69c4000  ! 407: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xb2256086  ! 411: SUB_I	sub 	%r21, 0x0086, %r25
	setx	0x6e1d44670000cf10, %g1, %r10
	.word 0x839a8000  ! 412: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74615c  ! 416: STX_I	stx	%r29, [%r17 + 0x015c]
	.word 0xb1510000  ! 417: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf42d211f  ! 420: STB_I	stb	%r26, [%r20 + 0x011f]
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ca0c9  ! 424: STB_I	stb	%r27, [%r18 + 0x00c9]
	.word 0xfe3de073  ! 428: STD_I	std	%r31, [%r23 + 0x0073]
	.word 0xf235c000  ! 432: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfc740000  ! 434: STX_R	stx	%r30, [%r16 + %r0]
	.word 0x879561ad  ! 435: WRPR_TT_I	wrpr	%r21, 0x01ad, %tt
	.word 0x85956126  ! 436: WRPR_TSTATE_I	wrpr	%r21, 0x0126, %tstate
	.word 0xf23d2174  ! 439: STD_I	std	%r25, [%r20 + 0x0174]
	.word 0xb3500000  ! 440: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xfa2d6164  ! 441: STB_I	stb	%r29, [%r21 + 0x0164]
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	setx	0x95d3f1b700007f00, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf82de059  ! 448: STB_I	stb	%r28, [%r23 + 0x0059]
	.word 0xb015a0ae  ! 449: OR_I	or 	%r22, 0x00ae, %r24
	.word 0xfb3ca189  ! 451: STDF_I	std	%f29, [0x0189, %r18]
	setx	0x23f7730300007eda, %g1, %r10
	.word 0x819a8000  ! 453: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc25a196  ! 455: STW_I	stw	%r30, [%r22 + 0x0196]
	.word 0xbf480000  ! 460: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb804610e  ! 461: ADD_I	add 	%r17, 0x010e, %r28
	.word 0xf33c4000  ! 466: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf02d6113  ! 472: STB_I	stb	%r24, [%r21 + 0x0113]
	.word 0xb094e0e4  ! 476: ORcc_I	orcc 	%r19, 0x00e4, %r24
	.word 0xfa25a079  ! 477: STW_I	stw	%r29, [%r22 + 0x0079]
	.word 0xf6744000  ! 484: STX_R	stx	%r27, [%r17 + %r0]
	.word 0x81956045  ! 487: WRPR_TPC_I	wrpr	%r21, 0x0045, %tpc
	.word 0xf73c6166  ! 491: STDF_I	std	%f27, [0x0166, %r17]
	setx	0xc93eba70000ce95, %g1, %r10
	.word 0x839a8000  ! 493: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795e0ad  ! 495: WRPR_TT_I	wrpr	%r23, 0x00ad, %tt
	.word 0xf22420a3  ! 496: STW_I	stw	%r25, [%r16 + 0x00a3]
	.word 0xbf510000  ! 503: RDPR_TICK	rdpr	%tick, %r31
	.word 0xb0b50000  ! 505: ORNcc_R	orncc 	%r20, %r0, %r24
	.word 0xf075e0dc  ! 508: STX_I	stx	%r24, [%r23 + 0x00dc]
	.word 0xb17da401  ! 513: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xb0850000  ! 518: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xb7500000  ! 519: RDPR_TPC	<illegal instruction>
	setx	data_start_1, %g1, %r22
	.word 0xf62c8000  ! 523: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfc3d8000  ! 524: STD_R	std	%r30, [%r22 + %r0]
	.word 0xf22d6174  ! 531: STB_I	stb	%r25, [%r21 + 0x0174]
	.word 0xfa34a0ef  ! 533: STH_I	sth	%r29, [%r18 + 0x00ef]
	.word 0xf82ca126  ! 534: STB_I	stb	%r28, [%r18 + 0x0126]
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4354000  ! 539: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfb3c6174  ! 541: STDF_I	std	%f29, [0x0174, %r17]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd7d0400  ! 546: MOVR_R	movre	%r20, %r0, %r30
	.word 0x8194a011  ! 547: WRPR_TPC_I	wrpr	%r18, 0x0011, %tpc
	setx	0xc1b386f100002990, %g1, %r10
	.word 0x819a8000  ! 551: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf62c614f  ! 552: STB_I	stb	%r27, [%r17 + 0x014f]
	.word 0xb9504000  ! 553: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfa24c000  ! 554: STW_R	stw	%r29, [%r19 + %r0]
	mov	0x20c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 557: RDPR_GL	<illegal instruction>
	.word 0x919561e2  ! 558: WRPR_PIL_I	wrpr	%r21, 0x01e2, %pil
	.word 0xf03560c2  ! 560: STH_I	sth	%r24, [%r21 + 0x00c2]
	mov	0, %r12
	.word 0xa1930000  ! 561: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb4254000  ! 565: SUB_R	sub 	%r21, %r0, %r26
	.word 0xb88d0000  ! 568: ANDcc_R	andcc 	%r20, %r0, %r28
	mov	2, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2244000  ! 577: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf6248000  ! 578: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xb8954000  ! 581: ORcc_R	orcc 	%r21, %r0, %r28
	setx	data_start_0, %g1, %r18
	.word 0xb134e001  ! 591: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0x8594e0af  ! 593: WRPR_TSTATE_I	wrpr	%r19, 0x00af, %tstate
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74c000  ! 596: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf93c208b  ! 599: STDF_I	std	%f28, [0x008b, %r16]
	mov	0, %r12
	.word 0x8f930000  ! 600: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5518000  ! 603: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xb350c000  ! 606: RDPR_TT	<illegal instruction>
	.word 0xfc3c6112  ! 608: STD_I	std	%r30, [%r17 + 0x0112]
	.word 0xf13c20fe  ! 609: STDF_I	std	%f24, [0x00fe, %r16]
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95e191  ! 611: WRPR_PSTATE_I	wrpr	%r23, 0x0191, %pstate
	.word 0xb3641800  ! 612: MOVcc_R	<illegal instruction>
	.word 0xf82dc000  ! 616: STB_R	stb	%r28, [%r23 + %r0]
	setx	0x2da3dde600004854, %g1, %r10
	.word 0x819a8000  ! 617: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb2858000  ! 618: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xb5500000  ! 621: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfa3d0000  ! 622: STD_R	std	%r29, [%r20 + %r0]
	.word 0x91942148  ! 624: WRPR_PIL_I	wrpr	%r16, 0x0148, %pil
	.word 0xf4354000  ! 627: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xba150000  ! 629: OR_R	or 	%r20, %r0, %r29
	.word 0xfc3561d3  ! 634: STH_I	sth	%r30, [%r21 + 0x01d3]
	.word 0xf83d21c9  ! 635: STD_I	std	%r28, [%r20 + 0x01c9]
	.word 0xfc258000  ! 644: STW_R	stw	%r30, [%r22 + %r0]
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13dc000  ! 646: STDF_R	std	%f24, [%r0, %r23]
	.word 0xbd540000  ! 647: RDPR_GL	rdpr	%-, %r30
	.word 0xf8344000  ! 648: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xbd51c000  ! 654: RDPR_TL	<illegal instruction>
	.word 0xf8740000  ! 656: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfd3c4000  ! 657: STDF_R	std	%f30, [%r0, %r17]
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d4000  ! 662: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xbeb5a11d  ! 663: SUBCcc_I	orncc 	%r22, 0x011d, %r31
	.word 0xfc3c6031  ! 665: STD_I	std	%r30, [%r17 + 0x0031]
	.word 0xfe74a15e  ! 668: STX_I	stx	%r31, [%r18 + 0x015e]
	.word 0xfa35c000  ! 669: STH_R	sth	%r29, [%r23 + %r0]
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42421ff  ! 675: STW_I	stw	%r26, [%r16 + 0x01ff]
	.word 0xba24c000  ! 679: SUB_R	sub 	%r19, %r0, %r29
	.word 0xf0754000  ! 681: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfd3dc000  ! 683: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf53c8000  ! 685: STDF_R	std	%f26, [%r0, %r18]
	.word 0xfc3d0000  ! 687: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf62c0000  ! 690: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xbb480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 697: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xba444000  ! 701: ADDC_R	addc 	%r17, %r0, %r29
	.word 0xfc248000  ! 704: STW_R	stw	%r30, [%r18 + %r0]
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc244000  ! 707: STW_R	stw	%r30, [%r17 + %r0]
	setx	data_start_1, %g1, %r18
	.word 0xf63d4000  ! 709: STD_R	std	%r27, [%r21 + %r0]
	.word 0xf13da037  ! 714: STDF_I	std	%f24, [0x0037, %r22]
	.word 0xf03d4000  ! 715: STD_R	std	%r24, [%r21 + %r0]
	.word 0xb0b50000  ! 717: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xba1cc000  ! 718: XOR_R	xor 	%r19, %r0, %r29
	.word 0xbf352001  ! 722: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xfa34608f  ! 723: STH_I	sth	%r29, [%r17 + 0x008f]
	.word 0xf6740000  ! 724: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf82da085  ! 726: STB_I	stb	%r28, [%r22 + 0x0085]
	.word 0xb694a135  ! 729: ORcc_I	orcc 	%r18, 0x0135, %r27
	.word 0xf224e18d  ! 731: STW_I	stw	%r25, [%r19 + 0x018d]
	.word 0xb8a4e1ca  ! 735: SUBcc_I	subcc 	%r19, 0x01ca, %r28
	.word 0xfe3d0000  ! 736: STD_R	std	%r31, [%r20 + %r0]
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0xf675c000  ! 743: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf8244000  ! 751: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xb535e001  ! 753: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0xb6358000  ! 756: SUBC_R	orn 	%r22, %r0, %r27
	.word 0xf034c000  ! 759: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xb72c4000  ! 761: SLL_R	sll 	%r17, %r0, %r27
	.word 0xf2240000  ! 763: STW_R	stw	%r25, [%r16 + %r0]
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62dc000  ! 769: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xf235a1e7  ! 773: STH_I	sth	%r25, [%r22 + 0x01e7]
	.word 0xb5510000  ! 775: RDPR_TICK	<illegal instruction>
	.word 0xf82c20e6  ! 778: STB_I	stb	%r28, [%r16 + 0x00e6]
	.word 0xb32c9000  ! 781: SLLX_R	sllx	%r18, %r0, %r25
	.word 0x8395a058  ! 782: WRPR_TNPC_I	wrpr	%r22, 0x0058, %tnpc
	.word 0xb150c000  ! 788: RDPR_TT	rdpr	%tt, %r24
	.word 0x8594e189  ! 790: WRPR_TSTATE_I	wrpr	%r19, 0x0189, %tstate
	.word 0xbd50c000  ! 791: RDPR_TT	rdpr	%tt, %r30
	.word 0xf22421f8  ! 794: STW_I	stw	%r25, [%r16 + 0x01f8]
	.word 0xb3510000  ! 795: RDPR_TICK	<illegal instruction>
	.word 0x83942134  ! 799: WRPR_TNPC_I	wrpr	%r16, 0x0134, %tnpc
	.word 0xfb3d4000  ! 800: STDF_R	std	%f29, [%r0, %r21]
	.word 0x9194e117  ! 803: WRPR_PIL_I	wrpr	%r19, 0x0117, %pil
	.word 0x8394200a  ! 805: WRPR_TNPC_I	wrpr	%r16, 0x000a, %tnpc
	.word 0xf0752058  ! 807: STX_I	stx	%r24, [%r20 + 0x0058]
	.word 0xbf508000  ! 809: RDPR_TSTATE	rdpr	%tstate, %r31
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a18f  ! 813: WRPR_TNPC_I	wrpr	%r18, 0x018f, %tnpc
	.word 0xf6744000  ! 815: STX_R	stx	%r27, [%r17 + %r0]
	setx	data_start_0, %g1, %r19
	.word 0xf625a0c2  ! 821: STW_I	stw	%r27, [%r22 + 0x00c2]
	.word 0xbf3c5000  ! 822: SRAX_R	srax	%r17, %r0, %r31
	.word 0xf875a196  ! 823: STX_I	stx	%r28, [%r22 + 0x0196]
	.word 0x8995a0ac  ! 824: WRPR_TICK_I	wrpr	%r22, 0x00ac, %tick
	setx	data_start_5, %g1, %r19
	.word 0xfb3c0000  ! 827: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf4350000  ! 828: STH_R	sth	%r26, [%r20 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa744000  ! 838: STX_R	stx	%r29, [%r17 + %r0]
	.word 0x81946127  ! 840: WRPR_TPC_I	wrpr	%r17, 0x0127, %tpc
	.word 0xf02c219a  ! 841: STB_I	stb	%r24, [%r16 + 0x019a]
	.word 0xb4b50000  ! 842: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xf8250000  ! 845: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xbd50c000  ! 846: RDPR_TT	rdpr	%tt, %r30
	.word 0xfe3c4000  ! 848: STD_R	std	%r31, [%r17 + %r0]
	.word 0x8d94210d  ! 849: WRPR_PSTATE_I	wrpr	%r16, 0x010d, %pstate
	.word 0xbb504000  ! 852: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf4256109  ! 855: STW_I	stw	%r26, [%r21 + 0x0109]
	.word 0xba9d20b8  ! 856: XORcc_I	xorcc 	%r20, 0x00b8, %r29
	.word 0xb8c5e1ad  ! 857: ADDCcc_I	addccc 	%r23, 0x01ad, %r28
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3d6175  ! 867: STDF_I	std	%f30, [0x0175, %r21]
	.word 0xba2dc000  ! 871: ANDN_R	andn 	%r23, %r0, %r29
	.word 0xb97c4400  ! 873: MOVR_R	movre	%r17, %r0, %r28
	.word 0xfc24a1bf  ! 874: STW_I	stw	%r30, [%r18 + 0x01bf]
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33c4000  ! 882: STDF_R	std	%f25, [%r0, %r17]
	setx	0x66760a320000ee99, %g1, %r10
	.word 0x839a8000  ! 883: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2746113  ! 885: STX_I	stx	%r25, [%r17 + 0x0113]
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 888: RDPR_TL	rdpr	%tl, %r24
	.word 0xb215c000  ! 889: OR_R	or 	%r23, %r0, %r25
	.word 0xfe340000  ! 890: STH_R	sth	%r31, [%r16 + %r0]
	setx	0x5727bbdc0000fc97, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf13d8000  ! 893: STDF_R	std	%f24, [%r0, %r22]
	.word 0xf53dc000  ! 895: STDF_R	std	%f26, [%r0, %r23]
	.word 0xf0348000  ! 896: STH_R	sth	%r24, [%r18 + %r0]
	.word 0x8995a03d  ! 901: WRPR_TICK_I	wrpr	%r22, 0x003d, %tick
	.word 0xb1510000  ! 902: RDPR_TICK	rdpr	%tick, %r24
	.word 0x819561b5  ! 906: WRPR_TPC_I	wrpr	%r21, 0x01b5, %tpc
	.word 0xbe9d8000  ! 907: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xf0350000  ! 908: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb7510000  ! 910: RDPR_TICK	rdpr	%tick, %r27
	.word 0xb950c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0xf82560c0  ! 913: STW_I	stw	%r28, [%r21 + 0x00c0]
	setx	0xf38d2f2100002e9f, %g1, %r10
	.word 0x819a8000  ! 914: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0244000  ! 917: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf13c0000  ! 921: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf93c4000  ! 922: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf0748000  ! 924: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf03c4000  ! 927: STD_R	std	%r24, [%r17 + %r0]
	.word 0xb3480000  ! 931: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 938: MOVcc_R	<illegal instruction>
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595e1d4  ! 943: WRPR_TSTATE_I	wrpr	%r23, 0x01d4, %tstate
	.word 0xf13c0000  ! 948: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf0344000  ! 952: STH_R	sth	%r24, [%r17 + %r0]
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87560b6  ! 958: STX_I	stx	%r28, [%r21 + 0x00b6]
	setx	0xa409d5b30000a802, %g1, %r10
	.word 0x839a8000  ! 961: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb894e1dc  ! 962: ORcc_I	orcc 	%r19, 0x01dc, %r28
	.word 0xfc3dc000  ! 966: STD_R	std	%r30, [%r23 + %r0]
	setx	0x9933585200000e41, %g1, %r10
	.word 0x819a8000  ! 971: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8795a168  ! 972: WRPR_TT_I	wrpr	%r22, 0x0168, %tt
	.word 0xf8746036  ! 977: STX_I	stx	%r28, [%r17 + 0x0036]
	.word 0xfb3ce122  ! 979: STDF_I	std	%f29, [0x0122, %r19]
	.word 0x83946082  ! 980: WRPR_TNPC_I	wrpr	%r17, 0x0082, %tnpc
	.word 0xb88c608a  ! 983: ANDcc_I	andcc 	%r17, 0x008a, %r28
	.word 0xb1508000  ! 984: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf62cc000  ! 990: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xbd480000  ! 994: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf0254000  ! 997: STW_R	stw	%r24, [%r21 + %r0]
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
	.word 0xb6454000  ! 1: ADDC_R	addc 	%r21, %r0, %r27
	.word 0xb72c2001  ! 8: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xfa0d0000  ! 12: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xfa1d4000  ! 15: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xf8148000  ! 16: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf81de0da  ! 17: LDD_I	ldd	[%r23 + 0x00da], %r28
	.word 0xfe1560bf  ! 19: LDUH_I	lduh	[%r21 + 0x00bf], %r31
	.word 0xfa5de1c7  ! 21: LDX_I	ldx	[%r23 + 0x01c7], %r29
	.word 0xf31da136  ! 26: LDDF_I	ldd	[%r22, 0x0136], %f25
	.word 0x8194a1e8  ! 29: WRPR_TPC_I	wrpr	%r18, 0x01e8, %tpc
	.word 0xf84dc000  ! 32: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf01521d9  ! 34: LDUH_I	lduh	[%r20 + 0x01d9], %r24
	.word 0xf405e1d9  ! 37: LDUW_I	lduw	[%r23 + 0x01d9], %r26
	.word 0xb4148000  ! 40: OR_R	or 	%r18, %r0, %r26
	.word 0xfe4ca1a4  ! 43: LDSB_I	ldsb	[%r18 + 0x01a4], %r31
	.word 0xf60da1b7  ! 44: LDUB_I	ldub	[%r22 + 0x01b7], %r27
	.word 0xbf480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf214a114  ! 48: LDUH_I	lduh	[%r18 + 0x0114], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005e16f  ! 53: LDUW_I	lduw	[%r23 + 0x016f], %r24
	.word 0xbf518000  ! 56: RDPR_PSTATE	<illegal instruction>
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d2038  ! 62: XORcc_I	xorcc 	%r20, 0x0038, %r30
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1de1bb  ! 66: LDDF_I	ldd	[%r23, 0x01bb], %f31
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 70: RDPR_TT	<illegal instruction>
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c6000  ! 76: LDX_I	ldx	[%r17 + 0x0000], %r25
	.word 0xf84de0c6  ! 77: LDSB_I	ldsb	[%r23 + 0x00c6], %r28
	.word 0x8394e089  ! 78: WRPR_TNPC_I	wrpr	%r19, 0x0089, %tnpc
	.word 0xbf540000  ! 80: RDPR_GL	<illegal instruction>
	.word 0x899420e5  ! 82: WRPR_TICK_I	wrpr	%r16, 0x00e5, %tick
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839521a4  ! 90: WRPR_TNPC_I	wrpr	%r20, 0x01a4, %tnpc
	.word 0xb2a54000  ! 92: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0xf6146143  ! 93: LDUH_I	lduh	[%r17 + 0x0143], %r27
	.word 0xf4450000  ! 94: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf6454000  ! 96: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xfe1da00d  ! 98: LDD_I	ldd	[%r22 + 0x000d], %r31
	.word 0xf2544000  ! 100: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xf85ca01f  ! 101: LDX_I	ldx	[%r18 + 0x001f], %r28
	.word 0xfa558000  ! 103: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf8048000  ! 104: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf0550000  ! 105: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xfc55e11b  ! 107: LDSH_I	ldsh	[%r23 + 0x011b], %r30
	.word 0xf85c4000  ! 108: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xfb1cc000  ! 111: LDDF_R	ldd	[%r19, %r0], %f29
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204a030  ! 117: LDUW_I	lduw	[%r18 + 0x0030], %r25
	.word 0xf20d21ae  ! 123: LDUB_I	ldub	[%r20 + 0x01ae], %r25
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839421af  ! 128: WRPR_TNPC_I	wrpr	%r16, 0x01af, %tnpc
	mov	1, %r12
	.word 0xa1930000  ! 129: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879461f3  ! 131: WRPR_TT_I	wrpr	%r17, 0x01f3, %tt
	.word 0xfc0c21a8  ! 132: LDUB_I	ldub	[%r16 + 0x01a8], %r30
	.word 0x8394e0aa  ! 133: WRPR_TNPC_I	wrpr	%r19, 0x00aa, %tnpc
	.word 0xb52c3001  ! 136: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xf64c21b5  ! 138: LDSB_I	ldsb	[%r16 + 0x01b5], %r27
	.word 0xbe35619b  ! 139: SUBC_I	orn 	%r21, 0x019b, %r31
	.word 0xf254e15e  ! 141: LDSH_I	ldsh	[%r19 + 0x015e], %r25
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	.word 0xf41d20c0  ! 154: LDD_I	ldd	[%r20 + 0x00c0], %r26
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d2168  ! 157: LDUB_I	ldub	[%r20 + 0x0168], %r31
	.word 0xb61c4000  ! 158: XOR_R	xor 	%r17, %r0, %r27
	.word 0x8195e19c  ! 163: WRPR_TPC_I	wrpr	%r23, 0x019c, %tpc
	.word 0xfa148000  ! 166: LDUH_R	lduh	[%r18 + %r0], %r29
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c0000  ! 169: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xb8bdc000  ! 170: XNORcc_R	xnorcc 	%r23, %r0, %r28
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41c206f  ! 179: LDD_I	ldd	[%r16 + 0x006f], %r26
	.word 0xfc054000  ! 181: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xb9510000  ! 182: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf45dc000  ! 185: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xfb1ce106  ! 186: LDDF_I	ldd	[%r19, 0x0106], %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf11d2028  ! 188: LDDF_I	ldd	[%r20, 0x0028], %f24
	.word 0x8194a0e9  ! 189: WRPR_TPC_I	wrpr	%r18, 0x00e9, %tpc
	.word 0x8995e0aa  ! 190: WRPR_TICK_I	wrpr	%r23, 0x00aa, %tick
	.word 0xf11c8000  ! 194: LDDF_R	ldd	[%r18, %r0], %f24
	setx	data_start_2, %g1, %r18
	.word 0xb4b4a1a6  ! 198: SUBCcc_I	orncc 	%r18, 0x01a6, %r26
	setx	data_start_3, %g1, %r17
	.word 0xb204e1c0  ! 200: ADD_I	add 	%r19, 0x01c0, %r25
	.word 0x839460dd  ! 202: WRPR_TNPC_I	wrpr	%r17, 0x00dd, %tnpc
	mov	0, %r12
	.word 0xa1930000  ! 209: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x89946165  ! 213: WRPR_TICK_I	wrpr	%r17, 0x0165, %tick
	.word 0xfe144000  ! 214: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0x8395208f  ! 216: WRPR_TNPC_I	wrpr	%r20, 0x008f, %tnpc
	setx	data_start_5, %g1, %r18
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 220: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbb518000  ! 222: RDPR_PSTATE	<illegal instruction>
	.word 0xfa55c000  ! 223: LDSH_R	ldsh	[%r23 + %r0], %r29
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 230: RDPR_TL	<illegal instruction>
	.word 0xbc25e0e6  ! 232: SUB_I	sub 	%r23, 0x00e6, %r30
	.word 0xfc1dc000  ! 233: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf404a03b  ! 235: LDUW_I	lduw	[%r18 + 0x003b], %r26
	.word 0xff1cc000  ! 236: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xb5500000  ! 237: RDPR_TPC	<illegal instruction>
	setx	0xca31e7f90000e913, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc4de0d1  ! 242: LDSB_I	ldsb	[%r23 + 0x00d1], %r30
	.word 0xfc4d21ac  ! 244: LDSB_I	ldsb	[%r20 + 0x01ac], %r30
	.word 0xfe1520ba  ! 245: LDUH_I	lduh	[%r20 + 0x00ba], %r31
	.word 0xf41d2116  ! 249: LDD_I	ldd	[%r20 + 0x0116], %r26
	.word 0x8194e0a3  ! 251: WRPR_TPC_I	wrpr	%r19, 0x00a3, %tpc
	.word 0xf81ce067  ! 252: LDD_I	ldd	[%r19 + 0x0067], %r28
	.word 0xb7540000  ! 254: RDPR_GL	<illegal instruction>
	.word 0xf91d0000  ! 257: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0x899420f1  ! 261: WRPR_TICK_I	wrpr	%r16, 0x00f1, %tick
	.word 0x8d9420d3  ! 267: WRPR_PSTATE_I	wrpr	%r16, 0x00d3, %pstate
	mov	1, %r12
	.word 0x8f930000  ! 271: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf04d4000  ! 273: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfc440000  ! 274: LDSW_R	ldsw	[%r16 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf01c204b  ! 278: LDD_I	ldd	[%r16 + 0x004b], %r24
	.word 0xb1510000  ! 279: RDPR_TICK	<illegal instruction>
	.word 0xb0b4a029  ! 281: SUBCcc_I	orncc 	%r18, 0x0029, %r24
	.word 0x9195a03f  ! 286: WRPR_PIL_I	wrpr	%r22, 0x003f, %pil
	.word 0xfe4d0000  ! 288: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xb9500000  ! 289: RDPR_TPC	<illegal instruction>
	.word 0xfe0c4000  ! 292: LDUB_R	ldub	[%r17 + %r0], %r31
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 297: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 299: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6156057  ! 300: LDUH_I	lduh	[%r21 + 0x0057], %r27
	.word 0xfc5ce0c0  ! 301: LDX_I	ldx	[%r19 + 0x00c0], %r30
	.word 0xb6a50000  ! 303: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xb8240000  ! 304: SUB_R	sub 	%r16, %r0, %r28
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415a0ab  ! 306: LDUH_I	lduh	[%r22 + 0x00ab], %r26
	.word 0xf60ca039  ! 307: LDUB_I	ldub	[%r18 + 0x0039], %r27
	.word 0xb7500000  ! 308: RDPR_TPC	<illegal instruction>
	.word 0x879521db  ! 311: WRPR_TT_I	wrpr	%r20, 0x01db, %tt
	.word 0xf605e0ae  ! 312: LDUW_I	lduw	[%r23 + 0x00ae], %r27
	.word 0x83956182  ! 315: WRPR_TNPC_I	wrpr	%r21, 0x0182, %tnpc
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c20bd  ! 318: LDUB_I	ldub	[%r16 + 0x00bd], %r29
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bc2185  ! 330: XNORcc_I	xnorcc 	%r16, 0x0185, %r24
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245a121  ! 333: LDSW_I	ldsw	[%r22 + 0x0121], %r25
	.word 0x8d94e0f6  ! 336: WRPR_PSTATE_I	wrpr	%r19, 0x00f6, %pstate
	.word 0xfe4de0ca  ! 337: LDSB_I	ldsb	[%r23 + 0x00ca], %r31
	.word 0xf014c000  ! 341: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xb3510000  ! 342: RDPR_TICK	<illegal instruction>
	.word 0xf85c21d4  ! 343: LDX_I	ldx	[%r16 + 0x01d4], %r28
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a093  ! 348: WRPR_TT_I	wrpr	%r18, 0x0093, %tt
	.word 0xfa0c8000  ! 350: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xfa55c000  ! 352: LDSH_R	ldsh	[%r23 + %r0], %r29
	mov	0, %r12
	.word 0x8f930000  ! 355: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf45dc000  ! 359: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf25c8000  ! 360: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0x8595e14a  ! 361: WRPR_TSTATE_I	wrpr	%r23, 0x014a, %tstate
	setx	data_start_0, %g1, %r21
	.word 0xf71d4000  ! 365: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xfc5460ee  ! 366: LDSH_I	ldsh	[%r17 + 0x00ee], %r30
	.word 0xf31d61c5  ! 367: LDDF_I	ldd	[%r21, 0x01c5], %f25
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2540000  ! 369: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xfe448000  ! 370: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xf8442019  ! 377: LDSW_I	ldsw	[%r16 + 0x0019], %r28
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8158000  ! 381: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xf655c000  ! 382: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0x819420e5  ! 385: WRPR_TPC_I	wrpr	%r16, 0x00e5, %tpc
	.word 0xbb480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfc440000  ! 387: LDSW_R	ldsw	[%r16 + %r0], %r30
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01cc000  ! 392: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf00c21ba  ! 395: LDUB_I	ldub	[%r16 + 0x01ba], %r24
	.word 0xf84461f3  ! 397: LDSW_I	ldsw	[%r17 + 0x01f3], %r28
	.word 0xf45c4000  ! 398: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xfc4c6005  ! 399: LDSB_I	ldsb	[%r17 + 0x0005], %r30
	.word 0xfe5cc000  ! 400: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xfc15c000  ! 403: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xf444e19d  ! 405: LDSW_I	ldsw	[%r19 + 0x019d], %r26
	.word 0xb09c8000  ! 407: XORcc_R	xorcc 	%r18, %r0, %r24
	.word 0xbc2460f0  ! 411: SUB_I	sub 	%r17, 0x00f0, %r30
	setx	0x891cef680000680d, %g1, %r10
	.word 0x839a8000  ! 412: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d8000  ! 415: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xb9510000  ! 417: RDPR_TICK	<illegal instruction>
	.word 0xfe546094  ! 418: LDSH_I	ldsh	[%r17 + 0x0094], %r31
	.word 0xf2450000  ! 421: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xfc146179  ! 422: LDUH_I	lduh	[%r17 + 0x0179], %r30
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455e002  ! 426: LDSH_I	ldsh	[%r23 + 0x0002], %r26
	.word 0xf615203d  ! 430: LDUH_I	lduh	[%r20 + 0x003d], %r27
	.word 0xf40c4000  ! 431: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf214e147  ! 433: LDUH_I	lduh	[%r19 + 0x0147], %r25
	.word 0x8794a01e  ! 435: WRPR_TT_I	wrpr	%r18, 0x001e, %tt
	.word 0x85952191  ! 436: WRPR_TSTATE_I	wrpr	%r20, 0x0191, %tstate
	.word 0xf61d6080  ! 438: LDD_I	ldd	[%r21 + 0x0080], %r27
	.word 0xb1500000  ! 440: RDPR_TPC	<illegal instruction>
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	setx	0x869c400e000079d8, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb815212e  ! 449: OR_I	or 	%r20, 0x012e, %r28
	.word 0xf20ca033  ! 452: LDUB_I	ldub	[%r18 + 0x0033], %r25
	setx	0xb0f5885700002d1a, %g1, %r10
	.word 0x819a8000  ! 453: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfd1c0000  ! 454: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xf00c8000  ! 458: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xb3480000  ! 460: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb4046126  ! 461: ADD_I	add 	%r17, 0x0126, %r26
	.word 0xf20ca10c  ! 463: LDUB_I	ldub	[%r18 + 0x010c], %r25
	.word 0xf05cc000  ! 464: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf60c4000  ! 465: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfa55c000  ! 469: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf24d6126  ! 474: LDSB_I	ldsb	[%r21 + 0x0126], %r25
	.word 0xbe9561ad  ! 476: ORcc_I	orcc 	%r21, 0x01ad, %r31
	.word 0xfe148000  ! 482: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0x8194e144  ! 487: WRPR_TPC_I	wrpr	%r19, 0x0144, %tpc
	setx	0xf1cccdc200005b80, %g1, %r10
	.word 0x839a8000  ! 493: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf44c2016  ! 494: LDSB_I	ldsb	[%r16 + 0x0016], %r26
	.word 0x879461cd  ! 495: WRPR_TT_I	wrpr	%r17, 0x01cd, %tt
	.word 0xf40560c8  ! 497: LDUW_I	lduw	[%r21 + 0x00c8], %r26
	.word 0xf25c2136  ! 498: LDX_I	ldx	[%r16 + 0x0136], %r25
	.word 0xf6552151  ! 499: LDSH_I	ldsh	[%r20 + 0x0151], %r27
	.word 0xbd510000  ! 503: RDPR_TICK	rdpr	%tick, %r30
	.word 0xb2b5c000  ! 505: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xf11d8000  ! 506: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xf4150000  ! 510: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xf01ca03d  ! 511: LDD_I	ldd	[%r18 + 0x003d], %r24
	.word 0xb97c6401  ! 513: MOVR_I	movre	%r17, 0x1, %r28
	.word 0xf20cc000  ! 516: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xf2140000  ! 517: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xbc840000  ! 518: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xb1500000  ! 519: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r23
	.word 0xfc5da113  ! 528: LDX_I	ldx	[%r22 + 0x0113], %r30
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84560b7  ! 538: LDSW_I	ldsw	[%r21 + 0x00b7], %r28
	.word 0xff1ca003  ! 540: LDDF_I	ldd	[%r18, 0x0003], %f31
	.word 0xff1d6083  ! 543: LDDF_I	ldd	[%r21, 0x0083], %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb57d4400  ! 546: MOVR_R	movre	%r21, %r0, %r26
	.word 0x8194205f  ! 547: WRPR_TPC_I	wrpr	%r16, 0x005f, %tpc
	.word 0xf60ca13e  ! 548: LDUB_I	ldub	[%r18 + 0x013e], %r27
	setx	0x3a0f2c680000e941, %g1, %r10
	.word 0x819a8000  ! 551: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7504000  ! 553: RDPR_TNPC	<illegal instruction>
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 557: RDPR_GL	<illegal instruction>
	.word 0x9195617d  ! 558: WRPR_PIL_I	wrpr	%r21, 0x017d, %pil
	mov	1, %r12
	.word 0xa1930000  ! 561: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf61ce151  ! 562: LDD_I	ldd	[%r19 + 0x0151], %r27
	.word 0xfc050000  ! 564: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xbe254000  ! 565: SUB_R	sub 	%r21, %r0, %r31
	.word 0xf45d4000  ! 566: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xb88d8000  ! 568: ANDcc_R	andcc 	%r22, %r0, %r28
	.word 0xfa55a0ea  ! 571: LDSH_I	ldsh	[%r22 + 0x00ea], %r29
	mov	0, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c6015  ! 575: LDUB_I	ldub	[%r17 + 0x0015], %r29
	.word 0xf65d4000  ! 579: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf04c4000  ! 580: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xb294c000  ! 581: ORcc_R	orcc 	%r19, %r0, %r25
	.word 0xf84cc000  ! 584: LDSB_R	ldsb	[%r19 + %r0], %r28
	setx	data_start_6, %g1, %r20
	.word 0xb7356001  ! 591: SRL_I	srl 	%r21, 0x0001, %r27
	.word 0x8594e1bd  ! 593: WRPR_TSTATE_I	wrpr	%r19, 0x01bd, %tstate
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14e0e6  ! 595: LDUH_I	lduh	[%r19 + 0x00e6], %r31
	.word 0xf2544000  ! 597: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xf045e090  ! 598: LDSW_I	ldsw	[%r23 + 0x0090], %r24
	mov	0, %r12
	.word 0x8f930000  ! 600: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf71d4000  ! 601: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xfc5c8000  ! 602: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xb3518000  ! 603: RDPR_PSTATE	<illegal instruction>
	.word 0xf814600b  ! 604: LDUH_I	lduh	[%r17 + 0x000b], %r28
	.word 0xf05da118  ! 605: LDX_I	ldx	[%r22 + 0x0118], %r24
	.word 0xb950c000  ! 606: RDPR_TT	<illegal instruction>
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a141  ! 611: WRPR_PSTATE_I	wrpr	%r18, 0x0141, %pstate
	.word 0xb7641800  ! 612: MOVcc_R	<illegal instruction>
	.word 0xf24d8000  ! 613: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xfc1d0000  ! 615: LDD_R	ldd	[%r20 + %r0], %r30
	setx	0x10e6dd0c00008f97, %g1, %r10
	.word 0x819a8000  ! 617: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb4858000  ! 618: ADDcc_R	addcc 	%r22, %r0, %r26
	.word 0xfa1d2027  ! 620: LDD_I	ldd	[%r20 + 0x0027], %r29
	.word 0xbd500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xfc45e094  ! 623: LDSW_I	ldsw	[%r23 + 0x0094], %r30
	.word 0x9194a100  ! 624: WRPR_PIL_I	wrpr	%r18, 0x0100, %pil
	.word 0xbc140000  ! 629: OR_R	or 	%r16, %r0, %r30
	.word 0xfc144000  ! 630: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xf44c0000  ! 631: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xf8142153  ! 633: LDUH_I	lduh	[%r16 + 0x0153], %r28
	.word 0xf31d0000  ! 637: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0xf65da125  ! 638: LDX_I	ldx	[%r22 + 0x0125], %r27
	.word 0xfa4c8000  ! 641: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xf004e1e7  ! 642: LDUW_I	lduw	[%r19 + 0x01e7], %r24
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 647: RDPR_GL	<illegal instruction>
	.word 0xf214213e  ! 649: LDUH_I	lduh	[%r16 + 0x013e], %r25
	.word 0xb351c000  ! 654: RDPR_TL	<illegal instruction>
	.word 0xf045e1ff  ! 655: LDSW_I	ldsw	[%r23 + 0x01ff], %r24
	.word 0xf0558000  ! 658: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf71d0000  ! 659: LDDF_R	ldd	[%r20, %r0], %f27
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83d4000  ! 662: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xb8b520c0  ! 663: SUBCcc_I	orncc 	%r20, 0x00c0, %r28
	.word 0xfa050000  ! 664: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xfe45a12f  ! 666: LDSW_I	ldsw	[%r22 + 0x012f], %r31
	.word 0xfc0c21af  ! 671: LDUB_I	ldub	[%r16 + 0x01af], %r30
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81d8000  ! 677: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xb0254000  ! 679: SUB_R	sub 	%r21, %r0, %r24
	.word 0xfc44e1fd  ! 688: LDSW_I	ldsw	[%r19 + 0x01fd], %r30
	.word 0xb5480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2148000  ! 693: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf4450000  ! 694: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xb1504000  ! 697: RDPR_TNPC	<illegal instruction>
	.word 0xfe14c000  ! 698: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xfc55e075  ! 700: LDSH_I	ldsh	[%r23 + 0x0075], %r30
	.word 0xb8444000  ! 701: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xfc450000  ! 703: LDSW_R	ldsw	[%r20 + %r0], %r30
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	.word 0xfa042109  ! 711: LDUW_I	lduw	[%r16 + 0x0109], %r29
	.word 0xf11c0000  ! 712: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xf0540000  ! 716: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xb6b4c000  ! 717: SUBCcc_R	orncc 	%r19, %r0, %r27
	.word 0xbc1cc000  ! 718: XOR_R	xor 	%r19, %r0, %r30
	.word 0xf6144000  ! 719: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xb3342001  ! 722: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xf2448000  ! 725: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xba95e135  ! 729: ORcc_I	orcc 	%r23, 0x0135, %r29
	.word 0xb0a5e1ed  ! 735: SUBcc_I	subcc 	%r23, 0x01ed, %r24
	.word 0xfc1ca058  ! 738: LDD_I	ldd	[%r18 + 0x0058], %r30
	.word 0xf45ca115  ! 739: LDX_I	ldx	[%r18 + 0x0115], %r26
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d2063  ! 741: LDUB_I	ldub	[%r20 + 0x0063], %r28
	.word 0xb951c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0xf4548000  ! 744: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf61d0000  ! 752: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xb735e001  ! 753: SRL_I	srl 	%r23, 0x0001, %r27
	.word 0xb6340000  ! 756: SUBC_R	orn 	%r16, %r0, %r27
	.word 0xf40de0d1  ! 757: LDUB_I	ldub	[%r23 + 0x00d1], %r26
	.word 0xf25da15a  ! 758: LDX_I	ldx	[%r22 + 0x015a], %r25
	.word 0xbb2d4000  ! 761: SLL_R	sll 	%r21, %r0, %r29
	.word 0xf255e018  ! 762: LDSH_I	ldsh	[%r23 + 0x0018], %r25
	.word 0xfa5dc000  ! 764: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xfa0de0f3  ! 765: LDUB_I	ldub	[%r23 + 0x00f3], %r29
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c0000  ! 769: ANDN_R	andn 	%r16, %r0, %r28
	.word 0xfc5c611f  ! 771: LDX_I	ldx	[%r17 + 0x011f], %r30
	.word 0xb1510000  ! 775: RDPR_TICK	<illegal instruction>
	.word 0xf21ca054  ! 776: LDD_I	ldd	[%r18 + 0x0054], %r25
	.word 0xfc14c000  ! 780: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xbf2d9000  ! 781: SLLX_R	sllx	%r22, %r0, %r31
	.word 0x8395206e  ! 782: WRPR_TNPC_I	wrpr	%r20, 0x006e, %tnpc
	.word 0xfc458000  ! 784: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xb950c000  ! 788: RDPR_TT	<illegal instruction>
	.word 0x85952144  ! 790: WRPR_TSTATE_I	wrpr	%r20, 0x0144, %tstate
	.word 0xbb50c000  ! 791: RDPR_TT	<illegal instruction>
	.word 0xfe4cc000  ! 793: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xb5510000  ! 795: RDPR_TICK	<illegal instruction>
	.word 0xf24d8000  ! 797: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0x839461fc  ! 799: WRPR_TNPC_I	wrpr	%r17, 0x01fc, %tnpc
	.word 0xf01d6153  ! 801: LDD_I	ldd	[%r21 + 0x0153], %r24
	.word 0x9195a0b7  ! 803: WRPR_PIL_I	wrpr	%r22, 0x00b7, %pil
	.word 0x8394e1d6  ! 805: WRPR_TNPC_I	wrpr	%r19, 0x01d6, %tnpc
	.word 0xb5508000  ! 809: RDPR_TSTATE	rdpr	%tstate, %r26
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a1b6  ! 813: WRPR_TNPC_I	wrpr	%r18, 0x01b6, %tnpc
	.word 0xfe05a122  ! 816: LDUW_I	lduw	[%r22 + 0x0122], %r31
	setx	data_start_6, %g1, %r17
	.word 0xf815a031  ! 819: LDUH_I	lduh	[%r22 + 0x0031], %r28
	.word 0xf245609c  ! 820: LDSW_I	ldsw	[%r21 + 0x009c], %r25
	.word 0xb33c9000  ! 822: SRAX_R	srax	%r18, %r0, %r25
	.word 0x8994e060  ! 824: WRPR_TICK_I	wrpr	%r19, 0x0060, %tick
	setx	data_start_1, %g1, %r17
	.word 0xf8448000  ! 826: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xf84c60bc  ! 829: LDSB_I	ldsb	[%r17 + 0x00bc], %r28
	.word 0xf11de026  ! 830: LDDF_I	ldd	[%r23, 0x0026], %f24
	.word 0xf2048000  ! 831: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xfa1560d6  ! 832: LDUH_I	lduh	[%r21 + 0x00d6], %r29
	mov	0, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x819461e5  ! 840: WRPR_TPC_I	wrpr	%r17, 0x01e5, %tpc
	.word 0xb6b50000  ! 842: ORNcc_R	orncc 	%r20, %r0, %r27
	.word 0xbb50c000  ! 846: RDPR_TT	<illegal instruction>
	.word 0x8d94619d  ! 849: WRPR_PSTATE_I	wrpr	%r17, 0x019d, %pstate
	.word 0xb3504000  ! 852: RDPR_TNPC	<illegal instruction>
	.word 0xf005e199  ! 853: LDUW_I	lduw	[%r23 + 0x0199], %r24
	.word 0xb29ce18d  ! 856: XORcc_I	xorcc 	%r19, 0x018d, %r25
	.word 0xb6c5a183  ! 857: ADDCcc_I	addccc 	%r22, 0x0183, %r27
	.word 0xfe5561a5  ! 859: LDSH_I	ldsh	[%r21 + 0x01a5], %r31
	.word 0xf044a1f8  ! 862: LDSW_I	ldsw	[%r18 + 0x01f8], %r24
	.word 0xfc5c0000  ! 863: LDX_R	ldx	[%r16 + %r0], %r30
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2cc000  ! 871: ANDN_R	andn 	%r19, %r0, %r29
	.word 0xf855e1fb  ! 872: LDSH_I	ldsh	[%r23 + 0x01fb], %r28
	.word 0xbf7d4400  ! 873: MOVR_R	movre	%r21, %r0, %r31
	.word 0xf01d0000  ! 878: LDD_R	ldd	[%r20 + %r0], %r24
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	setx	0xdcc9a6bd00005a48, %g1, %r10
	.word 0x839a8000  ! 883: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4454000  ! 886: LDSW_R	ldsw	[%r21 + %r0], %r26
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 888: RDPR_TL	<illegal instruction>
	.word 0xb0140000  ! 889: OR_R	or 	%r16, %r0, %r24
	.word 0xfc1d21ec  ! 891: LDD_I	ldd	[%r20 + 0x01ec], %r30
	setx	0x7c8f37e10000580d, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xff1d8000  ! 898: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0x89952028  ! 901: WRPR_TICK_I	wrpr	%r20, 0x0028, %tick
	.word 0xbd510000  ! 902: RDPR_TICK	<illegal instruction>
	.word 0xfa546167  ! 905: LDSH_I	ldsh	[%r17 + 0x0167], %r29
	.word 0x8194e170  ! 906: WRPR_TPC_I	wrpr	%r19, 0x0170, %tpc
	.word 0xbe9c4000  ! 907: XORcc_R	xorcc 	%r17, %r0, %r31
	.word 0xbd510000  ! 910: RDPR_TICK	<illegal instruction>
	.word 0xb750c000  ! 912: RDPR_TT	<illegal instruction>
	setx	0xa756bb4300009cce, %g1, %r10
	.word 0x819a8000  ! 914: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5dc000  ! 920: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xbf480000  ! 931: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf44dc000  ! 932: LDSB_R	ldsb	[%r23 + %r0], %r26
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1ce007  ! 936: LDD_I	ldd	[%r19 + 0x0007], %r30
	.word 0xb1641800  ! 938: MOVcc_R	<illegal instruction>
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05ca14f  ! 942: LDX_I	ldx	[%r18 + 0x014f], %r24
	.word 0x8594a10a  ! 943: WRPR_TSTATE_I	wrpr	%r18, 0x010a, %tstate
	.word 0xfc0d4000  ! 946: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf40c0000  ! 956: LDUB_R	ldub	[%r16 + %r0], %r26
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01dc000  ! 959: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xf44cc000  ! 960: LDSB_R	ldsb	[%r19 + %r0], %r26
	setx	0x291b90bb00005c54, %g1, %r10
	.word 0x839a8000  ! 961: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe95a184  ! 962: ORcc_I	orcc 	%r22, 0x0184, %r31
	.word 0xf45cc000  ! 963: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf844604a  ! 964: LDSW_I	ldsw	[%r17 + 0x004a], %r28
	.word 0xf51d202b  ! 965: LDDF_I	ldd	[%r20, 0x002b], %f26
	.word 0xfe4d4000  ! 969: LDSB_R	ldsb	[%r21 + %r0], %r31
	setx	0xf9f91d460000cf4a, %g1, %r10
	.word 0x819a8000  ! 971: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8794218c  ! 972: WRPR_TT_I	wrpr	%r16, 0x018c, %tt
	.word 0xff1cc000  ! 973: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0x8394a178  ! 980: WRPR_TNPC_I	wrpr	%r18, 0x0178, %tnpc
	.word 0xba8c6041  ! 983: ANDcc_I	andcc 	%r17, 0x0041, %r29
	.word 0xbf508000  ! 984: RDPR_TSTATE	<illegal instruction>
	.word 0xfa45c000  ! 986: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf4148000  ! 988: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf6154000  ! 991: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xbb480000  ! 994: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb2454000  ! 1: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xbfa98820  ! 2: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a88820  ! 4: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80c20  ! 5: FMOVRLZ	dis not found

	.word 0xb7a88820  ! 6: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb92c6001  ! 8: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xbfa94820  ! 9: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a489c0  ! 14: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbda58820  ! 22: FADDs	fadds	%f22, %f0, %f30
	.word 0xb7aa0820  ! 23: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda00020  ! 28: FMOVs	fmovs	%f0, %f30
	.word 0x819461ec  ! 29: WRPR_TPC_I	wrpr	%r17, 0x01ec, %tpc
	.word 0xb3a54960  ! 31: FMULq	dis not found

	.word 0xb5a44920  ! 33: FMULs	fmuls	%f17, %f0, %f26
	.word 0xbba00560  ! 39: FSQRTq	fsqrt	
	.word 0xb615c000  ! 40: OR_R	or 	%r23, %r0, %r27
	.word 0xbb480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9a588e0  ! 47: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 56: RDPR_PSTATE	<illegal instruction>
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c21ae  ! 62: XORcc_I	xorcc 	%r16, 0x01ae, %r24
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa549e0  ! 67: FDIVq	dis not found

	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 70: RDPR_TT	<illegal instruction>
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83952032  ! 78: WRPR_TNPC_I	wrpr	%r20, 0x0032, %tnpc
	.word 0xbf540000  ! 80: RDPR_GL	<illegal instruction>
	.word 0xb9a5c8a0  ! 81: FSUBs	fsubs	%f23, %f0, %f28
	.word 0x899421ff  ! 82: WRPR_TICK_I	wrpr	%r16, 0x01ff, %tick
	.word 0xbfa44840  ! 83: FADDd	faddd	%f48, %f0, %f62
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40860  ! 89: FADDq	dis not found

	.word 0x8394e0c9  ! 90: WRPR_TNPC_I	wrpr	%r19, 0x00c9, %tnpc
	.word 0xb6a50000  ! 92: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xb3a4c8c0  ! 99: FSUBd	fsubd	%f50, %f0, %f56
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c8c0  ! 118: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xb9a44820  ! 119: FADDs	fadds	%f17, %f0, %f28
	.word 0xb9a98820  ! 120: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbba4c9c0  ! 121: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xb3a81c20  ! 124: FMOVRGEZ	dis not found

	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448e0  ! 127: FSUBq	dis not found

	.word 0x83942096  ! 128: WRPR_TNPC_I	wrpr	%r16, 0x0096, %tnpc
	mov	1, %r12
	.word 0xa1930000  ! 129: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8794e15b  ! 131: WRPR_TT_I	wrpr	%r19, 0x015b, %tt
	.word 0x8395a153  ! 133: WRPR_TNPC_I	wrpr	%r22, 0x0153, %tnpc
	.word 0xb12c7001  ! 136: SLLX_I	sllx	%r17, 0x0001, %r24
	.word 0xb035a0d0  ! 139: SUBC_I	orn 	%r22, 0x00d0, %r24
	.word 0xb3a81420  ! 140: FMOVRNZ	dis not found

	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	.word 0xb9aac820  ! 151: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbda4c9a0  ! 153: FDIVs	fdivs	%f19, %f0, %f30
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61d0000  ! 158: XOR_R	xor 	%r20, %r0, %r27
	.word 0xb9a80820  ! 160: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0x81952099  ! 163: WRPR_TPC_I	wrpr	%r20, 0x0099, %tpc
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabcc000  ! 170: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xbda00040  ! 171: FMOVd	fmovd	%f0, %f30
	.word 0xb1a50840  ! 173: FADDd	faddd	%f20, %f0, %f24
	.word 0xbba81c20  ! 175: FMOVRGEZ	dis not found

	.word 0xbda40920  ! 176: FMULs	fmuls	%f16, %f0, %f30
	.word 0xb5a00020  ! 177: FMOVs	fmovs	%f0, %f26
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589e0  ! 180: FDIVq	dis not found

	.word 0xb5510000  ! 182: RDPR_TICK	<illegal instruction>
	.word 0xbdab8820  ! 184: FMOVPOS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x819520bd  ! 189: WRPR_TPC_I	wrpr	%r20, 0x00bd, %tpc
	.word 0x8994e0f3  ! 190: WRPR_TICK_I	wrpr	%r19, 0x00f3, %tick
	.word 0xbba00520  ! 193: FSQRTs	fsqrt	
	setx	data_start_6, %g1, %r21
	.word 0xb4b5a10c  ! 198: SUBCcc_I	orncc 	%r22, 0x010c, %r26
	setx	data_start_5, %g1, %r22
	.word 0xbc04207d  ! 200: ADD_I	add 	%r16, 0x007d, %r30
	.word 0x8395e023  ! 202: WRPR_TNPC_I	wrpr	%r23, 0x0023, %tnpc
	.word 0xbfa489c0  ! 208: FDIVd	fdivd	%f18, %f0, %f62
	mov	2, %r12
	.word 0xa1930000  ! 209: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda94820  ! 211: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00540  ! 212: FSQRTd	fsqrt	
	.word 0x899560a7  ! 213: WRPR_TICK_I	wrpr	%r21, 0x00a7, %tick
	.word 0x8394a0c6  ! 216: WRPR_TNPC_I	wrpr	%r18, 0x00c6, %tnpc
	setx	data_start_5, %g1, %r16
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 220: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbfab0820  ! 221: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb7518000  ! 222: RDPR_PSTATE	<illegal instruction>
	.word 0xbba00560  ! 226: FSQRTq	fsqrt	
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 230: RDPR_TL	<illegal instruction>
	.word 0xb7a48840  ! 231: FADDd	faddd	%f18, %f0, %f58
	.word 0xb224a074  ! 232: SUB_I	sub 	%r18, 0x0074, %r25
	.word 0xb7500000  ! 237: RDPR_TPC	<illegal instruction>
	setx	0x2d2c80c700006ed6, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a88820  ! 243: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbba5c860  ! 247: FADDq	dis not found

	.word 0xb9a4c820  ! 248: FADDs	fadds	%f19, %f0, %f28
	.word 0x8194600b  ! 251: WRPR_TPC_I	wrpr	%r17, 0x000b, %tpc
	.word 0xb3a489e0  ! 253: FDIVq	dis not found

	.word 0xb7540000  ! 254: RDPR_GL	<illegal instruction>
	.word 0xb3a88820  ! 256: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c960  ! 259: FMULq	dis not found

	.word 0x8994a163  ! 261: WRPR_TICK_I	wrpr	%r18, 0x0163, %tick
	.word 0xb7a5c9e0  ! 265: FDIVq	dis not found

	.word 0x8d95a122  ! 267: WRPR_PSTATE_I	wrpr	%r22, 0x0122, %pstate
	.word 0xb1ab0820  ! 268: FMOVGU	fmovs	%fcc1, %f0, %f24
	mov	0, %r12
	.word 0x8f930000  ! 271: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5510000  ! 279: RDPR_TICK	<illegal instruction>
	.word 0xbeb4a077  ! 281: SUBCcc_I	orncc 	%r18, 0x0077, %r31
	.word 0xbba80820  ! 283: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80c20  ! 285: FMOVRLZ	dis not found

	.word 0x91946009  ! 286: WRPR_PIL_I	wrpr	%r17, 0x0009, %pil
	.word 0xb3a8c820  ! 287: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb3500000  ! 289: RDPR_TPC	<illegal instruction>
	.word 0xb3a00040  ! 293: FMOVd	fmovd	%f0, %f56
	.word 0xbda54960  ! 294: FMULq	dis not found

	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 296: FMOVA	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0x8f930000  ! 297: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a509c0  ! 298: FDIVd	fdivd	%f20, %f0, %f58
	mov	1, %r12
	.word 0x8f930000  ! 299: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba81820  ! 302: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb8a40000  ! 303: SUBcc_R	subcc 	%r16, %r0, %r28
	.word 0xb0248000  ! 304: SUB_R	sub 	%r18, %r0, %r24
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 308: RDPR_TPC	<illegal instruction>
	.word 0x87946190  ! 311: WRPR_TT_I	wrpr	%r17, 0x0190, %tt
	.word 0xb1a8c820  ! 314: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0x8394610c  ! 315: WRPR_TNPC_I	wrpr	%r17, 0x010c, %tnpc
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 319: FMOVVS	fmovs	%fcc1, %f0, %f25
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 325: FMOVRLZ	dis not found

	.word 0xb5a50840  ! 327: FADDd	faddd	%f20, %f0, %f26
	.word 0xb6bc20cb  ! 330: XNORcc_I	xnorcc 	%r16, 0x00cb, %r27
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50920  ! 334: FMULs	fmuls	%f20, %f0, %f24
	.word 0xbfa50820  ! 335: FADDs	fadds	%f20, %f0, %f31
	.word 0x8d956196  ! 336: WRPR_PSTATE_I	wrpr	%r21, 0x0196, %pstate
	.word 0xb1510000  ! 342: RDPR_TICK	<illegal instruction>
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 345: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0x87942035  ! 348: WRPR_TT_I	wrpr	%r16, 0x0035, %tt
	mov	2, %r12
	.word 0x8f930000  ! 355: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda00540  ! 357: FSQRTd	fsqrt	
	.word 0x859420b7  ! 361: WRPR_TSTATE_I	wrpr	%r16, 0x00b7, %tstate
	.word 0xb1a80420  ! 362: FMOVRZ	dis not found

	setx	data_start_4, %g1, %r20
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 375: FSQRTq	fsqrt	
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81956069  ! 385: WRPR_TPC_I	wrpr	%r21, 0x0069, %tpc
	.word 0xb3480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58920  ! 393: FMULs	fmuls	%f22, %f0, %f30
	.word 0xbba81820  ! 404: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb49c8000  ! 407: XORcc_R	xorcc 	%r18, %r0, %r26
	.word 0xb3a90820  ! 408: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb7a4c9a0  ! 409: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb424e052  ! 411: SUB_I	sub 	%r19, 0x0052, %r26
	setx	0xfb8da54400005e17, %g1, %r10
	.word 0x839a8000  ! 412: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a80820  ! 413: FMOVN	fmovs	%fcc1, %f0, %f26
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 417: RDPR_TICK	<illegal instruction>
	.word 0xb9a48820  ! 419: FADDs	fadds	%f18, %f0, %f28
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a549a0  ! 425: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xb7a448e0  ! 427: FSUBq	dis not found

	.word 0x8795e08c  ! 435: WRPR_TT_I	wrpr	%r23, 0x008c, %tt
	.word 0x859420e4  ! 436: WRPR_TSTATE_I	wrpr	%r16, 0x00e4, %tstate
	.word 0xb5500000  ! 440: RDPR_TPC	<illegal instruction>
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c9a0  ! 444: FDIVs	fdivs	%f19, %f0, %f29
	setx	0x4b6d88d500008b8a, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xba15e18d  ! 449: OR_I	or 	%r23, 0x018d, %r29
	setx	0x36f473f80000c9c6, %g1, %r10
	.word 0x819a8000  ! 453: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda58860  ! 456: FADDq	dis not found

	.word 0xb9a81820  ! 459: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3480000  ! 460: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbe04a0f0  ! 461: ADD_I	add 	%r18, 0x00f0, %r31
	.word 0xb3a54920  ! 462: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb3a80820  ! 467: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb3a98820  ! 468: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a549a0  ! 470: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb5a81c20  ! 473: FMOVRGEZ	dis not found

	.word 0xb895e034  ! 476: ORcc_I	orcc 	%r23, 0x0034, %r28
	.word 0xb3aa8820  ! 486: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0x819560cb  ! 487: WRPR_TPC_I	wrpr	%r21, 0x00cb, %tpc
	.word 0xb5a48820  ! 488: FADDs	fadds	%f18, %f0, %f26
	.word 0xb7a90820  ! 489: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda54840  ! 490: FADDd	faddd	%f52, %f0, %f30
	.word 0xb9ab8820  ! 492: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	0x84826ebb0000685b, %g1, %r10
	.word 0x839a8000  ! 493: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x87946002  ! 495: WRPR_TT_I	wrpr	%r17, 0x0002, %tt
	.word 0xb1a80420  ! 500: FMOVRZ	dis not found

	.word 0xbda80c20  ! 502: FMOVRLZ	dis not found

	.word 0xbb510000  ! 503: RDPR_TICK	<illegal instruction>
	.word 0xb6b40000  ! 505: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xb7a00540  ! 507: FSQRTd	fsqrt	
	.word 0xb5a80c20  ! 509: FMOVRLZ	dis not found

	.word 0xb5a81820  ! 512: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbb7de401  ! 513: MOVR_I	movre	%r23, 0x1, %r29
	.word 0xbba80820  ! 515: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb0844000  ! 518: ADDcc_R	addcc 	%r17, %r0, %r24
	.word 0xbf500000  ! 519: RDPR_TPC	<illegal instruction>
	.word 0xbda00520  ! 520: FSQRTs	fsqrt	
	setx	data_start_1, %g1, %r21
	.word 0xb3a508a0  ! 529: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb7a5c960  ! 530: FMULq	dis not found

	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c9a0  ! 537: FDIVs	fdivs	%f23, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb57d4400  ! 546: MOVR_R	movre	%r21, %r0, %r26
	.word 0x8194e147  ! 547: WRPR_TPC_I	wrpr	%r19, 0x0147, %tpc
	.word 0xbba00040  ! 549: FMOVd	fmovd	%f0, %f60
	.word 0xb3a81c20  ! 550: FMOVRGEZ	dis not found

	setx	0x97a16d5100008edc, %g1, %r10
	.word 0x819a8000  ! 551: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3504000  ! 553: RDPR_TNPC	<illegal instruction>
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 557: RDPR_GL	<illegal instruction>
	.word 0x9195e176  ! 558: WRPR_PIL_I	wrpr	%r23, 0x0176, %pil
	mov	2, %r12
	.word 0xa1930000  ! 561: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xba258000  ! 565: SUB_R	sub 	%r22, %r0, %r29
	.word 0xb3a8c820  ! 567: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb28dc000  ! 568: ANDcc_R	andcc 	%r23, %r0, %r25
	mov	2, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5ab8820  ! 573: FMOVPOS	fmovs	%fcc1, %f0, %f26
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2954000  ! 581: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0xb5a94820  ! 582: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbda00520  ! 585: FSQRTs	fsqrt	
	setx	data_start_7, %g1, %r17
	.word 0xb935a001  ! 591: SRL_I	srl 	%r22, 0x0001, %r28
	.word 0x859420c9  ! 593: WRPR_TSTATE_I	wrpr	%r16, 0x00c9, %tstate
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 600: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5518000  ! 603: RDPR_PSTATE	<illegal instruction>
	.word 0xb750c000  ! 606: RDPR_TT	<illegal instruction>
	.word 0xbda409c0  ! 607: FDIVd	fdivd	%f16, %f0, %f30
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94214d  ! 611: WRPR_PSTATE_I	wrpr	%r16, 0x014d, %pstate
	.word 0xbf641800  ! 612: MOVcc_R	<illegal instruction>
	.word 0xbfa5c940  ! 614: FMULd	fmuld	%f54, %f0, %f62
	setx	0xa76d952800009b86, %g1, %r10
	.word 0x819a8000  ! 617: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbc858000  ! 618: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xbf500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0x919460e9  ! 624: WRPR_PIL_I	wrpr	%r17, 0x00e9, %pil
	.word 0xb0144000  ! 629: OR_R	or 	%r17, %r0, %r24
	.word 0xb9a80420  ! 643: FMOVRZ	dis not found

	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 647: RDPR_GL	<illegal instruction>
	.word 0xb9a4c960  ! 650: FMULq	dis not found

	.word 0xb7a588a0  ! 651: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb9a548e0  ! 652: FSUBq	dis not found

	.word 0xbba84820  ! 653: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb751c000  ! 654: RDPR_TL	<illegal instruction>
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 661: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb03c4000  ! 662: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0xb4b5e00d  ! 663: SUBCcc_I	orncc 	%r23, 0x000d, %r26
	.word 0xbfab0820  ! 667: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a44920  ! 670: FMULs	fmuls	%f17, %f0, %f24
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40840  ! 673: FADDd	faddd	%f16, %f0, %f24
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 676: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3ab0820  ! 678: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb8240000  ! 679: SUB_R	sub 	%r16, %r0, %r28
	.word 0xb9480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 695: FSQRTq	fsqrt	
	.word 0xb5504000  ! 697: RDPR_TNPC	<illegal instruction>
	.word 0xbc444000  ! 701: ADDC_R	addc 	%r17, %r0, %r30
	.word 0xb1a4c8e0  ! 702: FSUBq	dis not found

	.word 0xb7a94820  ! 705: FMOVCS	fmovs	%fcc1, %f0, %f27
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	.word 0xb5a5c940  ! 710: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb4b44000  ! 717: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xb21cc000  ! 718: XOR_R	xor 	%r19, %r0, %r25
	.word 0xb5a408c0  ! 720: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xb7a8c820  ! 721: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbf346001  ! 722: SRL_I	srl 	%r17, 0x0001, %r31
	.word 0xb095a012  ! 729: ORcc_I	orcc 	%r22, 0x0012, %r24
	.word 0xb7aa4820  ! 732: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa0820  ! 733: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbca5e043  ! 735: SUBcc_I	subcc 	%r23, 0x0043, %r30
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0xbfa549e0  ! 745: FDIVq	dis not found

	.word 0xbfaa8820  ! 746: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbdabc820  ! 747: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81820  ! 750: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbf352001  ! 753: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xbda44940  ! 754: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb6340000  ! 756: SUBC_R	orn 	%r16, %r0, %r27
	.word 0xb9a81820  ! 760: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbf2c0000  ! 761: SLL_R	sll 	%r16, %r0, %r31
	.word 0xb3a00540  ! 766: FSQRTd	fsqrt	
	.word 0xb9a81c20  ! 767: FMOVRGEZ	dis not found

	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22dc000  ! 769: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xbdab4820  ! 774: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9510000  ! 775: RDPR_TICK	<illegal instruction>
	.word 0xb12d1000  ! 781: SLLX_R	sllx	%r20, %r0, %r24
	.word 0x8395a16a  ! 782: WRPR_TNPC_I	wrpr	%r22, 0x016a, %tnpc
	.word 0xb7a509e0  ! 783: FDIVq	dis not found

	.word 0xb7a81c20  ! 786: FMOVRGEZ	dis not found

	.word 0xbba00520  ! 787: FSQRTs	fsqrt	
	.word 0xb150c000  ! 788: RDPR_TT	<illegal instruction>
	.word 0x8594a0e6  ! 790: WRPR_TSTATE_I	wrpr	%r18, 0x00e6, %tstate
	.word 0xb150c000  ! 791: RDPR_TT	<illegal instruction>
	.word 0xbb510000  ! 795: RDPR_TICK	<illegal instruction>
	.word 0xb9a98820  ! 796: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a508c0  ! 798: FSUBd	fsubd	%f20, %f0, %f58
	.word 0x8395a192  ! 799: WRPR_TNPC_I	wrpr	%r22, 0x0192, %tnpc
	.word 0x91942009  ! 803: WRPR_PIL_I	wrpr	%r16, 0x0009, %pil
	.word 0x8394e0f8  ! 805: WRPR_TNPC_I	wrpr	%r19, 0x00f8, %tnpc
	.word 0xb3a00520  ! 806: FSQRTs	fsqrt	
	.word 0xbda00520  ! 808: FSQRTs	fsqrt	
	.word 0xb7508000  ! 809: RDPR_TSTATE	<illegal instruction>
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395e19c  ! 813: WRPR_TNPC_I	wrpr	%r23, 0x019c, %tnpc
	setx	data_start_3, %g1, %r21
	.word 0xbd3d5000  ! 822: SRAX_R	srax	%r21, %r0, %r30
	.word 0x8994608d  ! 824: WRPR_TICK_I	wrpr	%r17, 0x008d, %tick
	setx	data_start_3, %g1, %r23
	.word 0xbda40840  ! 836: FADDd	faddd	%f16, %f0, %f30
	mov	1, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x819520d5  ! 840: WRPR_TPC_I	wrpr	%r20, 0x00d5, %tpc
	.word 0xbeb44000  ! 842: ORNcc_R	orncc 	%r17, %r0, %r31
	.word 0xbfa5c820  ! 843: FADDs	fadds	%f23, %f0, %f31
	.word 0xbd50c000  ! 846: RDPR_TT	<illegal instruction>
	.word 0xb3a8c820  ! 847: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x8d9521e8  ! 849: WRPR_PSTATE_I	wrpr	%r20, 0x01e8, %pstate
	.word 0xb5ab4820  ! 850: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb1504000  ! 852: RDPR_TNPC	<illegal instruction>
	.word 0xb09ce116  ! 856: XORcc_I	xorcc 	%r19, 0x0116, %r24
	.word 0xbec4e010  ! 857: ADDCcc_I	addccc 	%r19, 0x0010, %r31
	.word 0xbda549a0  ! 861: FDIVs	fdivs	%f21, %f0, %f30
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa488e0  ! 868: FSUBq	dis not found

	.word 0xbba40860  ! 869: FADDq	dis not found

	.word 0xbc2d0000  ! 871: ANDN_R	andn 	%r20, %r0, %r30
	.word 0xbf7c8400  ! 873: MOVR_R	movre	%r18, %r0, %r31
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 881: FMOVLEU	fmovs	%fcc1, %f0, %f30
	setx	0x371a838d0000ac59, %g1, %r10
	.word 0x839a8000  ! 883: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 888: RDPR_TL	<illegal instruction>
	.word 0xb4148000  ! 889: OR_R	or 	%r18, %r0, %r26
	setx	0xc6919ecb00007e47, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfab4820  ! 899: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0x8995613c  ! 901: WRPR_TICK_I	wrpr	%r21, 0x013c, %tick
	.word 0xbb510000  ! 902: RDPR_TICK	<illegal instruction>
	.word 0xbda48820  ! 903: FADDs	fadds	%f18, %f0, %f30
	.word 0xb5aa4820  ! 904: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x8194e0e4  ! 906: WRPR_TPC_I	wrpr	%r19, 0x00e4, %tpc
	.word 0xbc9c0000  ! 907: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xb3a589c0  ! 909: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xb9510000  ! 910: RDPR_TICK	<illegal instruction>
	.word 0xb1a98820  ! 911: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb550c000  ! 912: RDPR_TT	<illegal instruction>
	setx	0x7b10c17500006e01, %g1, %r10
	.word 0x819a8000  ! 914: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a00560  ! 915: FSQRTq	fsqrt	
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 929: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbf480000  ! 931: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 937: FMOVRNZ	dis not found

	.word 0xb7641800  ! 938: MOVcc_R	<illegal instruction>
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859520d6  ! 943: WRPR_TSTATE_I	wrpr	%r20, 0x00d6, %tstate
	.word 0xb3a40860  ! 945: FADDq	dis not found

	.word 0xb3a4c820  ! 947: FADDs	fadds	%f19, %f0, %f25
	.word 0xbfa00040  ! 951: FMOVd	fmovd	%f0, %f62
	.word 0xb5a81420  ! 954: FMOVRNZ	dis not found

	.word 0xbbaa8820  ! 955: FMOVG	fmovs	%fcc1, %f0, %f29
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	setx	0x589ac1600006842, %g1, %r10
	.word 0x839a8000  ! 961: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe942012  ! 962: ORcc_I	orcc 	%r16, 0x0012, %r31
	.word 0xbda5c860  ! 968: FADDq	dis not found

	.word 0xbda88820  ! 970: FMOVLE	fmovs	%fcc1, %f0, %f30
	setx	0x44f556c80000dc8c, %g1, %r10
	.word 0x819a8000  ! 971: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879521c4  ! 972: WRPR_TT_I	wrpr	%r20, 0x01c4, %tt
	.word 0xb5a549e0  ! 974: FDIVq	dis not found

	.word 0xbba00560  ! 976: FSQRTq	fsqrt	
	.word 0xb5a00540  ! 978: FSQRTd	fsqrt	
	.word 0x8394215a  ! 980: WRPR_TNPC_I	wrpr	%r16, 0x015a, %tnpc
	.word 0xbda4c840  ! 982: FADDd	faddd	%f50, %f0, %f30
	.word 0xb68d6062  ! 983: ANDcc_I	andcc 	%r21, 0x0062, %r27
	.word 0xb7508000  ! 984: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00020  ! 985: FMOVs	fmovs	%f0, %f25
	.word 0xb3a54860  ! 989: FADDq	dis not found

	.word 0xbd480000  ! 994: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1a94820  ! 995: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a90820  ! 996: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbba488e0  ! 998: FSUBq	dis not found


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

	.xword	0xc70fa85dbe829e23
	.xword	0x15abfee8884c49cf
	.xword	0x1024ea4b110deedb
	.xword	0x08b16eff54ac1ad8
	.xword	0x3d1587188823aaf9
	.xword	0x225c719088ee7492
	.xword	0x68f1edb95dcbd856
	.xword	0xe4ef8ad8007d0b58
	.xword	0xd35ac58997d59fff
	.xword	0xcfcef149ec628f84
	.xword	0xe5f41a3e0f651f46
	.xword	0x5dbbf660ee3ecee6
	.xword	0x6718608d29f972e4
	.xword	0xeebc7ab51dfd8b8e
	.xword	0xb50e6c64c0be7389
	.xword	0x59fd7a2b32366719
	.xword	0x5f3cf83324dc6429
	.xword	0x144b9609f18a694b
	.xword	0x8de3b95e9aa39fe5
	.xword	0x9340cddc68525bf3
	.xword	0x1c46a2c77574c3ec
	.xword	0x9dc40abd95dde406
	.xword	0x28f6a65423c85cab
	.xword	0xb16fc4fa6329e27d
	.xword	0x41c3264f0dadb9b1
	.xword	0xa764deba01576757
	.xword	0xa3ec3e58085d470e
	.xword	0x1ccb3ff0037aca15
	.xword	0x700d489421173b5e
	.xword	0x9d8966f63212f33a
	.xword	0xbbe85c3e623054a4
	.xword	0xa056aade1cb50e73
	.xword	0x22eca43afd343a1f
	.xword	0xabbd123a03844d47
	.xword	0xebfab75640e7c138
	.xword	0x65c1c69c172e4867
	.xword	0x1265897d85eee986
	.xword	0xc5bed4ff0c07d449
	.xword	0x813a234c03ebcd76
	.xword	0xcdce0d746814c7e2
	.xword	0xa5fcd78f3f84d8c2
	.xword	0xe9b3ac6861db708b
	.xword	0x520e22265822e006
	.xword	0x8120ba14cd642ed7
	.xword	0xee0bc4d4c50a0219
	.xword	0x676b3179d75843df
	.xword	0x7ae89903d47196de
	.xword	0xdfc705e96e3c97b9
	.xword	0xb63e4a9198e3985b
	.xword	0x78205cfd5a53bfc4
	.xword	0x812c96853bc42229
	.xword	0x96d702254b847732
	.xword	0xee3f012095ff7806
	.xword	0xe2730dcef2e75302
	.xword	0xaee91d40b9e28e9d
	.xword	0x1129994412349841
	.xword	0x003ba237abdd85a8
	.xword	0x3508458200a5a308
	.xword	0x93f26d0accc1c652
	.xword	0xb07b475a2e775e2d
	.xword	0xed3fea6b1ba41828
	.xword	0x6d673b38b5ce86e9
	.xword	0xdd0d05644ff66f97
	.xword	0x810a8ec84c30b5e9
	.xword	0x999e2e7c3b9e060d
	.xword	0xc70fe4598764a16e
	.xword	0xe7132c07bbf05cf5
	.xword	0x646ffe80de097457
	.xword	0x00ba3ad1e725e855
	.xword	0x32a1f69d328e5530
	.xword	0x43ebb345ebdff701
	.xword	0xb3985eb19b129c5e
	.xword	0x6efa8cfbf93e5898
	.xword	0xbd25a303a27975a7
	.xword	0xdab58f3e93efd8d0
	.xword	0xf8d375c29e260890
	.xword	0x77d03f8f5e46e053
	.xword	0xbf590f5ffb077c40
	.xword	0x62774ea3f5deddee
	.xword	0xe60db1087b42951e
	.xword	0x673f0a635938ca34
	.xword	0xe3832d0977be2459
	.xword	0x50b5403e22386cc7
	.xword	0x8b4cab75e10d236a
	.xword	0x5e69e66296fca0ff
	.xword	0xd510b3676f341311
	.xword	0xf5af4161440773fb
	.xword	0x578fcbed36671e01
	.xword	0x947ecd63932df439
	.xword	0xeea4f60b1bb7d2f2
	.xword	0x891da1e98a6a9987
	.xword	0x4b8902302f722cff
	.xword	0x743457ba75f85a9a
	.xword	0x823dee979374b625
	.xword	0x6803dbf2b3b34cfd
	.xword	0xc9390220177aa880
	.xword	0xab44d11dcb1e0c43
	.xword	0x71b08d22e530c0d9
	.xword	0xbca6ea49c2739e08
	.xword	0x923c0a2ed00d31a1
	.xword	0x7574b017c801af72
	.xword	0x3b362bc982343681
	.xword	0xc062d37bae2415a2
	.xword	0x61474aeb747529dc
	.xword	0xee37803b95949c21
	.xword	0xbf31fb822c8e9262
	.xword	0xba0bc76e5ca14a7e
	.xword	0xc032113421552155
	.xword	0x045f09c2457cdce0
	.xword	0x3038af1c6879fc81
	.xword	0xb61b556707177d8f
	.xword	0x913a639a95eca11e
	.xword	0xa7c5a94141bf2e6a
	.xword	0x3c6425a4b5d3d9e5
	.xword	0xd60d5cb67c7f59f0
	.xword	0x45eebc24442d7572
	.xword	0x811cfd1ebecaf550
	.xword	0xa218e58b7f5259df
	.xword	0x5a764c6f52328c21
	.xword	0x4ba62469849d83c1
	.xword	0x015d8fd1a742e41f
	.xword	0xca22a6c65f427ce0
	.xword	0xeeff723334ea4360
	.xword	0x5b6a1e393f93de42
	.xword	0x866d404671c42bfa
	.xword	0xe0745f4bc629e9db
	.xword	0xb98f76cd56086335
	.xword	0x53d7e035b96fb621
	.xword	0x40577264841c2151
	.xword	0x6bd4adf138fd3d12
	.xword	0x136aa62cdb17a0c2
	.xword	0x6783fc50fc42c491
	.xword	0x2c702302c3e94a75
	.xword	0xedc6bc7d89077d1c
	.xword	0x73f603bb078cce28
	.xword	0xa8f5bf7f6aa387c3
	.xword	0x6d8e9517337849ec
	.xword	0xb4090c3a3ca4d852
	.xword	0x7111acebdcf7f27b
	.xword	0xcde7d5de66b43f47
	.xword	0x1f5149a6318bc4b7
	.xword	0x7e4b565b922f1411
	.xword	0x3ba5a3bd2f7bf8a7
	.xword	0x8f89af347aeb3284
	.xword	0x6b7fdb3821057ad5
	.xword	0x7ed1faa0985c65fb
	.xword	0xe1f9e43b7ca1b8da
	.xword	0x444eb8bfa5401a6b
	.xword	0x5646bac60d863830
	.xword	0xa23f9802a76705bf
	.xword	0x1806bbf9355b9b2f
	.xword	0xedbc48db8ab4b956
	.xword	0x4fe5187bbde1f845
	.xword	0x77c35a26e1afc8c4
	.xword	0x0fd9329fe0f8f9c1
	.xword	0x55e2f42a997db175
	.xword	0xfa8ce1563916e705
	.xword	0x54bf3ce3785acbf8
	.xword	0x340dbb5b732dc940
	.xword	0x8ca2fad63323d776
	.xword	0x92d044c2081e2928
	.xword	0x91591a8f98d23b08
	.xword	0x6dcf34b3bd64fc29
	.xword	0x578614e4c52118c7
	.xword	0x55c8cf768fbe1ec7
	.xword	0xf2091aa029ea937c
	.xword	0x3d12a44bd2185924
	.xword	0x7e25847643836480
	.xword	0x7417b4b4398b331b
	.xword	0xfb6a719a81b1ae86
	.xword	0x9605074e46037647
	.xword	0xdc146affb47087b8
	.xword	0xce856d6453da6903
	.xword	0x6b0d720c237cd5dc
	.xword	0xe8c8fcd400d39e6a
	.xword	0xcc8823a09f66a728
	.xword	0xee46ffc78f154e32
	.xword	0xb0421bc3332bc8c3
	.xword	0xd5ae0ed308dded1c
	.xword	0xe9e561607640b8f9
	.xword	0x775060bb0ad208e2
	.xword	0x1cf754dae6cac72c
	.xword	0xf8ccb48c4ef16a20
	.xword	0x2c0fa4245236124c
	.xword	0x7026b07efc13a087
	.xword	0x1ce060be2ef321eb
	.xword	0x15ffa5a986b19e34
	.xword	0x4d451c2a8776d525
	.xword	0x00aabf7b57bd5398
	.xword	0x21898d975b730e5f
	.xword	0x5b61141731e15755
	.xword	0x3dec762680c746f7
	.xword	0xbe36c16dc1110378
	.xword	0x5bd0bc6f3af8b2d7
	.xword	0x95a4418b70b1450a
	.xword	0xbd1a86500f6fd969
	.xword	0x4303108ecccddeb1
	.xword	0xec762f2713ed5af7
	.xword	0x795652acbe1d54d7
	.xword	0xdbdcd326fb8cc928
	.xword	0x5cda519b26fd8cb3
	.xword	0xb443b16c582a054f
	.xword	0x8e48ce8cf4decaf2
	.xword	0x0ad4716d392f5df5
	.xword	0xe4b60970219022b1
	.xword	0xda9aac3adcc8322f
	.xword	0x4ac32243cc992fd7
	.xword	0x8582d274a60eddff
	.xword	0x4ef0d59a319ebd38
	.xword	0x39ad7b3cee39209c
	.xword	0x34d47e9ecc9f0942
	.xword	0xc18713122c95af78
	.xword	0xe33f7ba84aa9e9e1
	.xword	0xf7811ee53f8d4fab
	.xword	0xb40bfb4552f702ea
	.xword	0xd7a52a436a8a9533
	.xword	0xc04d39ad7303d013
	.xword	0x4c8e386bb70b549e
	.xword	0x3703248dcc947dc3
	.xword	0x52104f933dd1034d
	.xword	0xf28f11208c8adabd
	.xword	0x63666765b54ebf0a
	.xword	0x16e68c804dadfd24
	.xword	0x6381472a831603ba
	.xword	0x1596f358b4990ca5
	.xword	0x22f56b73e813dfcb
	.xword	0xefc0816bee58e67e
	.xword	0xdff3b379fee14604
	.xword	0xc560210957b0352c
	.xword	0xdfd4fad8e9b4a875
	.xword	0xf6ad0544c01e8cae
	.xword	0x8cee4a2692bbb2e4
	.xword	0x4ef8ddd04c688ae1
	.xword	0xb962d5ade1705895
	.xword	0x714fc2a0ff9a34e8
	.xword	0x0fbf301831f9eed0
	.xword	0x9eeb55554b64eec8
	.xword	0x756c99cbf0b99ba0
	.xword	0x9e2facda6d1c1f54
	.xword	0x4423cc3b64aff7b2
	.xword	0x785f29ee9243d637
	.xword	0xa66377e50b849c55
	.xword	0x3b7a591dc1437932
	.xword	0x7b418baa61237214
	.xword	0x0c62fc7e56db7f68
	.xword	0x4d9236e23207a810
	.xword	0xaf0c91a43e606702
	.xword	0xab1423dd147ec446
	.xword	0x6c684c2326517b4a
	.xword	0xf7554bd6b9af5f63
	.xword	0xfc308a86f44a4ebc
	.xword	0xbbdcab54afd1de88
	.xword	0x6ed351e5a1fb9311
	.xword	0xcd1986b60b1e47db
	.xword	0x31353b792357d25c
	.xword	0xef36f52da404fdde
	.align 0x2000
	.data
data_start_1:

	.xword	0x29656be13723aed9
	.xword	0x4dc73def04d3eb69
	.xword	0xa50f5a4950cc2c28
	.xword	0x2f60e4e1ed481b50
	.xword	0xbc9b646aa4db24b0
	.xword	0x76fd7c11bc690c66
	.xword	0x1c9113ce14541083
	.xword	0xb401a1e624cb1873
	.xword	0xf917ed47e9889f03
	.xword	0x57db9c5c9bea2ec3
	.xword	0x736c855dd632f6e4
	.xword	0x13e9f106bfdf9e47
	.xword	0xe5455d9a95e6f592
	.xword	0x8862881364339d91
	.xword	0x57d472c428b67f97
	.xword	0xe503ab2bf7432d48
	.xword	0x7c0f3a1efb07b52f
	.xword	0xc91a70461efd856a
	.xword	0x31f95d61e2525fef
	.xword	0xe3102c090a6da688
	.xword	0x8d65c6df99c628b3
	.xword	0x6b0c9b75b791f31b
	.xword	0x3ff2867e95805967
	.xword	0x662e4fd1426aacca
	.xword	0x2208338e47755393
	.xword	0x3c570885800d701a
	.xword	0x32dac1a4cefb7939
	.xword	0xf6be487396456d37
	.xword	0x90dd9df1491388be
	.xword	0xb5b8315187214e34
	.xword	0xfcf94f5eba1fe655
	.xword	0x17b2009337ba1d0a
	.xword	0x304a85aadd89babb
	.xword	0xced5d8cc7252ccab
	.xword	0x0e684f3e96239fcb
	.xword	0x8c1e0588397ea2fa
	.xword	0x03e2961a433c26e3
	.xword	0xb6638fdf2ab14184
	.xword	0xa25d6bbd63d4308e
	.xword	0xd51c0f7cd79fa5f3
	.xword	0x495d7e8f8fede8d0
	.xword	0xa2a4e8cd8a887990
	.xword	0x91d8d133cbfefb17
	.xword	0x8e6578e740be1f19
	.xword	0x37915e1edd4e142a
	.xword	0x623d1ab56265e4e7
	.xword	0x7c70c4dcfc643a90
	.xword	0xbf3f24c2cdb928ea
	.xword	0x20f2a0d438125856
	.xword	0xa6721820677dcb5b
	.xword	0x52e12ebf9dfe4e89
	.xword	0x6b44b45ca6535156
	.xword	0x808e8d6aa768ca85
	.xword	0x2cd50946eebffbac
	.xword	0xff921d00d239c0d6
	.xword	0x44c613c660414137
	.xword	0x59790ca1a5830b34
	.xword	0x0051e6e3985e32a7
	.xword	0x40d9862d62f33206
	.xword	0x15c7ab0356c09e65
	.xword	0xd3babf6d71ca9889
	.xword	0xe332f7949c800885
	.xword	0x5293937cfac86c00
	.xword	0x6fd2ff18a878d854
	.xword	0xb79c2ef46a8a3c79
	.xword	0x920056b9b42578dc
	.xword	0xf86f5a3c6d5758b6
	.xword	0xce2ba23ef626cde2
	.xword	0x2798b095aa43df5e
	.xword	0xf422a4490ee2eb1d
	.xword	0xc54821121e5d3b21
	.xword	0xbe0ea8a656fa3ebf
	.xword	0xd34764c79dba1d6d
	.xword	0x4bf46e2a38cebe19
	.xword	0x77a3110cbd0a1b9e
	.xword	0x031cfada7a80fed3
	.xword	0x1cae29e19e20eb04
	.xword	0xbe2665c07fa13812
	.xword	0x35d4c65d2c6e3d30
	.xword	0xab1b4137b87a7b21
	.xword	0x5de29cb9561c8042
	.xword	0x682ed183368592c8
	.xword	0x81318c0b8185b174
	.xword	0x1f493efc200dcff3
	.xword	0xa76d8b7975bff2ab
	.xword	0x58c3eb03602f645d
	.xword	0x2f92b9b0386c2d73
	.xword	0x5591aa1add752c7b
	.xword	0xa9751f2d3e11b13d
	.xword	0x9655d8b11c4e8a70
	.xword	0x5dcd401b96a9b4ce
	.xword	0x01c38930adec2293
	.xword	0xe43a2ca26d5a7df6
	.xword	0x09c7f784af95e45b
	.xword	0x87fb098c99ae0f5e
	.xword	0x3296a6b7c9962372
	.xword	0x539887f50b642536
	.xword	0x5af5ce0786618fc5
	.xword	0x14e939387d9b4ba8
	.xword	0x4b4a73cbb43f2b5a
	.xword	0x8a418fe7512924e3
	.xword	0x67375cb6ce826fb9
	.xword	0xce329b959c8d382a
	.xword	0x3a1a606a452871cd
	.xword	0xe53090a340d17f63
	.xword	0x0cd7437e0af68596
	.xword	0x59ac48affb08b310
	.xword	0x5e08a6714f9f0fe8
	.xword	0x04e6c9a506117b4a
	.xword	0x5f74ce248ac4db85
	.xword	0x90a3d4b9e7575054
	.xword	0x8060e310814f96b6
	.xword	0x9d315fd964bb5ecd
	.xword	0xaff6fa368747a6ba
	.xword	0xc9c748b294f6b659
	.xword	0x703bed2885b58b44
	.xword	0xcd5941af380b06c1
	.xword	0x9c284d3ccf50bfd0
	.xword	0x6c94ae88a368310d
	.xword	0xe8e8609a79fee757
	.xword	0xdbeeb95a5c3ba16d
	.xword	0x324054c293c7defc
	.xword	0x217fc9cb1c71a156
	.xword	0x6c562d70c0b161d4
	.xword	0x5504a1f6b3f3d40b
	.xword	0x67a2796b1c9998fd
	.xword	0xf75c0d55cdddedf0
	.xword	0xef31d30e551fa6f8
	.xword	0x498a3016f9cfbc87
	.xword	0x5d9cb5a11b3af6cc
	.xword	0x9d2bc9240bf6ae1b
	.xword	0xd3d0ebb0f9d75ff5
	.xword	0x14b29c7621961de2
	.xword	0xe27ff7224a7440d1
	.xword	0x717f27453768b4a1
	.xword	0x6094f810befcdc6e
	.xword	0xdb7c43931eae780d
	.xword	0x09078bafb3057693
	.xword	0x3ad9b21b614c4b37
	.xword	0x488cf4e30c2dfee7
	.xword	0xb2c4127fb9bd2bf5
	.xword	0x26062648c7db9aec
	.xword	0xb9ee2e07e407223a
	.xword	0x5cb933b491a318ee
	.xword	0x421597fa4050096c
	.xword	0x3f9055bd75334902
	.xword	0x22d75693c97799d2
	.xword	0x2fe24a17828772b5
	.xword	0x085fd32de69ff0f5
	.xword	0x29d00e26d71cb14f
	.xword	0x010b149145b1fe85
	.xword	0x883c646346c886bc
	.xword	0x8cada7214cc54dcd
	.xword	0xdffdac9679560a5e
	.xword	0x33c91b647cbf0565
	.xword	0x143a128dc5ca0a25
	.xword	0x192e5f0f215f9e1a
	.xword	0x8f10a98c364ba947
	.xword	0x398650dcc6f8982b
	.xword	0xb2c29c802b2cec49
	.xword	0xd103583c3f4d3142
	.xword	0xfd68fb087bbae236
	.xword	0x0e35b680857d2b69
	.xword	0xa797092baa8b7ef1
	.xword	0x784c9796c112ed5a
	.xword	0x14f0755523238e6b
	.xword	0x23ebf02aeb9badad
	.xword	0xdc778c2f8b143030
	.xword	0xe88b59137ac2c3fd
	.xword	0xb7312e48951616ad
	.xword	0xe5e141f7c4c37675
	.xword	0x83db3ea6d2bd2235
	.xword	0xeb8da1944f3cf895
	.xword	0x3c34b22c3f4f1af0
	.xword	0xbdbfd2b7bd45cce9
	.xword	0x839e6b98ca47411c
	.xword	0x687ae5f6e890455d
	.xword	0x48db3bf0a9a8dfb7
	.xword	0xfb746b8277bb6944
	.xword	0x65831edc60acd6a5
	.xword	0x3800e60d8f06721c
	.xword	0x76c4a270a5c87375
	.xword	0xa5d8ad70221ce0df
	.xword	0x3e58e74b5936e431
	.xword	0x22a50eb7e69a515c
	.xword	0xdd46ae12188c3990
	.xword	0x14eef074bb70d0bc
	.xword	0xc9fa54815cfc8fc5
	.xword	0xfd833bcaf4e3287d
	.xword	0x3a2813bf1e9345e8
	.xword	0xa368fa75dd5784f6
	.xword	0xf42206b8beb9b643
	.xword	0xc376a1044ad8ef4c
	.xword	0xffd902fa32643e9e
	.xword	0x7be0ae5394f783a1
	.xword	0x97e4c6649f323b07
	.xword	0xa8659f8676d1fd33
	.xword	0xe389b562010a50c7
	.xword	0xb12f16960450e149
	.xword	0x9e85ac096043c89c
	.xword	0x1d16f2f5fa9766b9
	.xword	0xe190e72f050326ad
	.xword	0x7661b4df4cbdcb95
	.xword	0x77b12bd92f5f8c40
	.xword	0xf762991d2d867f37
	.xword	0x552ed0015c314d7c
	.xword	0xe4e9918918a7504f
	.xword	0x73ab4d45e7e79c7f
	.xword	0x38154631af98aac5
	.xword	0xd8a563239ff35fb4
	.xword	0x01166fb2bb7a3a15
	.xword	0xc75ce3c8befb58f3
	.xword	0x74a70846d295c465
	.xword	0x7bec6fa581aab34d
	.xword	0x922a838a72b2bb20
	.xword	0x8306cc107168d6d6
	.xword	0xc3a69879c3da15eb
	.xword	0x75579b02b28547ed
	.xword	0x76650f240595a32b
	.xword	0xd7299801228e47c0
	.xword	0x4e39d48c968f03e0
	.xword	0x1ed4eb2ebe706df7
	.xword	0x541dae5b5bff882c
	.xword	0xde63fbcb5a95c8d9
	.xword	0x9b7c2f1a6a672da9
	.xword	0x3f8f1212e0cee69f
	.xword	0x95e47c4a89cf2f99
	.xword	0x8efcdfd01abbb568
	.xword	0x79a87d3d163ae6ac
	.xword	0x14c78ed3b74d1c87
	.xword	0xce717f1190b30c52
	.xword	0xcdfe5f809265410b
	.xword	0x2062a3d8dee3f180
	.xword	0x5276e8384ace9d9b
	.xword	0xa0b99c35ad0280da
	.xword	0x8aae495bc16293eb
	.xword	0x95f1adc4d0ab6a90
	.xword	0x3007c0b7636344b2
	.xword	0xe9fab1c77a1c3f0a
	.xword	0xafc91fc07fedf05f
	.xword	0xd226b4dc272aa361
	.xword	0xf0f6f190f93a9915
	.xword	0x4dc96459817010a3
	.xword	0xebd371d21abed6e4
	.xword	0x6fd5bddf8c8dfafb
	.xword	0xf4fb1d5686d9d35c
	.xword	0x4324d282e67ada87
	.xword	0x45addd1f11c5d42c
	.xword	0x91f4a8c2ec833060
	.xword	0xb99cb433e7e95a51
	.xword	0x680547d5528a9f64
	.xword	0x5d93e6d177306c12
	.xword	0xd880134632ce3809
	.xword	0x5c8e55554ed9d612
	.xword	0xd3734045fb7ba295
	.xword	0x7a7858c4433b3eab
	.align 0x4000
	.data
data_start_2:

	.xword	0xb82be7fc55771377
	.xword	0x01ffc540a9950622
	.xword	0x44f92be6448b8113
	.xword	0x168221ec00843b65
	.xword	0xbca856d7dacb5e7c
	.xword	0xed088f6b6b7be97c
	.xword	0x7e01f2902c9497f3
	.xword	0xfb38ddec0c7c7c7a
	.xword	0x0d4745a357fd5666
	.xword	0xa13860bf6562b4b9
	.xword	0x3ad1933f8d6f43ad
	.xword	0x102b69b9d090b2aa
	.xword	0x3dda6289c563b800
	.xword	0x9ad931d13e12e108
	.xword	0x71d629ec26855df6
	.xword	0x9e033dea34232b7b
	.xword	0x59cc780b5c429050
	.xword	0x07094adfd0dda596
	.xword	0xd16f75dd05eb2b3c
	.xword	0x32d8dc98e92f44d5
	.xword	0x3a88ee1915c17e94
	.xword	0x2becdef2a460df53
	.xword	0xe2f34ab7436e220d
	.xword	0x1a69fde588e79ca8
	.xword	0xa8cdcbabfaf1ea2e
	.xword	0x3b5d27fe87004d27
	.xword	0x1eaf98390346ad74
	.xword	0x10940d570e044ef5
	.xword	0xb8ff5ef6c4bd3a40
	.xword	0xfb986a53377abeda
	.xword	0x0e8066ef6151f4e4
	.xword	0x917d4a0e6ee2a842
	.xword	0xb160fd8775346d5d
	.xword	0xe459c240bb0d82ef
	.xword	0xdfe87c81211f9b37
	.xword	0xc3dd941e0d19b69a
	.xword	0x27bbdbdc3bdc17c8
	.xword	0x038858aa4ddd9f1e
	.xword	0x70e50b83fb2a0f2c
	.xword	0x634ae85885174a60
	.xword	0x38a1d7f8fd07ac9c
	.xword	0x8fee4b1f981351e2
	.xword	0x891de616261af444
	.xword	0xdf55bf67398ec6a6
	.xword	0x4142009703036e7c
	.xword	0x08a066d61c5efaa9
	.xword	0x70fcbe42fc5e5197
	.xword	0x3a64933c056bf5a8
	.xword	0xc760d7cda941c476
	.xword	0x9c2dbdb409097ab4
	.xword	0xa82d51b492acc071
	.xword	0x356a359f20ee6f5a
	.xword	0x3ea6952170141f86
	.xword	0x9ad89bd7a1b3c6da
	.xword	0x85ab1cbfcef75883
	.xword	0xb3abca6af15c7cc9
	.xword	0xf86814f999bf0abe
	.xword	0x97d124d0598a657b
	.xword	0x2c610e9c57709d04
	.xword	0xd661b209f2ef7ad6
	.xword	0x7dedb657cfa7aec2
	.xword	0xbd38612b58ce14ad
	.xword	0xf56ab9a0efdffa45
	.xword	0xd59ff8bcd7979c18
	.xword	0xce872eebc6e79ccf
	.xword	0x333b5de4f2d39977
	.xword	0xc104c127c77c175b
	.xword	0xa427c2c437a6c8ef
	.xword	0xc20e7a1c0b42c23e
	.xword	0xe4f313a166022b80
	.xword	0x9697dbd6dd66cabb
	.xword	0x35916ba272f4c62c
	.xword	0x793043e2a11eb03b
	.xword	0x5b939282fb770acd
	.xword	0xfab68f83a3152359
	.xword	0x1bb834cde7f92f78
	.xword	0xeef01587cddbc091
	.xword	0x3098c6361783c07e
	.xword	0xa786d4cfc2230dee
	.xword	0x4573e1aa049695d6
	.xword	0x4f4d4fea65f314a5
	.xword	0xd0ca625484d6c897
	.xword	0xeaf7c41bba22b737
	.xword	0xa48bf6d9395e8f9f
	.xword	0x32d896a9bf291afe
	.xword	0x806c011b48f97d16
	.xword	0x310646be31362104
	.xword	0xa0407a4466ed74c5
	.xword	0x117ba68da5fd5e10
	.xword	0xef04c649501a9bfe
	.xword	0x122973abb3cab478
	.xword	0x2609f943007fa745
	.xword	0xd6fee3606d7803fc
	.xword	0xebcf84d99232c949
	.xword	0x249a0b433f908088
	.xword	0x7d3cab785da22d3b
	.xword	0x0027ae2d6539ef48
	.xword	0x5a335c06ff0f38a2
	.xword	0xe1cdcef1dee2be24
	.xword	0xa13329474f5b5897
	.xword	0xd85b6fa31052066e
	.xword	0x8d73ef60cac143e7
	.xword	0xf7105b3b876e4d02
	.xword	0xe96274ea16d689f2
	.xword	0xc7f648d7f8262400
	.xword	0x8418922b7084dc0c
	.xword	0xa89e114be5f8a01e
	.xword	0xa4146db7e5db55db
	.xword	0xcbf9489f96ce7fc5
	.xword	0xb0a113a8eb6f6d4e
	.xword	0xa61e7012f76a405f
	.xword	0x295864fd1f5cf3e0
	.xword	0x24e42bfd72e8b39d
	.xword	0x0c397ccf89642e9b
	.xword	0x369dd4734d058018
	.xword	0x8bcb204f33784b54
	.xword	0x7e19545e0bc5573c
	.xword	0xc8342bd735e9477c
	.xword	0xa72c1ed4d0d81da6
	.xword	0x454c2fa61063518a
	.xword	0xba58457610f16b89
	.xword	0xb55abe95f26fcae5
	.xword	0x90b5371294b07c92
	.xword	0xa0aebb305f9cfe4c
	.xword	0xd8325bf3dce38e32
	.xword	0x3f44c46daa986450
	.xword	0x44aa22f8e1d6f689
	.xword	0x5b8c36c375ed66f6
	.xword	0x706707bd5c0e1c68
	.xword	0xc7cdab2e8b83e7a5
	.xword	0x96f9f402e362ce1b
	.xword	0xf131e5501fb36cb2
	.xword	0xd82a268d2a64ac34
	.xword	0x7c594560f88a9646
	.xword	0x8829325d51e874c9
	.xword	0x3c83aa5773f10676
	.xword	0x026bfade1ad12cb7
	.xword	0x256a4cfb741ffa7e
	.xword	0xf7889f6d08a6f5f0
	.xword	0x613c2d89f5e46ab0
	.xword	0x4c1a20dbedfae492
	.xword	0x506729cc31f61c2c
	.xword	0x672b2d857792d047
	.xword	0x6973317569c7cc76
	.xword	0x2e2e19de3638c635
	.xword	0x35173de68a7c9e4e
	.xword	0x66908b38c80bad11
	.xword	0x6657d9f873c1fb11
	.xword	0x8dead65d7f5cfb09
	.xword	0xaec9cdeb9a83756d
	.xword	0xfa3a4537e1759c79
	.xword	0x16a8ed0d57779abf
	.xword	0x0cf9889a308992e0
	.xword	0xbb350c52f36303f3
	.xword	0x2ef52cb9e8971d94
	.xword	0x14380034cea8bb78
	.xword	0x7bc8867348044bbc
	.xword	0x8f6c3fefe8d4c52b
	.xword	0xabfa92b698045e4e
	.xword	0xef698b3e8ef96441
	.xword	0x12bf5755d2b6b479
	.xword	0x8e4fc4537cea8000
	.xword	0x25cb71d8bcdff83c
	.xword	0xb2d138b11afb9cfc
	.xword	0x5ea2f5915040de3e
	.xword	0x63288dd53a92f49a
	.xword	0xb82d1b04d559d8f7
	.xword	0x81eb614d52b4526b
	.xword	0xccbe90e5686ddef5
	.xword	0x036dc83a224df786
	.xword	0x95ee5b02815b1a5f
	.xword	0x11c457536b4dc52d
	.xword	0xf368b594f04ad7e6
	.xword	0xab3f52ac75ba654f
	.xword	0x2af4c42832a1f40b
	.xword	0x60c1c9a65ed40de3
	.xword	0x376db70ab703eef1
	.xword	0x24a613dcd704dd0b
	.xword	0x70e8abaccbb4b5bb
	.xword	0x09fdf2601f68a7d0
	.xword	0xa20a604063098982
	.xword	0xff308a838e1869a4
	.xword	0x64ae1ffca9b06702
	.xword	0x8fb5828fc9578f0f
	.xword	0xa7eb581b7f1afa34
	.xword	0xe38bb7c333b71e23
	.xword	0xf318f04fa9a247fd
	.xword	0x24b8bcecc70b722c
	.xword	0x9652d0e9b9bc94a8
	.xword	0x242edaeef5a0463a
	.xword	0x0eff11d4b066abe3
	.xword	0xb6bb6dd3a3393f85
	.xword	0x35e97db7ff4aadff
	.xword	0xd8ea8c373fee62a2
	.xword	0x1d50819868a06dd7
	.xword	0x1c683cc9a919b3b1
	.xword	0xd2bd773e69aaafbb
	.xword	0x7074409f6afbabb7
	.xword	0x023a9fc7dbc5c086
	.xword	0x494cb601c6019c8e
	.xword	0xa7a66c6a29f7a6fe
	.xword	0xa81639b23ec9fe04
	.xword	0x7f033f20e0339055
	.xword	0x1635bfc28b65c89a
	.xword	0x1c9aa5245685543d
	.xword	0x2699c7b6adcf61e7
	.xword	0x3d7eb2f36e4e3181
	.xword	0x7c8c8ce050f55b5f
	.xword	0x4c150539b7fbd052
	.xword	0xd7b9bad36bc21ee1
	.xword	0x7359b31e9dbf63ab
	.xword	0xc45ceaf3b87add9b
	.xword	0x149c35bce3a837f8
	.xword	0x8c745f9159c84a69
	.xword	0xa2d0275cf17131b2
	.xword	0x7812829ea9e97fd9
	.xword	0x8865613b3db715c1
	.xword	0xc4af1e48920280fd
	.xword	0xdcdda7f8802a5d4d
	.xword	0x47854084e420d211
	.xword	0xc6757229240562a8
	.xword	0x50dd5c953b804dac
	.xword	0xbca47f9e94463b67
	.xword	0x25490cb3eced6fd8
	.xword	0x056d65f75d5dec9c
	.xword	0x568146c60670a3d4
	.xword	0x91d34e762cc73899
	.xword	0xc38020a698a5e40e
	.xword	0x0913bdd5f77204b4
	.xword	0x78f76d3ad30fd048
	.xword	0xcd608b8023d5fc87
	.xword	0x4e7a724dbad0aec9
	.xword	0x2fbb0bf6749a04ec
	.xword	0x431c0ab1e48c7426
	.xword	0xbe7aacb16d39d89d
	.xword	0x379ac845b289a452
	.xword	0x12f369623a8d75d0
	.xword	0x5773196e0482feef
	.xword	0x12faa0cad6b37ef4
	.xword	0x15fc419f07fa0743
	.xword	0x04517d71c6b677f9
	.xword	0xa758e9f22a96f475
	.xword	0x0aaa3a9617fbbfc2
	.xword	0xd05526cc998eeade
	.xword	0x7e92c84f0f3f7e76
	.xword	0x2fbc5f006224e887
	.xword	0xc80c4161511912a8
	.xword	0x2e05e4504947d2d0
	.xword	0xb6ab6772094a26d5
	.xword	0xa0b59a5317120794
	.xword	0xfca46a1ec0ede4bc
	.xword	0x9699352cfac078d0
	.xword	0xff02922a8d150c91
	.xword	0x19eb770f4c5694ef
	.xword	0x930b9449776b217a
	.xword	0xafdfddcdde70c1b8
	.align 0x8000
	.data
data_start_3:

	.xword	0xae70ab373811defa
	.xword	0xb65e027dd38dbdcb
	.xword	0x4364a2500ae3d3a3
	.xword	0x85a9c02d6d9ab693
	.xword	0x44e465c1b666bab7
	.xword	0x3be84f9a337aca21
	.xword	0x90f9308ed0778cfb
	.xword	0x4965e30776967aa2
	.xword	0xaf46c6b509ed345c
	.xword	0x4de6912f89f0a977
	.xword	0xa6039784978d9419
	.xword	0x2941c39e48613e3e
	.xword	0x340a79104415ad8c
	.xword	0xf1ccf8c5f3b6fb46
	.xword	0x73ec8c2494047bed
	.xword	0xde4b8a000dbec982
	.xword	0x574aa44e6741afe7
	.xword	0x3cfbd6e1706183f6
	.xword	0xeb44a89f1a9acbf7
	.xword	0xb11c93468d32ecad
	.xword	0xf3d3396634b74e23
	.xword	0x2485a68d998ae678
	.xword	0x172ee07812a198ee
	.xword	0x443e2092ced84ff1
	.xword	0x58e5df2b34c09640
	.xword	0x54b04e567b541aeb
	.xword	0xaba9fd781bfcf5b6
	.xword	0x13e239fb04222cb8
	.xword	0x4ca6edefc6c96035
	.xword	0xfb10348ea4db2562
	.xword	0x9aa7e93df48e8213
	.xword	0x8ca0207a5045bd28
	.xword	0x33e60da8693f65cc
	.xword	0x76386fc7b9d59246
	.xword	0x478fdda58c1e5f2f
	.xword	0xc70e9b37c282452c
	.xword	0xfe02f76aa876b25b
	.xword	0xc9abc7b8a584db90
	.xword	0xd7a72fd44ed116b3
	.xword	0x371ab33f7f92aea3
	.xword	0xb8402a61adbadc4d
	.xword	0x0de3d0ccdcee52b0
	.xword	0xb1ecee50a8d8ebd7
	.xword	0x678a4d326da4054e
	.xword	0xb2178459fce6a24b
	.xword	0x8c51704eebb4e624
	.xword	0xef53a85da9799dd4
	.xword	0x725ce81d08dff69a
	.xword	0x7b84f7733adf6434
	.xword	0xb347d6fc6630aa95
	.xword	0xe9f8d94b90b09943
	.xword	0x4231f0fee2c90408
	.xword	0x58e38b0db02bb2da
	.xword	0x95f79bc49f232ece
	.xword	0x3647e11de4200927
	.xword	0x9478c83632f4aa01
	.xword	0xbf1c29f84b0f9cbe
	.xword	0x4996b19a436035b1
	.xword	0x72243c8010222fdc
	.xword	0xb76acdf5d5eb98b9
	.xword	0xe818e5226050d9dd
	.xword	0x7abe44fcd4161209
	.xword	0x756aaf2c79541677
	.xword	0x8318a063593676b5
	.xword	0x375bb094a6eb1e17
	.xword	0xa38c6d539cd31c41
	.xword	0xea72c1b4bf529e2b
	.xword	0x5592215ff0ae27fb
	.xword	0x43453c9a33d320ff
	.xword	0x68e0c68ff7e421c8
	.xword	0x13657ed74c9b3f92
	.xword	0x29dc9be2a2e0f350
	.xword	0x8502779c8801726b
	.xword	0x534b935419672f90
	.xword	0x08704db4b17addfb
	.xword	0xf6476828712d419b
	.xword	0x41b204e54924bc83
	.xword	0x1a7501f57095d66c
	.xword	0xbd4bd3640214f79b
	.xword	0x96a1cecf0c3374a5
	.xword	0x239ab6246ed7f7e2
	.xword	0x2657cc0ccf8a4d0b
	.xword	0x221c6d68807c3b9e
	.xword	0x8d99e92a34fd948f
	.xword	0x336e0766e575744f
	.xword	0x643163dbd093ffb6
	.xword	0x77d7f7ab188e869f
	.xword	0x868d75cdf2dc6c3e
	.xword	0x935f049790997676
	.xword	0x7257bfebfa06537a
	.xword	0xab53b011e7346ac7
	.xword	0x8a108d777520a8b5
	.xword	0x2ff4024be74d52b7
	.xword	0xec0d8c3223137913
	.xword	0x9d8589a14042cddd
	.xword	0x8fab4df2b14b29ff
	.xword	0xf3405eb15c5fb045
	.xword	0x543721b891311880
	.xword	0xe3f51e5f4c0513c5
	.xword	0xf36883505ab74a4b
	.xword	0x3b1b86951e11ef03
	.xword	0xbcec53a9ec2b8304
	.xword	0x43f3bd2ab99b3d55
	.xword	0xba3a37795c6c7db9
	.xword	0xcbb338715bc20ef2
	.xword	0xb06c5f1b3b26ca56
	.xword	0x0668fe5e6e6e0841
	.xword	0x5d524601527cec62
	.xword	0x2f5abe4d7331ca7b
	.xword	0xfbda421b52b25819
	.xword	0xdfc44a7916242136
	.xword	0x32693e6a860abd4d
	.xword	0x0dfcfc69c81d6334
	.xword	0x28d54ec263433d05
	.xword	0xcbfa8bff5779bcfe
	.xword	0x83a44295b1562c2d
	.xword	0x35a52d01a801d733
	.xword	0xf6911f010479d82d
	.xword	0xf6a52296472f0b74
	.xword	0x4040e6846cf0d06f
	.xword	0x14cac10324f2b819
	.xword	0xc78b5a895724e096
	.xword	0x84277f4c8d0c7ebd
	.xword	0x27021c8cb2f2ec86
	.xword	0xf6c51d9d18be544d
	.xword	0xdeef72fcf46d4819
	.xword	0x2d15b948c24089c4
	.xword	0xdf8402e3fc2e860e
	.xword	0x014b31a100461d6b
	.xword	0xea50c871029ab688
	.xword	0xc0bcfed7c859b511
	.xword	0x6a957c47212826a7
	.xword	0xec4c44ec811a16ac
	.xword	0x1b8b9c8b58deacfc
	.xword	0x4ff37906006816b6
	.xword	0xea090351d586d4b3
	.xword	0x8ca5827116b5a7f0
	.xword	0x4bd40d5558aaa687
	.xword	0xdf219d38b992fd03
	.xword	0x6abf0af722538640
	.xword	0x6c3e74e436258de3
	.xword	0xda62dccd187bfd25
	.xword	0x44ac02c7c4650a11
	.xword	0xc444f7c332ff54c9
	.xword	0x7b36b1cfacfe17ef
	.xword	0xce99f546a8542638
	.xword	0xd1ae7b8adbc015e7
	.xword	0x33ff6585ef3090df
	.xword	0xb3733bdecbb327a7
	.xword	0xee742218f5156cf8
	.xword	0xe350d6d2937ae100
	.xword	0x9d1ccef198604e19
	.xword	0x1d12272a40ee6352
	.xword	0xc3b3257981603842
	.xword	0x46aff734cbfbecb0
	.xword	0x4193c0461dff64b2
	.xword	0xeea2b2154177b617
	.xword	0x4af1c3b1f61317bd
	.xword	0x8af654f36d08e0a4
	.xword	0xd8d61f2ff619f0b2
	.xword	0xfc750795dbcdaef9
	.xword	0xad3524be1f63a2fa
	.xword	0x8a2afead5f336ed8
	.xword	0x032e9ee40599c9cc
	.xword	0x9bf87b9f8a558cae
	.xword	0xf240e2e6699a95a5
	.xword	0x9e5fce68756b1c65
	.xword	0xaf3588164ae4167a
	.xword	0x8ed199b42e2d47ba
	.xword	0xd0453e03280bb2e7
	.xword	0xd740ef78ef60cb26
	.xword	0x6efa44a7e4977af6
	.xword	0x0f5e063c7f37083f
	.xword	0x7dc4a5cf2b56cc0e
	.xword	0xfd32331a31b22da1
	.xword	0xece396bd7469c3fd
	.xword	0xbcc6af8a0feaefc7
	.xword	0x30679a3dd7f0c3e4
	.xword	0x14715148f881f119
	.xword	0x309e857e8fb53575
	.xword	0x9e75d06c0e6e488f
	.xword	0x5f5de3088177a223
	.xword	0x6b80990196e63164
	.xword	0x35b3285b6ca66d30
	.xword	0x1749dda2b4297bd8
	.xword	0x2b7821e6e873e9ac
	.xword	0x21d60ca3acf231ee
	.xword	0xea17177c943714aa
	.xword	0x2ef2c3abc50f1694
	.xword	0x0a9428ea883188a1
	.xword	0xee506686f7ac8c4a
	.xword	0x7684650a0c81388b
	.xword	0x1319cbbe835d60b3
	.xword	0x0ab952a46a0d71f4
	.xword	0xe092236b78499b1c
	.xword	0xee9052ec4600f50c
	.xword	0x49cc2f9507d64a83
	.xword	0xfb54971604f50eb6
	.xword	0xa7a3a8e096d61981
	.xword	0xd8f7ffbcfb2f7ea7
	.xword	0x3d216cc14abff312
	.xword	0xe45ffbb3aad12491
	.xword	0xf5301a6db066bdc9
	.xword	0x97940969c15b9666
	.xword	0x0b8d9821dbe4e613
	.xword	0x328c9b11211eaf71
	.xword	0x41cef5d016c49c4e
	.xword	0x538deb5f3b996d97
	.xword	0xc2a10e865d9af93a
	.xword	0x79ff62646ef1e044
	.xword	0x9dc907339a40ae4b
	.xword	0x54ed27f255e58142
	.xword	0x27a01ef050ef4a56
	.xword	0x749e242fd440c556
	.xword	0x1224e62b661455e4
	.xword	0xe2b7470fb617a894
	.xword	0xb9d3828034ddc76d
	.xword	0x174e2ce721f318e7
	.xword	0x4e8716a7fc1cce78
	.xword	0xb2ac152935fd62dd
	.xword	0x8994c97187287d57
	.xword	0x613fdd1ee1a076cf
	.xword	0x4fc644df0c92a1ca
	.xword	0x746c11eb9e0f9952
	.xword	0x037ab24b3e8a6e6a
	.xword	0x961ad0f19ca31fbc
	.xword	0xb00d446229dcfb84
	.xword	0x171613d5a6f4a4c8
	.xword	0xa987dd464636cac5
	.xword	0x025e2fe10315718c
	.xword	0xc21f88e66bf469a9
	.xword	0x030e84eb55d952d1
	.xword	0x816d40c299b1c57e
	.xword	0x29363505c933bcc2
	.xword	0x7204c396e89ad172
	.xword	0x07df1c7dde0b56b0
	.xword	0x03724b35832246e1
	.xword	0xdbc99c4670125e3c
	.xword	0x0993917645865141
	.xword	0xe9ac820dfdd3317e
	.xword	0x6271f4f8c7730fd8
	.xword	0x22c5a8d900e0b91b
	.xword	0x3d2d02ee76e11e8b
	.xword	0xeb9d324ed1628419
	.xword	0x8c76630634455eb7
	.xword	0x583765e4bbed9920
	.xword	0x974472a0a0462d99
	.xword	0x5378c27dab9c9949
	.xword	0x1da13d08133573bd
	.xword	0x39546ebe5d717436
	.xword	0xeddf9a3b4615ec94
	.xword	0x9813690d2f66aaa5
	.xword	0x2e8fd7cc8f6255f2
	.xword	0x38492b6527081811
	.xword	0x05b69356a3044f22
	.xword	0x00b468e5e4799ab5
	.align 0x10000
	.data
data_start_4:

	.xword	0x00f28c912cb3a586
	.xword	0x29c56da3dd7122eb
	.xword	0x59191be8758b9f29
	.xword	0x8a5c2b097aa2a680
	.xword	0x76af4a05265b519d
	.xword	0xe68ec428de090078
	.xword	0x1bf926e83bebf2a8
	.xword	0x5dac879addc89683
	.xword	0x6216eac0a26230ae
	.xword	0xfc0742da197d305e
	.xword	0xa7c782b4f219ee07
	.xword	0xfc14544712542fe2
	.xword	0x40bb868b7157ad24
	.xword	0xa52fc3cdb171571b
	.xword	0x0a6f8a67d5ba41a7
	.xword	0xbc1f3d4fec00fe48
	.xword	0xbd428b22de009f06
	.xword	0xc30d91c3de95667f
	.xword	0x8ebba96a253876a9
	.xword	0x28ed71d4b35fcc3f
	.xword	0x2f418d77922f1045
	.xword	0xeae45a324e6258e0
	.xword	0xb258eb0655a3b51f
	.xword	0xd029fe0aa85e6bd4
	.xword	0x91b97aa2b54fdf14
	.xword	0x5c593c896a20ef64
	.xword	0x3add862d1dbf6cf2
	.xword	0x2c7e17909f212e9e
	.xword	0x7683abfa782b6418
	.xword	0x91f13366c8f61f9b
	.xword	0x2c2f73ef261695f0
	.xword	0x9bb5a75d90b651ec
	.xword	0x2f9a7c0d3603e2a1
	.xword	0x02d3a432de3b5393
	.xword	0xd6a600590ef580f7
	.xword	0x19e9ebe6fb811fea
	.xword	0xa917cde3c641f110
	.xword	0x42d4f9737738e230
	.xword	0x67e1d27a4b73ced8
	.xword	0x1302a9e2bc66b88d
	.xword	0xb86bfae5f2e311cc
	.xword	0xe13eede6fe98551d
	.xword	0x3826906f4bbdd856
	.xword	0xab355c17a8772a37
	.xword	0xb6b78077aadca008
	.xword	0xe0fbe401f4589b01
	.xword	0x9c123c5be8f62762
	.xword	0x2fa672136118d3e8
	.xword	0x848f9e877a735954
	.xword	0x23f789ea7f87f9c7
	.xword	0xafce09ebdbf8ea64
	.xword	0xf2409d6d9d9cf7ec
	.xword	0x660a845243869f56
	.xword	0xf4c61dfb826c5db5
	.xword	0x4807f754ae11da91
	.xword	0x33b0618efff0a3dd
	.xword	0xb9409998a79fb62f
	.xword	0xf4a4bb6e3cc880df
	.xword	0x744e5367458a3ded
	.xword	0x14ff5635a1a38c9a
	.xword	0x9e0ac4959041d6a0
	.xword	0xf49d02dc495d0f09
	.xword	0xf7f35199cbb3e470
	.xword	0x66805f033d4fae59
	.xword	0x6601857f8b7e49a1
	.xword	0x72932c20f733ef71
	.xword	0x6aa32b9710380d1c
	.xword	0x09f556ccdf245607
	.xword	0x180b03eb33c48581
	.xword	0x09a6c3c8bd07f6f2
	.xword	0xf186b5d4617fbbbb
	.xword	0x73902081636d576b
	.xword	0xa9f01a60f2f47ab7
	.xword	0xe028c4f745c01683
	.xword	0x22cafc38f4e2d972
	.xword	0xc65a7a97235a1bc2
	.xword	0x84fbf02f78a11f4d
	.xword	0x34d7774e7d38cf1d
	.xword	0xdc910fb9ed7ef75f
	.xword	0x9ac0dd5f5553b34e
	.xword	0x031b6dbbec5f09df
	.xword	0x3240685a7ea00851
	.xword	0x4e6b54b62545d6bf
	.xword	0xc32747bcfcfd7ec2
	.xword	0x17463b151f572a88
	.xword	0x1e4ccaa054ab58f3
	.xword	0x75589927bbd36818
	.xword	0xef7256b047687a8e
	.xword	0xdb1d669c8bd3f0e9
	.xword	0x25a8a19f12b06615
	.xword	0x09f08f41997715b0
	.xword	0x16b9d20291d7439c
	.xword	0xf4a4c4561609a0e6
	.xword	0xe4a0eeec89a04189
	.xword	0xf0544d1ce4ca09a3
	.xword	0xc8209877a052f2bc
	.xword	0x36be0870b6410f1b
	.xword	0x7a40e062b96d31a1
	.xword	0x57f071f1fc199d61
	.xword	0x3c8930de07132cf9
	.xword	0xc3737e49b0b874c2
	.xword	0x0d572035f4d9fa37
	.xword	0x818c392e75804e5b
	.xword	0xf84edb126d8678fb
	.xword	0xc1d42770d52134ad
	.xword	0xc71c1447420b6147
	.xword	0x4193a1c4c8dadf96
	.xword	0x65ed3b2adb78d7cf
	.xword	0xd2f4cab2d9c493cc
	.xword	0x140d361b542fdb4d
	.xword	0x7bb77827752e5298
	.xword	0xbc16f2a6b5436a9b
	.xword	0x264e613ed74ca771
	.xword	0x0eea33f3956ef2e5
	.xword	0x8db0366c28862301
	.xword	0xc9a96de754e32159
	.xword	0x84198de6e0fb4c5f
	.xword	0x688558708baf91bb
	.xword	0xfc050c2310f87c2d
	.xword	0xa337dd031776e1c6
	.xword	0xcddd6157f20a77e2
	.xword	0x6203c8fabfc60caa
	.xword	0xc69e2139fcb41e90
	.xword	0x26c2ad5f7e685f23
	.xword	0xa8e08e681026f9b3
	.xword	0xd5dad6a73bedec7b
	.xword	0x9c7269e566fa335f
	.xword	0x8c96d3a5d1c687de
	.xword	0x13bf37ed8882abd3
	.xword	0x1500ba9dceeb4fc1
	.xword	0xc7b1ffc4527fc283
	.xword	0xe3b0ae31dd616787
	.xword	0xca192c7fedfb37b3
	.xword	0xa702f72c88d5a0e0
	.xword	0x22069fc086acf6ef
	.xword	0x4ed9b068f1903e4a
	.xword	0xc90460abe3e92424
	.xword	0x38b65edb4c611c97
	.xword	0x9fbe2da0a1059319
	.xword	0x5a94851c10d9b326
	.xword	0x4585ff0ce4b92918
	.xword	0x422fbdc2c2c6730e
	.xword	0x1a7d5f71469904f8
	.xword	0x1ace3c52e635d028
	.xword	0xfe73c8f4c1f6fab6
	.xword	0x831e66a0dcf7231f
	.xword	0x799801a2cedf1da1
	.xword	0xa69b47a415a54aae
	.xword	0x4ea1e8163405b1a2
	.xword	0x29e4b656d364abc3
	.xword	0x71c34042234d49b2
	.xword	0xa84da93422d6050b
	.xword	0xbb5d94f7ebada276
	.xword	0xd1e5233daa4b15a6
	.xword	0x40e1f52b28ad1c05
	.xword	0x7891be731e060f1e
	.xword	0x613b063a08529689
	.xword	0xa28f1a1e9ded968e
	.xword	0x44a48ba1b4a9ec46
	.xword	0xc39b4ee35c45b0f9
	.xword	0x8232aef137ebba3d
	.xword	0xbba14aca8ddb9e7a
	.xword	0xdf922e7dbe956bdc
	.xword	0xf03fc25a9a7d34bc
	.xword	0xe85aba7dc0a3e472
	.xword	0xa33f45791b377664
	.xword	0xdda448bf030b31ae
	.xword	0x1f814dc93697278c
	.xword	0x9a1946b23f521791
	.xword	0x11df8098b04c0b59
	.xword	0x400b6954c4c1fb75
	.xword	0x7ea9621d4f8b43ec
	.xword	0x5e58a669aacf09b1
	.xword	0x484b31f36182f403
	.xword	0xd64ffe5fa72aee6e
	.xword	0x80f126c7069b9c4d
	.xword	0xc0041c48b57f5b40
	.xword	0x0e8f9dd54671526f
	.xword	0x0955fde4de1b73e4
	.xword	0x6a742242739a7c60
	.xword	0xe12ab8999a1c7afd
	.xword	0x33f5240d9ce06cee
	.xword	0xc4e6dc2184aef02b
	.xword	0x0499a4017ca86a3e
	.xword	0x8314fc0bdeb86a9c
	.xword	0x31df08ffc5c966f1
	.xword	0xa56ef0cc8e8b1cae
	.xword	0x0ee4727369bf5fc4
	.xword	0xd94e01d2ab766eb1
	.xword	0xa7c6ac0e76f56255
	.xword	0x1274e29d40cf2474
	.xword	0x22241d9a4a664355
	.xword	0x80bf143f57e22fcf
	.xword	0x636f703bd5d0ef1c
	.xword	0x7342ba0f332421af
	.xword	0x1f3e3b9d64b224f3
	.xword	0x648cd288e6f0040c
	.xword	0x80bff570b56f33cc
	.xword	0x549e53ddfa1b968f
	.xword	0xb347008a35e04106
	.xword	0xe3c24563368eef0d
	.xword	0xdc42294f7db7da59
	.xword	0x38db61e62291f12f
	.xword	0xc3c2836f64477986
	.xword	0xe956ca423d1fc8d1
	.xword	0x6b112a7bcaf84904
	.xword	0x18a5372f52baf6c0
	.xword	0xf4f7df1dde08f881
	.xword	0x36b90b1a1d9bb26e
	.xword	0xbdef953cea3832c5
	.xword	0x09a3d679022d545c
	.xword	0xd9e2405b6e89f202
	.xword	0x1fc0617ddfab5b95
	.xword	0x6cd7bd6055489693
	.xword	0xf008de4365b59f5f
	.xword	0x48557ac81d3dda68
	.xword	0x8d31fda4aa2937ac
	.xword	0xa8807ca769ba2f3e
	.xword	0xc3c8e2d9b1ac6d81
	.xword	0x2df5a915d930ff2a
	.xword	0xd062a363938363f3
	.xword	0x751c7eb7eabf583d
	.xword	0x6a4f921a7a7f4bf7
	.xword	0x2cba2e9a125df74b
	.xword	0xf3dddfcbbafd72df
	.xword	0x8c7879e713317e42
	.xword	0x603795edefd4341b
	.xword	0x1d29b3ad1e044e2d
	.xword	0x9963cd8d11321699
	.xword	0x8b2cb6749666086d
	.xword	0x501afaf0f13cb7a5
	.xword	0x610258be8442bcff
	.xword	0x8c0298bbaf801c11
	.xword	0xd71219ff337b6de7
	.xword	0xce7ce6a0cd454efa
	.xword	0x33306d05970091f9
	.xword	0xec9c7c5942cc4a21
	.xword	0xc5c9bedb29ce3b78
	.xword	0x8083c1b3894cba12
	.xword	0x8a1d207e95b58c3f
	.xword	0xa4ae7eff1b6aec07
	.xword	0x6eafc3af356a6902
	.xword	0x5de760a7ee686d3a
	.xword	0x6b1cc34de3081afd
	.xword	0x1dc0748f3fb2f8af
	.xword	0xd0c02e52d9731f94
	.xword	0x43bb518707b99d6c
	.xword	0x68f95c392eb495f8
	.xword	0x5e9176df694fb43a
	.xword	0x4249dd3222fe2e72
	.xword	0xf55cf5c92be7a728
	.xword	0x8c76fb483774b4ad
	.xword	0x61a684a936e92ecb
	.xword	0xd640cc68a13751ec
	.xword	0x83af6bd90f391b29
	.xword	0x91e5f79120b35034
	.align 0x20000
	.data
data_start_5:

	.xword	0x8bd1911c4e247c9b
	.xword	0x744299b218c51314
	.xword	0x46045dcb3b6486ee
	.xword	0x4d35db026569f3b2
	.xword	0xecbea97069e1f3f6
	.xword	0x83dbb5a0f338acf6
	.xword	0x8ad19f6e0163aa20
	.xword	0xf05045cc3841e98d
	.xword	0xb3f67e89dd23f3e2
	.xword	0x556809b4dd6bc6e8
	.xword	0x7c92fcdc9c7bb5cd
	.xword	0x405210919698f393
	.xword	0x52fc3a2326ed99e3
	.xword	0x2f3d61dc23ef82de
	.xword	0x828f4422fdfd3712
	.xword	0xa39e7c3f0662c34f
	.xword	0xfcf7e17bc009fa83
	.xword	0x80aa7014456b33b7
	.xword	0xf258fcb0dc55ef57
	.xword	0x0e9c035ec9cec85c
	.xword	0x8e7b17590b77eee6
	.xword	0x2c4c8d9a14648773
	.xword	0x2fc09ce40e7dd1e7
	.xword	0x5ca2619e88a4910c
	.xword	0x39ff27fd2703dabb
	.xword	0x1e09c65415876e71
	.xword	0xfdef500f7494e109
	.xword	0xfb5eb3c666088d8e
	.xword	0x2b0d3c28803a6017
	.xword	0x8bdf031f1b684a2b
	.xword	0x24c22a91932c79f8
	.xword	0x2c8e72eb2cf4d37a
	.xword	0x5a3019ce658f3945
	.xword	0xde65d31659bdd96c
	.xword	0xf563cbbfbc740759
	.xword	0x14f07fc048bd8679
	.xword	0xcc76fbbd98b7dca1
	.xword	0x9043d0c46c8eec13
	.xword	0xdb10e9639a723dcd
	.xword	0x0d78b4037d7e1698
	.xword	0xc550f563a2592399
	.xword	0xf4c07f32e34e68bc
	.xword	0x306212c22f92d331
	.xword	0xe11fbbd94f8d61b2
	.xword	0xc116c472dd7f3ad5
	.xword	0x9c5dc3da6ef418ed
	.xword	0x28723ff88d7e7545
	.xword	0xb59f4cfc460e288d
	.xword	0xfb445c532af6bd90
	.xword	0x3d8c3212105e090a
	.xword	0x614a7c705eb624c3
	.xword	0x783ffe68b4b01f6b
	.xword	0xc3231b1595d572fd
	.xword	0x5b1d3b1f9dcacc34
	.xword	0x1bdcca933b36bce3
	.xword	0xfeba6eaaf52accf4
	.xword	0xa716986453538a2e
	.xword	0xd9674bc3351ea8d6
	.xword	0x5a9ffdaded591ce8
	.xword	0x18d43964b212430b
	.xword	0x6700fe569d705cbe
	.xword	0x84af90a737d85194
	.xword	0xa999bc5a4d3fbef4
	.xword	0x86791c06314b431c
	.xword	0xad39840f871d2535
	.xword	0x5928270678cdde05
	.xword	0x8a131be1408466fe
	.xword	0x4cbbfab06c212ded
	.xword	0x4cb2d6a50474e0dd
	.xword	0x14cfade99fc2fe42
	.xword	0x565834bfdcd297b1
	.xword	0xaf6628dd582d4d34
	.xword	0x4716f62038f69e14
	.xword	0x4e3c22c4f60a0a88
	.xword	0x36e0d7f70a4be4fe
	.xword	0x0126bbf0bba9d68d
	.xword	0xf8412ff8f856d25e
	.xword	0x9460d143eaa0f35c
	.xword	0x50a7cb9b3ca3b138
	.xword	0xd60f2f1ec83320c8
	.xword	0xe72fb997c9a4dabe
	.xword	0xe389af79edb7b87b
	.xword	0xabc075a42c614a2c
	.xword	0x407e0730243753ad
	.xword	0x0784444c70f02c3d
	.xword	0x296e7e5fe13b9028
	.xword	0x19f64a34b5c4eb9f
	.xword	0x0aaaed6c9fb5540a
	.xword	0x58b137538ec59f74
	.xword	0xfb65aa41467d964e
	.xword	0xfbdbd1c25a678796
	.xword	0xff65521a17fb7d87
	.xword	0xc348c774572cc5a6
	.xword	0xf119d0509d00723a
	.xword	0x252c128f0637835b
	.xword	0x3dec8ccb0133a54f
	.xword	0x288b45f3a7e33bf4
	.xword	0x3ab9e0cf414b2a19
	.xword	0x1c17a55d80be7ade
	.xword	0x0b7c162c830086a7
	.xword	0x7d27293c2f33ae72
	.xword	0xb5e7f833c7fb253e
	.xword	0xabc2b7684ed5d48a
	.xword	0x18e391dbcee3d738
	.xword	0xfa3e38ab4ca1fb4f
	.xword	0xbc473f6ee8ff7d1a
	.xword	0xd10e35b462f27cb8
	.xword	0x4b290e150e56d8ce
	.xword	0xa46e1af1a8bc20dd
	.xword	0xa32e9b2da85e1f64
	.xword	0x5aeea73346c9a1f1
	.xword	0x0c61703d9601d8d7
	.xword	0xdbe7a1c055e4d317
	.xword	0x3cefad768c4f53ec
	.xword	0x429af8dd114de679
	.xword	0x612aeee621259b84
	.xword	0xebd347626fb92d45
	.xword	0x96e795446781aa55
	.xword	0x1a20500f0cd6361c
	.xword	0x03535598cf85c913
	.xword	0x47492558148567a2
	.xword	0xa5589cefa075abec
	.xword	0x136bc46fe1389a6e
	.xword	0x05bfeec52f4d4184
	.xword	0xa80fc283852e0b13
	.xword	0x3f738dd80023d919
	.xword	0xde27983b11ed91e6
	.xword	0x9e0380e5f328f0ab
	.xword	0xb35bc5c1d646ffe9
	.xword	0xd78c04b2769f68d4
	.xword	0x3d88ece10c650a02
	.xword	0x5e6415999ca16871
	.xword	0x9ba48de7cbe107d8
	.xword	0x2073942dbc8270dc
	.xword	0xd557b0aa5dcd87eb
	.xword	0x4a72abb526fe1342
	.xword	0xbf9ed34123d8d2d2
	.xword	0x57c9082037d30922
	.xword	0x20aebee11b8d9e2e
	.xword	0x17c7a83075811187
	.xword	0x1e39d1664fa6420e
	.xword	0xc9dc3d4d02ca0a84
	.xword	0x1e5e55e703fd1b6b
	.xword	0x3e52a6c88d49ecac
	.xword	0x711f8f4800726712
	.xword	0x11e80f117c7354e4
	.xword	0xf41e6b136a92deed
	.xword	0x63f1e8fc7ceda75d
	.xword	0x321d268dae4171e1
	.xword	0x80b41e8343c7e511
	.xword	0x9618cedd9be6480f
	.xword	0x1372c6cab1f5af12
	.xword	0x359b321c5eba5519
	.xword	0xc9d7eab866868e92
	.xword	0x674829cbcd86a848
	.xword	0x9b36af6a49c88c35
	.xword	0x07d62a339f7d6aa4
	.xword	0x7ff40710457ff6d4
	.xword	0x6c91a04b923b87ad
	.xword	0x56ecf0d6546d52e8
	.xword	0x8e0bbd64026caedd
	.xword	0x0431c6dc0e51d8be
	.xword	0x8e38e1bedb18eac3
	.xword	0x03d3598489040ee0
	.xword	0x46021bd24e2e6334
	.xword	0x92f0b02e3fc62638
	.xword	0xe1dfddd57b93096b
	.xword	0x9199a72e60c8427c
	.xword	0x4cfd16f76195879b
	.xword	0xbce1b59c12be09d5
	.xword	0xa4fc4212fbea5a85
	.xword	0x343b875342294437
	.xword	0x569e6d6236f80b15
	.xword	0x2acd8efda46f1cca
	.xword	0xc254448e221fcc1a
	.xword	0xa46de19720d3844f
	.xword	0x2fbd994d73cf5770
	.xword	0xb25051343cb64b2c
	.xword	0x6628fee6a41fb921
	.xword	0xa8b1e39abb7f5989
	.xword	0x81b924e9fd39f130
	.xword	0xfc44d2ce6b40d2c1
	.xword	0xfa112d2ecbd6d0b5
	.xword	0x3ba890e5debaeee6
	.xword	0x30ec63164fd3a0d6
	.xword	0xd5cd10433f1f5e43
	.xword	0xc55f927b250e3460
	.xword	0x4a0b6027de002fc8
	.xword	0x8ada2cfba80ffedc
	.xword	0xe7e2a948c5e3f693
	.xword	0x5d41bf271783d566
	.xword	0x161e05f69d907552
	.xword	0xc46b0ef0fea480d9
	.xword	0x46d416f715c96b67
	.xword	0x3c3e833e764b350d
	.xword	0xaf29dd52d921bd6c
	.xword	0x5b0b76cdd3e4c001
	.xword	0x2c92ec2e4692f893
	.xword	0xb7347f668bd9ebff
	.xword	0xae7670a5c4873082
	.xword	0x80b10d95739ee541
	.xword	0x41b4de3a0dd54cd4
	.xword	0x8ce47e03d870bce9
	.xword	0xa303643206d4c6e5
	.xword	0x2999fc96e3f7a91e
	.xword	0x68cc93f6dfa4741b
	.xword	0xabf40568384829e7
	.xword	0x2c5160bbc60d86fd
	.xword	0x768d5921f59db168
	.xword	0xfd067f8994fda969
	.xword	0xce1037a25c1d391a
	.xword	0x300c7110ab6e404d
	.xword	0xababecf2b6c72ce6
	.xword	0x68b0086749e3e052
	.xword	0x3a8cdf66fd54b9ca
	.xword	0xa81fe65f8bc3f801
	.xword	0xec66f95f46a3a726
	.xword	0xd1c98bed2c8f6b27
	.xword	0x9ca584a7e8327c3f
	.xword	0xf82bc3bc0c93b75e
	.xword	0xeea543212324f577
	.xword	0x8c4aab31e699f8cd
	.xword	0x0a85c6d0fe56ca83
	.xword	0x3f6579d3e9db0391
	.xword	0x3231987d487fdd8e
	.xword	0x4e1118b51df52ef0
	.xword	0xcc80a0feaba74482
	.xword	0x7f95c65a6056bc0c
	.xword	0xf967a243091f6f02
	.xword	0xa9b72741bb8f1c2d
	.xword	0x01a3afff3cc4c492
	.xword	0xa0d2c938d1aac93d
	.xword	0x86b1c3e395dc611a
	.xword	0x97c11273f998cc9a
	.xword	0x8fc2527ed6d05d9f
	.xword	0xee4b34d27e71b80d
	.xword	0x184948430f458cc6
	.xword	0x1c6bdff42559c05d
	.xword	0x1d3635e7cc1a576b
	.xword	0xcde30c3fbfd8e2a9
	.xword	0x337d0ca913f8f806
	.xword	0xee57119177f317f8
	.xword	0x0801663313153b0d
	.xword	0x0ebffa1b4448ceb7
	.xword	0xb0a3dbe8ef5066fc
	.xword	0xac7595f1fc46446a
	.xword	0x0a9000527fec37f6
	.xword	0x7096001b2176f41d
	.xword	0xb42e249149515a7c
	.xword	0xa81153629a3ba653
	.xword	0xd9c9fb89ea1bcffe
	.xword	0xd70ccb81090908d1
	.xword	0x595f3227c4a570c7
	.xword	0xd220ca6d4c069bfc
	.xword	0xe02ca389e8cd28e1
	.xword	0xe461156064ff00c1
	.align 0x40000
	.data
data_start_6:

	.xword	0x908f61eeb49642c2
	.xword	0xc4f4b03a0d5194f5
	.xword	0x437459c56f6374d6
	.xword	0xf8d90d8c7377b2bb
	.xword	0xfbd40115237915a9
	.xword	0x1b77a1073c511d27
	.xword	0x55c9525763eba9ef
	.xword	0xaee3c822fadfc1a4
	.xword	0x40e65d78df157c94
	.xword	0x2b19fba8bb89bf06
	.xword	0x8e641031273f59c6
	.xword	0x2239c3d0bd64c68e
	.xword	0xfa87566aa144618a
	.xword	0x8765f4d67dec48ea
	.xword	0xe0423b0711ba9b05
	.xword	0xb9d7223c103630ca
	.xword	0x9a662c6fca5cffcf
	.xword	0x67b0f55f4c10b656
	.xword	0x2a725afd39eec468
	.xword	0x14439e442d75adc1
	.xword	0xb3fe01fe5cc06626
	.xword	0xd8f674627d11a13d
	.xword	0x79c87e847d82d2fc
	.xword	0x386339fed38a3128
	.xword	0x3c0f52c7ea0a36a5
	.xword	0x8018221b7c2634e0
	.xword	0x9a7cf652dc36febd
	.xword	0xa80b854783019184
	.xword	0x66a84f92336de35c
	.xword	0x0d9b7ea512468654
	.xword	0x1cc531e65c3069d4
	.xword	0x5df2c19ed77f01f6
	.xword	0xac60c23c6b742563
	.xword	0x1a69c4b229258b17
	.xword	0x7c45420c075a801d
	.xword	0x4580c8c530bec4c5
	.xword	0xfafd9645f1f7244d
	.xword	0x22480e3f33141e2d
	.xword	0x18dc6641e6e1f93c
	.xword	0xc790852f3df05726
	.xword	0x1ec2d65998dafb9f
	.xword	0x30feafae39ac9f2b
	.xword	0xe39e7bf5bc6c9557
	.xword	0x5c94dd9508e355f2
	.xword	0x79da6b20ed2765d7
	.xword	0xa3970fad0440887f
	.xword	0xf10d22cb281aac74
	.xword	0xe8e1747a47939186
	.xword	0x0973c6decb0dc0fd
	.xword	0x054b4207ab11ad76
	.xword	0x476efe071632a311
	.xword	0x15f2fb35de7a4a40
	.xword	0x26277ee0ef54977a
	.xword	0x67ebe6d0a3350fd3
	.xword	0xacda72c7dd864db4
	.xword	0x11ea169c1449491e
	.xword	0xdf81fa3fb914022c
	.xword	0xb52aab0a7319031d
	.xword	0xcf5a4f81d2ce178b
	.xword	0x722b1b7f545dce10
	.xword	0xedc6a4268861dd61
	.xword	0x27ca353cc6affddd
	.xword	0xb3a918ff0993e9c2
	.xword	0x025cf1e2968d80d4
	.xword	0xba74af008a71e548
	.xword	0x936e66bd523c821c
	.xword	0x9e923e9b6995c456
	.xword	0xad52e0ffdae746d8
	.xword	0x7951559468c1ef00
	.xword	0x32da294b575baa61
	.xword	0x79aebc6f15f8c70e
	.xword	0xe9659e15fe2fc8f6
	.xword	0xd61b366dc1b1d889
	.xword	0xdb4542390d181d39
	.xword	0xd1e249eb530691e7
	.xword	0xcab01a5030491e52
	.xword	0x36b2b57a3ce615e2
	.xword	0x44bce0e898342cdc
	.xword	0x3da7610a75ddb97e
	.xword	0x6431846bbc88ae80
	.xword	0xf1017848be7be403
	.xword	0xebdf3126c263ef52
	.xword	0xdb9298e8dab64bb9
	.xword	0x5f1fec4f8431b922
	.xword	0x1a3cb017be6163e3
	.xword	0x550a2841d2748df7
	.xword	0x38c8844d5addf244
	.xword	0x954f0fa70fefee54
	.xword	0x09eab4e1788714bb
	.xword	0x0644a2202e85ca6d
	.xword	0xaddeaa98a1f3a9b6
	.xword	0xbbde3ca8ce0e4b72
	.xword	0x26a2befc67f3cc5d
	.xword	0x3a32a17ce09ab018
	.xword	0x426ee9a6072e6175
	.xword	0x9bb60342583f2bf8
	.xword	0x93eae5a1c42c1f02
	.xword	0x2e49e43772d3edcf
	.xword	0xf8bd14bf6c565996
	.xword	0x40018feb1f5558d5
	.xword	0x54f89d6fa481a185
	.xword	0x4e730a1ebe9fb885
	.xword	0xb2a592ce6fc528f4
	.xword	0x739990700e3f425d
	.xword	0x6c588a13136d1607
	.xword	0xbdc10c1af359d152
	.xword	0x4cd449c884bac5e2
	.xword	0x139df93c1cda75c1
	.xword	0x86f487bab5f46ede
	.xword	0x8356d73e8bf51fc4
	.xword	0xad5253224308ff55
	.xword	0x77fd0406a6e39662
	.xword	0x1733104ea915272f
	.xword	0x7dfb917f0febe356
	.xword	0xf8c933c038a60acc
	.xword	0xd75daa991fd07e12
	.xword	0x6326476bc17a8268
	.xword	0x893c48478f90288d
	.xword	0x543f8f08c8131549
	.xword	0x9758c44e9fbbae5c
	.xword	0xd24d8fadf439b6bc
	.xword	0x6cff0d814c53870d
	.xword	0x053a38161cd67a52
	.xword	0x201034c23ed04022
	.xword	0xf746b9b6eb082b4c
	.xword	0x67ea18b61592ed88
	.xword	0x757e399dc9226c76
	.xword	0xba4197235c531fa1
	.xword	0x377da8c132152038
	.xword	0x93c2534a8b94b262
	.xword	0x5ba7da7c60855c0c
	.xword	0xe6a25a1e99460eb3
	.xword	0x6560bae5ed232534
	.xword	0xe002044fd4dd32c6
	.xword	0x2f935dedb9367bd7
	.xword	0xb2c10d286a2f023a
	.xword	0xefa5b843e58b0037
	.xword	0xf0832586183f252a
	.xword	0x26c18ec76cfff87d
	.xword	0x728d5a7978426012
	.xword	0xc598f426cc769d8b
	.xword	0x5c99f4d37ebf0b88
	.xword	0x00cbca316f13e2d2
	.xword	0xe6a58eae279af0d0
	.xword	0xa6ed784654c0ba09
	.xword	0x564538b9d1095377
	.xword	0xde260fcff399b728
	.xword	0xdc6ef0d263e9178f
	.xword	0xed365936411ae539
	.xword	0x5b0b4cecba664631
	.xword	0xe73b5de2cd10af19
	.xword	0xb5b43de003bd686b
	.xword	0xffea0ba97347e116
	.xword	0x8d14d9b06f1e3889
	.xword	0x18deaef24e02ab17
	.xword	0x4344d8ddefa459b5
	.xword	0x80e9616ffb5c37b7
	.xword	0xf919c832104a26f9
	.xword	0x4e17dda96830ae8c
	.xword	0x0ced334f30d4423d
	.xword	0x8991b9df7c8e3847
	.xword	0x90aeb8bbfd941586
	.xword	0xf8da9831ccea962f
	.xword	0x4a094062293bf381
	.xword	0x53a9ead40b20738b
	.xword	0xc823bb4a458e832b
	.xword	0xb8d9c7c0d7399dd5
	.xword	0x6ec720bce3665174
	.xword	0xb3655d6b469ca41f
	.xword	0xe69c2c4966d27b06
	.xword	0xec279fb1ec959948
	.xword	0x6bdf7a0de3ebe02e
	.xword	0x7134e997633a4817
	.xword	0x6e0065e9e4c695a8
	.xword	0x236fc6dcae4a175b
	.xword	0x5457a902de316c21
	.xword	0x7cebd54fa3b2abe4
	.xword	0xf50a578898c6eb3f
	.xword	0x5335690de329ce87
	.xword	0x3a9b55d5c94058cc
	.xword	0xd55e8cf9debf46c5
	.xword	0x3ee483359fcc20d6
	.xword	0x9a7b8ebc48cbfd81
	.xword	0xa327e5c1db58e9c3
	.xword	0xcfeac5dd1eea9a9b
	.xword	0xfce3fa12dca73326
	.xword	0xe6ec3f76c832d9f6
	.xword	0x2bc476ecff11911a
	.xword	0x0c65b19bdc05cd72
	.xword	0xb106f26f1b68f7c7
	.xword	0x7e6994611566be0b
	.xword	0x7834c5a69c134643
	.xword	0x12113bd9be616bff
	.xword	0x351f659b527f50ef
	.xword	0xcd70d55f590e2bdd
	.xword	0x83cd4ea29177aa5d
	.xword	0xba017ad3d3e555f4
	.xword	0x461afef154430138
	.xword	0xd150ff4ff06c6a2e
	.xword	0x9c2252e50ce8fa9a
	.xword	0x978143fe7ebf517a
	.xword	0x2b4f60915e88cda1
	.xword	0x233af825279337b0
	.xword	0x4de6de2bf8bee35a
	.xword	0xe439f175b8c75e18
	.xword	0x97089c91b54dbc84
	.xword	0x55557e76ab228c41
	.xword	0x107f064cfab0fe2f
	.xword	0x8f63e6ddac61b52f
	.xword	0x2f329c89ef012400
	.xword	0xfed2b797cee77579
	.xword	0x0b0b28dc4bea8ca9
	.xword	0x708e43740a5f770b
	.xword	0x1cd0b39c46b344b8
	.xword	0xc152be50fb598d27
	.xword	0x98e7894e0899362c
	.xword	0x2cc52f087d2d0810
	.xword	0x7d8d1c199d376e36
	.xword	0x13d73d30e616ffb0
	.xword	0xe96509055ee4cbb0
	.xword	0x77fe7a8eefd8f674
	.xword	0xf611359efd48a481
	.xword	0x742294c30bb15fb8
	.xword	0x98661e3ec1836208
	.xword	0x61091592c60196dc
	.xword	0xd42d1cc1e14a2eff
	.xword	0xc501a0d92af3a847
	.xword	0x4c190205b12bf836
	.xword	0xb059ebd8bae6af27
	.xword	0x3c310ea28bc67d20
	.xword	0xc8b932b5ae257166
	.xword	0xc60448e37cbdda4f
	.xword	0x729f55fc86c90a35
	.xword	0x2d390851114b13e0
	.xword	0x1b6bd9316eb14d49
	.xword	0x46398405b920c20b
	.xword	0xc8bdb2b040ea9682
	.xword	0xf848587847aa97bc
	.xword	0xe61ebaf9e5389f9e
	.xword	0x9b1c4b4de43e1a0b
	.xword	0xb4f08f180f5c5b6d
	.xword	0xbbf38bdeb118d17f
	.xword	0x733350c4a155f656
	.xword	0x8575ff71ed122c8f
	.xword	0x6fa4c1ab02e31a3b
	.xword	0x7c8c0bb07a3720f2
	.xword	0x8f2df6232130b626
	.xword	0xa97ae447daa8ad21
	.xword	0x0ec716978cedd7bb
	.xword	0xa8d52b32b6b3b41e
	.xword	0xba8b81da29be3f63
	.xword	0xf845a150e9b27977
	.xword	0xd955509d2ec7561e
	.xword	0x044a5278fa9b224b
	.xword	0xe5709a290ea993c4
	.xword	0x2b8d5bd4b9b8c076
	.align 0x80000
	.data
data_start_7:

	.xword	0x174e7fc618eed0b7
	.xword	0x6c3cdf1ee92d2867
	.xword	0x568cf5d82e0e633f
	.xword	0xbfac196e7a85c6ec
	.xword	0xebfc6d3769f3e062
	.xword	0x7a0619b229f819aa
	.xword	0x647516754e0781fc
	.xword	0x90529f1bd2429731
	.xword	0xe45a4a1f61cbf050
	.xword	0xe4c7d1aecb7eb88b
	.xword	0xce9707ff00c469ef
	.xword	0x6afa5d160fdacf92
	.xword	0x9021ff3cb2ea3ee3
	.xword	0x479b4dea6b209c41
	.xword	0xa54947b5c144dd99
	.xword	0xda6d4152c9f54d67
	.xword	0x50c3786b7e2119df
	.xword	0xa3012d530a5fa7bf
	.xword	0xbd618b49a84e26ef
	.xword	0xb0cded6c41a7f7b3
	.xword	0x27c05b74fe51ade5
	.xword	0xeaaae124b7fe7e7f
	.xword	0xe3961364897a70b0
	.xword	0x20f8aa1cdad66823
	.xword	0x56e5333e06035689
	.xword	0x9bd80296c5c2dd99
	.xword	0xe344c7aba1b7d639
	.xword	0xde07212c01cdd271
	.xword	0x162a65692e234754
	.xword	0x3e572cff8a53c201
	.xword	0xf7139e69a7145f89
	.xword	0x42fc17b57a92f9f1
	.xword	0xbcaec69a50c7e2b8
	.xword	0x11e2ee1920bbe927
	.xword	0xe242de6229222067
	.xword	0xb7d994c613623e6e
	.xword	0xe924145b1aeae830
	.xword	0xe47ffe0746042cbf
	.xword	0xd5344c9828d963cd
	.xword	0x42900dcf9b0624dc
	.xword	0x6c502db6d010e075
	.xword	0x5bd1ebbe17322b30
	.xword	0xcbcb743fc50a6568
	.xword	0x09a44a39e290b56b
	.xword	0x79a4d9333f85ce84
	.xword	0x0d7d88034ae8758b
	.xword	0xcdb1f0e085509182
	.xword	0xc0eb5be86ff92894
	.xword	0x1e7fe116cec1ba23
	.xword	0x734141bf2a3a0d2a
	.xword	0xd1dd1a30cdca80e3
	.xword	0xbda86fd4540367f9
	.xword	0x7f15ec2d24a4f768
	.xword	0xb28346910a26ec5e
	.xword	0x16fdaeabfc96f12e
	.xword	0x97e01069ed7ebd13
	.xword	0x4d357e032c1a4c6e
	.xword	0x2e024a651e7decb3
	.xword	0xae4cbdc4a6de2b19
	.xword	0x03aeae8f9ca0a1c7
	.xword	0x6202846c1c0c3a8b
	.xword	0x9920df50693109d9
	.xword	0xee1f13bb64e04114
	.xword	0xfb6ba8ca2e82b8a1
	.xword	0x280a212c1df803b4
	.xword	0x1852987c5c9f81e6
	.xword	0x97a998cf898af80c
	.xword	0xe0ec62a8a9aef312
	.xword	0xbe0fb617df6a5c4c
	.xword	0xa5839825f2d8f431
	.xword	0xf96c307a1314796c
	.xword	0x49d06a9788bc01e5
	.xword	0xa12c3e3008a3c326
	.xword	0x4ac5125770412cb9
	.xword	0xf679cd6a2cb789e9
	.xword	0x8c5d4454a15697d7
	.xword	0x5b17b5a1b1b32e1e
	.xword	0x47274ceea309856c
	.xword	0x524bb766e51b4b12
	.xword	0x94b43be27443dbb5
	.xword	0x78ff8c6db0ba56eb
	.xword	0x59cfa4c708527d03
	.xword	0x511604b6a8bc2f09
	.xword	0x812a7246d34b263a
	.xword	0x309d4851ed93a6c3
	.xword	0xbd8351b2cb57f522
	.xword	0xdc75ca29bb56ecb7
	.xword	0xbca93a1a9985daa7
	.xword	0xda1359891c1980c4
	.xword	0xcd63e7e4cc1b7308
	.xword	0x003c3b29d87f99a4
	.xword	0x9e3c195067a1a58d
	.xword	0x3e77f378b7db42a0
	.xword	0x0e85c6f20a10a254
	.xword	0x1031d80b050f826f
	.xword	0x820e6cdb8bde557a
	.xword	0xc4f5f8e4300ea67b
	.xword	0x3110dbeddd242e67
	.xword	0x8dffc29412355a6c
	.xword	0x8a397e418b6a1844
	.xword	0xa3a257dbb99cf46a
	.xword	0xc0f603bb29d63210
	.xword	0x8294a6c2667c19ed
	.xword	0xcd2c51ee6ad7f0d3
	.xword	0x21a948c0894f9102
	.xword	0x7d97b280c14ff89e
	.xword	0xe17ede60f7968c67
	.xword	0xf15ea3e3402fbca4
	.xword	0x3f345ea8bcfd999c
	.xword	0x7c643521c459dbf9
	.xword	0x629eccd7764b1a63
	.xword	0x697634eeb1b2958e
	.xword	0x2fa67f7dff0c8515
	.xword	0x371f4990daba430f
	.xword	0x826e0a3f382f199e
	.xword	0xf1ba9de9d56c7767
	.xword	0x72323d2769476b75
	.xword	0xead1ad5e3ba9ba17
	.xword	0x98c4735e85f42bb8
	.xword	0x3cd1c3fc83da664a
	.xword	0x8d784c1ddf36488d
	.xword	0xe3393eeafd693861
	.xword	0x987ddd63d9f2c7bc
	.xword	0x91965b1641039fda
	.xword	0xd047edefa941c2e1
	.xword	0x970ff632c5a32664
	.xword	0x3d17d487f4124b20
	.xword	0xa5827eb85abb2ddf
	.xword	0x9e1a01307ca71e11
	.xword	0x2805f2a00078ef3b
	.xword	0x677ef6d78b48e123
	.xword	0xed4f123add505f3a
	.xword	0x6d378ad3e4de793c
	.xword	0x25692f7bc9cf447f
	.xword	0xa05792c499c47624
	.xword	0x6fc1e948e864f60d
	.xword	0x92296b0cc4d60bbe
	.xword	0xdd7be8d85a515531
	.xword	0x70edfd17b937ad06
	.xword	0x4fdcbdc078314bcf
	.xword	0xf1fd7f6bd8e07282
	.xword	0x6e7159aa22d7419e
	.xword	0xf1f36dacd8ad10fc
	.xword	0xe26170a12797ffdc
	.xword	0xd3f8dc79639197e5
	.xword	0x2462a6957e219289
	.xword	0x69c6c3abad5a5537
	.xword	0xc3e5168e79f7d427
	.xword	0xb01bfbc1354bfe2f
	.xword	0xa087097c8b96553a
	.xword	0x6943d54c23b6ef89
	.xword	0x2a668a77b5b6503e
	.xword	0xf0481cc2e3dee20d
	.xword	0xe71c590a33477bd4
	.xword	0x205a350e55dd17f3
	.xword	0x500051ad75af3463
	.xword	0x4548875c8df3f963
	.xword	0x24576b2ad8db5bf1
	.xword	0x98a2c9ef8ba42af4
	.xword	0xef317c4ac2a2f4e0
	.xword	0xf98704469b681489
	.xword	0x1b0e5c9ffbc6ca60
	.xword	0xa68b808e59114f20
	.xword	0xfecd27f1906ed520
	.xword	0x485acfd97b35676b
	.xword	0x5d21dc48c0e61e34
	.xword	0x59d2c9aa71f2d6b3
	.xword	0x9084fc4232f6e01e
	.xword	0x5b44c4953cdb0253
	.xword	0x20193efb9936a428
	.xword	0x0004b5200adf9a6b
	.xword	0x2a13b60ac96ea1a6
	.xword	0xd94c109924763f23
	.xword	0xaae5ad7019d5fb7e
	.xword	0x74a6ce5410a31390
	.xword	0x8d66623bbfa8f887
	.xword	0xf7c7d1876e966605
	.xword	0x8727fdcab977a0c5
	.xword	0xfc4a74f53d904bb0
	.xword	0x3ff5d64e7ec9e055
	.xword	0x4cfedd5e4a8c5295
	.xword	0x24e9dcf67919c669
	.xword	0x33df497f521a31bc
	.xword	0x7b08ae9ce33c36b8
	.xword	0xe540f9a94a40041f
	.xword	0x1c295994bcd2fe4e
	.xword	0x15e5ebd38a67edab
	.xword	0xafb85c030b77aaf3
	.xword	0x372676090c391977
	.xword	0x301abf2bd8c68526
	.xword	0x930c771b085ae2ef
	.xword	0x5e64fafa441fb6b8
	.xword	0x7e3af9d7232c0ccd
	.xword	0x4696cc4d16f7c358
	.xword	0x16464403e9774e01
	.xword	0x498af48615bb6ab6
	.xword	0x8434a19ea6cec664
	.xword	0x77bd3cd9ea17cec1
	.xword	0x2ee829d3a489e2ca
	.xword	0xc713d53b08c0e62a
	.xword	0xf2ffb32ee63a9544
	.xword	0x3b1a76a95c46a025
	.xword	0xd2eefc0f5c502aa1
	.xword	0x2c4e35018a2a0766
	.xword	0xe919cb3069381ad3
	.xword	0x27debd1315425d8e
	.xword	0xcd9e520f37857f48
	.xword	0x0504f71b5fa1b3e5
	.xword	0xb8c1cc51b5e7402b
	.xword	0x3dbea6225ee1c755
	.xword	0xa91c971c3d5ff262
	.xword	0xdaf8433753eeb070
	.xword	0xca95fcaa06758d71
	.xword	0xe7aac3a618b00523
	.xword	0xc49d975d2f5bd2fe
	.xword	0x0808477fde7607e1
	.xword	0x73529b2d42f7ff25
	.xword	0x5b251e3ea72a0d0b
	.xword	0x3e1b19e1b02ceba8
	.xword	0x487780450d96e717
	.xword	0xa8c192dabedddaa1
	.xword	0x9c9bde4ef1e02cd3
	.xword	0xd524339ecffde285
	.xword	0xaf1b75820a30bf47
	.xword	0x4a2c2e09e8f86f10
	.xword	0xd597d84718bfc32a
	.xword	0x7df13eaf13b84042
	.xword	0x6d376b2205c53722
	.xword	0x4eff0243947cbf20
	.xword	0xb59b6d2f9ee90d3d
	.xword	0xe1497ffc11c41692
	.xword	0x2de5bcbeb04ce6e6
	.xword	0x5ef626bb632858ad
	.xword	0x7bd203d6bb0f9337
	.xword	0xa41824a267ba35a2
	.xword	0xa44d3322ec5c6a9e
	.xword	0x05d5abd22cdc6ae2
	.xword	0x2041801ab48198ed
	.xword	0x9df120f8342a83ee
	.xword	0xaf4265983d412c85
	.xword	0x39a7b9784f8ba3d6
	.xword	0x4e9f670fd11369be
	.xword	0x2b021e2f73d3aaf0
	.xword	0xe87227a15080de4f
	.xword	0x629fb14290eb7a22
	.xword	0x0186755f810d5bf9
	.xword	0x204c18700a85db4e
	.xword	0x6c14293004b9b41f
	.xword	0x51ffbcfd84554563
	.xword	0xc1e979550f109a27
	.xword	0x8d280b74492fdfa2
	.xword	0x0f82fc17201af711
	.xword	0xfd59f65f1d872d21
	.xword	0x1502dacb74f00e9b
	.xword	0xc72fbd87a899308a
	.xword	0x123fd440e135e00a



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
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "10'brr 00rr rrrr");
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
!!# 	  IJ_generate ("diag.j", 163, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 167, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 171, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 175, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 179, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 183, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 187, th_all, $1);
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
!!# 	  IJ_printf ("diag.j", 202, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 208, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 212, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
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
!!# 	  IJ_printf ("diag.j", 225, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 229, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
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
!!#           IJ_printf ("diag.j", 283, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 287, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 292, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 293, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 294, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 295, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 296, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 297, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 311, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 312, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 313, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 314, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 315, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINTR %rvar  Rv_low_wt
!!#         {
!!#           IJ_printf ("diag.j", 321, th_all, "\tmov\t0x%rx, %%o0\n", Rv_intr_vect);
!!#           IJ_printf ("diag.j", 322, th_all, "\tta\tT_SEND_THRD_INTR\n");
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
