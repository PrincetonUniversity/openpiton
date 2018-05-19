// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_0_s2.s
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
   random seed:	86797868
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

	setx 0xc6e645fb048d245e, %g1, %g0
	setx 0x294731ac81f24a3c, %g1, %g1
	setx 0x900da2aed02b54f0, %g1, %g2
	setx 0x491f55e86c9ca170, %g1, %g3
	setx 0xa02d42f01c9329a4, %g1, %g4
	setx 0xa18d324a6d105b29, %g1, %g5
	setx 0x28e5a1d6809d2f1a, %g1, %g6
	setx 0x250469d95be1f8ca, %g1, %g7
	setx 0x2a56be87627be9f9, %g1, %r16
	setx 0xe8e2741f0ad196bd, %g1, %r17
	setx 0x5f18f22ad945ddc5, %g1, %r18
	setx 0xcedeafe3a2fdb3db, %g1, %r19
	setx 0x32772096d00587ef, %g1, %r20
	setx 0x2f2af72805530965, %g1, %r21
	setx 0x4a736c3da11b9dd0, %g1, %r22
	setx 0x9b1fa4051ab5657b, %g1, %r23
	setx 0xa5f57b633ae721d7, %g1, %r24
	setx 0x004177c5e7bb74a3, %g1, %r25
	setx 0xd661238a46b98fc4, %g1, %r26
	setx 0x2a41ff3a08656d3a, %g1, %r27
	setx 0x3ad81dca58764ccf, %g1, %r28
	setx 0xd1fb072c86f8a718, %g1, %r29
	setx 0xcf940333faf98e46, %g1, %r30
	setx 0xceaf62d792ddf1f5, %g1, %r31
	save
	setx 0x0409cdbc932ddc9c, %g1, %r16
	setx 0x4d2ef2fee38f953b, %g1, %r17
	setx 0x2ceb8b582b227867, %g1, %r18
	setx 0xf4a95634dfabb23a, %g1, %r19
	setx 0x8076c284b34ac1b4, %g1, %r20
	setx 0x962a494c42937001, %g1, %r21
	setx 0xa23c6bfa8370d0b7, %g1, %r22
	setx 0xfc698454a9b75fdf, %g1, %r23
	setx 0x3a1c302ac4dc796c, %g1, %r24
	setx 0xdb935a5fa3ace9a3, %g1, %r25
	setx 0x8196ae42a823e975, %g1, %r26
	setx 0xf97b9842b9b2726e, %g1, %r27
	setx 0xeef4ca4e28bb652a, %g1, %r28
	setx 0x3ac8e3598c2c8122, %g1, %r29
	setx 0xbcbcd1dab525fbb8, %g1, %r30
	setx 0xa4ed5f1b38383982, %g1, %r31
	save
	setx 0x38fafb1229fa52f5, %g1, %r16
	setx 0x9ade74a91539aae1, %g1, %r17
	setx 0x647aac600021d343, %g1, %r18
	setx 0xd868f9f6397011ea, %g1, %r19
	setx 0x7179ed157af2f59a, %g1, %r20
	setx 0x0a8413fedb201195, %g1, %r21
	setx 0xe0d6ae0d39fa4625, %g1, %r22
	setx 0xce51adb39523b167, %g1, %r23
	setx 0x12024b3d744178e9, %g1, %r24
	setx 0x5e079c086bb922fa, %g1, %r25
	setx 0x09b64b995391e849, %g1, %r26
	setx 0xa061c57cc948fec5, %g1, %r27
	setx 0x7cb7767b7b85b594, %g1, %r28
	setx 0x18f905be2b92428f, %g1, %r29
	setx 0x36f12dbc6b13bc71, %g1, %r30
	setx 0x7da0ef1720d953e5, %g1, %r31
	save
	setx 0xc542ba82907fa59d, %g1, %r16
	setx 0x5dd3e7a4c33ee391, %g1, %r17
	setx 0x7a7004479d9e6f93, %g1, %r18
	setx 0x4c3197d3b253d2f9, %g1, %r19
	setx 0x97cb202038ec7bb6, %g1, %r20
	setx 0x61fa98991dd306c6, %g1, %r21
	setx 0x7e685e8c7e1f3660, %g1, %r22
	setx 0xa66f6621515afd98, %g1, %r23
	setx 0x6596b2aeac9547b9, %g1, %r24
	setx 0x3f975a43f4567ffa, %g1, %r25
	setx 0xfc5f725a7c02c144, %g1, %r26
	setx 0xf2206f4d48dbf776, %g1, %r27
	setx 0x6f6a9532609eee74, %g1, %r28
	setx 0xee683cfd3b547a68, %g1, %r29
	setx 0x0876eeec96347d1a, %g1, %r30
	setx 0x9ab1d1346342c581, %g1, %r31
	save
	setx 0x9ebd7a3bfc9e529a, %g1, %r16
	setx 0xc25a4a932dfdbfae, %g1, %r17
	setx 0xb95cadd3fcb8b02a, %g1, %r18
	setx 0xcb81be95d63c4049, %g1, %r19
	setx 0xc77b2c8097baaaf9, %g1, %r20
	setx 0x71e83cc82eab0200, %g1, %r21
	setx 0x0d71ccce25f75f03, %g1, %r22
	setx 0x2db6ada188c3e8aa, %g1, %r23
	setx 0x146be9848f0ede16, %g1, %r24
	setx 0xa8c3c4617cd3a50e, %g1, %r25
	setx 0x291f3918fc0cd9e6, %g1, %r26
	setx 0xbb6c0609459625c0, %g1, %r27
	setx 0x9fcaa89cc4004cef, %g1, %r28
	setx 0x2f14f23019e1eb0e, %g1, %r29
	setx 0x50a15ece8a8c64a0, %g1, %r30
	setx 0x29b262c876d8b43c, %g1, %r31
	save
	setx 0x4ecd5f6194922966, %g1, %r16
	setx 0xfcffaf47b3e93908, %g1, %r17
	setx 0x981d638ac22ac828, %g1, %r18
	setx 0x142343ef7f61d147, %g1, %r19
	setx 0x62754899d7b23403, %g1, %r20
	setx 0x2ecda49819940781, %g1, %r21
	setx 0x924128140cc5b5ec, %g1, %r22
	setx 0xb4c414c3f9c2622f, %g1, %r23
	setx 0xe610de637a5e34bc, %g1, %r24
	setx 0x32a6ebfc89b72438, %g1, %r25
	setx 0xdf88919e6f1eae6b, %g1, %r26
	setx 0x0cf57150c81acd69, %g1, %r27
	setx 0xe228094b68057d77, %g1, %r28
	setx 0x56cd69b10c2ac0ff, %g1, %r29
	setx 0xfbaaf20ca6025320, %g1, %r30
	setx 0x674f67d5b0c20dce, %g1, %r31
	save
	setx 0x1b0c13067b696094, %g1, %r16
	setx 0x91ee2b1331ccf55d, %g1, %r17
	setx 0x7d2aa17d11182b54, %g1, %r18
	setx 0x610286984545a7f2, %g1, %r19
	setx 0x3ac75943056eeb6a, %g1, %r20
	setx 0xe11b9340a71160cf, %g1, %r21
	setx 0x3f0fbf2bf53ad6aa, %g1, %r22
	setx 0xb5ab2347aa0ec487, %g1, %r23
	setx 0x0153dca1ebb5e70d, %g1, %r24
	setx 0x06fdb1f2199a28fc, %g1, %r25
	setx 0xc7432f3090666fa6, %g1, %r26
	setx 0x367f5c6777b9bafa, %g1, %r27
	setx 0xab39ca5af4a0b033, %g1, %r28
	setx 0xd09abbe53c9a1ceb, %g1, %r29
	setx 0x4f8e3e6c7c85300e, %g1, %r30
	setx 0x7b7df3a679dcc3d6, %g1, %r31
	save
	setx 0x87b8d46bb5a80e82, %g1, %r16
	setx 0x8f0955e68dd32863, %g1, %r17
	setx 0x7462ddec9a2382a4, %g1, %r18
	setx 0x08159db2cf3cf6de, %g1, %r19
	setx 0xa0ff8e527b418372, %g1, %r20
	setx 0x38c3f0f60db5010f, %g1, %r21
	setx 0x54097fc88037d941, %g1, %r22
	setx 0x9bc489beb51c8c54, %g1, %r23
	setx 0xbc7f74ca5b4187dc, %g1, %r24
	setx 0x2a5b5658db2e13a6, %g1, %r25
	setx 0xeb5930ff4b29489a, %g1, %r26
	setx 0x957bc389819bbf8c, %g1, %r27
	setx 0xaaef4812ead75c02, %g1, %r28
	setx 0x804c2098bf308704, %g1, %r29
	setx 0x4a8dc68228d1468a, %g1, %r30
	setx 0xa7b51eb396d43539, %g1, %r31
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
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe52037  ! 1: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73ca001  ! 5: SRA_I	sra 	%r18, 0x0001, %r27
	.word 0xb5e560c7  ! 9: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5a192  ! 11: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e560de  ! 24: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9504000  ! 25: RDPR_TNPC	<illegal instruction>
	.word 0xbbe461cf  ! 28: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e4e17f  ! 29: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e42184  ! 32: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe42151  ! 33: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e42059  ! 34: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb73d6001  ! 40: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xbbe5613c  ! 42: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe4615a  ! 45: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5a083  ! 46: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x10139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0fc  ! 53: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbc15e0eb  ! 54: OR_I	or 	%r23, 0x00eb, %r30
	.word 0xb7e4204a  ! 55: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5213e  ! 59: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde4a11f  ! 60: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x899560eb  ! 61: WRPR_TICK_I	wrpr	%r21, 0x00eb, %tick
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81982959  ! 84: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	.word 0xb1508000  ! 88: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e56162  ! 93: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8594e0e8  ! 94: WRPR_TSTATE_I	wrpr	%r19, 0x00e8, %tstate
	.word 0x9194a06b  ! 97: WRPR_PIL_I	wrpr	%r18, 0x006b, %pil
	.word 0xb1e420f7  ! 98: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e5a0f7  ! 102: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5e086  ! 103: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5615c  ! 109: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbd350000  ! 111: SRL_R	srl 	%r20, %r0, %r30
	setx	data_start_4, %g1, %r17
	.word 0x91946021  ! 113: WRPR_PIL_I	wrpr	%r17, 0x0021, %pil
	.word 0xbbe52037  ! 117: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e5e0b1  ! 118: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5a0ba  ! 119: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe460f0  ! 127: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb551c000  ! 128: RDPR_TL	<illegal instruction>
	.word 0xb3e4610b  ! 129: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbf3d1000  ! 134: SRAX_R	srax	%r20, %r0, %r31
	.word 0xbde4a026  ! 140: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4e0ef  ! 144: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4e137  ! 147: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb68c60bc  ! 150: ANDcc_I	andcc 	%r17, 0x00bc, %r27
	.word 0x8595600a  ! 152: WRPR_TSTATE_I	wrpr	%r21, 0x000a, %tstate
	.word 0xb9e56010  ! 155: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb50c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0xbfe5a1d6  ! 158: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4a1f8  ! 159: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x9194205c  ! 160: WRPR_PIL_I	wrpr	%r16, 0x005c, %pil
	.word 0xb3e4a0bf  ! 161: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb17c4400  ! 162: MOVR_R	movre	%r17, %r0, %r24
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e520c0  ! 164: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5a197  ! 169: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde42129  ! 170: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7518000  ! 172: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c19  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c19, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5e1ca  ! 177: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe5a092  ! 178: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8d956083  ! 181: WRPR_PSTATE_I	wrpr	%r21, 0x0083, %pstate
	.word 0xbab4a1a1  ! 182: SUBCcc_I	orncc 	%r18, 0x01a1, %r29
	.word 0xbf480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839520d5  ! 195: WRPR_TNPC_I	wrpr	%r20, 0x00d5, %tnpc
	.word 0x91946087  ! 198: WRPR_PIL_I	wrpr	%r17, 0x0087, %pil
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e56044  ! 204: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf50c000  ! 206: RDPR_TT	<illegal instruction>
	.word 0xb5e5215a  ! 209: SAVE_I	save	%r20, 0x0001, %r26
	mov	2, %r14
	.word 0xa193a000  ! 212: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e460df  ! 214: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf520000  ! 222: RDPR_PIL	<illegal instruction>
	.word 0xb7e46020  ! 223: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	.word 0xb9e56080  ! 231: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9520000  ! 234: RDPR_PIL	<illegal instruction>
	setx	data_start_6, %g1, %r18
	.word 0x9195e145  ! 239: WRPR_PIL_I	wrpr	%r23, 0x0145, %pil
	.word 0x8995207d  ! 243: WRPR_TICK_I	wrpr	%r20, 0x007d, %tick
	.word 0xb1e5e0cd  ! 244: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde461bc  ! 245: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde4603f  ! 249: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb2ad6001  ! 251: ANDNcc_I	andncc 	%r21, 0x0001, %r25
	.word 0xbbe5a015  ! 253: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde4206b  ! 256: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5608d  ! 258: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8394a1c0  ! 261: WRPR_TNPC_I	wrpr	%r18, 0x01c0, %tnpc
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73c9000  ! 265: SRAX_R	srax	%r18, %r0, %r27
	.word 0xbeb5c000  ! 266: SUBCcc_R	orncc 	%r23, %r0, %r31
	.word 0x87946000  ! 268: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbfe5e1e5  ! 269: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e4a120  ! 271: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe421ad  ! 274: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_7, %g1, %r17
	.word 0xb1e4610f  ! 286: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb12ce001  ! 292: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xb9e420c4  ! 293: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbf510000  ! 295: RDPR_TICK	<illegal instruction>
	.word 0xbd2cd000  ! 296: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xb5e420d9  ! 300: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xba35a013  ! 301: SUBC_I	orn 	%r22, 0x0013, %r29
	.word 0x8995e025  ! 306: WRPR_TICK_I	wrpr	%r23, 0x0025, %tick
	.word 0xb3e56028  ! 309: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1540000  ! 310: RDPR_GL	<illegal instruction>
	.word 0xb93d5000  ! 313: SRAX_R	srax	%r21, %r0, %r28
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e520dd  ! 317: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5a1b3  ! 318: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf345000  ! 325: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xbab4a018  ! 326: ORNcc_I	orncc 	%r18, 0x0018, %r29
	.word 0xb5e560d9  ! 327: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4a17e  ! 329: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e5a137  ! 330: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983e81  ! 333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e81, %hpstate
	.word 0xb4456033  ! 335: ADDC_I	addc 	%r21, 0x0033, %r26
	.word 0xb9e520a5  ! 336: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb13dd000  ! 337: SRAX_R	srax	%r23, %r0, %r24
	setx	data_start_7, %g1, %r22
	.word 0xbbe460d0  ! 341: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e5211e  ! 343: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e421a0  ! 346: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb350c000  ! 350: RDPR_TT	<illegal instruction>
	.word 0xb5480000  ! 353: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_2, %g1, %r22
	.word 0xb614606b  ! 357: OR_I	or 	%r17, 0x006b, %r27
	.word 0xb7e56092  ! 358: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e4e157  ! 364: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde46025  ! 366: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8194a108  ! 368: WRPR_TPC_I	wrpr	%r18, 0x0108, %tpc
	.word 0xbd518000  ! 370: RDPR_PSTATE	<illegal instruction>
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e095  ! 372: WRPR_TICK_I	wrpr	%r19, 0x0095, %tick
	.word 0xbde5201f  ! 374: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe46007  ! 375: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde520f0  ! 376: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9504000  ! 377: RDPR_TNPC	<illegal instruction>
	.word 0xbbe520fd  ! 379: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1a9  ! 387: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde4a1e9  ! 388: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e46115  ! 389: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb77c4400  ! 392: MOVR_R	movre	%r17, %r0, %r27
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1ea  ! 402: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbc2d2001  ! 403: ANDN_I	andn 	%r20, 0x0001, %r30
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4616f  ! 408: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e4e087  ! 411: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e460bc  ! 413: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d94e157  ! 418: WRPR_PSTATE_I	wrpr	%r19, 0x0157, %pstate
	.word 0xb3e5e0a8  ! 420: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb52de001  ! 422: SLL_I	sll 	%r23, 0x0001, %r26
	.word 0xb1e4e1b6  ! 423: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5a046  ! 424: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4213a  ! 426: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8595e16c  ! 427: WRPR_TSTATE_I	wrpr	%r23, 0x016c, %tstate
	.word 0xbbe4a107  ! 428: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde5e156  ! 430: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e5a1eb  ! 432: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbf3d0000  ! 436: SRA_R	sra 	%r20, %r0, %r31
	.word 0xb3e5a1fd  ! 438: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4a12f  ! 439: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde42184  ! 440: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb80d2039  ! 442: AND_I	and 	%r20, 0x0039, %r28
	.word 0xbc248000  ! 445: SUB_R	sub 	%r18, %r0, %r30
	.word 0xb49c6119  ! 446: XORcc_I	xorcc 	%r17, 0x0119, %r26
	.word 0xb445c000  ! 447: ADDC_R	addc 	%r23, %r0, %r26
	.word 0xb5e5e0f7  ! 450: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbe1da194  ! 451: XOR_I	xor 	%r22, 0x0194, %r31
	.word 0xbb540000  ! 452: RDPR_GL	<illegal instruction>
	.word 0xb5508000  ! 454: RDPR_TSTATE	<illegal instruction>
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a0bf  ! 456: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8794a0e1  ! 457: WRPR_TT_I	wrpr	%r18, 0x00e1, %tt
	.word 0xb7e46198  ! 459: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbd540000  ! 460: RDPR_GL	<illegal instruction>
	.word 0xb5540000  ! 465: RDPR_GL	<illegal instruction>
	.word 0xb7e56112  ! 466: SAVE_I	save	%r21, 0x0001, %r27
	mov	2, %r14
	.word 0xa193a000  ! 467: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982f19  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	.word 0xbc040000  ! 482: ADD_R	add 	%r16, %r0, %r30
	.word 0xbd504000  ! 484: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5e144  ! 485: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e5e108  ! 486: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4e0a9  ! 487: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8795e1bd  ! 489: WRPR_TT_I	wrpr	%r23, 0x01bd, %tt
	.word 0xb025e036  ! 491: SUB_I	sub 	%r23, 0x0036, %r24
	.word 0xb7e52030  ! 492: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879521ca  ! 496: WRPR_TT_I	wrpr	%r20, 0x01ca, %tt
	.word 0xb335f001  ! 497: SRLX_I	srlx	%r23, 0x0001, %r25
	.word 0x919521b9  ! 503: WRPR_PIL_I	wrpr	%r20, 0x01b9, %pil
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2d7001  ! 508: SLLX_I	sllx	%r21, 0x0001, %r29
	.word 0xb7e4a1eb  ! 511: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde4602c  ! 512: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5201c  ! 516: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xbfe520d5  ! 518: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e42043  ! 520: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde4e188  ! 522: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ac9  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac9, %hpstate
	.word 0x899521ec  ! 527: WRPR_TICK_I	wrpr	%r20, 0x01ec, %tick
	.word 0xb9e5e0f1  ! 528: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbb3d4000  ! 529: SRA_R	sra 	%r21, %r0, %r29
	.word 0xb9e5e1e0  ! 531: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb13ce001  ! 535: SRA_I	sra 	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982b19  ! 542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 543: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb4458000  ! 546: ADDC_R	addc 	%r22, %r0, %r26
	.word 0xbfe52079  ! 548: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe4a03f  ! 553: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8d95219e  ! 555: WRPR_PSTATE_I	wrpr	%r20, 0x019e, %pstate
	.word 0xb151c000  ! 561: RDPR_TL	<illegal instruction>
	.word 0x919460d0  ! 565: WRPR_PIL_I	wrpr	%r17, 0x00d0, %pil
	.word 0xb9e4e180  ! 566: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e42086  ! 567: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 574: RDPR_TICK	<illegal instruction>
	.word 0xbbe5e14d  ! 576: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e5a198  ! 577: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb44460d2  ! 578: ADDC_I	addc 	%r17, 0x00d2, %r26
	.word 0xb750c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xbc458000  ! 582: ADDC_R	addc 	%r22, %r0, %r30
	.word 0xbb500000  ! 586: RDPR_TPC	<illegal instruction>
	.word 0xb9e460f2  ! 587: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde46103  ! 590: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5e0ff  ! 592: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe42025  ! 595: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5e111  ! 596: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e1a8  ! 601: WRPR_PIL_I	wrpr	%r19, 0x01a8, %pil
	.word 0xb5e460b8  ! 606: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e4a164  ! 613: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a134  ! 615: WRPR_PSTATE_I	wrpr	%r22, 0x0134, %pstate
	.word 0xb1e420fe  ! 620: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e199  ! 623: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e5a1b8  ! 627: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe56086  ! 630: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	setx	data_start_5, %g1, %r22
	.word 0xb5e4a070  ! 640: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x3011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 646: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0ed  ! 655: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e520ae  ! 658: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe4a0f0  ! 659: SAVE_I	save	%r18, 0x0001, %r31
	mov	2, %r12
	.word 0x8f932000  ! 667: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2440000  ! 670: ADDC_R	addc 	%r16, %r0, %r25
	.word 0x8194a066  ! 676: WRPR_TPC_I	wrpr	%r18, 0x0066, %tpc
	.word 0xbde4602f  ! 680: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbe0c0000  ! 682: AND_R	and 	%r16, %r0, %r31
	.word 0xbde5a01a  ! 683: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8995e1e7  ! 689: WRPR_TICK_I	wrpr	%r23, 0x01e7, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982dc9  ! 691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc9, %hpstate
	.word 0xb9520000  ! 692: RDPR_PIL	<illegal instruction>
	.word 0xb495c000  ! 693: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xb7e5203b  ! 694: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8d95204f  ! 701: WRPR_PSTATE_I	wrpr	%r20, 0x004f, %pstate
	.word 0xb73dc000  ! 705: SRA_R	sra 	%r23, %r0, %r27
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb935f001  ! 712: SRLX_I	srlx	%r23, 0x0001, %r28
	.word 0xb9e420cb  ! 716: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x3030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e420e2  ! 719: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5a1e2  ! 721: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x839561a9  ! 722: WRPR_TNPC_I	wrpr	%r21, 0x01a9, %tnpc
	.word 0xbb540000  ! 723: RDPR_GL	<illegal instruction>
	.word 0xbfe5a1d0  ! 726: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3508000  ! 731: RDPR_TSTATE	<illegal instruction>
	.word 0xb6846166  ! 734: ADDcc_I	addcc 	%r17, 0x0166, %r27
	.word 0xb7500000  ! 736: RDPR_TPC	<illegal instruction>
	.word 0xbde520d9  ! 739: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e4a108  ! 742: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e4a1e2  ! 744: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x89946012  ! 746: WRPR_TICK_I	wrpr	%r17, 0x0012, %tick
	.word 0xbfe4a146  ! 754: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e4a0a4  ! 755: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e5e146  ! 756: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8795e1c6  ! 759: WRPR_TT_I	wrpr	%r23, 0x01c6, %tt
	.word 0xb5e560f2  ! 760: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4e055  ! 762: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7508000  ! 765: RDPR_TSTATE	<illegal instruction>
	.word 0xbc34606b  ! 769: ORN_I	orn 	%r17, 0x006b, %r30
	.word 0x8394a02e  ! 770: WRPR_TNPC_I	wrpr	%r18, 0x002e, %tnpc
	.word 0xb5e521b5  ! 772: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x10110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e053  ! 775: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd3c2001  ! 776: SRA_I	sra 	%r16, 0x0001, %r30
	mov	2, %r14
	.word 0xa193a000  ! 777: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4a058  ! 780: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e5e071  ! 781: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x1c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 786: RDPR_TSTATE	<illegal instruction>
	.word 0xb1520000  ! 788: RDPR_PIL	<illegal instruction>
	.word 0x8994a15e  ! 789: WRPR_TICK_I	wrpr	%r18, 0x015e, %tick
	.word 0xb3e4e0db  ! 790: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe4a069  ! 795: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb43d4000  ! 797: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xbfe4e0ac  ! 798: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e42138  ! 799: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7520000  ! 804: RDPR_PIL	<illegal instruction>
	.word 0xb5e4e176  ! 807: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e42075  ! 809: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8794a171  ! 810: WRPR_TT_I	wrpr	%r18, 0x0171, %tt
	.word 0xb81cc000  ! 813: XOR_R	xor 	%r19, %r0, %r28
	.word 0xb3e5e1b8  ! 817: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e56030  ! 819: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e5a17b  ! 824: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb6ac20dc  ! 825: ANDNcc_I	andncc 	%r16, 0x00dc, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983983  ! 828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1983, %hpstate
	.word 0xbfe42107  ! 836: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd348000  ! 837: SRL_R	srl 	%r18, %r0, %r30
	.word 0xb6844000  ! 840: ADDcc_R	addcc 	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	.word 0xb3e420e1  ! 849: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e52099  ! 851: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb93dc000  ! 853: SRA_R	sra 	%r23, %r0, %r28
	.word 0xb5e5205d  ! 859: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 864: RDPR_GL	<illegal instruction>
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0a3  ! 867: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4a05c  ! 869: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e5e101  ! 872: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e521fd  ! 873: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8994a1ea  ! 874: WRPR_TICK_I	wrpr	%r18, 0x01ea, %tick
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e4216d  ! 877: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5518000  ! 878: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe5617e  ! 879: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982cd1  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd1, %hpstate
	.word 0xb3e4e0c2  ! 882: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8594e04c  ! 883: WRPR_TSTATE_I	wrpr	%r19, 0x004c, %tstate
	.word 0xbb504000  ! 886: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5209d  ! 887: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4e004  ! 891: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x3022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4205d  ! 899: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9500000  ! 901: RDPR_TPC	<illegal instruction>
	.word 0xb7e5e19d  ! 902: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x81942081  ! 904: WRPR_TPC_I	wrpr	%r16, 0x0081, %tpc
	mov	2, %r14
	.word 0xa193a000  ! 906: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe52114  ! 907: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e42160  ! 911: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8794e1da  ! 912: WRPR_TT_I	wrpr	%r19, 0x01da, %tt
	.word 0xb9e4a042  ! 913: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e4a030  ! 914: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x859460a2  ! 917: WRPR_TSTATE_I	wrpr	%r17, 0x00a2, %tstate
	.word 0xb550c000  ! 921: RDPR_TT	<illegal instruction>
	.word 0xbbe56179  ! 922: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbb510000  ! 923: RDPR_TICK	<illegal instruction>
	.word 0xb5e4e09f  ! 925: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a1e5  ! 929: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe2420cf  ! 931: SUB_I	sub 	%r16, 0x00cf, %r31
	.word 0xb150c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0xbe0d0000  ! 934: AND_R	and 	%r20, %r0, %r31
	.word 0xbab50000  ! 935: ORNcc_R	orncc 	%r20, %r0, %r29
	.word 0xb0042168  ! 938: ADD_I	add 	%r16, 0x0168, %r24
	.word 0xb824e18e  ! 939: SUB_I	sub 	%r19, 0x018e, %r28
	.word 0xbb540000  ! 940: RDPR_GL	<illegal instruction>
	.word 0xb1e4a15a  ! 943: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72ce001  ! 950: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xb1e5604e  ! 951: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb81da0e5  ! 952: XOR_I	xor 	%r22, 0x00e5, %r28
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 956: RDPR_GL	<illegal instruction>
	.word 0xba85609c  ! 959: ADDcc_I	addcc 	%r21, 0x009c, %r29
	.word 0xbbe4e09a  ! 960: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e4a1e9  ! 962: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e460e0  ! 963: SAVE_I	save	%r17, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 964: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e561ed  ! 965: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e46174  ! 969: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb8048000  ! 971: ADD_R	add 	%r18, %r0, %r28
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a066  ! 974: WRPR_TICK_I	wrpr	%r18, 0x0066, %tick
	.word 0xbc35209d  ! 981: SUBC_I	orn 	%r20, 0x009d, %r30
	.word 0x8194e13f  ! 982: WRPR_TPC_I	wrpr	%r19, 0x013f, %tpc
	.word 0x8395e01a  ! 983: WRPR_TNPC_I	wrpr	%r23, 0x001a, %tnpc
	.word 0xbde420d6  ! 986: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 988: MOVcc_R	<illegal instruction>
	.word 0x8394e029  ! 991: WRPR_TNPC_I	wrpr	%r19, 0x0029, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983ecb  ! 994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ecb, %hpstate
	.word 0xbbe5a11d  ! 997: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde561ac  ! 998: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9510000  ! 999: RDPR_TICK	<illegal instruction>
	.word 0xbf480000  ! 1001: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8d94e1c3  ! 1004: WRPR_PSTATE_I	wrpr	%r19, 0x01c3, %pstate
	.word 0xbde5a103  ! 1007: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e56127  ! 1009: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe46164  ! 1015: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5e1a7  ! 1016: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf348000  ! 1026: SRL_R	srl 	%r18, %r0, %r31
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a04c  ! 1036: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4e022  ! 1040: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8194e015  ! 1046: WRPR_TPC_I	wrpr	%r19, 0x0015, %tpc
	.word 0xb1e5e1fa  ! 1048: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe4218f  ! 1053: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e4a158  ! 1054: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbc34a1b8  ! 1055: ORN_I	orn 	%r18, 0x01b8, %r30
	.word 0xbd518000  ! 1057: RDPR_PSTATE	<illegal instruction>
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e1a4  ! 1062: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5a0fb  ! 1063: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5a1d8  ! 1068: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x3012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a00c  ! 1070: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb0044000  ! 1072: ADD_R	add 	%r17, %r0, %r24
	.word 0xbfe421f0  ! 1078: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983c5b  ! 1079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5b, %hpstate
	setx	0x113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9420ea  ! 1081: WRPR_PSTATE_I	wrpr	%r16, 0x00ea, %pstate
	.word 0xb7e460e6  ! 1082: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x20103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83946145  ! 1089: WRPR_TNPC_I	wrpr	%r17, 0x0145, %tnpc
	.word 0xb9e5e000  ! 1090: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e5e0f1  ! 1094: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e4a11c  ! 1095: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x3011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 1105: RDPR_TL	<illegal instruction>
	.word 0xb151c000  ! 1109: RDPR_TL	<illegal instruction>
	.word 0x8d952000  ! 1112: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x839421ed  ! 1115: WRPR_TNPC_I	wrpr	%r16, 0x01ed, %tnpc
	.word 0xbde52195  ! 1116: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb8354000  ! 1117: ORN_R	orn 	%r21, %r0, %r28
	.word 0xb7e42054  ! 1120: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 1121: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xb5e5e103  ! 1124: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395203a  ! 1130: WRPR_TNPC_I	wrpr	%r20, 0x003a, %tnpc
	.word 0xb3e4e094  ! 1132: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8995a100  ! 1135: WRPR_TICK_I	wrpr	%r22, 0x0100, %tick
	.word 0xbfe561f8  ! 1136: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56060  ! 1139: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9508000  ! 1141: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e520f7  ! 1144: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_7, %g1, %r17
	.word 0xb9518000  ! 1149: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4e0b1  ! 1152: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9480000  ! 1153: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb60c8000  ! 1154: AND_R	and 	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a16b  ! 1156: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb33d1000  ! 1157: SRAX_R	srax	%r20, %r0, %r25
	mov	1, %r14
	.word 0xa193a000  ! 1160: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e560b9  ! 1161: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e110  ! 1167: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7480000  ! 1168: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5e42098  ! 1174: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e137  ! 1180: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e46140  ! 1181: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e460fc  ! 1182: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 1183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	.word 0xbd2c6001  ! 1185: SLL_I	sll 	%r17, 0x0001, %r30
	.word 0xbbe4e11b  ! 1188: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbea5c000  ! 1192: SUBcc_R	subcc 	%r23, %r0, %r31
	.word 0xb1e521b9  ! 1193: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e561ff  ! 1200: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7518000  ! 1201: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e5a1fc  ! 1202: SAVE_I	save	%r22, 0x0001, %r25
	setx	data_start_6, %g1, %r21
	.word 0xb3e56186  ! 1204: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5a1cd  ! 1208: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e46133  ! 1209: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde4a09b  ! 1213: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982d99  ! 1215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d99, %hpstate
	.word 0xbde4a1d8  ! 1216: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4e1e6  ! 1222: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8594204a  ! 1224: WRPR_TSTATE_I	wrpr	%r16, 0x004a, %tstate
	.word 0xb3e4203d  ! 1226: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983fcb  ! 1229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fcb, %hpstate
	.word 0xbfe46033  ! 1230: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb215c000  ! 1231: OR_R	or 	%r23, %r0, %r25
	.word 0xbfe5a1b0  ! 1232: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e5a17f  ! 1234: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbab521ae  ! 1238: ORNcc_I	orncc 	%r20, 0x01ae, %r29
	.word 0xbfe46162  ! 1239: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde52133  ! 1241: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e4210b  ! 1243: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e4a148  ! 1245: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a02e  ! 1251: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e561df  ! 1252: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e5205c  ! 1257: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52163  ! 1259: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92c3001  ! 1264: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xbde421fe  ! 1268: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x839421a6  ! 1270: WRPR_TNPC_I	wrpr	%r16, 0x01a6, %tnpc
	.word 0xb4258000  ! 1271: SUB_R	sub 	%r22, %r0, %r26
	.word 0xb9520000  ! 1273: RDPR_PIL	<illegal instruction>
	.word 0xb1e4604e  ! 1276: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbb520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0xb3508000  ! 1280: RDPR_TSTATE	<illegal instruction>
	.word 0xbf540000  ! 1285: RDPR_GL	<illegal instruction>
	.word 0xb1e5e163  ! 1289: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7504000  ! 1290: RDPR_TNPC	<illegal instruction>
	.word 0xbf51c000  ! 1291: RDPR_TL	<illegal instruction>
	setx	0x30133, %g1, %o0
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
	.word 0xbd504000  ! 1298: RDPR_TNPC	<illegal instruction>
	.word 0x8395e1b5  ! 1302: WRPR_TNPC_I	wrpr	%r23, 0x01b5, %tnpc
	.word 0x8194a01d  ! 1309: WRPR_TPC_I	wrpr	%r18, 0x001d, %tpc
	.word 0xb5e4616a  ! 1311: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe4e01a  ! 1313: SAVE_I	save	%r19, 0x0001, %r31
	mov	0, %r14
	.word 0xa193a000  ! 1315: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x9195617a  ! 1320: WRPR_PIL_I	wrpr	%r21, 0x017a, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	.word 0xb9e5e077  ! 1327: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe52022  ! 1328: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9520000  ! 1330: RDPR_PIL	<illegal instruction>
	.word 0xbaa56135  ! 1331: SUBcc_I	subcc 	%r21, 0x0135, %r29
	.word 0x839560e8  ! 1340: WRPR_TNPC_I	wrpr	%r21, 0x00e8, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983a51  ! 1347: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a51, %hpstate
	.word 0x819560e8  ! 1348: WRPR_TPC_I	wrpr	%r21, 0x00e8, %tpc
	.word 0xb9e520d0  ! 1349: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x1031e, %g1, %o0
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
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe52013  ! 1369: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8195a043  ! 1372: WRPR_TPC_I	wrpr	%r22, 0x0043, %tpc
	.word 0xb1e4e05d  ! 1380: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e46170  ! 1385: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e5a168  ! 1388: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb42ca08c  ! 1391: ANDN_I	andn 	%r18, 0x008c, %r26
	.word 0xb3e5a1a8  ! 1392: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e46083  ! 1393: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd2d4000  ! 1394: SLL_R	sll 	%r21, %r0, %r30
	.word 0xbbe4a1cc  ! 1395: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_0, %g1, %r17
	mov	1, %r14
	.word 0xa193a000  ! 1399: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5202e  ! 1401: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e42149  ! 1405: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4214e  ! 1406: SAVE_I	save	%r16, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1407: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0a4  ! 1412: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4a027  ! 1414: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e46012  ! 1415: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x85956047  ! 1419: WRPR_TSTATE_I	wrpr	%r21, 0x0047, %tstate
	.word 0xb7e42179  ! 1423: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1428: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe4a03f  ! 1430: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4a0a6  ! 1435: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe4e070  ! 1441: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb4bd215e  ! 1445: XNORcc_I	xnorcc 	%r20, 0x015e, %r26
	.word 0xbbe42092  ! 1447: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8d94a1d5  ! 1450: WRPR_PSTATE_I	wrpr	%r18, 0x01d5, %pstate
	.word 0xbbe4a1ae  ! 1452: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1518000  ! 1454: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e461ac  ! 1456: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x1c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a024  ! 1459: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e52063  ! 1461: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 1464: RDPR_TPC	<illegal instruction>
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0dd  ! 1466: SAVE_I	save	%r18, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1468: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r21
	setx	0x30036, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	.word 0x81982e01  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e01, %hpstate
	.word 0xb57d8400  ! 1479: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb1e460a5  ! 1483: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e42004  ! 1484: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb485e003  ! 1485: ADDcc_I	addcc 	%r23, 0x0003, %r26
	.word 0xbfe5e0cc  ! 1487: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e52100  ! 1488: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e4a0d3  ! 1489: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x20132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde46016  ! 1492: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89946113  ! 1497: WRPR_TICK_I	wrpr	%r17, 0x0113, %tick
	.word 0xb9e56160  ! 1498: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e4205c  ! 1502: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e4e055  ! 1503: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56077  ! 1509: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5a042  ! 1511: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_7, %g1, %r23
	.word 0x85942111  ! 1513: WRPR_TSTATE_I	wrpr	%r16, 0x0111, %tstate
	.word 0xbb7c8400  ! 1516: MOVR_R	movre	%r18, %r0, %r29
	.word 0xb1e520f1  ! 1517: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7504000  ! 1528: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5207c  ! 1533: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5a154  ! 1534: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e4e1ac  ! 1537: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983bd9  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd9, %hpstate
	.word 0xb1518000  ! 1543: RDPR_PSTATE	<illegal instruction>
	.word 0xbd508000  ! 1545: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4618e  ! 1546: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd50c000  ! 1553: RDPR_TT	<illegal instruction>
	.word 0xb0c5e0a2  ! 1554: ADDCcc_I	addccc 	%r23, 0x00a2, %r24
	.word 0xb951c000  ! 1557: RDPR_TL	<illegal instruction>
	.word 0xbde520a1  ! 1558: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e561f5  ! 1559: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe46171  ! 1560: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e4a0f9  ! 1561: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5a140  ! 1567: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46160  ! 1570: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb214e15a  ! 1576: OR_I	or 	%r19, 0x015a, %r25
	.word 0xbb518000  ! 1577: RDPR_PSTATE	<illegal instruction>
	.word 0xbde420f3  ! 1581: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5e0f0  ! 1582: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 1587: RDPR_TPC	<illegal instruction>
	.word 0xb7e5a094  ! 1588: SAVE_I	save	%r22, 0x0001, %r27
	setx	data_start_7, %g1, %r20
	.word 0xbbe460e9  ! 1592: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_0, %g1, %r22
	.word 0xbfe5a01a  ! 1597: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e520bc  ! 1599: SAVE_I	save	%r20, 0x0001, %r24
	mov	2, %r12
	.word 0x8f932000  ! 1601: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc9cc000  ! 1602: XORcc_R	xorcc 	%r19, %r0, %r30
	.word 0xbf346001  ! 1603: SRL_I	srl 	%r17, 0x0001, %r31
	.word 0xbde5e02a  ! 1604: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8595a068  ! 1615: WRPR_TSTATE_I	wrpr	%r22, 0x0068, %tstate
	setx	data_start_5, %g1, %r18
	.word 0xbde4a094  ! 1617: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_4, %g1, %r23
	.word 0xb72d7001  ! 1634: SLLX_I	sllx	%r21, 0x0001, %r27
	.word 0xb8052090  ! 1637: ADD_I	add 	%r20, 0x0090, %r28
	.word 0xb5e421f1  ! 1638: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e01c  ! 1642: WRPR_PSTATE_I	wrpr	%r19, 0x001c, %pstate
	.word 0xb9510000  ! 1643: RDPR_TICK	<illegal instruction>
	.word 0xbb3cd000  ! 1647: SRAX_R	srax	%r19, %r0, %r29
	.word 0xbb540000  ! 1650: RDPR_GL	<illegal instruction>
	.word 0xb3e4a14f  ! 1654: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd518000  ! 1657: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x3030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	.word 0x8794215d  ! 1671: WRPR_TT_I	wrpr	%r16, 0x015d, %tt
	.word 0xb7e4e1bd  ! 1672: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e5e1cb  ! 1673: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5a16a  ! 1677: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e521c4  ! 1678: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1520000  ! 1683: RDPR_PIL	<illegal instruction>
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e100  ! 1689: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4e059  ! 1691: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e4a050  ! 1692: SAVE_I	save	%r18, 0x0001, %r28
	mov	2, %r14
	.word 0xa193a000  ! 1693: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e5612e  ! 1695: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e520e5  ! 1698: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbf480000  ! 1700: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb5e5e021  ! 1701: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde4a090  ! 1703: SAVE_I	save	%r18, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1704: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e4a08d  ! 1709: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb50c000  ! 1710: RDPR_TT	<illegal instruction>
	.word 0xb3e421d4  ! 1711: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe5a03e  ! 1713: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xb3e4e094  ! 1716: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb4858000  ! 1717: ADDcc_R	addcc 	%r22, %r0, %r26
	.word 0xb9e4a188  ! 1719: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb00c0000  ! 1721: AND_R	and 	%r16, %r0, %r24
	mov	2, %r12
	.word 0x8f932000  ! 1726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e4a135  ! 1728: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb8b52185  ! 1729: SUBCcc_I	orncc 	%r20, 0x0185, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x879521d3  ! 1733: WRPR_TT_I	wrpr	%r20, 0x01d3, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982d43  ! 1739: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d43, %hpstate
	.word 0xb9e52061  ! 1745: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7480000  ! 1750: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982ac1  ! 1752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac1, %hpstate
	.word 0xbbe4a06e  ! 1757: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594605b  ! 1763: WRPR_TSTATE_I	wrpr	%r17, 0x005b, %tstate
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e42143  ! 1773: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e56171  ! 1774: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5a1ac  ! 1776: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe520e3  ! 1781: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe56190  ! 1783: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe5e0e5  ! 1784: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e4202b  ! 1785: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e5e15a  ! 1786: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 1793: RDPR_GL	<illegal instruction>
	.word 0xb88c8000  ! 1799: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xbbe56182  ! 1802: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe5e105  ! 1803: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56192  ! 1808: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9460bf  ! 1814: WRPR_PSTATE_I	wrpr	%r17, 0x00bf, %pstate
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe42167  ! 1817: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8995a1f4  ! 1821: WRPR_TICK_I	wrpr	%r22, 0x01f4, %tick
	.word 0xb3e4a118  ! 1823: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbeac6044  ! 1828: ANDNcc_I	andncc 	%r17, 0x0044, %r31
	.word 0x859421e0  ! 1829: WRPR_TSTATE_I	wrpr	%r16, 0x01e0, %tstate
	.word 0xbde42097  ! 1831: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb150c000  ! 1835: RDPR_TT	<illegal instruction>
	.word 0xb6bd21ce  ! 1836: XNORcc_I	xnorcc 	%r20, 0x01ce, %r27
	setx	data_start_7, %g1, %r19
	.word 0x8194a065  ! 1839: WRPR_TPC_I	wrpr	%r18, 0x0065, %tpc
	.word 0xb5480000  ! 1840: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb9e5a1c3  ! 1843: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb024a0d1  ! 1845: SUB_I	sub 	%r18, 0x00d1, %r24
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e14f  ! 1849: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5e135  ! 1850: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4e1d1  ! 1852: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e52180  ! 1855: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb004c000  ! 1856: ADD_R	add 	%r19, %r0, %r24
	.word 0xb1e5602b  ! 1857: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4e101  ! 1858: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5e100  ! 1860: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4202a  ! 1865: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8594e13d  ! 1870: WRPR_TSTATE_I	wrpr	%r19, 0x013d, %tstate
	.word 0xb7480000  ! 1871: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	mov	1, %r14
	.word 0xa193a000  ! 1873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3540000  ! 1874: RDPR_GL	<illegal instruction>
	.word 0xbbe4e056  ! 1876: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1480000  ! 1880: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9e46065  ! 1881: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_2, %g1, %r21
	.word 0xbf51c000  ! 1890: RDPR_TL	<illegal instruction>
	.word 0xb1e5e191  ! 1895: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8d95e03f  ! 1896: WRPR_PSTATE_I	wrpr	%r23, 0x003f, %pstate
	.word 0xb1518000  ! 1899: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4203b  ! 1900: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5a139  ! 1902: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x899461be  ! 1904: WRPR_TICK_I	wrpr	%r17, 0x01be, %tick
	.word 0xbfe52006  ! 1907: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5609c  ! 1911: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbf520000  ! 1916: RDPR_PIL	<illegal instruction>
	.word 0xbf500000  ! 1922: RDPR_TPC	<illegal instruction>
	.word 0xbd340000  ! 1923: SRL_R	srl 	%r16, %r0, %r30
	.word 0xbfe46129  ! 1928: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbe95c000  ! 1930: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xb9e420a4  ! 1934: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x9195615b  ! 1935: WRPR_PIL_I	wrpr	%r21, 0x015b, %pil
	.word 0xbf540000  ! 1936: RDPR_GL	<illegal instruction>
	setx	0x1000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e56021  ! 1939: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5a1df  ! 1940: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb2c560af  ! 1941: ADDCcc_I	addccc 	%r21, 0x00af, %r25
	.word 0xbfe56063  ! 1943: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb094609d  ! 1949: ORcc_I	orcc 	%r17, 0x009d, %r24
	.word 0xb1480000  ! 1951: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9e4a184  ! 1952: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e5a1b8  ! 1953: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb551c000  ! 1955: RDPR_TL	<illegal instruction>
	.word 0x8395610e  ! 1958: WRPR_TNPC_I	wrpr	%r21, 0x010e, %tnpc
	.word 0xb7e560b6  ! 1960: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9520000  ! 1961: RDPR_PIL	<illegal instruction>
	.word 0xb0a52163  ! 1962: SUBcc_I	subcc 	%r20, 0x0163, %r24
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb37d2401  ! 1964: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xbbe5e0e9  ! 1966: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x30324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	.word 0xb2354000  ! 1969: ORN_R	orn 	%r21, %r0, %r25
	setx	0x30039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e016  ! 1973: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7540000  ! 1978: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x2032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e073  ! 1982: WRPR_TT_I	wrpr	%r19, 0x0073, %tt
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e02c  ! 1990: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x859421cf  ! 1991: WRPR_TSTATE_I	wrpr	%r16, 0x01cf, %tstate
	.word 0xb1e4a098  ! 1992: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e460a0  ! 1993: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb4850000  ! 1995: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xbd508000  ! 1997: RDPR_TSTATE	<illegal instruction>
	.word 0xb17de401  ! 1999: MOVR_I	movre	%r23, 0x1, %r24
	.word 0xb7e461ad  ! 2000: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d95a103  ! 2002: WRPR_PSTATE_I	wrpr	%r22, 0x0103, %pstate
	.word 0xbfe4215d  ! 2003: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbf7c2401  ! 2004: MOVR_I	movre	%r16, 0x1, %r31
	.word 0xb9e56184  ! 2007: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe52092  ! 2008: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4a01e  ! 2010: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4a0d1  ! 2011: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4e094  ! 2012: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839560b5  ! 2017: WRPR_TNPC_I	wrpr	%r21, 0x00b5, %tnpc
	.word 0xb5e4a0aa  ! 2019: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5a000  ! 2023: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4e002  ! 2025: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_5, %g1, %r23
	.word 0xb9e5a124  ! 2034: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e5a083  ! 2037: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e561b1  ! 2040: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe5a0a6  ! 2042: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5206a  ! 2043: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e119  ! 2046: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8d94e1ce  ! 2047: WRPR_PSTATE_I	wrpr	%r19, 0x01ce, %pstate
	.word 0xb7e5e166  ! 2049: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e5a13d  ! 2050: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e4e161  ! 2051: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb750c000  ! 2057: RDPR_TT	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 2063: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9520000  ! 2064: RDPR_PIL	<illegal instruction>
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e133  ! 2069: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e4614c  ! 2075: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbe0da0e8  ! 2076: AND_I	and 	%r22, 0x00e8, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982943  ! 2077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0943, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e52170  ! 2084: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e46115  ! 2088: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4e0c5  ! 2089: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb08521b6  ! 2090: ADDcc_I	addcc 	%r20, 0x01b6, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982d03  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d03, %hpstate
	.word 0xb7e5211b  ! 2093: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe4208e  ! 2094: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb8b50000  ! 2098: SUBCcc_R	orncc 	%r20, %r0, %r28
	.word 0xbf51c000  ! 2100: RDPR_TL	<illegal instruction>
	.word 0xb1e4203b  ! 2102: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e42138  ! 2103: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5e1de  ! 2105: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb17ce401  ! 2107: MOVR_I	movre	%r19, 0x1, %r24
	.word 0xbe3521d8  ! 2110: SUBC_I	orn 	%r20, 0x01d8, %r31
	.word 0xbd518000  ! 2113: RDPR_PSTATE	rdpr	%pstate, %r30
	setx	0x30118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e1af  ! 2116: WRPR_PSTATE_I	wrpr	%r19, 0x01af, %pstate
	.word 0xbf3cd000  ! 2117: SRAX_R	srax	%r19, %r0, %r31
	mov	2, %r14
	.word 0xa193a000  ! 2121: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb951c000  ! 2124: RDPR_TL	<illegal instruction>
	setx	data_start_6, %g1, %r21
	.word 0xbbe46130  ! 2129: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4611b  ! 2133: SAVE_I	save	%r17, 0x0001, %r31
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc25c000  ! 2141: SUB_R	sub 	%r23, %r0, %r30
	.word 0x87956163  ! 2146: WRPR_TT_I	wrpr	%r21, 0x0163, %tt
	.word 0xb3e5a059  ! 2147: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e420b0  ! 2150: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e5605d  ! 2153: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde5a13c  ! 2155: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1c4  ! 2157: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x919460df  ! 2160: WRPR_PIL_I	wrpr	%r17, 0x00df, %pil
	.word 0xbf504000  ! 2161: RDPR_TNPC	<illegal instruction>
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a128  ! 2164: WRPR_TICK_I	wrpr	%r22, 0x0128, %tick
	.word 0x81942008  ! 2166: WRPR_TPC_I	wrpr	%r16, 0x0008, %tpc
	.word 0xb3e5e01f  ! 2168: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9641800  ! 2169: MOVcc_R	<illegal instruction>
	.word 0xb2348000  ! 2170: ORN_R	orn 	%r18, %r0, %r25
	.word 0xb72c3001  ! 2171: SLLX_I	sllx	%r16, 0x0001, %r27
	setx	data_start_4, %g1, %r21
	setx	0x1031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e461a8  ! 2176: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe561b1  ! 2180: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e420c5  ! 2183: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a117  ! 2185: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e5605a  ! 2186: SAVE_I	save	%r21, 0x0001, %r27
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4606d  ! 2191: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb4348000  ! 2195: SUBC_R	orn 	%r18, %r0, %r26
	.word 0x8795614e  ! 2196: WRPR_TT_I	wrpr	%r21, 0x014e, %tt
	.word 0xb7e42109  ! 2199: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5a0ae  ! 2200: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4609a  ! 2202: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983e59  ! 2203: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e59, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde460c1  ! 2214: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 2222: RDPR_PIL	<illegal instruction>
	setx	data_start_6, %g1, %r21
	.word 0xb7e5e122  ! 2226: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbc1c0000  ! 2228: XOR_R	xor 	%r16, %r0, %r30
	.word 0xbde42086  ! 2231: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e52096  ! 2232: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_5, %g1, %r17
	.word 0xb550c000  ! 2237: RDPR_TT	<illegal instruction>
	.word 0xb1e5e055  ! 2238: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbb2d4000  ! 2244: SLL_R	sll 	%r21, %r0, %r29
	.word 0xb9518000  ! 2245: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xbfe4e060  ! 2251: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbd518000  ! 2254: RDPR_PSTATE	<illegal instruction>
	setx	0x205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5204c  ! 2259: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x3023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a075  ! 2261: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e5e010  ! 2264: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5a062  ! 2265: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe4a16a  ! 2268: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb550c000  ! 2269: RDPR_TT	<illegal instruction>
	.word 0xb7e46086  ! 2273: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983d43  ! 2275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d43, %hpstate
	.word 0xb1504000  ! 2279: RDPR_TNPC	<illegal instruction>
	.word 0xb5e460b2  ! 2280: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde561a3  ! 2285: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8994a024  ! 2286: WRPR_TICK_I	wrpr	%r18, 0x0024, %tick
	.word 0xbe354000  ! 2289: SUBC_R	orn 	%r21, %r0, %r31
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 2293: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a05c  ! 2305: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5e129  ! 2308: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb50c000  ! 2310: RDPR_TT	<illegal instruction>
	.word 0xbf51c000  ! 2312: RDPR_TL	<illegal instruction>
	.word 0xb7e56164  ! 2315: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x89946049  ! 2316: WRPR_TICK_I	wrpr	%r17, 0x0049, %tick
	.word 0xbd2c8000  ! 2318: SLL_R	sll 	%r18, %r0, %r30
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e1b0  ! 2324: WRPR_TT_I	wrpr	%r23, 0x01b0, %tt
	.word 0xbde4a1d3  ! 2325: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56093  ! 2327: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e4a12a  ! 2329: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x3001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e421d0  ! 2332: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7500000  ! 2338: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2342: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 2353: RDPR_TPC	<illegal instruction>
	.word 0xb1e561f0  ! 2354: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5a006  ! 2355: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5a179  ! 2357: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7518000  ! 2358: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4a095  ! 2359: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb68d0000  ! 2360: ANDcc_R	andcc 	%r20, %r0, %r27
	.word 0xbbe5a0bf  ! 2362: SAVE_I	save	%r22, 0x0001, %r29
	setx	data_start_4, %g1, %r20
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4214e  ! 2368: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e46123  ! 2370: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde42006  ! 2383: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e56006  ! 2387: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4612f  ! 2389: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e0b8  ! 2394: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x9194e142  ! 2400: WRPR_PIL_I	wrpr	%r19, 0x0142, %pil
	.word 0xbde561dc  ! 2403: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb88d604b  ! 2407: ANDcc_I	andcc 	%r21, 0x004b, %r28
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb28d8000  ! 2410: ANDcc_R	andcc 	%r22, %r0, %r25
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 2414: RDPR_PIL	<illegal instruction>
	.word 0xb9e4607c  ! 2415: SAVE_I	save	%r17, 0x0001, %r28
	mov	2, %r12
	.word 0x8f932000  ! 2416: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e5a15b  ! 2420: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe4a133  ! 2422: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe4a0a7  ! 2423: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb03de1ed  ! 2426: XNOR_I	xnor 	%r23, 0x01ed, %r24
	.word 0xbb2d8000  ! 2427: SLL_R	sll 	%r22, %r0, %r29
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a0c5  ! 2440: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe5a0bd  ! 2443: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe56052  ! 2444: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e56095  ! 2445: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72c3001  ! 2448: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xb28d8000  ! 2449: ANDcc_R	andcc 	%r22, %r0, %r25
	.word 0xbc9d60db  ! 2453: XORcc_I	xorcc 	%r21, 0x00db, %r30
	.word 0xb5e560c9  ! 2454: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e420a3  ! 2455: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe560b1  ! 2459: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe420e1  ! 2466: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x3031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5611f  ! 2469: SAVE_I	save	%r21, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 2472: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe56069  ! 2474: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_1, %g1, %r21
	.word 0x8595e0d2  ! 2486: WRPR_TSTATE_I	wrpr	%r23, 0x00d2, %tstate
	.word 0xb3e421cb  ! 2487: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e460ad  ! 2495: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4e1af  ! 2498: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd520000  ! 2499: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e43  ! 2500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e43, %hpstate
	.word 0xbb518000  ! 2503: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5a19f  ! 2504: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb72c8000  ! 2505: SLL_R	sll 	%r18, %r0, %r27
	mov	2, %r14
	.word 0xa193a000  ! 2506: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe42175  ! 2507: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb480000  ! 2510: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9e42028  ! 2511: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5210d  ! 2513: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb750c000  ! 2518: RDPR_TT	<illegal instruction>
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5207a  ! 2525: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5a1da  ! 2526: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde5209a  ! 2527: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_2, %g1, %r20
	.word 0xb1e56048  ! 2531: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e00b  ! 2536: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8994a169  ! 2537: WRPR_TICK_I	wrpr	%r18, 0x0169, %tick
	.word 0xb68d4000  ! 2541: ANDcc_R	andcc 	%r21, %r0, %r27
	mov	1, %r12
	.word 0x8f932000  ! 2546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e5a046  ! 2548: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe460d6  ! 2549: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5a100  ! 2552: SAVE_I	save	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982fc9  ! 2553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc9, %hpstate
	.word 0xbbe461b4  ! 2554: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb750c000  ! 2567: RDPR_TT	<illegal instruction>
	.word 0xb5e5e063  ! 2572: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x819828c9  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c9, %hpstate
	setx	0x30227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2dc000  ! 2575: ANDN_R	andn 	%r23, %r0, %r29
	.word 0xbbe4e0ea  ! 2576: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e4e05f  ! 2581: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8595617c  ! 2582: WRPR_TSTATE_I	wrpr	%r21, 0x017c, %tstate
	.word 0xbb520000  ! 2592: RDPR_PIL	<illegal instruction>
	.word 0xb7518000  ! 2594: RDPR_PSTATE	<illegal instruction>
	.word 0xb5518000  ! 2595: RDPR_PSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r21
	.word 0xb1e520b0  ! 2609: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb28ca1c6  ! 2614: ANDcc_I	andcc 	%r18, 0x01c6, %r25
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 2623: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xb9e520db  ! 2626: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4e09b  ! 2627: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e56020  ! 2628: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbd500000  ! 2631: RDPR_TPC	<illegal instruction>
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e420db  ! 2638: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe5a192  ! 2640: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xba3d4000  ! 2641: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0x8394219c  ! 2643: WRPR_TNPC_I	wrpr	%r16, 0x019c, %tnpc
	.word 0xbc348000  ! 2644: ORN_R	orn 	%r18, %r0, %r30
	.word 0xb7e421e9  ! 2645: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde5e155  ! 2646: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3510000  ! 2648: RDPR_TICK	<illegal instruction>
	.word 0x81952101  ! 2650: WRPR_TPC_I	wrpr	%r20, 0x0101, %tpc
	.word 0xb6c4c000  ! 2653: ADDCcc_R	addccc 	%r19, %r0, %r27
	.word 0x8994a14e  ! 2655: WRPR_TICK_I	wrpr	%r18, 0x014e, %tick
	.word 0xb9504000  ! 2661: RDPR_TNPC	<illegal instruction>
	.word 0xb9e46157  ! 2662: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe561b6  ! 2664: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7348000  ! 2668: SRL_R	srl 	%r18, %r0, %r27
	.word 0x8594e162  ! 2671: WRPR_TSTATE_I	wrpr	%r19, 0x0162, %tstate
	setx	data_start_7, %g1, %r19
	.word 0xb1e520fc  ! 2675: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e4a050  ! 2678: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb504000  ! 2681: RDPR_TNPC	<illegal instruction>
	.word 0xbde4e090  ! 2682: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 2686: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe52049  ! 2688: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde46161  ! 2689: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e56083  ! 2692: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e5e089  ! 2699: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb540000  ! 2704: RDPR_GL	<illegal instruction>
	.word 0xbde520db  ! 2707: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbb51c000  ! 2708: RDPR_TL	<illegal instruction>
	.word 0xbde5e169  ! 2711: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e4609b  ! 2715: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e5217a  ! 2719: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e5e0cc  ! 2721: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594617c  ! 2726: WRPR_TSTATE_I	wrpr	%r17, 0x017c, %tstate
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e521a9  ! 2736: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e42141  ! 2739: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe4a15b  ! 2745: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb57ce401  ! 2746: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xb1e56196  ! 2754: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e460c3  ! 2757: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e421f3  ! 2760: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e002  ! 2763: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5a109  ! 2767: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4a027  ! 2769: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb2b5e0ef  ! 2770: ORNcc_I	orncc 	%r23, 0x00ef, %r25
	.word 0xbbe4216c  ! 2772: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd504000  ! 2773: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e5604a  ! 2778: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983f9b  ! 2782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9b, %hpstate
	.word 0xbde46049  ! 2783: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb62ce109  ! 2784: ANDN_I	andn 	%r19, 0x0109, %r27
	.word 0xb3e4201a  ! 2789: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5510000  ! 2790: RDPR_TICK	<illegal instruction>
	.word 0x8594a0ae  ! 2796: WRPR_TSTATE_I	wrpr	%r18, 0x00ae, %tstate
	.word 0xb9e460f4  ! 2801: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8394617b  ! 2803: WRPR_TNPC_I	wrpr	%r17, 0x017b, %tnpc
	.word 0xb3643801  ! 2804: MOVcc_I	<illegal instruction>
	.word 0x87952081  ! 2805: WRPR_TT_I	wrpr	%r20, 0x0081, %tt
	.word 0xbb35f001  ! 2806: SRLX_I	srlx	%r23, 0x0001, %r29
	.word 0xb3e4a065  ! 2807: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb00ce038  ! 2808: AND_I	and 	%r19, 0x0038, %r24
	.word 0xb3e5e074  ! 2814: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a0cf  ! 2817: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4e1e3  ! 2819: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbeade07e  ! 2821: ANDNcc_I	andncc 	%r23, 0x007e, %r31
	.word 0xb3e4a1f0  ! 2824: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e521e0  ! 2828: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde461cf  ! 2829: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x879520a8  ! 2831: WRPR_TT_I	wrpr	%r20, 0x00a8, %tt
	.word 0x8395a154  ! 2834: WRPR_TNPC_I	wrpr	%r22, 0x0154, %tnpc
	.word 0xb7e42018  ! 2839: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4601b  ! 2840: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb404c000  ! 2841: ADD_R	add 	%r19, %r0, %r26
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 2844: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4608f  ! 2846: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbd540000  ! 2853: RDPR_GL	<illegal instruction>
	.word 0xb52dc000  ! 2855: SLL_R	sll 	%r23, %r0, %r26
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe1de161  ! 2860: XOR_I	xor 	%r23, 0x0161, %r31
	.word 0xb5e4a0b6  ! 2861: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe4e09c  ! 2864: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbc8ca030  ! 2865: ANDcc_I	andcc 	%r18, 0x0030, %r30
	.word 0xb5e4a0ac  ! 2867: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5e082  ! 2870: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe42137  ! 2871: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7510000  ! 2873: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0xbfe4e098  ! 2876: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe46040  ! 2877: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb335b001  ! 2879: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xb1e4a056  ! 2880: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7510000  ! 2883: RDPR_TICK	<illegal instruction>
	.word 0xb9e4a0d0  ! 2885: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe561e6  ! 2887: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4e028  ! 2890: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_3, %g1, %r23
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46090  ! 2906: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9504000  ! 2911: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5e023  ! 2918: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983f41  ! 2919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f41, %hpstate
	.word 0xbde52075  ! 2920: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e460d3  ! 2921: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb8148000  ! 2924: OR_R	or 	%r18, %r0, %r28
	.word 0xb7e4a021  ! 2925: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1540000  ! 2927: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982919  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0919, %hpstate
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e560c7  ! 2943: SAVE_I	save	%r21, 0x0001, %r28
	mov	2, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e5a0f6  ! 2945: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe5e12c  ! 2947: SAVE_I	save	%r23, 0x0001, %r31
	mov	1, %r12
	.word 0x8f932000  ! 2949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0d3  ! 2953: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5a01d  ! 2954: SAVE_I	save	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b41  ! 2955: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b41, %hpstate
	.word 0xbbe520fe  ! 2959: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e5e111  ! 2960: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbc1d0000  ! 2970: XOR_R	xor 	%r20, %r0, %r30
	.word 0xb5e56101  ! 2972: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e4a0df  ! 2973: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x3002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 2976: RDPR_TICK	<illegal instruction>
	.word 0x8395219b  ! 2979: WRPR_TNPC_I	wrpr	%r20, 0x019b, %tnpc
	setx	0x125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a1e5  ! 2986: WRPR_TPC_I	wrpr	%r18, 0x01e5, %tpc
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 2988: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8594616a  ! 2989: WRPR_TSTATE_I	wrpr	%r17, 0x016a, %tstate
	.word 0xbde5e0f0  ! 2991: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5e039  ! 2994: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_7, %g1, %r16
	setx	0x30016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8a5a006  ! 3010: SUBcc_I	subcc 	%r22, 0x0006, %r28
	setx	data_start_0, %g1, %r20
	.word 0xbb508000  ! 3017: RDPR_TSTATE	<illegal instruction>
	.word 0x8995619e  ! 3018: WRPR_TICK_I	wrpr	%r21, 0x019e, %tick
	.word 0xb3e4e043  ! 3019: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe46178  ! 3020: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e42060  ! 3023: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5211f  ! 3027: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5e1f8  ! 3029: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbd518000  ! 3031: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e4210a  ! 3033: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a08e  ! 3034: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e521c0  ! 3037: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 3044: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e560f9  ! 3045: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c0b  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c0b, %hpstate
	.word 0xbde42197  ! 3052: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb80ca1de  ! 3056: AND_I	and 	%r18, 0x01de, %r28
	.word 0xbde42145  ! 3057: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946160  ! 3065: WRPR_PIL_I	wrpr	%r17, 0x0160, %pil
	.word 0xbd540000  ! 3066: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c93  ! 3073: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c93, %hpstate
	.word 0xb3e5206b  ! 3076: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb32d6001  ! 3077: SLL_I	sll 	%r21, 0x0001, %r25
	.word 0x8395a0ad  ! 3082: WRPR_TNPC_I	wrpr	%r22, 0x00ad, %tnpc
	.word 0xbde5e1aa  ! 3084: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e4e1f2  ! 3087: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5520000  ! 3088: RDPR_PIL	<illegal instruction>
	.word 0xb29d8000  ! 3091: XORcc_R	xorcc 	%r22, %r0, %r25
	.word 0xbb508000  ! 3094: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4a0dc  ! 3096: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4e01e  ! 3098: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e521b1  ! 3099: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x859560a7  ! 3100: WRPR_TSTATE_I	wrpr	%r21, 0x00a7, %tstate
	.word 0xb3e4a0a7  ! 3101: SAVE_I	save	%r18, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 3114: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb504000  ! 3115: RDPR_TNPC	<illegal instruction>
	.word 0x8794a138  ! 3124: WRPR_TT_I	wrpr	%r18, 0x0138, %tt
	.word 0xb1500000  ! 3125: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81983cd3  ! 3131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd3, %hpstate
	.word 0xb7e4a0ce  ! 3132: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e5216c  ! 3138: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9480000  ! 3141: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbbe4e099  ! 3143: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_1, %g1, %r22
	.word 0xb9e4612f  ! 3149: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb004c000  ! 3150: ADD_R	add 	%r19, %r0, %r24
	.word 0xb7e420cf  ! 3153: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e4219a  ! 3154: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3508000  ! 3156: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xb5e5e1e7  ! 3160: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbc85a03e  ! 3163: ADDcc_I	addcc 	%r22, 0x003e, %r30
	.word 0xb951c000  ! 3164: RDPR_TL	<illegal instruction>
	.word 0xb7e4e1f2  ! 3169: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe5608a  ! 3170: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9480000  ! 3171: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5e42088  ! 3174: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5a14f  ! 3175: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4e127  ! 3177: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	mov	2, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb2354000  ! 3187: SUBC_R	orn 	%r21, %r0, %r25
	.word 0xbbe4a008  ! 3190: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe56123  ! 3198: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4203a  ! 3203: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5a123  ! 3206: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e56067  ! 3207: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbf2d0000  ! 3209: SLL_R	sll 	%r20, %r0, %r31
	.word 0xbd508000  ! 3210: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e561ab  ! 3214: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_1, %g1, %r18
	setx	data_start_7, %g1, %r19
	.word 0xbc85a090  ! 3219: ADDcc_I	addcc 	%r22, 0x0090, %r30
	.word 0xb6350000  ! 3221: ORN_R	orn 	%r20, %r0, %r27
	.word 0xbb3da001  ! 3223: SRA_I	sra 	%r22, 0x0001, %r29
	setx	data_start_7, %g1, %r21
	.word 0xb5e5a05c  ! 3225: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x20336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 3231: RDPR_TL	<illegal instruction>
	.word 0xbbe52107  ! 3232: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e4e114  ! 3234: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42023  ! 3241: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e56103  ! 3242: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5a026  ! 3244: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc8c8000  ! 3249: ANDcc_R	andcc 	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a0a0  ! 3255: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e5603e  ! 3260: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5e0af  ! 3263: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8194e162  ! 3264: WRPR_TPC_I	wrpr	%r19, 0x0162, %tpc
	.word 0xb5e4a156  ! 3270: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8595a0a9  ! 3272: WRPR_TSTATE_I	wrpr	%r22, 0x00a9, %tstate
	.word 0xbde5a177  ! 3276: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4a039  ! 3278: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e521bf  ! 3279: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a0d9  ! 3283: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982f01  ! 3284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f01, %hpstate
	.word 0xb9e5e1f8  ! 3288: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb77d4400  ! 3289: MOVR_R	movre	%r21, %r0, %r27
	.word 0xb5e521bc  ! 3290: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0b9  ! 3295: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4e071  ! 3301: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe420e2  ! 3302: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1d5  ! 3309: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde5211c  ! 3311: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x30003, %g1, %o0
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
	.word 0xb7e4612c  ! 3316: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d94a070  ! 3319: WRPR_PSTATE_I	wrpr	%r18, 0x0070, %pstate
	.word 0xbb520000  ! 3320: RDPR_PIL	<illegal instruction>
	.word 0xb3e521d1  ! 3323: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3518000  ! 3324: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4e1dd  ! 3326: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e4e183  ! 3329: SAVE_I	save	%r19, 0x0001, %r26
	setx	data_start_1, %g1, %r19
	.word 0xb5643801  ! 3331: MOVcc_I	<illegal instruction>
	.word 0x8d94e1c2  ! 3332: WRPR_PSTATE_I	wrpr	%r19, 0x01c2, %pstate
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0bc  ! 3335: WRPR_PSTATE_I	wrpr	%r18, 0x00bc, %pstate
	.word 0xbd51c000  ! 3336: RDPR_TL	<illegal instruction>
	.word 0xbc0da02d  ! 3337: AND_I	and 	%r22, 0x002d, %r30
	.word 0xb7510000  ! 3339: RDPR_TICK	<illegal instruction>
	.word 0xb835213b  ! 3341: SUBC_I	orn 	%r20, 0x013b, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982b01  ! 3345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b01, %hpstate
	.word 0xb9e52053  ! 3349: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e5a0ad  ! 3351: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e4e041  ! 3353: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	.word 0x9195a111  ! 3357: WRPR_PIL_I	wrpr	%r22, 0x0111, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 3360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xb9e5a142  ! 3362: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb22dc000  ! 3364: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xb9e4a0bb  ! 3366: SAVE_I	save	%r18, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 3367: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe46089  ! 3369: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb50c000  ! 3377: RDPR_TT	<illegal instruction>
	.word 0xb1e4a12e  ! 3379: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4a141  ! 3380: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb8ac4000  ! 3385: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0x8d95a196  ! 3387: WRPR_PSTATE_I	wrpr	%r22, 0x0196, %pstate
	.word 0xbfe4e0db  ! 3389: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d9460db  ! 3391: WRPR_PSTATE_I	wrpr	%r17, 0x00db, %pstate
	.word 0xb1500000  ! 3392: RDPR_TPC	<illegal instruction>
	.word 0xb97c2401  ! 3398: MOVR_I	movre	%r16, 0x1, %r28
	.word 0x839560f4  ! 3400: WRPR_TNPC_I	wrpr	%r21, 0x00f4, %tnpc
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e421d4  ! 3404: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 3408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	.word 0xbfe421dd  ! 3409: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e42090  ! 3413: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e5a0f3  ! 3417: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4e0e1  ! 3420: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbd540000  ! 3421: RDPR_GL	<illegal instruction>
	.word 0xb1e5a078  ! 3422: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe460c4  ! 3427: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5518000  ! 3428: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e4603d  ! 3430: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2adc000  ! 3432: ANDNcc_R	andncc 	%r23, %r0, %r25
	setx	0x30216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4218e  ! 3434: SAVE_I	save	%r16, 0x0001, %r25
	setx	data_start_2, %g1, %r23
	.word 0xb1e4a136  ! 3441: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4a119  ! 3442: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e4a031  ! 3443: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb8a4e18e  ! 3445: SUBcc_I	subcc 	%r19, 0x018e, %r28
	.word 0xb9e5604c  ! 3448: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8795a198  ! 3449: WRPR_TT_I	wrpr	%r22, 0x0198, %tt
	mov	0, %r14
	.word 0xa193a000  ! 3451: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e4e0be  ! 3452: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e42066  ! 3454: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5a029  ! 3456: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde4a1ee  ! 3458: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4a1f0  ! 3459: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd508000  ! 3460: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e42188  ! 3462: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8195219e  ! 3463: WRPR_TPC_I	wrpr	%r20, 0x019e, %tpc
	.word 0xb3508000  ! 3464: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e420ef  ! 3466: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8595a1ed  ! 3467: WRPR_TSTATE_I	wrpr	%r22, 0x01ed, %tstate
	mov	2, %r14
	.word 0xa193a000  ! 3470: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf500000  ! 3471: RDPR_TPC	<illegal instruction>
	.word 0xb2948000  ! 3472: ORcc_R	orcc 	%r18, %r0, %r25
	.word 0xb6c56099  ! 3473: ADDCcc_I	addccc 	%r21, 0x0099, %r27
	setx	data_start_1, %g1, %r18
	.word 0xbbe5a1d7  ! 3483: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879420fa  ! 3485: WRPR_TT_I	wrpr	%r16, 0x00fa, %tt
	setx	0x3031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a1ca  ! 3488: WRPR_TPC_I	wrpr	%r22, 0x01ca, %tpc
	.word 0xbde420d0  ! 3489: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x879561b2  ! 3492: WRPR_TT_I	wrpr	%r21, 0x01b2, %tt
	.word 0xb7e42145  ! 3498: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe4a1c2  ! 3502: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb8348000  ! 3503: SUBC_R	orn 	%r18, %r0, %r28
	.word 0xb151c000  ! 3508: RDPR_TL	<illegal instruction>
	.word 0xb9e46158  ! 3510: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbebd4000  ! 3511: XNORcc_R	xnorcc 	%r21, %r0, %r31
	.word 0xb7e4e11e  ! 3512: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5606d  ! 3513: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e52124  ! 3514: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1508000  ! 3515: RDPR_TSTATE	<illegal instruction>
	.word 0xb8a44000  ! 3517: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xbc1d0000  ! 3518: XOR_R	xor 	%r20, %r0, %r30
	.word 0xb7e5604d  ! 3519: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x899560c6  ! 3522: WRPR_TICK_I	wrpr	%r21, 0x00c6, %tick
	.word 0xb1e5e0ea  ! 3523: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e46036  ! 3526: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb40d2029  ! 3527: AND_I	and 	%r20, 0x0029, %r26
	.word 0x8d9460f6  ! 3530: WRPR_PSTATE_I	wrpr	%r17, 0x00f6, %pstate
	.word 0xb13ce001  ! 3531: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xb8a4c000  ! 3533: SUBcc_R	subcc 	%r19, %r0, %r28
	.word 0xbd504000  ! 3536: RDPR_TNPC	<illegal instruction>
	.word 0xbd480000  ! 3537: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7e4e1c8  ! 3540: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e4e1ae  ! 3542: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1504000  ! 3543: RDPR_TNPC	<illegal instruction>
	.word 0xbfe52072  ! 3544: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x919461c6  ! 3546: WRPR_PIL_I	wrpr	%r17, 0x01c6, %pil
	.word 0x9195e16a  ! 3547: WRPR_PIL_I	wrpr	%r23, 0x016a, %pil
	setx	0x30136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e01  ! 3555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e01, %hpstate
	.word 0xba15603c  ! 3557: OR_I	or 	%r21, 0x003c, %r29
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e12e  ! 3560: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4606a  ! 3562: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbe3da0ca  ! 3564: XNOR_I	xnor 	%r22, 0x00ca, %r31
	.word 0xb1e4e0e8  ! 3574: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4a1f2  ! 3575: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5e0e7  ! 3576: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4e1a0  ! 3577: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde42020  ! 3583: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbf3cd000  ! 3589: SRAX_R	srax	%r19, %r0, %r31
	.word 0x89946099  ! 3590: WRPR_TICK_I	wrpr	%r17, 0x0099, %tick
	.word 0xb9e56024  ! 3595: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb345000  ! 3597: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xb7e4a1d2  ! 3600: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9641800  ! 3604: MOVcc_R	<illegal instruction>
	.word 0xbde521f3  ! 3609: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e042  ! 3616: WRPR_PSTATE_I	wrpr	%r23, 0x0042, %pstate
	.word 0xbc94217d  ! 3617: ORcc_I	orcc 	%r16, 0x017d, %r30
	.word 0xb3e561f4  ! 3618: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e56004  ! 3619: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4206a  ! 3623: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x89942066  ! 3625: WRPR_TICK_I	wrpr	%r16, 0x0066, %tick
	.word 0xb1e5a004  ! 3628: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbb343001  ! 3630: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xbde420c7  ! 3631: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e56017  ! 3632: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8395e0b1  ! 3639: WRPR_TNPC_I	wrpr	%r23, 0x00b1, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 3642: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a16a  ! 3647: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbeb420a9  ! 3649: SUBCcc_I	orncc 	%r16, 0x00a9, %r31
	.word 0xb5e4213b  ! 3652: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe4a1e3  ! 3654: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe561bc  ! 3656: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde520c8  ! 3662: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb950c000  ! 3665: RDPR_TT	<illegal instruction>
	.word 0xbfe520b6  ! 3666: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e520ac  ! 3670: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe521f6  ! 3672: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x919520a5  ! 3675: WRPR_PIL_I	wrpr	%r20, 0x00a5, %pil
	.word 0xb5e4e1bf  ! 3677: SAVE_I	save	%r19, 0x0001, %r26
	mov	1, %r14
	.word 0xa193a000  ! 3678: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 3679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0xb7e4e0d8  ! 3688: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x9194e106  ! 3689: WRPR_PIL_I	wrpr	%r19, 0x0106, %pil
	.word 0xb92d0000  ! 3690: SLL_R	sll 	%r20, %r0, %r28
	mov	2, %r14
	.word 0xa193a000  ! 3698: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8394a15f  ! 3699: WRPR_TNPC_I	wrpr	%r18, 0x015f, %tnpc
	.word 0x8795e0f2  ! 3701: WRPR_TT_I	wrpr	%r23, 0x00f2, %tt
	.word 0xbfe52137  ! 3702: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4e0ec  ! 3703: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e561e0  ! 3705: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf7d4400  ! 3706: MOVR_R	movre	%r21, %r0, %r31
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e520de  ! 3708: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe5a10a  ! 3709: SAVE_I	save	%r22, 0x0001, %r31
	setx	data_start_4, %g1, %r16
	.word 0xbc340000  ! 3714: ORN_R	orn 	%r16, %r0, %r30
	mov	1, %r12
	.word 0x8f932000  ! 3715: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3500000  ! 3717: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3718: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e5e14c  ! 3719: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e4e118  ! 3720: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9540000  ! 3721: RDPR_GL	<illegal instruction>
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e460f4  ! 3734: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e4210d  ! 3737: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e460c2  ! 3741: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x1010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93d8000  ! 3744: SRA_R	sra 	%r22, %r0, %r28
	setx	data_start_2, %g1, %r22
	.word 0xb1e4e1b4  ! 3749: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_4, %g1, %r16
	setx	data_start_3, %g1, %r18
	.word 0xb7e561ec  ! 3759: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e420f7  ! 3762: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9500000  ! 3765: RDPR_TPC	<illegal instruction>
	.word 0xb1e4e15c  ! 3768: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8d956052  ! 3769: WRPR_PSTATE_I	wrpr	%r21, 0x0052, %pstate
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e46121  ! 3772: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe42050  ! 3775: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe4e166  ! 3778: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe4a102  ! 3781: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e520d1  ! 3786: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbc05a02c  ! 3792: ADD_I	add 	%r22, 0x002c, %r30
	.word 0xbfe4210c  ! 3793: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bce0de  ! 3800: XNORcc_I	xnorcc 	%r19, 0x00de, %r28
	.word 0xb1e5604e  ! 3803: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde52124  ! 3805: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbd500000  ! 3807: RDPR_TPC	<illegal instruction>
	.word 0x8794e0b7  ! 3808: WRPR_TT_I	wrpr	%r19, 0x00b7, %tt
	.word 0xb37ce401  ! 3810: MOVR_I	movre	%r19, 0x1, %r25
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde56191  ! 3812: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x20125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3825: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e52100  ! 3826: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7355000  ! 3829: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xb1500000  ! 3831: RDPR_TPC	<illegal instruction>
	.word 0x919520fc  ! 3832: WRPR_PIL_I	wrpr	%r20, 0x00fc, %pil
	.word 0xbfe5a063  ! 3834: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x9194a197  ! 3836: WRPR_PIL_I	wrpr	%r18, 0x0197, %pil
	ta	T_CHANGE_HPRIV
	.word 0x819838db  ! 3837: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18db, %hpstate
	.word 0xbde5a120  ! 3839: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4601d  ! 3840: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e420bd  ! 3844: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x30233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a12d  ! 3854: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7643801  ! 3855: MOVcc_I	<illegal instruction>
	.word 0x83946053  ! 3859: WRPR_TNPC_I	wrpr	%r17, 0x0053, %tnpc
	.word 0xb6b4e13d  ! 3864: SUBCcc_I	orncc 	%r19, 0x013d, %r27
	.word 0xb3e56056  ! 3866: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e5e00b  ! 3869: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8394a0ca  ! 3870: WRPR_TNPC_I	wrpr	%r18, 0x00ca, %tnpc
	.word 0xbf518000  ! 3871: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4e003  ! 3874: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe0c8000  ! 3884: AND_R	and 	%r18, %r0, %r31
	.word 0xb1e5a11e  ! 3886: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe42008  ! 3890: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x3022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1f3  ! 3898: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e5a12b  ! 3904: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e52075  ! 3905: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x879460aa  ! 3906: WRPR_TT_I	wrpr	%r17, 0x00aa, %tt
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0a1  ! 3909: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5a179  ! 3913: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4e0c2  ! 3914: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e560e8  ! 3919: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde520e9  ! 3920: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8994a180  ! 3921: WRPR_TICK_I	wrpr	%r18, 0x0180, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982c4b  ! 3922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4b, %hpstate
	.word 0x8794e0ef  ! 3925: WRPR_TT_I	wrpr	%r19, 0x00ef, %tt
	.word 0xb32ce001  ! 3926: SLL_I	sll 	%r19, 0x0001, %r25
	.word 0xbfe52137  ! 3930: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe46129  ! 3932: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 3936: RDPR_TL	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 3937: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5a02f  ! 3940: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4204f  ! 3944: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4e072  ! 3945: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe521fd  ! 3947: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe4e055  ! 3949: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe56111  ! 3954: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe5e016  ! 3959: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe4a141  ! 3960: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5e007  ! 3961: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x32, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42023  ! 3966: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x1031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e520c2  ! 3972: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8794209d  ! 3975: WRPR_TT_I	wrpr	%r16, 0x009d, %tt
	.word 0xbde42143  ! 3976: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e09a  ! 3978: SAVE_I	save	%r19, 0x0001, %r30
	setx	data_start_4, %g1, %r19
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85942051  ! 3987: WRPR_TSTATE_I	wrpr	%r16, 0x0051, %tstate
	.word 0xb4b48000  ! 3990: SUBCcc_R	orncc 	%r18, %r0, %r26
	setx	data_start_3, %g1, %r21
	.word 0xbbe42114  ! 3993: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e42027  ! 3994: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5e05a  ! 3995: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde420f6  ! 3999: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e461fc  ! 4002: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5a0cc  ! 4006: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e561b8  ! 4010: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e5a0c8  ! 4017: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e116  ! 4019: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5510000  ! 4023: RDPR_TICK	<illegal instruction>
	.word 0xbbe4a10a  ! 4024: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4e05e  ! 4025: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbc858000  ! 4026: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xb205a180  ! 4027: ADD_I	add 	%r22, 0x0180, %r25
	setx	0x20033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e189  ! 4032: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5615c  ! 4033: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde46058  ! 4035: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xba2d211b  ! 4036: ANDN_I	andn 	%r20, 0x011b, %r29
	.word 0xb9e5e150  ! 4037: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e56147  ! 4039: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e5a186  ! 4042: SAVE_I	save	%r22, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 4044: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5a1d5  ! 4046: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb0c56075  ! 4048: ADDCcc_I	addccc 	%r21, 0x0075, %r24
	setx	data_start_2, %g1, %r20
	.word 0xb7e4e07e  ! 4050: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x20320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0d4  ! 4054: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4e05d  ! 4055: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5605c  ! 4056: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_2, %g1, %r16
	.word 0xb12c8000  ! 4059: SLL_R	sll 	%r18, %r0, %r24
	.word 0xb7e46148  ! 4061: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3d3001  ! 4070: SRAX_I	srax	%r20, 0x0001, %r31
	.word 0xb5e4614c  ! 4072: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e5e040  ! 4074: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e4200b  ! 4075: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x899420b1  ! 4084: WRPR_TICK_I	wrpr	%r16, 0x00b1, %tick
	.word 0xb1e461f3  ! 4086: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5a157  ! 4090: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5518000  ! 4091: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5210f  ! 4098: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e42189  ! 4101: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x85946176  ! 4105: WRPR_TSTATE_I	wrpr	%r17, 0x0176, %tstate
	.word 0xbde5a02c  ! 4107: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbf508000  ! 4113: RDPR_TSTATE	<illegal instruction>
	.word 0xb6c5e081  ! 4115: ADDCcc_I	addccc 	%r23, 0x0081, %r27
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1c4  ! 4117: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4607a  ! 4118: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbe854000  ! 4120: ADDcc_R	addcc 	%r21, %r0, %r31
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5200a  ! 4123: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb520000  ! 4125: RDPR_PIL	<illegal instruction>
	.word 0xbfe4216a  ! 4130: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe560e4  ! 4133: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbb510000  ! 4134: RDPR_TICK	<illegal instruction>
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a13c  ! 4142: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd2db001  ! 4147: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xbd520000  ! 4150: RDPR_PIL	<illegal instruction>
	.word 0xbde46039  ! 4151: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde4a1e0  ! 4153: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8795a096  ! 4154: WRPR_TT_I	wrpr	%r22, 0x0096, %tt
	.word 0xb9e521a8  ! 4155: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5a0f5  ! 4156: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4a1bd  ! 4159: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e56028  ! 4161: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4e1c3  ! 4162: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0ad0000  ! 4168: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xb7e46123  ! 4169: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 4171: MOVcc_R	<illegal instruction>
	.word 0xba858000  ! 4176: ADDcc_R	addcc 	%r22, %r0, %r29
	.word 0xb1e5a0ea  ! 4177: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbe35e0d1  ! 4179: SUBC_I	orn 	%r23, 0x00d1, %r31
	.word 0xbf346001  ! 4180: SRL_I	srl 	%r17, 0x0001, %r31
	.word 0xbde5e033  ! 4183: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe56021  ! 4185: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbb50c000  ! 4189: RDPR_TT	<illegal instruction>
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e12a  ! 4193: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5a10c  ! 4195: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e4e1d2  ! 4196: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4e1a2  ! 4197: SAVE_I	save	%r19, 0x0001, %r31
	mov	2, %r14
	.word 0xa193a000  ! 4198: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_2, %g1, %r23
	.word 0xb5e42056  ! 4200: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf50c000  ! 4201: RDPR_TT	<illegal instruction>
	.word 0x8194616f  ! 4204: WRPR_TPC_I	wrpr	%r17, 0x016f, %tpc
	.word 0x8395e163  ! 4213: WRPR_TNPC_I	wrpr	%r23, 0x0163, %tnpc
	.word 0xb035e19a  ! 4214: SUBC_I	orn 	%r23, 0x019a, %r24
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0c4  ! 4218: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4216d  ! 4219: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb0c48000  ! 4220: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xb9e56195  ! 4222: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5a07f  ! 4224: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e4a030  ! 4226: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983fc3  ! 4229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc3, %hpstate
	mov	1, %r14
	.word 0xa193a000  ! 4230: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4e01d  ! 4231: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe52079  ! 4233: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x839520e2  ! 4235: WRPR_TNPC_I	wrpr	%r20, 0x00e2, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81982dd1  ! 4237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd1, %hpstate
	.word 0xb3e5a01c  ! 4238: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e173  ! 4240: WRPR_PIL_I	wrpr	%r19, 0x0173, %pil
	.word 0xb3e5a072  ! 4241: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5e041  ! 4242: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xba0c20d2  ! 4243: AND_I	and 	%r16, 0x00d2, %r29
	.word 0xba34c000  ! 4244: ORN_R	orn 	%r19, %r0, %r29
	.word 0x9195a1b5  ! 4249: WRPR_PIL_I	wrpr	%r22, 0x01b5, %pil
	.word 0xb5e52190  ! 4253: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbe14a06d  ! 4255: OR_I	or 	%r18, 0x006d, %r31
	.word 0xb135c000  ! 4256: SRL_R	srl 	%r23, %r0, %r24
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a087  ! 4276: WRPR_TPC_I	wrpr	%r18, 0x0087, %tpc
	.word 0x8595a027  ! 4278: WRPR_TSTATE_I	wrpr	%r22, 0x0027, %tstate
	.word 0xb5e460db  ! 4280: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe4a123  ! 4281: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe561e2  ! 4285: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4e067  ! 4288: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb645219b  ! 4289: ADDC_I	addc 	%r20, 0x019b, %r27
	.word 0xb951c000  ! 4292: RDPR_TL	<illegal instruction>
	.word 0xb9e4e1e2  ! 4295: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e52018  ! 4301: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe461d0  ! 4305: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5617c  ! 4308: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1a9  ! 4316: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e461b0  ! 4317: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8195e1ca  ! 4319: WRPR_TPC_I	wrpr	%r23, 0x01ca, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982d91  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d91, %hpstate
	.word 0xb9e4e1e3  ! 4323: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e56154  ! 4327: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e041  ! 4330: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbd480000  ! 4331: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbb520000  ! 4334: RDPR_PIL	<illegal instruction>
	.word 0xbde4a041  ! 4335: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5e128  ! 4338: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942020  ! 4343: WRPR_TPC_I	wrpr	%r16, 0x0020, %tpc
	.word 0xb3e461a6  ! 4344: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x819421d1  ! 4347: WRPR_TPC_I	wrpr	%r16, 0x01d1, %tpc
	.word 0x8994a105  ! 4354: WRPR_TICK_I	wrpr	%r18, 0x0105, %tick
	.word 0x8195e063  ! 4358: WRPR_TPC_I	wrpr	%r23, 0x0063, %tpc
	.word 0x8d94a062  ! 4359: WRPR_PSTATE_I	wrpr	%r18, 0x0062, %pstate
	.word 0xb9e46044  ! 4360: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_1, %g1, %r21
	.word 0xb9e4a021  ! 4363: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb69ce19e  ! 4364: XORcc_I	xorcc 	%r19, 0x019e, %r27
	.word 0xb1e4a168  ! 4365: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbf2d9000  ! 4367: SLLX_R	sllx	%r22, %r0, %r31
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5612d  ! 4375: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e5e087  ! 4381: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8d95618d  ! 4383: WRPR_PSTATE_I	wrpr	%r21, 0x018d, %pstate
	.word 0xb3e5e14b  ! 4384: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982a0b  ! 4388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0b, %hpstate
	.word 0xbfe4613a  ! 4390: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5a065  ! 4394: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e4a0c3  ! 4395: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb950c000  ! 4396: RDPR_TT	<illegal instruction>
	.word 0xb3540000  ! 4399: RDPR_GL	<illegal instruction>
	.word 0xb5e4a008  ! 4400: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb48c4000  ! 4401: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xbc040000  ! 4406: ADD_R	add 	%r16, %r0, %r30
	.word 0xbbe4e0a4  ! 4410: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5a00f  ! 4414: SAVE_I	save	%r22, 0x0001, %r31
	mov	2, %r14
	.word 0xa193a000  ! 4416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e56022  ! 4417: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e560ad  ! 4418: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5e0bf  ! 4420: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e42051  ! 4421: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4e04a  ! 4427: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe4e011  ! 4432: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e421b1  ! 4434: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e460f7  ! 4439: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb88dc000  ! 4445: ANDcc_R	andcc 	%r23, %r0, %r28
	.word 0xb5e4e155  ! 4451: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e4612e  ! 4452: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e461a8  ! 4453: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5e1a8  ! 4457: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x30001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a05c  ! 4460: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbd50c000  ! 4461: RDPR_TT	<illegal instruction>
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb68560d7  ! 4465: ADDcc_I	addcc 	%r21, 0x00d7, %r27
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe421a8  ! 4469: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e52168  ! 4471: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3480000  ! 4484: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xba2c0000  ! 4489: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xb1e4605b  ! 4490: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb0ada09f  ! 4492: ANDNcc_I	andncc 	%r22, 0x009f, %r24
	.word 0xbe8ce16b  ! 4496: ANDcc_I	andcc 	%r19, 0x016b, %r31
	.word 0xbfe4215e  ! 4497: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x85956175  ! 4498: WRPR_TSTATE_I	wrpr	%r21, 0x0175, %tstate
	.word 0xbfe4a087  ! 4499: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e461e6  ! 4503: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8d95a0de  ! 4505: WRPR_PSTATE_I	wrpr	%r22, 0x00de, %pstate
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e56051  ! 4511: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e461dc  ! 4512: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5e158  ! 4513: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e5a15f  ! 4515: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8594e153  ! 4516: WRPR_TSTATE_I	wrpr	%r19, 0x0153, %tstate
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeac2012  ! 4520: ANDNcc_I	andncc 	%r16, 0x0012, %r31
	.word 0xb605a191  ! 4522: ADD_I	add 	%r22, 0x0191, %r27
	.word 0xb6844000  ! 4525: ADDcc_R	addcc 	%r17, %r0, %r27
	setx	data_start_5, %g1, %r16
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 4531: RDPR_GL	<illegal instruction>
	.word 0xb1e5e187  ! 4534: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3510000  ! 4536: RDPR_TICK	<illegal instruction>
	.word 0xb5e5a0a9  ! 4537: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e521df  ! 4538: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x9195e0d7  ! 4543: WRPR_PIL_I	wrpr	%r23, 0x00d7, %pil
	.word 0xb5e5604b  ! 4546: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5200b  ! 4547: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe4e139  ! 4553: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5480000  ! 4554: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8d95a04c  ! 4555: WRPR_PSTATE_I	wrpr	%r22, 0x004c, %pstate
	.word 0xbbe5a0b2  ! 4558: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbd51c000  ! 4560: RDPR_TL	<illegal instruction>
	.word 0xbde5e02e  ! 4561: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e460a0  ! 4563: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e42169  ! 4564: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5a0b0  ! 4565: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x879560ad  ! 4570: WRPR_TT_I	wrpr	%r21, 0x00ad, %tt
	.word 0xb1e5a1cb  ! 4572: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5e1a2  ! 4576: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde52007  ! 4579: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde5a15f  ! 4586: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb37c4400  ! 4594: MOVR_R	movre	%r17, %r0, %r25
	.word 0xb1e5a169  ! 4595: SAVE_I	save	%r22, 0x0001, %r24
	mov	1, %r12
	.word 0x8f932000  ! 4597: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb504000  ! 4598: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4204e  ! 4599: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e090  ! 4611: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e4a1df  ! 4613: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5a129  ! 4620: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e560a7  ! 4622: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9345000  ! 4626: SRLX_R	srlx	%r17, %r0, %r28
	.word 0xb3520000  ! 4629: RDPR_PIL	<illegal instruction>
	.word 0xb3e4e1a1  ! 4631: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe460f4  ! 4634: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983e11  ! 4635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e11, %hpstate
	.word 0xbde46103  ! 4636: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbe8561aa  ! 4637: ADDcc_I	addcc 	%r21, 0x01aa, %r31
	.word 0xb3540000  ! 4638: RDPR_GL	<illegal instruction>
	.word 0xbb34c000  ! 4642: SRL_R	srl 	%r19, %r0, %r29
	.word 0xb950c000  ! 4645: RDPR_TT	<illegal instruction>
	.word 0xbbe5e011  ! 4646: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb694e0eb  ! 4647: ORcc_I	orcc 	%r19, 0x00eb, %r27
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0a58000  ! 4653: SUBcc_R	subcc 	%r22, %r0, %r24
	.word 0xbfe421c8  ! 4654: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5a0b0  ! 4656: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e52111  ! 4657: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5a186  ! 4662: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8595a19c  ! 4663: WRPR_TSTATE_I	wrpr	%r22, 0x019c, %tstate
	.word 0xbd504000  ! 4665: RDPR_TNPC	<illegal instruction>
	.word 0xbde42158  ! 4666: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb643801  ! 4667: MOVcc_I	<illegal instruction>
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0ea  ! 4669: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e4e171  ! 4671: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbf500000  ! 4672: RDPR_TPC	<illegal instruction>
	.word 0xb7e5214a  ! 4673: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e560bd  ! 4676: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5e000  ! 4680: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe52013  ! 4683: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e52039  ! 4684: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x83942006  ! 4685: WRPR_TNPC_I	wrpr	%r16, 0x0006, %tnpc
	.word 0xb1e5a084  ! 4687: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe56177  ! 4689: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5a186  ! 4691: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e42127  ! 4693: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8d9561ce  ! 4695: WRPR_PSTATE_I	wrpr	%r21, 0x01ce, %pstate
	.word 0xbb504000  ! 4697: RDPR_TNPC	<illegal instruction>
	.word 0x8194a03a  ! 4699: WRPR_TPC_I	wrpr	%r18, 0x003a, %tpc
	.word 0x8994e04c  ! 4700: WRPR_TICK_I	wrpr	%r19, 0x004c, %tick
	.word 0xb7e46181  ! 4705: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x879460c4  ! 4706: WRPR_TT_I	wrpr	%r17, 0x00c4, %tt
	.word 0xb1e4a168  ! 4709: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e46141  ! 4710: SAVE_I	save	%r17, 0x0001, %r24
	mov	0, %r14
	.word 0xa193a000  ! 4711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5a05f  ! 4712: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5e174  ! 4714: SAVE_I	save	%r23, 0x0001, %r28
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9560f9  ! 4716: ORcc_I	orcc 	%r21, 0x00f9, %r29
	mov	2, %r14
	.word 0xa193a000  ! 4720: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d94e1ef  ! 4721: WRPR_PSTATE_I	wrpr	%r19, 0x01ef, %pstate
	.word 0xbbe5e07f  ! 4722: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_2, %g1, %r22
	.word 0xb1e4a0f2  ! 4725: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4a1c8  ! 4727: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e5a041  ! 4728: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_0, %g1, %r16
	.word 0xb9e5a016  ! 4731: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5a0da  ! 4733: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb804a13f  ! 4744: ADD_I	add 	%r18, 0x013f, %r28
	.word 0xb63520be  ! 4745: SUBC_I	orn 	%r20, 0x00be, %r27
	.word 0xbe3520e1  ! 4748: SUBC_I	orn 	%r20, 0x00e1, %r31
	.word 0xb7e520a1  ! 4750: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8994e0e7  ! 4751: WRPR_TICK_I	wrpr	%r19, 0x00e7, %tick
	.word 0xb3e560e2  ! 4753: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8394a043  ! 4755: WRPR_TNPC_I	wrpr	%r18, 0x0043, %tnpc
	.word 0xb5e4e082  ! 4758: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e4a0fe  ! 4761: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	.word 0x91942149  ! 4765: WRPR_PIL_I	wrpr	%r16, 0x0149, %pil
	setx	data_start_1, %g1, %r19
	.word 0xbf50c000  ! 4769: RDPR_TT	<illegal instruction>
	.word 0xb7e4e07a  ! 4778: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1356001  ! 4781: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xb7e420b9  ! 4782: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd3db001  ! 4785: SRAX_I	srax	%r22, 0x0001, %r30
	setx	data_start_6, %g1, %r17
	.word 0xbfe5e178  ! 4788: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8795e0b3  ! 4794: WRPR_TT_I	wrpr	%r23, 0x00b3, %tt
	.word 0xb9e421c7  ! 4795: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_6, %g1, %r16
	.word 0x8595a1df  ! 4801: WRPR_TSTATE_I	wrpr	%r22, 0x01df, %tstate
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12d5000  ! 4804: SLLX_R	sllx	%r21, %r0, %r24
	.word 0xb351c000  ! 4809: RDPR_TL	<illegal instruction>
	.word 0xb951c000  ! 4811: RDPR_TL	<illegal instruction>
	.word 0xb9e420b2  ! 4820: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe46058  ! 4822: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982b41  ! 4823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b41, %hpstate
	.word 0xb8442148  ! 4824: ADDC_I	addc 	%r16, 0x0148, %r28
	.word 0x8395215b  ! 4826: WRPR_TNPC_I	wrpr	%r20, 0x015b, %tnpc
	.word 0xb5e560ba  ! 4829: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x20129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5606c  ! 4836: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 4842: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4a07b  ! 4846: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9561b5  ! 4851: WRPR_PSTATE_I	wrpr	%r21, 0x01b5, %pstate
	.word 0xb025e0f3  ! 4852: SUB_I	sub 	%r23, 0x00f3, %r24
	.word 0xb1e4a1ce  ! 4854: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4a065  ! 4857: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e42130  ! 4860: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e5a090  ! 4864: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e4a170  ! 4866: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb09520db  ! 4870: ORcc_I	orcc 	%r20, 0x00db, %r24
	.word 0xb9e5e107  ! 4871: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe42087  ! 4872: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e4a18d  ! 4873: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e52075  ! 4876: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e52134  ! 4879: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4218d  ! 4883: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe4e032  ! 4884: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e461b3  ! 4889: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4e1a3  ! 4890: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x919461b8  ! 4892: WRPR_PIL_I	wrpr	%r17, 0x01b8, %pil
	.word 0xb151c000  ! 4893: RDPR_TL	<illegal instruction>
	.word 0xb951c000  ! 4895: RDPR_TL	<illegal instruction>
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56192  ! 4900: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb28d8000  ! 4907: ANDcc_R	andcc 	%r22, %r0, %r25
	.word 0x83956016  ! 4908: WRPR_TNPC_I	wrpr	%r21, 0x0016, %tnpc
	.word 0xb5500000  ! 4913: RDPR_TPC	<illegal instruction>
	.word 0xb7e4e16d  ! 4916: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x30316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41da19d  ! 4922: XOR_I	xor 	%r22, 0x019d, %r26
	.word 0xbc9ce04c  ! 4928: XORcc_I	xorcc 	%r19, 0x004c, %r30
	.word 0xbfe5207a  ! 4929: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe4e1ce  ! 4933: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x85942050  ! 4936: WRPR_TSTATE_I	wrpr	%r16, 0x0050, %tstate
	.word 0xbde56179  ! 4937: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e5e1dd  ! 4940: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e46162  ! 4944: SAVE_I	save	%r17, 0x0001, %r24
	mov	0, %r12
	.word 0x8f932000  ! 4946: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982cd1  ! 4947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd1, %hpstate
	.word 0xb1e56152  ! 4948: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8d95e175  ! 4950: WRPR_PSTATE_I	wrpr	%r23, 0x0175, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r22
	setx	0x3022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4209c  ! 4960: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7344000  ! 4968: SRL_R	srl 	%r17, %r0, %r27
	.word 0xbde5a098  ! 4970: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x899561c0  ! 4973: WRPR_TICK_I	wrpr	%r21, 0x01c0, %tick
	.word 0xb7e46003  ! 4974: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e4a002  ! 4975: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbe148000  ! 4976: OR_R	or 	%r18, %r0, %r31
	.word 0xbde421cc  ! 4978: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb095e1d3  ! 4979: ORcc_I	orcc 	%r23, 0x01d3, %r24
	.word 0xb8c5211e  ! 4980: ADDCcc_I	addccc 	%r20, 0x011e, %r28
	.word 0xbde5610e  ! 4981: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4a15c  ! 4982: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbb35d000  ! 4983: SRLX_R	srlx	%r23, %r0, %r29
	.word 0xb1e5e064  ! 4984: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e4e1c6  ! 4985: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb520000  ! 4988: RDPR_PIL	<illegal instruction>
	setx	0x30202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 4997: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5615d  ! 4998: SAVE_I	save	%r21, 0x0001, %r28
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
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf73da127  ! 2: STDF_I	std	%f27, [0x0127, %r22]
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3d6001  ! 5: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xf13c4000  ! 6: STDF_R	std	%f24, [%r0, %r17]
	.word 0xfe2d20cb  ! 7: STB_I	stb	%r31, [%r20 + 0x00cb]
	.word 0xfe3460ef  ! 8: STH_I	sth	%r31, [%r17 + 0x00ef]
	.word 0xbd508000  ! 15: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf834e01a  ! 20: STH_I	sth	%r28, [%r19 + 0x001a]
	.word 0xf4240000  ! 22: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb9504000  ! 25: RDPR_TNPC	<illegal instruction>
	.word 0xf93c2016  ! 27: STDF_I	std	%f28, [0x0016, %r16]
	.word 0xb93ce001  ! 40: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0xf43da074  ! 47: STD_I	std	%r26, [%r22 + 0x0074]
	.word 0xf0354000  ! 49: STH_R	sth	%r24, [%r21 + %r0]
	setx	0x30112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2146118  ! 54: OR_I	or 	%r17, 0x0118, %r25
	.word 0xfa25e0fd  ! 57: STW_I	stw	%r29, [%r23 + 0x00fd]
	.word 0x8995e065  ! 61: WRPR_TICK_I	wrpr	%r23, 0x0065, %tick
	.word 0xf23c8000  ! 62: STD_R	std	%r25, [%r18 + %r0]
	.word 0xf73d61a3  ! 70: STDF_I	std	%f27, [0x01a3, %r21]
	.word 0xf53d2180  ! 73: STDF_I	std	%f26, [0x0180, %r20]
	.word 0xf2344000  ! 74: STH_R	sth	%r25, [%r17 + %r0]
	setx	data_start_6, %g1, %r17
	.word 0xf4342169  ! 82: STH_I	sth	%r26, [%r16 + 0x0169]
	.word 0xfa2da00d  ! 83: STB_I	stb	%r29, [%r22 + 0x000d]
	ta	T_CHANGE_HPRIV
	.word 0x81983919  ! 84: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1919, %hpstate
	.word 0xf025c000  ! 86: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xb3508000  ! 88: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf42d0000  ! 89: STB_R	stb	%r26, [%r20 + %r0]
	.word 0x8595a122  ! 94: WRPR_TSTATE_I	wrpr	%r22, 0x0122, %tstate
	.word 0xf634a079  ! 96: STH_I	sth	%r27, [%r18 + 0x0079]
	.word 0x9194a0d1  ! 97: WRPR_PIL_I	wrpr	%r18, 0x00d1, %pil
	.word 0xf6258000  ! 99: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xfa2d4000  ! 101: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf474a092  ! 104: STX_I	stx	%r26, [%r18 + 0x0092]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc25e1eb  ! 106: STW_I	stw	%r30, [%r23 + 0x01eb]
	.word 0xf63ce021  ! 110: STD_I	std	%r27, [%r19 + 0x0021]
	.word 0xb3354000  ! 111: SRL_R	srl 	%r21, %r0, %r25
	setx	data_start_3, %g1, %r16
	.word 0x9194a0ea  ! 113: WRPR_PIL_I	wrpr	%r18, 0x00ea, %pil
	.word 0xfc2d4000  ! 115: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf234a013  ! 120: STH_I	sth	%r25, [%r18 + 0x0013]
	.word 0xb151c000  ! 128: RDPR_TL	rdpr	%tl, %r24
	.word 0xf63d2159  ! 131: STD_I	std	%r27, [%r20 + 0x0159]
	.word 0xf62d4000  ! 133: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xb13c1000  ! 134: SRAX_R	srax	%r16, %r0, %r24
	.word 0xf434c000  ! 135: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf62521f3  ! 146: STW_I	stw	%r27, [%r20 + 0x01f3]
	.word 0xb28ca164  ! 150: ANDcc_I	andcc 	%r18, 0x0164, %r25
	.word 0x8595e0c8  ! 152: WRPR_TSTATE_I	wrpr	%r23, 0x00c8, %tstate
	.word 0xb150c000  ! 157: RDPR_TT	rdpr	%tt, %r24
	.word 0x9195a112  ! 160: WRPR_PIL_I	wrpr	%r22, 0x0112, %pil
	.word 0xb37dc400  ! 162: MOVR_R	movre	%r23, %r0, %r25
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24a140  ! 165: STW_I	stw	%r30, [%r18 + 0x0140]
	.word 0xf034a11d  ! 166: STH_I	sth	%r24, [%r18 + 0x011d]
	.word 0xbf518000  ! 172: RDPR_PSTATE	rdpr	%pstate, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983ecb  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ecb, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982cc9  ! 174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc9, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8d95a01b  ! 181: WRPR_PSTATE_I	wrpr	%r22, 0x001b, %pstate
	.word 0xb6b460ef  ! 182: SUBCcc_I	orncc 	%r17, 0x00ef, %r27
	.word 0xb7480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83952187  ! 195: WRPR_TNPC_I	wrpr	%r20, 0x0187, %tnpc
	.word 0xfe3c8000  ! 197: STD_R	std	%r31, [%r18 + %r0]
	.word 0x919461ac  ! 198: WRPR_PIL_I	wrpr	%r17, 0x01ac, %pil
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb50c000  ! 206: RDPR_TT	rdpr	%tt, %r29
	.word 0xf33cc000  ! 207: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf07421c3  ! 210: STX_I	stx	%r24, [%r16 + 0x01c3]
	mov	0, %r14
	.word 0xa193a000  ! 212: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa3d2133  ! 215: STD_I	std	%r29, [%r20 + 0x0133]
	.word 0xfd3c6053  ! 218: STDF_I	std	%f30, [0x0053, %r17]
	.word 0xb5520000  ! 222: RDPR_PIL	rdpr	%pil, %r26
	.word 0xff3c207e  ! 226: STDF_I	std	%f31, [0x007e, %r16]
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ed9  ! 230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed9, %hpstate
	.word 0xb9520000  ! 234: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf634a1c7  ! 236: STH_I	sth	%r27, [%r18 + 0x01c7]
	.word 0xfb3d8000  ! 237: STDF_R	std	%f29, [%r0, %r22]
	setx	data_start_3, %g1, %r20
	.word 0x9194e1b2  ! 239: WRPR_PIL_I	wrpr	%r19, 0x01b2, %pil
	.word 0x8994e099  ! 243: WRPR_TICK_I	wrpr	%r19, 0x0099, %tick
	.word 0xf62cc000  ! 247: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf624603e  ! 248: STW_I	stw	%r27, [%r17 + 0x003e]
	.word 0xb6ada18a  ! 251: ANDNcc_I	andncc 	%r22, 0x018a, %r27
	.word 0xf03c21b8  ! 254: STD_I	std	%r24, [%r16 + 0x01b8]
	.word 0xf43c6169  ! 257: STD_I	std	%r26, [%r17 + 0x0169]
	.word 0xf0250000  ! 260: STW_R	stw	%r24, [%r20 + %r0]
	.word 0x83942140  ! 261: WRPR_TNPC_I	wrpr	%r16, 0x0140, %tnpc
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33d1000  ! 265: SRAX_R	srax	%r20, %r0, %r25
	.word 0xbcb5c000  ! 266: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0x8794e0f1  ! 268: WRPR_TT_I	wrpr	%r19, 0x00f1, %tt
	.word 0xf8248000  ! 270: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf424c000  ! 272: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf075611e  ! 273: STX_I	stx	%r24, [%r21 + 0x011e]
	.word 0xf225e021  ! 276: STW_I	stw	%r25, [%r23 + 0x0021]
	.word 0xf8244000  ! 281: STW_R	stw	%r28, [%r17 + %r0]
	setx	data_start_0, %g1, %r17
	.word 0xf425c000  ! 284: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xfb3d0000  ! 289: STDF_R	std	%f29, [%r0, %r20]
	.word 0xfe246108  ! 290: STW_I	stw	%r31, [%r17 + 0x0108]
	.word 0xb52de001  ! 292: SLL_I	sll 	%r23, 0x0001, %r26
	.word 0xb1510000  ! 295: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb72cd000  ! 296: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xf8354000  ! 298: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xb2352113  ! 301: SUBC_I	orn 	%r20, 0x0113, %r25
	.word 0xf8354000  ! 302: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf474a1c5  ! 304: STX_I	stx	%r26, [%r18 + 0x01c5]
	.word 0xf02d2150  ! 305: STB_I	stb	%r24, [%r20 + 0x0150]
	.word 0x89956047  ! 306: WRPR_TICK_I	wrpr	%r21, 0x0047, %tick
	.word 0xbf540000  ! 310: RDPR_GL	rdpr	%-, %r31
	.word 0xb13d5000  ! 313: SRAX_R	srax	%r21, %r0, %r24
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf275a193  ! 315: STX_I	stx	%r25, [%r22 + 0x0193]
	.word 0xfc2de0c8  ! 316: STB_I	stb	%r30, [%r23 + 0x00c8]
	.word 0xf33c2062  ! 320: STDF_I	std	%f25, [0x0062, %r16]
	.word 0xfb3c201f  ! 321: STDF_I	std	%f29, [0x001f, %r16]
	.word 0xb7355000  ! 325: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xb4b5e0e6  ! 326: ORNcc_I	orncc 	%r23, 0x00e6, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b89  ! 333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b89, %hpstate
	.word 0xb6442161  ! 335: ADDC_I	addc 	%r16, 0x0161, %r27
	.word 0xbb3dd000  ! 337: SRAX_R	srax	%r23, %r0, %r29
	setx	data_start_3, %g1, %r16
	.word 0xbb50c000  ! 350: RDPR_TT	rdpr	%tt, %r29
	.word 0xbd480000  ! 353: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf33d4000  ! 354: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf4242147  ! 355: STW_I	stw	%r26, [%r16 + 0x0147]
	setx	data_start_7, %g1, %r17
	.word 0xb41560bb  ! 357: OR_I	or 	%r21, 0x00bb, %r26
	.word 0xfa742049  ! 360: STX_I	stx	%r29, [%r16 + 0x0049]
	.word 0xf82c6013  ! 362: STB_I	stb	%r28, [%r17 + 0x0013]
	.word 0x81952085  ! 368: WRPR_TPC_I	wrpr	%r20, 0x0085, %tpc
	.word 0xfa25c000  ! 369: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xb1518000  ! 370: RDPR_PSTATE	rdpr	%pstate, %r24
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a1ad  ! 372: WRPR_TICK_I	wrpr	%r22, 0x01ad, %tick
	.word 0xf42ce0bf  ! 373: STB_I	stb	%r26, [%r19 + 0x00bf]
	.word 0xb1504000  ! 377: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf8240000  ! 380: STW_R	stw	%r28, [%r16 + %r0]
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3de02d  ! 390: STDF_I	std	%f31, [0x002d, %r23]
	.word 0xbd7d0400  ! 392: MOVR_R	movre	%r20, %r0, %r30
	.word 0xf675c000  ! 393: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xfe756034  ! 397: STX_I	stx	%r31, [%r21 + 0x0034]
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82ce01d  ! 403: ANDN_I	andn 	%r19, 0x001d, %r28
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43c4000  ! 407: STD_R	std	%r26, [%r17 + %r0]
	.word 0xf8342038  ! 409: STH_I	sth	%r28, [%r16 + 0x0038]
	.word 0xfa3561b2  ! 412: STH_I	sth	%r29, [%r21 + 0x01b2]
	.word 0xfa3c6074  ! 414: STD_I	std	%r29, [%r17 + 0x0074]
	.word 0xfa2cc000  ! 417: STB_R	stb	%r29, [%r19 + %r0]
	.word 0x8d94e016  ! 418: WRPR_PSTATE_I	wrpr	%r19, 0x0016, %pstate
	.word 0xfe2c61e0  ! 419: STB_I	stb	%r31, [%r17 + 0x01e0]
	.word 0xb12c2001  ! 422: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x859421dd  ! 427: WRPR_TSTATE_I	wrpr	%r16, 0x01dd, %tstate
	.word 0xfc740000  ! 429: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xbf3dc000  ! 436: SRA_R	sra 	%r23, %r0, %r31
	.word 0xf82c4000  ! 437: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xb00ca0f6  ! 442: AND_I	and 	%r18, 0x00f6, %r24
	.word 0xf13d8000  ! 444: STDF_R	std	%f24, [%r0, %r22]
	.word 0xb4244000  ! 445: SUB_R	sub 	%r17, %r0, %r26
	.word 0xb49ce0bc  ! 446: XORcc_I	xorcc 	%r19, 0x00bc, %r26
	.word 0xba450000  ! 447: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xf635a1cf  ! 448: STH_I	sth	%r27, [%r22 + 0x01cf]
	.word 0xf03d608c  ! 449: STD_I	std	%r24, [%r21 + 0x008c]
	.word 0xb81d61f2  ! 451: XOR_I	xor 	%r21, 0x01f2, %r28
	.word 0xbd540000  ! 452: RDPR_GL	rdpr	%-, %r30
	.word 0xb1508000  ! 454: RDPR_TSTATE	<illegal instruction>
	setx	0x30204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879520cc  ! 457: WRPR_TT_I	wrpr	%r20, 0x00cc, %tt
	.word 0xf33ca05e  ! 458: STDF_I	std	%f25, [0x005e, %r18]
	.word 0xb9540000  ! 460: RDPR_GL	rdpr	%-, %r28
	.word 0xfc254000  ! 461: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf02ce1fc  ! 464: STB_I	stb	%r24, [%r19 + 0x01fc]
	.word 0xb3540000  ! 465: RDPR_GL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 467: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe3d4000  ! 469: STD_R	std	%r31, [%r21 + %r0]
	.word 0xf82c0000  ! 470: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf824c000  ! 472: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf2340000  ! 473: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf42d60a9  ! 475: STB_I	stb	%r26, [%r21 + 0x00a9]
	.word 0xfe240000  ! 477: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf43d2175  ! 478: STD_I	std	%r26, [%r20 + 0x0175]
	.word 0xf4252002  ! 480: STW_I	stw	%r26, [%r20 + 0x0002]
	ta	T_CHANGE_HPRIV
	.word 0x81982ad9  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad9, %hpstate
	.word 0xb6054000  ! 482: ADD_R	add 	%r21, %r0, %r27
	.word 0xb1504000  ! 484: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x8794e038  ! 489: WRPR_TT_I	wrpr	%r19, 0x0038, %tt
	.word 0xf2258000  ! 490: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xbc24a128  ! 491: SUB_I	sub 	%r18, 0x0128, %r30
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e0bd  ! 496: WRPR_TT_I	wrpr	%r23, 0x00bd, %tt
	.word 0xb3347001  ! 497: SRLX_I	srlx	%r17, 0x0001, %r25
	.word 0xfa344000  ! 498: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfa2c4000  ! 499: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xfe25e185  ! 501: STW_I	stw	%r31, [%r23 + 0x0185]
	.word 0x9195e0f2  ! 503: WRPR_PIL_I	wrpr	%r23, 0x00f2, %pil
	.word 0xfc3dc000  ! 504: STD_R	std	%r30, [%r23 + %r0]
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72c3001  ! 508: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xf73c4000  ! 510: STDF_R	std	%f27, [%r0, %r17]
	.word 0xb9540000  ! 517: RDPR_GL	rdpr	%-, %r28
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c93  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c93, %hpstate
	.word 0xf4254000  ! 525: STW_R	stw	%r26, [%r21 + %r0]
	.word 0x899520dc  ! 527: WRPR_TICK_I	wrpr	%r20, 0x00dc, %tick
	.word 0xb13d4000  ! 529: SRA_R	sra 	%r21, %r0, %r24
	.word 0xfe2d0000  ! 530: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfa24e171  ! 532: STW_I	stw	%r29, [%r19 + 0x0171]
	.word 0xbf3c6001  ! 535: SRA_I	sra 	%r17, 0x0001, %r31
	.word 0xf03d0000  ! 541: STD_R	std	%r24, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e81  ! 542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e81, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 543: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb4444000  ! 546: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xf83d4000  ! 552: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfe75e1c3  ! 554: STX_I	stx	%r31, [%r23 + 0x01c3]
	.word 0x8d95e097  ! 555: WRPR_PSTATE_I	wrpr	%r23, 0x0097, %pstate
	.word 0xf93c6097  ! 556: STDF_I	std	%f28, [0x0097, %r17]
	.word 0xb151c000  ! 561: RDPR_TL	rdpr	%tl, %r24
	.word 0x919521b4  ! 565: WRPR_PIL_I	wrpr	%r20, 0x01b4, %pil
	setx	0x20026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24e1b7  ! 573: STW_I	stw	%r31, [%r19 + 0x01b7]
	.word 0xbf510000  ! 574: RDPR_TICK	rdpr	%tick, %r31
	.word 0xb645619f  ! 578: ADDC_I	addc 	%r21, 0x019f, %r27
	.word 0xb550c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xbc444000  ! 582: ADDC_R	addc 	%r17, %r0, %r30
	.word 0xfa75e0fe  ! 584: STX_I	stx	%r29, [%r23 + 0x00fe]
	.word 0xb1500000  ! 586: RDPR_TPC	<illegal instruction>
	.word 0xf0356189  ! 589: STH_I	sth	%r24, [%r21 + 0x0189]
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe354000  ! 598: STH_R	sth	%r31, [%r21 + %r0]
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2ca0a7  ! 600: STB_I	stb	%r31, [%r18 + 0x00a7]
	.word 0x9195a0f4  ! 601: WRPR_PIL_I	wrpr	%r22, 0x00f4, %pil
	.word 0xfe248000  ! 604: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf275a076  ! 608: STX_I	stx	%r25, [%r22 + 0x0076]
	.word 0xfc2dc000  ! 609: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf6754000  ! 611: STX_R	stx	%r27, [%r21 + %r0]
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94612c  ! 615: WRPR_PSTATE_I	wrpr	%r17, 0x012c, %pstate
	.word 0xfe35e1ca  ! 618: STH_I	sth	%r31, [%r23 + 0x01ca]
	.word 0xf4758000  ! 625: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf075c000  ! 626: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xfa2ce0e5  ! 628: STB_I	stb	%r29, [%r19 + 0x00e5]
	setx	0x1033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982fd3  ! 631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	setx	data_start_7, %g1, %r18
	.word 0xfa2da138  ! 635: STB_I	stb	%r29, [%r22 + 0x0138]
	.word 0xf42dc000  ! 636: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf6352172  ! 638: STH_I	sth	%r27, [%r20 + 0x0172]
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc354000  ! 643: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf074e1fd  ! 645: STX_I	stx	%r24, [%r19 + 0x01fd]
	.word 0xb3480000  ! 646: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf224a028  ! 647: STW_I	stw	%r25, [%r18 + 0x0028]
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82520d3  ! 660: STW_I	stw	%r28, [%r20 + 0x00d3]
	.word 0xf33d61f2  ! 663: STDF_I	std	%f25, [0x01f2, %r21]
	mov	0, %r12
	.word 0x8f932000  ! 667: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe75613d  ! 669: STX_I	stx	%r31, [%r21 + 0x013d]
	.word 0xbe450000  ! 670: ADDC_R	addc 	%r20, %r0, %r31
	.word 0xf42d2175  ! 672: STB_I	stb	%r26, [%r20 + 0x0175]
	.word 0x8194e0d5  ! 676: WRPR_TPC_I	wrpr	%r19, 0x00d5, %tpc
	.word 0xf874a17d  ! 677: STX_I	stx	%r28, [%r18 + 0x017d]
	.word 0xf03de118  ! 681: STD_I	std	%r24, [%r23 + 0x0118]
	.word 0xb00c0000  ! 682: AND_R	and 	%r16, %r0, %r24
	.word 0xfc742071  ! 686: STX_I	stx	%r30, [%r16 + 0x0071]
	.word 0x89942077  ! 689: WRPR_TICK_I	wrpr	%r16, 0x0077, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	.word 0xb5520000  ! 692: RDPR_PIL	rdpr	%pil, %r26
	.word 0xba958000  ! 693: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xf075e141  ! 695: STX_I	stx	%r24, [%r23 + 0x0141]
	.word 0xf13c21f6  ! 698: STDF_I	std	%f24, [0x01f6, %r16]
	.word 0x8d94a16d  ! 701: WRPR_PSTATE_I	wrpr	%r18, 0x016d, %pstate
	.word 0xfa2460ca  ! 703: STW_I	stw	%r29, [%r17 + 0x00ca]
	.word 0xf22ce02c  ! 704: STB_I	stb	%r25, [%r19 + 0x002c]
	.word 0xb13c0000  ! 705: SRA_R	sra 	%r16, %r0, %r24
	.word 0xf53ce0d8  ! 706: STDF_I	std	%f26, [0x00d8, %r19]
	.word 0xf875c000  ! 708: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf42c2120  ! 709: STB_I	stb	%r26, [%r16 + 0x0120]
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c4000  ! 711: STDF_R	std	%f29, [%r0, %r17]
	.word 0xb134b001  ! 712: SRLX_I	srlx	%r18, 0x0001, %r24
	setx	0x137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e05d  ! 722: WRPR_TNPC_I	wrpr	%r23, 0x005d, %tnpc
	.word 0xbf540000  ! 723: RDPR_GL	rdpr	%-, %r31
	.word 0xfc258000  ! 724: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf53da0de  ! 728: STDF_I	std	%f26, [0x00de, %r22]
	.word 0xf825a1a0  ! 729: STW_I	stw	%r28, [%r22 + 0x01a0]
	.word 0xbd508000  ! 731: RDPR_TSTATE	<illegal instruction>
	.word 0xba84a0f8  ! 734: ADDcc_I	addcc 	%r18, 0x00f8, %r29
	.word 0xb3500000  ! 736: RDPR_TPC	<illegal instruction>
	.word 0xf23d4000  ! 740: STD_R	std	%r25, [%r21 + %r0]
	.word 0xfa3da152  ! 741: STD_I	std	%r29, [%r22 + 0x0152]
	.word 0xf07421ff  ! 743: STX_I	stx	%r24, [%r16 + 0x01ff]
	.word 0x8994e069  ! 746: WRPR_TICK_I	wrpr	%r19, 0x0069, %tick
	.word 0xfe2c60f0  ! 748: STB_I	stb	%r31, [%r17 + 0x00f0]
	.word 0xf82d4000  ! 750: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf63c8000  ! 758: STD_R	std	%r27, [%r18 + %r0]
	.word 0x8795a1d7  ! 759: WRPR_TT_I	wrpr	%r22, 0x01d7, %tt
	.word 0xf8740000  ! 764: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xb3508000  ! 765: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf13ce042  ! 766: STDF_I	std	%f24, [0x0042, %r19]
	.word 0xff3ce11a  ! 767: STDF_I	std	%f31, [0x011a, %r19]
	.word 0xf13c0000  ! 768: STDF_R	std	%f24, [%r0, %r16]
	.word 0xb835a06f  ! 769: ORN_I	orn 	%r22, 0x006f, %r28
	.word 0x8395a157  ! 770: WRPR_TNPC_I	wrpr	%r22, 0x0157, %tnpc
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33c612b  ! 774: STDF_I	std	%f25, [0x012b, %r17]
	.word 0xbd3c6001  ! 776: SRA_I	sra 	%r17, 0x0001, %r30
	mov	1, %r14
	.word 0xa193a000  ! 777: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf2356038  ! 782: STH_I	sth	%r25, [%r21 + 0x0038]
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 786: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xbd520000  ! 788: RDPR_PIL	<illegal instruction>
	.word 0x899560e2  ! 789: WRPR_TICK_I	wrpr	%r21, 0x00e2, %tick
	.word 0xf93c0000  ! 793: STDF_R	std	%f28, [%r0, %r16]
	.word 0xb03c0000  ! 797: XNOR_R	xnor 	%r16, %r0, %r24
	.word 0xf23ca068  ! 800: STD_I	std	%r25, [%r18 + 0x0068]
	.word 0xf675c000  ! 801: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xbf520000  ! 804: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf03d8000  ! 808: STD_R	std	%r24, [%r22 + %r0]
	.word 0x8794e003  ! 810: WRPR_TT_I	wrpr	%r19, 0x0003, %tt
	.word 0xb21d8000  ! 813: XOR_R	xor 	%r22, %r0, %r25
	.word 0xfe244000  ! 814: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfc3de0b1  ! 815: STD_I	std	%r30, [%r23 + 0x00b1]
	.word 0xf33ce1dc  ! 821: STDF_I	std	%f25, [0x01dc, %r19]
	.word 0xfc358000  ! 822: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb0ada18d  ! 825: ANDNcc_I	andncc 	%r22, 0x018d, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982a53  ! 828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a53, %hpstate
	.word 0xf8346098  ! 832: STH_I	sth	%r28, [%r17 + 0x0098]
	.word 0xf075204a  ! 833: STX_I	stx	%r24, [%r20 + 0x004a]
	.word 0xb1354000  ! 837: SRL_R	srl 	%r21, %r0, %r24
	.word 0xba84c000  ! 840: ADDcc_R	addcc 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983d59  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d59, %hpstate
	.word 0xbd3dc000  ! 853: SRA_R	sra 	%r23, %r0, %r30
	.word 0xf82c608a  ! 855: STB_I	stb	%r28, [%r17 + 0x008a]
	.word 0xf22520e7  ! 858: STW_I	stw	%r25, [%r20 + 0x00e7]
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d606e  ! 862: STDF_I	std	%f31, [0x006e, %r21]
	.word 0xf625c000  ! 863: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xb9540000  ! 864: RDPR_GL	rdpr	%-, %r28
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42cc000  ! 870: STB_R	stb	%r26, [%r19 + %r0]
	.word 0x8995a01d  ! 874: WRPR_TICK_I	wrpr	%r22, 0x001d, %tick
	.word 0xf075600b  ! 875: STX_I	stx	%r24, [%r21 + 0x000b]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3518000  ! 878: RDPR_PSTATE	rdpr	%pstate, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a99  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a99, %hpstate
	.word 0xf82c60e3  ! 881: STB_I	stb	%r28, [%r17 + 0x00e3]
	.word 0x8595e07c  ! 883: WRPR_TSTATE_I	wrpr	%r23, 0x007c, %tstate
	.word 0xf8740000  ! 885: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xb1504000  ! 886: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xfc250000  ! 888: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf624a1fb  ! 889: STW_I	stw	%r27, [%r18 + 0x01fb]
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d204d  ! 893: STDF_I	std	%f28, [0x004d, %r20]
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 897: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf53ce063  ! 898: STDF_I	std	%f26, [0x0063, %r19]
	.word 0xb7500000  ! 901: RDPR_TPC	<illegal instruction>
	.word 0x8194e174  ! 904: WRPR_TPC_I	wrpr	%r19, 0x0174, %tpc
	mov	0, %r14
	.word 0xa193a000  ! 906: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf23d603d  ! 908: STD_I	std	%r25, [%r21 + 0x003d]
	.word 0xfa250000  ! 910: STW_R	stw	%r29, [%r20 + %r0]
	.word 0x879421d2  ! 912: WRPR_TT_I	wrpr	%r16, 0x01d2, %tt
	.word 0x8594a10f  ! 917: WRPR_TSTATE_I	wrpr	%r18, 0x010f, %tstate
	.word 0xfc248000  ! 918: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf73c8000  ! 920: STDF_R	std	%f27, [%r0, %r18]
	.word 0xbf50c000  ! 921: RDPR_TT	rdpr	%tt, %r31
	.word 0xbf510000  ! 923: RDPR_TICK	<illegal instruction>
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb425e196  ! 931: SUB_I	sub 	%r23, 0x0196, %r26
	.word 0xbb50c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0xf2758000  ! 933: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xbe0dc000  ! 934: AND_R	and 	%r23, %r0, %r31
	.word 0xb0b40000  ! 935: ORNcc_R	orncc 	%r16, %r0, %r24
	.word 0xb6046037  ! 938: ADD_I	add 	%r17, 0x0037, %r27
	.word 0xb424208a  ! 939: SUB_I	sub 	%r16, 0x008a, %r26
	.word 0xb7540000  ! 940: RDPR_GL	<illegal instruction>
	.word 0xfe3da1bc  ! 942: STD_I	std	%r31, [%r22 + 0x01bc]
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53d603b  ! 947: STDF_I	std	%f26, [0x003b, %r21]
	.word 0xfe344000  ! 949: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xb92de001  ! 950: SLL_I	sll 	%r23, 0x0001, %r28
	.word 0xb21c21df  ! 952: XOR_I	xor 	%r16, 0x01df, %r25
	setx	0x21, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 956: RDPR_GL	<illegal instruction>
	.word 0xb0846184  ! 959: ADDcc_I	addcc 	%r17, 0x0184, %r24
	.word 0xf93d0000  ! 961: STDF_R	std	%f28, [%r0, %r20]
	mov	1, %r14
	.word 0xa193a000  ! 964: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf475e075  ! 966: STX_I	stx	%r26, [%r23 + 0x0075]
	.word 0xf63ce03a  ! 968: STD_I	std	%r27, [%r19 + 0x003a]
	.word 0xf025c000  ! 970: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xb4048000  ! 971: ADD_R	add 	%r18, %r0, %r26
	setx	0x3020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a021  ! 974: WRPR_TICK_I	wrpr	%r22, 0x0021, %tick
	.word 0xf234c000  ! 976: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfa2561c0  ! 978: STW_I	stw	%r29, [%r21 + 0x01c0]
	.word 0xf024c000  ! 980: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb8356162  ! 981: SUBC_I	orn 	%r21, 0x0162, %r28
	.word 0x8194a055  ! 982: WRPR_TPC_I	wrpr	%r18, 0x0055, %tpc
	.word 0x8394e0e2  ! 983: WRPR_TNPC_I	wrpr	%r19, 0x00e2, %tnpc
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 988: MOVcc_R	<illegal instruction>
	.word 0xfa74e12b  ! 989: STX_I	stx	%r29, [%r19 + 0x012b]
	.word 0xf13d6193  ! 990: STDF_I	std	%f24, [0x0193, %r21]
	.word 0x8395e010  ! 991: WRPR_TNPC_I	wrpr	%r23, 0x0010, %tnpc
	.word 0xf23d8000  ! 992: STD_R	std	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983d0b  ! 994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	.word 0xbb510000  ! 999: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb5480000  ! 1001: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf2342189  ! 1003: STH_I	sth	%r25, [%r16 + 0x0189]
	.word 0x8d9421eb  ! 1004: WRPR_PSTATE_I	wrpr	%r16, 0x01eb, %pstate
	.word 0xf33dc000  ! 1008: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf13c618c  ! 1010: STDF_I	std	%f24, [0x018c, %r17]
	.word 0xf4758000  ! 1013: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf435e02a  ! 1014: STH_I	sth	%r26, [%r23 + 0x002a]
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24e010  ! 1021: STW_I	stw	%r30, [%r19 + 0x0010]
	.word 0xbb348000  ! 1026: SRL_R	srl 	%r18, %r0, %r29
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa24604f  ! 1031: STW_I	stw	%r29, [%r17 + 0x004f]
	.word 0xf2348000  ! 1034: STH_R	sth	%r25, [%r18 + %r0]
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 1038: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf234c000  ! 1041: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfc35c000  ! 1044: STH_R	sth	%r30, [%r23 + %r0]
	.word 0x8194a12f  ! 1046: WRPR_TPC_I	wrpr	%r18, 0x012f, %tpc
	.word 0xf625a033  ! 1050: STW_I	stw	%r27, [%r22 + 0x0033]
	.word 0xf0746091  ! 1051: STX_I	stx	%r24, [%r17 + 0x0091]
	.word 0xb2356173  ! 1055: ORN_I	orn 	%r21, 0x0173, %r25
	.word 0xf53c0000  ! 1056: STDF_R	std	%f26, [%r0, %r16]
	.word 0xbb518000  ! 1057: RDPR_PSTATE	rdpr	%pstate, %r29
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c4000  ! 1064: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf625e1ec  ! 1066: STW_I	stw	%r27, [%r23 + 0x01ec]
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc35204a  ! 1071: STH_I	sth	%r30, [%r20 + 0x004a]
	.word 0xbe050000  ! 1072: ADD_R	add 	%r20, %r0, %r31
	.word 0xf874e048  ! 1073: STX_I	stx	%r28, [%r19 + 0x0048]
	.word 0xf025e148  ! 1076: STW_I	stw	%r24, [%r23 + 0x0148]
	.word 0xfe758000  ! 1077: STX_R	stx	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983e59  ! 1079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e59, %hpstate
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a109  ! 1081: WRPR_PSTATE_I	wrpr	%r18, 0x0109, %pstate
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d0000  ! 1087: STD_R	std	%r28, [%r20 + %r0]
	.word 0x8394a16c  ! 1089: WRPR_TNPC_I	wrpr	%r18, 0x016c, %tnpc
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8746021  ! 1099: STX_I	stx	%r28, [%r17 + 0x0021]
	.word 0xf2744000  ! 1100: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xb551c000  ! 1105: RDPR_TL	rdpr	%tl, %r26
	.word 0xb151c000  ! 1109: RDPR_TL	<illegal instruction>
	.word 0x8d95e0d9  ! 1112: WRPR_PSTATE_I	wrpr	%r23, 0x00d9, %pstate
	.word 0xf475e104  ! 1113: STX_I	stx	%r26, [%r23 + 0x0104]
	.word 0xf23c61e1  ! 1114: STD_I	std	%r25, [%r17 + 0x01e1]
	.word 0x83946026  ! 1115: WRPR_TNPC_I	wrpr	%r17, 0x0026, %tnpc
	.word 0xb0358000  ! 1117: ORN_R	orn 	%r22, %r0, %r24
	.word 0xfa3c0000  ! 1119: STD_R	std	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ccb  ! 1121: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ccb, %hpstate
	.word 0xf8750000  ! 1125: STX_R	stx	%r28, [%r20 + %r0]
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e11a  ! 1130: WRPR_TNPC_I	wrpr	%r23, 0x011a, %tnpc
	.word 0xf024c000  ! 1131: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xfe340000  ! 1133: STH_R	sth	%r31, [%r16 + %r0]
	.word 0x89946017  ! 1135: WRPR_TICK_I	wrpr	%r17, 0x0017, %tick
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf475e160  ! 1138: STX_I	stx	%r26, [%r23 + 0x0160]
	.word 0xfe3d61ee  ! 1140: STD_I	std	%r31, [%r21 + 0x01ee]
	.word 0xbf508000  ! 1141: RDPR_TSTATE	rdpr	%tstate, %r31
	setx	data_start_2, %g1, %r23
	.word 0xb1518000  ! 1149: RDPR_PSTATE	<illegal instruction>
	.word 0xbd480000  ! 1153: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe0dc000  ! 1154: AND_R	and 	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb33c1000  ! 1157: SRAX_R	srax	%r16, %r0, %r25
	.word 0xfb3d4000  ! 1158: STDF_R	std	%f29, [%r0, %r21]
	mov	1, %r14
	.word 0xa193a000  ! 1160: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa3d20c5  ! 1164: STD_I	std	%r29, [%r20 + 0x00c5]
	.word 0xb1480000  ! 1168: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa2561e3  ! 1169: STW_I	stw	%r29, [%r21 + 0x01e3]
	.word 0xf034e1ee  ! 1171: STH_I	sth	%r24, [%r19 + 0x01ee]
	.word 0xfc34e072  ! 1172: STH_I	sth	%r30, [%r19 + 0x0072]
	.word 0xf03de18a  ! 1173: STD_I	std	%r24, [%r23 + 0x018a]
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c200b  ! 1178: STDF_I	std	%f29, [0x000b, %r16]
	.word 0xf22c20d0  ! 1179: STB_I	stb	%r25, [%r16 + 0x00d0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b51  ! 1183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xbb2da001  ! 1185: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0xf0352146  ! 1187: STH_I	sth	%r24, [%r20 + 0x0146]
	.word 0xbca4c000  ! 1192: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xf2754000  ! 1196: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf42460c7  ! 1197: STW_I	stw	%r26, [%r17 + 0x00c7]
	.word 0xf624e062  ! 1198: STW_I	stw	%r27, [%r19 + 0x0062]
	.word 0xbb518000  ! 1201: RDPR_PSTATE	rdpr	%pstate, %r29
	setx	data_start_0, %g1, %r17
	.word 0xf93cc000  ! 1207: STDF_R	std	%f28, [%r0, %r19]
	.word 0xf23c207e  ! 1211: STD_I	std	%r25, [%r16 + 0x007e]
	ta	T_CHANGE_HPRIV
	.word 0x81982b19  ! 1215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	.word 0xf22de0ba  ! 1217: STB_I	stb	%r25, [%r23 + 0x00ba]
	.word 0x8594e19f  ! 1224: WRPR_TSTATE_I	wrpr	%r19, 0x019f, %tstate
	.word 0xfc25e155  ! 1225: STW_I	stw	%r30, [%r23 + 0x0155]
	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c51  ! 1229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c51, %hpstate
	.word 0xb8144000  ! 1231: OR_R	or 	%r17, %r0, %r28
	.word 0xf8758000  ! 1235: STX_R	stx	%r28, [%r22 + %r0]
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4b56003  ! 1238: ORNcc_I	orncc 	%r21, 0x0003, %r26
	.word 0xf835a0e8  ! 1244: STH_I	sth	%r28, [%r22 + 0x00e8]
	setx	0x20234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf035617f  ! 1247: STH_I	sth	%r24, [%r21 + 0x017f]
	.word 0xf4340000  ! 1250: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xff3d608e  ! 1256: STDF_I	std	%f31, [0x008e, %r21]
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30211, %g1, %o0
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
	.word 0xbb2c7001  ! 1264: SLLX_I	sllx	%r17, 0x0001, %r29
	.word 0xf275a1e2  ! 1267: STX_I	stx	%r25, [%r22 + 0x01e2]
	.word 0x8394a1c0  ! 1270: WRPR_TNPC_I	wrpr	%r18, 0x01c0, %tnpc
	.word 0xb4240000  ! 1271: SUB_R	sub 	%r16, %r0, %r26
	.word 0xb7520000  ! 1273: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf2242151  ! 1277: STW_I	stw	%r25, [%r16 + 0x0151]
	.word 0xb9520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0xbb508000  ! 1280: RDPR_TSTATE	<illegal instruction>
	.word 0xf93d8000  ! 1282: STDF_R	std	%f28, [%r0, %r22]
	.word 0xb1540000  ! 1285: RDPR_GL	<illegal instruction>
	.word 0xfe2c0000  ! 1288: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xb7504000  ! 1290: RDPR_TNPC	<illegal instruction>
	.word 0xb551c000  ! 1291: RDPR_TL	<illegal instruction>
	.word 0xfb3da0c3  ! 1292: STDF_I	std	%f29, [0x00c3, %r22]
	.word 0xf825e146  ! 1293: STW_I	stw	%r28, [%r23 + 0x0146]
	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 1298: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x8394a098  ! 1302: WRPR_TNPC_I	wrpr	%r18, 0x0098, %tnpc
	.word 0xf42c60ce  ! 1307: STB_I	stb	%r26, [%r17 + 0x00ce]
	.word 0xf624c000  ! 1308: STW_R	stw	%r27, [%r19 + %r0]
	.word 0x819421e9  ! 1309: WRPR_TPC_I	wrpr	%r16, 0x01e9, %tpc
	mov	1, %r14
	.word 0xa193a000  ! 1315: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf03cc000  ! 1316: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf63c2116  ! 1317: STD_I	std	%r27, [%r16 + 0x0116]
	.word 0x91942189  ! 1320: WRPR_PIL_I	wrpr	%r16, 0x0189, %pil
	.word 0xfc34a14f  ! 1321: STH_I	sth	%r30, [%r18 + 0x014f]
	ta	T_CHANGE_HPRIV
	.word 0x81982853  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0853, %hpstate
	.word 0xbd520000  ! 1330: RDPR_PIL	rdpr	%pil, %r30
	.word 0xb0a4e08c  ! 1331: SUBcc_I	subcc 	%r19, 0x008c, %r24
	.word 0xfa35a1f4  ! 1334: STH_I	sth	%r29, [%r22 + 0x01f4]
	.word 0xf225a1e4  ! 1336: STW_I	stw	%r25, [%r22 + 0x01e4]
	.word 0x839560ed  ! 1340: WRPR_TNPC_I	wrpr	%r21, 0x00ed, %tnpc
	.word 0xf82dc000  ! 1346: STB_R	stb	%r28, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982d9b  ! 1347: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9b, %hpstate
	.word 0x819460a7  ! 1348: WRPR_TPC_I	wrpr	%r17, 0x00a7, %tpc
	.word 0xf13c0000  ! 1354: STDF_R	std	%f24, [%r0, %r16]
	setx	0x327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf835e0c6  ! 1359: STH_I	sth	%r28, [%r23 + 0x00c6]
	.word 0xfc244000  ! 1361: STW_R	stw	%r30, [%r17 + %r0]
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3ce1b0  ! 1367: STD_I	std	%r30, [%r19 + 0x01b0]
	.word 0xfc3de186  ! 1371: STD_I	std	%r30, [%r23 + 0x0186]
	.word 0x8195a0f7  ! 1372: WRPR_TPC_I	wrpr	%r22, 0x00f7, %tpc
	.word 0xf42d60d2  ! 1374: STB_I	stb	%r26, [%r21 + 0x00d2]
	.word 0xf53c211e  ! 1378: STDF_I	std	%f26, [0x011e, %r16]
	.word 0xf0258000  ! 1382: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xfc2d6045  ! 1384: STB_I	stb	%r30, [%r21 + 0x0045]
	.word 0xfc2d6016  ! 1387: STB_I	stb	%r30, [%r21 + 0x0016]
	.word 0xb42d2082  ! 1391: ANDN_I	andn 	%r20, 0x0082, %r26
	.word 0xb72c4000  ! 1394: SLL_R	sll 	%r17, %r0, %r27
	setx	data_start_7, %g1, %r22
	mov	0, %r14
	.word 0xa193a000  ! 1399: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf6740000  ! 1400: STX_R	stx	%r27, [%r16 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 1407: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa24a02b  ! 1416: STW_I	stw	%r29, [%r18 + 0x002b]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc3d0000  ! 1418: STD_R	std	%r30, [%r20 + %r0]
	.word 0x8595e000  ! 1419: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xf62c8000  ! 1420: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf43de140  ! 1421: STD_I	std	%r26, [%r23 + 0x0140]
	.word 0xf274c000  ! 1422: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf4340000  ! 1426: STH_R	sth	%r26, [%r16 + %r0]
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 1428: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf82c0000  ! 1433: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf635a0e8  ! 1434: STH_I	sth	%r27, [%r22 + 0x00e8]
	.word 0xf63560ae  ! 1438: STH_I	sth	%r27, [%r21 + 0x00ae]
	.word 0xf62c6123  ! 1442: STB_I	stb	%r27, [%r17 + 0x0123]
	.word 0xf224a0fb  ! 1443: STW_I	stw	%r25, [%r18 + 0x00fb]
	.word 0xf6740000  ! 1444: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xb0bd20af  ! 1445: XNORcc_I	xnorcc 	%r20, 0x00af, %r24
	.word 0xf6740000  ! 1446: STX_R	stx	%r27, [%r16 + %r0]
	.word 0x8d95a120  ! 1450: WRPR_PSTATE_I	wrpr	%r22, 0x0120, %pstate
	.word 0xb9518000  ! 1454: RDPR_PSTATE	rdpr	%pstate, %r28
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3c6152  ! 1463: STD_I	std	%r29, [%r17 + 0x0152]
	.word 0xb5500000  ! 1464: RDPR_TPC	rdpr	%tpc, %r26
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1468: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r18
	.word 0xfe340000  ! 1470: STH_R	sth	%r31, [%r16 + %r0]
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ccb  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ccb, %hpstate
	.word 0xf674e19e  ! 1477: STX_I	stx	%r27, [%r19 + 0x019e]
	.word 0xb57d4400  ! 1479: MOVR_R	movre	%r21, %r0, %r26
	.word 0xfa354000  ! 1481: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf035617e  ! 1482: STH_I	sth	%r24, [%r21 + 0x017e]
	.word 0xb8842057  ! 1485: ADDcc_I	addcc 	%r16, 0x0057, %r28
	.word 0xfa750000  ! 1490: STX_R	stx	%r29, [%r20 + %r0]
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe35e121  ! 1493: STH_I	sth	%r31, [%r23 + 0x0121]
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89956091  ! 1497: WRPR_TICK_I	wrpr	%r21, 0x0091, %tick
	.word 0xf0250000  ! 1499: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf73d60fd  ! 1505: STDF_I	std	%f27, [0x00fd, %r21]
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8750000  ! 1510: STX_R	stx	%r28, [%r20 + %r0]
	setx	data_start_7, %g1, %r20
	.word 0x85946164  ! 1513: WRPR_TSTATE_I	wrpr	%r17, 0x0164, %tstate
	.word 0xb37dc400  ! 1516: MOVR_R	movre	%r23, %r0, %r25
	.word 0xfe3c4000  ! 1520: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf73d4000  ! 1524: STDF_R	std	%f27, [%r0, %r21]
	.word 0xb7504000  ! 1528: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfe3d0000  ! 1531: STD_R	std	%r31, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa2d4000  ! 1539: STB_R	stb	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983909  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1909, %hpstate
	.word 0xb7518000  ! 1543: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xb3508000  ! 1545: RDPR_TSTATE	<illegal instruction>
	.word 0xf33c8000  ! 1547: STDF_R	std	%f25, [%r0, %r18]
	.word 0xbf50c000  ! 1553: RDPR_TT	<illegal instruction>
	.word 0xbec4e069  ! 1554: ADDCcc_I	addccc 	%r19, 0x0069, %r31
	.word 0xbd51c000  ! 1557: RDPR_TL	<illegal instruction>
	setx	0x2c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24c000  ! 1571: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfe2c0000  ! 1573: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xb614e1cd  ! 1576: OR_I	or 	%r19, 0x01cd, %r27
	.word 0xb9518000  ! 1577: RDPR_PSTATE	<illegal instruction>
	.word 0xfa35a041  ! 1580: STH_I	sth	%r29, [%r22 + 0x0041]
	setx	0x10221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 1587: RDPR_TPC	<illegal instruction>
	.word 0xfa25c000  ! 1589: STW_R	stw	%r29, [%r23 + %r0]
	setx	data_start_7, %g1, %r19
	setx	data_start_4, %g1, %r18
	.word 0xfe74e1b5  ! 1600: STX_I	stx	%r31, [%r19 + 0x01b5]
	mov	1, %r12
	.word 0x8f932000  ! 1601: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbe9d0000  ! 1602: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xbb34e001  ! 1603: SRL_I	srl 	%r19, 0x0001, %r29
	.word 0xf4758000  ! 1606: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfa3dc000  ! 1607: STD_R	std	%r29, [%r23 + %r0]
	.word 0xf23cc000  ! 1610: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf63d8000  ! 1612: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf82cc000  ! 1614: STB_R	stb	%r28, [%r19 + %r0]
	.word 0x859560e2  ! 1615: WRPR_TSTATE_I	wrpr	%r21, 0x00e2, %tstate
	setx	data_start_2, %g1, %r19
	.word 0xf6244000  ! 1618: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xfc24e193  ! 1624: STW_I	stw	%r30, [%r19 + 0x0193]
	.word 0xfe74a187  ! 1626: STX_I	stx	%r31, [%r18 + 0x0187]
	.word 0xf075605e  ! 1627: STX_I	stx	%r24, [%r21 + 0x005e]
	setx	data_start_5, %g1, %r16
	.word 0xfc3c61e7  ! 1631: STD_I	std	%r30, [%r17 + 0x01e7]
	.word 0xbd2c3001  ! 1634: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xb004e1e0  ! 1637: ADD_I	add 	%r19, 0x01e0, %r24
	.word 0xf0744000  ! 1639: STX_R	stx	%r24, [%r17 + %r0]
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946093  ! 1642: WRPR_PSTATE_I	wrpr	%r17, 0x0093, %pstate
	.word 0xb9510000  ! 1643: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb33d9000  ! 1647: SRAX_R	srax	%r22, %r0, %r25
	.word 0xbd540000  ! 1650: RDPR_GL	<illegal instruction>
	.word 0xf024c000  ! 1655: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xfa3da09d  ! 1656: STD_I	std	%r29, [%r22 + 0x009d]
	.word 0xbf518000  ! 1657: RDPR_PSTATE	<illegal instruction>
	.word 0xf23d0000  ! 1659: STD_R	std	%r25, [%r20 + %r0]
	.word 0xf274a0d8  ! 1661: STX_I	stx	%r25, [%r18 + 0x00d8]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	.word 0xfa2461bf  ! 1666: STW_I	stw	%r29, [%r17 + 0x01bf]
	setx	0x10315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	.word 0x8794a04f  ! 1671: WRPR_TT_I	wrpr	%r18, 0x004f, %tt
	.word 0xfa74c000  ! 1674: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfa3461c5  ! 1675: STH_I	sth	%r29, [%r17 + 0x01c5]
	setx	0x3010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9520000  ! 1683: RDPR_PIL	rdpr	%pil, %r28
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63dc000  ! 1688: STD_R	std	%r27, [%r23 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 1693: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf82d4000  ! 1694: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfb3c213a  ! 1696: STDF_I	std	%f29, [0x013a, %r16]
	.word 0xb1480000  ! 1700: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0, %r14
	.word 0xa193a000  ! 1704: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8240000  ! 1705: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xbb50c000  ! 1710: RDPR_TT	rdpr	%tt, %r29
	.word 0xb5500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xb485c000  ! 1717: ADDcc_R	addcc 	%r23, %r0, %r26
	.word 0xb60d8000  ! 1721: AND_R	and 	%r22, %r0, %r27
	.word 0xfd3d60c3  ! 1724: STDF_I	std	%f30, [0x00c3, %r21]
	mov	0, %r12
	.word 0x8f932000  ! 1726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb0b461a4  ! 1729: SUBCcc_I	orncc 	%r17, 0x01a4, %r24
	.word 0xf635611d  ! 1731: STH_I	sth	%r27, [%r21 + 0x011d]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8795a1af  ! 1733: WRPR_TT_I	wrpr	%r22, 0x01af, %tt
	.word 0xf8254000  ! 1738: STW_R	stw	%r28, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983b5b  ! 1739: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5b, %hpstate
	.word 0xf62d4000  ! 1740: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xfa75619d  ! 1749: STX_I	stx	%r29, [%r21 + 0x019d]
	.word 0xbd480000  ! 1750: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf87520d4  ! 1751: STX_I	stx	%r28, [%r20 + 0x00d4]
	ta	T_CHANGE_HPRIV
	.word 0x819838c3  ! 1752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c3, %hpstate
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	.word 0xf4240000  ! 1760: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf03ce0a7  ! 1761: STD_I	std	%r24, [%r19 + 0x00a7]
	setx	0x21d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859460e4  ! 1763: WRPR_TSTATE_I	wrpr	%r17, 0x00e4, %tstate
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe744000  ! 1769: STX_R	stx	%r31, [%r17 + %r0]
	setx	0x3001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf624c000  ! 1778: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf235c000  ! 1779: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf73ca1cb  ! 1782: STDF_I	std	%f27, [0x01cb, %r18]
	.word 0xf22520b7  ! 1789: STW_I	stw	%r25, [%r20 + 0x00b7]
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf435601d  ! 1792: STH_I	sth	%r26, [%r21 + 0x001d]
	.word 0xb7540000  ! 1793: RDPR_GL	rdpr	%-, %r27
	.word 0xb68d4000  ! 1799: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xf6758000  ! 1801: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xfc2c4000  ! 1806: STB_R	stb	%r30, [%r17 + %r0]
	setx	0x20030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa74e122  ! 1809: STX_I	stx	%r29, [%r19 + 0x0122]
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9561e5  ! 1814: WRPR_PSTATE_I	wrpr	%r21, 0x01e5, %pstate
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d206e  ! 1819: STDF_I	std	%f27, [0x006e, %r20]
	.word 0xfe746114  ! 1820: STX_I	stx	%r31, [%r17 + 0x0114]
	.word 0x8994a1ee  ! 1821: WRPR_TICK_I	wrpr	%r18, 0x01ee, %tick
	.word 0xf42de0dc  ! 1822: STB_I	stb	%r26, [%r23 + 0x00dc]
	.word 0xf82d61a2  ! 1825: STB_I	stb	%r28, [%r21 + 0x01a2]
	.word 0xbcace0e4  ! 1828: ANDNcc_I	andncc 	%r19, 0x00e4, %r30
	.word 0x8594210b  ! 1829: WRPR_TSTATE_I	wrpr	%r16, 0x010b, %tstate
	.word 0xf42c8000  ! 1832: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf425c000  ! 1833: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xb350c000  ! 1835: RDPR_TT	rdpr	%tt, %r25
	.word 0xb4bce06a  ! 1836: XNORcc_I	xnorcc 	%r19, 0x006a, %r26
	setx	data_start_1, %g1, %r22
	.word 0x819560ca  ! 1839: WRPR_TPC_I	wrpr	%r21, 0x00ca, %tpc
	.word 0xb9480000  ! 1840: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb825e099  ! 1845: SUB_I	sub 	%r23, 0x0099, %r28
	.word 0xf53c4000  ! 1846: STDF_R	std	%f26, [%r0, %r17]
	setx	0x302, %g1, %o0
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
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 1854: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xb2040000  ! 1856: ADD_R	add 	%r16, %r0, %r25
	.word 0xf6248000  ! 1859: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf42cc000  ! 1861: STB_R	stb	%r26, [%r19 + %r0]
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82d61b0  ! 1867: STB_I	stb	%r28, [%r21 + 0x01b0]
	.word 0x859521b7  ! 1870: WRPR_TSTATE_I	wrpr	%r20, 0x01b7, %tstate
	.word 0xbd480000  ! 1871: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf73c0000  ! 1872: STDF_R	std	%f27, [%r0, %r16]
	mov	0, %r14
	.word 0xa193a000  ! 1873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7540000  ! 1874: RDPR_GL	rdpr	%-, %r27
	.word 0xfa74a1b8  ! 1875: STX_I	stx	%r29, [%r18 + 0x01b8]
	.word 0xf0240000  ! 1878: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xbf480000  ! 1880: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf02da044  ! 1882: STB_I	stb	%r24, [%r22 + 0x0044]
	.word 0xf33d20c3  ! 1884: STDF_I	std	%f25, [0x00c3, %r20]
	setx	data_start_6, %g1, %r19
	.word 0xf035c000  ! 1888: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf03d6042  ! 1889: STD_I	std	%r24, [%r21 + 0x0042]
	.word 0xbf51c000  ! 1890: RDPR_TL	<illegal instruction>
	.word 0xf82cc000  ! 1892: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf635a046  ! 1893: STH_I	sth	%r27, [%r22 + 0x0046]
	.word 0x8d9460e3  ! 1896: WRPR_PSTATE_I	wrpr	%r17, 0x00e3, %pstate
	.word 0xb9518000  ! 1899: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0x8994e138  ! 1904: WRPR_TICK_I	wrpr	%r19, 0x0138, %tick
	.word 0xf73d0000  ! 1908: STDF_R	std	%f27, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2c20d9  ! 1912: STB_I	stb	%r30, [%r16 + 0x00d9]
	.word 0xfc744000  ! 1914: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xb9520000  ! 1916: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfa340000  ! 1919: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xb7500000  ! 1922: RDPR_TPC	<illegal instruction>
	.word 0xb3340000  ! 1923: SRL_R	srl 	%r16, %r0, %r25
	.word 0xfb3d21f0  ! 1925: STDF_I	std	%f29, [0x01f0, %r20]
	.word 0xf2356176  ! 1927: STH_I	sth	%r25, [%r21 + 0x0176]
	.word 0xb4954000  ! 1930: ORcc_R	orcc 	%r21, %r0, %r26
	.word 0x9194e1d6  ! 1935: WRPR_PIL_I	wrpr	%r19, 0x01d6, %pil
	.word 0xb9540000  ! 1936: RDPR_GL	rdpr	%-, %r28
	setx	0x215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcc5e1a9  ! 1941: ADDCcc_I	addccc 	%r23, 0x01a9, %r30
	.word 0xf83da1d2  ! 1942: STD_I	std	%r28, [%r22 + 0x01d2]
	.word 0xf0250000  ! 1945: STW_R	stw	%r24, [%r20 + %r0]
	setx	0x225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb894a10c  ! 1949: ORcc_I	orcc 	%r18, 0x010c, %r28
	.word 0xb3480000  ! 1951: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb551c000  ! 1955: RDPR_TL	<illegal instruction>
	.word 0x8394a13a  ! 1958: WRPR_TNPC_I	wrpr	%r18, 0x013a, %tnpc
	.word 0xf025c000  ! 1959: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xb9520000  ! 1961: RDPR_PIL	rdpr	%pil, %r28
	.word 0xbea521a1  ! 1962: SUBcc_I	subcc 	%r20, 0x01a1, %r31
	setx	0x10112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb7da401  ! 1964: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xf8248000  ! 1965: STW_R	stw	%r28, [%r18 + %r0]
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xbe34c000  ! 1969: ORN_R	orn 	%r19, %r0, %r31
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d6198  ! 1971: STD_I	std	%r28, [%r21 + 0x0198]
	.word 0xf024a115  ! 1972: STW_I	stw	%r24, [%r18 + 0x0115]
	.word 0xf23521f0  ! 1974: STH_I	sth	%r25, [%r20 + 0x01f0]
	.word 0xf43d6033  ! 1975: STD_I	std	%r26, [%r21 + 0x0033]
	.word 0xb7540000  ! 1978: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879421b2  ! 1982: WRPR_TT_I	wrpr	%r16, 0x01b2, %tt
	.word 0xf83460ea  ! 1983: STH_I	sth	%r28, [%r17 + 0x00ea]
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe254000  ! 1986: STW_R	stw	%r31, [%r21 + %r0]
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85952123  ! 1991: WRPR_TSTATE_I	wrpr	%r20, 0x0123, %tstate
	.word 0xb8854000  ! 1995: ADDcc_R	addcc 	%r21, %r0, %r28
	.word 0xf275a198  ! 1996: STX_I	stx	%r25, [%r22 + 0x0198]
	.word 0xb7508000  ! 1997: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb57da401  ! 1999: MOVR_I	movre	%r22, 0x1, %r26
	.word 0x8d952111  ! 2002: WRPR_PSTATE_I	wrpr	%r20, 0x0111, %pstate
	.word 0xb77da401  ! 2004: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xf03ce18d  ! 2006: STD_I	std	%r24, [%r19 + 0x018d]
	.word 0xfa248000  ! 2009: STW_R	stw	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2346155  ! 2015: STH_I	sth	%r25, [%r17 + 0x0155]
	.word 0xf4756018  ! 2016: STX_I	stx	%r26, [%r21 + 0x0018]
	.word 0x83946102  ! 2017: WRPR_TNPC_I	wrpr	%r17, 0x0102, %tnpc
	.word 0xf42de020  ! 2021: STB_I	stb	%r26, [%r23 + 0x0020]
	.word 0xf02dc000  ! 2022: STB_R	stb	%r24, [%r23 + %r0]
	setx	data_start_6, %g1, %r16
	.word 0xfa3d8000  ! 2027: STD_R	std	%r29, [%r22 + %r0]
	.word 0xfe240000  ! 2028: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf82ca09a  ! 2029: STB_I	stb	%r28, [%r18 + 0x009a]
	.word 0xfe3d60cb  ! 2031: STD_I	std	%r31, [%r21 + 0x00cb]
	.word 0xf33d605a  ! 2035: STDF_I	std	%f25, [0x005a, %r21]
	.word 0xf8354000  ! 2036: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf4250000  ! 2041: STW_R	stw	%r26, [%r20 + %r0]
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d942149  ! 2047: WRPR_PSTATE_I	wrpr	%r16, 0x0149, %pstate
	.word 0xf82c2039  ! 2048: STB_I	stb	%r28, [%r16 + 0x0039]
	.word 0xf53c8000  ! 2053: STDF_R	std	%f26, [%r0, %r18]
	.word 0xb150c000  ! 2057: RDPR_TT	rdpr	%tt, %r24
	.word 0xf42521c4  ! 2059: STW_I	stw	%r26, [%r20 + 0x01c4]
	mov	0, %r14
	.word 0xa193a000  ! 2063: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9520000  ! 2064: RDPR_PIL	rdpr	%pil, %r28
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe34c000  ! 2067: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf8746148  ! 2070: STX_I	stx	%r28, [%r17 + 0x0148]
	.word 0xfe2ca0f2  ! 2074: STB_I	stb	%r31, [%r18 + 0x00f2]
	.word 0xb80c60e1  ! 2076: AND_I	and 	%r17, 0x00e1, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982a93  ! 2077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	.word 0xf13d2130  ! 2078: STDF_I	std	%f24, [0x0130, %r20]
	.word 0xfd3c4000  ! 2080: STDF_R	std	%f30, [%r0, %r17]
	mov	2, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb08560a4  ! 2090: ADDcc_I	addcc 	%r21, 0x00a4, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983e93  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e93, %hpstate
	.word 0xf834a186  ! 2095: STH_I	sth	%r28, [%r18 + 0x0186]
	.word 0xb2b48000  ! 2098: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xb151c000  ! 2100: RDPR_TL	rdpr	%tl, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb17de401  ! 2107: MOVR_I	movre	%r23, 0x1, %r24
	.word 0xfc2c6147  ! 2108: STB_I	stb	%r30, [%r17 + 0x0147]
	.word 0xfc2cc000  ! 2109: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb834615e  ! 2110: SUBC_I	orn 	%r17, 0x015e, %r28
	.word 0xb7518000  ! 2113: RDPR_PSTATE	<illegal instruction>
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e136  ! 2116: WRPR_PSTATE_I	wrpr	%r19, 0x0136, %pstate
	.word 0xb93d9000  ! 2117: SRAX_R	srax	%r22, %r0, %r28
	mov	2, %r14
	.word 0xa193a000  ! 2121: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe3c0000  ! 2122: STD_R	std	%r31, [%r16 + %r0]
	.word 0xb551c000  ! 2124: RDPR_TL	rdpr	%tl, %r26
	setx	data_start_1, %g1, %r23
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8244000  ! 2141: SUB_R	sub 	%r17, %r0, %r28
	.word 0xf025e194  ! 2142: STW_I	stw	%r24, [%r23 + 0x0194]
	.word 0xf0244000  ! 2144: STW_R	stw	%r24, [%r17 + %r0]
	.word 0x8795a1d2  ! 2146: WRPR_TT_I	wrpr	%r22, 0x01d2, %tt
	setx	0x30238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d4000  ! 2149: STDF_R	std	%f28, [%r0, %r21]
	setx	0x1003f, %g1, %o0
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
	.word 0x919421da  ! 2160: WRPR_PIL_I	wrpr	%r16, 0x01da, %pil
	.word 0xb7504000  ! 2161: RDPR_TNPC	rdpr	%tnpc, %r27
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89946188  ! 2164: WRPR_TICK_I	wrpr	%r17, 0x0188, %tick
	.word 0x81942158  ! 2166: WRPR_TPC_I	wrpr	%r16, 0x0158, %tpc
	.word 0xfa758000  ! 2167: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xb1641800  ! 2169: MOVcc_R	<illegal instruction>
	.word 0xb235c000  ! 2170: ORN_R	orn 	%r23, %r0, %r25
	.word 0xb52d3001  ! 2171: SLLX_I	sllx	%r20, 0x0001, %r26
	setx	data_start_2, %g1, %r23
	.word 0xf33da18f  ! 2173: STDF_I	std	%f25, [0x018f, %r22]
	.word 0xfc3c0000  ! 2174: STD_R	std	%r30, [%r16 + %r0]
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa744000  ! 2177: STX_R	stx	%r29, [%r17 + %r0]
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf024a01f  ! 2188: STW_I	stw	%r24, [%r18 + 0x001f]
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfd3ca1dc  ! 2193: STDF_I	std	%f30, [0x01dc, %r18]
	.word 0xba354000  ! 2195: SUBC_R	orn 	%r21, %r0, %r29
	.word 0x8795e03a  ! 2196: WRPR_TT_I	wrpr	%r23, 0x003a, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983a93  ! 2203: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a93, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf63c8000  ! 2209: STD_R	std	%r27, [%r18 + %r0]
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c4000  ! 2215: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf835e178  ! 2216: STH_I	sth	%r28, [%r23 + 0x0178]
	.word 0xfe34211f  ! 2217: STH_I	sth	%r31, [%r16 + 0x011f]
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe74c000  ! 2220: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb5520000  ! 2222: RDPR_PIL	rdpr	%pil, %r26
	setx	data_start_1, %g1, %r16
	.word 0xf2758000  ! 2227: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xbe1c0000  ! 2228: XOR_R	xor 	%r16, %r0, %r31
	.word 0xf02d617c  ! 2229: STB_I	stb	%r24, [%r21 + 0x017c]
	setx	data_start_4, %g1, %r23
	.word 0xbb50c000  ! 2237: RDPR_TT	<illegal instruction>
	.word 0xb72d8000  ! 2244: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb7518000  ! 2245: RDPR_PSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r21
	.word 0xbd518000  ! 2254: RDPR_PSTATE	<illegal instruction>
	setx	0x10014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf274a085  ! 2263: STX_I	stx	%r25, [%r18 + 0x0085]
	.word 0xfd3c8000  ! 2266: STDF_R	std	%f30, [%r0, %r18]
	.word 0xb350c000  ! 2269: RDPR_TT	<illegal instruction>
	.word 0xf4346029  ! 2272: STH_I	sth	%r26, [%r17 + 0x0029]
	ta	T_CHANGE_HPRIV
	.word 0x81983e11  ! 2275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e11, %hpstate
	.word 0xfe3dc000  ! 2278: STD_R	std	%r31, [%r23 + %r0]
	.word 0xbd504000  ! 2279: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xfa3d8000  ! 2281: STD_R	std	%r29, [%r22 + %r0]
	.word 0x89956135  ! 2286: WRPR_TICK_I	wrpr	%r21, 0x0135, %tick
	.word 0xb0344000  ! 2289: SUBC_R	orn 	%r17, %r0, %r24
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 2292: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xbf500000  ! 2293: RDPR_TPC	rdpr	%tpc, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa3c6150  ! 2297: STD_I	std	%r29, [%r17 + 0x0150]
	.word 0xf0744000  ! 2301: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf03ce0d1  ! 2307: STD_I	std	%r24, [%r19 + 0x00d1]
	.word 0xf2750000  ! 2309: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xbf50c000  ! 2310: RDPR_TT	<illegal instruction>
	.word 0xbf51c000  ! 2312: RDPR_TL	<illegal instruction>
	.word 0xf93c0000  ! 2314: STDF_R	std	%f28, [%r0, %r16]
	.word 0x899561e0  ! 2316: WRPR_TICK_I	wrpr	%r21, 0x01e0, %tick
	.word 0xf63c60d5  ! 2317: STD_I	std	%r27, [%r17 + 0x00d5]
	.word 0xbf2cc000  ! 2318: SLL_R	sll 	%r19, %r0, %r31
	.word 0xfa3dc000  ! 2319: STD_R	std	%r29, [%r23 + %r0]
	.word 0xf23da060  ! 2320: STD_I	std	%r25, [%r22 + 0x0060]
	.word 0xfe3cc000  ! 2322: STD_R	std	%r31, [%r19 + %r0]
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e12d  ! 2324: WRPR_TT_I	wrpr	%r23, 0x012d, %tt
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02de1a7  ! 2335: STB_I	stb	%r24, [%r23 + 0x01a7]
	.word 0xf63ce055  ! 2336: STD_I	std	%r27, [%r19 + 0x0055]
	.word 0xbb500000  ! 2338: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf624c000  ! 2341: STW_R	stw	%r27, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 2342: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe3c20b0  ! 2344: STD_I	std	%r31, [%r16 + 0x00b0]
	.word 0xf53c0000  ! 2345: STDF_R	std	%f26, [%r0, %r16]
	.word 0xfe2460d2  ! 2346: STW_I	stw	%r31, [%r17 + 0x00d2]
	.word 0xfe248000  ! 2351: STW_R	stw	%r31, [%r18 + %r0]
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 2353: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xb3518000  ! 2358: RDPR_PSTATE	<illegal instruction>
	.word 0xb88c8000  ! 2360: ANDcc_R	andcc 	%r18, %r0, %r28
	setx	data_start_7, %g1, %r18
	.word 0xfa35e0df  ! 2365: STH_I	sth	%r29, [%r23 + 0x00df]
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62c2099  ! 2375: STB_I	stb	%r27, [%r16 + 0x0099]
	.word 0xf33d2199  ! 2376: STDF_I	std	%f25, [0x0199, %r20]
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33c607c  ! 2384: STDF_I	std	%f25, [0x007c, %r17]
	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0248000  ! 2396: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf62561da  ! 2399: STW_I	stw	%r27, [%r21 + 0x01da]
	.word 0x919520e0  ! 2400: WRPR_PIL_I	wrpr	%r20, 0x00e0, %pil
	.word 0xf73c0000  ! 2404: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfe244000  ! 2405: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfc24e122  ! 2406: STW_I	stw	%r30, [%r19 + 0x0122]
	.word 0xba8ce1b4  ! 2407: ANDcc_I	andcc 	%r19, 0x01b4, %r29
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88c8000  ! 2410: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xf03de0ed  ! 2411: STD_I	std	%r24, [%r23 + 0x00ed]
	setx	0x3011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d8000  ! 2413: STD_R	std	%r31, [%r22 + %r0]
	.word 0xb9520000  ! 2414: RDPR_PIL	rdpr	%pil, %r28
	mov	2, %r12
	.word 0x8f932000  ! 2416: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf53de0a5  ! 2417: STDF_I	std	%f26, [0x00a5, %r23]
	.word 0xf6740000  ! 2419: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xb83ce1e7  ! 2426: XNOR_I	xnor 	%r19, 0x01e7, %r28
	.word 0xb52dc000  ! 2427: SLL_R	sll 	%r23, %r0, %r26
	.word 0xf02da093  ! 2433: STB_I	stb	%r24, [%r22 + 0x0093]
	setx	0x21d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf434200b  ! 2435: STH_I	sth	%r26, [%r16 + 0x000b]
	.word 0xfe3de140  ! 2436: STD_I	std	%r31, [%r23 + 0x0140]
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23da140  ! 2438: STD_I	std	%r25, [%r22 + 0x0140]
	.word 0xfa74c000  ! 2439: STX_R	stx	%r29, [%r19 + %r0]
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62ca0d6  ! 2447: STB_I	stb	%r27, [%r18 + 0x00d6]
	.word 0xb32cb001  ! 2448: SLLX_I	sllx	%r18, 0x0001, %r25
	.word 0xbc8d8000  ! 2449: ANDcc_R	andcc 	%r22, %r0, %r30
	.word 0xb29ce124  ! 2453: XORcc_I	xorcc 	%r19, 0x0124, %r25
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75e007  ! 2463: STX_I	stx	%r30, [%r23 + 0x0007]
	.word 0xf2758000  ! 2465: STX_R	stx	%r25, [%r22 + %r0]
	setx	0x10135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3dc000  ! 2468: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf82c0000  ! 2470: STB_R	stb	%r28, [%r16 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 2472: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe3ca065  ! 2473: STD_I	std	%r31, [%r18 + 0x0065]
	.word 0xf2358000  ! 2478: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf4358000  ! 2480: STH_R	sth	%r26, [%r22 + %r0]
	setx	data_start_4, %g1, %r16
	.word 0x8595a0df  ! 2486: WRPR_TSTATE_I	wrpr	%r22, 0x00df, %tstate
	.word 0xfa3c6028  ! 2490: STD_I	std	%r29, [%r17 + 0x0028]
	.word 0xf42c0000  ! 2492: STB_R	stb	%r26, [%r16 + %r0]
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 2499: RDPR_PIL	rdpr	%pil, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 2500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	.word 0xf075a142  ! 2501: STX_I	stx	%r24, [%r22 + 0x0142]
	.word 0xb5518000  ! 2503: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xb52d0000  ! 2505: SLL_R	sll 	%r20, %r0, %r26
	mov	0, %r14
	.word 0xa193a000  ! 2506: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf0744000  ! 2508: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xbf480000  ! 2510: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf074c000  ! 2515: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xfb3d2055  ! 2516: STDF_I	std	%f29, [0x0055, %r20]
	.word 0xf435a178  ! 2517: STH_I	sth	%r26, [%r22 + 0x0178]
	.word 0xb950c000  ! 2518: RDPR_TT	<illegal instruction>
	.word 0xf22d8000  ! 2519: STB_R	stb	%r25, [%r22 + %r0]
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3c21a8  ! 2521: STD_I	std	%r29, [%r16 + 0x01a8]
	.word 0xf02460c9  ! 2522: STW_I	stw	%r24, [%r17 + 0x00c9]
	.word 0xf835e1f1  ! 2528: STH_I	sth	%r28, [%r23 + 0x01f1]
	setx	data_start_4, %g1, %r22
	.word 0xf834e02e  ! 2532: STH_I	sth	%r28, [%r19 + 0x002e]
	.word 0xff3d8000  ! 2533: STDF_R	std	%f31, [%r0, %r22]
	.word 0xfe24c000  ! 2534: STW_R	stw	%r31, [%r19 + %r0]
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899520ea  ! 2537: WRPR_TICK_I	wrpr	%r20, 0x00ea, %tick
	.word 0xfa3c213a  ! 2538: STD_I	std	%r29, [%r16 + 0x013a]
	.word 0xf0250000  ! 2539: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xfc350000  ! 2540: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xb08c4000  ! 2541: ANDcc_R	andcc 	%r17, %r0, %r24
	.word 0xfc25a12d  ! 2542: STW_I	stw	%r30, [%r22 + 0x012d]
	.word 0xfb3da13b  ! 2543: STDF_I	std	%f29, [0x013b, %r22]
	mov	0, %r12
	.word 0x8f932000  ! 2546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf225c000  ! 2550: STW_R	stw	%r25, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8198391b  ! 2553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191b, %hpstate
	.word 0xf434e128  ! 2555: STH_I	sth	%r26, [%r19 + 0x0128]
	.word 0xf834a169  ! 2557: STH_I	sth	%r28, [%r18 + 0x0169]
	.word 0xf22ca066  ! 2560: STB_I	stb	%r25, [%r18 + 0x0066]
	.word 0xfa2560d9  ! 2565: STW_I	stw	%r29, [%r21 + 0x00d9]
	.word 0xf675e0aa  ! 2566: STX_I	stx	%r27, [%r23 + 0x00aa]
	.word 0xb950c000  ! 2567: RDPR_TT	rdpr	%tt, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982a89  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a89, %hpstate
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb22d0000  ! 2575: ANDN_R	andn 	%r20, %r0, %r25
	.word 0xf6750000  ! 2579: STX_R	stx	%r27, [%r20 + %r0]
	.word 0x8595a1a7  ! 2582: WRPR_TSTATE_I	wrpr	%r22, 0x01a7, %tstate
	.word 0xf02c4000  ! 2584: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf02d61e9  ! 2586: STB_I	stb	%r24, [%r21 + 0x01e9]
	.word 0xf22d217a  ! 2591: STB_I	stb	%r25, [%r20 + 0x017a]
	.word 0xbb520000  ! 2592: RDPR_PIL	rdpr	%pil, %r29
	.word 0xb1518000  ! 2594: RDPR_PSTATE	<illegal instruction>
	.word 0xb7518000  ! 2595: RDPR_PSTATE	<illegal instruction>
	.word 0xf82d61fb  ! 2596: STB_I	stb	%r28, [%r21 + 0x01fb]
	setx	data_start_4, %g1, %r23
	.word 0xf13da1c0  ! 2598: STDF_I	std	%f24, [0x01c0, %r22]
	.word 0xf82de072  ! 2599: STB_I	stb	%r28, [%r23 + 0x0072]
	.word 0xf63c8000  ! 2600: STD_R	std	%r27, [%r18 + %r0]
	.word 0xf62d6131  ! 2601: STB_I	stb	%r27, [%r21 + 0x0131]
	.word 0xf2240000  ! 2602: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfd3d61d5  ! 2603: STDF_I	std	%f30, [0x01d5, %r21]
	.word 0xf63d0000  ! 2608: STD_R	std	%r27, [%r20 + %r0]
	.word 0xfd3c0000  ! 2613: STDF_R	std	%f30, [%r0, %r16]
	.word 0xb88d2045  ! 2614: ANDcc_I	andcc 	%r20, 0x0045, %r28
	setx	0x20305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0758000  ! 2616: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf93c211d  ! 2617: STDF_I	std	%f28, [0x011d, %r16]
	.word 0xf6258000  ! 2620: STW_R	stw	%r27, [%r22 + %r0]
	setx	0x31b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 2623: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r20
	.word 0xfa74206f  ! 2630: STX_I	stx	%r29, [%r16 + 0x006f]
	.word 0xb3500000  ! 2631: RDPR_TPC	<illegal instruction>
	.word 0xff3d8000  ! 2632: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf23da152  ! 2634: STD_I	std	%r25, [%r22 + 0x0152]
	setx	0x20224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb83c4000  ! 2641: XNOR_R	xnor 	%r17, %r0, %r28
	.word 0x8395e0fd  ! 2643: WRPR_TNPC_I	wrpr	%r23, 0x00fd, %tnpc
	.word 0xba350000  ! 2644: ORN_R	orn 	%r20, %r0, %r29
	.word 0xb5510000  ! 2648: RDPR_TICK	rdpr	%tick, %r26
	.word 0x819561b8  ! 2650: WRPR_TPC_I	wrpr	%r21, 0x01b8, %tpc
	.word 0xf4746068  ! 2651: STX_I	stx	%r26, [%r17 + 0x0068]
	.word 0xf2742113  ! 2652: STX_I	stx	%r25, [%r16 + 0x0113]
	.word 0xbcc48000  ! 2653: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0x8994202c  ! 2655: WRPR_TICK_I	wrpr	%r16, 0x002c, %tick
	.word 0xfc2d8000  ! 2656: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xbd504000  ! 2661: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb3350000  ! 2668: SRL_R	srl 	%r20, %r0, %r25
	.word 0xf035a08d  ! 2670: STH_I	sth	%r24, [%r22 + 0x008d]
	.word 0x859560db  ! 2671: WRPR_TSTATE_I	wrpr	%r21, 0x00db, %tstate
	setx	data_start_4, %g1, %r21
	.word 0xf23d8000  ! 2674: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf62c4000  ! 2676: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xbb504000  ! 2681: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfa24c000  ! 2684: STW_R	stw	%r29, [%r19 + %r0]
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2686: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf63421ea  ! 2690: STH_I	sth	%r27, [%r16 + 0x01ea]
	.word 0xf03d20bd  ! 2693: STD_I	std	%r24, [%r20 + 0x00bd]
	.word 0xf73d20b6  ! 2695: STDF_I	std	%f27, [0x00b6, %r20]
	.word 0xf13ce091  ! 2700: STDF_I	std	%f24, [0x0091, %r19]
	.word 0xf02d616e  ! 2701: STB_I	stb	%r24, [%r21 + 0x016e]
	.word 0xb5540000  ! 2704: RDPR_GL	rdpr	%-, %r26
	.word 0xf02d0000  ! 2705: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xb151c000  ! 2708: RDPR_TL	<illegal instruction>
	.word 0xf034c000  ! 2712: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf034c000  ! 2714: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf82d4000  ! 2716: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xff3ce177  ! 2718: STDF_I	std	%f31, [0x0177, %r19]
	.word 0xfc2cc000  ! 2720: STB_R	stb	%r30, [%r19 + %r0]
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 2723: STX_R	stx	%r26, [%r17 + %r0]
	.word 0x8594a128  ! 2726: WRPR_TSTATE_I	wrpr	%r18, 0x0128, %tstate
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 2737: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf53c605a  ! 2740: STDF_I	std	%f26, [0x005a, %r17]
	.word 0xfe2c605e  ! 2742: STB_I	stb	%r31, [%r17 + 0x005e]
	.word 0xb57ce401  ! 2746: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xf02de056  ! 2748: STB_I	stb	%r24, [%r23 + 0x0056]
	.word 0xff3d0000  ! 2749: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf13c0000  ! 2751: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfa35e1bb  ! 2753: STH_I	sth	%r29, [%r23 + 0x01bb]
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6b5e125  ! 2770: ORNcc_I	orncc 	%r23, 0x0125, %r27
	.word 0xfc346047  ! 2771: STH_I	sth	%r30, [%r17 + 0x0047]
	.word 0xbb504000  ! 2773: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfa25c000  ! 2774: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xbb508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	.word 0xf634a18a  ! 2776: STH_I	sth	%r27, [%r18 + 0x018a]
	.word 0xf53c21ad  ! 2779: STDF_I	std	%f26, [0x01ad, %r16]
	.word 0xf13d0000  ! 2781: STDF_R	std	%f24, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	.word 0x81982c5b  ! 2782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5b, %hpstate
	.word 0xb22ce0bb  ! 2784: ANDN_I	andn 	%r19, 0x00bb, %r25
	.word 0xfa2d61c4  ! 2787: STB_I	stb	%r29, [%r21 + 0x01c4]
	.word 0xb5510000  ! 2790: RDPR_TICK	rdpr	%tick, %r26
	.word 0x8595e0d6  ! 2796: WRPR_TSTATE_I	wrpr	%r23, 0x00d6, %tstate
	.word 0xf635a053  ! 2798: STH_I	sth	%r27, [%r22 + 0x0053]
	.word 0x8395e041  ! 2803: WRPR_TNPC_I	wrpr	%r23, 0x0041, %tnpc
	.word 0xb9643801  ! 2804: MOVcc_I	<illegal instruction>
	.word 0x8795a1de  ! 2805: WRPR_TT_I	wrpr	%r22, 0x01de, %tt
	.word 0xbd34b001  ! 2806: SRLX_I	srlx	%r18, 0x0001, %r30
	.word 0xbc0da076  ! 2808: AND_I	and 	%r22, 0x0076, %r30
	.word 0xf22c61f9  ! 2810: STB_I	stb	%r25, [%r17 + 0x01f9]
	.word 0xfc2da07d  ! 2811: STB_I	stb	%r30, [%r22 + 0x007d]
	.word 0xfa25a128  ! 2812: STW_I	stw	%r29, [%r22 + 0x0128]
	.word 0xf33de168  ! 2813: STDF_I	std	%f25, [0x0168, %r23]
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2356040  ! 2818: STH_I	sth	%r25, [%r21 + 0x0040]
	.word 0xfc2da09f  ! 2820: STB_I	stb	%r30, [%r22 + 0x009f]
	.word 0xbcac6146  ! 2821: ANDNcc_I	andncc 	%r17, 0x0146, %r30
	.word 0xfe3d6059  ! 2823: STD_I	std	%r31, [%r21 + 0x0059]
	.word 0x87952021  ! 2831: WRPR_TT_I	wrpr	%r20, 0x0021, %tt
	.word 0xf02c8000  ! 2832: STB_R	stb	%r24, [%r18 + %r0]
	.word 0x8394a1a9  ! 2834: WRPR_TNPC_I	wrpr	%r18, 0x01a9, %tnpc
	.word 0xf834a044  ! 2836: STH_I	sth	%r28, [%r18 + 0x0044]
	.word 0xf03d0000  ! 2838: STD_R	std	%r24, [%r20 + %r0]
	.word 0xb6040000  ! 2841: ADD_R	add 	%r16, %r0, %r27
	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 2844: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf0250000  ! 2845: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf235e0ae  ! 2850: STH_I	sth	%r25, [%r23 + 0x00ae]
	.word 0xbb540000  ! 2853: RDPR_GL	<illegal instruction>
	.word 0xbb2dc000  ! 2855: SLL_R	sll 	%r23, %r0, %r29
	.word 0xf73ce0db  ! 2856: STDF_I	std	%f27, [0x00db, %r19]
	setx	0x20329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41c60d6  ! 2860: XOR_I	xor 	%r17, 0x00d6, %r26
	.word 0xba8d219b  ! 2865: ANDcc_I	andcc 	%r20, 0x019b, %r29
	.word 0xfe75210f  ! 2866: STX_I	stx	%r31, [%r20 + 0x010f]
	.word 0xbd510000  ! 2873: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xfc75c000  ! 2875: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xb734f001  ! 2879: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xfa750000  ! 2881: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xb5510000  ! 2883: RDPR_TICK	<illegal instruction>
	.word 0xf8750000  ! 2891: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xfe34e1ed  ! 2894: STH_I	sth	%r31, [%r19 + 0x01ed]
	setx	data_start_4, %g1, %r21
	.word 0xf825a092  ! 2899: STW_I	stw	%r28, [%r22 + 0x0092]
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa34e1a1  ! 2909: STH_I	sth	%r29, [%r19 + 0x01a1]
	.word 0xb7504000  ! 2911: RDPR_TNPC	<illegal instruction>
	.word 0xfe2d4000  ! 2915: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf63de077  ! 2916: STD_I	std	%r27, [%r23 + 0x0077]
	.word 0xf02c4000  ! 2917: STB_R	stb	%r24, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982c91  ! 2919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c91, %hpstate
	.word 0xb614c000  ! 2924: OR_R	or 	%r19, %r0, %r27
	.word 0xf275c000  ! 2926: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xb3540000  ! 2927: RDPR_GL	rdpr	%-, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982a89  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a89, %hpstate
	.word 0xfa35a027  ! 2933: STH_I	sth	%r29, [%r22 + 0x0027]
	setx	0x30302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c8000  ! 2942: STD_R	std	%r31, [%r18 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	2, %r12
	.word 0x8f932000  ! 2949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b89  ! 2955: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b89, %hpstate
	.word 0xf73c8000  ! 2956: STDF_R	std	%f27, [%r0, %r18]
	.word 0xfc3ca180  ! 2958: STD_I	std	%r30, [%r18 + 0x0180]
	.word 0xfe3d61b4  ! 2961: STD_I	std	%r31, [%r21 + 0x01b4]
	.word 0xf63d0000  ! 2962: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf93c21ff  ! 2963: STDF_I	std	%f28, [0x01ff, %r16]
	.word 0xf434a140  ! 2964: STH_I	sth	%r26, [%r18 + 0x0140]
	.word 0xf63c0000  ! 2965: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb01d4000  ! 2970: XOR_R	xor 	%r21, %r0, %r24
	.word 0xfe250000  ! 2971: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf53c4000  ! 2974: STDF_R	std	%f26, [%r0, %r17]
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 2976: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfe74e1ab  ! 2978: STX_I	stx	%r31, [%r19 + 0x01ab]
	.word 0x8394e159  ! 2979: WRPR_TNPC_I	wrpr	%r19, 0x0159, %tnpc
	.word 0xf82d4000  ! 2982: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xff3ca172  ! 2983: STDF_I	std	%f31, [0x0172, %r18]
	.word 0xfe3c0000  ! 2984: STD_R	std	%r31, [%r16 + %r0]
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194617c  ! 2986: WRPR_TPC_I	wrpr	%r17, 0x017c, %tpc
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 2988: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8594a1fc  ! 2989: WRPR_TSTATE_I	wrpr	%r18, 0x01fc, %tstate
	.word 0xfc35e12c  ! 2990: STH_I	sth	%r30, [%r23 + 0x012c]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf43de14f  ! 2995: STD_I	std	%r26, [%r23 + 0x014f]
	.word 0xf2248000  ! 2997: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf42d4000  ! 2999: STB_R	stb	%r26, [%r21 + %r0]
	setx	data_start_0, %g1, %r16
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf635e1b0  ! 3003: STH_I	sth	%r27, [%r23 + 0x01b0]
	setx	0x3012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8a46080  ! 3010: SUBcc_I	subcc 	%r17, 0x0080, %r28
	setx	data_start_7, %g1, %r23
	.word 0xf03c21fb  ! 3012: STD_I	std	%r24, [%r16 + 0x01fb]
	.word 0xb5508000  ! 3017: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x899460f5  ! 3018: WRPR_TICK_I	wrpr	%r17, 0x00f5, %tick
	setx	0x2002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d4000  ! 3030: STD_R	std	%r27, [%r21 + %r0]
	.word 0xbf518000  ! 3031: RDPR_PSTATE	rdpr	%pstate, %r31
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4756127  ! 3041: STX_I	stx	%r26, [%r21 + 0x0127]
	.word 0xb9508000  ! 3044: RDPR_TSTATE	<illegal instruction>
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982941  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0941, %hpstate
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba0de0a9  ! 3056: AND_I	and 	%r23, 0x00a9, %r29
	.word 0xfc75c000  ! 3059: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfe752198  ! 3061: STX_I	stx	%r31, [%r20 + 0x0198]
	setx	0x106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a1e8  ! 3065: WRPR_PIL_I	wrpr	%r22, 0x01e8, %pil
	.word 0xb5540000  ! 3066: RDPR_GL	rdpr	%-, %r26
	.word 0xf83c4000  ! 3069: STD_R	std	%r28, [%r17 + %r0]
	.word 0xf73c0000  ! 3070: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf0254000  ! 3071: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xfa358000  ! 3072: STH_R	sth	%r29, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983981  ! 3073: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1981, %hpstate
	.word 0xf03ce199  ! 3074: STD_I	std	%r24, [%r19 + 0x0199]
	.word 0xbd2da001  ! 3077: SLL_I	sll 	%r22, 0x0001, %r30
	.word 0xfe3c8000  ! 3079: STD_R	std	%r31, [%r18 + %r0]
	.word 0x83952083  ! 3082: WRPR_TNPC_I	wrpr	%r20, 0x0083, %tnpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf63c6097  ! 3086: STD_I	std	%r27, [%r17 + 0x0097]
	.word 0xb7520000  ! 3088: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb89cc000  ! 3091: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xf6358000  ! 3093: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xb1508000  ! 3094: RDPR_TSTATE	<illegal instruction>
	.word 0xf63d6046  ! 3095: STD_I	std	%r27, [%r21 + 0x0046]
	.word 0x8594e1c2  ! 3100: WRPR_TSTATE_I	wrpr	%r19, 0x01c2, %tstate
	.word 0xfc2c601e  ! 3105: STB_I	stb	%r30, [%r17 + 0x001e]
	.word 0xfc3da145  ! 3109: STD_I	std	%r30, [%r22 + 0x0145]
	.word 0xfa2d8000  ! 3110: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfc3d6196  ! 3111: STD_I	std	%r30, [%r21 + 0x0196]
	mov	1, %r14
	.word 0xa193a000  ! 3114: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb504000  ! 3115: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf2740000  ! 3121: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf075603d  ! 3123: STX_I	stx	%r24, [%r21 + 0x003d]
	.word 0x879561bb  ! 3124: WRPR_TT_I	wrpr	%r21, 0x01bb, %tt
	.word 0xb5500000  ! 3125: RDPR_TPC	rdpr	%tpc, %r26
	setx	data_start_5, %g1, %r21
	.word 0xff3c8000  ! 3127: STDF_R	std	%f31, [%r0, %r18]
	ta	T_CHANGE_HPRIV
	.word 0x81982e8b  ! 3131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
	.word 0xf13c8000  ! 3133: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf62d617e  ! 3135: STB_I	stb	%r27, [%r21 + 0x017e]
	.word 0xf02dc000  ! 3140: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb7480000  ! 3141: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf83ca0f2  ! 3142: STD_I	std	%r28, [%r18 + 0x00f2]
	.word 0xfc754000  ! 3146: STX_R	stx	%r30, [%r21 + %r0]
	setx	data_start_1, %g1, %r19
	.word 0xf82ce0f1  ! 3148: STB_I	stb	%r28, [%r19 + 0x00f1]
	.word 0xb205c000  ! 3150: ADD_R	add 	%r23, %r0, %r25
	.word 0xf8746122  ! 3151: STX_I	stx	%r28, [%r17 + 0x0122]
	.word 0xb1508000  ! 3156: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r22
	.word 0xf0744000  ! 3158: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf475c000  ! 3159: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xbc85a199  ! 3163: ADDcc_I	addcc 	%r22, 0x0199, %r30
	.word 0xb951c000  ! 3164: RDPR_TL	<illegal instruction>
	.word 0xf73d20d8  ! 3168: STDF_I	std	%f27, [0x00d8, %r20]
	.word 0xb7480000  ! 3171: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6242185  ! 3179: STW_I	stw	%r27, [%r16 + 0x0185]
	setx	data_start_6, %g1, %r16
	.word 0xf22d4000  ! 3182: STB_R	stb	%r25, [%r21 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6358000  ! 3187: SUBC_R	orn 	%r22, %r0, %r27
	.word 0xfa75207e  ! 3189: STX_I	stx	%r29, [%r20 + 0x007e]
	setx	0x10205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8350000  ! 3194: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf434e182  ! 3196: STH_I	sth	%r26, [%r19 + 0x0182]
	.word 0xf875614d  ! 3202: STX_I	stx	%r28, [%r21 + 0x014d]
	.word 0xfb3da046  ! 3205: STDF_I	std	%f29, [0x0046, %r22]
	.word 0xbb2dc000  ! 3209: SLL_R	sll 	%r23, %r0, %r29
	.word 0xbd508000  ! 3210: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	data_start_3, %g1, %r18
	setx	data_start_5, %g1, %r23
	.word 0xb484211f  ! 3219: ADDcc_I	addcc 	%r16, 0x011f, %r26
	.word 0xfc2561ae  ! 3220: STW_I	stw	%r30, [%r21 + 0x01ae]
	.word 0xb2344000  ! 3221: ORN_R	orn 	%r17, %r0, %r25
	.word 0xb73d6001  ! 3223: SRA_I	sra 	%r21, 0x0001, %r27
	setx	data_start_0, %g1, %r19
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 3231: RDPR_TL	rdpr	%tl, %r24
	.word 0xf4358000  ! 3233: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfa3d214f  ! 3235: STD_I	std	%r29, [%r20 + 0x014f]
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf424e05e  ! 3239: STW_I	stw	%r26, [%r19 + 0x005e]
	.word 0xfa25c000  ! 3240: STW_R	stw	%r29, [%r23 + %r0]
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3560ea  ! 3247: STH_I	sth	%r29, [%r21 + 0x00ea]
	.word 0xb68d4000  ! 3249: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xfe740000  ! 3250: STX_R	stx	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf02d4000  ! 3256: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xfa3561ec  ! 3257: STH_I	sth	%r29, [%r21 + 0x01ec]
	.word 0xfe2de038  ! 3259: STB_I	stb	%r31, [%r23 + 0x0038]
	.word 0xf02cc000  ! 3261: STB_R	stb	%r24, [%r19 + %r0]
	.word 0x8195a008  ! 3264: WRPR_TPC_I	wrpr	%r22, 0x0008, %tpc
	.word 0xf13d20eb  ! 3268: STDF_I	std	%f24, [0x00eb, %r20]
	.word 0x8594a1e8  ! 3272: WRPR_TSTATE_I	wrpr	%r18, 0x01e8, %tstate
	.word 0xfb3d0000  ! 3277: STDF_R	std	%f29, [%r0, %r20]
	.word 0xf4250000  ! 3280: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfc2d609a  ! 3281: STB_I	stb	%r30, [%r21 + 0x009a]
	.word 0xf0348000  ! 3282: STH_R	sth	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983fc3  ! 3284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc3, %hpstate
	.word 0xf63561bd  ! 3287: STH_I	sth	%r27, [%r21 + 0x01bd]
	.word 0xb37cc400  ! 3289: MOVR_R	movre	%r19, %r0, %r25
	setx	0x30214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 3293: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfc24e10d  ! 3303: STW_I	stw	%r30, [%r19 + 0x010d]
	.word 0xf634a00e  ! 3305: STH_I	sth	%r27, [%r18 + 0x000e]
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc748000  ! 3307: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf2346022  ! 3308: STH_I	sth	%r25, [%r17 + 0x0022]
	.word 0xf2348000  ! 3310: STH_R	sth	%r25, [%r18 + %r0]
	setx	0x2012f, %g1, %o0
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
	.word 0xff3d216d  ! 3317: STDF_I	std	%f31, [0x016d, %r20]
	.word 0xf63c0000  ! 3318: STD_R	std	%r27, [%r16 + %r0]
	.word 0x8d94a113  ! 3319: WRPR_PSTATE_I	wrpr	%r18, 0x0113, %pstate
	.word 0xbd520000  ! 3320: RDPR_PIL	rdpr	%pil, %r30
	.word 0xfa3dc000  ! 3322: STD_R	std	%r29, [%r23 + %r0]
	.word 0xb7518000  ! 3324: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r19
	.word 0xb3643801  ! 3331: MOVcc_I	<illegal instruction>
	.word 0x8d9520ab  ! 3332: WRPR_PSTATE_I	wrpr	%r20, 0x00ab, %pstate
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22de099  ! 3334: STB_I	stb	%r25, [%r23 + 0x0099]
	.word 0x8d95a098  ! 3335: WRPR_PSTATE_I	wrpr	%r22, 0x0098, %pstate
	.word 0xb751c000  ! 3336: RDPR_TL	rdpr	%tl, %r27
	.word 0xb00de020  ! 3337: AND_I	and 	%r23, 0x0020, %r24
	.word 0xf2254000  ! 3338: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xbd510000  ! 3339: RDPR_TICK	<illegal instruction>
	.word 0xf13d21cd  ! 3340: STDF_I	std	%f24, [0x01cd, %r20]
	.word 0xb0346178  ! 3341: SUBC_I	orn 	%r17, 0x0178, %r24
	.word 0xf224e1ee  ! 3342: STW_I	stw	%r25, [%r19 + 0x01ee]
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 3345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	.word 0x919560b5  ! 3357: WRPR_PIL_I	wrpr	%r21, 0x00b5, %pil
	.word 0xf2752177  ! 3359: STX_I	stx	%r25, [%r20 + 0x0177]
	ta	T_CHANGE_HPRIV
	.word 0x81982b03  ! 3360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b03, %hpstate
	.word 0xf73c61b1  ! 3361: STDF_I	std	%f27, [0x01b1, %r17]
	.word 0xf62521de  ! 3363: STW_I	stw	%r27, [%r20 + 0x01de]
	.word 0xba2d4000  ! 3364: ANDN_R	andn 	%r21, %r0, %r29
	.word 0xfc25a178  ! 3365: STW_I	stw	%r30, [%r22 + 0x0178]
	mov	1, %r14
	.word 0xa193a000  ! 3367: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf23de17f  ! 3368: STD_I	std	%r25, [%r23 + 0x017f]
	.word 0xf2754000  ! 3371: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfa250000  ! 3374: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfd3c216c  ! 3376: STDF_I	std	%f30, [0x016c, %r16]
	.word 0xb550c000  ! 3377: RDPR_TT	rdpr	%tt, %r26
	.word 0xbeacc000  ! 3385: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0x8d9561bc  ! 3387: WRPR_PSTATE_I	wrpr	%r21, 0x01bc, %pstate
	.word 0xf42d212c  ! 3390: STB_I	stb	%r26, [%r20 + 0x012c]
	.word 0x8d94a0e8  ! 3391: WRPR_PSTATE_I	wrpr	%r18, 0x00e8, %pstate
	.word 0xb3500000  ! 3392: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf6258000  ! 3395: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xfe748000  ! 3396: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xbf7d2401  ! 3398: MOVR_I	movre	%r20, 0x1, %r31
	.word 0x839561d4  ! 3400: WRPR_TNPC_I	wrpr	%r21, 0x01d4, %tnpc
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa342194  ! 3407: STH_I	sth	%r29, [%r16 + 0x0194]
	ta	T_CHANGE_HPRIV
	.word 0x81983ed3  ! 3408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed3, %hpstate
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2da178  ! 3411: STB_I	stb	%r29, [%r22 + 0x0178]
	.word 0xf13cc000  ! 3412: STDF_R	std	%f24, [%r0, %r19]
	.word 0xf53dc000  ! 3414: STDF_R	std	%f26, [%r0, %r23]
	.word 0xbd540000  ! 3421: RDPR_GL	rdpr	%-, %r30
	.word 0xf82d61e6  ! 3423: STB_I	stb	%r28, [%r21 + 0x01e6]
	.word 0xb7518000  ! 3428: RDPR_PSTATE	<illegal instruction>
	.word 0xf63de168  ! 3429: STD_I	std	%r27, [%r23 + 0x0168]
	setx	0x30036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ad8000  ! 3432: ANDNcc_R	andncc 	%r22, %r0, %r26
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 3436: STX_R	stx	%r28, [%r18 + %r0]
	setx	data_start_2, %g1, %r20
	.word 0xf53cc000  ! 3440: STDF_R	std	%f26, [%r0, %r19]
	.word 0xb2a4212d  ! 3445: SUBcc_I	subcc 	%r16, 0x012d, %r25
	.word 0xf43de1e7  ! 3446: STD_I	std	%r26, [%r23 + 0x01e7]
	.word 0xfe2ce1e5  ! 3447: STB_I	stb	%r31, [%r19 + 0x01e5]
	.word 0x8795e160  ! 3449: WRPR_TT_I	wrpr	%r23, 0x0160, %tt
	.word 0xff3c4000  ! 3450: STDF_R	std	%f31, [%r0, %r17]
	mov	1, %r14
	.word 0xa193a000  ! 3451: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf274e18d  ! 3457: STX_I	stx	%r25, [%r19 + 0x018d]
	.word 0xb7508000  ! 3460: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x819560d4  ! 3463: WRPR_TPC_I	wrpr	%r21, 0x00d4, %tpc
	.word 0xb9508000  ! 3464: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf03d4000  ! 3465: STD_R	std	%r24, [%r21 + %r0]
	.word 0x8594a045  ! 3467: WRPR_TSTATE_I	wrpr	%r18, 0x0045, %tstate
	.word 0xf93d8000  ! 3469: STDF_R	std	%f28, [%r0, %r22]
	mov	2, %r14
	.word 0xa193a000  ! 3470: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7500000  ! 3471: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xbe95c000  ! 3472: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xbcc4e172  ! 3473: ADDCcc_I	addccc 	%r19, 0x0172, %r30
	.word 0xfb3d614e  ! 3477: STDF_I	std	%f29, [0x014e, %r21]
	.word 0xfc25e1fa  ! 3478: STW_I	stw	%r30, [%r23 + 0x01fa]
	setx	data_start_2, %g1, %r21
	setx	0x226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a0dd  ! 3485: WRPR_TT_I	wrpr	%r22, 0x00dd, %tt
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81946198  ! 3488: WRPR_TPC_I	wrpr	%r17, 0x0198, %tpc
	.word 0xf13c4000  ! 3490: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf234219d  ! 3491: STH_I	sth	%r25, [%r16 + 0x019d]
	.word 0x8795a180  ! 3492: WRPR_TT_I	wrpr	%r22, 0x0180, %tt
	.word 0xfe3da05b  ! 3500: STD_I	std	%r31, [%r22 + 0x005b]
	.word 0xfc35a105  ! 3501: STH_I	sth	%r30, [%r22 + 0x0105]
	.word 0xb6348000  ! 3503: SUBC_R	orn 	%r18, %r0, %r27
	.word 0xf4250000  ! 3504: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xb151c000  ! 3508: RDPR_TL	rdpr	%tl, %r24
	.word 0xfc344000  ! 3509: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xbcbc0000  ! 3511: XNORcc_R	xnorcc 	%r16, %r0, %r30
	.word 0xb9508000  ! 3515: RDPR_TSTATE	<illegal instruction>
	.word 0xbca4c000  ! 3517: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xbe1d8000  ! 3518: XOR_R	xor 	%r22, %r0, %r31
	.word 0xf875209e  ! 3520: STX_I	stx	%r28, [%r20 + 0x009e]
	.word 0x89952007  ! 3522: WRPR_TICK_I	wrpr	%r20, 0x0007, %tick
	.word 0xb00de0b3  ! 3527: AND_I	and 	%r23, 0x00b3, %r24
	.word 0xfa3c4000  ! 3528: STD_R	std	%r29, [%r17 + %r0]
	.word 0x8d95a0fc  ! 3530: WRPR_PSTATE_I	wrpr	%r22, 0x00fc, %pstate
	.word 0xbd3ca001  ! 3531: SRA_I	sra 	%r18, 0x0001, %r30
	.word 0xb6a54000  ! 3533: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xf824615d  ! 3534: STW_I	stw	%r28, [%r17 + 0x015d]
	.word 0xbb504000  ! 3536: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb5480000  ! 3537: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfa3ca0a7  ! 3538: STD_I	std	%r29, [%r18 + 0x00a7]
	.word 0xb7504000  ! 3543: RDPR_TNPC	<illegal instruction>
	.word 0xfa7521ce  ! 3545: STX_I	stx	%r29, [%r20 + 0x01ce]
	.word 0x91956098  ! 3546: WRPR_PIL_I	wrpr	%r21, 0x0098, %pil
	.word 0x9194210f  ! 3547: WRPR_PIL_I	wrpr	%r16, 0x010f, %pil
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c0000  ! 3552: STD_R	std	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982a11  ! 3555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a11, %hpstate
	.word 0xbc1421e5  ! 3557: OR_I	or 	%r16, 0x01e5, %r30
	setx	0x30319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43461e9  ! 3559: STH_I	sth	%r26, [%r17 + 0x01e9]
	.word 0xbe3da11a  ! 3564: XNOR_I	xnor 	%r22, 0x011a, %r31
	.word 0xf074a069  ! 3565: STX_I	stx	%r24, [%r18 + 0x0069]
	.word 0xf73d4000  ! 3567: STDF_R	std	%f27, [%r0, %r21]
	.word 0xf02d8000  ! 3569: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf82c0000  ! 3570: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xfc34c000  ! 3573: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xfe34610b  ! 3584: STH_I	sth	%r31, [%r17 + 0x010b]
	.word 0xf0740000  ! 3585: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf0348000  ! 3586: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf224c000  ! 3587: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xb13c9000  ! 3589: SRAX_R	srax	%r18, %r0, %r24
	.word 0x8995614a  ! 3590: WRPR_TICK_I	wrpr	%r21, 0x014a, %tick
	.word 0xfa25a138  ! 3594: STW_I	stw	%r29, [%r22 + 0x0138]
	.word 0xf425a1be  ! 3596: STW_I	stw	%r26, [%r22 + 0x01be]
	.word 0xb9341000  ! 3597: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xf03421ab  ! 3598: STH_I	sth	%r24, [%r16 + 0x01ab]
	.word 0xf63d60c0  ! 3603: STD_I	std	%r27, [%r21 + 0x00c0]
	.word 0xb5641800  ! 3604: MOVcc_R	<illegal instruction>
	.word 0xf42520e5  ! 3606: STW_I	stw	%r26, [%r20 + 0x00e5]
	.word 0xfe2ce066  ! 3607: STB_I	stb	%r31, [%r19 + 0x0066]
	.word 0xfa74a021  ! 3608: STX_I	stx	%r29, [%r18 + 0x0021]
	.word 0xfe344000  ! 3610: STH_R	sth	%r31, [%r17 + %r0]
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe34a08d  ! 3613: STH_I	sth	%r31, [%r18 + 0x008d]
	.word 0x8d94205d  ! 3616: WRPR_PSTATE_I	wrpr	%r16, 0x005d, %pstate
	.word 0xb4952057  ! 3617: ORcc_I	orcc 	%r20, 0x0057, %r26
	setx	0x21b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3cc000  ! 3621: STD_R	std	%r31, [%r19 + %r0]
	.word 0x899420a9  ! 3625: WRPR_TICK_I	wrpr	%r16, 0x00a9, %tick
	.word 0xf22d8000  ! 3627: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xfa240000  ! 3629: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xbf347001  ! 3630: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xfa3ca075  ! 3634: STD_I	std	%r29, [%r18 + 0x0075]
	.word 0xf62c4000  ! 3637: STB_R	stb	%r27, [%r17 + %r0]
	.word 0x83942009  ! 3639: WRPR_TNPC_I	wrpr	%r16, 0x0009, %tnpc
	.word 0xf67420cd  ! 3641: STX_I	stx	%r27, [%r16 + 0x00cd]
	mov	1, %r14
	.word 0xa193a000  ! 3642: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43421d2  ! 3648: STH_I	sth	%r26, [%r16 + 0x01d2]
	.word 0xb2b4619f  ! 3649: SUBCcc_I	orncc 	%r17, 0x019f, %r25
	.word 0xf425211c  ! 3657: STW_I	stw	%r26, [%r20 + 0x011c]
	.word 0xfa35e045  ! 3658: STH_I	sth	%r29, [%r23 + 0x0045]
	setx	0x3011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc354000  ! 3664: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xb950c000  ! 3665: RDPR_TT	rdpr	%tt, %r28
	.word 0xf674a10e  ! 3667: STX_I	stx	%r27, [%r18 + 0x010e]
	.word 0xf4340000  ! 3673: STH_R	sth	%r26, [%r16 + %r0]
	.word 0x9195a068  ! 3675: WRPR_PIL_I	wrpr	%r22, 0x0068, %pil
	.word 0xfe348000  ! 3676: STH_R	sth	%r31, [%r18 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 3678: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983e1b  ! 3679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1b, %hpstate
	.word 0xf93c6074  ! 3680: STDF_I	std	%f28, [0x0074, %r17]
	.word 0xfc35600f  ! 3682: STH_I	sth	%r30, [%r21 + 0x000f]
	.word 0xfe750000  ! 3683: STX_R	stx	%r31, [%r20 + %r0]
	.word 0x9195e0ad  ! 3689: WRPR_PIL_I	wrpr	%r23, 0x00ad, %pil
	.word 0xb92cc000  ! 3690: SLL_R	sll 	%r19, %r0, %r28
	.word 0xfe75a07a  ! 3697: STX_I	stx	%r31, [%r22 + 0x007a]
	mov	0, %r14
	.word 0xa193a000  ! 3698: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x839560a6  ! 3699: WRPR_TNPC_I	wrpr	%r21, 0x00a6, %tnpc
	.word 0x8794a167  ! 3701: WRPR_TT_I	wrpr	%r18, 0x0167, %tt
	.word 0xb37cc400  ! 3706: MOVR_R	movre	%r19, %r0, %r25
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4250000  ! 3710: STW_R	stw	%r26, [%r20 + %r0]
	setx	data_start_3, %g1, %r16
	.word 0xb4354000  ! 3714: ORN_R	orn 	%r21, %r0, %r26
	mov	2, %r12
	.word 0x8f932000  ! 3715: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1500000  ! 3717: RDPR_TPC	rdpr	%tpc, %r24
	mov	2, %r12
	.word 0x8f932000  ! 3718: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1540000  ! 3721: RDPR_GL	rdpr	%-, %r24
	.word 0xf0740000  ! 3722: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf2250000  ! 3726: STW_R	stw	%r25, [%r20 + %r0]
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63c0000  ! 3730: STD_R	std	%r27, [%r16 + %r0]
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c8000  ! 3732: STDF_R	std	%f29, [%r0, %r18]
	.word 0xf2748000  ! 3738: STX_R	stx	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4240000  ! 3740: STW_R	stw	%r26, [%r16 + %r0]
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3cc000  ! 3744: SRA_R	sra 	%r19, %r0, %r29
	setx	data_start_7, %g1, %r16
	.word 0xf8340000  ! 3747: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfe34a07f  ! 3748: STH_I	sth	%r31, [%r18 + 0x007f]
	setx	data_start_3, %g1, %r18
	.word 0xf63d4000  ! 3754: STD_R	std	%r27, [%r21 + %r0]
	setx	data_start_5, %g1, %r20
	.word 0xfa350000  ! 3757: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfe2460c0  ! 3764: STW_I	stw	%r31, [%r17 + 0x00c0]
	.word 0xbf500000  ! 3765: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf82c6010  ! 3766: STB_I	stb	%r28, [%r17 + 0x0010]
	.word 0xf62ce097  ! 3767: STB_I	stb	%r27, [%r19 + 0x0097]
	.word 0x8d952133  ! 3769: WRPR_PSTATE_I	wrpr	%r20, 0x0133, %pstate
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43ce000  ! 3774: STD_I	std	%r26, [%r19 + 0x0000]
	.word 0xf675211d  ! 3777: STX_I	stx	%r27, [%r20 + 0x011d]
	.word 0xf13d209a  ! 3780: STDF_I	std	%f24, [0x009a, %r20]
	.word 0xfc3d0000  ! 3782: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf43ca191  ! 3783: STD_I	std	%r26, [%r18 + 0x0191]
	.word 0xfa758000  ! 3784: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfe2de100  ! 3790: STB_I	stb	%r31, [%r23 + 0x0100]
	.word 0xf93ca0a6  ! 3791: STDF_I	std	%f28, [0x00a6, %r18]
	.word 0xbc0520df  ! 3792: ADD_I	add 	%r20, 0x00df, %r30
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf635c000  ! 3796: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xb4bc219e  ! 3800: XNORcc_I	xnorcc 	%r16, 0x019e, %r26
	.word 0xf53d4000  ! 3802: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf274c000  ! 3804: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xbd500000  ! 3807: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x87952190  ! 3808: WRPR_TT_I	wrpr	%r20, 0x0190, %tt
	.word 0xb97d6401  ! 3810: MOVR_I	movre	%r21, 0x1, %r28
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02d4000  ! 3813: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf6240000  ! 3815: STW_R	stw	%r27, [%r16 + %r0]
	setx	0x2c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6352022  ! 3822: STH_I	sth	%r27, [%r20 + 0x0022]
	mov	2, %r14
	.word 0xa193a000  ! 3825: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1355000  ! 3829: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xb5500000  ! 3831: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x91942067  ! 3832: WRPR_PIL_I	wrpr	%r16, 0x0067, %pil
	.word 0x9195e121  ! 3836: WRPR_PIL_I	wrpr	%r23, 0x0121, %pil
	ta	T_CHANGE_HPRIV
	.word 0x819839db  ! 3837: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19db, %hpstate
	.word 0xf53c60bf  ! 3842: STDF_I	std	%f26, [0x00bf, %r17]
	.word 0xf274a0fa  ! 3843: STX_I	stx	%r25, [%r18 + 0x00fa]
	.word 0xf4350000  ! 3846: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf8350000  ! 3850: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf474a0ac  ! 3851: STX_I	stx	%r26, [%r18 + 0x00ac]
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 3855: MOVcc_I	<illegal instruction>
	.word 0x839561cb  ! 3859: WRPR_TNPC_I	wrpr	%r21, 0x01cb, %tnpc
	.word 0xb6b4a0c2  ! 3864: SUBCcc_I	orncc 	%r18, 0x00c2, %r27
	.word 0x8395e17c  ! 3870: WRPR_TNPC_I	wrpr	%r23, 0x017c, %tnpc
	.word 0xb3518000  ! 3871: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf47561d2  ! 3873: STX_I	stx	%r26, [%r21 + 0x01d2]
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3ce080  ! 3879: STD_I	std	%r30, [%r19 + 0x0080]
	.word 0xfa344000  ! 3883: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xbe0c0000  ! 3884: AND_R	and 	%r16, %r0, %r31
	.word 0xf2748000  ! 3885: STX_R	stx	%r25, [%r18 + %r0]
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa35c000  ! 3893: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xfa242109  ! 3903: STW_I	stw	%r29, [%r16 + 0x0109]
	.word 0x8794e09e  ! 3906: WRPR_TT_I	wrpr	%r19, 0x009e, %tt
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a121  ! 3921: WRPR_TICK_I	wrpr	%r18, 0x0121, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982c41  ! 3922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c41, %hpstate
	.word 0xfe3d6091  ! 3923: STD_I	std	%r31, [%r21 + 0x0091]
	.word 0xf43cc000  ! 3924: STD_R	std	%r26, [%r19 + %r0]
	.word 0x8795616f  ! 3925: WRPR_TT_I	wrpr	%r21, 0x016f, %tt
	.word 0xb12c6001  ! 3926: SLL_I	sll 	%r17, 0x0001, %r24
	.word 0xfd3ca0f0  ! 3927: STDF_I	std	%f30, [0x00f0, %r18]
	.word 0xf03d8000  ! 3928: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf03da124  ! 3929: STD_I	std	%r24, [%r22 + 0x0124]
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 3936: RDPR_TL	rdpr	%tl, %r26
	mov	1, %r14
	.word 0xa193a000  ! 3937: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf225a0cf  ! 3938: STW_I	stw	%r25, [%r22 + 0x00cf]
	.word 0xf6340000  ! 3941: STH_R	sth	%r27, [%r16 + %r0]
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf875a163  ! 3948: STX_I	stx	%r28, [%r22 + 0x0163]
	.word 0xf4340000  ! 3951: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfc3ca1c0  ! 3957: STD_I	std	%r30, [%r18 + 0x01c0]
	.word 0xfe24c000  ! 3958: STW_R	stw	%r31, [%r19 + %r0]
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2da149  ! 3965: STB_I	stb	%r30, [%r22 + 0x0149]
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa346185  ! 3969: STH_I	sth	%r29, [%r17 + 0x0185]
	.word 0x87946139  ! 3975: WRPR_TT_I	wrpr	%r17, 0x0139, %tt
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf424a158  ! 3980: STW_I	stw	%r26, [%r18 + 0x0158]
	setx	data_start_5, %g1, %r23
	.word 0xf13ce087  ! 3983: STDF_I	std	%f24, [0x0087, %r19]
	.word 0xff3c60ab  ! 3984: STDF_I	std	%f31, [0x00ab, %r17]
	setx	0x30211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859560c8  ! 3987: WRPR_TSTATE_I	wrpr	%r21, 0x00c8, %tstate
	.word 0xf0348000  ! 3988: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xb0b58000  ! 3990: SUBCcc_R	orncc 	%r22, %r0, %r24
	setx	data_start_2, %g1, %r18
	.word 0xf73d4000  ! 3996: STDF_R	std	%f27, [%r0, %r21]
	.word 0xf82ce054  ! 3998: STB_I	stb	%r28, [%r19 + 0x0054]
	.word 0xf03421e7  ! 4000: STH_I	sth	%r24, [%r16 + 0x01e7]
	.word 0xf424a184  ! 4007: STW_I	stw	%r26, [%r18 + 0x0184]
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8346037  ! 4011: STH_I	sth	%r28, [%r17 + 0x0037]
	.word 0xf2244000  ! 4014: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf33c0000  ! 4016: STDF_R	std	%f25, [%r0, %r16]
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 4023: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb085c000  ! 4026: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xb20420d1  ! 4027: ADD_I	add 	%r16, 0x00d1, %r25
	.word 0xf675e01d  ! 4029: STX_I	stx	%r27, [%r23 + 0x001d]
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c60ff  ! 4034: STD_I	std	%r31, [%r17 + 0x00ff]
	.word 0xb82d2059  ! 4036: ANDN_I	andn 	%r20, 0x0059, %r28
	.word 0xf475e1f9  ! 4041: STX_I	stx	%r26, [%r23 + 0x01f9]
	mov	2, %r14
	.word 0xa193a000  ! 4044: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6c4e128  ! 4048: ADDCcc_I	addccc 	%r19, 0x0128, %r27
	setx	data_start_7, %g1, %r22
	setx	0x20222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c607d  ! 4052: STDF_I	std	%f31, [0x007d, %r17]
	setx	data_start_3, %g1, %r19
	.word 0xb32c8000  ! 4059: SLL_R	sll 	%r18, %r0, %r25
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe35e166  ! 4064: STH_I	sth	%r31, [%r23 + 0x0166]
	.word 0xf62c61af  ! 4065: STB_I	stb	%r27, [%r17 + 0x01af]
	.word 0xfb3d8000  ! 4066: STDF_R	std	%f29, [%r0, %r22]
	.word 0xf42da0f1  ! 4067: STB_I	stb	%r26, [%r22 + 0x00f1]
	.word 0xb13d3001  ! 4070: SRAX_I	srax	%r20, 0x0001, %r24
	.word 0xfe75c000  ! 4081: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfa74e036  ! 4082: STX_I	stx	%r29, [%r19 + 0x0036]
	.word 0x899520a7  ! 4084: WRPR_TICK_I	wrpr	%r20, 0x00a7, %tick
	.word 0xbf518000  ! 4091: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf025e081  ! 4092: STW_I	stw	%r24, [%r23 + 0x0081]
	.word 0xf03ce1c4  ! 4097: STD_I	std	%r24, [%r19 + 0x01c4]
	.word 0xfe3c0000  ! 4100: STD_R	std	%r31, [%r16 + %r0]
	.word 0xf63c8000  ! 4103: STD_R	std	%r27, [%r18 + %r0]
	.word 0x8594208a  ! 4105: WRPR_TSTATE_I	wrpr	%r16, 0x008a, %tstate
	.word 0xfa2d8000  ! 4108: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfc746147  ! 4111: STX_I	stx	%r30, [%r17 + 0x0147]
	.word 0xb9508000  ! 4113: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xbec4a198  ! 4115: ADDCcc_I	addccc 	%r18, 0x0198, %r31
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf424e12b  ! 4119: STW_I	stw	%r26, [%r19 + 0x012b]
	.word 0xb8844000  ! 4120: ADDcc_R	addcc 	%r17, %r0, %r28
	setx	0x3010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43c8000  ! 4122: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf424e16c  ! 4124: STW_I	stw	%r26, [%r19 + 0x016c]
	.word 0xbb520000  ! 4125: RDPR_PIL	<illegal instruction>
	.word 0xfc3d6189  ! 4132: STD_I	std	%r30, [%r21 + 0x0189]
	.word 0xb9510000  ! 4134: RDPR_TICK	<illegal instruction>
	.word 0xf62d4000  ! 4136: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xfa2d0000  ! 4138: STB_R	stb	%r29, [%r20 + %r0]
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2c4000  ! 4141: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf62d0000  ! 4145: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xb72cb001  ! 4147: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xf2354000  ! 4148: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xb3520000  ! 4150: RDPR_PIL	<illegal instruction>
	.word 0x879421e7  ! 4154: WRPR_TT_I	wrpr	%r16, 0x01e7, %tt
	.word 0xf03ce0c7  ! 4158: STD_I	std	%r24, [%r19 + 0x00c7]
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3cc000  ! 4164: STD_R	std	%r30, [%r19 + %r0]
	.word 0xfa3c21ac  ! 4166: STD_I	std	%r29, [%r16 + 0x01ac]
	.word 0xbcacc000  ! 4168: ANDNcc_R	andncc 	%r19, %r0, %r30
	setx	0x30227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 4171: MOVcc_R	<illegal instruction>
	.word 0xf23c8000  ! 4173: STD_R	std	%r25, [%r18 + %r0]
	.word 0xb4858000  ! 4176: ADDcc_R	addcc 	%r22, %r0, %r26
	.word 0xb235a08c  ! 4179: SUBC_I	orn 	%r22, 0x008c, %r25
	.word 0xb1352001  ! 4180: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0xfd3ce07b  ! 4181: STDF_I	std	%f30, [0x007b, %r19]
	.word 0xf63d0000  ! 4186: STD_R	std	%r27, [%r20 + %r0]
	.word 0xbb50c000  ! 4189: RDPR_TT	rdpr	%tt, %r29
	.word 0xf67521ee  ! 4190: STX_I	stx	%r27, [%r20 + 0x01ee]
	.word 0xfc75e0f3  ! 4191: STX_I	stx	%r30, [%r23 + 0x00f3]
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24e13e  ! 4194: STW_I	stw	%r31, [%r19 + 0x013e]
	mov	1, %r14
	.word 0xa193a000  ! 4198: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_2, %g1, %r16
	.word 0xb750c000  ! 4201: RDPR_TT	rdpr	%tt, %r27
	.word 0x8195a17d  ! 4204: WRPR_TPC_I	wrpr	%r22, 0x017d, %tpc
	.word 0xf6356129  ! 4206: STH_I	sth	%r27, [%r21 + 0x0129]
	.word 0xfe3c4000  ! 4209: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf2744000  ! 4210: STX_R	stx	%r25, [%r17 + %r0]
	.word 0x8395e183  ! 4213: WRPR_TNPC_I	wrpr	%r23, 0x0183, %tnpc
	.word 0xba356080  ! 4214: SUBC_I	orn 	%r21, 0x0080, %r29
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcc44000  ! 4220: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0xf23c60a4  ! 4223: STD_I	std	%r25, [%r17 + 0x00a4]
	.word 0xf0354000  ! 4228: STH_R	sth	%r24, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982cc9  ! 4229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc9, %hpstate
	mov	0, %r14
	.word 0xa193a000  ! 4230: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf4244000  ! 4232: STW_R	stw	%r26, [%r17 + %r0]
	.word 0x8394a0f2  ! 4235: WRPR_TNPC_I	wrpr	%r18, 0x00f2, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983ac9  ! 4237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac9, %hpstate
	setx	0x10238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e141  ! 4240: WRPR_PIL_I	wrpr	%r23, 0x0141, %pil
	.word 0xbe0da027  ! 4243: AND_I	and 	%r22, 0x0027, %r31
	.word 0xba344000  ! 4244: ORN_R	orn 	%r17, %r0, %r29
	.word 0xfa242100  ! 4247: STW_I	stw	%r29, [%r16 + 0x0100]
	.word 0xfc2d61d8  ! 4248: STB_I	stb	%r30, [%r21 + 0x01d8]
	.word 0x91946011  ! 4249: WRPR_PIL_I	wrpr	%r17, 0x0011, %pil
	.word 0xf02c2099  ! 4250: STB_I	stb	%r24, [%r16 + 0x0099]
	.word 0xbc152018  ! 4255: OR_I	or 	%r20, 0x0018, %r30
	.word 0xb5340000  ! 4256: SRL_R	srl 	%r16, %r0, %r26
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2dc000  ! 4258: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf835a095  ! 4261: STH_I	sth	%r28, [%r22 + 0x0095]
	.word 0xf4346045  ! 4263: STH_I	sth	%r26, [%r17 + 0x0045]
	.word 0xfe2cc000  ! 4264: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf62de1c2  ! 4266: STB_I	stb	%r27, [%r23 + 0x01c2]
	.word 0xfd3cc000  ! 4268: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf2258000  ! 4269: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xfa2460eb  ! 4270: STW_I	stw	%r29, [%r17 + 0x00eb]
	.word 0xf435e1ad  ! 4272: STH_I	sth	%r26, [%r23 + 0x01ad]
	.word 0xf23de142  ! 4273: STD_I	std	%r25, [%r23 + 0x0142]
	.word 0xf224e04f  ! 4274: STW_I	stw	%r25, [%r19 + 0x004f]
	.word 0x819520eb  ! 4276: WRPR_TPC_I	wrpr	%r20, 0x00eb, %tpc
	.word 0xf4758000  ! 4277: STX_R	stx	%r26, [%r22 + %r0]
	.word 0x8594e100  ! 4278: WRPR_TSTATE_I	wrpr	%r19, 0x0100, %tstate
	.word 0xf03cc000  ! 4283: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf8758000  ! 4286: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xbe44a1a8  ! 4289: ADDC_I	addc 	%r18, 0x01a8, %r31
	.word 0xbd51c000  ! 4292: RDPR_TL	rdpr	%tl, %r30
	.word 0xf6250000  ! 4293: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfb3c4000  ! 4296: STDF_R	std	%f29, [%r0, %r17]
	.word 0xf53c4000  ! 4297: STDF_R	std	%f26, [%r0, %r17]
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2560d1  ! 4302: STW_I	stw	%r31, [%r21 + 0x00d1]
	.word 0xf2758000  ! 4307: STX_R	stx	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d207f  ! 4313: STDF_I	std	%f28, [0x007f, %r20]
	.word 0xf824a0f9  ! 4314: STW_I	stw	%r28, [%r18 + 0x00f9]
	.word 0xf03461f2  ! 4315: STH_I	sth	%r24, [%r17 + 0x01f2]
	.word 0x8195e0d8  ! 4319: WRPR_TPC_I	wrpr	%r23, 0x00d8, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81983d1b  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d1b, %hpstate
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c8000  ! 4329: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xb7480000  ! 4331: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbf520000  ! 4334: RDPR_PIL	<illegal instruction>
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a1ff  ! 4343: WRPR_TPC_I	wrpr	%r22, 0x01ff, %tpc
	.word 0xf4354000  ! 4345: STH_R	sth	%r26, [%r21 + %r0]
	.word 0x8195a07d  ! 4347: WRPR_TPC_I	wrpr	%r22, 0x007d, %tpc
	.word 0xf03d21ee  ! 4348: STD_I	std	%r24, [%r20 + 0x01ee]
	.word 0xf43521b5  ! 4350: STH_I	sth	%r26, [%r20 + 0x01b5]
	.word 0xf33c61ac  ! 4351: STDF_I	std	%f25, [0x01ac, %r17]
	.word 0xf62ce0af  ! 4352: STB_I	stb	%r27, [%r19 + 0x00af]
	.word 0x899421c3  ! 4354: WRPR_TICK_I	wrpr	%r16, 0x01c3, %tick
	.word 0xfa754000  ! 4357: STX_R	stx	%r29, [%r21 + %r0]
	.word 0x819461ae  ! 4358: WRPR_TPC_I	wrpr	%r17, 0x01ae, %tpc
	.word 0x8d94e046  ! 4359: WRPR_PSTATE_I	wrpr	%r19, 0x0046, %pstate
	setx	data_start_6, %g1, %r21
	.word 0xb89c2063  ! 4364: XORcc_I	xorcc 	%r16, 0x0063, %r28
	.word 0xb92cd000  ! 4367: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xfc354000  ! 4370: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf13ca004  ! 4371: STDF_I	std	%f24, [0x0004, %r18]
	.word 0xf6748000  ! 4372: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xfa242083  ! 4373: STW_I	stw	%r29, [%r16 + 0x0083]
	setx	0x13, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4354000  ! 4378: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf03ce0a8  ! 4379: STD_I	std	%r24, [%r19 + 0x00a8]
	.word 0xf675a1b5  ! 4380: STX_I	stx	%r27, [%r22 + 0x01b5]
	.word 0xf83ca072  ! 4382: STD_I	std	%r28, [%r18 + 0x0072]
	.word 0x8d952143  ! 4383: WRPR_PSTATE_I	wrpr	%r20, 0x0143, %pstate
	.word 0xf4258000  ! 4385: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf42ce1ec  ! 4386: STB_I	stb	%r26, [%r19 + 0x01ec]
	ta	T_CHANGE_HPRIV
	.word 0x81982d01  ! 4388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d01, %hpstate
	.word 0xfa2da0fb  ! 4389: STB_I	stb	%r29, [%r22 + 0x00fb]
	.word 0xf93ca122  ! 4391: STDF_I	std	%f28, [0x0122, %r18]
	.word 0xb950c000  ! 4396: RDPR_TT	rdpr	%tt, %r28
	.word 0xfd3c21f5  ! 4397: STDF_I	std	%f30, [0x01f5, %r16]
	.word 0xbd540000  ! 4399: RDPR_GL	<illegal instruction>
	.word 0xb28d8000  ! 4401: ANDcc_R	andcc 	%r22, %r0, %r25
	.word 0xfc74e0ae  ! 4403: STX_I	stx	%r30, [%r19 + 0x00ae]
	.word 0xf23c20da  ! 4404: STD_I	std	%r25, [%r16 + 0x00da]
	.word 0xb4058000  ! 4406: ADD_R	add 	%r22, %r0, %r26
	.word 0xf8244000  ! 4407: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf63d60e0  ! 4409: STD_I	std	%r27, [%r21 + 0x00e0]
	.word 0xf474c000  ! 4415: STX_R	stx	%r26, [%r19 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 4416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf42c0000  ! 4424: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf53d2059  ! 4425: STDF_I	std	%f26, [0x0059, %r20]
	.word 0xf87561f9  ! 4429: STX_I	stx	%r28, [%r21 + 0x01f9]
	.word 0xf835e1d4  ! 4433: STH_I	sth	%r28, [%r23 + 0x01d4]
	.word 0xf2240000  ! 4436: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf8740000  ! 4438: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf075e064  ! 4440: STX_I	stx	%r24, [%r23 + 0x0064]
	.word 0xf4758000  ! 4442: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbe8dc000  ! 4445: ANDcc_R	andcc 	%r23, %r0, %r31
	.word 0xfd3d4000  ! 4446: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf274e1ad  ! 4447: STX_I	stx	%r25, [%r19 + 0x01ad]
	.word 0xf73c20e5  ! 4448: STDF_I	std	%f27, [0x00e5, %r16]
	.word 0xf63de00a  ! 4449: STD_I	std	%r27, [%r23 + 0x000a]
	.word 0xf0246136  ! 4450: STW_I	stw	%r24, [%r17 + 0x0136]
	.word 0xf034a02d  ! 4456: STH_I	sth	%r24, [%r18 + 0x002d]
	.word 0xf234c000  ! 4458: STH_R	sth	%r25, [%r19 + %r0]
	setx	0x137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4461: RDPR_TT	rdpr	%tt, %r27
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42c0000  ! 4463: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xb885a068  ! 4465: ADDcc_I	addcc 	%r22, 0x0068, %r28
	.word 0xfb3d21b9  ! 4466: STDF_I	std	%f29, [0x01b9, %r20]
	.word 0xf225a11a  ! 4467: STW_I	stw	%r25, [%r22 + 0x011a]
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf875606d  ! 4474: STX_I	stx	%r28, [%r21 + 0x006d]
	.word 0xf6742046  ! 4476: STX_I	stx	%r27, [%r16 + 0x0046]
	.word 0xfc354000  ! 4478: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfa3c0000  ! 4480: STD_R	std	%r29, [%r16 + %r0]
	.word 0xfb3c217e  ! 4481: STDF_I	std	%f29, [0x017e, %r16]
	.word 0xb9480000  ! 4484: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbf510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xb62d4000  ! 4489: ANDN_R	andn 	%r21, %r0, %r27
	.word 0xf93c60c6  ! 4491: STDF_I	std	%f28, [0x00c6, %r17]
	.word 0xb2ad2170  ! 4492: ANDNcc_I	andncc 	%r20, 0x0170, %r25
	.word 0xbc8da147  ! 4496: ANDcc_I	andcc 	%r22, 0x0147, %r30
	.word 0x8594e0f7  ! 4498: WRPR_TSTATE_I	wrpr	%r19, 0x00f7, %tstate
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4252050  ! 4504: STW_I	stw	%r26, [%r20 + 0x0050]
	.word 0x8d94e16e  ! 4505: WRPR_PSTATE_I	wrpr	%r19, 0x016e, %pstate
	setx	0x30123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a156  ! 4516: WRPR_TSTATE_I	wrpr	%r18, 0x0156, %tstate
	.word 0xf2750000  ! 4517: STX_R	stx	%r25, [%r20 + %r0]
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ade1aa  ! 4520: ANDNcc_I	andncc 	%r23, 0x01aa, %r28
	.word 0xf02d203b  ! 4521: STB_I	stb	%r24, [%r20 + 0x003b]
	.word 0xbe04a1f9  ! 4522: ADD_I	add 	%r18, 0x01f9, %r31
	.word 0xb484c000  ! 4525: ADDcc_R	addcc 	%r19, %r0, %r26
	.word 0xfa3de1aa  ! 4526: STD_I	std	%r29, [%r23 + 0x01aa]
	setx	data_start_5, %g1, %r20
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 4531: RDPR_GL	rdpr	%-, %r24
	.word 0xb7510000  ! 4536: RDPR_TICK	<illegal instruction>
	.word 0xfa24e156  ! 4539: STW_I	stw	%r29, [%r19 + 0x0156]
	.word 0xfa34c000  ! 4540: STH_R	sth	%r29, [%r19 + %r0]
	.word 0x9194a162  ! 4543: WRPR_PIL_I	wrpr	%r18, 0x0162, %pil
	.word 0xfe748000  ! 4544: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfb3da166  ! 4548: STDF_I	std	%f29, [0x0166, %r22]
	.word 0xf424a1f8  ! 4552: STW_I	stw	%r26, [%r18 + 0x01f8]
	.word 0xb9480000  ! 4554: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d9520ed  ! 4555: WRPR_PSTATE_I	wrpr	%r20, 0x00ed, %pstate
	.word 0xf635c000  ! 4559: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xbf51c000  ! 4560: RDPR_TL	rdpr	%tl, %r31
	.word 0xf43ca006  ! 4567: STD_I	std	%r26, [%r18 + 0x0006]
	.word 0x8794e1bd  ! 4570: WRPR_TT_I	wrpr	%r19, 0x01bd, %tt
	.word 0xfc3de13a  ! 4574: STD_I	std	%r30, [%r23 + 0x013a]
	.word 0xf82da1aa  ! 4580: STB_I	stb	%r28, [%r22 + 0x01aa]
	.word 0xf6358000  ! 4581: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfe740000  ! 4587: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf02ce1ca  ! 4588: STB_I	stb	%r24, [%r19 + 0x01ca]
	.word 0xf82da074  ! 4592: STB_I	stb	%r28, [%r22 + 0x0074]
	.word 0xb57d0400  ! 4594: MOVR_R	movre	%r20, %r0, %r26
	mov	0, %r12
	.word 0x8f932000  ! 4597: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7504000  ! 4598: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf474c000  ! 4600: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfe3c0000  ! 4602: STD_R	std	%r31, [%r16 + %r0]
	.word 0xfd3cc000  ! 4606: STDF_R	std	%f30, [%r0, %r19]
	setx	0x2001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf874219a  ! 4616: STX_I	stx	%r28, [%r16 + 0x019a]
	.word 0xf02d61af  ! 4617: STB_I	stb	%r24, [%r21 + 0x01af]
	.word 0xf274a17f  ! 4625: STX_I	stx	%r25, [%r18 + 0x017f]
	.word 0xb1351000  ! 4626: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xb1520000  ! 4629: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 4635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xbc852031  ! 4637: ADDcc_I	addcc 	%r20, 0x0031, %r30
	.word 0xbd540000  ! 4638: RDPR_GL	rdpr	%-, %r30
	.word 0xf83d4000  ! 4639: STD_R	std	%r28, [%r21 + %r0]
	.word 0xb9354000  ! 4642: SRL_R	srl 	%r21, %r0, %r28
	.word 0xb750c000  ! 4645: RDPR_TT	<illegal instruction>
	.word 0xba95e199  ! 4647: ORcc_I	orcc 	%r23, 0x0199, %r29
	.word 0xf22c2093  ! 4649: STB_I	stb	%r25, [%r16 + 0x0093]
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2a5c000  ! 4653: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0x859520e6  ! 4663: WRPR_TSTATE_I	wrpr	%r20, 0x00e6, %tstate
	.word 0xb5504000  ! 4665: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xb7643801  ! 4667: MOVcc_I	<illegal instruction>
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 4672: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8394a011  ! 4685: WRPR_TNPC_I	wrpr	%r18, 0x0011, %tnpc
	.word 0xf43dc000  ! 4686: STD_R	std	%r26, [%r23 + %r0]
	.word 0xf42d8000  ! 4688: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf82cc000  ! 4692: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf43c4000  ! 4694: STD_R	std	%r26, [%r17 + %r0]
	.word 0x8d95e14c  ! 4695: WRPR_PSTATE_I	wrpr	%r23, 0x014c, %pstate
	.word 0xf53d2199  ! 4696: STDF_I	std	%f26, [0x0199, %r20]
	.word 0xbf504000  ! 4697: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xfa2d2077  ! 4698: STB_I	stb	%r29, [%r20 + 0x0077]
	.word 0x8195e161  ! 4699: WRPR_TPC_I	wrpr	%r23, 0x0161, %tpc
	.word 0x8995e014  ! 4700: WRPR_TICK_I	wrpr	%r23, 0x0014, %tick
	.word 0xf4258000  ! 4702: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf024e104  ! 4703: STW_I	stw	%r24, [%r19 + 0x0104]
	.word 0xf2258000  ! 4704: STW_R	stw	%r25, [%r22 + %r0]
	.word 0x879521a3  ! 4706: WRPR_TT_I	wrpr	%r20, 0x01a3, %tt
	mov	2, %r14
	.word 0xa193a000  ! 4711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf025e0a0  ! 4713: STW_I	stw	%r24, [%r23 + 0x00a0]
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe9461d4  ! 4716: ORcc_I	orcc 	%r17, 0x01d4, %r31
	.word 0xfe354000  ! 4717: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf8250000  ! 4718: STW_R	stw	%r28, [%r20 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 4720: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d9520f4  ! 4721: WRPR_PSTATE_I	wrpr	%r20, 0x00f4, %pstate
	setx	data_start_4, %g1, %r21
	.word 0xfe74c000  ! 4726: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xfc752054  ! 4729: STX_I	stx	%r30, [%r20 + 0x0054]
	setx	data_start_6, %g1, %r22
	.word 0xfa74a1b6  ! 4734: STX_I	stx	%r29, [%r18 + 0x01b6]
	.word 0xfe24a0d5  ! 4738: STW_I	stw	%r31, [%r18 + 0x00d5]
	.word 0xf034a032  ! 4739: STH_I	sth	%r24, [%r18 + 0x0032]
	.word 0xf43420a3  ! 4742: STH_I	sth	%r26, [%r16 + 0x00a3]
	.word 0xb005a08e  ! 4744: ADD_I	add 	%r22, 0x008e, %r24
	.word 0xb83521fb  ! 4745: SUBC_I	orn 	%r20, 0x01fb, %r28
	.word 0xbe34e162  ! 4748: SUBC_I	orn 	%r19, 0x0162, %r31
	.word 0x89952001  ! 4751: WRPR_TICK_I	wrpr	%r20, 0x0001, %tick
	.word 0xfe342136  ! 4754: STH_I	sth	%r31, [%r16 + 0x0136]
	.word 0x8395e09c  ! 4755: WRPR_TNPC_I	wrpr	%r23, 0x009c, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983ec3  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec3, %hpstate
	.word 0xfa35c000  ! 4764: STH_R	sth	%r29, [%r23 + %r0]
	.word 0x9195604b  ! 4765: WRPR_PIL_I	wrpr	%r21, 0x004b, %pil
	setx	data_start_3, %g1, %r16
	.word 0xb550c000  ! 4769: RDPR_TT	rdpr	%tt, %r26
	.word 0xf03d8000  ! 4772: STD_R	std	%r24, [%r22 + %r0]
	.word 0xbd346001  ! 4781: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xfe35a133  ! 4783: STH_I	sth	%r31, [%r22 + 0x0133]
	.word 0xbf3d7001  ! 4785: SRAX_I	srax	%r21, 0x0001, %r31
	setx	data_start_4, %g1, %r16
	.word 0xf42ca1da  ! 4790: STB_I	stb	%r26, [%r18 + 0x01da]
	.word 0xf4242152  ! 4792: STW_I	stw	%r26, [%r16 + 0x0152]
	.word 0x879560ac  ! 4794: WRPR_TT_I	wrpr	%r21, 0x00ac, %tt
	.word 0xf2348000  ! 4799: STH_R	sth	%r25, [%r18 + %r0]
	setx	data_start_2, %g1, %r16
	.word 0x8594a152  ! 4801: WRPR_TSTATE_I	wrpr	%r18, 0x0152, %tstate
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33c8000  ! 4803: STDF_R	std	%f25, [%r0, %r18]
	.word 0xb72cd000  ! 4804: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xfa2c8000  ! 4806: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xb751c000  ! 4809: RDPR_TL	rdpr	%tl, %r27
	.word 0xbd51c000  ! 4811: RDPR_TL	<illegal instruction>
	.word 0xf874a1da  ! 4815: STX_I	stx	%r28, [%r18 + 0x01da]
	.word 0xfb3c6131  ! 4817: STDF_I	std	%f29, [0x0131, %r17]
	.word 0xfe346069  ! 4818: STH_I	sth	%r31, [%r17 + 0x0069]
	ta	T_CHANGE_HPRIV
	.word 0x8198388b  ! 4823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188b, %hpstate
	.word 0xbc4420bb  ! 4824: ADDC_I	addc 	%r16, 0x00bb, %r30
	.word 0x8395a0e2  ! 4826: WRPR_TNPC_I	wrpr	%r22, 0x00e2, %tnpc
	.word 0xf0244000  ! 4827: STW_R	stw	%r24, [%r17 + %r0]
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63561fb  ! 4832: STH_I	sth	%r27, [%r21 + 0x01fb]
	.word 0xfc3421b5  ! 4833: STH_I	sth	%r30, [%r16 + 0x01b5]
	setx	0x10219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3dc000  ! 4838: STDF_R	std	%f30, [%r0, %r23]
	.word 0xfb3c4000  ! 4839: STDF_R	std	%f29, [%r0, %r17]
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 4842: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfa3561e4  ! 4848: STH_I	sth	%r29, [%r21 + 0x01e4]
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94218c  ! 4851: WRPR_PSTATE_I	wrpr	%r16, 0x018c, %pstate
	.word 0xb024e0a6  ! 4852: SUB_I	sub 	%r19, 0x00a6, %r24
	.word 0xfa754000  ! 4858: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xff3d4000  ! 4859: STDF_R	std	%f31, [%r0, %r21]
	.word 0xf63d0000  ! 4861: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf43da06c  ! 4863: STD_I	std	%r26, [%r22 + 0x006c]
	.word 0xf43d6049  ! 4869: STD_I	std	%r26, [%r21 + 0x0049]
	.word 0xbc95a141  ! 4870: ORcc_I	orcc 	%r22, 0x0141, %r30
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc2561a7  ! 4885: STW_I	stw	%r30, [%r21 + 0x01a7]
	.word 0x9194e1fe  ! 4892: WRPR_PIL_I	wrpr	%r19, 0x01fe, %pil
	.word 0xb751c000  ! 4893: RDPR_TL	rdpr	%tl, %r27
	.word 0xf03de069  ! 4894: STD_I	std	%r24, [%r23 + 0x0069]
	.word 0xb351c000  ! 4895: RDPR_TL	<illegal instruction>
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4350000  ! 4899: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf6258000  ! 4902: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xf834204b  ! 4903: STH_I	sth	%r28, [%r16 + 0x004b]
	.word 0xb68cc000  ! 4907: ANDcc_R	andcc 	%r19, %r0, %r27
	.word 0x8394a0e2  ! 4908: WRPR_TNPC_I	wrpr	%r18, 0x00e2, %tnpc
	.word 0xb9500000  ! 4913: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xf33d2114  ! 4915: STDF_I	std	%f25, [0x0114, %r20]
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8350000  ! 4918: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfc758000  ! 4921: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xb21d210a  ! 4922: XOR_I	xor 	%r20, 0x010a, %r25
	.word 0xf6358000  ! 4923: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf93d4000  ! 4924: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf07560e9  ! 4927: STX_I	stx	%r24, [%r21 + 0x00e9]
	.word 0xb69de070  ! 4928: XORcc_I	xorcc 	%r23, 0x0070, %r27
	.word 0xf43c602a  ! 4930: STD_I	std	%r26, [%r17 + 0x002a]
	.word 0xfd3c61c9  ! 4931: STDF_I	std	%f30, [0x01c9, %r17]
	.word 0x859520a2  ! 4936: WRPR_TSTATE_I	wrpr	%r20, 0x00a2, %tstate
	.word 0xff3cc000  ! 4938: STDF_R	std	%f31, [%r0, %r19]
	mov	0, %r12
	.word 0x8f932000  ! 4946: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983edb  ! 4947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1edb, %hpstate
	.word 0x8d95e14d  ! 4950: WRPR_PSTATE_I	wrpr	%r23, 0x014d, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe24e05b  ! 4952: STW_I	stw	%r31, [%r19 + 0x005b]
	setx	data_start_3, %g1, %r16
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 4957: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xfe34a157  ! 4958: STH_I	sth	%r31, [%r18 + 0x0157]
	.word 0xf22dc000  ! 4961: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf0242132  ! 4963: STW_I	stw	%r24, [%r16 + 0x0132]
	.word 0xfa240000  ! 4964: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xfe3d4000  ! 4965: STD_R	std	%r31, [%r21 + %r0]
	.word 0xb5354000  ! 4968: SRL_R	srl 	%r21, %r0, %r26
	.word 0xf42ca191  ! 4971: STB_I	stb	%r26, [%r18 + 0x0191]
	.word 0x8995609f  ! 4973: WRPR_TICK_I	wrpr	%r21, 0x009f, %tick
	.word 0xb415c000  ! 4976: OR_R	or 	%r23, %r0, %r26
	.word 0xbe946171  ! 4979: ORcc_I	orcc 	%r17, 0x0171, %r31
	.word 0xb2c5210a  ! 4980: ADDCcc_I	addccc 	%r20, 0x010a, %r25
	.word 0xbd35d000  ! 4983: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xfe35a140  ! 4986: STH_I	sth	%r31, [%r22 + 0x0140]
	.word 0xb9520000  ! 4988: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfe24a096  ! 4990: STW_I	stw	%r31, [%r18 + 0x0096]
	.word 0xfa24219b  ! 4991: STW_I	stw	%r29, [%r16 + 0x019b]
	.word 0xff3c20eb  ! 4992: STDF_I	std	%f31, [0x00eb, %r16]
	.word 0xf22c8000  ! 4993: STB_R	stb	%r25, [%r18 + %r0]
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 4997: RDPR_TSTATE	<illegal instruction>
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
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3ca001  ! 5: SRA_I	sra 	%r18, 0x0001, %r30
	.word 0xf85c4000  ! 10: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf415a071  ! 12: LDUH_I	lduh	[%r22 + 0x0071], %r26
	.word 0xf8040000  ! 13: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf65c6108  ! 14: LDX_I	ldx	[%r17 + 0x0108], %r27
	.word 0xb3508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0xfc44e15a  ! 17: LDSW_I	ldsw	[%r19 + 0x015a], %r30
	.word 0xfe452086  ! 21: LDSW_I	ldsw	[%r20 + 0x0086], %r31
	.word 0xb3504000  ! 25: RDPR_TNPC	<illegal instruction>
	.word 0xf65dc000  ! 26: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf6450000  ! 31: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf004606d  ! 35: LDUW_I	lduw	[%r17 + 0x006d], %r24
	.word 0xfe1d0000  ! 36: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0xf44dc000  ! 39: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xb73da001  ! 40: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xf20d21d0  ! 41: LDUB_I	ldub	[%r20 + 0x01d0], %r25
	.word 0xfe4ce137  ! 48: LDSB_I	ldsb	[%r19 + 0x0137], %r31
	.word 0xf004a121  ! 50: LDUW_I	lduw	[%r18 + 0x0121], %r24
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa45a0ce  ! 52: LDSW_I	ldsw	[%r22 + 0x00ce], %r29
	.word 0xb815a065  ! 54: OR_I	or 	%r22, 0x0065, %r28
	.word 0x899561e6  ! 61: WRPR_TICK_I	wrpr	%r21, 0x01e6, %tick
	.word 0xfc45c000  ! 64: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf044e0fb  ! 65: LDSW_I	ldsw	[%r19 + 0x00fb], %r24
	.word 0xf20dc000  ! 72: LDUB_R	ldub	[%r23 + %r0], %r25
	setx	data_start_7, %g1, %r20
	.word 0xf454c000  ! 78: LDSH_R	ldsh	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982f91  ! 84: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f91, %hpstate
	.word 0xf25c61b1  ! 85: LDX_I	ldx	[%r17 + 0x01b1], %r25
	.word 0xf615e02d  ! 87: LDUH_I	lduh	[%r23 + 0x002d], %r27
	.word 0xb3508000  ! 88: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a05f  ! 94: WRPR_TSTATE_I	wrpr	%r22, 0x005f, %tstate
	.word 0x91946090  ! 97: WRPR_PIL_I	wrpr	%r17, 0x0090, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf60c4000  ! 107: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfe14a0f4  ! 108: LDUH_I	lduh	[%r18 + 0x00f4], %r31
	.word 0xb9344000  ! 111: SRL_R	srl 	%r17, %r0, %r28
	setx	data_start_7, %g1, %r17
	.word 0x9195607a  ! 113: WRPR_PIL_I	wrpr	%r21, 0x007a, %pil
	.word 0xf71ca03d  ! 114: LDDF_I	ldd	[%r18, 0x003d], %f27
	.word 0xf2442092  ! 123: LDSW_I	ldsw	[%r16 + 0x0092], %r25
	.word 0xf0056090  ! 124: LDUW_I	lduw	[%r21 + 0x0090], %r24
	.word 0xf00dc000  ! 125: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xb951c000  ! 128: RDPR_TL	<illegal instruction>
	.word 0xb73dd000  ! 134: SRAX_R	srax	%r23, %r0, %r27
	.word 0xf61cc000  ! 137: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xf05ce0e8  ! 138: LDX_I	ldx	[%r19 + 0x00e8], %r24
	.word 0xfb1c6054  ! 139: LDDF_I	ldd	[%r17, 0x0054], %f29
	.word 0xf0450000  ! 141: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xf25da059  ! 143: LDX_I	ldx	[%r22 + 0x0059], %r25
	.word 0xfa1de128  ! 145: LDD_I	ldd	[%r23 + 0x0128], %r29
	.word 0xf05d0000  ! 148: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xb88ca007  ! 150: ANDcc_I	andcc 	%r18, 0x0007, %r28
	.word 0xf80c61b9  ! 151: LDUB_I	ldub	[%r17 + 0x01b9], %r28
	.word 0x8595e162  ! 152: WRPR_TSTATE_I	wrpr	%r23, 0x0162, %tstate
	.word 0xb750c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0x9194e12f  ! 160: WRPR_PIL_I	wrpr	%r19, 0x012f, %pil
	.word 0xb37d8400  ! 162: MOVR_R	movre	%r22, %r0, %r25
	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe05c000  ! 168: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xb9518000  ! 172: RDPR_PSTATE	rdpr	%pstate, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982e8b  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983d89  ! 174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d89, %hpstate
	.word 0xf01d4000  ! 175: LDD_R	ldd	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf91d4000  ! 180: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0x8d9421cb  ! 181: WRPR_PSTATE_I	wrpr	%r16, 0x01cb, %pstate
	.word 0xb4b4e177  ! 182: SUBCcc_I	orncc 	%r19, 0x0177, %r26
	.word 0xfd1ce0d3  ! 183: LDDF_I	ldd	[%r19, 0x00d3], %f30
	.word 0xb9480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6554000  ! 186: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xf804c000  ! 190: LDUW_R	lduw	[%r19 + %r0], %r28
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4ce0a0  ! 192: LDSB_I	ldsb	[%r19 + 0x00a0], %r30
	.word 0xfa44618e  ! 194: LDSW_I	ldsw	[%r17 + 0x018e], %r29
	.word 0x8395e0b2  ! 195: WRPR_TNPC_I	wrpr	%r23, 0x00b2, %tnpc
	.word 0xfc0c2068  ! 196: LDUB_I	ldub	[%r16 + 0x0068], %r30
	.word 0x9195e108  ! 198: WRPR_PIL_I	wrpr	%r23, 0x0108, %pil
	.word 0xf414c000  ! 199: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xf05de154  ! 200: LDX_I	ldx	[%r23 + 0x0154], %r24
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1dc000  ! 205: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xb550c000  ! 206: RDPR_TT	<illegal instruction>
	.word 0xf45ca0cf  ! 211: LDX_I	ldx	[%r18 + 0x00cf], %r26
	mov	1, %r14
	.word 0xa193a000  ! 212: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc154000  ! 213: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf8152040  ! 216: LDUH_I	lduh	[%r20 + 0x0040], %r28
	.word 0xfc454000  ! 219: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xf0450000  ! 220: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xb3520000  ! 222: RDPR_PIL	<illegal instruction>
	.word 0xfe544000  ! 224: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf01dc000  ! 227: LDD_R	ldd	[%r23 + %r0], %r24
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d53  ! 230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d53, %hpstate
	.word 0xfc1d8000  ! 232: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xf84cc000  ! 233: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xb7520000  ! 234: RDPR_PIL	<illegal instruction>
	.word 0xfa1dc000  ! 235: LDD_R	ldd	[%r23 + %r0], %r29
	setx	data_start_5, %g1, %r23
	.word 0x91956076  ! 239: WRPR_PIL_I	wrpr	%r21, 0x0076, %pil
	.word 0xf21da07c  ! 240: LDD_I	ldd	[%r22 + 0x007c], %r25
	.word 0x89956147  ! 243: WRPR_TICK_I	wrpr	%r21, 0x0147, %tick
	.word 0xfe150000  ! 250: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xb2ade006  ! 251: ANDNcc_I	andncc 	%r23, 0x0006, %r25
	.word 0xfb1d601a  ! 255: LDDF_I	ldd	[%r21, 0x001a], %f29
	.word 0x839460eb  ! 261: WRPR_TNPC_I	wrpr	%r17, 0x00eb, %tnpc
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8150000  ! 264: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xb73c1000  ! 265: SRAX_R	srax	%r16, %r0, %r27
	.word 0xb8b48000  ! 266: SUBCcc_R	orncc 	%r18, %r0, %r28
	.word 0x87956036  ! 268: WRPR_TT_I	wrpr	%r21, 0x0036, %tt
	.word 0xfc158000  ! 275: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xfa154000  ! 279: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf2148000  ! 280: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xfc0521ea  ! 282: LDUW_I	lduw	[%r20 + 0x01ea], %r30
	setx	data_start_7, %g1, %r16
	.word 0xbb2d2001  ! 292: SLL_I	sll 	%r20, 0x0001, %r29
	.word 0xfa154000  ! 294: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xb3510000  ! 295: RDPR_TICK	<illegal instruction>
	.word 0xb92c1000  ! 296: SLLX_R	sllx	%r16, %r0, %r28
	.word 0xf04dc000  ! 299: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xb234611a  ! 301: SUBC_I	orn 	%r17, 0x011a, %r25
	.word 0x8995e0af  ! 306: WRPR_TICK_I	wrpr	%r23, 0x00af, %tick
	.word 0xb9540000  ! 310: RDPR_GL	rdpr	%-, %r28
	.word 0xf40d20db  ! 311: LDUB_I	ldub	[%r20 + 0x00db], %r26
	.word 0xfc1d8000  ! 312: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xbd3c5000  ! 313: SRAX_R	srax	%r17, %r0, %r30
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf855216a  ! 319: LDSH_I	ldsh	[%r20 + 0x016a], %r28
	.word 0xfa454000  ! 322: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xfc150000  ! 323: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf85cc000  ! 324: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xb5351000  ! 325: SRLX_R	srlx	%r20, %r0, %r26
	.word 0xb6b42024  ! 326: ORNcc_I	orncc 	%r16, 0x0024, %r27
	.word 0xff1dc000  ! 331: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xfc440000  ! 332: LDSW_R	ldsw	[%r16 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b11  ! 333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b11, %hpstate
	.word 0xb6442109  ! 335: ADDC_I	addc 	%r16, 0x0109, %r27
	.word 0xb53d1000  ! 337: SRAX_R	srax	%r20, %r0, %r26
	setx	data_start_6, %g1, %r20
	.word 0xfd1c211f  ! 344: LDDF_I	ldd	[%r16, 0x011f], %f30
	.word 0xfc152129  ! 345: LDUH_I	lduh	[%r20 + 0x0129], %r30
	.word 0xfc45a0dd  ! 347: LDSW_I	ldsw	[%r22 + 0x00dd], %r30
	.word 0xf11dc000  ! 348: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xfc14a0dd  ! 349: LDUH_I	lduh	[%r18 + 0x00dd], %r30
	.word 0xb750c000  ! 350: RDPR_TT	<illegal instruction>
	.word 0xb1480000  ! 353: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_3, %g1, %r18
	.word 0xb81521f8  ! 357: OR_I	or 	%r20, 0x01f8, %r28
	.word 0xf8058000  ! 359: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xf41da02b  ! 367: LDD_I	ldd	[%r22 + 0x002b], %r26
	.word 0x8194e046  ! 368: WRPR_TPC_I	wrpr	%r19, 0x0046, %tpc
	.word 0xbf518000  ! 370: RDPR_PSTATE	<illegal instruction>
	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995207d  ! 372: WRPR_TICK_I	wrpr	%r20, 0x007d, %tick
	.word 0xb1504000  ! 377: RDPR_TNPC	<illegal instruction>
	.word 0xfc1520e6  ! 378: LDUH_I	lduh	[%r20 + 0x00e6], %r30
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5d8000  ! 382: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xfa0d21e0  ! 383: LDUB_I	ldub	[%r20 + 0x01e0], %r29
	.word 0xfc0d2050  ! 386: LDUB_I	ldub	[%r20 + 0x0050], %r30
	.word 0xbd7cc400  ! 392: MOVR_R	movre	%r19, %r0, %r30
	.word 0xf51c8000  ! 395: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xf2540000  ! 396: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xf11c20e3  ! 399: LDDF_I	ldd	[%r16, 0x00e3], %f24
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82c2149  ! 403: ANDN_I	andn 	%r16, 0x0149, %r28
	.word 0xf45c6181  ! 405: LDX_I	ldx	[%r17 + 0x0181], %r26
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952180  ! 418: WRPR_PSTATE_I	wrpr	%r20, 0x0180, %pstate
	.word 0xf8044000  ! 421: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xbb2de001  ! 422: SLL_I	sll 	%r23, 0x0001, %r29
	.word 0x85942144  ! 427: WRPR_TSTATE_I	wrpr	%r16, 0x0144, %tstate
	.word 0xf8150000  ! 431: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xb93cc000  ! 436: SRA_R	sra 	%r19, %r0, %r28
	.word 0xf81cc000  ! 441: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xb20da0ee  ! 442: AND_I	and 	%r22, 0x00ee, %r25
	.word 0xb224c000  ! 445: SUB_R	sub 	%r19, %r0, %r25
	.word 0xb89d2118  ! 446: XORcc_I	xorcc 	%r20, 0x0118, %r28
	.word 0xbe454000  ! 447: ADDC_R	addc 	%r21, %r0, %r31
	.word 0xb21ce114  ! 451: XOR_I	xor 	%r19, 0x0114, %r25
	.word 0xb7540000  ! 452: RDPR_GL	<illegal instruction>
	.word 0xbd508000  ! 454: RDPR_TSTATE	<illegal instruction>
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e047  ! 457: WRPR_TT_I	wrpr	%r23, 0x0047, %tt
	.word 0xb3540000  ! 460: RDPR_GL	<illegal instruction>
	.word 0xfc0dc000  ! 462: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xf84c0000  ! 463: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb3540000  ! 465: RDPR_GL	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 467: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xff1cc000  ! 468: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xfe058000  ! 471: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf8542159  ! 474: LDSH_I	ldsh	[%r16 + 0x0159], %r28
	.word 0xfe454000  ! 476: LDSW_R	ldsw	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d0b  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0b, %hpstate
	.word 0xbc054000  ! 482: ADD_R	add 	%r21, %r0, %r30
	.word 0xbb504000  ! 484: RDPR_TNPC	<illegal instruction>
	.word 0xf804e1a9  ! 488: LDUW_I	lduw	[%r19 + 0x01a9], %r28
	.word 0x87942053  ! 489: WRPR_TT_I	wrpr	%r16, 0x0053, %tt
	.word 0xb8252162  ! 491: SUB_I	sub 	%r20, 0x0162, %r28
	.word 0xfa0de101  ! 494: LDUB_I	ldub	[%r23 + 0x0101], %r29
	setx	0x204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a0be  ! 496: WRPR_TT_I	wrpr	%r22, 0x00be, %tt
	.word 0xbb35b001  ! 497: SRLX_I	srlx	%r22, 0x0001, %r29
	.word 0xfe5d8000  ! 500: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xfe448000  ! 502: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0x9194e0a6  ! 503: WRPR_PIL_I	wrpr	%r19, 0x00a6, %pil
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31c0000  ! 506: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xfe1c60b4  ! 507: LDD_I	ldd	[%r17 + 0x00b4], %r31
	.word 0xb72d7001  ! 508: SLLX_I	sllx	%r21, 0x0001, %r27
	.word 0xf65da0ca  ! 509: LDX_I	ldx	[%r22 + 0x00ca], %r27
	.word 0xf205c000  ! 513: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf05c2137  ! 515: LDX_I	ldx	[%r16 + 0x0137], %r24
	.word 0xb3540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xf44de102  ! 519: LDSB_I	ldsb	[%r23 + 0x0102], %r26
	setx	0x3000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f5b  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	.word 0xf0546155  ! 526: LDSH_I	ldsh	[%r17 + 0x0155], %r24
	.word 0x899420b1  ! 527: WRPR_TICK_I	wrpr	%r16, 0x00b1, %tick
	.word 0xb93c0000  ! 529: SRA_R	sra 	%r16, %r0, %r28
	.word 0xfe444000  ! 533: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf6556110  ! 534: LDSH_I	ldsh	[%r21 + 0x0110], %r27
	.word 0xb33ca001  ! 535: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xf615e1b3  ! 536: LDUH_I	lduh	[%r23 + 0x01b3], %r27
	.word 0xf05da11d  ! 537: LDX_I	ldx	[%r22 + 0x011d], %r24
	.word 0xf24da159  ! 538: LDSB_I	ldsb	[%r22 + 0x0159], %r25
	.word 0xfc1c2197  ! 540: LDD_I	ldd	[%r16 + 0x0197], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 543: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf64de0db  ! 544: LDSB_I	ldsb	[%r23 + 0x00db], %r27
	.word 0xb6448000  ! 546: ADDC_R	addc 	%r18, %r0, %r27
	.word 0xf24dc000  ! 547: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf01c605d  ! 549: LDD_I	ldd	[%r17 + 0x005d], %r24
	.word 0xf415a0ab  ! 550: LDUH_I	lduh	[%r22 + 0x00ab], %r26
	.word 0x8d952058  ! 555: WRPR_PSTATE_I	wrpr	%r20, 0x0058, %pstate
	.word 0xfe5520b9  ! 557: LDSH_I	ldsh	[%r20 + 0x00b9], %r31
	.word 0xf91c8000  ! 558: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xf4548000  ! 559: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfc1c609e  ! 560: LDD_I	ldd	[%r17 + 0x009e], %r30
	.word 0xb751c000  ! 561: RDPR_TL	<illegal instruction>
	.word 0xf41ce03c  ! 562: LDD_I	ldd	[%r19 + 0x003c], %r26
	.word 0xf51de0e4  ! 563: LDDF_I	ldd	[%r23, 0x00e4], %f26
	.word 0x919521a6  ! 565: WRPR_PIL_I	wrpr	%r20, 0x01a6, %pil
	.word 0xf254610b  ! 568: LDSH_I	ldsh	[%r17 + 0x010b], %r25
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d207b  ! 571: LDSB_I	ldsb	[%r20 + 0x007b], %r31
	.word 0xbd510000  ! 574: RDPR_TICK	rdpr	%tick, %r30
	.word 0xb444e10d  ! 578: ADDC_I	addc 	%r19, 0x010d, %r26
	.word 0xbd50c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xfc040000  ! 580: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xb444c000  ! 582: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xf8448000  ! 585: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xb1500000  ! 586: RDPR_TPC	<illegal instruction>
	setx	0x30203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946057  ! 601: WRPR_PIL_I	wrpr	%r17, 0x0057, %pil
	.word 0xf6452040  ! 605: LDSW_I	ldsw	[%r20 + 0x0040], %r27
	.word 0xfa0d0000  ! 612: LDUB_R	ldub	[%r20 + %r0], %r29
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e1d5  ! 615: WRPR_PSTATE_I	wrpr	%r23, 0x01d5, %pstate
	.word 0xfa4d8000  ! 616: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf0158000  ! 617: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf24520e1  ! 621: LDSW_I	ldsw	[%r20 + 0x00e1], %r25
	.word 0xf04d60a2  ! 624: LDSB_I	ldsb	[%r21 + 0x00a2], %r24
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b11  ! 631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b11, %hpstate
	setx	data_start_2, %g1, %r19
	.word 0xf80d4000  ! 641: LDUB_R	ldub	[%r21 + %r0], %r28
	setx	0x205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 646: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf8040000  ! 649: LDUW_R	lduw	[%r16 + %r0], %r28
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc45e0c0  ! 653: LDSW_I	ldsw	[%r23 + 0x00c0], %r30
	.word 0xf25561d0  ! 654: LDSH_I	ldsh	[%r21 + 0x01d0], %r25
	.word 0xfe148000  ! 656: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf61d4000  ! 662: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xfc158000  ! 664: LDUH_R	lduh	[%r22 + %r0], %r30
	mov	0, %r12
	.word 0x8f932000  ! 667: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba450000  ! 670: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xfc14c000  ! 673: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xf05c8000  ! 674: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0x8194615b  ! 676: WRPR_TPC_I	wrpr	%r17, 0x015b, %tpc
	.word 0xfc1d61e6  ! 678: LDD_I	ldd	[%r21 + 0x01e6], %r30
	.word 0xf24d4000  ! 679: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xba0d4000  ! 682: AND_R	and 	%r21, %r0, %r29
	.word 0xfa55c000  ! 687: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf20c8000  ! 688: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0x8995a158  ! 689: WRPR_TICK_I	wrpr	%r22, 0x0158, %tick
	.word 0xf51d4000  ! 690: LDDF_R	ldd	[%r21, %r0], %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983a03  ! 691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a03, %hpstate
	.word 0xb1520000  ! 692: RDPR_PIL	<illegal instruction>
	.word 0xb8940000  ! 693: ORcc_R	orcc 	%r16, %r0, %r28
	.word 0xf0458000  ! 696: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0x8d94214a  ! 701: WRPR_PSTATE_I	wrpr	%r16, 0x014a, %pstate
	.word 0xbf3d4000  ! 705: SRA_R	sra 	%r21, %r0, %r31
	.word 0xfe15e172  ! 707: LDUH_I	lduh	[%r23 + 0x0172], %r31
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd343001  ! 712: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xf6040000  ! 713: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf0446142  ! 717: LDSW_I	ldsw	[%r17 + 0x0142], %r24
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394200a  ! 722: WRPR_TNPC_I	wrpr	%r16, 0x000a, %tnpc
	.word 0xb7540000  ! 723: RDPR_GL	rdpr	%-, %r27
	.word 0xfc14603f  ! 725: LDUH_I	lduh	[%r17 + 0x003f], %r30
	.word 0xfe4d8000  ! 727: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xb1508000  ! 731: RDPR_TSTATE	<illegal instruction>
	.word 0xb084210d  ! 734: ADDcc_I	addcc 	%r16, 0x010d, %r24
	.word 0xf44d4000  ! 735: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xbf500000  ! 736: RDPR_TPC	<illegal instruction>
	.word 0xf0544000  ! 738: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0x8995e1fd  ! 746: WRPR_TICK_I	wrpr	%r23, 0x01fd, %tick
	.word 0xf45d6043  ! 747: LDX_I	ldx	[%r21 + 0x0043], %r26
	.word 0xff1c4000  ! 753: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0x8794e0b9  ! 759: WRPR_TT_I	wrpr	%r19, 0x00b9, %tt
	.word 0xb1508000  ! 765: RDPR_TSTATE	<illegal instruction>
	.word 0xb435a0cc  ! 769: ORN_I	orn 	%r22, 0x00cc, %r26
	.word 0x8394a0c1  ! 770: WRPR_TNPC_I	wrpr	%r18, 0x00c1, %tnpc
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3ce001  ! 776: SRA_I	sra 	%r19, 0x0001, %r29
	mov	1, %r14
	.word 0xa193a000  ! 777: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf0044000  ! 779: LDUW_R	lduw	[%r17 + %r0], %r24
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6050000  ! 784: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xf24c8000  ! 785: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xb3508000  ! 786: RDPR_TSTATE	<illegal instruction>
	.word 0xb5520000  ! 788: RDPR_PIL	<illegal instruction>
	.word 0x8994e125  ! 789: WRPR_TICK_I	wrpr	%r19, 0x0125, %tick
	.word 0xf04ce053  ! 792: LDSB_I	ldsb	[%r19 + 0x0053], %r24
	.word 0xf04d4000  ! 794: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf84c8000  ! 796: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xb23d8000  ! 797: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xf24d617d  ! 802: LDSB_I	ldsb	[%r21 + 0x017d], %r25
	.word 0xfe15a111  ! 803: LDUH_I	lduh	[%r22 + 0x0111], %r31
	.word 0xb1520000  ! 804: RDPR_PIL	rdpr	%pil, %r24
	.word 0x87956130  ! 810: WRPR_TT_I	wrpr	%r21, 0x0130, %tt
	.word 0xb01cc000  ! 813: XOR_R	xor 	%r19, %r0, %r24
	.word 0xf8054000  ! 816: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xfd1c4000  ! 820: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xbcace1a2  ! 825: ANDNcc_I	andncc 	%r19, 0x01a2, %r30
	.word 0xfa550000  ! 826: LDSH_R	ldsh	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xfa058000  ! 830: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xf51c6175  ! 835: LDDF_I	ldd	[%r17, 0x0175], %f26
	.word 0xbd344000  ! 837: SRL_R	srl 	%r17, %r0, %r30
	.word 0xf64de0dd  ! 838: LDSB_I	ldsb	[%r23 + 0x00dd], %r27
	.word 0xf254a1ef  ! 839: LDSH_I	ldsh	[%r18 + 0x01ef], %r25
	.word 0xb085c000  ! 840: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xf21d2060  ! 841: LDD_I	ldd	[%r20 + 0x0060], %r25
	.word 0xf00d8000  ! 842: LDUB_R	ldub	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982ed9  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed9, %hpstate
	.word 0xf24c4000  ! 844: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf404200d  ! 845: LDUW_I	lduw	[%r16 + 0x000d], %r26
	.word 0xfc1d61bd  ! 846: LDD_I	ldd	[%r21 + 0x01bd], %r30
	.word 0xf41d0000  ! 848: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xb73d0000  ! 853: SRA_R	sra 	%r20, %r0, %r27
	.word 0xf85c4000  ! 854: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf31ce068  ! 856: LDDF_I	ldd	[%r19, 0x0068], %f25
	.word 0xf85da122  ! 857: LDX_I	ldx	[%r22 + 0x0122], %r28
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 864: RDPR_GL	<illegal instruction>
	setx	0x30332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6148000  ! 868: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xf45d21b6  ! 871: LDX_I	ldx	[%r20 + 0x01b6], %r26
	.word 0x8995e1b2  ! 874: WRPR_TICK_I	wrpr	%r23, 0x01b2, %tick
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd518000  ! 878: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f13  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f13, %hpstate
	.word 0x8594e04c  ! 883: WRPR_TSTATE_I	wrpr	%r19, 0x004c, %tstate
	.word 0xf2142052  ! 884: LDUH_I	lduh	[%r16 + 0x0052], %r25
	.word 0xb9504000  ! 886: RDPR_TNPC	<illegal instruction>
	setx	0x327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65c4000  ! 894: LDX_R	ldx	[%r17 + %r0], %r27
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2044000  ! 896: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xbd500000  ! 901: RDPR_TPC	<illegal instruction>
	.word 0xf11d0000  ! 903: LDDF_R	ldd	[%r20, %r0], %f24
	.word 0x8194a10c  ! 904: WRPR_TPC_I	wrpr	%r18, 0x010c, %tpc
	.word 0xfc1c8000  ! 905: LDD_R	ldd	[%r18 + %r0], %r30
	mov	2, %r14
	.word 0xa193a000  ! 906: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8794206e  ! 912: WRPR_TT_I	wrpr	%r16, 0x006e, %tt
	.word 0x8594e1d8  ! 917: WRPR_TSTATE_I	wrpr	%r19, 0x01d8, %tstate
	.word 0xbb50c000  ! 921: RDPR_TT	rdpr	%tt, %r29
	.word 0xb3510000  ! 923: RDPR_TICK	<illegal instruction>
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb024211e  ! 931: SUB_I	sub 	%r16, 0x011e, %r24
	.word 0xb550c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0xb00c8000  ! 934: AND_R	and 	%r18, %r0, %r24
	.word 0xb8b50000  ! 935: ORNcc_R	orncc 	%r20, %r0, %r28
	.word 0xf014c000  ! 937: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xb20561c2  ! 938: ADD_I	add 	%r21, 0x01c2, %r25
	.word 0xb02421e1  ! 939: SUB_I	sub 	%r16, 0x01e1, %r24
	.word 0xb9540000  ! 940: RDPR_GL	<illegal instruction>
	.word 0xfc4d8000  ! 941: LDSB_R	ldsb	[%r22 + %r0], %r30
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24dc000  ! 945: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xb72ca001  ! 950: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xbc1c2030  ! 952: XOR_I	xor 	%r16, 0x0030, %r30
	.word 0xf51da0bd  ! 954: LDDF_I	ldd	[%r22, 0x00bd], %f26
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 956: RDPR_GL	<illegal instruction>
	.word 0xfe5d0000  ! 957: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xf84d0000  ! 958: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xb285a105  ! 959: ADDcc_I	addcc 	%r22, 0x0105, %r25
	mov	1, %r14
	.word 0xa193a000  ! 964: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf05dc000  ! 967: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xb8054000  ! 971: ADD_R	add 	%r21, %r0, %r28
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e105  ! 974: WRPR_TICK_I	wrpr	%r19, 0x0105, %tick
	.word 0xf61d60db  ! 977: LDD_I	ldd	[%r21 + 0x00db], %r27
	.word 0xfc0c0000  ! 979: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xb834a012  ! 981: SUBC_I	orn 	%r18, 0x0012, %r28
	.word 0x8194a0cc  ! 982: WRPR_TPC_I	wrpr	%r18, 0x00cc, %tpc
	.word 0x8394e0ad  ! 983: WRPR_TNPC_I	wrpr	%r19, 0x00ad, %tnpc
	.word 0xf6544000  ! 984: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xf45ce083  ! 985: LDX_I	ldx	[%r19 + 0x0083], %r26
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 988: MOVcc_R	<illegal instruction>
	.word 0x8394a15e  ! 991: WRPR_TNPC_I	wrpr	%r18, 0x015e, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983859  ! 994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1859, %hpstate
	.word 0xfa0c4000  ! 996: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xb5510000  ! 999: RDPR_TICK	<illegal instruction>
	.word 0xf404c000  ! 1000: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xbb480000  ! 1001: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf24561b9  ! 1002: LDSW_I	ldsw	[%r21 + 0x01b9], %r25
	.word 0x8d94a10c  ! 1004: WRPR_PSTATE_I	wrpr	%r18, 0x010c, %pstate
	.word 0xf01d2148  ! 1005: LDD_I	ldd	[%r20 + 0x0148], %r24
	.word 0xf51d4000  ! 1012: LDDF_R	ldd	[%r21, %r0], %f26
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44dc000  ! 1019: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xfa444000  ! 1020: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xfc554000  ! 1023: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xb7348000  ! 1026: SRL_R	srl 	%r18, %r0, %r27
	.word 0xf41c4000  ! 1027: LDD_R	ldd	[%r17 + %r0], %r26
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20c4000  ! 1029: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xfa5c8000  ! 1032: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfa1c209b  ! 1033: LDD_I	ldd	[%r16 + 0x009b], %r29
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe44a0f7  ! 1037: LDSW_I	ldsw	[%r18 + 0x00f7], %r31
	.word 0xfd1ca1a1  ! 1045: LDDF_I	ldd	[%r18, 0x01a1], %f30
	.word 0x8194a07a  ! 1046: WRPR_TPC_I	wrpr	%r18, 0x007a, %tpc
	.word 0xfc1ca005  ! 1049: LDD_I	ldd	[%r18 + 0x0005], %r30
	.word 0xb234e073  ! 1055: ORN_I	orn 	%r19, 0x0073, %r25
	.word 0xb5518000  ! 1057: RDPR_PSTATE	<illegal instruction>
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04dc000  ! 1059: LDSB_R	ldsb	[%r23 + %r0], %r24
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2448000  ! 1061: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xf044a0e2  ! 1067: LDSW_I	ldsw	[%r18 + 0x00e2], %r24
	setx	0x1002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc050000  ! 1072: ADD_R	add 	%r20, %r0, %r30
	.word 0xfa144000  ! 1074: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xfc544000  ! 1075: LDSH_R	ldsh	[%r17 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 1079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0e2  ! 1081: WRPR_PSTATE_I	wrpr	%r18, 0x00e2, %pstate
	.word 0xfc4c8000  ! 1083: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf84c0000  ! 1085: LDSB_R	ldsb	[%r16 + %r0], %r28
	setx	0x2020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839560c0  ! 1089: WRPR_TNPC_I	wrpr	%r21, 0x00c0, %tnpc
	.word 0xfe040000  ! 1093: LDUW_R	lduw	[%r16 + %r0], %r31
	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84da0fb  ! 1097: LDSB_I	ldsb	[%r22 + 0x00fb], %r28
	setx	0x2001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0dc000  ! 1104: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xbf51c000  ! 1105: RDPR_TL	<illegal instruction>
	.word 0xfc14e162  ! 1107: LDUH_I	lduh	[%r19 + 0x0162], %r30
	.word 0xf205c000  ! 1108: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xb151c000  ! 1109: RDPR_TL	<illegal instruction>
	.word 0x8d952037  ! 1112: WRPR_PSTATE_I	wrpr	%r20, 0x0037, %pstate
	.word 0x839421fe  ! 1115: WRPR_TNPC_I	wrpr	%r16, 0x01fe, %tnpc
	.word 0xbc344000  ! 1117: ORN_R	orn 	%r17, %r0, %r30
	.word 0xfb1d60dc  ! 1118: LDDF_I	ldd	[%r21, 0x00dc], %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982e51  ! 1121: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e51, %hpstate
	.word 0xf60c8000  ! 1126: LDUB_R	ldub	[%r18 + %r0], %r27
	setx	0x30105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e0ce  ! 1130: WRPR_TNPC_I	wrpr	%r19, 0x00ce, %tnpc
	.word 0x89952039  ! 1135: WRPR_TICK_I	wrpr	%r20, 0x0039, %tick
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 1141: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf24da1d4  ! 1142: LDSB_I	ldsb	[%r22 + 0x01d4], %r25
	.word 0xf45d0000  ! 1145: LDX_R	ldx	[%r20 + %r0], %r26
	setx	data_start_7, %g1, %r16
	.word 0xf85d8000  ! 1148: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xb1518000  ! 1149: RDPR_PSTATE	<illegal instruction>
	.word 0xbb480000  ! 1153: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb20d4000  ! 1154: AND_R	and 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb13c5000  ! 1157: SRAX_R	srax	%r17, %r0, %r24
	.word 0xf644e148  ! 1159: LDSW_I	ldsw	[%r19 + 0x0148], %r27
	mov	2, %r14
	.word 0xa193a000  ! 1160: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7480000  ! 1168: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfa55c000  ! 1175: LDSH_R	ldsh	[%r23 + %r0], %r29
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 1183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	.word 0xf01da147  ! 1184: LDD_I	ldd	[%r22 + 0x0147], %r24
	.word 0xb52c2001  ! 1185: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xfe55c000  ! 1186: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xf80d8000  ! 1190: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xf0558000  ! 1191: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xb8a48000  ! 1192: SUBcc_R	subcc 	%r18, %r0, %r28
	.word 0xf01da0d7  ! 1199: LDD_I	ldd	[%r22 + 0x00d7], %r24
	.word 0xb3518000  ! 1201: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r19
	.word 0xf2050000  ! 1210: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xf04dc000  ! 1212: LDSB_R	ldsb	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983a99  ! 1215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a99, %hpstate
	.word 0xf21c61f4  ! 1218: LDD_I	ldd	[%r17 + 0x01f4], %r25
	.word 0xf655211d  ! 1220: LDSH_I	ldsh	[%r20 + 0x011d], %r27
	.word 0x8594a086  ! 1224: WRPR_TSTATE_I	wrpr	%r18, 0x0086, %tstate
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982fd3  ! 1229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	.word 0xb2158000  ! 1231: OR_R	or 	%r22, %r0, %r25
	.word 0xfe1d4000  ! 1233: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xf0154000  ! 1236: LDUH_R	lduh	[%r21 + %r0], %r24
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2b4e0bc  ! 1238: ORNcc_I	orncc 	%r19, 0x00bc, %r25
	.word 0xfa0ce0cc  ! 1242: LDUB_I	ldub	[%r19 + 0x00cc], %r29
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61c209e  ! 1249: LDD_I	ldd	[%r16 + 0x009e], %r27
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa048000  ! 1263: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xb92c7001  ! 1264: SLLX_I	sllx	%r17, 0x0001, %r28
	.word 0xfe0c0000  ! 1265: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xf04d4000  ! 1266: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfc55e1a0  ! 1269: LDSH_I	ldsh	[%r23 + 0x01a0], %r30
	.word 0x8394a12c  ! 1270: WRPR_TNPC_I	wrpr	%r18, 0x012c, %tnpc
	.word 0xb024c000  ! 1271: SUB_R	sub 	%r19, %r0, %r24
	.word 0xf2454000  ! 1272: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xb9520000  ! 1273: RDPR_PIL	<illegal instruction>
	.word 0xfd1da022  ! 1275: LDDF_I	ldd	[%r22, 0x0022], %f30
	.word 0xfe040000  ! 1278: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xb7520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0xb7508000  ! 1280: RDPR_TSTATE	<illegal instruction>
	.word 0xf20c0000  ! 1281: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xb1540000  ! 1285: RDPR_GL	<illegal instruction>
	.word 0xf215e05f  ! 1286: LDUH_I	lduh	[%r23 + 0x005f], %r25
	.word 0xf40da166  ! 1287: LDUB_I	ldub	[%r22 + 0x0166], %r26
	.word 0xb9504000  ! 1290: RDPR_TNPC	<illegal instruction>
	.word 0xb351c000  ! 1291: RDPR_TL	<illegal instruction>
	.word 0xf80da0ef  ! 1294: LDUB_I	ldub	[%r22 + 0x00ef], %r28
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 1298: RDPR_TNPC	<illegal instruction>
	.word 0xf71ce17a  ! 1300: LDDF_I	ldd	[%r19, 0x017a], %f27
	.word 0xf055c000  ! 1301: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0x839461af  ! 1302: WRPR_TNPC_I	wrpr	%r17, 0x01af, %tnpc
	.word 0xf84d4000  ! 1305: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf4048000  ! 1306: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0x8195e14a  ! 1309: WRPR_TPC_I	wrpr	%r23, 0x014a, %tpc
	.word 0xfd1c0000  ! 1310: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xfc05e0f2  ! 1312: LDUW_I	lduw	[%r23 + 0x00f2], %r30
	mov	1, %r14
	.word 0xa193a000  ! 1315: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf6540000  ! 1319: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0x91942026  ! 1320: WRPR_PIL_I	wrpr	%r16, 0x0026, %pil
	.word 0xfe0c8000  ! 1325: LDUB_R	ldub	[%r18 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983fc9  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc9, %hpstate
	.word 0xbb520000  ! 1330: RDPR_PIL	<illegal instruction>
	.word 0xbea5608b  ! 1331: SUBcc_I	subcc 	%r21, 0x008b, %r31
	.word 0xf01d4000  ! 1333: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xfc1d0000  ! 1338: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xfa144000  ! 1339: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0x8395e140  ! 1340: WRPR_TNPC_I	wrpr	%r23, 0x0140, %tnpc
	.word 0xfb1c8000  ! 1341: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xf21461fe  ! 1342: LDUH_I	lduh	[%r17 + 0x01fe], %r25
	.word 0xf0444000  ! 1344: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf51d0000  ! 1345: LDDF_R	ldd	[%r20, %r0], %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983913  ! 1347: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1913, %hpstate
	.word 0x81946041  ! 1348: WRPR_TPC_I	wrpr	%r17, 0x0041, %tpc
	.word 0xf45ca136  ! 1350: LDX_I	ldx	[%r18 + 0x0136], %r26
	.word 0xf25d0000  ! 1351: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xfe04618c  ! 1352: LDUW_I	lduw	[%r17 + 0x018c], %r31
	.word 0xf055e0b6  ! 1353: LDSH_I	ldsh	[%r23 + 0x00b6], %r24
	.word 0xfc5de0d3  ! 1355: LDX_I	ldx	[%r23 + 0x00d3], %r30
	setx	0x10123, %g1, %o0
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
	.word 0xf00de08c  ! 1358: LDUB_I	ldub	[%r23 + 0x008c], %r24
	.word 0xf31d4000  ! 1360: LDDF_R	ldd	[%r21, %r0], %f25
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31d2181  ! 1363: LDDF_I	ldd	[%r20, 0x0181], %f25
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4458000  ! 1368: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0x8195a1fd  ! 1372: WRPR_TPC_I	wrpr	%r22, 0x01fd, %tpc
	.word 0xf6550000  ! 1373: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf91d0000  ! 1377: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xfe45a074  ! 1379: LDSW_I	ldsw	[%r22 + 0x0074], %r31
	.word 0xfc44a17d  ! 1386: LDSW_I	ldsw	[%r18 + 0x017d], %r30
	.word 0xf8546106  ! 1389: LDSH_I	ldsh	[%r17 + 0x0106], %r28
	.word 0xf20c0000  ! 1390: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xb62ce0da  ! 1391: ANDN_I	andn 	%r19, 0x00da, %r27
	.word 0xbf2c0000  ! 1394: SLL_R	sll 	%r16, %r0, %r31
	.word 0xfe0d0000  ! 1396: LDUB_R	ldub	[%r20 + %r0], %r31
	setx	data_start_7, %g1, %r21
	.word 0xf8456096  ! 1398: LDSW_I	ldsw	[%r21 + 0x0096], %r28
	mov	0, %r14
	.word 0xa193a000  ! 1399: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r14
	.word 0xa193a000  ! 1407: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30024, %g1, %o0
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
	.word 0x8594618f  ! 1419: WRPR_TSTATE_I	wrpr	%r17, 0x018f, %tstate
	.word 0xf815a1d9  ! 1424: LDUH_I	lduh	[%r22 + 0x01d9], %r28
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1428: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf454a1b9  ! 1431: LDSH_I	ldsh	[%r18 + 0x01b9], %r26
	.word 0xfa44604a  ! 1437: LDSW_I	ldsw	[%r17 + 0x004a], %r29
	.word 0xf04460ea  ! 1439: LDSW_I	ldsw	[%r17 + 0x00ea], %r24
	.word 0xb6bde13f  ! 1445: XNORcc_I	xnorcc 	%r23, 0x013f, %r27
	.word 0xfa150000  ! 1449: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0x8d9560cc  ! 1450: WRPR_PSTATE_I	wrpr	%r21, 0x00cc, %pstate
	.word 0xbb518000  ! 1454: RDPR_PSTATE	<illegal instruction>
	setx	0x1020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71d211d  ! 1460: LDDF_I	ldd	[%r20, 0x011d], %f27
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 1464: RDPR_TPC	<illegal instruction>
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1468: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r23
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1d2046  ! 1475: LDDF_I	ldd	[%r20, 0x0046], %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xf044c000  ! 1478: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xb57cc400  ! 1479: MOVR_R	movre	%r19, %r0, %r26
	.word 0xb4852106  ! 1485: ADDcc_I	addcc 	%r20, 0x0106, %r26
	.word 0xfa5560ba  ! 1486: LDSH_I	ldsh	[%r21 + 0x00ba], %r29
	setx	0x10104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44d2054  ! 1494: LDSB_I	ldsb	[%r20 + 0x0054], %r26
	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89956190  ! 1497: WRPR_TICK_I	wrpr	%r21, 0x0190, %tick
	.word 0xfa0de176  ! 1501: LDUB_I	ldub	[%r23 + 0x0176], %r29
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64de128  ! 1508: LDSB_I	ldsb	[%r23 + 0x0128], %r27
	setx	data_start_7, %g1, %r19
	.word 0x8595a003  ! 1513: WRPR_TSTATE_I	wrpr	%r22, 0x0003, %tstate
	.word 0xb37cc400  ! 1516: MOVR_R	movre	%r19, %r0, %r25
	.word 0xf80da068  ! 1518: LDUB_I	ldub	[%r22 + 0x0068], %r28
	.word 0xf0540000  ! 1521: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xfa15211a  ! 1522: LDUH_I	lduh	[%r20 + 0x011a], %r29
	.word 0xfe152074  ! 1527: LDUH_I	lduh	[%r20 + 0x0074], %r31
	.word 0xb5504000  ! 1528: RDPR_TNPC	<illegal instruction>
	.word 0xfd1d4000  ! 1529: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xfe5d8000  ! 1530: LDX_R	ldx	[%r22 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81982c81  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c81, %hpstate
	.word 0xf85dc000  ! 1542: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb5518000  ! 1543: RDPR_PSTATE	<illegal instruction>
	.word 0xb9508000  ! 1545: RDPR_TSTATE	<illegal instruction>
	.word 0xf0448000  ! 1548: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xf51ca1dc  ! 1550: LDDF_I	ldd	[%r18, 0x01dc], %f26
	.word 0xbf50c000  ! 1553: RDPR_TT	<illegal instruction>
	.word 0xbec4a0e5  ! 1554: ADDCcc_I	addccc 	%r18, 0x00e5, %r31
	.word 0xf6046178  ! 1556: LDUW_I	lduw	[%r17 + 0x0178], %r27
	.word 0xbf51c000  ! 1557: RDPR_TL	<illegal instruction>
	.word 0xf44d0000  ! 1562: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xf00d200d  ! 1563: LDUB_I	ldub	[%r20 + 0x000d], %r24
	.word 0xf91ca111  ! 1565: LDDF_I	ldd	[%r18, 0x0111], %f28
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf614a15b  ! 1574: LDUH_I	lduh	[%r18 + 0x015b], %r27
	.word 0xbc15a0a6  ! 1576: OR_I	or 	%r22, 0x00a6, %r30
	.word 0xbf518000  ! 1577: RDPR_PSTATE	<illegal instruction>
	.word 0xfa1dc000  ! 1579: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xfc1c61bc  ! 1583: LDD_I	ldd	[%r17 + 0x01bc], %r30
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31de151  ! 1585: LDDF_I	ldd	[%r23, 0x0151], %f25
	.word 0xbf500000  ! 1587: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r20
	setx	data_start_0, %g1, %r16
	.word 0xfc5c8000  ! 1596: LDX_R	ldx	[%r18 + %r0], %r30
	mov	0, %r12
	.word 0x8f932000  ! 1601: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb89d4000  ! 1602: XORcc_R	xorcc 	%r21, %r0, %r28
	.word 0xb9346001  ! 1603: SRL_I	srl 	%r17, 0x0001, %r28
	.word 0xfc4c0000  ! 1608: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0x8595201d  ! 1615: WRPR_TSTATE_I	wrpr	%r20, 0x001d, %tstate
	setx	data_start_0, %g1, %r18
	.word 0xf25c8000  ! 1619: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xfc550000  ! 1620: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf8558000  ! 1621: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xf81d0000  ! 1622: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xf045c000  ! 1629: LDSW_R	ldsw	[%r23 + %r0], %r24
	setx	data_start_1, %g1, %r18
	.word 0xf21c617b  ! 1633: LDD_I	ldd	[%r17 + 0x017b], %r25
	.word 0xb32d3001  ! 1634: SLLX_I	sllx	%r20, 0x0001, %r25
	.word 0xf41c600e  ! 1636: LDD_I	ldd	[%r17 + 0x000e], %r26
	.word 0xb005a0c0  ! 1637: ADD_I	add 	%r22, 0x00c0, %r24
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05da194  ! 1641: LDX_I	ldx	[%r22 + 0x0194], %r24
	.word 0x8d95617e  ! 1642: WRPR_PSTATE_I	wrpr	%r21, 0x017e, %pstate
	.word 0xb3510000  ! 1643: RDPR_TICK	<illegal instruction>
	.word 0xf444e1e6  ! 1645: LDSW_I	ldsw	[%r19 + 0x01e6], %r26
	.word 0xf81ce0e3  ! 1646: LDD_I	ldd	[%r19 + 0x00e3], %r28
	.word 0xb33c9000  ! 1647: SRAX_R	srax	%r18, %r0, %r25
	.word 0xf71c8000  ! 1649: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xb1540000  ! 1650: RDPR_GL	<illegal instruction>
	.word 0xf04d6027  ! 1651: LDSB_I	ldsb	[%r21 + 0x0027], %r24
	.word 0xfa558000  ! 1653: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xbb518000  ! 1657: RDPR_PSTATE	<illegal instruction>
	.word 0xfa5c8000  ! 1660: LDX_R	ldx	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x3021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4ce0c8  ! 1664: LDSB_I	ldsb	[%r19 + 0x00c8], %r29
	setx	data_start_5, %g1, %r23
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa04c000  ! 1668: LDUW_R	lduw	[%r19 + %r0], %r29
	setx	data_start_0, %g1, %r20
	.word 0x87956036  ! 1671: WRPR_TT_I	wrpr	%r21, 0x0036, %tt
	.word 0xf8558000  ! 1676: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xf4146065  ! 1679: LDUH_I	lduh	[%r17 + 0x0065], %r26
	setx	0x30021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1520000  ! 1683: RDPR_PIL	<illegal instruction>
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84d6029  ! 1685: LDSB_I	ldsb	[%r21 + 0x0029], %r28
	.word 0xfe54c000  ! 1686: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xfc05c000  ! 1687: LDUW_R	lduw	[%r23 + %r0], %r30
	mov	1, %r14
	.word 0xa193a000  ! 1693: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9480000  ! 1700: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf64dc000  ! 1702: LDSB_R	ldsb	[%r23 + %r0], %r27
	mov	0, %r14
	.word 0xa193a000  ! 1704: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf815e0bc  ! 1707: LDUH_I	lduh	[%r23 + 0x00bc], %r28
	.word 0xb750c000  ! 1710: RDPR_TT	<illegal instruction>
	.word 0xfc45c000  ! 1712: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xb5500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xf84c8000  ! 1715: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xb8848000  ! 1717: ADDcc_R	addcc 	%r18, %r0, %r28
	.word 0xf85d8000  ! 1720: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xb60d0000  ! 1721: AND_R	and 	%r20, %r0, %r27
	.word 0xfb1c4000  ! 1723: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xf004c000  ! 1725: LDUW_R	lduw	[%r19 + %r0], %r24
	mov	0, %r12
	.word 0x8f932000  ! 1726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf6054000  ! 1727: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xb2b4e0fa  ! 1729: SUBCcc_I	orncc 	%r19, 0x00fa, %r25
	.word 0xf445200e  ! 1730: LDSW_I	ldsw	[%r20 + 0x000e], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x879521af  ! 1733: WRPR_TT_I	wrpr	%r20, 0x01af, %tt
	.word 0xf71c4000  ! 1736: LDDF_R	ldd	[%r17, %r0], %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982fd1  ! 1739: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	.word 0xf404c000  ! 1747: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xb3480000  ! 1750: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982c03  ! 1752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c03, %hpstate
	.word 0xf04ca030  ! 1753: LDSB_I	ldsb	[%r18 + 0x0030], %r24
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	setx	0x10315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a09a  ! 1763: WRPR_TSTATE_I	wrpr	%r18, 0x009a, %tstate
	setx	0x20008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71d8000  ! 1766: LDDF_R	ldd	[%r22, %r0], %f27
	setx	0x20113, %g1, %o0
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
	.word 0xf60d0000  ! 1771: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xfe1c8000  ! 1777: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf4156178  ! 1780: LDUH_I	lduh	[%r21 + 0x0178], %r26
	.word 0xf8454000  ! 1788: LDSW_R	ldsw	[%r21 + %r0], %r28
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5dc000  ! 1791: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xb5540000  ! 1793: RDPR_GL	<illegal instruction>
	.word 0xfc4d600f  ! 1796: LDSB_I	ldsb	[%r21 + 0x000f], %r30
	.word 0xfc456083  ! 1798: LDSW_I	ldsw	[%r21 + 0x0083], %r30
	.word 0xb08c0000  ! 1799: ANDcc_R	andcc 	%r16, %r0, %r24
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9460fb  ! 1814: WRPR_PSTATE_I	wrpr	%r17, 0x00fb, %pstate
	.word 0xf45ce162  ! 1815: LDX_I	ldx	[%r19 + 0x0162], %r26
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf244a1b6  ! 1818: LDSW_I	ldsw	[%r18 + 0x01b6], %r25
	.word 0x899420ab  ! 1821: WRPR_TICK_I	wrpr	%r16, 0x00ab, %tick
	.word 0xfd1ca05c  ! 1824: LDDF_I	ldd	[%r18, 0x005c], %f30
	.word 0xf84de05e  ! 1827: LDSB_I	ldsb	[%r23 + 0x005e], %r28
	.word 0xb6aca013  ! 1828: ANDNcc_I	andncc 	%r18, 0x0013, %r27
	.word 0x8595a17f  ! 1829: WRPR_TSTATE_I	wrpr	%r22, 0x017f, %tstate
	.word 0xfa05a039  ! 1830: LDUW_I	lduw	[%r22 + 0x0039], %r29
	.word 0xfa4561a5  ! 1834: LDSW_I	ldsw	[%r21 + 0x01a5], %r29
	.word 0xbd50c000  ! 1835: RDPR_TT	<illegal instruction>
	.word 0xb2bce029  ! 1836: XNORcc_I	xnorcc 	%r19, 0x0029, %r25
	setx	data_start_0, %g1, %r20
	.word 0xf415e0f8  ! 1838: LDUH_I	lduh	[%r23 + 0x00f8], %r26
	.word 0x81956001  ! 1839: WRPR_TPC_I	wrpr	%r21, 0x0001, %tpc
	.word 0xb1480000  ! 1840: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb4242181  ! 1845: SUB_I	sub 	%r16, 0x0181, %r26
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa14c000  ! 1848: LDUH_R	lduh	[%r19 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb405c000  ! 1856: ADD_R	add 	%r23, %r0, %r26
	.word 0xf644607f  ! 1862: LDSW_I	ldsw	[%r17 + 0x007f], %r27
	.word 0xfc1cc000  ! 1863: LDD_R	ldd	[%r19 + %r0], %r30
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf204a06c  ! 1866: LDUW_I	lduw	[%r18 + 0x006c], %r25
	.word 0x8595a1fa  ! 1870: WRPR_TSTATE_I	wrpr	%r22, 0x01fa, %tstate
	.word 0xb1480000  ! 1871: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	1, %r14
	.word 0xa193a000  ! 1873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7540000  ! 1874: RDPR_GL	<illegal instruction>
	.word 0xf91da06b  ! 1877: LDDF_I	ldd	[%r22, 0x006b], %f28
	.word 0xbb480000  ! 1880: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_7, %g1, %r18
	.word 0xf0440000  ! 1887: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xbf51c000  ! 1890: RDPR_TL	<illegal instruction>
	.word 0xf20ca14f  ! 1891: LDUB_I	ldub	[%r18 + 0x014f], %r25
	.word 0x8d95214b  ! 1896: WRPR_PSTATE_I	wrpr	%r20, 0x014b, %pstate
	.word 0xfa54a022  ! 1897: LDSH_I	ldsh	[%r18 + 0x0022], %r29
	.word 0xbf518000  ! 1899: RDPR_PSTATE	<illegal instruction>
	.word 0x8994a11b  ! 1904: WRPR_TICK_I	wrpr	%r18, 0x011b, %tick
	.word 0xf71c4000  ! 1905: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xfa14e0b1  ! 1906: LDUH_I	lduh	[%r19 + 0x00b1], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa14e0e6  ! 1913: LDUH_I	lduh	[%r19 + 0x00e6], %r29
	.word 0xbb520000  ! 1916: RDPR_PIL	<illegal instruction>
	.word 0xfa4521d8  ! 1917: LDSW_I	ldsw	[%r20 + 0x01d8], %r29
	.word 0xfa446050  ! 1918: LDSW_I	ldsw	[%r17 + 0x0050], %r29
	.word 0xf84561f9  ! 1921: LDSW_I	ldsw	[%r21 + 0x01f9], %r28
	.word 0xb3500000  ! 1922: RDPR_TPC	<illegal instruction>
	.word 0xbf344000  ! 1923: SRL_R	srl 	%r17, %r0, %r31
	.word 0xf04de151  ! 1924: LDSB_I	ldsb	[%r23 + 0x0151], %r24
	.word 0xf244e0c2  ! 1926: LDSW_I	ldsw	[%r19 + 0x00c2], %r25
	.word 0xf655a056  ! 1929: LDSH_I	ldsh	[%r22 + 0x0056], %r27
	.word 0xba95c000  ! 1930: ORcc_R	orcc 	%r23, %r0, %r29
	.word 0xf844c000  ! 1933: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0x9194604a  ! 1935: WRPR_PIL_I	wrpr	%r17, 0x004a, %pil
	.word 0xbb540000  ! 1936: RDPR_GL	<illegal instruction>
	.word 0xfa0de0ac  ! 1937: LDUB_I	ldub	[%r23 + 0x00ac], %r29
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbac56049  ! 1941: ADDCcc_I	addccc 	%r21, 0x0049, %r29
	.word 0xfc054000  ! 1946: LDUW_R	lduw	[%r21 + %r0], %r30
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04c8000  ! 1948: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xb695e15a  ! 1949: ORcc_I	orcc 	%r23, 0x015a, %r27
	.word 0xb3480000  ! 1951: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf01d8000  ! 1954: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xb151c000  ! 1955: RDPR_TL	<illegal instruction>
	.word 0x8395a0e4  ! 1958: WRPR_TNPC_I	wrpr	%r22, 0x00e4, %tnpc
	.word 0xb9520000  ! 1961: RDPR_PIL	<illegal instruction>
	.word 0xb4a421c0  ! 1962: SUBcc_I	subcc 	%r16, 0x01c0, %r26
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf7c2401  ! 1964: MOVR_I	movre	%r16, 0x1, %r31
	setx	0x10232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	.word 0xb834c000  ! 1969: ORN_R	orn 	%r19, %r0, %r28
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d60a0  ! 1977: LDUB_I	ldub	[%r21 + 0x00a0], %r26
	.word 0xbd540000  ! 1978: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a163  ! 1982: WRPR_TT_I	wrpr	%r18, 0x0163, %tt
	.word 0xfc0c2017  ! 1984: LDUB_I	ldub	[%r16 + 0x0017], %r30
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0ce0c6  ! 1988: LDUB_I	ldub	[%r19 + 0x00c6], %r29
	.word 0x8595a108  ! 1991: WRPR_TSTATE_I	wrpr	%r22, 0x0108, %tstate
	.word 0xb6848000  ! 1995: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xb1508000  ! 1997: RDPR_TSTATE	<illegal instruction>
	.word 0xb17d6401  ! 1999: MOVR_I	movre	%r21, 0x1, %r24
	.word 0x8d94e0ae  ! 2002: WRPR_PSTATE_I	wrpr	%r19, 0x00ae, %pstate
	.word 0xbf7d2401  ! 2004: MOVR_I	movre	%r20, 0x1, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2158000  ! 2014: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0x8394208f  ! 2017: WRPR_TNPC_I	wrpr	%r16, 0x008f, %tnpc
	.word 0xf4544000  ! 2020: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xfe548000  ! 2024: LDSH_R	ldsh	[%r18 + %r0], %r31
	setx	data_start_6, %g1, %r23
	.word 0xf2558000  ! 2030: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf40d4000  ! 2039: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf85c0000  ! 2044: LDX_R	ldx	[%r16 + %r0], %r28
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94219c  ! 2047: WRPR_PSTATE_I	wrpr	%r16, 0x019c, %pstate
	.word 0xfa0da1fd  ! 2054: LDUB_I	ldub	[%r22 + 0x01fd], %r29
	.word 0xf21de1a2  ! 2055: LDD_I	ldd	[%r23 + 0x01a2], %r25
	.word 0xf44c605a  ! 2056: LDSB_I	ldsb	[%r17 + 0x005a], %r26
	.word 0xbd50c000  ! 2057: RDPR_TT	<illegal instruction>
	.word 0xf65460a9  ! 2060: LDSH_I	ldsh	[%r17 + 0x00a9], %r27
	mov	2, %r14
	.word 0xa193a000  ! 2063: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3520000  ! 2064: RDPR_PIL	<illegal instruction>
	setx	0x20337, %g1, %o0
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
	.word 0xf2444000  ! 2071: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xf0448000  ! 2073: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xb60ce10b  ! 2076: AND_I	and 	%r19, 0x010b, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983e51  ! 2077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e51, %hpstate
	.word 0xf25dc000  ! 2079: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xf45de123  ! 2081: LDX_I	ldx	[%r23 + 0x0123], %r26
	mov	1, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf255e0cd  ! 2083: LDSH_I	ldsh	[%r23 + 0x00cd], %r25
	.word 0xf31c614c  ! 2085: LDDF_I	ldd	[%r17, 0x014c], %f25
	.word 0xb08420c6  ! 2090: ADDcc_I	addcc 	%r16, 0x00c6, %r24
	.word 0xfe1c0000  ! 2091: LDD_R	ldd	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x8198284b  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0xf045c000  ! 2097: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xb4b54000  ! 2098: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xbd51c000  ! 2100: RDPR_TL	<illegal instruction>
	.word 0xfa55a076  ! 2104: LDSH_I	ldsh	[%r22 + 0x0076], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb57d6401  ! 2107: MOVR_I	movre	%r21, 0x1, %r26
	.word 0xb8346051  ! 2110: SUBC_I	orn 	%r17, 0x0051, %r28
	.word 0xf00c8000  ! 2111: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf41d0000  ! 2112: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xb1518000  ! 2113: RDPR_PSTATE	<illegal instruction>
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9561c1  ! 2116: WRPR_PSTATE_I	wrpr	%r21, 0x01c1, %pstate
	.word 0xb93c1000  ! 2117: SRAX_R	srax	%r16, %r0, %r28
	.word 0xf214e1c0  ! 2118: LDUH_I	lduh	[%r19 + 0x01c0], %r25
	.word 0xf055c000  ! 2119: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xf804e038  ! 2120: LDUW_I	lduw	[%r19 + 0x0038], %r28
	mov	2, %r14
	.word 0xa193a000  ! 2121: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc440000  ! 2123: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xbb51c000  ! 2124: RDPR_TL	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xf91d8000  ! 2128: LDDF_R	ldd	[%r22, %r0], %f28
	setx	0x20234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf455e1a5  ! 2132: LDSH_I	ldsh	[%r23 + 0x01a5], %r26
	.word 0xf0444000  ! 2134: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xfa1d215d  ! 2135: LDD_I	ldd	[%r20 + 0x015d], %r29
	.word 0xf615a01c  ! 2136: LDUH_I	lduh	[%r22 + 0x001c], %r27
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2258000  ! 2141: SUB_R	sub 	%r22, %r0, %r25
	.word 0x87942077  ! 2146: WRPR_TT_I	wrpr	%r16, 0x0077, %tt
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45c0000  ! 2158: LDX_R	ldx	[%r16 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x9195e1bc  ! 2160: WRPR_PIL_I	wrpr	%r23, 0x01bc, %pil
	.word 0xb9504000  ! 2161: RDPR_TNPC	<illegal instruction>
	.word 0xf644c000  ! 2162: LDSW_R	ldsw	[%r19 + %r0], %r27
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e1c4  ! 2164: WRPR_TICK_I	wrpr	%r23, 0x01c4, %tick
	.word 0xfc0c8000  ! 2165: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0x81942009  ! 2166: WRPR_TPC_I	wrpr	%r16, 0x0009, %tpc
	.word 0xbf641800  ! 2169: MOVcc_R	<illegal instruction>
	.word 0xbe344000  ! 2170: ORN_R	orn 	%r17, %r0, %r31
	.word 0xbd2df001  ! 2171: SLLX_I	sllx	%r23, 0x0001, %r30
	setx	data_start_5, %g1, %r17
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1c4000  ! 2179: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf65c208f  ! 2181: LDX_I	ldx	[%r16 + 0x008f], %r27
	.word 0xf41c8000  ! 2182: LDD_R	ldd	[%r18 + %r0], %r26
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xff1d8000  ! 2192: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xf80ca0c5  ! 2194: LDUB_I	ldub	[%r18 + 0x00c5], %r28
	.word 0xb4340000  ! 2195: SUBC_R	orn 	%r16, %r0, %r26
	.word 0x879460c3  ! 2196: WRPR_TT_I	wrpr	%r17, 0x00c3, %tt
	.word 0xf44d0000  ! 2197: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xfe1c21be  ! 2198: LDD_I	ldd	[%r16 + 0x01be], %r31
	.word 0xf254c000  ! 2201: LDSH_R	ldsh	[%r19 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982f83  ! 2203: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f83, %hpstate
	.word 0xf6444000  ! 2205: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xfe1d20dd  ! 2207: LDD_I	ldd	[%r20 + 0x00dd], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x30238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d8000  ! 2211: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xfa4d6124  ! 2213: LDSB_I	ldsb	[%r21 + 0x0124], %r29
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa15e175  ! 2221: LDUH_I	lduh	[%r23 + 0x0175], %r29
	.word 0xb1520000  ! 2222: RDPR_PIL	<illegal instruction>
	setx	data_start_0, %g1, %r22
	.word 0xfe4de1b5  ! 2224: LDSB_I	ldsb	[%r23 + 0x01b5], %r31
	.word 0xb01dc000  ! 2228: XOR_R	xor 	%r23, %r0, %r24
	.word 0xfa0ce0ab  ! 2230: LDUB_I	ldub	[%r19 + 0x00ab], %r29
	setx	data_start_7, %g1, %r22
	.word 0xf8550000  ! 2236: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xb950c000  ! 2237: RDPR_TT	<illegal instruction>
	.word 0xf605e127  ! 2239: LDUW_I	lduw	[%r23 + 0x0127], %r27
	.word 0xf404e0fb  ! 2240: LDUW_I	lduw	[%r19 + 0x00fb], %r26
	.word 0xf205a1ef  ! 2242: LDUW_I	lduw	[%r22 + 0x01ef], %r25
	.word 0xbd2c8000  ! 2244: SLL_R	sll 	%r18, %r0, %r30
	.word 0xb1518000  ! 2245: RDPR_PSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xbf518000  ! 2254: RDPR_PSTATE	<illegal instruction>
	.word 0xf0148000  ! 2255: LDUH_R	lduh	[%r18 + %r0], %r24
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c208d  ! 2257: LDSB_I	ldsb	[%r16 + 0x008d], %r29
	setx	0x20202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1c6065  ! 2267: LDD_I	ldd	[%r17 + 0x0065], %r30
	.word 0xb950c000  ! 2269: RDPR_TT	<illegal instruction>
	.word 0xf4556098  ! 2271: LDSH_I	ldsh	[%r21 + 0x0098], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 2275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	.word 0xb9504000  ! 2279: RDPR_TNPC	<illegal instruction>
	.word 0xf04d4000  ! 2284: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0x899420c0  ! 2286: WRPR_TICK_I	wrpr	%r16, 0x00c0, %tick
	.word 0xf00ca0a2  ! 2288: LDUB_I	ldub	[%r18 + 0x00a2], %r24
	.word 0xba348000  ! 2289: SUBC_R	orn 	%r18, %r0, %r29
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 2293: RDPR_TPC	rdpr	%tpc, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc4da184  ! 2303: LDSB_I	ldsb	[%r22 + 0x0184], %r30
	.word 0xf044e01f  ! 2304: LDSW_I	ldsw	[%r19 + 0x001f], %r24
	.word 0xbd50c000  ! 2310: RDPR_TT	<illegal instruction>
	.word 0xb751c000  ! 2312: RDPR_TL	<illegal instruction>
	.word 0x899560d8  ! 2316: WRPR_TICK_I	wrpr	%r21, 0x00d8, %tick
	.word 0xbf2c8000  ! 2318: SLL_R	sll 	%r18, %r0, %r31
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a1ae  ! 2324: WRPR_TT_I	wrpr	%r18, 0x01ae, %tt
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65d6096  ! 2337: LDX_I	ldx	[%r21 + 0x0096], %r27
	.word 0xb1500000  ! 2338: RDPR_TPC	<illegal instruction>
	.word 0xfe0d4000  ! 2340: LDUB_R	ldub	[%r21 + %r0], %r31
	mov	0, %r12
	.word 0x8f932000  ! 2342: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa042019  ! 2347: LDUW_I	lduw	[%r16 + 0x0019], %r29
	.word 0xfa44e1f4  ! 2348: LDSW_I	ldsw	[%r19 + 0x01f4], %r29
	.word 0xf60d4000  ! 2349: LDUB_R	ldub	[%r21 + %r0], %r27
	setx	0x10131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 2353: RDPR_TPC	<illegal instruction>
	.word 0xbd518000  ! 2358: RDPR_PSTATE	<illegal instruction>
	.word 0xb88cc000  ! 2360: ANDcc_R	andcc 	%r19, %r0, %r28
	setx	data_start_4, %g1, %r18
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24c207e  ! 2369: LDSB_I	ldsb	[%r16 + 0x007e], %r25
	.word 0xfe4cc000  ! 2372: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf04d6096  ! 2373: LDSB_I	ldsb	[%r21 + 0x0096], %r24
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2144000  ! 2380: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xf24c0000  ! 2382: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xff1d60c9  ! 2388: LDDF_I	ldd	[%r21, 0x00c9], %f31
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf845e078  ! 2393: LDSW_I	ldsw	[%r23 + 0x0078], %r28
	.word 0xf00d21b4  ! 2397: LDUB_I	ldub	[%r20 + 0x01b4], %r24
	.word 0xfc04e074  ! 2398: LDUW_I	lduw	[%r19 + 0x0074], %r30
	.word 0x9194a18a  ! 2400: WRPR_PIL_I	wrpr	%r18, 0x018a, %pil
	.word 0xf444c000  ! 2401: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xb88d60f6  ! 2407: ANDcc_I	andcc 	%r21, 0x00f6, %r28
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2046157  ! 2409: LDUW_I	lduw	[%r17 + 0x0157], %r25
	.word 0xb28c0000  ! 2410: ANDcc_R	andcc 	%r16, %r0, %r25
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2414: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2416: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa5da1ed  ! 2418: LDX_I	ldx	[%r22 + 0x01ed], %r29
	.word 0xfb1ce014  ! 2421: LDDF_I	ldd	[%r19, 0x0014], %f29
	.word 0xfe54201c  ! 2424: LDSH_I	ldsh	[%r16 + 0x001c], %r31
	.word 0xb63ce04e  ! 2426: XNOR_I	xnor 	%r19, 0x004e, %r27
	.word 0xbd2c4000  ! 2427: SLL_R	sll 	%r17, %r0, %r30
	.word 0xf654c000  ! 2431: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xf05d61c6  ! 2432: LDX_I	ldx	[%r21 + 0x01c6], %r24
	setx	0x30310, %g1, %o0
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
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2df001  ! 2448: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xb28d8000  ! 2449: ANDcc_R	andcc 	%r22, %r0, %r25
	.word 0xfc146085  ! 2450: LDUH_I	lduh	[%r17 + 0x0085], %r30
	.word 0xf04460cc  ! 2451: LDSW_I	ldsw	[%r17 + 0x00cc], %r24
	.word 0xfa5c4000  ! 2452: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xbc9da094  ! 2453: XORcc_I	xorcc 	%r22, 0x0094, %r30
	.word 0xf40c0000  ! 2456: LDUB_R	ldub	[%r16 + %r0], %r26
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80c60fc  ! 2458: LDUB_I	ldub	[%r17 + 0x00fc], %r28
	.word 0xf41d8000  ! 2460: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xfc45a196  ! 2461: LDSW_I	ldsw	[%r22 + 0x0196], %r30
	.word 0xf65c6056  ! 2462: LDX_I	ldx	[%r17 + 0x0056], %r27
	.word 0xfe1d219c  ! 2464: LDD_I	ldd	[%r20 + 0x019c], %r31
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c20bd  ! 2471: LDSB_I	ldsb	[%r16 + 0x00bd], %r29
	mov	0, %r14
	.word 0xa193a000  ! 2472: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf255c000  ! 2475: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf51c60e1  ! 2479: LDDF_I	ldd	[%r17, 0x00e1], %f26
	.word 0xfa0520e4  ! 2482: LDUW_I	lduw	[%r20 + 0x00e4], %r29
	setx	data_start_1, %g1, %r20
	.word 0xfe5c4000  ! 2485: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0x859420f4  ! 2486: WRPR_TSTATE_I	wrpr	%r16, 0x00f4, %tstate
	.word 0xf8540000  ! 2489: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xfd1c6079  ! 2491: LDDF_I	ldd	[%r17, 0x0079], %f30
	setx	0x30029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d0000  ! 2497: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb3520000  ! 2499: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a43  ! 2500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a43, %hpstate
	.word 0xf11c60d1  ! 2502: LDDF_I	ldd	[%r17, 0x00d1], %f24
	.word 0xbd518000  ! 2503: RDPR_PSTATE	<illegal instruction>
	.word 0xb32c8000  ! 2505: SLL_R	sll 	%r18, %r0, %r25
	mov	0, %r14
	.word 0xa193a000  ! 2506: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7480000  ! 2510: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd50c000  ! 2518: RDPR_TT	<illegal instruction>
	setx	0x1e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf454c000  ! 2529: LDSH_R	ldsh	[%r19 + %r0], %r26
	setx	data_start_3, %g1, %r16
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e1fd  ! 2537: WRPR_TICK_I	wrpr	%r19, 0x01fd, %tick
	.word 0xb88d8000  ! 2541: ANDcc_R	andcc 	%r22, %r0, %r28
	.word 0xf644a091  ! 2544: LDSW_I	ldsw	[%r18 + 0x0091], %r27
	.word 0xfa45e008  ! 2545: LDSW_I	ldsw	[%r23 + 0x0008], %r29
	mov	2, %r12
	.word 0x8f932000  ! 2546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8454000  ! 2547: LDSW_R	ldsw	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983941  ! 2553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1941, %hpstate
	.word 0xfb1d0000  ! 2559: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xfc1d8000  ! 2561: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xb350c000  ! 2567: RDPR_TT	<illegal instruction>
	.word 0xf51c205a  ! 2571: LDDF_I	ldd	[%r16, 0x005a], %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983d83  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d83, %hpstate
	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe2dc000  ! 2575: ANDN_R	andn 	%r23, %r0, %r31
	.word 0x8595e0fd  ! 2582: WRPR_TSTATE_I	wrpr	%r23, 0x00fd, %tstate
	.word 0xfa4c2165  ! 2587: LDSB_I	ldsb	[%r16 + 0x0165], %r29
	.word 0xfe0d8000  ! 2588: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xb7520000  ! 2592: RDPR_PIL	<illegal instruction>
	.word 0xf845a0b7  ! 2593: LDSW_I	ldsw	[%r22 + 0x00b7], %r28
	.word 0xb5518000  ! 2594: RDPR_PSTATE	<illegal instruction>
	.word 0xbd518000  ! 2595: RDPR_PSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r18
	.word 0xf0458000  ! 2606: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf24521b6  ! 2607: LDSW_I	ldsw	[%r20 + 0x01b6], %r25
	.word 0xf04ca114  ! 2611: LDSB_I	ldsb	[%r18 + 0x0114], %r24
	.word 0xb88d2133  ! 2614: ANDcc_I	andcc 	%r20, 0x0133, %r28
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05420a7  ! 2619: LDSH_I	ldsh	[%r16 + 0x00a7], %r24
	.word 0xf654c000  ! 2621: LDSH_R	ldsh	[%r19 + %r0], %r27
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 2623: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r16
	.word 0xf6544000  ! 2625: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xf60cc000  ! 2629: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xb7500000  ! 2631: RDPR_TPC	<illegal instruction>
	.word 0xfe4c8000  ! 2633: LDSB_R	ldsb	[%r18 + %r0], %r31
	setx	0x104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51de1fe  ! 2637: LDDF_I	ldd	[%r23, 0x01fe], %f26
	.word 0xb63d0000  ! 2641: XNOR_R	xnor 	%r20, %r0, %r27
	.word 0xf01d4000  ! 2642: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0x83952096  ! 2643: WRPR_TNPC_I	wrpr	%r20, 0x0096, %tnpc
	.word 0xb635c000  ! 2644: ORN_R	orn 	%r23, %r0, %r27
	.word 0xf80d8000  ! 2647: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xb7510000  ! 2648: RDPR_TICK	<illegal instruction>
	.word 0x819560bd  ! 2650: WRPR_TPC_I	wrpr	%r21, 0x00bd, %tpc
	.word 0xb8c4c000  ! 2653: ADDCcc_R	addccc 	%r19, %r0, %r28
	.word 0xf44de032  ! 2654: LDSB_I	ldsb	[%r23 + 0x0032], %r26
	.word 0x8994e159  ! 2655: WRPR_TICK_I	wrpr	%r19, 0x0159, %tick
	.word 0xf004e02e  ! 2657: LDUW_I	lduw	[%r19 + 0x002e], %r24
	.word 0xf81c0000  ! 2658: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xb7504000  ! 2661: RDPR_TNPC	<illegal instruction>
	.word 0xfa0cc000  ! 2663: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xb1344000  ! 2668: SRL_R	srl 	%r17, %r0, %r24
	.word 0x8594e050  ! 2671: WRPR_TSTATE_I	wrpr	%r19, 0x0050, %tstate
	setx	data_start_2, %g1, %r21
	.word 0xfe0ca053  ! 2677: LDUB_I	ldub	[%r18 + 0x0053], %r31
	.word 0xf05cc000  ! 2680: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xbd504000  ! 2681: RDPR_TNPC	<illegal instruction>
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 2686: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa4d61cd  ! 2687: LDSB_I	ldsb	[%r21 + 0x01cd], %r29
	.word 0xf80d8000  ! 2691: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xfa0c60f3  ! 2696: LDUB_I	ldub	[%r17 + 0x00f3], %r29
	.word 0xf415607f  ! 2698: LDUH_I	lduh	[%r21 + 0x007f], %r26
	.word 0xfc45e04c  ! 2702: LDSW_I	ldsw	[%r23 + 0x004c], %r30
	.word 0xfc0d8000  ! 2703: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xb5540000  ! 2704: RDPR_GL	<illegal instruction>
	.word 0xb951c000  ! 2708: RDPR_TL	<illegal instruction>
	.word 0xfc15600c  ! 2709: LDUH_I	lduh	[%r21 + 0x000c], %r30
	.word 0xfe0d6103  ! 2710: LDUB_I	ldub	[%r21 + 0x0103], %r31
	.word 0xfe5ca144  ! 2717: LDX_I	ldx	[%r18 + 0x0144], %r31
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11dc000  ! 2725: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0x8595a154  ! 2726: WRPR_TSTATE_I	wrpr	%r22, 0x0154, %tstate
	.word 0xf61ce18b  ! 2727: LDD_I	ldd	[%r19 + 0x018b], %r27
	setx	0x2032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81da195  ! 2729: LDD_I	ldd	[%r22 + 0x0195], %r28
	.word 0xf71ce15b  ! 2730: LDDF_I	ldd	[%r19, 0x015b], %f27
	.word 0xfe4420f2  ! 2731: LDSW_I	ldsw	[%r16 + 0x00f2], %r31
	.word 0xf0456116  ! 2733: LDSW_I	ldsw	[%r21 + 0x0116], %r24
	.word 0xf84ca0cc  ! 2738: LDSB_I	ldsb	[%r18 + 0x00cc], %r28
	.word 0xf604a157  ! 2743: LDUW_I	lduw	[%r18 + 0x0157], %r27
	.word 0xb77da401  ! 2746: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xfa14a14d  ! 2750: LDUH_I	lduh	[%r18 + 0x014d], %r29
	.word 0xfc044000  ! 2756: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xfe4d20c5  ! 2758: LDSB_I	ldsb	[%r20 + 0x00c5], %r31
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0b5610a  ! 2770: ORNcc_I	orncc 	%r21, 0x010a, %r24
	.word 0xb1504000  ! 2773: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	.word 0xf65461a0  ! 2777: LDSH_I	ldsh	[%r17 + 0x01a0], %r27
	.word 0xfe458000  ! 2780: LDSW_R	ldsw	[%r22 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f81  ! 2782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f81, %hpstate
	.word 0xb22ce073  ! 2784: ANDN_I	andn 	%r19, 0x0073, %r25
	.word 0xf84ca066  ! 2788: LDSB_I	ldsb	[%r18 + 0x0066], %r28
	.word 0xb1510000  ! 2790: RDPR_TICK	<illegal instruction>
	.word 0xf80461b6  ! 2791: LDUW_I	lduw	[%r17 + 0x01b6], %r28
	.word 0xf05d8000  ! 2793: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0x859520bc  ! 2796: WRPR_TSTATE_I	wrpr	%r20, 0x00bc, %tstate
	.word 0xf40da019  ! 2800: LDUB_I	ldub	[%r22 + 0x0019], %r26
	.word 0xfd1c606a  ! 2802: LDDF_I	ldd	[%r17, 0x006a], %f30
	.word 0x8394a18e  ! 2803: WRPR_TNPC_I	wrpr	%r18, 0x018e, %tnpc
	.word 0xbf643801  ! 2804: MOVcc_I	<illegal instruction>
	.word 0x8795a0e5  ! 2805: WRPR_TT_I	wrpr	%r22, 0x00e5, %tt
	.word 0xb5353001  ! 2806: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xba0ce14b  ! 2808: AND_I	and 	%r19, 0x014b, %r29
	setx	0x10334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4546090  ! 2816: LDSH_I	ldsh	[%r17 + 0x0090], %r26
	.word 0xb0ade069  ! 2821: ANDNcc_I	andncc 	%r23, 0x0069, %r24
	.word 0xfe5d8000  ! 2825: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0x8794e1c1  ! 2831: WRPR_TT_I	wrpr	%r19, 0x01c1, %tt
	.word 0xf21cc000  ! 2833: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0x83942158  ! 2834: WRPR_TNPC_I	wrpr	%r16, 0x0158, %tnpc
	.word 0xfb1da104  ! 2837: LDDF_I	ldd	[%r22, 0x0104], %f29
	.word 0xba058000  ! 2841: ADD_R	add 	%r22, %r0, %r29
	setx	0x30316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 2844: RDPR_PSTATE	<illegal instruction>
	.word 0xfc040000  ! 2849: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf64cc000  ! 2852: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xbf540000  ! 2853: RDPR_GL	<illegal instruction>
	.word 0xfd1c8000  ! 2854: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xb92cc000  ! 2855: SLL_R	sll 	%r19, %r0, %r28
	.word 0xf2140000  ! 2858: LDUH_R	lduh	[%r16 + %r0], %r25
	setx	0x30014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb81d60dd  ! 2860: XOR_I	xor 	%r21, 0x00dd, %r28
	.word 0xf25d0000  ! 2862: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf045a0c0  ! 2863: LDSW_I	ldsw	[%r22 + 0x00c0], %r24
	.word 0xbc8da1a7  ! 2865: ANDcc_I	andcc 	%r22, 0x01a7, %r30
	.word 0xf44c6158  ! 2868: LDSB_I	ldsb	[%r17 + 0x0158], %r26
	.word 0xb3510000  ! 2873: RDPR_TICK	<illegal instruction>
	setx	data_start_4, %g1, %r18
	.word 0xb335f001  ! 2879: SRLX_I	srlx	%r23, 0x0001, %r25
	.word 0xf31d4000  ! 2882: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xb3510000  ! 2883: RDPR_TICK	<illegal instruction>
	.word 0xf8040000  ! 2884: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf65c6039  ! 2886: LDX_I	ldx	[%r17 + 0x0039], %r27
	.word 0xfa04e167  ! 2888: LDUW_I	lduw	[%r19 + 0x0167], %r29
	.word 0xf45dc000  ! 2892: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf04d61f0  ! 2893: LDSB_I	ldsb	[%r21 + 0x01f0], %r24
	.word 0xf24c4000  ! 2896: LDSB_R	ldsb	[%r17 + %r0], %r25
	setx	data_start_1, %g1, %r20
	.word 0xf6154000  ! 2900: LDUH_R	lduh	[%r21 + %r0], %r27
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8548000  ! 2907: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf40cc000  ! 2908: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xb1504000  ! 2911: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819828c1  ! 2919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c1, %hpstate
	.word 0xfe556154  ! 2922: LDSH_I	ldsh	[%r21 + 0x0154], %r31
	.word 0xf31d8000  ! 2923: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xbc14c000  ! 2924: OR_R	or 	%r19, %r0, %r30
	.word 0xb9540000  ! 2927: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983881  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1881, %hpstate
	.word 0xfd1c61e0  ! 2934: LDDF_I	ldd	[%r17, 0x01e0], %f30
	.word 0xfe0c0000  ! 2935: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xf31c2153  ! 2938: LDDF_I	ldd	[%r16, 0x0153], %f25
	setx	0x30022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	1, %r12
	.word 0x8f932000  ! 2949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf415a152  ! 2950: LDUH_I	lduh	[%r22 + 0x0152], %r26
	.word 0xf845a12b  ! 2951: LDSW_I	ldsw	[%r22 + 0x012b], %r28
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819829d9  ! 2955: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d9, %hpstate
	.word 0xfe45c000  ! 2966: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf8440000  ! 2967: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xf31c4000  ! 2968: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xbc1c8000  ! 2970: XOR_R	xor 	%r18, %r0, %r30
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 2976: RDPR_TICK	<illegal instruction>
	.word 0x839560a2  ! 2979: WRPR_TNPC_I	wrpr	%r21, 0x00a2, %tnpc
	.word 0xf40c21c8  ! 2980: LDUB_I	ldub	[%r16 + 0x01c8], %r26
	setx	0x30323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194607f  ! 2986: WRPR_TPC_I	wrpr	%r17, 0x007f, %tpc
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 2988: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8595a075  ! 2989: WRPR_TSTATE_I	wrpr	%r22, 0x0075, %tstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xff1da023  ! 2993: LDDF_I	ldd	[%r22, 0x0023], %f31
	setx	data_start_3, %g1, %r18
	setx	0x20300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa44a1d5  ! 3002: LDSW_I	ldsw	[%r18 + 0x01d5], %r29
	.word 0xfc0c8000  ! 3005: LDUB_R	ldub	[%r18 + %r0], %r30
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4548000  ! 3007: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xb6a420b1  ! 3010: SUBcc_I	subcc 	%r16, 0x00b1, %r27
	setx	data_start_0, %g1, %r19
	.word 0xfe45e0ec  ! 3014: LDSW_I	ldsw	[%r23 + 0x00ec], %r31
	.word 0xfa1d0000  ! 3015: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xbb508000  ! 3017: RDPR_TSTATE	<illegal instruction>
	.word 0x8995a123  ! 3018: WRPR_TICK_I	wrpr	%r22, 0x0123, %tick
	.word 0xfc5cc000  ! 3021: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xf2050000  ! 3024: LDUW_R	lduw	[%r20 + %r0], %r25
	setx	0x10212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 3031: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf84ce057  ! 3032: LDSB_I	ldsb	[%r19 + 0x0057], %r28
	.word 0xfc1cc000  ! 3039: LDD_R	ldd	[%r19 + %r0], %r30
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6544000  ! 3042: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xb7508000  ! 3044: RDPR_TSTATE	<illegal instruction>
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982fdb  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdb, %hpstate
	.word 0xf65ce0fb  ! 3050: LDX_I	ldx	[%r19 + 0x00fb], %r27
	setx	0x2000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe55c000  ! 3054: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xb40d608d  ! 3056: AND_I	and 	%r21, 0x008d, %r26
	.word 0xf4144000  ! 3062: LDUH_R	lduh	[%r17 + %r0], %r26
	setx	0x3000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a11b  ! 3065: WRPR_PIL_I	wrpr	%r18, 0x011b, %pil
	.word 0xbd540000  ! 3066: RDPR_GL	<illegal instruction>
	.word 0xf31ce18d  ! 3067: LDDF_I	ldd	[%r19, 0x018d], %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983d99  ! 3073: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d99, %hpstate
	.word 0xf8448000  ! 3075: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xb32c2001  ! 3077: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xfc5c20a7  ! 3078: LDX_I	ldx	[%r16 + 0x00a7], %r30
	.word 0xf31d4000  ! 3080: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xfa558000  ! 3081: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0x8394208c  ! 3082: WRPR_TNPC_I	wrpr	%r16, 0x008c, %tnpc
	.word 0xf844c000  ! 3083: LDSW_R	ldsw	[%r19 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9520000  ! 3088: RDPR_PIL	<illegal instruction>
	.word 0xb89cc000  ! 3091: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xf31cc000  ! 3092: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xb1508000  ! 3094: RDPR_TSTATE	<illegal instruction>
	.word 0x8595606c  ! 3100: WRPR_TSTATE_I	wrpr	%r21, 0x006c, %tstate
	.word 0xf25de0f6  ! 3103: LDX_I	ldx	[%r23 + 0x00f6], %r25
	.word 0xf80c0000  ! 3104: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf05c4000  ! 3106: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf31c4000  ! 3107: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xf8556041  ! 3112: LDSH_I	ldsh	[%r21 + 0x0041], %r28
	.word 0xf41da17d  ! 3113: LDD_I	ldd	[%r22 + 0x017d], %r26
	mov	2, %r14
	.word 0xa193a000  ! 3114: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9504000  ! 3115: RDPR_TNPC	<illegal instruction>
	.word 0xf615a0d9  ! 3116: LDUH_I	lduh	[%r22 + 0x00d9], %r27
	.word 0xfe0da14c  ! 3117: LDUB_I	ldub	[%r22 + 0x014c], %r31
	.word 0xfe54a11c  ! 3118: LDSH_I	ldsh	[%r18 + 0x011c], %r31
	.word 0x8795a0cf  ! 3124: WRPR_TT_I	wrpr	%r22, 0x00cf, %tt
	.word 0xbb500000  ! 3125: RDPR_TPC	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0xf6050000  ! 3130: LDUW_R	lduw	[%r20 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 3131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	.word 0xfe14e1d1  ! 3136: LDUH_I	lduh	[%r19 + 0x01d1], %r31
	.word 0xf044e19a  ! 3139: LDSW_I	ldsw	[%r19 + 0x019a], %r24
	.word 0xb3480000  ! 3141: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf25561ce  ! 3144: LDSH_I	ldsh	[%r21 + 0x01ce], %r25
	setx	data_start_5, %g1, %r22
	.word 0xb805c000  ! 3150: ADD_R	add 	%r23, %r0, %r28
	.word 0xbd508000  ! 3156: RDPR_TSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r21
	.word 0xb285e1ef  ! 3163: ADDcc_I	addcc 	%r23, 0x01ef, %r25
	.word 0xb351c000  ! 3164: RDPR_TL	<illegal instruction>
	.word 0xbb480000  ! 3171: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf40d60d0  ! 3176: LDUB_I	ldub	[%r21 + 0x00d0], %r26
	setx	0x20300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xf4558000  ! 3181: LDSH_R	ldsh	[%r22 + %r0], %r26
	mov	1, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf81da03a  ! 3186: LDD_I	ldd	[%r22 + 0x003a], %r28
	.word 0xb634c000  ! 3187: SUBC_R	orn 	%r19, %r0, %r27
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44c6077  ! 3195: LDSB_I	ldsb	[%r17 + 0x0077], %r26
	.word 0xf845e1f3  ! 3197: LDSW_I	ldsw	[%r23 + 0x01f3], %r28
	.word 0xfe046000  ! 3201: LDUW_I	lduw	[%r17 + 0x0000], %r31
	.word 0xf44de173  ! 3208: LDSB_I	ldsb	[%r23 + 0x0173], %r26
	.word 0xb32d4000  ! 3209: SLL_R	sll 	%r21, %r0, %r25
	.word 0xb1508000  ! 3210: RDPR_TSTATE	<illegal instruction>
	.word 0xfa450000  ! 3211: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xf0144000  ! 3212: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf44de04c  ! 3213: LDSB_I	ldsb	[%r23 + 0x004c], %r26
	setx	data_start_5, %g1, %r21
	.word 0xf0550000  ! 3216: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xfc04a033  ! 3217: LDUW_I	lduw	[%r18 + 0x0033], %r30
	setx	data_start_4, %g1, %r17
	.word 0xb684607a  ! 3219: ADDcc_I	addcc 	%r17, 0x007a, %r27
	.word 0xbc34c000  ! 3221: ORN_R	orn 	%r19, %r0, %r30
	.word 0xbf3c2001  ! 3223: SRA_I	sra 	%r16, 0x0001, %r31
	setx	data_start_3, %g1, %r18
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6050000  ! 3227: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xb751c000  ! 3231: RDPR_TL	<illegal instruction>
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00420f3  ! 3243: LDUW_I	lduw	[%r16 + 0x00f3], %r24
	.word 0xfa0da137  ! 3245: LDUB_I	ldub	[%r22 + 0x0137], %r29
	setx	0x10232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2142006  ! 3248: LDUH_I	lduh	[%r16 + 0x0006], %r25
	.word 0xbe8c4000  ! 3249: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xf205e029  ! 3251: LDUW_I	lduw	[%r23 + 0x0029], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa444000  ! 3262: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0x8195e0b3  ! 3264: WRPR_TPC_I	wrpr	%r23, 0x00b3, %tpc
	.word 0xf8440000  ! 3267: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xf815e182  ! 3271: LDUH_I	lduh	[%r23 + 0x0182], %r28
	.word 0x8595a02a  ! 3272: WRPR_TSTATE_I	wrpr	%r22, 0x002a, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982c0b  ! 3284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0b, %hpstate
	.word 0xf40c61a8  ! 3285: LDUB_I	ldub	[%r17 + 0x01a8], %r26
	.word 0xb57c8400  ! 3289: MOVR_R	movre	%r18, %r0, %r26
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d4000  ! 3292: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xf40ce1e4  ! 3297: LDUB_I	ldub	[%r19 + 0x01e4], %r26
	.word 0xfa44c000  ! 3298: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xfe0d4000  ! 3299: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf6558000  ! 3300: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xfa0ce00e  ! 3304: LDUB_I	ldub	[%r19 + 0x000e], %r29
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60c8000  ! 3313: LDUB_R	ldub	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d95a087  ! 3319: WRPR_PSTATE_I	wrpr	%r22, 0x0087, %pstate
	.word 0xb7520000  ! 3320: RDPR_PIL	<illegal instruction>
	.word 0xb5518000  ! 3324: RDPR_PSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r20
	.word 0xb7643801  ! 3331: MOVcc_I	<illegal instruction>
	.word 0x8d956004  ! 3332: WRPR_PSTATE_I	wrpr	%r21, 0x0004, %pstate
	setx	0x1032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a111  ! 3335: WRPR_PSTATE_I	wrpr	%r18, 0x0111, %pstate
	.word 0xb951c000  ! 3336: RDPR_TL	<illegal instruction>
	.word 0xbe0c6185  ! 3337: AND_I	and 	%r17, 0x0185, %r31
	.word 0xb7510000  ! 3339: RDPR_TICK	<illegal instruction>
	.word 0xb23421e4  ! 3341: SUBC_I	orn 	%r16, 0x01e4, %r25
	.word 0xf80ca0a2  ! 3344: LDUB_I	ldub	[%r18 + 0x00a2], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 3345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xf644609d  ! 3346: LDSW_I	ldsw	[%r17 + 0x009d], %r27
	.word 0xf71c0000  ! 3347: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xfe15c000  ! 3348: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xfc5d614d  ! 3352: LDX_I	ldx	[%r21 + 0x014d], %r30
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	.word 0x9194a0a2  ! 3357: WRPR_PIL_I	wrpr	%r18, 0x00a2, %pil
	.word 0xfc4c4000  ! 3358: LDSB_R	ldsb	[%r17 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982c91  ! 3360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c91, %hpstate
	.word 0xb02dc000  ! 3364: ANDN_R	andn 	%r23, %r0, %r24
	mov	2, %r14
	.word 0xa193a000  ! 3367: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf50c000  ! 3377: RDPR_TT	<illegal instruction>
	.word 0xfe1c20c2  ! 3378: LDD_I	ldd	[%r16 + 0x00c2], %r31
	.word 0xfe440000  ! 3382: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xfc5ca11d  ! 3383: LDX_I	ldx	[%r18 + 0x011d], %r30
	.word 0xbaadc000  ! 3385: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xf71d21c5  ! 3386: LDDF_I	ldd	[%r20, 0x01c5], %f27
	.word 0x8d95a1e7  ! 3387: WRPR_PSTATE_I	wrpr	%r22, 0x01e7, %pstate
	.word 0xfd1c0000  ! 3388: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0x8d95a11a  ! 3391: WRPR_PSTATE_I	wrpr	%r22, 0x011a, %pstate
	.word 0xb7500000  ! 3392: RDPR_TPC	<illegal instruction>
	.word 0xfa55e11b  ! 3394: LDSH_I	ldsh	[%r23 + 0x011b], %r29
	.word 0xfe050000  ! 3397: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xb77d6401  ! 3398: MOVR_I	movre	%r21, 0x1, %r27
	.word 0x8395a043  ! 3400: WRPR_TNPC_I	wrpr	%r22, 0x0043, %tnpc
	.word 0xfe456037  ! 3401: LDSW_I	ldsw	[%r21 + 0x0037], %r31
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4420de  ! 3403: LDSW_I	ldsw	[%r16 + 0x00de], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983a99  ! 3408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a99, %hpstate
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc454000  ! 3416: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xfc05a179  ! 3418: LDUW_I	lduw	[%r22 + 0x0179], %r30
	.word 0xb1540000  ! 3421: RDPR_GL	<illegal instruction>
	.word 0xf0550000  ! 3426: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xbb518000  ! 3428: RDPR_PSTATE	<illegal instruction>
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ad8000  ! 3432: ANDNcc_R	andncc 	%r22, %r0, %r28
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80521d5  ! 3435: LDUW_I	lduw	[%r20 + 0x01d5], %r28
	setx	data_start_5, %g1, %r22
	.word 0xf31c6055  ! 3444: LDDF_I	ldd	[%r17, 0x0055], %f25
	.word 0xb0a460ec  ! 3445: SUBcc_I	subcc 	%r17, 0x00ec, %r24
	.word 0x8794e10b  ! 3449: WRPR_TT_I	wrpr	%r19, 0x010b, %tt
	mov	2, %r14
	.word 0xa193a000  ! 3451: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa4cc000  ! 3453: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xfa45e0a4  ! 3455: LDSW_I	ldsw	[%r23 + 0x00a4], %r29
	.word 0xbb508000  ! 3460: RDPR_TSTATE	<illegal instruction>
	.word 0xf844a0dc  ! 3461: LDSW_I	ldsw	[%r18 + 0x00dc], %r28
	.word 0x8195e056  ! 3463: WRPR_TPC_I	wrpr	%r23, 0x0056, %tpc
	.word 0xbd508000  ! 3464: RDPR_TSTATE	<illegal instruction>
	.word 0x8595204f  ! 3467: WRPR_TSTATE_I	wrpr	%r20, 0x004f, %tstate
	mov	1, %r14
	.word 0xa193a000  ! 3470: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb500000  ! 3471: RDPR_TPC	<illegal instruction>
	.word 0xb2940000  ! 3472: ORcc_R	orcc 	%r16, %r0, %r25
	.word 0xb2c521fb  ! 3473: ADDCcc_I	addccc 	%r20, 0x01fb, %r25
	.word 0xfe1d60fc  ! 3476: LDD_I	ldd	[%r21 + 0x00fc], %r31
	setx	data_start_0, %g1, %r18
	.word 0xf05d0000  ! 3481: LDX_R	ldx	[%r20 + %r0], %r24
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e0a8  ! 3485: WRPR_TT_I	wrpr	%r19, 0x00a8, %tt
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a0ed  ! 3488: WRPR_TPC_I	wrpr	%r18, 0x00ed, %tpc
	.word 0x8795e122  ! 3492: WRPR_TT_I	wrpr	%r23, 0x0122, %tt
	.word 0xf05d6076  ! 3494: LDX_I	ldx	[%r21 + 0x0076], %r24
	.word 0xfa4cc000  ! 3496: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xf91c201b  ! 3499: LDDF_I	ldd	[%r16, 0x001b], %f28
	.word 0xb235c000  ! 3503: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xf01c8000  ! 3507: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xbb51c000  ! 3508: RDPR_TL	<illegal instruction>
	.word 0xb8bc0000  ! 3511: XNORcc_R	xnorcc 	%r16, %r0, %r28
	.word 0xb5508000  ! 3515: RDPR_TSTATE	<illegal instruction>
	.word 0xb0a40000  ! 3517: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0xbc1c8000  ! 3518: XOR_R	xor 	%r18, %r0, %r30
	.word 0xfa55c000  ! 3521: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0x8994e196  ! 3522: WRPR_TICK_I	wrpr	%r19, 0x0196, %tick
	.word 0xf65c0000  ! 3524: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xb00d210c  ! 3527: AND_I	and 	%r20, 0x010c, %r24
	.word 0xf2458000  ! 3529: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0x8d952093  ! 3530: WRPR_PSTATE_I	wrpr	%r20, 0x0093, %pstate
	.word 0xb93d6001  ! 3531: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xf60560f5  ! 3532: LDUW_I	lduw	[%r21 + 0x00f5], %r27
	.word 0xbea48000  ! 3533: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xf4144000  ! 3535: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xbb504000  ! 3536: RDPR_TNPC	<illegal instruction>
	.word 0xbb480000  ! 3537: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf0458000  ! 3541: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xbf504000  ! 3543: RDPR_TNPC	<illegal instruction>
	.word 0x9195a178  ! 3546: WRPR_PIL_I	wrpr	%r22, 0x0178, %pil
	.word 0x9194a024  ! 3547: WRPR_PIL_I	wrpr	%r18, 0x0024, %pil
	.word 0xf445c000  ! 3548: LDSW_R	ldsw	[%r23 + %r0], %r26
	setx	0x10, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65dc000  ! 3550: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf61d4000  ! 3553: LDD_R	ldd	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982f99  ! 3555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0xb814e0cc  ! 3557: OR_I	or 	%r19, 0x00cc, %r28
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41de0d6  ! 3563: LDD_I	ldd	[%r23 + 0x00d6], %r26
	.word 0xb83ce1d1  ! 3564: XNOR_I	xnor 	%r19, 0x01d1, %r28
	.word 0xf41c21b4  ! 3571: LDD_I	ldd	[%r16 + 0x01b4], %r26
	.word 0xf61ce133  ! 3572: LDD_I	ldd	[%r19 + 0x0133], %r27
	.word 0xf44d21e4  ! 3578: LDSB_I	ldsb	[%r20 + 0x01e4], %r26
	.word 0xfd1ce020  ! 3581: LDDF_I	ldd	[%r19, 0x0020], %f30
	.word 0xf8040000  ! 3582: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf64de109  ! 3588: LDSB_I	ldsb	[%r23 + 0x0109], %r27
	.word 0xb53c9000  ! 3589: SRAX_R	srax	%r18, %r0, %r26
	.word 0x8994e144  ! 3590: WRPR_TICK_I	wrpr	%r19, 0x0144, %tick
	.word 0xf444c000  ! 3591: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xfa4da1a0  ! 3592: LDSB_I	ldsb	[%r22 + 0x01a0], %r29
	.word 0xb335d000  ! 3597: SRLX_R	srlx	%r23, %r0, %r25
	.word 0xf2150000  ! 3602: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xb5641800  ! 3604: MOVcc_R	<illegal instruction>
	.word 0xf404a140  ! 3611: LDUW_I	lduw	[%r18 + 0x0140], %r26
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04c6191  ! 3615: LDSB_I	ldsb	[%r17 + 0x0191], %r24
	.word 0x8d9461b3  ! 3616: WRPR_PSTATE_I	wrpr	%r17, 0x01b3, %pstate
	.word 0xb894e079  ! 3617: ORcc_I	orcc 	%r19, 0x0079, %r28
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e17d  ! 3625: WRPR_TICK_I	wrpr	%r23, 0x017d, %tick
	.word 0xb3357001  ! 3630: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xf24ca0d1  ! 3635: LDSB_I	ldsb	[%r18 + 0x00d1], %r25
	.word 0xfa040000  ! 3636: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0x8395e1f4  ! 3639: WRPR_TNPC_I	wrpr	%r23, 0x01f4, %tnpc
	.word 0xfc15c000  ! 3640: LDUH_R	lduh	[%r23 + %r0], %r30
	mov	1, %r14
	.word 0xa193a000  ! 3642: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe4cc000  ! 3643: LDSB_R	ldsb	[%r19 + %r0], %r31
	setx	0x20203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1d0000  ! 3645: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xb8b42176  ! 3649: SUBCcc_I	orncc 	%r16, 0x0176, %r28
	.word 0xfe0ca1a5  ! 3655: LDUB_I	ldub	[%r18 + 0x01a5], %r31
	setx	0x2011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2554000  ! 3660: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xb950c000  ! 3665: RDPR_TT	<illegal instruction>
	.word 0xf40ca1b3  ! 3669: LDUB_I	ldub	[%r18 + 0x01b3], %r26
	.word 0xfa540000  ! 3674: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0x9195a0e1  ! 3675: WRPR_PIL_I	wrpr	%r22, 0x00e1, %pil
	mov	2, %r14
	.word 0xa193a000  ! 3678: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982cc1  ! 3679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc1, %hpstate
	.word 0xf01ca0b9  ! 3681: LDD_I	ldd	[%r18 + 0x00b9], %r24
	.word 0xf05da14f  ! 3684: LDX_I	ldx	[%r22 + 0x014f], %r24
	.word 0x9195a16d  ! 3689: WRPR_PIL_I	wrpr	%r22, 0x016d, %pil
	.word 0xb12dc000  ! 3690: SLL_R	sll 	%r23, %r0, %r24
	.word 0xf40521a7  ! 3691: LDUW_I	lduw	[%r20 + 0x01a7], %r26
	.word 0xf91c4000  ! 3692: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf51d21ca  ! 3695: LDDF_I	ldd	[%r20, 0x01ca], %f26
	.word 0xf8552063  ! 3696: LDSH_I	ldsh	[%r20 + 0x0063], %r28
	mov	2, %r14
	.word 0xa193a000  ! 3698: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8394a0b4  ! 3699: WRPR_TNPC_I	wrpr	%r18, 0x00b4, %tnpc
	.word 0xf414e19a  ! 3700: LDUH_I	lduh	[%r19 + 0x019a], %r26
	.word 0x879461f4  ! 3701: WRPR_TT_I	wrpr	%r17, 0x01f4, %tt
	.word 0xbb7c4400  ! 3706: MOVR_R	movre	%r17, %r0, %r29
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00de112  ! 3711: LDUB_I	ldub	[%r23 + 0x0112], %r24
	.word 0xf80d61c5  ! 3712: LDUB_I	ldub	[%r21 + 0x01c5], %r28
	setx	data_start_6, %g1, %r18
	.word 0xb4340000  ! 3714: ORN_R	orn 	%r16, %r0, %r26
	mov	0, %r12
	.word 0x8f932000  ! 3715: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf500000  ! 3717: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3718: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3540000  ! 3721: RDPR_GL	<illegal instruction>
	.word 0xfa452048  ! 3723: LDSW_I	ldsw	[%r20 + 0x0048], %r29
	setx	0x20316, %g1, %o0
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
	.word 0xf85d209f  ! 3733: LDX_I	ldx	[%r20 + 0x009f], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3cc000  ! 3744: SRA_R	sra 	%r19, %r0, %r30
	setx	data_start_4, %g1, %r16
	.word 0xf605c000  ! 3750: LDUW_R	lduw	[%r23 + %r0], %r27
	setx	data_start_4, %g1, %r17
	.word 0xfa150000  ! 3752: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf61cc000  ! 3755: LDD_R	ldd	[%r19 + %r0], %r27
	setx	data_start_0, %g1, %r16
	.word 0xf845607f  ! 3758: LDSW_I	ldsw	[%r21 + 0x007f], %r28
	.word 0xfb1ce026  ! 3763: LDDF_I	ldd	[%r19, 0x0026], %f29
	.word 0xb7500000  ! 3765: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x8d9520f7  ! 3769: WRPR_PSTATE_I	wrpr	%r20, 0x00f7, %pstate
	.word 0xfc05214a  ! 3770: LDUW_I	lduw	[%r20 + 0x014a], %r30
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31d60a6  ! 3773: LDDF_I	ldd	[%r21, 0x00a6], %f25
	.word 0xfc45215a  ! 3779: LDSW_I	ldsw	[%r20 + 0x015a], %r30
	.word 0xfc448000  ! 3785: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xfe04e019  ! 3787: LDUW_I	lduw	[%r19 + 0x0019], %r31
	.word 0xba042050  ! 3792: ADD_I	add 	%r16, 0x0050, %r29
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0bce11c  ! 3800: XNORcc_I	xnorcc 	%r19, 0x011c, %r24
	.word 0xbd500000  ! 3807: RDPR_TPC	<illegal instruction>
	.word 0x87946088  ! 3808: WRPR_TT_I	wrpr	%r17, 0x0088, %tt
	.word 0xb77c2401  ! 3810: MOVR_I	movre	%r16, 0x1, %r27
	setx	0x10214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf405c000  ! 3818: LDUW_R	lduw	[%r23 + %r0], %r26
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf414214e  ! 3820: LDUH_I	lduh	[%r16 + 0x014e], %r26
	mov	2, %r14
	.word 0xa193a000  ! 3825: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb934d000  ! 3829: SRLX_R	srlx	%r19, %r0, %r28
	.word 0xb1500000  ! 3831: RDPR_TPC	<illegal instruction>
	.word 0x9194a059  ! 3832: WRPR_PIL_I	wrpr	%r18, 0x0059, %pil
	.word 0xf51c0000  ! 3833: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf01d4000  ! 3835: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0x9195a193  ! 3836: WRPR_PIL_I	wrpr	%r22, 0x0193, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983f0b  ! 3837: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0b, %hpstate
	.word 0xf41ce0bc  ! 3838: LDD_I	ldd	[%r19 + 0x00bc], %r26
	.word 0xf84c6143  ! 3841: LDSB_I	ldsb	[%r17 + 0x0143], %r28
	.word 0xfa54a1ca  ! 3847: LDSH_I	ldsh	[%r18 + 0x01ca], %r29
	.word 0xfa4d8000  ! 3849: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf04d2192  ! 3852: LDSB_I	ldsb	[%r20 + 0x0192], %r24
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 3855: MOVcc_I	<illegal instruction>
	.word 0xfc0561ac  ! 3857: LDUW_I	lduw	[%r21 + 0x01ac], %r30
	.word 0x839560d4  ! 3859: WRPR_TNPC_I	wrpr	%r21, 0x00d4, %tnpc
	.word 0xfc05a089  ! 3860: LDUW_I	lduw	[%r22 + 0x0089], %r30
	.word 0xbcb4a087  ! 3864: SUBCcc_I	orncc 	%r18, 0x0087, %r30
	.word 0xf2454000  ! 3865: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf91d8000  ! 3867: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xfc5d6124  ! 3868: LDX_I	ldx	[%r21 + 0x0124], %r30
	.word 0x8394e12e  ! 3870: WRPR_TNPC_I	wrpr	%r19, 0x012e, %tnpc
	.word 0xb1518000  ! 3871: RDPR_PSTATE	<illegal instruction>
	.word 0xf655a01d  ! 3872: LDSH_I	ldsh	[%r22 + 0x001d], %r27
	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31de1ce  ! 3882: LDDF_I	ldd	[%r23, 0x01ce], %f25
	.word 0xbc0c0000  ! 3884: AND_R	and 	%r16, %r0, %r30
	.word 0xf24ca08a  ! 3889: LDSB_I	ldsb	[%r18 + 0x008a], %r25
	setx	0x1a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4444000  ! 3895: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xfe040000  ! 3899: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xfc550000  ! 3901: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0x87952079  ! 3906: WRPR_TT_I	wrpr	%r20, 0x0079, %tt
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8454000  ! 3908: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf2054000  ! 3911: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf45d6123  ! 3912: LDX_I	ldx	[%r21 + 0x0123], %r26
	.word 0xfe140000  ! 3915: LDUH_R	lduh	[%r16 + %r0], %r31
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994615c  ! 3921: WRPR_TICK_I	wrpr	%r17, 0x015c, %tick
	ta	T_CHANGE_HPRIV
	.word 0x819829d1  ! 3922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d1, %hpstate
	.word 0x87956149  ! 3925: WRPR_TT_I	wrpr	%r21, 0x0149, %tt
	.word 0xb52ce001  ! 3926: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xfc4c61b1  ! 3933: LDSB_I	ldsb	[%r17 + 0x01b1], %r30
	.word 0xf84da084  ! 3934: LDSB_I	ldsb	[%r22 + 0x0084], %r28
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 3936: RDPR_TL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 3937: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc0cc000  ! 3939: LDUB_R	ldub	[%r19 + %r0], %r30
	setx	0x327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf215c000  ! 3952: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf40c8000  ! 3953: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xf014a1fc  ! 3955: LDUH_I	lduh	[%r18 + 0x01fc], %r24
	.word 0xf25460a2  ! 3956: LDSH_I	ldsh	[%r17 + 0x00a2], %r25
	.word 0xfa0ce140  ! 3963: LDUB_I	ldub	[%r19 + 0x0140], %r29
	setx	0x2030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85cc000  ! 3967: LDX_R	ldx	[%r19 + %r0], %r28
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11c0000  ! 3973: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0x87942170  ! 3975: WRPR_TT_I	wrpr	%r16, 0x0170, %tt
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64de081  ! 3981: LDSB_I	ldsb	[%r23 + 0x0081], %r27
	setx	data_start_1, %g1, %r23
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e0ac  ! 3987: WRPR_TSTATE_I	wrpr	%r23, 0x00ac, %tstate
	.word 0xb4b50000  ! 3990: SUBCcc_R	orncc 	%r20, %r0, %r26
	setx	data_start_1, %g1, %r17
	.word 0xf65d4000  ! 3992: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf61da06d  ! 3997: LDD_I	ldd	[%r22 + 0x006d], %r27
	.word 0xfc4561cf  ! 4005: LDSW_I	ldsw	[%r21 + 0x01cf], %r30
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1d21ef  ! 4012: LDDF_I	ldd	[%r20, 0x01ef], %f31
	.word 0xf80ca1b4  ! 4015: LDUB_I	ldub	[%r18 + 0x01b4], %r28
	setx	0x21, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4d4000  ! 4021: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf644e11b  ! 4022: LDSW_I	ldsw	[%r19 + 0x011b], %r27
	.word 0xbd510000  ! 4023: RDPR_TICK	<illegal instruction>
	.word 0xb4858000  ! 4026: ADDcc_R	addcc 	%r22, %r0, %r26
	.word 0xba05e071  ! 4027: ADD_I	add 	%r23, 0x0071, %r29
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2c209d  ! 4036: ANDN_I	andn 	%r16, 0x009d, %r29
	.word 0xfc1ce0df  ! 4038: LDD_I	ldd	[%r19 + 0x00df], %r30
	mov	1, %r14
	.word 0xa193a000  ! 4044: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8c560e2  ! 4048: ADDCcc_I	addccc 	%r21, 0x00e2, %r28
	setx	data_start_0, %g1, %r19
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5520a5  ! 4053: LDSH_I	ldsh	[%r20 + 0x00a5], %r29
	setx	data_start_5, %g1, %r23
	.word 0xfa05e0e1  ! 4058: LDUW_I	lduw	[%r23 + 0x00e1], %r29
	.word 0xbd2cc000  ! 4059: SLL_R	sll 	%r19, %r0, %r30
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3d7001  ! 4070: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xf65421a7  ! 4071: LDSH_I	ldsh	[%r16 + 0x01a7], %r27
	.word 0xff1d61af  ! 4073: LDDF_I	ldd	[%r21, 0x01af], %f31
	.word 0xf25c4000  ! 4077: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf4148000  ! 4078: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfe54216c  ! 4083: LDSH_I	ldsh	[%r16 + 0x016c], %r31
	.word 0x89952026  ! 4084: WRPR_TICK_I	wrpr	%r20, 0x0026, %tick
	.word 0xfc1c209e  ! 4087: LDD_I	ldd	[%r16 + 0x009e], %r30
	.word 0xf4158000  ! 4088: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xf84da19a  ! 4089: LDSB_I	ldsb	[%r22 + 0x019a], %r28
	.word 0xbb518000  ! 4091: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfe0c202a  ! 4093: LDUB_I	ldub	[%r16 + 0x002a], %r31
	.word 0xf4458000  ! 4095: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf40cc000  ! 4099: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xfa4d2140  ! 4102: LDSB_I	ldsb	[%r20 + 0x0140], %r29
	.word 0xfc05e188  ! 4104: LDUW_I	lduw	[%r23 + 0x0188], %r30
	.word 0x8594a0a3  ! 4105: WRPR_TSTATE_I	wrpr	%r18, 0x00a3, %tstate
	.word 0xf11ca01e  ! 4106: LDDF_I	ldd	[%r18, 0x001e], %f24
	.word 0xf11c0000  ! 4109: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xfc1ca16e  ! 4112: LDD_I	ldd	[%r18 + 0x016e], %r30
	.word 0xb9508000  ! 4113: RDPR_TSTATE	<illegal instruction>
	.word 0xbec461b4  ! 4115: ADDCcc_I	addccc 	%r17, 0x01b4, %r31
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2844000  ! 4120: ADDcc_R	addcc 	%r17, %r0, %r25
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 4125: RDPR_PIL	<illegal instruction>
	.word 0xf45c20a2  ! 4126: LDX_I	ldx	[%r16 + 0x00a2], %r26
	.word 0xf604c000  ! 4128: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xf84ca110  ! 4129: LDSB_I	ldsb	[%r18 + 0x0110], %r28
	.word 0xb3510000  ! 4134: RDPR_TICK	<illegal instruction>
	.word 0xf60d0000  ! 4135: LDUB_R	ldub	[%r20 + %r0], %r27
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5de1de  ! 4146: LDX_I	ldx	[%r23 + 0x01de], %r30
	.word 0xbb2c3001  ! 4147: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xfa550000  ! 4149: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xb9520000  ! 4150: RDPR_PIL	<illegal instruction>
	.word 0x87956054  ! 4154: WRPR_TT_I	wrpr	%r21, 0x0054, %tt
	.word 0xf2448000  ! 4157: LDSW_R	ldsw	[%r18 + %r0], %r25
	setx	0x1002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65d60e7  ! 4165: LDX_I	ldx	[%r21 + 0x00e7], %r27
	.word 0xfa4520bb  ! 4167: LDSW_I	ldsw	[%r20 + 0x00bb], %r29
	.word 0xb8ac0000  ! 4168: ANDNcc_R	andncc 	%r16, %r0, %r28
	setx	0x2022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 4171: MOVcc_R	<illegal instruction>
	.word 0xf80c4000  ! 4172: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xfe0d4000  ! 4174: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xb2850000  ! 4176: ADDcc_R	addcc 	%r20, %r0, %r25
	.word 0xfe0da016  ! 4178: LDUB_I	ldub	[%r22 + 0x0016], %r31
	.word 0xbe34a1ef  ! 4179: SUBC_I	orn 	%r18, 0x01ef, %r31
	.word 0xbd35a001  ! 4180: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xf21d0000  ! 4187: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xfa45c000  ! 4188: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xb150c000  ! 4189: RDPR_TT	<illegal instruction>
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4198: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_2, %g1, %r17
	.word 0xbb50c000  ! 4201: RDPR_TT	<illegal instruction>
	.word 0x8195a086  ! 4204: WRPR_TPC_I	wrpr	%r22, 0x0086, %tpc
	.word 0xf40c60a7  ! 4205: LDUB_I	ldub	[%r17 + 0x00a7], %r26
	.word 0xf444a1f7  ! 4207: LDSW_I	ldsw	[%r18 + 0x01f7], %r26
	.word 0xf21d8000  ! 4211: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0x8395a0b5  ! 4213: WRPR_TNPC_I	wrpr	%r22, 0x00b5, %tnpc
	.word 0xb034200e  ! 4214: SUBC_I	orn 	%r16, 0x000e, %r24
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8140000  ! 4217: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xb2c4c000  ! 4220: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0xf45de1b3  ! 4227: LDX_I	ldx	[%r23 + 0x01b3], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b8b  ! 4229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8b, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 4230: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa5cc000  ! 4234: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0x8395206e  ! 4235: WRPR_TNPC_I	wrpr	%r20, 0x006e, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983d0b  ! 4237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a165  ! 4240: WRPR_PIL_I	wrpr	%r22, 0x0165, %pil
	.word 0xb00de108  ! 4243: AND_I	and 	%r23, 0x0108, %r24
	.word 0xb8358000  ! 4244: ORN_R	orn 	%r22, %r0, %r28
	.word 0xfc1c20ef  ! 4246: LDD_I	ldd	[%r16 + 0x00ef], %r30
	.word 0x9195e08a  ! 4249: WRPR_PIL_I	wrpr	%r23, 0x008a, %pil
	.word 0xfa15c000  ! 4252: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xba15a15b  ! 4255: OR_I	or 	%r22, 0x015b, %r29
	.word 0xbd358000  ! 4256: SRL_R	srl 	%r22, %r0, %r30
	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0ce045  ! 4259: LDUB_I	ldub	[%r19 + 0x0045], %r30
	.word 0xf04c8000  ! 4260: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xf854e158  ! 4262: LDSH_I	ldsh	[%r19 + 0x0158], %r28
	.word 0xf4054000  ! 4271: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xf0158000  ! 4275: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0x819420c4  ! 4276: WRPR_TPC_I	wrpr	%r16, 0x00c4, %tpc
	.word 0x8594e09c  ! 4278: WRPR_TSTATE_I	wrpr	%r19, 0x009c, %tstate
	.word 0xfe454000  ! 4284: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfc5dc000  ! 4287: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xb845612e  ! 4289: ADDC_I	addc 	%r21, 0x012e, %r28
	.word 0xb351c000  ! 4292: RDPR_TL	<illegal instruction>
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6054000  ! 4300: LDUW_R	lduw	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84cc000  ! 4311: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf0154000  ! 4318: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0x8195a13f  ! 4319: WRPR_TPC_I	wrpr	%r22, 0x013f, %tpc
	.word 0xf04d0000  ! 4320: LDSB_R	ldsb	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983cc3  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc3, %hpstate
	.word 0xf51d0000  ! 4322: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xf24ca132  ! 4325: LDSB_I	ldsb	[%r18 + 0x0132], %r25
	.word 0xfe4ca054  ! 4326: LDSB_I	ldsb	[%r18 + 0x0054], %r31
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 4331: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf8454000  ! 4332: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xbd520000  ! 4334: RDPR_PIL	<illegal instruction>
	.word 0xfa04e153  ! 4337: LDUW_I	lduw	[%r19 + 0x0153], %r29
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a072  ! 4343: WRPR_TPC_I	wrpr	%r18, 0x0072, %tpc
	.word 0xf11cc000  ! 4346: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0x81952069  ! 4347: WRPR_TPC_I	wrpr	%r20, 0x0069, %tpc
	.word 0x8995e141  ! 4354: WRPR_TICK_I	wrpr	%r23, 0x0141, %tick
	.word 0xfc04c000  ! 4355: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0x8194e017  ! 4358: WRPR_TPC_I	wrpr	%r19, 0x0017, %tpc
	.word 0x8d95600c  ! 4359: WRPR_PSTATE_I	wrpr	%r21, 0x000c, %pstate
	setx	data_start_5, %g1, %r19
	.word 0xbe9c6154  ! 4364: XORcc_I	xorcc 	%r17, 0x0154, %r31
	.word 0xfa540000  ! 4366: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xb32cd000  ! 4367: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xfe044000  ! 4369: LDUW_R	lduw	[%r17 + %r0], %r31
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05ca0c3  ! 4377: LDX_I	ldx	[%r18 + 0x00c3], %r24
	.word 0x8d956130  ! 4383: WRPR_PSTATE_I	wrpr	%r21, 0x0130, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e93  ! 4388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e93, %hpstate
	.word 0xf8544000  ! 4392: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xf00de1da  ! 4393: LDUB_I	ldub	[%r23 + 0x01da], %r24
	.word 0xb950c000  ! 4396: RDPR_TT	<illegal instruction>
	.word 0xf51c20fa  ! 4398: LDDF_I	ldd	[%r16, 0x00fa], %f26
	.word 0xb9540000  ! 4399: RDPR_GL	<illegal instruction>
	.word 0xbe8c4000  ! 4401: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xb0044000  ! 4406: ADD_R	add 	%r17, %r0, %r24
	.word 0xf84dc000  ! 4408: LDSB_R	ldsb	[%r23 + %r0], %r28
	mov	1, %r14
	.word 0xa193a000  ! 4416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf415c000  ! 4419: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xfc44e193  ! 4422: LDSW_I	ldsw	[%r19 + 0x0193], %r30
	.word 0xf644c000  ! 4423: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xfe4561b8  ! 4426: LDSW_I	ldsw	[%r21 + 0x01b8], %r31
	.word 0xf4146179  ! 4430: LDUH_I	lduh	[%r17 + 0x0179], %r26
	.word 0xfe04e081  ! 4435: LDUW_I	lduw	[%r19 + 0x0081], %r31
	.word 0xfc5d8000  ! 4443: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xb48d0000  ! 4445: ANDcc_R	andcc 	%r20, %r0, %r26
	.word 0xf84420a8  ! 4454: LDSW_I	ldsw	[%r16 + 0x00a8], %r28
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 4461: RDPR_TT	<illegal instruction>
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb485a1ea  ! 4465: ADDcc_I	addcc 	%r22, 0x01ea, %r26
	setx	0x2012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40c4000  ! 4472: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf11d6147  ! 4473: LDDF_I	ldd	[%r21, 0x0147], %f24
	.word 0xf6044000  ! 4475: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xf45d2196  ! 4477: LDX_I	ldx	[%r20 + 0x0196], %r26
	.word 0xfc05c000  ! 4479: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf854c000  ! 4483: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xb3480000  ! 4484: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbf510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xf40c0000  ! 4486: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xbe2d0000  ! 4489: ANDN_R	andn 	%r20, %r0, %r31
	.word 0xb0ada1fa  ! 4492: ANDNcc_I	andncc 	%r22, 0x01fa, %r24
	.word 0xf8548000  ! 4495: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xbe8ce02a  ! 4496: ANDcc_I	andcc 	%r19, 0x002a, %r31
	.word 0x859460aa  ! 4498: WRPR_TSTATE_I	wrpr	%r17, 0x00aa, %tstate
	.word 0xf01561f2  ! 4500: LDUH_I	lduh	[%r21 + 0x01f2], %r24
	setx	0x2023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe54c000  ! 4502: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0x8d946105  ! 4505: WRPR_PSTATE_I	wrpr	%r17, 0x0105, %pstate
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5de004  ! 4514: LDX_I	ldx	[%r23 + 0x0004], %r31
	.word 0x8594210c  ! 4516: WRPR_TSTATE_I	wrpr	%r16, 0x010c, %tstate
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf414a15d  ! 4519: LDUH_I	lduh	[%r18 + 0x015d], %r26
	.word 0xb0ad6152  ! 4520: ANDNcc_I	andncc 	%r21, 0x0152, %r24
	.word 0xb40420b4  ! 4522: ADD_I	add 	%r16, 0x00b4, %r26
	.word 0xba840000  ! 4525: ADDcc_R	addcc 	%r16, %r0, %r29
	setx	data_start_5, %g1, %r21
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 4531: RDPR_GL	<illegal instruction>
	.word 0xf44cc000  ! 4533: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xbd510000  ! 4536: RDPR_TICK	<illegal instruction>
	.word 0xf85da079  ! 4541: LDX_I	ldx	[%r22 + 0x0079], %r28
	.word 0xf0148000  ! 4542: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0x9194a141  ! 4543: WRPR_PIL_I	wrpr	%r18, 0x0141, %pil
	.word 0xf00c8000  ! 4545: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf204a04d  ! 4550: LDUW_I	lduw	[%r18 + 0x004d], %r25
	.word 0xf21ce123  ! 4551: LDD_I	ldd	[%r19 + 0x0123], %r25
	.word 0xbd480000  ! 4554: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8d94e009  ! 4555: WRPR_PSTATE_I	wrpr	%r19, 0x0009, %pstate
	.word 0xfb1c4000  ! 4557: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xb151c000  ! 4560: RDPR_TL	rdpr	%tl, %r24
	.word 0xfa0c0000  ! 4562: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xfe5d21b1  ! 4569: LDX_I	ldx	[%r20 + 0x01b1], %r31
	.word 0x8794e07e  ! 4570: WRPR_TT_I	wrpr	%r19, 0x007e, %tt
	.word 0xfa54e162  ! 4575: LDSH_I	ldsh	[%r19 + 0x0162], %r29
	.word 0xfb1c8000  ! 4578: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xfc0de0c1  ! 4583: LDUB_I	ldub	[%r23 + 0x00c1], %r30
	.word 0xfe5c61b6  ! 4584: LDX_I	ldx	[%r17 + 0x01b6], %r31
	.word 0xb97c0400  ! 4594: MOVR_R	movre	%r16, %r0, %r28
	.word 0xfa048000  ! 4596: LDUW_R	lduw	[%r18 + %r0], %r29
	mov	0, %r12
	.word 0x8f932000  ! 4597: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5504000  ! 4598: RDPR_TNPC	<illegal instruction>
	.word 0xfc4ce12f  ! 4603: LDSB_I	ldsb	[%r19 + 0x012f], %r30
	.word 0xf4452137  ! 4604: LDSW_I	ldsw	[%r20 + 0x0137], %r26
	.word 0xf40c4000  ! 4605: LDUB_R	ldub	[%r17 + %r0], %r26
	setx	0x20315, %g1, %o0
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
	.word 0xfe0d2051  ! 4612: LDUB_I	ldub	[%r20 + 0x0051], %r31
	.word 0xfa0de108  ! 4614: LDUB_I	ldub	[%r23 + 0x0108], %r29
	.word 0xf61c4000  ! 4615: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xf01c2176  ! 4619: LDD_I	ldd	[%r16 + 0x0176], %r24
	.word 0xfe1521ed  ! 4621: LDUH_I	lduh	[%r20 + 0x01ed], %r31
	.word 0xb7349000  ! 4626: SRLX_R	srlx	%r18, %r0, %r27
	.word 0xfa15c000  ! 4627: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xf2450000  ! 4628: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xbd520000  ! 4629: RDPR_PIL	<illegal instruction>
	.word 0xfe54a067  ! 4632: LDSH_I	ldsh	[%r18 + 0x0067], %r31
	ta	T_CHANGE_HPRIV
	.word 0x819828c1  ! 4635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c1, %hpstate
	.word 0xb684a130  ! 4637: ADDcc_I	addcc 	%r18, 0x0130, %r27
	.word 0xb9540000  ! 4638: RDPR_GL	<illegal instruction>
	.word 0xf00420e0  ! 4640: LDUW_I	lduw	[%r16 + 0x00e0], %r24
	.word 0xf45d6171  ! 4641: LDX_I	ldx	[%r21 + 0x0171], %r26
	.word 0xbd350000  ! 4642: SRL_R	srl 	%r20, %r0, %r30
	.word 0xf01ce0c0  ! 4644: LDD_I	ldd	[%r19 + 0x00c0], %r24
	.word 0xb750c000  ! 4645: RDPR_TT	<illegal instruction>
	.word 0xb095a057  ! 4647: ORcc_I	orcc 	%r22, 0x0057, %r24
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbca58000  ! 4653: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xf2444000  ! 4660: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0x8595208a  ! 4663: WRPR_TSTATE_I	wrpr	%r20, 0x008a, %tstate
	.word 0xf24da1c9  ! 4664: LDSB_I	ldsb	[%r22 + 0x01c9], %r25
	.word 0xbd504000  ! 4665: RDPR_TNPC	<illegal instruction>
	.word 0xbd643801  ! 4667: MOVcc_I	<illegal instruction>
	setx	0x221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41461b7  ! 4670: LDUH_I	lduh	[%r17 + 0x01b7], %r26
	.word 0xb3500000  ! 4672: RDPR_TPC	<illegal instruction>
	.word 0xfc0d21f0  ! 4677: LDUB_I	ldub	[%r20 + 0x01f0], %r30
	.word 0xf51dc000  ! 4681: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xf45d0000  ! 4682: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0x8395a082  ! 4685: WRPR_TNPC_I	wrpr	%r22, 0x0082, %tnpc
	.word 0xf0444000  ! 4690: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0x8d95206c  ! 4695: WRPR_PSTATE_I	wrpr	%r20, 0x006c, %pstate
	.word 0xb7504000  ! 4697: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8195a06e  ! 4699: WRPR_TPC_I	wrpr	%r22, 0x006e, %tpc
	.word 0x8995e055  ! 4700: WRPR_TICK_I	wrpr	%r23, 0x0055, %tick
	.word 0xf44d21b6  ! 4701: LDSB_I	ldsb	[%r20 + 0x01b6], %r26
	.word 0x8795e01c  ! 4706: WRPR_TT_I	wrpr	%r23, 0x001c, %tt
	mov	1, %r14
	.word 0xa193a000  ! 4711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb894a14b  ! 4716: ORcc_I	orcc 	%r18, 0x014b, %r28
	mov	2, %r14
	.word 0xa193a000  ! 4720: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d9521f5  ! 4721: WRPR_PSTATE_I	wrpr	%r20, 0x01f5, %pstate
	setx	data_start_1, %g1, %r18
	setx	data_start_0, %g1, %r23
	.word 0xf40cc000  ! 4732: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xf41560d9  ! 4736: LDUH_I	lduh	[%r21 + 0x00d9], %r26
	.word 0xfe04211b  ! 4737: LDUW_I	lduw	[%r16 + 0x011b], %r31
	.word 0xfa5ca1de  ! 4740: LDX_I	ldx	[%r18 + 0x01de], %r29
	.word 0xf65c8000  ! 4743: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xb805a162  ! 4744: ADD_I	add 	%r22, 0x0162, %r28
	.word 0xbc35a0f5  ! 4745: SUBC_I	orn 	%r22, 0x00f5, %r30
	.word 0xf8142139  ! 4747: LDUH_I	lduh	[%r16 + 0x0139], %r28
	.word 0xb0346162  ! 4748: SUBC_I	orn 	%r17, 0x0162, %r24
	.word 0x899561ff  ! 4751: WRPR_TICK_I	wrpr	%r21, 0x01ff, %tick
	.word 0xf0552101  ! 4752: LDSH_I	ldsh	[%r20 + 0x0101], %r24
	.word 0x8395a134  ! 4755: WRPR_TNPC_I	wrpr	%r22, 0x0134, %tnpc
	.word 0xf01d0000  ! 4759: LDD_R	ldd	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983e01  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e01, %hpstate
	.word 0xf65420cf  ! 4763: LDSH_I	ldsh	[%r16 + 0x00cf], %r27
	.word 0x919421a6  ! 4765: WRPR_PIL_I	wrpr	%r16, 0x01a6, %pil
	.word 0xfa048000  ! 4767: LDUW_R	lduw	[%r18 + %r0], %r29
	setx	data_start_2, %g1, %r19
	.word 0xbb50c000  ! 4769: RDPR_TT	<illegal instruction>
	.word 0xf11de119  ! 4770: LDDF_I	ldd	[%r23, 0x0119], %f24
	.word 0xfe454000  ! 4775: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfc4dc000  ! 4776: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xf21d8000  ! 4779: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xbd34e001  ! 4781: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xfe44e048  ! 4784: LDSW_I	ldsw	[%r19 + 0x0048], %r31
	.word 0xb93c7001  ! 4785: SRAX_I	srax	%r17, 0x0001, %r28
	setx	data_start_4, %g1, %r23
	.word 0xfc4ce122  ! 4787: LDSB_I	ldsb	[%r19 + 0x0122], %r30
	.word 0x8794a134  ! 4794: WRPR_TT_I	wrpr	%r18, 0x0134, %tt
	.word 0xf015a0bf  ! 4796: LDUH_I	lduh	[%r22 + 0x00bf], %r24
	setx	data_start_0, %g1, %r22
	.word 0x8594a109  ! 4801: WRPR_TSTATE_I	wrpr	%r18, 0x0109, %tstate
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12cd000  ! 4804: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xfa1c60f5  ! 4805: LDD_I	ldd	[%r17 + 0x00f5], %r29
	.word 0xbd51c000  ! 4809: RDPR_TL	<illegal instruction>
	.word 0xf815e007  ! 4810: LDUH_I	lduh	[%r23 + 0x0007], %r28
	.word 0xb551c000  ! 4811: RDPR_TL	<illegal instruction>
	.word 0xf6058000  ! 4814: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xfa5ca084  ! 4819: LDX_I	ldx	[%r18 + 0x0084], %r29
	.word 0xfa1dc000  ! 4821: LDD_R	ldd	[%r23 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983a11  ! 4823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a11, %hpstate
	.word 0xb2446146  ! 4824: ADDC_I	addc 	%r17, 0x0146, %r25
	.word 0x8395612a  ! 4826: WRPR_TNPC_I	wrpr	%r21, 0x012a, %tnpc
	.word 0xf4050000  ! 4830: LDUW_R	lduw	[%r20 + %r0], %r26
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d8000  ! 4835: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xfc456030  ! 4837: LDSW_I	ldsw	[%r21 + 0x0030], %r30
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84ca166  ! 4841: LDSB_I	ldsb	[%r18 + 0x0166], %r28
	.word 0xbf518000  ! 4842: RDPR_PSTATE	<illegal instruction>
	.word 0xf65da119  ! 4847: LDX_I	ldx	[%r22 + 0x0119], %r27
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95611c  ! 4851: WRPR_PSTATE_I	wrpr	%r21, 0x011c, %pstate
	.word 0xb625a1fe  ! 4852: SUB_I	sub 	%r22, 0x01fe, %r27
	.word 0xf25ce11a  ! 4862: LDX_I	ldx	[%r19 + 0x011a], %r25
	.word 0xfc0ca020  ! 4867: LDUB_I	ldub	[%r18 + 0x0020], %r30
	.word 0xfe4da0d4  ! 4868: LDSB_I	ldsb	[%r22 + 0x00d4], %r31
	.word 0xb495a0cb  ! 4870: ORcc_I	orcc 	%r22, 0x00cb, %r26
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa146182  ! 4877: LDUH_I	lduh	[%r17 + 0x0182], %r29
	.word 0xfa5c8000  ! 4878: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf815c000  ! 4880: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xfc54a068  ! 4882: LDSH_I	ldsh	[%r18 + 0x0068], %r30
	.word 0xf44ca162  ! 4888: LDSB_I	ldsb	[%r18 + 0x0162], %r26
	.word 0x9194a112  ! 4892: WRPR_PIL_I	wrpr	%r18, 0x0112, %pil
	.word 0xbf51c000  ! 4893: RDPR_TL	<illegal instruction>
	.word 0xb551c000  ! 4895: RDPR_TL	<illegal instruction>
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d8000  ! 4904: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xbc8d0000  ! 4907: ANDcc_R	andcc 	%r20, %r0, %r30
	.word 0x8395a060  ! 4908: WRPR_TNPC_I	wrpr	%r22, 0x0060, %tnpc
	.word 0xfe0461d7  ! 4910: LDUW_I	lduw	[%r17 + 0x01d7], %r31
	.word 0xbb500000  ! 4913: RDPR_TPC	<illegal instruction>
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb01ce156  ! 4922: XOR_I	xor 	%r19, 0x0156, %r24
	.word 0xfe05a17c  ! 4925: LDUW_I	lduw	[%r22 + 0x017c], %r31
	.word 0xf85cc000  ! 4926: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xb29ce090  ! 4928: XORcc_I	xorcc 	%r19, 0x0090, %r25
	.word 0xf11cc000  ! 4934: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0x85952119  ! 4936: WRPR_TSTATE_I	wrpr	%r20, 0x0119, %tstate
	.word 0xfe0c0000  ! 4939: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xf20ca16d  ! 4941: LDUB_I	ldub	[%r18 + 0x016d], %r25
	.word 0xf80d0000  ! 4942: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf844a08e  ! 4943: LDSW_I	ldsw	[%r18 + 0x008e], %r28
	mov	1, %r12
	.word 0x8f932000  ! 4946: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982c0b  ! 4947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0b, %hpstate
	.word 0x8d95e00d  ! 4950: WRPR_PSTATE_I	wrpr	%r23, 0x000d, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf244a1a4  ! 4953: LDSW_I	ldsw	[%r18 + 0x01a4], %r25
	setx	data_start_3, %g1, %r21
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc440000  ! 4959: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xb935c000  ! 4968: SRL_R	srl 	%r23, %r0, %r28
	.word 0xfe0c0000  ! 4972: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0x8995209f  ! 4973: WRPR_TICK_I	wrpr	%r20, 0x009f, %tick
	.word 0xb2144000  ! 4976: OR_R	or 	%r17, %r0, %r25
	.word 0xba9460db  ! 4979: ORcc_I	orcc 	%r17, 0x00db, %r29
	.word 0xbec42098  ! 4980: ADDCcc_I	addccc 	%r16, 0x0098, %r31
	.word 0xb9345000  ! 4983: SRLX_R	srlx	%r17, %r0, %r28
	.word 0xf805a1fd  ! 4987: LDUW_I	lduw	[%r22 + 0x01fd], %r28
	.word 0xbd520000  ! 4988: RDPR_PIL	<illegal instruction>
	.word 0xf605a17c  ! 4994: LDUW_I	lduw	[%r22 + 0x017c], %r27
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 4997: RDPR_TSTATE	<illegal instruction>
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa58940  ! 3: FMULd	fmuld	%f22, %f0, %f62
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93d6001  ! 5: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xb9508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0xbda408e0  ! 16: FSUBq	dis not found

	.word 0xb3aa4820  ! 18: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbda00560  ! 19: FSQRTq	fsqrt	
	.word 0xbfa5c9c0  ! 23: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb3504000  ! 25: RDPR_TNPC	<illegal instruction>
	.word 0xb9ab0820  ! 30: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00520  ! 37: FSQRTs	fsqrt	
	.word 0xbba80820  ! 38: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb73c2001  ! 40: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xbda58840  ! 43: FADDd	faddd	%f22, %f0, %f30
	.word 0xbfa40860  ! 44: FADDq	dis not found

	setx	0x30116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba14a109  ! 54: OR_I	or 	%r18, 0x0109, %r29
	.word 0xb9a00560  ! 56: FSQRTq	fsqrt	
	.word 0xb5a588a0  ! 58: FSUBs	fsubs	%f22, %f0, %f26
	.word 0x8994a1e5  ! 61: WRPR_TICK_I	wrpr	%r18, 0x01e5, %tick
	.word 0xb1a509e0  ! 63: FDIVq	dis not found

	.word 0xb3a44920  ! 66: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb9a90820  ! 67: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa50940  ! 68: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb9a5c840  ! 69: FADDd	faddd	%f54, %f0, %f28
	.word 0xb9a4c840  ! 71: FADDd	faddd	%f50, %f0, %f28
	setx	data_start_1, %g1, %r21
	.word 0xbfa81420  ! 76: FMOVRNZ	dis not found

	.word 0xbda509e0  ! 77: FDIVq	dis not found

	.word 0xbda50820  ! 79: FADDs	fadds	%f20, %f0, %f30
	.word 0xb1a48960  ! 80: FMULq	dis not found

	.word 0xb5a80820  ! 81: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982ad1  ! 84: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad1, %hpstate
	.word 0xb9508000  ! 88: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a5c920  ! 90: FMULs	fmuls	%f23, %f0, %f28
	.word 0xbbaa0820  ! 91: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbda448a0  ! 92: FSUBs	fsubs	%f17, %f0, %f30
	.word 0x8594e134  ! 94: WRPR_TSTATE_I	wrpr	%r19, 0x0134, %tstate
	.word 0xb5aa8820  ! 95: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0x91952078  ! 97: WRPR_PIL_I	wrpr	%r20, 0x0078, %pil
	.word 0xbda80820  ! 100: FMOVN	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1348000  ! 111: SRL_R	srl 	%r18, %r0, %r24
	setx	data_start_3, %g1, %r19
	.word 0x9195a0d2  ! 113: WRPR_PIL_I	wrpr	%r22, 0x00d2, %pil
	.word 0xb3a00560  ! 116: FSQRTq	fsqrt	
	.word 0xbba81420  ! 121: FMOVRNZ	dis not found

	.word 0xbda80820  ! 122: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb7a84820  ! 126: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbf51c000  ! 128: RDPR_TL	<illegal instruction>
	.word 0xbba4c9c0  ! 130: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xb7a94820  ! 132: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb73dd000  ! 134: SRAX_R	srax	%r23, %r0, %r27
	.word 0xbba40960  ! 136: FMULq	dis not found

	.word 0xb3a00540  ! 142: FSQRTd	fsqrt	
	.word 0xb1a4c9a0  ! 149: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xbc8c61ce  ! 150: ANDcc_I	andcc 	%r17, 0x01ce, %r30
	.word 0x859521e8  ! 152: WRPR_TSTATE_I	wrpr	%r20, 0x01e8, %tstate
	.word 0xbba81820  ! 153: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb7a48840  ! 154: FADDd	faddd	%f18, %f0, %f58
	.word 0xb1a5c940  ! 156: FMULd	fmuld	%f54, %f0, %f24
	.word 0xbd50c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0x9194e0df  ! 160: WRPR_PIL_I	wrpr	%r19, 0x00df, %pil
	.word 0xb77dc400  ! 162: MOVR_R	movre	%r23, %r0, %r27
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 167: FMOVRZ	dis not found

	.word 0xb3a88820  ! 171: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb3518000  ! 172: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8d95a1b7  ! 181: WRPR_PSTATE_I	wrpr	%r22, 0x01b7, %pstate
	.word 0xbcb56133  ! 182: SUBCcc_I	orncc 	%r21, 0x0133, %r30
	.word 0xb7480000  ! 184: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba4c920  ! 187: FMULs	fmuls	%f19, %f0, %f29
	.word 0xb5a40820  ! 188: FADDs	fadds	%f16, %f0, %f26
	.word 0xb9a549e0  ! 189: FDIVq	dis not found

	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa8820  ! 193: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x839461d7  ! 195: WRPR_TNPC_I	wrpr	%r17, 0x01d7, %tnpc
	.word 0x919421eb  ! 198: WRPR_PIL_I	wrpr	%r16, 0x01eb, %pil
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfaa0820  ! 203: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbd50c000  ! 206: RDPR_TT	<illegal instruction>
	.word 0xbfab0820  ! 208: FMOVGU	fmovs	%fcc1, %f0, %f31
	mov	2, %r14
	.word 0xa193a000  ! 212: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a50840  ! 217: FADDd	faddd	%f20, %f0, %f58
	.word 0xbda449c0  ! 221: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb9520000  ! 222: RDPR_PIL	<illegal instruction>
	.word 0xb5a549a0  ! 225: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb3a54820  ! 228: FADDs	fadds	%f21, %f0, %f25
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d11  ! 230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d11, %hpstate
	.word 0xbd520000  ! 234: RDPR_PIL	<illegal instruction>
	setx	data_start_4, %g1, %r19
	.word 0x91956197  ! 239: WRPR_PIL_I	wrpr	%r21, 0x0197, %pil
	.word 0xb9a80c20  ! 241: FMOVRLZ	dis not found

	.word 0xbfa54960  ! 242: FMULq	dis not found

	.word 0x8995604a  ! 243: WRPR_TICK_I	wrpr	%r21, 0x004a, %tick
	.word 0xb7a94820  ! 246: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb0ad21cc  ! 251: ANDNcc_I	andncc 	%r20, 0x01cc, %r24
	.word 0xb5a80c20  ! 252: FMOVRLZ	dis not found

	.word 0xbda488a0  ! 259: FSUBs	fsubs	%f18, %f0, %f30
	.word 0x83942088  ! 261: WRPR_TNPC_I	wrpr	%r16, 0x0088, %tnpc
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a54840  ! 263: FADDd	faddd	%f52, %f0, %f24
	.word 0xb13c5000  ! 265: SRAX_R	srax	%r17, %r0, %r24
	.word 0xb6b54000  ! 266: SUBCcc_R	orncc 	%r21, %r0, %r27
	.word 0xb9a40860  ! 267: FADDq	dis not found

	.word 0x87956077  ! 268: WRPR_TT_I	wrpr	%r21, 0x0077, %tt
	.word 0xb7a549e0  ! 277: FDIVq	dis not found

	.word 0xbfa81820  ! 278: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	setx	data_start_4, %g1, %r23
	.word 0xbfa81820  ! 285: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbba81420  ! 287: FMOVRNZ	dis not found

	.word 0xb1a80820  ! 288: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb3a508a0  ! 291: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb92ca001  ! 292: SLL_I	sll 	%r18, 0x0001, %r28
	.word 0xbb510000  ! 295: RDPR_TICK	<illegal instruction>
	.word 0xb32d5000  ! 296: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xbfa4c8e0  ! 297: FSUBq	dis not found

	.word 0xb834a03c  ! 301: SUBC_I	orn 	%r18, 0x003c, %r28
	.word 0xbfa4c8e0  ! 303: FSUBq	dis not found

	.word 0x899420da  ! 306: WRPR_TICK_I	wrpr	%r16, 0x00da, %tick
	.word 0xb1a4c840  ! 307: FADDd	faddd	%f50, %f0, %f24
	.word 0xb3a4c860  ! 308: FADDq	dis not found

	.word 0xb7540000  ! 310: RDPR_GL	<illegal instruction>
	.word 0xb73d9000  ! 313: SRAX_R	srax	%r22, %r0, %r27
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1349000  ! 325: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xbcb52071  ! 326: ORNcc_I	orncc 	%r20, 0x0071, %r30
	.word 0xb7a00560  ! 328: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982e19  ! 333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e19, %hpstate
	.word 0xb5a50820  ! 334: FADDs	fadds	%f20, %f0, %f26
	.word 0xb845e177  ! 335: ADDC_I	addc 	%r23, 0x0177, %r28
	.word 0xbf3dd000  ! 337: SRAX_R	srax	%r23, %r0, %r31
	.word 0xbba5c860  ! 338: FADDq	dis not found

	.word 0xbbabc820  ! 339: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	data_start_0, %g1, %r23
	.word 0xbba94820  ! 342: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbd50c000  ! 350: RDPR_TT	<illegal instruction>
	.word 0xbba489c0  ! 351: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xb5a00020  ! 352: FMOVs	fmovs	%f0, %f26
	.word 0xb1480000  ! 353: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_3, %g1, %r23
	.word 0xba142103  ! 357: OR_I	or 	%r16, 0x0103, %r29
	.word 0xb3a548c0  ! 361: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xb1abc820  ! 363: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a58840  ! 365: FADDd	faddd	%f22, %f0, %f28
	.word 0x8194a123  ! 368: WRPR_TPC_I	wrpr	%r18, 0x0123, %tpc
	.word 0xb5518000  ! 370: RDPR_PSTATE	<illegal instruction>
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994605e  ! 372: WRPR_TICK_I	wrpr	%r17, 0x005e, %tick
	.word 0xb9504000  ! 377: RDPR_TNPC	<illegal instruction>
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 384: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a84820  ! 385: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a449e0  ! 391: FDIVq	dis not found

	.word 0xb57c4400  ! 392: MOVR_R	movre	%r17, %r0, %r26
	.word 0xbba9c820  ! 394: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a81c20  ! 398: FMOVRGEZ	dis not found

	setx	0x200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda509a0  ! 401: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb42c61e5  ! 403: ANDN_I	andn 	%r17, 0x01e5, %r26
	.word 0xb9a00540  ! 404: FSQRTd	fsqrt	
	setx	0x20035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa448c0  ! 410: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb5a44840  ! 415: FADDd	faddd	%f48, %f0, %f26
	.word 0xb3a409e0  ! 416: FDIVq	dis not found

	.word 0x8d946141  ! 418: WRPR_PSTATE_I	wrpr	%r17, 0x0141, %pstate
	.word 0xb72da001  ! 422: SLL_I	sll 	%r22, 0x0001, %r27
	.word 0xb1a58960  ! 425: FMULq	dis not found

	.word 0x859561fd  ! 427: WRPR_TSTATE_I	wrpr	%r21, 0x01fd, %tstate
	.word 0xbda9c820  ! 433: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a508c0  ! 434: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb7a50940  ! 435: FMULd	fmuld	%f20, %f0, %f58
	.word 0xbb3d8000  ! 436: SRA_R	sra 	%r22, %r0, %r29
	.word 0xb80de0c9  ! 442: AND_I	and 	%r23, 0x00c9, %r28
	.word 0xbfa548e0  ! 443: FSUBq	dis not found

	.word 0xbc240000  ! 445: SUB_R	sub 	%r16, %r0, %r30
	.word 0xba9d61b8  ! 446: XORcc_I	xorcc 	%r21, 0x01b8, %r29
	.word 0xb2454000  ! 447: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xb81ca159  ! 451: XOR_I	xor 	%r18, 0x0159, %r28
	.word 0xb5540000  ! 452: RDPR_GL	<illegal instruction>
	.word 0xb1a81c20  ! 453: FMOVRGEZ	dis not found

	.word 0xbb508000  ! 454: RDPR_TSTATE	<illegal instruction>
	setx	0x3022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e0bd  ! 457: WRPR_TT_I	wrpr	%r23, 0x00bd, %tt
	.word 0xb5540000  ! 460: RDPR_GL	<illegal instruction>
	.word 0xb1540000  ! 465: RDPR_GL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 467: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba90820  ! 479: FMOVLEU	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x819828db  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08db, %hpstate
	.word 0xb0048000  ! 482: ADD_R	add 	%r18, %r0, %r24
	.word 0xb9a00560  ! 483: FSQRTq	fsqrt	
	.word 0xb7504000  ! 484: RDPR_TNPC	<illegal instruction>
	.word 0x8795a03b  ! 489: WRPR_TT_I	wrpr	%r22, 0x003b, %tt
	.word 0xbe256058  ! 491: SUB_I	sub 	%r21, 0x0058, %r31
	.word 0xbda40940  ! 493: FMULd	fmuld	%f16, %f0, %f30
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e01c  ! 496: WRPR_TT_I	wrpr	%r19, 0x001c, %tt
	.word 0xb935f001  ! 497: SRLX_I	srlx	%r23, 0x0001, %r28
	.word 0x9195216b  ! 503: WRPR_PIL_I	wrpr	%r20, 0x016b, %pil
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2df001  ! 508: SLLX_I	sllx	%r23, 0x0001, %r31
	.word 0xb1a00540  ! 514: FSQRTd	fsqrt	
	.word 0xb1540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xb7a4c8c0  ! 521: FSUBd	fsubd	%f50, %f0, %f58
	setx	0x30101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0x8995212f  ! 527: WRPR_TICK_I	wrpr	%r20, 0x012f, %tick
	.word 0xb33c8000  ! 529: SRA_R	sra 	%r18, %r0, %r25
	.word 0xb53c6001  ! 535: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xb1a449c0  ! 539: FDIVd	fdivd	%f48, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983bd9  ! 542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd9, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 543: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a98820  ! 545: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbc458000  ! 546: ADDC_R	addc 	%r22, %r0, %r30
	.word 0xbba8c820  ! 551: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0x8d94a15b  ! 555: WRPR_PSTATE_I	wrpr	%r18, 0x015b, %pstate
	.word 0xb351c000  ! 561: RDPR_TL	<illegal instruction>
	.word 0xb7a8c820  ! 564: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0x919520ba  ! 565: WRPR_PIL_I	wrpr	%r20, 0x00ba, %pil
	setx	0x10313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 572: FSQRTs	fsqrt	
	.word 0xb3510000  ! 574: RDPR_TICK	<illegal instruction>
	.word 0xbfa548c0  ! 575: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xb444a07b  ! 578: ADDC_I	addc 	%r18, 0x007b, %r26
	.word 0xb950c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xb1a40860  ! 581: FADDq	dis not found

	.word 0xba450000  ! 582: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xbda81820  ! 583: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb5500000  ! 586: RDPR_TPC	<illegal instruction>
	.word 0xb9a81820  ! 588: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb9a00540  ! 591: FSQRTd	fsqrt	
	.word 0xbbabc820  ! 593: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 597: FMOVd	fmovd	%f0, %f60
	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195611e  ! 601: WRPR_PIL_I	wrpr	%r21, 0x011e, %pil
	.word 0xbfa54840  ! 602: FADDd	faddd	%f52, %f0, %f62
	.word 0xbda4c8c0  ! 603: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xbba98820  ! 607: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00520  ! 610: FSQRTs	fsqrt	
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e18f  ! 615: WRPR_PSTATE_I	wrpr	%r19, 0x018f, %pstate
	.word 0xb9a80820  ! 619: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1aa4820  ! 622: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	0x3003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b93  ! 631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b93, %hpstate
	.word 0xbfab8820  ! 632: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a40860  ! 633: FADDq	dis not found

	setx	data_start_5, %g1, %r18
	.word 0xb9aa8820  ! 637: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb9a548e0  ! 639: FSUBq	dis not found

	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 644: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb5480000  ! 646: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb3a81420  ! 648: FMOVRNZ	dis not found

	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 651: FMOVRNZ	dis not found

	.word 0xb7a5c860  ! 652: FADDq	dis not found

	.word 0xbbaa4820  ! 657: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a98820  ! 661: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbda409c0  ! 665: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xbba00540  ! 666: FSQRTd	fsqrt	
	mov	2, %r12
	.word 0x8f932000  ! 667: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4454000  ! 670: ADDC_R	addc 	%r21, %r0, %r26
	.word 0xb7a50960  ! 671: FMULq	dis not found

	.word 0xbfa549e0  ! 675: FDIVq	dis not found

	.word 0x8194a06f  ! 676: WRPR_TPC_I	wrpr	%r18, 0x006f, %tpc
	.word 0xb60c8000  ! 682: AND_R	and 	%r18, %r0, %r27
	.word 0xb5a408e0  ! 684: FSUBq	dis not found

	.word 0xb9ab8820  ! 685: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0x8995a1a8  ! 689: WRPR_TICK_I	wrpr	%r22, 0x01a8, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983b01  ! 691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b01, %hpstate
	.word 0xb1520000  ! 692: RDPR_PIL	<illegal instruction>
	.word 0xb0940000  ! 693: ORcc_R	orcc 	%r16, %r0, %r24
	.word 0xb7a9c820  ! 697: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb7aa0820  ! 699: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbdaac820  ! 700: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0x8d95205a  ! 701: WRPR_PSTATE_I	wrpr	%r20, 0x005a, %pstate
	.word 0xbda94820  ! 702: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbf3cc000  ! 705: SRA_R	sra 	%r19, %r0, %r31
	setx	0x302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb535f001  ! 712: SRLX_I	srlx	%r23, 0x0001, %r26
	.word 0xb3a5c8e0  ! 714: FSUBq	dis not found

	.word 0xb3a81c20  ! 715: FMOVRGEZ	dis not found

	setx	0x2012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a50960  ! 720: FMULq	dis not found

	.word 0x8395615b  ! 722: WRPR_TNPC_I	wrpr	%r21, 0x015b, %tnpc
	.word 0xb3540000  ! 723: RDPR_GL	<illegal instruction>
	.word 0xb3ab8820  ! 730: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbf508000  ! 731: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a5c8a0  ! 732: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xbda44940  ! 733: FMULd	fmuld	%f48, %f0, %f30
	.word 0xbc8561ac  ! 734: ADDcc_I	addcc 	%r21, 0x01ac, %r30
	.word 0xb7500000  ! 736: RDPR_TPC	<illegal instruction>
	.word 0xb7a488c0  ! 737: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xbda80820  ! 745: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0x8994a00f  ! 746: WRPR_TICK_I	wrpr	%r18, 0x000f, %tick
	.word 0xb7a00520  ! 749: FSQRTs	fsqrt	
	.word 0xb5a84820  ! 751: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbbab0820  ! 752: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab8820  ! 757: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0x8794204d  ! 759: WRPR_TT_I	wrpr	%r16, 0x004d, %tt
	.word 0xb1a54860  ! 761: FADDq	dis not found

	.word 0xbda80420  ! 763: FMOVRZ	dis not found

	.word 0xb7508000  ! 765: RDPR_TSTATE	<illegal instruction>
	.word 0xb234206c  ! 769: ORN_I	orn 	%r16, 0x006c, %r25
	.word 0x839520d6  ! 770: WRPR_TNPC_I	wrpr	%r20, 0x00d6, %tnpc
	.word 0xb9a00540  ! 771: FSQRTd	fsqrt	
	setx	0x10209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3c2001  ! 776: SRA_I	sra 	%r16, 0x0001, %r30
	mov	2, %r14
	.word 0xa193a000  ! 777: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a488c0  ! 778: FSUBd	fsubd	%f18, %f0, %f58
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 786: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a5c8a0  ! 787: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb7520000  ! 788: RDPR_PIL	<illegal instruction>
	.word 0x899421d7  ! 789: WRPR_TICK_I	wrpr	%r16, 0x01d7, %tick
	.word 0xbba84820  ! 791: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb63d0000  ! 797: XNOR_R	xnor 	%r20, %r0, %r27
	.word 0xb5520000  ! 804: RDPR_PIL	<illegal instruction>
	.word 0xbba80420  ! 805: FMOVRZ	dis not found

	.word 0xb5a80820  ! 806: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0x87946164  ! 810: WRPR_TT_I	wrpr	%r17, 0x0164, %tt
	.word 0xbba80820  ! 811: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbdaa0820  ! 812: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbe1c4000  ! 813: XOR_R	xor 	%r17, %r0, %r31
	.word 0xb5a81420  ! 818: FMOVRNZ	dis not found

	.word 0xb1a94820  ! 823: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbcad210d  ! 825: ANDNcc_I	andncc 	%r20, 0x010d, %r30
	.word 0xb1ab8820  ! 827: FMOVPOS	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983f41  ! 828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f41, %hpstate
	.word 0xb1ab4820  ! 829: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a488a0  ! 831: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xb7abc820  ! 834: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb134c000  ! 837: SRL_R	srl 	%r19, %r0, %r24
	.word 0xbe858000  ! 840: ADDcc_R	addcc 	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d43  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d43, %hpstate
	.word 0xb1a80c20  ! 847: FMOVRLZ	dis not found

	.word 0xb7a00020  ! 850: FMOVs	fmovs	%f0, %f27
	.word 0xbba00520  ! 852: FSQRTs	fsqrt	
	.word 0xbd3dc000  ! 853: SRA_R	sra 	%r23, %r0, %r30
	.word 0xb9a5c9a0  ! 860: FDIVs	fdivs	%f23, %f0, %f28
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 864: RDPR_GL	<illegal instruction>
	.word 0xb3a88820  ! 865: FMOVLE	fmovs	%fcc1, %f0, %f25
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e1a0  ! 874: WRPR_TICK_I	wrpr	%r19, 0x01a0, %tick
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3518000  ! 878: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b41  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b41, %hpstate
	.word 0x85956153  ! 883: WRPR_TSTATE_I	wrpr	%r21, 0x0153, %tstate
	.word 0xb5504000  ! 886: RDPR_TNPC	<illegal instruction>
	.word 0xb1a548c0  ! 890: FSUBd	fsubd	%f52, %f0, %f24
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a54960  ! 900: FMULq	dis not found

	.word 0xbd500000  ! 901: RDPR_TPC	<illegal instruction>
	.word 0x819420ea  ! 904: WRPR_TPC_I	wrpr	%r16, 0x00ea, %tpc
	mov	2, %r14
	.word 0xa193a000  ! 906: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5aa4820  ! 909: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x8795a049  ! 912: WRPR_TT_I	wrpr	%r22, 0x0049, %tt
	.word 0xb5a84820  ! 915: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbda81420  ! 916: FMOVRNZ	dis not found

	.word 0x85952040  ! 917: WRPR_TSTATE_I	wrpr	%r20, 0x0040, %tstate
	.word 0xb3a80420  ! 919: FMOVRZ	dis not found

	.word 0xbb50c000  ! 921: RDPR_TT	<illegal instruction>
	.word 0xb7510000  ! 923: RDPR_TICK	<illegal instruction>
	.word 0xb9aa0820  ! 924: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfab0820  ! 926: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a80820  ! 927: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba98820  ! 928: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb624e1bc  ! 931: SUB_I	sub 	%r19, 0x01bc, %r27
	.word 0xbf50c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0xbe0c0000  ! 934: AND_R	and 	%r16, %r0, %r31
	.word 0xb2b48000  ! 935: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xb9a80420  ! 936: FMOVRZ	dis not found

	.word 0xb005e0c4  ! 938: ADD_I	add 	%r23, 0x00c4, %r24
	.word 0xba25e196  ! 939: SUB_I	sub 	%r23, 0x0196, %r29
	.word 0xb3540000  ! 940: RDPR_GL	<illegal instruction>
	setx	0x3b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 946: FMOVRLZ	dis not found

	.word 0xb7a80420  ! 948: FMOVRZ	dis not found

	.word 0xbf2d6001  ! 950: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xb61d600a  ! 952: XOR_I	xor 	%r21, 0x000a, %r27
	.word 0xbda44920  ! 953: FMULs	fmuls	%f17, %f0, %f30
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 956: RDPR_GL	<illegal instruction>
	.word 0xbc85610e  ! 959: ADDcc_I	addcc 	%r21, 0x010e, %r30
	mov	0, %r14
	.word 0xa193a000  ! 964: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb0048000  ! 971: ADD_R	add 	%r18, %r0, %r24
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 973: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x8994e1e1  ! 974: WRPR_TICK_I	wrpr	%r19, 0x01e1, %tick
	.word 0xbfa58960  ! 975: FMULq	dis not found

	.word 0xbc34e1f0  ! 981: SUBC_I	orn 	%r19, 0x01f0, %r30
	.word 0x8195a07a  ! 982: WRPR_TPC_I	wrpr	%r22, 0x007a, %tpc
	.word 0x83952131  ! 983: WRPR_TNPC_I	wrpr	%r20, 0x0131, %tnpc
	setx	0x20111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 988: MOVcc_R	<illegal instruction>
	.word 0x83946156  ! 991: WRPR_TNPC_I	wrpr	%r17, 0x0156, %tnpc
	.word 0xb7aa0820  ! 993: FMOVA	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983e59  ! 994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e59, %hpstate
	.word 0xb3a48940  ! 995: FMULd	fmuld	%f18, %f0, %f56
	.word 0xbd510000  ! 999: RDPR_TICK	<illegal instruction>
	.word 0xb9480000  ! 1001: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d95a174  ! 1004: WRPR_PSTATE_I	wrpr	%r22, 0x0174, %pstate
	.word 0xb9a5c8c0  ! 1006: FSUBd	fsubd	%f54, %f0, %f28
	.word 0xbba54820  ! 1011: FADDs	fadds	%f21, %f0, %f29
	.word 0xbba40860  ! 1017: FADDq	dis not found

	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda44960  ! 1022: FMULq	dis not found

	.word 0xb5a508e0  ! 1024: FSUBq	dis not found

	.word 0xb3a80c20  ! 1025: FMOVRLZ	dis not found

	.word 0xbf350000  ! 1026: SRL_R	srl 	%r20, %r0, %r31
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 1030: FMOVVC	fmovs	%fcc1, %f0, %f25
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 1039: FSQRTd	fsqrt	
	.word 0xbda58820  ! 1042: FADDs	fadds	%f22, %f0, %f30
	.word 0xb1aa0820  ! 1043: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x8195e103  ! 1046: WRPR_TPC_I	wrpr	%r23, 0x0103, %tpc
	.word 0xb9a98820  ! 1047: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1abc820  ! 1052: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb8356101  ! 1055: ORN_I	orn 	%r21, 0x0101, %r28
	.word 0xb9518000  ! 1057: RDPR_PSTATE	<illegal instruction>
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 1065: FMOVRNZ	dis not found

	setx	0x10110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6054000  ! 1072: ADD_R	add 	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982e01  ! 1079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e01, %hpstate
	setx	0x20131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d942111  ! 1081: WRPR_PSTATE_I	wrpr	%r16, 0x0111, %pstate
	.word 0xb3aa0820  ! 1084: FMOVA	fmovs	%fcc1, %f0, %f25
	setx	0x2010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 1088: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x83946197  ! 1089: WRPR_TNPC_I	wrpr	%r17, 0x0197, %tnpc
	.word 0xbfa00020  ! 1091: FMOVs	fmovs	%f0, %f31
	.word 0xb7a9c820  ! 1092: FMOVVS	fmovs	%fcc1, %f0, %f27
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a509c0  ! 1101: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xb7a4c8c0  ! 1102: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xb9a80420  ! 1103: FMOVRZ	dis not found

	.word 0xb551c000  ! 1105: RDPR_TL	<illegal instruction>
	.word 0xb3a508c0  ! 1106: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb951c000  ! 1109: RDPR_TL	<illegal instruction>
	.word 0xb9ab4820  ! 1110: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbdab0820  ! 1111: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0x8d94a188  ! 1112: WRPR_PSTATE_I	wrpr	%r18, 0x0188, %pstate
	.word 0x8395a176  ! 1115: WRPR_TNPC_I	wrpr	%r22, 0x0176, %tnpc
	.word 0xba34c000  ! 1117: ORN_R	orn 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 1121: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	.word 0xb9a44920  ! 1122: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb7a4c8a0  ! 1123: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb5a448c0  ! 1127: FSUBd	fsubd	%f48, %f0, %f26
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a589a0  ! 1129: FDIVs	fdivs	%f22, %f0, %f26
	.word 0x8395e105  ! 1130: WRPR_TNPC_I	wrpr	%r23, 0x0105, %tnpc
	.word 0xb1a00540  ! 1134: FSQRTd	fsqrt	
	.word 0x899460d1  ! 1135: WRPR_TICK_I	wrpr	%r17, 0x00d1, %tick
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 1141: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa80c20  ! 1143: FMOVRLZ	dis not found

	setx	data_start_1, %g1, %r21
	.word 0xb9aa8820  ! 1147: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbf518000  ! 1149: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa54820  ! 1150: FADDs	fadds	%f21, %f0, %f31
	.word 0xb5a48820  ! 1151: FADDs	fadds	%f18, %f0, %f26
	.word 0xb9480000  ! 1153: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb60cc000  ! 1154: AND_R	and 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf3c5000  ! 1157: SRAX_R	srax	%r17, %r0, %r31
	mov	0, %r14
	.word 0xa193a000  ! 1160: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a50920  ! 1162: FMULs	fmuls	%f20, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a90820  ! 1165: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00560  ! 1166: FSQRTq	fsqrt	
	.word 0xb9480000  ! 1168: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbda9c820  ! 1170: FMOVVS	fmovs	%fcc1, %f0, %f30
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c940  ! 1177: FMULd	fmuld	%f54, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x819828cb  ! 1183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cb, %hpstate
	.word 0xb72ca001  ! 1185: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xbba00560  ! 1189: FSQRTq	fsqrt	
	.word 0xb4a40000  ! 1192: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xb1a80420  ! 1194: FMOVRZ	dis not found

	.word 0xb9aa4820  ! 1195: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9518000  ! 1201: RDPR_PSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r18
	.word 0xb9a8c820  ! 1205: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbfa589e0  ! 1206: FDIVq	dis not found

	.word 0xbdaac820  ! 1214: FMOVGE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983c53  ! 1215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c53, %hpstate
	.word 0xb1a80820  ! 1219: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbda54860  ! 1221: FADDq	dis not found

	.word 0xb1a81820  ! 1223: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x8595e175  ! 1224: WRPR_TSTATE_I	wrpr	%r23, 0x0175, %tstate
	.word 0xb1a88820  ! 1227: FMOVLE	fmovs	%fcc1, %f0, %f24
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e99  ! 1229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e99, %hpstate
	.word 0xb2154000  ! 1231: OR_R	or 	%r21, %r0, %r25
	setx	0x22d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2b5a0d1  ! 1238: ORNcc_I	orncc 	%r22, 0x00d1, %r25
	.word 0xbda98820  ! 1240: FMOVNEG	fmovs	%fcc1, %f0, %f30
	setx	0x30031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a508c0  ! 1248: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb3ab8820  ! 1253: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa449e0  ! 1254: FDIVq	dis not found

	.word 0xb7a84820  ! 1255: FMOVE	fmovs	%fcc1, %f0, %f27
	setx	0x12e, %g1, %o0
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
	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 1262: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbd2d3001  ! 1264: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0x8395e000  ! 1270: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb6240000  ! 1271: SUB_R	sub 	%r16, %r0, %r27
	.word 0xbb520000  ! 1273: RDPR_PIL	<illegal instruction>
	.word 0xb1a00040  ! 1274: FMOVd	fmovd	%f0, %f24
	.word 0xb7520000  ! 1279: RDPR_PIL	<illegal instruction>
	.word 0xb9508000  ! 1280: RDPR_TSTATE	<illegal instruction>
	.word 0xbbaa8820  ! 1283: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a40960  ! 1284: FMULq	dis not found

	.word 0xb7540000  ! 1285: RDPR_GL	<illegal instruction>
	.word 0xb3504000  ! 1290: RDPR_TNPC	<illegal instruction>
	.word 0xbf51c000  ! 1291: RDPR_TL	<illegal instruction>
	.word 0xb5a409e0  ! 1295: FDIVq	dis not found

	setx	0x33c, %g1, %o0
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
	.word 0xb1504000  ! 1298: RDPR_TNPC	<illegal instruction>
	.word 0xb9a509a0  ! 1299: FDIVs	fdivs	%f20, %f0, %f28
	.word 0x8395202d  ! 1302: WRPR_TNPC_I	wrpr	%r20, 0x002d, %tnpc
	.word 0xb1a00040  ! 1303: FMOVd	fmovd	%f0, %f24
	.word 0xb9a00560  ! 1304: FSQRTq	fsqrt	
	.word 0x8195214f  ! 1309: WRPR_TPC_I	wrpr	%r20, 0x014f, %tpc
	.word 0xbba81420  ! 1314: FMOVRNZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 1315: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a40840  ! 1318: FADDd	faddd	%f16, %f0, %f24
	.word 0x91946191  ! 1320: WRPR_PIL_I	wrpr	%r17, 0x0191, %pil
	.word 0xbfa8c820  ! 1322: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00020  ! 1323: FMOVs	fmovs	%f0, %f24
	.word 0xbda80420  ! 1324: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	.word 0xbba489e0  ! 1329: FDIVq	dis not found

	.word 0xb5520000  ! 1330: RDPR_PIL	<illegal instruction>
	.word 0xb2a4e17a  ! 1331: SUBcc_I	subcc 	%r19, 0x017a, %r25
	.word 0xb5a00040  ! 1332: FMOVd	fmovd	%f0, %f26
	.word 0xb3a81820  ! 1335: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb3aac820  ! 1337: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0x8394e147  ! 1340: WRPR_TNPC_I	wrpr	%r19, 0x0147, %tnpc
	.word 0xbfa589c0  ! 1343: FDIVd	fdivd	%f22, %f0, %f62
	ta	T_CHANGE_HPRIV
	.word 0x81983b01  ! 1347: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b01, %hpstate
	.word 0x8195e053  ! 1348: WRPR_TPC_I	wrpr	%r23, 0x0053, %tpc
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 1364: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a589c0  ! 1365: FDIVd	fdivd	%f22, %f0, %f58
	setx	0x20312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 1370: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0x8194a12d  ! 1372: WRPR_TPC_I	wrpr	%r18, 0x012d, %tpc
	.word 0xbda81420  ! 1375: FMOVRNZ	dis not found

	.word 0xb7a8c820  ! 1376: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00020  ! 1381: FMOVs	fmovs	%f0, %f27
	.word 0xb5a58820  ! 1383: FADDs	fadds	%f22, %f0, %f26
	.word 0xb42c21b7  ! 1391: ANDN_I	andn 	%r16, 0x01b7, %r26
	.word 0xb12d8000  ! 1394: SLL_R	sll 	%r22, %r0, %r24
	setx	data_start_4, %g1, %r17
	mov	2, %r14
	.word 0xa193a000  ! 1399: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a84820  ! 1402: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbba88820  ! 1403: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbfab4820  ! 1404: FMOVCC	fmovs	%fcc1, %f0, %f31
	mov	0, %r14
	.word 0xa193a000  ! 1407: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda00540  ! 1408: FSQRTd	fsqrt	
	.word 0xb3a81c20  ! 1409: FMOVRGEZ	dis not found

	.word 0xb9ab8820  ! 1410: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a54920  ! 1413: FMULs	fmuls	%f21, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x85942190  ! 1419: WRPR_TSTATE_I	wrpr	%r16, 0x0190, %tstate
	.word 0xb5a50820  ! 1425: FADDs	fadds	%f20, %f0, %f26
	setx	0x2002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 1428: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a84820  ! 1429: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a94820  ! 1432: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a98820  ! 1436: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c860  ! 1440: FADDq	dis not found

	.word 0xbcbde071  ! 1445: XNORcc_I	xnorcc 	%r23, 0x0071, %r30
	.word 0xbba00020  ! 1448: FMOVs	fmovs	%f0, %f29
	.word 0x8d94e023  ! 1450: WRPR_PSTATE_I	wrpr	%r19, 0x0023, %pstate
	.word 0xbfaa8820  ! 1451: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa80c20  ! 1453: FMOVRLZ	dis not found

	.word 0xb9518000  ! 1454: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a8c820  ! 1455: FMOVL	fmovs	%fcc1, %f0, %f27
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c9c0  ! 1458: FDIVd	fdivd	%f50, %f0, %f26
	setx	0x30234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 1464: RDPR_TPC	<illegal instruction>
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 1467: FMOVLEU	fmovs	%fcc1, %f0, %f24
	mov	2, %r14
	.word 0xa193a000  ! 1468: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r20
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 1473: FMOVRZ	dis not found

	.word 0xb7a58920  ! 1474: FMULs	fmuls	%f22, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983991  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1991, %hpstate
	.word 0xbd7d4400  ! 1479: MOVR_R	movre	%r21, %r0, %r30
	.word 0xbda409e0  ! 1480: FDIVq	dis not found

	.word 0xb484a0b1  ! 1485: ADDcc_I	addcc 	%r18, 0x00b1, %r26
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 1495: FMOVCC	fmovs	%fcc1, %f0, %f27
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a1ad  ! 1497: WRPR_TICK_I	wrpr	%r18, 0x01ad, %tick
	.word 0xbfabc820  ! 1500: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00560  ! 1504: FSQRTq	fsqrt	
	setx	0x10232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a54820  ! 1507: FADDs	fadds	%f21, %f0, %f28
	setx	data_start_3, %g1, %r21
	.word 0x8594a08f  ! 1513: WRPR_TSTATE_I	wrpr	%r18, 0x008f, %tstate
	.word 0xb7a488e0  ! 1514: FSUBq	dis not found

	.word 0xb1a448c0  ! 1515: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xbd7c8400  ! 1516: MOVR_R	movre	%r18, %r0, %r30
	.word 0xbba508a0  ! 1519: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbfa00540  ! 1523: FSQRTd	fsqrt	
	.word 0xb7a409a0  ! 1525: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb5a80820  ! 1526: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbb504000  ! 1528: RDPR_TNPC	<illegal instruction>
	.word 0xb3a5c840  ! 1532: FADDd	faddd	%f54, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a80820  ! 1536: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb1a488e0  ! 1538: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	.word 0xbbaa8820  ! 1541: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5518000  ! 1543: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa50820  ! 1544: FADDs	fadds	%f20, %f0, %f31
	.word 0xb3508000  ! 1545: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a00020  ! 1549: FMOVs	fmovs	%f0, %f28
	.word 0xbfa548a0  ! 1551: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xb1a44840  ! 1552: FADDd	faddd	%f48, %f0, %f24
	.word 0xb550c000  ! 1553: RDPR_TT	<illegal instruction>
	.word 0xb2c52142  ! 1554: ADDCcc_I	addccc 	%r20, 0x0142, %r25
	.word 0xbfa4c960  ! 1555: FMULq	dis not found

	.word 0xbb51c000  ! 1557: RDPR_TL	<illegal instruction>
	.word 0xb7a81c20  ! 1564: FMOVRGEZ	dis not found

	.word 0xb5a81820  ! 1566: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 1569: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbba409e0  ! 1572: FDIVq	dis not found

	.word 0xb7a80820  ! 1575: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb815e1a6  ! 1576: OR_I	or 	%r23, 0x01a6, %r28
	.word 0xb7518000  ! 1577: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a80820  ! 1578: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	setx	0x20027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 1586: FMOVs	fmovs	%f0, %f30
	.word 0xbf500000  ! 1587: RDPR_TPC	<illegal instruction>
	.word 0xb3a84820  ! 1590: FMOVE	fmovs	%fcc1, %f0, %f25
	setx	data_start_4, %g1, %r20
	.word 0xb9abc820  ! 1593: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a90820  ! 1594: FMOVLEU	fmovs	%fcc1, %f0, %f26
	setx	data_start_2, %g1, %r18
	.word 0xbda9c820  ! 1598: FMOVVS	fmovs	%fcc1, %f0, %f30
	mov	0, %r12
	.word 0x8f932000  ! 1601: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb29dc000  ! 1602: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xb5346001  ! 1603: SRL_I	srl 	%r17, 0x0001, %r26
	.word 0xb3a81420  ! 1605: FMOVRNZ	dis not found

	.word 0xb9a00560  ! 1609: FSQRTq	fsqrt	
	.word 0xb7a88820  ! 1611: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbda94820  ! 1613: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0x859560d0  ! 1615: WRPR_TSTATE_I	wrpr	%r21, 0x00d0, %tstate
	setx	data_start_0, %g1, %r17
	.word 0xb1a9c820  ! 1623: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a40920  ! 1625: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb1a48920  ! 1628: FMULs	fmuls	%f18, %f0, %f24
	setx	data_start_0, %g1, %r23
	.word 0xb9a50820  ! 1632: FADDs	fadds	%f20, %f0, %f28
	.word 0xb52df001  ! 1634: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xbfa44860  ! 1635: FADDq	dis not found

	.word 0xba052185  ! 1637: ADD_I	add 	%r20, 0x0185, %r29
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a189  ! 1642: WRPR_PSTATE_I	wrpr	%r18, 0x0189, %pstate
	.word 0xb5510000  ! 1643: RDPR_TICK	<illegal instruction>
	.word 0xb9a00560  ! 1644: FSQRTq	fsqrt	
	.word 0xbf3d1000  ! 1647: SRAX_R	srax	%r20, %r0, %r31
	.word 0xb1a588a0  ! 1648: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xb9540000  ! 1650: RDPR_GL	<illegal instruction>
	.word 0xbba80420  ! 1652: FMOVRZ	dis not found

	.word 0xbf518000  ! 1657: RDPR_PSTATE	<illegal instruction>
	.word 0xbba90820  ! 1658: FMOVLEU	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	.word 0xbba40920  ! 1670: FMULs	fmuls	%f16, %f0, %f29
	.word 0x8795e048  ! 1671: WRPR_TT_I	wrpr	%r23, 0x0048, %tt
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa81820  ! 1682: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb9520000  ! 1683: RDPR_PIL	<illegal instruction>
	setx	0x1011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 1690: FMOVPOS	fmovs	%fcc1, %f0, %f31
	mov	1, %r14
	.word 0xa193a000  ! 1693: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa81820  ! 1697: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfa81420  ! 1699: FMOVRNZ	dis not found

	.word 0xb9480000  ! 1700: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	2, %r14
	.word 0xa193a000  ! 1704: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a94820  ! 1706: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a48860  ! 1708: FADDq	dis not found

	.word 0xbf50c000  ! 1710: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xb685c000  ! 1717: ADDcc_R	addcc 	%r23, %r0, %r27
	.word 0xbda8c820  ! 1718: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb40c0000  ! 1721: AND_R	and 	%r16, %r0, %r26
	.word 0xbda54940  ! 1722: FMULd	fmuld	%f52, %f0, %f30
	mov	1, %r12
	.word 0x8f932000  ! 1726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb0b4217d  ! 1729: SUBCcc_I	orncc 	%r16, 0x017d, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x87946194  ! 1733: WRPR_TT_I	wrpr	%r17, 0x0194, %tt
	.word 0xbbab4820  ! 1734: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a80820  ! 1735: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbfa4c940  ! 1737: FMULd	fmuld	%f50, %f0, %f62
	ta	T_CHANGE_HPRIV
	.word 0x81983ec1  ! 1739: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec1, %hpstate
	.word 0xb7a00560  ! 1741: FSQRTq	fsqrt	
	.word 0xb5abc820  ! 1742: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a44860  ! 1743: FADDq	dis not found

	.word 0xbfa80820  ! 1744: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80c20  ! 1746: FMOVRLZ	dis not found

	.word 0xb1a80420  ! 1748: FMOVRZ	dis not found

	.word 0xbd480000  ! 1750: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982851  ! 1752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0851, %hpstate
	.word 0xbda58920  ! 1754: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb3a80420  ! 1755: FMOVRZ	dis not found

	.word 0xb1aa4820  ! 1756: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	0x234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595209b  ! 1763: WRPR_TSTATE_I	wrpr	%r20, 0x009b, %tstate
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a489e0  ! 1768: FDIVq	dis not found

	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 1772: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a84820  ! 1775: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 1787: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 1793: RDPR_GL	<illegal instruction>
	.word 0xbda00560  ! 1794: FSQRTq	fsqrt	
	.word 0xbda50860  ! 1795: FADDq	dis not found

	.word 0xb5a48840  ! 1797: FADDd	faddd	%f18, %f0, %f26
	.word 0xb08d8000  ! 1799: ANDcc_R	andcc 	%r22, %r0, %r24
	.word 0xbbab0820  ! 1800: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbda00020  ! 1804: FMOVs	fmovs	%f0, %f30
	.word 0xb3a5c820  ! 1805: FADDs	fadds	%f23, %f0, %f25
	setx	0x22d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 1811: FSQRTs	fsqrt	
	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9c0  ! 1813: FDIVd	fdivd	%f50, %f0, %f28
	.word 0x8d942087  ! 1814: WRPR_PSTATE_I	wrpr	%r16, 0x0087, %pstate
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899520ee  ! 1821: WRPR_TICK_I	wrpr	%r20, 0x00ee, %tick
	.word 0xbfa5c9c0  ! 1826: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb2ac21d4  ! 1828: ANDNcc_I	andncc 	%r16, 0x01d4, %r25
	.word 0x8595e048  ! 1829: WRPR_TSTATE_I	wrpr	%r23, 0x0048, %tstate
	.word 0xbd50c000  ! 1835: RDPR_TT	<illegal instruction>
	.word 0xbebce048  ! 1836: XNORcc_I	xnorcc 	%r19, 0x0048, %r31
	setx	data_start_6, %g1, %r20
	.word 0x8194a02f  ! 1839: WRPR_TPC_I	wrpr	%r18, 0x002f, %tpc
	.word 0xbf480000  ! 1840: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbda449c0  ! 1841: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb9a98820  ! 1842: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb3a508a0  ! 1844: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb625a088  ! 1845: SUB_I	sub 	%r22, 0x0088, %r27
	setx	0x30120, %g1, %o0
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
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb404c000  ! 1856: ADD_R	add 	%r19, %r0, %r26
	setx	0x10214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a50960  ! 1868: FMULq	dis not found

	.word 0xb3a588c0  ! 1869: FSUBd	fsubd	%f22, %f0, %f56
	.word 0x8594e1df  ! 1870: WRPR_TSTATE_I	wrpr	%r19, 0x01df, %tstate
	.word 0xbb480000  ! 1871: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	2, %r14
	.word 0xa193a000  ! 1873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3540000  ! 1874: RDPR_GL	<illegal instruction>
	.word 0xbba84820  ! 1879: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbd480000  ! 1880: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa80420  ! 1883: FMOVRZ	dis not found

	setx	data_start_3, %g1, %r21
	.word 0xbfa80820  ! 1886: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb551c000  ! 1890: RDPR_TL	<illegal instruction>
	.word 0xbfa80420  ! 1894: FMOVRZ	dis not found

	.word 0x8d956103  ! 1896: WRPR_PSTATE_I	wrpr	%r21, 0x0103, %pstate
	.word 0xbda80420  ! 1898: FMOVRZ	dis not found

	.word 0xbf518000  ! 1899: RDPR_PSTATE	<illegal instruction>
	.word 0xbda508e0  ! 1901: FSUBq	dis not found

	.word 0xb7a54840  ! 1903: FADDd	faddd	%f52, %f0, %f58
	.word 0x8995e00d  ! 1904: WRPR_TICK_I	wrpr	%r23, 0x000d, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81420  ! 1910: FMOVRNZ	dis not found

	.word 0xb9a5c920  ! 1915: FMULs	fmuls	%f23, %f0, %f28
	.word 0xb1520000  ! 1916: RDPR_PIL	<illegal instruction>
	.word 0xb1aac820  ! 1920: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb7500000  ! 1922: RDPR_TPC	<illegal instruction>
	.word 0xbd358000  ! 1923: SRL_R	srl 	%r22, %r0, %r30
	.word 0xb4948000  ! 1930: ORcc_R	orcc 	%r18, %r0, %r26
	.word 0xbfa5c960  ! 1931: FMULq	dis not found

	.word 0xbfabc820  ! 1932: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0x9195610e  ! 1935: WRPR_PIL_I	wrpr	%r21, 0x010e, %pil
	.word 0xb5540000  ! 1936: RDPR_GL	<illegal instruction>
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcc4e023  ! 1941: ADDCcc_I	addccc 	%r19, 0x0023, %r30
	.word 0xb7a94820  ! 1944: FMOVCS	fmovs	%fcc1, %f0, %f27
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe952015  ! 1949: ORcc_I	orcc 	%r20, 0x0015, %r31
	.word 0xb1a80420  ! 1950: FMOVRZ	dis not found

	.word 0xb9480000  ! 1951: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb951c000  ! 1955: RDPR_TL	<illegal instruction>
	.word 0xb7a548a0  ! 1956: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xbfa94820  ! 1957: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x8394209c  ! 1958: WRPR_TNPC_I	wrpr	%r16, 0x009c, %tnpc
	.word 0xbb520000  ! 1961: RDPR_PIL	<illegal instruction>
	.word 0xbca42181  ! 1962: SUBcc_I	subcc 	%r16, 0x0181, %r30
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb7d2401  ! 1964: MOVR_I	movre	%r20, 0x1, %r29
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	.word 0xb034c000  ! 1969: ORN_R	orn 	%r19, %r0, %r24
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 1976: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9540000  ! 1978: RDPR_GL	<illegal instruction>
	.word 0xbfa54960  ! 1979: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a195  ! 1982: WRPR_TT_I	wrpr	%r18, 0x0195, %tt
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba48960  ! 1989: FMULq	dis not found

	.word 0x85952093  ! 1991: WRPR_TSTATE_I	wrpr	%r20, 0x0093, %tstate
	.word 0xb9aa8820  ! 1994: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbc84c000  ! 1995: ADDcc_R	addcc 	%r19, %r0, %r30
	.word 0xb1508000  ! 1997: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00020  ! 1998: FMOVs	fmovs	%f0, %f27
	.word 0xb77c2401  ! 1999: MOVR_I	movre	%r16, 0x1, %r27
	.word 0xbbabc820  ! 2001: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0x8d94e052  ! 2002: WRPR_PSTATE_I	wrpr	%r19, 0x0052, %pstate
	.word 0xbd7c6401  ! 2004: MOVR_I	movre	%r17, 0x1, %r30
	.word 0xb5ab8820  ! 2005: FMOVPOS	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x83942128  ! 2017: WRPR_TNPC_I	wrpr	%r16, 0x0128, %tnpc
	.word 0xb9a50960  ! 2018: FMULq	dis not found

	setx	data_start_2, %g1, %r20
	.word 0xbda549a0  ! 2032: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xb5a508c0  ! 2033: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xbbaac820  ! 2038: FMOVGE	fmovs	%fcc1, %f0, %f29
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9521c3  ! 2047: WRPR_PSTATE_I	wrpr	%r20, 0x01c3, %pstate
	.word 0xb1a94820  ! 2052: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb950c000  ! 2057: RDPR_TT	<illegal instruction>
	.word 0xbfa4c9c0  ! 2058: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xb7a48840  ! 2061: FADDd	faddd	%f18, %f0, %f58
	.word 0xbfa00520  ! 2062: FSQRTs	fsqrt	
	mov	2, %r14
	.word 0xa193a000  ! 2063: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb520000  ! 2064: RDPR_PIL	<illegal instruction>
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c8a0  ! 2068: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb5aa8820  ! 2072: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb40ce181  ! 2076: AND_I	and 	%r19, 0x0181, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982f51  ! 2077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f51, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a00040  ! 2086: FMOVd	fmovd	%f0, %f28
	.word 0xb3a84820  ! 2087: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xba84200c  ! 2090: ADDcc_I	addcc 	%r16, 0x000c, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983f93  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f93, %hpstate
	.word 0xb1a81c20  ! 2096: FMOVRGEZ	dis not found

	.word 0xbcb40000  ! 2098: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xb1ab0820  ! 2099: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbb51c000  ! 2100: RDPR_TL	<illegal instruction>
	.word 0xbda81820  ! 2101: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb97ce401  ! 2107: MOVR_I	movre	%r19, 0x1, %r28
	.word 0xb4346091  ! 2110: SUBC_I	orn 	%r17, 0x0091, %r26
	.word 0xb5518000  ! 2113: RDPR_PSTATE	<illegal instruction>
	.word 0xbba4c960  ! 2114: FMULq	dis not found

	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952099  ! 2116: WRPR_PSTATE_I	wrpr	%r20, 0x0099, %pstate
	.word 0xb73d9000  ! 2117: SRAX_R	srax	%r22, %r0, %r27
	mov	1, %r14
	.word 0xa193a000  ! 2121: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb951c000  ! 2124: RDPR_TL	<illegal instruction>
	.word 0xb5abc820  ! 2125: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba4c920  ! 2126: FMULs	fmuls	%f19, %f0, %f29
	setx	data_start_6, %g1, %r17
	.word 0xbfa40820  ! 2130: FADDs	fadds	%f16, %f0, %f31
	setx	0x1033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba40860  ! 2139: FADDq	dis not found

	.word 0xb3a00020  ! 2140: FMOVs	fmovs	%f0, %f25
	.word 0xba25c000  ! 2141: SUB_R	sub 	%r23, %r0, %r29
	.word 0xb5a81420  ! 2143: FMOVRNZ	dis not found

	.word 0xbda00560  ! 2145: FSQRTq	fsqrt	
	.word 0x8794a0c2  ! 2146: WRPR_TT_I	wrpr	%r18, 0x00c2, %tt
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 2151: FSQRTd	fsqrt	
	.word 0xb3a449e0  ! 2152: FDIVq	dis not found

	.word 0xbda4c940  ! 2154: FMULd	fmuld	%f50, %f0, %f30
	setx	0x27, %g1, %o0
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
	.word 0x919561b7  ! 2160: WRPR_PIL_I	wrpr	%r21, 0x01b7, %pil
	.word 0xb9504000  ! 2161: RDPR_TNPC	<illegal instruction>
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a063  ! 2164: WRPR_TICK_I	wrpr	%r22, 0x0063, %tick
	.word 0x819420f4  ! 2166: WRPR_TPC_I	wrpr	%r16, 0x00f4, %tpc
	.word 0xb9641800  ! 2169: MOVcc_R	<illegal instruction>
	.word 0xba354000  ! 2170: ORN_R	orn 	%r21, %r0, %r29
	.word 0xb72cf001  ! 2171: SLLX_I	sllx	%r19, 0x0001, %r27
	setx	data_start_3, %g1, %r20
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 2178: FMOVRNZ	dis not found

	setx	0x223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 2187: FSQRTd	fsqrt	
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4358000  ! 2195: SUBC_R	orn 	%r22, %r0, %r26
	.word 0x8794a12a  ! 2196: WRPR_TT_I	wrpr	%r18, 0x012a, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 2203: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	.word 0xb1a80820  ! 2204: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb7a8c820  ! 2206: FMOVL	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c920  ! 2212: FMULs	fmuls	%f19, %f0, %f25
	.word 0xbba5c860  ! 2218: FADDq	dis not found

	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2222: RDPR_PIL	<illegal instruction>
	setx	data_start_3, %g1, %r22
	.word 0xb9a80820  ! 2225: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbe1c0000  ! 2228: XOR_R	xor 	%r16, %r0, %r31
	.word 0xb3a589e0  ! 2233: FDIVq	dis not found

	.word 0xb3ab4820  ! 2234: FMOVCC	fmovs	%fcc1, %f0, %f25
	setx	data_start_4, %g1, %r20
	.word 0xb950c000  ! 2237: RDPR_TT	<illegal instruction>
	.word 0xb5a4c8c0  ! 2241: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xb7a58960  ! 2243: FMULq	dis not found

	.word 0xbd2cc000  ! 2244: SLL_R	sll 	%r19, %r0, %r30
	.word 0xb7518000  ! 2245: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa80420  ! 2246: FMOVRZ	dis not found

	setx	data_start_6, %g1, %r23
	.word 0xb5aa0820  ! 2248: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb9a509c0  ! 2249: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xbda00520  ! 2250: FSQRTs	fsqrt	
	.word 0xb7a81c20  ! 2252: FMOVRGEZ	dis not found

	.word 0xb7a80820  ! 2253: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb1518000  ! 2254: RDPR_PSTATE	<illegal instruction>
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 2258: FMOVCC	fmovs	%fcc1, %f0, %f29
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a50960  ! 2262: FMULq	dis not found

	.word 0xb150c000  ! 2269: RDPR_TT	<illegal instruction>
	.word 0xb5ab8820  ! 2270: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81420  ! 2274: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982ec3  ! 2275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0xb3a5c840  ! 2276: FADDd	faddd	%f54, %f0, %f56
	.word 0xb9a489c0  ! 2277: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xb9504000  ! 2279: RDPR_TNPC	<illegal instruction>
	.word 0xbfaac820  ! 2282: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a5c9a0  ! 2283: FDIVs	fdivs	%f23, %f0, %f24
	.word 0x8994a0c1  ! 2286: WRPR_TICK_I	wrpr	%r18, 0x00c1, %tick
	.word 0xb7a00020  ! 2287: FMOVs	fmovs	%f0, %f27
	.word 0xb8354000  ! 2289: SUBC_R	orn 	%r21, %r0, %r28
	.word 0xbba4c940  ! 2290: FMULd	fmuld	%f50, %f0, %f60
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 2293: RDPR_TPC	rdpr	%tpc, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5abc820  ! 2295: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00540  ! 2296: FSQRTd	fsqrt	
	.word 0xb5a4c840  ! 2298: FADDd	faddd	%f50, %f0, %f26
	.word 0xbba549c0  ! 2299: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb5a54920  ! 2300: FMULs	fmuls	%f21, %f0, %f26
	.word 0xbfa00040  ! 2302: FMOVd	fmovd	%f0, %f62
	.word 0xb1ab0820  ! 2306: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb750c000  ! 2310: RDPR_TT	<illegal instruction>
	.word 0xbda50960  ! 2311: FMULq	dis not found

	.word 0xbd51c000  ! 2312: RDPR_TL	<illegal instruction>
	.word 0xbfa94820  ! 2313: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x8995214b  ! 2316: WRPR_TICK_I	wrpr	%r20, 0x014b, %tick
	.word 0xb92d0000  ! 2318: SLL_R	sll 	%r20, %r0, %r28
	.word 0xb7a81820  ! 2321: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e1d4  ! 2324: WRPR_TT_I	wrpr	%r19, 0x01d4, %tt
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 2328: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa5c820  ! 2330: FADDs	fadds	%f23, %f0, %f31
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 2333: FMOVs	fmovs	%f0, %f24
	.word 0xb1a40920  ! 2334: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb3500000  ! 2338: RDPR_TPC	<illegal instruction>
	.word 0xb3abc820  ! 2339: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f932000  ! 2342: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7aa8820  ! 2343: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a408c0  ! 2350: FSUBd	fsubd	%f16, %f0, %f28
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 2353: RDPR_TPC	<illegal instruction>
	.word 0xb7a5c960  ! 2356: FMULq	dis not found

	.word 0xb7518000  ! 2358: RDPR_PSTATE	<illegal instruction>
	.word 0xb48d4000  ! 2360: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xb1a00540  ! 2361: FSQRTd	fsqrt	
	setx	data_start_6, %g1, %r23
	.word 0xbba44920  ! 2364: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbba449a0  ! 2366: FDIVs	fdivs	%f17, %f0, %f29
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 2371: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a5c860  ! 2374: FADDq	dis not found

	.word 0xb1a8c820  ! 2377: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbda00560  ! 2378: FSQRTq	fsqrt	
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a50820  ! 2381: FADDs	fadds	%f20, %f0, %f28
	.word 0xb9a00540  ! 2385: FSQRTd	fsqrt	
	.word 0xbfa80820  ! 2386: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb3a40860  ! 2390: FADDq	dis not found

	.word 0xbda80c20  ! 2391: FMOVRLZ	dis not found

	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 2395: FMOVs	fmovs	%f0, %f26
	.word 0x9194e0e3  ! 2400: WRPR_PIL_I	wrpr	%r19, 0x00e3, %pil
	.word 0xb7a88820  ! 2402: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbe8da113  ! 2407: ANDcc_I	andcc 	%r22, 0x0113, %r31
	setx	0x20011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb08c8000  ! 2410: ANDcc_R	andcc 	%r18, %r0, %r24
	setx	0x3022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 2414: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2416: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a00040  ! 2425: FMOVd	fmovd	%f0, %f58
	.word 0xb03de17b  ! 2426: XNOR_I	xnor 	%r23, 0x017b, %r24
	.word 0xb72d8000  ! 2427: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb1ab4820  ! 2428: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbda48860  ! 2429: FADDq	dis not found

	.word 0xbfaac820  ! 2430: FMOVGE	fmovs	%fcc1, %f0, %f31
	setx	0x12f, %g1, %o0
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
	.word 0xb5a548e0  ! 2441: FSUBq	dis not found

	.word 0xb3aac820  ! 2442: FMOVGE	fmovs	%fcc1, %f0, %f25
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2d3001  ! 2448: SLLX_I	sllx	%r20, 0x0001, %r31
	.word 0xbe8d8000  ! 2449: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xbe9d6106  ! 2453: XORcc_I	xorcc 	%r21, 0x0106, %r31
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 2472: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a00540  ! 2476: FSQRTd	fsqrt	
	.word 0xbda508e0  ! 2477: FSUBq	dis not found

	.word 0xb5a88820  ! 2481: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba48920  ! 2483: FMULs	fmuls	%f18, %f0, %f29
	setx	data_start_3, %g1, %r18
	.word 0x8594e1a5  ! 2486: WRPR_TSTATE_I	wrpr	%r19, 0x01a5, %tstate
	.word 0xb5a80820  ! 2488: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb1a489e0  ! 2493: FDIVq	dis not found

	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 2496: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5520000  ! 2499: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b93  ! 2500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b93, %hpstate
	.word 0xb7518000  ! 2503: RDPR_PSTATE	<illegal instruction>
	.word 0xbd2d8000  ! 2505: SLL_R	sll 	%r22, %r0, %r30
	mov	0, %r14
	.word 0xa193a000  ! 2506: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a00040  ! 2509: FMOVd	fmovd	%f0, %f28
	.word 0xb3480000  ! 2510: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbab0820  ! 2514: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbf50c000  ! 2518: RDPR_TT	<illegal instruction>
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 2523: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a9c820  ! 2524: FMOVVS	fmovs	%fcc1, %f0, %f26
	setx	data_start_6, %g1, %r18
	setx	0x1001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952169  ! 2537: WRPR_TICK_I	wrpr	%r20, 0x0169, %tick
	.word 0xb28c0000  ! 2541: ANDcc_R	andcc 	%r16, %r0, %r25
	mov	2, %r12
	.word 0x8f932000  ! 2546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a80420  ! 2551: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983e41  ! 2553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e41, %hpstate
	.word 0xb3aa8820  ! 2556: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a48860  ! 2558: FADDq	dis not found

	.word 0xb3a50860  ! 2562: FADDq	dis not found

	.word 0xbfa80c20  ! 2563: FMOVRLZ	dis not found

	.word 0xb9a5c940  ! 2564: FMULd	fmuld	%f54, %f0, %f28
	.word 0xb150c000  ! 2567: RDPR_TT	<illegal instruction>
	.word 0xb9a5c9e0  ! 2568: FDIVq	dis not found

	.word 0xb5a448c0  ! 2569: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xb1a80420  ! 2570: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x8198384b  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184b, %hpstate
	setx	0x10024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02c4000  ! 2575: ANDN_R	andn 	%r17, %r0, %r24
	.word 0xb3a548e0  ! 2577: FSUBq	dis not found

	.word 0xb3a4c820  ! 2578: FADDs	fadds	%f19, %f0, %f25
	.word 0xb1a80820  ! 2580: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0x8595a08c  ! 2582: WRPR_TSTATE_I	wrpr	%r22, 0x008c, %tstate
	.word 0xb9a48840  ! 2583: FADDd	faddd	%f18, %f0, %f28
	.word 0xb1ab8820  ! 2585: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a81820  ! 2589: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9a88820  ! 2590: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb1520000  ! 2592: RDPR_PIL	<illegal instruction>
	.word 0xb7518000  ! 2594: RDPR_PSTATE	<illegal instruction>
	.word 0xb9518000  ! 2595: RDPR_PSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r21
	.word 0xb1aac820  ! 2604: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00040  ! 2605: FMOVd	fmovd	%f0, %f26
	.word 0xbba5c860  ! 2610: FADDq	dis not found

	.word 0xbba88820  ! 2612: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb68c6181  ! 2614: ANDcc_I	andcc 	%r17, 0x0181, %r27
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 2618: FMOVRZ	dis not found

	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 2623: RDPR_TICK	<illegal instruction>
	setx	data_start_6, %g1, %r19
	.word 0xb3500000  ! 2631: RDPR_TPC	<illegal instruction>
	.word 0xbba4c9c0  ! 2635: FDIVd	fdivd	%f50, %f0, %f60
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa40960  ! 2639: FMULq	dis not found

	.word 0xb83c8000  ! 2641: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0x83956094  ! 2643: WRPR_TNPC_I	wrpr	%r21, 0x0094, %tnpc
	.word 0xb235c000  ! 2644: ORN_R	orn 	%r23, %r0, %r25
	.word 0xbd510000  ! 2648: RDPR_TICK	<illegal instruction>
	.word 0xb9a40920  ! 2649: FMULs	fmuls	%f16, %f0, %f28
	.word 0x81942051  ! 2650: WRPR_TPC_I	wrpr	%r16, 0x0051, %tpc
	.word 0xbec58000  ! 2653: ADDCcc_R	addccc 	%r22, %r0, %r31
	.word 0x8994a095  ! 2655: WRPR_TICK_I	wrpr	%r18, 0x0095, %tick
	.word 0xb3a00520  ! 2659: FSQRTs	fsqrt	
	.word 0xb3ab4820  ! 2660: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9504000  ! 2661: RDPR_TNPC	<illegal instruction>
	.word 0xbda88820  ! 2665: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00520  ! 2666: FSQRTs	fsqrt	
	.word 0xb3a5c8a0  ! 2667: FSUBs	fsubs	%f23, %f0, %f25
	.word 0xb5350000  ! 2668: SRL_R	srl 	%r20, %r0, %r26
	.word 0xb9a88820  ! 2669: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0x85956035  ! 2671: WRPR_TSTATE_I	wrpr	%r21, 0x0035, %tstate
	setx	data_start_3, %g1, %r16
	.word 0xbfa54820  ! 2673: FADDs	fadds	%f21, %f0, %f31
	.word 0xb3a44860  ! 2679: FADDq	dis not found

	.word 0xb7504000  ! 2681: RDPR_TNPC	<illegal instruction>
	.word 0xbba80c20  ! 2683: FMOVRLZ	dis not found

	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 2686: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda00540  ! 2694: FSQRTd	fsqrt	
	.word 0xb7a00040  ! 2697: FMOVd	fmovd	%f0, %f58
	.word 0xbd540000  ! 2704: RDPR_GL	<illegal instruction>
	.word 0xbfa4c840  ! 2706: FADDd	faddd	%f50, %f0, %f62
	.word 0xb551c000  ! 2708: RDPR_TL	<illegal instruction>
	.word 0xb1a9c820  ! 2713: FMOVVS	fmovs	%fcc1, %f0, %f24
	setx	0x30001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 2724: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0x85952039  ! 2726: WRPR_TSTATE_I	wrpr	%r20, 0x0039, %tstate
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 2732: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb5a50920  ! 2734: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb1a00520  ! 2735: FSQRTs	fsqrt	
	.word 0xbba489c0  ! 2741: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xbfaac820  ! 2744: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb97da401  ! 2746: MOVR_I	movre	%r22, 0x1, %r28
	.word 0xb9ab8820  ! 2747: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbda00020  ! 2752: FMOVs	fmovs	%f0, %f30
	.word 0xb1ab4820  ! 2755: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb5a549c0  ! 2759: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xbfa40860  ! 2761: FADDq	dis not found

	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba5c820  ! 2764: FADDs	fadds	%f23, %f0, %f29
	.word 0xbfa90820  ! 2765: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c820  ! 2766: FADDs	fadds	%f19, %f0, %f27
	.word 0xbda00020  ! 2768: FMOVs	fmovs	%f0, %f30
	.word 0xb6b5a0c2  ! 2770: ORNcc_I	orncc 	%r22, 0x00c2, %r27
	.word 0xbf504000  ! 2773: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f99  ! 2782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f99, %hpstate
	.word 0xba2c60cb  ! 2784: ANDN_I	andn 	%r17, 0x00cb, %r29
	.word 0xb7a80820  ! 2785: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbdab8820  ! 2786: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbb510000  ! 2790: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb9a81820  ! 2792: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb7a90820  ! 2794: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbfa48820  ! 2795: FADDs	fadds	%f18, %f0, %f31
	.word 0x85942051  ! 2796: WRPR_TSTATE_I	wrpr	%r16, 0x0051, %tstate
	.word 0xbda81c20  ! 2797: FMOVRGEZ	dis not found

	.word 0xb5aa8820  ! 2799: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0x83946092  ! 2803: WRPR_TNPC_I	wrpr	%r17, 0x0092, %tnpc
	.word 0xbb643801  ! 2804: MOVcc_I	<illegal instruction>
	.word 0x879460b6  ! 2805: WRPR_TT_I	wrpr	%r17, 0x00b6, %tt
	.word 0xb3357001  ! 2806: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xb20de1f4  ! 2808: AND_I	and 	%r23, 0x01f4, %r25
	.word 0xb1a50820  ! 2809: FADDs	fadds	%f20, %f0, %f24
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ade0b6  ! 2821: ANDNcc_I	andncc 	%r23, 0x00b6, %r26
	.word 0xb3ab4820  ! 2822: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a488c0  ! 2826: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xb9ab0820  ! 2827: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb5ab4820  ! 2830: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0x8795200f  ! 2831: WRPR_TT_I	wrpr	%r20, 0x000f, %tt
	.word 0x8394e045  ! 2834: WRPR_TNPC_I	wrpr	%r19, 0x0045, %tnpc
	.word 0xbba80c20  ! 2835: FMOVRLZ	dis not found

	.word 0xb8050000  ! 2841: ADD_R	add 	%r20, %r0, %r28
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 2843: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3518000  ! 2844: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a548c0  ! 2847: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb1a80420  ! 2848: FMOVRZ	dis not found

	.word 0xb5a5c920  ! 2851: FMULs	fmuls	%f23, %f0, %f26
	.word 0xb9540000  ! 2853: RDPR_GL	<illegal instruction>
	.word 0xb72c4000  ! 2855: SLL_R	sll 	%r17, %r0, %r27
	.word 0xbba00540  ! 2857: FSQRTd	fsqrt	
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc1c21e0  ! 2860: XOR_I	xor 	%r16, 0x01e0, %r30
	.word 0xb68da09a  ! 2865: ANDcc_I	andcc 	%r22, 0x009a, %r27
	.word 0xb5a5c9e0  ! 2869: FDIVq	dis not found

	.word 0xb1a00040  ! 2872: FMOVd	fmovd	%f0, %f24
	.word 0xbb510000  ! 2873: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r17
	.word 0xbdab8820  ! 2878: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbf353001  ! 2879: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xb7510000  ! 2883: RDPR_TICK	<illegal instruction>
	.word 0xbba9c820  ! 2889: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00520  ! 2895: FSQRTs	fsqrt	
	.word 0xb1a40860  ! 2897: FADDq	dis not found

	setx	data_start_1, %g1, %r23
	.word 0xb1a58940  ! 2901: FMULd	fmuld	%f22, %f0, %f24
	setx	0x20202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2903: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 2905: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 2910: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb5504000  ! 2911: RDPR_TNPC	<illegal instruction>
	.word 0xb5a94820  ! 2912: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a8c820  ! 2913: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbda80c20  ! 2914: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982849  ! 2919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0849, %hpstate
	.word 0xb814c000  ! 2924: OR_R	or 	%r19, %r0, %r28
	.word 0xb3540000  ! 2927: RDPR_GL	<illegal instruction>
	.word 0xb7abc820  ! 2928: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbba81c20  ! 2929: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982d03  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d03, %hpstate
	.word 0xbba00520  ! 2931: FSQRTs	fsqrt	
	.word 0xb1a81c20  ! 2932: FMOVRGEZ	dis not found

	.word 0xb1a40960  ! 2936: FMULq	dis not found

	.word 0xb5a9c820  ! 2937: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfab0820  ! 2939: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a81820  ! 2940: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa50960  ! 2946: FMULq	dis not found

	.word 0xb9a40940  ! 2948: FMULd	fmuld	%f16, %f0, %f28
	mov	2, %r12
	.word 0x8f932000  ! 2949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 2955: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0xb9a549e0  ! 2957: FDIVq	dis not found

	.word 0xbfa00520  ! 2969: FSQRTs	fsqrt	
	.word 0xbe1d0000  ! 2970: XOR_R	xor 	%r20, %r0, %r31
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 2976: RDPR_TICK	<illegal instruction>
	.word 0xb9a90820  ! 2977: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0x83956155  ! 2979: WRPR_TNPC_I	wrpr	%r21, 0x0155, %tnpc
	.word 0xbfaac820  ! 2981: FMOVGE	fmovs	%fcc1, %f0, %f31
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e049  ! 2986: WRPR_TPC_I	wrpr	%r23, 0x0049, %tpc
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 2988: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8595e051  ! 2989: WRPR_TSTATE_I	wrpr	%r23, 0x0051, %tstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aa4820  ! 2996: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a4c8e0  ! 2998: FSUBq	dis not found

	setx	data_start_6, %g1, %r22
	setx	0x1011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 3004: FSQRTq	fsqrt	
	setx	0x30204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 3008: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1abc820  ! 3009: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbaa52087  ! 3010: SUBcc_I	subcc 	%r20, 0x0087, %r29
	setx	data_start_1, %g1, %r18
	.word 0xb1a54920  ! 3013: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb9a00540  ! 3016: FSQRTd	fsqrt	
	.word 0xb1508000  ! 3017: RDPR_TSTATE	<illegal instruction>
	.word 0x899460e5  ! 3018: WRPR_TICK_I	wrpr	%r17, 0x00e5, %tick
	.word 0xb9a44960  ! 3022: FMULq	dis not found

	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a48840  ! 3026: FADDd	faddd	%f18, %f0, %f26
	.word 0xb7ab0820  ! 3028: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb9518000  ! 3031: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb5a488a0  ! 3035: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xb5abc820  ! 3036: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a488a0  ! 3038: FSUBs	fsubs	%f18, %f0, %f25
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 3043: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbf508000  ! 3044: RDPR_TSTATE	<illegal instruction>
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9aac820  ! 3047: FMOVGE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x8198389b  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x189b, %hpstate
	.word 0xb3a44960  ! 3049: FMULq	dis not found

	.word 0xb1a509c0  ! 3051: FDIVd	fdivd	%f20, %f0, %f24
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 3055: FSQRTd	fsqrt	
	.word 0xb60de001  ! 3056: AND_I	and 	%r23, 0x0001, %r27
	.word 0xb1a00040  ! 3058: FMOVd	fmovd	%f0, %f24
	.word 0xb3a80820  ! 3060: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbda588a0  ! 3063: FSUBs	fsubs	%f22, %f0, %f30
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91942095  ! 3065: WRPR_PIL_I	wrpr	%r16, 0x0095, %pil
	.word 0xb7540000  ! 3066: RDPR_GL	<illegal instruction>
	.word 0xb9a508a0  ! 3068: FSUBs	fsubs	%f20, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983b81  ! 3073: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b81, %hpstate
	.word 0xb12d2001  ! 3077: SLL_I	sll 	%r20, 0x0001, %r24
	.word 0x8394a0e2  ! 3082: WRPR_TNPC_I	wrpr	%r18, 0x00e2, %tnpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3520000  ! 3088: RDPR_PIL	<illegal instruction>
	.word 0xbda00540  ! 3089: FSQRTd	fsqrt	
	.word 0xbda4c9e0  ! 3090: FDIVq	dis not found

	.word 0xba9cc000  ! 3091: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xb1508000  ! 3094: RDPR_TSTATE	<illegal instruction>
	.word 0xbda90820  ! 3097: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0x8595a067  ! 3100: WRPR_TSTATE_I	wrpr	%r22, 0x0067, %tstate
	.word 0xbba449c0  ! 3102: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xb5a94820  ! 3108: FMOVCS	fmovs	%fcc1, %f0, %f26
	mov	2, %r14
	.word 0xa193a000  ! 3114: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf504000  ! 3115: RDPR_TNPC	<illegal instruction>
	.word 0xbfa44960  ! 3119: FMULq	dis not found

	.word 0xb9a00560  ! 3120: FSQRTq	fsqrt	
	.word 0xb9a44860  ! 3122: FADDq	dis not found

	.word 0x87952169  ! 3124: WRPR_TT_I	wrpr	%r20, 0x0169, %tt
	.word 0xbd500000  ! 3125: RDPR_TPC	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0xbfa48860  ! 3128: FADDq	dis not found

	.word 0xbfa5c8c0  ! 3129: FSUBd	fsubd	%f54, %f0, %f62
	ta	T_CHANGE_HPRIV
	.word 0x81982a53  ! 3131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a53, %hpstate
	.word 0xbfa00040  ! 3134: FMOVd	fmovd	%f0, %f62
	.word 0xbba40940  ! 3137: FMULd	fmuld	%f16, %f0, %f60
	.word 0xb7480000  ! 3141: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbfa488e0  ! 3145: FSUBq	dis not found

	setx	data_start_3, %g1, %r18
	.word 0xb4048000  ! 3150: ADD_R	add 	%r18, %r0, %r26
	.word 0xbfa94820  ! 3152: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a489a0  ! 3155: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xbf508000  ! 3156: RDPR_TSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r22
	.word 0xb5a94820  ! 3161: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c840  ! 3162: FADDd	faddd	%f54, %f0, %f56
	.word 0xb68560c6  ! 3163: ADDcc_I	addcc 	%r21, 0x00c6, %r27
	.word 0xbd51c000  ! 3164: RDPR_TL	<illegal instruction>
	.word 0xbda5c8c0  ! 3165: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xbfa84820  ! 3166: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a5c9c0  ! 3167: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xb7480000  ! 3171: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5a00020  ! 3172: FMOVs	fmovs	%f0, %f26
	.word 0xbfa81420  ! 3173: FMOVRNZ	dis not found

	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb1aa4820  ! 3183: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a4c940  ! 3184: FMULd	fmuld	%f50, %f0, %f28
	mov	1, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb0354000  ! 3187: SUBC_R	orn 	%r21, %r0, %r24
	.word 0xb1a44860  ! 3188: FADDq	dis not found

	.word 0xb9a449c0  ! 3191: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb7a44960  ! 3192: FMULq	dis not found

	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 3199: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb7a4c8a0  ! 3200: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xbda80420  ! 3204: FMOVRZ	dis not found

	.word 0xbf2c8000  ! 3209: SLL_R	sll 	%r18, %r0, %r31
	.word 0xb1508000  ! 3210: RDPR_TSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r17
	setx	data_start_6, %g1, %r19
	.word 0xb885a102  ! 3219: ADDcc_I	addcc 	%r22, 0x0102, %r28
	.word 0xb4340000  ! 3221: ORN_R	orn 	%r16, %r0, %r26
	.word 0xb7aac820  ! 3222: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb13da001  ! 3223: SRA_I	sra 	%r22, 0x0001, %r24
	setx	data_start_4, %g1, %r22
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 3228: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00540  ! 3229: FSQRTd	fsqrt	
	.word 0xb7a8c820  ! 3230: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb751c000  ! 3231: RDPR_TL	<illegal instruction>
	.word 0xb3a81820  ! 3236: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7a00560  ! 3237: FSQRTq	fsqrt	
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba8d0000  ! 3249: ANDcc_R	andcc 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa44860  ! 3253: FADDq	dis not found

	.word 0xbba5c8e0  ! 3254: FSUBq	dis not found

	.word 0xb7a4c860  ! 3258: FADDq	dis not found

	.word 0x81942153  ! 3264: WRPR_TPC_I	wrpr	%r16, 0x0153, %tpc
	.word 0xbfaa4820  ! 3265: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81420  ! 3266: FMOVRNZ	dis not found

	.word 0xb7a488a0  ! 3269: FSUBs	fsubs	%f18, %f0, %f27
	.word 0x8594e1d4  ! 3272: WRPR_TSTATE_I	wrpr	%r19, 0x01d4, %tstate
	.word 0xb3a00540  ! 3273: FSQRTd	fsqrt	
	.word 0xbda88820  ! 3274: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa90820  ! 3275: FMOVLEU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 3284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	.word 0xb1a80420  ! 3286: FMOVRZ	dis not found

	.word 0xb77d4400  ! 3289: MOVR_R	movre	%r21, %r0, %r27
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 3294: FSQRTq	fsqrt	
	.word 0xb7a81820  ! 3296: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 3314: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d95e1bb  ! 3319: WRPR_PSTATE_I	wrpr	%r23, 0x01bb, %pstate
	.word 0xbd520000  ! 3320: RDPR_PIL	<illegal instruction>
	.word 0xb9a58840  ! 3321: FADDd	faddd	%f22, %f0, %f28
	.word 0xb9518000  ! 3324: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a488a0  ! 3325: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb7ab0820  ! 3327: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb9a9c820  ! 3328: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	data_start_4, %g1, %r20
	.word 0xb5643801  ! 3331: MOVcc_I	<illegal instruction>
	.word 0x8d952154  ! 3332: WRPR_PSTATE_I	wrpr	%r20, 0x0154, %pstate
	setx	0x20f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952042  ! 3335: WRPR_PSTATE_I	wrpr	%r20, 0x0042, %pstate
	.word 0xb951c000  ! 3336: RDPR_TL	<illegal instruction>
	.word 0xb40ce0e6  ! 3337: AND_I	and 	%r19, 0x00e6, %r26
	.word 0xbd510000  ! 3339: RDPR_TICK	<illegal instruction>
	.word 0xb8352111  ! 3341: SUBC_I	orn 	%r20, 0x0111, %r28
	.word 0xb3a409c0  ! 3343: FDIVd	fdivd	%f16, %f0, %f56
	ta	T_CHANGE_HPRIV
	.word 0x81982ad9  ! 3345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad9, %hpstate
	.word 0xbda449e0  ! 3350: FDIVq	dis not found

	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xbba4c960  ! 3356: FMULq	dis not found

	.word 0x9195a165  ! 3357: WRPR_PIL_I	wrpr	%r22, 0x0165, %pil
	ta	T_CHANGE_HPRIV
	.word 0x819828d3  ! 3360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d3, %hpstate
	.word 0xb02c8000  ! 3364: ANDN_R	andn 	%r18, %r0, %r24
	mov	1, %r14
	.word 0xa193a000  ! 3367: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa48820  ! 3370: FADDs	fadds	%f18, %f0, %f31
	.word 0xb3a5c940  ! 3372: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb9a508e0  ! 3373: FSUBq	dis not found

	.word 0xbfa80820  ! 3375: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb350c000  ! 3377: RDPR_TT	<illegal instruction>
	.word 0xb9a81420  ! 3381: FMOVRNZ	dis not found

	.word 0xb3a00520  ! 3384: FSQRTs	fsqrt	
	.word 0xb2ad4000  ! 3385: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0x8d95e159  ! 3387: WRPR_PSTATE_I	wrpr	%r23, 0x0159, %pstate
	.word 0x8d9421f0  ! 3391: WRPR_PSTATE_I	wrpr	%r16, 0x01f0, %pstate
	.word 0xb7500000  ! 3392: RDPR_TPC	<illegal instruction>
	.word 0xbfa80c20  ! 3393: FMOVRLZ	dis not found

	.word 0xb77da401  ! 3398: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xb1a40960  ! 3399: FMULq	dis not found

	.word 0x8395216d  ! 3400: WRPR_TNPC_I	wrpr	%r20, 0x016d, %tnpc
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 3405: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbba4c9c0  ! 3406: FDIVd	fdivd	%f50, %f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81982dd9  ! 3408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd9, %hpstate
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c8e0  ! 3415: FSUBq	dis not found

	.word 0xbba54820  ! 3419: FADDs	fadds	%f21, %f0, %f29
	.word 0xbf540000  ! 3421: RDPR_GL	<illegal instruction>
	.word 0xb1a90820  ! 3424: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbda00040  ! 3425: FMOVd	fmovd	%f0, %f30
	.word 0xbb518000  ! 3428: RDPR_PSTATE	<illegal instruction>
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeac0000  ! 3432: ANDNcc_R	andncc 	%r16, %r0, %r31
	setx	0x30135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0xb3a58960  ! 3438: FMULq	dis not found

	.word 0xbda98820  ! 3439: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbaa4e194  ! 3445: SUBcc_I	subcc 	%r19, 0x0194, %r29
	.word 0x8794a0b9  ! 3449: WRPR_TT_I	wrpr	%r18, 0x00b9, %tt
	mov	2, %r14
	.word 0xa193a000  ! 3451: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5508000  ! 3460: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e1f2  ! 3463: WRPR_TPC_I	wrpr	%r19, 0x01f2, %tpc
	.word 0xb9508000  ! 3464: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a155  ! 3467: WRPR_TSTATE_I	wrpr	%r22, 0x0155, %tstate
	.word 0xb9aa8820  ! 3468: FMOVG	fmovs	%fcc1, %f0, %f28
	mov	0, %r14
	.word 0xa193a000  ! 3470: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5500000  ! 3471: RDPR_TPC	<illegal instruction>
	.word 0xbc944000  ! 3472: ORcc_R	orcc 	%r17, %r0, %r30
	.word 0xbcc4e091  ! 3473: ADDCcc_I	addccc 	%r19, 0x0091, %r30
	.word 0xb3ab0820  ! 3474: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbba81c20  ! 3475: FMOVRGEZ	dis not found

	setx	data_start_7, %g1, %r17
	.word 0xb7a94820  ! 3480: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbba81420  ! 3482: FMOVRNZ	dis not found

	setx	0x20202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e00e  ! 3485: WRPR_TT_I	wrpr	%r23, 0x000e, %tt
	.word 0xb5aac820  ! 3486: FMOVGE	fmovs	%fcc1, %f0, %f26
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a0b5  ! 3488: WRPR_TPC_I	wrpr	%r18, 0x00b5, %tpc
	.word 0x8795e1c2  ! 3492: WRPR_TT_I	wrpr	%r23, 0x01c2, %tt
	.word 0xb9a408c0  ! 3493: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb7aac820  ! 3495: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa81820  ! 3497: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb2358000  ! 3503: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xb5ab0820  ! 3505: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a81820  ! 3506: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb951c000  ! 3508: RDPR_TL	<illegal instruction>
	.word 0xb8bd4000  ! 3511: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xb3508000  ! 3515: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a81c20  ! 3516: FMOVRGEZ	dis not found

	.word 0xbca4c000  ! 3517: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xbe1d4000  ! 3518: XOR_R	xor 	%r21, %r0, %r31
	.word 0x8995e089  ! 3522: WRPR_TICK_I	wrpr	%r23, 0x0089, %tick
	.word 0xb1a509e0  ! 3525: FDIVq	dis not found

	.word 0xba0de1c4  ! 3527: AND_I	and 	%r23, 0x01c4, %r29
	.word 0x8d94a184  ! 3530: WRPR_PSTATE_I	wrpr	%r18, 0x0184, %pstate
	.word 0xbb3c2001  ! 3531: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xb4a48000  ! 3533: SUBcc_R	subcc 	%r18, %r0, %r26
	.word 0xb3504000  ! 3536: RDPR_TNPC	<illegal instruction>
	.word 0xb3480000  ! 3537: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9a588a0  ! 3539: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xbb504000  ! 3543: RDPR_TNPC	<illegal instruction>
	.word 0x9195e0ba  ! 3546: WRPR_PIL_I	wrpr	%r23, 0x00ba, %pil
	.word 0x91952071  ! 3547: WRPR_PIL_I	wrpr	%r20, 0x0071, %pil
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda40940  ! 3551: FMULd	fmuld	%f16, %f0, %f30
	.word 0xbfa58820  ! 3554: FADDs	fadds	%f22, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982cc1  ! 3555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc1, %hpstate
	.word 0xb7a409a0  ! 3556: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb4152115  ! 3557: OR_I	or 	%r20, 0x0115, %r26
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 3561: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbc3ce0ed  ! 3564: XNOR_I	xnor 	%r19, 0x00ed, %r30
	.word 0xb9aac820  ! 3566: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a8c820  ! 3568: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb9ab0820  ! 3579: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbba81c20  ! 3580: FMOVRGEZ	dis not found

	.word 0xbb3dd000  ! 3589: SRAX_R	srax	%r23, %r0, %r29
	.word 0x899421a6  ! 3590: WRPR_TICK_I	wrpr	%r16, 0x01a6, %tick
	.word 0xbda48940  ! 3593: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb3355000  ! 3597: SRLX_R	srlx	%r21, %r0, %r25
	.word 0xb3a00560  ! 3599: FSQRTq	fsqrt	
	.word 0xb1a549a0  ! 3601: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xbd641800  ! 3604: MOVcc_R	<illegal instruction>
	.word 0xb9a449c0  ! 3605: FDIVd	fdivd	%f48, %f0, %f28
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a44840  ! 3614: FADDd	faddd	%f48, %f0, %f24
	.word 0x8d95a048  ! 3616: WRPR_PSTATE_I	wrpr	%r22, 0x0048, %pstate
	.word 0xba9420d2  ! 3617: ORcc_I	orcc 	%r16, 0x00d2, %r29
	setx	0x3010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 3622: FMOVRGEZ	dis not found

	.word 0xbba00020  ! 3624: FMOVs	fmovs	%f0, %f29
	.word 0x8994a00b  ! 3625: WRPR_TICK_I	wrpr	%r18, 0x000b, %tick
	.word 0xb9a50940  ! 3626: FMULd	fmuld	%f20, %f0, %f28
	.word 0xb3353001  ! 3630: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xb7a80820  ! 3633: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9a4c840  ! 3638: FADDd	faddd	%f50, %f0, %f28
	.word 0x8394e08a  ! 3639: WRPR_TNPC_I	wrpr	%r19, 0x008a, %tnpc
	mov	2, %r14
	.word 0xa193a000  ! 3642: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a40840  ! 3646: FADDd	faddd	%f16, %f0, %f56
	.word 0xbeb4616a  ! 3649: SUBCcc_I	orncc 	%r17, 0x016a, %r31
	.word 0xb5a588c0  ! 3650: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb7ab0820  ! 3651: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 3653: FMOVN	fmovs	%fcc1, %f0, %f25
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 3661: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a44920  ! 3663: FMULs	fmuls	%f17, %f0, %f27
	.word 0xbf50c000  ! 3665: RDPR_TT	<illegal instruction>
	.word 0xb7a00540  ! 3668: FSQRTd	fsqrt	
	.word 0xbba40960  ! 3671: FMULq	dis not found

	.word 0x9194e1e6  ! 3675: WRPR_PIL_I	wrpr	%r19, 0x01e6, %pil
	mov	2, %r14
	.word 0xa193a000  ! 3678: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982d5b  ! 3679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xbda508a0  ! 3685: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xb3a58840  ! 3686: FADDd	faddd	%f22, %f0, %f56
	.word 0xb1a548e0  ! 3687: FSUBq	dis not found

	.word 0x9194204f  ! 3689: WRPR_PIL_I	wrpr	%r16, 0x004f, %pil
	.word 0xb32cc000  ! 3690: SLL_R	sll 	%r19, %r0, %r25
	.word 0xb9a94820  ! 3693: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa88820  ! 3694: FMOVLE	fmovs	%fcc1, %f0, %f31
	mov	0, %r14
	.word 0xa193a000  ! 3698: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x83942139  ! 3699: WRPR_TNPC_I	wrpr	%r16, 0x0139, %tnpc
	.word 0x8795e120  ! 3701: WRPR_TT_I	wrpr	%r23, 0x0120, %tt
	.word 0xbda81820  ! 3704: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbf7c8400  ! 3706: MOVR_R	movre	%r18, %r0, %r31
	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	.word 0xb0358000  ! 3714: ORN_R	orn 	%r22, %r0, %r24
	mov	1, %r12
	.word 0x8f932000  ! 3715: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a80420  ! 3716: FMOVRZ	dis not found

	.word 0xb7500000  ! 3717: RDPR_TPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 3718: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd540000  ! 3721: RDPR_GL	<illegal instruction>
	.word 0xbda80820  ! 3724: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80820  ! 3725: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb9a589e0  ! 3727: FDIVq	dis not found

	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 3729: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 3735: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00040  ! 3736: FMOVd	fmovd	%f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 3743: FSQRTs	fsqrt	
	.word 0xbd3c0000  ! 3744: SRA_R	sra 	%r16, %r0, %r30
	.word 0xbba81820  ! 3745: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	setx	data_start_0, %g1, %r16
	setx	data_start_0, %g1, %r19
	.word 0xb1a80c20  ! 3753: FMOVRLZ	dis not found

	setx	data_start_3, %g1, %r23
	.word 0xb9aa8820  ! 3760: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa4c860  ! 3761: FADDq	dis not found

	.word 0xb3500000  ! 3765: RDPR_TPC	<illegal instruction>
	.word 0x8d94e02b  ! 3769: WRPR_PSTATE_I	wrpr	%r19, 0x002b, %pstate
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 3776: FMOVRGEZ	dis not found

	.word 0xb3a54960  ! 3788: FMULq	dis not found

	.word 0xb5a00020  ! 3789: FMOVs	fmovs	%f0, %f26
	.word 0xbe04a0ef  ! 3792: ADD_I	add 	%r18, 0x00ef, %r31
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 3795: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a81420  ! 3797: FMOVRNZ	dis not found

	.word 0xbfa8c820  ! 3798: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbfa9c820  ! 3799: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbcbce124  ! 3800: XNORcc_I	xnorcc 	%r19, 0x0124, %r30
	.word 0xb7a81420  ! 3801: FMOVRNZ	dis not found

	.word 0xbba00520  ! 3806: FSQRTs	fsqrt	
	.word 0xb1500000  ! 3807: RDPR_TPC	<illegal instruction>
	.word 0x8794a091  ! 3808: WRPR_TT_I	wrpr	%r18, 0x0091, %tt
	.word 0xb1aa4820  ! 3809: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbd7d6401  ! 3810: MOVR_I	movre	%r21, 0x1, %r30
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 3814: FMOVRLZ	dis not found

	.word 0xbda448c0  ! 3816: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb5a50920  ! 3817: FMULs	fmuls	%f20, %f0, %f26
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 3821: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9a54920  ! 3823: FMULs	fmuls	%f21, %f0, %f28
	.word 0xbfaa8820  ! 3824: FMOVG	fmovs	%fcc1, %f0, %f31
	mov	1, %r14
	.word 0xa193a000  ! 3825: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a50820  ! 3827: FADDs	fadds	%f20, %f0, %f25
	.word 0xb1a80c20  ! 3828: FMOVRLZ	dis not found

	.word 0xb7359000  ! 3829: SRLX_R	srlx	%r22, %r0, %r27
	.word 0xb7a80820  ! 3830: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb3500000  ! 3831: RDPR_TPC	<illegal instruction>
	.word 0x9195a03c  ! 3832: WRPR_PIL_I	wrpr	%r22, 0x003c, %pil
	.word 0x91952119  ! 3836: WRPR_PIL_I	wrpr	%r20, 0x0119, %pil
	ta	T_CHANGE_HPRIV
	.word 0x8198290b  ! 3837: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090b, %hpstate
	.word 0xb7a40840  ! 3845: FADDd	faddd	%f16, %f0, %f58
	.word 0xb1a81c20  ! 3848: FMOVRGEZ	dis not found

	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 3855: MOVcc_I	<illegal instruction>
	.word 0xb1a00520  ! 3856: FSQRTs	fsqrt	
	.word 0xb7a50820  ! 3858: FADDs	fadds	%f20, %f0, %f27
	.word 0x839561a4  ! 3859: WRPR_TNPC_I	wrpr	%r21, 0x01a4, %tnpc
	.word 0xb3a48920  ! 3861: FMULs	fmuls	%f18, %f0, %f25
	.word 0xbfa80c20  ! 3862: FMOVRLZ	dis not found

	.word 0xbbaac820  ! 3863: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbab4219c  ! 3864: SUBCcc_I	orncc 	%r16, 0x019c, %r29
	.word 0x839560bf  ! 3870: WRPR_TNPC_I	wrpr	%r21, 0x00bf, %tnpc
	.word 0xb1518000  ! 3871: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a408a0  ! 3875: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xbba00040  ! 3876: FMOVd	fmovd	%f0, %f60
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 3878: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a44960  ! 3880: FMULq	dis not found

	.word 0xb5a81420  ! 3881: FMOVRNZ	dis not found

	.word 0xb40c0000  ! 3884: AND_R	and 	%r16, %r0, %r26
	.word 0xbfa90820  ! 3887: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a4c820  ! 3888: FADDs	fadds	%f19, %f0, %f24
	setx	0x2002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 3892: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a81420  ! 3894: FMOVRNZ	dis not found

	.word 0xbfab4820  ! 3896: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00040  ! 3897: FMOVd	fmovd	%f0, %f24
	.word 0xb7a80c20  ! 3900: FMOVRLZ	dis not found

	.word 0xb7a5c840  ! 3902: FADDd	faddd	%f54, %f0, %f58
	.word 0x8795a0bc  ! 3906: WRPR_TT_I	wrpr	%r22, 0x00bc, %tt
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa40840  ! 3910: FADDd	faddd	%f16, %f0, %f62
	.word 0xb5a81c20  ! 3916: FMOVRGEZ	dis not found

	setx	0x10026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89942001  ! 3921: WRPR_TICK_I	wrpr	%r16, 0x0001, %tick
	ta	T_CHANGE_HPRIV
	.word 0x8198380b  ! 3922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180b, %hpstate
	.word 0x8794e09c  ! 3925: WRPR_TT_I	wrpr	%r19, 0x009c, %tt
	.word 0xb12c6001  ! 3926: SLL_I	sll 	%r17, 0x0001, %r24
	.word 0xb3a54820  ! 3931: FADDs	fadds	%f21, %f0, %f25
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 3936: RDPR_TL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3937: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a81c20  ! 3942: FMOVRGEZ	dis not found

	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 3946: FMOVRGEZ	dis not found

	.word 0xb3a9c820  ! 3950: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a5c840  ! 3962: FADDd	faddd	%f54, %f0, %f58
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3970: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00020  ! 3971: FMOVs	fmovs	%f0, %f28
	.word 0xbfa40860  ! 3974: FADDq	dis not found

	.word 0x8794604b  ! 3975: WRPR_TT_I	wrpr	%r17, 0x004b, %tt
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c8a0  ! 3979: FSUBs	fsubs	%f19, %f0, %f26
	setx	data_start_1, %g1, %r18
	setx	0x10039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 3986: FMOVd	fmovd	%f0, %f58
	.word 0x8595e0e7  ! 3987: WRPR_TSTATE_I	wrpr	%r23, 0x00e7, %tstate
	.word 0xbdaa4820  ! 3989: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbab54000  ! 3990: SUBCcc_R	orncc 	%r21, %r0, %r29
	setx	data_start_4, %g1, %r23
	.word 0xbba48860  ! 4001: FADDq	dis not found

	.word 0xbfaa0820  ! 4003: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbfa94820  ! 4004: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a44860  ! 4008: FADDq	dis not found

	setx	0x2000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 4013: FMOVd	fmovd	%f0, %f26
	setx	0x30037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 4020: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb1510000  ! 4023: RDPR_TICK	<illegal instruction>
	.word 0xb085c000  ! 4026: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xba0461ac  ! 4027: ADD_I	add 	%r17, 0x01ac, %r29
	.word 0xb7a58860  ! 4028: FADDq	dis not found

	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 4031: FMOVRGEZ	dis not found

	.word 0xbc2c60ab  ! 4036: ANDN_I	andn 	%r17, 0x00ab, %r30
	.word 0xbfa8c820  ! 4040: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7aac820  ! 4043: FMOVGE	fmovs	%fcc1, %f0, %f27
	mov	0, %r14
	.word 0xa193a000  ! 4044: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a81c20  ! 4045: FMOVRGEZ	dis not found

	.word 0xbfa54860  ! 4047: FADDq	dis not found

	.word 0xbac4a1ca  ! 4048: ADDCcc_I	addccc 	%r18, 0x01ca, %r29
	setx	data_start_0, %g1, %r23
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xbf2c4000  ! 4059: SLL_R	sll 	%r17, %r0, %r31
	.word 0xb5a81420  ! 4060: FMOVRNZ	dis not found

	.word 0xbfa54840  ! 4062: FADDd	faddd	%f52, %f0, %f62
	setx	0x10012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba488a0  ! 4068: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xb9a4c960  ! 4069: FMULq	dis not found

	.word 0xb13d3001  ! 4070: SRAX_I	srax	%r20, 0x0001, %r24
	.word 0xbba81c20  ! 4076: FMOVRGEZ	dis not found

	.word 0xb9a40820  ! 4079: FADDs	fadds	%f16, %f0, %f28
	.word 0xb9a44840  ! 4080: FADDd	faddd	%f48, %f0, %f28
	.word 0x8995a1f0  ! 4084: WRPR_TICK_I	wrpr	%r22, 0x01f0, %tick
	.word 0xbda58920  ! 4085: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb7518000  ! 4091: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa4c9c0  ! 4094: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xbfa80820  ! 4096: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0x8594e149  ! 4105: WRPR_TSTATE_I	wrpr	%r19, 0x0149, %tstate
	.word 0xb1aa0820  ! 4110: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbb508000  ! 4113: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a448a0  ! 4114: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xbcc4202c  ! 4115: ADDCcc_I	addccc 	%r16, 0x002c, %r30
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2850000  ! 4120: ADDcc_R	addcc 	%r20, %r0, %r25
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 4125: RDPR_PIL	<illegal instruction>
	.word 0xbfa84820  ! 4127: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a48860  ! 4131: FADDq	dis not found

	.word 0xb5510000  ! 4134: RDPR_TICK	<illegal instruction>
	.word 0xbbaa4820  ! 4137: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa9c820  ! 4139: FMOVVS	fmovs	%fcc1, %f0, %f31
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 4143: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbda40820  ! 4144: FADDs	fadds	%f16, %f0, %f30
	.word 0xb12cb001  ! 4147: SLLX_I	sllx	%r18, 0x0001, %r24
	.word 0xb7520000  ! 4150: RDPR_PIL	<illegal instruction>
	.word 0xbfaa8820  ! 4152: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x8795a15b  ! 4154: WRPR_TT_I	wrpr	%r22, 0x015b, %tt
	.word 0xb3a81820  ! 4160: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ad8000  ! 4168: ANDNcc_R	andncc 	%r22, %r0, %r26
	setx	0x30200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 4171: MOVcc_R	<illegal instruction>
	.word 0xb5aac820  ! 4175: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb0858000  ! 4176: ADDcc_R	addcc 	%r22, %r0, %r24
	.word 0xbe35a1c7  ! 4179: SUBC_I	orn 	%r22, 0x01c7, %r31
	.word 0xbf352001  ! 4180: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xb1a5c840  ! 4182: FADDd	faddd	%f54, %f0, %f24
	.word 0xb9a48820  ! 4184: FADDs	fadds	%f18, %f0, %f28
	.word 0xbf50c000  ! 4189: RDPR_TT	<illegal instruction>
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4198: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r21
	.word 0xb150c000  ! 4201: RDPR_TT	<illegal instruction>
	.word 0xb9aa8820  ! 4202: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbda508c0  ! 4203: FSUBd	fsubd	%f20, %f0, %f30
	.word 0x8194a127  ! 4204: WRPR_TPC_I	wrpr	%r18, 0x0127, %tpc
	.word 0xbda81c20  ! 4208: FMOVRGEZ	dis not found

	.word 0xb7a589c0  ! 4212: FDIVd	fdivd	%f22, %f0, %f58
	.word 0x8394206b  ! 4213: WRPR_TNPC_I	wrpr	%r16, 0x006b, %tnpc
	.word 0xb03561eb  ! 4214: SUBC_I	orn 	%r21, 0x01eb, %r24
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c840  ! 4216: FADDd	faddd	%f50, %f0, %f62
	.word 0xb8c58000  ! 4220: ADDCcc_R	addccc 	%r22, %r0, %r28
	.word 0xb1ab0820  ! 4221: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00540  ! 4225: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982ad1  ! 4229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad1, %hpstate
	mov	0, %r14
	.word 0xa193a000  ! 4230: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8395211e  ! 4235: WRPR_TNPC_I	wrpr	%r20, 0x011e, %tnpc
	.word 0xb9a488a0  ! 4236: FSUBs	fsubs	%f18, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983d99  ! 4237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d99, %hpstate
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e0f1  ! 4240: WRPR_PIL_I	wrpr	%r19, 0x00f1, %pil
	.word 0xbe0ce08a  ! 4243: AND_I	and 	%r19, 0x008a, %r31
	.word 0xb4340000  ! 4244: ORN_R	orn 	%r16, %r0, %r26
	.word 0xbba84820  ! 4245: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0x9194a112  ! 4249: WRPR_PIL_I	wrpr	%r18, 0x0112, %pil
	.word 0xb3a44960  ! 4251: FMULq	dis not found

	.word 0xb3a81820  ! 4254: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb2146152  ! 4255: OR_I	or 	%r17, 0x0152, %r25
	.word 0xb5354000  ! 4256: SRL_R	srl 	%r21, %r0, %r26
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 4265: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80c20  ! 4267: FMOVRLZ	dis not found

	.word 0x81942166  ! 4276: WRPR_TPC_I	wrpr	%r16, 0x0166, %tpc
	.word 0x85952123  ! 4278: WRPR_TSTATE_I	wrpr	%r20, 0x0123, %tstate
	.word 0xb3a8c820  ! 4279: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 4282: FSQRTs	fsqrt	
	.word 0xb44461b2  ! 4289: ADDC_I	addc 	%r17, 0x01b2, %r26
	.word 0xb5a00520  ! 4290: FSQRTs	fsqrt	
	.word 0xb5a81c20  ! 4291: FMOVRGEZ	dis not found

	.word 0xb351c000  ! 4292: RDPR_TL	<illegal instruction>
	.word 0xbba00020  ! 4294: FMOVs	fmovs	%f0, %f29
	.word 0xbba81820  ! 4298: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 4303: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba588e0  ! 4304: FSUBq	dis not found

	.word 0xb3a80c20  ! 4306: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c9c0  ! 4312: FDIVd	fdivd	%f50, %f0, %f62
	.word 0x819561fa  ! 4319: WRPR_TPC_I	wrpr	%r21, 0x01fa, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81983e83  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e83, %hpstate
	.word 0xbba509c0  ! 4324: FDIVd	fdivd	%f20, %f0, %f60
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 4331: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbda9c820  ! 4333: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb5520000  ! 4334: RDPR_PIL	<illegal instruction>
	.word 0xb5aac820  ! 4336: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a98820  ! 4339: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80420  ! 4340: FMOVRZ	dis not found

	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 4342: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0x8195e1ed  ! 4343: WRPR_TPC_I	wrpr	%r23, 0x01ed, %tpc
	.word 0x8195e15a  ! 4347: WRPR_TPC_I	wrpr	%r23, 0x015a, %tpc
	.word 0xbbab0820  ! 4349: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa81820  ! 4353: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0x8994a0ad  ! 4354: WRPR_TICK_I	wrpr	%r18, 0x00ad, %tick
	.word 0xbba4c920  ! 4356: FMULs	fmuls	%f19, %f0, %f29
	.word 0x8194a169  ! 4358: WRPR_TPC_I	wrpr	%r18, 0x0169, %tpc
	.word 0x8d94e1dd  ! 4359: WRPR_PSTATE_I	wrpr	%r19, 0x01dd, %pstate
	.word 0xb7abc820  ! 4361: FMOVVC	fmovs	%fcc1, %f0, %f27
	setx	data_start_1, %g1, %r19
	.word 0xb89c2192  ! 4364: XORcc_I	xorcc 	%r16, 0x0192, %r28
	.word 0xb12d9000  ! 4367: SLLX_R	sllx	%r22, %r0, %r24
	.word 0xb3a58920  ! 4368: FMULs	fmuls	%f22, %f0, %f25
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 4376: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0x8d95e15b  ! 4383: WRPR_PSTATE_I	wrpr	%r23, 0x015b, %pstate
	.word 0xb7aac820  ! 4387: FMOVGE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982b99  ! 4388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b99, %hpstate
	.word 0xb550c000  ! 4396: RDPR_TT	<illegal instruction>
	.word 0xbb540000  ! 4399: RDPR_GL	<illegal instruction>
	.word 0xb48c4000  ! 4401: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xb7a408a0  ! 4402: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xb7a44840  ! 4405: FADDd	faddd	%f48, %f0, %f58
	.word 0xb2048000  ! 4406: ADD_R	add 	%r18, %r0, %r25
	.word 0xb5ab0820  ! 4411: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb7abc820  ! 4412: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa80c20  ! 4413: FMOVRLZ	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 4416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a549a0  ! 4428: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xbba84820  ! 4431: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a448e0  ! 4437: FSUBq	dis not found

	.word 0xb5a00560  ! 4441: FSQRTq	fsqrt	
	.word 0xb9a58940  ! 4444: FMULd	fmuld	%f22, %f0, %f28
	.word 0xb68c4000  ! 4445: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xbba5c8a0  ! 4455: FSUBs	fsubs	%f23, %f0, %f29
	setx	0x10220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4461: RDPR_TT	<illegal instruction>
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 4464: FSQRTs	fsqrt	
	.word 0xb085e0d4  ! 4465: ADDcc_I	addcc 	%r23, 0x00d4, %r24
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 4470: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa8820  ! 4482: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbf480000  ! 4484: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbf510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xb7a5c9c0  ! 4487: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xbbab0820  ! 4488: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb42c0000  ! 4489: ANDN_R	andn 	%r16, %r0, %r26
	.word 0xb2aca011  ! 4492: ANDNcc_I	andncc 	%r18, 0x0011, %r25
	.word 0xb3ab8820  ! 4493: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a80c20  ! 4494: FMOVRLZ	dis not found

	.word 0xba8ce020  ! 4496: ANDcc_I	andcc 	%r19, 0x0020, %r29
	.word 0x859561b7  ! 4498: WRPR_TSTATE_I	wrpr	%r21, 0x01b7, %tstate
	setx	0x20300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0fb  ! 4505: WRPR_PSTATE_I	wrpr	%r18, 0x00fb, %pstate
	.word 0xb9a40960  ! 4506: FMULq	dis not found

	.word 0xb9a50960  ! 4507: FMULq	dis not found

	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 4509: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a548e0  ! 4510: FSUBq	dis not found

	.word 0x85942129  ! 4516: WRPR_TSTATE_I	wrpr	%r16, 0x0129, %tstate
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ac617d  ! 4520: ANDNcc_I	andncc 	%r17, 0x017d, %r28
	.word 0xba046032  ! 4522: ADD_I	add 	%r17, 0x0032, %r29
	.word 0xbda508e0  ! 4523: FSUBq	dis not found

	.word 0xb7a489e0  ! 4524: FDIVq	dis not found

	.word 0xb085c000  ! 4525: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xb5a48920  ! 4527: FMULs	fmuls	%f18, %f0, %f26
	.word 0xb9a81820  ! 4528: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	setx	data_start_7, %g1, %r17
	setx	0x20111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 4531: RDPR_GL	<illegal instruction>
	.word 0xb3a80820  ! 4532: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1ab0820  ! 4535: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbf510000  ! 4536: RDPR_TICK	<illegal instruction>
	.word 0x9194a1a8  ! 4543: WRPR_PIL_I	wrpr	%r18, 0x01a8, %pil
	.word 0xb9a50840  ! 4549: FADDd	faddd	%f20, %f0, %f28
	.word 0xb9480000  ! 4554: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d9461ac  ! 4555: WRPR_PSTATE_I	wrpr	%r17, 0x01ac, %pstate
	.word 0xb9a98820  ! 4556: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb151c000  ! 4560: RDPR_TL	<illegal instruction>
	.word 0xb7a4c9a0  ! 4566: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb1aa4820  ! 4568: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0x87946063  ! 4570: WRPR_TT_I	wrpr	%r17, 0x0063, %tt
	.word 0xb1a88820  ! 4571: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a408c0  ! 4573: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xbba50960  ! 4577: FMULq	dis not found

	.word 0xbba589c0  ! 4582: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xbda489c0  ! 4585: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb5a50860  ! 4589: FADDq	dis not found

	.word 0xb1a4c920  ! 4590: FMULs	fmuls	%f19, %f0, %f24
	.word 0xbfa4c9a0  ! 4591: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb9a81c20  ! 4593: FMOVRGEZ	dis not found

	.word 0xb37c8400  ! 4594: MOVR_R	movre	%r18, %r0, %r25
	mov	0, %r12
	.word 0x8f932000  ! 4597: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3504000  ! 4598: RDPR_TNPC	<illegal instruction>
	.word 0xb9a00520  ! 4601: FSQRTs	fsqrt	
	.word 0xbfa81c20  ! 4607: FMOVRGEZ	dis not found

	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 4609: FMOVVS	fmovs	%fcc1, %f0, %f30
	setx	0x20300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 4618: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbfa00520  ! 4623: FSQRTs	fsqrt	
	.word 0xb3a00540  ! 4624: FSQRTd	fsqrt	
	.word 0xb935d000  ! 4626: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xbb520000  ! 4629: RDPR_PIL	<illegal instruction>
	.word 0xb3a94820  ! 4630: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba00520  ! 4633: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982a59  ! 4635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a59, %hpstate
	.word 0xb484616e  ! 4637: ADDcc_I	addcc 	%r17, 0x016e, %r26
	.word 0xbf540000  ! 4638: RDPR_GL	<illegal instruction>
	.word 0xb335c000  ! 4642: SRL_R	srl 	%r23, %r0, %r25
	.word 0xb1aa8820  ! 4643: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbd50c000  ! 4645: RDPR_TT	<illegal instruction>
	.word 0xb6952075  ! 4647: ORcc_I	orcc 	%r20, 0x0075, %r27
	.word 0xb9a00520  ! 4648: FSQRTs	fsqrt	
	.word 0xb3a00560  ! 4650: FSQRTq	fsqrt	
	.word 0xb9a84820  ! 4651: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2a48000  ! 4653: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xb5a48940  ! 4655: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb1a548a0  ! 4658: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb7a40860  ! 4659: FADDq	dis not found

	.word 0xb3a98820  ! 4661: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0x8595204e  ! 4663: WRPR_TSTATE_I	wrpr	%r20, 0x004e, %tstate
	.word 0xbf504000  ! 4665: RDPR_TNPC	<illegal instruction>
	.word 0xb1643801  ! 4667: MOVcc_I	<illegal instruction>
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 4672: RDPR_TPC	<illegal instruction>
	.word 0xb3a50840  ! 4674: FADDd	faddd	%f20, %f0, %f56
	.word 0xb3a4c9c0  ! 4675: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb5a00540  ! 4678: FSQRTd	fsqrt	
	.word 0xbda00540  ! 4679: FSQRTd	fsqrt	
	.word 0x839561a5  ! 4685: WRPR_TNPC_I	wrpr	%r21, 0x01a5, %tnpc
	.word 0x8d956151  ! 4695: WRPR_PSTATE_I	wrpr	%r21, 0x0151, %pstate
	.word 0xb9504000  ! 4697: RDPR_TNPC	<illegal instruction>
	.word 0x8195e0db  ! 4699: WRPR_TPC_I	wrpr	%r23, 0x00db, %tpc
	.word 0x8994a19d  ! 4700: WRPR_TICK_I	wrpr	%r18, 0x019d, %tick
	.word 0x8795e135  ! 4706: WRPR_TT_I	wrpr	%r23, 0x0135, %tt
	.word 0xb1a81420  ! 4707: FMOVRNZ	dis not found

	.word 0xb3a448c0  ! 4708: FSUBd	fsubd	%f48, %f0, %f56
	mov	1, %r14
	.word 0xa193a000  ! 4711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb295e097  ! 4716: ORcc_I	orcc 	%r23, 0x0097, %r25
	.word 0xbba00520  ! 4719: FSQRTs	fsqrt	
	mov	1, %r14
	.word 0xa193a000  ! 4720: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d95e11f  ! 4721: WRPR_PSTATE_I	wrpr	%r23, 0x011f, %pstate
	setx	data_start_0, %g1, %r20
	.word 0xb7a90820  ! 4724: FMOVLEU	fmovs	%fcc1, %f0, %f27
	setx	data_start_3, %g1, %r22
	.word 0xb5a9c820  ! 4735: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa8c820  ! 4741: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xba04a00f  ! 4744: ADD_I	add 	%r18, 0x000f, %r29
	.word 0xbe35e1db  ! 4745: SUBC_I	orn 	%r23, 0x01db, %r31
	.word 0xb9a54820  ! 4746: FADDs	fadds	%f21, %f0, %f28
	.word 0xb635a15c  ! 4748: SUBC_I	orn 	%r22, 0x015c, %r27
	.word 0xb7aa8820  ! 4749: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x8994e0f5  ! 4751: WRPR_TICK_I	wrpr	%r19, 0x00f5, %tick
	.word 0x8394e17e  ! 4755: WRPR_TNPC_I	wrpr	%r19, 0x017e, %tnpc
	.word 0xbba90820  ! 4756: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbba489c0  ! 4757: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xb5ab8820  ! 4760: FMOVPOS	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0x9194e172  ! 4765: WRPR_PIL_I	wrpr	%r19, 0x0172, %pil
	.word 0xb7a5c9c0  ! 4766: FDIVd	fdivd	%f54, %f0, %f58
	setx	data_start_2, %g1, %r18
	.word 0xb950c000  ! 4769: RDPR_TT	<illegal instruction>
	.word 0xb9a00520  ! 4771: FSQRTs	fsqrt	
	.word 0xbda548c0  ! 4773: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb3a00540  ! 4774: FSQRTd	fsqrt	
	.word 0xb1a40920  ! 4777: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb3a589e0  ! 4780: FDIVq	dis not found

	.word 0xbf34a001  ! 4781: SRL_I	srl 	%r18, 0x0001, %r31
	.word 0xbb3d3001  ! 4785: SRAX_I	srax	%r20, 0x0001, %r29
	setx	data_start_1, %g1, %r19
	.word 0xbba00520  ! 4789: FSQRTs	fsqrt	
	.word 0xb1aa4820  ! 4791: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb5ab4820  ! 4793: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0x8795a077  ! 4794: WRPR_TT_I	wrpr	%r22, 0x0077, %tt
	.word 0xbba81820  ! 4797: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbda80820  ! 4798: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	setx	data_start_1, %g1, %r22
	.word 0x85952176  ! 4801: WRPR_TSTATE_I	wrpr	%r20, 0x0176, %tstate
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2c5000  ! 4804: SLLX_R	sllx	%r17, %r0, %r30
	.word 0xbfa4c9e0  ! 4807: FDIVq	dis not found

	.word 0xb1a8c820  ! 4808: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb551c000  ! 4809: RDPR_TL	<illegal instruction>
	.word 0xb151c000  ! 4811: RDPR_TL	<illegal instruction>
	.word 0xb1ab0820  ! 4812: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfaa0820  ! 4813: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbda9c820  ! 4816: FMOVVS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 4823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	.word 0xb2452080  ! 4824: ADDC_I	addc 	%r20, 0x0080, %r25
	.word 0xb1a81820  ! 4825: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x839561cb  ! 4826: WRPR_TNPC_I	wrpr	%r21, 0x01cb, %tnpc
	.word 0xb1a81c20  ! 4828: FMOVRGEZ	dis not found

	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xb, %g1, %o0
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
	.word 0xb9518000  ! 4842: RDPR_PSTATE	<illegal instruction>
	.word 0xbba8c820  ! 4843: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb9aac820  ! 4844: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbba00520  ! 4845: FSQRTs	fsqrt	
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946048  ! 4851: WRPR_PSTATE_I	wrpr	%r17, 0x0048, %pstate
	.word 0xbc25a0f1  ! 4852: SUB_I	sub 	%r22, 0x00f1, %r30
	.word 0xb1a84820  ! 4853: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a94820  ! 4855: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a509a0  ! 4856: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb1ab0820  ! 4865: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb495a007  ! 4870: ORcc_I	orcc 	%r22, 0x0007, %r26
	setx	0x33c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a4c840  ! 4881: FADDd	faddd	%f50, %f0, %f58
	.word 0xb5a00040  ! 4886: FMOVd	fmovd	%f0, %f26
	.word 0xbba00520  ! 4887: FSQRTs	fsqrt	
	.word 0xb1a409a0  ! 4891: FDIVs	fdivs	%f16, %f0, %f24
	.word 0x9195a182  ! 4892: WRPR_PIL_I	wrpr	%r22, 0x0182, %pil
	.word 0xb551c000  ! 4893: RDPR_TL	<illegal instruction>
	.word 0xb351c000  ! 4895: RDPR_TL	<illegal instruction>
	.word 0xbba94820  ! 4896: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb5abc820  ! 4897: FMOVVC	fmovs	%fcc1, %f0, %f26
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 4901: FSQRTq	fsqrt	
	.word 0xb9a48820  ! 4905: FADDs	fadds	%f18, %f0, %f28
	.word 0xbba44920  ! 4906: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbc8d4000  ! 4907: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0x8395e0d8  ! 4908: WRPR_TNPC_I	wrpr	%r23, 0x00d8, %tnpc
	.word 0xb5a84820  ! 4909: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a549e0  ! 4911: FDIVq	dis not found

	.word 0xb5a00540  ! 4912: FSQRTd	fsqrt	
	.word 0xbb500000  ! 4913: RDPR_TPC	<illegal instruction>
	.word 0xbfaa8820  ! 4914: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a54840  ! 4919: FADDd	faddd	%f52, %f0, %f24
	.word 0xb9a8c820  ! 4920: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbe1c6090  ! 4922: XOR_I	xor 	%r17, 0x0090, %r31
	.word 0xbe9ce095  ! 4928: XORcc_I	xorcc 	%r19, 0x0095, %r31
	.word 0xb7a4c9c0  ! 4932: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb3a81420  ! 4935: FMOVRNZ	dis not found

	.word 0x8594a0d8  ! 4936: WRPR_TSTATE_I	wrpr	%r18, 0x00d8, %tstate
	.word 0xbfa5c960  ! 4945: FMULq	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 4946: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x8198285b  ! 4947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085b, %hpstate
	.word 0xb7a4c8a0  ! 4949: FSUBs	fsubs	%f19, %f0, %f27
	.word 0x8d95e152  ! 4950: WRPR_PSTATE_I	wrpr	%r23, 0x0152, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r23
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 4956: FMOVd	fmovd	%f0, %f26
	.word 0xb5a58860  ! 4962: FADDq	dis not found

	.word 0xb5a00560  ! 4966: FSQRTq	fsqrt	
	.word 0xb9aa4820  ! 4967: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbb348000  ! 4968: SRL_R	srl 	%r18, %r0, %r29
	.word 0xb1a40940  ! 4969: FMULd	fmuld	%f16, %f0, %f24
	.word 0x8994a0e8  ! 4973: WRPR_TICK_I	wrpr	%r18, 0x00e8, %tick
	.word 0xb6154000  ! 4976: OR_R	or 	%r21, %r0, %r27
	.word 0xb1a508e0  ! 4977: FSUBq	dis not found

	.word 0xba94a14d  ! 4979: ORcc_I	orcc 	%r18, 0x014d, %r29
	.word 0xb2c520bb  ! 4980: ADDCcc_I	addccc 	%r20, 0x00bb, %r25
	.word 0xb5359000  ! 4983: SRLX_R	srlx	%r22, %r0, %r26
	.word 0xbf520000  ! 4988: RDPR_PIL	<illegal instruction>
	.word 0xb7a50920  ! 4989: FMULs	fmuls	%f20, %f0, %f27
	.word 0xbfaa4820  ! 4995: FMOVNE	fmovs	%fcc1, %f0, %f31
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 4997: RDPR_TSTATE	<illegal instruction>

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

	.xword	0xf210b72c00792033
	.xword	0x944363ddd8415ccf
	.xword	0xa55bb60224fdfbc0
	.xword	0x083e5b07a27924a2
	.xword	0x6bb8b994328a0c90
	.xword	0x01787439e81914cb
	.xword	0x3a3d7f3f8ffbaad6
	.xword	0x28d4470924f867a8
	.xword	0x79fee35578546a11
	.xword	0x3a97ce5370ef17a4
	.xword	0xdfb8c2946cad9120
	.xword	0x8aa1297c2d1742dc
	.xword	0xcf8cf2628f80a7af
	.xword	0x8a80abc186fd707a
	.xword	0x4872fe27691f7a58
	.xword	0x28aa988dee4b5168
	.xword	0x56af71366ef7abc7
	.xword	0xc7a3314f0c9cb6eb
	.xword	0x372647d707ba3c21
	.xword	0xe35e7938b780a63e
	.xword	0xd67b2d13ed9ab9da
	.xword	0x98cacc845b07f424
	.xword	0x5f1c4fdf96027ed0
	.xword	0x4b9390b7ded9b1f3
	.xword	0x46628d86b9a8aba6
	.xword	0xc386a6e6eb42eb85
	.xword	0x0e49f451043938a4
	.xword	0x8e0029feb214709d
	.xword	0xbb79f3bff29b3b68
	.xword	0x2bd47d5c9769d474
	.xword	0xb2f85c317dd4d62c
	.xword	0xa85055605d59c893
	.xword	0x5bd268d62bc0c7d3
	.xword	0x91e7918b13d80840
	.xword	0xe021bb2e1162aa6c
	.xword	0x58c3e9013fd3420d
	.xword	0x6d8ed243dad4ccf8
	.xword	0x15e9bd51eeca7a2d
	.xword	0x178e54fb70d4d96e
	.xword	0xd43cd12f030dd340
	.xword	0x8373fc248a24ab53
	.xword	0xa9dfbd84afaaf944
	.xword	0x8964eb2f712c77d7
	.xword	0xc79d02134ac3c803
	.xword	0xab60c10a1faa9112
	.xword	0x4f62c2c3072f4286
	.xword	0x71620a596748408a
	.xword	0xde31fa182375546f
	.xword	0x33a045a72ca261ea
	.xword	0x5fe68dae94e37908
	.xword	0x5f346fc312c53210
	.xword	0xbd204131c7794334
	.xword	0xfd1a37bfd0236973
	.xword	0x52c7cead09a8a0af
	.xword	0xf0c8004af3c04d3a
	.xword	0xfb8d416ca032bae6
	.xword	0x9ea8613468f3a72b
	.xword	0xd974a964fbecd66d
	.xword	0xc0018b80e909d98e
	.xword	0x94ad3e37acc03609
	.xword	0x463d79b9c6c775e6
	.xword	0xb7b6d3eb842b4c4b
	.xword	0x31f8ca3e3a5fd477
	.xword	0xf08a6bae9f5d023e
	.xword	0xbdd921d294c7ef7c
	.xword	0x6c84bbd9f73ad6a5
	.xword	0x4b0c6b37b9376bd9
	.xword	0xc5366ebcae161916
	.xword	0x66125eb709455778
	.xword	0xd2909935a27e4191
	.xword	0x7f6fa86ce2751b6e
	.xword	0xa2c8e05e63f5a46e
	.xword	0x87ac79e504d5a6f6
	.xword	0x8d645c434b1c3b12
	.xword	0xcbbb37d4dd1dfa09
	.xword	0xd50a5580b50a8aa3
	.xword	0xe7b1dfcf41002c8c
	.xword	0x13973410adf41cfe
	.xword	0xbe0806db80c8089b
	.xword	0xe1073bbb3bfbc50f
	.xword	0xf36ba746be642408
	.xword	0x19cc610d266659bf
	.xword	0xceb4e5b1714a4578
	.xword	0xfcef99d81dea5550
	.xword	0xeea71196449e9126
	.xword	0xf5321713098d784d
	.xword	0xe099f9f08da89970
	.xword	0x6df6b5803dfba72d
	.xword	0xc3a56e7383152b74
	.xword	0x312494544fd040cd
	.xword	0x077edcdc16b0fd10
	.xword	0xa39601f03c8b8898
	.xword	0x5bbc29a6201a0c71
	.xword	0x5043921fe2312af2
	.xword	0x7c00b27eaf3a1339
	.xword	0x58acec3e043487d5
	.xword	0x96ff3444be0f25cc
	.xword	0xa65833505ab2f3d4
	.xword	0x0d6b085e0ff73100
	.xword	0x1b8f63ec02952279
	.xword	0x600f41f31e1bcd07
	.xword	0x3eba2220d2209d93
	.xword	0x64309b9db64e26e5
	.xword	0x9901e8a156764675
	.xword	0xda73adf498e52958
	.xword	0x3f4800470df1cc1e
	.xword	0x1feb413b5b6f3d83
	.xword	0x7fbaf927a9927244
	.xword	0x01a6de1210c0b175
	.xword	0x77093b30abcd35d3
	.xword	0xb11e882c54d80a7b
	.xword	0x885d7681c335f047
	.xword	0x678b737fd5e3630a
	.xword	0xfc19587160d639dd
	.xword	0xb466b695b5eefe99
	.xword	0x742469d6624a5c7a
	.xword	0xfd33c0233ffd2f79
	.xword	0x10e5fd140dc7a656
	.xword	0xd164264927ec3a66
	.xword	0xb438646837a41cb8
	.xword	0x6c39fd6059a15367
	.xword	0xdaaa041f0f6cc369
	.xword	0x992b4b856be17e54
	.xword	0xec5386d8523dcdd6
	.xword	0xd727d6752e58687b
	.xword	0x683d9b1f045a334c
	.xword	0x8b99c32eb5a2776b
	.xword	0x8ad68fc75f5571e5
	.xword	0x12b1953728515528
	.xword	0xeca393d37713a8e9
	.xword	0xadcccaa714371b15
	.xword	0x2805d75649421a15
	.xword	0xf8205b00850ccd5a
	.xword	0xbf3a6cc07bf2b1a4
	.xword	0x8d6f13a59e2d7918
	.xword	0x0e96db46516cc47c
	.xword	0x10ff32aa734b666b
	.xword	0xa0bf0ff52f5ce6ef
	.xword	0xd59b4e0afdabfc97
	.xword	0xb252c93a35c3c056
	.xword	0xc841b165dbe4f4dc
	.xword	0x07a1a7ee4fb90b86
	.xword	0xbcdf42eb2dba1c69
	.xword	0x3658744123cb5047
	.xword	0xe3037c7e6527207b
	.xword	0xc61096099c59877a
	.xword	0xfbb7ce1bcdfca6e1
	.xword	0x7310a9c905946a06
	.xword	0xb8614ef2ab8c0de9
	.xword	0x641d942fb7333ade
	.xword	0xc2bbd2fa1ed526b8
	.xword	0xd6dcaa953defc2f9
	.xword	0xa053cb37aab2c677
	.xword	0x41ffc547a76a2316
	.xword	0xcdda51d890362926
	.xword	0xbe2a7d9f997c85f5
	.xword	0x5b2c22e0a9098a75
	.xword	0x60e6bdbdddc27f6c
	.xword	0x4dd2685ae9458cb2
	.xword	0xc00d1aefd64860fb
	.xword	0x8c142fd6ab9da235
	.xword	0xc317714b9b7d21c7
	.xword	0xfbb5032c72135fe1
	.xword	0xd01a93f6456779c3
	.xword	0x3e0a94d738616547
	.xword	0xfb744d76f15116ef
	.xword	0x5f04fcd689f5c395
	.xword	0x52f90aa673ad197c
	.xword	0xe367995d8b00e323
	.xword	0x33380e02f4b73ad6
	.xword	0x766f62eed4769009
	.xword	0x9c4a3fcf76a4c607
	.xword	0xd8f338662571331d
	.xword	0x37663f8d736f5c88
	.xword	0xf4f05c9dca184ca1
	.xword	0x941652f8b207e36e
	.xword	0xd8df43dc5d05d14e
	.xword	0xc0636f47523261a5
	.xword	0x584822946ad96efd
	.xword	0xabc3a155344042a8
	.xword	0xdfe6d9132cc05bf7
	.xword	0x4c63735ddc930fce
	.xword	0xc13b58e97b78b325
	.xword	0x6b945b6160091fa4
	.xword	0xedebc458e52a731e
	.xword	0x458427e003856a45
	.xword	0x95f9520297752253
	.xword	0x7e7def97eeae4d1a
	.xword	0x1011baf297100705
	.xword	0x153b9109ffee3341
	.xword	0x251ad125c8ba3453
	.xword	0x166ca6d995639c89
	.xword	0x5551c6a8625be47b
	.xword	0xd2c36781182debb5
	.xword	0x1abcfbcf67edf205
	.xword	0xd1330b7103b43a2e
	.xword	0xc937009ccadd71c8
	.xword	0x353c811a5baa8faf
	.xword	0x999f63b66b123d58
	.xword	0x02185c158c38d7da
	.xword	0x32a8313c458691da
	.xword	0x016d5b3cf6ca372e
	.xword	0xfc834f24628d0a3f
	.xword	0x2c02bbaef444ffaf
	.xword	0xf4157d039e7bb18c
	.xword	0x3b62da4d63c13bfd
	.xword	0x1a187027139b5984
	.xword	0x658fb8a06726df9b
	.xword	0x2ea1796583eaefef
	.xword	0x653b16028a28cc85
	.xword	0x0eed1f6bfa6caa41
	.xword	0x83793bfaec339a29
	.xword	0x3e2bc109178be02b
	.xword	0xb4227fc781fe5106
	.xword	0xb2e371be1f7ec4ef
	.xword	0xc05d4891ae7c9ab6
	.xword	0x3b820b621fff41b0
	.xword	0x4c406cd427b8367c
	.xword	0x3dc9af00335d96bb
	.xword	0x17b4f737cf822c1c
	.xword	0x727c03132864d2f8
	.xword	0x4388abb0d72b4fd9
	.xword	0xd254896eddf1a12b
	.xword	0x4c761453202e8176
	.xword	0x24bf79e1e3917fa4
	.xword	0xa258a6e2ddfa54b9
	.xword	0xcdb5434d5e7caed9
	.xword	0x4829beb505bc8a67
	.xword	0xb7041e0e25043c47
	.xword	0x84dd341a616ad1fd
	.xword	0x244693f41ce4980b
	.xword	0x434d5bde3c42980e
	.xword	0x4cc6e8a5348e4cb2
	.xword	0xc9f281ab98c9a22c
	.xword	0x7aeb7da963b7484a
	.xword	0x115be28087e49866
	.xword	0xd616dc10fb062935
	.xword	0xb09441b76f6590b5
	.xword	0x09527abf18d41b99
	.xword	0x3f35598e5fe18e1f
	.xword	0x8fd7b9073a04b970
	.xword	0x60e7f1040f3a6550
	.xword	0x399492749476b641
	.xword	0x3198377ae3de54ea
	.xword	0x40af55cb9891659c
	.xword	0x2763d35f0e0d2194
	.xword	0x40ab2899032906d3
	.xword	0x2582d6986af67c06
	.xword	0x2d0ff8fab8c29da3
	.xword	0x8e5cf73cac06e4f4
	.xword	0x0483d8d06e603f8a
	.xword	0x9bf6b140dad274f5
	.xword	0x808e34dcdfe7ad7c
	.xword	0x925325d09bab3075
	.xword	0x739293a87b0025cc
	.xword	0xb425f1a9edff8052
	.align 0x2000
	.data
data_start_1:

	.xword	0x52b0e2696d674fb0
	.xword	0x8b53671d8dfea385
	.xword	0x8be0b89d8620eae0
	.xword	0x0fe97c1eb61adcec
	.xword	0x95c07cd2529d27c6
	.xword	0x2afe1230c5d82869
	.xword	0x454e883f8211423e
	.xword	0x53e9891aea58aae4
	.xword	0x9f1fb13b26816919
	.xword	0x51f925580a96cfea
	.xword	0x75e0fece4cce6eb5
	.xword	0xa75e34dc24cc7434
	.xword	0x389abd332c1fc2e1
	.xword	0xcc2ba48a0ead2c9e
	.xword	0xf3243b615e4dd550
	.xword	0x2c6a22a6e16b76ed
	.xword	0x146ec269b6f503fb
	.xword	0xd98841f22b71124c
	.xword	0xbbb8a6d582c8c467
	.xword	0xea41f54aa393f235
	.xword	0x42c5fb49f8ee3216
	.xword	0x08e653c2ee543cef
	.xword	0x88268acd9c35ca9e
	.xword	0x423f3bdee06a7139
	.xword	0x092818f773c00e26
	.xword	0x148ef8f373939201
	.xword	0x59e0d54548b4b2a4
	.xword	0x8b66d0c269c4fbae
	.xword	0x1dc0114668486818
	.xword	0x944f024ec54fbc68
	.xword	0x9fb8d4cdcab461d0
	.xword	0x38fe7ae4f1e11c10
	.xword	0x02dc50a822784b9b
	.xword	0xa29d7b48fa3cc9b4
	.xword	0x4ddb3b543c9fb34d
	.xword	0x2d930dd4e0963fca
	.xword	0x17cb3c944b9e4772
	.xword	0x52938ab306d5840b
	.xword	0x0a2afc6e78ff641c
	.xword	0xc575688f58f3ec22
	.xword	0x2a2161f7f61c469c
	.xword	0xe336230505943274
	.xword	0xc2f0e1ed6d8bcb2b
	.xword	0xe68a5638ac738d60
	.xword	0xcb6b111d13baea22
	.xword	0x8e103e5fe6168805
	.xword	0xca67a78132c14f6b
	.xword	0x70d55621fff34960
	.xword	0x330a3c2e015d12f3
	.xword	0xcd1140bdefb14228
	.xword	0x81743ce0000a436f
	.xword	0xdd842d0411612a36
	.xword	0xfbd2e5cc07f2284f
	.xword	0x6809f90f5ad1cc9e
	.xword	0xeb804ae8c6e84c0c
	.xword	0x2ac94cd9a13a8bb4
	.xword	0x306cf8404f09e965
	.xword	0xab22feb3392a31f4
	.xword	0x85c6db7d5d88841c
	.xword	0x1f0beaa18a9f8ceb
	.xword	0x7e8cffdeadbf6c26
	.xword	0xafdbc026cb351d11
	.xword	0xdf9a2ee7450acb3e
	.xword	0xa9319af534238350
	.xword	0xd6e418ff37cc3d20
	.xword	0x3939f6a3ecbd3b93
	.xword	0x7f300383994c5a1f
	.xword	0xd2dff8ae4241712b
	.xword	0xbc56b29b845e1fbc
	.xword	0xe9256b20a0982711
	.xword	0x665e9e3da554d931
	.xword	0x9e21fb31e7d1ff1b
	.xword	0x42a54563e59d5c39
	.xword	0x9f8129b3cf4b9e6d
	.xword	0x67c92a9d2c3db5e9
	.xword	0x44712f41f6ac101f
	.xword	0x7a70d5e64e6f6bce
	.xword	0xf5fb2f3f6e9e6997
	.xword	0xf5dad8e9c16d3071
	.xword	0xc00912422278a19f
	.xword	0xc0b45a7e4cb4bd0a
	.xword	0xb071f8d2950a6d53
	.xword	0xdb15855b6c2f49d1
	.xword	0x9fb0a681622306f2
	.xword	0x5bd2a893c7e3b024
	.xword	0x1b3e05d1fb72fd82
	.xword	0x3b17aab247b1bfce
	.xword	0xae6c0f66d0b23f22
	.xword	0x8b217fc789f3e330
	.xword	0xfaa734de64c61b47
	.xword	0xb64aa474bbef1605
	.xword	0x7bc0d0ccf1a602bd
	.xword	0xb2d420a3be3e6273
	.xword	0x498e9d0a5ca1e78a
	.xword	0x2ac7dd5dd4c005ca
	.xword	0x314541dc80c3bf53
	.xword	0xb482a68286450566
	.xword	0xad1ad1da6435624c
	.xword	0x8fbae8eb4222bead
	.xword	0xd912f05e836afea6
	.xword	0x29b5a4c67f98c5f5
	.xword	0x3dca632cf2002dc4
	.xword	0xda6772f0560c92e8
	.xword	0x9c4acd6d7879aee5
	.xword	0xab4c807d770c493f
	.xword	0x4152188e5cb3982c
	.xword	0xdc28828a8c1ad02d
	.xword	0x450435eb1a9ecfea
	.xword	0xa2d0c76de8711b89
	.xword	0x2cef261eebc87a1c
	.xword	0xf21de895bd4b3f23
	.xword	0x4d161945be28e27e
	.xword	0x312dd268c1c3b7dc
	.xword	0x1c7ae11fee13b840
	.xword	0xa82d9f23fe147f14
	.xword	0x1a702ad405e387ba
	.xword	0x806e99f1b36a1f90
	.xword	0xd5ab0325154ec899
	.xword	0xe8cd03d0c3119a32
	.xword	0x9651f60d88bc047c
	.xword	0x6fba2811632339b5
	.xword	0xfcff9903fecd0a0b
	.xword	0x752f3a3b63e671b3
	.xword	0x4e354e441f0ee2d8
	.xword	0x23c90a9e8b0f0fdf
	.xword	0xc09c3ae97e13434d
	.xword	0x65aaa6ac91cbec6f
	.xword	0xd13bd6734bbdf8d7
	.xword	0x4da1050414e40076
	.xword	0xdc69ca2611a8fc55
	.xword	0x0bd73c2a65de6776
	.xword	0x920e7725123c6d12
	.xword	0xb8bbb5f410151be6
	.xword	0xbbc9f69aa3f688e3
	.xword	0x5b42ea2057e4e9ae
	.xword	0xd55dc88257f2b0e5
	.xword	0x5cacd8d3d6aeabfe
	.xword	0x0ca3b344254ed207
	.xword	0x88a1358cad152e53
	.xword	0xdaaaf949867b0431
	.xword	0xd8178d2434f55d0a
	.xword	0x553ddac4c7da26d1
	.xword	0xfec49bac5fbba44a
	.xword	0x4284634f5a516628
	.xword	0xd9ca21ba36655ec1
	.xword	0xf53b8dbdff9cb5d7
	.xword	0x862df0e3f0aad4c4
	.xword	0xf3455e601154bd03
	.xword	0x98a03dce9dac01b7
	.xword	0x2c84b022cc58478f
	.xword	0xe1eff68e69dc7ee2
	.xword	0x4854886282f5f48f
	.xword	0xf07b6f69dd2492a4
	.xword	0xf17ce9bb73baa4ac
	.xword	0x0676bfd1d4740db5
	.xword	0x6930ed76b35d740d
	.xword	0xeab7ba1f54391124
	.xword	0xf526d19adbe41a07
	.xword	0x7e88f7ce3da3be1c
	.xword	0x957a06e6ccaf633d
	.xword	0x4cd1f2e6c883d437
	.xword	0x715000ba2607f9ed
	.xword	0xcd64cd531be29e2d
	.xword	0xca8d401dadb96eeb
	.xword	0xfe83ca244f4c57aa
	.xword	0xf42614b535ea1e50
	.xword	0x90ca8aed87b9fadd
	.xword	0x3fe27b4bb06515c0
	.xword	0xda429f3f0cccec08
	.xword	0xdb71659cd3763c3a
	.xword	0x58a95c28f34fcd90
	.xword	0x37e63280b02071ac
	.xword	0xe91ad880ec32c602
	.xword	0xb5e767ed31b08dfd
	.xword	0x43bb4473e2b5c8cb
	.xword	0x964411c0431365f7
	.xword	0x1ad5c9920f1b928d
	.xword	0x9e752294670f4611
	.xword	0x28b8a37f4bda4b61
	.xword	0xfcce908664bbeba3
	.xword	0xed2e0d61a6752d76
	.xword	0x11ef6e643c5c2ad5
	.xword	0xadfb98bb306dc320
	.xword	0x5a1c87ce0621ca39
	.xword	0x33a78dbbc2b428ff
	.xword	0x8937e79f27905604
	.xword	0xabb5610b21bc1fcf
	.xword	0xd302e7b2c5ce720e
	.xword	0x2086a36089b670cf
	.xword	0xef154254f3030d1e
	.xword	0xd7672705605b2b19
	.xword	0x347c7aa2aa78611b
	.xword	0x6aa496a5215fdaa0
	.xword	0x15f0631342773738
	.xword	0xf78c61ad6ab50359
	.xword	0x329d106f5d2ba5b1
	.xword	0x7d4cde31a9adc08e
	.xword	0xfbe7f98ccf6588c8
	.xword	0x6fc8929a2a79737b
	.xword	0xa477c185519be066
	.xword	0x50d3b59cd63e2ac2
	.xword	0x92dc7ee74ca79f78
	.xword	0xf38acbc7ff944ad8
	.xword	0xb658ee4108477178
	.xword	0x6bc5f73ad2200f2c
	.xword	0x22ce7d3343d35c16
	.xword	0x5beb9b1296cac242
	.xword	0x1f693950576b37e3
	.xword	0x0bbe39f610ce97c3
	.xword	0x00184ca2b82ccda7
	.xword	0x7aa6e060b60a5dca
	.xword	0x395feee95b97c7ea
	.xword	0x72190bc88489c512
	.xword	0x124632a1820cf0a1
	.xword	0xf0c20556ba95c1a4
	.xword	0x70641fb9ee0fa2e6
	.xword	0xe32ddd9a28cb7e98
	.xword	0x888ac9082e79e021
	.xword	0x9623f0ec7bad9100
	.xword	0x4682a37b876dc5f5
	.xword	0x17737dfa3d6810e9
	.xword	0x13c4e4f6714c5e23
	.xword	0xfbede6a385b5bff5
	.xword	0x495355598d7135a6
	.xword	0xbe445934a7082a06
	.xword	0xe3037ce9a4eb71b2
	.xword	0x96515f5cdcc52319
	.xword	0x25a14ac71678896c
	.xword	0x56bbf33930393048
	.xword	0x6b0587e2332a4616
	.xword	0x9d880e10b2aac767
	.xword	0x1525d0c383edd91b
	.xword	0xbcb62d93b0850105
	.xword	0x01817edbe31fe733
	.xword	0x8fd264741258c823
	.xword	0xa836c334c0a53c53
	.xword	0xfc8cd3c16d80711d
	.xword	0x6065f62bdf7615c8
	.xword	0x12f1b58f6fc5940b
	.xword	0x69b9c0845335d967
	.xword	0xacde10871e066167
	.xword	0xba23602561844cf0
	.xword	0x330f29f2294a7dc9
	.xword	0x2f6d79a88268580e
	.xword	0xee5123fcd5ec26f9
	.xword	0x85ba63624f2f8281
	.xword	0xf9fc14cb1b507215
	.xword	0x3dee2a576b6571bf
	.xword	0x04a85fc758149e74
	.xword	0xe88749bff76cf8b2
	.xword	0x1580cfab0ce6ed0c
	.xword	0xf1d735770d577ec7
	.xword	0x65c01b1919af097e
	.xword	0x2db44c5b306693b4
	.xword	0x94cd9e08c314a545
	.xword	0xff09a52e0270703c
	.align 0x4000
	.data
data_start_2:

	.xword	0x6e6de25ab3ea7733
	.xword	0x62bc80242fc9fe26
	.xword	0x1134c988f735f049
	.xword	0x787243336fb05f80
	.xword	0xabfe3ea03530e7e2
	.xword	0xf98cde766248bfc0
	.xword	0x8c91b5b3d7ace218
	.xword	0xa1e4739d21018126
	.xword	0x6fbed38b8ac1c835
	.xword	0x669b9f0fc597014f
	.xword	0x6c7c27ef8d808749
	.xword	0xf3c11ecf828f5ef5
	.xword	0x8c6460f1c0d135d2
	.xword	0xd3600b48b57e8973
	.xword	0x8e0e6ae0e638ddfb
	.xword	0xa19dfff7b25cd012
	.xword	0x0c7e1bad137cf127
	.xword	0x5374b6414e91e39e
	.xword	0x5914d6a46e62b6ab
	.xword	0xade3adc713e1ec69
	.xword	0xeb1ea225a94107f8
	.xword	0x54bfa553f1825b67
	.xword	0x0a5456d769210885
	.xword	0xbece693d3b5b19ba
	.xword	0x1a4a912263e5fac4
	.xword	0xc10c8664d0d007b5
	.xword	0xba579325984c189a
	.xword	0x4cf552997107d9a1
	.xword	0xd8116f1294dfb066
	.xword	0x4553de4b76f03106
	.xword	0xc9f1cfc8a123db26
	.xword	0x90ae287e1ea24c60
	.xword	0xfc428aadba5b174a
	.xword	0xdaf47c60e63c1b95
	.xword	0x2dd6827988d99290
	.xword	0xab73886a12149ca8
	.xword	0x3424467a99929284
	.xword	0xcff53a4c5720f857
	.xword	0xc324d1a0db284872
	.xword	0x3e53401f8db9e103
	.xword	0x7171fc7194195188
	.xword	0x28e5d98583adf5de
	.xword	0xcea628d337127312
	.xword	0x4e3447edd3082e21
	.xword	0x6d37c3ec3bd5caa7
	.xword	0x066680c9a5624c4f
	.xword	0xad7f8fb569da2bed
	.xword	0xa00fa04576756437
	.xword	0xbea80809c3bb707a
	.xword	0x987adf4255c85277
	.xword	0xeb012db0729d6362
	.xword	0x2389381899ce5897
	.xword	0xd8637112f4ea4d48
	.xword	0x7b8868827eb16b6d
	.xword	0x647b682e3300e8bc
	.xword	0x9734a0f28654a330
	.xword	0x1faf93477c868587
	.xword	0xb891c654fbd31890
	.xword	0x9e7ac5e0ab666d97
	.xword	0x336d65943ea9ca1f
	.xword	0xd79ecfc16f8d7e5d
	.xword	0x473cee93dd7c4721
	.xword	0x13841b9b6df83eda
	.xword	0x7c83fde3093eb41a
	.xword	0x76a6ac6c4ad2c546
	.xword	0xe01e1a119f5146fe
	.xword	0x89b3cc01fdea23fa
	.xword	0x639999b77b069bad
	.xword	0x094665da264088ac
	.xword	0xf9ce5efdbc7bac2a
	.xword	0xfc921adca6482a7e
	.xword	0x3e17c6f4887cccea
	.xword	0x9daecc88950b0bb8
	.xword	0xe8a8b8a35638d4eb
	.xword	0xb8b96af94fee54b2
	.xword	0xf90790ffc7287faf
	.xword	0xb0342a4fc58b140b
	.xword	0xd418d93544b71f75
	.xword	0xa0913f1d86b09122
	.xword	0xab5fae0849d986b0
	.xword	0x481df8abf518c44e
	.xword	0x4542a6e6c2b21933
	.xword	0x086c0abfa4313452
	.xword	0xe0986f836d332e58
	.xword	0x34fc4f001977e709
	.xword	0xafcde06967b94629
	.xword	0x6a67eef7d4757731
	.xword	0xe5f0818117e9e1f1
	.xword	0x1a5f358674f897ad
	.xword	0x96272f4ad37b6d7f
	.xword	0x7bb79bcdccdde3fa
	.xword	0x58f2a76be404110a
	.xword	0x8f434284cc53c154
	.xword	0xf3510c9ebca8334a
	.xword	0x1c7a88868ea7858f
	.xword	0xaf430c042ca102a0
	.xword	0x9b77291d5a04c621
	.xword	0x1dcdfc6f2c17df5f
	.xword	0xeaae41b9f6131d1a
	.xword	0x332a20c8ee8b98d4
	.xword	0xc1754c221b11a0ac
	.xword	0x6df30d8f06b42908
	.xword	0xee43ce60beea9cbe
	.xword	0x05b5acd0ed733632
	.xword	0xbd12c4bd12ef87c2
	.xword	0xe8126c1ac0919b96
	.xword	0xcf749c4bf588afa7
	.xword	0xda65e8fdbf506d73
	.xword	0xc9266f44cb849ef1
	.xword	0xc62bbd4dc0899a67
	.xword	0xd6b51b11039b05d6
	.xword	0x53ecea4fdf379cfd
	.xword	0x93eab3a436d66ce4
	.xword	0x0f90d9f5ba1e60f9
	.xword	0xfdfe5cde196492f2
	.xword	0x7edb62921656cc85
	.xword	0x46ef25fbf222e18a
	.xword	0x13d13a803107ed4e
	.xword	0xcdd304a300a3013a
	.xword	0xe5c05dfc3508f616
	.xword	0x43ff40e5bd196bbf
	.xword	0x751d698439015ec9
	.xword	0x05b7fb7bb76ab4f3
	.xword	0xfea9c54377ac94a5
	.xword	0xcc07654fcd631466
	.xword	0x55febfaf157303b1
	.xword	0x9c833b5befb9c29c
	.xword	0xb1643320025208d3
	.xword	0xd1c2884589e498e6
	.xword	0x352d27f8d7cf80f1
	.xword	0xc082a1a11f6b893a
	.xword	0x60e6b55c176e3790
	.xword	0x60f8fb20752fc7b1
	.xword	0x81ee9c164bbd62d5
	.xword	0xd1c3eba1c72c3b47
	.xword	0x53ed4afdfda89ec4
	.xword	0xb3328b5a70e251b9
	.xword	0x1a5594551a6b64e4
	.xword	0x3421e528ceaf49bb
	.xword	0xe5236da435aec3c3
	.xword	0x603c273965dac8f2
	.xword	0x12b8b7564f1506a3
	.xword	0xe1d8fb0e1ed34101
	.xword	0x1a96901f7a8f185b
	.xword	0x495cbb0daaec1ee5
	.xword	0x8efda6735aafb512
	.xword	0x9d8c783b22f52ce7
	.xword	0x247d23e9aa081160
	.xword	0x934e95c657b33986
	.xword	0x007d6ae90f9e4173
	.xword	0x02415e43ef70fb84
	.xword	0x83a3589d27ff0d21
	.xword	0x0387bd152ac7b1c2
	.xword	0x89f6444caa4e6d07
	.xword	0x02e85b85004a621d
	.xword	0x1498ac979796adf7
	.xword	0x052a06239535cf1b
	.xword	0xd022fdde89197db0
	.xword	0x905b39aeba052bd9
	.xword	0x0f3677f0de3b2a24
	.xword	0x2d7b9d3ed4820f37
	.xword	0x10179e5928baed25
	.xword	0xf2c30a2564e1ef8d
	.xword	0x269264dec179ca51
	.xword	0xfd635d41227dad4c
	.xword	0x58fbd48117699043
	.xword	0x5519ea10e31679cb
	.xword	0x9eea4f1bfde28f4d
	.xword	0xeaf533c1f3b5edad
	.xword	0x69f7f3eff041cb55
	.xword	0x50cc84f0c7e795c9
	.xword	0xf74e6c72423b7cff
	.xword	0xdcafcffaf18e179b
	.xword	0x8fafa0a5fd8c3d64
	.xword	0xaf6cc7a3cd20856d
	.xword	0x9c15fbc12619ef13
	.xword	0x3923e20939b3e66c
	.xword	0xb54e518b2499c02b
	.xword	0xe216e03ee42039d7
	.xword	0xabfa0e8b90237cbb
	.xword	0xbe6610efa481c346
	.xword	0xc211ff7bd46e291c
	.xword	0xb01e8c2d145ae9ba
	.xword	0x2bd23591bf5e11a6
	.xword	0xc97910724f0422a1
	.xword	0x2af1aae5b002c2e2
	.xword	0xd02ad1b4623f1d31
	.xword	0x1b6b38ff1ff3eaf6
	.xword	0x7968a556d51be7d1
	.xword	0x342f011fda5174ab
	.xword	0x62e0317998e08b4f
	.xword	0x15ecec603988c534
	.xword	0x71fcda88676a69c1
	.xword	0x82ef681bd8c6c43d
	.xword	0x6327e39411f9a8cd
	.xword	0x0143a445d6f314ee
	.xword	0xd2c6f611a47038a2
	.xword	0x022518892a7e326b
	.xword	0xfc00552116f9b8ab
	.xword	0x5cd3d3ea274cf27b
	.xword	0x0df683b294a5dce3
	.xword	0x37e4c68e0704f12a
	.xword	0x4f2bec170c92492c
	.xword	0xc5de779a1fc3d68e
	.xword	0x0467cb92a5083748
	.xword	0x09c39ac84e90b1da
	.xword	0x33ac8c538af1413b
	.xword	0xc9a1f16d5eeab281
	.xword	0xe4c76f615bd63f67
	.xword	0x5b3e408134f7cec4
	.xword	0x2d9c3ea7e4ecebfb
	.xword	0x87ab2a4b10cbbe04
	.xword	0xb5c22178756a5a13
	.xword	0xc03afe75a204aeaa
	.xword	0xb052a50e26e53349
	.xword	0xeb530971f3d1ec7d
	.xword	0xda725495a8c04c95
	.xword	0x529ef5a965a97f98
	.xword	0x14515ee62cb94ded
	.xword	0x0af763f190457334
	.xword	0x256a0f99142e5ee5
	.xword	0x0172369ebb946c7d
	.xword	0x927908d452bcefd5
	.xword	0xb80378c743206a8d
	.xword	0xcb691bc47f9b5c23
	.xword	0x323dac091e859fce
	.xword	0x37e601fa07e20b29
	.xword	0x92ed21ec97d456f7
	.xword	0xef70aecf444482de
	.xword	0x726bf166187588fe
	.xword	0x0e7f4bea91032adc
	.xword	0x96451821c94ddbef
	.xword	0xc10d67ee4f3ad76c
	.xword	0xef8a067c5b167def
	.xword	0x3e6acf5109088975
	.xword	0xd51e3150ce799638
	.xword	0xd582242be92e4e9b
	.xword	0xd6e32e1e67d01a52
	.xword	0x908880cd73cd83e7
	.xword	0x00d1945d41dd6f2b
	.xword	0x53a8f475786dac04
	.xword	0x29f4000af14a6818
	.xword	0x6ff625d7ee02a690
	.xword	0x696ca28e0c32afad
	.xword	0x27616bdb2ed6e05d
	.xword	0x332e6b32903ccadd
	.xword	0xb261857ca39a9264
	.xword	0x2b8e161adac1e4d9
	.xword	0x7f41c74b483064be
	.xword	0xadeae23d32af02a6
	.xword	0x7ed4877f9a3c4f55
	.xword	0x88bb76ef20a1542e
	.xword	0xdd82454374dbb6e5
	.xword	0x5506f6993dde6785
	.xword	0x42518f328c80d7f9
	.xword	0x390afa9b4de04ff9
	.align 0x8000
	.data
data_start_3:

	.xword	0x4b76c2952d3cd125
	.xword	0x12f0ef32e4f9ad81
	.xword	0xfd5908ddf8d86d5a
	.xword	0x1d72a60c44d094cc
	.xword	0xe5be7d369663599e
	.xword	0xd347d0187d4ea2e7
	.xword	0x1f08f793d02f881a
	.xword	0xf5d6bf1d8dadb241
	.xword	0x3808417bb7e39972
	.xword	0xe0aedb4510bca6d1
	.xword	0x2321357e7abca102
	.xword	0x59bee1dd1d244581
	.xword	0x5b481a916675d62f
	.xword	0x399aff1305c03a1b
	.xword	0x9558f7b14612cd74
	.xword	0xcf1e816ab68ed0ea
	.xword	0x8d4746adee540a88
	.xword	0xb6d40c2871b33250
	.xword	0x234bcd1e3d1babce
	.xword	0x4364f30e9da74cbc
	.xword	0x8a662ef5fe3fefc3
	.xword	0xb08366bf08488550
	.xword	0x625ca31c55255e3a
	.xword	0x214ea36ec007a7ad
	.xword	0x51d1c4cf6558046e
	.xword	0xedd618053ac410ff
	.xword	0x92ee0dfce8b82861
	.xword	0xfd47cef14fc99116
	.xword	0x9924842e3eb83ee2
	.xword	0x860148d96fa891bd
	.xword	0x43723baa08e2c22f
	.xword	0x1ef388e3c733e6c4
	.xword	0x625264db50724ba2
	.xword	0xda0fad9f57dd1ea4
	.xword	0x5b1575c1f889094d
	.xword	0xeb5c1d0a4d5ad142
	.xword	0xea15988b43165f09
	.xword	0xcbf85fccee921356
	.xword	0xcb4cc533be6889dc
	.xword	0x481135c8a165dad1
	.xword	0x01e4838aefd824da
	.xword	0x0e9b5a849a5e6e53
	.xword	0x8e376ee40ed4ef13
	.xword	0xb71f55bc9e07ba91
	.xword	0x5732cbea60fe47a1
	.xword	0xb0ac9ab5bf04d53a
	.xword	0xd24153a5d3d56c9a
	.xword	0xd99e6c0e2625f59f
	.xword	0xc1d82063da0cdb30
	.xword	0xc925ba4522dfef4c
	.xword	0xd6c31d37cb60a415
	.xword	0x2d3b2f4f0b941826
	.xword	0x0de18840651315a9
	.xword	0xdd913296054eabc2
	.xword	0xcf2e88c91be99832
	.xword	0x011cfb30be53921a
	.xword	0xd4ede6025726ea2b
	.xword	0xa5b76b96d2c06d30
	.xword	0x342017cf2f032dc9
	.xword	0x8815edee6bfb4063
	.xword	0xff5e27052aebdde6
	.xword	0x7d818d90941c7dd4
	.xword	0x61f98f7ac84e09f5
	.xword	0xca0f960ea93aafac
	.xword	0xf904a26ad63c4cd1
	.xword	0x8a1d02660c20dd8a
	.xword	0x72079fb397a78111
	.xword	0xe219fc8443a2b741
	.xword	0x829958768e843928
	.xword	0x768eecb585f700bf
	.xword	0x580192ac1dd56a6c
	.xword	0xbb64addb39a2265d
	.xword	0xfe85ee1222013700
	.xword	0xefedcbb0881b7761
	.xword	0x751640bd4d205598
	.xword	0x3efe78588b49c6cc
	.xword	0xee2d727116853233
	.xword	0xa62561b85fc2b110
	.xword	0xe5ef1b9ad9436fc9
	.xword	0x52d81c42444008a5
	.xword	0x2c2289d2bbd392e0
	.xword	0x7ffb2daccc985f70
	.xword	0x0b6dadeeffb99c25
	.xword	0xf91aa7c85a060404
	.xword	0xddb5ef9ebfbdb341
	.xword	0x61aa7bd70011a3fc
	.xword	0xe569e8fb2b441529
	.xword	0x2bb72d852719775f
	.xword	0xb239b99f1a9722d8
	.xword	0x3fc65d4fd1c8fe73
	.xword	0xe25fec7360ed60d9
	.xword	0x6143e2e97d1563c9
	.xword	0xbcf21dba9c0b1042
	.xword	0x21b86cf83c55095e
	.xword	0x9df6eb0cdef6d6f3
	.xword	0x43ffdd858ae24453
	.xword	0xfbce061a752bfa16
	.xword	0x4245a92aafbe7681
	.xword	0xdbe77f98aa099306
	.xword	0xff02db7887e8ce02
	.xword	0x924b1f12186455d1
	.xword	0x59ff509d941be74a
	.xword	0x45c809952ddb803b
	.xword	0xbe8843a238942be2
	.xword	0x30bcb2bde82359de
	.xword	0x0b73ef2fc5d28e8b
	.xword	0xcf5be54143870127
	.xword	0x05285e00d123ed3f
	.xword	0x031707171b9b4794
	.xword	0xf7ce0dd3abd3aef6
	.xword	0x92465313d9b17228
	.xword	0x8b0c797348f44b97
	.xword	0xe376748882a68a30
	.xword	0x5d59e4c5ee6ff9dc
	.xword	0xd9fcb8da9692e088
	.xword	0xf9345e4604bbba9e
	.xword	0xf29b5c0ff09e9a94
	.xword	0x9eb09e278b74d061
	.xword	0x4fa8985c3ba5b1ce
	.xword	0xe50c0de4747cdb29
	.xword	0xf93ba5cfce3f042d
	.xword	0x4c9b49a6226d7306
	.xword	0x91e5cbf4dbf7262e
	.xword	0xea6b2baa16bf7912
	.xword	0x58d40f6baa3f6517
	.xword	0x24c417c5152fe49c
	.xword	0xd4fe065b5b190a74
	.xword	0x84db1560fc36f40f
	.xword	0x591a453524736ece
	.xword	0xe353a93ffa6f62ee
	.xword	0x65fa47fe34576279
	.xword	0x7378a75b767809e5
	.xword	0xc909db6dc88f59f0
	.xword	0xd1147315028e8ce5
	.xword	0xff15ab8fa20f7372
	.xword	0x1edd7d79911bc2c8
	.xword	0x84ac6ad7daf9bfa4
	.xword	0x71b066ad5dcb2da1
	.xword	0x6927f4c2b7437901
	.xword	0x7697a876bef28514
	.xword	0xa15ef8031b031373
	.xword	0x7456db946490b520
	.xword	0x0d7ac18b4300cf03
	.xword	0x44acdfdab3b661c1
	.xword	0xe9ad88e6c9617fb9
	.xword	0xb9366630bf38dac3
	.xword	0x2af8d9100e162de2
	.xword	0xa42bb9041cd8118e
	.xword	0x4ba2182760f518c4
	.xword	0xf032d87f625b3c32
	.xword	0x5b8715724c33fa1d
	.xword	0xd8d0514503d80136
	.xword	0x1abb469ace9fb6af
	.xword	0x6613b6305a81de65
	.xword	0x904a873cb1d63744
	.xword	0xc77036153c2f003f
	.xword	0x2937d021e3d1be41
	.xword	0xf2dd055c1614f428
	.xword	0x972d50f0bdf286f9
	.xword	0x39abfea71af89c43
	.xword	0xc51ccd7d128515a0
	.xword	0x9f9cd86c12e8eaa0
	.xword	0x1c71d23f3c448240
	.xword	0xad6cd39c04463b7c
	.xword	0x5dccf81db6055c6d
	.xword	0x208caa796a9abc2e
	.xword	0x139cc716a6d90a3a
	.xword	0x21697a525415f022
	.xword	0x768a9f01e54e81af
	.xword	0x870cca9b751f264f
	.xword	0x7aabdf94fc19ad3b
	.xword	0xc62f75b644fbadc8
	.xword	0xf439b7a8cedd1f8b
	.xword	0xd6d5b0b367164878
	.xword	0x053659ce25ba97db
	.xword	0xde0a5c0c528dcca5
	.xword	0xbf4a929c51977421
	.xword	0x7364d5bec3fcad13
	.xword	0xb95d5ded01bbe4ef
	.xword	0x8b2fcc0900ddae62
	.xword	0xef220568ef8dd186
	.xword	0x0415cb8ef5dfcd4c
	.xword	0x6ce8f7f8bc941801
	.xword	0x40a8543c57dbc709
	.xword	0x002f44879d7c9407
	.xword	0xc29e178bbd7ff30a
	.xword	0x5453395ff9a65116
	.xword	0xf35b2bb6985c9b66
	.xword	0xf558877b45f93da4
	.xword	0x145301b54a3c0a73
	.xword	0x059e3826e311335c
	.xword	0x9893b1e3129c0e28
	.xword	0x4ad40e39bbf90ad8
	.xword	0x116f8a658b683804
	.xword	0x449ea1a06da9c4ab
	.xword	0x36a6220772ffe1d6
	.xword	0x28732af7ba8b2d9e
	.xword	0xb18adeecd34f7683
	.xword	0xb6ed7c140f78a9e8
	.xword	0x289844acc034e955
	.xword	0xef6fcd4231428f26
	.xword	0x6f9b77ab375236b2
	.xword	0xe246436fc6471e9f
	.xword	0x40dd26eb506f86f9
	.xword	0x3e6657804e1072ab
	.xword	0x879aecf0907464cc
	.xword	0x1399fc092471ddd2
	.xword	0x32bc34e8b6e6331a
	.xword	0x76341f694a99036c
	.xword	0xd0ab28bc9ebdb1bf
	.xword	0x2188c0d814e2abc1
	.xword	0xa4fab6d088573ca1
	.xword	0x62b5795bb4a3395e
	.xword	0x245b1d676c2ed9cd
	.xword	0xa121bfc21965f9df
	.xword	0x83b406a993e1a66f
	.xword	0xce47fd0d3a70a0f5
	.xword	0x91241436afbf4153
	.xword	0x204ef48d86380dd1
	.xword	0x16d2cb50ab35d5c8
	.xword	0x0d80783ed41e62b2
	.xword	0x5b2fbc23e49b7b8d
	.xword	0xbdc3f268d5f8efcb
	.xword	0xc0b4a51808ee6da7
	.xword	0xe132c1905bcfc852
	.xword	0xb225c199b0e4475d
	.xword	0xc4da0b3258614123
	.xword	0xb02cff46bc4283e9
	.xword	0x6a7d1d471bae8edd
	.xword	0xbe3d57b963b13162
	.xword	0xb641352767083a35
	.xword	0x8a1dc06ec1ef0624
	.xword	0x40ea24dca437201e
	.xword	0x4fa829830749ab4e
	.xword	0x475c76f80361037a
	.xword	0x984a7d47334d50ef
	.xword	0xaed3bd270f8e26b6
	.xword	0xd3c83080481d3d35
	.xword	0xe398e3e02dbf3d35
	.xword	0xd25b88232c855942
	.xword	0xa0eb0ce6f9b885d7
	.xword	0xc1fb70b72b79f69d
	.xword	0x23510c08b6c89570
	.xword	0x4ddbdd3f28a7c64f
	.xword	0xc99e5ffc60c62bcb
	.xword	0x661459d7e21c206c
	.xword	0x93ae19892f7c4e86
	.xword	0xa86e8e77ddbffe1e
	.xword	0xd4b44e1e38291fb5
	.xword	0x495bbb36703ee85d
	.xword	0xb4ed4559a8870fcc
	.xword	0x273494a3472defb4
	.xword	0x9c31a563d2cc8687
	.xword	0xb8d0f6832e89c0cd
	.xword	0xacae58d00deca318
	.xword	0x1fb8d48ff4208e12
	.align 0x10000
	.data
data_start_4:

	.xword	0xf33305f7f9752549
	.xword	0x9e1042268c38da6e
	.xword	0xa2ddf8d026ab2a87
	.xword	0x75573409fde6ca30
	.xword	0x1120600320b698bb
	.xword	0x827ba73625a46fd0
	.xword	0x05154988a374ec4e
	.xword	0xa0bda4929a4dfa28
	.xword	0x5b7daf6a6c4cb586
	.xword	0xc8150abb55d874be
	.xword	0x5f896a5368c45b22
	.xword	0x8e25c06046f6651c
	.xword	0xa599fa6018eb2c57
	.xword	0x7b9b2daf57656c36
	.xword	0x9a444db8228969b4
	.xword	0x9ce6ea6a55120005
	.xword	0x4526431973f994c3
	.xword	0xecaa6b600fd454b8
	.xword	0xf900d77933dc124f
	.xword	0xccbc966b57e6b770
	.xword	0x270086f0f97ad82e
	.xword	0xc6a1df8da009dbd6
	.xword	0x02b64ce5eddb144c
	.xword	0xf8e408b485182734
	.xword	0xb701fe85ab44548e
	.xword	0xec4b6cab13012f16
	.xword	0xbcb885e42bd4efdd
	.xword	0xec06149b07dd33e9
	.xword	0xa7be2628cef26c4d
	.xword	0x4dda77b97dd876b5
	.xword	0x4c4592cc19eaf867
	.xword	0x45bbdee7ba64ca91
	.xword	0x1cd09eaf1355b1cf
	.xword	0x3bad9b175b3a3d11
	.xword	0x4102e9e06e01be22
	.xword	0xe6b1ee146854a68f
	.xword	0x9d17eef0b18aeaef
	.xword	0x999ef6a094ca20a2
	.xword	0x6ddc590e1febee37
	.xword	0xc7f260c7f2bf9cf5
	.xword	0x0cb11b9c4274c816
	.xword	0x0a5eb7002732a1cf
	.xword	0xcea20c721a96f7e9
	.xword	0x3d60d13d7bbc859a
	.xword	0x8237f825a8ddaa3b
	.xword	0xecd9b33af1370efd
	.xword	0x6c0a563fd0ba39fa
	.xword	0x59a55f836fe49f2b
	.xword	0x72f8a972bce212d9
	.xword	0x1955c18e1534189b
	.xword	0xdd4217d49f572f73
	.xword	0xe35017dd9eae9620
	.xword	0x51668622c25cad0e
	.xword	0x76c5fe088cef84e5
	.xword	0x6b17c6e7e057a297
	.xword	0x4bd8784baa653b0d
	.xword	0x35fac6e843e5d9ec
	.xword	0x002c9acee43e8eea
	.xword	0xef5d3628627ade65
	.xword	0xf8958da10cb70048
	.xword	0x33adc57d28e4c7e3
	.xword	0xa5d95a4fbd77db43
	.xword	0x509511fdbaf8e182
	.xword	0x8d75f6f56dacaaa5
	.xword	0x5a567662362e50ea
	.xword	0x0ab2772e2c60f8d6
	.xword	0x3ba6624597fb1315
	.xword	0xeebfa4e30705546b
	.xword	0x13b6232df84d3233
	.xword	0x1384902745972b20
	.xword	0xeb67781305dc942e
	.xword	0x080a33136d2e823d
	.xword	0x9c862451ddb09540
	.xword	0x359f39f8bae567d4
	.xword	0xb767a7545ad40724
	.xword	0x45169e958a1cafd9
	.xword	0xeccf9929c0013b13
	.xword	0xaa9df7c71a4a2c48
	.xword	0xb4160e3f62ac4469
	.xword	0xdeb26daed1ae70c4
	.xword	0xc96ea0c981b15e6b
	.xword	0x745137ae4899611e
	.xword	0xbe1f58f6cf3717e6
	.xword	0xbb1d46209e25a382
	.xword	0xdb1acb6c698c31b0
	.xword	0xfb01a756d10274a0
	.xword	0x2f78cb0d3390b714
	.xword	0xc466244428926435
	.xword	0xe84c5f0bb456623b
	.xword	0xe701804dcedb1874
	.xword	0x0623c8f4cbe009c9
	.xword	0x4db332525af6c34a
	.xword	0x483387181f3d81f2
	.xword	0x59d4175fec0cf35d
	.xword	0xd18ed81320513f59
	.xword	0x24c12b2aa33814f8
	.xword	0xfb662c45e2d907cf
	.xword	0xf3ad93327cab9b4e
	.xword	0xd1b607042ba120e2
	.xword	0x28dc705684fb42bc
	.xword	0x6b9e65fdad10d803
	.xword	0xdbda5eebcae340f9
	.xword	0x935714bfa3baceb9
	.xword	0x95664cdf5c63641c
	.xword	0x93890a62882ad776
	.xword	0xce9568f46daca7be
	.xword	0x5a3abc1c11ee512c
	.xword	0x4fc3fc1a759052e0
	.xword	0x25bdccaebd071df4
	.xword	0x620f5652dac3dbf6
	.xword	0xd376bfb6a5469c6a
	.xword	0x7657b357ec384ff1
	.xword	0x2c80e358d9fd0467
	.xword	0x0f02dec98b5f0b55
	.xword	0x37c250078928f56a
	.xword	0x32c41dffd277bb22
	.xword	0x0e97d4d151fa6928
	.xword	0x420dcad6ddff233f
	.xword	0xa90d3ba4b4917187
	.xword	0xa64e7f00e36b08b4
	.xword	0xad2048b65eeaab7a
	.xword	0xd63d6797be899c46
	.xword	0xb62b55251b2e7b17
	.xword	0x0b152ca1240df83a
	.xword	0x547db4940821b098
	.xword	0x43196c6cab4e7158
	.xword	0xe6bd68db881cf47a
	.xword	0x6eb770fba62260c8
	.xword	0xadecba6e13537a2b
	.xword	0xc8d3551e3dfabcb5
	.xword	0xd844e8efbb62b4a9
	.xword	0x18b04d29db02a19a
	.xword	0x515af439caf46705
	.xword	0xafba0e39ea5e46c1
	.xword	0x0e4d065ca4413863
	.xword	0x7af61ddd7ea5f836
	.xword	0xa12681c49e09576e
	.xword	0xc8776803472558ef
	.xword	0xb3bbf923df5bd4ee
	.xword	0xc9da5e35686550ab
	.xword	0xdd650896132e6ee3
	.xword	0x777885c28c5148c3
	.xword	0x9b8e7929657fe9ac
	.xword	0xc64544d0a2840adb
	.xword	0x63ce86fc71de6897
	.xword	0x68a9b6372d8cf24e
	.xword	0xb6ff5dd9be8ba3b2
	.xword	0xbd6ec5875d91afc9
	.xword	0x6d85fc9347171cc8
	.xword	0x89ccc71ae8edaf59
	.xword	0xeefa1dc65c14f915
	.xword	0xc9e7bce3f0a4f324
	.xword	0x8179f1caca5c4d40
	.xword	0xf6d265baf8730a16
	.xword	0xd7a07180a0b25b45
	.xword	0x22f44a85aa5106c9
	.xword	0xd050bd776573bda2
	.xword	0xafc4b4193f7db503
	.xword	0x9e04ea94741bf625
	.xword	0x82cc27b9e9b391f1
	.xword	0x9ced7e5202e69800
	.xword	0x4c457934f5992e71
	.xword	0x925d642d8e313fda
	.xword	0x05b8adb3e1077dce
	.xword	0x67dca8ee3af1f5e3
	.xword	0xef6c445cf0ca3100
	.xword	0x70461b0345ea8cd0
	.xword	0x2c22bc2517087127
	.xword	0x3472e4a6cb03071d
	.xword	0x2474c14dd39e3bc5
	.xword	0x6ed6e0571d99cc66
	.xword	0xa5d7190c346ceaa6
	.xword	0xb8d2f044ebe5d814
	.xword	0xa3bc614c2a41c794
	.xword	0x5ef29e1eed5e37a5
	.xword	0xc7f133b8cf47871f
	.xword	0xcc43c7c23c36c001
	.xword	0x8f5b9747ef44f225
	.xword	0x46a1f0e6abfce7a2
	.xword	0xba728bd1fac16fab
	.xword	0x2292361aa9407bf8
	.xword	0x97ac29401d751548
	.xword	0x843cca42aad5c6a2
	.xword	0x3b9f9a91a8626146
	.xword	0x27d9fff4e8286ad8
	.xword	0x21635546521d1798
	.xword	0xcc23c4307b958340
	.xword	0x4746c7937ea615f2
	.xword	0x6a275f0c434893f8
	.xword	0x673dcc8231874e1c
	.xword	0xb5783cbf0069dda9
	.xword	0xef249a822a88fe93
	.xword	0xca20511058bdc5c2
	.xword	0xadf7107468fb3205
	.xword	0xa4cd6f5646cc3b34
	.xword	0xaef3037869ff7a4c
	.xword	0x58d80697fd57a1b8
	.xword	0x952c6dfc5309ba48
	.xword	0x8081509aceeb8344
	.xword	0x58a19d42b67bde22
	.xword	0x016be74c49b2b9c6
	.xword	0x7448849b44327dcb
	.xword	0x18bd31b95fdd83f7
	.xword	0x943e58e2db73731b
	.xword	0x8b2c9f81bca8cec2
	.xword	0xb0aaa9697288fbbf
	.xword	0xb7e5e9ff7228841e
	.xword	0x6b48fe337995e4a6
	.xword	0x1adda8c1dde9fb71
	.xword	0x8f88b0270d4b1e08
	.xword	0xdf9e4456d251441b
	.xword	0x8197929845c87188
	.xword	0xa808329bdbfdc890
	.xword	0x094ad78980740837
	.xword	0x8668d966055ba411
	.xword	0xfc1584c9776fac0d
	.xword	0x9d9e4ca94a368230
	.xword	0x84169e5182750229
	.xword	0xf135a50419af48aa
	.xword	0x8bea482fc8a093eb
	.xword	0x29bed0928b2c717f
	.xword	0x70b973c6951c887c
	.xword	0xfcd737b9f91c316c
	.xword	0x4dcbb33bf2df1fc4
	.xword	0xd9cb2b4c504e2ef0
	.xword	0x42e94db223dd68a7
	.xword	0x0a5bcf0a3e49249c
	.xword	0xe272fbcd745f8bcf
	.xword	0x4c57666d883b13fb
	.xword	0xc30b6cf01c379771
	.xword	0xad04867fe7621859
	.xword	0x970f538bc1c784f8
	.xword	0xc8df0a0c97839095
	.xword	0x8ee9e67785c060ab
	.xword	0x5c74048ac0d0c665
	.xword	0x599d2537372f022d
	.xword	0x9c4d5da6873a0d63
	.xword	0x628d59b0b5583c80
	.xword	0x5a7bb8d0e50937ea
	.xword	0x2a9586ad048438a3
	.xword	0x2064fb023a610c7b
	.xword	0x030ce15abb9fb76a
	.xword	0xb2fb24e1b311e201
	.xword	0xd1a4bcb7984f01c3
	.xword	0xd812bac0974bb27d
	.xword	0xefb964dacc01c530
	.xword	0xbe4c9cfad1852901
	.xword	0x43f0601cca417495
	.xword	0x9145a3c413566bf5
	.xword	0x825c284bfbf3d2aa
	.xword	0xe05f905b3f3ad9f3
	.xword	0xe4276e697db816e9
	.xword	0xa8db361d414c9716
	.xword	0xb4597090257e78dd
	.xword	0x4b09a7ce28d0c72f
	.xword	0x75cac026aac82a52
	.align 0x20000
	.data
data_start_5:

	.xword	0x55d3d4d2f28f9ab4
	.xword	0x45312702f6b08548
	.xword	0x4d2abfce83742837
	.xword	0x4a562412f740ab74
	.xword	0xfca748ad288897c8
	.xword	0x5726e34d933b28b8
	.xword	0x17b048920a9b4922
	.xword	0x0dafc33787cd899e
	.xword	0xfeeff49619592d24
	.xword	0xf0517eb3cada8c3f
	.xword	0x981af4af75730e55
	.xword	0x470264af17aa4308
	.xword	0xef397aa27414ebec
	.xword	0x0db6d582b000036a
	.xword	0x96589f35880a906b
	.xword	0x1ad76c7ddccd7c87
	.xword	0x40821a10874053d6
	.xword	0x9c848123b6995862
	.xword	0xffca56296b36db0a
	.xword	0x3e67740f26572490
	.xword	0xbbab0635827eb89f
	.xword	0x1f3078222c33befd
	.xword	0xc79c97f87541f58f
	.xword	0x78ce1bfefaeb1737
	.xword	0x3a6863a3b4926023
	.xword	0x4681a6736878c879
	.xword	0x8375cbaa865f4ea1
	.xword	0xb397581d8259f78c
	.xword	0x5fa8aef65bc43f42
	.xword	0x66c71b5832e8b009
	.xword	0xf90f637a5b4ac52a
	.xword	0xc419613875b5094c
	.xword	0x8cc1fd7e315d2ac9
	.xword	0x01bd5d6d2fbf5e72
	.xword	0x6a058285fe8a30bc
	.xword	0x73702025f8094705
	.xword	0x72e0e93abf16ba81
	.xword	0x08992c2d4a498413
	.xword	0x4391389de555c821
	.xword	0x86c2519417053c69
	.xword	0x58f59948c93cc41a
	.xword	0x7764e1630da77cf4
	.xword	0x4ee6b7b7bae99909
	.xword	0x3f6c5c69f14ceafe
	.xword	0x8f9d2b8c456b41c4
	.xword	0x2108afc2240f2e83
	.xword	0x571cf4274b9594c1
	.xword	0x879bfd93ebfedff6
	.xword	0x7e62b11197ea43d2
	.xword	0x0cd110469f5a555d
	.xword	0x2662d0fb5698b977
	.xword	0x1c037163da930366
	.xword	0x6dd1f34a6f974678
	.xword	0x819fbe0dc160baff
	.xword	0x91b8f3d5ece723f3
	.xword	0x7ff9d939fb959301
	.xword	0xd7964de62f5f4573
	.xword	0xdf5935c837f8a127
	.xword	0xdfe1301f31684d8a
	.xword	0x56a0ac0905d9f5a3
	.xword	0x1edc852d3a50d6a2
	.xword	0xd214e65d38097e6e
	.xword	0x15f2fba4a381d201
	.xword	0xd3841a83c725828b
	.xword	0x430cadd97c5f3287
	.xword	0xec8284a1cc613a76
	.xword	0xa4069a920de663b5
	.xword	0x9ee0e912c5b667db
	.xword	0x1f18f4537fe17718
	.xword	0x62b0f385ed776cdb
	.xword	0xfd7bf58745b4cb3d
	.xword	0xb60e4c015d9875a9
	.xword	0x4164163bb5f6ca97
	.xword	0xf5e2d8f9f4286b83
	.xword	0xf42db7fea6c910d7
	.xword	0x8fc627ef196854ad
	.xword	0x651779617207255d
	.xword	0x3f79cc289f44f6d2
	.xword	0x465ff60ad867c3e3
	.xword	0xf3ff1627fe950709
	.xword	0xe3e3b9f0bcfc4787
	.xword	0x1e8b3daae980b179
	.xword	0xf3d6fe06c6c2aae4
	.xword	0x95db9c41c967af40
	.xword	0x4f1ea2e09fa8f2a6
	.xword	0xc8bda2ae23c76b7d
	.xword	0x0674e76c8e59b4ed
	.xword	0x70a572e6e2b36e0a
	.xword	0xbb228068492b32d8
	.xword	0x287244ac84e09d93
	.xword	0x3f36ded521d68772
	.xword	0x4f8976173c18f069
	.xword	0xb4f8f285eddd3710
	.xword	0xfbd67363385069a1
	.xword	0x93ecbbc5ace1711c
	.xword	0x7d6be3f3f85aa9e8
	.xword	0x4ca0312e1d0b0438
	.xword	0x26430668340a7297
	.xword	0x168ec0e1116ebd09
	.xword	0x0127f7e06d50d81f
	.xword	0x0ae87e5ff43e1a8b
	.xword	0x60b8ab69d5f0e198
	.xword	0x1e6f826687b81d4c
	.xword	0x44058ad1012d4f38
	.xword	0x10b2f7e0aea53f43
	.xword	0xec39872aa0a26388
	.xword	0x2061c5e36726ad19
	.xword	0xa202a9f35e2f6c8f
	.xword	0xf3113e0054feb220
	.xword	0xd8cc2463ca9d0456
	.xword	0xbdb30fbbacb92006
	.xword	0xa741bac68840853d
	.xword	0xe4f913b7bb0b8cd9
	.xword	0x45c7841528291fc7
	.xword	0x7b8874e84e0cd4dd
	.xword	0x912447359c7033ec
	.xword	0x2f121e380a575b92
	.xword	0x4040df0652fa4c55
	.xword	0xba46c64eb7b401cd
	.xword	0xb27b5f60b7861959
	.xword	0xbebfc0ec9bc51bb3
	.xword	0xf9dc05f651296356
	.xword	0x9c998d7a56c03825
	.xword	0xefcaa468d1c206ef
	.xword	0x2bdfb3cf3e2dde21
	.xword	0xd3d95cd9db0454c0
	.xword	0x2538f9f5b9a92363
	.xword	0x7240846d65c03fe1
	.xword	0x0ae6b66229a514e2
	.xword	0xb8d671f57e57216d
	.xword	0x9d0d9a95355813ee
	.xword	0x9a31927273527163
	.xword	0x8611bf85daef0498
	.xword	0x94e16d79ee01c3df
	.xword	0xa7dad7830e9b0198
	.xword	0xfa664aaff8e0b19a
	.xword	0x09c32b54150e99d2
	.xword	0x08640cf00a8376b5
	.xword	0xb80b6400b97e929d
	.xword	0x123760fbc1e8e0e1
	.xword	0x414b3570d046335d
	.xword	0x9128ec8ddb07fa9a
	.xword	0x626eac1d91ef4b2c
	.xword	0x92f10e52e620443a
	.xword	0x0ddaa6bccf8daf6c
	.xword	0xc67962b94c3ab641
	.xword	0x2109a0f9570beb75
	.xword	0xf774d11c9bc9367c
	.xword	0xd87935be17acbd07
	.xword	0x81716d2388ce8f6c
	.xword	0x46889f4e1ab78bc4
	.xword	0x832c582047aac0ae
	.xword	0x6386e0066143c012
	.xword	0xf9fbb934153b2d09
	.xword	0xa56b0ba7e0f66a3d
	.xword	0xcc7869b4912031b0
	.xword	0x6bb6accbb33a75c3
	.xword	0x93ac41f2cbc64d12
	.xword	0xe1d9f6d125aaacbc
	.xword	0x4c71bfdfb8b23699
	.xword	0x5b7c3eaed221c216
	.xword	0xd84423048b512f92
	.xword	0x2418b4fcf597099f
	.xword	0x70be20477e91c14b
	.xword	0x5703431cb4d364e8
	.xword	0xcc3446fda0ef56c7
	.xword	0xd4915988a7f92a86
	.xword	0x306480ff4d1549d4
	.xword	0x8ec54159a4ed6a9f
	.xword	0xfe5b916ad2c7f20e
	.xword	0xd9265fb05a046d12
	.xword	0x4b0694d0572b33d5
	.xword	0x7bdbd782af619ae8
	.xword	0x30f05218051e052c
	.xword	0xa81c9a6fe19bceb9
	.xword	0x5f07bf9f347674d9
	.xword	0xd0936363fd8ed047
	.xword	0xdc7e0779dc5c01d1
	.xword	0x209efc7008e80080
	.xword	0xf0bcefc8b7fe5a8d
	.xword	0x4fea21dcc19f68a9
	.xword	0x0c9825a2ea7cfd53
	.xword	0x86bd23a651d5a05b
	.xword	0x77afc35b760d81aa
	.xword	0x7eada31dd8973e6f
	.xword	0xb617d345fe07c3fd
	.xword	0x41331a1c275d2a40
	.xword	0xf779036ded1af6a3
	.xword	0x0038f8a656437c82
	.xword	0x19641a9d7a239451
	.xword	0x5b6b599b6eafbd88
	.xword	0x65966a958b623c28
	.xword	0xe4e835e21e7fa2e3
	.xword	0x3364c6306a2e1c0d
	.xword	0xccae5bc775c79096
	.xword	0x0723001800bf0465
	.xword	0x1e0ef5a8ceac6351
	.xword	0xe02bd123ab4858d4
	.xword	0x0c2c50122e8ecc1b
	.xword	0xc1e0225b587fe0c6
	.xword	0x94d3f5cd43b26f53
	.xword	0x92159840511e3050
	.xword	0xdd539326d46ebeb0
	.xword	0x5fa5ed571873795d
	.xword	0x62c362bc960d0e45
	.xword	0x95e74f62737646cf
	.xword	0x138d60457975a4ca
	.xword	0x85fbcb7c874d34a2
	.xword	0x120b1dcbd4aa528d
	.xword	0xae5dfc454d61cf04
	.xword	0x3abbf521ec7eba16
	.xword	0x642493dae8d7a32a
	.xword	0x3700a7f1611bacd7
	.xword	0x5ff8c991d6eb7e96
	.xword	0xb5ca50f9bf935eec
	.xword	0x4034b31c794f3035
	.xword	0x35a6989221d8ee30
	.xword	0x8c05c7f1e75bce17
	.xword	0x1d53695b40bece7f
	.xword	0xdf38a54cba49a798
	.xword	0x000d5c68a4d935dd
	.xword	0x23b498edc0ca98e0
	.xword	0x85bc766200cfa637
	.xword	0xb4ac45a08cab2907
	.xword	0x95b2f370623f66de
	.xword	0x09f09e12d86592f6
	.xword	0xec4fca022c8cc780
	.xword	0x6a8d9636ad6a53e6
	.xword	0x812933ac6b5b0429
	.xword	0x4a494fc1eccf1be8
	.xword	0xa86bd66c294b220c
	.xword	0x73271c958030d92f
	.xword	0xf05f4c2055d3a45b
	.xword	0x181e71907312eb6e
	.xword	0x0e881e14fcef5641
	.xword	0xb3e76cea6b901f47
	.xword	0x44f4424d1ce02b52
	.xword	0xb5d02d003cbf742a
	.xword	0xb26099f8133c299f
	.xword	0xb987ebd633427ed7
	.xword	0xb4308b12633298ab
	.xword	0xb9310bee23abeae5
	.xword	0xad897754a44fd27f
	.xword	0x8faf631df38827e5
	.xword	0xfbacf1a016bd45a2
	.xword	0xbfc81713086b4f35
	.xword	0x29eb527c5fada0bb
	.xword	0x5cd9b5e4677eb7f6
	.xword	0x95a32526d411f081
	.xword	0xfb913ceeefff39b8
	.xword	0x8cc5ba6fd213c2e8
	.xword	0x4b7e07571e6f2c5c
	.xword	0x6ab670f32475b003
	.xword	0x2caea19194e72ce8
	.xword	0xcdc1ff8465acc095
	.xword	0x9c08c7d3847df8d4
	.align 0x40000
	.data
data_start_6:

	.xword	0x2e6da95ed7b2bc30
	.xword	0xecaabd005b9cb6c0
	.xword	0x09a774e27807b674
	.xword	0x27c2664968341ab4
	.xword	0x58b8ed624e2e4022
	.xword	0x8c03ebfb75695761
	.xword	0x0f0bb739432da0f0
	.xword	0xab8c9d005ce60b27
	.xword	0x8d465de176bfb609
	.xword	0x71522f514683ff3c
	.xword	0x5317e022a11654a7
	.xword	0x0bb9448a7b1eb3a6
	.xword	0xbf87626d04d365fd
	.xword	0xbfc349637f98fcd5
	.xword	0xff187e8e7cbe2cd6
	.xword	0xc46abeac85f9b4b3
	.xword	0xa06d767bc96eb46a
	.xword	0x07ca8c7ada9dd1ee
	.xword	0xb3bd1ca47313846c
	.xword	0xde54f5b6fe3a3348
	.xword	0x4a28e0f4c31bcb8e
	.xword	0x36bfbf2288ae1858
	.xword	0xdf204e804d0e501e
	.xword	0x849a470b47707650
	.xword	0xe7ae7d090f4630ad
	.xword	0x41da7d849f5ab1e8
	.xword	0xa2d4f2316299a483
	.xword	0xde925b4564012547
	.xword	0x30f6f429890a3c79
	.xword	0xd20219618cd8d559
	.xword	0xc46ed2fad35fd55c
	.xword	0xc8acb21b291f8614
	.xword	0x6c73505f6da43328
	.xword	0x0b0e8c0c0997b574
	.xword	0x1f16f64c055abfe3
	.xword	0xdb42904e9696db65
	.xword	0xb80cb0d24e49edb2
	.xword	0x42d5fbb5f18cd727
	.xword	0xc4641b2d958c0154
	.xword	0x220208005007f8de
	.xword	0xc36a463e31b4ccaf
	.xword	0x6ccaea567be359cd
	.xword	0x2bf4072259d64123
	.xword	0xc30d032259acb060
	.xword	0xb3bd10afdc16dc60
	.xword	0x4f5f90ce44f897b5
	.xword	0xf541ae9e572330e2
	.xword	0xc0b46c849b9774c4
	.xword	0xacf1b79a225be5d2
	.xword	0x3178cd4c0834ea52
	.xword	0x11e3183047722c98
	.xword	0x6a7e7ab87572c1c8
	.xword	0x8cbf2f12840e4ec0
	.xword	0x5a35f76324e7d3ef
	.xword	0x727acb8f05ebc76d
	.xword	0xc0acc81fb5f05f13
	.xword	0xa3fec23ccdf2f711
	.xword	0x71785cb7ae34a969
	.xword	0xc313625e6b6de08e
	.xword	0x724187ac5e5596ae
	.xword	0xdf99f3c353ef2064
	.xword	0x57389ee1b60285ad
	.xword	0x2d3c89a60b1fc3f5
	.xword	0xbd9f148657364c6f
	.xword	0x87c43db488143ab6
	.xword	0xbb0d392c28a72c80
	.xword	0x72dc40b50ec2ab54
	.xword	0xcc0f4813c393ea96
	.xword	0x633d56d82e7dfb0c
	.xword	0x00b3af5ab518f107
	.xword	0x40e0098c3b583c16
	.xword	0x0543a908a3351d95
	.xword	0x4b72231ea91336f0
	.xword	0x2004d29686d6c686
	.xword	0x560895d6e5a6ab1e
	.xword	0x74f72503a0caec2b
	.xword	0xd467edb7c3e412eb
	.xword	0xe7a0d72c72a53119
	.xword	0x4d10338d85b1d202
	.xword	0xbd1f81e4f202252e
	.xword	0x5f950bc236dcc572
	.xword	0x57283036b96efb35
	.xword	0xf0f16e9102f90618
	.xword	0x783175b4cf694e3a
	.xword	0x2d46a779baf2eedd
	.xword	0x9b6085313abf2454
	.xword	0xa9456f1b832665f8
	.xword	0x4eef9d60f3847a78
	.xword	0x9f0fb67e2c71ae2d
	.xword	0x2d4119198a151a6b
	.xword	0xd014fc0d0f4cee16
	.xword	0xd227394b4c98ffa4
	.xword	0x861c13c5b28c623c
	.xword	0xebcee43a528649de
	.xword	0xf4f8c9097dbff91a
	.xword	0xfb9d6b6ce99dba21
	.xword	0x69e42e756b94104c
	.xword	0xd828255121eeb9d4
	.xword	0x0aaa02c8ad09343c
	.xword	0x118696de1104c5cc
	.xword	0xb5e8f9ddbad285fe
	.xword	0x33f448bf147d7dfa
	.xword	0x21b152f4bb91389f
	.xword	0xfd92a212050de67f
	.xword	0x97e564b5cb822250
	.xword	0x07f3dfe80079175f
	.xword	0x3b9f263cc8116a37
	.xword	0x4197605902cab409
	.xword	0xd5558492e4b52001
	.xword	0xe4d2c17c1447d50c
	.xword	0x96ce3495b8709e23
	.xword	0x033e1aed7383a395
	.xword	0xe7b7b23440fdf892
	.xword	0x558aa33e6030a808
	.xword	0xa9680ce7f0f156a2
	.xword	0x10effe8c0d1a522c
	.xword	0xa6332a5ce9db75d6
	.xword	0xa6de965abfd87fe4
	.xword	0xac4acdd1fd0578dd
	.xword	0x94782f548332d146
	.xword	0xcc3517813f5f8189
	.xword	0x94343fd03f4f9838
	.xword	0x8b4a90085e612572
	.xword	0x01466e3c515ce3ca
	.xword	0x5fc89dd61d9f0ad6
	.xword	0x6a85def97559ad4b
	.xword	0xee8c5a3c2d299fa7
	.xword	0x8c0b76f0b442abcb
	.xword	0xfea942ca082aae86
	.xword	0xa8421810f485e28a
	.xword	0xc258d7a9c12e5f42
	.xword	0x6c9bcbd727366c66
	.xword	0x0a0c952a11d5d131
	.xword	0x478a576ddcb0f2ea
	.xword	0x3a2468c140e89c69
	.xword	0x99845ad9d330a370
	.xword	0xef45bd7f6c5674d3
	.xword	0x3e6afef6cb84002c
	.xword	0xf64ecb179faeb956
	.xword	0xe5aff8bfab4b5383
	.xword	0x9130ea2852204a66
	.xword	0xb104d29caa950e81
	.xword	0x93994f07151a18c9
	.xword	0x31dde638d3e82eb3
	.xword	0xd866b1cbf605d9d4
	.xword	0xe287808ee1dcdb97
	.xword	0x0b7e52b4a617b2eb
	.xword	0x24118e55955a8080
	.xword	0xd8a1e9553d2ce5a1
	.xword	0xc0c8af4c0f00360a
	.xword	0xe3e09df1f046e73d
	.xword	0x347d3482cd6436a6
	.xword	0xae5a472fac8e8412
	.xword	0xecd39954853f10f4
	.xword	0x20462b435c50a946
	.xword	0x747ee9ed2cb2738d
	.xword	0x36537b7e2aa038ce
	.xword	0xb282330daf27c662
	.xword	0xe22bcdafa4e0e33d
	.xword	0x840ff69c85e791eb
	.xword	0xe3e0a1457c8edfc6
	.xword	0x4aee2c3fe25bb2c5
	.xword	0x7ec31b735dd8e73f
	.xword	0x37122c33f4851dad
	.xword	0x730dbf36f143f1fd
	.xword	0x1538a09169c2b3cb
	.xword	0x7f3584eb6b5e8069
	.xword	0x0accb1e36e6f444b
	.xword	0x52f530bee2c5ce7b
	.xword	0x399668dfcbef279e
	.xword	0xad653f42c6918887
	.xword	0x78b805d80d655a6b
	.xword	0x049b070c5cdd935d
	.xword	0x6c287a238709fc41
	.xword	0xbe8f432d93d4a57e
	.xword	0xd4fca7fba99e12d4
	.xword	0xafcae534df5b6be4
	.xword	0xdc440092fd7cc3f4
	.xword	0xa6a7954d4153f05b
	.xword	0x660164a2759360f6
	.xword	0x625d5c79df55822b
	.xword	0xf199bb5323f821e4
	.xword	0x6860344b431afeb3
	.xword	0x8a599e881784f763
	.xword	0xe34da24c554471c0
	.xword	0xeb0a80210d82debb
	.xword	0xd1b2d3f08e8464ca
	.xword	0xeceb1339415d6541
	.xword	0x26e7f2769e4e4b76
	.xword	0x668eced4f9ea06b6
	.xword	0x396784047f3d9fb3
	.xword	0x4dcc13985454a617
	.xword	0x0381e97f06ab1c49
	.xword	0x1cf5f605e2f6207d
	.xword	0x4b505190cf3f46eb
	.xword	0xab8d6f3f29e4194a
	.xword	0xc8b222aecbece0d4
	.xword	0xc4051fbf69ed3f00
	.xword	0x6976bfff461e5395
	.xword	0xf662e242aafbc8a9
	.xword	0x3dc3cddf432ce7ae
	.xword	0x83dbc3f9ebae22ff
	.xword	0x844d783bed9ab4ac
	.xword	0xd350d3cbea0241ed
	.xword	0x102277f5717a2ad9
	.xword	0xc75ae1a04c962ce1
	.xword	0x35d94189edbd083b
	.xword	0x744877ffddb564fd
	.xword	0x55dcbe5e3ea796ce
	.xword	0xccc31a8fb14cc7cb
	.xword	0x583f237fe87d77a4
	.xword	0x517f57903c2abccb
	.xword	0x0aa43be8443313c2
	.xword	0x25b1370b23bfe827
	.xword	0x1eeceffd693bb95e
	.xword	0xe6d76628ba622c97
	.xword	0x32d3509ff19bff66
	.xword	0x507d802be0292e41
	.xword	0x01af9b9dc68de711
	.xword	0xa6b614c521101238
	.xword	0x9294982dab96f6af
	.xword	0xcc79f2f6d6616be6
	.xword	0xb83e570179866e4c
	.xword	0x3145272c4945960f
	.xword	0x66d7faa2e8b6fb1d
	.xword	0x1bd58d0e650d37e0
	.xword	0xb1e3287834060133
	.xword	0xaa03851b9e389697
	.xword	0x91c1de27c6d6e99f
	.xword	0x3a28825d833f5c84
	.xword	0xd9c465f504125f62
	.xword	0x508d08375c4a4ebc
	.xword	0x576c026a1bc48a28
	.xword	0x2d4c6d9db963f0e5
	.xword	0xcab23404209ed36c
	.xword	0x9924120dc47d87f8
	.xword	0x076b40d3e8292866
	.xword	0x2ddf43323f8e9073
	.xword	0x3510c0cb226c4eb0
	.xword	0x2abd4e0812a58c4e
	.xword	0x6574793fb981dae3
	.xword	0x816b97bb43a6b2ee
	.xword	0x5fbc5ea93d50053f
	.xword	0xbd352c2308539ee9
	.xword	0x3fb5bff43340dbe0
	.xword	0xab2490586924c48a
	.xword	0x26e8cba09e972cb5
	.xword	0x500c442031cb9695
	.xword	0x018207acc3044d17
	.xword	0xee64e638604c1360
	.xword	0xb3f9414fa45b1ea9
	.xword	0x4d8d04174d971f5e
	.xword	0xb6744b782ee8c74b
	.xword	0x92712c061014a700
	.xword	0x8838321528076604
	.xword	0x982ae9f2af18489b
	.align 0x80000
	.data
data_start_7:

	.xword	0x8d35baa933f40481
	.xword	0xfc438af70869f725
	.xword	0x421a5a372e7e6004
	.xword	0x70438c77afef1f03
	.xword	0xd8cc226730eb362b
	.xword	0x3ede7228840ff4bd
	.xword	0x0b5a6755ac594e37
	.xword	0x56093af9b611c55b
	.xword	0xbe80c84c80d4a015
	.xword	0x78fbadd0e873bc40
	.xword	0x65ffb5ccec17f0de
	.xword	0xf2bc429fb3350c1b
	.xword	0xe9f665cd9580e7fd
	.xword	0xe6008f06fe508b1b
	.xword	0xd4e415de022f96ae
	.xword	0x490253c9921c8034
	.xword	0x8a982e70416addea
	.xword	0x18e61d7cc4f55af3
	.xword	0xf22b3d4b27d6c7dc
	.xword	0x2a356f28a61f9c91
	.xword	0x3f1358a4a4014c79
	.xword	0x227c55bdde82d1fe
	.xword	0xf5204ad2b4d15d2c
	.xword	0x4afae4bf7879220e
	.xword	0xf05160ba4f5eb6dd
	.xword	0xc284c36a16564080
	.xword	0xb78a0d2f5c79065a
	.xword	0x286089a37870a688
	.xword	0x89f53e6950e82161
	.xword	0x58f0a1f702e5c91a
	.xword	0xaefb5faff51707fc
	.xword	0x7c2f486d318b9d10
	.xword	0x1e9691aa44fc0215
	.xword	0xc456d8b95b2053d7
	.xword	0x5140b79c866c2b5a
	.xword	0x1b2fd5cfdfe60dc7
	.xword	0x6eb58c423b628363
	.xword	0x1dd06e04e123011c
	.xword	0x0ae69d88069e1840
	.xword	0x381c8c7b12451955
	.xword	0xfa59a12a1d2d1d69
	.xword	0x084e198f7995c0a8
	.xword	0x8b9e99d93702dcbe
	.xword	0x26d26516e647781c
	.xword	0xf68976ae9c184455
	.xword	0xcf6fcfdc678ae4b5
	.xword	0x1f56f5d0b46ff2cd
	.xword	0x094dd176ce14efe1
	.xword	0x4a45dd45bf48b055
	.xword	0x0e3033d415a85a5c
	.xword	0x064ea368871d5324
	.xword	0x40694495a2cd7698
	.xword	0xb8e613773268529b
	.xword	0x39c213203c2dada8
	.xword	0x45335039b050cb17
	.xword	0x1bbf4af075ad2b89
	.xword	0xffe86182019c5d42
	.xword	0x63ddfb908f3bcb93
	.xword	0x07a2bf2269e036f8
	.xword	0xd1bcaf6b46f572f9
	.xword	0xb1f8aef5a78e3d8b
	.xword	0xf18cccf489381386
	.xword	0xaed25dfe3d82b5a2
	.xword	0xa391e24418614239
	.xword	0x4390661b8b1ec715
	.xword	0x0a6183d3e2e79af4
	.xword	0x02fd49f4299897fd
	.xword	0x59e91f430db25340
	.xword	0xf62ae4fb88bc789d
	.xword	0xffb0d30686d89bcd
	.xword	0xead6eec86d873672
	.xword	0x31b4bebb314dfafe
	.xword	0x5b8c02bf07d9b4fa
	.xword	0x037e3d85b9ce62ed
	.xword	0xff0ba3c286829718
	.xword	0x15f48d1d54a6c19a
	.xword	0xde69d946b7f02ac0
	.xword	0x57ca27a198224603
	.xword	0x04d8ef7590980e2f
	.xword	0xefb798af0f5ad5b5
	.xword	0x0a983c6ef902adf0
	.xword	0x325da0537d9073a6
	.xword	0xdcb05ff4bbe92b2a
	.xword	0xb68af9d4cde4fc31
	.xword	0xb5e54b4ab52fce24
	.xword	0x0a9f127e748f10b8
	.xword	0x8ee655ebc12c39ff
	.xword	0x3e50473af608c4f5
	.xword	0x0cb6d53f99399828
	.xword	0x876b0cbadf3dab73
	.xword	0xafdfab2ef3058a29
	.xword	0x5aa4bb16657fb1f3
	.xword	0xbd75d0a71a837afc
	.xword	0x43eb41c05467e06e
	.xword	0x7243ea0655f5e9f6
	.xword	0xd25594e8e5510535
	.xword	0xda37da3edad291f9
	.xword	0x33ad6e4e1346fba8
	.xword	0x641c274e2071a209
	.xword	0x38f7ea9a4b3ed605
	.xword	0xe95f790e95c0f0e6
	.xword	0x6069f70d532c2a18
	.xword	0xde7a12b2c1c33292
	.xword	0x1d8fdea3dbc3a85b
	.xword	0x3c6d4c6719f4356a
	.xword	0x682c1d1b407e0279
	.xword	0x9f2d3356576829f1
	.xword	0x8b0e2f5ffb743787
	.xword	0x94f7f020668290a1
	.xword	0x720753ba1e4df39d
	.xword	0xbb6691d261e271f1
	.xword	0xe059e961ee63eb98
	.xword	0x36678f5f7cb6310b
	.xword	0xa3297683328c24c7
	.xword	0x1396de86c402a4c6
	.xword	0x130405bbffe0e681
	.xword	0x6409b28b86ae9af1
	.xword	0x9809bd3dbb273572
	.xword	0x4f04b4c097167666
	.xword	0x3f7e85db3542584b
	.xword	0xb602b9b8918b01c5
	.xword	0x98188b0701dde618
	.xword	0xa6f8b6bae1ee2c0f
	.xword	0x832464411c133465
	.xword	0x86bdb89b142dd6ef
	.xword	0x19dd77ed59d35791
	.xword	0xc327fc404cb5d675
	.xword	0x5bcf270c0db2fb49
	.xword	0x5e5813bb8772fdfb
	.xword	0x22314900d45c3f0a
	.xword	0xc016ec2112ceb750
	.xword	0x72fb7fd073b51d67
	.xword	0xc59d5dd63318aaef
	.xword	0x59dd07c9e211a94b
	.xword	0xfee7b75983265cf2
	.xword	0xf6c91284ed84f33d
	.xword	0x5789bf8cef5680e9
	.xword	0x1036b501d46bf5f1
	.xword	0xb56c370df1501ff6
	.xword	0x81a24b99f31df709
	.xword	0x0e08d5b4301002dc
	.xword	0x5459a0447309f186
	.xword	0x70019e44d7249842
	.xword	0x486fd96ba47f97db
	.xword	0x97401d699e81dab0
	.xword	0x9a71178d09b64a09
	.xword	0xd0ea575a68309b9d
	.xword	0x3133a6c25afbfee5
	.xword	0x5cb5b1677e30e8bd
	.xword	0xb56e8a6bddb0e63b
	.xword	0x0d76d0166e7ef1cc
	.xword	0xc0e3990c9c6d5dd7
	.xword	0x2240c3aad7447fa4
	.xword	0xbfc3b6cad63b8ffa
	.xword	0x5c80080014e570c8
	.xword	0xa96510a59b2a5562
	.xword	0x4a65cd9284af9dc5
	.xword	0xc21b0eb5b339bee5
	.xword	0x632e49dc58bc29f7
	.xword	0x60d2b76bf0e61db0
	.xword	0x37ca0e01abf50f72
	.xword	0xe9aba8526bd83b66
	.xword	0x4048f193593cc473
	.xword	0x75831c2a651b5403
	.xword	0xed59edef39e0916e
	.xword	0x20ad2c8ef93f3676
	.xword	0xb23d57972905c9b9
	.xword	0xfd5eac0c31899776
	.xword	0x69746f158778e679
	.xword	0x8a5b1f3273220f60
	.xword	0x80c44530d08b357a
	.xword	0xd62b2ac4cbfcfebe
	.xword	0x525975dac8224895
	.xword	0x5f49cc3b9d228629
	.xword	0x76a150f4b057800b
	.xword	0xe627d1095f173f4a
	.xword	0x20fef6f692c37f71
	.xword	0x97a0b2f47fdf0fc6
	.xword	0x9c855c7bfbb5c8cb
	.xword	0xba4915b757ab0bca
	.xword	0xb821eaa579bf205c
	.xword	0xff8866f26ec92dbf
	.xword	0x782528710d36da1b
	.xword	0x0c1ce12545db582f
	.xword	0x5f430b73ed51d6bb
	.xword	0x467b0301cbc6554d
	.xword	0x15017129c01ab5f4
	.xword	0x16eec7d84da664dd
	.xword	0xae2e77cbecc94477
	.xword	0x2c55ce96e9ba461c
	.xword	0x35e72cb202ada942
	.xword	0x65f6111d7d8ce2ef
	.xword	0xa6fab2a1903b11d9
	.xword	0x1a930ba3307236f8
	.xword	0x584a8b794c277cb2
	.xword	0xb4e5efd2216a926b
	.xword	0x01f1833ca7982399
	.xword	0x4610c5b7ac650e68
	.xword	0xa085522e97fca0b2
	.xword	0x8dc8c94a8c118443
	.xword	0x2bda4c8bf19411b1
	.xword	0xe244cb6d51ad6eae
	.xword	0xcae58b5b78928a9d
	.xword	0x84bde8938b380aad
	.xword	0xce14f2f518c68c41
	.xword	0x22d3ba22e8d0965c
	.xword	0x9e7063ccbd86b18f
	.xword	0xd8a5388f590e195c
	.xword	0xf6624160abdbea2e
	.xword	0xbbdede4066a7d506
	.xword	0x031fee16c6cdb13d
	.xword	0xa066be6b833fe0cb
	.xword	0x5751948d6f0e52cf
	.xword	0xe666fde0c63148c9
	.xword	0x50314e9ba1685907
	.xword	0xa18da31df008e42d
	.xword	0x53f9bec101a5a789
	.xword	0x67404404b49f5575
	.xword	0x91bcc19d24b6c59a
	.xword	0xb50298b5f31d993a
	.xword	0xff6a6d264a4a7853
	.xword	0xd4598eb818a2f883
	.xword	0x69ea6299c81c4260
	.xword	0x95abe47ea62d815d
	.xword	0x78dc304b6a15b112
	.xword	0x3a51ee699c5f8f04
	.xword	0x71c6195263bb7d7a
	.xword	0x0a747670658f408e
	.xword	0xe393983eab056969
	.xword	0xfdbfed3513cac985
	.xword	0xf95264f4f07ae3e5
	.xword	0xbcb4eadf4c22daab
	.xword	0x5e758e737d991d25
	.xword	0x7291fa76c3db8e73
	.xword	0xd6f04534a2b5788e
	.xword	0xf1f10a9cd485c649
	.xword	0xb6fe87fe5c7a64f9
	.xword	0xa77968d44ea4a565
	.xword	0x9ca88ae6f6f5bfe0
	.xword	0xadb17b1db44b67f5
	.xword	0xf1aa3ffa180f1d85
	.xword	0x8afb55f46eb73689
	.xword	0x509fcae5a08ca071
	.xword	0x60023b8e0cbaaad4
	.xword	0x2c9f1876308b40b0
	.xword	0xad9350c6be070e52
	.xword	0x94122ee3830c79f2
	.xword	0x090c96dfe6a67906
	.xword	0x19da1680096b1119
	.xword	0xbb2e43ec5303e843
	.xword	0xa6be7b1fe5413b8a
	.xword	0x8403ada4ca61e946
	.xword	0x83d2e8c0f26210b6
	.xword	0x488973a3d8b4aa0e
	.xword	0x3142f3ec3208c496
	.xword	0x3e69de506d62d921



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
