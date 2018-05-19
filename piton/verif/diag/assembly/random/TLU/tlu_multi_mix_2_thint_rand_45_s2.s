// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_45_s2.s
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
   random seed:	807448259
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

	setx 0x0556a9f8d9711e7c, %g1, %g0
	setx 0x560a23fcf16b9f39, %g1, %g1
	setx 0xd899287635caaba0, %g1, %g2
	setx 0xc46b11b44082ecbd, %g1, %g3
	setx 0x22896535ce6c3217, %g1, %g4
	setx 0x44d629c898a3d902, %g1, %g5
	setx 0xa1c4027aecea192a, %g1, %g6
	setx 0xd28efddc2accfa8e, %g1, %g7
	setx 0x0a0c774cce381c45, %g1, %r16
	setx 0x5ba35ccea9a76997, %g1, %r17
	setx 0x0c4c88490a618afc, %g1, %r18
	setx 0xfd96bd59c6d482c9, %g1, %r19
	setx 0x8ce441efb78c2ea5, %g1, %r20
	setx 0x02a37cf28db03f80, %g1, %r21
	setx 0x75734059fef55229, %g1, %r22
	setx 0xe6d935fc13f26188, %g1, %r23
	setx 0xf35042283bdbfebb, %g1, %r24
	setx 0x7b14a3d52c8f6156, %g1, %r25
	setx 0x5298fe23de6d0304, %g1, %r26
	setx 0x2280e0ed3b3a972e, %g1, %r27
	setx 0xeae3078b45ac8ca9, %g1, %r28
	setx 0x8181caff439b7a6e, %g1, %r29
	setx 0x896010952f5d0c73, %g1, %r30
	setx 0x47b51a9b2f261114, %g1, %r31
	save
	setx 0x25cab5c22eaaca4e, %g1, %r16
	setx 0x5e3ea630c8f3e8fd, %g1, %r17
	setx 0x5e2cdce82301be04, %g1, %r18
	setx 0xb3a10617785aa0ab, %g1, %r19
	setx 0xa13b231d470b26d2, %g1, %r20
	setx 0x29ab966dbf259140, %g1, %r21
	setx 0x4c44982b047486a4, %g1, %r22
	setx 0x506ddbdd3535f9c9, %g1, %r23
	setx 0x43aed65673727af7, %g1, %r24
	setx 0xf34f9a9e361f95cc, %g1, %r25
	setx 0x1455516b84e319bd, %g1, %r26
	setx 0x4468392881cb4a81, %g1, %r27
	setx 0x87e60b9ce2e47d40, %g1, %r28
	setx 0xcd5576e269f2d9ad, %g1, %r29
	setx 0x3b3b5af55821a9b3, %g1, %r30
	setx 0x496eb9dd6dd4a9c5, %g1, %r31
	save
	setx 0xf3e6d029cf1edba7, %g1, %r16
	setx 0x220ceb9681d73092, %g1, %r17
	setx 0xcf821e12774e8722, %g1, %r18
	setx 0xebb4cbd827ee074a, %g1, %r19
	setx 0xaf59d1c9f64f575c, %g1, %r20
	setx 0xdcdd0df7dc395668, %g1, %r21
	setx 0xd5ed4fdd3ca37b03, %g1, %r22
	setx 0x355026171370de77, %g1, %r23
	setx 0x4e131c49a00b1955, %g1, %r24
	setx 0xca1b0d484a3196e9, %g1, %r25
	setx 0x89cf44626b8097c7, %g1, %r26
	setx 0xfb2a61cb0e14b3e9, %g1, %r27
	setx 0x470bf36a561d7771, %g1, %r28
	setx 0x168f492dff126cd1, %g1, %r29
	setx 0x3d1cfac3e461502a, %g1, %r30
	setx 0x0bc006e96974df71, %g1, %r31
	save
	setx 0x2c8c6cfd50d0583a, %g1, %r16
	setx 0xfc246ee29e3c6909, %g1, %r17
	setx 0x2c8d74c8baebbddc, %g1, %r18
	setx 0x1aba83539f148cd6, %g1, %r19
	setx 0x61542b8898470ff5, %g1, %r20
	setx 0xaf6103b038fbd547, %g1, %r21
	setx 0x43214d08b65307ab, %g1, %r22
	setx 0xf9fea29f50ee5aaa, %g1, %r23
	setx 0x337c25e86102fb8f, %g1, %r24
	setx 0x52540793d958401a, %g1, %r25
	setx 0xdec5db29eb6d634c, %g1, %r26
	setx 0x9d8790ac6f15bd3c, %g1, %r27
	setx 0xaf829e346eff941d, %g1, %r28
	setx 0x8e23181986827fef, %g1, %r29
	setx 0x6efdf2f89206d3b8, %g1, %r30
	setx 0x220b13c765785e8b, %g1, %r31
	save
	setx 0xe985106e1e74815b, %g1, %r16
	setx 0x5273c1fb3736fdb7, %g1, %r17
	setx 0x71aa9d5d2b15bc21, %g1, %r18
	setx 0x8ef3c153385dec26, %g1, %r19
	setx 0x0b1bf95d27654918, %g1, %r20
	setx 0xaf7877d7fa64cf7f, %g1, %r21
	setx 0x542a557c474efd85, %g1, %r22
	setx 0xdc4f7723a194aaa5, %g1, %r23
	setx 0x6407fd96857f3909, %g1, %r24
	setx 0xd9f5575fee159091, %g1, %r25
	setx 0x8a0b0494e28fbd85, %g1, %r26
	setx 0xa7df114b839ea4f8, %g1, %r27
	setx 0x57e77051e36b5eb4, %g1, %r28
	setx 0xebffcfd948bc7229, %g1, %r29
	setx 0x7be449341937a725, %g1, %r30
	setx 0x2fcbb7e998b53505, %g1, %r31
	save
	setx 0xd77f05709283c8bd, %g1, %r16
	setx 0xd24250507121093a, %g1, %r17
	setx 0xe71a16f2ce740b59, %g1, %r18
	setx 0xdf05c9cb2460a537, %g1, %r19
	setx 0xffa0e982b72cbb17, %g1, %r20
	setx 0xa7685c220bd8518d, %g1, %r21
	setx 0x7bfde0912fef9bc1, %g1, %r22
	setx 0x98f051d1221ae1fd, %g1, %r23
	setx 0x4b68e3f461e081db, %g1, %r24
	setx 0xd9bcde88010aa320, %g1, %r25
	setx 0x67c9f5a49e28120b, %g1, %r26
	setx 0xe1e2e7f835f8dfe7, %g1, %r27
	setx 0x51efccdc4d250540, %g1, %r28
	setx 0xd56b637359f5759d, %g1, %r29
	setx 0x59b52eff3d43d938, %g1, %r30
	setx 0x7fb18cbda3007d25, %g1, %r31
	save
	setx 0x52907f89e3cc8f63, %g1, %r16
	setx 0x0de3b7034fe8b839, %g1, %r17
	setx 0xcc5315fdbcb7978b, %g1, %r18
	setx 0x1387e0db7d9e9011, %g1, %r19
	setx 0x71cea7899c1a6dc2, %g1, %r20
	setx 0x4f92ec01548b0462, %g1, %r21
	setx 0xde40877285e2a9dc, %g1, %r22
	setx 0x907af48c8df7ee88, %g1, %r23
	setx 0x745cd8794f1204d5, %g1, %r24
	setx 0xfe9ef4ca9fde3d3d, %g1, %r25
	setx 0x3fe6a302bcf55adb, %g1, %r26
	setx 0x55d7593d2643e186, %g1, %r27
	setx 0xd805c7c29b13948a, %g1, %r28
	setx 0xb44f1dc1f1bbf44b, %g1, %r29
	setx 0x2d143e79bc338b77, %g1, %r30
	setx 0x94a14df535b0fef9, %g1, %r31
	save
	setx 0xfd6a89171600c1e8, %g1, %r16
	setx 0x833c632843b8477c, %g1, %r17
	setx 0x1e05a3a7f860bdb5, %g1, %r18
	setx 0x8c591c4717b5a886, %g1, %r19
	setx 0x88068a45213e311b, %g1, %r20
	setx 0xf02691ffaa3fc6b8, %g1, %r21
	setx 0x1e8b5264ccb60018, %g1, %r22
	setx 0x6270a024890eba01, %g1, %r23
	setx 0xd04b60ea7ff8c471, %g1, %r24
	setx 0xa12664d721499cfb, %g1, %r25
	setx 0xd23e06c5aea329a4, %g1, %r26
	setx 0x3284b70510169558, %g1, %r27
	setx 0xb94e6692166ed2a0, %g1, %r28
	setx 0xe59a46d74f802c6c, %g1, %r29
	setx 0x3867b8cc7c298ae1, %g1, %r30
	setx 0xe034b11b1e51d188, %g1, %r31
	ta	T_CHANGE_HPRIV
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
	ta	T_CHANGE_NONHPRIV
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
	setx	0x31b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e131  ! 6: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4a0b5  ! 13: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7504000  ! 14: RDPR_TNPC	<illegal instruction>
	.word 0xb48ca0be  ! 15: ANDcc_I	andcc 	%r18, 0x00be, %r26
	.word 0xb5504000  ! 16: RDPR_TNPC	<illegal instruction>
	.word 0xbfe420b8  ! 18: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 23: RDPR_PSTATE	<illegal instruction>
	.word 0x8394e052  ! 25: WRPR_TNPC_I	wrpr	%r19, 0x0052, %tnpc
	.word 0xbfe4e141  ! 29: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e521b6  ! 32: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a044  ! 41: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5a036  ! 44: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1540000  ! 45: RDPR_GL	<illegal instruction>
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb844c000  ! 51: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xb5e521fe  ! 53: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 56: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 58: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bca14a  ! 61: XNORcc_I	xnorcc 	%r18, 0x014a, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4a1db  ! 68: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9510000  ! 69: RDPR_TICK	<illegal instruction>
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395215b  ! 72: WRPR_TNPC_I	wrpr	%r20, 0x015b, %tnpc
	.word 0xb825c000  ! 73: SUB_R	sub 	%r23, %r0, %r28
	.word 0xb5e4e1d4  ! 79: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0a7  ! 84: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe4608c  ! 86: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e52078  ! 93: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe521b4  ! 98: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbc8c60f2  ! 99: ANDcc_I	andcc 	%r17, 0x00f2, %r30
	.word 0xb5e4a07d  ! 100: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe5206c  ! 101: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x2032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899521dd  ! 103: WRPR_TICK_I	wrpr	%r20, 0x01dd, %tick
	.word 0xbd540000  ! 105: RDPR_GL	<illegal instruction>
	.word 0xb9e5e10b  ! 106: SAVE_I	save	%r23, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 107: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde56118  ! 108: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e56038  ! 110: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e560d6  ! 112: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e07a  ! 121: SAVE_I	save	%r19, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 124: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd480000  ! 129: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	data_start_1, %g1, %r23
	.word 0xb6a5600d  ! 133: SUBcc_I	subcc 	%r21, 0x000d, %r27
	.word 0xb3e521a1  ! 135: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 139: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 140: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe461b6  ! 142: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5a023  ! 143: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1d5  ! 147: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3508000  ! 149: RDPR_TSTATE	<illegal instruction>
	.word 0x9195a0f7  ! 150: WRPR_PIL_I	wrpr	%r22, 0x00f7, %pil
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e56029  ! 156: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5a017  ! 159: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb03c6142  ! 170: XNOR_I	xnor 	%r17, 0x0142, %r24
	.word 0xbfe421ae  ! 174: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe4e18f  ! 175: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e46182  ! 176: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e521d6  ! 177: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e04d  ! 181: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e09b  ! 187: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919521c0  ! 193: WRPR_PIL_I	wrpr	%r20, 0x01c0, %pil
	.word 0xbde5e1bb  ! 196: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde42143  ! 198: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x9194a18d  ! 199: WRPR_PIL_I	wrpr	%r18, 0x018d, %pil
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 207: MOVcc_I	<illegal instruction>
	.word 0xb7e4e156  ! 209: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe4e1ba  ! 210: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb52d0000  ! 218: SLL_R	sll 	%r20, %r0, %r26
	.word 0xb7e4215d  ! 225: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbf504000  ! 227: RDPR_TNPC	<illegal instruction>
	.word 0x8395203c  ! 230: WRPR_TNPC_I	wrpr	%r20, 0x003c, %tnpc
	.word 0xbde5619e  ! 231: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e4e09c  ! 232: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb33d9000  ! 240: SRAX_R	srax	%r22, %r0, %r25
	.word 0xbbe421cf  ! 241: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8d94a01b  ! 244: WRPR_PSTATE_I	wrpr	%r18, 0x001b, %pstate
	.word 0xb7e4207e  ! 246: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb348000  ! 254: SRL_R	srl 	%r18, %r0, %r29
	.word 0xb1e421c6  ! 256: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4205f  ! 257: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9504000  ! 258: RDPR_TNPC	<illegal instruction>
	.word 0xb57d6401  ! 259: MOVR_I	movre	%r21, 0x1, %r26
	.word 0xb1e4a176  ! 261: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5e0d2  ! 266: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x83956031  ! 268: WRPR_TNPC_I	wrpr	%r21, 0x0031, %tnpc
	.word 0xb9518000  ! 269: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e420d6  ! 271: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8d95a1a7  ! 272: WRPR_PSTATE_I	wrpr	%r22, 0x01a7, %pstate
	.word 0xb9e560ce  ! 273: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	.word 0xb7e4e078  ! 276: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbd510000  ! 283: RDPR_TICK	<illegal instruction>
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5614b  ! 287: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5e1b0  ! 288: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe56038  ! 289: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e5605a  ! 291: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e52104  ! 292: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a0b6  ! 293: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf480000  ! 299: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a16a  ! 307: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e520cc  ! 309: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb6bcc000  ! 310: XNORcc_R	xnorcc 	%r19, %r0, %r27
	setx	data_start_1, %g1, %r19
	.word 0xb7e5a01a  ! 315: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1508000  ! 316: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5207d  ! 324: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe4e1b7  ! 326: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e52114  ! 328: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8594e155  ! 331: WRPR_TSTATE_I	wrpr	%r19, 0x0155, %tstate
	.word 0x8794a1b2  ! 334: WRPR_TT_I	wrpr	%r18, 0x01b2, %tt
	setx	data_start_5, %g1, %r23
	.word 0xb3480000  ! 354: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbbe5e09c  ! 360: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e42013  ! 362: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e46142  ! 363: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbeb4e1fc  ! 365: SUBCcc_I	orncc 	%r19, 0x01fc, %r31
	.word 0x9195e009  ! 366: WRPR_PIL_I	wrpr	%r23, 0x0009, %pil
	.word 0xbb508000  ! 368: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4e1eb  ! 369: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e46056  ! 370: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7e5a080  ! 375: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 379: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f41  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f41, %hpstate
	.word 0xbbe4e00b  ! 382: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x879560ba  ! 383: WRPR_TT_I	wrpr	%r21, 0x00ba, %tt
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88dc000  ! 385: ANDcc_R	andcc 	%r23, %r0, %r28
	.word 0xb824a172  ! 386: SUB_I	sub 	%r18, 0x0172, %r28
	.word 0xb5e4e1a4  ! 387: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e5206d  ! 389: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb095c000  ! 391: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xbde421d8  ! 393: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e46161  ! 396: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4e093  ! 397: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x2010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a006  ! 401: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4e088  ! 407: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde460bd  ! 409: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_5, %g1, %r18
	.word 0xb9e561db  ! 416: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5e11f  ! 422: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb6446170  ! 423: ADDC_I	addc 	%r17, 0x0170, %r27
	.word 0xbbe520d0  ! 424: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x1020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb435e026  ! 428: SUBC_I	orn 	%r23, 0x0026, %r26
	.word 0xb1510000  ! 432: RDPR_TICK	<illegal instruction>
	.word 0xb5e560e5  ! 433: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e461e3  ! 434: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d946001  ! 437: WRPR_PSTATE_I	wrpr	%r17, 0x0001, %pstate
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 456: RDPR_GL	<illegal instruction>
	.word 0xbc3ce1ce  ! 458: XNOR_I	xnor 	%r19, 0x01ce, %r30
	.word 0xb095a1aa  ! 465: ORcc_I	orcc 	%r22, 0x01aa, %r24
	.word 0x9194608d  ! 466: WRPR_PIL_I	wrpr	%r17, 0x008d, %pil
	.word 0xb5e52060  ! 469: SAVE_I	save	%r20, 0x0001, %r26
	mov	1, %r14
	.word 0xa193a000  ! 471: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a032  ! 476: WRPR_TT_I	wrpr	%r18, 0x0032, %tt
	.word 0xb5e520af  ! 478: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4a18a  ! 480: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e5e14c  ! 481: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4e0f6  ! 483: SAVE_I	save	%r19, 0x0001, %r30
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe560e1  ! 491: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8594e091  ! 492: WRPR_TSTATE_I	wrpr	%r19, 0x0091, %tstate
	.word 0xbbe5e134  ! 496: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb825c000  ! 497: SUB_R	sub 	%r23, %r0, %r28
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e521cf  ! 500: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7518000  ! 501: RDPR_PSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 502: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd500000  ! 508: RDPR_TPC	<illegal instruction>
	.word 0xb7e5a125  ! 509: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5a0fd  ! 512: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4e08e  ! 520: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb49cc000  ! 522: XORcc_R	xorcc 	%r19, %r0, %r26
	setx	0x2030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e42062  ! 539: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4e1ba  ! 540: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e5218d  ! 541: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1518000  ! 542: RDPR_PSTATE	<illegal instruction>
	.word 0xbb500000  ! 544: RDPR_TPC	<illegal instruction>
	.word 0xb5e4a19f  ! 548: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x9194a113  ! 549: WRPR_PIL_I	wrpr	%r18, 0x0113, %pil
	.word 0xbde460a0  ! 553: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0x8995e101  ! 556: WRPR_TICK_I	wrpr	%r23, 0x0101, %tick
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42157  ! 561: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982893  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0893, %hpstate
	.word 0xbbe460d3  ! 570: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb151c000  ! 571: RDPR_TL	<illegal instruction>
	.word 0xb3e42139  ! 575: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e460af  ! 576: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde420c6  ! 580: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e52136  ! 584: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe46105  ! 586: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4e1b6  ! 588: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e5a15a  ! 590: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4a1ff  ! 591: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e4203d  ! 592: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e561a3  ! 595: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e4204f  ! 597: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8994e1b3  ! 598: WRPR_TICK_I	wrpr	%r19, 0x01b3, %tick
	.word 0xb2944000  ! 599: ORcc_R	orcc 	%r17, %r0, %r25
	.word 0xb3e5e105  ! 603: SAVE_I	save	%r23, 0x0001, %r25
	mov	2, %r12
	.word 0x8f932000  ! 605: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe52105  ! 608: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe520ed  ! 615: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5500000  ! 617: RDPR_TPC	<illegal instruction>
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 624: RDPR_GL	<illegal instruction>
	.word 0xbde4a03c  ! 625: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe5e03d  ! 626: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e560db  ! 627: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbd508000  ! 629: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5e1c6  ! 633: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e5211d  ! 635: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe460e7  ! 640: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde421cd  ! 643: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3508000  ! 651: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983fc3  ! 659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc3, %hpstate
	.word 0xb7e5a1a4  ! 661: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe5e0ca  ! 662: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbf510000  ! 665: RDPR_TICK	<illegal instruction>
	.word 0xb5e52082  ! 669: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e5a1ec  ! 670: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe42051  ! 671: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_6, %g1, %r23
	.word 0x899560be  ! 676: WRPR_TICK_I	wrpr	%r21, 0x00be, %tick
	.word 0xb7480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3e4602e  ! 682: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde46063  ! 683: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5214d  ! 685: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8595e006  ! 686: WRPR_TSTATE_I	wrpr	%r23, 0x0006, %tstate
	.word 0xb7e4219d  ! 687: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8594e114  ! 689: WRPR_TSTATE_I	wrpr	%r19, 0x0114, %tstate
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e150  ! 697: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5206d  ! 699: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbac54000  ! 700: ADDCcc_R	addccc 	%r21, %r0, %r29
	.word 0xb5e5e0ae  ! 701: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0452128  ! 703: ADDC_I	addc 	%r20, 0x0128, %r24
	.word 0xb1e5210b  ! 708: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd500000  ! 712: RDPR_TPC	<illegal instruction>
	.word 0xbde5e179  ! 714: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e42011  ! 716: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5606e  ! 717: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe5e08e  ! 719: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x83956050  ! 723: WRPR_TNPC_I	wrpr	%r21, 0x0050, %tnpc
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46179  ! 727: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_1, %g1, %r18
	.word 0xbde4e139  ! 730: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e56196  ! 733: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5e137  ! 737: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e4a1b6  ! 738: SAVE_I	save	%r18, 0x0001, %r26
	setx	data_start_2, %g1, %r22
	.word 0xb1e52136  ! 740: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e4e15d  ! 741: SAVE_I	save	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983fcb  ! 743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fcb, %hpstate
	.word 0xbbe420b5  ! 745: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0xbfe5a13b  ! 747: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5504000  ! 749: RDPR_TNPC	<illegal instruction>
	.word 0xbfe56186  ! 751: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4e03c  ! 755: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e52134  ! 758: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946114  ! 764: WRPR_PIL_I	wrpr	%r17, 0x0114, %pil
	.word 0xbbe561bf  ! 769: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5a159  ! 771: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9520000  ! 776: RDPR_PIL	<illegal instruction>
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 780: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0xbbe5a19f  ! 798: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde46199  ! 799: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	.word 0xb9e4e14c  ! 812: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e4e1cd  ! 818: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 820: RDPR_GL	<illegal instruction>
	.word 0xb7e5206b  ! 821: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5510000  ! 823: RDPR_TICK	<illegal instruction>
	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1db  ! 827: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_3, %g1, %r21
	.word 0xb1e5e1ec  ! 831: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4e114  ! 832: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e5a010  ! 834: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4a127  ! 837: SAVE_I	save	%r18, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 838: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd508000  ! 842: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4e18f  ! 843: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e42161  ! 847: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0b9  ! 851: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e5a099  ! 852: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e4a0f3  ! 853: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e520ee  ! 863: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbb518000  ! 873: RDPR_PSTATE	<illegal instruction>
	.word 0xb33d1000  ! 877: SRAX_R	srax	%r20, %r0, %r25
	.word 0xb5e5215f  ! 879: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbeb48000  ! 882: SUBCcc_R	orncc 	%r18, %r0, %r31
	setx	data_start_7, %g1, %r19
	.word 0xb9e5e0d7  ! 885: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5a14d  ! 887: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe461fd  ! 888: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4a064  ! 889: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e4610e  ! 895: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0x83952127  ! 899: WRPR_TNPC_I	wrpr	%r20, 0x0127, %tnpc
	.word 0xbd518000  ! 902: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4a134  ! 906: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde56069  ! 907: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xba946034  ! 908: ORcc_I	orcc 	%r17, 0x0034, %r29
	.word 0xb5e421f5  ! 909: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8994e0f1  ! 910: WRPR_TICK_I	wrpr	%r19, 0x00f1, %tick
	.word 0xbde4e15e  ! 911: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8d95205b  ! 915: WRPR_PSTATE_I	wrpr	%r20, 0x005b, %pstate
	.word 0xb3e461d7  ! 916: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e461cd  ! 919: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe42028  ! 924: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e5a1e2  ! 925: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe561bc  ! 928: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e56119  ! 930: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe5a1f9  ! 934: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8794e11e  ! 936: WRPR_TT_I	wrpr	%r19, 0x011e, %tt
	.word 0xb9e4609a  ! 938: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0f8  ! 944: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb750c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0xb1520000  ! 947: RDPR_PIL	<illegal instruction>
	.word 0x8d95a063  ! 950: WRPR_PSTATE_I	wrpr	%r22, 0x0063, %pstate
	.word 0xb1520000  ! 952: RDPR_PIL	<illegal instruction>
	.word 0xbde4208e  ! 953: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8995215a  ! 959: WRPR_TICK_I	wrpr	%r20, 0x015a, %tick
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 967: RDPR_TPC	<illegal instruction>
	.word 0xbde460c1  ! 968: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb8b48000  ! 971: ORNcc_R	orncc 	%r18, %r0, %r28
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a118  ! 973: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde46116  ! 974: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e4a1d8  ! 975: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xba0cc000  ! 976: AND_R	and 	%r19, %r0, %r29
	.word 0xb5e461e3  ! 982: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_4, %g1, %r21
	.word 0xbfe5e17d  ! 985: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e4a13e  ! 990: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e5e0d0  ! 992: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e52143  ! 993: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x89942182  ! 995: WRPR_TICK_I	wrpr	%r16, 0x0182, %tick
	.word 0xb3e561b1  ! 997: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde4a1b8  ! 998: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5e04b  ! 1002: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe42182  ! 1003: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb150c000  ! 1005: RDPR_TT	<illegal instruction>
	.word 0xb5e421e2  ! 1006: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_7, %g1, %r20
	.word 0xb3e52159  ! 1011: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5518000  ! 1013: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r20
	.word 0xbfe5a02b  ! 1016: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4e1bf  ! 1019: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5608f  ! 1023: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_3, %g1, %r16
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5609e  ! 1028: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4217b  ! 1039: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde4e0e3  ! 1040: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8595a1a9  ! 1043: WRPR_TSTATE_I	wrpr	%r22, 0x01a9, %tstate
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41ce0ae  ! 1046: XOR_I	xor 	%r19, 0x00ae, %r26
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1ef  ! 1049: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0c0  ! 1069: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e4e170  ! 1073: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 1078: RDPR_PSTATE	<illegal instruction>
	.word 0x8994a029  ! 1079: WRPR_TICK_I	wrpr	%r18, 0x0029, %tick
	.word 0x8194e1ea  ! 1080: WRPR_TPC_I	wrpr	%r19, 0x01ea, %tpc
	.word 0xbde560f5  ! 1081: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5605a  ! 1087: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb2b5e04f  ! 1091: ORNcc_I	orncc 	%r23, 0x004f, %r25
	.word 0xb1e4a006  ! 1092: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x20011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 1098: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5a0d1  ! 1101: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e5e1a4  ! 1102: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb97cc400  ! 1106: MOVR_R	movre	%r19, %r0, %r28
	.word 0xb7e4e172  ! 1108: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7504000  ! 1115: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e031  ! 1116: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb48d2152  ! 1118: ANDcc_I	andcc 	%r20, 0x0152, %r26
	.word 0xb3343001  ! 1119: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xb3e42179  ! 1120: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7504000  ! 1121: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e421d5  ! 1127: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8595e041  ! 1128: WRPR_TSTATE_I	wrpr	%r23, 0x0041, %tstate
	.word 0xb7e4a080  ! 1129: SAVE_I	save	%r18, 0x0001, %r27
	mov	1, %r12
	.word 0x8f932000  ! 1133: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9195a0e9  ! 1137: WRPR_PIL_I	wrpr	%r22, 0x00e9, %pil
	.word 0xb53cc000  ! 1141: SRA_R	sra 	%r19, %r0, %r26
	.word 0xb9504000  ! 1142: RDPR_TNPC	<illegal instruction>
	.word 0xb77c0400  ! 1143: MOVR_R	movre	%r16, %r0, %r27
	setx	0x1022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe42024  ! 1146: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4e02a  ! 1148: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5a1a7  ! 1149: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5218c  ! 1150: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb72df001  ! 1151: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xb1e561bd  ! 1153: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe5604b  ! 1158: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e5a03a  ! 1161: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5e086  ! 1162: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbe9dc000  ! 1164: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xbd510000  ! 1169: RDPR_TICK	<illegal instruction>
	.word 0xbb2ca001  ! 1170: SLL_I	sll 	%r18, 0x0001, %r29
	.word 0xb9500000  ! 1173: RDPR_TPC	<illegal instruction>
	.word 0xb7e52041  ! 1174: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb894e1df  ! 1175: ORcc_I	orcc 	%r19, 0x01df, %r28
	.word 0xbfe5207a  ! 1176: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5607b  ! 1185: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4e0aa  ! 1187: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e56022  ! 1188: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_5, %g1, %r19
	.word 0xb5e5a1e8  ! 1190: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde560c8  ! 1193: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 1197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	.word 0xb3e56184  ! 1198: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb93c3001  ! 1199: SRAX_I	srax	%r16, 0x0001, %r28
	.word 0xbf50c000  ! 1200: RDPR_TT	<illegal instruction>
	.word 0xb5e5a052  ! 1201: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7508000  ! 1205: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e46003  ! 1216: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x87952108  ! 1217: WRPR_TT_I	wrpr	%r20, 0x0108, %tt
	.word 0xb1510000  ! 1220: RDPR_TICK	<illegal instruction>
	.word 0xb5e4a1f7  ! 1225: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xba1d4000  ! 1228: XOR_R	xor 	%r21, %r0, %r29
	.word 0xbeb5c000  ! 1235: SUBCcc_R	orncc 	%r23, %r0, %r31
	.word 0x879461cc  ! 1239: WRPR_TT_I	wrpr	%r17, 0x01cc, %tt
	.word 0xbfe4e1af  ! 1242: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8994e1c0  ! 1245: WRPR_TICK_I	wrpr	%r19, 0x01c0, %tick
	.word 0xb414a12b  ! 1248: OR_I	or 	%r18, 0x012b, %r26
	.word 0xb8ada16d  ! 1250: ANDNcc_I	andncc 	%r22, 0x016d, %r28
	.word 0xb9e4e155  ! 1253: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8395a00c  ! 1256: WRPR_TNPC_I	wrpr	%r22, 0x000c, %tnpc
	.word 0xb7e52127  ! 1259: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb151c000  ! 1265: RDPR_TL	<illegal instruction>
	.word 0xb3e4e1f3  ! 1269: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb12cd000  ! 1272: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xbb504000  ! 1273: RDPR_TNPC	<illegal instruction>
	.word 0xb2254000  ! 1276: SUB_R	sub 	%r21, %r0, %r25
	.word 0xb3520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0xb3e5a1cd  ! 1280: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e561a7  ! 1281: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe5a148  ! 1282: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5a19c  ! 1283: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e5e1d7  ! 1284: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8d946162  ! 1286: WRPR_PSTATE_I	wrpr	%r17, 0x0162, %pstate
	.word 0xb9e4a1a0  ! 1289: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e46031  ! 1290: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e4214c  ! 1297: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe42047  ! 1299: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5206e  ! 1300: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe5a058  ! 1302: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e56137  ! 1303: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5500000  ! 1305: RDPR_TPC	<illegal instruction>
	.word 0xb17de401  ! 1311: MOVR_I	movre	%r23, 0x1, %r24
	.word 0xbfe560c1  ! 1313: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_6, %g1, %r20
	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 1321: RDPR_TNPC	<illegal instruction>
	.word 0xb3518000  ! 1323: RDPR_PSTATE	<illegal instruction>
	.word 0xbb518000  ! 1332: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e42055  ! 1333: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e5e0fd  ! 1334: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbd480000  ! 1335: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1e4a057  ! 1336: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_5, %g1, %r18
	.word 0xb9e561a4  ! 1339: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde420af  ! 1343: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb518000  ! 1344: RDPR_PSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xb3e4e068  ! 1351: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4a149  ! 1353: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42073  ! 1358: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5a185  ! 1360: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4612a  ! 1361: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e461a2  ! 1364: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e5202d  ! 1369: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde46104  ! 1376: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e4a1b2  ! 1378: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e08f  ! 1393: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4e083  ! 1394: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb72d6001  ! 1395: SLL_I	sll 	%r21, 0x0001, %r27
	.word 0xbb510000  ! 1396: RDPR_TICK	<illegal instruction>
	.word 0xb5e5e0c8  ! 1399: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e4610f  ! 1401: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5200d  ! 1403: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 1410: RDPR_TICK	<illegal instruction>
	.word 0xb5510000  ! 1411: RDPR_TICK	<illegal instruction>
	.word 0xbfe4e062  ! 1412: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb044c000  ! 1413: ADDC_R	addc 	%r19, %r0, %r24
	.word 0x819521b2  ! 1414: WRPR_TPC_I	wrpr	%r20, 0x01b2, %tpc
	.word 0xb3e5e189  ! 1417: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5e186  ! 1418: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbc3d6000  ! 1420: XNOR_I	xnor 	%r21, 0x0000, %r30
	.word 0xb5e560a1  ! 1423: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbb3d8000  ! 1424: SRA_R	sra 	%r22, %r0, %r29
	.word 0xb6842058  ! 1429: ADDcc_I	addcc 	%r16, 0x0058, %r27
	.word 0xb1e56001  ! 1430: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8594216b  ! 1431: WRPR_TSTATE_I	wrpr	%r16, 0x016b, %tstate
	.word 0xb335b001  ! 1434: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xbbe5a076  ! 1437: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7480000  ! 1440: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbe1c4000  ! 1442: XOR_R	xor 	%r17, %r0, %r31
	setx	data_start_7, %g1, %r19
	.word 0xb7e4e108  ! 1446: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe5204c  ! 1447: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb17d4400  ! 1448: MOVR_R	movre	%r21, %r0, %r24
	.word 0xb351c000  ! 1449: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1451: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e460fe  ! 1456: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e4605c  ! 1457: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb510000  ! 1458: RDPR_TICK	<illegal instruction>
	.word 0x8794e1b5  ! 1461: WRPR_TT_I	wrpr	%r19, 0x01b5, %tt
	.word 0x8d9421a7  ! 1462: WRPR_PSTATE_I	wrpr	%r16, 0x01a7, %pstate
	.word 0xbfe4a017  ! 1465: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e560e5  ! 1467: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5605f  ! 1469: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e52012  ! 1470: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe52020  ! 1473: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde420a1  ! 1474: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5540000  ! 1475: RDPR_GL	<illegal instruction>
	.word 0xb7e4a1cf  ! 1476: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983cd9  ! 1480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd9, %hpstate
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e092  ! 1487: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x20003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1489: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4617b  ! 1493: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 1501: RDPR_TPC	<illegal instruction>
	.word 0xb9e5e083  ! 1503: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5a026  ! 1504: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e46024  ! 1507: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb69d0000  ! 1510: XORcc_R	xorcc 	%r20, %r0, %r27
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 1517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	.word 0xbde4e077  ! 1518: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5e1dc  ! 1520: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb500000  ! 1525: RDPR_TPC	<illegal instruction>
	.word 0xbde46029  ! 1530: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4e146  ! 1538: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e521a4  ! 1541: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe4a03d  ! 1542: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4a0d3  ! 1550: SAVE_I	save	%r18, 0x0001, %r28
	mov	2, %r12
	.word 0x8f932000  ! 1553: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_2, %g1, %r19
	.word 0xb751c000  ! 1556: RDPR_TL	<illegal instruction>
	.word 0xb0a4e053  ! 1561: SUBcc_I	subcc 	%r19, 0x0053, %r24
	.word 0xb1510000  ! 1567: RDPR_TICK	<illegal instruction>
	.word 0xb1e46108  ! 1579: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb150c000  ! 1580: RDPR_TT	<illegal instruction>
	.word 0xbde4a1b1  ! 1581: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe4a13d  ! 1583: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8595e1d2  ! 1586: WRPR_TSTATE_I	wrpr	%r23, 0x01d2, %tstate
	.word 0xbde52021  ! 1587: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4a0ce  ! 1588: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb6b4e1ed  ! 1589: SUBCcc_I	orncc 	%r19, 0x01ed, %r27
	.word 0xb9e4e0a7  ! 1591: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e561a2  ! 1594: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4208a  ! 1596: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbf2dd000  ! 1597: SLLX_R	sllx	%r23, %r0, %r31
	setx	0x10312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xbf510000  ! 1602: RDPR_TICK	<illegal instruction>
	.word 0xbd35d000  ! 1611: SRLX_R	srlx	%r23, %r0, %r30
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1f7  ! 1616: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5a058  ! 1618: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe560c1  ! 1619: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8994a0eb  ! 1620: WRPR_TICK_I	wrpr	%r18, 0x00eb, %tick
	.word 0xbf51c000  ! 1622: RDPR_TL	<illegal instruction>
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 1627: RDPR_GL	<illegal instruction>
	.word 0xb5e5e1a5  ! 1631: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbab520f8  ! 1634: SUBCcc_I	orncc 	%r20, 0x00f8, %r29
	.word 0xbfe52122  ! 1636: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbb504000  ! 1638: RDPR_TNPC	<illegal instruction>
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1510000  ! 1651: RDPR_TICK	<illegal instruction>
	setx	0x3011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4218b  ! 1663: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd510000  ! 1665: RDPR_TICK	<illegal instruction>
	.word 0xb33ca001  ! 1666: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xb7e4a061  ! 1669: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb62c0000  ! 1673: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xbfe4a063  ! 1677: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0xbfe4a029  ! 1681: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb6a58000  ! 1682: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xbbe521d6  ! 1693: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 1700: RDPR_PSTATE	<illegal instruction>
	.word 0xb6bc4000  ! 1701: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0xb1e4e05a  ! 1702: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb643801  ! 1711: MOVcc_I	<illegal instruction>
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e461c5  ! 1719: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8594607d  ! 1724: WRPR_TSTATE_I	wrpr	%r17, 0x007d, %tstate
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde521dd  ! 1733: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5e0b1  ! 1737: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4e107  ! 1738: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e4e0d5  ! 1740: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983e99  ! 1743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e99, %hpstate
	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a110  ! 1749: WRPR_TPC_I	wrpr	%r22, 0x0110, %tpc
	.word 0xbbe42167  ! 1751: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x9194e1bd  ! 1752: WRPR_PIL_I	wrpr	%r19, 0x01bd, %pil
	.word 0x91952118  ! 1754: WRPR_PIL_I	wrpr	%r20, 0x0118, %pil
	.word 0xb7e5e122  ! 1756: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde5a089  ! 1757: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbd520000  ! 1760: RDPR_PIL	<illegal instruction>
	.word 0xbb518000  ! 1762: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e521dc  ! 1764: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e42139  ! 1768: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb751c000  ! 1771: RDPR_TL	<illegal instruction>
	setx	0x20026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e17f  ! 1780: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4600c  ! 1793: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4614f  ! 1796: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8195e1af  ! 1798: WRPR_TPC_I	wrpr	%r23, 0x01af, %tpc
	.word 0x919521f9  ! 1800: WRPR_PIL_I	wrpr	%r20, 0x01f9, %pil
	setx	0x10000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a1ee  ! 1806: WRPR_TPC_I	wrpr	%r22, 0x01ee, %tpc
	.word 0xbfe4614a  ! 1809: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5520000  ! 1813: RDPR_PIL	<illegal instruction>
	.word 0xb7e42164  ! 1814: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e521f0  ! 1816: SAVE_I	save	%r20, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 1818: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb80ce0f5  ! 1825: AND_I	and 	%r19, 0x00f5, %r28
	.word 0xbde56151  ! 1826: SAVE_I	save	%r21, 0x0001, %r30
	setx	data_start_1, %g1, %r20
	.word 0xbfe4a0a3  ! 1838: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7520000  ! 1839: RDPR_PIL	<illegal instruction>
	.word 0xb5518000  ! 1841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982cc9  ! 1843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc9, %hpstate
	.word 0xb9e5a1fd  ! 1844: SAVE_I	save	%r22, 0x0001, %r28
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e139  ! 1848: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd510000  ! 1849: RDPR_TICK	<illegal instruction>
	.word 0xb3e5a140  ! 1850: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4600c  ! 1852: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4e0a1  ! 1853: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde5203c  ! 1854: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbd518000  ! 1861: RDPR_PSTATE	<illegal instruction>
	.word 0x8594e076  ! 1863: WRPR_TSTATE_I	wrpr	%r19, 0x0076, %tstate
	.word 0xb9e4a00a  ! 1865: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4a123  ! 1867: SAVE_I	save	%r18, 0x0001, %r27
	setx	data_start_3, %g1, %r22
	.word 0x8394a19f  ! 1871: WRPR_TNPC_I	wrpr	%r18, 0x019f, %tnpc
	.word 0xb0ad20a5  ! 1874: ANDNcc_I	andncc 	%r20, 0x00a5, %r24
	.word 0x8395a0d3  ! 1875: WRPR_TNPC_I	wrpr	%r22, 0x00d3, %tnpc
	.word 0xbbe5a05d  ! 1877: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x20020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_3, %g1, %r18
	.word 0xbfe420ee  ! 1885: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb484e19e  ! 1886: ADDcc_I	addcc 	%r19, 0x019e, %r26
	.word 0xbfe4a13a  ! 1889: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e46093  ! 1890: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbcb5a16f  ! 1891: ORNcc_I	orncc 	%r22, 0x016f, %r30
	.word 0xbde46001  ! 1892: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbeb4a173  ! 1896: ORNcc_I	orncc 	%r18, 0x0173, %r31
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5a0d5  ! 1909: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde421c2  ! 1917: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde5a0ef  ! 1918: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbf540000  ! 1922: RDPR_GL	<illegal instruction>
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42099  ! 1925: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e4e19c  ! 1927: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8194a0a9  ! 1928: WRPR_TPC_I	wrpr	%r18, 0x00a9, %tpc
	.word 0xb57c2401  ! 1932: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xb9e5a0a7  ! 1933: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4a0ee  ! 1934: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 1938: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e521cd  ! 1939: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e421a5  ! 1947: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e56127  ! 1951: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb351c000  ! 1953: RDPR_TL	<illegal instruction>
	.word 0xb9e46000  ! 1954: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x10230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1f1  ! 1960: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5a08d  ! 1962: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e5e0f2  ! 1964: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1504000  ! 1965: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e4b  ! 1966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4b, %hpstate
	setx	data_start_4, %g1, %r22
	.word 0xbc45c000  ! 1969: ADDC_R	addc 	%r23, %r0, %r30
	.word 0x8d94e001  ! 1970: WRPR_PSTATE_I	wrpr	%r19, 0x0001, %pstate
	.word 0x9194a025  ! 1972: WRPR_PIL_I	wrpr	%r18, 0x0025, %pil
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1ea  ! 1976: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5a02c  ! 1983: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe5e1e3  ! 1988: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e56045  ! 1992: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e5a1ab  ! 1995: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0d1  ! 2001: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4215c  ! 2006: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x3023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46035  ! 2010: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e4208c  ! 2013: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5e054  ! 2014: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982bd3  ! 2015: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd3, %hpstate
	.word 0xb3e5606d  ! 2017: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e4e02a  ! 2019: SAVE_I	save	%r19, 0x0001, %r26
	setx	data_start_6, %g1, %r23
	.word 0xbde4a0c9  ! 2023: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e5e18c  ! 2031: SAVE_I	save	%r23, 0x0001, %r28
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2034: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e4e036  ! 2035: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde4e0d8  ! 2038: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbf518000  ! 2039: RDPR_PSTATE	<illegal instruction>
	.word 0xb7518000  ! 2040: RDPR_PSTATE	<illegal instruction>
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe95a18c  ! 2046: ORcc_I	orcc 	%r22, 0x018c, %r31
	.word 0xb0854000  ! 2050: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xb9e4e1a6  ! 2052: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e56115  ! 2053: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb6c48000  ! 2054: ADDCcc_R	addccc 	%r18, %r0, %r27
	setx	0x14, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e460b5  ! 2062: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb72c0000  ! 2065: SLL_R	sll 	%r16, %r0, %r27
	.word 0xb5e4e1e7  ! 2066: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe46082  ! 2067: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8795e079  ! 2068: WRPR_TT_I	wrpr	%r23, 0x0079, %tt
	.word 0xbb500000  ! 2071: RDPR_TPC	<illegal instruction>
	.word 0xb7e4a0ad  ! 2073: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4a13c  ! 2076: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x30029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 2079: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4606a  ! 2082: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a02d  ! 2094: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x919520fe  ! 2095: WRPR_PIL_I	wrpr	%r20, 0x00fe, %pil
	.word 0xb3e52047  ! 2102: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5209c  ! 2108: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x10221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a13e  ! 2116: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe52192  ! 2119: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 2122: RDPR_TL	<illegal instruction>
	.word 0x8d95e160  ! 2125: WRPR_PSTATE_I	wrpr	%r23, 0x0160, %pstate
	.word 0xb5e5219c  ! 2126: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e46147  ! 2127: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4a0cd  ! 2131: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd51c000  ! 2132: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r18
	.word 0xbfe561c8  ! 2139: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x30209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e560ef  ! 2145: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde52121  ! 2149: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde561f7  ! 2153: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde4a022  ! 2155: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5606f  ! 2157: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde46073  ! 2160: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb82da01d  ! 2161: ANDN_I	andn 	%r22, 0x001d, %r28
	.word 0xb3e5211a  ! 2162: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5e064  ! 2163: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3504000  ! 2164: RDPR_TNPC	<illegal instruction>
	.word 0xb9e4a174  ! 2165: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x81942138  ! 2169: WRPR_TPC_I	wrpr	%r16, 0x0138, %tpc
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42157  ! 2177: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8394e156  ! 2193: WRPR_TNPC_I	wrpr	%r19, 0x0156, %tnpc
	.word 0xb7e4e043  ! 2195: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde561ff  ! 2196: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e461b6  ! 2203: SAVE_I	save	%r17, 0x0001, %r24
	mov	1, %r14
	.word 0xa193a000  ! 2204: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba94e1cb  ! 2211: ORcc_I	orcc 	%r19, 0x01cb, %r29
	.word 0xb1e56098  ! 2212: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4a001  ! 2216: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e42013  ! 2219: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e42083  ! 2221: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9540000  ! 2224: RDPR_GL	<illegal instruction>
	.word 0xb5e5e0b9  ! 2228: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4e1e6  ! 2229: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbac4e174  ! 2232: ADDCcc_I	addccc 	%r19, 0x0174, %r29
	setx	0x2000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9500000  ! 2252: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	.word 0xb1e42012  ! 2255: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb4a5e0d6  ! 2256: SUBcc_I	subcc 	%r23, 0x00d6, %r26
	.word 0x8194e07b  ! 2257: WRPR_TPC_I	wrpr	%r19, 0x007b, %tpc
	.word 0xb9e421b0  ! 2259: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe56019  ! 2260: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e460bb  ! 2264: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x919560ff  ! 2265: WRPR_PIL_I	wrpr	%r21, 0x00ff, %pil
	.word 0xb1e46065  ! 2267: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4617a  ! 2274: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e5a171  ! 2280: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe421b7  ! 2285: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb52d9000  ! 2287: SLLX_R	sllx	%r22, %r0, %r26
	.word 0x8195611a  ! 2288: WRPR_TPC_I	wrpr	%r21, 0x011a, %tpc
	.word 0xbbe56097  ! 2293: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb4b4c000  ! 2295: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xbf51c000  ! 2296: RDPR_TL	<illegal instruction>
	.word 0xb6bcc000  ! 2297: XNORcc_R	xnorcc 	%r19, %r0, %r27
	setx	0x1020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9561e4  ! 2300: WRPR_PSTATE_I	wrpr	%r21, 0x01e4, %pstate
	.word 0xbde461cc  ! 2313: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_3, %g1, %r19
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5605b  ! 2321: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8794a186  ! 2322: WRPR_TT_I	wrpr	%r18, 0x0186, %tt
	.word 0xb551c000  ! 2323: RDPR_TL	<illegal instruction>
	.word 0xb08da183  ! 2326: ANDcc_I	andcc 	%r22, 0x0183, %r24
	.word 0xb8240000  ! 2327: SUB_R	sub 	%r16, %r0, %r28
	.word 0xb2840000  ! 2330: ADDcc_R	addcc 	%r16, %r0, %r25
	.word 0xbbe421fa  ! 2334: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b81  ! 2335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b81, %hpstate
	.word 0xb7508000  ! 2336: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4a0f3  ! 2338: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e4e136  ! 2339: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4e188  ! 2340: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5a004  ! 2345: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb8142111  ! 2346: OR_I	or 	%r16, 0x0111, %r28
	.word 0xb1e4e1bf  ! 2349: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xba8c61c0  ! 2350: ANDcc_I	andcc 	%r17, 0x01c0, %r29
	.word 0xb7e4e074  ! 2355: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe4e1be  ! 2358: SAVE_I	save	%r19, 0x0001, %r29
	mov	1, %r12
	.word 0x8f932000  ! 2359: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e4610b  ! 2361: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x839420c7  ! 2364: WRPR_TNPC_I	wrpr	%r16, 0x00c7, %tnpc
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 2370: RDPR_TICK	<illegal instruction>
	.word 0xbfe42132  ! 2371: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb225c000  ! 2372: SUB_R	sub 	%r23, %r0, %r25
	.word 0xb6346022  ! 2374: SUBC_I	orn 	%r17, 0x0022, %r27
	setx	0x230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1ed  ! 2380: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a124  ! 2383: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4212d  ! 2387: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8d9561eb  ! 2388: WRPR_PSTATE_I	wrpr	%r21, 0x01eb, %pstate
	.word 0xb9e461af  ! 2390: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde461b9  ! 2392: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5a047  ! 2393: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5a029  ! 2395: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e5a1e2  ! 2396: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4619a  ! 2400: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe56059  ! 2401: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e52150  ! 2404: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e520b0  ! 2405: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb09de073  ! 2409: XORcc_I	xorcc 	%r23, 0x0073, %r24
	.word 0xb80c2075  ! 2411: AND_I	and 	%r16, 0x0075, %r28
	.word 0xb5e4a1d2  ! 2419: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xba9de0f8  ! 2420: XORcc_I	xorcc 	%r23, 0x00f8, %r29
	.word 0xbfe561a4  ! 2423: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbea50000  ! 2425: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0x8594611c  ! 2426: WRPR_TSTATE_I	wrpr	%r17, 0x011c, %tstate
	.word 0xb1510000  ! 2427: RDPR_TICK	<illegal instruction>
	.word 0xbde5a13f  ! 2431: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xba9c0000  ! 2433: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xb1e46179  ! 2434: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983d09  ! 2436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d09, %hpstate
	.word 0xb7e52113  ! 2437: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde5a198  ! 2438: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_3, %g1, %r23
	.word 0xb3e5e026  ! 2440: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde52048  ! 2446: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_2, %g1, %r18
	.word 0xb3e46081  ! 2454: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb8ace07c  ! 2455: ANDNcc_I	andncc 	%r19, 0x007c, %r28
	.word 0x9195e0a6  ! 2456: WRPR_PIL_I	wrpr	%r23, 0x00a6, %pil
	.word 0xb1e5a17f  ! 2457: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9480000  ! 2460: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x3020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1f6  ! 2468: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e5e1fe  ! 2471: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde4a0af  ! 2473: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb6c4e1e4  ! 2476: ADDCcc_I	addccc 	%r19, 0x01e4, %r27
	.word 0xb8b48000  ! 2479: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xbde520a1  ! 2482: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbd500000  ! 2485: RDPR_TPC	<illegal instruction>
	.word 0x87942080  ! 2487: WRPR_TT_I	wrpr	%r16, 0x0080, %tt
	.word 0xb551c000  ! 2488: RDPR_TL	<illegal instruction>
	setx	0x10c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 2491: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 2493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xb9e521c6  ! 2495: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e46197  ! 2496: SAVE_I	save	%r17, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 2499: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982d59  ! 2501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	.word 0xb5e5a1d5  ! 2511: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8794206f  ! 2515: WRPR_TT_I	wrpr	%r16, 0x006f, %tt
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a119  ! 2517: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8d942174  ! 2519: WRPR_PSTATE_I	wrpr	%r16, 0x0174, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 2525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xbfe5e1f5  ! 2527: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe46075  ! 2529: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb2a44000  ! 2530: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xb9e4a035  ! 2531: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x879420da  ! 2533: WRPR_TT_I	wrpr	%r16, 0x00da, %tt
	setx	0x2031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 2536: RDPR_TL	<illegal instruction>
	.word 0x8595e08e  ! 2538: WRPR_TSTATE_I	wrpr	%r23, 0x008e, %tstate
	.word 0xb9e42000  ! 2539: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3480000  ! 2541: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x859520cc  ! 2547: WRPR_TSTATE_I	wrpr	%r20, 0x00cc, %tstate
	.word 0xb3e4a011  ! 2548: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe42184  ! 2549: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe5e176  ! 2553: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e5e035  ! 2556: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e56062  ! 2557: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e46165  ! 2559: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde5e0c4  ! 2560: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde561ad  ! 2562: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4e078  ! 2564: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5206c  ! 2565: SAVE_I	save	%r20, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 2567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	.word 0x8794219b  ! 2569: WRPR_TT_I	wrpr	%r16, 0x019b, %tt
	.word 0xbfe4615f  ! 2570: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb8054000  ! 2574: ADD_R	add 	%r21, %r0, %r28
	.word 0xb1e461de  ! 2575: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a005  ! 2582: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbd540000  ! 2583: RDPR_GL	<illegal instruction>
	.word 0xb53d9000  ! 2584: SRAX_R	srax	%r22, %r0, %r26
	.word 0xb5520000  ! 2585: RDPR_PIL	<illegal instruction>
	.word 0xb9e4204d  ! 2586: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7643801  ! 2588: MOVcc_I	<illegal instruction>
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e060  ! 2592: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x9195e0b2  ! 2594: WRPR_PIL_I	wrpr	%r23, 0x00b2, %pil
	.word 0xb150c000  ! 2596: RDPR_TT	<illegal instruction>
	.word 0xb7e5e0f4  ! 2597: SAVE_I	save	%r23, 0x0001, %r27
	mov	2, %r14
	.word 0xa193a000  ! 2600: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_7, %g1, %r19
	.word 0xb1504000  ! 2605: RDPR_TNPC	<illegal instruction>
	.word 0xb235e1cb  ! 2606: SUBC_I	orn 	%r23, 0x01cb, %r25
	.word 0xbc1520d8  ! 2608: OR_I	or 	%r20, 0x00d8, %r30
	.word 0xb3e5e174  ! 2610: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb508000  ! 2613: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5a123  ! 2615: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4a19f  ! 2618: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde421f2  ! 2622: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 2626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	.word 0x8594613e  ! 2628: WRPR_TSTATE_I	wrpr	%r17, 0x013e, %tstate
	.word 0xbd518000  ! 2630: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4e13f  ! 2631: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4a19e  ! 2632: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4a114  ! 2634: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7540000  ! 2637: RDPR_GL	<illegal instruction>
	.word 0xbbe5e0df  ! 2638: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e560a3  ! 2650: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb150c000  ! 2651: RDPR_TT	<illegal instruction>
	.word 0xb1e56146  ! 2663: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e520b2  ! 2667: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5216a  ! 2678: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbf508000  ! 2680: RDPR_TSTATE	<illegal instruction>
	.word 0xbde42060  ! 2681: SAVE_I	save	%r16, 0x0001, %r30
	setx	data_start_6, %g1, %r22
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a14d  ! 2689: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e520f5  ! 2694: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e130  ! 2701: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e5e0fe  ! 2704: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb09d0000  ! 2706: XORcc_R	xorcc 	%r20, %r0, %r24
	.word 0xb9e46027  ! 2707: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde4a0b7  ! 2710: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e4e1e6  ! 2711: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb950c000  ! 2713: RDPR_TT	<illegal instruction>
	.word 0xb3e4a0a9  ! 2715: SAVE_I	save	%r18, 0x0001, %r25
	mov	1, %r14
	.word 0xa193a000  ! 2716: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf540000  ! 2725: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 2726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 2728: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8994609a  ! 2732: WRPR_TICK_I	wrpr	%r17, 0x009a, %tick
	.word 0x8595618b  ! 2734: WRPR_TSTATE_I	wrpr	%r21, 0x018b, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983cdb  ! 2736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cdb, %hpstate
	.word 0xb5e4a0dd  ! 2737: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e46181  ! 2740: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb6b5c000  ! 2742: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xb5508000  ! 2743: RDPR_TSTATE	<illegal instruction>
	.word 0xb69ce1a3  ! 2745: XORcc_I	xorcc 	%r19, 0x01a3, %r27
	.word 0xb1e421ad  ! 2746: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e46019  ! 2749: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf508000  ! 2751: RDPR_TSTATE	<illegal instruction>
	.word 0xbde5a038  ! 2753: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb4b520e8  ! 2754: SUBCcc_I	orncc 	%r20, 0x00e8, %r26
	.word 0x9194a10b  ! 2756: WRPR_PIL_I	wrpr	%r18, 0x010b, %pil
	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e01  ! 2763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e01, %hpstate
	.word 0x9195a023  ! 2767: WRPR_PIL_I	wrpr	%r22, 0x0023, %pil
	.word 0xb9e521d3  ! 2768: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e56083  ! 2770: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8594a1db  ! 2773: WRPR_TSTATE_I	wrpr	%r18, 0x01db, %tstate
	.word 0xb1504000  ! 2776: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5a069  ! 2779: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e42167  ! 2785: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe5e05d  ! 2787: SAVE_I	save	%r23, 0x0001, %r31
	mov	2, %r12
	.word 0x8f932000  ! 2789: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e460c2  ! 2791: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb48c201f  ! 2794: ANDcc_I	andcc 	%r16, 0x001f, %r26
	.word 0xb1e4e081  ! 2797: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4a075  ! 2798: SAVE_I	save	%r18, 0x0001, %r31
	setx	data_start_5, %g1, %r18
	.word 0xbfe4e1c0  ! 2806: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_7, %g1, %r18
	.word 0xb7e4600e  ! 2809: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d94a1a4  ! 2813: WRPR_PSTATE_I	wrpr	%r18, 0x01a4, %pstate
	.word 0x81946088  ! 2816: WRPR_TPC_I	wrpr	%r17, 0x0088, %tpc
	.word 0xb0c58000  ! 2818: ADDCcc_R	addccc 	%r22, %r0, %r24
	setx	data_start_7, %g1, %r19
	.word 0xbfe5e158  ! 2825: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e521c7  ! 2827: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbb510000  ! 2828: RDPR_TICK	<illegal instruction>
	.word 0xb3500000  ! 2829: RDPR_TPC	<illegal instruction>
	setx	0x30209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e42112  ! 2835: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e178  ! 2842: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e4a0e9  ! 2851: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd51c000  ! 2856: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e420ca  ! 2864: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb0346066  ! 2865: ORN_I	orn 	%r17, 0x0066, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983843  ! 2868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1843, %hpstate
	.word 0xb1e42113  ! 2871: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb0bc0000  ! 2872: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xb9e4e170  ! 2873: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1641800  ! 2876: MOVcc_R	<illegal instruction>
	.word 0xbbe4a1f6  ! 2882: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x85942013  ! 2884: WRPR_TSTATE_I	wrpr	%r16, 0x0013, %tstate
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e56060  ! 2893: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e5608b  ! 2894: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5504000  ! 2895: RDPR_TNPC	<illegal instruction>
	.word 0xbde5600f  ! 2897: SAVE_I	save	%r21, 0x0001, %r30
	mov	2, %r14
	.word 0xa193a000  ! 2899: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf518000  ! 2900: RDPR_PSTATE	<illegal instruction>
	.word 0xb5500000  ! 2901: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r17
	.word 0xb5508000  ! 2903: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e42163  ! 2904: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5613a  ! 2906: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb48c4000  ! 2913: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xb1e4a083  ! 2915: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4a0d4  ! 2917: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8595e181  ! 2918: WRPR_TSTATE_I	wrpr	%r23, 0x0181, %tstate
	.word 0xbd508000  ! 2919: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e4a0ea  ! 2922: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e52006  ! 2923: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb2c4a0b7  ! 2924: ADDCcc_I	addccc 	%r18, 0x00b7, %r25
	.word 0xb3e56135  ! 2925: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3520000  ! 2926: RDPR_PIL	<illegal instruction>
	.word 0xb7e5a1eb  ! 2927: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe5e0fb  ! 2930: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb2152141  ! 2932: OR_I	or 	%r20, 0x0141, %r25
	.word 0xb9e42042  ! 2933: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e42161  ! 2935: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8d942131  ! 2936: WRPR_PSTATE_I	wrpr	%r16, 0x0131, %pstate
	.word 0x859520bb  ! 2937: WRPR_TSTATE_I	wrpr	%r20, 0x00bb, %tstate
	.word 0xbde4e179  ! 2939: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbb540000  ! 2940: RDPR_GL	<illegal instruction>
	.word 0xbfe52096  ! 2942: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e461ac  ! 2943: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_0, %g1, %r19
	.word 0xb9e460fb  ! 2945: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3510000  ! 2946: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2947: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3520000  ! 2948: RDPR_PIL	<illegal instruction>
	.word 0xb695c000  ! 2949: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xb5e5a015  ! 2952: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x2000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 2957: RDPR_TL	<illegal instruction>
	.word 0x8595e09b  ! 2959: WRPR_TSTATE_I	wrpr	%r23, 0x009b, %tstate
	.word 0x8994e0fe  ! 2964: WRPR_TICK_I	wrpr	%r19, 0x00fe, %tick
	.word 0xb9e5a19f  ! 2967: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7500000  ! 2969: RDPR_TPC	<illegal instruction>
	.word 0xb68c61aa  ! 2970: ANDcc_I	andcc 	%r17, 0x01aa, %r27
	.word 0xbbe46000  ! 2971: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbcbce127  ! 2975: XNORcc_I	xnorcc 	%r19, 0x0127, %r30
	.word 0xb3e5212f  ! 2976: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8595a05d  ! 2977: WRPR_TSTATE_I	wrpr	%r22, 0x005d, %tstate
	.word 0xb7e5a056  ! 2982: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbf510000  ! 2984: RDPR_TICK	<illegal instruction>
	.word 0xb750c000  ! 2986: RDPR_TT	<illegal instruction>
	.word 0xb5e4e0d5  ! 2989: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb33cd000  ! 2992: SRAX_R	srax	%r19, %r0, %r25
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 2994: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4e0bb  ! 2995: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb4bdc000  ! 2998: XNORcc_R	xnorcc 	%r23, %r0, %r26
	setx	0x10239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e160  ! 3004: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8994a087  ! 3006: WRPR_TICK_I	wrpr	%r18, 0x0087, %tick
	.word 0xb1e46197  ! 3010: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbd518000  ! 3013: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5201d  ! 3015: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbf2ce001  ! 3016: SLL_I	sll 	%r19, 0x0001, %r31
	.word 0xbde5e1bc  ! 3017: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbb50c000  ! 3019: RDPR_TT	<illegal instruction>
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819420ac  ! 3021: WRPR_TPC_I	wrpr	%r16, 0x00ac, %tpc
	.word 0xbfe5e1d4  ! 3024: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982a53  ! 3032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a53, %hpstate
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb89c0000  ! 3034: XORcc_R	xorcc 	%r16, %r0, %r28
	.word 0xb6c48000  ! 3035: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xbde421c7  ! 3036: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e52022  ! 3039: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe42134  ! 3052: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x30105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 3054: RDPR_PSTATE	<illegal instruction>
	.word 0x8394e095  ! 3059: WRPR_TNPC_I	wrpr	%r19, 0x0095, %tnpc
	.word 0xb751c000  ! 3060: RDPR_TL	<illegal instruction>
	.word 0xb9e56169  ! 3061: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e561d5  ! 3062: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e5201f  ! 3064: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e56098  ! 3066: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5a19e  ! 3067: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x859460f9  ! 3070: WRPR_TSTATE_I	wrpr	%r17, 0x00f9, %tstate
	.word 0xbfe4216e  ! 3071: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb520000  ! 3073: RDPR_PIL	<illegal instruction>
	.word 0xb3e4a01a  ! 3074: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5520000  ! 3077: RDPR_PIL	<illegal instruction>
	.word 0xb5e5a0ce  ! 3078: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3520000  ! 3081: RDPR_PIL	<illegal instruction>
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 3089: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4a1b7  ! 3091: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e42057  ! 3093: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb69521d5  ! 3096: ORcc_I	orcc 	%r20, 0x01d5, %r27
	.word 0x87952132  ! 3097: WRPR_TT_I	wrpr	%r20, 0x0132, %tt
	.word 0xb5520000  ! 3099: RDPR_PIL	<illegal instruction>
	.word 0xb7e460a5  ! 3100: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a081  ! 3102: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb295e1d5  ! 3103: ORcc_I	orcc 	%r23, 0x01d5, %r25
	setx	0x30307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde560ca  ! 3108: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 3109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb40c6097  ! 3113: AND_I	and 	%r17, 0x0097, %r26
	.word 0xb951c000  ! 3116: RDPR_TL	<illegal instruction>
	setx	data_start_0, %g1, %r16
	setx	0x30205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 3126: RDPR_TPC	<illegal instruction>
	.word 0xb3e5a107  ! 3137: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4e0d5  ! 3138: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x9195a0f6  ! 3139: WRPR_PIL_I	wrpr	%r22, 0x00f6, %pil
	setx	0x3011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe561eb  ! 3145: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e5e194  ! 3149: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e4e150  ! 3151: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8594e1a0  ! 3152: WRPR_TSTATE_I	wrpr	%r19, 0x01a0, %tstate
	.word 0xbbe420e2  ! 3157: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe5a05a  ! 3161: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3520000  ! 3163: RDPR_PIL	<illegal instruction>
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 3173: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4615d  ! 3176: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e5e14d  ! 3183: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983dd9  ! 3185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd9, %hpstate
	.word 0xb3e4e1c4  ! 3188: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e4e058  ! 3189: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbc8da0c8  ! 3190: ANDcc_I	andcc 	%r22, 0x00c8, %r30
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0b6  ! 3194: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4a0a3  ! 3196: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819838c3  ! 3202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c3, %hpstate
	.word 0xbbe4a0c8  ! 3206: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde46104  ! 3207: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5a16e  ! 3210: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe421e9  ! 3212: SAVE_I	save	%r16, 0x0001, %r29
	mov	1, %r14
	.word 0xa193a000  ! 3213: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7346001  ! 3218: SRL_I	srl 	%r17, 0x0001, %r27
	.word 0x8195e13e  ! 3219: WRPR_TPC_I	wrpr	%r23, 0x013e, %tpc
	.word 0xb9e4e140  ! 3222: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83946090  ! 3226: WRPR_TNPC_I	wrpr	%r17, 0x0090, %tnpc
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819838db  ! 3230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18db, %hpstate
	.word 0xb20dc000  ! 3234: AND_R	and 	%r23, %r0, %r25
	.word 0xbde42019  ! 3239: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5203f  ! 3243: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d94e186  ! 3245: WRPR_PSTATE_I	wrpr	%r19, 0x0186, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 3246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	.word 0xb9e4a02d  ! 3252: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5a0db  ! 3253: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbe858000  ! 3259: ADDcc_R	addcc 	%r22, %r0, %r31
	.word 0xbd540000  ! 3263: RDPR_GL	<illegal instruction>
	.word 0xb1e5a041  ! 3264: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb17d0400  ! 3268: MOVR_R	movre	%r20, %r0, %r24
	.word 0xbd51c000  ! 3273: RDPR_TL	<illegal instruction>
	.word 0xbd520000  ! 3274: RDPR_PIL	<illegal instruction>
	.word 0xbde5a1d5  ! 3276: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbc348000  ! 3281: ORN_R	orn 	%r18, %r0, %r30
	.word 0xbb51c000  ! 3282: RDPR_TL	<illegal instruction>
	setx	0x10128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbce1d5  ! 3291: XNORcc_I	xnorcc 	%r19, 0x01d5, %r30
	.word 0x8594602b  ! 3293: WRPR_TSTATE_I	wrpr	%r17, 0x002b, %tstate
	.word 0xb934a001  ! 3294: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xb8854000  ! 3295: ADDcc_R	addcc 	%r21, %r0, %r28
	.word 0xb1e5e18b  ! 3296: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb6b521c8  ! 3300: ORNcc_I	orncc 	%r20, 0x01c8, %r27
	.word 0xbde52139  ! 3301: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8795208a  ! 3302: WRPR_TT_I	wrpr	%r20, 0x008a, %tt
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 3306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xb1e4e0e1  ! 3307: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe421fb  ! 3309: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e561ff  ! 3310: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e4a098  ! 3311: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e5a1e2  ! 3312: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbaa4a070  ! 3315: SUBcc_I	subcc 	%r18, 0x0070, %r29
	.word 0xb5643801  ! 3317: MOVcc_I	<illegal instruction>
	.word 0xbde4a1a3  ! 3319: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbeadc000  ! 3324: ANDNcc_R	andncc 	%r23, %r0, %r31
	.word 0xbcb4c000  ! 3326: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0x8395e094  ! 3327: WRPR_TNPC_I	wrpr	%r23, 0x0094, %tnpc
	.word 0xb1e560f1  ! 3331: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe5a156  ! 3335: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9504000  ! 3336: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r21
	.word 0xbd504000  ! 3338: RDPR_TNPC	<illegal instruction>
	.word 0x8d95a05d  ! 3343: WRPR_PSTATE_I	wrpr	%r22, 0x005d, %pstate
	.word 0xb73cf001  ! 3346: SRAX_I	srax	%r19, 0x0001, %r27
	.word 0xbfe4e07e  ! 3348: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb2d8000  ! 3349: SLL_R	sll 	%r22, %r0, %r29
	.word 0x8d95e1c3  ! 3353: WRPR_PSTATE_I	wrpr	%r23, 0x01c3, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5607d  ! 3356: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbc24c000  ! 3357: SUB_R	sub 	%r19, %r0, %r30
	.word 0xb5e461a3  ! 3359: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf510000  ! 3360: RDPR_TICK	<illegal instruction>
	.word 0xb5e560e7  ! 3363: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 3367: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbbe4a176  ! 3368: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe52190  ! 3372: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e059  ! 3376: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4e1da  ! 3377: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a075  ! 3386: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0e7  ! 3388: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e521a8  ! 3389: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xba258000  ! 3393: SUB_R	sub 	%r22, %r0, %r29
	setx	0x2023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e17a  ! 3395: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e083  ! 3400: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_0, %g1, %r22
	.word 0x8594e0c3  ! 3404: WRPR_TSTATE_I	wrpr	%r19, 0x00c3, %tstate
	.word 0xbfe4e113  ! 3406: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4a082  ! 3408: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4e066  ! 3409: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e4a1d6  ! 3413: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5a1c9  ! 3417: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb83c619b  ! 3418: XNOR_I	xnor 	%r17, 0x019b, %r28
	.word 0xbfe5e00e  ! 3421: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e081  ! 3424: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e4a1b7  ! 3425: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbd500000  ! 3426: RDPR_TPC	<illegal instruction>
	.word 0xb9e4a07f  ! 3428: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8d9560c6  ! 3429: WRPR_PSTATE_I	wrpr	%r21, 0x00c6, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 3433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	.word 0x8795e1e7  ! 3435: WRPR_TT_I	wrpr	%r23, 0x01e7, %tt
	.word 0xb3e52191  ! 3438: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbd51c000  ! 3439: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983cd1  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd1, %hpstate
	.word 0xb7e4a0b4  ! 3442: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5e082  ! 3447: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbe8ce070  ! 3456: ANDcc_I	andcc 	%r19, 0x0070, %r31
	.word 0xb9e5e1bb  ! 3457: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e4a02b  ! 3464: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb6354000  ! 3466: ORN_R	orn 	%r21, %r0, %r27
	.word 0x8394a185  ! 3472: WRPR_TNPC_I	wrpr	%r18, 0x0185, %tnpc
	.word 0xbbe4219e  ! 3475: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4204c  ! 3478: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e56129  ! 3480: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983c43  ! 3484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c43, %hpstate
	.word 0xb1e5213c  ! 3485: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983d19  ! 3486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d19, %hpstate
	.word 0xbc058000  ! 3487: ADD_R	add 	%r22, %r0, %r30
	.word 0x81942051  ! 3488: WRPR_TPC_I	wrpr	%r16, 0x0051, %tpc
	.word 0x8594e1c2  ! 3490: WRPR_TSTATE_I	wrpr	%r19, 0x01c2, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb150c000  ! 3494: RDPR_TT	<illegal instruction>
	.word 0xb1e4e08e  ! 3495: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb504000  ! 3496: RDPR_TNPC	<illegal instruction>
	.word 0xbde5e061  ! 3497: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982a01  ! 3499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a01, %hpstate
	.word 0xb5e4a060  ! 3500: SAVE_I	save	%r18, 0x0001, %r26
	mov	2, %r14
	.word 0xa193a000  ! 3501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e421d4  ! 3503: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf504000  ! 3504: RDPR_TNPC	<illegal instruction>
	.word 0xbbe42103  ! 3505: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbb500000  ! 3506: RDPR_TPC	<illegal instruction>
	.word 0xbde5e1b7  ! 3508: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e5a1c0  ! 3510: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b5b  ! 3514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5b, %hpstate
	.word 0xb3e4e113  ! 3515: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4e027  ! 3518: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb32dc000  ! 3521: SLL_R	sll 	%r23, %r0, %r25
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e52063  ! 3524: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbeb52196  ! 3526: SUBCcc_I	orncc 	%r20, 0x0196, %r31
	mov	2, %r14
	.word 0xa193a000  ! 3528: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe560e0  ! 3530: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5510000  ! 3534: RDPR_TICK	<illegal instruction>
	.word 0xb884c000  ! 3535: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xb9e4e139  ! 3538: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe4a00d  ! 3539: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5e053  ! 3540: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8d95a1a0  ! 3543: WRPR_PSTATE_I	wrpr	%r22, 0x01a0, %pstate
	.word 0x8795a0a0  ! 3548: WRPR_TT_I	wrpr	%r22, 0x00a0, %tt
	.word 0xbde4a040  ! 3554: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde42011  ! 3571: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 3578: RDPR_TPC	<illegal instruction>
	.word 0xbfe461bb  ! 3579: SAVE_I	save	%r17, 0x0001, %r31
	setx	data_start_1, %g1, %r16
	.word 0x899560da  ! 3581: WRPR_TICK_I	wrpr	%r21, 0x00da, %tick
	.word 0xbc9d8000  ! 3582: XORcc_R	xorcc 	%r22, %r0, %r30
	.word 0xbb35c000  ! 3586: SRL_R	srl 	%r23, %r0, %r29
	setx	data_start_6, %g1, %r22
	.word 0xb3e460e9  ! 3588: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e5608f  ! 3590: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb68c8000  ! 3594: ANDcc_R	andcc 	%r18, %r0, %r27
	.word 0xb3e4e0b3  ! 3595: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e52090  ! 3596: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb73cc000  ! 3599: SRA_R	sra 	%r19, %r0, %r27
	.word 0xb6b4c000  ! 3607: SUBCcc_R	orncc 	%r19, %r0, %r27
	.word 0xba3d4000  ! 3611: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xbfe561be  ! 3612: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5520000  ! 3613: RDPR_PIL	<illegal instruction>
	.word 0x8394e0d5  ! 3614: WRPR_TNPC_I	wrpr	%r19, 0x00d5, %tnpc
	.word 0xb751c000  ! 3615: RDPR_TL	<illegal instruction>
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88ce1e3  ! 3618: ANDcc_I	andcc 	%r19, 0x01e3, %r28
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xbfe4e110  ! 3624: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe42122  ! 3626: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4a02d  ! 3628: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xba44c000  ! 3631: ADDC_R	addc 	%r19, %r0, %r29
	.word 0xbfe52129  ! 3635: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe4e1d0  ! 3639: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb750c000  ! 3645: RDPR_TT	<illegal instruction>
	.word 0xb0348000  ! 3648: SUBC_R	orn 	%r18, %r0, %r24
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 3653: RDPR_TICK	<illegal instruction>
	.word 0xbfe4a127  ! 3655: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8794a112  ! 3657: WRPR_TT_I	wrpr	%r18, 0x0112, %tt
	.word 0xbbe5a18b  ! 3659: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e52135  ! 3661: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5a1ff  ! 3662: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a026  ! 3667: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe461f4  ! 3670: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1480000  ! 3671: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0b1  ! 3673: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe56034  ! 3674: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a0b  ! 3681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0b, %hpstate
	.word 0xb6b58000  ! 3683: ORNcc_R	orncc 	%r22, %r0, %r27
	.word 0xb9e4e045  ! 3684: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e460e9  ! 3685: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	.word 0xb3e5a000  ! 3690: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb520000  ! 3693: RDPR_PIL	<illegal instruction>
	.word 0xbb540000  ! 3697: RDPR_GL	<illegal instruction>
	.word 0xbfe561a4  ! 3698: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_0, %g1, %r20
	.word 0xbd540000  ! 3701: RDPR_GL	<illegal instruction>
	.word 0xb7e56010  ! 3703: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e52143  ! 3706: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e00f  ! 3714: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5e18c  ! 3723: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb92ce001  ! 3726: SLL_I	sll 	%r19, 0x0001, %r28
	.word 0xb1e5617b  ! 3727: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb4b54000  ! 3728: SUBCcc_R	orncc 	%r21, %r0, %r26
	mov	2, %r14
	.word 0xa193a000  ! 3730: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a1fc  ! 3736: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 3740: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbfe5e095  ! 3742: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e42018  ! 3746: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbc2d20e0  ! 3747: ANDN_I	andn 	%r20, 0x00e0, %r30
	.word 0xbde461bd  ! 3749: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb540000  ! 3757: RDPR_GL	<illegal instruction>
	.word 0xbbe4a1f6  ! 3758: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5a041  ! 3760: SAVE_I	save	%r22, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 3768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe0d0000  ! 3771: AND_R	and 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe56179  ! 3776: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4e0d4  ! 3777: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe4206a  ! 3778: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe5a0fc  ! 3779: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb33c8000  ! 3781: SRA_R	sra 	%r18, %r0, %r25
	.word 0xbde4a17b  ! 3782: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9508000  ! 3789: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe5607c  ! 3791: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e52075  ! 3793: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5614d  ! 3796: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbc04e04b  ! 3799: ADD_I	add 	%r19, 0x004b, %r30
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e0d8  ! 3804: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 3807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	.word 0xb7e5a13e  ! 3810: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 3814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xbde560c2  ! 3815: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe4a0fc  ! 3820: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983dd9  ! 3821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd9, %hpstate
	.word 0xb9e4a17d  ! 3825: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a0e9  ! 3829: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e52071  ! 3833: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e4a1ec  ! 3834: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e520bd  ! 3839: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8994e0b4  ! 3841: WRPR_TICK_I	wrpr	%r19, 0x00b4, %tick
	.word 0x8394210a  ! 3843: WRPR_TNPC_I	wrpr	%r16, 0x010a, %tnpc
	.word 0xb1e5a1b3  ! 3845: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4e15e  ! 3847: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5e0c5  ! 3849: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5e12c  ! 3850: SAVE_I	save	%r23, 0x0001, %r27
	setx	data_start_0, %g1, %r20
	.word 0xbde4a08b  ! 3854: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e460ff  ! 3855: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf508000  ! 3858: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198388b  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188b, %hpstate
	.word 0xb5e46107  ! 3870: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5a091  ! 3875: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5a02e  ! 3876: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5a091  ! 3877: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e561d3  ! 3880: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4e108  ! 3881: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e52194  ! 3882: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5e028  ! 3887: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e56167  ! 3893: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e5604e  ! 3896: SAVE_I	save	%r21, 0x0001, %r26
	mov	2, %r12
	.word 0x8f932000  ! 3897: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e42054  ! 3898: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5e076  ! 3901: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e46037  ! 3911: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a118  ! 3916: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5e066  ! 3917: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde46128  ! 3919: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5e1d6  ! 3921: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1508000  ! 3924: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4a0c2  ! 3925: SAVE_I	save	%r18, 0x0001, %r26
	mov	1, %r12
	.word 0x8f932000  ! 3926: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb6ac204d  ! 3928: ANDNcc_I	andncc 	%r16, 0x004d, %r27
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0a4  ! 3935: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982acb  ! 3936: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acb, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 3941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb508000  ! 3942: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e4e034  ! 3944: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e561f8  ! 3946: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a08a  ! 3949: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e4214b  ! 3950: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbb520000  ! 3951: RDPR_PIL	<illegal instruction>
	.word 0xb7e4e1a8  ! 3952: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e521f1  ! 3953: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe56178  ! 3959: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5200d  ! 3960: SAVE_I	save	%r20, 0x0001, %r29
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 3964: RDPR_TT	<illegal instruction>
	.word 0xbde5a0dd  ! 3965: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3972: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb0b461e0  ! 3973: SUBCcc_I	orncc 	%r17, 0x01e0, %r24
	.word 0xb1e420e6  ! 3975: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	mov	2, %r14
	.word 0xa193a000  ! 3983: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e4e168  ! 3984: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5e1f1  ! 3985: SAVE_I	save	%r23, 0x0001, %r26
	setx	data_start_0, %g1, %r16
	.word 0xbbe460b9  ! 3987: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0c7  ! 3994: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe42084  ! 3995: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e5e011  ! 3998: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x89952146  ! 3999: WRPR_TICK_I	wrpr	%r20, 0x0146, %tick
	.word 0xbbe4e04d  ! 4001: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb935e001  ! 4002: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0xb5e5a0aa  ! 4004: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e52100  ! 4009: SAVE_I	save	%r20, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 4010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 4011: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe5a043  ! 4014: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e56126  ! 4015: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8794a0d3  ! 4017: WRPR_TT_I	wrpr	%r18, 0x00d3, %tt
	.word 0xb3e5a115  ! 4019: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe46026  ! 4024: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5e0dc  ! 4025: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe4202c  ! 4028: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 4033: RDPR_TT	<illegal instruction>
	.word 0xb3e4a170  ! 4034: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb92d5000  ! 4038: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xb3e56132  ! 4039: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8995a0d8  ! 4041: WRPR_TICK_I	wrpr	%r22, 0x00d8, %tick
	.word 0xbfe4a0f6  ! 4049: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd51c000  ! 4050: RDPR_TL	<illegal instruction>
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb40ca0bb  ! 4053: AND_I	and 	%r18, 0x00bb, %r26
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e521fc  ! 4062: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4a03f  ! 4063: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde42116  ! 4066: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e4200e  ! 4067: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4e0a9  ! 4072: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb6a54000  ! 4074: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xbbe4e185  ! 4076: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5e137  ! 4077: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5518000  ! 4078: RDPR_PSTATE	<illegal instruction>
	.word 0xba2da1aa  ! 4079: ANDN_I	andn 	%r22, 0x01aa, %r29
	.word 0xbfe4a14c  ! 4080: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde521a2  ! 4088: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde5605e  ! 4093: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e5a16b  ! 4094: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e561e5  ! 4097: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb72d3001  ! 4099: SLLX_I	sllx	%r20, 0x0001, %r27
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0fa  ! 4106: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde4a1f1  ! 4109: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3508000  ! 4111: RDPR_TSTATE	<illegal instruction>
	.word 0xb8a42171  ! 4112: SUBcc_I	subcc 	%r16, 0x0171, %r28
	.word 0xb9e46095  ! 4113: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe56117  ! 4119: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e152  ! 4122: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe5a0f2  ! 4123: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb4956176  ! 4125: ORcc_I	orcc 	%r21, 0x0176, %r26
	setx	data_start_0, %g1, %r16
	.word 0xb5520000  ! 4135: RDPR_PIL	<illegal instruction>
	.word 0xb9e5601f  ! 4137: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e1b1  ! 4141: WRPR_PIL_I	wrpr	%r23, 0x01b1, %pil
	mov	0, %r12
	.word 0x8f932000  ! 4143: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e521d6  ! 4145: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb8bd8000  ! 4146: XNORcc_R	xnorcc 	%r22, %r0, %r28
	.word 0xbbe56072  ! 4147: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5e1ca  ! 4149: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5e07d  ! 4156: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe460fb  ! 4160: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe46189  ! 4161: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5500000  ! 4163: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r18
	.word 0xb3e5209e  ! 4166: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5480000  ! 4167: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8395618e  ! 4169: WRPR_TNPC_I	wrpr	%r21, 0x018e, %tnpc
	.word 0xb9e4e028  ! 4170: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5a1d3  ! 4171: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e56190  ! 4172: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e4e042  ! 4173: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbd35f001  ! 4174: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xbb510000  ! 4176: RDPR_TICK	<illegal instruction>
	.word 0xb37c6401  ! 4181: MOVR_I	movre	%r17, 0x1, %r25
	.word 0x8194e12a  ! 4183: WRPR_TPC_I	wrpr	%r19, 0x012a, %tpc
	.word 0xb1e5a11c  ! 4184: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbb3d8000  ! 4186: SRA_R	sra 	%r22, %r0, %r29
	.word 0x899421be  ! 4188: WRPR_TICK_I	wrpr	%r16, 0x01be, %tick
	setx	data_start_3, %g1, %r20
	.word 0xba0cc000  ! 4193: AND_R	and 	%r19, %r0, %r29
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a007  ! 4199: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe4e0b2  ! 4202: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe461f6  ! 4203: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e56164  ! 4204: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe421f3  ! 4207: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4a0ab  ! 4212: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x859521d6  ! 4220: WRPR_TSTATE_I	wrpr	%r20, 0x01d6, %tstate
	.word 0xb7e4a183  ! 4221: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbe856179  ! 4222: ADDcc_I	addcc 	%r21, 0x0179, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982f5b  ! 4223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	.word 0xb3e5210f  ! 4226: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x81956016  ! 4227: WRPR_TPC_I	wrpr	%r21, 0x0016, %tpc
	.word 0xbc1cc000  ! 4233: XOR_R	xor 	%r19, %r0, %r30
	.word 0xb48de1d3  ! 4235: ANDcc_I	andcc 	%r23, 0x01d3, %r26
	.word 0xb7500000  ! 4237: RDPR_TPC	<illegal instruction>
	.word 0x839521c1  ! 4238: WRPR_TNPC_I	wrpr	%r20, 0x01c1, %tnpc
	.word 0xbd50c000  ! 4239: RDPR_TT	<illegal instruction>
	.word 0xb9e5a0dd  ! 4241: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e4e1cc  ! 4242: SAVE_I	save	%r19, 0x0001, %r26
	mov	2, %r12
	.word 0x8f932000  ! 4243: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb0bc602a  ! 4250: XNORcc_I	xnorcc 	%r17, 0x002a, %r24
	.word 0xb8356068  ! 4257: SUBC_I	orn 	%r21, 0x0068, %r28
	.word 0x9195a01b  ! 4259: WRPR_PIL_I	wrpr	%r22, 0x001b, %pil
	.word 0xb1e5e104  ! 4260: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb62420be  ! 4263: SUB_I	sub 	%r16, 0x00be, %r27
	.word 0xb1e5a072  ! 4264: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e521ce  ! 4265: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb4858000  ! 4267: ADDcc_R	addcc 	%r22, %r0, %r26
	.word 0xbfe5e0f1  ! 4268: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0adc000  ! 4270: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0x8594e121  ! 4272: WRPR_TSTATE_I	wrpr	%r19, 0x0121, %tstate
	setx	0x2021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e12a  ! 4274: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e46135  ! 4278: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8795e152  ! 4279: WRPR_TT_I	wrpr	%r23, 0x0152, %tt
	.word 0x8595e19a  ! 4281: WRPR_TSTATE_I	wrpr	%r23, 0x019a, %tstate
	setx	0x20210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a120  ! 4290: SAVE_I	save	%r18, 0x0001, %r27
	setx	data_start_0, %g1, %r18
	.word 0xb7e4201b  ! 4293: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe4e1e8  ! 4297: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5e175  ! 4298: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe5e012  ! 4299: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e089  ! 4302: SAVE_I	save	%r23, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 4304: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a102  ! 4307: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe460a5  ! 4309: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e5e04e  ! 4314: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x87952031  ! 4317: WRPR_TT_I	wrpr	%r20, 0x0031, %tt
	.word 0xb9e4e14d  ! 4321: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982f99  ! 4327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0xb5e4e064  ! 4328: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb950c000  ! 4329: RDPR_TT	<illegal instruction>
	.word 0xb9e4e085  ! 4330: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe461d3  ! 4331: SAVE_I	save	%r17, 0x0001, %r31
	setx	0x20316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a11b  ! 4334: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8d95a149  ! 4342: WRPR_PSTATE_I	wrpr	%r22, 0x0149, %pstate
	.word 0xb9e4a1cc  ! 4343: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1480000  ! 4351: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195602c  ! 4363: WRPR_PIL_I	wrpr	%r21, 0x002c, %pil
	.word 0xbbe561f9  ! 4368: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983c13  ! 4369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c13, %hpstate
	.word 0xb3e5202d  ! 4370: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8394209a  ! 4371: WRPR_TNPC_I	wrpr	%r16, 0x009a, %tnpc
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195209c  ! 4378: WRPR_PIL_I	wrpr	%r20, 0x009c, %pil
	.word 0xb9e4a162  ! 4379: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9480000  ! 4381: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb150c000  ! 4382: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 4386: RDPR_TNPC	<illegal instruction>
	.word 0xbde5604e  ! 4389: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5e159  ! 4391: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e52051  ! 4394: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb951c000  ! 4398: RDPR_TL	<illegal instruction>
	.word 0xb7e4a0cc  ! 4400: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e42078  ! 4403: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9504000  ! 4408: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5e185  ! 4410: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e5a05a  ! 4412: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4a109  ! 4415: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb89d8000  ! 4416: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xb9e52074  ! 4420: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e561fb  ! 4421: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e4207a  ! 4422: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd51c000  ! 4423: RDPR_TL	<illegal instruction>
	setx	data_start_5, %g1, %r16
	.word 0xbfe4a0b8  ! 4432: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5510000  ! 4440: RDPR_TICK	<illegal instruction>
	.word 0xbfe5a0bf  ! 4441: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e5a037  ! 4442: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 4447: RDPR_GL	<illegal instruction>
	.word 0xb2056171  ! 4448: ADD_I	add 	%r21, 0x0171, %r25
	.word 0x899560b4  ! 4450: WRPR_TICK_I	wrpr	%r21, 0x00b4, %tick
	.word 0xb3e4a1ea  ! 4452: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4a10c  ! 4454: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbab48000  ! 4455: SUBCcc_R	orncc 	%r18, %r0, %r29
	.word 0xbd520000  ! 4456: RDPR_PIL	<illegal instruction>
	.word 0xbfe460d9  ! 4458: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x89956063  ! 4466: WRPR_TICK_I	wrpr	%r21, 0x0063, %tick
	.word 0xb4048000  ! 4470: ADD_R	add 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982c43  ! 4472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c43, %hpstate
	.word 0xbf2d0000  ! 4479: SLL_R	sll 	%r20, %r0, %r31
	.word 0xb7e42096  ! 4480: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5e17d  ! 4483: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4a18a  ! 4484: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8d946131  ! 4491: WRPR_PSTATE_I	wrpr	%r17, 0x0131, %pstate
	.word 0xb4c4a08c  ! 4492: ADDCcc_I	addccc 	%r18, 0x008c, %r26
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5215c  ! 4496: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2bd4000  ! 4500: XNORcc_R	xnorcc 	%r21, %r0, %r25
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 4505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	setx	0x1002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1e2  ! 4508: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983b41  ! 4511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b41, %hpstate
	.word 0xb9e5e0c9  ! 4522: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe561a7  ! 4524: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb0b4e183  ! 4526: ORNcc_I	orncc 	%r19, 0x0183, %r24
	.word 0xbbe5a16e  ! 4527: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e5a0a5  ! 4528: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xba15e082  ! 4530: OR_I	or 	%r23, 0x0082, %r29
	.word 0xba2c4000  ! 4534: ANDN_R	andn 	%r17, %r0, %r29
	.word 0xbfe42138  ! 4536: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5520000  ! 4540: RDPR_PIL	<illegal instruction>
	setx	data_start_7, %g1, %r19
	.word 0x83952085  ! 4546: WRPR_TNPC_I	wrpr	%r20, 0x0085, %tnpc
	.word 0xb9e5216c  ! 4548: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb8ad4000  ! 4549: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xb7500000  ! 4550: RDPR_TPC	<illegal instruction>
	.word 0xbfe5a01c  ! 4551: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e5e0eb  ! 4553: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	.word 0x919560f1  ! 4559: WRPR_PIL_I	wrpr	%r21, 0x00f1, %pil
	.word 0xb3e4a1e6  ! 4560: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e561f7  ! 4562: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4e036  ! 4563: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1520000  ! 4572: RDPR_PIL	<illegal instruction>
	.word 0xbeb54000  ! 4575: SUBCcc_R	orncc 	%r21, %r0, %r31
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e52119  ! 4581: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbf2cb001  ! 4582: SLLX_I	sllx	%r18, 0x0001, %r31
	.word 0xbde46046  ! 4585: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde52103  ! 4586: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde42097  ! 4588: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3500000  ! 4589: RDPR_TPC	<illegal instruction>
	.word 0xbde5e1e5  ! 4590: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe521b1  ! 4593: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe52084  ! 4595: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e46160  ! 4596: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbf510000  ! 4600: RDPR_TICK	<illegal instruction>
	.word 0xb3e4e05e  ! 4601: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbb480000  ! 4606: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e46158  ! 4612: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd7c0400  ! 4613: MOVR_R	movre	%r16, %r0, %r30
	.word 0xbfe5602e  ! 4617: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8394e1c8  ! 4618: WRPR_TNPC_I	wrpr	%r19, 0x01c8, %tnpc
	.word 0xb751c000  ! 4620: RDPR_TL	<illegal instruction>
	.word 0x91942080  ! 4623: WRPR_PIL_I	wrpr	%r16, 0x0080, %pil
	.word 0xb634e13e  ! 4625: ORN_I	orn 	%r19, 0x013e, %r27
	.word 0xb7540000  ! 4628: RDPR_GL	<illegal instruction>
	.word 0xb1e52017  ! 4629: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb72c8000  ! 4631: SLL_R	sll 	%r18, %r0, %r27
	.word 0xb7e461a4  ! 4632: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf35a001  ! 4638: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xb3e5a1fe  ! 4642: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e5e138  ! 4644: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e561e8  ! 4645: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e4a149  ! 4648: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3504000  ! 4650: RDPR_TNPC	<illegal instruction>
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 4657: MOVcc_I	<illegal instruction>
	setx	data_start_1, %g1, %r18
	.word 0xb9e5e198  ! 4662: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x2c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4665: RDPR_TT	<illegal instruction>
	.word 0xb3e560dd  ! 4667: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_7, %g1, %r20
	mov	2, %r12
	.word 0x8f932000  ! 4674: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2ada0a0  ! 4675: ANDNcc_I	andncc 	%r22, 0x00a0, %r25
	.word 0xb5e42051  ! 4676: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4219b  ! 4678: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e461be  ! 4679: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb22dc000  ! 4685: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xbfe5a01e  ! 4686: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4a0e0  ! 4688: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e42198  ! 4689: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb89461e7  ! 4691: ORcc_I	orcc 	%r17, 0x01e7, %r28
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e4e15d  ! 4696: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb550c000  ! 4697: RDPR_TT	<illegal instruction>
	.word 0xb3e4a1a9  ! 4698: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x30135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82d0000  ! 4707: ANDN_R	andn 	%r20, %r0, %r28
	.word 0xb3e4615b  ! 4709: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4a0f7  ! 4712: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 4713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	.word 0xb5e520e2  ! 4717: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe56194  ! 4722: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe42073  ! 4724: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8195e06b  ! 4726: WRPR_TPC_I	wrpr	%r23, 0x006b, %tpc
	.word 0xb3e4607e  ! 4727: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e5e027  ! 4728: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5a1cd  ! 4736: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983c1b  ! 4740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1b, %hpstate
	.word 0xb5e4e0f6  ! 4743: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e521fc  ! 4745: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5e073  ! 4746: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbc25e07a  ! 4747: SUB_I	sub 	%r23, 0x007a, %r30
	.word 0xb5e4e060  ! 4753: SAVE_I	save	%r19, 0x0001, %r26
	mov	1, %r12
	.word 0x8f932000  ! 4758: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e4e0e3  ! 4760: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0c4  ! 4764: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1510000  ! 4765: RDPR_TICK	<illegal instruction>
	.word 0xb1e4a099  ! 4767: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 4769: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5a1cb  ! 4770: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4e13b  ! 4771: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1508000  ! 4772: RDPR_TSTATE	<illegal instruction>
	.word 0x83956032  ! 4777: WRPR_TNPC_I	wrpr	%r21, 0x0032, %tnpc
	.word 0xb5e5e0f9  ! 4779: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e11a  ! 4785: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe561e2  ! 4795: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe4a0c7  ! 4798: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e5e190  ! 4803: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8595e011  ! 4809: WRPR_TSTATE_I	wrpr	%r23, 0x0011, %tstate
	.word 0xb1e42003  ! 4811: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x85946107  ! 4815: WRPR_TSTATE_I	wrpr	%r17, 0x0107, %tstate
	.word 0xb3e42017  ! 4817: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb4b44000  ! 4820: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xb5e560dd  ! 4821: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde4a044  ! 4824: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbaad8000  ! 4827: ANDNcc_R	andncc 	%r22, %r0, %r29
	.word 0xbde4a1ac  ! 4828: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x85942026  ! 4829: WRPR_TSTATE_I	wrpr	%r16, 0x0026, %tstate
	.word 0xbfe5a012  ! 4830: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4608f  ! 4837: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd643801  ! 4839: MOVcc_I	<illegal instruction>
	.word 0xbfe4a0d6  ! 4840: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e42054  ! 4842: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe52068  ! 4843: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e5a053  ! 4844: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x3023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe52112  ! 4852: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e4e04a  ! 4858: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe5e0cb  ! 4860: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5a1a3  ! 4863: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983c89  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c89, %hpstate
	.word 0xbe354000  ! 4866: ORN_R	orn 	%r21, %r0, %r31
	.word 0xb73d5000  ! 4867: SRAX_R	srax	%r21, %r0, %r27
	.word 0xb7508000  ! 4868: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e56162  ! 4870: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x899521d4  ! 4871: WRPR_TICK_I	wrpr	%r20, 0x01d4, %tick
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe56107  ! 4875: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5a179  ! 4877: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e46029  ! 4878: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e52166  ! 4882: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7351000  ! 4883: SRLX_R	srlx	%r20, %r0, %r27
	.word 0xbfe5e0c0  ! 4884: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe520aa  ! 4887: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbd508000  ! 4890: RDPR_TSTATE	<illegal instruction>
	.word 0xbde46054  ! 4892: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8594608e  ! 4893: WRPR_TSTATE_I	wrpr	%r17, 0x008e, %tstate
	.word 0xbf51c000  ! 4898: RDPR_TL	<illegal instruction>
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1c1  ! 4901: SAVE_I	save	%r19, 0x0001, %r25
	mov	0, %r12
	.word 0x8f932000  ! 4902: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe461e8  ! 4905: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe52180  ! 4906: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde421b8  ! 4907: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982dc9  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc9, %hpstate
	.word 0xbbe42081  ! 4915: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e460a1  ! 4920: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x9195e0dc  ! 4922: WRPR_PIL_I	wrpr	%r23, 0x00dc, %pil
	.word 0xb5e4a0c1  ! 4924: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5e1cd  ! 4925: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_5, %g1, %r16
	.word 0xb3e461ec  ! 4930: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe561fe  ! 4931: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde460a2  ! 4932: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5a19b  ! 4935: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x91956000  ! 4938: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xb5e4e1d7  ! 4939: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5a162  ! 4944: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb6b40000  ! 4945: SUBCcc_R	orncc 	%r16, %r0, %r27
	setx	0x320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83956116  ! 4948: WRPR_TNPC_I	wrpr	%r21, 0x0116, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x3022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e4e040  ! 4953: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8d94a04e  ! 4954: WRPR_PSTATE_I	wrpr	%r18, 0x004e, %pstate
	.word 0xb9510000  ! 4955: RDPR_TICK	<illegal instruction>
	.word 0xbde42176  ! 4957: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4e084  ! 4960: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e521fe  ! 4961: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8394a007  ! 4963: WRPR_TNPC_I	wrpr	%r18, 0x0007, %tnpc
	.word 0xb7e4a11c  ! 4965: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4200a  ! 4966: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8594e178  ! 4967: WRPR_TSTATE_I	wrpr	%r19, 0x0178, %tstate
	.word 0xb9e46047  ! 4968: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e4a1d9  ! 4970: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5e195  ! 4975: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbebde04a  ! 4976: XNORcc_I	xnorcc 	%r23, 0x004a, %r31
	.word 0xbde4a153  ! 4980: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe4e148  ! 4982: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3353001  ! 4983: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xb3e520b7  ! 4986: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe560b2  ! 4987: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb445a0b8  ! 4988: ADDC_I	addc 	%r22, 0x00b8, %r26
	.word 0xb7e4a099  ! 4989: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xba25c000  ! 4993: SUB_R	sub 	%r23, %r0, %r29
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
	.word 0xf83cc000  ! 1: STD_R	std	%r28, [%r19 + %r0]
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93c61af  ! 4: STDF_I	std	%f28, [0x01af, %r17]
	.word 0xfc742166  ! 7: STX_I	stx	%r30, [%r16 + 0x0166]
	.word 0xf63c20dd  ! 11: STD_I	std	%r27, [%r16 + 0x00dd]
	.word 0xb7504000  ! 14: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xbe8c2037  ! 15: ANDcc_I	andcc 	%r16, 0x0037, %r31
	.word 0xbd504000  ! 16: RDPR_TNPC	<illegal instruction>
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2754000  ! 20: STX_R	stx	%r25, [%r21 + %r0]
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8358000  ! 22: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xb1518000  ! 23: RDPR_PSTATE	<illegal instruction>
	.word 0x839460e0  ! 25: WRPR_TNPC_I	wrpr	%r17, 0x00e0, %tnpc
	.word 0xf03d0000  ! 26: STD_R	std	%r24, [%r20 + %r0]
	.word 0xf82520d1  ! 27: STW_I	stw	%r28, [%r20 + 0x00d1]
	.word 0xf8340000  ! 28: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfa2d2010  ! 34: STB_I	stb	%r29, [%r20 + 0x0010]
	.word 0xfe2d4000  ! 36: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf33d8000  ! 37: STDF_R	std	%f25, [%r0, %r22]
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc348000  ! 42: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf93de0bf  ! 43: STDF_I	std	%f28, [0x00bf, %r23]
	.word 0xb7540000  ! 45: RDPR_GL	rdpr	%-, %r27
	.word 0xf825e033  ! 46: STW_I	stw	%r28, [%r23 + 0x0033]
	.word 0xf2244000  ! 47: STW_R	stw	%r25, [%r17 + %r0]
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 50: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xb245c000  ! 51: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xfd3de11c  ! 54: STDF_I	std	%f30, [0x011c, %r23]
	setx	0x3000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 56: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 58: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bc604a  ! 61: XNORcc_I	xnorcc 	%r17, 0x004a, %r28
	.word 0xfa7421d4  ! 64: STX_I	stx	%r29, [%r16 + 0x01d4]
	.word 0xff3de19d  ! 66: STDF_I	std	%f31, [0x019d, %r23]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd510000  ! 69: RDPR_TICK	rdpr	%tick, %r30
	.word 0xfe254000  ! 70: STW_R	stw	%r31, [%r21 + %r0]
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e029  ! 72: WRPR_TNPC_I	wrpr	%r19, 0x0029, %tnpc
	.word 0xb6254000  ! 73: SUB_R	sub 	%r21, %r0, %r27
	.word 0xfe742152  ! 75: STX_I	stx	%r31, [%r16 + 0x0152]
	.word 0xfc742043  ! 80: STX_I	stx	%r30, [%r16 + 0x0043]
	.word 0xfe240000  ! 81: STW_R	stw	%r31, [%r16 + %r0]
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf475e0ec  ! 83: STX_I	stx	%r26, [%r23 + 0x00ec]
	.word 0xba8de1dc  ! 99: ANDcc_I	andcc 	%r23, 0x01dc, %r29
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e166  ! 103: WRPR_TICK_I	wrpr	%r19, 0x0166, %tick
	.word 0xf43d212d  ! 104: STD_I	std	%r26, [%r20 + 0x012d]
	.word 0xb3540000  ! 105: RDPR_GL	rdpr	%-, %r25
	mov	0, %r14
	.word 0xa193a000  ! 107: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe3d0000  ! 111: STD_R	std	%r31, [%r20 + %r0]
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3ca0fa  ! 116: STD_I	std	%r29, [%r18 + 0x00fa]
	.word 0xf6744000  ! 118: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf224e0e7  ! 122: STW_I	stw	%r25, [%r19 + 0x00e7]
	mov	0, %r14
	.word 0xa193a000  ! 124: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc2dc000  ! 128: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xb1480000  ! 129: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_1, %g1, %r20
	.word 0xb6a460f6  ! 133: SUBcc_I	subcc 	%r17, 0x00f6, %r27
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 139: RDPR_PIL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 140: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 149: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x9194a10f  ! 150: WRPR_PIL_I	wrpr	%r18, 0x010f, %pil
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6248000  ! 153: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xfa2c61e0  ! 161: STB_I	stb	%r29, [%r17 + 0x01e0]
	.word 0xfa2c8000  ! 162: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfe7521a2  ! 163: STX_I	stx	%r31, [%r20 + 0x01a2]
	.word 0xf33de05a  ! 164: STDF_I	std	%f25, [0x005a, %r23]
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d0000  ! 168: STDF_R	std	%f31, [%r0, %r20]
	mov	1, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb83ce17c  ! 170: XNOR_I	xnor 	%r19, 0x017c, %r28
	.word 0xf47421eb  ! 179: STX_I	stx	%r26, [%r16 + 0x01eb]
	setx	0x21b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2348000  ! 183: STH_R	sth	%r25, [%r18 + %r0]
	setx	0x30121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3520f8  ! 188: STH_I	sth	%r31, [%r20 + 0x00f8]
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e129  ! 193: WRPR_PIL_I	wrpr	%r19, 0x0129, %pil
	.word 0xf824c000  ! 197: STW_R	stw	%r28, [%r19 + %r0]
	.word 0x9195a1e1  ! 199: WRPR_PIL_I	wrpr	%r22, 0x01e1, %pil
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf624e1ed  ! 203: STW_I	stw	%r27, [%r19 + 0x01ed]
	.word 0xfa24a015  ! 205: STW_I	stw	%r29, [%r18 + 0x0015]
	.word 0xfa3d605b  ! 206: STD_I	std	%r29, [%r21 + 0x005b]
	.word 0xb1643801  ! 207: MOVcc_I	<illegal instruction>
	.word 0xff3c0000  ! 211: STDF_R	std	%f31, [%r0, %r16]
	.word 0xf02c8000  ! 212: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xfc254000  ! 213: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xb52c4000  ! 218: SLL_R	sll 	%r17, %r0, %r26
	.word 0xf02da0be  ! 219: STB_I	stb	%r24, [%r22 + 0x00be]
	.word 0xf434a16e  ! 221: STH_I	sth	%r26, [%r18 + 0x016e]
	.word 0xf625e128  ! 226: STW_I	stw	%r27, [%r23 + 0x0128]
	.word 0xb7504000  ! 227: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8394e098  ! 230: WRPR_TNPC_I	wrpr	%r19, 0x0098, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf634c000  ! 235: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf53c60ea  ! 237: STDF_I	std	%f26, [0x00ea, %r17]
	.word 0xfc248000  ! 239: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xb33cd000  ! 240: SRAX_R	srax	%r19, %r0, %r25
	.word 0xf82c0000  ! 242: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf0250000  ! 243: STW_R	stw	%r24, [%r20 + %r0]
	.word 0x8d95a198  ! 244: WRPR_PSTATE_I	wrpr	%r22, 0x0198, %pstate
	.word 0xff3c8000  ! 247: STDF_R	std	%f31, [%r0, %r18]
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83c2020  ! 250: STD_I	std	%r28, [%r16 + 0x0020]
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73c60d9  ! 252: STDF_I	std	%f27, [0x00d9, %r17]
	.word 0xf62420cd  ! 253: STW_I	stw	%r27, [%r16 + 0x00cd]
	.word 0xbd340000  ! 254: SRL_R	srl 	%r16, %r0, %r30
	.word 0xbb504000  ! 258: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xbb7c6401  ! 259: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xfa752008  ! 260: STX_I	stx	%r29, [%r20 + 0x0008]
	.word 0xf22de1bc  ! 265: STB_I	stb	%r25, [%r23 + 0x01bc]
	.word 0x8394a11a  ! 268: WRPR_TNPC_I	wrpr	%r18, 0x011a, %tnpc
	.word 0xb5518000  ! 269: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfc748000  ! 270: STX_R	stx	%r30, [%r18 + %r0]
	.word 0x8d95201d  ! 272: WRPR_PSTATE_I	wrpr	%r20, 0x001d, %pstate
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	.word 0xf224213e  ! 277: STW_I	stw	%r25, [%r16 + 0x013e]
	.word 0xb9510000  ! 283: RDPR_TICK	rdpr	%tick, %r28
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2c607b  ! 294: STB_I	stb	%r29, [%r17 + 0x007b]
	.word 0xfe756058  ! 296: STX_I	stx	%r31, [%r21 + 0x0058]
	.word 0xf43c213b  ! 297: STD_I	std	%r26, [%r16 + 0x013b]
	.word 0xf22ca11a  ! 298: STB_I	stb	%r25, [%r18 + 0x011a]
	.word 0xbb480000  ! 299: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x1001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf435c000  ! 304: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfb3c61d0  ! 305: STDF_I	std	%f29, [0x01d0, %r17]
	.word 0xfe344000  ! 308: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xb4bdc000  ! 310: XNORcc_R	xnorcc 	%r23, %r0, %r26
	setx	data_start_6, %g1, %r19
	.word 0xf33da0ce  ! 313: STDF_I	std	%f25, [0x00ce, %r22]
	.word 0xb3508000  ! 316: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf6758000  ! 317: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xfc2ce15a  ! 318: STB_I	stb	%r30, [%r19 + 0x015a]
	.word 0xf23dc000  ! 319: STD_R	std	%r25, [%r23 + %r0]
	.word 0xf6742069  ! 321: STX_I	stx	%r27, [%r16 + 0x0069]
	.word 0xff3d0000  ! 322: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf22c21ab  ! 325: STB_I	stb	%r25, [%r16 + 0x01ab]
	.word 0xfa348000  ! 329: STH_R	sth	%r29, [%r18 + %r0]
	.word 0x859561a9  ! 331: WRPR_TSTATE_I	wrpr	%r21, 0x01a9, %tstate
	.word 0x87946168  ! 334: WRPR_TT_I	wrpr	%r17, 0x0168, %tt
	.word 0xfa358000  ! 335: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf8752116  ! 336: STX_I	stx	%r28, [%r20 + 0x0116]
	setx	data_start_7, %g1, %r18
	.word 0xfa2d4000  ! 347: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xfc350000  ! 348: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf074a0fa  ! 352: STX_I	stx	%r24, [%r18 + 0x00fa]
	.word 0xf0246008  ! 353: STW_I	stw	%r24, [%r17 + 0x0008]
	.word 0xbb480000  ! 354: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf63d0000  ! 355: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf62cc000  ! 356: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfe2c4000  ! 359: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfa2cc000  ! 364: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xbab5a0ff  ! 365: SUBCcc_I	orncc 	%r22, 0x00ff, %r29
	.word 0x91956080  ! 366: WRPR_PIL_I	wrpr	%r21, 0x0080, %pil
	.word 0xb1508000  ! 368: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfa3d6096  ! 371: STD_I	std	%r29, [%r21 + 0x0096]
	.word 0xb7480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf23d8000  ! 373: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf2354000  ! 374: STH_R	sth	%r25, [%r21 + %r0]
	setx	0x1c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 379: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0x879520f2  ! 383: WRPR_TT_I	wrpr	%r20, 0x00f2, %tt
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb28d4000  ! 385: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xb624e126  ! 386: SUB_I	sub 	%r19, 0x0126, %r27
	.word 0xb895c000  ! 391: ORcc_R	orcc 	%r23, %r0, %r28
	.word 0xf83d2134  ! 394: STD_I	std	%r28, [%r20 + 0x0134]
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c6176  ! 404: STB_I	stb	%r30, [%r17 + 0x0176]
	.word 0xf6740000  ! 406: STX_R	stx	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf93da119  ! 411: STDF_I	std	%f28, [0x0119, %r22]
	setx	data_start_7, %g1, %r20
	.word 0xf33de141  ! 415: STDF_I	std	%f25, [0x0141, %r23]
	.word 0xb844e1a4  ! 423: ADDC_I	addc 	%r19, 0x01a4, %r28
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb434619e  ! 428: SUBC_I	orn 	%r17, 0x019e, %r26
	.word 0xf62d8000  ! 429: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xb5510000  ! 432: RDPR_TICK	rdpr	%tick, %r26
	.word 0x8d95e062  ! 437: WRPR_PSTATE_I	wrpr	%r23, 0x0062, %pstate
	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834e007  ! 445: STH_I	sth	%r28, [%r19 + 0x0007]
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d6080  ! 448: STD_I	std	%r29, [%r21 + 0x0080]
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c60d0  ! 452: STD_I	std	%r24, [%r17 + 0x00d0]
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3cc000  ! 455: STDF_R	std	%f31, [%r0, %r19]
	.word 0xb1540000  ! 456: RDPR_GL	rdpr	%-, %r24
	.word 0xfa748000  ! 457: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xb83ca1a6  ! 458: XNOR_I	xnor 	%r18, 0x01a6, %r28
	.word 0xfb3ce127  ! 462: STDF_I	std	%f29, [0x0127, %r19]
	.word 0xf22d6118  ! 463: STB_I	stb	%r25, [%r21 + 0x0118]
	.word 0xbe95e1ab  ! 465: ORcc_I	orcc 	%r23, 0x01ab, %r31
	.word 0x9194e113  ! 466: WRPR_PIL_I	wrpr	%r19, 0x0113, %pil
	mov	1, %r14
	.word 0xa193a000  ! 471: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf4740000  ! 472: STX_R	stx	%r26, [%r16 + %r0]
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879560f2  ! 476: WRPR_TT_I	wrpr	%r21, 0x00f2, %tt
	.word 0xfb3c0000  ! 477: STDF_R	std	%f29, [%r0, %r16]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfd3d8000  ! 490: STDF_R	std	%f30, [%r0, %r22]
	.word 0x859421b8  ! 492: WRPR_TSTATE_I	wrpr	%r16, 0x01b8, %tstate
	.word 0xf434c000  ! 493: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf425c000  ! 494: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf73c4000  ! 495: STDF_R	std	%f27, [%r0, %r17]
	.word 0xb6254000  ! 497: SUB_R	sub 	%r21, %r0, %r27
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 501: RDPR_PSTATE	rdpr	%pstate, %r24
	mov	2, %r14
	.word 0xa193a000  ! 502: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf034e01b  ! 503: STH_I	sth	%r24, [%r19 + 0x001b]
	.word 0xf6258000  ! 507: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xbb500000  ! 508: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xfe74201a  ! 510: STX_I	stx	%r31, [%r16 + 0x001a]
	.word 0xb09cc000  ! 522: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xf82c0000  ! 527: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf874e1df  ! 529: STX_I	stx	%r28, [%r19 + 0x01df]
	.word 0xf73c4000  ! 531: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf075c000  ! 532: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf4344000  ! 533: STH_R	sth	%r26, [%r17 + %r0]
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5518000  ! 542: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfb3c610e  ! 543: STDF_I	std	%f29, [0x010e, %r17]
	.word 0xbf500000  ! 544: RDPR_TPC	<illegal instruction>
	.word 0xfa74e0e9  ! 545: STX_I	stx	%r29, [%r19 + 0x00e9]
	.word 0xf53c0000  ! 547: STDF_R	std	%f26, [%r0, %r16]
	.word 0x919460df  ! 549: WRPR_PIL_I	wrpr	%r17, 0x00df, %pil
	.word 0xf93dc000  ! 552: STDF_R	std	%f28, [%r0, %r23]
	.word 0xb7504000  ! 555: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x899521ac  ! 556: WRPR_TICK_I	wrpr	%r20, 0x01ac, %tick
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3cc000  ! 558: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf83520cc  ! 559: STH_I	sth	%r28, [%r20 + 0x00cc]
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe754000  ! 564: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf0356139  ! 565: STH_I	sth	%r24, [%r21 + 0x0139]
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f01  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f01, %hpstate
	.word 0xb551c000  ! 571: RDPR_TL	rdpr	%tl, %r26
	.word 0xfe25e0aa  ! 572: STW_I	stw	%r31, [%r23 + 0x00aa]
	.word 0xf43d61a1  ! 573: STD_I	std	%r26, [%r21 + 0x01a1]
	.word 0x899420e2  ! 598: WRPR_TICK_I	wrpr	%r16, 0x00e2, %tick
	.word 0xb0950000  ! 599: ORcc_R	orcc 	%r20, %r0, %r24
	.word 0xf8740000  ! 602: STX_R	stx	%r28, [%r16 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 605: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf235c000  ! 612: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf13d8000  ! 616: STDF_R	std	%f24, [%r0, %r22]
	.word 0xb7500000  ! 617: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf73d4000  ! 618: STDF_R	std	%f27, [%r0, %r21]
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 624: RDPR_GL	<illegal instruction>
	.word 0xbd508000  ! 629: RDPR_TSTATE	<illegal instruction>
	.word 0xf73d8000  ! 630: STDF_R	std	%f27, [%r0, %r22]
	.word 0xfc2ce0c9  ! 636: STB_I	stb	%r30, [%r19 + 0x00c9]
	.word 0xfa7421a9  ! 637: STX_I	stx	%r29, [%r16 + 0x01a9]
	.word 0xfd3d8000  ! 638: STDF_R	std	%f30, [%r0, %r22]
	.word 0xf13da1a4  ! 639: STDF_I	std	%f24, [0x01a4, %r22]
	.word 0xf4250000  ! 644: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf42c213c  ! 647: STB_I	stb	%r26, [%r16 + 0x013c]
	.word 0xfa240000  ! 650: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xbb508000  ! 651: RDPR_TSTATE	<illegal instruction>
	.word 0xfa3c6125  ! 652: STD_I	std	%r29, [%r17 + 0x0125]
	.word 0xf074e024  ! 653: STX_I	stx	%r24, [%r19 + 0x0024]
	.word 0xf8358000  ! 657: STH_R	sth	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8198380b  ! 659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180b, %hpstate
	.word 0xf93dc000  ! 663: STDF_R	std	%f28, [%r0, %r23]
	.word 0xfe75c000  ! 664: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xb7510000  ! 665: RDPR_TICK	rdpr	%tick, %r27
	setx	data_start_5, %g1, %r22
	.word 0x8994a0eb  ! 676: WRPR_TICK_I	wrpr	%r18, 0x00eb, %tick
	.word 0xb3480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf22d8000  ! 684: STB_R	stb	%r25, [%r22 + %r0]
	.word 0x859560cb  ! 686: WRPR_TSTATE_I	wrpr	%r21, 0x00cb, %tstate
	.word 0x85956043  ! 689: WRPR_TSTATE_I	wrpr	%r21, 0x0043, %tstate
	.word 0xf225e1f5  ! 691: STW_I	stw	%r25, [%r23 + 0x01f5]
	.word 0xf63d602b  ! 692: STD_I	std	%r27, [%r21 + 0x002b]
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 698: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xbac48000  ! 700: ADDCcc_R	addccc 	%r18, %r0, %r29
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc4421ff  ! 703: ADDC_I	addc 	%r16, 0x01ff, %r30
	.word 0xfd3ce01a  ! 710: STDF_I	std	%f30, [0x001a, %r19]
	.word 0xfb3ce090  ! 711: STDF_I	std	%f29, [0x0090, %r19]
	.word 0xbd500000  ! 712: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf8240000  ! 720: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfc3c21c7  ! 722: STD_I	std	%r30, [%r16 + 0x01c7]
	.word 0x839561af  ! 723: WRPR_TNPC_I	wrpr	%r21, 0x01af, %tnpc
	.word 0xfc35e17f  ! 724: STH_I	sth	%r30, [%r23 + 0x017f]
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	.word 0xf075e037  ! 729: STX_I	stx	%r24, [%r23 + 0x0037]
	.word 0xfe25a105  ! 732: STW_I	stw	%r31, [%r22 + 0x0105]
	setx	data_start_6, %g1, %r22
	.word 0xfe3c0000  ! 742: STD_R	std	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	.word 0xbd500000  ! 746: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xbd504000  ! 749: RDPR_TNPC	<illegal instruction>
	.word 0xfc3d60cf  ! 752: STD_I	std	%r30, [%r21 + 0x00cf]
	.word 0xf8748000  ! 754: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xfe7520a6  ! 757: STX_I	stx	%r31, [%r20 + 0x00a6]
	.word 0xf634a066  ! 760: STH_I	sth	%r27, [%r18 + 0x0066]
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e180  ! 764: WRPR_PIL_I	wrpr	%r23, 0x0180, %pil
	.word 0xf875a098  ! 767: STX_I	stx	%r28, [%r22 + 0x0098]
	.word 0xfc2ce172  ! 773: STB_I	stb	%r30, [%r19 + 0x0172]
	.word 0xf62c8000  ! 774: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xbb520000  ! 776: RDPR_PIL	rdpr	%pil, %r29
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d0000  ! 779: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb9504000  ! 780: RDPR_TNPC	<illegal instruction>
	.word 0xf63c6009  ! 781: STD_I	std	%r27, [%r17 + 0x0009]
	.word 0xf035c000  ! 783: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xbf50c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0xf13c4000  ! 787: STDF_R	std	%f24, [%r0, %r17]
	.word 0xfe3c20c2  ! 788: STD_I	std	%r31, [%r16 + 0x00c2]
	.word 0xf4744000  ! 789: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf33dc000  ! 791: STDF_R	std	%f25, [%r0, %r23]
	.word 0xfc2d8000  ! 793: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf6256113  ! 795: STW_I	stw	%r27, [%r21 + 0x0113]
	.word 0xf235609c  ! 800: STH_I	sth	%r25, [%r21 + 0x009c]
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b13  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	.word 0xf63da125  ! 806: STD_I	std	%r27, [%r22 + 0x0125]
	.word 0xf63c206d  ! 807: STD_I	std	%r27, [%r16 + 0x006d]
	.word 0xf03c201d  ! 810: STD_I	std	%r24, [%r16 + 0x001d]
	.word 0xfc3dc000  ! 811: STD_R	std	%r30, [%r23 + %r0]
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 820: RDPR_GL	rdpr	%-, %r24
	.word 0xf834600f  ! 822: STH_I	sth	%r28, [%r17 + 0x000f]
	.word 0xb9510000  ! 823: RDPR_TICK	<illegal instruction>
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 825: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xfe25c000  ! 828: STW_R	stw	%r31, [%r23 + %r0]
	setx	data_start_7, %g1, %r20
	.word 0xf8340000  ! 833: STH_R	sth	%r28, [%r16 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 838: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf63c8000  ! 839: STD_R	std	%r27, [%r18 + %r0]
	.word 0xbd508000  ! 842: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	0x10022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf275c000  ! 849: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf13c8000  ! 856: STDF_R	std	%f24, [%r0, %r18]
	.word 0xfa746188  ! 861: STX_I	stx	%r29, [%r17 + 0x0188]
	.word 0xf0244000  ! 869: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf13d0000  ! 870: STDF_R	std	%f24, [%r0, %r20]
	.word 0xf425e1d5  ! 871: STW_I	stw	%r26, [%r23 + 0x01d5]
	.word 0xff3d2004  ! 872: STDF_I	std	%f31, [0x0004, %r20]
	.word 0xb7518000  ! 873: RDPR_PSTATE	<illegal instruction>
	.word 0xfe35c000  ! 874: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xbb3d1000  ! 877: SRAX_R	srax	%r20, %r0, %r29
	.word 0xf2750000  ! 880: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xb6b58000  ! 882: SUBCcc_R	orncc 	%r22, %r0, %r27
	setx	data_start_4, %g1, %r23
	.word 0xf024e0f3  ! 884: STW_I	stw	%r24, [%r19 + 0x00f3]
	.word 0xf83c2176  ! 893: STD_I	std	%r28, [%r16 + 0x0176]
	ta	T_CHANGE_HPRIV
	.word 0x81983a5b  ! 897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5b, %hpstate
	.word 0xf034c000  ! 898: STH_R	sth	%r24, [%r19 + %r0]
	.word 0x8394a078  ! 899: WRPR_TNPC_I	wrpr	%r18, 0x0078, %tnpc
	.word 0xf43c4000  ! 900: STD_R	std	%r26, [%r17 + %r0]
	.word 0xb9518000  ! 902: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfc340000  ! 904: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb0952126  ! 908: ORcc_I	orcc 	%r20, 0x0126, %r24
	.word 0x8994a009  ! 910: WRPR_TICK_I	wrpr	%r18, 0x0009, %tick
	.word 0xf2254000  ! 912: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf83d214e  ! 914: STD_I	std	%r28, [%r20 + 0x014e]
	.word 0x8d942144  ! 915: WRPR_PSTATE_I	wrpr	%r16, 0x0144, %pstate
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 927: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf42dc000  ! 931: STB_R	stb	%r26, [%r23 + %r0]
	.word 0x8794212a  ! 936: WRPR_TT_I	wrpr	%r16, 0x012a, %tt
	.word 0xf62d21ec  ! 937: STB_I	stb	%r27, [%r20 + 0x01ec]
	.word 0xfc34a024  ! 940: STH_I	sth	%r30, [%r18 + 0x0024]
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 945: RDPR_TT	rdpr	%tt, %r25
	.word 0xf03c0000  ! 946: STD_R	std	%r24, [%r16 + %r0]
	.word 0xbd520000  ! 947: RDPR_PIL	<illegal instruction>
	.word 0xf6240000  ! 949: STW_R	stw	%r27, [%r16 + %r0]
	.word 0x8d94a1b1  ! 950: WRPR_PSTATE_I	wrpr	%r18, 0x01b1, %pstate
	.word 0xb1520000  ! 952: RDPR_PIL	rdpr	%pil, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf22ca144  ! 955: STB_I	stb	%r25, [%r18 + 0x0144]
	.word 0x89952003  ! 959: WRPR_TICK_I	wrpr	%r20, 0x0003, %tick
	.word 0xf475c000  ! 960: STX_R	stx	%r26, [%r23 + %r0]
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa748000  ! 966: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbd500000  ! 967: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xbcb54000  ! 971: ORNcc_R	orncc 	%r21, %r0, %r30
	setx	0x237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb00d8000  ! 976: AND_R	and 	%r22, %r0, %r24
	.word 0xfc340000  ! 983: STH_R	sth	%r30, [%r16 + %r0]
	setx	data_start_6, %g1, %r18
	.word 0xf43ca106  ! 986: STD_I	std	%r26, [%r18 + 0x0106]
	.word 0xf43cc000  ! 988: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf23c8000  ! 989: STD_R	std	%r25, [%r18 + %r0]
	.word 0xfa75c000  ! 991: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf83c0000  ! 994: STD_R	std	%r28, [%r16 + %r0]
	.word 0x89942046  ! 995: WRPR_TICK_I	wrpr	%r16, 0x0046, %tick
	.word 0xf835c000  ! 1000: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xb550c000  ! 1005: RDPR_TT	rdpr	%tt, %r26
	setx	data_start_1, %g1, %r20
	.word 0xf8252172  ! 1009: STW_I	stw	%r28, [%r20 + 0x0172]
	.word 0xf43520bd  ! 1012: STH_I	sth	%r26, [%r20 + 0x00bd]
	.word 0xb1518000  ! 1013: RDPR_PSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r20
	.word 0xf73ca13a  ! 1017: STDF_I	std	%f27, [0x013a, %r18]
	.word 0xf22c4000  ! 1018: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xf23c2052  ! 1021: STD_I	std	%r25, [%r16 + 0x0052]
	setx	data_start_1, %g1, %r16
	setx	0x204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa244000  ! 1029: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xfe75e0e9  ! 1032: STX_I	stx	%r31, [%r23 + 0x00e9]
	setx	0x30306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53d601c  ! 1035: STDF_I	std	%f26, [0x001c, %r21]
	.word 0xf63c0000  ! 1037: STD_R	std	%r27, [%r16 + %r0]
	.word 0xfa2c8000  ! 1038: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfc34c000  ! 1042: STH_R	sth	%r30, [%r19 + %r0]
	.word 0x8594616e  ! 1043: WRPR_TSTATE_I	wrpr	%r17, 0x016e, %tstate
	setx	0x1023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41ca112  ! 1046: XOR_I	xor 	%r18, 0x0112, %r26
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 1050: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf624219c  ! 1051: STW_I	stw	%r27, [%r16 + 0x019c]
	.word 0xfe2dc000  ! 1053: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf73d8000  ! 1054: STDF_R	std	%f27, [%r0, %r22]
	.word 0xff3c0000  ! 1055: STDF_R	std	%f31, [%r0, %r16]
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc34a0a5  ! 1063: STH_I	sth	%r30, [%r18 + 0x00a5]
	.word 0xf62c4000  ! 1067: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf33dc000  ! 1068: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf4342099  ! 1071: STH_I	sth	%r26, [%r16 + 0x0099]
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 1078: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0x8994208f  ! 1079: WRPR_TICK_I	wrpr	%r16, 0x008f, %tick
	.word 0x8194a077  ! 1080: WRPR_TPC_I	wrpr	%r18, 0x0077, %tpc
	.word 0xf0750000  ! 1082: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfc3ca1b7  ! 1085: STD_I	std	%r30, [%r18 + 0x01b7]
	.word 0xfc74a0c6  ! 1088: STX_I	stx	%r30, [%r18 + 0x00c6]
	.word 0xb2b460c9  ! 1091: ORNcc_I	orncc 	%r17, 0x00c9, %r25
	.word 0xfc750000  ! 1093: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xfc748000  ! 1095: STX_R	stx	%r30, [%r18 + %r0]
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 1098: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfa3dc000  ! 1100: STD_R	std	%r29, [%r23 + %r0]
	.word 0xbf7d8400  ! 1106: MOVR_R	movre	%r22, %r0, %r31
	.word 0xf835c000  ! 1109: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xb3504000  ! 1115: RDPR_TNPC	<illegal instruction>
	.word 0xb08ca0f3  ! 1118: ANDcc_I	andcc 	%r18, 0x00f3, %r24
	.word 0xb135f001  ! 1119: SRLX_I	srlx	%r23, 0x0001, %r24
	.word 0xb9504000  ! 1121: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf02d8000  ! 1125: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xfd3c4000  ! 1126: STDF_R	std	%f30, [%r0, %r17]
	.word 0x85956171  ! 1128: WRPR_TSTATE_I	wrpr	%r21, 0x0171, %tstate
	mov	1, %r12
	.word 0x8f932000  ! 1133: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf62ce151  ! 1135: STB_I	stb	%r27, [%r19 + 0x0151]
	.word 0x919420eb  ! 1137: WRPR_PIL_I	wrpr	%r16, 0x00eb, %pil
	.word 0xf275e165  ! 1138: STX_I	stx	%r25, [%r23 + 0x0165]
	.word 0xf23d8000  ! 1139: STD_R	std	%r25, [%r22 + %r0]
	.word 0xb53dc000  ! 1141: SRA_R	sra 	%r23, %r0, %r26
	.word 0xb1504000  ! 1142: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb37cc400  ! 1143: MOVR_R	movre	%r19, %r0, %r25
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62ce09b  ! 1147: STB_I	stb	%r27, [%r19 + 0x009b]
	.word 0xb72c7001  ! 1151: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xf824c000  ! 1152: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf274a042  ! 1156: STX_I	stx	%r25, [%r18 + 0x0042]
	.word 0xff3da04d  ! 1159: STDF_I	std	%f31, [0x004d, %r22]
	.word 0xfc3dc000  ! 1160: STD_R	std	%r30, [%r23 + %r0]
	.word 0xb89c0000  ! 1164: XORcc_R	xorcc 	%r16, %r0, %r28
	.word 0xfc2d20e3  ! 1166: STB_I	stb	%r30, [%r20 + 0x00e3]
	.word 0xf63ca15c  ! 1168: STD_I	std	%r27, [%r18 + 0x015c]
	.word 0xb3510000  ! 1169: RDPR_TICK	<illegal instruction>
	.word 0xb72c6001  ! 1170: SLL_I	sll 	%r17, 0x0001, %r27
	.word 0xf875e1c1  ! 1171: STX_I	stx	%r28, [%r23 + 0x01c1]
	.word 0xb5500000  ! 1173: RDPR_TPC	<illegal instruction>
	.word 0xb095a174  ! 1175: ORcc_I	orcc 	%r22, 0x0174, %r24
	.word 0xf62d4000  ! 1178: STB_R	stb	%r27, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2346118  ! 1181: STH_I	sth	%r25, [%r17 + 0x0118]
	.word 0xf024606a  ! 1184: STW_I	stw	%r24, [%r17 + 0x006a]
	.word 0xfa35c000  ! 1186: STH_R	sth	%r29, [%r23 + %r0]
	setx	data_start_2, %g1, %r22
	.word 0xf2240000  ! 1191: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf6750000  ! 1195: STX_R	stx	%r27, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982c41  ! 1197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c41, %hpstate
	.word 0xb53df001  ! 1199: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0xb550c000  ! 1200: RDPR_TT	rdpr	%tt, %r26
	.word 0xf22d0000  ! 1202: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xfb3d605d  ! 1203: STDF_I	std	%f29, [0x005d, %r21]
	.word 0xb5508000  ! 1205: RDPR_TSTATE	<illegal instruction>
	.word 0xf225a199  ! 1207: STW_I	stw	%r25, [%r22 + 0x0199]
	.word 0xf83c21a3  ! 1208: STD_I	std	%r28, [%r16 + 0x01a3]
	.word 0xf635e127  ! 1210: STH_I	sth	%r27, [%r23 + 0x0127]
	.word 0xfc74207b  ! 1212: STX_I	stx	%r30, [%r16 + 0x007b]
	.word 0xf424a0d3  ! 1214: STW_I	stw	%r26, [%r18 + 0x00d3]
	.word 0xf33d202d  ! 1215: STDF_I	std	%f25, [0x002d, %r20]
	.word 0x8795a15d  ! 1217: WRPR_TT_I	wrpr	%r22, 0x015d, %tt
	.word 0xf8356022  ! 1218: STH_I	sth	%r28, [%r21 + 0x0022]
	.word 0xb3510000  ! 1220: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf13c6159  ! 1224: STDF_I	std	%f24, [0x0159, %r17]
	.word 0xf93cc000  ! 1227: STDF_R	std	%f28, [%r0, %r19]
	.word 0xb21d4000  ! 1228: XOR_R	xor 	%r21, %r0, %r25
	.word 0xf42de0c9  ! 1229: STB_I	stb	%r26, [%r23 + 0x00c9]
	.word 0xf0742099  ! 1230: STX_I	stx	%r24, [%r16 + 0x0099]
	.word 0xf835a0cf  ! 1232: STH_I	sth	%r28, [%r22 + 0x00cf]
	.word 0xf674e07b  ! 1234: STX_I	stx	%r27, [%r19 + 0x007b]
	.word 0xb4b5c000  ! 1235: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xfa2dc000  ! 1237: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfc256154  ! 1238: STW_I	stw	%r30, [%r21 + 0x0154]
	.word 0x879520f3  ! 1239: WRPR_TT_I	wrpr	%r20, 0x00f3, %tt
	.word 0xfc2dc000  ! 1241: STB_R	stb	%r30, [%r23 + %r0]
	.word 0x899420d3  ! 1245: WRPR_TICK_I	wrpr	%r16, 0x00d3, %tick
	.word 0xf224e1a4  ! 1246: STW_I	stw	%r25, [%r19 + 0x01a4]
	.word 0xf8254000  ! 1247: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xb815e16b  ! 1248: OR_I	or 	%r23, 0x016b, %r28
	.word 0xbcac2153  ! 1250: ANDNcc_I	andncc 	%r16, 0x0153, %r30
	.word 0xf2252132  ! 1251: STW_I	stw	%r25, [%r20 + 0x0132]
	.word 0x8394a1b6  ! 1256: WRPR_TNPC_I	wrpr	%r18, 0x01b6, %tnpc
	.word 0xf62d0000  ! 1257: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf075a03e  ! 1258: STX_I	stx	%r24, [%r22 + 0x003e]
	.word 0xf53da199  ! 1261: STDF_I	std	%f26, [0x0199, %r22]
	.word 0xfc25a01d  ! 1262: STW_I	stw	%r30, [%r22 + 0x001d]
	.word 0xf4250000  ! 1264: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xbd51c000  ! 1265: RDPR_TL	rdpr	%tl, %r30
	.word 0xf93d8000  ! 1266: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf03ce078  ! 1267: STD_I	std	%r24, [%r19 + 0x0078]
	.word 0xf62421c7  ! 1268: STW_I	stw	%r27, [%r16 + 0x01c7]
	.word 0xf42c20a8  ! 1271: STB_I	stb	%r26, [%r16 + 0x00a8]
	.word 0xb32c9000  ! 1272: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xb7504000  ! 1273: RDPR_TNPC	<illegal instruction>
	.word 0xf13cc000  ! 1275: STDF_R	std	%f24, [%r0, %r19]
	.word 0xb0248000  ! 1276: SUB_R	sub 	%r18, %r0, %r24
	.word 0xb1520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0x8d94a0e8  ! 1286: WRPR_PSTATE_I	wrpr	%r18, 0x00e8, %pstate
	.word 0xf22d4000  ! 1288: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf33d4000  ! 1294: STDF_R	std	%f25, [%r0, %r21]
	.word 0xb5500000  ! 1305: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf834c000  ! 1308: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xb17d2401  ! 1311: MOVR_I	movre	%r20, 0x1, %r24
	.word 0xf53d4000  ! 1312: STDF_R	std	%f26, [%r0, %r21]
	setx	data_start_2, %g1, %r17
	.word 0xf234a08b  ! 1316: STH_I	sth	%r25, [%r18 + 0x008b]
	.word 0xf635e0c0  ! 1317: STH_I	sth	%r27, [%r23 + 0x00c0]
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c8000  ! 1319: STDF_R	std	%f29, [%r0, %r18]
	.word 0xbd504000  ! 1321: RDPR_TNPC	<illegal instruction>
	.word 0xb3518000  ! 1323: RDPR_PSTATE	<illegal instruction>
	.word 0xfc3421f1  ! 1327: STH_I	sth	%r30, [%r16 + 0x01f1]
	.word 0xf635e1ff  ! 1331: STH_I	sth	%r27, [%r23 + 0x01ff]
	.word 0xbb518000  ! 1332: RDPR_PSTATE	<illegal instruction>
	.word 0xbf480000  ! 1335: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf425e1e6  ! 1337: STW_I	stw	%r26, [%r23 + 0x01e6]
	setx	data_start_5, %g1, %r20
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 1344: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r22
	.word 0xfa344000  ! 1348: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf43c0000  ! 1349: STD_R	std	%r26, [%r16 + %r0]
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6754000  ! 1359: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf2340000  ! 1366: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf274a11a  ! 1371: STX_I	stx	%r25, [%r18 + 0x011a]
	.word 0xfc244000  ! 1375: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf834e004  ! 1379: STH_I	sth	%r28, [%r19 + 0x0004]
	.word 0xf23cc000  ! 1380: STD_R	std	%r25, [%r19 + %r0]
	.word 0xfa254000  ! 1381: STW_R	stw	%r29, [%r21 + %r0]
	setx	0x3033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d4000  ! 1385: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfe2ce09b  ! 1391: STB_I	stb	%r31, [%r19 + 0x009b]
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2d6001  ! 1395: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xb3510000  ! 1396: RDPR_TICK	<illegal instruction>
	.word 0xf03c8000  ! 1398: STD_R	std	%r24, [%r18 + %r0]
	.word 0xfd3ca13d  ! 1400: STDF_I	std	%f30, [0x013d, %r18]
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24a15d  ! 1408: STW_I	stw	%r31, [%r18 + 0x015d]
	.word 0xbd510000  ! 1410: RDPR_TICK	<illegal instruction>
	.word 0xb5510000  ! 1411: RDPR_TICK	<illegal instruction>
	.word 0xb6454000  ! 1413: ADDC_R	addc 	%r21, %r0, %r27
	.word 0x819560a3  ! 1414: WRPR_TPC_I	wrpr	%r21, 0x00a3, %tpc
	.word 0xff3ca184  ! 1416: STDF_I	std	%f31, [0x0184, %r18]
	.word 0xfe748000  ! 1419: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xb83c20e9  ! 1420: XNOR_I	xnor 	%r16, 0x00e9, %r28
	.word 0xfe2c0000  ! 1421: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xbf3cc000  ! 1424: SRA_R	sra 	%r19, %r0, %r31
	.word 0xfc3d608b  ! 1428: STD_I	std	%r30, [%r21 + 0x008b]
	.word 0xb08420cd  ! 1429: ADDcc_I	addcc 	%r16, 0x00cd, %r24
	.word 0x85952122  ! 1431: WRPR_TSTATE_I	wrpr	%r20, 0x0122, %tstate
	.word 0xb934b001  ! 1434: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xf43d60e1  ! 1436: STD_I	std	%r26, [%r21 + 0x00e1]
	.word 0xbb480000  ! 1440: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf4758000  ! 1441: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbc1d4000  ! 1442: XOR_R	xor 	%r21, %r0, %r30
	setx	data_start_0, %g1, %r16
	.word 0xb37d0400  ! 1448: MOVR_R	movre	%r20, %r0, %r25
	.word 0xb751c000  ! 1449: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1451: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf93c0000  ! 1454: STDF_R	std	%f28, [%r0, %r16]
	.word 0xb5510000  ! 1458: RDPR_TICK	rdpr	%tick, %r26
	.word 0x8795a06e  ! 1461: WRPR_TT_I	wrpr	%r22, 0x006e, %tt
	.word 0x8d9460e2  ! 1462: WRPR_PSTATE_I	wrpr	%r17, 0x00e2, %pstate
	.word 0xf624202e  ! 1464: STW_I	stw	%r27, [%r16 + 0x002e]
	.word 0xfa3c4000  ! 1471: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf83460b3  ! 1472: STH_I	sth	%r28, [%r17 + 0x00b3]
	.word 0xb1540000  ! 1475: RDPR_GL	rdpr	%-, %r24
	.word 0xf035a0ab  ! 1478: STH_I	sth	%r24, [%r22 + 0x00ab]
	.word 0xf874a1a1  ! 1479: STX_I	stx	%r28, [%r18 + 0x01a1]
	ta	T_CHANGE_HPRIV
	.word 0x81982819  ! 1480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0819, %hpstate
	.word 0xf53c8000  ! 1484: STDF_R	std	%f26, [%r0, %r18]
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x7, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1489: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 1497: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xfc3c60d5  ! 1498: STD_I	std	%r30, [%r17 + 0x00d5]
	.word 0xff3ca1e5  ! 1499: STDF_I	std	%f31, [0x01e5, %r18]
	.word 0xf0754000  ! 1500: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xb5500000  ! 1501: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfa3cc000  ! 1506: STD_R	std	%r29, [%r19 + %r0]
	.word 0xfa3d0000  ! 1508: STD_R	std	%r29, [%r20 + %r0]
	.word 0xb29d0000  ! 1510: XORcc_R	xorcc 	%r20, %r0, %r25
	setx	data_start_3, %g1, %r17
	.word 0xfe244000  ! 1515: STW_R	stw	%r31, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b89  ! 1517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b89, %hpstate
	.word 0xfc25e175  ! 1524: STW_I	stw	%r30, [%r23 + 0x0175]
	.word 0xbd500000  ! 1525: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf03da061  ! 1526: STD_I	std	%r24, [%r22 + 0x0061]
	.word 0xfc24e070  ! 1529: STW_I	stw	%r30, [%r19 + 0x0070]
	.word 0xfc2461c2  ! 1531: STW_I	stw	%r30, [%r17 + 0x01c2]
	.word 0xf8258000  ! 1532: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfc3c4000  ! 1533: STD_R	std	%r30, [%r17 + %r0]
	.word 0xfa34e102  ! 1534: STH_I	sth	%r29, [%r19 + 0x0102]
	.word 0xfc2dc000  ! 1543: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xff3d8000  ! 1547: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf43c604d  ! 1548: STD_I	std	%r26, [%r17 + 0x004d]
	.word 0xfa2ca008  ! 1549: STB_I	stb	%r29, [%r18 + 0x0008]
	mov	1, %r12
	.word 0x8f932000  ! 1553: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_0, %g1, %r20
	.word 0xfa756152  ! 1555: STX_I	stx	%r29, [%r21 + 0x0152]
	.word 0xbd51c000  ! 1556: RDPR_TL	rdpr	%tl, %r30
	.word 0xb4a52177  ! 1561: SUBcc_I	subcc 	%r20, 0x0177, %r26
	.word 0xfe356139  ! 1564: STH_I	sth	%r31, [%r21 + 0x0139]
	.word 0xf635c000  ! 1565: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xbf510000  ! 1567: RDPR_TICK	<illegal instruction>
	.word 0xf33dc000  ! 1569: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf53c0000  ! 1571: STDF_R	std	%f26, [%r0, %r16]
	.word 0xf075c000  ! 1572: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf87460a9  ! 1573: STX_I	stx	%r28, [%r17 + 0x00a9]
	.word 0xf62c21c9  ! 1576: STB_I	stb	%r27, [%r16 + 0x01c9]
	.word 0xb350c000  ! 1580: RDPR_TT	<illegal instruction>
	.word 0xf22c2097  ! 1584: STB_I	stb	%r25, [%r16 + 0x0097]
	.word 0x8595e01f  ! 1586: WRPR_TSTATE_I	wrpr	%r23, 0x001f, %tstate
	.word 0xb8b5e169  ! 1589: SUBCcc_I	orncc 	%r23, 0x0169, %r28
	.word 0xfc3d0000  ! 1590: STD_R	std	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb2c1000  ! 1597: SLLX_R	sllx	%r16, %r0, %r29
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa240000  ! 1600: STW_R	stw	%r29, [%r16 + %r0]
	setx	data_start_1, %g1, %r18
	.word 0xb1510000  ! 1602: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf73d219e  ! 1604: STDF_I	std	%f27, [0x019e, %r20]
	.word 0xf42da112  ! 1606: STB_I	stb	%r26, [%r22 + 0x0112]
	.word 0xb5359000  ! 1611: SRLX_R	srlx	%r22, %r0, %r26
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c6038  ! 1615: STB_I	stb	%r24, [%r17 + 0x0038]
	.word 0x8994e199  ! 1620: WRPR_TICK_I	wrpr	%r19, 0x0199, %tick
	.word 0xf62de1d1  ! 1621: STB_I	stb	%r27, [%r23 + 0x01d1]
	.word 0xbf51c000  ! 1622: RDPR_TL	rdpr	%tl, %r31
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 1627: RDPR_GL	rdpr	%-, %r30
	.word 0xf4744000  ! 1629: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xfe25e054  ! 1633: STW_I	stw	%r31, [%r23 + 0x0054]
	.word 0xbab4a01b  ! 1634: SUBCcc_I	orncc 	%r18, 0x001b, %r29
	.word 0xb9504000  ! 1638: RDPR_TNPC	<illegal instruction>
	.word 0xfa340000  ! 1641: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf82c0000  ! 1642: STB_R	stb	%r28, [%r16 + %r0]
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d8000  ! 1646: STD_R	std	%r27, [%r22 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 1648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9510000  ! 1651: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf23d2089  ! 1652: STD_I	std	%r25, [%r20 + 0x0089]
	.word 0xfe356170  ! 1654: STH_I	sth	%r31, [%r21 + 0x0170]
	.word 0xf474e144  ! 1655: STX_I	stx	%r26, [%r19 + 0x0144]
	.word 0xfa75e1c2  ! 1656: STX_I	stx	%r29, [%r23 + 0x01c2]
	.word 0xfc2cc000  ! 1657: STB_R	stb	%r30, [%r19 + %r0]
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3d21eb  ! 1662: STDF_I	std	%f30, [0x01eb, %r20]
	.word 0xb7510000  ! 1665: RDPR_TICK	<illegal instruction>
	.word 0xbf3de001  ! 1666: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xfc744000  ! 1671: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xf53cc000  ! 1672: STDF_R	std	%f26, [%r0, %r19]
	.word 0xb42c0000  ! 1673: ANDN_R	andn 	%r16, %r0, %r26
	.word 0xf43da1fc  ! 1678: STD_I	std	%r26, [%r22 + 0x01fc]
	ta	T_CHANGE_HPRIV
	.word 0x81983819  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1819, %hpstate
	.word 0xbca50000  ! 1682: SUBcc_R	subcc 	%r20, %r0, %r30
	.word 0xf834e1de  ! 1683: STH_I	sth	%r28, [%r19 + 0x01de]
	.word 0xf874c000  ! 1687: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf6750000  ! 1690: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xfb3d20c9  ! 1695: STDF_I	std	%f29, [0x00c9, %r20]
	.word 0xf6254000  ! 1698: STW_R	stw	%r27, [%r21 + %r0]
	setx	0x20003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 1700: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb4bcc000  ! 1701: XNORcc_R	xnorcc 	%r19, %r0, %r26
	.word 0xfa2de0e6  ! 1703: STB_I	stb	%r29, [%r23 + 0x00e6]
	.word 0xf23da1e4  ! 1704: STD_I	std	%r25, [%r22 + 0x01e4]
	.word 0xf2758000  ! 1706: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf6248000  ! 1709: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xfc2d8000  ! 1710: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb9643801  ! 1711: MOVcc_I	<illegal instruction>
	.word 0xf434e192  ! 1713: STH_I	sth	%r26, [%r19 + 0x0192]
	.word 0xf025c000  ! 1715: STW_R	stw	%r24, [%r23 + %r0]
	setx	0x3020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c4000  ! 1723: STDF_R	std	%f24, [%r0, %r17]
	.word 0x859520d4  ! 1724: WRPR_TSTATE_I	wrpr	%r20, 0x00d4, %tstate
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73dc000  ! 1732: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf074c000  ! 1734: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf43c0000  ! 1735: STD_R	std	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819839cb  ! 1743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19cb, %hpstate
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e1e5  ! 1749: WRPR_TPC_I	wrpr	%r23, 0x01e5, %tpc
	.word 0xfa252187  ! 1750: STW_I	stw	%r29, [%r20 + 0x0187]
	.word 0x9195e068  ! 1752: WRPR_PIL_I	wrpr	%r23, 0x0068, %pil
	.word 0x9194e069  ! 1754: WRPR_PIL_I	wrpr	%r19, 0x0069, %pil
	.word 0xf23ca09b  ! 1755: STD_I	std	%r25, [%r18 + 0x009b]
	.word 0xf635215c  ! 1759: STH_I	sth	%r27, [%r20 + 0x015c]
	.word 0xbd520000  ! 1760: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf33ca069  ! 1761: STDF_I	std	%f25, [0x0069, %r18]
	.word 0xb9518000  ! 1762: RDPR_PSTATE	<illegal instruction>
	.word 0xfd3c6077  ! 1765: STDF_I	std	%f30, [0x0077, %r17]
	.word 0xf83dc000  ! 1766: STD_R	std	%r28, [%r23 + %r0]
	.word 0xfc2d200c  ! 1770: STB_I	stb	%r30, [%r20 + 0x000c]
	.word 0xbb51c000  ! 1771: RDPR_TL	<illegal instruction>
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25615b  ! 1777: STW_I	stw	%r29, [%r21 + 0x015b]
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3de061  ! 1785: STD_I	std	%r30, [%r23 + 0x0061]
	.word 0xf33d0000  ! 1789: STDF_R	std	%f25, [%r0, %r20]
	.word 0xff3c21cc  ! 1791: STDF_I	std	%f31, [0x01cc, %r16]
	.word 0xfa3ce0e4  ! 1795: STD_I	std	%r29, [%r19 + 0x00e4]
	.word 0x819420c1  ! 1798: WRPR_TPC_I	wrpr	%r16, 0x00c1, %tpc
	.word 0xfc2ce003  ! 1799: STB_I	stb	%r30, [%r19 + 0x0003]
	.word 0x9195605f  ! 1800: WRPR_PIL_I	wrpr	%r21, 0x005f, %pil
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e1de  ! 1806: WRPR_TPC_I	wrpr	%r23, 0x01de, %tpc
	.word 0xff3c8000  ! 1808: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf074c000  ! 1811: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xbf520000  ! 1813: RDPR_PIL	rdpr	%pil, %r31
	mov	0, %r14
	.word 0xa193a000  ! 1818: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf835e04a  ! 1821: STH_I	sth	%r28, [%r23 + 0x004a]
	.word 0xb00c6006  ! 1825: AND_I	and 	%r17, 0x0006, %r24
	.word 0xfe240000  ! 1830: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfd3d0000  ! 1831: STDF_R	std	%f30, [%r0, %r20]
	setx	data_start_5, %g1, %r20
	.word 0xfd3d21e9  ! 1835: STDF_I	std	%f30, [0x01e9, %r20]
	.word 0xb3520000  ! 1839: RDPR_PIL	rdpr	%pil, %r25
	.word 0xbb518000  ! 1841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982913  ! 1843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0913, %hpstate
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 1849: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfe2c8000  ! 1851: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf42d20a0  ! 1856: STB_I	stb	%r26, [%r20 + 0x00a0]
	.word 0xfc3420e0  ! 1857: STH_I	sth	%r30, [%r16 + 0x00e0]
	.word 0xf63d4000  ! 1858: STD_R	std	%r27, [%r21 + %r0]
	.word 0xb1518000  ! 1861: RDPR_PSTATE	<illegal instruction>
	.word 0xf834a088  ! 1862: STH_I	sth	%r28, [%r18 + 0x0088]
	.word 0x8594e079  ! 1863: WRPR_TSTATE_I	wrpr	%r19, 0x0079, %tstate
	.word 0xf6254000  ! 1864: STW_R	stw	%r27, [%r21 + %r0]
	setx	data_start_5, %g1, %r23
	.word 0xfa2ce0f0  ! 1869: STB_I	stb	%r29, [%r19 + 0x00f0]
	.word 0x83956032  ! 1871: WRPR_TNPC_I	wrpr	%r21, 0x0032, %tnpc
	.word 0xbeada120  ! 1874: ANDNcc_I	andncc 	%r22, 0x0120, %r31
	.word 0x83946027  ! 1875: WRPR_TNPC_I	wrpr	%r17, 0x0027, %tnpc
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa74e050  ! 1881: STX_I	stx	%r29, [%r19 + 0x0050]
	.word 0xfd3c61fe  ! 1882: STDF_I	std	%f30, [0x01fe, %r17]
	mov	2, %r14
	.word 0xa193a000  ! 1883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r21
	.word 0xba856056  ! 1886: ADDcc_I	addcc 	%r21, 0x0056, %r29
	.word 0xb6b5a07d  ! 1891: ORNcc_I	orncc 	%r22, 0x007d, %r27
	.word 0xfc24c000  ! 1895: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xb0b5a1df  ! 1896: ORNcc_I	orncc 	%r22, 0x01df, %r24
	.word 0xf8242178  ! 1897: STW_I	stw	%r28, [%r16 + 0x0178]
	setx	0x10220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d8000  ! 1899: STD_R	std	%r31, [%r22 + %r0]
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf235618b  ! 1901: STH_I	sth	%r25, [%r21 + 0x018b]
	.word 0xf82d4000  ! 1907: STB_R	stb	%r28, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe748000  ! 1911: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfa75a167  ! 1912: STX_I	stx	%r29, [%r22 + 0x0167]
	.word 0xf67521d0  ! 1914: STX_I	stx	%r27, [%r20 + 0x01d0]
	.word 0xfa2561fd  ! 1915: STW_I	stw	%r29, [%r21 + 0x01fd]
	.word 0xf82d21f7  ! 1919: STB_I	stb	%r28, [%r20 + 0x01f7]
	.word 0xb3540000  ! 1922: RDPR_GL	rdpr	%-, %r25
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 1926: STH_R	sth	%r31, [%r18 + %r0]
	.word 0x8195219f  ! 1928: WRPR_TPC_I	wrpr	%r20, 0x019f, %tpc
	.word 0xfd3c20fd  ! 1931: STDF_I	std	%f30, [0x00fd, %r16]
	.word 0xb37c6401  ! 1932: MOVR_I	movre	%r17, 0x1, %r25
	setx	0x3012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 1938: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf02521b5  ! 1941: STW_I	stw	%r24, [%r20 + 0x01b5]
	setx	0x117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 1950: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xbd51c000  ! 1953: RDPR_TL	<illegal instruction>
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2da065  ! 1961: STB_I	stb	%r31, [%r22 + 0x0065]
	.word 0xb7504000  ! 1965: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 1966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	setx	data_start_1, %g1, %r16
	.word 0xb8450000  ! 1969: ADDC_R	addc 	%r20, %r0, %r28
	.word 0x8d942016  ! 1970: WRPR_PSTATE_I	wrpr	%r16, 0x0016, %pstate
	.word 0x9194a146  ! 1972: WRPR_PIL_I	wrpr	%r18, 0x0146, %pil
	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d206b  ! 1977: STD_I	std	%r29, [%r20 + 0x006b]
	.word 0xf6250000  ! 1978: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xff3c0000  ! 1979: STDF_R	std	%f31, [%r0, %r16]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf475a188  ! 1997: STX_I	stx	%r26, [%r22 + 0x0188]
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42c4000  ! 2004: STB_R	stb	%r26, [%r17 + %r0]
	setx	0x3021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42ca0d8  ! 2009: STB_I	stb	%r26, [%r18 + 0x00d8]
	.word 0xf0758000  ! 2011: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xfc240000  ! 2012: STW_R	stw	%r30, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f09  ! 2015: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f09, %hpstate
	.word 0xf73ca1e6  ! 2021: STDF_I	std	%f27, [0x01e6, %r18]
	setx	data_start_2, %g1, %r23
	.word 0xf2750000  ! 2027: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf62c207c  ! 2029: STB_I	stb	%r27, [%r16 + 0x007c]
	setx	0x335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 2034: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa750000  ! 2037: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xbb518000  ! 2039: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xb7518000  ! 2040: RDPR_PSTATE	<illegal instruction>
	.word 0xfe3561ca  ! 2042: STH_I	sth	%r31, [%r21 + 0x01ca]
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb495a10a  ! 2046: ORcc_I	orcc 	%r22, 0x010a, %r26
	.word 0xf82cc000  ! 2047: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf0350000  ! 2048: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb6850000  ! 2050: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xb2c4c000  ! 2054: ADDCcc_R	addccc 	%r19, %r0, %r25
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82d8000  ! 2059: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf43d4000  ! 2063: STD_R	std	%r26, [%r21 + %r0]
	.word 0xf03d619e  ! 2064: STD_I	std	%r24, [%r21 + 0x019e]
	.word 0xb32c0000  ! 2065: SLL_R	sll 	%r16, %r0, %r25
	.word 0x8794e0b6  ! 2068: WRPR_TT_I	wrpr	%r19, 0x00b6, %tt
	.word 0xb7500000  ! 2071: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf43cc000  ! 2074: STD_R	std	%r26, [%r19 + %r0]
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 2079: RDPR_PSTATE	<illegal instruction>
	.word 0xfe344000  ! 2080: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf03dc000  ! 2083: STD_R	std	%r24, [%r23 + %r0]
	.word 0xfa740000  ! 2084: STX_R	stx	%r29, [%r16 + %r0]
	setx	0x30305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22da08b  ! 2088: STB_I	stb	%r25, [%r22 + 0x008b]
	setx	0x30208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919521e2  ! 2095: WRPR_PIL_I	wrpr	%r20, 0x01e2, %pil
	.word 0xfd3d21ac  ! 2096: STDF_I	std	%f30, [0x01ac, %r20]
	.word 0xfc2dc000  ! 2097: STB_R	stb	%r30, [%r23 + %r0]
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf235219e  ! 2107: STH_I	sth	%r25, [%r20 + 0x019e]
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2dc000  ! 2113: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf624e006  ! 2114: STW_I	stw	%r27, [%r19 + 0x0006]
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 2122: RDPR_TL	rdpr	%tl, %r25
	.word 0x8d95e080  ! 2125: WRPR_PSTATE_I	wrpr	%r23, 0x0080, %pstate
	.word 0xf82ce007  ! 2128: STB_I	stb	%r28, [%r19 + 0x0007]
	.word 0xb751c000  ! 2132: RDPR_TL	rdpr	%tl, %r27
	setx	data_start_2, %g1, %r20
	.word 0xf03dc000  ! 2137: STD_R	std	%r24, [%r23 + %r0]
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33d2154  ! 2144: STDF_I	std	%f25, [0x0154, %r20]
	.word 0xf8750000  ! 2150: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xf73ce0c9  ! 2151: STDF_I	std	%f27, [0x00c9, %r19]
	.word 0xfa2ca159  ! 2152: STB_I	stb	%r29, [%r18 + 0x0159]
	.word 0xf62ca170  ! 2154: STB_I	stb	%r27, [%r18 + 0x0170]
	.word 0xf62d209b  ! 2156: STB_I	stb	%r27, [%r20 + 0x009b]
	.word 0xf035a15c  ! 2158: STH_I	sth	%r24, [%r22 + 0x015c]
	.word 0xb42d20c8  ! 2161: ANDN_I	andn 	%r20, 0x00c8, %r26
	.word 0xbf504000  ! 2164: RDPR_TNPC	<illegal instruction>
	.word 0xfa3421b4  ! 2167: STH_I	sth	%r29, [%r16 + 0x01b4]
	.word 0xfc7460d8  ! 2168: STX_I	stx	%r30, [%r17 + 0x00d8]
	.word 0x819460a0  ! 2169: WRPR_TPC_I	wrpr	%r17, 0x00a0, %tpc
	.word 0xf73d61d0  ! 2170: STDF_I	std	%f27, [0x01d0, %r21]
	.word 0xf82d2038  ! 2171: STB_I	stb	%r28, [%r20 + 0x0038]
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13ce12e  ! 2174: STDF_I	std	%f24, [0x012e, %r19]
	.word 0xfc74c000  ! 2178: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xfc348000  ! 2180: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf33da106  ! 2185: STDF_I	std	%f25, [0x0106, %r22]
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d61ef  ! 2189: STD_I	std	%r27, [%r21 + 0x01ef]
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x83952173  ! 2193: WRPR_TNPC_I	wrpr	%r20, 0x0173, %tnpc
	.word 0xf075c000  ! 2194: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xfc3d202b  ! 2197: STD_I	std	%r30, [%r20 + 0x002b]
	.word 0xf33c0000  ! 2198: STDF_R	std	%f25, [%r0, %r16]
	mov	2, %r14
	.word 0xa193a000  ! 2204: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75a01b  ! 2207: STX_I	stx	%r30, [%r22 + 0x001b]
	.word 0xba95a081  ! 2211: ORcc_I	orcc 	%r22, 0x0081, %r29
	.word 0xf235614f  ! 2218: STH_I	sth	%r25, [%r21 + 0x014f]
	.word 0xfa250000  ! 2223: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xb1540000  ! 2224: RDPR_GL	rdpr	%-, %r24
	.word 0xf93c61b5  ! 2227: STDF_I	std	%f28, [0x01b5, %r17]
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbac4e145  ! 2232: ADDCcc_I	addccc 	%r19, 0x0145, %r29
	.word 0xf0742139  ! 2233: STX_I	stx	%r24, [%r16 + 0x0139]
	.word 0xfc35c000  ! 2234: STH_R	sth	%r30, [%r23 + %r0]
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfa350000  ! 2239: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf4754000  ! 2240: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xfe2461b7  ! 2242: STW_I	stw	%r31, [%r17 + 0x01b7]
	.word 0xf82d2149  ! 2244: STB_I	stb	%r28, [%r20 + 0x0149]
	.word 0xf82ce0e5  ! 2245: STB_I	stb	%r28, [%r19 + 0x00e5]
	.word 0xf0354000  ! 2247: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf02ce01d  ! 2248: STB_I	stb	%r24, [%r19 + 0x001d]
	.word 0xb9500000  ! 2252: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f8b  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8b, %hpstate
	.word 0xbaa4a059  ! 2256: SUBcc_I	subcc 	%r18, 0x0059, %r29
	.word 0x8195a1fe  ! 2257: WRPR_TPC_I	wrpr	%r22, 0x01fe, %tpc
	.word 0xfc3c214d  ! 2258: STD_I	std	%r30, [%r16 + 0x014d]
	.word 0xfe2c0000  ! 2261: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xfc240000  ! 2262: STW_R	stw	%r30, [%r16 + %r0]
	.word 0x9194a1b5  ! 2265: WRPR_PIL_I	wrpr	%r18, 0x01b5, %pil
	.word 0xf4354000  ! 2266: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf53d20c5  ! 2272: STDF_I	std	%f26, [0x00c5, %r20]
	.word 0xfe754000  ! 2273: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf4344000  ! 2284: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xb32c5000  ! 2287: SLLX_R	sllx	%r17, %r0, %r25
	.word 0x8195e03b  ! 2288: WRPR_TPC_I	wrpr	%r23, 0x003b, %tpc
	.word 0xfa3c6128  ! 2289: STD_I	std	%r29, [%r17 + 0x0128]
	.word 0xbcb4c000  ! 2295: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xb151c000  ! 2296: RDPR_TL	rdpr	%tl, %r24
	.word 0xbcbc0000  ! 2297: XNORcc_R	xnorcc 	%r16, %r0, %r30
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946098  ! 2300: WRPR_PSTATE_I	wrpr	%r17, 0x0098, %pstate
	.word 0xfe35e1b9  ! 2301: STH_I	sth	%r31, [%r23 + 0x01b9]
	.word 0xfc3d4000  ! 2307: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf8258000  ! 2308: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xf33c6096  ! 2309: STDF_I	std	%f25, [0x0096, %r17]
	setx	data_start_7, %g1, %r19
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c4000  ! 2318: STDF_R	std	%f29, [%r0, %r17]
	setx	0x3030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87952138  ! 2322: WRPR_TT_I	wrpr	%r20, 0x0138, %tt
	.word 0xb551c000  ! 2323: RDPR_TL	rdpr	%tl, %r26
	.word 0xbe8da0cb  ! 2326: ANDcc_I	andcc 	%r22, 0x00cb, %r31
	.word 0xbe24c000  ! 2327: SUB_R	sub 	%r19, %r0, %r31
	.word 0xbc85c000  ! 2330: ADDcc_R	addcc 	%r23, %r0, %r30
	.word 0xf13c6150  ! 2331: STDF_I	std	%f24, [0x0150, %r17]
	.word 0xfe2da094  ! 2333: STB_I	stb	%r31, [%r22 + 0x0094]
	ta	T_CHANGE_HPRIV
	.word 0x81983d43  ! 2335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d43, %hpstate
	.word 0xb7508000  ! 2336: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb41561f2  ! 2346: OR_I	or 	%r21, 0x01f2, %r26
	.word 0xb68de1d1  ! 2350: ANDcc_I	andcc 	%r23, 0x01d1, %r27
	.word 0xfc2560b0  ! 2353: STW_I	stw	%r30, [%r21 + 0x00b0]
	.word 0xfa34e127  ! 2356: STH_I	sth	%r29, [%r19 + 0x0127]
	.word 0xf6342150  ! 2357: STH_I	sth	%r27, [%r16 + 0x0150]
	mov	0, %r12
	.word 0x8f932000  ! 2359: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc358000  ! 2362: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfb3d4000  ! 2363: STDF_R	std	%f29, [%r0, %r21]
	.word 0x8395e0cc  ! 2364: WRPR_TNPC_I	wrpr	%r23, 0x00cc, %tnpc
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0740000  ! 2366: STX_R	stx	%r24, [%r16 + %r0]
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 2370: RDPR_TICK	rdpr	%tick, %r24
	.word 0xbc248000  ! 2372: SUB_R	sub 	%r18, %r0, %r30
	.word 0xb035e17b  ! 2374: SUBC_I	orn 	%r23, 0x017b, %r24
	setx	0x3012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3c0000  ! 2378: STD_R	std	%r30, [%r16 + %r0]
	.word 0xfa34e05a  ! 2379: STH_I	sth	%r29, [%r19 + 0x005a]
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02d8000  ! 2386: STB_R	stb	%r24, [%r22 + %r0]
	.word 0x8d94a0d6  ! 2388: WRPR_PSTATE_I	wrpr	%r18, 0x00d6, %pstate
	.word 0xfa3ce08b  ! 2389: STD_I	std	%r29, [%r19 + 0x008b]
	.word 0xf13dc000  ! 2399: STDF_R	std	%f24, [%r0, %r23]
	.word 0xb29ce1e4  ! 2409: XORcc_I	xorcc 	%r19, 0x01e4, %r25
	.word 0xb80c61de  ! 2411: AND_I	and 	%r17, 0x01de, %r28
	.word 0xf42d4000  ! 2412: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xff3ca084  ! 2413: STDF_I	std	%f31, [0x0084, %r18]
	.word 0xff3c0000  ! 2416: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb29d200b  ! 2420: XORcc_I	xorcc 	%r20, 0x000b, %r25
	.word 0xb6a5c000  ! 2425: SUBcc_R	subcc 	%r23, %r0, %r27
	.word 0x8595619f  ! 2426: WRPR_TSTATE_I	wrpr	%r21, 0x019f, %tstate
	.word 0xb9510000  ! 2427: RDPR_TICK	rdpr	%tick, %r28
	.word 0xff3ce137  ! 2429: STDF_I	std	%f31, [0x0137, %r19]
	.word 0xb29d4000  ! 2433: XORcc_R	xorcc 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983893  ! 2436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1893, %hpstate
	setx	data_start_6, %g1, %r19
	.word 0xfc3d4000  ! 2442: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf53d217b  ! 2443: STDF_I	std	%f26, [0x017b, %r20]
	.word 0xfa25e195  ! 2444: STW_I	stw	%r29, [%r23 + 0x0195]
	.word 0xf474c000  ! 2448: STX_R	stx	%r26, [%r19 + %r0]
	setx	data_start_4, %g1, %r17
	.word 0xb4ac202c  ! 2455: ANDNcc_I	andncc 	%r16, 0x002c, %r26
	.word 0x9194e135  ! 2456: WRPR_PIL_I	wrpr	%r19, 0x0135, %pil
	.word 0xf42d601c  ! 2458: STB_I	stb	%r26, [%r21 + 0x001c]
	.word 0xb1480000  ! 2460: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf33c4000  ! 2461: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf275e0d7  ! 2462: STX_I	stx	%r25, [%r23 + 0x00d7]
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83cc000  ! 2470: STD_R	std	%r28, [%r19 + %r0]
	.word 0xfa752114  ! 2472: STX_I	stx	%r29, [%r20 + 0x0114]
	.word 0xbcc4a0fc  ! 2476: ADDCcc_I	addccc 	%r18, 0x00fc, %r30
	.word 0xf6752050  ! 2478: STX_I	stx	%r27, [%r20 + 0x0050]
	.word 0xb8b44000  ! 2479: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0xbd500000  ! 2485: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xfc350000  ! 2486: STH_R	sth	%r30, [%r20 + %r0]
	.word 0x8795e0ad  ! 2487: WRPR_TT_I	wrpr	%r23, 0x00ad, %tt
	.word 0xb351c000  ! 2488: RDPR_TL	rdpr	%tl, %r25
	setx	0x30307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c2122  ! 2490: STB_I	stb	%r24, [%r16 + 0x0122]
	.word 0xb9500000  ! 2491: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 2493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	mov	1, %r14
	.word 0xa193a000  ! 2499: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 2501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0xfe240000  ! 2504: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfa350000  ! 2505: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf83c6195  ! 2508: STD_I	std	%r28, [%r17 + 0x0195]
	.word 0xf73cc000  ! 2509: STDF_R	std	%f27, [%r0, %r19]
	.word 0xfe246142  ! 2510: STW_I	stw	%r31, [%r17 + 0x0142]
	.word 0xf93d0000  ! 2514: STDF_R	std	%f28, [%r0, %r20]
	.word 0x87956081  ! 2515: WRPR_TT_I	wrpr	%r21, 0x0081, %tt
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf075c000  ! 2518: STX_R	stx	%r24, [%r23 + %r0]
	.word 0x8d94a149  ! 2519: WRPR_PSTATE_I	wrpr	%r18, 0x0149, %pstate
	.word 0xf275a14e  ! 2520: STX_I	stx	%r25, [%r22 + 0x014e]
	.word 0xf82c8000  ! 2523: STB_R	stb	%r28, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 2525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	.word 0xfc7561ea  ! 2526: STX_I	stx	%r30, [%r21 + 0x01ea]
	.word 0xbca40000  ! 2530: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0x8794e1c0  ! 2533: WRPR_TT_I	wrpr	%r19, 0x01c0, %tt
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53d615a  ! 2535: STDF_I	std	%f26, [0x015a, %r21]
	.word 0xb751c000  ! 2536: RDPR_TL	rdpr	%tl, %r27
	.word 0x8594a1c5  ! 2538: WRPR_TSTATE_I	wrpr	%r18, 0x01c5, %tstate
	.word 0xf02560b9  ! 2540: STW_I	stw	%r24, [%r21 + 0x00b9]
	.word 0xbb480000  ! 2541: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf2250000  ! 2545: STW_R	stw	%r25, [%r20 + %r0]
	.word 0x8594e01f  ! 2547: WRPR_TSTATE_I	wrpr	%r19, 0x001f, %tstate
	.word 0xfc2c8000  ! 2550: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xfe2da00d  ! 2551: STB_I	stb	%r31, [%r22 + 0x000d]
	.word 0xfe7521ee  ! 2558: STX_I	stx	%r31, [%r20 + 0x01ee]
	.word 0xff3c20c0  ! 2566: STDF_I	std	%f31, [0x00c0, %r16]
	ta	T_CHANGE_HPRIV
	.word 0x81982cdb  ! 2567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdb, %hpstate
	.word 0xf22d0000  ! 2568: STB_R	stb	%r25, [%r20 + %r0]
	.word 0x8795216c  ! 2569: WRPR_TT_I	wrpr	%r20, 0x016c, %tt
	.word 0xf62c4000  ! 2571: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf8358000  ! 2572: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xb6054000  ! 2574: ADD_R	add 	%r21, %r0, %r27
	setx	0x3b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d0000  ! 2577: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf4256098  ! 2578: STW_I	stw	%r26, [%r21 + 0x0098]
	.word 0xb5540000  ! 2583: RDPR_GL	rdpr	%-, %r26
	.word 0xb93d1000  ! 2584: SRAX_R	srax	%r20, %r0, %r28
	.word 0xbf520000  ! 2585: RDPR_PIL	<illegal instruction>
	.word 0xfe3d611a  ! 2587: STD_I	std	%r31, [%r21 + 0x011a]
	.word 0xb7643801  ! 2588: MOVcc_I	<illegal instruction>
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc254000  ! 2593: STW_R	stw	%r30, [%r21 + %r0]
	.word 0x9194e13c  ! 2594: WRPR_PIL_I	wrpr	%r19, 0x013c, %pil
	.word 0xbf50c000  ! 2596: RDPR_TT	rdpr	%tt, %r31
	.word 0xf42d6089  ! 2598: STB_I	stb	%r26, [%r21 + 0x0089]
	mov	0, %r14
	.word 0xa193a000  ! 2600: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_0, %g1, %r20
	.word 0xbd504000  ! 2605: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbe352011  ! 2606: SUBC_I	orn 	%r20, 0x0011, %r31
	.word 0xf875c000  ! 2607: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xb615a125  ! 2608: OR_I	or 	%r22, 0x0125, %r27
	.word 0xbb508000  ! 2613: RDPR_TSTATE	<illegal instruction>
	.word 0xf22de0eb  ! 2614: STB_I	stb	%r25, [%r23 + 0x00eb]
	.word 0xf2256102  ! 2619: STW_I	stw	%r25, [%r21 + 0x0102]
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c8000  ! 2621: STDF_R	std	%f24, [%r0, %r18]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982b89  ! 2626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b89, %hpstate
	.word 0x85952142  ! 2628: WRPR_TSTATE_I	wrpr	%r20, 0x0142, %tstate
	.word 0xf4348000  ! 2629: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb7518000  ! 2630: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xfa3c8000  ! 2636: STD_R	std	%r29, [%r18 + %r0]
	.word 0xb1540000  ! 2637: RDPR_GL	<illegal instruction>
	.word 0xf4342182  ! 2644: STH_I	sth	%r26, [%r16 + 0x0182]
	.word 0xf23d8000  ! 2645: STD_R	std	%r25, [%r22 + %r0]
	.word 0xfe3d8000  ! 2647: STD_R	std	%r31, [%r22 + %r0]
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 2651: RDPR_TT	<illegal instruction>
	.word 0xfe2c6132  ! 2655: STB_I	stb	%r31, [%r17 + 0x0132]
	.word 0xf8358000  ! 2659: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xfa2c0000  ! 2672: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfe34e0c6  ! 2675: STH_I	sth	%r31, [%r19 + 0x00c6]
	.word 0xf6354000  ! 2679: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xbf508000  ! 2680: RDPR_TSTATE	<illegal instruction>
	.word 0xf03ca0e2  ! 2682: STD_I	std	%r24, [%r18 + 0x00e2]
	setx	data_start_5, %g1, %r19
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75c000  ! 2690: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xf02d0000  ! 2697: STB_R	stb	%r24, [%r20 + %r0]
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3cc000  ! 2705: STDF_R	std	%f29, [%r0, %r19]
	.word 0xbc9dc000  ! 2706: XORcc_R	xorcc 	%r23, %r0, %r30
	.word 0xb350c000  ! 2713: RDPR_TT	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2716: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf540000  ! 2725: RDPR_GL	rdpr	%-, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982a93  ! 2726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 2728: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfc3c0000  ! 2729: STD_R	std	%r30, [%r16 + %r0]
	.word 0x8994a0e7  ! 2732: WRPR_TICK_I	wrpr	%r18, 0x00e7, %tick
	.word 0x85946163  ! 2734: WRPR_TSTATE_I	wrpr	%r17, 0x0163, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 2736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	.word 0xb2b48000  ! 2742: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xbd508000  ! 2743: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xbc9d6026  ! 2745: XORcc_I	xorcc 	%r21, 0x0026, %r30
	.word 0xfe2c8000  ! 2748: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf024e1d7  ! 2750: STW_I	stw	%r24, [%r19 + 0x01d7]
	.word 0xb1508000  ! 2751: RDPR_TSTATE	<illegal instruction>
	.word 0xfa344000  ! 2752: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb2b461ea  ! 2754: SUBCcc_I	orncc 	%r17, 0x01ea, %r25
	.word 0x9195a070  ! 2756: WRPR_PIL_I	wrpr	%r22, 0x0070, %pil
	.word 0xfc352132  ! 2758: STH_I	sth	%r30, [%r20 + 0x0132]
	.word 0xf82c21df  ! 2759: STB_I	stb	%r28, [%r16 + 0x01df]
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf234e1f4  ! 2761: STH_I	sth	%r25, [%r19 + 0x01f4]
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 2763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xfb3da098  ! 2765: STDF_I	std	%f29, [0x0098, %r22]
	.word 0x91946131  ! 2767: WRPR_PIL_I	wrpr	%r17, 0x0131, %pil
	.word 0xf4248000  ! 2772: STW_R	stw	%r26, [%r18 + %r0]
	.word 0x8594219d  ! 2773: WRPR_TSTATE_I	wrpr	%r16, 0x019d, %tstate
	.word 0xf63d0000  ! 2775: STD_R	std	%r27, [%r20 + %r0]
	.word 0xbb504000  ! 2776: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf835e1d8  ! 2777: STH_I	sth	%r28, [%r23 + 0x01d8]
	.word 0xf33c8000  ! 2782: STDF_R	std	%f25, [%r0, %r18]
	.word 0xfe754000  ! 2788: STX_R	stx	%r31, [%r21 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 2789: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc3c6117  ! 2792: STD_I	std	%r30, [%r17 + 0x0117]
	.word 0xf87520d0  ! 2793: STX_I	stx	%r28, [%r20 + 0x00d0]
	.word 0xb88ce052  ! 2794: ANDcc_I	andcc 	%r19, 0x0052, %r28
	.word 0xfa3de15d  ! 2795: STD_I	std	%r29, [%r23 + 0x015d]
	setx	data_start_2, %g1, %r16
	.word 0xf42d2143  ! 2801: STB_I	stb	%r26, [%r20 + 0x0143]
	.word 0xf73c2185  ! 2804: STDF_I	std	%f27, [0x0185, %r16]
	setx	data_start_6, %g1, %r18
	.word 0xfe3ce0c9  ! 2808: STD_I	std	%r31, [%r19 + 0x00c9]
	.word 0xf4358000  ! 2812: STH_R	sth	%r26, [%r22 + %r0]
	.word 0x8d952167  ! 2813: WRPR_PSTATE_I	wrpr	%r20, 0x0167, %pstate
	.word 0xf4348000  ! 2814: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xf42c2157  ! 2815: STB_I	stb	%r26, [%r16 + 0x0157]
	.word 0x8194209e  ! 2816: WRPR_TPC_I	wrpr	%r16, 0x009e, %tpc
	.word 0xb8c4c000  ! 2818: ADDCcc_R	addccc 	%r19, %r0, %r28
	.word 0xff3c4000  ! 2819: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf13c211d  ! 2820: STDF_I	std	%f24, [0x011d, %r16]
	setx	data_start_2, %g1, %r18
	.word 0xfc25608d  ! 2824: STW_I	stw	%r30, [%r21 + 0x008d]
	.word 0xfa342159  ! 2826: STH_I	sth	%r29, [%r16 + 0x0159]
	.word 0xb3510000  ! 2828: RDPR_TICK	rdpr	%tick, %r25
	.word 0xbb500000  ! 2829: RDPR_TPC	<illegal instruction>
	.word 0xf22561e9  ! 2830: STW_I	stw	%r25, [%r21 + 0x01e9]
	.word 0xf224e0dc  ! 2831: STW_I	stw	%r25, [%r19 + 0x00dc]
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c0000  ! 2840: STDF_R	std	%f31, [%r0, %r16]
	.word 0xf43420f9  ! 2841: STH_I	sth	%r26, [%r16 + 0x00f9]
	.word 0xfa744000  ! 2843: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf474604c  ! 2846: STX_I	stx	%r26, [%r17 + 0x004c]
	.word 0xf2348000  ! 2848: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xf83dc000  ! 2855: STD_R	std	%r28, [%r23 + %r0]
	.word 0xbd51c000  ! 2856: RDPR_TL	rdpr	%tl, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe74c000  ! 2863: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb235e002  ! 2865: ORN_I	orn 	%r23, 0x0002, %r25
	.word 0xf82dc000  ! 2866: STB_R	stb	%r28, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983d89  ! 2868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d89, %hpstate
	.word 0xf6340000  ! 2870: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xb0bdc000  ! 2872: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xb3641800  ! 2876: MOVcc_R	<illegal instruction>
	.word 0xf22c21ec  ! 2877: STB_I	stb	%r25, [%r16 + 0x01ec]
	.word 0xf87520e3  ! 2878: STX_I	stx	%r28, [%r20 + 0x00e3]
	.word 0xfa2cc000  ! 2881: STB_R	stb	%r29, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595a128  ! 2884: WRPR_TSTATE_I	wrpr	%r22, 0x0128, %tstate
	.word 0xf63461b4  ! 2886: STH_I	sth	%r27, [%r17 + 0x01b4]
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 2895: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfc35a131  ! 2898: STH_I	sth	%r30, [%r22 + 0x0131]
	mov	2, %r14
	.word 0xa193a000  ! 2899: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9518000  ! 2900: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xbd500000  ! 2901: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r23
	.word 0xb1508000  ! 2903: RDPR_TSTATE	<illegal instruction>
	.word 0xb28d8000  ! 2913: ANDcc_R	andcc 	%r22, %r0, %r25
	.word 0xf674c000  ! 2916: STX_R	stx	%r27, [%r19 + %r0]
	.word 0x8594e075  ! 2918: WRPR_TSTATE_I	wrpr	%r19, 0x0075, %tstate
	.word 0xb7508000  ! 2919: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb8c4e1cc  ! 2924: ADDCcc_I	addccc 	%r19, 0x01cc, %r28
	.word 0xb3520000  ! 2926: RDPR_PIL	<illegal instruction>
	.word 0xf674c000  ! 2928: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xb614a098  ! 2932: OR_I	or 	%r18, 0x0098, %r27
	.word 0xf674e042  ! 2934: STX_I	stx	%r27, [%r19 + 0x0042]
	.word 0x8d94e0d5  ! 2936: WRPR_PSTATE_I	wrpr	%r19, 0x00d5, %pstate
	.word 0x859460ea  ! 2937: WRPR_TSTATE_I	wrpr	%r17, 0x00ea, %tstate
	.word 0xf53dc000  ! 2938: STDF_R	std	%f26, [%r0, %r23]
	.word 0xb1540000  ! 2940: RDPR_GL	rdpr	%-, %r24
	.word 0xfc2c214b  ! 2941: STB_I	stb	%r30, [%r16 + 0x014b]
	setx	data_start_1, %g1, %r20
	.word 0xb9510000  ! 2946: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2947: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb520000  ! 2948: RDPR_PIL	rdpr	%pil, %r29
	.word 0xb6958000  ! 2949: ORcc_R	orcc 	%r22, %r0, %r27
	.word 0xfa34a16c  ! 2955: STH_I	sth	%r29, [%r18 + 0x016c]
	setx	0x2013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 2957: RDPR_TL	rdpr	%tl, %r29
	.word 0xfe35c000  ! 2958: STH_R	sth	%r31, [%r23 + %r0]
	.word 0x8594e134  ! 2959: WRPR_TSTATE_I	wrpr	%r19, 0x0134, %tstate
	.word 0xf83d8000  ! 2960: STD_R	std	%r28, [%r22 + %r0]
	.word 0x89942108  ! 2964: WRPR_TICK_I	wrpr	%r16, 0x0108, %tick
	.word 0xf22c0000  ! 2968: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xbd500000  ! 2969: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xba8d204c  ! 2970: ANDcc_I	andcc 	%r20, 0x004c, %r29
	.word 0xf8758000  ! 2974: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xbcbca150  ! 2975: XNORcc_I	xnorcc 	%r18, 0x0150, %r30
	.word 0x8594603b  ! 2977: WRPR_TSTATE_I	wrpr	%r17, 0x003b, %tstate
	.word 0xf73d0000  ! 2978: STDF_R	std	%f27, [%r0, %r20]
	.word 0xf4754000  ! 2980: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xb3510000  ! 2984: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf824a156  ! 2985: STW_I	stw	%r28, [%r18 + 0x0156]
	.word 0xbf50c000  ! 2986: RDPR_TT	<illegal instruction>
	.word 0xf435205a  ! 2988: STH_I	sth	%r26, [%r20 + 0x005a]
	.word 0xf22521da  ! 2990: STW_I	stw	%r25, [%r20 + 0x01da]
	.word 0xf82460f5  ! 2991: STW_I	stw	%r28, [%r17 + 0x00f5]
	.word 0xbf3dd000  ! 2992: SRAX_R	srax	%r23, %r0, %r31
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 2994: RDPR_PSTATE	<illegal instruction>
	.word 0xf22d8000  ! 2997: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xb0bc0000  ! 2998: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xfc75612a  ! 3000: STX_I	stx	%r30, [%r21 + 0x012a]
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c0000  ! 3005: STB_R	stb	%r30, [%r16 + %r0]
	.word 0x899560ea  ! 3006: WRPR_TICK_I	wrpr	%r21, 0x00ea, %tick
	.word 0xf42d605f  ! 3008: STB_I	stb	%r26, [%r21 + 0x005f]
	.word 0xfa35a12e  ! 3009: STH_I	sth	%r29, [%r22 + 0x012e]
	.word 0xf6348000  ! 3012: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb5518000  ! 3013: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xbb2c2001  ! 3016: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xfd3c4000  ! 3018: STDF_R	std	%f30, [%r0, %r17]
	.word 0xbd50c000  ! 3019: RDPR_TT	<illegal instruction>
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e04c  ! 3021: WRPR_TPC_I	wrpr	%r23, 0x004c, %tpc
	.word 0xf4750000  ! 3025: STX_R	stx	%r26, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983b41  ! 3032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b41, %hpstate
	setx	0x10011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb49d8000  ! 3034: XORcc_R	xorcc 	%r22, %r0, %r26
	.word 0xb8c44000  ! 3035: ADDCcc_R	addccc 	%r17, %r0, %r28
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0242176  ! 3044: STW_I	stw	%r24, [%r16 + 0x0176]
	.word 0xfe34a0b3  ! 3046: STH_I	sth	%r31, [%r18 + 0x00b3]
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3dc000  ! 3049: STD_R	std	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 3054: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xfc2c0000  ! 3058: STB_R	stb	%r30, [%r16 + %r0]
	.word 0x8395a04b  ! 3059: WRPR_TNPC_I	wrpr	%r22, 0x004b, %tnpc
	.word 0xb951c000  ! 3060: RDPR_TL	rdpr	%tl, %r28
	.word 0xf03de091  ! 3063: STD_I	std	%r24, [%r23 + 0x0091]
	.word 0x8594e14d  ! 3070: WRPR_TSTATE_I	wrpr	%r19, 0x014d, %tstate
	.word 0xb5520000  ! 3073: RDPR_PIL	rdpr	%pil, %r26
	.word 0xb9520000  ! 3077: RDPR_PIL	<illegal instruction>
	.word 0xfe2d20d5  ! 3080: STB_I	stb	%r31, [%r20 + 0x00d5]
	.word 0xb5520000  ! 3081: RDPR_PIL	<illegal instruction>
	.word 0xfc352011  ! 3085: STH_I	sth	%r30, [%r20 + 0x0011]
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6756187  ! 3087: STX_I	stx	%r27, [%r21 + 0x0187]
	.word 0xb7504000  ! 3089: RDPR_TNPC	<illegal instruction>
	.word 0xf83d4000  ! 3092: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf6248000  ! 3094: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xbc94a107  ! 3096: ORcc_I	orcc 	%r18, 0x0107, %r30
	.word 0x8795201b  ! 3097: WRPR_TT_I	wrpr	%r20, 0x001b, %tt
	.word 0xb1520000  ! 3099: RDPR_PIL	rdpr	%pil, %r24
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4946064  ! 3103: ORcc_I	orcc 	%r17, 0x0064, %r26
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe242016  ! 3105: STW_I	stw	%r31, [%r16 + 0x0016]
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63dc000  ! 3107: STD_R	std	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 3109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d8000  ! 3112: STD_R	std	%r31, [%r22 + %r0]
	.word 0xb80c20c7  ! 3113: AND_I	and 	%r16, 0x00c7, %r28
	.word 0xf43c4000  ! 3115: STD_R	std	%r26, [%r17 + %r0]
	.word 0xb751c000  ! 3116: RDPR_TL	rdpr	%tl, %r27
	.word 0xfe3d8000  ! 3118: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf034a1f3  ! 3120: STH_I	sth	%r24, [%r18 + 0x01f3]
	.word 0xf4240000  ! 3122: STW_R	stw	%r26, [%r16 + %r0]
	setx	data_start_4, %g1, %r22
	setx	0x2012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 3126: RDPR_TPC	<illegal instruction>
	.word 0xf6348000  ! 3128: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xfa2d8000  ! 3129: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfe2c2174  ! 3130: STB_I	stb	%r31, [%r16 + 0x0174]
	.word 0x91956026  ! 3139: WRPR_PIL_I	wrpr	%r21, 0x0026, %pil
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa348000  ! 3147: STH_R	sth	%r29, [%r18 + %r0]
	.word 0x8595e1cd  ! 3152: WRPR_TSTATE_I	wrpr	%r23, 0x01cd, %tstate
	.word 0xfe74e02f  ! 3153: STX_I	stx	%r31, [%r19 + 0x002f]
	.word 0xf42c8000  ! 3154: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf2750000  ! 3156: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xb1520000  ! 3163: RDPR_PIL	rdpr	%pil, %r24
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33dc000  ! 3166: STDF_R	std	%f25, [%r0, %r23]
	.word 0xfe74c000  ! 3168: STX_R	stx	%r31, [%r19 + %r0]
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82dc000  ! 3172: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xbd508000  ! 3173: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe2461c3  ! 3181: STW_I	stw	%r31, [%r17 + 0x01c3]
	ta	T_CHANGE_HPRIV
	.word 0x81982a8b  ! 3185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8b, %hpstate
	.word 0xfc2c0000  ! 3186: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xbc8ce1ad  ! 3190: ANDcc_I	andcc 	%r19, 0x01ad, %r30
	setx	0x106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc7461dd  ! 3199: STX_I	stx	%r30, [%r17 + 0x01dd]
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d19  ! 3202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d19, %hpstate
	.word 0xfe242105  ! 3203: STW_I	stw	%r31, [%r16 + 0x0105]
	.word 0xf074c000  ! 3205: STX_R	stx	%r24, [%r19 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 3213: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb935e001  ! 3218: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0x8194203e  ! 3219: WRPR_TPC_I	wrpr	%r16, 0x003e, %tpc
	.word 0xf42c4000  ! 3220: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf275a097  ! 3223: STX_I	stx	%r25, [%r22 + 0x0097]
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a1cf  ! 3226: WRPR_TNPC_I	wrpr	%r18, 0x01cf, %tnpc
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3da1e8  ! 3229: STD_I	std	%r29, [%r22 + 0x01e8]
	ta	T_CHANGE_HPRIV
	.word 0x81983989  ! 3230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1989, %hpstate
	.word 0xf6256060  ! 3233: STW_I	stw	%r27, [%r21 + 0x0060]
	.word 0xb00d4000  ! 3234: AND_R	and 	%r21, %r0, %r24
	.word 0xfa740000  ! 3235: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xfc240000  ! 3236: STW_R	stw	%r30, [%r16 + %r0]
	.word 0x8d94600f  ! 3245: WRPR_PSTATE_I	wrpr	%r17, 0x000f, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982f89  ! 3246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
	.word 0xfb3ca1cd  ! 3248: STDF_I	std	%f29, [0x01cd, %r18]
	.word 0xfe352016  ! 3251: STH_I	sth	%r31, [%r20 + 0x0016]
	.word 0xf63d0000  ! 3258: STD_R	std	%r27, [%r20 + %r0]
	.word 0xb284c000  ! 3259: ADDcc_R	addcc 	%r19, %r0, %r25
	.word 0xf03ce0d7  ! 3262: STD_I	std	%r24, [%r19 + 0x00d7]
	.word 0xb5540000  ! 3263: RDPR_GL	rdpr	%-, %r26
	.word 0xf43dc000  ! 3267: STD_R	std	%r26, [%r23 + %r0]
	.word 0xb57c8400  ! 3268: MOVR_R	movre	%r18, %r0, %r26
	.word 0xf33c0000  ! 3269: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf0742178  ! 3270: STX_I	stx	%r24, [%r16 + 0x0178]
	.word 0xb751c000  ! 3273: RDPR_TL	<illegal instruction>
	.word 0xb7520000  ! 3274: RDPR_PIL	<illegal instruction>
	.word 0xf23d8000  ! 3277: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf53d61e3  ! 3278: STDF_I	std	%f26, [0x01e3, %r21]
	.word 0xf62c4000  ! 3280: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xb8358000  ! 3281: ORN_R	orn 	%r22, %r0, %r28
	.word 0xbd51c000  ! 3282: RDPR_TL	<illegal instruction>
	.word 0xf235608e  ! 3283: STH_I	sth	%r25, [%r21 + 0x008e]
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0bc20eb  ! 3291: XNORcc_I	xnorcc 	%r16, 0x00eb, %r24
	.word 0xf43421b6  ! 3292: STH_I	sth	%r26, [%r16 + 0x01b6]
	.word 0x8594a06d  ! 3293: WRPR_TSTATE_I	wrpr	%r18, 0x006d, %tstate
	.word 0xb5342001  ! 3294: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xb6850000  ! 3295: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xb2b4a103  ! 3300: ORNcc_I	orncc 	%r18, 0x0103, %r25
	.word 0x87952138  ! 3302: WRPR_TT_I	wrpr	%r20, 0x0138, %tt
	.word 0xfe75e023  ! 3304: STX_I	stx	%r31, [%r23 + 0x0023]
	.word 0xf82d8000  ! 3305: STB_R	stb	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 3306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xf675c000  ! 3314: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xb2a46183  ! 3315: SUBcc_I	subcc 	%r17, 0x0183, %r25
	.word 0xb5643801  ! 3317: MOVcc_I	<illegal instruction>
	.word 0xfe354000  ! 3318: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf42d610b  ! 3320: STB_I	stb	%r26, [%r21 + 0x010b]
	.word 0xb8ad8000  ! 3324: ANDNcc_R	andncc 	%r22, %r0, %r28
	.word 0xf13c8000  ! 3325: STDF_R	std	%f24, [%r0, %r18]
	.word 0xbeb40000  ! 3326: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0x839560ee  ! 3327: WRPR_TNPC_I	wrpr	%r21, 0x00ee, %tnpc
	.word 0xfc3c8000  ! 3334: STD_R	std	%r30, [%r18 + %r0]
	.word 0xbb504000  ! 3336: RDPR_TNPC	rdpr	%tnpc, %r29
	setx	data_start_3, %g1, %r21
	.word 0xbd504000  ! 3338: RDPR_TNPC	<illegal instruction>
	.word 0xf82ce08d  ! 3339: STB_I	stb	%r28, [%r19 + 0x008d]
	.word 0xfc24a0c7  ! 3342: STW_I	stw	%r30, [%r18 + 0x00c7]
	.word 0x8d952023  ! 3343: WRPR_PSTATE_I	wrpr	%r20, 0x0023, %pstate
	.word 0xfe3c8000  ! 3344: STD_R	std	%r31, [%r18 + %r0]
	.word 0xb13cf001  ! 3346: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xbf2dc000  ! 3349: SLL_R	sll 	%r23, %r0, %r31
	.word 0xf43c8000  ! 3352: STD_R	std	%r26, [%r18 + %r0]
	.word 0x8d95e116  ! 3353: WRPR_PSTATE_I	wrpr	%r23, 0x0116, %pstate
	.word 0xfc3c2155  ! 3354: STD_I	std	%r30, [%r16 + 0x0155]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2254000  ! 3357: SUB_R	sub 	%r21, %r0, %r25
	.word 0xbb510000  ! 3360: RDPR_TICK	rdpr	%tick, %r29
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa35a027  ! 3365: STH_I	sth	%r29, [%r22 + 0x0027]
	.word 0xb5480000  ! 3367: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf62c20f4  ! 3371: STB_I	stb	%r27, [%r16 + 0x00f4]
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c2114  ! 3383: STDF_I	std	%f29, [0x0114, %r16]
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe248000  ! 3393: SUB_R	sub 	%r18, %r0, %r31
	setx	0x3b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 3396: STX_R	stx	%r25, [%r17 + %r0]
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0x8595a134  ! 3404: WRPR_TSTATE_I	wrpr	%r22, 0x0134, %tstate
	.word 0xf6244000  ! 3405: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xfd3de01f  ! 3407: STDF_I	std	%f30, [0x001f, %r23]
	.word 0xfe3d20c2  ! 3410: STD_I	std	%r31, [%r20 + 0x00c2]
	.word 0xf225e1d1  ! 3411: STW_I	stw	%r25, [%r23 + 0x01d1]
	.word 0xb83de137  ! 3418: XNOR_I	xnor 	%r23, 0x0137, %r28
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 3426: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x8d946100  ! 3429: WRPR_PSTATE_I	wrpr	%r17, 0x0100, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d13  ! 3433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0xfa740000  ! 3434: STX_R	stx	%r29, [%r16 + %r0]
	.word 0x8794203b  ! 3435: WRPR_TT_I	wrpr	%r16, 0x003b, %tt
	.word 0xf93de02f  ! 3436: STDF_I	std	%f28, [0x002f, %r23]
	.word 0xbb51c000  ! 3439: RDPR_TL	rdpr	%tl, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982f89  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
	.word 0xf02c612c  ! 3453: STB_I	stb	%r24, [%r17 + 0x012c]
	.word 0xf23d0000  ! 3455: STD_R	std	%r25, [%r20 + %r0]
	.word 0xb48ca060  ! 3456: ANDcc_I	andcc 	%r18, 0x0060, %r26
	.word 0xf2740000  ! 3458: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfc244000  ! 3459: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xfd3da08d  ! 3461: STDF_I	std	%f30, [0x008d, %r22]
	.word 0xfb3c0000  ! 3462: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf4740000  ! 3463: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xb2344000  ! 3466: ORN_R	orn 	%r17, %r0, %r25
	.word 0xfc2da186  ! 3469: STB_I	stb	%r30, [%r22 + 0x0186]
	.word 0x83946117  ! 3472: WRPR_TNPC_I	wrpr	%r17, 0x0117, %tnpc
	.word 0xf235a1d2  ! 3476: STH_I	sth	%r25, [%r22 + 0x01d2]
	.word 0xf03c4000  ! 3482: STD_R	std	%r24, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982ad9  ! 3484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad9, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 3486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	.word 0xb0050000  ! 3487: ADD_R	add 	%r20, %r0, %r24
	.word 0x8195a010  ! 3488: WRPR_TPC_I	wrpr	%r22, 0x0010, %tpc
	.word 0x8594e133  ! 3490: WRPR_TSTATE_I	wrpr	%r19, 0x0133, %tstate
	.word 0xf03461e2  ! 3491: STH_I	sth	%r24, [%r17 + 0x01e2]
	.word 0xfc24c000  ! 3492: STW_R	stw	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd50c000  ! 3494: RDPR_TT	rdpr	%tt, %r30
	.word 0xb5504000  ! 3496: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 3499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 3501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf83c6090  ! 3502: STD_I	std	%r28, [%r17 + 0x0090]
	.word 0xb1504000  ! 3504: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xbd500000  ! 3506: RDPR_TPC	<illegal instruction>
	.word 0xf4348000  ! 3507: STH_R	sth	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982d83  ! 3514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d83, %hpstate
	.word 0xfe35210b  ! 3517: STH_I	sth	%r31, [%r20 + 0x010b]
	.word 0xfd3ce038  ! 3519: STDF_I	std	%f30, [0x0038, %r19]
	.word 0xb12c4000  ! 3521: SLL_R	sll 	%r17, %r0, %r24
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8358000  ! 3523: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xb0b4606e  ! 3526: SUBCcc_I	orncc 	%r17, 0x006e, %r24
	mov	0, %r14
	.word 0xa193a000  ! 3528: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf2748000  ! 3529: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xbb510000  ! 3534: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbe854000  ! 3535: ADDcc_R	addcc 	%r21, %r0, %r31
	.word 0xf6254000  ! 3536: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfa24616b  ! 3541: STW_I	stw	%r29, [%r17 + 0x016b]
	.word 0x8d95a161  ! 3543: WRPR_PSTATE_I	wrpr	%r22, 0x0161, %pstate
	.word 0xf2240000  ! 3544: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf63421b8  ! 3545: STH_I	sth	%r27, [%r16 + 0x01b8]
	.word 0x8795e184  ! 3548: WRPR_TT_I	wrpr	%r23, 0x0184, %tt
	.word 0xfc352058  ! 3551: STH_I	sth	%r30, [%r20 + 0x0058]
	.word 0xfe74c000  ! 3552: STX_R	stx	%r31, [%r19 + %r0]
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf225e050  ! 3565: STW_I	stw	%r25, [%r23 + 0x0050]
	mov	0, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfd3c217f  ! 3570: STDF_I	std	%f30, [0x017f, %r16]
	.word 0xfa2d4000  ! 3574: STB_R	stb	%r29, [%r21 + %r0]
	setx	0x20020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13ce189  ! 3576: STDF_I	std	%f24, [0x0189, %r19]
	.word 0xb9500000  ! 3578: RDPR_TPC	rdpr	%tpc, %r28
	setx	data_start_1, %g1, %r22
	.word 0x8994e1e7  ! 3581: WRPR_TICK_I	wrpr	%r19, 0x01e7, %tick
	.word 0xb49d4000  ! 3582: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xbd344000  ! 3586: SRL_R	srl 	%r17, %r0, %r30
	setx	data_start_1, %g1, %r16
	.word 0xf83c61dd  ! 3589: STD_I	std	%r28, [%r17 + 0x01dd]
	.word 0xf83420a1  ! 3591: STH_I	sth	%r28, [%r16 + 0x00a1]
	.word 0xfe3dc000  ! 3593: STD_R	std	%r31, [%r23 + %r0]
	.word 0xb08c4000  ! 3594: ANDcc_R	andcc 	%r17, %r0, %r24
	.word 0xfe34a157  ! 3598: STH_I	sth	%r31, [%r18 + 0x0157]
	.word 0xbf3c0000  ! 3599: SRA_R	sra 	%r16, %r0, %r31
	.word 0xf0758000  ! 3601: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xbeb54000  ! 3607: SUBCcc_R	orncc 	%r21, %r0, %r31
	.word 0xfc2d8000  ! 3610: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb23c4000  ! 3611: XNOR_R	xnor 	%r17, %r0, %r25
	.word 0xb5520000  ! 3613: RDPR_PIL	rdpr	%pil, %r26
	.word 0x8394e163  ! 3614: WRPR_TNPC_I	wrpr	%r19, 0x0163, %tnpc
	.word 0xbd51c000  ! 3615: RDPR_TL	rdpr	%tl, %r30
	.word 0xf43d0000  ! 3616: STD_R	std	%r26, [%r20 + %r0]
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe8de054  ! 3618: ANDcc_I	andcc 	%r23, 0x0054, %r31
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	.word 0xfe74c000  ! 3627: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xfe3561e5  ! 3630: STH_I	sth	%r31, [%r21 + 0x01e5]
	.word 0xb2454000  ! 3631: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xf624a0ce  ! 3633: STW_I	stw	%r27, [%r18 + 0x00ce]
	.word 0xfc2dc000  ! 3636: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf6250000  ! 3637: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf13c4000  ! 3640: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf02d0000  ! 3644: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xbb50c000  ! 3645: RDPR_TT	<illegal instruction>
	.word 0xf23cc000  ! 3646: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf4754000  ! 3647: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xbe340000  ! 3648: SUBC_R	orn 	%r16, %r0, %r31
	.word 0xfc34216f  ! 3649: STH_I	sth	%r30, [%r16 + 0x016f]
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf435e1a9  ! 3652: STH_I	sth	%r26, [%r23 + 0x01a9]
	.word 0xb9510000  ! 3653: RDPR_TICK	<illegal instruction>
	.word 0x8794a0b7  ! 3657: WRPR_TT_I	wrpr	%r18, 0x00b7, %tt
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc74e11d  ! 3665: STX_I	stx	%r30, [%r19 + 0x011d]
	.word 0xfe3de113  ! 3666: STD_I	std	%r31, [%r23 + 0x0113]
	.word 0xb3480000  ! 3671: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf424209a  ! 3677: STW_I	stw	%r26, [%r16 + 0x009a]
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc348000  ! 3680: STH_R	sth	%r30, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819829c1  ! 3681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c1, %hpstate
	.word 0xb0b54000  ! 3683: ORNcc_R	orncc 	%r21, %r0, %r24
	setx	0x30234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24a188  ! 3687: STW_I	stw	%r31, [%r18 + 0x0188]
	setx	data_start_6, %g1, %r23
	.word 0xf624a01e  ! 3691: STW_I	stw	%r27, [%r18 + 0x001e]
	.word 0xb1520000  ! 3693: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf13c0000  ! 3694: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf8246112  ! 3695: STW_I	stw	%r28, [%r17 + 0x0112]
	.word 0xf53c0000  ! 3696: STDF_R	std	%f26, [%r0, %r16]
	.word 0xbf540000  ! 3697: RDPR_GL	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xb7540000  ! 3701: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25e00a  ! 3716: STW_I	stw	%r29, [%r23 + 0x000a]
	.word 0xf4246037  ! 3719: STW_I	stw	%r26, [%r17 + 0x0037]
	.word 0xf074a10f  ! 3720: STX_I	stx	%r24, [%r18 + 0x010f]
	.word 0xf53d2089  ! 3721: STDF_I	std	%f26, [0x0089, %r20]
	.word 0xfe2c0000  ! 3722: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf87421c3  ! 3724: STX_I	stx	%r28, [%r16 + 0x01c3]
	.word 0xb52c2001  ! 3726: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xb0b4c000  ! 3728: SUBCcc_R	orncc 	%r19, %r0, %r24
	mov	0, %r14
	.word 0xa193a000  ! 3730: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2752141  ! 3735: STX_I	stx	%r25, [%r20 + 0x0141]
	.word 0xf42c8000  ! 3737: STB_R	stb	%r26, [%r18 + %r0]
	setx	0x30203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 3740: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x30308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2da0a3  ! 3747: ANDN_I	andn 	%r22, 0x00a3, %r29
	.word 0xf62460f6  ! 3748: STW_I	stw	%r27, [%r17 + 0x00f6]
	.word 0xfb3c0000  ! 3751: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf93c60f1  ! 3752: STDF_I	std	%f28, [0x00f1, %r17]
	.word 0xfc2d2158  ! 3756: STB_I	stb	%r30, [%r20 + 0x0158]
	.word 0xb7540000  ! 3757: RDPR_GL	rdpr	%-, %r27
	.word 0xfe744000  ! 3762: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf075e08b  ! 3764: STX_I	stx	%r24, [%r23 + 0x008b]
	.word 0xf13cc000  ! 3767: STDF_R	std	%f24, [%r0, %r19]
	mov	2, %r14
	.word 0xa193a000  ! 3768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb60dc000  ! 3771: AND_R	and 	%r23, %r0, %r27
	.word 0xf02ce117  ! 3773: STB_I	stb	%r24, [%r19 + 0x0117]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb73dc000  ! 3781: SRA_R	sra 	%r23, %r0, %r27
	.word 0xfe3d615d  ! 3783: STD_I	std	%r31, [%r21 + 0x015d]
	.word 0xf0752028  ! 3784: STX_I	stx	%r24, [%r20 + 0x0028]
	.word 0xf4240000  ! 3785: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf22da0db  ! 3787: STB_I	stb	%r25, [%r22 + 0x00db]
	.word 0xb7508000  ! 3789: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf02c0000  ! 3794: STB_R	stb	%r24, [%r16 + %r0]
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb005619b  ! 3799: ADD_I	add 	%r21, 0x019b, %r24
	.word 0xf83421dd  ! 3801: STH_I	sth	%r28, [%r16 + 0x01dd]
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d0000  ! 3806: STB_R	stb	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983c9b  ! 3807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
	.word 0xfc34a197  ! 3811: STH_I	sth	%r30, [%r18 + 0x0197]
	ta	T_CHANGE_HPRIV
	.word 0x81983f09  ! 3814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f09, %hpstate
	.word 0xf22ca08a  ! 3817: STB_I	stb	%r25, [%r18 + 0x008a]
	.word 0xfc758000  ! 3818: STX_R	stx	%r30, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819829c3  ! 3821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c3, %hpstate
	.word 0xff3d0000  ! 3826: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf53ca099  ! 3827: STDF_I	std	%f26, [0x0099, %r18]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42de067  ! 3831: STB_I	stb	%r26, [%r23 + 0x0067]
	.word 0xfb3da006  ! 3832: STDF_I	std	%f29, [0x0006, %r22]
	.word 0x8995211d  ! 3841: WRPR_TICK_I	wrpr	%r20, 0x011d, %tick
	.word 0x839461e9  ! 3843: WRPR_TNPC_I	wrpr	%r17, 0x01e9, %tnpc
	setx	data_start_3, %g1, %r19
	.word 0xbd508000  ! 3858: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf62420b3  ! 3860: STW_I	stw	%r27, [%r16 + 0x00b3]
	.word 0xfc352192  ! 3864: STH_I	sth	%r30, [%r20 + 0x0192]
	.word 0xfa3461b8  ! 3865: STH_I	sth	%r29, [%r17 + 0x01b8]
	.word 0xf6358000  ! 3866: STH_R	sth	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ed1  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed1, %hpstate
	.word 0xfa34a0cb  ! 3872: STH_I	sth	%r29, [%r18 + 0x00cb]
	.word 0xf42cc000  ! 3878: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xfc2c61d4  ! 3879: STB_I	stb	%r30, [%r17 + 0x01d4]
	.word 0xf13de015  ! 3890: STDF_I	std	%f24, [0x0015, %r23]
	.word 0xf42ce18d  ! 3891: STB_I	stb	%r26, [%r19 + 0x018d]
	.word 0xfc24a0c5  ! 3895: STW_I	stw	%r30, [%r18 + 0x00c5]
	mov	2, %r12
	.word 0x8f932000  ! 3897: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe248000  ! 3899: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfe2da119  ! 3900: STB_I	stb	%r31, [%r22 + 0x0119]
	.word 0xf82ca0ce  ! 3902: STB_I	stb	%r28, [%r18 + 0x00ce]
	.word 0xf82561ef  ! 3905: STW_I	stw	%r28, [%r21 + 0x01ef]
	.word 0xf0248000  ! 3906: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xfe350000  ! 3908: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf62c4000  ! 3909: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf225a1af  ! 3912: STW_I	stw	%r25, [%r22 + 0x01af]
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0348000  ! 3914: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf6256043  ! 3918: STW_I	stw	%r27, [%r21 + 0x0043]
	.word 0xbf508000  ! 3924: RDPR_TSTATE	rdpr	%tstate, %r31
	mov	1, %r12
	.word 0x8f932000  ! 3926: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbaace0f8  ! 3928: ANDNcc_I	andncc 	%r19, 0x00f8, %r29
	.word 0xf23d4000  ! 3929: STD_R	std	%r25, [%r21 + %r0]
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819828d1  ! 3936: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d1, %hpstate
	.word 0xf674207c  ! 3937: STX_I	stx	%r27, [%r16 + 0x007c]
	.word 0xfa3c2029  ! 3938: STD_I	std	%r29, [%r16 + 0x0029]
	mov	0, %r12
	.word 0x8f932000  ! 3941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd508000  ! 3942: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf224e170  ! 3945: STW_I	stw	%r25, [%r19 + 0x0170]
	.word 0xfb3dc000  ! 3947: STDF_R	std	%f29, [%r0, %r23]
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 3951: RDPR_PIL	<illegal instruction>
	.word 0xf93de0bd  ! 3956: STDF_I	std	%f28, [0x00bd, %r23]
	.word 0xfe34e0eb  ! 3961: STH_I	sth	%r31, [%r19 + 0x00eb]
	.word 0xf8348000  ! 3962: STH_R	sth	%r28, [%r18 + %r0]
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 3964: RDPR_TT	rdpr	%tt, %r24
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42de000  ! 3970: STB_I	stb	%r26, [%r23 + 0x0000]
	mov	1, %r14
	.word 0xa193a000  ! 3972: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6b4e08d  ! 3973: SUBCcc_I	orncc 	%r19, 0x008d, %r27
	.word 0xf62c600c  ! 3974: STB_I	stb	%r27, [%r17 + 0x000c]
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	mov	0, %r14
	.word 0xa193a000  ! 3983: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_6, %g1, %r16
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0752134  ! 3996: STX_I	stx	%r24, [%r20 + 0x0134]
	.word 0x899560c5  ! 3999: WRPR_TICK_I	wrpr	%r21, 0x00c5, %tick
	.word 0xb9346001  ! 4002: SRL_I	srl 	%r17, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 4010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 4011: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf435611a  ! 4012: STH_I	sth	%r26, [%r21 + 0x011a]
	.word 0xf27421ca  ! 4016: STX_I	stx	%r25, [%r16 + 0x01ca]
	.word 0x87956175  ! 4017: WRPR_TT_I	wrpr	%r21, 0x0175, %tt
	.word 0xf4748000  ! 4021: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xff3d4000  ! 4027: STDF_R	std	%f31, [%r0, %r21]
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 4033: RDPR_TT	rdpr	%tt, %r28
	.word 0xf73c6198  ! 4035: STDF_I	std	%f27, [0x0198, %r17]
	.word 0xf93dc000  ! 4036: STDF_R	std	%f28, [%r0, %r23]
	.word 0xfe35e102  ! 4037: STH_I	sth	%r31, [%r23 + 0x0102]
	.word 0xb32c9000  ! 4038: SLLX_R	sllx	%r18, %r0, %r25
	.word 0x8995a1da  ! 4041: WRPR_TICK_I	wrpr	%r22, 0x01da, %tick
	.word 0xfe75e114  ! 4042: STX_I	stx	%r31, [%r23 + 0x0114]
	.word 0xf83d4000  ! 4043: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf93d4000  ! 4045: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf23d0000  ! 4048: STD_R	std	%r25, [%r20 + %r0]
	.word 0xb751c000  ! 4050: RDPR_TL	rdpr	%tl, %r27
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe0ce1de  ! 4053: AND_I	and 	%r19, 0x01de, %r31
	.word 0xfe2c2168  ! 4058: STB_I	stb	%r31, [%r16 + 0x0168]
	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 4065: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf634e04b  ! 4069: STH_I	sth	%r27, [%r19 + 0x004b]
	.word 0xb0a58000  ! 4074: SUBcc_R	subcc 	%r22, %r0, %r24
	.word 0xf624e1ec  ! 4075: STW_I	stw	%r27, [%r19 + 0x01ec]
	.word 0xb1518000  ! 4078: RDPR_PSTATE	<illegal instruction>
	.word 0xb42d2053  ! 4079: ANDN_I	andn 	%r20, 0x0053, %r26
	.word 0xf4346052  ! 4081: STH_I	sth	%r26, [%r17 + 0x0052]
	.word 0xf43c61b5  ! 4082: STD_I	std	%r26, [%r17 + 0x01b5]
	.word 0xf025a1e0  ! 4083: STW_I	stw	%r24, [%r22 + 0x01e0]
	.word 0xfe750000  ! 4087: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfe2ca04d  ! 4089: STB_I	stb	%r31, [%r18 + 0x004d]
	.word 0xf73c0000  ! 4091: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfe7420a5  ! 4096: STX_I	stx	%r31, [%r16 + 0x00a5]
	.word 0xbb2d3001  ! 4099: SLLX_I	sllx	%r20, 0x0001, %r29
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf625206b  ! 4103: STW_I	stw	%r27, [%r20 + 0x006b]
	.word 0xfc358000  ! 4110: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb7508000  ! 4111: RDPR_TSTATE	<illegal instruction>
	.word 0xb2a5e0c7  ! 4112: SUBcc_I	subcc 	%r23, 0x00c7, %r25
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8756059  ! 4121: STX_I	stx	%r28, [%r21 + 0x0059]
	.word 0xbc95a1c6  ! 4125: ORcc_I	orcc 	%r22, 0x01c6, %r30
	.word 0xfe3d61e2  ! 4129: STD_I	std	%r31, [%r21 + 0x01e2]
	setx	data_start_6, %g1, %r22
	.word 0xf42de182  ! 4133: STB_I	stb	%r26, [%r23 + 0x0182]
	.word 0xbf520000  ! 4135: RDPR_PIL	rdpr	%pil, %r31
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a14b  ! 4141: WRPR_PIL_I	wrpr	%r22, 0x014b, %pil
	mov	2, %r12
	.word 0x8f932000  ! 4143: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa2d61af  ! 4144: STB_I	stb	%r29, [%r21 + 0x01af]
	.word 0xb6bcc000  ! 4146: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xfa35a0ac  ! 4151: STH_I	sth	%r29, [%r22 + 0x00ac]
	.word 0xf624a1f7  ! 4152: STW_I	stw	%r27, [%r18 + 0x01f7]
	.word 0xf63d0000  ! 4154: STD_R	std	%r27, [%r20 + %r0]
	.word 0xfe2c215f  ! 4157: STB_I	stb	%r31, [%r16 + 0x015f]
	.word 0xfc34209d  ! 4159: STH_I	sth	%r30, [%r16 + 0x009d]
	.word 0xbf500000  ! 4163: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf63ca041  ! 4164: STD_I	std	%r27, [%r18 + 0x0041]
	setx	data_start_4, %g1, %r16
	.word 0xb3480000  ! 4167: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x83946191  ! 4169: WRPR_TNPC_I	wrpr	%r17, 0x0191, %tnpc
	.word 0xbb35f001  ! 4174: SRLX_I	srlx	%r23, 0x0001, %r29
	.word 0xb5510000  ! 4176: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb97d6401  ! 4181: MOVR_I	movre	%r21, 0x1, %r28
	.word 0x81956127  ! 4183: WRPR_TPC_I	wrpr	%r21, 0x0127, %tpc
	.word 0xbf3cc000  ! 4186: SRA_R	sra 	%r19, %r0, %r31
	.word 0x8995a01d  ! 4188: WRPR_TICK_I	wrpr	%r22, 0x001d, %tick
	.word 0xf53c8000  ! 4189: STDF_R	std	%f26, [%r0, %r18]
	setx	data_start_1, %g1, %r20
	.word 0xfa3c61cc  ! 4191: STD_I	std	%r29, [%r17 + 0x01cc]
	.word 0xb20dc000  ! 4193: AND_R	and 	%r23, %r0, %r25
	.word 0xf2344000  ! 4195: STH_R	sth	%r25, [%r17 + %r0]
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03d8000  ! 4201: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf274c000  ! 4211: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xfc24e0e7  ! 4215: STW_I	stw	%r30, [%r19 + 0x00e7]
	.word 0xf675208d  ! 4217: STX_I	stx	%r27, [%r20 + 0x008d]
	.word 0xf274e168  ! 4219: STX_I	stx	%r25, [%r19 + 0x0168]
	.word 0x8594e00c  ! 4220: WRPR_TSTATE_I	wrpr	%r19, 0x000c, %tstate
	.word 0xb08421df  ! 4222: ADDcc_I	addcc 	%r16, 0x01df, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982ed9  ! 4223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed9, %hpstate
	.word 0x819521a3  ! 4227: WRPR_TPC_I	wrpr	%r20, 0x01a3, %tpc
	.word 0xbe1cc000  ! 4233: XOR_R	xor 	%r19, %r0, %r31
	.word 0xf0258000  ! 4234: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xbe8c6141  ! 4235: ANDcc_I	andcc 	%r17, 0x0141, %r31
	.word 0xb3500000  ! 4237: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x83942067  ! 4238: WRPR_TNPC_I	wrpr	%r16, 0x0067, %tnpc
	.word 0xbf50c000  ! 4239: RDPR_TT	rdpr	%tt, %r31
	mov	1, %r12
	.word 0x8f932000  ! 4243: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe75a192  ! 4244: STX_I	stx	%r31, [%r22 + 0x0192]
	.word 0xf73d61e3  ! 4248: STDF_I	std	%f27, [0x01e3, %r21]
	.word 0xf035a020  ! 4249: STH_I	sth	%r24, [%r22 + 0x0020]
	.word 0xbabc615b  ! 4250: XNORcc_I	xnorcc 	%r17, 0x015b, %r29
	.word 0xbc3460ee  ! 4257: SUBC_I	orn 	%r17, 0x00ee, %r30
	.word 0xfe2d20e0  ! 4258: STB_I	stb	%r31, [%r20 + 0x00e0]
	.word 0x9195a1a0  ! 4259: WRPR_PIL_I	wrpr	%r22, 0x01a0, %pil
	.word 0xfe25a0b4  ! 4261: STW_I	stw	%r31, [%r22 + 0x00b4]
	.word 0xb024a05f  ! 4263: SUB_I	sub 	%r18, 0x005f, %r24
	.word 0xf4744000  ! 4266: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xba840000  ! 4267: ADDcc_R	addcc 	%r16, %r0, %r29
	setx	0x10102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeac0000  ! 4270: ANDNcc_R	andncc 	%r16, %r0, %r31
	.word 0x85942096  ! 4272: WRPR_TSTATE_I	wrpr	%r16, 0x0096, %tstate
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc35e1fe  ! 4276: STH_I	sth	%r30, [%r23 + 0x01fe]
	.word 0xf074e103  ! 4277: STX_I	stx	%r24, [%r19 + 0x0103]
	.word 0x8795a1d5  ! 4279: WRPR_TT_I	wrpr	%r22, 0x01d5, %tt
	.word 0x859421cc  ! 4281: WRPR_TSTATE_I	wrpr	%r16, 0x01cc, %tstate
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2de1f0  ! 4288: STB_I	stb	%r29, [%r23 + 0x01f0]
	.word 0xf825200a  ! 4289: STW_I	stw	%r28, [%r20 + 0x000a]
	setx	data_start_0, %g1, %r21
	.word 0xf4354000  ! 4294: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf4252003  ! 4296: STW_I	stw	%r26, [%r20 + 0x0003]
	setx	0x3022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2752006  ! 4303: STX_I	stx	%r25, [%r20 + 0x0006]
	mov	2, %r14
	.word 0xa193a000  ! 4304: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24e04f  ! 4311: STW_I	stw	%r30, [%r19 + 0x004f]
	.word 0xf8348000  ! 4312: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf2352161  ! 4313: STH_I	sth	%r25, [%r20 + 0x0161]
	.word 0xf8254000  ! 4315: STW_R	stw	%r28, [%r21 + %r0]
	.word 0x8795a106  ! 4317: WRPR_TT_I	wrpr	%r22, 0x0106, %tt
	.word 0xfc3c21b6  ! 4318: STD_I	std	%r30, [%r16 + 0x01b6]
	.word 0xfa3560fb  ! 4323: STH_I	sth	%r29, [%r21 + 0x00fb]
	.word 0xf625a17f  ! 4326: STW_I	stw	%r27, [%r22 + 0x017f]
	ta	T_CHANGE_HPRIV
	.word 0x81983ad9  ! 4327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad9, %hpstate
	.word 0xb150c000  ! 4329: RDPR_TT	rdpr	%tt, %r24
	setx	0x20212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf624204b  ! 4335: STW_I	stw	%r27, [%r16 + 0x004b]
	.word 0xf674202b  ! 4337: STX_I	stx	%r27, [%r16 + 0x002b]
	.word 0x8d94e0d6  ! 4342: WRPR_PSTATE_I	wrpr	%r19, 0x00d6, %pstate
	.word 0xf674a068  ! 4345: STX_I	stx	%r27, [%r18 + 0x0068]
	.word 0xb9480000  ! 4351: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x20338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c21a2  ! 4353: STD_I	std	%r31, [%r16 + 0x01a2]
	.word 0xf0746021  ! 4356: STX_I	stx	%r24, [%r17 + 0x0021]
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946020  ! 4363: WRPR_PIL_I	wrpr	%r17, 0x0020, %pil
	.word 0xf33c61d3  ! 4364: STDF_I	std	%f25, [0x01d3, %r17]
	.word 0xfc3ca1f4  ! 4366: STD_I	std	%r30, [%r18 + 0x01f4]
	ta	T_CHANGE_HPRIV
	.word 0x81982a11  ! 4369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a11, %hpstate
	.word 0x8394a065  ! 4371: WRPR_TNPC_I	wrpr	%r18, 0x0065, %tnpc
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2c6165  ! 4377: STB_I	stb	%r29, [%r17 + 0x0165]
	.word 0x9195a1f0  ! 4378: WRPR_PIL_I	wrpr	%r22, 0x01f0, %pil
	.word 0xb1480000  ! 4381: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb950c000  ! 4382: RDPR_TT	<illegal instruction>
	.word 0xfc754000  ! 4384: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xb7504000  ! 4386: RDPR_TNPC	<illegal instruction>
	.word 0xf024611a  ! 4395: STW_I	stw	%r24, [%r17 + 0x011a]
	.word 0xb751c000  ! 4398: RDPR_TL	<illegal instruction>
	.word 0xfd3c0000  ! 4399: STDF_R	std	%f30, [%r0, %r16]
	.word 0xf625e175  ! 4402: STW_I	stw	%r27, [%r23 + 0x0175]
	.word 0xfe3c8000  ! 4404: STD_R	std	%r31, [%r18 + %r0]
	.word 0xb5504000  ! 4408: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf63d60a1  ! 4411: STD_I	std	%r27, [%r21 + 0x00a1]
	.word 0xb69c0000  ! 4416: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xf93d61ee  ! 4418: STDF_I	std	%f28, [0x01ee, %r21]
	.word 0xbf51c000  ! 4423: RDPR_TL	<illegal instruction>
	.word 0xf8356041  ! 4424: STH_I	sth	%r28, [%r21 + 0x0041]
	.word 0xf33c4000  ! 4425: STDF_R	std	%f25, [%r0, %r17]
	setx	data_start_3, %g1, %r23
	.word 0xf825c000  ! 4428: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfa25e1f9  ! 4430: STW_I	stw	%r29, [%r23 + 0x01f9]
	.word 0xf03560ec  ! 4437: STH_I	sth	%r24, [%r21 + 0x00ec]
	.word 0xbd510000  ! 4440: RDPR_TICK	<illegal instruction>
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 4447: RDPR_GL	<illegal instruction>
	.word 0xba05e154  ! 4448: ADD_I	add 	%r23, 0x0154, %r29
	.word 0x899521a9  ! 4450: WRPR_TICK_I	wrpr	%r20, 0x01a9, %tick
	.word 0xf634e152  ! 4451: STH_I	sth	%r27, [%r19 + 0x0152]
	.word 0xbab40000  ! 4455: SUBCcc_R	orncc 	%r16, %r0, %r29
	.word 0xbd520000  ! 4456: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf235c000  ! 4465: STH_R	sth	%r25, [%r23 + %r0]
	.word 0x8994e08d  ! 4466: WRPR_TICK_I	wrpr	%r19, 0x008d, %tick
	.word 0xbe058000  ! 4470: ADD_R	add 	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x819829db  ! 4472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09db, %hpstate
	.word 0xf03d8000  ! 4473: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf224e048  ! 4475: STW_I	stw	%r25, [%r19 + 0x0048]
	.word 0xb12c0000  ! 4479: SLL_R	sll 	%r16, %r0, %r24
	.word 0xf63ca092  ! 4486: STD_I	std	%r27, [%r18 + 0x0092]
	.word 0xfb3c0000  ! 4490: STDF_R	std	%f29, [%r0, %r16]
	.word 0x8d94a17e  ! 4491: WRPR_PSTATE_I	wrpr	%r18, 0x017e, %pstate
	.word 0xb2c5e0b4  ! 4492: ADDCcc_I	addccc 	%r23, 0x00b4, %r25
	setx	0x2011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbcc000  ! 4500: XNORcc_R	xnorcc 	%r19, %r0, %r30
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81982ad9  ! 4505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad9, %hpstate
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75a0f0  ! 4509: STX_I	stx	%r30, [%r22 + 0x00f0]
	.word 0xfe2c0000  ! 4510: STB_R	stb	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 4511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xf674a112  ! 4512: STX_I	stx	%r27, [%r18 + 0x0112]
	.word 0xfb3de1cd  ! 4517: STDF_I	std	%f29, [0x01cd, %r23]
	.word 0xf63d60f6  ! 4520: STD_I	std	%r27, [%r21 + 0x00f6]
	.word 0xf6354000  ! 4521: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xfc25e1ca  ! 4525: STW_I	stw	%r30, [%r23 + 0x01ca]
	.word 0xbab4e064  ! 4526: ORNcc_I	orncc 	%r19, 0x0064, %r29
	.word 0xb215e0dc  ! 4530: OR_I	or 	%r23, 0x00dc, %r25
	.word 0xfa2dc000  ! 4531: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf22ce029  ! 4532: STB_I	stb	%r25, [%r19 + 0x0029]
	.word 0xf23d0000  ! 4533: STD_R	std	%r25, [%r20 + %r0]
	.word 0xb42d8000  ! 4534: ANDN_R	andn 	%r22, %r0, %r26
	.word 0xf4348000  ! 4538: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb7520000  ! 4540: RDPR_PIL	rdpr	%pil, %r27
	setx	data_start_3, %g1, %r17
	.word 0xfc25e0f6  ! 4543: STW_I	stw	%r30, [%r23 + 0x00f6]
	.word 0x8394209b  ! 4546: WRPR_TNPC_I	wrpr	%r16, 0x009b, %tnpc
	.word 0xf834a0a5  ! 4547: STH_I	sth	%r28, [%r18 + 0x00a5]
	.word 0xb2ac8000  ! 4549: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xbd500000  ! 4550: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf07560af  ! 4552: STX_I	stx	%r24, [%r21 + 0x00af]
	.word 0xf53c2029  ! 4554: STDF_I	std	%f26, [0x0029, %r16]
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	.word 0x9195a1cc  ! 4559: WRPR_PIL_I	wrpr	%r22, 0x01cc, %pil
	.word 0xfc358000  ! 4564: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf02c8000  ! 4565: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf2254000  ! 4566: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xfb3dc000  ! 4567: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf235217d  ! 4570: STH_I	sth	%r25, [%r20 + 0x017d]
	.word 0xbf520000  ! 4572: RDPR_PIL	rdpr	%pil, %r31
	.word 0xbeb54000  ! 4575: SUBCcc_R	orncc 	%r21, %r0, %r31
	.word 0xf03ca143  ! 4577: STD_I	std	%r24, [%r18 + 0x0143]
	.word 0xfa2c4000  ! 4578: STB_R	stb	%r29, [%r17 + %r0]
	setx	0x2011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2d3001  ! 4582: SLLX_I	sllx	%r20, 0x0001, %r31
	.word 0xbf500000  ! 4589: RDPR_TPC	<illegal instruction>
	.word 0xf13d0000  ! 4591: STDF_R	std	%f24, [%r0, %r20]
	.word 0xf83d0000  ! 4592: STD_R	std	%r28, [%r20 + %r0]
	.word 0xf03c4000  ! 4594: STD_R	std	%r24, [%r17 + %r0]
	.word 0xf22d216e  ! 4597: STB_I	stb	%r25, [%r20 + 0x016e]
	.word 0xff3d8000  ! 4598: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf474e03a  ! 4599: STX_I	stx	%r26, [%r19 + 0x003a]
	.word 0xb5510000  ! 4600: RDPR_TICK	<illegal instruction>
	.word 0xfa75e052  ! 4603: STX_I	stx	%r29, [%r23 + 0x0052]
	.word 0xfa2d2172  ! 4604: STB_I	stb	%r29, [%r20 + 0x0172]
	.word 0xf825a08f  ! 4605: STW_I	stw	%r28, [%r22 + 0x008f]
	.word 0xb5480000  ! 4606: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf435a0cc  ! 4607: STH_I	sth	%r26, [%r22 + 0x00cc]
	.word 0xfc3d4000  ! 4608: STD_R	std	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2560fc  ! 4610: STW_I	stw	%r30, [%r21 + 0x00fc]
	.word 0xb97c4400  ! 4613: MOVR_R	movre	%r17, %r0, %r28
	.word 0xfc2c60b1  ! 4614: STB_I	stb	%r30, [%r17 + 0x00b1]
	.word 0xf2252029  ! 4616: STW_I	stw	%r25, [%r20 + 0x0029]
	.word 0x8394a069  ! 4618: WRPR_TNPC_I	wrpr	%r18, 0x0069, %tnpc
	.word 0xbf51c000  ! 4620: RDPR_TL	rdpr	%tl, %r31
	.word 0xf834e115  ! 4622: STH_I	sth	%r28, [%r19 + 0x0115]
	.word 0x91952199  ! 4623: WRPR_PIL_I	wrpr	%r20, 0x0199, %pil
	.word 0xb034e043  ! 4625: ORN_I	orn 	%r19, 0x0043, %r24
	.word 0xfe25209f  ! 4627: STW_I	stw	%r31, [%r20 + 0x009f]
	.word 0xb9540000  ! 4628: RDPR_GL	rdpr	%-, %r28
	.word 0xbd2d0000  ! 4631: SLL_R	sll 	%r20, %r0, %r30
	.word 0xb5356001  ! 4638: SRL_I	srl 	%r21, 0x0001, %r26
	.word 0xf625c000  ! 4643: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf02d4000  ! 4649: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xb7504000  ! 4650: RDPR_TNPC	<illegal instruction>
	.word 0xfa2cc000  ! 4651: STB_R	stb	%r29, [%r19 + %r0]
	setx	0x1002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73dc000  ! 4655: STDF_R	std	%f27, [%r0, %r23]
	.word 0xbd643801  ! 4657: MOVcc_I	<illegal instruction>
	.word 0xf874e188  ! 4659: STX_I	stx	%r28, [%r19 + 0x0188]
	setx	data_start_7, %g1, %r18
	.word 0xf0740000  ! 4663: STX_R	stx	%r24, [%r16 + %r0]
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 4665: RDPR_TT	rdpr	%tt, %r26
	.word 0xf73dc000  ! 4668: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf13c60e3  ! 4670: STDF_I	std	%f24, [0x00e3, %r17]
	.word 0xfc242045  ! 4671: STW_I	stw	%r30, [%r16 + 0x0045]
	setx	data_start_7, %g1, %r21
	.word 0xf635200d  ! 4673: STH_I	sth	%r27, [%r20 + 0x000d]
	mov	0, %r12
	.word 0x8f932000  ! 4674: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb4ac20ed  ! 4675: ANDNcc_I	andncc 	%r16, 0x00ed, %r26
	.word 0xf13de1bd  ! 4677: STDF_I	std	%f24, [0x01bd, %r23]
	.word 0xf0754000  ! 4680: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfb3c20cb  ! 4681: STDF_I	std	%f29, [0x00cb, %r16]
	.word 0xfa3ce0e2  ! 4682: STD_I	std	%r29, [%r19 + 0x00e2]
	.word 0xb82d8000  ! 4685: ANDN_R	andn 	%r22, %r0, %r28
	.word 0xb694212e  ! 4691: ORcc_I	orcc 	%r16, 0x012e, %r27
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb50c000  ! 4697: RDPR_TT	rdpr	%tt, %r29
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc25615c  ! 4704: STW_I	stw	%r30, [%r21 + 0x015c]
	.word 0xfc2dc000  ! 4705: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfa2d0000  ! 4706: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb82c8000  ! 4707: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xf274c000  ! 4710: STX_R	stx	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983a4b  ! 4713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
	.word 0xf4354000  ! 4715: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfa248000  ! 4718: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf23c8000  ! 4719: STD_R	std	%r25, [%r18 + %r0]
	.word 0xfa3c8000  ! 4725: STD_R	std	%r29, [%r18 + %r0]
	.word 0x8194a0e3  ! 4726: WRPR_TPC_I	wrpr	%r18, 0x00e3, %tpc
	.word 0xf8240000  ! 4730: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfe75c000  ! 4731: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf0758000  ! 4732: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf6744000  ! 4733: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xfa3cc000  ! 4735: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf425c000  ! 4737: STW_R	stw	%r26, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b43  ! 4740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b43, %hpstate
	.word 0xf93d8000  ! 4742: STDF_R	std	%f28, [%r0, %r22]
	.word 0xfe342170  ! 4744: STH_I	sth	%r31, [%r16 + 0x0170]
	.word 0xb82460b3  ! 4747: SUB_I	sub 	%r17, 0x00b3, %r28
	.word 0xf82dc000  ! 4748: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfd3c20b1  ! 4752: STDF_I	std	%f30, [0x00b1, %r16]
	.word 0xf93d0000  ! 4754: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf33ce1ca  ! 4755: STDF_I	std	%f25, [0x01ca, %r19]
	.word 0xf73de066  ! 4756: STDF_I	std	%f27, [0x0066, %r23]
	mov	1, %r12
	.word 0x8f932000  ! 4758: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa3c4000  ! 4761: STD_R	std	%r29, [%r17 + %r0]
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 4765: RDPR_TICK	rdpr	%tick, %r30
	mov	1, %r14
	.word 0xa193a000  ! 4769: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1508000  ! 4772: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf475c000  ! 4773: STX_R	stx	%r26, [%r23 + %r0]
	.word 0x8394e11e  ! 4777: WRPR_TNPC_I	wrpr	%r19, 0x011e, %tnpc
	.word 0xf62d2166  ! 4778: STB_I	stb	%r27, [%r20 + 0x0166]
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d4000  ! 4781: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf674a160  ! 4784: STX_I	stx	%r27, [%r18 + 0x0160]
	.word 0xf43d8000  ! 4786: STD_R	std	%r26, [%r22 + %r0]
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834e1b1  ! 4789: STH_I	sth	%r28, [%r19 + 0x01b1]
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d8000  ! 4791: STD_R	std	%r29, [%r22 + %r0]
	.word 0xfe3c60d3  ! 4796: STD_I	std	%r31, [%r17 + 0x00d3]
	.word 0xfe2c61ab  ! 4799: STB_I	stb	%r31, [%r17 + 0x01ab]
	.word 0xfd3d0000  ! 4800: STDF_R	std	%f30, [%r0, %r20]
	.word 0xfc34a038  ! 4802: STH_I	sth	%r30, [%r18 + 0x0038]
	.word 0xf875612b  ! 4804: STX_I	stx	%r28, [%r21 + 0x012b]
	.word 0x8594e178  ! 4809: WRPR_TSTATE_I	wrpr	%r19, 0x0178, %tstate
	.word 0x8595a061  ! 4815: WRPR_TSTATE_I	wrpr	%r22, 0x0061, %tstate
	.word 0xf83d8000  ! 4816: STD_R	std	%r28, [%r22 + %r0]
	.word 0xb6b50000  ! 4820: SUBCcc_R	orncc 	%r20, %r0, %r27
	.word 0xf874e027  ! 4822: STX_I	stx	%r28, [%r19 + 0x0027]
	.word 0xfa3c8000  ! 4826: STD_R	std	%r29, [%r18 + %r0]
	.word 0xb0ad4000  ! 4827: ANDNcc_R	andncc 	%r21, %r0, %r24
	.word 0x8594a14b  ! 4829: WRPR_TSTATE_I	wrpr	%r18, 0x014b, %tstate
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22c8000  ! 4834: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf634211c  ! 4835: STH_I	sth	%r27, [%r16 + 0x011c]
	.word 0xfb3cc000  ! 4836: STDF_R	std	%f29, [%r0, %r19]
	.word 0xb3643801  ! 4839: MOVcc_I	<illegal instruction>
	.word 0xf275a09b  ! 4841: STX_I	stx	%r25, [%r22 + 0x009b]
	.word 0xf2246147  ! 4845: STW_I	stw	%r25, [%r17 + 0x0147]
	.word 0xfe2d0000  ! 4847: STB_R	stb	%r31, [%r20 + %r0]
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2dc000  ! 4859: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf2350000  ! 4861: STH_R	sth	%r25, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983c59  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c59, %hpstate
	.word 0xba350000  ! 4866: ORN_R	orn 	%r20, %r0, %r29
	.word 0xb93d9000  ! 4867: SRAX_R	srax	%r22, %r0, %r28
	.word 0xbb508000  ! 4868: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf4754000  ! 4869: STX_R	stx	%r26, [%r21 + %r0]
	.word 0x899520a3  ! 4871: WRPR_TICK_I	wrpr	%r20, 0x00a3, %tick
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf6744000  ! 4876: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf02461f5  ! 4879: STW_I	stw	%r24, [%r17 + 0x01f5]
	.word 0xb134d000  ! 4883: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xfc2d8000  ! 4888: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb7508000  ! 4890: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x859561e7  ! 4893: WRPR_TSTATE_I	wrpr	%r21, 0x01e7, %tstate
	.word 0xf22ca019  ! 4896: STB_I	stb	%r25, [%r18 + 0x0019]
	.word 0xfe75e1dd  ! 4897: STX_I	stx	%r31, [%r23 + 0x01dd]
	.word 0xb551c000  ! 4898: RDPR_TL	rdpr	%tl, %r26
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4902: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034e01d  ! 4908: STH_I	sth	%r24, [%r19 + 0x001d]
	.word 0xf53de1e6  ! 4909: STDF_I	std	%f26, [0x01e6, %r23]
	.word 0xf074a1a6  ! 4910: STX_I	stx	%r24, [%r18 + 0x01a6]
	setx	0x2023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53de0fe  ! 4912: STDF_I	std	%f26, [0x00fe, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81983819  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1819, %hpstate
	.word 0xf0258000  ! 4914: STW_R	stw	%r24, [%r22 + %r0]
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a056  ! 4922: WRPR_PIL_I	wrpr	%r22, 0x0056, %pil
	.word 0xf82ca0fb  ! 4923: STB_I	stb	%r28, [%r18 + 0x00fb]
	.word 0xfa7420c2  ! 4926: STX_I	stx	%r29, [%r16 + 0x00c2]
	.word 0xf024a072  ! 4927: STW_I	stw	%r24, [%r18 + 0x0072]
	setx	data_start_3, %g1, %r21
	.word 0xf6744000  ! 4933: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf22d60e2  ! 4936: STB_I	stb	%r25, [%r21 + 0x00e2]
	.word 0x9194e0aa  ! 4938: WRPR_PIL_I	wrpr	%r19, 0x00aa, %pil
	.word 0xf424e05f  ! 4941: STW_I	stw	%r26, [%r19 + 0x005f]
	.word 0xbcb5c000  ! 4945: SUBCcc_R	orncc 	%r23, %r0, %r30
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8750000  ! 4947: STX_R	stx	%r28, [%r20 + %r0]
	.word 0x8394a17d  ! 4948: WRPR_TNPC_I	wrpr	%r18, 0x017d, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d94e1de  ! 4954: WRPR_PSTATE_I	wrpr	%r19, 0x01de, %pstate
	.word 0xb9510000  ! 4955: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf62de0cf  ! 4958: STB_I	stb	%r27, [%r23 + 0x00cf]
	.word 0xfe3ca062  ! 4962: STD_I	std	%r31, [%r18 + 0x0062]
	.word 0x839561fa  ! 4963: WRPR_TNPC_I	wrpr	%r21, 0x01fa, %tnpc
	.word 0x8595e171  ! 4967: WRPR_TSTATE_I	wrpr	%r23, 0x0171, %tstate
	.word 0xb4bde1f7  ! 4976: XNORcc_I	xnorcc 	%r23, 0x01f7, %r26
	.word 0xbd357001  ! 4983: SRLX_I	srlx	%r21, 0x0001, %r30
	.word 0xfc24216f  ! 4984: STW_I	stw	%r30, [%r16 + 0x016f]
	.word 0xf4258000  ! 4985: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xb044e012  ! 4988: ADDC_I	addc 	%r19, 0x0012, %r24
	.word 0xbc24c000  ! 4993: SUB_R	sub 	%r19, %r0, %r30
	.word 0xf43d20f6  ! 4995: STD_I	std	%r26, [%r20 + 0x00f6]
	.word 0xf13dc000  ! 4996: STDF_R	std	%f24, [%r0, %r23]
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
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 9: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf05d61ef  ! 12: LDX_I	ldx	[%r21 + 0x01ef], %r24
	.word 0xb3504000  ! 14: RDPR_TNPC	<illegal instruction>
	.word 0xb08c60b5  ! 15: ANDcc_I	andcc 	%r17, 0x00b5, %r24
	.word 0xbb504000  ! 16: RDPR_TNPC	<illegal instruction>
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 23: RDPR_PSTATE	<illegal instruction>
	.word 0x83956020  ! 25: WRPR_TNPC_I	wrpr	%r21, 0x0020, %tnpc
	.word 0xf71de1da  ! 30: LDDF_I	ldd	[%r23, 0x01da], %f27
	.word 0xf4550000  ! 33: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xfc058000  ! 38: LDUW_R	lduw	[%r22 + %r0], %r30
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 45: RDPR_GL	<illegal instruction>
	setx	0x135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb444c000  ! 51: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xfc4c4000  ! 52: LDSB_R	ldsb	[%r17 + %r0], %r30
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 56: RDPR_TICK	<illegal instruction>
	.word 0xf804c000  ! 57: LDUW_R	lduw	[%r19 + %r0], %r28
	mov	0, %r12
	.word 0x8f932000  ! 58: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bc207a  ! 61: XNORcc_I	xnorcc 	%r16, 0x007a, %r26
	.word 0xfc14a06a  ! 65: LDUH_I	lduh	[%r18 + 0x006a], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb510000  ! 69: RDPR_TICK	<illegal instruction>
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839520d2  ! 72: WRPR_TNPC_I	wrpr	%r20, 0x00d2, %tnpc
	.word 0xbc24c000  ! 73: SUB_R	sub 	%r19, %r0, %r30
	setx	0x30316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1c212d  ! 87: LDDF_I	ldd	[%r16, 0x012d], %f30
	.word 0xfe4c6022  ! 90: LDSB_I	ldsb	[%r17 + 0x0022], %r31
	.word 0xfc4de0f3  ! 92: LDSB_I	ldsb	[%r23 + 0x00f3], %r30
	.word 0xf404605c  ! 94: LDUW_I	lduw	[%r17 + 0x005c], %r26
	.word 0xf00460ca  ! 96: LDUW_I	lduw	[%r17 + 0x00ca], %r24
	.word 0xf21d60b6  ! 97: LDD_I	ldd	[%r21 + 0x00b6], %r25
	.word 0xb28c6095  ! 99: ANDcc_I	andcc 	%r17, 0x0095, %r25
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899421c0  ! 103: WRPR_TICK_I	wrpr	%r16, 0x01c0, %tick
	.word 0xbf540000  ! 105: RDPR_GL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 107: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf0142151  ! 109: LDUH_I	lduh	[%r16 + 0x0151], %r24
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 124: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa0da019  ! 125: LDUB_I	ldub	[%r22 + 0x0019], %r29
	.word 0xbb480000  ! 129: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfa5de03a  ! 131: LDX_I	ldx	[%r23 + 0x003a], %r29
	setx	data_start_3, %g1, %r21
	.word 0xbaa56136  ! 133: SUBcc_I	subcc 	%r21, 0x0136, %r29
	.word 0xf414e1db  ! 134: LDUH_I	lduh	[%r19 + 0x01db], %r26
	.word 0xf4140000  ! 136: LDUH_R	lduh	[%r16 + %r0], %r26
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 139: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 140: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa0d8000  ! 141: LDUB_R	ldub	[%r22 + %r0], %r29
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11c4000  ! 145: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xf0140000  ! 146: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xb1508000  ! 149: RDPR_TSTATE	<illegal instruction>
	.word 0x9195e1d5  ! 150: WRPR_PIL_I	wrpr	%r23, 0x01d5, %pil
	setx	0x3010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf254c000  ! 154: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf31d4000  ! 155: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf2046191  ! 157: LDUW_I	lduw	[%r17 + 0x0191], %r25
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb23ce1c5  ! 170: XNOR_I	xnor 	%r19, 0x01c5, %r25
	.word 0xf81de11e  ! 172: LDD_I	ldd	[%r23 + 0x011e], %r28
	.word 0xfe0d4000  ! 173: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf84ca1d7  ! 178: LDSB_I	ldsb	[%r18 + 0x01d7], %r28
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe54211c  ! 184: LDSH_I	ldsh	[%r16 + 0x011c], %r31
	.word 0xf05d21b6  ! 185: LDX_I	ldx	[%r20 + 0x01b6], %r24
	setx	0x30234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2558000  ! 190: LDSH_R	ldsh	[%r22 + %r0], %r25
	setx	0x10022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946025  ! 193: WRPR_PIL_I	wrpr	%r17, 0x0025, %pil
	.word 0xfc5d0000  ! 194: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0x91956032  ! 199: WRPR_PIL_I	wrpr	%r21, 0x0032, %pil
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01d4000  ! 202: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xfe4c202c  ! 204: LDSB_I	ldsb	[%r16 + 0x002c], %r31
	.word 0xbf643801  ! 207: MOVcc_I	<illegal instruction>
	.word 0xfc054000  ! 208: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xf00d8000  ! 214: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xf41cc000  ! 216: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xb92d0000  ! 218: SLL_R	sll 	%r20, %r0, %r28
	.word 0xfe5c0000  ! 220: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf41da1ef  ! 222: LDD_I	ldd	[%r22 + 0x01ef], %r26
	.word 0xf24d0000  ! 224: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xb7504000  ! 227: RDPR_TNPC	<illegal instruction>
	.word 0xf64ce10c  ! 228: LDSB_I	ldsb	[%r19 + 0x010c], %r27
	.word 0xf45c4000  ! 229: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0x8395e0c0  ! 230: WRPR_TNPC_I	wrpr	%r23, 0x00c0, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf51cc000  ! 236: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xfe052092  ! 238: LDUW_I	lduw	[%r20 + 0x0092], %r31
	.word 0xb33d9000  ! 240: SRAX_R	srax	%r22, %r0, %r25
	.word 0x8d952063  ! 244: WRPR_PSTATE_I	wrpr	%r20, 0x0063, %pstate
	.word 0xfa548000  ! 245: LDSH_R	ldsh	[%r18 + %r0], %r29
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3354000  ! 254: SRL_R	srl 	%r21, %r0, %r25
	.word 0xf40d4000  ! 255: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xb7504000  ! 258: RDPR_TNPC	<illegal instruction>
	.word 0xbd7da401  ! 259: MOVR_I	movre	%r22, 0x1, %r30
	.word 0xf2448000  ! 262: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xfa0de133  ! 263: LDUB_I	ldub	[%r23 + 0x0133], %r29
	.word 0xfc04c000  ! 264: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0x839460f3  ! 268: WRPR_TNPC_I	wrpr	%r17, 0x00f3, %tnpc
	.word 0xb5518000  ! 269: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94211c  ! 272: WRPR_PSTATE_I	wrpr	%r16, 0x011c, %pstate
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	.word 0xf11c20dd  ! 278: LDDF_I	ldd	[%r16, 0x00dd], %f24
	.word 0xf8058000  ! 280: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xfe4d4000  ! 281: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xb1510000  ! 283: RDPR_TICK	<illegal instruction>
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf845c000  ! 285: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xf8458000  ! 290: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xf40c8000  ! 295: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xbb480000  ! 299: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf204a1c7  ! 300: LDUW_I	lduw	[%r18 + 0x01c7], %r25
	.word 0xf44c20a4  ! 301: LDSB_I	ldsb	[%r16 + 0x00a4], %r26
	.word 0xfe5d21ac  ! 302: LDX_I	ldx	[%r20 + 0x01ac], %r31
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00d4000  ! 306: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xbebdc000  ! 310: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xf0454000  ! 311: LDSW_R	ldsw	[%r21 + %r0], %r24
	setx	data_start_4, %g1, %r19
	.word 0xbf508000  ! 316: RDPR_TSTATE	<illegal instruction>
	.word 0xf91d0000  ! 320: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xfa1c0000  ! 323: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xf80d4000  ! 327: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf41d8000  ! 330: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0x8595a147  ! 331: WRPR_TSTATE_I	wrpr	%r22, 0x0147, %tstate
	.word 0x8794e0ea  ! 334: WRPR_TT_I	wrpr	%r19, 0x00ea, %tt
	.word 0xf24d20f0  ! 337: LDSB_I	ldsb	[%r20 + 0x00f0], %r25
	setx	data_start_5, %g1, %r19
	.word 0xfc0c0000  ! 339: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xfe5c61ed  ! 342: LDX_I	ldx	[%r17 + 0x01ed], %r31
	.word 0xfc1c4000  ! 343: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xf2444000  ! 344: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xf04da1d7  ! 345: LDSB_I	ldsb	[%r22 + 0x01d7], %r24
	.word 0xf415e003  ! 350: LDUH_I	lduh	[%r23 + 0x0003], %r26
	.word 0xb3480000  ! 354: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf41ca0ea  ! 358: LDD_I	ldd	[%r18 + 0x00ea], %r26
	.word 0xf80ca1f3  ! 361: LDUB_I	ldub	[%r18 + 0x01f3], %r28
	.word 0xb0b4a138  ! 365: SUBCcc_I	orncc 	%r18, 0x0138, %r24
	.word 0x91956161  ! 366: WRPR_PIL_I	wrpr	%r21, 0x0161, %pil
	.word 0xf45c214c  ! 367: LDX_I	ldx	[%r16 + 0x014c], %r26
	.word 0xbf508000  ! 368: RDPR_TSTATE	<illegal instruction>
	.word 0xb7480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf61d4000  ! 377: LDD_R	ldd	[%r21 + %r0], %r27
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 379: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d81  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d81, %hpstate
	.word 0x8794a109  ! 383: WRPR_TT_I	wrpr	%r18, 0x0109, %tt
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe8c4000  ! 385: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xbe2561e3  ! 386: SUB_I	sub 	%r21, 0x01e3, %r31
	.word 0xf8544000  ! 390: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xba94c000  ! 391: ORcc_R	orcc 	%r19, %r0, %r29
	setx	0x20, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01d8000  ! 403: LDD_R	ldd	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r23
	.word 0xf25ce114  ! 417: LDX_I	ldx	[%r19 + 0x0114], %r25
	.word 0xf404e024  ! 418: LDUW_I	lduw	[%r19 + 0x0024], %r26
	.word 0xf615e18f  ! 420: LDUH_I	lduh	[%r23 + 0x018f], %r27
	.word 0xb245a093  ! 423: ADDC_I	addc 	%r22, 0x0093, %r25
	.word 0xfb1d60c7  ! 425: LDDF_I	ldd	[%r21, 0x00c7], %f29
	.word 0xf0440000  ! 426: LDSW_R	ldsw	[%r16 + %r0], %r24
	setx	0x1011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe3560ea  ! 428: SUBC_I	orn 	%r21, 0x00ea, %r31
	.word 0xbb510000  ! 432: RDPR_TICK	<illegal instruction>
	.word 0xf614e05c  ! 436: LDUH_I	lduh	[%r19 + 0x005c], %r27
	.word 0x8d95a0d3  ! 437: WRPR_PSTATE_I	wrpr	%r22, 0x00d3, %pstate
	.word 0xf21ce14d  ! 438: LDD_I	ldd	[%r19 + 0x014d], %r25
	.word 0xfe1cc000  ! 440: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xf91ce1ee  ! 441: LDDF_I	ldd	[%r19, 0x01ee], %f28
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0ce0c3  ! 443: LDUB_I	ldub	[%r19 + 0x00c3], %r31
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc148000  ! 449: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xfe54a037  ! 450: LDSH_I	ldsh	[%r18 + 0x0037], %r31
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61c0000  ! 453: LDD_R	ldd	[%r16 + %r0], %r27
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 456: RDPR_GL	<illegal instruction>
	.word 0xbc3ce10f  ! 458: XNOR_I	xnor 	%r19, 0x010f, %r30
	.word 0xfd1ca1e9  ! 460: LDDF_I	ldd	[%r18, 0x01e9], %f30
	.word 0xfb1c60fd  ! 464: LDDF_I	ldd	[%r17, 0x00fd], %f29
	.word 0xbe94a13d  ! 465: ORcc_I	orcc 	%r18, 0x013d, %r31
	.word 0x9194218a  ! 466: WRPR_PIL_I	wrpr	%r16, 0x018a, %pil
	.word 0xfe054000  ! 467: LDUW_R	lduw	[%r21 + %r0], %r31
	mov	1, %r14
	.word 0xa193a000  ! 471: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe456128  ! 473: LDSW_I	ldsw	[%r21 + 0x0128], %r31
	.word 0xfc1d4000  ! 474: LDD_R	ldd	[%r21 + %r0], %r30
	setx	0x234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e018  ! 476: WRPR_TT_I	wrpr	%r19, 0x0018, %tt
	.word 0xf4144000  ! 479: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xf25d0000  ! 484: LDX_R	ldx	[%r20 + %r0], %r25
	setx	data_start_2, %g1, %r23
	.word 0xf2548000  ! 488: LDSH_R	ldsh	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8594a195  ! 492: WRPR_TSTATE_I	wrpr	%r18, 0x0195, %tstate
	.word 0xbc258000  ! 497: SUB_R	sub 	%r22, %r0, %r30
	.word 0xfa5c8000  ! 498: LDX_R	ldx	[%r18 + %r0], %r29
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 501: RDPR_PSTATE	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 502: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa1d2090  ! 504: LDD_I	ldd	[%r20 + 0x0090], %r29
	.word 0xf65c61b2  ! 505: LDX_I	ldx	[%r17 + 0x01b2], %r27
	.word 0xf00561ca  ! 506: LDUW_I	lduw	[%r21 + 0x01ca], %r24
	.word 0xb7500000  ! 508: RDPR_TPC	<illegal instruction>
	.word 0xfe15c000  ! 515: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xb49c4000  ! 522: XORcc_R	xorcc 	%r17, %r0, %r26
	.word 0xf40c0000  ! 524: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xf91d0000  ! 525: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xfa15e018  ! 526: LDUH_I	lduh	[%r23 + 0x0018], %r29
	.word 0xf11c8000  ! 528: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xf84ce0fb  ! 530: LDSB_I	ldsb	[%r19 + 0x00fb], %r28
	.word 0xf0440000  ! 534: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf0448000  ! 535: LDSW_R	ldsw	[%r18 + %r0], %r24
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf04420a9  ! 538: LDSW_I	ldsw	[%r16 + 0x00a9], %r24
	.word 0xbd518000  ! 542: RDPR_PSTATE	<illegal instruction>
	.word 0xb1500000  ! 544: RDPR_TPC	<illegal instruction>
	.word 0x91942160  ! 549: WRPR_PIL_I	wrpr	%r16, 0x0160, %pil
	.word 0xfa458000  ! 550: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xb5504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0x8995e0a5  ! 556: WRPR_TICK_I	wrpr	%r23, 0x00a5, %tick
	setx	0x2032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1ca1fe  ! 566: LDDF_I	ldd	[%r18, 0x01fe], %f31
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c13  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c13, %hpstate
	.word 0xf84d4000  ! 569: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xb151c000  ! 571: RDPR_TL	<illegal instruction>
	.word 0xf40c8000  ! 574: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xf80ca1e4  ! 578: LDUB_I	ldub	[%r18 + 0x01e4], %r28
	.word 0xf81dc000  ! 579: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xf005e1c4  ! 585: LDUW_I	lduw	[%r23 + 0x01c4], %r24
	.word 0xfc456023  ! 596: LDSW_I	ldsw	[%r21 + 0x0023], %r30
	.word 0x8994e111  ! 598: WRPR_TICK_I	wrpr	%r19, 0x0111, %tick
	.word 0xbe95c000  ! 599: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xf4048000  ! 600: LDUW_R	lduw	[%r18 + %r0], %r26
	mov	2, %r12
	.word 0x8f932000  ! 605: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa1da1c1  ! 607: LDD_I	ldd	[%r22 + 0x01c1], %r29
	.word 0xfa1da08e  ! 609: LDD_I	ldd	[%r22 + 0x008e], %r29
	.word 0xfe4dc000  ! 614: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xb7500000  ! 617: RDPR_TPC	<illegal instruction>
	.word 0xfc450000  ! 619: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xff1ce076  ! 621: LDDF_I	ldd	[%r19, 0x0076], %f31
	setx	0x1003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf845e024  ! 623: LDSW_I	ldsw	[%r23 + 0x0024], %r28
	.word 0xbd540000  ! 624: RDPR_GL	<illegal instruction>
	.word 0xb5508000  ! 629: RDPR_TSTATE	<illegal instruction>
	.word 0xf45d20f3  ! 641: LDX_I	ldx	[%r20 + 0x00f3], %r26
	.word 0xfc1c60f3  ! 642: LDD_I	ldd	[%r17 + 0x00f3], %r30
	.word 0xfe0461a3  ! 646: LDUW_I	lduw	[%r17 + 0x01a3], %r31
	.word 0xfc0de08f  ! 648: LDUB_I	ldub	[%r23 + 0x008f], %r30
	.word 0xbd508000  ! 651: RDPR_TSTATE	<illegal instruction>
	.word 0xf80ca017  ! 654: LDUB_I	ldub	[%r18 + 0x0017], %r28
	.word 0xfb1ca04c  ! 655: LDDF_I	ldd	[%r18, 0x004c], %f29
	.word 0xf25c2082  ! 658: LDX_I	ldx	[%r16 + 0x0082], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a4b  ! 659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
	.word 0xbd510000  ! 665: RDPR_TICK	<illegal instruction>
	.word 0xf4544000  ! 666: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf04d206c  ! 668: LDSB_I	ldsb	[%r20 + 0x006c], %r24
	setx	data_start_3, %g1, %r21
	.word 0xfc548000  ! 674: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xf814a0b0  ! 675: LDUH_I	lduh	[%r18 + 0x00b0], %r28
	.word 0x8995e08e  ! 676: WRPR_TICK_I	wrpr	%r23, 0x008e, %tick
	.word 0xb7480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8595e1b3  ! 686: WRPR_TSTATE_I	wrpr	%r23, 0x01b3, %tstate
	.word 0x85942196  ! 689: WRPR_TSTATE_I	wrpr	%r16, 0x0196, %tstate
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc55e140  ! 695: LDSH_I	ldsh	[%r23 + 0x0140], %r30
	.word 0xbec5c000  ! 700: ADDCcc_R	addccc 	%r23, %r0, %r31
	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe446055  ! 703: ADDC_I	addc 	%r17, 0x0055, %r31
	.word 0xf24520e0  ! 704: LDSW_I	ldsw	[%r20 + 0x00e0], %r25
	.word 0xf65420df  ! 705: LDSH_I	ldsh	[%r16 + 0x00df], %r27
	.word 0xf20c0000  ! 706: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf6442154  ! 707: LDSW_I	ldsw	[%r16 + 0x0154], %r27
	.word 0xb1500000  ! 712: RDPR_TPC	<illegal instruction>
	.word 0xfe5d0000  ! 721: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0x83956013  ! 723: WRPR_TNPC_I	wrpr	%r21, 0x0013, %tnpc
	.word 0xfc444000  ! 725: LDSW_R	ldsw	[%r17 + %r0], %r30
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r19
	.word 0xf80de086  ! 734: LDUB_I	ldub	[%r23 + 0x0086], %r28
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81983a99  ! 743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a99, %hpstate
	.word 0xf51d8000  ! 744: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xb3500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0xbd504000  ! 749: RDPR_TNPC	<illegal instruction>
	.word 0xfc0d6007  ! 759: LDUB_I	ldub	[%r21 + 0x0007], %r30
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5de188  ! 763: LDX_I	ldx	[%r23 + 0x0188], %r29
	.word 0x9195a0bf  ! 764: WRPR_PIL_I	wrpr	%r22, 0x00bf, %pil
	.word 0xfe54a068  ! 775: LDSH_I	ldsh	[%r18 + 0x0068], %r31
	.word 0xb7520000  ! 776: RDPR_PIL	<illegal instruction>
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 780: RDPR_TNPC	<illegal instruction>
	.word 0xf8154000  ! 782: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xb550c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0xfe048000  ! 785: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf64de1e9  ! 786: LDSB_I	ldsb	[%r23 + 0x01e9], %r27
	.word 0xf81ca083  ! 790: LDD_I	ldd	[%r18 + 0x0083], %r28
	.word 0xfe540000  ! 794: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xfc4de06d  ! 796: LDSB_I	ldsb	[%r23 + 0x006d], %r30
	.word 0xfe554000  ! 797: LDSH_R	ldsh	[%r21 + %r0], %r31
	setx	0x30307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d2186  ! 802: LDSB_I	ldsb	[%r20 + 0x0186], %r31
	setx	data_start_1, %g1, %r21
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	.word 0xf04d4000  ! 808: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf8446089  ! 809: LDSW_I	ldsw	[%r17 + 0x0089], %r28
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 820: RDPR_GL	<illegal instruction>
	.word 0xb7510000  ! 823: RDPR_TICK	<illegal instruction>
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0054000  ! 829: LDUW_R	lduw	[%r21 + %r0], %r24
	setx	data_start_4, %g1, %r21
	.word 0xf31ce1cb  ! 835: LDDF_I	ldd	[%r19, 0x01cb], %f25
	mov	2, %r14
	.word 0xa193a000  ! 838: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xff1d0000  ! 840: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xb1508000  ! 842: RDPR_TSTATE	<illegal instruction>
	.word 0xfa058000  ! 844: LDUW_R	lduw	[%r22 + %r0], %r29
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1c4000  ! 854: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xf80de082  ! 857: LDUB_I	ldub	[%r23 + 0x0082], %r28
	.word 0xf84421eb  ! 858: LDSW_I	ldsw	[%r16 + 0x01eb], %r28
	.word 0xf644e1e5  ! 859: LDSW_I	ldsw	[%r19 + 0x01e5], %r27
	.word 0xfe54c000  ! 860: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf81d217d  ! 862: LDD_I	ldd	[%r20 + 0x017d], %r28
	.word 0xf045e00c  ! 864: LDSW_I	ldsw	[%r23 + 0x000c], %r24
	.word 0xf044a0db  ! 865: LDSW_I	ldsw	[%r18 + 0x00db], %r24
	.word 0xfa4dc000  ! 866: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xf4456028  ! 868: LDSW_I	ldsw	[%r21 + 0x0028], %r26
	.word 0xb1518000  ! 873: RDPR_PSTATE	<illegal instruction>
	.word 0xf254e0e0  ! 875: LDSH_I	ldsh	[%r19 + 0x00e0], %r25
	.word 0xfc1d60ac  ! 876: LDD_I	ldd	[%r21 + 0x00ac], %r30
	.word 0xb53c5000  ! 877: SRAX_R	srax	%r17, %r0, %r26
	.word 0xb4b5c000  ! 882: SUBCcc_R	orncc 	%r23, %r0, %r26
	setx	data_start_2, %g1, %r16
	.word 0xf205c000  ! 886: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf00ce0cd  ! 890: LDUB_I	ldub	[%r19 + 0x00cd], %r24
	.word 0xf41c6177  ! 892: LDD_I	ldd	[%r17 + 0x0177], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982e81  ! 897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e81, %hpstate
	.word 0x8394e1c0  ! 899: WRPR_TNPC_I	wrpr	%r19, 0x01c0, %tnpc
	.word 0xf04d0000  ! 901: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xbd518000  ! 902: RDPR_PSTATE	<illegal instruction>
	.word 0xfe048000  ! 903: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xbe95201c  ! 908: ORcc_I	orcc 	%r20, 0x001c, %r31
	.word 0x89946155  ! 910: WRPR_TICK_I	wrpr	%r17, 0x0155, %tick
	.word 0x8d952081  ! 915: WRPR_PSTATE_I	wrpr	%r20, 0x0081, %pstate
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44de049  ! 920: LDSB_I	ldsb	[%r23 + 0x0049], %r26
	.word 0xf21dc000  ! 921: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xf404a124  ! 926: LDUW_I	lduw	[%r18 + 0x0124], %r26
	.word 0xf25460e5  ! 933: LDSH_I	ldsh	[%r17 + 0x00e5], %r25
	.word 0x8794e1a1  ! 936: WRPR_TT_I	wrpr	%r19, 0x01a1, %tt
	.word 0xfc1c0000  ! 939: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf45dc000  ! 941: LDX_R	ldx	[%r23 + %r0], %r26
	setx	0x322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0xb7520000  ! 947: RDPR_PIL	<illegal instruction>
	.word 0xf00521a9  ! 948: LDUW_I	lduw	[%r20 + 0x01a9], %r24
	.word 0x8d95e095  ! 950: WRPR_PSTATE_I	wrpr	%r23, 0x0095, %pstate
	.word 0xb1520000  ! 952: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc1da0f1  ! 956: LDD_I	ldd	[%r22 + 0x00f1], %r30
	.word 0xf8442042  ! 957: LDSW_I	ldsw	[%r16 + 0x0042], %r28
	.word 0x8995e1bf  ! 959: WRPR_TICK_I	wrpr	%r23, 0x01bf, %tick
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4546137  ! 964: LDSH_I	ldsh	[%r17 + 0x0137], %r26
	.word 0xf65c4000  ! 965: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xbd500000  ! 967: RDPR_TPC	<illegal instruction>
	.word 0xf0150000  ! 970: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xbeb44000  ! 971: ORNcc_R	orncc 	%r17, %r0, %r31
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba0cc000  ! 976: AND_R	and 	%r19, %r0, %r29
	.word 0xf60d0000  ! 977: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xfa45c000  ! 980: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf6448000  ! 981: LDSW_R	ldsw	[%r18 + %r0], %r27
	setx	data_start_1, %g1, %r23
	.word 0xf60c2051  ! 987: LDUB_I	ldub	[%r16 + 0x0051], %r27
	.word 0x8995e1c2  ! 995: WRPR_TICK_I	wrpr	%r23, 0x01c2, %tick
	.word 0xf254e028  ! 1001: LDSH_I	ldsh	[%r19 + 0x0028], %r25
	.word 0xb550c000  ! 1005: RDPR_TT	<illegal instruction>
	.word 0xfb1de1c5  ! 1007: LDDF_I	ldd	[%r23, 0x01c5], %f29
	setx	data_start_0, %g1, %r22
	.word 0xb9518000  ! 1013: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r20
	.word 0xff1ce1de  ! 1015: LDDF_I	ldd	[%r19, 0x01de], %f31
	setx	data_start_7, %g1, %r23
	.word 0xf80d6128  ! 1025: LDUB_I	ldub	[%r21 + 0x0128], %r28
	.word 0xf21dc000  ! 1026: LDD_R	ldd	[%r23 + %r0], %r25
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe458000  ! 1036: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf84d0000  ! 1041: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0x85942048  ! 1043: WRPR_TSTATE_I	wrpr	%r16, 0x0048, %tstate
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb81d2107  ! 1046: XOR_I	xor 	%r20, 0x0107, %r28
	setx	0x2011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4ca082  ! 1052: LDSB_I	ldsb	[%r18 + 0x0082], %r31
	.word 0xff1c4000  ! 1056: LDDF_R	ldd	[%r17, %r0], %f31
	setx	0x20008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8056137  ! 1060: LDUW_I	lduw	[%r21 + 0x0137], %r28
	.word 0xf0548000  ! 1061: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf20c8000  ! 1062: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xf85d0000  ! 1066: LDX_R	ldx	[%r20 + %r0], %r28
	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4540000  ! 1076: LDSH_R	ldsh	[%r16 + %r0], %r26
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 1078: RDPR_PSTATE	<illegal instruction>
	.word 0x8995e155  ! 1079: WRPR_TICK_I	wrpr	%r23, 0x0155, %tick
	.word 0x81946014  ! 1080: WRPR_TPC_I	wrpr	%r17, 0x0014, %tpc
	.word 0xf044a18e  ! 1083: LDSW_I	ldsw	[%r18 + 0x018e], %r24
	.word 0xf61d0000  ! 1086: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xf44c60cb  ! 1089: LDSB_I	ldsb	[%r17 + 0x00cb], %r26
	.word 0xf44ce0d7  ! 1090: LDSB_I	ldsb	[%r19 + 0x00d7], %r26
	.word 0xb8b5e005  ! 1091: ORNcc_I	orncc 	%r23, 0x0005, %r28
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 1098: RDPR_TNPC	<illegal instruction>
	.word 0xf8150000  ! 1099: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xf41c4000  ! 1104: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xb17d0400  ! 1106: MOVR_R	movre	%r20, %r0, %r24
	.word 0xf655e16c  ! 1107: LDSH_I	ldsh	[%r23 + 0x016c], %r27
	.word 0xf24ce14a  ! 1111: LDSB_I	ldsb	[%r19 + 0x014a], %r25
	.word 0xf25de1ff  ! 1112: LDX_I	ldx	[%r23 + 0x01ff], %r25
	.word 0xf80c0000  ! 1113: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xbf504000  ! 1115: RDPR_TNPC	<illegal instruction>
	.word 0xb88da09a  ! 1118: ANDcc_I	andcc 	%r22, 0x009a, %r28
	.word 0xb134b001  ! 1119: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xbd504000  ! 1121: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf05d6073  ! 1123: LDX_I	ldx	[%r21 + 0x0073], %r24
	.word 0x8595210c  ! 1128: WRPR_TSTATE_I	wrpr	%r20, 0x010c, %tstate
	.word 0xf61d61ad  ! 1130: LDD_I	ldd	[%r21 + 0x01ad], %r27
	.word 0xfa0c4000  ! 1132: LDUB_R	ldub	[%r17 + %r0], %r29
	mov	2, %r12
	.word 0x8f932000  ! 1133: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf45d0000  ! 1136: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0x919521c8  ! 1137: WRPR_PIL_I	wrpr	%r20, 0x01c8, %pil
	.word 0xfb1ca0e0  ! 1140: LDDF_I	ldd	[%r18, 0x00e0], %f29
	.word 0xb53cc000  ! 1141: SRA_R	sra 	%r19, %r0, %r26
	.word 0xb3504000  ! 1142: RDPR_TNPC	<illegal instruction>
	.word 0xb97cc400  ! 1143: MOVR_R	movre	%r19, %r0, %r28
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2db001  ! 1151: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xfd1d8000  ! 1155: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xfc44612c  ! 1157: LDSW_I	ldsw	[%r17 + 0x012c], %r30
	.word 0xf65c60f4  ! 1163: LDX_I	ldx	[%r17 + 0x00f4], %r27
	.word 0xba9d0000  ! 1164: XORcc_R	xorcc 	%r20, %r0, %r29
	.word 0xf80d8000  ! 1165: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xb3510000  ! 1169: RDPR_TICK	<illegal instruction>
	.word 0xbf2c6001  ! 1170: SLL_I	sll 	%r17, 0x0001, %r31
	.word 0xf24c4000  ! 1172: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xbb500000  ! 1173: RDPR_TPC	<illegal instruction>
	.word 0xbc9561ee  ! 1175: ORcc_I	orcc 	%r21, 0x01ee, %r30
	.word 0xf245615a  ! 1177: LDSW_I	ldsw	[%r21 + 0x015a], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5c0000  ! 1182: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf4048000  ! 1183: LDUW_R	lduw	[%r18 + %r0], %r26
	setx	data_start_7, %g1, %r18
	.word 0xfc5cc000  ! 1196: LDX_R	ldx	[%r19 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982981  ! 1197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0981, %hpstate
	.word 0xb33df001  ! 1199: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xb350c000  ! 1200: RDPR_TT	<illegal instruction>
	.word 0xf414a0ea  ! 1204: LDUH_I	lduh	[%r18 + 0x00ea], %r26
	.word 0xbf508000  ! 1205: RDPR_TSTATE	<illegal instruction>
	.word 0xfc050000  ! 1206: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xf844c000  ! 1209: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf215a021  ! 1211: LDUH_I	lduh	[%r22 + 0x0021], %r25
	.word 0xfc0c0000  ! 1213: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0x8795e0e5  ! 1217: WRPR_TT_I	wrpr	%r23, 0x00e5, %tt
	.word 0xf11dc000  ! 1219: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xb9510000  ! 1220: RDPR_TICK	<illegal instruction>
	.word 0xf205c000  ! 1221: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xfa1c201f  ! 1222: LDD_I	ldd	[%r16 + 0x001f], %r29
	.word 0xfc5d608f  ! 1223: LDX_I	ldx	[%r21 + 0x008f], %r30
	.word 0xba1c8000  ! 1228: XOR_R	xor 	%r18, %r0, %r29
	.word 0xbeb44000  ! 1235: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xfc4ce092  ! 1236: LDSB_I	ldsb	[%r19 + 0x0092], %r30
	.word 0x879461ed  ! 1239: WRPR_TT_I	wrpr	%r17, 0x01ed, %tt
	.word 0x8994e15c  ! 1245: WRPR_TICK_I	wrpr	%r19, 0x015c, %tick
	.word 0xb01560cc  ! 1248: OR_I	or 	%r21, 0x00cc, %r24
	.word 0xb6aca1d6  ! 1250: ANDNcc_I	andncc 	%r18, 0x01d6, %r27
	.word 0xf04c8000  ! 1252: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xfe44c000  ! 1254: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xf25520cd  ! 1255: LDSH_I	ldsh	[%r20 + 0x00cd], %r25
	.word 0x83956068  ! 1256: WRPR_TNPC_I	wrpr	%r21, 0x0068, %tnpc
	.word 0xbb51c000  ! 1265: RDPR_TL	<illegal instruction>
	.word 0xfc050000  ! 1270: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xbf2c5000  ! 1272: SLLX_R	sllx	%r17, %r0, %r31
	.word 0xb9504000  ! 1273: RDPR_TNPC	<illegal instruction>
	.word 0xf844c000  ! 1274: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xb225c000  ! 1276: SUB_R	sub 	%r23, %r0, %r25
	.word 0xbd520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0xf2544000  ! 1285: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0x8d95a0e1  ! 1286: WRPR_PSTATE_I	wrpr	%r22, 0x00e1, %pstate
	.word 0xfc0c208d  ! 1291: LDUB_I	ldub	[%r16 + 0x008d], %r30
	.word 0xf60561bc  ! 1292: LDUW_I	lduw	[%r21 + 0x01bc], %r27
	.word 0xf8558000  ! 1293: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xfe548000  ! 1296: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xf64de195  ! 1304: LDSB_I	ldsb	[%r23 + 0x0195], %r27
	.word 0xb1500000  ! 1305: RDPR_TPC	<illegal instruction>
	.word 0xf2454000  ! 1307: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf51c8000  ! 1310: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xb17c2401  ! 1311: MOVR_I	movre	%r16, 0x1, %r24
	setx	data_start_0, %g1, %r20
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 1321: RDPR_TNPC	<illegal instruction>
	.word 0xb1518000  ! 1323: RDPR_PSTATE	<illegal instruction>
	.word 0xf85dc000  ! 1326: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf65421ff  ! 1330: LDSH_I	ldsh	[%r16 + 0x01ff], %r27
	.word 0xb3518000  ! 1332: RDPR_PSTATE	<illegal instruction>
	.word 0xb3480000  ! 1335: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	data_start_4, %g1, %r17
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 1344: RDPR_PSTATE	<illegal instruction>
	.word 0xf055e19f  ! 1345: LDSH_I	ldsh	[%r23 + 0x019f], %r24
	setx	data_start_7, %g1, %r21
	.word 0xf215a12d  ! 1347: LDUH_I	lduh	[%r22 + 0x012d], %r25
	.word 0xf84c4000  ! 1352: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xfe5ce0ae  ! 1354: LDX_I	ldx	[%r19 + 0x00ae], %r31
	.word 0xfe140000  ! 1356: LDUH_R	lduh	[%r16 + %r0], %r31
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe55a05f  ! 1362: LDSH_I	ldsh	[%r22 + 0x005f], %r31
	.word 0xf31d8000  ! 1363: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xf0150000  ! 1365: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xfb1d206b  ! 1368: LDDF_I	ldd	[%r20, 0x006b], %f29
	.word 0xf44560d5  ! 1370: LDSW_I	ldsw	[%r21 + 0x00d5], %r26
	.word 0xf254a1a4  ! 1373: LDSH_I	ldsh	[%r18 + 0x01a4], %r25
	.word 0xf11d8000  ! 1374: LDDF_R	ldd	[%r22, %r0], %f24
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1ce1bf  ! 1383: LDD_I	ldd	[%r19 + 0x01bf], %r30
	.word 0xfb1c0000  ! 1386: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xfa1dc000  ! 1388: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xfc1421a8  ! 1389: LDUH_I	lduh	[%r16 + 0x01a8], %r30
	.word 0xf414e11a  ! 1390: LDUH_I	lduh	[%r19 + 0x011a], %r26
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2de001  ! 1395: SLL_I	sll 	%r23, 0x0001, %r29
	.word 0xb5510000  ! 1396: RDPR_TICK	<illegal instruction>
	.word 0xfb1c0000  ! 1397: LDDF_R	ldd	[%r16, %r0], %f29
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65561bf  ! 1405: LDSH_I	ldsh	[%r21 + 0x01bf], %r27
	.word 0xf415c000  ! 1407: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xb9510000  ! 1410: RDPR_TICK	<illegal instruction>
	.word 0xb7510000  ! 1411: RDPR_TICK	<illegal instruction>
	.word 0xb6444000  ! 1413: ADDC_R	addc 	%r17, %r0, %r27
	.word 0x819460f5  ! 1414: WRPR_TPC_I	wrpr	%r17, 0x00f5, %tpc
	.word 0xfe142003  ! 1415: LDUH_I	lduh	[%r16 + 0x0003], %r31
	.word 0xb23d61f8  ! 1420: XNOR_I	xnor 	%r21, 0x01f8, %r25
	.word 0xf004c000  ! 1422: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xb93c8000  ! 1424: SRA_R	sra 	%r18, %r0, %r28
	.word 0xf84da1bd  ! 1425: LDSB_I	ldsb	[%r22 + 0x01bd], %r28
	.word 0xf04d8000  ! 1426: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf244c000  ! 1427: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xb28420d0  ! 1429: ADDcc_I	addcc 	%r16, 0x00d0, %r25
	.word 0x859520a2  ! 1431: WRPR_TSTATE_I	wrpr	%r20, 0x00a2, %tstate
	.word 0xf60d21d8  ! 1433: LDUB_I	ldub	[%r20 + 0x01d8], %r27
	.word 0xbb343001  ! 1434: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xfd1d4000  ! 1435: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf44c0000  ! 1438: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xb5480000  ! 1440: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbc1c8000  ! 1442: XOR_R	xor 	%r18, %r0, %r30
	.word 0xfe0ce1c9  ! 1443: LDUB_I	ldub	[%r19 + 0x01c9], %r31
	.word 0xfe456148  ! 1444: LDSW_I	ldsw	[%r21 + 0x0148], %r31
	setx	data_start_2, %g1, %r21
	.word 0xb17d8400  ! 1448: MOVR_R	movre	%r22, %r0, %r24
	.word 0xbf51c000  ! 1449: RDPR_TL	<illegal instruction>
	.word 0xfb1ce0e7  ! 1450: LDDF_I	ldd	[%r19, 0x00e7], %f29
	mov	2, %r12
	.word 0x8f932000  ! 1451: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf80de113  ! 1452: LDUB_I	ldub	[%r23 + 0x0113], %r28
	.word 0xf80d6187  ! 1453: LDUB_I	ldub	[%r21 + 0x0187], %r28
	.word 0xf31d4000  ! 1455: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xb3510000  ! 1458: RDPR_TICK	<illegal instruction>
	.word 0x879461ae  ! 1461: WRPR_TT_I	wrpr	%r17, 0x01ae, %tt
	.word 0x8d95a0a5  ! 1462: WRPR_PSTATE_I	wrpr	%r22, 0x00a5, %pstate
	.word 0xf04521e4  ! 1466: LDSW_I	ldsw	[%r20 + 0x01e4], %r24
	.word 0xbb540000  ! 1475: RDPR_GL	<illegal instruction>
	.word 0xfc444000  ! 1477: LDSW_R	ldsw	[%r17 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983919  ! 1480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1919, %hpstate
	setx	0x10b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1489: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80d0000  ! 1492: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf45ce1f7  ! 1495: LDX_I	ldx	[%r19 + 0x01f7], %r26
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 1501: RDPR_TPC	<illegal instruction>
	.word 0xf644e1e1  ! 1505: LDSW_I	ldsw	[%r19 + 0x01e1], %r27
	.word 0xbc9c4000  ! 1510: XORcc_R	xorcc 	%r17, %r0, %r30
	setx	data_start_4, %g1, %r17
	.word 0xf85c8000  ! 1514: LDX_R	ldx	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d8b  ! 1517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8b, %hpstate
	.word 0xf65c21c5  ! 1519: LDX_I	ldx	[%r16 + 0x01c5], %r27
	.word 0xfe4de07a  ! 1522: LDSB_I	ldsb	[%r23 + 0x007a], %r31
	.word 0xb5500000  ! 1525: RDPR_TPC	<illegal instruction>
	.word 0xff1d4000  ! 1527: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xf4144000  ! 1536: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xf04d6197  ! 1545: LDSB_I	ldsb	[%r21 + 0x0197], %r24
	mov	1, %r12
	.word 0x8f932000  ! 1553: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_6, %g1, %r21
	.word 0xb551c000  ! 1556: RDPR_TL	<illegal instruction>
	.word 0xf24d20ac  ! 1558: LDSB_I	ldsb	[%r20 + 0x00ac], %r25
	.word 0xbaa4a1d2  ! 1561: SUBcc_I	subcc 	%r18, 0x01d2, %r29
	.word 0xf61c0000  ! 1562: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xf45cc000  ! 1563: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xfe05e07d  ! 1566: LDUW_I	lduw	[%r23 + 0x007d], %r31
	.word 0xbb510000  ! 1567: RDPR_TICK	<illegal instruction>
	.word 0xfe1c8000  ! 1570: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xfc154000  ! 1575: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf014c000  ! 1578: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xb150c000  ! 1580: RDPR_TT	<illegal instruction>
	.word 0xf445c000  ! 1582: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0x85952044  ! 1586: WRPR_TSTATE_I	wrpr	%r20, 0x0044, %tstate
	.word 0xb4b5e0be  ! 1589: SUBCcc_I	orncc 	%r23, 0x00be, %r26
	.word 0xfd1c4000  ! 1592: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xf80ca0ce  ! 1593: LDUB_I	ldub	[%r18 + 0x00ce], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd2c9000  ! 1597: SLLX_R	sllx	%r18, %r0, %r30
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	.word 0xb5510000  ! 1602: RDPR_TICK	<illegal instruction>
	.word 0xfe04c000  ! 1603: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xfa0d201b  ! 1605: LDUB_I	ldub	[%r20 + 0x001b], %r29
	.word 0xf91d2124  ! 1607: LDDF_I	ldd	[%r20, 0x0124], %f28
	.word 0xf44c8000  ! 1609: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xb3351000  ! 1611: SRLX_R	srlx	%r20, %r0, %r25
	setx	0x30234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84ce048  ! 1617: LDSB_I	ldsb	[%r19 + 0x0048], %r28
	.word 0x8994e1ac  ! 1620: WRPR_TICK_I	wrpr	%r19, 0x01ac, %tick
	.word 0xb951c000  ! 1622: RDPR_TL	rdpr	%tl, %r28
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21dc000  ! 1626: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xb7540000  ! 1627: RDPR_GL	<illegal instruction>
	.word 0xfe0da0f1  ! 1630: LDUB_I	ldub	[%r22 + 0x00f1], %r31
	.word 0xb0b5e1f8  ! 1634: SUBCcc_I	orncc 	%r23, 0x01f8, %r24
	.word 0xfc144000  ! 1635: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xfc448000  ! 1637: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xb7504000  ! 1638: RDPR_TNPC	<illegal instruction>
	.word 0xfc4da11a  ! 1639: LDSB_I	ldsb	[%r22 + 0x011a], %r30
	.word 0xf8054000  ! 1640: LDUW_R	lduw	[%r21 + %r0], %r28
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04da1f1  ! 1645: LDSB_I	ldsb	[%r22 + 0x01f1], %r24
	.word 0xf00ce0b7  ! 1647: LDUB_I	ldub	[%r19 + 0x00b7], %r24
	mov	0, %r12
	.word 0x8f932000  ! 1648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf804211d  ! 1650: LDUW_I	lduw	[%r16 + 0x011d], %r28
	.word 0xbd510000  ! 1651: RDPR_TICK	<illegal instruction>
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64c0000  ! 1659: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xfc1d0000  ! 1664: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xb5510000  ! 1665: RDPR_TICK	<illegal instruction>
	.word 0xb33c6001  ! 1666: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0xb62c0000  ! 1673: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xf04dc000  ! 1674: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf00420bf  ! 1676: LDUW_I	lduw	[%r16 + 0x00bf], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983841  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1841, %hpstate
	.word 0xb0a54000  ! 1682: SUBcc_R	subcc 	%r21, %r0, %r24
	.word 0xf11d61be  ! 1685: LDDF_I	ldd	[%r21, 0x01be], %f24
	.word 0xf60dc000  ! 1688: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf40dc000  ! 1691: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf215a188  ! 1694: LDUH_I	lduh	[%r22 + 0x0188], %r25
	.word 0xf0050000  ! 1696: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xfe556189  ! 1697: LDSH_I	ldsh	[%r21 + 0x0189], %r31
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 1700: RDPR_PSTATE	<illegal instruction>
	.word 0xb0bdc000  ! 1701: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xf91dc000  ! 1705: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf61c0000  ! 1708: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xb7643801  ! 1711: MOVcc_I	<illegal instruction>
	.word 0xf654a061  ! 1712: LDSH_I	ldsh	[%r18 + 0x0061], %r27
	.word 0xf244a1df  ! 1714: LDSW_I	ldsw	[%r18 + 0x01df], %r25
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5d8000  ! 1717: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xf40ce04d  ! 1718: LDUB_I	ldub	[%r19 + 0x004d], %r26
	.word 0xfd1de0e9  ! 1721: LDDF_I	ldd	[%r23, 0x00e9], %f30
	.word 0xfc4da0bf  ! 1722: LDSB_I	ldsb	[%r22 + 0x00bf], %r30
	.word 0x8595e177  ! 1724: WRPR_TSTATE_I	wrpr	%r23, 0x0177, %tstate
	.word 0xf6540000  ! 1727: LDSH_R	ldsh	[%r16 + %r0], %r27
	setx	0x38, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0444000  ! 1731: LDSW_R	ldsw	[%r17 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983ad9  ! 1743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad9, %hpstate
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a09b  ! 1749: WRPR_TPC_I	wrpr	%r22, 0x009b, %tpc
	.word 0x9194208c  ! 1752: WRPR_PIL_I	wrpr	%r16, 0x008c, %pil
	.word 0xf044a0cb  ! 1753: LDSW_I	ldsw	[%r18 + 0x00cb], %r24
	.word 0x919521ca  ! 1754: WRPR_PIL_I	wrpr	%r20, 0x01ca, %pil
	.word 0xbb520000  ! 1760: RDPR_PIL	<illegal instruction>
	.word 0xbb518000  ! 1762: RDPR_PSTATE	<illegal instruction>
	.word 0xf20c0000  ! 1763: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xfe552145  ! 1769: LDSH_I	ldsh	[%r20 + 0x0145], %r31
	.word 0xb951c000  ! 1771: RDPR_TL	<illegal instruction>
	.word 0xfa54a1e0  ! 1772: LDSH_I	ldsh	[%r18 + 0x01e0], %r29
	.word 0xf2550000  ! 1773: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf004e1ab  ! 1774: LDUW_I	lduw	[%r19 + 0x01ab], %r24
	setx	0x10312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45c4000  ! 1782: LDX_R	ldx	[%r17 + %r0], %r26
	setx	0x2022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa458000  ! 1784: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xfb1de085  ! 1787: LDDF_I	ldd	[%r23, 0x0085], %f29
	.word 0xf2054000  ! 1790: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xfe14a0b2  ! 1797: LDUH_I	lduh	[%r18 + 0x00b2], %r31
	.word 0x819560e8  ! 1798: WRPR_TPC_I	wrpr	%r21, 0x00e8, %tpc
	.word 0x9195204c  ! 1800: WRPR_PIL_I	wrpr	%r20, 0x004c, %pil
	.word 0xf015e1ee  ! 1803: LDUH_I	lduh	[%r23 + 0x01ee], %r24
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84da003  ! 1805: LDSB_I	ldsb	[%r22 + 0x0003], %r28
	.word 0x8195e067  ! 1806: WRPR_TPC_I	wrpr	%r23, 0x0067, %tpc
	.word 0xfa0da13f  ! 1807: LDUB_I	ldub	[%r22 + 0x013f], %r29
	.word 0xb3520000  ! 1813: RDPR_PIL	rdpr	%pil, %r25
	mov	1, %r14
	.word 0xa193a000  ! 1818: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc550000  ! 1819: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xbc0de00a  ! 1825: AND_I	and 	%r23, 0x000a, %r30
	.word 0xf6444000  ! 1828: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xf004a08d  ! 1829: LDUW_I	lduw	[%r18 + 0x008d], %r24
	.word 0xf014200c  ! 1832: LDUH_I	lduh	[%r16 + 0x000c], %r24
	setx	data_start_1, %g1, %r19
	.word 0xfa1c4000  ! 1836: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xb7520000  ! 1839: RDPR_PIL	<illegal instruction>
	.word 0xf61cc000  ! 1840: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xb5518000  ! 1841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983f59  ! 1843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f59, %hpstate
	.word 0xf0556172  ! 1845: LDSH_I	ldsh	[%r21 + 0x0172], %r24
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 1849: RDPR_TICK	<illegal instruction>
	.word 0xf71ce084  ! 1855: LDDF_I	ldd	[%r19, 0x0084], %f27
	.word 0xf21cc000  ! 1860: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xb1518000  ! 1861: RDPR_PSTATE	<illegal instruction>
	.word 0x8594211f  ! 1863: WRPR_TSTATE_I	wrpr	%r16, 0x011f, %tstate
	setx	data_start_2, %g1, %r16
	.word 0x8394213a  ! 1871: WRPR_TNPC_I	wrpr	%r16, 0x013a, %tnpc
	.word 0xb4ada102  ! 1874: ANDNcc_I	andncc 	%r22, 0x0102, %r26
	.word 0x8394609d  ! 1875: WRPR_TNPC_I	wrpr	%r17, 0x009d, %tnpc
	.word 0xf40d216d  ! 1876: LDUB_I	ldub	[%r20 + 0x016d], %r26
	.word 0xfe4dc000  ! 1879: LDSB_R	ldsb	[%r23 + %r0], %r31
	setx	0x1011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 1883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_3, %g1, %r22
	.word 0xbc84a02a  ! 1886: ADDcc_I	addcc 	%r18, 0x002a, %r30
	.word 0xf404c000  ! 1887: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf84cc000  ! 1888: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xb0b46018  ! 1891: ORNcc_I	orncc 	%r17, 0x0018, %r24
	.word 0xfe4421c7  ! 1894: LDSW_I	ldsw	[%r16 + 0x01c7], %r31
	.word 0xb8b46030  ! 1896: ORNcc_I	orncc 	%r17, 0x0030, %r28
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf804a12d  ! 1902: LDUW_I	lduw	[%r18 + 0x012d], %r28
	.word 0xfa0c8000  ! 1903: LDUB_R	ldub	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2058000  ! 1916: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xf444e10d  ! 1920: LDSW_I	ldsw	[%r19 + 0x010d], %r26
	.word 0xb5540000  ! 1922: RDPR_GL	<illegal instruction>
	setx	0x217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819461fc  ! 1928: WRPR_TPC_I	wrpr	%r17, 0x01fc, %tpc
	.word 0xfa1c8000  ! 1929: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xfc0c202e  ! 1930: LDUB_I	ldub	[%r16 + 0x002e], %r30
	.word 0xb37de401  ! 1932: MOVR_I	movre	%r23, 0x1, %r25
	setx	0x32d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 1938: RDPR_TSTATE	<illegal instruction>
	setx	0x32a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205c000  ! 1952: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xbb51c000  ! 1953: RDPR_TL	<illegal instruction>
	setx	0x3001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31da03a  ! 1958: LDDF_I	ldd	[%r22, 0x003a], %f25
	.word 0xb3504000  ! 1965: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b4b  ! 1966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4b, %hpstate
	.word 0xfa5dc000  ! 1967: LDX_R	ldx	[%r23 + %r0], %r29
	setx	data_start_1, %g1, %r20
	.word 0xb4440000  ! 1969: ADDC_R	addc 	%r16, %r0, %r26
	.word 0x8d9421a2  ! 1970: WRPR_PSTATE_I	wrpr	%r16, 0x01a2, %pstate
	.word 0x919421b8  ! 1972: WRPR_PIL_I	wrpr	%r16, 0x01b8, %pil
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1c8000  ! 1975: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xfa5d0000  ! 1980: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0xf01de1d2  ! 1981: LDD_I	ldd	[%r23 + 0x01d2], %r24
	.word 0xf8150000  ! 1985: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xf0456108  ! 1987: LDSW_I	ldsw	[%r21 + 0x0108], %r24
	.word 0xfe0da0e0  ! 1989: LDUB_I	ldub	[%r22 + 0x00e0], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfd1dc000  ! 1991: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xfa4d8000  ! 1994: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf01ce074  ! 1996: LDD_I	ldd	[%r19 + 0x0074], %r24
	setx	0x20216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04cc000  ! 1999: LDSB_R	ldsb	[%r19 + %r0], %r24
	setx	0x30200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983801  ! 2015: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1801, %hpstate
	.word 0xfe5d601a  ! 2018: LDX_I	ldx	[%r21 + 0x001a], %r31
	setx	data_start_4, %g1, %r21
	.word 0xfc4dc000  ! 2025: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xf8048000  ! 2026: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xff1d0000  ! 2028: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xf8558000  ! 2030: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xf25c4000  ! 2032: LDX_R	ldx	[%r17 + %r0], %r25
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2034: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd518000  ! 2039: RDPR_PSTATE	<illegal instruction>
	.word 0xb5518000  ! 2040: RDPR_PSTATE	<illegal instruction>
	.word 0xfa4cc000  ! 2041: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xf05dc000  ! 2043: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xfa146017  ! 2044: LDUH_I	lduh	[%r17 + 0x0017], %r29
	setx	0x10030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb094a1c2  ! 2046: ORcc_I	orcc 	%r18, 0x01c2, %r24
	.word 0xbc85c000  ! 2050: ADDcc_R	addcc 	%r23, %r0, %r30
	.word 0xbac4c000  ! 2054: ADDCcc_R	addccc 	%r19, %r0, %r29
	.word 0xf415a14b  ! 2055: LDUH_I	lduh	[%r22 + 0x014b], %r26
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa04616e  ! 2058: LDUW_I	lduw	[%r17 + 0x016e], %r29
	.word 0xf205c000  ! 2060: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xb92cc000  ! 2065: SLL_R	sll 	%r19, %r0, %r28
	.word 0x8795e046  ! 2068: WRPR_TT_I	wrpr	%r23, 0x0046, %tt
	.word 0xf01d8000  ! 2070: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xbd500000  ! 2071: RDPR_TPC	<illegal instruction>
	.word 0xfe0ca115  ! 2077: LDUB_I	ldub	[%r18 + 0x0115], %r31
	setx	0x10219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 2079: RDPR_PSTATE	<illegal instruction>
	.word 0xf2556028  ! 2081: LDSH_I	ldsh	[%r21 + 0x0028], %r25
	setx	0x30203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40ce1a1  ! 2091: LDUB_I	ldub	[%r19 + 0x01a1], %r26
	.word 0xf214213d  ! 2092: LDUH_I	lduh	[%r16 + 0x013d], %r25
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a19a  ! 2095: WRPR_PIL_I	wrpr	%r22, 0x019a, %pil
	.word 0xf40da007  ! 2098: LDUB_I	ldub	[%r22 + 0x0007], %r26
	.word 0xfc4c60fe  ! 2101: LDSB_I	ldsb	[%r17 + 0x00fe], %r30
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85ca105  ! 2106: LDX_I	ldx	[%r18 + 0x0105], %r28
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf045a05b  ! 2118: LDSW_I	ldsw	[%r22 + 0x005b], %r24
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 2122: RDPR_TL	<illegal instruction>
	.word 0x8d94a144  ! 2125: WRPR_PSTATE_I	wrpr	%r18, 0x0144, %pstate
	.word 0xf04dc000  ! 2130: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xbf51c000  ! 2132: RDPR_TL	<illegal instruction>
	setx	data_start_1, %g1, %r17
	.word 0xfa148000  ! 2134: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf85d6031  ! 2136: LDX_I	ldx	[%r21 + 0x0031], %r28
	setx	0x20305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc142194  ! 2143: LDUH_I	lduh	[%r16 + 0x0194], %r30
	.word 0xf45d206b  ! 2146: LDX_I	ldx	[%r20 + 0x006b], %r26
	.word 0xf20c61c7  ! 2147: LDUB_I	ldub	[%r17 + 0x01c7], %r25
	.word 0xba2d2065  ! 2161: ANDN_I	andn 	%r20, 0x0065, %r29
	.word 0xbb504000  ! 2164: RDPR_TNPC	<illegal instruction>
	.word 0x8194606d  ! 2169: WRPR_TPC_I	wrpr	%r17, 0x006d, %tpc
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf015a1e3  ! 2175: LDUH_I	lduh	[%r22 + 0x01e3], %r24
	.word 0xf8140000  ! 2176: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xf71d0000  ! 2183: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xf25ce01f  ! 2184: LDX_I	ldx	[%r19 + 0x001f], %r25
	setx	0x30131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51c2049  ! 2188: LDDF_I	ldd	[%r16, 0x0049], %f26
	setx	0x1023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24d8000  ! 2191: LDSB_R	ldsb	[%r22 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8395205a  ! 2193: WRPR_TNPC_I	wrpr	%r20, 0x005a, %tnpc
	.word 0xfc454000  ! 2200: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xfc0da1eb  ! 2201: LDUB_I	ldub	[%r22 + 0x01eb], %r30
	mov	0, %r14
	.word 0xa193a000  ! 2204: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc050000  ! 2209: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xff1c8000  ! 2210: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xb0942184  ! 2211: ORcc_I	orcc 	%r16, 0x0184, %r24
	.word 0xf645c000  ! 2213: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xfc54c000  ! 2215: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xfa5c4000  ! 2222: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xbd540000  ! 2224: RDPR_GL	<illegal instruction>
	.word 0xf614a142  ! 2225: LDUH_I	lduh	[%r18 + 0x0142], %r27
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2c5a197  ! 2232: ADDCcc_I	addccc 	%r22, 0x0197, %r25
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25c20c1  ! 2236: LDX_I	ldx	[%r16 + 0x00c1], %r25
	.word 0xf8154000  ! 2237: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xb3480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa44c000  ! 2246: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xfc050000  ! 2250: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfe4c0000  ! 2251: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xbf500000  ! 2252: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d8b  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8b, %hpstate
	.word 0xff1d8000  ! 2254: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xb6a4a19e  ! 2256: SUBcc_I	subcc 	%r18, 0x019e, %r27
	.word 0x8195a0d3  ! 2257: WRPR_TPC_I	wrpr	%r22, 0x00d3, %tpc
	.word 0x9195e1c3  ! 2265: WRPR_PIL_I	wrpr	%r23, 0x01c3, %pil
	.word 0xfd1c4000  ! 2269: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xfe4460ce  ! 2270: LDSW_I	ldsw	[%r17 + 0x00ce], %r31
	.word 0xf64ca025  ! 2276: LDSB_I	ldsb	[%r18 + 0x0025], %r27
	.word 0xfc0c2095  ! 2278: LDUB_I	ldub	[%r16 + 0x0095], %r30
	.word 0xb32c5000  ! 2287: SLLX_R	sllx	%r17, %r0, %r25
	.word 0x8195e05b  ! 2288: WRPR_TPC_I	wrpr	%r23, 0x005b, %tpc
	.word 0xf0458000  ! 2290: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xb2b4c000  ! 2295: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xb951c000  ! 2296: RDPR_TL	<illegal instruction>
	.word 0xbabcc000  ! 2297: XNORcc_R	xnorcc 	%r19, %r0, %r29
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80dc000  ! 2299: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0x8d95a080  ! 2300: WRPR_PSTATE_I	wrpr	%r22, 0x0080, %pstate
	.word 0xfc4c2116  ! 2303: LDSB_I	ldsb	[%r16 + 0x0116], %r30
	.word 0xf25520e3  ! 2304: LDSH_I	ldsh	[%r20 + 0x00e3], %r25
	.word 0xfc1c0000  ! 2305: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xfd1dc000  ! 2306: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf2456116  ! 2310: LDSW_I	ldsw	[%r21 + 0x0116], %r25
	.word 0xf8150000  ! 2312: LDUH_R	lduh	[%r20 + %r0], %r28
	setx	data_start_2, %g1, %r16
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61c6134  ! 2320: LDD_I	ldd	[%r17 + 0x0134], %r27
	.word 0x8794e14d  ! 2322: WRPR_TT_I	wrpr	%r19, 0x014d, %tt
	.word 0xb151c000  ! 2323: RDPR_TL	<illegal instruction>
	.word 0xb48ce1a2  ! 2326: ANDcc_I	andcc 	%r19, 0x01a2, %r26
	.word 0xb625c000  ! 2327: SUB_R	sub 	%r23, %r0, %r27
	.word 0xf2158000  ! 2328: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xfc04a155  ! 2329: LDUW_I	lduw	[%r18 + 0x0155], %r30
	.word 0xb2848000  ! 2330: ADDcc_R	addcc 	%r18, %r0, %r25
	.word 0xf64c8000  ! 2332: LDSB_R	ldsb	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983d9b  ! 2335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9b, %hpstate
	.word 0xb9508000  ! 2336: RDPR_TSTATE	<illegal instruction>
	.word 0xfe040000  ! 2337: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xf81d60ba  ! 2341: LDD_I	ldd	[%r21 + 0x00ba], %r28
	.word 0xfa054000  ! 2342: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xfe1d4000  ! 2343: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xf644a1c2  ! 2344: LDSW_I	ldsw	[%r18 + 0x01c2], %r27
	.word 0xb81520b3  ! 2346: OR_I	or 	%r20, 0x00b3, %r28
	.word 0xfe4c8000  ! 2347: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xf04ca0d8  ! 2348: LDSB_I	ldsb	[%r18 + 0x00d8], %r24
	.word 0xbe8de05b  ! 2350: ANDcc_I	andcc 	%r23, 0x005b, %r31
	.word 0xf64421d7  ! 2351: LDSW_I	ldsw	[%r16 + 0x01d7], %r27
	.word 0xf64ca09c  ! 2352: LDSB_I	ldsb	[%r18 + 0x009c], %r27
	.word 0xf8140000  ! 2354: LDUH_R	lduh	[%r16 + %r0], %r28
	mov	1, %r12
	.word 0x8f932000  ! 2359: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x839420d7  ! 2364: WRPR_TNPC_I	wrpr	%r16, 0x00d7, %tnpc
	setx	0x20306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1da0e8  ! 2368: LDDF_I	ldd	[%r22, 0x00e8], %f30
	.word 0xfa4dc000  ! 2369: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xb3510000  ! 2370: RDPR_TICK	<illegal instruction>
	.word 0xb8248000  ! 2372: SUB_R	sub 	%r18, %r0, %r28
	.word 0xf25ca093  ! 2373: LDX_I	ldx	[%r18 + 0x0093], %r25
	.word 0xb6352011  ! 2374: SUBC_I	orn 	%r20, 0x0011, %r27
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5da001  ! 2376: LDX_I	ldx	[%r22 + 0x0001], %r30
	.word 0xfc556182  ! 2381: LDSH_I	ldsh	[%r21 + 0x0182], %r30
	setx	0x3010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e000  ! 2388: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xf805200c  ! 2394: LDUW_I	lduw	[%r20 + 0x000c], %r28
	.word 0xf91ca051  ! 2398: LDDF_I	ldd	[%r18, 0x0051], %f28
	.word 0xf20da069  ! 2402: LDUB_I	ldub	[%r22 + 0x0069], %r25
	.word 0xf2450000  ! 2406: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xb89d20da  ! 2409: XORcc_I	xorcc 	%r20, 0x00da, %r28
	.word 0xb80ce062  ! 2411: AND_I	and 	%r19, 0x0062, %r28
	.word 0xf65d8000  ! 2417: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xf41c4000  ! 2418: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xba9de060  ! 2420: XORcc_I	xorcc 	%r23, 0x0060, %r29
	.word 0xf11c0000  ! 2422: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xb2a5c000  ! 2425: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0x8594612d  ! 2426: WRPR_TSTATE_I	wrpr	%r17, 0x012d, %tstate
	.word 0xbb510000  ! 2427: RDPR_TICK	<illegal instruction>
	.word 0xb49c4000  ! 2433: XORcc_R	xorcc 	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b01  ! 2436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b01, %hpstate
	setx	data_start_7, %g1, %r21
	.word 0xf615c000  ! 2441: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf81ce14d  ! 2447: LDD_I	ldd	[%r19 + 0x014d], %r28
	setx	data_start_7, %g1, %r18
	.word 0xf01c2097  ! 2452: LDD_I	ldd	[%r16 + 0x0097], %r24
	.word 0xb6ada0b9  ! 2455: ANDNcc_I	andncc 	%r22, 0x00b9, %r27
	.word 0x9195605b  ! 2456: WRPR_PIL_I	wrpr	%r21, 0x005b, %pil
	.word 0xf44c0000  ! 2459: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xbd480000  ! 2460: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfa4de0ad  ! 2464: LDSB_I	ldsb	[%r23 + 0x00ad], %r29
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0d0000  ! 2466: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xf6548000  ! 2467: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xfc4c4000  ! 2469: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xbec5a119  ! 2476: ADDCcc_I	addccc 	%r22, 0x0119, %r31
	.word 0xf6150000  ! 2477: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xb4b50000  ! 2479: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xf31ce0df  ! 2480: LDDF_I	ldd	[%r19, 0x00df], %f25
	.word 0xf71c0000  ! 2483: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xb1500000  ! 2485: RDPR_TPC	<illegal instruction>
	.word 0x8795e0bf  ! 2487: WRPR_TT_I	wrpr	%r23, 0x00bf, %tt
	.word 0xbd51c000  ! 2488: RDPR_TL	<illegal instruction>
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 2491: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e93  ! 2493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e93, %hpstate
	.word 0xf0156033  ! 2494: LDUH_I	lduh	[%r21 + 0x0033], %r24
	.word 0xf64d0000  ! 2497: LDSB_R	ldsb	[%r20 + %r0], %r27
	mov	2, %r14
	.word 0xa193a000  ! 2499: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982c49  ! 2501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c49, %hpstate
	.word 0xf41420e1  ! 2503: LDUH_I	lduh	[%r16 + 0x00e1], %r26
	.word 0xf91de174  ! 2513: LDDF_I	ldd	[%r23, 0x0174], %f28
	.word 0x87952115  ! 2515: WRPR_TT_I	wrpr	%r20, 0x0115, %tt
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a04b  ! 2519: WRPR_PSTATE_I	wrpr	%r22, 0x004b, %pstate
	.word 0xfa1c8000  ! 2524: LDD_R	ldd	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982913  ! 2525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0913, %hpstate
	.word 0xfa1dc000  ! 2528: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xbaa48000  ! 2530: SUBcc_R	subcc 	%r18, %r0, %r29
	.word 0x87942117  ! 2533: WRPR_TT_I	wrpr	%r16, 0x0117, %tt
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 2536: RDPR_TL	<illegal instruction>
	.word 0xf445a0f9  ! 2537: LDSW_I	ldsw	[%r22 + 0x00f9], %r26
	.word 0x85942102  ! 2538: WRPR_TSTATE_I	wrpr	%r16, 0x0102, %tstate
	.word 0xbb480000  ! 2541: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfa140000  ! 2542: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xf61da1c4  ! 2543: LDD_I	ldd	[%r22 + 0x01c4], %r27
	.word 0x8595a173  ! 2547: WRPR_TSTATE_I	wrpr	%r22, 0x0173, %tstate
	.word 0xf805c000  ! 2554: LDUW_R	lduw	[%r23 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 2567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0x879520c9  ! 2569: WRPR_TT_I	wrpr	%r20, 0x00c9, %tt
	.word 0xf45c60e6  ! 2573: LDX_I	ldx	[%r17 + 0x00e6], %r26
	.word 0xb805c000  ! 2574: ADD_R	add 	%r23, %r0, %r28
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4da152  ! 2579: LDSB_I	ldsb	[%r22 + 0x0152], %r30
	.word 0xf24d4000  ! 2580: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf6044000  ! 2581: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xb3540000  ! 2583: RDPR_GL	<illegal instruction>
	.word 0xb53d1000  ! 2584: SRAX_R	srax	%r20, %r0, %r26
	.word 0xbd520000  ! 2585: RDPR_PIL	<illegal instruction>
	.word 0xbd643801  ! 2588: MOVcc_I	<illegal instruction>
	.word 0xf71ce095  ! 2589: LDDF_I	ldd	[%r19, 0x0095], %f27
	.word 0xf4448000  ! 2590: LDSW_R	ldsw	[%r18 + %r0], %r26
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e1bf  ! 2594: WRPR_PIL_I	wrpr	%r23, 0x01bf, %pil
	.word 0xf04de01a  ! 2595: LDSB_I	ldsb	[%r23 + 0x001a], %r24
	.word 0xb750c000  ! 2596: RDPR_TT	rdpr	%tt, %r27
	mov	2, %r14
	.word 0xa193a000  ! 2600: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa4ce1bb  ! 2602: LDSB_I	ldsb	[%r19 + 0x01bb], %r29
	setx	data_start_4, %g1, %r17
	.word 0xb5504000  ! 2605: RDPR_TNPC	<illegal instruction>
	.word 0xbe342052  ! 2606: SUBC_I	orn 	%r16, 0x0052, %r31
	.word 0xb61520b8  ! 2608: OR_I	or 	%r20, 0x00b8, %r27
	.word 0xf71ca1c9  ! 2609: LDDF_I	ldd	[%r18, 0x01c9], %f27
	.word 0xfe0ca0a9  ! 2611: LDUB_I	ldub	[%r18 + 0x00a9], %r31
	.word 0xb5508000  ! 2613: RDPR_TSTATE	<illegal instruction>
	.word 0xf84da1a1  ! 2616: LDSB_I	ldsb	[%r22 + 0x01a1], %r28
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa044000  ! 2624: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xfe5ce1d0  ! 2625: LDX_I	ldx	[%r19 + 0x01d0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b01  ! 2626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b01, %hpstate
	.word 0xfc54a1c7  ! 2627: LDSH_I	ldsh	[%r18 + 0x01c7], %r30
	.word 0x85942151  ! 2628: WRPR_TSTATE_I	wrpr	%r16, 0x0151, %tstate
	.word 0xbb518000  ! 2630: RDPR_PSTATE	<illegal instruction>
	.word 0xbd540000  ! 2637: RDPR_GL	<illegal instruction>
	.word 0xf4056109  ! 2639: LDUW_I	lduw	[%r21 + 0x0109], %r26
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 2651: RDPR_TT	<illegal instruction>
	.word 0xfa54e0ba  ! 2652: LDSH_I	ldsh	[%r19 + 0x00ba], %r29
	.word 0xf445a09b  ! 2653: LDSW_I	ldsw	[%r22 + 0x009b], %r26
	.word 0xf2440000  ! 2656: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xff1c6108  ! 2657: LDDF_I	ldd	[%r17, 0x0108], %f31
	.word 0xfe0ce0d2  ! 2658: LDUB_I	ldub	[%r19 + 0x00d2], %r31
	.word 0xf4154000  ! 2660: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xfe1dc000  ! 2666: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xf64c20c6  ! 2670: LDSB_I	ldsb	[%r16 + 0x00c6], %r27
	.word 0xf91dc000  ! 2671: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf0548000  ! 2677: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xb9508000  ! 2680: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r19
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf255e063  ! 2688: LDSH_I	ldsh	[%r23 + 0x0063], %r25
	.word 0xf05c6116  ! 2695: LDX_I	ldx	[%r17 + 0x0116], %r24
	.word 0xf00cc000  ! 2696: LDUB_R	ldub	[%r19 + %r0], %r24
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41ce04b  ! 2700: LDD_I	ldd	[%r19 + 0x004b], %r26
	.word 0xba9c0000  ! 2706: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xf00d6011  ! 2709: LDUB_I	ldub	[%r21 + 0x0011], %r24
	.word 0xb950c000  ! 2713: RDPR_TT	<illegal instruction>
	.word 0xf21c212f  ! 2714: LDD_I	ldd	[%r16 + 0x012f], %r25
	mov	1, %r14
	.word 0xa193a000  ! 2716: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8040000  ! 2717: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf6448000  ! 2718: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf605e09d  ! 2719: LDUW_I	lduw	[%r23 + 0x009d], %r27
	.word 0xfe448000  ! 2720: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xfa148000  ! 2723: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xbd540000  ! 2725: RDPR_GL	rdpr	%-, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982811  ! 2726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0811, %hpstate
	setx	0x2021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 2728: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfc54c000  ! 2731: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0x899421df  ! 2732: WRPR_TICK_I	wrpr	%r16, 0x01df, %tick
	.word 0x8595a1f3  ! 2734: WRPR_TSTATE_I	wrpr	%r22, 0x01f3, %tstate
	.word 0xf2448000  ! 2735: LDSW_R	ldsw	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983d0b  ! 2736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	.word 0xf91cc000  ! 2739: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xb0b58000  ! 2742: SUBCcc_R	orncc 	%r22, %r0, %r24
	.word 0xbd508000  ! 2743: RDPR_TSTATE	<illegal instruction>
	.word 0xf4448000  ! 2744: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xba9ca1ba  ! 2745: XORcc_I	xorcc 	%r18, 0x01ba, %r29
	.word 0xb5508000  ! 2751: RDPR_TSTATE	<illegal instruction>
	.word 0xbab5205f  ! 2754: SUBCcc_I	orncc 	%r20, 0x005f, %r29
	.word 0xf014c000  ! 2755: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0x91956147  ! 2756: WRPR_PIL_I	wrpr	%r21, 0x0147, %pil
	.word 0xfe4d0000  ! 2757: LDSB_R	ldsb	[%r20 + %r0], %r31
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c91  ! 2763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c91, %hpstate
	.word 0xf614a0fc  ! 2764: LDUH_I	lduh	[%r18 + 0x00fc], %r27
	.word 0xf45ca144  ! 2766: LDX_I	ldx	[%r18 + 0x0144], %r26
	.word 0x9195a138  ! 2767: WRPR_PIL_I	wrpr	%r22, 0x0138, %pil
	.word 0xf6446002  ! 2769: LDSW_I	ldsw	[%r17 + 0x0002], %r27
	.word 0xf014e04f  ! 2771: LDUH_I	lduh	[%r19 + 0x004f], %r24
	.word 0x85942002  ! 2773: WRPR_TSTATE_I	wrpr	%r16, 0x0002, %tstate
	.word 0xf44c4000  ! 2774: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xbf504000  ! 2776: RDPR_TNPC	<illegal instruction>
	.word 0xf8148000  ! 2781: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf6546059  ! 2784: LDSH_I	ldsh	[%r17 + 0x0059], %r27
	.word 0xf0156012  ! 2786: LDUH_I	lduh	[%r21 + 0x0012], %r24
	mov	1, %r12
	.word 0x8f932000  ! 2789: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf64d20d1  ! 2790: LDSB_I	ldsb	[%r20 + 0x00d1], %r27
	.word 0xb28de144  ! 2794: ANDcc_I	andcc 	%r23, 0x0144, %r25
	.word 0xfc5521f9  ! 2796: LDSH_I	ldsh	[%r20 + 0x01f9], %r30
	setx	data_start_5, %g1, %r17
	.word 0xf65d6011  ! 2800: LDX_I	ldx	[%r21 + 0x0011], %r27
	setx	data_start_6, %g1, %r16
	.word 0xf0458000  ! 2811: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0x8d9521b9  ! 2813: WRPR_PSTATE_I	wrpr	%r20, 0x01b9, %pstate
	.word 0x8194e1b3  ! 2816: WRPR_TPC_I	wrpr	%r19, 0x01b3, %tpc
	.word 0xbac5c000  ! 2818: ADDCcc_R	addccc 	%r23, %r0, %r29
	setx	data_start_1, %g1, %r23
	.word 0xb9510000  ! 2828: RDPR_TICK	<illegal instruction>
	.word 0xb3500000  ! 2829: RDPR_TPC	<illegal instruction>
	.word 0xf414e083  ! 2833: LDUH_I	lduh	[%r19 + 0x0083], %r26
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45c611f  ! 2836: LDX_I	ldx	[%r17 + 0x011f], %r26
	.word 0xfe45c000  ! 2837: LDSW_R	ldsw	[%r23 + %r0], %r31
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20da001  ! 2844: LDUB_I	ldub	[%r22 + 0x0001], %r25
	.word 0xf054e1bd  ! 2849: LDSH_I	ldsh	[%r19 + 0x01bd], %r24
	.word 0xf81c0000  ! 2852: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xf4458000  ! 2854: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xb751c000  ! 2856: RDPR_TL	<illegal instruction>
	.word 0xf81d0000  ! 2857: LDD_R	ldd	[%r20 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb835208c  ! 2865: ORN_I	orn 	%r20, 0x008c, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983f09  ! 2868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f09, %hpstate
	.word 0xf65c60f7  ! 2869: LDX_I	ldx	[%r17 + 0x00f7], %r27
	.word 0xb0bc8000  ! 2872: XNORcc_R	xnorcc 	%r18, %r0, %r24
	.word 0xf60d6032  ! 2874: LDUB_I	ldub	[%r21 + 0x0032], %r27
	.word 0xb7641800  ! 2876: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8594a005  ! 2884: WRPR_TSTATE_I	wrpr	%r18, 0x0005, %tstate
	.word 0xf054209a  ! 2885: LDSH_I	ldsh	[%r16 + 0x009a], %r24
	.word 0xfe4ce0ef  ! 2888: LDSB_I	ldsb	[%r19 + 0x00ef], %r31
	setx	0x30324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc558000  ! 2890: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xbf504000  ! 2895: RDPR_TNPC	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2899: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd518000  ! 2900: RDPR_PSTATE	<illegal instruction>
	.word 0xb7500000  ! 2901: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r22
	.word 0xb9508000  ! 2903: RDPR_TSTATE	<illegal instruction>
	.word 0xfe1c6121  ! 2909: LDD_I	ldd	[%r17 + 0x0121], %r31
	.word 0xf6048000  ! 2911: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb68d8000  ! 2913: ANDcc_R	andcc 	%r22, %r0, %r27
	.word 0xfc0521ac  ! 2914: LDUW_I	lduw	[%r20 + 0x01ac], %r30
	.word 0x8594a06a  ! 2918: WRPR_TSTATE_I	wrpr	%r18, 0x006a, %tstate
	.word 0xbb508000  ! 2919: RDPR_TSTATE	<illegal instruction>
	.word 0xfe5da066  ! 2920: LDX_I	ldx	[%r22 + 0x0066], %r31
	.word 0xfc544000  ! 2921: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xb2c4e15e  ! 2924: ADDCcc_I	addccc 	%r19, 0x015e, %r25
	.word 0xbf520000  ! 2926: RDPR_PIL	<illegal instruction>
	.word 0xbe14e1fc  ! 2932: OR_I	or 	%r19, 0x01fc, %r31
	.word 0x8d942000  ! 2936: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8595a1cf  ! 2937: WRPR_TSTATE_I	wrpr	%r22, 0x01cf, %tstate
	.word 0xb9540000  ! 2940: RDPR_GL	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xb5510000  ! 2946: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2947: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5520000  ! 2948: RDPR_PIL	<illegal instruction>
	.word 0xb294c000  ! 2949: ORcc_R	orcc 	%r19, %r0, %r25
	.word 0xf44d602b  ! 2950: LDSB_I	ldsb	[%r21 + 0x002b], %r26
	.word 0xf0054000  ! 2951: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfc05e0ef  ! 2953: LDUW_I	lduw	[%r23 + 0x00ef], %r30
	.word 0xf01c4000  ! 2954: LDD_R	ldd	[%r17 + %r0], %r24
	setx	0x30022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 2957: RDPR_TL	<illegal instruction>
	.word 0x8594e1c2  ! 2959: WRPR_TSTATE_I	wrpr	%r19, 0x01c2, %tstate
	.word 0xf815c000  ! 2961: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xf0058000  ! 2962: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xf61c0000  ! 2963: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0x8995a0cc  ! 2964: WRPR_TICK_I	wrpr	%r22, 0x00cc, %tick
	.word 0xb7500000  ! 2969: RDPR_TPC	<illegal instruction>
	.word 0xbe8c61ee  ! 2970: ANDcc_I	andcc 	%r17, 0x01ee, %r31
	.word 0xfa548000  ! 2972: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xb8bde1ef  ! 2975: XNORcc_I	xnorcc 	%r23, 0x01ef, %r28
	.word 0x8594a0f7  ! 2977: WRPR_TSTATE_I	wrpr	%r18, 0x00f7, %tstate
	.word 0xfa5421a7  ! 2981: LDSH_I	ldsh	[%r16 + 0x01a7], %r29
	.word 0xfa45c000  ! 2983: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xb7510000  ! 2984: RDPR_TICK	<illegal instruction>
	.word 0xb150c000  ! 2986: RDPR_TT	<illegal instruction>
	.word 0xb53cd000  ! 2992: SRAX_R	srax	%r19, %r0, %r26
	setx	0x3002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 2994: RDPR_PSTATE	<illegal instruction>
	.word 0xfa15a0d3  ! 2996: LDUH_I	lduh	[%r22 + 0x00d3], %r29
	.word 0xbebd8000  ! 2998: XNORcc_R	xnorcc 	%r22, %r0, %r31
	.word 0xf245a147  ! 2999: LDSW_I	ldsw	[%r22 + 0x0147], %r25
	.word 0xf25ce1da  ! 3002: LDX_I	ldx	[%r19 + 0x01da], %r25
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e050  ! 3006: WRPR_TICK_I	wrpr	%r19, 0x0050, %tick
	.word 0xf01da070  ! 3007: LDD_I	ldd	[%r22 + 0x0070], %r24
	.word 0xb1518000  ! 3013: RDPR_PSTATE	<illegal instruction>
	.word 0xf615c000  ! 3014: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xbf2d6001  ! 3016: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xbb50c000  ! 3019: RDPR_TT	<illegal instruction>
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952000  ! 3021: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xf0148000  ! 3022: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xfc5d0000  ! 3023: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xf054a0a5  ! 3026: LDSH_I	ldsh	[%r18 + 0x00a5], %r24
	.word 0xfa44a08e  ! 3027: LDSW_I	ldsw	[%r18 + 0x008e], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4050000  ! 3031: LDUW_R	lduw	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982c59  ! 3032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c59, %hpstate
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb09c0000  ! 3034: XORcc_R	xorcc 	%r16, %r0, %r24
	.word 0xb6c48000  ! 3035: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xf31c2045  ! 3037: LDDF_I	ldd	[%r16, 0x0045], %f25
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf804a0bb  ! 3043: LDUW_I	lduw	[%r18 + 0x00bb], %r28
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 3054: RDPR_PSTATE	<illegal instruction>
	.word 0xfa5da097  ! 3056: LDX_I	ldx	[%r22 + 0x0097], %r29
	.word 0x839520e3  ! 3059: WRPR_TNPC_I	wrpr	%r20, 0x00e3, %tnpc
	.word 0xb751c000  ! 3060: RDPR_TL	<illegal instruction>
	.word 0xfa15e035  ! 3065: LDUH_I	lduh	[%r23 + 0x0035], %r29
	.word 0x8595e0ea  ! 3070: WRPR_TSTATE_I	wrpr	%r23, 0x00ea, %tstate
	.word 0xb7520000  ! 3073: RDPR_PIL	<illegal instruction>
	.word 0xf51d600b  ! 3076: LDDF_I	ldd	[%r21, 0x000b], %f26
	.word 0xbf520000  ! 3077: RDPR_PIL	<illegal instruction>
	.word 0xf85d0000  ! 3079: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xb9520000  ! 3081: RDPR_PIL	<illegal instruction>
	.word 0xf04c61ef  ! 3083: LDSB_I	ldsb	[%r17 + 0x01ef], %r24
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf055a06e  ! 3088: LDSH_I	ldsh	[%r22 + 0x006e], %r24
	.word 0xb7504000  ! 3089: RDPR_TNPC	<illegal instruction>
	.word 0xf805e1fb  ! 3090: LDUW_I	lduw	[%r23 + 0x01fb], %r28
	.word 0xfa158000  ! 3095: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xb895a06e  ! 3096: ORcc_I	orcc 	%r22, 0x006e, %r28
	.word 0x8795a04e  ! 3097: WRPR_TT_I	wrpr	%r22, 0x004e, %tt
	.word 0xfa44603b  ! 3098: LDSW_I	ldsw	[%r17 + 0x003b], %r29
	.word 0xb9520000  ! 3099: RDPR_PIL	<illegal instruction>
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6946042  ! 3103: ORcc_I	orcc 	%r17, 0x0042, %r27
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 3109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb00de159  ! 3113: AND_I	and 	%r23, 0x0159, %r24
	.word 0xbb51c000  ! 3116: RDPR_TL	<illegal instruction>
	.word 0xf005a167  ! 3119: LDUW_I	lduw	[%r22 + 0x0167], %r24
	.word 0xf81c6127  ! 3121: LDD_I	ldd	[%r17 + 0x0127], %r28
	setx	data_start_6, %g1, %r18
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 3126: RDPR_TPC	<illegal instruction>
	.word 0xf21de10a  ! 3127: LDD_I	ldd	[%r23 + 0x010a], %r25
	.word 0xf00d4000  ! 3131: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xf655211e  ! 3133: LDSH_I	ldsh	[%r20 + 0x011e], %r27
	.word 0xfa154000  ! 3135: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xfc5c2110  ! 3136: LDX_I	ldx	[%r16 + 0x0110], %r30
	.word 0x9194a1b4  ! 3139: WRPR_PIL_I	wrpr	%r18, 0x01b4, %pil
	setx	0x10221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c61dc  ! 3144: LDX_I	ldx	[%r17 + 0x01dc], %r30
	.word 0xfa44a18c  ! 3146: LDSW_I	ldsw	[%r18 + 0x018c], %r29
	.word 0xf05c8000  ! 3148: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0x8595600c  ! 3152: WRPR_TSTATE_I	wrpr	%r21, 0x000c, %tstate
	.word 0xfd1cc000  ! 3159: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf25c0000  ! 3160: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf21d61de  ! 3162: LDD_I	ldd	[%r21 + 0x01de], %r25
	.word 0xb9520000  ! 3163: RDPR_PIL	<illegal instruction>
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf245a1ac  ! 3167: LDSW_I	ldsw	[%r22 + 0x01ac], %r25
	.word 0xf0044000  ! 3169: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xf84c8000  ! 3170: LDSB_R	ldsb	[%r18 + %r0], %r28
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 3173: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf81c0000  ! 3177: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xf854c000  ! 3184: LDSH_R	ldsh	[%r19 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983ac3  ! 3185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac3, %hpstate
	.word 0xba8de197  ! 3190: ANDcc_I	andcc 	%r23, 0x0197, %r29
	.word 0xfb1ce16a  ! 3191: LDDF_I	ldd	[%r19, 0x016a], %f29
	setx	0x223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65ca026  ! 3193: LDX_I	ldx	[%r18 + 0x0026], %r27
	.word 0xf245605f  ! 3198: LDSW_I	ldsw	[%r21 + 0x005f], %r25
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819839cb  ! 3202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19cb, %hpstate
	.word 0xf804a09d  ! 3204: LDUW_I	lduw	[%r18 + 0x009d], %r28
	.word 0xf85c8000  ! 3208: LDX_R	ldx	[%r18 + %r0], %r28
	mov	0, %r14
	.word 0xa193a000  ! 3213: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf65dc000  ! 3214: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf80da0e5  ! 3215: LDUB_I	ldub	[%r22 + 0x00e5], %r28
	.word 0xf04d6035  ! 3216: LDSB_I	ldsb	[%r21 + 0x0035], %r24
	.word 0xf21da053  ! 3217: LDD_I	ldd	[%r22 + 0x0053], %r25
	.word 0xb5342001  ! 3218: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x81946071  ! 3219: WRPR_TPC_I	wrpr	%r17, 0x0071, %tpc
	.word 0xf45461e9  ! 3221: LDSH_I	ldsh	[%r17 + 0x01e9], %r26
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839521d3  ! 3226: WRPR_TNPC_I	wrpr	%r20, 0x01d3, %tnpc
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983919  ! 3230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1919, %hpstate
	.word 0xbe0c4000  ! 3234: AND_R	and 	%r17, %r0, %r31
	.word 0xf2544000  ! 3237: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xf80de1cd  ! 3242: LDUB_I	ldub	[%r23 + 0x01cd], %r28
	.word 0x8d95a06c  ! 3245: WRPR_PSTATE_I	wrpr	%r22, 0x006c, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d5b  ! 3246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xf2050000  ! 3247: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xb8844000  ! 3259: ADDcc_R	addcc 	%r17, %r0, %r28
	.word 0xfc0c61e8  ! 3260: LDUB_I	ldub	[%r17 + 0x01e8], %r30
	.word 0xb1540000  ! 3263: RDPR_GL	<illegal instruction>
	.word 0xb37d8400  ! 3268: MOVR_R	movre	%r22, %r0, %r25
	.word 0xfa1c8000  ! 3272: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xbb51c000  ! 3273: RDPR_TL	<illegal instruction>
	.word 0xbd520000  ! 3274: RDPR_PIL	<illegal instruction>
	.word 0xb6350000  ! 3281: ORN_R	orn 	%r20, %r0, %r27
	.word 0xb951c000  ! 3282: RDPR_TL	<illegal instruction>
	.word 0xfe0ca15a  ! 3288: LDUB_I	ldub	[%r18 + 0x015a], %r31
	setx	0x1f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bd6033  ! 3291: XNORcc_I	xnorcc 	%r21, 0x0033, %r28
	.word 0x8594a024  ! 3293: WRPR_TSTATE_I	wrpr	%r18, 0x0024, %tstate
	.word 0xbd35a001  ! 3294: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xbe844000  ! 3295: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xb0b461d2  ! 3300: ORNcc_I	orncc 	%r17, 0x01d2, %r24
	.word 0x879561c7  ! 3302: WRPR_TT_I	wrpr	%r21, 0x01c7, %tt
	.word 0xfc1d61eb  ! 3303: LDD_I	ldd	[%r21 + 0x01eb], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982d0b  ! 3306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0b, %hpstate
	.word 0xf00d604c  ! 3313: LDUB_I	ldub	[%r21 + 0x004c], %r24
	.word 0xb8a5600b  ! 3315: SUBcc_I	subcc 	%r21, 0x000b, %r28
	.word 0xb9643801  ! 3317: MOVcc_I	<illegal instruction>
	.word 0xf05d61d3  ! 3321: LDX_I	ldx	[%r21 + 0x01d3], %r24
	.word 0xb6acc000  ! 3324: ANDNcc_R	andncc 	%r19, %r0, %r27
	.word 0xbeb58000  ! 3326: ORNcc_R	orncc 	%r22, %r0, %r31
	.word 0x8395e149  ! 3327: WRPR_TNPC_I	wrpr	%r23, 0x0149, %tnpc
	.word 0xf45cc000  ! 3328: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf31ce1e0  ! 3329: LDDF_I	ldd	[%r19, 0x01e0], %f25
	.word 0xf60d8000  ! 3333: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xbd504000  ! 3336: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r21
	.word 0xbd504000  ! 3338: RDPR_TNPC	<illegal instruction>
	.word 0x8d946184  ! 3343: WRPR_PSTATE_I	wrpr	%r17, 0x0184, %pstate
	.word 0xb93c7001  ! 3346: SRAX_I	srax	%r17, 0x0001, %r28
	.word 0xb32d4000  ! 3349: SLL_R	sll 	%r21, %r0, %r25
	.word 0xf80dc000  ! 3351: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0x8d94a01f  ! 3353: WRPR_PSTATE_I	wrpr	%r18, 0x001f, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb625c000  ! 3357: SUB_R	sub 	%r23, %r0, %r27
	.word 0xfa0cc000  ! 3358: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xb3510000  ! 3360: RDPR_TICK	<illegal instruction>
	.word 0xfa05219c  ! 3361: LDUW_I	lduw	[%r20 + 0x019c], %r29
	.word 0xf05c4000  ! 3362: LDX_R	ldx	[%r17 + %r0], %r24
	setx	0x32d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 3367: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf25ce1a2  ! 3369: LDX_I	ldx	[%r19 + 0x01a2], %r25
	setx	0x30236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4058000  ! 3375: LDUW_R	lduw	[%r22 + %r0], %r26
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20de160  ! 3382: LDUB_I	ldub	[%r23 + 0x0160], %r25
	setx	0x3000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4c8000  ! 3390: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xf71c6116  ! 3391: LDDF_I	ldd	[%r17, 0x0116], %f27
	.word 0xb0258000  ! 3393: SUB_R	sub 	%r22, %r0, %r24
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc446133  ! 3397: LDSW_I	ldsw	[%r17 + 0x0133], %r30
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0x859460a0  ! 3404: WRPR_TSTATE_I	wrpr	%r17, 0x00a0, %tstate
	.word 0xf255a13e  ! 3412: LDSH_I	ldsh	[%r22 + 0x013e], %r25
	.word 0xfa05e17e  ! 3414: LDUW_I	lduw	[%r23 + 0x017e], %r29
	.word 0xfc058000  ! 3416: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xb63de02c  ! 3418: XNOR_I	xnor 	%r23, 0x002c, %r27
	.word 0xf25cc000  ! 3419: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf45c8000  ! 3420: LDX_R	ldx	[%r18 + %r0], %r26
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 3426: RDPR_TPC	<illegal instruction>
	.word 0x8d9420af  ! 3429: WRPR_PSTATE_I	wrpr	%r16, 0x00af, %pstate
	.word 0xf51de0e0  ! 3430: LDDF_I	ldd	[%r23, 0x00e0], %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 3433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0x8794e158  ! 3435: WRPR_TT_I	wrpr	%r19, 0x0158, %tt
	.word 0xb351c000  ! 3439: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f0b  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	.word 0xfc148000  ! 3444: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xf4048000  ! 3446: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xf6452016  ! 3450: LDSW_I	ldsw	[%r20 + 0x0016], %r27
	.word 0xfc14a1dd  ! 3451: LDUH_I	lduh	[%r18 + 0x01dd], %r30
	.word 0xf804e1a1  ! 3452: LDUW_I	lduw	[%r19 + 0x01a1], %r28
	.word 0xba8ce075  ! 3456: ANDcc_I	andcc 	%r19, 0x0075, %r29
	.word 0xf6558000  ! 3460: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xb2348000  ! 3466: ORN_R	orn 	%r18, %r0, %r25
	.word 0xf11d202c  ! 3468: LDDF_I	ldd	[%r20, 0x002c], %f24
	.word 0xfc0dc000  ! 3470: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0x83946061  ! 3472: WRPR_TNPC_I	wrpr	%r17, 0x0061, %tnpc
	.word 0xfa55a123  ! 3481: LDSH_I	ldsh	[%r22 + 0x0123], %r29
	.word 0xf6550000  ! 3483: LDSH_R	ldsh	[%r20 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983f41  ! 3484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f41, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983ccb  ! 3486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ccb, %hpstate
	.word 0xb6048000  ! 3487: ADD_R	add 	%r18, %r0, %r27
	.word 0x8195e029  ! 3488: WRPR_TPC_I	wrpr	%r23, 0x0029, %tpc
	.word 0xf71da1a7  ! 3489: LDDF_I	ldd	[%r22, 0x01a7], %f27
	.word 0x8594a10e  ! 3490: WRPR_TSTATE_I	wrpr	%r18, 0x010e, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb750c000  ! 3494: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 3496: RDPR_TNPC	<illegal instruction>
	.word 0xfe0c0000  ! 3498: LDUB_R	ldub	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983883  ! 3499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1883, %hpstate
	mov	0, %r14
	.word 0xa193a000  ! 3501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3504000  ! 3504: RDPR_TNPC	<illegal instruction>
	.word 0xb5500000  ! 3506: RDPR_TPC	<illegal instruction>
	.word 0xf71c6135  ! 3513: LDDF_I	ldd	[%r17, 0x0135], %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 3514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0xfe14e07e  ! 3516: LDUH_I	lduh	[%r19 + 0x007e], %r31
	.word 0xf91c4000  ! 3520: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xb72d0000  ! 3521: SLL_R	sll 	%r20, %r0, %r27
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcb4e192  ! 3526: SUBCcc_I	orncc 	%r19, 0x0192, %r30
	mov	0, %r14
	.word 0xa193a000  ! 3528: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf845a18e  ! 3531: LDSW_I	ldsw	[%r22 + 0x018e], %r28
	.word 0xf814a174  ! 3533: LDUH_I	lduh	[%r18 + 0x0174], %r28
	.word 0xbd510000  ! 3534: RDPR_TICK	<illegal instruction>
	.word 0xbc85c000  ! 3535: ADDcc_R	addcc 	%r23, %r0, %r30
	.word 0xf84c205c  ! 3542: LDSB_I	ldsb	[%r16 + 0x005c], %r28
	.word 0x8d95201e  ! 3543: WRPR_PSTATE_I	wrpr	%r20, 0x001e, %pstate
	.word 0xf81dc000  ! 3547: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0x8794a1d6  ! 3548: WRPR_TT_I	wrpr	%r18, 0x01d6, %tt
	.word 0xf8150000  ! 3549: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xfa0c8000  ! 3550: LDUB_R	ldub	[%r18 + %r0], %r29
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85420bb  ! 3561: LDSH_I	ldsh	[%r16 + 0x00bb], %r28
	.word 0xfc45c000  ! 3564: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf00ca0c1  ! 3567: LDUB_I	ldub	[%r18 + 0x00c1], %r24
	mov	0, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf64d8000  ! 3573: LDSB_R	ldsb	[%r22 + %r0], %r27
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65ca052  ! 3577: LDX_I	ldx	[%r18 + 0x0052], %r27
	.word 0xbb500000  ! 3578: RDPR_TPC	<illegal instruction>
	setx	data_start_5, %g1, %r21
	.word 0x8994a125  ! 3581: WRPR_TICK_I	wrpr	%r18, 0x0125, %tick
	.word 0xb49d4000  ! 3582: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xf25c20a4  ! 3584: LDX_I	ldx	[%r16 + 0x00a4], %r25
	.word 0xf81c6141  ! 3585: LDD_I	ldd	[%r17 + 0x0141], %r28
	.word 0xbf34c000  ! 3586: SRL_R	srl 	%r19, %r0, %r31
	setx	data_start_0, %g1, %r23
	.word 0xff1d2084  ! 3592: LDDF_I	ldd	[%r20, 0x0084], %f31
	.word 0xb88c8000  ! 3594: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xbb3d4000  ! 3599: SRA_R	sra 	%r21, %r0, %r29
	.word 0xfa440000  ! 3604: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf91ca094  ! 3605: LDDF_I	ldd	[%r18, 0x0094], %f28
	.word 0xb6b58000  ! 3607: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xf8450000  ! 3608: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xfc15a048  ! 3609: LDUH_I	lduh	[%r22 + 0x0048], %r30
	.word 0xbc3c4000  ! 3611: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xb3520000  ! 3613: RDPR_PIL	<illegal instruction>
	.word 0x8394a0ed  ! 3614: WRPR_TNPC_I	wrpr	%r18, 0x00ed, %tnpc
	.word 0xbf51c000  ! 3615: RDPR_TL	<illegal instruction>
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc8c60e1  ! 3618: ANDcc_I	andcc 	%r17, 0x00e1, %r30
	.word 0xfa15c000  ! 3620: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xf4544000  ! 3621: LDSH_R	ldsh	[%r17 + %r0], %r26
	setx	0x2003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	.word 0xfc5c209c  ! 3625: LDX_I	ldx	[%r16 + 0x009c], %r30
	.word 0xb4444000  ! 3631: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xfe5d60e4  ! 3632: LDX_I	ldx	[%r21 + 0x00e4], %r31
	.word 0xfe1d8000  ! 3634: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xfe1d4000  ! 3638: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xbb50c000  ! 3645: RDPR_TT	<illegal instruction>
	.word 0xb6344000  ! 3648: SUBC_R	orn 	%r17, %r0, %r27
	setx	0x1011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 3653: RDPR_TICK	<illegal instruction>
	.word 0xf655a13e  ! 3654: LDSH_I	ldsh	[%r22 + 0x013e], %r27
	.word 0xfe44c000  ! 3656: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0x8794a096  ! 3657: WRPR_TT_I	wrpr	%r18, 0x0096, %tt
	setx	0x335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa15e0f4  ! 3668: LDUH_I	lduh	[%r23 + 0x00f4], %r29
	.word 0xfc1da015  ! 3669: LDD_I	ldd	[%r22 + 0x0015], %r30
	.word 0xb3480000  ! 3671: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x10209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc444000  ! 3676: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xf8542009  ! 3678: LDSH_I	ldsh	[%r16 + 0x0009], %r28
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983cc3  ! 3681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc3, %hpstate
	.word 0xbeb54000  ! 3683: ORNcc_R	orncc 	%r21, %r0, %r31
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf655e0f4  ! 3688: LDSH_I	ldsh	[%r23 + 0x00f4], %r27
	setx	data_start_3, %g1, %r18
	.word 0xf41c6056  ! 3692: LDD_I	ldd	[%r17 + 0x0056], %r26
	.word 0xb5520000  ! 3693: RDPR_PIL	<illegal instruction>
	.word 0xb5540000  ! 3697: RDPR_GL	<illegal instruction>
	setx	data_start_0, %g1, %r16
	.word 0xb1540000  ! 3701: RDPR_GL	<illegal instruction>
	.word 0xf91c6111  ! 3702: LDDF_I	ldd	[%r17, 0x0111], %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0156195  ! 3708: LDUH_I	lduh	[%r21 + 0x0195], %r24
	setx	0x30102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c21c6  ! 3713: LDSB_I	ldsb	[%r16 + 0x01c6], %r29
	.word 0xf6442046  ! 3715: LDSW_I	ldsw	[%r16 + 0x0046], %r27
	.word 0xfa44e14f  ! 3718: LDSW_I	ldsw	[%r19 + 0x014f], %r29
	.word 0xfe4da17b  ! 3725: LDSB_I	ldsb	[%r22 + 0x017b], %r31
	.word 0xbf2ca001  ! 3726: SLL_I	sll 	%r18, 0x0001, %r31
	.word 0xbab44000  ! 3728: SUBCcc_R	orncc 	%r17, %r0, %r29
	.word 0xf65d8000  ! 3729: LDX_R	ldx	[%r22 + %r0], %r27
	mov	1, %r14
	.word 0xa193a000  ! 3730: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x3022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 3740: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfe454000  ! 3741: LDSW_R	ldsw	[%r21 + %r0], %r31
	setx	0x2032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa14a1fe  ! 3744: LDUH_I	lduh	[%r18 + 0x01fe], %r29
	.word 0xb62d20fa  ! 3747: ANDN_I	andn 	%r20, 0x00fa, %r27
	.word 0xf20ce1f3  ! 3750: LDUB_I	ldub	[%r19 + 0x01f3], %r25
	.word 0xfc042175  ! 3753: LDUW_I	lduw	[%r16 + 0x0175], %r30
	.word 0xb5540000  ! 3757: RDPR_GL	<illegal instruction>
	.word 0xf84d0000  ! 3761: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xf84cc000  ! 3765: LDSB_R	ldsb	[%r19 + %r0], %r28
	mov	1, %r14
	.word 0xa193a000  ! 3768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4d21e3  ! 3770: LDSB_I	ldsb	[%r20 + 0x01e3], %r30
	.word 0xba0c0000  ! 3771: AND_R	and 	%r16, %r0, %r29
	.word 0xf01da12c  ! 3772: LDD_I	ldd	[%r22 + 0x012c], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0540000  ! 3780: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xb73d0000  ! 3781: SRA_R	sra 	%r20, %r0, %r27
	.word 0xf84c21f4  ! 3788: LDSB_I	ldsb	[%r16 + 0x01f4], %r28
	.word 0xbd508000  ! 3789: RDPR_TSTATE	<illegal instruction>
	.word 0xf80ce09c  ! 3790: LDUB_I	ldub	[%r19 + 0x009c], %r28
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe45611a  ! 3798: LDSW_I	ldsw	[%r21 + 0x011a], %r31
	.word 0xbc05608c  ! 3799: ADD_I	add 	%r21, 0x008c, %r30
	.word 0xf51c8000  ! 3800: LDDF_R	ldd	[%r18, %r0], %f26
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4142142  ! 3805: LDUH_I	lduh	[%r16 + 0x0142], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983a89  ! 3807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a89, %hpstate
	.word 0xf65d2185  ! 3808: LDX_I	ldx	[%r20 + 0x0185], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983b8b  ! 3814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8b, %hpstate
	.word 0xf24ce00a  ! 3816: LDSB_I	ldsb	[%r19 + 0x000a], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982d03  ! 3821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d03, %hpstate
	.word 0xfc1d8000  ! 3822: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xf21ce0fd  ! 3823: LDD_I	ldd	[%r19 + 0x00fd], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe04616c  ! 3835: LDUW_I	lduw	[%r17 + 0x016c], %r31
	.word 0xf215e1fd  ! 3837: LDUH_I	lduh	[%r23 + 0x01fd], %r25
	.word 0x8994e057  ! 3841: WRPR_TICK_I	wrpr	%r19, 0x0057, %tick
	.word 0x8394218a  ! 3843: WRPR_TNPC_I	wrpr	%r16, 0x018a, %tnpc
	.word 0xfe1c0000  ! 3844: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xf01d8000  ! 3846: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf20da13d  ! 3848: LDUB_I	ldub	[%r22 + 0x013d], %r25
	setx	data_start_0, %g1, %r19
	.word 0xf51c208d  ! 3856: LDDF_I	ldd	[%r16, 0x008d], %f26
	.word 0xb3508000  ! 3858: RDPR_TSTATE	<illegal instruction>
	.word 0xf2440000  ! 3861: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf21ce1f0  ! 3863: LDD_I	ldd	[%r19 + 0x01f0], %r25
	.word 0xf31dc000  ! 3867: LDDF_R	ldd	[%r23, %r0], %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983bc1  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc1, %hpstate
	.word 0xf00d61d4  ! 3869: LDUB_I	ldub	[%r21 + 0x01d4], %r24
	.word 0xfc054000  ! 3871: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xfe5d0000  ! 3874: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xf0054000  ! 3883: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfc1c0000  ! 3884: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf11c20ce  ! 3885: LDDF_I	ldd	[%r16, 0x00ce], %f24
	.word 0xf8548000  ! 3886: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf71c4000  ! 3888: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xf80cc000  ! 3889: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xf41ca079  ! 3892: LDD_I	ldd	[%r18 + 0x0079], %r26
	.word 0xfa0da082  ! 3894: LDUB_I	ldub	[%r22 + 0x0082], %r29
	mov	0, %r12
	.word 0x8f932000  ! 3897: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa45c000  ! 3910: LDSW_R	ldsw	[%r23 + %r0], %r29
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25c0000  ! 3915: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xb7508000  ! 3924: RDPR_TSTATE	rdpr	%tstate, %r27
	mov	2, %r12
	.word 0x8f932000  ! 3926: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2ade1b8  ! 3928: ANDNcc_I	andncc 	%r23, 0x01b8, %r25
	.word 0xf41c6123  ! 3930: LDD_I	ldd	[%r17 + 0x0123], %r26
	setx	0x3032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60d4000  ! 3932: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf40d60ba  ! 3934: LDUB_I	ldub	[%r21 + 0x00ba], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982d59  ! 3936: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 3941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3508000  ! 3942: RDPR_TSTATE	<illegal instruction>
	.word 0xf11c4000  ! 3943: LDDF_R	ldd	[%r17, %r0], %f24
	setx	0x30202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 3951: RDPR_PIL	<illegal instruction>
	.word 0xf8150000  ! 3954: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xf51c0000  ! 3957: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf045218c  ! 3958: LDSW_I	ldsw	[%r20 + 0x018c], %r24
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 3964: RDPR_TT	<illegal instruction>
	.word 0xfa1c2035  ! 3966: LDD_I	ldd	[%r16 + 0x0035], %r29
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1d8000  ! 3971: LDDF_R	ldd	[%r22, %r0], %f30
	mov	0, %r14
	.word 0xa193a000  ! 3972: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb0b4a170  ! 3973: SUBCcc_I	orncc 	%r18, 0x0170, %r24
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf004c000  ! 3977: LDUW_R	lduw	[%r19 + %r0], %r24
	setx	0x10102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205a0c4  ! 3980: LDUW_I	lduw	[%r22 + 0x00c4], %r25
	setx	data_start_2, %g1, %r22
	mov	0, %r14
	.word 0xa193a000  ! 3983: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_6, %g1, %r20
	setx	0x30205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf055a1ce  ! 3989: LDSH_I	ldsh	[%r22 + 0x01ce], %r24
	.word 0xf8548000  ! 3990: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xfe1520db  ! 3991: LDUH_I	lduh	[%r20 + 0x00db], %r31
	.word 0xf64ce196  ! 3992: LDSB_I	ldsb	[%r19 + 0x0196], %r27
	.word 0xf41c8000  ! 3993: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0x899460f8  ! 3999: WRPR_TICK_I	wrpr	%r17, 0x00f8, %tick
	.word 0xf41da177  ! 4000: LDD_I	ldd	[%r22 + 0x0177], %r26
	.word 0xbf35e001  ! 4002: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xf21ca1a2  ! 4005: LDD_I	ldd	[%r18 + 0x01a2], %r25
	.word 0xff1d20b4  ! 4006: LDDF_I	ldd	[%r20, 0x00b4], %f31
	.word 0xf64d209f  ! 4007: LDSB_I	ldsb	[%r20 + 0x009f], %r27
	mov	1, %r14
	.word 0xa193a000  ! 4010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r12
	.word 0x8f932000  ! 4011: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x87952104  ! 4017: WRPR_TT_I	wrpr	%r20, 0x0104, %tt
	.word 0xfe55201c  ! 4018: LDSH_I	ldsh	[%r20 + 0x001c], %r31
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01de166  ! 4032: LDD_I	ldd	[%r23 + 0x0166], %r24
	.word 0xbf50c000  ! 4033: RDPR_TT	<illegal instruction>
	.word 0xb12c1000  ! 4038: SLLX_R	sllx	%r16, %r0, %r24
	.word 0xfe0ca0da  ! 4040: LDUB_I	ldub	[%r18 + 0x00da], %r31
	.word 0x8994a0d2  ! 4041: WRPR_TICK_I	wrpr	%r18, 0x00d2, %tick
	.word 0xfe15a035  ! 4044: LDUH_I	lduh	[%r22 + 0x0035], %r31
	.word 0xf4458000  ! 4046: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xfd1d60a4  ! 4047: LDDF_I	ldd	[%r21, 0x00a4], %f30
	.word 0xb551c000  ! 4050: RDPR_TL	<illegal instruction>
	setx	0x2031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe0c200f  ! 4053: AND_I	and 	%r16, 0x000f, %r31
	.word 0xf91cc000  ! 4056: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xfc050000  ! 4057: LDUW_R	lduw	[%r20 + %r0], %r30
	setx	0x3001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5421b2  ! 4064: LDSH_I	ldsh	[%r16 + 0x01b2], %r31
	.word 0xb6a5c000  ! 4074: SUBcc_R	subcc 	%r23, %r0, %r27
	.word 0xbf518000  ! 4078: RDPR_PSTATE	<illegal instruction>
	.word 0xb02d21f6  ! 4079: ANDN_I	andn 	%r20, 0x01f6, %r24
	.word 0xf91d0000  ! 4085: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf6040000  ! 4086: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf65ca17b  ! 4092: LDX_I	ldx	[%r18 + 0x017b], %r27
	.word 0xb92c3001  ! 4099: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xfe150000  ! 4100: LDUH_R	lduh	[%r20 + %r0], %r31
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6152045  ! 4102: LDUH_I	lduh	[%r20 + 0x0045], %r27
	.word 0xb9508000  ! 4111: RDPR_TSTATE	<illegal instruction>
	.word 0xbaa4e136  ! 4112: SUBcc_I	subcc 	%r19, 0x0136, %r29
	.word 0xf44421f6  ! 4114: LDSW_I	ldsw	[%r16 + 0x01f6], %r26
	.word 0xfd1d6063  ! 4116: LDDF_I	ldd	[%r21, 0x0063], %f30
	.word 0xf40ca01a  ! 4117: LDUB_I	ldub	[%r18 + 0x001a], %r26
	.word 0xf44d20c1  ! 4118: LDSB_I	ldsb	[%r20 + 0x00c1], %r26
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe95e1de  ! 4125: ORcc_I	orcc 	%r23, 0x01de, %r31
	.word 0xf85c2155  ! 4126: LDX_I	ldx	[%r16 + 0x0155], %r28
	setx	data_start_1, %g1, %r16
	.word 0xf11da031  ! 4134: LDDF_I	ldd	[%r22, 0x0031], %f24
	.word 0xb1520000  ! 4135: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf05da1b4  ! 4136: LDX_I	ldx	[%r22 + 0x01b4], %r24
	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e03b  ! 4141: WRPR_PIL_I	wrpr	%r19, 0x003b, %pil
	mov	0, %r12
	.word 0x8f932000  ! 4143: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbebdc000  ! 4146: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xff1c61e0  ! 4148: LDDF_I	ldd	[%r17, 0x01e0], %f31
	.word 0xf85d617e  ! 4150: LDX_I	ldx	[%r21 + 0x017e], %r28
	.word 0xb1500000  ! 4163: RDPR_TPC	rdpr	%tpc, %r24
	setx	data_start_2, %g1, %r17
	.word 0xbb480000  ! 4167: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf65d4000  ! 4168: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0x8395603f  ! 4169: WRPR_TNPC_I	wrpr	%r21, 0x003f, %tnpc
	.word 0xb3353001  ! 4174: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xf04da045  ! 4175: LDSB_I	ldsb	[%r22 + 0x0045], %r24
	.word 0xbd510000  ! 4176: RDPR_TICK	<illegal instruction>
	.word 0xfc150000  ! 4177: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xfc4c21bf  ! 4179: LDSB_I	ldsb	[%r16 + 0x01bf], %r30
	.word 0xb77d6401  ! 4181: MOVR_I	movre	%r21, 0x1, %r27
	.word 0x8194a0b6  ! 4183: WRPR_TPC_I	wrpr	%r18, 0x00b6, %tpc
	.word 0xbf3dc000  ! 4186: SRA_R	sra 	%r23, %r0, %r31
	.word 0x89946082  ! 4188: WRPR_TICK_I	wrpr	%r17, 0x0082, %tick
	setx	data_start_4, %g1, %r23
	.word 0xb80dc000  ! 4193: AND_R	and 	%r23, %r0, %r28
	.word 0xf85ca1b3  ! 4194: LDX_I	ldx	[%r18 + 0x01b3], %r28
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1da10b  ! 4198: LDD_I	ldd	[%r22 + 0x010b], %r29
	.word 0xf91ca019  ! 4200: LDDF_I	ldd	[%r18, 0x0019], %f28
	.word 0xf0054000  ! 4205: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfc544000  ! 4206: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf84c0000  ! 4208: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xf614e1b5  ! 4213: LDUH_I	lduh	[%r19 + 0x01b5], %r27
	.word 0xfc5d4000  ! 4216: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xff1c6080  ! 4218: LDDF_I	ldd	[%r17, 0x0080], %f31
	.word 0x859421bd  ! 4220: WRPR_TSTATE_I	wrpr	%r16, 0x01bd, %tstate
	.word 0xbe8460bb  ! 4222: ADDcc_I	addcc 	%r17, 0x00bb, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983c59  ! 4223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c59, %hpstate
	.word 0x8194e16e  ! 4227: WRPR_TPC_I	wrpr	%r19, 0x016e, %tpc
	.word 0xff1c0000  ! 4229: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf84de1d2  ! 4231: LDSB_I	ldsb	[%r23 + 0x01d2], %r28
	.word 0xf80c0000  ! 4232: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xb81d4000  ! 4233: XOR_R	xor 	%r21, %r0, %r28
	.word 0xbc8d6188  ! 4235: ANDcc_I	andcc 	%r21, 0x0188, %r30
	.word 0xfa544000  ! 4236: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xbf500000  ! 4237: RDPR_TPC	<illegal instruction>
	.word 0x83942150  ! 4238: WRPR_TNPC_I	wrpr	%r16, 0x0150, %tnpc
	.word 0xbb50c000  ! 4239: RDPR_TT	rdpr	%tt, %r29
	.word 0xfc5c0000  ! 4240: LDX_R	ldx	[%r16 + %r0], %r30
	mov	0, %r12
	.word 0x8f932000  ! 4243: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc044000  ! 4246: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xf61d616f  ! 4247: LDD_I	ldd	[%r21 + 0x016f], %r27
	.word 0xbcbc2186  ! 4250: XNORcc_I	xnorcc 	%r16, 0x0186, %r30
	.word 0xfc1d8000  ! 4251: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xf21d8000  ! 4253: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xb234a176  ! 4257: SUBC_I	orn 	%r18, 0x0176, %r25
	.word 0x91946010  ! 4259: WRPR_PIL_I	wrpr	%r17, 0x0010, %pil
	.word 0xfe1de0c0  ! 4262: LDD_I	ldd	[%r23 + 0x00c0], %r31
	.word 0xb02521ed  ! 4263: SUB_I	sub 	%r20, 0x01ed, %r24
	.word 0xb6850000  ! 4267: ADDcc_R	addcc 	%r20, %r0, %r27
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbaac8000  ! 4270: ANDNcc_R	andncc 	%r18, %r0, %r29
	.word 0xf6450000  ! 4271: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0x8595a18a  ! 4272: WRPR_TSTATE_I	wrpr	%r22, 0x018a, %tstate
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe548000  ! 4275: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0x8795e0be  ! 4279: WRPR_TT_I	wrpr	%r23, 0x00be, %tt
	.word 0x85956198  ! 4281: WRPR_TSTATE_I	wrpr	%r21, 0x0198, %tstate
	.word 0xf644205d  ! 4282: LDSW_I	ldsw	[%r16 + 0x005d], %r27
	.word 0xf51c2050  ! 4283: LDDF_I	ldd	[%r16, 0x0050], %f26
	.word 0xf615e1ca  ! 4286: LDUH_I	lduh	[%r23 + 0x01ca], %r27
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	.word 0xf8146026  ! 4295: LDUH_I	lduh	[%r17 + 0x0026], %r28
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0d60c3  ! 4301: LDUB_I	ldub	[%r21 + 0x00c3], %r31
	mov	2, %r14
	.word 0xa193a000  ! 4304: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf245c000  ! 4308: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0x8795616b  ! 4317: WRPR_TT_I	wrpr	%r21, 0x016b, %tt
	.word 0xf0148000  ! 4319: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xfc054000  ! 4320: LDUW_R	lduw	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c41  ! 4327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c41, %hpstate
	.word 0xb950c000  ! 4329: RDPR_TT	<illegal instruction>
	.word 0xf244c000  ! 4332: LDSW_R	ldsw	[%r19 + %r0], %r25
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05c217a  ! 4338: LDX_I	ldx	[%r16 + 0x017a], %r24
	.word 0xf0454000  ! 4339: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xf40c6069  ! 4341: LDUB_I	ldub	[%r17 + 0x0069], %r26
	.word 0x8d95a092  ! 4342: WRPR_PSTATE_I	wrpr	%r22, 0x0092, %pstate
	.word 0xf45de0d3  ! 4346: LDX_I	ldx	[%r23 + 0x00d3], %r26
	.word 0xf31d4000  ! 4347: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf81d4000  ! 4348: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xb1480000  ! 4351: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84520c6  ! 4354: LDSW_I	ldsw	[%r20 + 0x00c6], %r28
	.word 0xf25520e3  ! 4355: LDSH_I	ldsh	[%r20 + 0x00e3], %r25
	setx	0x20305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6440000  ! 4360: LDSW_R	ldsw	[%r16 + %r0], %r27
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91942119  ! 4363: WRPR_PIL_I	wrpr	%r16, 0x0119, %pil
	.word 0xf04ca19f  ! 4365: LDSB_I	ldsb	[%r18 + 0x019f], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 4369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	.word 0x83956004  ! 4371: WRPR_TNPC_I	wrpr	%r21, 0x0004, %tnpc
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a1e1  ! 4378: WRPR_PIL_I	wrpr	%r22, 0x01e1, %pil
	.word 0xf80d2049  ! 4380: LDUB_I	ldub	[%r20 + 0x0049], %r28
	.word 0xbf480000  ! 4381: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbd50c000  ! 4382: RDPR_TT	<illegal instruction>
	.word 0xf84c8000  ! 4385: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xbf504000  ! 4386: RDPR_TNPC	<illegal instruction>
	.word 0xfa04e1a6  ! 4390: LDUW_I	lduw	[%r19 + 0x01a6], %r29
	.word 0xfe1d4000  ! 4392: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xf4140000  ! 4396: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xb751c000  ! 4398: RDPR_TL	<illegal instruction>
	.word 0xfa44a083  ! 4405: LDSW_I	ldsw	[%r18 + 0x0083], %r29
	.word 0xf214c000  ! 4406: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xbb504000  ! 4408: RDPR_TNPC	<illegal instruction>
	.word 0xfa54e12a  ! 4413: LDSH_I	ldsh	[%r19 + 0x012a], %r29
	.word 0xf00c61c2  ! 4414: LDUB_I	ldub	[%r17 + 0x01c2], %r24
	.word 0xbc9c0000  ! 4416: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xbb51c000  ! 4423: RDPR_TL	<illegal instruction>
	setx	data_start_4, %g1, %r22
	.word 0xf65420ec  ! 4429: LDSH_I	ldsh	[%r16 + 0x00ec], %r27
	.word 0xf214c000  ! 4431: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf91ca016  ! 4433: LDDF_I	ldd	[%r18, 0x0016], %f28
	.word 0xf80da0bb  ! 4435: LDUB_I	ldub	[%r22 + 0x00bb], %r28
	.word 0xb5510000  ! 4440: RDPR_TICK	<illegal instruction>
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf045a1e1  ! 4446: LDSW_I	ldsw	[%r22 + 0x01e1], %r24
	.word 0xbd540000  ! 4447: RDPR_GL	<illegal instruction>
	.word 0xbc04a088  ! 4448: ADD_I	add 	%r18, 0x0088, %r30
	.word 0x8995a123  ! 4450: WRPR_TICK_I	wrpr	%r22, 0x0123, %tick
	.word 0xb8b50000  ! 4455: SUBCcc_R	orncc 	%r20, %r0, %r28
	.word 0xb1520000  ! 4456: RDPR_PIL	<illegal instruction>
	.word 0xf00ca0c0  ! 4457: LDUB_I	ldub	[%r18 + 0x00c0], %r24
	.word 0xfa0ca080  ! 4463: LDUB_I	ldub	[%r18 + 0x0080], %r29
	.word 0x8994e13d  ! 4466: WRPR_TICK_I	wrpr	%r19, 0x013d, %tick
	.word 0xba058000  ! 4470: ADD_R	add 	%r22, %r0, %r29
	.word 0xf60461fe  ! 4471: LDUW_I	lduw	[%r17 + 0x01fe], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 4472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0xf11ce1ed  ! 4474: LDDF_I	ldd	[%r19, 0x01ed], %f24
	.word 0xf2140000  ! 4477: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xbb2dc000  ! 4479: SLL_R	sll 	%r23, %r0, %r29
	.word 0xf61dc000  ! 4481: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xf2558000  ! 4482: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf85420c2  ! 4488: LDSH_I	ldsh	[%r16 + 0x00c2], %r28
	.word 0x8d94a142  ! 4491: WRPR_PSTATE_I	wrpr	%r18, 0x0142, %pstate
	.word 0xb0c5603d  ! 4492: ADDCcc_I	addccc 	%r21, 0x003d, %r24
	.word 0xf8142022  ! 4494: LDUH_I	lduh	[%r16 + 0x0022], %r28
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bdc000  ! 4500: XNORcc_R	xnorcc 	%r23, %r0, %r28
	setx	data_start_3, %g1, %r23
	.word 0xfe1c0000  ! 4503: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xfd1de1c2  ! 4504: LDDF_I	ldd	[%r23, 0x01c2], %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983d03  ! 4505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d03, %hpstate
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a99  ! 4511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a99, %hpstate
	.word 0xfa5c8000  ! 4514: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfc042029  ! 4515: LDUW_I	lduw	[%r16 + 0x0029], %r30
	.word 0xf60d0000  ! 4519: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xf00c4000  ! 4523: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xbab4a175  ! 4526: ORNcc_I	orncc 	%r18, 0x0175, %r29
	.word 0xfc15e15d  ! 4529: LDUH_I	lduh	[%r23 + 0x015d], %r30
	.word 0xb414a1a2  ! 4530: OR_I	or 	%r18, 0x01a2, %r26
	.word 0xb82c8000  ! 4534: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xfc04c000  ! 4537: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xbb520000  ! 4540: RDPR_PIL	<illegal instruction>
	setx	data_start_0, %g1, %r23
	.word 0xfd1c602d  ! 4544: LDDF_I	ldd	[%r17, 0x002d], %f30
	.word 0xf25c0000  ! 4545: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0x8394a10a  ! 4546: WRPR_TNPC_I	wrpr	%r18, 0x010a, %tnpc
	.word 0xbeacc000  ! 4549: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0xb5500000  ! 4550: RDPR_TPC	<illegal instruction>
	.word 0xf814e0c8  ! 4555: LDUH_I	lduh	[%r19 + 0x00c8], %r28
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	.word 0x91946034  ! 4559: WRPR_PIL_I	wrpr	%r17, 0x0034, %pil
	.word 0xfa142179  ! 4568: LDUH_I	lduh	[%r16 + 0x0179], %r29
	.word 0xfc0461b3  ! 4569: LDUW_I	lduw	[%r17 + 0x01b3], %r30
	.word 0xbd520000  ! 4572: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf80d618e  ! 4573: LDUB_I	ldub	[%r21 + 0x018e], %r28
	.word 0xb4b44000  ! 4575: SUBCcc_R	orncc 	%r17, %r0, %r26
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92c7001  ! 4582: SLLX_I	sllx	%r17, 0x0001, %r28
	.word 0xf91d0000  ! 4584: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xbb500000  ! 4589: RDPR_TPC	<illegal instruction>
	.word 0xb3510000  ! 4600: RDPR_TICK	<illegal instruction>
	.word 0xf11c6158  ! 4602: LDDF_I	ldd	[%r17, 0x0158], %f24
	.word 0xbd480000  ! 4606: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf455a1f5  ! 4611: LDSH_I	ldsh	[%r22 + 0x01f5], %r26
	.word 0xb37cc400  ! 4613: MOVR_R	movre	%r19, %r0, %r25
	.word 0x83952199  ! 4618: WRPR_TNPC_I	wrpr	%r20, 0x0199, %tnpc
	.word 0xfb1d2002  ! 4619: LDDF_I	ldd	[%r20, 0x0002], %f29
	.word 0xb751c000  ! 4620: RDPR_TL	rdpr	%tl, %r27
	.word 0xfa1da01e  ! 4621: LDD_I	ldd	[%r22 + 0x001e], %r29
	.word 0x919521e3  ! 4623: WRPR_PIL_I	wrpr	%r20, 0x01e3, %pil
	.word 0xf41c2000  ! 4624: LDD_I	ldd	[%r16 + 0x0000], %r26
	.word 0xbc3421d2  ! 4625: ORN_I	orn 	%r16, 0x01d2, %r30
	.word 0xf4550000  ! 4626: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xb5540000  ! 4628: RDPR_GL	<illegal instruction>
	.word 0xbf2c0000  ! 4631: SLL_R	sll 	%r16, %r0, %r31
	.word 0xfe15207b  ! 4635: LDUH_I	lduh	[%r20 + 0x007b], %r31
	.word 0xfe444000  ! 4636: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xbb352001  ! 4638: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xf615e076  ! 4639: LDUH_I	lduh	[%r23 + 0x0076], %r27
	.word 0xf25ca095  ! 4640: LDX_I	ldx	[%r18 + 0x0095], %r25
	.word 0xf11c21e0  ! 4641: LDDF_I	ldd	[%r16, 0x01e0], %f24
	.word 0xfa1c0000  ! 4646: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xbb504000  ! 4650: RDPR_TNPC	<illegal instruction>
	setx	0x20335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64da031  ! 4656: LDSB_I	ldsb	[%r22 + 0x0031], %r27
	.word 0xb3643801  ! 4657: MOVcc_I	<illegal instruction>
	setx	data_start_2, %g1, %r16
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4665: RDPR_TT	<illegal instruction>
	setx	data_start_0, %g1, %r20
	mov	0, %r12
	.word 0x8f932000  ! 4674: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcace0a4  ! 4675: ANDNcc_I	andncc 	%r19, 0x00a4, %r30
	.word 0xf25460a5  ! 4683: LDSH_I	ldsh	[%r17 + 0x00a5], %r25
	.word 0xbe2c8000  ! 4685: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xf40de040  ! 4690: LDUB_I	ldub	[%r23 + 0x0040], %r26
	.word 0xbe94e1d5  ! 4691: ORcc_I	orcc 	%r19, 0x01d5, %r31
	setx	0x20311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb750c000  ! 4697: RDPR_TT	<illegal instruction>
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2c0000  ! 4707: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xf04d0000  ! 4708: LDSB_R	ldsb	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983901  ! 4713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1901, %hpstate
	.word 0xf604e0a3  ! 4723: LDUW_I	lduw	[%r19 + 0x00a3], %r27
	.word 0x8194202b  ! 4726: WRPR_TPC_I	wrpr	%r16, 0x002b, %tpc
	.word 0xfe540000  ! 4729: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf214218d  ! 4738: LDUH_I	lduh	[%r16 + 0x018d], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983b19  ! 4740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b19, %hpstate
	.word 0xbc25a0fe  ! 4747: SUB_I	sub 	%r22, 0x00fe, %r30
	.word 0xfc04a13d  ! 4751: LDUW_I	lduw	[%r18 + 0x013d], %r30
	.word 0xf014e151  ! 4757: LDUH_I	lduh	[%r19 + 0x0151], %r24
	mov	0, %r12
	.word 0x8f932000  ! 4758: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 4765: RDPR_TICK	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 4769: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7508000  ! 4772: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf215a131  ! 4774: LDUH_I	lduh	[%r22 + 0x0131], %r25
	.word 0x8395a03e  ! 4777: WRPR_TNPC_I	wrpr	%r22, 0x003e, %tnpc
	setx	0x124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf414a04b  ! 4783: LDUH_I	lduh	[%r18 + 0x004b], %r26
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45de032  ! 4788: LDX_I	ldx	[%r23 + 0x0032], %r26
	setx	0x3021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4154000  ! 4792: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xfd1d8000  ! 4793: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xfa5d60e9  ! 4794: LDX_I	ldx	[%r21 + 0x00e9], %r29
	.word 0xfb1da0a6  ! 4797: LDDF_I	ldd	[%r22, 0x00a6], %f29
	.word 0xfa0c615c  ! 4805: LDUB_I	ldub	[%r17 + 0x015c], %r29
	.word 0xfc0de0fe  ! 4808: LDUB_I	ldub	[%r23 + 0x00fe], %r30
	.word 0x85946127  ! 4809: WRPR_TSTATE_I	wrpr	%r17, 0x0127, %tstate
	.word 0xfa1d219f  ! 4810: LDD_I	ldd	[%r20 + 0x019f], %r29
	.word 0xfc5c61c5  ! 4812: LDX_I	ldx	[%r17 + 0x01c5], %r30
	.word 0xf65ce02b  ! 4814: LDX_I	ldx	[%r19 + 0x002b], %r27
	.word 0x859560e7  ! 4815: WRPR_TSTATE_I	wrpr	%r21, 0x00e7, %tstate
	.word 0xf65d6098  ! 4819: LDX_I	ldx	[%r21 + 0x0098], %r27
	.word 0xb0b44000  ! 4820: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xfe04e027  ! 4825: LDUW_I	lduw	[%r19 + 0x0027], %r31
	.word 0xb8adc000  ! 4827: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0x8595602b  ! 4829: WRPR_TSTATE_I	wrpr	%r21, 0x002b, %tstate
	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf005215f  ! 4832: LDUW_I	lduw	[%r20 + 0x015f], %r24
	.word 0xfa054000  ! 4838: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xbf643801  ! 4839: MOVcc_I	<illegal instruction>
	setx	0x2030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d20af  ! 4850: LDD_I	ldd	[%r20 + 0x00af], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa45e17e  ! 4853: LDSW_I	ldsw	[%r23 + 0x017e], %r29
	.word 0xf21420ce  ! 4855: LDUH_I	lduh	[%r16 + 0x00ce], %r25
	.word 0xf6548000  ! 4856: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xf60de1e3  ! 4857: LDUB_I	ldub	[%r23 + 0x01e3], %r27
	.word 0xf4044000  ! 4862: LDUW_R	lduw	[%r17 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983ac1  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac1, %hpstate
	.word 0xb4348000  ! 4866: ORN_R	orn 	%r18, %r0, %r26
	.word 0xb73c9000  ! 4867: SRAX_R	srax	%r18, %r0, %r27
	.word 0xbd508000  ! 4868: RDPR_TSTATE	<illegal instruction>
	.word 0x8994a075  ! 4871: WRPR_TICK_I	wrpr	%r18, 0x0075, %tick
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf215c000  ! 4880: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xbd34d000  ! 4883: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xbf508000  ! 4890: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e176  ! 4893: WRPR_TSTATE_I	wrpr	%r19, 0x0176, %tstate
	.word 0xbd51c000  ! 4898: RDPR_TL	<illegal instruction>
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4902: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982803  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919460f3  ! 4922: WRPR_PIL_I	wrpr	%r17, 0x00f3, %pil
	setx	data_start_1, %g1, %r23
	.word 0xf054c000  ! 4934: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0x9195e14e  ! 4938: WRPR_PIL_I	wrpr	%r23, 0x014e, %pil
	.word 0xf40c0000  ! 4942: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xb8b5c000  ! 4945: SUBCcc_R	orncc 	%r23, %r0, %r28
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839520ff  ! 4948: WRPR_TNPC_I	wrpr	%r20, 0x00ff, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61da1c5  ! 4951: LDD_I	ldd	[%r22 + 0x01c5], %r27
	mov	0, %r14
	.word 0xa193a000  ! 4952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d9560b3  ! 4954: WRPR_PSTATE_I	wrpr	%r21, 0x00b3, %pstate
	.word 0xbf510000  ! 4955: RDPR_TICK	<illegal instruction>
	.word 0xf11c8000  ! 4956: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0x839561d6  ! 4963: WRPR_TNPC_I	wrpr	%r21, 0x01d6, %tnpc
	.word 0x8594e165  ! 4967: WRPR_TSTATE_I	wrpr	%r19, 0x0165, %tstate
	.word 0xb4bc21d4  ! 4976: XNORcc_I	xnorcc 	%r16, 0x01d4, %r26
	.word 0xb135b001  ! 4983: SRLX_I	srlx	%r22, 0x0001, %r24
	.word 0xb64521dd  ! 4988: ADDC_I	addc 	%r20, 0x01dd, %r27
	.word 0xfe4c0000  ! 4990: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xf6554000  ! 4992: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xba24c000  ! 4993: SUB_R	sub 	%r19, %r0, %r29
	.word 0xfe14e10b  ! 4994: LDUH_I	lduh	[%r19 + 0x010b], %r31
	.word 0xff1c210a  ! 4997: LDDF_I	ldd	[%r16, 0x010a], %f31
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbfa48960  ! 2: FMULq	dis not found

	setx	0x20224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 5: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa88820  ! 8: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3ab4820  ! 10: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb5504000  ! 14: RDPR_TNPC	<illegal instruction>
	.word 0xbe8d6130  ! 15: ANDcc_I	andcc 	%r21, 0x0130, %r31
	.word 0xb1504000  ! 16: RDPR_TNPC	<illegal instruction>
	.word 0xbda489e0  ! 17: FDIVq	dis not found

	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 23: RDPR_PSTATE	<illegal instruction>
	.word 0xb3aa4820  ! 24: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0x8394219c  ! 25: WRPR_TNPC_I	wrpr	%r16, 0x019c, %tnpc
	.word 0xb3a9c820  ! 31: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda00540  ! 35: FSQRTd	fsqrt	
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 40: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbf540000  ! 45: RDPR_GL	<illegal instruction>
	setx	0x30011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 49: FMOVRLZ	dis not found

	.word 0xb0444000  ! 51: ADDC_R	addc 	%r17, %r0, %r24
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 56: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 58: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9abc820  ! 59: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbabde1a4  ! 61: XNORcc_I	xnorcc 	%r23, 0x01a4, %r29
	.word 0xb5a00560  ! 62: FSQRTq	fsqrt	
	.word 0xb5abc820  ! 63: FMOVVC	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7510000  ! 69: RDPR_TICK	<illegal instruction>
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e139  ! 72: WRPR_TNPC_I	wrpr	%r19, 0x0139, %tnpc
	.word 0xb6244000  ! 73: SUB_R	sub 	%r17, %r0, %r27
	.word 0xbba00560  ! 74: FSQRTq	fsqrt	
	.word 0xb3ab8820  ! 76: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a48820  ! 77: FADDs	fadds	%f18, %f0, %f28
	.word 0xb9abc820  ! 78: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a44840  ! 85: FADDd	faddd	%f48, %f0, %f24
	.word 0xb5ab8820  ! 88: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbba00560  ! 89: FSQRTq	fsqrt	
	.word 0xb3a9c820  ! 91: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbba98820  ! 95: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbc8ca198  ! 99: ANDcc_I	andcc 	%r18, 0x0198, %r30
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994204b  ! 103: WRPR_TICK_I	wrpr	%r16, 0x004b, %tick
	.word 0xb3540000  ! 105: RDPR_GL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 107: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a548e0  ! 113: FSUBq	dis not found

	.word 0xb3a409c0  ! 114: FDIVd	fdivd	%f16, %f0, %f56
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 117: FSQRTq	fsqrt	
	.word 0xb5a90820  ! 119: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a488a0  ! 120: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xb9a4c9a0  ! 123: FDIVs	fdivs	%f19, %f0, %f28
	mov	2, %r14
	.word 0xa193a000  ! 124: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a54860  ! 126: FADDq	dis not found

	.word 0xb3a00520  ! 127: FSQRTs	fsqrt	
	.word 0xbf480000  ! 129: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3a00040  ! 130: FMOVd	fmovd	%f0, %f56
	setx	data_start_4, %g1, %r23
	.word 0xbea560bd  ! 133: SUBcc_I	subcc 	%r21, 0x00bd, %r31
	setx	0x30228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 138: FMOVd	fmovd	%f0, %f58
	.word 0xb1520000  ! 139: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 140: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a489a0  ! 148: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xbf508000  ! 149: RDPR_TSTATE	<illegal instruction>
	.word 0x9195a01f  ! 150: WRPR_PIL_I	wrpr	%r22, 0x001f, %pil
	.word 0xb5a80420  ! 151: FMOVRZ	dis not found

	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a50840  ! 158: FADDd	faddd	%f20, %f0, %f56
	.word 0xbdaa4820  ! 160: FMOVNE	fmovs	%fcc1, %f0, %f30
	setx	0x1032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa40940  ! 166: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb7a90820  ! 167: FMOVLEU	fmovs	%fcc1, %f0, %f27
	mov	0, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbe3ce01a  ! 170: XNOR_I	xnor 	%r19, 0x001a, %r31
	.word 0xb7a00520  ! 171: FSQRTs	fsqrt	
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 182: FMOVRNZ	dis not found

	setx	0x10105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 189: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa8820  ! 191: FMOVG	fmovs	%fcc1, %f0, %f26
	setx	0x2013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e115  ! 193: WRPR_PIL_I	wrpr	%r23, 0x0115, %pil
	.word 0xbfa8c820  ! 195: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0x9194e175  ! 199: WRPR_PIL_I	wrpr	%r19, 0x0175, %pil
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda5c920  ! 201: FMULs	fmuls	%f23, %f0, %f30
	.word 0xb7643801  ! 207: MOVcc_I	<illegal instruction>
	.word 0xb5ab8820  ! 215: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a409c0  ! 217: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb32cc000  ! 218: SLL_R	sll 	%r19, %r0, %r25
	.word 0xb9a449a0  ! 223: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xbf504000  ! 227: RDPR_TNPC	<illegal instruction>
	.word 0x8394a083  ! 230: WRPR_TNPC_I	wrpr	%r18, 0x0083, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00520  ! 234: FSQRTs	fsqrt	
	.word 0xbf3c1000  ! 240: SRAX_R	srax	%r16, %r0, %r31
	.word 0x8d94a15e  ! 244: WRPR_PSTATE_I	wrpr	%r18, 0x015e, %pstate
	.word 0xbba00520  ! 248: FSQRTs	fsqrt	
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf34c000  ! 254: SRL_R	srl 	%r19, %r0, %r31
	.word 0xb9504000  ! 258: RDPR_TNPC	<illegal instruction>
	.word 0xb97de401  ! 259: MOVR_I	movre	%r23, 0x1, %r28
	.word 0xbfa00560  ! 267: FSQRTq	fsqrt	
	.word 0x8394e13f  ! 268: WRPR_TNPC_I	wrpr	%r19, 0x013f, %tnpc
	.word 0xbd518000  ! 269: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94e0cd  ! 272: WRPR_PSTATE_I	wrpr	%r19, 0x00cd, %pstate
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	.word 0xbbab8820  ! 279: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba44920  ! 282: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbb510000  ! 283: RDPR_TICK	<illegal instruction>
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a54820  ! 286: FADDs	fadds	%f21, %f0, %f24
	.word 0xb9480000  ! 299: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x3002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bdc000  ! 310: XNORcc_R	xnorcc 	%r23, %r0, %r26
	setx	data_start_0, %g1, %r19
	.word 0xb9a40940  ! 314: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb5508000  ! 316: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a175  ! 331: WRPR_TSTATE_I	wrpr	%r18, 0x0175, %tstate
	.word 0xb5a00560  ! 332: FSQRTq	fsqrt	
	.word 0xb5abc820  ! 333: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0x8794a19a  ! 334: WRPR_TT_I	wrpr	%r18, 0x019a, %tt
	setx	data_start_6, %g1, %r19
	.word 0xb5a589e0  ! 340: FDIVq	dis not found

	.word 0xbda98820  ! 341: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a5c840  ! 346: FADDd	faddd	%f54, %f0, %f28
	.word 0xb3a00520  ! 349: FSQRTs	fsqrt	
	.word 0xb5aa8820  ! 351: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1480000  ! 354: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7a508a0  ! 357: FSUBs	fsubs	%f20, %f0, %f27
	.word 0xbab4a054  ! 365: SUBCcc_I	orncc 	%r18, 0x0054, %r29
	.word 0x9194a092  ! 366: WRPR_PIL_I	wrpr	%r18, 0x0092, %pil
	.word 0xbb508000  ! 368: RDPR_TSTATE	<illegal instruction>
	.word 0xb3480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb1ab8820  ! 376: FMOVPOS	fmovs	%fcc1, %f0, %f24
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 379: RDPR_TICK	<illegal instruction>
	.word 0xb9a448e0  ! 380: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983f4b  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4b, %hpstate
	.word 0x8794e1a1  ! 383: WRPR_TT_I	wrpr	%r19, 0x01a1, %tt
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc8c4000  ! 385: ANDcc_R	andcc 	%r17, %r0, %r30
	.word 0xbe24e06f  ! 386: SUB_I	sub 	%r19, 0x006f, %r31
	.word 0xb3abc820  ! 388: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb0944000  ! 391: ORcc_R	orcc 	%r17, %r0, %r24
	.word 0xb1a9c820  ! 392: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a4c860  ! 395: FADDq	dis not found

	.word 0xbda548a0  ! 398: FSUBs	fsubs	%f21, %f0, %f30
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba4c920  ! 400: FMULs	fmuls	%f19, %f0, %f29
	.word 0xbfa00560  ! 402: FSQRTq	fsqrt	
	.word 0xb9a00560  ! 405: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a8c820  ! 410: FMOVL	fmovs	%fcc1, %f0, %f24
	setx	data_start_7, %g1, %r23
	.word 0xb3a00540  ! 413: FSQRTd	fsqrt	
	.word 0xbbaa8820  ! 414: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a48840  ! 419: FADDd	faddd	%f18, %f0, %f24
	.word 0xbfa90820  ! 421: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbe4420b9  ! 423: ADDC_I	addc 	%r16, 0x00b9, %r31
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6342105  ! 428: SUBC_I	orn 	%r16, 0x0105, %r27
	.word 0xb1a98820  ! 430: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbba548a0  ! 431: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xbf510000  ! 432: RDPR_TICK	<illegal instruction>
	.word 0xb3ab0820  ! 435: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x8d95e1cc  ! 437: WRPR_PSTATE_I	wrpr	%r23, 0x01cc, %pstate
	.word 0xb1a40940  ! 439: FMULd	fmuld	%f16, %f0, %f24
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa488a0  ! 444: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xbda00020  ! 446: FMOVs	fmovs	%f0, %f30
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xf, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 456: RDPR_GL	rdpr	%-, %r26
	.word 0xba3d610a  ! 458: XNOR_I	xnor 	%r21, 0x010a, %r29
	.word 0xb7a90820  ! 459: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb1a84820  ! 461: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb095a13d  ! 465: ORcc_I	orcc 	%r22, 0x013d, %r24
	.word 0x9195a1d3  ! 466: WRPR_PIL_I	wrpr	%r22, 0x01d3, %pil
	.word 0xb1a00040  ! 468: FMOVd	fmovd	%f0, %f24
	.word 0xbba409c0  ! 470: FDIVd	fdivd	%f16, %f0, %f60
	mov	2, %r14
	.word 0xa193a000  ! 471: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795608c  ! 476: WRPR_TT_I	wrpr	%r21, 0x008c, %tt
	.word 0xbda4c8a0  ! 482: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb5a54940  ! 485: FMULd	fmuld	%f52, %f0, %f26
	setx	data_start_1, %g1, %r23
	.word 0xb9a00520  ! 487: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8594618f  ! 492: WRPR_TSTATE_I	wrpr	%r17, 0x018f, %tstate
	.word 0xb8254000  ! 497: SUB_R	sub 	%r21, %r0, %r28
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 501: RDPR_PSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 502: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7500000  ! 508: RDPR_TPC	<illegal instruction>
	.word 0xbfa00540  ! 511: FSQRTd	fsqrt	
	.word 0xbba80820  ! 513: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c8a0  ! 514: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbfa00540  ! 516: FSQRTd	fsqrt	
	.word 0xbda4c9c0  ! 517: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xbda449e0  ! 518: FDIVq	dis not found

	.word 0xb1abc820  ! 519: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81820  ! 521: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb09c4000  ! 522: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xb9aa4820  ! 523: FMOVNE	fmovs	%fcc1, %f0, %f28
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9518000  ! 542: RDPR_PSTATE	<illegal instruction>
	.word 0xbd500000  ! 544: RDPR_TPC	<illegal instruction>
	.word 0xb1aa4820  ! 546: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0x9195216f  ! 549: WRPR_PIL_I	wrpr	%r20, 0x016f, %pil
	.word 0xb7a80820  ! 551: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbda4c860  ! 554: FADDq	dis not found

	.word 0xbb504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0x8995e187  ! 556: WRPR_TICK_I	wrpr	%r23, 0x0187, %tick
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 560: FMOVA	fmovs	%fcc1, %f0, %f26
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 563: FSQRTd	fsqrt	
	setx	0x2030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f89  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
	.word 0xb751c000  ! 571: RDPR_TL	<illegal instruction>
	.word 0xb3a5c840  ! 577: FADDd	faddd	%f54, %f0, %f56
	.word 0xbba44920  ! 581: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbdaa8820  ! 582: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a40840  ! 583: FADDd	faddd	%f16, %f0, %f28
	.word 0xbba40820  ! 587: FADDs	fadds	%f16, %f0, %f29
	.word 0xb3a00520  ! 589: FSQRTs	fsqrt	
	.word 0xbfa80c20  ! 593: FMOVRLZ	dis not found

	.word 0xb7a8c820  ! 594: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0x8994a1e5  ! 598: WRPR_TICK_I	wrpr	%r18, 0x01e5, %tick
	.word 0xb4944000  ! 599: ORcc_R	orcc 	%r17, %r0, %r26
	.word 0xb3a00560  ! 601: FSQRTq	fsqrt	
	.word 0xbba408e0  ! 604: FSUBq	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 605: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda80c20  ! 606: FMOVRLZ	dis not found

	.word 0xb5a4c940  ! 610: FMULd	fmuld	%f50, %f0, %f26
	.word 0xb3a549c0  ! 611: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb5a44820  ! 613: FADDs	fadds	%f17, %f0, %f26
	.word 0xbd500000  ! 617: RDPR_TPC	<illegal instruction>
	.word 0xb7a00560  ! 620: FSQRTq	fsqrt	
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 624: RDPR_GL	<illegal instruction>
	.word 0xbbaa4820  ! 628: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1508000  ! 629: RDPR_TSTATE	<illegal instruction>
	.word 0xb5abc820  ! 631: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a54960  ! 632: FMULq	dis not found

	.word 0xb1ab0820  ! 634: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbba44940  ! 645: FMULd	fmuld	%f48, %f0, %f60
	.word 0xbda4c840  ! 649: FADDd	faddd	%f50, %f0, %f30
	.word 0xb1508000  ! 651: RDPR_TSTATE	<illegal instruction>
	.word 0xbba408c0  ! 656: FSUBd	fsubd	%f16, %f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81983a01  ! 659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a01, %hpstate
	.word 0xb5aac820  ! 660: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbd510000  ! 665: RDPR_TICK	<illegal instruction>
	.word 0xb7a80c20  ! 667: FMOVRLZ	dis not found

	.word 0xbfa50840  ! 672: FADDd	faddd	%f20, %f0, %f62
	setx	data_start_7, %g1, %r21
	.word 0x8995a080  ! 676: WRPR_TICK_I	wrpr	%r22, 0x0080, %tick
	.word 0xb3480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb5ab4820  ! 678: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a94820  ! 679: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80820  ! 680: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80820  ! 681: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0x8594a084  ! 686: WRPR_TSTATE_I	wrpr	%r18, 0x0084, %tstate
	.word 0xb7a81420  ! 688: FMOVRNZ	dis not found

	.word 0x8594205d  ! 689: WRPR_TSTATE_I	wrpr	%r16, 0x005d, %tstate
	.word 0xbfa54940  ! 690: FMULd	fmuld	%f52, %f0, %f62
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a50960  ! 694: FMULq	dis not found

	.word 0xb7ab8820  ! 696: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbcc58000  ! 700: ADDCcc_R	addccc 	%r22, %r0, %r30
	setx	0x1022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb84520a1  ! 703: ADDC_I	addc 	%r20, 0x00a1, %r28
	.word 0xb1a508c0  ! 709: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xbf500000  ! 712: RDPR_TPC	<illegal instruction>
	.word 0xb5a80820  ! 713: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbba00540  ! 715: FSQRTd	fsqrt	
	.word 0xb1a00040  ! 718: FMOVd	fmovd	%f0, %f24
	.word 0x8394a131  ! 723: WRPR_TNPC_I	wrpr	%r18, 0x0131, %tnpc
	setx	0x1001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	.word 0xbba00540  ! 731: FSQRTd	fsqrt	
	.word 0xbda9c820  ! 735: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a40820  ! 736: FADDs	fadds	%f16, %f0, %f24
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81982b8b  ! 743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8b, %hpstate
	.word 0xbf500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0xb7aa4820  ! 748: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3504000  ! 749: RDPR_TNPC	<illegal instruction>
	.word 0xb9aa4820  ! 750: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a98820  ! 753: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81820  ! 756: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbfa00560  ! 761: FSQRTq	fsqrt	
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919560ec  ! 764: WRPR_PIL_I	wrpr	%r21, 0x00ec, %pil
	.word 0xb1a00560  ! 765: FSQRTq	fsqrt	
	.word 0xb9aa4820  ! 766: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a50960  ! 768: FMULq	dis not found

	.word 0xbfa4c840  ! 770: FADDd	faddd	%f50, %f0, %f62
	.word 0xb1a81820  ! 772: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb1520000  ! 776: RDPR_PIL	<illegal instruction>
	setx	0x33c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa0820  ! 778: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb1504000  ! 780: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0xb5a00520  ! 792: FSQRTs	fsqrt	
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	.word 0xb3a00040  ! 813: FMOVd	fmovd	%f0, %f56
	.word 0xbdab8820  ! 814: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80820  ! 815: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb1a58940  ! 816: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb1a94820  ! 817: FMOVCS	fmovs	%fcc1, %f0, %f24
	setx	0x3011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 820: RDPR_GL	<illegal instruction>
	.word 0xb5510000  ! 823: RDPR_TICK	<illegal instruction>
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 826: FSQRTs	fsqrt	
	setx	data_start_1, %g1, %r23
	.word 0xb3a44960  ! 836: FMULq	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 838: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a90820  ! 841: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb9508000  ! 842: RDPR_TSTATE	<illegal instruction>
	setx	0x2001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 846: FMOVNEG	fmovs	%fcc1, %f0, %f26
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9c0  ! 850: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb3a4c8c0  ! 855: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xbfa00040  ! 867: FMOVd	fmovd	%f0, %f62
	.word 0xb1518000  ! 873: RDPR_PSTATE	<illegal instruction>
	.word 0xbf3d5000  ! 877: SRAX_R	srax	%r21, %r0, %r31
	.word 0xbfabc820  ! 878: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80c20  ! 881: FMOVRLZ	dis not found

	.word 0xb4b50000  ! 882: SUBCcc_R	orncc 	%r20, %r0, %r26
	setx	data_start_0, %g1, %r23
	.word 0xb5a84820  ! 891: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb1aa8820  ! 894: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa0820  ! 896: FMOVA	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982fc1  ! 897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc1, %hpstate
	.word 0x839421b9  ! 899: WRPR_TNPC_I	wrpr	%r16, 0x01b9, %tnpc
	.word 0xb3518000  ! 902: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a548e0  ! 905: FSUBq	dis not found

	.word 0xb89421a1  ! 908: ORcc_I	orcc 	%r16, 0x01a1, %r28
	.word 0x8995e0ea  ! 910: WRPR_TICK_I	wrpr	%r23, 0x00ea, %tick
	.word 0xb5a81420  ! 913: FMOVRNZ	dis not found

	.word 0x8d95e1cc  ! 915: WRPR_PSTATE_I	wrpr	%r23, 0x01cc, %pstate
	setx	0x30006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 918: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbfa94820  ! 922: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbda80420  ! 923: FMOVRZ	dis not found

	.word 0xb3a50940  ! 929: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbfa409c0  ! 932: FDIVd	fdivd	%f16, %f0, %f62
	.word 0xb7a88820  ! 935: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0x879420e1  ! 936: WRPR_TT_I	wrpr	%r16, 0x00e1, %tt
	.word 0xbfa589a0  ! 942: FDIVs	fdivs	%f22, %f0, %f31
	setx	0x10005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0xbb520000  ! 947: RDPR_PIL	<illegal instruction>
	.word 0x8d95a10f  ! 950: WRPR_PSTATE_I	wrpr	%r22, 0x010f, %pstate
	.word 0xb9a80420  ! 951: FMOVRZ	dis not found

	.word 0xb5520000  ! 952: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1aa8820  ! 958: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0x8995e097  ! 959: WRPR_TICK_I	wrpr	%r23, 0x0097, %tick
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a44920  ! 963: FMULs	fmuls	%f17, %f0, %f26
	.word 0xb1500000  ! 967: RDPR_TPC	<illegal instruction>
	.word 0xb9a50840  ! 969: FADDd	faddd	%f20, %f0, %f28
	.word 0xb0b50000  ! 971: ORNcc_R	orncc 	%r20, %r0, %r24
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb00cc000  ! 976: AND_R	and 	%r19, %r0, %r24
	.word 0xbda5c9e0  ! 978: FDIVq	dis not found

	.word 0xb1a589c0  ! 979: FDIVd	fdivd	%f22, %f0, %f24
	setx	data_start_3, %g1, %r21
	.word 0x8995e09b  ! 995: WRPR_TICK_I	wrpr	%r23, 0x009b, %tick
	.word 0xbfa58940  ! 996: FMULd	fmuld	%f22, %f0, %f62
	.word 0xbfa409c0  ! 999: FDIVd	fdivd	%f16, %f0, %f62
	.word 0xb7a549c0  ! 1004: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xbf50c000  ! 1005: RDPR_TT	<illegal instruction>
	setx	data_start_6, %g1, %r22
	.word 0xb3ab8820  ! 1010: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbb518000  ! 1013: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r16
	.word 0xbda00540  ! 1020: FSQRTd	fsqrt	
	.word 0xb1a00520  ! 1022: FSQRTs	fsqrt	
	setx	data_start_4, %g1, %r21
	setx	0x3020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa548c0  ! 1030: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xb3a81820  ! 1031: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 1034: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x85946123  ! 1043: WRPR_TSTATE_I	wrpr	%r17, 0x0123, %tstate
	setx	0x30233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 1045: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbe1ca130  ! 1046: XOR_I	xor 	%r18, 0x0130, %r31
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54820  ! 1048: FADDs	fadds	%f21, %f0, %f26
	.word 0xb9a449c0  ! 1057: FDIVd	fdivd	%f48, %f0, %f28
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 1064: FMOVRNZ	dis not found

	.word 0xb5aa4820  ! 1065: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a44960  ! 1070: FMULq	dis not found

	.word 0xb7ab8820  ! 1072: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbbabc820  ! 1074: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 1078: RDPR_PSTATE	<illegal instruction>
	.word 0x8995a015  ! 1079: WRPR_TICK_I	wrpr	%r22, 0x0015, %tick
	.word 0x81956128  ! 1080: WRPR_TPC_I	wrpr	%r21, 0x0128, %tpc
	.word 0xbba80c20  ! 1084: FMOVRLZ	dis not found

	.word 0xbcb560f2  ! 1091: ORNcc_I	orncc 	%r21, 0x00f2, %r30
	.word 0xb7a48860  ! 1094: FADDq	dis not found

	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 1097: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbd504000  ! 1098: RDPR_TNPC	<illegal instruction>
	.word 0xb3a509a0  ! 1103: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xbfab4820  ! 1105: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbb7d4400  ! 1106: MOVR_R	movre	%r21, %r0, %r29
	.word 0xb1a98820  ! 1110: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a54820  ! 1114: FADDs	fadds	%f21, %f0, %f26
	.word 0xb3504000  ! 1115: RDPR_TNPC	<illegal instruction>
	.word 0xbda80c20  ! 1117: FMOVRLZ	dis not found

	.word 0xb08ce176  ! 1118: ANDcc_I	andcc 	%r19, 0x0176, %r24
	.word 0xb134f001  ! 1119: SRLX_I	srlx	%r19, 0x0001, %r24
	.word 0xbb504000  ! 1121: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81c20  ! 1124: FMOVRGEZ	dis not found

	.word 0x8594208a  ! 1128: WRPR_TSTATE_I	wrpr	%r16, 0x008a, %tstate
	.word 0xb7a508c0  ! 1131: FSUBd	fsubd	%f20, %f0, %f58
	mov	0, %r12
	.word 0x8f932000  ! 1133: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa90820  ! 1134: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0x9195a0c6  ! 1137: WRPR_PIL_I	wrpr	%r22, 0x00c6, %pil
	.word 0xb13d4000  ! 1141: SRA_R	sra 	%r21, %r0, %r24
	.word 0xbf504000  ! 1142: RDPR_TNPC	<illegal instruction>
	.word 0xb97c8400  ! 1143: MOVR_R	movre	%r18, %r0, %r28
	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa54920  ! 1145: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb72cf001  ! 1151: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xbfa58840  ! 1154: FADDd	faddd	%f22, %f0, %f62
	.word 0xbe9dc000  ! 1164: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xb3a50860  ! 1167: FADDq	dis not found

	.word 0xbb510000  ! 1169: RDPR_TICK	<illegal instruction>
	.word 0xb32ce001  ! 1170: SLL_I	sll 	%r19, 0x0001, %r25
	.word 0xb7500000  ! 1173: RDPR_TPC	<illegal instruction>
	.word 0xb6952055  ! 1175: ORcc_I	orcc 	%r20, 0x0055, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1aac820  ! 1180: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	data_start_0, %g1, %r17
	.word 0xb9a58860  ! 1192: FADDq	dis not found

	.word 0xb3a81420  ! 1194: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983d99  ! 1197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d99, %hpstate
	.word 0xb93db001  ! 1199: SRAX_I	srax	%r22, 0x0001, %r28
	.word 0xb150c000  ! 1200: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 1205: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a1da  ! 1217: WRPR_TT_I	wrpr	%r18, 0x01da, %tt
	.word 0xbf510000  ! 1220: RDPR_TICK	<illegal instruction>
	.word 0xb7ab8820  ! 1226: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb41c4000  ! 1228: XOR_R	xor 	%r17, %r0, %r26
	.word 0xb1a48960  ! 1231: FMULq	dis not found

	.word 0xb5a88820  ! 1233: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbcb5c000  ! 1235: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0x8795a0d4  ! 1239: WRPR_TT_I	wrpr	%r22, 0x00d4, %tt
	.word 0xb5ab8820  ! 1240: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbda54860  ! 1243: FADDq	dis not found

	.word 0xb9aa8820  ! 1244: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0x899420dd  ! 1245: WRPR_TICK_I	wrpr	%r16, 0x00dd, %tick
	.word 0xb615e089  ! 1248: OR_I	or 	%r23, 0x0089, %r27
	.word 0xb7a48860  ! 1249: FADDq	dis not found

	.word 0xb6ad20df  ! 1250: ANDNcc_I	andncc 	%r20, 0x00df, %r27
	.word 0x83952079  ! 1256: WRPR_TNPC_I	wrpr	%r20, 0x0079, %tnpc
	.word 0xbba549c0  ! 1260: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xbda90820  ! 1263: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbf51c000  ! 1265: RDPR_TL	<illegal instruction>
	.word 0xbb2c1000  ! 1272: SLLX_R	sllx	%r16, %r0, %r29
	.word 0xb7504000  ! 1273: RDPR_TNPC	<illegal instruction>
	.word 0xb4240000  ! 1276: SUB_R	sub 	%r16, %r0, %r26
	.word 0xbda81c20  ! 1277: FMOVRGEZ	dis not found

	.word 0xbfa00560  ! 1278: FSQRTq	fsqrt	
	.word 0xbd520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0x8d952115  ! 1286: WRPR_PSTATE_I	wrpr	%r20, 0x0115, %pstate
	.word 0xb3a98820  ! 1287: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbda549e0  ! 1295: FDIVq	dis not found

	.word 0xbdaac820  ! 1298: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb1ab4820  ! 1301: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb3500000  ! 1305: RDPR_TPC	<illegal instruction>
	.word 0xb3a81820  ! 1306: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbba508a0  ! 1309: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xb77de401  ! 1311: MOVR_I	movre	%r23, 0x1, %r27
	setx	data_start_3, %g1, %r16
	.word 0xbda8c820  ! 1315: FMOVL	fmovs	%fcc1, %f0, %f30
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa408c0  ! 1320: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xb5504000  ! 1321: RDPR_TNPC	<illegal instruction>
	.word 0xbba58920  ! 1322: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb1518000  ! 1323: RDPR_PSTATE	<illegal instruction>
	.word 0xb9aac820  ! 1324: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbfaac820  ! 1325: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbda8c820  ! 1328: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb3a94820  ! 1329: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb3518000  ! 1332: RDPR_PSTATE	<illegal instruction>
	.word 0xbd480000  ! 1335: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	data_start_5, %g1, %r22
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 1341: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda98820  ! 1342: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9518000  ! 1344: RDPR_PSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r16
	.word 0xb5a9c820  ! 1350: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a54920  ! 1355: FMULs	fmuls	%f21, %f0, %f24
	setx	0x2011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9e0  ! 1367: FDIVq	dis not found

	.word 0xb9a5c820  ! 1372: FADDs	fadds	%f23, %f0, %f28
	.word 0xb1a80820  ! 1377: FMOVN	fmovs	%fcc1, %f0, %f24
	setx	0x30118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa508a0  ! 1384: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xb9ab4820  ! 1387: FMOVCC	fmovs	%fcc1, %f0, %f28
	setx	0x30036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52d6001  ! 1395: SLL_I	sll 	%r21, 0x0001, %r26
	.word 0xb3510000  ! 1396: RDPR_TICK	<illegal instruction>
	.word 0xb1a94820  ! 1402: FMOVCS	fmovs	%fcc1, %f0, %f24
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 1406: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xbda90820  ! 1409: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb5510000  ! 1410: RDPR_TICK	<illegal instruction>
	.word 0xb7510000  ! 1411: RDPR_TICK	<illegal instruction>
	.word 0xb045c000  ! 1413: ADDC_R	addc 	%r23, %r0, %r24
	.word 0x8195a130  ! 1414: WRPR_TPC_I	wrpr	%r22, 0x0130, %tpc
	.word 0xb63d601f  ! 1420: XNOR_I	xnor 	%r21, 0x001f, %r27
	.word 0xbd3cc000  ! 1424: SRA_R	sra 	%r19, %r0, %r30
	.word 0xb68461f8  ! 1429: ADDcc_I	addcc 	%r17, 0x01f8, %r27
	.word 0x859561f5  ! 1431: WRPR_TSTATE_I	wrpr	%r21, 0x01f5, %tstate
	.word 0xbfa00020  ! 1432: FMOVs	fmovs	%f0, %f31
	.word 0xbb34f001  ! 1434: SRLX_I	srlx	%r19, 0x0001, %r29
	.word 0xb1aa0820  ! 1439: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbd480000  ! 1440: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe1dc000  ! 1442: XOR_R	xor 	%r23, %r0, %r31
	setx	data_start_0, %g1, %r22
	.word 0xb77c0400  ! 1448: MOVR_R	movre	%r16, %r0, %r27
	.word 0xbf51c000  ! 1449: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1451: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb510000  ! 1458: RDPR_TICK	<illegal instruction>
	.word 0xbfa50940  ! 1459: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb1a5c9a0  ! 1460: FDIVs	fdivs	%f23, %f0, %f24
	.word 0x87956101  ! 1461: WRPR_TT_I	wrpr	%r21, 0x0101, %tt
	.word 0x8d95e0ba  ! 1462: WRPR_PSTATE_I	wrpr	%r23, 0x00ba, %pstate
	.word 0xbda8c820  ! 1463: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbfa94820  ! 1468: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbf540000  ! 1475: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 1480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0xbfa90820  ! 1481: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9aa0820  ! 1482: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbda98820  ! 1483: FMOVNEG	fmovs	%fcc1, %f0, %f30
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 1486: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1489: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba508c0  ! 1490: FSUBd	fsubd	%f20, %f0, %f60
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 1494: FMOVRZ	dis not found

	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 1501: RDPR_TPC	<illegal instruction>
	.word 0xbba8c820  ! 1502: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1a448e0  ! 1509: FSUBq	dis not found

	.word 0xbe9cc000  ! 1510: XORcc_R	xorcc 	%r19, %r0, %r31
	setx	data_start_7, %g1, %r17
	.word 0xb9a98820  ! 1512: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb9a50840  ! 1513: FADDd	faddd	%f20, %f0, %f28
	.word 0xb1ab0820  ! 1516: FMOVGU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982ed3  ! 1517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed3, %hpstate
	.word 0xb5a00520  ! 1521: FSQRTs	fsqrt	
	.word 0xb3a54940  ! 1523: FMULd	fmuld	%f52, %f0, %f56
	.word 0xb3500000  ! 1525: RDPR_TPC	<illegal instruction>
	.word 0xbfabc820  ! 1528: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a509c0  ! 1535: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xb5a44840  ! 1537: FADDd	faddd	%f48, %f0, %f26
	.word 0xb5aa8820  ! 1539: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbda80420  ! 1540: FMOVRZ	dis not found

	.word 0xb5ab0820  ! 1544: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a588e0  ! 1546: FSUBq	dis not found

	.word 0xb3a81420  ! 1551: FMOVRNZ	dis not found

	.word 0xb5a00040  ! 1552: FMOVd	fmovd	%f0, %f26
	mov	1, %r12
	.word 0x8f932000  ! 1553: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_4, %g1, %r16
	.word 0xbf51c000  ! 1556: RDPR_TL	<illegal instruction>
	.word 0xb3a449a0  ! 1557: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb5a80420  ! 1559: FMOVRZ	dis not found

	.word 0xbfa40940  ! 1560: FMULd	fmuld	%f16, %f0, %f62
	.word 0xbea5a0df  ! 1561: SUBcc_I	subcc 	%r22, 0x00df, %r31
	.word 0xb1510000  ! 1567: RDPR_TICK	<illegal instruction>
	.word 0xbda00540  ! 1568: FSQRTd	fsqrt	
	.word 0xbda408e0  ! 1574: FSUBq	dis not found

	.word 0xbbab8820  ! 1577: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbf50c000  ! 1580: RDPR_TT	<illegal instruction>
	.word 0xb7a4c820  ! 1585: FADDs	fadds	%f19, %f0, %f27
	.word 0x859521a4  ! 1586: WRPR_TSTATE_I	wrpr	%r20, 0x01a4, %tstate
	.word 0xb4b4a087  ! 1589: SUBCcc_I	orncc 	%r18, 0x0087, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf2d1000  ! 1597: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xb9a88820  ! 1598: FMOVLE	fmovs	%fcc1, %f0, %f28
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0xbd510000  ! 1602: RDPR_TICK	<illegal instruction>
	.word 0xb1a00560  ! 1608: FSQRTq	fsqrt	
	.word 0xbda98820  ! 1610: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbb355000  ! 1611: SRLX_R	srlx	%r21, %r0, %r29
	setx	0x21b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c960  ! 1613: FMULq	dis not found

	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a07f  ! 1620: WRPR_TICK_I	wrpr	%r18, 0x007f, %tick
	.word 0xb151c000  ! 1622: RDPR_TL	<illegal instruction>
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 1627: RDPR_GL	<illegal instruction>
	.word 0xbba9c820  ! 1628: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbda408e0  ! 1632: FSUBq	dis not found

	.word 0xbcb460ab  ! 1634: SUBCcc_I	orncc 	%r17, 0x00ab, %r30
	.word 0xbf504000  ! 1638: RDPR_TNPC	<illegal instruction>
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c860  ! 1644: FADDq	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 1648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a9c820  ! 1649: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbd510000  ! 1651: RDPR_TICK	<illegal instruction>
	.word 0xb5a489e0  ! 1653: FDIVq	dis not found

	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 1660: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb9ab4820  ! 1661: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbf510000  ! 1665: RDPR_TICK	<illegal instruction>
	.word 0xb73d2001  ! 1666: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xbda488a0  ! 1667: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xb5a44960  ! 1668: FMULq	dis not found

	.word 0xb5a00520  ! 1670: FSQRTs	fsqrt	
	.word 0xbe2c8000  ! 1673: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xb9a5c960  ! 1675: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xbbaa8820  ! 1680: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbca4c000  ! 1682: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xbfa8c820  ! 1684: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb9aa4820  ! 1686: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80820  ! 1689: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb1a58860  ! 1692: FADDq	dis not found

	setx	0x335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 1700: RDPR_PSTATE	<illegal instruction>
	.word 0xb0bd4000  ! 1701: XNORcc_R	xnorcc 	%r21, %r0, %r24
	.word 0xb3a9c820  ! 1707: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9643801  ! 1711: MOVcc_I	<illegal instruction>
	setx	0x1020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a548a0  ! 1720: FSUBs	fsubs	%f21, %f0, %f25
	.word 0x85956196  ! 1724: WRPR_TSTATE_I	wrpr	%r21, 0x0196, %tstate
	.word 0xb9a5c840  ! 1725: FADDd	faddd	%f54, %f0, %f28
	.word 0xb3a80820  ! 1726: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	setx	0x10335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda508a0  ! 1729: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xb5a9c820  ! 1730: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a98820  ! 1736: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c960  ! 1739: FMULq	dis not found

	.word 0xb3a81420  ! 1741: FMOVRNZ	dis not found

	.word 0xb7a80820  ! 1742: FMOVN	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 1743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	.word 0xb3a50860  ! 1744: FADDq	dis not found

	.word 0xbba98820  ! 1745: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	setx	0x325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819561ca  ! 1749: WRPR_TPC_I	wrpr	%r21, 0x01ca, %tpc
	.word 0x91952095  ! 1752: WRPR_PIL_I	wrpr	%r20, 0x0095, %pil
	.word 0x91952044  ! 1754: WRPR_PIL_I	wrpr	%r20, 0x0044, %pil
	.word 0xbbaac820  ! 1758: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb3520000  ! 1760: RDPR_PIL	<illegal instruction>
	.word 0xb5518000  ! 1762: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a44860  ! 1767: FADDq	dis not found

	.word 0xb151c000  ! 1771: RDPR_TL	<illegal instruction>
	.word 0xbba00020  ! 1775: FMOVs	fmovs	%f0, %f29
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a50920  ! 1786: FMULs	fmuls	%f20, %f0, %f24
	.word 0xb9a44820  ! 1788: FADDs	fadds	%f17, %f0, %f28
	.word 0xb7a5c8c0  ! 1792: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb1a5c8c0  ! 1794: FSUBd	fsubd	%f54, %f0, %f24
	.word 0x81942135  ! 1798: WRPR_TPC_I	wrpr	%r16, 0x0135, %tpc
	.word 0x9194e0df  ! 1800: WRPR_PIL_I	wrpr	%r19, 0x00df, %pil
	.word 0xb9aa4820  ! 1801: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbdabc820  ! 1802: FMOVVC	fmovs	%fcc1, %f0, %f30
	setx	0x2022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942199  ! 1806: WRPR_TPC_I	wrpr	%r16, 0x0199, %tpc
	.word 0xb1a80c20  ! 1810: FMOVRLZ	dis not found

	.word 0xb7aa4820  ! 1812: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb7520000  ! 1813: RDPR_PIL	<illegal instruction>
	.word 0xb7a54860  ! 1815: FADDq	dis not found

	.word 0xbdab0820  ! 1817: FMOVGU	fmovs	%fcc1, %f0, %f30
	mov	0, %r14
	.word 0xa193a000  ! 1818: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a4c9a0  ! 1820: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb7a81c20  ! 1822: FMOVRGEZ	dis not found

	.word 0xb3ab0820  ! 1823: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbba589c0  ! 1824: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xb20de1dc  ! 1825: AND_I	and 	%r23, 0x01dc, %r25
	.word 0xb3a00520  ! 1827: FSQRTs	fsqrt	
	setx	data_start_2, %g1, %r20
	.word 0xbfa9c820  ! 1834: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa8820  ! 1837: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5520000  ! 1839: RDPR_PIL	<illegal instruction>
	.word 0xbb518000  ! 1841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982e4b  ! 1843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4b, %hpstate
	.word 0xb3a488e0  ! 1846: FSUBq	dis not found

	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 1849: RDPR_TICK	<illegal instruction>
	.word 0xb7a98820  ! 1859: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb7518000  ! 1861: RDPR_PSTATE	<illegal instruction>
	.word 0x859561dd  ! 1863: WRPR_TSTATE_I	wrpr	%r21, 0x01dd, %tstate
	.word 0xb9a409a0  ! 1866: FDIVs	fdivs	%f16, %f0, %f28
	setx	data_start_1, %g1, %r17
	.word 0xbda00520  ! 1870: FSQRTs	fsqrt	
	.word 0x83952119  ! 1871: WRPR_TNPC_I	wrpr	%r20, 0x0119, %tnpc
	.word 0xb9a80c20  ! 1872: FMOVRLZ	dis not found

	.word 0xbda00560  ! 1873: FSQRTq	fsqrt	
	.word 0xb2aca1c5  ! 1874: ANDNcc_I	andncc 	%r18, 0x01c5, %r25
	.word 0x83946171  ! 1875: WRPR_TNPC_I	wrpr	%r17, 0x0171, %tnpc
	.word 0xbba549e0  ! 1878: FDIVq	dis not found

	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_3, %g1, %r18
	.word 0xb2846087  ! 1886: ADDcc_I	addcc 	%r17, 0x0087, %r25
	.word 0xbab5e1de  ! 1891: ORNcc_I	orncc 	%r23, 0x01de, %r29
	.word 0xb5a81420  ! 1893: FMOVRNZ	dis not found

	.word 0xb2b5a173  ! 1896: ORNcc_I	orncc 	%r22, 0x0173, %r25
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 1904: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a409e0  ! 1905: FDIVq	dis not found

	.word 0xb9abc820  ! 1906: FMOVVC	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x1031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 1913: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81420  ! 1921: FMOVRNZ	dis not found

	.word 0xb3540000  ! 1922: RDPR_GL	<illegal instruction>
	setx	0x10030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 1924: FSQRTd	fsqrt	
	.word 0x8194e08d  ! 1928: WRPR_TPC_I	wrpr	%r19, 0x008d, %tpc
	.word 0xb37da401  ! 1932: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xbfaa4820  ! 1935: FMOVNE	fmovs	%fcc1, %f0, %f31
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba98820  ! 1937: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb5508000  ! 1938: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00540  ! 1940: FSQRTd	fsqrt	
	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 1943: FMOVLE	fmovs	%fcc1, %f0, %f25
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 1948: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9a589a0  ! 1949: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xb351c000  ! 1953: RDPR_TL	<illegal instruction>
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9c0  ! 1956: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb9a54860  ! 1957: FADDq	dis not found

	.word 0xbfa00540  ! 1959: FSQRTd	fsqrt	
	.word 0xb5a4c8a0  ! 1963: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb5504000  ! 1965: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c91  ! 1966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c91, %hpstate
	setx	data_start_1, %g1, %r17
	.word 0xb044c000  ! 1969: ADDC_R	addc 	%r19, %r0, %r24
	.word 0x8d952107  ! 1970: WRPR_PSTATE_I	wrpr	%r20, 0x0107, %pstate
	.word 0xb9a4c8c0  ! 1971: FSUBd	fsubd	%f50, %f0, %f28
	.word 0x919421a5  ! 1972: WRPR_PIL_I	wrpr	%r16, 0x01a5, %pil
	.word 0xbda4c8c0  ! 1973: FSUBd	fsubd	%f50, %f0, %f30
	setx	0x20336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 1982: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb3a5c920  ! 1984: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbba84820  ! 1986: FMOVE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda90820  ! 1993: FMOVLEU	fmovs	%fcc1, %f0, %f30
	setx	0x326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 2000: FMOVs	fmovs	%f0, %f31
	.word 0xb1aac820  ! 2002: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a88820  ! 2003: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a448e0  ! 2005: FSUBq	dis not found

	.word 0xb9a549e0  ! 2007: FDIVq	dis not found

	setx	0x37, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983fd1  ! 2015: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd1, %hpstate
	.word 0xb7a90820  ! 2016: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbbab0820  ! 2020: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	data_start_5, %g1, %r21
	.word 0xbba8c820  ! 2024: FMOVL	fmovs	%fcc1, %f0, %f29
	setx	0x3011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2034: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a5c940  ! 2036: FMULd	fmuld	%f54, %f0, %f24
	.word 0xbb518000  ! 2039: RDPR_PSTATE	<illegal instruction>
	.word 0xb9518000  ! 2040: RDPR_PSTATE	<illegal instruction>
	setx	0x2011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0952015  ! 2046: ORcc_I	orcc 	%r20, 0x0015, %r24
	.word 0xb1a50840  ! 2049: FADDd	faddd	%f20, %f0, %f24
	.word 0xba848000  ! 2050: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xbdab0820  ! 2051: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb6c40000  ! 2054: ADDCcc_R	addccc 	%r16, %r0, %r27
	.word 0xbda00520  ! 2056: FSQRTs	fsqrt	
	setx	0x30216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda448e0  ! 2061: FSUBq	dis not found

	.word 0xb72cc000  ! 2065: SLL_R	sll 	%r19, %r0, %r27
	.word 0x8794a019  ! 2068: WRPR_TT_I	wrpr	%r18, 0x0019, %tt
	.word 0xbda84820  ! 2069: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9500000  ! 2071: RDPR_TPC	<illegal instruction>
	.word 0xbda48940  ! 2072: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb1ab4820  ! 2075: FMOVCC	fmovs	%fcc1, %f0, %f24
	setx	0x3001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 2079: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a00020  ! 2085: FMOVs	fmovs	%f0, %f26
	setx	0x20220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 2087: FMOVE	fmovs	%fcc1, %f0, %f27
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9a0  ! 2090: FDIVs	fdivs	%f23, %f0, %f26
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a135  ! 2095: WRPR_PIL_I	wrpr	%r22, 0x0135, %pil
	.word 0xb3ab4820  ! 2099: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbfa88820  ! 2100: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00020  ! 2103: FMOVs	fmovs	%f0, %f25
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a50940  ! 2110: FMULd	fmuld	%f20, %f0, %f26
	.word 0xbba4c9e0  ! 2111: FDIVq	dis not found

	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 2115: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a88820  ! 2117: FMOVLE	fmovs	%fcc1, %f0, %f28
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c820  ! 2121: FADDs	fadds	%f23, %f0, %f28
	.word 0xb351c000  ! 2122: RDPR_TL	<illegal instruction>
	.word 0xb3a80820  ! 2123: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00020  ! 2124: FMOVs	fmovs	%f0, %f25
	.word 0x8d95a023  ! 2125: WRPR_PSTATE_I	wrpr	%r22, 0x0023, %pstate
	.word 0xb3a94820  ! 2129: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbb51c000  ! 2132: RDPR_TL	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0xb3a00560  ! 2135: FSQRTq	fsqrt	
	.word 0xbba58940  ! 2138: FMULd	fmuld	%f22, %f0, %f60
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a58960  ! 2141: FMULq	dis not found

	.word 0xb9a50860  ! 2142: FADDq	dis not found

	.word 0xbba5c860  ! 2148: FADDq	dis not found

	.word 0xb3a58840  ! 2159: FADDd	faddd	%f22, %f0, %f56
	.word 0xbe2c61d3  ! 2161: ANDN_I	andn 	%r17, 0x01d3, %r31
	.word 0xb3504000  ! 2164: RDPR_TNPC	<illegal instruction>
	.word 0xbdaa0820  ! 2166: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0x8194e124  ! 2169: WRPR_TPC_I	wrpr	%r19, 0x0124, %tpc
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 2179: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbda509c0  ! 2181: FDIVd	fdivd	%f20, %f0, %f30
	.word 0xb3a5c8e0  ! 2182: FSUBq	dis not found

	setx	0x10223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 2187: FMOVE	fmovs	%fcc1, %f0, %f25
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8395e07e  ! 2193: WRPR_TNPC_I	wrpr	%r23, 0x007e, %tnpc
	.word 0xbba00540  ! 2199: FSQRTd	fsqrt	
	.word 0xbda5c960  ! 2202: FMULq	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 2204: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9ab0820  ! 2205: FMOVGU	fmovs	%fcc1, %f0, %f28
	setx	0x2022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 2208: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb4952002  ! 2211: ORcc_I	orcc 	%r20, 0x0002, %r26
	.word 0xb5a50840  ! 2214: FADDd	faddd	%f20, %f0, %f26
	.word 0xb5ab8820  ! 2217: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbba9c820  ! 2220: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbf540000  ! 2224: RDPR_GL	<illegal instruction>
	.word 0xb5a44960  ! 2226: FMULq	dis not found

	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba54860  ! 2231: FADDq	dis not found

	.word 0xb8c520ee  ! 2232: ADDCcc_I	addccc 	%r20, 0x00ee, %r28
	setx	0x10003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb5a00540  ! 2241: FSQRTd	fsqrt	
	.word 0xbda44960  ! 2243: FMULq	dis not found

	.word 0xb1a5c9c0  ! 2249: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb9500000  ! 2252: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198284b  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0xb6a460f2  ! 2256: SUBcc_I	subcc 	%r17, 0x00f2, %r27
	.word 0x81946140  ! 2257: WRPR_TPC_I	wrpr	%r17, 0x0140, %tpc
	.word 0xbba94820  ! 2263: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0x9194a1a6  ! 2265: WRPR_PIL_I	wrpr	%r18, 0x01a6, %pil
	.word 0xbfa88820  ! 2268: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a54960  ! 2271: FMULq	dis not found

	.word 0xb9a40920  ! 2275: FMULs	fmuls	%f16, %f0, %f28
	.word 0xbba449e0  ! 2277: FDIVq	dis not found

	.word 0xbba588c0  ! 2279: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb5a80420  ! 2281: FMOVRZ	dis not found

	.word 0xb3a00560  ! 2282: FSQRTq	fsqrt	
	.word 0xb9a00540  ! 2283: FSQRTd	fsqrt	
	.word 0xb9a4c9e0  ! 2286: FDIVq	dis not found

	.word 0xbb2dd000  ! 2287: SLLX_R	sllx	%r23, %r0, %r29
	.word 0x81956113  ! 2288: WRPR_TPC_I	wrpr	%r21, 0x0113, %tpc
	.word 0xb7aa8820  ! 2291: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a589c0  ! 2292: FDIVd	fdivd	%f22, %f0, %f26
	.word 0xb3a80820  ! 2294: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb4b40000  ! 2295: SUBCcc_R	orncc 	%r16, %r0, %r26
	.word 0xbd51c000  ! 2296: RDPR_TL	<illegal instruction>
	.word 0xb4bcc000  ! 2297: XNORcc_R	xnorcc 	%r19, %r0, %r26
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9520a7  ! 2300: WRPR_PSTATE_I	wrpr	%r20, 0x00a7, %pstate
	.word 0xbba81420  ! 2302: FMOVRNZ	dis not found

	.word 0xb7a548a0  ! 2311: FSUBs	fsubs	%f21, %f0, %f27
	setx	data_start_2, %g1, %r21
	.word 0xb5a509c0  ! 2315: FDIVd	fdivd	%f20, %f0, %f26
	setx	0x10230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 2317: FMOVRNZ	dis not found

	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879561c2  ! 2322: WRPR_TT_I	wrpr	%r21, 0x01c2, %tt
	.word 0xb951c000  ! 2323: RDPR_TL	<illegal instruction>
	.word 0xb7a54860  ! 2324: FADDq	dis not found

	.word 0xb3a48920  ! 2325: FMULs	fmuls	%f18, %f0, %f25
	.word 0xb68ce06a  ! 2326: ANDcc_I	andcc 	%r19, 0x006a, %r27
	.word 0xbc250000  ! 2327: SUB_R	sub 	%r20, %r0, %r30
	.word 0xbe84c000  ! 2330: ADDcc_R	addcc 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b03  ! 2335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b03, %hpstate
	.word 0xbb508000  ! 2336: RDPR_TSTATE	<illegal instruction>
	.word 0xb61560f7  ! 2346: OR_I	or 	%r21, 0x00f7, %r27
	.word 0xbe8d20e7  ! 2350: ANDcc_I	andcc 	%r20, 0x00e7, %r31
	mov	0, %r12
	.word 0x8f932000  ! 2359: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba00040  ! 2360: FMOVd	fmovd	%f0, %f60
	.word 0x839421dd  ! 2364: WRPR_TNPC_I	wrpr	%r16, 0x01dd, %tnpc
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 2370: RDPR_TICK	<illegal instruction>
	.word 0xb0244000  ! 2372: SUB_R	sub 	%r17, %r0, %r24
	.word 0xbe34e06c  ! 2374: SUBC_I	orn 	%r19, 0x006c, %r31
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 2377: FMOVCS	fmovs	%fcc1, %f0, %f24
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a449e0  ! 2384: FDIVq	dis not found

	.word 0xb3a8c820  ! 2385: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x8d946171  ! 2388: WRPR_PSTATE_I	wrpr	%r17, 0x0171, %pstate
	.word 0xb1abc820  ! 2391: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa508e0  ! 2397: FSUBq	dis not found

	.word 0xb3a00540  ! 2403: FSQRTd	fsqrt	
	.word 0xb1a448a0  ! 2407: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbda549c0  ! 2408: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xbe9ca199  ! 2409: XORcc_I	xorcc 	%r18, 0x0199, %r31
	.word 0xb9a00520  ! 2410: FSQRTs	fsqrt	
	.word 0xb40da0a3  ! 2411: AND_I	and 	%r22, 0x00a3, %r26
	.word 0xb9a94820  ! 2414: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5abc820  ! 2415: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbc9ca139  ! 2420: XORcc_I	xorcc 	%r18, 0x0139, %r30
	.word 0xb1a80c20  ! 2421: FMOVRLZ	dis not found

	.word 0xbbabc820  ! 2424: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb2a48000  ! 2425: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0x8594615d  ! 2426: WRPR_TSTATE_I	wrpr	%r17, 0x015d, %tstate
	.word 0xbb510000  ! 2427: RDPR_TICK	<illegal instruction>
	.word 0xb9a44940  ! 2428: FMULd	fmuld	%f48, %f0, %f28
	.word 0xbba81c20  ! 2430: FMOVRGEZ	dis not found

	.word 0xbba00520  ! 2432: FSQRTs	fsqrt	
	.word 0xb89dc000  ! 2433: XORcc_R	xorcc 	%r23, %r0, %r28
	.word 0xb3a80820  ! 2435: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982f59  ! 2436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f59, %hpstate
	setx	data_start_0, %g1, %r22
	.word 0xbda00040  ! 2445: FMOVd	fmovd	%f0, %f30
	.word 0xb1a81c20  ! 2449: FMOVRGEZ	dis not found

	setx	data_start_5, %g1, %r22
	.word 0xbfa5c840  ! 2451: FADDd	faddd	%f54, %f0, %f62
	.word 0xb7a8c820  ! 2453: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbeaca1d2  ! 2455: ANDNcc_I	andncc 	%r18, 0x01d2, %r31
	.word 0x9194a1f7  ! 2456: WRPR_PIL_I	wrpr	%r18, 0x01f7, %pil
	.word 0xb1480000  ! 2460: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7a508c0  ! 2463: FSUBd	fsubd	%f20, %f0, %f58
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 2474: FMOVRNZ	dis not found

	.word 0xb9a80820  ! 2475: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb4c4201c  ! 2476: ADDCcc_I	addccc 	%r16, 0x001c, %r26
	.word 0xb2b4c000  ! 2479: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xb3a4c860  ! 2481: FADDq	dis not found

	.word 0xb3a588e0  ! 2484: FSUBq	dis not found

	.word 0xb7500000  ! 2485: RDPR_TPC	<illegal instruction>
	.word 0x879560bf  ! 2487: WRPR_TT_I	wrpr	%r21, 0x00bf, %tt
	.word 0xb951c000  ! 2488: RDPR_TL	<illegal instruction>
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 2491: RDPR_TPC	<illegal instruction>
	.word 0xbfa81420  ! 2492: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982919  ! 2493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0919, %hpstate
	.word 0xb1a00540  ! 2498: FSQRTd	fsqrt	
	mov	2, %r14
	.word 0xa193a000  ! 2499: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba00520  ! 2500: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982d43  ! 2501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d43, %hpstate
	.word 0xb9aa0820  ! 2502: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb7a44840  ! 2506: FADDd	faddd	%f48, %f0, %f58
	.word 0xb1a44960  ! 2507: FMULq	dis not found

	.word 0xb3a88820  ! 2512: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0x879560bd  ! 2515: WRPR_TT_I	wrpr	%r21, 0x00bd, %tt
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94204c  ! 2519: WRPR_PSTATE_I	wrpr	%r16, 0x004c, %pstate
	.word 0xbba4c9e0  ! 2521: FDIVq	dis not found

	.word 0xbfa509a0  ! 2522: FDIVs	fdivs	%f20, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81983d13  ! 2525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d13, %hpstate
	.word 0xbea50000  ! 2530: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0xb7a8c820  ! 2532: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0x8795a039  ! 2533: WRPR_TT_I	wrpr	%r22, 0x0039, %tt
	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 2536: RDPR_TL	<illegal instruction>
	.word 0x8594a18a  ! 2538: WRPR_TSTATE_I	wrpr	%r18, 0x018a, %tstate
	.word 0xbf480000  ! 2541: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1a50820  ! 2544: FADDs	fadds	%f20, %f0, %f24
	.word 0xbda80c20  ! 2546: FMOVRLZ	dis not found

	.word 0x8595a1d5  ! 2547: WRPR_TSTATE_I	wrpr	%r22, 0x01d5, %tstate
	.word 0xb1aac820  ! 2552: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a40820  ! 2555: FADDs	fadds	%f16, %f0, %f28
	.word 0xb5a40940  ! 2561: FMULd	fmuld	%f16, %f0, %f26
	.word 0xb5aa0820  ! 2563: FMOVA	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983d1b  ! 2567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d1b, %hpstate
	.word 0x8794616e  ! 2569: WRPR_TT_I	wrpr	%r17, 0x016e, %tt
	.word 0xb4058000  ! 2574: ADD_R	add 	%r22, %r0, %r26
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 2583: RDPR_GL	<illegal instruction>
	.word 0xb73c1000  ! 2584: SRAX_R	srax	%r16, %r0, %r27
	.word 0xbd520000  ! 2585: RDPR_PIL	<illegal instruction>
	.word 0xbd643801  ! 2588: MOVcc_I	<illegal instruction>
	setx	0x20105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919460e0  ! 2594: WRPR_PIL_I	wrpr	%r17, 0x00e0, %pil
	.word 0xb550c000  ! 2596: RDPR_TT	<illegal instruction>
	.word 0xb3a549c0  ! 2599: FDIVd	fdivd	%f52, %f0, %f56
	mov	1, %r14
	.word 0xa193a000  ! 2600: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa5c920  ! 2601: FMULs	fmuls	%f23, %f0, %f31
	.word 0xbda4c9a0  ! 2603: FDIVs	fdivs	%f19, %f0, %f30
	setx	data_start_6, %g1, %r21
	.word 0xbf504000  ! 2605: RDPR_TNPC	<illegal instruction>
	.word 0xb4352065  ! 2606: SUBC_I	orn 	%r20, 0x0065, %r26
	.word 0xb814a017  ! 2608: OR_I	or 	%r18, 0x0017, %r28
	.word 0xbda40960  ! 2612: FMULq	dis not found

	.word 0xb3508000  ! 2613: RDPR_TSTATE	<illegal instruction>
	.word 0xb3aa4820  ! 2617: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983b43  ! 2626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b43, %hpstate
	.word 0x859461fc  ! 2628: WRPR_TSTATE_I	wrpr	%r17, 0x01fc, %tstate
	.word 0xbd518000  ! 2630: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a00040  ! 2633: FMOVd	fmovd	%f0, %f24
	.word 0xb9a00520  ! 2635: FSQRTs	fsqrt	
	.word 0xb9540000  ! 2637: RDPR_GL	<illegal instruction>
	.word 0xb1a549a0  ! 2640: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xb3a40840  ! 2641: FADDd	faddd	%f16, %f0, %f56
	.word 0xb3a50820  ! 2642: FADDs	fadds	%f20, %f0, %f25
	.word 0xb9ab4820  ! 2643: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00520  ! 2646: FSQRTs	fsqrt	
	.word 0xb1a58940  ! 2648: FMULd	fmuld	%f22, %f0, %f24
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 2651: RDPR_TT	<illegal instruction>
	.word 0xbda5c940  ! 2654: FMULd	fmuld	%f54, %f0, %f30
	.word 0xb1a80c20  ! 2661: FMOVRLZ	dis not found

	.word 0xbba84820  ! 2662: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00540  ! 2664: FSQRTd	fsqrt	
	.word 0xbfa00540  ! 2665: FSQRTd	fsqrt	
	.word 0xbfa508a0  ! 2668: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xbba54960  ! 2669: FMULq	dis not found

	.word 0xb1a489a0  ! 2673: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xbda409c0  ! 2674: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xb5a00540  ! 2676: FSQRTd	fsqrt	
	.word 0xbb508000  ! 2680: RDPR_TSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r17
	.word 0xbfa44820  ! 2684: FADDs	fadds	%f17, %f0, %f31
	.word 0xbdaa8820  ! 2685: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 2687: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00540  ! 2691: FSQRTd	fsqrt	
	.word 0xb7aac820  ! 2692: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a58840  ! 2693: FADDd	faddd	%f22, %f0, %f26
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 2699: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbda508c0  ! 2702: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xbda81820  ! 2703: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb49c0000  ! 2706: XORcc_R	xorcc 	%r16, %r0, %r26
	.word 0xb5a9c820  ! 2708: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c9e0  ! 2712: FDIVq	dis not found

	.word 0xb750c000  ! 2713: RDPR_TT	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2716: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a00020  ! 2721: FMOVs	fmovs	%f0, %f27
	.word 0xbfa409e0  ! 2722: FDIVq	dis not found

	.word 0xb3a40840  ! 2724: FADDd	faddd	%f16, %f0, %f56
	.word 0xb3540000  ! 2725: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 2726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 2728: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbda00520  ! 2730: FSQRTs	fsqrt	
	.word 0x8994a10f  ! 2732: WRPR_TICK_I	wrpr	%r18, 0x010f, %tick
	.word 0xb7aa0820  ! 2733: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0x8594e075  ! 2734: WRPR_TSTATE_I	wrpr	%r19, 0x0075, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983dc9  ! 2736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc9, %hpstate
	.word 0xbfa80820  ! 2738: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbbab0820  ! 2741: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb8b44000  ! 2742: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xb9508000  ! 2743: RDPR_TSTATE	<illegal instruction>
	.word 0xb09c616b  ! 2745: XORcc_I	xorcc 	%r17, 0x016b, %r24
	.word 0xb3a9c820  ! 2747: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3508000  ! 2751: RDPR_TSTATE	<illegal instruction>
	.word 0xb2b4e1b6  ! 2754: SUBCcc_I	orncc 	%r19, 0x01b6, %r25
	.word 0x919561ad  ! 2756: WRPR_PIL_I	wrpr	%r21, 0x01ad, %pil
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 2762: FMOVCS	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x8198290b  ! 2763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090b, %hpstate
	.word 0x919521f5  ! 2767: WRPR_PIL_I	wrpr	%r20, 0x01f5, %pil
	.word 0x8595a1ab  ! 2773: WRPR_TSTATE_I	wrpr	%r22, 0x01ab, %tstate
	.word 0xb7504000  ! 2776: RDPR_TNPC	<illegal instruction>
	.word 0xb5a5c960  ! 2778: FMULq	dis not found

	.word 0xb9a448a0  ! 2780: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb3aa8820  ! 2783: FMOVG	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f932000  ! 2789: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbe8c608d  ! 2794: ANDcc_I	andcc 	%r17, 0x008d, %r31
	setx	data_start_5, %g1, %r20
	.word 0xb5ab8820  ! 2802: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 2803: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1a98820  ! 2805: FMOVNEG	fmovs	%fcc1, %f0, %f24
	setx	data_start_1, %g1, %r20
	.word 0xbdab4820  ! 2810: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0x8d94e196  ! 2813: WRPR_PSTATE_I	wrpr	%r19, 0x0196, %pstate
	.word 0x819420a3  ! 2816: WRPR_TPC_I	wrpr	%r16, 0x00a3, %tpc
	.word 0xbda98820  ! 2817: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbec5c000  ! 2818: ADDCcc_R	addccc 	%r23, %r0, %r31
	setx	data_start_3, %g1, %r16
	.word 0xb1a549e0  ! 2822: FDIVq	dis not found

	.word 0xbba5c9e0  ! 2823: FDIVq	dis not found

	.word 0xb7510000  ! 2828: RDPR_TICK	<illegal instruction>
	.word 0xb9500000  ! 2829: RDPR_TPC	<illegal instruction>
	.word 0xb1a80c20  ! 2832: FMOVRLZ	dis not found

	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 2838: FMOVd	fmovd	%f0, %f60
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda448a0  ! 2845: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbda88820  ! 2847: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81820  ! 2850: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbfa4c960  ! 2853: FMULq	dis not found

	.word 0xb151c000  ! 2856: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda4c9a0  ! 2859: FDIVs	fdivs	%f19, %f0, %f30
	setx	0x2001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c920  ! 2861: FMULs	fmuls	%f23, %f0, %f24
	.word 0xbda589e0  ! 2862: FDIVq	dis not found

	.word 0xb234e05d  ! 2865: ORN_I	orn 	%r19, 0x005d, %r25
	.word 0xbba00560  ! 2867: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982f93  ! 2868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f93, %hpstate
	.word 0xbabc8000  ! 2872: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0xb9a00540  ! 2875: FSQRTd	fsqrt	
	.word 0xb1641800  ! 2876: MOVcc_R	<illegal instruction>
	.word 0xbfa44860  ! 2879: FADDq	dis not found

	.word 0xb7a9c820  ! 2880: FMOVVS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8594a007  ! 2884: WRPR_TSTATE_I	wrpr	%r18, 0x0007, %tstate
	.word 0xbda488e0  ! 2887: FSUBq	dis not found

	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 2891: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbba588c0  ! 2892: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb5504000  ! 2895: RDPR_TNPC	<illegal instruction>
	.word 0xb3a88820  ! 2896: FMOVLE	fmovs	%fcc1, %f0, %f25
	mov	1, %r14
	.word 0xa193a000  ! 2899: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7518000  ! 2900: RDPR_PSTATE	<illegal instruction>
	.word 0xb5500000  ! 2901: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r20
	.word 0xb5508000  ! 2903: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a88820  ! 2905: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00560  ! 2907: FSQRTq	fsqrt	
	.word 0xb9a54960  ! 2908: FMULq	dis not found

	.word 0xb5aa0820  ! 2910: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb9a509a0  ! 2912: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xbc8cc000  ! 2913: ANDcc_R	andcc 	%r19, %r0, %r30
	.word 0x859521d9  ! 2918: WRPR_TSTATE_I	wrpr	%r20, 0x01d9, %tstate
	.word 0xb5508000  ! 2919: RDPR_TSTATE	<illegal instruction>
	.word 0xbcc52100  ! 2924: ADDCcc_I	addccc 	%r20, 0x0100, %r30
	.word 0xb1520000  ! 2926: RDPR_PIL	<illegal instruction>
	.word 0xbda80c20  ! 2929: FMOVRLZ	dis not found

	.word 0xb3a5c8a0  ! 2931: FSUBs	fsubs	%f23, %f0, %f25
	.word 0xb414e08a  ! 2932: OR_I	or 	%r19, 0x008a, %r26
	.word 0x8d95e170  ! 2936: WRPR_PSTATE_I	wrpr	%r23, 0x0170, %pstate
	.word 0x8594619a  ! 2937: WRPR_TSTATE_I	wrpr	%r17, 0x019a, %tstate
	.word 0xb3540000  ! 2940: RDPR_GL	<illegal instruction>
	setx	data_start_6, %g1, %r21
	.word 0xb1510000  ! 2946: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2947: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1520000  ! 2948: RDPR_PIL	<illegal instruction>
	.word 0xb8958000  ! 2949: ORcc_R	orcc 	%r22, %r0, %r28
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 2957: RDPR_TL	<illegal instruction>
	.word 0x8595e1ec  ! 2959: WRPR_TSTATE_I	wrpr	%r23, 0x01ec, %tstate
	.word 0x8994e086  ! 2964: WRPR_TICK_I	wrpr	%r19, 0x0086, %tick
	.word 0xb5a54820  ! 2965: FADDs	fadds	%f21, %f0, %f26
	.word 0xbba88820  ! 2966: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb5500000  ! 2969: RDPR_TPC	<illegal instruction>
	.word 0xb28c61f2  ! 2970: ANDcc_I	andcc 	%r17, 0x01f2, %r25
	.word 0xbfa81c20  ! 2973: FMOVRGEZ	dis not found

	.word 0xb6bc21e7  ! 2975: XNORcc_I	xnorcc 	%r16, 0x01e7, %r27
	.word 0x85942040  ! 2977: WRPR_TSTATE_I	wrpr	%r16, 0x0040, %tstate
	.word 0xb1a88820  ! 2979: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb3510000  ! 2984: RDPR_TICK	<illegal instruction>
	.word 0xbb50c000  ! 2986: RDPR_TT	<illegal instruction>
	.word 0xb7a48860  ! 2987: FADDq	dis not found

	.word 0xb13d9000  ! 2992: SRAX_R	srax	%r22, %r0, %r24
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 2994: RDPR_PSTATE	<illegal instruction>
	.word 0xb4bcc000  ! 2998: XNORcc_R	xnorcc 	%r19, %r0, %r26
	.word 0xbfa4c960  ! 3001: FMULq	dis not found

	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a1ba  ! 3006: WRPR_TICK_I	wrpr	%r18, 0x01ba, %tick
	.word 0xb1a548c0  ! 3011: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xbd518000  ! 3013: RDPR_PSTATE	<illegal instruction>
	.word 0xbd2ce001  ! 3016: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xb550c000  ! 3019: RDPR_TT	<illegal instruction>
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e039  ! 3021: WRPR_TPC_I	wrpr	%r19, 0x0039, %tpc
	.word 0xbfa90820  ! 3028: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81c20  ! 3029: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 3032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb29dc000  ! 3034: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xbec54000  ! 3035: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0xb3ab4820  ! 3038: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00020  ! 3040: FMOVs	fmovs	%f0, %f24
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a489a0  ! 3045: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb1a449a0  ! 3047: FDIVs	fdivs	%f17, %f0, %f24
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 3050: FMOVN	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 3054: RDPR_PSTATE	<illegal instruction>
	.word 0xbda80820  ! 3055: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa4c9a0  ! 3057: FDIVs	fdivs	%f19, %f0, %f31
	.word 0x8395e1ba  ! 3059: WRPR_TNPC_I	wrpr	%r23, 0x01ba, %tnpc
	.word 0xbb51c000  ! 3060: RDPR_TL	<illegal instruction>
	.word 0xb5a50860  ! 3068: FADDq	dis not found

	.word 0xb1a4c8e0  ! 3069: FSUBq	dis not found

	.word 0x85956037  ! 3070: WRPR_TSTATE_I	wrpr	%r21, 0x0037, %tstate
	.word 0xbfab0820  ! 3072: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5520000  ! 3073: RDPR_PIL	<illegal instruction>
	.word 0xb7a409a0  ! 3075: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb5520000  ! 3077: RDPR_PIL	<illegal instruction>
	.word 0xb5520000  ! 3081: RDPR_PIL	<illegal instruction>
	.word 0xb5a4c8a0  ! 3082: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xbbab4820  ! 3084: FMOVCC	fmovs	%fcc1, %f0, %f29
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 3089: RDPR_TNPC	<illegal instruction>
	.word 0xba94e109  ! 3096: ORcc_I	orcc 	%r19, 0x0109, %r29
	.word 0x87942056  ! 3097: WRPR_TT_I	wrpr	%r16, 0x0056, %tt
	.word 0xb5520000  ! 3099: RDPR_PIL	<illegal instruction>
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc95a16d  ! 3103: ORcc_I	orcc 	%r22, 0x016d, %r30
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983dc9  ! 3109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc9, %hpstate
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba409e0  ! 3111: FDIVq	dis not found

	.word 0xbe0da15a  ! 3113: AND_I	and 	%r22, 0x015a, %r31
	.word 0xbba48820  ! 3114: FADDs	fadds	%f18, %f0, %f29
	.word 0xb351c000  ! 3116: RDPR_TL	<illegal instruction>
	.word 0xb7a00520  ! 3117: FSQRTs	fsqrt	
	.word 0xbda44860  ! 3123: FADDq	dis not found

	setx	data_start_1, %g1, %r23
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 3126: RDPR_TPC	<illegal instruction>
	.word 0xb5ab8820  ! 3132: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81420  ! 3134: FMOVRNZ	dis not found

	.word 0x91952080  ! 3139: WRPR_PIL_I	wrpr	%r20, 0x0080, %pil
	.word 0xb7a589c0  ! 3140: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb5a00520  ! 3141: FSQRTs	fsqrt	
	.word 0xb3a54920  ! 3142: FMULs	fmuls	%f21, %f0, %f25
	setx	0x14, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9c0  ! 3150: FDIVd	fdivd	%f50, %f0, %f28
	.word 0x8594206e  ! 3152: WRPR_TSTATE_I	wrpr	%r16, 0x006e, %tstate
	.word 0xb5a40820  ! 3155: FADDs	fadds	%f16, %f0, %f26
	.word 0xbda00040  ! 3158: FMOVd	fmovd	%f0, %f30
	.word 0xb7520000  ! 3163: RDPR_PIL	<illegal instruction>
	.word 0xb9a58840  ! 3164: FADDd	faddd	%f22, %f0, %f28
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 3173: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a94820  ! 3175: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbda44960  ! 3178: FMULq	dis not found

	.word 0xb9a00040  ! 3179: FMOVd	fmovd	%f0, %f28
	.word 0xb3a00520  ! 3180: FSQRTs	fsqrt	
	.word 0xbba44840  ! 3182: FADDd	faddd	%f48, %f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81982a59  ! 3185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a59, %hpstate
	.word 0xb3a81c20  ! 3187: FMOVRGEZ	dis not found

	.word 0xb68d21ff  ! 3190: ANDcc_I	andcc 	%r20, 0x01ff, %r27
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 3195: FSQRTs	fsqrt	
	.word 0xb5a00540  ! 3197: FSQRTd	fsqrt	
	.word 0xbbaa8820  ! 3200: FMOVG	fmovs	%fcc1, %f0, %f29
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 3202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	.word 0xb5aa4820  ! 3209: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00520  ! 3211: FSQRTs	fsqrt	
	mov	2, %r14
	.word 0xa193a000  ! 3213: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf35a001  ! 3218: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0x8194a071  ! 3219: WRPR_TPC_I	wrpr	%r18, 0x0071, %tpc
	.word 0xb1a488e0  ! 3224: FSUBq	dis not found

	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a041  ! 3226: WRPR_TNPC_I	wrpr	%r22, 0x0041, %tnpc
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3228: FMOVN	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x8198398b  ! 3230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198b, %hpstate
	.word 0xbfa00040  ! 3231: FMOVd	fmovd	%f0, %f62
	.word 0xbfa40960  ! 3232: FMULq	dis not found

	.word 0xb80d8000  ! 3234: AND_R	and 	%r22, %r0, %r28
	.word 0xb7a81c20  ! 3238: FMOVRGEZ	dis not found

	.word 0xbba58940  ! 3240: FMULd	fmuld	%f22, %f0, %f60
	.word 0xb7a00020  ! 3241: FMOVs	fmovs	%f0, %f27
	.word 0xbda4c840  ! 3244: FADDd	faddd	%f50, %f0, %f30
	.word 0x8d95a030  ! 3245: WRPR_PSTATE_I	wrpr	%r22, 0x0030, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x8198390b  ! 3246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190b, %hpstate
	.word 0xbba80820  ! 3249: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb5aa0820  ! 3250: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbdab8820  ! 3254: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a81420  ! 3255: FMOVRNZ	dis not found

	.word 0xbda4c9a0  ! 3256: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xbba4c920  ! 3257: FMULs	fmuls	%f19, %f0, %f29
	.word 0xba858000  ! 3259: ADDcc_R	addcc 	%r22, %r0, %r29
	.word 0xb3aa0820  ! 3261: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb1540000  ! 3263: RDPR_GL	<illegal instruction>
	.word 0xbfa00040  ! 3265: FMOVd	fmovd	%f0, %f62
	.word 0xb3a4c8e0  ! 3266: FSUBq	dis not found

	.word 0xbf7d4400  ! 3268: MOVR_R	movre	%r21, %r0, %r31
	.word 0xb9a00560  ! 3271: FSQRTq	fsqrt	
	.word 0xb151c000  ! 3273: RDPR_TL	<illegal instruction>
	.word 0xbd520000  ! 3274: RDPR_PIL	<illegal instruction>
	.word 0xb9a44920  ! 3275: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb1a00560  ! 3279: FSQRTq	fsqrt	
	.word 0xb2340000  ! 3281: ORN_R	orn 	%r16, %r0, %r25
	.word 0xb751c000  ! 3282: RDPR_TL	<illegal instruction>
	.word 0xb9a509c0  ! 3284: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xbfa00520  ! 3285: FSQRTs	fsqrt	
	.word 0xbfa4c9c0  ! 3286: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xb7a90820  ! 3287: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda00520  ! 3289: FSQRTs	fsqrt	
	setx	0x10300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbde0c9  ! 3291: XNORcc_I	xnorcc 	%r23, 0x00c9, %r30
	.word 0x8594e1c5  ! 3293: WRPR_TSTATE_I	wrpr	%r19, 0x01c5, %tstate
	.word 0xbd352001  ! 3294: SRL_I	srl 	%r20, 0x0001, %r30
	.word 0xba848000  ! 3295: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xb3a488e0  ! 3297: FSUBq	dis not found

	.word 0xb5a50840  ! 3298: FADDd	faddd	%f20, %f0, %f26
	.word 0xb9ab4820  ! 3299: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbeb4a0d2  ! 3300: ORNcc_I	orncc 	%r18, 0x00d2, %r31
	.word 0x8794a0b5  ! 3302: WRPR_TT_I	wrpr	%r18, 0x00b5, %tt
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 3306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0xb5a98820  ! 3308: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb4a56123  ! 3315: SUBcc_I	subcc 	%r21, 0x0123, %r26
	.word 0xb9a81820  ! 3316: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3643801  ! 3317: MOVcc_I	<illegal instruction>
	.word 0xb5a00040  ! 3322: FMOVd	fmovd	%f0, %f26
	.word 0xbda94820  ! 3323: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb2ad0000  ! 3324: ANDNcc_R	andncc 	%r20, %r0, %r25
	.word 0xb4b40000  ! 3326: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0x83956107  ! 3327: WRPR_TNPC_I	wrpr	%r21, 0x0107, %tnpc
	.word 0xb5a98820  ! 3330: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb3aac820  ! 3332: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb5504000  ! 3336: RDPR_TNPC	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0xb3504000  ! 3338: RDPR_TNPC	<illegal instruction>
	.word 0xb9a80820  ! 3340: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00560  ! 3341: FSQRTq	fsqrt	
	.word 0x8d9520ea  ! 3343: WRPR_PSTATE_I	wrpr	%r20, 0x00ea, %pstate
	.word 0xb3a94820  ! 3345: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb13c7001  ! 3346: SRAX_I	srax	%r17, 0x0001, %r24
	.word 0xb7a48920  ! 3347: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb72d4000  ! 3349: SLL_R	sll 	%r21, %r0, %r27
	.word 0xb7a80420  ! 3350: FMOVRZ	dis not found

	.word 0x8d95e07e  ! 3353: WRPR_PSTATE_I	wrpr	%r23, 0x007e, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0250000  ! 3357: SUB_R	sub 	%r20, %r0, %r24
	.word 0xb5510000  ! 3360: RDPR_TICK	<illegal instruction>
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 3366: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbf480000  ! 3367: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7a4c860  ! 3370: FADDq	dis not found

	setx	0x30037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a588c0  ! 3374: FSUBd	fsubd	%f22, %f0, %f28
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 3379: FMOVRZ	dis not found

	.word 0xb9aa8820  ! 3380: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbba00520  ! 3381: FSQRTs	fsqrt	
	.word 0xb5a88820  ! 3384: FMOVLE	fmovs	%fcc1, %f0, %f26
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 3392: FMOVRLZ	dis not found

	.word 0xb424c000  ! 3393: SUB_R	sub 	%r19, %r0, %r26
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 3398: FMOVd	fmovd	%f0, %f24
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9c0  ! 3401: FDIVd	fdivd	%f54, %f0, %f28
	setx	data_start_5, %g1, %r21
	.word 0xbda54820  ! 3403: FADDs	fadds	%f21, %f0, %f30
	.word 0x8595e001  ! 3404: WRPR_TSTATE_I	wrpr	%r23, 0x0001, %tstate
	.word 0xb7a4c860  ! 3415: FADDq	dis not found

	.word 0xb43de0d8  ! 3418: XNOR_I	xnor 	%r23, 0x00d8, %r26
	setx	0x221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba58860  ! 3423: FADDq	dis not found

	.word 0xbb500000  ! 3426: RDPR_TPC	<illegal instruction>
	.word 0xbfa81420  ! 3427: FMOVRNZ	dis not found

	.word 0x8d94a14f  ! 3429: WRPR_PSTATE_I	wrpr	%r18, 0x014f, %pstate
	.word 0xb5a508a0  ! 3431: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xb5a50940  ! 3432: FMULd	fmuld	%f20, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982f4b  ! 3433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4b, %hpstate
	.word 0x879520c6  ! 3435: WRPR_TT_I	wrpr	%r20, 0x00c6, %tt
	.word 0xb9a80820  ! 3437: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb351c000  ! 3439: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e89  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e89, %hpstate
	.word 0xb5a40960  ! 3441: FMULq	dis not found

	.word 0xbba548c0  ! 3443: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xbdaa8820  ! 3445: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbda4c920  ! 3448: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb9a44920  ! 3449: FMULs	fmuls	%f17, %f0, %f28
	.word 0xbbaa8820  ! 3454: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb48de078  ! 3456: ANDcc_I	andcc 	%r23, 0x0078, %r26
	.word 0xb3a48840  ! 3465: FADDd	faddd	%f18, %f0, %f56
	.word 0xb6350000  ! 3466: ORN_R	orn 	%r20, %r0, %r27
	.word 0xb1a88820  ! 3467: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a509c0  ! 3471: FDIVd	fdivd	%f20, %f0, %f28
	.word 0x83952178  ! 3472: WRPR_TNPC_I	wrpr	%r20, 0x0178, %tnpc
	.word 0xbdabc820  ! 3473: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb9aa4820  ! 3474: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbda5c940  ! 3477: FMULd	fmuld	%f54, %f0, %f30
	.word 0xb1a589e0  ! 3479: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 3484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d1b  ! 3486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1b, %hpstate
	.word 0xb604c000  ! 3487: ADD_R	add 	%r19, %r0, %r27
	.word 0x819421f4  ! 3488: WRPR_TPC_I	wrpr	%r16, 0x01f4, %tpc
	.word 0x8595e0b6  ! 3490: WRPR_TSTATE_I	wrpr	%r23, 0x00b6, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb550c000  ! 3494: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 3496: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983cd1  ! 3499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd1, %hpstate
	mov	1, %r14
	.word 0xa193a000  ! 3501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb504000  ! 3504: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 3506: RDPR_TPC	<illegal instruction>
	.word 0xb1a40820  ! 3509: FADDs	fadds	%f16, %f0, %f24
	.word 0xbba81820  ! 3511: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9aa4820  ! 3512: FMOVNE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983e9b  ! 3514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e9b, %hpstate
	.word 0xb12d4000  ! 3521: SLL_R	sll 	%r21, %r0, %r24
	setx	0x2021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a54860  ! 3525: FADDq	dis not found

	.word 0xb8b561d6  ! 3526: SUBCcc_I	orncc 	%r21, 0x01d6, %r28
	.word 0xb9a48820  ! 3527: FADDs	fadds	%f18, %f0, %f28
	mov	0, %r14
	.word 0xa193a000  ! 3528: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba98820  ! 3532: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb1510000  ! 3534: RDPR_TICK	<illegal instruction>
	.word 0xb4848000  ! 3535: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0xb1ab0820  ! 3537: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0x8d95205e  ! 3543: WRPR_PSTATE_I	wrpr	%r20, 0x005e, %pstate
	.word 0xbba81820  ! 3546: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x879561bd  ! 3548: WRPR_TT_I	wrpr	%r21, 0x01bd, %tt
	.word 0xb1a88820  ! 3553: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00560  ! 3555: FSQRTq	fsqrt	
	.word 0xb1a509c0  ! 3556: FDIVd	fdivd	%f20, %f0, %f24
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 3559: FSQRTd	fsqrt	
	.word 0xbfa81c20  ! 3560: FMOVRGEZ	dis not found

	.word 0xb5a00020  ! 3562: FMOVs	fmovs	%f0, %f26
	.word 0xbda00560  ! 3563: FSQRTq	fsqrt	
	.word 0xbfaa8820  ! 3566: FMOVG	fmovs	%fcc1, %f0, %f31
	mov	2, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a00040  ! 3569: FMOVd	fmovd	%f0, %f26
	.word 0xb3a50860  ! 3572: FADDq	dis not found

	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 3578: RDPR_TPC	<illegal instruction>
	setx	data_start_1, %g1, %r17
	.word 0x8995a080  ! 3581: WRPR_TICK_I	wrpr	%r22, 0x0080, %tick
	.word 0xb49dc000  ! 3582: XORcc_R	xorcc 	%r23, %r0, %r26
	.word 0xbda489c0  ! 3583: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb3358000  ! 3586: SRL_R	srl 	%r22, %r0, %r25
	setx	data_start_1, %g1, %r16
	.word 0xb68d4000  ! 3594: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xb1a448a0  ! 3597: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xb73d0000  ! 3599: SRA_R	sra 	%r20, %r0, %r27
	.word 0xb1a00540  ! 3600: FSQRTd	fsqrt	
	.word 0xb1a8c820  ! 3602: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00020  ! 3603: FMOVs	fmovs	%f0, %f27
	.word 0xb7a4c9a0  ! 3606: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb4b44000  ! 3607: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xb83d8000  ! 3611: XNOR_R	xnor 	%r22, %r0, %r28
	.word 0xbd520000  ! 3613: RDPR_PIL	<illegal instruction>
	.word 0x83956161  ! 3614: WRPR_TNPC_I	wrpr	%r21, 0x0161, %tnpc
	.word 0xb751c000  ! 3615: RDPR_TL	<illegal instruction>
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb08d614e  ! 3618: ANDcc_I	andcc 	%r21, 0x014e, %r24
	.word 0xbfa90820  ! 3619: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	0x2011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	.word 0xbfa588a0  ! 3629: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb2450000  ! 3631: ADDC_R	addc 	%r20, %r0, %r25
	.word 0xbfa44840  ! 3641: FADDd	faddd	%f48, %f0, %f62
	.word 0xbba5c860  ! 3642: FADDq	dis not found

	.word 0xb1a54820  ! 3643: FADDs	fadds	%f21, %f0, %f24
	.word 0xbf50c000  ! 3645: RDPR_TT	<illegal instruction>
	.word 0xb834c000  ! 3648: SUBC_R	orn 	%r19, %r0, %r28
	setx	0x30332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a589c0  ! 3651: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xb5510000  ! 3653: RDPR_TICK	<illegal instruction>
	.word 0x87956114  ! 3657: WRPR_TT_I	wrpr	%r21, 0x0114, %tt
	.word 0xbfa449c0  ! 3658: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xbda00520  ! 3660: FSQRTs	fsqrt	
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 3671: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c83  ! 3681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c83, %hpstate
	.word 0xbda548a0  ! 3682: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb6b58000  ! 3683: ORNcc_R	orncc 	%r22, %r0, %r27
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	.word 0xb9520000  ! 3693: RDPR_PIL	<illegal instruction>
	.word 0xb3540000  ! 3697: RDPR_GL	<illegal instruction>
	.word 0xb5a508c0  ! 3699: FSUBd	fsubd	%f20, %f0, %f26
	setx	data_start_1, %g1, %r21
	.word 0xb3540000  ! 3701: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a98820  ! 3705: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a44960  ! 3707: FMULq	dis not found

	.word 0xb1a4c9c0  ! 3709: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xbba50840  ! 3710: FADDd	faddd	%f20, %f0, %f60
	.word 0xb1a40920  ! 3711: FMULs	fmuls	%f16, %f0, %f24
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 3717: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb92c2001  ! 3726: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xb2b40000  ! 3728: SUBCcc_R	orncc 	%r16, %r0, %r25
	mov	2, %r14
	.word 0xa193a000  ! 3730: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a81420  ! 3733: FMOVRNZ	dis not found

	.word 0xb9a4c960  ! 3734: FMULq	dis not found

	setx	0x3010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a508c0  ! 3739: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb1480000  ! 3740: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda488e0  ! 3745: FSUBq	dis not found

	.word 0xb42de14e  ! 3747: ANDN_I	andn 	%r23, 0x014e, %r26
	.word 0xbba508a0  ! 3754: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbfa44920  ! 3755: FMULs	fmuls	%f17, %f0, %f31
	.word 0xbb540000  ! 3757: RDPR_GL	<illegal instruction>
	.word 0xbda81820  ! 3759: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbfa80820  ! 3763: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a94820  ! 3766: FMOVCS	fmovs	%fcc1, %f0, %f27
	mov	2, %r14
	.word 0xa193a000  ! 3768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc0cc000  ! 3771: AND_R	and 	%r19, %r0, %r30
	.word 0xbda00040  ! 3774: FMOVd	fmovd	%f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb53d4000  ! 3781: SRA_R	sra 	%r21, %r0, %r26
	.word 0xb3a00020  ! 3786: FMOVs	fmovs	%f0, %f25
	.word 0xb5508000  ! 3789: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a00520  ! 3792: FSQRTs	fsqrt	
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 3797: FMOVRNZ	dis not found

	.word 0xb20521a2  ! 3799: ADD_I	add 	%r20, 0x01a2, %r25
	setx	0x3010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 3803: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982a03  ! 3807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a03, %hpstate
	.word 0xbfa80820  ! 3809: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb9a88820  ! 3812: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a48920  ! 3813: FMULs	fmuls	%f18, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982d99  ! 3814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d99, %hpstate
	.word 0xb9aa0820  ! 3819: FMOVA	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 3821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	.word 0xb1a508e0  ! 3824: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 3836: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1abc820  ! 3838: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa9c820  ! 3840: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0x89956058  ! 3841: WRPR_TICK_I	wrpr	%r21, 0x0058, %tick
	.word 0xb9a509c0  ! 3842: FDIVd	fdivd	%f20, %f0, %f28
	.word 0x8395a018  ! 3843: WRPR_TNPC_I	wrpr	%r22, 0x0018, %tnpc
	.word 0xb5a40820  ! 3851: FADDs	fadds	%f16, %f0, %f26
	.word 0xb3a54820  ! 3852: FADDs	fadds	%f21, %f0, %f25
	setx	data_start_1, %g1, %r21
	.word 0xb1a80420  ! 3857: FMOVRZ	dis not found

	.word 0xb1508000  ! 3858: RDPR_TSTATE	<illegal instruction>
	.word 0xbfab0820  ! 3859: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a8c820  ! 3862: FMOVL	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982b13  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	.word 0xbdab8820  ! 3873: FMOVPOS	fmovs	%fcc1, %f0, %f30
	mov	2, %r12
	.word 0x8f932000  ! 3897: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a44860  ! 3903: FADDq	dis not found

	.word 0xb1a48840  ! 3904: FADDd	faddd	%f18, %f0, %f24
	.word 0xb9aa4820  ! 3907: FMOVNE	fmovs	%fcc1, %f0, %f28
	setx	0x2011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 3920: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbda4c860  ! 3922: FADDq	dis not found

	.word 0xb1a408a0  ! 3923: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xb5508000  ! 3924: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3926: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda00560  ! 3927: FSQRTq	fsqrt	
	.word 0xb0ac20ae  ! 3928: ANDNcc_I	andncc 	%r16, 0x00ae, %r24
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 3933: FMOVNEG	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 3936: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xbfa8c820  ! 3939: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbda5c8a0  ! 3940: FSUBs	fsubs	%f23, %f0, %f30
	mov	2, %r12
	.word 0x8f932000  ! 3941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3508000  ! 3942: RDPR_TSTATE	<illegal instruction>
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 3951: RDPR_PIL	<illegal instruction>
	.word 0xbdab0820  ! 3955: FMOVGU	fmovs	%fcc1, %f0, %f30
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 3964: RDPR_TT	<illegal instruction>
	.word 0xbda5c960  ! 3967: FMULq	dis not found

	.word 0xbda81c20  ! 3968: FMOVRGEZ	dis not found

	setx	0x1010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 3972: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbcb4a196  ! 3973: SUBCcc_I	orncc 	%r18, 0x0196, %r30
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa448a0  ! 3978: FSUBs	fsubs	%f17, %f0, %f31
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	.word 0xb5a80c20  ! 3982: FMOVRLZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 3983: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r20
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba44860  ! 3997: FADDq	dis not found

	.word 0x89952179  ! 3999: WRPR_TICK_I	wrpr	%r20, 0x0179, %tick
	.word 0xb735e001  ! 4002: SRL_I	srl 	%r23, 0x0001, %r27
	.word 0xb1a449e0  ! 4003: FDIVq	dis not found

	.word 0xb1a80c20  ! 4008: FMOVRLZ	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 4010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r12
	.word 0x8f932000  ! 4011: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba548e0  ! 4013: FSUBq	dis not found

	.word 0x879461f5  ! 4017: WRPR_TT_I	wrpr	%r17, 0x01f5, %tt
	.word 0xb7a40840  ! 4020: FADDd	faddd	%f16, %f0, %f58
	.word 0xbfa58940  ! 4022: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb9a80420  ! 4023: FMOVRZ	dis not found

	.word 0xbfa448e0  ! 4026: FSUBq	dis not found

	.word 0xb1a94820  ! 4029: FMOVCS	fmovs	%fcc1, %f0, %f24
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a58860  ! 4031: FADDq	dis not found

	.word 0xb150c000  ! 4033: RDPR_TT	<illegal instruction>
	.word 0xbb2c9000  ! 4038: SLLX_R	sllx	%r18, %r0, %r29
	.word 0x8994e12b  ! 4041: WRPR_TICK_I	wrpr	%r19, 0x012b, %tick
	.word 0xbd51c000  ! 4050: RDPR_TL	<illegal instruction>
	.word 0xb9a449e0  ! 4051: FDIVq	dis not found

	setx	0x302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc0de10f  ! 4053: AND_I	and 	%r23, 0x010f, %r30
	.word 0xbba80420  ! 4054: FMOVRZ	dis not found

	.word 0xb5a81420  ! 4055: FMOVRNZ	dis not found

	.word 0xb1a58920  ! 4059: FMULs	fmuls	%f22, %f0, %f24
	.word 0xbda409e0  ! 4060: FDIVq	dis not found

	setx	0x2a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a58920  ! 4068: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb7a44940  ! 4070: FMULd	fmuld	%f48, %f0, %f58
	.word 0xbba548e0  ! 4071: FSUBq	dis not found

	.word 0xb9a00020  ! 4073: FMOVs	fmovs	%f0, %f28
	.word 0xbea4c000  ! 4074: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xb1518000  ! 4078: RDPR_PSTATE	<illegal instruction>
	.word 0xb62c606d  ! 4079: ANDN_I	andn 	%r17, 0x006d, %r27
	.word 0xb3a5c940  ! 4084: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb3a4c8c0  ! 4090: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xb5a488e0  ! 4095: FSUBq	dis not found

	.word 0xb7a00020  ! 4098: FMOVs	fmovs	%f0, %f27
	.word 0xb32cf001  ! 4099: SLLX_I	sllx	%r19, 0x0001, %r25
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba489a0  ! 4104: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xb1a80820  ! 4105: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbdab0820  ! 4107: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a44960  ! 4108: FMULq	dis not found

	.word 0xbd508000  ! 4111: RDPR_TSTATE	<illegal instruction>
	.word 0xbaa460e4  ! 4112: SUBcc_I	subcc 	%r17, 0x00e4, %r29
	.word 0xb1a00560  ! 4115: FSQRTq	fsqrt	
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 4124: FMOVs	fmovs	%f0, %f24
	.word 0xba95a1ad  ! 4125: ORcc_I	orcc 	%r22, 0x01ad, %r29
	.word 0xb1a80420  ! 4127: FMOVRZ	dis not found

	.word 0xb1abc820  ! 4128: FMOVVC	fmovs	%fcc1, %f0, %f24
	setx	data_start_5, %g1, %r21
	.word 0xb3a449a0  ! 4131: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb3a00540  ! 4132: FSQRTd	fsqrt	
	.word 0xb3520000  ! 4135: RDPR_PIL	<illegal instruction>
	.word 0xb3a84820  ! 4138: FMOVE	fmovs	%fcc1, %f0, %f25
	setx	0x3011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 4140: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0x9195a058  ! 4141: WRPR_PIL_I	wrpr	%r22, 0x0058, %pil
	.word 0xb5a80420  ! 4142: FMOVRZ	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 4143: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbebc8000  ! 4146: XNORcc_R	xnorcc 	%r18, %r0, %r31
	.word 0xbbaa8820  ! 4153: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbba00560  ! 4155: FSQRTq	fsqrt	
	.word 0xbfa50940  ! 4158: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb5a4c920  ! 4162: FMULs	fmuls	%f19, %f0, %f26
	.word 0xbf500000  ! 4163: RDPR_TPC	<illegal instruction>
	setx	data_start_0, %g1, %r22
	.word 0xbd480000  ! 4167: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8395207f  ! 4169: WRPR_TNPC_I	wrpr	%r20, 0x007f, %tnpc
	.word 0xb535b001  ! 4174: SRLX_I	srlx	%r22, 0x0001, %r26
	.word 0xbf510000  ! 4176: RDPR_TICK	<illegal instruction>
	.word 0xb7a84820  ! 4178: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a40860  ! 4180: FADDq	dis not found

	.word 0xb37ca401  ! 4181: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xb5a408c0  ! 4182: FSUBd	fsubd	%f16, %f0, %f26
	.word 0x8194e0fd  ! 4183: WRPR_TPC_I	wrpr	%r19, 0x00fd, %tpc
	.word 0xb5a00540  ! 4185: FSQRTd	fsqrt	
	.word 0xbb3c0000  ! 4186: SRA_R	sra 	%r16, %r0, %r29
	.word 0xb9a94820  ! 4187: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0x8994e049  ! 4188: WRPR_TICK_I	wrpr	%r19, 0x0049, %tick
	setx	data_start_7, %g1, %r16
	.word 0xb5a00560  ! 4192: FSQRTq	fsqrt	
	.word 0xb20c8000  ! 4193: AND_R	and 	%r18, %r0, %r25
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a50860  ! 4197: FADDq	dis not found

	.word 0xb1a5c820  ! 4209: FADDs	fadds	%f23, %f0, %f24
	.word 0xb9a409c0  ! 4210: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb9a58960  ! 4214: FMULq	dis not found

	.word 0x8594e149  ! 4220: WRPR_TSTATE_I	wrpr	%r19, 0x0149, %tstate
	.word 0xb0842051  ! 4222: ADDcc_I	addcc 	%r16, 0x0051, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982fc9  ! 4223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc9, %hpstate
	.word 0xb3a44960  ! 4224: FMULq	dis not found

	.word 0xb3a94820  ! 4225: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0x8195e1f3  ! 4227: WRPR_TPC_I	wrpr	%r23, 0x01f3, %tpc
	.word 0xb1a48940  ! 4228: FMULd	fmuld	%f18, %f0, %f24
	.word 0xb7a80820  ! 4230: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb81d0000  ! 4233: XOR_R	xor 	%r20, %r0, %r28
	.word 0xb88de045  ! 4235: ANDcc_I	andcc 	%r23, 0x0045, %r28
	.word 0xb9500000  ! 4237: RDPR_TPC	<illegal instruction>
	.word 0x839461d7  ! 4238: WRPR_TNPC_I	wrpr	%r17, 0x01d7, %tnpc
	.word 0xb950c000  ! 4239: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 4243: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a81420  ! 4245: FMOVRNZ	dis not found

	.word 0xb4bd60dd  ! 4250: XNORcc_I	xnorcc 	%r21, 0x00dd, %r26
	.word 0xbfa4c920  ! 4252: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbda00520  ! 4254: FSQRTs	fsqrt	
	.word 0xb7a98820  ! 4255: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbba80c20  ! 4256: FMOVRLZ	dis not found

	.word 0xb2342114  ! 4257: SUBC_I	orn 	%r16, 0x0114, %r25
	.word 0x91946097  ! 4259: WRPR_PIL_I	wrpr	%r17, 0x0097, %pil
	.word 0xb824e070  ! 4263: SUB_I	sub 	%r19, 0x0070, %r28
	.word 0xb484c000  ! 4267: ADDcc_R	addcc 	%r19, %r0, %r26
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcac0000  ! 4270: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0x859420b1  ! 4272: WRPR_TSTATE_I	wrpr	%r16, 0x00b1, %tstate
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879460af  ! 4279: WRPR_TT_I	wrpr	%r17, 0x00af, %tt
	.word 0xbfa44940  ! 4280: FMULd	fmuld	%f48, %f0, %f62
	.word 0x8595e048  ! 4281: WRPR_TSTATE_I	wrpr	%r23, 0x0048, %tstate
	.word 0xbfa509c0  ! 4284: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xbfa81420  ! 4285: FMOVRNZ	dis not found

	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r23
	.word 0xbda00020  ! 4292: FMOVs	fmovs	%f0, %f30
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4304: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa50960  ! 4306: FMULq	dis not found

	.word 0xb3ab4820  ! 4310: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 4316: FSQRTs	fsqrt	
	.word 0x87946136  ! 4317: WRPR_TT_I	wrpr	%r17, 0x0136, %tt
	.word 0xb9a00540  ! 4322: FSQRTd	fsqrt	
	.word 0xbda88820  ! 4324: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbda5c8e0  ! 4325: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982a91  ! 4327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	.word 0xb950c000  ! 4329: RDPR_TT	<illegal instruction>
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 4336: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbdab8820  ! 4340: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0x8d95a149  ! 4342: WRPR_PSTATE_I	wrpr	%r22, 0x0149, %pstate
	.word 0xbdaa4820  ! 4344: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81820  ! 4349: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb9a44860  ! 4350: FADDq	dis not found

	.word 0xb7480000  ! 4351: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a509a0  ! 4358: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xb1a509e0  ! 4359: FDIVq	dis not found

	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a449c0  ! 4362: FDIVd	fdivd	%f48, %f0, %f28
	.word 0x9195a14c  ! 4363: WRPR_PIL_I	wrpr	%r22, 0x014c, %pil
	.word 0xb9a589c0  ! 4367: FDIVd	fdivd	%f22, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983993  ! 4369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1993, %hpstate
	.word 0x839420a3  ! 4371: WRPR_TNPC_I	wrpr	%r16, 0x00a3, %tnpc
	.word 0xb9a40860  ! 4372: FADDq	dis not found

	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 4376: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x9194211d  ! 4378: WRPR_PIL_I	wrpr	%r16, 0x011d, %pil
	.word 0xb9480000  ! 4381: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb950c000  ! 4382: RDPR_TT	<illegal instruction>
	.word 0xbba80420  ! 4383: FMOVRZ	dis not found

	.word 0xb9504000  ! 4386: RDPR_TNPC	<illegal instruction>
	.word 0xbbabc820  ! 4387: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbda9c820  ! 4388: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a5c960  ! 4393: FMULq	dis not found

	.word 0xb5a80c20  ! 4397: FMOVRLZ	dis not found

	.word 0xb151c000  ! 4398: RDPR_TL	<illegal instruction>
	.word 0xbda5c9c0  ! 4401: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb9a81420  ! 4407: FMOVRNZ	dis not found

	.word 0xb5504000  ! 4408: RDPR_TNPC	<illegal instruction>
	.word 0xbfa44920  ! 4409: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb29d4000  ! 4416: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xb5a80820  ! 4417: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80820  ! 4419: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb951c000  ! 4423: RDPR_TL	<illegal instruction>
	.word 0xb3ab8820  ! 4426: FMOVPOS	fmovs	%fcc1, %f0, %f25
	setx	data_start_2, %g1, %r19
	.word 0xbfa84820  ! 4434: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda98820  ! 4436: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80c20  ! 4438: FMOVRLZ	dis not found

	.word 0xbfabc820  ! 4439: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7510000  ! 4440: RDPR_TICK	<illegal instruction>
	.word 0xb3a4c860  ! 4443: FADDq	dis not found

	setx	0x20220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 4445: FADDs	fadds	%f22, %f0, %f25
	.word 0xb9540000  ! 4447: RDPR_GL	<illegal instruction>
	.word 0xb20421e2  ! 4448: ADD_I	add 	%r16, 0x01e2, %r25
	.word 0xb9a00040  ! 4449: FMOVd	fmovd	%f0, %f28
	.word 0x8995e0fb  ! 4450: WRPR_TICK_I	wrpr	%r23, 0x00fb, %tick
	.word 0xb5abc820  ! 4453: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbcb48000  ! 4455: SUBCcc_R	orncc 	%r18, %r0, %r30
	.word 0xb9520000  ! 4456: RDPR_PIL	<illegal instruction>
	.word 0xbba5c8c0  ! 4459: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb3a00560  ! 4460: FSQRTq	fsqrt	
	.word 0xbda409e0  ! 4461: FDIVq	dis not found

	.word 0xbda448c0  ! 4462: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbfab8820  ! 4464: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0x89956082  ! 4466: WRPR_TICK_I	wrpr	%r21, 0x0082, %tick
	.word 0xb7a00560  ! 4467: FSQRTq	fsqrt	
	.word 0xb1a4c960  ! 4468: FMULq	dis not found

	.word 0xbfa00040  ! 4469: FMOVd	fmovd	%f0, %f62
	.word 0xb8050000  ! 4470: ADD_R	add 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d43  ! 4472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d43, %hpstate
	.word 0xbda94820  ! 4476: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a409e0  ! 4478: FDIVq	dis not found

	.word 0xb32cc000  ! 4479: SLL_R	sll 	%r19, %r0, %r25
	.word 0xb3abc820  ! 4485: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a488a0  ! 4487: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xb1a80820  ! 4489: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0x8d942014  ! 4491: WRPR_PSTATE_I	wrpr	%r16, 0x0014, %pstate
	.word 0xbcc4a1bf  ! 4492: ADDCcc_I	addccc 	%r18, 0x01bf, %r30
	.word 0xbda00540  ! 4493: FSQRTd	fsqrt	
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9a0  ! 4498: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xbbab8820  ! 4499: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb2bd8000  ! 4500: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xbba50820  ! 4501: FADDs	fadds	%f20, %f0, %f29
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983891  ! 4505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1891, %hpstate
	.word 0xbfaa8820  ! 4506: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982993  ! 4511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0993, %hpstate
	.word 0xbfa00560  ! 4513: FSQRTq	fsqrt	
	.word 0xb1ab4820  ! 4516: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a58820  ! 4518: FADDs	fadds	%f22, %f0, %f28
	.word 0xb0b52131  ! 4526: ORNcc_I	orncc 	%r20, 0x0131, %r24
	.word 0xb41460bd  ! 4530: OR_I	or 	%r17, 0x00bd, %r26
	.word 0xbe2d4000  ! 4534: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xb5a98820  ! 4535: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb7a54940  ! 4539: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb5520000  ! 4540: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r20
	.word 0xb7a80c20  ! 4542: FMOVRLZ	dis not found

	.word 0x8395610e  ! 4546: WRPR_TNPC_I	wrpr	%r21, 0x010e, %tnpc
	.word 0xb6adc000  ! 4549: ANDNcc_R	andncc 	%r23, %r0, %r27
	.word 0xbb500000  ! 4550: RDPR_TPC	<illegal instruction>
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 4557: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	data_start_1, %g1, %r22
	.word 0x9195605d  ! 4559: WRPR_PIL_I	wrpr	%r21, 0x005d, %pil
	.word 0xb3a5c9c0  ! 4561: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xbfa5c940  ! 4571: FMULd	fmuld	%f54, %f0, %f62
	.word 0xbf520000  ! 4572: RDPR_PIL	<illegal instruction>
	.word 0xb5a4c960  ! 4574: FMULq	dis not found

	.word 0xbab58000  ! 4575: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xb5a4c9e0  ! 4576: FDIVq	dis not found

	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 4580: FMOVs	fmovs	%f0, %f28
	.word 0xbf2df001  ! 4582: SLLX_I	sllx	%r23, 0x0001, %r31
	.word 0xb5a4c8c0  ! 4583: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xbda509e0  ! 4587: FDIVq	dis not found

	.word 0xb1500000  ! 4589: RDPR_TPC	<illegal instruction>
	.word 0xbb510000  ! 4600: RDPR_TICK	<illegal instruction>
	.word 0xbd480000  ! 4606: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb97c4400  ! 4613: MOVR_R	movre	%r17, %r0, %r28
	.word 0xbfa81420  ! 4615: FMOVRNZ	dis not found

	.word 0x8395e083  ! 4618: WRPR_TNPC_I	wrpr	%r23, 0x0083, %tnpc
	.word 0xb351c000  ! 4620: RDPR_TL	<illegal instruction>
	.word 0x9194a02c  ! 4623: WRPR_PIL_I	wrpr	%r18, 0x002c, %pil
	.word 0xb834a0cc  ! 4625: ORN_I	orn 	%r18, 0x00cc, %r28
	.word 0xb9540000  ! 4628: RDPR_GL	<illegal instruction>
	.word 0xb5a81c20  ! 4630: FMOVRGEZ	dis not found

	.word 0xb92d8000  ! 4631: SLL_R	sll 	%r22, %r0, %r28
	.word 0xb3a88820  ! 4633: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbda5c940  ! 4634: FMULd	fmuld	%f54, %f0, %f30
	.word 0xb1ab0820  ! 4637: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbd35a001  ! 4638: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xb3a80c20  ! 4647: FMOVRLZ	dis not found

	.word 0xbb504000  ! 4650: RDPR_TNPC	<illegal instruction>
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 4653: FSQRTd	fsqrt	
	.word 0xbda489e0  ! 4654: FDIVq	dis not found

	.word 0xbb643801  ! 4657: MOVcc_I	<illegal instruction>
	.word 0xbda00520  ! 4658: FSQRTs	fsqrt	
	setx	data_start_7, %g1, %r20
	.word 0xb9a409a0  ! 4661: FDIVs	fdivs	%f16, %f0, %f28
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4665: RDPR_TT	<illegal instruction>
	.word 0xb7a54860  ! 4666: FADDq	dis not found

	.word 0xb5a81820  ! 4669: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	setx	data_start_3, %g1, %r21
	mov	1, %r12
	.word 0x8f932000  ! 4674: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcad2119  ! 4675: ANDNcc_I	andncc 	%r20, 0x0119, %r30
	.word 0xbfa90820  ! 4684: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xba2c8000  ! 4685: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xbfa00560  ! 4687: FSQRTq	fsqrt	
	.word 0xbc94213c  ! 4691: ORcc_I	orcc 	%r16, 0x013c, %r30
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 4693: FMOVG	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbdab4820  ! 4695: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb550c000  ! 4697: RDPR_TT	<illegal instruction>
	.word 0xbba00540  ! 4699: FSQRTd	fsqrt	
	.word 0xbda00540  ! 4700: FSQRTd	fsqrt	
	.word 0xb9a90820  ! 4701: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a488e0  ! 4703: FSUBq	dis not found

	.word 0xba2c0000  ! 4707: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xbdaa4820  ! 4711: FMOVNE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 4713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xb7a50960  ! 4714: FMULq	dis not found

	.word 0xb1a449e0  ! 4716: FDIVq	dis not found

	.word 0xb5a448e0  ! 4720: FSUBq	dis not found

	.word 0xb7a58840  ! 4721: FADDd	faddd	%f22, %f0, %f58
	.word 0x819460db  ! 4726: WRPR_TPC_I	wrpr	%r17, 0x00db, %tpc
	.word 0xb9a5c9e0  ! 4734: FDIVq	dis not found

	.word 0xbba00560  ! 4739: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983c19  ! 4740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c19, %hpstate
	.word 0xb9a509e0  ! 4741: FDIVq	dis not found

	.word 0xbc25a08f  ! 4747: SUB_I	sub 	%r22, 0x008f, %r30
	.word 0xbba00560  ! 4749: FSQRTq	fsqrt	
	.word 0xb7a80c20  ! 4750: FMOVRLZ	dis not found

	mov	2, %r12
	.word 0x8f932000  ! 4758: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a4c940  ! 4759: FMULd	fmuld	%f50, %f0, %f24
	.word 0xb1a98820  ! 4762: FMOVNEG	fmovs	%fcc1, %f0, %f24
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 4765: RDPR_TICK	<illegal instruction>
	.word 0xbda54920  ! 4766: FMULs	fmuls	%f21, %f0, %f30
	.word 0xbda81420  ! 4768: FMOVRNZ	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 4769: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb508000  ! 4772: RDPR_TSTATE	<illegal instruction>
	.word 0xbba9c820  ! 4775: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a90820  ! 4776: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0x8394e03e  ! 4777: WRPR_TNPC_I	wrpr	%r19, 0x003e, %tnpc
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 4782: FMOVNE	fmovs	%fcc1, %f0, %f27
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 4801: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a488e0  ! 4806: FSUBq	dis not found

	.word 0xbfa9c820  ! 4807: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0x85942086  ! 4809: WRPR_TSTATE_I	wrpr	%r16, 0x0086, %tstate
	.word 0xb9a448c0  ! 4813: FSUBd	fsubd	%f48, %f0, %f28
	.word 0x8595e0b1  ! 4815: WRPR_TSTATE_I	wrpr	%r23, 0x00b1, %tstate
	.word 0xb7a44820  ! 4818: FADDs	fadds	%f17, %f0, %f27
	.word 0xb6b48000  ! 4820: SUBCcc_R	orncc 	%r18, %r0, %r27
	.word 0xb7aa0820  ! 4823: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb0adc000  ! 4827: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0x8594e0bc  ! 4829: WRPR_TSTATE_I	wrpr	%r19, 0x00bc, %tstate
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 4833: FMOVRGEZ	dis not found

	.word 0xbd643801  ! 4839: MOVcc_I	<illegal instruction>
	.word 0xbfa4c960  ! 4846: FMULq	dis not found

	.word 0xb7aa4820  ! 4848: FMOVNE	fmovs	%fcc1, %f0, %f27
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda5c8a0  ! 4854: FSUBs	fsubs	%f23, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982d11  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d11, %hpstate
	.word 0xb3a88820  ! 4865: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb0340000  ! 4866: ORN_R	orn 	%r16, %r0, %r24
	.word 0xbb3c1000  ! 4867: SRAX_R	srax	%r16, %r0, %r29
	.word 0xb1508000  ! 4868: RDPR_TSTATE	<illegal instruction>
	.word 0x8994a1b4  ! 4871: WRPR_TICK_I	wrpr	%r18, 0x01b4, %tick
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 4873: FMOVPOS	fmovs	%fcc1, %f0, %f27
	mov	1, %r14
	.word 0xa193a000  ! 4874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3abc820  ! 4881: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbb359000  ! 4883: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xb1a81820  ! 4885: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5a58860  ! 4886: FADDq	dis not found

	.word 0xb1aa8820  ! 4889: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7508000  ! 4890: RDPR_TSTATE	<illegal instruction>
	.word 0xbba44860  ! 4891: FADDq	dis not found

	.word 0x8595e0af  ! 4893: WRPR_TSTATE_I	wrpr	%r23, 0x00af, %tstate
	.word 0xbda80c20  ! 4894: FMOVRLZ	dis not found

	.word 0xb3a84820  ! 4895: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb951c000  ! 4898: RDPR_TL	<illegal instruction>
	.word 0xbbab8820  ! 4899: FMOVPOS	fmovs	%fcc1, %f0, %f29
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4902: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a549e0  ! 4904: FDIVq	dis not found

	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982993  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0993, %hpstate
	.word 0xb5a48840  ! 4916: FADDd	faddd	%f18, %f0, %f26
	.word 0xbfa8c820  ! 4917: FMOVL	fmovs	%fcc1, %f0, %f31
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 4921: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0x9194a0df  ! 4922: WRPR_PIL_I	wrpr	%r18, 0x00df, %pil
	.word 0xbda00020  ! 4928: FMOVs	fmovs	%f0, %f30
	setx	data_start_7, %g1, %r21
	.word 0xbda81820  ! 4937: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x9194e1a1  ! 4938: WRPR_PIL_I	wrpr	%r19, 0x01a1, %pil
	.word 0xb3abc820  ! 4940: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbfa509c0  ! 4943: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xb4b44000  ! 4945: SUBCcc_R	orncc 	%r17, %r0, %r26
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83952065  ! 4948: WRPR_TNPC_I	wrpr	%r20, 0x0065, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x20201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d94a040  ! 4954: WRPR_PSTATE_I	wrpr	%r18, 0x0040, %pstate
	.word 0xb5510000  ! 4955: RDPR_TICK	<illegal instruction>
	.word 0xb9a80c20  ! 4959: FMOVRLZ	dis not found

	.word 0x8395602e  ! 4963: WRPR_TNPC_I	wrpr	%r21, 0x002e, %tnpc
	.word 0xb9a5c9e0  ! 4964: FDIVq	dis not found

	.word 0x859520f5  ! 4967: WRPR_TSTATE_I	wrpr	%r20, 0x00f5, %tstate
	.word 0xbfabc820  ! 4969: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a81820  ! 4971: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb7a80820  ! 4972: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba84820  ! 4973: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbfaa8820  ! 4974: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb6bde0a9  ! 4976: XNORcc_I	xnorcc 	%r23, 0x00a9, %r27
	.word 0xbda449e0  ! 4977: FDIVq	dis not found

	.word 0xb1aa8820  ! 4978: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa8c820  ! 4979: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00560  ! 4981: FSQRTq	fsqrt	
	.word 0xbf347001  ! 4983: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xb64560b0  ! 4988: ADDC_I	addc 	%r21, 0x00b0, %r27
	.word 0xb5ab0820  ! 4991: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb4258000  ! 4993: SUB_R	sub 	%r22, %r0, %r26
	.word 0xb7a9c820  ! 4998: FMOVVS	fmovs	%fcc1, %f0, %f27

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	ta	T_GOOD_TRAP
	.data
fsr_data:

	.xword	0x0000000000000000
	.align 0x1000
	.data
data_start_0:

	.xword	0x7f62d97a20ae6bb3
	.xword	0xbd43105d2958a951
	.xword	0x34750bf10376e559
	.xword	0x85927d4737f96adb
	.xword	0x2fcbf864bbb35728
	.xword	0xeffc9293c9eefc52
	.xword	0xf88e6c7eb43f2c67
	.xword	0xd5b904ab8604f965
	.xword	0x38ad327e0164bc1f
	.xword	0x51204520d2c313a5
	.xword	0xdc3e104d17bb0693
	.xword	0x437d6ef308dce553
	.xword	0xc0072e1f0f7b4f1f
	.xword	0x3e8db15956503a61
	.xword	0x2a8f74f3eaf1499a
	.xword	0xfe15ad274575e81e
	.xword	0xda79b42792ec3103
	.xword	0xf2028304191754e1
	.xword	0x78e5bd7880a2cc22
	.xword	0x766297bca6079236
	.xword	0xe48980e96d29e1d9
	.xword	0x5ca34691a59bf7ab
	.xword	0x0b29f0e136df5254
	.xword	0xd62a9f8d2753a57e
	.xword	0x19ce1343da427625
	.xword	0x74ccf78a5c0d3a59
	.xword	0x45300d64f07cf741
	.xword	0xdb04e33fe549725a
	.xword	0x88e326bf571bbd76
	.xword	0x57401345f83e59a8
	.xword	0x8b66a78766682e6d
	.xword	0xcecdcb4200788abc
	.xword	0x1b22630ea02ffc37
	.xword	0x46f5de940e621e36
	.xword	0x65205893a7501b45
	.xword	0x0806ad7ae5db6f24
	.xword	0xdf62ad0c40017069
	.xword	0xbb95f7219161628f
	.xword	0x5e790671957a777a
	.xword	0x9e59267b5b9576a4
	.xword	0x720e3af0375acec1
	.xword	0x26c188a1f7424488
	.xword	0x74b73750a9a7cea6
	.xword	0xb001cb5c146db217
	.xword	0x1cb92e2bbc3d1856
	.xword	0xbb40bd1f24ff3e1a
	.xword	0x943fb2f4b24a86b5
	.xword	0x83110add1ed3c25d
	.xword	0x9d909437a5acceb8
	.xword	0x99f203243b551c1f
	.xword	0xb8aeceed3e4f33c2
	.xword	0xa12b07712bfb7e3f
	.xword	0x262bb480c8373d94
	.xword	0xb0a5e058524013e5
	.xword	0x278f730ee1531e5a
	.xword	0xc2d311fe08b26058
	.xword	0x84c78e485be9acfa
	.xword	0x101ba1792abba4f8
	.xword	0x3d3f9dc423d1a8c1
	.xword	0x122df8234fa53763
	.xword	0x3eca1d27e179a13a
	.xword	0x60eed6e68f82a35e
	.xword	0x0458c38b16817b52
	.xword	0xe046dcfd16691709
	.xword	0xa94eb716557d5078
	.xword	0xe926d461a3594e7e
	.xword	0xbb719f4e62fcc24a
	.xword	0xa94ebddd8f35a816
	.xword	0x214258e20356154d
	.xword	0x0db4022d82d8c75e
	.xword	0x54b51221b453e3d5
	.xword	0xbbb1224f7a8b5477
	.xword	0xe7b3edf410be1f5c
	.xword	0x715777da3180cb41
	.xword	0x8b4a6c1bf1a0d465
	.xword	0x3a8be9c07f871b22
	.xword	0xf3535179763aecc4
	.xword	0xb4cc9cbd81b37a1d
	.xword	0x5dd0a7593d318d65
	.xword	0x74a2541ade49fdc3
	.xword	0xf2891bc2491e2c59
	.xword	0x69d47b40a6e6e68d
	.xword	0xc52fe71e840f7c76
	.xword	0x72f1a1dbcffdd805
	.xword	0x9fa089a606346758
	.xword	0x2921c5feb92a833c
	.xword	0xaa7c05e39b5f9e25
	.xword	0x77f423b7de16bc37
	.xword	0xf17b131e4ab96291
	.xword	0x5fdc86e470d89b82
	.xword	0x4aff0c0760d9f74d
	.xword	0x89e8d5e7f47541a2
	.xword	0x9e91aa04ad071e1f
	.xword	0x58a2ccac515af25c
	.xword	0x568d5dca87527d5c
	.xword	0x2da82594e5f383e3
	.xword	0xca959a2998feae3a
	.xword	0x28dc2f6d1707973b
	.xword	0x16494a040ccf90ff
	.xword	0xa309c0524c714f7c
	.xword	0xd99f70dfae609c8f
	.xword	0xb5d5066f422ad486
	.xword	0x206cadf010629812
	.xword	0xdd97f7ba2dba1916
	.xword	0x8215fe0cf406120b
	.xword	0x4009c90b511be2e9
	.xword	0x86e8d92a29152b18
	.xword	0xe48ad7eb023996b5
	.xword	0x1f66e68310d7b28e
	.xword	0x13459ddc3002020f
	.xword	0x4a6214f8ac9b1af1
	.xword	0x6c1f47b6bdc3dff6
	.xword	0x038c49d647c78edf
	.xword	0x907bff7be71d430a
	.xword	0xb753b7f6e9777f6d
	.xword	0xb6dde376a1f90fcb
	.xword	0xc66f88dbd430a144
	.xword	0x92693d4449bde3b5
	.xword	0x10fe949befe7e57e
	.xword	0xba65185a202e12b9
	.xword	0x3bf6fa962bcf5228
	.xword	0xb4d478d4a33ce5ba
	.xword	0x5b390260352c79d4
	.xword	0x57285406c8a465b6
	.xword	0xccd670fae29f119c
	.xword	0x574a0e679fbf228a
	.xword	0xd0ebb82e75b8c41a
	.xword	0x5813b7cd1f11a9dd
	.xword	0x089003d29a52d417
	.xword	0x8270309e852f4e61
	.xword	0xbaa828324cb5fb8b
	.xword	0xc68e2441eadf9c73
	.xword	0x4bc4806de1507750
	.xword	0x53477277c8261bce
	.xword	0xd463abe67f572705
	.xword	0x2361c4ea06b729c4
	.xword	0x4740e2dbf55a0668
	.xword	0x28ad8aa8787afc3b
	.xword	0xa96ab50557737c41
	.xword	0x25ea82e904195898
	.xword	0x44794417a805b796
	.xword	0xdba9dd1abf402d71
	.xword	0x5d83bb9e621036f2
	.xword	0xfe56ddc6aa96536d
	.xword	0xe9568d540c720013
	.xword	0x0e0e216be2c08a07
	.xword	0x5f2bcb0cc728fe0b
	.xword	0x9890d2719c65e45f
	.xword	0x13f1b08fead9d7d4
	.xword	0x84b79ac99894da1f
	.xword	0xd1c50b9c14b103e7
	.xword	0x0e92ad27a6f45e99
	.xword	0x0b39ad63eca7be69
	.xword	0xfe0349e998bf289f
	.xword	0x35e6d532760d82dd
	.xword	0xf01ebd8964d16235
	.xword	0x74fec0a369a0c086
	.xword	0xad8dd8feea85559f
	.xword	0x9bc5784062490090
	.xword	0xad89a90bff8abf52
	.xword	0xaeb31cc533747984
	.xword	0xc36f1d4acbb6d330
	.xword	0xa78d6e6b631d5e8a
	.xword	0xe9cc5d835155ee55
	.xword	0x4263cf7719116d58
	.xword	0xe4f17dc7827c8ca9
	.xword	0x313d1de91f1d2297
	.xword	0x67d85f6dd65b91d1
	.xword	0x9bb669ba1f9ac738
	.xword	0x80aa9c3597b603fb
	.xword	0xf4a553399a532210
	.xword	0x12ee63b84d1654c9
	.xword	0x1fb43685d9ded23b
	.xword	0x72f45aeae0207b91
	.xword	0xd637af3f2d733cb7
	.xword	0x2162bd4dd70176e0
	.xword	0x469577e487cf3680
	.xword	0x9db428da2449bbd9
	.xword	0xef2b0a6a3e78eb47
	.xword	0x3561a73b18e63223
	.xword	0x44f027eb1bce22a7
	.xword	0x1a346d5fc0d4a4f0
	.xword	0x07632dd56dfa11e7
	.xword	0xf6e978c1e494117a
	.xword	0xe102a3337734967c
	.xword	0x484a167e1896b72e
	.xword	0xc640048db9c6bffb
	.xword	0x4f805bb7ab6220b4
	.xword	0x34ecdada4a71de3c
	.xword	0x4c956bef3959240f
	.xword	0xa711a262671157d0
	.xword	0xd4dddae2421cd233
	.xword	0x0ad835f03de5195b
	.xword	0xf296e3ef4a1afe46
	.xword	0xf490a193d1532877
	.xword	0x7452515dd9b637e6
	.xword	0x265cf34f3a77c06b
	.xword	0x9a295e971df5a63f
	.xword	0x85c29382e7edbc61
	.xword	0xe427a92ec12591b4
	.xword	0x0c9ff22565c47720
	.xword	0xce35594d9ebb2ab1
	.xword	0x2fcc17c970e6fec0
	.xword	0xe4b030d36bc4c229
	.xword	0xa2e8a9bfbdf4f9eb
	.xword	0xcd86f5bdf15cb4f4
	.xword	0x00c03645b3ae2813
	.xword	0x6968c77f0222d60d
	.xword	0xcd19580c21e3a2a4
	.xword	0xd307c1e6f711d55c
	.xword	0xa442b0ab34ea57a2
	.xword	0x9e7edfac8322cc60
	.xword	0xc3f0e51c7e4c1205
	.xword	0xd2909faadf8f4437
	.xword	0x5a5d006020132956
	.xword	0xb33d5c996a6ef549
	.xword	0x87599c6f8ddff68c
	.xword	0x0bce2025ebb19d30
	.xword	0x87e58b47c5b4ddae
	.xword	0x551c5525a8112f7a
	.xword	0xd1d76d041f769f3a
	.xword	0xd3225ef66a496ba0
	.xword	0x82b231987c0786fe
	.xword	0x411d87e1664e93e6
	.xword	0x6ae246495ac84545
	.xword	0x283f6b71914fee56
	.xword	0x7d50fb83d97559d8
	.xword	0x2823538ca18ef92e
	.xword	0x6cd6bfc71a4de215
	.xword	0x89a5395b9fc6fe45
	.xword	0x6b1995997e41f3a7
	.xword	0x13bb4e4f786bc8af
	.xword	0x42f09ac87b0a07a9
	.xword	0x48b0f93cd133a48f
	.xword	0x521d9c149c3416ef
	.xword	0xba52946dc6bc3892
	.xword	0x6ecf11cc202c7270
	.xword	0xdb0026e3bfcf4435
	.xword	0x908f3ae019d4e412
	.xword	0x652406ea9d7b2dbd
	.xword	0xe85641d2e099d48c
	.xword	0x4f422f6ccc81f763
	.xword	0x69a8d069e41c0ea1
	.xword	0x8934e1c648c55e62
	.xword	0x46d3ef03d55321f6
	.xword	0xb8d29de1a845452e
	.xword	0x93577af601b8caaa
	.xword	0x9d21f37f8c5dccac
	.xword	0xe1fcb93403f1996d
	.xword	0xe551fa88eeb8f407
	.xword	0xbefcea8136f035e0
	.xword	0x4dc8a0bed79a4850
	.xword	0x22aa003932f79eb1
	.xword	0x35e59c6a2db814ce
	.xword	0x9f1cfbfc5cd293b8
	.xword	0x0dd058a69841c518
	.align 0x2000
	.data
data_start_1:

	.xword	0xe25248385943025c
	.xword	0xe350c6d49b7601c7
	.xword	0x5b806baa2410f156
	.xword	0x0a16c0ba487f992d
	.xword	0x92db0d61fc8204aa
	.xword	0x252d57f957aa1496
	.xword	0x5b6115a84e778919
	.xword	0x85c23a0d37fd34dd
	.xword	0x18f3a7b9d7cd9d66
	.xword	0xde88204a25a25ef9
	.xword	0x516467459d43c506
	.xword	0xaf19381e1ab83bc1
	.xword	0xf36b570de5e831b5
	.xword	0xa3eb6ab6d49d6a2e
	.xword	0x99bc26414e968dd6
	.xword	0x57b88aff0211e9ee
	.xword	0x05635917aadb1a73
	.xword	0xb5a90dbea0cfee1e
	.xword	0x1e59045fd6a4a617
	.xword	0x78d13d9f4f09d481
	.xword	0xaffa726b0d509492
	.xword	0xa2d8e2f55955d07c
	.xword	0xb045132396825660
	.xword	0x8839aaa822ec31dd
	.xword	0xc0076a2e3cb1b2cb
	.xword	0xeea771964430701f
	.xword	0x1f5ebf3043c7bf74
	.xword	0x518b05333a002f9e
	.xword	0x3108feb8b6ee27ab
	.xword	0x6fc79c295f4623d2
	.xword	0xed7f07210fd5e78e
	.xword	0xe8de96268ae85e7d
	.xword	0x456385c440fc2c86
	.xword	0x1488d70702e6660f
	.xword	0xb7b663b2c4a3c2dc
	.xword	0xd723438077e4d3eb
	.xword	0xbbc17da91809b330
	.xword	0x1b8c638e322dd6b1
	.xword	0xefb57f0ce3b9c585
	.xword	0x657280e2ebedec55
	.xword	0x8dcecd805e163c77
	.xword	0xf7178d091602feb3
	.xword	0xae33010903e0084e
	.xword	0x551bbe01420f77ab
	.xword	0x224e032e21fa9237
	.xword	0xc7258539790a4830
	.xword	0xfeebb28a35c874e0
	.xword	0x574f7e44f8a45ee4
	.xword	0x9fb926bbe1a9fded
	.xword	0x2d5027a65ac3d4cc
	.xword	0x5106f2320bfd6ceb
	.xword	0x0674cd2eac801b4a
	.xword	0x80d49e59fa35a420
	.xword	0x98d069f02a0a0c24
	.xword	0x3556eee146434c24
	.xword	0x2f82ceb167daf002
	.xword	0xd300547a73ecc754
	.xword	0xe834b07526cd9980
	.xword	0x39eddcf0cf8edc81
	.xword	0x25a20e49120632b0
	.xword	0xbfba5604586c7ef4
	.xword	0xdd0559d420b6fb8d
	.xword	0x135ef851f475c299
	.xword	0xe5019a1c20dc623a
	.xword	0xdc7a5f5b21eef498
	.xword	0x7446620de8cea914
	.xword	0xf5d73ffb3c704153
	.xword	0x2dce7e18821e1e5b
	.xword	0xefd1bb53fa72d854
	.xword	0xf2021a8deb936a5f
	.xword	0x1a498dc4744b00e3
	.xword	0x026df1ef4b12c56b
	.xword	0x04357147a5e4a8b9
	.xword	0x7edcde2a65637258
	.xword	0x23dd7393806e5729
	.xword	0xd69b7bda7e3e9319
	.xword	0x927dc7a34a1811a4
	.xword	0xb27d9d789f357db5
	.xword	0x7a13370c936e8154
	.xword	0x6b8f676730568e7e
	.xword	0x5cf5392bc6dc5725
	.xword	0x923ac10d4a30c340
	.xword	0x4120194a1e5ff7d9
	.xword	0x27f5e693e7ab7748
	.xword	0x34bf994ad43582d0
	.xword	0x5eaa0fd87e561dca
	.xword	0x8d3ddc2072eabf8c
	.xword	0xf2b35aa170d2a7d6
	.xword	0x049b7a5e0498318a
	.xword	0x495ed04098a369aa
	.xword	0x6d155c289390bf5e
	.xword	0x5ed578fc8c616eb2
	.xword	0x6ea01485603a43d1
	.xword	0x30e1d1dd6bf97bed
	.xword	0x2419feaeacaf4db8
	.xword	0x43ff182764aaefd6
	.xword	0xdba589989fa8e986
	.xword	0xe4636b2f90e8de88
	.xword	0xce63465d85b82cef
	.xword	0x1401e3e01b370131
	.xword	0x5fd0c44b10deb76c
	.xword	0x665838d7d06e8de1
	.xword	0x8dabe224c8efee77
	.xword	0xcf3d9011095f01c7
	.xword	0xd56f4281ad60b261
	.xword	0x85f425747e035691
	.xword	0x12f0d2eab84fed0d
	.xword	0x36964ddd21f329f5
	.xword	0x829a685df217de5a
	.xword	0x5417b701b4db2342
	.xword	0x4dfb9960aa64f768
	.xword	0x3b26369d496177b3
	.xword	0x0143a784908d8805
	.xword	0x462b7b3bbe6e7506
	.xword	0x9320e4238337723b
	.xword	0x579a1095d1bad1a9
	.xword	0x3c634c9fb9ed2de8
	.xword	0x9421753508b3cf76
	.xword	0x61a573afe0fbf558
	.xword	0xafc398edb87cd303
	.xword	0x4f6709b8f17c9a24
	.xword	0x789659064c7755d5
	.xword	0x59f76077901130bc
	.xword	0x87c278c5189ded47
	.xword	0x9933a9fbb6bd785a
	.xword	0xae4e86b932937210
	.xword	0xd049ad8b52c373e4
	.xword	0xba2646279cf00941
	.xword	0xb54cce206fb5a198
	.xword	0x4f0d64efb7560ca6
	.xword	0x482c97fce9a6dcac
	.xword	0x0f1fa488d110ac64
	.xword	0x8be7920db8f60c66
	.xword	0xfd2b5e0bbf34386e
	.xword	0x52b26a3c5998bf63
	.xword	0x925707ff2c2a87b9
	.xword	0xf097089812d9923e
	.xword	0x09c58d868f5f6067
	.xword	0x4555ff8bf287d1de
	.xword	0x795f2df5db42bfe3
	.xword	0x5d11bad2c2d9dff7
	.xword	0xfc7909912fb7d309
	.xword	0x444c44873ac8aa49
	.xword	0x793d0bca8a0e7dfe
	.xword	0x0e82851259e25f72
	.xword	0x8300818cdfc727d7
	.xword	0xbe78b7e759fb24ca
	.xword	0xf568690b63737225
	.xword	0x5bf4eb2afe9df8ca
	.xword	0x2e895143dff953a3
	.xword	0xc7e42502eda83167
	.xword	0xeff6e556a74b2f05
	.xword	0x6b29fa3527b429fd
	.xword	0x1a68bd1d19224154
	.xword	0x49123563950394f8
	.xword	0x890a31da1ee27515
	.xword	0x274e4e27b218b40e
	.xword	0xea9c8482d44a355a
	.xword	0x31aee2f2b937ef73
	.xword	0xd3a9ca532128ff8a
	.xword	0xf40832749812b7c1
	.xword	0xfe1d5d2f7f44c514
	.xword	0xe263e2647ddffda4
	.xword	0x87e8039f152ebb3c
	.xword	0xcd5d773f8c0f99a2
	.xword	0xcac3b49647e7bb72
	.xword	0x02d5a907e08976a7
	.xword	0x551d1ea5a6f02d2e
	.xword	0x152dded3da844c68
	.xword	0xfa49cfb447d989c4
	.xword	0xa99cc1fb8020248f
	.xword	0x2bcf4bafd2e5f541
	.xword	0x3c439eb12deb6911
	.xword	0xf6c9c12109715740
	.xword	0x69653e1ef4322a94
	.xword	0x43c404026e55dd20
	.xword	0x2173e06ae4504138
	.xword	0xe760e3923b685fe6
	.xword	0xbb8cfa0cc905692f
	.xword	0xe5737bd7353e9e3d
	.xword	0x3b7c41520c30ba89
	.xword	0x9c721a031528a9fb
	.xword	0xe73c3928c315075c
	.xword	0xd236e247e8ed24cf
	.xword	0x2351b8aa62902d24
	.xword	0xf41ef045bf7e266e
	.xword	0xddb1fb802c3e92da
	.xword	0x1b39e1e77e259989
	.xword	0x988ac811b69b8ccf
	.xword	0x13a02bcace619f32
	.xword	0x883f2e0e6158c857
	.xword	0x535a44ec4d5350d6
	.xword	0xcd148c06a25c56c7
	.xword	0xf70ed926c6633c93
	.xword	0xa04cf7eab2ed985c
	.xword	0xd380e148575c7693
	.xword	0x400f625487a0665b
	.xword	0xc7f77d9c2414bab4
	.xword	0xc29c081dc22f855d
	.xword	0x3d3ba6b2caf519a1
	.xword	0x144934ebaeb9e78c
	.xword	0x70012bb5aff0b9bb
	.xword	0x78dd592d581c8638
	.xword	0x24b0cfc125328762
	.xword	0x66a656b8eaafee26
	.xword	0x36914ce17eff4175
	.xword	0x1a337f6a7303963e
	.xword	0x881cfa6408b5691c
	.xword	0xd819cfafc6c2b07a
	.xword	0x7a1a9fd90a449d07
	.xword	0x24a06361bae927c0
	.xword	0xe0372a9f50b84bb6
	.xword	0xdc78167ce88a7951
	.xword	0x0c4d30d5ef1c396c
	.xword	0x85a006b6b60a946c
	.xword	0x517145448f22d338
	.xword	0x23e5ce0c4dda17da
	.xword	0x62f634286ead0285
	.xword	0x6802fdf859bfa2ec
	.xword	0x0ffb216d7dd69d5e
	.xword	0x08df43a41c34ef89
	.xword	0x2c0b2cc0b3591ab3
	.xword	0x9342d9d04024e984
	.xword	0x0a991fc69509bc47
	.xword	0xac397eaaffc7ce23
	.xword	0x2346416b6e33d056
	.xword	0xc0e4103c8d401b32
	.xword	0x7a7f8c7de9a322b8
	.xword	0xc3cd9f14c7e7fa54
	.xword	0x3f42e7d5dcb9fc5f
	.xword	0x9f43b8a36675a220
	.xword	0xcb1228c0796c91cf
	.xword	0xf7499ab3764a0e03
	.xword	0x184fb375912a70f7
	.xword	0xc25cefec34d9637f
	.xword	0x731584e28196945f
	.xword	0x7eadb80a16598540
	.xword	0x2a48d5da0f3c0ab9
	.xword	0xf4029117020d7f15
	.xword	0x27a111748d86e250
	.xword	0x7f1af515ec058b44
	.xword	0xfcdfbe45c0f2d3c0
	.xword	0x7374a9e34cd24403
	.xword	0xaff67521b09e87e6
	.xword	0xc61a4336c6ec559d
	.xword	0x7bb62bdf377e001b
	.xword	0x62efe69ec759e98a
	.xword	0xd6ff8da7c6f191df
	.xword	0x47a50354bccd03ff
	.xword	0xca6661667d6c6926
	.xword	0xca15bfdf693455ed
	.xword	0x9a3571e8ea51a267
	.xword	0x9c37d32364fb8964
	.xword	0xdb13b38e5128f330
	.xword	0x925ebb8fb24e3e20
	.xword	0xcc0b0f55f29eb3e3
	.align 0x4000
	.data
data_start_2:

	.xword	0x74a80b22349e485a
	.xword	0x9c9b6dfdd090d1c3
	.xword	0x7ce5d463eadc838d
	.xword	0xa2097da85d737096
	.xword	0x9331633b67184ddb
	.xword	0xffe50de6163c49ec
	.xword	0x61519d4ccc8a7a6f
	.xword	0x93748146d2345419
	.xword	0x4d9956e11b0c910c
	.xword	0x254ecc98b3db14ae
	.xword	0xeaf6c783dba4e0fc
	.xword	0xd12c86acae1ea90b
	.xword	0x8194d880d1c82f1d
	.xword	0x5568505469549250
	.xword	0xb043f203523aac97
	.xword	0x76e3ac9db7e2e81c
	.xword	0xf41973ee2c902627
	.xword	0x781255db1b467d54
	.xword	0x873d4d0379f3f48e
	.xword	0xfd70a1f1b582a352
	.xword	0xfc4051b63fb484a8
	.xword	0xe5347b1e446fc66c
	.xword	0x91526ea801a65043
	.xword	0x0f126834fee3dd43
	.xword	0xf39cda1fbc7a3c6b
	.xword	0xca97b3ec3d3c1905
	.xword	0xa1e3885851a81dcc
	.xword	0x4a4eaaf460c384ce
	.xword	0x5620f2e884ebb140
	.xword	0x5c295651170dbeec
	.xword	0x1c824a1dc48ee1e0
	.xword	0xa4137554488102ce
	.xword	0xbbe7ebbf5e2f304e
	.xword	0xbae07cd49e3e5ca3
	.xword	0xf43325c2f3d84bc1
	.xword	0xe2eb078231cc0d0c
	.xword	0x7e7eb3e27f3e37a6
	.xword	0x04acd2f37f762a55
	.xword	0xbdf13ef8c2cf504f
	.xword	0xe0b85acd1e5cdf6a
	.xword	0xd83c733ffa11b0dc
	.xword	0x045da958f23b5164
	.xword	0xb12961c20e0f1a1f
	.xword	0xa8fec37589d7e83a
	.xword	0xa70303f1758a4295
	.xword	0xd0b860403012f272
	.xword	0xa2793992c71522b7
	.xword	0x5566bdb8e28a9e82
	.xword	0x2152b052eaf1b01b
	.xword	0x3a2fc93b44a0db9f
	.xword	0xcd3b335b63c4eebd
	.xword	0xb98210c8d01e6daa
	.xword	0x8736ce229f27432e
	.xword	0x515f8307f1be8267
	.xword	0xded8b67047feeb1f
	.xword	0xdf2d22cf3fe515bf
	.xword	0x3d3b3e54e41438a9
	.xword	0x9c4fd38960943139
	.xword	0x8362569f4957ff32
	.xword	0x51756db0a23006b4
	.xword	0x48ede54e78b8200d
	.xword	0xb89b9c8886a7e183
	.xword	0xf70275be9e74ec84
	.xword	0x6c37bfb492c25637
	.xword	0xf522fcfcf581bf65
	.xword	0x3b0a8b73cce24d03
	.xword	0x45fcfe044e809cbd
	.xword	0x9a8aed1acaaf0230
	.xword	0x94f52198234dcf29
	.xword	0x814693450c6f298e
	.xword	0x644589bf2d0af2c0
	.xword	0x4a7ddca1c1c1d7a5
	.xword	0x854d1159dc9449f3
	.xword	0x2934d14718890b43
	.xword	0x23ed4f9c1ca63410
	.xword	0xe80abdfa25d354dc
	.xword	0xf3fcc299c344f00f
	.xword	0xb882149b299d7cdf
	.xword	0x59e46b80e141c2ad
	.xword	0x0708efc0e0baabe6
	.xword	0x881b83156ef4b919
	.xword	0x04228cd66d5ce0a2
	.xword	0x682f56a8f5efb355
	.xword	0xf43e8112954d477c
	.xword	0xb2a139bf7b46685a
	.xword	0xe1362bed961817b3
	.xword	0x71c54d13924bbc67
	.xword	0x1ffd745de9ab931c
	.xword	0x1e9c106f5a39adbc
	.xword	0x82db81c813915c94
	.xword	0x84c8b324997cba22
	.xword	0x5c2e3b98632909c0
	.xword	0x3f5e9bfb328c7d57
	.xword	0x01732383372e9717
	.xword	0xa731417fa3abf8b7
	.xword	0x6331c68c89b3b53f
	.xword	0x91ef694d161d9b04
	.xword	0xe4dcc2c5b2595156
	.xword	0xbe35ae5bc99ee148
	.xword	0x59912483fbba43c9
	.xword	0xe29ab77fd9131e2b
	.xword	0x8877bd4eeddcc968
	.xword	0x050659c1c0d89256
	.xword	0x85839958c05280b1
	.xword	0x00302f3db99c0f9f
	.xword	0xd32e629e9fbd36cf
	.xword	0x6168bdce3ea196a5
	.xword	0xb41dd6c006b6c498
	.xword	0xec3f198009a44317
	.xword	0xcfc7fa3a7d09377a
	.xword	0x2b438a824e870974
	.xword	0x24763e94f834f5d7
	.xword	0x4d17ad1db67b11ae
	.xword	0x323a1030da260f4f
	.xword	0xc91680ce1dd36b56
	.xword	0xb1077a7fbd4a2cb4
	.xword	0x917d7b02f845c941
	.xword	0x27c2005b536f6e29
	.xword	0xa65acadc09ae29ad
	.xword	0xead0c278787ab92e
	.xword	0xe6240d95a495871d
	.xword	0x029aa795be7565c4
	.xword	0xb1dd0ba3c5a610b1
	.xword	0x48fa19571b4a6be7
	.xword	0xa7bcae259cae03f9
	.xword	0x5cbdea27f60cedf8
	.xword	0x5fe9b01bc0cd3d10
	.xword	0xfd0e111bcf3dd5e7
	.xword	0xe7bec498d3655129
	.xword	0x4b5446789a6d6667
	.xword	0xd2b504320f0eaa92
	.xword	0x56fecf5e9282ecdb
	.xword	0xa53914f56d873c5b
	.xword	0x0d909ecf2e1a540e
	.xword	0xc062ac243b3e00c7
	.xword	0xb6117a0d7d90f793
	.xword	0xffae145bfc6ff7ba
	.xword	0xbf46713864410626
	.xword	0x41d874b40c2f9db0
	.xword	0x6a6e2c439f605ec9
	.xword	0xa6ba5e0c53654ac1
	.xword	0xc83ef7982a502ebf
	.xword	0x2acfb90ddee7d340
	.xword	0xaff3cb42c7838e0f
	.xword	0xa971a5632740bc21
	.xword	0xf8c9ae8062afac6b
	.xword	0xe6982dfa76d8bb4e
	.xword	0x7fc2189fc0e5ab42
	.xword	0x05816ed7a5b6c99b
	.xword	0xc310fbe4b22ff731
	.xword	0xcdbf7d8461f3bace
	.xword	0x6ab809975209754e
	.xword	0x46c11151d8c37aa9
	.xword	0x9366e69009ecb8db
	.xword	0x83335167200a1af7
	.xword	0xf32d0faa953aadbf
	.xword	0xb994b2426f600036
	.xword	0x4d650276a5d7393a
	.xword	0x12fca221cb5e9062
	.xword	0x20ebc3c32c4138d1
	.xword	0xcbd8a02d4d014b62
	.xword	0x4f46ef6a2d11443f
	.xword	0xbafb4a695a49090e
	.xword	0x993f7dddf17a7a75
	.xword	0x827fdbffabd6ec4a
	.xword	0x691c3d67dfef8592
	.xword	0x18b7d4c7dd5a2859
	.xword	0x12c98b4d9e940afa
	.xword	0x38127016d7c41af3
	.xword	0x139c0ae72916e2c9
	.xword	0x070db992c3820984
	.xword	0xb5d127b126fb8922
	.xword	0x1cbe5e71f57ab124
	.xword	0xa4adb7da6a555362
	.xword	0x9a8d74a2ee2d77ec
	.xword	0x8f368f73d323e71d
	.xword	0xc1e0f1d50c9f9800
	.xword	0xd747c71e78459667
	.xword	0x8c9448f6723aa659
	.xword	0xab075b89b93b372f
	.xword	0x6cd96a8e9eddf9c3
	.xword	0xa78676a6c1555674
	.xword	0x0f5b99f4519a4a9d
	.xword	0x6e03bf2843e8ee48
	.xword	0x8ff825b163984e1a
	.xword	0xab0f93d109871b67
	.xword	0xcfe0861f896e318c
	.xword	0xe2a329bce1b10d03
	.xword	0x78dd64774e12a0b2
	.xword	0x1804247065ab5893
	.xword	0xd26b766a4f972357
	.xword	0x0c9fa1d9cb18c506
	.xword	0xf76d8d8d7859dc5e
	.xword	0x012cc3d0b921fb58
	.xword	0x810cb281273d0f3e
	.xword	0x3426f2f23c2a4818
	.xword	0xa5b15c85080806da
	.xword	0x7e739974eb8ac01e
	.xword	0x5811d4925356da28
	.xword	0x25a0821d43f6a92b
	.xword	0x0dd0e7856adf655e
	.xword	0xaf8f8c279a299749
	.xword	0x5d1ea3dfcb704db5
	.xword	0x80d37b446f50c40f
	.xword	0xed8e04c6f69744af
	.xword	0xb3194df95288736b
	.xword	0x3cc1649f63a6f392
	.xword	0x909e2d49d984c719
	.xword	0xd8a481b8b01690db
	.xword	0xadf0ff3da01cd0b1
	.xword	0xc69cc5b83f70d8c0
	.xword	0xf8726548f70cd486
	.xword	0x88a94f4762f61924
	.xword	0x28e7007af0f1ba3f
	.xword	0xffc1b00dca598a00
	.xword	0xd81feaf53133e9d3
	.xword	0xd42faa8c47347fcd
	.xword	0x618772c8c8ee0090
	.xword	0xffa6aa9b4f4936a0
	.xword	0x0e8a4f37eaf38953
	.xword	0x48cd0a2cb84fa786
	.xword	0x43c14288bab9cbb1
	.xword	0x8c51a81fa49d5542
	.xword	0xf966e2b3a7656335
	.xword	0xc69d617669f2baab
	.xword	0x96fc6a7af740ed51
	.xword	0x5e3b48ff0c9b1b12
	.xword	0x6bf5b14f064a1b8d
	.xword	0x19718fa9787ab864
	.xword	0xdab176b8b49970a3
	.xword	0xe229da3ef0daa486
	.xword	0x4c1cc8ab13ee45fc
	.xword	0x7df0e979c6bf8393
	.xword	0x1c2518127ed2efba
	.xword	0xffd9d58e1c2b4e10
	.xword	0xf285ea386722bb89
	.xword	0x9292a6c31c1f7c3b
	.xword	0xd04137d70ecc0aaf
	.xword	0x9fe2e887604d1ccf
	.xword	0x1373285bc863f64d
	.xword	0x0697769a4141e237
	.xword	0xd0d68da63a9ef21a
	.xword	0x6c9c67973d5bd17d
	.xword	0x2161b590a3d22cb9
	.xword	0x104a42d1d9ba9781
	.xword	0x8eb45069eae59882
	.xword	0xe9c34854bde6965a
	.xword	0x42f5488e1fd55cfa
	.xword	0x718b430d5ca612ec
	.xword	0x44a6848c9f464e72
	.xword	0xc27fd93a275a70a3
	.xword	0x621f8071c6762c1c
	.xword	0x93b761c97d3c7925
	.xword	0xfa3d3673b69f1ee2
	.xword	0x4b65fad817f00c7f
	.xword	0xe3226720f3e07635
	.align 0x8000
	.data
data_start_3:

	.xword	0x6ba2f3984714356a
	.xword	0xf5936c6a92ee1060
	.xword	0x87fbee0bf6858c07
	.xword	0x71bccdb54d369053
	.xword	0x8336d3ca6e610920
	.xword	0x3bb020c508b792e1
	.xword	0x32e25e0e967cab82
	.xword	0x1cf1dfbcf485a337
	.xword	0x11e834fbe4fca8f6
	.xword	0xca162d5b5b89a372
	.xword	0x6b14607bd0be918d
	.xword	0x7b678a298426e986
	.xword	0x3d30e2a7302d5324
	.xword	0x95162cf1dfe4caaf
	.xword	0xd8813ebb72c4e453
	.xword	0xda2dd660271ee2a6
	.xword	0xebae8d5affc430eb
	.xword	0x784ddad0c7daf427
	.xword	0x76af812b659f4af1
	.xword	0x0fef6856a24285ce
	.xword	0xb9c4516420145037
	.xword	0x6fd6cf8d257f272c
	.xword	0x9222686c8b2262e8
	.xword	0xf4bf44723e0bab19
	.xword	0x5fb5be26ac475b24
	.xword	0x619325eaf33b0725
	.xword	0xbf87bd57aff5362c
	.xword	0x9ba40d736ca5096f
	.xword	0xe0537f9cc4d32537
	.xword	0x094a62af94e89d95
	.xword	0xbbad57409aee3473
	.xword	0x93189ca0376fc428
	.xword	0xe88e0bcb9e5d6b97
	.xword	0x6452aa10d4c7ad1b
	.xword	0xff60cfaa80b5c651
	.xword	0xa87b97412e9e2231
	.xword	0x9f2e20a3e5e4b898
	.xword	0xd2c114156a6e8481
	.xword	0x850e8864865c5460
	.xword	0xe21d5ce23149ed25
	.xword	0x279ae1373a82d8d0
	.xword	0xca360aea9f645525
	.xword	0x6abcc3455b7e68d0
	.xword	0x41f7c3f0e4c992eb
	.xword	0xbc59102bf281407e
	.xword	0x20ac85734821ee5c
	.xword	0x70d7d0e56f7e41b7
	.xword	0x3cd1354031f107a2
	.xword	0xfeb0e72740e8c9de
	.xword	0x4db7006a52539b10
	.xword	0xab8f328d2f82a832
	.xword	0x70b7deb19a616b48
	.xword	0x38064a3b480d6d01
	.xword	0x42c8bc1cb666d8ac
	.xword	0xc7f15309ec1afa43
	.xword	0x7304f71e6e7e9f0a
	.xword	0x01686769bcee47c0
	.xword	0x405fac6c43847611
	.xword	0xa2cad76ca5fab11c
	.xword	0x29d0bd72ffb2727e
	.xword	0x13ee0b2374ab8759
	.xword	0x99359ab87828e137
	.xword	0x60c6b579243820a3
	.xword	0x5a7d974efe030ef4
	.xword	0xb8bf9252d30a0af0
	.xword	0x2119c8ad4d5c0aa5
	.xword	0xc0532036ed0ec615
	.xword	0x5e54ccd5c486b23e
	.xword	0x74fe2326eaac284d
	.xword	0xf19f4b5f9b545d4b
	.xword	0xe7f2b1d34e3822cc
	.xword	0x606f05e179033a84
	.xword	0xbef51ac908dcac5f
	.xword	0x93b6154f9e52e386
	.xword	0xa9aa17277fd60e83
	.xword	0x69d2dbf51c822d40
	.xword	0x227ee3b556249520
	.xword	0xa5d224f73b8c2986
	.xword	0x926671621fd7f5a8
	.xword	0x1cb8b11447a12333
	.xword	0x010188c2f5c86620
	.xword	0xedac08308edc16f2
	.xword	0x309b14e00edc1cdb
	.xword	0x3a28834a3f5e66dc
	.xword	0x1c63a558c250cafe
	.xword	0x030cf63cb807e772
	.xword	0x4e010026a55371e2
	.xword	0x31f8949a32d61921
	.xword	0xbdbde4014b18e0c6
	.xword	0xb8400c877eae8d95
	.xword	0xb7604ebb6413fc79
	.xword	0x9046834c58228cb6
	.xword	0xb183386c170367f4
	.xword	0xbb65cdd8101640e9
	.xword	0x20ad6c8ad2773f47
	.xword	0xa95f5ea590d8fc71
	.xword	0x8947e26e3947d9d8
	.xword	0x65d54612afafeef1
	.xword	0x0650c62740d0a190
	.xword	0x0308224570bd2ca5
	.xword	0xad5dcfc29dd507e7
	.xword	0xece94ffd3d0d6f3a
	.xword	0x45b3b595018dcbb4
	.xword	0xfc5e269eeaa863ad
	.xword	0x23c7477695a5fae5
	.xword	0xabd18ce362fc7c4a
	.xword	0x947240fd5eddb1ef
	.xword	0xbc67e3e89076a8bf
	.xword	0x4665412178c7d495
	.xword	0x83aea0e2b351b6c9
	.xword	0x3f1f267cabb3bc7c
	.xword	0xc3f5ec3339532875
	.xword	0x5ec19ee91447423e
	.xword	0x64f7da97e3e0d8c7
	.xword	0x2855eb5972f878f3
	.xword	0xded04e13e2e91def
	.xword	0x6987dd59ec2b7b50
	.xword	0xb65c13562130eff5
	.xword	0x2f16246f9847554d
	.xword	0x71bcc689c193c804
	.xword	0xadbbf98c41d65647
	.xword	0xaf72aad4b5d61406
	.xword	0x0afb7f93b701bbf7
	.xword	0x0232de017bda65dc
	.xword	0x69e46d8f67fb24ba
	.xword	0xdad6b883adfe9bd8
	.xword	0x15366f104acabbf3
	.xword	0x1a0efef0d668eb2b
	.xword	0x0d75b545bdaafd80
	.xword	0x7a549108dce58e2d
	.xword	0x96815041d08a9139
	.xword	0x93c5fafb055f216e
	.xword	0x448dfee24e760813
	.xword	0x7b2ba1938ba500cd
	.xword	0x08fd2e85973e84f6
	.xword	0x342933a72cd7eb99
	.xword	0x52b0ec2aa1030195
	.xword	0x59601aaf660669fd
	.xword	0x8a4b0fbafa6d6509
	.xword	0xf453057a9db354f6
	.xword	0x5879bb0e2bba18b1
	.xword	0x0d0af056eba6a22c
	.xword	0x0582d31ce9a3e170
	.xword	0x650ca40a04c14193
	.xword	0xcd1266777ccf2465
	.xword	0x8c8791596999952a
	.xword	0x693cb62b69f7e502
	.xword	0xe001a87c21b28566
	.xword	0x7847feb41cbd03a8
	.xword	0xdcf24068cc05587d
	.xword	0x8bda548aa53ca32b
	.xword	0xb85a436dd3520fce
	.xword	0xe885ee34c80c107a
	.xword	0x77bf7ac4b6ff66a0
	.xword	0xac3a63c9f7f6d90f
	.xword	0xcb5788632a4e646a
	.xword	0x1fcf8e506001675d
	.xword	0x507b3d24ed19bb05
	.xword	0x61b5eca740e53195
	.xword	0xf12606d4f1c8e38f
	.xword	0x0388ed6370fd5728
	.xword	0x62896c4bc7769000
	.xword	0xf81e655b268ca4f8
	.xword	0x70abeb73075a604c
	.xword	0xc00d3c2682617f26
	.xword	0xc464ac14a4c9d839
	.xword	0x2afdc8b348275a9f
	.xword	0x35b4ab5e492fd056
	.xword	0xbfc2db57f85c14d8
	.xword	0xa5d8cec8f926ffc5
	.xword	0x92d53bbc96b8f65f
	.xword	0xe37a76892eca61f1
	.xword	0x16c9ac710bb2ffd9
	.xword	0x153e1ccb51b48cdf
	.xword	0x1dbacc972ca3b37e
	.xword	0x85567665f6755102
	.xword	0x152182b612c9bc18
	.xword	0xb24ac2df6125cfa6
	.xword	0x2fc0d28276f28d46
	.xword	0x76b267fdcae52acc
	.xword	0xcf26a0c1594dc572
	.xword	0x205854ef85f36f69
	.xword	0x672ed2c0555aff0b
	.xword	0x05ca0df2ca6dd7d8
	.xword	0x11f3897eccc357ed
	.xword	0x18bf836cac126518
	.xword	0x1da95e677c17e6f7
	.xword	0x45c69e720194e66a
	.xword	0x1700fa39c0f275ee
	.xword	0xaf3182881ed88a55
	.xword	0x2dfcefc6d4713940
	.xword	0xee8a63339e6c85e3
	.xword	0x54625efb8f2279b5
	.xword	0xa1bd21e07fc49428
	.xword	0x97d546722546ed7c
	.xword	0x3820d15a858c271f
	.xword	0xa0bbc42cd37c4e83
	.xword	0xda7e322bd9063421
	.xword	0x51cb653704dd5f64
	.xword	0x2a4b7a335479e99a
	.xword	0x469e7b9fa79bc319
	.xword	0xfdd64f8c3389ee1e
	.xword	0x4c84fd38c983cd25
	.xword	0x9ca9dacfffccba61
	.xword	0x319943762d76601c
	.xword	0xdf880b571a481012
	.xword	0xe2dd6c8ad8a927a3
	.xword	0x5b002074437f5dec
	.xword	0x0729d00ccfd370d9
	.xword	0x6a167a4a23c29e0f
	.xword	0xb45a5fe846f1cbb6
	.xword	0x20473e273b7302f8
	.xword	0xa1cd87c401080d9d
	.xword	0x97695d2f7e22bd1e
	.xword	0x539ac9fb79bf583b
	.xword	0x02ca7ca517cd1447
	.xword	0xe0e1af5cedf2b614
	.xword	0xff5fbeb356a8c18f
	.xword	0x3d3557862af4e29c
	.xword	0x024e025e6ea26d0a
	.xword	0x1232bcb713fee5f7
	.xword	0x6978b2e044cf25d9
	.xword	0x49a061a49a8dd61c
	.xword	0x45f3841c35a2da93
	.xword	0xb7b8a1563884cc96
	.xword	0x2306f30d9dfc525d
	.xword	0x4f18d511ce10f54d
	.xword	0x955fa33b1929c8c5
	.xword	0x2245d28f6578dc47
	.xword	0xc64ad73aeae48aa7
	.xword	0x1e8c156060eb59d0
	.xword	0xf8d9e75582afa46e
	.xword	0x1ce99019f6dc08f9
	.xword	0xbdfc8b010963378d
	.xword	0xaf5b2fe9a07798d5
	.xword	0xcf476f99c93c4011
	.xword	0x346c6fa0e2730364
	.xword	0xb93739f75171a15b
	.xword	0x9d443d5e524db8db
	.xword	0x08db82521ef3e5ac
	.xword	0x56d31e0bb85f6409
	.xword	0xd4195c0ef1bcd218
	.xword	0x0631beb5dc20249a
	.xword	0xdf7aea0b509b5e83
	.xword	0xed93e91571fcc21a
	.xword	0x8c1ea42c917e8b95
	.xword	0x8c5e299cf25ebfeb
	.xword	0x135422e15d662124
	.xword	0xacceb0019d2f14e6
	.xword	0x8006ddfebac7f400
	.xword	0xb8b70fe390ae4d85
	.xword	0x1d49a5a072db310e
	.xword	0xba15abe7eb54d190
	.xword	0x22dfa86a8526f492
	.xword	0x547d757a8204b0d4
	.xword	0xc5fb8d27921ce8ba
	.align 0x10000
	.data
data_start_4:

	.xword	0xba19e5f7bff39573
	.xword	0x095f2529bdfdc152
	.xword	0x1304770569807e59
	.xword	0xc39f9e98601be388
	.xword	0x5e8e63f523f3042b
	.xword	0xbe4d986fdce1d092
	.xword	0xa4a865fcd5351059
	.xword	0x47264da36c080049
	.xword	0x7062341ebb07924d
	.xword	0x5b749e4e49f223c6
	.xword	0xdc5dbe60b5246c56
	.xword	0xad6844fcd3ba09a0
	.xword	0x5a6e3049b92f35ec
	.xword	0x6e3060a0eaa81674
	.xword	0xd02d146309c02af1
	.xword	0x531a46ec9c310f31
	.xword	0x5d74ce60b751f7c1
	.xword	0x9a620f1dae6f986f
	.xword	0x38fdfabe0e934d17
	.xword	0x3b8c30e32d6622d8
	.xword	0x5e05d2368e33042b
	.xword	0x5aa8228a3181a300
	.xword	0x634a039a0a55dbe5
	.xword	0x57981a755c4b4f5a
	.xword	0xf2361c149a563edd
	.xword	0x1fe833ef82b57513
	.xword	0x52adbd5220b49ffa
	.xword	0xa550b5d0e890bd50
	.xword	0xc8e342a5fc520ce4
	.xword	0x7f36b14167cf72ce
	.xword	0xbf5ea2c16ef11dea
	.xword	0xcc7594bb4db75e84
	.xword	0x34e51e6325afa6e9
	.xword	0xe139892e95697e2f
	.xword	0x6feeb5f204174b36
	.xword	0x9a8c6141691dd50b
	.xword	0xe68407358913e946
	.xword	0x8a045972cfaf8667
	.xword	0x02b5b1bd9864e978
	.xword	0x9c808924bff7713d
	.xword	0x347dce4c93913b21
	.xword	0x7fa6059846336a4a
	.xword	0x46b76a6d023ac21c
	.xword	0x1608e65a6ed8ede6
	.xword	0xa102e61d15fa95b6
	.xword	0xde82bb5a275e9fc9
	.xword	0x3769c9b4957dacd8
	.xword	0x2d7e72d049d8fc91
	.xword	0x0848e796a7ef57e0
	.xword	0xda4d82923b40e498
	.xword	0xc07d8c4053977da8
	.xword	0x810dc140fa94d6fc
	.xword	0x465e6c4c3e8fd5a2
	.xword	0x843f0747cf5baa3b
	.xword	0xf982ba297ec32601
	.xword	0x28f4909b45391725
	.xword	0x6be5db810cd678fe
	.xword	0x90d17d9665a74348
	.xword	0xe0d7db2af7efcff0
	.xword	0x04ae8e6cf26e80b9
	.xword	0x30a1ae04e06391f5
	.xword	0x21fc962ac47c3104
	.xword	0x390e686414940810
	.xword	0x171f785e40a125f9
	.xword	0xc619513a08c65b60
	.xword	0x4f29ea53e766ce1f
	.xword	0xe654659e76537ff1
	.xword	0x31c347cf7a684726
	.xword	0xb1d24e11b96b371c
	.xword	0xf865ccc312d9aae3
	.xword	0xcb070f8df35c9586
	.xword	0x9f4e33f43ab7fd0c
	.xword	0xfdcc872e72048811
	.xword	0x92c1a2d14d4c6581
	.xword	0x1a6f89df1347e897
	.xword	0x5ca595b531e7faf2
	.xword	0xad362780f0169551
	.xword	0xb2561c6969d26182
	.xword	0xf0c2ce5d13f24a92
	.xword	0x3234f94ed239169b
	.xword	0x9753e388f767915c
	.xword	0xfab976c51718d247
	.xword	0xf7179a11579db71f
	.xword	0x9608e40ed4093282
	.xword	0x1c47b846c7ba3181
	.xword	0x8c160b766f77ffba
	.xword	0x77c69eb2ef7868ef
	.xword	0xa56b072de4523cd7
	.xword	0x9b66f8acf881f4bb
	.xword	0x6c4ca8b0f2f84ec9
	.xword	0x97748a95fa8fa107
	.xword	0xdfddc1adbbdf27c8
	.xword	0x03f3e3bbfe642e9d
	.xword	0xd778c2bcd5ea486a
	.xword	0xe1b34fc3fba681cc
	.xword	0x58e6eba971fcb86e
	.xword	0x4b2dadbe0e3c2e4d
	.xword	0xcca2f8607912df0d
	.xword	0xae0944c22feb3c1f
	.xword	0xc4cc9f5d308650fc
	.xword	0x53b69d7480e43bb2
	.xword	0x965ff4d689a54f7b
	.xword	0xf5e381b2bd07df05
	.xword	0xb6e1a4675a213e3b
	.xword	0x81085e3c11077a70
	.xword	0x535e6c4c67f4464d
	.xword	0x5de5238fcbf3e163
	.xword	0xce2a38eed6cbe343
	.xword	0x0ed7930db4f1ee50
	.xword	0xbb4e0ebc049ea0f8
	.xword	0x4891dd4720c92c05
	.xword	0x25793f05fd863fd0
	.xword	0xb73cbaa3667c6e1b
	.xword	0xb8e768dec9d71dcd
	.xword	0xeb8b51248f82f94f
	.xword	0xa8ce605174e3b4da
	.xword	0xe3c5564d9b6786fe
	.xword	0xbc6147bbfe32aa36
	.xword	0xffa3ab7f3a302031
	.xword	0xe93cd4e5fcbde036
	.xword	0xc59b4653f9c68d39
	.xword	0x610d0c0238be4090
	.xword	0x363ee79462b2ef8f
	.xword	0x4936d3f7d6c3aaac
	.xword	0xe3a3de06b06276d9
	.xword	0x7b6a7dd981158305
	.xword	0x31cda42dac8efd9c
	.xword	0xa8473e3c2ffdb427
	.xword	0x80593c923283b8e9
	.xword	0xeb1091befc5028cb
	.xword	0xa046dd87bef53ddf
	.xword	0xe7d37efee1ca0574
	.xword	0xa673307e80eba8d0
	.xword	0x7dc068766e354a9d
	.xword	0x4e0cda4f4fa112b8
	.xword	0xc78b865546a162fb
	.xword	0x90e746d6993b7439
	.xword	0x58b960b398e0025b
	.xword	0x29e972564ec0e3c2
	.xword	0xe969fa6352410825
	.xword	0xc63c0be86d938d9e
	.xword	0x757b2d8e6f1a2b76
	.xword	0xff21bc6b91f802df
	.xword	0x3d3664c4ec6a0318
	.xword	0x1fd8d52ab4f89bf5
	.xword	0xe70d6c5e9d9670fb
	.xword	0x8d782658c63cc606
	.xword	0x2baedfc927685c8f
	.xword	0x9d7f7de2d68d5b48
	.xword	0xd528a632986f8d02
	.xword	0x597727058253526d
	.xword	0x5cf15b2d45209535
	.xword	0xfc3a85ac81875a35
	.xword	0x99b76b84cb603ce2
	.xword	0xc21ec7185754a3da
	.xword	0x44b8535f7668a26a
	.xword	0xdc73a206b93a886b
	.xword	0xe6d5b153f4a52a3a
	.xword	0xd7bea032c063ead6
	.xword	0x98989d967f66354b
	.xword	0xeb33ca53eb275ed6
	.xword	0x0af1a38c12bfcf03
	.xword	0x6b25bb0e7e981a12
	.xword	0x19f971cfdd5e94a8
	.xword	0xf694a0d4a0bdbda3
	.xword	0x6cd9614d4513d1cc
	.xword	0x21b33d7154766944
	.xword	0xadb106613dd590bc
	.xword	0x0e7a7d86078656ea
	.xword	0xd6fb2f2874860e9b
	.xword	0xc27366d4aff20315
	.xword	0xf3ab715d5e30818a
	.xword	0xba66fca8fdc84899
	.xword	0xb960a63e75159c65
	.xword	0xe7e76f1834e62ace
	.xword	0x7d18624bb59f72e9
	.xword	0xd8cc98f2c7d0c649
	.xword	0x3ddec8161e77ee97
	.xword	0x2d6183df01b3a273
	.xword	0x7b76c18399be616b
	.xword	0x3d634f7fb0032066
	.xword	0x9e18f2d00ef3cc04
	.xword	0x1265f839fb0a7d0a
	.xword	0xc652271219d9eb7e
	.xword	0x1f7d7f99fea70019
	.xword	0x3f03a1b453b2ef70
	.xword	0x4379a649c44d4105
	.xword	0x9560b338f44d56eb
	.xword	0x926f1c3f66e332e5
	.xword	0x2490eac4d96fb7d9
	.xword	0xadb20c2dc4ee56b4
	.xword	0xca56bbd064de220f
	.xword	0xf7b542ea383e17a7
	.xword	0xf3e04dc6c60c356d
	.xword	0xfc6c869869b9e86a
	.xword	0xb389b1891488068f
	.xword	0x590fd737595bbc96
	.xword	0xd1406b95e5e1c148
	.xword	0x359170cd46164cb5
	.xword	0xbdb8e4697f3b0ce0
	.xword	0x25ec5b9fe76ef928
	.xword	0xa49a4d6dcb1886fa
	.xword	0x3976cdaf2d8f7072
	.xword	0x881392dfb8c81905
	.xword	0xb47ba13571d849ec
	.xword	0x53f234825d2cceaa
	.xword	0xdef24fac2da2a184
	.xword	0xdd4bc090b03763c8
	.xword	0xd061af320923dfd8
	.xword	0x8d9900bcc72c7a83
	.xword	0xd519811f32d4d11f
	.xword	0xee00efa4e65d63b4
	.xword	0x07bc3f4deb9e1aac
	.xword	0x76644ddf614570d1
	.xword	0xb6a26e88b2dadc33
	.xword	0x2df3e885f16f5187
	.xword	0xb7072408c224dc9f
	.xword	0xac0174a6768d8e22
	.xword	0x925525dad67ef62c
	.xword	0x600ce6cbaa3a21f3
	.xword	0xd60e557b43957c16
	.xword	0xb2cf90bfe0e6143e
	.xword	0xe8ce70a76c304c6a
	.xword	0xfef08b2882649cad
	.xword	0x526aa035651dbaf5
	.xword	0x1e4d536568af3ab2
	.xword	0xe21ec8a36f3374e6
	.xword	0x198b8460a3dab313
	.xword	0xd28cd637e392e2d5
	.xword	0x33b5c33a2c34d534
	.xword	0x1e560f409ff4d087
	.xword	0xdea79aaa1e67f4d8
	.xword	0xa2d86b43eeb3b6fc
	.xword	0xf7f1611edb3b1864
	.xword	0x3cda8f0277ae3122
	.xword	0x0d6edf5e4337cb8b
	.xword	0xc2048a2dd889c455
	.xword	0x62c542ac61eb02f6
	.xword	0xf9ccb1b5f7e1ab23
	.xword	0x7058977a65b7961a
	.xword	0x2104eb082c69b3ca
	.xword	0x9b8531fab022978b
	.xword	0x6d29bf5460eccf7b
	.xword	0x6652232be48b4f89
	.xword	0x62e99228e2b16cee
	.xword	0x1e6ba74cbe1925f2
	.xword	0xabca18f421cae7ac
	.xword	0xa125a4c8cf83f2eb
	.xword	0x146ee4c6ccbeec0c
	.xword	0x4a74efa207d72fbf
	.xword	0x11b357c16f90056c
	.xword	0xaa5d876cb36cb912
	.xword	0x1ab888ae6cdfdde5
	.xword	0x27f807b31ecde6cc
	.xword	0x3e368f195d40d764
	.xword	0x843b1d0a8939b0b4
	.align 0x20000
	.data
data_start_5:

	.xword	0x467fb2613fbd07e1
	.xword	0x3301eccdd82d9ad9
	.xword	0xed88881d677008b6
	.xword	0x46ddc6e64c7eccfb
	.xword	0xbfbf0fd92b225e75
	.xword	0x6134aa7f96f43f63
	.xword	0xb98a5c618ff7382c
	.xword	0xba67204f049a785c
	.xword	0x7c5067ad5a110998
	.xword	0x1ac5fad8b9835938
	.xword	0xea92142b1e0911b3
	.xword	0x0598d2dffbe65414
	.xword	0x9f68b44e573e81b6
	.xword	0x2caf8a7f307cc4ff
	.xword	0xcbcf221a0706478f
	.xword	0xdeb79a98ed3f0483
	.xword	0xc8eb41f05b2098c8
	.xword	0x8d7207bb15ad4423
	.xword	0x69ddd620231e9206
	.xword	0xeca2c20abbc16700
	.xword	0x2cf3a7db7f92b0ea
	.xword	0x4727c163adb0473b
	.xword	0xc8151d42f2e71c60
	.xword	0xdf476b7bd37031a6
	.xword	0x63c81d404c0f2ac6
	.xword	0xec18af607c1d783e
	.xword	0x68e138cd9fab5e34
	.xword	0xe9b33147087277ce
	.xword	0xcc2c779201161ec5
	.xword	0x0e2d1082e35da9e8
	.xword	0x2d9a040e7482d7a3
	.xword	0x9a7e7ecd15237618
	.xword	0x3754444c98a31789
	.xword	0xc6f4b1dc6a1484a2
	.xword	0xb4bce56b497066cb
	.xword	0xc910da5370ee2896
	.xword	0xe757f23ac06cd6e5
	.xword	0xe9e37729284e7699
	.xword	0x8e041ff28d1937b4
	.xword	0x648f33ab40ac8aa6
	.xword	0x98cebd57a1af6568
	.xword	0xac36b644ecbff93d
	.xword	0x54ff12c54609cc7e
	.xword	0x58bed16bdcb9f61c
	.xword	0x12bdece47db9b8d4
	.xword	0xd0ac9fdbab9e2eb0
	.xword	0xf8f535309487f795
	.xword	0x1fec1dbda3bc25a1
	.xword	0x6f31064290d8700f
	.xword	0xfe2da881feb12a14
	.xword	0xee09294d6eaa3239
	.xword	0x2844b5cb8693f985
	.xword	0x19f2a1aef4e93cbd
	.xword	0xfdd60c774e6894c1
	.xword	0xe4bedda2ccd64ef6
	.xword	0x7151951ac1c48a00
	.xword	0x944d0be073213f3f
	.xword	0x99f4d96ce6d4e927
	.xword	0x6fbf62ba95c59677
	.xword	0xec95644d4a8eeec7
	.xword	0x18c32ac9870f8ebf
	.xword	0x8fc2e729bc2c65eb
	.xword	0xffd33364831f2661
	.xword	0xcee66d4ab99f491c
	.xword	0x4780c9af3eb0ef2c
	.xword	0xda4e914b31aa4925
	.xword	0x856153f21b2921ef
	.xword	0x64e6bb2ddba66191
	.xword	0x214d3fc1b4d3f60c
	.xword	0xba76c8684aeefbd6
	.xword	0xbf308c373eebaefe
	.xword	0x48e205765e4be54b
	.xword	0x39c6c94005e428c6
	.xword	0xbacd58a3ef7dd147
	.xword	0xd04a979228422743
	.xword	0x30a20c560905d837
	.xword	0x7eaa5c4def4c761e
	.xword	0x19f0ecbf0051e030
	.xword	0x549ebbf7ef00885c
	.xword	0x9f1d083b1c88e90b
	.xword	0xd8d2763f5b064121
	.xword	0xbe842f902594405f
	.xword	0xf711fade0083a80f
	.xword	0x9e16c68c557fbba8
	.xword	0x2405b14f777ab6f5
	.xword	0x6268165d559c411b
	.xword	0xf61ccaabfe140ad0
	.xword	0x4ad077b13c1232c3
	.xword	0x2986852b06f62a78
	.xword	0x67929ad8545bcbfc
	.xword	0xb353557a23b40778
	.xword	0xfa71f0a5ac3c4140
	.xword	0x7307e61fda902a12
	.xword	0x3c1a0e25cc56547c
	.xword	0x0c769fdac24febf2
	.xword	0x0bf2e5a067c78fd9
	.xword	0xa9d09764700dc2f5
	.xword	0x865d38e64bf4e1a4
	.xword	0xc944855ac8090fd1
	.xword	0x47f2c3d6b718b337
	.xword	0x8ccc6ca7d3b88c0c
	.xword	0x79f582326bdaa42c
	.xword	0xd976e98b8f0fea7a
	.xword	0xcc1b3344007b2a41
	.xword	0xca5d4925dc1abbd2
	.xword	0xd37ce4296bfc2509
	.xword	0x94b248b79bd27337
	.xword	0xcaae87ae92163698
	.xword	0xbb028c932fdbecad
	.xword	0x9dd15209e6a12e40
	.xword	0xde18b4602e4d6f43
	.xword	0x0f95acf080d307a0
	.xword	0x70abefd3c2d2f229
	.xword	0x6be2e429e08a3fc2
	.xword	0xf32c746aaee8e2ef
	.xword	0x27062a506e50c866
	.xword	0x54d1b784096ecc38
	.xword	0x5919f87bdf091d95
	.xword	0x771ea1b00fb2c436
	.xword	0x35a498e03567419c
	.xword	0x8b75791dcf645ce1
	.xword	0x417769e779dd041b
	.xword	0x259bf8eef5104527
	.xword	0x71dccb687c1017b7
	.xword	0x216ba61a21e84878
	.xword	0xff3a2ecd3049ad99
	.xword	0xdf107da5f4db0d45
	.xword	0x9e5faca8112fc278
	.xword	0xa4b16941c71eee5f
	.xword	0x9453674c0af9d5aa
	.xword	0xc996c53dfd0e4db1
	.xword	0x8ff464a396b38a14
	.xword	0x33ea4bd9136765bb
	.xword	0x154ade540ab1f7c0
	.xword	0xf72dae00227c9d93
	.xword	0x921168c1c92a418b
	.xword	0x0e2d6462d8b066e2
	.xword	0x0d75e0bf2f527087
	.xword	0xb49f8f7b9dca6a64
	.xword	0x87f2b708b45c8a60
	.xword	0x2807894c3df394fe
	.xword	0xbfcb81cca40aa1e8
	.xword	0x3c4b7d20471b70ae
	.xword	0x795e0534af38bba3
	.xword	0x54cc708c33d3a3d4
	.xword	0xc5a051ad481f067a
	.xword	0x7912511c32380208
	.xword	0x156f823b2c4363f4
	.xword	0x869b8e6f78b05f3f
	.xword	0x25298057ff4a68a4
	.xword	0x96f63f9ab67625d4
	.xword	0x2091e25d2410364e
	.xword	0x8d31445566d931d2
	.xword	0xc68c489d78c46c79
	.xword	0xd198b822d1db1ba3
	.xword	0x15b18f446079358f
	.xword	0x482238fb0ff882ca
	.xword	0xb650b031f1fe9de6
	.xword	0x29dcd1b73991d24f
	.xword	0x318f19f888789114
	.xword	0xf4b6ffe69c3061e1
	.xword	0x614c9c53388c54c1
	.xword	0xa5e0705916fce9bf
	.xword	0xbf92abea8299c262
	.xword	0xace6df5f66576a1e
	.xword	0xe87538313d805adc
	.xword	0x4af2159d3c13040b
	.xword	0xf66e75dbd83bf559
	.xword	0x2c582e243a8df547
	.xword	0x106fa87eb2d30726
	.xword	0x79963ba8a6ad604a
	.xword	0x4dd581eb8d8aef41
	.xword	0x66555b6ff144e041
	.xword	0x7d18cae68ef5c644
	.xword	0x82640bd02c6df133
	.xword	0xb6e67cdb975505ea
	.xword	0xb6df479919302604
	.xword	0xbf5eecd76023f673
	.xword	0x9488f68e84372bf6
	.xword	0x3f51ad7ea92e800b
	.xword	0x75d61d203a5c7ac0
	.xword	0xc2f394948a2b8853
	.xword	0xca2d0f360047351d
	.xword	0xc22669ccb54ee9de
	.xword	0x6f0b6004dd7a3340
	.xword	0xe5e45160e720c459
	.xword	0x20e40c35286085c0
	.xword	0x797f04d16cc0561c
	.xword	0xb780c26952fdcfd1
	.xword	0x606d1e266dc8e607
	.xword	0xc93d012d547b6781
	.xword	0x5b999ca6ce60dd35
	.xword	0xb3759b60bb2c6874
	.xword	0xb785a314e04f81e9
	.xword	0xde551f02e88c7233
	.xword	0xeb96275e6fe7b300
	.xword	0x1f97fb58c2f296a4
	.xword	0x01bee586f11290e2
	.xword	0xe9737484d3fa5f87
	.xword	0x354c557aecdffde9
	.xword	0x24523db7660ba63a
	.xword	0x5047b6aece862eea
	.xword	0x6aa2da0d935153cc
	.xword	0xde5348473e2b845e
	.xword	0x3497c45bad703f51
	.xword	0x52eee5efee473e09
	.xword	0xf9a719183bf96bb5
	.xword	0xe6692c6de5fa0e6a
	.xword	0x64013ac5938b6d6f
	.xword	0xcffec269cc57682d
	.xword	0x90653c1182769257
	.xword	0x40895236c0ad4714
	.xword	0xd95741d8efa17d74
	.xword	0x40622f5536988957
	.xword	0xf489ef5df8bb9c8b
	.xword	0x8bca6d18e1c2c9c2
	.xword	0xc1bb9d06be560e05
	.xword	0xe8f3d74008efe022
	.xword	0x0a885176457f8be6
	.xword	0x164e2c4945f37cbf
	.xword	0xac4e8463cd810448
	.xword	0x315798056443ee50
	.xword	0xb85eb90769015e4e
	.xword	0x43f7104b68cb3eef
	.xword	0x68be04b0207f9d0a
	.xword	0x259bc4ea9d64d08f
	.xword	0xcc2eb59392453261
	.xword	0xa2a3bd9e1e099dde
	.xword	0xf15138714c6cd4e9
	.xword	0xf26091ef56fee69e
	.xword	0x18d7188a234641a7
	.xword	0x2ab6da1640a5fb73
	.xword	0x223bd0379ed7d1bf
	.xword	0x84f37715fb5e9530
	.xword	0xa264c02d187dbad1
	.xword	0x00ee444c19521f1a
	.xword	0x99705506170a3746
	.xword	0xe0e1ffb6b4046c0a
	.xword	0x7e89e82fcd019699
	.xword	0x2eb66c695ecba4aa
	.xword	0x37c7a0636f2350aa
	.xword	0x0203b78cc5c7835d
	.xword	0x80a54bb3c2ef362d
	.xword	0xd298078fd720d754
	.xword	0x3f62849a745d266a
	.xword	0xd41d6ea1de954e82
	.xword	0xa43848bc0d74cec3
	.xword	0x1a1e14fbf4846c62
	.xword	0xd4813877244508a3
	.xword	0x51f9fa53a8b2977c
	.xword	0xb8db8c96a208b646
	.xword	0x925817772e604e6d
	.xword	0x285767aa7e60c1a8
	.xword	0xda1140476bd3f272
	.xword	0x01da9895a07dec95
	.xword	0x295f9379f78195dd
	.align 0x40000
	.data
data_start_6:

	.xword	0xeaa2b8c337704b09
	.xword	0x7eb7c4c9783aa83f
	.xword	0x0f5d0aa74297823a
	.xword	0xbee271118df4b716
	.xword	0x13d2365fd357ac27
	.xword	0x1ed726e9b8a48045
	.xword	0x3a8487f0d8cb0bea
	.xword	0x74b9d9f90dea7f8a
	.xword	0x0980604ab391162b
	.xword	0x8de10d7420daae1e
	.xword	0xa133cb5db7a598ec
	.xword	0xb58d4576f8944cc6
	.xword	0x4e9db90f0f2164c4
	.xword	0x9f19a4a9af411c5e
	.xword	0x4f90371dfdb3ce75
	.xword	0x1d8dfd6fc449618c
	.xword	0xc8944311be084f00
	.xword	0x6a3da301daf872ff
	.xword	0x7b3e4c8dbeb36389
	.xword	0xd665f24520f20643
	.xword	0x5b55a5b649788c25
	.xword	0xf7a84870718cba90
	.xword	0x7e0c1064b400a2c1
	.xword	0x42f054829e608b5c
	.xword	0x8a0f93407f1ada56
	.xword	0x6688f7317fbea7d3
	.xword	0xec2529e5832dece9
	.xword	0x7b09b466b044be30
	.xword	0xb98a1ce11066da70
	.xword	0x8803a2a0e234a299
	.xword	0x7b7e133b4c1d2024
	.xword	0xa7b203ccb07a461a
	.xword	0x99195eb2b695b947
	.xword	0x896c63ec4c5a12c0
	.xword	0xed5e49de821a1ef2
	.xword	0x2d3385d31f80420c
	.xword	0x01ff1196b5981f79
	.xword	0xbf63a048be337c3c
	.xword	0xaff8304a6fd0ec27
	.xword	0x7525985c23e3551e
	.xword	0x6482326642f7609c
	.xword	0x57947c3af73291fe
	.xword	0x401f8763c214887c
	.xword	0x49be51c05056bcee
	.xword	0x126815b24ad06455
	.xword	0x5e8c6b97bff486dd
	.xword	0x775e331204ce120f
	.xword	0x019b48f5e7740031
	.xword	0xf8dbaf8804f07154
	.xword	0x349e82d91ad3dd55
	.xword	0xc1d0564d477c0996
	.xword	0xa7b2a98e2ced609c
	.xword	0x0686cda99bf6cb37
	.xword	0x8e8cbf8f5b04acd5
	.xword	0x1ea90762f54f5024
	.xword	0x770bdb129f23e6dc
	.xword	0xb41324ccdfff5936
	.xword	0xf38a03616a9e5579
	.xword	0xbca508eee8f53cbb
	.xword	0x29fea05f5546c11b
	.xword	0x9a495edfd55a9c1d
	.xword	0xbf12119c5f915501
	.xword	0x55e7974fa4828ff6
	.xword	0x6737d94e89317d88
	.xword	0xe9a19d2f3fb8f2f3
	.xword	0x721099882e69da82
	.xword	0xf9815cbee3ce190f
	.xword	0x18528b274243087a
	.xword	0x1964316d2e316c66
	.xword	0x0da67cf94ade8286
	.xword	0x65a0f087eaab1c8a
	.xword	0x1b47e56cf0f52c72
	.xword	0x49503b603cd9d0f9
	.xword	0x701a75642f2ffb3d
	.xword	0x0812f0b0f9a250f1
	.xword	0xa2142baf6b1e3321
	.xword	0x11ca3882e99901f2
	.xword	0xfb21a783eea85f17
	.xword	0x997084190c2fe0cb
	.xword	0x735943deddfcf2ff
	.xword	0xa99d0be45039782e
	.xword	0x98e63667b188e614
	.xword	0x62489b4a01408b2e
	.xword	0xfb7e63fc25187db3
	.xword	0xfd46cd37dbd2a611
	.xword	0xf562e3026bf9934b
	.xword	0xb84f518cd60c0859
	.xword	0xfb69967908b3bc55
	.xword	0x5db7840622dee646
	.xword	0x7d06a4dc07dde75b
	.xword	0x6c9778631df9ff80
	.xword	0xce1e8b273ab6c59a
	.xword	0x711a138eddc723da
	.xword	0x027eb03c56f42813
	.xword	0xcc6d78cbbc1f981d
	.xword	0xa4439f32aca1fec0
	.xword	0x1d417caba68d6c53
	.xword	0x949b5fdb206b58cb
	.xword	0xf804e485e7bf5ba1
	.xword	0x3180c36592fc26de
	.xword	0x72004ce82954a6f5
	.xword	0xa056b12382085373
	.xword	0x97882ba1766ac638
	.xword	0x39dacbcf1b0bab8d
	.xword	0x5b2df58a8ca3ddce
	.xword	0x108741e910c871a9
	.xword	0x8b494f7635cb8125
	.xword	0x1a87ec0944a43154
	.xword	0x66ed665664f0dbfe
	.xword	0xe15ddd1c53afe433
	.xword	0x69f3e2c4e699498a
	.xword	0x8b267b37709b92ec
	.xword	0xc3ca3064f19ba230
	.xword	0xd62d999fd5f603ec
	.xword	0xddb4178b1696c113
	.xword	0x24d944981222a87f
	.xword	0x33c831a42e53e0e6
	.xword	0xbb8a062e340693d1
	.xword	0xa6372c9e5c16216f
	.xword	0xfc10c645afb636c7
	.xword	0xfd91794c0137cdb3
	.xword	0xcc4ea633890cd856
	.xword	0x60845039d50d5a1d
	.xword	0x12d50e0f0e36ec68
	.xword	0x7221f18bce24b607
	.xword	0x58c4157db7dc27c6
	.xword	0x57f3484af9cc18a6
	.xword	0x625361811ddccbc9
	.xword	0xca1daf3253178c07
	.xword	0x83c39345210d243d
	.xword	0x2352c2bfa0ef3595
	.xword	0xebb7b7f12ee28e33
	.xword	0x351e3b871ebcab90
	.xword	0x111c948202a98e2a
	.xword	0xb948fc928f5e15cd
	.xword	0xb8c72b3a3aea44ad
	.xword	0x3d4b37ba88b9fd18
	.xword	0x1eb5b8e2ac7d9410
	.xword	0x784cff9711385468
	.xword	0x11dbe360ed2bf5fc
	.xword	0x5de1c9dba3c5347d
	.xword	0x2ee33da68a2880b8
	.xword	0x5f72f9f296c86c69
	.xword	0xa958d30d8c2f8797
	.xword	0xfa07e644f7aaa59d
	.xword	0x5f8af235c6c6dc0e
	.xword	0x75d76a1ca59a3dc3
	.xword	0xb2f10a213f365bee
	.xword	0xb7ed836214eb66e7
	.xword	0x7fbd2a0ae9c85dab
	.xword	0x24ae6cbf8a577984
	.xword	0x5f4f0222da617212
	.xword	0x1fba8255127dc6d5
	.xword	0x29248e036b5aa4eb
	.xword	0x7b73cd5bfbd71bfc
	.xword	0xa0b433f82adf8c49
	.xword	0xbf33271c035495ec
	.xword	0xf6c07251c9a6a0e7
	.xword	0x16e12a7f198e17eb
	.xword	0xfc0ac61cd244794d
	.xword	0xbd66f8e03daeba46
	.xword	0x6ccda266b81b772d
	.xword	0x622cde03d43e48c7
	.xword	0x5f4b073264a2a121
	.xword	0x7c5358c4d1bce94d
	.xword	0xa429838be75a9be8
	.xword	0x7a453ac35efab590
	.xword	0xa1ad7460b5e1c283
	.xword	0x9adaa0998359be53
	.xword	0x79cda6845ac5d8d3
	.xword	0x5c53ef77c7183140
	.xword	0x5253cb453ad152b7
	.xword	0x6149ce3f53866c5d
	.xword	0x7a8c46469724d0cd
	.xword	0x09001fe68d7c6b90
	.xword	0x15e42f2b4f46ac65
	.xword	0xb53718143875f19d
	.xword	0x3c5be12469254c39
	.xword	0x2f7ec0dd2b97eded
	.xword	0x536a879724c7c823
	.xword	0x29876eec95de4046
	.xword	0x5f8301aa35e87b36
	.xword	0xe9aee27b4087bdc6
	.xword	0x64f4cfcb64d99d13
	.xword	0x5aa9f326d037eb9f
	.xword	0xb833f452379d6270
	.xword	0x22d43dccf11a1948
	.xword	0x6a741fc09b19db20
	.xword	0x0a380f389468f70e
	.xword	0x70b1cb7999509566
	.xword	0xb72313034342b6b2
	.xword	0x2d3ba7860dbea6e8
	.xword	0x69ce8798ee8b6932
	.xword	0x0124cc31d7f4af3b
	.xword	0xb8df5a0dad3bdcf5
	.xword	0x872a75da42c0fd99
	.xword	0x321e5a3cb11fc61c
	.xword	0xd5fe110b0edbdc8f
	.xword	0x7870f71e0dcdd11a
	.xword	0x1be1d93655373aad
	.xword	0xa79661518e71cf60
	.xword	0x8e2d329fa1d93704
	.xword	0x3fe874207219fa02
	.xword	0x9297fcd0f3f6990a
	.xword	0x00737949b5dde0ae
	.xword	0x236daefc21daafe2
	.xword	0xc542adcb21ac09d4
	.xword	0x6d3d02f616625336
	.xword	0x1f07bebd667eb1ac
	.xword	0xb76133353ffeb86b
	.xword	0x263cbd270ed04bb8
	.xword	0x89786d97b932fb8b
	.xword	0x8c2e685be1e4f7b4
	.xword	0x234c26cbf2b4a74d
	.xword	0xc9e25e30a7a29076
	.xword	0xce992774ef26b662
	.xword	0x4f99b4cfb234d35d
	.xword	0xabc7e28a32fc8087
	.xword	0xe0f0e3260c191724
	.xword	0x62e860f10fa71223
	.xword	0xb606e7dd507c67a5
	.xword	0x6e08d0c98d195a28
	.xword	0xc85a2b3511574264
	.xword	0x68a63b03f44f7ca8
	.xword	0x2ca1cc510f4a8236
	.xword	0x7752bf25e8a6d51e
	.xword	0x7fda861e981c6382
	.xword	0xf70100f041f26014
	.xword	0xc5505bf5f8494cb3
	.xword	0x43301065d48fcf11
	.xword	0x25f41fdca81d1c1b
	.xword	0x3158de84557c2df9
	.xword	0xe175573d1dfd4061
	.xword	0x33d8cda2d1bbeb69
	.xword	0x483d26ceb31949d4
	.xword	0xf893651f61029dae
	.xword	0x76d5b44f8d1fb4a3
	.xword	0xcd977d6b45da1854
	.xword	0xb39513d74c6e8483
	.xword	0x5c43dbbe8335ddaa
	.xword	0x6fd436e19ef6dd4a
	.xword	0x457da34963938fe1
	.xword	0xfb98c85f7968a1a6
	.xword	0x09e8a9cc6aa44aed
	.xword	0xb1fcbd6c265d10af
	.xword	0xe570efbaf12900fd
	.xword	0xd71624708c849e3d
	.xword	0x4468ec4fc9eb9b49
	.xword	0x440988c74f95f0e0
	.xword	0x3c5c54631ba2d73d
	.xword	0xe14ad76141cc5f3f
	.xword	0xae1b4ac3803a325a
	.xword	0x34a2468f219fd4d6
	.xword	0x6df04d99c7e7cfd4
	.xword	0x37a5b8691642e0bb
	.xword	0x09680364b0c8d5d4
	.align 0x80000
	.data
data_start_7:

	.xword	0xca585654dfa29ae1
	.xword	0x0d94933f2ebf94a1
	.xword	0xf2e7b074618f0114
	.xword	0xd59b02536eda1a1b
	.xword	0x9553ee311a438f6b
	.xword	0x243d9c30bf710d3b
	.xword	0x438b63cb82087f50
	.xword	0x84ac1c1c47a2af6f
	.xword	0x9032ce5e6dea72d3
	.xword	0x056214549ac1b0c1
	.xword	0xa83697884f179f31
	.xword	0x6e44c2a2cb2ae0b2
	.xword	0xbfd83daee6229383
	.xword	0x185c5339d5de057d
	.xword	0xcd80b42cc6e8cd58
	.xword	0xa679ca25f6666462
	.xword	0xd16cbd80bd40d21a
	.xword	0x969764c3c50ac832
	.xword	0xef718ed41c5d8e75
	.xword	0xd16a28cb29f1927e
	.xword	0x063c675173970312
	.xword	0xf8ac0a2b8afe9bf8
	.xword	0x96d1a14de81b75c5
	.xword	0x10f8696cf7b318b4
	.xword	0xcacf9f29b41c3181
	.xword	0xbfcb6ebc29e3dfec
	.xword	0xaafe8fc2f9ef49a8
	.xword	0x9393733a15a25b3c
	.xword	0xf87bbf38132324e4
	.xword	0x2f100f98bad0aa1e
	.xword	0x67bd073e76eb1bad
	.xword	0x22f27af50207451f
	.xword	0xfb7b896748344984
	.xword	0xd28fed7927be1772
	.xword	0xa261e131658bcd99
	.xword	0x5512772dd05f4fa5
	.xword	0x0e89846bd79989db
	.xword	0x8afeab9d4ebca702
	.xword	0x11b80ad7cc57346c
	.xword	0x0fe85e7af8c26f0f
	.xword	0x722f6cdcfb37ae6c
	.xword	0xd72f2940bea4df44
	.xword	0x000301adf24ec514
	.xword	0xa83040338abf515b
	.xword	0xec09794199b8d468
	.xword	0xa3ddeeb651b2f512
	.xword	0xb656c7c027702f49
	.xword	0x52303d9db31f1fec
	.xword	0x8f7193b4fff666d6
	.xword	0xf9a034e15bc96175
	.xword	0xc93f48b8515330f1
	.xword	0xea13255b50fa0f1e
	.xword	0x1e4191b1d72c9d4f
	.xword	0x51a0d21c1133246f
	.xword	0x73fc03eb775d2502
	.xword	0x061e46058200cf1c
	.xword	0x47ad9e96b5c85704
	.xword	0x5083f7dcd9d19342
	.xword	0xe993f6b077aa2863
	.xword	0xd300ca47236c8e68
	.xword	0x9ec19d25a9b85b49
	.xword	0xd74d27420b2899d5
	.xword	0xc609e032dc9cb317
	.xword	0x2e42ae6d10a3e563
	.xword	0x77a8cffdd1a4a2eb
	.xword	0xd68935e1645761e3
	.xword	0x3a974f0ca7894fd3
	.xword	0x0c7ee2fffa9bba8d
	.xword	0x3e9c7c862b93e28a
	.xword	0x634f46235d5ed68d
	.xword	0xee86c6ec57f51d01
	.xword	0x7e9b187091280730
	.xword	0xe644bb5e590cd57f
	.xword	0x5d7915379f2f45c7
	.xword	0x5dd185f9a66054d9
	.xword	0x48fd3733ebcb2304
	.xword	0x575c55fbc491a5b2
	.xword	0xde1d7f4a7b5baa7f
	.xword	0x620fc86ed97ca7ce
	.xword	0xa573b5d0bbc9ce5a
	.xword	0xb4084667f4120003
	.xword	0x2832543009bd5007
	.xword	0x39f877f4af3318e0
	.xword	0x2654ef98de65c925
	.xword	0x2e118f897cc478ac
	.xword	0xbab66fa3e570ddbc
	.xword	0x96610cbbefcda4c2
	.xword	0xcf84fe5f7a779045
	.xword	0x37ea39ce2b239404
	.xword	0xf351ef0f08ddc35d
	.xword	0x17c79c4df71977c0
	.xword	0xc3dde863ef88e873
	.xword	0x175d619c7110b7b0
	.xword	0xfad7616fe8e94912
	.xword	0xc9c9c9b4b00b6b02
	.xword	0xfda32da4829a6d75
	.xword	0xff4d1f2e95abfe13
	.xword	0x3f5498607ed81471
	.xword	0x5acea5960e9530ba
	.xword	0xb550980ff07c4aa6
	.xword	0x323880d3264d09b5
	.xword	0xbfd457875de52ba7
	.xword	0x4fdcf3654eb38623
	.xword	0x3a09251e2ea1b420
	.xword	0x1b540a294c1db817
	.xword	0x99851f277f9aefd8
	.xword	0x327e652875188034
	.xword	0x1e761396d82f44e0
	.xword	0xab71afdc727a9816
	.xword	0xe234fa1d06fd88b3
	.xword	0xaa5144525d5e6385
	.xword	0xeedcbc6106bf6c13
	.xword	0x480cda87d3600be3
	.xword	0x160610a71f974e54
	.xword	0x8d6b45c22351947d
	.xword	0x1657e1d8d7880b17
	.xword	0xc28bdc2ecaa69959
	.xword	0xbb460f222d21b658
	.xword	0x1267f9a204be50ee
	.xword	0x3f72691a45e1d3b6
	.xword	0xda74842e27066f76
	.xword	0xfdeb5dbaefd7893d
	.xword	0x901f02c078d4db16
	.xword	0x46184f161ede930c
	.xword	0xf36335e0b892eb18
	.xword	0x8788e53b51ee2579
	.xword	0x4c6a6202aa095c6b
	.xword	0x30c9e40d25c39f63
	.xword	0xff7e64d9ac4362fa
	.xword	0xa96d72a6929ef769
	.xword	0xf171d7d3ed8918ef
	.xword	0x0f9ec9f71c9a3bca
	.xword	0xcb4325f0b1aa0826
	.xword	0xeb940941d2bfccaa
	.xword	0x322116f7ce987230
	.xword	0x36dcbbdd6db320ee
	.xword	0xf3e86315890b62ae
	.xword	0x77e90b3f239404ac
	.xword	0x84ba680a9e4fdef8
	.xword	0x719bc42a744d912f
	.xword	0x749138dbeb406d3c
	.xword	0xfc4269f71f54c29b
	.xword	0x7335ead3f3c4dd36
	.xword	0xd1ed1faed1483c4a
	.xword	0x740b5d7f577265fd
	.xword	0x743af1e28c497385
	.xword	0x5f03baaebfd4e07a
	.xword	0x73069b01876bed93
	.xword	0x3f0204e0ecf9f390
	.xword	0x674eafd2ee3d90bc
	.xword	0x4f1f00828ff4e0d2
	.xword	0x7951796d021cc0ae
	.xword	0x7e2a1ab6e789c2ae
	.xword	0xeef6bed61312b7a0
	.xword	0xc2d655a084c9a89c
	.xword	0x6a78c026eeda01d5
	.xword	0x91a5c7dc252580ca
	.xword	0x106b17a7a6ea0f51
	.xword	0x78e3e3a642267269
	.xword	0x9529987dfce94eb8
	.xword	0xa57b9f6a28c2948b
	.xword	0xb0933218476de63c
	.xword	0xd46849585aaa9b80
	.xword	0x3104b98ed7c94813
	.xword	0x84650d6e48e6dbb9
	.xword	0xce1a4cc02d375aee
	.xword	0x635db8f1f5287385
	.xword	0xfa6afda8aad8be05
	.xword	0x48f591f7d5009d9d
	.xword	0x705ce77816d12746
	.xword	0x45332661628cc52a
	.xword	0x2a14db53c39ed14f
	.xword	0xfd46bd4a439aeb1b
	.xword	0xd46382fe5343339f
	.xword	0xcb4db10f2f2bf7fe
	.xword	0xe7e2fb08405572a9
	.xword	0xf2fe5ca2b15e2bfc
	.xword	0x8f1576b3a53f07c3
	.xword	0x50e5716d51d0249b
	.xword	0x57d4edd4d35b1e06
	.xword	0x945965ee1c75108d
	.xword	0xfd9879497afe3d27
	.xword	0x7f50b07830719edf
	.xword	0x0d7d3888ea9c5071
	.xword	0x2a223be864f5bf18
	.xword	0xcb8e23a83175b220
	.xword	0x7c6c6ba50608d9c6
	.xword	0xde61a0e2ff33afb7
	.xword	0x3377136b2dd46a76
	.xword	0x0fc9c3319c22c422
	.xword	0x53d9c2295bf24c45
	.xword	0x23423cfb16641b0d
	.xword	0x7a5f2c6e651682f0
	.xword	0xfbc8af0598b3ed9c
	.xword	0x89aef0e6905ac000
	.xword	0x079d5e64608f10b2
	.xword	0x29ce84ee63c32edb
	.xword	0xbab3b6d5a9904a16
	.xword	0xe1a543a8146e5122
	.xword	0xfe4964ff2b4f60d2
	.xword	0x83236754dfc16d5e
	.xword	0xba02c24a1f8291e0
	.xword	0xdcee1b15bac6dece
	.xword	0x48e5000998b9112c
	.xword	0xecea2e8d2086650d
	.xword	0x7829952aaefd9048
	.xword	0x5938ac82ac517e29
	.xword	0xb1b6337a3e119d04
	.xword	0x816aa8e3857edc28
	.xword	0x1abef8a8c158603e
	.xword	0x6d63a41e94cac645
	.xword	0x1e39c9b8866d7816
	.xword	0xe1d134def8473751
	.xword	0xf472ff24c31a86d1
	.xword	0x05409910199faf9e
	.xword	0xe5eb8ea7c051d680
	.xword	0x2aac762527662d00
	.xword	0x05c5f3e5075d7170
	.xword	0x3a16a50b018f268e
	.xword	0x290eff454f7f49c6
	.xword	0x1cea5425462e1a7f
	.xword	0x5f85264d0c381eeb
	.xword	0xbc192ed9c6e48092
	.xword	0xe6dd1e88d3b211cf
	.xword	0x7c544024995aeaea
	.xword	0xc2b2dabe3bd0dc7a
	.xword	0xa97dcfbe8a2103cf
	.xword	0x21ae429198c6dc38
	.xword	0x1e204133ea54653f
	.xword	0x2040ca9fdae00061
	.xword	0xacfcb9af432dce04
	.xword	0xa82b9bf391c16f07
	.xword	0xe097a26437a21bdc
	.xword	0x1786c46206790dd7
	.xword	0xcc49bf37c32892dc
	.xword	0xa14817e8ed6cc958
	.xword	0x8fe3580b11de6b0a
	.xword	0x97081a0f74f431ee
	.xword	0x615b55f2e500ca3f
	.xword	0xdf653ad9cccee737
	.xword	0x597326989bfe5ec0
	.xword	0xe7f88a2ad7aac38e
	.xword	0x7c8e3ab769591e9a
	.xword	0x79b18023b9b03694
	.xword	0x35cf9b1797d0826a
	.xword	0xa015dbc2874feb0f
	.xword	0xb259365856d5cbc1
	.xword	0x0335dfb1da8066d2
	.xword	0xe61797c2642203ed
	.xword	0x49f6cbeaa816cff6
	.xword	0x5a901abe89195fca
	.xword	0x91af8db0f6ae8a60
	.xword	0x6de8b423e28b3b50
	.xword	0x567582545d89f576
	.xword	0x3d20aaf79f68627d
	.xword	0x41a0b92ad292fc4b



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
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "18'brr 0000 00rr 00rr rrrr");
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
!!#   //IJ_set_rvar (Rv_hpstate, "12'h1rrr rr0r r0r1");
!!#   IJ_set_ropr_fld ("diag.j", 72, Rop_hpstate, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 73, Rop_hpstate, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 74, Rop_hpstate, Ft_Simm13, "13'br 1rrr rr0r r0r1");
!!# 
!!#   // TL & GL write data
!!#   IJ_set_rvar ("diag.j", 77, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 78, Rop_tl, Ft_Rs1, "{12}");
!!#   IJ_set_ropr_fld ("diag.j", 79, Rop_tl, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 80, Rop_tl, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_rvar ("diag.j", 81, Rv_gl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 82, Rop_gl, Ft_Rs1, "{14}");
!!#   IJ_set_ropr_fld ("diag.j", 83, Rop_gl, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 84, Rop_gl, Ft_Simm13, "13'b0 0000 0000 0000");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 86, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 89, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 90, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 91, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 93, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 95, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 96, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 97, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 98, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 99, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 100, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 101, th_all, "\tldx\t[%%g7], %%fsr\n");
!!#   IJ_printf ("diag.j", 102, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 
!!#   IJ_th_fork("diag.j", 105,0x2, 0x4, 0x8, -1);;
!!# 
!!#      // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 109, th_2_3, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
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
!!#   IJ_th_join("diag.j", 116,0xf);
!!#   IJ_th_start ("diag.j", 117,Seq_Start, NULL, 1);
!!#   IJ_printf ("diag.j", 118, th_all, "\tta\tT_GOOD_TRAP\n");
!!# 
!!#   IJ_printf ("diag.j", 120, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 121, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 123, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 124, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 126, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	  IJ_generate ("diag.j", 174, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 178, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 182, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 186, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 190, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 194, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 198, th_all, $1);
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
!!# 	  IJ_printf ("diag.j", 213, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_I %ropr  Rop_hpstate
!!# 	{
!!# 	  IJ_printf ("diag.j", 219, th_all, "\tta\tT_CHANGE_HPRIV\n");
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
!!# 	| tWRPR_TL_I %ropr  Rop_tl
!!# 	{
!!# 	  IJ_printf ("diag.j", 232, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_I %ropr  Rop_gl
!!# 	{
!!# 	  IJ_printf ("diag.j", 236, th_all, "\tmov\t%rd, %%r14\n", Rv_gl_lvl);
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
!!#           IJ_printf ("diag.j", 290, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 291, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 292, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 293, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 294, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 299, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 300, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 301, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 302, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 303, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 304, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 318, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 319, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 320, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 321, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 322, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINTR %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_printf ("diag.j", 328, th_all, "\tsetx\t0x%rx, %%g1, %%o0\n", Rv_intr_vect);
!!# 	  IJ_printf ("diag.j", 329, th_all, "#ifdef PORTABLE_CORE\n");
!!# 	  IJ_printf ("diag.j", 330, th_all, "\tmov\tPORTABLE_CORE, %%g1\n");
!!# 	  IJ_printf ("diag.j", 331, th_all, "\tsllx\t%%g1, 10, %%g1\n");
!!# 	  IJ_printf ("diag.j", 332, th_all, "\tor\t%%o0, %%g1, %%o0\n");
!!# 	  IJ_printf ("diag.j", 333, th_all, "#endif\n");
!!# 	  IJ_printf ("diag.j", 334, th_all, "\tta\tT_SEND_THRD_INTR\n");
!!# 	}
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
